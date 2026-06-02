#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 03 - TÍCH CÓ HƯỚNG CỦA HAI VECTƠ]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (21 câu)], count: 21)

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai vectơ $vec(a) = (1; -1; 2)$ và $vec(b) = (2; 1; -1)$. Tìm tọa độ của vectơ tích có hướng $[vec(a), vec(b)]$.],
  (
    [$(-1; 3; 3)$],
    True([$(-1; 5; 3)$]),
    [$(1; 5; 3)$],
    [$(-1; 5; -3)$],
  ),
  
  loigiai: [
    #step[Tính từng định thức tọa độ của tích có hướng $[vec(a), vec(b)]$:
      $x = det mat(-1, 2; 1, -1) = (-1)(-1) - 2(1) = -1$.]
    #step[Tính tiếp cao độ và tung độ:
      $y = det mat(2, 1; -1, 2) = 2(2) - 1(-1) = 5$.
      $z = det mat(1, -1; 2, 1) = 1(1) - (-1)(2) = 3$.]
    #step[Vậy $[vec(a), vec(b)] = (-1; 5; 3)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 0; 1)$, $B(2; 1; 2)$ và $C(1; -1; 3)$. Tính diện tích $S$ của tam giác $A B C$.],
  (
    [$S = sqrt(14)$],
    [$S = frac(sqrt(10), 2)$],
    True([$S = frac(sqrt(14), 2)$]),
    [$S = frac(sqrt(14), 4)$],
  ),
  
  loigiai: [
    #step[Tìm tọa độ các vectơ: $vec(A B) = (1; 1; 1)$ và $vec(A C) = (0; -1; 2)$.]
    #step[Tính tích có hướng $[vec(A B), vec(A C)]$:
      $[vec(A B), vec(A C)] = (1 dot 2 - 1 dot (-1); 1 dot 0 - 1 dot 2; 1 dot (-1) - 1 dot 0) = (3; -2; -1)$.]
    #step[Tính diện tích tam giác $A B C$:
      $S = frac(1, 2) |[vec(A B), vec(A C)]| = frac(1, 2) sqrt(3^2 + (-2)^2 + (-1)^2) = frac(sqrt(14), 2)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho bốn điểm $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ và $D(1; 1; 1)$. Tính thể tích $V$ của khối tứ diện $A B C D$.],
  (
    [$V = 5$],
    [$V = frac(5, 2)$],
    [$V = frac(5, 3)$],
    True([$V = frac(5, 6)$]),
  ),
  
  loigiai: [
    #step[Tính các vectơ: $vec(A B) = (-1; 2; 0)$, $vec(A C) = (-1; 0; 3)$, $vec(A D) = (0; 1; 1)$.]
    #step[Tính tích có hướng: $[vec(A B), vec(A C)] = (6; 3; 2)$.]
    #step[Tính tích hỗn tạp: $[vec(A B), vec(A C)] dot vec(A D) = 6(0) + 3(1) + 2(1) = 5$.]
    #step[Thể tích khối tứ diện: $V = frac(1, 6) |[vec(A B), vec(A C)] dot vec(A D)| = frac(5, 6)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho ba vectơ $vec(a) = (1; 2; 1)$, $vec(b) = (2; 0; 1)$ và $vec(c) = (m; 2; 2)$. Tìm giá trị thực của tham số $m$ để ba vectơ đã cho đồng phẳng.],
  (
    [$m = -3$],
    True([$m = 3$]),
    [$m = 1$],
    [$m = 2$],
  ),
  
  loigiai: [
    #step[Tính tích có hướng $[vec(a), vec(b)]$:
      $[vec(a), vec(b)] = (2 dot 1 - 0 dot 1; 1 dot 2 - 1 dot 1; 1 dot 0 - 2 dot 2) = (2; 1; -4)$.]
    #step[Để ba vectơ đồng phẳng thì $[vec(a), vec(b)] dot vec(c) = 0$.]
    #step[Giải phương trình:
      $2(m) + 1(2) + (-4)(2) = 0 <=> 2m - 6 = 0 <=> m = 3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một kỹ sư dùng một chiếc cờ-lê dài $25 "cm"$ để vặn một bu-lông. Lực tác dụng vào đầu cờ-lê có độ lớn $F = 80 "N"$ và hợp với cán cờ-lê một góc $60^degree$ (như hình vẽ bên dưới). Tính độ lớn mô-men lực tác dụng lên bu-lông.],
  (
    [$10 "N.m"$],
    True([$10 sqrt(3) "N.m"$]),
    [$20 "N.m"$],
    [$20 sqrt(3) "N.m"$],
  ),
  fig: canvas(length: 1cm, {
    import draw: *
    let O = (0, 0)
    let A = (2.0, 0)
    let F = (2.5, 0.866)
    
    // Wrench handle
    line(O, A, stroke: 3pt + gray)
    circle(O, radius: 0.12, fill: gray)
    
    // Force vector
    line(A, F, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    content((2.6, 0.95), $vec(F)$)
    
    // Angle helper
    line(A, (2.8, 0), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    
    // Labels
    content((-0.2, 0), $O$)
    content((1.9, -0.25), $A$)
    content((2.4, 0.2), $60^degree$)
  }),
  fig-pos: "right",
  fig-width: 32%,
  
  loigiai: [
    #step[Mô-men lực tác dụng lên bu-lông đối với tâm quay $O$ được xác định bởi công thức tích có hướng:
      $ vec(M) = [vec(r), vec(F)] $
      trong đó $vec(r) = vec(O A)$ là vectơ cánh tay đòn từ tâm quay $O$ đến điểm đặt lực $A$.]
    #step[Độ lớn của mô-men lực bằng:
      $ M = |vec(M)| = |vec(r)| dot |vec(F)| dot sin(vec(r), vec(F)) = r dot F dot sin(60^degree). $]
    #step[Thay các số liệu với chiều dài cánh tay đòn $r = 25 "cm" = 0.25 "m"$, lực $F = 80 "N"$:
      $ M = 0.25 dot 80 dot sin(60^degree) = 20 dot sqrt(3)/2 = 10 sqrt(3) "N.m". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho ba điểm $A(2; 1; -1)$, $B(3; 0; 1)$, $C(2; -1; 3)$. Diện tích tam giác $A B C$ bằng:],
  (
    True([$sqrt(5)$]),
    [$2 sqrt(5)$],
    [$sqrt(10)$],
    [$5$],
  ),
  loigiai: [
    #step[Tìm tọa độ các vectơ cạnh từ đỉnh $A$:
      $ vec(A B) = (3 - 2; 0 - 1; 1 - (-1)) = (1; -1; 2), $
      $ vec(A C) = (2 - 2; -1 - 1; 3 - (-1)) = (0; -2; 4). $]
    #step[Tính tích có hướng của hai vectơ $[vec(A B), vec(A C)]$:
      $ [vec(A B), vec(A C)] &= (det mat(-1, 2; -2, 4); det mat(2, 1; 4, 0); det mat(1, -1; 0, -2)) \
                             &= (-4 - (-4); 0 - 4; -2 - 0) = (0; -4; -2). $]
    #step[Diện tích tam giác $A B C$ được tính bằng nửa độ lớn của tích có hướng:
      $ S_(Delta A B C) = 1/2 |[vec(A B), vec(A C)]| = 1/2 sqrt(0^2 + (-4)^2 + (-2)^2) = 1/2 sqrt(20) = sqrt(5). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một đoạn dây dẫn thẳng dài $2 "m"$ đặt trong một từ trường đều có vectơ cảm ứng từ $vec(B) = (0.02; 0.03; 0.05) "T"$. Dòng điện chạy qua dây dẫn có cường độ $I = 5 "A"$ đi theo hướng của vectơ chỉ phương $vec(u) = (3; 4; 0)$. Xác định độ lớn của lực từ tác dụng lên đoạn dây dẫn.],
  (
    [$0.25 "N"$],
    [$0.40 "N"$],
    True([$0.50 "N"$]),
    [$0.65 "N"$],
  ),
  loigiai: [
    #step[Vectơ chỉ phương của dây dẫn là $vec(u) = (3; 4; 0)$ có độ dài:
      $ |vec(u)| = sqrt(3^2 + 4^2 + 0^2) = 5. $]
    #step[Vectơ chiều dài và hướng dòng điện của đoạn dây dài $L = 2 "m"$ là:
      $ vec(L) = 2 dot vec(u) / |vec(u)| = 2/5 (3; 4; 0) = (1.2; 1.6; 0) "m". $]
    #step[Lực từ tác dụng lên dây dẫn được xác định theo định luật Am-pe dưới dạng tích có hướng:
      $ vec(F) = I [vec(L), vec(B)] = 5 dot [(1.2; 1.6; 0), (0.02; 0.03; 0.05)]. $]
    #step[Tính tích có hướng $[vec(L), vec(B)]$:
      $ x &= 1.6 dot 0.05 - 0 dot 0.03 = 0.08, \
        y &= 0 dot 0.02 - 1.2 dot 0.05 = -0.06, \
        z &= 1.2 dot 0.03 - 1.6 dot 0.02 = 0.036 - 0.032 = 0.004. $
      Suy ra $[vec(L), vec(B)] = (0.08; -0.06; 0.004)$.]
    #step[Tính vectơ lực từ và độ lớn:
      $ vec(F) = 5 dot (0.08; -0.06; 0.004) = (0.4; -0.3; 0.02) "N". $
      $ |vec(F)| = sqrt(0.4^2 + (-0.3)^2 + 0.02^2) = sqrt(0.2504) approx 0.50 "N". $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai vectơ $vec(u) = (1; 2; -1)$ và $vec(v) = (2; -1; 3)$. Vectơ $vec(w)$ cùng phương với vectơ tích có hướng $[vec(u), vec(v)]$ và có hoành độ bằng $5$. Tọa độ của vectơ $vec(w)$ là:],
  (
    True([$(5; -5; -5)$]),
    [$(5; 5; 5)$],
    [$(5; -5; 5)$],
    [$(5; 10; -5)$],
  ),
  loigiai: [
    #step[Tính tích có hướng của hai vectơ $vec(u)$ và $vec(v)$:
      $ [vec(u), vec(v)] &= (2 dot 3 - (-1) dot (-1); (-1) dot 2 - 1 dot 3; 1 dot (-1) - 2 dot 2) \
                         &= (6 - 1; -2 - 3; -1 - 4) = (5; -5; -5). $]
    #step[Vì vectơ $vec(w)$ cùng phương với $[vec(u), vec(v)]$, ta có $vec(w) = k [vec(u), vec(v)] = (5k; -5k; -5k)$ với $k in RR$.]
    #step[Biết hoành độ của $vec(w)$ bằng $5$, do đó $5k = 5 <=> k = 1$.
      Vậy $vec(w) = (5; -5; -5)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho bốn điểm $A(1; 0; 1)$, $B(2; 1; 2)$, $D(1; -1; 1)$ và $A'(3; 0; -1)$. Biết $A B C D . A' B' C' D'$ là một hình hộp. Tính thể tích $V$ của hình hộp đó.],
  (
    [$V = 2$],
    True([$V = 4$]),
    [$V = 6$],
    [$V = 12$],
  ),
  loigiai: [
    #step[Tìm tọa độ ba vectơ chung đỉnh $A$:
      $ vec(A B) = (1; 1; 1), quad vec(A D) = (0; -1; 0), quad vec(A A') = (2; 0; -2). $]
    #step[Tính tích có hướng của hai vectơ đáy $[vec(A B), vec(A D)]$:
      $ [vec(A B), vec(A D)] &= (1 dot 0 - 1 dot (-1); 1 dot 0 - 1 dot 0; 1 dot (-1) - 1 dot 0) \
                             &= (1; 0; -1). $]
    #step[Thể tích của hình hộp được tính bằng trị tuyệt đối tích hỗn tạp:
      $ V = |[vec(A B), vec(A D)] dot vec(A A')| = |1 dot 2 + 0 dot 0 + (-1) dot (-2)| = |2 + 2| = 4. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho bốn điểm $A(1; 2; 1)$, $B(2; m; 2)$, $C(1; 1; 2)$ và $D(2; 1; 3)$. Tìm tất cả các giá trị của tham số $m$ để bốn điểm $A, B, C, D$ đồng phẳng.],
  (
    [$m = 0$],
    [$m = 1$],
    True([$m = 2$]),
    [$m = 3$],
  ),
  loigiai: [
    #step[Tìm tọa độ các vectơ cạnh xuất phát từ đỉnh $A$:
      $ vec(A C) = (0; -1; 1), quad vec(A D) = (1; -1; 2), quad vec(A B) = (1; m - 2; 1). $]
    #step[Tính tích có hướng $[vec(A C), vec(A D)]$:
      $ [vec(A C), vec(A D)] &= ((-1) dot 2 - 1 dot (-1); 1 dot 1 - 0 dot 2; 0 dot (-1) - (-1) dot 1) \
                             &= (-1; 1; 1). $]
    #step[Bốn điểm $A, B, C, D$ đồng phẳng khi và chỉ khi ba vectơ $vec(A B), vec(A C), vec(A D)$ đồng phẳng:
      $ [vec(A C), vec(A D)] dot vec(A B) = 0 \
        <=> -1 dot 1 + 1 dot (m - 2) + 1 dot 1 = 0. $]
    #step[Giải phương trình tìm $m$:
      $ -1 + m - 2 + 1 = 0 <=> m = 2. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai điểm $A(1; 2; -1)$ và $B(2; 4; 1)$. Điểm $M$ thuộc mặt phẳng $(O x y)$ sao cho tam giác $M A B$ vuông cân tại $A$. Hoành độ của điểm $M$ (biết hoành độ $M$ dương) bằng:],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$],
  ),
  loigiai: [
    #step[Điểm $M$ thuộc mặt phẳng $(O x y)$ nên tọa độ có dạng $M(x; y; 0)$ với $x > 0$.]
    #step[Tam giác $M A B$ vuông cân tại $A$ khi và chỉ khi:
      $ M A^2 = A B^2 quad "và" quad vec(A M) dot vec(A B) = 0. $]
    #step[Ta có: $vec(A B) = (1; 2; 2) => A B^2 = 1^2 + 2^2 + 2^2 = 9$.
      Và $vec(A M) = (x - 1; y - 2; 1) => M A^2 = (x-1)^2 + (y-2)^2 + 1$.
      Do đó: $(x-1)^2 + (y-2)^2 + 1 = 9 => (x-1)^2 + (y-2)^2 = 8$.]
    #step[Tích vô hướng bằng $0$:
      $ (x-1) dot 1 + (y-2) dot 2 + 1 dot 2 = 0. $
      Đặt $X = x - 1$, $Y = y - 2$ ta có hệ phương trình:
      $ cases(X^2 + Y^2 = 8, X + 2Y + 2 = 0) $]
    #step[Thế $X = -2Y - 2$ vào phương trình thứ nhất:
      $ (-2Y - 2)^2 + Y^2 = 8 <=> 5Y^2 + 8Y - 4 = 0 \
        <=> Y = 2/5 "hoặc" Y = -2. $
      - Với $Y = 2/5 => X = -14/5 => x = -9/5$ (loại vì hoành độ phải dương).
      - Với $Y = -2 => X = 2 => x = 3$ (nhận vì $3 > 0$).
      Vậy hoành độ của điểm $M$ bằng $3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một mái che có dạng hình chóp tam giác $S. A B C$ được lắp đặt trên một tòa nhà. Trong hệ tọa độ $O x y z$, các đỉnh đáy lần lượt là $A(0; 0; 3)$, $B(4; 0; 3)$, $C(2; 4; 3)$ và đỉnh mái là $S(2; 2; 5)$. Hãy xác định độ lớn góc nghiêng của mặt bên $(S B C)$ so với mặt phẳng nằm ngang $(A B C)$ (làm tròn kết quả đến hàng đơn vị của độ).],
  (
    [$45^degree$],
    [$55^degree$],
    True([$66^degree$]),
    [$72^degree$],
  ),
  loigiai: [
    #step[Mặt phẳng đáy $(A B C)$ có phương trình $z = 3$ vì cả ba điểm $A, B, C$ đều có cao độ bằng $3$.
      Đây là mặt phẳng nằm ngang, có vectơ pháp tuyến là $vec(k) = (0; 0; 1)$.]
    #step[Mặt phẳng $(S B C)$ đi qua ba điểm $S(2; 2; 5)$, $B(4; 0; 3)$ và $C(2; 4; 3)$.
      Ta có $vec(B C) = (-2; 4; 0)$ và $vec(B S) = (-2; 2; 2)$.]
    #step[Vectơ pháp tuyến của mặt bên $(S B C)$ được tính qua tích có hướng:
      $ vec(n) = [vec(B C), vec(B S)] = (8; 4; 4) = 4(2; 1; 1). $]
    #step[Góc nghiêng $theta$ giữa mặt bên $(S B C)$ và mặt phẳng ngang $(A B C)$ thỏa mãn:
      $ cos(theta) = |vec(n) dot vec(k)| / (|vec(n)| dot |vec(k)|) = 4 / (sqrt(8^2 + 4^2 + 4^2) dot 1) = 4 / sqrt(96) = 1 / sqrt(6) approx 0.4082. $
      Suy ra $theta approx 65.9^degree approx 66^degree$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một vệ tinh nhân tạo chuyển động quanh Trái Đất theo một quỹ đạo tròn. Trong hệ tọa độ $O x y z$, tâm Trái Đất trùng với gốc tọa độ $O$, mặt phẳng xích đạo trùng với mặt phẳng $O x y$. Tại hai thời điểm khác nhau, vệ tinh có các vectơ vị trí lần lượt là $vec(r)_1 = (1; 2; 2)$ và $vec(r)_2 = (-2; 1; 2)$ (đơn vị: nghìn km). Xác định góc nghiêng $i$ của mặt phẳng quỹ đạo vệ tinh so với mặt phẳng xích đạo Trái Đất (làm tròn đến hàng phần mười của độ).],
  (
    [$35.3^degree$],
    [$45.0^degree$],
    True([$51.7^degree$]),
    [$60.0^degree$],
  ),
  loigiai: [
    #step[Mặt phẳng quỹ đạo của vệ tinh đi qua tâm Trái Đất $O$ và hai vị trí $vec(r)_1$, $vec(r)_2$ có pháp vectơ là tích có hướng của chúng:
      $ vec(n) = [vec(r)_1, vec(r)_2] = (det mat(2, 2; 1, 2); det mat(2, 1; 2, -2); det mat(1, 2; -2, 1)) = (2; -6; 5). $]
    #step[Mặt phẳng xích đạo $(O x y)$ có pháp vectơ là $vec(k) = (0; 0; 1)$.]
    #step[Góc nghiêng $i$ giữa mặt phẳng quỹ đạo và mặt phẳng xích đạo thỏa mãn:
      $ cos(i) = |vec(n) dot vec(k)| / (|vec(n)| dot |vec(k)|) = 5 / (sqrt(2^2 + (-6)^2 + 5^2) dot 1) = 5 / sqrt(65) approx 0.62017. $
      Suy ra $i approx 51.67^degree approx 51.7^degree$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một cánh tay robot đào hầm lò có khớp xoay đặt tại điểm $O(0; 0; 0)$. Mũi khoan ở đầu cánh tay robot tại điểm $A(1; 2; 2)$ chịu một lực cản từ đá cứng có vectơ lực $vec(F) = (10; 20; -30) "N"$. Vectơ mô-men lực cản tác dụng lên khớp xoay $O$ của cánh tay robot là:],
  (
    True([$(-100; 50; 0)$]),
    [$(100; -50; 0)$],
    [$(-100; 50; 50)$],
    [$(50; -100; 0)$],
  ),
  loigiai: [
    #step[Vectơ vị trí từ khớp xoay $O$ đến điểm tác dụng lực $A$ là:
      $ vec(r) = vec(O A) = (1; 2; 2). $]
    #step[Vectơ mô-men lực tác dụng lên khớp xoay $O$ được tính bằng công thức tích có hướng:
      $ vec(M) = [vec(r), vec(F)]. $]
    #step[Thay các tọa độ $vec(r) = (1; 2; 2)$ và $vec(F) = (10; 20; -30)$ vào biểu thức:
      $ vec(M) &= (det mat(2, 2; 20, -30); det mat(2, 1; -30, 10); det mat(1, 2; 10, 20)) \
              &= (2 dot (-30) - 2 dot 20; 2 dot 10 - 1 dot (-30); 1 dot 20 - 2 dot 10) \
              &= (-100; 50; 0). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hình bình hành $A B C D$ có $A(1; 0; 1)$, $B(2; 1; 2)$ và tâm của hình bình hành là $I(2; 0; 1)$. Diện tích $S$ của hình bình hành $A B C D$ bằng:],
  (
    [$S = sqrt(2)$],
    [$S = 2$],
    True([$S = 2 sqrt(2)$]),
    [$S = 4$],
  ),
  loigiai: [
    #step[Vì $I(2; 0; 1)$ là tâm của hình bình hành $A B C D$, nên $I$ là trung điểm của đường chéo $A C$.
      Tọa độ điểm $C$ là:
      $ C = 2 I - A = (3; 0; 1). $]
    #step[Xác định các vectơ cạnh và đường chéo chung đỉnh $A$:
      $ vec(A B) = (1; 1; 1), quad vec(A C) = (2; 0; 0). $]
    #step[Tính tích có hướng của hai vectơ này:
      $ [vec(A B), vec(A C)] = (det mat(1, 1; 0, 0); det mat(1, 1; 0, 2); det mat(1, 1; 2, 0)) = (0; 2; -2). $]
    #step[Diện tích hình bình hành $A B C D$ bằng độ lớn tích có hướng của hai vectơ cạnh kề:
      $ S = |[vec(A B), vec(A C)]| = sqrt(0^2 + 2^2 + (-2)^2) = sqrt(8) = 2 sqrt(2). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hình chóp tứ giác đều $S. A B C D$ có đỉnh $S(0; 0; sqrt(2))$ và các đỉnh đáy lần lượt là $A(1; -1; 0)$, $B(1; 1; 0)$, $C(-1; 1; 0)$ và $D(-1; -1; 0)$. Cosin của góc giữa hai mặt bên kề nhau $(S A B)$ và $(S A D)$ bằng:],
  (
    [$1/2$],
    True([$1/3$]),
    [$2/3$],
    [$sqrt(3)/3$],
  ),
  loigiai: [
    #step[Tính các vectơ cạnh bên chung đỉnh $S$:
      $ vec(S A) = (1; -1; -sqrt(2)), quad vec(S B) = (1; 1; -sqrt(2)), quad vec(S D) = (-1; -1; -sqrt(2)). $]
    #step[Tính vectơ pháp tuyến của mặt bên $(S A B)$:
      $ vec(n)_1 = [vec(S A), vec(S B)] = (det mat(-1, -sqrt(2); 1, -sqrt(2)); det mat(-sqrt(2), 1; -sqrt(2), 1); det mat(1, -1; 1, 1)) = (2 sqrt(2); 0; 2). $
      Chọn vectơ pháp tuyến rút gọn là $vec(n)_1 = (sqrt(2); 0; 1)$.]
    #step[Tính vectơ pháp tuyến của mặt bên $(S A D)$:
      $ vec(n)_2 = [vec(S A), vec(S D)] = (det mat(-1, -sqrt(2); -1, -sqrt(2)); det mat(-sqrt(2), 1; -sqrt(2), -1); det mat(1, -1; -1, -1)) = (0; 2 sqrt(2); -2). $
      Chọn vectơ pháp tuyến rút gọn là $vec(n)_2 = (0; sqrt(2); -1)$.]
    #step[Cosin của góc $theta$ giữa hai mặt phẳng $(S A B)$ và $(S A D)$ được tính theo công thức:
      $ cos(theta) = |vec(n)_1 dot vec(n)_2| / (|vec(n)_1| dot |vec(n)_2|) = |sqrt(2) dot 0 + 0 dot sqrt(2) + 1 dot (-1)| / (sqrt((sqrt(2))^2 + 1^2) dot sqrt((sqrt(2))^2 + (-1)^2)) = 1 / (sqrt(3) dot sqrt(3)) = 1/3. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một kết cấu giàn thép không gian có hình chóp tam giác $S. A B C$ với ba nút liên kết ở mặt đất có tọa độ là $A(4; 0; 0)$, $B(0; 4; 0)$ và $C(0; 0; 4)$ (đơn vị: mét). Đỉnh giàn $S(x; y; z)$ nằm cách đều ba nút đáy $A, B, C$ và khối giàn $S. A B C$ có thể tích bằng $32/3 "m"^3$. Khoảng cách từ đỉnh $S$ đến mặt phẳng nằm ngang $O x y$ (biết cao độ $z$ của $S$ dương) là:],
  (
    [$4/3 "m"$],
    [$2 "m"$],
    True([$8/3 "m"$]),
    [$4 "m"$],
  ),
  loigiai: [
    #step[Vì $S(x; y; z)$ cách đều ba đỉnh $A, B, C$ nên hình chiếu của $S$ trên mặt phẳng $(A B C)$ trùng với tâm đường tròn ngoại tiếp $H$ của tam giác $A B C$.
      Do $A(4; 0; 0)$, $B(0; 4; 0)$, $C(0; 0; 4)$ tạo thành tam giác đều nên tâm ngoại tiếp $H$ trùng với trọng tâm của tam giác $A B C$:
      $ H = ( (4 + 0 + 0)/3; (0 + 4 + 0)/3; (0 + 0 + 4)/3 ) = (4/3; 4/3; 4/3). $]
    #step[Diện tích đáy tam giác $A B C$ tính qua tích có hướng của $vec(A B) = (-4; 4; 0)$ và $vec(A C) = (-4; 0; 4)$:
      $ [vec(A B), vec(A C)] = (16; 16; 16) => S_(Delta A B C) = 1/2 |[vec(A B), vec(A C)]| = 1/2 dot 16 sqrt(3) = 8 sqrt(3) "m"^2. $]
    #step[Thể tích khối chóp $S. A B C$ được tính bởi công thức:
      $ V = 1/3 dot S_(Delta A B C) dot S H => 32/3 = 1/3 dot 8 sqrt(3) dot S H => S H = 4 / sqrt(3) "m". $]
    #step[Mặt phẳng $(A B C)$ có phương trình đoạn chắn là:
      $ x/4 + y/4 + z/4 = 1 <=> x + y + z - 4 = 0. $
      Đỉnh $S$ nằm trên đường thẳng đi qua $H(4/3; 4/3; 4/3)$ vuông góc với $(A B C)$ (có vectơ pháp tuyến $vec(n) = (1; 1; 1)$). Tọa độ của $S$ có dạng:
      $ S = H + t dot vec(n) / |vec(n)| = (4/3 + t / sqrt(3); 4/3 + t / sqrt(3); 4/3 + t / sqrt(3)). $
      Độ dài đoạn $S H = |t| = 4/sqrt(3)$.
      Vì cao độ $z$ của $S$ dương nên chọn $t = 4/sqrt(3) > 0$.
      Khi đó cao độ của $S$ là:
      $ z_S = 4/3 + (4/sqrt(3)) / sqrt(3) = 4/3 + 4/3 = 8/3 "m". $
      Do đó khoảng cách từ đỉnh $S$ đến mặt phẳng $O x y$ (chính là cao độ $z_S$) bằng $8/3 "m".$]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một tấm pin năng lượng mặt trời phẳng hình tam giác $M N P$ được lắp trên mui của một con tàu chở khách du lịch với tọa độ các đỉnh là $M(1; 1; 1)$, $N(3; 0; 2)$ và $P(1; 3; -1)$ (đơn vị: mét). Trục tia sáng mặt trời chiếu vuông góc với tấm pin. Vectơ nào sau đây là một vectơ chỉ phương của tia sáng đó?],
  (
    [$(1; 1; 0)$],
    True([$(0; 1; 1)$]),
    [$(0; 1; -1)$],
    [$(1; 0; 1)$],
  ),
  loigiai: [
    #step[Vectơ chỉ phương của tia sáng mặt trời vuông góc với tấm pin $M N P$ chính là vectơ pháp tuyến của mặt phẳng $(M N P)$.]
    #step[Tính các vectơ cạnh:
      $ vec(M N) = (2; -1; 1), quad vec(M P) = (0; 2; -2). $]
    #step[Vectơ pháp tuyến của mặt phẳng $(M N P)$ song song với tích có hướng:
      $ [vec(M N), vec(M P)] = (det mat(-1, 1; 2, -2); det mat(1, 2; -2, 0); det mat(2, -1; 0, 2)) = (0; 4; 4) = 4(0; 1; 1). $]
    #step[Do đó, một vectơ chỉ phương của tia sáng mặt trời là $(0; 1; 1)$ (hoặc bất kỳ vectơ nào cùng phương với nó).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hình lăng trụ đứng $A B C . A' B' C'$ có đáy $A B C$ là tam giác vuông tại $A$ với $A(0; 0; 0)$, $B(2; 0; 0)$, $C(0; 4; 0)$ và đỉnh $A'(0; 0; 3)$. Một mặt phẳng $(P)$ đi qua $A$ và trung điểm $M$ của $B B'$, đồng thời song song với đường thẳng $B C'$. Vectơ pháp tuyến của mặt phẳng $(P)$ là:],
  (
    [$(6; 9; 8)$],
    True([$(6; 9; -8)$]),
    [$(3; 4; -5)$],
    [$(2; 3; -4)$],
  ),
  loigiai: [
    #step[Tọa độ các đỉnh: $B'(2; 0; 3)$, $C'(0; 4; 3)$.
      Vì $M$ là trung điểm của $B B'$ nên tọa độ $M(2; 0; 1.5)$.]
    #step[Mặt phẳng $(P)$ chứa các điểm $A(0; 0; 0)$ và $M$ nên chứa vectơ $vec(A M) = (2; 0; 1.5)$.
      Đường thẳng $B C'$ có vectơ chỉ phương $vec(B C') = (-2; 4; 3)$.]
    #step[Do mặt phẳng $(P)$ song song với đường thẳng $B C'$, nên vectơ pháp tuyến $vec(n)$ của $(P)$ phải vuông góc với cả $vec(A M)$ và $vec(B C')$.
      Tích có hướng của $2 vec(A M) = (4; 0; 3)$ và $vec(B C') = (-2; 4; 3)$ là:
      $ vec(n)' = [(4; 0; 3), vec(B C')] = (det mat(0, 3; 4, 3); det mat(3, 4; 3, -2); det mat(4, 0; -2, 4)) = (-12; -18; 16) = -2(6; 9; -8). $]
    #step[Do đó, vectơ pháp tuyến của mặt phẳng $(P)$ cùng phương với $(6; 9; -8)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hình chóp $S. A B C D$ có đáy $A B C D$ là hình bình hành với ba đỉnh đáy lần lượt là $A(1; 0; 0)$, $B(2; 1; -1)$, $C(0; 2; 1)$ và đỉnh $S(3; 3; 5)$. Thể tích $V$ của khối chóp $S. A B C D$ bằng:],
  (
    [$V = 3$],
    [$V = 5$],
    True([$V = 7$]),
    [$V = 21$],
  ),
  loigiai: [
    #step[Vì $A B C D$ là hình bình hành nên vectơ cạnh $vec(A D)$ bằng vectơ cạnh $vec(B C)$:
      $ vec(A D) = vec(B C) = (0 - 2; 2 - 1; 1 - (-1)) = (-2; 1; 2). $]
    #step[Xác định các vectơ chung đỉnh $A$:
      $ vec(A B) = (1; 1; -1), quad vec(A S) = (2; 3; 5). $]
    #step[Tính tích có hướng của hai vectơ cạnh đáy $vec(A B)$ và $vec(A D)$:
      $ [vec(A B), vec(A D)] = (det mat(1, -1; 1, 2); det mat(-1, 1; 2, -2); det mat(1, 1; -2, 1)) = (3; 0; 3). $]
    #step[Thể tích khối chóp $S. A B C D$ được tính qua tích hỗn tạp của ba vectơ $vec(A B), vec(A D)$ và $vec(A S)$:
      $ V = 1/3 |[vec(A B), vec(A D)] dot vec(A S)| = 1/3 |3 dot 2 + 0 dot 3 + 3 dot 5| = 1/3 |6 + 15| = 7. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hình chóp $S. A B C D$ có đáy $A B C D$ là hình bình hành. Biết $A(1; 0; 0)$, $B(2; 1; -1)$, $D(0; 2; 1)$ và đỉnh $S(1; 1; 3)$. Tính thể tích $V$ của khối chóp $S. A B C D$.],
  (
    [$V = 9$],
    True([$V = 3$]),
    [$V = 1$],
    [$V = 6$],
  ),
  loigiai: [
    #step[Tính các vectơ chung đỉnh $A$:
      $ vec(A B) = (2-1; 1-0; -1-0) = (1; 1; -1). $
      $ vec(A D) = (0-1; 2-0; 1-0) = (-1; 2; 1). $
      $ vec(A S) = (1-1; 1-0; 3-0) = (0; 1; 3). $]
    #step[Tính tích có hướng của hai vectơ cạnh đáy $vec(A B)$ và $vec(A D)$:
      $ [vec(A B), vec(A D)] = (det mat(1, -1; 2, 1); det mat(-1, 1; 1, -1); det mat(1, 1; -1, 2)) = (3; 0; 3). $]
    #step[Thể tích khối chóp $S. A B C D$ (đáy là hình bình hành) được tính bởi công thức:
      $ V = 1/3 |[vec(A B), vec(A D)] dot vec(A S)| = 1/3 |3(0) + 0(1) + 3(3)| = 1/3 dot 9 = 3. $]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (13 câu)], count: 13)

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho hai vectơ $vec(u) = (1; 1; 0)$ và $vec(v) = (0; 1; 1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tích có hướng của $vec(u)$ và $vec(v)$ là $[vec(u), vec(v)] = (1; -1; 1)$.]),
    True([Vectơ $[vec(u), vec(v)]$ vuông góc với vectơ $vec(u) - vec(v)$.]),
    [Độ dài của vectơ $[vec(u), vec(v)]$ bằng $sqrt(2)$.],
    [Góc giữa hai vectơ $vec(u)$ và $vec(v)$ bằng $120^degree$.],
  ),
  
  loigiai: [
    #step[a) Đúng, $[vec(u), vec(v)] = (1 dot 1 - 0 dot 1; 0 dot 0 - 1 dot 1; 1 dot 1 - 1 dot 0) = (1; -1; 1)$.]
    #step[b) Đúng, vì tích có hướng $[vec(u), vec(v)]$ vuông góc với cả $vec(u)$ và $vec(v)$, nên nó vuông góc với mọi tổ hợp tuyến tính của hai vectơ này, trong đó có $vec(u) - vec(v)$.]
    #step[c) Sai, vì độ dài là $|[vec(u), vec(v)]| = sqrt(1^2 + (-1)^2 + 1^2) = sqrt(3) != sqrt(2)$.]
    #step[d) Sai, vì $cos(vec(u), vec(v)) = frac(1 dot 0 + 1 dot 1 + 0 dot 1, sqrt(2) dot sqrt(2)) = 1/2 =>$ góc giữa hai vectơ là $60^degree$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho bốn điểm $A(1; 0; 1)$, $B(0; 2; 1)$, $C(1; 1; 0)$ và $D(1; 1; 1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Ba điểm $A, B, C$ không thẳng hàng.]),
    [Bốn điểm $A, B, C, D$ tạo thành một hình chữ nhật.],
    True([Thể tích khối tứ diện $A B C D$ bằng $1/6$.]),
    True([Hình chiếu vuông góc của $D$ trên mặt phẳng $(A B C)$ trùng với trọng tâm tam giác $A B C$.]),
  ),
  
  loigiai: [
    #step[a) Đúng, vì $vec(A B) = (-1; 2; 0)$ và $vec(A C) = (0; 1; -1)$ không cùng phương.]
    #step[b) Sai, vì bốn điểm này không đồng phẳng.]
    #step[c) Đúng, ta có $vec(A D) = (0; 1; 0)$. $[vec(A B), vec(A C)] = (-2; -1; -1)$.
      Tích hỗn tạp: $[vec(A B), vec(A C)] dot vec(A D) = -1$.
      Thể tích tứ diện: $V = frac(1, 6) |-1| = frac(1, 6)$.]
    #step[d) Đúng, vì ta có $D A = D B = D C = sqrt(1) = 1$, suy ra hình chóp $D . A B C$ là hình chóp đều, hình chiếu của đỉnh $D$ trùng với tâm đường tròn ngoại tiếp của đáy $A B C$. Vì đáy $A B C$ là tam giác đều ($A B = B C = C A = sqrt(5)$) nên tâm ngoại tiếp trùng với trọng tâm.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 1; 1)$, $B(2; 3; 4)$, $C(3; 5; 7)$ và điểm $M$ di động trên trục $O z$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Ba điểm $A, B, C$ thẳng hàng.]),
    True([Diện tích tam giác $A B C$ bằng $0$.]),
    True([Điểm $M$ thuộc trục $O z$ nên có tọa độ dạng $M(0; 0; z)$ với $z in RR$.]),
    True([Độ dài của vectơ tích có hướng $[vec(M A), vec(M B)]$ đạt giá trị nhỏ nhất khi cao độ $z$ của điểm $M$ bằng $-4/5$.]),
  ),
  loigiai: [
    #step[a) Đúng, ta có: $vec(A B) = (1; 2; 3)$ và $vec(A C) = (2; 4; 6)$. Nhận thấy $vec(A C) = 2 vec(A B)$, do đó hai vectơ này cùng phương, dẫn tới ba điểm $A, B, C$ thẳng hàng.]
    #step[b) Đúng, vì ba điểm $A, B, C$ thẳng hàng nên diện tích tam giác $A B C$ bằng $0$.
      Công thức: $S_(Delta A B C) = 1/2 |[vec(A B), vec(A C)]| = 1/2 |vec(0)| = 0$.]
    #step[c) Đúng, điểm thuộc trục cao $O z$ luôn có hoành độ và tung độ bằng $0$, tức là $M(0; 0; z)$.]
    #step[d) Đúng. Ta có $vec(M A) = (1; 1; 1 - z)$ và $vec(M B) = (2; 3; 4 - z)$.
      Tính tích có hướng $[vec(M A), vec(M B)]$:
      $ [vec(M A), vec(M B)] &= (1(4-z) - 3(1-z); 2(1-z) - 1(4-z); 1 dot 3 - 1 dot 2) \
                             &= (2z + 1; -z - 2; 1). $]
    #step[Độ dài bình phương của tích có hướng là:
      $ f(z) = |[vec(M A), vec(M B)]|^2 = (2z + 1)^2 + (-z - 2)^2 + 1^2 = 5z^2 + 8z + 6. $
      Đây là tam thức bậc hai đạt giá trị nhỏ nhất tại đỉnh parabol:
      $ z = -b / (2a) = -8 / (2 dot 5) = -4/5. $
      Do đó độ dài đạt giá trị nhỏ nhất khi $z = -4/5$.]
  ],
))

#q-wrap(dir: "doc", ds(
  [Một cấu kiện bê tông cốt thép có dạng hình chóp tam giác đều $S. A B C$ được mô tả trong hệ tọa độ $O x y z$ với đáy $A B C$ nằm trên mặt phẳng $O x y$ và đỉnh $S$ thẳng đứng phía trên. Cho biết tọa độ ba đỉnh đáy là $A(3; 0; 0)$, $B(0; 3 sqrt(3); 0)$, $C(-3; 0; 0)$ và đỉnh $S(0; sqrt(3); 6)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Diện tích mặt đáy $A B C$ bằng $9 sqrt(3)$.]),
    True([Hình chiếu vuông góc của đỉnh $S$ trên mặt đáy là điểm $H(0; sqrt(3); 0)$.]),
    True([Thể tích của khối chóp $S. A B C$ bằng $18 sqrt(3)$.]),
    True([Một thiết diện phẳng đi qua trung điểm của các cạnh $S A, S B, S C$ chia khối chóp thành hai phần, phần phía trên chứa đỉnh $S$ có thể tích bằng $frac(9 sqrt(3), 4)$.]),
  ),
  loigiai: [
    #step[a) Đúng. Ta có $vec(A B) = (-3; 3 sqrt(3); 0)$ và $vec(A C) = (-6; 0; 0)$.
      Tích có hướng của hai vectơ này:
      $ [vec(A B), vec(A C)] = (0; 0; 18 sqrt(3)). $
      Diện tích tam giác đáy $S_(Delta A B C) = 1/2 |[vec(A B), vec(A C)]| = 9 sqrt(3)$.]
    #step[b) Đúng. Vì đáy nằm trên mặt phẳng $O x y$ ($z = 0$) và hình chiếu vuông góc $H$ của $S(0; sqrt(3); 6)$ xuống mặt phẳng đáy có cao độ bằng $0$, nên tọa độ $H$ là $(0; sqrt(3); 0)$.]
    #step[c) Đúng. Khoảng cách từ đỉnh $S$ đến đáy bằng độ dài đường cao $S H = 6$.
      Thể tích hình chóp:
      $ V = 1/3 dot S_(Delta A B C) dot S H = 1/3 dot 9 sqrt(3) dot 6 = 18 sqrt(3). $]
    #step[d) Đúng. Thiết diện đi qua trung điểm ba cạnh của hình chóp $S. A B C$ là tam giác $A' B' C'$ đồng dạng với tam giác đáy $A B C$ theo tỉ số $k = 1/2$.
      Khi đó hình chóp nhỏ $S. A' B' C'$ có thể tích bằng:
      $ V_(S. A' B' C') = k^3 V_(S. A B C) = (1/2)^3 dot 18 sqrt(3) = 18 sqrt(3) / 8 = 9 sqrt(3) / 4. $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một cẩu trục tháp bến cảng được mô tả trong hệ tọa độ $O x y z$ với trụ đứng đi qua gốc tọa độ $O(0; 0; 0)$, cần trục nằm ngang quay quanh trục đứng này. Hai tàu hàng neo đậu tại vị trí $A(2; 1; 0)$ và $B(4; 5; 0)$ (đơn vị tọa độ tương ứng với chục mét). Cẩu trục xoay cần trục đến vị trí điểm $C(x; y; 5)$ để kéo thùng hàng lên cao. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tích có hướng $[vec(O A), vec(O B)] = (0; 0; 6)$ (đơn vị: trăm mét vuông).]),
    True([Diện tích tam giác đáy $O A B$ bằng $300 "m"^2$.]),
    True([Thể tích của khối chóp $C. O A B$ không phụ thuộc vào vị trí của điểm $C$ trên mặt phẳng $z = 5$.]),
    True([Thể tích khối tứ diện $C. O A B$ bằng $5$ (đơn vị thể tích trên hệ tọa độ) tức là $5000 "m"^3$.]),
  ),
  loigiai: [
    #step[a) Đúng, ta có: $vec(O A) = (2; 1; 0)$ và $vec(O B) = (4; 5; 0)$.
      Tích có hướng của chúng bằng:
      $ [vec(O A), vec(O B)] = (1 dot 0 - 0 dot 5; 0 dot 4 - 2 dot 0; 2 dot 5 - 1 dot 4) = (0; 0; 6). $
      Đơn vị trên mỗi trục là chục mét ($10 "m"$), nên đơn vị của tích có hướng là $(10 "m")^2 = 100 "m"^2$ (trăm mét vuông).]
    #step[b) Đúng, diện tích tam giác đáy $O A B$ trên hệ tọa độ là:
      $ S_(Delta O A B) = 1/2 |[vec(O A), vec(O B)]| = 1/2 dot 6 = 3. $
      Diện tích thực tế của tam giác đáy là:
      $ S_("thực tế") = 3 dot 100 "m"^2 = 300 "m"^2$. ]
    #step[c) Đúng, vì mặt phẳng chứa đáy $O A B$ là mặt phẳng đất $z = 0$, còn điểm $C(x; y; 5)$ thuộc mặt phẳng $z = 5$ luôn cách mặt đất một khoảng cố định bằng $5$. Thể tích khối chóp chỉ phụ thuộc diện tích đáy cố định và chiều cao không đổi bằng $5$.]
    #step[d) Đúng, thể tích khối chóp trên hệ tọa độ là:
      $ V = 1/3 dot S_(Delta O A B) dot h = 1/3 dot 3 dot 5 = 5. $
      Đơn vị thể tích trên hệ tọa độ là $(10 "m")^3 = 1000 "m"^3$, nên thể tích thực tế là:
      $ V_("thực tế") = 5 dot 1000 "m"^3 = 5000 "m"^3$. ]
  ],
))

#q-wrap(dir: "doc", ds(
  [Một bể nước ngầm dạng hình hộp chữ nhật $A B C D . A' B' C' D'$ được xây dựng dưới lòng đất. Trong hệ tọa độ $O x y z$, ta có bốn đỉnh đáy là $A(0; 0; 0)$, $B(4; 0; 0)$, $D(0; 3; 0)$ và đỉnh phía trên là $A'(0; 0; 2)$ (đơn vị đo là mét). Bể chứa nước đến độ cao bằng một nửa chiều cao của bể. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Thể tích toàn bộ bể nước bằng $24 "m"^3$.]),
    True([Thiết diện phẳng đi qua ba điểm $A, C', B$ chia bể nước thành hai phần có thể tích bằng nhau.]),
    True([Thể tích khối tứ diện $A B C' D$ bằng $4 "m"^3$.]),
    True([Thể tích phần nước có trong bể lúc này bằng $12 "m"^3$.]),
  ),
  loigiai: [
    #step[a) Đúng, hình hộp chữ nhật $A B C D . A' B' C' D'$ có ba cạnh chung đỉnh $A$ là $A B = 4 "m"$, $A D = 3 "m"$, $A A' = 2 "m"$.
      Thể tích của bể là:
      $ V = A B dot A D dot A A' = 4 dot 3 dot 2 = 24 "m"^3. $]
    #step[b) Đúng, mặt phẳng đi qua $A$, $C'$ và $B$ chứa cạnh đáy $A B$. Vì $C'$ thuộc đáy đối diện $A' B' C' D'$ và $C' D'$ song song với $A B$, nên mặt phẳng này cũng chứa cạnh $D' C'$. Thiết diện phẳng là hình chữ nhật $A B C' D'$, đây là mặt chéo chia đôi hình hộp thành hai lăng trụ đứng có thể tích bằng nhau ($12 "m"^3$ mỗi phần).]
    #step[c) Đúng. Vectơ tọa độ các điểm: $A(0; 0; 0)$, $B(4; 0; 0)$, $D(0; 3; 0)$, $C'(4; 3; 2)$.
      Ta có $vec(A B) = (4; 0; 0)$, $vec(A D) = (0; 3; 0)$ và $vec(A C') = (4; 3; 2)$.
      Tích hỗn tạp:
      $ [vec(A B), vec(A D)] dot vec(A C') = (0; 0; 12) dot (4; 3; 2) = 24. $
      Thể tích tứ diện $A B C' D$ là:
      $ V_(A B C' D) = 1/6 |[vec(A B), vec(A D)] dot vec(A C')| = 24 / 6 = 4 "m"^3. $]
    #step[d) Đúng, vì bể nước dạng hình hộp đứng chứa nước đến một nửa chiều cao nên thể tích nước bằng một nửa thể tích bể:
      $ V_("nước") = V / 2 = 24 / 2 = 12 "m"^3. $]
  ],
))

#q-wrap(dir: "doc", ds(
  [Một vệ tinh địa tĩnh $S$ phát sóng vô tuyến phủ sóng một khu vực tam giác trên mặt đất $A B C$. Trong hệ tọa độ $O x y z$, mặt đất trùng với mặt phẳng $O x y$. Các trạm thu phát trên mặt đất đặt tại $A(2; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 0)$ và vệ tinh $S(1; 1; 3)$ (đơn vị tọa độ tương ứng với nghìn km). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Diện tích của khu vực tam giác phủ sóng $A B C$ trên mặt đất bằng $2$ triệu $"km"^2$.]),
    [Vectơ pháp tuyến của mặt phẳng phát sóng $(S A B)$ là $vec(n) = (3; 3; 2)$.],
    True([Thể tích của khối hình chóp ảo $S. A B C$ giới hạn bởi chùm sóng từ vệ tinh đến mặt đất bằng $2$ tỷ $"km"^3$.]),
    True([Chiều cao thực tế từ vệ tinh $S$ đến mặt đất (mặt phẳng $O x y$) là $3000 "km"$.]),
  ),
  loigiai: [
    #step[a) Đúng, ta có: $vec(C A) = (2; 0; 0)$, $vec(C B) = (0; 2; 0)$.
      Tích có hướng: $[vec(C A), vec(C B)] = (0; 0; 4)$.
      Diện tích tam giác đáy trên hệ tọa độ:
      $ S_(Delta A B C) = 1/2 |[vec(C A), vec(C B)]| = 1/2 dot 4 = 2. $
      Vì $1$ đơn vị độ dài là $1000 "km"$, nên $1$ đơn vị diện tích là $(1000 "km")^2 = 1.000.000 "km"^2$ (1 triệu $"km"^2$).
      Vậy diện tích thực tế là $2$ triệu $"km"^2$.]
    #step[b) Sai, ta có $vec(A B) = (-2; 2; 0)$ và $vec(A S) = (-1; 1; 3)$.
      Vectơ pháp tuyến của mặt phẳng $(S A B)$ song song với tích có hướng:
      $ [vec(A B), vec(A S)] = (2 dot 3 - 0 dot 1; 0 dot (-1) - (-2) dot 3; -2 dot 1 - 2 dot (-1)) = (6; 6; 0) = 6(1; 1; 0). $
      Do đó pháp vectơ của $(S A B)$ phải cùng phương với $(1; 1; 0)$, trong khi $(3; 3; 2)$ không cùng phương vì có thành phần cao độ bằng $2$.]
    #step[c) Đúng, thể tích khối chóp ảo $S. A B C$ trên hệ tọa độ là:
      $ V = 1/3 dot S_(Delta A B C) dot z_S = 1/3 dot 2 dot 3 = 2. $
      Vì $1$ đơn vị độ dài là $1000 "km"$, nên $1$ đơn vị thể tích là $(1000 "km")^3 = 10^9 "km"^3$ (1 tỷ $"km"^3$).
      Vậy thể tích thực tế là $2$ tỷ $"km"^3$.]
    #step[d) Đúng, cao độ của vệ tinh $S(1; 1; 3)$ là $3$. Do đáy nằm trên mặt phẳng $O x y$ nên chiều cao thực tế là $3$ đơn vị độ dài, tương đương $3000 "km"$.]
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hình hộp chữ nhật $A B C D . A' B' C' D'$ có $A(0; 0; 0)$, $B(2; 0; 0)$, $D(0; 4; 0)$ và $A'(0; 0; 3)$. Gọi $M$ là trung điểm của $C C'$ và $N$ là trung điểm của $D D'$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tọa độ của điểm $M$ là $(2; 4; 1.5)$.]),
    True([Vectơ pháp tuyến của mặt phẳng $(A B M)$ có tọa độ là $vec(n) = (0; -3; 8)$.]),
    [Diện tích thiết diện tam giác $A B M$ bằng $5$.],
    True([Ba vectơ $vec(A B), vec(A M), vec(A N)$ đồng phẳng.]),
  ),
  loigiai: [
    #step[a) Đúng. Do $A B C D$ là hình chữ nhật ở mặt phẳng đáy $z = 0$, tọa độ $C(2; 4; 0)$ và đỉnh $C'(2; 4; 3)$.
      Điểm $M$ là trung điểm của $C C'$ nên tọa độ $M(2; 4; 1.5)$.]
    #step[b) Đúng, ta có $vec(A B) = (2; 0; 0)$, $vec(A M) = (2; 4; 1.5)$.
      Vectơ pháp tuyến của $(A B M)$ song song với tích có hướng:
      $ [vec(A B), vec(A M)] = (0; -3; 8). $]
    #step[c) Sai, diện tích tam giác $A B M$ được tính bằng:
      $ S_(Delta A B M) = 1/2 |[vec(A B), vec(A M)]| = 1/2 sqrt(0^2 + (-3)^2 + 8^2) = sqrt(73) / 2 approx 4.27 != 5. $]
    #step[d) Đúng. Trung điểm $N$ của $D D'$ có tọa độ $N(0; 4; 1.5) => vec(A N) = (0; 4; 1.5)$.
      Tính tích hỗn tạp của ba vectơ:
      $ [vec(A B), vec(A M)] dot vec(A N) = (0; -3; 8) dot (0; 4; 1.5) = 0 dot 0 + (-3) dot 4 + 8 dot 1.5 = -12 + 12 = 0. $
      Do tích hỗn tạp bằng $0$ nên ba vectơ này đồng phẳng.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một dòng kênh dẫn nước có mặt cắt ngang dạng hình chữ nhật được mô tả trong hệ tọa độ $O x y z$. Vectơ vận tốc chảy của dòng nước là $vec(v) = (1.5; 1.5; 1.5) "m/s"$. Diện tích cửa xả nước là tam giác $A B C$ với tọa độ các đỉnh là $A(1; 0; 0)$, $B(0; 2; 0)$ và $C(0; 0; 2)$ (đơn vị đo là mét). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ pháp tuyến của mặt phẳng chứa cửa xả $(A B C)$ cùng phương với $vec(n) = (2; 1; 1)$.]),
    True([Diện tích của cửa xả tam giác $A B C$ bằng $sqrt(6) "m"^2$.]),
    True([Tốc độ dòng chảy theo phương vuông góc với cửa xả là $sqrt(6) "m/s"$.]),
    True([Lưu lượng nước $Q$ chảy qua cửa xả nước (tính theo công thức $Q = v_n dot S$) bằng $6 "m"^3"/s"$.]),
  ),
  loigiai: [
    #step[a) Đúng, ta có: $vec(A B) = (-1; 2; 0)$, $vec(A C) = (-1; 0; 2)$.
      Tích có hướng của chúng là:
      $ [vec(A B), vec(A C)] = (det mat(2, 0; 0, 2); det mat(0, -1; 2, -1); det mat(-1, 2; -1, 0)) = (4; 2; 2) = 2(2; 1; 1). $
      Do đó pháp vectơ cùng phương với $vec(n) = (2; 1; 1)$.]
    #step[b) Đúng, diện tích cửa xả là:
      $ S = 1/2 |[vec(A B), vec(A C)]| = 1/2 sqrt(4^2 + 2^2 + 2^2) = 1/2 sqrt(24) = sqrt(6) "m"^2. $]
    #step[c) Đúng, tốc độ dòng chảy theo phương vuông góc là độ dài hình chiếu của $vec(v)$ lên pháp vectơ đơn vị:
      $ v_n = |vec(v) dot vec(n)| / |vec(n)| = |(1.5; 1.5; 1.5) dot (2; 1; 1)| / sqrt(2^2 + 1^2 + 1^2) = |3 + 1.5 + 1.5| / sqrt(6) = 6 / sqrt(6) = sqrt(6) "m/s". $]
    #step[d) Đúng, lưu lượng nước chảy qua cửa xả bằng:
      $ Q = v_n dot S = sqrt(6) dot sqrt(6) = 6 "m"^3"/s". $]
  ],
))

#q-wrap(dir: "doc", ds(
  [Một dầm cầu treo thẳng nằm ngang được neo giữ bởi cáp treo đi qua đỉnh tháp $S(0; 0; 10)$ and điểm neo dầm $A(6; 8; 0)$ (đơn vị: mét). Lực căng của cáp tác dụng lên dầm cầu tại $A$ hướng dọc theo sợi cáp và có độ lớn $F = 50 "kN"$. Trục quay dầm cầu đi qua gốc tọa độ $O(0; 0; 0)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ chỉ phương của sợi cáp treo là $vec(u) = (3; 4; -5)$.]),
    [Vectơ lực căng cáp tác dụng lên điểm $A$ là $vec(F) = (-30; -40; 50)$ (đơn vị: kN).],
    True([Vectơ vị trí từ trục quay $O$ đến điểm đặt lực $A$ là $vec(r) = (6; 8; 0)$.]),
    True([Vectơ mô-men lực quay $vec(M)$ của lực căng cáp đối với tâm quay $O$ cùng phương với vectơ $(4; -3; 0)$.]),
  ),
  loigiai: [
    #step[a) Đúng, vectơ nối từ điểm neo $A$ đến đỉnh tháp $S$ dọc theo cáp là:
      $ vec(A S) = (0 - 6; 0 - 8; 10 - 0) = (-6; -8; 10) = -2(3; 4; -5). $
      Do đó, sợi cáp có vectơ chỉ phương $vec(u) = (3; 4; -5)$.]
    #step[b) Sai, độ dài đoạn $A S$ bằng:
      $ A S = sqrt((-6)^2 + (-8)^2 + 10^2) = sqrt(200) = 10 sqrt(2) "m". $
      Vectơ lực căng là:
      $ vec(F) = F dot vec(A S) / A S = 50 dot (-6; -8; 10) / (10 sqrt(2)) = (-15 sqrt(2); -20 sqrt(2); 25 sqrt(2)) "kN" != (-30; -40; 50). $]
    #step[c) Đúng, vectơ vị trí từ gốc $O$ đến điểm tác dụng lực $A$ chính là vectơ tọa độ của $A$: $vec(r) = vec(O A) = (6; 8; 0)$.]
    #step[d) Đúng, vectơ mô-men lực quay đối với gốc $O$ là:
      $ vec(M) = [vec(r), vec(F)]. $
      Vì $vec(F)$ cùng phương với $vec(A S) = (-6; -8; 10)$, nên $vec(M)$ cùng phương với:
      $ [vec(O A), vec(A S)] = (det mat(8, 0; -8, 10); det mat(0, 6; 10, -6); det mat(6, 8; -6, -8)) = (80; -60; 0) = 20(4; -3; 0). $
      Do đó vectơ mô-men lực quay $vec(M)$ cùng phương với vectơ $(4; -3; 0)$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho ba điểm cố định $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ và điểm $M$ di động trên trục hoành $O x$. Gọi $V$ là thể tích của khối tứ diện $M A B C$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    [Thể tích $V$ của khối tứ diện $M A B C$ đạt giá trị nhỏ nhất bằng $1/3$.],
    True([Khi $M(2; 0; 0)$ thì thể tích khối tứ diện $V = 1$.]),
    True([Khoảng cách từ gốc tọa độ $O$ đến mặt phẳng $(A B C)$ bằng $6/7$.]),
    True([Khi thể tích $V = 2$, điểm $M$ có hoành độ bằng $3$ hoặc $-1$.]),
  ),
  loigiai: [
    #step[a) Sai, điểm $M$ thuộc trục hoành $O x$ nên có tọa độ $M(x; 0; 0)$.
      Các vectơ kết nối:
      $ vec(M A) = (1 - x; 0; 0), quad vec(M B) = (-x; 2; 0), quad vec(M C) = (-x; 0; 3). $
      Tích có hướng của hai vectơ cạnh đáy:
      $ [vec(M B), vec(M C)] = (6; 3x; 2x). $
      Thể tích tứ diện:
      $ V = 1/6 |[vec(M B), vec(M C)] dot vec(M A)| = 1/6 |6(1-x)| = |1 - x|. $
      Thể tích $V$ đạt giá trị nhỏ nhất bằng $0$ khi $x = 1$ (khi đó $M$ trùng với $A$).]
    #step[b) Đúng, khi $M(2; 0; 0) => x = 2$.
      Thể tích tứ diện khi đó là $V = |1 - 2| = 1$.]
    #step[c) Đúng, phương trình mặt phẳng $(A B C)$ theo phương trình đoạn chắn là:
      $ x/1 + y/2 + z/3 = 1 <=> 6x + 3y + 2z - 6 = 0. $
      Khoảng cách từ $O(0; 0; 0)$ đến mặt phẳng $(A B C)$ bằng:
      $ d(O, (A B C)) = |-6| / sqrt(6^2 + 3^2 + 2^2) = 6 / sqrt(49) = 6/7. $]
    #step[d) Đúng, khi $V = 2 => |1 - x| = 2 => 1 - x = 2$ hoặc $1 - x = -2 => x = -1$ hoặc $x = 3$.]
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho hình lăng trụ đứng $A B C . A' B' C'$ có đáy $A B C$ là tam giác đều cạnh bằng $2$. Trong hệ tọa độ $O x y z$, đặt đỉnh $A$ trùng với gốc tọa độ $O(0; 0; 0)$, các đỉnh lần lượt là $A(0; 0; 0)$, $B(2; 0; 0)$, $C(1; sqrt(3); 0)$ và $A'(0; 0; 4)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Thể tích của hình lăng trụ $A B C . A' B' C'$ bằng $4 sqrt(3)$.]),
    [Thiết diện của hình lăng trụ cắt bởi mặt phẳng $(A B C')$ là tam giác đều.],
    True([Vectơ pháp tuyến của mặt phẳng $(A B C')$ cùng phương với $vec(n) = (0; -4; sqrt(3))$.]),
    [Diện tích thiết diện tam giác $A B C'$ bằng $2 sqrt(19)$.],
  ),
  loigiai: [
    #step[a) Đúng, diện tích đáy tam giác đều $A B C$ cạnh bằng $2$ là:
      $ S_(Delta A B C) = sqrt(3)/4 dot 2^2 = sqrt(3). $
      Chiều cao lăng trụ là độ dài đoạn $A A' = 4$. Thể tích hình lăng trụ bằng:
      $ V = S_(Delta A B C) dot h = 4 sqrt(3). $]
    #step[b) Sai, tọa độ của $C'$ là $(1; sqrt(3); 4)$. Độ dài các cạnh thiết diện là:
      $ A B = 2. $
      $ A C' = sqrt(1^2 + (sqrt(3))^2 + 4^2) = sqrt(20) = 2 sqrt(5). $
      $ B C' = sqrt((1-2)^2 + (sqrt(3))^2 + 4^2) = sqrt(20) = 2 sqrt(5). $
      Vì $A C' = B C' = 2 sqrt(5) != A B$ nên tam giác $A B C'$ cân tại $C'$ chứ không đều.]
    #step[c) Đúng, ta có $vec(A B) = (2; 0; 0)$, $vec(A C') = (1; sqrt(3); 4)$.
      Vectơ pháp tuyến của mặt phẳng $(A B C')$ là:
      $ [vec(A B), vec(A C')] = (det mat(0, 0; sqrt(3), 4); det mat(0, 2; 4, 1); det mat(2, 0; 1, sqrt(3))) = (0; -8; 2 sqrt(3)) = 2(0; -4; sqrt(3)). $]
    #step[d) Sai, diện tích thiết diện tam giác $A B C'$ là:
      $ S = 1/2 |[vec(A B), vec(A C')]| = sqrt(0^2 + (-4)^2 + (sqrt(3))^2) = sqrt(19) != 2 sqrt(19). $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho bốn điểm $A(1; 0; 0)$, $B(0; 1; 2)$, $C(2; -1; 1)$ và $D(x_D; y_D; z_D)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ tích có hướng $[vec(A B), vec(A C)] = (3; 3; 0)$.]),
    [Ba điểm $A, B, C$ thẳng hàng.],
    True([Diện tích tam giác $A B C$ bằng $(3 sqrt(2))/2$.]),
    True([Nếu $D(1; 1; z_D)$, không tồn tại giá trị nào của $z_D$ để bốn điểm $A, B, C, D$ đồng phẳng.]),
  ),
  loigiai: [
    #step[a) Đúng. Ta có $vec(A B) = (-1; 1; 2)$, $vec(A C) = (1; -1; 1)$.
      Tích có hướng:
      $ [vec(A B), vec(A C)] = (det mat(1, 2; -1, 1); det mat(2, -1; 1, 1); det mat(-1, 1; 1, -1)) = (3; 3; 0). $]
    #step[b) Sai. Vì tích có hướng $[vec(A B), vec(A C)] = (3; 3; 0) != vec(0)$ nên ba điểm $A, B, C$ không thẳng hàng.]
    #step[c) Đúng. Diện tích tam giác $A B C$ là:
      $ S_(Delta A B C) = 1/2 |[vec(A B), vec(A C)]| = 1/2 sqrt(3^2 + 3^2 + 0^2) = (3 sqrt(2))/2. $]
    #step[d) Đúng. Ta có $vec(A D) = (0; 1; z_D)$. Bốn điểm $A, B, C, D$ đồng phẳng khi và chỉ khi:
      $ [vec(A B), vec(A C)] dot vec(A D) = 0 <=> (3; 3; 0) dot (0; 1; z_D) = 0 <=> 3(0) + 3(1) + 0(z_D) = 0 <=> 3 = 0 $ (vô lý).
      Vậy không tồn tại giá trị nào của $z_D$ để bốn điểm $A, B, C, D$ đồng phẳng.]
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (16 câu)], count: 16)

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 0; 0)$, $B(0; 2; 0)$ và $C(0; 0; 2)$. Tính bình phương diện tích tam giác $A B C$ (tức là $S^2$).],
  [$6$],
  
  loigiai: [
    #step[Tính các vectơ: $vec(A B) = (-1; 2; 0)$ và $vec(A C) = (-1; 0; 2)$.]
    #step[Tính tích có hướng: $[vec(A B), vec(A C)] = (4; 2; 2)$.]
    #step[Tính bình phương diện tích:
      $S^2 = frac(1, 4) |[vec(A B), vec(A C)]|^2 = frac(1, 4) (4^2 + 2^2 + 2^2) = frac(1, 4) (16 + 4 + 4) = 6$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho bốn điểm $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ và $D(3; 2; 1)$. Gọi $V$ là thể tích của khối tứ diện $A B C D$. Tính giá trị của biểu thức $K = 6V$.],
  [$20$],
  
  loigiai: [
    #step[Tính các vectơ: $vec(A B) = (-1; 2; 0)$, $vec(A C) = (-1; 0; 3)$, $vec(A D) = (2; 2; 1)$.]
    #step[Tính tích có hướng: $[vec(A B), vec(A C)] = (6; 3; 2)$.]
    #step[Tính tích hỗn tạp: $[vec(A B), vec(A C)] dot vec(A D) = 6(2) + 3(2) + 2(1) = 20$.]
    #step[Tính thể tích $V = frac(1, 6) |20| = frac(20, 6) => K = 6V = 20$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho đường thẳng $d$ đi qua điểm $A(1; 2; 0)$ và có vectơ chỉ phương $vec(u) = (1; -2; 2)$. Tính khoảng cách từ điểm $M(3; 4; 1)$ đến đường thẳng $d$.],
  [$3$],
  
  loigiai: [
    #step[Xác định vectơ chỉ phương của đường thẳng $d$ là $vec(u) = (1; -2; 2)$ và điểm $A(1; 2; 0)$ nằm trên đường thẳng $d$.]
    #step[Tính vectơ kết nối từ điểm $A$ đến $M$:
      $ vec(A M) = (3 - 1; 4 - 2; 1 - 0) = (2; 2; 1). $]
    #step[Tính tích có hướng của $vec(u)$ và $vec(A M)$:
      $ [vec(u), vec(A M)] &= (det mat(-2, 2; 2, 1); det mat(2, 1; 1, 2); det mat(1, -2; 2, 2)) \
                           &= ((-2) dot 1 - 2 dot 2; 2 dot 2 - 1 dot 1; 1 dot 2 - (-2) dot 2) \
                           &= (-6; 3; 6). $]
    #step[Tính độ dài các vectơ:
      $ |[vec(u), vec(A M)]| = sqrt((-6)^2 + 3^2 + 6^2) = sqrt(36 + 9 + 36) = sqrt(81) = 9. $
      $ |vec(u)| = sqrt(1^2 + (-2)^2 + 2^2) = sqrt(1 + 4 + 4) = 3. $]
    #step[Khoảng cách từ điểm $M$ đến đường thẳng $d$ được tính theo công thức tích có hướng:
      $ d(M, d) = |[vec(u), vec(A M)]| / |vec(u)| = 9 / 3 = 3. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho hai đường thẳng chéo nhau $d_1$ và $d_2$. Biết đường thẳng $d_1$ đi qua điểm $A(1; 0; 2)$ và có vectơ chỉ phương $vec(u)_1 = (1; 1; 0)$. Đường thẳng $d_2$ đi qua điểm $B(2; -1; 3)$ và có vectơ chỉ phương $vec(u)_2 = (0; 1; 1)$. Tính bình phương khoảng cách giữa hai đường thẳng $d_1$ và $d_2$.],
  [$3$],
  
  loigiai: [
    #step[Xác định hai vectơ chỉ phương $vec(u)_1 = (1; 1; 0)$, $vec(u)_2 = (0; 1; 1)$ và vectơ nối điểm $A$ trên $d_1$ với điểm $B$ trên $d_2$:
      $ vec(A B) = (2 - 1; -1 - 0; 3 - 2) = (1; -1; 1). $]
    #step[Tính tích có hướng của hai vectơ chỉ phương $[vec(u)_1, vec(u)_2]$:
      $ [vec(u)_1, vec(u)_2] &= (1 dot 1 - 0 dot 1; 0 dot 0 - 1 dot 1; 1 dot 1 - 1 dot 0) \
                             &= (1; -1; 1). $]
    #step[Tính tích hỗn tạp của ba vectơ và độ dài tích có hướng:
      $ [vec(u)_1, vec(u)_2] dot vec(A B) = 1 dot 1 + (-1) dot (-1) + 1 dot 1 = 3. $
      $ |[vec(u)_1, vec(u)_2]| = sqrt(1^2 + (-1)^2 + 1^2) = sqrt(3). $]
    #step[Khoảng cách giữa hai đường thẳng chéo nhau $d_1, d_2$ bằng:
      $ d(d_1, d_2) = |[vec(u)_1, vec(u)_2] dot vec(A B)| / |[vec(u)_1, vec(u)_2]| = 3 / sqrt(3) = sqrt(3). $]
    #step[Bình phương khoảng cách giữa hai đường thẳng đó là:
      $ d^2(d_1, d_2) = (sqrt(3))^2 = 3. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tuabin gió lớn có ba cánh quạt quay quanh trục nằm ngang. Trong hệ tọa độ $O x y z$, trục quay của tuabin trùng với trục $O x$ (hướng từ Tây sang Đông). Một trong các cánh quạt được mô tả bởi vectơ lực nâng khí động học $vec(F)_1 = (0; 12; 16) "kN"$ tác dụng tại vị trí cách tâm trục quay một khoảng được xác định bởi vectơ vị trí $vec(r)_1 = (0; -3; 4) "m"$. Tính độ lớn mô-men lực (đơn vị: "kN.m") sinh ra bởi lực nâng này làm quay tuabin quanh trục $O x$.],
  [$96$],
  
  loigiai: [
    #step[Vectơ mô-men lực quay $vec(M)$ đối với tâm quay $O$ được tính bằng tích có hướng của vectơ vị trí và vectơ lực nâng khí động học:
      $ vec(M) = [vec(r)_1, vec(F)_1]. $]
    #step[Thay tọa độ của các vectơ $vec(r)_1 = (0; -3; 4)$ và $vec(F)_1 = (0; 12; 16)$ vào công thức:
      $ vec(M) &= (det mat(-3, 4; 12, 16); det mat(4, 0; 16, 0); det mat(0, -3; 0, 12)) \
              &= ((-3) dot 16 - 4 dot 12; 4 dot 0 - 0 dot 16; 0 dot 12 - (-3) dot 0) \
              &= (-48 - 48; 0; 0) = (-96; 0; 0) "kN.m". $]
    #step[Mô-men làm quay tuabin quanh trục $O x$ chính là thành phần hoành độ của vectơ mô-men lực: $M_x = -96 "kN.m"$.
      Độ lớn của mô-men lực này bằng:
      $ |M_x| = |-96| = 96 "kN.m". $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong động cơ điện xoay chiều, một lực từ lực lượng $vec(F) = (2; -6; 3) "N"$ tác dụng lên một cạnh của khung dây rô-to tại vị trí có vectơ cánh tay đòn $vec(d) = (4; 2; 1) "m"$ (tính từ trục quay). Tính bình phương độ lớn của mô-men lực quay $vec(M) = [vec(d), vec(F)]$ tác dụng lên rô-to.],
  [$1028$],
  
  loigiai: [
    #step[Vectơ mô-men lực tác dụng lên rô-to được tính theo công thức tích có hướng:
      $ vec(M) = [vec(d), vec(F)]. $]
    #step[Thay các tọa độ $vec(d) = (4; 2; 1)$ và $vec(F) = (2; -6; 3)$ để tìm vectơ $vec(M)$:
      $ vec(M) &= (det mat(2, 1; -6, 3); det mat(1, 4; 3, 2); det mat(4, 2; 2, -6)) \
              &= (2 dot 3 - 1 dot (-6); 1 dot 2 - 4 dot 3; 4 dot (-6) - 2 dot 2) \
              &= (6 + 6; 2 - 12; -24 - 4) = (12; -10; -28). $]
    #step[Tính bình phương độ lớn của vectơ mô-men lực:
      $ |vec(M)|^2 = 12^2 + (-10)^2 + (-28)^2 = 144 + 100 + 784 = 1028. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tháp điều khiển không lưu có đỉnh đặt tại gốc tọa độ $T(0; 0; 0)$ (đơn vị: km). Một chiếc máy bay di chuyển theo đường thẳng đi qua điểm $A(2; 2; 1) "km"$ với vectơ chỉ phương $vec(u) = (1; -2; 2)$. Tính khoảng cách ngắn nhất từ máy bay đến đỉnh tháp điều khiển không lưu $T$ (đơn vị: mét).],
  [$3000$],
  
  loigiai: [
    #step[Vectơ chỉ phương của đường thẳng quỹ đạo bay là $vec(u) = (1; -2; 2)$ có độ dài:
      $ |vec(u)| = sqrt(1^2 + (-2)^2 + 2^2) = 3. $]
    #step[Vectơ nối điểm $T(0; 0; 0)$ với điểm $A(2; 2; 1)$ trên quỹ đạo bay là:
      $ vec(T A) = (2; 2; 1). $]
    #step[Tính tích có hướng $[vec(u), vec(T A)]$:
      $ [vec(u), vec(T A)] &= (det mat(-2, 2; 2, 1); det mat(2, 1; 1, 2); det mat(1, -2; 2, 2)) \
                           &= ((-2) dot 1 - 2 dot 2; 2 dot 2 - 1 dot 1; 1 dot 2 - (-2) dot 2) \
                           &= (-6; 3; 6). $
      Độ lớn tích có hướng bằng:
      $ |[vec(u), vec(T A)]| = sqrt((-6)^2 + 3^2 + 6^2) = sqrt(81) = 9. $]
    #step[Khoảng cách ngắn nhất từ tháp $T$ đến quỹ đạo máy bay là:
      $ d(T, d) = |[vec(u), vec(T A)]| / |vec(u)| = 9 / 3 = 3 "km". $
      Đổi sang đơn vị mét: $3 "km" = 3000 "m"$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tấm pin mặt trời phẳng có dạng hình bình hành $A B C D$. Trong hệ tọa độ $O x y z$, tọa độ ba đỉnh của tấm pin là $A(1; 1; 1)$, $B(2; 3; 0)$ và $D(0; 2; 3)$ (đơn vị: mét). Tính diện tích của tấm pin mặt trời $A B C D$ (làm tròn kết quả đến hàng phần mười).],
  [$5.9$],
  
  loigiai: [
    #step[Xác định các vectơ chung đỉnh $A$:
      $ vec(A B) = (1; 2; -1), quad vec(A D) = (-1; 1; 2). $]
    #step[Tính tích có hướng $[vec(A B), vec(A D)]$:
      $ [vec(A B), vec(A D)] &= (det mat(2, -1; 1, 2); det mat(-1, 1; 2, -1); det mat(1, 2; -1, 1)) \
                             &= (2 dot 2 - (-1) dot 1; (-1) dot (-1) - 1 dot 2; 1 dot 1 - 2 dot (-1)) \
                             &= (5; -1; 3). $]
    #step[Diện tích hình bình hành $A B C D$ bằng độ lớn của tích có hướng $[vec(A B), vec(A D)]$:
      $ S = |[vec(A B), vec(A D)]| = sqrt(5^2 + (-1)^2 + 3^2) = sqrt(35) approx 5.916 "m"^2. $
      Làm tròn đến hàng phần mười, ta được $5.9$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một electron có điện tích $e = -1.6 dot 10^(-19) "C"$ bay vào một từ trường đều với vận tốc $vec(v) = (3 dot 10^5; 4 dot 10^5; 0) "m/s"$. Vectơ cảm ứng từ của từ trường là $vec(B) = (0; 0; 1) "T"$. Độ lớn lực Lo-ren-xơ tác dụng lên electron (được tính bằng công thức $vec(F) = q [vec(v), vec(B)]$) có dạng $K dot 10^(-14) "N"$. Tìm giá trị của $K$.],
  [$8$],
  
  loigiai: [
    #step[Công thức tính vectơ lực Lo-ren-xơ tác dụng lên điện tích chuyển động trong từ trường là:
      $ vec(F) = q [vec(v), vec(B)]. $]
    #step[Tính tích có hướng $[vec(v), vec(B)]$ with $vec(v) = (300.000; 400.000; 0)$ and $vec(B) = (0; 0; 1)$:
      $ [vec(v), vec(B)] = (400.000 dot 1 - 0 dot 0; 0 dot 0 - 300.000 dot 1; 300.000 dot 0 - 400.000 dot 0) = (400.000; -300.000; 0). $]
    #step[Tính độ lớn của tích có hướng:
      $ |[vec(v), vec(B)]| = sqrt((4 dot 10^5)^2 + (-3 dot 10^5)^2 + 0^2) = 5 dot 10^5 "T.m/s". $]
    #step[Độ lớn lực Lo-ren-xơ tác dụng lên electron bằng:
      $ F = |q| dot |[vec(v), vec(B)]| = 1.6 dot 10^(-19) dot 5 dot 10^5 = 8 dot 10^(-14) "N". $
      Do đó giá trị của $K$ bằng $8$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một chất điểm có khối lượng $m = 2 "kg"$ chuyển động với vận tốc $vec(v) = (1; 2; -2) "m/s"$. Vectơ vị trí của chất điểm đối với gốc tọa độ là $vec(r) = (3; 0; 4) "m"$. Tính bình phương độ lớn của mô-men động lượng $vec(L) = m [vec(r), vec(v)]$ của chất điểm đối với gốc tọa độ.],
  [$800$],
  
  loigiai: [
    #step[Tính tích có hướng của vectơ vị trí $vec(r)$ và vectơ vận tốc $vec(v)$:
      $ [vec(r), vec(v)] &= (det mat(0, 4; 2, -2); det mat(4, 3; -2, 1); det mat(3, 0; 1, 2)) \
                         &= (0 dot (-2) - 4 dot 2; 4 dot 1 - 3 dot (-2); 3 dot 2 - 0 dot 1) \
                         &= (-8; 10; 6). $]
    #step[Vectơ mô-men động lượng $vec(L)$ của chất điểm là:
      $ vec(L) = m [vec(r), vec(v)] = 2 dot (-8; 10; 6) = (-16; 20; 12). $]
    #step[Tính bình phương độ lớn của mô-men động lượng:
      $ |vec(L)|^2 = (-16)^2 + 20^2 + 12^2 = 256 + 400 + 144 = 800. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Hai chiếc máy bay di chuyển theo hai đường thẳng chéo nhau. Máy bay thứ nhất đi qua điểm $A(1; 2; 3)$ (đơn vị: km) với vectơ chỉ phương $vec(u)_1 = (1; 0; 1)$. Máy bay thứ hai đi qua điểm $B(2; 1; 5)$ (đơn vị: km) với vectơ chỉ phương $vec(u)_2 = (0; 1; 1)$. Tính khoảng cách ngắn nhất giữa hai đường bay đó (làm tròn kết quả đến hàng đơn vị của mét).],
  [$1155$],
  
  loigiai: [
    #step[Tính vectơ nối điểm $A$ trên đường bay thứ nhất với điểm $B$ trên đường bay thứ hai:
      $ vec(A B) = (2 - 1; 1 - 2; 5 - 3) = (1; -1; 2) "km". $]
    #step[Tính tích có hướng của hai vectơ chỉ phương $[vec(u)_1, vec(u)_2]$:
      $ [vec(u)_1, vec(u)_2] = (det mat(0, 1; 1, 1); det mat(1, 1; 1, 0); det mat(1, 0; 0, 1)) = (-1; -1; 1). $]
    #step[Tính tích hỗn tạp của ba vectơ và độ lớn của tích có hướng:
      $ [vec(u)_1, vec(u)_2] dot vec(A B) = (-1) dot 1 + (-1) dot (-1) + 1 dot 2 = -1 + 1 + 2 = 2. $
      $ |[vec(u)_1, vec(u)_2]| = sqrt((-1)^2 + (-1)^2 + 1^2) = sqrt(3). $]
    #step[Khoảng cách ngắn nhất giữa hai đường bay chéo nhau là:
      $ d = |[vec(u)_1, vec(u)_2] dot vec(A B)| / |[vec(u)_1, vec(u)_2]| = 2 / sqrt(3) approx 1.1547 "km". $
      Đổi sang đơn vị mét và làm tròn đến hàng đơn vị: $1.1547 "km" = 1154.7 "m" => 1155 "m"$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một trạm rada phát sóng định vị sao cho mặt phẳng quét đi qua ba điểm $A(1; 0; 1)$, $B(2; 1; 2)$ và $C(0; 2; 3)$ (đơn vị: mét). Hướng trục phát sóng thực tế của rada có vectơ chỉ phương $vec(v) = (1; 1; 2)$. Gọi $alpha$ là góc lệch giữa trục phát sóng rada và mặt phẳng quét. Tính giá trị biểu thức $K = 12 dot sin^2(alpha)$.],
  [$1$],
  
  loigiai: [
    #step[Xác định các vectơ chỉ phương nằm trong mặt phẳng quét:
      $ vec(A B) = (1; 1; 1), quad vec(A C) = (-1; 2; 2). $]
    #step[Vectơ pháp tuyến của mặt phẳng quét $(A B C)$ song song với tích có hướng:
      $ vec(n) = [vec(A B), vec(A C)] = (det mat(1, 1; 2, 2); det mat(1, 1; 2, -1); det mat(1, 1; -1, 2)) = (0; -3; 3) = 3(0; -1; 1). $
      Chọn vectơ pháp tuyến rút gọn là $vec(n) = (0; -1; 1)$.]
    #step[Góc $alpha$ giữa trục phát sóng rada $vec(v) = (1; 1; 2)$ và mặt phẳng quét thỏa mãn:
      $ sin(alpha) = |vec(v) dot vec(n)| / (|vec(v)| dot |vec(n)|) = |1 dot 0 + 1 dot (-1) + 2 dot 1| / (sqrt(1^2 + 1^2 + 2^2) dot sqrt(0^2 + (-1)^2 + 1^2)) = 1 / (sqrt(6) dot sqrt(2)) = 1 / sqrt(12). $]
    #step[Do đó, bình phương hình sin góc lệch bằng:
      $ sin^2(alpha) = 1/12. $
      Suy ra giá trị của biểu thức $K = 12 dot sin^2(alpha) = 12 dot 1/12 = 1$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một sợi cáp viễn thông căng thẳng đi qua điểm $A(1; 2; 1)$ và có vectơ chỉ phương $vec(u) = (2; -1; 2)$. Một đường ống ngầm chạy song song với cáp và đi qua điểm $M(3; 5; 4)$ (đơn vị tọa độ đo bằng mét). Tính khoảng cách giữa đường cáp viễn thông và đường ống ngầm (làm tròn kết quả đến hàng phần mười).],
  [$4.1$],
  
  loigiai: [
    #step[Vectơ kết nối từ điểm $A$ trên đường cáp đến điểm $M$ trên đường ống ngầm là:
      $ vec(A M) = (3 - 1; 5 - 2; 4 - 1) = (2; 3; 3). $]
    #step[Tính tích có hướng của vectơ chỉ phương $vec(u) = (2; -1; 2)$ và vectơ kết nối $vec(A M)$:
      $ [vec(u), vec(A M)] = (det mat(-1, 2; 3, 3); det mat(2, 2; 3, 2); det mat(2, -1; 2, 3)) = (-9; -2; 8). $]
    #step[Độ dài của tích có hướng và độ dài của vectơ chỉ phương:
      $ |[vec(u), vec(A M)]| = sqrt((-9)^2 + (-2)^2 + 8^2) = sqrt(81 + 4 + 64) = sqrt(149). $
      $ |vec(u)| = sqrt(2^2 + (-1)^2 + 2^2) = 3. $]
    #step[Vì hai đường thẳng song song nên khoảng cách giữa đường cáp và đường ống bằng khoảng cách từ điểm $M$ đến đường cáp:
      $ d = |[vec(u), vec(A M)]| / |vec(u)| = sqrt(149) / 3 approx 4.069 "m". $
      Làm tròn đến hàng phần mười, ta được kết quả $4.1$ mét.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một giàn khoan địa chất đang khoan thăm dò vỉa dầu khí trong lòng đất. Trong hệ tọa độ $O x y z$, mũi khoan xuất phát từ điểm $A(1; 1; 1)$ (đơn vị: km) và đi theo hướng của vectơ $vec(u) = (2; 2; -1)$ đến khi chạm vào vỉa dầu tại mặt phẳng $(P): x + 2y + 2z - 13 = 0$. Tính quãng đường mũi khoan đã đi được (đơn vị: mét).],
  [$6000$],
  
  loigiai: [
    #step[Đường đi của mũi khoan đi qua $A(1; 1; 1)$ có vectơ chỉ phương $vec(u) = (2; 2; -1)$ có phương trình tham số là:
      $ cases(x = 1 + 2t, y = 1 + 2t, z = 1 - t). $]
    #step[Tìm tọa độ giao điểm $M$ của mũi khoan với vỉa dầu mặt phẳng $(P)$ bằng cách thay tham số vào phương trình mặt phẳng:
      $ (1 + 2t) + 2(1 + 2t) + 2(1 - t) - 13 = 0 <=> 4t - 8 = 0 <=> t = 2. $
      Khi đó giao điểm là $M(5; 5; -1)$.]
    #step[Quãng đường mũi khoan đi được là độ dài đoạn thẳng $A M$:
      $ A M = sqrt((5-1)^2 + (5-1)^2 + (-1-1)^2) = sqrt(4^2 + 4^2 + (-2)^2) = sqrt(16 + 16 + 4) = 6 "km". $
      Đổi sang đơn vị mét: $6 "km" = 6000 "m"$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tháp giải nhiệt bằng bê tông có dạng hình chóp cụt tam giác đều $A B C . A' B' C'$ có đáy lớn $A B C$ nằm trên mặt đất $z = 0$. Tọa độ các đỉnh của đáy lớn là $A(6; 0; 0)$, $B(0; 6 sqrt(3); 0)$, $C(-6; 0; 0)$ và đáy nhỏ $A' B' C'$ có các đỉnh là $A'(3; sqrt(3); 4)$, $B'(0; 4 sqrt(3); 4)$, $C'(-3; sqrt(3); 4)$ (đơn vị: mét). Tính thể tích của tháp giải nhiệt đó (làm tròn kết quả đến hàng đơn vị).],
  [$145$],
  
  loigiai: [
    #step[Tính diện tích đáy lớn $S_1 = S_(Delta A B C)$:
      Ta có $vec(A C) = (-12; 0; 0)$ và $vec(A B) = (-6; 6 sqrt(3); 0)$.
      $ [vec(A C), vec(A B)] = (0; 0; -72 sqrt(3)) => S_1 = 1/2 |[vec(A C), vec(A B)]| = 36 sqrt(3) "m"^2. $]
    #step[Tính diện tích đáy nhỏ $S_2 = S_(Delta A' B' C')$:
      Ta có $vec(A' C') = (-6; 0; 0)$ và $vec(A' B') = (-3; 3 sqrt(3); 0)$.
      $ [vec(A' C'), vec(A' B')] = (0; 0; -18 sqrt(3)) => S_2 = 1/2 |[vec(A' C'), vec(A' B')]| = 9 sqrt(3) "m"^2. $]
    #step[Chiều cao của tháp giải nhiệt chính là khoảng cách giữa hai mặt phẳng chứa đáy $z = 0$ và $z = 4$, tức là $h = 4 "m"$.]
    #step[Thể tích của tháp giải nhiệt dạng hình chóp cụt đều được tính bằng công thức:
      $ V = h/3 (S_1 + S_2 + sqrt(S_1 S_2)) = 4/3 (36 sqrt(3) + 9 sqrt(3) + sqrt(36 sqrt(3) dot 9 sqrt(3))) \
          = 4/3 (45 sqrt(3) + 18 sqrt(3)) = 4/3 dot 63 sqrt(3) = 84 sqrt(3) approx 145.49 "m"^3. $
      Làm tròn đến hàng đơn vị, ta được kết quả $145$ mét khối.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, hai đường dây điện cao thế được đặt dọc theo hai đường thẳng chéo nhau. Đường thẳng thứ nhất đi qua $A(1; 0; 1)$ và có vectơ chỉ phương $vec(u) = (1; 2; 2)$. Đường thẳng thứ hai đi qua $B(-1; 1; 1)$ và có vectơ chỉ phương $vec(v) = (2; 1; -2)$. Hãy tính khoảng cách ngắn nhất giữa hai đường dây điện cao thế này (đơn vị: mét).],
  [2],
  loigiai: [
    #step[Ta có vectơ kết nối hai điểm $A$ và $B$ trên hai đường thẳng chéo nhau là:
      $ vec(A B) = (-1 - 1; 1 - 0; 1 - 1) = (-2; 1; 0). $]
    #step[Tính tích có hướng của hai vectơ chỉ phương $vec(u)$ và $vec(v)$:
      $ [vec(u), vec(v)] = (det mat(2, 2; 1, -2); det mat(2, 1; -2, 2); det mat(1, 2; 2, 1)) = (-6; 6; -3). $]
    #step[Tính tích vô hướng của tích có hướng $[vec(u), vec(v)]$ với vectơ $vec(A B)$:
      $ [vec(u), vec(v)] dot vec(A B) = (-6) dot (-2) + 6 dot 1 + (-3) dot 0 = 12 + 6 + 0 = 18. $]
    #step[Tính độ dài của vectơ tích có hướng $[vec(u), vec(v)]$:
      $ |[vec(u), vec(v)]| = sqrt((-6)^2 + 6^2 + (-3)^2) = sqrt(36 + 36 + 9) = sqrt(81) = 9. $]
    #step[Khoảng cách ngắn nhất giữa hai đường thẳng chéo nhau bằng:
      $ d = (|[vec(u), vec(v)] dot vec(A B)|) / (|[vec(u), vec(v)]|) = 18 / 9 = 2. $
      Vậy khoảng cách ngắn nhất giữa hai đường dây điện cao thế là $2$ mét.]
  ],
))

