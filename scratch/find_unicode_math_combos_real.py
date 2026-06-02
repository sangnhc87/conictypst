import re

text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

# Correct 32-bit Unicode regex escape
pattern = re.compile(r'[\U0001d400-\U0001d7ff]+')

matches = pattern.findall(text)
unique_matches = sorted(list(set(matches)))

print("Mathematical character groups found:")
for m in unique_matches:
    print(f"  {m} (len={len(m)})")
