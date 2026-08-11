#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#muc([Đề Luyện Tập — GTLN/GTNN Ứng Dụng Thực Tế (Bản Nâng Cao)])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (10 câu)], count: 10)

#tn(
  dir: "ngang",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-0.2, 2.5), (-0.2, -0.5), stroke: 3pt + gray)
    content((-0.55, 1.0), [Tường], rotate: 90deg)
    rect((0, 0), (3, 2), stroke: 1.2pt + blue, fill: blue.lighten(80%))
    content((1.5, -0.45), $y$)
    content((3.35, 1), $x$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Một người nông dân muốn rào một khu vườn hình chữ nhật nằm sát một bức tường đá thẳng. Người đó chỉ có $120$ m lưới B40 để rào 3 mặt còn lại (mặt thứ 4 là bức tường không cần rào). Diện tích lớn nhất của khu vườn mà người đó có thể rào được là bao nhiêu?],
  (
    [$900 "m"^2$],
    [$1200 "m"^2$],
    True([$1800 "m"^2$]),
    [$3600 "m"^2$]
  ),
  loigiai: [
    #step[Gọi kích thước khu vườn là $x$ (2 cạnh vuông góc với tường) và $y$ (cạnh song song với tường). Do tổng chiều dài lưới là $120$ m nên ta có phương trình: $2x + y = 120 => y = 120 - 2x$, với điều kiện $0 < x < 60$.]
    #step[Diện tích khu vườn là hàm số theo $x$: $S(x) = x y = x(120 - 2x) = 120x - 2x^2$.]
    #step[Đạo hàm $S'(x) = 120 - 4x$. Cho $S'(x) = 0 <=> x = 30$. Khi đó $y = 60$.]
    #step[#align(center)[
      #my-bbbt(
        var: $x$, der: $S'$, func: $S$,
        x-vals: ($0$, $30$, $60$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $1800$, $0$)
      )
    ]]
    #step[Từ bảng biến thiên, ta thấy diện tích đạt giá trị lớn nhất là $1800 " m"^2$ khi $x = 30$ m.]
  ]
)

#tn(
  dir: "ngang",
  fig: canvas(length: 1cm, {
    import draw: *
    // Tấm bìa trải phẳng
    rect((-2,-2), (2,2), stroke: 1pt)
    rect((-2,-2), (-1.2,-1.2), fill: rgb("eee"))
    rect((1.2,-2), (2,-1.2), fill: rgb("eee"))
    rect((-2,1.2), (-1.2,2), fill: rgb("eee"))
    rect((1.2,1.2), (2,2), fill: rgb("eee"))
    line((-1.2,-2), (-1.2,2), stroke: (dash: "dashed"))
    line((1.2,-2), (1.2,2), stroke: (dash: "dashed"))
    line((-2,-1.2), (2,-1.2), stroke: (dash: "dashed"))
    line((-2,1.2), (2,1.2), stroke: (dash: "dashed"))
    content((-1.6, -1.6), $x$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Người ta có một tấm bìa hình vuông cạnh $12$ cm. Bằng cách cắt đi bốn hình vuông bằng nhau ở bốn góc (mỗi hình vuông nhỏ có cạnh bằng $x$ cm) rồi gấp các mép lại, ta được một chiếc hộp không nắp. Thể tích lớn nhất của hộp nhận được là bao nhiêu?],
  (
    [$256 "cm"^3$],
    [$144 "cm"^3$],
    True([$128 "cm"^3$]),
    [$108 "cm"^3$]
  ),
  loigiai: [
    #step[Hộp tạo thành có đáy là hình vuông cạnh $12 - 2x$, chiều cao $x$. Điều kiện: $0 < x < 6$.]
    #step[Thể tích hộp là $V(x) = x(12 - 2x)^2 = x(144 - 48x + 4x^2) = 4x^3 - 48x^2 + 144x$.]
    #step[Đạo hàm $V'(x) = 12x^2 - 96x + 144 = 12(x^2 - 8x + 12) = 12(x - 2)(x - 6)$.]
    #step[Cho $V'(x) = 0 <=> x = 2$ (nhận) hoặc $x = 6$ (loại vì không thuộc khoảng $(0; 6)$).]
    #step[#align(center)[
      #my-bbbt(
        var: $x$, der: $V'$, func: $V$,
        x-vals: ($0$, $2$, $6$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $128$, $0$)
      )
    ]]
    #step[Vậy thể tích lớn nhất của hộp là $128 " cm"^3$ khi $x = 2$ cm.]
  ]
)

#tn(
  dir: "ngang",
  fig: canvas(length: 1cm, {
    import draw: *
    line((-2,0), (3,0), stroke: 2pt)
    circle((0, -2), radius: 0.1, fill: black)
    content((0, -2.4), $A$)
    circle((0, 0), radius: 0.1, fill: black)
    content((0, 0.4), $H$)
    circle((2.5, 0), radius: 0.1, fill: black)
    content((2.5, 0.4), $B$)
    circle((1, 0), radius: 0.1, fill: black)
    content((1, 0.4), $M$)
    line((0, -2), (1, 0), stroke: 1.2pt + blue.lighten(30%))
    line((1, 0), (2.5, 0), stroke: 1.2pt + red.lighten(30%))
    line((0, -2), (0, 0), stroke: (dash: "dashed"))
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Một mạng lưới cáp cần được kéo từ trạm $A$ trên một hòn đảo vào trạm $B$ trên đất liền. Biết khoảng cách ngắn nhất từ đảo vào bờ biển (đường thẳng) là $A H = 3$ km. Trạm $B$ nằm dọc theo bờ biển cách $H$ một khoảng $H B = 8$ km. Chi phí đặt cáp dưới nước là $50$ triệu đồng/km, còn trên bờ là $30$ triệu đồng/km. Người ta chọn điểm $M$ trên bờ biển (giữa $H$ và $B$) để nối cáp $A M$ (dưới nước) và $M B$ (trên bờ). Tổng chi phí nhỏ nhất để kéo cáp là bao nhiêu?],
  (
    [$400$ triệu đồng],
    [$350$ triệu đồng],
    True([$330$ triệu đồng]),
    [$380$ triệu đồng]
  ),
  loigiai: [
    #step[Gọi $H M = x$ (km), điều kiện $0 <= x <= 8$. Khoảng cách $M B = 8 - x$.]
    #step[Chiều dài đoạn cáp dưới nước là $A M = sqrt(A H^2 + H M^2) = sqrt(x^2 + 9)$.]
    #step[Tổng chi phí là $C(x) = 50sqrt(x^2 + 9) + 30(8 - x)$ (triệu đồng).]
    #step[Đạo hàm $C'(x) = (50x)/(sqrt(x^2 + 9)) - 30$. Cho $C'(x) = 0 <=> 50x = 30sqrt(x^2 + 9) <=> 5x = 3sqrt(x^2 + 9)$.]
    #step[Bình phương hai vế: $25x^2 = 9(x^2 + 9) <=> 16x^2 = 81 <=> x = 9/4 = 2.25$ (nhận).]
    #step[#align(center)[
      #my-bbbt(
        var: $x$, der: $C'$, func: $C$,
        x-vals: ($0$, $2.25$, $8$),
        d-signs: ("-", "0", "+"),
        v-vals: ($390$, $330$, $50sqrt(73)$)
      )
    ]]
    #step[Từ BBT, ta thấy chi phí nhỏ nhất là $330$ triệu đồng.]
  ]
)

#tn(
  dir: "ngang",
  fig: canvas(length: 1cm, {
    import draw: *
    circle((0,0), radius: 1.5, stroke: 1pt)
    rect((-0.8, -1.27), (0.8, 1.27), stroke: 1.2pt + blue, fill: blue.lighten(80%))
    content((0, 0), $2y$)
    content((1, 0.5), $2x$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Từ một khúc gỗ hình trụ tròn có đường kính $60$ cm, người ta muốn đẽo thành một thanh xà gồ có mặt cắt ngang là hình chữ nhật. Biết rằng cường độ chịu uốn của thanh xà gồ tỉ lệ thuận với tích $x y^2$, trong đó $x$ là bề rộng và $y$ là bề cao của mặt cắt. Tính $x$ (cm) để thanh xà gồ có cường độ chịu uốn lớn nhất.],
  (
    [$30$ cm],
    True([$20sqrt(3)$ cm]),
    [$30sqrt(2)$ cm],
    [$40$ cm]
  ),
  loigiai: [
    #step[Mặt cắt ngang hình chữ nhật nội tiếp trong hình tròn đường kính $D = 60$ cm. Ta có phương trình: $x^2 + y^2 = 60^2 = 3600 => y^2 = 3600 - x^2$.]
    #step[Cường độ chịu uốn là hàm $W(x) = k dot x y^2 = k x (3600 - x^2) = k(3600x - x^3)$, với $0 < x < 60$.]
    #step[Đạo hàm $W'(x) = k(3600 - 3x^2)$. Cho $W'(x) = 0 <=> 3x^2 = 3600 <=> x^2 = 1200 <=> x = sqrt(1200) = 20sqrt(3)$.]
    #step[#align(center)[
      #my-bbbt(
        var: $x$, der: $W'$, func: $W$,
        x-vals: ($0$, $20sqrt(3)$, $60$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $k dot 48000sqrt(3)$, $0$)
      )
    ]]
    #step[Vậy $x = 20sqrt(3)$ cm là kích thước bề rộng cho cường độ chịu uốn lớn nhất.]
  ]
)

#tn(
  dir: "ngang",
  [Một công ty vận tải hành khách quản lý một đội xe. Khi công ty thu giá vé mỗi hành khách là $x$ (nghìn đồng) thì số lượng hành khách tham gia đi xe mỗi ngày ước tính là $N(x) = 120 - 2x$. Biết chi phí vận hành cho mỗi chuyến xe (cố định) là $800$ nghìn đồng. Để lợi nhuận trong một chuyến thu được là lớn nhất, giá vé $x$ (nghìn đồng) nên là bao nhiêu?],
  (
    [$25$],
    True([$30$]),
    [$40$],
    [$60$]
  ),
  loigiai: [
    #step[Doanh thu mỗi chuyến xe là: $R(x) = x N(x) = x(120 - 2x) = 120x - 2x^2$.]
    #step[Lợi nhuận thu được là: $L(x) = R(x) - C = 120x - 2x^2 - 800$.]
    #step[Đây là một parabol quay bề lõm xuống dưới ($a = -2 < 0$), đạt cực đại tại đỉnh $x = -b/(2a) = -120/(-4) = 30$.]
    #step[Lợi nhuận lớn nhất đạt được khi giá vé $x = 30$ nghìn đồng. Khi đó lợi nhuận cực đại là $L(30) = 1000$ nghìn đồng.]
  ]
)

#tn(
  dir: "ngang",
  fig: canvas(length: 1.2cm, {
    import draw: *
    rect((-1, 0), (1, 1), stroke: 1.2pt)
    arc((1, 1), start: 0deg, stop: 180deg, radius: 1, stroke: 1.2pt)
    content((0, 0.5), $2x$)
    content((1.2, 0.5), $y$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  [Một cửa sổ có dạng hình chữ nhật được phía trên kết hợp với một nửa hình tròn (hình bán nguyệt) có đường kính bằng chiều rộng của hình chữ nhật. Biết chu vi của cửa sổ là $4$ m. Tìm bán kính $x$ của nửa hình tròn để diện tích cửa sổ lớn nhất (đón được nhiều ánh sáng nhất).],
  (
    [$4/(pi + 2)$ m],
    [$2/(pi + 2)$ m],
    True([$4/(pi + 4)$ m]),
    [$2/(pi + 4)$ m]
  ),
  loigiai: [
    #step[Gọi bán kính nửa hình tròn là $x$ ($x > 0$), khi đó chiều rộng hình chữ nhật là $2x$. Gọi chiều cao hình chữ nhật là $y$.]
    #step[Chu vi cửa sổ gồm nửa chu vi đường tròn và ba cạnh hình chữ nhật: $pi x + 2x + 2y = 4 => y = (4 - pi x - 2x)/2 = 2 - ((pi + 2)/2)x$.]
    #step[Diện tích cửa sổ là $S(x) = S_("HCN") + S_("Bán nguyệt") = 2x y + (pi x^2)/2$. Thay $y$ vào ta được:]
    #step[$S(x) = 2x(2 - ((pi + 2)/2)x) + (pi x^2)/2 = 4x - (pi + 2)x^2 + (pi/2)x^2 = 4x - (pi/2 + 2)x^2$.]
    #step[Đạo hàm $S'(x) = 4 - 2(pi/2 + 2)x = 4 - (pi + 4)x$.]
    #step[Cho $S'(x) = 0 <=> x = 4/(pi + 4)$ m. Do hàm $S(x)$ là parabol bề lõm xuống dưới, nó đạt cực đại tại đỉnh. Vậy bán kính $x = 4/(pi + 4)$ m cho diện tích cực đại.]
  ]
)

#tn(
  dir: "ngang",
  [Để thiết kế một chiếc bồn chứa nước hình trụ tròn có nắp đậy, thể tích là $V = 16pi " m"^3$. Vật liệu làm bồn có cùng đơn giá cho nắp, đáy và mặt xung quanh. Bán kính đáy của bồn bằng bao nhiêu mét để tốn ít vật liệu nhất?],
  (
    [$1$ m],
    True([$2$ m]),
    [$3$ m],
    [$4$ m]
  ),
  loigiai: [
    #step[Gọi bán kính đáy là $r$ và chiều cao là $h$. Thể tích $V = pi r^2 h = 16pi => h = 16/r^2$.]
    #step[Chi phí vật liệu nhỏ nhất khi diện tích toàn phần của bồn chứa nhỏ nhất. Diện tích toàn phần: $S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r (16/r^2) = 2pi r^2 + 32pi/r$.]
    #step[Đạo hàm $S'(r) = 4pi r - 32pi/r^2$. Cho $S'(r) = 0 <=> 4pi r^3 = 32pi <=> r^3 = 8 <=> r = 2$.]
    #step[#align(center)[
      #my-bbbt(
        var: $r$, der: $S'$, func: $S$,
        x-vals: ($0$, $2$, $+oo$),
        d-signs: ("-", "0", "+"),
        v-vals: ($+oo$, $24pi$, $+oo$)
      )
    ]]
    #step[Vậy vật liệu tiêu tốn ít nhất khi bán kính đáy $r = 2$ m.]
  ]
)

#tn(
  dir: "ngang",
  [Một quả đạn pháo được bắn lên với vận tốc ban đầu $v_0 = 100$ m/s hợp với phương ngang một góc $alpha$. Tầm xa của quả đạn trên mặt đất được tính bởi công thức $L = (v_0^2 sin(2alpha))/(g)$ (bỏ qua sức cản không khí, $g = 9.8$ m/s²). Hỏi góc bắn $alpha$ phải bằng bao nhiêu để đạn đi được xa nhất?],
  (
    [$30^degree$],
    True([$45^degree$]),
    [$60^degree$],
    [$90^degree$]
  ),
  loigiai: [
    #step[Thay $v_0 = 100$ vào ta có $L(alpha) = (10000)/(9.8) sin(2alpha)$. Góc bắn $alpha$ thuộc $(0^degree; 90^degree)$.]
    #step[Để $L(alpha)$ lớn nhất thì hàm số $sin(2alpha)$ phải lớn nhất.]
    #step[Ta biết $-1 <= sin(2alpha) <= 1$, do đó giá trị lớn nhất của $sin(2alpha)$ là $1$.]
    #step[Dấu "=" xảy ra khi $2alpha = 90^degree <=> alpha = 45^degree$.]
  ]
)

#tn(
  dir: "ngang",
  [Sự phân hủy của một loại thuốc trong cơ thể người bệnh sau $t$ giờ được đo bằng nồng độ $C(t) = (0.2t)/(t^2 + 4)$ (mg/L). Nồng độ thuốc đạt mức cao nhất sau bao lâu kể từ khi bệnh nhân uống thuốc?],
  (
    [$1$ giờ],
    [$1.5$ giờ],
    True([$2$ giờ]),
    [$4$ giờ]
  ),
  loigiai: [
    #step[Khảo sát hàm số $C(t) = (0.2t)/(t^2 + 4)$ với $t >= 0$.]
    #step[Đạo hàm: $C'(t) = (0.2(t^2 + 4) - 0.2t(2t))/((t^2 + 4)^2) = (0.8 - 0.2t^2)/((t^2 + 4)^2)$.]
    #step[Cho $C'(t) = 0 <=> 0.8 - 0.2t^2 = 0 <=> t^2 = 4 <=> t = 2$ (do $t >= 0$).]
    #step[#align(center)[
      #my-bbbt(
        var: $t$, der: $C'$, func: $C$,
        x-vals: ($0$, $2$, $+oo$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $0.05$, $0$)
      )
    ]]
    #step[Nồng độ cao nhất tại $t = 2$ giờ.]
  ]
)

#tn(
  dir: "ngang",
  [Hai con tàu di chuyển trên mặt biển với các quỹ đạo vuông góc nhau. Tàu A ở vị trí $(0; 50)$ đi dọc theo trục $O y$ về gốc $O$ với vận tốc $30$ km/h. Tàu B ở vị trí $(-40; 0)$ đi dọc theo trục $O x$ về gốc $O$ với vận tốc $40$ km/h. Sau bao nhiêu giờ thì khoảng cách giữa hai tàu là ngắn nhất?],
  (
    [$0.5$ giờ],
    [$1.0$ giờ],
    True([$1.24$ giờ]),
    [$1.5$ giờ]
  ),
  loigiai: [
    #step[Tọa độ tàu A sau $t$ giờ là $A(0; 50 - 30t)$. Tọa độ tàu B sau $t$ giờ là $B(-40 + 40t; 0)$.]
    #step[Khoảng cách giữa hai tàu bình phương là $D^2(t) = (-40 + 40t)^2 + (50 - 30t)^2 = 1600 - 3200t + 1600t^2 + 2500 - 3000t + 900t^2 = 2500t^2 - 6200t + 4100$.]
    #step[Hàm số $D^2(t)$ là một parabol quay bề lõm lên trên ($a = 2500 > 0$). Nó đạt giá trị nhỏ nhất tại hoành độ đỉnh $t = -b/(2a)$.]
    #step[$t = (6200)/(2 dot 2500) = 62/50 = 1.24$. Vậy sau $1.24$ giờ khoảng cách giữa hai tàu là ngắn nhất.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",lines:4,
  [Một công ty bất động sản có một khu dân cư gồm 50 căn hộ cho thuê. Biết rằng nếu cho thuê mỗi căn hộ với giá 2 triệu đồng/tháng thì mọi căn hộ đều có người thuê. Khảo sát thị trường cho thấy: cứ mỗi lần tăng giá thuê thêm 100 nghìn đồng/tháng thì sẽ có thêm 1 căn hộ bị bỏ trống. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Hàm doanh thu của công ty nếu tăng giá thuê $x$ lần là $R(x) = (2 - 0.1x)(50 - x)$.],
    True([Số tiền mỗi căn hộ sau khi tăng giá $x$ lần là $2 + 0.1x$ (triệu đồng).]),
    True([Doanh thu đạt giá trị lớn nhất khi công ty để trống 15 căn hộ.]),
    True([Doanh thu cực đại mỗi tháng là 122.5 triệu đồng.])
  ),
  loigiai: [
    #step[a) Gọi $x$ là số lần tăng giá thêm 100 nghìn (tức là 0.1 triệu). Giá thuê mới là $2 + 0.1x$. Số căn hộ được thuê là $50 - x$. Hàm doanh thu $R(x) = (2 + 0.1x)(50 - x)$. Mệnh đề a nói $(2 - 0.1x)$ là Sai.]
    #step[b) Mệnh đề b mô tả đúng phương trình giá thuê. (Đúng)]
    #step[c) Ta có $R(x) = 100 - 2x + 5x - 0.1x^2 = -0.1x^2 + 3x + 100$. Đạo hàm $R'(x) = -0.2x + 3 = 0 <=> x = 15$. Khi $x = 15$, có $15$ căn hộ bị bỏ trống. (Đúng)]
    #step[d) Doanh thu lớn nhất $R(15) = -0.1(15)^2 + 3(15) + 100 = -22.5 + 45 + 100 = 122.5$ triệu đồng. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Người ta cần thiết kế một chiếc hộp có đáy hình vuông và không có nắp đậy, với thể tích cố định là $V = 108$ lít. Vật liệu làm đáy đắt gấp đôi vật liệu làm thân. Gọi cạnh đáy là $x$ (dm) và chiều cao là $h$ (dm). Xét tính đúng/sai:],
  (
    True([Chiều cao của hộp có thể biểu diễn theo $x$ là $h = 108/x^2$.]),
    [Hàm chi phí tỉ lệ với biểu thức $C(x) = 2x^2 + 108/x$.],
    True([Chi phí vật liệu đạt giá trị nhỏ nhất khi đáy hộp có cạnh $x = 6$ dm.]),
    [Để tốn ít vật liệu nhất, chiều cao của hộp phải bằng $6$ dm.]
  ),
  loigiai: [
    #step[a) Thể tích $V = x^2 h = 108 => h = 108/x^2$. (Đúng)]
    #step[b) Gọi đơn giá vật liệu làm thân là $1$ thì đơn giá làm đáy là $2$. Chi phí: $C(x) = 2 dot S_("đáy") + 1 dot S_("xung quanh") = 2x^2 + 4x h = 2x^2 + 4x(108/x^2) = 2x^2 + 432/x$. Mệnh đề b sai.]
    #step[c) Đạo hàm $C'(x) = 4x - 432/x^2 = 0 <=> 4x^3 = 432 <=> x^3 = 108 <=> x = 3 root(3, 4) approx 4.76$. 
c) Đạo hàm $C'(x) = 4x - 432/x^2 = 0 <=> 4x^3 = 432 <=> x^3 = 108 <=> x = 3 root(3, 4) approx 4.76$. Vậy $x=6$ là Sai. (Sai)]
    #step[d) Với $x = 3 root(3, 4)$, chiều cao $h = 108 / (9 \cdot 4^{2/3}) 
eq 6$. (Sai)]
  ]
)
#ds(
  dir: "doc",lines:4,
  [Khối trụ $T$ nội tiếp trong một hình nón có bán kính đáy $R = 6$ cm và chiều cao $H = 15$ cm (đáy khối trụ nằm trên đáy khối nón). Gọi $r$ và $x$ lần lượt là bán kính đáy và chiều cao của khối trụ. Xét tính đúng/sai của các mệnh đề sau:
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      line((-2, 0), (2, 0), stroke: 1pt)
      line((-2, 0), (0, 4), stroke: 1pt)
      line((2, 0), (0, 4), stroke: 1pt)
      line((0,0), (0,4), stroke: (dash: "dashed"))
      rect((-1.2, 0), (1.2, 1.6), stroke: 1.2pt + blue, fill: blue.lighten(80%))
      content((0, 0.8), $x$)
      content((0.6, 1.8), $r$)
      content((-2.3, 0), $A$)
      content((2.3, 0), $B$)
      content((0, 4.3), $S$)
    })
  ]
  ],
  (
    [Theo định lý Ta-lét, ta có hệ thức $x = 15 - 1.5r$.],
    True([Thể tích khối trụ được tính bằng $V(r) = 15pi r^2 - 2.5pi r^3$.]),
    True([Thể tích khối trụ đạt cực đại khi bán kính $r = 4$ cm.]),
    True([Khối trụ nội tiếp có thể tích lớn nhất bằng $80pi " cm"^3$.])
  ),
  loigiai: [
    #step[a) Dùng định lý Ta-lét trong tam giác thiết diện: $(x)/(15) = (6 - r)/(6) <=> x = 15(1 - r/6) = 15 - 2.5r$. Mệnh đề a nói $15 - 1.5r$ là Sai. (Sai)]
    #step[b) Thể tích trụ $V = pi r^2 x = pi r^2 (15 - 2.5r) = 15pi r^2 - 2.5pi r^3$. (Đúng)]
    #step[c) Lấy đạo hàm: $V'(r) = 30pi r - 7.5pi r^2 = 0 <=> r(30 - 7.5r) = 0 <=> r = 4$. (Đúng)]
    #step[d) Tại $r=4$, $V = pi (16) (15 - 10) = 80pi " cm"^3$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Một bệnh nhân được tiêm một liều thuốc kháng sinh. Sau thời gian $t$ giờ, nồng độ thuốc trong máu của bệnh nhân được mô hình hóa bằng hàm số $C(t) = -t^3 + 12t^2 + 10$ (mg/L). Phép đo chỉ thực hiện trong $10$ giờ đầu tiên ($0 <= t <= 10$). Xét tính đúng/sai:],
  (
    True([Đạo hàm thể hiện tốc độ thay đổi nồng độ là $C'(t) = -3t^2 + 24t$.]),
    [Nồng độ thuốc tăng liên tục trong suốt khoảng thời gian $10$ giờ.],
    True([Nồng độ thuốc đạt cực đại sau $8$ giờ tiêm.]),
    [Giá trị lớn nhất của nồng độ thuốc trong khoảng thời gian này là $256$ mg/L.]
  ),
  loigiai: [
    #step[a) Đạo hàm $C'(t) = -3t^2 + 24t$. (Đúng)]
    #step[b) Xét $C'(t) = 0 <=> 3t(8 - t) = 0 <=> t = 0$ hoặc $t = 8$. Trên khoảng $(0; 8)$, $C'(t) > 0$ (nồng độ tăng). Trên khoảng $(8; 10)$, $C'(t) < 0$ (nồng độ giảm). (Sai)]
    #step[c) Hàm số đạt cực đại tại $t = 8$. (Đúng)]
    #step[d) Tại $t=8$, $C(8) = -(8^3) + 12(8^2) + 10 = -512 + 768 + 10 = 266$ (mg/L), không phải $256$. (Sai)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Một nhà máy sản xuất xe máy phát hiện ra rằng, nếu họ sản xuất $x$ chiếc xe mỗi ngày thì chi phí trung bình để sản xuất một chiếc xe được tính bởi công thức $f(x) = x - 40 + 1000/x$ (triệu đồng). Dây chuyền sản xuất có khả năng xuất xưởng tối đa $60$ chiếc/ngày. Nhà máy nên sản xuất bao nhiêu chiếc xe mỗi ngày để chi phí sản xuất trung bình cho một chiếc là nhỏ nhất? (Làm tròn đến số nguyên gần nhất).],
  [$32$],
  loigiai: [
    #step[Xét hàm $f(x) = x - 40 + 1000/x$ trên $(0; 60]$.]
    #step[Đạo hàm $f'(x) = 1 - 1000/x^2$. Cho $f'(x) = 0 <=> x^2 = 1000 <=> x = sqrt(1000) = 10sqrt(10) approx 31.62$.]
    #step[#align(center)[
      #my-bbbt(
        var: $x$, der: $f'$, func: $f$,
        x-vals: ($0$, $10sqrt(10)$, $60$),
        d-signs: ("-", "0", "+"),
        v-vals: ($+oo$, $20sqrt(10) - 40$, $110/3$)
      )
    ]]
    #step[Từ bảng biến thiên, $f(x)$ đạt cực tiểu tại $x approx 31.62$. Làm tròn thành $32$ xe.]
  ]
)

#tln(
  dir: "ngang",
  [Người ta cần thiết kế một khu vực hình chữ nhật để làm sân phơi cà phê, diện tích là $S = 400 " m"^2$. Sân phơi này được bao quanh bởi một bức tường xây bằng gạch. Phía trước có để lại một khoảng hở dài $4$ m để làm cổng ra vào. Biết chi phí xây tường là $1.5$ triệu đồng cho mỗi mét dài. Bỏ qua độ dày bức tường. Tính chi phí thấp nhất (theo đơn vị triệu đồng) để xây bức tường rào này.],
  [$114$],
  loigiai: [
    #step[Gọi kích thước của sân là $x$ và $y$ (m). Diện tích $x y = 400 => y = 400/x$.]
    #step[Chiều dài tường rào cần xây là chu vi trừ đi đoạn làm cổng: $P(x) = 2(x + y) - 4 = 2x + 800/x - 4$.]
    #step[Đạo hàm $P'(x) = 2 - 800/x^2 = 0 <=> 2x^2 = 800 <=> x^2 = 400 <=> x = 20$. Khi đó $y = 20$.]
    #step[Độ dài tường rào ngắn nhất là $P(20) = 2(20) + 800/20 - 4 = 40 + 40 - 4 = 76$ m.]
    #step[Chi phí thấp nhất là $76 times 1.5 = 114$ triệu đồng.]
  ]
)

#tln(
  dir: "ngang",
  [Một công ty muốn xây dựng một bồn chứa hóa chất có dạng hình trụ tròn kín (có nắp và đáy) có thể tích là $500 pi " m"^3$. Hãy tính bán kính đáy $r$ (mét) của bồn chứa để diện tích vật liệu cần dùng là nhỏ nhất (giả sử độ dày vật liệu là không đáng kể).],
  [$6.3$],
  loigiai: [
    #step[Gọi chiều cao bồn là $h$. Thể tích $V = pi r^2 h = 500 pi => h = 500/r^2$.]
    #step[Diện tích toàn phần $S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r (500/r^2) = 2pi r^2 + 1000pi/r$.]
    #step[Đạo hàm $S'(r) = 4pi r - 1000pi/r^2 = 0 <=> 4pi r^3 = 1000pi <=> r^3 = 250 <=> r = root(3, 250) approx 6.2996$ m.]
    #step[Làm tròn $6.3$ mét.]
  ]
)

#tln(
  dir: "ngang",
  [Độ giảm huyết áp của một bệnh nhân được đo bởi công thức $G(x) = 0.025x^2(30 - x)$ trong đó $x$ là liều lượng thuốc tiêm (mg) ($0 < x < 30$). Để huyết áp giảm mạnh nhất thì y tá cần tiêm cho bệnh nhân liều lượng thuốc là bao nhiêu mg?],
  [$20$],
  loigiai: [
    #step[Hàm số biểu diễn độ giảm huyết áp là $G(x) = 0.75x^2 - 0.025x^3$.]
    #step[Đạo hàm $G'(x) = 1.5x - 0.075x^2$. Cho $G'(x) = 0 <=> x(1.5 - 0.075x) = 0$. Vì $x > 0$ nên $x = 1.5 / 0.075 = 20$.]
    #step[#align(center)[
      #my-bbbt(
        var: $x$, der: $G'$, func: $G$,
        x-vals: ($0$, $20$, $30$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $10$, $0$)
      )
    ]]
    #step[Hàm số đạt cực đại tại $x = 20$. Liều lượng cần tiêm là $20$ mg.]
  ]
)

#tln(
  dir: "ngang",
  [Một sợi dây điện dài $10$ m được cắt thành hai đoạn. Đoạn thứ nhất được uốn thành một hình vuông, đoạn thứ hai được uốn thành một tam giác đều. Gọi $x$ là độ dài đoạn uốn thành hình vuông ($0 <= x <= 10$). Phải chọn $x$ xấp xỉ bao nhiêu mét (làm tròn đến 2 chữ số thập phân) để tổng diện tích của hai hình đạt giá trị nhỏ nhất?],
  [$4.35$],
  loigiai: [
    #step[Đoạn thứ nhất uốn thành hình vuông nên cạnh hình vuông là $a = x/4$, diện tích $S_1 = (x/4)^2 = x^2/16$.]
    #step[Đoạn thứ hai uốn tam giác đều nên cạnh là $b = (10-x)/3$, diện tích $S_2 = b^2 sqrt(3)/4 = (10-x)^2 sqrt(3)/36$.]
    #step[Tổng diện tích $S(x) = x^2/16 + (sqrt(3)/36)(10-x)^2$.]
    #step[Đạo hàm $S'(x) = x/8 - (sqrt(3)/18)(10-x)$. Cho $S'(x) = 0 <=> x/8 = (10sqrt(3) - x sqrt(3))/18 <=> 18x = 80sqrt(3) - 8x sqrt(3)$.]
    #step[Suy ra $x(18 + 8sqrt(3)) = 80sqrt(3) <=> x = (80sqrt(3))/(18 + 8sqrt(3)) = (40sqrt(3))/(9 + 4sqrt(3)) approx 4.3496$ m.]
    #step[Làm tròn 2 chữ số thập phân, $x approx 4.35$ m.]
  ]
)

#tln(
  dir: "ngang",
  [Tốc độ của luồng khí sinh ra khi một người ho được mô tả bởi hàm số $v(r) = c r^2 (R - r)$, trong đó $R$ là bán kính khí quản, $r$ là bán kính luồng khí khi đi qua khí quản đang bị co lại $(0 < r < R)$ và $c$ là một hằng số dương. Hỏi tốc độ luồng khí là lớn nhất khi bán kính $r$ bằng bao nhiêu phần của $R$? (Biết kết quả ở dạng phân số tối giản $a/b$, hãy điền giá trị của biểu thức $a+b$).],
  [$5$],
  loigiai: [
    #step[Hàm tốc độ $v(r) = c R r^2 - c r^3$.]
    #step[Đạo hàm theo biến $r$: $v'(r) = 2c R r - 3c r^2 = c r(2R - 3r)$.]
    #step[Cho $v'(r) = 0 <=> r = (2/3)R$ (nhận do $r > 0$).]
    #step[#align(center)[
      #my-bbbt(
        var: $r$, der: $v'$, func: $v$,
        x-vals: ($0$, $(2R)/3$, $R$),
        d-signs: ("+", "0", "-"),
        v-vals: ($0$, $v_("max")$, $0$)
      )
    ]]
    #step[Tốc độ lớn nhất khi $r = (2/3)R$. Ta có phân số tối giản $a/b = 2/3$, suy ra $a=2, b=3$.]
    #step[Giá trị $a+b = 5$.]
  ]
)
