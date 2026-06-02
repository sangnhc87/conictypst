#import "../_config.typ": *

#chapter([Khối cầu Phát nổ và Vùng Phủ Radar — Blast Radius & Coverage], theme-color: c-p5)

#phuongphap(theme-color: c-p5)[
  *Quan hệ điểm $M$ và mặt cầu tâm $I$ bán kính $R$:*
  - $M I < R$: $M$ trong khối cầu (nằm trong vùng sát thương / phủ sóng).
  - $M I = R$: $M$ trên mặt cầu (biên giới).
  - $M I > R$: $M$ ngoài khối cầu (an toàn).

  *Giao hội GPS từ 3 vệ tinh:* Ba mặt cầu tâm $S_1, S_2, S_3$ bán kính
  $r_1, r_2, r_3$ giao nhau tại điểm thu $M$. Giải hệ $3$ phương trình
  mặt cầu.

  *Bối cảnh thực tế:* Vùng sát thương của tên lửa; vùng phủ của trạm
  phát Wi-Fi / 5G / radar; định vị thiết bị.
]

#topic([Vùng Sát thương Tên lửa và Kiểm tra Mục tiêu], prefix: "Bài", theme-color: c-p5)

#dang([Điểm nằm trong hay ngoài mặt cầu], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Tên lửa nổ tại $I$ với bán kính sát thương $R$. Cho tọa độ
  các mục tiêu $M_1, M_2, dots$ Xác định mục tiêu nào bị phá hủy.
]

#vd(
  [*(Khung)* Tên lửa nổ tại $I(3; 4; 2)$ km, bán kính sát thương $R = 5$ km.
    Các xe tăng tại $T_1(0; 0; 0)$, $T_2(6; 7; 4)$, $T_3(1; 1; 1)$.
    Xác định xe nào bị phá hủy.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p5,
)

#topic([Giao hội GPS từ 3 Vệ tinh], prefix: "Bài", theme-color: c-p5)

#dang([Giải hệ 3 phương trình mặt cầu], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Ba vệ tinh $S_1, S_2, S_3$ cách thiết bị lần lượt $r_1, r_2, r_3$.
  Lập hệ phương trình mặt cầu và tìm tọa độ thiết bị.
]
