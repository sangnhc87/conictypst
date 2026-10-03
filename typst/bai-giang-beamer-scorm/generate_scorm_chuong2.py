import re
import os

beamer_dir = "/Users/admin/conictypst/typst/beamer"
chuong2_dir = "/Users/admin/conictypst/typst/sach/DECUONG12-HK1/chuong-02"

preamble_template = """#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-{BÀI}
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {{
  show math.frac: f => f
  math.frac(a, b)
}}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)


#show: lecture-theme.with(
  title:       "{TITLE}",
  subtitle:    "TOÁN 12 — Chương II: Vectơ và Hệ trục tọa độ trong không gian",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

#let my-tn(de: "", ..args) = {{
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {{
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  }} else {{
    stem
  }}
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}}

#let my-ds(de: "", ..args) = {{
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {{
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  }} else {{
    stem
  }}
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}}

#let my-tln(de: "", ..args) = {{
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {{
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  }} else {{
    stem
  }}
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}}
#let my-bbbt = bbbt
#let my-bxd = bxd

"""

def process_file(source_path, dest_path, title, bai_name):
    # Determine which de files to include
    de_files = []
    if "toa-do-vecto" in source_path:
        de_files = ["bai02-de1.typ"]
    elif "phep-toan-vecto" in source_path:
        de_files = ["bai03-de1.typ", "bai03-de2.typ"]
    
    content = preamble_template.format(BÀI=bai_name.upper(), TITLE=title)
    
    # In Beamer, they might have theory sections, but for now we'll just include the questions from the De files.
    for idx, de_file in enumerate(de_files):
        path = os.path.join(chuong2_dir, de_file)
        if not os.path.exists(path):
            continue
            
        with open(path, "r", encoding="utf-8") as f:
            text = f.read()
            
        # Remove unsupported macros
        text = re.sub(r'#import.*?\n', '', text)
        text = re.sub(r'#show math\.frac: math\.display\n', '', text)
        text = re.sub(r'#muc\(\[.*?\]\)\n', '', text)
        text = re.sub(r'#resetexamstate\(\)\n', '', text)
        text = re.sub(r'#resetstep\(\)\n', '', text)
        text = re.sub(r'#resetcau\(\)\n', '', text)
        text = re.sub(r'#exam-part\(\[.*?\]\,?.*?\)\n', '', text)
        
        # Replace #tn, #ds, #tln with #my-tn, #my-ds, #my-tln
        de_name = f"Đề {idx+1}"
        text = re.sub(r'#tn\(', f'#my-tn(de: "{de_name}", \n  ', text)
        text = re.sub(r'#ds\(', f'#my-ds(de: "{de_name}", \n  ', text)
        text = re.sub(r'#tln\(', f'#my-tln(de: "{de_name}", \n  ', text)
        
        # Update canvas length if any exists in these files
        text = re.sub(r'canvas\(\s*length\s*:\s*0\.[0-9]+cm', r'canvas(length: 1cm', text)
        
        content += f"\n// ==================== {de_name} ====================\n"
        content += text
        
    with open(dest_path, "w", encoding="utf-8") as f:
        f.write(content)
        
process_file(os.path.join(chuong2_dir, "bai02-toa-do-vecto.typ"), 
             os.path.join(beamer_dir, "beamer-12-bai-8-toa-do-vecto.typ"), 
             "Bài 2: Toạ độ của vectơ trong không gian", 
             "BÀI 8: TỌA ĐỘ VECTƠ")

process_file(os.path.join(chuong2_dir, "bai03-phep-toan-vecto.typ"), 
             os.path.join(beamer_dir, "beamer-12-bai-9-phep-toan-vecto.typ"), 
             "Bài 3: Biểu thức toạ độ của các phép toán vectơ", 
             "BÀI 9: PHÉP TOÁN VECTƠ")

print("Generated beamer files for bai 8 and bai 9.")
