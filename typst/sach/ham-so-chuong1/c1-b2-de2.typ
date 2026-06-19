#import "_config.typ": *
#import "@preview/cetz:0.5.2"
#show: doc-setup
#let sample(f, a, b, n: 60) = {
  let step = (b - a) / n
  range(n + 1).map(i => {
    let x = a + i * step
    (x, f(x))
  })
}

#let f-prime-graph = cetz.canvas(length: 0.6cm, {
  import cetz.draw: *
  line((-2.2, 0), (4.2, 0), mark: (end: "stealth", scale: 0.4))
  line((0, -2.5), (0, 2.5), mark: (end: "stealth", scale: 0.4))
  content((4.0, -0.3), $x$)
  content((0.3, 2.3), $y$)
  content((-0.25, -0.25), $O$)
  for v in (-1, 1, 3) {
    line((v, 0.07), (v, -0.07))
    content((v, -0.35), text(size: 8pt)[$#v$])
  }
  let pts = sample(x => -0.2 * (x + 1) * (x - 1) * (x - 3), -1.8, 3.8)
  hobby(..pts, stroke: blue + 1.2pt, fill: none)
  content((2.8, 1.5), $y = f'(x)$)
})

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 02]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Cho hàm số $f(x)$ có đạo hàm $f'(x) = (x - 1)^3 (x + 2) (x^2 + 4)$. Số điểm cực trị của hàm số là bao nhiêu?],
  ([$1$], True([$2$]), [$3$], [$4$]),
  accent: c-book,
  loigiai: [
    #step[Giải $f'(x) = 0 <=> (x - 1)^3 (x + 2) (x^2 + 4) = 0$.]
    #step[Nghiệm của phương trình gồm: $x = 1$ (bội 3), $x = -2$ (bội 1) và $x^2 + 4 = 0$ (vô nghiệm).]
    #step[Các nghiệm $x = 1$ và $x = -2$ đều là nghiệm bội lẻ nên đạo hàm đổi dấu khi đi qua chúng.]
    #step[Vậy hàm số có $2$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm tọa độ điểm cực đại của đồ thị hàm số $y = x^3 - 3x^2 + 4$.],
  ([$(2; 0)$], True([$(0; 4)$]), [$(0; 0)$], [$(1; 2)$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Qua $x = 0$, đạo hàm đổi dấu từ dương sang âm nên đạt cực đại tại $x = 0$.]
    #step[Với $x = 0$, giá trị cực đại là $y(0) = 4$. Tọa độ điểm cực đại của đồ thị là $(0; 4)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = x^4 + 4x^2 + 3$ có bao nhiêu điểm cực trị?],
  (True([$1$]), [$2$], [$3$], [$0$]),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = 4x^3 + 8x = 4x(x^2 + 2)$.]
    #step[Giải $y' = 0 <=> x = 0$ (do $x^2 + 2 > 0, forall x$).]
    #step[Đạo hàm có duy nhất $1$ nghiệm đơn là $x = 0$ và đổi dấu qua đó.]
    #step[Vậy hàm số có đúng $1$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm số điểm cực trị của hàm số $y = (x^2 + x + 2)/(x + 1)$.],
  ([$0$], [$1$], True([$2$]), [$3$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR backslash {-1}$.]
    #step[Tính đạo hàm: $y' = ((2x + 1)(x + 1) - (x^2 + x + 2))/(x + 1)^2 = (x^2 + 2x - 1)/(x + 1)^2$.]
    #step[Giải $y' = 0 <=> x^2 + 2x - 1 = 0$ có $2$ nghiệm phân biệt $x = -1 +- sqrt(2)$ (thỏa mãn điều kiện xác định).]
    #step[Đạo hàm đổi dấu qua cả hai nghiệm đơn này. Vậy hàm số có $2$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm điểm cực đại của hàm số $y = x e^(-x)$.],
  (True([$x = 1$]), [$x = -1$], [$x = e$], [$x = 0$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = e^(-x) - x e^(-x) = (1 - x)e^(-x)$.]
    #step[Giải $y' = 0 <=> 1 - x = 0 <=> x = 1$ (do $e^(-x) > 0, forall x$).]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = 1$.]
    #step[Vậy điểm cực đại của hàm số là $x = 1$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm số điểm cực trị của hàm số $y = sin 2x - x$ trên khoảng $(0; pi)$.],
  ([$0$], [$1$], True([$2$]), [$3$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 2 cos 2x - 1$.]
    #step[Giải $y' = 0 <=> cos 2x = 1/2 <=> 2x = +- pi/3 + k 2pi <=> x = +- pi/6 + k pi$.]
    #step[Trên khoảng $(0; pi)$, các nghiệm của phương trình là $x = pi/6$ và $x = 5pi/6$.]
    #step[Đạo hàm đổi dấu khi qua $2$ nghiệm đơn này. Vậy hàm số có $2$ điểm cực trị trên khoảng đã cho.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm tọa độ điểm cực tiểu của đồ thị hàm số $y = sqrt(x^2 + 1)$.],
  ([$(0; 0)$], True([$(0; 1)$]), [$(1; sqrt(2))$], [$(0; -1)$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = x/sqrt(x^2 + 1) = 0 <=> x = 0$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi qua $x = 0$, cực tiểu đạt tại $x = 0$.]
    #step[Giá trị cực tiểu: $y(0) = 1$. Tọa độ điểm cực tiểu của đồ thị là $(0; 1)$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm điểm cực tiểu của hàm số $y = x^2 - ln(x^2 + 1)$.],
  (True([$x = 0$]), [$x = 1$], [$x = -1$], [Không có điểm cực tiểu]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 2x - (2x)/(x^2 + 1) = (2x^3)/(x^2 + 1)$.]
    #step[Giải $y' = 0 <=> 2x^3 = 0 <=> x = 0$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 0$.]
    #step[Do đó, điểm cực tiểu của hàm số là $x = 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y=f(x)$ liên tục trên $RR$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ dưới đây:
    #align(center)[#f-prime-graph]
    Tìm số điểm cực trị của hàm số $g(x) = f(x^2 - 2x)$.
  ],
  ([$3$], True([$5$]), [$6$], [$4$]),
  accent: c-book,
  loigiai: [
    #step[Ta có $g'(x) = (2x - 2) f'(x^2 - 2x) = 2(x - 1) f'(x^2 - 2x)$.]
    #step[Cho $g'(x) = 0 <=> x = 1$ hoặc $f'(x^2 - 2x) = 0$.]
    #step[Từ đồ thị của $y = f'(x)$, ta thấy $f'(t) = 0 <=> t = -1$, $t = 1$ hoặc $t = 3$.]
    #step[Do đó, $f'(x^2 - 2x) = 0 <=> x^2 - 2x = -1$ (1), $x^2 - 2x = 1$ (2), $x^2 - 2x = 3$ (3).]
    #step[Giải các phương trình:
      - (1) $x^2 - 2x + 1 = 0 <=> x = 1$ (nghiệm kép). Kết hợp với nghiệm đơn $x = 1$ bên ngoài, ta được $x = 1$ là nghiệm bội 3 (bội lẻ).
      - (2) $x^2 - 2x - 1 = 0 <=> x = 1 +- sqrt(2)$ (2 nghiệm đơn).
      - (3) $x^2 - 2x - 3 = 0 <=> x = -1$ hoặc $x = 3$ (2 nghiệm đơn).
    ]
    #step[Các nghiệm trên đều phân biệt và là nghiệm bội lẻ. Vậy hàm số $g(x)$ có đúng $5$ điểm cực trị.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Hàm số $y = (ln x)/x$ đạt cực đại tại điểm nào?],
  ([$x = 1$], True([$x = e$]), [$x = 1/e$], [$x = e^2$]),
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = (0; +oo)$.]
    #step[Tính đạo hàm: $y' = (1 - ln x)/x^2$.]
    #step[Giải $y' = 0 <=> 1 - ln x = 0 <=> x = e$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = e$.]
    #step[Vậy điểm cực đại của hàm số là $x = e$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị cực đại của hàm số $y = x^3 - 3x^2 - 9x + 5$.],
  ([$-22$], True([$10$]), [$5$], [$-27$]),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $y' = 3x^2 - 6x - 9 = 0 <=> x = -1$ hoặc $x = 3$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = -1$, đạt cực đại tại $x = -1$.]
    #step[Giá trị cực đại của hàm số là $y(-1) = (-1)^3 - 3(-1)^2 - 9(-1) + 5 = 10$.]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị cực tiểu của hàm số $y = x + 4/x$ trên khoảng $(0; +oo)$.],
  ([$2$], True([$4$]), [$-4$], [$-2$]),
  accent: c-book,
  loigiai: [
    #step[Ta có đạo hàm $y' = 1 - 4/x^2 = (x^2 - 4)/x^2$.]
    #step[Giải $y' = 0 <=> x^2 - 4 = 0 <=> x = 2$ (do $x > 0$).]
    #step[Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = 2$.]
    #step[Do đó cực tiểu đạt tại $x = 2$ với giá trị cực tiểu là $y(2) = 2 + 4/2 = 4$.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc",lines: 2, ds(
  [Cho hàm số $y = x^3 - 3x + 1$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đạt cực đại tại điểm $x = -1$.]),
    True([Giá trị cực tiểu của hàm số là $-1$.]),
    True([Đồ thị hàm số đạt cực tiểu tại điểm có tọa độ $(1; -1)$.]),
    True([Khoảng cách giữa hai điểm cực trị của đồ thị hàm số là $2 sqrt(5)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = 3x^2 - 3 = 0 <=> x = +-1$.
    - Lập bảng biến thiên, hàm số đạt cực đại tại $x = -1$, cực tiểu tại $x = 1$. Do đó a) Đúng.
    - Giá trị cực tiểu $y(1) = 1^3 - 3(1) + 1 = -1$, b) Đúng, c) Đúng.
    - Hai điểm cực trị đồ thị là $A(-1; 3)$ và $B(1; -1)$. Khoảng cách $A B = sqrt((1 - (-1))^2 + (-1 - 3)^2) = sqrt(4 + 16) = sqrt(20) = 2 sqrt(5)$, d) Đúng.
  ],
))

#q-wrap(dir: "doc",lines: 2, ds(
  [Cho hàm số $y = x^4 - 2x^2 - 3$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số có đúng $3$ điểm cực trị.]),
    [Hàm số đạt cực tiểu tại điểm $x = 0$.],
    True([Giá trị cực tiểu của hàm số là $-4$.]),
    True([Giá trị cực đại của hàm số là $-3$.]),
  ),
  accent: c-book,
  loigiai: [
    - Ta có $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <=> x = 0, x = +-1$.
    - Đạo hàm đổi dấu qua cả $3$ nghiệm đơn này nên hàm số có $3$ điểm cực trị, a) Đúng.
    - Qua $x = 0$, đạo hàm đổi dấu từ dương sang âm nên đạt cực đại tại $x = 0$, b) Sai.
    - Cực tiểu đạt tại $x = +-1$ với giá trị cực tiểu $y(+-1) = -4$, c) Đúng.
    - Cực đại đạt tại $x = 0$ với giá trị cực đại $y(0) = -3$, d) Đúng.
  ],
))

#q-wrap(dir: "doc",lines: 2, ds(
  [Cho hàm số $f(x) = x^3 - 3x + 1$ và hàm số $g(x) = |f(x)|$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số $g(x)$ nghịch biến trên khoảng $(-oo; -2)$.]),
    True([Hàm số $g(x)$ có đúng $3$ điểm cực tiểu.]),
    True([Hàm số $g(x)$ có đúng $2$ điểm cực đại.]),
    True([Hàm số $g(x)$ đồng biến trên khoảng $(2; +oo)$.]),
  ),
  accent: c-book,
  loigiai: [
    - Hàm số $f(x) = x^3 - 3x + 1$ có $f'(x) = 3x^2 - 3 = 0 <=> x = +-1$. Cực đại $f(-1) = 3$, cực tiểu $f(1) = -1$.
    - Phương trình $f(x) = 0$ có 3 nghiệm đơn $x_1 < -1 < x_2 < 1 < x_3$. Khoảng giá trị các nghiệm xấp xỉ: $x_1 approx -1.88$, $x_2 approx 0.35$, $x_3 approx 1.53$.
    - Mệnh đề a) Đúng: Trên $(-oo; x_1)$, $f(x) < 0$ và $f(x)$ đồng biến, nên $g(x) = -f(x)$ nghịch biến. Vì $(-oo; -2) subset (-oo; x_1)$ nên hàm số $g(x)$ nghịch biến trên $(-oo; -2)$.
    - Mệnh đề b) Đúng: Các điểm cực tiểu của $g(x)$ đạt tại 3 nghiệm đơn của phương trình $f(x) = 0$, khi đó giá trị cực tiểu bằng $0$.
    - Mệnh đề c) Đúng: Các điểm cực đại của $g(x)$ đạt tại các điểm cực trị ban đầu của $f(x)$, đó là $x = -1$ (giá trị cực đại $3$) và $x = 1$ (giá trị cực đại $|-1| = 1$).
    - Mệnh đề d) Đúng: Trên $(x_3; +oo)$, $f(x) > 0$ và đồng biến nên $g(x) = f(x)$ đồng biến. Do $(2; +oo) subset (x_3; +oo)$ nên $g(x)$ đồng biến trên khoảng $(2; +oo)$.
  ],
))

#q-wrap(dir: "doc",lines: 2, ds(
  [Cho hàm số $y = sqrt(2x - x^2)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tập xác định của hàm số là $D = [0; 2]$.]),
    True([Đạo hàm của hàm số là $y' = (1 - x)/sqrt(2x - x^2)$.]),
    [Hàm số đã cho không có điểm cực trị nào.],
    True([Giá trị cực đại của hàm số là $1$.]),
  ),
  accent: c-book,
  loigiai: [
    - Điều kiện: $2x - x^2 >= 0 <=> x in [0; 2]$, a) Đúng.
    - Đạo hàm $y' = (2 - 2x)/(2sqrt(2x - x^2)) = (1 - x)/sqrt(2x - x^2)$, b) Đúng.
    - Nghiệm đạo hàm $x = 1$. Đạo hàm đổi dấu khi đi qua $x = 1$, c) Sai.
    - Đạt cực đại tại $x = 1$ với giá trị cực đại $y(1) = 1$, d) Đúng.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x - 1) (x - 2)^2 (x - 3)^3 (x - 4)^4$. Số điểm cực trị của hàm số là bao nhiêu?],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Nghiệm của đạo hàm gồm: $x = 1$ (bội 1), $x = 2$ (bội 2), $x = 3$ (bội 3), $x = 4$ (bội 4).]
    #step[Đạo hàm đổi dấu qua các nghiệm bội lẻ là $x = 1$ và $x = 3$.]
    #step[Vậy số điểm cực trị của hàm số là $2$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị cực tiểu của hàm số $y = x^3 - 3x^2 + 2$.],
  [$-2$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$.]
    #step[Qua $x = 2$, đạo hàm đổi dấu từ âm sang dương nên đạt cực tiểu tại $x = 2$.]
    #step[Giá trị cực tiểu tương ứng là $y(2) = 2^3 - 3(2^2) + 2 = -2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = f(x)$ có bảng xét dấu đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $f'$,
        x-vals: ($-oo$, $-2$, $1$, $3$, $+oo$),
        f-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
      )
    ]
    Tìm số điểm cực trị của hàm số $g(x) = f(|x|)$.
  ],
  [$5$],
  accent: c-book,
  loigiai: [
    #step[Từ bảng xét dấu đạo hàm, ta thấy hàm số $y = f(x)$ có 3 điểm cực trị là $x = -2$, $x = 1$ và $x = 3$.]
    #step[Số điểm cực trị của hàm số $g(x) = f(|x|)$ được tính theo công thức: $N = 2k + 1$, trong đó $k$ là số điểm cực trị dương của hàm số $f(x)$.]
    #step[Các điểm cực trị dương của $f(x)$ là $x = 1$ và $x = 3$ (vậy $k = 2$).]
    #step[Do đó, số điểm cực trị của hàm số $g(x) = f(|x|)$ là $2(2) + 1 = 5$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x^2 - 9)$. Hàm số có bao nhiêu điểm cực tiểu?],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Giải $f'(x) = 0 <=> x = 0$ hoặc $x = +-3$.]
    #step[Lập bảng xét dấu đạo hàm: $f'(x)$ âm trên $(-oo; -3)$ và $(0; 3)$, dương trên $(-3; 0)$ và $(3; +oo)$.]
    #step[Đạo hàm đổi dấu từ âm sang dương khi đi qua $x = -3$ và $x = 3$.]
    #step[Vậy hàm số có $2$ điểm cực tiểu.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị cực đại của hàm số $y = sqrt(10x - x^2)$.],
  [$5$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = [0; 10]$.]
    #step[Tính đạo hàm: $y' = (5 - x)/sqrt(10x - x^2) = 0 <=> x = 5$.]
    #step[Đạo hàm đổi dấu từ dương sang âm khi đi qua $x = 5$, hàm số đạt cực đại tại $x = 5$.]
    #step[Giá trị cực đại của hàm số là $y(5) = sqrt(10(5) - 5^2) = 5$.]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = (x^2 - 2x) (x^2 - 4)$. Tìm số điểm cực trị của hàm số.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Giải $f'(x) = 0 <=> x(x - 2)(x - 2)(x + 2) = 0 <=> x(x + 2)(x - 2)^2 = 0$.]
    #step[Các nghiệm gồm $x = 0$ (bội 1), $x = -2$ (bội 1), $x = 2$ (bội 2).]
    #step[Đạo hàm chỉ đổi dấu khi qua các nghiệm bội lẻ là $x = 0$ và $x = -2$.]
    #step[Vậy số điểm cực trị của hàm số là $2$.]
  ],
))
