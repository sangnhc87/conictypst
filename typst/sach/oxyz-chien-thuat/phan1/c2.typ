#import "../_config.typ": *

#chapter([Vận tốc Kép và Hiệu ứng Trôi — Drift Effect], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Bản chất:* Vận tốc thực tế của một phương tiện di chuyển trong môi trường
  lưu chất (gió, hải lưu) là tổng vector:
  $
    arrow(v_"thực") = arrow(v_"động cơ") + arrow(v_"môi trường")
  $
  Hướng và độ lớn thực tế có thể lệch đáng kể so với ý định ban đầu.

  *Bối cảnh thực tế:* Máy bay vượt vùng nhiễu động khí quyển (turbulence
  zone), tàu ngầm đi qua dòng hải lưu, drone giao hàng trong gió mạnh.
]

#topic([Máy bay Vượt Vùng Nhiễu Động Khí quyển], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Máy bay giữ hướng bay $arrow(v_1)$, gió ngang $arrow(v_2)$.
  Tính vận tốc thực và góc lệch so với hành lang bay an toàn.
]

#vd(
  [*(Khung)* Máy bay giữ vận tốc $arrow(v_1) = (400; 0; 0)$ km/h
    (hướng đông). Gió ngang thổi với $arrow(v_2) = (0; 60; -20)$ km/h.
    Tính vận tốc thực và hướng thực của máy bay.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p1,
)

#topic([Tàu ngầm Qua Dòng Hải lưu], prefix: "Bài", theme-color: c-p1)

#ghinho(theme-color: c-p1)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Tàu ngầm cần đi từ $A$ đến $B$ thẳng đứng nhưng dòng hải lưu
  lệch ngang. Tìm hướng máy cần giữ để bù lại drift.
]
