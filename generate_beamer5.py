import re
import os

files_to_process = [
    "typst/sach/DECUONG12-HK1/chuong-01/bai05-de1.typ",
]

beamer_file = "typst/beamer/beamer-12-bai-5-ung-dung-thuc-tien.typ"

header = """#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 5: ỨNG DỤNG ĐẠO HÀM ĐỂ GIẢI QUYẾT BÀI TOÁN THỰC TIỄN
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)

#let True(body) = body
#let step(title) = { v(0.3em); text(fill: lec-palette.navy, weight: "bold")[👉 #title]; v(0.2em) }

#show: lecture-theme.with(
  title:       "Bài 5: Ứng dụng đạo hàm giải quyết bài toán thực tiễn",
  subtitle:    "TOÁN 12 — Chương I: Ứng dụng của đạo hàm",
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

// ════════════════════════════════════════════════

= Động Lực Học Tập
#slide(title: "Bài Toán Tối Ưu Hóa Trong Thực Tế")[
  #lt-two-col(ratio: (55%, 45%))[
    *Tại sao chúng ta phải học Giới hạn & Đạo hàm?*
    Trong thực tế đời sống và kinh doanh, con người luôn muốn tìm kiếm sự "hoàn hảo" nhất:
    - *Chi phí thấp nhất* nhưng *lợi nhuận cao nhất*.
    - *Vật liệu ít nhất* nhưng *thể tích chứa lớn nhất*.
    
    *Ví dụ thực tế*
    - Các hãng nước giải khát tính toán kích thước lon nhôm (hình trụ) sao cho với thể tích $330 ml$, diện tích vỏ lon là *nhỏ nhất* để tiết kiệm hàng triệu đô la tiền nhôm.
    - Công cụ duy nhất có thể giải quyết chính xác bài toán này chính là *Đạo hàm (Derivative)*!
  ][
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // Draw a soda can (cylinder)
        let cx = 0
        let cy = 0
        let r = 1.2
        let h = 3.5
        
        // Top ellipse
        ellipse((cx - r, cy + h - 0.4), (cx + r, cy + h + 0.4), stroke: 1.5pt + blue, fill: rgb("#e0e0e0"))
        
        // Body lines
        line((cx - r, cy), (cx - r, cy + h), stroke: 1.5pt + blue)
        line((cx + r, cy), (cx + r, cy + h), stroke: 1.5pt + blue)
        
        // Bottom ellipse (front half solid, back half dashed)
        arc((cx + r, cy), start: 0deg, stop: 180deg, radius: (r, 0.4), stroke: 1.5pt + blue)
        arc((cx - r, cy), start: 180deg, stop: 360deg, radius: (r, 0.4), stroke: (paint: blue, thickness: 1.5pt, dash: "dashed"))
        
        // Labels
        line((cx, cy), (cx + r, cy), stroke: 1pt + red)
        content((cx + r/2, cy + 0.3), text(fill: red)[$R$])
        
        line((cx + r + 0.5, cy), (cx + r + 0.5, cy + h), mark: (start: ">", end: ">", fill: red), stroke: 1pt + red)
        content((cx + r + 0.8, cy + h/2), text(fill: red)[$h$])
      })
    ]
  ]
]

= Phương Pháp Giải Toán
#slide(title: "Các Bước Giải Bài Toán Tối Ưu Tực Tế")[
  Để giải một bài toán ứng dụng GTLN, GTNN vào thực tế, ta thực hiện các bước sau:
  
  #step[Bước 1: Mô hình hóa toán học]
  - Chọn đại lượng cần tìm là biến số $x$.
  - Biểu diễn các đại lượng liên quan theo $x$.
  - Lập hàm số $y = f(x)$ biểu diễn đại lượng cần tối ưu.
  - Tìm tập xác định (miền giá trị thực tế) của biến $x$, thường là $x in [a; b]$ hoặc $x in (a; b)$.
  
  #step[Bước 2: Tìm GTLN, GTNN bằng đạo hàm]
  - Tính đạo hàm $f'(x)$.
  - Tìm các điểm tới hạn (nghiệm của $f'(x) = 0$).
  - Lập Bảng biến thiên (hoặc tính giá trị tại 2 đầu mút) để tìm GTLN, GTNN của $f(x)$ trên tập xác định.
  
  #step[Bước 3: Kết luận]
  - Đối chiếu với điều kiện bài toán để trả lời.
]

= Luyện Tập Trắc Nghiệm
// BÀI TẬP TRẮC NGHIỆM
"""

beamer_content = header

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
    if "thucte" in file_path:
        de_name = "Đề Thực Tế"
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    match = re.search(r'#(tn|ds|tln)\(', content)
    if not match:
        continue
    
    content = content[match.start():]
    
    content = content.replace("#tn(", f"#my-tn(de: \"{de_name}\", ")
    content = content.replace("#ds(", f"#my-ds(de: \"{de_name}\", ")
    content = content.replace("#tln(", f"#my-tln(de: \"{de_name}\", ")
    content = content.replace('anchor: "left"', 'anchor: "west"')
    
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

print("Done generating Beamer 5.")
