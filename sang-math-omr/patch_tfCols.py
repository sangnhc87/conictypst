import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

old_tfCols = "const tfCols = Math.min(5, tf);"
new_tfCols = "const tfCols = (isA5 && tf === 20) ? 4 : Math.min(5, tf);"
if new_tfCols not in content:
    content = content.replace(old_tfCols, new_tfCols)

# Also fix the sorting for 4 columns instead of 5
old_sort = "let cols = Math.min(5, tf);"
new_sort = "let cols = (isA5 && tf === 20) ? 4 : Math.min(5, tf);"
if new_sort not in content:
    content = content.replace(old_sort, new_sort)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
