"""
Test the alabo_eye LoRA by submitting workflow_flux_bootstrap_alabo.json
directly to ComfyUI's API. Bypasses the UI entirely (the JSON files in
this project are API format, not UI format — they don't drag-and-drop).

Prereq: ComfyUI Desktop running on localhost:8000 (default port).

Usage:
    ~/tizita/backend/venv/bin/python test_lora_in_comfyui.py
    ~/tizita/backend/venv/bin/python test_lora_in_comfyui.py --no-lora     # vanilla FLUX
    ~/tizita/backend/venv/bin/python test_lora_in_comfyui.py --prompt "alabo_eye, dark portrait"

Results land at:
    D:/Visuals/ComfyUI/output/feedback_frame_*.png
"""

from __future__ import annotations

import argparse
import json
import sys
import time
import urllib.request
from pathlib import Path

COMFY = "http://localhost:8000"
WORKFLOW_LORA = Path("/home/sphinxy/Feedback/comfyui/workflow_flux_bootstrap_alabo.json")
WORKFLOW_VANILLA = Path("/home/sphinxy/Feedback/comfyui/workflow_flux_bootstrap.json")
DEFAULT_PROMPT = (
    "alabo_eye, long exposure photograph of molten copper droplets forming "
    "recursive nested rings on dark surface, deep shadows, high contrast, "
    "single light source, macro lens, black background"
)


def load_api_workflow(path: Path) -> dict:
    raw = json.load(open(path))
    return {
        k: {"class_type": v["class_type"], "inputs": dict(v["inputs"])}
        for k, v in raw.items() if not k.startswith("_")
    }


def queue_prompt(workflow: dict) -> str:
    payload = json.dumps({"prompt": workflow, "client_id": "lora_test"}).encode()
    req = urllib.request.Request(
        f"{COMFY}/prompt", data=payload, headers={"Content-Type": "application/json"}
    )
    resp = urllib.request.urlopen(req, timeout=10)
    return json.loads(resp.read())["prompt_id"]


def wait_for_completion(prompt_id: str, timeout: int = 60) -> dict | None:
    deadline = time.time() + timeout
    while time.time() < deadline:
        try:
            req = urllib.request.Request(f"{COMFY}/history/{prompt_id}")
            resp = urllib.request.urlopen(req, timeout=5)
            data = json.loads(resp.read())
            if data.get(prompt_id, {}).get("status", {}).get("completed"):
                return data[prompt_id]
        except Exception:
            pass
        time.sleep(1)
    return None


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--prompt", default=DEFAULT_PROMPT)
    ap.add_argument("--seed", type=int, default=42)
    ap.add_argument("--no-lora", action="store_true", help="Use vanilla FLUX (no LoRA)")
    ap.add_argument("--strength", type=float, default=1.0, help="LoRA strength (0-1.5)")
    args = ap.parse_args()

    wf_path = WORKFLOW_VANILLA if args.no_lora else WORKFLOW_LORA
    print(f"Loading: {wf_path.name}")
    workflow = load_api_workflow(wf_path)

    workflow["10"]["inputs"]["text"] = args.prompt
    workflow["50"]["inputs"]["seed"] = args.seed
    if not args.no_lora and "5" in workflow:
        workflow["5"]["inputs"]["strength_model"] = args.strength
        print(f"LoRA strength: {args.strength}")
    print(f"Prompt: {args.prompt[:80]}...")
    print(f"Seed: {args.seed}")
    print()

    try:
        prompt_id = queue_prompt(workflow)
    except Exception as e:
        print(f"ERROR: ComfyUI not reachable at {COMFY} — is it running?", file=sys.stderr)
        print(f"  {e}", file=sys.stderr)
        return 1

    print(f"Queued: {prompt_id}")
    print("Waiting for generation...")
    result = wait_for_completion(prompt_id, timeout=120)
    if not result:
        print("ERROR: timed out waiting for completion", file=sys.stderr)
        return 1

    outputs = result.get("outputs", {})
    for node_id, node_out in outputs.items():
        for img in node_out.get("images", []):
            print(f"  → {img['filename']} (subfolder: {img.get('subfolder', '')})")
    print()
    print("Done. Check D:/Visuals/ComfyUI/output/")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
