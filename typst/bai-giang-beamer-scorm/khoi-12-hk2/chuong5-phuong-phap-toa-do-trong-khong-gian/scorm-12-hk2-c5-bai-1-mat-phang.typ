// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 1: PHƯƠNG TRÌNH MẶT PHẲNG
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1: PHƯƠNG TRÌNH MẶT PHẲNG",
  subtitle:    "Hình Học Giải Tích Không Gian Oxyz",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Mô hình hoá mặt phẳng")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Vấn đề thực tiễn:]
    
    Trong kiến trúc và đồ hoạ máy tính 3D, một toà nhà hay một nhân vật game đều được cấu tạo từ hàng ngàn mặt phẳng nhỏ (polygons). 
    
    *Làm thế nào để máy tính hiểu và xử lý được "mặt phẳng" bằng các con số?*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Đại số hoá Hình học]
  
  Bằng cách gán cho không gian một hệ trục tọa độ $O x y z$, ta có thể biểu diễn mỗi mặt phẳng thông qua một phương trình bậc nhất ba ẩn. Yếu tố quan trọng nhất để xác định hướng của mặt phẳng chính là một vector vuông góc với nó, gọi là *Vector pháp tuyến*.
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Vectơ pháp tuyến của mặt phẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Định nghĩa:*
    Vectơ $vec(n) eq.not vec(0)$ được gọi là *vectơ pháp tuyến* (VTPT) của mặt phẳng $(alpha)$ nếu giá của vectơ $vec(n)$ vuông góc với mặt phẳng $(alpha)$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Tính chất quan trọng:*
    1. Nếu $vec(n)$ là một VTPT của $(alpha)$ thì $k vec(n)$ ($k eq.not 0$) cũng là một VTPT của $(alpha)$. (Một mặt phẳng có vô số VTPT cùng phương với nhau).
    2. Một mặt phẳng được xác định hoàn toàn khi biết *một điểm* đi qua và *một vectơ pháp tuyến*.
    3. Nếu $(alpha)$ chứa hai vectơ không cùng phương $vec(a)$ và $vec(b)$, thì VTPT của $(alpha)$ có thể được tính bằng tích có hướng: $vec(n) = [vec(a), vec(b)]$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Phương trình tổng quát của mặt phẳng")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Phương trình khi biết 1 điểm và VTPT:*
    Mặt phẳng $(alpha)$ đi qua điểm $M_0 (x_0; y_0; z_0)$ và có vectơ pháp tuyến $vec(n) = (A; B; C)$ có phương trình là:
    $ A(x - x_0) + B(y - y_0) + C(z - z_0) = 0 $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#fecaca"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Dạng tổng quát:*
    Mọi mặt phẳng trong không gian Oxyz đều có phương trình dạng:
    $ A x + B y + C z + D = 0 $
    Trong đó $A^2 + B^2 + C^2 > 0$.
    Khi đó, vectơ $vec(n) = (A; B; C)$ chính là một vectơ pháp tuyến của mặt phẳng.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Khoảng cách từ một điểm đến mặt phẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức tính khoảng cách:*
    Trong không gian Oxyz, cho điểm $M(x_0; y_0; z_0)$ và mặt phẳng $(alpha)$ có phương trình $A x + B y + C z + D = 0$. 
    
    Khoảng cách từ điểm $M$ đến mặt phẳng $(alpha)$, kí hiệu là $d(M, (alpha))$, được tính bằng công thức:
    
    $ d(M, (alpha)) = |A x_0 + B y_0 + C z_0 + D| / sqrt(A^2 + B^2 + C^2) $
  ]
  
  #v(0.5em)
  #text(style: "italic")[*Lưu ý:* Công thức này có cấu trúc rất giống với công thức khoảng cách từ một điểm đến đường thẳng trong hình học phẳng Oxy lớp 10.]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM

#lt-tn(
  [Vectơ nào dưới đây là một vectơ pháp tuyến của mặt phẳng $(P): 2x - 3y + 4z - 5 = 0$?],
  (
    [$vec(n_1) = (2; 3; 4)$],
    [$vec(n_2) = (2; -3; 4)$],
    [$vec(n_3) = (2; -3; -5)$],
    [$vec(n_4) = (-3; 4; -5)$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập"
)

#lt-tn(
  [Phương trình mặt phẳng đi qua điểm $M(1; -2; 3)$ và có vectơ pháp tuyến $vec(n) = (2; 1; -1)$ là:],
  (
    [$2x + y - z + 3 = 0$],
    [$2x + y - z - 3 = 0$],
    [$x - 2y + 3z - 3 = 0$],
    [$2x - y + z - 7 = 0$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập",
  loigiai: [
    $2(x - 1) + 1(y + 2) - 1(z - 3) = 0 <=> 2x + y - z + 3 = 0$.
  ]
)

#lt-tn(
  [Khoảng cách từ điểm $A(1; 2; -1)$ đến mặt phẳng $(P): 2x + 2y - z - 5 = 0$ bằng:],
  (
    [$2$],
    [$2/3$],
    [$3$],
    [$1$]
  ),
  correct: 2,
  num: 3,
  de: "Phần Luyện Tập",
  loigiai: [
    $d = |2(1) + 2(2) - (-1) - 5| / sqrt(2^2 + 2^2 + (-1)^2) = |2 + 4 + 1 - 5| / 3 = 2/3$.
  ]
)

#lt-tn(
  [Mặt phẳng $(P): x/2 + y/(-3) + z/4 = 1$ có một vectơ pháp tuyến là:],
  (
    [$vec(n) = (2; -3; 4)$],
    [$vec(n) = (1/2; -1/3; 1/4)$],
    [$vec(n) = (2; 3; 4)$],
    [$vec(n) = (6; -4; 3)$]
  ),
  correct: 2,
  num: 4,
  de: "Phần Luyện Tập",
  loigiai: [
    Phương trình viết lại: $1/2 x - 1/3 y + 1/4 z - 1 = 0 => vec(n) = (1/2; -1/3; 1/4)$.
  ]
)

#lt-tn(
  [Cho hai điểm $A(1; 0; 2)$ và $B(-1; 2; 4)$. Phương trình mặt phẳng trung trực của đoạn thẳng $A B$ là:],
  (
    [$x - y - z - 2 = 0$],
    [$x - y - z + 2 = 0$],
    [$x - y - z + 4 = 0$],
    [$-x + y + z - 4 = 0$]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập",
  loigiai: [
    Trung điểm $I(0; 1; 3)$. VTPT là $vec(A B) = (-2; 2; 2)$, ta chọn $vec(n) = (1; -1; -1)$. 
    Phương trình: $1(x - 0) - 1(y - 1) - 1(z - 3) = 0 <=> x - y - z + 4 = 0$.
  ]
)
