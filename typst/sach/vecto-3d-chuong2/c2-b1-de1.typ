#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 01 - VECTƠ TRONG KHÔNG GIAN]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (15 câu)], count: 15)

#q-wrap(dir: "doc", tn(
  [Cho tứ diện $A B C D$. Biểu thức vectơ nào sau đây luôn đúng?],
  (
    [$vec(A B) + vec(C D) + vec(B C) + vec(D A) = vec(A C)$],
    True([$vec(A B) + vec(C D) + vec(B C) + vec(D A) = vec(0)$]),
    [$vec(A B) + vec(C D) + vec(B C) + vec(D A) = 2vec(A C)$],
    [$vec(A B) + vec(C D) + vec(B C) + vec(D A) = vec(B D)$],
  ),
  
  loigiai: [
    #step[Sử dụng tính chất giao hoán và kết hợp của phép cộng vectơ, ta nhóm các vectơ như sau:
      $ T &= vec(A B) + vec(C D) + vec(B C) + vec(D A) \
         &= (vec(A B) + vec(B C)) + (vec(C D) + vec(D A)). $]
    #step[Áp dụng quy tắc ba điểm đối với từng nhóm:
      $ vec(A B) + vec(B C) &= vec(A C) \
        vec(C D) + vec(D A) &= vec(C A). $]
    #step[Cộng hai kết quả lại ta thu được:
      $ T = vec(A C) + vec(C A) = vec(0). $]
    #step[Minh họa hình học bằng đường đi khép kín $A -> B -> C -> D -> A$ trong không gian:
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          let A = (0, 1.8)
          let B = (-1.5, 0.3)
          let C = (1.5, 0.3)
          let D = (0, -0.6)
          
          // Hidden edges
          line(B, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
          
          // Solid edges
          line(A, B, stroke: 0.6pt + gray)
          line(A, C, stroke: 0.6pt + gray)
          line(A, D, stroke: 0.6pt + gray)
          line(B, D, stroke: 0.6pt + gray)
          line(C, D, stroke: 0.6pt + gray)
          
          // Path arrows
          line(A, B, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
          line(B, C, mark: (end: "stealth", scale: 0.5), stroke: (paint: rgb("#0d9488"), thickness: 1.5pt, dash: "dashed"))
          line(C, D, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#0d9488"))
          line(D, A, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
          
          // Vertices
          circle(A, radius: 0.03, fill: black)
          circle(B, radius: 0.03, fill: black)
          circle(C, radius: 0.03, fill: black)
          circle(D, radius: 0.03, fill: black)
          
          // Labels
          content((0, 2.05), $A$)
          content((-1.7, 0.3), $B$)
          content((1.7, 0.3), $C$)
          content((0, -0.85), $D$)
        })
      ]
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hình hộp $A B C D . A' B' C' D'$ (như hình vẽ bên dưới). Vectơ nào sau đây bằng vectơ $vec(B A) + vec(B C) + vec(B B')$?],
  (
    [$vec(B D)$],
    [$vec(B' D)$],
    True([$vec(B D')$]),
    [$vec(D B')$],
  ),
  fig: canvas(length: 0.9cm, {
    import draw: *
    let A = (0, 0.8)
    let B = (-1.5, 0)
    let C = (0.5, 0)
    let D = (2.0, 0.8)
    let Ap = (0, 2.3)
    let Bp = (-1.5, 1.5)
    let Cp = (0.5, 1.5)
    let Dp = (2.0, 2.3)
    
    // Hidden edges
    line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, Ap, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(B, Bp, stroke: 0.8pt + black)
    line(C, Cp, stroke: 0.8pt + black)
    line(D, Dp, stroke: 0.8pt + black)
    line(Ap, Bp, stroke: 0.8pt + black)
    line(Bp, Cp, stroke: 0.8pt + black)
    line(Cp, Dp, stroke: 0.8pt + black)
    line(Dp, Ap, stroke: 0.8pt + black)
    
    // Vector arrows
    line(B, A, mark: (end: "stealth", scale: 0.5), stroke: (paint: rgb("#b91c1c"), thickness: 1.5pt, dash: "dashed"))
    line(B, C, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    line(B, Bp, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    
    // Vertices
    for pt in (A, B, C, D, Ap, Bp, Cp, Dp) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    // Labels
    content((0.2, 0.6), $A$)
    content((-1.7, -0.1), $B$)
    content((0.5, -0.25), $C$)
    content((2.2, 0.8), $D$)
    content((-0.2, 2.5), $A'$)
    content((-1.7, 1.6), $B'$)
    content((0.5, 1.7), $C'$)
    content((2.2, 2.5), $D'$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Áp dụng quy tắc hình bình hành ở mặt đáy $A B C D$:
      $vec(B A) + vec(B C) = vec(B D)$.]
    #step[Thế vào biểu thức ban đầu ta được:
      $vec(B A) + vec(B C) + vec(B B') = vec(B D) + vec(B B')$.]
    #step[Áp dụng quy tắc hình bình hành cho mặt chéo $B D D' B'$ ta được vectơ đường chéo chính $vec(B D')$:
      #align(center)[
        #canvas(length: 0.9cm, {
          import draw: *
          let A = (0, 0.8)
          let B = (-1.5, 0)
          let C = (0.5, 0)
          let D = (2.0, 0.8)
          let Ap = (0, 2.3)
          let Bp = (-1.5, 1.5)
          let Cp = (0.5, 1.5)
          let Dp = (2.0, 2.3)
          
          // Hidden edges
          line(A, B, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
          line(A, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
          line(A, Ap, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
          line(B, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed")) // BD is inside the base, dashed!
          
          // Solid edges
          line(B, C, stroke: 0.6pt + gray)
          line(C, D, stroke: 0.6pt + gray)
          line(B, Bp, stroke: 0.6pt + gray)
          line(C, Cp, stroke: 0.6pt + gray)
          line(D, Dp, stroke: 0.6pt + gray)
          line(Ap, Bp, stroke: 0.6pt + gray)
          line(Bp, Cp, stroke: 0.6pt + gray)
          line(Cp, Dp, stroke: 0.6pt + gray)
          line(Dp, Ap, stroke: 0.6pt + gray)
          
          // Vectors
          line(B, A, mark: (end: "stealth", scale: 0.4), stroke: (paint: rgb("#b91c1c"), thickness: 1.2pt, dash: "dashed"))
          line(B, C, mark: (end: "stealth", scale: 0.4), stroke: 1.2pt + rgb("#b91c1c"))
          line(B, Bp, mark: (end: "stealth", scale: 0.4), stroke: 1.2pt + rgb("#b91c1c"))
          
          line(B, D, mark: (end: "stealth", scale: 0.4), stroke: (paint: rgb("#0d9488"), thickness: 1.2pt, dash: "dashed"))
          line(B, Dp, mark: (end: "stealth", scale: 0.6), stroke: (paint: rgb("#065f46"), thickness: 1.8pt, dash: "dashed"))
          
          // Vertices
          for pt in (A, B, C, D, Ap, Bp, Cp, Dp) {
            circle(pt, radius: 0.03, fill: black)
          }
          
          // Labels
          content((0.2, 0.6), $A$)
          content((-1.7, -0.1), $B$)
          content((0.5, -0.25), $C$)
          content((2.2, 0.8), $D$)
          content((-0.2, 2.5), $A'$)
          content((-1.7, 1.6), $B'$)
          content((0.5, 1.7), $C'$)
          content((2.2, 2.5), $D'$)
        })
      ]
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành (như hình vẽ bên dưới). Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$. Đẳng thức nào sau đây luôn đúng?],
  (
    [$vec(S A) + vec(S B) + vec(S C) + vec(S D) = vec(0)$],
    True([$vec(S A) + vec(S C) = vec(S B) + vec(S D)$]),
    [$vec(S A) + vec(S B) = vec(S C) + vec(S D)$],
    [$vec(S A) + vec(S D) = vec(S B) + vec(S C)$],
  ),
  fig: canvas(length: 0.9cm, {
    import draw: *
    let A = (0, 0.5)
    let B = (-1.4, -0.2)
    let C = (0.6, -0.2)
    let D = (2.0, 0.5)
    let S = (0.3, 2.0)
    let O = (0.3, 0.15)
    
    // Hidden edges
    line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(B, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(S, O, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(S, B, stroke: 0.8pt + black)
    line(S, C, stroke: 0.8pt + black)
    line(S, D, stroke: 0.8pt + black)
    
    // Vertices
    for pt in (A, B, C, D, S, O) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    // Labels
    content((0.2, 0.7), $A$)
    content((-1.6, -0.2), $B$)
    content((0.6, -0.45), $C$)
    content((2.2, 0.5), $D$)
    content((0.3, 2.2), $S$)
    content((0.3, -0.05), $O$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Vì $A B C D$ là hình bình hành nên giao điểm $O$ của hai đường chéo $A C$ và $B D$ là trung điểm của mỗi đường.
      Do đó: $O$ là trung điểm của cả $A C$ và $B D$.]
    #step[Áp dụng tính chất trung điểm đối với đoạn thẳng $A C$ và điểm $S$ bất kỳ, ta có:
      $ vec(S A) + vec(S C) = 2vec(S O). $]
    #step[Tương tự, áp dụng tính chất trung điểm đối với đoạn thẳng $B D$ và điểm $S$ bất kỳ, ta có:
      $ vec(S B) + vec(S D) = 2vec(S O). $]
    #step[Từ hai đẳng thức trên, ta đồng nhất vế và suy ra mối quan hệ:
      $ vec(S A) + vec(S C) = vec(S B) + vec(S D). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho ba vectơ không đồng phẳng $vec(a), vec(b), vec(c)$. Xét hai vectơ $vec(u) = 2vec(a) - vec(b) + 3vec(c)$ và $vec(v) = m vec(a) + vec(b) - vec(c)$. Tìm giá trị thực của $m$ để hai vectơ $vec(u), vec(v)$ cùng phương.],
  (
    [$m = 2$],
    [$m = -1$],
    [$m = 1$],
    True([Không tồn tại $m$]),
  ),
  
  loigiai: [
    #step[Để hai vectơ $vec(u)$ và $vec(v)$ cùng phương thì tồn tại số thực $k$ sao cho:
      $ vec(v) = k vec(u). $]
    #step[Thay biểu thức tọa độ phân tích theo cơ sở không đồng phẳng vào ta được:
      $ m vec(a) + vec(b) - vec(c) &= k(2vec(a) - vec(b) + 3vec(c)) \
                                   &= 2k vec(a) - k vec(b) + 3k vec(c). $]
    #step[Do $vec(a), vec(b), vec(c)$ là ba vectơ không đồng phẳng nên biểu diễn trên là duy nhất.
      Đồng nhất hệ số của từng vectơ thành phần ở hai vế, ta có hệ phương trình:
      $ cases(m = 2k, 1 = -k, -1 = 3k) <=> cases(k = -1, k = -1/3, m = 2k) quad "vô nghiệm". $]
    #step[Vì hệ phương trình vô nghiệm, nên không tồn tại giá trị nào của $m$ để hai vectơ cùng phương.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một thiết bị bay không người lái (drone) cất cánh từ mặt đất và chuyển động với vận tốc tổng hợp $vec(v) = vec(v)_1 + vec(v)_2 + vec(v)_3$, trong đó $vec(v)_1$ là vận tốc bay theo hướng đông có độ lớn $3 "m/s"$, $vec(v)_2$ là vận tốc bay theo hướng bắc có độ lớn $4 "m/s"$, và $vec(v)_3$ là vận tốc bay thẳng đứng lên trời có độ lớn $12 "m/s"$. Tìm độ lớn của vận tốc tổng hợp $vec(v)$ của drone.],
  (
    [$19 "m/s"$],
    True([$13 "m/s"$]),
    [$15 "m/s"$],
    [$17 "m/s"$],
  ),
  fig: canvas(length: 0.9cm, {
    import draw: *
    let O = (0, 0)
    let P1 = (1.2, 0)
    let P2 = (0.5, 0.4)
    let P12 = (1.7, 0.4)
    let P3 = (0, 1.8)
    let P13 = (1.2, 1.8)
    let P23 = (0.5, 2.2)
    let P123 = (1.7, 2.2)
    
    // Hidden edges of the box
    line(O, P2, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(P2, P12, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(P2, P23, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges of the box
    line(O, P1, stroke: 0.5pt + gray)
    line(O, P3, stroke: 0.5pt + gray)
    line(P1, P12, stroke: 0.5pt + gray)
    line(P1, P13, stroke: 0.5pt + gray)
    line(P3, P13, stroke: 0.5pt + gray)
    line(P3, P23, stroke: 0.5pt + gray)
    line(P12, P123, stroke: 0.5pt + gray)
    line(P13, P123, stroke: 0.5pt + gray)
    line(P23, P123, stroke: 0.5pt + gray)
    
    // Component vectors
    line(O, P1, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488")) // east
    line(O, P2, mark: (end: "stealth", scale: 0.5), stroke: (paint: rgb("#0d9488"), thickness: 1.2pt, dash: "dashed")) // north
    line(O, P3, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488")) // up
    
    // Resultant vector
    line(O, P123, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.8, 1.2), $vec(v)$)
    
    circle(O, radius: 0.03, fill: black)
    circle(P123, radius: 0.04, fill: rgb("#3b82f6")) // drone point
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Do ba hướng Đông, Bắc và thẳng đứng lên trời đôi một vuông góc với nhau, nên các vectơ vận tốc thành phần $vec(v)_1$, $vec(v)_2$, $vec(v)_3$ đôi một vuông góc.]
    #step[Áp dụng quy tắc hình hộp cho các vectơ vuông góc, độ lớn của vectơ vận tốc tổng hợp $vec(v)$ được tính bởi:
      $ |vec(v)| = sqrt(|vec(v)_1|^2 + |vec(v)_2|^2 + |vec(v)_3|^2) $]
    #step[Thay số vào công thức ta được:
      $ |vec(v)| &= sqrt(3^2 + 4^2 + 12^2) \
                &= sqrt(9 + 16 + 144) \
                &= sqrt(169) = 13 "m/s". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một chiếc đèn trang trí có trọng lượng $P = 30 "N"$ được treo cân bằng bởi ba sợi dây cáp có cùng độ dài (như hình vẽ bên dưới). Ba sợi dây cáp này được gắn vào trần nhà tại ba điểm tạo thành một tam giác đều và đối xứng nhau qua trục thẳng đứng đi qua đèn. Biết rằng góc giữa mỗi sợi dây cáp và phương thẳng đứng là $60°$. Độ lớn lực căng của mỗi sợi dây cáp bằng:],
  (
    [$10 "N"$],
    [$15 "N"$],
    True([$20 "N"$]),
    [$30 "N"$],
  ),
  fig: canvas(length: 1.1cm, {
    import draw: *
    // Ceiling plane corners
    let C_A = (-1.5, 1.8)
    let C_B = (1.5, 1.8)
    let C_C = (2.3, 2.5)
    let C_D = (-0.7, 2.5)
    line(C_A, C_B, C_C, C_D, close: true, fill: rgb("#f8fafc"), stroke: 0.6pt + gray)
    
    // Ceiling hanging points (equilateral triangle)
    let P1 = (-0.5, 2.0)
    let P2 = (0.5, 2.0)
    let P3 = (0, 2.3)
    
    // Lamp coordinates
    let L = (0, 0.4)
    
    // Cables
    line(P1, L, stroke: 1pt + black)
    line(P2, L, stroke: 1pt + black)
    line(P3, L, stroke: (paint: gray, thickness: 1pt, dash: "dashed")) // back cable
    
    // Gravity force arrow
    line(L, (0, -0.6), mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.3, -0.4), $vec(P)$)
    
    // Tension arrows
    line(L, (-0.25, 1.2), mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(L, (0.25, 1.2), mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    
    // Vertices
    circle(P1, radius: 0.03, fill: black)
    circle(P2, radius: 0.03, fill: black)
    circle(P3, radius: 0.03, fill: black)
    circle(L, radius: 0.05, fill: rgb("#b45309")) // lamp ball
    
    // Labels
    content((0, 0.1), [Đèn])
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Gọi ba lực căng của các sợi dây cáp lần lượt là $vec(T)_1, vec(T)_2, vec(T)_3$ và trọng lực tác dụng lên đèn là $vec(P)$.]
    #step[Khi đèn ở trạng thái cân bằng, ta có hệ thức lực:
      $ vect(T)_1 + vect(T)_2 + vec(T)_3 + vec(P) = vec(0) \
        <=> vec(T)_1 + vec(T)_2 + vec(T)_3 = -vec(P). $]
    #step[Do tính chất đối xứng của ba sợi cáp treo, độ lớn của lực căng trên mỗi sợi dây là bằng nhau:
      $ T_1 = T_2 = T_3 = T. $]
    #step[Chiếu hệ thức cân bằng lên trục thẳng đứng (trục đối xứng hướng thẳng đứng lên trên):
      $ T_1 cos(60°) + T_2 cos(60°) + T_3 cos(60°) = P \
        <=> 3 T cos(60°) = P. $]
    #step[Thay số với $P = 30 "N"$ và $cos(60°) = 0.5$, ta tìm được:
      $ 3 T dot 0.5 = 30 <=> 1.5 T = 30 <=> T = 20 "N". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một chiếc máy ảnh có trọng lượng $P = 45 "N"$ được đặt trên một chân máy ảnh (tripod) gồm ba chân có chiều dài bằng nhau đặt trên mặt sàn nằm ngang. Ba chân máy tiếp xúc với mặt đất tại ba điểm tạo thành một tam giác đều và đối xứng qua phương thẳng đứng đi qua máy ảnh. Biết góc hợp bởi mỗi chân máy với phương thẳng đứng là $30°$. Lực nén dọc theo mỗi chân máy ảnh bằng:],
  (
    [$15 "N"$],
    [$15 sqrt(3) "N"$],
    True([$10 sqrt(3) "N"$]),
    [$30 "N"$],
  ),
  fig: canvas(length: 1.1cm, {
    import draw: *
    // Ground plane
    line((-1.5, 0), (1.5, 0), stroke: 1.5pt + gray)
    
    // Tripod head
    let H = (0, 1.8)
    
    // Feet
    let F1 = (-0.8, 0)
    let F2 = (0.8, 0)
    let F3 = (0, 0.3) // perspective depth foot
    
    // Legs
    line(F1, H, stroke: 1.2pt + black)
    line(F2, H, stroke: 1.2pt + black)
    line(F3, H, stroke: (paint: gray, thickness: 1pt, dash: "dashed"))
    
    // Camera box
    rect((-0.3, 1.8), (0.3, 2.2), fill: rgb("#e2e8f0"), stroke: 1pt + black)
    content((0, 2.0), [Cam])
    
    // Gravity force arrow
    line(H, (0, 0.8), mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.3, 1.0), $vec(P)$)
    
    // Vertices
    circle(F1, radius: 0.03, fill: black)
    circle(F2, radius: 0.03, fill: black)
    circle(H, radius: 0.04, fill: black)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Gọi phản lực từ ba chân máy tác dụng lên máy ảnh lần lượt là $vec(F)_1, vec(F)_2, vec(F)_3$.]
    #step[Theo định luật III Newton, độ lớn của các phản lực này bằng độ lớn lực nén dọc theo mỗi chân máy:
      $ F_1 = F_2 = F_3 = N. $]
    #step[Khi máy ảnh ở trạng thái cân bằng lực, ta có phương trình:
      $ vec(F)_1 + vec(F)_2 + vec(F)_3 + vec(P) = vec(0) \
        <=> vec(F)_1 + vec(F)_2 + vec(F)_3 = -vec(P). $]
    #step[Chiếu phương trình vectơ lên phương thẳng đứng hướng lên trên:
      $ F_1 cos(30°) + F_2 cos(30°) + F_3 cos(30°) = P \
        <=> 3 N cos(30°) = P. $]
    #step[Thay số $P = 45 "N"$ và $cos(30°) = sqrt(3)/2$ vào ta được:
      $ 3 N dot sqrt(3)/2 = 45 \
        <=> N = 45 dot 2 / (3sqrt(3)) = 10 sqrt(3) "N". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một chiếc trực thăng xuất phát từ sân bay có tọa độ gốc $O(0; 0; 0)$ bay thẳng theo hướng Đông $6 "km"$, sau đó chuyển hướng bay thẳng về phía Nam $8 "km"$, rồi bay thẳng đứng hướng lên trời $24 "km"$. Khoảng cách từ trực thăng đến sân bay $O$ lúc này bằng:],
  (
    [$38 "km"$],
    True([$26 "km"$]),
    [$30 "km"$],
    [$28 "km"$],
  ),
  fig: canvas(length: 0.9cm, {
    import draw: *
    let O = (0, 0)
    let P1 = (1.2, 0) // East
    let P2 = (0.7, -0.4) // East then South
    let P3 = (0.7, 1.8) // East then South then Up
    
    // Auxiliary box points to give it a 3D feel
    let P_south = (-0.5, -0.4)
    let P_up = (0, 2.2)
    let P_su = (-0.5, 1.8)
    let P_eu = (1.2, 2.2)
    
    // Hidden edges of the box
    line(O, P_south, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(P_south, P2, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(P_south, P_su, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges of the box
    line(O, P1, stroke: 0.5pt + gray)
    line(O, P_up, stroke: 0.5pt + gray)
    line(P1, P2, stroke: 0.5pt + gray)
    line(P1, P_eu, stroke: 0.5pt + gray)
    line(P_up, P_eu, stroke: 0.5pt + gray)
    line(P_up, P_su, stroke: 0.5pt + gray)
    line(P2, P3, stroke: 0.5pt + gray)
    line(P_eu, P3, stroke: 0.5pt + gray)
    line(P_su, P3, stroke: 0.5pt + gray)
    
    // Trajectory vectors
    line(O, P1, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(P1, P2, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(P2, P3, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    
    // Resultant vector
    line(O, P3, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.2, 1.0), $vec(s)$)
    
    circle(O, radius: 0.03, fill: black)
    circle(P3, radius: 0.04, fill: rgb("#3b82f6")) // heli point
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Chọn hệ trục tọa độ $O x y z$ có gốc tọa độ $O$ trùng với vị trí sân bay ban đầu.]
    #step[Trục $O x$ hướng về phía Đông, trục $O y$ hướng về phía Bắc (do đó hướng Nam ngược hướng trục $O y$) và trục $O z$ hướng thẳng đứng lên trời.]
    #step[Từ mô tả chuyển động, ta xác định được tọa độ vị trí của trực thăng sau khi bay là:
      $ A(6; -8; 24). $]
    #step[Khoảng cách từ trực thăng đến sân bay chính là độ dài của vectơ vị trí $vec(O A) = (6; -8; 24)$:
      $ O A = |vec(O A)| &= sqrt(6^2 + (-8)^2 + 24^2) \
                        &= sqrt(36 + 64 + 576) \
                        &= sqrt(676) = 26 "km". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một khinh khí cầu chịu lực nâng thẳng đứng hướng lên có độ lớn $900 "N"$. Để giữ khinh khí cầu đứng yên, người ta neo nó xuống đất bằng ba sợi dây cáp có cùng độ dài. Ba điểm gắn dây trên mặt đất tạo thành tam giác đều và đối xứng nhau qua trục thẳng đứng đi qua khinh khí cầu. Biết góc giữa mỗi sợi dây cáp và phương thẳng đứng bằng $60°$. Độ lớn lực căng của mỗi sợi dây cáp bằng:],
  (
    [$300 "N"$],
    [$450 "N"$],
    True([$600 "N"$]),
    [$900 "N"$],
  ),
  fig: canvas(length: 1.1cm, {
    import draw: *
    // Ground plane (equilateral triangle in perspective)
    let P1 = (-0.8, -0.2)
    let P2 = (0.8, -0.2)
    let P3 = (0, 0.3)
    
    // Balloon center
    let B = (0, 1.8)
    
    // Cables
    line(P1, B, stroke: 1pt + black)
    line(P2, B, stroke: 1pt + black)
    line(P3, B, stroke: (paint: gray, thickness: 1pt, dash: "dashed")) // back cable
    
    // Buoyancy force vector
    line(B, (0, 2.7), mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#055f46"))
    content((0.4, 2.5), $vec(F)_k$)
    
    // Vertices on ground
    circle(P1, radius: 0.03, fill: black)
    circle(P2, radius: 0.03, fill: black)
    circle(P3, radius: 0.03, fill: black)
    
    // Balloon shape (balloon + basket)
    circle(B, radius: 0.3, fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"))
    rect((-0.08, 1.3), (0.08, 1.45), fill: rgb("#d97706"), stroke: 0.5pt + black) // basket
    line((-0.08, 1.45), (-0.15, 1.6), stroke: 0.5pt + black)
    line((0.08, 1.45), (0.15, 1.6), stroke: 0.5pt + black)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Gọi ba lực căng của các sợi dây cáp lần lượt là $vec(T)_1, vec(T)_2, vec(T)_3$ và lực nâng thẳng đứng là $vec(F)_k$.]
    #step[Khi khinh khí cầu ở trạng thái cân bằng lực, ta có phương trình:
      $ vec(T)_1 + vec(T)_2 + vec(T)_3 + vec(F)_k = vec(0) \
        <=> vec(T)_1 + vec(T)_2 + vec(T)_3 = -vec(F)_k. $]
    #step[Do tính đối xứng của hệ thống ba sợi dây cáp neo, độ lớn lực căng của mỗi sợi dây cáp là như nhau:
      $ T_1 = T_2 = T_3 = T. $]
    #step[Chiếu phương trình vectơ lên phương thẳng đứng (hướng lên trên):
      $ -T_1 cos(60°) - T_2 cos(60°) - T_3 cos(60°) + F_k = 0 \
        <=> 3 T cos(60°) = F_k. $]
    #step[Thay số $F_k = 900 "N"$ và $cos(60°) = 0.5$ vào ta được:
      $ 3 T dot 0.5 = 900 \
        <=> 1.5 T = 900 \
        <=> T = 600 "N". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một khối đá có trọng lượng $P = 300 "N"$ được nâng lên khỏi mặt đất nhờ ba sợi dây xích chụm lại tại một móc treo. Ba sợi xích có cùng chiều dài, đối xứng nhau qua phương thẳng đứng và mỗi sợi xích tạo với phương thẳng đứng góc $60°$. Độ lớn lực căng tối thiểu của mỗi sợi xích để có thể nâng được khối đá lên bằng:],
  (
    [$100 "N"$],
    True([$200 "N"$]),
    [$150 "N"$],
    [$300 "N"$],
  ),
  fig: canvas(length: 1.1cm, {
    import draw: *
    // Stone block box at the bottom
    rect((-0.6, 0), (0.6, 0.4), fill: rgb("#e2e8f0"), stroke: 1pt + black)
    content((0, 0.2), [Đá])
    
    // Connection points on the block
    let A1 = (-0.4, 0.4)
    let A2 = (0.4, 0.4)
    let A3 = (0, 0.5) // perspective back point
    
    // Hanging hook
    let H = (0, 1.8)
    
    // Chains
    line(A1, H, stroke: 1pt + black)
    line(A2, H, stroke: 1pt + black)
    line(A3, H, stroke: (paint: gray, thickness: 1pt, dash: "dashed"))
    
    // Gravity force vector from block center
    line((0, 0.2), (0, -0.6), mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.3, -0.3), $vec(P)$)
    
    // Vertices
    circle(A1, radius: 0.03, fill: black)
    circle(A2, radius: 0.03, fill: black)
    circle(H, radius: 0.04, fill: black)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Gọi ba lực căng do ba sợi xích tác dụng lên móc treo là $vec(T)_1, vec(T)_2, vec(T)_3$ và trọng lực tác dụng lên khối đá là $vec(P)$.]
    #step[Để bắt đầu nâng được khối đá lên khỏi mặt đất, tổng lực kéo theo phương thẳng đứng hướng lên từ ba sợi xích phải lớn hơn hoặc bằng trọng lượng khối đá:]
    #step[Chiếu điều kiện cân bằng giới hạn lên phương thẳng đứng:
      $ T_1 cos(60°) + T_2 cos(60°) + T_3 cos(60°) = P \
        <=> 3 T cos(60°) = P. $]
    #step[Thay số $P = 300 "N"$ và $cos(60°) = 0.5$, ta có lực căng tối thiểu trên mỗi sợi xích:
      $ 3 T dot 0.5 = 300 \
        <=> 1.5 T = 300 \
        <=> T = 200 "N". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho tứ diện $A B C D$. Trên hai cạnh $A B$ và $C D$ lần lượt lấy hai điểm $M$ và $N$ sao cho $vec(A M) = 1/3 vec(A B)$ và $vec(D N) = k vec(D C)$. Tìm giá trị của tham số $k$ để ba vectơ $vec(M N), vec(A D), vec(B C)$ đồng phẳng.],
  (
    [$k = 1/2$],
    [$k = 2/3$],
    True([$k = 1/3$]),
    [$k = 1/4$],
  ),
  loigiai: [
    #step[Biểu diễn vectơ $vec(M N)$ thông qua các vectơ cạnh của tứ diện:
      $ vec(M N) &= vec(M A) + vec(A D) + vec(D N) \
                &= -1/3 vec(A B) + vec(A D) + k vec(D C). $]
    #step[Sử dụng quy tắc chèn điểm đối với $vec(D C)$:
      $ vec(D C) = vec(D A) + vec(A B) + vec(B C) = vec(A B) - vec(A D) + vec(B C). $]
    #step[Thế biểu thức $vec(D C)$ vào công thức $vec(M N)$:
      $ vec(M N) &= -1/3 vec(A B) + vec(A D) + k (vec(A B) - vec(A D) + vec(B C)) \
                &= (k - 1/3) vec(A B) + (1 - k) vec(A D) + k vec(B C). $]
    #step[Để ba vectơ $vec(M N), vec(A D), vec(B C)$ đồng phẳng, thì vectơ $vec(M N)$ phải phân tích được dưới dạng tổ hợp tuyến tính của $vec(A D)$ và $vec(B C)$ (tức là không chứa thành phần $vec(A B)$).
      Điều này xảy ra khi và chỉ khi hệ số của $vec(A B)$ bằng $0$:
      $ k - 1/3 = 0 <=> k = 1/3. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho tứ diện đều $A B C D$ có tất cả các cạnh bằng $a$. Gọi $G$ là trọng tâm của tứ diện $A B C D$. Tập hợp các điểm $M$ trong không gian thỏa mãn đẳng thức $|vec(M A) + vec(M B) + vec(M C) + vec(M D)| = a$ là:],
  (
    [Mặt cầu tâm $G$ bán kính $R = a$],
    [Mặt cầu tâm $G$ bán kính $R = a/2$],
    True([Mặt cầu tâm $G$ bán kính $R = a/4$]),
    [Mặt phẳng trung trực của đoạn thẳng $A B$],
  ),
  loigiai: [
    #step[Vì $G$ là trọng tâm của tứ diện $A B C D$, theo tính chất trọng tâm ta luôn có đẳng thức vectơ:
      $ vec(G A) + vec(G B) + vec(G C) + vec(G D) = vec(0). $]
    #step[Sử dụng quy tắc chèn điểm $G$ vào vế trái của đẳng thức đề bài:
      $ vec(M A) + vec(M B) + vec(M C) + vec(M D) &= (vec(M G) + vec(G A)) + (vec(M G) + vec(G B)) + (vec(M G) + vec(G C)) + (vec(M G) + vec(G D)) \
                                                &= 4 vec(M G) + (vec(G A) + vec(G B) + vec(G C) + vec(G D)) \
                                                &= 4 vec(M G). $]
    #step[Thay vào đẳng thức mô tả tập hợp điểm:
      $ |4 vec(M G)| = a <=> 4 M G = a <=> M G = a/4. $]
    #step[Do điểm $G$ cố định và $a$ không đổi, tập hợp các điểm $M$ thỏa mãn khoảng cách $M G = a/4$ là mặt cầu tâm $G$ bán kính $R = a/4$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hình chóp $S. A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $M$ là trọng tâm của tam giác $S C D$. Biểu diễn vectơ $vec(A M)$ theo ba vectơ $vec(A B) = vec(a)$, $vec(A D) = vec(b)$ and $vec(A S) = vec(c)$ ta thu được kết quả là:],
  (
    [$1/3 vec(a) + 1/3 vec(b) + 1/3 vec(c)$],
    True([$1/3 vec(a) + 2/3 vec(b) + 1/3 vec(c)$]),
    [$2/3 vec(a) + 1/3 vec(b) + 1/3 vec(c)$],
    [$1/3 vec(a) + 2/3 vec(b) - 1/3 vec(c)$],
  ),
  loigiai: [
    #step[Vì $M$ là trọng tâm của tam giác $S C D$, ta có hệ thức vectơ:
      $ vec(A M) = 1/3 (vec(A S) + vec(A C) + vec(A D)). $]
    #step[Vì $A B C D$ là hình bình hành nên vectơ đường chéo $vec(A C)$ được phân tích theo quy tắc hình bình hành:
      $ vec(A C) = vec(A B) + vec(A D) = vec(a) + vec(b). $]
    #step[Thế biểu thức $vec(A C)$ vào biểu thức $vec(A M)$:
      $ vec(A M) = 1/3 (vec(c) + vec(a) + vec(b) + vec(b)) = 1/3 vec(a) + 2/3 vec(b) + 1/3 vec(c). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một vật nặng có trọng lượng $P = 60 sqrt(2) "N"$ được treo cân bằng trên trần nhà nhờ ba sợi dây cáp đối xứng $S A, S B, S C$ chung đỉnh $S$. Các sợi dây này tạo với phương thẳng đứng đi qua $S$ các góc bằng nhau và bằng $45°$. Lực căng $T$ của mỗi sợi dây cáp bằng:],
  (
    [$20 "N"$],
    [$30 "N"$],
    True([$40 "N"$]),
    [$60 "N"$],
  ),
  loigiai: [
    #step[Gọi ba lực căng của ba sợi dây là $vec(T)_1, vec(T)_2, vec(T)_3$. Vì ba sợi dây cáp đối xứng nhau qua trục thẳng đứng đi qua $S$, nên độ lớn lực căng của ba dây bằng nhau và bằng $T$.]
    #step[Hợp lực của ba lực căng hướng thẳng đứng lên trên để cân bằng với trọng lực $vec(P)$ của vật (hướng xuống).
      Hình chiếu của mỗi lực căng lên phương thẳng đứng bằng $T dot cos(45°)$.]
    #step[Để vật ở trạng thái cân bằng, ta có phương trình hình chiếu lực lên phương thẳng đứng:
      $ 3 T dot cos(45°) = P => 3 T dot sqrt(2)/2 = 60 sqrt(2) => 3/2 T = 60 => T = 40 "N". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho bốn điểm $A, B, C, D$ không đồng phẳng trong không gian. Gọi $I, J$ lần lượt là trung điểm của $A D$ và $B C$. Gọi $G$ là trung điểm của đoạn thẳng $I J$. Mệnh đề nào sau đây luôn đúng?],
  (
    [$vec(G A) + vec(G B) + vec(G C) + vec(G D) = 2 vec(I J)$],
    True([$vec(G A) + vec(G B) + vec(G C) + vec(G D) = vec(0)$]),
    [$vec(G A) + vec(G D) = vec(G B) + vec(G C)$],
    [$vec(G A) + vec(G B) + vec(G C) + vec(G D) = 4 vec(I J)$],
  ),
  loigiai: [
    #step[Vì $I$ là trung điểm của $A D$, theo tính chất trung điểm ta có:
      $ vec(G A) + vec(G D) = 2 vec(G I). $]
    #step[Vì $J$ là trung điểm của $B C$, theo tính chất trung điểm ta có:
      $ vec(G B) + vec(G C) = 2 vec(G J). $]
    #step[Cộng hai đẳng thức trên vế theo vế:
      $ vec(G A) + vec(G B) + vec(G C) + vec(G D) = 2(vec(G I) + vec(G J)). $]
    #step[Vì $G$ là trung điểm của đoạn thẳng $I J$ nên ta có $vec(G I) + vec(G J) = vec(0)$.
      Do đó: $vec(G A) + vec(G B) + vec(G C) + vec(G D) = vec(0)$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (10 câu)], count: 10)

#q-wrap(dir: "ngang", ds(
  [Cho hình hộp $A B C D . A' B' C' D'$ (như hình vẽ bên dưới). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Ba vectơ $vec(A B), vec(A D), vec(A A')$ không đồng phẳng.]),
    [Ba vectơ $vec(A B), vec(A D), vec(C' D')$ đồng phẳng.],
    True([$vec(A C') = vec(A B) + vec(A D) + vec(A A')$.]),
    True([$vec(A B) + vec(A' D') + vec(C C') = vec(A C')$.]),
  ),
  fig: canvas(length: 0.9cm, {
    import draw: *
    let A = (0, 0.8)
    let B = (-1.5, 0)
    let C = (0.5, 0)
    let D = (2.0, 0.8)
    let Ap = (0, 2.3)
    let Bp = (-1.5, 1.5)
    let Cp = (0.5, 1.5)
    let Dp = (2.0, 2.3)
    
    // Hidden edges
    line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, Ap, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(B, Bp, stroke: 0.8pt + black)
    line(C, Cp, stroke: 0.8pt + black)
    line(D, Dp, stroke: 0.8pt + black)
    line(Ap, Bp, stroke: 0.8pt + black)
    line(Bp, Cp, stroke: 0.8pt + black)
    line(Cp, Dp, stroke: 0.8pt + black)
    line(Dp, Ap, stroke: 0.8pt + black)
    
    // Vertices
    for pt in (A, B, C, D, Ap, Bp, Cp, Dp) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    // Labels
    content((0.2, 0.6), $A$)
    content((-1.7, -0.1), $B$)
    content((0.5, -0.25), $C$)
    content((2.2, 0.8), $D$)
    content((-0.2, 2.5), $A'$)
    content((-1.7, 1.6), $B'$)
    content((0.5, 1.7), $C'$)
    content((2.2, 2.5), $D'$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Do ba vectơ $vec(A B), vec(A D), vec(A A')$ xuất phát từ cùng một đỉnh $A$ và không cùng nằm trên bất kỳ mặt phẳng nào, nên chúng không đồng phẳng.]
    #step[b) Sai. Ta có:
      $ vec(C' D') = vec(C D) = -vec(A B). $
      Vì giá của ba vectơ $vec(A B), vec(A D), vec(C' D')$ cùng song song hoặc nằm trên mặt phẳng đáy $(A B C D)$, nên chúng đồng phẳng.]
    #step[c) Đúng. Đây chính là quy tắc hình hộp dùng để biểu diễn vectơ đường chéo của hình hộp:
      $ vec(A C') = vec(A B) + vec(A D) + vec(A A'). $]
    #step[d) Đúng. Do:
      $ cases(vec(A' D') = vec(A D), vec(C C') = vec(A A')) $
      Thế vào vế trái ta có:
      $ vec(A B) + vec(A' D') + vec(C C') = vec(A B) + vec(A D) + vec(A A') = vec(A C'). $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho tứ diện $A B C D$ (như hình vẽ bên dưới). Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $C D$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([$vec(M N) = 1/2(vec(A D) + vec(B C))$.]),
    [Ba vectơ $vec(B C), vec(B D), vec(M N)$ đồng phẳng.],
    True([$vec(M N) = 1/2(vec(A C) + vec(B D))$.]),
    [Điểm $I$ là trung điểm của $M N$ thì $vec(I A) + vec(I B) + vec(I C) + vec(I D) = 2vec(M N)$.],
  ),
  fig: canvas(length: 1cm, {
    import draw: *
    let A = (0, 1.8)
    let B = (-1.5, 0.3)
    let C = (1.5, 0.3)
    let D = (0, -0.6)
    
    let M = (-0.75, 1.05)
    let N = (0.75, -0.15)
    
    // Hidden edges
    line(B, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(A, B, stroke: 0.8pt + black)
    line(A, C, stroke: 0.8pt + black)
    line(A, D, stroke: 0.8pt + black)
    line(B, D, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    
    // Midpoint connector MN
    line(M, N, stroke: (paint: rgb("#b91c1c"), thickness: 1.2pt, dash: "dashed"))
    
    // Vertices and midpoints
    for pt in (A, B, C, D) {
      circle(pt, radius: 0.03, fill: black)
    }
    circle(M, radius: 0.04, fill: rgb("#b91c1c"))
    circle(N, radius: 0.04, fill: rgb("#b91c1c"))
    
    // Labels
    content((0, 2.05), $A$)
    content((-1.7, 0.3), $B$)
    content((1.7, 0.3), $C$)
    content((0, -0.85), $D$)
    content((-1.0, 1.15), $M$)
    content((0.95, -0.25), $N$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Ta tách vectơ $vec(M N)$ theo hai đường đi khác nhau:
      $ vec(M N) &= vec(M A) + vec(A D) + vec(D N) \
        vec(M N) &= vec(M B) + vec(B C) + vec(C N) $]
    #step[Cộng từng vế hai đẳng thức trên ta thu được:
      $ 2vec(M N) = (vec(M A) + vec(M B)) + (vec(A D) + vec(B C)) + (vec(D N) + vec(C N)) $]
    #step[Vì $M, N$ lần lượt là trung điểm của $A B, C D$ nên ta có:
      $ vec(M A) + vec(M B) = vec(0) quad "và" quad vec(D N) + vec(C N) = vec(0) $
      Suy ra:
      $ 2vec(M N) = vec(A D) + vec(B C) <=> vec(M N) = 1/2(vec(A D) + vec(B C)). $]
    #step[b) Sai. Các giá của ba vectơ $vec(B C)$, $vec(B D)$, $vec(M N)$ không cùng song song với bất kỳ mặt phẳng nào (vì đường thẳng $M N$ đi qua trung điểm của hai cạnh chéo nhau $A B$ và $C D$, không song song với đáy $(B C D)$), nên ba vectơ này không đồng phẳng.]
    #step[c) Đúng. Tương tự như câu a, ta tách theo đường đi qua $C$ và $D$:
      $ vec(M N) &= vec(M A) + vec(A C) + vec(C N) \
        vec(M N) &= vec(M B) + vec(B D) + vec(D N) $
      Cộng từng vế suy ra $vec(M N) = 1/2(vec(A C) + vec(B D))$.]
    #step[d) Sai. Vì $I$ là trung điểm của đoạn thẳng $M N$ nên ta có:
      $ vec(I M) + vec(I N) = vec(0). $
      Ta biến đổi biểu thức:
      $ vec(I A) + vec(I B) + vec(I C) + vec(I D) &= (vec(I A) + vec(I B)) + (vec(I C) + vec(I D)) \
                                                &= 2vec(I M) + 2vec(I N) \
                                                &= 2(vec(I M) + vec(I N)) = vec(0). $]
  ],
))

#q-wrap(dir: "doc", ds(
  [Một quả bóng được sút từ mặt đất có điểm xuất phát là gốc tọa độ $O(0;0;0)$. Chuyển động của quả bóng được mô tả bởi vectơ vận tốc $vec(v) = (5; 8; 4)$ (đơn vị: $"m/s"$), trong đó trục $O x$ hướng về phía Đông, trục $O y$ hướng về phía Bắc và trục $O z$ thẳng đứng lên trên. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Độ lớn của vectơ vận tốc theo phương ngang của quả bóng bằng $sqrt(89) "m/s"$.]),
    True([Vận tốc bay hướng thẳng đứng lên cao của quả bóng là $4 "m/s"$.]),
    [Độ lớn vận tốc tổng hợp của quả bóng bằng $3sqrt(15) "m/s"$.],
    True([Nếu quả bóng giữ nguyên vận tốc không đổi thì sau $2$ giây quả bóng đạt độ cao $8 "m"$ so với mặt đất.]),
  ),
  fig: canvas(length: 0.9cm, {
    import draw: *
    let O = (0, 0)
    let P_h = (1.5, 0.4) // Horizontal projection endpoint
    let P_v = (0, 1.5) // Vertical component endpoint
    let P_tot = (1.5, 1.9) // Total velocity vector endpoint
    
    // Shaded base representation for horizontal plane (without axes)
    line((-0.5, -0.2), (1.8, -0.2), (2.3, 0.8), (0.0, 0.8), close: true, fill: rgb("#f8fafc"), stroke: 0.4pt + gray)
    
    // Horizontal component vector
    line(O, P_h, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    content((0.9, 0.05), $vec(v)_h$)
    
    // Vertical component vector
    line(O, P_v, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    content((-0.3, 0.8), $vec(v)_z$)
    
    // Auxiliary dashed lines
    line(P_h, P_tot, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(P_v, P_tot, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Total velocity vector
    line(O, P_tot, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.7, 1.1), $vec(v)$)
    
    circle(O, radius: 0.03, fill: black)
    circle(P_tot, radius: 0.04, fill: rgb("#3b82f6")) // ball point
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Vectơ vận tốc theo phương ngang của quả bóng là hình chiếu của vectơ $vec(v)$ lên mặt phẳng nằm ngang $O x y$, có tọa độ là:
      $ vec(v)_h = (5; 8; 0). $
      Độ lớn của vận tốc theo phương ngang là:
      $ |vec(v)_h| = sqrt(5^2 + 8^2) = sqrt(25 + 64) = sqrt(89) "m/s". $]
    #step[b) Đúng. Thành phần vận tốc thẳng đứng lên cao tương ứng với cao độ (tọa độ thứ ba) của vectơ vận tốc $vec(v) = (5; 8; 4)$, tức là $4 "m/s"$.]
    #step[c) Sai. Độ lớn vận tốc tổng hợp của quả bóng là độ dài của vectơ vận tốc $vec(v)$:
      $ |vec(v)| &= sqrt(5^2 + 8^2 + 4^2) \
                &= sqrt(25 + 64 + 16) = sqrt(105) "m/s". $
      Vì $3sqrt(15) = sqrt(135) != sqrt(105)$ nên mệnh đề sai.]
    #step[d) Đúng. Do vận tốc theo phương thẳng đứng là $v_z = 4 "m/s"$, sau $2$ giây chuyển động không đổi vận tốc, độ cao đạt được là:
      $ h = v_z dot t = 4 dot 2 = 8 "m". $]
  ],
))

#q-wrap(dir: "doc", ds(
  [Một chiếc đèn chùm có trọng lượng $P = 160 "N"$ được treo cố định tại đỉnh $S$ của một mái nhà hình chóp đều $S.A B C D$ nhờ bốn sợi dây xích $S A, S B, S C, S D$ có độ dài bằng nhau. Bốn sợi dây xích này cùng tạo với mặt trần nhà nằm ngang một góc $60°$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Độ lớn lực căng của bốn sợi dây xích có độ lớn bằng nhau.]),
    True([Góc hợp bởi mỗi sợi dây xích với phương thẳng đứng bằng $30°$.]),
    True([Hợp lực của hai lực căng $vec(T)_A$ và $vec(T)_C$ của hai dây xích đối diện có phương thẳng đứng hướng lên trên.]),
    [Độ lớn lực căng của mỗi sợi dây xích bằng $40 sqrt(3) "N"$.],
  ),
  fig: canvas(length: 1.1cm, {
    import draw: *
    // Base parallelogram of the pyramid (horizontal ceiling)
    let A = (-1.0, 0.4)
    let B = (-0.2, 0)
    let C = (1.4, 0)
    let D = (0.6, 0.4)
    let S = (0.2, 1.8)
    
    // Hidden edges
    line(A, B, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, C, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    line(B, D, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(S, B, stroke: 0.8pt + black)
    line(S, C, stroke: 0.8pt + black)
    line(S, D, stroke: 0.8pt + black)
    
    // Gravity force arrow
    line(S, (0.2, 0.8), mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.5, 1.0), $vec(P)$)
    
    // Vertices
    circle(S, radius: 0.05, fill: rgb("#b45309")) // hanging chandelier point
    for pt in (A, B, C, D) {
      circle(pt, radius: 0.03, fill: black)
    }
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Do tính đối xứng của hình chóp đều $S.A B C D$, lực căng của bốn sợi dây xích bằng nhau:
      $ T_A = T_B = T_C = T_D = T. $]
    #step[b) Đúng. Sợi dây xích tạo với mặt phẳng trần nhà nằm ngang một góc $60°$.
      Do phương thẳng đứng vuông góc với mặt phẳng nằm ngang, góc giữa sợi xích và phương thẳng đứng là:
      $ 90° - 60° = 30°. $]
    #step[c) Đúng. Vì các dây xích đối xứng qua phương thẳng đứng đi qua đỉnh $S$, tổng lực căng của hai dây đối diện $vec(T)_A + vec(T)_C$ sẽ hướng thẳng đứng lên trên dọc theo trục đối xứng.]
    #step[d) Sai. Phương trình cân bằng lực của hệ dọc theo phương thẳng đứng là:
      $ T_A cos(30°) + T_B cos(30°) + T_C cos(30°) + T_D cos(30°) = P \
        <=> 4 T cos(30°) = P. $]
    #step[Thay số $P = 160 "N"$ và $cos(30°) = sqrt(3)/2$ vào:
      $ 4 T dot sqrt(3)/2 = 160 \
        <=> 2 sqrt(3) T = 160 \
        <=> T = 80/sqrt(3) = (80 sqrt(3))/3 "N". $
      Giá trị lực căng thực tế là $(80 sqrt(3))/3 "N"$ chứ không phải $40 sqrt(3) "N"$.]
  ],
))

#q-wrap(dir: "doc", ds(
  [Một con diều được thả trên không trung tại điểm $S$ đang ở trạng thái cân bằng dưới tác dụng của ba lực: lực nâng của gió $vec(F)_n$ có phương thẳng đứng hướng lên, lực đẩy ngang của gió $vec(F)_d$ có phương nằm ngang hướng từ Tây sang Đông, và lực căng của sợi dây diều $vec(T)$ kéo từ $S$ về gốc tọa độ $O$ trên mặt đất. Trọng lượng của con diều là $P = 15 "N"$. Biết rằng lực nâng của gió có độ lớn $F_n = 45 "N"$, lực đẩy ngang có độ lớn $F_d = 40 "N"$. Chọn hệ tọa độ $O x y z$ với $O$ là điểm buộc dây trên mặt đất, trục $O z$ thẳng đứng hướng lên, trục $O x$ hướng từ Tây sang Đông. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Lực căng dây $vec(T)$ của con diều hướng từ điểm $S$ về gốc tọa độ $O$.]),
    True([Hợp lực của lực nâng $vec(F)_n$ và trọng lực $vec(P)$ của con diều là một vectơ hướng thẳng đứng lên trên có độ lớn bằng $30 "N"$.]),
    True([Để con diều ở trạng thái cân bằng lực thì lực căng dây $vec(T)$ phải cân bằng với hợp lực của các lực nâng, lực đẩy ngang và trọng lực của con diều, tức là $vec(T) + vec(F)_n + vec(F)_d + vec(P) = vec(0)$.]),
    True([Độ lớn lực căng của sợi dây neo diều bằng $50 "N"$.]),
  ),
  fig: canvas(length: 1.1cm, {
    import draw: *
    let O = (0, 0)
    let S = (1.6, 1.4)
    
    // Flat ground line instead of axes
    line((-0.5, 0), (2.5, 0), stroke: 0.5pt + gray)
    
    // Kite string
    line(O, S, stroke: 0.8pt + black)
    
    // Forces at S
    // Lift force F_n (up)
    line(S, (1.6, 2.3), mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    content((1.9, 2.2), $vec(F)_n$)
    
    // Wind push F_d (right)
    line(S, (2.4, 1.4), mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    content((2.5, 1.6), $vec(F)_d$)
    
    // Gravity P (down)
    line(S, (1.6, 0.8), mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#b91c1c"))
    content((1.9, 0.9), $vec(P)$)
    
    // Tension T (along OS, pointing to O)
    line(S, (0.8, 0.7), mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#3b82f6"))
    content((0.8, 0.9), $vec(T)$)
    
    // Vertices
    circle(O, radius: 0.03, fill: black)
    content((0, -0.25), $O$)
    circle(S, radius: 0.04, fill: rgb("#d97706")) // kite point
    content((1.8, 1.25), $S$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Do sợi dây nối từ gốc tọa độ $O$ (buộc trên đất) đến con diều tại điểm $S$, nên lực căng dây $vec(T)$ tác dụng lên con diều có xu hướng giữ diều lại, kéo từ điểm đặt $S$ hướng về điểm neo $O$.]
    #step[b) Đúng. Do lực nâng $vec(F)_n$ hướng thẳng đứng lên trên ($45 "N"$) và trọng lực $vec(P)$ hướng thẳng đứng xuống dưới ($15 "N"$), hợp lực của chúng hướng theo chiều của lực lớn hơn (hướng thẳng đứng lên trên) có độ lớn là:
      $ F_n - P = 45 - 15 = 30 "N". $]
    #step[c) Đúng. Điều kiện để con diều ở trạng thái cân bằng lực (đứng yên) là tổng tất cả các vectơ lực tác dụng lên diều phải bằng vectơ không:
      $ vec(T) + vec(F)_n + vec(F)_d + vec(P) = vec(0). $]
    #step[d) Đúng. Chọn hệ trục tọa độ $O x y z$, ta biểu diễn các vectơ lực dưới dạng tọa độ:
      $ vec(F)_n &= (0; 0; 45) \
        vec(F)_d &= (40; 0; 0) \
        vec(P)   &= (0; 0; -15) $
      Từ phương trình cân bằng lực, ta rút ra tọa độ của vectơ lực căng dây $vec(T)$:
      $ vec(T) &= -(vec(F)_n + vec(F)_d + vec(P)) \
              &= -(40; 0; 45 - 15) = (-40; 0; -30). $
      Độ lớn lực căng của sợi dây neo diều là:
      $ T = |vec(T)| &= sqrt((-40)^2 + 0^2 + (-30)^2) \
                    &= sqrt(1600 + 900) = sqrt(2500) = 50 "N". $]
  ],
))


#q-wrap(dir: "ngang", ds(
  [Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $G, G'$ lần lượt là trọng tâm của tam giác $A B C$ và $A' B' C'$, $I$ là trung điểm của đoạn thẳng $G G'$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Ba vectơ $vec(A B), vec(A C), vec(A A')$ không đồng phẳng.]),
    True([Biểu diễn vectơ $vec(A G') = vec(A A') + 1/3 vec(A B) + 1/3 vec(A C)$.]),
    True([Hệ thức vectơ sau luôn đúng: $vec(I A) + vec(I B) + vec(I C) + vec(I A') + vec(I B') + vec(I C') = vec(0)$.]),
    [Ba vectơ $vec(A B'), vec(B C'), vec(C A')$ đồng phẳng.],
  ),
  fig: canvas(length: 0.9cm, {
    import draw: *
    let A = (0, 0)
    let B = (1.5, -0.3)
    let C = (0.7, 0.5)
    let Ap = (0, 2.0)
    let Bp = (1.5, 1.7)
    let Cp = (0.7, 2.5)
    let G = (0.73, 0.07)
    let Gp = (0.73, 2.07)
    let I = (0.73, 1.07)
    
    // Hidden edges
    line(A, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(B, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(C, Cp, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(G, Gp, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(A, B, stroke: 0.8pt + black)
    line(A, Ap, stroke: 0.8pt + black)
    line(B, Bp, stroke: 0.8pt + black)
    line(Ap, Bp, Cp, close: true, stroke: 0.8pt + black)
    
    // Vertices and points
    for pt in (A, B, C, Ap, Bp, Cp, G, Gp, I) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    // Labels
    content((-0.2, 0), $A$)
    content((1.7, -0.3), $B$)
    content((0.7, 0.7), $C$)
    content((-0.2, 2.0), $A'$)
    content((1.7, 1.7), $B'$)
    content((0.7, 2.7), $C'$)
    content((0.85, 0.25), $G$)
    content((0.85, 2.25), $G'$)
    content((0.9, 1.07), $I$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Do $A B, A C$ nằm trên mặt phẳng đáy $(A B C)$, còn cạnh bên $A A'$ chéo cắt mặt đáy, ba vectơ $vec(A B), vec(A C), vec(A A')$ không cùng song song với bất kỳ mặt phẳng nào, nên không đồng phẳng.]
    #step[b) Đúng. Ta tách vectơ $vec(A G')$:
      $ vec(A G') = vec(A A') + vec(A' G'). $
      Do $G'$ là trọng tâm của tam giác đáy $A' B' C'$ nên:
      $ vec(A' G') = 1/3 vec(A' B') + 1/3 vec(A' C'). $
      Vì $vec(A' B') = vec(A B)$ và $vec(A' C') = vec(A C)$, thế vào ta được:
      $ vec(A G') = vec(A A') + 1/3 vec(A B) + 1/3 vec(A C). $]
    #step[c) Đúng. Do $G$ và $G'$ lần lượt là trọng tâm của hai tam giác đáy $A B C$ và $A' B' C'$, ta có:
      $ vec(I A) + vec(I B) + vec(I C) = 3 vec(I G) \
        vec(I A') + vec(I B') + vec(I C') = 3 vec(I G'). $
      Cộng từng vế hai hệ thức ta có:
      $ vec(I A) + vec(I B) + vec(I C) + vec(I A') + vec(I B') + vec(I C') = 3(vec(I G) + vec(I G')). $
      Vì $I$ là trung điểm của đoạn thẳng $G G'$ nên $vec(I G) + vec(I G') = vec(0)$. Do đó hợp lực bằng $vec(0)$.]
    #step[d) Sai. Giả sử ba vectơ đồng phẳng, khi đó tồn tại hệ số thực để phân tích tuyến tính.
      Tuy nhiên, ta cộng ba vectơ lại:
      $ vec(A B') + vec(B C') + vec(C A') &= (vec(A B) + vec(B B')) + (vec(B C) + vec(C C')) + (vec(C A) + vec(A A')) \
                                        &= (vec(A B) + vec(B C) + vec(C A)) + 3 vec(A A') \
                                        &= vec(0) + 3 vec(A A') = 3 vec(A A') != vec(0). $
      Vì chúng có tổng khác không độc lập theo phương thẳng đứng và độc lập tuyến tính, nên ba vectơ này không đồng phẳng.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho tứ diện $A B C D$. Gọi $G$ là trọng tâm của tam giác $B C D$. Một mặt phẳng $(P)$ thay đổi không đi qua $A$, cắt các cạnh $A B, A C, A D$ và đoạn thẳng $A G$ lần lượt tại $B', C', D'$ và $G'$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ $vec(A G) = 1/3 (vec(A B) + vec(A C) + vec(A D))$.]),
    True([Tồn tại các số thực $x, y, z$ thỏa mãn $vec(A G') = x vec(A B') + y vec(A C') + z vec(A D')$ với $x + y + z = 1$.]),
    True([Ta luôn có đẳng thức tỉ số: $frac(A B, A B') + frac(A C, A C') + frac(A D, A D') = 3 frac(A G, A G')$.]),
    [Khi mặt phẳng $(P)$ song song với mặt phẳng $(B C D)$, ta bắt buộc có tỉ số $frac(A G, A G') = 1$.],
  ),
  fig: canvas(length: 1cm, {
    import draw: *
    let A = (0, 1.8)
    let B = (-1.3, 0.3)
    let C = (1.3, 0.3)
    let D = (0, -0.6)
    let G = (0, 0)
    
    // Hidden edges
    line(B, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, G, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(A, B, stroke: 0.8pt + black)
    line(A, C, stroke: 0.8pt + black)
    line(A, D, stroke: 0.8pt + black)
    line(B, D, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    
    // Vertices
    for pt in (A, B, C, D, G) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    content((0, 2.05), $A$)
    content((-1.5, 0.3), $B$)
    content((1.5, 0.3), $C$)
    content((0, -0.85), $D$)
    content((0.2, -0.1), $G$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Do $G$ là trọng tâm của tam giác đáy $B C D$, theo quy tắc chèn điểm $A$ ta có:
      $ vec(A B) + vec(A C) + vec(A D) = 3 vec(A G) <=> vec(A G) = 1/3(vec(A B) + vec(A C) + vec(A D)). $]
    #step[b) Đúng. Do các điểm $B', C', D'$ và $G'$ cùng nằm trên một mặt phẳng $(P)$, nên vectơ $vec(A G')$ đồng phẳng với $vec(A B'), vec(A C'), vec(A D')$, do đó tồn tại sự biểu diễn tuyến tính có tổng hệ số bằng 1.]
    #step[c) Đúng. Đặt các tỉ số $frac(A B, A B') = b$, $frac(A C, A C') = c$, $frac(A D, A D') = d$, $frac(A G, A G') = g$.
      Ta có $vec(A B) = b vec(A B')$, $vec(A C) = c vec(A C')$, $vec(A D) = d vec(A D')$, $vec(A G) = g vec(A G')$.
      Thế vào biểu thức phần a:
      $ 3 g vec(A G') = b vec(A B') + c vec(A C') + d vec(A D') \
        <=> vec(A G') = b / (3g) vec(A B') + c / (3g) vec(A C') + d / (3g) vec(A D'). $
      Do bốn điểm đồng phẳng nên tổng hệ số bằng $1$:
      $ b / (3g) + c / (3g) + d / (3g) = 1 <=> b + c + d = 3g. $
      Suy ra đẳng thức tỉ số của đề bài luôn đúng.]
    #step[d) Sai. Khi mặt phẳng $(P) parallel (B C D)$, theo định lý Ta-lét ta có các tỉ số đều bằng nhau và bằng một hằng số $k > 0$, tức là $frac(A G, A G') = k$ (với $k$ phụ thuộc vào khoảng cách từ $(P)$ đến đỉnh $A$), chứ không nhất thiết cố định bằng 1.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hình chóp $S. A B C D$ có đáy $A B C D$ là hình bình hành tâm $O$. Gọi $M, N$ lần lượt là các điểm thuộc các cạnh $S B, S D$ sao cho $S M = 2 M B$ và $S N = 1/2 N D$. Gọi $P$ là giao điểm của cạnh $S C$ với mặt phẳng $(A M N)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Ba vectơ $vec(S A), vec(S B), vec(S D)$ không đồng phẳng.]),
    True([Vectơ $vec(S O) = 1/2 vec(S B) + 1/2 vec(S D)$.]),
    True([Điểm $P$ thuộc mặt phẳng $(A M N)$ khi và chỉ khi $vec(S P) = x vec(S A) + y vec(S M) + z vec(S N)$ với $x + y + z = 1$.]),
    [Tỉ số độ dài đoạn thẳng $frac(S P, S C) = 2/5$.],
  ),
  fig: canvas(length: 1cm, {
    import draw: *
    let A = (-1.0, 0.4)
    let B = (-0.2, 0)
    let C = (1.4, 0)
    let D = (0.6, 0.4)
    let S = (0.2, 1.8)
    let O = (0.2, 0.2)
    
    // Hidden edges
    line(A, B, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, C, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    line(B, D, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    line(S, O, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(S, B, stroke: 0.8pt + black)
    line(S, C, stroke: 0.8pt + black)
    line(S, D, stroke: 0.8pt + black)
    
    // Vertices
    for pt in (A, B, C, D, S, O) {
      circle(pt, radius: 0.03, fill: black)
    }
    content((-1.2, 0.4), $A$)
    content((-0.3, -0.15), $B$)
    content((1.5, -0.15), $C$)
    content((0.8, 0.55), $D$)
    content((0.2, 2.0), $S$)
    content((0.2, 0.4), $O$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[a) Đúng. Do $S$ là đỉnh của hình chóp và các điểm $A, B, D$ thuộc mặt phẳng đáy không thẳng hàng.]
    #step[b) Đúng. Do đáy $A B C D$ là hình bình hành nên tâm $O$ là trung điểm của đường chéo $B D$. Theo tính chất trung điểm, ta có:
      $ vec(S B) + vec(S D) = 2 vec(S O) <=> vec(S O) = 1/2 vec(S B) + 1/2 vec(S D). $]
    #step[c) Đúng. Đây là tính chất bốn điểm đồng phẳng cơ bản trong không gian biểu diễn qua đỉnh $S$.]
    #step[d) Sai. Sử dụng tính chất của hình bình hành đáy:
      $ vec(S A) + vec(S C) = vec(S B) + vec(S D) <=> vec(S A) = vec(S B) + vec(S D) - vec(S C). $
      Theo đề bài:
      $ S M = 2 M B => vec(S B) = 3/2 vec(S M). $
      $ S N = 1/2 N D => S N = 1/3 S D => vec(S D) = 3 vec(S N). $
      Thế vào hệ thức trên:
      $ vec(S A) = 3/2 vec(S M) + 3 vec(S N) - vec(S C) <=> vec(S A) - 3/2 vec(S M) - 3 vec(S N) + vec(S C) = vec(0). $
      Đặt $vec(S P) = k vec(S C) => vec(S C) = 1/k vec(S P)$. Khi đó:
      $ vec(S A) - 3/2 vec(S M) - 3 vec(S N) + 1/k vec(S P) = vec(0) \
        <=> vec(S P) = -k vec(S A) + 3/2 k vec(S M) + 3 k vec(S N). $
      Vì $P$ thuộc mặt phẳng $(A M N)$ nên bốn điểm $A, M, N, P$ đồng phẳng. Tổng hệ số biểu diễn phải bằng $1$:
      $ -k + 3/2 k + 3 k = 1 <=> 7/2 k = 1 <=> k = 2/7. $
      Do đó tỉ số đúng phải là $frac(S P, S C) = 2/7$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là các điểm thuộc các cạnh $A B$ và $C' D'$ sao cho $A M = 1/3 A B$, $C' N = 2/3 C' D'$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Hai vectơ $vec(A' B')$ và $vec(D' C')$ bằng nhau.]),
    [Vectơ $vec(M N)$ cùng phương với $vec(A D)$.],
    True([Ba vectơ $vec(A B)$, $vec(A D)$, $vec(A A')$ không đồng phẳng.]),
    True([Ba vectơ $vec(M N)$, $vec(A D)$, $vec(A A')$ đồng phẳng.]),
  ),
  loigiai: [
    #step[a) Đúng. Do $A B C D . A' B' C' D'$ là hình hộp nên $A' B' C' D'$ là hình bình hành, suy ra $vec(A' B') = vec(D' C')$.]
    #step[b) Sai. Điểm $M$ và $N$ nằm trên hai đường thẳng chéo nhau $A B$ và $C' D'$, do đó vectơ $vec(M N)$ không cùng phương với $vec(A D)$.]
    #step[c) Đúng. Ba cạnh $A B, A D, A A'$ chung đỉnh $A$ của hình hộp không cùng nằm trên bất kỳ mặt phẳng nào, do đó chúng không đồng phẳng.]
    #step[d) Đúng. Biểu diễn vectơ $vec(M N)$ qua các cạnh của hình hộp:
      $ vec(M N) = vec(M B) + vec(B C) + vec(C C') + vec(C' N). $
      Ta có $vec(M B) = 2/3 vec(A B)$, $vec(B C) = vec(A D)$, $vec(C C') = vec(A A')$.
      Do $C' D'$ song song và ngược hướng với $A B$, nên:
      $ vec(C' N) = 2/3 vec(C' D') = -2/3 vec(A B). $
      Thế vào biểu thức ta có:
      $ vec(M N) = 2/3 vec(A B) + vec(A D) + vec(A A') - 2/3 vec(A B) = vec(A D) + vec(A A'). $
      Vì $vec(M N) = vec(A D) + vec(A A')$, suy ra $vec(M N)$ nằm trong mặt phẳng song song với mặt phẳng $(A D D' A')$.
      Do đó ba vectơ $vec(M N), vec(A D), vec(A A')$ đồng phẳng.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một khinh khí cầu nhỏ chịu lực nâng khí động học thẳng đứng hướng lên là $vec(F)_l = (0; 0; 80) "N"$. Để giữ khinh khí cầu đứng yên tại chỗ, người ta cột nó vào ba sợi dây cáp cố định ở mặt đất. Lực căng của ba dây cáp lần lượt là $vec(T)_1, vec(T)_2, vec(T)_3$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Hợp lực của ba lực căng dây phải cân bằng với lực nâng để khinh khí cầu đứng yên: $vec(T)_1 + vec(T)_2 + vec(T)_3 + vec(F)_l = vec(0)$.]),
    True([Hợp lực của ba lực căng dây có độ lớn bằng $80 "N"$.]),
    [Nếu ba dây cáp được bố trí đối xứng nhau qua phương thẳng đứng, lực căng của mỗi dây cáp dọc theo phương thẳng đứng phải bằng $30 "N"$.],
    True([Nếu góc giữa mỗi dây cáp và phương thẳng đứng là $60°$, độ lớn lực căng của mỗi dây cáp là $160/3 "N"$.]),
  ),
  loigiai: [
    #step[a) Đúng. Theo định luật I Newton, để vật đứng yên thì hợp lực tác dụng lên vật phải bằng $vec(0)$.]
    #step[b) Đúng. Ta có $vec(T)_1 + vec(T)_2 + vec(T)_3 = -vec(F)_l => |vec(T)_1 + vec(T)_2 + vec(T)_3| = |vec(F)_l| = 80 "N"$.]
    #step[c) Sai. Do tính đối xứng, hình chiếu của mỗi lực căng lên phương thẳng đứng bằng nhau. Gọi lực chiếu của mỗi dây lên phương thẳng đứng là $T_z$, ta có:
      $ 3 T_z = 80 => T_z = 80/3 approx 26.7 "N" != 30 "N". $]
    #step[d) Đúng. Hình chiếu của mỗi lực căng lên phương thẳng đứng là $T_z = T dot cos(60°) = T/2$.
      Ta có: $3 T_z = 80 => 3 T/2 = 80 => T = 160/3 "N"$.]
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (10 câu)], count: 10)

#q-wrap(dir: "doc", tln(
  [Cho hình hộp chữ nhật $A B C D . A' B' C' D'$ (như hình vẽ bên dưới) có các cạnh $A B = 3$, $A D = 4$, $A A' = 5$. Tính bình phương độ dài của vectơ $vec(u) = vec(A B) + vec(A D) + vec(A A')$.],
  [50],
  fig: canvas(length: 0.9cm, {
    import draw: *
    let A = (0, 0.8)
    let B = (-1.5, 0)
    let C = (0.5, 0)
    let D = (2.0, 0.8)
    let Ap = (0, 2.3)
    let Bp = (-1.5, 1.5)
    let Cp = (0.5, 1.5)
    let Dp = (2.0, 2.3)
    
    // Hidden edges
    line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, Ap, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(B, Bp, stroke: 0.8pt + black)
    line(C, Cp, stroke: 0.8pt + black)
    line(D, Dp, stroke: 0.8pt + black)
    line(Ap, Bp, stroke: 0.8pt + black)
    line(Bp, Cp, stroke: 0.8pt + black)
    line(Cp, Dp, stroke: 0.8pt + black)
    line(Dp, Ap, stroke: 0.8pt + black)
    
    // Vertices
    for pt in (A, B, C, D, Ap, Bp, Cp, Dp) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    // Labels
    content((0.2, 0.6), $A$)
    content((-1.7, -0.1), $B$)
    content((0.5, -0.25), $C$)
    content((2.2, 0.8), $D$)
    content((-0.2, 2.5), $A'$)
    content((-1.7, 1.6), $B'$)
    content((0.5, 1.7), $C'$)
    content((2.2, 2.5), $D'$)
    
    // Dimension labels
    content((-0.5, -0.25), $3$)
    content((1.4, 0.25), $4$)
    content((2.2, 1.6), $5$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Theo quy tắc hình hộp cho ba cạnh chung đỉnh $A$, ta có:
      $ vec(u) = vec(A B) + vec(A D) + vec(A A') = vec(A C'). $]
    #step[Độ dài của vectơ $vec(u)$ chính là độ dài đường chéo $A C'$ của hình hộp chữ nhật.]
    #step[Bình phương độ dài vectơ $vec(u)$ được tính bởi:
      $ |vec(u)|^2 &= A B^2 + A D^2 + A A'^2 \
                  &= 3^2 + 4^2 + 5^2 \
                  &= 9 + 16 + 25 = 50. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho tứ diện $A B C D$ (như hình vẽ bên dưới). Gọi $M$ là điểm nằm trên cạnh $B C$ sao cho $M B = 2 M C$. Phân tích vectơ $vec(A M)$ qua các vectơ cạnh ta được biểu thức $vec(A M) = x vec(A B) + y vec(A C) + z vec(A D)$. Tính giá trị của biểu thức $T = 3x + 6y + 9z$.],
  [5],
  fig: canvas(length: 1cm, {
    import draw: *
    let A = (0, 1.8)
    let B = (-1.5, 0.3)
    let C = (1.5, 0.3)
    let D = (0, -0.6)
    
    let M = (0.5, 0.3) // M divides BC in 2:1 ratio
    
    // Hidden edges
    line(B, C, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, M, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(D, M, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges
    line(A, B, stroke: 0.8pt + black)
    line(A, C, stroke: 0.8pt + black)
    line(A, D, stroke: 0.8pt + black)
    line(B, D, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    
    // Vertices and points
    for pt in (A, B, C, D) {
      circle(pt, radius: 0.03, fill: black)
    }
    circle(M, radius: 0.04, fill: rgb("#b91c1c"))
    
    // Labels
    content((0, 2.05), $A$)
    content((-1.7, 0.3), $B$)
    content((1.7, 0.3), $C$)
    content((0, -0.85), $D$)
    content((0.7, 0.45), $M$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Vì điểm $M$ thuộc cạnh $B C$ và thỏa mãn $M B = 2 M C$ nên hai vectơ $vec(M B), vec(M C)$ ngược hướng. Ta có đẳng thức:
      $ vec(M B) = -2 vec(M C). $]
    #step[Chèn điểm $A$ vào hai vế đẳng thức:
      $ vec(A B) - vec(A M) &= -2 (vec(A C) - vec(A M)) \
        <=> vec(A B) - vec(A M) &= -2 vec(A C) + 2 vec(A M). $]
    #step[Rút gọn biểu thức để biểu diễn $vec(A M)$ theo $vec(A B), vec(A C), vec(A D)$:
      $ 3 vec(A M) &= vec(A B) + 2 vec(A C) \
        <=> vec(A M) &= 1/3 vec(A B) + 2/3 vec(A C) + 0 vec(A D). $]
    #step[Đồng nhất hệ số với biểu thức đề bài $vec(A M) = x vec(A B) + y vec(A C) + z vec(A D)$, ta được:
      $ x = 1/3, quad y = 2/3, quad z = 0. $]
    #step[Tính giá trị của biểu thức $T$:
      $ T = 3 dot 1/3 + 6 dot 2/3 + 9 dot 0 = 1 + 4 + 0 = 5. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một bảng hiệu quảng cáo có trọng lượng $P = 150 "N"$ được treo cân bằng bởi hai sợi dây cáp đối xứng qua đường thẳng đứng đi qua tâm bảng hiệu (như hình vẽ bên dưới). Biết rằng góc giữa hai sợi dây cáp bằng $120°$ (do đó góc giữa mỗi sợi dây và phương thẳng đứng là $60°$). Tìm độ lớn lực căng của mỗi sợi dây cáp (đơn vị: $"N"$).],
  [150],
  fig: canvas(length: 0.9cm, {
    import draw: *
    // Ceiling line
    line((-2, 1.8), (2, 1.8), stroke: 1.5pt + gray)
    
    // Hanging points on ceiling
    let P1 = (-1.0, 1.8)
    let P2 = (1.0, 1.8)
    
    // Connection point on sign
    let S = (0, 0.5)
    
    // Cables
    line(P1, S, stroke: 1pt + black)
    line(P2, S, stroke: 1pt + black)
    
    // Gravity arrow
    line(S, (0, -0.7), mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.3, -0.5), $vec(P)$)
    
    // Signboard rectangle
    rect((-1.2, -0.2), (1.2, 0.5), fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"))
    content((0, 0.15), [BIỂN HIỆU])
    
    // Tension arrows
    line(S, (-0.5, 1.15), mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(S, (0.5, 1.15), mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    
    // Angle label (between two cables)
    content((0, 0.8), $120°$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Gọi hai lực căng của hai sợi dây cáp lần lượt là $vec(T)_1$ và $vec(T)_2$, trọng lực tác dụng lên biển hiệu là $vec(P)$.]
    #step[Khi hệ ở trạng thái cân bằng, ta có đẳng thức lực:
      $ vec(T)_1 + vec(T)_2 + vec(P) = vec(0) <=> vec(T)_1 + vec(T)_2 = -vec(P). $]
    #step[Do tính chất đối xứng của hai sợi dây cáp đối với phương thẳng đứng, độ lớn lực căng của hai sợi dây bằng nhau:
      $ T_1 = T_2 = T. $]
    #step[Chiếu phương trình cân bằng lên trục thẳng đứng (hướng thẳng đứng lên trên), ta được:
      $ T_1 cos(60°) + T_2 cos(60°) = P <=> 2 T cos(60°) = P. $]
    #step[Thay số $P = 150 "N"$ và $cos(60°) = 0.5$ vào ta được:
      $ 2 T dot 0.5 = 150 <=> T = 150 "N". $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong một buổi bay thử nghiệm thiết bị bay không người lái (flycam), flycam được thiết lập để chuyển động tự thân với vận tốc $vec(v)_1 = (15; 20; 10)$ (đơn vị: m/s). Tuy nhiên, do chịu tác động thêm của gió với vận tốc gió là $vec(v)_2 = (-3; -4; 5)$ (đơn vị: m/s). Hãy tính tốc độ thực tế của flycam khi chịu ảnh hưởng của gió (đơn vị: m/s).],
  [25],
  fig: canvas(length: 1.1cm, {
    import draw: *
    let O = (0, 0)
    let V1 = (1.2, 0.3)
    let V2 = (-0.3, 0.7)
    let V = (0.9, 1.0)
    
    // Parallelogram dashed edges
    line(V1, V, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(V2, V, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Vectors
    line(O, V1, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(O, V2, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(O, V, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    
    // Labels
    content((0.7, 0.05), $vec(v)_1$)
    content((-0.3, 0.35), $vec(v)_2$)
    content((0.45, 0.7), $vec(v)$)
    
    circle(O, radius: 0.03, fill: black)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Vectơ vận tốc thực tế $vec(v)$ của flycam là tổng của vận tốc tự thân và vận tốc gió:]
    #step[Ta cộng tọa độ tương ứng của hai vectơ vận tốc thành phần:
      $ vec(v) &= vec(v)_1 + vec(v)_2 \
              &= (15 + (-3); 20 + (-4); 10 + 5) \
              &= (12; 16; 15). $]
    #step[Tốc độ thực tế của flycam chính là độ lớn của vectơ vận tốc thực tế:
      $ |vec(v)| &= sqrt(12^2 + 16^2 + 15^2) \
                &= sqrt(144 + 256 + 225) \
                &= sqrt(625) = 25 "m/s". $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một chiếc máy bay đang bay theo hướng Bắc với vận tốc tự thân là $160 "km/h"$. Do ảnh hưởng của một luồng gió thổi ngang từ hướng Tây sang Đông với tốc độ $120 "km/h"$, đồng thời phi công điều khiển máy bay cất cánh hướng thẳng đứng lên cao với vận tốc $150 "km/h"$. Hãy tính tốc độ thực tế của máy bay so với mặt đất (đơn vị: $"km/h"$).],
  [250],
  fig: canvas(length: 0.9cm, {
    import draw: *
    // 3D Box representing the components
    let O = (0, 0)
    let P_east = (1.2, 0)
    let P_north = (0.4, 0.4)
    let P_up = (0, 1.5)
    
    // Vertices of the box
    let P_en = (1.6, 0.4)
    let P_eu = (1.2, 1.5)
    let P_nu = (0.4, 1.9)
    let P_enu = (1.6, 1.9)
    
    // Hidden edges of the box
    line(O, P_north, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(P_north, P_en, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(P_north, P_nu, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Solid edges of the box
    line(O, P_east, stroke: 0.5pt + gray)
    line(O, P_up, stroke: 0.5pt + gray)
    line(P_east, P_en, stroke: 0.5pt + gray)
    line(P_east, P_eu, stroke: 0.5pt + gray)
    line(P_up, P_eu, stroke: 0.5pt + gray)
    line(P_up, P_nu, stroke: 0.5pt + gray)
    line(P_en, P_enu, stroke: 0.5pt + gray)
    line(P_eu, P_enu, stroke: 0.5pt + gray)
    line(P_nu, P_enu, stroke: 0.5pt + gray)
    
    // Component velocity vectors
    line(O, P_east, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488")) // West to East wind
    line(O, P_north, mark: (end: "stealth", scale: 0.5), stroke: (paint: rgb("#0d9488"), thickness: 1.2pt, dash: "dashed")) // Self-propelled North
    line(O, P_up, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488")) // Vertically up
    
    // Labels of component vectors
    content((0.7, -0.25), $vec(v)_2$)
    content((0.6, 0.45), $vec(v)_1$)
    content((-0.35, 0.75), $vec(v)_3$)
    
    // Resultant vector (main diagonal of the box)
    line(O, P_enu, mark: (end: "stealth", scale: 0.6), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.8, 1.1), $vec(v)$)
    
    circle(O, radius: 0.03, fill: black)
    circle(P_enu, radius: 0.04, fill: rgb("#3b82f6")) // airplane point
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Chọn hệ tọa độ $O x y z$ với gốc tọa độ $O$ trùng vị trí ban đầu của máy bay.]
    #step[Trục $O x$ hướng theo hướng Tây - Đông (gió thổi từ Tây sang Đông cùng chiều $O x$), trục $O y$ hướng theo hướng Nam - Bắc (vận tốc tự thân hướng Bắc cùng chiều $O y$), và trục $O z$ thẳng đứng hướng lên trời.]
    #step[Các vectơ vận tốc thành phần được biểu diễn dưới dạng tọa độ như sau:
      $ vec(v)_1 &= (0; 160; 0) \
        vec(v)_2 &= (120; 0; 0) \
        vec(v)_3 &= (0; 0; 150). $]
    #step[Vectơ vận tốc tổng hợp của máy bay so với mặt đất là:
      $ vec(v) &= vec(v)_1 + vec(v)_2 + vec(v)_3 \
              &= (120; 160; 150). $]
    #step[Tốc độ thực tế (độ lớn vận tốc tổng hợp) của máy bay bằng:
      $ |vec(v)| &= sqrt(120^2 + 160^2 + 150^2) \
                &= sqrt(14400 + 25600 + 22500) \
                &= sqrt(62500) = 250 "km/h". $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hình chóp $S. A B C D$ có đáy $A B C D$ là hình bình hành. Gọi $M$ là trung điểm của cạnh $S B$, $N$ là điểm thuộc cạnh $S D$ sao cho $S D = 3 S N$. Mặt phẳng $(A M N)$ cắt cạnh $S C$ tại điểm $P$. Khi biểu diễn vectơ $vec(S P)$ qua vectơ $vec(S C)$ dưới dạng $vec(S P) = k vec(S C)$, tính giá trị của biểu thức $80k$.],
  [20],
  fig: canvas(length: 1cm, {
    import draw: *
    let A = (-1.0, 0.4)
    let B = (-0.2, 0)
    let C = (1.4, 0)
    let D = (0.6, 0.4)
    let S = (0.2, 1.8)
    let M = (0.0, 0.9) // Midpoint of SB
    let N = (0.33, 1.33) // N on SD, SN = 1/3 SD
    let P = (0.54, 0.51) // P on SC, SP = 1/4 SC
    
    // Hidden edges
    line(A, B, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, M, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(A, N, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(S, B, stroke: 0.8pt + black)
    line(S, C, stroke: 0.8pt + black)
    line(S, D, stroke: 0.8pt + black)
    line(M, N, stroke: 0.8pt + black)
    line(M, P, stroke: 0.8pt + black)
    line(N, P, stroke: 0.8pt + black)
    
    // Vertices
    for pt in (A, B, C, D, S, M, N, P) {
      circle(pt, radius: 0.03, fill: black)
    }
    content((-1.2, 0.4), $A$)
    content((-0.3, -0.15), $B$)
    content((1.5, -0.15), $C$)
    content((0.8, 0.55), $D$)
    content((0.2, 2.0), $S$)
    content((-0.2, 1.05), $M$)
    content((0.55, 1.45), $N$)
    content((0.75, 0.65), $P$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Do đáy $A B C D$ là hình bình hành nên ta luôn có mối liên hệ vectơ giữa các đỉnh:
      $ vec(S A) + vec(S C) = vec(S B) + vec(S D) <=> vec(S A) = vec(S B) + vec(S D) - vec(S C). $]
    #step[Biểu diễn các vectơ $vec(S B), vec(S D)$ qua $vec(S M), vec(S N)$ theo giả thiết đề bài:
      - $M$ là trung điểm của $S B => vec(S B) = 2 vec(S M)$.
      - $S N = 1/3 S D => vec(S D) = 3 vec(S N)$.]
    #step[Thay các biểu thức trên vào hệ thức liên hệ ban đầu:
      $ vec(S A) = 2 vec(S M) + 3 vec(S N) - vec(S C) <=> vec(S A) - 2 vec(S M) - 3 vec(S N) + vec(S C) = vec(0). $]
    #step[Đặt $vec(S P) = k vec(S C) => vec(S C) = 1/k vec(S P)$. Thay vào hệ thức ta thu được:
      $ vec(S A) - 2 vec(S M) - 3 vec(S N) + 1/k vec(S P) = vec(0) \
        <=> vec(S P) = -k vec(S A) + 2k vec(S M) + 3k vec(S N). $]
    #step[Do bốn điểm $A, M, N, P$ đồng phẳng (vì $P$ là giao điểm của $S C$ với mặt phẳng $(A M N)$), tổng các hệ số biểu diễn phải bằng $1$:
      $ -k + 2k + 3k = 1 <=> 4k = 1 <=> k = 1/4. $]
    #step[Tính giá trị của biểu thức $80k$:
      $ 80 k = 80 dot 1/4 = 20. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một khối container hàng hóa dạng hình hộp chữ nhật có tổng trọng lượng là $P = 100 "kN"$ được nâng lên đều bằng $4$ sợi dây xích chụm lại tại móc cẩu $S$ của cần cẩu. Bốn sợi xích $S A, S B, S C, S D$ có độ dài bằng nhau và được gắn vào $4$ góc $A, B, C, D$ của mặt trên container. Biết mặt trên $A B C D$ là một hình chữ nhật có kích thước $A B = 3 "m"$, $B C = 4 "m"$, và chiều cao thẳng đứng từ mặt container đến móc cẩu $S$ là $h = 6 "m"$. Tính lực căng của mỗi sợi xích (làm tròn kết quả đến hàng đơn vị của kN).],
  [27],
  fig: canvas(length: 1cm, {
    import draw: *
    // Base ABCD of container ceiling
    let A = (-1.2, 0.4)
    let B = (-0.4, 0)
    let C = (1.2, 0)
    let D = (0.4, 0.4)
    let S = (0, 1.8) // Hook
    let O = (0, 0.2) // Center of ABCD
    
    // Hidden lines
    line(A, B, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(A, D, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(S, A, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    line(A, C, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    line(B, D, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    line(S, O, stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    
    // Solid lines
    line(B, C, stroke: 0.8pt + black)
    line(C, D, stroke: 0.8pt + black)
    line(S, B, stroke: 0.8pt + black)
    line(S, C, stroke: 0.8pt + black)
    line(S, D, stroke: 0.8pt + black)
    
    // Gravity force vector
    line(O, (0, -0.6), mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    content((0.3, -0.3), $vec(P)$)
    
    // Vertices
    for pt in (A, B, C, D, S, O) {
      circle(pt, radius: 0.03, fill: black)
    }
    content((-1.4, 0.4), $A$)
    content((-0.5, -0.15), $B$)
    content((1.3, -0.15), $C$)
    content((0.6, 0.55), $D$)
    content((0.2, 2.0), $S$)
    content((0.2, 0.35), $O$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Gọi $O$ là giao điểm của hai đường chéo $A C$ và $B D$ của hình chữ nhật đáy $A B C D$.
      Do tính đối xứng nên móc cẩu $S$ nằm trên đường thẳng vuông góc với đáy tại $O$, do đó $S O = h = 6 "m"$.]
    #step[Tính độ dài đường chéo của hình chữ nhật đáy:
      $ A C = sqrt(A B^2 + B C^2) = sqrt(3^2 + 4^2) = 5 "m". $
      Do đó khoảng cách từ tâm đối xứng $O$ đến các đỉnh treo xích là:
      $ O A = O B = O C = O D = A C / 2 = 2.5 "m". $]
    #step[Độ dài thực tế của mỗi sợi xích bằng:
      $ S A = S B = S C = S D = sqrt(S O^2 + O A^2) = sqrt(6^2 + 2.5^2) = sqrt(42.25) = 6.5 "m". $]
    #step[Gọi lực căng của bốn sợi xích lần lượt là $vec(T)_A, vec(T)_B, vec(T)_C, vec(T)_D$. Do tính chất đối xứng, lực căng trên mỗi sợi xích có độ lớn bằng nhau:
      $ T_A = T_B = T_C = T_D = T. $]
    #step[Chiếu phương trình cân bằng lực $vec(T)_A + vec(T)_B + vec(T)_C + vec(T)_D + vec(P) = vec(0)$ lên phương thẳng đứng (phương của $S O$ hướng lên):
      $ 4 T cos(alpha) = P $
      trong đó $alpha = hat(O S A)$ là góc tạo bởi mỗi sợi xích với phương thẳng đứng:
      $ cos(alpha) = S O / S A = 6 / 6.5 = 12/13. $]
    #step[Thay các số liệu vào ta được:
      $ 4 T dot 12/13 = 100 <=> 48/13 T = 100 <=> T = 1300 / 48 approx 27.08 "kN". $
      Làm tròn lực căng xích đến hàng đơn vị ta được kết quả $27 "kN"$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Ba chiếc ca nô kéo một chiếc sà lan trên sông theo các hướng khác nhau. Lực kéo của ca nô thứ nhất là $vec(F)_1$ có độ lớn $4000 "N"$, hướng lệch $30°$ về phía bên trái so với hướng chuyển động thẳng của sà lan. Lực kéo của ca nô thứ hai là $vec(F)_2$ có độ lớn $4000 "N"$, hướng lệch $30°$ về phía bên phải. Lực kéo của ca nô thứ ba là $vec(F)_3$ hướng thẳng dọc theo hướng chuyển động của sà lan và có độ lớn $3000 "N"$. Để sà lan chuyển động thẳng đều thì lực cản của dòng nước tác dụng lên sà lan có độ lớn bằng bao nhiêu Newton (làm tròn kết quả đến hàng đơn vị)?],
  [9928],
  fig: canvas(length: 1cm, {
    import draw: *
    let O = (0, 0)
    let F1 = (1.5, 0.866)
    let F2 = (1.5, -0.866)
    let F3 = (1.2, 0)
    let F_res = (2.7, 0)
    
    // Water flow lines
    line((-1.5, -1.2), (3.0, -1.2), stroke: 0.5pt + gray)
    line((-1.5, 1.2), (3.0, 1.2), stroke: 0.5pt + gray)
    
    // Force vectors
    line(O, F1, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(O, F2, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    line(O, F3, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#0d9488"))
    
    // Resultant force direction indicator
    line(O, F_res, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
    
    // Labels
    content((1.2, 1.1), $vec(F)_1$)
    content((1.2, -1.1), $vec(F)_2$)
    content((0.8, 0.25), $vec(F)_3$)
    
    circle(O, radius: 0.04, fill: black)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Chọn trục tọa độ $O x$ trùng với hướng chuyển động thẳng của sà lan.]
    #step[Chiếu các lực kéo của ba ca nô lên trục $O x$ để tìm tổng lực kéo có ích dọc theo hướng chuyển động:
      - Lực kéo của ca nô 1 theo hướng chuyển động: $F_(1x) = F_1 cos(30°)$.
      - Lực kéo của ca nô 2 theo hướng chuyển động: $F_(2x) = F_2 cos(30°)$.
      - Lực kéo của ca nô 3 theo hướng chuyển động: $F_(3x) = F_3$.]
    #step[Tổng độ lớn lực kéo tác dụng lên sà lan theo phương chuyển động là:
      $ F_k &= F_1 cos(30°) + F_2 cos(30°) + F_3 \
           &= 4000 dot cos(30°) + 4000 dot cos(30°) + 3000. $]
    #step[Thay giá trị lượng giác $cos(30°) = sqrt(3)/2$ vào ta tính được:
      $ F_k &= 4000 dot sqrt(3)/2 + 4000 dot sqrt(3)/2 + 3000 \
           &= 4000 sqrt(3) + 3000 approx 9928.2 "N". $]
    #step[Để sà lan chuyển động thẳng đều, lực cản của nước tác dụng lên sà lan phải cân bằng với tổng lực kéo có ích:
      $ F_c = F_k approx 9928.2 "N". $
      Làm tròn kết quả đến hàng đơn vị ta được $9928 "N"$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho tứ diện đều $A B C D$ có tất cả các cạnh bằng $2$. Gọi $G$ là trọng tâm của tứ diện $A B C D$. Điểm $M$ là một điểm thay đổi trong không gian thỏa mãn đẳng thức tích vô hướng $vec(M A) dot vec(M B) + vec(M C) dot vec(M D) = 5$. Tính bình phương khoảng cách $M G^2$.],
  [$3$],
  
  loigiai: [
    #step[Vì $G$ là trọng tâm của tứ diện đều $A B C D$, theo tính chất trọng tâm ta có:
      $ vec(G A) + vec(G B) + vec(G C) + vec(G D) = vec(0). $]
    #step[Sử dụng quy tắc chèn điểm $G$, biến đổi biểu thức vô hướng đề bài cho:
      $ vec(M A) dot vec(M B) + vec(M C) dot vec(M D) &= (vec(M G) + vec(G A)) dot (vec(M G) + vec(G B)) + (vec(M G) + vec(G C)) dot (vec(M G) + vec(G D)) \
                                                    &= M G^2 + vec(M G) dot (vec(G A) + vec(G B)) + vec(G A) dot vec(G B) \
                                                    &quad + M G^2 + vec(M G) dot (vec(G C) + vec(G D)) + vec(G C) dot vec(G D) \
                                                    &= 2 M G^2 + vec(M G) dot (vec(G A) + vec(G B) + vec(G C) + vec(G D)) + vec(G A) dot vec(G B) + vec(G C) dot vec(G D) \
                                                    &= 2 M G^2 + vec(G A) dot vec(G B) + vec(G C) dot vec(G D). $]
    #step[Trong tứ diện đều $A B C D$ có tất cả các cạnh bằng $2$, tâm ngoại tiếp trùng với trọng tâm $G$.
      Bán kính mặt cầu ngoại tiếp tứ diện đều cạnh $a = 2$ là:
      $ R = G A = G B = G C = G D = a sqrt(6)/4 = 2 sqrt(6)/4 = sqrt(6)/2. $
      Suy ra: $G A^2 = G B^2 = (sqrt(6)/2)^2 = 3/2$.]
    #step[Mặt khác, ta có hệ thức vectơ:
      $ vec(A B) = vec(G B) - vec(G A) => A B^2 = G B^2 + G A^2 - 2 vec(G A) dot vec(G B). $
      Thay các giá trị vào ta được:
      $ 2^2 = 3/2 + 3/2 - 2 vec(G A) dot vec(G B) => 4 = 3 - 2 vec(G A) dot vec(G B) => vec(G A) dot vec(G B) = -1/2. $
      Do tính đối xứng của tứ diện đều nên $vec(G C) dot vec(G D) = vec(G A) dot vec(G B) = -1/2$.]
    #step[Thay các tích vô hướng này vào hệ thức ở bước 2:
      $ 2 M G^2 + (-1/2) + (-1/2) = 5 <=> 2 M G^2 - 1 = 5 <=> 2 M G^2 = 6 <=> M G^2 = 3. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tàu chở hàng đang chuyển động thẳng đều dưới tác dụng của ba lực: lực kéo của động cơ $vec(F)_1$ hướng Đông - Tây có độ lớn $60 "kN"$, lực cản của nước $vec(F)_2$ hướng ngược lại có độ lớn $40 "kN"$, và lực đẩy của gió $vec(F)_3$ thổi theo phương vuông góc với hướng di chuyển (hướng Nam - Bắc) có độ lớn $15 "kN"$. Để giữ cho tàu đi đúng quỹ đạo thẳng không bị lệch hướng, bánh lái của tàu phải tạo ra một lực cản $vec(F)_4$ để cân bằng với ba lực trên. Tính độ lớn của lực $vec(F)_4$ (đơn vị: kN).],
  [$25$],
  
  loigiai: [
    #step[Để tàu chuyển động thẳng đều, tổng hợp lực tác dụng lên tàu phải bằng vectơ-không:
      $ vec(F)_1 + vec(F)_2 + vec(F)_3 + vec(F)_4 = vec(0) => vec(F)_4 = -(vec(F)_1 + vec(F)_2 + vec(F)_3). $]
    #step[Chọn hệ trục tọa độ sao cho trục $O x$ trùng với hướng di chuyển của tàu (Đông - Tây) và trục $O y$ vuông góc với nó (Nam - Bắc).
      Khi đó các vectơ lực được biểu diễn dưới dạng tọa độ như sau:
      $ vec(F)_1 = (-60; 0), quad vec(F)_2 = (40; 0), quad vec(F)_3 = (0; 15) "kN". $]
    #step[Tính tổng vectơ của ba lực đầu tiên:
      $ vec(F) = vec(F)_1 + vec(F)_2 + vec(F)_3 = (-60 + 40; 0 + 15) = (-20; 15) "kN". $]
    #step[Lực $vec(F)_4$ từ bánh lái cần có tọa độ là:
      $ vec(F)_4 = -vec(F) = (20; -15) "kN". $]
    #step[Độ lớn của lực $vec(F)_4$ là:
      $ |vec(F)_4| = sqrt(20^2 + (-15)^2) = sqrt(400 + 225) = sqrt(625) = 25 "kN". $]
  ],
))

