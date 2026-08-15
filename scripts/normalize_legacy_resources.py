from pathlib import Path
from PIL import Image

root = Path('/tmp/nexus-apktool-rebuild/res')
converted = []
for path in root.rglob('*.png'):
    try:
        with Image.open(path) as image:
            if image.format != 'PNG':
                converted.append((str(path), image.format))
                rgba = image.convert('RGBA') if 'A' in image.getbands() else image.convert('RGB')
                rgba.save(path, format='PNG')
    except Exception:
        continue

# Android resource names cannot contain '$'. Apktool may decode a valid
# compiled resource into such a filename when the original package used
# generated names. Rename the files and all references while keeping the
# numeric IDs in public.xml unchanged.
renamed = []
for path in sorted(root.rglob('*'), key=lambda item: len(item.parts), reverse=True):
    if not path.is_file() or '$' not in path.name:
        continue
    replacement = path.with_name(path.name.replace('$', 'r_'))
    path.rename(replacement)
    renamed.append((str(path), str(replacement)))

if renamed:
    for path in root.rglob('*'):
        if not path.is_file():
            continue
        try:
            text = path.read_text(errors='ignore')
        except Exception:
            continue
        updated = text
        for old, new in renamed:
            updated = updated.replace(Path(old).name, Path(new).name)
            updated = updated.replace(Path(old).stem, Path(new).stem)
        if updated != text:
            path.write_text(updated)

for path, original_format in converted:
    print(f'converted {path} from {original_format} to PNG')
for old, new in renamed:
    print(f'renamed {old} -> {new}')
print(f'converted_count={len(converted)}')
print(f'renamed_count={len(renamed)}')
