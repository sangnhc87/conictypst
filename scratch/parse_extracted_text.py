import re

text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

# Let's find all lines that look like headings
# For example, lines in all caps, or starting with CHƯƠNG, or starting with bullet points
lines = text.splitlines()

for i, l in enumerate(lines, 1):
    l = l.strip()
    if not l:
        continue
    # If the line contains CHƯƠNG or is in ALL CAPS and length is between 10 and 100
    if "CHƯƠNG" in l or (l.isupper() and 10 < len(l) < 80 and not l.startswith("—") and not "." in l):
        print(f"Line {i}: {l}")
