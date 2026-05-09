"""
Cloud video character-swap helper.

Wan 2.2 VACE (true character swap with driving video) isn't on Replicate
yet. Two cloud paths instead:

  1. wan-video/wan-2.2-i2v-fast — animate a still character image
  2. kwaivgi/kling-v3-omni-video — proper character swap with reference
     images and driving video. Recommended for swap use case.

Usage:
    export REPLICATE_API_TOKEN=$(grep ^REPLICATE_API_TOKEN /home/sphinxy/genoma/.env.local | cut -d= -f2)
    python wan_character_swap.py kling --ref alabo.png --driving driving.mp4
    python wan_character_swap.py wan  --image alabo.png --prompt "walking through a market"
"""

from __future__ import annotations

import argparse
import os
import sys
from pathlib import Path

import replicate

MODELS = {
    "wan": "wan-video/wan-2.2-i2v-fast",
    "kling": "kwaivgi/kling-v3-omni-video",
}


def upload(path: Path):
    return open(path, "rb")


def main() -> int:
    if not os.environ.get("REPLICATE_API_TOKEN"):
        print("ERROR: set REPLICATE_API_TOKEN", file=sys.stderr)
        return 1

    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="model", required=True)

    pw = sub.add_parser("wan", help="Wan 2.2 i2v-fast — animate a still image")
    pw.add_argument("--image", type=Path, required=True)
    pw.add_argument("--prompt", default="natural motion, cinematic")
    pw.add_argument("--duration", type=int, default=5)

    pk = sub.add_parser("kling", help="Kling v3 Omni — character swap with driving video")
    pk.add_argument("--ref", type=Path, required=True, help="Reference character image")
    pk.add_argument("--driving", type=Path, required=True, help="Driving motion video")
    pk.add_argument("--prompt", default="")

    args = ap.parse_args()

    if args.model == "wan":
        with upload(args.image) as f:
            output = replicate.run(
                MODELS["wan"],
                input={
                    "image": f,
                    "prompt": args.prompt,
                    "duration": args.duration,
                },
            )
    else:
        with upload(args.ref) as ref_f, upload(args.driving) as drv_f:
            output = replicate.run(
                MODELS["kling"],
                input={
                    "image": ref_f,
                    "video": drv_f,
                    "prompt": args.prompt,
                },
            )

    print(f"Output: {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
