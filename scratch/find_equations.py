import re

text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

pages = text.split('\f')

for page_num, page in enumerate(pages, 1):
    lines = page.splitlines()
    for line_num, l in enumerate(lines, 1):
        l_strip = l.strip()
        # Search for math symbols like ∑, ∏, ≡, =, +, ×, ⋅, −, ⁰, ¹, ², ³, ⁴, ⁵, ⁶, ⁷, ⁸, ⁹, ⁿ, ₊, ₋, ₌, ₍, ₎, ₀, ₁, ₂, ₃, ₄, ₅, ₆, ₇, ₈, ₉
        if re.search(r'[∑∏≡√→×⋅−⁰¹²³⁴⁵⁶⁷⁸⁹ⁿ₀₁₂₃₄₅₆₇₈₉⊆∪∩⊆⊂⊃⊇]', l_strip) or (len(l_strip) < 30 and ("=" in l_strip or "+" in l_strip) and re.search(r'[a-zA-Z0-9]', l_strip)):
            # Print page, line and content
            # Also print surrounding lines to see context
            print(f"Page {page_num}, Line {line_num}: {l_strip}")
            start_ctx = max(0, line_num - 2)
            end_ctx = min(len(lines), line_num + 3)
            for idx in range(start_ctx, end_ctx):
                print(f"  [{idx+1}]: {lines[idx]}")
            print("-" * 30)
