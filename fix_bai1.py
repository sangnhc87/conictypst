import os

file = "typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ"
with open(file, "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace('@preview/cetz:0.3.4', '@preview/cetz:0.5.2')
content = content.replace('#let True(body) = body', '#let True(body) = (true: true, body: body)')

with open(file, "w", encoding="utf-8") as f:
    f.write(content)
print("Fixed bai 1")
