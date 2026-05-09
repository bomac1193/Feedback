# Music Video Render Schema

Contract for Ibis, Crucibla, Chromox, Tizita, and the gen.py renderer. The master song is immutable. Visual ideas attach as algorithmic placement rules, not as file slices. Cuts are named projections of the master.

---

## 0. Ownership map

Master state is a virtual object composed from four owners. Nobody duplicates.

| Owner | Owns | Endpoint Tizita uses |
|---|---|---|
| **Ibis** | Authored lyrics (writer's text, line breaks, intent) | `GET /api/song/{id}/lyrics_authored` |
| **Crucibla** | Song asset (audio file, mix versions, release metadata, section labels) | `GET /api/song/{id}/asset`, `GET /api/song/{id}/sections` |
| **Chromox** | WhisperX transcription, force-aligned lyric tree, beat grid | `GET /api/song/{id}/aligned_lyrics`, `GET /api/song/{id}/beats` |
| **Tizita** | Anchors, cuts, storyboard linkage, the timeline UI | `GET /api/master/{id}` (composite), per-cut routes |

Tizita uses one composite endpoint to assemble these on read; each upstream system stays isolated.

### Composite endpoint contract

```
GET /api/master/{song_id}
  -> 200 OK
{
  "master_id": "...",
  "audio": { "url": "...", "duration_seconds": 187.4, "from": "crucibla" },
  "lyrics_authored": { "doc_id": "...", "text": "...", "from": "ibis" },
  "lyrics_whisperx": { "words": [...], "from": "chromox" },
  "lyrics_aligned":  { "words": [...], "from": "chromox" },
  "beats":           { "tempo_bpm": 84, "grid": [...], "from": "chromox" },
  "sections":        { "list": [...], "from": "crucibla" },
  "anchors":         [...],
  "cuts":            [...]
}
```

Three lyric layers ship together. The renderer uses `lyrics_aligned`. The other two are kept forever per the "raw transcript is the moat" rule, regenerable but never destroyed.

---

## 1. Master state (immutable, single source of truth)

The song is never sliced or destructively edited. All views are derived.

```json
{
  "master_id": "alabo_song_03",
  "audio_path": "/path/to/master.wav",
  "duration_seconds": 187.4,
  "tempo_bpm": 84,
  "time_signature": [4, 4],
  "beat_grid": [
    { "index": 0, "time": 0.000, "kind": "downbeat", "bar": 1, "beat_in_bar": 1 },
    { "index": 1, "time": 0.714, "kind": "beat",     "bar": 1, "beat_in_bar": 2 }
  ],
  "lyrics": [
    { "word_index": 0, "word": "fire", "start": 12.314, "end": 12.612, "bar": 5, "beat_in_bar": 1 },
    { "word_index": 1, "word": "in",   "start": 12.612, "end": 12.770 }
  ],
  "sections": [
    { "kind": "intro",  "instance": 1, "start": 0.000,   "end": 12.000 },
    { "kind": "verse",  "instance": 1, "start": 12.000,  "end": 36.000 },
    { "kind": "chorus", "instance": 1, "start": 36.000,  "end": 60.000 },
    { "kind": "verse",  "instance": 2, "start": 60.000,  "end": 84.000 },
    { "kind": "chorus", "instance": 2, "start": 84.000,  "end": 108.000 }
  ]
}
```

`beat_grid` and `lyrics` come from Chromox / WhisperX. `sections` come from Tizita's `song_sections` router or are authored.

---

## 2. Anchor (image + rule, never time directly)

An anchor never owns a timestamp. It owns a **rule** that the renderer evaluates against the master to produce time.

```json
{
  "anchor_id": "a_hero_chorus",
  "image_id": "ubani_red_studio.png",
  "kind": "still_to_video",
  "place":    { "rule": "section", "kind": "chorus", "instance": "all" },
  "duration": { "rule": "until_section_end" },
  "render_hints": {
    "i2v_model": "kling-3-omni",
    "lipsync": true,
    "prompt_extra": "wide shot, slow push, deep blacks"
  }
}
```

`kind` values: `still_to_video` (image to motion), `clip` (existing video, lipsync only), `loop` (loop a short clip across the duration).

---

## 3. Placement rules

| rule | shape | resolves to |
|---|---|---|
| `time` | `{ rule: "time", seconds: 42.5 }` | absolute seconds |
| `beat` | `{ rule: "beat", every: 8, starting_at_bar: 9 }` | every Nth beat from a starting bar |
| `bar` | `{ rule: "bar", index: 17, offset_beats: -0.5 }` | start of a bar, offset in beats |
| `section` | `{ rule: "section", kind: "chorus", instance: 2 }` or `instance: "all"` | section start (with `offset_seconds` or `offset_beats`) |
| `lyric` | `{ rule: "lyric", match: "fire in the rain", instance: 1, offset_words: -1 }` | start of a lyric phrase |
| `word` | `{ rule: "word", index: 142 }` | start of a specific word |
| `any_of` | `{ rule: "any_of", anchors: ["a_03","a_07","a_11"], seed: 42 }` | one anchor picked deterministically by seed; rotates across instances |

Placement rules MAY be quantized: `{ "snap": "beat" }` rounds resolved time to the nearest beat. Default: no snap.

---

## 4. Duration rules

| rule | shape | resolves to |
|---|---|---|
| `seconds` | `{ rule: "seconds", value: 4.2 }` | fixed seconds |
| `beats` | `{ rule: "beats", count: 8 }` | beats from placement |
| `bars` | `{ rule: "bars", count: 2 }` | bars from placement |
| `until_next_beat` / `until_next_bar` | no params | distance to next grid point |
| `until_section_end` | no params | distance to current section's end |
| `until_next_lyric` | no params | distance to next word start |
| `phrase_words` | `{ rule: "phrase_words", count: 4 }` | from current word, span N words |

---

## 5. Cuts and tracks

A cut is a projection of the master. Multiple cuts coexist. Each cut has one or more tracks, like NLE layers. Higher `z` wins on overlap.

```json
{
  "cut_id": "ig_teaser_30s",
  "master_id": "alabo_song_03",
  "render_window": { "start": 22.0, "end": 52.0 },
  "tracks": [
    { "track_id": "main", "z": 1, "anchors": ["a_hero_chorus", "a_verse_broll_1"] },
    { "track_id": "interjections", "z": 2, "anchors": ["a_quick_cuts_chorus"] }
  ]
}
```

`render_window` clips the cut to a sub-range of the master. Anchors that resolve outside the window are dropped.

---

## 6. Render pipeline (pure function)

```
render(master, cut) -> final.mp4

1. Load master.audio, beat_grid, lyrics, sections.
2. For each anchor in each track of the cut:
     resolved = resolve_placement(anchor.place, master)
     duration  = resolve_duration(anchor.duration, master, resolved)
     emit { anchor, start, end, track_id, z }
3. Clip emitted segments to cut.render_window.
4. Resolve overlaps by z (higher wins). Output = flat segment list.
5. For each segment:
     a. Slice audio from master in memory (no file write).
     b. I2V: anchor.image_id -> moving clip of length (end - start).
     c. If anchor.render_hints.lipsync == true and segment overlaps any lyric word:
           LatentSync(clip, audio_slice) -> synced_clip
        else:
           synced_clip = clip
     d. Cache key: hash(anchor_id, image_id, audio_slice_hash, render_hints)
        If cached, reuse.
6. Concat synced_clips in order. Mux master.audio (sliced to render_window).
7. Write final.mp4.
```

The renderer is the only place audio is ever sliced. Slicing is always in memory. The master file never moves.

---

## 7. Worked example

Master = a 3 minute song with intro / verse 1 / chorus 1 / verse 2 / chorus 2 / outro.

```json
{
  "cut_id": "full_mv",
  "master_id": "alabo_song_03",
  "tracks": [
    { "track_id": "main", "z": 1, "anchors": [
        "a_intro_logo",
        "a_verse_broll_rotate",
        "a_hero_chorus",
        "a_outro_credits"
    ]},
    { "track_id": "flashes", "z": 2, "anchors": [
        "a_chorus_quick_cuts"
    ]}
  ]
}
```

- `a_intro_logo` -> `place: { rule: "section", kind: "intro" }, duration: until_section_end`
- `a_verse_broll_rotate` -> `place: { rule: "section", kind: "verse", instance: "all" }, duration: until_section_end, image_id` resolved via `any_of` rotation across 4 b-roll images.
- `a_hero_chorus` -> `place: { rule: "section", kind: "chorus", instance: "all" }, duration: until_section_end`
- `a_chorus_quick_cuts` -> `place: { rule: "beat", every: 4, starting_at_bar: 17 }, duration: { rule: "beats", count: 1 }, image_id` from `any_of` set
- `a_outro_credits` -> `place: { rule: "section", kind: "outro" }, duration: until_section_end`

Render produces a fully composed music video. Swap the master to a remix with extra chorus, the renderer still binds correctly.

---

## 8. Storage layout (suggested)

- **Tizita** owns: anchors, cuts, render_hints. Stored as JSONB on a series row (`series.music_video`) plus a child `anchors` table for queryability.
- **Chromox** owns: lyrics + beat_grid for a master. Tizita references by `master_id`, fetches via API.
- **gen.py** owns: the renderer. Reads master + cut JSON, drives ComfyUI / Replicate, writes final.mp4 and per-segment cache.

---

## 9. Open questions (to decide before code)

1. Where does `master_id` live as truth? Probably Chromox.
2. Sections are authored or detected? If detected, by what tool?
3. Cache invalidation: hash on what? (Image bytes, audio slice bytes, render_hints, model versions.)
4. How do we handle two anchors on the same track that resolve to overlapping ranges? (Reject at validate time, or implicit truncation.)
5. Do we precompute the segment list and let the user preview before rendering? Likely yes.
6. Determinism of `any_of` rotation: pure function of (seed, instance_index) so re-renders are stable.
