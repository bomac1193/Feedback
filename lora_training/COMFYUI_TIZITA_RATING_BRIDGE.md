# ComfyUI ↔ Tizita rating bridge

Plan for adding Tizita-style rating UI (crown / favourite / 5-star / trash) directly inside ComfyUI's output gallery, with every rating writing to Tizita's existing API. Single source of truth: Tizita.

---

## Why this design

Tizita already owns rating logic, taste vectors, and Visual DNA. Building a parallel ratings store inside ComfyUI duplicates state and forces a sync layer later. Pointing the buttons at Tizita's API instead means:

- Rate from where you generate (no tab switching).
- One database (Tizita's).
- Tizita's existing taste vector + Visual DNA pipeline picks up ComfyUI outputs automatically.
- Loop 2 (top-K favourites → IP-Adapter references) feeds back into the next batch.

---

## Architecture

```
ComfyUI generates output
       ↓
saved to D:/Visuals/ComfyUI/output/<filename>.png
       ↓
extension overlays buttons in the gallery: [♛] [♥] [★★★★★] [🗑]
       ↓
click → POST http://localhost:8001/api/photos/rate { path, rating, crown, favourite, trash }
       ↓
Tizita ingests (or matches existing path) and stores rating
       ↓
Tizita's taste vector updates
       ↓
nightly: top-K favourites symlink → D:/Visuals/ComfyUI/input/_alabo/style_refs/
       ↓
next ComfyUI batch's IP-Adapter rotates through fresh favourites
```

---

## Build plan

### 1. Confirm Tizita's API surface
Inspect `tizita/backend/app/application/routers/photos.py` and `ratings.py` to find:
- The endpoint that accepts a rating: probably `POST /api/photos/{id}/rating` or `POST /api/photos/import_and_rate`.
- Required payload shape (rating value, crown bool, favourite bool, trash bool).
- Auth model — token, cookie, or open localhost.
- Whether Tizita can ingest by file path (preferred) or requires upload.

### 2. ComfyUI extension layout
```
D:\Visuals\ComfyUI\custom_nodes\comfyui-tizita-rating\
├── __init__.py            # empty or minimal node registration
├── pyproject.toml
├── web\
│   └── extension.js       # the actual UI logic: button overlay + POST
└── README.md
```

The extension is mostly JS (ComfyUI's frontend is web-based). The Python side just registers the directory so ComfyUI picks up the JS at startup.

### 3. extension.js responsibilities
- Hook into ComfyUI's image gallery / output panel render lifecycle.
- For each output thumbnail, append four buttons: crown, favourite, 5-star (sub-buttons 1-5), trash.
- On click, fetch the file path from the thumbnail's data attribute.
- POST to Tizita with the path + rating action.
- Show inline feedback (button highlights, toast).

### 4. Tizita endpoint contract (target shape)
```
POST /api/photos/rate
{
  "source": "comfyui",
  "file_path": "D:/Visuals/ComfyUI/output/alabo_full_outfit_00012_.png",
  "action": "crown" | "favourite" | "trash" | "star",
  "star_rating": 1..5 | null
}
```
Tizita auto-imports the file if not already in its index. Returns 200 + the photo's Tizita id.

### 5. Loop 2 sync script (separate, runs nightly)
- Pull `GET /api/photos/top-k?k=10&min_rating=4` from Tizita.
- Symlink (or copy) the resulting paths into `D:/Visuals/ComfyUI/input/_alabo/style_refs/`.
- Cleanup: if files in `style_refs/` no longer in top-K, remove them.
- Schedule via Windows Task Scheduler or run on demand from gen.py.

---

## Build effort estimate

| Phase | Effort |
|---|---|
| Confirm Tizita API + add `/rate` endpoint if missing | 30-60 min |
| ComfyUI extension JS | 2-3 hr |
| Loop 2 sync script | 1 hr |
| Smoke test end-to-end | 30 min |
| **Total** | **~half a day** |

---

## Why this beats every alternative

| Approach | Verdict |
|---|---|
| Existing ComfyUI plugin (pythongosssss favourites) | Single boolean, no taste vector, no Tizita link |
| Tab-switch to Tizita to rate | Works but high friction, slows loop |
| Build a separate ratings DB in ComfyUI | Duplicate state, sync nightmare |
| **ComfyUI extension → Tizita API** | Same UX as plugin, single source of truth, taste vector compounds |

---

## Open questions

1. Does Tizita auto-ingest a file by path, or does the bridge need to copy/upload first?
2. Is there a Tizita batch-rate endpoint, or one POST per click?
3. Should ComfyUI ratings show a Tizita-side flag like `source: comfyui` so they can be filtered out / treated differently in Tizita's analytics?
4. Should the LoRA training set automatically include any photo rated 5★ + crown? (This closes the loop into Loop 3 — taste LoRA training.)

These get answered during build by inspecting Tizita's existing routers and asking the user.
