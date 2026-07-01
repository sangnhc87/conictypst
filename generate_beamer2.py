import re
import os

files_to_process = [
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de1.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de2.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de3.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de4.typ",
]

beamer_file = "typst/beamer/beamer-12-bai-2-gtln-gtnn-cua-ham-so.typ"

with open(beamer_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()
    
cutoff = len(lines)
for i, line in enumerate(lines):
    if "BÀI TẬP TRẮC NGHIỆM" in line:
        cutoff = i + 1
        break

beamer_content = "".join(lines[:cutoff])
beamer_content = beamer_content.replace("**GTLN**", "*GTLN*").replace("**GTNN**", "*GTNN*").replace("**Lập Bảng Biến Thiên**", "*Lập Bảng Biến Thiên*").replace("**không có giá trị lớn nhất và không có giá trị nhỏ nhất**", "*không có giá trị lớn nhất và không có giá trị nhỏ nhất*")

wrappers = """
#let draw-ellipse(cx, cy, rx, ry, stroke: 1pt, style: "solid") = {
  let stroke-val = stroke
  import draw: *
  if style == "dashed" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  } else if style == "dashed-back" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  } else {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: stroke-val)
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }
}

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd
"""

beamer_content += wrappers

for idx, file_path in enumerate(files_to_process):
    if not os.path.exists(file_path):
        continue
    
    de_name = f"Đề {idx+1}"
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    match = re.search(r'#(tn|ds|tln)\(', content)
    if not match:
        continue
    
    content = content[match.start():]
    
    content = content.replace("#tn(", f"#my-tn(de: \"{de_name}\", ")
    content = content.replace("#ds(", f"#my-ds(de: \"{de_name}\", ")
    content = content.replace("#tln(", f"#my-tln(de: \"{de_name}\", ")
    
    filtered_lines = []
    for l in content.split('\n'):
        line_strip = l.strip()
        if line_strip.startswith('#resetcau') or line_strip.startswith('#exam-part') or line_strip.startswith('#muc'):
            continue
        filtered_lines.append(l)
    content = '\n'.join(filtered_lines)
    
    beamer_content += f"\n// ==================== {de_name} ====================\n"
    beamer_content += content + "\n\n"

with open(beamer_file, 'w', encoding='utf-8') as f:
    f.write(beamer_content)

print("Done generating.")
