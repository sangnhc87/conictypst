#import "_config.typ": *

#lesson([Hệ tọa độ trong không gian và Tích vô hướng], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Hệ tọa độ Descartes trong không gian])

#block(breakable: false)[
  #dn(title: [Hệ tọa độ $O x y z$])[
    - Hệ tọa độ gồm ba trục số $O x, O y, O z$ vuông góc với nhau từng đôi một tại gốc tọa độ $O$.
    - Gọi $vec(i), vec(j), vec(k)$ lần lượt là các vectơ đơn vị của các trục $O x, O y, O z$ thỏa mãn:
      $ |vec(i)| = |vec(j)| = |vec(k)| = 1 quad "và" quad vec(i) perp vec(j), vec(j) perp vec(k), vec(k) perp vec(i) $
    - Tọa độ của một điểm $M$ bất kì là bộ số $(x; y; z)$ thỏa mãn:
      $ vec(O M) = x vec(i) + y vec(j) + z vec(k) $
      Kí hiệu là $M(x; y; z)$, với $x$ là hoành độ, $y$ là tung độ và $z$ là cao độ.
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Hệ trục tọa độ Oxyz chiếu phẳng
    let O = (0, 0)
    let X_axis = (-1.8, -1.2)
    let Y_axis = (4.0, 0)
    let Z_axis = (0, 3.5)
    
    // Vẽ các trục
    line(O, X_axis, mark: (end: "stealth", scale: 0.6), stroke: 0.8pt)
    line(O, Y_axis, mark: (end: "stealth", scale: 0.6), stroke: 0.8pt)
    line(O, Z_axis, mark: (end: "stealth", scale: 0.6), stroke: 0.8pt)
    
    // Nhãn trục
    content((-1.9, -1.4), $x$)
    content((4.2, -0.2), $y$)
    content((-0.2, 3.7), $z$)
    content((0.25, 0.2), $O$)
    
    // Vectơ đơn vị
    line(O, (-0.6, -0.4), mark: (end: "stealth", scale: 0.4), stroke: 1.5pt + rgb("#b91c1c"))
    line(O, (1.0, 0), mark: (end: "stealth", scale: 0.4), stroke: 1.5pt + rgb("#065f46"))
    line(O, (0, 1.0), mark: (end: "stealth", scale: 0.4), stroke: 1.5pt + rgb("#0d9488"))
    
    content((-0.8, -0.2), $vec(i)$)
    content((0.8, 0.25), $vec(j)$)
    content((0.25, 0.8), $vec(k)$)
    
    // Biểu diễn điểm M(2, 3, 2)
    // Tọa độ M chiếu phẳng:
    // x = 2 -> 2 * (-0.6, -0.4) = (-1.2, -0.8)
    // y = 3 -> 3 * (1, 0) = (3, 0)
    // M0 (hình chiếu trên Oxy) = (-1.2 + 3, -0.8) = (1.8, -0.8)
    // M (cao độ z = 2.2) = (1.8, -0.8 + 2.2) = (1.8, 1.4)
    let M0 = (1.8, -0.8)
    let M = (1.8, 1.4)
    let Mx = (-1.2, -0.8)
    let My = (3.0, 0)
    let Mz = (0, 2.2)
    
    // Vẽ nét đứt dóng tọa độ
    line(O, Mx, stroke: 0.6pt + black)
    line(O, My, stroke: 0.6pt + black)
    line(Mx, M0, stroke: (paint: gray, thickness: 0.7pt, dash: "dashed"))
    line(My, M0, stroke: (paint: gray, thickness: 0.7pt, dash: "dashed"))
    line(M0, M, stroke: (paint: gray, thickness: 0.7pt, dash: "dashed"))
    line(M, Mz, stroke: (paint: gray, thickness: 0.7pt, dash: "dashed"))
    line(O, Mz, stroke: 0.6pt + black)
    
    // Điểm M và các điểm dóng
    circle(M, radius: 0.05, fill: rgb("#b91c1c"))
    circle(M0, radius: 0.03, fill: black)
    
    content((2.1, 1.5), $M(x; y; z)$)
    content((2.1, -0.9), $M_0(x; y; 0)$)
    content((-1.4, -0.9), $x$)
    content((3.1, 0.25), $y$)
    content((-0.25, 2.2), $z$)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 2. Tọa độ của điểm $M$ biểu diễn qua phép dóng trên hệ trục $O x y z$]
]

#muc([Tọa độ các điểm đặc biệt])

#block(breakable: false)[
  #phuongphap(title: [Tọa độ trung điểm, trọng tâm và hình chiếu])[
    Cho hai điểm $A(x_A; y_A; z_A)$, $B(x_B; y_B; z_B)$ và tam giác $A B C$.
    - *Tọa độ trung điểm* $I$ của đoạn thẳng $A B$:
      $ I(frac(x_A + x_B, 2); frac(y_A + y_B, 2); frac(z_A + z_B, 2)) $
    - *Tọa độ trọng tâm* $G$ của tam giác $A B C$:
      $ G(frac(x_A + x_B + x_C, 3); frac(y_A + y_B + y_C, 3); frac(z_A + z_B + z_C, 3)) $
    - *Tọa độ điểm đối xứng* $A'$ của $A$ qua tâm đối xứng $B$:
      $ A'(2 x_B - x_A; 2 y_B - y_A; 2 z_B - z_A) $
    - *Hình chiếu vuông góc của điểm* $M(x_0; y_0; z_0)$:
      - Lên các trục $O x, O y, O z$ lần lượt là: $M_x(x_0; 0; 0), M_y(0; y_0; 0), M_z(0; 0; z_0)$.
      - Lên các mặt phẳng tọa độ $(O y z), (O z x), (O x y)$ lần lượt là: $M_1(0; y_0; z_0), M_2(x_0; 0; z_0), M_3(x_0; y_0; 0)$.
  ]
]

#muc([Biểu thức tọa độ của các phép toán vectơ])

#block(breakable: false)[
  #phuongphap(title: [Các phép toán vectơ theo tọa độ])[
    Cho hai vectơ $vec(a) = (x_1; y_1; z_1)$ và $vec(b) = (x_2; y_2; z_2)$. Ta có:
    - $vec(a) + vec(b) = (x_1 + x_2; y_1 + y_2; z_1 + z_2)$
    - $vec(a) - vec(b) = (x_1 - x_2; y_1 - y_2; z_1 - z_2)$
    - $k vec(a) = (k x_1; k y_1; k z_1)$ với $k in RR$.
    - Hai vectơ bằng nhau: $vec(a) = vec(b) <=> cases(x_1 = x_2, y_1 = y_2, z_1 = z_2)$.
    - Hai vectơ cùng phương: $vec(b) = k vec(a) <=> x_2 = k x_1, y_2 = k y_1, z_2 = k z_1$ (với $vec(a) != vec(0)$).
  ]
]

#muc([Tích vô hướng và ứng dụng hình học])

#block(breakable: false)[
  #phuongphap(title: [Tích vô hướng và các hệ quả])[
    - *Công thức tích vô hướng:* $vec(a) dot vec(b) = x_1 x_2 + y_1 y_2 + z_1 z_2$.
    - *Độ dài của vectơ:* $|vec(a)| = sqrt(x_1^2 + y_1^2 + z_1^2)$.
    - *Khoảng cách giữa hai điểm:* Với $A(x_A; y_A; z_A)$ và $B(x_B; y_B; z_B)$:
      $ A B = sqrt((x_B - x_A)^2 + (y_B - y_A)^2 + (z_B - z_A)^2) $
    - *Góc giữa hai vectơ:*
      $ cos(vec(a), vec(b)) = frac(vec(a) dot vec(b), |vec(a)| dot |vec(b)|) = frac(x_1 x_2 + y_1 y_2 + z_1 z_2, sqrt(x_1^2 + y_1^2 + z_1^2) dot sqrt(x_2^2 + y_2^2 + z_2^2)) $
    - *Hai vectơ vuông góc:* $vec(a) perp vec(b) <=> x_1 x_2 + y_1 y_2 + z_1 z_2 = 0$.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b2-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
