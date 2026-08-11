import re
with open("CD-Vecto-ThucTe.typ", "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace('\\quad', 'quad')
text = text.replace('\\Rightarrow', '=>')

# Fix cases
text = re.sub(r'\\begin\{cases\}(.*?)\\end\{cases\}', 
              lambda m: 'cases(' + m.group(1).replace('\\\\', ',').strip() + ')',
              text, flags=re.DOTALL)

# Fix vmatrix
text = re.sub(r'\\begin\{vmatrix\}(.*?)\\end\{vmatrix\}', 
              lambda m: 'mat(delim: "|", ' + m.group(1).replace('\\\\', ';').replace('&', ',').strip() + ')',
              text, flags=re.DOTALL)

with open("CD-Vecto-ThucTe.typ", "w", encoding="utf-8") as f:
    f.write(text)
