text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

pages = text.split('\f')

for p_num in [16, 17, 18]:
    print(f"=== Page {p_num} ===")
    print(pages[p_num - 1])
    print("-" * 50)
