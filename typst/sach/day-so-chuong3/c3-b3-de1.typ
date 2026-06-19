#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Bài 3 — Cấp Số Nhân & Toán Tài Chính - Vật Lý Hạt Nhân])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 7)

#q-wrap(dir: "doc", tn(
  [Cho cấp số nhân $(u_n)$ có $u_1 = -2$ và công bội $q = 3$. Số hạng tổng quát của dãy số là công thức nào dưới đây?],
  (
    True([$u_n = -2 dot 3^(n-1)$]),
    [$u_n = -2 dot 3^n$],
    [$u_n = 3 dot (-2)^(n-1)$],
    [$u_n = (-6)^(n-1)$]
  ),
  loigiai: [
    Theo định nghĩa số hạng tổng quát của cấp số nhân: $u_n = u_1 dot q^(n-1)$.
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho cấp số nhân $(u_n)$ có $u_2 = 1/4$ và $u_5 = 16$. Công bội $q$ của cấp số nhân bằng bao nhiêu?],
  (
    True([$4$]),
    [$1/4$],
    [$8$],
    [$-4$]
  ),
  loigiai: [
    Ta có $u_5 = u_2 dot q^3 => 16 = 1/4 dot q^3 => q^3 = 64 => q = 4$.
  ]
))

#q-wrap(dir: "doc", tn(
  [Tính tổng vô hạn $S = 1 + 1/3 + 1/9 + 1/27 + ...$],
  (
    True([$3/2$]),
    [$4/3$],
    [$2$],
    [$oo$]
  ),
  loigiai: [
    Tổng của cấp số nhân lùi vô hạn với $u_1 = 1$, công bội $q = 1/3$. \
    $S = u_1 / (1 - q) = 1 / (1 - 1/3) = 1 / (2/3) = 3/2$.
  ]
))

#q-wrap(dir: "doc", tn(
  [Dân số năm 2020 là 2 triệu người. Tốc độ tăng dân số mỗi năm là 1,5%. Dân số năm 2030 (sau 10 năm) ước tính là bao nhiêu?],
  (
    True([$2 dot (1.015)^10$ triệu người]),
    [$2 + 10 dot 1.015$ triệu người],
    [$2 dot (1.15)^10$ triệu người],
    [$2 dot (1.015)^9$ triệu người]
  ),
  loigiai: [
    Dân số tạo thành cấp số nhân với $u_0 = 2$ triệu, công bội $q = 1 + 1.5% = 1.015$. \
    Dân số sau 10 năm là $u_10 = 2 dot 1.015^10$.
  ]
))

#q-wrap(dir: "doc", tn(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (5.5, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.2, -0.3), [năm])
    
    // Ticks & Labels
    for i in range(0, 6) {
      line((i, -0.1), (i, 0.1), stroke: 0.8pt + gray)
      content((i, -0.3), text(size: 8pt)[#i])
    }
    
    // Initial amount at t=0
    line((0, 0), (0, 0.8), stroke: 1.5pt + blue, mark: (end: ">", size: 0.1))
    content((0, 1.1), text(size: 8pt, fill: blue)[100 tr])
    
    // Accumulation curves
    let vis_heights = (0.8, 1.0, 1.25, 1.55, 1.9, 2.3)
    for i in range(0, 5) {
      bezier((i, vis_heights.at(i) - 0.2), (i + 1, vis_heights.at(i + 1) - 0.2), (i + 0.5, vis_heights.at(i) + 0.1), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    }
    
    // Final amount at t=5
    line((5, 0), (5, 2.3), stroke: 1.8pt + rgb("16a34a"), mark: (end: ">", size: 0.12))
    content((5, 2.6), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[134 tr])
  }),
  [Anh Bình gửi tiết kiệm ngân hàng 100 triệu đồng với hình thức lãi kép, kỳ hạn 1 năm, lãi suất 6%/năm. Sau 5 năm, tổng số tiền (cả gốc lẫn lãi) anh nhận được là bao nhiêu? (Làm tròn đến triệu đồng).],
  (
    [130 triệu],
    True([134 triệu]),
    [135 triệu],
    [106 triệu]
  ),
  loigiai: [
    Sử dụng công thức lãi kép: $T = A(1+r)^n = 100(1+0.06)^5 approx 133.822$ triệu. Làm tròn thành 134 triệu.
  ]
))

#q-wrap(dir: "doc", tn(
  [Tế bào nấm men sinh sản bằng cách phân đôi mỗi phút. Ban đầu trong ống nghiệm có chứa $1$ tế bào nấm men. Hỏi sau ít nhất bao nhiêu phút thì số lượng tế bào nấm men trong ống nghiệm vượt quá $1$ triệu tế bào?],
  (
    [10 phút],
    [15 phút],
    True([20 phút]),
    [24 phút]
  ),
  loigiai: [
    Số tế bào nấm men sau $t$ phút là một cấp số nhân: $u_t = 1 dot 2^t = 2^t$ tế bào. \
    Ta cần tìm $t$ nguyên dương nhỏ nhất sao cho: $2^t > 10^6$. \
    Ta có $2^(19) = 524288 < 10^6$ và $2^(20) = 1048576 > 10^6$. \
    Vậy cần ít nhất 20 phút.
  ]
))

#q-wrap(dir: "doc", tn(
  [Khi ánh sáng truyền qua một tấm kính dày, cường độ ánh sáng của nó giảm đi $10\%$ so với cường độ ban đầu. Người ta xếp chồng nhiều tấm kính cùng loại như vậy lên nhau. Để cường độ ánh sáng sau khi truyền qua hệ kính giảm đi nhiều hơn một nửa so với cường độ ban đầu, cần ít nhất bao nhiêu tấm kính?],
  (
    [5 tấm],
    [6 tấm],
    True([7 tấm]),
    [8 tấm]
  ),
  loigiai: [
    Gọi $I_0$ là cường độ ánh sáng ban đầu. Cường độ ánh sáng sau khi đi qua $n$ tấm kính là: \
    $I_n = I_0 dot (1 - 0.10)^n = I_0 dot 0.9^n$. \
    Để cường độ giảm nhiều hơn một nửa, ta cần: $I_n < 0.5 I_0 <=> 0.9^n < 0.5$. \
    Thử các giá trị của $n$: \
    - Với $n = 6$: $0.9^6 approx 0.531 > 0.5$. \
    - Với $n = 7$: $0.9^7 approx 0.478 < 0.5$. \
    Vậy cần ít nhất 7 tấm kính.
  ]
))

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: 3)

#q-wrap(dir: "doc", ds(
  [Ba số $x$, $y$, $z$ theo thứ tự lập thành một cấp số nhân. Biết tổng của chúng là 13 và tích của chúng là 27.],
  (
    True([Số $y$ chắc chắn bằng $3$.]),
    True([Tổng $x + z = 10$.]),
    [Có duy nhất một cấp số nhân thỏa mãn bài toán.],
    [Công bội của cấp số nhân đó bắt buộc phải lớn hơn 1.]
  ),
  loigiai: [
    a) Đúng. Tính chất CSN: $x z = y^2$. Từ giả thiết $x y z = 27 => y^3 = 27 => y = 3$. \
    b) Đúng. Vì $y=3$ nên $x + y + z = 13 => x + z = 10$. \
    c) Sai. Ta có $x+z=10$ và $x z=9$. Nghiệm của pt $X^2 - 10X + 9 = 0$ là 1 và 9. Suy ra có hai CSN: $(1, 3, 9)$ với $q=3$ và $(9, 3, 1)$ với $q=1/3$. \
    d) Sai. Tồn tại bộ $(9, 3, 1)$ có công bội $q=1/3 < 1$.
  ]
))

#q-wrap(dir: "doc", ds(
  [Đồng vị Carbon-14 có chu kỳ bán rã là 5730 năm (sau mỗi 5730 năm, khối lượng C-14 giảm đi một nửa). Một mẩu xương hóa thạch hiện tại chứa 2.5 gram C-14. Các nhà khảo cổ xác định lúc sinh vật còn sống, xương có 20 gram C-14.],
  (
    True([Sau 5730 năm kể từ lúc chết, lượng C-14 còn lại 10 gram.]),
    True([Lượng C-14 còn lại tạo thành một cấp số nhân lùi vô hạn.]),
    True([Sinh vật này đã chết cách đây khoảng 17190 năm.]),
    [Nếu chờ thêm 5730 năm nữa, lượng C-14 sẽ hoàn toàn biến mất (bằng 0).]
  ),
  loigiai: [
    a) Đúng. Chu kỳ bán rã chia lượng ban đầu (20g) cho 2. Vậy còn 10g. \
    b) Đúng. Mỗi kỳ nhân với công bội $q = 1/2$. $|q| < 1$ nên đây là CSN lùi vô hạn. \
    c) Đúng. Lượng thay đổi: $20 -> 10 -> 5 -> 2.5$. Trải qua 3 chu kỳ. Thời gian: $3 times 5730 = 17190$ năm. \
    d) Sai. Sau 1 chu kỳ nữa còn 1.25g. Về lý thuyết nó tiến về giới hạn 0 chứ không bao giờ biến mất hoàn toàn.
  ]
))

#q-wrap(dir: "doc", ds(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    
    // Step 0: Outer solid triangle
    line((0, 0), (4, 0), (2, 3.464), close: true, fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
  
    // Sierpinski cutouts (tô màu xám, depth 4)
    draw-sierpinski(0, 0, 4, 0, 2, 3.464, 1, 4, rgb("#f6f8f4"), 0.3pt + c-book)   
  }),   
  [Một hình tam giác đều có diện tích bằng $1$. Ở bước thứ nhất, người ta chia tam giác này thành $4$ tam giác đều nhỏ bằng nhau và tô màu xám tam giác ở chính giữa như hình vẽ (bỏ đi tam giác này). Ở bước kế tiếp, lặp lại quy trình trên đối với các tam giác đều chưa bị tô màu còn lại. Gọi $S_n$ là diện tích phần chưa bị tô màu sau bước thứ $n$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Diện tích phần chưa bị tô màu sau bước thứ nhất là $S_1 = 3/4$.]),
    [Dãy số $(S_n)$ lập thành một cấp số nhân có công bội $q = 1/4$.],
    True([Công thức diện tích phần chưa bị tô màu sau bước thứ $n$ là $S_n = (3/4)^n$.]),
    True([Sau đúng 10 bước thực hiện, diện tích phần đã bị tô màu xám vượt quá $94\%$ diện tích tam giác đều ban đầu.])
  ),
  loigiai: [
    a) Đúng. Sau bước 1, ta bỏ đi 1 tam giác ở giữa nên còn lại 3 tam giác nhỏ. Diện tích chưa tô là $3/4$ diện tích ban đầu. \
    b) Sai. Ở mỗi bước tiếp theo, diện tích chưa tô giảm đi một lượng bằng $1/4$ của chính nó, tức là nhân với công bội $q = 3/4$ chứ không phải $1/4$. \
    c) Đúng. Số hạng đầu $S_1 = 3/4$, công bội $q = 3/4$ nên $S_n = S_1 dot q^(n-1) = (3/4)^n$. \
    d) Đúng. Diện tích phần đã tô màu là $T_n = 1 - S_n = 1 - (3/4)^n$. \
    Với $n=10$, $T_(10) = 1 - (3/4)^(10) = 1 - 0.0563 = 0.9437 = 94.37\% > 94\%$.
  ]
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 9)

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (6, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.7, -0.4), [tháng])
    
    // Ticks & Labels
    content((0, 0.3), [0])
    content((1.2, 0.3), [1])
    content((2.4, 0.3), [2])
    content((3.6, 0.3), [...])
    content((4.8, 0.3), [35])
    content((5.8, 0.3), [36])
    
    // Deposits A=10 tr (downward arrows)
    line((0, 0), (0, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((0, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    line((1.2, 0), (1.2, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((1.2, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    line((2.4, 0), (2.4, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((2.4, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    line((4.8, 0), (4.8, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((4.8, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    // Upward arrow S_36 at t=36
    line((5.8, 0), (5.8, 2.5), stroke: 1.8pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
    content((5.8, 2.8), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[$S_(36)$])
    
    // Accumulation curves
    bezier((0, 0), (5.8, 0.1), (2.9, 1.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((2.0, 1.1), text(size: 7pt, fill: gray)[$10(1+r)^(36)$])
    
    bezier((1.2, 0), (5.8, 0.3), (3.5, 1.4), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((3.5, 0.8), text(size: 7pt, fill: gray)[$10(1+r)^(35)$])
    
    bezier((4.8, 0), (5.8, 0.5), (5.3, 0.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((5.3, 0.4), text(size: 7pt, fill: gray)[$10(1+r)$])
  }),
  [Anh Cường tiết kiệm mua ô tô bằng hình thức *gửi góp định kỳ*. Vào *đầu mỗi tháng*, gửi vào tài khoản $10$ triệu đồng. Lãi suất tiết kiệm là $0.5%$/tháng. Hỏi sau đúng $36$ tháng, tổng số tiền (cả gốc và lãi) có được là bao nhiêu triệu đồng? (Làm tròn đến chữ số thập phân thứ nhất).],
  [395.3],
  loigiai: [
    Sử dụng công thức tiền gửi góp định kỳ mỗi tháng: \
    $S_n = A/r (1+r) [(1+r)^n - 1]$ \
    $S_(36) = 10/0.005 (1.005) [(1.005)^(36) - 1] = 2000 times 1.005 times [(1.005)^36 - 1] approx 395.328$ triệu đồng. \
    Làm tròn được $395.3$.
  ]
))

#q-wrap(dir: "doc", tln(
  [Bông tuyết Koch: Bắt đầu từ tam giác đều có diện tích $S_0 = sqrt(3)/4$. Ở mỗi bước, thêm các tam giác nhỏ vào giữa các cạnh của hình hiện tại. Tổng diện tích của Bông tuyết Koch khi $n -> oo$ hội tụ về giá trị bằng $k$ lần diện tích tam giác ban đầu. Tìm $k$ (viết dạng phân số $a/b$, điền $a/b$).],
  [8/5],
  loigiai: [
    Tổng diện tích Bông tuyết Koch được tính bằng: \
    $S_oo = S_0 + 3 S_0/9 + 12 S_0/81 + ... $ \
    Phần diện tích thêm vào là một CSN lùi vô hạn với số hạng đầu là $S_1 = 1/3 S_0$ và công bội $q = 4/9$. \
    $S_oo = S_0 + (1/3 S_0) / (1 - 4/9) = S_0 + (1/3 S_0) / (5/9) = S_0 + 3/5 S_0 = 8/5 S_0$. \
    Vậy $k = 8/5$.
  ]
))

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 45%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Step 0: Outer solid square
    rect((0, 0), (4, 4), fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
  
    // Sierpinski carpet cutouts (tô màu xám, depth 3)
    draw-sierpinski-carpet(0, 0, 4, 4, 1, 3, rgb("#f6f8f4"), 0.3pt + c-book)   
  }),   
  [Một hình vuông (Thảm Sierpinski) có cạnh bằng $1$ m. Ở bước thứ nhất, người ta chia hình vuông thành $9$ hình vuông nhỏ bằng nhau và tô màu xám hình vuông ở chính giữa (bỏ đi phần này). Ở các bước tiếp theo, lặp lại quy trình trên đối với các hình vuông chưa bị tô màu còn lại. Hỏi sau ít nhất bao nhiêu bước thì diện tích phần chưa bị tô màu nhỏ hơn $10\%$ diện tích hình vuông ban đầu?],
  [20],
  loigiai: [
    Gọi diện tích phần chưa bị tô màu sau bước $n$ là $S_n$. \
    Ở mỗi bước, diện tích phần chưa bị tô màu bằng $8/9$ diện tích phần chưa bị tô màu ở bước ngay trước đó. \
    Do đó, $(S_n)$ là một cấp số nhân có $S_1 = 8/9$ và công bội $q = 8/9$. \
    Suy ra $S_n = (8/9)^n$. \
    Yêu cầu bài toán: $S_n < 10% = 0.1 <=> (8/9)^n < 0.1 <=> n > log_(8/9)(0.1) approx 19.55$. \
    Vì $n$ là số nguyên dương, nên cần ít nhất $n = 20$ bước.
  ]
))

#q-wrap(dir: "doc", tln(
  [Một quả bóng cao su được thả từ độ cao $10$ m. Mỗi lần chạm đất, quả bóng nảy lên độ cao bằng $3/4$ độ cao trước đó. Tổng chiều dài quãng đường quả bóng di chuyển (từ lúc thả cho đến khi dừng hẳn) bằng bao nhiêu mét?],
  [70],
  loigiai: [
    Quãng đường rơi đầu tiên là 10. Sau đó bóng nảy lên và rơi xuống các đoạn có độ dài là $2 times 10(3/4), 2 times 10(3/4)^2, ...$ \
    Đây là tổng của một CSN lùi vô hạn với phần nảy lên-rơi xuống. \
    $S = 10 + 2 times (10 times 3/4) / (1 - 3/4) = 10 + 2 times 7.5 / (1/4) = 10 + 2 times 30 = 70$ mét.
  ]
))

#q-wrap(dir: "doc", tln(
  [Một chiến dịch truyền thông quảng bá sản phẩm mới bắt đầu bằng việc gửi email giới thiệu đến $10$ người (ngày thứ 1). Sang ngày thứ hai, mỗi người trong số $10$ người này chuyển tiếp email đó cho $3$ người khác (chưa từng nhận email). Kế tiếp ngày thứ ba, mỗi người nhận được email trong ngày thứ hai lại chuyển tiếp cho $3$ người khác mới hoàn toàn. Cứ như vậy, chiến dịch tiếp diễn theo một cấp số nhân. Hỏi sau đúng $7$ ngày, tổng cộng có bao nhiêu người đã nhận được email giới thiệu sản phẩm này (tính cả 10 người ban đầu)?],
  [10930],
  loigiai: [
    Số người nhận email mới mỗi ngày lập thành CSN có $u_1 = 10$, công bội $q = 3$. \
    Tổng số người nhận được email sau 7 ngày chính là tổng 7 số hạng đầu: \
    $S_7 = u_1 (q^7 - 1) / (q - 1) = 10 times (3^7 - 1) / (3 - 1) = 10 times (2187 - 1) / 2 = 10930$ người.
  ]
))

#q-wrap(dir: "doc", tln(
  [Một bệnh nhân được tiêm một liều thuốc $120$ mg. Cứ sau mỗi giờ, lượng thuốc trong cơ thể bệnh nhân lại giảm đi $15\%$ so với giờ trước đó (được đào thải qua thận). Hỏi sau đúng $8$ giờ kể từ lúc tiêm, lượng thuốc còn lại trong cơ thể bệnh nhân là bao nhiêu miligam? (Làm tròn kết quả đến hàng đơn vị).],
  [33],
  loigiai: [
    Lượng thuốc ban đầu là $A = 120$ mg. \
    Sau mỗi giờ lượng thuốc còn lại bằng $100% - 15% = 85% = 0.85$ so với giờ trước đó. \
    Lượng thuốc còn lại sau mỗi giờ lập thành CSN có $u_0 = 120, q = 0.85$. \
    Sau 8 giờ, lượng thuốc còn lại là: $u_8 = 120 times 0.85^8 approx 32.699$ mg. \
    Làm tròn đến hàng đơn vị ta được $33$ mg.
  ]
))

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 40%,
  fig: cetz.canvas(length: 1.0cm, {
    import cetz.draw: *
    
    // Ceiling
    line((-2, 3), (2, 3), stroke: 1.5pt + gray)
    circle((0, 3), radius: 0.06, fill: black)
    line((0, 3), (0, 0), stroke: (paint: gray, dash: "dotted"))
    
    // Swing 1 (left side)
    let x1 = -1.5
    let y1 = 0.402
    line((0, 3), (x1, y1), stroke: 0.8pt + gray)
    circle((x1, y1), radius: 0.2, fill: rgb("bae6fd"), stroke: c-book)
    
    // Swing 2 (right side)
    let x2 = 1.026
    let y2 = 0.181
    line((0, 3), (x2, y2), stroke: (paint: gray, dash: "dashed"))
    circle((x2, y2), radius: 0.17, fill: rgb("7dd3fc"), stroke: c-book.lighten(20%))
    
    // Swing 3 (left side)
    let x3 = -0.725
    let y3 = 0.09
    line((0, 3), (x3, y3), stroke: (paint: gray, dash: "dashed"))
    circle((x3, y3), radius: 0.14, fill: rgb("38bdf8"), stroke: c-book.lighten(40%))
    
    // Curved arrows for swing paths
    arc((0, 3), start: 240deg, stop: 290deg, radius: 2.8, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
    arc((0, 3), start: 290deg, stop: 256deg, radius: 2.6, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
  }),
  [Một con lắc đơn khi dao động có chiều dài quỹ đạo của lần vung đầu tiên (từ vị trí biên bên này sang biên bên kia) là $20$ cm. Kể từ lần vung thứ hai, do sức cản không khí, chiều dài quỹ đạo của mỗi lần vung chỉ bằng $98\%$ chiều dài quỹ đạo của lần vung ngay trước đó. Tính tổng quãng đường con lắc đã di chuyển được cho đến khi nó dừng hẳn (làm tròn đến hàng đơn vị của cm).],
  [1000],
  loigiai: [
    Chiều dài quỹ đạo các lần vung của con lắc tạo thành một cấp số nhân lùi vô hạn với $u_1 = 20$ cm và công bội $q = 98\% = 0.98$. \
    Tổng quãng đường con lắc di chuyển được cho đến khi dừng hẳn là: \
    $S = u_1 / (1 - q) = 20 / (1 - 0.98) = 20 / 0.02 = 1000$ cm.
  ]
))

#q-wrap(dir: "doc", tln( 
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (6, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.8, 0.3), [tháng])
    
    // Ticks
    content((0, 0.3), [0])
    content((1.2, 0.3), [1])
    content((2.4, 0.3), [2])
    content((3.6, 0.3), [...])
    content((4.8, 0.3), [12])
    
    // Upward arrow V at t=0
    line((0, 0), (0, 1.8), stroke: 2pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
    content((0, 2.1), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[Vốn gốc 15 tr])
    
    // Repayments X at t=1, 2, 12
    line((1.2, 0), (1.2, -1.0), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.12))
    content((1.2, -1.3), text(size: 8pt, fill: rgb("dc2626"))[$X$])
    
    line((2.4, 0), (2.4, -1.0), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.12))
    content((2.4, -1.3), text(size: 8pt, fill: rgb("dc2626"))[$X$])
    
    line((4.8, 0), (4.8, -1.0), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.12))
    content((4.8, -1.3), text(size: 8pt, fill: rgb("dc2626"))[$X$])
    
    // Curved discounting arrows (Bezier curves going backwards below axis)
    bezier((1.2, -1.0), (0, -0.2), (0.6, -0.8), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((0.8, -0.5), text(size: 7pt, fill: blue)[$X/(1+r)$])
    
    bezier((2.4, -1.0), (0, -0.4), (1.2, -1.3), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((1.8, -0.9), text(size: 7pt, fill: blue)[$X/(1+r)^2$])
    
    bezier((4.8, -1.0), (0, -0.6), (2.4, -2.0), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((3.5, -1.5), text(size: 7pt, fill: blue)[$X/(1+r)^(12)$])
  }),
  [Bạn An mua một chiếc điện thoại trị giá $15$ triệu đồng bằng hình thức trả góp với lãi suất $1.2\%$/tháng. Bạn An thỏa thuận trả đều đặn vào cuối mỗi tháng một số tiền cố định là $X$ nghìn đồng trong vòng đúng $12$ tháng thì hết nợ. Tính số tiền $X$ mà bạn An phải trả mỗi tháng (làm tròn đến hàng đơn vị).],
  [1350],
  loigiai: [
    Áp dụng công thức số tiền trả góp hàng tháng với trị giá món hàng $V = 15000$ (nghìn đồng), số kỳ trả $N = 12$, lãi suất $r = 1.2\% = 0.012$: \
    $X = (V dot r dot (1+r)^N) / ((1+r)^N - 1) = (15000 times 0.012 times (1.012)^(12)) / ((1.012)^(12) - 1) approx 1349.665$ nghìn đồng. \
    Làm tròn đến hàng đơn vị của nghìn đồng ta được $1350$ nghìn đồng (tức là $1,350,000$ đồng/tháng).
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho cấp số nhân lùi vô hạn $(u_n)$ có công bội $q$ thỏa mãn: $u_1 - u_3 = 24$ và $u_2 - u_4 = 12$. Tính tổng $S$ của cấp số nhân lùi vô hạn đã cho.],
  [64],
  loigiai: [
    Ta có hệ phương trình:
    $ cases(u_1 - u_3 = 24, u_2 - u_4 = 12) <=> cases(u_1 (1 - q^2) = 24, u_1 q (1 - q^2) = 12) $
    Chia vế theo vế hai phương trình, ta được: $q = 12/24 = 1/2$. \
    Thay $q = 1/2$ vào phương trình đầu tiên:
    $ u_1 (1 - 1/4) = 24 <=> 3/4 u_1 = 24 <=> u_1 = 32. $
    Vì $|q| = 1/2 < 1$, đây là cấp số nhân lùi vô hạn. Tổng của cấp số nhân này là:
    $ S = u_1 / (1 - q) = 32 / (1 - 1/2) = 64. $
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho cấp số nhân $(u_n)$ thỏa mãn: $u_1 + u_2 + u_3 = 14$ và $u_4 + u_5 + u_6 = 112$. Tìm số hạng đầu tiên $u_1$ của cấp số nhân đó.],
  [2],
  loigiai: [
    Ta có hệ phương trình:
    $ cases(u_1 + u_2 + u_3 = 14, u_4 + u_5 + u_6 = 112) <=> cases(u_1 (1 + q + q^2) = 14, u_1 q^3 (1 + q + q^2) = 112) $
    Chia vế theo vế phương trình thứ hai cho phương trình thứ nhất, ta được:
    $ q^3 = 112/14 = 8 <=> q = 2. $
    Thay $q = 2$ vào phương trình đầu tiên:
    $ u_1 (1 + 2 + 2^2) = 14 <=> 7 u_1 = 14 <=> u_1 = 2. $
  ]
))


