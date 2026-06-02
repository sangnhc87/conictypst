#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ─── CẤU HÌNH TRANG ───────────────────────────────────────────────────────────
#set page(paper: "a4", margin: (x: 1.5cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 10.8pt, lang: "vi")
#set par(justify: true, leading: 0.9em)
#set math.equation(numbering: none)

// ─── HEADING STYLES ───────────────────────────────────────────────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("00695C"), rgb("00897B"), rgb("26A69A"), angle: 120deg),
  inset: (x: 18pt, y: 12pt), radius: 8pt, above: 2em, below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body)
)
#show heading.where(level: 2): it => block(
  above: 1.6em, below: 0.9em,
  stroke: (left: 5pt + rgb("00897B"), rest: none),
  inset: (left: 12pt, y: 6pt),
  text(fill: rgb("00695C"), size: 12pt, weight: "bold", it.body)
)
#show heading.where(level: 3): it => block(
  above: 1.2em, below: 0.5em,
  text(fill: rgb("004D40"), size: 11pt, weight: "bold", it.body)
)

// ─── CÁC KHUNG ĐẶC BIỆT ──────────────────────────────────────────────────────
#let theory-box(title: "Khung Lý Thuyết", body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 5pt + rgb("00695C"), rest: 1pt + rgb("80CBC4")),
  radius: (right: 8pt, left: 0pt), inset: (x: 18pt, y: 16pt), width: 100%, above: 0.8em,
)[
  #text(fill: rgb("004D40"), weight: "bold", size: 12pt)[🎯 #title]
  #v(0.5em)
  #body
]

#let cannon-box(title, body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 5pt + rgb("F4511E"), rest: 1pt + rgb("FFCC80")),
  radius: (right: 8pt, left: 0pt), inset: (x: 16pt, y: 14pt), width: 100%, above: 0.8em,
)[
  #text(fill: rgb("BF360C"), weight: "bold", size: 11pt)[🔥 #title]
  #v(0.5em)
  #body
]

#let tip-box(body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + rgb("43A047"), rest: 0.8pt + rgb("A5D6A7")),
  radius: (right: 6pt), inset: (x: 14pt, y: 10pt), width: 100%,
)[
  #text(fill: rgb("1B5E20"), weight: "bold")[💡 Bí kíp nhận dạng:]
  #v(0.2em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FBE9E7"),
  stroke: (left: 4pt + rgb("E53935"), rest: 0.8pt + rgb("FFCDD2")),
  radius: (right: 6pt), inset: (x: 14pt, y: 10pt), width: 100%,
)[
  #text(fill: rgb("B71C1C"), weight: "bold")[⚠️ Bẫy thường gặp:]
  #v(0.2em)
  #body
]

#let result-box(body) = block(
  fill: gradient.linear(rgb("E3F2FD"), rgb("F3E5F5"), angle: 90deg),
  stroke: 1.2pt + rgb("5C6BC0"),
  radius: 6pt, inset: (x: 14pt, y: 10pt), width: 100%,
)[
  #text(fill: rgb("1A237E"), weight: "bold")[📌 Kết quả:]
  #v(0.2em)
  #body
]

// ─── TIÊU ĐỀ CHUYÊN ĐỀ ───────────────────────────────────────────────────────
#align(center)[
  #block(
    fill: gradient.linear(rgb("004D40"), rgb("00897B"), rgb("26A69A"), angle: 135deg),
    inset: (x: 28pt, y: 20pt), radius: 12pt, width: 100%,
  )[
    #text(fill: white, size: 16pt, weight: "bold")[
      ⚡ CHUYÊN ĐỀ: TÌM KHOẢNG CÁCH NHỎ NHẤT
    ]
    #v(0.3em)
    #text(fill: rgb("B2DFDB"), size: 11.5pt, style: "italic")[
      Phương Pháp Cặp Tiếp Tuyến Song Song & Mô Hình Hoá Toán Học Thực Tế
    ]
    #v(0.3em)
    #text(fill: rgb("80CBC4"), size: 10pt)[
      _Định hướng dự đoán đề thi Đại học — Bộ Giáo Dục 2025–2026_
    ]
  ]
]

= Phần I. Nền Tảng Lý Thuyết

== 1.1. Bản Chất Hình Học

Hai đường cong (hoặc một đường cong và một đường thẳng) rời nhau trong mặt phẳng luôn có một khoảng cách nhỏ nhất. Điểm $M$ trên đường cong và điểm $N$ trên đường còn lại thỏa mãn $|M N|_(min)$ chính là hai đầu mút của *pháp tuyến chung* — đường nối vuông góc với cả hai đường tại hai điểm đó.

#theory-box(title: "Định lý Tiếp Tuyến Song Song")[
  *Trường hợp 1 — Đường cong $(C): y = f(x)$ và Đường thẳng $d: y = a x + b$*

  #grid(columns: (1fr, auto), gutter: 12pt,
    [
      Điểm $M_0(x_0, f(x_0)) in (C)$ có khoảng cách đến $d$ nhỏ nhất khi và chỉ khi tiếp tuyến của $(C)$ tại $M_0$ *song song* với $d$, tức là:
      $ f'(x_0) = a $
      Sau đó, khoảng cách nhỏ nhất là:
      $ d_(min) = frac(|a x_0 - f(x_0) + b|, sqrt(a^2 + 1)) $
    ],
    cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      // y = x^2 / 4 (parabola) vs y = x - 3 (line a=1)
      // f'(x0) = x0/2 = 1 => x0 = 2, y0 = 1. Min-dist line.
      set-style(stroke: 0.8pt)
      // Axes
      line((0, 0), (4.5, 0), mark: (end: ">"))
      line((0, 0), (0, 4), mark: (end: ">"))
      content((4.4, -0.25), text(size: 8pt)[$x$])
      content((-0.3, 3.9), text(size: 8pt)[$y$])
      // Parabola approx with bezier
      bezier((0.2, 0.01), (4.3, 4.6), (0.5, -0.3), (3.5, 1.5), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
      content((4.1, 4.4), text(size: 8pt, fill: rgb("1565C0"))[$(C)$])
      // Line d: y = x - 3  => passes (1,-2)->(4,1) scaled
      line((1.5, 0.1), (4.2, 2.8), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
      content((4.3, 2.85), text(size: 8pt, fill: rgb("D84315"))[$d$])
      // Tangent at M0 (parallel to d)
      // x0~2, y0~1 on parabola scaled
      line((0.8, -0.6), (3.5, 2.1), stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed"))
      content((0.5, -0.7), text(size: 8pt, fill: rgb("43A047"))[$t$])
      // M0 point
      circle((2.0, 0.75), radius: 0.1, fill: rgb("1565C0"))
      content((1.8, 0.55), text(size: 8pt)[$M_0$])
      // shortest distance
      line((2.0, 0.75), (2.6, 1.35), stroke: (paint: rgb("F57F17"), thickness: 1.3pt, dash: "dotted"), mark: (end: ">", start: ">"))
      content((2.9, 0.9), text(size: 8pt, fill: rgb("F57F17"))[$d_(min)$])
    })
  )

  #v(0.6em)
  *Trường hợp 2 — Hai đường cong $(C_1): y = f(x)$ và $(C_2): y = g(x)$ rời nhau*

  Điểm $A in (C_1)$ và $B in (C_2)$ thỏa $|A B|$ nhỏ nhất khi:
  #align(center)[
    $f'(x_A) = g'(x_B) = k$ (cùng hệ số góc tiếp tuyến) #h(1em) và #h(1em) $A B perp$ hai tiếp tuyến đó
  ]
  *Trường hợp đặc biệt — Hàm ngược (đối xứng qua $y = x$):*
  Nếu $g = f^(-1)$, thì $d_(min)$ giữa $(C_1)$ và $(C_2)$ $= 2 times d(M_0, y = x)$ với $f'(x_0) = 1$.
]

== 1.2. Quy Trình Giải (Thuật Toán 4 Bước)

#block(fill: rgb("F5F5F5"), stroke: 1pt + rgb("BDBDBD"), radius: 6pt, inset: (x: 16pt, y: 12pt), width: 100%)[
  #grid(columns: (auto, 1fr), gutter: 10pt,
    block(fill: rgb("00897B"), inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold")[ B1 ]],
    [*Nhận dạng dạng bài:* Đường cong & Đường thẳng? Hay Hai đường cong? Có tính đối xứng không?],
    block(fill: rgb("00897B"), inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold")[ B2 ]],
    [*Tính đạo hàm* $f'(x)$ (và $g'(x)$ nếu có hai đường cong).],
    block(fill: rgb("00897B"), inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold")[ B3 ]],
    [*Ép song song tiếp tuyến:* Giải pt $f'(x_0) = a$ (hoặc $f'(x_A) = g'(x_B)$). Lưu ý: có thể nhiều nghiệm!],
    block(fill: rgb("00897B"), inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold")[ B4 ]],
    [*Tính khoảng cách* từ điểm tìm được đến đường kia. So sánh nếu có nhiều nghiệm, lấy giá trị nhỏ nhất.],
  )
]


= Phần II. Các Mô Hình Toán Thực Tế (Dự Đoán Đề Thi)

#cannon-box("Mô hình 1 — Drone Cứu Hộ Tiếp Cận Vùng Lũ  [Hàm Phân Thức]", [

  *Bài toán thực tế:* Sau trận mưa lớn, một dòng lũ quét bùn đỏ tràn qua thung lũng. Đội cứu hộ dùng ảnh vệ tinh mô hình hóa ranh giới ngoài cùng của vùng ngập lụt (với $x > 1$, đơn vị km) là:
  $ (C): quad y = x + frac(1, x - 1) $
  Một chiếc Drone chở hàng cứu trợ được điều khiển bay theo đường thẳng cố định:
  $ d: quad y = -3x + 10 $
  *Hỏi:* Khoảng cách ngắn nhất từ đường bay của Drone đến vùng lũ là bao nhiêu km?

  #grid(columns: (1fr, auto), gutter: 16pt, [
    *Giải:*

    #text(weight: "bold", fill: rgb("004D40"))[Bước 1:] Nhận dạng — Đường cong & Đường thẳng, hệ số góc $a = -3$.

    #text(weight: "bold", fill: rgb("004D40"))[Bước 2:] Tính đạo hàm:
    $ y' = 1 - frac(1, (x-1)^2) $

    #text(weight: "bold", fill: rgb("004D40"))[Bước 3:] Ép tiếp tuyến song song với $d$:
    $ 1 - frac(1, (x-1)^2) = -3 => (x-1)^2 = frac(1,4) $
    Vì $x > 1$, ta lấy $x - 1 = 1/2$, được $x_0 = 3/2$.

    #text(weight: "bold", fill: rgb("004D40"))[Bước 4:] Tọa độ điểm gần nhất trên vùng lũ:
    $ y_0 = 3/2 + frac(1, 1/2) = 3/2 + 2 = 7/2 quad => M_0(3/2, 7/2) $

    Khoảng cách từ $M_0$ đến đường thẳng $3x + y - 10 = 0$:
    $ d_(min) = frac(lr(|3 dot 3/2 + 7/2 - 10|), sqrt(10)) = frac(lr(|9/2 + 7/2 - 10|), sqrt(10)) = frac(2, sqrt(10)) = frac(sqrt(10), 5) $
  ],
  cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    // Axes
    line((0,0),(5,0), mark: (end: ">"))
    line((0,0),(0,5), mark: (end: ">"))
    content((4.9,-0.3), text(size:8pt)[$x$])
    content((-0.3,4.9), text(size:8pt)[$y$])
    // Label axes
    for i in (1,2,3,4) {
      line((i,-0.07),(i,0.07)); line((-0.07,i),(0.07,i))
      content((i,-0.3), text(size:7pt)[#i])
      content((-0.3,i), text(size:7pt)[#i])
    }
    // Draw curve C: y = x + 1/(x-1) for x in (1.15, 4)
    // points: 1.2->6.2(clip), 1.5->3.5, 2->3, 3->3.5, 4->4.33
    // Use bezier approximation (scaled by 1 since length=1cm)
    bezier((1.3, 4.6), (4.0, 4.15), (1.5, 3.5), (3.0, 3.5), stroke: (paint: rgb("1565C0"), thickness: 1.6pt))
    content((4.2, 4.2), text(size:8pt, fill: rgb("1565C0"))[$(C)$])
    // Line d: y = -3x+10, passes (2,4),(3,1)
    line((1.5,5.5),(3.5,0), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    content((3.6, 0.05), text(size:8pt, fill: rgb("D84315"))[$d$])
    // Point M0 at (1.5, 3.5)
    circle((1.5, 3.5), radius: 0.1, fill: rgb("1565C0"))
    content((1.1, 3.5), text(size:8pt)[$M_0$])
    // Tangent at M0 (parallel to d): slope -3, y = -3(x-1.5)+3.5 = -3x+8
    // passes (1, 5) and (2.5, 0.5)
    line((1.0, 5.0), (2.6, 0.2), stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed"))
    content((0.6, 5.0), text(size:8pt, fill: rgb("43A047"))[$t_(M_0)$])
    // shortest distance from M0 to d (perpendicular)
    // d_perp direction: (3,1)/sqrt(10). From M0(1.5,3.5): foot = ...
    line((1.5, 3.5), (1.84, 4.52), stroke: (paint: rgb("F57F17"), thickness: 1.3pt), mark: (end: ">"))
    content((2.0, 4.3), text(size:8pt, fill: rgb("F57F17"))[$d_(min)$])
  }))

  #result-box[
    Drone có thể tiếp cận vùng lũ ở khoảng cách ngắn nhất $d_(min) = frac(sqrt(10), 5) approx 0.632$ km.
  ]

  #tip-box[
    Chú ý điều kiện xác định của hàm phân thức: $x > 1$. Nếu bỏ qua, ta có thể lấy nhầm nghiệm $x - 1 = -1/2$ (không thuộc miền xác định).
  ]
])

#v(0.6em)

#cannon-box("Mô hình 2 — Tàu Lượn & Dây Cáp Treo  [Hàm Bậc 3 — Hai Nghiệm]", [

  *Bài toán thực tế:* Tại một công viên giải trí, đường ray tàu lượn siêu tốc uốn lượn theo:
  $ (C): quad y = x^3 - 3x^2 + 5x + 2 $
  Một tuyến cáp treo chạy cắt qua theo hướng:
  $ d: quad y = 5x - 10 $
  Để đảm bảo *an toàn khoảng tĩnh không*, ban quản lý cần biết: Khoảng cách ngắn nhất giữa tàu lượn và dây cáp là bao nhiêu? Vị trí nào trên đường ray nguy hiểm nhất?

  #grid(columns: (1fr, auto), gutter: 16pt, [
    *Giải:*

    Hệ số góc cáp treo: $a = 5$. Tính đạo hàm: $y' = 3x^2 - 6x + 5$.

    Ép song song tiếp tuyến:
    $ 3x^2 - 6x + 5 = 5 => 3x^2 - 6x = 0 => x(x - 2) = 0 $
    *Hai nghiệm:* $x = 0$ và $x = 2$ (hai khúc lượn cùng dốc với cáp treo).

    - Tại $x=0$: $y_A = 2$. Tiếp tuyến: $5x - y + 2 = 0$.
      $d_A = frac(lr(|2-(-10)|), sqrt(26)) = frac(12, sqrt(26))$

    - Tại $x=2$: $y_B = 8 - 12 + 10 + 2 = 8$. Tiếp tuyến: $5x - y - 2 = 0$.
      $d_B = frac(lr(|{-2}-(-10)|), sqrt(26)) = frac(8, sqrt(26))$

    So sánh: $d_B = 8/sqrt(26) < d_A = 12/sqrt(26)$.
  ],
  cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0,0),(5.5,0), mark: (end: ">"))
    line((0,0),(0,5.5), mark: (end: ">"))
    content((5.4,-0.3), text(size:8pt)[$x$])
    content((-0.3,5.4), text(size:8pt)[$y$])
    // Cubic curve y=x^3-3x^2+5x+2, scaled x1, y/3
    // x:0->y:2/3~0.67, x:1->5/3~1.67, x:2->8/3~2.67, x:3->17/3~5.67
    // scale y by 1, shift: show range x in -0.5..3.5, y in 0..5
    // scaled: xc=x+1, yc=y/3
    bezier((1.0, 0.67), (4.0, 5.67), (1.8, 0.4), (3.5, 3.0), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    content((4.1, 5.5), text(size:8pt, fill: rgb("1565C0"))[$(C)$])
    // Line d: y=5x-10, scaled yc = (5x-10)/3. xc=x+1
    // xc=2 -> yc=0; xc=4 -> yc=10/3~3.33
    line((2.0, 0.0), (4.6, 4.3), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    content((4.8, 4.3), text(size:8pt, fill: rgb("D84315"))[$d$])
    // Points A(0,2), B(2,8) => scaled: A(1, 0.67), B(3, 2.67)
    circle((1.0, 0.67), radius: 0.1, fill: rgb("F57F17"))
    content((0.7, 0.5), text(size:8pt, fill: rgb("F57F17"))[$A$])
    circle((3.0, 2.67), radius: 0.1, fill: rgb("1565C0"))
    content((3.2, 2.5), text(size:8pt, fill: rgb("1565C0"))[$B$])
    // Tangents at A and B (parallel to d, slope 5 -> scaled slope 5/3)
    line((0.2, -1.0), (2.0, 2.0), stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed"))
    line((2.0, 0.7), (4.0, 4.0), stroke: (paint: rgb("9C27B0"), thickness: 1pt, dash: "dashed"))
    // Perpendiculars to d
    line((3.0, 2.67), (3.8, 1.27), stroke: (paint: rgb("9C27B0"), thickness: 1.2pt), mark: (end: ">"))
    content((4.0, 1.8), text(size:8pt, fill: rgb("9C27B0"))[$d_(min)$])
  }))

  #result-box[
    Điểm $B(2, 8)$ nguy hiểm nhất. Khoảng cách an toàn tối thiểu: $d_(min) = frac(8, sqrt(26)) = frac(4sqrt(26), 13) approx 1.57$ đơn vị.
  ]

  #warn-box[
    *Bẫy nhiều nghiệm:* Khi đạo hàm cho ra nhiều nghiệm $x_1, x_2, ...$, phải tính khoảng cách tại *từng điểm* rồi so sánh lấy *nhỏ nhất*. Đề thi hay hỏi "vị trí nguy hiểm nhất" chính là điểm cho $d$ nhỏ nhất!
  ]
])

#v(0.6em)

#cannon-box("Mô hình 3 — Hành Lang Sinh Thái Vành Đai Nhiệt Điện  [Hàm Mũ & Logarit — Tuyệt Kỹ Đối Xứng]", [

  *Bài toán thực tế:* Một nhà máy nhiệt điện nằm ven sông. Ranh giới vùng ô nhiễm nhiệt (nước nóng) được mô hình bằng đường cong:
  $ (C_1): quad y = e^x $
  Phía đối diện, khu sinh thái rừng ngập mặn phát triển dọc theo ranh giới:
  $ (C_2): quad y = ln x $
  Quy hoạch đô thị yêu cầu xây dựng một *hành lang xanh* thẳng tắp kẹp giữa hai vùng. Tính chiều rộng hẹp nhất của hành lang này.

  #grid(columns: (1fr, auto), gutter: 16pt, [
    *Giải:*

    *Nhận xét đột phá:* $y = e^x$ và $y = ln x$ là hai hàm ngược của nhau, nên đồ thị của chúng *đối xứng qua đường* $y = x$.

    Khoảng cách giữa hai đường cong = $2 times$ khoảng cách từ $(C_1)$ đến đường trục đối xứng $y = x$ (hay $x - y = 0$).

    Ta tìm điểm $M_0$ trên $(C_1): y = e^x$ gần $y = x$ nhất (tiếp tuyến song song với $y = x$):
    $ y' = e^x = 1 => x_0 = 0 => y_0 = 1 => M_0(0, 1) $

    Khoảng cách từ $M_0(0, 1)$ đến đường $x - y = 0$:
    $ d_0 = frac(|0 - 1|, sqrt(2)) = frac(1, sqrt(2)) $

    Khoảng cách nhỏ nhất giữa hai đường cong:
    $ d_(min) = 2 d_0 = frac(2, sqrt(2)) = sqrt(2) $
  ],
  cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    line((0,0),(4.5,0), mark: (end: ">"))
    line((0,0),(0,4.5), mark: (end: ">"))
    content((4.4,-0.28), text(size:8pt)[$x$])
    content((-0.3,4.4), text(size:8pt)[$y$])
    // y=x diagonal
    line((-0.2,-0.2),(4.2,4.2), stroke: (paint: rgb("9E9E9E"), thickness: 0.9pt, dash: "dashed"))
    content((4.3,4.0), text(size:7pt, fill: rgb("757575"))[$y=x$])
    // y = e^x: at x=-1->0.37, x=0->1, x=1->2.72, x=1.5->4.48
    bezier((-0.5, 0.6), (1.5, 4.48), (0.0, 1.0), (1.0, 2.72), stroke: (paint: rgb("E53935"), thickness: 1.5pt))
    content((1.8, 4.3), text(size:8pt, fill: rgb("E53935"))[$(C_1)$])
    // y = ln(x): at x=0.37->-1, x=1->0, x=2.72->1, x=4.48->1.5
    bezier((0.6, -0.5), (4.48, 1.5), (1.0, 0.0), (2.72, 1.0), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    content((4.3, 1.5), text(size:8pt, fill: rgb("1565C0"))[$(C_2)$])
    // Point M0 on C1: (0, 1)
    circle((0.0, 1.0), radius: 0.1, fill: rgb("E53935"))
    content((-0.45, 1.0), text(size:8pt)[$M_0$])
    // Symmetric point on C2: (1, 0)
    circle((1.0, 0.0), radius: 0.1, fill: rgb("1565C0"))
    content((1.0, -0.3), text(size:8pt)[$N_0$])
    // Line segment M0-N0
    line((0,1),(1,0), stroke: (paint: rgb("F57F17"), thickness: 1.5pt), mark: (start: ">", end: ">"))
    content((0.7, 0.75), text(size:8pt, fill: rgb("F57F17"))[$d_(min)$])
    // d0 from M0 to y=x
    line((0,1),(0.5,0.5), stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dotted"))
    content((-0.2, 0.55), text(size:7pt, fill: rgb("2E7D32"))[$d_0$])
  }))

  #result-box[
    Hành lang xanh có chiều rộng hẹp nhất $d_(min) = sqrt(2) approx 1.414$ km.
    Hai điểm gần nhất là $M_0(0, 1)$ trên vùng nhiệt điện và $N_0(1, 0)$ trên khu sinh thái.
  ]

  #tip-box[
    *Chiêu đối xứng:* Nếu đề cho $(C_1)$ và $(C_2)$ là hàm ngược nhau ($f^(-1) = g$), *đừng bao giờ* lập hệ phương trình cồng kềnh! Nhận ra trục đối xứng $y = x$, ép tiếp tuyến song song với nó ($f'(x) = 1$), nhân đôi khoảng cách lên là xong. Nhanh gấp 5 lần!
  ]
])

#v(0.6em)

#cannon-box("Mô hình 4 — Giếng Khoan Khai Thác Khoáng Sản  [Hàm Bậc 4 — Phân Tích Đa Thức]", [

  *Bài toán thực tế:* Địa chất học mô hình hóa mặt cắt ngang của một vỉa quặng titan quý hiếm (đơn vị: km) bằng hàm bậc 4:
  $ (C): quad y = frac(1, 4)x^4 - x^3 + 5x $
  Một đường hầm ngang đang được đào theo phương trình:
  $ d: quad y = x - 10 $
  Kỹ sư mỏ cần xác định *vị trí và chiều dài tối ưu* của giếng khoan nối từ đường hầm xuống vỉa quặng, sao cho chi phí đào ngắn nhất.

  #grid(columns: (1fr, auto), gutter: 14pt, [
    *Giải:*

    Hệ số góc đường hầm: $a = 1$. Đạo hàm vỉa quặng:
    $ y' = x^3 - 3x^2 + 5 $

    Ép song song tiếp tuyến với đường hầm:
    $ x^3 - 3x^2 + 5 = 1 => x^3 - 3x^2 + 4 = 0 $

    Thử nghiệm $x = -1$: $(-1)^3 - 3(-1)^2 + 4 = -1 - 3 + 4 = 0$ ✓

    Phân tích nhân tử:
    $ x^3 - 3x^2 + 4 = (x+1)(x^2 - 4x + 4) = (x+1)(x-2)^2 $

    *Các nghiệm:* $x = -1$ và $x = 2$ (nghiệm kép, tiếp tuyến nằm ngay trên đường hầm!).

    #v(0.3em)
    *Xét tại $x = -1$:* $y = 1/4 + 1 - 5 = -15/4$

    $=> d_1 = frac(lr(|-1-(-15/4)-10|), sqrt(2)) = frac(lr(|(-4+15-40)/4|), sqrt(2)) = frac(29/4, sqrt(2)) = frac(29sqrt(2), 8)$

    *Xét tại $x = 2$ (nghiệm kép):* $y = 4 - 8 + 10 = 6$

    $=> d_2 = frac(lr(|2 - 6 - 10|), sqrt(2)) = frac(14, sqrt(2)) = 7sqrt(2)$

    So sánh: $d_1 = 29sqrt(2)/8 approx 5.13$ và $d_2 = 7sqrt(2) approx 9.90$.
  ],
  cetz.canvas(length: 0.75cm, {
    import cetz.draw: *
    line((-1.5,0),(4.5,0), mark: (end: ">"))
    line((0,-1.5),(0,5.5), mark: (end: ">"))
    content((4.4,-0.3), text(size:8pt)[$x$])
    content((-0.35,5.4), text(size:8pt)[$y$])
    // y = x^4/4 - x^3 + 5x, scaled y/3: x=-1->-15/4/3~-1.25, x=0->0, x=1->4.25/3~1.4, x=2->6/3=2, x=3->15.75/3~5.25
    bezier((-1.0, -1.25), (3.0, 5.25), (-0.5, -0.5), (1.5, 2.5), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    content((3.3, 5.2), text(size:8pt, fill: rgb("1565C0"))[$(C)$])
    // Line y=x-10 scaled: yc = (x-10)/3: at x=-1 -> -11/3~-3.67, x=4->-2
    line((-1.0, -3.67), (4.0, -2.0), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    content((4.2, -1.9), text(size:8pt, fill: rgb("D84315"))[$d$])
    // Points: M1(-1, -1.25), M2(2, 2)
    circle((-1.0, -1.25), radius: 0.12, fill: rgb("1565C0"))
    content((-1.5, -1.05), text(size:8pt)[$M_1$])
    circle((2.0, 2.0), radius: 0.12, fill: rgb("9C27B0"))
    content((2.3, 2.1), text(size:8pt, fill: rgb("9C27B0"))[$M_2$])
    // Perpendicular from M1 to d (direction (1,-1)/sqrt2)
    // foot of perp from M1(-1,-1.25) to y=x-10: foot~(-4.1,-2.7) but clamp to view
    line((-1.0,-1.25),(-2.5,-3.0), stroke: (paint: rgb("F57F17"), thickness: 1.3pt), mark: (end: ">"))
    content((-2.0,-2.0), text(size:7pt, fill: rgb("F57F17"))[$d_(min)$])
    // Tangents at M1, M2 (slope 1, scaled slope 1/3)
    line((-2.0,-2.5),(1.5,0.67), stroke: (paint: rgb("43A047"), thickness: 0.9pt, dash: "dashed"))
    line((0.5,0.83),(3.5,1.83), stroke: (paint: rgb("9C27B0"), thickness: 0.9pt, dash: "dashed"))
  }))

  #result-box[
    Vị trí tối ưu đặt giếng khoan: điểm $M_1(-1, -15/4)$ trên vỉa quặng.
    Chiều dài giếng khoan ngắn nhất: $d_(min) = frac(29sqrt(2), 8) approx 5.13$ km.
  ]

  #warn-box[
    $x = 2$ là *nghiệm kép* — tiếp tuyến tại đây tiếp xúc với đường hầm (nằm chồng lên nhau), nên $d_2$ rất lớn! Nghiệm kép thường là bẫy đề thi: điểm đó gần với đường thẳng nhưng theo nghĩa tiếp xúc, không phải khoảng cách ngắn.
  ]
])

#v(0.6em)

#cannon-box("Mô hình 5 — Sóng Radar & Đường Chân Trời  [Hai Đường Cong Parabol Đối Đầu — Nâng Cao]", [

  *Bài toán thực tế:* Hai hệ thống radar quân sự đối nghịch phát sóng quét theo quỹ đạo cong:
  - Radar Alpha: $(C_1): quad y = x^2 + 1$ (quét từ dưới lên)
  - Radar Beta: $(C_2): quad y = -x^2 + 2x - 1$ (quét từ trên xuống, tức $y = -(x-1)^2$)

  Hai vùng sóng radar tiến lại gần nhau. Hỏi khoảng cách ngắn nhất giữa hai vùng phủ sóng là bao nhiêu?

  *Giải:*

  Hai đường cong, cần ép $f'(x_A) = g'(x_B)$ và phương vuông góc.

  - $f'(x_A) = 2x_A$ và $g'(x_B) = -2x_B + 2$.
  - Ép bằng nhau (cùng hướng tiếp tuyến): $2x_A = -2x_B + 2 => x_A + x_B = 1$ ... (I)

  Điều kiện $A B$ vuông góc với tiếp tuyến: véc-tơ $vec(A B) = (x_B - x_A, y_B - y_A)$ phải vuông góc với tiếp tuyến $(1, 2x_A)$.

  $(x_B - x_A) + 2x_A (y_B - y_A) = 0$

  Ta có $y_A = x_A^2 + 1$ và $y_B = -(x_B - 1)^2$. Đặt $x_A = t$, thì $x_B = 1 - t$.

  Thay vào: $y_B = -(1-t-1)^2 = -t^2$.

  $(x_B - x_A) + 2x_A(y_B - y_A) = 0$
  $((1-t) - t) + 2t((-t^2) - (t^2+1)) = 0$
  $(1 - 2t) + 2t(-2t^2 - 1) = 0$
  $1 - 2t - 4t^3 - 2t = 0$
  $4t^3 + 4t - 1 = 0$

  Bằng phương pháp số (hoặc nhận xét): $t approx 0.2167$, tức $x_A approx 0.217$, $x_B approx 0.783$.

  Tọa độ: $A(0.217, 1.047)$ và $B(0.783, -0.047)$.

  $|A B| = sqrt((0.783-0.217)^2 + (-0.047 - 1.047)^2) = sqrt(0.566^2 + 1.094^2) approx sqrt(0.320 + 1.197) approx 1.232$

  #result-box[
    Hai hệ thống radar áp sát nhau đến khoảng cách tối thiểu $d_(min) approx 1.232$ đơn vị. Đây là bài toán *Hệ phương trình phi tuyến* đòi hỏi kỹ năng số học hoặc kết hợp đại số.
  ]

  #tip-box[
    Với hai đường cong đối đầu mà *không có tính đối xứng đặc biệt*, bài toán dẫn đến hệ phi tuyến. Đề thi thường chọn bộ số "đẹp" cho nghiệm tròn. Hãy thử $t = 1/2$ trước!
  ]
])

#pagebreak()

= Phần III. Bài Tập Tự Luyện (Kiểm Tra Bản Thân)

#block(fill: rgb("F9FBE7"), stroke: 1pt + rgb("C5E1A5"), radius: 6pt, inset: (x: 16pt, y: 14pt), width: 100%)[

  *Bài 1.* Đường cong $(C): y = sqrt(x+3)$ và đường thẳng $d: 2x - 4y + 1 = 0$. Tìm khoảng cách ngắn nhất từ $(C)$ đến $d$.

  _(Đáp số: $d_(min) = frac(sqrt(5), 5)$)_

  #v(0.5em)

  *Bài 2.* (Dạng thực tế) Một con tàu đánh cá di chuyển theo quỹ đạo $(C): y = x^2 - 4x + 7$. Bờ biển chạy theo đường thẳng $d: y = 2x - 5$. Điểm nào trên quỹ đạo tàu gần bờ nhất và khoảng cách đó là bao nhiêu?

  _(Đáp số: Điểm $(3, 4)$; $d_(min) = frac(6, sqrt(5)) = frac(6sqrt(5), 5)$)_

  #v(0.5em)

  *Bài 3.* (Nâng cao) Cho $(C_1): y = e^(2x)$ và $(C_2): y = frac(1,2) ln x$. Chứng minh hai đường cong đối xứng qua $y = x$ và tính khoảng cách ngắn nhất giữa chúng.

  _(Gợi ý: $g(x) = f^(-1)(x)$ khi $f(t) = e^(2t) => t = frac(1,2)ln x$. Tìm $f'(x_0) = 1 => 2e^(2x_0) = 1 => x_0 = -frac(1,2)ln 2$.)_

  #v(0.5em)

  *Bài 4.* (Thực tế — Thiết kế đường ray) Đường ray xe lửa leo núi được thiết kế theo hàm $y = x^3 - 6x^2 + 12x$. Một đường hầm dẫn vào núi theo $y = 3x + 5$. Xác định vị trí và khoảng cách ngắn nhất giữa đường ray và miệng hầm.
]
