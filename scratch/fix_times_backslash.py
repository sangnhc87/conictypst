filepath = "/Users/admin/conictypst/typst/exams/CD-SoDoCay-XacSuat.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Replace \times with times
content = content.replace("\\times", " times ")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Backslash times fixed successfully!")
