"""
Audio DNA → visual prompt mapper.

Takes an audio file (or Starforge audio analysis output) and derives:
  - Color palette / mood vocabulary
  - LoRA strength suggestions
  - Aspect ratio + density
  - Recommended quality tier

Goal: feed an audio track in, get a prompt and gen.py args out. The dream is
"one-click music video from a song." This is the v0 scaffolding — it does
basic audio analysis (BPM, energy, brightness) and maps to FLUX prompt
vocabulary. Wire it into Starforge later for richer features.

Usage (standalone):
    pip install librosa numpy
    python audio_to_visual.py --audio track.mp3 --character ubani

    Outputs JSON with prompt + suggested gen.py args.

Usage (programmatic):
    from audio_to_visual import analyze, build_prompt_args
    features = analyze("track.mp3")
    args = build_prompt_args(features, character="ubani")
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import asdict, dataclass
from pathlib import Path

sys.path.insert(0, "/home/sphinxy/boveda")
try:
    from registry import get_character
except ImportError:
    get_character = None


@dataclass
class AudioFeatures:
    bpm: float
    energy: float           # 0..1, RMS-derived
    brightness: float       # 0..1, spectral centroid normalized
    dynamic_range: float    # 0..1, std of RMS
    duration_sec: float
    key: str = "?"          # placeholder; needs librosa key estimation
    mode: str = "?"         # major / minor


def analyze(audio_path: str) -> AudioFeatures:
    """Extract basic audio features. Needs librosa."""
    try:
        import librosa
        import numpy as np
    except ImportError:
        raise RuntimeError("Install librosa first: pip install librosa numpy")
    y, sr = librosa.load(audio_path, sr=22050, mono=True)
    duration = librosa.get_duration(y=y, sr=sr)
    tempo, _ = librosa.beat.beat_track(y=y, sr=sr)
    rms = librosa.feature.rms(y=y)[0]
    centroid = librosa.feature.spectral_centroid(y=y, sr=sr)[0]
    energy = float(np.clip(rms.mean() / 0.3, 0, 1))           # normalize to typical range
    brightness = float(np.clip(centroid.mean() / 4000, 0, 1))  # 0=dark, 1=bright
    dynamic = float(np.clip(rms.std() / 0.15, 0, 1))
    return AudioFeatures(
        bpm=float(tempo) if hasattr(tempo, '__iter__') is False else float(tempo[0]),
        energy=energy, brightness=brightness, dynamic_range=dynamic,
        duration_sec=duration,
    )


def build_prompt_args(features: AudioFeatures, character: str | None = None,
                      base_prompt: str = "") -> dict:
    """Map audio features → gen.py args + prompt vocabulary."""
    # Energy → density / drama
    if features.energy > 0.7:
        density = "intense, dense, dramatic"
    elif features.energy > 0.4:
        density = "moderate energy, balanced composition"
    else:
        density = "sparse, minimal, contemplative"

    # Brightness → palette tone
    if features.brightness > 0.6:
        palette = "high-key lighting, bright accents, luminous"
    elif features.brightness > 0.35:
        palette = "balanced midtones, cinematic"
    else:
        palette = "dark, deep blacks, low-key, shadowy"

    # BPM → motion vocabulary
    if features.bpm > 140:
        motion = "fast cuts, dynamic motion, rapid transitions"
    elif features.bpm > 100:
        motion = "rhythmic pacing, fluid movement"
    elif features.bpm > 70:
        motion = "slow deliberate motion, sustained gestures"
    else:
        motion = "languid, slow zoom, near-still"

    # Dynamic range → contrast preference
    contrast = "high contrast" if features.dynamic_range > 0.5 else "muted contrast"

    # Compose prompt
    parts = [base_prompt, palette, density, motion, contrast, "film grain, 35mm photographic"]
    prompt = ", ".join(p for p in parts if p)

    # LoRA strength: stronger style for higher-energy tracks
    lora_scale = 0.85 + (features.energy * 0.3)  # 0.85..1.15

    # Aspect / quality from character or defaults
    aspect = "9:16"
    quality = "high"
    if character and get_character:
        try:
            c = get_character(character)
            aspect = c.preferred_aspect
            quality = c.preferred_quality
            prompt = f"{c.default_prompt_prefix} {prompt}".strip()
        except Exception:
            pass

    duration = min(int(features.duration_sec), 10)  # cap at 10s for cloud video

    return {
        "prompt": prompt,
        "lora_scale": round(lora_scale, 2),
        "aspect": aspect,
        "quality": quality,
        "duration": max(duration, 5),
        "_features": asdict(features),
    }


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--audio", required=True, help="Audio file (mp3/wav)")
    ap.add_argument("--character", default=None)
    ap.add_argument("--base-prompt", default="")
    args = ap.parse_args()
    features = analyze(args.audio)
    out = build_prompt_args(features, args.character, args.base_prompt)
    print(json.dumps(out, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
