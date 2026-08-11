import re

with open('CD-DaySo-ChuyenSau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace(r'\implies', '=>')
text = text.replace(r'\cdot', 'dot')
text = text.replace(r'\pi', 'pi')
text = text.replace(r'\circ', '^o')
text = text.replace(r'\in', 'in')
text = text.replace(r'\neq', '!=')
text = text.replace(r'\approx', 'approx')
text = text.replace(r'\infty', 'infinity')
text = text.replace(r'\sum', 'sum')
text = text.replace(r'\to', '->')
text = text.replace(r'\ln', 'ln')
text = text.replace(r'\cos', 'cos')
text = text.replace(r'\sin', 'sin')
text = text.replace(r'\tan', 'tan')
text = text.replace(r'\cot', 'cot')
text = text.replace(r'\le', '<=')
text = text.replace(r'\ge', '>=')
text = text.replace(r'\alpha', 'alpha')
text = text.replace(r'\beta', 'beta')

with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(text)

