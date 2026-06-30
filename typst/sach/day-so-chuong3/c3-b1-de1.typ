#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Bài 1 — Dãy Số & Phương Pháp Quy Nạp])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 7)

#q-wrap(dir: "doc", tn(
  [Dãy số nào dưới đây là một dãy số tăng?],
  (
    [$u_n = 1/n$],
    [$u_n = (-1)^n$],
    True([$u_n = 2n + 1$]),
    [$u_n = n^2 - 10n$]
  ),
  loigiai: [
    #step[*Phân tích từng phương án:* \
    - A: Dãy giảm vì tử không đổi, mẫu tăng dần. \
    - B: Dãy đan dấu, không tăng không giảm. \
    - C: Ta có $u_(n+1) - u_n = 2(n+1)+1 - (2n+1) = 2 > 0$ nên đây là dãy tăng. \
    - D: Chỉ tăng từ $n=5$ trở đi, không phải dãy tăng trên $NN^*$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho dãy số $(u_n)$ được xác định bởi $u_1 = 2$ và hệ thức truy hồi $u_n = 3 u_(n-1) - 1$ với mọi $n >= 2$. Số hạng $u_4$ của dãy số bằng bao nhiêu?],
  (
    [$14$],
    True([$41$]),
    [$122$],
    [$40$]
  ),
  loigiai: [
    #step[*Tính tuần tự các số hạng:* \
      $u_2 = 3(2)-1 = 5$ \
      $u_3 = 3(5)-1 = 14$ \
      $u_4 = 3(14)-1 = 41$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Xét tính bị chặn của dãy số $u_n = (2n+1)/(n+2)$. Khẳng định nào sau đây là đúng?],
  (
    [Dãy $(u_n)$ chỉ bị chặn dưới.],
    [Dãy $(u_n)$ chỉ bị chặn trên.],
    True([Dãy $(u_n)$ bị chặn.]),
    [Dãy $(u_n)$ không bị chặn.]
  ),
  loigiai: [
    #step[*B1: Biến đổi biểu thức:* \
      Ta có $u_n = (2n+4-3)/(n+2) = 2 - 3/(n+2)$.]
    #step[*B2: Đánh giá chặn dưới và chặn trên:* \
      Vì $n >= 1$ nên $3/(n+2) <= 1$, suy ra $u_n >= 2 - 1 = 1$. \
      Đồng thời $3/(n+2) > 0$ nên $u_n < 2$.]
    #step[*B3: Kết luận:* \
      Vậy $1 <= u_n < 2$, dãy số bị chặn.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Trong phương pháp quy nạp toán học, để chứng minh mệnh đề $P(n)$ đúng với mọi $n in NN^*$, ta thực hiện theo thứ tự nào?],
  (
    [Giả sử $P(k)$ đúng, chứng minh $P(1)$ đúng, rồi suy ra $P(k+1)$ đúng.],
    True([Chứng minh $P(1)$ đúng, giả sử $P(k)$ đúng với $k >= 1$, chứng minh $P(k+1)$ đúng.]),
    [Chứng minh $P(1)$ đúng, chứng minh $P(2)$ đúng, suy ra $P(n)$ đúng.],
    [Giả sử $P(n)$ đúng, chứng minh lại bằng đại số.]
  ),
  loigiai: [
    #step[*Các bước quy nạp toán học:* \
    Theo nguyên lý quy nạp toán học, ta phải thực hiện 3 bước: \
    - Bước khởi tạo: Chứng minh $P(1)$ đúng. \
    - Bước giả thiết: Giả sử $P(k)$ đúng với $k >= 1$. \
    - Bước nhảy: Chứng minh $P(k+1)$ đúng.]
  ]
))

#q-wrap(dir: "doc", tn(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    rect((0,0), (1,1), stroke: blue, fill: rgb("e0f2fe"))
    content((0.5, 0.5), [1])
    rect((-1,0), (0,1), stroke: blue, fill: rgb("e0f2fe"))
    content((-0.5, 0.5), [1])
    rect((-1,-2), (1,0), stroke: blue, fill: rgb("bae6fd"))
    content((0, -1), [2])
  }),
  [Người ta vẽ hình chữ nhật Vàng bằng cách ghép các hình vuông có cạnh là các số thuộc dãy Fibonacci: $1, 1, 2, 3, 5, 8, ...$. Gọi $F_n$ là dãy Fibonacci, biết $F_1 = 1, F_2 = 1, F_(n+2) = F_(n+1) + F_n$. Diện tích của hình chữ nhật ghép từ $n$ hình vuông đầu tiên bằng bao nhiêu?],
  (
    [$F_n^2$],
    [$F_n times F_(n-1)$],
    True([$F_n times F_(n+1)$]),
    [$(F_n + F_(n+1))^2$]
  ),
  loigiai: [
    #step[*Quan sát quy luật ghép hình:* \
      Diện tích hình chữ nhật tạo bởi $n$ hình vuông Fibonacci luôn có kích thước cạnh là $F_n$ và $F_(n+1)$. \
      Do đó diện tích luôn bằng $F_n times F_(n+1)$.]
    #step[*Kiểm chứng:* \
      Ví dụ khi $n=3$, các cạnh hình vuông là 1, 1, 2. HCN tổng có cạnh $2$ và $3$, diện tích bằng $6 = 2 times 3 = F_3 times F_4$.]
  ]
))

#q-wrap(dir: "doc", tn(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Triangle 1
    line((0, 0), (1, 0), stroke: 1.5pt + rgb("ea580c")) 
    line((0, 0), (0.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((1, 0), (0.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    circle((1, 0), radius: 0.06, fill: black)
    circle((0.5, 0.866), radius: 0.06, fill: black)
    circle((0, 0), radius: 0.06, fill: black)
    content((0.5, -0.4), text(size: 8pt)[Hình 1])
    
    // Triangle 2
    line((2, 0), (3, 0), stroke: 1.5pt + rgb("ea580c"))
    line((2, 0), (2.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((3, 0), (2.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((3, 0), (4, 0), stroke: 1.5pt + rgb("ea580c"))
    line((4, 0), (3.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((3, 0), (3.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    circle((2, 0), radius: 0.06, fill: black)
    circle((3, 0), radius: 0.06, fill: black)
    circle((4, 0), radius: 0.06, fill: black)
    circle((2.5, 0.866), radius: 0.06, fill: black)
    circle((3.5, 0.866), radius: 0.06, fill: black)
    content((3, -0.4), text(size: 8pt)[Hình 2])
    
    // Triangle 3
    line((5, 0), (6, 0), stroke: 1.5pt + rgb("ea580c"))
    line((5, 0), (5.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((6, 0), (5.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((6, 0), (7, 0), stroke: 1.5pt + rgb("ea580c"))
    line((7, 0), (6.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((6, 0), (6.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((7, 0), (8, 0), stroke: 1.5pt + rgb("ea580c"))
    line((8, 0), (7.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    line((7, 0), (7.5, 0.866), stroke: 1.5pt + rgb("ea580c"))
    circle((5, 0), radius: 0.06, fill: black)
    circle((6, 0), radius: 0.06, fill: black)
    circle((7, 0), radius: 0.06, fill: black)
    circle((8, 0), radius: 0.06, fill: black)
    circle((5.5, 0.866), radius: 0.06, fill: black)
    circle((6.5, 0.866), radius: 0.06, fill: black)
    circle((7.5, 0.866), radius: 0.06, fill: black)
    content((6.5, -0.4), text(size: 8pt)[Hình 3])
  }),
  [Một dãy các hình tam giác được xếp từ các que diêm như sơ đồ trên. Hình thứ nhất gồm 1 tam giác (3 que diêm), hình thứ hai gồm 2 tam giác (5 que diêm), hình thứ ba gồm 3 tam giác (7 que diêm). Công thức số que diêm $u_n$ cần dùng để xếp hình thứ $n$ là:],
  (
    [$u_n = 3n$],
    [$u_n = 3^n$],
    True([$u_n = 2n + 1$]),
    [$u_n = 2n - 1$]
  ),
  loigiai: [
    #step[*B1: Xác định quy luật cấp số cộng:* \
      Số que diêm ở các hình lập thành một cấp số cộng với $u_1 = 3$ và công sai $d = 2$ (mỗi lần thêm 1 tam giác ta cần thêm 2 que diêm ghép vào cạnh có sẵn).]
    #step[*B2: Tìm số hạng tổng quát:* \
      Công thức số hạng tổng quát: $u_n = u_1 + (n-1)d = 3 + 2(n-1) = 2n + 1$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 5$ và hệ thức truy hồi $u_(n+1) = u_n + 2n - 1$ với mọi $n >= 1$. Số hạng tổng quát của dãy số $(u_n)$ là công thức nào dưới đây?],
  (
    True([$u_n = n^2 - 2n + 6$]),
    [$u_n = n^2 - 2n + 5$],
    [$u_n = n^2 + 2n + 2$],
    [$u_n = 2n^2 - n + 4$]
  ),
  loigiai: [
    #step[*B1: Lập các hiệu số liên tiếp:* \
      Ta có: $u_(n+1) - u_n = 2n - 1$. \
      Thay lần lượt $n = 1, 2, ..., n-1$, ta cộng các vế lại:]
    #step[*B2: Tính tổng các hiệu số:* \
      $u_n - u_1 = sum_(i=1)^(n-1) (2i - 1) = (n-1)^2$.]
    #step[*B3: Rút ra công thức $u_n$:* \
      Suy ra $u_n = 5 + (n-1)^2 = 5 + n^2 - 2n + 1 = n^2 - 2n + 6$.]
  ]
))

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: 3)

#q-wrap(dir: "doc", ds(
  [Cho dãy số $(u_n)$ được xác định bởi công thức $u_n = 2^n - 3n$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Số hạng đầu tiên của dãy là $u_1 = -1$.]),
    [Dãy số $(u_n)$ là một dãy số tăng.],
    True([Số hạng thứ 4 của dãy lớn hơn số hạng thứ 3.]),
    [Dãy số $(u_n)$ bị chặn trên.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
    - a) Đúng. Với $n=1$, $u_1 = 2^1 - 3(1) = -1$. \
    - b) Sai. Ta có $u_1 = -1, u_2 = 2^2 - 3(2) = -2$. Do $u_2 < u_1$ nên dãy không tăng. \
    - c) Đúng. $u_4 = 2^4 - 3(4) = 4, u_3 = 2^3 - 3(3) = -1$. Rõ ràng $4 > -1$. \
    - d) Sai. Khi $n -> +oo$, $2^n$ tăng nhanh hơn rất nhiều so với $3n$, nên $u_n -> +oo$. Dãy không bị chặn trên.]
  ]
))

#q-wrap(dir: "doc", ds(
  [Trò chơi Tháp Hà Nội có 3 cọc A, B, C. Người chơi cần chuyển $n$ đĩa từ cọc A sang cọc C, biết đĩa lớn không được đè lên đĩa nhỏ. Gọi $u_n$ là số bước di chuyển tối thiểu để chuyển $n$ đĩa. Ta có hệ thức: $u_1 = 1$, $u_(n+1) = 2 u_n + 1$. Xét tính đúng sai:],
  (
    True([Để chuyển 2 đĩa cần tối thiểu 3 bước.]),
    [Để chuyển 3 đĩa cần tối thiểu 6 bước.],
    True([Bằng phương pháp quy nạp, ta chứng minh được $u_n = 2^n - 1$.]),
    [Để chuyển tháp 10 đĩa (1 đĩa/giây) sẽ mất hơn 1 giờ đồng hồ.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
    - a) Đúng. Với $n=1$, $u_2 = 2(1) + 1 = 3$. \
    - b) Sai. Với $n=2$, $u_3 = 2(3) + 1 = 7$ bước. \
    - c) Đúng. Khởi tạo $n=1 => 2^1-1=1$. Bước nhảy: $u_(k+1) = 2(2^k-1)+1 = 2^(k+1)-1$. \
    - d) Sai. Số bước chuyển 10 đĩa là $u_(10) = 2^(10) - 1 = 1023$ bước. Thời gian là 1023 giây $approx 17$ phút, chưa tới 1 giờ.]
  ]
))

#q-wrap(dir: "doc", ds(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw bounding circle
    circle((0, 0), radius: 1.8, stroke: 1pt + gray, fill: rgb("f8fafc"))
    
    // Draw 3 lines
    line((-1.7, -0.6), (1.7, 0.6), stroke: 1.2pt + c-book)
    line((-1.7, 0.6), (1.7, -0.6), stroke: 1.2pt + c-book)
    line((-0.3, -1.7), (0.7, 1.7), stroke: 1.2pt + c-book)
    
    // Label regions
    content((0, 1.3), [1])
    content((-1.2, 0.8), [2])
    content((-1.2, -0.8), [3])
    content((0, -1.3), [4])
    content((1.2, -0.8), [5])
    content((1.2, 0.8), [6])
    content((0.08, 0.08), text(size: 8pt)[7])
  }),
  [Xét bài toán phân chia mặt phẳng: Cho $n$ đường thẳng trên mặt phẳng sao cho không có hai đường thẳng nào song song và không có ba đường thẳng nào đồng quy. Gọi $a_n$ là số miền (vùng) mà $n$ đường thẳng này chia mặt phẳng. Ta có công thức truy hồi: $a_1 = 2, a_(n+1) = a_n + n + 1$ với mọi $n >= 1$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Với 2 đường thẳng, mặt phẳng được chia thành 4 miền.]),
    [Với 3 đường thẳng, mặt phẳng được chia thành 8 miền.],
    True([Công thức số hạng tổng quát của dãy số là $a_n = (n^2 + n + 2)/2$.]),
    True([Với 10 đường thẳng, số miền tối đa được tạo thành là 56 miền.])
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
    - a) Đúng. Với $n=2$, $a_2 = a_1 + 2 = 4$ miền. \
    - b) Sai. Với $n=3$, $a_3 = a_2 + 3 = 7$ miền (như hình minh họa). \
    - c) Đúng. Chứng minh bằng quy nạp: Với $n=1$, $a_1 = (1+1+2)/2 = 2$ (đúng). Giả sử đúng với $n=k$, ta có $a_k = (k^2+k+2)/2$. Khi đó $a_(k+1) = (k^2+k+2)/2 + k + 1 = (k^2 + 3k + 4)/2 = ((k+1)^2 + (k+1) + 2)/2$ (đúng). \
    - d) Đúng. Với $n=10$, $a_(10) = (10^2 + 10 + 2)/2 = 112 / 2 = 56$ miền.]
  ]
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 5)

#q-wrap(dir: "doc", tln(
  [Cho dãy số $(u_n)$ được xác định bởi $u_1 = 1$ và hệ thức $u_(n+1) = 2 u_n + 3$. Tính giá trị của $u_5$.],
  [61],
  loigiai: [
    #step[*Tính tuần tự các số hạng:* \
      $u_2 = 2(1) + 3 = 5$ \
      $u_3 = 2(5) + 3 = 13$ \
      $u_4 = 2(13) + 3 = 29$ \
      $u_5 = 2(29) + 3 = 61$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Trong một mô hình sinh thái học, quần thể vi khuẩn nhân đôi mỗi giờ nhưng đồng thời bị tiêu diệt 500 cá thể mỗi giờ do kháng sinh. Gọi $P_n$ là số vi khuẩn sau $n$ giờ, ta có $P_n = 2 P_(n-1) - 500$. Biết số lượng vi khuẩn ban đầu là $P_0 = 1000$. Sau 3 giờ, lượng vi khuẩn còn lại là bao nhiêu?],
  [4500],
  loigiai: [
    #step[*Tính tuần tự số lượng vi khuẩn:* \
      - Sau 1h: $P_1 = 2(1000) - 500 = 1500$. \
      - Sau 2h: $P_2 = 2(1500) - 500 = 2500$. \
      - Sau 3h: $P_3 = 2(2500) - 500 = 4500$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Dãy số Catalan được định nghĩa bằng hệ thức: $C_0=1$, $C_n = sum_(i=0)^(n-1) C_i C_(n-1-i)$. Tính giá trị của $C_3$.],
  [5],
  loigiai: [
    #step[*Tính tuần tự dãy Catalan:* \
      $C_0 = 1$ \
      $C_1 = C_0 C_0 = 1$ \
      $C_2 = C_0 C_1 + C_1 C_0 = 1 dot 1 + 1 dot 1 = 2$ \
      $C_3 = C_0 C_2 + C_1 C_1 + C_2 C_0 = 1 dot 2 + 1 dot 1 + 2 dot 1 = 5$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho dãy số $(u_n)$ với $u_n = 2^n / n!$. Tìm số hạng lớn nhất của dãy số này.],
  [2],
  loigiai: [
    #step[*B1: Lập tỷ số giữa hai số hạng liên tiếp:* \
      $u_(n+1) / u_n = (2^(n+1) / (n+1)!) / (2^n / n!) = 2 / (n+1)$.]
    #step[*B2: Đánh giá sự tăng giảm của dãy số:* \
      - Với $n=1$: $u_2 / u_1 = 2/2 = 1 => u_2 = u_1 = 2$. \
      - Với $n >= 2$: $n+1 > 2 => 2 / (n+1) < 1 => u_(n+1) < u_n$.]
    #step[*B3: Kết luận:* \
      Do đó dãy số giảm kể từ $n=2$. Số hạng lớn nhất của dãy là $u_1 = u_2 = 2$.]
  ]
))

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    
    rect((-0.5, 1.5), (0.5, 2.5), stroke: c-book, fill: rgb("bae6fd"))
    rect((-1, 0.5), (0, 1.5), stroke: c-book, fill: rgb("bae6fd"))
    rect((0, 0.5), (1, 1.5), stroke: c-book, fill: rgb("bae6fd"))
    rect((-1.5, -0.5), (-0.5, 0.5), stroke: c-book, fill: rgb("bae6fd"))
    rect((-0.5, -0.5), (0.5, 0.5), stroke: c-book, fill: rgb("bae6fd"))
    rect((0.5, -0.5), (1.5, 0.5), stroke: c-book, fill: rgb("bae6fd"))
  }),
  [Một người xếp các khối lập phương gỗ nhỏ thành một mô hình tháp bậc thang như sơ đồ trên (tầng 1 có 1 khối, tầng 2 có 3 khối xếp dạng tam giác, tầng 3 có 6 khối...). Số khối gỗ ở mỗi tầng tạo thành dãy số tam giác $u_n = n(n+1)/2$. Biết tháp có tất cả $10$ tầng. Tính tổng số khối lập phương gỗ cần dùng để dựng mô hình này.],
  [220],
  loigiai: [
    #step[*B1: Công thức số khối gỗ ở tầng $n$:* \
      Số khối gỗ ở tầng $n$ là $u_n = n(n+1)/2 = 1/2 (n^2 + n)$.]
    #step[*B2: Thiết lập tổng:* \
      Tổng số khối gỗ của 10 tầng là: \
      $S = sum_(n=1)^(10) u_n = 1/2 sum_(n=1)^(10) (n^2 + n) = 1/2 [sum_(n=1)^(10) n^2 + sum_(n=1)^(10) n]$.]
    #step[*B3: Tính toán kết quả:* \
      Ta biết $sum_(n=1)^(10) n^2 = (10 times 11 times 21)/6 = 385$ và $sum_(n=1)^(10) n = (10 times 11)/2 = 55$. \
      Do đó, $S = 1/2 [385 + 55] = 1/2 [440] = 220$ khối gỗ.]
  ]
))
