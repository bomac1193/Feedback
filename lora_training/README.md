# Feedback LoRA Training Set

Train a FLUX LoRA on your Tizita-curated taste so generated frames carry
your visual signature, not generic "AI art."

## Why Tizita as the source

Tizita's pairwise Bradley-Terry taste model has already ranked your photos
by *empirical* conviction (real A/B comparisons), not aspirational
self-curation. That's a stronger training signal than dumping a folder.

## Pipeline

```
Tizita scoring API
    ↓  export_tizita_top.py
tizita_top/                       # staged JPGs + manifest.json
    ↓  caption_florence2.py
tizita_top/*.txt                  # caption sidecars (trigger + description)
    ↓  ai-toolkit / kohya_ss
flux_lora_alabo_eye.safetensors   # drop into ComfyUI/models/loras/
```

## 1. Export top-N from Tizita

Make sure the Tizita backend is running on port 8001:

```bash
cd ~/tizita/backend && uvicorn app.main:app --port 8001
```

Then:

**Run with the Tizita venv** (the script imports SQLAlchemy models directly,
no HTTP, no running server needed):

```bash
~/tizita/backend/venv/bin/python ~/Feedback/lora_training/export_tizita_top.py \
    --best-photo-only --top 200 --min-side 1024
```

Modes ranked by signal strength for LoRA training:

| Mode | What you get | Why |
|---|---|---|
| `--best-photo-only` | Photos where `best_photo=True` only ("peak me") | **Strongest signal.** Manual deliberate click. |
| `--explicit-only` | `best_photo` OR `favorite` OR `user_rating>=5` | Wider net of explicit picks |
| `--user-rating 4` | All photos rated ≥4 stars by you | More data, slightly weaker signal |
| `--sort personal` | Top by personal_taste_score | Algorithmic, falls through to model |
| `--sort best` (default) | Top by global aesthetic score | Most algorithmic |

Photos land in `tizita_top/` with `manifest.json` listing rank, stars,
taste score, and resolution.

**Curate further by hand.** Open the folder, delete anything off-aesthetic.
Aim for 50-100 final images. Quality > quantity for LoRA.

## 2. Caption with Florence-2

```bash
pip install transformers timm einops pillow torch
python caption_florence2.py --task detailed --trigger alabo_eye
```

Writes `<image>.txt` sidecars. Spot-check the top 10-20 by hand. Florence-2
is good but not perfect, especially on abstract/artistic content.

Trigger token convention:
- `alabo_eye` for Tizita photos (your real-world eye)
- `alabo_dream` if you also train on MJ Imagist (your generative eye)

## 3. Mix in other sources (optional)

To blend Tizita + MJ Imagist + reference imagery:

```bash
# MJ Imagist
python export_tizita_top.py --top 0   # skip Tizita this run
mkdir -p mj_imagist && cp /mnt/e/Alabo/Images/AI/Midjourney/Imagist/*.{png,jpg} mj_imagist/
python caption_florence2.py --dir mj_imagist --trigger alabo_dream

# Reference (veve, abimbola, deren, fukiau, eglash)
mkdir -p reference
# (manually copy chosen reference shots in)
python caption_florence2.py --dir reference --trigger feedback_reference
```

Recommended mix for the Feedback project:
- 60% `alabo_eye` (Tizita)
- 30% `alabo_dream` (MJ Imagist) — once you have Feedback running, swap
  these for your own TD output frames
- 10% `feedback_reference` (cosmogram/topology source material)

## Apex set (current)

After running `--explicit-only --min-side 768`, the staged 692 photos were
filtered to **Apex tier only** (manual_conviction = 100, all of crown +
favorite + 5★) into `apex_118/`:

- 118 photos, 362 MB
- 72 Nano Banana / 29 Imagist (MJ) / 16 Higgsfield / 1 MJ other
- 76 portrait / 41 landscape / 1 square
- All captioned with `caption_simple.py` → trigger + aspect

Captions are intentionally minimal (`alabo_eye, portrait` etc.) because for
**style/aesthetic LoRAs**, terse captions train tighter style binding than
detailed Florence-2 descriptions. The trigger learns "the alabo aesthetic,"
which then applies to any prompt at inference.

## 4. Train the LoRA

Use [ai-toolkit](https://github.com/ostris/ai-toolkit) (simplest for FLUX)
or kohya_ss. Settings that work for Schnell-compatible LoRA:

```yaml
# ai-toolkit config snippet
model:
  name_or_path: black-forest-labs/FLUX.1-schnell
  is_flux: true
  quantize: true
network:
  type: lora
  linear: 16
  linear_alpha: 16
train:
  batch_size: 1
  steps: 2500
  lr: 1e-4
  gradient_checkpointing: true
  optimizer: adamw8bit
datasets:
  - folder_path: /path/to/tizita_top
    caption_ext: txt
    resolution: [512, 768, 1024]
```

## 5. Deploy

Drop the resulting `.safetensors` into:

```
D:\Visuals\ComfyUI\models\loras\flux_lora_alabo_eye.safetensors
```

Add a `LoraLoaderModelOnly` node to your workflows
(`workflow_flux_img2img.json`, `workflow_flux_controlnet.json`) and
prepend the trigger token to prompts in `comfyui_bridge.py`.

## Files

| File | Purpose |
|---|---|
| `export_tizita_top.py` | Pull top-N from Tizita scoring API into `tizita_top/` |
| `caption_florence2.py` | Florence-2 auto-captioner, writes `.txt` sidecars |
| `tizita_top/manifest.json` | Rank, stars, taste score for each staged photo |
