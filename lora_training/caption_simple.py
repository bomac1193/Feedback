"""
Simple captioner for FLUX style/aesthetic LoRAs.

Writes a trigger-token caption next to each image. For aesthetic LoRAs this
is preferable to detailed Florence-2 captions, which over-specify content
and dilute style learning.

Caption format:
    alabo_eye, portrait
    alabo_eye, landscape
    alabo_eye, square

Usage:
    ~/tizita/backend/venv/bin/python caption_simple.py
    ~/tizita/backend/venv/bin/python caption_simple.py --dir apex_118 --trigger alabo_eye
    ~/tizita/backend/venv/bin/python caption_simple.py --trigger-only   # just the token
"""

from __future__ import annotations

import argparse
from pathlib import Path

from PIL import Image

DEFAULT_DIR = Path("/home/sphinxy/Feedback/lora_training/apex_118")


def aspect_label(w: int, h: int) -> str:
    if abs(w - h) < max(w, h) * 0.05:
        return "square"
    return "landscape" if w > h else "portrait"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dir", type=Path, default=DEFAULT_DIR)
    ap.add_argument("--trigger", default="alabo_eye")
    ap.add_argument("--trigger-only", action="store_true",
                    help="Just the trigger token, no aspect")
    ap.add_argument("--overwrite", action="store_true")
    args = ap.parse_args()

    images = sorted(
        p for p in args.dir.iterdir()
        if p.suffix.lower() in {".jpg", ".jpeg", ".png", ".webp"}
    )
    if not images:
        print(f"No images in {args.dir}")
        return 1

    written = skipped = 0
    for path in images:
        sidecar = path.with_suffix(".txt")
        if sidecar.exists() and not args.overwrite:
            skipped += 1
            continue

        if args.trigger_only:
            caption = args.trigger
        else:
            try:
                with Image.open(path) as im:
                    label = aspect_label(im.width, im.height)
            except Exception:
                label = "image"
            caption = f"{args.trigger}, {label}"

        sidecar.write_text(caption + "\n")
        written += 1

    print(f"Wrote {written} captions, skipped {skipped} existing.")
    print(f"Trigger: '{args.trigger}'")
    print("Sample caption:", caption)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
