# Feedback AV — ComfyUI + TD Integration Status & Next Steps

> Last updated: 2026-03-21

---

## Current State

### What's Working

| Component | Status | Location |
|-----------|--------|----------|
| **ComfyUI** | Installed, running on port 8000 | `D:/Visuals/ComfyUI/` |
| **SDXL Lightning** | Working but LOW QUALITY (being replaced) | `models/checkpoints/` |
| **Anchor images** | 3 pairs (standard + wide) — warm/cool/prismatic | `D:/Visuals/ComfyUI/input/` |
| **Bridge (Chaos Visual Navigator)** | FLUX edition — supports 3 modes | `~/Feedback/comfyui/comfyui_bridge.py` |
| **TD chaos_viz** | GLSL attractor point + feedback trail (aspect ratio FIXED) | `/project1/feedback_viz/` |
| **TD composite** | Screen blend: chaos_viz + comfyui_frame | Working |
| **Max step6** | 5 attractors, 6 resonators, 19 tunings, OSC out | `~/Feedback/max/step6_chaos_resonator.maxpat` |

### FLUX.1 Schnell Upgrade (IN PROGRESS)

**Why**: SDXL Lightning produces generic AI art. FLUX.1 Schnell produces album-cover-worthy images at the same speed (4 steps, ~1-2 sec/frame).

| Component | Status | File |
|-----------|--------|------|
| **Download script** | Ready to run | `~/Feedback/comfyui/download_flux.sh` |
| **Bootstrap workflow** | txt2img for first frame | `workflow_flux_bootstrap.json` |
| **img2img workflow** | Temporal coherence | `workflow_flux_img2img.json` |
| **ControlNet workflow** | Depth map conditioning (needs custom nodes) | `workflow_flux_controlnet.json` |
| **Depth map renderer** | TD script (build_depth_map.py) | `~/Feedback/td/build_depth_map.py` |
| **Bridge** | Updated for FLUX (3 modes) | `comfyui_bridge.py` |
| **Models downloaded** | NOT YET — run download_flux.sh (~21GB) | See below |

### Signal Flow (Target — FLUX Edition)

```
Max/MSP (step6_chaos_resonator)
│  OSC on port 7000: chaos xyz, amplitude, attractor type,
│  chaos_gain, root_freq, tuning, decay, drive, mute
│
▼
TouchDesigner (feedback_viz container)
│  osc_update Execute DAT reads storage → feeds GLSL uniforms
│  chaos_viz GLSL: attractor point with feedback trail (aspect-corrected)
│  depth_map GLSL: attractor trajectory as greyscale depth
│  → saves attractor_depth.png to ComfyUI/input/ every 0.5s
│  comfyui_frame: loads latest generated frame
│  composite: chaos trail overlay on ComfyUI frame
│  tonemap → out1
│
▼
ComfyUI (D:/Visuals/ComfyUI/, port 8000)
│  FLUX.1 Schnell 4-step (fp8 for VRAM efficiency)
│  Mode A: img2img feedback — each frame evolves from previous
│  Mode B: + ControlNet Depth — attractor geometry IS the composition
│  Prompt driven by audio features (palette, energy, structure)
│  Denoise driven by chaos velocity + loudness
│  Output: D:/Visuals/ComfyUI/output/feedback_frame_NNNNN_.png
```

---

## Next Steps (In Order)

### Step 1A: Cloud Backend (RECOMMENDED — no downloads)

Use fal.ai FLUX API. Zero setup, ~$0.003/image (~$5/hr at 1 frame/2sec).

1. Get API key: https://fal.ai/dashboard/keys
2. In TD, set the key in the bridge:
```python
op('comfyui_bridge').module.set_fal_key('your-key-here')
op('comfyui_bridge').module.set_backend('fal')
```
3. Done. The bridge calls fal.ai instead of local ComfyUI.

### Step 1B: Local Backend (free, 21GB download)

```bash
cd ~/Feedback/comfyui
./download_flux.sh
```

Downloads (~21GB total):
- `flux1-schnell-fp8-e4m3fn.safetensors` — UNET (~12GB)
- `clip_l.safetensors` — CLIP-L text encoder (~250MB)
- `t5xxl_fp8_e4m3fn.safetensors` — T5-XXL fp8 (~5GB)
- `ae.safetensors` — FLUX VAE (~300MB)
- `flux-depth-controlnet-v3.safetensors` — XLabs ControlNet (~3.6GB)

Then switch bridge to local:
```python
op('comfyui_bridge').module.set_backend('local')
```

### Step 2: Install XLabs Custom Nodes (for ControlNet mode, local only)
In PowerShell on Windows:
```powershell
cd D:\Visuals\ComfyUI\custom_nodes
git clone https://github.com/XLabs-AI/x-flux-comfyui
git clone https://github.com/Fannovel16/comfyui_controlnet_aux
pip install -r x-flux-comfyui\requirements.txt
```

### Step 3: Test FLUX Schnell
1. Start ComfyUI: `python main.py --listen 0.0.0.0 --port 8000`
2. Test bootstrap workflow manually:
```python
import json, urllib.request
workflow = json.load(open('D:/Visuals/Touchdesigner/Projects/Feedback/comfyui/workflow_flux_bootstrap.json'))
# Strip _comment/_meta
clean = {}
for k, v in workflow.items():
    if not k.startswith("_"):
        clean[k] = {"class_type": v["class_type"], "inputs": v["inputs"]}
payload = json.dumps({"prompt": clean, "client_id": "test"}).encode()
req = urllib.request.Request("http://localhost:8000/prompt", data=payload, headers={"Content-Type": "application/json"})
resp = urllib.request.urlopen(req)
print(json.loads(resp.read()))
```
3. Check output in `D:/Visuals/ComfyUI/output/`
4. If quality is good, proceed to bridge integration

### Step 4: Bridge Timer in TD
Add Execute DAT that calls `update()` every frame:
- Create Text DAT → paste bridge code
- Create Execute DAT → `onFrameStart`: calls bridge's `update()`
- Bridge reads chaos from storage, queues FLUX generation in background thread

### Step 5: Deploy Depth Map Renderer
Run in TD Textport:
```python
exec(open('D:/Music/Max Msp/Projects/Feedback/td/build_depth_map.py').read())
```
Then switch bridge mode:
```python
op('comfyui_bridge').module.set_mode('flux_controlnet')
```

### Step 6: Test Full Pipeline
1. Start ComfyUI with FLUX models
2. Open TD project
3. Load Max step6 patch
4. Enable audio → OSC → TD storage → bridge → FLUX → TD composite
5. Verify: attractor drives visual composition, audio features control aesthetic

---

## Bridge Modes

| Mode | Workflow | Description |
|------|----------|-------------|
| `flux_img2img` | workflow_flux_img2img.json | FLUX Schnell img2img feedback. Audio → prompt + denoise. Default. |
| `flux_controlnet` | workflow_flux_controlnet.json | + ControlNet Depth. Attractor trajectory = image structure. |
| `sdxl_latent` | workflow_latent_walk.json | Legacy SDXL latent walk between 3 anchors. |

Switch in TD:
```python
op('comfyui_bridge').module.set_mode('flux_img2img')
op('comfyui_bridge').module.set_interval(1.0)  # seconds
```

## Audio Feature → Visual Parameter Mapping

| Audio Feature | Visual Parameter | Range |
|---------------|-----------------|-------|
| **Lorenz x** (lobe position) | Color palette: warm amber ↔ cool indigo | Lobe A/B |
| **Loudness** | Energy: void → gentle → intense | 0.0 - 1.0 |
| **Kuramoto r** | Structure: chaotic → fluid → geometric | 0.0 - 1.0 |
| **Chaos velocity** | Denoise strength: subtle evolution → fast morphing | 0.25 - 0.70 |
| **Kuramoto r** (again) | ControlNet strength: dissolved → clear structure | 0.40 - 0.75 |

---

## GPU Memory Budget (RTX 4090 Laptop 16GB)

| Process | VRAM | Notes |
|---------|------|-------|
| FLUX.1 Schnell fp8 (1024x1024, 4 steps) | ~8GB | Split loading, fp8 text encoders |
| ControlNet Depth (when enabled) | ~1GB | XLabs v3 |
| TouchDesigner (GLSL + composite) | ~2GB | 60fps |
| nn~ PERI (when ready) | ~1GB | Or CPU-only |
| **Total** | **~12GB** | **4GB headroom** |

---

## File Reference

| File | What | Status |
|------|------|--------|
| `comfyui/download_flux.sh` | Download FLUX.1 Schnell + ControlNet models | Ready |
| `comfyui/workflow_flux_bootstrap.json` | FLUX txt2img (first frame) | New |
| `comfyui/workflow_flux_img2img.json` | FLUX img2img temporal coherence | New |
| `comfyui/workflow_flux_controlnet.json` | FLUX + ControlNet Depth | New (needs custom nodes) |
| `comfyui/comfyui_bridge.py` | Chaos Visual Navigator (3 modes) | Updated for FLUX |
| `comfyui/workflow_api.json` | SDXL bootstrap (legacy) | Working |
| `comfyui/workflow_img2img_api.json` | SDXL img2img (legacy) | Working |
| `comfyui/workflow_latent_walk.json` | SDXL latent walk (legacy) | Working |
| `td/build_depth_map.py` | TD depth map renderer for ControlNet | New |
| `td/build_chaos_viz.py` | GLSL chaos point + trail | Working |
| `td/build_veve_viz.py` | Veve topology graph | Not deployed |
| `td/build_comfyui_layer.py` | ComfyUI compositing layer | Not deployed |
