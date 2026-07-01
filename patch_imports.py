with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

imports_to_add = """
#import "../bbt.typ": *
#import "@preview/cetz:0.3.4"

// Polyfills for exam macros
#let True(body) = body
#let step(title) = {
  v(0.3em)
  text(fill: lec-palette.blue, weight: "bold")[👉 #title]
  v(0.2em)
}
"""

content = content.replace(
    '#import "../giao-an/modules/lecture-beamer.typ": *',
    '#import "../giao-an/modules/lecture-beamer.typ": *\n' + imports_to_add
)

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)
