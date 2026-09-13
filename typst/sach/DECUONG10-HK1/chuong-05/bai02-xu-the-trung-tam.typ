#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#bai("CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM", mau: C5)

#ly-thuyet(tieu-de: "A. LÝ THUYẾT CẦN NHỚ", mau: C5)[
  Cho mẫu số liệu không ghép nhóm: $x_1, x_2, dots, x_n$.
  - *Số trung bình cộng*:
    $ overline(x) = (x_1 + x_2 + dots + x_n)/n $
  - *Trung vị ($M_e$)*: Sắp xếp mẫu số liệu theo thứ tự không giảm: $x_1 <= x_2 <= dots <= x_n$.
    - Nếu $n$ lẻ ($n = 2k + 1$): $M_e = x_(k+1)$.
    - Nếu $n$ chẵn ($n = 2k$): $M_e = (x_k + x_(k+1))/2$.
  - *Tứ phân vị*: Gồm ba giá trị $Q_1, Q_2, Q_3$:
    - $Q_2 = M_e$ là trung vị của toàn bộ mẫu số liệu.
    - $Q_1$ (tứ phân vị thứ nhất) là trung vị của nửa số liệu bên trái $Q_2$ (không bao gồm $Q_2$ nếu $n$ lẻ).
    - $Q_3$ (tứ phân vị thứ ba) là trung vị của nửa số liệu bên phải $Q_2$ (không bao gồm $Q_2$ nếu $n$ lẻ).
  - *Mốt ($M_o$)*: Là giá trị có tần số xuất hiện lớn nhất trong mẫu số liệu. Một mẫu có thể có một hoặc nhiều mốt.
]

#dang("Các số đặc trưng đo xu thế trung tâm", mau: C5)

#bai-tap-tu-luan(mau: C5)[
  #bt-item(1, [Chiều cao (đơn vị: cm) của các bạn tổ 1 lớp 10A lần lượt là:
    $165, 155, 171, 167, 159, 155, 165, 160, 158$.
    Đối với mẫu số liệu trên, hãy tìm:
    + Số trung bình cộng.
    + Trung vị.
    + Mốt.
    + Tứ phân vị.
  ], loigiai: [
    Sắp xếp mẫu số liệu theo thứ tự không giảm ($n = 9$):
    $155, 155, 158, 159, 160, 165, 165, 167, 171$.
    - a) $overline(x) = (155 + 155 + 158 + 159 + 160 + 165 + 165 + 167 + 171)/9 = 1455 / 9 approx 161,67" cm"$.
    - b) Vì $n = 9$ lẻ nên trung vị $M_e = x_5 = 160" cm"$.
    - c) Giá trị $155$ và $165$ đều xuất hiện $2$ lần, nên có hai mốt: $M_o = 155" cm"$ và $M_o = 165" cm"$.
    - d) Nửa dưới: $155, 155, 158, 159 => Q_1 = (155 + 158)/2 = 156,5$.
      $Q_2 = 160$.
      Nửa trên: $165, 165, 167, 171 => Q_3 = (165 + 167)/2 = 166$.
  ])

  #bt-item(2, [Số đôi giày bán ra trong Quý IV năm 2020 của một cửa hàng theo cỡ giày như sau:
    - Cỡ giày: $38, 39, 40, 41, 42, 43$.
    - Số đôi bán được: $25, 42, 85, 56, 30, 12$.
    Tìm mốt của mẫu số liệu và giải thích ý nghĩa thực tế.
  ], loigiai: [
    Cỡ giày $40$ có số đôi bán được nhiều nhất ($85$ đôi). Vậy mốt là $M_o = 40$.
    Ý nghĩa: Cửa hàng nên nhập nhiều giày cỡ $40$ nhất vì đây là cỡ giày có nhu cầu mua cao nhất của khách hàng.
  ])
]

#bai-tap-trac-nghiem(mau: C5)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 8, reset-counter: true)

#tn(
  dir: "ngang",
  [Số ca nhiễm dương tính tại 7 quận huyện: $17, 24, 7, 23, 39, 19, 5$. Trung vị của mẫu số liệu là:],
  (
    [$5$.],
    [$17$.],
    True([$19$.]),
    [$24$.],
  ),
  loigiai: [Sắp xếp: $5, 7, 17, 19, 23, 24, 39$. Vì $n = 7$ nên trung vị là số thứ tư: $M_e = 19$. Chọn C.]
)

#tn(
  dir: "ngang",
  [Cho mẫu số liệu: $200, 240, 220, 210, 225, 235, 225, 270, 250, 280$. Tứ phân vị của mẫu số liệu là:],
  (
    True([$Q_1 = 220; Q_2 = 230; Q_3 = 250$.]),
    [$Q_1 = 210; Q_2 = 230; Q_3 = 250$.],
    [$Q_1 = 220; Q_2 = 230; Q_3 = 280$.],
    [$Q_1 = 200; Q_2 = 250; Q_3 = 280$.],
  ),
  loigiai: [Sắp xếp: $200, 210, 220, 225, 225, 235, 240, 250, 270, 280$.
    $Q_2 = (225 + 235)/2 = 230$. Nửa dưới có 5 giá trị, trung vị $Q_1 = 220$. Nửa trên có 5 giá trị, trung vị $Q_3 = 250$. Chọn A.]
)

#tn(
  dir: "ngang",
  [Điểm số của 5 đội bóng dẫn đầu: $56, 45, 43, 37, 35$. Số trung bình cộng của mẫu số liệu là:],
  (
    [$43$.],
    True([$43,2$.]),
    [$44$.],
    [$56$.],
  ),
  loigiai: [$overline(x) = (56 + 45 + 43 + 37 + 35)/5 = 216 / 5 = 43,2$. Chọn B.]
)

#tn(
  dir: "ngang",
  [Huyết áp của 8 người: $72, 77, 84, 96, 105, 105, 117, 124$. Trung vị của mẫu số liệu là:],
  (
    [$96$.],
    True([$100,5$.]),
    [$105$.],
    [$101$.],
  ),
  loigiai: [$n = 8$ chẵn, trung vị $M_e = (96 + 105)/2 = 100,5$. Chọn B.]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2, reset-counter: true)

#ds(
  [Cho mẫu số liệu gồm 10 số: $1, 2, 3, 4, 5, 6, 7, 8, 9, 10$. Xét tính đúng sai:],
  (
    True([Số trung bình của mẫu là $5,5$.]),
    True([Trung vị của mẫu là $5,5$.]),
    True([Tứ phân vị thứ nhất $Q_1 = 3$.]),
    True([Tứ phân vị thứ ba $Q_3 = 8$.]),
  ),
  loigiai: [
    - a) $(1+2+dots+10)/10 = 55/10 = 5,5$. Đúng.
    - b) $M_e = (5 + 6)/2 = 5,5$. Đúng.
    - c) Nửa dưới: $1, 2, 3, 4, 5 => Q_1 = 3$. Đúng.
    - d) Nửa trên: $6, 7, 8, 9, 10 => Q_3 = 8$. Đúng.
  ]
)

#ds(
  [Trong một giải đấu, số bàn thắng của 7 tiền đạo ghi được lần lượt là: $3, 5, 5, 6, 8, 9, 12$. Xét tính đúng sai:],
  (
    True([Mốt của mẫu số liệu là $5$.]),
    True([Trung vị của mẫu số liệu là $6$.]),
    [Số trung bình cộng nhỏ hơn $6$.],
    True([Tứ phân vị thứ nhất là $5$ và tứ phân vị thứ ba là $9$.]),
  ),
  loigiai: [
    - a) Số 5 xuất hiện nhiều nhất. Đúng.
    - b) $n = 7$, trung vị là số thứ tư: $6$. Đúng.
    - c) Tổng $= 48 => overline(x) = 48/7 approx 6,86 > 6$. Sai.
    - d) Nửa dưới $3, 5, 5 => Q_1 = 5$; nửa trên $8, 9, 12 => Q_3 = 9$. Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Tìm số trung bình cộng của mẫu số liệu: $4, 6, 8, 10, 12$.],
  [8],
  loigiai: [$overline(x) = (4 + 6 + 8 + 10 + 12)/5 = 40/5 = 8$.]
)

#tln(
  dir: "ngang",
  [Tìm trung vị của mẫu số liệu: $12, 15, 17, 20, 25, 30$.],
  [18,5],
  loigiai: [$M_e = (17 + 20)/2 = 18,5$.]
)

#tln(
  dir: "ngang",
  [Tính hiệu giữa tứ phân vị thứ ba $Q_3$ và tứ phân vị thứ nhất $Q_1$ của mẫu: $2, 4, 6, 8, 10, 12, 14$.],
  [8],
  loigiai: [$Q_1 = 4, Q_3 = 12 => Q_3 - Q_1 = 12 - 4 = 8$.]
)
