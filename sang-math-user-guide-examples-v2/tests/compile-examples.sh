#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."
mkdir -p build/examples
if ! command -v typst >/dev/null 2>&1; then
  echo "Không tìm thấy lệnh typst. Hãy cài Typst trước khi chạy script này."
  exit 1
fi
for f in examples/*.typ; do
  base="$(basename "$f" .typ)"
  echo "Biên dịch $f -> build/examples/$base.pdf"
  typst compile "$f" "build/examples/$base.pdf"
done
