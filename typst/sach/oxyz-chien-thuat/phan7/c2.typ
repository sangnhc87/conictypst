#import "../_config.typ": *

#chapter([Khoảng cách Chéo nhau trong Thi công Hẹp], theme-color: c-p7)

#phuongphap(theme-color: c-p7)[
  *Bản chất:* Khoảng cách giữa hai đường thẳng chéo nhau $d_1$ và $d_2$
  là độ dài *đoạn vuông góc chung* $I J$ ($I in d_1$, $J in d_2$,
  $arrow(I J) perp d_1$, $arrow(I J) perp d_2$):
  $
    d(d_1, d_2) = frac(|arrow(A_1 A_2) dot.c (arrow(u_1) times arrow(u_2))|, |arrow(u_1) times arrow(u_2)|)
  $
  Trong đó $A_1 in d_1$, $A_2 in d_2$, $arrow(u_1)$,
  $arrow(u_2)$ là vectơ chỉ phương.

  *Bối cảnh thực tế:* Khoảng cách giữa đường ống thoát hơi và dầm thép
  để lắp vật liệu cách nhiệt; kiểm tra hầm điện và hầm cáp có đủ khoảng
  cách an toàn không.
]

#topic([Đường ống Thoát hơi và Dầm Thép Chéo nhau], prefix: "Bài", theme-color: c-p7)

#dang([Tính khoảng cách và tìm đoạn vuông góc chung], theme-color: c-p7)

#ghinho(theme-color: c-p7)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Cho phương trình tham số hai đường chéo nhau. Tính khoảng
  cách bằng tích hỗn hợp. Tìm tọa độ hai điểm $I$, $J$ của đoạn vuông
  góc chung.
]

#vd(
  [*(Khung)* Đường ống $d_1: frac(x - 1, 2) = frac(y, 1) = frac(z + 1, -1)$
    và dầm thép $d_2: frac(x + 2, 1) = frac(y - 3, -1) = frac(z, 2)$.
    Tính khoảng cách nhỏ nhất giữa hai đường và tìm tọa độ điểm gần nhất
    trên mỗi đường.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p7,
)

#topic([Kiểm tra Khoảng cách An toàn Hầm Cáp và Hầm Điện], prefix: "Bài", theme-color: c-p7)

#dang([So sánh khoảng cách thực với khoảng cách an toàn tối thiểu], theme-color: c-p7)

#ghinho(theme-color: c-p7)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Tính khoảng cách giữa trục hai hầm. So sánh với tiêu chuẩn
  kỹ thuật (ví dụ: $>= 1.5$ m). Kết luận có cần thiết kế lại không.
]
