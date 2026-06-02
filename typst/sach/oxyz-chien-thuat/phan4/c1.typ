#import "../_config.typ": *

#chapter([Phản xạ Gương phẳng — Laser và Signal Reflection], theme-color: c-p4)

#phuongphap(theme-color: c-p4)[
  *Bản chất:* Tia phản xạ qua gương phẳng $(P)$ dùng *phép đối xứng*:
  + Tìm điểm đối xứng $A'$ của nguồn $A$ qua $(P)$.
  + Đường thẳng $A' B$ cắt $(P)$ tại điểm dội $I$.
  + Tia phản xạ đi từ $I$ đến $B$, với $angle "tới" = angle "phản xạ"$.

  *Lý do dùng đối xứng:* $A I + I B = A' I + I B = A' B$ — đường đi qua
  $I$ ngắn nhất chính là đường thẳng $A' B$.

  *Bối cảnh thực tế:* Tia laser dội gương; sóng sonar dội đáy biển;
  tính điểm ảnh trong ray tracing; bài toán bida 3D.
]

#topic([Tia Laser Dội Gương — Tìm Điểm Dội], prefix: "Bài", theme-color: c-p4)

#dang([Đối xứng $A$ qua $(P)$, nối $A'B$ cắt $(P)$], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Cho $A$, $B$, mặt phẳng gương $(P)$. Tìm tọa độ điểm dội $I$
  trên $(P)$ sao cho tia $A I$ phản xạ đúng hướng đến $B$.
]

#vd(
  [*(Khung)* Nguồn laser tại $A(1; 2; 3)$. Mục tiêu $B(5; 0; 1)$. Gương
    phẳng $(P): x + y - z = 0$. Tìm tọa độ điểm dội $I$ và kiểm tra
    $I$ thuộc $(P)$.],
  loigiai: [
    // TODO: lời giải
  ],
  theme-color: c-p4,
)

#topic([Sonar Dội Đáy Biển — Định vị Vật thể Ngầm], prefix: "Bài", theme-color: c-p4)

#dang([Tìm vị trí vật thể từ góc phản xạ sóng sonar], theme-color: c-p4)

#ghinho(theme-color: c-p4)[
  _TODO: Nội dung sẽ được đắp vào sau._
  Dạng bài: Tàu tại $T$ phát sóng xuống đáy biển $(P)$, sóng phản xạ
  dội trở lại và phát hiện vật thể $B$ dưới đáy. Tính tọa độ $B$.
]
