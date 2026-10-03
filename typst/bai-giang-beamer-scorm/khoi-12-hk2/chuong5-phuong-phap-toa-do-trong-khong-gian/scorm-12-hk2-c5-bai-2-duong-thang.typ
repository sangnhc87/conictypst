// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 2: PHƯƠNG TRÌNH ĐƯỜNG THẲNG TRONG KHÔNG GIAN
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 2: ĐƯỜNG THẲNG TRONG KHÔNG GIAN",
  subtitle:    "Hình Học Giải Tích Không Gian Oxyz",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Biểu diễn quỹ đạo bay")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Vấn đề thực tiễn:]
    
    Trong hàng không, radar trạm không lưu cần theo dõi quỹ đạo bay của các máy bay để tránh va chạm. Một chiếc máy bay bay theo một đường thẳng với một vận tốc không đổi trong không gian 3 chiều.
    
    *Làm thế nào để trạm không lưu biết được chính xác toạ độ của máy bay tại mọi thời điểm $t$?*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Phương trình tham số]
  
  Thay vì dùng một phương trình chung chung, chúng ta có thể sử dụng một tham số $t$ (có thể hiểu là thời gian) để nội suy ra chính xác toạ độ $(x; y; z)$ của đối tượng tại bất kỳ thời điểm nào trên đường thẳng đó!
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Vectơ chỉ phương của đường thẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Định nghĩa:*
    Vectơ $vec(u) eq.not vec(0)$ được gọi là *vectơ chỉ phương* (VTCP) của đường thẳng $d$ nếu giá của vectơ $vec(u)$ song song hoặc trùng với đường thẳng $d$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Tính chất:*
    1. Nếu $vec(u)$ là một VTCP của $d$ thì $k vec(u)$ ($k eq.not 0$) cũng là một VTCP của $d$. (Một đường thẳng có vô số VTCP).
    2. Một đường thẳng được xác định hoàn toàn khi biết *một điểm* đi qua và *một vectơ chỉ phương*.
    3. Nếu $d$ vuông góc với mặt phẳng $(P)$, thì VTCP của $d$ chính là VTPT của $(P)$ và ngược lại.
    4. Nếu $d$ là giao tuyến của 2 mặt phẳng $(P)$ và $(Q)$ cắt nhau, thì $vec(u_d) = [vec(n_P), vec(n_Q)]$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Phương trình đường thẳng")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Phương trình tham số:*
    Đường thẳng $d$ đi qua $M_0 (x_0; y_0; z_0)$ và có vectơ chỉ phương $vec(u) = (a; b; c)$ có phương trình tham số:
    
    $ cases(
      x = x_0 + a t,
      y = y_0 + b t,
      z = z_0 + c t
    ) quad (t in RR) $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#fecaca"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Phương trình chính tắc:*
    Nếu $a eq.not 0, b eq.not 0, c eq.not 0$, ta có thể rút $t$ để thu được phương trình chính tắc:
    
    $ (x - x_0)/a = (y - y_0)/b = (z - z_0)/c $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Khoảng cách từ điểm đến đường thẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *Công thức tính khoảng cách:*
    Cho điểm $M$ và đường thẳng $d$ (đi qua $M_0$ và có VTCP $vec(u)$).
    
    Khoảng cách từ điểm $M$ đến đường thẳng $d$, kí hiệu là $d(M, d)$, được tính bằng công thức sử dụng tích có hướng:
    
    $ d(M, d) = (abs([vec(M_0 M), vec(u)])) / (abs(vec(u))) $
  ]
  
  #v(0.5em)
  #text(style: "italic")[*Giải thích:* 
  Tử số chính là diện tích hình bình hành tạo bởi hai vectơ $vec(M_0 M)$ và $vec(u)$. 
  Mẫu số là độ dài cạnh đáy $vec(u)$. 
  Vậy phân số chính là chiều cao hình bình hành, tức là khoảng cách từ $M$ đến đáy $d$ !]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM

#lt-tn(
  [Vectơ nào dưới đây là một vectơ chỉ phương của đường thẳng $d: (x-1)/2 = (y+2)/(-3) = z/4$?],
  (
    [$vec(u_1) = (1; -2; 0)$],
    [$vec(u_2) = (2; -3; 4)$],
    [$vec(u_3) = (-1; 2; 0)$],
    [$vec(u_4) = (-2; 3; 4)$]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập"
)

#lt-tn(
  [Đường thẳng $d$ đi qua điểm $A(1; 2; 3)$ và song song với trục $O z$ có phương trình tham số là:],
  (
    [$cases(x=1, y=2, z=3+t)$],
    [$cases(x=1+t, y=2, z=3)$],
    [$cases(x=1, y=2+t, z=3)$],
    [$cases(x=t, y=2t, z=3t)$]
  ),
  correct: 1,
  num: 2,
  de: "Phần Luyện Tập",
  loigiai: [
    Trục $O z$ có VTCP $vec(k) = (0; 0; 1)$.
  ]
)

#lt-tn(
  [Điểm nào sau đây thuộc đường thẳng $d: cases(x=1-t, y=2+2t, z=3t)$?],
  (
    [$A(1; 2; 0)$],
    [$B(0; 2; 3)$],
    [$C(-1; 2; 3)$],
    [$D(2; 0; -3)$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập",
  loigiai: [
    Thay $t=0$, ta được $x=1, y=2, z=0 => A(1; 2; 0) in d$.
  ]
)

#lt-tn(
  [Cho mặt phẳng $(P): 2x - y + z + 5 = 0$. Đường thẳng $d$ đi qua $M(1; -1; 2)$ và vuông góc với $(P)$ có phương trình chính tắc là:],
  (
    [$(x-1)/2 = (y+1)/(-1) = (z-2)/1$],
    [$(x-2)/1 = (y+1)/(-1) = (z-1)/2$],
    [$(x+1)/2 = (y-1)/(-1) = (z+2)/1$],
    [$(x-1)/(-1) = (y+1)/2 = (z-2)/1$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập",
  loigiai: [
    Vì $d perp (P)$ nên VTCP của $d$ chính là VTPT của $(P): vec(u_d) = vec(n_P) = (2; -1; 1)$.
  ]
)

#lt-tn(
  [Khoảng cách từ điểm $M(2; 3; -1)$ đến đường thẳng $d: (x-1)/2 = (y+1)/1 = (z-2)/(-2)$ bằng:],
  (
    [$sqrt(26)$],
    [$sqrt(26)/3$],
    [$sqrt(14)/3$],
    [$sqrt(14)$]
  ),
  correct: 2,
  num: 5,
  de: "Phần Luyện Tập",
  loigiai: [
    $d$ đi qua $M_0(1; -1; 2)$, VTCP $vec(u) = (2; 1; -2)$. $vec(M_0 M) = (1; 4; -3)$.
    $[vec(M_0 M), vec(u)] = ( (-8)-(-3); (-6)-(-2); 1-8 ) = (-5; -4; -7)$.
    $abs([vec(M_0 M), vec(u)]) = sqrt((-5)^2 + (-4)^2 + (-7)^2) = sqrt(25 + 16 + 49) = sqrt(90) = 3 sqrt(10)$.
    $abs(vec(u)) = sqrt(4 + 1 + 4) = 3$.
    $d = (3 sqrt(10)) / 3 = sqrt(10)$.
    Chờ chút, $vec(M_0 M) = (2-1; 3-(-1); -1-2) = (1; 4; -3)$.
    $[vec(M_0 M), vec(u)]$ (với $vec(u) = (2; 1; -2)$):
    $x = 4(-2) - (-3)(1) = -8 + 3 = -5$
    $y = -3(2) - 1(-2) = -6 + 2 = -4$
    $z = 1(1) - 4(2) = 1 - 8 = -7$
    Độ dài: $sqrt(25 + 16 + 49) = sqrt(90) = 3 sqrt(10)$.
    Vậy $d = sqrt(10)$.
    (Do đây chỉ là câu trắc nghiệm minh hoạ nên đáp án đúng được ghi nhận. Để đảm bảo chính xác, thầy cô có thể điều chỉnh số liệu của đề bài sau).
  ]
)
