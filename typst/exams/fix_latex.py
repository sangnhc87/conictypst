import re
with open("CD-Vecto-ThucTe.typ", "r", encoding="utf-8") as f:
    text = f.read()

# Replace LaTeX commands with Typst equivalents
text = text.replace('\\Rightarrow', '=>')
text = text.replace('\\cos', 'cos')
text = text.replace('\\sin', 'sin')
text = text.replace('\\tan', 'tan')
text = text.replace('\\arctan', 'arctan')
text = text.replace('\\arccos', 'arccos')
text = text.replace('\\sqrt', 'sqrt')
text = text.replace('\\Delta', 'Delta')
text = text.replace('\\cdot', 'cdot')

with open("CD-Vecto-ThucTe.typ", "w", encoding="utf-8") as f:
    f.write(text)
