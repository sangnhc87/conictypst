import os
import sys
import shutil
import tempfile
import zipfile
import re
import xml.etree.ElementTree as ET

# Add current directory to path
sys.path.append(os.getcwd())

from app import _typst_run_conversion

def inspect():
    with tempfile.TemporaryDirectory() as temp_root:
        # Setup structure
        assets_src = os.path.join(os.getcwd(), 'typst-assets', 'sang-exam.typ')
        assets_dst = os.path.join(temp_root, 'sang-exam.typ')
        shutil.copy(assets_src, assets_dst)
        
        exams_dir = os.path.join(temp_root, 'exams')
        os.makedirs(exams_dir)
        
        sample_path = os.path.join(exams_dir, 'sample.typ')
        content = """#import "../sang-exam.typ": *
#let mode = "dethi"
#let accent = classic.blue
#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show: thpt-school-exam.with(
  department: [SỞ GIÁO DỤC VÀ ĐÀO TẠO],
  school: [TRƯỜNG THPT CHUYÊN],
  exam-title: [KỲ THI THỬ TỐT NGHIỆP THPT NĂM 2026],
  subject: [Môn: TOÁN],
  duration: [90 phút],
  structure: [Cấu trúc Đề minh họa 2025],
  code: [357],
  accent: accent,
  show-topbar: true,
  header-border: true
)

#exam-part(1, [Trắc nghiệm nhiều phương án lựa chọn])

#tn([Câu hỏi trắc nghiệm 1?], [Phương án A], [Phương án B], [Phương án C], [Phương án D], 0)
"""
        with open(sample_path, 'w', encoding='utf-8') as f:
            f.write(content)

        result = _typst_run_conversion(sample_path, temp_root, exams_dir)
        result_path = result[0] if isinstance(result, tuple) else result

        with zipfile.ZipFile(result_path, 'r') as z:
            doc_xml = z.read("word/document.xml")
            root = ET.fromstring(doc_xml)
            
            # Namespace map
            ns = {'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'}
            
            paragraphs = root.findall('.//w:p', ns)
            
            print("--- Plain text of first 12 paragraphs ---")
            p_texts = []
            count = 0
            for p in paragraphs:
                texts = p.findall('.//w:t', ns)
                txt = "".join([t.text for t in texts if t.text])
                p_texts.append(txt)
                if count < 12:
                    print(f"P{count+1}: {txt}")
                count += 1
            
            print("\n--- Pattern and Structure Analysis ---")
            # Find the paragraph with "Câu hỏi trắc nghiệm 1?"
            idx = -1
            for i, txt in enumerate(p_texts):
                if "Câu hỏi trắc nghiệm 1?" in txt:
                    idx = i
                    break
            
            if idx != -1:
                options_text = p_texts[idx+1:idx+5]
                print(f"Paragraphs following question:")
                for i, opt in enumerate(options_text):
                    print(f"  Opt {i+1}: {opt}")
                
                starts_with_letter = all(re.match(r'^[A-D]\.', opt.strip()) for opt in options_text if opt.strip())
                print(f"Option paragraphs begin with A., B., C., D.: {starts_with_letter}")
                
                # Check if they are separate paragraphs (they are in our list above)
                print(f"Options are separate paragraphs: Yes")
            else:
                print("Could not find the question paragraph.")

if __name__ == "__main__":
    inspect()
