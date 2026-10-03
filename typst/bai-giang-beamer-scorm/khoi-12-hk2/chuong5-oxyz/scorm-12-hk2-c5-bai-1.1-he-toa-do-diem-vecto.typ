// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 1.1: HỆ TỌA ĐỘ OXYZ - ĐIỂM VÀ VECTƠ
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.1: HỆ TRỤC TỌA ĐỘ OXYZ",
  subtitle:    "Định vị mọi vật thể trong không gian 3 chiều",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Từ Cờ vua đến Drone bay")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Thế giới 2D và 3D:]
    
    Khi chơi cờ vua, ta chỉ cần 2 thông số để xác định vị trí một quân cờ (ví dụ: cột E, hàng 4). Đó là hệ toạ độ Oxy (2D) - mọi thứ đều bám trên mặt đất.
    
    Nhưng nếu bạn đang điều khiển một chiếc *Flycam (Drone)*, để báo chính xác vị trí của nó, ngoài toạ độ Kinh độ (X) và Vĩ độ (Y), bạn *bắt buộc* phải có thêm thông số *Độ cao* (Z). 
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Hệ trục toạ độ Không gian Oxyz]
  
  Bằng cách thêm một trục cao (trục $O z$) vuông góc với mặt đất $O x y$, các nhà toán học đã giúp con người định vị chính xác mọi điểm trong vũ trụ 3D!
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Cấu tạo Hệ trục toạ độ Oxyz")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    Hệ gồm 3 trục vuông góc với nhau từng đôi một tại gốc $O$:
    - Trục hoành $O x$ (kèm vectơ đơn vị $arrow(i)$).
    - Trục tung $O y$ (kèm vectơ đơn vị $arrow(j)$).
    - Trục cao $O z$ (kèm vectơ đơn vị $arrow(k)$).
    
    *Quy ước:* $|arrow(i)| = |arrow(j)| = |arrow(k)| = 1$ và $arrow(i) perp arrow(j)$, $arrow(j) perp arrow(k)$, $arrow(k) perp arrow(i)$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Toạ độ Điểm và Vectơ:*
    - Một điểm $M(x; y; z)$ trong không gian tương đương với $arrow(O M) = x arrow(i) + y arrow(j) + z arrow(k)$.
    - Các thành phần $x, y, z$ lần lượt gọi là *hoành độ, tung độ* và *cao độ*.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Phép toán Vectơ cơ bản")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Cho $arrow(u) = (x_1; y_1; z_1)$ và $arrow(v) = (x_2; y_2; z_2)$.
    
    1. *Cộng/Trừ:* $arrow(u) +- arrow(v) = (x_1 +- x_2; y_1 +- y_2; z_1 +- z_2)$. 
       *(Hoành cộng hoành, tung cộng tung, cao cộng cao).*
       
    2. *Nhân một số với vectơ:* $k arrow(u) = (k x_1; k y_1; k z_1)$ với $k in RR$.
    
    3. *Hai vectơ bằng nhau:* $arrow(u) = arrow(v) <=> cases(x_1 = x_2, y_1 = y_2, z_1 = z_2)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ứng dụng: Vectơ đoạn thẳng & Trung điểm")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Bộ công cụ hình học giải tích Oxyz]
    Cho $A(x_A; y_A; z_A)$ và $B(x_B; y_B; z_B)$.
    
    *1. Vectơ tạo bởi hai điểm (Quy tắc "Ngọn trừ Gốc"):*
    $ arrow(A B) = (x_B - x_A; y_B - y_A; z_B - z_A) $
    
    *2. Toạ độ Trung điểm $I$ của đoạn $A B$:* (Trung bình cộng)
    $ x_I = (x_A + x_B)/2, quad y_I = (y_A + y_B)/2, quad z_I = (z_A + z_B)/2 $
    
    *3. Toạ độ Trọng tâm $G$ của tam giác $A B C$:* (Trung bình cộng 3 đỉnh)
    $ x_G = (x_A + x_B + x_C)/3, quad y_G = (y_A + y_B + y_C)/3, quad z_G = (z_A + z_B + z_C)/3 $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Trong hệ toạ độ Oxyz, cho $arrow(u) = 2 arrow(i) - 3 arrow(j) + arrow(k)$. Toạ độ của vectơ $arrow(u)$ là:],
  (
    [$(2; -3; 0)$],
    [$(2; -3; 1)$],
    [$(2; 3; 1)$],
    [$(-3; 2; 1)$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    Hệ số trước $arrow(i), arrow(j), arrow(k)$ lần lượt là $2; -3; 1$. Nên $arrow(u) = (2; -3; 1)$.
  ]
)

#lt-tn(
  [Cho hai điểm $A(1; -2; 3)$ và $B(-1; 4; 5)$. Toạ độ vectơ $arrow(A B)$ là:],
  (
    [$(0; 2; 8)$],
    [$(-2; 6; 2)$],
    [$(2; -6; -2)$],
    [$(0; 1; 4)$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    Quy tắc ngọn trừ gốc: $arrow(A B) = (x_B - x_A; y_B - y_A; z_B - z_A) = (-1-1; 4-(-2); 5-3) = (-2; 6; 2)$.
  ]
)

#lt-tn(
  [Cho $A(3; 0; -1)$, $B(1; 2; 5)$. Toạ độ trung điểm $I$ của đoạn thẳng $A B$ là:],
  (
    [$(2; 1; 2)$],
    [$(4; 2; 4)$],
    [$(-1; 1; 3)$],
    [$(2; -1; -3)$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    Trung bình cộng: $x_I = (3+1)/2 = 2$; $y_I = (0+2)/2 = 1$; $z_I = (-1+5)/2 = 2$. Vậy $I(2; 1; 2)$.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ với $A(1; 1; 1)$, $B(-1; 2; 0)$, $C(3; -3; 2)$. Toạ độ trọng tâm $G$ của tam giác là:],
  (
    [$(1; 0; 1)$],
    [$(3; 0; 3)$],
    [$(1; 1; 1)$],
    [$(0; 0; 0)$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập Oxyz",
  loigiai: [
    Trung bình cộng 3 đỉnh: 
    $x_G = (1-1+3)/3 = 1$; 
    $y_G = (1+2-3)/3 = 0$; 
    $z_G = (1+0+2)/3 = 1$. 
    Vậy $G(1; 0; 1)$.
  ]
)

#lt-tn(
  [Biết hình chiếu vuông góc của một điểm $M(x; y; z)$ lên mặt phẳng toạ độ $(O x y)$ sẽ làm mất đi cao độ (tức là $z=0$). Điểm $M(4; -5; 7)$ khi chiếu vuông góc xuống mặt phẳng $(O x y)$ sẽ trở thành điểm $M'$ có toạ độ là:],
  (
    [$(4; 0; 0)$],
    [$(0; -5; 0)$],
    [$(0; 0; 7)$],
    [$(4; -5; 0)$]
  ),
  correct: 4,
  num: 5,
  de: "Phần Luyện Tập Toán Thực Tế Oxyz",
  loigiai: [
    Chiếu lên mặt phẳng nào thì "vắng bóng" trục nào, thành phần đó bằng 0. 
    Chiếu lên $(O x y)$ (thiếu $z$), nên $z=0$. Các toạ độ còn lại giữ nguyên. $M'(4; -5; 0)$.
  ]
)
