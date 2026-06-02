#import "_config.typ": *

#lesson([Tích có hướng của hai vectơ], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Định nghĩa tích có hướng])

#block(breakable: false)[
  #dn(title: [Định nghĩa và tọa độ tích có hướng])[
    - Trong không gian $O x y z$, *tích có hướng* (hay tích vectơ) của hai vectơ $vec(u) = (x_1; y_1; z_1)$ và $vec(v) = (x_2; y_2; z_2)$ là một vectơ, kí hiệu là $[vec(u), vec(v)]$ hoặc $vec(u) times vec(v)$, được xác định bởi tọa độ:
      $ [vec(u), vec(v)] = (y_1 z_2 - y_2 z_1; z_1 x_2 - z_2 x_1; x_1 y_2 - x_2 y_1) $
    - *Quy tắc nhớ nhanh bằng định thức:*
      $ [vec(u), vec(v)] = (det mat(y_1, z_1; y_2, z_2); det mat(z_1, x_1; z_2, x_2); det mat(x_1, y_1; x_2, y_2)) $
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Mặt phẳng chứa u và v
    let P_A = (-1.2, -0.6)
    let P_B = (3.5, -0.6)
    let P_C = (4.7, 1.2)
    let P_D = (0.0, 1.2)
    
    // Vẽ mặt phẳng
    line(P_A, P_B, P_C, P_D, close: true, fill: rgb("#f0fdf4"), stroke: 0.8pt + rgb("#065f46").lighten(50%))
    content((4.2, 1.0), $alpha$, fill: none)
    
    // Điểm gốc O
    let O = (1.5, 0.2)
    
    // Vectơ u và v nằm trên mặt phẳng
    let U_pt = (3.2, 0.4)
    let V_pt = (0.5, 0.9)
    
    line(O, U_pt, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#065f46"))
    line(O, V_pt, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#0d9488"))
    
    // Vectơ tích có hướng w = [u, v] hướng thẳng đứng lên
    let W_pt = (1.5, 2.7)
    line(O, W_pt, mark: (end: "stealth", scale: 0.8), stroke: 2pt + rgb("#b91c1c"))
    
    // Ký hiệu góc vuông
    // w vuông góc với u
    line((1.5, 0.6), (1.7, 0.62), (1.7, 0.22), stroke: 0.6pt)
    // w vuông góc với v
    line((1.5, 0.6), (1.3, 0.67), (1.3, 0.27), stroke: 0.6pt)
    
    // Tên nhãn
    content((3.4, 0.5), $vec(u)$)
    content((0.2, 1.0), $vec(v)$)
    content((1.5, 3.0), $vec(w) = [vec(u), vec(v)]$ )
    circle(O, radius: 0.04, fill: black)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 3. Vectơ tích có hướng vuông góc với cả hai vectơ thành phần theo quy tắc bàn tay phải]
]

#muc([Các tính chất quan trọng])

#block(breakable: false)[
  #ghinho(title: [Tính chất của tích có hướng])[
    - Vectơ tích có hướng $[vec(u), vec(v)]$ vuông góc với cả hai vectơ $vec(u)$ và $vec(v)$:
      $ [vec(u), vec(v)] perp vec(u) quad "và" quad [vec(u), vec(v)] perp vec(v) $
    - Tích có hướng có tính chống giao hoán: $[vec(u), vec(v)] = -[vec(v), vec(u)]$.
    - Hai vectơ cùng phương khi và chỉ khi tích có hướng bằng vectơ không:
      $ vec(u), vec(v) " cùng phương" <=> [vec(u), vec(v)] = vec(0) $
    - Độ lớn tích có hướng: $|[vec(u), vec(v)]| = |vec(u)| dot |vec(v)| dot sin(vec(u), vec(v))$.
  ]
]

#muc([Ứng dụng hình học của tích có hướng])

#block(breakable: false)[
  #phuongphap(title: [Các công thức ứng dụng])[
    1. *Diện tích tam giác $A B C$:*
       $ S_(Delta A B C) = frac(1, 2) |[vec(A B), vec(A C)]| $
    2. *Thể tích khối tứ diện $A B C D$:*
       $ V_(A B C D) = frac(1, 6) |[vec(A B), vec(A C)] dot vec(A D)| $
    3. *Thể tích khối hộp $A B C D . A' B' C' D'$:*
       $ V_"hộp" = |[vec(A B), vec(A D)] dot vec(A A')| $
    4. *Điều kiện đồng phẳng của ba vectơ:* $vec(a), vec(b), vec(c)$ đồng phẳng <=> $[vec(a), vec(b)] dot vec(c) = 0$.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b3-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
