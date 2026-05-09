"""
Run alabo_eye LoRA inference on Replicate (FLUX-dev base, full quality).

Model: bomac1193/alabo-eye-flux (your trained LoRA, hosted on Replicate)
Cost: ~$0.05-0.10 per image at 28 steps.

Usage:
    # Single prompt
    python cloud_generate.py "alabo_eye, portrait of Ubani"

    # Run the diagnostic test set (5 prompts)
    python cloud_generate.py --test-set

    # Custom strength sweep
    python cloud_generate.py --strength-sweep "alabo_eye, woman in shadow"

Output saves to ~/Feedback/lora_training/cloud_tests/
"""

from __future__ import annotations

import argparse
import os
import sys
import time
import urllib.request
from pathlib import Path

import replicate

OUT_DIR = Path("/home/sphinxy/Feedback/lora_training/cloud_tests")
MODEL = "bomac1193/alabo-eye-flux:d6a007bc8b8471b190ca7f739f66f672ca4c4e5819bb888378313fe8bb59604b"

TEST_SET = [
    ("01_pure_trigger", "alabo_eye"),
    ("02_portrait", "alabo_eye, portrait of a man in white robes, single rim light, deep blacks"),
    ("03_abstract", "alabo_eye, bioluminescent forms tracing through dark void, macro photography"),
    ("04_cinematic", "alabo_eye, woman in shadow, single rim light, deep blacks, painterly"),
    ("05_dramatic", "alabo_eye, monumental figure, golden hour, low angle, cinematic"),
]


def generate(prompt: str, label: str, lora_scale: float = 1.0, seed: int = 42) -> Path | None:
    print(f"\n[{label}] strength={lora_scale} seed={seed}")
    print(f"  prompt: {prompt[:100]}")

    try:
        output = replicate.run(
            MODEL,
            input={
                "prompt": prompt,
                "lora_scale": lora_scale,
                "num_inference_steps": 28,
                "guidance_scale": 3.0,
                "aspect_ratio": "1:1",
                "output_format": "png",
                "output_quality": 95,
                "seed": seed,
            },
        )
    except Exception as e:
        print(f"  ERROR: {e}")
        return None

    # Output is a list with one URL or a FileOutput object
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"):
        url = url.url

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    dst = OUT_DIR / f"{label}.png"
    urllib.request.urlretrieve(str(url), dst)
    print(f"  saved: {dst}")
    return dst


def main() -> int:
    if not os.environ.get("REPLICATE_API_TOKEN"):
        print("ERROR: REPLICATE_API_TOKEN not set", file=sys.stderr)
        return 1

    ap = argparse.ArgumentParser()
    ap.add_argument("prompt", nargs="?", default=None, help="Prompt (omit for --test-set)")
    ap.add_argument("--test-set", action="store_true", help="Run the 5-prompt diagnostic battery")
    ap.add_argument("--strength-sweep", metavar="PROMPT",
                    help="Sweep one prompt across strengths 0.5/0.8/1.0/1.3")
    ap.add_argument("--strength", type=float, default=1.0)
    ap.add_argument("--seed", type=int, default=42)
    args = ap.parse_args()

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    saved = []

    if args.test_set:
        for label, prompt in TEST_SET:
            p = generate(prompt, label, lora_scale=args.strength, seed=args.seed)
            if p: saved.append(p)
    elif args.strength_sweep:
        for s in (0.5, 0.8, 1.0, 1.3):
            label = f"sweep_s{s:.1f}"
            p = generate(args.strength_sweep, label, lora_scale=s, seed=args.seed)
            if p: saved.append(p)
    elif args.prompt:
        ts = int(time.time())
        label = f"single_{ts}"
        p = generate(args.prompt, label, lora_scale=args.strength, seed=args.seed)
        if p: saved.append(p)
    else:
        print("Provide a prompt, --test-set, or --strength-sweep")
        return 1

    print()
    print(f"Done. {len(saved)} images at {OUT_DIR}")
    print(f"View from Windows: \\\\wsl.localhost\\Ubuntu{OUT_DIR}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
