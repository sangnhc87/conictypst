#import "_config.typ": *

#lesson([Bài 1. Khái niệm Đạo hàm và Ý nghĩa Hình học - Cơ học], theme-color: c-book)

#q-label([LÝ THUYẾT VÀ PHƯƠNG PHÁP], c-book)

#muc([1. Ý nghĩa cơ học của đạo hàm (Vận tốc tức thời)])
#block(breakable: false)[
  #phuongphap(title: [Mô hình 1: Vận tốc tức thời])[
    Nếu một vật chuyển động với phương trình quãng đường $s(t)$, thì vận tốc tức thời của vật tại thời điểm $t_0$ chính là đạo hàm của quãng đường tại thời điểm đó:
    $ v(t_0) = s'(t_0) $
    *Ví dụ thực tế:* Khi bạn nhìn vào tốc độ kế trên xe máy tại một khoảnh khắc nhất định, con số hiển thị chính là độ lớn của vận tốc tức thời $v(t_0)$.
  ]
]

#muc([2. Ý nghĩa hình học của đạo hàm (Tiếp tuyến đồ thị)])
#block(breakable: false)[
  #phuongphap(title: [Mô hình 2: Tiếp tuyến của đồ thị])[
    Cho hàm số $y = f(x)$ có đồ thị $(C)$. Đạo hàm của hàm số tại điểm $x_0$, ký hiệu là $f'(x_0)$, chính là *hệ số góc* của tiếp tuyến với $(C)$ tại điểm $M(x_0, y_0)$.
    
    Phương trình tiếp tuyến của đồ thị $(C)$ tại điểm $M(x_0, y_0)$ là:
    $ y = f'(x_0)(x - x_0) + y_0 $
  ]
]

#align(center)[
  *Minh họa tiếp tuyến của đồ thị hàm số* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Trục toạ độ
    line((-1, 0), (6, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.8, -0.4), [$x$])
    line((0, -1), (0, 5), mark: (end: ">"), stroke: 0.8pt)
    content((-0.4, 4.8), [$y$])
    content((-0.3, -0.3), [$O$])
    
    // Hàm số y = x^2 / 4 + 1
    let f(x) = x*x/4 + 1
    let p_curve = range(-4, 18).map(x => {
      let vx = x/4
      (vx, f(vx))
    })
    line(..p_curve, stroke: 1.2pt + blue)
    content((4, 4.5), text(fill: blue)[$y = f(x)$])
    
    // Tiếp tuyến tại x0 = 2 -> y0 = 2, f'(x) = x/2 -> f'(2) = 1
    let p_tangent = range(0, 16).map(x => {
      let vx = x/4
      (vx, vx)
    })
    line(..p_tangent, stroke: 1.2pt + red)
    content((5, 3.5), text(fill: red)[Tiếp tuyến $d$])
    
    // Điểm M
    circle((2, 2), radius: 0.08, fill: black)
    content((1.6, 2.3), [$M(x_0, y_0)$])
    line((2,0), (2,2), stroke: (dash: "dashed", paint: gray))
    content((2, -0.4), [$x_0$])
    line((0,2), (2,2), stroke: (dash: "dashed", paint: gray))
    content((-0.4, 2), [$y_0$])
  })
]

#muc([3. Các quy tắc tính đạo hàm cơ bản])
#block(breakable: false)[
  #phuongphap(title: [Bảng đạo hàm cơ bản và lượng giác])[
    - *Hàm đa thức, phân thức, căn thức:* \
      $(C)' = 0$; \ \
      $(x^n)' = n x^(n-1)$; \ \
      $(sqrt(x))' = 1 / (2 sqrt(x))$ (với $x > 0$); \ \
      $(1/x)' = -1 / x^2$ (với $x \neq 0$).
    - *Hàm lượng giác:* \
      $(sin x)' = cos x$; \ \
      $(cos x)' = -sin x$; \ \
      $(tan x)' = 1 / (cos^2 x)$; \ \
      $(cot x)' = -1 / (sin^2 x)$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Quy tắc tính đạo hàm])[
    Cho hai hàm số $u = u(x)$ và $v = v(x)$ có đạo hàm:
    - Tổng/Hiệu: $(u \pm v)' = u' \pm v'$
    - Tích: $(u \cdot v)' = u' \cdot v + u \cdot v'$
    - Thương: $(u / v)' = (u' \cdot v - u \cdot v') / v^2$ (với $v \neq 0$)
    - Hằng số: $(k u)' = k u'$
  ]
]

---

#q-label([BÀI TẬP THỰC CHIẾN], c-book)

#dang([Dạng 1: Tính đạo hàm bằng công thức cơ bản])

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = 2x^4 - 3x^2 + 5x - 1$. Giá trị của đạo hàm tại $x = -1$ là:],
  ([$5$], True([$3$]), [$-3$], [$-5$]),
  loigiai: [
    #step[*B1: Tính đạo hàm* \ $y' = (2x^4 - 3x^2 + 5x - 1)' = 8x^3 - 6x + 5$.]
    #step[*B2: Thay giá trị* \ $y'(-1) = 8(-1)^3 - 6(-1) + 5 = -8 + 6 + 5 = 3$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = (2x - 1) / (x + 1)$. Tính đạo hàm của hàm số.],
  ([$y' = 1 / (x + 1)^2$], [$y' = -3 / (x + 1)^2$], True([$y' = 3 / (x + 1)^2$]), [$y' = 2 / (x + 1)^2$]),
  loigiai: [
    #step[*B1: Áp dụng quy tắc thương* \ Đặt $u = 2x - 1, v = x + 1$. Ta có $u' = 2, v' = 1$. \ $y' = (u' v - u v') / v^2 = (2(x + 1) - (2x - 1)(1)) / (x + 1)^2 = (2x + 2 - 2x + 1) / (x + 1)^2 = 3 / (x + 1)^2$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = x^2 sin x$. Đạo hàm của hàm số là:],
  ([$2x cos x$], [$2x sin x + x^2 cos x$], True([$x(2sin x + x cos x)$]), [$x^2 cos x - 2x sin x$]),
  loigiai: [
    #step[*B1: Áp dụng quy tắc tích* \ $(u \cdot v)' = u' v + u v'$. Ở đây $u = x^2, v = sin x$.]
    #step[*B2: Tính toán* \ $y' = (x^2)' sin x + x^2 (sin x)' = 2x sin x + x^2 cos x = x(2sin x + x cos x)$.]
  ]
))

#dang([Dạng 2: Phương trình tiếp tuyến của đồ thị hàm số])

#q-wrap(dir: "doc", tn(
  [Cho hàm số $y = x^3 - 3x + 1$ có đồ thị $(C)$. Phương trình tiếp tuyến của $(C)$ tại điểm $M(2; 3)$ là:],
  (True([$y = 9x - 15$]), [$y = 9x - 21$], [$y = -9x + 21$], [$y = 9x + 15$]),
  loigiai: [
    #step[*B1: Tìm hệ số góc* \ Ta có $y' = 3x^2 - 3$. Hệ số góc của tiếp tuyến tại $M(2; 3)$ là $k = y'(2) = 3(2)^2 - 3 = 9$.]
    #step[*B2: Viết phương trình tiếp tuyến* \ Tiếp tuyến có dạng $y = k(x - x_0) + y_0$. \ Suy ra: $y = 9(x - 2) + 3 <=> y = 9x - 15$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Viết phương trình tiếp tuyến của đồ thị hàm số $y = x^2 - 4x + 5$, biết tiếp tuyến song song với đường thẳng $d: y = 2x - 1$.],
  ([$y = 2x - 3$], True([$y = 2x - 4$]), [$y = 2x + 1$], [$y = 2x - 5$]),
  loigiai: [
    #step[*B1: Điều kiện song song* \ Tiếp tuyến song song với đường thẳng $y = 2x - 1$ nên có hệ số góc $k = 2$.]
    #step[*B2: Tìm hoành độ tiếp điểm* \ Ta có $y' = 2x - 4$. Giải phương trình $y'(x_0) = 2 <=> 2x_0 - 4 = 2 <=> x_0 = 3$.]
    #step[*B3: Tìm tung độ tiếp điểm* \ Với $x_0 = 3$, thay vào hàm số ban đầu: $y_0 = 3^2 - 4(3) + 5 = 2$. Tiếp điểm là $A(3; 2)$.]
    #step[*B4: Viết phương trình* \ $y = 2(x - 3) + 2 <=> y = 2x - 4$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Gọi $d$ là tiếp tuyến của đồ thị hàm số $y = -1/x$ tại điểm có hoành độ $x_0 = 1$. Phương trình của $d$ là:],
  ([$y = x + 2$], True([$y = x - 2$]), [$y = -x$], [$y = x$]),
  loigiai: [
    #step[*B1: Tìm tung độ và hệ số góc* \ Tung độ tiếp điểm: $y_0 = -1/1 = -1$. \ Đạo hàm: $y' = 1/x^2$. Hệ số góc tại $x_0 = 1$ là $k = y'(1) = 1$.]
    #step[*B2: Viết phương trình* \ $y = 1(x - 1) - 1 <=> y = x - 2$.]
  ]
))

#dang([Dạng 3: Bài toán Vận tốc và Kinh tế học cận biên])

#q-wrap(dir: "doc", tn(
  [Một vật chuyển động theo quy luật $s(t) = -1/2 t^2 + 20t$, với $t$ (giây) là khoảng thời gian tính từ lúc vật bắt đầu chuyển động và $s$ (mét) là quãng đường vật đi được. Hỏi vận tốc tức thời của vật tại thời điểm $t = 8$ (giây) là bao nhiêu?],
  ([$4$ m/s], [$8$ m/s], True([$12$ m/s]), [$16$ m/s]),
  loigiai: [
    #step[*B1: Tính biểu thức vận tốc* \ Vận tốc tức thời $v(t)$ là đạo hàm của quãng đường $s(t)$: \ $v(t) = s'(t) = (-1/2 t^2 + 20t)' = -t + 20$.]
    #step[*B2: Thay thời điểm $t=8$* \ $v(8) = -8 + 20 = 12$ (m/s).]
  ]
))

#q-wrap(dir: "doc", tn(
  [Giả sử chi phí $C(x)$ (triệu đồng) để sản xuất $x$ sản phẩm được cho bởi $C(x) = 100 + 50x - 0.1x^2$. Chi phí cận biên (marginal cost) tại mức sản xuất $x = 100$ sản phẩm là bao nhiêu?],
  ([$20$ triệu đồng/sản phẩm], True([$30$ triệu đồng/sản phẩm]), [$40$ triệu đồng/sản phẩm], [$50$ triệu đồng/sản phẩm]),
  loigiai: [
    #step[*B1: Hiểu mô hình kinh tế* \ Chi phí cận biên là tốc độ thay đổi của chi phí tổng cộng theo số lượng sản phẩm, chính là đạo hàm $C'(x)$.]
    #step[*B2: Tính đạo hàm* \ $C'(x) = (100 + 50x - 0.1x^2)' = 50 - 0.2x$.]
    #step[*B3: Thay số* \ Tại $x = 100$, ta có $C'(100) = 50 - 0.2(100) = 50 - 20 = 30$ (triệu đồng/sản phẩm).]
  ]
))

#q-wrap(dir: "doc", tn(
  [Trong kinh tế học, lợi nhuận $P(x)$ thu được khi bán $x$ sản phẩm được tính bằng Doanh thu $R(x)$ trừ đi Chi phí $C(x)$. Giả sử $R(x) = 200x - x^2/10$ và $C(x) = 5000 + 20x$. Hàm lợi nhuận cận biên (Marginal Profit) tại mức bán $x = 500$ sản phẩm là bao nhiêu?],
  ([$40$], [$60$], True([$80$]), [$100$]),
  loigiai: [
    #step[*B1: Lập hàm lợi nhuận* \ $P(x) = R(x) - C(x) = (200x - x^2/10) - (5000 + 20x) = -x^2/10 + 180x - 5000$.]
    #step[*B2: Tính hàm lợi nhuận cận biên* \ Lợi nhuận cận biên là đạo hàm của hàm lợi nhuận: $P'(x) = -x/5 + 180$.]
    #step[*B3: Thay số tại $x = 500$* \ $P'(500) = -500/5 + 180 = -100 + 180 = 80$. \ *(Ý nghĩa: Khi đang sản xuất ở mức 500 sản phẩm, việc sản xuất thêm 1 sản phẩm nữa sẽ mang lại thêm khoảng 80 đơn vị lợi nhuận)*.]
  ]
))
