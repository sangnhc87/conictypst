#import "_config.typ": *

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 05 - GTLN, GTNN TRONG BÀI TOÁN THỰC TẾ]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (6 câu)], count: 6)

#q-wrap(dir: "doc", tn(
  [Một cửa hàng bán được $50$ nghìn sản phẩm/tháng với giá $200$ nghìn đồng/sản phẩm. Cứ mỗi lần tăng giá thêm $10$ nghìn đồng thì lượng bán giảm $1$ nghìn sản phẩm. Giá bán để doanh thu đạt lớn nhất là:],
  (
    [$300$ nghìn đồng],
    [$320$ nghìn đồng],
    True([$350$ nghìn đồng]),
    [$400$ nghìn đồng],
  ),
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá. Khi đó giá bán là $200 + 10 x$, lượng bán là $50 - x$.]
    #step[Doanh thu: $R(x) = (200 + 10 x)(50 - x) = 10000 + 300 x - 10 x^2$.]
    #step[$R'(x) = 300 - 20 x = 0 <=> x = 15$.]
    #step[Giá bán tối ưu là $200 + 10 dot 15 = 350$ nghìn đồng/sản phẩm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Chi phí trung bình để sản xuất $x$ sản phẩm là $A(x) = 0.5 x + 20 + frac(450, x)$ với $x > 0$. Giá trị của $x$ để $A(x)$ nhỏ nhất là:],
  (
    [$20$],
    True([$30$]),
    [$40$],
    [$60$],
  ),
  accent: c-book,
  loigiai: [
    #step[$A'(x) = 0.5 - frac(450, x^2)$.]
    #step[$A'(x) = 0 <=> 0.5 = frac(450, x^2) <=> x^2 = 900$.]
    #step[Vì $x > 0$ nên $x = 30$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nồng độ một chất trong máu được mô hình hóa bởi $C(t) = 8 t e^{-0.25 t}$ với $t >= 0$ (giờ). Nồng độ đạt lớn nhất tại thời điểm nào?],
  (
    [$2$ giờ],
    True([$4$ giờ]),
    [$8$ giờ],
    [$16$ giờ],
  ),
  accent: c-book,
  loigiai: [
    #step[$C'(t) = 8 e^{-0.25 t}(1 - 0.25 t)$.]
    #step[$C'(t) = 0 <=> 1 - 0.25 t = 0 <=> t = 4$.]
    #step[Vậy nồng độ đạt cực đại tại $t = 4$ giờ.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Sản lượng ròng của một vườn nho được ước tính bởi $Y(x) = 600 + 24 x - x^2$ trên đoạn $[0; 20]$, trong đó $x$ là số đơn vị phân bón bổ sung. Sản lượng ròng lớn nhất đạt được khi:],
  (
    [$x = 10$],
    True([$x = 12$]),
    [$x = 14$],
    [$x = 20$],
  ),
  accent: c-book,
  loigiai: [
    #step[$Y'(x) = 24 - 2 x = 0 <=> x = 12$.]
    #step[Vì $Y''(x) = -2 < 0$ nên $x = 12$ cho giá trị lớn nhất trên đoạn $[0; 20]$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tổng chi phí lắp cáp từ đảo vào bờ được cho bởi $T(x) = 4 sqrt(x^2 + 36) + 2(18 - x)$ với $0 <= x <= 18$. Giá trị của $x$ để chi phí nhỏ nhất là:],
  (
    [$sqrt(3)$],
    True([$2 sqrt(3)$]),
    [$3$],
    [$6$],
  ),
  accent: c-book,
  loigiai: [
    #step[$T'(x) = frac(4 x, sqrt(x^2 + 36)) - 2$.]
    #step[$T'(x) = 0 <=> 2 x = sqrt(x^2 + 36)$.]
    #step[Bình phương hai vế: $4 x^2 = x^2 + 36 <=> 3 x^2 = 36 <=> x = 2 sqrt(3)$ do $x >= 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Năng lượng tiêu hao của một drone trên quãng đường cố định được mô hình hóa bởi $E(v) = v^2 + frac(400, v)$ với $5 <= v <= 10$ (m/s). Vận tốc giúp năng lượng nhỏ nhất gần nhất với giá trị nào?],
  (
    [$5.0$],
    True([$5.8$]),
    [$7.0$],
    [$10.0$],
  ),
  accent: c-book,
  loigiai: [
    #step[$E'(v) = 2 v - frac(400, v^2)$.]
    #step[$E'(v) = 0 <=> 2 v^3 = 400 <=> v^3 = 200$.]
    #step[Suy ra $v = root(3, 200) approx 5.85$, thuộc đoạn $[5; 10]$.]
    #step[Vậy vận tốc tối ưu gần nhất là $5.8$ m/s.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng/Sai (2 câu)], count: 2)

#q-wrap(dir: "ngang", ds(
  [Một khu nghỉ dưỡng có $90$ phòng. Nếu giá thuê là $2$ triệu đồng/phòng/đêm thì kín phòng. Cứ mỗi lần tăng thêm $0.2$ triệu đồng thì có $3$ phòng bị bỏ trống. Chi phí vận hành cho mỗi phòng có khách là $0.5$ triệu đồng, còn chi phí bảo trì cho mỗi phòng trống là $0.1$ triệu đồng. Gọi $x$ là số lần tăng giá. Xét các phát biểu sau:],
  (
    True([Số phòng được thuê là $90 - 3 x$.]),
    True([Hàm lợi nhuận là $L(x) = 135 + 13.2 x - 0.6 x^2$ (triệu đồng/đêm).]),
    [Lợi nhuận đạt lớn nhất khi $x = 10$.],
    True([Giá thuê tối ưu là $4.2$ triệu đồng/phòng/đêm.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Số phòng được thuê giảm đều theo số lần tăng giá nên bằng $90 - 3 x$.
    - b) Đúng. Doanh thu: $R(x) = (2 + 0.2 x)(90 - 3 x) = 180 + 12 x - 0.6 x^2$. Chi phí: $C(x) = 0.5(90 - 3 x) + 0.1(3 x) = 45 - 1.2 x$. Suy ra $L(x) = 135 + 13.2 x - 0.6 x^2$.
    - c) Sai. $L'(x) = 13.2 - 1.2 x = 0 <=> x = 11$.
    - d) Đúng. Khi $x = 11$, giá tối ưu là $2 + 0.2 dot 11 = 4.2$ triệu đồng/phòng/đêm.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một xe vận tải đi quãng đường $100$ km. Nếu chạy với vận tốc $25$ km/h thì chi phí nhiên liệu cho cả chuyến là $500$ nghìn đồng. Chi phí thời gian là $72$ nghìn đồng mỗi giờ. Vận tốc bị ràng buộc trong đoạn $[16; 22]$ km/h. Gọi $C(v)$ là tổng chi phí chuyến đi. Xét các phát biểu sau:],
  (
    True([Hàm chi phí là $C(v) = 0.8 v^2 + frac(7200, v)$.]),
    True([Nếu bỏ ràng buộc miền, vận tốc tối ưu là $v_0 = root(3, 4500) approx 16.5$ km/h.]),
    True([Do $16 <= v_0 <= 22$, chi phí nhỏ nhất trên đoạn $[16; 22]$ đạt tại $v = v_0$.]),
    [Tại vận tốc tối ưu, chi phí nhiên liệu bằng chi phí thời gian.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Từ $a dot 25^2 = 500$ suy ra $a = 0.8$, còn $b = 72 dot 100 = 7200$.
    - b) Đúng. $C'(v) = 1.6 v - frac(7200, v^2) = 0 <=> v^3 = 4500$, nên $v_0 = root(3, 4500) approx 16.5$.
    - c) Đúng. Vì $v_0$ nằm ngay trong đoạn ràng buộc nên chi phí nhỏ nhất trên đoạn đạt tại $v = v_0$.
    - d) Sai. Tại vận tốc tối ưu ta luôn có $frac(b, v_0) = 2 a v_0^2$, tức chi phí thời gian gấp đôi chi phí nhiên liệu.
  ],
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (4 câu)], count: 4)

#q-wrap(dir: "doc", tln(
  [Một nền tảng nghe sách nói có $40$ nghìn thuê bao trả phí. Nếu phí thuê bao là $150$ nghìn đồng/tháng thì giữ nguyên toàn bộ số thuê bao. Cứ mỗi lần tăng thêm $10$ nghìn đồng thì giảm $1$ nghìn thuê bao. Chi phí phục vụ cho mỗi thuê bao đang hoạt động là $50$ nghìn đồng/tháng. Tìm mức phí để lợi nhuận mỗi tháng lớn nhất và tính lợi nhuận đó.],
  [$300$ nghìn đồng/tháng; $6250$ triệu đồng/tháng],
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá. Khi đó phí là $150 + 10 x$ (nghìn đồng), số thuê bao là $40 - x$ (nghìn).]
    #step[Doanh thu theo đơn vị triệu đồng: $R(x) = (150 + 10 x)(40 - x) = 6000 + 250 x - 10 x^2$.]
    #step[Chi phí theo đơn vị triệu đồng: $C(x) = 50(40 - x) = 2000 - 50 x$.]
    #step[Lợi nhuận: $L(x) = R(x) - C(x) = 4000 + 300 x - 10 x^2$.]
    #step[$L'(x) = 300 - 20 x = 0 <=> x = 15$.]
    #step[Vậy mức phí tối ưu là $150 + 10 dot 15 = 300$ nghìn đồng/tháng, và lợi nhuận lớn nhất là $L(15) = 6250$ triệu đồng/tháng.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tổng chi phí để sản xuất $x$ sản phẩm của một xưởng là $C(x) = 0.2 x^2 + 40 x + 2000$ với $x > 0$. Hỏi cần sản xuất bao nhiêu sản phẩm để chi phí trung bình nhỏ nhất, và chi phí trung bình nhỏ nhất đó bằng bao nhiêu?],
  [$100$ sản phẩm; $80$],
  accent: c-book,
  loigiai: [
    #step[Chi phí trung bình là $A(x) = frac(C(x), x) = 0.2 x + 40 + frac(2000, x)$.]
    #step[$A'(x) = 0.2 - frac(2000, x^2) = 0 <=> x^2 = 10000$.]
    #step[Vì $x > 0$ nên $x = 100$.]
    #step[Chi phí trung bình nhỏ nhất là $A(100) = 0.2 dot 100 + 40 + frac(2000, 100) = 80$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một xe chở hàng đi quãng đường $90$ km. Nếu chạy với vận tốc $30$ km/h thì chi phí nhiên liệu cho cả chuyến là $540$ nghìn đồng. Chi phí thời gian là $45$ nghìn đồng mỗi giờ. Tìm vận tốc làm tổng chi phí nhỏ nhất và chi phí tối thiểu tương ứng.],
  [$15$ km/h; $405$ nghìn đồng],
  accent: c-book,
  loigiai: [
    #step[Chi phí nhiên liệu có dạng $a v^2$. Từ $a dot 30^2 = 540$ suy ra $a = 0.6$.]
    #step[Chi phí thời gian có dạng $frac(b, v)$ với $b = 45 dot 90 = 4050$.]
    #step[Vậy $C(v) = 0.6 v^2 + frac(4050, v)$.]
    #step[$C'(v) = 1.2 v - frac(4050, v^2) = 0 <=> 1.2 v^3 = 4050 <=> v^3 = 3375 = 15^3$.]
    #step[Vậy vận tốc tối ưu là $15$ km/h và chi phí tối thiểu là $C(15) = 0.6 dot 225 + frac(4050, 15) = 405$ nghìn đồng.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một giàn khoan cách bờ biển $8$ km tại điểm $H$. Kho dầu $B$ nằm trên bờ và cách $H$ đoạn $24$ km. Đặt điểm cập bờ là $C$ sao cho $H C = x$ km, $0 <= x <= 24$. Chi phí ống dưới biển là $6$ tỉ đồng/km, còn chi phí trên bờ là $3$ tỉ đồng/km. Tìm khoảng cách $H C$ để tổng chi phí nhỏ nhất.],
  [$frac(8, sqrt(3))$ km],
  accent: c-book,
  loigiai: [
    #step[Tổng chi phí là $T(x) = 6 sqrt(x^2 + 64) + 3(24 - x)$, với $0 <= x <= 24$.]
    #step[$T'(x) = frac(6 x, sqrt(x^2 + 64)) - 3 = 0 <=> 2 x = sqrt(x^2 + 64)$.]
    #step[Bình phương hai vế: $4 x^2 = x^2 + 64 <=> 3 x^2 = 64$.]
    #step[Vì $x >= 0$ nên $x = frac(8, sqrt(3))$. Vậy khoảng cách tối ưu là $H C = frac(8, sqrt(3))$ km.]
  ],
))
