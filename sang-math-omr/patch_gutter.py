import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# For TF section
old_tf = "row-gutter: 12pt,\n      column-gutter: 8pt,"
new_tf = "row-gutter: ${isA5 ? '4pt' : '12pt'},\n      column-gutter: 8pt,"
content = content.replace(old_tf, new_tf)

# For TLN section
old_tln = "row-gutter: 12pt,\n      column-gutter: 16pt,"
new_tln = "row-gutter: ${isA5 ? '4pt' : '12pt'},\n      column-gutter: 16pt,"
content = content.replace(old_tln, new_tln)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
