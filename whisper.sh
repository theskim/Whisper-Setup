#!/usr/bin/env bash
# whisper.sh
# Usage:
#   ./whisper.sh lecture1.mp4

# check if file was given
if [ -z "$1" ]; then
  echo "❌ No file provided."
  echo "Usage: $0 <file.mp4>"
  exit 1
fi

INPUT="$1"
BASENAME=$(basename "$INPUT" .mp4)
OUTPUT_DIR="transcripts"

mkdir -p "$OUTPUT_DIR"

# Choose model (large = best accuracy)
MODEL="medium"

echo "🎧 Transcribing $INPUT with Whisper ($MODEL model)..."

whisper "$INPUT" \
  --model $MODEL \
  --language en \
  --task transcribe \
  --output_format txt \
  --output_dir "$OUTPUT_DIR"

# Rename output so it matches input basename
mv "$OUTPUT_DIR/$BASENAME.txt" "$OUTPUT_DIR/${BASENAME}_notes.txt" 2>/dev/null

echo "✅ Transcript saved as $OUTPUT_DIR/${BASENAME}_notes.txt"
