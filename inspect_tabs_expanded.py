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
        # Use a raw Typst content that forces separate paragraphs even in Typst -> Pandoc -> Word
        content = """#set par(spacing: 1em)
Câu 1. Câu hỏi 1?

A. Đáp án A

B. Đáp án B

C. Đáp án C

D. Đáp án D
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
                parts = []
                for child in p.findall('.//w:r/*', ns):
                    if child.tag == '{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t':
                        parts.append(child.text if child.text else "")
                    elif child.tag == '{http://schemas.openxmlformats.org/wordprocessingml/2006/main}tab':
                        parts.append("\t")
                txt = "".join(parts)
                p_texts.append(txt)
            
            q_idx = -1
            for i, txt in enumerate(p_texts):
                if "Câu 1." in txt:
                    q_idx = i
                    break
            
            if q_idx != -1:
                print(f"--- Paragraphs around Question (Index {q_idx}) ---")
                start = max(0, q_idx)
                end = min(len(p_texts), q_idx + 12)
                for i in range(start, end):
                    print(f"[{i:2}]: '{p_texts[i]}'")
                
                # Identify options in the list of paragraphs
                # We need precisely four strings starting with A., B., C., D.
                options = []
                for i in range(q_idx + 1, len(p_texts)):
                    txt = p_texts[i].strip()
                    if txt.startswith(('A.', 'B.', 'C.', 'D.')):
                        options.append(p_texts[i])
                    if len(options) == 4:
                        break
                
                if len(options) == 4:
                    print(f"\nOptions identified for layout: {options}")
                    layout = _choose_tab_layout(options)
                    print(f"Layout chosen: {layout}")
                else:
                    print(f"\nCould not identify 4 options in separate paragraphs. Found {len(options)}.")

if __name__ == "__main__":
    inspect()
