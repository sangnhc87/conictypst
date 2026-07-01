import os
import re

files_to_fix = [
    "typst/beamer/beamer-12-bai-3-duong-tiem-can.typ",
    "typst/beamer/beamer-12-bai-4-khao-sat-ve-dothi.typ",
    "typst/beamer/beamer-12-bai-5-ung-dung-thuc-tien.typ",
    "typst/beamer/beamer-12-bai-6-tiep-tuyen-tuong-giao.typ",
]

for file in files_to_fix:
    if not os.path.exists(file):
        continue
    
    with open(file, "r", encoding="utf-8") as f:
        content = f.read()
    
    # We will replace `= Title` with `#lt-section-link("sec-xyz", "🎯", [Title])`
    # and `#slide(title: "xyz")[` with `#lt-slide-back(title: "xyz")[ `
    # For TOC, we need to map the heading names to logical sections.
    # To do this safely, we find all lines starting with `= ` and `#slide(title: `
    
    def repl_heading(match):
        title = match.group(1).strip()
        icon = "🎯"
        if "Luyện Tập" in title:
            icon = "❓"
        elif "Lịch Sử" in title or "Động Lực" in title:
            icon = "🏛️"
        elif "Lý Thuyết" in title or "Khái Niệm" in title or "Phương" in title:
            icon = "📖"
        else:
            icon = "💡"
            
        import uuid
        sec_id = "sec-" + uuid.uuid4().hex[:6]
        return f'#lt-section-link("{sec_id}", "{icon}", [{title}])'

    content = re.sub(r'^=\s+(.+)$', repl_heading, content, flags=re.MULTILINE)
    content = re.sub(r'#slide\(title:\s*(.+?)\)\[', r'#lt-slide-back(title: \1)[', content)
    
    with open(file, "w", encoding="utf-8") as f:
        f.write(content)
        
print("Updated headings and slide macros in all files.")
