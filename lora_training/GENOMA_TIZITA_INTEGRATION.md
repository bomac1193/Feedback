# Genoma + Tizita (Ikenga) integration

> Notes on what's wired, what's deferred, and the ecosystem-organisation strategy.

## What ships now

### Send to Tizita (already existed)
- Genoma Lab generates a render
- More menu (⋯) on Preview pane → "Send to Tizita"
- Uploads render to Tizita as a Photo, replaces the SeriesItem's `photo_id`
- Creates a checkpoint of the prior state (recoverable)

### Send as Main Pick (new this session)
- Same menu, second button below "Send to Tizita"
- Uploads + replaces photo, AND sets:
  - `SeriesItem.conviction = "main_pick"`
  - `SeriesItem.shot_state = "final"`
- Use when this render IS the chosen one for that storyboard shot
- Tizita downstream (Slayt, Crucibla, Imprint) can query by these fields

### Lightweight conviction toggle (new)
- New endpoint `POST /api/tizita/series-item/[seriesId]/[itemId]/conviction`
- Body: `{ conviction?, shot_state? }`
- Flips an already-attached render's main-pick status without re-uploading
- Useful for swapping mains across alternates that are already in Tizita

## Deferred follow-up: candidates-per-shot view

The renders feed `/renders` shows all past Genoma renders by series tag (Move U, Calypseo, etc) but **not by individual shot**. To get a "see all candidates for this specific shot" view:

1. Add `seriesItemId` to `RenderAsset` type in `types/render.ts`
2. Capture it during render save (lab page already has it in URL params via `tizitaSource.seriesItemId`)
3. Pipe it through the renders API and filter in `app/renders/page.tsx`
4. Add a `<button>` group: All / Series / This Shot
5. Highlight the current `evolved_image_url` as "current main"

Estimated: 30 min. Worth doing once the music video pipeline is producing many renders per shot. For now, "Send as Main Pick" from the Lab Preview pane gives the core capability.

## Ecosystem organisation: where to link external projects

### Existing Tizita concepts (don't duplicate these)

| Concept | Use |
|---|---|
| **Photo** | Single image |
| **Cluster** | Group of related photos: takes (alternates of same shot) or variants (facets of same subject) |
| **Collection** | User-organised bucket. Maps to Crucibla project. Types: single / album / sandbox / other |
| **Series** | Storyboard / shot sequence. Music video, lookbook, carousel. Has SeriesItems (beats). |
| **Era** | A creative period |
| **Crucibla Project** | Release-level project (the song / album campaign) |

### Where external projects (Blender, CLO3D, FL Studio etc.) should live

**Verdict: split between Crucibla and Series, depending on scope.**

| External asset | Best home | Why |
|---|---|---|
| Blender world model for the album | **Crucibla project** | Project-wide reuse across many storyboards |
| FL Studio / Ableton master session | **Crucibla project** | Tied to the song, not a specific shot |
| Marvelous Designer garment library | **Crucibla project** | Reusable across shoots |
| Blender scene for shot 3 of Move U | **Tizita Series** (or SeriesItem) | Storyboard-specific |
| TouchDesigner patch for chorus visualiser | **Tizita Series** | Bound to one storyboard's flow |
| DaVinci edit project | **Tizita Series** | One per storyboard |
| Reusable LUTs, plugin presets | **Crucibla project** or **Era** | Cross-cutting |

### Schema extension proposal

Add an `external_assets` JSON field to both `Crucibla.Project` and `Tizita.Series`:

```ts
type ExternalAsset = {
  id: string;
  type: "blender" | "marvelous_designer" | "clo3d" | "fl_studio" | "ableton" | "premiere" | "davinci" | "max_msp" | "touchdesigner" | "unreal" | "other";
  name: string;
  path?: string;      // local filesystem (\\wsl.localhost\... or D:\...)
  url?: string;       // cloud URL if applicable
  description?: string;
  last_used_at?: ISO8601;
  is_canonical?: boolean;  // the "official" asset for this project
}
```

**Implementation effort**: ~1 hour. JSON column on existing tables, no migration of existing data needed.

### Drag-and-drop clusters in browse view

**Verdict: yes, build it. Clusters are the underused power tool.**

Tizita already has the `Cluster` model (`kind`: takes / variants / auto). The data plumbing is done. What's missing is the UX to create them quickly.

Proposed browse-view interaction:

| Action | Result |
|---|---|
| Drag photo A onto photo B | Creates a new cluster with kind=takes, both as members. Asks for a name. |
| Drag photo C onto an existing cluster | Adds C as a member |
| Right-click cluster → "Set rep" | Pins which photo represents the cluster in storyboards |
| Right-click cluster → "Convert to variants" | Flips kind from takes → variants (different roles) |

Why this matters:
- Without easy clustering, every alternate take stays as a separate Photo, polluting the browse view
- With clusters, the rep ships in storyboards while alternates are one click away
- Genoma renders that drift from the picked one can land in the same cluster as alternates (variants kind), keeping the storyboard clean

**Implementation effort**: Tizita frontend only. ~2-3 hours for drag-drop with cluster naming, member roles, rep-pinning UI.

## Sequenced roadmap for this layer

1. **Now**: Use what's wired. Send to Tizita / Send as Main Pick from Genoma Lab. Keeps storyboards clean.
2. **Next** (when needed): Per-shot candidates view on Genoma renders feed.
3. **Later** (organisation pass): Add `external_assets` JSON field to Crucibla Project + Tizita Series. Folder-link Blender / MD / Ableton / etc. by scope.
4. **Later** (browse UX): Drag-drop clusters in Tizita browse view. Cluster all variants without leaving the page.
5. **Future** (ecosystem closure): Slayt requests storyboards via Tizita Series API → Genoma generates → renders auto-tagged to right shots. The closed loop.
