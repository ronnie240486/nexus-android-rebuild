from __future__ import annotations

import re
import sys
from pathlib import Path

DOMAIN_RE = re.compile(
    r"(?i)(?:(?:https?|rtsp|rtmp|mqtt|wss?)://[^\x00-\x1f\s\"'<>]+|"
    r"(?:[a-z0-9-]+\.)+(?:com|cn|net|org|tv|io|app)(?::\d+)?(?:/[a-z0-9_./?=&%:+-]*)?)"
)
PRINTABLE_RE = re.compile(rb"[ -~]{5,}")


def main() -> int:
    if len(sys.argv) != 2:
        print(f"usage: {sys.argv[0]} <directory>", file=sys.stderr)
        return 2
    directory = Path(sys.argv[1])
    results: set[str] = set()
    for path in sorted(directory.glob("classes*.dex")):
        data = path.read_bytes()
        for match in PRINTABLE_RE.finditer(data):
            text = match.group().decode("ascii", errors="ignore")
            for found in DOMAIN_RE.findall(text):
                results.add(found.rstrip(",;)]}"))
    for item in sorted(results, key=str.lower):
        print(item)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
