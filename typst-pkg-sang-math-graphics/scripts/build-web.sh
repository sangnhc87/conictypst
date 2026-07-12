#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "🌐 Building website..."

cd "$ROOT/docs"

# Cài đặt dependencies nếu chưa có
if [ ! -d "node_modules" ]; then
  echo "📦 Installing docs dependencies..."
  npm install
fi

npm run build

echo "✅ Website built at docs/src/.vitepress/dist/"
echo "👉 Deploy docs/src/.vitepress/dist/ to GitHub Pages"
