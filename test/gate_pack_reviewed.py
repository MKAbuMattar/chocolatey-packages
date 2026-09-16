"""Gate: the reviewed packages pack, and the packed nuspec carries the fixes.

Reads the nupkg choco produced rather than the source tree, because the source passing
says nothing about what actually ships. choco pack rewrites the nuspec on the way in.
"""
import os
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

REVIEWED = [
    # Reviewer asked for the install/upgrade/uninstall/links/license sections to go.
    "vaults3", "cc-switch", "open-pdf-studio", "rescript-editor", "omniget",
    "openhuman", "ouroboros", "rtk", "meetily", "nodeterm", "patent",
    "agent-orchestrator", "impeccable",
    # Reviewer asked for a <copyright>.
    "lean-ctx", "pilotdeck", "mesheryctl", "flet", "nub", "openresearch",
    "genoffice", "open-interpreter",
]

BANNED = re.compile(r"^##\s+(Install|Upgrade|Uninstall|Links|License)\s*$", re.M)

out = tempfile.mkdtemp(prefix="gate-pack-")
failures = []
try:
    for pid in REVIEWED:
        pkg = os.path.join(ROOT, "automatic", pid)
        if not os.path.isdir(pkg):
            failures.append(f"{pid}: not in the repo")
            continue
        p = subprocess.run(["choco", "pack", "--outputdirectory", out],
                           cwd=pkg, capture_output=True, text=True,
                           encoding="utf-8", errors="replace")
        if "Successfully created package" not in (p.stdout or ""):
            failures.append(f"{pid}: pack failed")
            continue
        made = [f for f in os.listdir(out) if f.startswith(pid + ".") and f.endswith(".nupkg")]
        if not made:
            failures.append(f"{pid}: no nupkg produced")
            continue
        with zipfile.ZipFile(os.path.join(out, made[0])) as z:
            name = next((n for n in z.namelist() if n.endswith(".nuspec")), None)
            if not name:
                failures.append(f"{pid}: nupkg has no nuspec")
                continue
            text = z.read(name).decode("utf-8-sig", "replace")
        cr = re.search(r"<copyright>(.*?)</copyright>", text, re.S)
        if not cr or not cr.group(1).strip():
            failures.append(f"{pid}: packed nuspec has no copyright")
        desc = re.search(r"<description>(.*?)</description>", text, re.S)
        if desc and BANNED.search(desc.group(1)):
            failures.append(f"{pid}: packed description still has a banned section")
finally:
    shutil.rmtree(out, ignore_errors=True)

if failures:
    for f in failures:
        print("FAIL", f)
    sys.exit(1)

print(f"PACK_OK {len(REVIEWED)}")
