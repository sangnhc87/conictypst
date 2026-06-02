import re

file_path = "/Users/admin/conictypst/typst/sach/ham-so-chuong1/DaiBacDietRuoi-Tap1-HamSo.typ"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# Replace \text{...} with "..."
cleaned = re.sub(r'\\text\{([^{}]+)\}', r'"\1"', content)

# Replace \vec{...} with arrow(...)
cleaned = re.sub(r'\\vec\{([^{}]+)\}', r'arrow(\1)', cleaned)

# Replace \Delta with Delta
cleaned = cleaned.replace("\\Delta", "Delta")

# Replace \\ with backslash in math blocks
cleaned = cleaned.replace("\\\\", " backslash ")

# Replace \ln with ln
cleaned = cleaned.replace("\\ln", "ln")

# Replace \pm with +-
cleaned = cleaned.replace("\\pm", "+-")

# Replace notin with in.not
cleaned = cleaned.replace("notin", "in.not")

# Replace \forall with forall
cleaned = cleaned.replace("\\forall", "forall")

# Replace other standard LaTeX commands
cleaned = cleaned.replace("\\implies", "=>")
cleaned = cleaned.replace("\\sin", "sin")
cleaned = cleaned.replace("\\cos", "cos")
cleaned = cleaned.replace("\\to", "->")
cleaned = cleaned.replace("\\infty", "oo")
cleaned = cleaned.replace("\\cdot", "dot.c")
cleaned = cleaned.replace("\\approx", "approx")

with open(file_path, "w", encoding="utf-8") as f:
    f.write(cleaned)

print("Cleanup complete.")
