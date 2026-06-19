#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 02 - TOÁN KINH TẾ, TĂNG TRƯỞNG & TIỆM CẬN]
]

// Hình 1: Đồ thị Parabola tối ưu hóa Doanh thu
#let fig-doanhthu-de2 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Trục tọa độ
  line((0, 0), (0, 3.6), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (6.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((6.2, -0.3), [$p$ (USD)])
  content((-0.4, 3.4), [$R$ (nghìn)])
  content((-0.2, -0.2), $O$)

  // Vẽ đồ thị doanh thu (Parabola úp)
  let f(x) = { -0.24 * calc.pow(x - 3.5, 2) + 3 }
  let pts = ()
  for i in range(40) {
    let x = 0.5 + i * 5.5 / 40
    pts.push((x, f(x)))
  }
  line(..pts, stroke: rgb("#22c55e") + 1.3pt)

  // Điểm cực đại
  line((3.5, 0), (3.5, 3.0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line((0, 3.0), (3.5, 3.0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  circle((3.5, 3.0), radius: 0.05, fill: rgb("#16a34a"))
  content((3.5, -0.3), $35$)
  content((-0.4, 3.0), $61.25$)
})

// Hình 2: Đồ thị hàm số Logistic biểu diễn sức chứa khách hàng
#let fig-logistic-de2 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Trục tọa độ
  line((0, 0), (0, 3.6), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (6.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((6.2, -0.3), [$t$ (tháng)])
  content((-0.5, 3.4), [$N(t)$])
  content((-0.2, -0.2), $O$)

  // Tiệm cận ngang (Giới hạn sức chứa K = 10000)
  line((0, 3.0), (6.0, 3.0), stroke: (paint: rgb("#ef4444"), dash: "dashed", thickness: 0.8pt))
  content((4.8, 3.25), [Tiệm cận $y = 10000$], fill: rgb("#ef4444"))

  // Vẽ đường cong Logistic S-curve
  let pts = ()
  for i in range(50) {
    let t = i * 6.0 / 50
    let y = 3.0 / (1 + 9 * calc.exp(-0.8 * t))
    pts.push((t, y))
  }
  line(..pts, stroke: rgb("#3b82f6") + 1.4pt)
  circle((0, 0.3), radius: 0.04, fill: rgb("#1d4ed8"))
  content((-0.4, 0.3), $500$)
})

// Hình 3: Đồ thị nồng độ thuốc đào thải theo thời gian
#let fig-thuoc-de2 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  // Trục tọa độ
  line((0, 0), (0, 3.6), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (6.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((6.2, -0.3), [$t$ (giờ)])
  content((-0.6, 3.4), [$C(t)$ (mg/L)])
  content((-0.2, -0.2), $O$)

  // Vẽ đường cong nồng độ
  let pts = ()
  for i in range(50) {
    let t = i * 6.0 / 50
    let y = 5 * t / (calc.pow(t, 2) + 4)
    pts.push((t, y))
  }
  line(..pts, stroke: rgb("#ec4899") + 1.3pt)

  // Điểm cực đại tại t = 2, C(2) = 1.25 (tỉ lệ hóa 2.5)
  line((2.0, 0), (2.0, 1.25), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  line((0, 1.25), (2.0, 1.25), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  circle((2.0, 1.25), radius: 0.05, fill: rgb("#db2777"))
  content((2.0, -0.3), $2$)
  content((-0.4, 1.25), $1.25$)
})

#let fig-chi-phi-tb = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (6, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (0, 5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((5.8, -0.4), [$x$])
  content((-0.6, 4.8), [$A(x)$])
  content((-0.3, -0.3), $O$)

  // A(x) = 2x + 10000/x. Scale x by 0.05, A by 0.01
  let pts = ()
  for i in range(41) {
    let x = 20 + i * 80.0 / 40
    let A = 2 * x + 10000 / x
    pts.push((x * 0.05, A * 0.01))
  }
  line(..pts, stroke: rgb("#b91c1c") + 1.3pt)

  // Min point at x = 70.7 (canvas 3.53), A = 282.8 (canvas 2.83)
  circle((3.53, 2.83), radius: 0.05, fill: rgb("#991b1b"))
  line((3.53, 0), (3.53, 2.83), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
  line((0, 2.83), (3.53, 2.83), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
  content((3.53, -0.4), [$71$])
  content((-0.5, 2.83), [$283$])
})

#let fig-khau-hao = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (6, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  line((0, 0), (0, 5), mark: (end: "stealth", scale: 0.5), stroke: 0.6pt)
  content((5.8, -0.4), [$t$])
  content((-0.6, 4.8), [$V$])
  content((-0.3, -0.3), $O$)

  // V(t) = 150 * exp(-0.1*t). Scale t by 0.25, V by 0.025
  let pts = ()
  for i in range(41) {
    let t = i * 20.0 / 40
    let V = 150 * calc.exp(-0.1 * t)
    pts.push((t * 0.25, V * 0.025))
  }
  line(..pts, stroke: rgb("#7c3aed") + 1.3pt)

  // Point at t=5 (canvas 1.25), V=91 (canvas 2.27)
  circle((1.25, 2.27), radius: 0.05, fill: rgb("#6d28d9"))
  line((1.25, 0), (1.25, 2.27), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
  line((0, 2.27), (1.25, 2.27), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
  content((1.25, -0.4), $5$)
  content((-0.4, 2.27), [$91$])
})

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Tổng chi phí sản xuất $x$ sản phẩm của một công ty trong một ngày được cho bởi hàm số $C(x) = 0.05x^2 + 20x + 500$ (nghìn đồng). Để chi phí trung bình $overline(C)(x) = C(x)/x$ là thấp nhất, công ty cần sản xuất bao nhiêu sản phẩm mỗi ngày?],
  (
    [$50$ sản phẩm],
    True([$100$ sản phẩm]),
    [$150$ sản phẩm],
    [$200$ sản phẩm],
  ),

  loigiai: [
    #step[Chi phí trung bình trên mỗi sản phẩm: $overline(C)(x) = frac(C(x), x) = 0.05x + 20 + frac(500, x)$ (với $x > 0$).]
    #step[Tính đạo hàm: $overline(C)'(x) = 0.05 - frac(500, x^2)$.]
    #step[Cho $overline(C)'(x) = 0 <=> frac(500, x^2) = 0.05 <=> x^2 = frac(500, 0.05) = 10000 <=> x = 100$ (sản phẩm).]
    #step[Bảng biến thiên chỉ ra rằng $overline(C)(x)$ đạt giá trị nhỏ nhất tại $x = 100$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một doanh nghiệp bán được $1000$ sản phẩm mỗi tháng với giá $50$ USD/sản phẩm. Khảo sát thị trường cho thấy nếu giảm giá bán đi $1$ USD thì số lượng sản phẩm bán ra tăng thêm $50$ chiếc. Giá bán mỗi sản phẩm để doanh thu đạt tối đa là:
    #align(center)[#fig-doanhthu-de2]],
  (
    [$30$ USD],
    True([$35$ USD]),
    [$40$ USD],
    [$45$ USD],
  ),

  loigiai: [
    #step[Gọi $x$ là số lần giảm giá $1$ USD ($0 < x < 50$).]
    #step[Giá bán mới: $p = 50 - x$ (USD).]
    #step[Số lượng bán được: $q = 1000 + 50x$.]
    #step[Hàm doanh thu: $R(x) = p * q = (50 - x)(1000 + 50x) = 50000 + 2500x - 1000x - 50x^2 = -50x^2 + 1500x + 50000$.]
    #step[Doanh thu đạt tối đa khi $R'(x) = -100x + 1500 = 0 <=> x = 15$.]
    #step[Giá bán tối ưu: $p = 50 - 15 = 35$ (USD).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Chi phí trung bình để sản xuất một lô hàng $x$ đơn vị là $A(x) = 2x + frac(10000, x)$. Số lượng đơn vị cần sản xuất để chi phí trung bình nhỏ nhất là:
    #align(center)[#fig-chi-phi-tb]],
  (
    [$50$],
    True([$70.7$]),
    [$100$],
    [$141$],
  ),

  loigiai: [
    #step[Đạo hàm: $A'(x) = 2 - frac(10000, x^2) = 0 <=> 2x^2 = 10000 <=> x^2 = 5000$.]
    #step[$x = sqrt(5000) = 50sqrt(2) approx 70.71$. Làm tròn thành $71$ đơn vị.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một loại vi khuẩn được nuôi cấy trong điều kiện thí nghiệm có số lượng ban đầu là $100$ con. Sau thời gian $t$ giờ kể từ lúc bắt đầu nuôi cấy, số lượng vi khuẩn được xác định bởi công thức $N(t) = 100 e^(0,5 t)$. Hỏi sau bao lâu thì tốc độ sinh trưởng (đạo hàm của hàm số biểu diễn số lượng vi khuẩn) đạt $200$ con/giờ?],
  (
    [$approx 1,39$ giờ],
    True([$approx 2,77$ giờ]),
    [$approx 4,16$ giờ],
    [$approx 5,55$ giờ],
  ),

  loigiai: [
    #step[Tốc độ sinh trưởng là đạo hàm của hàm số lượng vi khuẩn: $N'(t) = 100 * 0,5 e^(0,5 t) = 50 e^(0,5 t)$.]
    #step[Yêu cầu $N'(t) = 200 <=> 50 e^(0,5 t) = 200 <=> e^(0,5 t) = 4$.]
    #step[Giải ra: $0,5 t = ln 4 = 2 ln 2 => t = 4 ln 2 approx 2,77$ (giờ).]
    #step[Vậy sau khoảng $2,77$ giờ thì tốc độ sinh trưởng của vi khuẩn đạt $200$ con/giờ.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Số lượng khách hàng $N(t)$ của một doanh nghiệp mới thành lập thay đổi theo thời gian $t$ (tháng) kể từ khi bắt đầu hoạt động tuân theo công thức $N(t) = frac(10000, 1 + 19 e^(-0,5 t))$ (như hình vẽ minh họa). Sau một thời gian hoạt động rất dài, số lượng khách hàng của doanh nghiệp đó sẽ ổn định ở mức nào dưới đây?
    #align(center)[#fig-logistic-de2]],
  (
    [$100$],
    [$1.000$],
    True([$10.000$]),
    [$500$],
  ),

  loigiai: [
    #step[Quá trình "sau một thời gian hoạt động rất dài" tương đương với việc lấy giới hạn khi $t -> +oo$.]
    #step[Ta có: $lim_(t -> +oo) e^(-0,5 t) = 0$.]
    #step[Do đó: $lim_(t -> +oo) N(t) = frac(10000, 1 + 19 * 0) = 10000$.]
    #step[Mức $10.000$ còn được gọi là giới hạn sức chứa của mô hình hàm logistic.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nồng độ của một loại thuốc trong máu của bệnh nhân sau khi tiêm $t$ giờ được xác định bởi hàm số $C(t) = frac(5t, t^2 + 4)$ (mg/L) (như hình vẽ minh họa). Hỏi nồng độ thuốc đạt giá trị lớn nhất vào thời điểm nào dưới đây sau khi tiêm?
    #align(center)[#fig-thuoc-de2]],
  (
    [$1$ giờ],
    True([$2$ giờ]),
    [$3$ giờ],
    [$4$ giờ],
  ),

  loigiai: [
    #step[Đạo hàm: $C'(t) = frac(5(t^2 + 4) - 5t(2t), (t^2 + 4)^2) = frac(20 - 5t^2, (t^2 + 4)^2)$.]
    #step[Cho $C'(t) = 0 <=> 20 - 5t^2 = 0 <=> t^2 = 4 => t = 2$ (vì $t > 0$).]
    #step[Bảng biến thiên cho thấy $C(t)$ đạt cực đại tại $t = 2$. Vậy nồng độ đạt đỉnh sau $2$ giờ.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một xí nghiệp may mặc có chi phí trung bình (đơn vị: đồng) khi sản xuất $x$ chiếc áo được tính bởi công thức $A(x) = frac(50000 + 200x, x)$ (với $x >= 1$). Phát biểu nào dưới đây mô tả chính xác ý nghĩa của giới hạn $lim_(x -> +oo) A(x) = 200$?],
  (
    [Sản xuất càng nhiều áo thì chi phí sản xuất mỗi chiếc áo càng tăng.],
    [Xí nghiệp không thể sản xuất vượt quá $200$ chiếc áo.],
    True([Nếu số lượng áo sản xuất ra rất lớn thì chi phí trung bình trên mỗi chiếc áo sẽ xấp xỉ $200$ đồng.]),
    [Tổng chi phí sản xuất áo của xí nghiệp luôn bằng $200$ đồng.],
  ),

  loigiai: [
    #step[Ta có $A(x) = frac(50000, x) + 200$. Khi $x -> +oo$, phần chi phí cố định $50000/x -> 0$.]
    #step[Chi phí trung bình trên một đơn vị sản phẩm sẽ tiến dần tới tiệm cận ngang $y = 200$. Tức là khi sản xuất với số lượng rất lớn, chi phí trung bình để sản xuất mỗi chiếc áo xấp xỉ $200$ đồng.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Giá trị của một chiếc máy phát điện sau $t$ năm sử dụng được ước tính bởi hàm số $V(t) = 150 e^(-0,1 t)$ (đơn vị: triệu đồng). Tốc độ giảm giá trị (khấu hao) của máy phát điện tại thời điểm năm thứ $5$ là bao nhiêu?
    #align(center)[#fig-khau-hao]],
  (
    [$approx 15,0$ triệu/năm],
    True([$approx 9,1$ triệu/năm]),
    [$approx 91$ triệu/năm],
    [$approx 1,5$ triệu/năm],
  ),

  loigiai: [
    #step[Tốc độ thay đổi giá trị là $V'(t) = 150 * (-0,1) * e^(-0,1 t) = -15 e^(-0,1 t)$.]
    #step[Tốc độ khấu hao chính là độ lớn của tốc độ thay đổi giá trị: $|V'(t)| = 15 e^(-0,1 t)$.]
    #step[Tại $t = 5$: $|V'(5)| = 15 e^(-0,5) approx 9,1$ (triệu đồng/năm).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Lượng khí thải khí nhà kính $E(t)$ của một thành phố công nghiệp được dự báo theo thời gian $t$ (năm) tính từ năm $2020$ tuân theo công thức $E(t) = t^3 - 12 t^2 + 45 t + 100$ (đơn vị: triệu tấn). Hỏi tốc độ tăng lượng khí thải bắt đầu giảm (tương ứng với điểm uốn của đồ thị hàm số) xảy ra vào năm nào dưới đây?],
  (
    [$2022$],
    [$2023$],
    True([$2024$]),
    [$2025$],
  ),

  loigiai: [
    #step[Tốc độ thay đổi lượng khí thải là: $E'(t) = 3t^2 - 24t + 45$.]
    #step[Gia tốc thay đổi (đạo hàm bậc hai): $E''(t) = 6t - 24$. Xét $E''(t) = 0 <=> t = 4$.]
    #step[Với $t = 4$ tương ứng với $4$ năm sau $2020$, tức là năm $2024$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Dân số (đơn vị: nghìn người) của một hòn đảo sau $t$ năm định cư được ước tính theo công thức $P(t) = frac(10t + 50, t + 2)$ (với $t >= 0$). Phát biểu nào dưới đây là đúng?],
  (
    [Dân số hòn đảo tăng liên tục nhưng không vượt quá $10$ nghìn người.],
    True([Dân số hòn đảo giảm liên tục theo thời gian.]),
    [Sau $3$ năm định cư, dân số của hòn đảo là $20$ nghìn người.],
    [Quy mô dân số ban đầu của hòn đảo là $10$ nghìn người.],
  ),

  loigiai: [
    #step[Tính đạo hàm: $P'(t) = frac(10(t+2) - (10t+50) dot.c 1, (t+2)^2) = frac(-30, (t+2)^2) < 0$ với mọi $t >= 0$.]
    #step[Vì $P'(t) < 0$ nên dân số hòn đảo giảm liên tục theo thời gian kể từ thời điểm ban đầu ($P(0) = 25$ nghìn người).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Theo mô hình dân số ở câu trên, dân số của hòn đảo sẽ dần ổn định và tiệm cận về mức nào dưới đây khi thời gian định cư trôi đi rất lâu?],
  (
    [$0$],
    [$5$ nghìn người],
    True([$10$ nghìn người]),
    [Vô hạn],
  ),

  loigiai: [
    #step[Tính giới hạn khi $t -> +oo$: $lim_(t -> +oo) frac(10t + 50, t + 2) = 10$.]
    #step[Đồ thị có tiệm cận ngang là đường thẳng $y = 10$. Do đó dân số ổn định tiệm cận về mức $10$ nghìn người.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Khối lượng mỡ giảm được của một người sau $t$ tuần thực hiện chế độ tập luyện được xác định bởi công thức $L(t) = frac(8t, t + 4)$ (kg). Hỏi tốc độ giảm mỡ của người đó ở tuần thứ $4$ là bao nhiêu kg/tuần?],
  (
    [$0,25$],
    True([$0,5$]),
    [$1,0$],
    [$2,0$],
  ),

  loigiai: [
    #step[Tốc độ giảm mỡ chính là đạo hàm của hàm số $L(t)$ theo thời gian $t$.]
    #step[$L'(t) = frac(8(t + 4) - 8t dot.c 1, (t + 4)^2) = frac(32, (t + 4)^2)$.]
    #step[Tại $t = 4$ tuần: $L'(4) = frac(32, (4 + 4)^2) = 0,5$ (kg/tuần).]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Nồng độ của một chất hóa học trong hồ nước sau khi xảy ra sự cố tràn hóa chất được xác định bởi công thức $C(t) = frac(5t, t^2 + 9)$ (đơn vị: mg/L), với $t >= 0$ là số ngày tính từ thời điểm xảy ra sự cố. Xét tính đúng hoặc sai của các phát biểu sau:],
  (
    [Nồng độ hóa chất trong hồ đạt giá trị lớn nhất vào ngày thứ $5$.],
    True([Nồng độ cao nhất của hóa chất trong hồ đo được là $5/6$ mg/L.]),
    True([Sau khi đạt giá trị lớn nhất, nồng độ hóa chất trong hồ giảm dần tiệm cận về $0$.]),
    [Tốc độ thay đổi nồng độ hóa chất tại thời điểm bắt đầu xảy ra sự cố ($t = 0$) mang giá trị âm.],
  ),

  loigiai: [
    - a) Sai. Đạo hàm $C'(t) = frac(5(t^2+9) - 5t(2t), (t^2+9)^2) = frac(45 - 5t^2, (t^2+9)^2)$. Giải $C'(t) = 0 <=> t^2 = 9 => t = 3$. Đạt đỉnh vào ngày thứ 3.
    - b) Đúng. Nồng độ cao nhất tại $t=3$ là $C(3) = frac(5(3), 3^2 + 9) = frac(15, 18) = frac(5, 6)$ (mg/L).
    - c) Đúng. $lim_(t -> +oo) frac(5t, t^2 + 9) = 0$, đường cong là tiệm cận ngang $y=0$ trục hoành, nồng độ giảm tiệm cận về 0.
    - d) Sai. Tại $t=0$, $C'(0) = frac(45, 81) > 0$. Lúc mới tràn hóa chất, tốc độ đang tăng nhanh.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một công ty công nghệ nhận thấy lợi nhuận $P(x)$ (đơn vị: triệu đồng) thu được từ ứng dụng di động phụ thuộc vào lượng người dùng hoạt động $x$ (đơn vị: nghìn người) theo công thức $P(x) = -x^3 + 12 x^2 + 27 x - 10$ (với $x >= 0$). Xét tính đúng hoặc sai của các phát biểu sau:],
  (
    True([Lợi nhuận của công ty đạt giá trị lớn nhất khi ứng dụng có $9$ nghìn người dùng hoạt động.]),
    [Lợi nhuận lớn nhất mà công ty đạt được từ ứng dụng là $400$ triệu đồng.],
    True([Tốc độ tăng trưởng lợi nhuận (đạo hàm của lợi nhuận) đạt giá trị lớn nhất khi lượng người dùng là $4$ nghìn người.]),
    [Công ty luôn bị lỗ vốn nếu lượng người dùng vượt quá $12$ nghìn người.],
  ),

  loigiai: [
    - a) Đúng. Đạo hàm $P'(x) = -3x^2 + 24x + 27 = -3(x^2 - 8x - 9)$. Nghiệm $x=9$ và $x=-1$. Cực đại tại $x=9$.
    - b) Sai. $P(9) = -9^3 + 12(9)^2 + 27(9) - 10 = -729 + 972 + 243 - 10 = 476$ (triệu đồng).
    - c) Đúng. Tốc độ tăng trưởng là $P'(x)$. Ta tìm cực đại của $P'(x)$ bằng cách xét đạo hàm bậc hai $P''(x) = -6x + 24 = 0 => x=4$. Điểm uốn.

    - d) Sai. Tại $x=13$: $P(13) = -2197 + 2028 + 351 - 10 = 172 > 0$. Vẫn còn lãi chứ chưa lỗ.

  ],
))

#q-wrap(dir: "ngang", ds(
  [Số lượng cá của một loài trong hồ tự nhiên sau $t$ tháng kể từ khi thả giống được ước tính bởi công thức $N(t) = frac(400, 1 + 3 e^(-0,2 t))$ (đơn vị: con). Xét tính đúng hoặc sai của các phát biểu sau:],
  (
    True([Số lượng cá ban đầu khi bắt đầu thả giống vào hồ là $100$ con.]),
    [Sức chứa tối đa của loài cá này trong hồ là $1.200$ con.],
    True([Số lượng cá trong hồ luôn tăng theo thời gian.]),
    True([Khi số lượng cá trong hồ đạt $200$ con thì tốc độ tăng trưởng của quần thể cá là lớn nhất.]),
  ),

  loigiai: [
    - a) Đúng. Thay $t=0$, ta có $N(0) = frac(400, 1 + 3e^0) = frac(400, 4) = 100$.
    - b) Sai. Khi $t -> +oo$, $e^{-0.2t} -> 0$, $N(t) -> frac(400, 1) = 400$. Giới hạn sức chứa (tiệm cận ngang) là 400.
    - c) Đúng. Hàm phân thức có mẫu $1 + 3e^{-0.2t}$ giảm ngặt nên phân thức tăng ngặt, đạo hàm luôn dương.
    - d) Đúng. Đối với mô hình hàm logistic $N = frac(K, 1+C e^(-r t))$, tốc độ sinh trưởng đạt lớn nhất (điểm uốn) khi $N = K/2$. Ở đây $K=400$, nên tốc độ lớn nhất khi $N=200$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Chi phí nhiên liệu (đơn vị: nghìn đồng/giờ) của một tàu thủy khi di chuyển với vận tốc $v$ (km/h) là $C_1(v) = 50 + 0,5 v^3$ ($v > 0$). Ngoài ra, các chi phí cố định khác (nhân sự, bảo trì...) của tàu là $400$ nghìn đồng cho mỗi giờ chạy. Tàu thực hiện một chuyến hành trình dài $1000$ km. Xét tính đúng hoặc sai của các phát biểu sau:],
  (
    True([Tổng chi phí của chuyến đi (đơn vị: nghìn đồng) được biểu diễn theo vận tốc $v$ là $T(v) = frac(1000, v)(450 + 0,5 v^3)$ (với $v > 0$).]),
    True([Thời gian để tàu hoàn thành chuyến hành trình là $1000/v$ (giờ).]),
    [Để tổng chi phí của chuyến hành trình là nhỏ nhất, tàu cần di chuyển với vận tốc xấp xỉ $11,4$ km/h.],
    [Tàu di chuyển càng chậm thì tổng chi phí chuyến đi càng thấp do lượng nhiên liệu tiêu hao giảm.],
  ),

  loigiai: [
    - a) Đúng. Tổng chi phí mỗi giờ là $C(v) = 50 + 0.5v^3 + 400 = 450 + 0.5v^3$. Tổng chi phí chuyến đi = (Chi phí 1 giờ) $times$ (Thời gian đi) = $(450 + 0.5v^3) times frac(1000, v)$.
    - b) Đúng. Công thức thời gian $t = S/v$.
    - c) Sai. $T(v) = 1000 (frac(450, v) + 0.5v^2)$. $T'(v) = 1000 (-frac(450, v^2) + v) = 0 <=> v^3 = 450 => v = root(3, 450) approx 7.66$ km/h. (Chứ không phải 11.4).
    - d) Sai. Nếu chạy quá chậm, nhiên liệu ít nhưng chi phí cố định (lương, bảo dưỡng) nhân với thời gian rất dài sẽ làm tổng chi phí khổng lồ.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Một máy in sản xuất $x$ quyển sách với hàm chi phí $C(x) = 20000 + 100x + 0.05x^2$ (đồng). Doanh thu bán ra là $R(x) = 200x$. Sản lượng $x$ bằng bao nhiêu để công ty đạt lợi nhuận cực đại?],
  [$1000$],

  loigiai: [
    #step[Hàm lợi nhuận: $P(x) = R(x) - C(x) = 200x - (20000 + 100x + 0.05x^2) = -0.05x^2 + 100x - 20000$.]
    #step[Đạo hàm của hàm lợi nhuận: $P'(x) = -0.1x + 100$.]
    #step[Cho $P'(x) = 0 <=> -0.1x + 100 = 0 <=> x = 1000$.]
    #step[Do hệ số $a = -0.05 < 0$ nên đồ thị hàm lợi nhuận là parabol có bề lõm hướng xuống, lợi nhuận đạt cực đại tại đỉnh $x = 1000$ sản phẩm.]
  ],
))



#q-wrap(dir: "doc", tln(
  [Cho hàm số mô phỏng tỉ lệ phần trăm dân số mắc một bệnh truyền nhiễm $P(t) = frac(100 t, t^2 + 25)$ (\%), $t$ tính bằng tuần. Tỉ lệ nhiễm bệnh đạt đỉnh cao nhất là bao nhiêu phần trăm?],
  [$10$],

  loigiai: [
    #step[$P'(t) = frac(100(t^2+25) - 100t(2t), (t^2+25)^2) = frac(2500 - 100t^2, (t^2+25)^2) = 0 => t^2 = 25 => t = 5$.]
    #step[Tại $t = 5$, tỉ lệ nhiễm là $P(5) = frac(100(5), 5^2 + 25) = frac(500, 50) = 10\%$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trọng lượng $W(t)$ (kg) của một con bê từ lúc sinh ra ($t=0$) đến trưởng thành được ước tính bằng mô hình logistic $W(t) = frac(400, 1 + 9"e"^(-0.3t))$. Khi trưởng thành (sau nhiều năm), con bê này sẽ nặng xấp xỉ bao nhiêu kg?],
  [$400$],

  loigiai: [
    #step[Giới hạn bão hòa (trưởng thành): $lim_(t -> +oo) frac(400, 1 + 9e^(-0.3t))$.]
    #step[Vì $lim_(t -> +oo) e^(-0.3t) = 0$ nên $W_"max" = frac(400, 1 + 0) = 400$ (kg).]
  ],
))

#q-wrap(dir: "doc", tln(
  [Hiệu suất học tập của một sinh viên $E(t)$ theo thời gian $t$ (giờ) học liên tục là $E(t) = frac(20t, t^2 + 4)$. Để hiệu suất là cao nhất, sinh viên nên học liên tục trong bao nhiêu giờ rồi nghỉ ngơi?],
  [$2$],

  loigiai: [
    #step[Đạo hàm $E'(t) = frac(20(t^2+4) - 20t(2t), (t^2+4)^2) = frac(80 - 20t^2, (t^2+4)^2)$.]
    #step[$E'(t) = 0 <=> 20t^2 = 80 => t^2 = 4 => t = 2$.]
    #step[Nên học liên tục $2$ giờ thì hiệu suất đạt cực đại.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một khối tuyết hình cầu đang tan chảy dưới ánh nắng mặt trời. Tốc độ giảm thể tích của khối tuyết tại mỗi thời điểm tỉ lệ thuận với diện tích bề mặt của nó tại thời điểm đó. Biết rằng sau $2$ giờ thì bán kính của khối tuyết giảm đi một nửa. Hỏi sau tổng cộng bao nhiêu giờ kể từ lúc bắt đầu tan chảy thì khối tuyết sẽ tan hết hoàn toàn?],
  [$4$],

  loigiai: [
    #step[Gọi $V(t)$ là thể tích, $S(t)$ là diện tích bề mặt và $R(t)$ là bán kính của khối tuyết tại thời điểm $t$ (giờ). Ta có $V(t) = frac(4, 3) pi R(t)^3$, $S(t) = 4 pi R(t)^2$.]
    #step[Tốc độ giảm thể tích theo thời gian là $-V'(t) = k S(t)$ (với $k > 0$ là hằng số).]
    #step[Đạo hàm hai vế của công thức thể tích theo $t$: $V'(t) = 4 pi R(t)^2 R'(t) = S(t) R'(t)$..]
    #step[Do đó: $-S(t) R'(t) = k S(t) <=> R'(t) = -k$. Bán kính giảm đều theo thời gian: $R(t) = R_0 - k t$.]
    #step[Sau $2$ giờ bán kính giảm một nửa: $R(2) = R_0 - 2k = frac(R_0, 2) => k = frac(R_0, 4)$.]
    #step[Tan hết hoàn toàn khi $R(t) = 0 <=> R_0 - frac(R_0, 4) t = 0 <=> t = 4$ (giờ).]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một công ty du lịch vận hành một tuyến xe buýt. Nếu giá vé là $120$ nghìn đồng thì trung bình mỗi chuyến xe có $30$ hành khách. Nếu công ty tiến hành giảm giá vé thì cứ mỗi lần giảm giá vé thêm $10$ nghìn đồng, số lượng hành khách trung bình trên mỗi chuyến xe sẽ tăng thêm $5$ người. Hỏi công ty nên giảm giá vé bao nhiêu nghìn đồng để doanh thu trên mỗi chuyến xe đạt giá trị lớn nhất?],
  [$30$],
  loigiai: [
    #step[Gọi $x$ (nghìn đồng) là số tiền giảm giá vé ($0 < x < 120$).]
    #step[Giá vé mới là $120 - x$ (nghìn đồng).]
    #step[Số lượng khách trung bình mới là: $30 + 5 dot.c frac(x, 10) = 30 + 0,5 x$ (người).]
    #step[Doanh thu đạt được là: $R(x) = (120 - x)(30 + 0,5 x) = -0,5 x^2 + 30 x + 3600$.]
    #step[Đạo hàm: $R'(x) = -x + 30 = 0 <=> x = 30$ (nghìn đồng).]
  ],
))
