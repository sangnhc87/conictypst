#import "_config.typ": *

#lesson([Phương trình đường thẳng], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Vectơ chỉ phương và các dạng phương trình đường thẳng])

#block(breakable: false)[
  #dn(title: [Định nghĩa vectơ chỉ phương])[
    - Vectơ $vec(u) != vec(0)$ được gọi là *vectơ chỉ phương* (VCP) của đường thẳng $d$ nếu giá của $vec(u)$ song song hoặc trùng với $d$.
    - Một đường thẳng hoàn toàn được xác định nếu biết một điểm đi qua và một VCP.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Các dạng phương trình đường thẳng])[
    Cho đường thẳng $d$ đi qua điểm $M_0(x_0; y_0; z_0)$ và nhận $vec(u) = (a; b; c)$ làm VCP:
    1. *Phương trình tham số của đường thẳng $d$:*
       $ cases(x = x_0 + a t, y = y_0 + b t, z = z_0 + c t) quad (t in RR) $
    2. *Phương trình chính tắc của đường thẳng $d$ (với $a, b, c != 0$):*
       $ frac(x - x_0, a) = frac(y - y_0, b) = frac(z - z_0, c) $
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
    
    line(P_A, P_B, P_C, P_D, close: true, fill: rgb("#fcf6f0"), stroke: 0.8pt + rgb("#b45309").lighten(50%))
    content((4.4, 1.0), $(alpha)$, fill: none)
    
    // Giao điểm I trên mặt phẳng
    let I = (1.8, 0.4)
    // Điểm M nằm trên đường thẳng d phía trên mặt phẳng
    let M = (3.2, 2.0)
    // Hình chiếu vuông góc H của M trên mặt phẳng
    let H = (3.2, 0.4)
    
    // Đường thẳng d (phần trên mặt phẳng nét liền, qua I đến M và xa hơn)
    line(I, M, stroke: 1.2pt + rgb("#065f46"))
    line(M, (3.9, 2.8), stroke: 1.2pt + rgb("#065f46"))
    
    // Phần đường thẳng d phía dưới mặt phẳng (nét đứt rồi nét liền)
    line(I, (1.0, -0.6), stroke: (paint: rgb("#065f46"), thickness: 1.2pt, dash: "dashed"))
    line((1.0, -0.6), (0.5, -1.2), stroke: 1.2pt + rgb("#065f46"))
    
    // Hình chiếu d' trên mặt phẳng (đường IH)
    line(I, H, stroke: (paint: black, thickness: 0.7pt, dash: "dashed"))
    // Đường dóng vuông góc MH
    line(M, H, stroke: (paint: gray, thickness: 0.7pt, dash: "dashed"))
    
    // Vectơ pháp tuyến n của mặt phẳng dựng từ I
    let N_pt = (1.8, 2.0)
    line(I, N_pt, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    
    // Điểm nút
    circle(I, radius: 0.04, fill: black)
    circle(H, radius: 0.03, fill: black)
    circle(M, radius: 0.04, fill: black)
    
    // Ký hiệu góc vuông MH vuông góc với mặt phẳng tại H
    line((3.2, 0.7), (2.95, 0.7), (2.95, 0.4), stroke: 0.5pt)
    
    // Tên nhãn
    content((3.3, 2.2), $M$)
    content((3.4, 0.25), $H$)
    content((1.95, 0.2), $I$)
    content((1.8, 2.3), $vec(n)$)
    content((3.8, 2.9), $d$)
    
    // Nhãn góc theta giữa đường thẳng và mặt phẳng
    arc(I, start: 0deg, stop: 35deg, radius: 0.6, stroke: 0.7pt)
    content((2.6, 0.6), $theta$)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 5. Góc $theta$ giữa đường thẳng $d$ và mặt phẳng $(alpha)$]
]

#muc([Góc trong không gian])

#block(breakable: false)[
  #phuongphap(title: [Các công thức tính góc])[
    1. *Góc giữa hai đường thẳng $d_1, d_2$ có VCP $vec(u_1), vec(u_2)$:*
       $ cos(d_1, d_2) = frac(|vec(u_1) dot vec(u_2)|, |vec(u_1)| dot |vec(u_2)|) $
    2. *Góc giữa đường thẳng $d$ (VCP $vec(u)$) và mặt phẳng $(alpha)$ (VPT $vec(n)$):*
       $ sin(d, (alpha)) = frac(|vec(u) dot vec(n)|, |vec(u)| dot |vec(n)|) $
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b5-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
