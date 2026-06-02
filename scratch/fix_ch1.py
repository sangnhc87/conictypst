file_path = "/Users/admin/conictypst/typst/sach/ham-so-chuong1/c1-DaiBacDietRuoi-Ch1.typ"

with open(file_path, "r", encoding="utf-8") as f:
    c = f.read()

# Replace ** with *
c = c.replace("**", "*")

# Replace text(Sai số) with "Sai số"
c = c.replace("text(Sai số)", '"Sai số"')

with open(file_path, "w", encoding="utf-8") as f:
    f.write(c)

print("Fix complete.")
