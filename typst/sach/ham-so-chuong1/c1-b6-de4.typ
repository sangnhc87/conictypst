#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 04 - DỰNG HÀM BÀI TOÁN THỰC TẾ]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (8 câu)], count: 8)

#q-wrap(dir: "doc", tn(
  [Một khách sạn có $100$ phòng. Nếu giá thuê là $2$ triệu đồng/phòng/ngày thì kín phòng. Cứ mỗi lần tăng giá thêm $0.2$ triệu đồng thì có $5$ phòng bị bỏ trống. Gọi $x$ là số lần tăng giá. Hàm doanh thu $R(x)$ (triệu đồng/ngày) là: ],
  (
    [$R(x) = (2 + 0.2 x)(100 + 5 x)$],
    [$R(x) = (2 - 0.2 x)(100 - 5 x)$],
    True([$R(x) = (2 + 0.2 x)(100 - 5 x)$]),
    [$R(x) = 2 dot 100 - 0.2 x - 5 x$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá. Khi đó giá mới là $2 + 0.2 x$ (triệu đồng/phòng/ngày).]
    #step[Số phòng được thuê là $100 - 5 x$.]
    #step[Vậy doanh thu là $R(x) = (2 + 0.2 x)(100 - 5 x)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Với mô hình khách sạn ở câu trên, số lần tăng giá để doanh thu lớn nhất là: ],
  (
    [$4$],
    True([$5$]),
    [$6$],
    [$10$],
  ),
  accent: c-book,
  loigiai: [
    #step[$R(x) = (2 + 0.2 x)(100 - 5 x) = 200 + 10 x - x^2$.]
    #step[$R'(x) = 10 - 2 x = 0 <=> x = 5$.]
    #step[Vậy doanh thu lớn nhất khi tăng giá $5$ lần, tức giá tối ưu là $3$ triệu đồng/phòng/ngày.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một nhà máy làm việc chuẩn $40$ giờ/tuần với $60$ tổ công nhân, mỗi tổ đạt $90$ sản phẩm/giờ. Cứ mỗi lần tăng thêm $2$ giờ/tuần thì có $1$ tổ nghỉ việc và năng suất mỗi tổ giảm $3$ sản phẩm/giờ. Gọi $x$ là số lần tăng giờ. Hàm sản lượng thô $Q_0(x)$ là: ],
  (
    [$Q_0(x) = (40 + 2 x)(60 + x)(90 - 3 x)$],
    True([$Q_0(x) = (40 + 2 x)(60 - x)(90 - 3 x)$]),
    [$Q_0(x) = (40 + x)(60 - 2 x)(90 - 3 x)$],
    [$Q_0(x) = (40 + 2 x)(60 - x) + (90 - 3 x)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng $2$ giờ.]
    #step[Số giờ làm là $40 + 2 x$, số tổ còn lại là $60 - x$, năng suất mỗi tổ là $90 - 3 x$.]
    #step[Sản lượng thô bằng số giờ nhân số tổ nhân năng suất mỗi tổ, nên $Q_0(x) = (40 + 2 x)(60 - x)(90 - 3 x)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Với mô hình nhà máy ở câu trên, miền giá trị hợp lệ của $x$ là: ],
  (
    [$x in [0, 60)$],
    True([$x in [0, 30)$]),
    [$x in [0, 90)$],
    [$x in [0, 40)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Ta cần có $x >= 0$, $60 - x > 0$ và $90 - 3 x > 0$.]
    #step[Từ $60 - x > 0$ suy ra $x < 60$; từ $90 - 3 x > 0$ suy ra $x < 30$.]
    #step[Giao các điều kiện là $x in [0, 30)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một xe tải đi quãng đường $50$ km. Nếu chạy với vận tốc $20$ km/h thì chi phí nhiên liệu cho cả chuyến là $400$ nghìn đồng. Chi phí thời gian là $80$ nghìn đồng mỗi giờ. Gọi $C(v)$ là tổng chi phí (nghìn đồng) khi chạy với vận tốc $v$ km/h. Hàm $C(v)$ là: ],
  (
    [$C(v) = 20 v + 4000 slash v$],
    True([$C(v) = v^2 + frac(4000, v)$]),
    [$C(v) = 400 v^2 + frac(80, v)$],
    [$C(v) = frac(v^2, 20) + 80 v$],
  ),
  accent: c-book,
  loigiai: [
    #step[Chi phí nhiên liệu cho cả chuyến có dạng $a v^2$. Tại $v = 20$ ta có $a dot 20^2 = 400 => a = 1$.]
    #step[Chi phí thời gian có dạng $frac(b, v)$ với $b = 80 dot 50 = 4000$.]
    #step[Vậy $C(v) = v^2 + frac(4000, v)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Với mô hình chi phí ở câu trên, vận tốc tối ưu gần nhất là: ],
  (
    [$10$ km/h],
    True([$12.6$ km/h]),
    [$15$ km/h],
    [$20$ km/h],
  ),
  accent: c-book,
  loigiai: [
    #step[$C'(v) = 2 v - frac(4000, v^2)$.]
    #step[$C'(v) = 0 <=> 2 v^3 = 4000 <=> v^3 = 2000$.]
    #step[Suy ra $v = root(3, 2000) approx 12.6$ km/h.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một trang trại gieo chuẩn $100$ kg hạt giống/ha thì thu được $50$ tạ/ha. Cứ tăng thêm $10$ kg/ha thì năng suất giảm $2$ tạ/ha. Gọi $x$ là số lần tăng lượng giống. Khi đó lượng giống gieo và năng suất lần lượt là: ],
  (
    [$100 - 10 x$ và $50 - 2 x$],
    [$100 + 10 x$ và $50 + 2 x$],
    True([$100 + 10 x$ và $50 - 2 x$]),
    [$100 + x$ và $50 - 10 x$],
  ),
  accent: c-book,
  loigiai: [
    #step[Mỗi lần tăng thì lượng giống tăng thêm $10$ kg/ha, nên lượng giống là $100 + 10 x$.]
    #step[Mỗi lần tăng thì năng suất giảm $2$ tạ/ha, nên năng suất là $50 - 2 x$.]
    #step[Vậy cặp biểu thức đúng là $100 + 10 x$ và $50 - 2 x$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một hòn đảo cách bờ biển $5$ km tại điểm $O$, nhà máy $B$ nằm trên bờ và cách $O$ một đoạn $12$ km. Dự kiến đặt điểm cập bờ $M$ trên đoạn $O B$ sao cho $O M = x$ km. Biết chi phí kéo cáp ngầm là $3$ tỉ đồng/km, còn chi phí đi cáp trên bờ là $1.5$ tỉ đồng/km. Hàm tổng chi phí $T(x)$ là: ],
  (
    [$T(x) = 3(x^2 + 25) + 1.5(12 - x)$],
    True([$T(x) = 3 sqrt(x^2 + 25) + 1.5(12 - x)$]),
    [$T(x) = 3 sqrt(x + 25) + 1.5 x$],
    [$T(x) = 3 sqrt(12^2 + 25) + 1.5(12 - x)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Độ dài cáp ngầm $A M = sqrt(x^2 + 5^2) = sqrt(x^2 + 25)$.]
    #step[Độ dài cáp trên bờ $M B = 12 - x$.]
    #step[Vậy tổng chi phí là $T(x) = 3 sqrt(x^2 + 25) + 1.5(12 - x)$.]
  ],
))

#pagebreak()

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (2 câu)], count: 2)

#q-wrap(dir: "ngang", ds(
  [Một khu nghỉ dưỡng có $100$ phòng. Nếu giá niêm yết là $2$ triệu đồng/phòng/ngày thì kín phòng. Cứ mỗi lần tăng thêm $0.2$ triệu đồng thì có $5$ phòng bị bỏ trống. Chi phí vận hành cho mỗi phòng được thuê là $0.5$ triệu đồng/ngày, còn chi phí bảo trì cho mỗi phòng trống là $0.1$ triệu đồng/ngày. Gọi $x$ là số lần tăng giá. Xét các phát biểu sau:],
  (
    True([Giá niêm yết theo $x$ là $p(x) = 2 + 0.2 x$ (triệu đồng).]),
    True([Lợi nhuận theo $x$ là $L(x) = 150 + 12 x - x^2$ (triệu đồng/ngày).]),
    [Lợi nhuận lớn nhất đạt được khi $x = 5$.],
    True([Mức giá tối ưu là $3.2$ triệu đồng/phòng/ngày.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Mỗi lần tăng thêm $0.2$ triệu đồng nên $p(x) = 2 + 0.2 x$.
    - b) Đúng. Doanh thu: $R(x) = (2 + 0.2 x)(100 - 5 x) = 200 + 10 x - x^2$. Chi phí: $C(x) = 0.5(100 - 5 x) + 0.1(5 x) = 50 - 2 x$. Do đó $L(x) = R(x) - C(x) = 150 + 12 x - x^2$.
    - c) Sai. $L'(x) = 12 - 2 x = 0 <=> x = 6$.
    - d) Đúng. Khi $x = 6$, giá tối ưu là $2 + 0.2 dot 6 = 3.2$ triệu đồng/phòng/ngày.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một phương tiện đi quãng đường $60$ km với vận tốc $v$ km/h, $0 < v <= 20$. Biết rằng nếu chạy với vận tốc $30$ km/h thì chi phí nhiên liệu cho cả chuyến là $540$ nghìn đồng. Chi phí thời gian là $90$ nghìn đồng mỗi giờ. Gọi $C(v)$ là tổng chi phí của chuyến đi. Xét các phát biểu sau:],
  (
    True([Hàm chi phí là $C(v) = 0.6 v^2 + frac(5400, v)$.]),
    True([Nếu bỏ ràng buộc $v <= 20$ thì vận tốc tối ưu là $v_0 = root(3, 4500) approx 16.5$ km/h.]),
    [Tại vận tốc tối ưu, chi phí nhiên liệu bằng chi phí thời gian.],
    True([Nếu giới hạn vận tốc giảm còn $15$ km/h thì chi phí tối thiểu đạt tại $v = 15$ km/h.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Từ $a dot 30^2 = 540$ suy ra $a = 0.6$, còn $b = 90 dot 60 = 5400$.
    - b) Đúng. $C'(v) = 1.2 v - frac(5400, v^2) = 0 <=> v^3 = 4500$, nên $v_0 = root(3, 4500) approx 16.5$ km/h.
    - c) Sai. Tại vận tốc tối ưu, từ $2 a v = b slash v^2$ suy ra $frac(b, v) = 2 a v^2$, tức chi phí thời gian gấp đôi chi phí nhiên liệu.
    - d) Đúng. Vì $16.5 > 15$, nên trên miền $0 < v <= 15$ hàm vẫn đang giảm; do đó chi phí nhỏ nhất đạt tại biên phải $v = 15$ km/h.
  ],
))

#pagebreak()

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (4 câu)], count: 4)

#q-wrap(dir: "doc", tln(
  [Một khu nghỉ dưỡng có $90$ phòng. Nếu giá thuê là $2$ triệu đồng/phòng/ngày thì kín phòng. Cứ mỗi lần tăng giá thêm $0.2$ triệu đồng thì có $3$ phòng bị bỏ trống. Gọi $x$ là số lần tăng giá. Tìm mức giá thuê tối ưu để doanh thu mỗi ngày lớn nhất và tính doanh thu lớn nhất đó.],
  [$4$ triệu đồng/phòng/ngày; $240$ triệu đồng/ngày],
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá.]
    #table(
      columns: (1.4fr, 2.6fr),
      stroke: 0.4pt + gray,
      inset: 6pt,
      [*Đại lượng*], [*Biểu thức theo $x$*],
      [Giá thuê], [$2 + 0.2 x$],
      [Số phòng được thuê], [$90 - 3 x$],
      [Doanh thu], [$R(x) = (2 + 0.2 x)(90 - 3 x)$],
    )
    #step[Khai triển: $R(x) = 180 + 12 x - 0.6 x^2$.]
    #step[$R'(x) = 12 - 1.2 x = 0 <=> x = 10$. Vì hệ số bậc hai âm nên đây là điểm cho doanh thu lớn nhất.]
    #step[Giá thuê tối ưu là $2 + 0.2 dot 10 = 4$ triệu đồng/phòng/ngày.]
    #step[Doanh thu lớn nhất là $R(10) = 4 dot 60 = 240$ triệu đồng/ngày.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một dây chuyền sản xuất làm việc chuẩn $40$ giờ/tuần, mỗi giờ tạo ra $500$ sản phẩm tốt. Cứ mỗi lần tăng thêm $2$ giờ/tuần thì năng suất bình quân mỗi giờ giảm $15$ sản phẩm, đồng thời số phế phẩm phát sinh thêm là $20 x^2$ sản phẩm/tuần, trong đó $x$ là số lần tăng giờ. Hỏi nên vận hành bao nhiêu giờ mỗi tuần để số sản phẩm tốt thu được là lớn nhất?],
  [$48$ giờ/tuần],
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng thêm $2$ giờ. Khi đó số giờ làm là $40 + 2 x$, năng suất tốt mỗi giờ là $500 - 15 x$.]
    #table(
      columns: (1.4fr, 2.6fr),
      stroke: 0.4pt + gray,
      inset: 6pt,
      [*Đại lượng*], [*Biểu thức theo $x$*],
      [Sản lượng trước khi trừ phế phẩm], [$(40 + 2 x)(500 - 15 x)$],
      [Phế phẩm], [$20 x^2$],
      [Sản lượng tốt], [$Q(x) = (40 + 2 x)(500 - 15 x) - 20 x^2$],
    )
    #step[Khai triển: $Q(x) = 20000 + 400 x - 50 x^2$.]
    #step[$Q'(x) = 400 - 100 x = 0 <=> x = 4$. Vì $Q''(x) = -100 < 0$ nên đây là điểm cực đại.]
    #step[Vậy số giờ vận hành tối ưu là $40 + 2 dot 4 = 48$ giờ/tuần.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một xe tải chạy quãng đường $80$ km. Nếu chạy với vận tốc $20$ km/h thì chi phí nhiên liệu cho cả chuyến là $320$ nghìn đồng. Chi phí thời gian là $75$ nghìn đồng mỗi giờ. Hỏi vận tốc nào làm tổng chi phí nhỏ nhất và chi phí tối thiểu xấp xỉ bao nhiêu?],
  [$approx 15.5$ km/h; $approx 579$ nghìn đồng],
  accent: c-book,
  loigiai: [
    #step[Chi phí nhiên liệu có dạng $a v^2$. Từ $a dot 20^2 = 320$ suy ra $a = 0.8$.]
    #step[Chi phí thời gian có dạng $frac(b, v)$ với $b = 75 dot 80 = 6000$. Vậy $C(v) = 0.8 v^2 + frac(6000, v)$.]
    #step[$C'(v) = 1.6 v - frac(6000, v^2) = 0 <=> 1.6 v^3 = 6000 <=> v^3 = 3750$.]
    #step[Suy ra $v^* = root(3, 3750) approx 15.5$ km/h.]
    #step[Chi phí tối thiểu xấp xỉ $C(v^*) = 0.8 (15.5)^2 + frac(6000, 15.5) approx 579$ nghìn đồng.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một hòn đảo cách bờ biển $4$ km tại điểm $O$, còn nhà máy $B$ nằm trên bờ và cách $O$ đoạn $8$ km. Chi phí kéo cáp ngầm là $2$ tỉ đồng/km, còn chi phí kéo cáp trên bờ là $1$ tỉ đồng/km. Gọi $M$ là điểm cập bờ trên đoạn $O B$ với $O M = x$ km. Hãy tìm vị trí $M$ để tổng chi phí nhỏ nhất.],
  [$O M = frac(4, sqrt(3)) approx 2.31$ km],
  accent: c-book,
  loigiai: [
    #step[Độ dài cáp ngầm là $A M = sqrt(x^2 + 16)$, còn cáp trên bờ là $M B = 8 - x$.]
    #step[Tổng chi phí theo $x$ là $T(x) = 2 sqrt(x^2 + 16) + 8 - x$, với $0 <= x <= 8$.]
    #step[$T'(x) = frac(2 x, sqrt(x^2 + 16)) - 1 = 0 <=> 2 x = sqrt(x^2 + 16)$.]
    #step[Bình phương hai vế: $4 x^2 = x^2 + 16 <=> 3 x^2 = 16 <=> x = frac(4, sqrt(3))$ do $x >= 0$.]
    #step[Vậy điểm cập bờ tối ưu thỏa mãn $O M = frac(4, sqrt(3)) approx 2.31$ km.]
  ],
))

#pagebreak()

#exam-part([PHẦN IV. Bài toán HAY - LẠ - KHÓ (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  [Một nền tảng học trực tuyến có $30$ nghìn tài khoản trả phí. Nếu học phí là $200$ nghìn đồng/tháng thì giữ nguyên toàn bộ số tài khoản này. Cứ mỗi lần tăng học phí thêm $10$ nghìn đồng thì giảm $1$ nghìn tài khoản. Chi phí phục vụ cho mỗi tài khoản đang hoạt động là $60$ nghìn đồng/tháng; ngoài ra để duy trì chất lượng dịch vụ khi tăng giá, nền tảng phải chi thêm $20 x$ triệu đồng/tháng, với $x$ là số lần tăng giá. Tìm mức học phí để lợi nhuận mỗi tháng lớn nhất.],
  [$270$ nghìn đồng/tháng],
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá. Khi đó học phí là $200 + 10 x$ (nghìn đồng), số tài khoản còn lại là $30 - x$ (nghìn tài khoản).]
    #step[Doanh thu theo đơn vị triệu đồng là $R(x) = (200 + 10 x)(30 - x) = 6000 + 100 x - 10 x^2$.]
    #step[Chi phí theo đơn vị triệu đồng là $C(x) = 60(30 - x) + 20 x = 1800 - 40 x$.]
    #step[Lợi nhuận là $L(x) = R(x) - C(x) = 4200 + 140 x - 10 x^2$.]
    #step[$L'(x) = 140 - 20 x = 0 <=> x = 7$. Vậy học phí tối ưu là $200 + 10 dot 7 = 270$ nghìn đồng/tháng.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một nông trại dâu tây đang trồng ở mức chuẩn $20$ luống/ha. Khi đó mỗi luống cho $30$ kg quả. Nếu tăng thêm $x$ luống trên mỗi ha thì do cạnh tranh dinh dưỡng, năng suất mỗi luống chỉ còn $30 - 0.8 x$ kg. Đồng thời chi phí sâu bệnh quy đổi tương đương $0.2 x^2$ tạ quả bị mất. Hỏi nên bố trí bao nhiêu luống trên mỗi ha để sản lượng ròng là lớn nhất?],
  [$27$ luống/ha],
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số luống tăng thêm. Khi đó tổng sản lượng thô là $(20 + x)(30 - 0.8 x) = 600 + 14 x - 0.8 x^2$ (kg/ha).]
    #step[Chi phí sâu bệnh quy đổi là $0.2 x^2$ tạ, tức tương đương $20 x^2$ kg. Đổi toàn bộ về đơn vị chục kg cho gọn, ta được sản lượng ròng tỉ lệ với $Q(x) = 600 + 14 x - x^2$.]
    #step[$Q'(x) = 14 - 2 x = 0 <=> x = 7$. Do $Q''(x) = -2 < 0$ nên đây là điểm cực đại.]
    #step[Vậy số luống tối ưu là $20 + 7 = 27$ luống/ha.]
  ],
))
