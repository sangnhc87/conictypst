#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script biên dịch Đề cương Toán 10 Học kỳ I:
  1. Bản COMPACT HỌC SINH (tiết kiệm giấy in tối đa).
  2. Bản ĐỀ (TỔ TOÁN): Không lời giải, bố cục compact 2 cột, chừa dòng làm bài.
  3. Bản FULL GIẢI (TỔ TOÁN): Lời giải chi tiết từng bước, tô đỏ đáp án đúng, bảng đáp án ở cuối.

Cách dùng:
  python3 typst/sach/DECUONG10-HK1/build_ban_tang.py
  python3 typst/sach/DECUONG10-HK1/build_ban_tang.py --compact
  python3 typst/sach/DECUONG10-HK1/build_ban_tang.py --de
  python3 typst/sach/DECUONG10-HK1/build_ban_tang.py --giai
"""

import os
import sys
import time
import subprocess
import argparse

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
TYPST_ROOT = os.path.abspath(os.path.join(CURRENT_DIR, "..", ".."))  # conictypst/typst
REPO_ROOT = os.path.abspath(os.path.join(TYPST_ROOT, ".."))           # conictypst

FILE_COMPACT_TYP = os.path.join(CURRENT_DIR, "main-compact.typ")
FILE_COMPACT_PDF = os.path.join(CURRENT_DIR, "de-cuong-toan10-hk1-compact.pdf")

FILE_DE_TYP = os.path.join(CURRENT_DIR, "main-to-toan-de.typ")
FILE_DE_PDF = os.path.join(CURRENT_DIR, "de-cuong-toan10-hk1-to-toan-de.pdf")

FILE_GIAI_TYP = os.path.join(CURRENT_DIR, "main-to-toan-full-giai.typ")
FILE_GIAI_PDF = os.path.join(CURRENT_DIR, "de-cuong-toan10-hk1-to-toan-full-giai.pdf")

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

def build_compact():
    print("\n" + "=" * 65)
    print("▶ ĐANG BIÊN DỊCH BẢN COMPACT HỌC SINH...")
    print("=" * 65)
    cmd = [
        "typst", "compile",
        "--root", REPO_ROOT,
        "--input", 'layout=compact',
        "--input", 'mode=dethi',
        FILE_COMPACT_TYP,
        FILE_COMPACT_PDF
    ]
    t0 = time.time()
    res = subprocess.run(cmd, cwd=REPO_ROOT)
    elapsed = time.time() - t0
    if res.returncode == 0 and os.path.exists(FILE_COMPACT_PDF):
        pages = get_page_count(FILE_COMPACT_PDF)
        size = format_size(FILE_COMPACT_PDF)
        print(f"  Thành công! ({elapsed:.1f}s)")
        print(f"  File xuất: {FILE_COMPACT_PDF}")
        print(f"  Số trang : {pages} trang")
        print(f"  Dung lượng: {size}")
        return True
    else:
        print("  Biên dịch THẤT BẠI.")
        return False

def build_de():
    print("\n" + "=" * 65)
    print("▶ ĐANG BIÊN DỊCH BẢN ĐỀ (TỔ TOÁN)...")
    print("=" * 65)
    cmd = [
        "typst", "compile",
        "--root", REPO_ROOT,
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
    print("▶ ĐANG BIÊN DỊCH BẢN FULL GIẢI (TỔ TOÁN)...")
    print("=" * 65)
    cmd = [
        "typst", "compile",
        "--root", REPO_ROOT,
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
    parser = argparse.ArgumentParser(description="Build Đề cương Toán 10 HK1")
    parser.add_argument("--compact", action="store_true", help="Chỉ biên dịch bản compact học sinh")
    parser.add_argument("--de", action="store_true", help="Chỉ biên dịch bản đề Tổ Toán")
    parser.add_argument("--giai", action="store_true", help="Chỉ biên dịch bản full giải")
    args = parser.parse_args()

    if not args.compact and not args.de and not args.giai:
        build_compact()
        build_de()
        build_giai()
    else:
        if args.compact:
            build_compact()
        if args.de:
            build_de()
        if args.giai:
            build_giai()

if __name__ == "__main__":
    main()
