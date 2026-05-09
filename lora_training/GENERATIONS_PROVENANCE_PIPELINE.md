# Generations provenance pipeline

A unified system for capturing, storing, organizing, and reusing every ComfyUI generation across Tizita and Genoma. The goal: nothing's ever lost, everything's reproducible, your taste compounds, and the data is yours.

---

## What this solves

You currently lose context between sessions:
- The prompt that worked is in scrollback somewhere.
- The workflow that produced a great frame is selected on the canvas, not pinned.
- Reference images used (face, garment, style) aren't tracked alongside the output.
- Tizita can curate photos but doesn't see the *generation context* (prompt, params).
- Genoma can't reprompt from a Tizita storyboard frame because the recipe isn't there.

This pipeline closes those gaps.

---

## What gets captured per generation

Every ComfyUI output produces a **provenance record**:

```json
{
  "generation_id": "uuid",
  "engine": "comfyui_local",
  "model_base": "flux1-dev-fp8",
  "lora_stack": [
    {"file": "alabo_eye_v1.safetensors", "strength": 1.0},
    {"file": "ubani_v2.safetensors", "strength": 1.0}
  ],
  "prompt_positive": "...",
  "prompt_negative": "",
  "sampler": "dpmpp_2m",
  "scheduler": "sgm_uniform",
  "steps": 28,
  "cfg": 1.0,
  "guidance": 3.5,
  "seed": 42,
  "width": 832,
  "height": 1216,
  "refs_used": {
    "face":     "_alabo/face/ubani_canonical_001.png",
    "outfit":   "_alabo/garments_top/silk_shirt_black_01.png",
    "style":    "_alabo/style_refs/margiela_ss94_03.jpg",
    "pose":    null
  },
  "workflow_name": "IMG_local_main",
  "workflow_json_path": "<sha256>.json",
  "output_path":       "D:/Visuals/ComfyUI/output/alabo_main_00012_.png",
  "output_sha256":     "...",
  "created_at":        "2026-05-01T...",
  "duration_seconds":  18.4
}
```

Plus the **full workflow JSON** stored alongside (deduplicated by SHA-256 so identical workflows don't double-store).

---

## Three layers of the system

### Layer 1 — capture (in ComfyUI)

Custom ComfyUI node `TizitaCapture` that runs at the end of every generation:
1. Receives the IMAGE output of the workflow.
2. Reads the current workflow JSON (already accessible via `prompt_id`).
3. Extracts the prompt + params from the executed graph.
4. Writes:
   - The output PNG (already saved by SaveImage).
   - A sidecar `<output>.provenance.json` with the record above.
   - The workflow JSON to a content-addressed store (`workflows/<sha256>.json`).
5. Optionally POSTs to Tizita immediately (Layer 2). If Tizita is offline, sidecar is the fallback.

**Why sidecar files first**: even with no backend running, every generation is self-describing. Tizita ingestion can be retroactive.

### Layer 2 — storehouse (in Tizita)

Tizita backend gains a `Generation` entity (sidecar of `Photo` or its own table):

```python
class Generation(Base):
    id: UUID
    photo_id: int            # links to Tizita's existing Photo row
    engine: str              # comfyui_local, replicate, fal, etc.
    model_base: str
    lora_stack: JSONB
    prompt_positive: str
    prompt_negative: str
    sampler: str
    seed: int
    width: int
    height: int
    refs_used: JSONB
    workflow_sha256: str     # references workflows table
    output_sha256: str
    duration_seconds: float
    created_at: timestamp
```

Plus a `Workflow` table:

```python
class Workflow(Base):
    sha256: str (PK)
    name: str
    json_blob: JSONB
    created_at: timestamp
```

Endpoints:
- `POST /api/generations/import` — takes a PNG + provenance JSON, ingests both into Tizita's Photo table + Generation row.
- `GET /api/generations/{id}` — returns the full record.
- `GET /api/generations/{id}/workflow` — returns the workflow JSON (so it can be re-loaded into ComfyUI).
- `GET /api/generations/search?prompt=&model=&lora=&min_rating=&cluster=` — full-text + faceted search.
- `POST /api/generations/{id}/clone` — produce a new draft generation request with the same recipe but a new seed.

Tizita's existing curation (rating, clustering, Visual DNA) **just works** on these — they're Photos with extra context.

### Layer 3 — consumers (Tizita UI, Genoma, gen.py)

#### Tizita UI
- New "Generations" view alongside Photos, Storyboards, Series.
- Filters: by prompt, model, LoRA, rating, cluster, date.
- Per-generation panel showing prompt, refs, params, output, "Reprompt" button.
- Rating + cluster operations work the same as for any photo.

#### Genoma integration
- Genoma's storyboard / prompt UI gains a "Pull from Tizita" picker.
- Pick any Tizita generation → its prompt + LoRA stack populate Genoma's form.
- Edit, re-run with a new seed → new generation flows back into Tizita.

#### gen.py integration
- `gen.py replay <generation_id>` — pull provenance, reproduce locally (FLUX dev + same LoRAs + same seed).
- Useful for batch re-runs at higher resolution, or cross-engine validation.

---

## Where this hooks into your existing taste loop

Existing pieces:
- `_alabo/style_refs/` — IP-Adapter rotation pool.
- COMFYUI_TIZITA_RATING_BRIDGE.md — rating UI inside ComfyUI.
- Tizita's pairwise comparison + Visual DNA.

This pipeline closes the loop:

```
ComfyUI generation
  ↓
TizitaCapture writes provenance + ingests to Tizita
  ↓
Tizita Photo + Generation row created
  ↓
You rate (crown / 5★ / favourite / trash) — either in ComfyUI (via the rating bridge) or in Tizita
  ↓
Tizita's taste vector + clusters update
  ↓
Nightly Loop 2 sync: top-K generations' OUTPUT IMAGES → _alabo/style_refs/
  ↓
Next ComfyUI batch's IP-Adapter rotates through them — composition tracks your evolving taste
  ↓
+ Loop 3 (when corpus is large): top-100 export as a training set for alabo_taste_v1 LoRA
```

Each cycle, your taste compounds AND your generative output reflects it more tightly.

---

## Ownership story (the proprietary data point)

Every artifact stays on machines you control:
- Output PNGs in your D: drive.
- Sidecar JSONs in your D: drive.
- Tizita's Postgres on your machine.
- Workflow JSONs in your D: drive (content-addressed).

External services (Replicate, fal.ai) don't see the provenance record — only the API call inputs they need to fulfill the generation. Your taste data, the prompt history, the LoRA combinations that work for you — all proprietary.

When Sembla launches, this becomes a real moat: every artist's generations live in the same provenance system, making "rights-cleared output with full audit trail" a one-button feature, not a manual reconstruction.

---

## Build phases

### Phase 0 — capture only (one day)
- Build `TizitaCapture` ComfyUI custom node.
- Output: every generation now writes a sidecar `.provenance.json` next to the PNG.
- No backend changes required.
- Tizita ingestion can be retroactive whenever you're ready.

**This unblocks everything else.** You stop losing context immediately.

### Phase 1 — Tizita storehouse (3-5 days)
- Add `Generation` + `Workflow` models to Tizita backend.
- Build `POST /api/generations/import` endpoint.
- Modify `TizitaCapture` to POST live (with sidecar fallback).
- Backfill: write a one-shot script that scans `D:/Visuals/ComfyUI/output/` for PNGs with sidecars and ingests them.

After this: searchable, curatable index of every generation you've ever made.

### Phase 2 — Tizita UI (3-5 days)
- "Generations" view in Tizita frontend.
- Per-generation detail panel.
- "Reprompt in ComfyUI" button (downloads workflow JSON, opens it).
- "Reprompt in Genoma" button (pushes prompt + LoRA stack to Genoma).

### Phase 3 — Genoma integration (2-3 days)
- Genoma side: "Pull from Tizita" picker in the prompt UI.
- Cross-app handoff via Tizita's API.
- Storyboard frame → can resolve to a generation, then re-run.

### Phase 4 — taste loop (existing, 1 day)
- Loop 2 sync script (top-K → IP-Adapter refs) — already designed in COMFYUI_TIZITA_RATING_BRIDGE.md.
- Loop 3 LoRA training (when corpus has 100+ favourites).

---

## Schema + endpoint summary (for the build)

```
TABLE photos (existing)
  + add column: generation_id UUID NULLABLE  (FK -> generations.id)
  + add column: source TEXT  (comfyui, replicate, manual_upload, etc.)

TABLE generations (new)
  id UUID PK
  photo_id INT FK -> photos.id
  engine TEXT
  model_base TEXT
  lora_stack JSONB
  prompt_positive TEXT
  prompt_negative TEXT
  sampler TEXT
  scheduler TEXT
  steps INT
  cfg FLOAT
  guidance FLOAT
  seed BIGINT
  width INT
  height INT
  refs_used JSONB
  workflow_sha256 TEXT FK -> workflows.sha256
  output_sha256 TEXT
  duration_seconds FLOAT
  created_at TIMESTAMPTZ

TABLE workflows (new)
  sha256 TEXT PK
  name TEXT
  json_blob JSONB
  created_at TIMESTAMPTZ

ENDPOINTS
  POST  /api/generations/import       -- multipart: png + provenance.json
  GET   /api/generations/{id}
  GET   /api/generations/{id}/workflow
  GET   /api/generations/search        -- filters: prompt, model, lora, rating, cluster, date_range
  POST  /api/generations/{id}/clone    -- returns a draft for re-run with new seed
  GET   /api/workflows/{sha256}
```

---

## Open questions before build

1. Tizita's existing `Photo` table — does it have a `metadata` JSONB column already, or does it need migration to add `generation_id`?
2. Does Genoma have a "load prompt from external source" surface, or is that net new?
3. Storage: PNG sidecar JSONs in the same folder, or a `D:/Visuals/ComfyUI/output/.provenance/` directory? (Sidecar is simpler, but clutters the output folder.)
4. Should the workflow JSON store be content-addressed (SHA-256) or named (workflow_<datetime>)? Content-addressed wins on dedup.
5. Per-generation duration — track via ComfyUI's prompt completion event, or measure from KSampler start to end?

These get answered when I read Tizita's existing `photos.py` router.

---

## Net move

**Phase 0 alone is huge.** It costs nothing once built and gives you a self-describing record of every generation. Even if Tizita backend work slips, you stop bleeding context immediately.

Recommend: build Phase 0 today. Then Phase 1 in parallel with the Sembla brand pilot work. Phase 2-4 follow as the data grows.
