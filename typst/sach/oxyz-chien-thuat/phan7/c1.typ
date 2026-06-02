#import "../_config.typ": *

#chapter([Đường đi Cực đoan và Điểm Fermat 3D], theme-color: c-p7)

#phuongphap(theme-color: c-p7)[
  *Bản chất:* Tìm điểm $I$ trên đường thẳng $d$ (hoặc mặt phẳng $(P)$) để
  tổng khoảng cách $I A + I B$ nhỏ nhất.

  *Kỹ thuật phản xạ:*
  + Tìm điểm đối xứng $A'$ của $A$ qua $d$ (hoặc $(P)$).
  + $I A + I B >= A' B$ với dấu bằng khi $I$ là giao điểm của $A' B$ với $d$/$P$.
  + Kết hợp với bất đẳng thức tam giác: $A' I + I B >= A' B$.

  *Bối cảnh thực tế:* Đặt trạm xăng trên xa lộ để tổng đường ống đến
  $2$ khu công nghiệp là ngắn nhất; định vị trạm dịch vụ tối ưu.
]

#topic([Trạm Xăng Tối ưu trên Xa lộ], prefix: "Bài", theme-color: c-p7)

#dang([Cực tiểu $M A + M B$ với $M$ trên đường thẳng], theme-color: c-p7)

#ghinho(theme-color: c-p7)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Xa lộ là đường thẳng $d$. Hai khu công nghiệp $A$, $B$ ở hai
  phía. Dùng phản xạ tìm điểm $I in d$ để $I A + I B$ nhỏ nhất.
]

#vd(
  [*(Khung)* Xa lộ có phương trình $d: frac(x, 1) = frac(y - 5, 0) = frac(z, 0)$
    (đường nằm ngang $y = 5, z = 0$). Khu công nghiệp $A(0; 0; 0)$ và
    $B(10; 10; 0)$. Tìm vị trí $I$ trên xa lộ để $I A + I B$ nhỏ nhất.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p7,
)

#topic([Định vị Trạm Dịch vụ trên Mặt phẳng], prefix: "Bài", theme-color: c-p7)

#dang([Cực tiểu tổng khoảng cách từ điểm đến nhiều cơ sở], theme-color: c-p7)

#ghinho(theme-color: c-p7)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài mở rộng: $3$ khu dân cư $A$, $B$, $C$ — tìm điểm $P$ trên
  mặt phẳng để $P A + P B + P C$ nhỏ nhất (Điểm Fermat–Torricelli 3D).
]
