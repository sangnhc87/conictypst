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
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 01]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Tìm phương trình tiệm cận ngang của đồ thị hàm số $y = (2x - 3)/(x - 1)$.],
  (
    [$y = 1$],
    True([$y = 2$]),
    [$y = -3$],
    [$x = 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta tính giới hạn của hàm số khi $x -> +- oo$:]
    #step[$lim_(x -> +oo) (2x - 3)/(x - 1) = lim_(x -> +oo) (2 - 3/x)/(1 - 1/x) = 2$.]
    #step[$lim_(x -> -oo) (2x - 3)/(x - 1) = lim_(x -> -oo) (2 - 3/x)/(1 - 1/x) = 2$.]
    #step[Do đó, đường thẳng $y = 2$ là tiệm cận ngang của đồ thị hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm phương trình tiệm cận đứng của đồ thị hàm số $y = (x + 1)/(x - 2)$.],
  (
    [$y = 1$],
    [$x = -1$],
    True([$x = 2$]),
    [$y = 2$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm số xác định trên tập $D = RR without {2}$. Mẫu số bằng $0$ tại $x = 2$.]
    #step[Tính giới hạn khi $x$ tiến về $2$:]
    #step[$lim_(x -> 2^+) (x + 1)/(x - 2) = +oo$ (vì tử số tiến về $3 > 0$, mẫu số tiến về $0$ và $x - 2 > 0$ khi $x > 2$).]
    #step[Do đó, đường thẳng $x = 2$ là tiệm cận đứng của đồ thị hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số đường tiệm cận đứng của đồ thị hàm số $y = (3x^2 - x + 1)/(x^2 - 1)$.],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm số xác định trên tập $D = RR without {plus.minus 1}$.]
    #step[Tử số $P(x) = 3x^2 - x + 1$ có biệt thức $Delta = (-1)^2 - 4(3)(1) = -11 < 0$, nên tử số vô nghiệm (luôn dương với mọi $x$).]
    #step[Mẫu số $Q(x) = x^2 - 1 = 0 <=> x = +- 1$.]
    #step[Vì tử số khác $0$ tại $x = 1$ và $x = -1$ nên cả hai điểm này đều là tiệm cận đứng. Đường thẳng $x = 1$ và $x = -1$ là các tiệm cận đứng.]
    #step[Vậy đồ thị hàm số có $2$ đường tiệm cận đứng.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tiệm cận xiên của đồ thị hàm số $y = (x^2 + 2x - 1)/(x - 1)$.],
  (
    [$y = x + 1$],
    [$y = x + 2$],
    True([$y = x + 3$]),
    [$y = x - 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta thực hiện chia tử số cho mẫu số:
      $(x^2 + 2x - 1) : (x - 1) = x + 3$ dư $2$.]
    #step[Do đó, ta có thể viết hàm số dưới dạng:
      $y = x + 3 + 2/(x - 1)$.]
    #step[Vì $lim_(x -> +- oo) 2/(x - 1) = 0$ nên đường thẳng $y = x + 3$ là tiệm cận xiên của đồ thị hàm số.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = sqrt(x^2 + 1)/x$ có bao nhiêu đường tiệm cận ngang?],
  (
    [$0$],
    [$1$],
    True([$2$]),
    [$3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm số xác định trên $RR without {0}$.]
    #step[Tính giới hạn khi $x -> +oo$ (với $x > 0$ thì $sqrt(x^2) = x$):
      $lim_(x -> +oo) sqrt(x^2 + 1)/x = lim_(x -> +oo) (x sqrt(1 + 1/x^2))/x = lim_(x -> +oo) sqrt(1 + 1/x^2) = 1$.
      Nên $y = 1$ là tiệm cận ngang thứ nhất.]
    #step[Tính giới hạn khi $x -> -oo$ (với $x < 0$ thì $sqrt(x^2) = -x$):
      $lim_(x -> -oo) sqrt(x^2 + 1)/x = lim_(x -> -oo) (-x sqrt(1 + 1/x^2))/x = lim_(x -> -oo) -sqrt(1 + 1/x^2) = -1$.
      Nên $y = -1$ là tiệm cận ngang thứ hai.]
    #step[Vậy đồ thị hàm số có đúng $2$ đường tiệm cận ngang.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = f(x)$ liên tục trên $RR without {1}$ và có bảng biến thiên như sau:
    #align(center)[
      #my-bbbt(
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($-$, $||$, $+$),
        v-vals: ($2$, ($-oo$, $+oo$), $5$),
      )
    ]
    Tìm tất cả các tiệm cận đứng và tiệm cận ngang của đồ thị hàm số.
  ],
  (
    [$x = 1, y = 5$],
    [$x = 1, y = 2$],
    True([$x = 1, y = 2, y = 5$]),
    [$x = 1, y = 2, y = 3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Dựa vào bảng biến thiên:]
    #step[$lim_(x -> -oo) f(x) = 2$ nên đường thẳng $y = 2$ là tiệm cận ngang.]
    #step[$lim_(x -> +oo) f(x) = 5$ nên đường thẳng $y = 5$ là tiệm cận ngang.]
    #step[$lim_(x -> 1^-) f(x) = -oo$ và $lim_(x -> 1^+) f(x) = +oo$ nên đường thẳng $x = 1$ là tiệm cận đứng.]
    #step[Vậy đồ thị hàm số có các đường tiệm cận là $x = 1, y = 2, y = 5$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm số đường tiệm cận của đồ thị hàm số $y = (x - 1)/(x^2 - 1)$.],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm số xác định trên tập $D = RR without {plus.minus 1}$.]
    #step[Rút gọn biểu thức hàm số: với $x != 1$, ta có
      $y = (x - 1)/((x - 1)(x + 1)) = 1/(x + 1)$.]
    #step[Tính các giới hạn tại điểm gián đoạn:]
    #step[- Tại $x = -1$: $lim_(x -> -1^+) 1/(x + 1) = +oo$ nên $x = -1$ là tiệm cận đứng.]
    #step[- Tại $x = 1$: $lim_(x -> 1) 1/(x + 1) = 1/2$ (hữu hạn) nên $x = 1$ không phải tiệm cận đứng.]
    #step[Tính giới hạn tại vô cực: $lim_(x -> +- oo) 1/(x + 1) = 0$ nên $y = 0$ là tiệm cận ngang.]
    #step[Vậy đồ thị hàm số có tổng cộng $2$ đường tiệm cận ($x = -1$ và $y = 0$).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tiệm cận xiên của đồ thị hàm số $y = (2x^2 + x - 3)/(x + 1)$.],
  (
    [$y = 2x + 1$],
    [$y = 2x$],
    True([$y = 2x - 1$]),
    [$y = 2x - 2$],
  ),
  accent: c-book,
  loigiai: [
    #step[Thực hiện phép chia tử số cho mẫu số:
      $(2x^2 + x - 3) : (x + 1) = 2x - 1$ dư $-2$.]
    #step[Ta viết lại: $y = 2x - 1 - 2/(x + 1)$.]
    #step[Do $lim_(x -> +- oo) -2/(x + 1) = 0$ nên tiệm cận xiên của đồ thị là đường thẳng $y = 2x - 1$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho đồ thị hàm số $y = f(x)$ có dạng đường cong như hình vẽ dưới đây:
    #align(center)[
      #cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        line((-3, 0), (5, 0), mark: (end: "stealth", scale: 0.4))
        line((0, -2), (0, 6), mark: (end: "stealth", scale: 0.4))
        content((4.8, -0.3), $x$)
        content((0.3, 5.8), $y$)
        content((-0.25, -0.25), $O$)
        
        // Asymptotes
        line((1, -2), (1, 5.8), stroke: (paint: gray, dash: "dashed"))
        line((-3, 2), (4.8, 2), stroke: (paint: gray, dash: "dashed"))
        content((1.3, 5.3), $x=1$, fill: gray)
        content((4.2, 2.3), $y=2$, fill: gray)
        
        // Curves
        let pts1 = sample(x => (2*x - 1)/(x - 1), -2.5, 0.7)
        hobby(..pts1, stroke: blue + 1.2pt, fill: none)
        
        let pts2 = sample(x => (2*x - 1)/(x - 1), 1.3, 4.5)
        hobby(..pts2, stroke: blue + 1.2pt, fill: none)
      })
    ]
    Hãy xác định tiệm cận đứng và tiệm cận ngang từ đồ thị trên.
  ],
  (
    [$x = 2, y = 1$],
    [$x = -1, y = 2$],
    True([$x = 1, y = 2$]),
    [$x = 1, y = 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Quan sát đồ thị hàm số, ta thấy:]
    #step[Khi đường cong tiến sát về phía đường thẳng đứng có hoành độ bằng $1$, tung độ tiến ra vô cực. Do đó tiệm cận đứng là $x = 1$.]
    #step[Khi hoành độ $x$ tiến ra xa vô cực ($+oo$ và $-oo$), đường cong tiến sát về đường nằm ngang có tung độ bằng $2$. Do đó tiệm cận ngang là $y = 2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tất cả các tiệm cận ngang và tiệm cận xiên của đồ thị hàm số $y = x + sqrt(x^2 - 1)$.],
  (
    [$y = 0$],
    [$y = 2x$],
    True([$y = 0$ và $y = 2x$]),
    [$y = 0$ và $y = -2x$],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm số xác định khi $x^2 - 1 >= 0 <=> x in (-oo; -1] union [1; +oo)$.]
    #step[Tính giới hạn khi $x -> -oo$:]
    #step[$lim_(x -> -oo) (x + sqrt(x^2 - 1)) = lim_(x -> -oo) (x^2 - (x^2 - 1))/(x - sqrt(x^2 - 1)) = lim_(x -> -oo) 1/(x + x sqrt(1 - 1/x^2)) = 0$.
      Vậy $y = 0$ là tiệm cận ngang (khi $x -> -oo$).]
    #step[Tính giới hạn khi $x -> +oo$:]
    #step[$lim_(x -> +oo) (x + sqrt(x^2 - 1)) = +oo$ (không có tiệm cận ngang khi $x -> +oo$).]
    #step[Tìm tiệm cận xiên khi $x -> +oo$:]
    #step[$a = lim_(x -> +oo) y/x = lim_(x -> +oo) (1 + sqrt(1 - 1/x^2)) = 2$.]
    #step[$b = lim_(x -> +oo) (y - 2x) = lim_(x -> +oo) (sqrt(x^2 - 1) - x) = lim_(x -> +oo) (-1)/(sqrt(x^2 - 1) + x) = 0$.]
    #step[Vậy đường thẳng $y = 2x$ là tiệm cận xiên (khi $x -> +oo$).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công ty sản xuất đồ gia dụng có hàm chi phí trung bình để sản xuất $x$ sản phẩm là $C(x) = (5x + 100)/x$ (triệu đồng/sản phẩm), với $x >= 1$. Khi số lượng sản phẩm $x$ tiến ra rất lớn, chi phí trung bình tiệm cận về giá trị nào?],
  (
    [$100$ triệu đồng],
    [$10$ triệu đồng],
    True([$5$ triệu đồng]),
    [$0$ triệu đồng],
  ),
  accent: c-book,
  loigiai: [
    #step[Chi phí trung bình tiệm cận khi sản xuất số lượng lớn tương ứng với giới hạn của $C(x)$ khi $x -> +oo$:]
    #step[$lim_(x -> +oo) C(x) = lim_(x -> +oo) (5x + 100)/x = 5$.]
    #step[Đường thẳng $y = 5$ chính là tiệm cận ngang của đồ thị hàm số $C(x)$.]
    #step[Vậy chi phí trung bình của sản phẩm sẽ tiến dần về $5$ triệu đồng.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = (x + 1)/(x^2 - 2x + m)$ có đúng một đường tiệm cận đứng.],
  (
    [$m = 1$],
    [$m = -3$],
    True([$m = 1$ hoặc $m = -3$]),
    [$m > 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Mẫu số là $Q(x) = x^2 - 2x + m$.]
    #step[Trường hợp 1: Phương trình $Q(x) = 0$ có nghiệm kép khác $-1$:]
    #step[$Delta' = 1 - m = 0 <=> m = 1$. Khi đó nghiệm kép là $x = 1 != -1$ (thỏa mãn).]
    #step[Trường hợp 2: Phương trình $Q(x) = 0$ có 2 nghiệm phân biệt, trong đó có một nghiệm là $-1$:]
    #step[Thay $x = -1$ vào mẫu số: $(-1)^2 - 2(-1) + m = 0 <=> 3 + m = 0 <=> m = -3$.]
    #step[Với $m = -3$, ta có $y = (x + 1)/(x^2 - 2x - 3) = (x + 1)/((x + 1)(x - 3)) = 1/(x - 3)$ (có duy nhất một tiệm cận đứng là $x = 3$).]
    #step[Vậy $m = 1$ hoặc $m = -3$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (x^2 - 3x + 2)/(x - 1)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Tập xác định của hàm số là $D = RR without {1}$.]),
    [Đường thẳng $x = 1$ là tiệm cận đứng của đồ thị hàm số.],
    True([Đồ thị hàm số không có đường tiệm cận ngang.]),
    [Đồ thị hàm số có một đường tiệm cận xiên là $y = x - 2$.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Mẫu số $x - 1 != 0 <=> x != 1$.
    - b) Sai. Rút gọn hàm số với $x != 1$: $y = ((x-1)(x-2))/(x-1) = x - 2$. Giới hạn $lim_(x -> 1) y = -1$ (hữu hạn), nên $x = 1$ không phải tiệm cận đứng.
    - c) Đúng. Vì giới hạn khi $x -> +- oo$ đều ra vô cực nên không có tiệm cận ngang.
    - d) Sai. Đồ thị là một đường thẳng bị thủng tại điểm $(1; -1)$, không có tiệm cận xiên.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (2x + 3)/(x - 1)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Đồ thị hàm số có tiệm cận ngang là đường thẳng $y = 2$.]),
    True([Đồ thị hàm số có tiệm cận đứng là đường thẳng $x = 1$.]),
    True([Giao điểm của hai đường tiệm cận có tọa độ là $I(1; 2)$.]),
    True([Điểm $I(1; 2)$ chính là tâm đối xứng của đồ thị hàm số.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Vì $lim_(x -> +- oo) (2x + 3)/(x - 1) = 2$.
    - b) Đúng. Vì $lim_(x -> 1^+) (2x + 3)/(x - 1) = +oo$.
    - c) Đúng. Tiệm cận đứng $x = 1$ và tiệm cận ngang $y = 2$ giao nhau tại $I(1; 2)$.

    - d) Đúng. Đồ thị hàm phân thức bậc nhất trên bậc nhất nhận giao điểm hai đường tiệm cận làm tâm đối xứng.
  
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x)$ xác định trên $RR without {0}$ và có bảng biến thiên như sau:
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
    True([Đường thẳng $x = 0$ là tiệm cận đứng của đồ thị hàm số.]),
    [Hàm số đạt cực tiểu tại điểm $x = -1$.],
    True([Giá trị cực tiểu của hàm số là $-1$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Giới hạn tại $-oo$ là $3$ (TCN $y = 3$). Tại $+oo$ là $+oo$ (không có TCN).
    - b) Đúng. Giới hạn một bên tại $0$ là vô cực.
    - c) Sai. Hàm số đạt cực tiểu tại điểm $x = 2$, giá trị cực tiểu là $-1$.
    - d) Đúng. Giá trị cực tiểu $y_"ct" = -1$ tại $x = 2$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = sqrt(4x^2 + x + 1)/(x - 2)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    [Đồ thị hàm số chỉ có một tiệm cận ngang là đường thẳng $y = 2$.],
    True([Đồ thị hàm số có tiệm cận đứng là đường thẳng $x = 2$.]),
    True([Đồ thị hàm số có tất cả 3 đường tiệm cận.]),
    True([Đồ thị hàm số không có tiệm cận xiên.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Sai. Vì giới hạn khi $x -> +oo$ là $2$ (TCN $y = 2$), khi $x -> -oo$ là $-2$ (TCN $y = -2$). Đồ thị có 2 tiệm cận ngang.
    - b) Đúng. Vì mẫu bằng $0$ tại $x=2$ và tử khác $0$ ($sqrt(19) != 0$).
    - c) Đúng. Có 2 tiệm cận ngang và 1 tiệm cận đứng, tổng cộng là 3 tiệm cận.
    - d) Đúng. Hàm số đã có tiệm cận ngang ở hai đầu cực trị nên không có tiệm cận xiên.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Tìm tổng số đường tiệm cận đứng và tiệm cận ngang của đồ thị hàm số $y = (x^2 - 4)/(x^2 - 3x + 2)$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Tập xác định: $D = RR without {1; 2}$.]
    #step[Rút gọn hàm số với $x != 2$: $y = ((x - 2)(x + 2))/((x - 2)(x - 1)) = (x + 2)/(x - 1)$.]
    #step[Xét tiệm cận đứng:]
    #step[- Tại $x = 1$: $lim_(x -> 1^+) (x + 2)/(x - 1) = +oo$ nên $x = 1$ là tiệm cận đứng.]
    #step[- Tại $x = 2$: $lim_(x -> 2) (x + 2)/(x - 1) = 4$ (hữu hạn) nên $x = 2$ không phải tiệm cận đứng.]
    #step[Xét tiệm cận ngang: $lim_(x -> +- oo) (x^2 - 4)/(x^2 - 3x + 2) = 1$ nên $y = 1$ là tiệm cận ngang.]
    #step[Tổng số tiệm cận đứng và ngang là $2$ (gồm $x = 1$ và $y = 1$).]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm tung độ giao điểm của đường tiệm cận xiên của đồ thị hàm số $y = (2x^2 + x)/(x - 1)$ với trục tung $O y$.],
  [$3$],
  accent: c-book,
  loigiai: [
    #step[Thực hiện phép chia tử số cho mẫu số:
      $(2x^2 + x) : (x - 1) = 2x + 3$ dư $3$.]
    #step[Hàm số viết dưới dạng: $y = 2x + 3 + 3/(x - 1)$.]
    #step[Suy ra tiệm cận xiên là đường thẳng $d: y = 2x + 3$.]
    #step[Giao điểm của $d$ với trục tung $O y$ (cho $x = 0$): $y = 2(0) + 3 = 3$. Tung độ giao điểm là $3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm giá trị của tham số $m$ để đường tiệm cận đứng của đồ thị hàm số $y = (x - 3)/(x - m)$ đi qua điểm $A(2; 5)$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đường tiệm cận đứng của đồ thị hàm số $y = (x - 3)/(x - m)$ (với $m != 3$) là đường thẳng $d: x = m$.]
    #step[Để đường tiệm cận đứng đi qua điểm $A(2; 5)$, ta thay tọa độ điểm $A$ vào phương trình tiệm cận đứng:]
    #step[$2 = m => m = 2$ (thỏa mãn điều kiện $m != 3$).]
    #step[Vậy giá trị $m$ cần tìm là $2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm số đường tiệm cận đứng của đồ thị hàm số $y = (x - 1)/sqrt(x^2 - 3x + 2)$.],
  [$1$],
  accent: c-book,
  loigiai: [
    #step[Điều kiện xác định của hàm số: $x^2 - 3x + 2 > 0 <=> x < 1$ hoặc $x > 2$.]
    #step[Điểm gián đoạn cần xét giới hạn là $x = 1$ và $x = 2$.]
    #step[- Tại $x = 2$: $lim_(x -> 2^+) (x - 1)/sqrt((x - 1)(x - 2)) = lim_(x -> 2^+) sqrt(x - 1)/sqrt(x - 2) = +oo$ nên $x = 2$ là tiệm cận đứng.]
    #step[- Tại $x = 1$: Ta xét giới hạn bên trái $x -> 1^-$ (do miền xác định chứa $x < 1$):
      $lim_(x -> 1^-) (x - 1)/sqrt((x - 1)(x - 2)) = lim_(x -> 1^-) (-(1 - x))/sqrt((1 - x)(2 - x)) = lim_(x -> 1^-) -sqrt(1 - x)/sqrt(2 - x) = 0$.]
    #step[Vì giới hạn tại $x = 1^-$ là hữu hạn nên $x = 1$ không phải tiệm cận đứng.]
    #step[Vậy đồ thị chỉ có duy nhất $1$ đường tiệm cận đứng là $x = 2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm tổng $a + b$ các hệ số của đường tiệm cận xiên $y = a x + b$ của đồ thị hàm số $y = (3x^2 - x + 2)/(x + 2)$.],
  [$-4$],
  accent: c-book,
  loigiai: [
    #step[Thực hiện phép chia đa thức:
      $3x^2 - x + 2 = (3x - 7)(x + 2) + 16$.]
    #step[Hàm số viết lại thành: $y = 3x - 7 + 16/(x + 2)$.]
    #step[Do đó, đường tiệm cận xiên là $y = 3x - 7$, tức là $a = 3$ và $b = -7$.]
    #step[Tổng cần tìm là: $a + b = 3 + (-7) = -4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Nồng độ một loại hóa chất trong một bể chứa sau $t$ phút pha trộn được mô hình hóa bởi hàm số $C(t) = (20t + 5)/(t + 2)$ (gam/lít) với $t >= 0$. Nồng độ hóa chất trong bể sẽ tiến sát đến bao nhiêu gam/lít khi thời gian pha trộn kéo dài vô hạn?],
  [$20$],
  accent: c-book,
  loigiai: [
    #step[Thời gian pha trộn kéo dài vô hạn tương ứng với $t -> +oo$.]
    #step[Ta tính giới hạn:
      $lim_(t -> +oo) C(t) = lim_(t -> +oo) (20t + 5)/(t + 2) = 20$.]
    #step[Do đó, nồng độ hóa chất trong bể sẽ tiến sát đến giới hạn $20$ gam/lít.]
  ],
))
