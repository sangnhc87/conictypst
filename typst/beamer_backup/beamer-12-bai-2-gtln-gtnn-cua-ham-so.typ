#import "../math-sym.typ": *
//  ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 2: GIÁ TRỊ LỚN NHẤT VÀ GIÁ TRỊ NHỎ NHẤT CỦA HÀM SỐ
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
//  ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)


#show: lecture-theme.with(
  title:       "Bài 2: GTLN và GTNN của hàm số",
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
// PHẦN MỞ ĐẦU & LỊCH SỬ
// ════════════════════════════════════════════════
#lt-section-link("sec-intro", "🎯", [Khởi động & Lịch sử])

#lt-slide-back(title: "🎯 Tình huống mở đầu: Bài toán cái hộp")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      Một công ty muốn làm một chiếc hộp không nắp từ một tấm bìa hình vuông cạnh $60 "cm"$ bằng cách cắt ở bốn góc bốn hình vuông bằng nhau rồi gập tấm bìa lại.
      
      #v(1em)
      #text(fill: lec-palette.navy, weight: "bold")[Câu hỏi đặt ra:]
      Hỏi phải cắt bỏ bốn hình vuông có cạnh bằng bao nhiêu để #text(fill: red, weight: "bold")[thể tích khối hộp là lớn nhất]?
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0,0), (4,4), fill: rgb("#e2e8f0"), stroke: 1.5pt + rgb("#64748b"))
          rect((0,0), (1,1), fill: white, stroke: (dash: "dashed"))
          rect((3,0), (4,1), fill: white, stroke: (dash: "dashed"))
          rect((0,3), (1,4), fill: white, stroke: (dash: "dashed"))
          rect((3,3), (4,4), fill: white, stroke: (dash: "dashed"))
          
          content((2, -0.5), [$60$])
          content((-0.5, 2), [$60$])
          content((0.5, 0.5), [$x$])
        })
      ]
    ]
  )
  #pause
  #v(1em)
  #lt-note(title: "Bài toán tối ưu")[
    Trong thực tế, ta thường xuyên gặp các bài toán yêu cầu tìm cấu hình để chi phí nhỏ nhất, lợi nhuận cao nhất, thể tích lớn nhất... Các bài toán đó được quy về việc tìm #text(fill: red, weight: "bold")[Giá trị lớn nhất] hoặc #text(fill: red, weight: "bold")[Giá trị nhỏ nhất] của hàm số.
  ]
]

#lt-slide-back(title: "⏳ Ai là người đầu tiên giải bài toán Tối ưu?")[
  #lt-timeline((
    ("~300 TCN", "Euclid", "Chứng minh trong tất cả các hình chữ nhật có cùng chu vi, hình vuông có diện tích lớn nhất (Bài toán sơ cấp)."),
    ("1615", "Johannes Kepler", "Tìm thể tích thùng rượu lớn nhất, ông nhận ra rằng tại điểm cực đại, sự thay đổi thể tích xấp xỉ bằng không."),
    ("1629", "Pierre de Fermat", "Phát triển phương pháp toán học hiện đại đầu tiên để tìm cực trị bằng cách xét điều kiện đạo hàm bằng $0$."),
    ("1841", "Karl Weierstrass", "Hoàn thiện nền tảng Giải tích, phát biểu định lý: Hàm số liên tục trên một đoạn luôn đạt GTLN và GTNN trên đoạn đó.")
  ))
]


// ════════════════════════════════════════════════
// PHẦN I: KHÁI NIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia", "📖", [I. Định nghĩa])
#lt-section("📖", [I. Định nghĩa Giá trị lớn nhất & Giá trị nhỏ nhất])

#lt-slide-back(title: "1. Định nghĩa")[
  Cho hàm số $y = f(x)$ xác định trên tập hợp $D$.
  #lt-definition(title: "Giá trị lớn nhất")[
    Số $M$ gọi là giá trị lớn nhất (GTLN) của hàm số $y = f(x)$ trên $D$ nếu:
    $ heva(f(x) <= M", với mọi " x in D, "Tồn tại " x_0 in D " sao cho " f(x_0) = M) $
    Kí hiệu: $ max_(D) f(x) = M $
  ]
  #pause
  #lt-definition(title: "Giá trị nhỏ nhất")[
    Số $m$ gọi là giá trị nhỏ nhất (GTNN) của hàm số $y = f(x)$ trên $D$ nếu:
    $ heva(f(x) >= m", với mọi " x in D, "Tồn tại " x_0 in D " sao cho " f(x_0) = m) $
    Kí hiệu: $ min_(D) f(x) = m $
  ]
]

#lt-slide-back(title: "2. Minh họa bằng đồ thị")[
  Quan sát đồ thị hàm số $y = x^2$ trên đoạn $[-1, 2]$:
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-1.5,0), (2.5,0), mark: (end: ">"), name: "x")
      line((0,-0.5), (0,4.5), mark: (end: ">"), name: "y")
      
      content((2.5, -0.3), [$x$])
      content((-0.3, 4.5), [$y$])
      content((-0.2, -0.2), [$O$])
      
      let f(x) = x * x
      let points = range(-10, 21).map(i => {
        let x = i * 0.1
        (x, f(x))
      })
      line(..points, stroke: 2pt + lec-palette.navy)
      
      // Các điểm biên
      circle((-1, 1), radius: 0.08, fill: lec-palette.navy)
      circle((2, 4), radius: 0.08, fill: lec-palette.navy)
      
      // Đường gióng
      line((-1, 0), (-1, 1), stroke: (dash: "dashed", paint: rgb("#94a3b8")))
      line((2, 0), (2, 4), stroke: (dash: "dashed", paint: rgb("#94a3b8")))
      line((0, 4), (2, 4), stroke: (dash: "dashed", paint: rgb("#94a3b8")))
      
      content((-1, -0.4), [$-1$])
      content((2, -0.4), [$2$])
      content((-0.3, 4), [$4$])
      
      // Chú thích GTLN / GTNN
      content((2.5, 4), text(fill: red, weight: "bold")[GTLN $(M=4)$], anchor: "west")
      content((0.8, -0.4), text(fill: rgb("#059669"), weight: "bold")[GTNN $(m=0)$])
    })
  ]
  #pause
  #lt-note(title: "Lưu ý")[
    - Điểm cao nhất của đồ thị trên tập $D$ chính là *GTLN*.
    - Điểm thấp nhất của đồ thị trên tập $D$ chính là *GTNN*.
  ]
]


// ════════════════════════════════════════════════
// PHẦN II: TÌM TRÊN MỘT ĐOẠN
// ════════════════════════════════════════════════
#lt-section-link("sec-doan", "📏", [II. Tìm GTLN, GTNN trên đoạn])
#lt-section("📏", [II. Cách tìm GTLN, GTNN trên một đoạn $[a, b]$])

#lt-slide-back(title: "1. Định lý Weierstrass")[
  #lt-theorem(title: "Sự tồn tại GTLN, GTNN")[
    Mọi hàm số liên tục trên một đoạn $[a, b]$ đều đạt giá trị lớn nhất và giá trị nhỏ nhất trên đoạn đó.
  ]
  #pause
  #v(1em)
  #lt-note(title: "Quy tắc 3 bước tìm GTLN, GTNN trên đoạn $[a, b]$")[
    Giả sử $y = f(x)$ liên tục trên $[a, b]$ và có đạo hàm trên $(a, b)$, có thể trừ ra một số hữu hạn điểm.
    - #step("Bước 1") Tìm các điểm $x_1, x_2, ..., x_n in (a, b)$ mà tại đó $f'(x) = 0$ hoặc không xác định.
    - #step("Bước 2") Tính các giá trị $f(a), f(x_1), f(x_2), ..., f(x_n), f(b)$.
    - #step("Bước 3") Kết luận:
      - $max_([a, b]) f(x)$ là số lớn nhất trong các giá trị tính được.
      - $min_([a, b]) f(x)$ là số nhỏ nhất trong các giá trị tính được.
  ]
]

#lt-slide-back(title: "2. Ví dụ áp dụng")[
  #lt-example[
    Tìm giá trị lớn nhất và giá trị nhỏ nhất của hàm số $f(x) = x^3 - 3x + 1$ trên đoạn $[0, 2]$.
  ]
  #pause
  #lt-solution[
    Hàm số đã cho liên tục trên đoạn $[0, 2]$.
    Ta có $f'(x) = 3x^2 - 3$.
    $f'(x) = 0 <=> 3x^2 - 3 = 0 <=> hoac(x = 1 (text("nhận")), x = -1 (text("loại")))$
    
    Tính các giá trị:
    - Tại 2 đầu mút: $f(0) = 1$, $f(2) = 3$.
    - Tại điểm cực trị: $f(1) = -1$.
    
    Vậy: 
    $ max_([0, 2]) f(x) = f(2) = 3; quad min_([0, 2]) f(x) = f(1) = -1 $
  ]
]


// ════════════════════════════════════════════════
// PHẦN III: TÌM TRÊN MỘT KHOẢNG
// ════════════════════════════════════════════════
#lt-section-link("sec-khoang", "↔️", [III. Tìm GTLN, GTNN trên khoảng])
#lt-section("↔️", [III. Cách tìm GTLN, GTNN trên khoảng $(a, b)$])

#lt-slide-back(title: "1. Phương pháp BBT")[
  #lt-note(title: "Lưu ý quan trọng")[
    - Không phải lúc nào hàm số cũng có GTLN, GTNN trên khoảng $(a, b)$, nửa khoảng $[a, b)$ hoặc khoảng vô cực.
    - Để tìm GTLN, GTNN trên các khoảng này, công cụ mạnh nhất là *Lập Bảng Biến Thiên*. Dựa vào hình dáng của đồ thị trên BBT, ta sẽ xác định được điểm cao nhất và điểm thấp nhất.
  ]
  #pause
  #v(1em)
  #lt-example[
    Tìm giá trị lớn nhất và nhỏ nhất (nếu có) của hàm số $f(x) = (2x-1)/(x-1)$ trên khoảng $(1, +oo)$.
  ]
]

#lt-slide-back(title: "2. Giải ví dụ")[
  #lt-solution[
    TXĐ của $f(x)$ trên tập đang xét là $D = (1, +oo)$.
    Đạo hàm: $f'(x) = (-1)/(x-1)^2 < 0$, với mọi $x in (1, +oo)$.
    #v(1em)
    Bảng biến thiên:
    #align(center)[
      #bbbt(
        x-vals: ($1$, $+oo$),
        d-signs: ($-$,),
        v-vals: ($+oo$, $2$),
      )
    ]
    #v(1em)
    Nhìn vào BBT, đồ thị hàm số đi từ $+oo$ xuống sát giá trị $2$ nhưng không bao giờ chạm $2$ (đường tiệm cận ngang $y=2$).
    
    Vậy hàm số *không có giá trị lớn nhất và không có giá trị nhỏ nhất* trên $(1, +oo)$.
  ]
]


// ════════════════════════════════════════════════
// BÀI TẬP TRẮC NGHIỆM

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

// ==================== Đề 1 ====================
#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-3.8, 0), (3.8, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.8, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -0.8), (0, 5.2), mark: (end: ">"), stroke: 0.5pt)
    content((0, 5.2), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.25), $O$)
    
    line((-3, 0), (-3, 4.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 0), (-1, 0.24), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0), (2, 2.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((3, 0), (3, 1.52), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-3, -0.25), $-3$)
    content((-1, -0.25), $-1$)
    content((2, -0.25), $2$)
    content((3, -0.25), $3$)
    
    let pts = ()
    for i in range(-30, 31) {
      let x = i / 10
      let y = (-2 * calc.pow(x, 3) + 3 * calc.pow(x, 2) + 12 * x + 10) * 0.08
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-3, 4.4), radius: 1.5pt, fill: blue, stroke: none)
    circle((3, 1.52), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $f(x) = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ bên. Giá trị lớn nhất của hàm số đã cho trên đoạn $[-3;3]$ bằng],
  (
    [$f(2)$],
    [$f(-1)$],
    True([$f(-3)$]),
    [$f(3)$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-3; 3]$.]
    #step[*Bước 2:* Điểm cao nhất của đồ thị trên đoạn này là điểm có hoành độ $x = -3$, tương ứng với tung độ $f(-3)$.]
    #step[*Bước 3:* Vậy giá trị lớn nhất của hàm số trên đoạn $[-3; 3]$ là $f(-3)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-3.8, 0), (4.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -0.8), (0, 4.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.8), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.25), $O$)
    
    line((-3, 0), (-3, 3.75), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0), (2, 0.62), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0.62), (0, 0.62), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-3, -0.25), $-3$)
    content((2, -0.25), $2$)
    content((4, -0.25), $4$)
    content((-0.25, 0.1), $2$)
    
    let pts = ()
    for i in range(-30, 41) {
      let x = i / 10
      let y = (0.2 * calc.pow(x, 5) - 0.5 * calc.pow(x, 4) - 3 * calc.pow(x, 3) + 9 * calc.pow(x, 2) + 2) * 0.05
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-3, 3.75), radius: 1.5pt, fill: blue, stroke: none)
    circle((4, 1.54), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên. Giá trị lớn nhất của hàm số trên $[-3;4]$ bằng:],
  (
    [$f(2)$],
    True([$f(-3)$]),
    [$f(4)$],
    [$f(0)$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-3; 4]$.]
    #step[*Bước 2:* Điểm cao nhất của đồ thị trên đoạn này là đỉnh bên trái tương ứng với $x = -3$.]
    #step[*Bước 3:* Vậy giá trị lớn nhất của hàm số trên đoạn $[-3; 4]$ là $f(-3)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.8, 0), (2.8, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.8, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.8), (0, 3.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.8), $y$, anchor: "west", padding: 2pt)
    content((0.25, 0.25), $O$)
    
    line((-1, 0), (-1, 2.1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 2.1), (2, 2.1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, 0), (2, 2.1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((1, 0), (1, -0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, -0.7), (-2, -0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-2, 0), (-2, -0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-2, 0.25), $-2$)
    content((-1, -0.25), $-1$)
    content((1, 0.25), $1$)
    content((2, -0.25), $2$)
    
    content((0.2, 2.1), $3$)
    content((0.2, 0.7), $1$)
    content((0.25, -0.7), $-1$)
    
    let pts = ()
    for i in range(-20, 21) {
      let x = i / 10
      let y = (calc.pow(x, 3) - 3 * x + 1) * 0.7
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-2, -0.7), radius: 1.5pt, fill: blue, stroke: none)
    circle((2, 2.1), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $f(x)$ liên tục trên đoạn $[-2;2]$ có đồ thị như hình vẽ bên. Giá trị nhỏ nhất của hàm số trên đoạn $[-2;2]$ là],
  (
    [$1$],
    True([$-1$]),
    [$-2$],
    [$3$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-2; 2]$.]
    #step[*Bước 2:* Điểm thấp nhất của đồ thị trên đoạn này có tọa độ $(-2; -1)$ hoặc $(1; -1)$.]
    #step[*Bước 3:* Vậy giá trị nhỏ nhất của hàm số trên đoạn $[-2; 2]$ là $-1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-1.8, 0), (3.8, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.8, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -3.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, 0.25), $O$)
    
    line((-1, 0), (-1, 1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 1.4), (0, 1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((3, 0), (3, 0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((3, 0.7), (0, 0.7), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((1, 0), (1, -1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, -1.4), (0, -1.4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    line((2, 0), (2, -2.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((2, -2.8), (0, -2.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-1, -0.25), $-1$)
    content((1, 0.25), $1$)
    content((2, 0.25), $2$)
    content((3, -0.25), $3$)
    
    content((0.2, 1.4), $2$)
    content((0.2, 0.7), $1$)
    content((0.25, -1.4), $-2$)
    content((0.25, -2.1), $-3$)
    content((0.25, -2.8), $-4$)
    
    let pts = ()
    for i in range(-10, 31) {
      let x = i / 10
      let y = (0.79 * calc.pow(x, 4) - 3.08 * calc.pow(x, 3) + 2.21 * calc.pow(x, 2) + 1.08 * x - 3) * 0.7
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    circle((-1, 1.4), radius: 1.5pt, fill: blue, stroke: none)
    circle((3, 0.7), radius: 1.5pt, fill: blue, stroke: none)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-1;3]$ và có đồ thị như hình vẽ bên. Gọi $M$ và $m$ lần lượt là giá trị lớn nhất và nhỏ nhất của hàm số trên đoạn $[-1;3]$. Khi đó, tổng $M + m$ bằng],
  (
    [$-6$],
    True([$-2$]),
    [$-5$],
    [$2$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị hàm số trên đoạn $[-1; 3]$.]
    #step[*Bước 2:* Điểm cao nhất của đồ thị là $(-1; 2)$ nên $M = 2$.]
    #step[*Bước 3:* Điểm thấp nhất của đồ thị là $(2; -4)$ nên $m = -4$.]
    #step[*Bước 4:* Tổng $M + m = 2 + (-4) = -2$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-3;2]$ và có bảng biến thiên như hình vẽ dưới:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: none,
        func: $y$,
        x-vals: ($-3$, $-1$, $0$, $1$, $2$),
        d-signs: ("", "", "", "", "", "", ""),
        v-vals: ($-2$, $3$, $0$, $2$, $1$),
        ranks: (0, 3, 1, 2, 1.5)
      
      )
    ]
    Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = f(x)$ trên đoạn $[-3;2]$. Tính $M+m$.],
  (
    [$-1$],
    True([$1$]),
    [$3$],
    [$5$]
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát bảng biến thiên của hàm số trên đoạn $[-3; 2]$.]
    #step[*Bước 2:* Giá trị lớn nhất của hàm số là $M = 3$ đạt tại $x = -1$.]
    #step[*Bước 3:* Giá trị nhỏ nhất của hàm số là $m = -2$ đạt tại $x = -3$.]
    #step[*Bước 4:* Vậy $M + m = 3 + (-2) = 1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ có bảng xét dấu đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-3$, $-2$, $-1$, $0$, $1$, $+oo$),
        f-signs: ("+", "0", "+", "0", "-", "0", "+", "0", "-", "0", "-")
      )
    ]
    Biết $f(-2) = f(0) = -3$. Giá trị lớn nhất của hàm số $y = |f(x)|$ trên đoạn $[-2;0]$ bằng],
  (
    [$f(-1)$],
    [$-3$],
    True([$-f(-1)$]),
    [$3$]
  ),
  loigiai: [
    #step[*Bước 1:* Từ bảng xét dấu $f'(x)$, trên đoạn $[-2; 0]$, đạo hàm $f'(x)$ đổi dấu từ $+$ sang $-$ tại $x = -1$ nên hàm số đạt cực đại tại $x = -1$.]
    #step[*Bước 2:* Đồ thị hàm số $f(x)$ đi lên từ $f(-2) = -3$ đến $f(-1)$ rồi đi xuống đến $f(0) = -3$. Do đó, $f(-1) > -3$.]
    #step[*Bước 3:* Hàm số $y = |f(x)|$ sẽ có đồ thị lấy đối xứng phần âm qua trục hoành. Vì $f(x) <= f(-1) < 0$ (hoặc $f(-1)$ có thể âm/dương nhưng min của đồ thị là -3). Giá trị lớn nhất của $|f(x)|$ trên đoạn $[-2; 0]$ sẽ là $max {|-3|, |f(-1)|}$. Đề bài cho các đáp án, nhận thấy đồ thị lật ngược nên giá trị lớn nhất là $-f(-1)$ nếu $f(-1) < 0$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ liên tục trên $[-3;2]$ và có bảng biến thiên như hình vẽ dưới. Gọi $M$, $m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = f(x)$ trên $[-3;2]$. Tính $M . m$.
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$, 
        x-vals: ($-3$, $0$, $1$, $2$),
        d-signs: ("+", "0", "-", "0", "+"),
        v-vals: ($-4$, $2$, $0$, $1$),
        // ranks: (0, 3, 1, 2)
        w1: 1.5,
        w2: 8,
      )
    ]],
  (
    [$6$],
    [$7$],
    [$5$],
    True([$-8$])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát bảng biến thiên trên đoạn $[-3; 2]$.]
    #step[*Bước 2:* Giá trị lớn nhất $M = 2$ đạt tại $x = 0$.]
    #step[*Bước 3:* Giá trị nhỏ nhất $m = -4$ đạt tại $x = -3$.]
    #step[*Bước 4:* Tích $M dot m = 2 dot (-4) = -8$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ có bảng biến thiên sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($0$, $3$, $8$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $10$, $0$),
        // ranks: (0, 2, 0)
        w1: 1.5,
        w2: 8,
      )
    ]
    Hàm số đạt giá trị lớn nhất là $f(x_0)$ tại $x_0$. Khi đó tích $x_0 . f(x_0)$ bằng],
  (
    True([$30$]),
    [$3$],
    [$10$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, hàm số đạt giá trị lớn nhất là $f(x_0) = 10$ tại cực đại $x_0 = 3$.]
    #step[*Bước 2:* Tính tích $x_0 dot f(x_0) = 3 dot 10 = 30$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị nhỏ nhất của hàm số $f(x) = x^3 - 6x$ trên $[-1; 4]$ là],
  (
    True([$-4 sqrt(2)$]),
    [$-5$],
    [$5$],
    [$40$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = x^3 - 6x$ trên đoạn $[-1; 4]$. Đạo hàm $f'(x) = 3x^2 - 6$.]
    #step[*Bước 2:* Giải phương trình $f'(x) = 0 <=> 3x^2 - 6 = 0 <=> x = sqrt(2) in [-1; 4]$ hoặc $x = -sqrt(2) in.not [-1; 4]$.]
    #step[*Bước 3:* Tính các giá trị: $f(-1) = 5$, $f(sqrt(2)) = (sqrt(2))^3 - 6sqrt(2) = -4 sqrt(2)$, $f(4) = 4^3 - 24 = 40$.]
    #step[*Bước 4:* So sánh các giá trị, ta có giá trị nhỏ nhất là $-4 sqrt(2)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất, giá trị nhỏ nhất của hàm số $y = 1/3 x^3 - 2x^2 + 3x + 1$ trên đoạn $[0; 4]$. Tính tổng $S = M + m$.],
  (
    [$7/3$],
    [$1$],
    True([$10/3$]),
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (1)/(3)x^3 - 2x^2 + 3x + 1$ trên $[0; 4]$. Đạo hàm $y' = x^2 - 4x + 3$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> x = 1$ hoặc $x = 3$. Cả hai nghiệm đều thuộc $[0; 4]$.]
    #step[*Bước 3:* Tính các giá trị: $y(0) = 1$, $y(1) = (7)/(3)$, $y(3) = 1$, $y(4) = (7)/(3)$.]
    #step[*Bước 4:* Vậy $M = (7)/(3)$ và $m = 1$. Tổng $S = M + m = (7)/(3) + 1 = (10)/(3)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = x^3 + 3x^2 + 10$ trên đoạn $[-5;-1]$ bằng],
  (
    [$12$],
    [$18$],
    [$-40$],
    True([$14$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^3 + 3x^2 + 10$ trên đoạn $[-5; -1]$. Đạo hàm $y' = 3x^2 + 6x$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> x = 0 in.not [-5; -1]$ hoặc $x = -2 in [-5; -1]$.]
    #step[*Bước 3:* Tính các giá trị: $y(-5) = -125 + 75 + 10 = -40$, $y(-2) = -8 + 12 + 10 = 14$, $y(-1) = -1 + 3 + 10 = 12$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là $14$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị nhỏ nhất của hàm số $y = x^3 - 3x + 5$ trên đoạn $[2;4]$ là:],
  (
    [$limits(min)_([2;4]) y = 5$],
    [$limits(min)_([2;4]) y = 0$],
    [$limits(min)_([2;4]) y = 3$],
    True([$limits(min)_([2;4]) y = 7$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^3 - 3x + 5$ trên đoạn $[2; 4]$. Đạo hàm $y' = 3x^2 - 3$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> x = +- 1 in.not [2; 4]$.]
    #step[*Bước 3:* Tính các giá trị tại hai đầu mút: $y(2) = 2^3 - 3(2) + 5 = 7$, $y(4) = 4^3 - 3(4) + 5 = 57$.]
    #step[*Bước 4:* Vậy giá trị nhỏ nhất của hàm số trên đoạn $[2; 4]$ là $7$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $f(x) = (x^2 + 3)/(x - 1)$ trên đoạn $[2; 4]$ là],
  (
    True([$7$]),
    [$8$],
    [$19/3$],
    [$23/3$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (x^2 + 3)/(x - 1)$ trên $[2; 4]$. Đạo hàm $f'(x) = (2x(x - 1) - (x^2 + 3))/((x - 1)^2) = (x^2 - 2x - 3)/((x - 1)^2)$.]
    #step[*Bước 2:* Giải phương trình $f'(x) = 0 <=> x^2 - 2x - 3 = 0 <=> x = -1 in.not [2; 4]$ hoặc $x = 3 in [2; 4]$.]
    #step[*Bước 3:* Tính các giá trị: $f(2) = 7$, $f(3) = (12)/(2) = 6$, $f(4) = (19)/(3) approx 6.33$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là $7$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $m, M$ lần lượt là giá trị nhỏ nhất và giá trị lớn nhất của hàm số $f(x) = 1/2 x - sqrt(x + 1)$ trên đoạn $[0; 3]$. Tổng $S = 2M - m$ bằng],
  (
    True([$S = 0$]),
    [$S = -3/2$],
    [$S = -2$],
    [$S = 4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (1)/(2)x - sqrt(x + 1)$ trên $[0; 3]$. Đạo hàm $f'(x) = (1)/(2) - {1}{2 sqrt(x + 1)}$.]
    #step[*Bước 2:* Giải phương trình $f'(x) = 0 <=> sqrt(x + 1) = 1 <=> x = 0 in [0; 3]$.]
    #step[*Bước 3:* Tính các giá trị: $f(0) = -1$, $f(3) = (3)/(2) - sqrt(4) = -(1)/(2)$. Hàm số đồng biến trên $[0; 3]$.]
    #step[*Bước 4:* Vậy $M = -(1)/(2)$, $m = -1$. Tổng $S = 2M - m = 2(-(1)/(2)) - (-1) = 0$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất và giá trị nhỏ nhất của hàm số $f(x) = x + cos^2 x$ trên đoạn $[0; pi/4]$ là],
  (
    [$limits(max)_([0; pi/4]) f(x) = 1/2; limits(min)_([0; pi/4]) f(x) = -1$],
    [$limits(max)_([0; pi/4]) f(x) = pi/4; limits(min)_([0; pi/4]) f(x) = pi/6$],
    True([$limits(max)_([0; pi/4]) f(x) = pi/4 + 1/2; limits(min)_([0; pi/4]) f(x) = 1$]),
    [$limits(max)_([0; pi/4]) f(x) = pi/4 + 1/2; limits(min)_([0; pi/4]) f(x) = 1/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = x + cos^2 x$ trên $[0; (pi)/(4)]$. Đạo hàm $f'(x) = 1 - 2sin x cos x = 1 - sin 2x$.]
    #step[*Bước 2:* Trên $[0; (pi)/(4)]$, ta có $0 <= 2x <= (pi)/(2) => sin 2x <= 1 => f'(x) >= 0$. Hàm số đồng biến.]
    #step[*Bước 3:* Vậy $M = f((pi)/(4)) = (pi)/(4) + (1)/(2)$ và $m = f(0) = 1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = (x+2)/x$ trên $[1;2]$],
  (
    [$limits(min)_([1;2]) y = 3$],
    True([$limits(min)_([1;2]) y = 2$]),
    [$limits(min)_([1;2]) y = 1/2$],
    [$limits(min)_([1;2]) y = 3/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (x+2)/(x) = 1 + (2)/(x)$ trên $[1; 2]$. Đạo hàm $y' = -(2)/(x^2) < 0$.]
    #step[*Bước 2:* Hàm số nghịch biến trên $[1; 2]$.]
    #step[*Bước 3:* Vậy giá trị nhỏ nhất đạt được tại $x = 2$, $y(2) = (4)/(2) = 2$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = sqrt(16-x^2)$ là],
  (
    [$16$],
    True([$4$]),
    [$0$],
    [$1$]
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = sqrt(16-x^2)$ xác định trên đoạn $[-4; 4]$.]
    #step[*Bước 2:* Ta có $16 - x^2 <= 16 => sqrt(16 - x^2) <= 4$.]
    #step[*Bước 3:* Dấu bằng xảy ra khi $x = 0 in [-4; 4]$. Vậy giá trị lớn nhất là $4$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất, giá trị nhỏ nhất của hàm số $y = x sqrt(16-x^2)$. Tính $M + m$],
  (
    [$8 - sqrt(8)$],
    [$sqrt(8)$],
    True([$0$]),
    [$8$]
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = x sqrt(16-x^2)$ xác định trên $[-4; 4]$. Đây là hàm số lẻ.]
    #step[*Bước 2:* Đạo hàm $y' = sqrt(16-x^2) - {x^2}{sqrt(16-x^2)} = {16-2x^2}{sqrt(16-x^2)}$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 16-2x^2=0 <=> x = +- 2 sqrt(2)$.]
    #step[*Bước 4:* Tính $y(-4)=0, y(4)=0, y(2 sqrt(2)) = 8, y(-2 sqrt(2)) = -8$. Suy ra $M = 8, m = -8 => M+m=0$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Trên đoạn $[-4;-1]$, hàm số $y = x + 9/(x-1)$ đạt giá trị lớn nhất bằng],
  (
    True([$-5$]),
    [$-29/5$],
    [$-11/2$],
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x + (9)/(x-1)$ trên $[-4; -1]$. Đạo hàm $y' = 1 - (9)/((x-1)^2)$.]
    #step[*Bước 2:* Giải phương trình $y' = 0 <=> (x-1)^2 = 9 <=> x - 1 = 3$ hoặc $x - 1 = -3 <=> x = 4 in.not [-4; -1]$ hoặc $x = -2 in [-4; -1]$.]
    #step[*Bước 3:* Tính các giá trị: $y(-4) = -4 - (9)/(5) = -(29)/(5)$, $y(-2) = -2 - (9)/(3) = -5$, $y(-1) = -1 - (9)/(2) = -(11)/(2)$.]
    #step[*Bước 4:* So sánh, ta thấy giá trị lớn nhất là $-5$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = 4/x + x + 1$ trên đoạn $[1;3]$. Tính $M - m$.],
  (
    [$9$],
    [$5$],
    True([$1$]),
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (4)/(x) + x + 1$ trên $[1; 3]$. Đạo hàm $y' = -(4)/(x^2) + 1 = (x^2-4)/(x^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x^2 = 4 <=> x = 2 in [1; 3]$.]
    #step[*Bước 3:* Tính $y(1) = 6$, $y(2) = 5$, $y(3) = (4)/(3) + 4 = (16)/(3)$.]
    #step[*Bước 4:* Suy ra $M = 6, m = 5 => M - m = 1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Trên đoạn $[1/3; 3/2]$, hàm số $y = 2x^2 + 1/(2x)$ đạt giá trị nhỏ nhất tại điểm],
  (
    True([$x = 1/2$]),
    [$x = 3/2$],
    [$x = 1/3$],
    [$x = 1$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = 2x^2 + (1)/(2x)$ trên $[(1)/(3); (3)/(2)]$. Đạo hàm $y' = 4x - (1)/(2x^2) = (8x^3 - 1)/(2x^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> 8x^3 - 1 = 0 <=> x = (1)/(2) in [(1)/(3); (3)/(2)]$.]
    #step[*Bước 3:* Lập bảng biến thiên, ta thấy hàm số đạt GTNN tại điểm $x = (1)/(2)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = 2cos x - 4/3 cos^3 x$ trên $[0; pi]$.],
  (
    [$limits(max)_([0; pi]) y = 2/3$],
    [$limits(max)_([0; pi]) y = 10/3$],
    True([$limits(max)_([0; pi]) y = (2 sqrt(2))/3$]),
    [$limits(max)_([0; pi]) y = 0$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = 2cos x - (4)/(3)cos^3 x$ trên $[0; pi]$. Đặt $t = cos x => t in [-1; 1]$.]
    #step[*Bước 2:* Hàm số trở thành $f(t) = 2t - (4)/(3)t^3$. Đạo hàm $f'(t) = 2 - 4t^2 = 0 <=> t = +- {1}{sqrt(2)} in [-1; 1]$.]
    #step[*Bước 3:* Tính $f(-1) = -(2)/(3), f(1) = (2)/(3)$, $f({1}{sqrt(2)}) = {2 sqrt(2)}{3}, f(-{1}{sqrt(2)}) = -{2 sqrt(2)}{3}$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là ${2 sqrt(2)}{3}$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = sqrt(x-3) + sqrt(5-x)$ là],
  (
    [$sqrt(3)$],
    [$sqrt(2)$],
    [$1$],
    True([$2$])
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = sqrt(x-3) + sqrt(5-x)$ xác định trên $[3; 5]$. Ta luôn có $y >= 0$.]
    #step[*Bước 2:* Áp dụng hằng đẳng thức: $y^2 = x-3 + 5-x + 2 sqrt((x-3)(5-x)) = 2 + 2 sqrt((x-3)(5-x))$.]
    #step[*Bước 3:* Theo BĐT AM-GM: $2 sqrt((x-3)(5-x)) <= (x-3) + (5-x) = 2$.]
    #step[*Bước 4:* Suy ra $y^2 <= 4 => y <= 2$. Dấu "=" xảy ra khi $x-3 = 5-x <=> x = 4$. Vậy GTLN là $2$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (x^2+x+3)/(x-2)$ trên $[-2;1]$. Giá trị của $M + m$ bằng],
  (
    True([$-6$]),
    [$-9/4$],
    [$-25/4$],
    [$-5$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (x^2+x+3)/(x-2)$ trên $[-2; 1]$. Đạo hàm $y' = ((2x+1)(x-2) - (x^2+x+3))/((x-2)^2) = (x^2-4x-5)/((x-2)^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x^2 - 4x - 5 = 0 <=> x = -1 in [-2; 1]$ hoặc $x = 5 in.not [-2; 1]$.]
    #step[*Bước 3:* Tính $y(-2) = -(5)/(4)$, $y(-1) = -1$, $y(1) = -5$.]
    #step[*Bước 4:* Vậy $M = -1, m = -5 => M + m = -6$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $m, M$ lần lượt là giá trị nhỏ nhất, giá trị lớn nhất của hàm số $f(x) = 4x + sin^2 pi x$ trên đoạn $[-1;2]$. Giá trị của $m + M$ bằng],
  (
    [$0$],
    True([$4$]),
    [$-2$],
    [$-4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = 4x + sin^2 pi x$ trên $[-1; 2]$. Đạo hàm $f'(x) = 4 + 2pi sin pi x cos pi x = 4 + pi sin 2pi x$.]
    #step[*Bước 2:* Vì $sin 2pi x >= -1$ nên $f'(x) >= 4 - pi > 0, forall x$. Hàm số đồng biến trên $[-1; 2]$.]
    #step[*Bước 3:* Do đó, $M = f(2) = 8 + 0 = 8$, $m = f(-1) = -4 + 0 = -4$.]
    #step[*Bước 4:* Tổng $M + m = 8 + (-4) = 4$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = x + cos^2 x$ trên $[0; pi/2]$ là:],
  (
    True([$pi/2$]),
    [$pi/2 + 1$],
    [$1$],
    [$pi/4 + 1/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x + cos^2 x$ trên $[0; (pi)/(2)]$. Đạo hàm $y' = 1 - 2sin x cos x = 1 - sin 2x$.]
    #step[*Bước 2:* Vì $sin 2x <= 1$ nên $y' >= 0, forall x in [0; (pi)/(2)]$. Hàm số đồng biến.]
    #step[*Bước 3:* Vậy giá trị lớn nhất là $y((pi)/(2)) = (pi)/(2) + cos^2((pi)/(2)) = (pi)/(2)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $f(x) = (-x^2-4)/x$ trên đoạn $[3/2; 4]$.],
  (
    True([$-4$]),
    [$-25/6$],
    [$-5$],
    [$-2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (-x^2-4)/(x) = -x - (4)/(x)$ trên $[(3)/(2); 4]$. Đạo hàm $f'(x) = -1 + (4)/(x^2) = (4-x^2)/(x^2)$.]
    #step[*Bước 2:* Giải $f'(x) = 0 <=> x = 2 in [(3)/(2); 4]$ (loại $x=-2$).]
    #step[*Bước 3:* Tính $f((3)/(2)) = -(9/4+4)/(3/2) = -(25)/(6)$, $f(2) = -4$, $f(4) = -5$.]
    #step[*Bước 4:* So sánh ta thấy giá trị lớn nhất là $-4$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $m, M$ lần lượt là giá trị nhỏ nhất, giá trị lớn nhất của hàm số $f(x) = 2x + cos (pi x)/2$ trên đoạn $[-2;2]$. Giá trị của $m + M$ bằng],
  (
    [$2$],
    True([$-2$]),
    [$0$],
    [$-4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = 2x + cos (pi x)/(2)$ trên $[-2; 2]$. Đạo hàm $f'(x) = 2 - (pi)/(2)sin (pi x)/(2)$.]
    #step[*Bước 2:* Vì $sin (pi x)/(2) <= 1$ nên $f'(x) >= 2 - (pi)/(2) > 0, forall x$. Hàm số đồng biến.]
    #step[*Bước 3:* Do đó, $M = f(2) = 4 + cos pi = 3$, $m = f(-2) = -4 + cos(-pi) = -5$.]
    #step[*Bước 4:* Tổng $M + m = 3 + (-5) = -2$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Cho hàm số $y = sin x cos^2 x/2$. Giá trị lớn nhất của hàm số trên $[0; pi]$ bằng],
  (
    [$0$],
    [$(3 sqrt(3))/4$],
    [$1/2$],
    True([$(3 sqrt(3))/8$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = sin x cos^2 (x)/(2) = sin x dot (1+cos x)/(2)$ trên $[0; pi]$.]
    #step[*Bước 2:* Đạo hàm $y' = (1)/(2)(cos x + cos^2 x - sin^2 x) = (1)/(2)(2cos^2 x + cos x - 1)$.]
    #step[*Bước 3:* Giải $y' = 0 <=> cos x = -1$ hoặc $cos x = (1)/(2) => x = pi$ hoặc $x = (pi)/(3)$.]
    #step[*Bước 4:* Tính $y(0) = 0, y(pi) = 0, y((pi)/(3)) = {sqrt(3)}{2} dot (1+1/2)/(2) = {3 sqrt(3)}{8}$. Vậy giá trị lớn nhất là ${3 sqrt(3)}{8}$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Gọi $M, m$ thứ tự là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (x^2+3)/(x-1)$ trên đoạn $[-2;0]$. Tính $P = M + m$?],
  (
    [$P = 1$],
    [$P = -3$],
    [$P = -13/3$],
    True([$P = -5$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = (x^2+3)/(x-1)$ trên $[-2; 0]$. Đạo hàm $y' = (x^2-2x-3)/((x-1)^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = -1 in [-2; 0]$ hoặc $x = 3 in.not [-2; 0]$.]
    #step[*Bước 3:* Tính $y(-2) = -(7)/(3)$, $y(-1) = -2$, $y(0) = -3$.]
    #step[*Bước 4:* Suy ra $M = -2, m = -3 => P = M + m = -5$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $y = sqrt(-x^2+3x+4)$ là bao nhiêu?],
  (
    True([$5/2$]),
    [$2/5$],
    [$3/2$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Biểu thức trong căn là một tam thức bậc hai $g(x) = -x^2+3x+4$.]
    #step[*Bước 2:* $g(x)$ đạt giá trị lớn nhất tại đỉnh parabol $x = -(b)/(2a) = (3)/(2)$.]
    #step[*Bước 3:* Giá trị lớn nhất của $g(x)$ là $g((3)/(2)) = -(9)/(4) + (9)/(2) + 4 = (25)/(4)$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất của $y$ là $sqrt((25)/(4)) = (5)/(2)$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Cho hàm số $y = x^3 - 3/2 x^2 + 1$. Gọi $M$ là giá trị lớn nhất của hàm số trên khoảng $(-25; 11/10)$. Tìm giá trị của $M$.],
  (
    True([$M = 1$]),
    [$M = 1/2$],
    [$M = 0$],
    [$(129)/(250)$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^3 - (3)/(2)x^2 + 1$ trên $( -25; (11)/(10) )$. Đạo hàm $y' = 3x^2 - 3x$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 0 in (-25; 1.1)$ hoặc $x = 1 in (-25; 1.1)$.]
    #step[*Bước 3:* Lập bảng biến thiên, tại $x = 0$ hàm số đạt cực đại, $y(0) = 1$. Tại $x = 1$ hàm số đạt cực tiểu $y(1) = (1)/(2)$.]
    #step[*Bước 4:* Xét $y(-25)$ rất nhỏ, và $y(1.1) approx 0.516 < 1$. Vậy giá trị lớn nhất trên khoảng này là $M = 1$.]
  ]
)

#my-tn(de: "Đề 1", 
  dir: "ngang",
  [Giá trị lớn nhất của hàm số $f(x) = (1+cos 2x)/(2+sin x)$ bằng],
  (
    [$4 sqrt(2) - 4$],
    [$1$],
    [$0$],
    True([$8 - 4 sqrt(3)$])
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $f(x) = (1+cos 2x)/(2+sin x) = (2cos^2 x)/(2+sin x) = (2(1-sin^2 x))/(2+sin x)$.]
    #step[*Bước 2:* Đặt $t = sin x in [-1; 1]$. Hàm số trở thành $g(t) = (2(1-t^2))/(t+2)$. Đạo hàm $g'(t) = (-4t(t+2) - 2(1-t^2))/((t+2)^2) = (-2t^2-8t-2)/((t+2)^2)$.]
    #step[*Bước 3:* Giải $g'(t) = 0 <=> t^2+4t+1 = 0 <=> t = -2 +- sqrt(3)$. Chỉ có $t = -2+sqrt(3) in [-1; 1]$.]
    #step[*Bước 4:* Thay $t = -2+sqrt(3)$ vào $g(t)$, ta được $g(-2+sqrt(3)) = 8 - 4 sqrt(3)$. Đây chính là giá trị lớn nhất.]
  ]
)


#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x)$ xác định và liên tục trên $(-4;4)$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-4$, $-2$, $0$, $4$),
        d-signs: ("+", "0", "-", "0", "+"),
        v-vals: ($-10$, $0$, $-4$, $10$),
        ranks: (0, 2, 1, 3)
      
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    [$limits(min)_((-4;4)) y = -4$ và $limits(max)_((-4;4)) y = 10$.],
    [$limits(max)_((-4;4)) y = 10$ và $limits(min)_((-4;4)) y = -10$.],
    [$limits(max)_((-4;4)) y = 0$ và $limits(min)_((-4;4)) y = -4$.],
    True([Hàm số không có giá trị lớn nhất và nhỏ nhất trên $(-4;4)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, trên khoảng $(-4; 4)$, hàm số tiến tới $-10$ khi $x -> -4^+$ và tiến tới $10$ khi $x -> 4^-$.]
    #step[*Bước 2:* Giá trị cực đại là $0$ và cực tiểu là $-4$. Do đó, đồ thị hàm số không có đỉnh cao nhất hay điểm thấp nhất trên khoảng này.]
    #step[*Bước 3:* Vậy hàm số không có giá trị lớn nhất và nhỏ nhất trên $(-4; 4)$. Các mệnh đề khác đều sai.]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = x + 4/x$, $x in (0; +oo)$.],
  (
    True([Hàm số đạt giá trị nhỏ nhất tại $x = 2$ và không có giá trị lớn nhất trên $(0; +oo)$.]),
    [Hàm số có giá trị lớn nhất và giá trị nhỏ nhất trên $(0; +oo)$.],
    [Hàm số đạt giá trị lớn nhất tại $x = 1$ và không có giá trị nhỏ nhất trên khoảng $(0; +oo)$.],
    [Hàm số không có giá trị nhỏ nhất và không có giá trị lớn nhất trên $(0; +oo)$.]
  ),
  loigiai: [
    #step[*Bước 1:* Hàm số $y = x + (4)/(x)$ trên $(0; +oo)$. Áp dụng BĐT AM-GM: $x + (4)/(x) >= 2 sqrt(x dot (4)/(x)) = 4$. Dấu "=" khi $x = 2$.]
    #step[*Bước 2:* Khi $x -> +oo$ thì $y -> +oo$, do đó hàm số không có giá trị lớn nhất.]
    #step[*Bước 3:* Vậy hàm số đạt giá trị nhỏ nhất bằng $4$ tại $x=2$ và không có giá trị lớn nhất.]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng biến thiên trong hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ("-", "0", "+", "0", "-", "0", "+"),
        v-vals: ($+oo$, $-2$, $-1$, $-2$, $+oo$),
        ranks: (2, 0, 1, 0, 2),
        w1:3,
        w2:19,
        h1:1.5,
        h2:1.5,
        h3:4,
        
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số đồng biến trên mỗi khoảng $(-1;0)$; $(1; +oo)$ và nghịch biến trên khoảng $(-oo; -1)$.],
    True([Hàm số đạt cực tiểu tại $x = +-1$ và có giá trị cực tiểu là $y = -2$.]),
    [Hàm số đạt giá trị lớn nhất tại $x = 0$.],
    True([Tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn $[-1;1]$ bằng $-3$.])
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, hàm số đồng biến trên $(-1; 0)$ và $(1; +oo)$, nghịch biến trên $(-oo; -1)$ và $(0; 1)$. (Mệnh đề a sai)]
    #step[*Bước 2:* Đạo hàm đổi dấu từ $-$ sang $+$ tại $x = +- 1$ nên hàm số đạt cực tiểu tại $x = +- 1$ và $y_"CT" = -2$. (Mệnh đề b đúng)]
    #step[*Bước 3:* $x = 0$ là điểm cực đại chứ không phải giá trị lớn nhất trên $RR$. (Mệnh đề c sai)]
    #step[*Bước 4:* Trên $[-1; 1]$, GTLN là $-1$ (tại $x=0$) và GTNN là $-2$ (tại $x = +- 1$). Tổng bằng $-3$. (Mệnh đề d đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng biến thiên trong hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        d-signs: ("+", "0", "-", "0", "+", "0", "-"),
        v-vals: ($-oo$, $4$, $3$, $4$, $-oo$),
        ranks: (0, 2, 1, 2, 0)
      
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Cực đại của hàm số là 4.]),
    True([Cực tiểu của hàm số là 3.]),
    True([$limits(max)_(RR) y = 4$.]),
    [$limits(min)_(RR) y = 3$.]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên, hàm số đạt cực đại tại $x = -1$ và $x = 1$, giá trị cực đại là $y = 4$. (Mệnh đề a đúng)]
    #step[*Bước 2:* Hàm số đạt cực tiểu tại $x = 0$, giá trị cực tiểu là $y = 3$. (Mệnh đề b đúng)]
    #step[*Bước 3:* Giá trị lớn nhất của hàm số trên $RR$ là $4$. (Mệnh đề c đúng)]
    #step[*Bước 4:* Khi $x -> +-oo$ thì $y -> -oo$ nên hàm số không có giá trị nhỏ nhất trên $RR$. (Mệnh đề d sai)]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    // Axes
    line((-3, 0), (7, 0), mark: (end: ">"), stroke: 0.5pt)
    content((7, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 4), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-2, -0.4), $-2$)
    content((-1.2, -0.4), $-1$)
    content((2, -0.4), $2$)
    content((6, -0.4), $6$)
    content((-0.45, -1), $-1$)
    content((-0.3, 1), $1$)
    content((-0.3, 2), $2$)
    content((-0.3, 3), $3$)
    
    // Dashed lines
    line((-2, 0), (-2, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 1.5), (6, 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((6, 0), (6, 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Curve
    bezier((-2, 2.5), (0, -1), (-1.2, 0.5), stroke: 1.2pt + blue)
    bezier((0, -1), (6, 1.5), (1.2, -1.2), (4, 3), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đạo hàm $y = f'(x)$ liên tục trên $RR$ và đồ thị hàm số $f'(x)$ trên đoạn $[-2;6]$ như hình vẽ bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    [$limits(max)_([-2;6]) f(x) = f(-1)$.],
    True([$limits(max)_([-2;6]) f(x) = f(6)$.]),
    [$limits(max)_([-2;6]) f(x) = f(-2)$.],
    True([$limits(min)_([-2;6]) f(x) = f(2)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị $f'(x)$ trên $[-2; 6]$. $f'(x) = 0$ tại $x = -1$ và $x = 2$.]
    #step[*Bước 2:* Trên $[-2; -1]$, $f'(x) > 0 => f(x)$ đồng biến. Trên $(-1; 2)$, $f'(x) < 0 => f(x)$ nghịch biến.]
    #step[*Bước 3:* Trên $(2; 6]$, $f'(x) > 0 => f(x)$ đồng biến. Tại $x = 2$, hàm số đạt cực tiểu nên $f(2)$ là giá trị nhỏ nhất trên $[-2; 6]$.]
    #step[*Bước 4:* So sánh cực đại $f(-1)$ và $f(6)$. Diện tích phần dương từ $2$ đến $6$ lớn hơn diện tích phần âm từ $-1$ đến $2$, do đó $integral_{-1}^6 f'(x) d x > 0 => f(6) > f(-1)$. Vậy $f(6)$ là giá trị lớn nhất.]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    // Axes
    line((-1.5, 0), (6.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((6.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((-0.25, -0.35), $O$)
    
    // Tick marks on x axis
    for x in (1, 3, 4) {
      line((x, -0.1), (x, 0.1), stroke: 0.5pt)
    }
    // Tick marks on y axis
    for y in (-1, 1, 2, 3) {
      line((-0.1, y), (0.1, y), stroke: 0.5pt)
    }
    
    // Labels
    content((2, -0.35), $2$)
    content((5, -0.35), $5$)
    
    // Dashed line
    line((5, 0), (5, 2.25), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Curve
    bezier((-0.5, 1.5), (2, 0), (-0.1, -1.8), (1, -1.8), stroke: 1.2pt + blue)
    bezier((2, 0), (5.5, 2.3), (3, 1.8), (4, 2.3), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đạo hàm $y = f'(x)$. Đồ thị hàm số $f'(x)$ được cho như hình vẽ bên. Biết rằng $f(0) + f(3) = f(2) + f(5)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số nghịch biến trên khoảng $(-oo; 0)$.],
    True([Hàm số nghịch biến trên khoảng $(0; 2)$.]),
    [$limits(min)_([0;5]) f(x) = f(0)$ và $limits(max)_([0;5]) f(x) = f(5)$.],
    True([$limits(min)_([0;5]) f(x) = f(2)$ và $limits(max)_([0;5]) f(x) = f(5)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Đồ thị $f'(x)$ cắt trục hoành tại $x=2$. Trên $(0; 2)$, $f'(x) < 0$ nên hàm số nghịch biến. Trên $(2; 5)$, $f'(x) > 0$ nên hàm đồng biến.]
    #step[*Bước 2:* Hàm số đạt cực tiểu tại $x=2$ nên $f(2)$ là giá trị nhỏ nhất trên $[0; 5]$.]
    #step[*Bước 3:* Giá trị lớn nhất sẽ là $f(0)$ hoặc $f(5)$. Ta có $f(0) + f(3) = f(2) + f(5)$. Do $f(3) > f(2)$ (vì đồng biến trên $(2;5)$), suy ra $f(5) > f(0)$.]
    #step[*Bước 4:* Vậy giá trị lớn nhất là $f(5)$. Các mệnh đề đúng là b và d.]
  ]
)

#my-ds(de: "Đề 1", 
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    // Axes
    line((-2.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-1, 0.4), $-1$)
    content((1, -0.35), $1$)
    content((4, -0.35), $4$)
    content((3.5, 1.8), $y = f'(x)$)
    
    // Curve
    bezier((-1.8, -1.8), (1, 0), (-1.2, 2.5), (0.2, 2.5), stroke: 1.2pt + blue)
    bezier((1, 0), (4.8, 2.2), (2, -3.2), (3.8, -3.2), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đạo hàm $y = f'(x)$ liên tục trên $RR$ và đồ thị hàm số $f'(x)$ như hình vẽ bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số có hai điểm cực trị.],
    [Hàm số $y = f(x)$ đồng biến trên khoảng $(1; +oo)$.],
    True([$f(1) > f(2) > f(4)$.]),
    True([Trên đoạn $[1;4]$ thì giá trị lớn nhất của hàm số $f(x)$ là $f(1)$.])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị $f'(x)$, $f'(x) = 0$ tại $x=1$ và có một nghiệm khác lớn hơn 4. Trên đoạn $[1; 4]$, $f'(x) <= 0$.]
    #step[*Bước 2:* Do đó hàm số $f(x)$ nghịch biến trên đoạn $[1; 4]$. Suy ra $f(1) > f(2) > f(4)$.]
    #step[*Bước 3:* Từ sự nghịch biến đó, giá trị lớn nhất của hàm số trên đoạn $[1; 4]$ đạt được tại $x=1$, tức là $f(1)$.]
    #step[*Bước 4:* Hàm số chỉ có 1 điểm cực trị trên toàn miền được vẽ là $x=1$ (đổi dấu từ $+$ sang $-$). Các mệnh đề c và d là đúng.]
  ]
)


#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Cho hàm số $f(x) = 4x^3 - 9x^2 - 30x$. Với các số nguyên $a, b$ mà $a < b$ thì giá trị nhỏ nhất của $f(b) - f(a)$ bằng bao nhiêu?],
  [$-81$],
  loigiai: [
    #step[*Bước 1:* Đạo hàm $f'(x) = 12x^2 - 18x - 30$. Giải $f'(x) = 0 <=> x = -1$ hoặc $x = (5)/(2)$.]
    #step[*Bước 2:* $f(x)$ đạt cực đại tại $x = -1$ và $f(-1) = 17$. $f(x)$ đạt cực tiểu tại $x = (5)/(2)$. Vì $a, b in ZZ$, ta xét các giá trị nguyên lân cận.]
    #step[*Bước 3:* Ta có $f(2) = -64$, $f(3) = -63$. Để $f(b) - f(a)$ nhỏ nhất với $a < b$, ta chọn $a$ tại cực đại nguyên và $b$ tại cực tiểu nguyên.]
    #step[*Bước 4:* Chọn $a = -1$, $b = 2$, ta được $f(2) - f(-1) = -64 - 17 = -81$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Gọi giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = sin^3 x - 2cos^2 x + 3sin x + 6$ trên $[0; pi]$ lần lượt là $M, m$. Tính tổng $M + m$.],
  [$14$],
  loigiai: [
    #step[*Bước 1:* Biến đổi $y = sin^3 x - 2(1 - sin^2 x) + 3sin x + 6 = sin^3 x + 2sin^2 x + 3sin x + 4$.]
    #step[*Bước 2:* Đặt $t = sin x$. Với $x in [0; pi]$, ta có $t in [0; 1]$. Xét $f(t) = t^3 + 2t^2 + 3t + 4$.]
    #step[*Bước 3:* Đạo hàm $f'(t) = 3t^2 + 4t + 3 > 0, forall t$. Hàm số đồng biến trên $[0; 1]$.]
    #step[*Bước 4:* Vậy $M = f(1) = 10$ và $m = f(0) = 4$. Suy ra $M + m = 14$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Cho hàm số $y = e^x(x^2 - 3)$, gọi $M = a/(e^b) (a in N, b in N)$ là giá trị lớn nhất của hàm số trên đoạn $[-5; -2]$. Tính giá trị của biểu thức $P = a + b$?],
  [$9$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = e^x(x^2 - 3)$ trên đoạn $[-5; -2]$. Đạo hàm $y' = e^x(x^2 - 3) + e^x dot 2x = e^x(x^2 + 2x - 3)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x^2 + 2x - 3 = 0 <=> x = 1 in.not [-5; -2]$ hoặc $x = -3 in [-5; -2]$.]
    #step[*Bước 3:* Tính các giá trị: $y(-5) = (22)/(e^5)$, $y(-3) = (6)/(e^3)$, $y(-2) = (1)/(e^2)$.]
    #step[*Bước 4:* So sánh: $(6)/(e^3) > (1)/(e^2) <=> 6 > e approx 2.71$ (đúng). Vậy GTLN là $(6)/(e^3)$. Suy ra $a = 6, b = 3 => P = 9$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 + 16/x$ trên đoạn $[1; 4]$],
  [$12$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x^2 + (16)/(x)$ trên đoạn $[1; 4]$. Đạo hàm $y' = 2x - (16)/(x^2) = (2x^3 - 16)/(x^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> 2x^3 - 16 = 0 <=> x^3 = 8 <=> x = 2 in [1; 4]$.]
    #step[*Bước 3:* Tính $y(1) = 17$, $y(2) = 4 + 8 = 12$, $y(4) = 16 + 4 = 20$.]
    #step[*Bước 4:* Vậy giá trị nhỏ nhất là $12$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Cho hàm số $y = x + 1/(x+2)$. Tìm giá trị nhỏ nhất của hàm số trên $[-1; 2]$],
  [$0$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = x + (1)/(x+2)$ trên đoạn $[-1; 2]$. Đạo hàm $y' = 1 - (1)/((x+2)^2) = ((x+2)^2 - 1)/((x+2)^2)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> (x+2)^2 = 1 <=> x = -1 in [-1; 2]$ hoặc $x = -3 in.not [-1; 2]$.]
    #step[*Bước 3:* Hàm số đồng biến trên $[-1; 2]$. Do đó giá trị nhỏ nhất đạt tại $x = -1$.]
    #step[*Bước 4:* Thay số: $y(-1) = -1 + 1 = 0$.]
  ]
)

#my-tln(de: "Đề 1", 
  dir: "ngang",
  [Một loại vi khuẩn được tiêm một loại thuốc kích thích sự sinh sản. Sau $t$ phút, số vi khuẩn được xác định theo công thức $N(t) = 1000 + 30t^2 - t^3$ $(0 <= t <= 30)$. Hỏi sau bao nhiêu giây thì số vi khuẩn lớn nhất?],
  [$1200$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số $N(t) = 1000 + 30t^2 - t^3$ với $0 <= t <= 30$. Đạo hàm $N'(t) = 60t - 3t^2$.]
    #step[*Bước 2:* Giải $N'(t) = 0 <=> 3t(20 - t) = 0 <=> t = 0$ hoặc $t = 20$.]
    #step[*Bước 3:* Lập bảng biến thiên, ta thấy $N(t)$ đạt cực đại và giá trị lớn nhất tại $t = 20$ (phút).]
    #step[*Bước 4:* Đề hỏi "sau bao nhiêu giây", ta đổi $20$ phút $= 20 times 60 = 1200$ giây.]
  ]
)




// ==================== Đề 2 ====================
#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = sqrt(x) + sqrt(4-x)$ trên đoạn $[0; 4]$.],
  (
    [$2$],
    [$4$],
    True([$2sqrt(2)$]),
    [$sqrt(2)$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [0; 4]$.]
    #step[*Bước 2:* Đạo hàm $y' = 1 / (2 sqrt(x)) - 1 / (2 sqrt(4-x))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> sqrt(x) = sqrt(4-x) <=> x = 4-x <=> x = 2$.]
    #step[*Bước 4:* Tính các giá trị: $y(0) = 2$, $y(4) = 2$, $y(2) = sqrt(2) + sqrt(2) = 2 sqrt(2)$.]
    #step[*Bước 5:* So sánh các giá trị, ta thấy giá trị lớn nhất là $2 sqrt(2)$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = cos x + sqrt(3) sin x$ trên đoạn $[0; pi]$.],
  (
    [$-2$],
    True([$-1$]),
    [$1$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Biến đổi hàm số: $y = cos x + sqrt(3) sin x = 2 (1 / 2 cos x + (sqrt(3)) / 2 sin x) = 2 sin(x + pi / 6)$.]
    #step[*Bước 2:* Xét $x in [0; pi]$, ta có $x + pi / 6 in [pi / 6; (7pi) / 6]$.]
    #step[*Bước 3:* Trên đoạn này, $sin(x + pi / 6)$ đạt giá trị nhỏ nhất tại $(7pi) / 6$ với $sin((7pi) / 6) = -1/2$.]
    #step[*Bước 4:* Vậy giá trị nhỏ nhất của hàm số là $2 dot (-1/2) = -1$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 - 8 ln x$ trên khoảng $(0; +oo)$.],
  (
    True([$4 - 8 ln 2$]),
    [$4 - 4 ln 2$],
    [$4$],
    [$2 - 8 ln 2$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = (0; +oo)$.]
    #step[*Bước 2:* Đạo hàm $y' = 2x - 8 / x = (2x^2 - 8) / x$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 2x^2 - 8 = 0 <=> x = 2$ (do $x > 0$).]
    #step[*Bước 4:* Lập bảng biến thiên, ta thấy hàm số đạt cực tiểu tại $x = 2$, đồng thời là giá trị nhỏ nhất trên $(0; +oo)$.]
    #step[*Bước 5:* Tính $y(2) = 2^2 - 8 ln 2 = 4 - 8 ln 2$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $ f(x) = cases(x^2 - 2x + 3 &"khi" x <= 1, 4 - x &"khi" x > 1) $ trên đoạn $[-1; 3]$.],
  (
    [$3$],
    [$2$],
    True([$6$]),
    [$4$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên $[-1; 1]$: $y = x^2 - 2x + 3$. Đạo hàm $y' = 2x - 2$, $y' = 0 <=> x = 1$. Giá trị $f(-1) = 6$, $f(1) = 2$.]
    #step[*Bước 2:* Xét hàm số trên $(1; 3]$: $y = 4 - x$. Đạo hàm $y' = -1 < 0$. Hàm số nghịch biến. $f(1^+) = 3$, $f(3) = 1$.]
    #step[*Bước 3:* So sánh các giá trị trên tập xác định $[-1; 3]$, ta thấy giá trị lớn nhất là $6$ (đạt tại $x = -1$).]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-3, 0), (4, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 3), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-2, -0.4), $-2$)
    content((1, 0.4), $1$)
    content((3, -0.4), $3$)
    
    // Curve
    bezier((-2, -1.5), (1, 0), (-1.2, -1.8), (0.2, -1.8), stroke: 1.2pt + blue)
    bezier((1, 0), (3, 2), (1.8, 1.8), (2.5, 2), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ liên tục trên $[-2; 3]$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ bên. Giá trị nhỏ nhất của hàm số $f(x)$ trên $[-2; 3]$ đạt được tại điểm nào?],
  (
    [$x = -2$],
    True([$x = 1$]),
    [$x = 3$],
    [$x = 0$]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào đồ thị $f'(x)$, ta thấy $f'(x) = 0$ tại $x = -2, 1, 3$.]
    #step[*Bước 2:* Trên khoảng $(-2; 1)$, phần đồ thị $f'(x)$ nằm dưới trục hoành nên $f'(x) < 0$, hàm số nghịch biến.]
    #step[*Bước 3:* Trên khoảng $(1; 3)$, phần đồ thị $f'(x)$ nằm trên trục hoành nên $f'(x) > 0$, hàm số đồng biến.]
    #step[*Bước 4:* Hàm số giảm trên $(-2; 1)$ và tăng trên $(1; 3)$, do đó đạt giá trị nhỏ nhất tại $x = 1$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x - sqrt(x)$ trên khoảng $(0; 1)$.],
  (
    True([$-1/4$]),
    [$-1/2$],
    [$0$],
    [$-1/8$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [0; +oo)$. Xét trên khoảng $(0; 1)$.]
    #step[*Bước 2:* Đạo hàm $y' = 1 - 1 / (2 sqrt(x))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 2 sqrt(x) = 1 <=> sqrt(x) = 1 / 2 <=> x = 1 / 4$.]
    #step[*Bước 4:* Lập bảng biến thiên, $y'$ đổi dấu từ âm sang dương tại $x = 1 / 4$.]
    #step[*Bước 5:* Giá trị nhỏ nhất là $y(1 / 4) = 1 / 4 - 1 / 2 = -1 / 4$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = 3 sqrt(x - 1) + 4 sqrt(5 - x)$ trên tập xác định của nó.],
  (
    [$5$],
    True([$10$]),
    [$2sqrt(5)$],
    [$5sqrt(2)$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [1; 5]$.]
    #step[*Bước 2:* Áp dụng bất đẳng thức Cauchy-Bunyakovsky: $y^2 = (3 sqrt(x-1) + 4 sqrt(5-x))^2 <= (3^2 + 4^2)(x - 1 + 5 - x)$.]
    #step[*Bước 3:* Suy ra $y^2 <= 25 dot 4 = 100 => y <= 10$.]
    #step[*Bước 4:* Dấu bằng xảy ra khi $(sqrt(x-1)) / 3 = (sqrt(5-x)) / 4 <=> x = 61 / 25 in [1; 5]$. Vậy $max y = 10$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = (sin x + 1)/(sin x + 2)$.],
  (
    [$0$],
    [$1$],
    True([$2/3$]),
    [$1/2$]
  ),
  loigiai: [
    #step[*Bước 1:* Đặt $t = sin x$, điều kiện $t in [-1; 1]$.]
    #step[*Bước 2:* Hàm số trở thành $g(t) = (t+1) / (t+2)$ trên $[-1; 1]$.]
    #step[*Bước 3:* Đạo hàm $g'(t) = 1 / (t+2)^2 > 0, forall t in [-1; 1]$.]
    #step[*Bước 4:* Hàm số đồng biến nên đạt giá trị lớn nhất tại $t = 1$.]
    #step[*Bước 5:* Giá trị lớn nhất là $g(1) = (1+1) / (1+2) = 2 / 3$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = x sqrt(4 - x^2)$ trên đoạn $[-2; 2]$.],
  (
    True([$2$]),
    [$4$],
    [$sqrt(2)$],
    [$1$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [-2; 2]$.]
    #step[*Bước 2:* Đạo hàm $y' = sqrt(4-x^2) + x dot (-x) / (sqrt(4-x^2)) = (4-2x^2) / (sqrt(4-x^2))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 4 - 2x^2 = 0 <=> x = +-sqrt(2)$.]
    #step[*Bước 4:* Tính $y(-2) = 0$, $y(2) = 0$, $y(-sqrt(2)) = -2$, $y(sqrt(2)) = 2$.]
    #step[*Bước 5:* Giá trị lớn nhất là $2$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = (x-2)e^x$ trên đoạn $[0; 3]$.],
  (
    True([$e^3$]),
    [$-e$],
    [$-2$],
    [$2e^3$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên đoạn $[0; 3]$. Đạo hàm $y' = e^x + (x-2)e^x = (x-1)e^x$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 1$ (do $e^x > 0$).]
    #step[*Bước 3:* Tính các giá trị: $y(0) = -2$, $y(1) = -e$, $y(3) = e^3$.]
    #step[*Bước 4:* So sánh, ta thấy giá trị lớn nhất là $e^3$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "doc",lines: 0,
  [Cho hàm số $y = f(x)$ liên tục trên nửa khoảng $[-3; 2)$ và có bảng biến thiên như hình vẽ dưới:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'(x)$,
        func: $f(x)$,
        x-vals: ($-3$, $0$, $2$),
        d-signs: ("+", "0", "-"),
        v-vals: ($3$, $-1$, $4$),
        // ranks: (2, 0, 3)
        w1: 1.25,
        w2: 6,
      )
    ]
    Mệnh đề nào sau đây đúng?],
  (
    True([$limits(min)_([-3;2)) y = -1$ và không tồn tại giá trị lớn nhất của hàm số.]),
    [$limits(min)_([-3;2)) y = -1$ và $limits(max)_([-3;2)) y = 4$.],
    [Hàm số không có giá trị lớn nhất và không có giá trị nhỏ nhất.],
    [$limits(max)_([-3;2)) y = 3$.]
  ),
  loigiai: [
    #step[*Bước 1:* Dựa vào bảng biến thiên trên nửa khoảng $[-3; 2)$.]
    #step[*Bước 2:* Hàm số đạt cực tiểu và giá trị nhỏ nhất tại $x = 0$ với $y = -1$.]
    #step[*Bước 3:* Hàm số tăng lên đến $4$ khi $x -> 2$, nhưng do tập xác định không chứa $2$ nên hàm số không có giá trị lớn nhất.]
    #step[*Bước 4:* Vậy mệnh đề đúng là $min y = -1$ và không tồn tại giá trị lớn nhất.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 - x - ln x$ trên khoảng $(0; +oo)$.],
  (
    True([$0$]),
    [$1$],
    [$-1$],
    [$e$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = (0; +oo)$.]
    #step[*Bước 2:* Đạo hàm $y' = 2x - 1 - 1 / x = (2x^2 - x - 1) / x$.]
    #step[*Bước 3:* Giải $y' = 0 <=> 2x^2 - x - 1 = 0 <=> x = 1$ (nhận) hoặc $x = -1 / 2$ (loại).]
    #step[*Bước 4:* Lập bảng biến thiên, thấy hàm số đạt cực tiểu và nhỏ nhất tại $x = 1$.]
    #step[*Bước 5:* Giá trị nhỏ nhất là $y(1) = 1^2 - 1 - ln 1 = 0$.]
  ]
)
#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $ f(x) = cases(2 - x^2 &"khi" x <= 0, cos x + 1 &"khi" x > 0) $ trên đoạn $[-1; pi]$.],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số $y = 2 - x^2$ trên $[-1; 0]$. Đạo hàm $y' = -2x >= 0$. Giá trị lớn nhất trên đoạn này là $f(0) = 2$.]
    #step[*Bước 2:* Xét hàm số $y = cos x + 1$ trên $(0; pi]$. Giá trị lớn nhất là cận $lim_(x -> 0^+) (cos x + 1) = 2$, và các giá trị thực tế đều nhỏ hơn $2$.]
    #step[*Bước 3:* So sánh, giá trị lớn nhất của hàm số trên toàn đoạn là $2$ (đạt tại $x = 0$).]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x - 2 sqrt(x - 1)$ trên nửa khoảng $[1; +oo)$.],
  (
    [$1$],
    True([$0$]),
    [$-1$],
    [$2$]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [1; +oo)$.]
    #step[*Bước 2:* Đạo hàm $y' = 1 - 1 / (sqrt(x-1))$.]
    #step[*Bước 3:* Giải $y' = 0 <=> sqrt(x-1) = 1 <=> x - 1 = 1 <=> x = 2$.]
    #step[*Bước 4:* Lập bảng biến thiên, $y'$ đổi dấu từ âm sang dương tại $x = 2$, đây là cực tiểu.]
    #step[*Bước 5:* Tính $y(2) = 2 - 2 sqrt(1) = 0$. Giá trị nhỏ nhất là $0$.]
  ]
)

#my-tn(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = (x - 3) e^x$ trên đoạn $[0; 4]$.],
  (
    [$-e^2$],
    True([$e^4$]),
    [$-3$],
    [$e^2$]
  ),
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên đoạn $[0; 4]$. Đạo hàm $y' = e^x + (x-3)e^x = (x-2)e^x$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 2$.]
    #step[*Bước 3:* Tính các giá trị: $y(0) = -3$, $y(2) = -e^2$, $y(4) = e^4$.]
    #step[*Bước 4:* So sánh, ta thấy giá trị lớn nhất là $e^4$.]
  ]
)


#my-ds(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $f(x) = sqrt(3 + cos x)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR$.]),
    True([Giá trị lớn nhất của hàm số là $2$.]),
    True([Giá trị nhỏ nhất của hàm số là $sqrt(2)$.]),
    [Hàm số đạt giá trị nhỏ nhất tại các điểm $x = k 2pi$ ($k in ZZ$).]
  ),
  loigiai: [
    #step[*Bước 1:* Vì $-1 <= cos x <= 1, forall x in RR$, nên $3 + cos x >= 2 > 0$. Vậy TXĐ $D = RR$. (Mệnh đề a đúng)]
    #step[*Bước 2:* Giá trị lớn nhất đạt được khi $cos x = 1 => f(x) = sqrt(4) = 2$. (Mệnh đề b đúng)]
    #step[*Bước 3:* Giá trị nhỏ nhất đạt được khi $cos x = -1 => f(x) = sqrt(2)$. (Mệnh đề c đúng)]
    #step[*Bước 4:* Hàm số đạt GTNN khi $cos x = -1 <=> x = pi + k 2pi$. (Mệnh đề d sai vì $x = k 2pi$ thì $cos x = 1$ cho GTLN)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2, 0), (5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2), (0, 3), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-1, -0.4), $-1$)
    content((2, -0.4), $2$)
    content((4, -0.4), $4$)
    
    // Curve
    bezier((-1, 1.5), (0, 2), (-0.5, 2), stroke: 1.2pt + blue)
    bezier((0, 2), (2, -1.2), (0.8, -1.2), (1.5, -1.2), stroke: 1.2pt + blue)
    bezier((2, -1.2), (4, 1.8), (2.8, 1.8), (3.5, 1.8), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-1; 4]$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số nghịch biến trên khoảng $(0; 2)$.]),
    [Điểm cực đại của hàm số là $x = 2$.],
    True([Giá trị nhỏ nhất của hàm số trên đoạn $[-1; 4]$ có thể đạt được tại $x = 2$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[-1; 4]$ có thể đạt được tại $x = 0$.])
  ),
  loigiai: [
    #step[*Bước 1:* Quan sát đồ thị $f'(x)$, ta thấy đồ thị cắt trục hoành tại điểm $x_1 in (0; 2)$ và $x_2 in (2; 4)$. Hàm số đồng biến rồi nghịch biến trên $(0; 2)$. (Mệnh đề a sai)]
    #step[*Bước 2:* $f'(x)$ đổi dấu từ dương sang âm tại $x_1 in (0; 2)$ nên $x_1$ là cực đại. Tại $x=2$ đạo hàm âm. (Mệnh đề b sai)]
    #step[*Bước 3:* GTNN trên $[-1; 4]$ có thể đạt tại $x = -1, x_2$, không thể tại $x=2$ vì hàm số đang nghịch biến tại đó. (Mệnh đề c sai)]
    #step[*Bước 4:* GTLN có thể đạt tại cực đại $x_1$ hoặc điểm biên $x=4$, không thể tại $x=0$. (Mệnh đề d sai)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $f(x) = 2 sin x - 4/3 sin^3 x$ trên đoạn $[0; pi]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Bằng cách đặt $t = sin x$, ta tìm giá trị lớn nhất và nhỏ nhất của hàm số $g(t) = 2t - 4/3 t^3$ trên đoạn $[0; 1]$.]),
    True([Hàm số $g(t) = 2t - 4/3 t^3$ đồng biến trên khoảng $(0; 1/2)$.]),
    True([Giá trị lớn nhất của hàm số $f(x)$ trên đoạn $[0; pi]$ bằng $(2sqrt(2))/3$.]),
    [Giá trị nhỏ nhất của hàm số $f(x)$ trên đoạn $[0; pi]$ bằng $2/3$.]
  ),
  loigiai: [
    #step[*Bước 1:* Đặt $t = sin x$. Vì $x in [0; pi]$ nên $t in [0; 1]$. Hàm số trở thành $g(t) = 2t - (4)/3 t^3$. (Mệnh đề a đúng)]
    #step[*Bước 2:* Đạo hàm $g'(t) = 2 - 4t^2$. Xét $g'(t) > 0 <=> t^2 < 1 / 2 <=> t in [0; sqrt(2)/2)$. Khoảng $(0; 1/2)$ nằm trong khoảng này nên hàm số đồng biến. (Mệnh đề b đúng)]
    #step[*Bước 3:* Hàm số đạt GTLN tại $t = sqrt(2)/2$. Thay vào ta được $g(sqrt(2)/2) = (2 sqrt(2)) / 3$. (Mệnh đề c đúng)]
    #step[*Bước 4:* GTNN trên $[0; 1]$ đạt tại $t = 0$ với $g(0) = 0$. (Mệnh đề d sai vì tính ra $2/3$ là $g(1)$)]
  ]
)

#my-ds(de: "Đề 2", 
  dir: "doc",
  [Cho hàm số $f(x) = x - ln(x+1)$ trên đoạn $[0; 2]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên đoạn $[0; 2]$.]),
    True([Giá trị nhỏ nhất của hàm số trên đoạn $[0; 2]$ là $0$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[0; 2]$ là $2 - ln 3$.]),
    [Hàm số đạt giá trị nhỏ nhất tại $x = 1$.]
  ),
  loigiai: [
    #step[*Bước 1:* Tập xác định của $f(x)$ trên $[0; 2]$. Đạo hàm $f'(x) = 1 - 1 / (x+1) = x / (x+1)$.]
    #step[*Bước 2:* Với $x in [0; 2]$, $f'(x) >= 0$, hàm số đồng biến. (Mệnh đề a đúng)]
    #step[*Bước 3:* GTNN đạt tại biên $x = 0$, $f(0) = 0$. (Mệnh đề b đúng)]
    #step[*Bước 4:* GTLN đạt tại biên $x = 2$, $f(2) = 2 - ln 3$. (Mệnh đề c đúng)]
    #step[*Bước 5:* Hàm số đồng biến nên đạt GTNN tại $x = 0$. (Mệnh đề d sai)]
  ]
)


#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = root(3, (x-1)^2)$ trên đoạn $[0; 9]$.],
  [$4$],
  loigiai: [
    #step[*Bước 1:* Hàm số $y = root(3, (x-1)^2)$ xác định trên $[0; 9]$.]
    #step[*Bước 2:* Đạo hàm $y' = 2 / 3 (x-1)^(-1 / 3) = 2 / (3 root(3, x-1))$. Đạo hàm không xác định tại $x = 1$.]
    #step[*Bước 3:* Tính $y(0) = 1$, $y(1) = 0$, $y(9) = root(3, 8^2) = 4$.]
    #step[*Bước 4:* Giá trị lớn nhất là $4$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = 2(sin^4 x + cos^4 x)$.],
  [$1$],
  loigiai: [
    #step[*Bước 1:* Biến đổi $y = 2(sin^4 x + cos^4 x) = 2( (sin^2 x + cos^2 x)^2 - 2 sin^2 x cos^2 x )$.]
    #step[*Bước 2:* Suy ra $y = 2(1 - 1 / 2 sin^2 2x) = 2 - sin^2 2x$.]
    #step[*Bước 3:* Vì $0 <= sin^2 2x <= 1$, nên $2 - 1 <= y <= 2 - 0$.]
    #step[*Bước 4:* Giá trị nhỏ nhất là $1$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của hàm số $y = x^2 - 2x + 2 ln x$ trên đoạn $[1; 3]$.],
  [$-1$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên đoạn $[1; 3]$. Đạo hàm $y' = 2x - 2 + 2 / x = (2x^2 - 2x + 2) / x$.]
    #step[*Bước 2:* Tam thức $2x^2 - 2x + 2$ có $Delta' = 1 - 4 = -3 < 0$ nên $2x^2 - 2x + 2 > 0$. Suy ra $y' > 0, forall x in [1; 3]$.]
    #step[*Bước 3:* Hàm số đồng biến trên $[1; 3]$, do đó giá trị nhỏ nhất đạt tại $x = 1$.]
    #step[*Bước 4:* $y(1) = 1^2 - 2(1) + 2 ln 1 = -1$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Cho hàm số $y = x^2 e^(-x)$ trên đoạn $[1; 4]$. Biết giá trị lớn nhất của hàm số đạt được tại điểm $x_0$. Tìm giá trị của $x_0$.],
  [$2$],
  loigiai: [
    #step[*Bước 1:* Xét hàm số trên $[1; 4]$. Đạo hàm $y' = 2x e^(-x) - x^2 e^(-x) = x(2-x)e^(-x)$.]
    #step[*Bước 2:* Giải $y' = 0 <=> x = 2$ (do $x in [1; 4]$).]
    #step[*Bước 3:* Tính $y(1) = 1 / e$, $y(2) = 4 / e^2$, $y(4) = 16 / e^4$.]
    #step[*Bước 4:* So sánh thấy $4 / e^2$ là giá trị lớn nhất, đạt được tại $x_0 = 2$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = sqrt(x - 2) + sqrt(10 - x)$.],
  [$4$],
  loigiai: [
    #step[*Bước 1:* Tập xác định $D = [2; 10]$.]
    #step[*Bước 2:* Áp dụng Cauchy-Bunyakovsky: $y^2 = (sqrt(x-2) + sqrt(10-x))^2 <= (1^2 + 1^2)(x-2 + 10-x) = 2 dot 8 = 16$.]
    #step[*Bước 3:* Suy ra $y <= 4$.]
    #step[*Bước 4:* Dấu bằng xảy ra khi $sqrt(x-2) = sqrt(10-x) <=> x = 6 in [2; 10]$. Vậy giá trị lớn nhất là $4$.]
  ]
)

#my-tln(de: "Đề 2", 
  dir: "ngang",
  [Tìm giá trị lớn nhất của hàm số $y = sin^2 x - 4 sin x + 5$.],
  [$10$],
  loigiai: [
    #step[*Bước 1:* Đặt $t = sin x, t in [-1; 1]$.]
    #step[*Bước 2:* Hàm số thành $y = t^2 - 4t + 5 = (t-2)^2 + 1$.]
    #step[*Bước 3:* Vì $t in [-1; 1]$ nên $t - 2 in [-3; -1]$, suy ra $(t-2)^2 in [1; 9]$.]
    #step[*Bước 4:* Do đó $y = (t-2)^2 + 1 <= 9 + 1 = 10$.]
    #step[*Bước 5:* Dấu bằng xảy ra khi $t = -1 <=> sin x = -1 <=> x = -pi / 2 + k 2pi$. Giá trị lớn nhất là $10$.]
  ]
)




// ==================== Đề 3 ====================
#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-0.2, 2.5), (-0.2, -0.5), stroke: 3pt + gray)
    content((-0.5, 1.0), [Tường], rotate: 90deg)
    rect((0, 0), (2.5, 2), stroke: 1.2pt + blue, fill: blue.lighten(95%))
    content((1.25, -0.45), $y$)
    content((2.95, 1), $x$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một người nông dân muốn rào một khu vườn hình chữ nhật sát một bức tường thẳng (không cần rào phía bức tường). Người đó có $60$ m lưới. Tìm diện tích lớn nhất của khu vườn mà người đó có thể rào được.],
  (
    [$300 "m"^2$],
    True([$450 "m"^2$]),
    [$900 "m"^2$],
    [$225 "m"^2$]
  ),
  loigiai: [
    #step[Gọi $y$ là chiều dài hàng rào song song với tường, $x$ là hai cạnh vuông góc. Ta có chu vi rào là $2x + y = 60 => y = 60 - 2x$ (với $0 < x < 30$).]
    #step[Diện tích khu vườn $S = x y = x(60 - 2x) = 60x - 2x^2$.]
    #step[Đạo hàm $S' = 60 - 4x = 0 <=> x = 15$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $15$, $30$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $450$, $0$)
        
      )
      ]
      Từ BBT suy ra diện tích lớn nhất $S_"max" = 450$ ($"m"^2$).]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    rect((0, 0), (3, 2), stroke: 1.2pt + blue, fill: blue.lighten(95%))
    line((1, 0), (1, 2), stroke: 1.2pt + blue)
    line((2, 0), (2, 2), stroke: 1.2pt + blue)
    content((0.5, 1), $x$)
    content((1.5, 1), $x$)
    content((2.5, 1), $x$)
    content((1.5, -0.45), $y$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một nông dân muốn chia một mảnh đất hình chữ nhật thành ba chuồng bò hình chữ nhật bằng hai hàng rào song song với chiều rộng của mảnh đất. Tổng chiều dài các hàng rào là $120$ m. Tìm diện tích lớn nhất của mảnh đất.],
  (
    True([$450 "m"^2$]),
    [$900 "m"^2$],
    [$600 "m"^2$],
    [$300 "m"^2$]
  ),
  loigiai: [
    #step[Gọi $x$ là chiều dài các hàng rào ngăn (có 4 rào chiều $x$) và $y$ là 2 chiều dài của mảnh đất. Ta có $4x + 2y = 120 => 2x + y = 60 => y = 60 - 2x$.]
    #step[Diện tích mảnh đất là $S = x y = x(60 - 2x) = 60x - 2x^2$.]
    #step[Đạo hàm $S' = 60 - 4x = 0 <=> x = 15$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $15$, $30$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $450$, $0$)
        
      )
      ]
      Vậy diện tích lớn nhất là $450$ ($"m"^2$).]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-0.5, -0.2), (3.5, -0.2), stroke: 3pt + gray)
    content((1.5, -0.65), [Đường lộ])
    rect((0, 0), (3, 1.8), stroke: 1.2pt + blue, fill: blue.lighten(95%))
    content((1.5, 0.9), $S = 200 "m"^2$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình chữ nhật có diện tích $200 "m"^2$. Một mặt của mảnh đất giáp đường nên chi phí xây rào là $300.000$ đồng/m, ba mặt còn lại chi phí xây rào là $100.000$ đồng/m. Chi phí nhỏ nhất để rào toàn bộ mảnh đất là bao nhiêu?],
  (
    True([$8$ triệu đồng]),
    [$10$ triệu đồng],
    [$6$ triệu đồng],
    [$12$ triệu đồng]
  ),
  loigiai: [
    #step[Gọi $x$ là chiều dài mặt giáp đường và $y$ là cạnh vuông góc. Có $x y = 200 => y = (200) / (x)$.]
    #step[Tổng chi phí $C = 300x + 100x + 100(2y) = 400x + 200y$ (nghìn đồng).]
    #step[Thay $y$, $C(x) = 400x + (40000) / (x)$ với $x > 0$.]
    #step[Đạo hàm $C'(x) = 400 - (40000) / (x^2) = 0 <=> x^2 = 100 <=> x = 10$. Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $10$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $8000$, $+oo$)
        
      )
      ]
      Chi phí thấp nhất là $8000$ (nghìn đồng) tức $8$ triệu đồng.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    rect((-1, 0), (1, 1.2), stroke: 1.2pt)
    arc((1, 1.2), start: 0deg, stop: 180deg, radius: 1, stroke: 1.2pt)
    line((-1, 1.2), (1, 1.2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một cửa sổ có dạng phía dưới là hình chữ nhật, phía trên là một nửa hình tròn. Chu vi cửa sổ là $4 + pi$ m. Để diện tích cửa sổ là lớn nhất thì chiều rộng của cửa sổ bằng bao nhiêu?],
  (
    [$1$ m],
    True([$2$ m]),
    [$1.5$ m],
    [$2.5$ m]
  ),
  loigiai: [
    #step[Gọi bán kính nửa đường tròn là $R$, chiều rộng là $2R$, chiều cao HCN là $h$. Chu vi $2h + 2R + pi R = 4 + pi => h = 2 + (pi)/(2) - R(1 + (pi)/(2))$.]
    #step[Diện tích $S = 2R h + (1)/(2) pi R^2 = 2R(2 + (pi)/(2) - R(1 + (pi)/(2))) + (1)/(2) pi R^2$.]
    #step[Thu gọn $S = (4+pi)R - (2 + (pi)/(2))R^2$. Đạo hàm $S' = (4+pi) - (4+pi)R = 0 <=> R = 1$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $R$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $1$, $+oo$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $S_"max"$, $-oo$)
        
      )
      ]
      Chiều rộng cửa sổ để đón được nhiều ánh sáng nhất là $2R = 2$ m.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-1, 0), (7, 0), stroke: 1.5pt + blue)
    content((7, 0), $d$, anchor: "south-west")
    circle((1, 2), radius: 1.5pt, fill: black)
    content((1, 2), $A$, anchor: "south")
    circle((5, 3.33), radius: 1.5pt, fill: black)
    content((5, 3.33), $B$, anchor: "south")
    line((1, 2), (1, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((5, 3.33), (5, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    circle((2.5, 0), radius: 1.5pt, fill: red)
    content((2.5, 0.35), $P$, anchor: "south")
    line((1, 2), (2.5, 0), stroke: 1.2pt + green.darken(20%))
    line((2.5, 0), (5, 3.33), stroke: 1.2pt + green.darken(20%))
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Hai làng $A$ và $B$ nằm về cùng một phía của một con sông thẳng $d$. Khoảng cách từ $A$ và $B$ đến con sông lần lượt là $3$ km và $5$ km. Khoảng cách giữa hình chiếu của $A$ và $B$ trên bờ sông là $6$ km. Người ta muốn xây dựng một trạm bơm nước trên bờ sông để dẫn nước về hai làng. Tổng chiều dài đường ống dẫn nước ngắn nhất là bao nhiêu?],
  (
    True([$10$ km]),
    [$12$ km],
    [$8$ km],
    [$2sqrt(34)$ km]
  ),
  loigiai: [
    #step[Gọi $A'$ là điểm đối xứng của $A$ qua đường thẳng $d$. Ta có $A P + P B = A' P + P B >= A' B$.]
    #step[Khoảng cách ngắn nhất chính là độ dài đoạn $A' B$.]
    #step[Khoảng cách từ $A', B$ đến đường thẳng chứa hình chiếu (dài $6$ km) tạo thành tam giác vuông có hai cạnh góc vuông là $6$ và $3 + 5 = 8$.]
    #step[Suy ra $A' B = sqrt(6^2 + 8^2) = 10$ km.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((0, 2.5), (0, 0), (3.5, 0), close: true, stroke: 1.2pt)
    line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.5pt)
    content((1.8, 1.5), [10 m], rotate: -35deg)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình tam giác vuông có cạnh huyền dài $10$ m. Diện tích lớn nhất của mảnh đất đó bằng bao nhiêu?],
  (
    [$50 "m"^2$],
    True([$25 "m"^2$]),
    [$25sqrt(2) "m"^2$],
    [$100 "m"^2$]
  ),
  loigiai: [
    #step[Gọi hai cạnh góc vuông là $x, y$. Ta có $x^2 + y^2 = 100 => y = sqrt(100 - x^2)$.]
    #step[Diện tích $S = (1)/(2) x y = (1)/(2) x sqrt(100 - x^2)$. Đạo hàm $S' = (1)/(2) sqrt(100-x^2) - (x^2)/(2sqrt(100-x^2)) = (100 - 2x^2)/(2sqrt(100-x^2))$.]
    #step[Giải $S' = 0 <=> x^2 = 50 <=> x = 5 sqrt(2)$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $5 sqrt(2)$, $10$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $25$, $0$)
        
      )
      ]
      Diện tích lớn nhất là $25$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((0, 4), (0, 0), (4, 0), stroke: 1.5pt)
    line((1, 4), (1, 1.5), (4, 1.5), stroke: 1.5pt)
    line((0, 2.25), (3, 0), stroke: 1.5pt + red)
    line((0, 3.5), (1, 3.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((0.5, 3.8), $1 "m"$)
    line((3.5, 0), (3.5, 1.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((3.9, 0.75), $8 "m"$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một người muốn mang một thanh sào dài qua một góc hành lang chữ L có chiều rộng hai lối đi lần lượt là $1$ m và $8$ m (hai lối đi vuông góc với nhau). Thanh sào được khống chế đi song song với mặt đất. Chiều dài lớn nhất của thanh sào để có thể đi qua góc cua là bao nhiêu?],
  (
    True([$5sqrt(5)$ m]),
    [$9$ m],
    [$3sqrt(3)$ m],
    [$7$ m]
  ),
  loigiai: [
    #step[Gọi $theta$ là góc nghiêng của thanh sào. Chiều dài lớn nhất thanh sào lọt qua là giá trị nhỏ nhất của $L(theta) = (1)/(cos theta) + (8)/(sin theta)$.]
    #step[Đạo hàm $L'(theta) = (sin theta)/(cos^2 theta) - (8 cos theta)/(sin^2 theta) = (sin^3 theta - 8 cos^3 theta)/(sin^2 theta cos^2 theta)$.]
    #step[Giải $L'(theta) = 0 <=> tan^3 theta = 8 <=> tan theta = 2$.]
    #step[Khi $tan theta = 2$, $sin theta = (2)/(sqrt(5))$ và $cos theta = (1)/(sqrt(5))$. BBT sẽ cho thấy đây là cực tiểu.]
    #step[$L_"min" = (1)/((1)/(sqrt(5))) + (8)/((2)/(sqrt(5))) = sqrt(5) + 4 sqrt(5) = 5 sqrt(5)$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    rect((0, 0), (3, 4), stroke: 1.2pt)
    rect((0.4, 0.6), (2.6, 3.4), stroke: 0.8pt + blue, fill: blue.lighten(95%))
    content((1.5, 2), $32 "cm"^2$)
    content((1.5, 3.7), $2 "cm"$)
    content((1.5, 0.3), $2 "cm"$)
    content((0.2, 2), $1 "cm"$, rotate: 90deg)
    content((2.8, 2), $1 "cm"$, rotate: -90deg)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một trang quảng cáo hình chữ nhật cần có diện tích phần in ấn là $32 "cm"^2$. Lề trên và lề dưới rộng $2$ cm, lề trái và lề phải rộng $1$ cm. Diện tích nhỏ nhất của toàn bộ trang quảng cáo là bao nhiêu?],
  (
    True([$72 "cm"^2$]),
    [$64 "cm"^2$],
    [$80 "cm"^2$],
    [$50 "cm"^2$]
  ),
  loigiai: [
    #step[Gọi kích thước phần in ấn là $x, y$. Ta có $x y = 32 => y = (32)/(x)$.]
    #step[Trang quảng cáo có kích thước là $(x+2)$ và $(y+4)$.]
    #step[Diện tích toàn trang $S(x) = (x+2)( (32)/(x) + 4 ) = 32 + 4x + (64)/(x) + 8 = 40 + 4x + (64)/(x)$.]
    #step[Đạo hàm $S'(x) = 4 - (64)/(x^2) = 0 <=> x = 4$. BBT cho thấy đây là điểm cực tiểu.]
    #step[$S_"min" = 40 + 16 + 16 = 72$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-3, 2.6), (-1.5, 0), (1.5, 0), (3, 2.6), stroke: 1.2pt)
    line((1.5, 0), (3.5, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0, -0.45), $10 "cm"$)
    content((2.6, 1.3), $10 "cm"$, rotate: 60deg)
    content((-2.6, 1.3), $10 "cm"$, rotate: -60deg)
    arc((1.5, 0), start: 0deg, stop: 60deg, radius: 0.7, stroke: 0.5pt)
    content((2.5, 0.5), $theta$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một máng nước bằng tôn được tạo thành bằng cách gập hai bên của một tấm tôn phẳng rộng $30$ cm lên một góc $theta$ sao cho mặt cắt ngang là hình thang cân gồm đáy dài $10$ cm và hai bên mỗi bên dài $10$ cm. Để máng nước có diện tích mặt cắt lớn nhất thì góc $theta$ bằng bao nhiêu?],
  (
    True([$60°$]),
    [$45°$],
    [$30°$],
    [$75°$]
  ),
  loigiai: [
    #step[Mặt cắt ngang có đáy nhỏ $10$, 2 cạnh bên $10$, gập góc $theta$.]
    #step[Chiều cao máng $h = 10 sin theta$. Đáy lớn là $10 + 20 cos theta$.]
    #step[Diện tích $S = (10 + 10 + 20 cos theta)/(2) dot 10 sin theta = 100(1 + cos theta)sin theta$.]
    #step[Đạo hàm $S' = 100(2 cos^2 theta + cos theta - 1) = 0 <=> cos theta = (1)/(2) <=> theta = 60^degree$.]
    #step[BBT cho thấy cực đại tại $theta = 60^degree$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    arc((3, 0), start: 0deg, stop: 180deg, radius: 3, stroke: 1.2pt)
    line((-3.5, 0), (3.5, 0), stroke: 0.8pt)
    rect((-2, 0), (2, 2.23), stroke: 1pt + blue, fill: blue.lighten(95%))
    circle((0, 0), radius: 1pt, fill: black)
    content((0, -0.45), $O$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình chữ nhật được trồng cỏ nằm trong một khuôn viên hình bán nguyệt có bán kính $10$ m. Một cạnh của mảnh đất nằm trên đường kính của bán nguyệt, hai đỉnh còn lại nằm trên đường cung tròn. Diện tích lớn nhất của mảnh đất trồng cỏ đó là bao nhiêu?],
  (
    True([$100 "m"^2$]),
    [$50 "m"^2$],
    [$50sqrt(2) "m"^2$],
    [$200 "m"^2$]
  ),
  loigiai: [
    #step[Gọi $x$ là nửa chiều dài mặt đáy, $y$ là chiều cao HCN. Mảnh đất nằm trong bán nguyệt bán kính $10$ nên $x^2 + y^2 = 100 => y = sqrt(100 - x^2)$.]
    #step[Diện tích HCN là $S(x) = 2x sqrt(100 - x^2)$.]
    #step[Đạo hàm $S'(x) = 2(sqrt(100-x^2) - (x^2)/(sqrt(100-x^2))) = (200 - 4x^2)/(sqrt(100-x^2))$.]
    #step[$S'(x) = 0 <=> x^2 = 50 <=> x = 5 sqrt(2)$. BBT cho thấy đây là cực đại. Diện tích lớn nhất là $100$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    let pts = ()
    for i in range(-30, 31) {
      let x = i / 10
      let y = 3 - 0.33 * x * x
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + green.darken(20%))
    line((-3.8, 0), (3.8, 0), stroke: 0.8pt)
    rect((-1.73, 0), (1.73, 2), stroke: 1pt + blue, fill: blue.lighten(95%))
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một cổng chào có dạng một parabol với chiều cao $9$ m và chiều rộng chân cổng là $6$ m. Người ta muốn treo một tấm bảng quảng cáo hình chữ nhật bên trong cổng sao cho hai đỉnh dưới nằm trên mặt đất và hai đỉnh trên thuộc parabol. Diện tích lớn nhất của tấm bảng quảng cáo là bao nhiêu?],
  (
    True([$12sqrt(3) "m"^2$]),
    [$18 "m"^2$],
    [$24 "m"^2$],
    [$16sqrt(2) "m"^2$]
  ),
  loigiai: [
    #step[Chọn hệ trục tọa độ sao cho đỉnh parabol trên trục $O y$. Parabol đi qua $(0, 9)$ và $(+-3, 0)$, phương trình là $y = 9 - x^2$.]
    #step[Giả sử đỉnh bảng quảng cáo là $(x, y)$ với $x in (0; 3)$, thì kích thước bảng là $2x$ và $y = 9 - x^2$.]
    #step[Diện tích $S = 2x(9 - x^2) = 18x - 2x^3$.]
    #step[Đạo hàm $S' = 18 - 6x^2 = 0 <=> x = sqrt(3)$. BBT cho cực đại tại đây.]
    #step[$S_"max" = 2 sqrt(3) (9 - 3) = 12 sqrt(3)$.]
  ]
)

#my-tn(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((0, 0), (3 * calc.cos(15deg), 3 * calc.sin(15deg)), stroke: 1.2pt)
    line((0, 0), (3 * calc.cos(75deg), 3 * calc.sin(75deg)), stroke: 1.2pt)
    arc((3 * calc.cos(15deg), 3 * calc.sin(15deg)), start: 15deg, stop: 75deg, radius: 3, stroke: 1.2pt)
    content((1.2, 0.15), $R$)
    content((0.2, 0.85), $R$)
    content((2.2, 1.8), $s$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một bồn hoa có dạng hình quạt tròn (giới hạn bởi hai bán kính và một cung tròn) có chu vi bằng $20$ m. Để diện tích bồn hoa lớn nhất thì bán kính của hình quạt tròn đó phải bằng bao nhiêu?],
  (
    True([$5$ m]),
    [$4$ m],
    [$6$ m],
    [$10$ m]
  ),
  loigiai: [
    #step[Bồn hoa có cung tròn dài $s$, chu vi $2R + s = 20 => s = 20 - 2R$.]
    #step[Diện tích hình quạt $S = (1)/(2) R s = (1)/(2) R (20 - 2R) = 10R - R^2$.]
    #step[Đạo hàm $S' = 10 - 2R = 0 <=> R = 5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $R$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $5$, $10$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $25$, $0$)
        
      )
      ]
      Diện tích lớn nhất bằng $25$ khi $R = 5$.]
  ]
)


#my-ds(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    arc((2, 0), start: 0deg, stop: 180deg, radius: 2, stroke: 1.2pt)
    line((-2, 0), (2, 0), stroke: 1.2pt)
    content((-2, -0.35), $B$)
    content((2, -0.35), $C$)
    let ax = 2 * calc.cos(60deg)
    let ay = 2 * calc.sin(60deg)
    line((-2, 0), (ax, ay), (2, 0), stroke: 1.2pt + blue)
    content((ax, ay + 0.3), $A$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khu đất hình tam giác $A B C$ vuông tại $A$ nội tiếp trong một đường tròn bán kính $R = 10$ m. Cạnh huyền $B C$ cố định là đường kính của đường tròn, đỉnh $A$ di động trên đường tròn. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Diện tích của khu đất $A B C$ đạt giá trị lớn nhất khi tam giác $A B C$ cân tại $A$.]),
    True([Khi diện tích khu đất lớn nhất, chiều cao ứng với cạnh huyền bằng $10$ m.]),
    True([Diện tích lớn nhất của khu đất bằng $100 "m"^2$.]),
    [Chu vi của tam giác $A B C$ đạt giá trị lớn nhất bằng $20 + 10sqrt(2)$ m.]
  ),
  loigiai: [
    #step[Diện tích $S = (1)/(2) A H dot B C$ (với $A H$ là đường cao). Do $B C$ cố định bằng $20$, $S$ lớn nhất khi $A H$ lớn nhất. (Mệnh đề a đúng)]
    #step[$A H_"max"$ bằng bán kính $R = 10$. Khi đó $Delta A B C$ vuông cân. (Mệnh đề b đúng)]
    #step[$S_"max" = (1)/(2) dot 10 dot 20 = 100$. (Mệnh đề c đúng)]
    #step[Chu vi $P = A B + A C + 20 <= sqrt(2(A B^2 + A C^2)) + 20 = sqrt(2 dot 400) + 20 = 20 sqrt(2) + 20$. Mệnh đề d sai.]
  ]
)

#my-ds(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-0.5, 2.2), (3.5, 2.2), stroke: 2pt + blue)
    content((1.5, 2.5), [Kênh nước])
    rect((0, 0), (3, 2), stroke: 1.2pt + green.darken(20%), fill: green.lighten(95%))
    content((1.5, -0.45), $x$)
    content((3.3, 1), $y$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh vườn hình chữ nhật nằm sát một con kênh thẳng. Người ta rào 3 phía còn lại bằng $120$ m lưới. Cạnh song song với con kênh dài $x$ (m), hai cạnh vuông góc với kênh dài $y$ (m). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Diện tích của vườn tính theo $y$ là $S(y) = 120y - 2y^2$.]),
    True([Diện tích vườn lớn nhất khi kích thước các cạnh là $y = 30$ m và $x = 60$ m.]),
    True([Diện tích lớn nhất có thể rào được là $1800 "m"^2$.]),
    [Nếu người đó muốn rào thêm một hàng rào ngăn đôi khu vườn song song với hai cạnh vuông góc với kênh thì với $120$ m lưới đó, diện tích lớn nhất có thể rào được vẫn bằng $1800 "m"^2$.]
  ),
  loigiai: [
    #step[Có $x + 2y = 120 => x = 120 - 2y$. Diện tích $S(y) = y(120 - 2y) = 120y - 2y^2$. (Mệnh đề a đúng)]
    #step[Đạo hàm $S' = 120 - 4y = 0 <=> y = 30$. (Mệnh đề b đúng)]
    #step[Bảng biến thiên cho $S$ đạt cực đại tại $y = 30$, $S_"max" = 1800$. (Mệnh đề c đúng)]
    #step[Nếu ngăn đôi song song 2 cạnh vuông góc thì có 3 rào $y$, ta có $x + 3y = 120 => S = y(120 - 3y)$. Max khi $y=20, x=60 => S = 1200$. (Mệnh đề d sai)]
  ]
)

#my-ds(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    rect((0, 0), (3, 2), stroke: 1.2pt, fill: blue.lighten(95%))
    content((1.5, -0.45), $x$)
    content((3.3, 1), $y$)
    content((1.5, 1), $S = 400 "m"^2$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khu đất hình chữ nhật có diện tích bằng $400 "m"^2$ cần được rào xung quanh. Người ta gọi hai kích thước của khu đất là $x$ (m) và $y$ (m). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Chu vi của khu đất là $P(x) = 2x + 800/x$ với $x > 0$.]),
    True([Khu đất có chu vi nhỏ nhất khi nó là hình vuông cạnh $20$ m.]),
    True([Chu vi nhỏ nhất của khu đất bằng $80$ m.]),
    [Nếu giá tiền rào ba mặt là $100.000$ đồng/m và mặt thứ tư (mặt tiền) là $300.000$ đồng/m thì tổng chi phí rào nhỏ nhất khi chiều rộng mặt tiền của mảnh đất là $10$ m.]
  ),
  loigiai: [
    #step[Diện tích $x y = 400 => y = (400)/(x)$. Chu vi $P = 2(x+y) = 2x + (800)/(x)$. (Mệnh đề a đúng)]
    #step[Theo AM-GM, $P >= 2 sqrt(1600) = 80$. Đẳng thức khi $2x = (800)/(x) <=> x = 20$. Đây là hình vuông. (Mệnh đề b, c đúng)]
    #step[Chi phí $C = 300x + 100x + 100(2y) = 400x + 200((400)/(x)) = 400x + (80000)/(x)$.]
    #step[C nhỏ nhất khi $400x = (80000)/(x) <=> x^2 = 200 <=> x = 10 sqrt(2)$. Không phải $10$. (Mệnh đề d sai)]
  ]
)

#my-ds(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((0, 3), (0, 0), (4, 0), close: true, stroke: 1.2pt)
    content((0, 3), $B$, anchor: "south-east")
    content((0, -0.35), $A$, anchor: "north-east")
    content((4, -0.35), $C$, anchor: "north-west")
    line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.5pt)
    rect((0, 0), (2, 1.5), stroke: 1pt + red, fill: red.lighten(95%))
    content((0, 1.5), $D$, anchor: "east")
    content((2, 1.5), $E$, anchor: "south-west")
    content((2, -0.35), $F$, anchor: "north")
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình tam giác vuông $A B C$ có hai cạnh góc vuông $A B = 30$ m, $A C = 40$ m. Người ta muốn xây dựng một ngôi nhà hình chữ nhật $A D E F$ bên trong mảnh đất sao cho $D in A B$, $F in A C$ và $E in B C$. Đặt $A D = x$ (m), $A F = y$ (m). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Mối quan hệ giữa hai kích thước của ngôi nhà là $y = 40 - 4/3 x$ với $0 < x < 30$.]),
    True([Diện tích lớn nhất của ngôi nhà có thể đạt được bằng $300 "m"^2$.]),
    True([Khi ngôi nhà có diện tích lớn nhất thì diện tích ngôi nhà chiếm đúng $50\%$ diện tích mảnh đất $A B C$.]),
    [Chu vi lớn nhất của ngôi nhà hình chữ nhật $A D E F$ bằng $70$ m.]
  ),
  loigiai: [
    #step[Gọi $A D = x, A F = y$. Do tam giác đồng dạng $F E / A B = F C / A C => x / 30 = (40 - y) / 40 => y = 40 - (4)/(3) x$. (Mệnh đề a đúng)]
    #step[Diện tích nhà $S = x y = x(40 - (4)/(3) x)$. Đạo hàm $S' = 40 - (8)/(3) x = 0 <=> x = 15$. BBT cho $S_"max" = 300$. (Mệnh đề b đúng)]
    #step[Diện tích $Delta A B C$ là $(1)/(2) dot 30 dot 40 = 600$. $300$ chiếm $50\%$. (Mệnh đề c đúng)]
    #step[Chu vi $P = 2(x+y) = 2(x + 40 - (4)/(3) x) = 80 - (2)/(3) x$. Hàm số nghịch biến trên $(0; 30)$, không có cực trị. (Mệnh đề d sai)]
  ]
)


#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Một người nông dân muốn rào một khu vườn hình chữ nhật sát một con sông thẳng (không rào phía con sông). Người đó có $80$ m lưới. Tìm diện tích lớn nhất (theo đơn vị $"m"^2$) của khu vườn mà người đó có thể rào được.],
  [$800$],
  loigiai: [
    #step[Có lưới dài $80$ m, $x + 2y = 80 => x = 80 - 2y$.]
    #step[Diện tích $S(y) = y(80 - 2y) = 80y - 2y^2$.]
    #step[Đạo hàm $S' = 80 - 4y = 0 <=> y = 20$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $y$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $20$, $40$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $800$, $0$)
        
      )
      ]
      Diện tích lớn nhất là $800$.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Một mảnh vườn hình chữ nhật nằm ở góc một bức tường vuông góc. Người ta muốn rào hai phía còn lại để tạo thành một khu vườn hình chữ nhật có diện tích $100 "m"^2$. Tổng chiều dài hàng rào ngắn nhất bằng bao nhiêu mét?],
  [$20$],
  loigiai: [
    #step[Diện tích $x y = 100 => y = (100)/(x)$.]
    #step[Chiều dài hàng rào là $L(x) = x + (100)/(x)$.]
    #step[Đạo hàm $L'(x) = 1 - (100)/(x^2) = 0 <=> x = 10$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $10$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $20$, $+oo$)
        
      )
      ]
      Chiều dài ngắn nhất là $20$.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Một đoạn dây đồng dài $40$ cm được cắt thành hai đoạn để uốn thành hai hình vuông. Tổng diện tích nhỏ nhất của hai hình vuông đó bằng bao nhiêu $"cm"^2$?],
  [$50$],
  loigiai: [
    #step[Cắt $40$ thành $x$ và $40-x$. Cạnh hình vuông là $x / 4$ và $(40-x) / 4$.]
    #step[Tổng diện tích $S(x) = (x / 4)^2 + ((40-x) / 4)^2 = (x^2 + (40-x)^2) / 16$.]
    #step[Đạo hàm $S'(x) = (2x - 2(40-x)) / 16 = (4x - 80) / 16 = 0 <=> x = 20$.]
    #step[Bảng biến thiên cho thấy $S$ đạt cực tiểu tại $x=20$. $S_"min" = (20^2 + 20^2) / 16 = 50$.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Một bồn hoa có dạng hình tam giác cân với hai cạnh bên bằng $10$ m. Diện tích lớn nhất của bồn hoa đó bằng bao nhiêu mét vuông?],
  [$50$],
  loigiai: [
    #step[Diện tích tam giác $S = (1)/(2) a b sin C = (1)/(2) dot 10 dot 10 sin C = 50 sin C$.]
    #step[Đạo hàm theo $C$: $S' = 50 cos C = 0 <=> C = 90^degree$.]
    #step[Bảng biến thiên cho thấy $S$ lớn nhất khi $C = 90^degree$.]
    #step[Diện tích lớn nhất bằng $50$.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "ngang",
  [Một hộ dân muốn rào một khu vườn hình chữ nhật có diện tích $800 "m"^2$ sát một bức tường thẳng (không cần rào phía bức tường). Chiều dài lưới ít nhất để rào khu vườn đó bằng bao nhiêu mét?],
  [$80$],
  loigiai: [
    #step[Diện tích $S = x y = 800 => x = (800)/(y)$.]
    #step[Chiều dài lưới $L(y) = x + 2y = (800)/(y) + 2y$.]
    #step[Đạo hàm $L'(y) = 2 - (800)/(y^2) = 0 <=> y^2 = 400 <=> y = 20$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $y$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $20$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $80$, $+oo$)
        
      )
      ]
      Lưới ít nhất dài $80$ m.]
  ]
)

#my-tln(de: "Đề 3", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-1.5, 0.75), (1.5, 0.75), stroke: 1pt)
    line((-1.5, -0.75), (1.5, -0.75), stroke: 1pt)
    arc((1.5, 0.75), start: 90deg, stop: -90deg, radius: 0.75, stroke: 1pt)
    arc((-1.5, -0.75), start: 270deg, stop: 90deg, radius: 0.75, stroke: 1pt)
    line((-1.5, -0.75), (-1.5, 0.75), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1.5, -0.75), (1.5, 0.75), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0, 0.95), $x$)
    content((0, -0.95), $x$)
    line((1.5, 0), (2.25, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.8, 0.25), $r$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một đường chạy trong sân vận động có chu vi vòng trong là $400$ m gồm hai đoạn thẳng song song có độ dài $x$ (m) bằng nhau và hai cung tròn bán nguyệt có bán kính $r$ (m) ở hai đầu. Để phần diện tích hình chữ nhật giới hạn bởi hai đoạn thẳng song song lớn nhất thì độ dài $x$ của mỗi đoạn thẳng phải bằng bao nhiêu mét?],
  [$100$],
  loigiai: [
    #step[Chu vi $2x + 2pi r = 400 => x = 200 - pi r$.]
    #step[Diện tích phần hình chữ nhật $S(r) = 2r x = 2r(200 - pi r) = 400r - 2pi r^2$.]
    #step[Đạo hàm $S'(r) = 400 - 4pi r = 0 <=> r = (100)/(pi)$.]
    #step[Bảng biến thiên cho thấy $S$ đạt cực đại tại $r = (100)/(pi)$. Khi đó $x = 200 - pi( (100)/(pi) ) = 100$.]
  ]
)



// ==================== Đề 4 ====================
#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Bottom face
    line((-1.5, -0.6), (0.5, -1.1), (2, -0.5), stroke: 1.2pt)
    line((2, -0.5), (0, 0), (-1.5, -0.6), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    // Vertical edges
    line((-1.5, -0.6), (-1.5, 1.2), stroke: 1.2pt)
    line((0.5, -1.1), (0.5, 0.7), stroke: 1.2pt)
    line((2, -0.5), (2, 1.3), stroke: 1.2pt)
    line((0, 0), (0, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    // Top face (open box, no lid)
    line((-1.5, 1.2), (0.5, 0.7), (2, 1.3), (0, 1.8), close: true, stroke: 1.2pt)
    // Labels
    content((0.5, -1.4), $x$)
    content((1.5, -1.0), $x$)
    line((2.3, -0.5), (2.3, 1.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((2.6, 0.4), $h$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một chiếc hộp hình hộp chữ nhật không nắp có thể tích bằng $4 "m"^3$, đáy là hình vuông cạnh $x$ (m). Tìm diện tích giấy nhỏ nhất cần dùng để làm chiếc hộp đó (không tính mép dán).],
  (
    True([$12 "m"^2$]),
    [$16 "m"^2$],
    [$8 "m"^2$],
    [$10 "m"^2$]
  ),
  loigiai: [
    #step[Gọi $x$ là cạnh đáy, $h$ là chiều cao hộp. Thể tích $x^2 h = 4 => h = (4)/(x^2)$.]
    #step[Diện tích cần dùng $S(x) = x^2 + 4x h = x^2 + (16)/(x)$.]
    #step[Đạo hàm $S'(x) = 2x - (16)/(x^2) = 0 <=> x^3 = 8 <=> x = 2$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $2$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $12$, $+oo$)
        
      )
      ]
      Vậy diện tích nhỏ nhất là $12$ ($"m"^2$).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    draw-ellipse(0, 1.5, 1, 0.3, stroke: 1.2pt)
    draw-ellipse(0, -1.5, 1, 0.3, stroke: 1.2pt, style: "dashed-back")
    line((-1, -1.5), (-1, 1.5), stroke: 1.2pt)
    line((1, -1.5), (1, 1.5), stroke: 1.2pt)
    line((0, -1.5), (1, -1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0.5, -1.2), $r$)
    line((1.3, -1.5), (1.3, 1.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((1.6, 0), $h$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một lon nước ngọt hình trụ có thể tích bằng $2000 pi "cm"^3$. Tìm bán kính đáy $r$ của lon nước sao cho diện tích toàn phần của lon nước đạt giá trị nhỏ nhất.],
  (
    [$r = 5 "cm"$],
    True([$r = 10 "cm"$]),
    [$r = 20 "cm"$],
    [$r = 15 "cm"$]
  ),
  loigiai: [
    #step[Gọi bán kính đáy là $r$, chiều cao $h$. Thể tích $pi r^2 h = 2000 pi => h = (2000)/(r^2)$.]
    #step[Diện tích toàn phần $S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + (4000 pi)/(r)$.]
    #step[Đạo hàm $S'(r) = 4pi r - (4000 pi)/(r^2) = 0 <=> r^3 = 1000 <=> r = 10$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $r$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $10$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $S_"min"$, $+oo$)
        
      )
      ]
      Vậy bán kính đáy để diện tích toàn phần nhỏ nhất là $10$ (cm).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Bottom face
    line((-1.5, -0.6), (0.5, -1.1), (2, -0.5), stroke: 1.2pt)
    line((2, -0.5), (0, 0), (-1.5, -0.6), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    // Vertical edges
    line((-1.5, -0.6), (-1.5, 1.2), stroke: 1.2pt)
    line((0.5, -1.1), (0.5, 0.7), stroke: 1.2pt)
    line((2, -0.5), (2, 1.3), stroke: 1.2pt)
    line((0, 0), (0, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    // Top face
    line((-1.5, 1.2), (0.5, 0.7), (2, 1.3), (0, 1.8), close: true, stroke: 1.2pt)
    // Labels
    content((-0.7, -1.1), $x$)
    content((1.4, -0.9), $2x$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một chiếc hộp hình hộp chữ nhật có nắp được làm từ một tấm tôn có tổng diện tích bằng $108 "m"^2$. Biết đáy hộp là hình chữ nhật có chiều rộng gấp đôi chiều dài. Thể tích lớn nhất của chiếc hộp đó bằng bao nhiêu?],
  (
    True([$72 "m"^3$]),
    [$108 "m"^3$],
    [$64 "m"^3$],
    [$96 "m"^3$]
  ),
  loigiai: [
    #step[Gọi $x$ là chiều rộng đáy, chiều dài là $2x$, chiều cao là $h$. Diện tích $S_"tp" = 2(2x^2) + 2(x + 2x)h = 4x^2 + 6x h = 108 => h = (108 - 4x^2)/(6x)$.]
    #step[Thể tích $V(x) = 2x^2 h = 2x^2 (108 - 4x^2)/(6x) = 36x - (4)/(3)x^3$.]
    #step[Đạo hàm $V'(x) = 36 - 4x^2 = 0 <=> x = 3$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $3$, $3 sqrt(3)$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $72$, $0$)
        
      )
      ]
      Vậy thể tích lớn nhất là $72$ ($"m"^3$).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Cone
    // Cone
    line((-2, -1.5), (0, 2.5), (2, -1.5), stroke: 1.2pt)
    draw-ellipse(0, -1.5, 2, 0.5, stroke: 1.2pt, style: "dashed-back")
    
    // Sphere inside (R=0.9, center at y = -0.6)
    circle((0, -0.3), radius: 1.2, stroke: 1.2pt + blue)
    draw-ellipse(0, -0.3, 1.2, 0.3, stroke: 0.5pt + blue, style: "dashed-back")
    
    // Centers and labels
    circle((0, -0.3), radius: 0.05, fill: blue)
    content((0.2, -0.1), text(blue)[$I$])
    
    line((0, -0.3), (1.2, -0.3), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    content((0.6, -0.1), text(blue)[$R$])
    
    line((0, -1.5), (0, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((-0.3, 1), $h$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khối nón có chiều cao $H = 12$ cm và bán kính đáy $R = 6$ cm. Một khối trụ đặt bên trong khối nón sao cho đáy dưới của khối trụ nằm trên đáy của khối nón, đáy trên của khối trụ tiếp xúc với mặt xung quanh của khối nón. Tìm thể tích lớn nhất của khối trụ.],
  (
    True([$64 pi "cm"^3$]),
    [$32 pi "cm"^3$],
    [$48 pi "cm"^3$],
    [$72 pi "cm"^3$]
  ),
  loigiai: [
    #step[Gọi $r, h$ là bán kính đáy và chiều cao khối trụ. Theo định lý Thales trong mặt cắt qua trục nón: $h / 12 = (6 - r) / 6 => h = 12 - 2r$.]
    #step[Thể tích khối trụ $V(r) = pi r^2 h = pi r^2 (12 - 2r) = pi(12r^2 - 2r^3)$.]
    #step[Đạo hàm $V'(r) = pi(24r - 6r^2) = 0 <=> r = 4$ (vì $r > 0$).]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $r$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $4$, $6$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $64 pi$, $0$)
        
      )
      ]
      Vậy thể tích lớn nhất bằng $64 pi$ ($"cm"^3$).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Sector
    // Sector
    line((0, 0), (2.5 * calc.cos(15deg), 2.5 * calc.sin(15deg)), stroke: 1.2pt)
    line((0, 0), (2.5 * calc.cos(105deg), 2.5 * calc.sin(105deg)), stroke: 1.2pt)
    arc((2.5 * calc.cos(15deg), 2.5 * calc.sin(15deg)), start: 15deg, stop: 105deg, radius: 2.5, stroke: 1.2pt)
    content((1, 1), $R=6$)
    
    // Arrow
    content((3.5, 1), $=>$ )
    
    // Cone
    let cx = 6
    let cy = 1
    draw-ellipse(cx, cy - 1.5, 1.2, 0.35, stroke: 1.2pt, style: "dashed-back")
    line((cx - 1.2, cy - 1.5), (cx, cy + 1.5), (cx + 1.2, cy - 1.5), stroke: 1.2pt)
    
    circle((cx, cy - 1.5), radius: 0.05, fill: black)
    line((cx, cy - 1.5), (cx, cy + 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    line((cx, cy - 1.5), (cx + 1.2, cy - 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((cx + 0.6, cy - 1.8), $r$)
    content((cx - 0.3, cy), $h$)
    content((cx + 0.9, cy), $l=R$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một tấm tôn hình quạt tròn có bán kính $R = 6$ cm. Người ta uốn tấm tôn này thành mặt xung quanh của một cái phễu hình nón. Để thể tích của phễu lớn nhất thì bán kính đáy $r$ của phễu bằng bao nhiêu?],
  (
    True([$2sqrt(6) "cm"$]),
    [$2sqrt(3) "cm"$],
    [$4 "cm"$],
    [$3 "cm"$]
  ),
  loigiai: [
    #step[Đường sinh của phễu $l = R = 6$. Gọi bán kính đáy phễu là $r$, chiều cao phễu là $h = sqrt(36 - r^2)$.]
    #step[Thể tích phễu $V(r) = (1)/(3) pi r^2 sqrt(36 - r^2)$. Xét hàm $f(r) = r^4 (36 - r^2) = 36r^4 - r^6$.]
    #step[Đạo hàm $f'(r) = 144r^3 - 6r^5 = 0 <=> r^2 = 24 <=> r = 2 sqrt(6)$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $r$,
          der: $f'$,
          func: $f$,
          x-vals: ($0$, $2 sqrt(6)$, $6$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $f_"max"$, $0$)
        
      )
      ]
      Vậy bán kính đáy phễu là $2 sqrt(6)$ (cm).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Sphere
    circle((0, 0), radius: 2, stroke: 1pt)
    draw-ellipse(0, 0, 2, 0.5, stroke: 0.5pt + gray, style: "dashed-back")
    
    // Cylinder inside (h = 1.2, r = sqrt(4 - 1.44) = sqrt(2.56) = 1.6)
    draw-ellipse(0, 1.2, 1.6, 0.4, stroke: 1.2pt + blue)
    draw-ellipse(0, -1.2, 1.6, 0.4, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1.6, -1.2), (-1.6, 1.2), stroke: 1.2pt + blue)
    line((1.6, -1.2), (1.6, 1.2), stroke: 1.2pt + blue)
    
    // Centers and labels
    circle((0, 0), radius: 0.05, fill: black)
    content((0.2, 0.2), $O$)
    line((0, 0), (0, 1.2), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    line((0, 0), (1.6, 1.2), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((0.7, 0.8), $R$)
    line((0, 1.2), (1.6, 1.2), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    content((0.8, 1.5), text(blue)[$r$])
    content((-0.3, 0.6), text(blue)[$h$])
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một quả bóng hình cầu có bán kính $R = 3$ dm. Một cái phễu hình nón đặt nội tiếp trong quả bóng sao cho đỉnh và đường tròn đáy của hình nón đều nằm trên mặt cầu. Thể tích lớn nhất của phễu hình nón bằng bao nhiêu?],
  (
    True([$frac(32, 3) pi "dm"^3$]),
    [$frac(64, 3) pi "dm"^3$],
    [$12 pi "dm"^3$],
    [$8 pi "dm"^3$]
  ),
  loigiai: [
    #step[Gọi $r, h$ là bán kính đáy và chiều cao nón. Xét mặt cắt qua trục, theo tính chất tam giác vuông nội tiếp, $r^2 = h(6 - h) = 6h - h^2$.]
    #step[Thể tích nón $V(h) = (1)/(3) pi r^2 h = (1)/(3) pi (6h^2 - h^3)$.]
    #step[Đạo hàm $V'(h) = (1)/(3) pi (12h - 3h^2) = 0 <=> h = 4$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $h$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $4$, $6$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $(32 pi)/(3)$, $0$)
        
      )
      ]
      Vậy thể tích lớn nhất bằng $(32)/(3) pi$ ($"dm"^3$).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Sphere
    circle((0, 0), radius: 2, stroke: 1pt)
    draw-ellipse(0, 0, 2, 0.5, stroke: 0.5pt + gray, style: "dashed-back")
    
    // Cone inside (apex at top, base below center)
    // For apex at (0, 2), base at y = -0.5, radius = sqrt(4 - 0.25) = sqrt(3.75) ≈ 1.93
    draw-ellipse(0, -0.6, 1.9, 0.45, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1.9, -0.6), (0, 2), (1.9, -0.6), stroke: 1.2pt + blue)
    
    // Centers and labels
    circle((0, 0), radius: 0.05, fill: black)
    content((0.2, 0.2), $O$)
    circle((0, -0.6), radius: 0.05, fill: blue)
    line((0, -0.6), (0, 2), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    line((0, -0.6), (1.9, -0.6), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    content((1, -0.9), text(blue)[$r$])
    
    line((0, 0), (2 * calc.cos(30deg), -2 * calc.sin(30deg)), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((1.2, -0.2), $R$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khối cầu có bán kính $R = sqrt(3)$ m. Một hình trụ đặt nội tiếp trong khối cầu sao cho hai đường tròn đáy của hình trụ nằm trên mặt cầu. Thể tích lớn nhất của khối trụ bằng bao nhiêu?],
  (
    True([$4 pi "m"^3$]),
    [$2 pi "m"^3$],
    [$8 pi "m"^3$],
    [$6 pi "m"^3$]
  ),
  loigiai: [
    #step[Gọi nửa chiều cao trụ là $h$, bán kính đáy trụ là $r$. Ta có $r^2 + h^2 = (sqrt(3))^2 = 3 => r^2 = 3 - h^2$.]
    #step[Thể tích khối trụ $V(h) = pi r^2 (2h) = 2pi (3 - h^2)h = 2pi(3h - h^3)$.]
    #step[Đạo hàm $V'(h) = 2pi(3 - 3h^2) = 0 <=> h = 1$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $h$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $1$, $sqrt(3)$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $4 pi$, $0$)
        
      )
      ]
      Vậy thể tích lớn nhất là $4 pi$ ($"m"^3$).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Front face
    line((-1, 1), (-1, 0), (1, 0), (1, 1), stroke: 1.2pt)
    // Back face
    line((0.5, 1.8), (0.5, 0.8), (2.5, 0.8), (2.5, 1.8), stroke: 1.2pt)
    // Connectors
    line((-1, 1), (0.5, 1.8), stroke: 1.2pt)
    line((-1, 0), (0.5, 0.8), stroke: 1.2pt)
    line((1, 0), (2.5, 0.8), stroke: 1.2pt)
    line((1, 1), (2.5, 1.8), stroke: 1.2pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một tấm tôn hình chữ nhật dài $1$ m, rộng $30$ cm. Người ta gập hai bên mép của tấm tôn lên một đoạn bằng $x$ (cm) vuông góc với tấm tôn để tạo thành một máng nước có mặt cắt là hình chữ nhật. Thể tích lớn nhất của máng nước bằng bao nhiêu lít?],
  (
    True([$11.25$ lít]),
    [$22.5$ lít],
    [$15$ lít],
    [$9$ lít]
  ),
  loigiai: [
    #step[Đổi $1$ m $= 100$ cm. Gọi phần gập lên là $x$, đáy máng là $30 - 2x$, chiều cao máng là $x$.]
    #step[Thể tích máng $V(x) = x(30 - 2x) dot 100 = 100(30x - 2x^2)$.]
    #step[Đạo hàm $V'(x) = 100(30 - 4x) = 0 <=> x = 7.5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $7.5$, $15$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $11250$, $0$)
        
      )
      ]
      Thể tích lớn nhất là $11250$ $"cm"^3 = 11.25$ lít.]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Front triangle
    line((0, 1.5), (-1.2, 0), (1.2, 0), close: true, stroke: 1.2pt)
    // Back triangle
    line((1.5, 2.3), (0.3, 0.8), (2.7, 0.8), close: true, stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1.5, 2.3), (2.7, 0.8), stroke: (paint: gray, thickness: 0.75pt))
    // Ridge and base lines
    line((0, 1.5), (1.5, 2.3), stroke: 1.2pt)
    line((-1.2, 0), (0.3, 0.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1.2, 0), (2.7, 0.8), stroke: 1.2pt) 
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một chiếc lều chữ A có dạng hình lăng trụ đứng tam giác. Hai đầu hồi là hai tam giác cân có cạnh bên bằng $2$ m. Chiều dài chiếc lều bằng $3$ m. Thể tích lớn nhất của chiếc lều bằng bao nhiêu?],
  (
    True([$6 "m"^3$]),
    [$12 "m"^3$],
    [$3 "m"^3$],
    [$8 "m"^3$]
  ),
  loigiai: [
    #step[Gọi nửa cạnh đáy của tam giác cân hồi là $x$, đường cao $h = sqrt(4 - x^2)$. Diện tích đáy là $S(x) = (1)/(2)(2x)h = x sqrt(4 - x^2)$.]
    #step[Thể tích lều $V(x) = 3 dot x sqrt(4 - x^2)$. Xét hàm $f(x) = x^2(4 - x^2) = 4x^2 - x^4$.]
    #step[Đạo hàm $f'(x) = 8x - 4x^3 = 0 <=> x = sqrt(2)$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($0$, $sqrt(2)$, $2$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $4$, $0$)
        
      )
      ]
      Khi $x = sqrt(2)$, $S_"max" = sqrt(2) sqrt(2) = 2$, suy ra $V_"max" = 6$ ($"m"^3$).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Hemisphere dome
    // Hemisphere dome
    arc((2.5, 0), start: 0deg, stop: 180deg, radius: 2.5, stroke: 1.2pt)
    draw-ellipse(0, 0, 2.5, 0.6, stroke: 1.2pt, style: "dashed-back")
    
    // Cylinder inside (r=1.8, h=sqrt(6.25 - 3.24) = sqrt(3.01) ≈ 1.73)
    draw-ellipse(0, 1.73, 1.8, 0.45, stroke: 1.2pt + blue)
    draw-ellipse(0, 0, 1.8, 0.45, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1.8, 0), (-1.8, 1.73), stroke: 1.2pt + blue)
    line((1.8, 0), (1.8, 1.73), stroke: 1.2pt + blue)
    
    // Centers and labels
    circle((0, 0), radius: 0.05, fill: black)
    content((0.2, -0.3), $O$)
    
    line((0, 0), (1.8, 0), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    content((0.9, 0.3), text(blue)[$r$])
    
    line((0, 0), (0, 1.73), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    content((-0.3, 0.8), text(blue)[$h$])
    
    line((0, 0), (1.8, 1.73), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((0.8, 1.1), $R$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một bể cá hình bán cầu có bán kính $R = 6$ dm. Người ta muốn thả vào đó một khối trụ nước sao cho đáy dưới của khối trụ nằm trên mặt phẳng kính, đường tròn đáy trên thuộc mặt bán cầu. Thể tích lớn nhất của khối trụ nước đó bằng bao nhiêu?],
  (
    True([$48sqrt(3) pi "dm"^3$]),
    [$24sqrt(3) pi "dm"^3$],
    [$72 pi "dm"^3$],
    [$36sqrt(2) pi "dm"^3$]
  ),
  loigiai: [
    #step[Gọi bán kính đáy trụ là $r$, chiều cao $h$. Theo Pytago $r^2 + h^2 = 36 => r^2 = 36 - h^2$.]
    #step[Thể tích khối trụ $V(h) = pi r^2 h = pi (36 - h^2)h = pi(36h - h^3)$.]
    #step[Đạo hàm $V'(h) = pi(36 - 3h^2) = 0 <=> h = 2 sqrt(3)$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $h$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $2 sqrt(3)$, $6$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $48 sqrt(3) pi$, $0$)
        
      )
      ]
      Thể tích lớn nhất bằng $48 sqrt(3) pi$ ($"dm"^3$).]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Cone
    line((-1.5, -1.2), (0, 2.0), (1.5, -1.2), stroke: 1.2pt)
    draw-ellipse(0, -1.2, 1.5, 0.45, stroke: 1.2pt, style: "dashed-back")
    // Sphere inside
    circle((0, -0.3), radius: 0.9, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khối cầu có bán kính $R = 3$ cm được đặt vừa khít bên trong một cái phễu hình nón sao cho mặt cầu tiếp xúc với đáy khối nón và mặt xung quanh của khối nón. Chiều cao $h$ của phễu hình nón để thể tích của phễu nhỏ nhất bằng bao nhiêu?],
  (
    True([$12 "cm"$]),
    [$9 "cm"$],
    [$15 "cm"$],
    [$6 "cm"$]
  ),
  loigiai: [
    #step[Gọi $r, h$ là bán kính đáy và chiều cao phễu. Qua mặt cắt, đường sinh của nón tiếp xúc với mặt cầu nội tiếp tạo ra tỉ lệ đồng dạng $(r)/(h) = (3)/(sqrt((h-3)^2 - 9)) => r^2 = (9h)/(h-6)$.]
    #step[Thể tích nón $V(h) = (1)/(3) pi r^2 h = (3pi h^2)/(h-6)$ (với $h > 6$).]
    #step[Đạo hàm $V'(h) = 3pi (h^2 - 12h)/((h-6)^2) = 0 <=> h = 12$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $h$,
          der: $V'$,
          func: $V$,
          x-vals: ($6$, $12$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $V_"min"$, $+oo$)
        
      )
      ]
      Vậy chiều cao $h = 12$ cm để phễu có thể tích nhỏ nhất.]
  ]
)

#my-tn(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    // Sphere
    circle((0, 0), radius: 2, stroke: 1pt)
    draw-ellipse(0, 0, 2, 0.6, stroke: 0.5pt + gray, style: "dashed-back")
    
    // Axis
    line((0, -2.3), (0, 2.3), stroke: (dash: "dash-dotted", paint: gray, thickness: 0.6pt))
    
    // Top and bottom cross-sections
    draw-ellipse(0, 1.2, 1.6, 0.48, stroke: 0.5pt + gray, style: "dashed-back")
    draw-ellipse(0, -1.2, 1.6, 0.48, stroke: 0.5pt + gray, style: "dashed-back")
    
    // Box vertices
    let V1 = (1.386, 1.44)
    let V2 = (-0.8, 1.616)
    let V3 = (-1.386, 0.96)
    let V4 = (0.8, 0.784)
    
    let B1 = (1.386, -0.96)
    let B2 = (-0.8, -0.784)
    let B3 = (-1.386, -1.44)
    let B4 = (0.8, -1.616)
    
    // Hidden edges of the box
    line(B1, B2, B3, stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    line(V2, B2, stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    
    // Visible bottom edges
    line(B3, B4, B1, stroke: 1.2pt + blue)
    
    // Visible vertical edges
    line(V1, B1, stroke: 1.2pt + blue)
    line(V3, B3, stroke: 1.2pt + blue)
    line(V4, B4, stroke: 1.2pt + blue)
    
    // Top edges (all visible)
    line(V1, V2, V3, V4, close: true, stroke: 1.2pt + blue)
    
    // Center and labels
    circle((0, 0), radius: 0.05, fill: black)
    content((0.25, -0.1), $O$)
    
    // Labels
    line((0, 0), V1, stroke: (dash: "dashed", paint: red, thickness: 1pt))
    content((0.7, 0.6), text(red)[$R$])
    
    line((0, 0), (0, 1.2), stroke: (dash: "dashed", paint: black, thickness: 1pt))
    content((-0.2, 0.6), $h$)
    
    // Mark base edge x
    content((1.2, 1.05), text(blue)[$x$])
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khối cầu có bán kính $R = 3$ dm. Một hình hộp chữ nhật có đáy là hình vuông đặt nội tiếp trong khối cầu. Thể tích lớn nhất của hình hộp chữ nhật này bằng bao nhiêu?],
  (
    True([$24sqrt(3) "dm"^3$]),
    [$12sqrt(3) "dm"^3$],
    [$36 "dm"^3$],
    [$16sqrt(2) "dm"^3$]
  ),
  loigiai: [
    #step[Gọi cạnh đáy hình vuông là $x$, chiều cao hộp là $h$. Đường chéo của hình hộp bằng đường kính mặt cầu: $2x^2 + h^2 = 36 => 2x^2 = 36 - h^2$.]
    #step[Thể tích hộp $V(h) = x^2 h = (36 - h^2)/(2) h = 18h - (1)/(2) h^3$.]
    #step[Đạo hàm $V'(h) = 18 - (3)/(2) h^2 = 0 <=> h = 2 sqrt(3)$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $h$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $2 sqrt(3)$, $6$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $24 sqrt(3)$, $0$)
        
      )
      ]
      Thể tích lớn nhất bằng $24 sqrt(3)$ ($"dm"^3$).]
  ]
)


#my-ds(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    draw-ellipse(0, 1.2, 0.8, 0.24, stroke: 1.2pt)
    draw-ellipse(0, -1.2, 0.8, 0.24, stroke: 1.2pt, style: "dashed-back")
    line((-0.8, -1.2), (-0.8, 1.2), stroke: 1.2pt)
    line((0.8, -1.2), (0.8, 1.2), stroke: 1.2pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một lon bia hình trụ có thể tích bằng $54 pi "cm"^3$. Người ta gọi bán kính đáy là $r$ (cm) và chiều cao của lon bia là $h$ (cm). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Chiều cao $h$ tính theo bán kính $r$ là $h = 54/r^2$.]),
    True([Để tiết kiệm nguyên liệu sản xuất vỏ lon nhất (diện tích toàn phần nhỏ nhất) thì bán kính đáy $r$ phải bằng $3$ cm.]),
    True([Khi diện tích toàn phần nhỏ nhất, chiều cao của lon gấp hai lần bán kính đáy.]),
    [Diện tích toàn phần nhỏ nhất của lon bia là $27 pi "cm"^2$.]
  ),
  loigiai: [
    #step[Từ $V = pi r^2 h = 54pi => h = (54)/(r^2)$. (Mệnh đề a đúng)]
    #step[Diện tích toàn phần $S_"tp"(r) = 2pi r^2 + 2pi r h = 2pi r^2 + (108pi)/(r)$. Đạo hàm $S_"tp"'(r) = 4pi r - (108pi)/(r^2) = 0 <=> r^3 = 27 <=> r = 3$.]
    #step[Bảng biến thiên cho thấy $S_"tp"$ nhỏ nhất khi $r = 3$. (Mệnh đề b đúng)]
    #step[Khi $r = 3$, $h = (54)/(9) = 6$. Vậy $h = 2r$. (Mệnh đề c đúng)]
    #step[Tại $r = 3$, $S_"tp" = 2pi(9) + (108pi)/(3) = 54pi$. Mệnh đề d nói $27pi$ là sai. (Mệnh đề d sai)]
  ]
)

#my-ds(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Bottom face
    line((-1.5, -0.6), (0.5, -1.1), (2, -0.5), stroke: 1.2pt)
    line((2, -0.5), (0, 0), (-1.5, -0.6), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    // Vertical edges
    line((-1.5, -0.6), (-1.5, 1.2), stroke: 1.2pt)
    line((0.5, -1.1), (0.5, 0.7), stroke: 1.2pt)
    line((2, -0.5), (2, 1.3), stroke: 1.2pt)
    line((0, 0), (0, 1.8), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    // Top face
    line((-1.5, 1.2), (0.5, 0.7), (2, 1.3), (0, 1.8), close: true, stroke: 1.2pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một thùng carton hình hộp chữ nhật không nắp có thể tích $V = 32 "dm"^3$, đáy là hình vuông cạnh $x$ (dm), chiều cao là $h$ (dm). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Diện tích carton cần dùng là $S(x) = x^2 + 128/x$ với $x > 0$.]),
    True([Để tốn ít giấy carton nhất, cạnh đáy $x$ phải bằng $4$ dm.]),
    True([Thùng carton tiết kiệm giấy nhất khi chiều cao của nó bằng một nửa cạnh đáy.]),
    True([Diện tích giấy carton nhỏ nhất để làm thùng là $48 "dm"^2$.])
  ),
  loigiai: [
    #step[Thể tích $V = x^2 h = 32 => h = (32)/(x^2)$. Diện tích carton $S(x) = x^2 + 4x h = x^2 + (128)/(x)$. (Mệnh đề a đúng)]
    #step[Đạo hàm $S'(x) = 2x - (128)/(x^2) = 0 <=> x^3 = 64 <=> x = 4$. BBT cho thấy cực tiểu tại $x=4$. (Mệnh đề b đúng)]
    #step[Khi $x = 4$, $h = (32)/(16) = 2$. Vậy $h = x / 2$. (Mệnh đề c đúng)]
    #step[Tại $x=4$, $S_"min" = 16 + (128)/(4) = 48$. (Mệnh đề d đúng)]
  ]
)

#my-ds(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Cone base
    draw-ellipse(0, -1.5, 2, 0.5, stroke: 1.2pt, style: "dashed-back")
    // Cone sides
    line((-2, -1.5), (0, 2.5), (2, -1.5), stroke: 1.2pt)
    
    // Cylinder inside (r=1, top at y=0.5)
    draw-ellipse(0, 0.5, 1, 0.25, stroke: 1.2pt + blue)
    draw-ellipse(0, -1.5, 1, 0.25, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1, -1.5), (-1, 0.5), stroke: 1.2pt + blue)
    line((1, -1.5), (1, 0.5), stroke: 1.2pt + blue)
    
    // Axes and labels
    circle((0, -1.5), radius: 0.05, fill: black)
    line((0, -1.5), (0, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    line((0, -1.5), (2, -1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((1, -1.8), $R$)
    content((-0.3, 0.5), $H$)
    
    line((0, -1.5), (-1, -1.5), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    content((-0.5, -1.8), text(blue)[$r$])
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một cái phễu hình nón có bán kính đáy $R = 9$ cm và chiều cao $H = 18$ cm. Một khối trụ đặt nội tiếp trong phễu sao cho đáy dưới nằm trên đáy phễu và đáy trên chạm vào thành phễu. Đặt bán kính đáy khối trụ là $r$ (cm) và chiều cao là $h$ (cm). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Chiều cao khối trụ liên hệ với bán kính là $h = 18 - 2r$.]),
    True([Thể tích khối trụ tính theo $r$ là $V(r) = pi (18r^2 - 2r^3)$.]),
    True([Thể tích khối trụ lớn nhất khi bán kính đáy khối trụ bằng $6$ cm.]),
    [Giá trị thể tích lớn nhất của khối trụ bằng $144 pi "cm"^3$.]
  ),
  loigiai: [
    #step[Mặt cắt ngang, theo định lý Thales: $h / 18 = (9-r) / 9 => h = 18 - 2r$. (Mệnh đề a đúng)]
    #step[Thể tích trụ $V(r) = pi r^2 h = pi(18r^2 - 2r^3)$. (Mệnh đề b đúng)]
    #step[Đạo hàm $V'(r) = pi(36r - 6r^2) = 0 <=> r = 6$. BBT cho thấy lớn nhất tại $r=6$. (Mệnh đề c đúng)]
    #step[Tại $r=6$, $V_"max" = pi(18 dot 36 - 2 dot 216) = 216pi$. (Mệnh đề d sai, không phải $144pi$)]
  ]
)

#my-ds(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    circle((0, 0), radius: 1.8, stroke: 1pt)
    draw-ellipse(0, 0, 1.8, 0.45, stroke: 0.5pt + gray, style: "dashed-back")
    // Cone inside
    draw-ellipse(0, -0.7, 1.65, 0.3, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1.65, -0.7), (0, 1.8), (1.65, -0.7), stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một cái phễu hình nón đặt nội tiếp trong một quả cầu bán kính $R = 9$ cm. Đỉnh và đường tròn đáy của hình nón nằm trên mặt cầu. Gọi chiều cao của hình nón là $h$ cm ($0 < h < 18$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Thể tích khối nón được tính theo $h$ là $V(h) = 1/3 pi (18h^2 - h^3) "cm"^3$.]),
    True([Thể tích khối nón đạt cực đại khi chiều cao $h = 12$ cm.]),
    True([Khi thể tích khối nón đạt cực đại, bán kính đáy của nó bằng $6sqrt(2)$ cm.]),
    [Tỉ số thể tích giữa khối nón lớn nhất và khối cầu bằng $1/3$.]
  ),
  loigiai: [
    #step[Mặt cắt tam giác nội tiếp đường tròn. $r^2 = h(18 - h) = 18h - h^2$. Thể tích $V(h) = (1)/(3) pi r^2 h = (1)/(3) pi (18h^2 - h^3)$. (Mệnh đề a đúng)]
    #step[Đạo hàm $V'(h) = (1)/(3) pi (36h - 3h^2) = 0 <=> h = 12$. BBT cho cực đại tại $h=12$. (Mệnh đề b đúng)]
    #step[Khi $h = 12$, $r^2 = 18 dot 12 - 144 = 72 => r = 6 sqrt(2)$. (Mệnh đề c đúng)]
    #step[Thể tích $V_"max" = (1)/(3) pi (18 dot 144 - 1728) = 288pi$. Khối cầu là $(4)/(3) pi dot 9^3 = 972pi$. Tỉ số $288 / 972 = 8 / 27$. (Mệnh đề d sai)]
  ]
)


#my-tln(de: "Đề 4", 
  dir: "doc",
  [Một bể chứa nước hình trụ không có nắp có thể tích bằng $250 pi "m"^3$. Chi phí làm đáy bể là $100$ nghìn đồng/$"m"^2$, chi phí làm mặt xung quanh là $50$ nghìn đồng/$"m"^2$. Để chi phí xây dựng bể là nhỏ nhất thì bán kính đáy của bể phải bằng bao nhiêu mét?],
  [$5$],
  loigiai: [
    #step[Thể tích bể $V = pi r^2 h = 250pi => h = (250)/(r^2)$.]
    #step[Chi phí $C(r) = 100 dot pi r^2 + 50 dot (2pi r h) = 100pi r^2 + 100pi r ((250)/(r^2)) = 100pi r^2 + (25000pi)/(r)$.]
    #step[Đạo hàm $C'(r) = 200pi r - (25000pi)/(r^2) = 0 <=> r^3 = 125 <=> r = 5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $r$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $5$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $C_"min"$, $+oo$)
        
      )
      ]
      Vậy bán kính bể là $5$ m.]
  ]
)

#my-tln(de: "Đề 4", 
  dir: "doc",
  [Một chiếc hộp hình hộp chữ nhật có nắp có tổng diện tích toàn phần là $150 "dm"^2$, đáy là hình vuông. Thể tích lớn nhất của chiếc hộp bằng bao nhiêu $"dm"^3$?],
  [$125$],
  loigiai: [
    #step[Diện tích toàn phần $2x^2 + 4x h = 150 => h = (150 - 2x^2)/(4x)$.]
    #step[Thể tích $V(x) = x^2 h = x^2 (150 - 2x^2)/(4x) = (150x - 2x^3)/(4)$.]
    #step[Đạo hàm $V'(x) = (150 - 6x^2)/(4) = 0 <=> x = 5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $5$, $5 sqrt(3)$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $125$, $0$)
        
      )
      ]
      Thể tích lớn nhất là $125$ ($"dm"^3$).]
  ]
)

#my-tln(de: "Đề 4", 
  dir: "doc",
  [Một khối nón có bán kính đáy $R = 9$ cm và chiều cao $H = 12$ cm. Một khối trụ nội tiếp trong khối nón sao cho đáy dưới nằm trên đáy nón và đáy trên tiếp xúc với thành nón. Khi thể tích khối trụ đạt giá trị lớn nhất, chiều cao của khối trụ bằng bao nhiêu cm?],
  [$4$],
  loigiai: [
    #step[Theo Thales: $h / 12 = (9 - r) / 9 => h = 12 - (4)/(3) r$.]
    #step[Thể tích trụ $V(r) = pi r^2 (12 - (4)/(3) r) = pi(12r^2 - (4)/(3) r^3)$.]
    #step[Đạo hàm $V'(r) = pi(24r - 4r^2) = 0 <=> r = 6$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $r$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $6$, $9$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $V_"max"$, $0$)
        
      )
      ]
      Khi $r = 6$, chiều cao trụ $h = 12 - (4)/(3)(6) = 4$ cm.]
  ]
)

#my-tln(de: "Đề 4", 
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Front face
    line((-1, 1), (-1, 0), (1, 0), (1, 1), stroke: 1.2pt)
    // Back face
    line((0.5, 1.8), (0.5, 0.8), (2.5, 0.8), (2.5, 1.8), stroke: 1.2pt)
    // Connectors
    line((-1, 1), (0.5, 1.8), stroke: 1.2pt)
    line((-1, 0), (0.5, 0.8), stroke: 1.2pt)
    line((1, 0), (2.5, 0.8), stroke: 1.2pt)
    line((1, 1), (2.5, 1.8), stroke: 1.2pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một tấm tôn hình chữ nhật dài $2$ m, rộng $60$ cm. Người ta gập hai bên mép của tấm tôn lên một đoạn bằng $x$ (cm) vuông góc với tấm tôn để tạo thành một máng nước có mặt cắt ngang là hình chữ nhật. Thể tích lớn nhất của máng nước đó bằng bao nhiêu lít?],
  [$90$],
  loigiai: [
    #step[Đổi $2$ m $= 200$ cm. Kích thước máng: đáy ngang $60 - 2x$, cao $x$, dài $200$.]
    #step[Thể tích $V(x) = 200 x(60 - 2x) = 200(60x - 2x^2)$.]
    #step[Đạo hàm $V'(x) = 200(60 - 4x) = 0 <=> x = 15$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $15$, $30$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $90000$, $0$)
        
      )
      ]
      Thể tích lớn nhất $90000$ $"cm"^3 = 90$ lít.]
  ]
)

#my-tln(de: "Đề 4", 
  dir: "doc",
  [Một khối cầu có bán kính $R = 10$ dm. Một hình trụ nội tiếp trong khối cầu. Diện tích xung quanh lớn nhất của hình trụ đó bằng bao nhiêu $pi "dm"^2$? (Chỉ điền hệ số trước $pi$, ví dụ kết quả là $100pi$ thì điền $100$).],
  [$200$],
  loigiai: [
    #step[Gọi bán kính trụ là $r$, nửa chiều cao là $h$. $r^2 + h^2 = 100 => r^2 = 100 - h^2$.]
    #step[Diện tích xung quanh $S_"xq" = 2pi r(2h) = 4pi r h$. Xét hàm $f(h) = (S_"xq")^2 = 16pi^2 h^2(100 - h^2)$.]
    #step[Đạo hàm $f'(h) = 16pi^2(200h - 4h^3) = 0 <=> h^2 = 50 <=> h = sqrt(50)$. Khi đó $r^2 = 50$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $h$,
          der: $f'$,
          func: $f$,
          x-vals: ($0$, $sqrt(50)$, $10$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $f_"max"$, $0$)
        
      )
      ]
      $S_"xq" = 4pi sqrt(50) sqrt(50) = 200pi$. Hệ số là $200$.]
  ]
)

#my-tln(de: "Đề 4", 
  dir: "doc",
  [Một chiếc hộp hình hộp chữ nhật có nắp có thể tích bằng $72 "dm"^3$. Đáy của hộp là hình chữ nhật có chiều dài gấp đôi chiều rộng. Chiều cao của hộp bằng bao nhiêu decimet để diện tích toàn phần của hộp đạt giá trị nhỏ nhất?],
  [$4$],
  loigiai: [
    #step[Đáy dài $2x$, rộng $x$. Chiều cao $h$. Thể tích $V = 2x^2 h = 72 => h = (36)/(x^2)$.]
    #step[Diện tích toàn phần $S(x) = 2(2x^2) + 2(2x + x)h = 4x^2 + 6x h = 4x^2 + (216)/(x)$.]
    #step[Đạo hàm $S'(x) = 8x - (216)/(x^2) = 0 <=> x^3 = 27 <=> x = 3$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $3$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $108$, $+oo$)
        
      )
      ]
      Khi $x = 3$, chiều cao $h = (36)/(9) = 4$ dm.]
  ]
)


#my-tln(de: "Đề 4", 
  dir: "doc",
  [Từ một tấm tôn hình vuông có cạnh $a = 60$ cm, người ta cắt bỏ bốn tứ giác bằng nhau ở bốn góc để được một tấm tôn dạng hình chữ thập. Sau đó, gấp các cánh của hình chữ thập lên để tạo thành một khối chóp tứ giác đều. Tìm thể tích lớn nhất của khối chóp này (đơn vị: $"cm"^3$). (Làm tròn kết quả đến hàng đơn vị).],
  [$2576$],
  loigiai: [
    #step[Gọi cạnh đáy của khối chóp là $x$ ($0 < x < 60$). Đường cao của các mặt bên (tam giác cân) là $l = (60 - x)/(2)$.]
    #step[Chiều cao của khối chóp là $h = sqrt(l^2 - ((x)/(2))^2) = sqrt(((60-x)^2)/(4) - (x^2)/(4)) = (1)/(2)sqrt(3600 - 120x)$. Điều kiện xác định: $3600 - 120x > 0 => x < 30$.]
    #step[Thể tích khối chóp: $V(x) = (1)/(3)x^2 h = (1)/(6)x^2 sqrt(3600 - 120x)$.]
    #step[Xét hàm số $f(x) = x^4(3600 - 120x) = 3600x^4 - 120x^5$ trên khoảng $(0, 30)$. Đạo hàm $f'(x) = 14400x^3 - 600x^4 = 0 <=> x = 24$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $f'$,
          func: $f$,
          x-vals: ($0$, $24$, $30$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $f_"max"$, $0$)
        
      )
      ]
      Khi $x = 24$, $V_"max" = (1)/(6) dot 24^2 dot sqrt(3600 - 120(24)) = 96 sqrt(720) = 1152 sqrt(5) approx 2576$. Thể tích lớn nhất làm tròn là $2576$ $"cm"^3$.]
  ]
)

#my-tln(de: "Đề 4", 
  dir: "doc",
  [Từ một tấm bìa hình chữ nhật kích thước $18 times 48$ (cm), người ta cắt bỏ $2$ hình vuông cạnh $x$ ở hai góc của một chiều rộng và cắt $2$ hình chữ nhật ở hai góc của chiều rộng đối diện, sao cho phần bìa còn lại có thể gấp thành một hình hộp chữ nhật có nắp đậy. Tìm $x$ để thể tích hình hộp là lớn nhất.],
  [$4$],
  loigiai: [
    #step[Khi gấp thành hộp chữ nhật có nắp, kích thước hộp sẽ là: chiều cao $x$, chiều rộng $y = 18 - 2x$, chiều dài $z = 24 - x$ (hoặc ngược lại). Điều kiện: $0 < x < 9$.]
    #step[Thể tích hộp là $V(x) = x(18 - 2x)(24 - x) = 2x(9 - x)(24 - x) = 2x(216 - 33x + x^2) = 2x^3 - 66x^2 + 432x$.]
    #step[Đạo hàm $V'(x) = 6x^2 - 132x + 432 = 6(x^2 - 22x + 72) = 0 <=> x = 4$ hoặc $x = 18$ (loại vì $x < 9$).]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $4$, $9$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $800$, $0$)
        
      )
      ]
      Vậy để thể tích hình hộp lớn nhất thì $x = 4$ cm.]
  ]
)

#my-tln(de: "Đề 4", 
  dir: "doc",
  [Một đoạn dây thép dài $100$ cm được chia làm hai phần. Một phần uốn thành một hình vuông, phần còn lại uốn thành một hình tròn. Gọi độ dài đoạn dây uốn thành hình tròn là $x$ (cm). Để tổng diện tích của hình vuông và hình tròn nhỏ nhất thì giá trị của $x$ gần nhất với số nguyên nào sau đây?],
  [$44$],
  loigiai: [
    #step[Đoạn dây uốn thành hình tròn dài $x$ nên chu vi hình tròn là $x =>$ bán kính $r = (x)/(2pi) =>$ Diện tích hình tròn là $S_1 = pi ((x)/(2pi))^2 = (x^2)/(4pi)$.]
    #step[Đoạn dây uốn thành hình vuông dài $100 - x$ nên cạnh hình vuông là $(100 - x)/(4) =>$ Diện tích hình vuông là $S_2 = ((100 - x)/(4))^2$.]
    #step[Tổng diện tích $S(x) = (x^2)/(4pi) + ((100 - x)^2)/(16)$ với $0 < x < 100$.]
    #step[Đạo hàm $S'(x) = (x)/(2pi) - (100 - x)/(8) = 0 <=> 4x - pi(100 - x) = 0 <=> x = (100pi)/(4 + pi) approx 43.99$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $(100pi)/(4+pi)$, $100$),
          d-signs: ("-", "0", "+"),
          v-vals: ($625$, $S_"min"$, $(10000)/(16)$)
        
      )
      ]
      Vậy $x approx 43.99$ cm, gần nhất với số $44$.]
  ]
)


