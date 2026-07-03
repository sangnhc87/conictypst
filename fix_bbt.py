import sys, re

with open("typst/bbt.typ", "r") as f:
    content = f.read()

funcs_to_wrap = [
    "bxd", "bbt-opt", "bang-gia-tri", "bang-phan-phoi", "auto-bbt"
]

for func in funcs_to_wrap:
    # We replace `#let func(...) = {` with `#let func(...) = context { let __clr = text.fill;`
    content = re.sub(
        r"#let " + func + r"\((.*?)\)\s*=\s*\{",
        r"#let " + func + r"(\1) = context {\n  let __clr = text.fill",
        content,
        flags=re.DOTALL
    )

with open("typst/bbt.typ", "w") as f:
    f.write(content)
