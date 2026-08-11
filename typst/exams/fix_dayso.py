import re

with open('CD-DaySo-ChuyenSau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Fix greek letters
text = text.replace(r'\alpha', 'alpha')
text = text.replace(r'\beta', 'beta')
text = text.replace(r'\lambda', 'lambda')
text = text.replace(r'\Delta', 'Delta')
text = text.replace(r'\gcd', 'gcd')
text = text.replace(r'\lim', 'lim')

with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(text)
