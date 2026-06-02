with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Replace prod_ with product_
content = content.replace("prod_", "product_")

with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "w", encoding="utf-8") as f:
    f.write(content)

print("Replaced prod_ with product_ successfully!")
