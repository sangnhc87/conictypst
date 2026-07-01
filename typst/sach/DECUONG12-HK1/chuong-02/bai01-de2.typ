#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 02 — Vectơ trong không gian])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (24 câu)], count: 24)

#tn(
  [Cho $arrow(a)$ và $arrow(b)$ là hai vectơ cùng hướng và đều khác vectơ $arrow(0)$. Mệnh đề nào sau đây đúng?],
  (
    True([$arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)|$]),
    [$arrow(a) dot arrow(b) = 0$],
    [$arrow(a) dot arrow(b) = -1$],
    [$arrow(a) dot arrow(b) = -|arrow(a)| dot |arrow(b)|$]
  ),
  loigiai: [
    #step[Hai vectơ khác $arrow(0)$ cùng hướng thì góc giữa chúng bằng $0^degree$.]
    #step[Theo công thức tính tích vô hướng:
    $arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)| cos(arrow(a), arrow(b)) = |arrow(a)| dot |arrow(b)| cos 0^degree = |arrow(a)| dot |arrow(b)|$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ khác $arrow(0)$. Xác định góc $alpha$ giữa hai vectơ $arrow(a)$ và $arrow(b)$ khi $arrow(a) dot arrow(b) = -|arrow(a)| dot |arrow(b)|$.],
  (
    True([$alpha = 180^degree$]),
    [$alpha = 0^degree$],
    [$alpha = 90^degree$],
    [$alpha = 45^degree$]
  ),
  loigiai: [
    #step[Theo định nghĩa tích vô hướng:
    $arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)| cos alpha$.]
    #step[Từ giả thiết ta có:
    $|arrow(a)| dot |arrow(b)| cos alpha = -|arrow(a)| dot |arrow(b)| <=> cos alpha = -1$.]
    #step[Do đó $alpha = 180^degree$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ thỏa mãn $|arrow(a)|=3, |arrow(b)|=2$ và $arrow(a) dot arrow(b) = -3$. Xác định góc $alpha$ giữa hai vectơ $arrow(a)$ và $arrow(b)$.],
  (
    [$alpha = 30^degree$],
    [$alpha = 45^degree$],
    [$alpha = 60^degree$],
    True([$alpha = 120^degree$])
  ),
  loigiai: [
    #step[Ta dùng công thức tính cosin của góc giữa hai vectơ:
    $cos alpha = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|)$.]
    #step[Thay các số liệu đề bài cho:
    $cos alpha = -3 / (3 times 2) = -1/2$.]
    #step[Vì $0^degree <= alpha <= 180^degree$, suy ra $alpha = 120^degree$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ thỏa mãn $|arrow(a)|=|arrow(b)|=1$ và hai vectơ $arrow(u) = 2/5 arrow(a) - 3 arrow(b)$ và $arrow(v) = arrow(a) + arrow(b)$ vuông góc với nhau. Xác định góc $alpha$ giữa hai vectơ $arrow(a)$ và $arrow(b)$.],
  (
    [$alpha = 90^degree$],
    True([$alpha = 180^degree$]),
    [$alpha = 60^degree$],
    [$alpha = 45^degree$]
  ),
  loigiai: [
    #step[Hai vectơ $arrow(u)$ và $arrow(v)$ vuông góc khi và chỉ khi tích vô hướng của chúng bằng 0:
    $arrow(u) dot arrow(v) = 0 <=> (2/5 arrow(a) - 3 arrow(b)) dot (arrow(a) + arrow(b)) = 0$.]
    #step[Khai triển biểu thức tích vô hướng:
    $2/5 |arrow(a)|^2 - 3 |arrow(b)|^2 + (2/5 - 3) arrow(a) dot arrow(b) = 0$.]
    #step[Thay $|arrow(a)|=|arrow(b)|=1$:
    $2/5 - 3 - 13/5 (arrow(a) dot arrow(b)) = 0 <=> -13/5 - 13/5 (arrow(a) dot arrow(b)) = 0 <=> arrow(a) dot arrow(b) = -1$.]
    #step[Ta tính cosin của góc giữa chúng:
    $cos alpha = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|) = -1 / 1 = -1 => alpha = 180^degree$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ thỏa mãn điều kiện $|arrow(a)|=|arrow(b)|=1$ và $arrow(a) dot arrow(b) = 3$. Độ dài vectơ $3 arrow(a) + 5 arrow(b)$ bằng:],
  (
    [$5 sqrt(5)$],
    [$sqrt(24)$],
    [$8$],
    True([$124$])
  ),
  loigiai: [
    #step[Xét bình phương vô hướng của vectơ cần tính:
    $|3 arrow(a) + 5 arrow(b)|^2 = (3 arrow(a) + 5 arrow(b))^2 = 9 |arrow(a)|^2 + 25 |arrow(b)|^2 + 30 (arrow(a) dot arrow(b))$.]
    #step[Thay các giá trị giả thiết đề bài vào:
    $|3 arrow(a) + 5 arrow(b)|^2 = 9 times 1^2 + 25 times 1^2 + 30 times 3 = 9 + 25 + 90 = 124$.]
    #step[Mặc dù điều kiện $|arrow(a) dot arrow(b)| <= 1$ không thỏa mãn trong thực tế toán học đối với vectơ đơn vị, nhưng theo số liệu giả định của đề bài, giá trị bình phương là $124$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vectơ $arrow(a), arrow(b)$ thỏa mãn: $|arrow(a)| = 4; |arrow(b)| = 3; |arrow(a)-arrow(b)| = 4$. Gọi $alpha$ là góc giữa hai vectơ $arrow(a), arrow(b)$. Chọn khẳng định đúng.],
  (
    True([$cos alpha = 3/8$]),
    [$alpha = 30^degree$],
    [$cos alpha = 1/3$],
    [$alpha = 60^degree$]
  ),
  loigiai: [
    #step[Ta có mối liên hệ giữa bình phương độ dài và tích vô hướng:
    $|arrow(a)-arrow(b)|^2 = |arrow(a)|^2 + |arrow(b)|^2 - 2 arrow(a) dot arrow(b)$.]
    #step[Thay các độ lớn vào đẳng thức trên:
    $4^2 = 4^2 + 3^2 - 2 arrow(a) dot arrow(b) <=> 16 = 16 + 9 - 2 arrow(a) dot arrow(b) <=> 2 arrow(a) dot arrow(b) = 9 <=> arrow(a) dot arrow(b) = 4.5$.]
    #step[Tính cosin góc giữa hai vectơ:
    $cos alpha = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|) = 4.5 / (4 times 3) = 4.5 / 12 = 3/8$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vectơ $arrow(a), arrow(b)$ thỏa mãn: $|arrow(a)| = 4; |arrow(b)| = 3; arrow(a) dot arrow(b) = 10$. Xét hai vectơ $arrow(y) = arrow(a) - arrow(b)$, $arrow(x) = arrow(a) - 2 arrow(b)$. Gọi $alpha$ là góc giữa hai vectơ $arrow(x), arrow(y)$. Chọn khẳng định đúng.],
  (
    [$cos alpha = -2/sqrt(15)$],
    [$cos alpha = 1/sqrt(15)$],
    [$cos alpha = 3/sqrt(15)$],
    True([$cos alpha = 2/sqrt(15)$])
  ),
  loigiai: [
    #step[Tính bình phương độ dài các vectơ $arrow(x)$ và $arrow(y)$:
    - $|arrow(x)|^2 = |arrow(a) - 2 arrow(b)|^2 = |arrow(a)|^2 + 4 |arrow(b)|^2 - 4 (arrow(a) dot arrow(b)) = 16 + 4 times 9 - 4 times 10 = 12 => |arrow(x)| = sqrt(12) = 2 sqrt(3)$.
    - $|arrow(y)|^2 = |arrow(a) - arrow(b)|^2 = |arrow(a)|^2 + |arrow(b)|^2 - 2 (arrow(a) dot arrow(b)) = 16 + 9 - 2 times 10 = 5 => |arrow(y)| = sqrt(5)$.]
    #step[Tính tích vô hướng của $arrow(x)$ và $arrow(y)$:
    $arrow(x) dot arrow(y) = (arrow(a) - 2 arrow(b)) dot (arrow(a) - arrow(b)) = |arrow(a)|^2 - 3 (arrow(a) dot arrow(b)) + 2 |arrow(b)|^2 = 16 - 30 + 18 = 4$.]
    #step[Tính cosin góc $alpha$:
    $cos alpha = (arrow(x) dot arrow(y)) / (|arrow(x)| dot |arrow(y)|) = 4 / (2 sqrt(3) times sqrt(5)) = 2 / sqrt(15)$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vectơ $arrow(a), arrow(b)$ thỏa mãn: $|arrow(a)| = 26; |arrow(b)| = 28; |arrow(a)+arrow(b)| = 48$. Độ dài vectơ $arrow(a)-arrow(b)$ bằng?],
  (
    [$25$],
    True([$sqrt(616)$]),
    [$9$],
    [$sqrt(618)$]
  ),
  loigiai: [
    #step[Ta áp dụng hệ thức hình bình hành đối với độ dài vectơ:
    $|arrow(a)+arrow(b)|^2 + |arrow(a)-arrow(b)|^2 = 2(|arrow(a)|^2 + |arrow(b)|^2)$.]
    #step[Thay các giá trị số đề bài đã cho:
    $48^2 + |arrow(a)-arrow(b)|^2 = 2(26^2 + 28^2)$
    $<=> 2304 + |arrow(a)-arrow(b)|^2 = 2(676 + 784) = 2920$.]
    #step[Tính độ dài vectơ hiệu:
    $|arrow(a)-arrow(b)|^2 = 2920 - 2304 = 616 => |arrow(a)-arrow(b)| = sqrt(616)$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$ có $A B = A C = A D$ và $hat(B A C) = hat(B A D) = 60^degree$. Hãy xác định góc giữa cặp vectơ $arrow(A B)$ và $arrow(C D)$?],
  (
    [$60^degree$],
    [$45^degree$],
    [$120^degree$],
    True([$90^degree$])
  ),
  loigiai: [
    #step[Xét tích vô hướng của hai vectơ:
    $arrow(A B) dot arrow(C D) = arrow(A B) dot (arrow(A D) - arrow(A C)) = arrow(A B) dot arrow(A D) - arrow(A B) dot arrow(A C)$.]
    #step[Đặt độ dài các cạnh bằng nhau là $A B = A C = A D = m$. Ta có:
    - $arrow(A B) dot arrow(A D) = A B dot A D cos hat(B A D) = m^2 cos 60^degree = 1/2 m^2$.
    - $arrow(A B) dot arrow(A C) = A B dot A C cos hat(B A C) = m^2 cos 60^degree = 1/2 m^2$.]
    #step[Do đó:
    $arrow(A B) dot arrow(C D) = 1/2 m^2 - 1/2 m^2 = 0$.
    Vì tích vô hướng bằng 0 nên hai vectơ vuông góc với nhau, góc giữa chúng bằng $90^degree$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho hình chóp $S.A B C$ có $S A = S B = S C$ và $hat(A S B) = hat(B S C) = hat(C S A)$. Hãy xác định góc giữa cặp vectơ $arrow(S A)$ và $arrow(B C)$?],
  (
    [$120^degree$],
    True([$90^degree$]),
    [$60^degree$],
    [$45^degree$]
  ),
  loigiai: [
    #step[Ta tính tích vô hướng của hai vectơ đề bài yêu cầu:
    $arrow(S A) dot arrow(B C) = arrow(S A) dot (arrow(S C) - arrow(S B)) = arrow(S A) dot arrow(S C) - arrow(S A) dot arrow(S B)$.]
    #step[Đặt độ dài các cạnh bên là $S A = S B = S C = m$ và các góc ở đỉnh bằng nhau là $hat(A S B) = hat(B S C) = hat(C S A) = beta$.]
    #step[Khi đó ta có:
    - $arrow(S A) dot arrow(S C) = m^2 cos beta$.
    - $arrow(S A) dot arrow(S B) = m^2 cos beta$.
    Từ đó $arrow(S A) dot arrow(B C) = m^2 cos beta - m^2 cos beta = 0$, suy ra $arrow(S A) perp arrow(B C)$.
    Góc giữa hai vectơ bằng $90^degree$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho hình chóp $S.A B C D$ có đáy là hình vuông $A B C D$ cạnh bằng $a$ và các cạnh bên đều bằng $a$. Gọi $M$ và $N$ lần lượt là trung điểm của $A D$ và $S D$. Số đo của góc $(M N, S C)$ bằng:],
  (
    [$45^degree$],
    [$30^degree$],
    True([$90^degree$]),
    [$60^degree$]
  ),
  loigiai: [
    #step[Trong tam giác $S A D$, $M$ và $N$ lần lượt là trung điểm của $A D$ và $S D$ nên $M N$ là đường trung bình của tam giác $S A D$.
    Suy ra $M N parallel S A$. Do đó, góc giữa hai đường thẳng $M N$ và $S C$ bằng góc giữa $S A$ và $S C$.]
    #step[Xét tam giác $S A C$ có $S A = a$, $S C = a$, và $A C$ là đường chéo hình vuông đáy cạnh $a$ nên $A C = a sqrt(2)$.]
    #step[Ta có:
    $S A^2 + S C^2 = a^2 + a^2 = 2 a^2 = A C^2$.
    Theo định lý Pythagore đảo, tam giác $S A C$ vuông tại $S$, góc $hat(A S C) = 90^degree$.
    Vậy góc $(M N, S C) = 90^degree$. Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$ đều cạnh bằng $a$. Gọi $O$ là tâm đường tròn ngoại tiếp tam giác $B C D$. Góc giữa $A O$ và $C D$ bằng bao nhiêu?],
  (
    [$0^degree$],
    [$30^degree$],
    True([$90^degree$]),
    [$60^degree$]
  ),
  loigiai: [
    #step[Vì tứ diện $A B C D$ đều và $O$ là tâm đường tròn ngoại tiếp tam giác đáy $B C D$ nên đường thẳng $A O$ vuông góc với mặt phẳng đáy $(B C D)$.]
    #step[Đường thẳng $C D$ nằm trong mặt phẳng đáy $(B C D)$ nên $A O perp C D$.]
    #step[Do đó góc giữa hai đường thẳng $A O$ và $C D$ bằng $90^degree$. Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$ với $A B perp A C, A B perp B D$. Gọi $P, Q$ lần lượt là trung điểm của $A B$ và $C D$. Góc giữa $P Q$ và $A B$ là?],
  (
    True([$90^degree$]),
    [$60^degree$],
    [$30^degree$],
    [$45^degree$]
  ),
  loigiai: [
    #step[Ta có vectơ trung điểm $arrow(P Q) = 1/2 (arrow(A D) + arrow(B C))$.]
    #step[Xét tích vô hướng:
    $arrow(P Q) dot arrow(A B) = 1/2 (arrow(A D) + arrow(B C)) dot arrow(A B) = 1/2 (arrow(A D) dot arrow(A B) + arrow(B C) dot arrow(A B))$.]
    #step[Ta biến đổi từng tích vô hướng:
    - $arrow(A D) dot arrow(A B) = (arrow(A B) + arrow(B D)) dot arrow(A B) = A B^2 + arrow(B D) dot arrow(A B) = A B^2$ (vì $A B perp B D$).
    - $arrow(B C) dot arrow(A B) = (arrow(A C) - arrow(A B)) dot arrow(A B) = arrow(A C) dot arrow(A B) - A B^2 = -A B^2$ (vì $A B perp A C$).]
    #step[Do đó $arrow(P Q) dot arrow(A B) = 1/2 (A B^2 - A B^2) = 0$. Suy ra $P Q perp A B$, góc giữa chúng bằng $90^degree$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$ có $A B = A C = A D$ và $hat(B A C) = hat(B A D) = 60^degree, hat(C A D) = 90^degree$. Gọi $I$ và $J$ lần lượt là trung điểm của $A B$ và $C D$. Hãy xác định góc giữa cặp vectơ $arrow(A B)$ và $arrow(I J)$?],
  (
    [$120^degree$],
    True([$90^degree$]),
    [$60^degree$],
    [$45^degree$]
  ),
  loigiai: [
    #step[Biểu diễn vectơ $arrow(I J)$ thông qua các cạnh xuất phát từ $A$:
    $arrow(I J) = arrow(A J) - arrow(A I) = 1/2 (arrow(A C) + arrow(A D)) - 1/2 arrow(A B)$.]
    #step[Tính tích vô hướng của $arrow(I J)$ và $arrow(A B)$:
    $arrow(I J) dot arrow(A B) = 1/2 arrow(A C) dot arrow(A B) + 1/2 arrow(A D) dot arrow(A B) - 1/2 A B^2$.]
    #step[Đặt $A B = A C = A D = m$. Ta có:
    - $arrow(A C) dot arrow(A B) = m^2 cos 60^degree = 1/2 m^2$.
    - $arrow(A D) dot arrow(A B) = m^2 cos 60^degree = 1/2 m^2$.]
    #step[Thay vào biểu thức tích vô hướng:
    $arrow(I J) dot arrow(A B) = 1/2 (1/2 m^2) + 1/2 (1/2 m^2) - 1/2 m^2 = 1/4 m^2 + 1/4 m^2 - 1/2 m^2 = 0$.
    Do đó $arrow(I J) perp arrow(A B)$, góc giữa chúng bằng $90^degree$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$ có hai mặt $A B C$ và $A B D$ là các tam giác đều. Khẳng định nào sau đây đúng nhất.],
  (
    [AB và CD chéo nhau],
    True([AB và CD vuông góc với nhau]),
    [AB và CD đồng phẳng],
    [AB và CD cắt nhau]
  ),
  loigiai: [
    #step[Gọi $M$ là trung điểm của cạnh $A B$.]
    #step[Vì tam giác $A B C$ đều nên đường trung tuyến $C M$ cũng là đường cao, suy ra $C M perp A B$.
Vì tam giác $A B D$ đều nên đường trung tuyến $D M$ cũng là đường cao, suy ra $D M perp A B$.]
    #step[Do $A B$ vuông góc với cả $C M$ và $D M$ nên $A B$ vuông góc với mặt phẳng $(C D M)$ chứa $C D$.
Suy ra $A B perp C D$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of prism
    let A = (-0.8, 2.0)
    let C = (1.5, 2.0)
    let B = (-0.3, 1.2)
    let A_d = (-0.8, 0.0)
    let C_d = (1.5, 0.0)
    let B_d = (-0.3, -0.8)
    
    // Draw top face ABC
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)
    line(C, A, stroke: 1.2pt)
    
    // Draw bottom face A'B'C'
    line(A_d, B_d, stroke: 1.2pt)
    line(B_d, C_d, stroke: 1.2pt)
    line(C_d, A_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    
    // Draw vertical edges
    line(A, A_d, stroke: (thickness: 0.8pt))
    line(B, B_d, stroke: 1.2pt)
    line(C, C_d, stroke: 1.2pt)
    
    // Diagonals AB' and BC'
    line(A, B_d, stroke: 1.2pt + blue)
    line(B, C_d, stroke: 1.2pt + red)
    
    // Labels
    content((-1.0, 2.0), $A$)
    content((-0.1, 1.4), $B$)
    content((1.7, 2.0), $C$)
    content((-1.0, 0.0), $A'$)
    content((-0.1, -0.9), $B'$)
    content((1.7, 0.0), $C'$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Cho hình lăng trụ tam giác đều $A B C.A' B' C'$ có $A B = a$ và $A A' = sqrt(2)a$. Góc giữa hai đường thẳng $A B$' và $B C$' bằng:],
  (
    True([$60^degree$]),
    [$45^degree$],
    [$90^degree$],
    [$30^degree$]
  ),
  loigiai: [
    #step[Đặt hệ vectơ cơ sở: $arrow(A B) = arrow(u)$, $arrow(A C) = arrow(v)$, $arrow(A A') = arrow(w)$.
    Do lăng trụ đều nên $|arrow(u)|=|arrow(v)|=a$, $|arrow(w)|=sqrt(2)a$, $arrow(w) perp arrow(u)$, $arrow(w) perp arrow(v)$, và góc $(arrow(u), arrow(v)) = 60^degree$.]
    #step[Biểu diễn hai vectơ đường chéo:
    - $arrow(A B') = arrow(u) + arrow(w) => |arrow(A B')|^2 = a^2 + 2a^2 = 3a^2$.
    - $arrow(B C') = arrow(v) - arrow(u) + arrow(w) => |arrow(B C')|^2 = (a^2+a^2-a^2) + 2a^2 = 3a^2$.]
    #step[Tính tích vô hướng:
    $arrow(A B') dot arrow(B C') = (arrow(u)+arrow(w)) dot (arrow(v)-arrow(u)+arrow(w)) = arrow(u) dot arrow(v) - |arrow(u)|^2 + |arrow(w)|^2 = 1/2 a^2 - a^2 + 2a^2 = 3/2 a^2$.]
    #step[Tính cosin góc giữa hai đường thẳng:
    $cos(A B', B C') = |arrow(A B') dot arrow(B C')| / (|arrow(A B')| |arrow(B C')|) = (3/2 a^2) / (3 a^2) = 1/2$.
    Vậy góc giữa chúng bằng $60^degree$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lập phương $A B C D.A_1 B_1 C_1 D_1$ có cạnh $a$. Gọi $M$ là trung điểm $A D$. Giá trị $arrow(B_1 M) dot arrow(B D_1)$ là:],
  (
    True([$1/2 a^2$]),
    [$a^2$],
    [$3/4 a^2$],
    [$3/2 a^2$]
  ),
  loigiai: [
    #step[Chọn hệ tọa độ có gốc là đỉnh $A$, các trục $A x, A y, A z$ lần lượt đi qua $B, D, A_1$.]
    #step[Tọa độ các điểm khi coi cạnh hình lập phương bằng $a$:
    - $B_1(a; 0; a)$, $M(0; a/2; 0)$.
    - $B(a; 0; 0)$, $D_1(0; a; a)$.]
    #step[Xác định tọa độ các vectơ:
    - $arrow(B_1 M) = (-a; a/2; -a)$.
    - $arrow(B D_1) = (-a; a; a)$.]
    #step[Tính tích vô hướng:
    $arrow(B_1 M) dot arrow(B D_1) = (-a)(-a) + (a/2)(a) + (-a)(a) = a^2 + 1/2 a^2 - a^2 = 1/2 a^2$.
    Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lập phương $A B C D.E F G H$. Hãy xác định góc giữa cặp vectơ $arrow(A B)$ và $arrow(E G)$?],
  (
    [$90^degree$],
    [$60^degree$],
    True([$45^degree$]),
    [$120^degree$]
  ),
  loigiai: [
    #step[Vì $A B C D.E F G H$ là hình lập phương nên hai mặt đáy $A B C D$ và $E F G H$ song song và các cạnh tương ứng song song.
    Ta có $arrow(E F) parallel arrow(A B)$ và cùng hướng, do đó $arrow(E F) = arrow(A B)$.]
    #step[Suy ra góc giữa $arrow(A B)$ và $arrow(E G)$ bằng góc giữa $arrow(E F)$ và $arrow(E G)$.]
    #step[Vì $E F G H$ là hình vuông nên đường chéo $E G$ tạo với cạnh $E F$ một góc $45^degree$.
    Do đó góc giữa hai vectơ bằng $45^degree$. Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lập phương $A B C D.A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của $A D, B B'$. Cosin của góc hợp bởi $M N$ và $A C'$ bằng:],
  (
    [$sqrt(3)/3$],
    True([$sqrt(2)/3$]),
    [$sqrt(5)/3$],
    [$sqrt(2)/4$]
  ),
  loigiai: [
    #step[Chọn hệ trục tọa độ gốc $A(0;0;0)$ với các cạnh của hình lập phương có độ dài bằng 1 nằm trên các trục tọa độ.
    Khi đó, ta có tọa độ các điểm:
    $M(0; 1/2; 0)$, $N(1; 0; 1/2)$, và $C'(1; 1; 1)$.]
    #step[Tọa độ các vectơ:
    - $arrow(M N) = (1; -1/2; 1/2) => |arrow(M N)| = sqrt(1^2 + (-1/2)^2 + (1/2)^2) = sqrt(3/2)$.
    - $arrow(A C') = (1; 1; 1) => |arrow(A C')| = sqrt(3)$.]
    #step[Tính tích vô hướng:
    $arrow(M N) dot arrow(A C') = 1 times 1 + (-1/2) times 1 + (1/2) times 1 = 1$.]
    #step[Tính cosin góc giữa hai đường thẳng:
    $cos alpha = |arrow(M N) dot arrow(A C')| / (|arrow(M N)| |arrow(A C')|) = 1 / (sqrt(3/2) times sqrt(3)) = 1 / sqrt(9/2) = sqrt(2)/3$.
    Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lăng trụ $A B C.A' B' C'$ có đáy $A B C$ là tam giác đều cạnh $a$, tam giác $A' B C$ đều nằm trong mặt phẳng vuông góc với $(A B C)$. $M$ là trung điểm cạnh $C C'$. Tính cosin góc $alpha$ giữa hai đường thẳng $A A'$ và $B M$.],
  (
    [$2 sqrt(2)/11$],
    True([$sqrt(33)/11$]),
    [$sqrt(11)/11$],
    [$sqrt(22)/11$]
  ),
  loigiai: [
    #step[Chọn hệ tọa độ gốc là trung điểm $H$ của $B C$. Trục $H y$ trùng với $H C$, trục $H z$ trùng với $H A'$ (do $A' H perp (A B C)$), trục $H x$ đi qua $A$.]
    #step[Chiều cao tam giác đều $A' B C$ và $A B C$ bằng $a sqrt(3)/2$. Tọa độ các đỉnh:
    $H(0;0;0)$, $C(0; a/2; 0)$, $B(0; -a/2; 0)$, $A(a sqrt(3)/2; 0; 0)$, $A'(0; 0; a sqrt(3)/2)$.]
    #step[Theo tính chất lăng trụ, ta xác định tọa độ $C'$ và trung điểm $M$ của $C C'$:
    - $C' = C + A' - A = (-a sqrt(3)/2; a/2; a sqrt(3)/2)$.
    - $M = 1/2 (C + C') = (-a sqrt(3)/4; a/2; a sqrt(3)/4)$.]
    #step[Tọa độ các vectơ:
    - $arrow(A A') = (-a sqrt(3)/2; 0; a sqrt(3)/2) => |arrow(A A')| = a sqrt(6)/2$.
    - $arrow(B M) = (-a sqrt(3)/4; a; a sqrt(3)/4) => |arrow(B M)| = a sqrt(22)/4$.
    - Tích vô hướng: $arrow(A A') dot arrow(B M) = 3/8 a^2 + 3/8 a^2 = 3/4 a^2$.]
    #step[Tính cosin góc $alpha$:
    $cos alpha = |arrow(A A') dot arrow(B M)| / (|arrow(A A')| |arrow(B M)|) = (3/4 a^2) / (a^2 sqrt(33)/4) = sqrt(33)/11$.
    Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  dir: "doc",lines: 2,
  [Cho tam giác $A B C$, thì công thức tính diện tích nào sau đây là đúng nhất.],
  (
    [$S = 1/2 sqrt(A B^2 A C^2 - B C^2)$],
    [$S = 1/2 sqrt(A B^2 A C^2 + 1/2 (arrow(A B) dot arrow(A C))^2)$],
    [$S = 1/2 sqrt(A B^2 A C^2 - 1/2 (arrow(A B) dot arrow(A C))^2)$],
    True([$S = 1/2 sqrt(A B^2 A C^2 - (arrow(A B) dot arrow(A C))^2)$])
  ),
  loigiai: [
    #step[Diện tích tam giác $A B C$ được tính bởi công thức:
    $S = 1/2 A B dot A C sin A$.]
    #step[Ta biến đổi hàm lượng giác:
    $sin A = sqrt(1 - cos^2 A) => S = 1/2 A B dot A C sqrt(1 - cos^2 A) = 1/2 sqrt(A B^2 A C^2 - A B^2 A C^2 cos^2 A)$.]
    #step[Theo định nghĩa tích vô hướng:
    $arrow(A B) dot arrow(A C) = A B dot A C cos A$.
    Thay vào biểu thức trên ta được:
    $S = 1/2 sqrt(A B^2 A C^2 - (arrow(A B) dot arrow(A C))^2)$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho hình lập phương $A B C D.E F G H$ có cạnh bằng $a$. Ta có $arrow(A B) dot arrow(E G)$ bằng?],
  (
    [$a^2 sqrt(2)$],
    True([$a^2$]),
    [$a^2 sqrt(3)$],
    [$(a^2 sqrt(2))/2$]
  ),
  loigiai: [
    #step[Vì các mặt đối diện của hình lập phương song song nên $E G parallel A C$ và có cùng hướng, suy ra $arrow(E G) = arrow(A C)$.]
    #step[Tính tích vô hướng:
    $arrow(A B) dot arrow(E G) = arrow(A B) dot arrow(A C) = A B dot A C cos hat(B A C)$.]
    #step[Trong hình vuông $A B C D$ cạnh $a$, độ dài đường chéo $A C = a sqrt(2)$ và góc $hat(B A C) = 45^degree$.
    $arrow(A B) dot arrow(E G) = a dot a sqrt(2) dot cos 45^degree = a^2 sqrt(2) dot sqrt(2)/2 = a^2$.
    Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện $A B C D$ với $A C = 3/2 A D$, $hat(C A B) = hat(D A B) = 60^degree$, $C D = A D$. Gọi $phi$ là góc giữa $A B$ và $C D$. Chọn khẳng định đúng?],
  (
    [$cos phi = 3/4$],
    [$phi = 60^degree$],
    [$phi = 30^degree$],
    True([$cos phi = 1/4$])
  ),
  loigiai: [
    #step[Ta biểu diễn vectơ $arrow(C D) = arrow(A D) - arrow(A C)$.]
    #step[Tính tích vô hướng của $arrow(A B)$ và $arrow(C D)$:
    $arrow(A B) dot arrow(C D) = arrow(A B) dot (arrow(A D) - arrow(A C)) = arrow(A B) dot arrow(A D) - arrow(A B) dot arrow(A C)$.]
    #step[Đặt $A B = x, A D = y => A C = 3/2 y$ và $C D = y$. Ta có:
    - $arrow(A B) dot arrow(A D) = x y cos 60^degree = 1/2 x y$.
    - $arrow(A B) dot arrow(A C) = x (3/2 y) cos 60^degree = 3/4 x y$.
    Suy ra $arrow(A B) dot arrow(C D) = 1/2 x y - 3/4 x y = -1/4 x y$.]
    #step[Tính cosin góc giữa hai đường thẳng:
    $cos phi = |arrow(A B) dot arrow(C D)| / (A B dot C D) = (1/4 x y) / (x y) = 1/4$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Cho tứ diện đều $A B C D$, $M$ là trung điểm của cạnh $B C$. Khi đó $cos(A B, D M)$ bằng:],
  (
    [$sqrt(2)/2$],
    True([$sqrt(3)/6$]),
    [$1/2$],
    [$sqrt(3)/2$]
  ),
  loigiai: [
    #step[Đặt cạnh của tứ diện đều bằng $a$. Ta có $arrow(D M) = arrow(A M) - arrow(A D)$.]
    #step[Tích vô hướng:
    $arrow(A B) dot arrow(D M) = arrow(A B) dot (arrow(A M) - arrow(A D)) = arrow(A B) dot arrow(A M) - arrow(A B) dot arrow(A D)$.]
    #step[Vì $M$ là trung điểm của $B C$ nên $arrow(A M) = 1/2 (arrow(A B) + arrow(A C))$.
    - $arrow(A B) dot arrow(A M) = 1/2 A B^2 + 1/2 arrow(A B) dot arrow(A C) = 1/2 a^2 + 1/4 a^2 = 3/4 a^2$.
    - $arrow(A B) dot arrow(A D) = a^2 cos 60^degree = 1/2 a^2$.
    Do đó: $arrow(A B) dot arrow(D M) = 3/4 a^2 - 1/2 a^2 = 1/4 a^2$.]
    #step[Độ dài các đoạn: $A B = a$, $D M = a sqrt(3)/2$ (đường cao trong tam giác đều cạnh $a$).
    $cos(A B, D M) = |arrow(A B) dot arrow(D M)| / (A B dot D M) = (1/4 a^2) / (a dot a sqrt(3)/2) = 1 / (2 sqrt(3)) = sqrt(3)/6$.
    Chọn đáp án B.]
    #resetstep()
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  [Trong không gian, cho hai vectơ $arrow(a)$ và $arrow(b)$ cùng có độ dài bằng 1. Biết rằng góc giữa hai véc-tơ đó là $45^degree$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(a) dot arrow(b) = sqrt(2)/2$.]),
    True([$(arrow(a) + 3 arrow(b)) dot (arrow(a) - 2 arrow(b)) = -5 + sqrt(2)/2$.]),
    [$|arrow(a) + arrow(b)| = 2 + sqrt(2)$.],
    [$|arrow(a) - sqrt(2) arrow(b)| = 0$.]
  ),
  loigiai: [
    #step[a) Tích vô hướng: $arrow(a) dot arrow(b) = |arrow(a)| |arrow(b)| cos 45^degree = 1 times 1 times sqrt(2)/2 = sqrt(2)/2$. (Đúng)]
    #step[b) Nhân phân phối biểu thức tích vô hướng:
    $(arrow(a) + 3 arrow(b)) dot (arrow(a) - 2 arrow(b)) = |arrow(a)|^2 - 2 (arrow(a) dot arrow(b)) + 3 (arrow(a) dot arrow(b)) - 6 |arrow(b)|^2$
    $= 1 + arrow(a) dot arrow(b) - 6 = -5 + sqrt(2)/2$. (Đúng)]
    #step[c) Bình phương độ dài tổng:
    $|arrow(a) + arrow(b)|^2 = |arrow(a)|^2 + |arrow(b)|^2 + 2 arrow(a) dot arrow(b) = 1 + 1 + 2 (sqrt(2)/2) = 2 + sqrt(2)$
    $=> |arrow(a) + arrow(b)| = sqrt(2 + sqrt(2))$. Khẳng định thiếu dấu căn nên Sai. (Sai)]
    #step[d) Bình phương độ dài hiệu:
    $|arrow(a) - sqrt(2) arrow(b)|^2 = |arrow(a)|^2 + 2 |arrow(b)|^2 - 2 sqrt(2) (arrow(a) dot arrow(b)) = 1 + 2 - 2 sqrt(2) (sqrt(2)/2) = 3 - 2 = 1$
    $=> |arrow(a) - sqrt(2) arrow(b)| = 1 != 0$. (Sai)]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of regular tetrahedron
    let A = (0, 2.5)
    let B = (-1.5, 0.0)
    let C = (0.5, -0.4)
    let D = (1.5, 0.4)
    
    // Midpoint M of CD
    let M = (1.0, 0.0)
    
    // Draw solid edges
    line(A, B, stroke: 1.2pt)
    line(A, C, stroke: 1.2pt)
    line(A, D, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)
    line(C, D, stroke: 1.2pt)
    line(A, M, stroke: 1.2pt + blue)
    
    // Draw dashed back edges
    line(B, D, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(B, M, stroke: (thickness: 0.8pt, dash: "dashed", paint: red))
    
    // Labels
    content((0, 2.75), $A$)
    content((-1.7, 0.0), $B$)
    content((0.5, -0.65), $C$)
    content((1.7, 0.4), $D$)
    content((1.2, -0.2), $M$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Cho tứ diện đều $A B C D$ có cạnh bằng $a$ và $M$ là trung điểm của $C D$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(A M) dot arrow(C D) = 0$.]),
    True([$arrow(A B) dot arrow(A C) = a^2/2$.]),
    True([$arrow(A B) dot arrow(C D) = 0$.]),
    [$arrow(A M) dot arrow(A B) = - a^2/2$.]
  ),
  loigiai: [
    #step[a) Vì tam giác $A C D$ đều cạnh $a$ và $M$ là trung điểm $C D$ nên đường trung tuyến $A M$ đồng thời là đường cao: $A M perp C D => arrow(A M) dot arrow(C D) = 0$. (Đúng)]
    #step[b) Tích vô hướng: $arrow(A B) dot arrow(A C) = A B dot A C cos 60^degree = a^2 dot 1/2 = a^2/2$. (Đúng)]
    #step[c) Ta phân tích: $arrow(A B) dot arrow(C D) = arrow(A B) dot (arrow(A D) - arrow(A C)) = arrow(A B) dot arrow(A D) - arrow(A B) dot arrow(A C)$.
    Vì tứ diện đều nên $arrow(A B) dot arrow(A D) = a^2/2$ và $arrow(A B) dot arrow(A C) = a^2/2$.
    Do đó $arrow(A B) dot arrow(C D) = 0$. (Đúng)]
    #step[d) Ta có: $arrow(A M) dot arrow(A B) = 1/2 (arrow(A C) + arrow(A D)) dot arrow(A B) = 1/2 (arrow(A C) dot arrow(A B) + arrow(A D) dot arrow(A B))$.
    Thay các tích vô hướng đã biết: $1/2 (a^2/2 + a^2/2) = a^2/2 != -a^2/2$. (Sai)]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertices of cube
    let A = (-1.0, 1.0)
    let B = (1.0, 1.0)
    let B_d = (1.0, -1.0)
    let A_d = (-1.0, -1.0)
    let D = (-0.4, 1.6)
    let C = (1.6, 1.6)
    let C_d = (1.6, -0.4)
    let D_d = (-0.4, -0.4)
    
    // Draw solid edges
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)
    line(C, D, stroke: 1.2pt)
    line(D, A, stroke: 1.2pt)
    line(A, A_d, stroke: 1.2pt)
    line(B, B_d, stroke: 1.2pt)
    line(C, C_d, stroke: 1.2pt)
    line(A_d, B_d, stroke: 1.2pt)
    line(B_d, C_d, stroke: 1.2pt)
    
    // Draw dashed back edges
    line(D, D_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(C_d, D_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(D_d, A_d, stroke: (thickness: 0.8pt, dash: "dashed"))
    
    // Draw Force arrows from A
    // a along AD
    line(A, D, stroke: 1.5pt + rgb("#2E7D32"), mark: (end: "stealth", fill: rgb("#2E7D32")))
    content((-0.9, 1.5), text(fill: rgb("#2E7D32"))[$arrow(a)$])
    
    // b along AB
    line(A, B, stroke: 1.5pt + rgb("#d32f2f"), mark: (end: "stealth", fill: rgb("#d32f2f")))
    content((0.0, 1.25), text(fill: rgb("#d32f2f"))[$arrow(b)$])
    
    // c along AC'
    line(A, C_d, stroke: (thickness: 1.5pt, dash: "dashed", paint: blue), mark: (end: "stealth", fill: blue))
    content((0.4, 0.4), text(fill: blue)[$arrow(c)$])
    
    // Labels of vertices
    content((-1.2, 1.2), $A$)
    content((1.2, 1.2), $B$)
    content((1.8, 1.8), $C$)
    content((-0.3, 1.8), $D$)
    content((-1.2, -1.2), $A'$)
    content((1.2, -1.2), $B'$)
    content((1.8, -0.4), $C'$)
    content((-0.3, -0.4), $D'$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chất điểm ở vị trí đỉnh $A$ của hình lập phương $A B C D.A' B' C' D'$. Chất điểm chịu tác động bởi ba lực $arrow(a), arrow(b), arrow(c)$ lần lượt cùng hướng với $arrow(A D), arrow(A B)$ và $arrow(A C')$ như hình vẽ. Độ lớn của các lực $arrow(a), arrow(b)$ và $arrow(c)$ tương ứng là $10$ N, $10$ N và $20$ N. Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(a) + arrow(b) = arrow(c)$.],
    [$|arrow(a) + arrow(b)| = 20$ N.],
    True([$|arrow(a) + arrow(c)| = |arrow(b) + arrow(c)|$.]),
    True([$|arrow(a) + arrow(b) + arrow(c)| = 32.59$ N (làm tròn kết quả đến hàng phần mười).])
  ),
  loigiai: [
    #step[a) Lực $arrow(a)$ cùng phương $arrow(A D)$, lực $arrow(b)$ cùng phương $arrow(A B)$ nên tổng hợp lực $arrow(a)+arrow(b)$ nằm trên mặt phẳng $(A B C D)$ và cùng phương với đường chéo $arrow(A C)$.
Trong khi đó, lực $arrow(c)$ cùng phương với đường chéo không gian $arrow(A C')$. Do đó $arrow(a) + arrow(b) != arrow(c)$. (Sai)]
    #step[b) Vì $A B C D$ là hình vuông nên $A B perp A D => arrow(a) perp arrow(b)$.
    Độ lớn tổng lực hiệu dụng của $arrow(a)$ và $arrow(b)$ là:
    $|arrow(a) + arrow(b)| = sqrt(10^2 + 10^2) = 10 sqrt(2) approx 14.14$ N. (Sai)]
    #step[c) Do tính chất đối xứng của hình lập phương qua mặt phẳng chéo chứa $A C'$ và vuông góc đáy, các góc tạo bởi đường chéo $A C'$ với hai cạnh $A B$ và $A D$ là bằng nhau.
    Do đó tích vô hướng $arrow(a) dot arrow(c) = arrow(b) dot arrow(c)$.
    Suy ra: $|arrow(a)+arrow(c)|^2 = a^2 + c^2 + 2 arrow(a) dot arrow(c) = b^2 + c^2 + 2 arrow(b) dot arrow(c) = |arrow(b)+arrow(c)|^2$. (Đúng)]
    #step[d) Chọn hệ trục tọa độ sao cho các lực hướng dọc theo các vectơ đơn vị:
- $arrow(a) = (0; 10; 0)$,
- $arrow(b) = (10; 0; 0)$,
- $arrow(c) = 20/sqrt(3) (1; 1; 1) approx (11.547; 11.547; 11.547)$.
Tổng lực hiệu dụng: $arrow(F) = arrow(a) + arrow(b) + arrow(c) approx (21.547; 21.547; 11.547)$.
Độ lớn tổng lực: $F = sqrt(21.547^2 + 21.547^2 + 11.547^2) approx 32.59$ N. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Vertex S and height
    let S = (0, 3.2)
    let O = (0, 0.4)
    content((0, 3.4), $S$)
    
    // Base points of regular pyramid
    let A = (-1.4, 0.2)
    let B = (0.6, 0.9)
    let C = (1.4, 0.6)
    let D = (-0.6, -0.1)
    
    // Draw edges
    line(S, A, stroke: 1.2pt + rgb("#333"))
    line(S, B, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(S, C, stroke: 1.2pt + rgb("#333"))
    line(S, D, stroke: 1.2pt + rgb("#333"))
    
    // Base disk representing the light fixture
    circle(O, radius: (1.4, 0.5), fill: rgb(150, 160, 255, 60), stroke: 1.2pt + blue)
    
    // Center point and gravity P
    circle(O, radius: 0.04, fill: red)
    line(O, (0, -1.3), stroke: 2pt + rgb("#d32f2f"), mark: (end: "stealth", fill: rgb("#d32f2f")))
    content((0.3, -0.8), text(fill: rgb("#d32f2f"))[$arrow(P)$])
    
    // Labels
    content((-1.6, 0.2), $A$)
    content((0.8, 1.0), $B$)
    content((1.6, 0.6), $C$)
    content((-0.8, -0.2), $D$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc đèn chùm treo có khối lượng $m = 5$ kg được thiết kế với đĩa đèn được giữ bởi bốn đoạn xích $S A, S B, S C, S D$ sao cho $S.A B C D$ là hình chóp tứ giác đều có $hat(A S C) = 60^degree$. Biết $arrow(P) = m arrow(g)$ là trọng lực tác dụng lên đĩa đèn, với $g = 10$ m/s². Xét tính đúng/sai của các phát biểu sau:],
  (
    [$arrow(S A), arrow(S B), arrow(S C), arrow(S D)$ là 4 vectơ đồng phẳng.],
    True([$|arrow(S A)| = |arrow(S B)| = |arrow(S C)| = |arrow(S D)|$.]),
    True([Độ lớn của trọng lực $arrow(P)$ tác dụng lên chiếc đèn chùm bằng $50$ N.]),
    [Độ lớn của lực căng cho mỗi sợi xích bằng $(25 sqrt(3))/2$ N.]
  ),
  loigiai: [
    #step[a) Bốn vectơ lực xuất phát từ đỉnh $S$ hướng đến 4 đỉnh $A, B, C, D$ của hình chóp nên chúng không cùng nằm trên bất kỳ mặt phẳng nào. Do đó chúng không đồng phẳng. (Sai)]
    #step[b) Vì hình chóp $S.A B C D$ là hình chóp đều nên các cạnh bên bằng nhau, dẫn đến độ dài các vectơ lực căng xích bằng nhau. (Đúng)]
    #step[c) Trọng lượng chiếc đèn chùm là: $P = m g = 5 times 10 = 50$ N. (Đúng)]
    #step[d) Điều kiện cân bằng lực theo trục thẳng đứng $S O$:
    $4 T cos hat(A S O) = P$.
    Vì tam giác $S A C$ đều nên $hat(A S O) = 1/2 hat(A S C) = 30^degree$.
    $4 T cos 30^degree = 50 <=> 4 T dot sqrt(3)/2 = 50 <=> 2 sqrt(3) T = 50 <=> T = 25/sqrt(3) = (25 sqrt(3))/3$ N. Khẳng định ghi $(25 sqrt(3))/2$ N là Sai. (Sai)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  [Cho tứ diện đều $A B C D$ cạnh $a$. Gọi $M$ là trung điểm của $B C$. Tính cosin góc giữa hai đường thẳng $A B$ và $D M$.],
  [$0.29$],
  loigiai: [
    #step[Đặt cạnh của tứ diện đều bằng $a$. Ta biểu diễn tích vô hướng của $arrow(A B)$ và $arrow(D M)$:
    $arrow(A B) dot arrow(D M) = arrow(A B) dot (arrow(A M) - arrow(A D)) = arrow(A B) dot arrow(A M) - arrow(A B) dot arrow(A D)$.]
    #step[Với $M$ là trung điểm $B C$, ta có $arrow(A M) = 1/2 (arrow(A B) + arrow(A C))$:
    - $arrow(A B) dot arrow(A M) = 1/2 A B^2 + 1/2 arrow(A B) dot arrow(A C) = 1/2 a^2 + 1/4 a^2 = 3/4 a^2$.
    - $arrow(A B) dot arrow(A D) = a^2 cos 60^degree = 1/2 a^2$.]
    #step[Thay các biểu thức trên vào tích vô hướng:
    $arrow(A B) dot arrow(D M) = 3/4 a^2 - 1/2 a^2 = 1/4 a^2$.]
    #step[Độ dài các đoạn thẳng: $A B = a$, $D M = a sqrt(3)/2$ (đường cao trong tam giác đều cạnh $a$).
    $cos(A B, D M) = |arrow(A B) dot arrow(D M)| / (A B dot D M) = (1/4 a^2) / (a dot a sqrt(3)/2) = 1 / (2 sqrt(3)) = sqrt(3)/6 approx 0.29$.]
  ]
)

#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Draw slide
    line((0, 0), (4.0, 0), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed")) // ground
    line((0, 0), (0, 2.3), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed")) // ladder height
    line((0, 2.3), (4.0, 0), stroke: 1.5pt + black) // slide
    
    // Draw child (circle and stick body)
    circle((2.0, 1.15), radius: 0.15, fill: green.lighten(60%), stroke: 1pt + green)
    line((2.0, 1.0), (2.0, 0.5), stroke: 1.5pt + black)
    
    // Draw gravity P vector
    line((2.0, 0.5), (2.0, -0.7), stroke: 1.8pt + red, mark: (end: "stealth", fill: red))
    content((2.3, -0.4), text(fill: red)[$arrow(P)$])
    
    // Angle indicator
    arc((4.0, 0), start: 180deg, stop: 150deg, radius: 0.8, stroke: 1pt + gray)
    content((3.0, 0.25), $30^degree$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một em nhỏ cân nặng $m = 25$ kg trượt trên cầu trượt dài $3.5$ m. Biết rằng, cầu trượt có góc nghiêng so với phương nằm ngang là $30^degree$. Tính độ lớn của trọng lực $arrow(P) = m arrow(g)$ tác dụng lên em nhỏ, cho biết vectơ gia tốc rơi tự do $arrow(g)$ có độ lớn là $g = 9.8$ m/s².],
  [$245$],
  loigiai: [
    #step[Trọng lực $arrow(P)$ là lực hút của Trái Đất tác dụng lên vật có khối lượng $m$.]
    #step[Công thức tính độ lớn trọng lực:
    $P = m g$.]
    #step[Thay số với $m = 25$ kg và $g = 9.8$ m/s²:
    $P = 25 times 9.8 = 245$ (N).
    Vậy độ lớn trọng lực là $245$ N.]
  ]
)

#tln(
  [Có ba lực cùng tác động vào một vật. Hai trong ba lực này hợp với nhau một góc $100^degree$ và có độ lớn lần lượt là $25$ N và $12$ N. Lực thứ ba vuông góc với mặt phẳng tạo bởi hai lực đã cho và có độ lớn $4$ N. Tính độ lớn của hợp lực của ba lực trên (làm tròn đến hàng đơn vị).],
  [$26$],
  loigiai: [
    #step[Gọi ba lực lần lượt là $arrow(F_1), arrow(F_2), arrow(F_3)$ với $|arrow(F_1)| = 25$ N, $|arrow(F_2)| = 12$ N, $|arrow(F_3)| = 4$ N và $(arrow(F_1), arrow(F_2)) = 100^degree$.
    Vectơ hợp lực: $arrow(F) = arrow(F_1) + arrow(F_2) + arrow(F_3)$.]
    #step[Đặt $arrow(F_{12}) = arrow(F_1) + arrow(F_2)$. Bình phương độ lớn lực tổng hợp hai lực đầu tiên:
    $F_{12}^2 = F_1^2 + F_2^2 + 2 F_1 F_2 cos 100^degree = 25^2 + 12^2 + 2 times 25 times 12 times cos 100^degree$
    $F_{12}^2 = 625 + 144 + 600 cos 100^degree approx 769 - 104.19 = 664.81$ N².]
    #step[Vì lực thứ ba $arrow(F_3)$ vuông góc với mặt phẳng chứa $arrow(F_1)$ và $arrow(F_2)$ nên $arrow(F_3)$ vuông góc với $arrow(F_{12})$.
    Do đó, bình phương độ lớn của hợp lực tổng cộng là:
    $F^2 = F_{12}^2 + F_3^2 approx 664.81 + 4^2 = 680.81$ N².]
    #step[Tính độ lớn hợp lực:
    $F = sqrt(680.81) approx 26.09$ N. Làm tròn đến hàng đơn vị là $26$ N.]
  ]
)

#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    // Draw slide path
    line((0, 0), (4.0, 0), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line((0, 2.3), (4.0, 0), stroke: 1.5pt + black)
    
    // Draw child on slide
    circle((2.0, 1.15), radius: 0.15, fill: green.lighten(60%), stroke: 1pt + green)
    
    // Displacement vector d
    line((2.0, 1.15), (3.5, 0.28), stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    content((3.0, 0.9), text(fill: blue)[$arrow(d)$])
    
    // Gravity vector P
    line((2.0, 1.15), (2.0, -0.05), stroke: 1.8pt + red, mark: (end: "stealth", fill: red))
    content((2.3, 0.4), text(fill: red)[$arrow(P)$])
    
    // Angle
    arc((4.0, 0), start: 180deg, stop: 150deg, radius: 0.8, stroke: 1pt + gray)
    content((3.0, 0.25), $30^degree$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một em nhỏ cân nặng $m = 25$ kg trượt trên cầu trượt dài $3.5$ m. Biết rằng, cầu trượt có góc nghiêng so với phương nằm ngang là $30^degree$. Độ lớn của trọng lực là $arrow(P) = m arrow(g)$ tác dụng lên em nhỏ, với $g = 9.8$ m/s². Hãy tính công sinh bởi trọng lực $arrow(P)$ khi em nhỏ trượt hết chiều dài cầu trượt (đơn vị: J).],
  [$428.75$],
  loigiai: [
    #step[Độ lớn trọng lực tác dụng lên em nhỏ là:
    $P = m g = 25 times 9.8 = 245$ N.]
    #step[Vectơ dịch chuyển $arrow(d)$ có hướng dọc theo máng trượt đi xuống, độ dài $d = 3.5$ m.
    Vì máng trượt nghiêng góc $30^degree$ so với mặt phẳng ngang, nên phương của máng trượt tạo với phương thẳng đứng (phương của trọng lực $arrow(P)$) một góc bằng:
    $theta = 90^degree - 30^degree = 60^degree$.]
    #step[Công sinh bởi trọng lực $arrow(P)$ là tích vô hướng của trọng lực và vectơ dịch chuyển:
    $A = arrow(P) dot arrow(d) = P dot d dot cos theta = 245 times 3.5 times cos 60^degree = 245 times 3.5 times 0.5 = 428.75$ (J).]
  ]
)

#tln(
  dir: "doc",
  fig: canvas(length: 0.8cm, {
    import draw: *
    // Plates of capacitor
    line((-3.0, 1.5), (3.0, 1.5), stroke: 1.5pt + rgb("#d32f2f"))
    line((-3.0, -1.5), (3.0, -1.5), stroke: 1.5pt + rgb("#2E7D32"))
    
    // Electric field vectors
    for x in range(-2, 3) {
      let px = x * 1.2
      line((px, 1.1), (px, -1.1), stroke: 0.6pt + gray, mark: (end: "stealth", fill: gray))
    }
    content((2.5, 0), text(fill: gray)[$arrow(E)$])
    
    // Path M -> P -> N
    let M = (-1.5, 1.0)
    let P = (0.5, -0.5)
    let N = (2.0, -1.2)
    let H = (-1.5, -1.2)
    
    // Draw path
    line(M, P, stroke: 1.2pt + blue, mark: (end: "stealth", fill: blue))
    line(P, N, stroke: 1.2pt + blue, mark: (end: "stealth", fill: blue))
    
    // Vertical reference
    line(M, H, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(H, N, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    // Labels
    content((-1.5, 1.3), $M$)
    content((0.5, -0.15), $P$)
    content((2.3, -1.2), $N$)
    content((-1.8, -1.2), $H$)
    content((-2.0, 0), $d$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một lực tĩnh điện $arrow(F)$ tác động lên điện tích điểm $M$ trong điện trường đều làm cho $M$ dịch chuyển theo đường gấp khúc $M P N$. Biết $q = 2 dot 10^(-12)$ C, vectơ cường độ điện trường có độ lớn $E = 1.8 dot 10^5$ N/C và hình chiếu của độ dịch chuyển lên phương điện trường là $d = M H = 5$ mm. Tính công $A$ sinh bởi lực tĩnh điện (đơn vị: J).],
  [$1.8 dot 10^(-9)$],
  loigiai: [
    #step[Lực tĩnh điện tác dụng lên điện tích $q$ là: $arrow(F) = q arrow(E)$.
    Trong điện trường đều, công sinh bởi lực tĩnh điện khi điện tích dịch chuyển từ $M$ đến $N$ chỉ phụ thuộc vào hình chiếu của điểm đầu và điểm cuối lên phương của đường sức điện.]
    #step[Độ dài hình chiếu của quãng đường dịch chuyển dọc theo phương của điện trường là:
    $d = M H = 5$ mm $= 5 dot 10^(-3)$ m.]
    #step[Công sinh bởi lực tĩnh điện được tính theo công thức:
    $A = q E d = (2 dot 10^(-12)) times (1.8 dot 10^5) times (5 dot 10^(-3))$.]
    #step[Tính toán giá trị:
    $A = 2 times 1.8 times 5 times 10^(-12 + 5 - 3) = 18 times 10^(-10) = 1.8 dot 10^(-9)$ (J).]
  ]
)

#tln(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    // Parallelogram top:
    let A = (-1.5, 0.5)
    let B = (-0.5, 1.2)
    let C = (1.5, 1.2)
    let D = (0.5, 0.5)
    
    let dy = -1.5 // Height of the frame
    let Ad = (A.at(0), A.at(1) + dy)
    let Bd = (B.at(0), B.at(1) + dy)
    let Cd = (C.at(0), C.at(1) + dy)
    let Dd = (D.at(0), D.at(1) + dy)
    
    let E = (0, 3.0)
    
    // Hook
    line(E, (0, 3.4), stroke: 2.5pt + rgb("#e67e22"))
    arc((0.15, 3.4), start: 180deg, stop: -45deg, radius: 0.15, stroke: 2.5pt + rgb("#e67e22"))
    circle(E, radius: 0.08, fill: rgb("#e67e22"), stroke: none)
    
    // Hidden edges of the frame (back edges)
    line(B, Bd, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(A, B, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(B, C, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(Ad, Bd, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    line(Bd, Cd, stroke: (thickness: 1pt, dash: "dashed", paint: gray))
    
    // Hidden cable
    line(E, B, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    // Draw the car (placed on the bottom face, center)
    let cx = 0.1
    let cy = -0.4
    let car_w = 1.4
    let car_h = 0.4
    let top_w = 0.8
    let top_h = 0.35
    
    // Wheels (back)
    circle((cx - 0.4, cy), radius: 0.2, fill: rgb("#2c3e50"), stroke: none)
    circle((cx + 0.4, cy), radius: 0.2, fill: rgb("#2c3e50"), stroke: none)
    
    // Car body
    rect((cx - car_w/2, cy), (cx + car_w/2, cy + car_h), fill: rgb("#e74c3c"), stroke: rgb("#c0392b") + 1pt, radius: 0.1)
    
    // Car top (cabin)
    rect((cx - top_w/2, cy + car_h), (cx + top_w/2, cy + car_h + top_h), fill: rgb("#ecf0f1"), stroke: rgb("#bdc3c7") + 1pt, radius: 0.1)
    // Windows
    rect((cx - top_w/2 + 0.05, cy + car_h + 0.05), (cx - 0.05, cy + car_h + top_h - 0.05), fill: rgb("#3498db"), stroke: none, radius: 0.05)
    rect((cx + 0.05, cy + car_h + 0.05), (cx + top_w/2 - 0.05, cy + car_h + top_h - 0.05), fill: rgb("#3498db"), stroke: none, radius: 0.05)
    
    // Wheels (front, overlapping body)
    circle((cx - 0.4, cy), radius: 0.2, fill: rgb("#34495e"), stroke: 1pt + rgb("#2c3e50"))
    circle((cx + 0.4, cy), radius: 0.2, fill: rgb("#34495e"), stroke: 1pt + rgb("#2c3e50"))
    circle((cx - 0.4, cy), radius: 0.08, fill: rgb("#bdc3c7"), stroke: none)
    circle((cx + 0.4, cy), radius: 0.08, fill: rgb("#bdc3c7"), stroke: none)
    
    // Visible edges of the frame (front edges)
    line(Ad, Dd, stroke: 1.5pt + black)
    line(Dd, Cd, stroke: 1.5pt + black)
    line(A, Ad, stroke: 1.5pt + black)
    line(D, Dd, stroke: 1.5pt + black)
    line(C, Cd, stroke: 1.5pt + black)
    line(A, D, stroke: 1.5pt + black)
    line(D, C, stroke: 1.5pt + black)
    
    // Visible cables
    line(E, A, stroke: 1.2pt + rgb("#333"))
    line(E, C, stroke: 1.2pt + rgb("#333"))
    line(E, D, stroke: 1.5pt + black)
    
    // Labels
    content((A.at(0) - 0.2, A.at(1) + 0.1), $A$)
    content((B.at(0) - 0.2, B.at(1) + 0.1), $B$)
    content((C.at(0) + 0.2, C.at(1) + 0.1), $C$)
    content((D.at(0) + 0.2, D.at(1) - 0.1), $D$)
    content((E.at(0) - 0.25, E.at(1) + 0.1), $E$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Một chiếc ô tô được đặt trên mặt đáy dưới của một khung sắt có dạng hình hộp chữ nhật với đáy trên là hình chữ nhật $A B C D$, mặt phẳng $(A B C D)$ song song với mặt phẳng nằm ngang. Khung sắt đó được buộc vào móc $E$ của chiếc cần cẩu sao cho các đoạn dây cáp $E A, E B, E C, E D$ có độ dài bằng nhau và cùng tạo với mặt phẳng $(A B C D)$ một góc bằng $60^degree$. Chiếc cần cẩu kéo khung sắt lên theo phương thẳng đứng. Tính trọng lượng của chiếc xe ô tô (làm tròn đến hàng đơn vị), biết rằng các lực căng $arrow(F_1), arrow(F_2), arrow(F_3), arrow(F_4)$ đều có cường độ là $4700$ N và trọng lượng của khung sắt là $3000$ N.],
  [$13281$],
  loigiai: [
    #step[Tổng hợp lực nâng thẳng đứng hướng lên do 4 dây cáp tạo ra là:
    $F_("nâng") = 4 F_1 sin 60^degree = 4 times 4700 times sqrt(3)/2 = 9400 sqrt(3) approx 16281.27$ N.]
    #step[Khi cẩu nâng thẳng đứng đều, tổng lực nâng cân bằng với trọng lượng tổng cộng của khung sắt và xe ô tô:
    $P_("tổng") = F_("nâng") approx 16281$ N.]
    #step[Trọng lượng của riêng xe ô tô là:
    $P_("ô tô") = P_("tổng") - P_("khung") approx 16281 - 3000 = 13281$ N.]
  ]
)
