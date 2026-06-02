import re

file_path = "/Users/admin/conictypst/typst/exams/CD-PhanPhoi-4TruongHop.typ"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Clean up double stars bold syntax (change ** to *)
# We can do this safely by replacing all '**' with '*'
content = content.replace("**", "*")

# 2. Replace LaTeX delimiters \left( and \right) with lr(( ... )) or similar,
# and \left[ and \right] with lr([ ... ])
content = content.replace(r"\left(", "lr((")
content = content.replace(r"\right)", ")")
content = content.replace(r"\left[", "lr([")
content = content.replace(r"\right]", "]")
content = content.replace(r"\left", " lr ")
content = content.replace(r"\right", " ")

# 3. Replace LaTeX fractions \frac{a}{b} with frac(a, b) recursively
while True:
    new_content = re.sub(r'\\frac\{([^{}]+)\}\{([^{}]+)\}', r'frac(\1, \2)', content)
    if new_content == content:
        break
    content = new_content

# 4. Replace other LaTeX commands
content = content.replace(r"\frac", " frac ")
content = content.replace(r"\geq", " >= ")
content = content.replace(r"\leq", " <= ")
content = content.replace(r"\dots", " dots ")
content = content.replace(r"\in", " in ")
content = content.replace(r"\cdot", " dot.c ")
content = content.replace(r"\sum", " sum ")
content = content.replace(r"\prod", " prod ")
content = content.replace(r"\cosh", " cosh ")
content = content.replace(r"\sinh", " sinh ")
content = content.replace(r"\Phi", " Phi ")
content = content.replace(r"\rightarrow", " -> ")

# 5. Handle braces
content = content.replace(r"\{", " { ")
content = content.replace(r"\}", " } ")

# 6. Replace \text{...} with "..." inside math blocks
content = re.sub(r'\\text\{([^}]+)\}', r'"\1"', content)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Comprehensive cleanup completed.")
