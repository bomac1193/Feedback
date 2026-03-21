# ============================================
# FEEDBACK — Chaos Visual Navigator (FLUX Edition)
# ============================================
# The Lorenz attractor navigates FLUX.1's latent space.
# No generic AI art. The math IS the creative direction.
#
# Audio features → aesthetic prompts + generation params.
# Each frame evolves from the previous (img2img feedback loop).
# Optional: ControlNet Depth makes attractor geometry the composition.
#
# BACKENDS:
#   "fal"   — fal.ai cloud API (no downloads, ~$0.003/image)
#   "local" — Local ComfyUI (free, needs 21GB model download)
#
# MODES:
#   "flux_img2img"    — FLUX img2img feedback (default)
#   "flux_controlnet" — FLUX + ControlNet Depth (attractor = composition)
#   "sdxl_latent"     — Legacy SDXL latent walk (anchor interpolation)
# ============================================

import json
import urllib.request
import os
import threading
import time
import math
import shutil
import base64

# ============================================
# CONFIGURATION
# ============================================

# --- BACKEND ---
# "replicate" = Replicate cloud API (~$0.003/image, no downloads)
# "fal"       = fal.ai cloud (needs active billing)
# "local"     = local ComfyUI on localhost:8000 (free, needs 21GB download)
BACKEND = "replicate"

# Replicate config
REPLICATE_TOKEN = os.environ.get("REPLICATE_API_TOKEN", "")
REPLICATE_SCHNELL_URL = "https://api.replicate.com/v1/models/black-forest-labs/flux-schnell/predictions"
REPLICATE_IMG2IMG_URL = "https://api.replicate.com/v1/models/bxclib2/flux_img2img/predictions"

# fal.ai config (backup — needs billing top-up)
FAL_KEY = os.environ.get("FAL_KEY", "")
FAL_SCHNELL_URL = "https://fal.run/fal-ai/flux/schnell"
FAL_IMG2IMG_URL = "https://fal.run/fal-ai/flux-general/image-to-image"

# Local ComfyUI config
COMFYUI_URL = "http://localhost:8000"

# Shared paths
COMFYUI_OUTPUT_DIR = "D:/Visuals/ComfyUI/output"
COMFYUI_INPUT_DIR = "D:/Visuals/ComfyUI/input"

FRAME_PREFIX = "feedback_frame"
PREV_FRAME_FILE = os.path.join(COMFYUI_INPUT_DIR, "feedback_frame_prev.png")
LATEST_FRAME_FILE = os.path.join(COMFYUI_OUTPUT_DIR, "feedback_frame_latest.png")

def find_latest_frame():
    import glob
    pattern = os.path.join(COMFYUI_OUTPUT_DIR, f"{FRAME_PREFIX}_*.png")
    files = glob.glob(pattern)
    if not files:
        # Check for our named file
        if os.path.exists(LATEST_FRAME_FILE):
            return LATEST_FRAME_FILE
        return None
    return max(files, key=os.path.getmtime)


# Workflow paths (local mode only)
WORKFLOW_DIR = "D:/Visuals/Touchdesigner/Projects/Feedback/comfyui"
WORKFLOWS = {
    "flux_bootstrap":   os.path.join(WORKFLOW_DIR, "workflow_flux_bootstrap.json"),
    "flux_img2img":     os.path.join(WORKFLOW_DIR, "workflow_flux_img2img.json"),
    "flux_controlnet":  os.path.join(WORKFLOW_DIR, "workflow_flux_controlnet.json"),
    "sdxl_bootstrap":   os.path.join(WORKFLOW_DIR, "workflow_api.json"),
    "sdxl_latent_walk": os.path.join(WORKFLOW_DIR, "workflow_latent_walk.json"),
}

# Active mode
MODE = "flux_img2img"  # "flux_img2img" | "flux_controlnet" | "sdxl_latent"

MIN_INTERVAL = 2.0    # Seconds between requests
BASE_SEED = 42
MAX_COST = 1.00       # Stop generating after spending this much ($)

# ============================================
# STATE
# ============================================

class BridgeState:
    generating = False
    last_gen_time = 0
    frame_count = 0
    last_frame_path = ""
    initialized = False
    bootstrapped = False

    # Chaos data
    chaos_x = 0.0
    chaos_y = 0.0
    chaos_z = 0.0
    loudness = 0.0
    prev_x = 0.0
    prev_y = 0.0
    prev_z = 0.0

    # Internal Lorenz simulator
    lorenz_x = 1.0
    lorenz_y = 1.0
    lorenz_z = 1.0
    use_internal_lorenz = True

    # Kuramoto + Veve
    kuramoto_r = 0.5
    veve_preset = 0
    chaos_gain = 0.5

    # Stats
    total_cost = 0.0

state = BridgeState()


# ============================================
# PROMPT ENGINE — African Fractal × Physical Phenomena
# ============================================
#
# PHILOSOPHY: Eglash's African Fractals as first principles.
#   The Lorenz attractor navigates a space of FRACTAL PROCESSES
#   rendered in PHYSICAL MATERIALS. Not "African art" (decorative).
#   Not "AI art" (generic). The mathematical DNA of indigenous design
#   manifested as observable physical phenomena.
#
# FRACTAL PROCESSES (from Eglash):
#   Recursion  — circles within circles (Ba-ila settlement)
#   Scaling    — self-similar at multiple scales (Nankani architecture)
#   Branching  — paths that subdivide (Banyo, fractal branching)
#   Eulerian   — single continuous path filling space (Chokwe lusona)
#   Packing    — circles filling circles (Labbezanga/Apollonian)
#   Spiraling  — logarithmic spirals (Akan life force / Tanu)
#   Iteration  — active/passive line replacement (Koch-like textile)
#
# MATERIAL PALETTE:
#   Warm lobe  — ember, molten metal, heated filament, forge light
#   Cool lobe  — bioluminescence, cryogenic vapor, Cherenkov glow
#   Saddle     — ferrofluid, interference, phase transition
#
# NEVER USE: "beautiful", "stunning", "artwork", "professional",
#   "abstract art", "AI", "masterpiece", "trending", "artstation",
#   "African pattern", "tribal", "ethnic"

# --- Fractal process × material combinations ---
# Each pool encodes: [fractal_process] rendered in [physical_medium]
# The process comes from Eglash. The medium makes it photographic.

MEDIA_WARM = [
    "long exposure photograph of molten copper droplets forming recursive nested rings on dark surface, each ring containing smaller rings inside it, self-similar at three scales",
    "macro photograph of heated filament network branching into finer and finer sub-filaments, each fork splitting into three smaller forks, amber incandescent glow against black",
    "photograph of ember trails tracing a single continuous spiraling path through darkness, the line never crossing itself, filling the frame like a sand drawing",
    "schlieren photograph of rising heat plumes forming logarithmic spiral, each coil tighter than the last, golden thermal gradient on black",
    "kirlian photograph of copper electrode discharge forming concentric corona rings, each ring of sparks containing smaller rings of sparks within it",
    "photograph of Chladni plate vibration pattern in iron filings, amber-lit geometric nodal lines forming nested polygonal cells on dark metal plate",
    "macro photograph of heated viscous liquid under sustained tone forming concentric standing wave ridges, amber-gold fluid sculpted by sound into recursive ring pattern on black",
]

MEDIA_COOL = [
    "long exposure photograph of bioluminescent organisms tracing a single continuous Eulerian path through dark water, one unbroken blue-green line filling the frame without crossing",
    "photograph of cryogenic vapor condensing into nested circular formations, circles within circles within circles, deep blue against absolute black",
    "macro photograph of electric discharge through gas branching fractally, each arc subdividing into three finer arcs, cold blue-white on black",
    "photograph of Cherenkov radiation glow forming logarithmic spiral pattern in reactor pool, deep blue self-similar curves nested at decreasing scales",
    "cyanotype photograph of frost crystal growth showing recursive branching, each branch producing smaller copies of itself, prussian blue on black",
    "photograph of water surface cymatic pattern under pure tone vibration, blue-lit concentric ripple nodes forming hexagonal tessellation on dark liquid surface",
    "macro photograph of lycopodium powder on vibrating dark plate forming star-shaped nodal pattern, fine blue-white powder collecting along standing wave lines",
]

MEDIA_TRANSITION = [
    "macro photograph of ferrofluid forming self-similar nested rings under oscillating magnetic field, circles packed within circles, metallic iridescent on black",
    "photograph of thin film interference on dark liquid surface showing recursive diamond grid pattern, each diamond containing four smaller diamonds, spectral colors",
    "macro photograph of bismuth crystal terraces forming scaling staircase pattern, each step containing a smaller staircase within it, oxidation rainbow on black",
    "photograph of cymatics in viscous fluid between two tones, competing standing wave patterns creating moiré interference, iridescent fluid on black",
    "schlieren photograph of two convection currents colliding and forming branching turbulence, each vortex spawning smaller vortices, iridescent thermal gradient",
    "macro photograph of cornstarch suspension on speaker cone forming fractal finger-like protrusions under bass frequency, non-Newtonian fluid sculpted by sound on black",
    "photograph of mercury droplet on vibrating surface oscillating between circular and polygonal modes, metallic liquid shifting shape under frequency sweep on dark plate",
]

DENSITY_HIGH = "dense, filling the frame, forms overlapping at multiple scales"
DENSITY_MED = "moderate density, clear forms with space between iterations"
DENSITY_LOW = "sparse, isolated form surrounded by vast negative space"
DENSITY_VOID = "near-empty frame, single faint trace against total darkness"

STRUCTURE_ORDERED = "precise recursive symmetry, regular self-similar nesting, geometric"
STRUCTURE_SEMI = "partially ordered, crystallizing into recursive pattern, emerging grid"
STRUCTURE_FLUID = "smooth continuous path, flowing Eulerian curve, laminar"
STRUCTURE_CHAOTIC = "turbulent fractal branching, dissolved into fine recursive dust"

# Fixed photographic constraints
FRAME_RULES = "black background, single light source, shallow depth of field, photographic, macro lens"


def build_flux_prompt():
    x = state.chaos_x

    # --- Medium selection ---
    # Rotate through pool slowly for visual stability
    pool_idx = (state.frame_count // 8) % 7

    if x > 5:
        medium = MEDIA_WARM[pool_idx]
    elif x < -5:
        medium = MEDIA_COOL[pool_idx]
    else:
        medium = MEDIA_TRANSITION[pool_idx]

    # --- Density from loudness ---
    if state.loudness > 0.7:
        density = DENSITY_HIGH
    elif state.loudness > 0.35:
        density = DENSITY_MED
    elif state.loudness > 0.1:
        density = DENSITY_LOW
    else:
        density = DENSITY_VOID

    # --- Structure from Kuramoto order parameter ---
    # High sync → recursive symmetry (Ba-ila nesting)
    # Low sync → fractal branching/turbulence (Banyo paths)
    if state.kuramoto_r > 0.75:
        structure = STRUCTURE_ORDERED
    elif state.kuramoto_r > 0.5:
        structure = STRUCTURE_SEMI
    elif state.kuramoto_r > 0.25:
        structure = STRUCTURE_FLUID
    else:
        structure = STRUCTURE_CHAOTIC

    return f"{medium}, {density}, {structure}, {FRAME_RULES}"


# ============================================
# CHAOS → GENERATION PARAMS
# ============================================

def clamp(val, lo, hi):
    return max(lo, min(hi, val))

def map_chaos_to_params():
    x, y, z = state.chaos_x, state.chaos_y, state.chaos_z

    dx = x - state.prev_x
    dy = y - state.prev_y
    dz = z - state.prev_z
    velocity = math.sqrt(dx * dx + dy * dy + dz * dz)

    state.prev_x, state.prev_y, state.prev_z = x, y, z

    # Denoise / strength
    base_denoise = 0.30
    velocity_factor = min(velocity * 0.02, 0.25)
    loudness_factor = state.loudness * 0.15
    denoise = clamp(base_denoise + velocity_factor + loudness_factor, 0.25, 0.70)

    seed = BASE_SEED + state.frame_count * 7

    cn_strength = 0.4 + state.kuramoto_r * 0.35

    return {
        "prompt": build_flux_prompt(),
        "denoise": round(denoise, 3),
        "strength": round(denoise, 3),  # fal.ai uses "strength" for img2img
        "seed": seed,
        "cn_strength": round(cn_strength, 3),
    }


# ============================================
# CHAOS → LATENT RATIOS (legacy SDXL mode)
# ============================================

def map_chaos_to_ratios():
    x, y, z = state.chaos_x, state.chaos_y, state.chaos_z
    ratio_ab = 1.0 / (1.0 + math.exp(-x * 0.3))
    dist = math.sqrt(x * x + y * y + z * z)
    ratio_c = min(math.exp(-dist * 0.1), 0.6)
    dx = x - state.prev_x
    dy = y - state.prev_y
    dz = z - state.prev_z
    velocity = math.sqrt(dx * dx + dy * dy + dz * dz)
    evolution_rate = 0.1 + min(velocity * 0.05, 0.5)
    state.prev_x, state.prev_y, state.prev_z = x, y, z
    return round(ratio_ab, 4), round(ratio_c, 4), round(evolution_rate, 4)


# ============================================
# READ CHAOS DATA FROM TD STORAGE
# ============================================

def step_lorenz(x, y, z, dt=0.005, sigma=10.0, rho=28.0, beta=8.0/3.0):
    dx = sigma * (y - x)
    dy = x * (rho - z) - y
    dz = x * y - beta * z
    return x + dx * dt, y + dy * dt, z + dz * dt

def read_features():
    try:
        s = op("/project1/feedback_viz").storage
        state.loudness = clamp(abs(s.get("loudness", 0.0)), 0, 1)

        osc_time = s.get("osc_heartbeat", 0)
        if time.time() - osc_time < 1.0:
            state.chaos_x = s.get("x", 0.0) * 25.0
            state.chaos_y = s.get("y", 0.0) * 35.0
            state.chaos_z = s.get("z", 0.0) * 25.0 + 25.0
            state.use_internal_lorenz = False
        else:
            state.use_internal_lorenz = True
            for _ in range(8):
                state.lorenz_x, state.lorenz_y, state.lorenz_z = step_lorenz(
                    state.lorenz_x, state.lorenz_y, state.lorenz_z
                )
            state.chaos_x = state.lorenz_x
            state.chaos_y = state.lorenz_y
            state.chaos_z = state.lorenz_z
            s["x"] = state.lorenz_x / 25.0
            s["y"] = state.lorenz_y / 35.0
            s["z"] = (state.lorenz_z - 25.0) / 25.0

        state.kuramoto_r = clamp(s.get("kuramoto_r", 0.5), 0.0, 1.0)
        state.veve_preset = int(s.get("veve_preset", 0))
        state.chaos_gain = clamp(s.get("chaos_gain", 0.5), 0.0, 1.0)
    except Exception as e:
        print(f"[Bridge] Read error: {e}")


# ============================================
# REPLICATE BACKEND
# ============================================

def replicate_request(url, payload):
    """Make a synchronous request to Replicate API. Returns parsed JSON or None."""
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=data,
        headers={
            "Content-Type": "application/json",
            "Authorization": f"Bearer {REPLICATE_TOKEN}",
            "Prefer": "wait",  # synchronous — blocks until done
        }
    )
    try:
        resp = urllib.request.urlopen(req, timeout=60)
        return json.loads(resp.read())
    except Exception as e:
        print(f"[Bridge/replicate] API error: {e}")
        return None


def generate_replicate_schnell(params):
    """Generate via Replicate FLUX Schnell (txt2img). ~$0.003/image, ~1-2s."""
    payload = {
        "input": {
            "prompt": params["prompt"],
            "go_fast": True,
            "megapixels": "1",
            "num_outputs": 1,
            "aspect_ratio": "16:9",
            "output_format": "png",
            "output_quality": 100,
            "num_inference_steps": 4,
            "seed": params["seed"],
        }
    }

    result = replicate_request(REPLICATE_SCHNELL_URL, payload)
    if result is None:
        return None

    output = result.get("output", [])
    if not output:
        print(f"[Bridge/replicate] No output in response")
        return None

    img_url = output[0] if isinstance(output, list) else output
    dest = LATEST_FRAME_FILE
    if download_image(str(img_url), dest):
        state.total_cost += 0.003
        return dest
    return None


def generate_replicate_img2img(params):
    """Generate via Replicate FLUX img2img. ~$0.012/image."""
    prev_frame = PREV_FRAME_FILE
    if not os.path.exists(prev_frame):
        return generate_replicate_schnell(params)

    image_uri = image_to_base64_uri(prev_frame)
    if image_uri is None:
        return generate_replicate_schnell(params)

    payload = {
        "input": {
            "prompt": params["prompt"],
            "image": image_uri,
            "strength": params["strength"],
            "num_inference_steps": 4,
            "seed": params["seed"],
            "output_format": "png",
        }
    }

    result = replicate_request(REPLICATE_IMG2IMG_URL, payload)
    if result is None:
        return None

    output = result.get("output", [])
    if not output:
        return None

    img_url = output[0] if isinstance(output, list) else output
    dest = LATEST_FRAME_FILE
    if download_image(str(img_url), dest):
        state.total_cost += 0.012
        return dest
    return None


# ============================================
# FAL.AI BACKEND
# ============================================

def fal_request(url, payload):
    """Make a request to fal.ai API. Returns parsed JSON or None."""
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=data,
        headers={
            "Content-Type": "application/json",
            "Authorization": f"Key {FAL_KEY}",
        }
    )
    try:
        resp = urllib.request.urlopen(req, timeout=30)
        return json.loads(resp.read())
    except Exception as e:
        print(f"[Bridge/fal] API error: {e}")
        return None


def download_image(url, dest):
    """Download an image from a URL to a local path."""
    try:
        req = urllib.request.Request(url)
        resp = urllib.request.urlopen(req, timeout=15)
        with open(dest, "wb") as f:
            f.write(resp.read())
        return True
    except Exception as e:
        print(f"[Bridge/fal] Download error: {e}")
        return False


def image_to_base64_uri(path):
    """Read an image file and return as base64 data URI."""
    try:
        with open(path, "rb") as f:
            data = f.read()
        b64 = base64.b64encode(data).decode("ascii")
        return f"data:image/png;base64,{b64}"
    except Exception as e:
        print(f"[Bridge/fal] Base64 encode error: {e}")
        return None


def generate_fal_schnell(params):
    """Generate via fal.ai FLUX Schnell (txt2img). ~$0.003/image."""
    payload = {
        "prompt": params["prompt"],
        "image_size": {"width": 1344, "height": 768},
        "num_inference_steps": 4,
        "seed": params["seed"],
        "num_images": 1,
        "output_format": "png",
        "enable_safety_checker": False,
    }

    result = fal_request(FAL_SCHNELL_URL, payload)
    if result is None:
        return None

    images = result.get("images", [])
    if not images:
        print("[Bridge/fal] No images in response")
        return None

    image_url = images[0].get("url")
    if not image_url:
        return None

    # Download to local output dir
    dest = LATEST_FRAME_FILE
    if download_image(image_url, dest):
        state.total_cost += 0.003
        return dest
    return None


def generate_fal_img2img(params):
    """Generate via fal.ai FLUX General img2img. ~$0.075/image."""
    # Encode previous frame as base64
    prev_frame = PREV_FRAME_FILE
    if not os.path.exists(prev_frame):
        # No previous frame — fall back to txt2img
        return generate_fal_schnell(params)

    image_uri = image_to_base64_uri(prev_frame)
    if image_uri is None:
        return generate_fal_schnell(params)

    payload = {
        "prompt": params["prompt"],
        "image_url": image_uri,
        "strength": params["strength"],
        "num_inference_steps": 12,  # General uses dev model, needs more steps
        "seed": params["seed"],
        "num_images": 1,
        "output_format": "png",
        "enable_safety_checker": False,
    }

    result = fal_request(FAL_IMG2IMG_URL, payload)
    if result is None:
        return None

    images = result.get("images", [])
    if not images:
        print("[Bridge/fal] No images in response")
        return None

    image_url = images[0].get("url")
    if not image_url:
        return None

    dest = LATEST_FRAME_FILE
    if download_image(image_url, dest):
        state.total_cost += 0.075
        return dest
    return None


# ============================================
# LOCAL COMFYUI BACKEND
# ============================================

def queue_prompt(workflow):
    payload = {
        "prompt": workflow,
        "client_id": "feedback_bridge"
    }
    data = json.dumps(payload).encode("utf-8")
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
        print(f"[Bridge/local] API error: {e}")
        return None

def load_workflow(key):
    path = WORKFLOWS.get(key)
    if not path:
        return None
    try:
        with open(path, "r") as f:
            raw = json.load(f)
    except Exception as e:
        print(f"[Bridge/local] Workflow load error ({key}): {e}")
        return None
    workflow = {}
    for k, v in raw.items():
        if k.startswith("_"):
            continue
        node = {"class_type": v["class_type"], "inputs": dict(v["inputs"])}
        workflow[k] = node
    return workflow


def build_flux_bootstrap():
    workflow = load_workflow("flux_bootstrap")
    if workflow is None:
        return None
    params = map_chaos_to_params()
    workflow["10"]["inputs"]["text"] = params["prompt"]
    workflow["50"]["inputs"]["seed"] = params["seed"]
    return workflow

def build_flux_img2img():
    workflow = load_workflow("flux_img2img")
    if workflow is None:
        return None
    params = map_chaos_to_params()
    workflow["10"]["inputs"]["text"] = params["prompt"]
    workflow["50"]["inputs"]["seed"] = params["seed"]
    workflow["50"]["inputs"]["denoise"] = params["denoise"]
    return workflow

def build_flux_controlnet():
    workflow = load_workflow("flux_controlnet")
    if workflow is None:
        return None
    params = map_chaos_to_params()
    workflow["10"]["inputs"]["text"] = params["prompt"]
    workflow["50"]["inputs"]["seed"] = params["seed"]
    workflow["50"]["inputs"]["denoise"] = params["denoise"]
    workflow["81"]["inputs"]["strength"] = params["cn_strength"]
    return workflow

def build_sdxl_bootstrap():
    return load_workflow("sdxl_bootstrap")

def build_sdxl_latent_walk():
    workflow = load_workflow("sdxl_latent_walk")
    if workflow is None:
        return None
    ratio_ab, ratio_c, evolution_rate = map_chaos_to_ratios()
    try:
        workflow["30"]["inputs"]["ratio"] = ratio_ab
        workflow["31"]["inputs"]["ratio"] = ratio_c
        workflow["32"]["inputs"]["ratio"] = evolution_rate
    except KeyError:
        pass
    denoise = 0.55 - state.kuramoto_r * 0.3
    try:
        workflow["20"]["inputs"]["denoise"] = round(denoise, 3)
    except (KeyError, TypeError):
        pass
    return workflow


# ============================================
# FRAME MANAGEMENT
# ============================================

def save_current_as_prev():
    try:
        latest = find_latest_frame()
        if latest:
            shutil.copy2(latest, PREV_FRAME_FILE)
    except Exception as e:
        print(f"[Bridge] Frame copy error: {e}")

def load_frame_to_td():
    try:
        movie = op("/project1/feedback_viz/comfyui_frame")
        if movie is not None:
            latest = find_latest_frame()
            if latest:
                movie.par.file = latest.replace("/", "\\") if "\\" not in latest else latest
            movie.par.reloadpulse.pulse()
    except Exception as e:
        print(f"[Bridge] Frame load error: {e}")


# ============================================
# GENERATION — REPLICATE BACKEND
# ============================================

def generate_replicate():
    """Generate one frame via Replicate."""
    if state.generating:
        return
    state.generating = True

    try:
        params = map_chaos_to_params()

        # Always use Schnell txt2img (cheap, fast, great quality)
        # Prompt continuity provides visual coherence between frames
        result_path = generate_replicate_schnell(params)
        mode_label = "replicate_schnell"

        if result_path:
            state.frame_count += 1
            state.last_gen_time = time.time()
            state.last_frame_path = result_path

            if not state.bootstrapped:
                save_current_as_prev()
                state.bootstrapped = True
                print(f"[Bridge/replicate] Bootstrap complete.")

            save_current_as_prev()

            if state.frame_count % 5 == 0:
                remaining = MAX_COST - state.total_cost
                print(f"[Bridge/replicate] Frame {state.frame_count} "
                      f"x={state.chaos_x:.1f} cost=${state.total_cost:.3f} "
                      f"(${remaining:.3f} left)")
            if state.total_cost >= MAX_COST * 0.8:
                print(f"[Bridge] WARNING: 80% of ${MAX_COST:.2f} budget used")

    except Exception as e:
        print(f"[Bridge/replicate] Generation error: {e}")
    finally:
        state.generating = False


# ============================================
# GENERATION — FAL.AI BACKEND
# ============================================

def generate_fal():
    """Generate one frame via fal.ai."""
    if state.generating:
        return
    state.generating = True

    try:
        params = map_chaos_to_params()

        if not state.bootstrapped or not os.path.exists(PREV_FRAME_FILE):
            # First frame: always use Schnell txt2img (cheap)
            result_path = generate_fal_schnell(params)
            mode_label = "fal_schnell_bootstrap"
        elif MODE == "flux_img2img":
            # Subsequent frames: Schnell txt2img (cheap, good enough)
            # The prompt continuity provides visual coherence
            result_path = generate_fal_schnell(params)
            mode_label = "fal_schnell"
        else:
            # flux_controlnet or img2img: use General img2img (expensive)
            result_path = generate_fal_img2img(params)
            mode_label = "fal_img2img"

        if result_path:
            state.frame_count += 1
            state.last_gen_time = time.time()
            state.last_frame_path = result_path

            if not state.bootstrapped:
                save_current_as_prev()
                state.bootstrapped = True
                print(f"[Bridge/fal] Bootstrap complete. Feedback begins.")

            # Always save as prev for potential img2img mode switch
            save_current_as_prev()

            if state.frame_count % 5 == 0:
                src = "internal" if state.use_internal_lorenz else "osc"
                print(f"[Bridge/fal] Frame {state.frame_count} ({mode_label}) "
                      f"x={state.chaos_x:.1f} cost=${state.total_cost:.3f}")

    except Exception as e:
        print(f"[Bridge/fal] Generation error: {e}")
    finally:
        state.generating = False


# ============================================
# GENERATION — LOCAL COMFYUI BACKEND
# ============================================

def generate_local():
    """Generate one frame via local ComfyUI."""
    if state.generating:
        return
    state.generating = True

    try:
        if MODE.startswith("flux"):
            if not state.bootstrapped:
                workflow = build_flux_bootstrap()
                mode_label = "flux_bootstrap"
            elif MODE == "flux_controlnet":
                workflow = build_flux_controlnet()
                mode_label = "flux_controlnet"
            else:
                workflow = build_flux_img2img()
                mode_label = "flux_img2img"
        else:
            if not state.bootstrapped:
                workflow = build_sdxl_bootstrap()
                mode_label = "sdxl_bootstrap"
            else:
                workflow = build_sdxl_latent_walk()
                mode_label = "sdxl_latent_walk"

        if workflow is None:
            state.generating = False
            return

        if state.frame_count > 0:
            save_current_as_prev()

        prompt_id = queue_prompt(workflow)
        if prompt_id is None:
            state.generating = False
            return

        max_wait = 30
        start = time.time()
        while time.time() - start < max_wait:
            try:
                resp = urllib.request.urlopen(
                    f"{COMFYUI_URL}/history/{prompt_id}",
                    timeout=2
                )
                history = json.loads(resp.read())
                if prompt_id in history:
                    status = history[prompt_id].get("status", {})
                    if status.get("completed", False) or status.get("status_str") == "success":
                        state.frame_count += 1
                        state.last_gen_time = time.time()
                        state.last_frame_path = find_latest_frame() or ""

                        if not state.bootstrapped:
                            save_current_as_prev()
                            state.bootstrapped = True
                            print(f"[Bridge/local] Bootstrap complete ({mode_label}).")

                        if state.frame_count % 10 == 0:
                            print(f"[Bridge/local] Frame {state.frame_count} ({mode_label}) "
                                  f"x={state.chaos_x:.1f}")
                        break
            except:
                pass
            time.sleep(0.2)

    except Exception as e:
        print(f"[Bridge/local] Generation error: {e}")
    finally:
        state.generating = False


# ============================================
# MAIN ENTRY POINT (called from Execute DAT)
# ============================================

def update():
    """Call from a Timer CHOP callback or Execute DAT onFrameStart."""
    read_features()

    now = time.time()
    elapsed = now - state.last_gen_time

    if elapsed >= MIN_INTERVAL and not state.generating and state.total_cost < MAX_COST:
        if BACKEND == "replicate":
            t = threading.Thread(target=generate_replicate, daemon=True)
        elif BACKEND == "fal":
            t = threading.Thread(target=generate_fal, daemon=True)
        else:
            t = threading.Thread(target=generate_local, daemon=True)
        t.start()

    if state.last_frame_path and os.path.exists(state.last_frame_path):
        load_frame_to_td()
        state.last_frame_path = ""


# ============================================
# CONTROL API (callable from TD)
# ============================================

def set_mode(mode):
    global MODE
    if mode in ("flux_img2img", "flux_controlnet", "sdxl_latent"):
        MODE = mode
        state.bootstrapped = False
        print(f"[Bridge] Mode: {MODE}")
    else:
        print(f"[Bridge] Unknown mode: {mode}")

def set_backend(backend):
    global BACKEND
    if backend in ("replicate", "fal", "local"):
        BACKEND = backend
        state.bootstrapped = False
        print(f"[Bridge] Backend: {BACKEND}")
    else:
        print(f"[Bridge] Unknown backend: {backend}")

def set_interval(seconds):
    global MIN_INTERVAL
    MIN_INTERVAL = max(0.5, min(seconds, 10.0))
    print(f"[Bridge] Interval: {MIN_INTERVAL}s")

def set_budget(dollars):
    """Set max spending limit. Generation stops when reached."""
    global MAX_COST
    MAX_COST = max(0.01, float(dollars))
    print(f"[Bridge] Budget: ${MAX_COST:.2f} (spent ${state.total_cost:.3f} so far)")
    frames_remaining = int((MAX_COST - state.total_cost) / 0.003)
    print(f"  ~{frames_remaining} frames remaining at $0.003/frame")

def set_fal_key(key):
    global FAL_KEY
    FAL_KEY = key
    print(f"[Bridge] FAL_KEY set ({len(key)} chars)")

def get_stats():
    """Print generation stats."""
    print(f"[Bridge] Stats:")
    print(f"  Backend: {BACKEND}")
    print(f"  Mode: {MODE}")
    print(f"  Frames: {state.frame_count}")
    print(f"  Total cost: ${state.total_cost:.3f}")
    print(f"  Lorenz: {'internal' if state.use_internal_lorenz else 'live OSC'}")
    print(f"  Generating: {state.generating}")


# ============================================
# INIT
# ============================================

def init():
    state.initialized = True
    state.frame_count = 0
    state.bootstrapped = False
    state.generating = False
    state.last_gen_time = 0
    state.total_cost = 0.0
    state.prev_x = state.prev_y = state.prev_z = 0.0

    print("[Bridge] Chaos Visual Navigator initialized.")
    print(f"  Backend: {BACKEND}")
    print(f"  Mode: {MODE}")
    if BACKEND == "replicate":
        print(f"  Replicate token: {'set' if REPLICATE_TOKEN else 'NOT SET'}")
        print(f"  Cost: ~$0.003/frame (Schnell)")
    elif BACKEND == "fal":
        if FAL_KEY:
            print(f"  FAL_KEY: set ({len(FAL_KEY)} chars)")
        else:
            print(f"  FAL_KEY: NOT SET — call set_fal_key('your-key')")
        print(f"  Cost: ~$0.003/frame (Schnell) or ~$0.075/frame (img2img)")
    else:
        print(f"  ComfyUI: {COMFYUI_URL}")
    print(f"  Interval: {MIN_INTERVAL}s")

try:
    init()
except:
    pass
