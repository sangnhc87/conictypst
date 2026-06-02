import re

filepath = "/Users/admin/conictypst/typst/sach/hinh-hoc-phang-chuong5/hinh-hoc-phang-khai-mo.pdf"

with open(filepath, "rb") as f:
    data = f.read()

# In PDF, pages are represented as Catalog -> Pages -> Count or /Type /Page
pages = re.findall(b"/Type\s*/Page\\b", data)
pages_count = len(pages)

# Try to find /Count keys
counts = re.findall(b"/Count\s*(\d+)", data)
max_count = 0
if counts:
    max_count = max(int(c) for c in counts)

print(f"Number of /Type /Page occurrences: {pages_count}")
print(f"Max /Count value found: {max_count}")
