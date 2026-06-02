import re

text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

pages = text.split('\f')
print(f"Total pages split: {len(pages)}")

for i, page in enumerate(pages, 1):
    lines = page.splitlines()
    # Strip headers/footers
    cleaned_lines = []
    for l in lines:
        l_strip = l.strip()
        if not l_strip:
            continue
        # Check if line is header or footer
        if "Lịch Sử Đại Số Tổ Hợp" in l_strip:
            continue
        if "Nguyễn Văn Sang" in l_strip:
            continue
        if re.match(r'^—\s*\d+\s*—$', l_strip): # footer page number
            continue
        cleaned_lines.append(l_strip)
        
    page_text = "\n".join(cleaned_lines[:4])
    print(f"Page {i}: {page_text[:150]}...")
    print("-" * 40)
