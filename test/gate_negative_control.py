"""Negative control for the two absence gates.

An absence check that looks in the wrong place passes for the wrong reason, and a wrong
path is indistinguishable from real absence. This feeds each gate's own logic a known
positive and a known negative and asserts it reacts to both.
"""
import os
import re
import sys
import tempfile
import subprocess

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

GOOD_NUSPEC = """<?xml version="1.0"?>
<package><metadata>
<copyright>Copyright 2026 Someone Real</copyright>
<description><![CDATA[## What is x?

Text.
]]></description>
</metadata></package>"""

BAD_COPYRIGHT = GOOD_NUSPEC.replace(
    "<copyright>Copyright 2026 Someone Real</copyright>", "<copyright>   </copyright>")
PROSE_COPYRIGHT = GOOD_NUSPEC.replace(
    "Copyright 2026 Someone Real", "Copyright 2007 Free Software Foundation, Inc")
BAD_SECTIONS = GOOD_NUSPEC.replace("## What is x?", "## Install")


def run(gate, nuspec_text, readme_text="# t\n\n## What is x?\n"):
    with tempfile.TemporaryDirectory() as d:
        pkg = os.path.join(d, "automatic", "demo")
        os.makedirs(pkg)
        open(os.path.join(pkg, "demo.nuspec"), "w", encoding="utf-8").write(nuspec_text)
        open(os.path.join(pkg, "README.md"), "w", encoding="utf-8").write(readme_text)
        # The gate resolves its root from its own location, so run a copy inside the fixture.
        shim = os.path.join(d, "test")
        os.makedirs(shim)
        src = open(os.path.join(HERE, gate), encoding="utf-8").read()
        open(os.path.join(shim, gate), "w", encoding="utf-8").write(src)
        p = subprocess.run([sys.executable, os.path.join(shim, gate)],
                           capture_output=True, text=True)
        return p.returncode, (p.stdout + p.stderr)


checks = [
    ("gate_copyright.py", GOOD_NUSPEC, None, 0, "COPYRIGHT_OK"),
    ("gate_copyright.py", BAD_COPYRIGHT, None, 1, "MISSING"),
    ("gate_copyright.py", PROSE_COPYRIGHT, None, 1, "LICENCE_PROSE"),
    ("gate_sections.py", GOOD_NUSPEC, None, 0, "SECTIONS_OK"),
    ("gate_sections.py", BAD_SECTIONS, None, 1, "FOUND"),
    ("gate_sections.py", GOOD_NUSPEC, "# t\n\n## Links\n", 1, "FOUND"),
]

failures = []
for gate, nuspec, readme, want_code, want_token in checks:
    code, out = run(gate, nuspec, readme) if readme else run(gate, nuspec)
    if code != want_code or want_token not in out:
        failures.append(f"{gate} expected exit={want_code} token={want_token}, got exit={code} out={out.strip()[:80]}")

if failures:
    for f in failures:
        print("NEGCTL_FAIL", f)
    sys.exit(1)

print(f"NEGCTL_OK {len(checks)}")
