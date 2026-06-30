#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Bài 2 — Cấp Số Cộng & Các Mô Hình Tuyến Tính])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 7)

#q-wrap(dir: "doc", tn(
  [Cho cấp số cộng $(u_n)$ có $u_1 = -3$ và công sai $d = 1/2$. Khẳng định nào sau đây là đúng?],
  (
    [$u_n = -3 + 1/2 n$],
    True([$u_n = -7/2 + 1/2 n$]),
    [$u_n = -3 - 1/2 n$],
    [$u_n = -5/2 + 1/2 n$]
  ),
  loigiai: [
    #step[*Áp dụng công thức:* \
      Công thức tổng quát: $u_n = u_1 + (n-1)d = -3 + 1/2 (n-1) = -7/2 + 1/2 n$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho một cấp số cộng có $u_4 = -12$ và $u_14 = 18$. Tìm công sai $d$ của cấp số cộng này.],
  (
    True([$d = 3$]),
    [$d = -3$],
    [$d = 3/10$],
    [$d = 1$]
  ),
  loigiai: [
    #step[*Sử dụng tính chất:* \
      Ta có $u_14 = u_4 + 10d => 18 = -12 + 10d => 10d = 30 => d = 3$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tổng của $100$ số nguyên dương lẻ đầu tiên ($1, 3, 5, ..., 199$) bằng bao nhiêu?],
  (
    [$5050$],
    True([$10000$]),
    [$9900$],
    [$19900$]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Dãy $1, 3, 5,...$ là CSC có $u_1 = 1, d = 2$. \
    $S_(100) = 100/2 [2(1) + 99(2)] = 50 [2 + 198] = 50 times 200 = 10000$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Ba số $x, 5, 2y$ theo thứ tự lập thành một cấp số cộng; đồng thời ba số $x, 4, 2y$ theo thứ tự lập thành một cấp số nhân. Giá trị của $|x - 2y|$ bằng bao nhiêu?],
  (
    [$2$],
    [$4$],
    True([$6$]),
    [$8$]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Lập CSC: $x + 2y = 10$. Lập CSN: $x dot 2y = 16$. \
    $x$ và $2y$ là nghiệm của pt $X^2 - 10X + 16 = 0 <=> X=2$ hoặc $X=8$. \
    Tập nghiệm là ${2, 8}$. Khoảng cách $|x - 2y| = |2 - 8| = 6$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Trong hợp đồng lao động, mức lương năm đầu của anh A là $120$ triệu đồng. Mỗi năm tiếp theo, lương tăng thêm $15$ triệu đồng. Hỏi tổng số tiền lương anh A nhận được sau $10$ năm làm việc là bao nhiêu?],
  (
    [$255$ triệu],
    True([$1875$ triệu]),
    [$1350$ triệu],
    [$2700$ triệu]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Cấp số cộng có $u_1 = 120, d = 15$. Số tiền lương nhận được sau 10 năm chính là $S_10$. \
    $S_(10) = 10/2 [2(120) + 9(15)] = 5 [240 + 135] = 5 times 375 = 1875$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Một chiếc đồng hồ quả lắc đánh chuông theo giờ. Vào lúc 1 giờ đánh 1 tiếng, lúc 2 giờ đánh 2 tiếng, ..., lúc 12 giờ đánh 12 tiếng. Ngoài ra, cứ mỗi nửa giờ (lúc 1h30, 2h30...) đồng hồ lại đánh 1 tiếng chuông. Hỏi trong một ngày đêm (24 giờ), đồng hồ quả lắc đó đánh tổng cộng bao nhiêu tiếng chuông?],
  (
    [156],
    True([180]),
    [204],
    [300]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Trong một chu kỳ 12 giờ (từ lúc sau 12h đến 12h): \
    - Số tiếng chuông đánh vào các giờ đúng là tổng cấp số cộng: $S = 1 + 2 + ... + 12 = (12 times 13)/2 = 78$ tiếng. \
    - Số tiếng chuông đánh vào các nửa giờ (từ 1h30 đến 12h30) gồm 12 lần, mỗi lần 1 tiếng, tổng cộng là 12 tiếng. \
    Tổng cộng chuông đánh trong 12 giờ là: $78 + 12 = 90$ tiếng. \
    Trong một ngày đêm (24 giờ, gồm hai chu kỳ 12 giờ), tổng số tiếng chuông là: $90 times 2 = 180$ tiếng.]
  ]
))

#q-wrap(dir: "doc", tn(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw stage
    rect((-1.5, -0.6), (1.5, -0.2), fill: rgb("cbd5e1"), stroke: gray)
    content((0, -0.4), text(size: 8pt)[SÂN KHẤU])
    
    // Draw concentric arcs or trapezoidal rows of seating
    for r in (0, 1, 2, 3) {
      let y = 0.3 + r * 0.4
      let w = 1.2 + r * 0.6
      line((-w, y), (w, y), stroke: 1.5pt + c-book)
      content((w + 0.5, y), text(size: 7pt, fill: luma(100))[Hàng #(r+1)])
    }
  }),
  [Một nhà hát có 25 hàng ghế xếp theo dạng hình thang cân mở rộng dần về phía sau như hình vẽ. Hàng đầu tiên có 16 ghế, mỗi hàng sau nhiều hơn hàng ngay trước nó 2 ghế. Hỏi nhà hát có tổng cộng bao nhiêu ghế?],
  (
    [800],
    [900],
    True([1000]),
    [1100]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Số ghế ở các hàng lập thành CSC có $u_1 = 16, d = 2$. \
    Tổng số ghế ở 25 hàng là: $S_(25) = 25/2 [2 u_1 + 24d] = 25/2 [2(16) + 24(2)] = 25/2 [32 + 48] = 25 times 40 = 1000$ ghế.]
  ]
))

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: 3)

#q-wrap(dir: "doc", ds(
  [Xét cấp số cộng $(u_n)$ biết $u_3 + u_(13) = 80$. Xét tính đúng/sai:],
  (
    True([Tổng $u_1 + u_(15) = 80$.]),
    True([Số hạng thứ 8 của dãy là $u_8 = 40$.]),
    True([Tổng của 15 số hạng đầu tiên là $S_(15) = 600$.]),
    [Chắc chắn cấp số cộng này là một dãy số tăng.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Tính chất: $u_3 + u_(13) = u_1 + u_(15) = 2u_1 + 14d$. \
    b) Đúng. $u_3 + u_(13) = 2 u_8 => u_8 = 80/2 = 40$. \
    c) Đúng. $S_(15) = 15/2 (u_1 + u_(15)) = 15/2 times 80 = 600$. \
    d) Sai. Có thể cấp số cộng này giảm hoặc không đổi nếu $d <= 0$.]
  ]
))

#q-wrap(dir: "doc", ds(
  [Một dây chuyền trị giá 3 tỷ đồng. Khấu hao theo đường thẳng (giá trị giảm dần theo cấp số cộng) trong 15 năm, lượng tiền khấu hao mỗi năm là như nhau. Sau 15 năm giá trị máy bằng $0$.],
  (
    True([Mức khấu hao mỗi năm là $200$ triệu đồng.]),
    [Giá trị còn lại là một cấp số cộng có công sai $d = 200$.],
    True([Vào cuối năm thứ 5, giá trị còn lại của máy là $2$ tỷ đồng.]),
    [Tổng số tiền trích khấu hao lũy kế đến hết năm thứ 10 là $1.5$ tỷ đồng.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Mỗi năm giảm $3000 / 15 = 200$ triệu. \
    b) Sai. Giá trị giảm dần nên công sai phải là $d = -200$. \
    c) Đúng. Cuối năm 5 (tương đương đầu năm 6): $u_6 = u_1 + 5d = 3000 - 1000 = 2000$ (tức 2 tỷ). \
    d) Sai. 10 năm trích được $10 times 200 = 2000$ triệu = $2$ tỷ đồng.]
  ]
))

#q-wrap(dir: "doc", ds(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw two side rails of the ladder
    line((-0.5, 3), (-0.8, 0), stroke: 2pt + rgb("854d0e")) 
    line((0.5, 3), (0.8, 0), stroke: 2pt + rgb("854d0e")) 
    
    // Draw 6 rungs of the ladder 
    for i in range(0, 6) {
      let t = i / 5
      let y = t * 2.8 + 0.1
      let half_w = (1 - t) * 0.8 + t * 0.5
      line((-half_w, y), (half_w, y), stroke: 1.5pt + rgb("a16207"))
    }
  }),
  [Một cái thang gỗ có 10 bậc. Chiều dài các bậc thang từ dưới lên trên giảm dần đều (lập thành một cấp số cộng). Bậc dưới cùng dài $80$ cm, bậc trên cùng dài $50$ cm. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Chiều dài của các bậc thang lập thành một cấp số cộng giảm với công sai $d = -10/3$ cm.]),
    True([Bậc thang thứ 5 (tính từ dưới lên) có chiều dài là $200/3$ cm.]),
    True([Tổng chiều dài thanh gỗ dùng để làm các bậc thang là $6.5$ mét.]),
    [Bậc thang ở chính giữa (bậc thứ 6 tính từ dưới lên) có chiều dài là $65$ cm.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Ta coi bậc dưới cùng là $u_1 = 80$, bậc trên cùng là $u_(10) = 50$. \
    Ta có: $u_(10) = u_1 + 9d <=> 50 = 80 + 9d => 9d = -30 => d = -10/3$ cm. \
    b) Đúng. Bậc thứ 5 từ dưới lên: $u_5 = u_1 + 4d = 80 + 4(-10/3) = 240/3 - 40/3 = 200/3$ cm. \
    c) Đúng. Tổng chiều dài các bậc thang là: $S_(10) = 10/2 (u_1 + u_(10)) = 5 times (80 + 50) = 650$ cm = $6.5$ m. \
    d) Sai. Bậc thứ 6 tính từ dưới lên là: $u_6 = u_1 + 5d = 80 + 5(-10/3) = 80 - 50/3 = 190/3 approx 63.33$ cm chứ không phải $65$ cm.]
  ]
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 9)

#q-wrap(dir: "doc", tln(
  [Cho cấp số cộng $(u_n)$ có công sai $d > 0$. Biết $u_2 u_5 = 54$ và $u_1 + u_6 = 15$. Tính giá trị của $u_4$.],
  [8],
  loigiai: [
    #step[*B1: Sử dụng tính chất đối xứng:* \
      Ta có $u_1 + u_6 = u_2 + u_5 = 15$. Hai số $u_2, u_5$ có tổng bằng 15, tích bằng 54.]
    #step[*B2: Giải phương trình bậc hai:* \
      Giải phương trình $X^2 - 15X + 54 = 0$ được hai nghiệm 6 và 9. \
      Vì công sai $d > 0$ nên $u_2 < u_5$. Vậy $u_2 = 6, u_5 = 9$.]
    #step[*B3: Tìm số hạng cần thiết:* \
      Khoảng cách $u_5 - u_2 = 3d => 3d = 3 => d=1$. \
      Khi đó $u_4 = u_5 - d = 9 - 1 = 8$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Kỹ sư A nhận hợp đồng khoan cái giếng sâu $50$ mét. Bảng báo giá: mét đầu giá $100$ nghìn. Từ mét thứ 2, mỗi mét sâu thêm có giá đắt hơn mét ngay trước đó $20$ nghìn. Tổng chi phí khoan xong giếng là bao nhiêu triệu đồng?],
  [29.5],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Chi phí mỗi mét lập thành CSC với $u_1 = 100, d = 20$. Số mét $n = 50$. \
    Tổng chi phí: $S_(50) = 50/2 [2(100) + 49(20)] = 25 [200 + 980] = 25 times 1180 = 29500$ nghìn. \
    Đổi ra triệu đồng: $29.5$ triệu.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Kim tự tháp gạch: Tầng trên cùng có $1$ viên. Tầng thứ 2 có $4$ viên. Tầng thứ 3 có $7$ viên. Kim tự tháp có tất cả $20$ tầng. Tổng số viên gạch cần dùng là bao nhiêu?],
  [590],
  loigiai: [
    #step[*B1: Xác định dãy số:* \
      Số gạch tạo thành CSC: $1, 4, 7...$ có $u_1 = 1, d = 3$.]
    #step[*B2: Tính tổng 20 tầng:* \
      $S_(20) = 20/2 [2(1) + 19(3)] = 10 [2 + 57] = 590$ viên.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một học sinh đặt kế hoạch tiết kiệm tiền mua xe đạp. Tháng thứ nhất tiết kiệm được $200$ nghìn đồng. Kể từ tháng thứ hai, mỗi tháng tiết kiệm được nhiều hơn tháng ngay trước đó $30$ nghìn đồng. Hỏi sau đúng $2$ năm ($24$ tháng), tổng số tiền học sinh đó tiết kiệm được là bao nhiêu triệu đồng?],
  [13.08],
  loigiai: [
    #step[*B1: Mô hình hóa dòng tiền:* \
      Số tiền tiết kiệm mỗi tháng lập thành CSC có $u_1 = 200$ nghìn đồng, $d = 30$ nghìn đồng. Số tháng tiết kiệm $n = 24$.]
    #step[*B2: Tính tổng tiền tiết kiệm:* \
      Tổng số tiền tích lũy được: $S_(24) = 24/2 [2(200) + 23(30)] = 12 [400 + 690] = 13080$ nghìn đồng. \
      Đổi ra triệu đồng: $13.08$ triệu đồng.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một dàn pin năng lượng mặt trời có các tấm pin được xếp thành hình thang cân. Hàng trên cùng (hàng thứ nhất) có $12$ tấm pin. Mỗi hàng ngay dưới xếp nhiều hơn hàng ngay trên nó $3$ tấm pin. Hàng dưới cùng có $57$ tấm pin. Tính tổng số tấm pin được lắp đặt trên dàn này.],
  [552],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Số tấm pin ở mỗi hàng lập thành CSC có $u_1 = 12, d = 3$. \
    Hàng cuối cùng có $u_n = 57$. Ta có: \
    $u_n = u_1 + (n-1)d <=> 57 = 12 + (n-1) times 3 => n = 16$ hàng. \
    Tổng số tấm pin lắp đặt: $S_(16) = 16/2 (u_1 + u_(16)) = 8 times (12 + 57) = 552$ tấm pin.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một vận động viên chạy bộ lên kế hoạch tập luyện chuẩn bị cho một giải chạy Marathon. Ngày đầu tiên anh chạy $5$ km. Kể từ ngày thứ hai, mỗi ngày anh tăng quãng đường chạy thêm $800$ mét so với ngày ngay trước đó. Hỏi sau đúng $30$ ngày tập luyện liên tục, tổng quãng đường vận động viên này đã chạy được là bao nhiêu kilômét?],
  [498],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Quãng đường chạy mỗi ngày lập thành một CSC với $u_1 = 5$ km, công sai $d = 800$ m = $0.8$ km. \
    Tổng quãng đường chạy được sau 30 ngày tập luyện là: \
    $S_(30) = 30/2 [2 u_1 + 29d] = 15 times [2(5) + 29(0.8)] = 15 times [10 + 23.2] = 15 times 33.2 = 498$ km.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một mỏ khai thác than dự kiến bắt đầu khai thác từ năm 2026 với sản lượng $5.2$ triệu tấn. Do điều kiện địa chất khó khăn, kể từ năm thứ hai, sản lượng khai thác dự kiến giảm $0.15$ triệu tấn mỗi năm so với năm trước đó. Tính tổng sản lượng than dự kiến khai thác được của mỏ này sau đúng $12$ năm hoạt động (triệu tấn).],
  [52.5],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Sản lượng than khai thác mỗi năm lập thành một CSC với $u_1 = 5.2$, công sai $d = -0.15$. \
    Tổng sản lượng khai thác sau 12 năm là: \
    $S_(12) = 12/2 [2 u_1 + 11d] = 6 times [2(5.2) + 11(-0.15)] = 6 times [10.4 - 1.65] = 6 times 8.75 = 52.5$ triệu tấn.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Tính tổng của tất cả các số tự nhiên có hai chữ số chia hết cho 3.],
  [1665],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Các số tự nhiên có hai chữ số chia hết cho 3 lập thành một cấp số cộng:
    $12, 15, 18, ..., 99$
    với số hạng đầu $u_1 = 12$, công sai $d = 3$ và số hạng cuối $u_n = 99$. \
    Số lượng các số hạng là:
    $ n = (99 - 12) / 3 + 1 = 30. $
    Tổng của cấp số cộng này là:
    $ S_(30) = 30/2 (u_1 + u_n) = 15 times (12 + 99) = 1665. $]
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho cấp số cộng $(u_n)$ có tổng $n$ số hạng đầu tiên được tính bằng công thức $S_n = 3n^2 + 5n$ với mọi $n >= 1$. Tìm công sai $d$ của cấp số cộng đó.],
  [6],
  loigiai: [
    #step[*B1: Tìm $u_1$ và $u_2$:* \
      Ta có:
      - Với $n = 1$: $S_1 = u_1 = 3(1)^2 + 5(1) = 8$. \
      - Với $n = 2$: $S_2 = u_1 + u_2 = 3(2)^2 + 5(2) = 22$. \
      Từ đó suy ra số hạng thứ hai: $u_2 = S_2 - u_1 = 22 - 8 = 14$.]
    #step[*B2: Tính công sai:* \
      Công sai của cấp số cộng là: $d = u_2 - u_1 = 14 - 8 = 6$.]
  ]
))

