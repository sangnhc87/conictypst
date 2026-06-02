#import "_config.typ": *

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 04 - ĐƠN ĐIỆU TRONG BỐI CẢNH THỰC TẾ]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (6 câu)], count: 6)

#q-wrap(dir: "doc", tn(
  [Lượng người dùng của một ứng dụng sau $t$ tháng được mô hình bởi
    $N(t) = (120t)/(t + 3)$ với $t >= 0$.
    Trong miền thời gian khảo sát, lượng người dùng biến thiên như thế nào?],
  (
    True([Đồng biến trên $(0; +oo)$]),
    [Nghịch biến trên $(0; +oo)$],
    [Đồng biến trên $(0; 3)$ rồi nghịch biến trên $(3; +oo)$],
    [Không đơn điệu trên miền khảo sát],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $N'(t) = 360/(t + 3)^2$.]
    #step[Với mọi $t >= 0$, ta có $N'(t) > 0$.]
    #step[Vì vậy lượng người dùng đồng biến trên toàn miền khảo sát $(0; +oo)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Chi phí trung bình để sản xuất một lô hàng được cho bởi
    $A(x) = 45 + 900/x$ với $x > 0$.
    Kết luận nào sau đây đúng?],
  (
    [Hàm số đồng biến trên $(0; +oo)$],
    True([Hàm số nghịch biến trên $(0; +oo)$]),
    [Hàm số nghịch biến trên $(0; 45)$ rồi đồng biến trên $(45; +oo)$],
    [Hàm số không đổi trên $(0; +oo)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $A'(x) = -900/x^2$.]
    #step[Với mọi $x > 0$, ta có $A'(x) < 0$.]
    #step[Do đó chi phí trung bình nghịch biến trên $(0; +oo)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nồng độ thuốc trong máu của một bệnh nhân sau $t$ giờ được mô hình bởi
    $C(t) = 5 t e^(-t)$ với $t >= 0$.
    Nồng độ thuốc tăng trong khoảng thời gian nào?],
  (
    [$(1; +oo)$],
    True([$(0; 1)$]),
    [$(0; +oo)$],
    [$(0; 5)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $C'(t) = 5 e^(-t) (1 - t)$.]
    #step[Vì $e^(-t) > 0$, nên $C'(t) > 0 <=> 1 - t > 0 <=> t < 1$.]
    #step[Kết hợp với $t >= 0$, nồng độ thuốc tăng trên khoảng $(0; 1)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Diện tích vùng phủ hiệu quả của một trạm phát sóng phụ thuộc vào công suất điều chỉnh $x$ theo công thức
    $H(x) = sqrt(12x - x^2)$ với $0 <= x <= 12$.
    Hàm số nghịch biến trên khoảng nào?],
  (
    [$(0; 6)$],
    True([$(6; 12)$]),
    [$(0; 12)$],
    [Không có khoảng nghịch biến],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $H'(x) = (6 - x)/sqrt(12x - x^2)$.]
    #step[Trên miền xác định đang xét, $H'(x) < 0 <=> x > 6$.]
    #step[Vậy hàm số nghịch biến trên khoảng $(6; 12)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Mức tiêu hao nhiên liệu của một xe tải theo vận tốc trung bình $v$ được mô hình bởi
    $Q(v) = v^2 - 10v + 80$ với $0 < v <= 20$.
    Trong khoảng nào mức tiêu hao nhiên liệu giảm khi vận tốc tăng?],
  (
    True([$(0; 5)$]),
    [$(5; 20)$],
    [$(0; 20)$],
    [Không có khoảng nào],
  ),
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $Q'(v) = 2v - 10$.]
    #step[Ta có $Q'(v) < 0 <=> v < 5$.]
    #step[Kết hợp với miền thực tế $0 < v <= 20$, mức tiêu hao nhiên liệu giảm trên khoảng $(0; 5)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nhu cầu thị trường $D(p)$ theo giá bán $p$ có bảng xét dấu đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $p$,
        func: $D'$,
        x-vals: ($0$, $20$, $35$, $+oo$),
        f-signs: ($+$, $0$, $-$, $0$, $+$),
      )
    ]
    Nhu cầu thị trường giảm trên khoảng nào?],
  (
    [$(0; 20)$],
    True([$(20; 35)$]),
    [$(35; +oo)$],
    [Không có khoảng nào],
  ),
  accent: c-book,
  loigiai: [
    #step[Từ bảng xét dấu, ta thấy $D'(p) < 0$ trên khoảng $(20; 35)$.]
    #step[Do đó khi giá bán nằm trong khoảng $(20; 35)$ thì nhu cầu thị trường giảm dần theo $p$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng/Sai (2 câu)], count: 2)

#q-wrap(dir: "ngang", ds(
  [Cho nồng độ thuốc trong máu được mô hình bởi
    $C(t) = 5 t e^(-t)$ với $t >= 0$.
    Xét các phát biểu sau:],
  (
    True([Nồng độ thuốc tăng trên khoảng $(0; 1)$.]),
    True([Nồng độ thuốc giảm trên khoảng $(1; +oo)$.]),
    [Nồng độ thuốc đồng biến trên toàn bộ miền $t >= 0$.],
    True([Tại $t = 1$, xu hướng biến thiên chuyển từ tăng sang giảm.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Vì $C'(t) = 5 e^(-t) (1 - t) > 0$ khi $0 < t < 1$.
    - b) Đúng. Với $t > 1$ thì $1 - t < 0$, nên $C'(t) < 0$.
    - c) Sai. Hàm số tăng trên $(0; 1)$ nhưng giảm trên $(1; +oo)$.
    - d) Đúng. Dấu của đạo hàm đổi từ dương sang âm khi qua $t = 1$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho chi phí trung bình của một xưởng sản xuất là
    $A(x) = 45 + 900/x$ với $x > 0$.
    Xét các phát biểu sau:],
  (
    True([Hàm số xác định trên miền $x > 0$.]),
    True([Khi sản lượng tăng, chi phí trung bình giảm dần.]),
    [Nếu sản lượng tăng từ $30$ lên $60$ thì chi phí trung bình tăng.],
    [Hàm số có một khoảng đồng biến trên miền thực tế.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Điều kiện xác định của biểu thức là $x > 0$.
    - b) Đúng. Vì $A'(x) = -900/x^2 < 0$ với mọi $x > 0$.
    - c) Sai. Hàm số nghịch biến trên toàn miền thực tế nên khi sản lượng tăng, chi phí trung bình giảm.
    - d) Sai. Trên miền $x > 0$, hàm số luôn nghịch biến, không có khoảng đồng biến nào.
  ],
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (4 câu)], count: 4)

#q-wrap(dir: "ngang", tln(
  [Lượng chất ô nhiễm còn lại trong một bể xử lí sau $t$ giờ được mô hình bởi
    $M(t) = 3000/(t + 5)$ với $t >= 0$.
    Hãy cho biết đại lượng này giảm trên khoảng nào của thời gian.],
  [$(0; +oo)$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $M'(t) = -3000/(t + 5)^2$.]
    #step[Với mọi $t >= 0$, ta có $M'(t) < 0$.]
    #step[Vì vậy lượng chất ô nhiễm giảm trên khoảng $(0; +oo)$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Diện tích một vùng phủ năng lượng phụ thuộc vào công suất điều chỉnh $x$ theo công thức
    $E(x) = sqrt(16x - x^2)$ với $0 <= x <= 16$.
    Hãy nêu khoảng mà diện tích này tăng.],
  [$(0; 8)$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $E'(x) = (8 - x)/sqrt(16x - x^2)$.]
    #step[Ta có $E'(x) > 0 <=> x < 8$.]
    #step[Kết hợp với miền xác định, diện tích tăng trên khoảng $(0; 8)$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Mức hấp thụ dinh dưỡng của cây trồng sau $t$ tuần được mô hình bởi
    $P(t) = 8 t e^(-2t)$ với $t >= 0$.
    Trong khoảng thời gian nào mức hấp thụ này tăng?],
  [$(0; 1/2)$],
  accent: c-book,
  loigiai: [
    #step[Tính đạo hàm: $P'(t) = 8 e^(-2t) (1 - 2t)$.]
    #step[Vì $e^(-2t) > 0$, nên $P'(t) > 0 <=> 1 - 2t > 0 <=> t < 1/2$.]
    #step[Do đó mức hấp thụ dinh dưỡng tăng trên khoảng $(0; 1/2)$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Doanh thu $R(x)$ theo mức đầu tư quảng cáo $x$ có bảng xét dấu đạo hàm như sau:
    #align(center)[
      #my-bxd(
        var: $x$,
        func: $R'$,
        x-vals: ($0$, $2$, $5$, $+oo$),
        f-signs: ($+$, $0$, $-$, $0$, $+$),
      )
    ]
    Hãy cho biết doanh thu giảm trên khoảng nào.],
  [$(2; 5)$],
  accent: c-book,
  loigiai: [
    #step[Từ bảng xét dấu, ta thấy $R'(x) < 0$ trên khoảng $(2; 5)$.]
    #step[Vì vậy doanh thu giảm trên khoảng $(2; 5)$.]
  ],
))
