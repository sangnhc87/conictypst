#import "../_config.typ": *

#chapter([Tầm nhìn và Điểm mù — Line of Sight & Blind Spots], theme-color: c-p4)

#phuongphap(theme-color: c-p4)[
  *Bản chất:* Kiểm tra xem đoạn thẳng $M E$ (từ mắt/camera $E$ đến mục
  tiêu $M$) có bị vật cản chặn không. Có 3 cách tiếp cận:
  + Kiểm tra $M E$ có cắt khối vật cản không (giao đường thẳng-hộp).
  + Kiểm tra $M E$ có cắt mặt phẳng của vật cản ở điểm nằm *trong* vật
    cản không.
  + Dùng điều kiện dấu: $M$ và $E$ ở hai phía của mặt phẳng $=>$
    chắn; cùng phía $=>$ không chắn.

  *Bối cảnh thực tế:* Thiết kế camera an ninh; đặt vị trí súng máy;
  kiểm tra tầm nhìn từ đài quan sát.
]

#topic([Camera An ninh và Cột Trụ Che khuất], prefix: "Bài", theme-color: c-p4)

#dang([Xác định vùng mù sau vật cản hình hộp], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Camera đặt tại góc phòng $E$. Cột trụ vuông kích thước $a times a$
  tại vị trí cho trước. Tính vùng không gian bị che khuất (hình tứ diện
  bóng sau cột).
]

#vd(
  [*(Khung)* Camera tại $E(0; 0; 3)$. Cột trụ vuông có 4 cạnh thẳng đứng
    đi qua $A(2; 1; 0)$, $B(2; 2; 0)$, $C(3; 2; 0)$, $D(3; 1; 0)$ và cao
    $4$ m. Xác định 4 tia giới hạn vùng mù sau cột từ góc nhìn của $E$.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p4,
)

#topic([Đài Quan sát và Tầm nhìn Qua Rặng Đồi], prefix: "Bài", theme-color: c-p4)

#dang([Kiểm tra điều kiện nhìn thấy — hai điểm cùng phía hay khác phía mặt phẳng], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Đỉnh đồi là mặt phẳng $(P)$. Kiểm tra người quan sát $E$ có
  thể nhìn thấy mục tiêu $M$ qua đỉnh đồi không (kiểm tra dấu $f(E)$
  và $f(M)$ với $f(x,y,z) = A x + B y + C z + D$).
]
