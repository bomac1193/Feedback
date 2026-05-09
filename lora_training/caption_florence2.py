"""
Florence-2 captioner for FLUX LoRA training.

Reads images from tizita_top/ (or any dir via --dir), writes a sidecar .txt
caption next to each image. Captions are prefixed with the trigger token so
the LoRA learns to attach the aesthetic to that token.

Usage:
    python caption_florence2.py
    python caption_florence2.py --dir /path/to/images --trigger feedback_aesthetic
    python caption_florence2.py --task more_detailed   # longer captions

Models:
    Florence-2-large by default (~770M, ~2GB VRAM). Falls back to base if
    large is missing. Uses CUDA if available, else CPU (slow but works).
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

DEFAULT_DIR = Path("/home/sphinxy/Feedback/lora_training/tizita_top")
TRIGGER = "alabo_eye"
TASK_MAP = {
    "caption": "<CAPTION>",
    "detailed": "<DETAILED_CAPTION>",
    "more_detailed": "<MORE_DETAILED_CAPTION>",
}


def load_florence(model_id: str = "microsoft/Florence-2-large"):
    import torch
    from transformers import AutoModelForCausalLM, AutoProcessor

    device = "cuda" if torch.cuda.is_available() else "cpu"
    dtype = torch.float16 if device == "cuda" else torch.float32

    print(f"Loading {model_id} on {device}...")
    model = AutoModelForCausalLM.from_pretrained(
        model_id, torch_dtype=dtype, trust_remote_code=True
    ).to(device)
    processor = AutoProcessor.from_pretrained(model_id, trust_remote_code=True)
    return model, processor, device, dtype


def caption_image(model, processor, device, dtype, image, task_token: str) -> str:
    inputs = processor(text=task_token, images=image, return_tensors="pt").to(device, dtype)
    generated_ids = model.generate(
        input_ids=inputs["input_ids"],
        pixel_values=inputs["pixel_values"],
        max_new_tokens=1024,
        num_beams=3,
        do_sample=False,
    )
    text = processor.batch_decode(generated_ids, skip_special_tokens=False)[0]
    parsed = processor.post_process_generation(
        text, task=task_token, image_size=(image.width, image.height)
    )
    return parsed.get(task_token, "").strip()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dir", type=Path, default=DEFAULT_DIR)
    ap.add_argument("--trigger", default=TRIGGER)
    ap.add_argument("--task", choices=list(TASK_MAP.keys()), default="detailed")
    ap.add_argument("--model", default="microsoft/Florence-2-large")
    ap.add_argument("--overwrite", action="store_true")
    args = ap.parse_args()

    if not args.dir.exists():
        print(f"Dir not found: {args.dir}", file=sys.stderr)
        return 1

    images = sorted(
        p for p in args.dir.iterdir()
        if p.suffix.lower() in {".jpg", ".jpeg", ".png", ".webp"}
    )
    if not images:
        print(f"No images in {args.dir}", file=sys.stderr)
        return 1

    try:
        from PIL import Image
        model, processor, device, dtype = load_florence(args.model)
    except Exception as e:
        print(f"Failed to load Florence-2: {e}", file=sys.stderr)
        print("Try: pip install transformers timm einops pillow torch", file=sys.stderr)
        return 1

    task_token = TASK_MAP[args.task]
    written, skipped = 0, 0
    for i, path in enumerate(images):
        sidecar = path.with_suffix(".txt")
        if sidecar.exists() and not args.overwrite:
            skipped += 1
            continue
        try:
            with Image.open(path) as im:
                im = im.convert("RGB")
                caption = caption_image(model, processor, device, dtype, im, task_token)
        except Exception as e:
            print(f"  [fail] {path.name}: {e}")
            continue

        line = f"{args.trigger}, {caption}" if args.trigger else caption
        sidecar.write_text(line + "\n")
        written += 1
        if written % 5 == 0 or i == len(images) - 1:
            print(f"  captioned {written}/{len(images)}  (skipped {skipped} existing)")

    print(f"\nDone. Wrote {written} captions, skipped {skipped}.")
    print(f"Trigger token: '{args.trigger}' (prepended to every caption)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
