import os
import sys
import shutil
import tempfile
import zipfile
import xml.etree.ElementTree as ET

# Add current directory to path
sys.path.append(os.getcwd())

from app import _typst_run_conversion
from tab_formatter import _choose_tab_layout

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
            
            ns = {'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'}
            paragraphs = root.findall('.//w:p', ns)
            
            p_texts = []
            for p in paragraphs:
                texts = p.findall('.//w:t', ns)
                txt = "".join([t.text for t in texts if t.text])
                p_texts.append(txt)
            
            idx = -1
            for i, txt in enumerate(p_texts):
                if "Câu hỏi trắc nghiệm 1?" in txt:
                    idx = i
                    break
            
            if idx != -1:
                start = max(0, idx - 2)
                end = min(len(p_texts), idx + 8)
                print(f"--- Paragraphs Around Question (Index {idx}) ---")
                for i in range(start, end):
                    marker = ">> " if i == idx else "   "
                    print(f"{marker}[{i:2}]: '{p_texts[i]}'")
                
                # Extract options starting from the first paragraph after the question that looks like an option
                options = []
                for i in range(idx + 1, len(p_texts)):
                    txt = p_texts[i].strip()
                    if txt.startswith(('A.', 'B.', 'C.', 'D.')):
                        options.append(p_texts[i])
                    if len(options) == 4:
                        break
                
                print("\n--- _choose_tab_layout Result ---")
                if len(options) == 4:
                    print(f"Options identified: {options}")
                    layout = _choose_tab_layout(options)
                    print(f"Layout chosen: {layout}")
                else:
                    print("Could not identify 4 options.")
            else:
                print("Could not find the question paragraph.")

if __name__ == "__main__":
    inspect()
