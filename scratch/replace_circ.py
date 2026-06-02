import os

file_path = "typst/exams/CD-HamSinh-LoiBai-NangCao-content.typ"
with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# Replace circ with degree
updated_content = content.replace("circ", "degree")

with open(file_path, "w", encoding="utf-8") as f:
    f.write(updated_content)

print("Replacement of circ to degree done successfully!")
