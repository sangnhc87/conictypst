#!/bin/bash
# Cài Sang Math cho Word Mac: tải manifest rồi chép vào thư mục add-in của Word.
# Dùng:  curl -fsSL https://sangmath-word.pages.dev/install-mac.sh | bash
# Gỡ:    curl -fsSL https://sangmath-word.pages.dev/install-mac.sh | bash -s -- --remove
set -euo pipefail
BASE="${SM_BASE_URL:-https://sangmath-word.pages.dev}"
WEF="${SM_WEF_DIR:-$HOME/Library/Containers/com.microsoft.Word/Data/Documents/wef}"
FILE="$WEF/sangmath.xml"

if [ "${1:-}" = "--remove" ]; then
  rm -f "$FILE"
  echo "Đã gỡ Sang Math. Mở lại Word để cập nhật."
  exit 0
fi

mkdir -p "$WEF"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT
curl -fsSL "$BASE/manifest.xml" -o "$TMP"
if ! grep -q "<OfficeApp" "$TMP"; then
  echo "Tệp tải về không phải manifest của Sang Math. Kiểm tra mạng rồi thử lại." >&2
  exit 1
fi
mv "$TMP" "$FILE"
chmod 644 "$FILE"
trap - EXIT
echo "Đã cài Sang Math vào: $FILE"
echo
echo "Bước tiếp theo:"
echo "  1. Thoát hẳn Word (Cmd+Q) rồi mở lại."
echo "  2. Chèn (Insert) > Add-ins > My Add-ins > Developer Add-ins > Sang Math."
echo "     (nút Sang Math sẽ hiện ở tab Home sau lần mở đầu tiên)"
echo "Công cụ tự cập nhật: không cần cài lại khi có bản mới."
