#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("CÁC SỐ ĐẶC TRƯNG ĐO MỨC ĐỘ PHÂN TÁN", mau: C5)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C5)[
  - *Khoảng biến thiên ($R$)*: Hiệu giữa giá trị lớn nhất và giá trị nhỏ nhất của mẫu số liệu:
    $ R = x_("max") - x_("min") $
  - *Khoảng tứ phân vị ($Delta_Q$)*: Hiệu giữa tứ phân vị thứ ba và tứ phân vị thứ nhất:
    $ Delta_Q = Q_3 - Q_1 $
  - *Phương sai ($s^2$)*:
    $ s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2 = 1/n (sum_(i=1)^n x_i^2) - (overline(x))^2 $
    - Đối với bảng phân bố tần số: $s^2 = 1/n sum_(i=1)^k n_i (x_i - overline(x))^2$.
  - *Độ lệch chuẩn ($s$)*: Căn bậc hai số học của phương sai:
    $ s = sqrt(s^2) $
  - *Giá trị ngoại lệ (ngoại lai)*: Giá trị $x$ được gọi là giá trị ngoại lệ nếu:
    $ x < Q_1 - 1,5 Delta_Q quad "hoặc" quad x > Q_3 + 1,5 Delta_Q $
]

#dang("Các số đặc trưng đo độ phân tán", mau: C5)

#bai-tap-tu-luan(mau: C5)[
  #bt-item(1, [Hãy tìm khoảng biến thiên và khoảng tứ phân vị của các mẫu số liệu sau:
    + $10; 13; 15; 2; 10; 19; 2; 5; 7$.
    + $15; 19; 10; 5; 9; 10; 1; 2; 5; 15$.
  ], loigiai: [
    - a) Sắp xếp ($n = 9$): $2, 2, 5, 7, 10, 10, 13, 15, 19$.
      Khoảng biến thiên: $R = 19 - 2 = 17$.
      $Q_2 = 10$; nửa dưới $2, 2, 5, 7 => Q_1 = (2 + 5)/2 = 3,5$.
      Nửa trên $10, 13, 15, 19 => Q_3 = (13 + 15)/2 = 14$.
      Khoảng tứ phân vị: $Delta_Q = 14 - 3,5 = 10,5$.
    - b) Sắp xếp ($n = 10$): $1, 2, 5, 5, 9, 10, 10, 15, 15, 19$.
      $R = 19 - 1 = 18$.
      $Q_1 = 5, Q_3 = 15 => Delta_Q = 15 - 5 = 10$.
  ])

  #bt-item(2, [Sản lượng lúa (đơn vị: tạ) của 40 thửa ruộng thí nghiệm có cùng diện tích được trình bày trong bảng tần số:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center,
        [Sản lượng ($x_i$)], [20], [21], [22], [23], [24],
        [Tần số ($n_i$)], [5], [8], [11], [10], [6],
      )
    ]
    + Tìm sản lượng trung bình của 40 thửa ruộng.
    + Tìm phương sai và độ lệch chuẩn.
  ], loigiai: [
    - a) Sản lượng trung bình:
      $ overline(x) = (20 dot 5 + 21 dot 8 + 22 dot 11 + 23 dot 10 + 24 dot 6)/40 = (100 + 168 + 242 + 230 + 144)/40 = 884 / 40 = 22,1" (tạ)". $
    - b) Phương sai:
      $ s^2 = 1/40 [5(20 - 22,1)^2 + 8(21 - 22,1)^2 + 11(22 - 22,1)^2 + 10(23 - 22,1)^2 + 6(24 - 22,1)^2] $
      $ = 1/40 [5(4,41) + 8(1,21) + 11(0,01) + 10(0,81) + 6(3,61)] = 1/40 [22,05 + 9,68 + 0,11 + 8,1 + 21,66] = 61,6 / 40 = 1,54. $
      Độ lệch chuẩn: $s = sqrt(1.54) approx 1,24" (tạ)"$.
  ])
]

#bai-tap-trac-nghiem(mau: C5)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 10, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho mẫu số liệu: $1, 2, 4, 5, 9, 10, 11$. Khoảng biến thiên của mẫu số liệu là:],
  (
    [$5$.],
    True([$10$.]),
    [$6$.],
    [$11$.],
  ),
  loigiai: [$R = 11 - 1 = 10$. Chọn B.]
)

#tn(
  dir: "ngang",
  [Cho mẫu số liệu: $1, 2, 4, 5, 9, 10, 11$. Khoảng tứ phân vị của mẫu số liệu là:],
  (
    [$7$.],
    [$10$.],
    [$9$.],
    True([$8$.]),
  ),
  loigiai: [$Q_1 = 2, Q_3 = 10 => Delta_Q = 10 - 2 = 8$. Chọn D.]
)

#tn(
  dir: "ngang",
  [Kết quả điều tra lương 9 công nhân: $2, 9, 9, 8, 10, 9, 9, 11, 9$. Giá trị ngoại lệ trong mẫu là:],
  (
    [$11$.],
    [$9$.],
    True([$2$.]),
    [Không có giá trị ngoại lệ.],
  ),
  loigiai: [Giá trị $2$ cách quá xa phần còn lại và nhỏ hơn $Q_1 - 1,5 Delta_Q$. Chọn C.]
)

#tn(
  dir: "ngang",
  [Sản lượng lúa các năm: $1061,9; 1061,9; 1053,6; 942,6; 1030,4$. Khoảng biến thiên là:],
  (
    True([$119,3$.]),
    [$87,8$.],
    [$1061,9$.],
    [$942,6$.],
  ),
  loigiai: [$R = 1061,9 - 942,6 = 119,3$. Chọn A.]
)

#tn(
  dir: "ngang",
  [Độ tuổi 11 cầu thủ: $32, 20, 19, 21, 28, 29, 21, 22, 29, 19, 29$. Khoảng biến thiên là:],
  (
    [$11$.],
    [$9$.],
    [$32$.],
    True([$13$. hoặc $11$.]),
  ),
  loigiai: [$R = 32 - 19 = 13$. Chọn đáp án tương ứng.]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2, reset-counter: true)

#ds(
  [Cho mẫu số liệu: $5, 7, 9, 11, 13$. Xét tính đúng sai:],
  (
    True([Số trung bình cộng là $9$.]),
    True([Khoảng biến thiên $R = 8$.]),
    True([Phương sai $s^2 = 8$.]),
    True([Độ lệch chuẩn $s = 2 sqrt(2)$.]),
  ),
  loigiai: [
    - a) $overline(x) = (5 + 7 + 9 + 11 + 13)/5 = 9$. Đúng.
    - b) $R = 13 - 5 = 8$. Đúng.
    - c) $s^2 = [(-4)^2 + (-2)^2 + 0^2 + 2^2 + 4^2]/5 = (16 + 4 + 0 + 4 + 16)/5 = 40/5 = 8$. Đúng.
    - d) $s = sqrt(8) = 2 sqrt(2)$. Đúng.
  ]
)

#ds(
  [Cho mẫu số liệu gồm các giá trị: $10, 10, 10, 10, 10$. Xét tính đúng sai:],
  (
    True([Khoảng biến thiên $R = 0$.]),
    True([Khoảng tứ phân vị $Delta_Q = 0$.]),
    True([Phương sai $s^2 = 0$.]),
    True([Độ lệch chuẩn $s = 0$.]),
  ),
  loigiai: [
    Khi tất cả các số liệu bằng nhau thì mọi độ đo phân tán đều bằng $0$. Cả 4 ý đều đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Tìm khoảng biến thiên của mẫu số liệu: $14, 18, 22, 29, 35, 42$.],
  [28],
  loigiai: [$R = 42 - 14 = 28$.]
)

#tln(
  dir: "ngang",
  [Cho mẫu số liệu có $Q_1 = 15$ và $Q_3 = 27$. Tính khoảng tứ phân vị $Delta_Q$.],
  [12],
  loigiai: [$Delta_Q = 27 - 15 = 12$.]
)

#tln(
  dir: "ngang",
  [Tìm độ lệch chuẩn của dãy số liệu: $2, 4, 6, 8, 10$ (làm tròn đến hai chữ số thập phân).],
  [2,83],
  loigiai: [Phương sai $s^2 = 8 => s = sqrt(8) approx 2,83$.]
)
