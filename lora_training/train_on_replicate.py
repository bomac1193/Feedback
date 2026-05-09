"""
Kick off FLUX LoRA training on Replicate's ostris/flux-dev-lora-trainer.

PREREQUISITES:
    1. Replicate account: https://replicate.com
    2. API token: https://replicate.com/account/api-tokens
    3. Create a destination model (one-time, free):
       https://replicate.com/create
       - Name it e.g. "alabo-eye-flux"
       - Visibility: private (your trained LoRA only)
    4. Set env vars:
       export REPLICATE_API_TOKEN=r8_...
       export REPLICATE_DESTINATION=yourusername/alabo-eye-flux

INSTALL:
    pip install replicate

RUN:
    python train_on_replicate.py

WHAT IT DOES:
    - Uploads apex_118_replicate.zip (~360 MB) to Replicate's file storage
    - Kicks off training on FLUX-dev with trigger word "alabo_eye"
    - 1000 steps, rank 16, ~30-45 min, ~$2-4 on H100
    - Prints the training URL — watch progress in browser
    - When done, the LoRA appears at:
        https://replicate.com/<destination>
      Download the .safetensors and drop into ComfyUI/models/loras/

NOTES:
    - Trains on FLUX.1-dev (Replicate's trainer requires dev, not Schnell).
      The resulting LoRA also works with Schnell at inference, slightly weaker.
    - autocaption is OFF — we use the trigger+aspect captions in the zip.
"""

from __future__ import annotations

import os
import sys
from pathlib import Path

import replicate

ZIP_PATH = Path("/home/sphinxy/Feedback/lora_training/apex_117_replicate_compressed.zip")

TRAINING_INPUT = {
    "trigger_word": "alabo_eye",
    "steps": 1000,
    "lora_rank": 16,
    "learning_rate": 0.0004,
    "batch_size": 1,
    "resolution": "512,768,1024",
    "autocaption": False,
    "caption_dropout_rate": 0.05,
    "optimizer": "adamw8bit",
    "wandb_api_key": "",
}


def main() -> int:
    token = os.environ.get("REPLICATE_API_TOKEN")
    destination = os.environ.get("REPLICATE_DESTINATION")
    if not token:
        print("ERROR: set REPLICATE_API_TOKEN env var", file=sys.stderr)
        return 1
    if not destination or "/" not in destination:
        print("ERROR: set REPLICATE_DESTINATION=username/model-name", file=sys.stderr)
        print("  Create the destination model first: https://replicate.com/create", file=sys.stderr)
        return 1
    if not ZIP_PATH.exists():
        print(f"ERROR: zip not found at {ZIP_PATH}", file=sys.stderr)
        print("  Run build_zip_for_replicate.py first", file=sys.stderr)
        return 1

    size_mb = ZIP_PATH.stat().st_size / 1024 / 1024
    print(f"Uploading dataset ({size_mb:.1f} MB) to Replicate...")

    with open(ZIP_PATH, "rb") as f:
        TRAINING_INPUT["input_images"] = f
        training = replicate.trainings.create(
            model="ostris/flux-dev-lora-trainer",
            version="26dce37af90b9d997eeb970d92e47de3064d46c300504ae376c75bef6a9022d2",
            input=TRAINING_INPUT,
            destination=destination,
        )

    print()
    print(f"Training kicked off:")
    print(f"  ID:      {training.id}")
    print(f"  Status:  {training.status}")
    print(f"  Watch:   https://replicate.com/p/{training.id}")
    print()
    print("When training completes (~30-45 min):")
    print(f"  1. Visit https://replicate.com/{destination}")
    print(f"  2. Click the latest version → 'Download weights'")
    print(f"  3. Save as: D:\\Visuals\\ComfyUI\\models\\loras\\alabo_eye_v1.safetensors")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
