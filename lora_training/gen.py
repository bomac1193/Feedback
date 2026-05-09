"""
Unified generation script for FLUX (image) and Wan 2.2 (video).
Cloud (Replicate) or Local (ComfyUI), with one flag.

Examples:
    # FLUX image, cloud, 4 variations of same prompt
    python gen.py flux --prompt "alabo_eye, dark portrait" --variations 4

    # FLUX image, local, 16:9 draft
    python gen.py flux --backend local --prompt "..." --aspect 16:9 --size draft

    # Wan 2.2 video, cloud, animate a still
    python gen.py wan --ref alabo.png --prompt "walking through the market"

    # Wan 2.2 character swap (cloud, with driving video)
    python gen.py wan --ref alabo.png --driving motion.mp4

Defaults: backend=cloud, aspect=1:1, size=full, variations=1.
"""

from __future__ import annotations

import argparse
import json
import os
import sys
import time
import urllib.request
from pathlib import Path
from typing import Optional

import replicate

# Boveda character registry — source of truth for LoRA stacks, triggers, voice IDs
sys.path.insert(0, "/home/sphinxy/boveda")
try:
    from registry import get_character, list_characters, resolve_stack
    BOVEDA_AVAILABLE = True
except ImportError:
    BOVEDA_AVAILABLE = False

OUT_DIR = Path("/home/sphinxy/Feedback/lora_training/gen_output")

# FLUX dimensions: (width, height) per aspect × size
# `big` (1.5x) and 2x are CLOUD-ONLY — would OOM on 16GB local.
# 2x isn't a preset at all because FLUX wasn't trained at those resolutions.
DIMS = {
    ("1:1",    "draft"): (512, 512),
    ("1:1",    "full"):  (1024, 1024),
    ("1:1",    "big"):   (1536, 1536),
    ("16:9",   "draft"): (672, 384),
    ("16:9",   "full"):  (1344, 768),
    ("16:9",   "big"):   (2016, 1152),
    ("9:16",   "draft"): (384, 672),
    ("9:16",   "full"):  (768, 1344),
    ("9:16",   "big"):   (1152, 2016),
    ("4:3",    "draft"): (576, 448),
    ("4:3",    "full"):  (1152, 896),
    ("4:3",    "big"):   (1728, 1344),
    ("3:4",    "draft"): (448, 576),
    ("3:4",    "full"):  (896, 1152),
    ("3:4",    "big"):   (1344, 1728),
    ("21:9",   "draft"): (768, 320),
    ("21:9",   "full"):  (1536, 640),
    ("21:9",   "big"):   (2304, 960),
}

# Local-backend safety: any resolution above this pixel count will OOM on 16GB
# FLUX-dev fp8 + LoRA + T5 + activations. Keep the local path strictly inside
# what FLUX was trained on; punt big/2x to cloud where there's headroom.
LOCAL_MAX_PIXELS = 1024 * 1344  # = ~1.38M; covers all draft + full presets


def assert_local_safe(w: int, h: int, aspect: str, size: str) -> None:
    """Refuse local generation if dimensions would OOM. Caller catches."""
    if w * h <= LOCAL_MAX_PIXELS:
        return
    raise ValueError(
        f"Local backend can't safely run {w}×{h} ({aspect} {size}) on 16GB VRAM. "
        f"Use --backend cloud for 'big' sizes, or drop --size to 'full'."
    )

# ---------- FLUX ----------

FLUX_REPLICATE = "bomac1193/alabo-eye-flux:d6a007bc8b8471b190ca7f739f66f672ca4c4e5819bb888378313fe8bb59604b"
PULID_REPLICATE = "zsxkib/flux-pulid"  # FLUX-dev + PuLID face match (no alabo_eye style)
VTON_REPLICATE = "cuuupid/idm-vton"    # Best-in-class virtual try-on (clothing transfer)
UPSCALE_REPLICATE = "philz1337x/clarity-upscaler:dfad41707589d68ecdccd1dfa600d55a208f9310748e44bfe35b4a6291453d5e"  # General upscale + detail enhancement (version-pinned to avoid 404 on resolve)
SUPIR_REPLICATE = "cjwbw/supir"                    # Top-tier photoreal restoration (skin/fabric micro-detail)
GFPGAN_REPLICATE = "tencentarc/gfpgan"  # Face restoration (sharper, more identity)
COMFY_LOCAL = "http://localhost:8000"
COMFY_INPUT_DIR = Path("/mnt/d/Visuals/ComfyUI/input")
FACE_WORKFLOW = Path("/home/sphinxy/Feedback/comfyui/workflow_flux_face_alabo.json")
WAN_LOCAL_WORKFLOW = Path("/home/sphinxy/Feedback/comfyui/workflow_wan22_vace_local.json")


def flux_cloud_with_character(prompt: str, w: int, h: int, seed: int, steps: int,
                               primary_ref: str, extra_lora: Optional[str],
                               primary_scale: float, extra_scale: float) -> bytes:
    """Cloud FLUX with stacked LoRAs. primary_ref = Replicate model ref
    (e.g. 'bomac1193/alabo-eye-flux:<version>'). extra_lora = optional second
    LoRA (Replicate ref or HF path). The primary model has its own LoRA baked
    in; extra_lora stacks on top."""
    aspect_map = {(1024, 1024): "1:1", (1344, 768): "16:9", (768, 1344): "9:16",
                  (1152, 896): "4:3", (896, 1152): "3:4", (1536, 640): "21:9"}
    ratio = aspect_map.get((w, h), "1:1")
    inputs = {
        "prompt": prompt,
        "lora_scale": primary_scale,
        "num_inference_steps": steps,
        "guidance_scale": 3.5,
        "aspect_ratio": ratio,
        "output_format": "png",
        "output_quality": 95,
        "seed": seed,
    }
    if extra_lora:
        inputs["extra_lora"] = extra_lora
        inputs["extra_lora_scale"] = extra_scale
    output = replicate.run(primary_ref, input=inputs)
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


def flux_local_stacked(prompt: str, w: int, h: int, seed: int, steps: int,
                       lora_stack: list[tuple[str, float]]) -> bytes:
    """Local FLUX with N LoRAs chained. lora_stack is [(filename, strength), ...]
    in apply order. Builds the workflow JSON dynamically."""
    # Base workflow: UNETLoader → DualCLIPLoader → VAELoader → ... → KSampler
    wf = {
        "1": {"class_type": "UNETLoader",
              "inputs": {"unet_name": "flux1-dev-fp8.safetensors", "weight_dtype": "fp8_e4m3fn_fast"}},
        "2": {"class_type": "DualCLIPLoader",
              "inputs": {"clip_name1": "clip_l.safetensors", "clip_name2": "t5xxl_fp8_e4m3fn.safetensors", "type": "flux"}},
        "3": {"class_type": "VAELoader", "inputs": {"vae_name": "ae.safetensors"}},
    }
    # Chain LoRAs
    prev_model = ["1", 0]
    prev_clip = ["2", 0]
    next_id = 100
    for filename, strength in lora_stack:
        nid = str(next_id)
        wf[nid] = {
            "class_type": "LoraLoader",
            "inputs": {
                "model": prev_model, "clip": prev_clip,
                "lora_name": filename,
                "strength_model": strength, "strength_clip": strength,
            }
        }
        prev_model = [nid, 0]
        prev_clip = [nid, 1]
        next_id += 1
    # Conditioning + sampling
    wf["10"] = {"class_type": "CLIPTextEncode", "inputs": {"clip": prev_clip, "text": prompt}}
    wf["11"] = {"class_type": "FluxGuidance", "inputs": {"conditioning": ["10", 0], "guidance": 3.5}}
    wf["12"] = {"class_type": "CLIPTextEncode", "inputs": {"clip": prev_clip, "text": ""}}
    wf["40"] = {"class_type": "EmptyLatentImage", "inputs": {"width": w, "height": h, "batch_size": 1}}
    wf["50"] = {"class_type": "KSampler", "inputs": {
        "model": prev_model, "positive": ["11", 0], "negative": ["12", 0],
        "latent_image": ["40", 0],
        "seed": seed, "steps": steps, "cfg": 1.0,
        "sampler_name": "dpmpp_2m", "scheduler": "sgm_uniform", "denoise": 1.0,
    }}
    wf["60"] = {"class_type": "VAEDecode", "inputs": {"samples": ["50", 0], "vae": ["3", 0]}}
    wf["70"] = {"class_type": "SaveImage", "inputs": {"images": ["60", 0], "filename_prefix": "gen_stacked"}}

    payload = json.dumps({"prompt": wf, "client_id": "gen"}).encode()
    req = urllib.request.Request(f"{COMFY_LOCAL}/prompt", data=payload,
                                 headers={"Content-Type": "application/json"})
    resp = urllib.request.urlopen(req, timeout=10)
    pid = json.loads(resp.read())["prompt_id"]

    deadline = time.time() + 240
    while time.time() < deadline:
        try:
            r = urllib.request.urlopen(f"{COMFY_LOCAL}/history/{pid}", timeout=5)
            entry = json.loads(r.read()).get(pid, {})
            if entry.get("status", {}).get("completed"):
                for out in entry.get("outputs", {}).values():
                    for img in out.get("images", []):
                        url = f"{COMFY_LOCAL}/view?filename={img['filename']}&subfolder={img.get('subfolder','')}&type={img.get('type','output')}"
                        return urllib.request.urlopen(url).read()
                break
        except Exception:
            pass
        time.sleep(2)
    raise TimeoutError("Local stacked FLUX timed out")


def flux_cloud(prompt: str, w: int, h: int, seed: int, lora_scale: float, steps: int) -> bytes:
    aspect = f"{w}:{h}"  # Replicate uses ratio strings; fall back to closest preset
    aspect_map = {(1024, 1024): "1:1", (1344, 768): "16:9", (768, 1344): "9:16",
                  (1152, 896): "4:3", (896, 1152): "3:4", (1536, 640): "21:9"}
    ratio = aspect_map.get((w, h), "1:1")
    output = replicate.run(FLUX_REPLICATE, input={
        "prompt": prompt,
        "lora_scale": lora_scale,
        "num_inference_steps": steps,
        "guidance_scale": 3.5,
        "aspect_ratio": ratio,
        "output_format": "png",
        "output_quality": 95,
        "seed": seed,
    })
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


# ---------- Face match (PuLID) ----------

def face_cloud(prompt: str, ref_path: Path, w: int, h: int, seed: int,
               id_weight: float, steps: int) -> bytes:
    """Cloud face match via zsxkib/flux-pulid.
    NOTE: cloud path runs vanilla FLUX-dev + PuLID; the alabo_eye LoRA is NOT
    applied (Replicate's packaged model doesn't accept extra LoRAs).
    For face + alabo_eye style stacked, use --backend local."""
    with open(ref_path, "rb") as f:
        output = replicate.run(PULID_REPLICATE, input={
            "prompt": prompt,
            "main_face_image": f,
            "width": w,
            "height": h,
            "id_weight": id_weight,
            "guidance_scale": 4.0,
            "num_steps": min(steps, 20),  # PuLID model caps at 20
            "num_outputs": 1,
            "output_format": "png",
            "seed": seed,
        })
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


def face_local(prompt: str, ref_path: Path, w: int, h: int, seed: int,
               id_weight: float, steps: int) -> bytes:
    """Local face match via ComfyUI workflow_flux_face_alabo (FLUX-dev +
    alabo_eye LoRA + PuLID stacked). Copies the reference image into
    ComfyUI's input/ folder so LoadImage can find it."""
    import shutil
    # Copy ref into ComfyUI input dir under a known filename
    COMFY_INPUT_DIR.mkdir(parents=True, exist_ok=True)
    ref_in_comfy = COMFY_INPUT_DIR / "face_ref.png"
    shutil.copy2(ref_path, ref_in_comfy)

    raw = json.load(open(FACE_WORKFLOW))
    wf = {k: {"class_type": v["class_type"], "inputs": dict(v["inputs"])}
          for k, v in raw.items() if not k.startswith("_")}
    wf["5"]["inputs"]["text"] = prompt
    wf["7"]["inputs"]["width"] = w
    wf["7"]["inputs"]["height"] = h
    wf["8"]["inputs"]["seed"] = seed
    wf["8"]["inputs"]["steps"] = steps
    wf["16"]["inputs"]["weight"] = id_weight
    wf["15"]["inputs"]["image"] = "face_ref.png"

    payload = json.dumps({"prompt": wf, "client_id": "gen_face"}).encode()
    req = urllib.request.Request(f"{COMFY_LOCAL}/prompt", data=payload,
                                 headers={"Content-Type": "application/json"})
    resp = urllib.request.urlopen(req, timeout=10)
    pid = json.loads(resp.read())["prompt_id"]

    deadline = time.time() + 240
    while time.time() < deadline:
        try:
            r = urllib.request.urlopen(f"{COMFY_LOCAL}/history/{pid}", timeout=5)
            entry = json.loads(r.read()).get(pid, {})
            if entry.get("status", {}).get("completed"):
                for out in entry.get("outputs", {}).values():
                    for img in out.get("images", []):
                        url = f"{COMFY_LOCAL}/view?filename={img['filename']}&subfolder={img.get('subfolder','')}&type={img.get('type','output')}"
                        return urllib.request.urlopen(url).read()
                break
        except Exception:
            pass
        time.sleep(2)
    raise TimeoutError("Local ComfyUI face workflow did not return an image")


def flux_local(prompt: str, w: int, h: int, seed: int, lora_scale: float, steps: int) -> bytes:
    """POST a workflow to local ComfyUI's /prompt endpoint, wait for output."""
    wf_path = Path("/home/sphinxy/Feedback/comfyui/workflow_flux_bootstrap_alabo.json")
    raw = json.load(open(wf_path))
    wf = {k: {"class_type": v["class_type"], "inputs": dict(v["inputs"])}
          for k, v in raw.items() if not k.startswith("_")}
    wf["10"]["inputs"]["text"] = prompt
    wf["50"]["inputs"]["seed"] = seed
    wf["50"]["inputs"]["steps"] = steps
    wf["40"]["inputs"]["width"] = w
    wf["40"]["inputs"]["height"] = h
    if "5" in wf:
        wf["5"]["inputs"]["strength_model"] = lora_scale

    payload = json.dumps({"prompt": wf, "client_id": "gen"}).encode()
    req = urllib.request.Request(f"{COMFY_LOCAL}/prompt", data=payload,
                                 headers={"Content-Type": "application/json"})
    resp = urllib.request.urlopen(req, timeout=10)
    pid = json.loads(resp.read())["prompt_id"]

    deadline = time.time() + 180
    while time.time() < deadline:
        try:
            r = urllib.request.urlopen(f"{COMFY_LOCAL}/history/{pid}", timeout=5)
            d = json.loads(r.read())
            entry = d.get(pid, {})
            if entry.get("status", {}).get("completed"):
                imgs = []
                for out in entry.get("outputs", {}).values():
                    imgs.extend(out.get("images", []))
                if imgs:
                    img = imgs[0]
                    url = f"{COMFY_LOCAL}/view?filename={img['filename']}&subfolder={img.get('subfolder','')}&type={img.get('type','output')}"
                    return urllib.request.urlopen(url).read()
                break
        except Exception:
            pass
        time.sleep(1.5)
    raise TimeoutError("Local ComfyUI did not return an image in time")


# ---------- Video (cloud) ----------
#
# Image-to-video output aspect = input image aspect. For 9:16 video, generate
# a 9:16 alabo_eye image first via `gen.py flux --aspect 9:16`, then pass it
# here as --ref.

VIDEO_QUALITY = {
    "fast":      ("wan-video/wan-2.2-i2v-fast",     "480p,  ~$0.30/clip"),
    "standard":  ("bytedance/seedance-1-lite",      "720p,  ~$0.40/clip"),
    "high":      ("bytedance/seedance-1-pro",       "1080p, ~$0.60-1/clip"),
    "seedance2": ("bytedance/seedance-2.0",         "720p+ with native audio + multimodal refs, ~$0.50-1.50/clip"),
    "hailuo":    ("minimax/hailuo-02",              "720p+, ~$0.50/clip"),
    "veo":       ("google/veo-3-fast",              "1080p, ~$0.40-0.80/clip"),
    "runway":    ("runwayml/gen4-turbo",            "720p,  ~$1-2/clip"),
}


def video_local_wan(prompt: str, ref_path: Path, w: int, h: int,
                    num_frames: int, seed: int, steps: int) -> bytes:
    """Local Wan 2.2 VACE i2v via ComfyUI workflow_wan22_vace_local.json.
    Copies ref into ComfyUI input/, submits API workflow, waits, fetches mp4."""
    import shutil
    COMFY_INPUT_DIR.mkdir(parents=True, exist_ok=True)
    ref_in = COMFY_INPUT_DIR / "wan_ref.png"
    shutil.copy2(ref_path, ref_in)

    raw = json.load(open(WAN_LOCAL_WORKFLOW))
    wf = {k: {"class_type": v["class_type"], "inputs": dict(v["inputs"])}
          for k, v in raw.items() if not k.startswith("_")}
    wf["10"]["inputs"]["image"] = "wan_ref.png"
    wf["20"]["inputs"]["positive_prompt"] = prompt
    wf["30"]["inputs"]["width"] = w
    wf["30"]["inputs"]["height"] = h
    wf["30"]["inputs"]["num_frames"] = num_frames
    wf["40"]["inputs"]["seed"] = seed
    wf["40"]["inputs"]["steps"] = steps

    payload = json.dumps({"prompt": wf, "client_id": "gen_wan"}).encode()
    req = urllib.request.Request(f"{COMFY_LOCAL}/prompt", data=payload,
                                 headers={"Content-Type": "application/json"})
    resp = urllib.request.urlopen(req, timeout=15)
    pid = json.loads(resp.read())["prompt_id"]

    deadline = time.time() + 1200  # local Wan can take 5-15 min
    while time.time() < deadline:
        try:
            r = urllib.request.urlopen(f"{COMFY_LOCAL}/history/{pid}", timeout=5)
            entry = json.loads(r.read()).get(pid, {})
            if entry.get("status", {}).get("completed"):
                for out in entry.get("outputs", {}).values():
                    for vid in out.get("gifs", []) + out.get("videos", []):
                        url = f"{COMFY_LOCAL}/view?filename={vid['filename']}&subfolder={vid.get('subfolder','')}&type={vid.get('type','output')}"
                        return urllib.request.urlopen(url).read()
                break
        except Exception:
            pass
        time.sleep(5)
    raise TimeoutError("Local Wan VACE timed out (>20 min)")


def video_cloud(prompt: str, ref_path: Path, driving_path: Path | None,
                duration: int, quality: str) -> bytes:
    """Image-to-video. If driving_path given, route to Kling Omni for true
    character swap. Otherwise use the selected quality tier."""
    if driving_path:
        # Character swap with driving video — Kling Omni
        with open(ref_path, "rb") as r, open(driving_path, "rb") as d:
            output = replicate.run("kwaivgi/kling-v3-omni-video",
                                   input={"image": r, "video": d, "prompt": prompt})
    else:
        model, _ = VIDEO_QUALITY[quality]
        # Different models have slightly different input names; build per-model
        with open(ref_path, "rb") as r:
            inputs = {"image": r, "prompt": prompt, "duration": duration}
            output = replicate.run(model, input=inputs)
    url = output if isinstance(output, str) else (output[0] if isinstance(output, list) else str(output))
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


# ---------- Upscale + face restoration (cloud) ----------

def upscale_cloud(image_path: Path, scale: int, dynamic: float, creativity: float,
                  resemblance: float, sharpen: float, prompt: str, seed: int,
                  editorial: bool = False) -> bytes:
    """Cloud upscale via philz1337x/clarity-upscaler. Adds detail at higher res.
    scale = 2 or 4 (multiplier). Resemblance high = more like input; low = more
    creative reinterpretation. Creativity high = adds more new detail.
    editorial=True uses fashion-editorial-tuned default prompt + negative."""
    if editorial:
        default_prompt = "fashion editorial photograph, natural skin texture, real skin pores, " \
                         "photographic, sharp focus where naturally focused, magazine quality"
        default_negative = "(worst quality, low quality, normal quality:2), blurry, oversmooth, " \
                          "plastic skin, waxy skin, oversharpened, halo artifacts, hdr, " \
                          "instagram filter, beauty filter, airbrushed"
    else:
        default_prompt = "masterpiece, best quality, highres, detailed skin, sharp focus"
        default_negative = "(worst quality, low quality, normal quality:2), blurry, oversmooth"

    with open(image_path, "rb") as f:
        output = replicate.run(UPSCALE_REPLICATE, input={
            "image": f,
            "scale_factor": float(scale),
            "dynamic": dynamic,
            "creativity": creativity,
            "resemblance": resemblance,
            "sharpen": sharpen,
            "prompt": prompt or default_prompt,
            "negative_prompt": default_negative,
            "seed": seed,
            "num_inference_steps": 18,
            "output_format": "png",
        })
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


def supir_cloud(image_path: Path, scale: int, s_cfg: float, s_stage2: float,
                prompt: str, seed: int) -> bytes:
    """Cloud upscale via cjwbw/supir. State-of-the-art photoreal restoration.
    Recovers skin pores, fabric weave, hair micro-detail. Best for hero deliverables.
    scale       = 1-8 multiplier (2 default)
    s_cfg       = ~3-7 (lower = preserves source, higher = more creative reinterpretation)
    s_stage2    = 0.5-1.0 (second-stage denoising; 1.0 = full detail recovery)
    Cost: ~$0.10-0.20/image. ~30-60s round-trip."""
    a_prompt = (prompt or "") + (
        ", cinematic, high contrast, highly detailed, "
        "natural skin texture, real skin pores, fine fabric weave, "
        "photorealistic, sharp focus where naturally focused, taken on Canon EOS R5, no plastic"
    )
    n_prompt = (
        "painting, oil painting, illustration, drawing, art, sketch, "
        "anime, cartoon, cg style, 3d render, plastic skin, smooth skin, "
        "waxy skin, airbrushed, beauty filter, instagram filter, "
        "deformed, ugly, blurry, low resolution"
    )
    with open(image_path, "rb") as f:
        output = replicate.run(SUPIR_REPLICATE, input={
            "image": f,
            "upscale": int(scale),
            "s_cfg": float(s_cfg),
            "s_stage1": -1.0,
            "s_stage2": float(s_stage2),
            "s_churn": 5,
            "s_noise": 1.003,
            "color_fix_type": "Wavelet",
            "linear_CFG": True,
            "linear_s_stage2": False,
            "spt_linear_CFG": 1.0,
            "spt_linear_s_stage2": 0.0,
            "edm_steps": 50,
            "a_prompt": a_prompt,
            "n_prompt": n_prompt,
            "seed": seed,
            "min_size": 1024,
        })
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


def gfpgan_face_restore(image_path: Path, version: str = "v1.4", scale: int = 2) -> bytes:
    """Run GFPGAN face restoration on an image. Sharpens face, fixes artifacts."""
    with open(image_path, "rb") as f:
        output = replicate.run(GFPGAN_REPLICATE, input={
            "img": f,
            "version": version,
            "scale": float(scale),
        })
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


def crop_to_aspect(image_bytes: bytes, target_aspect: str) -> bytes:
    """Crop image to a target aspect ratio (e.g., '9:16', '16:9'). Center crop."""
    import io
    from PIL import Image as _Image
    aspect_map = {
        "1:1": 1.0, "16:9": 16/9, "9:16": 9/16,
        "4:3": 4/3, "3:4": 3/4, "21:9": 21/9, "3:2": 3/2, "2:3": 2/3,
    }
    target = aspect_map.get(target_aspect)
    if not target:
        return image_bytes
    im = _Image.open(io.BytesIO(image_bytes))
    w, h = im.size
    current = w / h
    if abs(current - target) < 0.01:
        return image_bytes  # already at target
    if current > target:
        # too wide — crop sides
        new_w = int(h * target)
        left = (w - new_w) // 2
        im = im.crop((left, 0, left + new_w, h))
    else:
        # too tall — crop top/bottom
        new_h = int(w / target)
        top = (h - new_h) // 2
        im = im.crop((0, top, w, top + new_h))
    buf = io.BytesIO()
    im.save(buf, "PNG")
    return buf.getvalue()


# ---------- ElevenLabs voice clone ----------

def elevenlabs_tts(text: str, voice_id: str, model: str = "eleven_multilingual_v2",
                   stability: float = 0.5, similarity_boost: float = 0.75,
                   style: float = 0.0) -> bytes:
    """Generate speech audio (mp3) from text using an ElevenLabs cloned voice.
    Requires ELEVENLABS_API_KEY env var."""
    import requests
    api_key = os.environ.get("ELEVENLABS_API_KEY", "")
    if not api_key:
        raise RuntimeError("ELEVENLABS_API_KEY not set. Get one at https://elevenlabs.io/app/api-keys")
    if not voice_id:
        raise RuntimeError("voice_id missing — clone a voice at https://elevenlabs.io/voice-cloning, paste ID into Boveda character JSON")
    r = requests.post(
        f"https://api.elevenlabs.io/v1/text-to-speech/{voice_id}",
        headers={"xi-api-key": api_key, "Content-Type": "application/json"},
        json={
            "text": text,
            "model_id": model,
            "voice_settings": {
                "stability": stability,
                "similarity_boost": similarity_boost,
                "style": style,
                "use_speaker_boost": True,
            }
        },
        timeout=120,
    )
    r.raise_for_status()
    return r.content


def mux_audio_onto_video(video_path: Path, audio_path: Path, out_path: Path) -> Path:
    """Replace video's audio track with given audio (or add if none)."""
    import subprocess
    subprocess.run(
        ["ffmpeg", "-y", "-i", str(video_path), "-i", str(audio_path),
         "-c:v", "copy", "-c:a", "aac", "-map", "0:v:0", "-map", "1:a:0",
         "-shortest", str(out_path)],
        check=True, capture_output=True
    )
    return out_path


# ---------- Virtual try-on (clothing transfer) ----------

def vton_cloud(human_path: Path, garment_path: Path, category: str,
               garment_des: str, seed: int, steps: int, crop: bool) -> bytes:
    """IDM-VTON on Replicate. Best-in-class garment swap.
    human_path: photo of the person (best at 3:4 aspect, else use crop=True).
    garment_path: flat-lay or product image of the garment alone.
    category: upper_body | lower_body | dresses."""
    with open(human_path, "rb") as h, open(garment_path, "rb") as g:
        output = replicate.run(VTON_REPLICATE, input={
            "human_img": h,
            "garm_img": g,
            "category": category,
            "garment_des": garment_des or "",
            "seed": seed,
            "steps": steps,
            "crop": crop,
            "force_dc": False,
            "mask_only": False,
        })
    url = output[0] if isinstance(output, list) else str(output)
    if hasattr(url, "url"): url = url.url
    return urllib.request.urlopen(str(url)).read()


# ---------- Frame chaining (character-locked extension) ----------
#
# Music video workflow: generate N segments, each starting from the previous
# segment's last frame. Stitches all into one long character-consistent clip.

def extract_last_frame(video_path: Path, out_path: Path) -> Path:
    """Pull the last frame of an mp4 as a PNG using ffmpeg."""
    import subprocess
    # -sseof seeks from end; -update writes single image
    subprocess.run(
        ["ffmpeg", "-y", "-sseof", "-0.1", "-i", str(video_path),
         "-vsync", "0", "-frames:v", "1", "-update", "1", str(out_path)],
        check=True, capture_output=True
    )
    return out_path


def stitch_videos(parts: list[Path], out_path: Path) -> Path:
    """Concatenate mp4 segments into one continuous mp4."""
    import subprocess
    list_file = out_path.with_suffix(".concat.txt")
    list_file.write_text("\n".join(f"file '{p.absolute()}'" for p in parts))
    subprocess.run(
        ["ffmpeg", "-y", "-f", "concat", "-safe", "0", "-i", str(list_file),
         "-c", "copy", str(out_path)],
        check=True, capture_output=True
    )
    list_file.unlink()
    return out_path


def video_cloud_chained(prompt: str, ref_path: Path, duration: int,
                        quality: str, chain: int, ts: int) -> Path:
    """Generate N segments, each continuing from the previous segment's last
    frame. Stitch into one character-consistent clip."""
    parts: list[Path] = []
    current_ref = ref_path
    for i in range(chain):
        print(f"  [chain {i+1}/{chain}] ref={current_ref.name}")
        data = video_cloud(prompt, current_ref, None, duration, quality)
        seg = OUT_DIR / f"video_{quality}_{ts}_seg{i:02d}.mp4"
        seg.write_bytes(data)
        parts.append(seg)
        if i + 1 < chain:
            # Extract last frame as the next segment's starting reference
            next_ref = OUT_DIR / f"video_{quality}_{ts}_seg{i:02d}_lastframe.png"
            extract_last_frame(seg, next_ref)
            current_ref = next_ref
    stitched = OUT_DIR / f"video_{quality}_{ts}_chained.mp4"
    stitch_videos(parts, stitched)
    return stitched


# ---------- driver ----------

def main() -> int:
    if not os.environ.get("REPLICATE_API_TOKEN"):
        print("ERROR: REPLICATE_API_TOKEN not set", file=sys.stderr)
        return 1

    ap = argparse.ArgumentParser()
    ap.add_argument("mode", choices=["flux", "wan", "vton", "upscale"])
    ap.add_argument("--backend", choices=["cloud", "local"], default="cloud")
    ap.add_argument("--prompt", required=False, default="")
    ap.add_argument("--variations", type=int, default=1, help="batch size (FLUX only; varies seed)")
    ap.add_argument("--seed", type=int, default=42)
    ap.add_argument("--lora-scale", type=float, default=1.0)
    # Boveda character — auto-stacks LoRAs, prepends triggers, sets defaults
    ap.add_argument("--character", default=None,
                    help="Boveda character name (e.g. 'ubani'). Auto-stacks alabo_eye + ubani LoRAs, prepends triggers.")
    ap.add_argument("--char-scale", type=float, default=1.0,
                    help="Strength for the character LoRA when stacking (default 1.0)")
    ap.add_argument("--steps", type=int, default=28)
    # FLUX dimension presets
    ap.add_argument("--aspect", default="1:1", choices=["1:1","16:9","9:16","4:3","3:4","21:9"])
    ap.add_argument("--size", default="full", choices=["draft","full","big"])
    # Face match (PuLID) — when --face is set, FLUX mode swaps to face workflow
    ap.add_argument("--face", type=Path, default=None,
                    help="Reference face image (FLUX mode). Cloud=PuLID-FLUX (no alabo_eye), Local=face+alabo_eye stacked")
    ap.add_argument("--id-weight", type=float, default=0.9,
                    help="Face identity strength (0.0-1.5). 0.9 = strong, 0.6 = looser")
    # Wan / video
    ap.add_argument("--ref", type=Path, help="Reference image (video). Output aspect = ref aspect.")
    ap.add_argument("--driving", type=Path, help="Driving video (forces Kling Omni character-swap path)")
    ap.add_argument("--duration", type=int, default=5)
    ap.add_argument("--quality", default="high",
                    choices=list(VIDEO_QUALITY.keys()),
                    help="Video quality tier (ignored when --driving is set)")
    ap.add_argument("--chain", type=int, default=1,
                    help="Generate N segments, each continuing from prev segment's last frame. "
                         "Stitches into one character-locked clip. 1 = no chaining (default)")
    # VTON (virtual try-on)
    ap.add_argument("--garment", type=Path, default=None,
                    help="Garment image (vton mode). Best as flat-lay/product photo, no person.")
    ap.add_argument("--category", default="upper_body",
                    choices=["upper_body", "lower_body", "dresses"],
                    help="Garment category (vton mode)")
    ap.add_argument("--vton-crop", action="store_true",
                    help="Crop human image to 3:4 aspect (vton mode). Use if your human image isn't already 3:4.")
    # Upscale mode
    ap.add_argument("--input", type=Path, default=None,
                    help="Input image for upscale mode")
    ap.add_argument("--preset", default=None,
                    choices=["sharp", "detail", "hero", "subtle", "editorial", "supir"],
                    help="Named preset: sharp/detail/hero/subtle/editorial use clarity-upscaler; supir = top-tier photoreal restoration via cjwbw/supir (best for hero deliverables, ~$0.10-0.20)")
    ap.add_argument("--tier", default=None, choices=["clarity", "supir"],
                    help="Cloud upscale backend. clarity = philz1337x/clarity-upscaler (default). supir = cjwbw/supir (state of the art photoreal restoration). Overrides preset.")
    ap.add_argument("--supir-cfg", type=float, default=None,
                    help="SUPIR s_cfg (3-7). Lower = more faithful to source. Default 4.0.")
    ap.add_argument("--supir-stage2", type=float, default=None,
                    help="SUPIR s_stage2 (0.5-1.0). Higher = more detail recovery. Default 1.0.")
    ap.add_argument("--scale", type=int, default=None, choices=[2, 4],
                    help="Upscale multiplier (2x or 4x). Overrides preset.")
    ap.add_argument("--target-aspect", default=None,
                    choices=[None, "1:1", "16:9", "9:16", "4:3", "3:4", "21:9", "3:2", "2:3"],
                    help="Optional: crop result to this aspect ratio (center crop). Stacks with any preset.")
    ap.add_argument("--face-restore", action="store_true", default=None,
                    help="Run GFPGAN face restoration after upscale. Overrides preset.")
    ap.add_argument("--no-face-restore", dest="face_restore", action="store_false",
                    help="Skip face restoration even if preset enables it")
    ap.add_argument("--retouch-creativity", type=float, default=None,
                    help="0.3 = subtle, 0.6 = moderate, 0.9 = aggressive. Overrides preset.")
    ap.add_argument("--retouch-resemblance", type=float, default=None,
                    help="0.6 = balanced, 1.0 = stay close to input, 0.3 = creative reinterpretation. Overrides preset.")
    ap.add_argument("--retouch-sharpen", type=float, default=None,
                    help="Sharpening 0-1. Overrides preset.")
    ap.add_argument("--retouch-dynamic", type=float, default=None,
                    help="HDR dynamic range 3-9. Overrides preset.")
    # ElevenLabs voice (video modes)
    ap.add_argument("--voice-text", default=None,
                    help="If set on video gen, generate ElevenLabs voice-cloned audio of this text and mux onto video. Voice ID resolved from --character or --voice-id.")
    ap.add_argument("--voice-id", default=None,
                    help="ElevenLabs voice ID. Overrides character's voice. Get from https://elevenlabs.io")
    args = ap.parse_args()

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    ts = int(time.time())

    # Resolve Boveda character early — overrides defaults if --character set
    char_obj = None
    char_stack = []
    if args.character:
        if not BOVEDA_AVAILABLE:
            print("ERROR: Boveda registry not available", file=sys.stderr)
            return 1
        try:
            char_stack = resolve_stack(args.character)
            char_obj = char_stack[-1]  # the requested character is last
        except FileNotFoundError as e:
            print(f"ERROR: {e}", file=sys.stderr)
            print(f"Available: {list_characters()}", file=sys.stderr)
            return 1
        if not char_obj.trained:
            print(f"WARNING: {char_obj.name} LoRA is not yet trained — see character JSON")
        # Apply character defaults if user didn't override
        if args.aspect == "1:1" and char_obj.preferred_aspect != "1:1":
            args.aspect = char_obj.preferred_aspect
        if char_obj.default_prompt_prefix and not args.prompt.startswith(char_obj.default_prompt_prefix):
            args.prompt = f"{char_obj.default_prompt_prefix} {args.prompt}".strip()
        print(f"Character: {char_obj.display_name}  stack: {[c.name for c in char_stack]}")

    if args.mode == "flux":
        dims = DIMS.get((args.aspect, args.size))
        if not dims:
            print(f"ERROR: no preset for {args.aspect} × {args.size}", file=sys.stderr)
            return 1
        w, h = dims
        if args.backend == "local":
            try:
                assert_local_safe(w, h, args.aspect, args.size)
            except ValueError as e:
                print(f"ERROR: {e}", file=sys.stderr)
                return 1

        # Face mode (PuLID) — overrides plain FLUX path when --face provided
        if args.face:
            if not args.face.exists():
                print(f"ERROR: face reference not found: {args.face}", file=sys.stderr)
                return 1
            label = "PuLID-FLUX (no alabo_eye style)" if args.backend == "cloud" else "FLUX-dev + alabo_eye + PuLID"
            print(f"FACE {args.backend} · {w}×{h} · {label} · id_weight {args.id_weight} · {args.variations} variation(s)")
            print(f"  ref:    {args.face.name}")
            print(f"  prompt: {args.prompt[:100]}")
            for i in range(args.variations):
                seed = args.seed + i
                print(f"  [{i+1}/{args.variations}] seed={seed}", end=" ", flush=True)
                try:
                    if args.backend == "cloud":
                        data = face_cloud(args.prompt, args.face, w, h, seed, args.id_weight, args.steps)
                    else:
                        data = face_local(args.prompt, args.face, w, h, seed, args.id_weight, args.steps)
                    dst = OUT_DIR / f"face_{ts}_{i:02d}_s{seed}.png"
                    dst.write_bytes(data)
                    print(f"→ {dst.name}")
                except Exception as e:
                    print(f"FAIL: {e}")
            return 0

        # Character mode (multi-LoRA stack) — different code path
        if char_obj:
            label = f"{args.backend} stacked {[c.name for c in char_stack]}"
            print(f"FLUX {label} · {w}×{h} · {args.variations} variation(s)")
            print(f"  prompt: {args.prompt[:100]}")
            for i in range(args.variations):
                seed = args.seed + i
                print(f"  [{i+1}/{args.variations}] seed={seed}", end=" ", flush=True)
                try:
                    if args.backend == "cloud":
                        # Find the style LoRA (already-baked) and the character LoRA (extra_lora)
                        style_chars = [c for c in char_stack if c.type == "style" and c.replicate_ref]
                        non_style = [c for c in char_stack if c.type != "style" and c.trained]
                        if style_chars:
                            primary = style_chars[0].replicate_ref
                            # extra_lora wants 'owner/name/version' form (slash not colon)
                            extra = None
                            if non_style:
                                dest = non_style[0].lora.get("replicate_destination")
                                ver = non_style[0].lora.get("replicate_version")
                                if dest and ver:
                                    extra = f"{dest}/{ver}"
                                elif dest:
                                    extra = dest
                        else:
                            primary = char_obj.replicate_ref or FLUX_REPLICATE
                            extra = None
                        data = flux_cloud_with_character(args.prompt, w, h, seed, args.steps,
                                                         primary, extra, args.lora_scale, args.char_scale)
                    else:
                        # Local: chain all LoRAs from the stack via filename
                        stack_pairs = []
                        for c in char_stack:
                            fname = Path(c.lora.get("wsl_local", "")).name
                            scale = args.char_scale if c.name == args.character else args.lora_scale
                            if fname:
                                stack_pairs.append((fname, scale))
                        data = flux_local_stacked(args.prompt, w, h, seed, args.steps, stack_pairs)
                    dst = OUT_DIR / f"char_{args.character}_{ts}_{i:02d}_s{seed}.png"
                    dst.write_bytes(data)
                    print(f"→ {dst.name}")
                except Exception as e:
                    print(f"FAIL: {e}")
            return 0

        print(f"FLUX {args.backend} · {w}×{h} · LoRA {args.lora_scale} · {args.variations} variation(s)")
        print(f"  prompt: {args.prompt[:100]}")
        for i in range(args.variations):
            seed = args.seed + i
            print(f"  [{i+1}/{args.variations}] seed={seed}", end=" ", flush=True)
            try:
                if args.backend == "cloud":
                    data = flux_cloud(args.prompt, w, h, seed, args.lora_scale, args.steps)
                else:
                    data = flux_local(args.prompt, w, h, seed, args.lora_scale, args.steps)
                dst = OUT_DIR / f"flux_{ts}_{i:02d}_s{seed}.png"
                dst.write_bytes(data)
                print(f"→ {dst.name}")
            except Exception as e:
                print(f"FAIL: {e}")
        return 0

    # UPSCALE — cloud-based, with optional face restoration + aspect crop
    if args.mode == "upscale":
        if not args.input:
            print("ERROR: --input required (path to image to upscale)", file=sys.stderr)
            return 1
        if not args.input.exists():
            print(f"ERROR: image not found: {args.input}", file=sys.stderr)
            return 1
        if args.backend != "cloud":
            print("ERROR: upscale local backend lives in ComfyUI (UPSCALE_face_fidelity.json). Use --backend cloud here.", file=sys.stderr)
            return 1

        # Apply preset defaults — explicit flags override
        PRESETS = {
            "sharp":     {"tier": "clarity", "scale": 2, "face_restore": True,  "creativity": 0.30, "resemblance": 0.80, "sharpen": 0.5, "dynamic": 6.0},
            "detail":    {"tier": "clarity", "scale": 2, "face_restore": True,  "creativity": 0.50, "resemblance": 0.60, "sharpen": 0.5, "dynamic": 6.0},
            "hero":      {"tier": "clarity", "scale": 4, "face_restore": True,  "creativity": 0.40, "resemblance": 0.70, "sharpen": 0.6, "dynamic": 7.0},
            "subtle":    {"tier": "clarity", "scale": 2, "face_restore": False, "creativity": 0.20, "resemblance": 0.90, "sharpen": 0.3, "dynamic": 5.0},
            # Editorial: fashion-editorial skin fidelity. No GFPGAN (which can plasticize skin).
            # Low creativity + high resemblance keep natural skin texture. Low sharpen avoids
            # crispy artifacts. Low dynamic avoids HDR-look. Add editorial keywords via --prompt.
            "editorial": {"tier": "clarity", "scale": 2, "face_restore": False, "creativity": 0.30, "resemblance": 0.85, "sharpen": 0.2, "dynamic": 4.5},
            # SUPIR: top-tier photoreal restoration. Recovers skin pores / fabric weave / hair micro-detail.
            # Best for Sembla brand pilot deliverables and hero shots. Costs ~$0.10-0.20 per image.
            "supir":     {"tier": "supir",   "scale": 2, "face_restore": False, "s_cfg": 4.0, "s_stage2": 1.0},
        }
        preset_cfg = PRESETS.get(args.preset, {}) if args.preset else {}
        tier        = args.tier if args.tier is not None else preset_cfg.get("tier", "clarity")
        scale       = args.scale if args.scale is not None else preset_cfg.get("scale", 2)
        face_restore= args.face_restore if args.face_restore is not None else preset_cfg.get("face_restore", False)
        creativity  = args.retouch_creativity if args.retouch_creativity is not None else preset_cfg.get("creativity", 0.35)
        resemblance = args.retouch_resemblance if args.retouch_resemblance is not None else preset_cfg.get("resemblance", 0.60)
        sharpen     = args.retouch_sharpen if args.retouch_sharpen is not None else preset_cfg.get("sharpen", 0.5)
        dynamic     = args.retouch_dynamic if args.retouch_dynamic is not None else preset_cfg.get("dynamic", 6.0)
        s_cfg       = args.supir_cfg if args.supir_cfg is not None else preset_cfg.get("s_cfg", 4.0)
        s_stage2    = args.supir_stage2 if args.supir_stage2 is not None else preset_cfg.get("s_stage2", 1.0)

        preset_label = f"preset={args.preset} · " if args.preset else ""
        if tier == "supir":
            print(f"UPSCALE cloud · {preset_label}tier=SUPIR · scale {scale}x · " +
                  (f"target_aspect={args.target_aspect} " if args.target_aspect else "") +
                  f"s_cfg={s_cfg} s_stage2={s_stage2}")
        else:
            print(f"UPSCALE cloud · {preset_label}tier=clarity · scale {scale}x · " +
                  (f"target_aspect={args.target_aspect} " if args.target_aspect else "") +
                  (f"+ face_restore " if face_restore else "") +
                  f"creativity={creativity} resemblance={resemblance}")
        print(f"  input: {args.input.name}")

        # Step 1: main upscale (tier-dependent)
        try:
            if tier == "supir":
                print(f"  [1] cjwbw/supir {scale}x... (~30-60s, ~$0.10-0.20)")
                data = supir_cloud(
                    args.input, scale, s_cfg, s_stage2,
                    args.prompt or "", args.seed,
                )
            else:
                print(f"  [1] clarity-upscaler {scale}x...")
                data = upscale_cloud(
                    args.input, scale,
                    dynamic, creativity, resemblance, sharpen,
                    args.prompt, args.seed,
                    editorial=(args.preset == "editorial"),
                )
        except Exception as e:
            print(f"  FAIL {tier}: {e}", file=sys.stderr)
            return 1

        # Step 2: optional face restoration (GFPGAN)
        if face_restore:
            print(f"  [2] GFPGAN face restoration...")
            tmp = OUT_DIR / f"_tmp_pre_gfpgan_{ts}.png"
            tmp.write_bytes(data)
            try:
                data = gfpgan_face_restore(tmp, version="v1.4", scale=1)
            except Exception as e:
                print(f"  FAIL gfpgan: {e}", file=sys.stderr)
            tmp.unlink(missing_ok=True)

        # Step 3: optional aspect crop
        if args.target_aspect:
            print(f"  [3] cropping to {args.target_aspect}...")
            try:
                data = crop_to_aspect(data, args.target_aspect)
            except Exception as e:
                print(f"  FAIL crop: {e}", file=sys.stderr)

        # Save
        suffix = f"_{scale}x"
        if tier == "supir" and args.preset != "supir":
            suffix = f"_supir{suffix}"
        if args.preset: suffix = f"_{args.preset}{suffix}"
        if face_restore: suffix += "_face"
        if args.target_aspect: suffix += f"_{args.target_aspect.replace(':','x')}"
        dst = OUT_DIR / f"upscale_{args.input.stem}{suffix}_{ts}.png"
        dst.write_bytes(data)
        print(f"-> {dst}")
        return 0

    # VTON (IDM-VTON virtual try-on) — clothing swap
    if args.mode == "vton":
        if not args.ref:
            print("ERROR: --ref required (the person/human image)", file=sys.stderr)
            return 1
        if not args.garment:
            print("ERROR: --garment required (the clothing image, ideally flat-lay)", file=sys.stderr)
            return 1
        if not args.ref.exists() or not args.garment.exists():
            print(f"ERROR: image not found", file=sys.stderr)
            return 1
        if args.backend != "cloud":
            print("VTON local backend not wired. Use --backend cloud (default).", file=sys.stderr)
            return 1
        print(f"VTON cloud · IDM-VTON · category={args.category}")
        print(f"  human:   {args.ref.name}")
        print(f"  garment: {args.garment.name}")
        if args.prompt:
            print(f"  desc:    {args.prompt[:80]}")
        for i in range(args.variations):
            seed = args.seed + i
            print(f"  [{i+1}/{args.variations}] seed={seed}", end=" ", flush=True)
            try:
                data = vton_cloud(args.ref, args.garment, args.category,
                                  args.prompt, seed, args.steps, args.vton_crop)
                dst = OUT_DIR / f"vton_{ts}_{i:02d}_s{seed}.png"
                dst.write_bytes(data)
                print(f"→ {dst.name}")
            except Exception as e:
                print(f"FAIL: {e}")
        return 0

    # Video (Wan, Seedance, Hailuo, Veo, Runway, Kling)
    if not args.ref:
        print("ERROR: --ref required for video mode (output aspect = ref image aspect)", file=sys.stderr)
        return 1
    if args.driving:
        model_label = "kling-v3-omni (character swap)"
    else:
        model, info = VIDEO_QUALITY[args.quality]
        model_label = f"{model} ({info})"
    print(f"Video {args.backend} · {model_label} · {args.duration}s")
    print(f"  ref:    {args.ref.name}")
    if args.driving:
        print(f"  drive:  {args.driving.name}")
    print(f"  prompt: {args.prompt[:100]}")
    if args.backend == "cloud":
        if args.chain > 1:
            if args.driving:
                print("ERROR: --chain isn't supported with --driving (Kling Omni doesn't accept frame continuation).", file=sys.stderr)
                return 1
            stitched = video_cloud_chained(args.prompt, args.ref, args.duration,
                                           args.quality, args.chain, ts)
            total_sec = args.duration * args.chain
            print(f"→ {stitched} ({total_sec}s, {args.chain} segments stitched)")
            return 0
        data = video_cloud(args.prompt, args.ref, args.driving, args.duration, args.quality)
    else:
        # Local Wan 2.2 VACE — free per-gen, slow (5-15 min)
        if args.driving:
            print("ERROR: local backend doesn't support --driving (cloud Kling Omni only)", file=sys.stderr)
            return 1
        # Resolve dims from ref aspect
        try:
            from PIL import Image as _Image
            with _Image.open(args.ref) as im:
                w_in, h_in = im.size
        except Exception:
            w_in, h_in = 768, 1344
        # Snap to nearest Wan-trained dim (multiples of 16, ≤1024 for 16GB VRAM)
        if h_in > w_in:
            w, h = 720, 1280
        elif h_in < w_in:
            w, h = 1280, 720
        else:
            w, h = 960, 960
        num_frames = max(min(args.duration * 16 + 1, 81), 33)  # 16 fps * dur + 1
        print(f"  local Wan VACE: {w}×{h}, {num_frames} frames, {args.steps} steps")
        data = video_local_wan(args.prompt, args.ref, w, h, num_frames, args.seed, args.steps)
    dst = OUT_DIR / f"video_{args.quality}_{ts}.mp4"
    dst.write_bytes(data)
    print(f"-> {dst}")
    # Optional: voice-cloned audio mux via ElevenLabs
    if args.voice_text:
        voice_id = args.voice_id or (char_obj.voice_id if char_obj else None)
        if not voice_id:
            print("WARNING: --voice-text given but no voice_id (set --voice-id or use --character with cloned voice)")
        else:
            try:
                print(f"  TTS  → ElevenLabs voice {voice_id[:8]}...")
                audio = elevenlabs_tts(args.voice_text, voice_id)
                audio_path = OUT_DIR / f"voice_{ts}.mp3"
                audio_path.write_bytes(audio)
                muxed = OUT_DIR / f"video_{args.quality}_{ts}_voiced.mp4"
                mux_audio_onto_video(dst, audio_path, muxed)
                print(f"→ {muxed} (with voice)")
            except Exception as e:
                print(f"  voice mux FAIL: {e}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
