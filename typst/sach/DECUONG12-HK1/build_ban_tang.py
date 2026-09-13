#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script biên dịch 2 bản Đề cương Toán 12 Học kỳ I dành tặng đồng nghiệp/bạn bè:
  1. Bản ĐỀ (TỔ TOÁN): Không lời giải, bố cục compact 2 cột, chừa dòng làm bài.
  2. Bản FULL GIẢI (TỔ TOÁN): Lời giải chi tiết từng bước, tô đỏ đáp án đúng, bảng đáp án ở cuối.

Đơn vị: "TỔ TOÁN" (đã loại bỏ THPT Nguyễn Hữu Cảnh).
Bảo toàn 100% bản gốc của trường.

Cách dùng:
  python3 typst/sach/DECUONG12-HK1/build_ban_tang.py
  python3 typst/sach/DECUONG12-HK1/build_ban_tang.py --de
  python3 typst/sach/DECUONG12-HK1/build_ban_tang.py --giai
"""

import os
import sys
import time
import subprocess
import argparse

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
TYPST_ROOT = os.path.abspath(os.path.join(CURRENT_DIR, "..", ".."))  # /path/to/conictypst/typst
REPO_ROOT = os.path.abspath(os.path.join(TYPST_ROOT, ".."))           # /path/to/conictypst

FILE_DE_TYP = os.path.join(CURRENT_DIR, "main-to-toan-de.typ")
FILE_DE_PDF = os.path.join(CURRENT_DIR, "de-cuong-toan12-hk1-to-toan-de.pdf")

FILE_GIAI_TYP = os.path.join(CURRENT_DIR, "main-to-toan-full-giai.typ")
FILE_GIAI_PDF = os.path.join(CURRENT_DIR, "de-cuong-toan12-hk1-to-toan-full-giai.pdf")

def get_page_count(pdf_path):
    try:
        res = subprocess.run(["pdfinfo", pdf_path], capture_output=True, text=True, check=True)
        for line in res.stdout.splitlines():
            if line.startswith("Pages:"):
                return line.split(":")[1].strip()
    except Exception:
        pass
    return "N/A"

def format_size(path):
    try:
        size = os.path.getsize(path)
        for unit in ['B', 'KB', 'MB', 'GB']:
            if size < 1024:
                return f"{size:.1f} {unit}"
            size /= 1024
    except Exception:
        return "N/A"
    return f"{size:.1f} GB"

def build_de():
    print("\n" + "=" * 65)
    print("▶ [1/2] ĐANG BIÊN DỊCH BẢN ĐỀ (TỔ TOÁN)...")
    print("=" * 65)
    cmd = [
        "typst", "compile",
        "--root", TYPST_ROOT,
        "--input", 'truong=TỔ TOÁN',
        "--input", 'layout=compact',
        "--input", 'mode=dethi',
        FILE_DE_TYP,
        FILE_DE_PDF
    ]
    t0 = time.time()
    res = subprocess.run(cmd, cwd=REPO_ROOT)
    elapsed = time.time() - t0
    if res.returncode == 0 and os.path.exists(FILE_DE_PDF):
        pages = get_page_count(FILE_DE_PDF)
        size = format_size(FILE_DE_PDF)
        print(f"  Thành công! ({elapsed:.1f}s)")
        print(f"  File xuất: {FILE_DE_PDF}")
        print(f"  Số trang : {pages} trang")
        print(f"  Dung lượng: {size}")
        return True
    else:
        print("  Biên dịch THẤT BẠI.")
        return False

def build_giai():
    print("\n" + "=" * 65)
    print("▶ [2/2] ĐANG BIÊN DỊCH BẢN FULL GIẢI (TỔ TOÁN)...")
    print("=" * 65)
    cmd = [
        "typst", "compile",
        "--root", TYPST_ROOT,
        "--input", 'truong=TỔ TOÁN',
        "--input", 'mode=loigiai',
        FILE_GIAI_TYP,
        FILE_GIAI_PDF
    ]
    t0 = time.time()
    res = subprocess.run(cmd, cwd=REPO_ROOT)
    elapsed = time.time() - t0
    if res.returncode == 0 and os.path.exists(FILE_GIAI_PDF):
        pages = get_page_count(FILE_GIAI_PDF)
        size = format_size(FILE_GIAI_PDF)
        print(f"  Thành công! ({elapsed:.1f}s)")
        print(f"  File xuất: {FILE_GIAI_PDF}")
        print(f"  Số trang : {pages} trang")
        print(f"  Dung lượng: {size}")
        return True
    else:
        print("  Biên dịch THẤT BẠI.")
        return False

def main():
    parser = argparse.ArgumentParser(description="Biên dịch bản tặng cho đồng nghiệp (Tổ Toán)")
    parser.add_argument("--de", action="store_true", help="Chỉ biên dịch bản Đề")
    parser.add_argument("--giai", action="store_true", help="Chỉ biên dịch bản Full Giải")
    args = parser.parse_args()

    ok_de = True
    ok_giai = True

    if args.de:
        ok_de = build_de()
    elif args.giai:
        ok_giai = build_giai()
    else:
        ok_de = build_de()
        ok_giai = build_giai()

    print("\n" + "=" * 65)
    print("TỔNG KẾT:")
    if ok_de and (not args.giai):
        print("  1. Bản Đề       : HOÀN TẤT")
    if ok_giai and (not args.de):
        print("  2. Bản Full Giải: HOÀN TẤT")
    print("=" * 65 + "\n")

if __name__ == "__main__":
    main()
