#!/bin/bash
# ============================================================================
# Feedback Demo Reel Builder
# ============================================================================
# Usage:
#   1. Listen through the raw recordings
#   2. Edit the SEGMENTS array below with your best moments
#   3. Run: bash tools/build_demo.sh
#
# Each segment: "filename|start_seconds|duration_seconds|label"
# The script will: remove DC offset, fade in/out, crossfade between segments,
# normalize to -14 LUFS (streaming standard), output 24-bit WAV + MP3.
# ============================================================================

RAW_DIR="/mnt/d/Music/Max Msp/Projects/Feedback/Audio/Raw"
OUT_DIR="/mnt/d/Music/Max Msp/Projects/Feedback/Audio"
CROSSFADE=3  # seconds of crossfade between segments
FADE_IN=1    # fade in on first segment
FADE_OUT=3   # fade out on last segment
TARGET_LUFS=-14  # EBU R128 target loudness

# ============================================================================
# EDIT THESE: Your best moments from the recordings
# Format: "filename|start_seconds|duration_seconds|label"
#
# Tips:
# - Aim for 4-6 segments totaling 3-5 minutes
# - Start with something that grabs (sub-bass or metallic)
# - End with something that resolves (spring root homecoming)
# - Vary the character: bass, metallic, rhythmic, textural, melodic
# ============================================================================
SEGMENTS=(
  # EXAMPLE (replace with your picks):
  "Rec-26.03.10-16h04m21s.aif|30|45|sub-bass-territory"
  "Rec-26.03.10-15h43m43s.aif|60|40|metallic-crystalline"
  "Feedback to be Song.aif|20|50|rhythmic-ensemble"
  "Rec-26.03.10-15h38m55s.aif|90|40|chaotic-texture"
  "Rec-26.03.10-16h04m21s.aif|180|35|spring-homecoming"
)

# ============================================================================
# Processing pipeline
# ============================================================================

echo "=== Feedback Demo Reel Builder ==="
echo ""

# Create temp directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Step 1: Extract and clean each segment
echo "Step 1: Extracting and cleaning segments..."
for i in "${!SEGMENTS[@]}"; do
  IFS='|' read -r file start dur label <<< "${SEGMENTS[$i]}"
  echo "  [$((i+1))/${#SEGMENTS[@]}] $label ($file @ ${start}s for ${dur}s)"

  ffmpeg -y -hide_banner -loglevel warning \
    -ss "$start" -t "$dur" \
    -i "$RAW_DIR/$file" \
    -af "volume=-3dB,highpass=f=20,lowpass=f=20000,aresample=44100,alimiter=limit=0.95:attack=0.1:release=50" \
    -c:a pcm_s24le \
    "$TEMP_DIR/seg_${i}_clean.wav"
done

echo ""
echo "Step 2: Applying fades to each segment..."

# Step 2: Apply fades
for i in "${!SEGMENTS[@]}"; do
  IFS='|' read -r file start dur label <<< "${SEGMENTS[$i]}"

  # First segment: fade in
  # Last segment: fade out
  # Middle segments: short fades for crossfade blending
  if [ "$i" -eq 0 ]; then
    AFADE="afade=t=in:st=0:d=${FADE_IN},afade=t=out:st=$((dur-CROSSFADE)):d=${CROSSFADE}"
  elif [ "$i" -eq $((${#SEGMENTS[@]}-1)) ]; then
    AFADE="afade=t=in:st=0:d=${CROSSFADE},afade=t=out:st=$((dur-FADE_OUT)):d=${FADE_OUT}"
  else
    AFADE="afade=t=in:st=0:d=${CROSSFADE},afade=t=out:st=$((dur-CROSSFADE)):d=${CROSSFADE}"
  fi

  ffmpeg -y -hide_banner -loglevel warning \
    -i "$TEMP_DIR/seg_${i}_clean.wav" \
    -af "$AFADE" \
    -c:a pcm_s24le \
    "$TEMP_DIR/seg_${i}_faded.wav"
done

echo ""
echo "Step 3: Concatenating with crossfades..."

# Step 3: Build the crossfaded mix
# For simplicity, use acrossfade filter chain
if [ ${#SEGMENTS[@]} -eq 1 ]; then
  cp "$TEMP_DIR/seg_0_faded.wav" "$TEMP_DIR/mixed.wav"
else
  # Build complex filter for crossfading
  INPUTS=""
  FILTER=""
  for i in "${!SEGMENTS[@]}"; do
    INPUTS="$INPUTS -i $TEMP_DIR/seg_${i}_faded.wav"
  done

  # Chain acrossfade filters
  if [ ${#SEGMENTS[@]} -eq 2 ]; then
    FILTER="[0][1]acrossfade=d=${CROSSFADE}:c1=tri:c2=tri"
  else
    # First pair
    FILTER="[0][1]acrossfade=d=${CROSSFADE}:c1=tri:c2=tri[a01];"
    # Middle pairs
    for i in $(seq 2 $((${#SEGMENTS[@]}-2))); do
      prev="a0$((i-1))"
      next="a0${i}"
      FILTER="${FILTER}[${prev}][${i}]acrossfade=d=${CROSSFADE}:c1=tri:c2=tri[${next}];"
    done
    # Last pair
    last=$((${#SEGMENTS[@]}-1))
    prev="a0$((last-1))"
    FILTER="${FILTER}[${prev}][${last}]acrossfade=d=${CROSSFADE}:c1=tri:c2=tri"
  fi

  ffmpeg -y -hide_banner -loglevel warning \
    $INPUTS \
    -filter_complex "$FILTER" \
    -c:a pcm_s24le \
    "$TEMP_DIR/mixed.wav"
fi

echo ""
echo "Step 4: Normalizing to ${TARGET_LUFS} LUFS..."

# Step 4: EBU R128 loudness normalization (two-pass)
ffmpeg -y -hide_banner -loglevel warning \
  -i "$TEMP_DIR/mixed.wav" \
  -af "loudnorm=I=${TARGET_LUFS}:TP=-1:LRA=11:print_format=json" \
  -f null - 2>&1 | grep -A20 '"input_' > "$TEMP_DIR/loudnorm_stats.txt"

# Extract measured values for second pass
INPUT_I=$(grep input_i "$TEMP_DIR/loudnorm_stats.txt" | grep -o '[-0-9.]*')
INPUT_TP=$(grep input_tp "$TEMP_DIR/loudnorm_stats.txt" | grep -o '[-0-9.]*')
INPUT_LRA=$(grep input_lra "$TEMP_DIR/loudnorm_stats.txt" | grep -o '[-0-9.]*')
INPUT_THRESH=$(grep input_thresh "$TEMP_DIR/loudnorm_stats.txt" | grep -o '[-0-9.]*')

if [ -n "$INPUT_I" ]; then
  ffmpeg -y -hide_banner -loglevel warning \
    -i "$TEMP_DIR/mixed.wav" \
    -af "loudnorm=I=${TARGET_LUFS}:TP=-1:LRA=11:measured_I=${INPUT_I}:measured_TP=${INPUT_TP}:measured_LRA=${INPUT_LRA}:measured_thresh=${INPUT_THRESH}:linear=true" \
    -c:a pcm_s24le \
    "$OUT_DIR/Feedback_Demo.wav"
else
  echo "  Warning: loudnorm stats extraction failed, using single-pass"
  ffmpeg -y -hide_banner -loglevel warning \
    -i "$TEMP_DIR/mixed.wav" \
    -af "loudnorm=I=${TARGET_LUFS}:TP=-1:LRA=11" \
    -c:a pcm_s24le \
    "$OUT_DIR/Feedback_Demo.wav"
fi

echo ""
echo "Step 5: Creating MP3 for email/web..."

# Step 5: MP3 version
ffmpeg -y -hide_banner -loglevel warning \
  -i "$OUT_DIR/Feedback_Demo.wav" \
  -codec:a libmp3lame -qscale:a 0 \
  "$OUT_DIR/Feedback_Demo.mp3"

echo ""
echo "=== Done ==="
echo "Output:"
echo "  WAV: $OUT_DIR/Feedback_Demo.wav"
echo "  MP3: $OUT_DIR/Feedback_Demo.mp3"
echo ""

# Show final stats
ffmpeg -i "$OUT_DIR/Feedback_Demo.wav" -filter_complex "ebur128=peak=true" -f null - 2>&1 | grep -E "Integrated|LRA|Peak" | tail -6
