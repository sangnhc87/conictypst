import re

with open("CD-Vecto-ThucTe.typ", "r", encoding="utf-8") as f:
    text = f.read()

for i in range(10): # apply multiple times in case of nested
    text = re.sub(r'sqrt\(([^}]+)\}', r'sqrt(\1)', text)

# Also fix the comma in sqrt problem like `sqrt((106,07)^2 + (906,07)^2)`
# Actually, wait, `(106,07)` inside math is fine if it's NOT an argument to a function.
# `sqrt((106,07)^2)` will parse as ONE argument `(106,07)^2`, which is fine because the comma is inside `(...)` which shields it from `sqrt`'s argument list!
# Let's verify by just writing back.

with open("CD-Vecto-ThucTe.typ", "w", encoding="utf-8") as f:
    f.write(text)
