#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_DIR="$(cd "$ROOT_DIR/.." && pwd)"
OUT_DIR="${1:-$REPO_DIR/output/sang-math-templates}"

mkdir -p "$OUT_DIR"

themes=(
  classic
  ocean
  emerald
  royal
  violet
  crimson
  graphite
  amber
  teal-pro
  sky
  indigo-minimal
  print-economy
  aurora
  lotus
  navy-gold
  jade
  coral
  plum
)

for theme in "${themes[@]}"; do
  typst compile \
    --root "$ROOT_DIR" \
    "$ROOT_DIR/examples/exam-template-demo.typ" \
    "$OUT_DIR/demo-${theme}.pdf" \
    --input "theme=${theme}"
done

typst compile \
  --root "$ROOT_DIR" \
  "$ROOT_DIR/examples/exam-template-demo.typ" \
  "$OUT_DIR/demo-ocean-loigiai-answer-key.pdf" \
  --input "theme=ocean" \
  --input "profile=loigiai" \
  --input "answer-key=1"

typst compile \
  --root "$ROOT_DIR" \
  "$ROOT_DIR/examples/exam-template-demo.typ" \
  "$OUT_DIR/demo-graphite-two-columns.pdf" \
  --input "theme=graphite" \
  --input "two-columns=1" \
  --input "opt-style=circle" \
  --input "q-label-style=pill"

typst compile \
  --root "$ROOT_DIR" \
  "$ROOT_DIR/examples/exam-template-demo.typ" \
  "$OUT_DIR/demo-teal-draft.pdf" \
  --input "theme=teal-pro" \
  --input "draft=1" \
  --input "opt-style=solid-circle" \
  --input "q-label-style=badge"

typst compile \
  --root "$ROOT_DIR" \
  "$ROOT_DIR/examples/exam-template-demo.typ" \
  "$OUT_DIR/demo-ocean-hexagon.pdf" \
  --input "theme=ocean" \
  --input "opt-style=hexagon"

typst compile \
  --root "$ROOT_DIR" \
  "$ROOT_DIR/examples/exam-template-demo.typ" \
  "$OUT_DIR/demo-lotus-solid-triangle.pdf" \
  --input "theme=lotus" \
  --input "opt-style=solid-triangle" \
  --input "q-label-style=flag"

typst compile \
  --root "$ROOT_DIR" \
  "$ROOT_DIR/examples/exam-template-demo.typ" \
  "$OUT_DIR/demo-aurora-solid-diamond.pdf" \
  --input "theme=aurora" \
  --input "opt-style=solid-diamond" \
  --input "q-label-style=spark"

echo "Compiled ${#themes[@]} themes plus 6 feature variants to $OUT_DIR"
