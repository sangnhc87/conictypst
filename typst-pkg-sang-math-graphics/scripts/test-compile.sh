#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "🧪 Testing package compilation..."

cd "$ROOT"

# Test từng ví dụ (dùng --root để import từ lib.typ hoạt động)
for f in examples/*.typ examples/samples/*.typ; do
  if [ -f "$f" ]; then
    echo "  - Testing $f"
    typst compile --root "$ROOT" "$f" /tmp/smg-test.pdf
    rm -f /tmp/smg-test.pdf
  fi
done

for f in tests/test-api.typ; do
  if [ -f "$f" ]; then
    echo "  - Testing $f"
    typst compile --root "$ROOT" "$f" /tmp/smg-test.pdf
    rm -f /tmp/smg-test.pdf
  fi
done

echo "✅ All examples and API smoke tests compile successfully"
