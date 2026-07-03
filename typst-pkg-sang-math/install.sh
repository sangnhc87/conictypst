#!/usr/bin/env bash
# ================================================================
# install.sh — Cài sang-math vào Typst local package
# Sau khi cài, dùng: #import "@local/sang-math:1.0.0": *
# ================================================================
set -e

PKG_NAME="sang-math"
PKG_VERSION="1.0.0"
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

# Copy tất cả file .typ và typst.toml
cp "$SCRIPT_DIR"/*.typ  "$INSTALL_DIR/"
cp "$SCRIPT_DIR/typst.toml" "$INSTALL_DIR/"

echo ""
echo "✅ Cài đặt thành công!"
echo ""
echo "Dùng trong file .typ:"
echo '  #import "@local/sang-math:1.0.0": *'
echo ""
echo "Hoặc chỉ import module cần:"
echo '  #import "@local/sang-math:1.0.0": tn, bbtv2, bxd'
