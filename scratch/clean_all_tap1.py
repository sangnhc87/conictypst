file_path = "/Users/admin/conictypst/typst/sach/ham-so-chuong1/DaiBacDietRuoi-Tap1-HamSo.typ"

with open(file_path, "r", encoding="utf-8") as f:
    c = f.read()

# Replace all ** with *
c = c.replace("**", "*")

# Replace remaining LaTeX commands
c = c.replace("\\implies", "=>")
c = c.replace("\\sin", "sin")
c = c.replace("\\cos", "cos")
c = c.replace("\\to", "->")
c = c.replace("\\infty", "oo")
c = c.replace("\\cdot", "dot.c")
c = c.replace("\\ne", "!=")
c = c.replace("\\quad \\text{và} \\quad", " quad \"và\" quad ")
c = c.replace("\\quad \\text{ và } \\quad", " quad \"và\" quad ")
c = c.replace("\\quad", " quad ")

# Replace LaTeX \text{...} inside math mode with Typst strings "..."
c = c.replace("\\text{hoặc}", " \"hoặc\" ")
c = c.replace("\\text{ (ngày)}", " \" (ngày)\" ")
c = c.replace("\\text{ (nghiệm đơn)}", " \" (nghiệm đơn)\" ")
c = c.replace("\\text{ (1)}", " \" (1)\" ")
c = c.replace("\\text{ (2)}", " \" (2)\" ")
c = c.replace("\\text{ (3)}", " \" (3)\" ")

with open(file_path, "w", encoding="utf-8") as f:
    f.write(c)

print("Cleanup complete.")


