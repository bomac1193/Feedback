# Feedback LoRA + Video Pipeline — Session Handoff

> Last updated: 2026-04-28. Resume point for the alabo_eye LoRA + music video stack.

## What's done

### LoRA training
- **alabo_eye_v1.safetensors** — trained on 117 Tizita-curated Apex photos (crown + favorite + 5★)
  - Trained on FLUX-dev via Replicate's `ostris/flux-dev-lora-trainer`
  - Hosted at `bomac1193/alabo-eye-flux` on Replicate
  - Local copy at `D:\Visuals\ComfyUI\models\loras\alabo_eye_v1.safetensors`
  - Trigger word: `alabo_eye`

### ComfyUI workflows (at `D:\Visuals\ComfyUI\user\default\workflows\`)
- `alabo_eye_test_UI.json` — FLUX Schnell + LoRA, fast realtime
- `alabo_eye_DEV.json` — FLUX Dev + LoRA, full quality (uses FluxGuidance node)
- `alabo_eye_DEV_safe.json` — VRAM-safe variant (768×768, dpmpp_2m, fp8_e4m3fn_fast)
- `alabo_eye_FACE.json` — FLUX Dev + LoRA + PuLID (face match from reference photo)
- `wan_examples/` — three Kijai WanVideoWrapper starter workflows

### Models on disk
- FLUX-schnell-fp8 (12 GB, `/diffusion_models/`)
- FLUX-dev-fp8 (12 GB, `/diffusion_models/`)
- Wan 2.2 VACE-Fun-A14B HighNoise + LowNoise Q4_K_M (22 GB total, `/diffusion_models/`)
- umt5-xxl encoder fp8 (6.3 GB, `/text_encoders/`)
- Wan 2.1 VAE (243 MB, `/vae/`)
- PuLID FLUX v0.9.1 (1.1 GB, `/pulid/`)
- alabo_eye_v1 LoRA (165 MB, `/loras/`)

### Custom nodes (in `/custom_nodes/`)
- ComfyUI-GGUF, ComfyUI-WanVideoWrapper, ComfyUI-VideoHelperSuite, ComfyUI-PuLID-Flux

### Scripts (at `~/Feedback/lora_training/`)
- `gen.py` — unified FLUX/Wan + cloud/local CLI with batch variations + frame chaining
- `cloud_generate.py` — original test-set runner (5 prompts at FLUX-dev cloud)
- `train_character_lora.py` — character LoRA training pipeline (Ubani, etc.)
- `wan_character_swap.py` — standalone Wan/Kling character swap helper
- `caption_simple.py` — minimal trigger+aspect captioner
- `export_tizita_top.py` — pull explicit-pick photos from Tizita DB
- `build_zip_compressed.py` — image resize + JPEG zip for Replicate uploads
- `build_contact_sheet.py` — HTML index of training set
- `install_wan22.sh` — re-runnable Wan 2.2 download script

### Outputs
- `~/Feedback/lora_training/cloud_tests/` — 5 initial alabo_eye test images
- `~/Feedback/lora_training/gen_output/` — all subsequent FLUX + video generations
- Mirrored to `D:\Visuals\ai-toolkit\datasets\gen_output\` for quick Windows preview

### Tizita Score redo doc
- `/home/sphinxy/tizita/Tizita Score redo.md` — design doc for refactoring Tizita's
  primary score to use manual_conviction = 50×crown + 25×favorite + 5×rating - 10×needs_prompting
  (locked at -10 penalty for needs_prompting). Separate Tizita backend task, not done yet.

## Where it stands

### Working end to end
- FLUX cloud (Replicate) image gen with alabo_eye LoRA — full quality
- FLUX local image gen with alabo_eye LoRA at FLUX-Schnell speed (realtime budget for Feedback chain)
- FLUX local with FLUX-dev (after FluxGuidance node fix + replacing corrupt T5 file)
- Cloud video at multiple quality tiers (fast/standard/high/seedance2/hailuo/veo/runway)
- Frame-chained Seedance Pro for character-locked sequences via `--chain N`
- 9:16 / 16:9 / 4:3 / etc. aspect presets with safety lock against OOM-risk sizes on local

### Known gotchas
- **Seedance 2.0 + Veo 3 content filter blocks editorial/fashion prompts** for the alabo aesthetic. Use Seedance 1 Pro (`--quality high`) or Hailuo (`--quality hailuo`) instead.
- **Higgsfield generated images don't have face_count populated in Tizita DB** — face detection wasn't run on them. Doesn't affect training, but face-based queries return empty.
- **Local Wan video isn't wired into gen.py yet** — only cloud. Custom nodes installed, models downloaded, workflow needs to be loaded into ComfyUI Desktop and exported as API JSON to wire up.
- **`--driving` (character swap) doesn't support `--chain`** because Kling Omni doesn't accept frame continuation.

## Next session — pick up here

### Immediate next step: train Ubani character LoRA
1. Curate `~/Feedback/lora_training/ubani_photos/` (currently 30 top-conviction Higgsfield photos pre-staged):
   - **Hairstyle ratio**: ~60-70% normal hair (default look), ~25-30% varied styles, 0% bald (unless actually bald)
   - **Lipstick / makeup**: mix or none — do not bake in features you want prompt-controllable
   - **Avoid**: hats, sunglasses, hoods (cover hairline/face), heavy filters, blurry, wrong-person
   - Target: 20-25 keepers
2. Run training:
   ```bash
   ~/tizita/backend/venv/bin/python ~/Feedback/lora_training/train_character_lora.py --name ubani
   ```
   ~10-15 min, ~$2-3 on Replicate
3. Download weights → save as `D:\Visuals\ComfyUI\models\loras\ubani_v1.safetensors`
4. In ComfyUI workflow, **stack two LoraLoader nodes**: `alabo_eye_v1` then `ubani_v1`
5. Use both triggers in prompts: `alabo_eye, ubani, neon blue editorial portrait, ...`

### Then: music video pipeline

Per shot:
```bash
# Set token (once per shell)
export REPLICATE_API_TOKEN=$(grep ^REPLICATE_API_TOKEN /home/sphinxy/genoma/.env.local | cut -d= -f2)

# Step 1: generate 9:16 still
python ~/Feedback/lora_training/gen.py flux \
  --prompt "alabo_eye, ubani, [scene description]" \
  --aspect 9:16 --variations 4

# Step 2a: standard 5-15 sec shot, character-locked via chain
python ~/Feedback/lora_training/gen.py wan \
  --ref [winner].png --prompt "[motion]" --quality high --chain 3

# Step 2b: hero shot with specific motion (driving video)
python ~/Feedback/lora_training/gen.py wan \
  --ref [winner].png --driving phone_clip.mp4 --prompt ""
```

Edit final clips in DaVinci/Premiere.

### Open follow-ups
- [ ] **Train Ubani LoRA** — primary blocker for music video work. 30 candidate Higgsfield photos pre-staged in `ubani_photos/`. Curate to 20-25 (varied hair, clean baseline, no lipstick if want flexibility), then `train_character_lora.py --name ubani`. After training, update `~/boveda/characters/ubani.json` with the Replicate version hash.
- [ ] **Clone voice in ElevenLabs** — record 5 min audio sample, paste voice_id into `~/boveda/characters/ubani.json` under `voice.elevenlabs_voice_id`. Set `ELEVENLABS_API_KEY` env var.
- [ ] Implement Tizita Score redo (refactor `unified_scoring.py` per design doc)
- [ ] Hand-fixer pass for FLUX local workflow (FaceDetailer with hand model)
- [ ] Enable USE_ALABO_LORA toggle in `comfyui_bridge.py` once full Feedback chain runs

### Pre-staged for when Ubani is trained (fully ready)

- ✅ **Boveda character registry** at `~/boveda/characters/` — JSON-based source of truth. `alabo_eye.json` populated, `ubani.json` skeleton ready (training metadata + voice ID empty until trained). `~/boveda/registry.py` provides `get_character()`, `resolve_stack()`, `update_character()`.
- ✅ **Multi-LoRA stacking** in `gen.py` — `--character ubani` auto-stacks alabo_eye + ubani LoRAs, prepends triggers, applies preferred aspect/quality. Cloud uses `extra_lora` parameter on bomac1193/alabo-eye-flux. Local builds workflow JSON dynamically with chained LoraLoader nodes.
- ✅ **ElevenLabs voice** — `gen.py wan ... --voice-text "your line"` automatically generates voice-cloned audio from character's voice_id and muxes onto the video output via ffmpeg.
- ✅ **Local Wan 2.2 VACE** — `gen.py wan --backend local` now runs the full Wan pipeline through ComfyUI. Workflow at `comfyui/workflow_wan22_vace_local.json`. Free per-gen, slow (~5-15 min).
- ✅ **Audio DNA → visual prompt mapper** at `~/Feedback/lora_training/audio_to_visual.py` — analyzes audio (BPM, energy, brightness, dynamic range) and outputs gen.py args. v0; richer Starforge integration is a future move.

---

## Strategic vision — revolutionary moves for the artist OS

You have something almost no other artist has: **the full vertical stack of identity, taste, generation, distribution, and settlement**. Tizita owns your taste, alabo_eye encodes your visual voice, Boveda is meant to be the character genome, Starforge has audio DNA, Replicate is the engine. Real revolutionary moves all sit on top of connecting these into closed loops.

### Top 5 revolutionary moves (ranked by leverage)

**1. Boveda becomes the LoRA registry / character genome (foundational)**
Make Boveda literal "Living Character OS": each character (Ubani, future) gets a Boveda record containing **face LoRA + style LoRA + voice clone + signature gestures + brand rights**. ComfyUI/gen.py reads from Boveda. Slayt requests "Ubani in club setting" → Boveda provides LoRAs → ComfyUI generates → Imprint controls who can see it. **One character, summonable in any modality, identity preserved across image/video/audio with provable provenance.**

**2. Audio DNA → automatic visual treatment**
Starforge already calculates cross-modal coherence. Take next step: a song's BPM/sonic palette/energy automatically tunes LoRA strengths and prompt vocabulary. **One-click music video from a track.** Resonaet engine could feed this directly.

**3. ElevenLabs voice clone + Wan/Seedance video**
Seedance 2 supports native audio. Add ElevenLabs voice clone (~$5/month, 5 min sample). Ubani **speaks in the artist's voice**, lip-sync'd, in any video. Talking-heads, freestyle bars, AI interviews. Almost no one is doing this with proper identity persistence.

**4. Slayt → ComfyUI orchestration**
Slayt scores content. Make Slayt also *request* it. Pipeline: Slayt detects gap → generates prompts from taste profile → calls ComfyUI cloud → posts → scores → feeds back. **Self-driving content engine.**

**5. Imprint-gated AI exclusives**
Imprint verifies superfans. Verified Stans get unique 1/1 Ubani generations with their name, tied to Imperium for royalty/rev share if resold. **Provable, monetizable, non-replicable.** Drop economy reborn.

### TouchDesigner — has a place, NOT for music video production

TD lives in the **live performance** lane:
- ✅ The Feedback project (existing instrument with audio→TD→ComfyUI loop)
- ✅ Audio-reactive realtime visuals for live shows
- ✅ Multi-display VJing / installation work
- ❌ Music video production (gen.py + cloud video + DaVinci is the right stack)

**Where TD earns its keep**: post-Unreal stage, as the glue between gen.py + cloud APIs + Unreal MetaHuman + audio analysis + multi-display output for live performance. Don't pre-stage TD for the current music video work.

**Boveda → TD bridge** (future): TD can call gen.py via subprocess, use outputs as runtime textures, drive parameters from audio analysis. Not built — design when live performance work begins.

### Unreal Engine + Boveda + ComfyUI — the live performance frontier

**Reachable but most ambitious. Do AFTER music video pipeline ships.**

- MetaHuman in Unreal = realtime CGI Ubani (Boveda provides face/identity)
- ComfyUI generates dynamic backgrounds + styling, fed into Unreal as runtime textures
- Live use: VR concerts, livestreams, interactive music videos where audience changes visuals real-time
- First step: build a Boveda → MetaHuman exporter. Get Ubani's identity into a MetaHuman skeleton.
- The killer combo for next-gen artist performance — and almost nobody has the assets to do it. You do.

Cost: 1-2 month rabbit hole. Rights, MetaHuman pipeline learning, VR infra, performance use case. Don't start until music video pipeline is proven.

**Pre-staged for Unreal stage** (no code, just structure):
- `~/boveda/characters/<name>.json` now has a `metahuman` field (null on style LoRAs, placeholder skeleton on character LoRAs)
- `~/boveda/exports/metahuman/README.md` — full architectural sketch for when you start (phases, triggers, costs, useful resources)
- Boveda registry's character schema is already shaped to consume MetaHuman data without breaking changes

**Triggers to start Unreal work**: music video shipped + 1000+ engaged superfans + revenue/booking justifies $5-10k VR infra. Until then, the placeholder is enough.

### Clothing/garment transfer (replaces "describe outfit" prompts)

Ranked by quality:
- **IP-Adapter** (XLabs FLUX IP-Adapter v2, ~1GB): drag clothing image into IPAdapter node → applies to figure. ~80% accuracy. Fast iteration.
- **IDM-VTON / CatVTON / OOTDiffusion / Leffa**: purpose-built virtual try-on. ~95% accuracy. Production music video shots.
- **Marvelous Designer + ControlNet**: 3D-design garment in MD → render onto Ubani pose → ControlNet conditioning. Cinematic quality. Use for hero shots / brand identity.

### Marvelous Designer / CLO3D — when it's worth it

| Use case | Worth it? |
|---|---|
| Daily content, varying looks | No — IP-Adapter / IDM-VTON faster |
| Signature looks (brand uniform, recurring) | **Yes** — design once, render forever |
| Commercial product showcase | **Essential** — physics matter |
| Music video hero shots | Yes if budget |

There is no "better" tool than MD/CLO for the cases where they win. Connect via: MD → OBJ → Blender pose → depth/normal maps → ControlNet conditioning in ComfyUI.

### Blindspots worth noting

- **Voice-to-prompt** (ElevenLabs/Whisper) — speak prompts, removes typing friction
- **Sketch-to-image** — stick figure pose drawing → ControlNet conditions FLUX with LoRAs. Direct directorial control without 3D.
- **Multi-character scenes** — stack Ubani LoRA + collaborator LoRA. Two identity-locked characters in one frame.
- **Audio-reactive realtime** — TouchDesigner (already in Feedback) → audio analysis → cloud Replicate calls during live show. Music video generated as you perform.
- **Frame interpolation** — generate keyframes at 1 fps via Wan, interpolate to 24 fps with RIFE. Cuts video gen cost ~24×.
- **VACE local + Ubani LoRA** — once Ubani is trained, put Ubani into ANY existing footage you point it at, identity preserved.

### The single biggest unlock

**Train Ubani LoRA, then build the Boveda → ComfyUI bridge.** Once Boveda is the source of truth for character identity (LoRA hashes, voice IDs, rights), every other tool in your stack instantly becomes 10× more powerful because they all reference one canonical Ubani. Foundational infrastructure that makes everything else easier.

### Sequenced roadmap

1. **Now**: Train Ubani LoRA, ship first music video using gen.py + alabo_eye + ubani stacked
2. **Next**: Add XLabs FLUX IP-Adapter for clothing transfer (no more "describe outfit")
3. **Then**: ElevenLabs voice clone + Seedance 2 audio video
4. **Then**: Boveda LoRA registry + Slayt orchestration (the closed loop)
5. **Later**: Unreal Engine + MetaHuman live performance layer
6. **Always**: Imprint-gated exclusives as the monetization wrapper

## Music video pipeline (the moment Ubani LoRA finishes)

After training completes:

1. Download `ubani_v1.safetensors` to `D:\Visuals\ComfyUI\models\loras\`
2. Update Boveda registry:
   ```bash
   ~/tizita/backend/venv/bin/python -c "
   from sys import path; path.insert(0,'/home/sphinxy/boveda')
   from registry import update_character
   update_character('ubani', {
     'lora.replicate_version': '<the-version-hash>',
     'lora.trained_at': '<ISO date>',
     'lora.training_set_size': <N>
   })
   "
   ```
3. (Optional) Clone voice in ElevenLabs, paste voice_id:
   ```bash
   update_character('ubani', {'voice.elevenlabs_voice_id': '<voice-id>'})
   ```
4. **Run the pipeline** — three commands per shot:

```bash
export REPLICATE_API_TOKEN=$(grep ^REPLICATE_API_TOKEN /home/sphinxy/genoma/.env.local | cut -d= -f2)
export ELEVENLABS_API_KEY=<your-key>  # only if using --voice-text

# Step 1: still with stacked LoRAs (cloud)
python ~/Feedback/lora_training/gen.py flux --character ubani --prompt "in a market" --variations 4

# Step 2 (optional): swap to a specific outfit via VTON
python ~/Feedback/lora_training/gen.py vton --ref [step1].png --garment outfit_flatlay.png --category upper_body

# Step 3: animate with character lock + voice
python ~/Feedback/lora_training/gen.py wan --ref [winner].png \
  --prompt "ubani slowly walks toward camera, dramatic light" \
  --quality high --chain 3 \
  --voice-text "I never knew what was waiting for me" \
  --character ubani
```

Or auto-generate from a track:

```bash
# Audio → suggested args
python ~/Feedback/lora_training/audio_to_visual.py --audio track.mp3 --character ubani
# Pipe the suggested prompt into gen.py manually
```

## Quick command reference

```bash
# Token (once per shell)
export REPLICATE_API_TOKEN=$(grep ^REPLICATE_API_TOKEN /home/sphinxy/genoma/.env.local | cut -d= -f2)

# FLUX images, cloud, batch of 4 at 9:16
python ~/Feedback/lora_training/gen.py flux --prompt "alabo_eye, ..." --aspect 9:16 --variations 4

# FLUX images, local (uses ComfyUI Desktop on :8000)
python ~/Feedback/lora_training/gen.py flux --backend local --prompt "..." --aspect 16:9 --size full

# Cloud video, 1080p Seedance Pro
python ~/Feedback/lora_training/gen.py wan --ref still.png --prompt "..." --quality high

# Frame-chained 20-second character-locked video
python ~/Feedback/lora_training/gen.py wan --ref still.png --prompt "..." --quality high --chain 4

# True character swap with driving video (Kling Omni)
python ~/Feedback/lora_training/gen.py wan --ref char.png --driving motion.mp4 --prompt ""

# Train new character LoRA
~/tizita/backend/venv/bin/python ~/Feedback/lora_training/train_character_lora.py --name <name>
```

## Aspect / size presets for FLUX

| Aspect | Draft (0.5×) | Full (1×) | Big (1.5×, cloud only) |
|---|---|---|---|
| 1:1 | 512×512 | 1024×1024 | 1536×1536 |
| 16:9 | 672×384 | 1344×768 | 2016×1152 |
| 9:16 | 384×672 | 768×1344 | 1152×2016 |
| 4:3 | 576×448 | 1152×896 | 1728×1344 |
| 3:4 | 448×576 | 896×1152 | 1344×1728 |
| 21:9 | 768×320 | 1536×640 | 2304×960 |

Local backend safety-locks any combination above ~1024×1344 pixels (covers all draft + full). Big sizes route to cloud automatically with clear error message.

## Video quality tiers

| Flag | Model | Quality | Cost / 5s |
|---|---|---|---|
| `--quality fast` | wan-video/wan-2.2-i2v-fast | 480p | ~$0.30 |
| `--quality standard` | bytedance/seedance-1-lite | 720p | ~$0.40 |
| `--quality high` | bytedance/seedance-1-pro | 1080p | ~$0.60-1 ⭐ workhorse |
| `--quality seedance2` | bytedance/seedance-2.0 | 720p+ with audio | ~$0.50-1.50 (filter-prone) |
| `--quality hailuo` | minimax/hailuo-02 | 720p+ | ~$0.50 |
| `--quality veo` | google/veo-3-fast | 1080p | ~$0.40-0.80 (filter-prone) |
| `--quality runway` | runwayml/gen4-turbo | 720p | ~$1-2 |
