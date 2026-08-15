from pathlib import Path
import re
import sys

root = Path(sys.argv[1])
out = Path(sys.argv[2])
manifest = (root / "AndroidManifest.xml").read_text(errors="ignore")
activities = re.findall(r'<activity\b[^>]*android:name="([^"]+)"', manifest)
layouts = sorted(
    str(path.relative_to(root / "res"))
    for path in (root / "res").rglob("*.xml")
    if "layout" in path.parent.name
)
menus = sorted(
    str(path.relative_to(root / "res"))
    for path in (root / "res").rglob("*.xml")
    if path.parent.name == "menu"
)
strings_path = root / "res" / "values" / "strings.xml"
strings = []
if strings_path.exists():
    for line in strings_path.read_text(errors="ignore").splitlines():
        match = re.search(r'<string\s+name="([^"]+)"[^>]*>(.*?)</string>', line)
        if match:
            value = re.sub(r"\s+", " ", match.group(2)).strip()
            strings.append((match.group(1), value))

lines = ["# Inventário de telas do NEXUS original", "", f"Activities declaradas: **{len(activities)}**", ""]
lines += ["## Activities", ""]
for name in activities:
    lines.append(f"- `{name}`")
lines += ["", "## Layouts", ""]
for name in layouts:
    lines.append(f"- `{name}`")
lines += ["", "## Menus", ""]
for name in menus:
    lines.append(f"- `{name}`")
lines += ["", "## Textos funcionais relevantes", ""]
keywords = ("login", "server", "address", "setting", "search", "favorite", "live", "vod", "epg", "channel", "playlist", "account", "active", "language", "about", "video", "episode", "history", "download", "play")
for key, value in strings:
    if any(word in key.lower() or word in value.lower() for word in keywords):
        lines.append(f"- `{key}` — {value}")
out.write_text("\n".join(lines) + "\n")
print(f"activities={len(activities)}")
print(f"layouts={len(layouts)}")
print(f"menus={len(menus)}")
print(f"relevant_strings={sum(any(word in key.lower() or word in value.lower() for word in keywords) for key, value in strings)}")
