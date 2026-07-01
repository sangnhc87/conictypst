#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 01 — Vectơ trong không gian])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (24 câu)], count: 24)

#tn(
  [Cho tứ diện $A B C D$. Đặt $arrow(A B) = arrow(a)$, $arrow(A C) = arrow(b)$, $arrow(A D) = arrow(c)$. Gọi $G$ là trọng tâm tam giác $B C D$. Đẳng thức nào sau đây đúng?],
  (
    [$arrow(A G) = arrow(a) + arrow(b) + arrow(c)$],
    True([$arrow(A G) = 1/3 (arrow(a) + arrow(b) + arrow(c))$]),
    [$arrow(A G) = 1/2 (arrow(a) + arrow(b) + arrow(c))$],
    [$arrow(A G) = 1/4 (arrow(a) + arrow(b) + arrow(c))$]
  ),
  loigiai: [
    #step[Vì $G$ là trọng tâm tam giác $B C D$, theo tính chất trọng tâm tam giác, với mọi điểm $A$ ta có:
    $arrow(A B) + arrow(A C) + arrow(A D) = 3 arrow(A G) <=> arrow(A G) = 1/3 (arrow(A B) + arrow(A C) + arrow(A D))$.]
    #step[Thay các vectơ $arrow(A B) = arrow(a)$, $arrow(A C) = arrow(b)$, $arrow(A D) = arrow(c)$ vào ta được:
    $arrow(A G) = 1/3 (arrow(a) + arrow(b) + arrow(c))$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$. Đặt $arrow(A B) = arrow(a)$, $arrow(A C) = arrow(b)$, $arrow(A D) = arrow(c)$. Gọi $M$ là trung điểm của đoạn $B C$. Đẳng thức nào dưới đây đúng?],
  (
    True([$arrow(D M) = 1/2 (arrow(a) + arrow(b) - 2 arrow(c))$]),
    [$arrow(D M) = 1/2 (arrow(a) + 2 arrow(b) - arrow(c))$],
    [$arrow(D M) = 1/2 (arrow(a) - 2 arrow(b) + arrow(c))$],
    [$arrow(D M) = 1/2 (arrow(a) + arrow(b) - arrow(c))$]
  ),
  loigiai: [
    #step[Vì $M$ là trung điểm của đoạn $B C$, ta có hệ thức:
    $arrow(A M) = 1/2 (arrow(A B) + arrow(A C)) = 1/2 (arrow(a) + arrow(b))$.]
    #step[Ta biểu diễn vectơ $arrow(D M)$ như sau:
    $arrow(D M) = arrow(A M) - arrow(A D) = 1/2 (arrow(a) + arrow(b)) - arrow(c) = 1/2 (arrow(a) + arrow(b) - 2 arrow(c))$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$. Gọi $M$ và $P$ lần lượt là trung điểm của các cạnh $A B$ và $C D$. Đặt $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(A D) = arrow(d)$. Khẳng định nào sau đây đúng?],
  (
    [$arrow(M P) = 1/2 (arrow(c) + arrow(d) + arrow(b))$],
    [$arrow(M P) = 1/2 (arrow(d) + arrow(b) - arrow(c))$],
    [$arrow(M P) = 1/2 (arrow(c) + arrow(b) - arrow(d))$],
    True([$arrow(M P) = 1/2 (arrow(c) + arrow(d) - arrow(b))$])
  ),
  loigiai: [
    #step[Ta có $M$ là trung điểm $A B$, $P$ là trung điểm $C D$. Theo quy tắc trung điểm, ta có:
    $arrow(A P) = 1/2 (arrow(A C) + arrow(A D)) = 1/2 (arrow(c) + arrow(d))$.]
    #step[Đồng thời, ta có $arrow(A M) = 1/2 arrow(A B) = 1/2 arrow(b)$.]
    #step[Biểu diễn vectơ $arrow(M P)$:
    $arrow(M P) = arrow(A P) - arrow(A M) = 1/2 (arrow(c) + arrow(d)) - 1/2 arrow(b) = 1/2 (arrow(c) + arrow(d) - arrow(b))$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$ và điểm $G$ thỏa mãn $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$ ($G$ là trọng tâm của tứ diện). Gọi $G_0$ là giao điểm của $G A$ và mặt phẳng $(B C D)$. Khẳng định nào dưới đây đúng?],
  (
    [$arrow(G A) = - 2 arrow(G_0 G)$],
    [$arrow(G A) = 4 arrow(G_0 G)$],
    True([$arrow(G A) = 3 arrow(G_0 G)$]),
    [$arrow(G A) = 2 arrow(G_0 G)$]
  ),
  loigiai: [
    #step[Vì $G_0$ là giao điểm của $G A$ và mặt phẳng $(B C D)$, và $G$ là trọng tâm của tứ diện $A B C D$, đường thẳng $A G$ đi qua trọng tâm $G_0$ của tam giác $B C D$.]
    #step[Do $G_0$ là trọng tâm tam giác $B C D$, ta có hệ thức:
    $arrow(G B) + arrow(G C) + arrow(G D) = 3 arrow(G G_0)$.]
    #step[Thay vào đẳng thức $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$, ta được:
    $arrow(G A) + 3 arrow(G G_0) = arrow(0) <=> arrow(G A) = - 3 arrow(G G_0) = 3 arrow(G_0 G)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Đặt $arrow(S A) = arrow(a)$, $arrow(S B) = arrow(b)$, $arrow(S C) = arrow(c)$, $arrow(S D) = arrow(d)$. Khẳng định nào dưới đây là đúng?],
  (
    True([$arrow(a) + arrow(c) = arrow(b) + arrow(d)$]),
    [$arrow(a) + arrow(b) + arrow(c) + arrow(d) = arrow(0)$],
    [$arrow(a) + arrow(d) = arrow(b) + arrow(c)$],
    [$arrow(a) + arrow(b) = arrow(c) + arrow(d)$]
  ),
  loigiai: [
    #step[Gọi $O$ là tâm hình bình hành $A B C D$. Khi đó $O$ là trung điểm của hai đường chéo $A C$ và $B D$.]
    #step[Áp dụng quy tắc trung điểm đối với điểm $S$ và các đoạn thẳng $A C, B D$:
    $arrow(S A) + arrow(S C) = 2 arrow(S O)$ và $arrow(S B) + arrow(S D) = 2 arrow(S O)$.]
    #step[Suy ra $arrow(S A) + arrow(S C) = arrow(S B) + arrow(S D) <=> arrow(a) + arrow(c) = arrow(b) + arrow(d)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lăng trụ $A B C . A' B' C'$. Đặt $arrow(A A') = arrow(a)$, $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$. Gọi $G'$ là trọng tâm của tam giác $A' B' C'$. Vectơ $arrow(A G')$ bằng:],
  (
    [$1/3 (arrow(a) + 3 arrow(b) + arrow(c))$],
    True([$1/3 (3 arrow(a) + arrow(b) + arrow(c))$]),
    [$1/3 (arrow(a) + arrow(b) + 3 arrow(c))$],
    [$1/3 (arrow(a) + arrow(b) + arrow(c))$]
  ),
  loigiai: [
    #step[Vì $G'$ là trọng tâm của tam giác $A' B' C'$, ta có hệ thức vectơ:
    $arrow(A G') = 1/3 (arrow(A A') + arrow(A B') + arrow(A C'))$.]
    #step[Ta phân tích các vectơ theo các vectơ cơ sở $arrow(a), arrow(b), arrow(c)$:
    - $arrow(A A') = arrow(a)$.
    - $arrow(A B') = arrow(A B) + arrow(B B') = arrow(A B) + arrow(A A') = arrow(b) + arrow(a)$.
    - $arrow(A C') = arrow(A C) + arrow(C C') = arrow(A C) + arrow(A A') = arrow(c) + arrow(a)$.]
    #step[Cộng vế theo vế ta được:
    $arrow(A G') = 1/3 (arrow(a) + arrow(b) + arrow(a) + arrow(c) + arrow(a)) = 1/3 (3 arrow(a) + arrow(b) + arrow(c))$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lăng trụ $A B C . A' B' C'$. Đặt $arrow(A A') = arrow(a)$, $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$. Hãy biểu diễn vectơ $arrow(B' C)$ theo $arrow(a), arrow(b), arrow(c)$?],
  (
    [$arrow(B' C) = arrow(a) + arrow(b) - arrow(c)$],
    [$arrow(B' C) = - arrow(a) + arrow(b) - arrow(c)$],
    [$arrow(B' C) = arrow(a) + arrow(b) + arrow(c)$],
    True([$arrow(B' C) = - arrow(a) - arrow(b) + arrow(c)$])
  ),
  loigiai: [
    #step[Ta có $arrow(B' C) = arrow(A C) - arrow(A B')$.]
    #step[Mà $arrow(A B') = arrow(A B) + arrow(B B') = arrow(A B) + arrow(A A') = arrow(b) + arrow(a)$.]
    #step[Do đó: $arrow(B' C) = arrow(c) - (arrow(b) + arrow(a)) = - arrow(a) - arrow(b) + arrow(c)$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lăng trụ $A B C . A' B' C'$. Gọi $M$ là trung điểm của cạnh $B B'$. Đặt $arrow(C A) = arrow(a)$, $arrow(C B) = arrow(b)$, $arrow(A A') = arrow(c)$. Khẳng định nào sau đây đúng?],
  (
    [$arrow(A M) = arrow(a) + arrow(c) - 1/2 arrow(b)$],
    [$arrow(A M) = arrow(b) + arrow(c) - 1/2 arrow(a)$],
    True([$arrow(A M) = arrow(b) - arrow(a) + 1/2 arrow(c)$]),
    [$arrow(A M) = arrow(a) - arrow(c) + 1/2 arrow(b)$]
  ),
  loigiai: [
    #step[Ta phân tích vectơ $arrow(A M)$ theo quy tắc ba điểm:
    $arrow(A M) = arrow(A B) + arrow(B M)$.]
    #step[Vì $M$ là trung điểm của cạnh $B B'$, ta có:
    $arrow(B M) = 1/2 arrow(B B') = 1/2 arrow(A A') = 1/2 arrow(c)$.]
    #step[Đồng thời:
    $arrow(A B) = arrow(C B) - arrow(C A) = arrow(b) - arrow(a)$.]
    #step[Thay vào biểu thức trên:
    $arrow(A M) = arrow(b) - arrow(a) + 1/2 arrow(c)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho hình hộp $A B C D.A' B' C' D'$ tâm $O$. Gọi $I$ là tâm của hình bình hành $A B C D$. Đặt $arrow(A C') = arrow(u)$, $arrow(C A') = arrow(v)$, $arrow(B D') = arrow(x)$, $arrow(D B') = arrow(y)$. Khi đó:],
  (
    True([$2 arrow(O I) = - 1/4 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$]),
    [$2 arrow(O I) = - 1/2 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$],
    [$2 arrow(O I) = 1/2 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$],
    [$2 arrow(O I) = 1/4 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$]
  ),
  loigiai: [
    #step[Vì $O$ là tâm của hình hộp nên $O$ là trung điểm của các đường chéo chính $A C'$, $C A'$, $B D'$, $D B'$. Do đó ta có:
    - $arrow(O A) + arrow(O C') = arrow(0) <=> arrow(u) = arrow(A C') = -2 arrow(O A)$.
    - $arrow(O C) + arrow(O A') = arrow(0) <=> arrow(v) = arrow(C A') = -2 arrow(O C)$.
    - $arrow(O B) + arrow(O D') = arrow(0) <=> arrow(x) = arrow(B D') = -2 arrow(O B)$.
    - $arrow(O D) + arrow(O B') = arrow(0) <=> arrow(y) = arrow(D B') = -2 arrow(O D)$.]
    #step[Cộng bốn đẳng thức trên ta được:
    $arrow(u) + arrow(v) + arrow(x) + arrow(y) = -2 (arrow(O A) + arrow(O C) + arrow(O B) + arrow(O D))$.]
    #step[Vì $I$ là tâm của hình bình hành $A B C D$ nên $I$ là trung điểm của $A C$ và $B D$. Theo quy tắc trung điểm:
    $arrow(O A) + arrow(O C) = 2 arrow(O I)$ và $arrow(O B) + arrow(O D) = 2 arrow(O I)$.]
    #step[Suy ra:
    $arrow(u) + arrow(v) + arrow(x) + arrow(y) = -2 (2 arrow(O I) + 2 arrow(O I)) = -8 arrow(O I) <=> 2 arrow(O I) = -1/4 (arrow(u) + arrow(v) + arrow(x) + arrow(y))$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lăng trụ tam giác $A B C . A' B' C'$. Đặt $arrow(A A') = arrow(a)$, $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(B C) = arrow(d)$. Khẳng định nào sau đây là đúng?],
  (
    [$arrow(a) = arrow(b) + arrow(c)$],
    [$arrow(a) + arrow(b) + arrow(c) + arrow(d) = arrow(0)$],
    True([$arrow(b) - arrow(c) + arrow(d) = arrow(0)$]),
    [$arrow(a) + arrow(b) + arrow(c) = arrow(d)$]
  ),
  loigiai: [
    #step[Ta xét vectơ $arrow(d) = arrow(B C)$ trong tam giác $A B C$.]
    #step[Theo hiệu hai vectơ chung gốc $A$:
    $arrow(B C) = arrow(A C) - arrow(A B)$.]
    #step[Thay các vectơ theo định nghĩa $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(B C) = arrow(d)$, ta được:
    $arrow(d) = arrow(c) - arrow(b) <=> arrow(b) - arrow(c) + arrow(d) = arrow(0)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lập phương $A B C D.A' B' C' D'$. Gọi $O$ là tâm của hình lập phương. Khẳng định nào sau đây là đúng?],
  (
    [$arrow(A O) = 1/3 (arrow(A B) + arrow(A D) + arrow(A A'))$],
    True([$arrow(A O) = 1/2 (arrow(A B) + arrow(A D) + arrow(A A'))$]),
    [$arrow(A O) = 1/4 (arrow(A B) + arrow(A D) + arrow(A A'))$],
    [$arrow(A O) = 2/3 (arrow(A B) + arrow(A D) + arrow(A A'))$]
  ),
  loigiai: [
    #step[Vì $O$ là tâm của hình lập phương $A B C D.A' B' C' D'$, $O$ là trung điểm của đường chéo chính $A C'$.]
    #step[Theo quy tắc hình hộp:
    $arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$.]
    #step[Do $O$ là trung điểm $A C'$, ta có:
    $arrow(A O) = 1/2 arrow(A C') = 1/2 (arrow(A B) + arrow(A D) + arrow(A A'))$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho hình hộp $A B C D.A' B' C' D'$. Đặt $arrow(A B) = arrow(a)$, $arrow(A D) = arrow(b)$, $arrow(A A') = arrow(c)$. Phân tích vectơ $arrow(A C')$ theo $arrow(a), arrow(b), arrow(c)$?],
  (
    [$arrow(A C') = - arrow(a) + arrow(b) + arrow(c)$],
    [$arrow(A C') = arrow(a) + arrow(b) - arrow(c)$],
    True([$arrow(A C') = arrow(a) + arrow(b) + arrow(c)$]),
    [$arrow(A C') = arrow(a) - arrow(b) + arrow(c)$]
  ),
  loigiai: [
    #step[Áp dụng trực tiếp quy tắc hình hộp cho hình hộp $A B C D.A' B' C' D'$ xuất phát từ đỉnh $A$, ta có:
    $arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$.]
    #step[Thay các vectơ $arrow(A B) = arrow(a)$, $arrow(A D) = arrow(b)$, $arrow(A A') = arrow(c)$ vào đẳng thức trên:
    $arrow(A C') = arrow(a) + arrow(b) + arrow(c)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$. Điểm $N$ xác định bởi đẳng thức sau $arrow(A N) = arrow(A B) + arrow(A C) - arrow(A D)$. Mệnh đề nào sau đây đúng?],
  (
    [$N$ là trung điểm $B D$.],
    [$N$ là đỉnh hình bình hành $B C D N$.],
    True([$N$ là đỉnh hình bình hành $C D B N$.]),
    [$N = A$.]
  ),
  loigiai: [
    #step[Biến đổi đẳng thức đã cho:
    $arrow(A N) = arrow(A B) + arrow(A C) - arrow(A D) <=> arrow(A N) - arrow(A B) = arrow(A C) - arrow(A D)$.]
    #step[Theo quy tắc hiệu:
    $arrow(B N) = arrow(D C)$.]
    #step[Vì $arrow(B N) = arrow(D C)$ nên hai vectơ cùng hướng và cùng độ dài.
    Do đó, bốn điểm $C, D, B, N$ tạo thành hình bình hành $C D B N$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho hình hộp $A B C D.A' B' C' D'$. Gọi $M$ là điểm được xác định bởi đẳng thức sau $arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) + arrow(M A') + arrow(M B') + arrow(M C') + arrow(M D') = arrow(0)$. Mệnh đề nào đúng?],
  (
    [$M$ là tâm mặt đáy $A B C D$.],
    [$M$ là tâm mặt đáy $A' B' C' D'$.],
    True([$M$ là trung điểm đoạn thẳng nối hai tâm của hai mặt đáy.]),
    [Tập hợp điểm $M$ là đoạn thẳng nối hai tâm của hai mặt đáy.]
  ),
  loigiai: [
    #step[Gọi $I, I'$ lần lượt là tâm (giao điểm hai đường chéo) của hai đáy $A B C D$ và $A' B' C' D'$.]
    #step[Ta có:
    - $arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) = 4 arrow(M I)$ (do $I$ là trung điểm $A C$ và $B D$).
    - $arrow(M A') + arrow(M B') + arrow(M C') + arrow(M D') = 4 arrow(M I')$ (do $I'$ là trung điểm $A' C'$ và $B' D'$).]
    #step[Thay vào đẳng thức ban đầu:
    $4 arrow(M I) + 4 arrow(M I') = arrow(0) <=> arrow(M I) + arrow(M I') = arrow(0)$.]
    #step[Đẳng thức này chứng tỏ $M$ là trung điểm của đoạn thẳng $I I'$ nối tâm hai đáy.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho hình hộp $A B C D.A' B' C' D'$ có tâm $O$. Đặt $arrow(A B) = arrow(a)$, $arrow(B C) = arrow(b)$. Điểm $M$ xác định bởi đẳng thức $arrow(O M) = 1/2 (arrow(a) - arrow(b))$. Khẳng định nào sau đây đúng?],
  (
    True([$M$ là trung điểm $B B'$.]),
    [$M$ là tâm hình bình hành $B C C' B'$.],
    [$M$ là trung điểm $C C'$.],
    [$M$ là tâm hình bình hành $A B B' A'$.]
  ),
  loigiai: [
    #step[Ta có $arrow(a) - arrow(b) = arrow(A B) - arrow(B C) = arrow(A B) - arrow(A D)$ (vì $arrow(B C) = arrow(A D)$).]
    #step[Do đó:
    $arrow(a) - arrow(b) = arrow(D B)$.]
    #step[Hệ thức cho ta:
    $arrow(O M) = 1/2 arrow(D B)$.]
    #step[Gọi $I$ và $I'$ lần lượt là tâm của hai đáy $A B C D$ và $A' B' C' D'$.
    Vì $O$ là tâm hình hộp, $O$ là trung điểm của $I I'$ và $B D'$ nên ta có:
    $arrow(O B) + arrow(O D') = arrow(0)$.]
    #step[Xét hình bình hành $B D D' B'$, có $O$ là trung điểm của đường chéo $B D'$, nên $O$ cũng là trung điểm của đường chéo $B' D$.
    Do đó: $arrow(O B') + arrow(O D) = arrow(0) <=> arrow(O D) = - arrow(O B')$.]
    #step[Ta có:
    $1/2 arrow(D B) = 1/2 (arrow(O B) - arrow(O D)) = 1/2 (arrow(O B) - (- arrow(O B'))) = 1/2 (arrow(O B) + arrow(O B'))$.]
    #step[Từ đó: $arrow(O M) = 1/2 (arrow(O B) + arrow(O B'))$. Đẳng thức này chứng tỏ $M$ là trung điểm của đoạn thẳng $B B'$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho ba vectơ $arrow(a), arrow(b), arrow(c)$. Điều kiện nào dưới đây khẳng định $arrow(a), arrow(b), arrow(c)$ đồng phẳng?],
  (
    [Tồn tại ba số thực $m, n, p$ thỏa mãn $m + n + p = 0$ và $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.],
    True([Tồn tại ba số thực $m, n, p$ thỏa mãn $m + n + p != 0$ và $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.]),
    [Tồn tại ba số thực $m, n, p$ sao cho $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.],
    [Giá của $arrow(a), arrow(b), arrow(c)$ đồng qui.]
  ),
  loigiai: [
    #step[Theo định nghĩa và định lý về sự đồng phẳng của ba vectơ:
    Ba vectơ $arrow(a), arrow(b), arrow(c)$ đồng phẳng khi và chỉ khi tồn tại ba số thực $m, n, p$ không đồng thời bằng $0$ sao cho $m arrow(a) + n arrow(b) + p arrow(c) = arrow(0)$.]
    #step[Nếu $m + n + p != 0$, điều này đảm bảo rằng các số $m, n, p$ không thể đồng thời bằng $0$.
    Do đó, sự tồn tại của bộ số này khẳng định ba vectơ đồng phẳng.]
    #step[Đáp án C sai vì nếu chọn $m=n=p=0$ thì luôn có $0 arrow(a) + 0 arrow(b) + 0 arrow(c) = arrow(0)$ với mọi bộ ba vectơ bất kỳ (kể cả không đồng phẳng).]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho ba vectơ $arrow(a), arrow(b), arrow(c)$ không đồng phẳng. Xét các vectơ $arrow(x) = 2 arrow(a) + arrow(b)$, $arrow(y) = arrow(a) - arrow(b) - arrow(c)$ và $arrow(z) = -3 arrow(b) - 2 arrow(c)$. Khẳng định nào dưới đây là đúng?],
  (
    True([$arrow(x), arrow(y), arrow(z)$ đồng phẳng.]),
    [$arrow(x), arrow(a)$ cùng phương.],
    [$arrow(x), arrow(b)$ cùng phương.],
    [$arrow(x), arrow(y), arrow(z)$ đôi một cùng phương.]
  ),
  loigiai: [
    #step[Giả sử $arrow(x) = m arrow(y) + n arrow(z)$. Ta có:
    $2 arrow(a) + arrow(b) = m (arrow(a) - arrow(b) - arrow(c)) + n (-3 arrow(b) - 2 arrow(c))$
    $<=> 2 arrow(a) + arrow(b) = m arrow(a) - (m + 3n) arrow(b) - (m + 2n) arrow(c)$.]
    #step[Đồng nhất hệ số của các vectơ không đồng phẳng $arrow(a), arrow(b), arrow(c)$, ta có hệ phương trình:
    $heva(m = 2, -(m + 3n) = 1, -(m + 2n) = 0) <=> heva(m = 2, 3n = -3, 2n = -2) <=> heva(m = 2, n = -1)$.]
    #step[Hệ phương trình có nghiệm duy nhất $(m; n) = (2; -1)$, suy ra $arrow(x) = 2 arrow(y) - arrow(z)$.]
    #step[Vì một vectơ biểu diễn được qua hai vectơ còn lại nên ba vectơ $arrow(x), arrow(y), arrow(z)$ đồng phẳng.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho ba vectơ $arrow(a), arrow(b), arrow(c)$ không đồng phẳng. Khẳng định nào dưới đây đúng?],
  (
    True([Các vectơ $arrow(x) = arrow(a) + arrow(b) + 2 arrow(c)$, $arrow(y) = 2 arrow(a) - 3 arrow(b) - 6 arrow(c)$, $arrow(z) = - arrow(a) + 3 arrow(b) + 6 arrow(c)$ đồng phẳng.]),
    [Các vectơ $arrow(x) = arrow(a) - 2 arrow(b) + 4 arrow(c)$, $arrow(y) = 3 arrow(a) - 3 arrow(b) + 2 arrow(c)$, $arrow(z) = 2 arrow(a) - 3 arrow(b) - 3 arrow(c)$ đồng phẳng.],
    [Các vectơ $arrow(x) = arrow(a) + arrow(b) + arrow(c)$, $arrow(y) = 2 arrow(a) - 3 arrow(b) + arrow(c)$, $arrow(z) = - arrow(a) + 3 arrow(b) + 3 arrow(c)$ đồng phẳng.],
    [Các vectơ $arrow(x) = arrow(a) + arrow(b) - arrow(c)$, $arrow(y) = 2 arrow(a) - arrow(b) + 3 arrow(c)$, $arrow(z) = - arrow(a) - arrow(b) + 2 arrow(c)$ đồng phẳng.]
  ),
  loigiai: [
    #step[Để ba vectơ $arrow(x) = a_1 arrow(a) + b_1 arrow(b) + c_1 arrow(c)$, $arrow(y) = a_2 arrow(a) + b_2 arrow(b) + c_2 arrow(c)$ và $arrow(z) = a_3 arrow(a) + b_3 arrow(b) + c_3 arrow(c)$ đồng phẳng (với $arrow(a), arrow(b), arrow(c)$ không đồng phẳng) thì định thức của ma trận hệ số phải bằng 0.]
    #step[Xét đáp án A:
    $D = |mat(1, 1, 2; 2, -3, -6; -1, 3, 6)| = 1(-18 - (-18)) - 1(12 - 6) + 2(6 - 3) = 0 - 6 + 6 = 0$.
    Do đó ba vectơ này đồng phẳng. Ta có mối quan hệ tuyến tính: $3 arrow(y) + 3 arrow(z) = 3 arrow(a) <=> arrow(y) + arrow(z) = arrow(a)$, thay vào $arrow(x)$ ta được biểu diễn tuyến tính.]
    #step[Các đáp án B, C, D đều có định thức ma trận hệ số khác 0 nên các bộ vectơ đó không đồng phẳng.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Mệnh đề nào sau đây là sai?],
  (
    [$arrow(a), arrow(b), arrow(c)$ đồng phẳng nếu một trong ba vectơ đó bằng $arrow(0)$.],
    [$arrow(a), arrow(b), arrow(c)$ đồng phẳng nếu có hai trong ba vectơ đó cùng phương.],
    [Trong hình hộp $A B C D.A' B' C' D'$ ba vectơ $arrow(A B'), arrow(C' A'), arrow(D A')$ đồng phẳng.],
    True([$arrow(x) = arrow(a) + arrow(b) + arrow(c)$ luôn đồng phẳng với hai vectơ $arrow(a)$ và $arrow(b)$.])
  ),
  loigiai: [
    #step[Đáp án A đúng: Vì vectơ $arrow(0)$ cùng phương với mọi vectơ nên bộ ba vectơ có chứa $arrow(0)$ luôn đồng phẳng.]
    #step[Đáp án B đúng: Nếu có hai vectơ cùng phương thì hai vectơ này và vectơ thứ ba luôn đồng phẳng (vì giá của chúng luôn song song hoặc nằm trên một mặt phẳng).]
    #step[Đáp án C đúng: Ta phân tích theo các cạnh lăng trụ:
    $arrow(A B') = arrow(A B) + arrow(A A')$, $arrow(C' A') = - arrow(A B) - arrow(A D)$, $arrow(D A') = - arrow(A D) + arrow(A A')$.
    Ta thấy $arrow(A B') + arrow(C' A') = arrow(A A') - arrow(A D) = arrow(D A')$.
    Vì $arrow(D A') = arrow(A B') + arrow(C' A')$ nên ba vectơ này đồng phẳng.]
    #step[Đáp án D sai: Vectơ $arrow(x) = arrow(a) + arrow(b) + arrow(c)$ chỉ đồng phẳng với $arrow(a)$ và $arrow(b)$ khi $arrow(c)$ đồng phẳng với $arrow(a)$ và $arrow(b)$. Nếu $arrow(a), arrow(b), arrow(c)$ không đồng phẳng thì $arrow(x)$ không thể đồng phẳng với $arrow(a)$ và $arrow(b)$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    // Ceiling
    let ceiling_w = 1.5
    let O = (0, 3.5)
    line((-ceiling_w, O.at(1)), (ceiling_w, O.at(1)), stroke: 1.5pt + rgb("#333"))
    for i in range(-5, 6) {
      let x = i * 0.25
      line((x, O.at(1)), (x + 0.15, O.at(1) + 0.15), stroke: 0.8pt + gray)
    }
    
    circle(O, radius: 0.06, fill: black)
    content((O.at(0), O.at(1) + 0.35), $O$)
    
    // The suspended lamp disk (drawn as an ellipse)
    let lamp_center = (0, 0.5)
    let r_x = 1.6
    let r_y = 0.6
    
    // Points on the disk
    let A = (-1.2, 0.5 - 0.2)
    let B = (0.5, 0.5 + 0.45) // back point
    let C = (1.2, 0.5 - 0.1)
    
    // Back string OB (hidden part and visible part)
    line(O, B, stroke: (thickness: 1pt, dash: "dashed", paint: rgb("#7f8c8d")))
    
    // Draw lamp disk
    circle(lamp_center, radius: (r_x, r_y), fill: rgb(224, 234, 245, 80%), stroke: 1.5pt + rgb("#2980b9"))
    // Inner decorations
    circle(lamp_center, radius: (r_x * 0.8, r_y * 0.8), fill: none, stroke: 0.8pt + rgb("#3498db"))
    
    // Front strings
    line(O, A, stroke: 1.2pt + rgb("#2c3e50"))
    line(O, C, stroke: 1.2pt + rgb("#2c3e50"))
    
    // Force vectors at O
    let vA = (A.at(0) - O.at(0), A.at(1) - O.at(1))
    let vB = (B.at(0) - O.at(0), B.at(1) - O.at(1))
    let vC = (C.at(0) - O.at(0), C.at(1) - O.at(1))
    
    let scale = 0.4
    let F1 = (O.at(0) + vA.at(0)*scale, O.at(1) + vA.at(1)*scale)
    let F2 = (O.at(0) + vB.at(0)*scale, O.at(1) + vB.at(1)*scale)
    let F3 = (O.at(0) + vC.at(0)*scale, O.at(1) + vC.at(1)*scale)
    
    line(O, F1, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    line(O, F2, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    line(O, F3, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    
    content((F1.at(0) - 0.35, F1.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_1)$])
    content((F2.at(0) + 0.4, F2.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_2)$])
    content((F3.at(0) + 0.4, F3.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_3)$])
    
    // Points labels
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)
    content((A.at(0) - 0.25, A.at(1) - 0.2), $A$)
    content((B.at(0) + 0.2, B.at(1) + 0.2), $B$)
    content((C.at(0) + 0.25, C.at(1) - 0.2), $C$)
    
    // Gravity P
    circle(lamp_center, radius: 0.06, fill: rgb("#27ae60"))
    line(lamp_center, (lamp_center.at(0), lamp_center.at(1) - 1.5), stroke: 2.5pt + rgb("#27ae60"), mark: (end: "stealth", fill: rgb("#27ae60")))
    content((lamp_center.at(0) + 0.4, lamp_center.at(1) - 1.0), text(fill: rgb("#27ae60"))[$arrow(P)$])
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc đèn tròn được treo song song với mặt phẳng nằm ngang bởi ba sợi dây không dãn xuất phát từ điểm $O$ trên trần nhà và lần lượt buộc vào ba điểm $A, B, C$ trên đèn tròn sao cho các lực căng $arrow(F_1), arrow(F_2), arrow(F_3)$ lần lượt trên mỗi dây $O A, O B, O C$ đôi một vuông góc với nhau và $|arrow(F_1)| = |arrow(F_2)| = |arrow(F_3)| = 15$ (N). Tính trọng lượng của chiếc đèn tròn đó.],
  (
    [$14 sqrt(3) "N"$],
    True([$15 sqrt(3) "N"$]),
    [$17 sqrt(3) "N"$],
    [$16 sqrt(3) "N"$]
  ),
  loigiai: [
    #step[Chiếc đèn tròn ở trạng thái cân bằng dưới tác dụng của bốn lực: ba lực căng dây $arrow(F_1), arrow(F_2), arrow(F_3)$ và trọng lực $arrow(P)$.]
    #step[Điều kiện cân bằng lực:
    $arrow(F_1) + arrow(F_2) + arrow(F_3) + arrow(P) = arrow(0) <=> arrow(P) = - (arrow(F_1) + arrow(F_2) + arrow(F_3))$.]
    #step[Trọng lượng của chiếc đèn chính là độ lớn của trọng lực $arrow(P)$:
    $P = |arrow(P)| = |arrow(F_1) + arrow(F_2) + arrow(F_3)|$.]
    #step[Bình phương hai vế để tính độ lớn:
    $P^2 = |arrow(F_1) + arrow(F_2) + arrow(F_3)|^2$
    $= arrow(F_1)^2 + arrow(F_2)^2 + arrow(F_3)^2 + 2(arrow(F_1) dot arrow(F_2) + arrow(F_2) dot arrow(F_3) + arrow(F_3) dot arrow(F_1))$.]
    #step[Vì các lực căng đôi một vuông góc nên các tích vô hướng của chúng bằng 0:
    $arrow(F_1) dot arrow(F_2) = arrow(F_2) dot arrow(F_3) = arrow(F_3) dot arrow(F_1) = 0$.]
    #step[Do đó:
    $P^2 = |arrow(F_1)|^2 + |arrow(F_2)|^2 + |arrow(F_3)|^2 = 15^2 + 15^2 + 15^2 = 3 times 15^2$.]
    #step[Suy ra $P = 15 sqrt(3)$ (N).]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    let S = (0, 3.5)
    
    // Square base (perspective)
    let A = (-1.5, 0.2)
    let B = (0.5, 1.0)
    let C = (1.5, 0.2)
    let D = (-0.5, -0.6)
    
    // Center O
    let O = (0, 0.2)
    
    // Back edges of the disc and base
    line(A, B, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(B, C, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    
    // Back string SB
    line(S, B, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    
    // Height SO
    line(S, O, stroke: (thickness: 0.8pt, dash: "dashed", paint: rgb("#e74c3c")))
    
    // Diagonals
    line(A, C, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(B, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    // Lamp disc (ellipse inscribed in ABCD roughly)
    circle(O, radius: (1.5, 0.5), fill: rgb(243, 156, 18, 40%), stroke: 1.5pt + rgb("#d35400"))
    // inner rings
    circle(O, radius: (1.2, 0.4), fill: none, stroke: 1pt + rgb("#e67e22"))
    circle(O, radius: (0.8, 0.25), fill: none, stroke: 1pt + rgb("#e67e22"))
    
    // Front edges of the frame
    line(A, D, stroke: 1.2pt + black)
    line(D, C, stroke: 1.2pt + black)
    
    // Front strings
    line(S, A, stroke: 1.5pt + rgb("#2c3e50"))
    line(S, D, stroke: 1.5pt + rgb("#2c3e50"))
    line(S, C, stroke: 1.5pt + rgb("#2c3e50"))
    
    // Gravity P
    circle(O, radius: 0.06, fill: rgb("#c0392b"))
    line(O, (0, -1.8), stroke: 2.5pt + rgb("#27ae60"), mark: (end: "stealth", fill: rgb("#27ae60")))
    content((0.4, -1.2), text(fill: rgb("#27ae60"))[$arrow(P)$])
    
    // Labels
    content((S.at(0), S.at(1) + 0.3), $S$)
    content((A.at(0) - 0.25, A.at(1)), $A$)
    content((B.at(0) + 0.2, B.at(1) + 0.2), $B$)
    content((C.at(0) + 0.25, C.at(1)), $C$)
    content((D.at(0) - 0.2, D.at(1) - 0.2), $D$)
    content((O.at(0) + 0.1, O.at(1) + 0.2), $O$)
    
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)
    circle(D, radius: 0.05, fill: black)
    circle(S, radius: 0.05, fill: black)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc đèn chùm treo có khối lượng $m = 5$ kg được thiết kế với đĩa đèn được giữ bởi bốn đoạn xích $S A, S B, S C, S D$ sao cho $S.A B C D$ là hình chóp tứ giác đều có $hat(A S C) = 60^degree$. Tìm độ lớn của lực căng cho mỗi sợi xích. Lấy $g = 10$ m/s².],
  (
    [$15 sqrt(3)/3$ "N"],
    [$20 sqrt(3)/3$ "N"],
    True([$25 sqrt(3)/3$ "N"]),
    [$30 sqrt(3)/3$ "N"]
  ),
  loigiai: [
    #step[Trọng lực tác dụng lên chiếc đèn chùm có độ lớn:
    $P = m g = 5 times 10 = 50$ (N).]
    #step[Chiếc đèn chùm ở trạng thái cân bằng dưới tác dụng của trọng lực $arrow(P)$ và bốn lực căng xích $arrow(T_A), arrow(T_B), arrow(T_C), arrow(T_D)$:
    $arrow(T_A) + arrow(T_B) + arrow(T_C) + arrow(T_D) + arrow(P) = arrow(0) <=> arrow(T_A) + arrow(T_B) + arrow(T_C) + arrow(T_D) = - arrow(P)$.]
    #step[Do tính chất đối xứng của hình chóp tứ giác đều, độ lớn lực căng trên các sợi xích bằng nhau:
    $T = |arrow(T_A)| = |arrow(T_B)| = |arrow(T_C)| = |arrow(T_D)|$.]
    #step[Đồng thời, tổng các vectơ lực căng theo phương thẳng đứng sẽ cân bằng với trọng lực. Gọi $O$ là tâm của đáy $A B C D$ (hình vuông), ta có:
    $4 T cos hat(A S O) = P$.]
    #step[Xét tam giác $S A C$: có $S A = S C$ (do chóp đều) và góc $hat(A S C) = 60^degree$, nên tam giác $S A C$ là tam giác đều.]
    #step[Vì vậy, góc giữa cạnh bên $S A$ và trục thẳng đứng $S O$ bằng:
    $hat(A S O) = 1/2 hat(A S C) = 30^degree$.]
    #step[Thay các giá trị vào hệ thức cân bằng lực:
    $4 T cos 30^degree = 50 <=> 4 T dot sqrt(3)/2 = 50 <=> 2 sqrt(3) T = 50 <=> T = 25/sqrt(3) = (25 sqrt(3))/3$ (N).]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Theo định luật II Newton thì gia tốc của một vật có cùng hướng với lực tác dụng lên vật. Độ lớn của gia tốc tỉ lệ thuận với độ lớn của lực và tỉ lệ nghịch với khối lượng của vật: $arrow(F) = m arrow(a)$, trong đó $arrow(a)$ là vectơ gia tốc (m/s²), $arrow(F)$ là vectơ lực (N). Muốn truyền cho quả bóng có khối lượng $0.5$ kg một gia tốc $50$ m/s² thì cần một lực đá có độ lớn là bao nhiêu?],
  (
    [$10$ N],
    [$15$ N],
    [$20$ N],
    True([$25$ N])
  ),
  loigiai: [
    #step[Theo định luật II Newton, độ lớn của lực tác dụng liên hệ với gia tốc và khối lượng qua công thức:
    $F = m a$.]
    #step[Thay số với $m = 0.5$ kg và $a = 50$ m/s²:]
    #step[$F = 0.5 times 50 = 25$ (N).]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Apple
    circle((0, 0.8), radius: 0.6, fill: red.lighten(20%), stroke: 1.2pt + red)
    // Stem
    line((0, 1.4), (0.2, 1.7), stroke: 1.5pt + rgb("#8B4513"))
    // Leaf
    bezier((0.1, 1.65), (0.5, 1.8), (0.2, 1.8), (0.4, 1.7), stroke: 0.8pt + green, fill: green.lighten(30%))
    
    // Force vector
    line((0, 0.8), (0, -1.0), stroke: 2.2pt + rgb("#d32f2f"), mark: (end: "stealth", fill: rgb("#d32f2f")))
    content((0.4, -0.6), text(fill: rgb("#d32f2f"))[$arrow(P)$])
    
    // Label m
    content((0, 0.8), $m$)
    // Label g arrow
    line((-0.8, 0.8), (-0.8, 0.0), stroke: 1pt + rgb("#333"), mark: (end: "stealth"))
    content((-1.2, 0.4), $arrow(g)$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Nếu một vật có khối lượng $m$ (kg) thì lực hấp dẫn $arrow(P)$ của Trái Đất tác dụng lên vật được xác định theo công thức $arrow(P) = m arrow(g)$, trong đó $arrow(g)$ là gia tốc rơi tự do có độ lớn $g = 9.8$ m/s². Tính độ lớn của lực hấp dẫn của Trái Đất tác dụng lên một quả táo có khối lượng $105$ gam.],
  (
    True([$1.029$ N]),
    [$1.433$ N],
    [$2.096$ N],
    [$1.477$ N]
  ),
  loigiai: [
    #step[Trước tiên, ta đổi khối lượng của quả táo sang đơn vị kg:
    $m = 105 "gam" = 105/1000 "kg" = 0.105 "kg"$.]
    #step[Độ lớn lực hấp dẫn (trọng lực) tác dụng lên quả táo là:
    $P = m g = 0.105 times 9.8 = 1.029$ (N).]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Draw two parallel charged plates
    line((-2.0, 1.2), (2.0, 1.2), stroke: 1.5pt + rgb("#d32f2f")) // top plate (+)
    line((-2.0, -1.2), (2.0, -1.2), stroke: 1.5pt + rgb("#2E7D32")) // bottom plate (-)
    
    // Plus and minus signs on plates
    for x in range(-7, 8) {
      let px = x * 0.25
      content((px, 1.4), text(size: 8pt, fill: rgb("#d32f2f"))[$+$])
      content((px, -1.4), text(size: 8pt, fill: rgb("#2E7D32"))[$-$])
    }
    
    // Electric field lines (downward arrows)
    for x in range(-3, 4) {
      let px = x * 0.5
      line((px, 1.1), (px, -1.1), stroke: 0.5pt + gray, mark: (end: "stealth", fill: gray))
    }
    content((2.3, 0), text(fill: gray)[$arrow(E)$])
    
    // Charged particle in field
    circle((0.2, 0.2), radius: 0.15, fill: rgb("#2E7D32").lighten(50%), stroke: 1pt + rgb("#2E7D32"))
    content((0.2, 0.2), text(size: 7pt, fill: rgb("#2E7D32"))[$+$])
    content((0.6, 0.2), $M$)
    
    // Force arrow
    line((0.2, 0.05), (0.2, -0.9), stroke: 1.5pt + blue, mark: (end: "stealth", fill: blue))
    content((0.4, -0.6), text(fill: blue)[$arrow(F)$])
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Trong điện trường đều, lực tĩnh điện $arrow(F)$ (đơn vị: N) tác dụng lên điện tích điểm có điện tích $q$ (đơn vị: C) được tính theo công thức $arrow(F) = q arrow(E)$, trong đó $arrow(E)$ là cường độ điện trường (đơn vị: N/C). Tính độ lớn của lực tĩnh điện tác dụng lên điện tích điểm khi $q = 10^(-9)$ C và độ lớn điện trường $E = 10^5$ N/C.],
  (
    True([$10^(-4)$ N]),
    [$2 dot 10^(-6)$ N],
    [$10^(-2)$ N],
    [$1.8 dot 10^(-6)$ N]
  ),
  loigiai: [
    #step[Độ lớn lực tĩnh điện tác dụng lên điện tích điểm được xác định bởi công thức:
    $F = |q| E$.]
    #step[Thay các giá trị $q = 10^(-9)$ C và $E = 10^5$ N/C vào công thức:
    $F = |10^(-9)| times 10^5 = 10^(-4)$ (N).]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (12 câu)], count: 12)

#ds(
  [Trong không gian, cho tứ diện $A B C D$ có trọng tâm $G$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([$arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$.]),
    True([$arrow(O G) = 1/4 (arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D))$ với mọi điểm $O$.]),
    True([$arrow(B G) = arrow(G A) + arrow(G C) + arrow(G D)$.]),
    [$arrow(A G) = 2/3 (arrow(A B) + arrow(A C) + arrow(A D))$.]
  ),
  loigiai: [
    #step[a) Theo định nghĩa trọng tâm tứ diện, $G$ là điểm thỏa mãn $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$. Do đó phát biểu này Đúng.]
    #step[b) Với mọi điểm $O$, chèn điểm $G$ ta có:
    $arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D) = 4 arrow(O G) + (arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D)) = 4 arrow(O G)$.
    Suy ra $arrow(O G) = 1/4 (arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D))$. Phát biểu này Đúng.]
    #step[c) Từ đẳng thức trọng tâm:
    $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0) <=> - arrow(G B) = arrow(G A) + arrow(G C) + arrow(G D) <=> arrow(B G) = arrow(G A) + arrow(G C) + arrow(G D)$. Phát biểu này Đúng.]
    #step[d) Ta có:
    $arrow(A G) = 1/4 (arrow(A A) + arrow(A B) + arrow(A C) + arrow(A D)) = 1/4 (arrow(A B) + arrow(A C) + arrow(A D))$.
    Vì hệ số là $1/4$ chứ không phải $2/3$ nên phát biểu này Sai.]
  ]
)

#ds(
  [Cho tứ diện $A B C D$. Gọi $M$ và $N$ lần lượt là trung điểm của $A B, C D$ và $G$ là trung điểm của $M N$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([$arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$.]),
    True([$arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) = 4 arrow(M G)$.]),
    [$arrow(M N) = 1/2 (arrow(A B) + arrow(C D))$.],
    True([$2 arrow(M N) = arrow(A C) + arrow(B D)$.])
  ),
  loigiai: [
    #step[a) Do $M$ là trung điểm $A B$, ta có $arrow(G A) + arrow(G B) = 2 arrow(G M)$.
    Do $N$ là trung điểm $C D$, ta có $arrow(G C) + arrow(G D) = 2 arrow(G N)$.
    Do $G$ là trung điểm $M N$, ta có $arrow(G M) + arrow(G N) = arrow(0)$.
    Cộng lại ta được $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = 2(arrow(G M) + arrow(G N)) = arrow(0)$. (Đúng)]
    #step[b) Vì $G$ là trọng tâm tứ diện $A B C D$, với điểm $M$ bất kỳ ta luôn có:
    $arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D) = 4 arrow(M G)$. (Đúng)]
    #step[c) Ta phân tích vectơ $arrow(M N)$:
    $arrow(M N) = arrow(M A) + arrow(A D) + arrow(D N) = -1/2 arrow(A B) + arrow(A D) + 1/2 arrow(C D)$.
    Đẳng thức này không trùng với $1/2 (arrow(A B) + arrow(C D))$. (Sai)]
    #step[d) Ta có:
    - $arrow(M N) = arrow(M A) + arrow(A C) + arrow(C N) = -1/2 arrow(A B) + arrow(A C) + 1/2 arrow(C D)$.
    - $arrow(M N) = arrow(M B) + arrow(B D) + arrow(D N) = 1/2 arrow(A B) + arrow(B D) - 1/2 arrow(C D)$.
    Cộng vế theo vế ta được: $2 arrow(M N) = arrow(A C) + arrow(B D)$. (Đúng)]
  ]
)

#ds(
  [Trong không gian cho hình hộp $A B C D.A' B' C' D'$ tâm $O$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([$arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$.]),
    True([$arrow(A B) + arrow(B C') + arrow(C D) + arrow(D' A) = arrow(0)$.]),
    [$arrow(A B) + arrow(A A') = arrow(A D) + arrow(D D')$.],
    True([$arrow(A B) + arrow(B C) + arrow(C C') = arrow(A D') + arrow(D' O) + arrow(O C')$.])
  ),
  loigiai: [
    #step[a) Áp dụng trực tiếp quy tắc hình hộp cho đỉnh $A$, ta có $arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$. (Đúng)]
    #step[b) Biến đổi vế trái:
    $arrow(A B) + arrow(B C') + arrow(C D) + arrow(D' A) = arrow(A C') - arrow(D C) - arrow(A D')$ (vì $arrow(C D) = - arrow(D C)$ và $arrow(D' A) = - arrow(A D')$)
    $= arrow(A C') - arrow(A B) - (arrow(A D) + arrow(A A'))$ (do $arrow(D C) = arrow(A B)$ và $arrow(A D') = arrow(A D) + arrow(A A'))$
    $= arrow(A C') - (arrow(A B) + arrow(A D) + arrow(A A')) = arrow(A C') - arrow(A C') = arrow(0)$. (Đúng)]
    #step[c) Ta có $arrow(A B) + arrow(A A') = arrow(A B')$ và $arrow(A D) + arrow(D D') = arrow(A D')$.
    Trong hình hộp, hai vectơ đường chéo mặt $arrow(A B')$ và $arrow(A D')$ không bằng nhau trong trường hợp tổng quát. (Sai)]
    #step[d) Ta có:
    - Vế trái: $arrow(A B) + arrow(B C) + arrow(C C') = arrow(A C) + arrow(C C') = arrow(A C')$.
    - Vế phải: $arrow(A D') + arrow(D' O) + arrow(O C') = arrow(A O) + arrow(O C') = arrow(A C')$.
    Do đó hai vế bằng nhau. (Đúng)]
  ]
)

#ds(
  [Trong không gian, cho hình hộp $A B C D.A' B' C' D'$. Xét tính đúng/sai của các đẳng thức sau:],
  (
    True([$arrow(B C) + arrow(B A) = arrow(B' C') + arrow(B' A')$.]),
    True([$arrow(A D) + arrow(D' C') + arrow(D' A') = arrow(D C)$.]),
    True([$arrow(B C) + arrow(B A) + arrow(B B') = arrow(B D')$.]),
    [$arrow(B A) + arrow(D D') + arrow(B D') = arrow(B C)$.]
  ),
  loigiai: [
    #step[a) Vế trái bằng $arrow(B D)$ (quy tắc hình bình hành đáy đáy). Vế phải bằng $arrow(B' D')$. Vì đáy dưới và đáy trên là các hình bình hành bằng nhau nên $arrow(B D) = arrow(B' D')$. (Đúng)]
    #step[b) Ta có $arrow(A D) + arrow(D' A') = arrow(A' D') + arrow(D' A') = arrow(0)$ (vì $arrow(A D) = arrow(A' D')$).
    Hơn nữa, $arrow(D' C') = arrow(D C)$. Do đó vế trái rút gọn còn $arrow(D C)$. (Đúng)]
    #step[c) Áp dụng quy tắc hình hộp xuất phát từ đỉnh $B$, ta có $arrow(B C) + arrow(B A) + arrow(B B') = arrow(B D')$. (Đúng)]
    #step[d) Ta có $arrow(B A) + arrow(D D') = arrow(B A) + arrow(B B') = arrow(B A')$.
    Vế trái trở thành $arrow(B A') + arrow(B D') 
eq arrow(B C)$. (Sai)]
  ]
)

#ds(
  [Trong không gian, cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $G$ là điểm thỏa mãn $arrow(G S) + arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(A B) + arrow(B C) + arrow(C D) + arrow(D A) = arrow(S O)$.],
    True([$arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D) = arrow(0)$.]),
    True([$arrow(S B) + arrow(S D) = arrow(S A) + arrow(S C)$.]),
    [$arrow(G S) = 3 arrow(O G)$.]
  ),
  loigiai: [
    #step[a) Vế trái: $arrow(A B) + arrow(B C) + arrow(C D) + arrow(D A) = arrow(A C) + arrow(C A) = arrow(0)$.
    Còn $arrow(S O) 
eq arrow(0)$ vì $S$ không trùng $O$. (Sai)]
    #step[b) Do $O$ là tâm hình bình hành $A B C D$ nên $O$ là trung điểm $A C$ và $B D$.
    Ta có $arrow(O A) + arrow(O C) = arrow(0)$ và $arrow(O B) + arrow(O D) = arrow(0)$, suy ra tổng bằng $arrow(0)$. (Đúng)]
    #step[c) Áp dụng quy tắc trung điểm với điểm $S$:
    $arrow(S A) + arrow(S C) = 2 arrow(S O)$ và $arrow(S B) + arrow(S D) = 2 arrow(S O)$. Do đó chúng bằng nhau. (Đúng)]
    #step[d) Vì $O$ là tâm của hình bình hành $A B C D$ nên $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = 4 arrow(G O)$.
    Thay vào giả thiết: $arrow(G S) + 4 arrow(G O) = arrow(0) <=> arrow(G S) = 4 arrow(O G)$.
    Mệnh đề ghi hệ số 3 nên là Sai.]
  ]
)

#ds(
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$ có cạnh bằng $a$. Gọi $I$ là tâm hình vuông $A B C D$, gọi $G$ là trọng tâm của tam giác $A B' C$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(A B) + arrow(A D) + arrow(A A') = arrow(A C')$.]),
    [$arrow(G A) + arrow(G B') + arrow(G C) = 2 arrow(G I)$.],
    True([$arrow(A B) + arrow(A D) = arrow(A' C')$.]),
    [$arrow(B D') = 2 arrow(B G)$.]
  ),
  loigiai: [
    #step[a) Áp dụng quy tắc hình hộp cho đỉnh $A$ ta có trực tiếp $arrow(A B) + arrow(A D) + arrow(A A') = arrow(A C')$. (Đúng)]
    #step[b) Vì $G$ là trọng tâm của tam giác $A B' C$ nên ta có $arrow(G A) + arrow(G B') + arrow(G C) = arrow(0) 
eq 2 arrow(G I)$. (Sai)]
    #step[c) Ta có $arrow(A B) + arrow(A D) = arrow(A C)$. Mà mặt bên hình lập phương có các cạnh song song và bằng nhau nên $arrow(A C) = arrow(A' C')$. Vậy $arrow(A B) + arrow(A D) = arrow(A' C')$. (Đúng)]
    #step[d) Chọn hệ trục tọa độ với $B(0;0;0)$. Khi đó $A(a;0;0)$, $C(0;a;0)$, $B'(0;0;a)$.
    Trọng tâm $G$ của tam giác $A B' C$ có tọa độ $G(a/3; a/3; a/3) => arrow(B G) = (a/3; a/3; a/3)$.
    Điểm $D'(a; a; a) => arrow(B D') = (a; a; a) = 3 arrow(B G)$.
    Đẳng thức đúng phải là $arrow(B D') = 3 arrow(B G)$ chứ không phải $2 arrow(B G)$. (Sai)]
  ]
)

#ds(
  [Trong không gian, cho tứ diện $A B C D$. Gọi $M, N$ lần lượt là trung điểm $A D, B C$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([Ba vectơ $arrow(A B), arrow(D C), arrow(M N)$ đồng phẳng.]),
    True([Ba vectơ $arrow(A B), arrow(A C), arrow(M N)$ không đồng phẳng.]),
    [Ba vectơ $arrow(A N), arrow(C M), arrow(M N)$ đồng phẳng.],
    True([Ba vectơ $arrow(B D), arrow(A C), arrow(M N)$ đồng phẳng.])
  ),
  loigiai: [
    #step[a) Ta có hệ thức vectơ:
    $arrow(M N) = 1/2 (arrow(A B) + arrow(D C))$.
    Vì $arrow(M N)$ đồng phẳng với $arrow(A B)$ và $arrow(D C)$ (biểu diễn tuyến tính được qua hai vectơ này) nên ba vectơ đồng phẳng. (Đúng)]
    #step[b) Ba vectơ $arrow(A B), arrow(A C), arrow(M N)$ có giá không song song với cùng một mặt phẳng (đường thẳng $M N$ cắt mặt phẳng $(A B C)$). Do đó chúng không đồng phẳng. (Đúng)]
    #step[c) Ba vectơ $arrow(A N), arrow(C M), arrow(M N)$ không cùng song song với bất kỳ mặt phẳng nào trong trường hợp tứ diện tổng quát. (Sai)]
    #step[d) Ta có hệ thức vectơ tương tự:
    $2 arrow(M N) = arrow(A C) + arrow(D B) = arrow(A C) - arrow(B D)$.
    Vì $arrow(M N)$ biểu diễn tuyến tính được qua $arrow(A C)$ và $arrow(B D)$ nên ba vectơ đồng phẳng. (Đúng)]
  ]
)

#ds(
  [Trong không gian, cho tứ diện $A B C D$. Trên cạnh $A D$ và $B C$ lần lượt lấy các điểm $M, N$ sao cho $A M = 3 M D$ và $B N = 3 N C$. Gọi $P, Q$ lần lượt là trung điểm $A D$ và $B C$. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(P Q) = arrow(A C) + arrow(D B)$.],
    True([$arrow(M N) = arrow(M A) + arrow(A C) + arrow(C N)$.]),
    True([$arrow(M N) = arrow(M D) + arrow(D B) + arrow(B N)$.]),
    [Ba vectơ $arrow(B D), arrow(A C), arrow(M N)$ đồng phẳng.]
  ),
  loigiai: [
    #step[a) Đẳng thức đúng phải là $2 arrow(P Q) = arrow(A C) + arrow(D B)$. Do thiếu hệ số 2 nên phát biểu này Sai.]
    #step[b) Theo quy tắc cộng vectơ (quy tắc đa giác), ta có $arrow(M N) = arrow(M A) + arrow(A C) + arrow(C N)$ luôn luôn đúng. (Đúng)]
    #step[c) Tương tự, $arrow(M N) = arrow(M D) + arrow(D B) + arrow(B N)$ luôn đúng bằng phép chèn điểm liên tiếp. (Đúng)]
    #step[d) Biểu diễn vectơ $arrow(M N)$ theo hệ cơ sở $\{arrow(A B), arrow(A C), arrow(A D)\}$:
    $arrow(M N) = arrow(A N) - arrow(A M) = (arrow(A B) + 3/4 (arrow(A C) - arrow(A B))) - 3/4 arrow(A D) = 1/4 arrow(A B) + 3/4 arrow(A C) - 3/4 arrow(A D)$.
    Mà $arrow(B D) = arrow(A D) - arrow(A B)$. Ta thấy không thể biểu diễn $arrow(M N) = x arrow(A C) + y arrow(B D)$ vì hệ số của $arrow(A B)$ và $arrow(A D)$ trong biểu thức không đối xứng như trong $arrow(B D)$ (tỉ số hệ số là $-3$ so với $-1$).
    Do đó ba vectơ này không đồng phẳng. (Sai)]
  ]
)

#ds(
  [Cho hình hộp chữ nhật $A B C D.A' B' C' D'$ có cạnh $A B = a$, $A D = a sqrt(3)$, $A A' = 2a$. Xét tính đúng/sai của các khẳng định sau:],
  (
    [$arrow(A B') + arrow(C D') = arrow(0)$.],
    True([$arrow(A' D) + arrow(C B') = arrow(0)$.]),
    [$|arrow(A B) + arrow(A D)| = a sqrt(5)$.],
    True([$|arrow(A B) + arrow(A' D') + arrow(C C')| = 2 sqrt(2) a$.])
  ),
  loigiai: [
    #step[a) Ta có $arrow(A B') = arrow(A B) + arrow(A A')$ và $arrow(C D') = arrow(C D) + arrow(C C') = - arrow(A B) + arrow(A A')$.
    Do đó $arrow(A B') + arrow(C D') = 2 arrow(A A') 
eq arrow(0)$. (Sai)]
    #step[b) Ta có $arrow(A' D) = arrow(A D) - arrow(A A')$ và $arrow(C B') = arrow(C B) + arrow(B B') = - arrow(A D) + arrow(A A')$.
    Suy ra $arrow(A' D) + arrow(C B') = arrow(0)$. (Đúng)]
    #step[c) Ta có $arrow(A B) + arrow(A D) = arrow(A C)$ (do đáy là hình chữ nhật).
    Độ dài là $|arrow(A C)| = sqrt(A B^2 + A D^2) = sqrt(a^2 + (a sqrt(3))^2) = 2a 
eq a sqrt(5)$. (Sai)]
    #step[d) Ta có $arrow(A' D') = arrow(A D)$ và $arrow(C C') = arrow(A A')$.
    Do đó $arrow(A B) + arrow(A' D') + arrow(C C') = arrow(A B) + arrow(A D) + arrow(A A') = arrow(A C')$.
    Độ dài đường chéo hình hộp chữ nhật: $|arrow(A C')| = sqrt(A B^2 + A D^2 + A A'^2) = sqrt(a^2 + 3a^2 + 4a^2) = sqrt(8a^2) = 2 sqrt(2) a$. (Đúng)]
  ]
)

#ds(
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$ có cạnh bằng $a$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(B' B) - arrow(D B) = arrow(B' D)$.]),
    [$arrow(B A) + arrow(B C) + arrow(B B') = arrow(B D)$.],
    [$|arrow(B A) + arrow(B C) + arrow(B B')| = a sqrt(2)$.],
    [$|arrow(B C) - arrow(B A) + arrow(C' A')| = a$.]
  ),
  loigiai: [
    #step[a) Ta biến đổi: $arrow(B' B) - arrow(D B) = arrow(B' B) + arrow(B D) = arrow(B' D)$. (Đúng)]
    #step[b) Theo quy tắc hình hộp cho đỉnh $B$ của hình lập phương: $arrow(B A) + arrow(B C) + arrow(B B') = arrow(B D')$. Đề ghi $arrow(B D)$ là Sai.]
    #step[c) Độ dài vectơ tổng là độ dài đường chéo hình lập phương: $|arrow(B D')| = sqrt(a^2 + a^2 + a^2) = a sqrt(3) 
eq a sqrt(2)$. (Sai)]
    #step[d) Rút gọn biểu thức vectơ:
    $arrow(B C) - arrow(B A) + arrow(C' A') = arrow(A C) + arrow(C' A') = arrow(A C) - arrow(A C) = arrow(0)$ (vì $arrow(C' A') = - arrow(A' C') = - arrow(A C)$).
    Độ dài bằng 0 chứ không phải bằng $a$. (Sai)]
  ]
)

#ds(
  [Trong không gian, cho tứ diện $A B C D$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A D$ và $B C$, $I$ là trung điểm $M N$. Xét tính đúng/sai của các đẳng thức sau:],
  (
    True([$arrow(A B) - arrow(C D) = arrow(A C) - arrow(B D)$.]),
    True([$arrow(A B) + arrow(C D) = arrow(A D) + arrow(C B)$.]),
    True([$arrow(A B) + arrow(D C) = 2 arrow(M N)$.]),
    True([$arrow(I A) + arrow(I B) + arrow(I C) + arrow(I D) = arrow(0)$.])
  ),
  loigiai: [
    #step[a) Đẳng thức tương đương: $arrow(A B) + arrow(B D) = arrow(A C) + arrow(C D) <=> arrow(A D) = arrow(A D)$ (luôn đúng). (Đúng)]
    #step[b) Đẳng thức tương đương: $arrow(A B) - arrow(A D) = arrow(C B) - arrow(C D) <=> arrow(D B) = arrow(D B)$ (luôn đúng). (Đúng)]
    #step[c) Ta phân tích:
    - $arrow(M N) = arrow(M A) + arrow(A B) + arrow(B N)$
    - $arrow(M N) = arrow(M D) + arrow(D C) + arrow(C N)$
    Cộng hai đẳng thức trên, chú ý $arrow(M A) + arrow(M D) = arrow(0)$ và $arrow(B N) + arrow(C N) = arrow(0)$, ta được:
    $2 arrow(M N) = arrow(A B) + arrow(D C)$. (Đúng)]
    #step[d) Vì $M, N$ là trung điểm $A D, B C$ nên $arrow(I A) + arrow(I D) = 2 arrow(I M)$ và $arrow(I B) + arrow(I C) = 2 arrow(I N)$.
    Do $I$ là trung điểm $M N$ nên $2(arrow(I M) + arrow(I N)) = arrow(0)$.
    Vậy $arrow(I A) + arrow(I B) + arrow(I C) + arrow(I D) = arrow(0)$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 1.1cm, {
    import draw: *
    // Vertex E (hook point) and cable lines
    let E = (0, 3.0)
    content((0, 3.2), $E$)
    
    // Bottom rectangle base ABCD of the iron frame
    let A = (-1.5, 0.4)
    let B = (-0.5, 1.2)
    let C = (1.5, 0.8)
    let D = (0.5, 0.0)
    
    // Draw cables
    line(E, A, stroke: 1pt + rgb("#333"), mark: (end: "stealth", fill: blue))
    line(E, B, stroke: 0.8pt + rgb("#aaa"), mark: (end: "stealth", fill: blue)) // back cable
    line(E, C, stroke: 1pt + rgb("#333"), mark: (end: "stealth", fill: blue))
    line(E, D, stroke: 1pt + rgb("#333"), mark: (end: "stealth", fill: blue))
    
    // Force labels
    content((-0.9, 1.9), text(fill: blue)[$arrow(F_1)$])
    content((-0.2, 2.1), text(fill: blue)[$arrow(F_2)$])
    content((0.9, 1.9), text(fill: blue)[$arrow(F_3)$])
    content((0.4, 1.6), text(fill: blue)[$arrow(F_4)$])
    
    // Draw iron frame (rectangular box)
    // base ABCD
    line(A, D, stroke: 1.5pt + black)
    line(D, C, stroke: 1.5pt + black)
    line(C, B, stroke: 0.8pt + gray)
    line(B, A, stroke: 0.8pt + gray)
    
    // vertical pillars down to support platform
    let A_d = (-1.5, -0.8)
    let B_d = (-0.5, 0.0)
    let C_d = (1.5, -0.4)
    let D_d = (0.5, -1.2)
    
    line(A, A_d, stroke: 1.5pt + black)
    line(B, B_d, stroke: 0.8pt + gray)
    line(C, C_d, stroke: 1.5pt + black)
    line(D, D_d, stroke: 1.5pt + black)
    
    // bottom platform
    line(A_d, D_d, stroke: 1.8pt + black)
    line(D_d, C_d, stroke: 1.8pt + black)
    line(C_d, B_d, stroke: 0.8pt + gray)
    line(B_d, A_d, stroke: 0.8pt + gray)
    
    // Draw a simplified red car on the platform
    rect((-0.6, -0.8), (0.6, -0.4), fill: red, stroke: 1pt + red)
    circle((-0.3, -0.8), radius: 0.15, fill: black)
    circle((0.3, -0.8), radius: 0.15, fill: black)
    
    // Labels of vertices
    content((-1.7, 0.4), $A$)
    content((-0.7, 1.35), $B$)
    content((1.7, 0.8), $C$)
    content((0.6, -0.15), $D$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc ô tô được đặt trên mặt đáy dưới của một khung sắt có dạng hình hộp chữ nhật với đáy trên là hình chữ nhật $A B C D$, mặt phẳng $(A B C D)$ song song với mặt phẳng nằm ngang. Khung sắt đó được buộc vào móc $E$ của chiếc cần cẩu sao cho các đoạn dây cáp $E A, E B, E C, E D$ có độ dài bằng nhau và cùng tạo với mặt phẳng $(A B C D)$ một góc bằng $60^degree$. Chiếc cần cẩu kéo khung sắt lên theo phương thẳng đứng. Biết rằng các lực căng $arrow(F_1), arrow(F_2), arrow(F_3), arrow(F_4)$ đều có cường độ là $4700$ N và trọng lượng của khung sắt là $3000$ N. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(F_1) + arrow(F_2) = arrow(F_3) + arrow(F_4)$.],
    True([$arrow(F_1) + arrow(F_3) = arrow(F_2) + arrow(F_4)$.]),
    True([$|arrow(F_1) + arrow(F_3)| = 8141$ N (làm tròn đến hàng đơn vị).]),
    [Trọng lượng của chiếc xe ô tô là $16282$ N (làm tròn đến hàng đơn vị).]
  ),
  loigiai: [
    #step[a) Các vectơ lực căng $arrow(F_1), arrow(F_2)$ hướng từ $E$ đến $A, B$, còn $arrow(F_3), arrow(F_4)$ hướng từ $E$ đến $C, D$. Các cặp này không thể bằng nhau vì phương hướng khác nhau. (Sai)]
    #step[b) Do tính chất đối xứng của hình chữ nhật $A B C D$, hai dây đối diện $E A$ và $E C$ tạo thành các góc bằng nhau với trục thẳng đứng. Tổng hợp lực căng của cặp đối diện $arrow(F_1) + arrow(F_3)$ hướng thẳng đứng lên trên.
    Tương tự, $arrow(F_2) + arrow(F_4)$ cũng hướng thẳng đứng lên trên và có độ lớn bằng nhau. Do đó chúng là hai vectơ bằng nhau. (Đúng)]
    #step[c) Độ lớn của hợp lực hai dây đối diện $arrow(F_1)$ và $arrow(F_3)$ là:
    $|arrow(F_1) + arrow(F_3)| = 2 F_1 sin 60^degree = 2 times 4700 times sqrt(3)/2 = 4700 sqrt(3) approx 8140.64$ (N).
    Làm tròn đến hàng đơn vị ta được $8141$ N. (Đúng)]
    #step[d) Tổng hợp lực nâng của 4 sợi dây cáp là lực nâng thẳng đứng hướng lên:
    $F_("nâng") = 4 F_1 sin 60^degree = 4 times 4700 times sqrt(3)/2 = 9400 sqrt(3) approx 16281.27$ (N).
    Trọng lượng tổng cộng của khung sắt và ô tô khi nâng thẳng đứng đều là $P_("tổng") = F_("nâng") approx 16281$ N.
    Trọng lượng của ô tô là: $P_("ô tô") = P_("tổng") - P_("khung") = 16281 - 3000 = 13281$ (N).
    Phát biểu ghi trọng lượng xe ô tô là $16282$ N là Sai (đây là trọng lượng của cả xe và khung sắt). (Sai)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (10 câu)], count: 10)

#tln(
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$ biết rằng $arrow(A N) = -4 arrow(A B) + k arrow(A A') - 2 arrow(A D)$ ($k in RR$) và $arrow(A M) = 2 arrow(A B) + arrow(A A') - 3 arrow(A D)$. Tìm giá trị $k$ thích hợp để $arrow(A N) perp arrow(A M)$.],
  [$2$],
  loigiai: [
    #step[Chọn hệ tọa độ có gốc là đỉnh $A$ của hình lập phương, các trục trùng với các cạnh xuất phát từ $A$. Không mất tính tổng quát, giả sử độ dài cạnh hình lập phương bằng 1.
    Khi đó, các vectơ cơ sở $arrow(A B), arrow(A D), arrow(A A')$ đôi một vuông góc và có độ dài bằng 1.]
    #step[Tọa độ các vectơ:
    - $arrow(A N) = (-4; -2; k)$.
    - $arrow(A M) = (2; -3; 1)$.]
    #step[Điều kiện để $arrow(A N) perp arrow(A M)$ là tích vô hướng của chúng bằng 0:
    $arrow(A N) dot arrow(A M) = 0 <=> (-4) times 2 + (-2) times (-3) + k times 1 = 0$
    $<=> -8 + 6 + k = 0 <=> k - 2 = 0 <=> k = 2$.]
    #step[Vậy giá trị thích hợp là $k = 2$.]
  ]
)

#tln(
  [Trong không gian, cho hình chóp $S.A B C D$ có đáy là hình bình hành tâm $O$, $M$ là điểm thay đổi trên $S O$. Tìm tỉ số $(S M) / (S O)$ để biểu thức $P = M S^2 + M A^2 + M B^2 + M C^2 + M D^2$ đạt giá trị nhỏ nhất.],
  [$0.8$],
  loigiai: [
    #step[Chọn tâm $O$ làm gốc tọa độ. Do $O$ là tâm hình bình hành $A B C D$ nên ta có:
    $arrow(O A) + arrow(O C) = arrow(0)$ và $arrow(O B) + arrow(O D) = arrow(0)$.]
    #step[Ta biến đổi tổng bình phương khoảng cách:
    $M A^2 + M C^2 = (arrow(O A) - arrow(O M))^2 + (arrow(O C) - arrow(O M))^2 = 2 O M^2 + O A^2 + O C^2$ (vì $arrow(O A) + arrow(O C) = arrow(0)$).
    Tương tự: $M B^2 + M D^2 = 2 O M^2 + O B^2 + O D^2$.]
    #step[Do đó:
    $P = M S^2 + 4 O M^2 + C$, với $C = O A^2 + O B^2 + O C^2 + O D^2$ là hằng số.]
    #step[Vì $M$ nằm trên đoạn thẳng $S O$, đặt $arrow(O M) = (1-y) arrow(O S)$ với $y = S M / S O$ (điều kiện $0 <= y <= 1$).
    Khi đó, $arrow(M S) = y arrow(O S)$.]
    #step[Biểu thức $P$ trở thành:
    $P = y^2 O S^2 + 4 (1-y)^2 O S^2 + C = O S^2 (5 y^2 - 8 y + 4) + C$.]
    #step[Để $P$ đạt giá trị nhỏ nhất, ta tìm giá trị nhỏ nhất của tam thức bậc hai $f(y) = 5 y^2 - 8 y + 4$ trên đoạn $[0; 1]$.
    Tọa độ đỉnh của parabol là: $y = -(-8) / (2 times 5) = 8/10 = 0.8$ (thỏa mãn điều kiện).]
    #step[Vậy tỉ số $S M / S O$ để $P$ nhỏ nhất bằng $0.8$ (hoặc $4/5$).]
  ]
)

#tln(
  [Trong không gian, cho tứ diện $A B C D$ có các điểm $M, N, P$ lần lượt thuộc các cạnh $B C, B D, A C$ sao cho $B C = 4 B M$, $A C = 3 A P$, $B D = 2 B N$. Mặt phẳng $(M N P)$ cắt đường thẳng $A D$ tại điểm $Q$. Tính tỉ số $(A Q) / (A D)$.],
  [$0.6$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$, $arrow(A D) = arrow(d)$.
    Theo giả thiết, ta biểu diễn tọa độ các điểm $M, N, P, Q$ như sau:
    - $arrow(A P) = 1/3 arrow(c)$.
    - $B C = 4 B M => arrow(B M) = 1/4 arrow(B C) => arrow(A M) = 3/4 arrow(b) + 1/4 arrow(c)$.
    - $B D = 2 B N => arrow(A N) = 1/2 arrow(b) + 1/2 arrow(d)$.
    - $Q$ thuộc $A D => arrow(A Q) = k arrow(d)$.]
    #step[Vì bốn điểm $M, N, P, Q$ đồng phẳng nên ba vectơ $arrow(P M), arrow(P N), arrow(P Q)$ đồng phẳng. Ta tính chúng theo hệ cơ sở:
    - $arrow(P M) = arrow(A M) - arrow(A P) = 3/4 arrow(b) - 1/12 arrow(c)$.
    - $arrow(P N) = arrow(A N) - arrow(A P) = 1/2 arrow(b) - 1/3 arrow(c) + 1/2 arrow(d)$.
    - $arrow(P Q) = arrow(A Q) - arrow(A P) = -1/3 arrow(c) + k arrow(d)$.]
    #step[Vì ba vectơ đồng phẳng nên tồn tại hai số thực $x, y$ sao cho:
    $arrow(P Q) = x arrow(P M) + y arrow(P N)$
    $<=> -1/3 arrow(c) + k arrow(d) = (3/4 x + 1/2 y) arrow(b) - (1/12 x + 1/3 y) arrow(c) + 1/2 y arrow(d)$.]
    #step[Đồng nhất hệ số của các vectơ độc lập tuyến tính $arrow(b), arrow(c), arrow(d)$, ta có hệ phương trình:
    $heva(3/4 x + 1/2 y = 0, 1/12 x + 1/3 y = 1/3, 1/2 y = k) <=> heva(3x + 2y = 0, x + 4y = 4, k = 1/2 y)$.]
    #step[Giải hệ hai phương trình đầu:
    $x + 4(-1.5 x) = 4 <=> -5x = 4 <=> x = -4/5$
    $=> y = -1.5 times (-4/5) = 6/5$.]
    #step[Thay $y = 6/5$ vào phương trình cuối ta tìm được:
    $k = 1/2 times 6/5 = 3/5 = 0.6$.
    Do đó $arrow(A Q) = 0.6 arrow(A D) => A Q / A D = 0.6$.]
  ]
)

#tln(
  [Trong không gian, cho tứ diện $S.A B C$ có $S A = S B = S C = A B = A C = 2$, $B C = 2 sqrt(2)$. Hãy tính tích vô hướng $arrow(S C) dot arrow(A B)$.],
  [$-2$],
  loigiai: [
    #step[Xét tam giác $A B C$: có $A B = A C = 2$ và $B C = 2 sqrt(2)$.
    Ta thấy $A B^2 + A C^2 = 2^2 + 2^2 = 8 = B C^2$. Do đó tam giác $A B C$ vuông cân tại $A$.]
    #step[Xét tam giác $S B C$: tương tự có $S B = S C = 2$ và $B C = 2 sqrt(2)$ nên tam giác $S B C$ vuông cân tại $S$. Suy ra $arrow(S B) perp arrow(S C) <=> arrow(S B) dot arrow(S C) = 0$.]
    #step[Xét tam giác $S A C$: có $S A = S C = A C = 2$ nên tam giác $S A C$ là tam giác đều.
    Do đó góc $hat(A S C) = 60^degree$. Tích vô hướng:
    $arrow(S A) dot arrow(S C) = S A dot S C dot cos 60^degree = 2 times 2 times 1/2 = 2$.]
    #step[Ta tính tích vô hướng đề bài yêu cầu:
    $arrow(S C) dot arrow(A B) = arrow(S C) dot (arrow(S B) - arrow(S A)) = arrow(S C) dot arrow(S B) - arrow(S C) dot arrow(S A) = 0 - 2 = -2$.]
  ]
)

#tln(
  [Trong không gian, cho tứ diện $A B C D$. Gọi $E, F$ lần lượt là trung điểm của $A B, C D$. Cho $A B = 2a$, $C D = 2b$, $E F = 2c$. Với $M$ là một điểm tùy ý, biết tổng $M A^2 + M B^2 = k M E^2 + l a^2$. Tính giá trị của biểu thức $k + l$.],
  [$4$],
  loigiai: [
    #step[Vì $E$ là trung điểm của đoạn thẳng $A B$, nên $M E$ là trung tuyến của tam giác $M A B$.]
    #step[Theo công thức độ dài đường trung tuyến trong tam giác $M A B$, ta luôn có:
    $M E^2 = (M A^2 + M B^2)/2 - A B^2/4$
    $<=> M A^2 + M B^2 = 2 M E^2 + A B^2/2$.]
    #step[Theo đề bài $A B = 2a$, thay vào hệ thức trên:
    $M A^2 + M B^2 = 2 M E^2 + (2a)^2/2 = 2 M E^2 + 2 a^2$.]
    #step[Đồng nhất hệ số với biểu thức $k M E^2 + l a^2$, ta có:
    $k = 2$ và $l = 2$.
    Vậy $k + l = 2 + 2 = 4$.]
  ]
)

#tln(
  [Trong không gian, cho hình hộp $A B C D.A' B' C' D'$. Biết $arrow(M A) = k arrow(M C)$, $arrow(N C') = l arrow(N D)$. Khi $M N$ song song với $B D'$ thì $k + l$ có giá trị là bao nhiêu?],
  [$-4$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt $arrow(A B) = arrow(a)$, $arrow(A D) = arrow(b)$, $arrow(A A') = arrow(c)$.
    Khi đó tọa độ các đỉnh:
    - $B = arrow(a)$, $C = arrow(a) + arrow(b)$, $D = arrow(b)$, $D' = arrow(b) + arrow(c)$.
    - Vectơ đường chéo: $arrow(B D') = arrow(b) + arrow(c) - arrow(a)$.]
    #step[Xác định vị trí điểm $M$ từ $arrow(M A) = k arrow(M C)$:
    $arrow(M A) - k arrow(M C) = arrow(0) <=> arrow(A M) = -k / (1 - k) arrow(A C) = -k / (1-k) (arrow(a) + arrow(b))$.
    Đặt $x = -k / (1-k)$, ta có $arrow(A M) = x arrow(a) + x arrow(b)$.]
    #step[Xác định vị trí điểm $N$ từ $arrow(N C') = l arrow(N D)$:
    $arrow(A N) - arrow(A C') = l (arrow(A D) - arrow(A N)) <=> (1-l) arrow(A N) = arrow(A C') - l arrow(A D)$.
    Vì $arrow(A C') = arrow(a) + arrow(b) + arrow(c)$ và $arrow(A D) = arrow(b)$:
    $arrow(A N) = 1/(1-l) arrow(a) + arrow(b) + 1/(1-l) arrow(c)$.
    Đặt $y = 1/(1-l)$, ta có $arrow(A N) = y arrow(a) + arrow(b) + y arrow(c)$.]
    #step[Vectơ $arrow(M N) = arrow(A N) - arrow(A M) = (y - x) arrow(a) + (1 - x) arrow(b) + y arrow(c)$.]
    #step[Để $M N parallel B D'$, tồn tại số thực $t != 0$ sao cho $arrow(M N) = t arrow(B D')$:
    $heva(y - x = -t, 1 - x = t, y = t) <=> heva(t - x = -t, 1 - x = t, y = t) <=> heva(x = 2t, 1 - 2t = t, y = t) <=> heva(t = 1/3, x = 2/3, y = 1/3)$.]
    #step[Từ các giá trị này ta tìm lại $k, l$:
    - $x = -k / (1-k) = 2/3 <=> -3k = 2 - 2k <=> k = -2$.
    - $y = 1 / (1-l) = 1/3 <=> 3 = 1 - l <=> l = -2$.
    Vậy $k + l = -2 + (-2) = -4$.]
  ]
)

#tln(
  [Trong không gian, cho hình hộp $A B C D.A_1 B_1 C_1 D_1$ có $G_1; G_2$ lần lượt là trọng tâm tam giác $B D A_1$ và $C B_1 D_1$. Biết $arrow(A C_1) = a arrow(A G_1) + b arrow(A G_2)$. Tính $a + b$.],
  [$2$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt các vectơ cạnh là $arrow(A B) = arrow(u)$, $arrow(A D) = arrow(v)$, $arrow(A A_1) = arrow(w)$.
    Vectơ đường chéo: $arrow(A C_1) = arrow(u) + arrow(v) + arrow(w)$.]
    #step[Vì $G_1$ là trọng tâm tam giác $B D A_1$, ta có:
    $arrow(A G_1) = 1/3 (arrow(A B) + arrow(A D) + arrow(A A_1)) = 1/3 (arrow(u) + arrow(v) + arrow(w)) = 1/3 arrow(A C_1)$.]
    #step[Vì $G_2$ là trọng tâm tam giác $C B_1 D_1$, ta có:
    $arrow(A G_2) = 1/3 (arrow(A C) + arrow(A B_1) + arrow(A D_1))$
    $= 1/3 ( (arrow(u) + arrow(v)) + (arrow(u) + arrow(w)) + (arrow(v) + arrow(w)) )$
    $= 2/3 (arrow(u) + arrow(v) + arrow(w)) = 2/3 arrow(A C_1)$.]
    #step[Ta cộng vế theo vế hai biểu thức trên:
    $arrow(A G_1) + arrow(A G_2) = 1/3 arrow(A C_1) + 2/3 arrow(A C_1) = arrow(A C_1)$.]
    #step[Đồng nhất hệ số với đẳng thức $arrow(A C_1) = a arrow(A G_1) + b arrow(A G_2)$, ta được:
    $a = 1$ và $b = 1$.
    Vậy $a + b = 2$.]
  ]
)

#tln(
  [Cho hình chóp $S.A B C$ với $S A = 3, S B = 4, S C = 5$. Một mặt phẳng $(alpha)$ thay đổi luôn đi qua trọng tâm của tứ diện $S.A B C$ cắt các cạnh $S A, S B, S C$ tại các điểm $A_1, B_1, C_1$. Tìm giá trị nhỏ nhất của biểu thức $P = 1/(S A_1^2) + 1/(S B_1^2) + 1/(S C_1^2)$.],
  [$0.32$],
  loigiai: [
    #step[Gọi $G$ là trọng tâm của tứ diện $S A B C$. Ta có đẳng thức vectơ:
    $arrow(S G) = 1/4 (arrow(S A) + arrow(S B) + arrow(S C))$.]
    #step[Đặt $arrow(S A_1) = x arrow(S A)$, $arrow(S B_1) = y arrow(S B)$, $arrow(S C_1) = z arrow(S C)$ với $x, y, z in (0; 1]$.
    Ta biểu diễn các vectơ đỉnh qua các điểm trên mặt cắt:
    $arrow(S G) = 1/4 ( 1/x arrow(S A_1) + 1/y arrow(S B_1) + 1/z arrow(S C_1) )$.]
    #step[Vì bốn điểm $G, A_1, B_1, C_1$ đồng phẳng nên tổng các hệ số của ba vectơ biểu diễn $arrow(S G)$ qua chúng phải bằng 1:
    $1/4 (1/x + 1/y + 1/z) = 1 <=> 1/x + 1/y + 1/z = 4$.]
    #step[Mặt khác, tỉ lệ độ dài là: $1/x = S A / S A_1 = 3 / S A_1$, $1/y = 4 / S B_1$, $1/z = 5 / S C_1$.
    Thay vào đẳng thức trên:
    $3 / S A_1 + 4 / S B_1 + 5 / S C_1 = 4$.]
    #step[Áp dụng bất đẳng thức Cauchy-Schwarz:
    $(3^2 + 4^2 + 5^2) (1/S A_1^2 + 1/S B_1^2 + 1/S C_1^2) >= (3 / S A_1 + 4 / S B_1 + 5 / S C_1)^2$
    $<=> (9 + 16 + 25) P >= 4^2 <=> 50 P >= 16 <=> P >= 16/50 = 0.32$.]
    #step[Dấu đẳng thức xảy ra khi các tỉ số bằng nhau. Vậy giá trị nhỏ nhất của $P$ là $0.32$ (hoặc $8/25$).]
  ]
)

#tln(
  [Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$. Gọi $N$ là điểm thỏa $arrow(C' N) = 2 arrow(N B')$, $M$ là trung điểm của $A' D'$, $I$ là giao điểm của $A' N$ và $B' M$. Biết $arrow(A I) = a arrow(A A') + b arrow(A B) + c arrow(A D)$. Tính $a + b + c$.],
  [$1.8$],
  loigiai: [
    #step[Chọn điểm $A$ làm gốc tọa độ. Đặt các vectơ cạnh là $arrow(A B) = arrow(b)$, $arrow(A D) = arrow(d)$, $arrow(A A') = arrow(h)$.
    Tọa độ các điểm liên quan:
    - $A' = arrow(h)$, $D' = arrow(d) + arrow(h)$ => Trung điểm $M$ của $A' D'$ là $M = 1/2 arrow(d) + arrow(h)$.
    - $C' = arrow(b) + arrow(d) + arrow(h)$, $B' = arrow(b) + arrow(h)$.]
    #step[Xác định điểm $N$ từ $arrow(C' N) = 2 arrow(N B')$:
    $arrow(C' N) - 2 arrow(N B') = arrow(0) <=> arrow(A N) = (arrow(A C') + 2 arrow(A B'))/3 = (arrow(b) + arrow(d) + arrow(h) + 2(arrow(b) + arrow(h)))/3 = arrow(b) + 1/3 arrow(d) + arrow(h)$.]
    #step[Vì $I$ là giao điểm của $A' N$ và $B' M$, ta biểu diễn $I$ theo hai cách:
    - $I$ nằm trên đường thẳng $A' N$: $arrow(A I) = arrow(A A') + t arrow(A' N) = arrow(h) + t (arrow(b) + 1/3 arrow(d))$.
    - $I$ nằm trên đường thẳng $B' M$: $arrow(A I) = arrow(A B') + s arrow(B' M) = (arrow(b) + arrow(h)) + s (1/2 arrow(d) - arrow(b)) = (1-s) arrow(b) + 1/2 s arrow(d) + arrow(h)$.]
    #step[Đồng nhất hệ số của các vectơ độc lập tuyến tính $arrow(b), arrow(d)$:
    $heva(t = 1 - s, 1/3 t = 1/2 s) <=> heva(t = 1 - s, 2t = 3s) <=> heva(s = 2/5, t = 3/5)$.]
    #step[Thay $t = 3/5$ ta được tọa độ của $I$:
    $arrow(A I) = 3/5 arrow(b) + 1/5 arrow(d) + arrow(h) = 1 arrow(A A') + 3/5 arrow(A B) + 1/5 arrow(A D)$.]
    #step[Do đó $a = 1, b = 0.6, c = 0.2$.
    Tổng $a + b + c = 1 + 0.6 + 0.2 = 1.8$.]
  ]
)

#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of pyramid
    let S = (0, 3.0)
    let A = (-1.5, 0.2)
    let B = (0.5, -0.4)
    let C = (1.5, 0.4)
    let D = (-0.5, 1.0)
    
    // Calculate points exactly
    let M = ( (S.at(0) + D.at(0)) / 2, (S.at(1) + D.at(1)) / 2 )
    let N = ( (B.at(0) + 2 * C.at(0)) / 3, (B.at(1) + 2 * C.at(1)) / 3 )
    let P = ( 0.25 * S.at(0) + 0.75 * C.at(0), 0.25 * S.at(1) + 0.75 * C.at(1) )

    // Draw hidden edges first
    line(S, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(C, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(A, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))

    // Draw section AMNP (hidden parts)
    line(A, N, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))
    line(M, P, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))
    line(M, A, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))

    // Draw visible edges
    line(S, A, stroke: 1.2pt)
    line(S, B, stroke: 1.2pt)
    line(S, C, stroke: 1.2pt)
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)

    // Draw section AMNP (visible parts)
    line(N, P, stroke: 1.2pt + blue)

    // Draw points
    circle(M, radius: 0.04, fill: black)
    content((M.at(0) - 0.2, M.at(1) + 0.1), $M$)
    
    circle(N, radius: 0.04, fill: black)
    content((N.at(0) + 0.25, N.at(1) - 0.1), $N$)
    
    circle(P, radius: 0.04, fill: black)
    content((P.at(0) + 0.25, P.at(1) + 0.1), $P$)

    // Labels
    content((S.at(0), S.at(1) + 0.3), $S$)
    content((A.at(0) - 0.2, A.at(1)), $A$)
    content((B.at(0) + 0.1, B.at(1) - 0.2), $B$)
    content((C.at(0) + 0.2, C.at(1)), $C$)
    content((D.at(0) - 0.2, D.at(1) + 0.15), $D$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Trong không gian, cho hình chóp $S.A B C D$ đáy là hình bình hành. Gọi $M$ và $N$ là các điểm thỏa mãn $arrow(M D) + arrow(M S) = arrow(0)$, $arrow(N B) + 2 arrow(N C) = arrow(0)$. Mặt phẳng $(A M N)$ cắt $S C$ tại $P$. Tính tỉ số $(S P) / (S C)$.],
  [$0.75$],
  loigiai: [
    #step[Chọn điểm $S$ làm gốc tọa độ. Đặt các vectơ từ đỉnh $S$ là $arrow(S A) = arrow(a)$, $arrow(S B) = arrow(b)$, $arrow(S C) = arrow(c)$, $arrow(S D) = arrow(d)$.
    Vì đáy $A B C D$ là hình bình hành nên ta có liên hệ:
    $arrow(a) + arrow(c) = arrow(b) + arrow(d) <=> arrow(a) = arrow(b) + arrow(d) - arrow(c)$.]
    #step[Xác định vị trí các điểm $M, N$ từ giả thiết:
    - $M$ là trung điểm $S D$ => $arrow(S M) = 1/2 arrow(d)$.
    - $arrow(N B) + 2 arrow(N C) = arrow(0) => arrow(S N) = 1/3 arrow(b) + 2/3 arrow(c)$.]
    #step[Vì $P$ thuộc cạnh $S C$, ta đặt $arrow(S P) = k arrow(c)$ với $k in (0; 1]$.
    Do bốn điểm $A, M, N, P$ đồng phẳng nên tồn tại ba số thực $x, y, z$ sao cho $x + y + z = 1$ và:
    $arrow(S P) = x arrow(S A) + y arrow(S M) + z arrow(S N)$.]
    #step[Thay các biểu thức vectơ vào đẳng thức trên:
    $k arrow(c) = x arrow(a) + 1/2 y arrow(d) + z (1/3 arrow(b) + 2/3 arrow(c))$.]
    #step[Thay thế $arrow(a) = arrow(b) + arrow(d) - arrow(c)$ để biểu diễn toàn bộ theo hệ vectơ độc lập tuyến tính $\{arrow(b), arrow(c), arrow(d)\}$:
    $k arrow(c) = x (arrow(b) + arrow(d) - arrow(c)) + 1/2 y arrow(d) + 1/3 z arrow(b) + 2/3 z arrow(c)$
    $<=> k arrow(c) = (x + 1/3 z) arrow(b) + (-x + 2/3 z) arrow(c) + (x + 1/2 y) arrow(d)$.]
    #step[Đồng nhất hệ số của các vectơ $arrow(b)$ và $arrow(d)$, ta có:
    - $x + 1/3 z = 0 => z = -3x$.
    - $x + 1/2 y = 0 => y = -2x$.]
    #step[Thay vào điều kiện $x + y + z = 1$:
    $x - 2x - 3x = 1 <=> -4x = 1 <=> x = -1/4$.
    Từ đó: $y = 1/2$ và $z = 3/4$.]
    #step[Hệ số của $arrow(c)$ cho ta giá trị của $k$:
    $k = -x + 2/3 z = -(-1/4) + 2/3 times 3/4 = 1/4 + 1/2 = 3/4 = 0.75$.
    Do đó $S P / S C = 0.75$.]
  ]
)


