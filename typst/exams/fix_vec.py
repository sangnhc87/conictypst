import re
with open("CD-Vecto-ThucTe.typ", "r", encoding="utf-8") as f:
    text = f.read()

# Replace \vec{X} with arrow(X)
text = re.sub(r'\\vec{([^}]+)}', r'arrow(\1)', text)

with open("CD-Vecto-ThucTe.typ", "w", encoding="utf-8") as f:
    f.write(text)
