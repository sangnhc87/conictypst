#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2": canvas
#import "@preview/cetz-plot:0.1.4": plot

#set page(paper: "a4", margin: (x: 1.5cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 10.8pt, lang: "vi")
#set par(justify: true, leading: 0.88em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("003D33"), rgb("00695C"), rgb("00897B"), angle: 120deg),
  inset: (x: 18pt, y: 12pt), radius: 8pt, above: 2em, below: 1.2em,
  text(fill: white, size: 13.5pt, weight: "bold", it.body)
)
#show heading.where(level: 2): it => block(
  above: 1.4em, below: 0.7em,
  stroke: (left: 5pt + rgb("00897B")),
  inset: (left: 12pt, y: 5pt),
  text(fill: rgb("004D40"), size: 11.5pt, weight: "bold", it.body)
)

#let klt(title: "Lý thuyết", body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 5pt + rgb("00695C"), rest: 1pt + rgb("80CBC4")),
  radius: (right: 7pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[
  #text(fill: rgb("004D40"), weight: "bold", size: 11.5pt)[#title]
  #v(0.4em)
  #body
]

#let bai(num, tieude, body) = {
  v(0.7em)
  block(
    fill: rgb("FFF8E1"),
    stroke: (left: 5pt + rgb("E65100"), rest: 1pt + rgb("FFB74D")),
    radius: (right: 7pt), inset: (x: 15pt, y: 13pt), width: 100%,
  )[
    #text(fill: rgb("BF360C"), weight: "bold")[Bài #num — #tieude]
    #v(0.4em)
    #body
  ]
}

#let kq(body) = block(
  fill: gradient.linear(rgb("E8EAF6"), rgb("EDE7F6"), angle: 90deg),
  stroke: 1.2pt + rgb("5C6BC0"), radius: 5pt,
  inset: (x: 12pt, y: 9pt), width: 100%,
)[#text(fill: rgb("1A237E"), weight: "bold")[Kết quả: ]#body]

#let nhanxet(body) = block(
  fill: rgb("F1F8E9"), stroke: (left: 4pt + rgb("558B2F")),
  inset: (x: 12pt, y: 8pt), width: 100%,
)[#text(fill: rgb("33691E"), weight: "bold")[Lưu ý: ]#body]

// ─── TIÊU ĐỀ ────────────────────────────────────────────
#align(center, block(
  fill: gradient.linear(rgb("004D40"), rgb("00695C"), angle: 135deg),
  width: 100%, radius: 10pt, inset: (x: 24pt, y: 18pt),
)[
  #text(fill: white, size: 15.5pt, weight: "bold")[
    KHOẢNG CÁCH NHỎ NHẤT GIỮA HAI ĐỐI TƯỢNG
  ]
  #linebreak()
  #text(fill: rgb("B2DFDB"), size: 11pt)[
    Phương pháp Tiếp Tuyến Song Song · Mô hình hoá toán học thực tế
  ]
])
#v(0.6em)

= I. Lý Thuyết

#klt(title: "Nguyên lý cốt lõi")[
  Cho hai đối tượng hình học *không giao nhau*. Cặp điểm $(M, N)$ có khoảng cách $|M N|$ nhỏ nhất khi đoạn $M N$ là *pháp tuyến chung* — vuông góc với cả hai đường tại hai điểm đó.

  #v(0.5em)
  *Trường hợp 1 — Đường cong $(C)$ và đường thẳng $d: a x - y + b = 0$*

  Điểm $M_0(x_0, f(x_0)) in (C)$ cho $d_{min}$ khi *tiếp tuyến tại $M_0$ song song $d$*:
  $ f'(x_0) = a, quad d_min = frac(|a x_0 - f(x_0) + b|, sqrt(a^2 + 1)) $

  *Trường hợp 2 — Hai đường cong $(C_1)$ và $(C_2)$*

  Cặp điểm $A in (C_1)$, $B in (C_2)$ cho $|A B|_min$ khi *hai tiếp tuyến song song nhau* và $A B$ vuông góc với cả hai.

  *Trường hợp đặc biệt — Hàm ngược (đối xứng qua $y = x$):*
  Nếu $(C_2)$ là đồ thị hàm ngược của $(C_1)$, thì $d_min = 2 dot frac(|f(x_0) - x_0|, sqrt(2))$ với $f'(x_0) = 1$.
]

= II. Bài Toán Mô Hình Hoá Thực Tế

== Dạng 1: Đường cong và Đường thẳng

#bai("1", [Quy hoạch đường sắt và quốc lộ])[
  Mặt cắt ngang địa hình cho thấy tuyến quốc lộ chạy thẳng theo $d: y = x - 5$ (km), còn tuyến đường sắt leo núi uốn theo $(C): y = x^2 - 3x + 3$. Hai tuyến không giao nhau. Tìm vị trí và chiều dài ngắn nhất của đoạn cầu vượt nối hai tuyến.

  #grid(columns: (1fr, 175pt), gutter: 16pt,
  [
    *Kiểm tra không cắt nhau:*
    $x^2-3x+3 = x-5 => x^2-4x+8=0$, $Delta = -16 < 0$ ✓

    *Giải:* Hệ số góc $d$: $a = 1$. Đạo hàm: $f'(x) = 2x - 3$.

    Ép song song: $2x_0 - 3 = 1 => x_0 = 2$.

    Tọa độ: $y_0 = 4 - 6 + 3 = 1$. Điểm $M_0(2, 1)$.

    Khoảng cách từ $M_0(2,1)$ đến $x - y - 5 = 0$:
    $ d_min = frac(|2 - 1 - 5|, sqrt(2)) = frac(4, sqrt(2)) = 2sqrt(2) $
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -0.5, x-max: 4.5,
        y-min: -3, y-max: 5,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          plot.add(domain: (-0.2, 4.2), x => x*x - 3*x + 3,
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C)$])
          plot.add(domain: (0.5, 4.5), x => x - 5,
            style: (stroke: (paint: rgb("D84315"), thickness: 1.5pt)),
            label: [$d$])
          // Tiep tuyen tai M0(2,1): y = x - 1
          plot.add(domain: (0.5, 4.0), x => x - 1,
            style: (stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed")),
            label: [$t_(M_0)$])
          // Doan vuong goc M0 den chan tren d
          // Pháp tuyến qua M0(2,1): y-1=-(x-2) -> y=-x+3. Giao d: -x+3=x-5->x=4,y=-1
          plot.add(((2,1),(4,-1)),
            style: (stroke: (paint: rgb("F57F17"), thickness: 1.4pt)))
          plot.add(((2,1),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$M_0$])
          plot.add(((4,-1),), style: (stroke: none), mark: "x",
            mark-style: (fill: rgb("F57F17"), stroke: (paint: rgb("F57F17"), thickness: 1pt)),
            mark-size: 0.18)
        }
      )
    })
  ])

  #kq[Cầu vượt tối ưu dài $d_min = 2sqrt(2) approx 2.83$ km, đặt tại điểm $M_0(2, 1)$ trên đường sắt.]
]

#bai("2", [Dây cáp điện và địa hình dốc])[
  Thi công đường dây điện qua vùng đồi: dây cáp được treo dọc theo đường cong $(C): y = x^2 + 5$ (m, gốc tọa độ tại điểm thấp nhất thung lũng). Mặt đất dốc chạy theo $d: y = 2x - 1$. Tìm điểm trên dây cáp gần mặt đất nhất và khoảng hở an toàn tối thiểu.

  #grid(columns: (1fr, 175pt), gutter: 16pt,
  [
    *Kiểm tra không cắt:*
    $x^2+5 = 2x-1 => x^2-2x+6=0$, $Delta = 4-24 = -20 < 0$ ✓

    $(C)$ nằm hoàn toàn trên $d$.

    *Giải:* Hệ số góc $a = 2$. Đạo hàm: $f'(x) = 2x$.

    Ép song song: $2x_0 = 2 => x_0 = 1$. Tọa độ: $y_0 = 1+5 = 6$.

    Khoảng cách từ $M_0(1,6)$ đến $2x - y - 1 = 0$:
    $ d_min = frac(|2(1) - 6 - 1|, sqrt(5)) = frac(5, sqrt(5)) = sqrt(5) $
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -2, x-max: 4,
        y-min: -3, y-max: 10,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          plot.add(domain: (-2.0, 3.0), x => x*x + 5,
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [dây cáp $(C)$])
          plot.add(domain: (-1.0, 4.0), x => 2*x - 1,
            style: (stroke: (paint: rgb("795548"), thickness: 1.5pt)),
            label: [mặt đất $d$])
          plot.add(domain: (-1.0, 3.0), x => 2*x + 4,
            style: (stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed")),
            label: [$t_(M_0)$])
          // Phap tuyen qua M0(1,6), slope=-1/2: giao d tai (3,5)
          plot.add(((1,6),(3,5)),
            style: (stroke: (paint: rgb("F57F17"), thickness: 1.4pt)))
          plot.add(((1,6),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$M_0$])
        }
      )
    })
  ])

  #kq[Khoảng hở an toàn tối thiểu $d_min = sqrt(5) approx 2.24$ m, tại $M_0(1, 6)$ trên dây cáp.]
]

#bai("3", [Đường bờ sông và tuyến đê (Hàm phân thức)])[
  Đường bờ sông uốn theo $(C): y = x + frac(1, x-1)$ với $x > 1$ (km). Tuyến đê thẳng được quy hoạch dọc theo $d: y = -3x + 10$. Xác định điểm trên bờ sông gần tuyến đê nhất và khoảng cách tối thiểu.

  #grid(columns: (1fr, 175pt), gutter: 16pt,
  [
    *Giải:*

    Hệ số góc $d$: $a = -3$. Đạo hàm: $f'(x) = 1 - frac(1, (x-1)^2)$.

    Ép song song: $1 - frac(1, (x-1)^2) = -3 => (x-1)^2 = frac{1}{4}$.

    Vì $x > 1$: $x_0 = frac{3}{2}$. Tọa độ: $y_0 = frac{3}{2} + 2 = frac{7}{2}$.

    Khoảng cách từ $M_0(3/2,\, 7/2)$ đến $3x + y - 10 = 0$:
    $ d_min = frac(|3 dot 3/2 + 7/2 - 10|, sqrt(10)) = frac(|8 - 10|, sqrt(10)) = frac{2}{sqrt(10)} = frac{sqrt(10)}{5} $
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: 1.05, x-max: 5.0,
        y-min: -2, y-max: 8,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          // Bo song: y = x + 1/(x-1)
          plot.add(domain: (1.12, 4.8), x => x + 1/(x - 1),
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [bờ sông $(C)$])
          // Tuyen de: y=-3x+10
          plot.add(domain: (1.1, 3.5), x => -3*x + 10,
            style: (stroke: (paint: rgb("795548"), thickness: 1.5pt)),
            label: [tuyến đê $d$])
          // Tiep tuyen tai M0(1.5, 3.5): slope=-3, y=-3x+8
          plot.add(domain: (1.1, 3.2), x => -3*x + 8,
            style: (stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed")),
            label: [$t_(M_0)$])
          // Phap tuyen qua M0(1.5,3.5): slope=1/3, y=(x-1.5)/3+3.5=-3 => y=x/3+3
          // Giao d: x/3+3=-3x+10 -> x/3+3x=7 -> 10x/3=7 -> x=2.1, y=3.7
          plot.add(((1.5,3.5),(2.1,3.7)),
            style: (stroke: (paint: rgb("F57F17"), thickness: 1.4pt)))
          plot.add(((1.5,3.5),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$M_0$])
        }
      )
    })
  ])

  #kq[$d_min = frac(sqrt(10), 5) approx 0.632$ km.]
]

#bai("4", [Hai tuyến ống ngầm — đường ống khí và cáp quang (Hàm bậc 4)])[
  Mặt cắt địa chất của khu vực: đường ống dẫn khí nằm trên theo $(C): y = x^4 + 3$ (m), tuyến cáp quang nằm dưới theo đường thẳng $d: y = 4x - 2$. Hai tuyến không giao nhau. Xác định điểm trên đường ống khí gần cáp quang nhất.

  #grid(columns: (1fr, 175pt), gutter: 16pt,
  [
    *Kiểm tra không cắt:*
    Xét $h(x) = x^4-4x+5$. $h'(x) = 4x^3-4 = 0 => x=1$.
    $h(1) = 1-4+5 = 2 > 0$, nên $h(x) > 0$ với mọi $x$ ✓

    *Giải:* Hệ số góc $a = 4$. Đạo hàm: $f'(x) = 4x^3$.

    Ép song song: $4x_0^3 = 4 => x_0 = 1$. Tọa độ: $y_0 = 1+3 = 4$.

    Khoảng cách từ $M_0(1,4)$ đến $4x - y - 2 = 0$:
    $ d_min = frac(|4(1) - 4 - 2|, sqrt(17)) = frac(2, sqrt(17)) = frac(2sqrt(17), 17) $
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -1.5, x-max: 2.0,
        y-min: -4, y-max: 8,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          plot.add(domain: (-1.4, 1.6), x => x*x*x*x + 3,
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [ống khí $(C)$])
          plot.add(domain: (-0.4, 2.0), x => 4*x - 2,
            style: (stroke: (paint: rgb("795548"), thickness: 1.5pt)),
            label: [cáp quang $d$])
          // Tiep tuyen tai M0(1,4): y=4x
          plot.add(domain: (-0.3, 1.6), x => 4*x,
            style: (stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed")),
            label: [$t_(M_0)$])
          // Phap tuyen qua M0(1,4), slope=-1/4: y=-x/4+4.25. Giao d: 4x-2=-x/4+4.25 => 17x/4=6.25 => x~1.47
          plot.add(((1.0,4.0),(1.47,3.88)),
            style: (stroke: (paint: rgb("F57F17"), thickness: 1.4pt)))
          plot.add(((1.0,4.0),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$M_0$])
        }
      )
    })
  ])

  #kq[$d_min = frac(2sqrt(17), 17) approx 0.485$ m, tại $M_0(1, 4)$ trên đường ống khí.]
]

== Dạng 2: Hai Đường Cong Rời Nhau

#bai("5", [Hai cung đường vòng qua núi (Hai Parabol đối đầu)])[
  Mặt cắt thiết kế cầu vượt: cung đường phía trên theo $(C_1): y = x^2 + 2$ (m), cung đường phía dưới theo $(C_2): y = -x^2 - 1$ (m). Tìm khoảng hở thẳng đứng nhỏ nhất giữa hai cung.

  #grid(columns: (1fr, 175pt), gutter: 16pt,
  [
    *Chứng minh rời nhau:*
    $x^2+2 = -x^2-1 => 2x^2 = -3$ — vô nghiệm. $(C_1)$ luôn trên $(C_2)$ ✓

    *Ép tiếp tuyến song song:*
    $f'(x_A) = 2x_A$, $g'(x_B) = -2x_B$.
    $2x_A = -2x_B => x_B = -x_A$.

    *Điều kiện $vec(A B) perp$ tiếp tuyến:*
    Với $x_A = t$, $x_B = -t$:
    - $A = (t,\, t^2+2)$, $B = (-t,\, -t^2-1)$
    - $vec(A B) = (-2t,\, -2t^2-3)$
    - Tiếp tuyến tại $A$: hướng $(1, 2t)$

    Vuông góc: $(-2t)(1) + (-2t^2-3)(2t) = 0$
    $-2t - 4t^3 - 6t = 0 => -8t - 4t^3 = 0 => t(t^2+2) = 0$

    Vì $t^2+2 > 0$, suy ra $t = 0$.

    Cặp điểm: $A(0, 2)$ và $B(0, -1)$. Khoảng cách $|A B| = 3$.
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -2.2, x-max: 2.2,
        y-min: -3.5, y-max: 6,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          plot.add(domain: (-2.0, 2.0), x => x*x + 2,
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C_1)$])
          plot.add(domain: (-2.0, 2.0), x => -x*x - 1,
            style: (stroke: (paint: rgb("D84315"), thickness: 1.6pt)),
            label: [$(C_2)$])
          // A(0,2), B(0,-1)
          plot.add(((0,2),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$A$])
          plot.add(((0,-1),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("D84315")), mark-size: 0.18, label: [$B$])
          // Doan AB (vertical)
          plot.add(((0,-1),(0,2)),
            style: (stroke: (paint: rgb("F57F17"), thickness: 1.5pt)))
          // Tiep tuyen nam ngang tai A va B (slope 0)
          plot.add(domain: (-1.5, 1.5), x => 2.0,
            style: (stroke: (paint: rgb("43A047"), thickness: 0.9pt, dash: "dashed")))
          plot.add(domain: (-1.5, 1.5), x => -1.0,
            style: (stroke: (paint: rgb("43A047"), thickness: 0.9pt, dash: "dashed")))
        }
      )
    })
  ])

  #kq[Khoảng hở thẳng đứng nhỏ nhất giữa hai cung là $d_min = 3$ m, tại điểm trên trục $O y$.]
]

#bai("6", [Vùng nhiệt và khu sinh thái (Hàm mũ và Logarit)])[
  Ranh giới vùng nhiệt do nhà máy gây ra tuân theo $(C_1): y = e^x$. Đường bờ của khu sinh thái tuân theo $(C_2): y = ln x$. Hai vùng không chạm nhau. Tính khoảng cách nhỏ nhất giữa hai ranh giới.

  #grid(columns: (1fr, 175pt), gutter: 16pt,
  [
    *Nhận xét:* $ln x$ là hàm ngược của $e^x$ — hai đồ thị *đối xứng qua* $y = x$.

    Tìm điểm $M_0$ trên $(C_1)$ gần $y=x$ nhất:
    $(e^x)' = e^x = 1 => x_0 = 0 => M_0(0, 1)$

    Khoảng cách từ $M_0(0,1)$ đến $x - y = 0$:
    $ d_0 = frac(|0-1|, sqrt(2)) = frac{1}{sqrt(2)} $

    Điểm đối xứng qua $y=x$: $N_0(1, 0) in (C_2)$.

    $ d_min = |M_0 N_0| = 2 d_0 = frac{2}{sqrt(2)} = sqrt(2) $
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -2, x-max: 3,
        y-min: -2, y-max: 4,
        x-tick-step: 1, y-tick-step: 1,
        axis-style: "school-book",
        {
          plot.add(domain: (-2.0, 1.4), x => calc.exp(x),
            style: (stroke: (paint: rgb("E53935"), thickness: 1.6pt)),
            label: [$(C_1): e^x$])
          plot.add(domain: (0.14, 3.0), x => calc.ln(x),
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C_2): ln x$])
          plot.add(domain: (-2.0, 3.0), x => x,
            style: (stroke: (paint: rgb("9E9E9E"), thickness: 0.9pt, dash: "dashed")),
            label: [$y=x$])
          plot.add(((0,1),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("E53935")), mark-size: 0.18, label: [$M_0$])
          plot.add(((1,0),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$N_0$])
          plot.add(((0,1),(1,0)),
            style: (stroke: (paint: rgb("F57F17"), thickness: 1.5pt)))
        }
      )
    })
  ])

  #kq[$d_min = sqrt(2) approx 1.414$]
]

= III. Bài Tập Tự Luyện

#block(fill: rgb("F9FBE7"), stroke: 1pt + rgb("C5E1A5"), radius: 6pt, inset: (x: 16pt, y: 14pt), width: 100%)[
  *Bài 7.* Tuyến đường bộ: $d: y = 2x + 5$. Địa hình đồi: $(C): y = x^2 - 2x + 2$. Tìm khoảng cách nhỏ nhất từ đường đồi đến tuyến đường bộ.
  #text(style:"italic", size:9.5pt)[_(Đáp: $x_0=2$; $d_min = 9/sqrt(5) = (9sqrt(5))/5$)_]

  #v(0.3em)
  *Bài 8.* Đường nước ngầm: $d: x - 2y + 6 = 0$. Vỉa đất bùn: $(C): y = sqrt(x)$. Khoảng cách nhỏ nhất?
  #text(style:"italic", size:9.5pt)[_(Đáp: $M_0(1,1)$; $d_min = sqrt(5)$)_]

  #v(0.3em)
  *Bài 9.* Hai mặt cong vòm hầm: $(C_1): y = x^2 + 3$ và $(C_2): y = -x^2 + 1$. Khoảng hở nhỏ nhất giữa hai lớp?
  #text(style:"italic", size:9.5pt)[_(Đáp: $d_min = 2$, tại $A(0,3)$ và $B(0,1)$)_]

  #v(0.3em)
  *Bài 10.* _(Dạng đề thi minh họa)_ Cho $(C): y = x^3 - x$ và $d: y = 2x + 5$. Khoảng cách nhỏ nhất từ $(C)$ đến $d$ bằng:
  #grid(columns: (1fr,1fr,1fr,1fr), gutter: 6pt,
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[A. $frac(4sqrt(5),5)$],
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[B. $frac(3sqrt(5),5)$],
    block(stroke: 0.8pt + rgb("43A047"), fill: rgb("E8F5E9"), inset: 6pt, radius: 4pt)[*C. $frac(2sqrt(5),5)$*],
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[D. $frac(sqrt(5),5)$],
  )
]
