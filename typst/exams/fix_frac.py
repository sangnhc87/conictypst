import re

with open('CD-DaySo-ChuyenSau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix \frac{A}{B} to (A)/(B)
text = re.sub(r'\\frac{([^}]+)}{([^}]+)}', r'( \1 )/( \2 )', text)

# There are also things like \sqrt, let's fix them just in case
text = re.sub(r'\\sqrt{([^}]+)}', r'sqrt(\1)', text)
text = text.replace(r'\pm', '+-')

with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(text)

