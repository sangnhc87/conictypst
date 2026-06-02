#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#let fig-tcn = cetz.canvas(length: 0.9cm, {
  import cetz.draw: *
  // Ox, Oy
  line((-1.5, 0), (4.5, 0), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  line((0, -1.0), (0, 3.2), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  content((4.3, -0.25), $x$)
  content((0.25, 3.0), $y$)
  content((-0.2, -0.2), $O$)

  // y = y_0
  line((-1.2, 2), (4.2, 2), stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
  content((3.8, 2.3), $y = y_0$, fill: white)

  // y = 2 - 1.5/(x + 0.8)
  let f(x) = { 2 - 1.5 / (x + 0.8) }
  let pts = ()
  for i in range(40) {
    let x = -0.3 + i * 4.4 / 40
    pts.push((x, f(x)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
  content((2.8, 1.1), $y = f(x)$)
})

#let fig-tcd = cetz.canvas(length: 0.9cm, {
  import cetz.draw: *
  // Ox, Oy
  line((-1.2, 0), (3.8, 0), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  line((0, -1.2), (0, 3.8), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  content((3.6, -0.25), $x$)
  content((0.25, 3.6), $y$)
  content((-0.2, -0.2), $O$)

  // x = x_0
  line((1.5, -1.0), (1.5, 3.5), stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
  content((1.9, 3.3), $x = x_0$, fill: white)

  // Left branch: y = -0.3 + 0.3/(x - 1.5) from x = -0.8 to x = 1.35
  let f_left(x) = { -0.3 + 0.3 / (x - 1.5) }
  let pts_left = ()
  for i in range(30) {
    let x = -0.8 + i * 2.15 / 30
    pts_left.push((x, f_left(x)))
  }
  line(..pts_left, stroke: rgb("#0f4c81") + 1.2pt)

  // Right branch: y = 0.3 + 0.3/(x - 1.5) from x = 1.65 to x = 3.5
  let f_right(x) = { 0.3 + 0.3 / (x - 1.5) }
  let pts_right = ()
  for i in range(30) {
    let x = 1.65 + i * 1.85 / 30
    pts_right.push((x, f_right(x)))
  }
  line(..pts_right, stroke: rgb("#0f4c81") + 1.2pt)
  content((2.8, 1.2), $y = f(x)$)
})

#let fig-tcx = cetz.canvas(length: 0.9cm, {
  import cetz.draw: *
  // Ox, Oy
  line((-1.5, 0), (4.5, 0), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  line((0, -1.2), (0, 4.2), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  content((4.3, -0.25), $x$)
  content((0.25, 4.0), $y$)
  content((-0.2, -0.2), $O$)

  // y = x + 0.5
  line((-1.2, -0.7), (3.5, 4.0), stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
  content((2.4, 3.3), $y = a x + b$, fill: white)

  // y = x + 0.5 + 0.8/(x + 0.5) from x = -0.2 to x = 3.5
  let f(x) = { x + 0.5 + 0.8 / (x + 0.5) }
  let pts = ()
  for i in range(40) {
    let x = -0.2 + i * 3.7 / 40
    pts.push((x, f(x)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)
  content((2.9, 1.8), $y = f(x)$)
})

#lesson([Đường tiệm cận của đồ thị hàm số], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Đường tiệm cận ngang])

#block(breakable: false)[
  #dn(title: [Định nghĩa TCN])[
    Cho hàm số $y = f(x)$ xác định trên một khoảng vô hạn (tức là khoảng dạng $(a; +oo)$, $(-oo; b)$ hoặc $(-oo; +oo)$).

    Đường thẳng $y = y_0$ được gọi là *đường tiệm cận ngang* (hoặc tiệm cận ngang) của đồ thị hàm số $y = f(x)$ nếu:
    $ lim_(x -> +oo) f(x) = y_0 " hoặc " lim_(x -> -oo) f(x) = y_0. $
  ]
]

#v(0.5em)
#align(center)[
  #fig-tcn
  #v(0.2em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 1. Minh họa tiệm cận ngang $y = y_0$]
]

#v(0.5em)
#block(breakable: false)[
  #phuongphap(title: [⚙ Phương pháp tìm tiệm cận ngang])[
    Để tìm tiệm cận ngang của đồ thị hàm số $y = f(x)$, ta tính giới hạn của hàm số khi $x -> +oo$ và $x -> -oo$:
    - Nếu $lim_(x -> +oo) f(x) = y_0$ ($y_0 in RR$) thì $y = y_0$ là tiệm cận ngang.
    - Nếu $lim_(x -> -oo) f(x) = y_1$ ($y_1 in RR$) thì $y = y_1$ là tiệm cận ngang.
    - Nếu giới hạn ra vô cực hoặc không tồn tại thì đồ thị không có tiệm cận ngang tương ứng.
  ]
]

#pagebreak()

#muc([Đường tiệm cận đứng])

#block(breakable: false)[
  #dn(title: [Định nghĩa TCĐ])[
    Đường thẳng $x = x_0$ được gọi là *đường tiệm cận đứng* (hoặc tiệm cận đứng) của đồ thị hàm số $y = f(x)$ nếu ít nhất một trong các điều kiện sau được thỏa mãn:
    $ lim_(x -> x_0^+) f(x) = +oo, "  " lim_(x -> x_0^+) f(x) = -oo, $
    $ lim_(x -> x_0^-) f(x) = +oo, "  " lim_(x -> x_0^-) f(x) = -oo. $
  ]
]

#v(0.5em)
#align(center)[
  #fig-tcd
  #v(0.2em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 2. Minh họa tiệm cận đứng $x = x_0$]
]

#v(0.5em)
#block(breakable: false)[
  #phuongphap(title: [⚙ Phương pháp tìm tiệm cận đứng])[
    Đối với các hàm số phân thức $y = frac(P(x), Q(x))$:
    1. Tìm các điểm $x_0$ làm cho mẫu số bằng $0$ ($Q(x_0) = 0$).
    2. Kiểm tra giới hạn $lim_(x -> x_0^+) f(x)$ hoặc $lim_(x -> x_0^-) f(x)$.
    3. Nếu giới hạn bằng $+oo$ hoặc $-oo$ thì đường thẳng $x = x_0$ là tiệm cận đứng.
    *(Lưu ý: Nếu $x_0$ là nghiệm của tử số $P(x)$ với số lần lặp nhỏ hơn hoặc bằng ở mẫu số thì giới hạn tại đó sẽ hữu hạn, đường thẳng $x = x_0$ không phải tiệm cận đứng).*
  ]
]

#pagebreak()

#muc([Đường tiệm cận xiên])

#block(breakable: false)[
  #dn(title: [Định nghĩa TCX])[
    Đường thẳng $y = a x + b$ ($a != 0$) được gọi là *đường tiệm cận xiên* (hoặc tiệm cận xiên) của đồ thị hàm số $y = f(x)$ nếu:
    $ lim_(x -> +oo) [f(x) - (a x + b)] = 0 " hoặc " lim_(x -> -oo) [f(x) - (a x + b)] = 0. $
  ]
]

#v(0.5em)
#align(center)[
  #fig-tcx
  #v(0.2em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 3. Minh họa tiệm cận xiên $y = a x + b$]
]

#v(0.5em)
#block(breakable: false)[
  #dl(title: [Định lý về hệ số tiệm cận xiên])[
    Hệ số $a$ và $b$ của đường tiệm cận xiên $y = a x + b$ được xác định bởi công thức:
    $
      a = lim_(x -> +- oo) frac(f(x), x) \
      b = lim_(x -> +- oo) [f(x) - a x].
    $
  ]
]

#v(0.5em)
#block(breakable: false)[
  #phuongphap(title: [⚙ Cách tìm tiệm cận xiên đặc biệt])[
    Đối với hàm số phân thức hữu tỷ $y = frac(A x^2 + B x + C, D x + E)$ ($D != 0$):
    Ta thực hiện chia tử số cho mẫu số để đưa hàm số về dạng:
    $ f(x) = a x + b + frac(R, D x + E) " (với " a != 0 ")" $
    Vì $lim_(x -> +- oo) frac(R, D x + E) = 0$ nên đường thẳng $y = a x + b$ là tiệm cận xiên của đồ thị hàm số.
  ]
]

#pagebreak()

#muc([Tiệm cận trong bối cảnh thực tế])

#block(breakable: false)[
  #phuongphap(title: [Đọc ý nghĩa thực tế của tiệm cận])[
    Trong các mô hình thực tế, tiệm cận không chỉ là một đối tượng hình học mà còn là cách đọc xu hướng dài hạn của đại lượng.

    - *Tiệm cận ngang* thường biểu diễn mức bão hòa, mức ổn định hoặc ngưỡng tối đa, tối thiểu mà đại lượng tiến gần tới về lâu dài.
    - *Tiệm cận đứng* thường biểu diễn ngưỡng cấm, ngưỡng tắc nghẽn, điểm mô hình mất hiệu lực hoặc giá trị làm chi phí, áp lực tăng vọt.
    - *Tiệm cận xiên* thường biểu diễn xu hướng tăng gần tuyến tính khi quy mô đủ lớn: đại lượng vẫn tăng nhưng bám sát một quy luật $y = a x + b$.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Khi diễn giải tiệm cận trong mô hình thực tế])[
    - Luôn xét *miền thực tế* trước khi kết luận ý nghĩa của tiệm cận.
    - Một tiệm cận đứng có thể xuất hiện về mặt đại số nhưng nằm ngoài miền khảo sát, khi đó nó không phải là ngưỡng xảy ra thật trong bài toán.
    - Tiệm cận ngang không có nghĩa đại lượng *đạt đúng* mức đó; ý nghĩa đúng là đại lượng *tiến gần* mức đó khi biến đủ lớn.
  ]
]

#block(breakable: false)[
  #ghinho(title: [★ Quy trình đọc tiệm cận trong bài toán thực tế])[
    1. Xác định biến số và miền có nghĩa của mô hình.
    2. Tìm các tiệm cận bằng giới hạn hoặc phép chia.
    3. Đổi kết quả sang ngôn ngữ thực tế: mức ổn định dài hạn, ngưỡng cấm, hay xu hướng tuyến tính chủ đạo.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c1-b4-de1.typ"
#include "c1-b4-de2.typ"
#include "c1-b4-de3.typ"
