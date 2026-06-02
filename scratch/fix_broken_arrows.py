filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Replace newline + "ightarrow" with "arrow.r"
# Also handle any potential carriage return + "ightarrow" just in case
content = content.replace("\nightarrow", "arrow.r")
content = content.replace("\rightarrow", "arrow.r")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Broken arrows fixed successfully!")
