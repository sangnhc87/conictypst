import re

file_path = "/Users/admin/conictypst/typst/beamer/beamer-12-bai-2-gtln-gtnn-cua-ham-so.typ"

with open(file_path, "r", encoding="utf-8") as f:
    text = f.read()

text = text.replace(",\n        w1: 3,\n        w2: 19,\n        h1: 1.5,\n        h2: 1.5,\n        h3: 4\n      ", "\n      ")
text = text.replace("\n        w1: 3,\n        w2: 19,\n        h1: 1.5,\n        h2: 1.5,\n        h3: 4\n      ", "\n      ")

with open(file_path, "w", encoding="utf-8") as f:
    f.write(text)

print("Reverted.")
