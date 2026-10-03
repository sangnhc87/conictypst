// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 3: MẶT CẦU
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 3: PHƯƠNG TRÌNH MẶT CẦU",
  subtitle:    "Hình Học Giải Tích Không Gian Oxyz",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Hình dạng hoàn hảo nhất")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Vấn đề thực tiễn:]
    
    Trong vũ trụ, các hành tinh, ngôi sao, hay thậm chí là bong bóng xà phòng đều có xu hướng tạo thành hình cầu. Trái Đất chúng ta đang sống cũng được xấp xỉ là một mặt cầu khổng lồ.
    
    *Làm thế nào để xác định vị trí của một máy bay hoặc vệ tinh so với bề mặt Trái Đất bằng các phương trình toán học?*
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Phương trình Mặt Cầu]
  
  Bằng cách đặt hệ tọa độ $O x y z$ với gốc toạ độ $O$ tại tâm Trái Đất, ta có thể dùng phương trình đại số để mô tả bề mặt Trái Đất, từ đó tính toán được khoảng cách, tầm nhìn, và quỹ đạo vệ tinh một cách dễ dàng.
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Phương trình mặt cầu")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Phương trình dạng chính tắc:*
    Trong không gian $O x y z$, mặt cầu $(S)$ có tâm $I(a; b; c)$ và bán kính $R > 0$ có phương trình là:
    
    $ (x - a)^2 + (y - b)^2 + (z - c)^2 = R^2 $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Phương trình dạng tổng quát (khai triển):*
    Khi khai triển dạng chính tắc, ta được phương trình có dạng:
    
    $ x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0 $
    
    *Điều kiện để là phương trình mặt cầu:* $a^2 + b^2 + c^2 - d > 0$.
    Khi đó, mặt cầu có:
    - Tâm $I(a; b; c)$
    - Bán kính $R = sqrt(a^2 + b^2 + c^2 - d)$
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Vị trí tương đối của Mặt phẳng và Mặt cầu")[
  Cho mặt cầu $(S)$ tâm $I$, bán kính $R$ và mặt phẳng $(alpha)$. Gọi $d = d(I, (alpha))$ là khoảng cách từ tâm $I$ đến mặt phẳng.
  
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10pt,
    [
      #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#fecaca"), inset: 10pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#991b1b"))[1. $d > R$]
        
        Mặt phẳng và mặt cầu *không giao nhau*.
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1pt + rgb("#fde68a"), inset: 10pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#b45309"))[2. $d = R$]
        
        Mặt phẳng *tiếp xúc* với mặt cầu tại một điểm $H$.
        $(alpha)$ gọi là *tiếp diện*.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, height: 100%)[
        #text(weight: "bold", fill: rgb("#166534"))[3. $d < R$]
        
        Mặt phẳng *cắt* mặt cầu theo giao tuyến là một đường tròn có bán kính $r = sqrt(R^2 - d^2)$.
      ]
    ]
  )
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ứng dụng: Xác định toạ độ tâm bão")[
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#334155"))[Bài toán Radar Khí Tượng]
    
    Một trạm radar đặt tại gốc toạ độ $O(0;0;0)$ phát hiện một cơn bão có hình dạng xấp xỉ một khối cầu. 
    Các máy bay trinh sát báo cáo 4 điểm nằm trên ranh giới của cơn bão là $A(2; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 2)$ và $D(2; 2; 2)$.
    
    *Hỏi:* Tâm của cơn bão nằm ở đâu và cơn bão có bán kính bao nhiêu km (nếu 1 đơn vị toạ độ tương ứng 10km)?
    
    *Giải:*
    Gọi phương trình mặt cầu bão là $x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0$.
    Thay toạ độ $A, B, C, D$ vào, ta giải được hệ phương trình:
    $a = 1, b = 1, c = 1, d = 0$.
    
    Vậy tâm bão là $I(1; 1; 1)$. 
    Bán kính $R = sqrt(1^2 + 1^2 + 1^2 - 0) = sqrt(3)$ đơn vị $approx 17.32$ km.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM

#lt-tn(
  [Mặt cầu $(S): (x-1)^2 + (y+2)^2 + (z-3)^2 = 16$ có tâm $I$ và bán kính $R$ là:],
  (
    [$I(1; -2; 3), R=16$],
    [$I(-1; 2; -3), R=4$],
    [$I(1; -2; 3), R=4$],
    [$I(-1; 2; -3), R=16$]
  ),
  correct: 3,
  num: 1,
  de: "Phần Luyện Tập"
)

#lt-tn(
  [Phương trình nào sau đây là phương trình của một mặt cầu?],
  (
    [$x^2 + y^2 + z^2 - 2x + 4y - 6z + 15 = 0$],
    [$x^2 + y^2 + z^2 - 2x + 4y - 6z + 14 = 0$],
    [$x^2 + y^2 + z^2 - 2x + 4y - 6z + 13 = 0$],
    [$x^2 + y^2 + z^2 - 2x + 4y - 6z + 12 = 0$]
  ),
  correct: 4,
  num: 2,
  de: "Phần Luyện Tập",
  loigiai: [
    Ta có $a=1, b=-2, c=3$. $a^2 + b^2 + c^2 = 1 + 4 + 9 = 14$.
    Điều kiện là mặt cầu: $14 - d > 0 <=> d < 14$. 
    Chỉ có đáp án cuối ($d=12$) là thoả mãn.
  ]
)

#lt-tn(
  [Mặt cầu $(S)$ có tâm $I(1; -2; 3)$ và đi qua gốc toạ độ $O(0; 0; 0)$ có phương trình là:],
  (
    [$(x-1)^2 + (y+2)^2 + (z-3)^2 = 14$],
    [$(x-1)^2 + (y+2)^2 + (z-3)^2 = sqrt(14)$],
    [$(x+1)^2 + (y-2)^2 + (z+3)^2 = 14$],
    [$(x-1)^2 + (y+2)^2 + (z-3)^2 = 13$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập",
  loigiai: [
    Bán kính $R = O I = sqrt(1^2 + (-2)^2 + 3^2) = sqrt(14) => R^2 = 14$.
  ]
)

#lt-tn(
  [Cho mặt cầu $(S)$ có tâm $I(2; -1; 1)$ và bán kính $R=3$. Mặt phẳng $(P): 2x - y + 2z - 1 = 0$ cắt mặt cầu $(S)$ theo giao tuyến là một đường tròn có bán kính $r$ bằng:],
  (
    [$sqrt(5)$],
    [$5$],
    [$sqrt(2)$],
    [$2$]
  ),
  correct: 1,
  num: 4,
  de: "Phần Luyện Tập",
  loigiai: [
    Khoảng cách $d(I, (P)) = |2(2) - (-1) + 2(1) - 1| / sqrt(2^2 + (-1)^2 + 2^2) = 6/3 = 2$.
    Bán kính đường tròn $r = sqrt(R^2 - d^2) = sqrt(3^2 - 2^2) = sqrt(5)$.
  ]
)

#lt-tn(
  [Phương trình mặt phẳng tiếp xúc với mặt cầu $(S): x^2 + y^2 + z^2 - 2x - 4y - 6z + 5 = 0$ tại điểm $M(3; 1; 1)$ là:],
  (
    [$2x - y - 2z - 3 = 0$],
    [$2x - y - 2z + 3 = 0$],
    [$2x + y - 2z - 5 = 0$],
    [$2x - y + 2z - 7 = 0$]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập",
  loigiai: [
    Tâm mặt cầu $I(1; 2; 3)$. Tiếp diện tại $M(3; 1; 1)$ nhận $vec(I M) = (2; -1; -2)$ làm VTPT.
    Phương trình: $2(x-3) - 1(y-1) - 2(z-1) = 0 <=> 2x - y - 2z - 3 = 0$.
  ]
)
