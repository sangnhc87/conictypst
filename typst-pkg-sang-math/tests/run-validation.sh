#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
for case in index multiple points metadata; do
  if typst compile --root "$repo_root" --input "case=$case" \
    "$repo_root/typst-pkg-sang-math/tests/validation/invalid.typ" \
    "/tmp/sang-math-invalid-$case.pdf" >"/tmp/sang-math-invalid-$case.log" 2>&1; then
    echo "Validation unexpectedly accepted $case" >&2
    exit 1
  fi
  if ! grep -q 'sang-math: question' "/tmp/sang-math-invalid-$case.log"; then
    cat "/tmp/sang-math-invalid-$case.log" >&2
    exit 1
  fi
done
echo "Validation rejects index, multiple answers, negative points, and bad metadata"
