#!/usr/bin/env bash
# ================================================================
# install.sh — Cài sang-math vào Typst local package
# Sau khi cài, dùng: #import "@local/sang-math:1.0.1": *
# ================================================================
set -e

PKG_NAME="sang-math"
PKG_VERSION="1.0.1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Xác định thư mục data của Typst theo OS
case "$(uname -s)" in
  Darwin)
    TYPST_DATA="$HOME/Library/Application Support/typst"
    ;;
  Linux)
    TYPST_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/typst"
    ;;
  MINGW*|MSYS*|CYGWIN*)
    TYPST_DATA="${APPDATA}/typst"
    ;;
  *)
    echo "❌ OS không được hỗ trợ. Vui lòng cài thủ công."
    exit 1
    ;;
esac

INSTALL_DIR="$TYPST_DATA/packages/local/$PKG_NAME/$PKG_VERSION"

echo "📦 Cài đặt $PKG_NAME v$PKG_VERSION..."
echo "   → $INSTALL_DIR"

mkdir -p "$INSTALL_DIR"

# Làm sạch đúng version local rồi chép đủ package tree. Chỉ chép các thư mục
# runtime công khai, không đưa tests/examples/build artifact vào cache Typst.
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
cp "$SCRIPT_DIR"/*.typ "$INSTALL_DIR/"
cp "$SCRIPT_DIR/typst.toml" "$INSTALL_DIR/"
for directory in core geometry-2d geometry-3d thumbnails; do
  if [ -d "$SCRIPT_DIR/$directory" ]; then
    cp -R "$SCRIPT_DIR/$directory" "$INSTALL_DIR/$directory"
  fi
done
for document in LICENSE README.md; do
  if [ -f "$SCRIPT_DIR/$document" ]; then
    cp "$SCRIPT_DIR/$document" "$INSTALL_DIR/$document"
  fi
done

echo ""
echo "✅ Cài đặt thành công!"
echo ""
echo "Dùng trong file .typ:"
echo '  #import "@local/sang-math:1.0.1": *'
echo ""
echo "Hoặc chỉ import module cần:"
echo '  #import "@local/sang-math:1.0.1": tn, bbtv2, bxd'
