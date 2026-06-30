# -*- coding: utf-8 -*-
import os
import sys
import json
import zipfile
from pathlib import Path

# Thêm đường dẫn tới parse_typ và build_scorm của DECUONG12-HK1
SCORM_TOOL_DIR = Path('/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm')
sys.path.insert(0, str(SCORM_TOOL_DIR))

from parse_typ import parse_file
import build_scorm

CUR_DIR = Path('/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k11/chuong7-dao-ham')
OUTPUT_DIR = CUR_DIR / "scorm_output"
OUTPUT_DIR.mkdir(exist_ok=True)

# Ghi đè OUTPUT_DIR của build_scorm
build_scorm.OUTPUT_DIR = OUTPUT_DIR

DE_LIST = [
    ("de01.typ", "Chương Đạo Hàm — Đề 01"),
    ("de02.typ", "Chương Đạo Hàm — Đề 02 (Mô hình Vật Lý)"),
    ("de03.typ", "Chương Đạo Hàm — Đề 03 (Mô hình Kỹ Thuật & Kinh Tế)"),
    ("de04.typ", "Chương Đạo Hàm — Đề 04 (Mô hình Y Học & Dược Động)"),
    ("de05.typ", "Chương Đạo Hàm — Đề 05 (Mô hình Hàng Không & Năng Lượng)"),
    ("de06.typ", "Chương Đạo Hàm — Đề 06 (Mô hình Thủy Lợi & Điện Tử)"),
    ("de07.typ", "Chương Đạo Hàm — Đề 07 (Mô hình Hóa Học & Robot Học)"),
]

print(f"🚀 Bắt đầu chuyển đổi SCORM cho {len(DE_LIST)} đề Toán 11...")
results = []

for filename, title in DE_LIST:
    src_file = CUR_DIR / filename
    if not src_file.exists():
        print(f"❌ Không thấy tệp {filename}")
        continue
    
    print(f"📖 Đang xử lý {filename} ({title})...")
    try:
        questions = parse_file(str(src_file))
        print(f"   --> Parse được {len(questions)} câu hỏi.")
        
        de_id = filename.replace(".typ", "")
        zip_name = f"scorm-k11-daoham-{de_id}.zip"
        zip_path = OUTPUT_DIR / zip_name
        
        manifest = build_scorm.MANIFEST_TPL.format(identifier=f"TOAN11-DAOHAM-{de_id.upper()}", title=title)
        html = build_scorm.build_quiz_html(title, questions)
        
        with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
            zf.writestr("imsmanifest.xml", manifest)
            zf.writestr("index.html", html)
            
        kb = zip_path.stat().st_size // 1024
        print(f"   ✅ Đã tạo gói SCORM: {zip_name} ({kb} KB)")
        results.append({"title": title, "zip": zip_name, "questions": len(questions)})
    except Exception as e:
        print(f"   ❌ Lỗi khi xử lý {filename}: {e}")

print("\n🎉 HOÀN THÀNH CHUYỂN ĐỔI SCORM TRỌN BỘ!")
