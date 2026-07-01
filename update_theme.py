import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Add math-size and body-font to lecture-theme signature
content = re.sub(
    r"  math-color:  lec-palette.amber,\n  base-size:   22pt,",
    r'  math-color:  rgb("#c2185b"), // magenta\n  math-size:   1.05em,\n  base-size:   22pt,\n  body-font:   ("Roboto", "Arial", "sans-serif"),',
    content
)

# Update state variables
content = re.sub(
    r"math-color: math-color, base: base-size,",
    r"math-color: math-color, math-size: math-size, base: base-size, body-font: body-font,",
    content
)

# Update the global text set
content = re.sub(
    r'  set text\(font: \("Libertinus Serif", "Times New Roman"\), size: base-size, fill: _fg, lang: "vi"\)',
    r'  set text(font: body-font, size: base-size, fill: _fg, lang: "vi")',
    content
)

# Update math equation size
content = re.sub(
    r'  show math\.equation: set text\(fill: math-color, size: base-size \* 0\.95\)',
    r'  show math.equation: set text(fill: math-color, size: math-size)',
    content
)

with open("typst/giao-an/modules/lecture-beamer.typ", "w", encoding="utf-8") as f:
    f.write(content)
print("Updated lecture-beamer.typ")
