#import "_config.typ": *
#show: doc-setup

#muc([Đề Luyện Tập Số 02])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (14 câu)], count: 14)

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x^3 - 3x$ nghịch biến trên khoảng nào?],
  ([$( -oo; -1 )$], [$( 1; +oo )$], True([$(-1; 1)$]), [$( -oo; 1 )$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 3x^2 - 3$.]
    #step[Xét $y' < 0 <=> 3x^2 - 3 < 0 <=> -1 < x < 1$.]
    - Do đó b), c) Đúng, d) Sai (nghịch biến trên $(-2; -1)$ chứ không phải $(-oo; -1)$).
  ],
))

#q-wrap(dir: "doc",lines: 2,  ds(
  [Cho hàm số $y = x^3 - 3x^2 + 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên khoảng $(-oo; 0)$ và $(2; +oo)$.]),
    True([Hàm số nghịch biến trên khoảng $(0; 2)$.]),
    [Hàm số đồng biến trên $RR$.],
    True([Đạo hàm của hàm số triệt tiêu tại hai điểm phân biệt.]),
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$. Do đó d) Đúng.
    - Lập bảng xét dấu: $y' > 0$ trên $(-oo; 0)$ và $(2; +oo)$, nên a) Đúng.
    - $y' < 0$ trên $(0; 2)$, nên b) Đúng.
    - Hàm số có khoảng nghịch biến nên không đồng biến trên $RR$, c) Sai.
  ],
))

#resetcau()
#q-wrap(dir: "doc",lines: 2,  tn(
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        var: $x$,
        der: $f$,
        func: $f$,
        x-vals: ($-oo$, $0$, $2$, $+oo$),
        d-signs: ($+$, $0$, $-$, $0$, $+$),
        v-vals: ($-oo$, $3$, $-1$, $+oo$),
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng dưới đây?],
  ([$( -oo; 0 )$], True([$(0; 2)$]), [$(2; +oo)$], [$(0; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Dựa vào bảng biến thiên, ta thấy trên khoảng $(0; 2)$, đạo hàm $f'(x) < 0$.]
    #step[Hàm số $y = f(x)$ nghịch biến trên khoảng $(0; 2)$ (đồ thị hàm số đi xuống từ cực đại $3$ đến cực tiểu $-1$).]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = -x^4 + 4x^2 + 1$ đồng biến trên khoảng nào dưới đây?],
  ([$(-oo; -2)$], [$( -sqrt(2); 0 )$], True([$(0; sqrt(2))$]), [$(sqrt(2); +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = -4x^3 + 8x = -4x(x^2 - 2)$.]
    #step[Nghiệm của đạo hàm gồm $x = 0$, $x = +-sqrt(2)$.]
    #step[Xét dấu đạo hàm: $y' > 0 <=> x in (-oo; -sqrt(2)) union (0; sqrt(2))$.]
    #step[Khoảng đồng biến thỏa mãn là $(0; sqrt(2))$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = (3x - 1)/(x + 2)$ đồng biến trên khoảng nào dưới đây?],
  ([$RR$], [$(-oo; -2) union (-2; +oo)$], True([$(-oo; -2)$]), [$RR backslash {-2}$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {-2}$.]
    #step[Đạo hàm $y' = (3 dot.c 2 - (-1) dot.c 1)/(x + 2)^2 = 7/(x + 2)^2 > 0, forall x != -2$.]
    #step[Hàm số đồng biến trên các khoảng $(-oo; -2)$ và $(-2; +oo)$.]
    #step[Đối chiếu với các phương án, ta chọn khoảng $(-oo; -2)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = sqrt(4 - x^2)$ nghịch biến trên khoảng nào?],
  ([$(-2; 2)$], [$(-2; 0)$], True([$(0; 2)$]), [$(0; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = [-2; 2]$.]
    #step[Đạo hàm $y' = -x/sqrt(4 - x^2)$.]
    #step[Xét $y' < 0 <=> -x > 0 <=> x < 0$. Kết hợp điều kiện xác định ta được $x in (0; 2)$.]
    #step[Vậy hàm số nghịch biến trên khoảng $(0; 2)$.]
  ],
))

#q-wrap(dir: "doc",lines: 2, tn(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x^2 (x + 1)$. Mệnh đề nào sau đây đúng?],
  (
    [Hàm số nghịch biến trên khoảng $(-oo; -1)$.],
    True([Hàm số đồng biến trên khoảng $(-1; +oo)$]),
    [Hàm số nghịch biến trên khoảng $(-1; 1)$.],
    [Hàm số đồng biến trên khoảng $(-oo; +oo)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Xét dấu đạo hàm $f'(x) = x^2 (x + 1)$. Ta thấy $f'(x) = 0 <=> x = 0$ hoặc $x = -1$.]
    #step[Nghiệm $x = 0$ là nghiệm kép (bội 2) nên đạo hàm không đổi dấu khi đi qua điểm này.]
    #step[Ta có bảng xét dấu: $f'(x) > 0 <=> x > -1$ (ngoại trừ điểm $x = 0$).]
    #step[Hàm số đồng biến trên khoảng $(-1; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x - sqrt(x^2 - 1)$ đồng biến trên khoảng nào dưới đây?],
  ([$(1; +oo)$], True([$(-oo; -1)$]), [$(-1; 1)$], [Không tồn tại khoảng đồng biến]),
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $x^2 - 1 >= 0 <=> x in (-oo; -1] union [1; +oo)$.]
    #step[Ta có đạo hàm $y' = 1 - x/sqrt(x^2 - 1)$ với mọi $x in (-oo; -1) union (1; +oo)$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> 1 - x/sqrt(x^2 - 1) > 0 <=> x/sqrt(x^2 - 1) < 1$.]
    #step[Với $x in (-oo; -1)$, ta có $x < 0$ nên $x/sqrt(x^2 - 1) < 0 < 1$ (luôn đúng).]
    #step[Với $x in (1; +oo)$, ta có $x > 0$ nên $x/sqrt(x^2 - 1) > 1$ (vô nghiệm). Vậy hàm số đồng biến trên $(-oo; -1)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm khoảng nghịch biến của hàm số $y = x e^(-x)$.],
  ([$(-oo; 1)$], [$(0; +oo)$], True([$(1; +oo)$]), [$(-oo; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = 1 dot.c e^(-x) + x dot.c (-e^(-x)) = (1 - x)e^(-x)$.]
    #step[Vì $e^(-x) > 0, forall x in RR$, nên đạo hàm $y' < 0 <=> 1 - x < 0 <=> x > 1$.]
    #step[Vậy hàm số nghịch biến trên khoảng $(1; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = sin x + cos x$ đồng biến trên khoảng nào trong các khoảng dưới đây?],
  ([$(pi/4; 5pi/4)$], [$(0; pi)$], True([$(0; pi/4)$]), [$(pi/2; pi)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm: $y' = cos x - sin x$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> cos x > sin x <=> sqrt(2) cos(x + pi/4) > 0$.]
    #step[Xét trên các khoảng phương án lựa chọn, trên khoảng $(0; pi/4)$ ta có $x in (0; pi/4) => x + pi/4 in (pi/4; pi/2)$, do đó $cos(x + pi/4) > 0$.]
    #step[Vậy hàm số đồng biến trên khoảng $(0; pi/4)$.]
  ],
))

#q-wrap(dir: "doc", lines: 1, tn(
  [Cho hàm số bậc bốn $y = f(x)$ có đồ thị là đường cong như hình vẽ. Hàm số đồng biến trên khoảng nào?
    #align(center)[
      #canvas(length: 1.5cm, {
        import draw: *
        for x in range(-3, 4) {
          line((x, -2), (x, 2), stroke: 0.25pt + gray.lighten(70%))
        }
        for y in range(-2, 3) {
          line((-3, y), (3, y), stroke: 0.25pt + gray.lighten(70%))
        }

        line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -2), (0, 2.5), mark: (end: ">"), stroke: 0.6pt)
        content((2.3, -0.3), $x$)
        content((-0.3, 2.3), $y$)
        content((-0.2, -0.2), $O$)

        content((1, -0.3), $1$)
        content((-1, 0.3), $-1$)
        content((-0.3, 1), $1$)

        line((1, 0), (1, 1), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((0, 1), (1, 1), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((-1, 0), (-1, 1), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((0, 1), (-1, 1), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))

        let points = ()
        for i in range(0, 41) {
          let t = -1.6 + i * 3.2 / 40.0
          let val = -t * t * t * t + 2 * t * t
          if val >= -2.0 and val <= 2.2 {
            points.push((t, val))
          }
        }
        line(..points, stroke: 1.2pt + rgb("#0f4c81"))
      })
    ]],
  ([$(-oo; -1)$], [$(0; 1)$], True([$(-1; 0)$]), [$(1; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Dựa vào đồ thị ta thấy đồ thị đi lên trên các khoảng $(-1; 0)$ và $(1; +oo)$.]
    #step[Do đó, hàm số đồng biến trên các khoảng $(-1; 0)$ và $(1; +oo)$.]
    #step[Chọn đáp án $(-1; 0)$ từ các phương án lựa chọn.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x^2 (x^2 - 1) (x - 2)$. Số khoảng nghịch biến của hàm số là bao nhiêu?],
  ([$1$], True([$2$]), [$3$], [$4$]),
  accent: c-book,
  loigiai: [
    #step[Xét $f'(x) = 0 <=> x = 0$ (nghiệm kép), $x = 1$, $x = -1$, $x = 2$ (nghiệm đơn).]
    #step[Ta có bảng xét dấu: $f'(x) < 0 <=> x in (-oo; -1) union (1; 2)$.]
    #step[Hàm số nghịch biến trên $2$ khoảng là $(-oo; -1)$ và $(1; 2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Hàm số nào dưới đây nghịch biến trên khoảng $(-oo; +oo)$?],
  ([$y = -x^3 + 3x$], [$y = -x^4 + 2x^2$], True([$y = -x^3 - x$]), [$y = (x + 1)/(x - 1)$]),
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $y = -x^3 - x$. Đạo hàm $y' = -3x^2 - 1 < 0, forall x in RR$.]
    #step[Vì đạo hàm luôn luôn âm với mọi $x$ nên hàm số nghịch biến trên khoảng $(-oo; +oo)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công ty sản xuất máy tính dự tính chi phí sản xuất $x$ chiếc máy tính mỗi ngày là $C(x) = 2000 + 10x - 0.1x^2$ (USD), với $0 < x < 100$. Khẳng định nào sau đây là đúng về chi phí sản xuất?],
  ([Chi phí sản xuất luôn tăng khi $x in (0; 100)$], [Chi phí sản xuất luôn giảm khi $x in (0; 100)$], True([Chi phí sản xuất tăng khi $x in (0; 50)$ và giảm khi $x in (50; 100)$]), [Chi phí sản xuất giảm khi $x in (0; 50)$ và tăng khi $x in (50; 100)$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm của hàm chi phí là $C'(x) = 10 - 0.2x$.]
    #step[Xét $C'(x) = 0 <=> 10 - 0.2x = 0 <=> x = 50$.]
    #step[Khi $x in (0; 50)$, $C'(x) > 0$ nên chi phí tăng.]
    #step[Khi $x in (50; 100)$, $C'(x) < 0$ nên chi phí giảm.]
    #step[Vậy chi phí tăng khi $x in (0; 50)$ và giảm khi $x in (50; 100)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = (x^2 - 2x + 2)/(x - 1)$ đồng biến trên các khoảng nào dưới đây?],
  ([$(-oo; 1)$ và $(1; +oo)$], [$(0; 2)$], True([$(-oo; 0)$ và $(2; +oo)$]), [$(0; 1)$ và $(1; 2)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {1}$.]
    #step[Đạo hàm $y' = ((2x - 2)(x - 1) - (x^2 - 2x + 2) dot.c 1)/(x - 1)^2 = (x^2 - 2x)/(x - 1)^2$.]
    #step[Xét $y' = 0 <=> x^2 - 2x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Bảng xét dấu $y'$: $y' > 0$ trên $(-oo; 0)$ và $(2; +oo)$.]
    #step[Vậy hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (5 câu)], count: 5)

#q-wrap(dir: "doc",lines:2, ds(
  [Cho hàm số $y = -x^3 + 3x^2 - 4$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên khoảng $(0; 2)$.]),
    True([Hàm số nghịch biến trên khoảng $(2; +oo)$.]),
    True([Đồ thị hàm số đi qua điểm $B(1; -2)$.]),
    [Hàm số đồng biến trên từng khoảng xác định.],
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = -3x^2 + 6x = 0 <=> x = 0$ hoặc $x = 2$.
    - Hàm số nghịch biến trên $(-oo; 0)$ và $(2; +oo)$, đồng biến trên $(0; 2)$. Do đó a) Đúng, b) Đúng.
    - Điểm $B(1; -2)$ thuộc đồ thị vì thay $x = 1$ ta được $y = -1 + 3 - 4 = -2$, c) Đúng.
    - Hàm số có khoảng nghịch biến và đồng biến rõ ràng, kết luận d) Sai.
  ],
))

#q-wrap(dir: "doc",lines: 2, ds(
  [Cho hàm số $y = (2x - 1)/(x + 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đạo hàm $y' = 3/(x + 1)^2$.]),
    True([Hàm số luôn đồng biến trên mỗi khoảng xác định.]),
    True([Đồ thị hàm số có tiệm cận đứng là $x = -1$.]),
    [Hàm số đồng biến trên $RR$.],
  ),
  accent: c-book,
  loigiai: [
    - Đạo hàm $y' = (2 dot.c 1 - (-1) dot.c 1)/(x + 1)^2 = 3/(x + 1)^2 > 0$ trên các khoảng xác định. Do đó a) Đúng, b) Đúng.
    - Điểm gián đoạn $x = -1$ là tiệm cận đứng, c) Đúng.
    - Hàm số gián đoạn tại $x = -1$ nên không đồng biến trên $RR$, d) Sai.
  ],
))

#q-wrap(dir: "doc",lines: 2, ds(
  [Cho hàm số $y = -x^4 + 2x^2 + 1$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số nghịch biến trên khoảng $(-1; 0)$.],
    True([Hàm số đồng biến trên khoảng $(0; 1)$.]),
    True([Hàm số nghịch biến trên khoảng $(1; +oo)$.]),
    True([Hàm số đồng biến trên $(-oo; -1)$ và $(0; 1)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = -4x^3 + 4x = -4x(x^2 - 1) = 0 <=> x = 0, x = +-1$.
    - Xét dấu đạo hàm: Đồng biến trên $(-oo; -1)$ và $(0; 1)$; Nghịch biến trên $(-1; 0)$ và $(1; +oo)$.
    - Mệnh đề a) Sai (đồng biến trên khoảng đó); Mệnh đề b), c), d) Đúng.
  ],
))

#q-wrap(dir: "doc",lines: 2, ds(
  [Cho hàm số $y = (x^2 - 3x + 3)/(x - 2)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định $D = RR backslash {2}$.]),
    [Hàm số đồng biến trên $(1; 3)$.],
    True([Hàm số nghịch biến trên khoảng $(1; 2)$ và $(2; 3)$.]),
    True([Hàm số đồng biến trên $(-oo; 1)$ và $(3; +oo)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Tập xác định: $D = RR backslash {2}$, a) Đúng.
    - Đạo hàm $y' = (x^2 - 4x + 3)/(x - 2)^2 = 0 <=> x = 1$ hoặc $x = 3$.
    - Lập bảng biến thiên: Đồng biến trên $(-oo; 1)$ và $(3; +oo)$; Nghịch biến trên $(1; 2)$ và $(2; 3)$.
    - Suy ra b) Sai; c), d) Đúng.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (8 câu)], count: 8)

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = -x^3 + 3x^2 + 9x - 1$. Độ dài khoảng đồng biến của hàm số là bao nhiêu?],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = -3x^2 + 6x + 9$.]
    #step[Xét $y' > 0 <=> -3x^2 + 6x + 9 > 0 <=> -1 < x < 3$.]
    #step[Khoảng đồng biến của hàm số là $(-1; 3)$. Độ dài khoảng đồng biến là $3 - (-1) = 4$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $f(x) = sqrt(10x - x^2)$. Có bao nhiêu giá trị nguyên của $x$ thuộc khoảng nghịch biến của hàm số?],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $10x - x^2 >= 0 <=> 0 <= x <= 10$. Tập xác định $D = [0; 10]$.]
    #step[Ta có đạo hàm $f'(x) = (10 - 2x)/(2sqrt(10x - x^2)) = (5 - x)/sqrt(10x - x^2)$.]
    #step[Khoảng nghịch biến là khoảng mà $f'(x) < 0 <=> 5 - x < 0 <=> x > 5$.]
    #step[Kết hợp với tập xác định, ta được các giá trị $x$ thuộc khoảng nghịch biến là $5 < x < 10$.]
    #step[Các giá trị nguyên của $x$ trong khoảng này là $x in {6, 7, 8, 9}$. Vậy có $4$ giá trị.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm số nghiệm nguyên của bất phương trình $f'(x) >= 0$ với hàm số $y = f(x) = x^2 e^(-x)$ trên đoạn $[-3; 3]$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm: $f'(x) = 2x e^(-x) - x^2 e^(-x) = (2x - x^2)e^(-x)$.]
    #step[Bất phương trình $f'(x) >= 0 <=> (2x - x^2)e^(-x) >= 0 <=> 2x - x^2 >= 0$ (vì $e^(-x) > 0, forall x$).]
    #step[Giải bất phương trình trên ta được: $0 <= x <= 2$.]
    #step[Trên đoạn $[-3; 3]$, các nghiệm nguyên của bất phương trình là $x in {0, 1, 2}$. Vậy có $3$ nghiệm nguyên.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = x^3 - 3x^2 - 9x + 2$. Có bao nhiêu giá trị nguyên của $x$ thuộc khoảng nghịch biến của hàm số?],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 3x^2 - 6x - 9$.]
    #step[Hàm số nghịch biến khi $y' < 0 <=> 3x^2 - 6x - 9 < 0 <=> -1 < x < 3$.]
    #step[Các giá trị nguyên của $x$ thuộc khoảng nghịch biến $(-1; 3)$ là $x in {0, 1, 2}$.]
    #step[Vậy có $3$ giá trị nguyên thỏa mãn.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm số khoảng đồng biến của hàm số $y = x^4 - 8x^2 + 3$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm $y' = 4x^3 - 16x = 4x(x^2 - 4)$.]
    #step[Cho $y' = 0 <=> x = 0$ hoặc $x = +-2$.]
    #step[Lập bảng xét dấu: Đạo hàm $y' > 0 <=> x in (-2; 0) union (2; +oo)$.]
    #step[Do đó, hàm số đồng biến trên $2$ khoảng là $(-2; 0)$ và $(2; +oo)$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một vật chuyển động theo quy luật $s(t) = -t^3 + 9t^2$ với $t$ (giây) là khoảng thời gian tính từ lúc vật bắt đầu chuyển động và $s$ (mét) là quãng đường vật đi được trong khoảng thời gian đó. Hỏi trong khoảng thời gian nào (tính bằng giây) thì vận tốc của vật tăng? (Nhập giá trị độ dài của khoảng thời gian đó).],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Vận tốc của vật là đạo hàm của quãng đường: $v(t) = s'(t) = -3t^2 + 18t$.]
    #step[Để tìm khoảng thời gian vận tốc tăng, ta xét đạo hàm của vận tốc (gia tốc): $a(t) = v'(t) = -6t + 18$.]
    #step[Vận tốc tăng khi $a(t) > 0 <=> -6t + 18 > 0 <=> t < 3$.]
    #step[Vì $t >= 0$ nên vận tốc tăng trong khoảng $(0; 3)$.]
    #step[Độ dài khoảng thời gian này là $3 - 0 = 3$ giây.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x - 1)(x + 2)^2 (x - 3)$. Số khoảng nghịch biến của hàm số là bao nhiêu?],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Xét $f'(x) = 0 <=> x = 1$, $x = -2$ (nghiệm kép), hoặc $x = 3$.]
    #step[Lập bảng xét dấu của $f'(x)$, ta chú ý đạo hàm không đổi dấu khi qua nghiệm kép $x = -2$.]
    #step[Ta có $f'(x) < 0 <=> 1 < x < 3$.]
    #step[Do đó, hàm số chỉ có $1$ khoảng nghịch biến là $(1; 3)$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một loại thuốc được tiêm vào mạch máu của bệnh nhân. Nồng độ của thuốc trong máu sau $t$ giờ tiêm được cho bởi công thức $C(t) = (2t)/(t^2 + 1)$ (mg/L). Nồng độ thuốc sẽ bắt đầu giảm sau bao nhiêu giờ kể từ lúc tiêm?],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Tốc độ thay đổi nồng độ thuốc là đạo hàm $C'(t)$.]
    #step[Ta có $C'(t) = (2(t^2 + 1) - 2t(2t))/(t^2 + 1)^2 = (2 - 2t^2)/(t^2 + 1)^2$.]
    #step[Xét $C'(t) = 0 <=> 2 - 2t^2 = 0 <=> t^2 = 1 <=> t = 1$ (vì $t >= 0$).]
    #step[Khi $0 <= t < 1$, $C'(t) > 0$ nên nồng độ thuốc tăng.]
    #step[Khi $t > 1$, $C'(t) < 0$ nên nồng độ thuốc giảm.]
    #step[Vậy nồng độ thuốc bắt đầu giảm sau $1$ giờ kể từ lúc tiêm.]
  ],
))
