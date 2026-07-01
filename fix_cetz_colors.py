import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace('fill: blue', 'fill: blue') # blue is built-in
content = content.replace('fill: emerald', 'fill: rgb("#059669")')
content = content.replace('stroke: emerald', 'stroke: rgb("#059669")')

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)

