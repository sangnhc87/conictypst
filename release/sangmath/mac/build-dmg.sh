#!/bin/bash
# Tạo SangMath.dmg chứa "Cai Sang Math.app" (bấm mở để cài add-in cho Word Mac). Chạy trên macOS.
set -euo pipefail
OUT="${1:-out}"
APP="$OUT/dmg/Cai Sang Math.app"
rm -rf "$OUT/dmg"; mkdir -p "$APP/Contents/MacOS"
cat > "$APP/Contents/Info.plist" <<'PL'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleName</key><string>Cai Sang Math</string>
<key>CFBundleDisplayName</key><string>Cài Sang Math</string>
<key>CFBundleIdentifier</key><string>vn.sangmath.installer</string>
<key>CFBundleExecutable</key><string>install</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleVersion</key><string>1</string>
<key>LSMinimumSystemVersion</key><string>10.13</string>
</dict></plist>
PL
cat > "$APP/Contents/MacOS/install" <<'SH'
#!/bin/bash
LOG="$(curl -fsSL https://sangmath-word.pages.dev/install-mac.sh | bash 2>&1)"
if [ $? -eq 0 ] && echo "$LOG" | grep -q "Đã cài"; then
  osascript -e 'display dialog "Đã cài Sang Math cho Word.\n\nThoát hẳn Word (Cmd+Q) rồi mở lại, vào Insert > Add-ins > My Add-ins > Developer Add-ins > Sang Math." buttons {"Xong"} default button 1 with title "Sang Math"'
else
  osascript -e 'display dialog "Chưa cài được. Kiểm tra kết nối Internet và thử lại." buttons {"Đóng"} default button 1 with icon stop with title "Sang Math"'
fi
SH
chmod +x "$APP/Contents/MacOS/install"
cat > "$OUT/dmg/HUONG-DAN.txt" <<'TXT'
1. Bấm chuột phải vào "Cai Sang Math" > Open > Open (chỉ lần đầu, vì app chưa ký).
2. Chờ thông báo "Đã cài", thoát hẳn Word (Cmd+Q) rồi mở lại.
3. Word: Insert > Add-ins > My Add-ins > Developer Add-ins > Sang Math.
TXT
hdiutil create -volname "Sang Math" -srcfolder "$OUT/dmg" -ov -format UDZO "$OUT/SangMath.dmg"
echo "Đã tạo $OUT/SangMath.dmg"
