#import "_config.typ": *

#muc([Đề Luyện Tập Số 03])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x^3 - 3x^2$ nghịch biến trên khoảng nào?],
  ([$( -oo; 0 )$], [$(2; +oo)$], True([$(0; 2)$]), [$(0; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 3x^2 - 6x$.]
    #step[Xét $y' < 0 <=> 3x^2 - 6x < 0 <=> 0 < x < 2$.]
    #step[Do đó, hàm số nghịch biến trên khoảng $(0; 2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f'$,
        func: $f$,
        x-vals: ($-oo$, $1$, $3$, $+oo$),
        d-signs: ($-$, $0$, $+$, $0$, $-$),
        v-vals: ($+oo$, $-2$, $4$, $-oo$),
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng dưới đây?],
  (True([$( -oo; 1 )$]), [$(1; 3)$], [$(1; +oo)$], [$(-2; 4)$]),
  accent: c-book,
  loigiai: [
    #step[Dựa vào bảng biến thiên, ta thấy trên khoảng $(-oo; 1)$ và $(3; +oo)$, đạo hàm $f'(x) < 0$.]
    #step[Do đó hàm số nghịch biến trên các khoảng $(-oo; 1)$ và $(3; +oo)$.]
    #step[Chọn phương án $( -oo; 1 )$ trong các đáp án cho trước.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = -x^4 + 2x^2 + 3$ nghịch biến trên khoảng nào dưới đây?],
  ([$(-oo; -1)$], [$(-1; 0)$], True([$(1; +oo)$]), [$(0; 1)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = -4x^3 + 4x = -4x(x^2 - 1)$.]
    #step[Nghiệm của đạo hàm gồm $x = 0$, $x = +-1$.]
    #step[Xét dấu đạo hàm: $y' < 0 <=> x in (-1; 0) union (1; +oo)$.]
    #step[Đối chiếu với các phương án lựa chọn, ta chọn khoảng $(1; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = (x - 3)/(x + 1)$ đồng biến trên khoảng nào dưới đây?],
  ([$RR$], [$(-oo; -1) union (-1; +oo)$], True([$(-1; +oo)$]), [$RR backslash {-1}$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {-1}$.]
    #step[Đạo hàm $y' = (1 dot.c 1 - (-3) dot.c 1)/(x + 1)^2 = 4/(x + 1)^2 > 0, forall x != -1$.]
    #step[Hàm số đồng biến trên các khoảng $(-oo; -1)$ và $(-1; +oo)$.]
    #step[Do đó, hàm số đồng biến trên khoảng $(-1; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = sqrt(x^2 - 4x)$ nghịch biến trên khoảng nào?],
  ([$(-oo; 0)$], [$(4; +oo)$], True([$(-oo; 0)$]), [$(2; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = (-oo; 0] union [4; +oo)$.]
    #step[Đạo hàm $y' = (2x - 4)/(2sqrt(x^2 - 4x)) = (x - 2)/sqrt(x^2 - 4x)$.]
    #step[Xét $y' < 0 <=> x - 2 < 0 <=> x < 2$. Kết hợp điều kiện ta được $x < 0$.]
    #step[Vậy hàm số nghịch biến trên khoảng $(-oo; 0)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x (x - 1)^2$. Mệnh đề nào sau đây đúng?],
  (
    [Hàm số đồng biến trên khoảng $(-oo; 0)$.],
    True([Hàm số đồng biến trên khoảng $(0; +oo)$]),
    [Hàm số nghịch biến trên khoảng $(0; 1)$.],
    [Hàm số nghịch biến trên khoảng $(1; +oo)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta có nghiệm của đạo hàm là $x = 0$, $x = 1$ (nghiệm kép).]
    #step[Vì qua điểm $x = 1$ đạo hàm không đổi dấu nên đạo hàm luôn cùng dấu dương với mọi $x > 0$.]
    #step[Vậy hàm số đồng biến trên khoảng $(0; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = sqrt(x^2 - 6x + 8)$. Hàm số đồng biến trên khoảng nào dưới đây?],
  ([$(-oo; 2)$], [$(2; 4)$], True([$(4; +oo)$]), [$(3; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $x^2 - 6x + 8 >= 0 <=> x <= 2$ hoặc $x >= 4$. Tập xác định $D = (-oo; 2] union [4; +oo)$.]
    #step[Ta có đạo hàm $y' = (2x - 6)/(2sqrt(x^2 - 6x + 8)) = (x - 3)/sqrt(x^2 - 6x + 8)$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> x - 3 > 0 <=> x > 3$.]
    #step[Kết hợp với tập xác định, ta được khoảng đồng biến của hàm số là $(4; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x^2 - 2 ln x$ đồng biến trên khoảng nào dưới đây?],
  ([$(0; 1)$], True([$(1; +oo)$]), [$(-oo; -1)$], [$(-1; 1)$]),
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $x > 0$. Tập xác định $D = (0; +oo)$.]
    #step[Ta có đạo hàm $y' = 2x - 2/x = (2x^2 - 2)/x$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> 2x^2 - 2 > 0$ (do $x > 0$) $<=> x^2 > 1 <=> x > 1$.]
    #step[Vậy khoảng đồng biến của hàm số là $(1; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có bảng xét dấu đạo hàm $f'(x)$ như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-1$, $1$, $3$, $+oo$),
        f-signs: ($+$, $0$, $-$, $0$, $+$, $0$, $-$),
      )
    ]
    Hàm số $g(x) = f(3 - x)$ đồng biến trên khoảng nào dưới đây?],
  ([$(0; 2)$], True([$(2; 4)$]), [$(4; +oo)$], [$(1; 3)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $g'(x) = -f'(3 - x)$.]
    #step[Hàm số $g(x)$ đồng biến khi $g'(x) > 0 <=> f'(3 - x) < 0$.]
    #step[Dựa vào bảng xét dấu đạo hàm, ta thấy $f'(t) < 0 <=> t in (-1; 1)$ hoặc $t in (3; +oo)$.]
    #step[Từ đó:
      - Hoặc $-1 < 3 - x < 1 <=> 2 < x < 4$.
      - Hoặc $3 - x > 3 <=> x < 0$.
    ]
    #step[Vậy hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; 4)$. Đối chiếu phương án chọn $(2; 4)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có đồ thị là đường cong như hình bên dưới. Hàm số nghịch biến trên khoảng nào?
    #align(center)[
      #canvas(length: 1.5cm, {
        import draw: *
        for x in range(-3, 4) {
          line((x, -1.5), (x, 1.5), stroke: 0.25pt + gray.lighten(70%))
        }
        for y in range(-1, 2) {
          line((-3, y), (3, y), stroke: 0.25pt + gray.lighten(70%))
        }

        line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -1.5), (0, 1.5), mark: (end: ">"), stroke: 0.6pt)
        content((2.3, -0.2), $x$)
        content((-0.2, 1.3), $y$)
        content((-0.15, -0.15), $O$)

        content((1, -0.2), $1$)
        content((-1, 0.2), $-1$)
        content((0.2, 0.5), $0.5$)
        content((-0.3, -0.5), $-0.5$)

        line((1, 0), (1, -0.5), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((0, -0.5), (1, -0.5), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((-1, 0), (-1, 0.5), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((0, 0.5), (-1, 0.5), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))

        let points = ()
        for i in range(0, 41) {
          let t = -1.9 + i * 3.8 / 40.0
          let val = t * t * t - 3 * t
          if val >= -2.0 and val <= 2.0 {
            points.push((t, val / 2))
          }
        }
        line(..points, stroke: 1.2pt + rgb("#0f4c81"))
      })
    ]],
  ([$(-oo; -1)$], [$(1; +oo)$], True([$(-1; 1)$]), [$(0; 1)$]),
  accent: c-book,
  loigiai: [
    #step[Dựa vào đồ thị ta thấy trên khoảng $(-1; 1)$, nét đồ thị hàm số đi xuống từ cực đại đến cực tiểu.]
    #step[Do đó, hàm số nghịch biến trên khoảng $(-1; 1)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x^2 - 4) (x - 3)^2$. Số khoảng đồng biến của hàm số là bao nhiêu?],
  ([$1$], True([$2$]), [$3$], [$4$]),
  accent: c-book,
  // cols:4,
  loigiai: [
    #step[Xét $f'(x) = 0 <=> x = +-2$ hoặc $x = 3$ (bội chẵn).]
    #step[Ta có bảng xét dấu: $f'(x) > 0 <=> x in (-oo; -2) union (2; +oo)$.]
    #step[Nghiệm $x = 3$ có bậc chẵn nên đạo hàm không đổi dấu khi đi qua điểm này.]
    #step[Do đó, hàm số đồng biến trên $2$ khoảng là $(-oo; -2)$ và $(2; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số nào dưới đây nghịch biến trên từng khoảng xác định của nó?],
  ([$y = -x^3 + 3x$], [$y = -x^4 + 2x^2$], True([$y = (2x - 1)/(x - 1)$]), [$y = (2x + 1)/(x + 1)$]),
  accent: c-book,
  cols:1,
  loigiai: [
    #step[Xét hàm số $y = (2x - 1)/(x - 1)$. Đạo hàm $y' = -1/(x - 1)^2 < 0, forall x != 1$.]
    #step[Vì đạo hàm luôn âm trên từng khoảng xác định nên hàm số nghịch biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = 2x^3 - 3x^2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên khoảng $(1; +oo)$.]),
    True([Hàm số nghịch biến trên khoảng $(0; 1)$.]),
    True([Đồ thị hàm số đi qua gốc tọa độ $O(0; 0)$.]),
    [Hàm số nghịch biến trên khoảng $(-oo; 0)$.],
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = 6x^2 - 6x = 6x(x - 1) = 0 <=> x = 0$ hoặc $x = 1$.
    - Hàm số đồng biến trên $(-oo; 0)$ và $(1; +oo)$, nghịch biến trên $(0; 1)$. Do đó a), b) Đúng, d) Sai.
    - Với $x = 0$ ta được $y = 0$, đồ thị đi qua gốc tọa độ, c) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = (x - 2)/(x + 2)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định $D = RR backslash {-2}$.]),
    True([Đạo hàm $y' = 4/(x + 2)^2$.]),
    [Hàm số nghịch biến trên mỗi khoảng xác định.],
    True([Hàm số đồng biến trên $(-oo; -2)$ và $(-2; +oo)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Tập xác định $D = RR backslash {-2}$, a) Đúng.
    - Đạo hàm $y' = 4/(x + 2)^2 > 0, forall x != -2$. Do đó b) Đúng, c) Sai.
    - Hàm số luôn đồng biến trên từng khoảng xác định, d) Đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = -x^4 + 4x^2 - 3$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên $(-oo; -sqrt(2))$ và $(0; sqrt(2))$.]),
    True([Hàm số nghịch biến trên $(-sqrt(2); 0)$ và $(sqrt(2); +oo)$.]),
    True([Đồ thị hàm số cắt trục tung tại điểm $(0; -3)$.]),
    [Hàm số đồng biến trên toàn bộ $RR$.],
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = -4x^3 + 8x = -4x(x^2 - 2) = 0 <=> x = 0, x = +-sqrt(2)$.
    - Lập bảng biến thiên: Đồng biến trên $(-oo; -sqrt(2))$ và $(0; sqrt(2))$, nghịch biến trên $(-sqrt(2); 0)$ và $(sqrt(2); +oo)$. Do đó a), b) Đúng.
    - Tại $x = 0$ thì $y = -3$, cắt trục tung tại $(0; -3)$, c) Đúng.
    - Hàm số không thể đồng biến trên toàn bộ trục số $RR$, d) Sai.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = (x^2 + x + 1)/(x + 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đạo hàm $y' = (x^2 + 2x)/(x + 1)^2$.]),
    True([Hàm số đồng biến trên $(-oo; -2)$ và $(0; +oo)$.]),
    True([Hàm số nghịch biến trên khoảng $(-2; 0)$ loại trừ $-1$.]),
    [Hàm số nghịch biến trên $(-oo; -1)$ và $(-1; 0)$.],
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = ((2x+1)(x+1) - (x^2+x+1))/(x+1)^2 = (x^2 + 2x)/(x+1)^2$, a) Đúng.
    - Nghiệm của đạo hàm $x = 0, x = -2$.
    - Lập bảng biến thiên: Đồng biến trên $(-oo; -2)$ và $(0; +oo)$, nghịch biến trên $(-2; -1)$ và $(-1; 0)$.
    - Do đó b), c) Đúng, d) Sai (nghịch biến trên $(-2; -1)$ chứ không phải $(-oo; -1)$).
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = x^3 - 3x^2$. Số nguyên dương nhỏ nhất thuộc khoảng đồng biến của hàm số là bao nhiêu?],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 3x^2 - 6x$.]
    #step[Xét $y' > 0 <=> 3x^2 - 6x > 0 <=> x < 0$ hoặc $x > 2$.]
    #step[Các khoảng đồng biến là $(-oo; 0)$ và $(2; +oo)$.]
    #step[Số nguyên dương nhỏ nhất thuộc khoảng đồng biến là $x = 3$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = -x^3 + 3x^2 + 24x - 5$. Số khoảng nghịch biến của hàm số là bao nhiêu?],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = -3x^2 + 6x + 24$.]
    #step[Xét $y' < 0 <=> -3x^2 + 6x + 24 < 0 <=> x < -2$ hoặc $x > 4$.]
    #step[Hàm số nghịch biến trên $2$ khoảng là $(-oo; -2)$ và $(4; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x) = sqrt(x^2 - 4x + 5)$. Hỏi có bao nhiêu giá trị nguyên của $x$ thuộc đoạn $[-5; 5]$ để hàm số nghịch biến?],
  [$7$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR$ vì $x^2 - 4x + 5 = (x - 2)^2 + 1 > 0, forall x in RR$.]
    #step[Ta có đạo hàm: $f'(x) = (x - 2)/sqrt(x^2 - 4x + 5)$.]
    #step[Hàm số nghịch biến khi $f'(x) < 0 <=> x - 2 < 0 <=> x < 2$.]
    #step[Trên đoạn $[-5; 5]$, các giá trị nguyên của $x$ thỏa mãn $x < 2$ là $x in {-5, -4, -3, -2, -1, 0, 1}$.]
    #step[Số lượng giá trị nguyên thỏa mãn là $7$ giá trị.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm độ dài của khoảng nghịch biến của hàm số $y = x^3 - 3x^2 - 9x + 4$.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 3x^2 - 6x - 9$.]
    #step[Hàm số nghịch biến khi $y' < 0 <=> -1 < x < 3$.]
    #step[Độ dài khoảng nghịch biến $(-1; 3)$ là $3 - (-1) = 4$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x^2 (x^2 - 4)$. Hàm số đồng biến trên bao nhiêu khoảng có dạng $(a; b)$ hoặc $(a; +oo)$?],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Ta có nghiệm của đạo hàm là $x = 0$ (bội 2) và $x = +-2$.]
    #step[Xét dấu đạo hàm: $f'(x) > 0 <=> x in (-oo; -2) union (2; +oo)$.]
    #step[Khoảng đồng biến có dạng yêu cầu là $(2; +oo)$. Vậy có $1$ khoảng.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x) = x^2 - ln x$. Tìm số nghiệm nguyên của bất phương trình $f'(x) >= 0$ trên đoạn $[-5; 5]$.],
  [$5$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $x > 0$. Tập xác định $D = (0; +oo)$.]
    #step[Ta có đạo hàm: $f'(x) = 2x - 1/x = (2x^2 - 1)/x$.]
    #step[Bất phương trình $f'(x) >= 0 <=> (2x^2 - 1)/x >= 0 <=> 2x^2 - 1 >= 0$ (do $x > 0$).]
    #step[Giải bất phương trình với $x > 0$, ta được: $x >= 1/sqrt(2) approx 0,7$.]
    #step[Trên đoạn $[-5; 5]$, các giá trị nguyên thỏa mãn điều kiện $x >= 1/sqrt(2)$ là $x in {1, 2, 3, 4, 5}$.]
    #step[Số lượng nghiệm nguyên thỏa mãn là $5$ nghiệm.]
  ],
))
