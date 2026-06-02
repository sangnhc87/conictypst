#import "../_config.typ": *

#chapter([Bài toán Đón lõng Mục tiêu — Target Interception], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Bản chất:* Tìm thời điểm $t > 0$ và vị trí $I$ để hai vật chuyển động
  *gặp nhau*:
  $
    M_1(t) = M_1^0 + t arrow(v_1) = M_2(t) = M_2^0 + t arrow(v_2)
  $
  Đây là hệ 3 phương trình 1 ẩn $t$ (cộng thêm ẩn vectơ $arrow(v_2)$
  nếu cần tìm hướng bắn).

  *Bối cảnh thực tế:* Tên lửa phòng không đón đầu máy bay mục tiêu; tên
  lửa không đối không; tàu vũ trụ tiếp cận trạm quỹ đạo.
]

#topic([Tên lửa Đón đầu Máy bay Mục tiêu], prefix: "Bài", theme-color: c-p2)

#dang([Đường bay cả hai đã biết — tìm thời điểm gặp], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Máy bay $A(t)$ và tên lửa $B(t)$ có phương trình tham số đã cho.
  Kiểm tra có tồn tại $t > 0$ để $A(t) = B(t)$ không.
]

#vd(
  [*(Khung)* Máy bay mục tiêu xuất phát từ $M_1(0; 20; 5)$ km với vận tốc
    $arrow(v_1) = (3; -1; 0)$ km/phút. Trạm phòng không ở $O(0;0;0)$
    bắn tên lửa với tốc độ $5$ km/phút. Tìm hướng bắn để tên lửa gặp mục
    tiêu.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p2,
)

#dang([Hướng bắn tối ưu — góc ngắm đón đầu], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài nâng cao: Từ góc bắn, tìm vector đơn vị hướng bắn và tọa độ
  điểm đánh chặn.
]
