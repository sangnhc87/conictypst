#import "_config.typ": *

#lesson([Đề luyện tập tổng hợp Chương 2], theme-color: c-book)

#q-label([A. PHƯƠNG PHÁP GIẢI TOÁN TRỌNG TÂM], c-book)

#muc([Phương pháp tọa độ hóa hình không gian])

#block(breakable: false)[
  #phuongphap(title: [Tọa độ hóa hình hộp, hình lập phương])[
    Đối với các bài toán hình học không gian có các yếu tố vuông góc (như hình lập phương, hình hộp chữ nhật, hình chóp có cạnh vuông góc với đáy), ta có thể chọn hệ trục tọa độ phù hợp để giải bằng giải tích:
    - *Bước 1:* Chọn gốc tọa độ $O$ trùng với một đỉnh có 3 cạnh vuông góc từng đôi một.
    - *Bước 2:* Đặt các trục $O x, O y, O z$ trùng với các cạnh này.
    - *Bước 3:* Xác định tọa độ tất cả các đỉnh còn lại dựa vào độ dài các cạnh.
    - *Bước 4:* Sử dụng công thức vectơ để tính khoảng cách, góc, diện tích hoặc thể tích.
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Đỉnh tọa độ của hình lập phương có cạnh bằng 2
    let O = (0, 0)
    let B = (2.2, 0) // Hướng trục Oy (nằm ngang)
    let D = (-1.2, -0.8) // Hướng trục Ox (chéo xuống trái)
    let Ap = (0, 2.2) // Hướng trục Oz (thẳng đứng)
    
    let C = (2.2 - 1.2, -0.8)
    let Bp = (2.2, 2.2)
    let Dp = (-1.2, 2.2 - 0.8)
    let Cp = (2.2 - 1.2, 2.2 - 0.8)
    
    // Vẽ các trục tọa độ kéo dài từ O
    line(O, (-2.0, -1.33), mark: (end: "stealth", scale: 0.6), stroke: 0.6pt) // trục Ox
    line(O, (3.5, 0), mark: (end: "stealth", scale: 0.6), stroke: 0.6pt) // trục Oy
    line(O, (0, 3.2), mark: (end: "stealth", scale: 0.6), stroke: 0.6pt) // trục Oz
    
    content((-2.2, -1.4), $x$)
    content((3.7, 0), $y$)
    content((0.25, 3.2), $z$)
    content((0.25, 0.25), $A equiv O$)
    
    // Vẽ các cạnh nét đứt (bị khuất)
    line(O, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(O, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(O, Ap, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Các cạnh nhìn thấy
    line(D, C, stroke: 1.0pt)
    line(B, C, stroke: 1.0pt)
    line(B, Bp, stroke: 1.0pt)
    line(C, Cp, stroke: 1.0pt)
    line(D, Dp, stroke: 1.0pt)
    line(Ap, Bp, stroke: 1.0pt)
    line(Bp, Cp, stroke: 1.0pt)
    line(Cp, Dp, stroke: 1.0pt)
    line(Dp, Ap, stroke: 1.0pt)
    
    // Điểm nút các đỉnh
    circle(O, radius: 0.04, fill: black)
    circle(B, radius: 0.04, fill: black)
    circle(D, radius: 0.04, fill: black)
    circle(C, radius: 0.04, fill: black)
    circle(Ap, radius: 0.04, fill: black)
    circle(Bp, radius: 0.04, fill: black)
    circle(Dp, radius: 0.04, fill: black)
    circle(Cp, radius: 0.04, fill: black)
    
    // Nhãn tọa độ các đỉnh
    content((2.5, -0.3), $B(0; a; 0)$)
    content((-1.6, -0.6), $D(a; 0; 0)$)
    content((-0.45, 2.3), $A'(0; 0; a)$)
    content((1.6, -1.1), $C(a; a; 0)$)
    content((2.7, 2.3), $B'(0; a; a)$)
    content((-1.6, 1.5), $D'(a; 0; a)$)
    content((1.5, 1.7), $C'(a; a; a)$)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 7. Thiết lập hệ trục tọa độ hóa trên hình lập phương cạnh $a$]
]

#v(1em)

#phuongphap(title: [Tọa độ hóa hình chóp có cạnh bên vuông góc với đáy])[
  Khi hình chóp có cạnh bên $S A$ vuông góc với mặt phẳng đáy $(A B C D)$ hoặc $(A B C)$, ta chọn $A$ làm gốc tọa độ.
  - *Mô hình Đáy là Hình chữ nhật / Hình vuông $A B C D$ (vuông tại $A$)*:
    - Gốc tọa độ $O equiv A(0;0;0)$. Trục $O x$ trùng với $A D$, $O y$ trùng với $A B$, $O z$ trùng với $A S$.
    - Tọa độ các đỉnh: $S(0; 0; S A)$, $D(A D; 0; 0)$, $B(0; A B; 0)$, $C(A D; A B; 0)$.
  - *Mô hình Đáy là Tam giác $A B C$ vuông tại $A$*:
    - Gốc tọa độ $O equiv A(0;0;0)$. Trục $O x$ trùng với $A C$, $O y$ trùng với $A B$, $O z$ trùng với $A S$.
    - Tọa độ các đỉnh: $S(0; 0; S A)$, $B(0; A B; 0)$, $C(A C; 0; 0)$.
  - *Mô hình Đáy là Tam giác $A B C$ cân / đều tại $A$*:
    - Gọi $M$ là trung điểm $B C$. Trục $O x$ trùng với $A M$ (đường cao đáy), $O y$ trùng với $M C$, $O z$ song song với $A S$ dựng từ $M$.
]

#v(1em)

#phuongphap(title: [Tọa độ hóa hình chóp đều (Chóp tứ giác đều, Chóp tam giác đều)])[
  Đối với hình chóp đều, chân đường cao hạ từ đỉnh là tâm đáy, do đó ta luôn chọn gốc tọa độ $O$ trùng với chân đường cao $H$ của chóp.
  - *Mô hình Chóp tứ giác đều $S.A B C D$*:
    - Gốc tọa độ $O equiv H(0;0;0)$ (tâm đáy). Trục $O z$ trùng với $H S$.
    - Trục $O x, O y$ song song với các cạnh đáy hoặc trùng với đường chéo đáy $H C, H D$.
    - *Tọa độ (theo cạnh đáy $a$ và đường cao $h$)*:
      $S(0; 0; h)$, $A(-a/2; -a/2; 0)$, $B(a/2; -a/2; 0)$, $C(a/2; a/2; 0)$, $D(-a/2; a/2; 0)$.
  - *Mô hình Chóp tam giác đều $S.A B C$*:
    - Gốc tọa độ $O equiv H(0;0;0)$ (trọng tâm đáy). Trục $O z$ trùng với $H S$.
    - Trục $O x$ chứa trung tuyến $A M$ (với $M$ là trung điểm $B C$). Trục $O y$ song song với cạnh $B C$.
    - *Tọa độ (theo cạnh đáy $a$ và đường cao $h$)*:
      $S(0; 0; h)$, $A(frac(a sqrt(3), 3); 0; 0)$, $B(-frac(a sqrt(3), 6); -frac(a, 2); 0)$, $C(-frac(a sqrt(3), 6); frac(a, 2); 0)$.
]

#v(1em)

#phuongphap(title: [Tọa độ hóa hình lăng trụ đứng, lăng trụ đều])[
  - *Mô hình Lăng trụ đứng tam giác vuông tại $A$*:
    - Chọn gốc tọa độ $O equiv A(0;0;0)$. Trục $O x$ chứa $A C$, $O y$ chứa $A B$, $O z$ chứa $A A'$.
  - *Mô hình Lăng trụ đều $A B C . A' B' C'$ (đáy tam giác đều cạnh $a$, chiều cao $h$)*:
    - Chọn gốc tọa độ $O equiv M(0;0;0)$ là trung điểm $B C$.
    - Trục $O x$ chứa đường cao đáy $M A$, $O y$ chứa $M C$, $O z$ chứa $M M'$ (với $M'$ là trung điểm $B' C'$).
    - Tọa độ các đỉnh đáy dưới: $A(frac(a sqrt(3), 2); 0; 0)$, $B(0; -frac(a, 2); 0)$, $C(0; frac(a, 2); 0)$.
    - Tọa độ các đỉnh đáy trên: $A'(frac(a sqrt(3), 2); 0; h)$, $B'(0; -frac(a, 2); h)$, $C'(0; frac(a, 2); h)$.
]

#v(1.2em)
#ghinho(title: [★ Các công thức tính toán giải tích cốt lõi])[
  Sau khi thiết lập hệ trục tọa độ và tìm được tọa độ các điểm, sử dụng các công thức giải tích sau để giải quyết bài toán hình học không gian:
  
  1. *Tính góc:*
     - *Góc giữa hai đường thẳng (có VCP $vec(u)_1, vec(u)_2$):*
       $ cos(d_1, d_2) = frac(|vec(u)_1 dot vec(u)_2|, |vec(u)_1| dot |vec(u)_2|) $
     - *Góc giữa hai mặt phẳng (có VPT $vec(n)_1, vec(n)_2$):*
       $ cos((P), (Q)) = frac(|vec(n)_1 dot vec(n)_2|, |vec(n)_1| dot |vec(n)_2|) $
     - *Góc giữa đường thẳng $d$ (VCP $vec(u)$) và mặt phẳng $(P)$ (VPT $vec(n)$):*
       $ sin(d, (P)) = frac(|vec(u) dot vec(n)|, |vec(u)| dot |vec(n)|) $

  2. *Tính khoảng cách:*
     - *Từ điểm $M$ đến mặt phẳng $(P): A x + B y + C z + D = 0$:*
       $ d(M, (P)) = frac(|A x_M + B y_M + C z_M + D|, sqrt(A^2 + B^2 + C^2)) $
     - *Từ điểm $M$ đến đường thẳng $d$ (qua $A$, VCP $vec(u)$):*
       $ d(M, d) = frac(|[vec(A M), vec(u)]|, |vec(u)|) $
     - *Giữa hai đường thẳng chéo nhau $d_1, d_2$ (qua $M_1, M_2$, VCP $vec(u)_1, vec(u)_2$):*
       $ d(d_1, d_2) = frac(|[vec(u)_1, vec(u)_2] dot vec(M_1 M_2)|, |[vec(u)_1, vec(u)_2]|) $

  3. *Tính thể tích:*
     - *Thể tích khối tứ diện (tứ diện) $A B C D$:*
       $ V = frac(1, 6) |[vec(A B), vec(A C)] dot vec(A D)| $
     - *Thể tích khối chóp tứ giác $S.A B C D$ (đáy là hình bình hành):*
       $ V = frac(1, 3) |[vec(A B), vec(A D)] dot vec(A S)| $
     - *Thể tích khối lăng trụ tam giác $A B C . A' B' C'$:*
       $ V = frac(1, 2) |[vec(A B), vec(A C)] dot vec(A A')| $
     - *Thể tích khối lăng trụ hộp:*
       $ V = |[vec(A B), vec(A D)] dot vec(A A')| $
]

#v(1em)

#muc([Phụ lục: Các mô hình dựng hệ trục tọa độ mẫu]) <appendix-heading>

#block(breakable: false)[
  #grid(
    columns: (1fr, 1fr),
    row-gutter: 2.5em,
    column-gutter: 1em,
    align: center,
    [
      #canvas(length: 1.1cm, {
        import draw: *
        
        let A = (0, 0)
        let B = (3.0, 0)
        let D = (-1.2, -0.8)
        let C = (3.0 - 1.2, -0.8)
        let S = (0, 2.5)
        
        // Trục tọa độ màu cam hổ phách
        line(A, (-2.0, -1.33), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Ox
        line(A, (4.2, 0), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oy
        line(A, (0, 3.5), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oz
        
        content((-2.2, -1.4), $x$)
        content((4.4, 0), $y$)
        content((0.25, 3.5), $z$)
        content((0.6, 0.25), $A equiv O$)
        
        // Các cạnh bị khuất
        line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        line(A, S, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        
        // Các cạnh nhìn thấy
        line(S, B, stroke: 1.0pt)
        line(S, D, stroke: 1.0pt)
        line(S, C, stroke: 1.0pt)
        line(B, C, stroke: 1.0pt)
        line(D, C, stroke: 1.0pt)
        
        // Điểm nút
        circle(A, radius: 0.04, fill: black)
        circle(B, radius: 0.04, fill: black)
        circle(C, radius: 0.04, fill: black)
        circle(D, radius: 0.04, fill: black)
        circle(S, radius: 0.04, fill: black)
        
        // Nhãn tọa độ
        content((3.7, 0.25), $B(0; b; 0)$)
        content((-1.8, -0.9), $D(a; 0; 0)$)
        content((2.2, -1.1), $C(a; b; 0)$)
        content((-0.6, 2.5), $S(0; 0; h)$)
      })
      #v(0.5em)
      *Hình 8.* Hình chóp $S.A B C D$ có $S A perp (A B C D)$
    ],
    [
      #canvas(length: 1.1cm, {
        import draw: *
        
        let H = (0, 0)
        let A = (-1.5, -0.6)
        let B = (1.5, -0.6)
        let C = (2.2, 0.6)
        let D = (-0.8, 0.6)
        let S = (0, 2.8)
        
        // Trục tọa độ từ tâm đáy H
        line(H, (-2.2, -0.88), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Ox
        line(H, (2.8, 0), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oy
        line(H, (0, 3.6), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oz
        
        content((-2.4, -0.9), $x$)
        content((3.0, 0), $y$)
        content((0.25, 3.6), $z$)
        content((0.55, -0.25), $H equiv O$)
        
        // Các đường chéo và chiều cao khuất
        line(A, C, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
        line(B, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
        line(H, S, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        line(D, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        line(S, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        
        // Các cạnh bên ngoài
        line(A, B, stroke: 1.0pt)
        line(B, C, stroke: 1.0pt)
        line(S, A, stroke: 1.0pt)
        line(S, B, stroke: 1.0pt)
        line(S, C, stroke: 1.0pt)
        
        // Điểm nút
        circle(H, radius: 0.04, fill: black)
        circle(A, radius: 0.04, fill: black)
        circle(B, radius: 0.04, fill: black)
        circle(C, radius: 0.04, fill: black)
        circle(D, radius: 0.04, fill: black)
        circle(S, radius: 0.04, fill: black)
        
        // Nhãn
        content((-1.8, -0.8), $A$)
        content((1.8, -0.8), $B$)
        content((2.5, 0.8), $C$)
        content((-1.1, 0.8), $D$)
        content((0.6, 2.8), $S(0; 0; h)$)
      })
      #v(0.5em)
      *Hình 9.* Hình chóp tứ giác đều $S.A B C D$
    ],
    [
      #canvas(length: 1.1cm, {
        import draw: *
        
        let H = (0, 0)
        let M = (-0.8, -0.4)
        let A = (1.6, 0.8)
        let B = (-0.8 - 1.2, -0.4)
        let C = (-0.8 + 1.2, -0.4)
        let S = (0, 2.8)
        
        // Trục tọa độ
        line(H, (2.6, 1.3), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Ox (hướng HA)
        line(H, (-2.5, 0), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oy (song song BC)
        line(H, (0, 3.6), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oz (hướng HS)
        
        content((2.8, 1.4), $x$)
        content((-2.7, 0), $y$)
        content((0.25, 3.6), $z$)
        content((0.6, 0.25), $H equiv O$)
        
        // Đường khuất
        line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        line(A, M, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
        line(H, S, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        
        // Đường liền
        line(B, C, stroke: 1.0pt)
        line(A, C, stroke: 1.0pt)
        line(S, A, stroke: 1.0pt)
        line(S, B, stroke: 1.0pt)
        line(S, C, stroke: 1.0pt)
        
        // Điểm nút
        circle(H, radius: 0.04, fill: black)
        circle(A, radius: 0.04, fill: black)
        circle(B, radius: 0.04, fill: black)
        circle(C, radius: 0.04, fill: black)
        circle(S, radius: 0.04, fill: black)
        circle(M, radius: 0.03, fill: black)
        
        // Nhãn
        content((1.9, 0.6), $A$)
        content((-2.2, -0.5), $B$)
        content((0.6, -0.5), $C$)
        content((0.6, 2.8), $S(0; 0; h)$)
        content((-0.8, -0.65), $M$)
      })
      #v(0.5em)
      *Hình 10.* Hình chóp tam giác đều $S.A B C$
    ],
    [
      #canvas(length: 1.1cm, {
        import draw: *
        
        let M = (0, 0)
        let A = (1.8, 0.9)
        let B = (-1.2, 0)
        let C = (1.2, 0)
        
        let h = 2.5
        let Ap = (1.8, 0.9 + h)
        let Bp = (-1.2, h)
        let Cp = (1.2, h)
        
        // Trục tọa độ từ trung điểm M
        line(M, (2.6, 1.3), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Ox (hướng MA)
        line(M, (2.0, 0), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oy (hướng MC)
        line(M, (0, 3.4), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt + rgb("#d97706")) // Oz (thẳng đứng)
        
        content((2.8, 1.4), $x$)
        content((2.2, 0), $y$)
        content((0.25, 3.4), $z$)
        content((-0.5, -0.35), $M equiv O$)
        
        // Đường ẩn
        line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        line(M, A, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
        line(A, Ap, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
        
        // Đường hiện
        line(B, C, stroke: 1.0pt)
        line(A, C, stroke: 1.0pt)
        line(B, Bp, stroke: 1.0pt)
        line(C, Cp, stroke: 1.0pt)
        line(Ap, Bp, stroke: 1.0pt)
        line(Bp, Cp, stroke: 1.0pt)
        line(Cp, Ap, stroke: 1.0pt)
        
        // Điểm nút
        circle(M, radius: 0.04, fill: black)
        circle(A, radius: 0.04, fill: black)
        circle(B, radius: 0.04, fill: black)
        circle(C, radius: 0.04, fill: black)
        circle(Ap, radius: 0.04, fill: black)
        circle(Bp, radius: 0.04, fill: black)
        circle(Cp, radius: 0.04, fill: black)
        
        // Nhãn
        content((2.1, 0.7), $A$)
        content((-1.5, 0), $B$)
        content((1.5, -0.25), $C$)
        content((2.1, 0.7 + h), $A'$)
        content((-1.5, h), $B'$)
        content((1.5, h - 0.25), $C'$)
      })
      #v(0.5em)
      *Hình 11.* Lăng trụ tam giác đều $A B C.A' B' C'$
    ]
  )
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b7-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
