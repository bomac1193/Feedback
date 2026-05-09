#!/usr/bin/env python3
"""
Validate a master + cut JSON against the music video schema.

Usage:
    python music_video_validator.py path/to/master.json
    python music_video_validator.py path/to/master.json --cut full_mv

Returns exit code 0 on success, 1 on validation errors.
The validator also resolves anchor placement rules into a flat segment list
so authors can preview what the renderer would produce.
"""

import argparse
import json
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


VALID_PLACE_RULES = {"time", "beat", "bar", "section", "lyric", "word", "any_of"}
VALID_DURATION_RULES = {
    "seconds", "beats", "bars",
    "until_next_beat", "until_next_bar", "until_section_end", "until_next_lyric",
    "phrase_words",
}
VALID_SECTION_KINDS = {"intro", "verse", "chorus", "bridge", "pre_chorus", "outro", "interlude", "drop"}


@dataclass
class ValidationReport:
    errors: list[str] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)
    segments: list[dict[str, Any]] = field(default_factory=list)

    @property
    def ok(self) -> bool:
        return not self.errors


def _err(report: ValidationReport, where: str, msg: str) -> None:
    report.errors.append(f"[{where}] {msg}")


def _warn(report: ValidationReport, where: str, msg: str) -> None:
    report.warnings.append(f"[{where}] {msg}")


def validate_master_shape(master: dict, report: ValidationReport) -> None:
    required_top = ["master_id", "audio", "lyrics_aligned", "beats", "sections", "anchors", "cuts"]
    for key in required_top:
        if key not in master:
            _err(report, "master", f"missing required field: {key}")

    audio = master.get("audio", {})
    if "duration_seconds" not in audio:
        _err(report, "master.audio", "missing duration_seconds")
    elif not isinstance(audio["duration_seconds"], (int, float)):
        _err(report, "master.audio", "duration_seconds must be a number")

    sections = master.get("sections", {}).get("list", [])
    duration = audio.get("duration_seconds", 0)
    for idx, section in enumerate(sections):
        kind = section.get("kind")
        if kind not in VALID_SECTION_KINDS:
            _warn(report, f"section[{idx}]", f"unusual section kind: {kind}")
        s, e = section.get("start"), section.get("end")
        if s is None or e is None or s >= e:
            _err(report, f"section[{idx}]", "invalid start/end")
        if duration and e and e > duration + 0.01:
            _warn(report, f"section[{idx}]", f"end {e} exceeds audio duration {duration}")


def validate_anchors(master: dict, report: ValidationReport) -> None:
    seen_ids = set()
    for idx, anchor in enumerate(master.get("anchors", [])):
        a_id = anchor.get("anchor_id")
        if not a_id:
            _err(report, f"anchor[{idx}]", "missing anchor_id")
            continue
        if a_id in seen_ids:
            _err(report, f"anchor[{a_id}]", "duplicate anchor_id")
        seen_ids.add(a_id)

        place = anchor.get("place", {})
        if place.get("rule") not in VALID_PLACE_RULES:
            _err(report, f"anchor[{a_id}].place", f"unknown rule: {place.get('rule')}")

        duration = anchor.get("duration", {})
        if duration.get("rule") not in VALID_DURATION_RULES:
            _err(report, f"anchor[{a_id}].duration", f"unknown rule: {duration.get('rule')}")


def resolve_place(anchor: dict, master: dict) -> list[float]:
    """Resolve a placement rule to a list of start times (seconds)."""
    place = anchor["place"]
    rule = place["rule"]

    if rule == "time":
        return [float(place["seconds"])]

    if rule == "section":
        kind = place["kind"]
        instance = place.get("instance", 1)
        offset = place.get("offset_seconds", 0.0)
        matches = [s for s in master["sections"]["list"] if s["kind"] == kind]
        if instance == "all":
            return [m["start"] + offset for m in matches]
        return [matches[instance - 1]["start"] + offset] if 1 <= instance <= len(matches) else []

    if rule == "beat":
        grid = master["beats"]["grid"]
        every = place.get("every", 1)
        starting_at_bar = place.get("starting_at_bar", 1)
        relevant = [g for g in grid if g.get("bar", 0) >= starting_at_bar]
        return [relevant[i]["time"] for i in range(0, len(relevant), every)]

    if rule == "bar":
        grid = master["beats"]["grid"]
        idx = place["index"]
        offset_beats = place.get("offset_beats", 0.0)
        downbeat = next((g for g in grid if g.get("bar") == idx and g.get("beat_in_bar") == 1), None)
        if not downbeat:
            return []
        if offset_beats == 0:
            return [downbeat["time"]]
        sec_per_beat = 60.0 / master["beats"]["tempo_bpm"]
        return [downbeat["time"] + offset_beats * sec_per_beat]

    if rule == "lyric":
        words = master["lyrics_aligned"]["words"]
        match_text = place["match"].lower().split()
        instance = place.get("instance", 1)
        offset_words = place.get("offset_words", 0)
        n = len(match_text)
        hits = []
        for i in range(len(words) - n + 1):
            window = [words[i + j]["word"].lower().strip(",.!?\"'") for j in range(n)]
            if window == match_text:
                target_idx = max(0, i + offset_words)
                hits.append(words[target_idx]["start"])
        return [hits[instance - 1]] if 1 <= instance <= len(hits) else hits if instance == "all" else []

    if rule == "word":
        words = master["lyrics_aligned"]["words"]
        idx = place["index"]
        return [words[idx]["start"]] if 0 <= idx < len(words) else []

    return []


def resolve_duration(anchor: dict, master: dict, start_time: float) -> float:
    duration = anchor["duration"]
    rule = duration["rule"]

    if rule == "seconds":
        return float(duration["value"])
    if rule == "beats":
        sec_per_beat = 60.0 / master["beats"]["tempo_bpm"]
        return duration["count"] * sec_per_beat
    if rule == "bars":
        sec_per_beat = 60.0 / master["beats"]["tempo_bpm"]
        beats_per_bar = master["beats"]["time_signature"][0]
        return duration["count"] * beats_per_bar * sec_per_beat
    if rule == "until_section_end":
        for section in master["sections"]["list"]:
            if section["start"] <= start_time < section["end"]:
                return section["end"] - start_time
        return 0.0
    if rule == "until_next_bar":
        grid = master["beats"]["grid"]
        nxt = next((g["time"] for g in grid if g.get("beat_in_bar") == 1 and g["time"] > start_time), None)
        return (nxt - start_time) if nxt else 0.0
    if rule == "until_next_beat":
        grid = master["beats"]["grid"]
        nxt = next((g["time"] for g in grid if g["time"] > start_time), None)
        return (nxt - start_time) if nxt else 0.0
    if rule == "until_next_lyric":
        words = master["lyrics_aligned"]["words"]
        nxt = next((w["start"] for w in words if w["start"] > start_time), None)
        return (nxt - start_time) if nxt else 0.0
    if rule == "phrase_words":
        words = master["lyrics_aligned"]["words"]
        n = duration["count"]
        for i, w in enumerate(words):
            if abs(w["start"] - start_time) < 0.05:
                end_i = min(i + n - 1, len(words) - 1)
                return words[end_i]["end"] - start_time
        return 0.0
    return 0.0


def resolve_cut_to_segments(master: dict, cut: dict) -> list[dict]:
    anchors_by_id = {a["anchor_id"]: a for a in master["anchors"]}
    segments: list[dict] = []
    for track in cut.get("tracks", []):
        z = track.get("z", 1)
        for anchor_id in track.get("anchors", []):
            anchor = anchors_by_id.get(anchor_id)
            if not anchor:
                continue
            for start in resolve_place(anchor, master):
                duration = resolve_duration(anchor, master, start)
                if duration <= 0:
                    continue
                segments.append({
                    "anchor_id": anchor_id,
                    "track_id": track["track_id"],
                    "z": z,
                    "start": start,
                    "end": start + duration,
                })

    window = cut.get("render_window")
    if window:
        ws, we = window["start"], window["end"]
        clipped = []
        for seg in segments:
            s, e = max(seg["start"], ws), min(seg["end"], we)
            if s < e:
                clipped.append({**seg, "start": s, "end": e})
        segments = clipped

    segments.sort(key=lambda s: (s["start"], -s["z"]))
    return segments


def detect_overlaps_per_track(segments: list[dict], report: ValidationReport) -> None:
    by_track: dict[str, list[dict]] = {}
    for seg in segments:
        by_track.setdefault(seg["track_id"], []).append(seg)
    for track_id, segs in by_track.items():
        segs_sorted = sorted(segs, key=lambda s: s["start"])
        for i in range(1, len(segs_sorted)):
            prev, cur = segs_sorted[i - 1], segs_sorted[i]
            if cur["start"] < prev["end"] - 0.001:
                _err(
                    report,
                    f"track[{track_id}]",
                    f"overlap between {prev['anchor_id']} ({prev['start']:.2f}-{prev['end']:.2f}) "
                    f"and {cur['anchor_id']} ({cur['start']:.2f}-{cur['end']:.2f})",
                )


def validate(master_path: Path, cut_id: str | None) -> ValidationReport:
    report = ValidationReport()
    master = json.loads(master_path.read_text())

    validate_master_shape(master, report)
    validate_anchors(master, report)

    cuts = master.get("cuts", [])
    cuts_to_check = [c for c in cuts if cut_id is None or c["cut_id"] == cut_id]
    if cut_id and not cuts_to_check:
        _err(report, "cut", f"cut_id not found: {cut_id}")

    for cut in cuts_to_check:
        segments = resolve_cut_to_segments(master, cut)
        detect_overlaps_per_track(segments, report)
        report.segments.extend([{**s, "cut_id": cut["cut_id"]} for s in segments])

    return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("master", type=Path, help="path to master.json")
    parser.add_argument("--cut", type=str, default=None, help="optional cut_id; if omitted, all cuts are validated")
    parser.add_argument("--print-segments", action="store_true", help="print resolved segment list")
    args = parser.parse_args()

    if not args.master.exists():
        print(f"error: file not found: {args.master}", file=sys.stderr)
        return 2

    report = validate(args.master, args.cut)

    for w in report.warnings:
        print(f"WARN  {w}")
    for e in report.errors:
        print(f"ERROR {e}", file=sys.stderr)

    if args.print_segments:
        print("\nresolved segments:")
        for s in report.segments:
            print(f"  {s['cut_id']:20s} {s['track_id']:14s} z={s['z']} "
                  f"{s['start']:7.2f} -> {s['end']:7.2f}  anchor={s['anchor_id']}")

    if report.ok:
        print(f"\nOK  {len(report.segments)} segments resolved across {len({s['cut_id'] for s in report.segments})} cut(s)")
        return 0
    print(f"\nFAIL  {len(report.errors)} error(s), {len(report.warnings)} warning(s)", file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
