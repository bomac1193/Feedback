"""
Build the dataset zip Replicate's flux-dev-lora-trainer expects.

Replicate wants a flat zip: image1.jpg + image1.txt + image2.jpg + image2.txt ...
No subfolders, no manifest, no thumbnails.

Output: ~/Feedback/lora_training/apex_118_replicate.zip
"""

from __future__ import annotations

import zipfile
from pathlib import Path

SRC = Path("/home/sphinxy/Feedback/lora_training/apex_118")
OUT = Path("/home/sphinxy/Feedback/lora_training/apex_118_replicate.zip")

ALLOWED_IMG = {".jpg", ".jpeg", ".png", ".webp"}


def main() -> None:
    images = sorted(p for p in SRC.iterdir() if p.suffix.lower() in ALLOWED_IMG)
    if not images:
        print("No images found")
        return

    pairs = 0
    missing = 0
    with zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED) as z:
        for img in images:
            txt = img.with_suffix(".txt")
            if not txt.exists():
                missing += 1
                continue
            z.write(img, arcname=img.name)
            z.write(txt, arcname=txt.name)
            pairs += 1

    size_mb = OUT.stat().st_size / 1024 / 1024
    print(f"Zipped {pairs} image+caption pairs into {OUT}")
    print(f"Size: {size_mb:.1f} MB")
    if missing:
        print(f"WARNING: {missing} images had no .txt sidecar (skipped)")


if __name__ == "__main__":
    main()
