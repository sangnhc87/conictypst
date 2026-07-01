#!/usr/bin/env python3
import os
import re
import subprocess
import glob

def extract_typst_from_pandoc(docx_path):
    result = subprocess.run(['pandoc', docx_path, '-t', 'typst'], capture_output=True, text=True)
    return result.stdout

def convert_to_typst(md_content, title):
    typ_code = f"""// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 11
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "{title}",
  thoi-gian: "4 tiết",
)

"""
    lines = md_content.split('\n')
    out_lines = []
    
    in_block = None  # None, 'mt-hd', 'nd-hd', 'sp-hd', 'tc-hd'
    
    def close_block():
        if in_block:
            out_lines.append("]")
            
    started = False
    
    for line in lines:
        if '== I.' in line:
            started = True
            out_lines.append('#phan("I", "MỤC TIÊU")')
            continue
            
        if not started:
            continue
            
        # Match Phan
        if '== II.' in line:
            close_block()
            in_block = None
            out_lines.append('#phan("II", "THIẾT BỊ DẠY HỌC VÀ HỌC LIỆU")')
            continue
        if '== III.' in line:
            close_block()
            in_block = None
            out_lines.append('#phan("III", "TIẾN TRÌNH DẠY HỌC")')
            continue
            
        # Match Muc
        if '=== 1.' in line and 'kiến thức' in line.lower():
            out_lines.append('#muc("1", "KIẾN THỨC")')
            continue
        if '=== 2.' in line and 'năng lực' in line.lower():
            out_lines.append('#muc("2", "NĂNG LỰC")')
            continue
        if '=== 3.' in line and 'phẩm chất' in line.lower():
            out_lines.append('#muc("3", "PHẨM CHẤT")')
            continue
            
        # Match Hoạt động
        m_hd = re.search(r'^===\s*(\d+)\.\s*Hoạt động\s*\d*:\s*(.*)', line, re.IGNORECASE)
        if m_hd:
            close_block()
            in_block = None
            hd_so = m_hd.group(1)
            hd_rest = m_hd.group(2)
            m_time = re.search(r'(.*?)\(([^)]+)\)\s*$', hd_rest)
            if m_time:
                hd_ten = m_time.group(1).strip()
                hd_phut = m_time.group(2).strip()
            else:
                hd_ten = hd_rest.strip()
                hd_phut = ""
            out_lines.append(f'#hd("{hd_so}", "{hd_ten}", "{hd_phut}")')
            continue
            
        m_hdtp = re.search(r'^====\s*Hoạt động\s*([0-9.]+):\s*(.*)', line, re.IGNORECASE)
        if m_hdtp:
            close_block()
            in_block = None
            hdtp_so = m_hdtp.group(1)
            hdtp_rest = m_hdtp.group(2)
            m_time = re.search(r'(.*?)\(([^)]+)\)\s*$', hdtp_rest)
            if m_time:
                hdtp_ten = m_time.group(1).strip()
                hdtp_phut = m_time.group(2).strip()
            else:
                hdtp_ten = hdtp_rest.strip()
                hdtp_phut = ""
            out_lines.append(f'#hd-tp("{hdtp_so}", "{hdtp_ten}", "{hdtp_phut}")')
            continue
            
        # Match sub-blocks
        m_mt = re.search(r'^(?:====|-).*?a\)\s*Mục tiêu[^\w]*(.*)', line, re.IGNORECASE)
        if m_mt:
            close_block()
            in_block = 'mt-hd'
            out_lines.append('#mt-hd[')
            if m_mt.group(1).strip():
                out_lines.append(m_mt.group(1).strip())
            continue
            
        m_nd = re.search(r'^(?:====|-).*?b\)\s*Nội dung[^\w]*(.*)', line, re.IGNORECASE)
        if m_nd:
            close_block()
            in_block = 'nd-hd'
            out_lines.append('#nd-hd[')
            if m_nd.group(1).strip():
                out_lines.append(m_nd.group(1).strip())
            continue
            
        m_sp = re.search(r'^(?:====|-).*?c\)\s*Sản phẩm[^\w]*(.*)', line, re.IGNORECASE)
        if m_sp:
            close_block()
            in_block = 'sp-hd'
            out_lines.append('#sp-hd[')
            if m_sp.group(1).strip():
                out_lines.append(m_sp.group(1).strip())
            continue
            
        m_tc = re.search(r'^(?:====|-).*?d\)\s*Tổ chức thực hiện[^\w]*(.*)', line, re.IGNORECASE)
        if m_tc:
            close_block()
            in_block = 'tc-hd'
            out_lines.append('#tc-hd[')
            if m_tc.group(1).strip():
                out_lines.append(m_tc.group(1).strip())
            continue
            
        # Clean up pandoc tags
        if line.strip().startswith('<') and line.strip().endswith('>'):
            continue
            
        out_lines.append(line)
        
    close_block()
    
    return typ_code + '\n'.join(out_lines) + "\n"

def main():
    input_dir = "/Users/admin/Downloads/KHBD TOÁN 12 KẾT HỢP NLS MỚI NHẤT 2026"
    output_dir = "/Users/admin/conictypst/typst/giao-an/khoi-12"
    
    os.makedirs(output_dir, exist_ok=True)
    
    for filename in os.listdir(input_dir):
        if not filename.endswith(".docx"):
            continue
            
        docx_path = os.path.join(input_dir, filename)
        print(f"Processing {filename}...")
        
        md_text = extract_typst_from_pandoc(docx_path)
        typ_text = convert_to_typst(md_text, filename.replace('.docx', ''))
        
        # Format filename
        basename = os.path.basename(docx_path)
        slug = os.path.splitext(basename)[0].lower().replace(" ", "-").replace("bài", "bai")
        import unicodedata
        clean_name = unicodedata.normalize('NFKD', slug).encode('ASCII', 'ignore').decode('utf-8')
        
        out_path = os.path.join(output_dir, f"giao-an-12-{clean_name}.typ")
        with open(out_path, 'w') as f:
            f.write(typ_text)
        print(f"Saved to {out_path}")

if __name__ == "__main__":
    main()
