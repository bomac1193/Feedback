"""
Tizita top-N exporter for Feedback LoRA training.

Pulls highest-conviction photos directly from the Tizita SQLAlchemy models
(no HTTP), copies the underlying files into a flat staging folder.

Run via the Tizita backend venv so the models import cleanly:

    ~/tizita/backend/venv/bin/python export_tizita_top.py --explicit-only --top 200

Modes (strongest signal first):
    --explicit-only        best_photo=True OR favorite=True OR user_rating>=5
    --best-photo-only      best_photo=True only ("peak me" — strongest)
    --user-rating MIN      user_rating >= MIN (default 5.0)
    --sort best|personal   algorithmic ranking, falls through to stars_0_5

Captioning is a separate pass (caption_florence2.py).
"""

from __future__ import annotations

import argparse
import json
import shutil
import sys
from pathlib import Path

# Resolve Tizita backend on path so app.* imports work from any CWD.
TIZITA_BACKEND = Path("/home/sphinxy/tizita/backend")
sys.path.insert(0, str(TIZITA_BACKEND))

try:
    from app.infrastructure.database import SessionLocal
    from app.infrastructure.models import Photo
except ModuleNotFoundError as e:
    sys.stderr.write(
        f"Tizita imports failed ({e}). Run via the Tizita venv:\n"
        f"  ~/tizita/backend/venv/bin/python {Path(__file__).name} ...\n"
    )
    raise

from PIL import Image
from sqlalchemy import desc

STAGE_DIR = Path("/home/sphinxy/Feedback/lora_training/tizita_top")
MANIFEST = STAGE_DIR / "manifest.json"


def manual_conviction(photo) -> float:
    """Tizita Score redo formula: 50*crown + 25*fav + 5*rating - 10*needs_prompting."""
    score = 0.0
    if photo.best_photo:
        score += 50
    if photo.favorite:
        score += 25
    if photo.user_rating:
        score += 5 * float(photo.user_rating)
    if photo.needs_prompting:
        score -= 10
    return max(0.0, min(100.0, score))


def query_photos(args) -> list[Photo]:
    db = SessionLocal()
    q = db.query(Photo).filter(Photo.deleted_at.is_(None))

    if args.best_photo_only:
        q = q.filter(Photo.best_photo == True)
        order = desc(Photo.user_rating)
    elif args.explicit_only:
        q = q.filter(
            (Photo.best_photo == True)
            | (Photo.favorite == True)
            | (Photo.user_rating >= 5.0)
        )
        order = desc(Photo.user_rating)
    elif args.user_rating is not None:
        q = q.filter(Photo.user_rating >= args.user_rating)
        order = desc(Photo.user_rating)
    elif args.sort == "personal":
        q = q.filter(Photo.personal_taste_score_0_100.isnot(None))
        order = desc(Photo.personal_taste_score_0_100)
    else:  # best
        q = q.filter(Photo.global_score_0_100.isnot(None))
        order = desc(Photo.global_score_0_100)

    candidates = q.order_by(order).limit(max(args.top * 3, args.top)).all()
    if args.rank_by_conviction:
        candidates.sort(key=manual_conviction, reverse=True)
    return candidates[: args.top]


def passes_filters(path: Path, min_side: int) -> tuple[bool, str]:
    try:
        with Image.open(path) as im:
            w, h = im.size
            if min(w, h) < min_side:
                return False, f"too small ({w}x{h})"
            return True, f"{w}x{h}"
    except Exception as e:
        return False, f"open failed: {e}"


def resolve_source(photo: Photo) -> Path | None:
    for candidate in (photo.source_path, photo.file_path):
        if not candidate:
            continue
        p = Path(candidate)
        if p.exists():
            return p
    return None


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--top", type=int, default=200)
    ap.add_argument(
        "--sort", default="best", choices=["best", "personal"],
        help="Used only when no explicit filter is given",
    )
    ap.add_argument("--explicit-only", action="store_true")
    ap.add_argument("--best-photo-only", action="store_true")
    ap.add_argument("--user-rating", type=float, default=None)
    ap.add_argument("--min-side", type=int, default=1024)
    ap.add_argument("--symlink", action="store_true", help="Symlink instead of copying")
    ap.add_argument("--clean", action="store_true", help="Wipe stage dir before export")
    ap.add_argument(
        "--rank-by-conviction",
        action="store_true",
        default=True,
        help="Sort by manual_conviction score (Tizita Score redo formula)",
    )
    args = ap.parse_args()

    if args.clean and STAGE_DIR.exists():
        shutil.rmtree(STAGE_DIR)
    STAGE_DIR.mkdir(parents=True, exist_ok=True)

    photos = query_photos(args)
    if not photos:
        print("No photos matched. Have you marked any in the app yet?", file=sys.stderr)
        return 1

    if args.best_photo_only:
        mode = "best_photo=True"
    elif args.explicit_only:
        mode = "best_photo OR favorite OR user_rating>=5"
    elif args.user_rating is not None:
        mode = f"user_rating>={args.user_rating}"
    else:
        mode = f"sort={args.sort}"
    print(f"Pulled {len(photos)} candidates ({mode}).")

    manifest = []
    kept = skipped = missing = 0
    for i, photo in enumerate(photos):
        src = resolve_source(photo)
        rank = f"{i:04d}"
        if not src:
            missing += 1
            continue

        ok, info = passes_filters(src, args.min_side)
        if not ok:
            skipped += 1
            print(f"  [skip {rank}] {info}")
            continue

        ext = src.suffix.lower() or ".jpg"
        dest = STAGE_DIR / f"{rank}_{photo.id}{ext}"
        if dest.exists() or dest.is_symlink():
            dest.unlink()
        if args.symlink:
            dest.symlink_to(src)
        else:
            shutil.copy2(src, dest)

        manifest.append({
            "rank": i,
            "photo_id": str(photo.id),
            "manual_conviction": manual_conviction(photo),
            "best_photo": bool(photo.best_photo),
            "favorite": bool(photo.favorite),
            "user_rating": photo.user_rating,
            "needs_prompting": bool(photo.needs_prompting),
            "stars_0_5": photo.stars_0_5,
            "personal_taste": photo.personal_taste_score_0_100,
            "global_score": photo.global_score_0_100,
            "size": info,
            "source": str(src),
            "file": dest.name,
        })
        kept += 1
        if kept % 25 == 0:
            print(f"  staged {kept}/{len(photos)}")

    MANIFEST.write_text(json.dumps(manifest, indent=2))
    print(f"\nStaged: {kept}   Skipped: {skipped}   Missing on disk: {missing}")
    print(f"Folder: {STAGE_DIR}")
    print("Next:   python caption_florence2.py")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
