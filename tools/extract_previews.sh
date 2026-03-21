#!/bin/bash
# ============================================================================
# Extract 30-second preview clips from each recording
# Listen through these to quickly find your best moments, then update
# build_demo.sh with the timestamps.
# ============================================================================

RAW_DIR="/mnt/d/Music/Max Msp/Projects/Feedback/Audio/Raw"
PREVIEW_DIR="/mnt/d/Music/Max Msp/Projects/Feedback/Audio/Previews"

mkdir -p "$PREVIEW_DIR"

# Files ranked by dynamic range (most interesting first)
FILES=(
  "Rec-26.03.10-16h04m21s.aif|275|LRA26.4_LOUDEST_MOST_DYNAMIC"
  "Rec-26.03.10-15h43m43s.aif|309|LRA24.5_HIGH_DYNAMICS"
  "Rec-26.03.10-15h49m14s.aif|221|LRA23.1_DYNAMIC_BUT_CLIPS"
  "Rec-26.03.10-15h57m23s.aif|163|LRA23.0_QUIET_TEXTURAL"
  "Feedback to be Song.aif|153|LRA20.8_ALREADY_CURATED"
  "Rec-26.03.10-15h32m29s.aif|321|LRA20.7_LONG_SESSION"
  "Rec-26.03.10-15h38m55s.aif|273|LRA19.8_LOUDEST_STEADY"
  "Rec-26.03.10-16h09m27s.aif|112|LRA18.8_SHORT"
  "Rec-26.03.11-17h28m20s.aif|294|LRA_UNKNOWN_NEXT_DAY"
)

echo "=== Extracting 30-second previews ==="
echo "Output: $PREVIEW_DIR"
echo ""

for entry in "${FILES[@]}"; do
  IFS='|' read -r file dur notes <<< "$entry"
  basename="${file%.aif}"

  # Extract clips at 25%, 50%, 75% of duration
  for pct in 25 50 75; do
    start=$(( dur * pct / 100 ))
    outname="${basename}_${pct}pct_${start}s_${notes}.wav"

    echo "  $file @ ${start}s (${pct}%)"
    ffmpeg -y -hide_banner -loglevel warning \
      -ss "$start" -t 30 \
      -i "$RAW_DIR/$file" \
      -af "highpass=f=20,afade=t=in:st=0:d=0.5,afade=t=out:st=29:d=1" \
      -c:a pcm_s16le \
      "$PREVIEW_DIR/$outname"
  done
  echo ""
done

# Also extract the first 30s of "Feedback to be Song" since it's already curated
echo "  Feedback to be Song @ 0s (start)"
ffmpeg -y -hide_banner -loglevel warning \
  -t 30 \
  -i "$RAW_DIR/Feedback to be Song.aif" \
  -af "highpass=f=20,afade=t=in:st=0:d=0.5,afade=t=out:st=29:d=1" \
  -c:a pcm_s16le \
  "$PREVIEW_DIR/Feedback_to_be_Song_START.wav"

echo ""
echo "=== Done ==="
echo "Listen through the previews in $PREVIEW_DIR"
echo "Then edit tools/build_demo.sh with your chosen timestamps."
echo ""
echo "Files are named: RECORDING_PERCENT_STARTSECOND_NOTES.wav"
echo "So you can quickly identify which moments to use."
