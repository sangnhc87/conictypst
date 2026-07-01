with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

polyfills = """
#let classic = (
  blue: rgb("#0057b8"),
  emerald: rgb("#1a7a2e"),
  crimson: rgb("#cc2200"),
  ink: black,
)
#let palette = (
  ink: black,
  muted: rgb("#555"),
  border: rgb("#bbb"),
  accent: rgb("#0057b8"),
  correct: rgb("#1a7a2e"),
  wrong: rgb("#cc2200"),
  sol-bg: rgb("#f0f6ff"),
)
#let accent = classic.blue
"""

content = content.replace(
    '// Polyfills for exam macros',
    '// Polyfills for exam macros\n' + polyfills
)

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)

