text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

pages = text.split('\f')
print("--- Page 6 Text ---")
print(pages[5])
