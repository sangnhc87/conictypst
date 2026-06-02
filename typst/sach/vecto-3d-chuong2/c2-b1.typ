#import "_config.typ": *

#lesson([Vectơ trong không gian], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Định nghĩa và các khái niệm cơ bản])

#block(breakable: false)[
  #dn(title: [Định nghĩa vectơ])[
    - *Vectơ trong không gian* là một đoạn thẳng có hướng. Kí hiệu là $vec(a), vec(b)$ hoặc viết rõ điểm đầu và điểm cuối là $vec(A B)$.
    - *Giá của vectơ* là đường thẳng đi qua điểm đầu và điểm cuối của vectơ đó.
    - *Độ dài của vectơ* là khoảng cách giữa điểm đầu và điểm cuối của nó. Kí hiệu độ dài của $vec(A B)$ là $|vec(A B)| = A B$.
    - Hai vectơ được gọi là *cùng phương* nếu giá của chúng song song hoặc trùng nhau. Nếu hai vectơ cùng phương thì chúng chỉ có thể *cùng hướng* hoặc *ngược hướng*.
    - Hai vectơ $vec(a)$ và $vec(b)$ được gọi là *bằng nhau*, kí hiệu $vec(a) = vec(b)$, nếu chúng có cùng hướng và cùng độ dài.
  ]
]

#muc([Các phép toán vectơ trong không gian])

#block(breakable: false)[
  #phuongphap(title: [Các quy tắc cộng, trừ và nhân vectơ])[
    - *Quy tắc ba điểm:* Với ba điểm $A, B, C$ bất kì, ta luôn có:
      $ vec(A B) + vec(B C) = vec(A C) quad "và" quad vec(A B) - vec(A C) = vec(C B) $
    - *Quy tắc hình bình hành:* Với hình bình hành $A B C D$, ta có:
      $ vec(A B) + vec(A D) = vec(A C) $
    - *Quy tắc hình hộp:* Với hình hộp $A B C D . A' B' C' D'$ có ba cạnh xuất phát từ đỉnh $A$, ta có:
      $ vec(A B) + vec(A D) + vec(A A') = vec(A C') $
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.2cm, {
    import draw: *
    
    // Đỉnh tọa độ chiếu phẳng mặt bên
    let A = (0, 0)
    let B = (3.2, 0)
    let D = (1.2, 1.0)
    let C = (4.4, 1.0)
    let Ap = (0, 2.5)
    let Bp = (3.2, 2.5)
    let Dp = (1.2, 3.5)
    let Cp = (4.4, 3.5)
    
    // Các đường nét đứt (bị khuất)
    line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(D, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(D, Dp, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Các cạnh nhìn thấy
    line(A, B, stroke: 0.8pt)
    line(B, C, stroke: 0.8pt)
    line(A, Ap, stroke: 0.8pt)
    line(B, Bp, stroke: 0.8pt)
    line(C, Cp, stroke: 0.8pt)
    line(Ap, Bp, stroke: 0.8pt)
    line(Bp, Cp, stroke: 0.8pt)
    line(Cp, Dp, stroke: 0.8pt)
    line(Dp, Ap, stroke: 0.8pt)
    
    // Biểu diễn các vectơ thành phần
    line(A, B, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#065f46"))
    line(A, Ap, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#0d9488"))
    line(A, D, mark: (end: "stealth", scale: 0.6), stroke: (paint: rgb("#b45309"), thickness: 1.5pt, dash: "dashed"))
    
    // Vectơ tổng đường chéo AC'
    line(A, Cp, mark: (end: "stealth", scale: 0.8), stroke: 2pt + rgb("#b91c1c"))
    
    // Tên các đỉnh
    content((0, -0.3), $A$)
    content((3.3, -0.3), $B$)
    content((1.2, 0.7), $D$)
    content((4.6, 0.9), $C$)
    content((-0.2, 2.6), $A'$)
    content((3.4, 2.6), $B'$)
    content((1.0, 3.7), $D'$)
    content((4.6, 3.6), $C'$)
    
    // Nhãn vectơ
    content((1.6, -0.3), $vec(a)$)
    content((-0.3, 1.25), $vec(c)$)
    content((0.5, 0.6), $vec(b)$)
    content((2.5, 2.0), $vec(d) = vec(a) + vec(b) + vec(c)$, fill: white)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 1. Quy tắc hình hộp biểu diễn vectơ tổng trong không gian 3D]
]

#muc([Sự đồng phẳng của ba vectơ và phân tích vectơ])

#block(breakable: false)[
  #dn(title: [Khái niệm đồng phẳng và phân tích])[
    - Trong không gian, ba vectơ được gọi là *đồng phẳng* nếu các giá của chúng song song với cùng một mặt phẳng.
    - *Điều kiện đồng phẳng:* Cho hai vectơ $vec(a)$ và $vec(b)$ không cùng phương. Khi đó, ba vectơ $vec(a), vec(b), vec(c)$ đồng phẳng khi và chỉ khi tồn tại cặp số thực $(m, n)$ duy nhất sao cho:
      $ vec(c) = m vec(a) + n vec(b) $
    - *Phân tích một vectơ:* Cho ba vectơ $vec(a), vec(b), vec(c)$ không đồng phẳng. Với mọi vectơ $vec(d)$, luôn tồn tại bộ ba số thực $(x, y, z)$ duy nhất sao cho:
      $ vec(d) = x vec(a) + y vec(b) + z vec(c) $
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b1-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
