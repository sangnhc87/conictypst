import re
with open("CD-Vecto-ThucTe.typ", "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace(r'\frac{-400 \cdot \sqrt{29}}{3}', r'(-400 cdot sqrt(29))/(3)')
text = text.replace(r'\frac{-400 cdot sqrt{29}}{3}', r'(-400 cdot sqrt(29))/(3)')

text = text.replace(r'\frac{400 \sqrt{29}}{3}', r'(400 sqrt(29))/(3)')
text = text.replace(r'\frac{400 sqrt{29}}{3}', r'(400 sqrt(29))/(3)')

text = text.replace(r'\sqrt{', r'sqrt(')
text = text.replace(r'\leq', r'<=')
text = text.replace(r'\approx', r'approx')
text = text.replace(r'}', r')') # Wait, this might break Typst blocks `{...}`

with open("CD-Vecto-ThucTe.typ", "w", encoding="utf-8") as f:
    f.write(text)
