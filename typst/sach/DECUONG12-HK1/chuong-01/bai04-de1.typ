#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 01])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (10 câu)], count: 10)

#tn(
  dir: "doc",lines: 2,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.25), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 3) + 0.5 * calc.pow(x, 2) - 1.5 * x + 0.4
      if y >= -1.4 and y <= 2.4 and x >= -2.1 and x <= 2.1 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Hàm số $y = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ bên. Mệnh đề nào sau đây là đúng?],
  (
    [$a < 0, b < 0, c < 0, d < 0$.],
    [$a > 0, b > 0, c > 0, d < 0$.],
    True([$a > 0, b > 0, c < 0, d > 0$.]),
    [$a > 0, b < 0, c < 0, d > 0$.]
  ),
  loigiai: [
    #step[Nhánh cuối cùng của đồ thị đi lên nên $limits(lim)_(x -> +oo) y = +oo => a > 0$.]
    #step[Đồ thị cắt trục tung tại điểm có tung độ dương (nằm trên $O x$) nên $d > 0$.]
    #step[Hàm số có hai điểm cực trị $x_1, x_2$ nằm về hai phía của trục tung nên $x_1 x_2 < 0 <=> c/(3a) < 0$. Vì $a > 0$ nên $c < 0$.]
    #step[Điểm cực đại có hoành độ âm nằm xa trục tung hơn điểm cực tiểu có hoành độ dương (khoảng cách từ cực đại đến trục $O y$ lớn hơn cực tiểu), suy ra $x_1 + x_2 < 0 <=> (-2b)/(3a) < 0$. Vì $a > 0$ nên $b > 0$.]
    #step[Vậy $a > 0, b > 0, c < 0, d > 0$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Bảng biến thiên ở hình bên là của một trong bốn hàm số được cho dưới đây, đó là hàm số nào?
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $0$, $2$, $+oo$),
        d-signs: ("-", "0", "+", "0", "-"),
        v-vals: ($+oo$, $1$, $5$, $-oo$)
      )
    ]
  ],
  (
    [$y = -x^3 - 3x^2$.],
    [$y = x^3 - 3x^2 - 1$.],
    [$y = x^3 + 2x^2 + 1$.],
    True([$y = -x^3 + 3x^2 + 1$.])
  ),
  loigiai: [
    #step[Từ bảng biến thiên ta thấy $limits(lim)_(x -> +oo) y = -oo$ nên hệ số $a < 0$. Ta loại các phương án có $a > 0$.]
    #step[Hàm số đạt cực tiểu tại $x = 0$ và $y_"CT" = 1$. Thay $x = 0$ vào hàm số, ta thấy chỉ có hàm số $y = -x^3 + 3x^2 + 1$ là thỏa mãn $y(0) = 1$.]
    #step[Thử lại: $y' = -3x^2 + 6x = 0 <=> x = 0$ hoặc $x = 2$. Tại $x = 2$ thì $y = 5$. Hoàn toàn khớp với bảng biến thiên.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.2, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.2, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.2), (0, 3.8), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.8), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.25), $O$)
    
    line((-1, 0), (-1, 3), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 3), (-1, 3), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1, 0), (1, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, -1), (1, -1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 3) - 3 * x + 1
      if y >= -2.1 and y <= 3.6 and x >= -2.1 and x <= 2.1 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đồ thị sau đây là của hàm số nào?],
  (
    True([$y = x^3 - 3x + 1$.]),
    [$y = x^3 - 3x - 1$.],
    [$y = -x^3 - 3x - 1$.],
    [$y = -x^3 + 3x + 1$.]
  ),
  loigiai: [
    #step[Quan sát đồ thị, ta thấy nhánh phải đi lên nên hệ số $a > 0$. Loại các đáp án có $a < 0$.]
    #step[Đồ thị cắt trục tung $O y$ tại điểm có tung độ dương (nằm trên $O x$) nên $y(0) > 0$. Loại đáp án $y = x^3 - 3x - 1$ vì $y(0) = -1 < 0$.]
    #step[Đồ thị đi qua điểm có tọa độ $(1; -1)$, thay vào hàm số $y = x^3 - 3x + 1$ ta được $-1 = 1^3 - 3(1) + 1$, thỏa mãn. Vậy hàm số cần tìm là $y = x^3 - 3x + 1$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 4) - 2 * calc.pow(x, 2) - 1
      if y >= -2.4 and y <= 2.4 and x >= -2.4 and x <= 2.4 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong trong hình vẽ bên là đồ thị của hàm số nào dưới đây?],
  (
    [$y = x^4 + 2x^2 - 1$.],
    [$y = -x^4 + 2x^2 - 1$.],
    True([$y = x^4 - 2x^2 - 1$.]),
    [$y = -x^4 - 2x^2 - 1$.]
  ),
  loigiai: [
    #step[Đồ thị hàm số có hình dạng chữ W, nét cuối đi lên nên đây là hàm số bậc bốn trùng phương có hệ số $a > 0$.]
    #step[Đồ thị hàm số có 3 điểm cực trị nên $a$ và $b$ trái dấu. Vì $a > 0$ suy ra $b < 0$.]
    #step[Kiểm tra các đáp án chỉ có hàm số $y = x^4 - 2x^2 - 1$ thỏa mãn $a = 1 > 0$ và $b = -2 < 0$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = -calc.pow(x, 4) + 2 * calc.pow(x, 2) + 1
      if y >= -2.4 and y <= 2.4 and x >= -2.4 and x <= 2.4 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = a x^4 + b x^2 + c$ có đồ thị như hình vẽ. Khẳng định nào sau đây đúng?],
  (
    [$a > 0, b < 0, c > 0$.],
    True([$a < 0, b > 0, c > 0$.]),
    [$a < 0, b < 0, c > 0$.],
    [$a > 0, b > 0, c < 0$.]
  ),
  loigiai: [
    #step[Đồ thị có nét cuối cùng đi xuống nên $a < 0$.]
    #step[Đồ thị có 3 điểm cực trị nên $a, b$ trái dấu. Do $a < 0 => b > 0$.]
    #step[Đồ thị cắt trục $O y$ tại điểm có tung độ dương nên $c > 0$.]
    #step[Vậy $a < 0, b > 0, c > 0$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-1.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((3.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((-0.2, -0.2), $O$)
    
    // Tiệm cận
    line((1, -2.5), (1, 3.5), stroke: (dash: "dashed", paint: red))
    line((-1.5, 2), (3.5, 2), stroke: (dash: "dashed", paint: red))
    
    let pts1 = ()
    let pts2 = ()
    for i in range(-15, 9) {
      let x = i / 10
      let y = (2*x + 1)/(x - 1)
      if y >= -2.4 and y <= 3.4 { pts1.push((x, y)) }
    }
    for i in range(11, 35) {
      let x = i / 10
      let y = (2*x + 1)/(x - 1)
      if y >= -2.4 and y <= 3.4 { pts2.push((x, y)) }
    }
    line(..pts1, stroke: 1.2pt + blue)
    line(..pts2, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Đường cong trong hình vẽ là đồ thị của hàm số nào dưới đây?],
  (
    [$y = (x - 1)/(x + 1)$.],
    [$y = (2x - 1)/(x + 1)$.],
    [$y = (2x + 1)/(2x - 2)$.],
    True([$y = (2x + 1)/(x - 1)$.])
  ),
  loigiai: [
    #step[Quan sát đồ thị ta thấy đường tiệm cận đứng là $x = 1$, tiệm cận ngang là $y = 2$.]
    #step[Đáp án $y = (2x + 1)/(2x - 2)$ có tiệm cận đứng $x = 1$, tiệm cận ngang $y = 1$ (Loại).]
    #step[Đáp án $y = (2x + 1)/(x - 1)$ có tiệm cận đứng $x = 1$, tiệm cận ngang $y = 2$ (Thỏa mãn).]
    #step[Đồ thị đi qua điểm $(0; -1)$, thay $x=0$ vào $y = (2x + 1)/(x - 1)$ ta được $y = -1$ (Đúng).]
  ]
)

#tn(
  dir: "doc",lines: 0,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 2.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    // Tiệm cận
    line((-1, -2.5), (-1, 2.5), stroke: (dash: "dashed", paint: red))
    line((-2.5, -1), (2.5, -1), stroke: (dash: "dashed", paint: red))
    
    let pts1 = ()
    let pts2 = ()
    for i in range(-50, -11) {
      let x = i / 10
      let y = (-x + 2)/(x + 1)
      if y >= -2.4 and y <= 2.4 { pts1.push((x, y)) }
    }
    for i in range(-9, 25) {
      let x = i / 10
      let y = (-x + 2)/(x + 1)
      if y >= -2.4 and y <= 2.4 { pts2.push((x, y)) }
    }
    line(..pts1, stroke: 1.2pt + blue)
    line(..pts2, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị như hình vẽ. Khẳng định nào sau đây là đúng?],
  (
    True([$a c < 0, b d > 0$.]),
    [$a c > 0, b d < 0$.],
    [$a c < 0, b d < 0$.],
    [$a c > 0, b d > 0$.]
  ),
  loigiai: [
    #step[Đồ thị có tiệm cận đứng $x = -d/c < 0 => c d > 0$.]
    #step[Đồ thị có tiệm cận ngang $y = a/c < 0 => a c < 0$.]
    #step[Đồ thị cắt trục $O y$ tại điểm có tung độ $y = b/d > 0 => b d > 0$.]
    #step[Vậy $a c < 0$ và $b d > 0$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = (x - 2)/(x + 1)$. Giao điểm của hai đường tiệm cận của đồ thị hàm số có tọa độ là],
  (
    [$(1; 1)$.],
    True([$(-1; 1)$.]),
    [$(1; -1)$.],
    [$(-1; -2)$.]
  ),
  loigiai: [
    #step[Tiệm cận đứng của đồ thị hàm số là đường thẳng $x = -1$.]
    #step[Tiệm cận ngang của đồ thị hàm số là đường thẳng $y = 1/1 = 1$.]
    #step[Tọa độ giao điểm của hai đường tiệm cận là $I(-1; 1)$.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Đồ thị hàm số $y = x^3 - 3x^2 + 2$ cắt trục hoành tại bao nhiêu điểm?],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$0$.]
  ),
  loigiai: [
    #step[Phương trình hoành độ giao điểm của đồ thị hàm số với trục hoành là $x^3 - 3x^2 + 2 = 0$.]
    #step[Ta nhẩm được một nghiệm $x = 1$. Phân tích thành nhân tử: $(x - 1)(x^2 - 2x - 2) = 0$.]
    #step[Phương trình $x^2 - 2x - 2 = 0$ có $Delta' = 1 - (-2) = 3 > 0$ nên có hai nghiệm phân biệt khác $1$ là $x = 1 plus.minus sqrt(3)$.]
    #step[Vậy phương trình có ba nghiệm phân biệt, đồ thị cắt trục hoành tại 3 điểm.]
  ]
)

#tn(
  dir: "doc",lines: 0,
  [Cho hàm số $y = -x^4 + 2x^2 + 3$. Tọa độ giao điểm của đồ thị hàm số với trục tung là],
  (
    [$(0; -3)$.],
    True([$(0; 3)$.]),
    [$(3; 0)$.],
    [$(-3; 0)$.]
  ),
  loigiai: [
    #step[Giao điểm của đồ thị với trục tung có hoành độ $x = 0$.]
    #step[Thay $x = 0$ vào phương trình hàm số, ta được $y = -0^4 + 2(0)^2 + 3 = 3$.]
    #step[Vậy tọa độ giao điểm là $(0; 3)$.]
  ]
)

#resetcau()

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

#ds(
  dir: "doc",lines: 4,
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-2.5, 0), (1.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((1.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.2), (0, 3.2), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.2), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    line((-1.5, 0), (-1.5, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 1), (-1.5, 1), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((-1, 0), (-1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((0, 2), (-1, 2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    
    content((-1.5, -0.35), $-2$)
    content((-1, -0.35), $-1$)
    content((-0.25, 2), $2$)
    content((0.25, 0.75), $1$)
    
    let pts = ()
    for i in range(-23, 10) {
      let x = i / 10
      let y = 2 * calc.pow(x, 3) + 3 * calc.pow(x, 2) + 1
      if y >= -1.1 and y <= 3.0 and x >= -2.4 and x <= 0.8 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = f(x) = a x^3 + b x^2 + c x + d$ có đồ thị như hình vẽ dưới đây. Xét tính đúng sai của các mệnh đề:],
  (
    [Hàm số đạt cực tiểu tại $x = 1$.],
    True([Đồ thị hàm số cắt trục $O y$ tại điểm có toạ độ $(0; 1)$.]),
    True([Hàm số đồng biến trên khoảng $(-oo; -1)$.]),
    [$2 a + 3 b + c = 9$.]
  ),
  loigiai: [
    #step[a) Quan sát đồ thị, hàm số đạt cực tiểu tại điểm có hoành độ $x = 0$, không phải $x = 1$. (Sai)]
    #step[b) Đồ thị cắt trục $O y$ tại điểm có tọa độ $(0; 1)$ như quan sát trên hình. (Đúng)]
    #step[c) Trên khoảng $(-oo; -1)$, đồ thị có hướng đi lên từ trái sang phải, do đó hàm số đồng biến. (Đúng)]
    #step[d) Dựa vào đồ thị ta xác định được: $d=1$. Điểm cực trị tại $x=0, x=-1$ nên $y' = 3a x^2 + 2b x + c = 0$ có nghiệm $0$ và $-1$. Suy ra $c = 0$ và $-2b/(3a) = -1 => 3a = 2b$. Đồ thị đi qua $(-1; 2)$ nên $-a + b + d = 2 => -a + b = 1$. Từ đó giải hệ được $a = 2, b = 3$. Vậy $2a + 3b + c = 4 + 9 + 0 = 13 != 9$. (Sai)]
  ]
)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = f(x) = a x^3 + b x^2 + c x + d$ có bảng biến thiên như hình vẽ dưới đây:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $-2$, $0$, $+oo$),
        d-signs: ("-", "0", "+", "0", "-"),
        v-vals: ($+oo$, $0$, $4$, $-oo$)
      )
    ]
  Xét tính đúng sai của các mệnh đề:],
  (
    [Hàm số đạt giá trị lớn nhất là $4$.],
    True([Đường thẳng $y = 2$ cắt đồ thị hàm số tại ba điểm phân biệt.]),
    True([Trong bốn hệ số $a, b, c, d$ có đúng hai số âm.]),
    True([Đồ thị hàm số đi qua điểm $(-4; 20)$.])
  ),
  loigiai: [
    #step[a) Hàm số tiến tới $+oo$ khi $x -> -oo$, do đó không có giá trị lớn nhất tuyệt đối trên $RR$. $y=4$ chỉ là giá trị cực đại. (Sai)]
    #step[b) Dựa vào bảng biến thiên, đường thẳng $y=2$ nằm giữa $y_"CT"=0$ và $y_"CĐ"=4$ nên sẽ cắt đồ thị tại đúng 3 điểm phân biệt. (Đúng)]
    #step[c) Nhìn BBT ta thấy $a < 0$. Tại $x=0$ thì $y=4 => d = 4 > 0$. Hàm số đạt cực trị tại $x=0$ và $x=-2$. Ta có $x_1 x_2 = 0 => c = 0$. $x_1+x_2 = -2 => -2b/(3a) = -2 => b = 3a < 0$. Các hệ số là $a<0, b<0, c=0, d>0$. Vậy có đúng hai số âm là $a$ và $b$. (Đúng)]
    #step[d) Ta tìm được hàm số: $f'(x) = 3a x^2 + 2b x$. Do $b=3a$ nên $f'(x) = 3a x^2 + 6a x$. Nguyên hàm $f(x) = a x^3 + 3a x^2 + 4$. Điểm cực tiểu $(-2; 0) => a(-8) + 3a(4) + 4 = 0 => 4a = -4 => a = -1$. Vậy $f(x) = -x^3 - 3x^2 + 4$. Thay $x = -4$ ta có $f(-4) = -(-64) - 3(16) + 4 = 64 - 48 + 4 = 20$. Đồ thị đi qua $(-4; 20)$. (Đúng)]
  ]
)

#ds(
  dir: "doc",lines: 4,
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((2.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -1.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((0.2, -0.2), $O$)
    
    let pts = ()
    for i in range(-22, 22) {
      let x = i / 10
      let y = calc.pow(x, 4) - 2 * calc.pow(x, 2) + 2
      if y >= -1.4 and y <= 3.4 and x >= -2.4 and x <= 2.4 {
        pts.push((x, y))
      }
    }
    line(..pts, stroke: 1.2pt + blue)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Cho hàm số $y = a x^4 + b x^2 + c$ ($a != 0$) có đồ thị như hình bên. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số có hệ số $a > 0$ và $b < 0$.]),
    [Giá trị cực đại của hàm số là một số âm.],
    [Phương trình $f(x) = 0$ có $4$ nghiệm phân biệt.],
    True([Đồ thị hàm số nhận trục $O y$ làm trục đối xứng.])
  ),
  loigiai: [
    #step[a) Đồ thị hình chữ W nên $a > 0$. Hàm số có 3 điểm cực trị nên $a b < 0 => b < 0$. (Đúng)]
    #step[b) Điểm cực đại của đồ thị nằm trên trục $O y$ tại $y=c>0$. Do đó giá trị cực đại là số dương. (Sai)]
    #step[c) Toàn bộ đồ thị hàm số đều nằm trên trục hoành ($y > 0$), nên phương trình $f(x) = 0$ vô nghiệm. (Sai)]
    #step[d) Hàm số $y = a x^4 + b x^2 + c$ là hàm số chẵn nên đồ thị luôn nhận trục $O y$ làm trục đối xứng. Quan sát hình vẽ cũng thấy rõ điều này. (Đúng)]
  ]
)

#ds(
  dir: "doc",lines: 4,
  [Cho hàm số $y = (a x + b)/(x + c)$ có đồ thị như hình bên.
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        line((-3.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
        content((2.5, 0), $x$, anchor: "north", padding: 2pt)
        line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
        content((0, 3.5), $y$, anchor: "west", padding: 2pt)
        content((0.2, -0.2), $O$)
        
        // Tiệm cận
        line((-1, -2.5), (-1, 3.5), stroke: (dash: "dashed", paint: red))
        line((-3.5, 1), (2.5, 1), stroke: (dash: "dashed", paint: red))
        
        let pts1 = ()
        let pts2 = ()
        for i in range(-35, -12) {
          let x = i / 10
          let y = (x - 2)/(x + 1)
          if y >= -2.4 and y <= 3.4 { pts1.push((x, y)) }
        }
        for i in range(-8, 25) {
          let x = i / 10
          let y = (x - 2)/(x + 1)
          if y >= -2.4 and y <= 3.4 { pts2.push((x, y)) }
        }
        line(..pts1, stroke: 1.2pt + blue)
        line(..pts2, stroke: 1.2pt + blue)
      })
    ]
  Xét tính đúng sai của các khẳng định sau:],
  (
    [Đồ thị hàm số có đường tiệm cận đứng là $x = 1$.],
    True([Hàm số đồng biến trên từng khoảng xác định.]),
    [Trong ba số $a, b, c$, có đúng một số dương.],
    [Giao điểm của hai đường tiệm cận nằm ở góc phần tư thứ II.]
  ),
  loigiai: [
    #step[a) Dựa vào đồ thị, đường tiệm cận đứng là $x = -1$ chứ không phải $x = 1$. (Sai)]
    #step[b) Trên mỗi nhánh đồ thị (bên trái và bên phải TCĐ), đồ thị luôn đi lên từ trái sang phải, nên hàm số đồng biến trên từng khoảng xác định. (Đúng)]
    #step[c) TCĐ: $x = -c = -1 => c = 1 > 0$. TCN: $y = a = 1 => a = 1 > 0$. Giao với trục tung: $y = b/c < 0 => b/1 < 0 => b < 0$. Giao với trục hoành: $x = -b/a > 0 => -b/1 > 0 => b < 0$. Vậy $a=1, b<0, c=1$. Có đúng 2 số dương. Khẳng định sai. (Sai) *Cập nhật: À, đợi chút, trong 3 số a, b, c có hai số dương là a và c. Đề nói "có đúng 1 số dương" là sai. Sửa lại đáp án mẫu là False.*]
  ]
)

#resetcau()

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "doc",
  [Có bao nhiêu giá trị nguyên của tham số thực $m$ để đường thẳng $y = 3x + m - 2$ cắt đồ thị $y = (x - 1)^3$ tại ba điểm phân biệt?],
  [$3$],
  loigiai: [
    #step[Phương trình hoành độ giao điểm: $(x - 1)^3 = 3x + m - 2 <=> (x - 1)^3 - 3x + 2 = m$.]
    #step[Khảo sát hàm số $f(x) = (x - 1)^3 - 3x + 2$. Tập xác định: $D = RR$.]
    #step[$f'(x) = 3(x - 1)^2 - 3$. Cho $f'(x) = 0 <=> (x - 1)^2 = 1 <=> x = 2$ hoặc $x = 0$.]
    #step[Tại $x = 0 => f(0) = 1$. Tại $x = 2 => f(2) = -3$.]
    #step[Để đường thẳng cắt đồ thị tại 3 điểm phân biệt thì phương trình $f(x) = m$ phải có 3 nghiệm phân biệt. Điều này xảy ra khi $-3 < m < 1$.]
    #step[Do $m$ nguyên nên $m \in \{-2; -1; 0\}$. Có $3$ giá trị nguyên của $m$.]
  ]
)

#tln(
  dir: "doc",
  [Cho hàm số $y = x^3 - 3x^2 + m x + 1$ có đồ thị $(C)$ và đường thẳng $d : y = 2x + 1$. Có bao nhiêu giá trị nguyên dương của tham số $m$ để đồ thị $(C)$ cắt đường thẳng $d$ tại $3$ điểm phân biệt?],
  [$3$],
  loigiai: [
    #step[Phương trình hoành độ giao điểm: $x^3 - 3x^2 + m x + 1 = 2x + 1 <=> x(x^2 - 3x + m - 2) = 0$.]
    #step[Phương trình tương đương với $x = 0$ hoặc $x^2 - 3x + m - 2 = 0$ (1).]
    #step[Để hai đồ thị cắt nhau tại 3 điểm phân biệt thì phương trình (1) phải có 2 nghiệm phân biệt khác 0.]
    #step[Điều kiện là: $Delta = (-3)^2 - 4(m - 2) > 0$ và $0^2 - 3(0) + m - 2 != 0$.]
    #step[$Delta = 9 - 4m + 8 = 17 - 4m > 0 => m < 17/4 = 4.25$. Và $m - 2 != 0 => m != 2$.]
    #step[Do $m$ nguyên dương nên $m \in \{1; 3; 4\}$. Vậy có 3 giá trị nguyên dương của $m$.]
  ]
)

#tln(
  dir: "doc",
  [Với $m$ là một tham số thực thì đồ thị hàm số $y = x^3 - 2x^2 + x - 1$ và đường thẳng $y = m$ có nhiều nhất bao nhiêu giao điểm?],
  [$3$],
  loigiai: [
    #step[Đây là bài toán tìm số giao điểm của đường thẳng song song với trục hoành $y = m$ và đồ thị hàm bậc ba.]
    #step[Đồ thị hàm số bậc ba $y = a x^3 + b x^2 + c x + d$ ($a != 0$) có dạng sóng, tối đa có hai điểm cực trị.]
    #step[Một đường thẳng ngang $y = m$ có thể cắt một đồ thị hàm số bậc ba tại tối đa 3 điểm phân biệt. Điều này xảy ra khi đường thẳng nằm giữa giá trị cực đại và giá trị cực tiểu của hàm số.]
  ]
)

#tln(
  dir: "doc",
  [Có bao nhiêu giá trị nguyên của tham số $m$ để phương trình $x^3 - 3x^2 - m^2 + 5m = 0$ có ba nghiệm thực phân biệt?],
  [$0$],
  loigiai: [
    #step[Phương trình tương đương $x^3 - 3x^2 = m^2 - 5m$.]
    #step[Khảo sát hàm số $f(x) = x^3 - 3x^2$. Ta có $f'(x) = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Giá trị cực đại $f(0) = 0$. Giá trị cực tiểu $f(2) = -4$.]
    #step[Để phương trình có ba nghiệm phân biệt, đường thẳng $y = m^2 - 5m$ phải cắt đồ thị hàm số $y = f(x)$ tại 3 điểm. Điều kiện là: $-4 < m^2 - 5m < 0$.]
    #step[Giải bất phương trình $m^2 - 5m < 0 <=> 0 < m < 5$.]
    #step[Giải bất phương trình $m^2 - 5m > -4 <=> m^2 - 5m + 4 > 0 <=> m < 1$ hoặc $m > 4$.]
    #step[Kết hợp điều kiện, ta được $0 < m < 1$ hoặc $4 < m < 5$.]
    #step[Vì $m$ là số nguyên, không có giá trị nào của $m$ thỏa mãn nằm trong hai khoảng trên. Vậy có 0 giá trị.]
  ]
)

#tln(
  dir: "doc",
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị như hình vẽ.
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt)
      content((2.5, 0), $x$, anchor: "north", padding: 2pt)
      line((0, -2.5), (0, 4.5), mark: (end: ">"), stroke: 0.5pt)
      content((0, 4.5), $y$, anchor: "west", padding: 2pt)
      content((0.2, -0.2), $O$)
      
      let pts = ()
      for i in range(-24, 24) {
        let x = i / 10
        let y = -calc.pow(x, 4) + 4 * calc.pow(x, 2)
        if y >= -2.4 and y <= 4.4 and x >= -2.4 and x <= 2.4 {
          pts.push((x, y))
        }
      }
      line(..pts, stroke: 1.2pt + blue)
      
      // Đánh dấu các điểm
      let sqrt2 = 1.414
      line((sqrt2, 0), (sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      line((-sqrt2, 0), (-sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      line((-sqrt2, 4), (sqrt2, 4), stroke: (dash: "dashed", paint: gray))
      
      content((sqrt2, -0.3), $sqrt(2)$)
      content((-sqrt2, -0.3), $-sqrt(2)$)
      content((-0.2, 4), $4$, anchor: "east")
    })
  ]
  Biết phương trình $f(x) = m$ có 4 nghiệm phân biệt thì giá trị nguyên lớn nhất của tham số $m$ bằng bao nhiêu?],
  [$3$],
  loigiai: [
    #step[Dựa vào đồ thị, hàm số $f(x)$ là hàm bậc bốn trùng phương có điểm cực tiểu tại góc tọa độ $O(0; 0)$ và hai điểm cực đại đạt giá trị $y = 4$.]
    #step[Để phương trình $f(x) = m$ có đúng 4 nghiệm phân biệt thì đường thẳng $y = m$ phải cắt đồ thị tại 4 điểm phân biệt.]
    #step[Quan sát đồ thị, điều kiện này xảy ra khi và chỉ khi đường thẳng $y = m$ nằm trong khoảng giữa giá trị cực tiểu và giá trị cực đại, tức là $0 < m < 4$.]
    #step[Các giá trị nguyên của $m$ thỏa mãn là $m \in \{1; 2; 3\}$.]
    #step[Vậy giá trị nguyên lớn nhất của tham số $m$ là $3$.]
  ]
)

#tln(
  dir: "doc",
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $y'$,
        func: $f(x)$,
        x-vals: ($-oo$, $1$, $3$, $+oo$),
        d-signs: ("+", "0", "-", "0", "+"),
        v-vals: ($-oo$, $2$, $-4$, $+oo$)
      )
    ]
  Hỏi phương trình $2f(x) + 3 = 0$ có bao nhiêu nghiệm phân biệt?],
  [$3$],
  loigiai: [
    #step[Biến đổi phương trình: $2f(x) + 3 = 0 <=> f(x) = -3/2$.]
    #step[Số nghiệm của phương trình chính là số giao điểm của đồ thị hàm số $y = f(x)$ và đường thẳng $y = -1.5$.]
    #step[Dựa vào bảng biến thiên, ta thấy giá trị cực đại là $2$ và giá trị cực tiểu là $-4$.]
    #step[Vì $-4 < -1.5 < 2$ nên đường thẳng $y = -1.5$ cắt đồ thị $y = f(x)$ tại đúng 3 điểm phân biệt.]
    #step[Vậy phương trình đã cho có 3 nghiệm phân biệt.]
  ]
)
