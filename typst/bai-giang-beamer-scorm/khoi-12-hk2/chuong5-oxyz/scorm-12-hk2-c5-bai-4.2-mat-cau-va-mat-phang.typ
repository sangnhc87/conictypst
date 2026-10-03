// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 4.2: VỊ TRÍ TƯƠNG ĐỐI CỦA MẶT CẦU VÀ MẶT PHẲNG
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 4.2: TƯƠNG GIAO MẶT CẦU - MẶT PHẲNG",
  subtitle:    "Nghệ thuật cắt quả cam",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Lát cắt trên Quả Cam")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Hiện tượng vật lý:]
    
    Hãy tưởng tượng bạn lấy một con dao (mặt phẳng) và cắt một quả cam (mặt cầu).
    
    - Nếu bạn đưa dao trượt sát rạt qua vỏ cam, con dao chỉ chạm vào quả cam tại đúng *1 điểm*. Người ta gọi dao đã "Tiếp xúc" quả cam.
    - Nếu bạn cắt phăng vào sâu bên trong thân quả cam, mặt cắt lộ ra sẽ luôn luôn là một *Hình tròn*.
    
    *Làm sao để biết khi nào con dao sẽ cắt tạo ra hình tròn, khi nào chỉ sượt qua vỏ? Chìa khoá nằm ở Khoảng cách từ lưỡi dao đến tâm quả cam!*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Vị trí tương đối dựa vào Khoảng cách")[
  Cho mặt cầu $(S)$ tâm $I$, bán kính $R$ và mặt phẳng $(P)$. 
  Gọi $d = d(I, (P))$ là khoảng cách từ tâm $I$ đến mặt phẳng $(P)$.
  
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Có 3 trường hợp xảy ra:*
    1. $d > R$: Mặt phẳng nằm hoàn toàn bên ngoài mặt cầu. *(Không giao nhau).*
    
    2. $d = R$: Mặt phẳng chạm vào vỏ mặt cầu tại đúng 1 điểm duy nhất $H$. 
       $=>$ Lúc này $(P)$ được gọi là *Mặt phẳng tiếp diện*.
       
    3. $d < R$: Mặt phẳng cắt mặt cầu theo một đường tròn. 
       $=>$ Bán kính $r$ của đường tròn giao tuyến được tính bằng định lý Pytago:
       $ r = sqrt(R^2 - d^2) $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Bài toán Viết phương trình Mặt phẳng Tiếp diện")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Yêu cầu:* Viết phương trình mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$ tại điểm $H$ (biết $H$ nằm trên mặt cầu).
    
    *Cách giải (Rất dễ):*
    Vì $(P)$ tiếp xúc mặt cầu tại $H$, nên $(P)$ sẽ *vuông góc* với bán kính $I H$.
    $=>$ Mặt phẳng $(P)$ có điểm đi qua là $H$ và nhận vectơ $arrow(I H)$ làm Vectơ Pháp Tuyến!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Phân tích Chuyên Sâu")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Ví dụ: Lát cắt tạo đường tròn lớn nhất]
    Cho mặt cầu $(S): (x-1)^2 + y^2 + (z+2)^2 = 25$ và mặt phẳng $(P): 2x - 2y + z + m = 0$. Tìm $m$ để $(P)$ cắt $(S)$ theo một đường tròn có diện tích bằng $9pi$.
    
    *Giải:*
    - $(S)$ có tâm $I(1; 0; -2)$, $R = 5$.
    - Diện tích đường tròn giao tuyến là $9pi => pi r^2 = 9pi => r = 3$.
    - Áp dụng Pytago: $d^2 = R^2 - r^2 = 25 - 9 = 16 => d = 4$.
    - Tính khoảng cách từ $I$ đến $(P)$: 
      $d = (|2(1) - 2(0) + (-2) + m|) / sqrt(2^2 + (-2)^2 + 1^2) = (|m|) / 3 = 4$.
    $=> |m| = 12 <=> m = 12$ hoặc $m = -12$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Mặt phẳng $(P)$ và mặt cầu $(S)$ (tâm $I$, bán kính $R$) có vị trí tương đối là "cắt nhau theo đường tròn" khi khoảng cách $d$ từ $I$ đến $(P)$ thoả mãn điều kiện gì?],
  (
    [$d > R$],
    [$d = R$],
    [$d < R$],
    [$d = 0$]
  ),
  correct: 3,
  num: 1,
  de: "Phần Luyện Tập Cắt Lát",
  loigiai: [
    Để cắt sâu vào bên trong vỏ tạo thành hình tròn, khoảng cách từ tâm đến dao phải ngắn hơn chiều dài bán kính quả cầu ($d < R$).
  ]
)

#lt-tn(
  [Cho mặt cầu $(S)$ tâm $I(0; 0; 0)$, bán kính $R=5$. Mặt phẳng $(P): 3x - 4y = 25$. Vị trí tương đối của $(P)$ và $(S)$ là:],
  (
    [Cắt nhau theo đường tròn],
    [Không cắt nhau],
    [Tiếp xúc ngoài],
    [Đi qua tâm I]
  ),
  correct: 3,
  num: 2,
  de: "Phần Luyện Tập Cắt Lát",
  loigiai: [
    Khoảng cách từ $I$ đến $(P): 3x - 4y - 25 = 0$ là:
    $d = |-25| / sqrt(3^2 + (-4)^2) = 25 / 5 = 5$.
    Vì $d = R = 5$, mặt phẳng tiếp xúc với mặt cầu.
  ]
)

#lt-tn(
  [Một quả dưa hấu hình cầu bán kính $R = 13$ cm. Người ta dùng một con dao mặt phẳng cắt quả dưa tại vị trí cách tâm quả dưa $5$ cm. Mặt cắt lộ ra là một hình tròn đỏ mọng. Bán kính của hình tròn đỏ đó là:],
  (
    [$8$ cm],
    [$144$ cm],
    [$18$ cm],
    [$12$ cm]
  ),
  correct: 4,
  num: 3,
  de: "Phần Luyện Tập Cắt Lát (Toán Thực Tế)",
  loigiai: [
    Áp dụng định lý Pytago: $r = sqrt(R^2 - d^2) = sqrt(13^2 - 5^2) = sqrt(169 - 25) = sqrt(144) = 12$ cm.
  ]
)

#lt-tn(
  [Viết phương trình mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S): x^2+y^2+z^2=9$ tại điểm $M(1; -2; 2)$.],
  (
    [$x - 2y + 2z - 9 = 0$],
    [$x - 2y + 2z + 9 = 0$],
    [$x + y + z - 1 = 0$],
    [$2x - y + 2z - 8 = 0$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Tiếp Tuyến",
  loigiai: [
    Tâm $I(0;0;0)$. VTPT của mặt phẳng tiếp diện là $arrow(n) = arrow(I M) = (1; -2; 2)$.
    PT mặt phẳng đi qua $M(1; -2; 2)$:
    $1(x-1) - 2(y+2) + 2(z-2) = 0 <=> x - 2y + 2z - 9 = 0$.
  ]
)

#lt-tn(
  [Khi dao cắt ngang qua tâm quả cam ($d=0$), đường tròn giao tuyến sinh ra được gọi là gì?],
  (
    [Đường tròn lớn nhất (Đường tròn xích đạo).],
    [Đường tròn nhỏ nhất.],
    [Tiếp tuyến.],
    [Không tạo thành đường tròn.]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Cắt Lát",
  loigiai: [
    Khi $d = 0$, bán kính $r = sqrt(R^2 - 0) = R$. Đây là vòng tròn to nhất có thể cắt được từ quả cầu, thường được gọi là đường tròn xích đạo.
  ]
)
