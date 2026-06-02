filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace("M_(T1)", 'M_("T1")')
content = content.replace("M_(T2)", 'M_("T2")')
content = content.replace("M_(T3)", 'M_("T3")')

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Subscripts fixed successfully!")
