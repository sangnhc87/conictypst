#import "../_config.typ": *

#chapter([Ranh giới Phòng không và Lãnh hải — Mặt phẳng Phân cắt], theme-color: c-p5)

#phuongphap(theme-color: c-p5)[
  *Bản chất:* Mặt phẳng $A x + B y + C z + D = 0$ chia không gian thành
  hai nửa:
  - Nửa $f(M) > 0$: phía "trong" (ví dụ: lãnh thổ của ta).
  - Nửa $f(M) < 0$: phía "ngoài" (ví dụ: vùng xâm phạm).
  - $f(M) = 0$: đúng trên ranh giới.

  *Kiểm tra:* Thế tọa độ máy bay vào $f$, xét dấu kết quả.

  *Bối cảnh thực tế:* Kiểm tra tốp máy bay lạ đã vượt vùng nhận dạng phòng
  không (ADIZ) hay chưa; quản lý ranh giới lãnh hải.
]

#topic([Kiểm tra Xâm phạm Vùng Phòng không], prefix: "Bài", theme-color: c-p5)

#dang([Phép thử dấu tọa độ qua mặt phẳng ranh giới], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Cho phương trình mặt phẳng ranh giới $(P)$ và tọa độ các máy
  bay. Xác định từng máy bay đang ở phía nào và có cần phát cảnh báo không.
]

#vd(
  [*(Khung)* Vùng phòng không được giới hạn bởi mặt phẳng
    $(P): 2 x - y + z - 100 = 0$. Cho ba máy bay tại $A_1(60; 20; 30)$,
    $A_2(40; -10; 20)$, $A_3(50; 0; 0)$. Xác định mỗi máy bay đang ở
    phía nào và máy bay nào đã vào vùng nhận dạng.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p5,
)

#topic([Ranh giới Lãnh hải và Kiểm soát Tàu thuyền], prefix: "Bài", theme-color: c-p5)

#dang([Tốc độ tiếp cận ranh giới — tích vô hướng vận tốc và pháp tuyến], theme-color: c-p5)

#ghinho(theme-color: c-p5)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Tàu đang chuyển động với vận tốc $arrow(v)$. Tính
  tốc độ tiếp cận mặt phẳng ranh giới $= arrow(v) dot.c hat(n)$
  và thời gian để tàu đến ranh giới.
]
