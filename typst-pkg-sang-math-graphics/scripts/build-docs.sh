#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/output"

echo "📄 Building PDF manual..."

cd "$ROOT"
typst compile --root "$ROOT" docs/src/manual.typ output/manual.pdf

echo "✅ Manual built at output/manual.pdf"
