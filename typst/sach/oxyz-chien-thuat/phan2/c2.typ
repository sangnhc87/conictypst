#import "../_config.typ": *

#chapter([Cảnh báo Va chạm và Tiếp cận Gần nhất — Closest Approach], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Bản chất:* Hai điểm $A(t)$ và $B(t)$ di chuyển theo hai đường thẳng.
  Khoảng cách $d(t) = |arrow(A(t) B(t))|$ là hàm bậc hai của $t$.
  Tìm $t$ cực tiểu bằng đạo hàm:
  $
    d^2(t) = a t^2 + b t + c, quad d^2'(t) = 0 ==> t_* = -frac(b, 2a)
  $
  *Bối cảnh thực tế:* Phân tích nguy cơ va chạm giữa hai máy bay trên
  đường bay chéo nhau; quản lý khoảng cách an toàn tối thiểu.
]

#topic([Hai Máy bay Đường bay Chéo nhau], prefix: "Bài", theme-color: c-p2)

#dang([Tìm thời điểm tiếp cận gần nhất], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Cho $A(t)$ và $B(t)$. Lập $d^2(t)$, tìm $t_*$. So sánh $d(t_*)$
  với khoảng cách cảnh báo $R$ để kết luận có vào vùng báo động không.
]

#vd(
  [*(Khung)* Máy bay $A$: $A(t) = (100 + 5t;\, 0;\, 10)$. Máy bay $B$:
    $B(t) = (0;\, 80 - 4t;\, 10)$ (đơn vị km, phút). Tìm thời điểm
    khoảng cách $A B$ nhỏ nhất và kiểm tra có vào vùng cảnh báo $5$ km không.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p2,
)

#dang([Hai máy bay ở độ cao khác nhau — không gian 3D đầy đủ], theme-color: c-p2)

#ghinho(theme-color: c-p2)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài nâng cao: Hai đường bay không song song, không cắt nhau — đường
  chéo nhau trong không gian. Tính khoảng cách tối thiểu thực tế.
]
