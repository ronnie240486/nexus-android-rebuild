from pathlib import Path
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
paths = [
    ROOT / "assets/branding/facilitus-icon-final.png",
    ROOT / "assets/branding/facilitus-logo-final.png",
    ROOT / "app-reconstruction/src/main/res/mipmap/facilitus_launcher.png",
    ROOT / "app-reconstruction/src/main/res/drawable/facilitus_wordmark.png",
]

for path in paths:
    image = Image.open(path)
    print(f"{path.relative_to(ROOT)}: mode={image.mode}, size={image.size}")
    if "A" in image.getbands():
        alpha = image.getchannel("A")
        print(f"  alpha_range={alpha.getextrema()}")
