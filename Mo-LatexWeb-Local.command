#!/bin/zsh

set -euo pipefail

repo_dir="/Users/admin/stexgv/LatexWeb"
url="http://127.0.0.1:8080"
log_root="${TMPDIR:-/tmp}/latexweb-local"
log_file="$log_root/server.log"

mkdir -p "$log_root"

existing_pids=$(pgrep -f "$repo_dir/app.py" || true)
if [[ -n "$existing_pids" ]]; then
  echo "$existing_pids" | xargs kill
  for _ in {1..20}; do
    if ! pgrep -f "$repo_dir/app.py" >/dev/null 2>&1; then
      break
    fi
    sleep 0.25
  done
fi

cd "$repo_dir"
export LATEXWEB_LOCAL_BYPASS=1

nohup python3 app.py >"$log_file" 2>&1 &

for _ in {1..40}; do
  if curl -fsS "$url/" >/dev/null 2>&1; then
    open "$url"
    echo "Da mo LatexWeb local tai: $url"
    echo "Log: $log_file"
    exit 0
  fi
  sleep 0.25
done

echo "Khong khoi dong duoc LatexWeb local."
echo "Xem log tai: $log_file"
exit 1