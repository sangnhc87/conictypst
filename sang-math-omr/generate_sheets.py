#!/usr/bin/env python3
"""
generate_sheets.py – SANG MATH OMR Sheet Generator
Sinh phiếu OMR hàng loạt bằng Typst CLI
Chạy: python3 generate_sheets.py --help
"""
import argparse
import subprocess
import sys
import os
import json
import zipfile
from pathlib import Path

TEMPLATES_DIR = Path(__file__).parent / "templates"
OUTPUT_DIR    = Path(__file__).parent / "output_sheets"

TEMPLATE_MAP = {
    "tn-40":         "tn-40.typ",
    "tn-50":         "tn-50.typ",
    "tn-60":         "tn-60.typ",
    "ds-12":         "ds-12.typ",
    "hybrid":        "hybrid-28tn-12ds.typ",
}

def check_typst():
    """Kiểm tra Typst CLI có được cài đặt không"""
    try:
        result = subprocess.run(["typst", "--version"], capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            print(f"✅ Typst CLI: {result.stdout.strip()}")
            return True
    except (FileNotFoundError, subprocess.TimeoutExpired):
        pass
    print("❌ Không tìm thấy Typst CLI.")
    print("   Cài đặt: https://github.com/typst/typst/releases")
    print("   Hoặc: brew install typst   (macOS)")
    return False


def compile_sheet(template_typ: Path, output_pdf: Path, inputs: dict) -> bool:
    """Biên dịch 1 phiếu OMR từ Typst sang PDF"""
    cmd = ["typst", "compile", str(template_typ), str(output_pdf)]
    for k, v in inputs.items():
        cmd += ["--input", f"{k}={v}"]
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30,
                                cwd=str(TEMPLATES_DIR))
        if result.returncode == 0:
            return True
        else:
            print(f"  ⚠️ Lỗi biên dịch: {result.stderr.strip()[:200]}")
            return False
    except subprocess.TimeoutExpired:
        print(f"  ⚠️ Timeout khi biên dịch {output_pdf.name}")
        return False


def generate_batch(args):
    """Sinh nhiều phiếu theo cấu hình"""
    OUTPUT_DIR.mkdir(exist_ok=True)
    
    template_file = TEMPLATES_DIR / TEMPLATE_MAP[args.type]
    if not template_file.exists():
        print(f"❌ Không tìm thấy template: {template_file}")
        sys.exit(1)
    
    made_list = [m.strip() for m in args.made.split(",")]
    generated = []
    total = len(made_list)
    
    print(f"\n📋 Sinh {total} phiếu loại '{args.type}'")
    print(f"   Trường: {args.school}")
    print(f"   Môn/Ghi chú: {args.subtitle}")
    print(f"   Mã đề: {', '.join(made_list)}")
    print()
    
    for idx, made in enumerate(made_list, 1):
        safe_made = made.replace("/", "-").replace(" ", "_")
        filename = f"phieu-{args.type}-made{safe_made}.pdf"
        output_pdf = OUTPUT_DIR / filename
        
        inputs = {
            "school":   args.school,
            "subtitle": args.subtitle,
            "made":     made,
        }
        
        print(f"  [{idx}/{total}] Mã đề {made} → {filename}", end=" ")
        ok = compile_sheet(template_file, output_pdf, inputs)
        if ok:
            print("✅")
            generated.append(output_pdf)
        else:
            print("❌")
    
    # Đóng gói ZIP
    if generated and args.zip:
        zip_path = OUTPUT_DIR / f"phieu-{args.type}-{args.school[:10]}.zip"
        with zipfile.ZipFile(zip_path, "w") as zf:
            for f in generated:
                zf.write(f, f.name)
        print(f"\n📦 Đã đóng gói {len(generated)} phiếu → {zip_path}")
    
    print(f"\n✅ Hoàn thành! {len(generated)}/{total} phiếu thành công.")
    print(f"   Thư mục xuất: {OUTPUT_DIR.resolve()}")


def main():
    parser = argparse.ArgumentParser(
        description="SANG MATH OMR – Sinh phiếu thi hàng loạt",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Ví dụ sử dụng:
  # Sinh phiếu TN-50 cho 3 mã đề
  python3 generate_sheets.py --type tn-50 --school "THPT Lê Quý Đôn" --subtitle "Thi HK2 Toán 2025" --made "001,002,003"

  # Sinh phiếu Hybrid (THPTQG style) không đóng ZIP
  python3 generate_sheets.py --type hybrid --school "THPT ABC" --subtitle "Thi thử THPTQG" --made "001" --no-zip

Các loại phiếu:
  tn-40    Trắc nghiệm 40 câu  (kiểm tra 45', giữa kỳ)
  tn-50    Trắc nghiệm 50 câu  (cuối kỳ, thi thử)
  tn-60    Trắc nghiệm 60 câu  (THPTQG Văn/Anh/KHXH)
  ds-12    Điền Số 12 câu      (trả lời ngắn dạng số)
  hybrid   28 TN + 12 DS       (THPTQG Toán 2025)
"""
    )
    parser.add_argument("--type",    default="tn-50",   choices=TEMPLATE_MAP.keys(),
                        help="Loại phiếu (mặc định: tn-50)")
    parser.add_argument("--school",  default="TRƯỜNG THPT",
                        help="Tên trường")
    parser.add_argument("--subtitle",default="Kỳ thi",
                        help="Tên kỳ thi / ghi chú")
    parser.add_argument("--made",    default="001",
                        help="Mã đề (nhiều mã cách nhau bởi dấu phẩy, VD: 001,002,003)")
    parser.add_argument("--zip",     dest="zip", action="store_true",  default=True,
                        help="Đóng gói kết quả thành file ZIP (mặc định: bật)")
    parser.add_argument("--no-zip",  dest="zip", action="store_false",
                        help="Không đóng gói ZIP")
    
    args = parser.parse_args()
    
    print("=" * 55)
    print("      SANG MATH OMR – Sheet Generator v1.0")
    print("=" * 55)
    
    if not check_typst():
        sys.exit(1)
    
    generate_batch(args)


if __name__ == "__main__":
    main()
