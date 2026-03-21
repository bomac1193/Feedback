# ============================================
# FEEDBACK — TouchDesigner ↔ ComfyUI Bridge
# ============================================
#
# This script runs inside a Script CHOP or Execute DAT in TouchDesigner.
# It sends audio feature data to ComfyUI's API and receives generated frames.
#
# SETUP:
#   1. ComfyUI running on localhost:8188 with --listen 0.0.0.0
#   2. Place this script in a Text DAT named 'comfyui_bridge'
#   3. Run from an Execute DAT or Timer CHOP callback
#
# HOW IT WORKS:
#   - Reads audio features from the OSC In CHOP (spectral, loudness, etc.)
#   - Maps features to ComfyUI generation parameters
#   - Sends prompt via ComfyUI API (WebSocket or HTTP)
#   - Saves previous frame to ComfyUI input for img2img temporal coherence
#   - Loads generated frame as a TOP texture
#
# ============================================

import json
import urllib.request
import os
import threading
import time
import math

# ============================================
# CONFIGURATION
# ============================================

COMFYUI_HOST = "localhost"
COMFYUI_PORT = 8000
COMFYUI_URL = f"http://{COMFYUI_HOST}:{COMFYUI_PORT}"

# Shared folder for frame exchange (ComfyUI output dir)
COMFYUI_OUTPUT_DIR = "D:/Visuals/ComfyUI/output"
COMFYUI_INPUT_DIR = "D:/Visuals/ComfyUI/input"

# Frame file for TD to load (latest generated frame)
FRAME_FILE = os.path.join(COMFYUI_OUTPUT_DIR, "feedback_frame_00001_.png")
PREV_FRAME_FILE = os.path.join(COMFYUI_INPUT_DIR, "feedback_frame_prev.png")

# Generation settings
MIN_INTERVAL = 1.0        # Minimum seconds between generation requests
USE_IMG2IMG = True         # Use previous frame for temporal coherence
BASE_SEED = 42             # Base seed (perturbed by triggers)

# Path to workflow JSON (on Windows side)
WORKFLOW_PATH_INIT = "D:/Music/Max Msp/Projects/Feedback/comfyui/workflow_api.json"
WORKFLOW_PATH_IMG2IMG = "D:/Music/Max Msp/Projects/Feedback/comfyui/workflow_img2img_api.json"


# ============================================
# STATE
# ============================================

class BridgeState:
    generating = False
    last_gen_time = 0
    frame_count = 0
    seed = BASE_SEED
    last_frame_path = ""
    initialized = False

    # Audio feature cache (updated by read_features)
    centroid = 0.5
    loudness = 0.3
    kuramoto_r = 0.5
    chaos_x = 0.0
    chaos_y = 0.0
    chaos_z = 0.0
    swarm_density = 0.5
    pitch_hz = 220.0
    trigger_count = 0

state = BridgeState()


# ============================================
# AUDIO FEATURE → COMFYUI PARAMETER MAPPING
# ============================================

def map_features_to_params():
    """Map audio features to ComfyUI generation parameters."""

    # --- Prompt modifiers based on audio character ---
    warmth_words = ""
    if state.centroid > 0.6:
        warmth_words = "warm amber golden light, fiery, "
    elif state.centroid < 0.3:
        warmth_words = "cool blue deep indigo, shadows, "
    else:
        warmth_words = "balanced cyan amber, "

    energy_words = ""
    if state.loudness > 0.6:
        energy_words = "intense, explosive, dense, saturated, "
    elif state.loudness < 0.2:
        energy_words = "minimal, sparse, quiet, dark, void, "
    else:
        energy_words = "flowing, organic, breathing, "

    structure_words = ""
    if state.kuramoto_r > 0.7:
        structure_words = "structured, geometric, crystalline, ordered, "
    elif state.kuramoto_r < 0.3:
        structure_words = "chaotic, dissolved, fragmented, scattered, "
    else:
        structure_words = "emerging, forming, transitional, "

    prompt = (
        f"{warmth_words}{energy_words}{structure_words}"
        "abstract generative art, dark background, luminous particles, "
        "chaotic trajectories, mathematical beauty, organic impossible geometry, "
        "deep shadows, high contrast"
    )

    # --- Denoise strength: loudness → abstraction ---
    # Loud = more change per frame, quiet = subtle evolution
    denoise = 0.3 + state.loudness * 0.45  # Range: 0.3 - 0.75

    # --- CFG scale: chaos regime → coherence ---
    # High Kuramoto r (groove locked) = higher CFG (more prompt adherence)
    # Low r (free) = lower CFG (more randomness)
    cfg = 5.0 + state.kuramoto_r * 4.0  # Range: 5.0 - 9.0

    # --- Steps: balance quality vs speed ---
    # More steps when things are calm (time to spare), fewer when intense
    steps = int(10 + (1.0 - state.loudness) * 8)  # Range: 10 - 18

    # --- Seed perturbation from trigger events ---
    seed = BASE_SEED + state.frame_count * 7 + state.trigger_count * 31

    return {
        "prompt": prompt,
        "denoise": round(denoise, 3),
        "cfg": round(cfg, 2),
        "steps": steps,
        "seed": seed,
    }


# ============================================
# READ AUDIO FEATURES FROM TD
# ============================================

def read_features():
    """Read current audio features from the OSC In CHOP."""
    try:
        # Try multiple OSC locations (step6, veve, or standalone)
        osc = op('/project1/osc_from_max')
        if osc is None:
            osc = op('osc_from_max')
        if osc is None:
            osc = op('/project1/feedback_viz/osc_in')
        if osc is None:
            return

        # Read available channels (names depend on Max OSC output)
        # Step6 sends: chaos/x, chaos/y, chaos/z, audio/amplitude
        # Or raw: x, y, z, L (via udpsend)
        # Veve sends: kuramoto/r, lorenz/x, etc.
        for i in range(osc.numChans):
            name = osc[i].name
            val = osc[i][0]

            if name in ('chaos/x', 'x', 'lorenz/x'):
                state.chaos_x = val
            elif name in ('chaos/y', 'y', 'lorenz/y'):
                state.chaos_y = val
            elif name in ('chaos/z', 'z', 'lorenz/z'):
                state.chaos_z = val
            elif name in ('audio/amplitude', 'L', 'lorenz/loudness'):
                state.loudness = clamp(val, 0, 1)
            elif name in ('kuramoto/r', 'r'):
                state.kuramoto_r = clamp(val, 0, 1)
            elif name in ('chaos/gain',):
                # Higher chaos gain = more visual intensity
                state.centroid = clamp(val, 0, 1)
            elif name in ('root/freq',):
                state.pitch_hz = max(val, 20)
            elif 'centroid' in name:
                state.centroid = clamp(val / 5000.0, 0, 1)
            elif 'density' in name:
                state.swarm_density = clamp(val, 0, 1)
            elif 'pitch' in name or 'freq' in name:
                state.pitch_hz = max(val, 20)

    except Exception as e:
        print(f"[ComfyUI Bridge] Error reading features: {e}")


def clamp(val, lo, hi):
    return max(lo, min(hi, val))


# ============================================
# COMFYUI API
# ============================================

def queue_prompt(workflow):
    """Send a workflow to ComfyUI's API for execution."""
    payload = {
        "prompt": workflow,
        "client_id": "feedback_td_bridge"
    }
    data = json.dumps(payload).encode('utf-8')
    req = urllib.request.Request(
        f"{COMFYUI_URL}/prompt",
        data=data,
        headers={"Content-Type": "application/json"}
    )
    try:
        resp = urllib.request.urlopen(req, timeout=5)
        result = json.loads(resp.read())
        return result.get("prompt_id")
    except Exception as e:
        print(f"[ComfyUI Bridge] API error: {e}")
        return None


def build_workflow(params):
    """Build the ComfyUI workflow with mapped audio parameters."""
    # Choose workflow based on whether we have a previous frame
    if USE_IMG2IMG and state.frame_count > 0 and os.path.exists(PREV_FRAME_FILE):
        workflow_path = WORKFLOW_PATH_IMG2IMG
    else:
        workflow_path = WORKFLOW_PATH_INIT

    try:
        with open(workflow_path, 'r') as f:
            workflow = json.load(f)
    except FileNotFoundError:
        print(f"[ComfyUI Bridge] Workflow not found: {workflow_path}")
        return None

    # Override parameters from audio features
    # Node 3 = positive prompt
    if "3" in workflow:
        workflow["3"]["inputs"]["text"] = params["prompt"]

    # Node 6 = KSampler
    if "6" in workflow:
        workflow["6"]["inputs"]["seed"] = params["seed"]
        workflow["6"]["inputs"]["steps"] = params["steps"]
        workflow["6"]["inputs"]["cfg"] = params["cfg"]
        workflow["6"]["inputs"]["denoise"] = params["denoise"]

    # Node 2 = LoRA (adjust strength with loudness)
    if "2" in workflow:
        # LoRA stronger when calm (hear/see the aesthetic), weaker when chaotic
        lora_strength = 0.6 + (1.0 - state.loudness) * 0.3
        workflow["2"]["inputs"]["strength_model"] = round(lora_strength, 2)
        workflow["2"]["inputs"]["strength_clip"] = round(lora_strength, 2)

    return workflow


# ============================================
# FRAME MANAGEMENT
# ============================================

def save_current_as_prev():
    """Copy current output frame to input dir for img2img."""
    try:
        if os.path.exists(FRAME_FILE):
            import shutil
            shutil.copy2(FRAME_FILE, PREV_FRAME_FILE)
    except Exception as e:
        print(f"[ComfyUI Bridge] Frame copy error: {e}")


def load_frame_to_td():
    """Tell TD to reload the frame texture."""
    try:
        # Try multiple locations
        movie = op('/project1/comfyui_frame')
        if movie is None:
            movie = op('comfyui_frame')
        if movie is None:
            movie = op('/project1/feedback_viz/comfyui_frame')
        if movie is not None:
            movie.par.reloadpulse.pulse()
    except Exception as e:
        print(f"[ComfyUI Bridge] Frame load error: {e}")


# ============================================
# GENERATION LOOP (runs in thread)
# ============================================

def generate_frame():
    """Generate one frame. Called from a background thread."""
    if state.generating:
        return

    state.generating = True
    try:
        # Read latest audio features
        # (Note: in threaded mode, we read features in the main thread
        # and cache them in state. The thread reads from cache.)

        # Map features to ComfyUI params
        params = map_features_to_params()

        # Build workflow
        workflow = build_workflow(params)
        if workflow is None:
            state.generating = False
            return

        # Save previous frame for img2img
        save_current_as_prev()

        # Queue prompt
        prompt_id = queue_prompt(workflow)
        if prompt_id is None:
            state.generating = False
            return

        # Wait for generation to complete
        # Poll the history endpoint
        max_wait = 30  # seconds
        start = time.time()
        while time.time() - start < max_wait:
            try:
                resp = urllib.request.urlopen(
                    f"{COMFYUI_URL}/history/{prompt_id}",
                    timeout=2
                )
                history = json.loads(resp.read())
                if prompt_id in history:
                    # Generation complete
                    state.frame_count += 1
                    state.last_gen_time = time.time()

                    # Load frame into TD (must be called from main thread)
                    # We'll set a flag and let the main cook handle it
                    state.last_frame_path = FRAME_FILE
                    break
            except:
                pass
            time.sleep(0.2)

    except Exception as e:
        print(f"[ComfyUI Bridge] Generation error: {e}")
    finally:
        state.generating = False


# ============================================
# MAIN ENTRY POINTS (called from TD)
# ============================================

def update():
    """
    Call this from a Timer CHOP callback or Execute DAT onFrameStart.
    Reads features, decides whether to generate, triggers generation.
    """
    # Read audio features (main thread — safe to access TD ops)
    read_features()

    # Check if we should generate a new frame
    now = time.time()
    elapsed = now - state.last_gen_time

    if elapsed >= MIN_INTERVAL and not state.generating:
        # Launch generation in background thread
        t = threading.Thread(target=generate_frame, daemon=True)
        t.start()

    # Check if a new frame is ready to load
    if state.last_frame_path and os.path.exists(state.last_frame_path):
        load_frame_to_td()
        state.last_frame_path = ""


def trigger_event():
    """Call this when a note trigger arrives (from P1/P3/P4)."""
    state.trigger_count += 1


def set_interval(seconds):
    """Adjust generation interval. Lower = faster (more GPU), higher = slower."""
    global MIN_INTERVAL
    MIN_INTERVAL = max(0.5, min(seconds, 10.0))
    print(f"[ComfyUI Bridge] Generation interval: {MIN_INTERVAL}s")


def set_img2img(enabled):
    """Toggle img2img mode for temporal coherence."""
    global USE_IMG2IMG
    USE_IMG2IMG = bool(enabled)
    print(f"[ComfyUI Bridge] img2img: {'ON' if USE_IMG2IMG else 'OFF'}")


# ============================================
# INITIALIZATION
# ============================================

def init():
    """Call once on project start."""
    state.initialized = True
    state.frame_count = 0
    state.trigger_count = 0
    state.last_gen_time = 0
    state.generating = False
    print("[ComfyUI Bridge] Initialized. Call update() from Timer callback.")
    print(f"  ComfyUI: {COMFYUI_URL}")
    print(f"  Interval: {MIN_INTERVAL}s")
    print(f"  img2img: {'ON' if USE_IMG2IMG else 'OFF'}")


# Auto-init if running in TD
try:
    init()
except:
    pass
