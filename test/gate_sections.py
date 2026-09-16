"""Gate: no description or README carries the sections the reviewer asked to remove.

Checks both the nuspec description and the README it is generated from, so a README that
regrows a section is caught before the next sync copies it into the description.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BANNED = re.compile(r"^##\s+(Install|Upgrade|Uninstall|Links|License)\s*$", re.M)

hits = []
files = sorted(glob.glob(os.path.join(ROOT, "automatic", "*", "*.nuspec")))
for f in files:
    pid = os.path.basename(os.path.dirname(f))
    text = open(f, encoding="utf-8-sig").read()
    body = re.search(r"<description><!\[CDATA\[(.*?)\]\]></description>", text, re.S)
    if body and BANNED.search(body.group(1)):
        hits.append((pid, "nuspec"))
    readme = os.path.join(os.path.dirname(f), "README.md")
    if os.path.exists(readme) and BANNED.search(open(readme, encoding="utf-8-sig").read()):
        hits.append((pid, "README"))

if not files:
    print("NO_NUSPECS_FOUND")
    sys.exit(1)
if hits:
    print(f"FOUND {len(hits)}: {hits[:8]}")
    sys.exit(1)

print(f"SECTIONS_OK {len(files)}")
