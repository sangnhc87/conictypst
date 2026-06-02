import re

file_path = "/Users/admin/conictypst/typst/sach/ham-so-chuong1/DaiBacDietRuoi-Tap1-HamSo.typ"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Replace example-box with explain-box
content = content.replace("#example-box", "#explain-box")

# 2. Replace all ** with *
# Let's replace '**' with '*'
content = content.replace("**", "*")

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Replacement complete.")
