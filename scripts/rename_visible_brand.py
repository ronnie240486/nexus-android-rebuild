from pathlib import Path
import sys

root = Path(sys.argv[1])
changed = []
for path in root.rglob("strings.xml"):
    text = path.read_text(errors="ignore")
    updated = text.replace('<string name="app_name">NEXUS</string>', '<string name="app_name">Facilitus</string>')
    if updated != text:
        path.write_text(updated)
        changed.append(str(path))
print(f"changed_files={len(changed)}")
for path in changed:
    print(path)
