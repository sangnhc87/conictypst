#import "_config.typ": *

#lesson([Phương trình mặt cầu], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Định nghĩa và phương trình mặt cầu])

#block(breakable: false)[
  #dn(title: [Định nghĩa và các dạng phương trình])[
    - *Định nghĩa:* Trong không gian, mặt cầu tâm $I$ bán kính $R$ ($R > 0$) là tập hợp các điểm $M$ sao cho $I M = R$.
    - *Phương trình chính tắc:* Mặt cầu tâm $I(a; b; c)$, bán kính $R$ có phương trình là:
      $ (x - a)^2 + (y - b)^2 + (z - c)^2 = R^2 $
    - *Phương trình tổng quát:* Phương trình $x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0$ là phương trình mặt cầu khi và chỉ khi $a^2 + b^2 + c^2 - d > 0$.
      Khi đó mặt cầu có tâm $I(a; b; c)$ và bán kính $R = sqrt(a^2 + b^2 + c^2 - d)$.
  ]
]

#muc([Vị trí tương đối giữa mặt cầu và mặt phẳng])

#block(breakable: false)[
  #phuongphap(title: [Sự tương giao giữa mặt cầu và mặt phẳng])[
    Cho mặt cầu $S(I, R)$ và mặt phẳng $(P)$. Gọi $d = d(I, (P))$ là khoảng cách từ tâm $I$ đến $(P)$ và $H$ là hình chiếu của $I$ trên $(P)$:
    - *Trường hợp $d > R$:* Mặt phẳng $(P)$ và mặt cầu $(S)$ không có điểm chung.
    - *Trường hợp $d = R$:* Mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$ tại điểm $H$ ($(P)$ là tiếp diện của mặt cầu).
    - *Trường hợp $d < R$:* Mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo giao tuyến là một đường tròn tâm $H$, bán kính $r = sqrt(R^2 - d^2)$.
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Tâm I của mặt cầu
    let I = (0, 0)
    let R_sp = 2.0
    
    // Vẽ mặt cầu bên ngoài
    circle(I, radius: R_sp, stroke: 1.0pt + rgb("#065f46"))
    // Đường xích đạo của mặt cầu nét đứt
    circle(I, radius: (R_sp, 0.5), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    
    // Mặt phẳng cắt ngang qua z = -0.7
    let z_cut = -0.7
    let r_cut = 1.87 // r = sqrt(2^2 - 0.7^2) = 1.87
    let H = (0, z_cut)
    
    // Vẽ mặt phẳng cắt qua mặt cầu
    let P_A = (-2.8, z_cut - 0.4)
    let P_B = (2.8, z_cut - 0.4)
    let P_C = (3.5, z_cut + 0.6)
    let P_D = (-2.1, z_cut + 0.6)
    line(P_A, P_B, P_C, P_D, close: true, fill: rgb("#eff6ff").transparentize(40%), stroke: 0.6pt + rgb("#3b82f6").lighten(50%))
    
    // Đường tròn giao tuyến (ellipse) trên mặt phẳng cắt
    circle(H, radius: (r_cut, 0.35), stroke: 1.2pt + rgb("#b91c1c"))
    
    // Các đường dóng trong mặt cầu
    // Từ tâm I xuống tâm H của đường tròn giao tuyến
    line(I, H, stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
    // Từ H đến một điểm biên A của đường tròn giao tuyến
    let A = (r_cut, z_cut)
    line(H, A, stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
    // Từ I đến điểm biên A (bán kính R của mặt cầu)
    line(I, A, stroke: (paint: rgb("#065f46"), thickness: 1.0pt))
    
    // Điểm nút
    circle(I, radius: 0.04, fill: black)
    circle(H, radius: 0.04, fill: black)
    circle(A, radius: 0.03, fill: black)
    
    // Nhãn tên
    content((-0.25, 0.25), $I$)
    content((-0.25, z_cut - 0.25), $H$)
    content((r_cut + 0.2, z_cut), $A$)
    content((-0.3, z_cut / 2), $d$)
    content((r_cut / 2, z_cut - 0.25), $r$)
    content((r_cut / 2 + 0.1, z_cut / 2 + 0.15), $R$)
    content((3.2, z_cut + 0.4), $(P)$, fill: none)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 6. Thiết diện cắt bởi mặt phẳng $(P)$ qua mặt cầu $(S)$ tạo thành đường tròn giao tuyến]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b6-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
