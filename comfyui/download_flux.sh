#!/bin/bash
# ============================================
# Download FLUX.1 Schnell + ControlNet Depth
# ============================================
# Run from WSL. Downloads to D:/Visuals/ComfyUI/models/
# Uses split files for VRAM efficiency (RTX 4090 16GB laptop)
#
# FLUX.1 Schnell = distilled 4-step model. Same speed as SDXL Lightning
# but MASSIVELY better quality. Album cover worthy.
#
# Total download: ~21GB
# VRAM usage: ~8-9GB (leaves room for TD + nn~)
# ============================================

BASE="/mnt/d/Visuals/ComfyUI/models"

echo "=== FLUX.1 Schnell — Downloading ==="
echo "Split files for VRAM efficiency on 16GB laptop"
echo ""

# ----------------------------------------
# 1. UNET — Schnell distilled, fp8 quantized
# ----------------------------------------
echo "[1/5] FLUX.1 Schnell UNET (fp8) — ~12GB..."
echo "      Source: Kijai/flux-fp8 (community fp8 quantization)"
wget -c "https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-schnell-fp8-e4m3fn.safetensors" \
  -O "$BASE/diffusion_models/flux1-schnell-fp8-e4m3fn.safetensors"

# ----------------------------------------
# 2. Text encoder: CLIP-L (OpenAI)
# ----------------------------------------
echo "[2/5] CLIP-L text encoder — ~250MB..."
wget -c "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors" \
  -O "$BASE/text_encoders/clip_l.safetensors"

# ----------------------------------------
# 3. Text encoder: T5-XXL (fp8 to save VRAM)
# ----------------------------------------
echo "[3/5] T5-XXL text encoder (fp8) — ~5GB..."
echo "      Using fp8 version — saves ~5GB VRAM vs full fp16"
wget -c "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors" \
  -O "$BASE/text_encoders/t5xxl_fp8_e4m3fn.safetensors"

# ----------------------------------------
# 4. VAE (FLUX autoencoder)
# ----------------------------------------
echo "[4/5] FLUX VAE (ae) — ~300MB..."
wget -c "https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors" \
  -O "$BASE/vae/ae.safetensors"

# ----------------------------------------
# 5. XLabs ControlNet Depth v3 (attractor geometry as composition)
# ----------------------------------------
echo "[5/5] XLabs ControlNet Depth v3 — ~3.6GB..."
echo "      Requires x-flux-comfyui custom node (see below)"
mkdir -p "$BASE/xlabs/controlnets"
wget -c "https://huggingface.co/XLabs-AI/flux-controlnet-depth-v3/resolve/main/flux-depth-controlnet-v3.safetensors" \
  -O "$BASE/xlabs/controlnets/flux-depth-controlnet-v3.safetensors"

echo ""
echo "========================================="
echo "DOWNLOAD COMPLETE"
echo "========================================="
echo ""
echo "Model inventory:"
echo "  diffusion_models/flux1-schnell-fp8-e4m3fn.safetensors  (4-step distilled, ~12GB)"
echo "  text_encoders/clip_l.safetensors                       (CLIP-L, ~250MB)"
echo "  text_encoders/t5xxl_fp8_e4m3fn.safetensors             (T5-XXL fp8, ~5GB)"
echo "  vae/ae.safetensors                                     (FLUX AE, ~300MB)"
echo "  xlabs/controlnets/flux-depth-controlnet-v3.safetensors (depth CN, ~3.6GB)"
echo ""
echo "========================================="
echo "CUSTOM NODES REQUIRED (for ControlNet)"
echo "========================================="
echo ""
echo "Run in PowerShell (on Windows):"
echo "  cd D:\\Visuals\\ComfyUI\\custom_nodes"
echo "  git clone https://github.com/XLabs-AI/x-flux-comfyui"
echo "  git clone https://github.com/Fannovel16/comfyui_controlnet_aux"
echo "  pip install -r x-flux-comfyui\\requirements.txt"
echo ""
echo "========================================="
echo "START COMFYUI"
echo "========================================="
echo ""
echo "  cd D:\\Visuals\\ComfyUI"
echo "  python main.py --listen 0.0.0.0 --port 8000"
echo ""
echo "VRAM budget (estimated):"
echo "  FLUX.1 Schnell fp8:  ~8GB"
echo "  ControlNet Depth:    ~1GB"
echo "  TouchDesigner:       ~2GB"
echo "  nn~ PERI:            ~1GB"
echo "  Total:               ~12GB / 16GB"
echo ""
echo "Next: Load workflow_flux_img2img.json in bridge"
