import re

file_path = "/Users/admin/conictypst/typst/beamer/beamer-12-bai-2-gtln-gtnn-cua-ham-so.typ"

with open(file_path, "r", encoding="utf-8") as f:
    text = f.read()

# Replace all canvas(length: ...) with canvas(length: 1cm
# Also handle #cetz.canvas(length: ...) if any exist. Wait, grep showed `#cetz.canvas({` without length.
# Grep showed `fig: canvas(length: 0.8cm, {`
# Let's replace all `canvas(length: <number>cm` with `canvas(length: 1cm`
new_text = re.sub(r'canvas\(\s*length\s*:\s*[0-9.]+cm', r'canvas(length: 1cm', text)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(new_text)

print("Updated canvas lengths.")
