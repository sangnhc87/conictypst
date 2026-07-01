import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    lines = f.readlines()

new_lines = []
for line in lines:
    if line.startswith("#let (tn, ds, tln, tl) ="): continue
    if line.startswith("#let mode ="): continue
    # #let accent = ... was kept earlier, but the original ones inside the extracted file also need to be removed if any.
    if re.match(r'^#let\s+accent\s*=\s*classic', line): continue
    
    new_lines.append(line)

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.writelines(new_lines)
