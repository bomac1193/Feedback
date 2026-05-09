# ComfyUI nodes — future expansions

> Decided ideas + parked ideas + don't-bother list. From the strategy session.

## Tier 1 — game-changers (install when ready)

| Node / Tool | What it unlocks | Disk | Why it matters |
|---|---|---|---|
| **LatentSync** (or **Sonic** / **Hallo**) | Lip sync — make Ubani actually mouth your lyrics from audio | ~3-4 GB | THE missing piece for AI music videos. Without it, AI music videos look like dance shots without close-up vocal performance. With it, you can do hero close-up "Ubani singing the chorus" shots. |
| **DWPose preprocessor + FLUX Pose ControlNet** | Direct character into specific stances by drawing or feeding a stick-figure pose | ~1.7 GB | Want Ubani crouched, arms raised, leaning against a wall? Sketch the pose (or use a reference photo's pose), generate. Dramatically more directorial control than text prompts. |
| **RIFE frame interpolation** | Generate at 8fps, interpolate to 24fps | ~50 MB | Cuts video gen cost ~3-5x. Hero shots stay full quality, transitions/B-roll get the cost benefit. |

## Tier 2 — polish + cost optimisation

| Node | What it does |
|---|---|
| **SUPIR upscaler** | 4K upscale of final video output. Distribution-ready. |
| **Differential Diffusion** | Surgical inpainting — fix one specific area (eyes, hand, logo) without re-rendering whole image |
| **Depth Anything v2 + FLUX Depth ControlNet** (depth CN already installed) | 3D-aware generation. Match camera angles. Parallax for static-image-into-fake-camera-move effects |

## Tier 3 — audio-driven (where music videos earn their name)

| Node | What it does |
|---|---|
| **ComfyUI-AudioReactive / AudioScheduler** | Drive prompt strength, LoRA scale, denoise from audio features (BPM, RMS, frequency bands) |
| **StableAudio** | Generate sound effects / drones / risers within ComfyUI |
| **Whisper transcription** | Transcribe vocals → automatic lip-sync input for LatentSync |

Audio-reactive is genuinely cool but TouchDesigner is better at realtime. ComfyUI's audio is post-production / pre-rendered. TD wins live performance, ComfyUI wins music video shots.

## Tier 4 — niche but useful

- **LayerDiffuse** — transparent backgrounds (compositing without green screen)
- **Florence-2 / CogVLM** — auto-caption frames (for accessibility / search)
- **Animatediff** — alternative video gen, often more painterly than Wan

## Don't bother

- Audio generation (you have your music)
- Most "AI everything" mega-packs (bloat, conflicting deps)
- Random ControlNets you don't have a specific use for
- 3D reconstruction nodes (Unreal does this better when you get there)
- Style transfer mega-packs (XLabs IP-Adapter + alabo_eye LoRA already cover this)

## Sequencing for music video work

1. **First install**: RIFE + DWPose + FLUX Pose ControlNet. Smaller wins, immediate productivity boost. Frame interpolation cuts video costs; pose control unlocks directorial precision.
2. **Second install**: LatentSync. Lip sync for vocal close-up shots. Single biggest unlock for music video specifically. Needs ~3-4 GB and disk space cleanup first.
3. **Third (only if pain is real)**: SUPIR upscaler when distribution quality matters.
4. **Skip until live performance is the use case**: Audio-reactive nodes (TD wins).

## Where ComfyUI fits vs other tools

| Job | Best tool |
|---|---|
| Pre-rendered music video shots, character-locked stills | **ComfyUI** (with LoRAs + PuLID + ControlNet stack) |
| Realtime audio-reactive (live shows) | **TouchDesigner** (Feedback project) |
| Cloud one-off iteration with gpt-image-2 / Replicate | **Genoma** |
| Scripted batch generation, video chaining | **gen.py** |
| Lip sync to vocals | **ComfyUI + LatentSync** (no other tool does this well in pipeline) |
| Pose / body control | **ComfyUI + DWPose ControlNet** |
| Final 4K render upscale | **ComfyUI + SUPIR** or external (Topaz Video AI) |

The principle: **don't try to make ComfyUI do realtime; don't try to make TouchDesigner do lip sync.** Each tool has its lane.
