"""Gate: every iconUrl is pinned to a commit and that URL really serves the icon.

A pin that 404s is worse than @main, so this fetches each URL rather than trusting the
string. jsDelivr answers from GitHub on a cold path, so a slow first hit is expected.
"""
import glob
import os
import re
import sys
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
UA = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/131.0"}
PINNED = re.compile(r"^https://cdn\.jsdelivr\.net/gh/[^@]+@([0-9a-f]{40})/icons/([^/]+)\.png$")


def check(item):
    pid, url = item
    m = PINNED.match(url)
    if not m:
        return pid, f"not pinned to a commit: {url}"
    if m.group(2) != pid:
        return pid, f"points at icons/{m.group(2)}.png"
    for attempt in range(3):
        try:
            r = urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=60)
            body = r.read(8)
            if body[:8] != b"\x89PNG\r\n\x1a\n":
                return pid, "served content is not a PNG"
            return pid, None
        except urllib.error.HTTPError as e:
            if e.code == 404:
                return pid, "404 from jsDelivr"
            time.sleep(3 * (attempt + 1))
        except Exception:
            time.sleep(2)
    return pid, "unreachable after 3 attempts"


items = []
for f in sorted(glob.glob(os.path.join(ROOT, "automatic", "*", "*.nuspec"))):
    pid = os.path.basename(os.path.dirname(f))
    text = open(f, encoding="utf-8-sig").read()
    m = re.search(r"<iconUrl>(.*?)</iconUrl>", text)
    items.append((pid, m.group(1).strip() if m else ""))

problems = []
with ThreadPoolExecutor(max_workers=8) as ex:
    for pid, err in ex.map(check, items):
        if err:
            problems.append(f"{pid}: {err}")

if not items:
    print("NO_NUSPECS_FOUND")
    sys.exit(1)
if problems:
    for p in problems[:10]:
        print("FAIL", p)
    print(f"total problems: {len(problems)}")
    sys.exit(1)

print(f"ICONS_OK {len(items)}")
