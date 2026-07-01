import re
import os

files_to_process = [
    "typst/sach/DECUONG12-HK1/chuong-01/bai03-de1.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai03-de2.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai03-de3.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai03-de-thucte.typ",
]

beamer_file = "typst/beamer/beamer-12-bai-3-duong-tiem-can.typ"

header = """#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 3: ĐƯỜNG TIỆM CẬN
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
  title:       "Bài 3: Đường tiệm cận của đồ thị hàm số",
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

= Bối Cảnh Lịch Sử
#slide(title: "Nguồn Gốc Của Đường Tiệm Cận")[
  #lt-two-col(ratio: (55%, 45%))[
    *Khái niệm "Tiệm cận" (Asymptote)*
    - Tiếng Hy Lạp: *asumptōtos* (nghĩa là "không bao giờ gặp nhau").
    - Khái niệm này lần đầu được nghiên cứu bởi nhà toán học Hy Lạp cổ đại *Apollonius của Perga* (khoảng thế kỷ thứ 3 TCN) khi ông nghiên cứu các đường cô-nic, đặc biệt là đường Hyperbol.
    - Apollonius nhận thấy có những đường thẳng mà nhánh của Hyperbol cứ tiến lại gần mãi nhưng không bao giờ cắt.
    
    *Sự phát triển*
    - Sau này, khi *Newton* và *Leibniz* phát minh ra Giải tích, việc tìm tiệm cận trở thành bài toán tính *giới hạn (limit)* khi biến số tiến ra vô cực.
  ][
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-3, 0), (3, 0), mark: (end: ">", fill: black))
        line((0, -2), (0, 3), mark: (end: ">", fill: black))
        content((3.2, 0), $x$)
        content((0, 3.2), $y$)
        content((-0.3, -0.3), $O$)
        // curve y = 1/x for x > 0
        bezier((0.3, 3), (3, 0.3), (0.3, 0.3), stroke: 1.5pt + red)
        // curve y = 1/x for x < 0
        bezier((-0.3, -2), (-3, -0.3), (-0.3, -0.3), stroke: 1.5pt + red)
      })
    ]
  ]
]

= Tiệm Cận Ngang
#slide(title: "1. Tiệm Cận Ngang (Horizontal Asymptote)")[
  #lt-note(title: "Định nghĩa")[
    Cho hàm số $y = f(x)$ xác định trên một khoảng vô hạn. Đường thẳng $y = y_0$ được gọi là *đường tiệm cận ngang* của đồ thị hàm số $y = f(x)$ nếu ít nhất một trong các điều kiện sau được thoả mãn:
    #align(center)[
      $lim_(x -> +oo) f(x) = y_0$ \ hoặc \ $lim_(x -> -oo) f(x) = y_0$
    ]
  ]
  #pause
  *Ví dụ:* Tìm tiệm cận ngang của đồ thị hàm số $y = (2x + 1)/(x - 1)$.
  - Ta có $lim_(x -> +oo) (2x + 1)/(x - 1) = 2$ và $lim_(x -> -oo) (2x + 1)/(x - 1) = 2$.
  - Vậy đường thẳng $y = 2$ là tiệm cận ngang.
]

= Tiệm Cận Đứng
#slide(title: "2. Tiệm Cận Đứng (Vertical Asymptote)")[
  #lt-note(title: "Định nghĩa")[
    Đường thẳng $x = x_0$ được gọi là *đường tiệm cận đứng* của đồ thị hàm số $y = f(x)$ nếu ít nhất một trong các điều kiện sau được thoả mãn:
    #align(center)[
      $lim_(x -> x_0^+) f(x) = +oo; lim_(x -> x_0^-) f(x) = +oo$ \
      $lim_(x -> x_0^+) f(x) = -oo; lim_(x -> x_0^-) f(x) = -oo$
    ]
  ]
  #pause
  *Ví dụ:* Tìm tiệm cận đứng của đồ thị hàm số $y = (2x + 1)/(x - 1)$.
  - Ta có $lim_(x -> 1^+) (2x + 1)/(x - 1) = +oo$.
  - Vậy đường thẳng $x = 1$ là tiệm cận đứng.
]

= Tiệm Cận Xiên
#slide(title: "3. Tiệm Cận Xiên (Oblique Asymptote)")[
  #lt-note(title: "Định nghĩa")[
    Đường thẳng $y = a x + b$ ($a != 0$) được gọi là *đường tiệm cận xiên* của đồ thị hàm số $y = f(x)$ nếu:
    #align(center)[
      $lim_(x -> +oo) [f(x) - (a x + b)] = 0$ \ hoặc \ $lim_(x -> -oo) [f(x) - (a x + b)] = 0$
    ]
  ]
  #pause
  *Cách tìm tiệm cận xiên cho hàm phân thức:*
  Đối với hàm số dạng phân thức $y = (P(x))/(Q(x))$ mà bậc của $P(x)$ lớn hơn bậc của $Q(x)$ đúng 1 bậc, ta thực hiện phép chia đa thức:
  $ y = f(x) = a x + b + R(x)/(Q(x)) $
  Khi đó, vì $lim_(x -> oo) R(x)/(Q(x)) = 0$ nên $y = a x + b$ là tiệm cận xiên.
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

print("Done cleanly generating Beamer 3.")
