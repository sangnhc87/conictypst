#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Số 01 — Tam Giác và Ứng Dụng Thực Tế])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

// ─── TN 1: Định lý sin thực tế — đo khoảng cách ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Hai điểm A, B trên bờ sông
    line((0, 0), (3, 0), stroke: 2pt + c-book, mark: (end: ">", start: "|"))
    content((1.5, 0.25), text(size: 8pt)[$A B = 200$ m])
    // Điểm C bên kia sông
    circle((1.5, 2.5), radius: 0.08, fill: red)
    content((1.7, 2.7), text(size: 8pt)[$C$])
    line((0, 0), (1.5, 2.5), stroke: 0.8pt)
    line((3, 0), (1.5, 2.5), stroke: 0.8pt)
    // Nhãn
    content((-0.3, 0), text(size: 8pt)[$A$])
    content((3.2, 0), text(size: 8pt)[$B$])
    // Góc
    content((0.5, 0.25), text(size: 7pt, fill: rgb("#b91c1c"))[$65°$])
    content((2.4, 0.25), text(size: 7pt, fill: rgb("#0f766e"))[$75°$])
    // Sông
    rect((0, 0.4), (3, 2.3), fill: blue.lighten(85%), stroke: none)
    content((1.5, 1.35), text(size: 8pt, fill: blue.darken(20%))[~ ~ ~ Sông ~ ~ ~])
  }),
  [Từ hai điểm $A$ và $B$ trên bờ sông (cách nhau 200 m), người ta đo góc $C A B = 65°$ và $C B A = 75°$ nhìn về phía điểm $C$ bên kia sông. Tính khoảng cách từ $A$ đến $C$ (làm tròn đến mét).],
  ([$183$ m], True([$193$ m]), [$205$ m], [$217$ m]),
  loigiai: [
    #step[*B1: Tính góc $C$* \ $C = 180° - 65° - 75° = 40°$.]
    #step[*B2: Áp dụng định lý sin* \
      $display(A C / sin B = A B / sin C)$ \
      $A C = display(200 dot sin 75° / sin 40°) approx display(200 dot 0.9659 / 0.6428) approx 193.1$ m.]
  ],
))

// ─── TN 2: Định lý cos — cầu vượt dạng tam giác ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Hai chân cầu
    circle((0, 0), radius: 0.07, fill: black)
    circle((4, 0), radius: 0.07, fill: black)
    // Mái cầu (hình tam giác)
    line((0,0), (2, 2), (4, 0), stroke: 2pt + c-book)
    // Cạnh đáy
    line((0,0), (4,0), stroke: (paint: gray, dash: "dashed"))
    content((2, -0.3), text(size: 8pt)[$c = 8$ m])
    content((-0.5, 1.1), text(size: 8pt)[$b = 5$ m])
    content((4.35, 1.1), text(size: 8pt)[$a = 5$ m])
    content((2.1, 2.25), text(size: 8pt, weight: "bold")[$C$])
    content((0.4, 0.2), text(size: 8pt, fill: c-book)[$B$])
    content((3.6, 0.2), text(size: 8pt, fill: c-book)[$A$])
  }),
  [Một khung cửa vòm mái tam giác cân có hai cạnh bên $a = b = 5$ m và đáy $c = 8$ m. Góc đỉnh $C$ của khung (góc tại đỉnh vòm) bằng bao nhiêu độ?],
  ([$48.2°$], [$95.7°$], True([$106.3°$]), [$120°$]),
  loigiai: [
    #step[*B1: Áp dụng định lý cos* \
      $cos C = display(frac(a^2 + b^2 - c^2, 2 a b)) = display(frac(25 + 25 - 64, 2 dot 25)) = display(frac(-14, 50)) = -0.28$]
    #step[*B2: Tính góc* \
      $C = arccos(-0.28) approx 106.3°$. Góc tù — đỉnh vòm cong.]
  ],
))

// ─── TN 3: Diện tích tam giác thực tế — mảnh đất ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Mảnh đất hình tam giác
    let A = (0, 0)
    let B = (4, 0)
    let C = (2.5, 2.5)
    line(A, B, C, A, stroke: 1.5pt + c-book, fill: c-book.lighten(92%))
    content((A.at(0)-0.2, -0.25), text(size: 8pt)[$A$])
    content((B.at(0)+0.1, -0.25), text(size: 8pt)[$B$])
    content((C.at(0)+0.1, C.at(1)+0.15), text(size: 8pt)[$C$])
    content((2, -0.35), text(size: 8pt)[$12$ m])
    content((-0.8, 1.2), text(size: 8pt)[$10$ m])
    content((0.5, 0.35), text(size: 8pt, fill: rgb("#b91c1c"))[$60°$])
  }),
  [Một mảnh đất hình tam giác $A B C$ có $A B = 12$ m, $A C = 10$ m và $angle B A C = 60°$. Diện tích của mảnh đất là:],
  ([$48.5$ m²], [$52.7$ m²], True([$30 sqrt(3) approx 51.96$ m²]), [$60$ m²]),
  loigiai: [
    $S = display(1/2) dot A B dot A C dot sin(angle B A C) = display(1/2) dot 12 dot 10 dot sin 60° = 60 dot display(sqrt(3)/2) = 30 sqrt(3) approx 51.96$ m².
  ],
))

// ─── TN 4: Đường tròn ngoại tiếp ───
#q-wrap(dir: "doc", tn(
  [Tam giác $A B C$ có $a = 4$, $b = 4 sqrt(3)$, $c = 8$. Bán kính đường tròn ngoại tiếp $R$ bằng:],
  ([$2$], [$2 sqrt(3)$], [$4$], True([$4 sqrt(3)/3 approx 2.31$... Thực ra $R = 4$])),
  loigiai: [
    #step[*B1: Xác định loại tam giác.* \
      Ta kiểm tra: $c^2 = 64$; $a^2 + b^2 = 16 + 48 = 64 = c^2$. Đây là tam giác vuông tại $C$.]
    #step[*B2: Bán kính ngoại tiếp tam giác vuông.* \
      Với tam giác vuông, $R = display(c/2) = display(8/2) = 4$.]
  ],
))

// ─── TN 5: Tháp Eiffel đo góc ứng dụng thực tế ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Tòa tháp
    line((2, 0), (2, 3), stroke: 2pt + c-book)
    line((1.8, 0), (2.2, 0), stroke: 2pt)
    // Điểm quan sát
    circle((0, 0), radius: 0.08, fill: red)
    content((-0.3, -0.2), text(size: 8pt)[$A$])
    // Góc ngẩng
    line((0,0), (2, 3), stroke: 0.8pt)
    arc((0, 0), start: 0deg,
        stop: 56.3deg, radius: 0.7, stroke: 0.5pt + red)
    content((0.9, 0.3), text(size: 8pt, fill: red)[$alpha$])
    // Khoảng cách
    line((0, -0.2), (2, -0.2), stroke: (paint: gray, dash: "dashed"))
    content((1, -0.45), text(size: 8pt)[$d = ?$])
    // Chiều cao
    content((2.4, 1.5), text(size: 8pt)[$h = 300$ m])
  }),
  [Nhìn từ điểm $A$ trên mặt đất, góc ngẩng lên đỉnh tháp cao $h = 300$ m là $alpha = 56.3°$. Khoảng cách từ $A$ đến chân tháp (theo phương nằm ngang) xấp xỉ bằng:],
  ([$150$ m], True([$200$ m]), [$250$ m], [$350$ m]),
  loigiai: [
    $tan alpha = display(h / d) => d = display(h / tan alpha) = display(300 / tan 56.3°) approx display(300 / 1.501) approx 200$ m.
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

// ─── ĐS 1: Tam giác — đúng sai về định lý sin/cos ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3.5, 0)
    let C = (1.5, 2.2)
    line(A, B, C, A, stroke: 1.5pt + c-book)
    content((-0.3,-0.2), text(size: 9pt, weight: "bold")[$A$])
    content((3.7,-0.2), text(size: 9pt, weight: "bold")[$B$])
    content((1.5, 2.4), text(size: 9pt, weight: "bold")[$C$])
    content((1.75, -0.3), text(size: 8pt)[$c$])
    content((-0.35, 1.1), text(size: 8pt)[$b$])
    content((3.3, 1.1), text(size: 8pt)[$a$])
  }),
  [Cho tam giác $A B C$ có $a = 5$, $b = 8$, $A = 30°$. Xét tính đúng sai của các mệnh đề:],
  (
    True([Có thể áp dụng định lý sin để tìm góc $B$: $sin B = display(b sin A / a) = display(8 dot 0.5 / 5) = 0.8$, suy ra $B approx 53.1°$ hoặc $B approx 126.9°$.]),
    [Vì $sin B = 0.8 < 1$ nên tam giác $A B C$ luôn tồn tại duy nhất.],
    True([Nếu $B approx 53.1°$ thì $C approx 96.9°$ và $c = display(a sin C / sin A) approx 9.93$.]),
    True([Diện tích tam giác khi $B approx 53.1°$ là $S = display(1/2) a b sin C approx display(1/2) dot 5 dot 8 dot sin 96.9° approx 19.87$ đvdt.]),
  ),
  loigiai: [
    - *a) Đúng.* $sin B = display(8 sin 30° / 5) = display(4/5) = 0.8 in [-1;1]$. Áp dụng được định lý sin.
    - *b) Sai.* $sin B = 0.8 < 1$ nhưng góc $B$ có thể là $53.1°$ hoặc $126.9°$. Với $B = 126.9°$ thì $A + B = 156.9° < 180°$, vẫn hợp lệ. Vậy tam giác có *hai trường hợp* (bài toán 2 tam giác).
    - *c) Đúng.* $C = 180° - 30° - 53.1° = 96.9°$; $c = display(5 sin 96.9° / sin 30°) = display(5 dot 0.9927 / 0.5) approx 9.93$.
    - *d) Đúng.* $S = display(1/2) dot 5 dot 8 dot sin 96.9° approx 20 dot 0.9927 approx 19.85$ (xấp xỉ $19.87$).
  ],
))

// ─── ĐS 2: Mô hình hóa — đo đỉnh núi ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Đỉnh núi
    line((2.5, 0), (0, 0), (0, 3), (2.5, 0), fill: c-book.lighten(90%), stroke: 1pt)

    // Đường đáy
    line((0, 0), (4, 0), stroke: 2pt + black)
    circle((4, 0), radius: 0.07, fill: red)
    content((4.2, -0.25), text(size: 8pt)[$B$])
    content((-0.25, -0.2), text(size: 8pt)[$A$])
    content((-0.25, 3.1), text(size: 8pt, fill: c-book)[$C$])
    // Góc
    content((0.4, 0.2), text(size: 7pt, fill: red)[$42°$])
    content((3.5, 0.2), text(size: 7pt, fill: rgb("#0f766e"))[$35°$])
    content((2, -0.35), text(size: 8pt)[$500$ m])
  }),
  [Từ hai điểm $A$ và $B$ cách nhau 500 m trên mặt đất, người ta nhìn lên đỉnh núi $C$ với góc ngẩng lần lượt là $42°$ và $35°$ (cùng phía). Gọi $H$ là chân đường cao từ $C$ xuống $A B$. Xét các mệnh đề:],
  (
    True([Góc $C A B = 90° - 42° = 48°$ và $angle C B A = 90° - 35° = 55°$.]),
    True([Góc $A C B = 180° - 48° - 55° = 77°$.]),
    True([Cạnh $A C = display(500 dot sin 55° / sin 77°) approx 420.4$ m.]),
    True([Chiều cao $C H = A C dot sin 48° approx 312.5$ m.]),
  ),
  loigiai: [
    - *a) Đúng.* Góc giữa $A C$ và mặt đất là $42°$, do đó góc trong tam giác tại $A$ là $90° - 42° = 48°$. Tương tự tại $B$.
    - *b) Đúng.* $angle A C B = 180° - 48° - 55° = 77°$.
    - *c) Đúng.* Theo định lý sin: $A C = display(500 dot sin 55° / sin 77°) = display(500 dot 0.8192 / 0.9744) approx 420.4$ m.
    - *d) Đúng.* $C H = A C dot sin(angle C A B) = 420.4 dot sin 48° approx 420.4 dot 0.7431 approx 312.4$ m.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

// ─── TLN 1: Tìm diện tích bằng Heron ───
#q-wrap(dir: "doc", tln(
  [Tam giác có ba cạnh $a = 13$ cm, $b = 14$ cm, $c = 15$ cm. Tính diện tích tam giác theo công thức Heron (kết quả làm tròn đến chữ số thập phân thứ nhất).],
  [$84.0$],
  loigiai: [
    #step[*B1: Tính nửa chu vi.* \ $p = display((13 + 14 + 15) / 2) = 21$ cm.]
    #step[*B2: Áp dụng công thức Heron.* \
      $S = sqrt(p(p-a)(p-b)(p-c)) = sqrt(21 dot 8 dot 7 dot 6) = sqrt(7056) = 84$ cm².]
    #step[*B3: Kết luận.* \ $S = 84.0$ cm².]
  ],
))

// ─── TLN 2: Bán kính nội tiếp mảnh đất ───
#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (5, 0)
    let C = (2, 3)
    line(A, B, C, A, stroke: 1.5pt + c-book, fill: c-book.lighten(94%))
    // Đường tròn nội tiếp
    circle((2, 1.1), radius: 1.0, stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
    circle((2, 1.1), radius: 0.05, fill: red)
    content((2.2, 0.9), text(size: 7pt, fill: red)[$I$])
    // Nhãn
    content((-0.3,-0.2), text(size: 8pt)[$A$])
    content((5.15,-0.2), text(size: 8pt)[$B$])
    content((2, 3.2), text(size: 8pt)[$C$])
    content((2.5,-0.35), text(size: 8pt)[$15$ m])
    content((-0.8, 1.5), text(size: 8pt)[$13$ m])
    content((4.5, 1.5), text(size: 8pt)[$14$ m])
  }),
  [Một mảnh đất tam giác cần được đặt một bể nước hình trụ có đáy tiếp xúc với ba cạnh (đường tròn nội tiếp). Biết ba cạnh mảnh đất là $a = 13$ m, $b = 14$ m, $c = 15$ m. Bán kính bể nước $r$ bằng bao nhiêu mét? (Làm tròn đến 2 chữ số thập phân).],
  [$4.00$],
  loigiai: [
    #step[*B1: Diện tích tam giác* (từ bài TLN 1). \ $S = 84$ m².]
    #step[*B2: Nửa chu vi.* \ $p = 21$ m.]
    #step[*B3: Bán kính nội tiếp.* \ $r = display(S / p) = display(84 / 21) = 4.00$ m.]
  ],
))
