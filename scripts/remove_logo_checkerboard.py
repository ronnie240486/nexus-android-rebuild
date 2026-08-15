from pathlib import Path
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
source = ROOT / "assets/branding/facilitus-logo-transparent.png"
output = ROOT / "assets/branding/facilitus-logo-final.png"

image = Image.open(source).convert("RGBA")
pixels = image.load()
width, height = image.size

for y in range(height):
    for x in range(width):
        r, g, b, _ = pixels[x, y]
        brightness = (r + g + b) / 3.0
        chroma = max(r, g, b) - min(r, g, b)

        # The generated checkerboard is light and nearly neutral. Keep all
        # saturated brand colors and dark symbol details intact.
        if brightness >= 190 and chroma <= 28:
            alpha = 0
        elif brightness >= 150 and chroma <= 34:
            alpha = int(max(0, min(255, (190 - brightness) * 6.4)))
        else:
            alpha = 255
        pixels[x, y] = (r, g, b, alpha)

image.save(output)
print(f"saved {output} mode={Image.open(output).mode} size={image.size}")
