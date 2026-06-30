#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Thực Tế và Mô Hình Hóa])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (10 câu)], count: auto)

// ─── CÂU 1 ───
#tn(
  dir: "ngang",
  [Chi phí trung bình để sản xuất $x$ chiếc xe đạp điện mỗi ngày là $C_("tb")(x) = 2x + 80 + 5000/x$ (triệu đồng), với $x >= 1$. Số lượng xe đạp điện cần sản xuất mỗi ngày để chi phí trung bình nhỏ nhất là:],
  (
    True([$50$]),
    [$40$],
    [$30$],
    [$60$]
  ),
  loigiai: [

    #step[Tập xác định: $D = [1; +oo)$.]
    #step[Đạo hàm của hàm số chi phí trung bình:]
    #step[$ C'_("tb")(x) = 2 - 5000/x^2 = (2(x^2 - 2500))/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'_("tb")(x) = 0 <=> x^2 = 2500 <=> x = 50 " (do " x >= 1 ")" $]
    #step[Khảo sát sự biến thiên của hàm số $C_("tb")(x)$ trên $[1; +oo)$:]
    #step[- Với $x in [1; 50)$, ta có $C'_("tb")(x) < 0$ nên hàm số nghịch biến trên khoảng $(1; 50)$.]
    #step[- Với $x in (50; +oo)$, ta có $C'_("tb")(x) > 0$ nên hàm số đồng biến trên khoảng $(50; +oo)$.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $x = 50$.]
    #step[Vậy cần sản xuất $50$ chiếc xe đạp điện mỗi ngày để chi phí trung bình nhỏ nhất.]
  ]
)

// ─── CÂU 2 ───
#tn(
  dir: "ngang",
  [Nồng độ thuốc $C(t)$ (mg/L) trong máu của một bệnh nhân sau $t$ giờ kể từ lúc tiêm thuốc được mô tả bởi công thức $C(t) = (4t)/(t^2 + 4)$ với $t >= 0$. Nồng độ thuốc trong máu đạt giá trị lớn nhất sau bao nhiêu giờ?],
  (
    [$1$ giờ],
    True([$2$ giờ]),
    [$3$ giờ],
    [$4$ giờ]
  ),
  loigiai: [

    #step[Tập xác định: $D = [0; +oo)$.]
    #step[Đạo hàm của hàm số nồng độ thuốc:]
    #step[$ C'(t) = (4(t^2 + 4) - 4t dot 2t)/((t^2 + 4)^2) = (16 - 4t^2)/((t^2 + 4)^2) $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'(t) = 0 <=> 16 - 4t^2 = 0 <=> t^2 = 4 <=> t = 2 " (do " t >= 0 ")" $]
    #step[Khảo sát sự biến thiên của hàm số $C(t)$ trên $[0; +oo)$:]
    #step[- Với $t in [0; 2)$, ta có $C'(t) > 0$ nên hàm số đồng biến trên khoảng $(0; 2)$.]
    #step[- Với $t in (2; +oo)$, ta có $C'(t) < 0$ nên hàm số nghịch biến trên khoảng $(2; +oo)$.]
    #step[Suy ra hàm số đạt giá trị lớn nhất tại $t = 2$.]
    #step[Vậy nồng độ thuốc trong máu đạt giá trị lớn nhất sau $2$ giờ kể từ lúc tiêm.]
  ]
)

// ─── CÂU 3 ───
#tn(
  dir: "ngang",
  [Doanh thu từ việc bán vé của một rạp chiếu phim phụ thuộc vào giá vé $x$ (nghìn đồng) theo công thức $R(x) = -2x^2 + 120x$ (triệu đồng) với $10 <= x <= 50$. Doanh thu của rạp đạt cực đại khi giá vé bán ra bằng:],
  (
    [$20$ nghìn đồng],
    True([$30$ nghìn đồng]),
    [$40$ nghìn đồng],
    [$25$ nghìn đồng]
  ),
  loigiai: [

    #step[Xét hàm số doanh thu $R(x) = -2x^2 + 120x$ trên đoạn $[10; 50]$.]
    #step[Đạo hàm của hàm số:]
    #step[$ R'(x) = -4x + 120 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ R'(x) = 0 <=> -4x + 120 = 0 <=> x = 30 " (thỏa mãn " 30 in [10; 50] ")" $]
    #step[Khảo sát sự biến thiên của hàm số trên đoạn $[10; 50]$:]
    #step[- Với $x in [10; 30)$, ta có $R'(x) > 0$ nên hàm số đồng biến trên khoảng $(10; 30)$.]
    #step[- Với $x in (30; 50]$, ta có $R'(x) < 0$ nên hàm số nghịch biến trên khoảng $(30; 50)$.]
    #step[Suy ra hàm số đạt giá trị lớn nhất tại $x = 30$ trên đoạn $[10; 50]$.]
    #step[Vậy doanh thu của rạp đạt cực đại khi giá vé bán ra bằng $30$ nghìn đồng.]
  ]
)

// ─── CÂU 4 ───
#tn(
  dir: "ngang",
  [Một chiếc hộp không nắp được chế tạo từ một tấm bìa các-tông hình vuông cạnh $60$ cm bằng cách cắt đi bốn hình vuông nhỏ bằng nhau có cạnh $x$ (cm) ở bốn góc rồi gập nếp lại. Chiều cao $x$ của chiếc hộp để thể tích hộp lớn nhất là:],
  (
    [$15$ cm],
    True([$10$ cm]),
    [$12$ cm],
    [$8$ cm]
  ),
  loigiai: [

    #step[Thiết lập hàm thể tích:]
    #step[Khi cắt bốn hình vuông nhỏ ở bốn góc cạnh $x$, chiếc hộp có chiều cao là $x$ (cm) và cạnh đáy là $60 - 2x$ (cm).]
    #step[Điều kiện: $0 < x < 30$.]
    #step[Thể tích của chiếc hộp là:]
    #step[$ V(x) = x(60 - 2x)^2 = 4x^3 - 240x^2 + 3600x " (cm³)" $]
    #step[Khảo sát hàm số $V(x)$ trên khoảng $(0; 30)$:]
    #step[Đạo hàm:]
    #step[$ V'(x) = 12x^2 - 480x + 3600 = 12(x^2 - 40x + 300) $]
    #step[Giải phương trình đạo hàm:]
    #step[$ V'(x) = 0 <=> x^2 - 40x + 300 = 0 <=> hoac(x = 10, x = 30) $]
    #step[Vì $0 < x < 30$ nên ta nhận giá trị $x = 10$.]
    #step[Khảo sát sự biến thiên của hàm số $V(x)$ trên khoảng $(0; 30)$:]
    #step[- Với $x in (0; 10)$, ta có $V'(x) > 0$ nên hàm số đồng biến.]
    #step[- Với $x in (10; 30)$, ta có $V'(x) < 0$ nên hàm số nghịch biến.]
    #step[Suy ra hàm số đạt giá trị lớn nhất tại $x = 10$.]
    #step[Vậy thể tích hộp lớn nhất khi chiều cao $x = 10$ cm.]
  ]
)

// ─── CÂU 5 ───
#tn(
  dir: "ngang",
  [Một cơ sở sản xuất cần làm một bể chứa nước hình hộp chữ nhật không nắp, có đáy là hình vuông, thể tích bể chứa là $250$ m³. Chi phí xây dựng mặt đáy là $200$ nghìn đồng/m², chi phí xây dựng bốn mặt xung quanh là $50$ nghìn đồng/m². Để chi phí thuê xây dựng bể là nhỏ nhất thì độ dài cạnh đáy hình vuông của bể nước phải bằng:],
  (
    [$4$ m],
    True([$5$ m]),
    [$6$ m],
    [$8$ m]
  ),
  loigiai: [

    #step[Thiết lập hàm chi phí:]
    #step[Gọi $x$ (m, $x > 0$) là độ dài cạnh đáy hình vuông của bể, chiều cao bể là $h$ (m, $h > 0$).]
    #step[Thể tích bể: $V = x^2 h = 250 => h = 250/x^2$.]
    #step[Diện tích mặt đáy của bể là $S_("đáy") = x^2$ (m²).]
    #step[Diện tích bốn mặt xung quanh là $S_("xq") = 4x h = 4x dot 250/x^2 = 1000/x$ (m²).]
    #step[Tổng chi phí xây dựng bể là:]
    #step[$ C(x) = 200 x^2 + 50 dot 1000/x = 200x^2 + 50000/x " (nghìn đồng)" $]
    #step[Khảo sát hàm số $C(x)$ trên khoảng $(0; +oo)$:]
    #step[Đạo hàm:]
    #step[$ C'(x) = 400x - 50000/x^2 = (400x^3 - 50000)/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'(x) = 0 <=> 400x^3 - 50000 = 0 <=> x^3 = 125 <=> x = 5 " (m)" $]
    #step[Khảo sát sự biến thiên của hàm số $C(x)$ trên khoảng $(0; +oo)$:]
    #step[- Với $x in (0; 5)$, ta có $C'(x) < 0$ nên hàm số nghịch biến.]
    #step[- Với $x in (5; +oo)$, ta có $C'(x) > 0$ nên hàm số đồng biến.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $x = 5$.]
    #step[Vậy độ dài cạnh đáy của bể nước phải bằng $5$ m để chi phí nhỏ nhất.]
  ]
)

// ─── CÂU 6 ───
#tn(
  dir: "ngang",
  [Số lượng vi khuẩn của một mẻ nuôi cấy sau $t$ giờ được mô tả bởi hàm số $N(t) = (100t)/(t + 2)$ (triệu con), với $t >= 0$. Khảo sát sự biến thiên của hàm số $N(t)$ cho thấy khi thời gian nuôi cấy tăng lên rất lớn thì số lượng vi khuẩn sẽ tiến dần đến mức giới hạn là:],
  (
    True([$100$ triệu con]),
    [$50$ triệu con],
    [$200$ triệu con],
    [$120$ triệu con]
  ),
  loigiai: [

    #step[Xét giới hạn của hàm số $N(t) = (100t)/(t + 2)$ khi thời gian $t$ tiến ra vô cùng ($t -> +oo$):]
    #step[$ lim_limits(t -> +oo) N(t) = lim_limits(t -> +oo) (100t)/(t + 2) = lim_limits(t -> +oo) 100 / (1 + 2/t) = 100 $]
    #step[Đồ thị hàm số $N(t)$ nhận đường thẳng $y = 100$ làm tiệm cận ngang.]
    #step[Như vậy, khi thời gian nuôi cấy tăng lên rất lớn, số lượng vi khuẩn sẽ tiến dần đến mức giới hạn là $100$ triệu con.]
  ]
)

// ─── CÂU 7 ───
#tn(
  dir: "ngang",
  [Mức tiêu thụ nhiên liệu của một chiếc ô tô chạy với vận tốc không đổi $v$ (km/h) được mô tả bởi hàm số $F(v) = 2v + 1800/v$ (lít/100km) trên quãng đường dài. Vận tốc tối ưu để xe tiêu thụ ít nhiên liệu nhất trên mỗi 100 km hành trình là:],
  (
    [$20$ km/h],
    True([$30$ km/h]),
    [$40$ km/h],
    [$50$ km/h]
  ),
  loigiai: [

    #step[Xét hàm số tiêu thụ nhiên liệu $F(v) = 2v + 1800/v$ với $v > 0$.]
    #step[Đạo hàm của hàm số:]
    #step[$ F'(v) = 2 - 1800/v^2 = (2(v^2 - 900))/v^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ F'(v) = 0 <=> v^2 - 900 = 0 <=> v = 30 " (do " v > 0 ")" $]
    #step[Khảo sát sự biến thiên của hàm số $F(v)$ trên khoảng $(0; +oo)$:]
    #step[- Với $v in (0; 30)$, ta có $F'(v) < 0$ nên hàm số nghịch biến trên khoảng $(0; 30)$.]
    #step[- Với $v in (30; +oo)$, ta có $F'(v) > 0$ nên hàm số đồng biến trên khoảng $(30; +oo)$.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $v = 30$.]
    #step[Vậy vận tốc tối ưu để xe tiêu thụ ít nhiên liệu nhất là $30$ km/h.]
  ]
)

// ─── CÂU 8 ───
#tn(
  dir: "ngang",
  [Nhiệt độ của một tách cà phê nóng sau $t$ phút đặt trong phòng được mô tả bởi công thức giảm nhiệt $T(t) = 25 + 70 e^(-0.2t)$ (°C). Sau thời gian rất dài, nhiệt độ của tách cà phê tiến dần về nhiệt độ phòng là:],
  (
    True([$25$ °C]),
    [$30$ °C],
    [$20$ °C],
    [$35$ °C]
  ),
  loigiai: [

    #step[Ta tìm giới hạn của nhiệt độ tách cà phê $T(t)$ khi thời gian $t$ tiến ra vô cùng ($t -> +oo$):]
    #step[$ lim_limits(t -> +oo) T(t) = lim_limits(t -> +oo) (25 + 70 e^(-0.2t)) $]
    #step[Vì $lim_limits(t -> +oo) e^(-0.2t) = 0$, ta thu được:]
    #step[$ lim_limits(t -> +oo) T(t) = 25 + 70 dot 0 = 25 $]
    #step[Vậy sau thời gian rất dài, tách cà phê sẽ nguội dần và tiến về nhiệt độ phòng là $25$ °C.]
  ]
)

// ─── CÂU 9 ───
#tn(
  dir: "ngang",
  [Một công ty muốn sản xuất các lon sữa hình trụ có thể tích $V = 128 pi$ cm³. Để tiết kiệm nguyên liệu nhất, diện tích toàn phần của lon sữa phải nhỏ nhất. Khi đó bán kính đáy $r$ của lon sữa bằng:],
  (
    [$3$ cm],
    True([$4$ cm]),
    [$5$ cm],
    [$6$ cm]
  ),
  loigiai: [

    #step[Thiết lập hàm diện tích:]
    #step[Gọi bán kính đáy lon sữa là $r$ (cm, $r > 0$) và chiều cao lon sữa là $h$ (cm, $h > 0$).]
    #step[Thể tích lon sữa: $V = pi r^2 h = 128 pi => h = 128/r^2$.]
    #step[Diện tích toàn phần của lon sữa hình trụ có nắp là:]
    #step[$ S_("tp")(r) = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r dot 128/r^2 = 2 pi r^2 + 256 pi / r $]
    #step[Khảo sát hàm số $S_("tp")(r)$ trên khoảng $(0; +oo)$:]
    #step[Đạo hàm:]
    #step[$ S'_("tp")(r) = 4 pi r - 256 pi / r^2 = (4 pi (r^3 - 64))/r^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'_("tp")(r) = 0 <=> r^3 - 64 = 0 <=> r = 4 " (cm)" $]
    #step[Khảo sát sự biến thiên của hàm số $S_("tp")(r)$ trên khoảng $(0; +oo)$:]
    #step[- Với $r in (0; 4)$, ta có $S'_("tp")(r) < 0$ nên hàm số nghịch biến.]
    #step[- Với $r in (4; +oo)$, ta có $S'_("tp")(r) > 0$ nên hàm số đồng biến.]
    #step[Suy ra hàm số đạt giá trị nhỏ nhất tại $r = 4$.]
    #step[Vậy bán kính đáy để tiết kiệm nguyên liệu nhất là $4$ cm.]
  ]
)

// ─── CÂU 10 ───
#tn(
  dir: "ngang",
  [Quãng đường rơi tự do của một vật nặng được tính theo thời gian $t$ (giây) bởi công thức $s(t) = 4.9 t^2$ (mét). Tốc độ tức thời của vật tại thời điểm $t = 3$ giây là:],
  (
    [$14.7$ m/s],
    [$9.8$ m/s],
    True([$29.4$ m/s]),
    [$19.6$ m/s]
  ),
  loigiai: [

    #step[Tốc độ tức thời của vật tại thời điểm $t$ chính là đạo hàm của quãng đường theo thời gian:]
    #step[$ v(t) = s'(t) = (4.9 t^2)' = 9.8 t " (m/s)" $]
    #step[Tại thời điểm $t = 3$ giây, tốc độ tức thời của vật là:]
    #step[$ v(3) = 9.8 dot 3 = 29.4 " (m/s)" $]
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// ─── CÂU 1 ───
#ds(
  dir: "doc",lines: 4,
  [Một mảnh vườn hình chữ nhật được bao quanh bởi một bức tường xây sẵn ở một phía, và ba phía còn lại được rào bằng lưới thép. Chiều dài lưới thép có sẵn là $160$ m. Gọi $x$ (m) là chiều rộng mảnh vườn (phần rào lưới vuông góc với bức tường). Diện tích vườn là $S(x)$ (m²). Khi đó:],
  (
    True([Tập xác định của hàm số diện tích $S(x)$ là khoảng $(0; 80)$]),
    True([Công thức tính diện tích mảnh vườn là $S(x) = 160x - 2x^2$]),
    True([Đồ thị hàm số diện tích $S(x)$ có tọa độ đỉnh parabol là $I(40; 3200)$]),
    True([Diện tích vườn lớn nhất là $3200$ m² khi chiều dài mảnh vườn song song với bức tường bằng $80$ m])
  ),
  loigiai: [

    #step[Gọi $x$ (m) là chiều rộng mảnh vườn vuông góc với bức tường ($x > 0$).]
    #step[Vì tổng chiều dài lưới rào ba phía là $160$ m nên chiều dài song song với bức tường là $160 - 2x$ (m).]
    #step[- *Ý a):* Để kích thước mảnh vườn hợp lệ thì:]
    #step[$ heva(x > 0, 160 - 2x > 0) <=> 0 < x < 80 $]
    #step[Vậy tập xác định của $S(x)$ là khoảng $(0; 80)$. $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Diện tích mảnh vườn được tính theo công thức:]
    #step[$ S(x) = x(160 - 2x) = 160x - 2x^2 " (m²)" $]
    #step[$arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Xét hàm số $S(x) = -2x^2 + 160x$ trên khoảng $(0; 80)$.]
    #step[Đạo hàm: $S'(x) = -4x + 160$.]
    #step[Giải phương trình đạo hàm: $S'(x) = 0 <=> x = 40$ (m).]
    #step[Bảng biến thiên chỉ ra hàm số đạt cực đại tại $x = 40$.]
    #step[Giá trị cực đại là $S(40) = 160 dot 40 - 2 dot 40^2 = 3200$ (m²).]
    #step[Tọa độ đỉnh parabol của đồ thị là $I(40; 3200)$. $arrow.r$ *Ý c) Đúng.*]
    #step[- *Ý d):* Diện tích vườn lớn nhất là $3200$ m² tại chiều rộng $x = 40$ m.]
    #step[Khi đó chiều dài mảnh vườn song song với bức tường là $160 - 2 dot 40 = 80$ m. $arrow.r$ *Ý d) Đúng.*]
  ]
)

// ─── CÂU 2 ───
#ds(
  dir: "doc",lines: 4,
  [Nồng độ cồn trong máu (BAC) của một người lái xe sau $t$ giờ kể từ lúc uống rượu được tính bởi công thức $A(t) = (0.8t)/(t^2 + 1)$ (g/L) với $t >= 0$. Theo quy định pháp luật, người lái xe chỉ được phép tham gia giao thông khi nồng độ cồn trong máu dưới $0.08$ g/L. Khi đó:],
  (
    True([Đồ thị hàm số $A(t)$ nhận đường thẳng $y = 0$ làm tiệm cận ngang]),
    True([Nồng độ cồn trong máu của người lái xe đạt mức cao nhất sau $1$ giờ uống rượu]),
    [Nồng độ cồn lớn nhất đạt được của người này là $0.8$ g/L],
    True([Sau ít nhất $9.9$ giờ kể từ lúc uống rượu, người lái xe mới có thể lái xe hợp pháp])
  ),
  loigiai: [

    #step[Xét hàm số nồng độ cồn $A(t) = (0.8t)/(t^2 + 1)$ trên nửa khoảng $[0; +oo)$.]
    #step[- *Ý a):* Ta có giới hạn khi thời gian tăng lên rất lớn:]
    #step[$ lim_limits(t -> +oo) A(t) = lim_limits(t -> +oo) (0.8t)/(t^2 + 1) = 0 $]
    #step[Do đó đồ thị hàm số nhận đường thẳng $y = 0$ làm tiệm cận ngang. $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Tính đạo hàm của hàm số:]
    #step[$ A'(t) = (0.8(t^2 + 1) - 0.8t dot 2t) / (t^2 + 1)^2 = (0.8(1 - t^2)) / (t^2 + 1)^2 $]
    #step[Giải phương trình đạo hàm: $A'(t) = 0 <=> 1 - t^2 = 0 <=> t = 1$ (do $t >= 0$).]
    #step[Khảo sát biến thiên:]
    #step[- Với $t in [0; 1)$, ta có $A'(t) > 0$ nên hàm số đồng biến.]
    #step[- Với $t in (1; +oo)$, ta có $A'(t) < 0$ nên hàm số nghịch biến.]
    #step[Do đó nồng độ cồn đạt cực đại sau $1$ giờ uống rượu. $arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Nồng độ cồn lớn nhất đạt được là:]
    #step[$ A(1) = (0.8 dot 1) / (1^2 + 1) = 0.4 " (g/L)" $]
    #step[Đề ghi là $0.8$ g/L. $arrow.r$ *Ý c) Sai.*]
    #step[- *Ý d):* Người lái xe được phép lái xe khi:]
    #step[$ A(t) < 0.08 <=> (0.8t)/(t^2 + 1) < 0.08 <=> 0.08 t^2 - 0.8t + 0.08 > 0 <=> t^2 - 10t + 1 > 0 $]
    #step[Giải bất phương trình bậc hai với điều kiện $t >= 0$, ta thu được nghiệm:]
    #step[$ t > 5 + 2 sqrt(6) approx 9.9 " (giờ)" $]
    #step[Vậy sau ít nhất $9.9$ giờ, người lái xe mới được tham gia giao thông hợp pháp. $arrow.r$ *Ý d) Đúng.*]
  ]
)

// ─── CÂU 3 ───
#ds(
  dir: "doc",lines: 4,
  [Một doanh nghiệp độc quyền sản xuất một mặt hàng với hàm cầu là $p = 100 - x$ và hàm tổng chi phí là $C(x) = x^2 + 20x$ (trong đó $x$ là số lượng sản phẩm sản xuất, $p$ và $C$ tính bằng nghìn đồng). Chính phủ đánh thuế $t$ (nghìn đồng) trên mỗi sản phẩm bán ra và doanh nghiệp độc quyền cộng thêm thuế vào chi phí, tức là tổng chi phí mới là $C_("mới")(x) = C(x) + t x$. Do doanh nghiệp luôn chọn sản lượng $x$ để tối đa hóa lợi nhuận nên:],
  (
    True([Lợi nhuận của doanh nghiệp đạt giá trị lớn nhất khi sản lượng sản xuất thỏa mãn $x = 20 - t/4$]),
    True([Tổng số tiền thuế chính phủ thu được biểu diễn theo thuế suất $t$ là $T(t) = 20t - t^2/4$ (nghìn đồng)]),
    [Để số tiền thuế chính phủ thu được là lớn nhất thì thuế suất phải bằng $20$ nghìn đồng/sản phẩm],
    True([Lợi nhuận lớn nhất của doanh nghiệp khi chính phủ thu thuế tối đa là $200$ nghìn đồng])
  ),
  loigiai: [

    #step[Doanh thu của doanh nghiệp độc quyền là $R(x) = x p = -x^2 + 100x$.]
    #step[Lợi nhuận của doanh nghiệp sau khi tính thuế là:]
    #step[$ P(x) = R(x) - C_("mới")(x) = -x^2 + 100x - (x^2 + 20x + t x) = -2x^2 + (80 - t)x $]
    #step[- *Ý a):* Xét hàm số lợi nhuận $P(x)$ theo biến $x$:]
    #step[Đạo hàm theo $x$: $P'_x(x) = -4x + 80 - t$.]
    #step[Cho $P'_x(x) = 0 <=> x = 20 - t/4$.]
    #step[Bảng biến thiên của hàm số bậc hai này chỉ ra lợi nhuận lớn nhất đạt được khi sản lượng $x = 20 - t/4$. $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Tổng số tiền thuế chính phủ thu được là:]
    #step[$ T(t) = t x = t(20 - t/4) = 20t - t^2/4 " (nghìn đồng)" $]
    #step[$arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Xét hàm số thu thuế của chính phủ $T(t) = 20t - 1/4 t^2$ trên khoảng $(0; 80)$.]
    #step[Đạo hàm theo $t$: $T'(t) = 20 - t/2$.]
    #step[Cho $T'(t) = 0 <=> t = 40$ (nghìn đồng/sản phẩm).]
    #step[Bảng biến thiên chỉ ra số tiền thuế đạt giá trị lớn nhất tại mức thuế suất $t = 40$ nghìn đồng. Đề ghi thuế suất bằng $20$ nghìn đồng. $arrow.r$ *Ý c) Sai.*]
    #step[- *Ý d):* Khi chính phủ thu thuế tối đa ($t = 40$), doanh nghiệp sẽ sản xuất sản lượng là $x = 20 - 40/4 = 10$ (sản phẩm).]
    #step[Lợi nhuận lớn nhất của doanh nghiệp lúc này là:]
    #step[$ P(10) = -2 dot 10^2 + (80 - 40) dot 10 = 200 " (nghìn đồng)" $]
    #step[$arrow.r$ *Ý d) Đúng.*]
  ]
)

// ─── CÂU 4 ───
#ds(
  dir: "doc",lines: 4,
  [Mô hình lượng sản phẩm cung ứng $S(p) = 4p - 10$ và lượng cầu tiêu dùng $D(p) = 30 / (p + 1)$ của một mặt hàng điện tử phụ thuộc vào đơn giá $p$ (triệu đồng/sản phẩm), với $p >= 2.5$. Khi đó:],
  (
    True([Khi đơn giá sản phẩm tăng lên thì lượng cung tăng và lượng cầu giảm]),
    True([Thị trường cân bằng cung - cầu tại đơn giá $p = 4$ triệu đồng]),
    [Doanh thu tối đa tại điểm cân bằng cung - cầu là $15$ triệu đồng],
    True([Khi đơn giá $p$ tiến tới vô hạn thì lượng cầu tiêu dùng tiến dần về $0$])
  ),
  loigiai: [

    #step[Xét các hàm cung $S(p) = 4p - 10$ và cầu $D(p) = 30/(p + 1)$ với $p >= 2.5$.]
    #step[- *Ý a):* Ta có $S'(p) = 4 > 0$ nên hàm cung đồng biến (đơn giá tăng, lượng cung tăng).]
    #step[Đạo hàm $D'(p) = -30/((p+1)^2) < 0$ nên hàm cầu nghịch biến (đơn giá tăng, lượng cầu giảm). $arrow.r$ *Ý a) Đúng.*]
    #step[- *Ý b):* Thị trường cân bằng khi lượng cung bằng lượng cầu:]
    #step[$ 4p - 10 = 30/(p+1) <=> (4p - 10)(p+1) = 30 <=> 2p^2 - 3p - 20 = 0 $]
    #step[Giải phương trình bậc hai với điều kiện $p >= 2.5$, ta nhận nghiệm $p = 4$ (triệu đồng). $arrow.r$ *Ý b) Đúng.*]
    #step[- *Ý c):* Tại điểm cân bằng cung - cầu $p = 4$, lượng hàng hóa bán ra là $S(4) = 6$ (sản phẩm).]
    #step[Doanh thu đạt được tại đây là:]
    #step[$ R = p dot S(p) = 4 dot 6 = 24 " (triệu đồng)" $]
    #step[Đề ghi là $15$ triệu đồng. $arrow.r$ *Ý c) Sai.*]
    #step[- *Ý d):* Tìm giới hạn của lượng cầu khi đơn giá tăng rất lớn:]
    #step[$ lim_limits(p -> +oo) D(p) = lim_limits(p -> +oo) 30/(p + 1) = 0 $]
    #step[$arrow.r$ *Ý d) Đúng.*]
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: auto)

// ─── CÂU 1 ───
#tln(
  dir: "ngang",
  [Một xưởng in tranh cần thiết kế một trang sách hình chữ nhật có diện tích phần in ấn bên trong là $384$ cm². Biết lề trên và lề dưới rộng $3$ cm, lề trái và lề phải rộng $2$ cm. Chiều rộng của trang sách (tính bằng cm) sao cho diện tích của toàn bộ trang sách là nhỏ nhất bằng bao nhiêu?],
  [$20$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Gọi $x$ (cm) và $y$ (cm) lần lượt là chiều rộng và chiều dài của phần in ấn bên trong ($x > 0, y > 0$).]
    #step[Ta có: $x y = 384 => y = 384/x$.]
    #step[Chiều rộng của toàn bộ trang sách là $x + 4$ (cm).]
    #step[Chiều dài của toàn bộ trang sách là $y + 6 = 384/x + 6$ (cm).]
    #step[Diện tích của toàn bộ trang sách là:]
    #step[$ S(x) = (x + 4)(384/x + 6) = 408 + 6x + 1536/x " (cm²)" $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số $S(x)$ trên khoảng $(0; +oo)$.]
    #step[Đạo hàm:]
    #step[$ S'(x) = 6 - 1536/x^2 = (6(x^2 - 256))/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'(x) = 0 <=> x^2 - 256 = 0 <=> x = 16 " (do " x > 0 ")" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $S(x)$ trên $(0; +oo)$:]
    #step[- Với $x in (0; 16)$, ta có $S'(x) < 0$ nên hàm số nghịch biến.]
    #step[- Với $x in (16; +oo)$, ta có $S'(x) > 0$ nên hàm số đồng biến.]
    #step[Do đó, diện tích toàn bộ trang sách nhỏ nhất tại $x = 16$ cm.]
    #step[Chiều rộng tương ứng của toàn bộ trang sách là $x + 4 = 16 + 4 = 20$ cm.]
    #step[Đáp số: $20$.]
  ]
)

// ─── CÂU 2 ───
#tln(
  dir: "ngang",
  [Một người muốn xây một hố chứa rác hình hộp chữ nhật không nắp có thể tích $72$ m³, đáy là hình chữ nhật có chiều dài gấp đôi chiều rộng. Chi phí thuê nhân công xây dựng đáy hố là $300$ nghìn đồng/m² và xây dựng bốn thành hố là $150$ nghìn đồng/m². Chi phí thuê nhân công xây dựng thấp nhất của hố chứa rác là bao nhiêu triệu đồng?],
  [$16.2$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Gọi $x$ (m, $x > 0$) là chiều rộng đáy hố. Chiều dài đáy tương ứng là $2x$ (m).]
    #step[Gọi $h$ (m, $h > 0$) là chiều cao của hố rác.]
    #step[Thể tích hố: $V = 2x^2 h = 72 => h = 36/x^2$.]
    #step[Diện tích đáy hố: $S_("đáy") = 2x^2$ (m²).]
    #step[Diện tích bốn thành hố: $S_("xq") = 2(x h + 2x h) = 6x h = 6x dot 36/x^2 = 216/x$ (m²).]
    #step[Tổng chi phí nhân công xây dựng hố là:]
    #step[$ C(x) = 300 dot 2x^2 + 150 dot 216/x = 600x^2 + 32400/x " (nghìn đồng)" $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số $C(x)$ trên khoảng $(0; +oo)$.]
    #step[Đạo hàm:]
    #step[$ C'(x) = 1200x - 32400/x^2 = (1200(x^3 - 27))/x^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ C'(x) = 0 <=> x^3 - 27 = 0 <=> x = 3 " (do " x > 0 ")" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $C(x)$ trên $(0; +oo)$:]
    #step[- Với $x in (0; 3)$, ta có $C'(x) < 0$ nên hàm số nghịch biến.]
    #step[- Với $x in (3; +oo)$, ta có $C'(x) > 0$ nên hàm số đồng biến.]
    #step[Do đó, chi phí xây dựng thấp nhất khi kích thước chiều rộng đáy $x = 3$ m.]
    #step[Chi phí thấp nhất tương ứng:]
    #step[$ C(3) = 600 dot 3^2 + 32400/3 = 16200 " (nghìn đồng)" = 16.2 " (triệu đồng)" $]
    #step[Đáp số: $16.2$.]
  ]
)

// ─── CÂU 3 ───
#tln(
  dir: "ngang",
  [Một sợi dây kim loại dài $100$ cm được cắt thành hai phần. Phần thứ nhất được uốn thành một hình vuông cạnh $a$, phần thứ hai được uốn thành một hình tròn bán kính $r$. Tổng diện tích của hai hình này có giá trị nhỏ nhất bằng bao nhiêu xăng-ti-mét vuông (lấy $pi approx 3.14$, làm tròn kết quả đến hàng đơn vị)?],
  [$350$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Tổng chu vi hai hình là chiều dài sợi dây:]
    #step[$ 4a + 2 pi r = 100 <=> 2a + pi r = 50 => a = (50 - pi r)/2 $]
    #step[Tổng diện tích của hình vuông và hình tròn là:]
    #step[$ S(r) = a^2 + pi r^2 = ((50 - pi r)/2)^2 + pi r^2 = (pi^2/4 + pi)r^2 - 25 pi r + 625 $]
    #step[Điều kiện: $0 < r < 50/pi$.]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Đạo hàm của $S(r)$ theo bán kính $r$:]
    #step[$ S'(r) = 2(pi^2/4 + pi)r - 25 pi = (pi^2/2 + 2 pi)r - 25 pi $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'(r) = 0 <=> r = (25 pi) / (pi^2/2 + 2 pi) = 50 / (pi + 4) " (cm)" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số bậc hai $S(r)$ trên khoảng $(0; 50/pi)$:]
    #step[- Với $r in (0; 50/(pi+4))$, ta có $S'(r) < 0$ nên hàm số nghịch biến.]
    #step[- Với $r in (50/(pi+4); 50/pi)$, ta có $S'(r) > 0$ nên hàm số đồng biến.]
    #step[Do đó, tổng diện tích nhỏ nhất khi bán kính hình tròn là $r = 50 / (pi + 4)$ cm.]
    #step[Với $pi approx 3.14$:]
    #step[$ r approx 50 / 7.14 approx 7.00 " (cm)" $]
    #step[$ a = (50 - 3.14 dot 7.00) / 2 approx 14.01 " (cm)" $]
    #step[Tổng diện tích nhỏ nhất:]
    #step[$ S_("min") approx 14.01^2 + 3.14 dot 7.00^2 approx 350.14 " (cm²)" $]
    #step[Làm tròn đến hàng đơn vị được $350$.]
    #step[Đáp số: $350$.]
  ]
)

// ─── CÂU 4 ───
#tln(
  dir: "ngang",
  [Một cửa sổ gồm phần dưới là hình chữ nhật và phần trên là một nửa hình tròn. Biết chu vi của cửa sổ bằng $4$ m. Chiều rộng $x$ (m) của cửa sổ sao cho diện tích của cửa sổ đón được nhiều ánh sáng nhất bằng bao nhiêu mét (lấy $pi approx 3.14$, làm tròn kết quả đến hai chữ số thập phân)?],
  [$1.12$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Gọi chiều rộng của cửa sổ là $x$ (m, $x > 0$), bán kính của nửa hình tròn phía trên là $r = x/2$ (m).]
    #step[Gọi chiều cao của phần hình chữ nhật phía dưới là $h$ (m, $h > 0$).]
    #step[Chu vi của toàn bộ cửa sổ:]
    #step[$ P = x + 2h + pi r = x + 2h + (pi x)/2 = (1 + pi/2)x + 2h = 4 $]
    #step[Suy ra:]
    #step[$ h = 2 - (1/2 + pi/4)x $]
    #step[Điều kiện: $h > 0 <=> (1/2 + pi/4)x < 2 <=> x < 8 / (2 + pi)$.]
    #step[Diện tích đón ánh sáng của cửa sổ là:]
    #step[$ S(x) = x h + 1/2 pi r^2 = x(2 - (1/2 + pi/4)x) + 1/2 pi (x/2)^2 = 2x - (1/2 + pi/8)x^2 $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số $S(x)$ trên khoảng $(0; 8/(2+pi))$.]
    #step[Đạo hàm:]
    #step[$ S'(x) = 2 - 2(1/2 + pi/8)x = 2 - (1 + pi/4)x $]
    #step[Giải phương trình đạo hàm:]
    #step[$ S'(x) = 0 <=> x = 2 / (1 + pi/4) = 8 / (4 + pi) " (m)" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $S(x)$ trên $(0; 8/(2+pi))$:]
    #step[- Với $x in (0; 8/(4+pi))$, ta có $S'(x) > 0$ nên hàm số đồng biến.]
    #step[- Với $x in (8/(4+pi); 8/(2+pi))$, ta có $S'(x) < 0$ nên hàm số nghịch biến.]
    #step[Do đó, diện tích cửa sổ lớn nhất khi chiều rộng cửa sổ là:]
    #step[$ x = 8 / (4 + pi) " (m)" $]
    #step[Với $pi approx 3.14$:]
    #step[$ x approx 8 / (4 + 3.14) = 8 / 7.14 approx 1.12 " (m)" $]
    #step[Đáp số: $1.12$.]
  ]
)

// ─── CÂU 5 ───
#tln(
  dir: "ngang",
  [Nồng độ oxy hòa tan trong một con sông sau $t$ ngày kể từ lúc xảy ra sự cố xả thải hữu cơ được tính theo công thức $O(t) = 10 - (8t)/(t^2 + 4)$ (mg/L). Khoảng thời gian $t$ (ngày) để nồng độ oxy hòa tan trong sông đạt mức thấp nhất là bao nhiêu?],
  [$2$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Xét hàm số nồng độ oxy $O(t) = 10 - (8t)/(t^2 + 4)$ trên miền $t >= 0$.]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Đạo hàm của hàm số:]
    #step[$ O'(t) = - ( 8(t^2 + 4) - 8t dot 2t ) / (t^2 + 4)^2 = (8(t^2 - 4)) / (t^2 + 4)^2 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ O'(t) = 0 <=> t^2 - 4 = 0 <=> t = 2 " (do " t >= 0 ")" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $O(t)$ trên $[0; +oo)$:]
    #step[- Với $t in [0; 2)$, ta có $O'(t) < 0$ nên hàm số nghịch biến.]
    #step[- Với $t in (2; +oo)$, ta có $O'(t) > 0$ nên hàm số đồng biến.]
    #step[Do đó, nồng độ oxy hòa tan trong sông đạt giá trị thấp nhất tại thời điểm $t = 2$ ngày.]
    #step[Đáp số: $2$.]
  ]
)

// ─── CÂU 6 ───
#tln(
  dir: "ngang",
  [Tàu $A$ cách cảng $O$ một khoảng $10$ km về phía bắc và bắt đầu di chuyển về phía nam (hướng về cảng $O$) với vận tốc $20$ km/h. Cùng lúc đó, tàu $B$ bắt đầu di chuyển từ cảng $O$ về phía đông với vận tốc $15$ km/h. Khoảng cách ngắn nhất giữa hai tàu trong suốt hành trình di chuyển bằng bao nhiêu km?],
  [$6$],
  loigiai: [

    #step[*Bước 1 (Thiết lập hàm số):*]
    #step[Chọn hệ trục tọa độ vuông góc $O x y$, gốc tọa độ ở cảng $O$, hướng Đông là chiều dương $O x$, hướng Bắc là chiều dương $O y$.]
    #step[Sau $t$ giờ di chuyển ($t >= 0$):]
    #step[- Tàu $A$ có tọa độ là $(0; 10 - 20t)$.]
    #step[- Tàu $B$ có tọa độ là $(15t; 0)$.]
    #step[Khoảng cách giữa hai tàu được tính bởi:]
    #step[$ d(t) = sqrt((15t)^2 + (10 - 20t)^2) = sqrt(625t^2 - 400t + 100) " (km)" $]
    #step[*Bước 2 (Khảo sát cực trị):*]
    #step[Xét hàm số dưới dấu căn $f(t) = 625t^2 - 400t + 100$ trên $[0; +oo)$.]
    #step[Đạo hàm:]
    #step[$ f'(t) = 1250t - 400 $]
    #step[Giải phương trình đạo hàm:]
    #step[$ f'(t) = 0 <=> t = 400 / 1250 = 0.32 " (giờ)" $]
    #step[*Bước 3 (Kết luận):*]
    #step[Khảo sát sự biến thiên của hàm số $f(t)$ trên $[0; +oo)$:]
    #step[- Với $t in [0; 0.32)$, ta có $f'(t) < 0$ nên hàm số nghịch biến.]
    #step[- Với $t in (0.32; +oo)$, ta có $f'(t) > 0$ nên hàm số đồng biến.]
    #step[Do đó, khoảng cách nhỏ nhất giữa hai tàu đạt được tại $t = 0.32$ giờ.]
    #step[Khoảng cách tối thiểu tương ứng:]
    #step[$ d_("min") = sqrt(f(0.32)) = sqrt(625 dot 0.32^2 - 400 dot 0.32 + 100) = sqrt(36) = 6 " (km)" $]
    #step[Đáp số: $6$.]
  ]
)

