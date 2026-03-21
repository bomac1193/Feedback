#!/bin/bash
# ============================================================================
# Quick single-track upload for PRS Foundation work sample
# Takes "Feedback to be Song.aif" and outputs a clean, normalized WAV + MP3
# ============================================================================

RAW_DIR="/mnt/d/Music/Max Msp/Projects/Feedback/Audio/Raw"
OUT_DIR="/mnt/d/Music/Max Msp/Projects/Feedback/Audio"
INPUT="$RAW_DIR/Feedback to be Song.aif"
TARGET_LUFS=-14

echo "=== Quick Upload: Feedback to be Song ==="
echo ""

if [ ! -f "$INPUT" ]; then
  echo "ERROR: $INPUT not found"
  exit 1
fi

TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Step 1: Clean (DC removal, highpass, limiter to prevent clipping)
echo "Step 1: Cleaning..."
ffmpeg -y -hide_banner -loglevel warning \
  -i "$INPUT" \
  -af "volume=-3dB,highpass=f=20,lowpass=f=20000,alimiter=limit=0.95:attack=0.1:release=50,afade=t=in:st=0:d=1,afade=t=out:st=150:d=3" \
  -c:a pcm_s24le \
  "$TEMP_DIR/clean.wav"

# Step 2: Two-pass EBU R128 normalization
echo "Step 2: Measuring loudness..."
STATS=$(ffmpeg -y -hide_banner \
  -i "$TEMP_DIR/clean.wav" \
  -af "loudnorm=I=${TARGET_LUFS}:TP=-1:LRA=11:print_format=json" \
  -f null - 2>&1)

INPUT_I=$(echo "$STATS" | grep '"input_i"' | grep -o '[-0-9.]*')
INPUT_TP=$(echo "$STATS" | grep '"input_tp"' | grep -o '[-0-9.]*')
INPUT_LRA=$(echo "$STATS" | grep '"input_lra"' | grep -o '[-0-9.]*')
INPUT_THRESH=$(echo "$STATS" | grep '"input_thresh"' | grep -o '[-0-9.]*')

echo "Step 3: Normalizing to ${TARGET_LUFS} LUFS..."
if [ -n "$INPUT_I" ]; then
  ffmpeg -y -hide_banner -loglevel warning \
    -i "$TEMP_DIR/clean.wav" \
    -af "loudnorm=I=${TARGET_LUFS}:TP=-1:LRA=11:measured_I=${INPUT_I}:measured_TP=${INPUT_TP}:measured_LRA=${INPUT_LRA}:measured_thresh=${INPUT_THRESH}:linear=true" \
    -c:a pcm_s24le \
    "$OUT_DIR/Feedback_to_be_Song_MASTER.wav"
else
  echo "  (single-pass fallback)"
  ffmpeg -y -hide_banner -loglevel warning \
    -i "$TEMP_DIR/clean.wav" \
    -af "loudnorm=I=${TARGET_LUFS}:TP=-1:LRA=11" \
    -c:a pcm_s24le \
    "$OUT_DIR/Feedback_to_be_Song_MASTER.wav"
fi

# Step 4: MP3 for SoundCloud
echo "Step 4: Creating MP3..."
ffmpeg -y -hide_banner -loglevel warning \
  -i "$OUT_DIR/Feedback_to_be_Song_MASTER.wav" \
  -codec:a libmp3lame -qscale:a 0 \
  -metadata title="Feedback - Chaos Resonator Demo" \
  -metadata artist="Alabo" \
  -metadata album="Feedback: Chaos Resonance Instruments" \
  -metadata comment="Chaos mathematics exciting waveguide resonators tuned to African tonal systems" \
  "$OUT_DIR/Feedback_to_be_Song_MASTER.mp3"

echo ""
echo "=== Done ==="
echo "Upload to SoundCloud (unlisted):"
echo "  WAV: $OUT_DIR/Feedback_to_be_Song_MASTER.wav"
echo "  MP3: $OUT_DIR/Feedback_to_be_Song_MASTER.mp3"
echo ""

# Final loudness check
echo "Final loudness stats:"
ffmpeg -i "$OUT_DIR/Feedback_to_be_Song_MASTER.wav" -filter_complex "ebur128=peak=true" -f null - 2>&1 | grep -E "Integrated|LRA|Peak" | tail -4
