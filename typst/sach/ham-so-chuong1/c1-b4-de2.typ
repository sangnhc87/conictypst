#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#let sample(f, a, b, n: 60) = {
  let step = (b - a) / n
  range(n + 1).map(i => {
    let x = a + i * step
    (x, f(x))
  })
}

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 02]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ xác định trên $RR without \{1\}$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($-$, $||$, $+$),
        v-vals: ($2$, ($-oo$, $-oo$), $3$),
      )
    ]
    Tìm số đường tiệm cận đứng và tiệm cận ngang của đồ thị hàm số đã cho.
  ],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giới hạn tại vô cực: $lim_(x -> -oo) f(x) = 2$ nên đường thẳng $y = 2$ là tiệm cận ngang.]
    #step[Giới hạn tại vô cực: $lim_(x -> +oo) f(x) = 3$ nên đường thẳng $y = 3$ là tiệm cận ngang.]
    #step[Giới hạn một bên tại điểm bất liên tục $x = 1$: $lim_(x -> 1^-) f(x) = -oo$ (hoặc $lim_(x -> 1^+) f(x) = +oo$) nên đường thẳng $x = 1$ là tiệm cận đứng.]
    #step[Vậy đồ thị có tổng cộng $3$ đường tiệm cận.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $-2$, $2$, $+oo$),
        d-signs: ($+$, $||$, $-$, $||$, $+$),
        v-vals: ($1$, ($+oo$, $+oo$), ($-oo$, $-oo$), $1$),
        ranks: (1, (2, 2), (0, 0), 1),
        w2: 9.5,
      )
    ]
    Tìm phương trình tiệm cận ngang và các tiệm cận đứng của đồ thị hàm số.
  ],
  (
    [$y = 1, x = 2$],
    [$y = 1, x = -2$],
    True([$y = 1, x = -2, x = 2$]),
    [$y = 1, y = 2, x = -2$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giới hạn khi $x -> +- oo$: $lim_(x -> -oo) f(x) = 1$ và $lim_(x -> +oo) f(x) = 1$ nên đồ thị có $1$ tiệm cận ngang là $y = 1$.]
    #step[Xét tại $x = -2$: $lim_(x -> -2^-) f(x) = +oo$ nên $x = -2$ là tiệm cận đứng.]
    #step[Xét tại $x = 2$: $lim_(x -> 2^-) f(x) = +oo$ nên $x = 2$ là tiệm cận đứng.]
    #step[Vậy đồ thị có $1$ tiệm cận ngang $y = 1$ và $2$ tiệm cận đứng $x = -2, x = 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ xác định trên khoảng $(0; +oo)$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($0$, $1$, $+oo$),
        d-signs: ($||$, $-$, $||$, $+$),
        v-vals: (($+oo$, none), ($-oo$, $+oo$), $2$),
      )
    ]
    Số đường tiệm cận của đồ thị hàm số đã cho là bao nhiêu?
  ],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Xét tiệm cận ngang: $lim_(x -> +oo) f(x) = 2$ nên có $1$ tiệm cận ngang là $y = 2$.]
    #step[Xét tiệm cận đứng tại điểm biên trái $x = 0$: $lim_(x -> 0^+) f(x) = +oo$ nên $x = 0$ là tiệm cận đứng.]
    #step[Xét tiệm cận đứng tại $x = 1$: $lim_(x -> 1^-) f(x) = -oo$ (hoặc $lim_(x -> 1^+) f(x) = +oo$) nên $x = 1$ là tiệm cận đứng.]
    #step[Tổng số đường tiệm cận đứng và tiệm cận ngang là $3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên dưới:
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((-4.2, 0), (4.2, 0), mark: (end: "stealth", scale: 0.4))
        line((0, -3.2), (0, 3.2), mark: (end: "stealth", scale: 0.4))
        content((4.0, -0.35), $x$)
        content((0.35, 3.0), $y$)
        content((-0.25, -0.25), $O$)

        // Tiệm cận
        line((-1, -3), (-1, 2.8), stroke: (paint: gray, dash: "dashed"))
        line((-4, 1), (3.8, 1), stroke: (paint: gray, dash: "dashed"))
        content((-1.6, 2.5), $x=-1$, fill: gray)
        content((3.2, 1.4), $y=1$, fill: gray)

        // Đồ thị
        let pts1 = sample(x => 1 + 1.5 / (x + 1), -3.8, -1.5)
        hobby(..pts1, stroke: blue + 1.2pt, fill: none)
        let pts2 = sample(x => 1 + 1.5 / (x + 1), -0.5, 3.5)
        hobby(..pts2, stroke: blue + 1.2pt, fill: none)
      })
    ]
    Tìm phương trình tiệm cận đứng và tiệm cận ngang của đồ thị hàm số trên.
  ],
  (
    [$x = 1, y = -1$],
    True([$x = -1, y = 1$]),
    [$x = -1, y = -1$],
    [$x = 1, y = 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Quan sát đồ thị ta thấy:]
    #step[
      - Đồ thị có nhánh tiến sát tới đường thẳng thẳng đứng $x = -1$ khi $x -> -1^-$ và $x -> -1^+$. Vậy tiệm cận đứng là $x = -1$.
    ]
    #step[
      - Đồ thị có nhánh tiến sát tới đường nằm ngang $y = 1$ khi $x -> -oo$ và $x -> +oo$. Vậy tiệm cận ngang là $y = 1$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên dưới:
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((-3.2, 0), (5.2, 0), mark: (end: "stealth", scale: 0.4))
        line((0, -3.2), (0, 5.2), mark: (end: "stealth", scale: 0.4))
        content((5.0, -0.35), $x$)
        content((0.35, 5.0), $y$)
        content((-0.25, -0.25), $O$)

        // Tiệm cận
        line((1, -3), (1, 4.8), stroke: (paint: gray, dash: "dashed"))
        line((-3, -3), (4.8, 4.8), stroke: (paint: gray, dash: "dashed"))
        content((1.5, 4.3), $x=1$, fill: gray)
        content((3.8, 4.2), $y=x$, fill: gray)

        // Đồ thị
        let pts1 = sample(x => x + 1 / (x - 1), -2.2, 0.7)
        hobby(..pts1, stroke: blue + 1.2pt, fill: none)
        let pts2 = sample(x => x + 1 / (x - 1), 1.3, 4.2)
        hobby(..pts2, stroke: blue + 1.2pt, fill: none)
      })
    ]
    Xác định phương trình tiệm cận đứng và tiệm cận xiên của đồ thị hàm số trên.
  ],
  (
    [$x = -1, y = x$],
    [$x = 1, y = 2x$],
    True([$x = 1, y = x$]),
    [$x = 1, y = -x$],
  ),
  accent: c-book,
  loigiai: [
    #step[Dựa vào hình vẽ đồ thị:]
    #step[- Đường tiệm cận đứng thẳng đứng song song trục tung cắt trục hoành tại hoành độ $1$ là $x = 1$.]
    #step[- Đường tiệm cận xiên đi qua gốc tọa độ $O(0; 0)$ và điểm $(1; 1)$, có phương trình $y = x$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ xác định trên $RR$ và thỏa mãn $lim_(x -> -oo) f(x) = 2$ và $lim_(x -> +oo) f(x) = -oo$. Khẳng định nào sau đây đúng?],
  (
    [Đồ thị hàm số có hai tiệm cận ngang là $y = 2$ và $y = -oo$.],
    True([Đồ thị hàm số có đúng một tiệm cận ngang là $y = 2$.]),
    [Đồ thị hàm số không có tiệm cận ngang.],
    [Đồ thị hàm số có một tiệm cận đứng là $x = 2$.],
  ),
  accent: c-book,
  loigiai: [
    #step[Theo định nghĩa tiệm cận ngang:]
    #step[- Vì $lim_(x -> -oo) f(x) = 2$ (hữu hạn) nên đường thẳng $y = 2$ là tiệm cận ngang.]
    #step[- Vì $lim_(x -> +oo) f(x) = -oo$ nên hướng này không cho tiệm cận ngang.]
    #step[Do đó đồ thị hàm số có đúng một tiệm cận ngang là $y = 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ có tập xác định $D = RR without \{x_0\}$ và thỏa mãn $lim_(x -> x_0^+) f(x) = +oo$. Khẳng định nào sau đây luôn đúng?],
  (
    [Đồ thị hàm số có tiệm cận ngang là $y = x_0$.],
    [Đồ thị hàm số không có tiệm cận đứng.],
    True([Đường thẳng $x = x_0$ là tiệm cận đứng của đồ thị hàm số.]),
    [Hàm số luôn đồng biến trên các khoảng xác định.],
  ),
  accent: c-book,
  loigiai: [
    #step[Theo định nghĩa tiệm cận đứng, chỉ cần ít nhất một giới hạn một bên của $f(x)$ tại $x_0$ tiến ra vô cực ($+oo$ hoặc $-oo$) thì đường thẳng $x = x_0$ là tiệm cận đứng.]
    #step[Ở đây $lim_(x -> x_0^+) f(x) = +oo$ nên $x = x_0$ chắc chắn là tiệm cận đứng.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nếu đồ thị hàm số $y = f(x)$ thỏa mãn $lim_(x -> +oo) [f(x) - (3x - 2)] = 0$ thì khẳng định nào sau đây đúng?],
  (
    [Đồ thị hàm số có tiệm cận ngang là $y = 3x - 2$.],
    True([Đồ thị hàm số có tiệm cận xiên là đường thẳng $y = 3x - 2$.]),
    [Đồ thị hàm số có tiệm cận đứng là $x = 3$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 3$.],
  ),
  accent: c-book,
  loigiai: [
    #step[Theo định nghĩa tiệm cận xiên, đường thẳng $y = a x + b$ ($a != 0$) là tiệm cận xiên của đồ thị hàm số $y = f(x)$ khi và chỉ khi $lim_(x -> +oo) [f(x) - (a x + b)] = 0$.]
    #step[Do đó, đường thẳng $y = 3x - 2$ là tiệm cận xiên của đồ thị hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số bậc nhất trên bậc nhất $y = (a x + b)/(c x + d)$ ($c != 0, a d - b c != 0$) có đồ thị $(C)$. Giao điểm hai đường tiệm cận của $(C)$ là điểm nào dưới đây?],
  (
    [$I(d/c; a/c)$],
    True([$I(-d/c; a/c)$]),
    [$I(-d/c; -a/c)$],
    [$I(d/c; -a/c)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đồ thị hàm số có tiệm cận đứng là $x = -d/c$ và tiệm cận ngang là $y = a/c$.]
    #step[Giao điểm của hai đường tiệm cận này là điểm $I(-d/c; a/c)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ xác định trên $RR without \{-1\}$ có bảng biến thiên:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $-1$, $1$, $+oo$),
        d-signs: ($+$, $||$, $-$, $0$, $+$),
        v-vals: ($2$, ($+oo$, $-oo$), $-2$, $2$),
      )
    ]
    Khẳng định nào dưới đây đúng?
  ],
  (
    [Đồ thị hàm số có 2 tiệm cận ngang và 2 tiệm cận đứng.],
    [Đồ thị hàm số có 1 tiệm cận ngang và 2 tiệm cận đứng.],
    True([Đồ thị hàm số có 1 tiệm cận ngang và 1 tiệm cận đứng.]),
    [Đồ thị hàm số không có tiệm cận đứng.],
  ),
  accent: c-book,
  loigiai: [
    #step[Giới hạn tại vô cực: $lim_(x -> -oo) f(x) = 2$ và $lim_(x -> +oo) f(x) = 2$ nên có đúng 1 tiệm cận ngang là $y = 2$.]
    #step[Giới hạn tại $-1$: $lim_(x -> -1^-) f(x) = +oo$ nên có tiệm cận đứng $x = -1$.]
    #step[Vậy đồ thị có 1 tiệm cận ngang và 1 tiệm cận đứng.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng biến thiên:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $-1$, $1$, $+oo$),
        d-signs: ($-$, $0$, $+$, $0$, $-$),
        v-vals: ($-oo$, $-2$, $4$, $-oo$),
      )
    ]
    Tìm số đường tiệm cận đứng và tiệm cận ngang của đồ thị hàm số đã cho.
  ],
  (
    [$1$],
    [$2$],
    [$3$],
    True([$0$]),
  ),
  accent: c-book,
  loigiai: [
    #step[Vì hàm số liên tục trên $RR$ nên đồ thị hàm số không có tiệm cận đứng.]
    #step[Xét giới hạn khi $x -> +- oo$: $lim_(x -> -oo) f(x) = -oo$ và $lim_(x -> +oo) f(x) = -oo$. Do đó đồ thị cũng không có tiệm cận ngang.]
    #step[Số đường tiệm cận đứng và tiệm cận ngang là $0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho đồ thị hàm số $y = f(x)$ nhận trục hoành làm tiệm cận ngang và trục tung làm tiệm cận đứng. Khi đó, phương trình các tiệm cận là gì?],
  (
    [$x = 1, y = 0$],
    [$x = 0, y = 1$],
    True([$x = 0, y = 0$]),
    [$x = 1, y = 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Trục hoành có phương trình là $y = 0$, đóng vai trò là tiệm cận ngang.]
    #step[Trục tung có phương trình là $x = 0$, đóng vai trò là tiệm cận đứng.]
    #step[Vậy phương trình các tiệm cận là $x = 0, y = 0$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x)$ liên tục trên $RR without \{0\}$ và có bảng biến thiên sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $0$, $2$, $+oo$),
        d-signs: ($-$, $||$, $-$, $0$, $+$),
        v-vals: ($3$, ($-oo$, $+oo$), $-1$, $+oo$),
      )
    ]
    Xét tính Đúng/Sai của các phát biểu sau:
  ],
  (
    True([Đồ thị hàm số có duy nhất một tiệm cận ngang là đường thẳng $y = 3$.]),
    True([Đồ thị hàm số có tiệm cận đứng là đường thẳng $x = 0$.]),
    [Tiệm cận ngang của đồ thị hàm số khi $x -> +oo$ là đường thẳng $y = -1$.],
    True([Đồ thị hàm số có tổng cộng hai đường tiệm cận đứng và ngang.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Vì $lim_(x -> -oo) f(x) = 3$ (cho tiệm cận ngang $y = 3$) còn $lim_(x -> +oo) f(x) = +oo$ (không cho tiệm cận ngang).
    - b) Đúng. Vì $lim_(x -> 0^-) f(x) = -oo$ (hoặc $lim_(x -> 0^+) f(x) = +oo$), suy ra $x = 0$ là tiệm cận đứng.
    - c) Sai. Khi $x -> +oo$, giới hạn của hàm số là $+oo$, không phải là tiệm cận ngang. Giá trị $-1$ là cực tiểu của hàm số tại $x=2$.
    - d) Đúng. Đồ thị có 1 tiệm cận ngang $y = 3$ và 1 tiệm cận đứng $x = 0$, tổng cộng là 2 tiệm cận.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ bên dưới:
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((-4.2, 0), (4.2, 0), mark: (end: "stealth", scale: 0.4))
        line((0, -3.2), (0, 3.2), mark: (end: "stealth", scale: 0.4))
        content((4.0, -0.35), $x$)
        content((0.35, 3.0), $y$)
        content((-0.25, -0.25), $O$)

        // Tiệm cận
        line((2, -3), (2, 2.8), stroke: (paint: gray, dash: "dashed"))
        line((-4, -1), (3.8, -1), stroke: (paint: gray, dash: "dashed"))
        content((2.5, 2.5), $x=2$, fill: gray)
        content((-3.2, -0.6), $y=-1$, fill: gray)

        // Đồ thị
        let pts1 = sample(x => -1 + 1.2 / (x - 2), -1.8, 1.6)
        hobby(..pts1, stroke: blue + 1.2pt, fill: none)
        let pts2 = sample(x => -1 + 1.2 / (x - 2), 2.4, 3.8)
        hobby(..pts2, stroke: blue + 1.2pt, fill: none)
      })
    ]
    Xét tính Đúng/Sai của các khẳng định sau:
  ],
  (
    True([Đường thẳng $x = 2$ là tiệm cận đứng duy nhất của đồ thị hàm số.]),
    True([Đường thẳng $y = -1$ là tiệm cận ngang duy nhất của đồ thị hàm số.]),
    [Giao điểm của hai đường tiệm cận có tọa độ là $I(-1; 2)$.],
    True([Đồ thị hàm số cắt trục tung tại điểm có tung độ là $-1.6$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Đồ thị tiến ra vô cực tại lân cận của hoành độ $x = 2$.
    - b) Đúng. Đồ thị tiệm cận về đường nằm ngang $y = -1$ ở cả hai phía vô cực.
    - c) Sai. Giao điểm tiệm cận đứng $x = 2$ và tiệm cận ngang $y = -1$ phải là $I(2; -1)$.
    - d) Đúng. Hàm số có dạng $y = -1 + 1.2/(x - 2)$. Tại $x=0$, $y = -1 + 1.2/(-2) = -1 - 0.6 = -1.6$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x)$ xác định trên $RR$ và có giới hạn:
    $ lim_(x -> +oo) f(x) = 2, "   " lim_(x -> -oo) f(x) = -2. $
    Xét tính Đúng/Sai của các khẳng định sau:
  ],
  (
    True([Đồ thị hàm số có tiệm cận ngang là đường thẳng $y = 2$.]),
    True([Đồ thị hàm số có tiệm cận ngang là đường thẳng $y = -2$.]),
    [Đồ thị hàm số có tiệm cận đứng là các đường thẳng $x = 2$ và $x = -2$.],
    [Vì hàm số xác định trên toàn bộ $RR$ nên đồ thị hàm số chắc chắn không có tiệm cận xiên.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Do giới hạn khi $x -> +oo$ bằng $2$.
    - b) Đúng. Do giới hạn khi $x -> -oo$ bằng $-2$.
    - c) Sai. Đây là các tiệm cận ngang, không phải tiệm cận đứng.
    - d) Sai. Việc hàm số xác định trên toàn bộ $RR$ không đủ để loại trừ tiệm cận xiên. Trong bài này, do $lim_(x -> +oo) f(x) = 2$ và $lim_(x -> -oo) f(x) = -2$ nên đồ thị có hai tiệm cận ngang $y = 2$ và $y = -2$, vì vậy không có tiệm cận xiên ở hai phía đó.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x)$ xác định trên $RR without \{-2; 2\}$ và có bảng biến thiên:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $-2$, $0$, $2$, $+oo$),
        d-signs: ($+$, $||$, $-$, $0$, $+$, $||$, $-$),
        v-vals: ($1$, ($+oo$, $-oo$), $0$, ($+oo$, $-oo$), $-1$),
      )
    ]
    Xét tính Đúng/Sai của các phát biểu sau:
  ],
  (
    True([Đồ thị hàm số đã cho có đúng hai tiệm cận đứng là $x = -2$ và $x = 2$.]),
    True([Đồ thị có hai đường tiệm cận ngang là $y = 1$ và $y = -1$.]),
    [Hàm số đạt cực đại tại $x = 0$.],
    True([Tổng số tiệm cận đứng và tiệm cận ngang của đồ thị hàm số là $4$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Giới hạn một bên tại cả $-2$ và $2$ đều ra vô cực.
    - b) Đúng. Giới hạn khi $x -> -oo$ bằng $1$ và khi $x -> +oo$ bằng $-1$.
    - c) Sai. Đạo hàm đổi dấu từ âm sang dương khi đi qua $x=0$, nên hàm số đạt cực tiểu tại $x = 0$, không phải cực đại.
    - d) Đúng. Có 2 tiệm cận đứng ($x = +-2$) và 2 tiệm cận ngang ($y = +-1$), tổng cộng là $4$ đường tiệm cận.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ xác định trên $RR$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $-1$, $1$, $+oo$),
        d-signs: ($+$, $0$, $-$, $||$, $+$),
        v-vals: ($-3$, $2$, ($-oo$, $-oo$), $4$),
      )
    ]
    Tìm tổng số đường tiệm cận đứng và tiệm cận ngang của đồ thị hàm số đã cho.
  ],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Tìm tiệm cận ngang:
      - $lim_(x -> -oo) f(x) = -3 => y = -3$ là tiệm cận ngang.
      - $lim_(x -> +oo) f(x) = 4 => y = 4$ là tiệm cận ngang.
    ]
    #step[Tìm tiệm cận đứng:
      - Tại điểm $x = 1$, ta có $lim_(x -> 1^-) f(x) = -oo$ (hoặc $lim_(x -> 1^+) f(x) = +oo$) nên $x = 1$ là tiệm cận đứng.
    ]
    #step[Vậy đồ thị có $2$ tiệm cận ngang và $1$ tiệm cận đứng, tổng số là $3$ tiệm cận.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $-2$, $1$, $+oo$),
        d-signs: ($+$, $||$, $-$, $||$, $-$),
        v-vals: ($2$, ($+oo$, $+oo$), ($-oo$, $4$), $-oo$),
      )
    ]
    Tìm số đường tiệm cận đứng của đồ thị hàm số đã cho.
  ],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Xét điểm $x = -2$: $lim_(x -> -2^-) f(x) = +oo$ nên $x = -2$ là tiệm cận đứng.]
    #step[Xét điểm $x = 1$: $lim_(x -> 1^-) f(x) = +oo$ nên $x = 1$ là tiệm cận đứng.]
    #step[Do đó, đồ thị hàm số có đúng $2$ đường tiệm cận đứng.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ có giới hạn $lim_(x -> 1^-) f(x) = -oo$, $lim_(x -> 1^+) f(x) = 2$ và $lim_(x -> -oo) f(x) = -1$, $lim_(x -> +oo) f(x) = 3$. Tìm tổng số tiệm cận đứng và tiệm cận ngang của đồ thị hàm số.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Từ các giới hạn đề bài cho:]
    #step[- $lim_(x -> 1^-) f(x) = -oo$ suy ra đường thẳng $x = 1$ là tiệm cận đứng.]
    #step[- $lim_(x -> -oo) f(x) = -1$ suy ra đường thẳng $y = -1$ là tiệm cận ngang.]
    #step[- $lim_(x -> +oo) f(x) = 3$ suy ra đường thẳng $y = 3$ là tiệm cận ngang.]
    #step[Tổng số tiệm cận đứng và tiệm cận ngang là: $1 + 2 = 3$ đường tiệm cận.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ xác định trên $RR without \{1\}$ và có bảng biến thiên:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($+$, $||$, $+$),
        v-vals: ($-1$, ($+oo$, $-oo$), $1$),
      )
    ]
    Tìm số đường tiệm cận đứng của đồ thị hàm số $y = 1/(f(x))$.
  ],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đường tiệm cận đứng của đồ thị hàm số $g(x) = 1/(f(x))$ xảy ra khi $f(x) -> 0$ hoặc khi $f(x) -> +-oo$ nhưng $1/(f(x)) -> +-oo$ (điều này không xảy ra vì khi $f(x) -> oo$ thì $g(x) -> 0$).]
    #step[Vậy tiệm cận đứng của $g(x)$ xảy ra tại các điểm mà $f(x) = 0$ và tại $x = 1$ nếu giới hạn một bên của $g(x)$ tại đó ra vô cực (ta có $lim_(x -> 1^-) f(x) = +oo => lim_(x -> 1^-) g(x) = 0$ và tương tự với $x -> 1^+$, nên $x=1$ không phải tiệm cận đứng).]
    #step[Dựa vào bảng biến thiên của $f(x)$:]
    #step[
      - Trên khoảng $(-oo; 1)$, $f(x)$ tăng liên tục từ $-1$ lên $+oo$, do đó đồ thị cắt trục hoành tại duy nhất một điểm (tức là tồn tại $x_1 < 1$ sao cho $f(x_1) = 0$).
    ]
    #step[
      - Trên khoảng $(1; +oo)$, $f(x)$ tăng liên tục từ $-oo$ lên $1$, do đó đồ thị cũng cắt trục hoành tại duy nhất một điểm (tồn tại $x_2 > 1$ sao cho $f(x_2) = 0$).
    ]
    #step[Tại các điểm $x_1, x_2$, ta có $f(x) = 0$ nên $lim_(x -> x_1) 1/(f(x)) = oo$ và $lim_(x -> x_2) 1/(f(x)) = oo$.]
    #step[Do đó, đồ thị hàm số $y = 1/(f(x))$ có đúng $2$ tiệm cận đứng.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ có bảng biến thiên:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $2$, $+oo$),
        d-signs: ($-$, $||$, $-$),
        v-vals: ($+oo$, ($-oo$, $+oo$), $-oo$),
      )
    ]
    Tìm số đường tiệm cận đứng của đồ thị hàm số $y = 1/(f(x) - 3)$.
  ],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đặt $g(x) = 1/(f(x) - 3)$. Tiệm cận đứng của đồ thị $g(x)$ xảy ra tại các điểm làm cho mẫu số bằng $0$ (tức là $f(x) = 3$) và tại các điểm biên nơi giới hạn tiến ra vô cực.]
    #step[Dựa vào bảng biến thiên của $f(x)$:]
    #step[
      - Trên khoảng $(-oo; 2)$, $f(x)$ giảm liên tục từ $+oo$ về $-oo$. Vì $3 in (-oo; +oo)$ nên phương trình $f(x) = 3$ có duy nhất một nghiệm $x_1 < 2$.
    ]
    #step[
      - Trên khoảng $(2; +oo)$, $f(x)$ cũng giảm liên tục từ $+oo$ về $-oo$. Vì $3 in (-oo; +oo)$ nên phương trình $f(x) = 3$ có duy nhất một nghiệm $x_2 > 2$.
    ]
    #step[
      - Tại điểm $x = 2$, giới hạn của hàm số là vô cực ($lim_(x -> 2^-) f(x) = -oo$ và $lim_(x -> 2^+) f(x) = +oo$). Khi đó $lim_(x -> 2) g(x) = lim_(x -> 2) 1/(f(x) - 3) = 0$ (hữu hạn), nên đường thẳng $x = 2$ không phải là tiệm cận đứng của đồ thị $g(x)$.
    ]
    #step[Vậy đồ thị hàm số $y = 1/(f(x) - 3)$ có đúng $2$ đường tiệm cận đứng là $x = x_1$ và $x = x_2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ liên tục trên $RR without \{1\}$ và có đồ thị như hình vẽ bên dưới:
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((-3.2, 0), (4.2, 0), mark: (end: "stealth", scale: 0.4))
        line((0, -3.2), (0, 3.2), mark: (end: "stealth", scale: 0.4))
        content((4.0, -0.35), $x$)
        content((0.35, 3.0), $y$)
        content((-0.25, -0.25), $O$)

        // Tiệm cận
        line((1, -3), (1, 2.8), stroke: (paint: gray, dash: "dashed"))
        line((-3, -1), (3.8, -1), stroke: (paint: gray, dash: "dashed"))
        content((1.5, 2.5), $x=1$, fill: gray)
        content((-2.2, -0.6), $y=-1$, fill: gray)

        // Đồ thị
        let pts1 = sample(x => -1 + 0.8 / (x - 1), -1.8, 0.6)
        hobby(..pts1, stroke: blue + 1.2pt, fill: none)
        let pts2 = sample(x => -1 + 0.8 / (x - 1), 1.4, 3.5)
        hobby(..pts2, stroke: blue + 1.2pt, fill: none)
      })
    ]
    Tìm hoành độ giao điểm của tiệm cận đứng và tiệm cận ngang của đồ thị hàm số.
  ],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Dựa vào đồ thị hàm số:]
    #step[- Tiệm cận đứng là đường thẳng $x = 1$.]
    #step[- Tiệm cận ngang là đường thẳng $y = -1$.]
    #step[Giao điểm của hai đường tiệm cận là điểm $I(1; -1)$.]
    #step[Hoành độ giao điểm là $1$.]
  ],
))
