import os
import re

exams_dir = "/Users/admin/conictypst/typst/exams"
files = [f for f in os.listdir(exams_dir) if f.endswith(".typ")]

for filename in sorted(files):
    filepath = os.path.join(exams_dir, filename)
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    
    # print filename
    print(f"=== {filename} ===")
    
    # Try to find #align(center)[...] or similar
    align_center = re.findall(r"#align\(center\)\[([\s\S]*?)\]", content[:3000])
    for ac in align_center:
        # Find text inside with size or bold
        text_matches = re.findall(r"text\([\s\S]*?size:\s*([\d\.]+)pt[\s\S]*?\)\[([\s\S]*?)\]", ac)
        for size, txt in text_matches:
            txt_clean = re.sub(r"\s+", " ", txt).strip()
            print(f"  [Center Text, size {size}]: {txt_clean}")
            
    # Try to find first 3 headings
    headings = re.findall(r"^=\s*([^\n]+)", content, re.MULTILINE)
    for h in headings[:3]:
        print(f"  [Heading]: {h.strip()}")
        
    print()
