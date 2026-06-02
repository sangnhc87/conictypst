#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(paper: "a4", margin: (x: 1.5cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 10.8pt, lang: "vi")
#set par(justify: true, leading: 0.9em)

// ══ HEADING ══════════════════════════════════════════════════
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("003D33"), rgb("00695C"), rgb("00897B"), angle: 120deg),
  inset: (x: 18pt, y: 12pt), radius: 8pt, above: 2em, below: 1.2em,
  text(fill: white, size: 13.5pt, weight: "bold", it.body)
)
#show heading.where(level: 2): it => block(
  above: 1.5em, below: 0.8em,
  stroke: (left: 5pt + rgb("00897B")),
  inset: (left: 12pt, y: 5pt),
  text(fill: rgb("004D40"), size: 11.5pt, weight: "bold", it.body)
)

// ══ MACRO KHUNG ════════════════════════════════════════════
#let klt(title: "Lý thuyết", body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 5pt + rgb("00695C"), rest: 1pt + rgb("80CBC4")),
  radius: (right: 7pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[
  #text(fill: rgb("004D40"), weight: "bold", size: 11.5pt)[#title]
  #v(0.4em)
  #body
]

#let kbt(num, title, body) = {
  v(0.5em)
  block(
    fill: rgb("FFF8E1"),
    stroke: (left: 5pt + rgb("E65100"), rest: 1pt + rgb("FFB74D")),
    radius: (right: 7pt), inset: (x: 15pt, y: 13pt), width: 100%,
  )[
    #text(fill: rgb("BF360C"), weight: "bold")[Bài #num. #title]
    #v(0.4em)
    #body
  ]
}

#let kq(body) = block(
  fill: gradient.linear(rgb("E8EAF6"), rgb("F3E5F5"), angle: 90deg),
  stroke: 1.2pt + rgb("5C6BC0"), radius: 5pt,
  inset: (x: 12pt, y: 9pt), width: 100%,
)[#text(fill: rgb("1A237E"), weight: "bold")[Kết quả: ]#body]

#let kip(body) = block(
  fill: rgb("F1F8E9"), stroke: (left: 4pt + rgb("558B2F")),
  inset: (x: 12pt, y: 8pt), width: 100%,
)[#text(fill: rgb("33691E"), weight: "bold")[Nhận xét: ]#body]

#let bay(body) = block(
  fill: rgb("FBE9E7"), stroke: (left: 4pt + rgb("C62828")),
  inset: (x: 12pt, y: 8pt), width: 100%,
)[#text(fill: rgb("B71C1C"), weight: "bold")[Chú ý: ]#body]

// ══ TIÊU ĐỀ ═══════════════════════════════════════════════
#align(center, block(
  fill: gradient.linear(rgb("004D40"), rgb("00695C"), angle: 135deg),
  width: 100%, radius: 10pt, inset: (x: 24pt, y: 18pt),
)[
  #text(fill: white, size: 15pt, weight: "bold")[CHUYÊN ĐỀ: KHOẢNG CÁCH NHỎ NHẤT]
  #linebreak()
  #text(fill: rgb("B2DFDB"), size: 11pt)[Phương pháp Cặp Tiếp Tuyến Song Song & Mô hình hoá toán học]
])
#v(0.5em)

= I. Lý Thuyết Nền Tảng

== 1. Khoảng cách từ đường cong đến đường thẳng

#klt(title: "Định lý và Thuật toán")[
  Cho đường cong $(C): y = f(x)$ và đường thẳng $d: y = a x + b$ không cắt $(C)$.

  Điểm $M_0(x_0,\, f(x_0)) in (C)$ *gần $d$ nhất* khi và chỉ khi *tiếp tuyến của $(C)$ tại $M_0$ song song với $d$*, tức là:
  $ f'(x_0) = a $

  Khoảng cách ngắn nhất:
  $ d_min = frac(lr(|a x_0 - f(x_0) + b|), sqrt(a^2 + 1)) $

  #v(0.3em)
  *Lý do hình học:* Nếu tiếp tuyến tại $M$ nghiêng hơn $d$ thì pháp tuyến chưa thẳng đứng với $d$ — ta còn dịch được điểm lại gần hơn. Chỉ khi tiếp tuyến song song với $d$ thì pháp tuyến mới vuông góc với $d$, cho đoạn vuông góc ngắn nhất.
]

#v(0.3em)

== 2. Khoảng cách giữa hai đường cong

#klt(title: "Trường hợp hai đường cong rời nhau")[
  *Trường hợp chung:* Hai đường cong $(C_1): y = f(x)$ và $(C_2): y = g(x)$.

  Cặp điểm $A(x_A, f(x_A))$ và $B(x_B, g(x_B))$ có $|A B|$ nhỏ nhất khi:
  $ f'(x_A) = g'(x_B) quad "và" quad vec(A B) perp "tiếp tuyến chung" $

  *Trường hợp đặc biệt — Hàm ngược (đối xứng qua $y = x$):*

  Nếu $g(x) = f^(-1)(x)$, thì $(C_1)$ và $(C_2)$ đối xứng qua $y = x$. Khi đó:
  $ d_min = 2 dot frac(lr(|f(x_0) - x_0|), sqrt(2)) quad "với" quad f'(x_0) = 1 $
]

#v(0.3em)

== 3. Quy trình giải chuẩn

#block(fill: rgb("FAFAFA"), stroke: 0.8pt + rgb("BDBDBD"), radius: 6pt, inset: (x: 14pt, y: 12pt), width: 100%)[
  #grid(columns: (2.5cm, 1fr), gutter: 8pt,
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 1]]),
    [Nhận dạng: đường cong với đường thẳng, hay hai đường cong? Có đối xứng không?],
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 2]]),
    [Tính đạo hàm. Giải phương trình $f'(x_0) = a$. Lưu ý *điều kiện xác định* và *số nghiệm*.],
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 3]]),
    [Tính tọa độ điểm gần nhất $M_0(x_0, f(x_0))$.],
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 4]]),
    [Áp dụng công thức khoảng cách từ điểm đến đường thẳng. Nếu nhiều nghiệm, so sánh lấy $min$.],
  )
]

= II. Bài Tập Vận Dụng

== A. Đường cong và Đường thẳng

#kbt("1", "Parabol — Đường thẳng song song")[
  Tìm khoảng cách ngắn nhất từ đường cong $(C): y = x^2$ đến đường thẳng $d: y = 2x - 3$.

  #grid(columns: (1fr, auto), gutter: 14pt,
  [
    *Giải:*

    Hệ số góc $d$: $a = 2$. Tính đạo hàm: $y' = 2x$.

    Ép song song: $2x_0 = 2 => x_0 = 1$, suy ra $y_0 = 1$.

    Điểm gần nhất: $M_0(1, 1)$.

    Khoảng cách từ $M_0(1,1)$ đến $2x - y - 3 = 0$:
    $ d_min = frac(|2(1) - 1 - 3|, sqrt(4+1)) = frac(2, sqrt(5)) = frac(2sqrt(5), 5) $
  ],
  cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    // Lưới nhẹ
    set-style(stroke: 0.4pt + rgb("E0E0E0"))
    for i in range(-1, 5) { line((i, -2), (i, 5)) }
    for j in range(-2, 6) { line((-1, j), (4, j)) }
    // Trục
    set-style(stroke: 0.9pt + black)
    line((-0.8,0),(4.2,0), mark: (end: ">", size: 0.25))
    line((0,-1.8),(0,5.2), mark: (end: ">", size: 0.25))
    content((4.3, -0.15), text(size: 8pt)[$x$])
    content((-0.25, 5.2), text(size: 8pt)[$y$])
    // Đánh số
    for i in (1,2,3,4) {
      content((i, -0.25), text(size: 7pt)[#i])
    }
    for j in (1,2,3,4) {
      content((-0.25, j), text(size: 7pt)[#j])
    }
    content((-0.3, -1), text(size: 7pt)[-1])
    // Parabol y=x^2: x từ -0.5 đến 2.3
    bezier((-0.7, 0.49), (2.3, 5.29), (0, 0), (1.8, 3.24), stroke: (paint: rgb("1565C0"), thickness: 1.6pt))
    content((2.4, 5.0), text(size: 8pt, fill: rgb("1565C0"))[$(C)$])
    // Đường thẳng d: y=2x-3, qua (1.5,0) và (4,5)
    line((1.5, 0), (4.0, 5.0), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    content((4.1, 5.0), text(size: 8pt, fill: rgb("D84315"))[$d$])
    // Tiếp tuyến tại M0(1,1): y=2x-1, qua (0,-1),(3,5)
    line((0.0, -1.0), (3.0, 5.0), stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed"))
    content((-0.1, -1.3), text(size: 7.5pt, fill: rgb("43A047"))[$t_(M_0)$])
    // Điểm M0(1,1)
    circle((1, 1), radius: 0.1, fill: rgb("1565C0"), stroke: none)
    content((0.6, 0.85), text(size: 8pt)[$M_0$])
    // Đoạn vuông góc từ M0 đến d (pháp tuyến vuông góc với d)
    // Chiều phương d: (1,2)/sqrt5. Pháp: (2,-1)/sqrt5
    // Chân: (1+2t, 1-t) thuộc 2(1+2t)-(1-t)-3=0 => 2+4t-1+t-3=0 => 5t=2 => t=2/5
    // Chân = (1.8, 0.6)
    line((1, 1), (1.8, 0.6), stroke: (paint: rgb("F57F17"), thickness: 1.5pt), mark: (start: "o", end: ">"))
    content((1.7, 1.1), text(size: 7.5pt, fill: rgb("F57F17"))[$d_min$])
    circle((1.8, 0.6), radius: 0.07, fill: rgb("F57F17"), stroke: none)
  })
  )

  #kq[$ d_min = frac(2sqrt(5), 5) approx 0.894 $]
]

#kbt("2", "Hàm Phân Thức — Đường thẳng không song song với tiệm cận")[
  Tìm khoảng cách ngắn nhất từ đường cong $(C): y = frac(x, x-1)$ với $x > 1$ đến đường thẳng $d: 4x - 3y + 1 = 0$.

  #grid(columns: (1fr, auto), gutter: 14pt,
  [
    *Giải:*

    Viết lại $d: y = frac(4x+1, 3)$. Hệ số góc $a = frac(4, 3)$.

    Đạo hàm: $y' = frac{-1}{(x-1)^2}$.

    Ép song song: $frac(-1, (x-1)^2) = frac(4, 3) => (x-1)^2 = -frac(3,4) < 0$.

    *Phương trình vô nghiệm* — không tồn tại tiếp tuyến song song với $d$!

    Điều này có nghĩa: $y' = frac(-1,(x-1)^2) in (-oo, 0)$ với mọi $x > 1$, trong khi $a = 4/3 > 0$. Hai đường *không bao giờ có tiếp tuyến song song*.

    Trường hợp này: khoảng cách ngắn nhất đạt khi $x -> +oo$ (đường cong tiến về tiệm cận ngang $y=1$). Khoảng cách từ điểm $(x,1)$ trên tiệm cận đến $d$: $frac(|4x - 3 + 1|, 5) -> +oo$.

    Thực ra khoảng cách từ *tiệm cận ngang* $y = 1$ đến $d$: Tìm giao của $y=1$ với $d$ được $x = -1/2$ (ngoài miền). Khoảng cách giữa 2 đường thẳng song song nếu chúng song song — nhưng $y=1$ không song song với $d$.
  ],
  cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    set-style(stroke: 0.4pt + rgb("E0E0E0"))
    for i in range(0, 6) { line((i, -1), (i, 5)) }
    for j in range(-1, 6) { line((0, j), (5.5, j)) }
    set-style(stroke: 0.9pt + black)
    line((-0.3,0),(5.5,0), mark: (end: ">", size: 0.25))
    line((0,-0.8),(0,5.2), mark: (end: ">", size: 0.25))
    content((5.5, -0.2), text(size: 8pt)[$x$])
    content((-0.3, 5.2), text(size: 8pt)[$y$])
    // Tiệm cận đứng x=1
    line((1,-0.8),(1,5.2), stroke: (paint: rgb("9E9E9E"), thickness: 0.8pt, dash: "dashed"))
    content((1.15, 5.0), text(size: 7pt, fill: rgb("757575"))[$x=1$])
    // Tiệm cận ngang y=1
    line((0,1),(5.5,1), stroke: (paint: rgb("9E9E9E"), thickness: 0.8pt, dash: "dashed"))
    content((5.2, 1.15), text(size: 7pt, fill: rgb("757575"))[$y=1$])
    // y = x/(x-1): tại x=1.5->3, x=2->2, x=3->1.5, x=5->1.25
    bezier((1.2, 6.0), (4.5, 1.29), (1.5, 3.0), (3.0, 1.5), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    content((4.6, 1.5), text(size: 8pt, fill: rgb("1565C0"))[$(C)$])
    // d: 4x-3y+1=0 => y=(4x+1)/3: x=0->1/3, x=2->3, x=3->4.33
    line((0.0, 0.33), (3.2, 4.6), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    content((3.3, 4.7), text(size: 8pt, fill: rgb("D84315"))[$d$])
  })
  )

  #bay[Đây là dạng bẫy kinh điển: không phải bài toán nào cũng có tiếp tuyến song song. Khi $y'$ chỉ nhận giá trị âm mà $a > 0$ (hay ngược lại), kết luận "khoảng cách ngắn nhất không đạt được" hoặc "đường cong và đường thẳng giao nhau" — phải kiểm tra miền xác định trước.]
]

#kbt("3", "Hàm Bậc 3 — Hai Tiếp Điểm")[
  Tìm khoảng cách ngắn nhất từ đường cong $(C): y = x^3 - 3x$ đến đường thẳng $d: y = 9x - 2$.

  #grid(columns: (1fr, auto), gutter: 14pt,
  [
    *Giải:*

    Hệ số góc $a = 9$. Đạo hàm: $y' = 3x^2 - 3$.

    Ép song song: $3x^2 - 3 = 9 => x^2 = 4 => x = plus.minus 2$.

    *Hai nghiệm ứng viên:*

    - $x_1 = 2$: $y_1 = 8 - 6 = 2$, điểm $A(2, 2)$.

      Tiếp tuyến qua $A$: $y = 9(x-2)+2 = 9x - 16$, hay $9x - y - 16 = 0$.

      $d_A = frac(|9(2) - 2 - 16 - (-2)|, sqrt(81+1)) = frac(|2|, sqrt(82)) = frac(2, sqrt(82))$

    - $x_2 = -2$: $y_2 = -8 + 6 = -2$, điểm $B(-2, -2)$.

      Tiếp tuyến qua $B$: $9x - y + 16 = 0$.

      $d_B = frac(|9(-2) - (-2) + 16 - (-2)|, sqrt(82)) = frac(|2|, sqrt(82)) = frac(2, sqrt(82))$

    Hai điểm đối xứng cho cùng khoảng cách — đây là tính đối xứng lẻ của hàm bậc 3.
  ],
  cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    set-style(stroke: 0.35pt + rgb("E0E0E0"))
    for i in range(-3, 5) { line((i+3, -3), (i+3, 6)) }
    for j in range(-3, 7) { line((0, j), (7.5, j)) }
    set-style(stroke: 0.9pt + black)
    line((0,0),(7.8,0), mark: (end: ">", size: 0.25))
    line((3,-3),(3,6.2), mark: (end: ">", size: 0.25))
    content((7.8, -0.25), text(size: 8pt)[$x$])
    content((2.7, 6.2), text(size: 8pt)[$y$])
    // Gốc tại (3,0), scale x+3, y
    // y = x^3 - 3x: x=-2->-2, x=-1->2, x=0->0, x=1->-2, x=2->2
    // mapped: (1,-2),(2,2),(3,0),(4,-2),(5,2)
    bezier((0.5,-1.6),(5.5,2.0),(1.0,-2.0),(3.0,0.0), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    bezier((3.0,0.0),(6.5,5.0),(4.5,-2.0),(5.5,2.0), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    content((6.6, 5.0), text(size: 8pt, fill: rgb("1565C0"))[$(C)$])
    // d: y=9x-2 => mapped y=9(x-3)-2=9x-29: x=3->-2, x=4->7
    line((3.0,-2.0),(3.95,6.5), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    content((4.1, 6.3), text(size: 8pt, fill: rgb("D84315"))[$d$])
    // Tiếp tuyến A(2,2): mapped (5,2), slope 9: y-2=9(x-5)=>y=9x-43: x=5->2,x=4->-7(off)
    line((4.7,-1.7),(5.3,5.0), stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed"))
    // Tiếp tuyến B(-2,-2): mapped (1,-2), slope 9: y+2=9(x-1)=>y=9x-11: x=1->-2,x=2->7(off)
    line((0.8,-2.0),(1.5,4.5), stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed"))
    // Điểm A(5,2) và B(1,-2)
    circle((5, 2), radius: 0.12, fill: rgb("1565C0"), stroke: none)
    content((5.3, 1.6), text(size: 7.5pt)[$A$])
    circle((1, -2), radius: 0.12, fill: rgb("9C27B0"), stroke: none)
    content((0.6, -2.0), text(size: 7.5pt)[$B$])
  })
  )

  #kq[$ d_min = frac(2, sqrt(82)) = frac(sqrt(82), 41) approx 0.221 $]

  #kip[Hàm bậc 3 lẻ $f(-x) = -f(x)$: hai điểm đối xứng qua gốc O cho cùng khoảng cách. Đây là tính chất cần nhớ khi gặp bài bậc 3 dạng $x^3 + p x$.]
]

== B. Hai Đường Cong Rời Nhau

#kbt("4", "Hai Parabol Đối Đầu")[
  Cho $(C_1): y = x^2 + 1$ và $(C_2): y = -x^2 + 4x - 5$. Chứng minh hai đường cong rời nhau và tìm khoảng cách ngắn nhất giữa chúng.

  #grid(columns: (1fr, auto), gutter: 14pt,
  [
    *Bước 1 — Chứng minh rời nhau:*

    Xét $x^2 + 1 = -x^2 + 4x - 5 => 2x^2 - 4x + 6 = 0 => x^2 - 2x + 3 = 0$.

    Discriminant $Delta = 4 - 12 = -8 < 0$ — không có nghiệm thực.

    Hơn nữa $y_{C_1} - y_{C_2} = 2x^2 - 4x + 6 = 2(x-1)^2 + 4 > 0$ với mọi $x$, nên $(C_1)$ nằm *hoàn toàn trên* $(C_2)$.

    *Bước 2 — Ép tiếp tuyến song song:*

    $f'(x_A) = 2x_A$ và $g'(x_B) = -2x_B + 4$.

    Ép bằng nhau: $2x_A = -2x_B + 4 => x_A + x_B = 2$ ... (ast)

    *Bước 3 — Điều kiện pháp tuyến chung:*

    Véc-tơ $vec(A B) = (x_B - x_A,\, g(x_B) - f(x_A))$ vuông góc với tiếp tuyến $(1, 2x_A)$:

    $(x_B - x_A) + 2x_A(g(x_B) - f(x_A)) = 0$

    Đặt $x_A = t => x_B = 2 - t$ (theo (ast)). Tính:

    $g(x_B) - f(x_A) = [-(2-t)^2 + 4(2-t) - 5] - [t^2+1] = -2t^2 + 4t - 2 = -2(t-1)^2$

    $(2-t-t) + 2t(-2(t-1)^2) = 0 => (2-2t) - 4t(t-1)^2 = 0$

    $2(1-t)[1 + 2t(t-1)] = 0 => 2(1-t)(2t^2 - 2t + 1) = 0$

    Vì $2t^2 - 2t + 1 = 2(t - 1/2)^2 + 1/2 > 0$, ta được $t = 1$.

    Vậy $x_A = 1, x_B = 1$. Điểm gần nhất: $A(1, 2)$ và $B(1, -2)$.

    Khoảng cách: $|A B| = |2 - (-2)| = 4$.
  ],
  cetz.canvas(length: 0.75cm, {
    import cetz.draw: *
    set-style(stroke: 0.35pt + rgb("E0E0E0"))
    for i in range(-1, 5) { line((i+1, -2), (i+1, 6)) }
    for j in range(-2, 7) { line((0, j+2), (6, j+2)) }
    set-style(stroke: 0.9pt + black)
    // Gốc thực tại (1, 2) trên canvas (x+1, y+2)
    line((0,2),(6,2), mark: (end: ">", size: 0.25))
    line((1,-0.5),(1,8.5), mark: (end: ">", size: 0.25))
    content((6.1, 1.8), text(size: 8pt)[$x$])
    content((0.75, 8.5), text(size: 8pt)[$y$])
    // C1: y=x^2+1: x=-1->2,x=0->1,x=1->2,x=2->5,x=3->10(off)
    // mapped (0,3),(1,2+1=3? no): 
    // canvas x = x_real+1, canvas y = y_real+2
    // C1: x_r=-1->canvas(0,4), x_r=0->canvas(1,3), x_r=1->canvas(2,4), x_r=2->canvas(3,7)
    bezier((0,4),(3.5,8),(1,3),(2,4), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    content((3.6, 8.0), text(size: 8pt, fill: rgb("1565C0"))[$(C_1)$])
    // C2: y=-x^2+4x-5=-(x-2)^2-1: max at x=2,y=-1
    // x_r=0->-5, x_r=1->-2, x_r=2->-1, x_r=3->-2, x_r=4->-5
    // canvas: x_r=0->canvas(1,-3),x_r=1->canvas(2,0),x_r=2->canvas(3,1),x_r=3->canvas(4,0),x_r=4->canvas(5,-3)
    bezier((1,-3),(5,-3),(2,0),(4,0), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    // Also include the top of C2
    bezier((2,0),(3,1),(2.5,0.5),(2.8,0.9), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    bezier((3,1),(4,0),(3.2,0.9),(3.5,0.5), stroke: (paint: rgb("D84315"), thickness: 1.5pt))
    content((5.1, -3), text(size: 8pt, fill: rgb("D84315"))[$(C_2)$])
    // A(1,2) -> canvas (2,4), B(1,-2) -> canvas (2,0)
    circle((2,4), radius: 0.12, fill: rgb("1565C0"), stroke: none)
    content((2.3, 4.1), text(size: 8pt)[$A$])
    circle((2,0), radius: 0.12, fill: rgb("D84315"), stroke: none)
    content((2.3, -0.1), text(size: 8pt)[$B$])
    // Đoạn AB
    line((2,0),(2,4), stroke: (paint: rgb("F57F17"), thickness: 1.5pt), mark: (start: ">", end: ">"))
    content((2.4, 2.0), text(size: 8pt, fill: rgb("F57F17"))[$d_min = 4$])
    // Tiếp tuyến tại A và B (đều nằm ngang, hệ số góc 0 tại x=1? Không!)
    // f'(1)=2, g'(1)=2. Đường xiên qua A và B
    line((0.5,1),(3.5,7), stroke: (paint: rgb("43A047"), thickness: 0.9pt, dash: "dashed"))
    line((0.5,-3),(3.5,3), stroke: (paint: rgb("43A047"), thickness: 0.9pt, dash: "dashed"))
  })
  )

  #kq[Khoảng cách ngắn nhất giữa $(C_1)$ và $(C_2)$ là $d_min = 4$, đạt tại $A(1,2)$ và $B(1,-2)$.]

  #kip[Bài toán hai parabol đối đầu (mở lên và mở xuống): pháp tuyến chung thường thẳng đứng ($x_A = x_B$). Nhận ra điều này giúp giải ngay mà không cần lập hệ.]
]

#kbt("5", "Hàm Mũ và Logarit — Kỹ thuật Đối Xứng")[
  Tìm khoảng cách ngắn nhất giữa hai đường cong $(C_1): y = e^x$ và $(C_2): y = ln x$.

  *Giải:*

  $y = ln x$ là hàm ngược của $y = e^x$. Hai đồ thị đối xứng nhau qua đường thẳng $Delta: y = x$.

  *Bước 1:* Tìm điểm $M_0$ trên $(C_1)$ gần $Delta: y = x$ nhất.

  Ép tiếp tuyến song song $Delta$ (hệ số góc $1$): $y' = e^{x_0} = 1 => x_0 = 0$.

  Điểm $M_0(0, 1)$ trên $(C_1)$.

  *Bước 2:* Khoảng cách từ $M_0(0,1)$ đến $Delta: x - y = 0$:
  $ d_0 = frac(|0 - 1|, sqrt(2)) = frac(1, sqrt(2)) $

  *Bước 3:* Điểm đối xứng của $M_0(0,1)$ qua $y=x$ là $N_0(1,0)$, nằm trên $(C_2)$.

  Khoảng cách giữa hai đường cong:
  $ d_min = |M_0 N_0| = 2 d_0 = frac(2, sqrt(2)) = sqrt(2) $

  #grid(columns: (1fr, auto), gutter: 14pt,
  [],
  cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    set-style(stroke: 0.35pt + rgb("EEEEEE"))
    for i in range(-1, 4) { line((i+1, -1), (i+1, 5)) }
    for j in range(-1, 5) { line((0, j+1), (5, j+1)) }
    set-style(stroke: 0.9pt + black)
    line((0,1),(5,1), mark: (end: ">", size: 0.25))
    line((1,-0.5),(1,5.2), mark: (end: ">", size: 0.25))
    content((5.1,0.8), text(size: 8pt)[$x$])
    content((0.75,5.2), text(size: 8pt)[$y$])
    // canvas: x_c = x+1, y_c = y+1 (gốc O thật tại canvas (1,1))
    // Delta y=x: qua (0,0)->canvas(1,1), (3,3)->canvas(4,4)
    line((1,1),(4.5,4.5), stroke: (paint: rgb("9E9E9E"), thickness: 0.9pt, dash: "dashed"))
    content((4.6,4.4), text(size: 7.5pt, fill: rgb("757575"))[$y=x$])
    // C1: y=e^x: x=-1->0.37,x=0->1,x=1->2.72,x=1.5->4.48
    // canvas: (-1->0, 0.37->1.37), (0->1,1->2),(1->2,2.72->3.72),(1.5->2.5,4.48->5.48)
    bezier((0,1.37),(2.5,5.48),(1,2),(2,3.72), stroke: (paint: rgb("E53935"), thickness: 1.5pt))
    content((2.7, 5.3), text(size: 8pt, fill: rgb("E53935"))[$(C_1)$])
    // C2: y=ln(x): x=0.37->-1,x=1->0,x=2.72->1,x=4.48->1.5
    // canvas: (0.37->1.37,-1->0),(1->2,0->1),(2.72->3.72,1->2),(4.48->5.48,1.5->2.5)
    bezier((1.37,0),(5.48,2.5),(2,1),(3.72,2), stroke: (paint: rgb("1565C0"), thickness: 1.5pt))
    content((5.3,2.5), text(size: 8pt, fill: rgb("1565C0"))[$(C_2)$])
    // M0(0,1) -> canvas(1,2), N0(1,0) -> canvas(2,1)
    circle((1,2), radius: 0.11, fill: rgb("E53935"), stroke: none)
    content((0.6,2.1), text(size: 8pt)[$M_0$])
    circle((2,1), radius: 0.11, fill: rgb("1565C0"), stroke: none)
    content((2.2,0.7), text(size: 8pt)[$N_0$])
    // Đoạn M0N0
    line((1,2),(2,1), stroke: (paint: rgb("F57F17"), thickness: 1.5pt), mark: (start: ">", end: ">"))
    content((1.9,1.8), text(size: 8pt, fill: rgb("F57F17"))[$sqrt(2)$])
    // Tiếp tuyến tại M0: slope 1, qua (0,1)->canvas(1,2): y_c=x_c+1
    line((0,1),(3,4), stroke: (paint: rgb("43A047"), thickness: 0.9pt, dash: "dashed"))
  })
  )

  #kq[$ d_min = sqrt(2) approx 1.414 $]
]

= III. Bài Tập Tự Luyện

#block(fill: rgb("F9FBE7"), stroke: 1pt + rgb("C5E1A5"), radius: 6pt, inset: (x: 16pt, y: 14pt), width: 100%)[

  *Bài 6.* Tìm điểm trên đường cong $y = x^2 - 2x + 2$ gần đường thẳng $y = 2x + 5$ nhất.
  #text(style: "italic", size: 9.5pt)[_(Đáp: điểm $(2, 2)$; $d_min = 9/sqrt(5) = frac(9sqrt(5), 5)$)_ ]

  #v(0.4em)

  *Bài 7.* Cho $(C): y = sqrt(x)$ và $d: x - 2y + 6 = 0$. Tính khoảng cách ngắn nhất từ $(C)$ đến $d$.
  #text(style: "italic", size: 9.5pt)[_(Đáp: $M_0(1, 1)$; $d_min = frac(5, sqrt(5)) = sqrt(5)$)_ ]

  #v(0.4em)

  *Bài 8.* Tìm khoảng cách ngắn nhất giữa $(C_1): y = x^2 + 3$ và $(C_2): y = -x^2 + 1$.
  #text(style: "italic", size: 9.5pt)[_(Đáp: $d_min = 2$; tại $A(0,3)$ và $B(0,1)$)_ ]

  #v(0.4em)

  *Bài 9.* (Nâng cao) Tìm khoảng cách ngắn nhất giữa $y = e^(2x)$ và $y = frac(1,2) ln x$.
  #text(style: "italic", size: 9.5pt)[_(Gợi ý: Hai hàm ngược nhau, ép $2e^(2x_0) = 1$; Đáp: $d_min = frac(3sqrt(2), 4)$)_ ]

  #v(0.4em)

  *Bài 10.* (Đề thi minh họa 2024) Trong mặt phẳng $O x y$, cho đường cong $(C): y = x^3 - x$ và đường thẳng $d: y = 2x + 5$. Khoảng cách ngắn nhất từ $(C)$ đến $d$ bằng:

  #grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 6pt,
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[A. $frac(4sqrt(5), 5)$],
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[B. $frac(3sqrt(5), 5)$],
    block(stroke: 0.8pt + rgb("43A047"), fill: rgb("E8F5E9"), inset: 6pt, radius: 4pt)[*C. $frac(2sqrt(5), 5)$*],
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[D. $frac(sqrt(5), 5)$],
  )
]
