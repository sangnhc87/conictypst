with open("CD-Vecto-ThucTe.typ", "r", encoding="utf-8") as f:
    text = f.read()

# Specifically replace the broken frac
text = text.replace(r'\frac{-400 cdot sqrt{29}}{3}', r'(-400 cdot sqrt(29))/(3)')
text = text.replace(r'\frac{2}{sqrt(29)} \frac{400 \sqrt{29}}{3}', r'(2)/(sqrt(29)) (400 sqrt(29))/(3)')
text = text.replace(r'\frac{v_{x}}{v_{y}}', r'(v_x)/(v_y)')
text = text.replace(r'\frac{106,07}{906,07}', r'(106.07)/(906.07)')
text = text.replace(r'\frac{arrow(u) \cdot arrow(v)_g}{|arrow(u)| |arrow(v)_g|}', r'(arrow(u) cdot arrow(v)_g)/(|arrow(u)| |arrow(v)_g|)')
text = text.replace(r'\frac{-1}{\sqrt{14} \cdot \sqrt{30}}', r'(-1)/(sqrt(14) cdot sqrt(30))')
text = text.replace(r'\frac{-1}{\sqrt{420}}', r'(-1)/(sqrt(420))')
text = text.replace(r'\frac{4}{\sqrt{10}}', r'(4)/(sqrt(10))')
text = text.replace(r'\frac{12}{\sqrt{10}}', r'(12)/(sqrt(10))')
text = text.replace(r'\frac{-4}{\sqrt{10}}', r'(-4)/(sqrt(10))')
text = text.replace(r'\leq', r'<=')
text = text.replace(r'\approx', r'approx')
text = text.replace(r'sqrt{', r'sqrt(')
text = text.replace(r'29}', r'29)')
text = text.replace(r'\frac{400 sqrt(29)}{3}', r'(400 sqrt(29))/(3)')
text = text.replace(r'\frac{2}{sqrt(29)}', r'(2)/(sqrt(29))')
text = text.replace(r'(-400 \cdot \sqrt(29))', r'(-400 cdot sqrt(29))')
text = text.replace(r'\frac{-1}{sqrt(14) cdot sqrt(30)}', r'(-1)/(sqrt(14) cdot sqrt(30))')
text = text.replace(r'\frac{-1}{sqrt(420)}', r'(-1)/(sqrt(420))')
text = text.replace(r'\frac{4}{sqrt(10)}', r'(4)/(sqrt(10))')
text = text.replace(r'\frac{12}{sqrt(10)}', r'(12)/(sqrt(10))')
text = text.replace(r'\frac{-4}{sqrt(10)}', r'(-4)/(sqrt(10))')

with open("CD-Vecto-ThucTe.typ", "w", encoding="utf-8") as f:
    f.write(text)
