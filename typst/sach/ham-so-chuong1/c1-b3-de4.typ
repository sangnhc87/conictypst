#import "_config.typ": *
#import "@preview/cetz:0.5.2"

// Figures for the problems
#let fig-garden = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((-3, 1.8), (3, 1.8), stroke: (paint: rgb("#b45309"), thickness: 3pt))
  content((0, 2.15), [Bức tường gạch], size: 9pt)
  rect((-2, 1.8), (2, -0.4), stroke: (paint: rgb("#0f4c81"), thickness: 1.2pt))
  content((0, 0.7), [Vườn rau], size: 10pt)
  content((-2.3, 0.7), $x$)
  content((2.3, 0.7), $x$)
  content((0, -0.75), $100 - 2x$)
})

#let fig-cardboard = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  rect((-2, -2), (2, 2), stroke: (paint: gray, thickness: 1pt))
  rect((-1.4, -1.4), (1.4, 1.4), stroke: (paint: black, dash: "dashed"))
  for (px, py) in ((-1.7, -1.7), (1.7, -1.7), (-1.7, 1.7), (1.7, 1.7)) {
    rect((px - 0.3, py - 0.3), (px + 0.3, py + 0.3), fill: gray.lighten(60%), stroke: 0.5pt)
  }
  content((0, -2.3), [$30$ cm], size: 9pt)
  content((1.7, 2.25), $x$, size: 9pt)
  content((2.25, 1.7), $x$, size: 9pt)
})

#let fig-window = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  rect((-1.2, -1.2), (1.2, 0.5), stroke: (paint: rgb("#0f4c81"), thickness: 1.2pt))
  arc((1.2, 0.5), start: 0deg, stop: 180deg, radius: 1.2, stroke: (paint: rgb("#0f4c81"), thickness: 1.2pt))
  line((-1.2, 0.5), (1.2, 0.5), stroke: (paint: gray, dash: "dashed"))
  content((-1.5, -0.35), $y$)
  content((1.5, -0.35), $y$)
  content((0, -1.5), $2R$)
  content((0, 0.8), $R$)
  circle((0, 0.5), radius: 1.5pt, fill: black)
})

#let fig-river = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((-3, 1.2), (4, 1.2), stroke: 1.5pt)
  line((-3, -1.2), (4, -1.2), stroke: 1.5pt)
  rect((-3, -1.2), (4, 1.2), fill: rgb("#eff6ff"), stroke: none)
  circle((-2, 1.2), radius: 2.5pt, fill: rgb("#b91c1c"))
  content((-2, 1.55), $A$, size: 9pt)
  circle((-2, -1.2), radius: 2.5pt, fill: black)
  content((-2.3, -1.5), $H$, size: 9pt)
  circle((1, -1.2), radius: 2.5pt, fill: rgb("#065f46"))
  content((1, -1.5), $S$, size: 9pt)
  circle((3.5, -1.2), radius: 2.5pt, fill: rgb("#b91c1c"))
  content((3.5, -1.5), $B$, size: 9pt)
  line((-2, 1.2), (1, -1.2), stroke: (paint: red, thickness: 1.5pt))
  line((1, -1.2), (3.5, -1.2), stroke: (paint: black, dash: "dashed", thickness: 1.5pt))
  content((-2.5, 0), [$300$ m], size: 8pt)
  content((-0.5, -1.5), $x$, size: 9pt)
  content((2.2, -1.5), $1000 - x$, size: 9pt)
})

#let fig-pens = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  rect((-2.5, -1.2), (2.5, 1.2), stroke: (paint: rgb("#0f4c81"), thickness: 1.2pt))
  line((0, -1.2), (0, 1.2), stroke: (paint: rgb("#0f4c81"), thickness: 1.2pt))
  content((-2.8, 0), $x$)
  content((2.8, 0), $x$)
  content((0.25, 0), $x$)
  content((-1.25, -1.5), $y$)
  content((1.25, -1.5), $y$)
})

#let fig-log = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  circle((0, 0), radius: 2, stroke: 1.2pt + black)
  rect((-1.2, -1.6), (1.2, 1.6), stroke: 1.5pt + rgb("#b45309"))
  line((-1.2, -1.6), (1.2, 1.6), stroke: (paint: gray, dash: "dashed"))
  content((0, -1.9), $w$)
  content((-1.5, 0), $h$)
  content((0.3, 0.4), [$d = 40$ cm], size: 9pt)
})

#let fig-poster = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  rect((-2, -2.6), (2, 2.6), stroke: 1.2pt + black)
  rect((-1.4, -1.8), (1.4, 1.8), stroke: 1pt + rgb("#0f4c81"), fill: rgb("#f8fafc"))
  content((0, 0), [Vùng in\ 384 cm²], align: center, size: 9pt)
  content((0, 2.2), [Lề trên 5 cm], size: 8pt)
  content((0, -2.2), [Lề dưới 5 cm], size: 8pt)
  content((-1.7, 0), [Lề\ 3 cm], size: 8pt)
  content((1.7, 0), [Lề\ 3 cm], size: 8pt)
})

#let fig-sector = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  circle((0, 0), radius: 2, stroke: (paint: gray, dash: "dashed"))
  line((0, 0), (0, 2), stroke: 1.2pt + black)
  line((0, 0), (1.414, 1.414), stroke: 1.2pt + black)
  arc((0, 2), start: 90deg, stop: 45deg, radius: 2, stroke: 1.5pt + rgb("#b91c1c"))
  content((0.7, 0.9), $R$, size: 9pt)
  content((0.3, 1.6), $R$, size: 9pt)
  content((0.4, 0.5), $alpha$, size: 9pt)
})

#let fig-rig = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((-3, -1.2), (4, -1.2), stroke: 1.5pt + black)
  content((0.5, -1.5), [Bờ biển], size: 9pt)
  circle((-2.5, 1.2), radius: 3pt, fill: rgb("#b91c1c"))
  content((-2.5, 1.55), $A$, size: 9pt)
  rect((-3, -1.2), (4, 1.2), fill: rgb("#eff6ff"), stroke: none)
  circle((-2.5, -1.2), radius: 2.5pt, fill: black)
  content((-2.5, -1.5), $H$, size: 9pt)
  circle((0.5, -1.2), radius: 2.5pt, fill: rgb("#065f46"))
  content((0.5, -1.5), $C$, size: 9pt)
  circle((3.5, -1.2), radius: 2.5pt, fill: rgb("#b91c1c"))
  content((3.5, -1.5), $B$, size: 9pt)
  line((-2.5, 1.2), (0.5, -1.2), stroke: 1.5pt + red)
  line((0.5, -1.2), (3.5, -1.2), stroke: 1.5pt + black)
  content((-3.1, 0), [$10$ km], size: 8pt)
  content((-1.0, -1.5), $x$, size: 9pt)
  content((2.0, -1.5), $20 - x$, size: 9pt)
})

#let fig-trapezoid = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((-3, 1.5), (3, 1.5), stroke: (paint: rgb("#2563eb"), thickness: 2pt))
  content((0, 1.8), [Dòng sông], size: 9pt)
  line((-2.2, 1.5), (-1.2, -0.8), stroke: 1.2pt + black)
  line((-1.2, -0.8), (1.2, -0.8), stroke: 1.2pt + black)
  line((1.2, -0.8), (2.2, 1.5), stroke: 1.2pt + black)
  content((0, -1.15), $x$, size: 9pt)
  content((-1.9, 0.35), $y$, size: 9pt)
  content((1.9, 0.35), $y$, size: 9pt)
})

#let fig-ladder = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((0, -0.5), (0, 3.5), stroke: 3pt + black)
  content((-0.6, 2.5), [Tường], size: 9pt)
  line((-0.5, -0.5), (3.5, -0.5), stroke: 1.5pt + black)
  line((1.2, -0.5), (1.2, 1.5), stroke: 2pt + rgb("#b45309"))
  content((1.2, 1.8), [Hàng rào], size: 9pt)
  line((0, 2.8), (2.4, -0.5), stroke: 2.2pt + rgb("#2563eb"))
  content((1.4, 1.25), [Thang], fill: white, size: 9pt)
  content((0.6, -0.8), [$1$ m], size: 8pt)
  content((1.8, -0.8), $theta$, size: 9pt)
  content((1.6, 0.5), [$2.7$ m], size: 8pt)
})

#let fig-fold = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  rect((-2, -3), (2, 3), stroke: 1pt + black)
  line((2, -1), (-0.5, 3), stroke: 1.5pt + red)
  line((2, -1), (0.2, 1.8), stroke: 1pt + black)
  line((0.2, 1.8), (-0.5, 3), stroke: 1pt + black)
  content((0.8, 1.0), [Nếp gấp], size: 9pt)
})

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 04]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Một người nông dân muốn rào một khu vườn hình chữ nhật sát một bức tường gạch có sẵn (bức tường đóng vai trò là một cạnh của hình chữ nhật nên không cần rào). Người đó sử dụng một cuộn lưới dài $100$ mét để rào ba cạnh còn lại. Diện tích lớn nhất của khu vườn có thể đạt được là:
    #align(center)[#fig-garden]
  ],
  (
    [$1000$ m²],
    True([$1250$ m²]),
    [$2500$ m²],
    [$625$ m²],
  ),
  accent: c-book,
  loigiai: [
    #step[Gọi chiều rộng của khu vườn vuông góc với bức tường là $x$ (mét, $0 < x < 50$).]
    #step[Khi đó, cạnh song song với bức tường có chiều dài là $100 - 2x$ (mét).]
    #step[Diện tích khu vườn được biểu diễn bởi hàm số:
      $S(x) = x(100 - 2x) = 100x - 2x^2$.]
    #step[Xét đạo hàm: $S'(x) = 100 - 4x = 0 <=> x = 25$ (thỏa mãn).]
    #step[Bảng biến thiên của hàm số $S(x)$ trên khoảng $(0; 50)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $25$, $50$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $1250$, $0$),
        )
      ]
      Do đó, diện tích lớn nhất đạt được khi $x = 25$ m với $S(25) = 1250$ m².]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một miếng tôn hình vuông cạnh $30$ cm. Người ta cắt bỏ đi bốn hình vuông nhỏ bằng nhau có cạnh $x$ (cm) ở bốn góc của miếng tôn rồi gập lên để tạo thành một chiếc hộp không nắp có dạng hình hộp chữ nhật. Tìm $x$ để thể tích của chiếc hộp là lớn nhất.
    #align(center)[#fig-cardboard]
  ],
  (
    [$x = 10$ cm],
    [$x = 6$ cm],
    True([$x = 5$ cm]),
    [$x = 7.5$ cm],
  ),
  accent: c-book,
  loigiai: [
    #step[Điều kiện của cạnh cắt đi: $0 < x < 15$ (cm).]
    #step[Khi gập lên, chiếc hộp thu được có kích thước đáy là $(30 - 2x) times (30 - 2x)$ và chiều cao bằng $x$.]
    #step[Thể tích của chiếc hộp là:
      $V(x) = x(30 - 2x)^2 = 4x^3 - 120x^2 + 900x$.]
    #step[Đạo hàm: $V'(x) = 12x^2 - 240x + 900 = 12(x^2 - 20x + 75) = 12(x-5)(x-15)$.]
    #step[Xét trên khoảng $(0; 15)$, phương trình $V'(x) = 0 <=> x = 5$.]
    #step[Bảng biến thiên của hàm số $V(x)$ trên khoảng $(0; 15)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $5$, $15$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $2000$, $0$),
        )
      ]
      Do đó, thể tích lớn nhất đạt được khi $x = 5$ cm với $V(5) = 2000$ cm³.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một cửa sổ có dạng một hình chữ nhật phía dưới và một bán nguyệt phía trên như hình vẽ. Biết chu vi của cửa sổ là $P = 6$ mét. Bán kính $R$ của hình bán nguyệt phía trên bằng bao nhiêu để cửa sổ nhận được nhiều ánh sáng nhất (diện tích cửa sổ lớn nhất)?
    #align(center)[#fig-window]
  ],
  (
    True([$6 / (pi + 4)$ m]),
    [$3 / (pi + 4)$ m],
    [$6 / (pi + 2)$ m],
    [$3 / (pi + 2)$ m],
  ),
  accent: c-book,
  loigiai: [
    #step[Gọi bán kính bán nguyệt là $R$ ($R > 0$), khi đó chiều rộng hình chữ nhật là $2R$. Gọi chiều cao hình chữ nhật là $y$ ($y > 0$).]
    #step[Chu vi cửa sổ gồm 3 cạnh hình chữ nhật và cung bán nguyệt:
      $P = 2R + 2y + pi R = 6 <=> 2y = 6 - (pi + 2)R <=> y = 3 - (pi/2 + 1)R$.]
    #step[Diện tích cửa sổ là:
      $S(R) = 2R y + (pi R^2)/2 = 2R(3 - (pi/2 + 1)R) + (pi R^2)/2 = 6R - (pi + 2)R^2 + (pi R^2)/2 = 6R - (pi/2 + 2)R^2$.]
    #step[Tính đạo hàm theo $R$: $S'(R) = 6 - (pi + 4)R$.]
    #step[Phương trình $S'(R) = 0 <=> R = 6 / (pi + 4)$.]
    #step[Bảng biến thiên của hàm số $S(R)$ trên khoảng $(0; 6 / (pi + 2))$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $6 / (pi + 4)$, $6 / (pi + 2)$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $18 / (pi + 4)$, $0$),
        )
      ]
      Do đó, diện tích lớn nhất đạt được khi $R = 6 / (pi + 4)$ m.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một trạm điện $A$ cách bờ sông thẳng $300$ m. Một trạm biến áp $B$ trên bờ đối diện cách hình chiếu $H$ của $A$ trên bờ đối diện một khoảng $1000$ m hạ lưu. Người ta muốn lắp đặt đường dây cáp từ $A$ đến $B$ bằng cách nối từ $A$ đến điểm $S$ trên bờ đối diện, rồi đi dọc theo bờ từ $S$ đến $B$ như hình vẽ. Chi phí lắp đặt cáp dưới nước là $5$ triệu VND/m, trên đất liền là $3$ triệu VND/m. Tìm khoảng cách từ $H$ đến $S$ để tổng chi phí lắp đặt cáp là thấp nhất.
    #align(center)[#fig-river]
  ],
  (
    [$350$ m],
    True([$225$ m]),
    [$250$ m],
    [$300$ m],
  ),
  accent: c-book,
  loigiai: [
    #step[Đặt $x = H S$ ($0 <= x <= 1000$, đơn vị: mét).]
    #step[Chiều dài đường dây cáp dưới nước là: $A S = sqrt(x^2 + 300^2)$.]
    #step[Chiều dài đường dây cáp trên đất liền là: $S B = 1000 - x$.]
    #step[Tổng chi phí lắp đặt (triệu đồng) là:
      $C(x) = 5 sqrt(x^2 + 90000) + 3(1000 - x)$.]
    #step[Đạo hàm: $C'(x) = (5x)/sqrt(x^2 + 90000) - 3$.]
    #step[Phương trình $C'(x) = 0 <=> 5x = 3 sqrt(x^2 + 90000) <=> 25x^2 = 9(x^2 + 90000) <=> 16x^2 = 810000 <=> x = 225$ m (thỏa mãn).]
    #step[Bảng biến thiên của hàm số $C(x)$ trên đoạn $[0; 1000]$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $225$, $1000$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($4500$, $4200$, $5220$),
        )
      ]
      Do đó, chi phí nhỏ nhất đạt được khi $x = 225$ m.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tầm cao của một mô hình tên lửa được phóng từ mặt đất được mô tả bởi hàm số $h(t) = -4.9 t^2 + 29.4 t + 2$ (m), trong đó $t$ (giây) là thời gian kể từ thời điểm phóng. Hỏi tên lửa đạt độ cao lớn nhất bằng bao nhiêu và sau bao lâu?],
  (
    [$44.1$ m, sau $3$ giây],
    True([$46.1$ m, sau $3$ giây]),
    [$46.1$ m, sau $2$ giây],
    [$44.1$ m, sau $2$ giây],
  ),
  accent: c-book,
  loigiai: [
    #step[Tên lửa bay trên không khi $h(t) >= 0 <=> t in [0; 6.07]$ (giây).]
    #step[Đạo hàm của hàm độ cao: $h'(t) = -9.8 t + 29.4$.]
    #step[Phương trình $h'(t) = 0 <=> t = 3$ (giây).]
    #step[Bảng biến thiên của hàm số $h(t)$ trên khoảng $(0; 6)$ (khoảng hoạt động có ý nghĩa vật lý):
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $3$, $6$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($2$, $46.1$, $2$),
        )
      ]
      Do đó, độ cao lớn nhất đạt được là $46.1$ m sau $3$ giây.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công ty muốn sản xuất một loại hộp sữa hình trụ có thể tích chứa sữa là $1$ lít (1000 cm³). Để chi phí làm vỏ hộp sữa là thấp nhất (tương ứng diện tích toàn phần của hình trụ là nhỏ nhất), bán kính đáy $R$ của hộp sữa xấp xỉ bằng giá trị nào sau đây?],
  (
    [$4.2$ cm],
    True([$5.4$ cm]),
    [$6.8$ cm],
    [$7.2$ cm],
  ),
  accent: c-book,
  loigiai: [
    #step[Công thức thể tích hình trụ: $V = pi R^2 h = 1000 => h = 1000 / (pi R^2)$.]
    #step[Diện tích toàn phần của vỏ hộp sữa:
      $S(R) = 2 pi R^2 + 2 pi R h = 2 pi R^2 + 2 pi R (1000 / (pi R^2)) = 2 pi R^2 + 2000 / R$.]
    #step[Tính đạo hàm: $S'(R) = 4 pi R - 2000 / R^2$.]
    #step[Phương trình $S'(R) = 0 <=> 4 pi R^3 = 2000 <=> R^3 = 500 / pi => R = root(3, 500 / pi) approx 5.42$ cm.]
    #step[Bảng biến thiên của hàm số $S(R)$ trên khoảng $(0; +oo)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $root(3, 500 / pi)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $approx 553.6$, $+oo$),
        )
      ]
      Do đó, diện tích toàn phần đạt giá trị nhỏ nhất tại $R approx 5.4$ cm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Chi phí vận hành một chiếc xe tải chạy trên một quãng đường dài $300$ km là $C(v) = 150 + 0.15 v + 1200 / v$ (USD), trong đó $v$ (km/h) là vận tốc trung bình của xe trên quãng đường đó ($40 <= v <= 100$). Hỏi xe tải nên chạy với vận tốc trung bình bao nhiêu để chi phí vận hành là thấp nhất?],
  (
    [$80$ km/h],
    True([$89.4$ km/h]),
    [$75$ km/h],
    [$90$ km/h],
  ),
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $C(v) = 150 + 0.15 v + 1200 / v$ trên đoạn $[40; 100]$.]
    #step[Đạo hàm: $C'(v) = 0.15 - 1200 / v^2$.]
    #step[Phương trình $C'(v) = 0 <=> v^2 = 1200 / 0.15 = 8000 => v = sqrt(8000) = 40 sqrt(5) approx 89.4$ km/h (thỏa mãn).]
    #step[Bảng biến thiên của hàm số $C(v)$ trên đoạn $[40; 100]$:
      #align(center)[
        #my-bbbt(
          x-vals: ($40$, $40 sqrt(5)$, $100$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($186$, $approx 176.8$, $177$),
        )
      ]
      Vậy chi phí thấp nhất khi vận tốc trung bình đạt $v = 40 sqrt(5) approx 89.4$ km/h.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một khu vườn hình chữ nhật được ngăn chia làm hai lô bởi một hàng rào song song với một cạnh. Người ta sử dụng tổng cộng $120$ mét lưới để làm tất cả các hàng rào. Tìm chiều rộng $x$ của mỗi lô vườn (cạnh song song với hàng rào chia đôi) để diện tích toàn bộ khu vườn lớn nhất.
    #align(center)[#fig-pens]
  ],
  (
    [$15$ m],
    True([$20$ m]),
    [$30$ m],
    [$10$ m],
  ),
  accent: c-book,
  loigiai: [
    #step[Chiều rộng khu vườn song song với hàng rào chia đôi là $x$ ($x > 0$), chiều dài khu vườn vuông góc với các hàng rào này là $y$ ($y > 0$).]
    #step[Do chia khu vườn làm hai phần nên có 3 đoạn rào chiều dài $x$ và 2 đoạn rào chiều dài $y$.]
    #step[Tổng chiều dài hàng rào: $3x + 2y = 120 => y = 60 - 1.5x$.]
    #step[Tổng diện tích khu vườn là: $S(x) = x y = x(60 - 1.5x) = 60x - 1.5x^2$ với $0 < x < 40$.]
    #step[Bảng biến thiên của hàm số $S(x)$ trên khoảng $(0; 40)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $20$, $40$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $600$, $0$),
        )
      ]
      Do đó, diện tích khu vườn đạt giá trị lớn nhất khi $x = 20$ m.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một thanh xà gồ bằng gỗ hình hộp chữ nhật được xẻ từ một thân cây gỗ hình trụ có đường kính mặt cắt là $d = 40$ cm. Sức bền chịu lực $S$ của xà gồ tỷ lệ thuận với tích của chiều rộng $w$ và bình phương chiều cao $h$ của nó ($S = k dot w dot h^2$, với $k > 0$ là hằng số). Chiều rộng $w$ của thanh xà gồ bằng bao nhiêu để nó có sức bền tốt nhất?
    #align(center)[#fig-log]
  ],
  (
    [$20$ cm],
    True([$23.1$ cm]),
    [$28.3$ cm],
    [$15.5$ cm],
  ),
  accent: c-book,
  loigiai: [
    #step[Theo định lý Pythagore trên mặt cắt ngang hình tròn: $w^2 + h^2 = d^2 = 40^2 = 1600 => h^2 = 1600 - w^2$ (với $0 < w < 40$).]
    #step[Hàm sức bền chịu lực của xà gồ là:
      $S(w) = k dot w dot (1600 - w^2) = k(1600w - w^3)$.]
    #step[Đạo hàm theo $w$: $S'(w) = k(1600 - 3w^2)$.]
    #step[Bảng biến thiên của hàm số $S(w) / k$ trên khoảng $(0; 40)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $40 / sqrt(3)$, $40$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $approx 24633$, $0$),
        )
      ]
      Do đó, sức bền tốt nhất khi chiều rộng thanh xà gồ đạt $w = 40 / sqrt(3) approx 23.1$ cm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một trang quảng cáo có dạng hình chữ nhật với phần in nội dung bên trong có diện tích cố định là 384 cm². Lề trên và lề dưới rộng $5$ cm, lề bên trái và lề bên phải rộng $3$ cm. Tìm chiều rộng toàn bộ trang quảng cáo để diện tích của toàn bộ trang quảng cáo là nhỏ nhất (tiết kiệm giấy nhất).
    #align(center)[#fig-poster]
  ],
  (
    [$18$ cm],
    True([$21.2$ cm]),
    [$24$ cm],
    [$20$ cm],
  ),
  accent: c-book,
  loigiai: [
    #step[Gọi chiều rộng phần in nội dung bên trong là $x$ (cm, $x > 0$), khi đó chiều cao phần in là $384 / x$ (cm).]
    #step[Kích thước toàn bộ trang quảng cáo bao gồm cả các lề là:
      - Chiều rộng: $x + 2 times 3 = x + 6$ (cm).
      - Chiều cao: $384 / x + 2 times 5 = 384 / x + 10$ (cm).]
    #step[Tổng diện tích toàn bộ trang quảng cáo:
      $A(x) = (x + 6)(384 / x + 10) = 384 + 10x + 2304 / x + 60 = 444 + 10x + 2304 / x$.]
    #step[Bảng biến thiên của diện tích $A(x)$ trên khoảng $(0; +oo)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $sqrt(230.4)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $approx 747.6$, $+oo$),
        )
      ]
      Do đó, chiều rộng toàn bộ trang quảng cáo nhỏ nhất để tiết kiệm giấy nhất khi $x approx 15.18$ cm, tức chiều rộng toàn bộ $w = x + 6 approx 21.2$ cm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một tấm bìa hình tròn bán kính $R = 12$ cm. Người ta cắt bỏ đi một hình quạt tròn tâm $O$ bán kính $R$ có góc ở tâm là $alpha$ (radian) rồi cuộn phần còn lại thành một chiếc phễu hình nón. Tìm góc $alpha$ để thể tích của chiếc phễu hình nón là lớn nhất.
    #align(center)[#fig-sector]
  ],
  (
    [$alpha = 2pi(1 - sqrt(1/3))$],
    True([$alpha = 2pi(1 - sqrt(2/3))$]),
    [$alpha = 2pi(1 - 1/sqrt(3))$],
    [$alpha = pi sqrt(2/3)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Gọi bán kính đường tròn đáy phễu hình nón là $r$, chiều cao hình nón là $h$.]
    #step[Độ dài đường sinh của hình nón chính là bán kính tấm bìa tròn: $L = R = 12$ cm.]
    #step[Ta có mối liên hệ: $r^2 + h^2 = L^2 = 144 => r^2 = 144 - h^2$ (với $0 < h < 12$).]
    #step[Thể tích của phễu hình nón:
      $V(h) = 1/3 pi r^2 h = 1/3 pi (144 - h^2)h = pi/3 (144h - h^3)$.]
    #step[Đạo hàm: $V'(h) = pi/3 (144 - 3h^2) = 0 <=> h = sqrt(48) = 4 sqrt(3)$ cm.]
    #step[Bảng biến thiên của thể tích $V(h)$ trên khoảng $(0; 12)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $4 sqrt(3)$, $12$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $128 pi sqrt(3) / 3$, $0$),
        )
      ]
      Do đó, thể tích lớn nhất đạt được khi $h = 4 sqrt(3)$ cm.]
    #step[Tại $h = 4 sqrt(3)$, ta tìm được $r = sqrt(144 - 48) = sqrt(96) = 4 sqrt(6)$ cm.]
    #step[Chu vi đáy nón là $2 pi r = 8 pi sqrt(6)$ cm. Độ dài cung còn lại của hình tròn gốc là $R(2pi - alpha) = 12(2pi - alpha)$.]
    #step[Từ đó: $12(2pi - alpha) = 8 pi sqrt(6) <=> 2pi - alpha = (2 pi sqrt(6)) / 3 <=> alpha = 2pi(1 - sqrt(2/3))$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một tòa nhà chung cư có 100 căn hộ cho thuê. Nếu giá thuê là 5 triệu đồng/tháng thì tất cả 100 căn hộ đều được thuê. Cứ mỗi lần tăng giá thuê thêm 100 nghìn đồng/tháng thì sẽ có thêm 1 căn hộ bị bỏ trống. Chi phí quản lý và bảo trì cho mỗi căn hộ được thuê là 200 nghìn đồng/tháng. Hỏi người quản lý tòa nhà nên đặt giá thuê là bao nhiêu để lợi nhuận thu được là lớn nhất?],
  (
    [$7.5$ triệu đồng/tháng],
    True([$7.6$ triệu đồng/tháng]),
    [$8.0$ triệu đồng/tháng],
    [$7.2$ triệu đồng/tháng],
  ),
  accent: c-book,
  loigiai: [
    #step[Gọi $x$ là số lần tăng giá thuê thêm 100 nghìn đồng/tháng ($x >= 0, x$ nguyên).]
    #step[Khi đó, giá thuê mỗi căn hộ là $50 + x$ (trăm nghìn đồng/tháng).]
    #step[Số căn hộ được thuê là $100 - x$ (căn hộ).]
    #step[Doanh thu từ việc cho thuê là: $(50 + x)(100 - x)$ (trăm nghìn đồng).]
    #step[Tổng chi phí quản lý cho các căn hộ được thuê là: $2(100 - x)$ (trăm nghìn đồng).]
    #step[Lợi nhuận thu được của tòa nhà là:
      $P(x) = (50 + x)(100 - x) - 2(100 - x) = (48 + x)(100 - x) = 4800 + 52x - x^2$.]
    #step[Đạo hàm theo biến $x$: $P'(x) = 52 - 2x = 0 <=> x = 26$.]
    #step[Bảng biến thiên của lợi nhuận $P(x)$ trên khoảng $(0; 100)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $26$, $100$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($4800$, $5476$, $0$),
        )
      ]
      Do đó, lợi nhuận cực đại đạt được khi $x = 26$.]
    #step[Vậy giá thuê tối ưu là $50 + 26 = 76$ (trăm nghìn đồng), tức là $7.6$ triệu đồng/tháng.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Một giàn khoan dầu $A$ nằm cách bờ biển thẳng $10$ km. Một kho dầu $B$ trên đất liền nằm cách hình chiếu $H$ của giàn khoan trên bờ biển một khoảng $20$ km. Người ta lắp đặt đường ống dẫn dầu từ $A$ đến $B$ gồm đoạn ống đi dưới biển từ $A$ đến điểm $C$ trên bờ biển, sau đó chạy dọc bờ biển từ $C$ đến $B$. Chi phí lắp đường ống dưới biển là $500$ triệu đồng/km, còn trên đất liền là $300$ triệu đồng/km. Đặt $x$ (km) là khoảng cách từ $H$ đến $C$ ($0 <= x <= 20$). Xét tính đúng sai của các nhận định sau:
    #align(center)[#fig-rig]
  ],
  (
    True([Chiều dài đường ống dẫn dầu đi dưới biển là $sqrt(x^2 + 100)$ km.]),
    True([Học sinh thiết lập được hàm số biểu diễn tổng chi phí lắp đặt đường ống là $C(x) = 500 sqrt(x^2 + 100) + 300(20 - x)$ (triệu đồng).]),
    True([Chi phí lắp đặt đường ống nhỏ nhất khi điểm $C$ cách hình chiếu $H$ một khoảng $x = 7.5$ km.]),
    [Tổng chi phí lắp đặt đường ống tối thiểu đạt được là 8 tỷ đồng (8000 triệu đồng).],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Áp dụng định lý Pythagore trong tam giác vuông $A H C$ vuông tại $H$, ta có: $A C = sqrt(A H^2 + H C^2) = sqrt(10^2 + x^2) = sqrt(x^2 + 100)$ (km).
    - b) Đúng. Chiều dài đoạn ống trên bờ biển là $C B = H B - H C = 20 - x$ (km). Tổng chi phí lắp đặt đường ống là $C(x) = 500 dot A C + 300 dot C B = 500 sqrt(x^2 + 100) + 300(20 - x)$ (triệu đồng).
    - c) Đúng. Khảo sát hàm số $C(x)$ trên $[0; 20]$: $C'(x) = (500x)/sqrt(x^2 + 100) - 300 = 0 <=> 5x = 3 sqrt(x^2 + 100) <=> 25x^2 = 9(x^2 + 100) <=> 16x^2 = 900 <=> x = 7.5$ (km) (thỏa mãn). Bảng biến thiên của hàm số trên đoạn $[0; 20]$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $7.5$, $20$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($11000$, $10000$, $approx 11180$),
        )
      ]
      Hàm số đạt cực tiểu và nhỏ nhất tại $x = 7.5$ km.
    - d) Sai. Chi phí nhỏ nhất là $C(7.5) = 10000$ triệu đồng, tức $10$ tỷ đồng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Một người nông dân muốn rào một khu đất hình thang cân sát một bờ sông thẳng làm đồng cỏ chăn nuôi (bờ sông đóng vai trò là đáy lớn của hình thang nên không cần rào). Người đó dùng $600$ mét hàng rào để rào ba cạnh còn lại (gồm hai cạnh bên bằng nhau và đáy nhỏ song song với bờ sông). Gọi đáy nhỏ hình thang là $x$ (mét), $0 < x < 600$, hai cạnh bên là $y$ (mét). Xét tính đúng sai của các nhận định sau để tìm thiết kế cho diện tích đồng cỏ lớn nhất:
    #align(center)[#fig-trapezoid]
  ],
  (
    True([Độ dài mỗi cạnh bên hình thang theo đáy nhỏ $x$ là $y = 300 - x/2$ (mét).]),
    True([Nếu góc giữa cạnh bên và đáy nhỏ hình thang bằng $120°$, diện tích đồng cỏ đạt giá trị lớn nhất bằng $30000 sqrt(3) m^2$.]),
    True([Khi diện tích đồng cỏ đạt giá trị lớn nhất, đáy nhỏ $x$ thiết kế bằng $200$ m.]),
    [Khi diện tích đồng cỏ đạt lớn nhất, tổng chiều dài hai cạnh bên nhỏ hơn chiều dài đáy nhỏ.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Tổng chiều dài hàng rào rào 3 cạnh: $x + 2y = 600 => y = 300 - x/2$.
    - b) Đúng. Gọi $theta$ là góc giữa cạnh bên và đáy nhỏ hình thang ($0 < theta < pi/2$). Chiều cao hình thang là $h = y sin theta$, hình chiếu cạnh bên lên đáy lớn là $y cos theta$. Diện tích hình thang là $S = (x + y cos theta) y sin theta$. Qua khảo sát hình học biến số, diện tích hình thang cân lớn nhất khi góc ở đáy giáp sông là $60°$ (góc giáp đáy nhỏ là $120°$), ba cạnh rào bằng nhau $x = y = 200$ m. Diện tích lớn nhất khi đó: $S = (200 + 200 cos 60°) dot 200 sin 60° = 300 dot 100 sqrt(3) = 30000 sqrt(3) m^2$.
    - c) Đúng. Theo lập luận cực trị, diện tích lớn nhất khi $x = y = 200$ m.
    - d) Sai. Khi diện tích lớn nhất, tổng hai cạnh bên là $2y = 400$ m, lớn hơn đáy nhỏ $x = 200$ m.
  ],
))

#q-wrap(dir: "doc", ds(
  [Một nghiên cứu về dịch bệnh ước lượng số lượng người bị nhiễm bệnh $I(t)$ tại một thành phố sau $t$ ngày kể từ ngày ghi nhận ca bệnh đầu tiên được mô tả bởi mô hình: $I(t) = -t^3 + 30 t^2 + 225 t$ (với $t >= 0$). Xét tính đúng sai của các phát biểu sau:],
  (
    True([Tốc độ lây lan dịch bệnh tại ngày thứ $t$ là đạo hàm $I'(t) = -3 t^2 + 60 t + 225$ (người/ngày).]),
    True([Trong 10 ngày đầu tiên, tốc độ lây lan dịch bệnh đạt giá trị lớn nhất vào ngày thứ 10.]),
    True([Số lượng người nhiễm bệnh đạt giá trị lớn nhất sau 25 ngày kể từ ca đầu tiên.]),
    [Số lượng ca nhiễm lớn nhất ghi nhận được trong đợt dịch này là 10.000 ca.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Tốc độ lây lan tại thời điểm $t$ chính là tốc độ thay đổi của số ca nhiễm bệnh, tức đạo hàm bậc nhất của $I(t)$: $I'(t) = -3 t^2 + 60 t + 225$.
    - b) Đúng. Gọi tốc độ lây lan là $v(t) = I'(t) = -3 t^2 + 60 t + 225$. Ta tìm giá trị lớn nhất của $v(t)$ trên $[0; 10]$. Đạo hàm $v'(t) = -6t + 60 = 0 <=> t = 10$. Hệ số của $t^2$ âm nên $v(t)$ đạt cực đại tại $t = 10$ trên đoạn này.
    - c) Đúng. Số lượng người nhiễm lớn nhất khi đạo hàm $I'(t) = 0 <=> -3(t^2 - 20t - 75) = 0 <=> -3(t-25)(t+5) = 0 <=> t = 25$ (vì $t >= 0$). Bảng biến thiên của số người nhiễm $I(t)$ trên đoạn $[0; 30]$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $25$, $30$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $8750$, $6750$),
        )
      ]
      Do đó, số ca nhiễm lớn nhất đạt được sau 25 ngày kể từ ca đầu tiên.
    - d) Sai. Số ca nhiễm lớn nhất là $I(25) = 8750$ ca (không phải 10.000 ca).
  ],
))

#q-wrap(dir: "doc", ds(
  [Một sợi dây thép dài $20$ m được cắt làm hai phần. Phần thứ nhất được uốn thành một hình vuông cạnh $a$ (m), phần thứ hai được uốn thành một hình tròn bán kính $r$ (m). Đặt $x$ (m) là chiều dài phần dây thứ nhất ($0 < x < 20$). Để tổng diện tích của hình vuông và hình tròn là nhỏ nhất, xét tính đúng sai của các nhận định sau:],
  (
    True([Diện tích của hình vuông uốn được là $S_1 = x^2 / 16$ ($m^2$).]),
    True([Diện tích của hình tròn uốn được là $S_2 = (20 - x)^2 / (4pi)$ ($m^2$).]),
    True([Tổng diện tích của hai hình đạt giá trị nhỏ nhất khi $x = 80 / (pi + 4)$ (m).]),
    [Khi tổng diện tích đạt giá trị nhỏ nhất, diện tích hình vuông bằng diện tích hình tròn.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Chu vi hình vuông là $x$, suy ra cạnh hình vuông là $a = x/4$. Diện tích hình vuông là $S_1 = a^2 = x^2 / 16$.
    - b) Đúng. Chu vi hình tròn là $20 - x$, suy ra bán kính $r = (20 - x)/(2pi)$. Diện tích hình tròn là $S_2 = pi r^2 = pi ((20 - x)/(2pi))^2 = (20 - x)^2 / (4pi)$.
    - c) Đúng. Tổng diện tích là $S(x) = x^2/16 + (20-x)^2/(4pi)$. Đạo hàm: $S'(x) = x/8 - (20-x)/(2pi) = 0 <=> pi x - 4(20-x) = 0 <=> (pi+4)x = 80 <=> x = 80/(pi+4)$ m. Bảng biến thiên của tổng diện tích $S(x)$ trên khoảng $(0; 20)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $80 / (pi + 4)$, $20$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($approx 31.8$, $approx 14.0$, $25$),
        )
      ]
      Do độ cực tiểu duy nhất nên tổng diện tích nhỏ nhất khi $x = 80/(pi+4)$ m.
    - d) Sai. Tại $x = 80/(pi+4)$, ta có diện tích hình vuông là $S_1 = (20/(pi+4))^2 = 400/(pi+4)^2$, diện tích hình tròn là $S_2 = 100pi/(pi+4)^2$. Tỷ lệ $S_1 / S_2 = 4/pi approx 1.27$, hai diện tích không bằng nhau.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Một bức tường cao $2.7$ mét nằm song song và cách một tòa nhà cao tầng một khoảng $1$ mét. Một người muốn gác một chiếc thang thẳng tựa vào tường tòa nhà sao cho chân thang đứng ở trên mặt đất bên ngoài bức tường như hình vẽ. Chiều dài ngắn nhất của chiếc thang bằng bao nhiêu mét? (Lấy kết quả gần đúng đến 1 chữ số thập phân).
    #align(center)[#fig-ladder]
  ],
  [$5.0$],
  accent: c-book,
  loigiai: [
    #step[Gọi $theta$ là góc nghiêng của thang so với mặt đất ($0 < theta < pi/2$).]
    #step[Chiều dài chiếc thang có thể chia làm hai phần chặn bởi đỉnh hàng rào:
      $L(theta) = 2.7 / sin theta + 1 / cos theta$.]
    #step[Tính đạo hàm: $L'(theta) = -2.7 cos theta / sin^2 theta + sin theta / cos^2 theta = (sin^3 theta - 2.7 cos^3 theta) / (sin^2 theta cos^2 theta)$.]
    #step[Phương trình $L'(theta) = 0 <=> sin^3 theta = 2.7 cos^3 theta <=> tan^3 theta = 2.7 <=> tan theta = root(3, 2.7) approx 1.392$.]
    #step[Bảng biến thiên của hàm số $L(theta)$ trên khoảng $(0; pi/2)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $arctan(root(3, 2.7))$, $pi/2$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $approx 5.0$, $+oo$),
        )
      ]
      Do đó, chiều dài ngắn nhất của chiếc thang đạt được khi $tan theta = root(3, 2.7)$, xấp xỉ $5.0$ m.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Một cửa sổ dạng Norman (gồm phần dưới là hình chữ nhật, phần trên là hình bán nguyệt) có chu vi tổng cộng là $10$ mét. Bán kính $R$ của phần bán nguyệt (tính theo mét, làm tròn đến một chữ số thập phân) bằng bao nhiêu để diện tích cửa sổ đạt giá trị lớn nhất?],
  [$1.4$],
  accent: c-book,
  loigiai: [
    #step[Tương tự bài toán chu vi cửa sổ, ta thiết lập mối quan hệ chu vi:
      $P = 2R + 2y + pi R = 10 => y = 5 - (pi/2 + 1)R$ (với $y$ là chiều cao phần chữ nhật).]
    #step[Hàm số biểu diễn diện tích cửa sổ:
      $S(R) = 2R y + (pi R^2)/2 = 10R - (pi/2 + 2)R^2$.]
    #step[Bảng biến thiên của hàm số $S(R)$ trên khoảng $(0; 10 / (pi + 2))$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $10 / (pi + 4)$, $10 / (pi + 2)$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $50 / (pi + 4)$, $0$),
        )
      ]
      Do đó, diện tích lớn nhất khi bán kính đạt $R = 10 / (pi + 4) approx 1.4$ m.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Một doanh nghiệp sản xuất một mặt hàng với giá bán mỗi sản phẩm là $p(x) = 100 - 0.02 x$ (USD), trong đó $x$ là số lượng sản phẩm sản xuất ra. Chi phí để sản xuất $x$ sản phẩm là $C(x) = 50 + 20 x$ (USD). Doanh nghiệp cần sản xuất bao nhiêu sản phẩm để đạt được lợi nhuận lớn nhất?],
  [$2000$],
  accent: c-book,
  loigiai: [
    #step[Hàm doanh thu của doanh nghiệp khi bán ra $x$ sản phẩm là:
      $R(x) = x dot p(x) = x(100 - 0.02x) = 100x - 0.02x^2$.]
    #step[Hàm lợi nhuận của doanh nghiệp:
      $P(x) = R(x) - C(x) = 100x - 0.02x^2 - (50 + 20x) = -0.02x^2 + 80x - 50$.]
    #step[Bảng biến thiên của hàm số $P(x)$ trên khoảng $(0; 5000)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $2000$, $5000$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($-50$, $79950$, $-100050$),
        )
      ]
      Do đó, lợi nhuận lớn nhất đạt được khi sản xuất $2000$ sản phẩm.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Một người ở trên một chiếc thuyền tại vị trí $A$ cách bờ biển thẳng một khoảng cách $A H = 3$ km. Người đó muốn đến vị trí $B$ trên bờ biển cách $H$ một khoảng $10$ km. Vận tốc chèo thuyền của người đó là $4$ km/h, vận tốc đi bộ trên bờ là $5$ km/h. Hỏi thời gian ít nhất (tính theo giờ) để người đó đi từ $A$ đến $B$ là bao nhiêu?],
  [$2.45$],
  accent: c-book,
  loigiai: [
    #step[Đặt $x = H C$ ($0 <= x <= 10$, đơn vị: km) là khoảng cách từ hình chiếu $H$ đến điểm cập bờ $C$.]
    #step[Chiều dài đoạn chèo thuyền: $A C = sqrt(x^2 + 3^2) = sqrt(x^2 + 9)$ (km).]
    #step[Chiều dài đoạn đi bộ dọc bờ biển: $C B = 10 - x$ (km).]
    #step[Hàm tổng thời gian di chuyển (giờ):
      $T(x) = sqrt(x^2 + 9) / 4 + (10 - x) / 5$.]
    #step[Đạo hàm: $T'(x) = x / (4 sqrt(x^2 + 9)) - 1/5$.]
    #step[Phương trình $T'(x) = 0 <=> 5x = 4 sqrt(x^2 + 9) <=> 25x^2 = 16(x^2 + 9) <=> 9x^2 = 144 <=> x = 4$ km (thỏa mãn).]
    #step[Bảng biến thiên của hàm số $T(x)$ trên đoạn $[0; 10]$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $4$, $10$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($2.75$, $2.45$, $approx 2.61$),
        )
      ]
      Vậy thời gian di chuyển ngắn nhất là $2.45$ giờ.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Một tờ giấy hình chữ nhật có chiều rộng $20$ cm. Người ta gấp góc dưới bên phải của tờ giấy sao cho đỉnh góc đó chạm vào cạnh bên trái của tờ giấy như hình vẽ. Chiều dài ngắn nhất của nếp gấp là bao nhiêu cm? (Lấy kết quả gần đúng đến 1 chữ số thập phân).
    #align(center)[#fig-fold]
  ],
  [$26.0$],
  accent: c-book,
  loigiai: [
    #step[Gọi chiều rộng tờ giấy là $a = 20$ cm. Gọi $theta$ là góc của nếp gấp so với cạnh dưới của tờ giấy.]
    #step[Theo công thức hình học nếp gấp trang giấy, chiều dài nếp gấp $L$ liên hệ với góc $theta$ qua hệ thức:
      $L(theta) = a / (2 sin theta cos^2 theta)$ với $0 < theta < pi/2$.]
    #step[Để tìm $L$ nhỏ nhất, ta cần tìm giá trị lớn nhất của hàm số mẫu số: $f(theta) = sin theta cos^2 theta = sin theta (1 - sin^2 theta)$.]
    #step[Đặt $t = sin theta$ ($0 < t < 1$). Ta tìm cực trị của hàm $g(t) = t - t^3$ trên khoảng $(0; 1)$.]
    #step[Đạo hàm: $g'(t) = 1 - 3t^2 = 0 <=> t = 1/sqrt(3)$.]
    #step[Bảng biến thiên của hàm số $g(t)$ trên khoảng $(0; 1)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $1 / sqrt(3)$, $1$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $2 / (3 sqrt(3))$, $0$),
        )
      ]
      Do đó, $g(t)$ đạt giá trị lớn nhất tại $t = 1/sqrt(3)$.]
    #step[Chiều dài nếp gấp nhỏ nhất là:
      $L_(min) = a / (2 dot (2 / (3 sqrt(3)))) = (3 sqrt(3)) / 4 a = (3 sqrt(3)) / 4 (20) = 15 sqrt(3) approx 25.98$ cm, làm tròn thành $26.0$ cm.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Một chiếc hộp không nắp có đáy là hình vuông, thể tích của hộp là 32 cm³. Tìm diện tích toàn phần nhỏ nhất của chiếc hộp (theo cm²).],
  [$48$],
  accent: c-book,
  loigiai: [
    #step[Gọi cạnh đáy của chiếc hộp hình vuông là $x$ (cm, $x > 0$), chiều cao của hộp là $y$ (cm, $y > 0$).]
    #step[Thể tích hộp: $V = x^2 y = 32 => y = 32 / x^2$.]
    #step[Do hộp không có nắp nên diện tích toàn phần của hộp chỉ gồm diện tích đáy và 4 mặt bên:
      $S(x) = x^2 + 4x y = x^2 + 4x (32 / x^2) = x^2 + 128 / x$.]
    #step[Đạo hàm: $S'(x) = 2x - 128 / x^2$.]
    #step[Phương trình $S'(x) = 0 <=> 2x^3 = 128 <=> x^3 = 64 <=> x = 4$ cm.]
    #step[Bảng biến thiên của hàm số $S(x)$ trên khoảng $(0; +oo)$:
      #align(center)[
        #my-bbbt(
          x-vals: ($0$, $4$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $48$, $+oo$),
        )
      ]
      Do đó, diện tích toàn phần nhỏ nhất là $48$ cm² đạt được khi $x = 4$ cm.]
  ],
))
