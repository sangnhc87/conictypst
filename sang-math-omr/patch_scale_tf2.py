import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace(
    '  #if (isA5) { "#scale(x: 88%, y: 88%, origin: top)[" }',
    '  ${isA5 ? \'#scale(x: 90%, y: 90%, origin: top)[\\n\' : \'\'}'
)

content = content.replace(
    '  #if (isA5) { "]" }',
    '  ${isA5 ? \']\\n\' : \'\'}'
)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
