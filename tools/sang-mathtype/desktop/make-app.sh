#!/bin/bash
# Đóng gói app desktop thành "Sang Math.app" (dùng Electron có sẵn trong node_modules của dự án).
# Kết quả: tools/sang-mathtype/out/Sang Math.app. Kéo vào Applications nếu muốn.
set -euo pipefail
cd "$(dirname "$0")/../../.."
ROOT="$PWD"
OUT="$ROOT/tools/sang-mathtype/out/Sang Math.app"
SRC="$ROOT/tools/sang-mathtype"

node "$SRC/build.mjs" >/dev/null
rm -rf "$OUT"; mkdir -p "$SRC/out"
cp -R "$ROOT/node_modules/electron/dist/Electron.app" "$OUT"
APP="$OUT/Contents/Resources/app"
rm -f "$OUT/Contents/Resources/default_app.asar"
mkdir -p "$APP/desktop" "$APP/dist"
cp "$SRC/desktop/main.mjs" "$SRC/desktop/preload.cjs" "$SRC/desktop/word-applescript.mjs" "$SRC/desktop/exam.mjs" "$APP/desktop/"
mkdir -p "$APP/exam" && cp -R "$SRC/exam/engine" "$SRC/exam/examd.py" "$APP/exam/"
cp -R "$SRC/desktop/assets" "$APP/desktop/assets"
[ -d "$SRC/certs" ] && cp -R "$SRC/certs" "$APP/desktop/certs"
cp -R "$SRC/dist/." "$APP/dist/"
echo '{"name":"sang-math","version":"0.1.0","main":"desktop/main.mjs","type":"module"}' > "$APP/package.json"

# Biểu tượng
ICONSET="$(mktemp -d)/icon.iconset"; mkdir -p "$ICONSET"
for s in 16 32 64 128 256 512; do
  sips -z $s $s "$SRC/desktop/assets/icon.png" --out "$ICONSET/icon_${s}x${s}.png" >/dev/null
  sips -z $((s*2)) $((s*2)) "$SRC/desktop/assets/icon.png" --out "$ICONSET/icon_${s}x${s}@2x.png" >/dev/null
done
iconutil -c icns "$ICONSET" -o "$OUT/Contents/Resources/electron.icns"

# Thông tin app + lời xin quyền điều khiển Word (macOS hỏi một lần)
PL="$OUT/Contents/Info.plist"
plutil -replace CFBundleName -string "Sang Math" "$PL"
plutil -replace CFBundleDisplayName -string "Sang Math" "$PL"
plutil -replace CFBundleIdentifier -string "vn.sangmath.desktop" "$PL"
plutil -replace NSAppleEventsUsageDescription -string "Sang Math cần điều khiển Microsoft Word để chèn và sửa công thức trong tài liệu của bạn." "$PL"
codesign --force --deep --sign - -r="designated => identifier \"vn.sangmath.desktop\"" "$OUT" >/dev/null 2>&1 || codesign --force --deep --sign - "$OUT" >/dev/null 2>&1 || true
echo "Đã tạo: $OUT"
