#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Thực Tế — Ứng dụng thực tiễn của vectơ trong không gian])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "doc",lines: 4,
  fig: canvas(length: 1.4cm, {
    import draw: *
    // Standard isometric projection for the room
    let proj(x, y, z) = (
      x * 0.866 - y * 0.866,
      -x * 0.15 - y * 0.5 + z * 0.9
    )
    
    // Bounding box (Room)
    let w = 2.4
    let h_ceil = 1.41
    let h_floor = -1.2
    
    let C1 = proj(w, w, h_ceil)   // front
    let C2 = proj(-w, w, h_ceil)  // left
    let C3 = proj(-w, -w, h_ceil) // back
    let C4 = proj(w, -w, h_ceil)  // right
    
    let F1 = proj(w, w, h_floor)
    let F2 = proj(-w, w, h_floor)
    let F3 = proj(-w, -w, h_floor)
    let F4 = proj(w, -w, h_floor)

    let box_s = 0.6pt + rgb("#7f8c8d")
    let box_d = (thickness: 0.6pt, paint: rgb("#7f8c8d"), dash: "dashed")
    
    // Hidden edges of the room
    line(C3, F3, stroke: box_d)
    line(F2, F3, stroke: box_d)
    line(F4, F3, stroke: box_d)
    
    // Ceiling (Top face)
    line(C1, C2, C3, C4, close: true, fill: rgb(245, 245, 245, 70%), stroke: box_s)
    
    // Ceiling grid
    for i in range(-2, 3) {
      line(proj(i, -w, h_ceil), proj(i, w, h_ceil), stroke: 0.4pt + white)
      line(proj(-w, i, h_ceil), proj(w, i, h_ceil), stroke: 0.4pt + white)
    }

    // Visible edges of the room
    line(F1, F2, stroke: box_s)
    line(F1, F4, stroke: box_s)
    line(C1, F1, stroke: box_s)
    line(C2, F2, stroke: box_s)
    line(C4, F4, stroke: box_s)

    // Points
    let vA = (2, 0, 1.41)
    let vB = (-1, 1.73, 1.41)
    let vC = (-1, -1.73, 1.41)
    let S = proj(0, 0, 0)
    let A = proj(..vA)
    let B = proj(..vB)
    let C = proj(..vC)

    // Draw attachment points
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)

    // Draw chains
    line(S, A, stroke: 1.2pt + rgb("#34495e"))
    line(S, B, stroke: 1.2pt + rgb("#34495e"))
    line(S, C, stroke: 1.2pt + rgb("#34495e"))

    // Right angle symbols at S
    let scale = 0.15
    let pAB1 = proj(vA.at(0) * scale, vA.at(1) * scale, vA.at(2) * scale)
    let pAB2 = proj(vB.at(0) * scale, vB.at(1) * scale, vB.at(2) * scale)
    let pAB3 = proj(
      (vA.at(0) + vB.at(0)) * scale,
      (vA.at(1) + vB.at(1)) * scale,
      (vA.at(2) + vB.at(2)) * scale,
    )
    line(pAB1, pAB3, pAB2, stroke: 0.6pt + black)

    let pBC1 = proj(vB.at(0) * scale, vB.at(1) * scale, vB.at(2) * scale)
    let pBC2 = proj(vC.at(0) * scale, vC.at(1) * scale, vC.at(2) * scale)
    let pBC3 = proj(
      (vB.at(0) + vC.at(0)) * scale,
      (vB.at(1) + vC.at(1)) * scale,
      (vB.at(2) + vC.at(2)) * scale,
    )
    line(pBC1, pBC3, pBC2, stroke: 0.6pt + black)

    let pCA1 = proj(vC.at(0) * scale, vC.at(1) * scale, vC.at(2) * scale)
    let pCA2 = proj(vA.at(0) * scale, vA.at(1) * scale, vA.at(2) * scale)
    let pCA3 = proj(
      (vC.at(0) + vA.at(0)) * scale,
      (vC.at(1) + vA.at(1)) * scale,
      (vC.at(2) + vA.at(2)) * scale,
    )
    line(pCA1, pCA3, pCA2, stroke: 0.6pt + black)

    // Tension vectors
    let t_scale = 0.5
    let TA = proj(vA.at(0) * t_scale, vA.at(1) * t_scale, vA.at(2) * t_scale)
    let TB = proj(vB.at(0) * t_scale, vB.at(1) * t_scale, vB.at(2) * t_scale)
    let TC = proj(vC.at(0) * t_scale, vC.at(1) * t_scale, vC.at(2) * t_scale)
    line(S, TA, stroke: 1.8pt + rgb("#00695C"), mark: (end: "stealth", fill: rgb("#00695C")))
    line(S, TB, stroke: 1.8pt + rgb("#00695C"), mark: (end: "stealth", fill: rgb("#00695C")))
    line(S, TC, stroke: 1.8pt + rgb("#00695C"), mark: (end: "stealth", fill: rgb("#00695C")))

    // Gravity
    let P = proj(0, 0, -1.8)
    line(S, P, stroke: 1.8pt + rgb("#D32F2F"), mark: (end: "stealth", fill: rgb("#D32F2F")))

    // Lamp
    let L1 = proj(0.3, 0.3, -0.2)
    let L2 = proj(-0.3, 0.3, -0.2)
    let L3 = proj(-0.3, -0.3, -0.2)
    let L4 = proj(0.3, -0.3, -0.2)
    let L5 = proj(0, 0, -0.6)
    
    line(S, proj(0, 0, -0.2), stroke: 1.5pt + rgb("#8B4513"))
    
    line(L1, L2, L5, close: true, fill: rgb("#e67e22").darken(20%), stroke: 0.5pt + rgb("#d35400")) // back
    line(L2, L3, L5, close: true, fill: rgb("#f39c12"), stroke: 0.5pt + rgb("#d35400")) // left
    line(L4, L1, L5, close: true, fill: rgb("#f39c12").darken(10%), stroke: 0.5pt + rgb("#d35400")) // right
    line(L3, L4, L5, close: true, fill: rgb("#f1c40f"), stroke: 0.5pt + rgb("#d35400")) // front

    // Labels
    content((A.at(0) + 0.1, A.at(1) + 0.15), $A$)
    content((B.at(0) - 0.2, B.at(1) + 0.1), $B$)
    content((C.at(0) - 0.2, C.at(1) - 0.1), $C$)
    content((S.at(0) + 0.15, S.at(1) + 0.1), $S$)
    
    content((TA.at(0) + 0.15, TA.at(1)), text(fill: rgb("#00695C"))[$arrow(T)_A$])
    content((TB.at(0) - 0.15, TB.at(1) + 0.2), text(fill: rgb("#00695C"))[$arrow(T)_B$])
    content((TC.at(0) - 0.3, TC.at(1) - 0.1), text(fill: rgb("#00695C"))[$arrow(T)_C$])
    content((P.at(0) + 0.25, P.at(1) - 0.1), text(fill: rgb("#D32F2F"))[$arrow(P)$])
  }),
  fig-pos: "center",
  fig-width: 65%,
  [Một chiếc đèn chùm treo trang trí có khối lượng $8$ kg được giữ ổn định nhờ ba sợi dây xích $S A, S B, S C$ đôi một vuông góc với nhau và gắn vào trần nhà nằm ngang tại ba điểm $A, B, C$. Biết độ lớn của lực căng trên cả ba sợi xích bằng nhau. Lấy gia tốc trọng trường $g = 10$ m/s². Độ lớn lực căng của mỗi sợi xích bằng bao nhiêu?],
  (
    [$80$ N.],
    True([$(80 sqrt(3))/3$ N.]),
    [$40 sqrt(3)$ N.],
    [$(40 sqrt(3))/3$ N.],
  ),
  loigiai: [
    #step[Trọng lực tác dụng lên đèn chùm có phương thẳng đứng, chiều hướng xuống dưới và có độ lớn:
      $P = m g = 8 dot 10 = 80$ (N).]
    #step[Khi đèn chùm ở trạng thái cân bằng, hợp lực căng của ba sợi xích cân bằng với trọng lực của đèn:
      $arrow(T_A) + arrow(T_B) + arrow(T_C) + arrow(P) = arrow(0) => arrow(T_A) + arrow(T_B) + arrow(T_C) = -arrow(P)$.]
    #step[Vì ba sợi xích đôi một vuông góc và lực căng có cùng độ lớn $T$, ta có:
      $|arrow(T_A) + arrow(T_B) + arrow(T_C)|^2 = T^2 + T^2 + T^2 = 3T^2$ (do tích vô hướng của các cặp vectơ vuông góc bằng 0).
      Mặt khác, $|arrow(T_A) + arrow(T_B) + arrow(T_C)| = P = 80$ (N).]
    #step[Suy ra:
      $3T^2 = 80^2 = 6400 => T = 80/sqrt(3) = (80 sqrt(3))/3$ (N). Chọn đáp án B.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  fig: canvas(length: 1.2cm, {
    import draw: *
    let proj(x, y, z) = (x * 0.7 - y * 0.4, y * 0.2 + z * 0.8)
    let O = proj(0, 0, 0)
    let v1 = proj(3.5, 0.8, 0.15) // representation of airplane
    let v2 = proj(0.5, -0.8, -0.1) // wind
    let v = (v1.at(0) + v2.at(0), v1.at(1) + v2.at(1))

    // Axes Oxyz
    line(O, proj(4.5, 0, 0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    line(O, proj(0, 2.5, 0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    line(O, proj(0, 0, 2.0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    content(proj(4.7, 0, 0), $x$, anchor: "west")
    content(proj(0, 2.7, 0), $y$, anchor: "north-west")
    content(proj(0, 0, 2.2), $z$, anchor: "south")

    // Draw v1
    line(O, v1, stroke: 1.8pt + blue, mark: (end: "stealth", fill: blue))
    content(v1, $arrow(v_1)$, anchor: "south-west")

    // Draw v2
    line(O, v2, stroke: 1.5pt + orange, mark: (end: "stealth", fill: orange))
    content(v2, $arrow(v_2)$, anchor: "north-east")

    // Parallelogram dashed lines
    line(v1, v, stroke: (thickness: 0.8pt, dash: "dashed", paint: orange))
    line(v2, v, stroke: (thickness: 0.8pt, dash: "dashed", paint: blue))

    // Resultant vector v
    line(O, v, stroke: 2.2pt + rgb("#00695C"), mark: (end: "stealth", fill: rgb("#00695C")))
    content(v, $arrow(v)$, anchor: "south-west")
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Một chiếc máy bay di chuyển trong không khí với vận tốc riêng được mô tả bởi vectơ $arrow(v_1) = (600; 150; 20)$ (km/h). Cùng lúc đó, một luồng gió thổi với vận tốc $arrow(v_2) = (30; -20; -5)$ (km/h). Vận tốc thực tế của máy bay so với mặt đất là vectơ $arrow(v) = arrow(v_1) + arrow(v_2)$. Tốc độ thực tế của máy bay so với mặt đất (làm tròn kết quả đến hàng đơn vị) là],
  (
    [$630$ km/h.],
    True([$643$ km/h.]),
    [$648$ km/h.],
    [$614$ km/h.],
  ),
  loigiai: [
    #step[Tính tọa độ vectơ vận tốc thực tế $arrow(v)$ của máy bay bằng cách cộng hai vectơ vận tốc:
      $arrow(v) = arrow(v_1) + arrow(v_2) = (600 + 30; 150 - 20; 20 - 5) = (630; 130; 15)$.]
    #step[Độ lớn vận tốc thực tế (tốc độ của máy bay so với mặt đất) là:
      $v = |arrow(v)| = sqrt(630^2 + 130^2 + 15^2) = sqrt(396900 + 16900 + 225) = sqrt(414025) approx 643,45$ (km/h).]
    #step[Làm tròn đến hàng đơn vị, ta được $643$ km/h. Chọn đáp án B.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  [Để tối đa hóa hiệu suất hấp thụ, một tấm pin năng lượng mặt trời phẳng được đặt trên mái nhà sao cho vectơ pháp tuyến của nó là $arrow(n) = (1; 2; 2)$. Tại một thời điểm trong ngày, các tia sáng mặt trời chiếu thẳng xuống theo hướng của vectơ $arrow(s) = (2; -1; -2)$. Tính cosin của góc tạo bởi hướng tia sáng mặt trời và vectơ pháp tuyến của tấm pin.],
  (
    True([$-4/9$]),
    [$4/9$],
    [$-2/9$],
    [$2/9$],
  ),
  loigiai: [
    #step[Cosin góc $theta$ giữa hai vectơ hướng tia sáng $arrow(s)$ và vectơ pháp tuyến $arrow(n)$ là:
      $cos theta = (arrow(s) dot arrow(n)) / (|arrow(s)| dot |arrow(n)|)$.]
    #step[Tính tích vô hướng và độ dài của từng vectơ:
      - $arrow(s) dot arrow(n) = 2 dot 1 + (-1) dot 2 + (-2) dot 2 = 2 - 2 - 4 = -4$.
      - $|arrow(n)| = sqrt(1^2 + 2^2 + 2^2) = 3$.
      - $|arrow(s)| = sqrt(2^2 + (-1)^2 + (-2)^2) = 3$.
    ]
    #step[Thay các giá trị vào công thức:
      $cos theta = (-4) / (3 dot 3) = -4/9$. Chọn đáp án A.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",lines: 4,
  fig: canvas(length: 1.0cm, {
    import draw: *
    let proj(x, y, z) = (x * 0.8 - y * 0.5, y * 0.25 + z * 0.75)
    let O = proj(0, 0, 0)
    let A = proj(1, 0, 2)
    let B = proj(3, 2, 1)
    let C = proj(0, 2, 4)

    // Axes
    line(O, proj(4.5, 0, 0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    line(O, proj(0, 3.5, 0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    line(O, proj(0, 0, 5.0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    content(proj(4.7, 0, 0), $x$, anchor: "west")
    content(proj(0, 3.7, 0), $y$, anchor: "north-west")
    content(proj(0, 0, 5.2), $z$, anchor: "south")

    // Projection lines for A(1, 0, 2)
    line(proj(1, 0, 0), A, stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))
    line(proj(0, 0, 2), A, stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))

    // Projection lines for C(0, 2, 4)
    line(proj(0, 2, 0), C, stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))
    line(proj(0, 0, 4), C, stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))

    // Projection lines for B(3, 2, 1)
    let B_xy = proj(3, 2, 0)
    line(B, B_xy, stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))
    line(B_xy, proj(3, 0, 0), stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))
    line(B_xy, proj(0, 2, 0), stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))
    line(B, proj(0, 0, 1), stroke: (thickness: 0.5pt, paint: gray, dash: "dashed"))

    // Shade triangle ABC (semi-transparent)
    line(A, B, C, close: true, fill: rgb("#00695C26"), stroke: none)

    // Draw triangle ABC
    line(A, B, stroke: 1.5pt + rgb("#00695C"))
    line(B, C, stroke: 1.5pt + rgb("#00695C"))
    line(C, A, stroke: 1.5pt + rgb("#00695C"))

    // Points
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)

    // Labels
    content(A, $A(1;0;2)$, anchor: "south-east")
    content(B, $B(3;2;1)$, anchor: "west")
    content(C, $C(0;2;4)$, anchor: "south")
    content(O, $O$, anchor: "north-east")
  }),
  fig-pos: "center",
  fig-width: 55%,
  [Một mái che bằng kính cường lực của tòa nhà có dạng hình tam giác $A B C$. Trong hệ trục tọa độ $O x y z$, tọa độ ba đỉnh của mái che lần lượt là $A(1; 0; 2)$, $B(3; 2; 1)$, $C(0; 2; 4)$ (đơn vị đo trên các trục là mét). Diện tích của mái che bằng kính tam giác $A B C$ là],
  (
    [$3$ m².],
    [$3/2$ m².],
    [$6$ m².],
    True([$9/2$ m².]),
  ),
  loigiai: [
    #step[Xác định tọa độ hai vectơ chỉ phương của hai cạnh xuất phát từ đỉnh $A$:
      - $arrow(A B) = (2; 2; -1)$.
      - $arrow(A C) = (-1; 2; 2)$.
    ]
    #step[Tính tích có hướng $[arrow(A B), arrow(A C)]$:
      $[arrow(A B), arrow(A C)] = (2 dot 2 - (-1) dot 2; (-1) dot (-1) - 2 dot 2; 2 dot 2 - 2 dot (-1)) = (6; -3; 6)$.]
    #step[Diện tích của mái kính tam giác $A B C$ là:
      $S = 1/2 |[arrow(A B), arrow(A C)]| = 1/2 sqrt(6^2 + (-3)^2 + 6^2) = 1/2 sqrt(36 + 9 + 36) = 1/2 sqrt(81) = 9/2 = 4,5$ (m²).
      Chọn đáp án D.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  fig: canvas(length: 1.2cm, {
    import draw: *
    let A = (0, 0)
    let H = (3.5, 0)
    let B = (3.5, -1.5)

    // Draw ground surface
    line((-0.5, 0), (4.5, 0), stroke: 1.2pt + rgb("#5D4037"))
    rect((-0.5, 0), (4.5, 0.3), fill: rgb("#8D6E6333"), stroke: none)
    content((2.0, 0.15), [Mặt đất], fill: rgb("#5D4037"), size: 8pt)

    // Vertical depth line
    line(H, B, stroke: (thickness: 0.8pt, paint: gray, dash: "dashed"))

    // Tunnel AB
    line(A, B, stroke: 2pt + rgb("#00695C"))

    // Right angle mark at H
    line((3.3, 0), (3.3, -0.2), stroke: 0.6pt + gray)
    line((3.3, -0.2), (3.5, -0.2), stroke: 0.6pt + gray)

    // Labels
    content(A, $A(20;50;0)$, anchor: "south-east")
    content(B, $B(80;130;-30)$, anchor: "north-west")
    content(H, $B'$, anchor: "south-west")

    // Angle arc
    arc(A, start: -23deg, stop: 0deg, radius: 1, stroke: 0.8pt)
    content((1.2, -0.2), $alpha$)
  }),
  fig-pos: "center",
  fig-width: 65%,
  [Một đường hầm khai thác quặng sâu trong lòng đất có dạng một đường thẳng. Trong hệ tọa độ định vị, điểm bắt đầu của đường hầm là $A(20; 50; 0)$ và điểm kết thúc là $B(80; 130; -30)$ (đơn vị đo là mét). Gọi góc dốc của đường hầm so với mặt phẳng nằm ngang $O x y$ là $alpha$. Giá trị của $sin alpha$ bằng],
  (
    [$3/11$],
    True([$3/sqrt(109)$]),
    [$-3/11$],
    [$30/sqrt(109)$],
  ),
  loigiai: [
    #step[Tính tọa độ vectơ chỉ phương của đường hầm $arrow(A B)$:
      $arrow(A B) = (80-20; 130-50; -30-0) = (60; 80; -30)$.]
    #step[Chiều dài của đường hầm $A B$ là độ dài của vectơ chỉ phương:
      $A B = |arrow(A B)| = sqrt(60^2 + 80^2 + (-30)^2) = sqrt(3600 + 6400 + 900) = sqrt(10900) = 10 sqrt(109)$ (m).]
    #step[Độ chênh lệch độ cao giữa hai đầu đường hầm là $|z_B - z_A| = 30$ (m).
      Góc dốc $alpha$ của đường hầm so với mặt phẳng nằm ngang $O x y$ được tính bởi công thức:
      $sin alpha = (|z_B - z_A|) / (A B) = 30 / (10 sqrt(109)) = 3 / sqrt(109)$. Chọn đáp án B.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  [Một khớp nối của cánh tay robot chịu một lực tác dụng được mô tả bởi vectơ $arrow(F) = (50; -20; 100)$ (N). Cánh tay robot chuyển dịch một quãng ngắn được xác định bởi vectơ $arrow(d) = (0.2; 0.5; 0.1)$ (m). Công cơ học do lực $arrow(F)$ sinh ra trong quá trình chuyển dịch này là $W = arrow(F) dot arrow(d)$. Giá trị của $W$ bằng],
  (
    True([$10$ J.]),
    [$20$ J.],
    [$15$ J.],
    [$100$ J.],
  ),
  loigiai: [
    #step[Công cơ học $W$ sinh ra là tích vô hướng của vectơ lực $arrow(F)$ và vectơ dịch chuyển $arrow(d)$:
      $W = arrow(F) dot arrow(d) = F_1 d_1 + F_2 d_2 + F_3 d_3$.]
    #step[Thay các tọa độ vào công thức tính công:
      $W = 50 dot 0.2 + (-20) dot 0.5 + 100 dot 0.1 = 10 - 10 + 10 = 10$ (J).]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  [Trên mặt biển khơi, trạm định vị xác định tọa độ của hai phao cứu sinh tự hành phát tín hiệu khẩn cấp lần lượt là $A(1.2; -0.5; 0.01)$ và $B(-0.8; 1.5; 0.03)$ (đơn vị đo tọa độ là km, cao độ biểu thị độ chênh lệch so với mực nước biển trung bình). Khoảng cách giữa hai phao cứu sinh đó bằng],
  (
    [$2 sqrt(2)$ km.],
    [$2 sqrt(2.0001)$ km.],
    True([$sqrt(8.0004)$ km.]),
    [$2.83$ km.],
  ),
  loigiai: [
    #step[Tính tọa độ vectơ khoảng cách $arrow(A B)$:
      $arrow(A B) = (-0.8 - 1.2; 1.5 - (-0.5); 0.03 - 0.01) = (-2; 2; 0.02)$.]
    #step[Khoảng cách giữa hai phao cứu sinh là độ dài đoạn thẳng $A B$:
      $A B = |arrow(A B)| = sqrt((-2)^2 + 2^2 + 0.02^2) = sqrt(4 + 4 + 0.0004) = sqrt(8.0004)$ (km).]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  [Một hầm chứa nông sản đặc biệt được xây dựng dưới lòng đất có hình dạng một hình hộp chữ nhật $A B C D . A' B' C' D'$. Trong hệ tọa độ $O x y z$ thiết lập, tọa độ ba đỉnh đáy là $A(0;0;-2)$, $B(4;0;-2)$, $D(0;3;-2)$ và một đỉnh đáy trên của mái hầm là $A'(0;0;1)$ (đơn vị đo trên các trục là mét). Thể tích của hầm chứa nông sản này bằng],
  (
    [$12$ m³.],
    [$24$ m³.],
    True([$36$ m³.]),
    [$48$ m³.],
  ),
  loigiai: [
    #step[Xác định ba vectơ cạnh xuất phát từ đỉnh $A$ của hình hộp chữ nhật:
      - $arrow(A B) = (4; 0; 0)$ $=> A B = 4$ (m).
      - $arrow(A D) = (0; 3; 0)$ $=> A D = 3$ (m).
      - $arrow(A A') = (0; 0; 3)$ $=> A A' = 3$ (m).
    ]
    #step[Vì hình hộp chữ nhật có ba vectơ cạnh đôi một vuông góc nên thể tích được tính bằng tích độ dài ba cạnh:
      $V = A B dot A D dot A A'$.]
    #step[Thay các độ dài vào công thức:
      $V = 4 dot 3 dot 3 = 36$ (m³). Chọn đáp án C.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  fig: canvas(length: 1.0cm, {
    import draw: *
    let A = (0, 0)
    let C = (2.4, 1.8) // length 3
    let B = (2.4 - 0.5, 1.8 + 1.2) // (1.9, 3.0)

    // Draw grid lines
    for i in range(-1, 5) {
      line((i, -0.5), (i, 4.5), stroke: (thickness: 0.3pt, paint: gray.lighten(50%)))
    }
    for j in range(-1, 5) {
      line((-0.5, j), (4.5, j), stroke: (thickness: 0.3pt, paint: gray.lighten(50%)))
    }

    // Axes
    line((-0.5, 0), (4.5, 0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    line((0, -0.5), (0, 4.5), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    content((4.3, -0.3), $x$)
    content((-0.3, 4.3), $y$)

    // Path A -> C
    line(A, C, stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    content((1.3, 0.7), $2 arrow(v_t)$, fill: blue)

    // Path C -> B
    line(C, B, stroke: 2pt + orange, mark: (end: "stealth", fill: orange))
    content((2.5, 2.5), $1 arrow(v_b)$, fill: orange)

    // Net displacement A -> B
    line(
      A,
      B,
      stroke: (thickness: 1.5pt, dash: "dashed", paint: rgb("#00695C")),
      mark: (end: "stealth", fill: rgb("#00695C")),
    )

    // Points and labels
    circle(A, radius: 0.06, fill: black)
    circle(C, radius: 0.06, fill: black)
    circle(B, radius: 0.06, fill: black)
    content(A, $A(10; 20)$, anchor: "north-east")
    content(C, $C(26; 32)$, anchor: "west")
    content(B, $B(21; 44)$, anchor: "south-east")
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Một con tàu biển đang neo đậu ở tọa độ $A(10; 20; 0)$ bắt đầu di chuyển theo hướng tránh bão với vectơ vận tốc $arrow(v_t) = (8; 6; 0)$ (km/h). Sau khi di chuyển được $2$ giờ, tàu gặp gió chướng nên phải đổi hướng di chuyển theo hướng gió là vectơ $arrow(v_b) = (-5; 12; 0)$ (km/h) trong $1$ giờ tiếp theo để đến trạm cứu hộ $B$ an toàn. Tọa độ của điểm cứu hộ $B$ là],
  (
    True([$(21; 44; 0)$]),
    [$(11; 44; 0)$],
    [$(26; 32; 0)$],
    [$(21; 32; 0)$],
  ),
  loigiai: [
    #step[Xác định tọa độ điểm chuyển hướng $C$ của tàu sau $2$ giờ di chuyển ban đầu:
      $C = A + 2 arrow(v_t) = (10; 20; 0) + 2(8; 6; 0) = (10 + 16; 20 + 12; 0) = (26; 32; 0)$.]
    #step[Xác định tọa độ điểm $B$ sau khi di chuyển $1$ giờ tiếp theo với vectơ vận tốc gió $arrow(v_b)$:
      $B = C + 1 arrow(v_b) = (26; 32; 0) + (-5; 12; 0) = (26 - 5; 32 + 12; 0) = (21; 44; 0)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  [Một thiết bị Drone khảo sát địa hình có khối lượng $2$ kg đang ở trạng thái bay treo đứng yên trên không. Trọng lực tác dụng lên Drone là $arrow(P) = (0; 0; -20)$ (N). Lực thổi của luồng gió ngang được xác định bởi vectơ $arrow(F_g) = (3; 4; 0)$ (N). Để Drone giữ nguyên vị trí, lực nâng hợp lực của cánh quạt $arrow(F_c)$ phải thỏa mãn điều kiện cân bằng lực $arrow(F_c) + arrow(P) + arrow(F_g) = arrow(0)$. Độ lớn của lực đẩy nâng $arrow(F_c)$ bằng],
  (
    [$25$ N.],
    [$20.6$ N.],
    True([$5 sqrt(17)$ N.]),
    [$20$ N.],
  ),
  loigiai: [
    #step[Từ phương trình cân bằng lực, ta tìm được vectơ lực nâng cánh quạt:
      $arrow(F_c) = -(arrow(P) + arrow(F_g)) = -(3; 4; -20) = (-3; -4; 20)$.]
    #step[Đo độ lớn lực nâng cánh quạt:
      $|arrow(F_c)| = sqrt((-3)^2 + (-4)^2 + 20^2) = sqrt(9 + 16 + 400) = sqrt(425) = 5 sqrt(17)$ (N).]
    #step[Kết luận: Chọn đáp án C. (Lực nâng xấp xỉ $20,62$ N).]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  [Một phần kết cấu mái che sân vận động hình phẳng được giằng bởi các thanh giằng thép chịu lực. Vectơ chỉ phương của thanh giằng thứ nhất là $arrow(u_1) = (1; 1; sqrt(2))$, vectơ chỉ phương của thanh giằng thứ hai là $arrow(u_2) = (1; -1; sqrt(2))$. Tính góc tạo bởi hai thanh giằng chịu lực này.],
  (
    [$30^degree$.],
    True([$60^degree$.]),
    [$90^degree$.],
    [$45^degree$.],
  ),
  loigiai: [
    #step[Góc $theta$ giữa hai thanh giằng thép được tính theo công thức cosin:
      $cos theta = (|arrow(u_1) dot arrow(u_2)|) / (|arrow(u_1)| dot |arrow(u_2)|)$.]
    #step[Tính tích vô hướng và độ dài các vectơ:
      - $arrow(u_1) dot arrow(u_2) = 1 dot 1 + 1 dot (-1) + sqrt(2) dot sqrt(2) = 1 - 1 + 2 = 2$.
      - $|arrow(u_1)| = sqrt(1^2 + 1^2 + (sqrt(2))^2) = sqrt(4) = 2$.
      - $|arrow(u_2)| = sqrt(1^2 + (-1)^2 + (sqrt(2))^2) = sqrt(4) = 2$.
    ]
    #step[Thay số vào công thức:
      $cos theta = 2 / (2 dot 2) = 1/2 => theta = 60^degree$. Chọn đáp án B.]
    #resetstep()
  ],
)

#tn(
  dir: "doc",
  [Một móng nhà hình lăng trụ tam giác đứng $A B C . A' B' C'$ được đào sâu dưới đất chuẩn bị đổ bê tông. Trong hệ tọa độ $O x y z$, đáy phẳng dưới nằm ở mặt $z = -1.5$ m, ba đỉnh đáy móng là $A(0;0;-1.5)$, $B(2;0;-1.5)$, $C(0;3;-1.5)$. Đáy phẳng trên nằm trên mặt đất bằng phẳng $z = 0$. Thể tích lượng đất đào lên để làm móng nhà này bằng],
  (
    True([$4.5$ m³.]),
    [$9$ m³.],
    [$3$ m³.],
    [$6$ m³.],
  ),
  loigiai: [
    #step[Tính tọa độ hai vectơ đáy móng $arrow(A B) = (2; 0; 0)$ và $arrow(A C) = (0; 3; 0)$.
      Nhận thấy hai vectơ này vuông góc tại $A$ ($arrow(A B) dot arrow(A C) = 0$).]
    #step[Tính diện tích đáy tam giác vuông $A B C$:
      $S_(A B C) = 1/2 A B dot A C = 1/2 dot 2 dot 3 = 3$ (m²).]
    #step[Chiều cao của móng nhà đứng là khoảng chênh lệch độ cao của hai mặt đáy:
      $h = 0 - (-1.5) = 1.5$ (m).
      Thể tích đất cần đào là thể tích hình lăng trụ đứng:
      $V = S_(A B C) dot h = 3 dot 1.5 = 4.5$ (m³). Chọn đáp án A.]
    #resetstep()
  ],
)

#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (3 câu)], count: 3)

#ds(
  dir: "doc",
  fig: canvas(length: 1.0cm, {
    import draw: *
    let O = (0, 0)
    let v1 = (2.0, 1.0)
    let vg = (0.5, -0.5)
    let v = (2.5, 0.5)

    // Grid
    for i in range(-1, 4) {
      line((i, -1.2), (i, 2.2), stroke: (thickness: 0.3pt, paint: gray.lighten(50%)))
    }
    for j in range(-1, 3) {
      line((-1.2, j), (3.2, j), stroke: (thickness: 0.3pt, paint: gray.lighten(50%)))
    }

    // Axes
    line((-1.0, 0), (3.5, 0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    line((0, -1.0), (0, 2.0), stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    content((3.3, -0.3), $x$)
    content((-0.3, 1.8), $y$)

    // Vectors
    line(O, v1, stroke: 2pt + blue, mark: (end: "stealth", fill: blue))
    content(v1, $arrow(v_1)$, anchor: "south")

    line(O, vg, stroke: 1.8pt + orange, mark: (end: "stealth", fill: orange))
    content(vg, $arrow(v_g)$, anchor: "north-west")

    line(v1, v, stroke: (thickness: 1pt, dash: "dashed", paint: orange))
    line(vg, v, stroke: (thickness: 1pt, dash: "dashed", paint: blue))

    line(O, v, stroke: 2.5pt + rgb("#00695C"), mark: (end: "stealth", fill: rgb("#00695C")))
    content(v, $arrow(v)$, anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Một chiếc khinh khí cầu đang bay ở độ cao $0.5$ km với vận tốc riêng so với không khí yên lặng là $arrow(v_1) = (20; 10; 0)$ (km/h). Sau đó, một luồng gió bắt đầu thổi ngang với vận tốc gió là $arrow(v_g) = (5; -5; 0)$ (km/h). Vận tốc thực tế của khinh khí cầu so với mặt đất được xác định bởi công thức vectơ $arrow(v) = arrow(v_1) + arrow(v_g)$.],
  (
    True([ Tốc độ luồng gió thổi ngang có độ lớn là $5 sqrt(2)$ km/h. ]),
    True([ Vận tốc thực tế của khinh khí cầu so với mặt đất là $arrow(v) = (25; 5; 0)$ (km/h). ]),
    True([ Tốc độ di chuyển thực tế của khinh khí cầu lớn hơn $25$ km/h. ]),
    [ Góc tạo bởi hướng di chuyển ban đầu và hướng di chuyển thực tế của khinh khí cầu có cosin bằng $9/sqrt(85)$. ],
  ),
  loigiai: [
    #step[a) Độ lớn tốc độ của gió thổi ngang là:
      $v_g = |arrow(v_g)| = sqrt(5^2 + (-5)^2) = sqrt(50) = 5 sqrt(2)$ (km/h). (Đúng)]
    #step[b) Tọa độ vectơ vận tốc thực tế của khinh khí cầu là:
      $arrow(v) = arrow(v_1) + arrow(v_g) = (20 + 5; 10 - 5; 0) = (25; 5; 0)$ (km/h). (Đúng)]
    #step[c) Tốc độ thực tế di chuyển là:
      $v = |arrow(v)| = sqrt(25^2 + 5^2) = sqrt(650) approx 25.495$ (km/h) $> 25$ km/h. (Đúng)]
    #step[d) Tính cosin góc $phi$ giữa hướng di chuyển ban đầu $arrow(v_1) = (20; 10; 0)$ và vận tốc thực tế $arrow(v) = (25; 5; 0)$:
      $cos phi = (arrow(v_1) dot arrow(v)) / (|arrow(v_1)| dot |arrow(v)|) = (20 dot 25 + 10 dot 5) / (sqrt(500) dot sqrt(650)) = 550 / (10 sqrt(5) dot 5 sqrt(26)) = 550 / (50 sqrt(130)) = 11 / sqrt(130) != 9 / sqrt(85)$. (Sai)]
  ],
)

#ds(
  dir: "doc",
  [Một mái che kính của trạm xăng dầu có dạng hình chóp cụt tứ giác đều $A B C D . A' B' C' D'$. Trong hệ tọa độ $O x y z$ thiết lập trên mặt đất phẳng $O x y$, tọa độ mặt đáy trên là $A'(2; 2; 4), B'(4; 2; 4), C'(4; 4; 4), D'(2; 4; 4)$ và mặt đáy dưới có tọa độ tương ứng trên đỉnh cột đỡ trạm xăng là $A(0; 0; 3), B(6; 0; 3), C(6; 6; 3), D(0; 6; 3)$ (đơn vị đo trên các trục là mét).],
  (
    True([ Chiều cao phần mái che kính chóp cụt này bằng $1$ m. ]),
    [ Độ dài của bốn thanh giằng thép nghiêng ở các cạnh bên đều bằng $sqrt(10)$ m. ],
    [ Thể tích không gian giới hạn bên trong phần mái che này bằng $26$ m³. ],
    [ Diện tích lớp tôn bao phủ xung quanh mái che (không tính hai đáy) bằng $12 sqrt(5)$ m². ],
  ),
  loigiai: [
    #step[a) Cao độ đáy trên là $z_1 = 4$, đáy dưới là $z_2 = 3$. Chiều cao mái che là chênh lệch cao độ $h = 4 - 3 = 1$ (m). (Đúng)]
    #step[b) Độ dài của các thanh giằng cạnh bên (ví dụ $A A'$):
      $arrow(A A') = (2; 2; 1) => A A' = sqrt(2^2 + 2^2 + 1^2) = 3$ (m) chứ không phải $sqrt(10)$ m. (Sai)]
    #step[c) Diện tích đáy dưới $A B C D$ (hình vuông cạnh 6m) là $S_1 = 36$ m².
      Diện tích đáy trên $A' B' C' D'$ (hình vuông cạnh 2m) là $S_2 = 4$ m².
      Thể tích chóp cụt:
      $V = h/3 (S_1 + S_2 + sqrt(S_1 S_2)) = 1/3 (36 + 4 + sqrt(36 dot 4)) = 52/3 approx 17.33$ (m³). (Sai)]
    #step[d) Lớp tôn xung quanh gồm bốn mặt bên là hình thang cân bằng nhau.
      Xét một mặt bên $A B B' A'$, đáy dưới $A B = 6$, đáy trên $A' B' = 2$.
      Hình chiếu vuông góc của $A'$ xuống cạnh $A B$ là $H(2; 0; 3)$.
      Độ dài chiều cao hình thang cân là $A' H$ với $arrow(A' H) = (0; -2; -1) => A' H = sqrt(5)$ (m).
      Diện tích mặt bên là: $S_b = ((A B + A' B') dot A' H)/2 = ((6+2) sqrt(5))/2 = 4 sqrt(5)$ (m²).
      Diện tích tôn xung quanh là: $S_(x q) = 4 S_b = 16 sqrt(5)$ (m²). (Sai)]
  ],
)

#ds(
  dir: "doc",
  [Một cần cẩu tháp tại công trường có đỉnh tháp $S(0; 0; 30)$, chân tháp đặt tại gốc tọa độ $O(0; 0; 0)$ trên mặt đất. Đầu mút của cần nằm ngang quay được có vị trí ban đầu tại điểm $A(12; 16; 30)$ (đơn vị đo là mét).],
  (
    True([ Chiều cao của tháp cần cẩu bằng $30$ m. ]),
    True([ Độ dài tầm với lớn nhất của cần cẩu (đoạn thẳng $S A$) bằng $20$ m. ]),
    True(
      [ Một sợi cáp treo vật nặng đi thẳng đứng từ đầu cần $A$ xuống đất đến vị trí vật tại $M(12; 16; 5)$ có chiều dài dây cáp thả ra bằng $25$ m. ],
    ),
    True(
      [ Đầu cần cẩu $A$ quay một vòng tròn quanh trục tháp $O z$. Quỹ đạo chuyển động của điểm $A$ nằm hoàn toàn trên mặt phẳng nằm ngang cách mặt đất $30$ m. ],
    ),
  ),
  loigiai: [
    #step[a) Đỉnh tháp $S(0; 0; 30)$ nằm trên trục đứng $O z$ cách mặt đất $O(0; 0; 0)$ là $30$ m. (Đúng)]
    #step[b) Tầm với cần cẩu là khoảng cách từ đỉnh tháp $S$ đến đầu cần $A$:
      $S A = sqrt((12-0)^2 + (16-0)^2 + (30-30)^2) = sqrt(144 + 256) = 20$ (m). (Đúng)]
    #step[c) Vì sợi cáp thẳng đứng dọc theo phương cao độ nên chiều dài dây cáp thả ra từ $A(12; 16; 30)$ đến vật $M(12; 16; 5)$ là:
      $L = |z_A - z_M| = |30 - 5| = 25$ (m). (Đúng)]
    #step[d) Khi quay quanh trục tháp $O z$, điểm $A$ luôn duy trì độ cao $z = 30$ không đổi, do đó quỹ đạo chuyển động của nó nằm hoàn toàn trên mặt nằm ngang song song mặt đất và cách mặt đất $30$ m. (Đúng)]
  ],
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (4 câu)], count: 4)

#tln(
  [Một trạm radar biển định vị hai tàu đánh cá có tọa độ trên bản đồ lần lượt là $A(3; 4; 0)$ và $B(5; -8; 0)$ (đơn vị đo trên bản đồ là hải lý). Khoảng cách giữa hai tàu đánh cá bằng bao nhiêu hải lý?],
  [12,17],
  loigiai: [
    #step[Tính tọa độ vectơ nối hai tàu đánh cá:
      $arrow(A B) = (5-3; -8-4; 0) = (2; -12; 0)$.]
    #step[Khoảng cách giữa hai tàu là độ dài của vectơ $arrow(A B)$:
      $A B = sqrt(2^2 + (-12)^2 + 0^2) = sqrt(4 + 144) = sqrt(148) approx 12.17$ (hải lý).]
    #step[Kết luận: Khoảng cách giữa hai tàu khoảng $12,17$ hải lý.]
  ],
)

#tln(
  [Thiết kế một mái che sân thượng hình tam giác $A B C$ nghiêng chống dột. Trong hệ trục tọa độ $O x y z$, tọa độ ba điểm chốt định vị mái che là $A(0; 2; 3)$, $B(4; 0; 2)$, $C(2; 5; 1)$ (đơn vị đo là mét). Diện tích của tấm mái che sân thượng này bằng bao nhiêu mét vuông? (Làm tròn kết quả đến hàng phần trăm).],
  [9,23],
  loigiai: [
    #step[Tính tọa độ hai vectơ từ đỉnh $A$:
      - $arrow(A B) = (4; -2; -1)$.
      - $arrow(A C) = (2; 3; -2)$.
    ]
    #step[Tính tích có hướng $[arrow(A B), arrow(A C)]$:
      $[arrow(A B), arrow(A C)] = ((-2) dot (-2) - (-1) dot 3; (-1) dot 2 - 4 dot (-2); 4 dot 3 - (-2) dot 2) = (7; 6; 16)$.]
    #step[Diện tích của tấm mái che sân thượng tam giác $A B C$ là:
      $S = 1/2 |[arrow(A B), arrow(A C)]| = 1/2 sqrt(7^2 + 6^2 + 16^2) = 1/2 sqrt(49 + 36 + 256) = 1/2 sqrt(341) approx 9.23$ (m²).]
  ],
)

#tln(
  fig: canvas(length: 1.0cm, {
    import draw: *
    let proj(x, y, z) = (x * 0.7 - y * 0.4, y * 0.2 + z * 0.8)
    let O = proj(0, 0, 0)
    let F1 = proj(2.0, 0, 0)
    let F2 = proj(0, 1.5, 0)
    let P = proj(0, 0, -3.0)
    let F12 = proj(2.0, 1.5, 0)
    let F = proj(2.0, 1.5, -3.0)

    // Axes Oxyz
    line(O, proj(3.0, 0, 0), stroke: 0.6pt + gray, mark: (end: "stealth", fill: gray))
    line(O, proj(0, 2.5, 0), stroke: 0.6pt + gray, mark: (end: "stealth", fill: gray))
    line(proj(0, 0, -3.5), proj(0, 0, 1.5), stroke: 0.6pt + gray, mark: (end: "stealth", fill: gray))
    content(proj(3.2, 0, 0), $x$, fill: gray)
    content(proj(0, 2.7, 0), $y$, fill: gray)
    content(proj(0, 0, 1.7), $z$, fill: gray)

    // Draw component vectors
    line(O, F1, stroke: 1.8pt + blue, mark: (end: "stealth", fill: blue))
    content(F1, $arrow(F_1)$, anchor: "west")

    line(O, F2, stroke: 1.8pt + blue, mark: (end: "stealth", fill: blue))
    content(F2, $arrow(F_2)$, anchor: "north-east")

    line(O, P, stroke: 1.8pt + red, mark: (end: "stealth", fill: red))
    content(P, $arrow(P)$, anchor: "east")

    // Parallelogram construction
    line(F1, F12, stroke: (thickness: 0.8pt, paint: blue, dash: "dashed"))
    line(F2, F12, stroke: (thickness: 0.8pt, paint: blue, dash: "dashed"))
    line(O, F12, stroke: (thickness: 0.8pt, paint: gray, dash: "dashed"))

    line(F12, F, stroke: (thickness: 0.8pt, paint: gray, dash: "dashed"))
    line(P, F, stroke: (thickness: 0.8pt, paint: red, dash: "dashed"))

    // Resultant vector F
    line(O, F, stroke: 2.5pt + rgb("#00695C"), mark: (end: "stealth", fill: rgb("#00695C")))
    content(F, $arrow(F)$, anchor: "north-west")
  }),
  fig-pos: "right",
  fig-width: 35%,
  [Một chân cầu bê tông được định vị vững chắc dưới sông chịu tác động của lực đẩy dòng nước chảy từ phía Tây sang Đông có độ lớn $40$ N và gió từ phía Nam sang Bắc có độ lớn $30$ N. Đồng thời, sức nặng nhịp cầu đè xuống móng chân cầu theo phương thẳng đứng có độ lớn $120$ N. Tính độ lớn của hợp lực tác dụng lên chân cầu bê tông này (đơn vị là Niutơn).],
  [130],
  loigiai: [
    #step[Thiết lập hệ tọa độ $O x y z$ với hướng Đông là trục dương $O x$, Bắc là trục dương $O y$, hướng thẳng đứng đi lên là trục dương $O z$.]
    #step[Biểu diễn các lực tác dụng dưới dạng vectơ:
      - Lực đẩy dòng nước: $arrow(F_1) = (40; 0; 0)$.
      - Lực đẩy của gió: $arrow(F_2) = (0; 30; 0)$.
      - Sức nặng nhịp cầu: $arrow(P) = (0; 0; -120)$.
    ]
    #step[Vectơ hợp lực tác dụng lên chân cầu là:
      $arrow(F) = arrow(F_1) + arrow(F_2) + arrow(P) = (40; 30; -120)$.]
    #step[Tính độ lớn của hợp lực:
      $F = |arrow(F)| = sqrt(40^2 + 30^2 + (-120)^2) = sqrt(1600 + 900 + 14400) = sqrt(16900) = 130$ (N).
      Vậy độ lớn hợp lực là $130$ N.]
  ],
)

#tln(
  [Một giàn hoa trang trí hình tam giác trong sân vườn được cố định tại ba điểm góc có tọa độ là $A(2; 1; 3)$, $B(5; -2; 4)$ và $C(5; 7; 2)$ (đơn vị đo là mét). Để treo giàn hoa luôn giữ thăng bằng lực, móc treo chịu lực phải được gắn đúng vị trí trọng tâm $G$ của tam giác $A B C$. Tính khoảng cách từ điểm trọng tâm $G$ này đến mặt đất phẳng (mặt phẳng $O x y$) (đơn vị là mét).],
  [3],
  loigiai: [
    #step[Mặt đất phẳng tương ứng với mặt phẳng tọa độ $O x y$ (có phương trình mặt phẳng $z = 0$).]
    #step[Tìm tọa độ trọng tâm $G(x_G; y_G; z_G)$ của tam giác $A B C$:
      - Hoành độ: $x_G = (2 + 5 + 5)/3 = 4$.
      - Tung độ: $y_G = (1 - 2 + 7)/3 = 2$.
      - Cao độ: $z_G = (3 + 4 + 2)/3 = 3$.
      Vậy trọng tâm có tọa độ là $G(4; 2; 3)$.]
    #step[Khoảng cách từ điểm $G(4; 2; 3)$ đến mặt phẳng $O x y$ chính là trị tuyệt đối cao độ của điểm $G$:
      $d(G, O x y) = |z_G| = 3$ (m).]
    #step[Kết luận: Móc treo cách mặt đất $3$ mét.]
  ],
)
