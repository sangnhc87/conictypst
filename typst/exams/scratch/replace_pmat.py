with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Replace pmat with mat
content = content.replace("pmat(", "mat(")

with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "w", encoding="utf-8") as f:
    f.write(content)

print("Replaced pmat with mat successfully!")
