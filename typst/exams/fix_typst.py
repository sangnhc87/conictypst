import re

with open('CD-NhanDangTamGiac.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix ^^o to ^o
text = text.replace('^^o', '^o')

# Fix \sqrt{...}
text = re.sub(r'\\sqrt{([^}]+)}', r'sqrt(\1)', text)
# Fix \sqrt[3]{...}
text = re.sub(r'\\sqrt\[3\]{([^}]+)}', r'root(3, \1)', text)

# Fix \frac{...}{...} (simple non-nested)
text = re.sub(r'\\frac{([^}]+)}{([^}]+)}', r'( \1 )/( \2 )', text)

with open('CD-NhanDangTamGiac.typ', 'w', encoding='utf-8') as f:
    f.write(text)

