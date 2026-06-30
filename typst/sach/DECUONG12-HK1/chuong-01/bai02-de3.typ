#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 03])

#resetexamstate()
#exam-part([P HẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-0.2, 2.5), (-0.2, -0.5), stroke: 3pt + gray)
    content((-0.5, 1.0), [Tường], rotate: 90deg)
    rect((0, 0), (2.5, 2), stroke: 1.2pt + blue, fill: blue.lighten(95%))
    content((1.25, -0.45), $y$)
    content((2.95, 1), $x$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một người nông dân muốn rào một khu vườn hình chữ nhật sát một bức tường thẳng (không cần rào phía bức tường). Người đó có $60$ m lưới. Tìm diện tích lớn nhất của khu vườn mà người đó có thể rào được.],
  (
    [$300 "m"^2$],
    True([$450 "m"^2$]),
    [$900 "m"^2$],
    [$225 "m"^2$]
  ),
  loigiai: [
    #step[Gọi $y$ là chiều dài hàng rào song song với tường, $x$ là hai cạnh vuông góc. Ta có chu vi rào là $2x + y = 60 => y = 60 - 2x$ (với $0 < x < 30$).]
    #step[Diện tích khu vườn $S = x y = x(60 - 2x) = 60x - 2x^2$.]
    #step[Đạo hàm $S' = 60 - 4x = 0 <=> x = 15$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $15$, $30$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $450$, $0$)
        )
      ]
      Từ BBT suy ra diện tích lớn nhất $S_"max" = 450$ ($"m"^2$).]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    rect((0, 0), (3, 2), stroke: 1.2pt + blue, fill: blue.lighten(95%))
    line((1, 0), (1, 2), stroke: 1.2pt + blue)
    line((2, 0), (2, 2), stroke: 1.2pt + blue)
    content((0.5, 1), $x$)
    content((1.5, 1), $x$)
    content((2.5, 1), $x$)
    content((1.5, -0.45), $y$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một nông dân muốn chia một mảnh đất hình chữ nhật thành ba chuồng bò hình chữ nhật bằng hai hàng rào song song với chiều rộng của mảnh đất. Tổng chiều dài các hàng rào là $120$ m. Tìm diện tích lớn nhất của mảnh đất.],
  (
    True([$450 "m"^2$]),
    [$900 "m"^2$],
    [$600 "m"^2$],
    [$300 "m"^2$]
  ),
  loigiai: [
    #step[Gọi $x$ là chiều dài các hàng rào ngăn (có 4 rào chiều $x$) và $y$ là 2 chiều dài của mảnh đất. Ta có $4x + 2y = 120 => 2x + y = 60 => y = 60 - 2x$.]
    #step[Diện tích mảnh đất là $S = x y = x(60 - 2x) = 60x - 2x^2$.]
    #step[Đạo hàm $S' = 60 - 4x = 0 <=> x = 15$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $15$, $30$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $450$, $0$)
        )
      ]
      Vậy diện tích lớn nhất là $450$ ($"m"^2$).]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-0.5, -0.2), (3.5, -0.2), stroke: 3pt + gray)
    content((1.5, -0.65), [Đường lộ])
    rect((0, 0), (3, 1.8), stroke: 1.2pt + blue, fill: blue.lighten(95%))
    content((1.5, 0.9), $S = 200 "m"^2$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình chữ nhật có diện tích $200 "m"^2$. Một mặt của mảnh đất giáp đường nên chi phí xây rào là $300.000$ đồng/m, ba mặt còn lại chi phí xây rào là $100.000$ đồng/m. Chi phí nhỏ nhất để rào toàn bộ mảnh đất là bao nhiêu?],
  (
    True([$8$ triệu đồng]),
    [$10$ triệu đồng],
    [$6$ triệu đồng],
    [$12$ triệu đồng]
  ),
  loigiai: [
    #step[Gọi $x$ là chiều dài mặt giáp đường và $y$ là cạnh vuông góc. Có $x y = 200 => y = (200) / (x)$.]
    #step[Tổng chi phí $C = 300x + 100x + 100(2y) = 400x + 200y$ (nghìn đồng).]
    #step[Thay $y$, $C(x) = 400x + (40000) / (x)$ với $x > 0$.]
    #step[Đạo hàm $C'(x) = 400 - (40000) / (x^2) = 0 <=> x^2 = 100 <=> x = 10$. Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $10$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $8000$, $+oo$)
        )
      ]
      Chi phí thấp nhất là $8000$ (nghìn đồng) tức $8$ triệu đồng.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    rect((-1, 0), (1, 1.2), stroke: 1.2pt)
    arc((1, 1.2), start: 0deg, stop: 180deg, radius: 1, stroke: 1.2pt)
    line((-1, 1.2), (1, 1.2), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một cửa sổ có dạng phía dưới là hình chữ nhật, phía trên là một nửa hình tròn. Chu vi cửa sổ là $4 + pi$ m. Để diện tích cửa sổ là lớn nhất thì chiều rộng của cửa sổ bằng bao nhiêu?],
  (
    [$1$ m],
    True([$2$ m]),
    [$1.5$ m],
    [$2.5$ m]
  ),
  loigiai: [
    #step[Gọi bán kính nửa đường tròn là $R$, chiều rộng là $2R$, chiều cao HCN là $h$. Chu vi $2h + 2R + pi R = 4 + pi => h = 2 + (pi)/(2) - R(1 + (pi)/(2))$.]
    #step[Diện tích $S = 2R h + (1)/(2) pi R^2 = 2R(2 + (pi)/(2) - R(1 + (pi)/(2))) + (1)/(2) pi R^2$.]
    #step[Thu gọn $S = (4+pi)R - (2 + (pi)/(2))R^2$. Đạo hàm $S' = (4+pi) - (4+pi)R = 0 <=> R = 1$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $R$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $1$, $+oo$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $S_"max"$, $-oo$)
        )
      ]
      Chiều rộng cửa sổ để đón được nhiều ánh sáng nhất là $2R = 2$ m.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.55cm, {
    import draw: *
    line((-1, 0), (7, 0), stroke: 1.5pt + blue)
    content((7, 0), $d$, anchor: "south-west")
    circle((1, 2), radius: 1.5pt, fill: black)
    content((1, 2), $A$, anchor: "south")
    circle((5, 3.33), radius: 1.5pt, fill: black)
    content((5, 3.33), $B$, anchor: "south")
    line((1, 2), (1, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((5, 3.33), (5, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    circle((2.5, 0), radius: 1.5pt, fill: red)
    content((2.5, 0.35), $P$, anchor: "south")
    line((1, 2), (2.5, 0), stroke: 1.2pt + green.darken(20%))
    line((2.5, 0), (5, 3.33), stroke: 1.2pt + green.darken(20%))
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Hai làng $A$ và $B$ nằm về cùng một phía của một con sông thẳng $d$. Khoảng cách từ $A$ và $B$ đến con sông lần lượt là $3$ km và $5$ km. Khoảng cách giữa hình chiếu của $A$ và $B$ trên bờ sông là $6$ km. Người ta muốn xây dựng một trạm bơm nước trên bờ sông để dẫn nước về hai làng. Tổng chiều dài đường ống dẫn nước ngắn nhất là bao nhiêu?],
  (
    True([$10$ km]),
    [$12$ km],
    [$8$ km],
    [$2sqrt(34)$ km]
  ),
  loigiai: [
    #step[Gọi $A'$ là điểm đối xứng của $A$ qua đường thẳng $d$. Ta có $A P + P B = A' P + P B >= A' B$.]
    #step[Khoảng cách ngắn nhất chính là độ dài đoạn $A' B$.]
    #step[Khoảng cách từ $A', B$ đến đường thẳng chứa hình chiếu (dài $6$ km) tạo thành tam giác vuông có hai cạnh góc vuông là $6$ và $3 + 5 = 8$.]
    #step[Suy ra $A' B = sqrt(6^2 + 8^2) = 10$ km.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((0, 2.5), (0, 0), (3.5, 0), close: true, stroke: 1.2pt)
    line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.5pt)
    content((1.8, 1.5), [10 m], rotate: -35deg)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình tam giác vuông có cạnh huyền dài $10$ m. Diện tích lớn nhất của mảnh đất đó bằng bao nhiêu?],
  (
    [$50 "m"^2$],
    True([$25 "m"^2$]),
    [$25sqrt(2) "m"^2$],
    [$100 "m"^2$]
  ),
  loigiai: [
    #step[Gọi hai cạnh góc vuông là $x, y$. Ta có $x^2 + y^2 = 100 => y = sqrt(100 - x^2)$.]
    #step[Diện tích $S = (1)/(2) x y = (1)/(2) x sqrt(100 - x^2)$. Đạo hàm $S' = (1)/(2) sqrt(100-x^2) - (x^2)/(2sqrt(100-x^2)) = (100 - 2x^2)/(2sqrt(100-x^2))$.]
    #step[Giải $S' = 0 <=> x^2 = 50 <=> x = 5 sqrt(2)$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $5 sqrt(2)$, $10$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $25$, $0$)
        )
      ]
      Diện tích lớn nhất là $25$.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((0, 4), (0, 0), (4, 0), stroke: 1.5pt)
    line((1, 4), (1, 1.5), (4, 1.5), stroke: 1.5pt)
    line((0, 2.25), (3, 0), stroke: 1.5pt + red)
    line((0, 3.5), (1, 3.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((0.5, 3.8), $1 "m"$)
    line((3.5, 0), (3.5, 1.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
    content((3.9, 0.75), $8 "m"$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một người muốn mang một thanh sào dài qua một góc hành lang chữ L có chiều rộng hai lối đi lần lượt là $1$ m và $8$ m (hai lối đi vuông góc với nhau). Thanh sào được khống chế đi song song với mặt đất. Chiều dài lớn nhất của thanh sào để có thể đi qua góc cua là bao nhiêu?],
  (
    True([$5sqrt(5)$ m]),
    [$9$ m],
    [$3sqrt(3)$ m],
    [$7$ m]
  ),
  loigiai: [
    #step[Gọi $theta$ là góc nghiêng của thanh sào. Chiều dài lớn nhất thanh sào lọt qua là giá trị nhỏ nhất của $L(theta) = (1)/(cos theta) + (8)/(sin theta)$.]
    #step[Đạo hàm $L'(theta) = (sin theta)/(cos^2 theta) - (8 cos theta)/(sin^2 theta) = (sin^3 theta - 8 cos^3 theta)/(sin^2 theta cos^2 theta)$.]
    #step[Giải $L'(theta) = 0 <=> tan^3 theta = 8 <=> tan theta = 2$.]
    #step[Khi $tan theta = 2$, $sin theta = (2)/(sqrt(5))$ và $cos theta = (1)/(sqrt(5))$. BBT sẽ cho thấy đây là cực tiểu.]
    #step[$L_"min" = (1)/((1)/(sqrt(5))) + (8)/((2)/(sqrt(5))) = sqrt(5) + 4 sqrt(5) = 5 sqrt(5)$.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    rect((0, 0), (3, 4), stroke: 1.2pt)
    rect((0.4, 0.6), (2.6, 3.4), stroke: 0.8pt + blue, fill: blue.lighten(95%))
    content((1.5, 2), $32 "cm"^2$)
    content((1.5, 3.7), $2 "cm"$)
    content((1.5, 0.3), $2 "cm"$)
    content((0.2, 2), $1 "cm"$, rotate: 90deg)
    content((2.8, 2), $1 "cm"$, rotate: -90deg)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một trang quảng cáo hình chữ nhật cần có diện tích phần in ấn là $32 "cm"^2$. Lề trên và lề dưới rộng $2$ cm, lề trái và lề phải rộng $1$ cm. Diện tích nhỏ nhất của toàn bộ trang quảng cáo là bao nhiêu?],
  (
    True([$72 "cm"^2$]),
    [$64 "cm"^2$],
    [$80 "cm"^2$],
    [$50 "cm"^2$]
  ),
  loigiai: [
    #step[Gọi kích thước phần in ấn là $x, y$. Ta có $x y = 32 => y = (32)/(x)$.]
    #step[Trang quảng cáo có kích thước là $(x+2)$ và $(y+4)$.]
    #step[Diện tích toàn trang $S(x) = (x+2)( (32)/(x) + 4 ) = 32 + 4x + (64)/(x) + 8 = 40 + 4x + (64)/(x)$.]
    #step[Đạo hàm $S'(x) = 4 - (64)/(x^2) = 0 <=> x = 4$. BBT cho thấy đây là điểm cực tiểu.]
    #step[$S_"min" = 40 + 16 + 16 = 72$.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.5cm, {
    import draw: *
    line((-3, 2.6), (-1.5, 0), (1.5, 0), (3, 2.6), stroke: 1.2pt)
    line((1.5, 0), (3.5, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0, -0.45), $10 "cm"$)
    content((2.6, 1.3), $10 "cm"$, rotate: 60deg)
    content((-2.6, 1.3), $10 "cm"$, rotate: -60deg)
    arc((1.5, 0), start: 0deg, stop: 60deg, radius: 0.7, stroke: 0.5pt)
    content((2.5, 0.5), $theta$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một máng nước bằng tôn được tạo thành bằng cách gập hai bên của một tấm tôn phẳng rộng $30$ cm lên một góc $theta$ sao cho mặt cắt ngang là hình thang cân gồm đáy dài $10$ cm và hai bên mỗi bên dài $10$ cm. Để máng nước có diện tích mặt cắt lớn nhất thì góc $theta$ bằng bao nhiêu?],
  (
    True([$60°$]),
    [$45°$],
    [$30°$],
    [$75°$]
  ),
  loigiai: [
    #step[Mặt cắt ngang có đáy nhỏ $10$, 2 cạnh bên $10$, gập góc $theta$.]
    #step[Chiều cao máng $h = 10 sin theta$. Đáy lớn là $10 + 20 cos theta$.]
    #step[Diện tích $S = (10 + 10 + 20 cos theta)/(2) dot 10 sin theta = 100(1 + cos theta)sin theta$.]
    #step[Đạo hàm $S' = 100(2 cos^2 theta + cos theta - 1) = 0 <=> cos theta = (1)/(2) <=> theta = 60^degree$.]
    #step[BBT cho thấy cực đại tại $theta = 60^degree$.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.5cm, {
    import draw: *
    arc((3, 0), start: 0deg, stop: 180deg, radius: 3, stroke: 1.2pt)
    line((-3.5, 0), (3.5, 0), stroke: 0.8pt)
    rect((-2, 0), (2, 2.23), stroke: 1pt + blue, fill: blue.lighten(95%))
    circle((0, 0), radius: 1pt, fill: black)
    content((0, -0.45), $O$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình chữ nhật được trồng cỏ nằm trong một khuôn viên hình bán nguyệt có bán kính $10$ m. Một cạnh của mảnh đất nằm trên đường kính của bán nguyệt, hai đỉnh còn lại nằm trên đường cung tròn. Diện tích lớn nhất của mảnh đất trồng cỏ đó là bao nhiêu?],
  (
    True([$100 "m"^2$]),
    [$50 "m"^2$],
    [$50sqrt(2) "m"^2$],
    [$200 "m"^2$]
  ),
  loigiai: [
    #step[Gọi $x$ là nửa chiều dài mặt đáy, $y$ là chiều cao HCN. Mảnh đất nằm trong bán nguyệt bán kính $10$ nên $x^2 + y^2 = 100 => y = sqrt(100 - x^2)$.]
    #step[Diện tích HCN là $S(x) = 2x sqrt(100 - x^2)$.]
    #step[Đạo hàm $S'(x) = 2(sqrt(100-x^2) - (x^2)/(sqrt(100-x^2))) = (200 - 4x^2)/(sqrt(100-x^2))$.]
    #step[$S'(x) = 0 <=> x^2 = 50 <=> x = 5 sqrt(2)$. BBT cho thấy đây là cực đại. Diện tích lớn nhất là $100$.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.5cm, {
    import draw: *
    let pts = ()
    for i in range(-30, 31) {
      let x = i / 10
      let y = 3 - 0.33 * x * x
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + green.darken(20%))
    line((-3.8, 0), (3.8, 0), stroke: 0.8pt)
    rect((-1.73, 0), (1.73, 2), stroke: 1pt + blue, fill: blue.lighten(95%))
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một cổng chào có dạng một parabol với chiều cao $9$ m và chiều rộng chân cổng là $6$ m. Người ta muốn treo một tấm bảng quảng cáo hình chữ nhật bên trong cổng sao cho hai đỉnh dưới nằm trên mặt đất và hai đỉnh trên thuộc parabol. Diện tích lớn nhất của tấm bảng quảng cáo là bao nhiêu?],
  (
    True([$12sqrt(3) "m"^2$]),
    [$18 "m"^2$],
    [$24 "m"^2$],
    [$16sqrt(2) "m"^2$]
  ),
  loigiai: [
    #step[Chọn hệ trục tọa độ sao cho đỉnh parabol trên trục $O y$. Parabol đi qua $(0, 9)$ và $(+-3, 0)$, phương trình là $y = 9 - x^2$.]
    #step[Giả sử đỉnh bảng quảng cáo là $(x, y)$ với $x in (0; 3)$, thì kích thước bảng là $2x$ và $y = 9 - x^2$.]
    #step[Diện tích $S = 2x(9 - x^2) = 18x - 2x^3$.]
    #step[Đạo hàm $S' = 18 - 6x^2 = 0 <=> x = sqrt(3)$. BBT cho cực đại tại đây.]
    #step[$S_"max" = 2 sqrt(3) (9 - 3) = 12 sqrt(3)$.]
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((0, 0), (3 * calc.cos(15deg), 3 * calc.sin(15deg)), stroke: 1.2pt)
    line((0, 0), (3 * calc.cos(75deg), 3 * calc.sin(75deg)), stroke: 1.2pt)
    arc((3 * calc.cos(15deg), 3 * calc.sin(15deg)), start: 15deg, stop: 75deg, radius: 3, stroke: 1.2pt)
    content((1.2, 0.15), $R$)
    content((0.2, 0.85), $R$)
    content((2.2, 1.8), $s$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một bồn hoa có dạng hình quạt tròn (giới hạn bởi hai bán kính và một cung tròn) có chu vi bằng $20$ m. Để diện tích bồn hoa lớn nhất thì bán kính của hình quạt tròn đó phải bằng bao nhiêu?],
  (
    True([$5$ m]),
    [$4$ m],
    [$6$ m],
    [$10$ m]
  ),
  loigiai: [
    #step[Bồn hoa có cung tròn dài $s$, chu vi $2R + s = 20 => s = 20 - 2R$.]
    #step[Diện tích hình quạt $S = (1)/(2) R s = (1)/(2) R (20 - 2R) = 10R - R^2$.]
    #step[Đạo hàm $S' = 10 - 2R = 0 <=> R = 5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $R$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $5$, $10$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $25$, $0$)
        )
      ]
      Diện tích lớn nhất bằng $25$ khi $R = 5$.]
  ]
)

#resetcau()
#exam-part([P HẦN I I. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    arc((2, 0), start: 0deg, stop: 180deg, radius: 2, stroke: 1.2pt)
    line((-2, 0), (2, 0), stroke: 1.2pt)
    content((-2, -0.35), $B$)
    content((2, -0.35), $C$)
    let ax = 2 * calc.cos(60deg)
    let ay = 2 * calc.sin(60deg)
    line((-2, 0), (ax, ay), (2, 0), stroke: 1.2pt + blue)
    content((ax, ay + 0.3), $A$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khu đất hình tam giác $A B C$ vuông tại $A$ nội tiếp trong một đường tròn bán kính $R = 10$ m. Cạnh huyền $B C$ cố định là đường kính của đường tròn, đỉnh $A$ di động trên đường tròn. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Diện tích của khu đất $A B C$ đạt giá trị lớn nhất khi tam giác $A B C$ cân tại $A$.]),
    True([Khi diện tích khu đất lớn nhất, chiều cao ứng với cạnh huyền bằng $10$ m.]),
    True([Diện tích lớn nhất của khu đất bằng $100 "m"^2$.]),
    [Chu vi của tam giác $A B C$ đạt giá trị lớn nhất bằng $20 + 10sqrt(2)$ m.]
  ),
  loigiai: [
    #step[Diện tích $S = (1)/(2) A H dot B C$ (với $A H$ là đường cao). Do $B C$ cố định bằng $20$, $S$ lớn nhất khi $A H$ lớn nhất. (Mệnh đề a đúng)]
    #step[$A H_"max"$ bằng bán kính $R = 10$. Khi đó $Delta A B C$ vuông cân. (Mệnh đề b đúng)]
    #step[$S_"max" = (1)/(2) dot 10 dot 20 = 100$. (Mệnh đề c đúng)]
    #step[Chu vi $P = A B + A C + 20 <= sqrt(2(A B^2 + A C^2)) + 20 = sqrt(2 dot 400) + 20 = 20 sqrt(2) + 20$. Mệnh đề d sai.]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-0.5, 2.2), (3.5, 2.2), stroke: 2pt + blue)
    content((1.5, 2.5), [Kênh nước])
    rect((0, 0), (3, 2), stroke: 1.2pt + green.darken(20%), fill: green.lighten(95%))
    content((1.5, -0.45), $x$)
    content((3.3, 1), $y$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh vườn hình chữ nhật nằm sát một con kênh thẳng. Người ta rào 3 phía còn lại bằng $120$ m lưới. Cạnh song song với con kênh dài $x$ (m), hai cạnh vuông góc với kênh dài $y$ (m). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Diện tích của vườn tính theo $y$ là $S(y) = 120y - 2y^2$.]),
    True([Diện tích vườn lớn nhất khi kích thước các cạnh là $y = 30$ m và $x = 60$ m.]),
    True([Diện tích lớn nhất có thể rào được là $1800 "m"^2$.]),
    [Nếu người đó muốn rào thêm một hàng rào ngăn đôi khu vườn song song với hai cạnh vuông góc với kênh thì với $120$ m lưới đó, diện tích lớn nhất có thể rào được vẫn bằng $1800 "m"^2$.]
  ),
  loigiai: [
    #step[Có $x + 2y = 120 => x = 120 - 2y$. Diện tích $S(y) = y(120 - 2y) = 120y - 2y^2$. (Mệnh đề a đúng)]
    #step[Đạo hàm $S' = 120 - 4y = 0 <=> y = 30$. (Mệnh đề b đúng)]
    #step[Bảng biến thiên cho $S$ đạt cực đại tại $y = 30$, $S_"max" = 1800$. (Mệnh đề c đúng)]
    #step[Nếu ngăn đôi song song 2 cạnh vuông góc thì có 3 rào $y$, ta có $x + 3y = 120 => S = y(120 - 3y)$. Max khi $y=20, x=60 => S = 1200$. (Mệnh đề d sai)]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    rect((0, 0), (3, 2), stroke: 1.2pt, fill: blue.lighten(95%))
    content((1.5, -0.45), $x$)
    content((3.3, 1), $y$)
    content((1.5, 1), $S = 400 "m"^2$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một khu đất hình chữ nhật có diện tích bằng $400 "m"^2$ cần được rào xung quanh. Người ta gọi hai kích thước của khu đất là $x$ (m) và $y$ (m). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Chu vi của khu đất là $P(x) = 2x + 800/x$ với $x > 0$.]),
    True([Khu đất có chu vi nhỏ nhất khi nó là hình vuông cạnh $20$ m.]),
    True([Chu vi nhỏ nhất của khu đất bằng $80$ m.]),
    [Nếu giá tiền rào ba mặt là $100.000$ đồng/m và mặt thứ tư (mặt tiền) là $300.000$ đồng/m thì tổng chi phí rào nhỏ nhất khi chiều rộng mặt tiền của mảnh đất là $10$ m.]
  ),
  loigiai: [
    #step[Diện tích $x y = 400 => y = (400)/(x)$. Chu vi $P = 2(x+y) = 2x + (800)/(x)$. (Mệnh đề a đúng)]
    #step[Theo AM-GM, $P >= 2 sqrt(1600) = 80$. Đẳng thức khi $2x = (800)/(x) <=> x = 20$. Đây là hình vuông. (Mệnh đề b, c đúng)]
    #step[Chi phí $C = 300x + 100x + 100(2y) = 400x + 200((400)/(x)) = 400x + (80000)/(x)$.]
    #step[C nhỏ nhất khi $400x = (80000)/(x) <=> x^2 = 200 <=> x = 10 sqrt(2)$. Không phải $10$. (Mệnh đề d sai)]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((0, 3), (0, 0), (4, 0), close: true, stroke: 1.2pt)
    content((0, 3), $B$, anchor: "south-east")
    content((0, -0.35), $A$, anchor: "north-east")
    content((4, -0.35), $C$, anchor: "north-west")
    line((0.2, 0), (0.2, 0.2), (0, 0.2), stroke: 0.5pt)
    rect((0, 0), (2, 1.5), stroke: 1pt + red, fill: red.lighten(95%))
    content((0, 1.5), $D$, anchor: "east")
    content((2, 1.5), $E$, anchor: "south-west")
    content((2, -0.35), $F$, anchor: "north")
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một mảnh đất hình tam giác vuông $A B C$ có hai cạnh góc vuông $A B = 30$ m, $A C = 40$ m. Người ta muốn xây dựng một ngôi nhà hình chữ nhật $A D E F$ bên trong mảnh đất sao cho $D in A B$, $F in A C$ và $E in B C$. Đặt $A D = x$ (m), $A F = y$ (m). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Mối quan hệ giữa hai kích thước của ngôi nhà là $y = 40 - 4/3 x$ với $0 < x < 30$.]),
    True([Diện tích lớn nhất của ngôi nhà có thể đạt được bằng $300 "m"^2$.]),
    True([Khi ngôi nhà có diện tích lớn nhất thì diện tích ngôi nhà chiếm đúng $50\%$ diện tích mảnh đất $A B C$.]),
    [Chu vi lớn nhất của ngôi nhà hình chữ nhật $A D E F$ bằng $70$ m.]
  ),
  loigiai: [
    #step[Gọi $A D = x, A F = y$. Do tam giác đồng dạng $F E / A B = F C / A C => x / 30 = (40 - y) / 40 => y = 40 - (4)/(3) x$. (Mệnh đề a đúng)]
    #step[Diện tích nhà $S = x y = x(40 - (4)/(3) x)$. Đạo hàm $S' = 40 - (8)/(3) x = 0 <=> x = 15$. BBT cho $S_"max" = 300$. (Mệnh đề b đúng)]
    #step[Diện tích $Delta A B C$ là $(1)/(2) dot 30 dot 40 = 600$. $300$ chiếm $50\%$. (Mệnh đề c đúng)]
    #step[Chu vi $P = 2(x+y) = 2(x + 40 - (4)/(3) x) = 80 - (2)/(3) x$. Hàm số nghịch biến trên $(0; 30)$, không có cực trị. (Mệnh đề d sai)]
  ]
)

#resetcau()
#exam-part([P HẦN I II. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Một người nông dân muốn rào một khu vườn hình chữ nhật sát một con sông thẳng (không rào phía con sông). Người đó có $80$ m lưới. Tìm diện tích lớn nhất (theo đơn vị $"m"^2$) của khu vườn mà người đó có thể rào được.],
  [$800$],
  loigiai: [
    #step[Có lưới dài $80$ m, $x + 2y = 80 => x = 80 - 2y$.]
    #step[Diện tích $S(y) = y(80 - 2y) = 80y - 2y^2$.]
    #step[Đạo hàm $S' = 80 - 4y = 0 <=> y = 20$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $y$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $20$, $40$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $800$, $0$)
        )
      ]
      Diện tích lớn nhất là $800$.]
  ]
)

#tln(
  dir: "ngang",
  [Một mảnh vườn hình chữ nhật nằm ở góc một bức tường vuông góc. Người ta muốn rào hai phía còn lại để tạo thành một khu vườn hình chữ nhật có diện tích $100 "m"^2$. Tổng chiều dài hàng rào ngắn nhất bằng bao nhiêu mét?],
  [$20$],
  loigiai: [
    #step[Diện tích $x y = 100 => y = (100)/(x)$.]
    #step[Chiều dài hàng rào là $L(x) = x + (100)/(x)$.]
    #step[Đạo hàm $L'(x) = 1 - (100)/(x^2) = 0 <=> x = 10$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $10$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $20$, $+oo$)
        )
      ]
      Chiều dài ngắn nhất là $20$.]
  ]
)

#tln(
  dir: "ngang",
  [Một đoạn dây đồng dài $40$ cm được cắt thành hai đoạn để uốn thành hai hình vuông. Tổng diện tích nhỏ nhất của hai hình vuông đó bằng bao nhiêu $"cm"^2$?],
  [$50$],
  loigiai: [
    #step[Cắt $40$ thành $x$ và $40-x$. Cạnh hình vuông là $x / 4$ và $(40-x) / 4$.]
    #step[Tổng diện tích $S(x) = (x / 4)^2 + ((40-x) / 4)^2 = (x^2 + (40-x)^2) / 16$.]
    #step[Đạo hàm $S'(x) = (2x - 2(40-x)) / 16 = (4x - 80) / 16 = 0 <=> x = 20$.]
    #step[Bảng biến thiên cho thấy $S$ đạt cực tiểu tại $x=20$. $S_"min" = (20^2 + 20^2) / 16 = 50$.]
  ]
)

#tln(
  dir: "ngang",
  [Một bồn hoa có dạng hình tam giác cân với hai cạnh bên bằng $10$ m. Diện tích lớn nhất của bồn hoa đó bằng bao nhiêu mét vuông?],
  [$50$],
  loigiai: [
    #step[Diện tích tam giác $S = (1)/(2) a b sin C = (1)/(2) dot 10 dot 10 sin C = 50 sin C$.]
    #step[Đạo hàm theo $C$: $S' = 50 cos C = 0 <=> C = 90^degree$.]
    #step[Bảng biến thiên cho thấy $S$ lớn nhất khi $C = 90^degree$.]
    #step[Diện tích lớn nhất bằng $50$.]
  ]
)

#tln(
  dir: "ngang",
  [Một hộ dân muốn rào một khu vườn hình chữ nhật có diện tích $800 "m"^2$ sát một bức tường thẳng (không cần rào phía bức tường). Chiều dài lưới ít nhất để rào khu vườn đó bằng bao nhiêu mét?],
  [$80$],
  loigiai: [
    #step[Diện tích $S = x y = 800 => x = (800)/(y)$.]
    #step[Chiều dài lưới $L(y) = x + 2y = (800)/(y) + 2y$.]
    #step[Đạo hàm $L'(y) = 2 - (800)/(y^2) = 0 <=> y^2 = 400 <=> y = 20$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $y$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $20$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $80$, $+oo$)
        )
      ]
      Lưới ít nhất dài $80$ m.]
  ]
)

#tln(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    line((-1.5, 0.75), (1.5, 0.75), stroke: 1pt)
    line((-1.5, -0.75), (1.5, -0.75), stroke: 1pt)
    arc((1.5, 0.75), start: 90deg, stop: -90deg, radius: 0.75, stroke: 1pt)
    arc((-1.5, -0.75), start: 270deg, stop: 90deg, radius: 0.75, stroke: 1pt)
    line((-1.5, -0.75), (-1.5, 0.75), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line((1.5, -0.75), (1.5, 0.75), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((0, 0.95), $x$)
    content((0, -0.95), $x$)
    line((1.5, 0), (2.25, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    content((1.8, 0.25), $r$)
  }),
  fig-pos: "right",
  fig-width: 45%,
  [Một đường chạy trong sân vận động có chu vi vòng trong là $400$ m gồm hai đoạn thẳng song song có độ dài $x$ (m) bằng nhau và hai cung tròn bán nguyệt có bán kính $r$ (m) ở hai đầu. Để phần diện tích hình chữ nhật giới hạn bởi hai đoạn thẳng song song lớn nhất thì độ dài $x$ của mỗi đoạn thẳng phải bằng bao nhiêu mét?],
  [$100$],
  loigiai: [
    #step[Chu vi $2x + 2pi r = 400 => x = 200 - pi r$.]
    #step[Diện tích phần hình chữ nhật $S(r) = 2r x = 2r(200 - pi r) = 400r - 2pi r^2$.]
    #step[Đạo hàm $S'(r) = 400 - 4pi r = 0 <=> r = (100)/(pi)$.]
    #step[Bảng biến thiên cho thấy $S$ đạt cực đại tại $r = (100)/(pi)$. Khi đó $x = 200 - pi( (100)/(pi) ) = 100$.]
  ]
)
