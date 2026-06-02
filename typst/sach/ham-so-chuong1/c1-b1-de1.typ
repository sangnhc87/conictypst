#import "_config.typ": *

#muc([Đề Luyện Tập Số 01])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = -x^3 + 3x^2 - 1$ đồng biến trên khoảng nào?],
  ([$(-oo; 0)$], [$(2; +oo)$], True([$(0; 2)$]), [$(0; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = -3x^2 + 6x$.]
    #step[Xét bất phương trình $y' > 0 <=> -3x^2 + 6x > 0 <=> 0 < x < 2$.]
    #step[Vậy hàm số đồng biến trên khoảng $(0; 2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ có bảng xét dấu đạo hàm $f'(x)$ như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'(x)$,
        x-vals: ($-oo$, $-1$, $1$, $3$, $+oo$),
        f-signs: ($+$, $0$, $-$, $0$, $+$, $0$, $-$),
      )
    ]
    Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  ([$(-1; 3)$], True([$(3; +oo)$]), [$(-oo; 1)$], [$(1; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Dựa vào bảng xét dấu đạo hàm, ta thấy $f'(x) < 0$ trên các khoảng $(-1; 1)$ và $(3; +oo)$.]
    #step[Do đó, hàm số nghịch biến trên các khoảng $(-1; 1)$ và $(3; +oo)$.]
    #step[Đối chiếu với các phương án lựa chọn, ta thấy khoảng $(3; +oo)$ thỏa mãn.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x^4 - 2x^2 + 5$ nghịch biến trên khoảng nào dưới đây?],
  ([$(-1; 0)$], True([$(0; 1)$]), [$(1; +oo)$], [$(0; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 4x^3 - 4x = 4x(x^2 - 1)$.]
    #step[Xét $y' < 0 <=> 4x(x^2 - 1) < 0$. Nghiệm của đạo hàm là $x = 0, x = +-1$.]
    #step[Lập bảng xét dấu ta được $y' < 0$ khi $x in (-oo; -1)$ hoặc $x in (0; 1)$.]
    #step[Vậy hàm số nghịch biến trên khoảng $(0; 1)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = (x + 2)/(x - 1)$ nghịch biến trên khoảng nào dưới đây?],
  ([$RR$], [$(-oo; 1) union (1; +oo)$], True([$(1; +oo)$]), [$RR backslash {1}$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {1}$.]
    #step[Ta có đạo hàm $y' = (-1 dot.c 1 - 2 dot.c 1)/(x - 1)^2 = -3/(x - 1)^2 < 0, forall x != 1$.]
    #step[Hàm số nghịch biến trên từng khoảng xác định $(-oo; 1)$ và $(1; +oo)$.]
    #step[Do đó, hàm số nghịch biến trên khoảng $(1; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = -x^3 + 3x^2 + 9x + 4$. Hàm số đồng biến trên khoảng nào?],
  ([$(-oo; -1)$], [$(3; +oo)$], True([$(-1; 3)$]), [$(-oo; -1) union (3; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = -3x^2 + 6x + 9$.]
    #step[Cho $y' = 0 <=> -3x^2 + 6x + 9 = 0 <=> x = -1$ hoặc $x = 3$.]
    #step[Vì hệ số $a = -3 < 0$, nên $y' > 0 <=> -1 < x < 3$.]
    #step[Hàm số đồng biến trên khoảng $(-1; 3)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = sqrt(x^2 - 2x)$ đồng biến trên khoảng nào?],
  ([$(-oo; 0)$], True([$(2; +oo)$]), [$(-oo; 0) union (2; +oo)$], [$(1; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $x^2 - 2x >= 0 <=> x in (-oo; 0] union [2; +oo)$.]
    #step[Đạo hàm $y' = (2x - 2)/(2sqrt(x^2 - 2x)) = (x - 1)/sqrt(x^2 - 2x)$.]
    #step[Xét $y' > 0 <=> x - 1 > 0 <=> x > 1$. Kết hợp điều kiện ta được $x > 2$.]
    #step[Vậy hàm số đồng biến trên khoảng $(2; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm khoảng đồng biến của hàm số $y = sqrt(3x - x^2)$.],
  ([$(0; 3)$], [$(3/2; 3)$], True([$(0; 3/2)$]), [$[0; 3]$]),
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định: $3x - x^2 >= 0 <=> 0 <= x <= 3$. Tập xác định $D = [0; 3]$.]
    #step[Ta có đạo hàm $y' = (3 - 2x)/(2sqrt(3x - x^2))$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> 3 - 2x > 0 <=> x < 3/2$.]
    #step[Kết hợp với tập xác định, ta được khoảng đồng biến là $(0; 3/2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số bậc ba $y = f(x)$ có đồ thị là đường cong trong hình bên dưới. Hàm số đã cho đồng biến trên khoảng nào dưới đây?
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        for x in range(-3, 4) {
          line((x, -2.5), (x, 3), stroke: 0.25pt + gray.lighten(70%))
        }
        for y in range(-2, 4) {
          line((-3, y), (3, y), stroke: 0.25pt + gray.lighten(70%))
        }

        line((-3, 0), (3, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -2.5), (0, 3), mark: (end: ">"), stroke: 0.6pt)
        content((2.8, -0.3), $x$)
        content((-0.3, 2.8), $y$)
        content((-0.2, -0.2), $O$)

        content((1, -0.3), $1$)
        content((-1, 0.3), $-1$)
        content((0.3, 2), $2$)
        content((-0.4, -2), $-2$)

        line((1, 0), (1, -2), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((0, -2), (1, -2), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((-1, 0), (-1, 2), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
        line((0, 2), (-1, 2), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))

        let points = ()
        for i in range(0, 41) {
          let t = -2.1 + i * 4.2 / 40.0
          let val = t * t * t - 3 * t
          if val >= -2.4 and val <= 2.8 {
            points.push((t, val))
          }
        }
        line(..points, stroke: 1.2pt + rgb("#0f4c81"))
      })
    ]],
  ([$(-oo; -1)$], [$(1; +oo)$], True([$(-1; 1)$]), [$(0; 2)$]),
  accent: c-book,
  loigiai: [
    #step[Dựa vào đồ thị ta thấy trên khoảng $(-1; 1)$, nét đồ thị của hàm số đi lên từ trái sang phải.]
    #step[Do đó, hàm số đồng biến trên khoảng $(-1; 1)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = e^x - x$ đồng biến trên khoảng nào dưới đây?],
  ([$(-oo; 0)$], True([$(0; +oo)$]), [$(-oo; +oo)$], [$(1; +oo)$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm của hàm số là: $y' = e^x - 1$.]
    #step[Hàm số đồng biến khi $y' > 0 <=> e^x - 1 > 0 <=> e^x > 1 <=> x > 0$.]
    #step[Vậy hàm số đồng biến trên khoảng $(0; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Khoảng nghịch biến của hàm số $y = ln(x^2 + 1) - x$ là:],
  ([$(0; +oo)$], [$(1; +oo)$], True([$(-oo; +oo)$]), [$(-oo; 0)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định của hàm số là $D = RR$ vì $x^2 + 1 > 0, forall x in RR$.]
    #step[Đạo hàm: $y' = (2x)/(x^2 + 1) - 1 = (2x - x^2 - 1)/(x^2 + 1) = -(x - 1)^2 / (x^2 + 1)$.]
    #step[Ta thấy $y' <= 0, forall x in RR$ và $y' = 0 <=> x = 1$ (điểm đơn lẻ).]
    #step[Do đó, hàm số nghịch biến trên toàn bộ trục số $RR$, tức khoảng $(-oo; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số nào dưới đây đồng biến trên khoảng $(0; +oo)$?],
  ([$y = -x^4 + 2x^2$], [$y = (x + 1)/(x - 2)$], True([$y = x^3 + x$]), [$y = x^4 - 2x^2 + 3$]),
  accent: c-book,
  loigiai: [
    #step[Xét hàm số $y = x^3 + x$. Đạo hàm $y' = 3x^2 + 1 > 0, forall x in RR$.]
    #step[Vì đạo hàm luôn dương trên toàn bộ trục số nên hàm số đồng biến trên $RR$, do đó đồng biến trên $(0; +oo)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x - 1)^2 (x - 2)^3$. Số khoảng đồng biến của hàm số là bao nhiêu?],
  ([$1$], True([$2$]), [$3$], [$4$]),
  accent: c-book,
  loigiai: [
    #step[Xét phương trình $f'(x) = 0 <=> x = 0$, $x = 1$, hoặc $x = 2$.]
    #step[Xét dấu đạo hàm qua các nghiệm: Nghiệm $x = 1$ có bội chẵn (bậc 2) nên đạo hàm không đổi dấu khi đi qua điểm này.]
    #step[Ta có bảng xét dấu: $f'(x) > 0 <=> x in (-oo; 0) union (2; +oo)$.]
    #step[Vậy hàm số đồng biến trên $2$ khoảng là $(-oo; 0)$ và $(2; +oo)$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = x^3 - 3x + 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên khoảng $(1; +oo)$.]),
    True([Hàm số nghịch biến trên khoảng $(-1; 1)$.]),
    True([Đồ thị hàm số đi qua điểm $A(0; 2)$.]),
    [Hàm số đồng biến trên $RR$.],
  ),
  accent: c-book,
  loigiai: [
    - Mệnh đề a) Đúng vì $y' = 3x^2 - 3 > 0 <=> x < -1$ hoặc $x > 1$.
    - Mệnh đề b) Đúng vì $y' < 0 <=> -1 < x < 1$.
    - Mệnh đề c) Đúng vì thay $x = 0$ vào hàm số ta được $y = 2$.
    - Mệnh đề d) Sai vì hàm số có khoảng nghịch biến $(-1; 1)$.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = (x - 1)/(x + 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = RR backslash {-1}$.]),
    True([Đạo hàm $y' = 2/(x + 1)^2$.]),
    [Hàm số đồng biến trên $RR backslash {-1}$.],
    True([Hàm số đồng biến trên từng khoảng xác định.]),
  ),
  accent: c-book,
  loigiai: [
    - Mệnh đề a) Đúng.
    - Mệnh đề b) Đúng vì $y' = (1 dot.c 1 - (-1) dot.c 1)/(x + 1)^2 = 2/(x + 1)^2$.
    - Mệnh đề c) Sai vì không được dùng ký hiệu liên hợp $union$ hay $backslash$ khi kết luận khoảng đồng biến.
    - Mệnh đề d) Đúng vì hàm số đồng biến trên $(-oo; -1)$ và $(-1; +oo)$.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = x^4 - 2x^2 + 3$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên $(-1; 0)$ và $(1; +oo)$.]),
    True([Hàm số có 3 điểm cực trị.]),
    True([Hàm số nghịch biến trên khoảng $(0; 1)$.]),
    True([Hàm số nghịch biến trên $(-oo; -1)$ và $(0; 1)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <=> x = 0, x = +- 1$.
    - Bảng biến thiên cho thấy hàm số đồng biến trên $(-1; 0)$ và $(1; +oo)$, nghịch biến trên $(-oo; -1)$ và $(0; 1)$.
    - Vậy các mệnh đề a), b), c), d) đều đúng.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x - 2)^2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên khoảng $(0; +oo)$.]),
    True([Hàm số nghịch biến trên khoảng $(-oo; 0)$.]),
    [Điểm $x = 2$ là điểm cực đại của hàm số.],
    True([Hàm số đồng biến trên khoảng $(2; +oo)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Ta có nghiệm của $f'(x) = 0$ là $x = 0$ và $x = 2$ (bội 2).
    - Xét dấu đạo hàm: $f'(x) < 0$ khi $x < 0$ (nghịch biến); $f'(x) > 0$ khi $x > 0$ và $x != 2$ (đồng biến).
    - Do đó hàm số đồng biến trên $(0; +oo)$, nên a) Đúng, b) Đúng.
    - Điểm $x = 2$ không phải cực trị của hàm số vì đạo hàm không đổi dấu, do đó c) Sai.
    - Hàm số đồng biến trên $(0; +oo)$ nên cũng đồng biến trên khoảng con $(2; +oo)$, d) Đúng.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = x^3 - 3x^2 - 9x + 5$. Số nguyên dương nhỏ nhất thuộc khoảng nghịch biến của hàm số là bao nhiêu?],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 3x^2 - 6x - 9$.]
    #step[Xét $y' < 0 <=> 3x^2 - 6x - 9 < 0 <=> -1 < x < 3$.]
    #step[Khoảng nghịch biến của hàm số là $(-1; 3)$.]
    #step[Số nguyên dương nhỏ nhất nằm trong khoảng này là $x = 1$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = -x^3 + 3x^2 + 24x - 5$. Số khoảng nghịch biến của hàm số là bao nhiêu?],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = -3x^2 + 6x + 24$.]
    #step[Xét $y' < 0 <=> -3x^2 + 6x + 24 < 0 <=> x < -2$ hoặc $x > 4$.]
    #step[Các khoảng nghịch biến là $(-oo; -2)$ và $(4; +oo)$.]
    #step[Số khoảng nghịch biến của hàm số là $2$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = x - sin x$. Trên tập số thực $RR$, số khoảng nghịch biến của hàm số là bao nhiêu?],
  [$0$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = 1 - cos x$.]
    #step[Vì $-1 <= cos x <= 1, forall x in RR$, ta luôn có $y' = 1 - cos x >= 0, forall x in RR$.]
    #step[Đạo hàm $y' = 0 <=> cos x = 1 <=> x = k 2 pi, k in ZZ$ (các điểm rời rạc).]
    #step[Theo định lý về tính đơn điệu, hàm số luôn đồng biến trên $RR$. Do đó số khoảng nghịch biến là $0$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm độ dài của khoảng nghịch biến của hàm số $y = x^3 - 3x^2 - 9x + 4$.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm $y' = 3x^2 - 6x - 9$.]
    #step[Xét $y' < 0 <=> 3x^2 - 6x - 9 < 0 <=> -1 < x < 3$.]
    #step[Khoảng nghịch biến là $(-1; 3)$. Độ dài khoảng nghịch biến là $3 - (-1) = 4$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x^2 (x^2 - 4)$. Hàm số đồng biến trên bao nhiêu khoảng có dạng $(a; b)$ hoặc $(a; +oo)$?],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm $f'(x) = 0 <=> x = 0$ hoặc $x = +-2$.]
    #step[Lập bảng xét dấu ta thấy $f'(x) > 0 <=> x in (-oo; -2) union (2; +oo)$.]
    #step[Khoảng đồng biến có dạng yêu cầu là $(2; +oo)$. Vậy có $1$ khoảng thỏa mãn.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm số nghiệm nguyên của bất phương trình $f'(x) <= 0$ với hàm số $y = f(x) = sqrt(x^2 - 6x + 10)$ trên đoạn $[-5; 5]$.],
  [$9$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định của hàm số là $D = RR$ vì $x^2 - 6x + 10 = (x - 3)^2 + 1 > 0, forall x in RR$.]
    #step[Ta có đạo hàm $f'(x) = (2x - 6)/(2sqrt(x^2 - 6x + 10)) = (x - 3)/sqrt(x^2 - 6x + 10)$.]
    #step[Xét bất phương trình $f'(x) <= 0 <=> (x - 3)/sqrt(x^2 - 6x + 10) <= 0 <=> x - 3 <= 0 <=> x <= 3$.]
    #step[Trên đoạn $[-5; 5]$, các giá trị nguyên thỏa mãn là $x in {-5, -4, -3, -2, -1, 0, 1, 2, 3}$.]
    #step[Số lượng nghiệm nguyên thỏa mãn là: $3 - (-5) + 1 = 9$ nghiệm.]
  ],
))
