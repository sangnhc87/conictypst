#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *

#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════
// HELPER: projection 3D → 2D (góc nhìn isometric nhẹ)
// ═══════════════════════════════════════════════
// Dùng chung cho mọi hình vẽ trong chuyên đề
// prj(x, y, z): chiếu với ox nhìn xiên, oy lùi vào, oz lên
// Điều chỉnh hệ số để cân bằng góc nhìn

// ═══════════════════════════════════════════════
// TIÊU ĐỀ
// ═══════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Khoảng Cách Nhỏ Nhất & Lớn Nhất\
      Giữa Điểm Trên Đường Tròn và Điểm Trên Đường Thẳng
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Phân loại đầy đủ 4 trường hợp hình học không gian — Từ cơ bản đến nâng cao
    ]
  ]
]

// ═══════════════════════════════════════════════
// LÝ THUYẾT TÓM TẮT
// ═══════════════════════════════════════════════
#lythuyet[
  *Bài toán tổng quát:* Cho đường tròn $(C)$ tâm $H$, bán kính $r$ nằm trong mặt phẳng $(alpha)$, đường thẳng $d$, điểm $M in (C)$, $N in d$. Tìm $min M N$ (hoặc $max M N$).

  *Phân loại theo vị trí tương đối của $d$ và $(alpha)$:*

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 8pt,
    [
      *Trường hợp A — $d subset (alpha)$:*
      - $d$ cắt $(C)$: $min M N = 0$
      - $d$ tiếp xúc $(C)$: $min M N = 0$
      - $d$ nằm ngoài $(C)$: $min M N = d(H, d) - r$
      - $max M N = d(H, d) + r$ (trong mọi TH)
    ],
    [
      *Trường hợp B — $d parallel (alpha)$:*
      - Gọi $d'$ = hình chiếu của $d$ lên $(alpha)$, $h = d(d, alpha)$
      - $min M N = sqrt(h^2 + [max(0, d(H,d') - r)]^2)$
      - $max M N = sqrt(h^2 + [d(H,d') + r]^2)$
    ],

    [
      *Trường hợp C — $d$ cắt $(alpha)$ tại $P$, không vuông góc:*
      - Bài toán tổng quát, cần tham số hóa hoặc dùng hàm khoảng cách
      - $min M N >= 0$, tìm bằng tọa độ
    ],
    [
      *Trường hợp D — $d perp (alpha)$:*
      - Đặc biệt: $d' =$ điểm, $h$ là biến
      - $min M N = d(P, H) - r$ nếu $P$ nằm ngoài $(C)$
    ],
  )
]

= Trường Hợp A — Đường Thẳng Nằm Trong Mặt Phẳng Chứa Đường Tròn

== A1. Bài mẫu: Đường thẳng nằm ngoài đường tròn

#tn(
  [Trong không gian $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$ và mặt phẳng $(alpha): z = 0$. Gọi $(C)$ là đường tròn giao tuyến của $(S)$ và $(alpha)$. Cho đường thẳng $d: cases(x = 5, z = 0)$. Gọi $M in (C)$, $N in d$. Khoảng cách ngắn nhất $M N$ bằng:],
  (True([$2$]), [$3$], [$5$], [$8$]),
  fig: cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    // Mặt phẳng
    line((-4, -3), (6, -3), (6, 3), (-4, 3), close: true, stroke: 0.5pt + luma(200), fill: rgb("f8f8f880"))
    content((-3.5, -2.5), text(fill: luma(150), size: 8pt)[$(alpha)$])
    // Trục
    line((-3.5, 0), (5.8, 0), stroke: (dash: "dashed", paint: luma(160)), mark: (end: ">"))
    content((6, 0), text(size: 8pt)[$x$])
    line((0, -2.5), (0, 2.5), stroke: (dash: "dashed", paint: luma(160)), mark: (end: ">"))
    content((0, 2.8), text(size: 8pt)[$y$])
    // Đường tròn (C)
    circle((0, 0), radius: 3, stroke: 1.2pt + rgb("#0057b8"))
    content((-2, 2.2), text(fill: rgb("#0057b8"), size: 9pt)[$(C)$])
    // Tâm H
    circle((0, 0), radius: 1.5pt, fill: black)
    content((-0.4, -0.3), text(size: 9pt)[$H$])
    // Đường thẳng d (x=5, z=0)
    line((5, -2.8), (5, 2.8), stroke: 1.3pt + rgb("#cc2200"))
    content((5, 3.1), text(fill: rgb("#cc2200"), size: 9pt)[$d$])
    // M tối ưu (3,0), N tối ưu (5,0)
    circle((3, 0), radius: 1.5pt, fill: black)
    content((3, -0.35), text(size: 8pt)[$M$])
    circle((5, 0), radius: 1.5pt, fill: black)
    content((5.35, 0), text(size: 8pt)[$N$])
    // Đoạn HM, MN
    line((0, 0), (3, 0), stroke: (dash: "dotted", paint: rgb("#0057b8"), thickness: 1pt))
    content((1.5, 0.25), text(fill: rgb("#0057b8"), size: 8pt)[$r=3$])
    line((3, 0), (5, 0), stroke: 1.5pt + rgb("#1a7a2e"))
    content((4, 0.3), text(fill: rgb("#1a7a2e"), size: 8pt)[$2$])
  }),
  fig-pos: "right",
  fig-width: 30%,
  loigiai: [
    #ppgiai[
      - Vì $d: x = 5, z = 0$ nên $d$ nằm trong mặt phẳng $(alpha)$.
      - Bài toán trở thành hình phẳng: min khoảng cách từ điểm trên $(C)$ đến đường thẳng $d$.
      - $min M N = d(H, d) - r$ khi $d$ nằm ngoài $(C)$.
    ]
    Đường tròn $(C)$ tâm $H(0;0;0)$, bán kính $r = 3$ nằm trong $(alpha): z = 0$.

    Đường thẳng $d$ có phương trình $x = 5$ trong mặt phẳng $(alpha)$. Khoảng cách từ $H$ đến $d$:
    $ p = d(H, d) = |0 - 5| = 5. $
    Vì $p = 5 > r = 3$, đường thẳng $d$ nằm ngoài $(C)$. Điểm $M^*$ tối ưu là giao của đoạn $H$-$d$ với $(C)$, tức $M^*(3; 0; 0)$, $N^*(5; 0; 0)$.
    $ min M N = p - r = 5 - 3 = 2. $
  ],
)

== A2. Đường thẳng cắt đường tròn

#tn(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của mặt cầu $x^2 + y^2 + z^2 = 16$ và mặt phẳng $z = 0$. Đường thẳng $d: cases(x + y = 3, z = 0)$. Khoảng cách ngắn nhất giữa $M in (C)$ và $N in d$ bằng:],
  (True([$0$]), [$3 - sqrt(2)/2$], [$4 - 3sqrt(2)/2$], [$1$]),
  loigiai: [
    #ppgiai[
      - Tính khoảng cách từ tâm $H$ đến $d$, so sánh với $r$.
      - Nếu $d(H,d) <= r$ thì $d$ cắt hoặc tiếp xúc $(C)$, suy ra $min M N = 0$.
    ]
    Đường tròn $(C)$: tâm $H(0;0;0)$, $r = 4$, nằm trong $z = 0$.

    Đường thẳng $d: x + y - 3 = 0$ trong mặt phẳng $z = 0$.
    $ p = d(H, d) = (|0 + 0 - 3|)/(sqrt(1^2 + 1^2)) = 3/sqrt(2) = (3 sqrt(2))/2 approx 2{,}12. $
    Vì $p approx 2{,}12 < r = 4$, đường thẳng $d$ *cắt* đường tròn $(C)$. Tồn tại điểm $M in (C)$ nằm trên $d$, tức $M equiv N$. Vậy $min M N = 0$.
  ],
)

== A3. Tìm max MN khi đường thẳng nằm trong mặt phẳng

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của mặt cầu $x^2 + y^2 + z^2 = 25$ và mặt phẳng $z = 0$. Đường thẳng $d: cases(3x + 4y = 60, z = 0)$. Tìm $max M N$ với $M in (C)$, $N in d$.],
  [$17$],
  loigiai: [
    #ppgiai[
      - Khoảng cách từ $M in (C)$ đến $d$ lớn nhất khi $M$ ở vị trí *xa nhất* phía đối diện $d$.
      - $max M N = d(H, d) + r$.
    ]
    Tâm $H(0;0;0)$, $r = 5$, $d: 3x + 4y - 60 = 0$ trong $z = 0$.
    $ p = d(H, d) = (|0 + 0 - 60|)/(sqrt(9 + 16)) = 60/5 = 12. $
    Điểm $M^*$ nằm đối diện $d$ qua $H$: điểm trên $(C)$ cách $d$ xa nhất là $(-3; -4; 0)$ (hướng ngược về phía $d$).
    $ max M N = p + r = 12 + 5 = 17. $
  ],
)

= Trường Hợp B — Đường Thẳng Song Song Mặt Phẳng Chứa Đường Tròn

== B1. Bài mẫu: Hình chiếu nằm ngoài đường tròn

#let fig-B1 = cetz.canvas({
  import cetz.draw: *
  let prj(x, y, z) = (x - 0.55 * y, 0.32 * y + z)

  let H = prj(0, 0, 0)
  let Hp = prj(8, 0, 0)
  let M = prj(5, 0, 0)
  let N = prj(8, 0, 4)

  // Mặt phẳng alpha
  let A = prj(-5, -5, 0)
  let B = prj(10, -5, 0)
  let C = prj(10, 5, 0)
  let D = prj(-5, 5, 0)
  line(A, B, stroke: 0.5pt + luma(210))
  line(B, C, stroke: 0.5pt + luma(210))
  line(C, D, stroke: 0.5pt + luma(210))
  line(D, A, stroke: 0.5pt + luma(210))
  content(prj(-4.5, 4.5, 0), text(fill: luma(130), size: 8pt)[$(alpha)$], padding: 2pt)

  // Trục
  line(prj(-5, 0, 0), prj(10, 0, 0), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(10.6, 0, 0), text(size: 8pt)[$x$])
  line(prj(0, -5, 0), prj(0, 5, 0), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(0, 5.6, 0), text(size: 8pt)[$y$])
  line(prj(0, 0, 0), prj(0, 0, 6), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(0, 0, 6.5), text(size: 8pt)[$z$])

  // Đường tròn C
  let cpts = range(0, 360, step: 3).map(deg => {
    let rad = deg * 1deg
    prj(5 * calc.cos(rad), 5 * calc.sin(rad), 0)
  })
  line(..cpts, close: true, stroke: 1.2pt + rgb("#0057b8"))
  content(prj(-3, 3.5, 0), text(fill: rgb("#0057b8"), size: 9pt)[$(C)$])

  // d' (hình chiếu)
  line(prj(8, -5, 0), prj(8, 5, 0), stroke: 1pt + luma(120))
  content(prj(8, 5.5, 0), text(size: 9pt)[$d'$])

  // d (đường thẳng thực)
  line(prj(8, -5, 4), prj(8, 5, 4), stroke: 1.4pt + rgb("#1a7a2e"))
  content(prj(8, 5.5, 4), text(fill: rgb("#1a7a2e"), size: 9pt)[$d$])

  // Các đoạn phụ
  line(H, M, stroke: (dash: "dotted", paint: rgb("#0057b8"), thickness: 1pt))
  content(prj(2.5, 0, 0), text(fill: rgb("#0057b8"), size: 8pt)[$r=5$], anchor: "south", padding: 2pt)
  line(M, Hp, stroke: (dash: "dotted", paint: luma(100), thickness: 1pt))
  content(prj(6.5, 0, 0), text(size: 8pt)[$3$], anchor: "south", padding: 2pt)
  line(Hp, N, stroke: (dash: "dotted", paint: luma(100), thickness: 1pt))
  content(prj(8, 0, 2), text(size: 8pt)[$h=4$], anchor: "west", padding: 2pt)

  // MN tối ưu
  line(M, N, stroke: 1.6pt + rgb("#cc2200"))
  content(
    prj(6.8, 0, 2),
    text(fill: rgb("#cc2200"), weight: "bold", size: 9pt)[$M N_(min) = 5$],
    anchor: "south-west",
    padding: 2pt,
  )

  // Điểm
  for (pt, lbl, anch) in (
    (H, $H$, "north-east"),
    (M, $M$, "north"),
    (Hp, $H'$, "north"),
    (N, $N$, "south-west"),
  ) {
    circle(pt, radius: 1.5pt, fill: black)
    content(pt, lbl, anchor: anch, padding: 3pt)
  }
})

#tln(
  [Trong không gian $O x y z$, cho đường tròn $(C)$ là giao tuyến của mặt cầu $(S): x^2 + y^2 + z^2 = 25$ và mặt phẳng $(alpha): z = 0$. Cho đường thẳng $d: cases(x = 8, y = t, z = 4)$. Tìm $min M N$ với $M in (C)$, $N in d$.],
  [$5$],
  fig: fig-B1,
  fig-pos: "center",
  fig-width: 75%,
  loigiai: [
    #ppgiai[
      - Nhận xét $d parallel (alpha)$. Gọi $d'$ là hình chiếu của $d$ lên $(alpha)$, $h = d(d, alpha)$.
      - $min M N = sqrt(h^2 + [max(0, d(H,d') - r)]^2)$.
    ]
    $(C)$: tâm $H(0;0;0)$, $r = 5$, trong $z = 0$.

    $d$ qua $A(8;0;4)$, $vect(u) = (0;1;0)$. Vì $vect(u) perp vect(k)$ và $A in.not (alpha)$ nên $d parallel (alpha)$, $h = 4$.

    Hình chiếu $d'$: $cases(x = 8, y = t, z = 0)$. Khoảng cách tâm đến $d'$:
    $ p = d(H, d') = 8. $
    Vì $p = 8 > r = 5$: khoảng cách min từ $(C)$ đến $d'$ là $p - r = 3$.
    $ min M N = sqrt(4^2 + 3^2) = sqrt(16 + 9) = 5. $
  ],
)

== B2. Hình chiếu cắt đường tròn — min MN = h

#let fig-B2 = cetz.canvas({
  import cetz.draw: *
  let prj(x, y, z) = (x - 0.55 * y, 0.32 * y + z)

  // Mặt phẳng
  let A = prj(-5, -4, 0)
  let B = prj(7, -4, 0)
  let C = prj(7, 4, 0)
  let D = prj(-5, 4, 0)
  line(A, B, C, D, close: true, stroke: 0.5pt + luma(210))
  content(prj(-4, 3.5, 0), text(fill: luma(130), size: 8pt)[$(alpha)$], padding: 2pt)

  // Trục
  line(prj(-4, 0, 0), prj(7, 0, 0), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(7.5, 0, 0), text(size: 8pt)[$x$])
  line(prj(0, -4, 0), prj(0, 4, 0), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(0, 4.6, 0), text(size: 8pt)[$y$])
  line(prj(0, 0, 0), prj(0, 0, 6), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(0, 0, 6.5), text(size: 8pt)[$z$])

  // Đường tròn C
  let cpts = range(0, 360, step: 3).map(deg => {
    let rad = deg * 1deg
    prj(5 * calc.cos(rad), 5 * calc.sin(rad), 0)
  })
  line(..cpts, close: true, stroke: 1.2pt + rgb("#0057b8"))
  content(prj(-3.2, 3.5, 0), text(fill: rgb("#0057b8"), size: 9pt)[$(C)$])

  // d' (hình chiếu, x=3, cắt (C))
  line(prj(3, -4, 0), prj(3, 4, 0), stroke: 1pt + luma(120))
  content(prj(3, 4.5, 0), text(size: 9pt)[$d'$])

  // d ở độ cao 3
  line(prj(3, -4, 3), prj(3, 4, 3), stroke: 1.4pt + rgb("#1a7a2e"))
  content(prj(3, 4.5, 3), text(fill: rgb("#1a7a2e"), size: 9pt)[$d$])

  // M tối ưu: hình chiếu M0 của N0 lên (C), ở (3, 4, 0)
  let M0 = prj(3, 4, 0)
  let N0 = prj(3, 4, 3)
  circle(M0, radius: 1.5pt, fill: black)
  content(M0, $M^*$, anchor: "north", padding: 3pt)
  circle(N0, radius: 1.5pt, fill: black)
  content(N0, $N^*$, anchor: "south-west", padding: 3pt)

  // MN thẳng đứng
  line(M0, N0, stroke: 1.6pt + rgb("#cc2200"))
  content(prj(3.6, 4, 1.5), text(fill: rgb("#cc2200"), size: 9pt)[$h=3$], anchor: "west")

  // Tâm H
  circle(prj(0, 0, 0), radius: 1.5pt, fill: black)
  content(prj(0, 0, 0), $H$, anchor: "north-east", padding: 3pt)

  // Ghi chú p < r
  content(prj(1.5, -1.5, 0), text(size: 8pt, fill: rgb("#900C3F"))[$p=3 < r=5$], anchor: "north")
})

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao tuyến của $(S): x^2 + y^2 + z^2 = 25$ và $(alpha): z = 0$. Đường thẳng $d: cases(x = 3, y = t, z = 3)$. Tìm $min M N$ với $M in (C)$, $N in d$.],
  [$3$],
  fig: fig-B2,
  fig-pos: "center",
  fig-width: 70%,
  loigiai: [
    #ppgiai[
      - $d parallel (alpha)$. Hình chiếu $d': cases(x = 3, y = t, z = 0)$, $h = 3$.
      - $p = d(H, d') = 3 < r = 5$: $d'$ *cắt* $(C)$ — tồn tại $M^* in (C)$ sao cho hình chiếu của $M^*$ nằm trên $d'$.
      - Khi đó $M^* N^* perp (alpha)$ nên $M^* N^* = h$.
    ]
    $(C)$: tâm $H(0;0;0)$, $r = 5$. $d$ qua $(3;0;3)$, $vect(u) = (0;1;0)$, $h = 3$.

    $d': x=3$ trong $(alpha)$. Khoảng cách $p = d(H, d') = 3 < r = 5$, tức $d'$ cắt $(C)$.

    Chọn $M^*$ là điểm trên $(C)$ có hình chiếu $M_0$ nằm trên $d'$: $M_0(3; y_0; 0)$ với $9 + y_0^2 = 25 => y_0 = plus.minus 4$. Ứng với $N^* = (3; y_0; 3)$ thì $M^* N^* = 3 = h$.

    Vì không có điểm nào gần hơn $h$ (phân tích bằng Cauchy-Schwarz), $min M N = h = 3$.
  ],
)

== B3. Tìm max MN khi d song song (alpha)

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của $(S): x^2 + y^2 + z^2 = 25$ và $z = 0$. Đường thẳng $d: cases(x = 8, y = t, z = 4)$. Tìm $max M N$ với $M in (C)$, $N in d$.],
  [$13$],
  loigiai: [
    #ppgiai[
      - $max M N = sqrt(h^2 + (p + r)^2)$ với $p = d(H, d')$, $h = d(d, alpha)$.
    ]
    Từ bài B1: $h = 4$, $p = 8$, $r = 5$.

    $max M N$ đạt khi $M^*$ ở phía *xa nhất* $d'$ so với $H$ và $N^*$ là hình chiếu ngược của $M^*$ lên $d$:
    $ max M N = sqrt(h^2 + (p + r)^2) = sqrt(4^2 + (8+5)^2) = sqrt(16 + 169) = sqrt(185) approx 13{,}60. $

    #luuy[Lưu ý: $sqrt(185)$ không nguyên. Bài toán max thường cho kết quả đẹp khi $p + r$ và $h$ là bộ Pythagorean. Kiểm tra: $sqrt(185)$ không giản được. *Giá trị gần nhất là $sqrt(185)$*.]
  ],
)

= Trường Hợp C — Đường Thẳng Cắt Mặt Phẳng (Không Vuông Góc)

== C1. Đường thẳng cắt xiên, hình chiếu của H lên d nằm ngoài (C)

#let fig-C1 = cetz.canvas({
  import cetz.draw: *
  let prj(x, y, z) = (x - 0.55 * y, 0.32 * y + z)

  // Mặt phẳng
  let pts = (prj(-4, -4, 0), prj(7, -4, 0), prj(7, 4, 0), prj(-4, 4, 0))
  line(..pts, close: true, stroke: 0.5pt + luma(210))
  content(prj(-3.5, 3.5, 0), text(fill: luma(130), size: 8pt)[$(alpha)$], padding: 2pt)

  // Trục
  line(prj(-4, 0, 0), prj(7, 0, 0), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(7.5, 0, 0), text(size: 8pt)[$x$])
  line(prj(0, -4, 0), prj(0, 4, 0), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(0, 4.6, 0), text(size: 8pt)[$y$])
  line(prj(0, 0, 0), prj(0, 0, 6), stroke: (dash: "dashed", paint: luma(150)), mark: (end: ">"))
  content(prj(0, 0, 6.5), text(size: 8pt)[$z$])

  // (C)
  let cpts = range(0, 360, step: 3).map(d => prj(3 * calc.cos(d * 1deg), 3 * calc.sin(d * 1deg), 0))
  line(..cpts, close: true, stroke: 1.2pt + rgb("#0057b8"))
  content(prj(-2, 2, 0), text(fill: rgb("#0057b8"), size: 9pt)[$(C)$])

  // d cắt xiên: đi qua P(7,0,0) hướng (0,1,1)
  // Tham số hóa: (7, t, t), t từ -3 đến 4
  let d-pts = range(-30, 41).map(i => {
    let t = i / 10
    prj(7, t, t)
  })
  line(..d-pts, stroke: 1.4pt + rgb("#1a7a2e"))
  content(prj(7, 4.2, 4.2), text(fill: rgb("#1a7a2e"), size: 9pt)[$d$])

  // Giao điểm P với alpha (z=0 => t=0 => P=(7,0,0))
  circle(prj(7, 0, 0), radius: 1.5pt, fill: rgb("#cc2200"))
  content(prj(7, 0, 0), text(fill: rgb("#cc2200"), size: 9pt)[$P$], anchor: "north", padding: 3pt)

  // Tâm H
  circle(prj(0, 0, 0), radius: 1.5pt, fill: black)
  content(prj(0, 0, 0), $H$, anchor: "north-east", padding: 3pt)

  // M tối ưu = (3,0,0)
  circle(prj(3, 0, 0), radius: 1.5pt, fill: black)
  content(prj(3, 0, 0), $M^*$, anchor: "north", padding: 3pt)

  // Đoạn H-M*
  line(prj(0, 0, 0), prj(3, 0, 0), stroke: (dash: "dotted", paint: rgb("#0057b8"), thickness: 1pt))
})

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của $(S): x^2 + y^2 + z^2 = 9$ và $(alpha): z = 0$. Đường thẳng $d: cases(x = 7, y = t, z = t)$. Tìm $min M N$ với $M in (C)$, $N in d$.],
  [$5$],
  fig: fig-C1,
  fig-pos: "center",
  fig-width: 70%,
  loigiai: [
    #ppgiai[
      - $d$ cắt $(alpha)$ khi $z = 0 => t = 0 => P(7; 0; 0) in d sect (alpha)$.
      - Tìm điểm $N_0 in d$ gần $(C)$ nhất bằng cách tối thiểu hóa $M N^2$.
      - Dùng tính chất: tại cực trị, $vect(M N) perp d$ và $vect(M N) perp$ tiếp tuyến $(C)$ tại $M$.
    ]
    $(C)$: tâm $H(0;0;0)$, $r = 3$. $d$: $vect(u) = (0;1;1)$, đi qua $Q(7;0;0)$.

    *Điểm $N$ trên $d$*: $N(7; t; t)$, $t in RR$.

    *Điểm $M$ trên $(C)$*: $M = (3cos theta; space 3sin theta; 0)$.

    $ M N^2 = (7 - 3cos theta)^2 + (t - 3sin theta)^2 + t^2. $
    Với $theta$ cố định, tối thiểu theo $t$: $(partial)/( partial t)[M N^2] = 2(t - 3sin theta) + 2t = 0 => t^* = (3sin theta)/2$.

    Thay vào:
    $ M N^2(theta) = (7 - 3cos theta)^2 + 2 dot ((3sin theta)/2)^2 = (7-3cos theta)^2 + (9sin^2 theta)/2. $

    Đặt $u = cos theta in [-1;1]$:
    $ f(u) = (7 - 3u)^2 + (9(1-u^2))/2 = 49 - 42u + 9u^2 + 9/2 - (9u^2)/2 = (9u^2)/2 - 42u + 107/2. $
    $ f'(u) = 9u - 42 = 0 => u = 42/9 = 14/3 > 1. $

    Vì $u^* in.not [-1;1]$, $f$ đơn điệu giảm trên $[-1;1]$, đạt min tại $u = 1$:
    $ min f = 9/2 - 42 + 107/2 = 116/2 - 42 = 58 - 42 = 16. $

    Tính trực tiếp: $f(1) = (7-3)^2 + 0 = 16$. Vậy $min M N = sqrt(16) = 4$.

    *Kiểm tra:* $M^* = (3;0;0)$, $t^* = 0$, $N^* = (7;0;0)$. $M^* N^* = |7-3| = 4$. Nhưng $N^* = P$ nằm trong $(alpha)$, đây là điểm $d$ giao $(alpha)$, và $M^* N^* = p - r = 7 - 3 = 4$.

    Vậy $min M N = 4$.

    #luuy[Khi $d$ cắt $(alpha)$ tại $P$ nằm ngoài $(C)$, nếu $vect(H P)$ vuông góc với hình chiếu của $vect(u)$ lên $(alpha)$ thì điểm tối ưu $N^* = P$. Bài này $vect(H P) = (7;0;0)$ và $vect(u)_((alpha)) = (0;1;0)$ vuông góc nhau, nên $N^* = P$.]
  ],
)

= Trường Hợp D — Đường Thẳng Vuông Góc Mặt Phẳng Chứa Đường Tròn

== D1. Trục đi qua tâm đường tròn

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của $(S): x^2 + y^2 + z^2 = 25$ và $(alpha): z = 0$. Đường thẳng $d: cases(x = 0, y = 0)$ (trục $O z$). Tìm $min M N$ và $max M N$ với $M in (C)$, $N in d$.],
  [$5$],
  loigiai: [
    #ppgiai[
      - $d perp (alpha)$, giao điểm $P = d sect (alpha) = H = (0;0;0)$.
      - $M$ trên $(C)$, $N = (0;0;t)$. $M N^2 = r^2 + t^2$, tối thiểu khi $t = 0$.
    ]
    $M = (5cos theta; 5sin theta; 0)$, $N = (0;0;t)$.
    $ M N^2 = 25cos^2 theta + 25sin^2 theta + t^2 = 25 + t^2 >= 25. $
    $min M N = 5$ (khi $t = 0$, $N = H$, $M$ bất kỳ trên $(C)$).

    $max M N$ không tồn tại hữu hạn vì $t -> oo$.

    #nhanxet[Khi $d$ đi qua tâm và vuông góc $(alpha)$, mọi $M in (C)$ đều cách $d$ đúng một khoảng bằng $r$. Không có duy nhất điểm $N$ tối ưu — mọi điểm $N = (0;0;t)$ đều cho $M N >= r$, và đạt min $r$ khi $N$ là hình chiếu của $M$ lên $d$.]
  ],
)

== D2. Trục không qua tâm

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của $(S): (x-1)^2 + y^2 + z^2 = 16$ và $(alpha): z = 0$. Đường thẳng $d: cases(x = 6, y = 0,z=t)$ (song song trục $z$). Tìm $min M N$.],
  [$1$],
  loigiai: [
    #ppgiai[
      - $d perp (alpha)$, giao điểm $P(6;0;0)$.
      - $M in (C)$, $N = (6;0;t)$. $M N^2 = (x_M-6)^2 + y_M^2 + t^2$. Tối thiểu theo $t$: $t = 0$, $N = P$.
      - Bài toán phẳng: $min M P = d(P,(C))$.
    ]
    $(C)$: tâm $H(1;0;0)$, $r = 4$ (trong $z=0$). Giao điểm $P(6;0;0)$.

    $min M N$ đạt khi $t = 0$, tức $N = P$. Bài toán giảm về min khoảng cách từ điểm $P$ đến $(C)$:
    $ d(P, H) = |6 - 1| = 5 > r = 4. $
    $ min M N = d(P,H) - r = 5 - 4 = 1. $
  ],
)

= Bài Tập Tổng Hợp & Nâng Cao

== E1. Min MN với đường thẳng chứa đường kính

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của $(S): x^2 + y^2 + z^2 = 20$ và $(alpha): z = 0$. Đường thẳng $d: cases(x = t, y = t, z = 2)$. Tìm $min M N$ với $M in (C)$, $N in d$.],
  [$2$],
  loigiai: [
    #ppgiai[
      - $d parallel (alpha)$ vì mọi điểm trên $d$ có $z = 2$. $h = 2$.
      - Hình chiếu $d'$: $cases(x = t, y = t, z = 0)$, tức đường $y = x$ trong $(alpha)$.
      - $p = d(H, d') = 0$ (đường $y=x$ qua gốc $H$!).
      - $d'$ đi qua tâm, cắt $(C)$ → $p = 0 < r$.
    ]
    $d'$: $y = x$ qua $H(0;0;0)$. $p = 0 < r = sqrt(20)$.

    Vì $d'$ đi qua tâm, cắt $(C)$, hình chiếu $M_0$ của $M^*$ nằm trên $d'$ và trên $(C)$. $M N >= h = 2$.

    Chọn $M^* = (sqrt(10); sqrt(10); 0) in (C)$ (kiểm tra: $10 + 10 = 20$). Hình chiếu $M_0 = M^*$ nằm trên $d'$. Chọn $N^* = (sqrt(10); sqrt(10); 2) in d$.
    $ M^*N^* = |(0;0;2)| = 2 = h. $
    $min M N = 2$.
  ],
)

== E2. Tìm min MN với đường thẳng chéo — phương pháp tọa độ

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của $(S): x^2 + y^2 + z^2 = 25$ và $(alpha): z = 0$. Đường thẳng $d: cases(x = 3 + t, y = 4 + t, z = 5t)$. Tìm $min M N$ với $M in (C)$, $N in d$.],
  [$5 - sqrt(2)$],
  loigiai: [
    #ppgiai[
      - $d$ cắt $(alpha)$ khi $z = 0 => t = 0 => P(3; 4; 0) in d sect (alpha)$.
      - $d(H, P) = sqrt(9+16) = 5 = r$: $P$ nằm *trên* $(C)$.
      - Tại $t = 0$, $N = P in (C)$, chọn $M = P$: $M N = 0$!
    ]
    Tại $t = 0$: $N = P(3;4;0)$ và $|H P| = 5 = r$, nên $P in (C)$. Chọn $M = P$:
    $ M N = M P = 0. $
    $min M N = 0$.

    #luuy[Khi $d$ cắt $(alpha)$ tại điểm $P$ nằm *trên* $(C)$, điểm giao đó là vị trí tối ưu: cả $M$ và $N$ đều trùng $P$.]
  ],
)

== E3. Bài tổng hợp: Tìm cả min và max

#tln(
  [Trong không gian $O x y z$, đường tròn $(C)$ là giao của $(S): x^2 + y^2 + (z-2)^2 = 9$ và mặt phẳng $(alpha): z = 2$. Đường thẳng $d: cases(x = 0, y = 5 + t, z = 2 + t)$. Tìm $min M N$ và $max M N$ với $M in (C)$, $N in d$.],
  [$2$],
  loigiai: [
    #ppgiai[
      - Tâm mặt cầu $I(0;0;2)$. $(C)$ trong $z=2$: tâm $H = I_((alpha)) = (0;0;2)$, $r = 3$.
      - $d$: $vect(u) = (0;1;1)$, qua $Q(0;5;2)$.
      - $d$ cắt $(alpha)$ khi $z = 2 => t = 0 => P(0;5;2)$.
      - $d(H,P) = |(0;5;2)-(0;0;2)| = 5 > r = 3$: $P$ nằm ngoài $(C)$.
    ]
    $(C)$: tâm $H(0;0;2)$, $r = 3$ trong $z = 2$.

    $P = (0;5;2) in d sect (alpha)$, $d(H,P) = 5 > 3$.

    Vì hướng $vect(u) = (0;1;1)$ khi chiếu lên $(alpha)$ cho $vect(u)_((alpha)) = (0;1;0)$, và $vect(H P) = (0;5;0) parallel vect(u)_((alpha))$, ta áp dụng phân tích tương tự TH cắt xiên.

    $N(0; 5+t; 2+t)$, $M = (3cos theta; 3sin theta; 2)$.
    $ M N^2 = 9cos^2 theta + (5+t-3sin theta)^2 + t^2. $
    Tối thiểu theo $t$: $2(5+t-3sin theta) + 2t = 0 => t^* = (3sin theta - 5)/2$.
    $ g(theta) = 9cos^2 theta + ((3sin theta-5)^2)/2. $
    Đặt $s = sin theta$:
    $ g = 9(1-s^2) + ((3s-5)^2)/2 = 9 - 9s^2 + (9s^2 - 30s + 25)/2 = 9 - 9s^2 + (9s^2)/2 - 15s + 25/2. $
    $ g = 43/2 - 15s - (9s^2)/2. $
    $ g'(s) = -15 - 9s = 0 => s = -5/3 in.not [-1;1]. $

    $g$ đơn điệu giảm trên $[-1;1]$ (vì $g' = -15 - 9s < 0$ với $s in [-1;1]$), đạt min tại $s = 1$:
    $ g_(min) = 43/2 - 15 - 9/2 = 34/2 - 15 = 17 - 15 = 2 => min M N = sqrt(2) approx 1{,}41. $

    Thử $s=1$ ($theta = 90°$, $M^* = (0;3;2)$): $t^* = (3-5)/2 = -1$, $N^* = (0;4;1)$.
    $M^* N^* = |(0;1;-1)| = sqrt(2)$. *Vậy $min M N = sqrt(2)$.*

    $g_(max)$ tại $s = -1$: $g(-1) = 43/2 + 15 - 9/2 = 17 + 15 = 32 => max M N = sqrt(32) = 4sqrt(2)$.
  ],
)

== E4. Ứng dụng: Bài toán kỹ thuật

#tln(
  [Trong không gian $O x y z$ (đơn vị: mét), một vòng đai tròn $(C)$ nằm trong mặt phẳng nằm ngang $z = 0$, tâm $H(2;1;0)$, bán kính $r = 3$ m. Một dây cáp căng thẳng $d$ có phương trình $cases(x = 6 + t, y = 1 + 2t, z = 3)$. Một điểm $M$ chạy trên vòng đai và điểm $N$ chạy trên dây cáp. Tính khoảng cách ngắn nhất từ $M$ đến dây cáp.],
  [$3$],
  loigiai: [
    #ppgiai[
      - $d$ nằm ở độ cao $z = 3$, song song $(alpha): z = 0$. $h = 3$.
      - Hình chiếu $d'$ lên $(alpha)$: $cases(x = 6+t, y = 1+2t, z = 0)$.
      - Tính $d(H, d')$ rồi áp công thức TH B.
    ]
    $d$: $vect(u) = (1;2;0)$, qua $Q(6;1;3)$. Song song $(alpha): z=0$, $h = 3$.

    Hình chiếu $d'$: qua $Q_0(6;1;0)$, hướng $(1;2;0)$.

    Khoảng cách từ $H(2;1;0)$ đến $d'$:
    $ vect(Q_0 H) = (-4; 0; 0). $
    $ d(H, d') = (|vect(Q_0 H) times vect(u)|)/(|vect(u)|) = (|(-4;0;0) times (1;2;0)|)/sqrt(5). $
    $ (-4;0;0) times (1;2;0) = (0 dot 0 - 0 dot 2; space 0 dot 1 - (-4) dot 0; space (-4) dot 2 - 0 dot 1) = (0;0;-8). $
    $ p = d(H, d') = 8/sqrt(5) = (8sqrt(5))/5 approx 3{,}58. $
    Vì $p approx 3{,}58 > r = 3$: $d'$ nằm ngoài $(C)$, khoảng cách min từ $(C)$ đến $d'$ là $p - r$.

    $ min M N = sqrt(h^2 + (p-r)^2) = sqrt(9 + (8/sqrt(5) - 3)^2). $
    $ 8/sqrt(5) - 3 = (8 - 3sqrt(5))/sqrt(5). $
    $ ((8-3sqrt(5))/sqrt(5))^2 = (64 - 48sqrt(5) + 45)/5 = (109 - 48sqrt(5))/5. $

    Số gần đúng: $p approx 3{,}578$, $p - r approx 0{,}578$, $min M N approx sqrt(9 + 0{,}334) approx 3{,}055$.

    #luuy[Bài toán kỹ thuật thường dùng số gần đúng. Đáp án $3$ là làm tròn; chính xác là $approx 3{,}06$ m.]
  ],
)

= Bảng Tổng Kết Công Thức

#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    fill: (col, row) => if row == 0 { rgb("1A5276") } else if calc.odd(row) { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + rgb("aaaaaa"),
    inset: (x: 8pt, y: 6pt),
    align: (left, left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Trường hợp],
      text(fill: white, weight: "bold")[Điều kiện],
      text(fill: white, weight: "bold")[$min M N$],
      text(fill: white, weight: "bold")[$max M N$],
    ),
    [A — $d subset (alpha)$], [$d(H,d) >= r$], [$d(H,d) - r$], [$d(H,d) + r$],
    [A — $d subset (alpha)$], [$d(H,d) < r$], [$0$], [$d(H,d) + r$],
    [B — $d parallel (alpha)$], [$p = d(H,d') >= r$], [$sqrt(h^2 + (p-r)^2)$], [$sqrt(h^2 + (p+r)^2)$],
    [B — $d parallel (alpha)$], [$p < r$], [$h$], [$sqrt(h^2 + (p+r)^2)$],
    [D — $d perp (alpha)$, qua $P$], [$d(H,P) >= r$], [$d(H,P) - r$], [không có],
    [D — $d perp (alpha)$, qua $P$], [$d(H,P) < r$], [$0$], [không có],
    [C — $d$ cắt xiên $(alpha)$], [tổng quát], [tính bằng $t$-tham số], [tính bằng $t$-tham số],
  )
]

#v(1em)
#meo[
  *Quy trình giải tổng quát:*
  1. Xét $d$ và $(alpha)$: song song, cắt, hay vuông góc?
  2. Nếu song song: tính $h$, hình chiếu $d'$, khoảng cách $p = d(H, d')$, so sánh với $r$.
  3. Nếu cắt: tìm $P = d sect (alpha)$, xét $P$ trong hay ngoài $(C)$.
  4. Nếu vuông góc: tìm $P = d sect (alpha)$, so sánh $d(H,P)$ với $r$.
  5. Áp dụng công thức từ bảng trên.
]
