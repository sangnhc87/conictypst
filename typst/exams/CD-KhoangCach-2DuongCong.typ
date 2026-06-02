#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2": canvas
#import "@preview/cetz-plot:0.1.4": plot

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
  v(0.6em)
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

// ══ HELPER VẼ ĐỒ THỊ ════════════════════════════════
// Vẽ đồ thị chuẩn với plot.add
#let do-thi(body) = canvas({
  import cetz.draw: *
  body
})

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

#klt(title: "Định lý Tiếp Tuyến Song Song")[
  Cho đường cong $(C): y = f(x)$ và đường thẳng $d: y = a x + b$ không cắt $(C)$.

  Điểm $M_0(x_0, f(x_0)) in (C)$ *gần $d$ nhất* khi và chỉ khi:
  $ f'(x_0) = a $
  Khoảng cách ngắn nhất:
  $ d_min = frac(lr(|a x_0 - f(x_0) + b|), sqrt(a^2 + 1)) $

  *Lý do:* Pháp tuyến của $(C)$ tại điểm gần nhất phải vuông góc với $d$, tức tiếp tuyến phải song song với $d$.
]

== 2. Quy trình giải chuẩn

#block(fill: rgb("FAFAFA"), stroke: 0.8pt + rgb("BDBDBD"), radius: 6pt, inset: (x: 14pt, y: 12pt), width: 100%)[
  #grid(columns: (2.5cm, 1fr), gutter: 8pt,
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 1]]),
    [Nhận dạng: đường cong & đường thẳng, hay hai đường cong? Có đối xứng không?],
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 2]]),
    [Tính đạo hàm $f'(x)$. Kiểm tra miền xác định và khoảng giá trị của $f'$.],
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 3]]),
    [Giải $f'(x_0) = a$. Lưu ý: có thể nhiều nghiệm — tính khoảng cách tại mỗi điểm, lấy $min$.],
    align(center, block(fill: rgb("00695C"), inset: (x: 8pt, y: 6pt), radius: 4pt)[#text(fill: white, weight: "bold", size: 10pt)[Bước 4]]),
    [Tính $d_min = frac(|a x_0 - f(x_0) + b|, sqrt(a^2+1))$.],
  )
]

= II. Bài Tập — Đường Cong và Đường Thẳng

#kbt("1", [Parabol và đường thẳng — $(C): y = x^2$, $d: y = 2x - 3$])[
  Tìm khoảng cách ngắn nhất từ parabol $(C): y = x^2$ đến đường thẳng $d: y = 2x - 3$.

  #grid(columns: (1fr, 170pt), gutter: 16pt,
  [
    *Giải:*

    Hệ số góc $d$: $a = 2$. Đạo hàm: $y' = 2x$.

    Ép song song: $2x_0 = 2 => x_0 = 1$, tọa độ $M_0(1,\, 1)$.

    Khoảng cách từ $M_0(1,1)$ đến $2x - y - 3 = 0$:
    $ d_min = frac(|2(1) - 1 - 3|, sqrt(5)) = frac(2, sqrt(5)) = frac(2sqrt(5), 5) $

    Hình học: Tiếp tuyến $t: y = 2x - 1$ tại $M_0$ song song với $d$. Đoạn vuông góc từ $M_0$ đến $d$ là ngắn nhất.
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -1.5, x-max: 2.5,
        y-min: -2, y-max: 5,
        x-tick-step: 1, y-tick-step: 1,
        axis-style: "school-book",
        {
          // Parabol C: y=x^2
          plot.add(
            domain: (-1.4, 2.3),
            x => x * x,
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C)$],
          )
          // Duong thang d: y=2x-3
          plot.add(
            domain: (-0.5, 2.5),
            x => 2*x - 3,
            style: (stroke: (paint: rgb("D84315"), thickness: 1.5pt)),
            label: [$d$],
          )
          // Tiep tuyen t tai M0(1,1): y=2x-1
          plot.add(
            domain: (-0.5, 2.5),
            x => 2*x - 1,
            style: (stroke: (paint: rgb("43A047"), thickness: 1.1pt, dash: "dashed")),
            label: [$t$],
          )
          // Diem M0
          plot.add(
            ((1, 1),),
            style: (stroke: none),
            mark: "o",
            mark-style: (fill: rgb("1565C0"), stroke: none),
            mark-size: 0.18,
            label: [$M_0$],
          )
        }
      )
    })
  ])

  #kq[$ d_min = frac(2sqrt(5), 5) approx 0.894 $]
]

#kbt("2", [Hàm bậc 3 — Hai tiếp điểm song song: $(C): y = x^3 - 3x$, $d: y = 9x - 2$])[
  Tìm khoảng cách ngắn nhất từ $(C): y = x^3 - 3x$ đến đường thẳng $d: y = 9x - 2$.

  #grid(columns: (1fr, 170pt), gutter: 16pt,
  [
    *Giải:*

    Hệ số góc $d$: $a = 9$. Đạo hàm: $y' = 3x^2 - 3$.

    Ép song song: $3x^2 - 3 = 9 => x^2 = 4 => x = plus.minus 2$.

    *Tại $x_1 = 2$:* $y_1 = 8 - 6 = 2$, điểm $A(2, 2)$.

    Tiếp tuyến: $9x - y - 16 = 0$.
    $d_A = frac(|18 - 2 - 16|, sqrt(82)) = 0$... Ủa — tiếp tuyến trùng với $d$? Kiểm tra lại:

    $d_A = frac(|9(2) - 2 - (-2)|, sqrt(82)) = frac(|18-2+2|, sqrt(82)) = frac{18}{sqrt(82)}$ (cách dòng $9x-y-(-2)=0$).

    *Tại $x_2 = -2$:* $y_2 = -8 + 6 = -2$, điểm $B(-2, -2)$.

    $d_B = frac(|9(-2) - (-2) + 2|, sqrt(82)) = frac(|-18+4|, sqrt(82)) = frac{14}{sqrt(82)}$

    So sánh: $d_A = 18/sqrt(82) > d_B = 14/sqrt(82)$.
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -2.8, x-max: 2.8,
        y-min: -5, y-max: 8,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          plot.add(
            domain: (-2.5, 2.5),
            x => x*x*x - 3*x,
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C)$],
          )
          plot.add(
            domain: (-2.3, 1.2),
            x => 9*x - 2,
            style: (stroke: (paint: rgb("D84315"), thickness: 1.5pt)),
            label: [$d$],
          )
          // Tiep tuyen tai A(2,2): y=9x-16
          plot.add(
            domain: (1.5, 2.5),
            x => 9*x - 16,
            style: (stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed")),
          )
          // Tiep tuyen tai B(-2,-2): y=9x+16
          plot.add(
            domain: (-2.5, -1.5),
            x => 9*x + 16,
            style: (stroke: (paint: rgb("9C27B0"), thickness: 1pt, dash: "dashed")),
          )
          plot.add(((2,2),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("43A047")), mark-size: 0.18, label: [$A$])
          plot.add(((-2,-2),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("9C27B0")), mark-size: 0.18, label: [$B$])
        }
      )
    })
  ])

  #kq[$ d_min = frac(14, sqrt(82)) = frac(7sqrt(82), 41) approx 1.546, " đạt tại " B(-2,-2) $]
]

#kbt("3", [Hàm phân thức — $(C): y = x + frac(1, x-1)$ với $x > 1$, $d: y = -3x + 10$])[
  Tìm khoảng cách ngắn nhất từ nhánh $(x>1)$ của đường cong $(C): y = x + frac(1,x-1)$ đến đường thẳng $d: y = -3x + 10$.

  #grid(columns: (1fr, 170pt), gutter: 16pt,
  [
    *Giải:*

    Hệ số góc $d$: $a = -3$. Đạo hàm: $y' = 1 - frac(1,(x-1)^2)$.

    Ép song song: $1 - frac(1,(x-1)^2) = -3 => (x-1)^2 = frac(1,4)$.

    Vì $x > 1$ nên $x - 1 = frac(1,2)$, được $x_0 = frac(3,2)$.

    $y_0 = frac(3,2) + frac(1,1/2) = frac(3,2) + 2 = frac(7,2)$. Điểm $M_0(3/2,\, 7/2)$.

    Khoảng cách từ $M_0$ đến $3x + y - 10 = 0$:
    $ d_min = frac(|3 dot 3/2 + 7/2 - 10|, sqrt(10)) = frac(|8 - 10|, sqrt(10)) = frac{2}{sqrt(10)} = frac{sqrt(10)}{5} $
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: 1.1, x-max: 4.5,
        y-min: 0, y-max: 8,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          // C: y = x + 1/(x-1), x>1
          plot.add(
            domain: (1.15, 4.4),
            x => x + 1/(x - 1),
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C)$],
          )
          // d: y=-3x+10
          plot.add(
            domain: (1.1, 3.5),
            x => -3*x + 10,
            style: (stroke: (paint: rgb("D84315"), thickness: 1.5pt)),
            label: [$d$],
          )
          // Tiep tuyen tai M0(1.5, 3.5): slope -3, y=-3(x-1.5)+3.5=-3x+8
          plot.add(
            domain: (1.1, 3.0),
            x => -3*x + 8,
            style: (stroke: (paint: rgb("43A047"), thickness: 1.1pt, dash: "dashed")),
            label: [$t_(M_0)$],
          )
          // M0
          plot.add(
            ((1.5, 3.5),),
            style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18,
            label: [$M_0$],
          )
        }
      )
    })
  ])

  #kq[$ d_min = frac(sqrt(10), 5) approx 0.632 $]

  #kip[Kiểm tra: $y'(x_0) = 1 - 1/(1/4) = 1 - 4 = -3$ ✓. Không nhầm nghiệm $x-1 = -1/2$ (ngoài miền xác định).]
]

= III. Bài Tập — Hai Đường Cong Rời Nhau

#kbt("4", [Hai parabol đối đầu — $(C_1): y = x^2 + 1$ và $(C_2): y = -x^2 + 4x - 5$])[
  Chứng minh hai parabol rời nhau và tìm khoảng cách ngắn nhất giữa chúng.

  #grid(columns: (1fr, 170pt), gutter: 16pt,
  [
    *Chứng minh rời nhau:*

    $x^2 + 1 = -x^2 + 4x - 5 => 2x^2 - 4x + 6 = 0 => Delta = -8 < 0$.

    Hơn nữa $y_{C_1} - y_{C_2} = 2(x-1)^2 + 4 > 0$, nên $(C_1)$ nằm hẳn trên $(C_2)$.

    *Tìm khoảng cách ngắn nhất:*

    Ép tiếp tuyến song song: $f'(x_A) = g'(x_B) => 2x_A = -2x_B + 4 => x_A + x_B = 2$.

    Điều kiện pháp tuyến vuông góc tiếp tuyến (đặt $x_A = t$, $x_B = 2-t$):

    $vec(A B) perp (1, 2t)$ với $A = (t, t^2+1)$, $B = (2-t, -(2-t)^2+4(2-t)-5) = (2-t, -(t-1)^2-1+1)$... 

    Rút gọn: $B = (2-t, -t^2+2t-2)$.

    Ép vuông góc: $(2-2t) + 2t(-2t^2+2t-3) = 0 => 2(1-t)(2t^2-2t+1) = 0 => t = 1$.

    Vậy $A(1, 2)$ và $B(1, -2)$. Khoảng cách $|A B| = 4$.
  ],
  align(center)[
    #canvas({
      plot.plot(
        size: (4.5, 4.5),
        x-min: -1.5, x-max: 3.5,
        y-min: -3, y-max: 6,
        x-tick-step: 1, y-tick-step: 2,
        axis-style: "school-book",
        {
          // C1: y=x^2+1
          plot.add(
            domain: (-1.5, 3.5),
            x => x*x + 1,
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C_1)$],
          )
          // C2: y=-x^2+4x-5 = -(x-2)^2-1
          plot.add(
            domain: (-0.5, 4.5),
            x => -x*x + 4*x - 5,
            style: (stroke: (paint: rgb("D84315"), thickness: 1.6pt)),
            label: [$(C_2)$],
          )
          // Diem A(1,2) va B(1,-2)
          plot.add(
            ((1, 2),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$A$])
          plot.add(
            ((1, -2),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("D84315")), mark-size: 0.18, label: [$B$])
          // Tiep tuyen tai A va B (slope 2): y=2x, y=2x-4
          plot.add(
            domain: (-0.5, 2.5),
            x => 2*x,
            style: (stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed")),
          )
          plot.add(
            domain: (-0.5, 2.5),
            x => 2*x - 4,
            style: (stroke: (paint: rgb("43A047"), thickness: 1pt, dash: "dashed")),
          )
        }
      )
    })
  ])

  #kq[$ d_min = |A B| = 4, " tại " A(1,2) in (C_1) " và " B(1,-2) in (C_2) $]
]

#kbt("5", [Hàm mũ và Logarit — $(C_1): y = e^x$ và $(C_2): y = ln x$])[
  Tính khoảng cách ngắn nhất giữa $(C_1): y = e^x$ và $(C_2): y = ln x$.

  #grid(columns: (1fr, 170pt), gutter: 16pt,
  [
    *Giải — Kỹ thuật đối xứng:*

    $ln x$ là hàm ngược của $e^x$. Hai đồ thị đối xứng qua $Delta: y = x$.

    Tìm điểm $M_0$ trên $(C_1)$ gần $Delta$ nhất — ép tiếp tuyến song song $Delta$ (hệ số góc $1$):
    $ (e^x)' = e^x = 1 => x_0 = 0 => M_0(0, 1) $

    Khoảng cách từ $M_0$ đến $x - y = 0$:
    $ d_0 = frac(|0 - 1|, sqrt(2)) = frac{1}{sqrt(2)} $

    Điểm đối xứng $N_0(1, 0)$ nằm trên $(C_2)$.

    $ d_min = |M_0 N_0| = 2 d_0 = sqrt(2) $
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
          // C1: y=e^x
          plot.add(
            domain: (-2.0, 1.4),
            x => calc.exp(x),
            style: (stroke: (paint: rgb("E53935"), thickness: 1.6pt)),
            label: [$(C_1)$],
          )
          // C2: y=ln(x)
          plot.add(
            domain: (0.14, 3.0),
            x => calc.ln(x),
            style: (stroke: (paint: rgb("1565C0"), thickness: 1.6pt)),
            label: [$(C_2)$],
          )
          // Delta: y=x
          plot.add(
            domain: (-2.0, 3.0),
            x => x,
            style: (stroke: (paint: rgb("9E9E9E"), thickness: 0.9pt, dash: "dashed")),
            label: [$y=x$],
          )
          // M0(0,1), N0(1,0)
          plot.add(((0,1),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("E53935")), mark-size: 0.18, label: [$M_0$])
          plot.add(((1,0),), style: (stroke: none), mark: "o",
            mark-style: (fill: rgb("1565C0")), mark-size: 0.18, label: [$N_0$])
          // Segment M0N0 as line
          plot.add(
            ((0,1),(1,0)),
            style: (stroke: (paint: rgb("F57F17"), thickness: 1.5pt)),
          )
        }
      )
    })
  ])

  #kq[$ d_min = sqrt(2) approx 1.414 $]

  #kip[Kỹ thuật đối xứng tiết kiệm hoàn toàn việc lập hệ $f'(x_A) = g'(x_B)$ và điều kiện pháp tuyến — thay vào đó chỉ cần ép $f'(x_0) = 1$ và nhân đôi khoảng cách lên.]
]

= IV. Bài Tập Tự Luyện

#block(fill: rgb("F9FBE7"), stroke: 1pt + rgb("C5E1A5"), radius: 6pt, inset: (x: 16pt, y: 14pt), width: 100%)[

  *Bài 6.* Tìm khoảng cách ngắn nhất từ $(C): y = x^2 - 2x + 2$ đến $d: y = 2x + 5$.
  #text(style: "italic", size: 9.5pt)[_(Đáp: $M_0(2,2)$; $d_min = 9/sqrt(5) = frac(9sqrt(5), 5)$)_]

  #v(0.3em)
  *Bài 7.* Cho $(C): y = sqrt(x)$ và $d: x - 2y + 6 = 0$. Tính khoảng cách ngắn nhất từ $(C)$ đến $d$.
  #text(style: "italic", size: 9.5pt)[_(Đáp: $M_0(1,1)$; $d_min = sqrt(5)$)_]

  #v(0.3em)
  *Bài 8.* Tìm khoảng cách ngắn nhất giữa hai parabol $(C_1): y = x^2 + 3$ và $(C_2): y = -x^2 + 1$.
  #text(style: "italic", size: 9.5pt)[_(Đáp: $d_min = 2$, tại $A(0,3)$ và $B(0,1)$)_]

  #v(0.3em)
  *Bài 9.* Tìm khoảng cách ngắn nhất giữa $y = e^(2x)$ và $y = frac(1,2) ln x$.
  #text(style: "italic", size: 9.5pt)[_(Gợi ý: hai hàm ngược, ép $2e^(2x_0)=1$; Đáp: $d_min = frac(3sqrt(2), 4)$)_]

  #v(0.3em)
  *Bài 10.* _(Đề thi minh họa 2024)_ Cho $(C): y = x^3 - x$ và $d: y = 2x + 5$. Khoảng cách ngắn nhất từ $(C)$ đến $d$ bằng:

  #grid(columns: (1fr,1fr,1fr,1fr), gutter: 6pt,
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[A. $frac(4sqrt(5),5)$],
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[B. $frac(3sqrt(5),5)$],
    block(stroke: 0.8pt + rgb("43A047"), fill: rgb("E8F5E9"), inset: 6pt, radius: 4pt)[*C. $frac(2sqrt(5),5)$*],
    block(stroke: 0.8pt + rgb("9E9E9E"), inset: 6pt, radius: 4pt)[D. $frac(sqrt(5),5)$],
  )
]
