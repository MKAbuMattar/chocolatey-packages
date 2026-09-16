"""Gate: the reviewed packages reached the community repository.

Two independent claims, because a local log only proves the client thought it succeeded:

  1. deterministic  the push log records 21 successes and no failures
  2. inspection     each package page on community.chocolatey.org serves that exact
                    version, fetched live

Usage: python test/gate_pushed.py <push.log>
"""
import re
import sys
import time
import urllib.error
import urllib.request

REVIEWED = {
    "vaults3": "4.4.75", "cc-switch": "3.20.2", "open-pdf-studio": "2.0.1",
    "rescript-editor": "1.1.13", "omniget": "0.9.1", "openhuman": "0.63.12",
    "ouroboros": "0.54.4", "rtk": "0.49.0", "meetily": "0.4.1", "nodeterm": "0.3.5",
    "patent": "0.14.0", "agent-orchestrator": "0.13.0", "impeccable": "0.1.5",
    "lean-ctx": "3.10.1", "pilotdeck": "2026.9.14", "mesheryctl": "1.0.70",
    "flet": "1.0.0", "nub": "0.9.2", "openresearch": "0.2.1",
    "genoffice": "0.10.488", "open-interpreter": "0.0.43",
}
UA = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/131.0"}

log = open(sys.argv[1], encoding="utf-8", errors="replace").read()
pushed = len(re.findall(r"was pushed successfully", log))
failed = re.search(r"::error::failed:", log)

problems = []
if pushed != len(REVIEWED):
    problems.append(f"log records {pushed} pushes, expected {len(REVIEWED)}")
if failed:
    problems.append("log records a failure")

live = 0
for pid, ver in REVIEWED.items():
    url = f"https://community.chocolatey.org/packages/{pid}/{ver}"
    ok = False
    for attempt in range(3):
        try:
            urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=45).read()
            ok = True
            break
        except urllib.error.HTTPError as e:
            if e.code == 404:
                break
            time.sleep(3 * (attempt + 1))
        except Exception:
            time.sleep(2)
    if ok:
        live += 1
    else:
        problems.append(f"{pid} {ver} not served by the gallery")
    time.sleep(0.8)

if problems:
    for p in problems:
        print("FAIL", p)
    sys.exit(1)

print(f"PUSHED_OK {len(REVIEWED)} log={pushed} live={live}")
