#import "../_config.typ": *

#chapter([Dò tia và Đổ bóng 3D — Shadow Casting], theme-color: c-p4)

#phuongphap(theme-color: c-p4)[
  *Bản chất:* Tia sáng từ nguồn $S$ qua mép vật cản $P_0$ tạo thành đường
  thẳng $d$. Vệt bóng là giao điểm của $d$ với mặt phẳng nhận bóng $(Q)$:
  $
    d: cases(
      x = S_x + t(P_{0 x} - S_x),
      y = S_y + t(P_{0 y} - S_y),
      z = S_z + t(P_{0 z} - S_z)
    ) ==> text("thế vào phương trình") (Q)
  $
  *Bối cảnh thực tế:* Tính vệt bóng của biển quảng cáo in trên mặt đường
  hoặc tường nhà kế bên; thiết kế hệ thống che nắng cho tòa nhà.
]

#topic([Bóng Biển Quảng cáo Đổ lên Mặt đường], prefix: "Bài", theme-color: c-p4)

#dang([Giao tia sáng với mặt phẳng $z = 0$], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Mặt trời ở hướng cho trước (vectơ $arrow(s)$). Biển
  quảng cáo có 4 góc ở tọa độ đã biết. Tính tọa độ 4 góc bóng in trên
  mặt đất $(z = 0)$ và diện tích bóng.
]

#vd(
  [*(Khung)* Biển quảng cáo hình chữ nhật, đỉnh trên $A(0; 0; 8)$ và
    $B(6; 0; 8)$, đỉnh dưới $C(6; 0; 4)$ và $D(0; 0; 4)$. Mặt trời
    chiếu theo hướng $arrow(s) = (2; 0; -3)$. Tìm vệt bóng
    trên mặt đất $z = 0$.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p4,
)

#topic([Bóng Đổ Vắt Ngang Tường Nhà Kế bên], prefix: "Bài", theme-color: c-p4)

#dang([Phân tích bóng đổ lên hai mặt phẳng], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài nâng cao: Tia sáng cắt đồng thời mặt đất $(z = 0)$ và tường
  $(x = 0)$. Xác định đường ranh giới bóng trên mỗi mặt.
]
