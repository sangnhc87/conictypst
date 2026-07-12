#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/output"

echo "🎨 Building examples..."

cd "$ROOT"
typst compile --root "$ROOT" examples/cone-demo.typ output/cone-demo.pdf
typst compile --root "$ROOT" examples/helix-demo.typ output/helix-demo.pdf
typst compile --root "$ROOT" examples/conics-demo.typ output/conics-demo.pdf
typst compile --root "$ROOT" examples/truncated-pyramid-demo.typ output/truncated-pyramid-demo.pdf
typst compile --root "$ROOT" examples/saddle-demo.typ output/saddle-demo.pdf
typst compile --root "$ROOT" examples/conical-helix-demo.typ output/conical-helix-demo.pdf
typst compile --root "$ROOT" examples/calculus-volume-demo.typ output/calculus-volume-demo.pdf
typst compile --root "$ROOT" examples/gallery.typ output/gallery.pdf
typst compile --root "$ROOT" examples/samples/tich-phan-doc-la.typ output/tich-phan-doc-la.pdf
typst compile --root "$ROOT" examples/samples/xac-suat-doc-la.typ output/xac-suat-doc-la.pdf
typst compile --root "$ROOT" examples/probability-tree-demo.typ output/probability-tree-demo.pdf
typst compile --root "$ROOT" examples/bayes-box-demo.typ output/bayes-box-demo.pdf

echo "✅ Examples built in output/"
