#import "../lib.typ": *
#show: sang-setup

= 10. Hình học CeTZ và ký hiệu toán tắt

== A. Hình học phẳng

Tam giác thường:

#tri-abc()

Tam giác vuông:

#tri-right(leg1: 4, leg2: 3, labels: ("A", "B", "C"))

Hình chữ nhật và hình vuông:

#rect-abc(width: 5, height: 3)

#square(a: 3)

Đường tròn ngoại tiếp tam giác:

#circle-desc()

== B. Hình không gian

Hình chóp tam giác:

#chop-sabc()

Hình chóp tứ giác:

#chop-sabcd()

Lăng trụ tam giác:

#lang-tru-abc()

== C. Trục tọa độ và đồ thị

#axis-xy(xmin: -4, xmax: 4, ymin: -3, ymax: 4)

#parabola(a: 1, b: 0, c: -1, xmin: -3, xmax: 3)

== D. Một số ký hiệu toán tắt

Tập số: $RR, ZZ, NN, QQ$.

Vô cực: $-oo, +oo$.

Logic: $forall x in RR, exists y in RR: y^2 >= 0$.

Mũi tên: $A => B$, $A <=> B$.

Tổ hợp: $C(5,2)=10$, chỉnh hợp $A(4,2)=12$.

Vectơ: $vec(u)$, $overrightarrow(A B)$.
