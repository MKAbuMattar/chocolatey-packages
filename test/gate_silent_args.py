"""Which packages pass /S to an installer that does not read it?

NSIS reads /S. Inno Setup ignores it, shows its GUI, and the install sits there until
Chocolatey's timeout, which is how ms-coreutils burned 45 minutes of a CI run. The two
are told apart by PE section names in the first few KB of the file, so this reads a
small range of each download rather than the whole installer.
"""
import glob
import os
import re
import sys
import urllib.request
from concurrent.futures import ThreadPoolExecutor

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
UA = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/131.0",
      "Range": "bytes=0-16383"}

# .ndata is NSIS's own section. Inno is Delphi built and carries .itext and .didata.
MARKERS = [(b".ndata", "NSIS"), (b".itext", "Inno"), (b".didata", "Inno")]


def family(url):
    try:
        r = urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=60)
        head = r.read(16384)
    except Exception as e:
        return f"unreachable ({type(e).__name__})"
    if head[:2] != b"MZ":
        return "not a PE file"
    found = {label for marker, label in MARKERS if marker in head}
    if found == {"NSIS"}:
        return "NSIS"
    if found == {"Inno"}:
        return "Inno"
    if not found:
        return "unknown"
    return "+".join(sorted(found))


def check(item):
    pid, url = item
    return pid, url, family(url)


targets = []
for f in sorted(glob.glob(os.path.join(ROOT, "automatic", "*", "tools", "chocolateyInstall.ps1"))):
    pid = os.path.basename(os.path.dirname(os.path.dirname(f)))
    t = open(f, encoding="utf-8-sig").read()
    # Only the packages that hand /S to a downloaded exe are at risk.
    if not re.search(r"silentArgs\s*=\s*'(/S)'", t):
        continue
    m = re.search(r"url64\s*=\s*'([^']+)'", t) or re.search(r"url\s*=\s*'([^']+)'", t)
    if not m or not m.group(1).lower().endswith(".exe"):
        continue
    targets.append((pid, m.group(1)))

print(f"packages passing /S to a downloaded exe: {len(targets)}\n")
rows = []
with ThreadPoolExecutor(max_workers=8) as ex:
    for pid, url, fam in ex.map(check, targets):
        rows.append((fam, pid, url))

for fam in ("Inno", "unknown", "not a PE file", "NSIS"):
    group = [r for r in rows if r[0] == fam]
    if not group:
        continue
    print(f"--- {fam}: {len(group)}")
    for _, pid, url in sorted(group):
        print(f"    {pid:<22} {os.path.basename(url)}")
other = [r for r in rows if r[0] not in ("Inno", "unknown", "not a PE file", "NSIS")]
for fam, pid, url in other:
    print(f"--- {fam}: {pid}")

# Inno is the outright bug. Anything unrecognised is not proof of one, but it is not
# proof of correctness either, and /S is only safe once something says NSIS.
wrong = [r for r in rows if r[0] != "NSIS"]
if not rows:
    print("NO_PACKAGES_SCANNED")
    sys.exit(1)
if wrong:
    print(f"\n{len(wrong)} package(s) pass /S to an installer that may not read it")
    sys.exit(1)
print(f"\nSILENT_ARGS_OK {len(rows)}")
