#import "_config.typ": *

#lesson([Phương trình mặt phẳng], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Vectơ pháp tuyến của mặt phẳng])

#block(breakable: false)[
  #dn(title: [Định nghĩa vectơ pháp tuyến])[
    - Vectơ $vec(n) != vec(0)$ được gọi là *vectơ pháp tuyến* (VPT) của mặt phẳng $(alpha)$ nếu giá của $vec(n)$ vuông góc với mặt phẳng $(alpha)$.
    - *Cách tìm VPT từ cặp vectơ chỉ phương:* Nếu hai vectơ không cùng phương $vec(u), vec(v)$ có giá song song hoặc nằm trên mặt phẳng $(alpha)$ thì vectơ tích có hướng $vec(n) = [vec(u), vec(v)]$ là một vectơ pháp tuyến của $(alpha)$.
  ]
]

#muc([Phương trình tổng quát của mặt phẳng])

#block(breakable: false)[
  #phuongphap(title: [Các dạng phương trình mặt phẳng])[
    1. *Phương trình mặt phẳng đi qua một điểm có VPT:*
       Mặt phẳng đi qua điểm $M_0(x_0; y_0; z_0)$ và nhận $vec(n) = (A; B; C)$ làm VPT có phương trình là:
       $ A(x - x_0) + B(y - y_0) + C(z - z_0) = 0 $
       Sau khi khai triển ta được dạng tổng quát: $A x + B y + C z + D = 0$ (với $A^2 + B^2 + C^2 > 0$).
    2. *Phương trình mặt phẳng theo đoạn chắn:*
       Mặt phẳng cắt ba trục tọa độ tại các điểm $A(a; 0; 0)$, $B(0; b; 0)$, $C(0; 0; c)$ với $a, b, c != 0$ có phương trình là:
       $ frac(x, a) + frac(y, b) + frac(z, c) = 1 $
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Mặt phẳng alpha dưới dạng hình bình hành
    let P_A = (-1.0, -0.6)
    let P_B = (3.8, -0.6)
    let P_C = (5.0, 1.2)
    let P_D = (0.2, 1.2)
    
    line(P_A, P_B, P_C, P_D, close: true, fill: rgb("#eff6ff"), stroke: 0.8pt + rgb("#3b82f6").lighten(30%))
    content((4.4, 1.0), $(alpha)$, fill: none)
    
    // Hình chiếu H trên mặt phẳng
    let H = (2.2, 0.4)
    // Điểm M ngoài mặt phẳng
    let M = (2.2, 2.4)
    
    // Vẽ đường vuông góc MH
    line(H, M, stroke: 1.2pt + rgb("#b91c1c"))
    // Vẽ nét đứt phần kéo dài phía dưới H (nếu có, ở đây vẽ nét đứt đoạn nhỏ tại chân)
    circle(H, radius: 0.04, fill: black)
    circle(M, radius: 0.05, fill: rgb("#b91c1c"))
    
    // Ký hiệu góc vuông tại chân đường cao H
    line((2.2, 0.7), (2.45, 0.75), (2.45, 0.45), stroke: 0.6pt)
    
    // Vẽ vectơ pháp tuyến n từ một điểm trên mặt phẳng
    let P = (0.8, 0.2)
    let N_pt = (0.8, 1.8)
    line(P, N_pt, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#065f46"))
    circle(P, radius: 0.03, fill: black)
    
    // Tên nhãn
    content((2.5, 2.5), $M$)
    content((2.5, 0.2), $H$)
    content((0.8, 2.1), $vec(n)$)
    content((2.6, 1.4), $d(M, (alpha))$, fill: white)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 4. Khoảng cách từ điểm $M$ đến mặt phẳng $(alpha)$ và vectơ pháp tuyến $vec(n)$]
]

#muc([Khoảng cách từ một điểm đến một mặt phẳng])

#block(breakable: false)[
  #phuongphap(title: [Công thức khoảng cách])[
    Khoảng cách từ điểm $M(x_0; y_0; z_0)$ đến mặt phẳng $(alpha): A x + B y + C z + D = 0$ được tính bởi công thức:
    $ d(M, (alpha)) = frac(|A x_0 + B y_0 + C z_0 + D|, sqrt(A^2 + B^2 + C^2)) $
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b4-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
