"""Gate: every package in a local push run is explained by its state in the gallery.

A push of all packages is mostly refusals, which is expected rather than wrong: the
community repository lets a maintainer replace a version that is still in moderation
and refuses one that has been approved. That makes "72 failed" meaningless on its own,
so this re-derives each outcome from the gallery and fails only on a package whose
result does not match its published state.

Usage: python test/gate_push_accounting.py <republish-output-file>
"""
import glob
import os
import re
import sys
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
UA = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/131.0"}

# A version that moderation rejected keeps its number reserved, so a re-push is refused
# with 409 while the package shows at no version at all. Those need a bump, not a retry.
REJECTED = {"ever-gauzy": "111.0.11", "faceswap": "3.0.0"}


def fetch(url):
    for _ in range(3):
        try:
            return urllib.request.urlopen(
                urllib.request.Request(url, headers=UA), timeout=60
            ).read().decode("utf-8", "replace")
        except urllib.error.HTTPError as e:
            if e.code == 404:
                return ""
        except Exception:
            pass
    return None


def status(item):
    """The gallery status of one exact version, or 'absent'.

    FindPackagesById is the obvious call and the wrong one: it lists only versions the
    gallery shows publicly, so everything still in moderation reads as missing. Ask for
    the single version instead, which answers for a submitted version too.
    """
    pid, version = item
    body = fetch(
        "https://community.chocolatey.org/api/v2/Packages"
        f"(Id='{pid}',Version='{normalise(version)}')"
    )
    if body is None:
        return pid, None
    if not body:
        return pid, "absent"
    m = re.search(r"<d:PackageStatus[^>]*>([^<]*)<", body)
    return pid, (m.group(1) if m else "unknown")


def normalise(v):
    """NuGet drops a trailing zero segment, so 0.8-b1 and 0.8.0-b1 are one version."""
    core, _, pre = v.partition("-")
    parts = [p for p in core.split(".")]
    while len(parts) < 3:
        parts.append("0")
    while len(parts) > 3 and parts[-1] == "0":
        parts.pop()
    return ".".join(parts) + ("-" + pre if pre else "")


def main():
    if len(sys.argv) < 2:
        print("usage: gate_push_accounting.py <republish-output-file>")
        return 1
    text = open(sys.argv[1], encoding="utf-8", errors="replace").read()

    m_ok = re.search(r"^pushed: *(.*)$", text, re.M)
    m_no = re.search(r"^::error::failed: *(.*)$", text, re.M)
    pushed = {s.strip().split()[0] for s in m_ok.group(1).split(",") if s.strip()} if m_ok else set()
    failed = {s.strip() for s in m_no.group(1).split(",") if s.strip()} if m_no else set()

    local = {}
    for f in sorted(glob.glob(os.path.join(ROOT, "automatic", "*", "*.nuspec"))):
        pid = os.path.basename(os.path.dirname(f))
        body = open(f, encoding="utf-8-sig").read()
        local[pid] = re.search(r"<version>([^<]+)</version>", body).group(1)

    missing = set(local) - pushed - failed
    extra = (pushed | failed) - set(local)
    problems = [f"{p}: in no outcome list" for p in sorted(missing)]
    problems += [f"{p}: reported but not a package here" for p in sorted(extra)]

    with ThreadPoolExecutor(max_workers=8) as ex:
        found = dict(ex.map(status, sorted(local.items())))

    for pid in sorted(local):
        state = found[pid]
        if state is None:
            problems.append(f"{pid}: gallery unreachable")
            continue

        if pid in pushed:
            # An accepted re-push means the version was still open to moderation.
            if state != "Submitted":
                problems.append(f"{pid} {local[pid]}: pushed but gallery says {state}")
        else:
            if state in ("Approved", "Exempted"):
                continue
            # A rejected version keeps its number reserved: refused on push, absent here.
            if state == "absent" and REJECTED.get(pid) == local[pid]:
                continue
            problems.append(f"{pid} {local[pid]}: refused but gallery says {state}")

    if not local:
        print("NO_PACKAGES_FOUND")
        return 1
    if problems:
        for p in problems[:15]:
            print("FAIL", p)
        print(f"total problems: {len(problems)}")
        return 1

    print(f"PUSH_ACCOUNTED {len(local)} pushed={len(pushed)} refused={len(failed)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
