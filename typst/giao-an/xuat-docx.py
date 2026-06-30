#!/usr/bin/env python3
"""
xuat-docx.py — Xuất giáo án Typst sang DOCX (có phương trình Toán & màu sắc đẹp)
Trường THPT Nguyễn Hữu Cảnh · Tổ Toán

Cách dùng:
  python3 xuat-docx.py vi-du-to10-vecto.typ
  python3 xuat-docx.py giao-an-mau.typ -o giao-an-tuan01.docx
  python3 xuat-docx.py giao-an-mau.typ --open   # mở file sau khi xuất
"""

import argparse
import os
import shutil
import subprocess
import sys
import tempfile
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

# ── CẤU HÌNH ──────────────────────────────────────────────────────────────────
TYPST_ROOT_OFFSET = 1   # số cấp cha từ file .typ đến thư mục root Typst

# Cấu hình Namespace OpenXML
W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
ET.register_namespace('w', W_NS)
NS = {"w": W_NS}


# ── XỬ LÝ XML WORD STYLES ─────────────────────────────────────────────────────
def modify_styles_xml(xml_content):
    """
    Chỉnh sửa XML styles để đồng bộ font chữ Times New Roman và các màu sắc
    chủ đạo Slate Blue (#0F4C81) và Crimson (#8B1E3F) cho file Word.
    """
    root = ET.fromstring(xml_content)
    
    # Cấu hình màu sắc, kích thước và định dạng cho từng cấp tiêu đề
    # Heading 1: Cỡ 14pt (28), Màu Navy, Bold
    # Heading 2: Cỡ 12pt (24), Màu Crimson, Bold + Italic
    # Heading 3: Cỡ 12pt (24), Màu Navy, Bold
    # Heading 4: Cỡ 12pt (24), Màu Crimson, Bold
    # Normal: Cỡ 12pt (24), font Times New Roman
    style_configs = {
        "Heading1": {"color": "0F4C81", "sz": "28", "b": True, "i": False},
        "Heading2": {"color": "8B1E3F", "sz": "24", "b": True, "i": True},
        "Heading3": {"color": "0F4C81", "sz": "24", "b": True, "i": False},
        "Heading4": {"color": "8B1E3F", "sz": "24", "b": True, "i": False},
        "Normal": {"sz": "24"}
    }
    
    # Cập nhật tất cả các Styles trong Word sang font Times New Roman
    for style in root.findall(".//w:style", NS):
        style_id = style.attrib.get(f"{{{W_NS}}}styleId")
        
        rPr = style.find("w:rPr", NS)
        if rPr is None:
            rPr = ET.SubElement(style, f"{{{W_NS}}}rPr")
            
        rFonts = rPr.find("w:rFonts", NS)
        if rFonts is None:
            rFonts = ET.SubElement(rPr, f"{{{W_NS}}}rFonts")
        rFonts.set(f"{{{W_NS}}}ascii", "Times New Roman")
        rFonts.set(f"{{{W_NS}}}hAnsi", "Times New Roman")
        rFonts.set(f"{{{W_NS}}}eastAsia", "Times New Roman")
        rFonts.set(f"{{{W_NS}}}cs", "Times New Roman")
        
        # Áp dụng cấu hình riêng cho từng Style
        if style_id in style_configs:
            cfg = style_configs[style_id]
            
            # Kích thước chữ
            if "sz" in cfg:
                sz = rPr.find("w:sz", NS)
                if sz is None: sz = ET.SubElement(rPr, f"{{{W_NS}}}sz")
                sz.set(f"{{{W_NS}}}val", cfg["sz"])
                
                szCs = rPr.find("w:szCs", NS)
                if szCs is None: szCs = ET.SubElement(rPr, f"{{{W_NS}}}szCs")
                szCs.set(f"{{{W_NS}}}val", cfg["sz"])
                
            # Màu sắc tiêu đề
            if "color" in cfg:
                color = rPr.find("w:color", NS)
                if color is None: color = ET.SubElement(rPr, f"{{{W_NS}}}color")
                color.set(f"{{{W_NS}}}val", cfg["color"])
                # Xóa các thuộc tính theme của Word để bắt buộc dùng mã màu hex cố định
                for attr in [f"{{{W_NS}}}themeColor", f"{{{W_NS}}}themeShade", f"{{{W_NS}}}themeTint"]:
                    if attr in color.attrib:
                        del color.attrib[attr]
                        
            # Chữ đậm (Bold)
            if cfg.get("b"):
                b = rPr.find("w:b", NS)
                if b is None: ET.SubElement(rPr, f"{{{W_NS}}}b")
                bCs = rPr.find("w:bCs", NS)
                if bCs is None: ET.SubElement(rPr, f"{{{W_NS}}}bCs")
            elif "b" in cfg:
                b = rPr.find("w:b", NS)
                if b is not None: rPr.remove(b)
                bCs = rPr.find("w:bCs", NS)
                if bCs is not None: rPr.remove(bCs)
                
            # Chữ nghiêng (Italic)
            if cfg.get("i"):
                i = rPr.find("w:i", NS)
                if i is None: ET.SubElement(rPr, f"{{{W_NS}}}i")
                iCs = rPr.find("w:iCs", NS)
                if iCs is None: ET.SubElement(rPr, f"{{{W_NS}}}iCs")
            elif "i" in cfg:
                i = rPr.find("w:i", NS)
                if i is not None: rPr.remove(i)
                iCs = rPr.find("w:iCs", NS)
                if iCs is not None: rPr.remove(iCs)
                
    # Ghi đè cấu hình font mặc định toàn văn bản (docDefaults)
    docDefaults = root.find("w:docDefaults", NS)
    if docDefaults is not None:
        rPrDefault = docDefaults.find("w:rPrDefault", NS)
        if rPrDefault is not None:
            rPr = rPrDefault.find("w:rPr", NS)
            if rPr is not None:
                rFonts = rPr.find("w:rFonts", NS)
                if rFonts is None: rFonts = ET.SubElement(rPr, f"{{{W_NS}}}rFonts")
                rFonts.set(f"{{{W_NS}}}ascii", "Times New Roman")
                rFonts.set(f"{{{W_NS}}}hAnsi", "Times New Roman")
                rFonts.set(f"{{{W_NS}}}eastAsia", "Times New Roman")
                rFonts.set(f"{{{W_NS}}}cs", "Times New Roman")
                
                sz = rPr.find("w:sz", NS)
                if sz is None: sz = ET.SubElement(rPr, f"{{{W_NS}}}sz")
                sz.set(f"{{{W_NS}}}val", "24")
                
                szCs = rPr.find("w:szCs", NS)
                if szCs is None: szCs = ET.SubElement(rPr, f"{{{W_NS}}}szCs")
                szCs.set(f"{{{W_NS}}}val", "24")
                
    return ET.tostring(root, encoding='utf-8')


def build_styled_template(output_path: Path):
    """
    Xuất file reference.docx mặc định từ Pandoc, sửa styles và đóng gói lại.
    """
    # Lấy template mặc định từ pandoc
    r = subprocess.run(["pandoc", "--print-default-data-file", "reference.docx"], capture_output=True)
    if r.returncode != 0:
        print("  ✗ Không xuất được template mặc định từ Pandoc.")
        return False
        
    temp_in = tempfile.mktemp(suffix=".docx")
    with open(temp_in, "wb") as f:
        f.write(r.stdout)
        
    try:
        with zipfile.ZipFile(temp_in, "r") as z_in:
            with zipfile.ZipFile(output_path, "w") as z_out:
                for item in z_in.infolist():
                    data = z_in.read(item.filename)
                    if item.filename == "word/styles.xml":
                        data = modify_styles_xml(data)
                    z_out.writestr(item, data)
        os.remove(temp_in)
        return True
    except Exception as e:
        print(f"  ✗ Lỗi tạo reference template: {e}")
        if os.path.exists(temp_in):
            os.remove(temp_in)
        return False


# ── KIỂM TRA CÔNG CỤ ──────────────────────────────────────────────────────────
def which(tool):
    return shutil.which(tool) is not None


def pandoc_version():
    try:
        r = subprocess.run(["pandoc", "--version"], capture_output=True, text=True, timeout=5)
        line = r.stdout.strip().splitlines()[0]
        parts = line.split()[-1].split(".")
        return tuple(int(p) for p in parts[:3])
    except Exception:
        return (0, 0, 0)


# ── PHƯƠNG PHÁP A: PANDOC ─────────────────────────────────────────────────────
def method_pandoc(input_typ: Path, output_docx: Path, reference_docx=None) -> bool:
    cmd = [
        "pandoc", str(input_typ),
        "--from", "typst",
        "--to", "docx",
        "--output", str(output_docx),
    ]
    if reference_docx and Path(reference_docx).exists():
        cmd += ["--reference-doc", str(reference_docx)]
        print(f"  🎨 Sử dụng style mẫu: {Path(reference_docx).name}")

    print(f"  ▸ Lệnh: {' '.join(cmd)}")
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        print(f"  ✗ Pandoc lỗi:\n{r.stderr}")
        return False
    return True


# ── PHƯƠNG PHÁP B: TYPST → PDF → LIBREOFFICE → DOCX ─────────────────────────
def method_libreoffice(input_typ: Path, output_docx: Path, typst_root: Path) -> bool:
    pdf_path = input_typ.with_suffix(".pdf")

    print("  ⏳ Bước 1/2: Biên dịch Typst → PDF...")
    typst_cmd = ["typst", "compile", str(input_typ), str(pdf_path)]
    if typst_root.exists():
        typst_cmd += ["--root", str(typst_root)]

    r = subprocess.run(typst_cmd, capture_output=True, text=True)
    if r.returncode != 0:
        print(f"  ✗ Typst compile lỗi:\n{r.stderr}")
        return False
    print(f"  ✓ PDF: {pdf_path.name}")

    print("  ⏳ Bước 2/2: Chuyển PDF → DOCX (LibreOffice)...")
    lo_cmd = None
    for lo in ["libreoffice", "soffice"]:
        if which(lo):
            lo_cmd = [lo, "--headless", "--convert-to", "docx", str(pdf_path),
                      "--outdir", str(output_docx.parent)]
            break

    if lo_cmd is None:
        print("  ✗ Không tìm thấy LibreOffice")
        return False

    r = subprocess.run(lo_cmd, capture_output=True, text=True, timeout=60)
    converted = output_docx.parent / (pdf_path.stem + ".docx")
    if converted.exists():
        converted.rename(output_docx)
        return True

    print(f"  ✗ LibreOffice không tạo được file DOCX\n{r.stderr}")
    return False


# ── MAIN ──────────────────────────────────────────────────────────────────────
def main():
    parser = argparse.ArgumentParser(
        description="Xuất giáo án Typst sang DOCX — THPT Nguyễn Hữu Cảnh · Tổ Toán",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Ví dụ:
  python3 xuat-docx.py vi-du-to10-vecto.typ
  python3 xuat-docx.py giao-an-mau.typ -o giao-an-bai09.docx
  python3 xuat-docx.py giao-an-mau.typ --open
        """
    )
    parser.add_argument("input", help="File .typ đầu vào")
    parser.add_argument("-o", "--output", help="File .docx đầu ra (mặc định: cùng tên)")
    parser.add_argument("--reference", help="File .docx mẫu style (pandoc reference-doc)")
    parser.add_argument("--open", action="store_true", help="Mở file DOCX sau khi xuất thành công")
    parser.add_argument("--method", choices=["auto", "pandoc", "libreoffice"],
                        default="auto", help="Chọn phương pháp chuyển đổi (mặc định: auto)")
    args = parser.parse_args()

    # Đường dẫn file
    input_path = Path(args.input).resolve()
    if not input_path.exists():
        print(f"✗ Không tìm thấy file: {input_path}")
        sys.exit(1)
    if input_path.suffix.lower() != ".typ":
        print(f"✗ File phải có đuôi .typ, nhận được: {input_path.suffix}")
        sys.exit(1)

    output_path = Path(args.output).resolve() if args.output else input_path.with_suffix(".docx")

    # Tính toán Typst root
    typst_root = input_path.parent
    for _ in range(TYPST_ROOT_OFFSET):
        typst_root = typst_root.parent

    # Xử lý tự động Reference Template đẹp mắt
    script_dir = Path(__file__).parent.resolve()
    default_ref_path = script_dir / "reference.docx"
    
    ref_to_use = args.reference
    if not ref_to_use:
        # Nếu chưa có template tự tạo thì tiến hành dựng tự động
        if not default_ref_path.exists():
            print("  ⏳ Đang khởi tạo Word style template màu sắc đẹp...")
            if build_styled_template(default_ref_path):
                ref_to_use = str(default_ref_path)
        else:
            ref_to_use = str(default_ref_path)

    # Hiển thị thông tin
    print("━" * 60)
    print(f"  📄 Input  : {input_path.name}")
    print(f"  📝 Output : {output_path}")
    print(f"  📁 Root   : {typst_root}")
    print("━" * 60)

    success = False

    # ── Lựa chọn phương pháp ──────────────────────────────────────
    if args.method in ("auto", "pandoc"):
        if which("pandoc"):
            ver = pandoc_version()
            ver_str = ".".join(str(v) for v in ver)
            if ver >= (3, 2, 0):
                print(f"  🔧 Phương pháp: pandoc {ver_str} (hỗ trợ Typst reader)")
                success = method_pandoc(input_path, output_path, ref_to_use)
            else:
                print(f"  ⚠  pandoc {ver_str} < 3.2 — không hỗ trợ đọc Typst trực tiếp")
                if args.method == "pandoc":
                    print("     Nâng cấp pandoc: brew upgrade pandoc")
                    sys.exit(1)
        else:
            if args.method == "pandoc":
                print("  ✗ pandoc chưa được cài. Cài bằng: brew install pandoc")
                sys.exit(1)

    if not success and args.method in ("auto", "libreoffice"):
        if which("libreoffice") or which("soffice"):
            print(f"  🔧 Phương pháp: LibreOffice (Typst → PDF → DOCX)")
            success = method_libreoffice(input_path, output_path, typst_root)
        else:
            if args.method == "libreoffice":
                print("  ✗ LibreOffice chưa được cài. Cài bằng: brew install --cask libreoffice")
                sys.exit(1)

    # ── Kết quả ───────────────────────────────────────────────────
    if success and output_path.exists():
        size_kb = output_path.stat().st_size // 1024
        print("━" * 60)
        print(f"  ✅ Xuất thành công: {output_path.name}  ({size_kb} KB)")
        print("━" * 60)
        if args.open:
            subprocess.Popen(["open", str(output_path)])
    else:
        print("━" * 60)
        print("  ❌ Xuất thất bại!")
        print()
        sys.exit(1)


if __name__ == "__main__":
    main()
