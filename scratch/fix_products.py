file_path = "/Users/admin/conictypst/typst/exams/CD-PhanPhoi-4TruongHop.typ"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# Fix the productuct typo
content = content.replace('productuct', 'product')

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Product typo fix completed successfully.")
