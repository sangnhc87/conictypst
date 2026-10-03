// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 3.1: PHƯƠNG TRÌNH ĐƯỜNG THẲNG
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 3.1: PHƯƠNG TRÌNH ĐƯỜNG THẲNG",
  subtitle:    "Vectơ chỉ phương và Quỹ đạo chuyển động",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Mô phỏng đường bay tên lửa")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Bản chất Động học:]
    
    Hãy tưởng tượng bạn phóng một quả tên lửa trong không gian không trọng lực.
    
    Tại thời điểm $t=0$, tên lửa ở vị trí xuất phát $M_0$. Tên lửa bay theo một hướng cố định với vận tốc không đổi, đặc trưng bởi *Vectơ chỉ phương* $arrow(u) = (a; b; c)$.
    
    *Làm sao để biết chính xác vị trí của tên lửa tại bất kỳ thời điểm $t$ nào trong tương lai?*
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Phương trình Tham số của Đường thẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    Đường thẳng $d$ đi qua điểm $M_0 (x_0; y_0; z_0)$ và có Vectơ chỉ phương (VTCP) $arrow(u) = (a; b; c) eq.not arrow(0)$ có *phương trình tham số* là:
    
    $ cases(x = x_0 + a t, y = y_0 + b t, z = z_0 + c t) quad (t in RR) $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Ý nghĩa Vật lý:* 
    Tham số $t$ chính là *Thời gian*. 
    Mỗi giá trị của $t$ sinh ra một toạ độ $(x; y; z)$ - đó chính là vị trí của chất điểm trên quỹ đạo đường thẳng tại thời điểm $t$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Phương trình Chính tắc")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Nếu từ phương trình tham số, ta rút $t$ ra khỏi cả 3 phương trình (với điều kiện $a, b, c eq.not 0$):
    $ t = (x - x_0)/a = (y - y_0)/b = (z - z_0)/c $
    
    Đây được gọi là *Phương trình chính tắc* của đường thẳng.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt, width: 100%)[
    #text(weight: "bold", fill: rgb("#334155"))[Mẹo đọc nhanh:]
    Cho $d: (x - 1)/2 = (y + 3)/(-1) = z/5$.
    - Nhìn xuống *Dưới Mẫu*: Ta bắt ngay được VTCP $arrow(u) = (2; -1; 5)$.
    - Nhìn lên *Trên Tử* (nhớ đổi dấu): Ta bắt ngay điểm đi qua $M_0 (1; -3; 0)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Kỹ thuật dựng VTCP trong thực chiến")[
  #text(weight: "bold", fill: rgb("#b45309"))[1. Đường thẳng đi qua hai điểm A và B:]
  Vì $A, B$ cùng nằm trên đường thẳng nên ta chọn luôn $arrow(u) = arrow(A B)$.
  
  #v(0.5em)
  #text(weight: "bold", fill: rgb("#166534"))[2. Đường thẳng vuông góc với Mặt phẳng (P):]
  Nếu đường thẳng $d$ vuông góc với mặt phẳng $(P)$, thì VTCP của đường thẳng chính là VTPT của mặt phẳng! ($arrow(u)_d = arrow(n)_P$).
  
  #v(0.5em)
  #text(weight: "bold", fill: rgb("#1d4ed8"))[3. Đường thẳng là Giao tuyến của hai Mặt phẳng (P) và (Q):]
  Đường thẳng giao tuyến vừa nằm trong $(P)$ vừa nằm trong $(Q)$, nên nó vuông góc với cả 2 VTPT. Do đó: $arrow(u) = [arrow(n)_P, arrow(n)_Q]$.
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Một đường thẳng $d$ có phương trình chính tắc: $(x-2)/3 = (y+1)/-2 = (z-4)/5$. Vectơ nào sau đây là vectơ chỉ phương của $d$?],
  (
    [$(2; -1; 4)$],
    [$(3; -2; 5)$],
    [$(-2; 1; -4)$],
    [$(-3; -2; 5)$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Đường Thẳng",
  loigiai: [
    Nhìn dưới mẫu số, ta lấy được $arrow(u) = (3; -2; 5)$.
  ]
)

#lt-tn(
  [Điểm nào sau đây *NẰM TRÊN* đường thẳng $d: (x-1)/2 = (y-3)/(-1) = (z+2)/4$ ?],
  (
    [$(1; 3; -2)$],
    [$(2; -1; 4)$],
    [$(-1; -3; 2)$],
    [$(3; 2; 6)$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập Đường Thẳng",
  loigiai: [
    Nhìn trên tử (đổi dấu), ta được điểm $M_0 (1; 3; -2)$ nằm trên đường thẳng.
    (Thử nghiệm: Thay toạ độ vào cả 3 phân số đều ra 0).
  ]
)

#lt-tn(
  [Phương trình tham số của đường thẳng đi qua $A(1; 2; -1)$ và $B(2; -1; 1)$ là:],
  (
    [$x=1+2t, y=2-t, z=-1+t$],
    [$x=1+t, y=2-3t, z=-1+2t$],
    [$x=2+t, y=-1+2t, z=1-t$],
    [$x=t, y=-3t, z=2t$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập Đường Thẳng",
  loigiai: [
    VTCP $arrow(u) = arrow(A B) = (1; -3; 2)$.
    Điểm đi qua: Chọn $A(1; 2; -1)$.
    PT: $x=1+t, y=2-3t, z=-1+2t$.
  ]
)

#lt-tn(
  [Đường thẳng $d$ đi qua $M(0; -1; 4)$ và vuông góc với mặt phẳng $(P): 2x - y + 5z - 3 = 0$ có phương trình là:],
  (
    [$(x)/0 = (y+1)/(-1) = (z-4)/4$],
    [$(x)/2 = (y+1)/(-1) = (z-4)/5$],
    [$(x-2)/0 = (y+1)/(-1) = (z-5)/4$],
    [$(x)/2 = (y-1)/(-1) = (z+4)/5$]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập Đường Thẳng",
  loigiai: [
    Vì $d perp (P)$ nên $arrow(u)_d = arrow(n)_P = (2; -1; 5)$.
    Đường thẳng qua $M(0; -1; 4)$ nên PT chính tắc: $x/2 = (y+1)/(-1) = (z-4)/5$.
  ]
)

#lt-tn(
  [Một drone bắt đầu bay từ gốc toạ độ $O$ với vận tốc không đổi, VTCP là $arrow(u) = (10; 20; 5)$ (m/s). Sau 3 giây, drone ở vị trí có toạ độ là bao nhiêu?],
  (
    [$(10; 20; 5)$],
    [$(3; 3; 3)$],
    [$(30; 60; 15)$],
    [$(13; 23; 8)$]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập Toán Thực Tế",
  loigiai: [
    PT chuyển động: $x = 0 + 10t, y = 0 + 20t, z = 0 + 5t$.
    Tại $t=3$, ta có $x=30, y=60, z=15$. Vị trí là $(30; 60; 15)$.
  ]
)
