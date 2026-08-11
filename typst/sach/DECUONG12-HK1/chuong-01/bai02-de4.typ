#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


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

#muc([Đề Luyện Tập Số 04])

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
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

#tln(
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

#tln(
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

#tln(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
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

#tln(
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

#tln(
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

#resetcau()
#exam-part([PHẦN IV. Bài tập bổ sung (Cắt ghép, gấp hình)], count: 3)

#tln(
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

#tln(
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

#tln(
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
