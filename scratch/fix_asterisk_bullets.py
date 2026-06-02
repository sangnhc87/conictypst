filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Replace asterisks used as bullets
content = content.replace("      * Nghiệm con", "      - Nghiệm con")
content = content.replace("      * Với", "      - Với")
content = content.replace("    * Nếu", "    - Nếu")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Asterisk bullets replaced with hyphens!")
