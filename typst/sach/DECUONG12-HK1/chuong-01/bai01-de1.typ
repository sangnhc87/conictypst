#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

// #show: doc-setup
#muc([Đề Luyện Tập Số 01])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (35 câu)], count: 35)

#tn(
  dir: "ngang",
  [Hàm số nào sau đây đồng biến trên $RR$?],
  (
    [$y = x^3 - 3x^2 - 1$],
    True([$y = x^3 - x^2 + 6x - 1$]),
    [$y = (x - 2)/(x + 1)$],
    [$y = x^4 + 2x^2 - 1$]
  ),
  loigiai: [
    #step[Xét đáp án A: $y = x^3 - 3x^2 - 1$, có đạo hàm $y' = 3x^2 - 6x$. Cho $y' = 0 <=> x = 0$ hoặc $x = 2$. Hàm số có khoảng nghịch biến nên không đồng biến trên $RR$.]
    #step[Xét đáp án B: $y = x^3 - x^2 + 6x - 1$, có đạo hàm $y' = 3x^2 - 2x + 6$. Phương trình $y' = 0$ vô nghiệm và $a = 3 > 0$ nên $y' > 0, forall x in RR$. Do đó, hàm số đồng biến trên $RR$.]
    #step[Xét đáp án C: $y = (x - 2)/(x + 1)$, có tập xác định $D = RR \\ {-1}$. Đạo hàm $y' = 3 / (x+1)^2 > 0, forall x != -1$. Hàm số đồng biến trên các khoảng $(-oo; -1)$ và $(-1; +oo)$, không đồng biến trên $RR$.]
    #step[Xét đáp án D: $y = x^4 + 2x^2 - 1$, có đạo hàm $y' = 4x^3 + 4x$. Cho $y' = 0 <=> x = 0$. Hàm số nghịch biến trên $(-oo; 0)$ và đồng biến trên $(0; +oo)$, nên không đồng biến trên $RR$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)
#tn(
  dir: "doc",lines:0,
  [Cho hàm số $f(x)$ có bảng xét dấu của đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-3$, $1$, $+oo$),
        f-signs: ("+", "0", "+", "0", "-"),
        w1: 1.5,
        w2:8,
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    True([$(2; +oo)$]),
    [$(-oo; -2)$],
    [$(-2; +oo)$],
    [$(-2; 1)$]
  ),
  loigiai: [
    #step[Từ bảng xét dấu, ta thấy $f'(x) < 0$ trên khoảng $(1; +oo)$. Do đó, hàm số $f(x)$ nghịch biến trên khoảng $(1; +oo)$. Vì khoảng $(2; +oo)$ là một tập con của $(1; +oo)$ nên hàm số cũng nghịch biến trên khoảng $(2; +oo)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  fig: canvas(length: 1cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -0.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.15, -0.15), $O$)
    
    // Đường nét đứt cực trị
    line((-1, 0), (-1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, 0), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 2), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Nhãn trục
    content((-1, -0.25), $-1$)
    content((1, -0.25), $1$)
    content((-0.25, 2.0), $2$, anchor: "east")
    content((0.2, 0.8), $1$)
    
    // Đồ thị y = -x^4 + 2x^2 + 1
    let pts = ()
    for i in range(-16, 17) {
      let x = i / 10
      let y = -calc.pow(x, 4) + 2 * calc.pow(x, 2) + 1
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = f(x)$ có đồ thị là đường cong hình bên dưới. Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    [$(-1; 1)$],
    True([$(1; +oo)$]),
    [$(0; 1)$],
    [$(-1; +oo)$]
  ),
  loigiai: [
    #step[Dựa vào đồ thị hàm số, ta thấy trên các khoảng $(-1; 0)$ và $(1; +oo)$ đồ thị có hướng đi xuống từ trái sang phải. Do đó, hàm số nghịch biến trên các khoảng $(-1; 0)$ và $(1; +oo)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines:4,
  [Cho hàm số $y = (-x + 2)/(x - 1)$, khẳng định nào dưới đây là khẳng định đúng?],
  (
    [Hàm số nghịch biến trên khoảng $(-oo; 1) union (1; +oo)$.],
    True([Hàm số nghịch biến trên mỗi khoảng $(-oo; 1)$ và $(1; +oo)$.]),
    [Hàm số nghịch biến trên $RR$.],
    [Hàm số đồng biến trên mỗi khoảng $(-oo; 1)$ và $(1; +oo)$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {1}$.]
    #step[Đạo hàm:
      $ y' = ((-1) dot (-1) - 1 dot 2) / (x - 1)^2 = -1 / (x - 1)^2 < 0, quad forall x in D $]
    #step[Bảng biến thiên:]
    #align(center)[
    #my-bbbt(
      var: $x$, der: $y'$, func: $y$, x-vals: ($-oo$, $1$, $+oo$), d-signs: ("-", "||", "-"), v-vals: ($-1$, ($-oo$, $+oo$), $-1$), ranks: (0, (-1, 0), 0)
    )
    ]
    #step[Dựa vào bảng biến thiên, ta thấy hàm số nghịch biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$. Lưu ý: Không dùng ký hiệu $union$ hay $RR \\ {1}$ để kết luận khoảng đơn điệu.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-1.8, 0), (4.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((4.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.8), (0, 1.2), mark: (end: ">"), stroke: 0.5pt)
    content((0, 1.2), $y$, anchor: "west", padding: 2pt)
    content((0.2, 0.2), $O$)
    
    // Nhãn trục
    content((-1, 0.25), $-1$)
    content((1, 0.25), $1$)
    content((2.1, 0.25), $2$)
    content((3, 0.25), $3$)
    content((-0.3, -2), $-2$)
    content((-0.3, -4), $-4$)
    
    // Đường nét đứt
    line((1, 0), (1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -2), (1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((3, 0), (3, -4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -4), (3, -4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Đồ thị y = -x^3 + 3x^2 - 4
    let pts = ()
    for i in range(-22, 62) {
      let x = i / 20
      let y = -calc.pow(x, 3) + 3 * calc.pow(x, 2) - 4
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = f(x) = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ dưới đây. Hàm số $y = f(x)$ đồng biến trên khoảng nào?],
  (
    [$(-1; 1)$],
    [$(-oo; -1)$],
    [$(2; +oo)$],
    True([$(0; 1)$])
  ),
  loigiai: [
    #step[Dựa vào đồ thị hàm số, ta thấy trên khoảng $(0; 2)$ đồ thị hàm số đi lên (từ trái sang phải). Do đó, hàm số đồng biến trên khoảng $(0; 2)$. Vì $(0; 1) subset (0; 2)$ nên hàm số cũng đồng biến trên khoảng $(0; 1)$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = 2x^3 - 2x^2 - 2x + 1$ đồng biến trên khoảng nào sau đây?],
  (
    [$(-1; 1)$],
    [$(-oo; 1)$],
    [$(0; 2)$],
    True([$(1; 2)$])
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = 6x^2 - 4x - 2$. Cho $y' = 0 <=> 6x^2 - 4x - 2 = 0 <=> x = 1$ hoặc $x = -1/3$. Bảng xét dấu $y'$:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $-1/3$, $1$, $+oo$), f-signs: ("+", "0", "-", "0", "+")
    )
    ]
    #step[Hàm số đồng biến trên các khoảng $(-oo; -1/3)$ và $(1; +oo)$. Vì $(1; 2) subset (1; +oo)$ nên hàm số đồng biến trên khoảng $(1; 2)$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = (x + 3)/(x - 2)$ nghịch biến trên khoảng nào sau đây?],
  (
    [$(-2; 3)$],
    [$(-oo; 3)$],
    [$(-oo; +oo)$],
    True([$(3; +oo)$])
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {2}$.]
    #step[Đạo hàm: $y' = (1 dot (-2) - 1 dot 3) / (x - 2)^2 = -5 / (x - 2)^2 < 0, quad forall x != 2$. Hàm số nghịch biến trên các khoảng $(-oo; 2)$ và $(2; +oo)$. Vì $(3; +oo) subset (2; +oo)$ nên hàm số nghịch biến trên khoảng $(3; +oo)$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  [Cho hàm số $f(x)$ có bảng xét dấu của đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-3$, $0$, $2$, $+oo$),
        f-signs: ("+", "0", "-", "0", "+", "0", "-")
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    True([$(-3; 0)$]),
    [$(0; +oo)$],
    [$(0; 2)$],
    [$(-oo; -3)$]
  ),
  loigiai: [
    #step[Từ bảng xét dấu, ta thấy $f'(x) < 0$ trên các khoảng $(-3; 0)$ và $(2; +oo)$. Do đó, hàm số nghịch biến trên các khoảng $(-3; 0)$ và $(2; +oo)$. Đối chiếu các đáp án, ta thấy đáp án A là đúng.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = (x + 2)/(x - 1)$. Xét các mệnh đề sau:\
    1) Hàm số đã cho đồng biến trên $(1; +oo)$. \
    2) Hàm số đã cho nghịch biến trên $RR \\ {1}$. \
    3) Hàm số đã cho không có điểm cực trị. \
    4) Hàm số đã cho nghịch biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$. \
    Số các mệnh đề *đúng* là],
  (
    [$4$],
    True([$2$]),
    [$3$],
    [$1$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {1}$.]
    #step[Đạo hàm: $y' = (1 dot (-1) - 1 dot 2) / (x - 1)^2 = -3 / (x - 1)^2 < 0, quad forall x != 1$. Do đó, hàm số nghịch biến trên từng khoảng xác định là $(-oo; 1)$ và $(1; +oo)$, hàm số không có cực trị. Xét các mệnh đề: Mệnh đề 1) sai vì hàm số nghịch biến. Mệnh đề 2) sai vì không được dùng ký hiệu $RR \\ {1}$ khi kết luận khoảng đơn điệu. Mệnh đề 3) đúng vì đạo hàm luôn âm, không đổi dấu. Mệnh đề 4) đúng. Vậy có $2$ mệnh đề đúng là mệnh đề 3) và 4).]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x + 1)(2x - 5)^2$ với mọi $x in RR$. Hàm số đã cho nghịch biến trên khoảng nào?],
  (
    True([$(-oo; -1)$]),
    [$(-1; 3)$],
    [$(-1; +oo)$],
    [$(-3; 1)$]
  ),
  loigiai: [
    #step[Ta có $f'(x) = 0 <=> x = -1$ hoặc $x = 5/2$. Trong đó, $x = 5/2$ là nghiệm kép (do xuất hiện ở cụm mũ chẵn $(2x-5)^2$) nên qua $x=5/2$ thì $f'(x)$ không đổi dấu; $x = -1$ là nghiệm đơn (mũ lẻ) nên qua đó $f'(x)$ đổi dấu.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $f'(x)$, x-vals: ($-oo$, $-1$, $5/2$, $+oo$), f-signs: ("-", "0", "+", "0", "+")
    )
    ]
    #step[Hàm số nghịch biến trên khoảng $(-oo; -1)$ và đồng biến trên khoảng $(-1; +oo)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  [Cho hàm số $y = f(x)$ có bảng xét dấu đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $y'$,
        x-vals: ($-oo$, $-2$, $0$, $2$, $+oo$),
        f-signs: ("+", "0", "-", "||", "-", "0", "+")
      )
    ]
    Mệnh đề nào dưới đây đúng?],
  (
    [Hàm số nghịch biến trên khoảng $(-oo; -2)$.],
    [Hàm số đồng biến trên khoảng $(-2; 0)$.],
    [Hàm số đồng biến trên khoảng $(-oo; 0)$.],
    True([Hàm số nghịch biến trên khoảng $(0; 2)$.])
  ),
  loigiai: [
    #step[Từ bảng xét dấu đạo hàm, ta thấy: $y' > 0$ trên các khoảng $(-oo; -2)$ và $(2; +oo)$ nên hàm số đồng biến trên các khoảng này. $y' < 0$ trên các khoảng $(-2; 0)$ và $(0; 2)$ nên hàm số nghịch biến trên các khoảng này. Xét các mệnh đề, ta thấy mệnh đề "Hàm số nghịch biến trên khoảng $(0; 2)$" là đúng.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = -x^4 + 8x^2 + 6$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(-2; 0)$ và $(2; +oo)$],
    True([$(-oo; -2)$ và $(0; 2)$]),
    [$(-oo; -2)$ và $(2; +oo)$],
    [$(-2; 2)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = -4x^3 + 16x = -4x(x^2 - 4)$. Cho $y' = 0 <=> x = 0$ hoặc $x = 2$ hoặc $x = -2$.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $-2$, $0$, $2$, $+oo$), f-signs: ("+", "0", "-", "0", "+", "0", "-")
    )
    ]
    #step[Hàm số đồng biến trên các khoảng $(-oo; -2)$ và $(0; 2)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
 dir: "doc",lines:0,
  [Cho hàm số $y = f(x)$ có bảng xét dấu của đạo hàm $f'(x)$ trên $RR$ như hình vẽ:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-1$, $+oo$),
        f-signs: ("-", "0", "+")
      )
    ]
    Hàm số $y = f(x)$ đồng biến trên khoảng],
  (
    [$(-oo; -1)$],
    [$RR$],
    True([$(-1; +oo)$]),
    [$(-2; +oo)$]
  ),
  loigiai: [
    #step[Dựa vào bảng xét dấu, ta thấy $f'(x) > 0$ trên khoảng $(-1; +oo)$. Do đó, hàm số đồng biến trên khoảng $(-1; +oo)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = x^4 + x^2 - 2$ nghịch biến trên khoảng nào trong các khoảng sau?],
  (
    True([$(-oo; 0)$]),
    [$(-2; 1)$],
    [$(0; +oo)$],
    [$(0; 2)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = 4x^3 + 2x = 2x(2x^2 + 1)$. Cho $y' = 0 <=> x = 0$ (vì $2x^2 + 1 > 0, forall x in RR$).]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $0$, $+oo$), f-signs: ("-", "0", "+")
    )
    ]
    #step[Dựa vào bảng xét dấu, hàm số nghịch biến trên khoảng $(-oo; 0)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines:2,
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = -x + 2$ với mọi $x in RR$. Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    [$(-oo; +oo)$],
    True([$(2; +oo)$]),
    [$(-oo; 2)$],
    [$(0; +oo)$]
  ),
  loigiai: [
    #step[Hàm số nghịch biến khi $f'(x) < 0$.]
    #step[Ta có: $-x + 2 < 0 <=> x > 2$. Vậy hàm số nghịch biến trên khoảng $(2; +oo)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  [Cho hàm số $f(x)$ có bảng xét dấu của đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-3$, $0$, $2$, $+oo$),
        f-signs: ("+", "0", "-", "0", "+", "0", "-"),
        w2:8,
        w1: 1.5,
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    True([$(-3; 0)$]),
    [$(0; +oo)$],
    [$(0; 2)$],
    [$(-oo; -3)$]
  ),
  loigiai: [
    #step[Từ bảng xét dấu, ta thấy $f'(x) < 0$ trên các khoảng $(-3; 0)$ và $(2; +oo)$. Do đó, hàm số nghịch biến trên các khoảng $(-3; 0)$ và $(2; +oo)$. Đối chiếu các đáp án, ta thấy đáp án A là đúng.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $ f'(x) = (x + 1)(x - 1)^4 (2 - x) $. Mệnh đề nào dưới đây đúng?],
  (
    [$f(5) > f(4) > f(3)$],
    [$f(-1) > f(0) > f(1)$],
    [$f(-3) < f(-2) < f(-1)$],
    True([$f(0) < f(1) < f(2)$])
  ),
  loigiai: [
    #step[Ta có $f'(x) = 0 <=> x = -1$, $x = 1$ hoặc $x = 2$. Trong đó $x = 1$ là nghiệm bội $4$ (mũ chẵn) nên $f'(x)$ không đổi dấu khi đi qua $x=1$; còn $x=-1$ và $x=2$ là các nghiệm bội lẻ. Bảng xét dấu $f'(x)$:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $f'(x)$, x-vals: ($-oo$, $-1$, $1$, $2$, $+oo$), f-signs: ("-", "0", "+", "0", "+", "0", "-")
    )
    ]
    #step[Suy ra hàm số đồng biến trên khoảng $(-1; 2)$ và nghịch biến trên các khoảng $(-oo; -1)$, $(2; +oo)$. Vì $0, 1, 2 in [-1; 2$ và hàm số đồng biến trên đoạn này nên $f(0) < f(1) < f(2)$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $f(x)$ xác định trên $RR$ và có đạo hàm $ f'(x) = (2 - x)(x + 1)^2 (x - 1)^5 $. Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    [$(-oo; 2)$],
    True([$(2; +oo)$]),
    [$(-1; 2)$],
    [$(1; +oo)$]
  ),
  loigiai: [
    #step[Ta có $f'(x) = 0 <=> x = 2$, $x = -1$ hoặc $x = 1$. Trong đó $x = -1$ là nghiệm bội chẵn, còn $x = 1$ và $x = 2$ là nghiệm bội lẻ. Bảng xét dấu $f'(x)$:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $f'(x)$, x-vals: ($-oo$, $-1$, $1$, $2$, $+oo$), f-signs: ("-", "0", "-", "0", "+", "0", "-")
    )
    ]
    #step[Hàm số nghịch biến trên các khoảng $(-oo; 1)$ và $(2; +oo)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines:6,
  [Cho hàm số $y = (2026x - 22)/(x + 1)$. Khẳng định nào dưới đây là *sai*?],
  (
    True([Hàm số đồng biến trên khoảng $(-oo; 1)$]),
    [Hàm số đồng biến trên khoảng $(-oo; -1)$.],
    [Hàm số đồng biến trên khoảng $(1; 2026)$.],
    [Hàm số đồng biến trên khoảng $(-1; 2026)$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {-1}$.]
    #step[Đạo hàm: $y' = (2026 dot 1 - (-22) dot 1) / (x + 1)^2 = 2048 / (x + 1)^2 > 0, quad forall x != -1$. Hàm số đồng biến trên mỗi khoảng $(-oo; -1)$ và $(-1; +oo)$. Xét các đáp án: Đáp án A: Khoảng $(-oo; 1)$ chứa điểm $x = -1$ mà hàm số không xác định tại đó, nên không thể đồng biến trên cả khoảng này. Khẳng định A sai. Khoảng $(1; 2026)$ và $(-1; 2026)$ đều là con của $(-1; +oo)$ nên hàm số đồng biến. Các khẳng định B, C, D đúng.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm khoảng nghịch biến của hàm số $y = f(x)$, biết $f'(x) = (x - 3)(x + 2)(x + 5)^2, forall x in RR$.],
  (
    [$(-oo; -5)$],
    True([$(-2; 3)$]),
    [$(-5; -2)$],
    [$(3; +oo)$]
  ),
  loigiai: [
    #step[Ta có $f'(x) = 0 <=> x = 3$, $x = -2$ hoặc $x = -5$. $x = -5$ là nghiệm bội kép, qua đó $f'(x)$ không đổi dấu. $x = -2$ và $x = 3$ là nghiệm đơn, $f'(x)$ đổi dấu.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $f'(x)$, x-vals: ($-oo$, $-5$, $-2$, $3$, $+oo$), f-signs: ("+", "0", "+", "0", "-", "0", "+")
    )
    ]
    #step[Hàm số nghịch biến trên khoảng $(-2; 3)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = -x^4 + 2x^2 + 1$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(0; +oo)$],
    True([$(-oo; -1)$]),
    [$(1; +oo)$],
    [$(-oo; 0)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = -4x^3 + 4x = -4x(x^2 - 1)$. Cho $y' = 0 <=> x = 0$ hoặc $x = 1$ hoặc $x = -1$. Bảng xét dấu $y'$:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$), f-signs: ("+", "0", "-", "0", "+", "0", "-")
    )
    ]
    #step[Hàm số đồng biến trên các khoảng $(-oo; -1)$ và $(0; 1)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = sqrt(8 + 2x - x^2)$ đồng biến trên khoảng nào sau đây?],
  (
    [$(1; +oo)$],
    [$(-oo; 1)$],
    True([$(-2; 1)$]),
    [$(1; 4)$]
  ),
  loigiai: [
    #step[Điều kiện xác định: $8 + 2x - x^2 >= 0 <=> -2 <= x <= 4$. Vậy tập xác định là $D = [-2; 4$.]
    #step[Đạo hàm: $y' = (2 - 2x) / (2 sqrt(8 + 2x - x^2)) = (1 - x) / sqrt(8 + 2x - x^2), quad forall x in (-2; 4)$. Cho $y' = 0 <=> 1 - x = 0 <=> x = 1$.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-2$, $1$, $4$), f-signs: ("+", "0", "-")
    )
    ]
    #step[Hàm số đồng biến trên khoảng $(-2; 1)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-3.8, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -4.8), (0, 1.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 1.8), $y$, anchor: "west", padding: 2pt)
    content((0.2, 0.2), $O$)
    
    // Đường nét đứt
    line((-3, 0), (-3, -4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -4), (-3, -4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 0), (-1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -2), (-1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Nhãn trục
    content((-3, 0.25), $-3$)
    content((-2.2, 0.25), $-2$)
    content((-1, 0.25), $-1$)
    content((1, -0.25), $1$)
    content((0.25, -2), $-2$)
    content((0.25, -4), $-4$)
    
    // Đồ thị y = (x+2)^2 * (x-1)
    let pts = ()
    for i in range(-61, 24) {
      let x = i / 20
      let y = calc.pow(x + 2, 2) * (x - 1)
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    content((0.7, 0.9), $y = f'(x)$)
  }),
  fig-pos: "right",
  fig-width: 38%,
  [Cho hàm số $y = f(x)$ có đạo hàm trên $RR$ và hàm số $y = f'(x)$ là hàm số bậc ba có đồ thị là đường cong trong hình vẽ. \
  Hàm số $y = f(x)$ nghịch biến trên],
  (
    True([$( -oo; 1 )$]),
    [$( -2; 0 )$],
    [$( 1; +oo )$],
    [$( -1; +oo )$]
  ),
  loigiai: [
    #step[Dựa vào đồ thị của $y = f'(x)$, ta thấy: $f'(x) < 0$ khi $x < 1$ (với $x != -2$ thì đồ thị nằm hoàn toàn dưới trục hoành, tại $x = -2$ thì $f'(x) = 0$ nhưng không đổi dấu). $f'(x) > 0$ khi $x > 1$. Do đó hàm số $y = f(x)$ nghịch biến trên khoảng $(-oo; 1)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines: 2, 
  [Hàm số $y = (x - 7)/(x + 4)$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(-oo; +oo)$],
    [$(-6; 0)$],
    True([$(1; 4)$]),
    [$(-5; 1)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {-4}$.]
    #step[Đạo hàm: $y' = (1 dot 4 - 1 dot (-7)) / (x + 4)^2 = 11 / (x + 4)^2 > 0, quad forall x != -4$. Hàm số đồng biến trên các khoảng $(-oo; -4)$ và $(-4; +oo)$. Vì khoảng $(1; 4) subset (-4; +oo)$ nên hàm số đồng biến trên khoảng $(1; 4)$. Khoảng $(-6; 0)$ chứa điểm $x = -4$ nên không thỏa mãn.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines: 2,
  [Cho hàm số $y = (x^2 - 2x + 5)/(x - 1)$. Hàm số đồng biến trên khoảng nào sau đây?],
  (
    [$(-oo; 5)$],
    [$(-3; +oo)$],
    True([$(3; +oo)$]),
    [$(-3; 5)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {1}$.]
    #step[Đạo hàm: $y' = ((2x - 2)(x - 1) - (x^2 - 2x + 5) dot 1) / (x - 1)^2 = (x^2 - 2x - 3) / (x - 1)^2$. Cho $y' = 0 <=> x^2 - 2x - 3 = 0 <=> x = -1$ hoặc $x = 3$.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $-1$, $1$, $3$, $+oo$), f-signs: ("+", "0", "-", "||", "-", "0", "+")
    )
    ]
    #step[Dựa vào bảng xét dấu, hàm số đồng biến trên các khoảng $(-oo; -1)$ và $(3; +oo)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines: 2,
  [Hàm số $y = (2x+3)/(x+1)$ có bao nhiêu điểm cực trị?],
  (
    [$3$],
    [$2$],
    True([$0$]),
    [$1$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {-1}$.]
    #step[Đạo hàm: $y' = (2 dot 1 - 3 dot 1) / (x + 1)^2 = -1 / (x + 1)^2 < 0, quad forall x != -1$. Vì đạo hàm luôn âm trên từng khoảng xác định và không đổi dấu, nên hàm số không có cực trị.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = f(x)$ có đạo hàm là $f'(x) = (x - 1)^2 (3 - x) (x^2 - x - 1)$. Hỏi hàm số $f(x)$ có bao nhiêu cực tiểu?],
  (
    True([$1$]),
    [$3$],
    [$0$],
    [$2$]
  ),
  loigiai: [
    #step[Ta có $f'(x) = 0 <=> x = 1$ hoặc $x = 3$ hoặc $x^2 - x - 1 = 0 <=> x = (1 pm  sqrt(5))/2$. Trong đó $x = 1$ là nghiệm bội chẵn, còn $x = 3$, $x_1 = (1 - sqrt(5))/2$ và $x_2 = (1 + sqrt(5))/2$ là ba nghiệm đơn. Sắp xếp các nghiệm theo thứ tự tăng dần: $x_1 < 1 < x_2 < 3$.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $f'(x)$, x-vals: ($-oo$, $(1 - sqrt(5))/2$, $1$, $(1 + sqrt(5))/2$, $3$, $+oo$), f-signs: ("+", "0", "-", "0", "-", "0", "+", "0", "-")
    )
    ]
    #step[Đạo hàm đổi dấu từ âm sang dương $1$ lần (tại $x = (1 + sqrt(5))/2$) nên hàm số có $1$ điểm cực tiểu.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị cực tiểu của hàm số $y = -x^3 + 3x + 4$.],
  (
    True([$y_("CT") = 2$]),
    [$y_("CT") = 1$],
    [$y_("CT") = 6$],
    [$y_("CT") = -1$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = -3x^2 + 3$. Cho $y' = 0 <=> -3x^2 + 3 = 0 <=> x = -1$ hoặc $x = 1$.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $-1$, $1$, $+oo$), f-signs: ("-", "0", "+", "0", "-")
    )
    ]
    #step[Hàm số đạt cực tiểu tại $x = -1$, giá trị cực tiểu là $y_("CT") = y(-1) = 2$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có $f'(x) = (x - 1)^2 (x^2 - 5x + 6)$. Số điểm cực trị của hàm số đã cho là],
  (
    [$5$],
    [$3$],
    True([$2$]),
    [$4$]
  ),
  loigiai: [
    #step[Ta có $f'(x) = 0 <=> x = 1$ hoặc $x^2 - 5x + 6 = 0 <=> x = 2$ hoặc $x = 3$. Nghiệm $x = 1$ là nghiệm bội chẵn (mũ $2$) nên qua đó $f'(x)$ không đổi dấu. Nghiệm $x = 2$ và $x = 3$ là các nghiệm đơn, qua đó $f'(x)$ đổi dấu. Hàm số liên tục trên $RR$ và đạo hàm đổi dấu tại $2$ điểm nên có $2$ điểm cực trị.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x - 1)(2 - x)$, $forall x in RR$. Điểm cực đại của hàm số đã cho là],
  (
    [$x = 1$],
    [$x = -2$],
    True([$x = 2$]),
    [$x = -1$]
  ),
  loigiai: [
    #step[Ta có $f'(x) = 0 <=> (x - 1)(2 - x) = 0 <=> x = 1$ hoặc $x = 2$.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $f'(x)$, x-vals: ($-oo$, $1$, $2$, $+oo$), f-signs: ("-", "0", "+", "0", "-")
    )
    ]
    #step[Đạo hàm đổi dấu từ dương sang âm tại $x = 2$, do đó hàm số đạt cực đại tại $x = 2$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = x^3 - 3x^2 + 2$. Điểm cực tiểu của đồ thị hàm số có tọa độ là],
  (
    [$(2; 2)$],
    True([$(2; -2)$]),
    [$(0; -2)$],
    [$(0; 2)$]
  ),
  loigiai: [
        #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = 3x^2 - 6x = 3x(x - 2)$.]
    #step[Cho $y' = 0 <=> 3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Ta có $y'' = 6x - 6$. Tại $x = 2$, $y''(2) = 6(2) - 6 = 6 > 0$, do đó hàm số đạt cực tiểu tại $x = 2$.]
    #step[Tung độ điểm cực tiểu là $y(2) = 2^3 - 3(2^2) + 2 = -2$. Vậy điểm cực tiểu của đồ thị hàm số có tọa độ là $(2; -2)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $f(x)$ có đạo hàm $f'(x) = x - 1$, $forall x in RR$. Hỏi $f(x)$ có bao nhiêu điểm cực trị?],
  (
    [$0$],
    True([$1$]),
    [$2$],
    [$3$]
  ),
  loigiai: [
        #step[Ta có $f'(x) = x - 1 = 0 <=> x = 1$.]
    #step[Đạo hàm $f'(x)$ là nhị thức bậc nhất, đổi dấu từ âm sang dương khi đi qua nghiệm $x = 1$.]
    #step[Do đạo hàm đổi dấu đúng $1$ lần nên hàm số $y = f(x)$ có duy nhất $1$ điểm cực trị (điểm cực tiểu tại $x = 1$).]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Hàm số $y = f(x)$ có đạo hàm là $f'(x) = x^2 (x + 1)^2 (2x - 1)$. Số điểm cực trị của hàm số $y = f(x)$ là],
  (
    [$3$],
    [$0$],
    True([$1$]),
    [$2$]
  ),
  loigiai: [
        #step[Ta có $f'(x) = 0 <=> x^2 (x + 1)^2 (2x - 1) = 0 <=> x = 0$, $x = -1$, hoặc $x = 1/2$.]
    #step[Lưu ý rằng $x = 0$ và $x = -1$ là các nghiệm bội chẵn (mũ 2), nên $f'(x)$ không đổi dấu khi qua các nghiệm này. Hàm số không đạt cực trị tại $x = 0$ và $x = -1$.]
    #step[Nghiệm $x = 1/2$ là nghiệm bội lẻ (mũ 1), đạo hàm $f'(x)$ đổi dấu khi đi qua điểm này.]
    #step[Vậy hàm số $y = f(x)$ chỉ có đúng $1$ điểm cực trị tại $x = 1/2$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  [Cho hàm số $y = f(x)$ có bảng xét dấu của đạo hàm như hình bên dưới:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-3$, $1$, $3$, $+oo$),
        f-signs: ("-", "0", "+", "0", "-", "0", "+")
      )
    ]
    Số điểm cực tiểu của hàm số $y = f(x)$ là],
  (
    [$3$],
    [$4$],
    True([$2$]),
    [$1$]
  ),
  loigiai: [
    #step[Dựa vào bảng xét dấu, ta thấy $f'(x)$ đổi dấu từ âm sang dương khi đi qua $x = -3$ và $x = 3$.]
    #step[Do đó, hàm số đạt cực tiểu tại $x = -3$ và $x = 3$.]
    #step[Vậy hàm số có $2$ điểm cực tiểu.]
  ]
)

#tn(
  dir: "doc",lines:0,
  fig: canvas(length: 0.68cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-0.8, 0), (5.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.8), (0, 4.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.5), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.25), $O$)
    
    // Đồ thị y = f'(x)
    let pts = ()
    for i in range(-3, 44) {
      let x = i / 10
      let y = -0.5 * calc.pow(x, 3) + 3 * calc.pow(x, 2) - 4.5 * x + 2.5
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $f(x) = a x^4 + b x^3 + c x^2 + d x + e$. Hàm số $y = f'(x)$ có đồ thị như hình vẽ bên dưới. Đồ thị hàm số $y = f(x)$ có tất cả bao nhiêu điểm cực trị?],
  (
    [$4$],
    [$2$],
    [$3$],
    True([$1$])
  ),
  loigiai: [
    #step[Từ đồ thị hàm số $y = f'(x)$, ta thấy đồ thị cắt trục hoành tại duy nhất một điểm (nghiệm đơn) và tiếp xúc trục hoành tại một điểm (nghiệm kép).]
    #step[Do đó, phương trình $f'(x) = 0$ chỉ có $1$ nghiệm bội lẻ.]
    #step[Vậy hàm số $y = f(x)$ có $1$ điểm cực trị.]
  ]
)

#resetcau()

#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (10 câu)], count: 10)

#ds(
  dir: "doc",lines:4,
  [Cho hàm số $y = f(x) = x^4 - 2x^2 + 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tập xác định của hàm số là $D = [0; +oo)$.],
    [Hàm số đồng biến trên khoảng $(-2; 0)$.],
    [Hàm số đồng biến trên $(-1/2; +oo)$.],
    True([Hàm số nghịch biến trên các khoảng $(-oo; -1)$ và $(0; 1)$.])
  ),
  loigiai: [
    #step[Tập xác định của hàm số đa thức là $D = RR$. Do đó mệnh đề]
    #step[a) sai.]
    #step[Đạo hàm: $y' = 4x^3 - 4x = 4x(x^2 - 1)$. Cho $y' = 0 <=> x = 0$ hoặc $x = 1$ hoặc $x = -1$.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$), f-signs: ("-", "0", "+", "0", "-", "0", "+")
    )
    ]
    #step[Hàm số đồng biến trên $(-1; 0)$ và $(1; +oo)$. Nghịch biến trên $(-oo; -1)$ và $(0; 1)$. Khoảng $(-2; 0)$ không phải là khoảng đồng biến (chứa khoảng $(-2; -1)$ nghịch biến). Mệnh đề]
    #step[b) sai. Khoảng $(-1/2; +oo)$ không phải là khoảng đồng biến (chứa khoảng $(0; 1)$ nghịch biến). Mệnh đề]
    #step[c) sai. Hàm số nghịch biến trên $(-oo; -1)$ và $(0; 1)$. Mệnh đề]
    #step[d) đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines:4,
  [Cho hàm số $y = (x - 1)/(x + 2)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tập xác định của hàm số là $D = RR$.],
    [Hàm số nghịch biến trên $RR \\ {-2}$.],
    [Hàm số đồng biến trên $RR \\ {-2}$.],
    True([Hàm số đồng biến trên các khoảng $(-oo; -2)$ và $(-2; +oo)$.])
  ),
  loigiai: [
    #step[Điều kiện xác định: $x + 2 != 0 <=> x != -2$. Tập xác định: $D = RR \\ {-2}$. Mệnh đề]
    #step[a) sai.]
    #step[Đạo hàm: $y' = (1 dot 2 - 1 dot (-1)) / (x + 2)^2 = 3 / (x + 2)^2 > 0, quad forall x != -2$. Hàm số đồng biến trên các khoảng $(-oo; -2)$ và $(-2; +oo)$. Ký hiệu $RR \\ {-2}$ không được dùng để chỉ tập hợp mà trên đó hàm số đồng biến/nghịch biến. Mệnh đề b),]
    #step[c) sai. Mệnh đề]
    #step[d) đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines:4,
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-1.8, 0), (3.8, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.8, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.8), $y$, anchor: "west", padding: 2pt)
    content((-0.2, 0.25), $O$)
    
    // Đường nét đứt
    line((2, 0), (2, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 2), (2, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Nhãn trục
    content((-1, 0.25), $-1$)
    content((2, -0.25), $2$)
    content((-0.25, 2), $2$)
    content((-0.3, -2), $-2$)
    
    // Đồ thị y = -7/9 x^3 + 19/9 x^2 + 8/9 x - 2
    let pts = ()
    for i in range(-12, 31) {
      let x = i / 10
      let y = -7/9 * calc.pow(x, 3) + 19/9 * calc.pow(x, 2) + 8/9 * x - 2
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên dưới. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số $y = f(x)$ đồng biến trên khoảng $(0; 2)$.]),
    True([Hàm số $y = f(x)$ nghịch biến trên mỗi khoảng $(-oo; 0)$ và $(2; +oo)$.]),
    [Với mọi $x in (0; 2)$ thì hàm số $y = f(x)$ luôn nhận giá trị dương.],
    True([Hàm số $y = f(-x)$ nghịch biến trên khoảng $(-2; 0)$.])
  ),
  loigiai: [
    #step[Dựa vào đồ thị $y = f(x)$, hàm số đi lên (đồng biến) trên khoảng $(0; 2)$. Mệnh đề]
    #step[a) đúng. Đồ thị đi xuống (nghịch biến) trên các khoảng $(-oo; 0)$ và $(2; +oo)$. Mệnh đề]
    #step[b) đúng. Trên khoảng $(0; 2)$, đồ thị có phần nằm dưới trục hoành (ví dụ tại $x = 0$, $y = -2$) nên $f(x)$ không luôn nhận giá trị dương. Mệnh đề]
    #step[c) sai. Xét hàm số $g(x) = f(-x)$. Ta có $g'(x) = -f'(-x)$. Với $x in (-2; 0)$ thì $-x in (0; 2)$. Khi đó $f'(-x) > 0$ (do $f(x)$ đồng biến trên $(0; 2)$). Suy ra $g'(x) < 0$, nên $g(x)$ nghịch biến trên $(-2; 0)$. Mệnh đề]
    #step[d) đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines:4,
  [Cho hàm số $y = (x^2 + x - 1)/(x - 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR \\ {1}$.]),
    True([Phương trình $y' = 0$ có hai nghiệm nguyên.]),
    [Hàm số đồng biến trên mỗi khoảng $(0; 1)$ và $(2; +oo)$.],
    True([Hàm số nghịch biến trên mỗi khoảng $(0; 1)$ và $(1; 2)$.])
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {1}$. Mệnh đề]
    #step[a) đúng.]
    #step[Đạo hàm: $y' = ((2x + 1)(x - 1) - (x^2 + x - 1) dot 1) / (x - 1)^2 = (x^2 - 2x) / (x - 1)^2$. Cho $y' = 0 <=> x^2 - 2x = 0 <=> x = 0$ hoặc $x = 2$ (đều là nghiệm nguyên). Vậy mệnh đề]
    #step[b) đúng.]
    #step[Bảng xét dấu:]
    #align(center)[
    #my-bxd(
      var: $x$, func: $y'$, x-vals: ($-oo$, $0$, $1$, $2$, $+oo$), f-signs: ("+", "0", "-", "||", "-", "0", "+")
    )
    ]
    #step[Hàm số nghịch biến trên khoảng $(0; 1)$ và $(1; 2)$. Do đó mệnh đề]
    #step[c) sai và mệnh đề]
    #step[d) đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines:4,
  [Cho hàm số $y = (x + 3)/(x - 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR \\ {1}$.]),
    [Hàm số đã cho đồng biến trên $RR \\ {1}$.],
    True([Đạo hàm của hàm số luôn nhỏ hơn $0$ với mọi $x != 1$.]),
    True([Hàm số đã cho không có cực trị.])
  ),
  loigiai: [
    #step[Tập xác định: $D = RR \\ {1}$.]
    #step[Đạo hàm: $y' = (-1 - 3) / (x - 1)^2 = (-4) / (x - 1)^2 < 0, forall x in D$.]
    #step[Do $y' < 0$ trên các khoảng $(-oo, 1)$ và $(1, +oo)$ nên hàm số nghịch biến trên từng khoảng xác định.]
    #step[Hàm số không có cực trị.]
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = sqrt(x^2 + 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số đạt cực đại tại $x = 0$.],
    [Hàm số không có cực trị.],
    True([Hàm số đạt cực tiểu tại $x = 0$.]),
    [Hàm số có hai điểm cực trị.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = x / sqrt(x^2 + 1)$. Cho $y' = 0 <=> x = 0$.]
    #step[Qua $x=0$, $y'$ đổi dấu từ âm sang dương nên hàm số đạt cực tiểu tại $x=0$ và không có cực đại.]
  ]
)


#ds(
  dir: "doc",lines:4,
  [Cho hàm số $y = -1/2 x^4 + x^2 + 1/2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số đạt cực tiểu tại $x = 0$, giá trị cực tiểu của hàm số là $y(0) = 0$.],
    [Hàm số đạt cực tiểu tại các điểm $x = pm 1$, giá trị cực tiểu của hàm số là $y(pm 1) = 1$.],
    [Hàm số đạt cực đại tại các điểm $x = pm 1$, giá trị cực đại của hàm số là $y(pm 1) = 1/2$.],
    True([Hàm số đạt cực tiểu tại $x = 0$, giá trị cực tiểu của hàm số là $y(0) = 1/2$.])
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = -2x^3 + 2x = -2x(x^2 - 1)$. Cho $y' = 0 <=> x = 0$ hoặc $x = pm 1$.]
    #step[Ta có $y(0) = 1/2$ và $y(pm 1) = 1$.]
    #step[Lập bảng xét dấu, ta thấy hàm số đạt cực tiểu tại $x=0$, $y_"CT" = y(0) = 1/2$ và đạt cực đại tại $x = pm 1$, $y_"CĐ" = y(pm 1) = 1$.]
  ]
)

#ds(
  dir: "doc",lines:4,
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-2.5, 0), (2.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.0), (0, 4.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.8), $y$, anchor: "west", padding: 2pt)
    content((0.15, -0.2), $O$)
    
    // Đường nét đứt
    line((-1, 0), (-1, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 4), (-1, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Nhãn trục
    content((-2, 0.25), $-2$)
    content((-1, -0.25), $-1$)
    content((1, -0.25), $1$)
    content((-0.2, 4), $4$, anchor: "east")
    content((0.2, 2.1), $2$)
    
    // Đồ thị y = x^3 - 3x + 2
    let pts = ()
    for i in range(-21, 21) {
      let x = i / 10
      let y = calc.pow(x, 3) - 3 * x + 2
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Cho hàm số $y = f(x)$ có đạo hàm liên tục trên $RR$ và hàm số $y = f'(x)$ có đồ thị như hình vẽ dưới đây. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số $y = f(x)$ đạt cực đại tại điểm $x = -1$ và giá trị cực đại là $y_("CĐ") = 4$.],
    [Hàm số $y = f(x)$ đạt cực tiểu tại điểm $x = 1$ và giá trị cực tiểu là $y_("CT") = 0$.],
    True([Hàm số $y = f(x)$ đạt cực tiểu tại điểm $x = -2$.]),
    [Hàm số $y = f(x)$ đạt cực đại tại điểm $x = -2$.]
  ),
  loigiai: [
    #step[Dựa vào đồ thị $y = f'(x)$, ta thấy đồ thị cắt trục hoành tại $x = -2$ (đổi dấu từ âm sang dương) và tiếp xúc với trục hoành tại $x = 1$ (không đổi dấu, luôn nằm trên hoặc cắt tiếp xúc). Do đạo hàm đổi dấu từ âm sang dương khi đi qua $x = -2$, hàm số đạt cực tiểu tại $x = -2$. Đạo hàm không đổi dấu khi đi qua $x = -1$ và $x = 1$ nên đây không phải là các điểm cực trị.]
    #step[Kết luận: Mệnh đề]
    #step[c) đúng, các mệnh đề a), b),]
    #step[d) sai.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines:4,
  [Cho hàm số $y = f(x)$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-2$, $0$, $1$, $+oo$),
        d-signs: ("-", "0", "+", "||", "+", "0", "-"),
        v-vals: ($+oo$, $-1$, ($2$, $-oo$), $2$, $-oo$),
        w1:1.5,
        w2:10,
        // ranks: (0, -1, (0, -2), 0, -2)
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Giá trị cực tiểu của hàm số bằng $-1$.]),
    True([Hàm số đạt cực tiểu tại $x = -2$.]),
    True([Giá trị cực đại của hàm số bằng $2$.]),
    [Hàm số đạt cực đại tại $x = 0$ và $x = 1$.]
  ),
  loigiai: [
    #step[Dựa vào bảng biến thiên, hàm số đạt cực tiểu tại $x = -2$, giá trị cực tiểu tương ứng là $y_("CT") = -1$. Do đó mệnh đề]
    #step[a) và]
    #step[b) đúng. Đạo hàm không xác định tại $x = 0$. Khi đi qua $x=0$, hàm số không liên tục và không xác định đỉnh cực đại hợp lệ. Tuy nhiên tại $x = 1$, đạo hàm bằng $0$ và đổi dấu từ dương sang âm, nên hàm số đạt cực đại tại $x = 1$ với giá trị cực đại $y_("CĐ") = 2$. "Giá trị cực đại của hàm số bằng $2$" là đúng. Mệnh đề]
    #step[c) đúng. "Hàm số đạt cực đại tại $x = 0$ và $x = 1$" là sai (chỉ đạt cực đại tại $x = 1$). Mệnh đề]
    #step[d) sai.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",
  [Xét một chất điểm chuyển động dọc theo trục $O x$. Tọa độ của chất điểm tại thời điểm $t$ được xác định bởi hàm số $x(t) = t^3 - 6t^2 + 9t$ với $t >= 0$. Khi đó $x'(t)$ là vận tốc của chất điểm tại thời điểm $t$, kí hiệu $v(t)$; $v'(t)$ là gia tốc chuyển động của chất điểm tại thời điểm $t$, kí hiệu $a(t)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Phương trình hàm vận tốc là $v(t) = 3t^2 - 6t + 9$.],
    True([Phương trình hàm gia tốc là $a(t) = 6t - 12$.]),
    [Vận tốc của chất điểm tăng khi $t in (0; 1) union (3; +oo)$.],
    [Vận tốc của chất điểm giảm khi $t in (1; 3)$.]
  ),
  loigiai: [
    #step[Vận tốc: $v(t) = x'(t) = 3t^2 - 12t + 9$. Vậy mệnh đề]
    #step[a) sai (vì thiếu hệ số 12). Gia tốc: $a(t) = v'(t) = 6t - 12$. Vậy mệnh đề]
    #step[b) đúng. Hàm vận tốc $v(t)$ tăng khi đạo hàm của nó dương, tức là $a(t) > 0 <=> 6t - 12 > 0 <=> t > 2$. Do đó vận tốc tăng trên khoảng $(2; +oo)$. Mệnh đề]
    #step[c) sai. Hàm vận tốc giảm khi $a(t) < 0 <=> 6t - 12 < 0 <=> 0 <= t < 2$. Do đó vận tốc giảm trên khoảng $(0; 2)$. Mệnh đề]
    #step[d) sai.]
    #resetstep()
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (7 câu)], count: 7)

#tln(
  dir: "ngang",
  [Cho hàm số $y = x^3 - 3x^2 + 5$ có đồ thị $(C)$. Tính độ dài đoạn thẳng nối hai điểm cực trị của đồ thị $(C)$.],
  [$2sqrt(5)$],
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = 3x^2 - 6x$.]
    #step[Cho $y' = 0 <=> 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Suy ra các điểm cực trị của đồ thị hàm số là: $A(0; 5)$ và $B(2; 1)$.]
    #step[Độ dài đoạn thẳng $A B = sqrt((2 - 0)^2 + (1 - 5)^2) = sqrt(4 + 16) = sqrt(20) = 2sqrt(5)$.]
    #step[Kết luận: $2sqrt(5)$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Biết hàm số $y = a x^3 + b x^2 + c x + d$ có hai điểm cực trị là $(-1; 18)$ và $(3; -16)$. Tính giá trị biểu thức $P = a + b + c + d$.],
  [$1$],
  loigiai: [
    #step[Đạo hàm $y' = 3a x^2 + 2b x + c$.]
    #step[Vì đồ thị có cực trị tại $x = -1$ và $x = 3$ nên $y'(-1) = 0$ và $y'(3) = 0$. Ta có hệ:
      $ cases(
        3a - 2b + c = 0 quad &(1),
        27a + 6b + c = 0 quad &(2)
      ) $]
    #step[Mặt khác, đồ thị đi qua hai điểm cực trị $(-1; 18)$ và $(3; -16)$ nên ta có:
      $ cases(
        -a + b - c + d = 18 quad &(3),
        27a + 9b + 3c + d = -16 quad &(4)
      ) $]
    #step[Giải hệ gồm (1), (2), (3), (4): Từ (1) và (2) suy ra $24a + 8b = 0 <=> b = -3a$, thay vào (1) được $c = -9a$.]
    #step[Thay $b = -3a, c = -9a$ vào (3) và (4) ta được:
      $ cases(
        5a + d = 18,
        -27a + d = -16
      ) $]
    #step[Giải hệ trên ta được $a = 17/16$, suy ra $b = -51/16$, $c = -153/16$, $d = 203/16$.]
    #step[Vậy $P = a + b + c + d = (17 - 51 - 153 + 203)/16 = 1$.]
    #step[Kết luận: $1$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Đồ thị của hàm số $y = x^3 - 3x^2 - 9x + 1$ có hai điểm cực trị là $A$ và $B$. Tính khoảng cách từ gốc tọa độ $O$ đến đường thẳng $A B$.],
  [$2/sqrt(65)$],
  loigiai: [
    #step[Ta có $y' = 3x^2 - 6x - 9$.]
    #step[Lấy $y$ chia cho $y'$, ta được phần dư chính là phương trình đường thẳng đi qua hai điểm cực trị $A, B$. Ta phân tích:
      $ y = (x/3 - 1/3) y' + (-8x - 2) $]
    #step[Do tại các điểm cực trị $A, B$ thì $y' = 0$, suy ra tọa độ $A, B$ thỏa mãn phương trình $y = -8x - 2$.]
    #step[Phương trình đường thẳng $A B$ là: $8x + y + 2 = 0$.]
    #step[Khoảng cách từ $O(0, 0)$ đến đường thẳng $A B$ là:
      $ d(O, A B) = (|8 dot 0 + 0 + 2|) / sqrt(8^2 + 1^2) = 2/sqrt(65) $]
    #step[Kết luận: $2/sqrt(65)$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Biết đồ thị $(C)$ của hàm số $y = (x^2 - 4x + 5)/(x - 1)$ có hai điểm cực trị. Đường thẳng đi qua hai điểm cực trị của đồ thị hàm số $(C)$ tạo với hai trục tọa độ một tam giác có diện tích $S$ bằng bao nhiêu?],
  [$4$],
  loigiai: [
    #step[Đối với hàm số phân thức bậc hai trên bậc nhất $y = (u(x))/(v(x))$, phương trình đường thẳng đi qua hai điểm cực trị là $y = (u'(x))/(v'(x))$.]
    #step[Ta có $u(x) = x^2 - 4x + 5 => u'(x) = 2x - 4$ và $v(x) = x - 1 => v'(x) = 1$.]
    #step[Phương trình đường thẳng $d$ đi qua hai điểm cực trị là: $y = (2x - 4)/1 = 2x - 4$.]
    #step[Giao điểm của $d$ với trục hoành là $A(2; 0)$, với trục tung là $B(0; -4)$.]
    #step[Diện tích tam giác tạo bởi $d$ và hai trục tọa độ là:
      $ S = 1/2 dot O A dot O B = 1/2 dot 2 dot |-4| = 4 $]
    #step[Kết luận: $4$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Gọi $A, B, C$ là ba điểm cực trị của đồ thị hàm số $y = x^4 - 2x^2 + 4$. Bán kính đường tròn nội tiếp tam giác $A B C$ bằng bao nhiêu?],
  [$sqrt(2) - 1$],
  loigiai: [
    #step[Ta có $y' = 4x^3 - 4x$.]
    #step[Cho $y' = 0 <=> x = 0$ hoặc $x = 1$ hoặc $x = -1$. Tọa độ ba điểm cực trị: $A(0; 4)$, $B(1; 3)$ và $C(-1; 3)$.]
    #step[Độ dài các cạnh của tam giác $A B C$:
      $ B C = sqrt((-1 - 1)^2 + (3 - 3)^2) = 2 $
      $ A B = A C = sqrt(1^2 + 1^2) = sqrt(2) $]
    #step[Gọi $H$ là trung điểm $B C$ thì $H(0; 3)$, suy ra $A H$ là đường cao tương ứng với cạnh đáy $B C$. Ta có $A H = 1$.]
    #step[Diện tích tam giác $A B C$: $S = 1/2 dot B C dot A H = 1/2 dot 2 dot 1 = 1$.]
    #step[Nửa chu vi tam giác: $p = (A B + A C + B C)/2 = (2sqrt(2) + 2)/2 = sqrt(2) + 1$.]
    #step[Bán kính đường tròn nội tiếp:
      $ r = S/p = 1 / (sqrt(2) + 1) = sqrt(2) - 1 $]
    #step[Kết luận: $sqrt(2) - 1$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $f(x)$ liên tục trên $RR$ và có bảng xét dấu $f'(x)$ như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-2$, $0$, $1$, $2$, $+oo$),
        f-signs: ("-", "||", "+", "0", "+", "||", "-", "0", "+"),
        w2:6,
        w1:1.25
      )
    ]
    Hàm số có bao nhiêu điểm cực trị?],
  [$3$],
  loigiai: [
    #step[Hàm số liên tục trên $RR$ nên tại các điểm mà đạo hàm không xác định ($x = -2, x = 1$) hàm số vẫn có cực trị nếu đạo hàm đổi dấu khi đi qua nó.]
    #step[Tại $x = -2$, đạo hàm đổi dấu từ âm sang dương nên $x = -2$ là một điểm cực tiểu.]
    #step[Tại $x = 0$, đạo hàm không đổi dấu nên $x = 0$ không phải là cực trị.]
    #step[Tại $x = 1$, đạo hàm đổi dấu từ dương sang âm nên $x = 1$ là một điểm cực đại.]
    #step[Tại $x = 2$, đạo hàm đổi dấu từ âm sang dương nên $x = 2$ là một điểm cực tiểu.]
    #step[Vậy hàm số có tổng cộng $3$ điểm cực trị.]
    #step[Kết luận: $3$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = a x^3 + b x^2 + c x + d$ đạt cực trị tại các điểm $x_1, x_2$ thỏa mãn $x_1 in (-1; 0), x_2 in (1; 2)$. Biết hàm số đồng biến trên khoảng $(x_1; x_2)$. Đồ thị hàm số cắt trục tung tại điểm có tung độ âm. Trong các số $a, b$ và $c$ có bao nhiêu số âm?],
  [$1$],
  loigiai: [
    #step[Vì hàm số đồng biến trên khoảng $(x_1; x_2)$ (giữa hai nghiệm cực trị) và nghịch biến ngoài khoảng đó nên hệ số $a$ của hàm số phải âm. Vậy $a < 0$.]
    #step[Đạo hàm: $y' = 3a x^2 + 2b x + c$. Phương trình $y' = 0$ có hai nghiệm là $x_1, x_2$. Theo định lý Vi-ét:
      $ cases(
        x_1 + x_2 = - (2b)/(3a),
        x_1 x_2 = c/(3a)
      ) $]
    #step[Do $x_1 in (-1; 0)$ và $x_2 in (1; 2)$ nên $|x_2| > |x_1|$, suy ra $x_1 + x_2 > 0$. Kết hợp với $a < 0$, ta suy ra $b > 0$.]
    #step[Vì $x_1$ và $x_2$ trái dấu nên $x_1 x_2 < 0$. Kết hợp với $a < 0$, ta suy ra $c > 0$.]
    #step[Đồ thị cắt trục tung tại điểm có tung độ âm nghĩa là $d < 0$ (tuy nhiên bài chỉ hỏi về $a, b, c$).]
    #step[Tóm lại: $a < 0, b > 0, c > 0$. Trong các số $a, b$ và $c$ có đúng $1$ số âm.]
    #step[Kết luận: $1$.]
    #resetstep()
  ]
)
