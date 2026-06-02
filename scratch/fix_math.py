import re

filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Replace \binom(x, y) with binom(x, y)
content = re.sub(r'\\binom', 'binom', content)

# Replace \lfloor x \rfloor with floor(x)
content = re.sub(r'\\lfloor\s*(.*?)\s*\\rfloor', r'floor(\1)', content)

# Replace \text{x} with "x"
content = re.sub(r'\\text\{\s*(.*?)\s*\}', r'"\1"', content)

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)

print("Math cleanup completed.")
