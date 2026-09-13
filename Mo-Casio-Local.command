#!/bin/zsh
set -euo pipefail

# Kiểm tra nếu server đang chạy trên 5180 hoặc 5181
if curl -fsS "http://localhost:5181/" >/dev/null 2>&1; then
  echo "🎯 Máy chủ Casio fx-580VN X đang hoạt động tại: http://localhost:5181"
  open "http://localhost:5181"
  exit 0
elif curl -fsS "http://localhost:5180/" >/dev/null 2>&1; then
  echo "🎯 Máy chủ Casio fx-580VN X đang hoạt động tại: http://localhost:5180"
  open "http://localhost:5180"
  exit 0
else
  echo "🚀 Đang khởi động máy chủ Casio fx-580VN X..."
  cd "/Users/admin/conictypst/casio-fx580-web"
  npm run dev
fi
