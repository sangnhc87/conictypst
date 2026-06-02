import re

text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

# Let's search for sequences of 2 or more characters in the range of mathematical alphanumeric symbols (U+1D400 to U+1D7FF)
# or other mathematical symbols
pattern = r'[\u1d400-\u1d7ff\u2100-\u214f\u0370-\u03ff]+'

matches = re.findall(pattern, text)
unique_matches = sorted(list(set(matches)))

print("Consecutive mathematical character groups found:")
for m in unique_matches:
    if len(m) >= 2:
        print(f"  {m} (len={len(m)})")
