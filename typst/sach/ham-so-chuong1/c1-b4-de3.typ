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
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 03 - TIỆM CẬN TRONG BỐI CẢNH THỰC TẾ]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Nồng độ của một loại thuốc trong máu của bệnh nhân sau $t$ giờ tiêm được tính bởi công thức $C(t) = (4t)/(t^2 + 1)$ (mg/L). Khi thời gian $t$ kéo dài vô hạn ($t -> +oo$), nồng độ thuốc trong máu của bệnh nhân sẽ tiệm cận về giá trị nào?],
  (
    [$4$ mg/L],
    [$1$ mg/L],
    True([$0$ mg/L]),
    [$2$ mg/L],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính giới hạn của nồng độ thuốc khi thời gian kéo dài vô hạn ($t -> +oo$):]
    #step[$lim_(t -> +oo) C(t) = lim_(t -> +oo) (4t)/(t^2 + 1) = lim_(t -> +oo) (4/t)/(1 + 1/t^2) = 0$.]
    #step[Đồ thị hàm số $C(t)$ nhận đường thẳng $y = 0$ làm tiệm cận ngang khi $t -> +oo$.]
    #step[Do đó nồng độ thuốc trong máu sẽ tiệm cận về $0$ mg/L.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Để dự báo số lượng cá thể của một loài chim trong khu bảo tồn sau $t$ năm, người ta sử dụng mô hình $P(t) = (15t + 3)/(3t + 1)$ (nghìn cá thể) với $t >= 0$. Số lượng cá thể tối đa mà loài chim này có thể đạt được trong khu bảo tồn là bao nhiêu?],
  (
    [$3$ nghìn cá thể],
    True([$5$ nghìn cá thể]),
    [$15$ nghìn cá thể],
    [$1$ nghìn cá thể],
  ),
  accent: c-book,
  loigiai: [
    #step[Số lượng cá thể tối đa của loài chim trong khu bảo tồn tương ứng với giới hạn của $P(t)$ khi thời gian kéo dài vô hạn ($t -> +oo$).]
    #step[Tính giới hạn: $lim_(t -> +oo) P(t) = lim_(t -> +oo) (15t + 3)/(3t + 1) = lim_(t -> +oo) (15 + 3/t)/(3 + 1/t) = 5$.]
    #step[Đồ thị hàm số $P(t)$ nhận đường thẳng $y = 5$ làm tiệm cận ngang.]
    #step[Vậy số lượng cá thể tối đa mà loài chim này có thể đạt được là $5$ nghìn cá thể.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công ty sản xuất máy lọc nước thấy rằng tổng chi phí sản xuất $x$ chiếc máy lọc nước mỗi ngày là $C(x) = 80x + 5000$ (USD). Chi phí trung bình để sản xuất một chiếc máy lọc nước là $A(x) = C(x)/x$. Khi số lượng sản phẩm sản xuất ra mỗi ngày rất lớn ($x -> +oo$), chi phí trung bình để sản xuất một chiếc máy lọc nước sẽ tiệm cận về bao nhiêu?],
  (
    [$5000$ USD],
    [$50$ USD],
    True([$80$ USD]),
    [$100$ USD],
  ),
  accent: c-book,
  loigiai: [
    #step[Hàm chi phí trung bình là: $A(x) = (80x + 5000)/x = 80 + 5000/x$ (USD).]
    #step[Tính giới hạn khi $x -> +oo$: $lim_(x -> +oo) A(x) = lim_(x -> +oo) (80 + 5000/x) = 80$.]
    #step[Đồ thị hàm số $A(x)$ nhận đường thẳng $y = 80$ làm tiệm cận ngang.]
    #step[Vậy chi phí trung bình để sản xuất một chiếc máy lọc nước sẽ tiệm cận về $80$ USD.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Phần trăm lượng thông tin một học sinh nhớ được sau $t$ giờ học bài được cho bởi công thức $I(t) = (90t + 15)/(t + 1)$ (%) với $t >= 0$. Lượng thông tin tối đa mà học sinh này có thể nhớ được trong thời gian dài là bao nhiêu?],
  (
    [$15\%$],
    [$85\%$],
    True([$90\%$]),
    [$95\%$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính giới hạn phần trăm thông tin nhớ được khi thời gian học kéo dài vô hạn ($t -> +oo$):]
    #step[$lim_(t -> +oo) I(t) = lim_(t -> +oo) (90t + 15)/(t + 1) = lim_(t -> +oo) (90 + 15/t)/(1 + 1/t) = 90$.]
    #step[Đồ thị hàm số $I(t)$ nhận đường thẳng $y = 90$ làm tiệm cận ngang.]
    #step[Do đó, lượng thông tin tối đa học sinh có thể nhớ được trong thời gian dài tiệm cận về $90\%$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nồng độ sản phẩm trong một phản ứng hóa học sau $t$ giây kể từ khi bắt đầu phản ứng được biểu diễn bởi công thức $P(t) = (1.5t)/(0.5t + 0.25)$ (mol/L). Xác định nồng độ sản phẩm bão hòa khi phản ứng kéo dài vô hạn.],
  (
    [$1.5$ mol/L],
    True([$3.0$ mol/L]),
    [$0.5$ mol/L],
    [$6.0$ mol/L],
  ),
  accent: c-book,
  loigiai: [
    #step[Nồng độ sản phẩm bão hòa tương ứng với giới hạn của $P(t)$ khi thời gian phản ứng tiến đến vô hạn ($t -> +oo$).]
    #step[Tính giới hạn: $lim_(t -> +oo) P(t) = lim_(t -> +oo) (1.5t)/(0.5t + 0.25) = lim_(t -> +oo) 1.5/(0.5 + 0.25/t) = 1.5/0.5 = 3$.]
    #step[Đồ thị hàm số $P(t)$ nhận đường thẳng $y = 3$ làm tiệm cận ngang.]
    #step[Vậy nồng độ sản phẩm bão hòa của phản ứng hóa học là $3.0$ mol/L.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Vận tốc của một vật rơi tự do chịu lực cản không khí sau $t$ giây được cho bởi công thức $v(t) = (40t)/(t + 2)$ (m/s) với $t >= 0$. Vận tốc giới hạn (vận tốc thiết lập tối đa) của vật rơi tự do này là bao nhiêu?],
  (
    [$20$ m/s],
    True([$40$ m/s]),
    [$2$ m/s],
    [$80$ m/s],
  ),
  accent: c-book,
  loigiai: [
    #step[Vận tốc giới hạn của vật rơi tự do tương ứng với giới hạn của $v(t)$ khi thời gian rơi kéo dài vô hạn ($t -> +oo$).]
    #step[Tính giới hạn: $lim_(t -> +oo) v(t) = lim_(t -> +oo) (40t)/(t + 2) = lim_(t -> +oo) 40/(1 + 2/t) = 40$.]
    #step[Đồ thị hàm số $v(t)$ nhận đường thẳng $y = 40$ làm tiệm cận ngang.]
    #step[Do đó, vận tốc giới hạn của vật là $40$ m/s.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Doanh số bán hàng $S$ (triệu VND) của một sản phẩm mới sau khi chi $x$ triệu VND cho quảng cáo được xác định bởi mô hình $S(x) = (250x)/(x + 10)$ với $x >= 0$. Doanh số bán hàng tối đa đạt được khi chi phí quảng cáo tăng rất lớn là bao nhiêu?],
  (
    [$10$ triệu VND],
    [$125$ triệu VND],
    True([$250$ triệu VND]),
    [$500$ triệu VND],
  ),
  accent: c-book,
  loigiai: [
    #step[Doanh số bán hàng tối đa đạt được khi chi phí quảng cáo $x -> +oo$.]
    #step[Tính giới hạn: $lim_(x -> +oo) S(x) = lim_(x -> +oo) (250x)/(x + 10) = lim_(x -> +oo) 250/(1 + 10/x) = 250$.]
    #step[Đường thẳng $y = 250$ là tiệm cận ngang của đồ thị hàm số $S(x)$.]
    #step[Vậy doanh số bán hàng tối đa đạt được là $250$ triệu VND.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Sau khi uống một liều thuốc, nồng độ thuốc $C(t)$ (mg/L) trong máu của một bệnh nhân theo thời gian $t$ (giờ) được mô tả bằng công thức $C(t) = (3t + 2)/(t + 1)$ với $t >= 0$. Sau một thời gian dài, nồng độ thuốc trong máu của bệnh nhân ổn định ở mức bao nhiêu?],
  (
    [$2$ mg/L],
    True([$3$ mg/L]),
    [$1$ mg/L],
    [$5$ mg/L],
  ),
  accent: c-book,
  loigiai: [
    #step[Nồng độ ổn định lâu dài được tính bằng giới hạn của $C(t)$ khi $t -> +oo$.]
    #step[Tính giới hạn: $lim_(t -> +oo) C(t) = lim_(t -> +oo) (3t + 2)/(t + 1) = lim_(t -> +oo) (3 + 2/t)/(1 + 1/t) = 3$.]
    #step[Đồ thị hàm số $C(t)$ nhận đường thẳng $y = 3$ làm tiệm cận ngang.]
    #step[Vậy nồng độ thuốc trong máu bệnh nhân ổn định ở mức $3$ mg/L.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Để khử độc chất trong hồ nước, người ta thả một loại vi khuẩn tiêu thụ độc chất đó. Nồng độ độc chất còn lại trong hồ sau $t$ tuần được ước tính bằng công thức $D(t) = 4 + (20)/(t + 1)$ (ppm) với $t >= 0$. Khi thời gian $t$ kéo dài vô hạn ($t -> +oo$), nồng độ độc chất còn lại tối thiểu trong hồ sẽ tiệm cận về mức nào?],
  (
    [$0$ ppm],
    [$20$ ppm],
    [$24$ ppm],
    True([$4$ ppm]),
  ),
  accent: c-book,
  loigiai: [
    #step[Nồng độ độc chất còn lại tối thiểu khi thời gian kéo dài vô hạn chính là giới hạn của $D(t)$ khi $t -> +oo$.]
    #step[Tính giới hạn: $lim_(t -> +oo) D(t) = lim_(t -> +oo) (4 + 20/(t + 1)) = 4 + 0 = 4$.]
    #step[Đồ thị hàm số $D(t)$ nhận đường thẳng $y = 4$ làm tiệm cận ngang.]
    #step[Vậy nồng độ độc chất còn lại tối thiểu tiệm cận về mức $4$ ppm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một trại chăn nuôi dự báo số lượng cừu sau $t$ năm theo công thức $P(t) = (300t + 100)/(t + 1)$ (con). Sau nhiều năm, số lượng cừu của trại sẽ tiệm cận về giá trị nào?],
  (
    [$100$ con],
    True([$300$ con]),
    [$400$ con],
    [$200$ con],
  ),
  accent: c-book,
  loigiai: [
    #step[Số lượng cừu tiệm cận lâu dài được tính bằng giới hạn khi $t -> +oo$.]
    #step[Tính giới hạn: $lim_(t -> +oo) P(t) = lim_(t -> +oo) (300t + 100)/(t + 1) = lim_(t -> +oo) (300 + 100/t)/(1 + 1/t) = 300$.]
    #step[Đồ thị hàm số $P(t)$ nhận đường thẳng $y = 300$ làm tiệm cận ngang.]
    #step[Do đó, số lượng cừu của trại sẽ tiệm cận về $300$ con.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công ty sản xuất chè sạch Organic thấy rằng khi sản xuất $x$ kg chè mỗi ngày, chi phí trung bình trên mỗi kg chè được xác định bởi công thức $A(x) = (10x^2 + 150x + 200)/x$ (nghìn đồng) với $x > 0$. Phương trình tiệm cận xiên của đồ thị hàm chi phí trung bình này là gì?],
  (
    [$y = 10x$],
    True([$y = 10x + 150$]),
    [$y = 10x + 200$],
    [$y = 150x + 200$],
  ),
  accent: c-book,
  loigiai: [
    #step[Viết lại hàm chi phí trung bình $A(x)$ bằng cách chia tử số cho mẫu số:]
    #step[$A(x) = (10x^2 + 150x + 200)/x = 10x + 150 + 200/x$.]
    #step[Tính giới hạn: $lim_(x -> +oo) [A(x) - (10x + 150)] = lim_(x -> +oo) 200/x = 0$.]
    #step[Theo định nghĩa tiệm cận xiên, đồ thị hàm số nhận đường thẳng $y = 10x + 150$ làm tiệm cận xiên.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Lượng xe cộ lưu thông trên một đoạn đường cao tốc phụ thuộc vào tốc độ trung bình $v$ (km/h) của các xe và được tính bởi công thức mật độ lưu lượng $D(v) = 120 - (1000)/(v + 5)$ (xe/km) với $v >= 10$. Khi tốc độ trung bình $v$ tăng lên rất lớn ($v -> +oo$), mật độ lưu lượng xe cộ tối đa tiệm cận về giá trị nào?],
  (
    [$1000$ xe/km],
    [$1200$ xe/km],
    True([$120$ xe/km]),
    [$110$ xe/km],
  ),
  accent: c-book,
  loigiai: [
    #step[Mật độ xe cộ tối đa đạt được khi tốc độ trung bình tiến ra vô cùng ($v -> +oo$):]
    #step[Tính giới hạn: $lim_(v -> +oo) D(v) = lim_(v -> +oo) (120 - 1000/(v + 5)) = 120 - 0 = 120$.]
    #step[Đồ thị hàm số $D(v)$ nhận đường thẳng $y = 120$ làm tiệm cận ngang.]
    #step[Do đó mật độ lưu lượng xe tối đa tiệm cận về $120$ xe/km.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Một hồ nước có dung tích $1000 m^3$ đang chứa nước tinh khiết. Người ta bắt đầu bơm nước có pha muối vào hồ với tốc độ $10 m^3$/phút, nồng độ muối là $5 g/m^3$.
    Nồng độ muối $C(t)$ ($g/m^3$) của nước trong hồ sau $t$ phút kể từ khi bắt đầu bơm được xác định bởi công thức:
    $ C(t) = (50t)/(100 + t) $ với $t >= 0$.
    Xét tính Đúng/Sai của các khẳng định sau:
  ],
  (
    True([Nồng độ muối ban đầu của hồ khi chưa bơm ($t = 0$) là $0 g/m^3$.]),
    [Đồ thị hàm số $C(t)$ có tiệm cận đứng là đường thẳng $t = 100$.],
    True([Đồ thị hàm số $C(t)$ có tiệm cận ngang là đường thẳng $y = 50$.]),
    True([Khi thời gian bơm kéo dài vô hạn ($t -> +oo$), nồng độ muối trong hồ sẽ tiệm cận về $50 g/m^3$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Thay $t = 0$ vào công thức ta được $C(0) = 0$.
    - b) Sai. Mẫu số triệt tiêu tại $t = -100$, do đó tiệm cận đứng là $t = -100$. Vì miền xác định là $t >= 0$, tiệm cận đứng này nằm ngoài miền khảo sát thực tế.
    - c) Đúng. Giới hạn khi $t -> +oo$ là $lim_(t -> +oo) C(t) = lim_(t -> +oo) (50t)/(100 + t) = 50$. Tiệm cận ngang là đường thẳng $y = 50$.
    - d) Đúng. Giới hạn khi $t -> +oo$ bằng $50$, nồng độ muối trong hồ sẽ tiệm cận về $50 g/m^3$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một công ty chuyên sản xuất linh kiện điện tử có hàm tổng chi phí sản xuất $x$ nghìn linh kiện mỗi tháng là $C(x) = 20x + 500$ (triệu VND). Chi phí trung bình để sản xuất một nghìn linh kiện là $A(x) = C(x)/x$ (triệu VND).
    Xét tính Đúng/Sai của các phát biểu sau:
  ],
  (
    True([Chi phí trung bình để sản xuất 10 nghìn linh kiện là $70$ triệu VND/nghìn linh kiện.]),
    [Hàm chi phí trung bình $A(x)$ có tiệm cận đứng là đường thẳng $x = 20$.],
    True([Hàm chi phí trung bình $A(x)$ có tiệm cận ngang là đường thẳng $y = 20$.]),
    True(
      [Khi quy mô sản xuất tăng lên rất lớn, chi phí trung bình để sản xuất một nghìn linh kiện tiệm cận về mức tối thiểu là $20$ triệu VND.],
    ),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Với $x = 10$, ta có $A(10) = (20(10) + 500)/10 = 70$ triệu VND/nghìn linh kiện.
    - b) Sai. Tiệm cận đứng của đồ thị hàm số $A(x) = (20x + 500)/x$ là đường thẳng $x = 0$ (do mẫu số triệt tiêu tại $x = 0$).
    - c) Đúng. Giới hạn của $A(x)$ khi $x -> +oo$ là $lim_(x -> +oo) (20x + 500)/x = 20$.
    - d) Đúng. Vì tiệm cận ngang là $y = 20$ nên chi phí trung bình tiệm cận về $20$ triệu VND khi sản xuất số lượng rất lớn.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Số lượng cá thể của một đàn dê hoang dã trên một hòn đảo sau $t$ năm được mô hình hóa bởi công thức:
    $ P(t) = 200 + (1200t)/(2t + 3) $ với $t >= 0$.
    Xét tính Đúng/Sai của các khẳng định sau:
  ],
  (
    True([Số lượng cá thể ban đầu của đàn dê ($t = 0$) là $200$ con.]),
    True([Đàn dê tăng số lượng liên tục theo thời gian.]),
    [Số lượng cá thể đàn dê ổn định ở mức tối đa là $1200$ con sau nhiều năm.],
    True([Đồ thị hàm số $P(t)$ có tiệm cận ngang là đường thẳng $y = 800$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Thay $t = 0$ ta có $P(0) = 200$ con.
    - b) Đúng. Ta có đạo hàm $P'(t) = 1200(3)/((2t + 3)^2) = 3600/((2t + 3)^2) > 0$ với mọi $t >= 0$. Do đó, số lượng đàn dê tăng liên tục.
    - c) Sai. Khi $t -> +oo$, giới hạn của đàn dê là $lim_(t -> +oo) P(t) = 200 + lim_(t -> +oo) (1200t)/(2t + 3) = 200 + 600 = 800$ con. Số lượng đàn dê ổn định ở mức tối đa là $800$ con.
    - d) Đúng. Vì giới hạn khi $t -> +oo$ là $800$ nên đường tiệm cận ngang của đồ thị là $y = 800$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một công ty du lịch lữ hành ước tính tổng chi phí vận hành $x$ đoàn khách trong một mùa du lịch là $C(x) = 3x^2 + 10x + 48$ (triệu VND). Chi phí trung bình cho mỗi đoàn khách là $A(x) = C(x)/x$ (triệu VND).
    Xét tính Đúng/Sai của các khẳng định sau:
  ],
  (
    True([Hàm chi phí trung bình được viết lại dưới dạng $A(x) = 3x + 10 + 48/x$.]),
    True([Đồ thị hàm chi phí trung bình $A(x)$ nhận đường thẳng $x = 0$ làm tiệm cận đứng.]),
    True([Đồ thị hàm chi phí trung bình $A(x)$ nhận đường thẳng $y = 3x + 10$ làm tiệm cận xiên.]),
    [Khi số lượng đoàn khách tăng lên rất lớn ($x -> +oo$), chi phí trung bình cho mỗi đoàn khách tiệm cận về mức ổn định là $10$ triệu VND.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Chia tử số cho mẫu số ta được $A(x) = 3x + 10 + 48/x$.
    - b) Đúng. Mẫu số của hàm số $A(x)$ triệt tiêu tại $x = 0$ và tử số tại đó là $48 
eq 0$ nên $x = 0$ là tiệm cận đứng.
    - c) Đúng. Vì $lim_(x -> +oo) [A(x) - (3x + 10)] = lim_(x -> +oo) 48/x = 0$.
    - d) Sai. Khi $x -> +oo$, chi phí trung bình $A(x)$ tiến ra vô cực ($lim_(x -> +oo) A(x) = +oo$) do có thành phần $3x$ tiến ra vô cực. Đường tiệm cận xiên chỉ ra xu hướng tăng tuyến tính chứ không phải tiệm cận ngang về giá trị hằng số $10$.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Sau khi một bệnh nhân uống một liều thuốc kháng sinh, nồng độ thuốc trong máu của bệnh nhân được xác định bởi công thức $C(t) = (8t)/(2t + 1)$ (mg/L) với $t >= 0$. Tìm nồng độ giới hạn của thuốc trong máu khi thời gian kéo dài vô hạn (tính bằng mg/L).],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Nồng độ giới hạn của thuốc khi thời gian kéo dài vô hạn ($t -> +oo$) là:]
    #step[$lim_(t -> +oo) C(t) = lim_(t -> +oo) (8t)/(2t + 1) = lim_(t -> +oo) 8/(2 + 1/t) = 4$ mg/L.]
    #step[Đáp số: $4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Hàm tổng chi phí sản xuất $x$ chiếc tủ lạnh của một nhà máy mỗi ngày là $C(x) = 12x + 450$ (triệu đồng). Chi phí trung bình để sản xuất một chiếc tủ lạnh là $A(x) = C(x)/x$ (triệu đồng). Khi số lượng tủ lạnh sản xuất được tăng lên rất lớn, chi phí trung bình để sản xuất một chiếc tủ lạnh tiệm cận về bao nhiêu triệu đồng?],
  [$12$],
  accent: c-book,
  loigiai: [
    #step[Hàm chi phí trung bình: $A(x) = C(x)/x = 12 + 450/x$.]
    #step[Khi số lượng tủ lạnh tăng lên rất lớn ($x -> +oo$):]
    #step[$lim_(x -> +oo) A(x) = lim_(x -> +oo) (12 + 450/x) = 12$ triệu đồng.]
    #step[Đáp số: $12$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Hiệu suất học tập của một học viên sau $t$ tuần tham gia khóa huấn luyện được đánh giá bởi công thức $L(t) = (80t + 20)/(t + 2)$ (%) với $t >= 0$. Tìm hiệu số (tính bằng %) giữa hiệu suất học tập tối đa đạt được trong dài hạn và hiệu suất học tập tại thời điểm bắt đầu khóa học ($t = 0$).],
  [$70$],
  accent: c-book,
  loigiai: [
    #step[Tính hiệu suất học tập tại thời điểm bắt đầu khóa học ($t = 0$):
      $L(0) = (80(0) + 20)/(0 + 2) = 10\%$.]
    #step[Tính hiệu suất học tập tối đa đạt được trong dài hạn ($t -> +oo$):
      $lim_(t -> +oo) L(t) = lim_(t -> +oo) (80t + 20)/(t + 2) = 80\%$.]
    #step[Hiệu số cần tìm là: $80\% - 10\% = 70\%$.]
    #step[Đáp số: $70$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một hợp tác xã ước tính tổng chi phí để sản xuất và đóng gói $x$ kg chè Organic là $C(x) = 5x^2 + 20x + 80$ (nghìn đồng) với $x > 0$. Chi phí trung bình cho mỗi kg chè là $A(x) = C(x)/x$. Đồ thị hàm chi phí trung bình có tiệm cận xiên là đường thẳng $y = a x + b$. Tính giá trị của tổng $a + b$.],
  [$25$],
  accent: c-book,
  loigiai: [
    #step[Ta biểu diễn chi phí trung bình: $A(x) = (5x^2 + 20x + 80)/x = 5x + 20 + 80/x$.]
    #step[Vì $lim_(x -> +oo) [A(x) - (5x + 20)] = lim_(x -> +oo) 80/x = 0$ nên tiệm cận xiên là $y = 5x + 20$.]
    #step[Suy ra $a = 5$ và $b = 20$.]
    #step[Giá trị của tổng $a + b = 5 + 20 = 25$.]
    #step[Đáp số: $25$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Nồng độ chất hóa học hấp thụ vào mô cơ thể sau $x$ liều thuốc được cho bởi công thức $f(x) = (12x)/(x + 2)$ (mg). Tìm lượng chất hóa học bão hòa tối đa mà mô cơ thể có thể hấp thụ khi số liều thuốc tăng lên rất lớn (tính bằng mg).],
  [$12$],
  accent: c-book,
  loigiai: [
    #step[Lượng chất hóa học bão hòa tối đa là giới hạn của $f(x)$ khi $x -> +oo$:]
    #step[$lim_(x -> +oo) f(x) = lim_(x -> +oo) (12x)/(x + 2) = lim_(x -> +oo) 12/(1 + 2/x) = 12$ mg.]
    #step[Đáp số: $12$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một khu bảo tồn thiên nhiên dự báo số lượng chim đại bàng theo thời gian $t$ năm bởi công thức $P(t) = (1200t + 300)/(2t + 1)$ (cá thể). Xác định số lượng chim đại bàng tối đa ổn định lâu dài trong khu bảo tồn.],
  [$600$],
  accent: c-book,
  loigiai: [
    #step[Số lượng đại bàng tối đa ổn định lâu dài tương ứng với giới hạn của $P(t)$ khi $t -> +oo$:]
    #step[$lim_(t -> +oo) P(t) = lim_(t -> +oo) (1200t + 300)/(2t + 1) = lim_(t -> +oo) (1200 + 300/t)/(2 + 1/t) = 1200/2 = 600$ cá thể.]
    #step[Đáp số: $600$.]
  ],
))
