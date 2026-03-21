# Feedback AV — ComfyUI Setup Guide

## 1. ComfyUI Installation

ComfyUI is already installed at `D:/Visuals/ComfyUI/`.

### Start ComfyUI
```powershell
cd D:\Visuals\ComfyUI
python main.py --listen 0.0.0.0 --port 8000
```

The `--listen 0.0.0.0` allows WSL2/TD bridge to reach ComfyUI.
Verify: open `http://localhost:8000` in browser.

## 2. Model Setup — FLUX.1 Schnell

FLUX.1 Schnell replaces SDXL Lightning. Same speed (4 steps), massively better quality.

### Download Models (from WSL)
```bash
cd ~/Feedback/comfyui
chmod +x download_flux.sh
./download_flux.sh
```

This downloads (~21GB total):

| File | Size | Location |
|------|------|----------|
| `flux1-schnell-fp8-e4m3fn.safetensors` | ~12GB | `models/diffusion_models/` |
| `clip_l.safetensors` | ~250MB | `models/text_encoders/` |
| `t5xxl_fp8_e4m3fn.safetensors` | ~5GB | `models/text_encoders/` |
| `ae.safetensors` | ~300MB | `models/vae/` |
| `flux-depth-controlnet-v3.safetensors` | ~3.6GB | `models/xlabs/controlnets/` |

### Directory Structure After Download
```
D:\Visuals\ComfyUI\
├── models\
│   ├── diffusion_models\
│   │   ├── sdxl_lightning_4step_unet.safetensors  (legacy)
│   │   └── flux1-schnell-fp8-e4m3fn.safetensors   (NEW — FLUX Schnell)
│   ├── text_encoders\
│   │   ├── clip_l.safetensors                      (NEW — CLIP-L)
│   │   └── t5xxl_fp8_e4m3fn.safetensors            (NEW — T5-XXL fp8)
│   ├── vae\
│   │   └── ae.safetensors                           (NEW — FLUX VAE)
│   ├── xlabs\
│   │   └── controlnets\
│   │       └── flux-depth-controlnet-v3.safetensors (NEW — depth CN)
│   └── checkpoints\
│       └── sdxl_lightning_4step.safetensors          (legacy)
├── input\
│   ├── feedback_frame_prev.png     (written by bridge for img2img)
│   ├── attractor_depth.png         (written by TD for ControlNet)
│   └── anchor_*.png                (latent walk anchors — legacy)
├── output\
│   └── feedback_frame_NNNNN_.png   (generated frames)
└── custom_nodes\
    ├── x-flux-comfyui\             (XLabs — for ControlNet)
    └── comfyui_controlnet_aux\     (preprocessing — for ControlNet)
```

## 3. Custom Nodes (for ControlNet Depth mode)

Required only if using `flux_controlnet` mode. Not needed for basic `flux_img2img`.

```powershell
cd D:\Visuals\ComfyUI\custom_nodes
git clone https://github.com/XLabs-AI/x-flux-comfyui
git clone https://github.com/Fannovel16/comfyui_controlnet_aux
pip install -r x-flux-comfyui\requirements.txt
```

## 4. Workflows

### FLUX Workflows (New)

| Workflow | Purpose | Node IDs the bridge modifies |
|----------|---------|-----|
| `workflow_flux_bootstrap.json` | First frame (txt2img) | 10: prompt, 50: seed |
| `workflow_flux_img2img.json` | Subsequent frames (img2img feedback) | 10: prompt, 50: seed/denoise |
| `workflow_flux_controlnet.json` | + ControlNet Depth | 10: prompt, 50: seed/denoise, 81: CN strength |

### Legacy SDXL Workflows

| Workflow | Purpose |
|----------|---------|
| `workflow_api.json` | SDXL txt2img bootstrap |
| `workflow_img2img_api.json` | SDXL img2img |
| `workflow_latent_walk.json` | SDXL latent interpolation between 3 anchors |

### Testing a Workflow Manually
```python
import json, urllib.request

workflow = json.load(open('workflow_flux_bootstrap.json'))
# Strip _comment and _meta keys
clean = {}
for k, v in workflow.items():
    if not k.startswith("_"):
        clean[k] = {"class_type": v["class_type"], "inputs": v["inputs"]}

payload = json.dumps({"prompt": clean, "client_id": "test"}).encode()
req = urllib.request.Request(
    "http://localhost:8000/prompt",
    data=payload,
    headers={"Content-Type": "application/json"}
)
resp = urllib.request.urlopen(req)
print(json.loads(resp.read()))
```

## 5. Bridge — Chaos Visual Navigator

The bridge (`comfyui_bridge.py`) runs inside TouchDesigner and maps audio features to ComfyUI generation parameters.

### Modes

| Mode | Speed | Quality | Requirements |
|------|-------|---------|-------------|
| `flux_img2img` | ~1-2 sec/frame | Album cover | FLUX models |
| `flux_controlnet` | ~1-2 sec/frame | Album cover + structural | FLUX + XLabs custom nodes |
| `sdxl_latent` | ~0.5-1 sec/frame | Generic AI | SDXL checkpoint + anchors |

### How it Works

1. **Read features**: Chaos XYZ, loudness, Kuramoto r from TD storage
2. **Build prompt**: Lorenz lobe → color palette, loudness → energy, Kuramoto → structure
3. **Set params**: Chaos velocity → denoise, frame count → seed
4. **Queue prompt**: HTTP POST to ComfyUI API (background thread)
5. **Load frame**: Copy output to TD MovieFileIn, pulse reload

### Audio → Visual Mapping

| Audio Feature | Visual Parameter |
|---------------|-----------------|
| Lorenz x > 0 (lobe A) | Warm amber/copper palette |
| Lorenz x < 0 (lobe B) | Cool indigo/cobalt palette |
| Lorenz near origin | Prismatic/transitional |
| Loudness high | Dense, saturated, explosive |
| Loudness low | Sparse, minimal, void |
| Kuramoto r high (synced) | Geometric, crystalline, ordered |
| Kuramoto r low (free) | Chaotic, fragmented, dissolved |
| Chaos velocity high | More visual change per frame (higher denoise) |
| Chaos velocity low | Subtle drift (lower denoise) |

## 6. VRAM Budget (RTX 4090 Laptop 16GB)

| Process | VRAM | Notes |
|---------|------|-------|
| FLUX.1 Schnell fp8 | ~8GB | Split loading, fp8 encoders |
| ControlNet Depth | ~1GB | Only when enabled |
| TouchDesigner | ~2GB | GLSL + composite |
| nn~ PERI | ~1GB | Future |
| **Total** | **~12GB** | **4GB headroom** |

### If running out of VRAM:
1. Use 768x768 instead of 1024x1024 (edit workflow EmptyLatentImage)
2. Increase MIN_INTERVAL to 2.0s
3. Disable ControlNet (use `flux_img2img` mode)

## 7. LoRA Training (Future)

Train a FLUX LoRA on your visual aesthetic for even more distinctive output.

### Collect Training Images (50-200)
- Abstract generative art, dark backgrounds
- Luminous particles, impossible trajectories
- Amber/cyan/indigo palettes
- Mathematical beauty, organic geometry
- Screenshots from TD visualizations

### Train
```bash
# Using kohya_ss or ai-toolkit
# FLUX LoRA training settings:
#   Resolution: 1024x1024
#   Network rank: 16-32
#   Learning rate: 1e-4
#   Epochs: 10-20
#   Trigger word: "feedback_aesthetic"
```

### Deploy
Place `.safetensors` in `D:\Visuals\ComfyUI\models\loras\` and add a LoraLoaderModelOnly node to the workflow.
