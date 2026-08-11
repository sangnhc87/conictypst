#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

// #show: doc-setup

#muc([Đề Luyện Tập Số 02])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "ngang",lines:4,
  [Tìm khoảng đồng biến của hàm số $y = 1/3 x^3 - 2x^2 + 3x + 1$.],
  (
    [$(1; 3)$],
    True([$(3; +oo)$]),
    [$(1; +oo)$],
    [$(-oo; 3)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = x^2 - 4x + 3$.]
    #step[Cho $y' = 0 <=> x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3$.]
    #step[Lập bảng xét dấu đạo hàm, ta có $y' > 0$ khi $x in (-oo; 1) union (3; +oo)$.]
    #step[Vậy hàm số đồng biến trên các khoảng $(-oo; 1)$ và $(3; +oo)$.]
    #step[Đối chiếu đáp án, ta chọn $(3; +oo)$. Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines:4,
  [Hàm số $y = (x - 2)/(2x + 1)$ đồng biến trên khoảng nào dưới đây?],
  (
    True([$(-oo; -1/2)$ và $(-1/2; +oo)$]),
    [$RR backslash {-1/2}$],
    [$(-oo; -1/2) union (-1/2; +oo)$],
    [$(-1/2; +oo)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR backslash {-1/2}$.]
    #step[Đạo hàm: $y' = (1 dot 1 - (-2) dot 2)/(2x + 1)^2 = 5/(2x + 1)^2$.]
    #step[Ta thấy $y' > 0, forall x in D$.]
    #step[Vậy hàm số đồng biến trên các khoảng $(-oo; -1/2)$ và $(-1/2; +oo)$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,
  [Cho hàm số $y = f(x)$ có bảng xét dấu của đạo hàm $y'$ như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $y'$,
        x-vals: ($-oo$, $-2$, $1$, $+oo$),
        f-signs: ("+", "0", "-", "0", "+")
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    [$(-oo; -2)$],
    [$(1; +oo)$],
    [$(-2; +oo)$],
    True([$(-2; 1)$])
  ),
  loigiai: [
    #step[Dựa vào bảng xét dấu đạo hàm $y'$, ta thấy $y' < 0$ trên khoảng $(-2; 1)$.]
    #step[Vậy hàm số nghịch biến trên khoảng $(-2; 1)$.]
    #step[Vậy đáp án đúng là C.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines:0,  
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 4.5), $y$, anchor: "west", padding: 2pt)
    content((0.15, -0.2), $O$)
    
    // Đường nét đứt cực trị
    line((-1, 0), (-1, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, 0), (1, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 4), (1, 4), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Nhãn trục
    content((-1, -0.25), $-1$)
    content((1, -0.25), $1$)
    content((-0.25, 4), $4$)
    content((0.2, 3), $3$)
    
    // Đồ thị y = -x^4 + 2x^2 + 3
    let pts = ()
    for i in range(-17, 18) {
      let x = i / 10
      let y = -calc.pow(x, 4) + 2 * calc.pow(x, 2) + 3
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên dưới. Hàm số đã cho đồng biến trên khoảng nào?],
  (
    [$(-1; 1)$],
    [$(1; +oo)$],
    True([$(0; 1)$]),
    [$(-oo; 0)$]
  ),
  loigiai: [
    #step[Dựa vào đồ thị, ta thấy đường cong đi lên từ trái sang phải trên các khoảng $(-1; 0)$ và $(1; +oo)$.]
    #step[Do đó, hàm số đồng biến trên khoảng $(-1; 0)$ và $(1; +oo)$.]
    #step[Đối chiếu các đáp án, ta chọn khoảng tương ứng. Vậy đáp án là D.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines: 0, 
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.15, 0.2), $O$)
    
    // Đường nét đứt
    line((-1, 0), (-1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -2), (-1, -2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, 0), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 2), (1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    // Nhãn trục
    content((-1.73, 0.25), $-sqrt(3)$)
    content((1.73, -0.25), $sqrt(3)$)
    content((-1, 0.25), $-1$)
    content((1, -0.25), $1$)
    content((-0.25, 2), $2$)
    content((0.25, -2), $-2$)
    
    // Đồ thị y' = -x^3 + 3x
    let pts = ()
    for i in range(-19, 20) {
      let x = i / 10
      let y = -calc.pow(x, 3) + 3 * x
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    content((1.2, 1.2), $y = f'(x)$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Cho hàm số $y = f(x)$ có đạo hàm trên $RR$ và đường cong trong hình vẽ bên là đồ thị của hàm số đạo hàm $y = f'(x)$. Hàm số $y = f(x)$ nghịch biến trên khoảng nào?],
  (
    True([$(-1; 0)$]),
    [$(-oo; -1)$],
    [$(0; 1)$],
    [$(1; 2)$]
  ),
  loigiai: [
    #step[Hàm số $y = f(x)$ nghịch biến khi và chỉ khi $f'(x) <= 0$ (và chỉ bằng 0 tại hữu hạn điểm).]
    #step[Dựa vào đồ thị của $y = f'(x)$, phần đồ thị nằm dưới trục hoành (tức $f'(x) < 0$) tương ứng với các khoảng $x in (-oo; -1)$ và $x in (1; 2)$.]
    #step[Vậy hàm số $y = f(x)$ nghịch biến trên các khoảng $(-oo; -1)$ và $(1; 2)$.]
    #step[Vậy đáp án đúng là A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines: 4,
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x - 1)(x - 2)^2 (x - 3)^3 (x - 4)^4$ với mọi $x in RR$. Số điểm cực trị của hàm số đã cho là],
  (
    [$4$],
    True([$2$]),
    [$3$],
    [$1$]
  ),
  loigiai: [
    #step[Ta có $f'(x) = (x - 1)(x - 2)^2 (x - 3)^3 (x - 4)^4$.]
    #step[Nghiệm của phương trình $f'(x) = 0$ là $x = 1, x = 2, x = 3, x = 4$.]
    #step[Trong đó, $x = 1$ và $x = 3$ là các nghiệm bội lẻ; $x = 2$ và $x = 4$ là các nghiệm bội chẵn.]
    #step[Đạo hàm $f'(x)$ chỉ đổi dấu khi đi qua các nghiệm bội lẻ. Vậy hàm số có đúng $2$ điểm cực trị.]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines:4,
  [Tọa độ điểm cực đại của đồ thị hàm số $y = -x^3 + 3x - 2$ là],
  (
    [$(-1; -4)$],
    [$(1; 2)$],
    True([$(1; 0)$]),
    [$(0; -2)$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = -3x^2 + 3$. Cho $y' = 0 <=> x = 1$ hoặc $x = -1$.]
    #step[Đạo hàm bậc hai: $y'' = -6x$.]
    #step[Tại $x = 1$, ta có $y''(1) = -6 < 0 => x = 1$ là điểm cực đại của hàm số. Khi đó $y(1) = 0$.]
    #step[Vậy tọa độ điểm cực đại của đồ thị hàm số là $(1; 0)$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines:4,
  [Một vật chuyển động theo quy luật $s(t) = -t^3 + 9t^2 + 12t$, với $t$ (giây) là khoảng thời gian tính từ lúc vật bắt đầu chuyển động và $s(t)$ (mét) là quãng đường vật đi được trong khoảng thời gian đó. Vận tốc lớn nhất của vật đạt được tại thời điểm $t$ bằng],
  (
    [$2$ giây],
    [$4$ giây],
    [$1$ giây],
    True([$3$ giây])
  ),
  loigiai: [
    #step[Vận tốc của vật là $v(t) = s'(t) = -3t^2 + 18t + 12$.]
    #step[Bài toán yêu cầu tìm giá trị lớn nhất của $v(t)$. Ta có hàm số $v(t)$ là một parabol quay bề lõm xuống dưới.]
    #step[Đỉnh của parabol đạt được tại $t = -18 / (2 dot (-3)) = 3$.]
    #step[Vậy vận tốc của vật đạt lớn nhất tại thời điểm $t = 3$ giây.]
    #step[Vậy đáp án là D.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",lines:4,
  [Hàm số $y = sqrt(x^2 - 4x + 3)$ nghịch biến trên khoảng nào dưới đây?],
  (
    [$(3; +oo)$],
    True([$(-oo; 1)$]),
    [$(2; 3)$],
    [$(1; 3)$]
  ),
  loigiai: [
    #step[Điều kiện xác định: $x^2 - 4x + 3 >= 0 <=> x <= 1$ hoặc $x >= 3$.]
    #step[Đạo hàm: $y' = (2x - 4) / (2 sqrt(x^2 - 4x + 3)) = (x - 2) / sqrt(x^2 - 4x + 3)$.]
    #step[Hàm số nghịch biến khi $y' < 0 <=> x - 2 < 0 <=> x < 2$.]
    #step[Kết hợp với điều kiện xác định, ta được tập các giá trị của $x$ là $x < 1$.]
    #step[Vậy hàm số nghịch biến trên khoảng $(-oo; 1)$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Khẳng định nào sau đây là *đúng* về đồ thị hàm trùng phương $y = x^4 - 2x^2 - 1$?],
  (
    [Đồ thị hàm số đồng biến trên khoảng $(-oo; -1)$.],
    True([Đồ thị hàm số đạt cực đại tại điểm $x = 0$.]),
    [Đồ thị hàm số đồng biến trên $RR$.],
    [Đồ thị hàm số nghịch biến trên khoảng $(-1; 0)$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Đạo hàm $y' = 4x^3 - 4x$.]
    #step[Cho $y' = 0 <=> 4x^3 - 4x = 0 <=> x = 0$ hoặc $x = 1$ hoặc $x = -1$.]
    #step[Qua $x = 0$, đạo hàm $y'$ đổi dấu từ dương sang âm nên $x = 0$ là điểm cực đại của hàm số.]
    #step[Xét các phương án, mệnh đề "Đồ thị hàm số đạt cực đại tại điểm $x = 0$" là đúng.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines: 0, 
  [Cho hàm số $y = f(x)$ có bảng xét dấu của đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $y'$,
        x-vals: ($-oo$, $-1$, $0$, $1$, $+oo$),
        f-signs: ("-", "0", "+", "0", "-", "0", "+")
      )
    ]
    Số điểm cực tiểu của hàm số đã cho là],
  (
    [$1$],
    [$3$],
    True([$2$]),
    [$0$]
  ),
  loigiai: [
    #step[Dựa vào bảng xét dấu đạo hàm, $y'$ đổi dấu từ âm sang dương khi đi qua các điểm $x = -1$ và $x = 1$.]
    #step[Do đó, hàm số đạt cực tiểu tại $x = -1$ và $x = 1$.]
    #step[Vậy số điểm cực tiểu của hàm số là $2$.]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = x^3 + a x^2 + b x + c$ đạt cực trị tại $x = 1$ và $x = 3$. Tính giá trị của biểu thức $a + b$.],
  (
    True([$3$]),
    [$-3$],
    [$15$],
    [$-15$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Đạo hàm: $y' = 3x^2 + 2a x + b$.]
    #step[Vì hàm số đạt cực trị tại $x = 1$ và $x = 3$ nên $y'(1) = 0$ và $y'(3) = 0$.]
    #step[Ta có hệ phương trình:
      $ cases(
        3 + 2a + b = 0,
        27 + 6a + b = 0
      ) $]
    #step[Giải hệ ta được $4a = -24 <=> a = -6$, suy ra $b = 9$.]
    #step[Giá trị của biểu thức $a + b = -6 + 9 = 3$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)



#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = x^3 - 3x + 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số đồng biến trên khoảng $(-1; 1)$.],
    True([Hàm số đạt cực đại tại $x = -1$ và giá trị cực đại là $y_("CĐ") = 4$.]),
    True([Đồ thị hàm số đi qua điểm $A(0; 2)$.]),
    [Hàm số nghịch biến trên khoảng $(-oo; -1)$.]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Đạo hàm $y' = 3x^2 - 3$. Cho $y' = 0 <=> x = 1$ hoặc $x = -1$.]
    #step[a) Trên khoảng $(-1; 1)$, $y' < 0$ nên hàm số nghịch biến. Vậy mệnh đề a) Sai.]
    #step[b) Đạo hàm đổi dấu từ dương sang âm qua $x = -1$ nên hàm số đạt cực đại tại $x = -1$. Giá trị cực đại $y(-1) = -1 - 3(-1) + 2 = 4$. Vậy mệnh đề b) Đúng.]
    #step[c) Thay $x = 0$ vào hàm số, ta được $y = 2$. Đồ thị hàm số đi qua điểm $A(0; 2)$. Vậy mệnh đề c) Đúng.]
    #step[d) Trên khoảng $(-oo; -1)$, $y' > 0$ nên hàm số đồng biến. Vậy mệnh đề d) Sai.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines: 4,
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Vẽ hệ trục tọa độ
    line((-2.0, 0), (3.0, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.0, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, 0.2), $O$)
    
    // Nhãn trục
    content((-1, 0.25), $-1$)
    content((2, -0.25), $2$)
    content((-0.25, -2), $-2$)
    
    // Đồ thị y' = x^2 - x - 2
    let pts = ()
    for i in range(-15, 26) {
      let x = i / 10
      let y = calc.pow(x, 2) - x - 2
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + blue)
    content((2.1, 0.8), $y = f'(x)$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Cho hàm số $y = f(x)$ có đạo hàm liên tục trên $RR$ và đồ thị hàm số $y = f'(x)$ như hình vẽ bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số $y = f(x)$ đồng biến trên khoảng $(2; +oo)$.]),
    True([Hàm số $y = f(x)$ đạt cực trị tại $x = -1$ và $x = 2$.]),
    [Hàm số $y = f(x)$ đạt cực đại tại điểm $x = 2$.],
    True([Hàm số $y = f(x)$ nghịch biến trên khoảng $(-1; 2)$.])
  ),
  loigiai: [
    #step[Dựa vào đồ thị $f'(x)$, parabol cắt trục hoành tại $x = -1$ và $x = 2$, suy ra $f'(x) = 0$ tại hai điểm này.]
    #step[a) Trên khoảng $(2; +oo)$, đồ thị $f'(x)$ nằm trên trục hoành nên $f'(x) > 0$. Do đó, hàm số $y = f(x)$ đồng biến. Mệnh đề a) Đúng.]
    #step[b) Tại $x = -1$ và $x = 2$, $f'(x)$ đổi dấu nên đây là hai điểm cực trị. Mệnh đề b) Đúng.]
    #step[c) Tại $x = 2$, $f'(x)$ đổi dấu từ âm sang dương nên $x = 2$ là điểm cực tiểu, không phải cực đại. Mệnh đề c) Sai.]
    #step[d) Trên khoảng $(-1; 2)$, đồ thị $f'(x)$ nằm dưới trục hoành nên $f'(x) < 0$, suy ra hàm số nghịch biến. Mệnh đề d) Đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x)$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ("+", "||", "+"),
        v-vals: ($-oo$, ($+oo$, $-oo$), $+oo$),
        ranks: (-2, (2, -2), 2)
      )
    ]
    Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR backslash {1}$.]),
    True([Hàm số đã cho đồng biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$.]),
    True([Hàm số đã cho không có cực trị.]),
    True([Đạo hàm của hàm số luôn dương với mọi $x != 1$.])
  ),
  loigiai: [
    #step[Dựa vào bảng biến thiên:]
    #step[a) Hàm số không xác định tại $x = 1$, suy ra tập xác định là $D = RR backslash {1}$. Mệnh đề a) Đúng.]
    #step[b) Trên các khoảng $(-oo; 1)$ và $(1; +oo)$, đạo hàm mang dấu dương nên hàm số đồng biến. Mệnh đề b) Đúng.]
    #step[c) Hàm số không có điểm nào đạo hàm bằng $0$ hay đổi dấu, do đó không có cực trị. Mệnh đề c) Đúng.]
    #step[d) Đạo hàm của hàm số mang dấu "$+$" với mọi $x != 1$. Mệnh đề d) Đúng.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",
  [Một bể chứa nước có dung tích được bơm nước vào theo quy luật $V(t) = -t^3 + 6t^2 + 15t$ (đơn vị: $m^3$, với $t$ tính bằng giờ và $0 <= t <= 6$). Tốc độ bơm nước tại thời điểm $t$ là đạo hàm $v(t) = V'(t)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tốc độ bơm nước tại thời điểm $t$ là $v(t) = -3t^2 + 12t + 15$.]),
    True([Tốc độ bơm nước đạt giá trị lớn nhất tại thời điểm $t = 2$ giờ.]),
    True([Tốc độ bơm nước tại thời điểm $t = 4$ giờ là $15 m^3/h$.]),
    [Thể tích nước trong bể giảm khi $t in (0; 5)$.]
  ),
  loigiai: [
    #step[a) Tốc độ bơm nước $v(t) = V'(t) = -3t^2 + 12t + 15$. Vậy mệnh đề a) Đúng.]
    #step[b) Xét hàm $v(t) = -3t^2 + 12t + 15$, đây là parabol bề lõm hướng xuống, đạt cực đại tại $t = -12 / (2 dot (-3)) = 2$. Vậy mệnh đề b) Đúng.]
    #step[c) Tại $t = 4$, $v(4) = -3(16) + 12(4) + 15 = 15$ $m^3$/h. Vậy mệnh đề c) Đúng.]
    #step[d) Thể tích nước thay đổi theo tốc độ $v(t)$. Trên khoảng $(0; 5)$, $v(t) = -3(t - 5)(t + 1) > 0$. Do tốc độ bơm dương nên lượng nước trong bể tăng lên, không phải giảm. Vậy mệnh đề d) Sai.]
    #resetstep()
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Cho hàm số $y = -x^3 + 3x^2 + 1$. Gọi $A$ và $B$ là hai điểm cực trị của đồ thị hàm số. Tính bình phương độ dài đoạn thẳng $A B$.],
  [$20$],
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = -3x^2 + 6x$. Cho $y' = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Với $x = 0 => y = 1$, tọa độ $A(0; 1)$. Với $x = 2 => y = 5$, tọa độ $B(2; 5)$.]
    #step[Bình phương độ dài đoạn thẳng $A B^2 = (2 - 0)^2 + (5 - 1)^2 = 4 + 16 = 20$.]
    #step[Kết luận: $20$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Biết hàm số $y = a x^3 + b x^2 + c x + d$ đạt cực trị tại các điểm $A(1; 3)$ và $B(-1; 7)$. Tính giá trị của biểu thức $P = a + b + c + d$.],
  [$3$],
  loigiai: [
    #step[Đạo hàm $y' = 3a x^2 + 2b x + c$.]
    #step[Hàm số đạt cực trị tại $x = 1$ và $x = -1$, suy ra:
      $ cases(
        3a + 2b + c = 0,
        3a - 2b + c = 0
      ) => cases(
        b = 0,
        c = -3a
      ) $]
    #step[Đồ thị hàm số đi qua hai điểm $A(1; 3)$ và $B(-1; 7)$:
      $ cases(
        a + b + c + d = 3,
        -a + b - c + d = 7
      ) $]
    #step[Thay $b = 0, c = -3a$ vào hệ trên, ta được:
      $ cases(
        -2a + d = 3,
        2a + d = 7
      ) => cases(
        a = 1,
        d = 5
      ) $]
    #step[Suy ra $c = -3$. Giá trị của biểu thức $P = 1 + 0 + (-3) + 5 = 3$.]
    #step[Kết luận: $3$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Đồ thị của hàm số $y = x^3 - 3x + 2$ có hai điểm cực trị là $A$ và $B$. Đường thẳng $A B$ cắt trục tung tại điểm có tung độ bằng bao nhiêu?],
  [$2$],
  loigiai: [
    #step[Ta có $y' = 3x^2 - 3$.]
    #step[Lấy $y$ chia cho $y'$, ta được phần dư chính là phương trình đường thẳng đi qua hai điểm cực trị $A, B$:
      $ y = (x/3) y' + (-2x + 2) $]
    #step[Tại các điểm cực trị thì $y' = 0$, nên đường thẳng $A B$ có phương trình là $y = -2x + 2$.]
    #step[Đường thẳng $A B$ cắt trục tung tại điểm có hoành độ $x = 0$, suy ra tung độ $y = 2$.]
    #step[Kết luận: $2$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Biết đồ thị của hàm số $y = (x^2 - 4x + 5)/(x - 2)$ có hai điểm cực trị. Đường thẳng đi qua hai điểm cực trị của đồ thị hàm số tạo với hai trục tọa độ một tam giác có diện tích $S$ bằng bao nhiêu?],
  [$4$],
  loigiai: [
    #step[Đối với hàm phân thức bậc hai trên bậc nhất $y = (u(x))/(v(x))$, đường thẳng đi qua cực trị là $y = (u'(x))/(v'(x))$.]
    #step[Ta có $u(x) = x^2 - 4x + 5 => u'(x) = 2x - 4$ và $v(x) = x - 2 => v'(x) = 1$.]
    #step[Phương trình đường thẳng $d$ đi qua 2 điểm cực trị là: $y = (2x - 4)/1 = 2x - 4$.]
    #step[Giao điểm của $d$ với trục hoành là $A(2; 0)$, với trục tung là $B(0; -4)$.]
    #step[Diện tích tam giác vuông tạo bởi $d$ và hai trục tọa độ: $S = 1/2 dot O A dot O B = 1/2 dot 2 dot |-4| = 4$.]
    #step[Kết luận: $4$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Có bao nhiêu điểm trên đồ thị hàm số $y = 1/3 x^3 - x^2 - 3x + 1$ mà tại đó tiếp tuyến của đồ thị song song với trục hoành?],
  [$2$],
  loigiai: [
    #step[Tiếp tuyến của đồ thị song song với trục hoành khi và chỉ khi hệ số góc của tiếp tuyến bằng $0$, tức là $y' = 0$.]
    #step[Ta có $y' = x^2 - 2x - 3$. Cho $y' = 0 <=> x^2 - 2x - 3 = 0 <=> x = -1$ hoặc $x = 3$.]
    #step[Do phương trình đạo hàm bằng 0 có $2$ nghiệm phân biệt, nên trên đồ thị hàm số có đúng $2$ điểm mà tại đó tiếp tuyến song song với trục hoành.]
    #step[Kết luận: $2$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $f(x)$ liên tục trên $RR$ và có bảng xét dấu của đạo hàm $f'(x)$ như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-3$, $-1$, $1$, $3$, $+oo$),
        f-signs: ("+", "0", "-", "||", "+", "0", "+", "0", "-")
      )
    ]
    Hàm số đã cho có bao nhiêu điểm cực trị?],
  [$3$],
  loigiai: [
    #step[Hàm số $f(x)$ liên tục trên $RR$ nên tại các điểm mà đạo hàm $f'(x)$ không xác định (dấu $||$), hàm số vẫn liên tục và có thể đạt cực trị.]
    #step[Qua $x = -3$, đạo hàm đổi dấu từ dương sang âm nên $x = -3$ là điểm cực đại.]
    #step[Qua $x = -1$, đạo hàm đổi dấu từ âm sang dương (do bị gián đoạn đạo hàm bằng $||$ nhưng đổi dấu sang khoảng kế tiếp mang dấu $+$), nên $x = -1$ là điểm cực tiểu.]
    #step[Qua $x = 1$, đạo hàm không đổi dấu (từ dương sang dương) nên $x = 1$ không phải là cực trị.]
    #step[Qua $x = 3$, đạo hàm đổi dấu từ dương sang âm nên $x = 3$ là điểm cực đại.]
    #step[Vậy hàm số có tất cả $3$ điểm cực trị.]
    #step[Kết luận: $3$.]
    #resetstep()
  ]
)
