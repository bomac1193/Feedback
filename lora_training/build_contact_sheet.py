"""
Build a visual contact sheet of the apex_118 set so you can review every
image before training. Outputs an HTML page with thumbnails, conviction
scores, and captions.

Open the resulting file in a browser:
    file:///home/sphinxy/Feedback/lora_training/apex_118_index.html
"""

from __future__ import annotations

import json
from html import escape
from pathlib import Path

from PIL import Image

DIR = Path("/home/sphinxy/Feedback/lora_training/apex_118")
THUMBS = DIR / "_thumbs"
OUT = Path("/home/sphinxy/Feedback/lora_training/apex_118_index.html")
THUMB_W = 320


def make_thumb(src: Path, dst: Path) -> tuple[int, int]:
    if dst.exists():
        with Image.open(dst) as im:
            return im.size
    with Image.open(src) as im:
        im = im.convert("RGB")
        ratio = THUMB_W / im.width
        new_h = int(im.height * ratio)
        im.thumbnail((THUMB_W, new_h), Image.LANCZOS)
        im.save(dst, "JPEG", quality=85)
        return im.size


def main() -> None:
    THUMBS.mkdir(exist_ok=True)
    manifest = json.load(open(DIR / "manifest.json"))

    cards = []
    for r in manifest:
        src = DIR / r["file"]
        if not src.exists():
            continue
        thumb = THUMBS / (Path(r["file"]).stem + ".jpg")
        w, h = make_thumb(src, thumb)
        cap_file = src.with_suffix(".txt")
        caption = cap_file.read_text().strip() if cap_file.exists() else ""
        source_label = (
            "Imagist" if "Imagist" in r["source"]
            else "Nano Banana" if "Nano Banana" in r["source"]
            else "Higgsfield" if "Higgsfield" in r["source"]
            else "MJ" if "Midjourney" in r["source"]
            else "Other"
        )
        cards.append(f"""
<div class="card">
  <img src="_thumbs/{thumb.name}" loading="lazy" />
  <div class="meta">
    <span class="rank">#{r['rank']:03d}</span>
    <span class="source {source_label.lower().replace(' ', '-')}">{source_label}</span>
    <span class="size">{r['size']}</span>
  </div>
  <div class="caption">{escape(caption)}</div>
</div>""")

    html = f"""<!doctype html>
<html><head>
<meta charset="utf-8">
<title>apex_118 — alabo_eye LoRA training set</title>
<style>
  body {{ background: #0a0a0a; color: #eee; font: 13px/1.4 -apple-system,sans-serif; margin: 0; padding: 24px; }}
  h1 {{ font-weight: 400; margin: 0 0 8px; }}
  .stats {{ color: #888; margin-bottom: 24px; }}
  .grid {{ display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 16px; }}
  .card {{ background: #141414; border-radius: 8px; overflow: hidden; }}
  .card img {{ width: 100%; display: block; }}
  .meta {{ padding: 8px 10px 4px; display: flex; gap: 8px; align-items: center; font-size: 11px; }}
  .rank {{ color: #666; font-family: monospace; }}
  .source {{ padding: 2px 6px; border-radius: 3px; font-size: 10px; }}
  .source.imagist {{ background: #4a2a5a; }}
  .source.nano-banana {{ background: #5a4a2a; }}
  .source.higgsfield {{ background: #2a4a5a; }}
  .source.mj {{ background: #5a2a4a; }}
  .source.other {{ background: #333; }}
  .size {{ color: #555; margin-left: auto; font-family: monospace; font-size: 10px; }}
  .caption {{ padding: 0 10px 10px; color: #999; font-size: 11px; }}
</style></head>
<body>
<h1>apex_118 — alabo_eye LoRA training set</h1>
<div class="stats">{len(cards)} photos · all conviction = 100 (crown + favorite + 5★) · trigger: <code>alabo_eye</code></div>
<div class="grid">
{''.join(cards)}
</div>
</body></html>"""

    OUT.write_text(html)
    print(f"Wrote {OUT}")
    print(f"Open: file://{OUT}")


if __name__ == "__main__":
    main()
