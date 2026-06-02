#import "../_config.typ": *

#chapter([Góc Vận hành Tối ưu — Tối ưu hóa Góc và Hướng], theme-color: c-p7)

#phuongphap(theme-color: c-p7)[
  *Bản chất:* Góc giữa hai vectơ (hoặc hai mặt phẳng) phụ thuộc vào
  tham số $t$ (vị trí, góc xoay). Tối ưu hóa $cos theta$ qua đạo hàm:
  $
    cos theta = frac(arrow(u)(t) dot.c arrow(v), |arrow(u)(t)| dot.c |arrow(v)|)
    quad ==> quad frac(d(cos theta), d t) = 0
  $
  *Bối cảnh thực tế:* Lắp tấm pin mặt trời để trực diện nhất với ánh nắng
  (tối ưu hóa cosine giữa pháp tuyến tấm pin và hướng tia sáng); định
  hướng anten; thiết kế góc nghiêng cánh máy bay.
]

#topic([Tấm Pin Mặt trời Góc Tối ưu], prefix: "Bài", theme-color: c-p7)

#dang([Cực đại $cos theta$ giữa pháp tuyến tấm pin và hướng ánh sáng], theme-color: c-p7)

#ghinho(theme-color: c-p7)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Tấm pin xoay quanh trục $O y$, pháp tuyến $arrow(n)(alpha)$
  phụ thuộc góc $alpha$. Tìm $alpha$ để $arrow(n) dot.c arrow(s)$
  (hướng mặt trời) đạt cực đại.
]

#vd(
  [*(Khung)* Hướng tia sáng mặt trời $arrow(s) = (1; 0; -2)$ (chuẩn hóa).
    Tấm pin có pháp tuyến $arrow(n)(alpha) = (sin alpha; 0; cos alpha)$.
    Tìm $alpha in [0°, 90°]$ để công suất thu được cực đại.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p7,
)

#topic([Định hướng Anten Radar Tối ưu], prefix: "Bài", theme-color: c-p7)

#dang([Cực đại góc mở — tích vô hướng cực đại với ràng buộc mô-đun], theme-color: c-p7)

#ghinho(theme-color: c-p7)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Anten quay quanh trục thẳng đứng, hướng theo $arrow(u)(theta)$.
  Mục tiêu nằm ở hướng $arrow(T)$. Tìm góc $theta$ để tín hiệu
  mạnh nhất (tích vô hướng $arrow(u) dot.c arrow(T)$ lớn nhất).
]

#topic([Tổng hợp — Bài toán Cực trị Hỗn hợp Khoảng cách và Góc], prefix: "Bài", theme-color: c-p7)

#ghinho(theme-color: c-p7)[
  _TODO: Bài tổng hợp cuối chương — kết hợp tối ưu khoảng cách và góc._
  Dạng bài thi: Cho hình lăng trụ $A B C. A'B'C'$. Điểm $M$ chuyển động
  trên cạnh $A A'$. Tìm vị trí $M$ để tổng $M B + M C'$ nhỏ nhất VÀ
  góc $angle B M C'$ có giá trị xác định.
]
