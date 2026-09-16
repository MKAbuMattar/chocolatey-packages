"""Gate: every nuspec carries a non-empty <copyright> that is not licence prose.

Prints the token only after every assertion passes, and exits nonzero otherwise, so a
partial pass cannot look like a pass.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PROSE = re.compile(
    r"free software foundation|copyright (licen[sc]e|statement|owner|notice)|"
    r"derivative works|reproduce, prepare",
    re.I,
)

missing, prose = [], []
files = sorted(glob.glob(os.path.join(ROOT, "automatic", "*", "*.nuspec")))
for f in files:
    text = open(f, encoding="utf-8-sig").read()
    m = re.search(r"<copyright>(.*?)</copyright>", text, re.S)
    pid = os.path.basename(os.path.dirname(f))
    if not m or not m.group(1).strip():
        missing.append(pid)
    elif PROSE.search(m.group(1)):
        prose.append((pid, m.group(1).strip()))

if not files:
    print("NO_NUSPECS_FOUND")
    sys.exit(1)
if missing:
    print(f"MISSING {len(missing)}: {missing[:8]}")
if prose:
    print(f"LICENCE_PROSE {len(prose)}: {prose[:5]}")
if missing or prose:
    sys.exit(1)

print(f"COPYRIGHT_OK {len(files)}")
