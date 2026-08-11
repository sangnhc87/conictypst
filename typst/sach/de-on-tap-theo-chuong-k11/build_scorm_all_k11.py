import os
import sys
import glob
import json
import zipfile
from pathlib import Path

# Thêm đường dẫn tới parse_typ và build_scorm của DECUONG12-HK1
SCORM_TOOL_DIR = Path('/Users/admin/conictypst/typst/sach/DECUONG12-HK1/scorm')
sys.path.insert(0, str(SCORM_TOOL_DIR))

from parse_typ import parse_file
import build_scorm

ROOT_DIR = Path('/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k11')
OUTPUT_DIR = ROOT_DIR / "scorm_output"
OUTPUT_DIR.mkdir(exist_ok=True)

# Ghi đè OUTPUT_DIR của build_scorm
build_scorm.OUTPUT_DIR = OUTPUT_DIR
# Bộ dựng dùng chung mặc định cho tài liệu lớp 12. Phải ghi đè nhãn môn
# trước khi sinh HTML để phần đầu/cuối của gói SCORM lớp 11 không ghi sai.
build_scorm.MON = "TOÁN 11"

# Tìm tất cả các file de*.typ trong các thư mục chuong*
typ_files = sorted(glob.glob(str(ROOT_DIR / "chuong*" / "de*.typ")))

print(f"🚀 Bắt đầu chuyển đổi SCORM cho {len(typ_files)} đề Toán 11...")
results = []

for filepath in typ_files:
    src_file = Path(filepath)
    chuong_dir = src_file.parent.name
    filename = src_file.name
    
    # VD: chuong1-luong-giac -> C01
    # Dùng regex để lấy số hoặc lấy tay
    try:
        chuong_num = int(chuong_dir.split('-')[0].replace('chuong', ''))
        chuong_prefix = f"C{chuong_num:02d}"
    except:
        chuong_prefix = chuong_dir
        
    de_id = filename.replace(".typ", "")
    zip_name = f"scorm-k11-{chuong_dir}-{de_id}.zip"
    zip_path = OUTPUT_DIR / zip_name
    
    title = f"Toán 11 - {chuong_dir.replace('-', ' ').title()} - {de_id.upper()}"
    
    print(f"📖 Đang xử lý {chuong_dir}/{filename} ({title})...")
    try:
        questions = parse_file(str(src_file))
        if not questions:
            print(f"   ⚠️ Không tìm thấy câu hỏi nào.")
            continue
            
        print(f"   --> Parse được {len(questions)} câu hỏi.")
        
        manifest = build_scorm.MANIFEST_TPL.format(identifier=f"TOAN11-{chuong_prefix}-{de_id.upper()}", title=title)
        html = build_scorm.build_quiz_html(title, questions)
        
        with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
            zf.writestr("imsmanifest.xml", manifest)
            zf.writestr("index.html", html)
            
        kb = zip_path.stat().st_size // 1024
        print(f"   ✅ Đã tạo gói SCORM: {zip_name} ({kb} KB)")
        results.append({"title": title, "zip": zip_name, "questions": len(questions)})
    except Exception as e:
        print(f"   ❌ Lỗi khi xử lý {filename}: {e}")

print(f"\n🎉 HOÀN THÀNH CHUYỂN ĐỔI SCORM TRỌN BỘ TOÁN 11! ({len(results)} package(s))")
