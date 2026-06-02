#!/bin/zsh

set -euo pipefail

repo_dir="/Users/admin/stexgv/LatexWeb"
existing_pids=$(pgrep -f "$repo_dir/app.py" || true)

if [[ -z "$existing_pids" ]]; then
  echo "LatexWeb local dang tat san."
  exit 0
fi

echo "$existing_pids" | xargs kill
echo "Da tat LatexWeb local."