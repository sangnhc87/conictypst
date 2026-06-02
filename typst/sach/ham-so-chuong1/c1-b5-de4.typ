#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#let fig-profit = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((-0.2, 0), (6.2, 0), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  line((0, -0.2), (0, 4.2), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  content((6.0, -0.25), $x$)
  content((0.25, 4.0), $L$)
  content((-0.2, -0.2), $O$)

  let f(x) = { -0.3 * (x - 3) * (x - 3) + 3 }
  let pts = ()
  for i in range(60) {
    let x = i * 6.0 / 60
    pts.push((x, f(x)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
  circle((3, 3), radius: 0.05, fill: rgb("#b91c1c"))
  line((3, 0), (3, 3), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
  line((0, 3), (3, 3), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
  content((3.15, 3.15), $M$)
})

#let fig-drug = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((-0.2, 0), (7.2, 0), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  line((0, -0.2), (0, 3.2), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  content((7.0, -0.25), $t$)
  content((0.25, 3.0), $C$)
  content((-0.2, -0.2), $O$)

  let f(t) = { 3 * t * calc.exp(-0.5 * t) }
  let pts = ()
  for i in range(70) {
    let t = i * 6.8 / 70
    pts.push((t, f(t)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
  circle((2, f(2)), radius: 0.05, fill: rgb("#b91c1c"))
  line((2, 0), (2, f(2)), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
  content((2.2, f(2) + 0.15), $P$)
})

#let fig-cost = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((0, 0), (6.5, 0), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  line((0, 0), (0, 5.2), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  content((6.3, -0.25), $x$)
  content((0.25, 5.0), $A$)
  content((-0.2, -0.2), $O$)

  line((0, 1.2), (6.2, 1.2), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
  content((5.7, 1.45), $y = 1$)

  let f(x) = { 1 + 2 / x }
  let pts = ()
  for i in range(60) {
    let x = 0.45 + i * 5.75 / 60
    pts.push((x, f(x)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
})

#let fig-salt = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  line((0, 0), (7.0, 0), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  line((0, 0), (0, 4.6), mark: (end: "stealth", scale: 0.35), stroke: 0.5pt)
  content((6.8, -0.25), $t$)
  content((0.25, 4.4), $S$)
  content((-0.2, -0.2), $O$)

  line((0, 4), (6.8, 4), stroke: (paint: rgb("#b91c1c"), thickness: 0.5pt, dash: "dashed"))
  content((5.8, 4.2), $y = 50$)

  let f(t) = { 5 * t / (1 + t) }
  let pts = ()
  for i in range(70) {
    let t = i * 6.6 / 70
    pts.push((t, f(t)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
})

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 04 - ĐỌC ĐỒ THỊ TRONG BỐI CẢNH THỰC TẾ]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (6 câu)], count: 6)

#q-wrap(dir: "doc", tn(
  [Đồ thị dưới đây biểu diễn lợi nhuận $L$ của một doanh nghiệp theo số lần điều chỉnh giá $x$.
    #align(center)[#fig-profit]
    Dựa vào đồ thị, lợi nhuận lớn nhất đạt được khi:],
  (
    [$x = 1$],
    [$x = 2$],
    True([$x = 3$]),
    [$x = 6$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đỉnh của parabol là điểm $M$, có hoành độ bằng $3$.]
    #step[Đỉnh của đồ thị lợi nhuận chính là thời điểm lợi nhuận lớn nhất.]
    #step[Vậy lợi nhuận lớn nhất đạt được khi $x = 3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Vẫn với đồ thị lợi nhuận ở trên, doanh nghiệp đang ở giai đoạn lợi nhuận giảm khi:],
  (
    [$0 < x < 3$],
    True([$x > 3$]),
    [$x = 3$],
    [$x < 0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Trên đồ thị, sau đỉnh $M$ đồ thị đi xuống.]
    #step[Điều đó có nghĩa là khi $x > 3$, lợi nhuận giảm dần theo số lần điều chỉnh giá.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị dưới đây biểu diễn nồng độ thuốc $C$ trong máu theo thời gian $t$ (giờ).
    #align(center)[#fig-drug]
    Thời điểm nồng độ thuốc đạt cao nhất là:],
  (
    [$t = 1$],
    True([$t = 2$]),
    [$t = 3$],
    [$t = 4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Điểm cao nhất của đồ thị là điểm $P$.]
    #step[Hoành độ của điểm này bằng $2$, nên nồng độ thuốc đạt cao nhất tại $t = 2$ giờ.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị dưới đây biểu diễn chi phí trung bình $A$ theo sản lượng $x$.
    #align(center)[#fig-cost]
    Ý nghĩa thực tế của đường tiệm cận ngang $y = 1$ là:],
  (
    [Chi phí trung bình luôn đúng bằng $1$ với mọi $x$],
    True([Khi sản lượng rất lớn, chi phí trung bình tiến gần đến mức $1$]),
    [Chi phí trung bình sẽ giảm xuống $0$],
    [Sản lượng tối đa bằng $1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đồ thị tiến gần tới đường thẳng $y = 1$ khi $x$ tăng rất lớn.]
    #step[Điều này cho thấy về dài hạn, chi phí trung bình tiến dần đến mức ổn định là $1$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị dưới đây mô tả nồng độ muối $S$ trong hồ theo thời gian bơm nước $t$.
    #align(center)[#fig-salt]
    Theo đồ thị, khi thời gian rất lớn thì nồng độ muối trong hồ tiến gần đến giá trị nào?],
  (
    [$0$],
    [$4$],
    True([$50$]),
    [$100$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đồ thị tiến dần tới đường tiệm cận ngang $y = 50$.]
    #step[Do đó khi thời gian rất lớn, nồng độ muối tiến gần đến $50$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Dựa vào đồ thị chi phí trung bình dưới đây,
    #align(center)[#fig-cost]
    nhận xét nào sau đây đúng?],
  (
    [$A(x)$ tăng trên toàn bộ miền xác định],
    True([$A(x)$ giảm và dần ổn định khi $x$ tăng]),
    [$A(x)$ có một cực đại],
    [$A(x)$ cắt trục hoành],
  ),
  accent: c-book,
  loigiai: [
    #step[Đồ thị đi xuống khi $x$ tăng và không có điểm quay đầu.]
    #step[Đồng thời đồ thị tiến dần đến tiệm cận ngang $y = 1$.]
    #step[Vì vậy mô tả đúng là $A(x)$ giảm và dần ổn định khi $x$ tăng.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng/Sai (2 câu)], count: 2)

#q-wrap(dir: "ngang", ds(
  [Cho đồ thị lợi nhuận $L$ theo số lần tăng giá $x$ như hình dưới đây:
    #align(center)[#fig-profit]
    Xét các phát biểu sau:],
  (
    True([Lợi nhuận tăng khi $x < 3$.]),
    True([Lợi nhuận lớn nhất đạt tại $x = 3$.]),
    [Khi $x > 3$, lợi nhuận tiếp tục tăng.],
    True([Đồ thị có dạng một parabol quay xuống.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Trước đỉnh $M$, đồ thị đi lên nên lợi nhuận tăng.
    - b) Đúng. Đỉnh của đồ thị ở $x = 3$.
    - c) Sai. Sau đỉnh, đồ thị đi xuống nên lợi nhuận giảm.
    - d) Đúng. Hình dạng đường cong cho thấy đây là một parabol quay xuống.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho đồ thị chi phí trung bình $A$ theo sản lượng $x$ như hình dưới đây:
    #align(center)[#fig-cost]
    Xét các phát biểu sau:],
  (
    True([Đồ thị có một tiệm cận ngang là $y = 1$.]),
    [Chi phí trung bình bằng $0$ khi sản lượng đủ lớn.],
    True([Khi sản lượng tăng, chi phí trung bình giảm dần.]),
    True([Đồ thị luôn nằm phía trên đường $y = 1$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Đường gạch đỏ $y = 1$ là tiệm cận ngang của đồ thị.
    - b) Sai. Đồ thị không tiến về $0$ mà tiến về $1$.
    - c) Đúng. Trên phần hình đang xét, đồ thị đi xuống khi $x$ tăng.
    - d) Đúng. Trên miền $x > 0$, đường cong luôn ở phía trên đường tiệm cận ngang $y = 1$.
  ],
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (4 câu)], count: 4)

#q-wrap(dir: "doc", tln(
  [Dựa vào đồ thị nồng độ thuốc dưới đây,
    #align(center)[#fig-drug]
    hãy cho biết nồng độ thuốc tăng trong khoảng thời gian nào.],
  [Từ lúc bắt đầu đến khoảng $2$ giờ],
  accent: c-book,
  loigiai: [
    #step[Quan sát đồ thị, từ $t = 0$ đến gần $t = 2$ đường cong đi lên.]
    #step[Sau $t = 2$, đường cong đi xuống.]
    #step[Vì vậy nồng độ thuốc tăng từ lúc bắt đầu đến khoảng $2$ giờ.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Đồ thị nồng độ muối trong hồ như sau:
    #align(center)[#fig-salt]
    Nếu coi mức $40$ là ngưỡng an toàn, hãy ước lượng thời điểm nồng độ muối bắt đầu vượt ngưỡng này.],
  [Khoảng sau $t = 4$],
  accent: c-book,
  loigiai: [
    #step[Trên trục tung, mức $40$ tương ứng với giá trị khoảng $3.2$ theo tỉ lệ của hình vẽ.]
    #step[Quan sát giao điểm của đường cong với mức này cho thấy thời điểm xảy ra vào khoảng $t = 4$.]
    #step[Vậy nồng độ muối bắt đầu vượt ngưỡng an toàn khoảng sau $t = 4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho đồ thị lợi nhuận sau:
    #align(center)[#fig-profit]
    Hãy nêu số lần điều chỉnh giá tối ưu và giải thích ngắn gọn vì sao.],
  [$x = 3$],
  accent: c-book,
  loigiai: [
    #step[Điểm cao nhất trên đồ thị là đỉnh $M$, có hoành độ bằng $3$.]
    #step[Hoành độ của đỉnh cho biết mức điều chỉnh làm lợi nhuận lớn nhất.]
    #step[Vì vậy số lần điều chỉnh giá tối ưu là $x = 3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Dựa vào đồ thị chi phí trung bình dưới đây,
    #align(center)[#fig-cost]
    hãy cho biết chi phí trung bình sẽ tiến gần tới giá trị nào khi sản lượng tăng rất lớn.],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Đồ thị tiến gần tới đường tiệm cận ngang $y = 1$.]
    #step[Do đó khi sản lượng tăng rất lớn, chi phí trung bình tiến gần tới $1$.]
  ],
))
