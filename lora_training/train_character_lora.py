"""
Train a character LoRA on top of FLUX-dev for music video work.

Usage:
    1. Drop 20-30 photos of the person into:
       ~/Feedback/lora_training/ubani_photos/
    2. Run:
       python train_character_lora.py --name ubani

What it does:
    - Auto-captions every photo with the trigger (no description needed for
      character LoRAs — trigger alone teaches the face)
    - Resizes + JPEG-compresses to fit Replicate's 100MB upload cap
    - Creates the destination model on Replicate if it doesn't exist
    - Kicks off training (~10 min, ~$2-3)
    - Prints the URL to download weights when done

Photo guidance (for music video use):
    - 20-30 photos
    - Vary hairstyles (the face stays, hair becomes prompt-controllable)
    - Vary lighting + angles + distance
    - Avoid sunglasses, hats, heavy filters
    - Neutral expressions work best (smiles overfit to "this face smiling")
"""

from __future__ import annotations

import argparse
import io
import os
import sys
import zipfile
from pathlib import Path

import replicate
import requests
from PIL import Image

PHOTOS_DIR = Path("/home/sphinxy/Feedback/lora_training")
TRAINER = "ostris/flux-dev-lora-trainer"
TRAINER_VERSION = "26dce37af90b9d997eeb970d92e47de3064d46c300504ae376c75bef6a9022d2"


def build_zip(photos: list[Path], trigger: str, out_zip: Path, max_side: int = 1024) -> int:
    pairs = 0
    with zipfile.ZipFile(out_zip, "w", zipfile.ZIP_DEFLATED) as z:
        for i, p in enumerate(sorted(photos)):
            try:
                with Image.open(p) as im:
                    im = im.convert("RGB")
                    w, h = im.size
                    if max(w, h) > max_side:
                        ratio = max_side / max(w, h)
                        im = im.resize((int(w * ratio), int(h * ratio)), Image.LANCZOS)
                    buf = io.BytesIO()
                    im.save(buf, "JPEG", quality=92, optimize=True)
                    name = f"{i:03d}.jpg"
                    z.writestr(name, buf.getvalue())
                    z.writestr(f"{i:03d}.txt", f"{trigger}\n")
                    pairs += 1
            except Exception as e:
                print(f"  [skip] {p.name}: {e}")
    return pairs


def ensure_destination(token: str, owner: str, name: str) -> str:
    """Check if model exists, create if not. Returns owner/name."""
    dest = f"{owner}/{name}"
    r = requests.get(
        f"https://api.replicate.com/v1/models/{dest}",
        headers={"Authorization": f"Bearer {token}"}, timeout=10
    )
    if r.status_code == 200:
        print(f"  destination exists: {dest}")
        return dest
    print(f"  creating destination: {dest}")
    r = requests.post(
        "https://api.replicate.com/v1/models",
        headers={"Authorization": f"Bearer {token}", "Content-Type": "application/json"},
        json={
            "owner": owner, "name": name, "visibility": "private", "hardware": "cpu",
            "description": f"Character LoRA: {name} (trained on FLUX-dev)"
        }, timeout=15
    )
    if r.status_code not in (200, 201):
        raise RuntimeError(f"Failed to create destination ({r.status_code}): {r.text}")
    return dest


def main() -> int:
    token = os.environ.get("REPLICATE_API_TOKEN")
    if not token:
        token_file = Path("/home/sphinxy/genoma/.env.local")
        if token_file.exists():
            for line in token_file.read_text().splitlines():
                if line.startswith("REPLICATE_API_TOKEN="):
                    token = line.split("=", 1)[1].strip()
                    os.environ["REPLICATE_API_TOKEN"] = token
                    break
    if not token:
        print("ERROR: REPLICATE_API_TOKEN not set", file=sys.stderr)
        return 1

    ap = argparse.ArgumentParser()
    ap.add_argument("--name", required=True, help="Trigger word + default destination name (e.g. 'ubani')")
    ap.add_argument("--destination-name", default=None,
                    help="Override destination name (e.g. 'ubani-v2'). Trigger stays --name. Useful to keep prior versions intact.")
    ap.add_argument("--photos", type=Path, default=None,
                    help="Photos folder (default: ~/Feedback/lora_training/{name}_photos)")
    ap.add_argument("--owner", default="bomac1193", help="Replicate username")
    ap.add_argument("--steps", type=int, default=1500,
                    help="Training steps (1500 for character; more = sharper but risk overfit)")
    ap.add_argument("--lora-rank", type=int, default=16)
    args = ap.parse_args()

    photos_dir = args.photos or (PHOTOS_DIR / f"{args.name}_photos")
    if not photos_dir.exists():
        print(f"ERROR: photos folder not found: {photos_dir}", file=sys.stderr)
        print(f"Create it and drop 20-30 photos in there first.", file=sys.stderr)
        return 1

    photos = [p for p in photos_dir.iterdir()
              if p.suffix.lower() in {".jpg", ".jpeg", ".png", ".webp"}]
    if len(photos) < 10:
        print(f"WARNING: only {len(photos)} photos. Recommend 20-30 for good results.")
    print(f"Photos: {len(photos)} from {photos_dir}")

    # Build zip
    out_zip = PHOTOS_DIR / f"{args.name}_train.zip"
    print(f"Building training zip...")
    pairs = build_zip(photos, args.name, out_zip)
    size_mb = out_zip.stat().st_size / 1024 / 1024
    print(f"  {pairs} photo+caption pairs, {size_mb:.1f} MB")
    if size_mb > 95:
        print(f"  WARNING: zip is large; Replicate caps uploads at ~100MB", file=sys.stderr)

    # Ensure destination (separate name for v2 etc; trigger stays args.name)
    dest_name = args.destination_name or args.name
    dest = ensure_destination(token, args.owner, f"{dest_name}-flux")

    # Kick off training
    print(f"Uploading + starting training...")
    with open(out_zip, "rb") as f:
        training = replicate.trainings.create(
            model=TRAINER, version=TRAINER_VERSION,
            input={
                "input_images": f,
                "trigger_word": args.name,
                "steps": args.steps,
                "lora_rank": args.lora_rank,
                "learning_rate": 0.0004,
                "batch_size": 1,
                "resolution": "512,768,1024",
                "autocaption": False,
                "caption_dropout_rate": 0.05,
                "optimizer": "adamw8bit",
            },
            destination=dest,
        )

    print()
    print(f"Training kicked off:")
    print(f"  ID:     {training.id}")
    print(f"  Watch:  https://replicate.com/p/{training.id}")
    print(f"  Model:  https://replicate.com/{dest}")
    print()
    print(f"~10-15 min. When done, download weights tarball, extract")
    print(f"lora.safetensors, save as: D:\\Visuals\\ComfyUI\\models\\loras\\{args.name}_v1.safetensors")
    print()
    print(f"In ComfyUI: stack two LoraLoader nodes — alabo_eye_v1 + {args.name}_v1.")
    print(f"Use both triggers in prompts: 'alabo_eye, {args.name}, ...'")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
