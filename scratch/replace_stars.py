import os

file_path = "/Users/admin/conictypst/scratch/restructure_xep_ghe.py"
with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# Replace ** with *
updated_content = content.replace("**", "*")

with open(file_path, "w", encoding="utf-8") as f:
    f.write(updated_content)

print("Replacement of ** to * done successfully!")
