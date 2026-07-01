import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Fix lt-tn
content = re.sub(r'lec-palette\.emerald\.darken\(82\%\)', 'lec-palette.sol-fill', content)
content = re.sub(r'lec-palette\.emerald\.darken\(78\%\)', 'lec-palette.emerald.lighten(85%)', content)
content = re.sub(r'lec-palette\.emerald\.darken\(70\%\)', 'lec-palette.emerald.lighten(80%)', content)
content = re.sub(r'lec-palette\.amber\.darken\(82\%\)', 'lec-palette.amber.lighten(85%)', content)
content = re.sub(r'lec-palette\.violet\.darken\(70\%\)', 'lec-palette.violet.lighten(70%)', content)
content = re.sub(r'lec-palette\.cyan\.darken\(70\%\)', 'lec-palette.cyan.lighten(70%)', content)
content = re.sub(r'white, size: s\.base \* 1\.1', 'lec-palette.amber, size: s.base * 1.1', content)

with open("typst/giao-an/modules/lecture-beamer.typ", "w", encoding="utf-8") as f:
    f.write(content)

