"""
Build a size-capped zip for Replicate's file upload limit (~100 MB).

Resizes each image to max 1024 on the longest side and saves as JPEG q92.
This is FLUX's max training resolution anyway, so no quality loss for the
LoRA — and cuts the zip from 360 MB to ~50-80 MB.

Output: ~/Feedback/lora_training/apex_117_replicate_compressed.zip
"""

from __future__ import annotations

import io
import zipfile
from pathlib import Path

from PIL import Image

SRC = Path("/home/sphinxy/Feedback/lora_training/apex_118")
OUT = Path("/home/sphinxy/Feedback/lora_training/apex_117_replicate_compressed.zip")
MAX_SIDE = 1024
JPEG_QUALITY = 92

ALLOWED_IMG = {".jpg", ".jpeg", ".png", ".webp"}


def resize_to_jpeg(path: Path) -> bytes:
    with Image.open(path) as im:
        im = im.convert("RGB")
        w, h = im.size
        if max(w, h) > MAX_SIDE:
            ratio = MAX_SIDE / max(w, h)
            im = im.resize((int(w * ratio), int(h * ratio)), Image.LANCZOS)
        buf = io.BytesIO()
        im.save(buf, "JPEG", quality=JPEG_QUALITY, optimize=True)
        return buf.getvalue()


def main() -> None:
    images = sorted(p for p in SRC.iterdir() if p.suffix.lower() in ALLOWED_IMG)
    pairs = 0
    total_in = total_out = 0
    with zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED) as z:
        for img in images:
            txt = img.with_suffix(".txt")
            if not txt.exists():
                continue
            jpeg_bytes = resize_to_jpeg(img)
            new_name = img.stem + ".jpg"
            z.writestr(new_name, jpeg_bytes)
            z.write(txt, arcname=img.stem + ".txt")
            total_in += img.stat().st_size
            total_out += len(jpeg_bytes)
            pairs += 1

    size_mb = OUT.stat().st_size / 1024 / 1024
    print(f"Compressed {pairs} image+caption pairs")
    print(f"  Input total:  {total_in/1024/1024:.1f} MB")
    print(f"  Output total: {total_out/1024/1024:.1f} MB ({total_out*100/total_in:.0f}%)")
    print(f"  Zip size:     {size_mb:.1f} MB")
    print(f"  Output: {OUT}")


if __name__ == "__main__":
    main()
