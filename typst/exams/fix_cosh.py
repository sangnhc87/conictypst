import re

with open('CD-DaySo-ChuyenSau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace(r'\cosh', 'cosh')
text = text.replace(r'\cos', 'cos')
text = text.replace(r'^{n-1)', r'^(n-1)')
text = text.replace(r'^{-x)', r'^(-x)')

# One more fix: `e^{2a}` and `e^a` in the last explanation
text = text.replace(r'e^{2a}', r'e^(2a)')
text = text.replace(r'e^{a}', r'e^a')

with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(text)
