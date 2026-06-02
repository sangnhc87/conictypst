file_path = "/Users/admin/conictypst/typst/sach/ham-so-chuong1/DaiBacDietRuoi-Tap1-HamSo.typ"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# Replace basic LaTeX commands in math blocks
replacements = {
    "\\implies": "=>",
    "\\sin": "sin",
    "\\cos": "cos",
    "\\to": "->",
    "\\cdot": "dot.c",
    "\\cup": "union",
    "\\begin{cases} 2x > 0 \\\\ f'(x^2 - 2) > 0 \\end{cases}": "cases(2x > 0, f'(x^2 - 2) > 0)",
    "\\begin{cases} x > 0 \\\\ \\left[ \\begin{aligned} x^2 - 2 < -1 \\\\ x^2 - 2 > 4 \\end{aligned} \\right. \\end{cases}": "cases(x > 0, cases(delim: \"[\", x^2 - 2 < -1, x^2 - 2 > 4))",
    "\\begin{cases} x > 0 \\\\ \\left[ \\begin{aligned} x^2 < 1 \\\\ x^2 > 6 \\end{aligned} \\right. \\end{cases}": "cases(x > 0, cases(delim: \"[\", x^2 < 1, x^2 > 6))",
    "\\begin{cases} 2x < 0 \\\\ f'(x^2 - 2) < 0 \\end{cases}": "cases(2x < 0, f'(x^2 - 2) < 0)",
    "\\begin{cases} x < 0 \\\\ -1 < x^2 - 2 < 4 \\end{cases}": "cases(x < 0, -1 < x^2 - 2 < 4)",
    "\\begin{cases} x < 0 \\\\ 1 < x^2 < 6 \\end{cases}": "cases(x < 0, 1 < x^2 < 6)"
}

for latex, typst in replacements.items():
    content = content.replace(latex, typst)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Math replacements complete.")
