import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

old_rows = "let rows = Math.ceil(tf / Math.min(5, tf));"
new_rows = "let rows = Math.ceil(tf / cols);"
content = content.replace(old_rows, new_rows)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
