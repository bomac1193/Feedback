# Feedback AV — Status & Next Steps

> Last updated: 2026-03-21

---

## What This Is

A live audiovisual performance system where **sound shapes matter**.

- **Max/MSP** (step6_chaos_resonator): Lorenz chaos attractor drives 6 Kuramoto-coupled oscillators through 6 Karplus-Strong resonators. 19 African tuning systems, 6 veve coupling topologies. Audio out + OSC out.
- **TouchDesigner** (feedback_viz): GLSL cymatic shader renders Chladni plate interference patterns driven by Kuramoto synchronization. Attractor particle traces through the field. Composited with AI-generated frames.
- **Replicate API** (comfyui_bridge): FLUX.1 Schnell generates photorealistic frames from audio features. Prompt engine uses African fractal processes (Eglash) rendered as physical phenomena (Jenny cymatics, ferrofluid, bioluminescence). ~$0.003/frame, $1.00 budget cap.

### Signal Flow

```
Max/MSP (step6_chaos_resonator)
│  Audio: 6 resonators → speakers
│  OSC port 7000: chaos xyz, loudness, kuramoto_r, tuning, veve
│
▼
TouchDesigner (feedback_viz container)
│  osc_update: reads storage → feeds GLSL uniforms
│  chaos_viz GLSL: Chladni eigenmodes + attractor particle + feedback trail
│  bridge_timer: calls comfyui_bridge.update() every frame
│  comfyui_frame: loads latest AI-generated frame
│  composite: chaos_viz + comfyui_frame → out1
│
▼
Replicate API (cloud)
│  FLUX.1 Schnell, 4-step, 16:9, ~1-2s per frame
│  Prompt: Eglash fractal process × physical medium × Jenny cymatic structure
│  Audio features → prompt words + denoise strength + mode selection
│  Output: D:/Visuals/ComfyUI/output/feedback_frame_latest.png
```

---

## What's Working

| Component | Status | Notes |
|-----------|--------|-------|
| Max step6 patch | Working | 6 osc, 6 res, 19 tunings, 6 veves, OSC out |
| TD GLSL cymatic shader | Working (NEW) | Chladni eigenmodes driven by Kuramoto r |
| TD feedback trail | Working | Zoom + rotation feedback loop |
| TD osc_update | Working | Feeds uChaos, uKuramotoR, uTime, uChaosGain |
| Bridge prompt engine | Working (NEW) | Eglash + Jenny vocabulary, 7 prompts per lobe |
| Bridge Replicate backend | RATE LIMITED | Free tier cap. Add billing at replicate.com/account/billing |
| Bridge cost cap | Working | $1.00 default, set_budget() to change |
| Bridge internal Lorenz | Working | Fallback when no live OSC from Max |
| TD composite | Working | Screen blend chaos_viz + comfyui_frame |
| Anchor images | Legacy | SDXL latent walk anchors (warm/cool/prismatic) |

---

## What Needs To Be Done

### Immediate (before next session)

1. **Add Replicate billing** — https://replicate.com/account/billing
   - Add payment method to the account owning token `r8_933X...`
   - Even $5 = ~1,600 frames. Free tier rate limit is blocking all generation.
   - Once billing is active, bridge auto-starts generating (it's already running).

2. **Test full pipeline** — Start Max step6 → Enable OSC → Open TD → Verify:
   - Cymatic patterns respond to Kuramoto r (ordered vs chaotic geometry)
   - Attractor particle traces through cymatic field
   - FLUX frames generate and composite over chaos_viz
   - Audio features drive prompt (check TD textport for `[Bridge]` logs)

### Short-term

3. **Tune cymatic shader** — Once running live, adjust:
   - Mode number scaling (how many harmonics per lobe)
   - Nodal line thickness (currently 0.15 smoothstep)
   - Trail fade rate (currently 0.97)
   - Cymatic intensity vs particle brightness balance
   - Color mapping (warm/cool transition point)

4. **Tune prompt engine** — Once FLUX frames generating:
   - Check which prompts produce best results
   - Adjust pool rotation speed (currently every 8 frames)
   - Tune denoise range (currently 0.25-0.70)
   - Consider dropping prompts that produce generic results

5. **ControlNet Depth mode** — Optional, local-only:
   - Requires ComfyUI running locally with FLUX models (21GB download)
   - XLabs custom nodes for ControlNet
   - TD renders attractor trajectory as depth map → FLUX uses as composition structure
   - Skip if Replicate txt2img quality is sufficient

### Future

6. **FLUX LoRA training** — Train on real photographs of:
   - Chladni plate patterns (Jenny's actual photographs)
   - Ferrofluid under magnetic field
   - Bioluminescent organisms
   - Schlieren photography
   - This makes FLUX more faithful to the physical media vocabulary

7. **nn~ PERI integration** — When RAVE model is trained:
   - Load exported .ts model into nn~ in Max
   - PERI processes audio in real-time alongside resonators
   - ~1GB VRAM additional

8. **Depth map renderer** — `td/build_depth_map.py`:
   - Renders attractor trajectory as greyscale depth image
   - Fed to ControlNet for structural composition control
   - Only needed for local ComfyUI mode

---

## Prompt Engine Philosophy

### First Principles (NOT "AI Art")

The prompt engine describes **physical phenomena**, not aesthetic aspirations:

- **NEVER**: "beautiful", "stunning", "artwork", "professional", "abstract art", "masterpiece", "trending", "artstation", "tribal", "ethnic"
- **ALWAYS**: Real photographic processes, specific materials, observable physics

### Theoretical Foundation

| Source | Concept | Maps To |
|--------|---------|---------|
| **Eglash** (African Fractals) | Recursive nesting (Ba-ila), branching (Banyo), Eulerian paths (Chokwe lusona), scaling (Nankani), spirals (Akan) | Fractal process vocabulary in prompts |
| **Jenny** (Cymatics) | Single tone = clean nodal lines, two tones = interference, many tones = chaos | Kuramoto r → ordered/chaotic structure words |
| **Lorenz** (Chaos theory) | Attractor lobes, saddle point, velocity | Color palette selection, denoise strength |

### Audio → Visual Mapping

| Audio Feature | Prompt Parameter | Effect |
|---------------|-----------------|--------|
| Lorenz x > 5 | Warm media pool | Molten copper, ember, Chladni in iron filings, kirlian |
| Lorenz x < -5 | Cool media pool | Bioluminescence, Cherenkov, frost crystals, cymatic water |
| Lorenz saddle | Transition pool | Ferrofluid, bismuth, cymatics in viscous fluid, mercury |
| Loudness | Density words | Void → sparse → moderate → dense filling frame |
| Kuramoto r | Structure words | Chaotic branching → fluid → semi-ordered → precise recursive symmetry |
| Chaos velocity | Denoise strength | Low velocity = subtle drift (0.25), high = fast morphing (0.70) |

---

## GLSL Cymatic Shader

The `chaos_viz` GLSL shader renders Chladni plate eigenmodes in real-time:

```
Chladni(x,y) = sin(n*PI*x)*sin(m*PI*y) + sin(m*PI*x)*sin(n*PI*y)
```

- **Kuramoto r > 0.6**: Single dominant mode → clean geometric nodal lines (Jenny Fig 7)
- **Kuramoto r 0.3-0.6**: Two competing modes → moiré interference + circular vortices (Jenny Fig 61)
- **Kuramoto r < 0.3**: Four competing modes → turbulent chaotic interference (Jenny Fig 10)
- **Lorenz position**: Drives mode numbers (which harmonics are active)
- **Loudness**: Controls cymatic field intensity
- **Feedback trail**: Previous frame zooms + rotates → spiral accumulation

---

## File Reference

| File | What | Status |
|------|------|--------|
| `comfyui/comfyui_bridge.py` | Chaos Visual Navigator — 3 backends, Eglash+Jenny prompts | Working |
| `comfyui/download_flux.sh` | Download FLUX models for local mode | Ready (not needed for Replicate) |
| `comfyui/workflow_flux_bootstrap.json` | FLUX txt2img first frame (local mode) | Ready |
| `comfyui/workflow_flux_img2img.json` | FLUX img2img feedback (local mode) | Ready |
| `comfyui/workflow_flux_controlnet.json` | FLUX + ControlNet Depth (local mode) | Ready (needs custom nodes) |
| `comfyui/SETUP.md` | Local ComfyUI setup guide | Ready |
| `td/build_chaos_viz.py` | Original GLSL builder script | Working |
| `td/build_depth_map.py` | Depth map renderer for ControlNet | Ready |
| `td/build_comfyui_layer.py` | ComfyUI compositing layer | Not deployed |
| `max/step6_chaos_resonator.maxpat` | Main audio patch | Working |
| `max/feedback_veve.maxpat` | Kuramoto + KS + veve engine | Working |

---

## Reference Material

| File | Source | Used For |
|------|--------|----------|
| `eglash_reference/` (265 pages) | Ron Eglash — African Fractals | Fractal process vocabulary |
| `deren_reference/` | Maya Deren — Divine Horsemen | Veve topology |
| `abimbola_reference/` | Abimbola — Ifa Divination | Yoruba mathematical systems |
| `fukiau_reference/` | Fukiau — Kongo cosmology | Circular recursion |
| `thompson_reference/` | Thompson — Flash of the Spirit | Visual culture connections |
| `rigaud_secrets_reference/` | Rigaud — Veve diagrams | Coupling matrix source |
| Jenny Vol 1 PDF (Downloads) | Hans Jenny — Cymatics | Sound→form vocabulary |

---

## GPU Budget (RTX 4090 Laptop 16GB)

| Process | VRAM | Notes |
|---------|------|-------|
| TouchDesigner (GLSL cymatic + composite) | ~2GB | 60fps real-time |
| FLUX via Replicate | 0GB local | Cloud API, no local VRAM |
| FLUX local (if enabled) | ~8-10GB | Only if running ComfyUI locally |
| nn~ PERI (future) | ~1GB | RAVE model in Max |
| **Current total** | **~2GB** | **14GB headroom with cloud API** |

---

## Cost Budget

| Backend | Cost/frame | $1 budget | $5 budget |
|---------|-----------|-----------|-----------|
| Replicate Schnell (txt2img) | ~$0.003 | ~333 frames | ~1,666 frames |
| Replicate img2img | ~$0.012 | ~83 frames | ~416 frames |
| fal.ai Schnell | ~$0.003 | ~333 frames | ~1,666 frames |
| Local ComfyUI | $0 | Unlimited | Unlimited |

Default budget: $1.00. Change in TD: `op('comfyui_bridge').module.set_budget(5.0)`
