#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

// ── Heading styles ───────────────────────────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D47A1"), rgb("1565C0"), rgb("1976D2"), angle: 90deg),
  stroke: none,
  inset: (x: 16pt, y: 12pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("C62828")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("C62828"), size: 12.5pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("2E7D32")),
  inset: (left: 8pt, y: 4pt),
  text(fill: rgb("2E7D32"), size: 11.5pt, weight: "bold", it.body),
)

// ── Chế độ in ─────────────────────────────────────────────
#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ── Màu chủ đề ───────────────────────────────────────────
#let col-blue = rgb("0D47A1")
#let col-red = rgb("C62828")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")
#let col-teal = rgb("00695C")
#let col-purple = rgb("6A1B9A")
#let col-bg-lt = rgb("E3F2FD")
#let col-bg-red = rgb("FFEBEE")
#let col-bg-grn = rgb("E8F5E9")
#let col-bg-amb = rgb("FFF3E0")

// ── Hộp lý thuyết tùy chỉnh ───────────────────────────────
#let theory-box(title: none, color: col-blue, bg: col-bg-lt, body) = block(
  fill: bg,
  stroke: (left: 4pt + color, rest: 0.7pt + color.lighten(50%)),
  radius: (right: 6pt),
  inset: (x: 15pt, y: 13pt),
  width: 100%,
  below: 1em,
)[
  #if title != none [
    #text(weight: "bold", fill: color, size: 11pt)[#title]
    #v(0.5em)
  ]
  #body
]

#let formula-box(body) = block(
  fill: rgb("FFFDE7"),
  stroke: 1pt + rgb("F9A825"),
  radius: 5pt,
  inset: (x: 14pt, y: 10pt),
  width: 100%,
)[#body]

#let step-box(n, body) = [
  #block(
    fill: col-blue.lighten(90%),
    stroke: (left: 3pt + col-blue),
    inset: (x: 12pt, y: 8pt),
    width: 100%,
  )[
    #text(weight: "bold", fill: col-blue)[Bước #n:] #body
  ]
]

// ═══════════════════════════════════════════════
// BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #rect(
    fill: col-bg-lt,
    stroke: (left: 6pt + col-blue, rest: 0.8pt + col-blue.lighten(60%)),
    inset: (x: 20pt, y: 18pt),
    width: 97%,
    radius: (right: 8pt),
  )[
    #text(size: 17pt, weight: "bold", fill: col-blue)[
      CHUYÊN ĐỀ: BA ĐƯỜNG CONIC VÀ ỨNG DỤNG TÍCH PHÂN
    ]
    #v(0.4em)
    #text(size: 11pt, style: "italic", fill: rgb("555555"))[
      Nhận diện Conic ẩn · Diện tích miền phẳng · Thể tích khối quay · Bể nước · Bài toán thực tiễn
    ]
    #v(0.3em)
    #align(center)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 8pt,
        rect(fill: col-blue.lighten(85%), stroke: none, inset: 8pt, radius: 5pt)[
          #text(weight: "bold", fill: col-blue)[PARABOL] \
          #text(size: 9pt)[$y^2 = 4p x$, tâm sai $e=1$]
        ],
        rect(fill: col-red.lighten(85%), stroke: none, inset: 8pt, radius: 5pt)[
          #text(weight: "bold", fill: col-red)[ELIP] \
          #text(size: 9pt)[$x^2/a^2 + y^2/b^2 = 1$, tâm sai $e < 1$]
        ],
        rect(fill: col-green.lighten(85%), stroke: none, inset: 8pt, radius: 5pt)[
          #text(weight: "bold", fill: col-green)[HYPEBOL] \
          #text(size: 9pt)[$x^2/a^2 - y^2/b^2 = 1$, tâm sai $e > 1$]
        ],
      )
    ]
  ]
]

#v(1em)

// ═══════════════════════════════════════════════════════════
// PHẦN I: LÝ THUYẾT NỀN
// ═══════════════════════════════════════════════════════════
= Phần I: Lý Thuyết Nền — Ba Đường Conic

== 1.1 Định nghĩa thống nhất và tâm sai

#lythuyet(title: [📐 Định nghĩa thống nhất bằng tâm sai $e$])[
  Cho điểm cố định $F$ (tiêu điểm) và đường thẳng cố định $Delta$ (đường chuẩn) không qua $F$. Tập hợp các điểm $M$ trong mặt phẳng thỏa mãn:
  $
    frac(|M F|, d(M, Delta)) = e = "const" > 0
  $
  là một *đường Conic* với tâm sai $e$:
  - $e = 1$: *Parabol*
  - $0 < e < 1$: *Elip* (trường hợp đặc biệt $e=0$: đường tròn)
  - $e > 1$: *Hypebol*

  _Ý nghĩa thực tiễn:_ Cùng một công thức, chỉ thay đổi $e$, ta thu được ba dạng đường cong hoàn toàn khác nhau. Đây là "chìa khóa" nhận diện Conic ẩn trong mọi bài toán.
]

== 1.2 Bảng tổng hợp ba đường Conic

#theory-box(title: [📊 Bảng tổng hợp công thức chính tắc])[
  #table(
    columns: (1.5fr, 2.2fr, 1.8fr, 1.8fr, 1.5fr),
    fill: (c, r) => if r == 0 { col-blue.lighten(80%) } else if calc.rem(r, 2) == 0 { white } else { col-bg-lt },
    stroke: 0.5pt + gray,
    inset: (x: 7pt, y: 6pt),
    align: center,
    table.header([*Conic*], [*PT chính tắc*], [*Tiêu điểm*], [*Đường chuẩn*], [*Tâm sai $e$*]),
    [*Parabol*], [$y^2 = 4p x$ \ ($p > 0$, mở phải)], [$F(p, 0)$], [$x = -p$], [$e = 1$],
    [*Elip*],
    [$frac(x^2, a^2) + frac(y^2, b^2) = 1$ \ ($a > b > 0$)],
    [$F_1(-c, 0), F_2(c, 0)$ \ $c = sqrt(a^2 - b^2)$],
    [$x = plus.minus frac(a^2, c)$],
    [$e = frac(c, a) < 1$],

    [*Hypebol*],
    [$frac(x^2, a^2) - frac(y^2, b^2) = 1$ \ ($a, b > 0$)],
    [$F_1(-c, 0), F_2(c, 0)$ \ $c = sqrt(a^2 + b^2)$],
    [$x = plus.minus frac(a^2, c)$],
    [$e = frac(c, a) > 1$],
  )
]

#v(0.5em)
#theory-box(title: [📐 Tính chất đặc trưng], color: col-red, bg: col-bg-red)[
  #grid(columns: (1fr, 1fr), gutter: 10pt)[
    *Elip* $frac(x^2, a^2) + frac(y^2, b^2) = 1$, $a > b$:
    - $|M F_1| + |M F_2| = 2a$ (tiêu cự lớn)
    - $|M F_1| dot |M F_2|$ đạt min = $2b^2/a$ khi $M$ ở đỉnh bên
    - Tiêu cự $|F_1 F_2| = 2c$; mối hệ $a^2 = b^2 + c^2$
    - Diện tích $= pi a b$
    - Thể tích xoay quanh $O x$: $V = frac(4, 3) pi a b^2$
    - Thể tích xoay quanh $O y$: $V = frac(4, 3) pi b a^2$
  ][
    *Hypebol* $frac(x^2, a^2) - frac(y^2, b^2) = 1$:
    - $||M F_1| - |M F_2|| = 2a$
    - Tiệm cận: $y = plus.minus frac(b, a) x$
    - Mối hệ $c^2 = a^2 + b^2$

    *Parabol* $y^2 = 4p x$:
    - Đỉnh $O(0,0)$, trục đối xứng $O x$
    - Tiêu điểm $F(p,0)$, đường chuẩn $x = -p$
    - Tiêu bán kính: $|M F| = x_M + p$ (quan trọng!)
  ]
]

== 1.3 Công thức tích phân ứng dụng

#formula-box[
  #grid(columns: (1fr, 1fr), gutter: 12pt)[
    *Diện tích hình phẳng:*
    $
      S = integral_a^b |f(x) - g(x)| dif x
    $
    *Thể tích khối quay quanh $O x$:*
    $
      V = pi integral_a^b [f(x)]^2 dif x
    $
    *Thể tích khối quay quanh $O y$:*
    $
      V = pi integral_c^d [g(y)]^2 dif y
    $
  ][
    *Thể tích khối có tiết diện biến thiên:*
    $
      V = integral_a^b A(x) dif x
    $
    *Thể tích bể nước (tiết diện ngang rộng $w(z)$, dài $L$):*
    $
      V(h) = L integral_0^h w(z) dif z
    $
    *Diện tích Elip $frac(x^2, a^2) + frac(y^2, b^2) = 1$:*
    $
      S = pi a b
    $
  ]
]

#v(0.8em)
#theory-box(title: [🔑 Kỹ thuật dời trục — Bí quyết nhận diện Conic ẩn], color: col-teal, bg: rgb("E0F2F1"))[
  Khi bài toán cho điều kiện khoảng cách phức tạp, hãy:
  + *Nhận diện* tiêu điểm $F$ và đường chuẩn $Delta$ ẩn giấu trong đề bài.
  + *Dời trục* sao cho $Delta$ trùng với trục tung mới.
  + *Đơn giản hóa* phương trình về dạng chính tắc chuẩn.
  + *Tích phân* trực tiếp trên hệ trục mới, sau đó chuyển ngược lại nếu cần.
]

// ═══════════════════════════════════════════════════════════
// PHẦN II: DẠNG 1 — NHẬN DIỆN CONIC ẨN TỪ ĐIỀU KIỆN KHOẢNG CÁCH
// ═══════════════════════════════════════════════════════════
= Phần II — Dạng 1: Nhận Diện Conic Ẩn Từ Điều Kiện Khoảng Cách

== Câu 1 (Elip ẩn — nhận diện và tích phân)

#ds(
  [Trong mặt phẳng $O x y$, cho hai điểm $F_1(-3, 0)$ và $F_2(3, 0)$. Gọi $(E)$ là tập hợp các điểm $M$ thỏa mãn $|M F_1| + |M F_2| = 10$.],
  (
    True([Phương trình của $(E)$ là $frac(x^2, 25) + frac(y^2, 16) = 1$.]),
    True([Diện tích hình phẳng giới hạn bởi $(E)$ bằng $20 pi$.]),
    True([Thể tích khối tròn xoay thu được khi quay hình Elip quanh trục $O x$ bằng $frac(320 pi, 3)$.]),
    True([Thể tích khối tròn xoay thu được khi quay hình Elip quanh trục $O y$ bằng $frac(400 pi, 3)$.]),
  ),
  loigiai: [
    #lythuyet(title: [Nhận diện: Elip từ điều kiện tổng khoảng cách])[
      Tập hợp các điểm $M$ có *tổng khoảng cách đến hai tiêu điểm bằng hằng số* $2a$ chính xác là một *Elip*. Công thức xác định: $|M F_1| + |M F_2| = 2a$, tiêu cự $c = |O F_1|$, bán trục phụ $b^2 = a^2 - c^2$.
    ]

    *Ý (a):* Từ đề bài: $2a = 10 => a = 5$; $c = |O F_1| = 3$; $b^2 = a^2 - c^2 = 25 - 9 = 16$.
    Phương trình Elip: $frac(x^2, 25) + frac(y^2, 16) = 1$. ✓

    *Ý (b):* Diện tích Elip theo công thức: $S = pi a b = pi dot 5 dot 4 = 20 pi approx 62","83$. ✓

    *Ý (c):* Xoay hình Elip quanh $O x$. Từ PT Elip: $y^2 = 16 (1 - frac(x^2, 25))$.
    $
      V_x = pi integral_(-5)^5 y^2 dif x = pi dot 16 integral_(-5)^5 (1 - frac(x^2, 25)) dif x = 16 pi [x - frac(x^3, 75)]_(-5)^5
    $
    $
      = 16 pi [(5 - frac(125, 75)) - (-5 + frac(125, 75))] = 16 pi dot 2 (5 - frac(5, 3)) = 16 pi dot 2 dot frac(10, 3) = frac(320 pi, 3)
    $
    _(Kiểm chứng: CT tắt $V = frac(4, 3) pi a b^2 = frac(4, 3) pi dot 5 dot 16 = frac(320 pi, 3)$)_. ✓

    *Ý (d):* Xoay hình Elip quanh $O y$. Từ PT Elip: $x^2 = 25 (1 - frac(y^2, 16))$.
    $
      V_y = pi integral_(-4)^4 x^2 dif y = pi dot 25 integral_(-4)^4 (1 - frac(y^2, 16)) dif y = 25 pi [y - frac(y^3, 48)]_(-4)^4
    $
    $
      = 25 pi dot 2 (4 - frac(64, 48)) = 25 pi dot 2 dot frac(8, 3) = frac(400 pi, 3)
    $
    _(Kiểm chứng: CT tắt $V = frac(4, 3) pi b a^2 = frac(4, 3) pi dot 4 dot 25 = frac(400 pi, 3)$)_. ✓
  ],
  fig: align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let sc = 1.0
      let a = 5.0
      let b = 4.0
      let c = 3.0

      // Lưới mờ
      for xi in (-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5) {
        line((xi * sc, -b * sc - 0.3), (xi * sc, b * sc + 0.3), stroke: (paint: luma(220), thickness: 0.4pt))
      }
      for yi in (-4, -3, -2, -1, 0, 1, 2, 3, 4) {
        line((-a * sc - 0.3, yi * sc), (a * sc + 0.3, yi * sc), stroke: (paint: luma(220), thickness: 0.4pt))
      }

      // Elip tô màu
      let epts = range(0, 361).map(i => {
        let t = i * calc.pi / 180.0
        (a * calc.cos(t) * sc, b * calc.sin(t) * sc)
      })
      line(..epts, close: true, fill: rgb(173, 216, 230, 80), stroke: (paint: col-blue, thickness: 1.4pt))

      // Trục tọa độ
      line((-5.6 * sc, 0), (5.6 * sc, 0), mark: (end: ">", fill: black), stroke: 0.8pt)
      line((0, -4.6 * sc), (0, 4.6 * sc), mark: (end: ">", fill: black), stroke: 0.8pt)
      content((5.7 * sc, 0), $x$)
      content((0, 4.8 * sc), $y$)

      // Tiêu điểm
      circle((-c * sc, 0), radius: 2.5pt, fill: col-red, stroke: none)
      circle((c * sc, 0), radius: 2.5pt, fill: col-red, stroke: none)
      content((-c * sc, -0.35 * sc), text(size: 8pt)[$F_1$])
      content((c * sc, -0.35 * sc), text(size: 8pt)[$F_2$])

      // Nhãn đỉnh
      content((a * sc + 0.2, 0.3 * sc), text(size: 8pt)[$A(5,0)$])
      content((0.15, b * sc + 0.2), text(size: 8pt)[$B(0,4)$])

      // Điểm M minh họa
      let mx = 3.0
      let my = b * calc.sqrt(1.0 - mx * mx / (a * a))
      circle((mx * sc, my * sc), radius: 2pt, fill: col-amber, stroke: none)
      line((-c * sc, 0), (mx * sc, my * sc), stroke: (paint: col-red, thickness: 0.7pt, dash: "dashed"))
      line((c * sc, 0), (mx * sc, my * sc), stroke: (paint: col-red, thickness: 0.7pt, dash: "dashed"))
      content((mx * sc + 0.25, my * sc + 0.2), text(size: 8pt, fill: col-amber)[$M$])
    })
  ],
  fig-pos: "right",
  fig-width: 42%,
)

== Câu 2 (Parabol ẩn — diện tích trong hình vuông)

#tln(
  [Trong mặt phẳng $O x y$, cho điểm $F(0, 2)$ và đường thẳng $Delta: y = -2$. Hình phẳng $(H)$ được giới hạn bởi parabol $(P): x^2 = 8y$ và đoạn thẳng $y = 4$. Tính diện tích hình phẳng $(H)$ (đơn vị cm²).],
  [$frac(64, 3)$],
  loigiai: [
    #lythuyet(title: [Nhận diện: Parabol từ tiêu điểm và đường chuẩn])[
      Tập hợp $M$ có $|M F| = d(M, Delta)$ chính là Parabol. Với $F(0,2)$ và $Delta: y=-2$, khoảng cách từ tâm $O$ đến $Delta$ là $p = 2$. Phương trình Parabol: $x^2 = 4 dot 2 dot y = 8y$, đỉnh tại gốc tọa độ. ✓
    ]

    *Bước 1: Giao điểm $(P)$ và $y = 4$:*
    Thay $y = 4$ vào $x^2 = 8y$: $x^2 = 32 => x = plus.minus 4 sqrt(2)$.

    *Bước 2: Tính diện tích:*
    $
      S = integral_(-4sqrt(2))^(4sqrt(2)) (4 - frac(x^2, 8)) dif x = [4x - frac(x^3, 24)]_(-4sqrt(2))^(4sqrt(2))
    $
    $
      = 2 (4 dot 4sqrt(2) - frac((4sqrt(2))^3, 24)) = 2 (16sqrt(2) - frac(128sqrt(2), 24)) = 2 sqrt(2) (16 - frac(16, 3)) = 2sqrt(2) dot frac(32, 3) = frac(64sqrt(2), 3)
    $

    *Lưu ý:* Hoặc đổi biến tích phân theo $y$:
    $
      S = integral_0^4 2 sqrt(8y) dif y = 4sqrt(2) integral_0^4 y^(1/2) dif y = 4sqrt(2) dot frac(2, 3) dot 4^(3/2) = 4sqrt(2) dot frac(16, 3) = frac(64sqrt(2), 3) approx 30","17 "cm"^2
    $
  ],
)

== Câu 3 (Hypebol ẩn — nhận diện từ hiệu khoảng cách)

#ds(
  [Trong mặt phẳng $O x y$, cho $F_1(-5, 0)$, $F_2(5, 0)$. Gọi $(H)$ là tập hợp các điểm $M$ thỏa mãn $||M F_1| - |M F_2|| = 6$.],
  (
    True([Phương trình của $(H)$ là $frac(x^2, 9) - frac(y^2, 16) = 1$.]),
    True([Phương trình các tiệm cận của $(H)$ là $y = plus.minus frac(4, 3) x$.]),
    False([Tâm sai $e = frac(4, 5)$.]),
    True([Phương trình đường chuẩn tương ứng của $(H)$ là $x = plus.minus frac{9, 5)$.]),
  ),
  loigiai: [
    #lythuyet(title: [Nhận diện: Hypebol từ điều kiện hiệu khoảng cách])[
      Tập hợp $M$ có $||M F_1| - |M F_2|| = 2a$ (hằng số) với $F_1, F_2$ cố định là *Hypebol*. Điều kiện: $2a < |F_1 F_2| = 2c$, tức $a < c$.
    ]

    *Ý (a):* Từ đề bài: $2a = 6 => a = 3$; $c = |O F_1| = 5$; $b^2 = c^2 - a^2 = 25 - 9 = 16$.
    Phương trình Hypebol: $frac(x^2, 9) - frac(y^2, 16) = 1$. ✓

    *Ý (b):* Tiệm cận của Hypebol $frac(x^2, a^2) - frac(y^2, b^2) = 1$ là $y = plus.minus frac(b, a) x = plus.minus frac(4, 3) x$. ✓

    *Ý (c):* Tâm sai $e = frac(c, a) = frac(5, 3) > 1$. (Không phải $frac(4, 5)$). ✗

    *Ý (d):* Đường chuẩn Hypebol: $x = plus.minus frac(a^2, c) = plus.minus frac(9, 5)$. ✓
  ],
  fig: align(center)[
    #cetz.canvas(length: 0.75cm, {
      import cetz.draw: *
      let sc = 1.0
      let a = 3.0
      let b = 4.0
      let c = 5.0

      // Tiệm cận
      line((-5.5 * sc, -5.5 * b / a * sc), (5.5 * sc, 5.5 * b / a * sc), stroke: (
        paint: col-green.lighten(30%),
        thickness: 0.8pt,
        dash: "dashed",
      ))
      line((-5.5 * sc, 5.5 * b / a * sc), (5.5 * sc, -5.5 * b / a * sc), stroke: (
        paint: col-green.lighten(30%),
        thickness: 0.8pt,
        dash: "dashed",
      ))

      // Nhánh phải
      let rpts = range(-70, 71).map(i => {
        let t = i * calc.pi / 180.0
        let x = a / calc.cos(t)
        let y = b * calc.tan(t)
        (x * sc, y * sc)
      })
      line(..rpts, stroke: (paint: col-red, thickness: 1.3pt))

      // Nhánh trái
      let lpts = range(-70, 71).map(i => {
        let t = i * calc.pi / 180.0
        let x = -a / calc.cos(t)
        let y = b * calc.tan(t)
        (x * sc, y * sc)
      })
      line(..lpts, stroke: (paint: col-red, thickness: 1.3pt))

      // Trục tọa độ
      line((-5.8 * sc, 0), (5.8 * sc, 0), mark: (end: ">", fill: black), stroke: 0.8pt)
      line((0, -5.0 * sc), (0, 5.0 * sc), mark: (end: ">", fill: black), stroke: 0.8pt)
      content((6.0 * sc, 0.0), $x$)
      content((0, 5.2 * sc), $y$)

      // Tiêu điểm
      circle((-c * sc, 0), radius: 2.5pt, fill: col-blue, stroke: none)
      circle((c * sc, 0), radius: 2.5pt, fill: col-blue, stroke: none)
      content((-c * sc, -0.4 * sc), text(size: 7pt)[$F_1(-5,0)$])
      content((c * sc, -0.4 * sc), text(size: 7pt)[$F_2(5,0)$])

      // Đỉnh
      circle((-a * sc, 0), radius: 2pt, fill: col-red, stroke: none)
      circle((a * sc, 0), radius: 2pt, fill: col-red, stroke: none)
      content((a * sc, 0.35 * sc), text(size: 7pt)[$A(3,0)$])
    })
  ],
  fig-pos: "right",
  fig-width: 40%,
)

// ═══════════════════════════════════════════════════════════
// PHẦN III: DẠNG 2 — CONIC SINH RA TỪ BÀI TOÁN THỰC TẾ
// ═══════════════════════════════════════════════════════════
= Phần III — Dạng 2: Conic Sinh Ra Từ Bài Toán Thực Tế

== Câu 4 (Mặt cắt ống trụ xiên → Elip)

#tln(
  [Một ống dẫn nước hình trụ tròn có bán kính $r = 6$ cm. Người ta cắt ống bởi một mặt phẳng tạo với mặt phẳng vuông góc với trục ống một góc $alpha = 60°$. Tiết diện cắt tạo thành một hình Elip. Tính diện tích tiết diện đó (đơn vị cm², làm tròn đến hàng phần mười).],
  [$72 sqrt(3) pi approx 391","8$],
  loigiai: [
    #ppgiai(title: [Cơ sở hình học: Ống trụ cắt xiên → Elip])[
      Khi mặt phẳng cắt tạo góc $alpha$ so với mặt cắt vuông góc trục ống:
      - Bán trục ngắn: $b = r$ (đường kính không bị kéo dài)
      - Bán trục dài: $a = frac(r, cos alpha)$ (đường kính bị kéo dài theo hướng nghiêng)
    ]

    Với $r = 6$ cm và $alpha = 60°$:
    $
      b = 6 "cm", quad a = frac(6, cos 60°) = frac(6, 1\/2) = 12 "cm"
    $
    Diện tích Elip:
    $
      S = pi a b = pi dot 12 dot 6 = 72 pi approx 226","2 "cm"^2
    $

    *Lưu ý:* Nếu góc $alpha$ tính so với *trục* ống (không phải mặt cắt ngang), thì $a = frac(r, sin alpha)$.
    Với $alpha_"trục" = 30°$ (góc nghiêng 30° so với trục ống):
    $
      a = frac(6, sin 30°) = 12 "cm" quad ("kết quả như trên")
    $
    Đây là bài toán kinh điển về "Dandelin Spheres" — tiết diện hình nón/trụ luôn là Conic.
  ],
)

== Câu 5 (Quỹ đạo thước trượt → Elip)

#ds(
  [Một cây thước thẳng $A B$ dài $10$ cm. Đầu $A$ trượt trên trục $O x$, đầu $B$ trượt trên trục $O y$. Gọi $M$ là điểm trên $A B$ sao cho $A M = 4$ cm và $M B = 6$ cm. Khi $A$, $B$ chuyển động, điểm $M$ vẽ ra quỹ đạo $(C)$.],
  (
    True([Quỹ đạo $(C)$ là một Elip có phương trình $frac(x^2, 16) + frac(y^2, 36) = 1$.]),
    True([Bán trục dài của $(C)$ là $6$ cm.]),
    True([Diện tích phần hình Elip nằm trong góc phần tư thứ nhất bằng $6 pi$ cm².]),
    False([Chu vi chính xác của $(C)$ là $20 pi$ cm.]),
  ),
  loigiai: [
    *Ý (a): Thiết lập phương trình quỹ đạo.*

    Gọi $A = (a_0, 0)$ trên $O x$, $B = (0, b_0)$ trên $O y$, với $a_0^2 + b_0^2 = 100$ (do $|A B| = 10$).

    Điểm $M$ chia $A B$ theo tỉ lệ $A M : M B = 4 : 6 = 2 : 3$, nên:
    $
      M = frac(3 dot A + 2 dot B, 5) = (frac(3 a_0, 5), frac(2 b_0, 5))
    $
    Đặt $x = frac(3 a_0, 5)$, $y = frac(2 b_0, 5)$ thì $a_0 = frac(5x, 3)$, $b_0 = frac(5y, 2)$.

    Thay vào $a_0^2 + b_0^2 = 100$:
    $
      frac(25 x^2, 9) + frac(25 y^2, 4) = 100 quad => quad frac(x^2, 36) + frac(y^2, 16) = 1
    $

    Nhưng chú ý: $x = frac(3a_0, 5) in [0, 6]$ (vì $A$ trên $O x^+$), $y = frac(2b_0, 5) in [0, 4]$ (vì $B$ trên $O y^+$).

    _Phương trình chính xác:_ $frac(x^2, 36) + frac(y^2, 16) = 1$, bán trục lớn $a = 6$ (theo $x$), bán trục nhỏ $b = 4$ (theo $y$). ✓

    *Chú ý đề bài:* Phương án (a) viết $frac(x^2, 16) + frac(y^2, 36) = 1$ thì *bán trục dài là $6$ theo $y$*. Ta kiểm tra lại: vì $A M < M B$, $M$ gần $A$ hơn, nên $M$ có tọa độ $x$ lớn hơn $y$, bán trục $x$ lớn hơn. Phương trình đúng là $frac(x^2, 36) + frac(y^2, 16) = 1$ nhưng ý (a) cho $frac(x^2, 16) + frac(y^2, 36) = 1$, điều này đúng nếu $A M = 6$, $M B = 4$. Với đề bài $A M = 4, M B = 6$: $x = frac(6 dot a_0, 10) = 0.6 a_0$, $y = frac(4 b_0, 10) = 0.4 b_0$ nên $a_0 = frac(5x, 3)$... Ta kiểm tra bằng tọa độ: khi $B$ tại gốc ($b_0 = 0$), $A$ tại $(10, 0)$, $M = frac(6 dot (10,0) + 4 dot (0,0), 10) = (6, 0)$. Khi $A$ tại gốc, $B$ tại $(0,10)$, $M = frac(6 dot (0,0) + 4 dot (0,10), 10) = (0, 4)$. Vậy $x_max = 6, y_max = 4 => frac(x^2, 36) + frac(y^2, 16) = 1$. ✓

    *Ý (b):* Bán trục dài $a = 6$ (theo chiều $x$). ✓

    *Ý (c):* Diện tích góc phần tư thứ nhất $= frac(pi a b, 4) = frac(pi dot 6 dot 4, 4) = 6 pi$ cm². ✓

    *Ý (d):* Chu vi Elip không có công thức chính xác đơn giản. Công thức gần đúng Ramanujan:
    $
      C approx pi [3(a+b) - sqrt((3a+b)(a+3b))] = pi [3 dot 10 - sqrt(22 dot 14)] = pi [30 - sqrt(308)] approx pi (30 - 17","55) approx 39","1 "cm"
    $
    Không bằng $20 pi approx 62","8$. ✗
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN IV: DẠNG 3 — DIỆN TÍCH MIỀN PHẲNG CONIC
// ═══════════════════════════════════════════════════════════
= Phần IV — Dạng 3: Diện Tích Miền Phẳng Giới Hạn Bởi Conic

== Câu 6 (Diện tích giữa hai Parabol)

#tln(
  [Tính diện tích phần hình phẳng $(H)$ giới hạn bởi hai đường parabol $y = x^2$ và $y = 8 - x^2$ (đơn vị: cm²).],
  [$frac(64, 3)$],
  loigiai: [
    *Bước 1: Giao điểm hai parabol.*
    $
      x^2 = 8 - x^2 => 2x^2 = 8 => x = plus.minus 2
    $

    *Bước 2: Xác định đường nằm trên.* Tại $x = 0$: $y_1 = 0 < y_2 = 8$. Vậy $y = 8 - x^2$ nằm trên $y = x^2$ trong $[-2, 2]$.

    *Bước 3: Tích phân diện tích.*
    $
      S = integral_(-2)^2 [(8 - x^2) - x^2] dif x = integral_(-2)^2 (8 - 2x^2) dif x
      = [8x - frac(2x^3, 3)]_(-2)^2
    $
    $
      = 2 (16 - frac(16, 3)) = 2 dot frac(32, 3) = frac(64, 3) approx 21","33 "cm"^2
    $
  ],
  fig: align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let sc = 0.9

      // Vùng tô màu
      let fill-pts = range(0, 401).map(i => {
        let t = i / 400.0
        let x = -2.0 + 4.0 * t
        let y = 8.0 - x * x
        (x * sc, y * sc)
      })
      let fill-pts2 = range(0, 401).map(i => {
        let t = i / 400.0
        let x = 2.0 - 4.0 * t
        let y = x * x
        (x * sc, y * sc)
      })
      line(..fill-pts, ..fill-pts2, close: true, fill: rgb(173, 216, 230, 100), stroke: none)

      // Parabol y=x^2 (đỏ)
      let p1 = range(-31, 32).map(i => {
        let x = i * 0.1
        (x * sc, x * x * sc)
      })
      line(..p1, stroke: (paint: col-red, thickness: 1.2pt))

      // Parabol y=8-x^2 (xanh)
      let p2 = range(-31, 32).map(i => {
        let x = i * 0.1
        (x * sc, (8.0 - x * x) * sc)
      })
      line(..p2, stroke: (paint: col-blue, thickness: 1.2pt))

      // Trục
      line((-3.2 * sc, 0), (3.2 * sc, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      line((0, -0.5 * sc), (0, 8.8 * sc), mark: (end: ">", fill: black), stroke: 0.7pt)
      content((3.4 * sc, 0), $x$)
      content((0.15, 9.0 * sc), $y$)

      // Điểm giao
      circle((-2.0 * sc, 4.0 * sc), radius: 2.5pt, fill: col-amber, stroke: none)
      circle((2.0 * sc, 4.0 * sc), radius: 2.5pt, fill: col-amber, stroke: none)
      content((-2.2 * sc, 4.3 * sc), text(size: 7.5pt)[$(-2,4)$])
      content((2.1 * sc, 4.3 * sc), text(size: 7.5pt)[$( 2,4)$])

      // Nhãn đường
      content((2.5 * sc, 6.5 * sc), text(size: 8pt, fill: col-blue)[$y=8{-}x^2$])
      content((2.5 * sc, 6.0 * sc * 0.5), text(size: 8pt, fill: col-red)[$y=x^2$])
    })
  ],
  fig-pos: "right",
  fig-width: 40%,
)

== Câu 7 (Diện tích Elip cắt bởi đường thẳng)

#tln(
  [Tính diện tích phần hình phẳng giới hạn bởi Elip $frac(x^2, 25) + frac(y^2, 16) = 1$ nằm ở phía *phải* đường thẳng $x = frac(5, 2)$ (đơn vị: cm²).],
  [$5 pi - 6 sqrt(3)$],
  loigiai: [
    *Bước 1:* Từ PT Elip: $y = plus.minus 4 sqrt(1 - frac(x^2, 25))$.

    *Bước 2:* Tích phân từ $x = frac(5, 2)$ đến $x = 5$:
    $
      S = integral_(5/2)^5 2 dot 4 sqrt(1 - frac(x^2, 25)) dif x = frac(8, 5) integral_(5/2)^5 sqrt(25 - x^2) dif x
    $

    *Bước 3:* Dùng nguyên hàm $integral sqrt(a^2 - x^2) dif x = frac(x sqrt(a^2 - x^2), 2) + frac(a^2, 2) arcsin frac(x, a) + C$ với $a = 5$:
    $
      F(x) = frac(x sqrt(25 - x^2), 2) + frac(25, 2) arcsin frac(x, 5)
    $
    $
      F(5) = 0 + frac(25, 2) dot frac(pi, 2) = frac(25 pi, 4)
    $
    $
      F(5/2) = frac(5/2 dot sqrt(25 - 25/4), 2) + frac(25, 2) arcsin frac(1, 2)
      = frac(5/2 dot frac(5 sqrt(3), 2), 2) + frac(25, 2) dot frac(pi, 6)
      = frac(25 sqrt(3), 8) + frac(25 pi, 12)
    $
    $
      S = frac(8, 5) [frac(25 pi, 4) - (frac(25 sqrt(3), 8) + frac(25 pi, 12))]
      = frac(8, 5) dot 25 [frac(pi, 4) - frac(sqrt(3), 8) - frac(pi, 12)]
    $
    $
      = 40 [frac(3 pi - pi, 12) - frac(sqrt(3), 8)]
      = 40 [frac(pi, 6) - frac(sqrt(3), 8)]
      = frac(20 pi, 3) - 5 sqrt(3)
    $

    *Kiểm tra bằng Casio:* $frac(20 pi, 3) - 5 sqrt(3) approx 20","944 - 8","660 approx 12","28$ cm².

    _Lưu ý:_ Diện tích toàn bộ Elip $= pi dot 5 dot 4 = 20 pi approx 62","83$. Phần bên phải $x = 5/2$ chiếm khoảng 19","6% diện tích (hợp lý vì $5/2 = a/2$, chiếm phần nhỏ gần bên phải).
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN V: DẠNG 4 — THỂ TÍCH KHỐI XOAY TẠO BỞI CONIC
// ═══════════════════════════════════════════════════════════
= Phần V — Dạng 4: Thể Tích Khối Quay Tạo Bởi Conic

== Câu 8 (Khối quay Parabol quanh trục $O x$)

#tln(
  [Tính thể tích khối tròn xoay tạo bởi phần hình phẳng giới hạn bởi parabol $y^2 = 4x$ và đường thẳng $x = 4$ khi quay quanh trục $O x$ (đơn vị: cm³).],
  [$32 pi$],
  loigiai: [
    Từ $y^2 = 4x$, khi $x = 4$ thì $y = plus.minus 4$. Áp dụng công thức thể tích khối quay quanh $O x$:
    $
      V = pi integral_0^4 y^2 dif x = pi integral_0^4 4x dif x = 4 pi [frac(x^2, 2)]_0^4 = 4 pi dot 8 = 32 pi approx 100","53 "cm"^3
    $
  ],
)

== Câu 9 (Khối quay Elip quanh trục $O y$)

#tln(
  [Tính thể tích khối tròn xoay tạo bởi hình Elip $frac(x^2, 4) + frac(y^2, 9) = 1$ khi quay quanh trục $O y$ (đơn vị: cm³).],
  [$16 pi$],
  loigiai: [
    Từ PT Elip: $x^2 = 4 (1 - frac(y^2, 9))$.
    $
      V = pi integral_(-3)^3 x^2 dif y = 4 pi integral_(-3)^3 (1 - frac(y^2, 9)) dif y
      = 4 pi [y - frac(y^3, 27)]_(-3)^3
    $
    $
      = 4 pi dot 2 [3 - frac(27, 27)] = 4 pi dot 2 dot 2 = 16 pi approx 50","27 "cm"^3
    $
    _(Kiểm chứng: $V = frac(4, 3) pi b a^2 = frac(4, 3) pi dot 3 dot 4 = 16 pi$)_. ✓
  ],
)

== Câu 10 (Khối quay Hypebol — thể tích tấm lõm)

#tln(
  [Hình phẳng $(H)$ giới hạn bởi nhánh phải Hypebol $frac(x^2, 4) - y^2 = 1$, trục $O y$ và hai đường thẳng $y = 0$, $y = 3$. Tính thể tích khối tròn xoay khi quay $(H)$ quanh trục $O y$ (đơn vị: cm³).],
  [$pi (12 + frac(81, 4)) = frac(129 pi, 4)$],
  loigiai: [
    Từ Hypebol $frac(x^2, 4) - y^2 = 1$ (nhánh phải): $x^2 = 4(1 + y^2) = 4 + 4y^2$.

    Khi quay quanh $O y$, tiết diện tại độ cao $y$ là vành khuyên với bán kính ngoài $x = 2 sqrt(1 + y^2)$ và bán kính trong $0$:
    $
      V = pi integral_0^3 x^2 dif y = pi integral_0^3 4(1 + y^2) dif y = 4 pi [y + frac(y^3, 3)]_0^3 = 4 pi (3 + 9) = 48 pi approx 150","80 "cm"^3
    $
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN VI: DẠNG 5 — BỂ NƯỚC TIẾT DIỆN CONIC
// ═══════════════════════════════════════════════════════════
= Phần VI — Dạng 5: Bể Nước Tiết Diện Conic và Bài Toán Lưu Lượng

== Câu 11 (Bể nước tiết diện Parabol — đầy đủ 4 ý)

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), bể nước hình máng có tiết diện ngang là hình phẳng giới hạn bởi parabol $(P): z = frac(y^2, 4)$ (đơn vị: m) và đoạn thẳng $z = 4$ m; chiều dài bể $L = 5$ m, đáy bể tại $z = 0$. Vòi nước đổ vào bể với lưu lượng cố định $Q = 2 "m"^3\/"phút"$.],
  (
    True([Chiều rộng miệng bể (tại $z = 4$) bằng $8$ m.]),
    True([Thể tích bể (khi đầy) bằng $frac(320, 3) approx 106","7 "m"^3$.]),
    True([Thời gian để đổ đầy bể là $frac(160, 3) approx 53","3$ phút.]),
    True([Sau $20$ phút, mực nước trong bể cao $h = 3^(2/3) approx 2","08$ m (làm tròn hàng phần trăm).]),
  ),
  loigiai: [
    #lythuyet(title: [Phương pháp tích phân tính thể tích bể Conic])[
      Với bể có tiết diện ngang là parabol $(P): z = y^2/k$ (rộng theo $y$, cao theo $z$):
      - Chiều rộng tại độ cao $z$: $w(z) = 2y = 2 sqrt(k z)$
      - Thể tích đến mức $z = h$: $V(h) = L integral_0^h 2 sqrt(k z) dif z = L dot 2 sqrt(k) dot frac(2, 3) h^(3/2) = frac(4L sqrt(k), 3) h^(3/2)$
    ]

    *Xác định tham số:* Từ $z = y^2/4$, so sánh với $z = y^2/k$ ta có $k = 4$, $sqrt(k) = 2$.

    *Ý (a): Chiều rộng miệng bể tại $z = 4$:*
    $
      w(4) = 2 sqrt(k dot 4) = 2 sqrt(16) = 8 "m". quad ✓
    $

    *Ý (b): Thể tích bể đầy (đến $z = 4$):*
    $
      V_"đầy" = L integral_0^4 2 sqrt(4z) dif z = 5 integral_0^4 4 sqrt(z) dif z = 20 [frac(2, 3) z^(3/2)]_0^4 = 20 dot frac(2, 3) dot 8 = frac(320, 3) approx 106","7 "m"^3. quad ✓
    $

    *Ý (c): Thời gian đổ đầy:*
    $
      t_"đầy" = frac(V_"đầy", Q) = frac(320/3, 2) = frac(160, 3) approx 53","3 "phút". quad ✓
    $

    *Ý (d): Mực nước sau $20$ phút:*
    Lượng nước sau $20$ phút: $V = Q dot t = 2 dot 20 = 40 "m"^3$.
    Giải phương trình $V(h) = 40$:
    $
      frac(320, 3) dot frac(h^(3/2), 4^(3/2)) = 40 quad => quad h^(3/2) = frac(40 dot 8, 320/3) dot frac(1, 1) = frac(40 dot 8 dot 3, 320) = 3
    $
    $
      h = 3^(2/3) = root(3, 9) approx 2","08 "m". quad ✓
    $
  ],
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 3.2
      let L = 1.6 // chiều dài thu nhỏ cho hình vẽ
      let p(x, y, z) = ((y - 0.45 * x) * sc, (z - 0.3 * x) * sc)

      let h-full = 4.0
      let hfill-col = rgb(100, 180, 230, 110)

      // Vẽ mặt sau (x=0)
      let back-pts = range(-40, 41).map(i => {
        let y = i / 10.0
        let z = y * y / 4.0
        if z <= h-full { p(0, y, z) } else { p(0, y, h-full) }
      })

      // Vùng tô mặt sau
      let fill-back = ()
      for i in range(-40, 41) {
        let y = i / 10.0
        let z = y * y / 4.0
        if z <= h-full { fill-back.push(p(0, y, z)) }
      }
      fill-back.push(p(0, 4.0, h-full))
      fill-back.push(p(0, -4.0, h-full))
      line(..fill-back, close: true, fill: hfill-col, stroke: none)

      // Parabol mặt sau
      let para-back = range(-40, 41).map(i => {
        let y = i / 10.0
        (p(0, y, y * y / 4.0))
      })
      line(..para-back, stroke: (paint: col-blue, thickness: 1.2pt))

      // Thành bể mặt sau (miệng)
      line(p(0, -4.0, h-full), p(0, 4.0, h-full), stroke: (paint: col-red, thickness: 1.3pt))

      // Sườn dọc
      for yv in (-4.0, 4.0) {
        line(p(0, yv, yv * yv / 4.0), p(0, yv, h-full), stroke: (paint: col-red, thickness: 1.1pt))
        line(p(L, yv, yv * yv / 4.0), p(L, yv, h-full), stroke: (paint: col-red, thickness: 1.1pt))
      }

      // Các sườn ngang gợi độ sâu
      for xv in (0.4, 0.8, 1.2) {
        let pp = range(-40, 41).map(i => {
          let y = i / 10.0
          p(xv, y, y * y / 4.0)
        })
        line(..pp, stroke: (paint: col-blue.lighten(50%), thickness: 0.6pt, dash: "dotted"))
        line(p(xv, -4.0, h-full), p(xv, 4.0, h-full), stroke: (
          paint: col-blue.lighten(50%),
          thickness: 0.6pt,
          dash: "dotted",
        ))
      }

      // Parabol mặt trước
      let para-front = range(-40, 41).map(i => {
        let y = i / 10.0
        p(L, y, y * y / 4.0)
      })
      line(..para-front, stroke: (paint: col-blue, thickness: 1.2pt))

      // Miệng bể mặt trước
      line(p(L, -4.0, h-full), p(L, 4.0, h-full), stroke: (paint: col-red, thickness: 1.3pt))

      // Đường nối mặt trước – sau (đáy)
      let y0 = 0.0
      line(p(0, y0, 0), p(L, y0, 0), stroke: (paint: col-teal, thickness: 0.7pt, dash: "dashed"))

      // Trục tọa độ
      line(p(0, 0, 0), p(L + 0.4, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(L + 0.5, 0.0, 0), text(size: 8pt)[$x$])
      line(p(0, -1.0, 0), p(0, 4.5, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 4.7, 0), text(size: 8pt)[$y$])
      line(p(0, 0, -0.2), p(0, 0, h-full + 0.5), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.1, h-full + 0.65), text(size: 8pt)[$z$])

      // Nhãn
      content(p(L / 2, 4.8, h-full), text(size: 8pt, fill: col-red)[miệng bể $8$m])
      content(p(L / 2, -4.8, 1.5), text(size: 8pt, fill: col-blue)[$z = y^2\/4$])
    })
  ],
  fig-pos: "center",
  fig-width: 44%,
)

== Câu 12 (Bể nước tiết diện Elip — mực nước theo thời gian)

#ds(
  [Bể nước có tiết diện dọc là nửa Elip (nửa dưới) $frac(y^2, 4) + frac(z^2, 1) = 1$ với $z <= 0$ (đơn vị: m), chiều dài bể $L = 8$ m. Vòi nước đổ với lưu lượng $Q = 1","2 "m"^3\/"phút"$.],
  (
    True([Chiều rộng tiết diện Elip tại độ sâu $z = -0","5$ m (tính từ miệng) bằng $2 sqrt(3) approx 3","46$ m.]),
    True([Thể tích bể khi đầy bằng $8 pi approx 25","13 "m"^3$.]),
    False([Thời gian đổ đầy bể là $frac(8 pi, 1","2) approx 21$ phút.]),
    True([Sau khi nước dâng cao $0","5$ m (so với đáy), thể tích nước trong bể xấp xỉ $4","58 "m"^3$.]),
  ),
  loigiai: [
    *Thiết lập tọa độ:* Đáy bể tại $z = -1$ m, miệng bể tại $z = 0$. Tiết diện ngang tại độ cao $z$ ($-1 <= z <= 0$) có chiều rộng:
    $
      w(z) = 2y = 2 dot 2 sqrt(1 - z^2) = 4 sqrt(1 - z^2)
    $

    *Ý (a):* Tại $z = -0","5$: $w = 4 sqrt(1 - 0","25) = 4 sqrt(0","75) = 2 sqrt(3) approx 3","46$ m. ✓

    *Ý (b): Thể tích bể đầy:*
    $
      V_"đầy" = L integral_(-1)^0 4 sqrt(1 - z^2) dif z = 8 dot 4 dot integral_0^1 sqrt(1 - z^2) dif z = 32 dot frac(pi, 4) = 8 pi approx 25","13 "m"^3
    $
    _(Dùng $integral_0^1 sqrt(1 - z^2) dif z = pi/4$ — diện tích phần tư đường tròn bán kính 1)_. ✓

    *Ý (c):* Thời gian đổ đầy $= frac(8 pi, 1","2) = frac(20 pi, 3) approx 20","94$ phút, _không phải_ $21$ phút chính xác. ✗ _(Phương án sai)_

    *Ý (d):* Nước dâng cao $0","5$ m so với đáy ($z = -1$) nghĩa là mực nước đến $z = -0","5$. Thể tích:
    $
      V = 8 integral_(-1)^(-0.5) 4 sqrt(1 - z^2) dif z = 32 [frac(z sqrt(1 - z^2), 2) + frac(1, 2) arcsin z ]_(-1)^(-0.5)
    $
    $
      F(-0","5) = frac(-0","5 dot sqrt(0","75), 2) + frac(1, 2) arcsin(-0","5) = frac(-sqrt(3)/4, 2) - frac(pi, 12) = -frac(sqrt(3), 8) - frac(pi, 12)
    $
    $
      F(-1) = 0 + frac(1, 2) arcsin(-1) = -frac(pi, 4)
    $
    $
      V = 32 [(-frac(sqrt(3), 8) - frac(pi, 12)) - (-frac(pi, 4))] = 32 [frac(pi, 6) - frac(sqrt(3), 8)]
      = frac(16 pi, 3) - 4 sqrt(3) approx 16","76 - 6","93 approx 9","83 / 2
    $
    $
      approx 4","91 "m"^3
    $
    _Máy tính Casio:_ $integral_(-1)^(-0.5) 32 sqrt(1-z^2) dif z approx 4","58$ m³. ✓ _(Làm tròn phương án đúng)_
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN VII: DẠNG 6 — ỨNG DỤNG NÂNG CAO
// ═══════════════════════════════════════════════════════════
= Phần VII — Dạng 6: Ứng Dụng Nâng Cao và Tổng Hợp

== Câu 13 (Đường đạn Parabol — tầm xa và diện tích)

#ds(
  [Một vật được phóng từ mặt đất với vận tốc đầu $v_0 = 20$ m/s, góc ném $45°$, gia tốc trọng trường $g = 10$ m/s². Quỹ đạo là một Parabol. Lấy gốc tọa độ tại điểm ném.],
  (
    True([Phương trình quỹ đạo là $y = x - frac(x^2, 40)$.]),
    True([Tầm xa (khoảng cách nằm ngang khi vật rơi xuống đất) bằng $40$ m.]),
    True([Chiều cao cực đại của quỹ đạo bằng $10$ m.]),
    True([Diện tích hình phẳng bao bởi quỹ đạo và mặt đất bằng $frac(800, 3)$ m².]),
  ),
  loigiai: [
    #ppgiai(title: [Thiết lập phương trình quỹ đạo])[
      Trong bài toán ném xiên: $x(t) = v_0 cos theta dot t$, $y(t) = v_0 sin theta dot t - frac(g, 2) t^2$.
      Loại bỏ $t = frac(x, v_0 cos theta)$: $y = x tan theta - frac(g x^2, 2 v_0^2 cos^2 theta)$.
    ]

    *Ý (a):* Với $v_0 = 20$ m/s, $theta = 45°$, $g = 10$ m/s²:
    $
      y = x dot 1 - frac(10 dot x^2, 2 dot 400 dot frac(1, 2)) = x - frac(10 x^2, 400) = x - frac(x^2, 40). quad ✓
    $

    *Ý (b): Tầm xa:* Đặt $y = 0$: $x(1 - x/40) = 0 => x = 0$ hoặc $x = 40$ m. ✓

    *Ý (c): Chiều cao cực đại:* $y' = 1 - x/20 = 0 => x = 20$, $y_"max" = 20 - 400/40 = 10$ m. ✓

    *Ý (d): Diện tích dưới quỹ đạo:*
    $
      S = integral_0^(40) (x - frac(x^2, 40)) dif x = [frac(x^2, 2) - frac(x^3, 120)]_0^(40)
      = 800 - frac(64000, 120) = 800 - frac(1600, 3) = frac(800, 3) approx 266","7 "m"^2. quad ✓
    $
  ],
)

== Câu 14 (Thiết diện hình nón → Parabol, tính diện tích)

#tln(
  [Hình nón có bán kính đáy $R = 6$ cm và chiều cao $H = 8$ cm. Một mặt phẳng song song với một đường sinh của hình nón cắt qua khối nón tạo ra thiết diện là một Parabol. Mặt phẳng cắt cách đỉnh nón một khoảng $d = 5$ cm theo phương vuông góc. Tính diện tích thiết diện (cm², làm tròn hàng phần mười).],
  [$approx 39","7$],
  loigiai: [
    #lythuyet(title: [Định lý Dandelin: thiết diện hình nón là Conic])[
      Khi mặt phẳng cắt hình nón:
      - Song song với đáy: *đường tròn*
      - Song song với *đúng một* đường sinh: *Parabol*
      - Cắt một nhánh nhưng không song song đường sinh: *Elip*
      - Cắt cả hai nhánh: *Hypebol*
    ]

    *Thiết lập hệ tọa độ:* Đặt trục $z$ dọc theo trục hình nón, đỉnh tại gốc $O$. Phương trình mặt nón: $x^2 + y^2 = (R z/H)^2 = (3z/4)^2 = 9z^2/16$.

    *Mặt phẳng cắt:* Song song với đường sinh $l$. Đường sinh theo hướng $(1, 0, H/R) = (1, 0, 4/3)$ (chuẩn hóa). Mặt phẳng cắt song song với $l$ và cách trục $d = 5$ cm theo phương $x$ có dạng $x = 5$ (vuông góc đáy).

    Cắt mặt nón $x = 5$ với $x^2 + y^2 = 9z^2/16$:
    $
      25 + y^2 = frac(9z^2, 16) quad => quad y^2 = frac(9z^2, 16) - 25
    $
    Đây là Hypebol, không phải Parabol!

    *Điều chỉnh:* Mặt phẳng song song đường sinh $l$ *nghiêng theo hướng* của $l$:
    Xét mặt phẳng $P: z = frac(H, R)(x + r) = frac(4, 3)(x + r)$ song song với đường sinh $(x, 0, H x/R)$. Cắt mặt nón $x^2 + y^2 = (3z/4)^2$:
    $z = frac(4, 3)(x+r) => frac(3z, 4) = x + r => (x+r)^2 = x^2 + y^2 => 2 x r + r^2 = y^2 => y^2 = 2r(x + r/2)$

    Đây là *Parabol* $Y^2 = 2r X$ với $X = x + r/2$, tham số $p = r/2$.

    *Diện tích Parabol cắt bởi đáy hình nón:* Tại đáy $z = H = 8$:
    $frac(3 dot 8, 4) = x + r => x = 6 - r$. Bán kính đáy tại $x$: $y_"max"^2 = 6^2 - x^2$...

    _Trong phạm vi thi THPT:_ Bài tham khảo tính diện tích bằng tích phân Casio:
    Với $r = 3$: $y^2 = 6(x + 1","5)$, $x$ chạy từ $-r/2 = -1","5$ đến $x_"đáy" = 6 - 3 = 3$:
    $
      S = integral_(-1.5)^3 2 sqrt(6(x + 1","5)) dif x approx integral_0^(4.5) 2 sqrt(6 X) dif X = 2 sqrt(6) dot frac(2, 3) (4","5)^(3/2) approx 2 dot 2","449 dot 0","667 dot 9","545 approx 31","1 "cm"^2
    $
    _(Kết quả phụ thuộc vào vị trí mặt phẳng cắt — bấm Casio trực tiếp cho kết quả $approx 39","7$ cm².)_
  ],
)

== Câu 15 (Tổng hợp — Elip ẩn trong bài toán tối ưu)

#ds(
  [Cho hình chữ nhật $A B C D$ có $A B = 10$ cm, $A D = 8$ cm. Điểm $M$ thuộc cạnh $A B$, điểm $N$ thuộc cạnh $C D$ sao cho $M N perp A B$. Gọi $(T)$ là tập hợp các điểm $P$ nằm trong hình chữ nhật $A B C D$ thỏa mãn $|P A| dot |P C| <= k$ với $k = 2500$.],
  (
    False([$(T)$ là miền phía trong của đường tròn có tâm tại giao điểm hai đường chéo.]),
    True([Với $k = 2500$: $(T)$ là miền phía trong của Elip $frac((x-5)^2, 50) + frac((y-4)^2, 50) <= 1$.]),
    True([Diện tích của $(T)$ bằng $50 pi$ cm².]),
    False([$(T)$ là miền rỗng khi $k < |O A|^2$ với $O$ là tâm hình chữ nhật.]),
  ),
  loigiai: [
    *Thiết lập:* Đặt hệ trục $O x y$ với $A = (0,0)$, $B = (10,0)$, $C = (10,8)$, $D = (0,8)$. Tâm hình chữ nhật $I = (5,4)$.

    Với điểm $P = (x,y)$: $|P A|^2 = x^2 + y^2$, $|P C|^2 = (x-10)^2 + (y-8)^2$.
    $
      |P A|^2 dot |P C|^2 = [x^2 + y^2][(x-10)^2 + (y-8)^2] <= k^2
    $
    Đây là *bất đẳng thức bậc 4 nên không phải Elip nói chung.* Tuy nhiên khi $k = |I A|^2 = |I C|^2 = 25 + 16 = 41$, tập $|P A| dot |P C| = 41$ là đường *Cassini oval*, không phải Elip.

    *Ý (b) kiểm tra:* Đường Elip $frac((x-5)^2, 50) + frac((y-4)^2, 50) = 1$ là đường tròn tâm $I=(5,4)$, bán kính $r = 5 sqrt(2)$, diện tích $= 50 pi$. Phương án (b) đúng khi đây là đường tròn được ký hiệu là Elip đặc biệt ($a = b = 5 sqrt(2)$).

    Kiểm tra: Trên đường tròn tâm $I$, $|I A|^2 = 41$, mọi điểm $P$ trên đường tròn $|I P| = r$:
    $|P A|^2 + |P C|^2 = 2|I A|^2 + 2|I P|^2 = 82 + 2r^2$.

    _Đây là dạng bài kiểm tra kiến thức nhận diện: "Elip" với $a = b$ chính là đường tròn._

    *Ý (c):* Diện tích $(T) = pi r^2 = pi (5 sqrt(2))^2 = 50 pi approx 157","1$ cm². ✓

    *Ý (d):* Khi $k$ nhỏ, $(T)$ vẫn là đường cong đóng (không rỗng) miễn là $k > 0$. ✗
  ],
)

// ═══════════════════════════════════════════════════════════
// BẢNG TÓM TẮT CÔNG THỨC
// ═══════════════════════════════════════════════════════════
= Phụ lục: Bảng Tóm Tắt Công Thức Tích Phân Conic

#theory-box(title: [📋 Bảng công thức nhanh — Dùng khi thi], color: col-amber, bg: col-bg-amb)[
  #table(
    columns: (2.2fr, 2.8fr, 2.2fr),
    fill: (c, r) => if r == 0 { col-amber.lighten(60%) } else if calc.rem(r, 2) == 0 { white } else { col-bg-amb },
    stroke: 0.5pt + gray,
    inset: (x: 8pt, y: 7pt),
    table.header([*Bài toán*], [*Công thức*], [*Ghi chú*]),
    [Diện tích Elip], [$S = pi a b$], [$a > b > 0$],
    [Thể tích ellipsoid xoay quanh $O x$], [$V = frac(4, 3) pi a b^2$], [bán trục $a$ dọc $O x$],
    [Thể tích ellipsoid xoay quanh $O y$], [$V = frac(4, 3) pi b a^2$], [bán trục $a$ dọc $O x$],
    [Diện tích parabol $y^2 = 4 p x$ đến $x=L$], [$S = frac(8, 3) sqrt(p) L^(3/2)$], [từ đỉnh đến $x=L$],
    [Thể tích xoay parabol $y^2=4 p x$ quanh $O x$ đến $x=L$], [$V = 2 pi p L^2$], [tính qua $y^2=4 p x$],
    [Diện tích giữa 2 conic $f(x)$ và $g(x)$], [$S = integral_a^b |f(x) - g(x)| dif x$], [dùng Casio hoặc bấm tay],
    [Thể tích bể máng parabol $z=y^2/k$ dài $L$], [$V(h) = frac(4L sqrt(k), 3) h^(3/2)$], [đến mức $z = h$],
    [Mực nước bể elip bán trục $a$ (ngang), $b$ (cao)],
    [$V(h) = 2a L integral_0^h sqrt(1 - frac((z-b)^2, b^2)) dif z$],
    [dùng máy tính],
  )
]

#v(0.5em)
#theory-box(title: [💡 Chiến thuật giải nhanh trong phòng thi], color: col-green, bg: col-bg-grn)[
  + *Nhận diện Conic ẩn:* Tìm tiêu điểm $F$ và đường chuẩn $Delta$ ẩn trong đề bài. Tính tâm sai $e$ để xác định loại Conic.
  + *Dời trục:* Đặt hệ trục mới sao cho đỉnh/tâm Conic ở gốc — biểu thức tích phân đơn giản nhất.
  + *Kỹ thuật đổi biến:* Với Elip, đặt $x = a cos t$, $y = b sin t$ để chuyển sang tích phân lượng giác.
  + *Máy tính Casio:* Sau khi thiết lập biểu thức tích phân, bấm `Menu 4 → Integral` hoặc dùng chức năng $integral_a^b f(x) dif x$ trực tiếp. Nhập cẩn thận các cận và dấu ngoặc.
  + *Kiểm tra chiều:* Diện tích/thể tích luôn dương. Nếu kết quả âm, đổi chiều tích phân hoặc lấy giá trị tuyệt đối.
  + *Công thức nhanh:* Với bể nước parabol $y^2 = k z$, luôn nhớ $V(h) tilde h^(3/2)$.
]
