#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 05])

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "ngang",
  [Một người cần đi từ vị trí $A$ trong rừng đến thành phố $B$ nằm trên một trục đường lộ thẳng. Khoảng cách ngắn nhất từ $A$ đến đường lộ là $A H = 3$ km. Khoảng cách từ hình chiếu $H$ đến thành phố $B$ là $5$ km. Vận tốc di chuyển của người đó trong rừng là $3$ km/h, còn trên đường lộ là $5$ km/h. Để thời gian di chuyển từ $A$ đến $B$ là ngắn nhất thì người đó nên đi thẳng từ $A$ đến một vị trí $X$ trên đường lộ cách thành phố $B$ bao nhiêu km?],
  (
    True([$2.75$ km]),
    [$2.25$ km],
    [$2.5$ km],
    [$3$ km]
  ),
  loigiai: [
    #step[Thời gian đi bộ từ $A$ đến $X$ rồi từ $X$ đến $B$ (với $X$ trên đường lộ, $X$ cách $H$ một đoạn $x$ km, $0 <= x <= 5$) là $t(x) = (A X)/(3) + (X B)/(5) = (sqrt(x^2 + 9))/(3) + (5 - x)/(5)$.]
    #step[Đạo hàm $t'(x) = (x)/(3sqrt(x^2 + 9)) - (1)/(5)$. Xét $t'(x) = 0 <=> 5x = 3sqrt(x^2 + 9) <=> 25x^2 = 9(x^2 + 9) <=> 16x^2 = 81 <=> x = 2.25$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $t'$,
          func: $t$,
          x-vals: ($0$, $2.25$, $5$),
          d-signs: ("-", "0", "+"),
          v-vals: ($2$, $t_"min"$, $sqrt(34)/3$)
        )
      ]
      Vậy thời gian nhỏ nhất khi $x = 2.25$. Khoảng cách từ $X$ đến $B$ là $5 - 2.25 = 2.75$ km.]
  ]
)

#tn(
  dir: "ngang",
  [Một công ty bất động sản có $50$ căn hộ cho thuê. Biết rằng nếu cho thuê với giá $2$ triệu đồng/tháng thì tất cả các căn hộ đều được thuê hết. Cứ mỗi lần tăng giá thuê thêm $100$ nghìn đồng/tháng thì sẽ có thêm $1$ căn hộ bị bỏ trống. Ngoài ra, với mỗi căn hộ có người ở, công ty phải trả chi phí bảo trì phát sinh là $200$ nghìn đồng/tháng. Công ty nên đặt giá thuê mỗi căn hộ bằng bao nhiêu để thu được tổng lợi nhuận ròng hàng tháng lớn nhất?],
  (
    [$3.2$ triệu đồng],
    [$3.4$ triệu đồng],
    True([$3.6$ triệu đồng]),
    [$3.8$ triệu đồng]
  ),
  loigiai: [
    #step[Gọi $n$ là số lần tăng giá thuê $100$ nghìn đồng. Giá thuê mới là $p(n) = 2 + 0.1n$ (triệu đồng), số phòng được thuê là $q(n) = 50 - n$ ($0 <= n <= 50$).]
    #step[Lợi nhuận ròng là $L(n) = q(n) p(n) - 0.2 q(n) = (50 - n)(2 + 0.1n - 0.2) = (50 - n)(1.8 + 0.1n) = -0.1n^2 + 3.2n + 90$.]
    #step[Đạo hàm $L'(n) = -0.2n + 3.2 = 0 <=> n = 16$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $n$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $16$, $50$),
          d-signs: ("+", "0", "-"),
          v-vals: ($90$, $115.6$, $0$)
        )
      ]
      Vậy lợi nhuận ròng lớn nhất khi giá thuê là $p = 2 + 0.1(16) = 3.6$ triệu đồng/tháng.]
  ]
)

#tn(
  dir: "ngang",
  [Một công ty sản xuất độc quyền có hàm doanh thu $R(x) = 120x - x^2$ và hàm chi phí sản xuất là $C(x) = x^2 + 20x + 100$ (trong đó $x > 0$ là sản lượng sản xuất, đơn vị của các hàm là nghìn đồng). Nếu nhà nước đánh thuế cố định $t = 10$ nghìn đồng trên mỗi đơn vị sản phẩm bán ra, doanh nghiệp cần sản xuất sản lượng $x$ bằng bao nhiêu để lợi nhuận sau thuế đạt giá trị lớn nhất?],
  (
    [$x = 20$],
    [$x = 25$],
    True([$x = 22.5$]),
    [$x = 24.5$]
  ),
  loigiai: [
    #step[Lợi nhuận sau thuế của doanh nghiệp là $L(x) = R(x) - C(x) - 10x = (120x - x^2) - (x^2 + 20x + 100) - 10x = -2x^2 + 90x - 100$.]
    #step[Đạo hàm $L'(x) = -4x + 90$. Cho $L'(x) = 0 <=> x = 22.5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $22.5$, $+oo$),
          d-signs: ("+", "0", "-"),
          v-vals: ($-100$, $L_"max"$, $-oo$)
        )
      ]
      Vậy doanh nghiệp cần sản xuất sản lượng $x = 22.5$ để đạt lợi nhuận lớn nhất.]
  ]
)

#tn(
  dir: "ngang",
  [Một người ở trên một hòn đảo cách bờ biển thẳng một khoảng cách $A D = 4$ km. Người đó muốn di chuyển đến một địa điểm $B$ trên bờ biển cách điểm $D$ một khoảng $6$ km. Người đó có thể chèo thuyền từ hòn đảo đến một vị trí $C$ trên bờ biển với vận tốc $3$ km/h, rồi đi bộ từ $C$ đến $B$ với vận tốc $5$ km/h. Để thời gian di chuyển từ đảo đến địa điểm $B$ là nhỏ nhất thì điểm $C$ cần cách điểm $D$ bao nhiêu km?],
  (
    [$2$ km],
    True([$3$ km]),
    [$4$ km],
    [$2.5$ km]
  ),
  loigiai: [
    #step[Gọi $x$ (km) là khoảng cách từ $C$ đến $D$ ($0 <= x <= 6$). Quãng đường $A C = sqrt(4^2 + x^2) = sqrt(16 + x^2)$. Quãng đường $C B = 6 - x$.]
    #step[Thời gian đi là $t(x) = (sqrt(16 + x^2))/(3) + (6 - x)/(5)$.]
    #step[Đạo hàm $t'(x) = (x)/(3sqrt(16 + x^2)) - (1)/(5)$. Xét $t'(x) = 0 <=> 5x = 3sqrt(16 + x^2) <=> 25x^2 = 9(16 + x^2) <=> 16x^2 = 144 <=> x = 3$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $t'$,
          func: $t$,
          x-vals: ($0$, $3$, $6$),
          d-signs: ("-", "0", "+"),
          v-vals: ($t(0)$, $t_"min"$, $t(6)$)
        )
      ]
      Vậy thời gian nhỏ nhất khi $x = 3$, tức là điểm $C$ cách $D$ một khoảng $3$ km.]
  ]
)

#tn(
  dir: "ngang",
  [Một công ty bán lẻ cần nhập $1600$ sản phẩm mỗi năm. Chi phí cho mỗi lần đặt hàng cố định là $50$ nghìn đồng. Chi phí bảo quản và lưu kho cho mỗi đơn vị sản phẩm trong một năm là $4$ nghìn đồng. Tìm số lượng sản phẩm mỗi lần nhập hàng $x$ để tổng chi phí đặt hàng và lưu kho hàng năm là thấp nhất.],
  (
    [$100$ sản phẩm],
    True([$200$ sản phẩm]),
    [$150$ sản phẩm],
    [$250$ sản phẩm]
  ),
  loigiai: [
    #step[Số lần đặt hàng mỗi năm là $(1600)/(x)$. Chi phí lưu kho trung bình là $4 dot (x)/(2) = 2x$.]
    #step[Tổng chi phí đặt hàng và lưu kho hàng năm là $C(x) = 50 dot (1600)/(x) + 2x = (80000)/(x) + 2x$ (với $x > 0$).]
    #step[Đạo hàm $C'(x) = -(80000)/(x^2) + 2$. Cho $C'(x) = 0 <=> x^2 = 40000 <=> x = 200$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $200$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $800$, $+oo$)
        )
      ]
      Vậy tổng chi phí thấp nhất khi mỗi lần nhập hàng $x = 200$ sản phẩm.]
  ]
)

#tn(
  dir: "ngang",
  [Một rạp chiếu phim có sức chứa tối đa là $1200$ người. Khi giá vé là $80$ nghìn đồng thì trung bình mỗi suất chiếu thu hút $800$ khách. Nhằm gia tăng doanh thu, rạp tiến hành khảo sát và nhận thấy cứ mỗi lần giảm giá vé đi $5$ nghìn đồng thì lượng khán giả đến rạp tăng thêm $100$ người. Tính giá vé $p$ (nghìn đồng) để doanh thu của rạp trong một suất chiếu đạt giá trị lớn nhất.],
  (
    [$70$ nghìn đồng],
    True([$60$ nghìn đồng]),
    [$55$ nghìn đồng],
    [$65$ nghìn đồng]
  ),
  loigiai: [
    #step[Gọi $n$ là số lần giảm giá $5$ nghìn đồng. Giá vé mới là $p = 80 - 5n$, số lượng khách ước tính là $q = 800 + 100n$. Vì sức chứa rạp là $1200$ nên $800 + 100n <= 1200 <=> n <= 4$. Vậy $0 <= n <= 4$.]
    #step[Doanh thu mỗi suất chiếu là $R(n) = (80 - 5n)(800 + 100n) = 500(16 - n)(8 + n) = 500(128 + 8n - n^2)$.]
    #step[Đạo hàm $R'(n) = 500(8 - 2n) = 0 <=> n = 4$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $n$,
          der: $R'$,
          func: $R$,
          x-vals: ($0$, $4$, $16$),
          d-signs: ("+", "0", "-"),
          v-vals: ($R(0)$, $R_"max"$, $0$)
        )
      ]
      Vậy để doanh thu lớn nhất thì $n = 4$, giá vé là $p = 80 - 5(4) = 60$ nghìn đồng.]
  ]
)

#tn(
  dir: "ngang",
  [Một chiếc xe khách chạy chặng đường dài $150$ km. Chi phí xăng dầu tiêu hao cho mỗi km chạy xe tỉ lệ thuận với bình phương vận tốc hành trình: $c_(f u e l) = 0.05v^2$ (đồng/km). Ngoài ra, tài xế nhận lương cố định là $90$ nghìn đồng cho mỗi giờ chạy xe. Vận tốc chạy xe bị giới hạn tối đa trên đường là $80$ km/h. Tìm vận tốc hành trình $v$ (km/h) để tổng chi phí xăng dầu và tiền lương tài xế cho cả chuyến đi là nhỏ nhất.],
  (
    [$60$ km/h],
    [$70$ km/h],
    [$75$ km/h],
    True([$80$ km/h])
  ),
  loigiai: [
    #step[Thời gian chạy xe là $t = (150)/(v)$ (giờ). Chi phí nhiên liệu là $150 dot 0.05v^2 = 7.5v^2$ (đồng).]
    #step[Chi phí tiền lương tài xế là $90000 dot (150)/(v) = (13500000)/(v)$ (đồng).]
    #step[Tổng chi phí $C(v) = 7.5v^2 + (13500000)/(v)$ với $0 < v <= 80$.]
    #step[Đạo hàm $C'(v) = 15v - (13500000)/(v^2)$. Cho $C'(v) = 0 <=> v^3 = 900000 <=> v approx 96.5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $v$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $80$, $96.5$),
          d-signs: ("-", "-", "0"),
          v-vals: ($+oo$, $C(80)$, $C_"min"$)
        )
      ]
      Do trên khoảng $(0, 80]$ hàm số $C(v)$ nghịch biến nên chi phí nhỏ nhất đạt được tại giới hạn lớn nhất $v = 80$ km/h.]
  ]
)

#tn(
  dir: "ngang",
  [Chi phí để sản xuất $x$ sản phẩm trong một ngày của một nhà máy gồm chi phí nguyên vật liệu và nhân công trực tiếp là $C_1(x) = 2x^2 + 50x$ (nghìn đồng), cùng với chi phí vận hành máy móc cố định là $1800$ (nghìn đồng). Quy mô sản xuất $x$ bằng bao nhiêu sản phẩm mỗi ngày để chi phí trung bình sản xuất mỗi sản phẩm đạt giá trị nhỏ nhất?],
  (
    [$20$],
    True([$30$]),
    [$40$],
    [$25$]
  ),
  loigiai: [
    #step[Tổng chi phí sản xuất $x$ sản phẩm là $C(x) = C_1(x) + 1800 = 2x^2 + 50x + 1800$.]
    #step[Chi phí trung bình cho mỗi sản phẩm là $A C(x) = (C(x))/(x) = 2x + 50 + (1800)/(x)$ (với $x > 0$).]
    #step[Đạo hàm $A C'(x) = 2 - (1800)/(x^2)$. Cho $A C'(x) = 0 <=> x^2 = 900 <=> x = 30$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $A C'$,
          func: $A C$,
          x-vals: ($0$, $30$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $170$, $+oo$)
        )
      ]
      Vậy quy mô sản xuất để chi phí trung bình nhỏ nhất là $x = 30$ sản phẩm.]
  ]
)

#tn(
  dir: "ngang",
  [Trong một dự án truyền tải điện năng từ trạm phát điện chính đến một khu công nghiệp, hao phí điện năng trên đường dây truyền tải khi nâng điện áp lên $x$ lần ($x >= 1$) được giảm thiểu đáng kể. Tuy nhiên, chi phí lắp đặt thiết bị bảo an cách điện tại trạm biến áp đầu nguồn tăng thêm là $C(x) = 3x^2 + 72/x$ (triệu đồng). Tìm hệ số nâng điện áp $x$ để tổng chi phí thiết bị bảo an cách điện đạt giá trị nhỏ nhất.],
  (
    [$x = 2.0$],
    True([$x = 2.29$]),
    [$x = 2.5$],
    [$x = 3.0$]
  ),
  loigiai: [
    #step[Chi phí $C(x) = 3x^2 + (72)/(x)$ với $x >= 1$.]
    #step[Đạo hàm $C'(x) = 6x - (72)/(x^2)$. Cho $C'(x) = 0 <=> 6x^3 = 72 <=> x^3 = 12 <=> x = root(3, 12) approx 2.29$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($1$, $2.29$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($75$, $C_"min"$, $+oo$)
        )
      ]
      Vậy hệ số nâng điện áp tối ưu là $x approx 2.29$.]
  ]
)

#tn(
  dir: "ngang",
  [Nhu cầu tiêu thụ một mặt hàng nhập khẩu chịu ảnh hưởng bởi mức thuế suất $t$ (phần trăm) đánh trên giá nhập theo công thức $D(t) = 300 - 6t$ (đơn vị sản phẩm). Tổng số tiền thuế mà ngân sách nhà nước thu được từ mặt hàng này được tính bằng $T(t) = t.D(t)$ (triệu đồng). Tính mức thuế suất $t$ (phần trăm) để số tiền thuế thu về ngân sách nhà nước đạt giá trị lớn nhất.],
  (
    [$20\%$],
    True([$25\%$]),
    [$30\%$],
    [$15\%$]
  ),
  loigiai: [
    #step[Hàm tổng ngân sách thuế thu được là $T(t) = t dot D(t) = t(300 - 6t) = 300t - 6t^2$.]
    #step[Đạo hàm $T'(t) = 300 - 12t$. Cho $T'(t) = 0 <=> t = 25$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $t$,
          der: $T'$,
          func: $T$,
          x-vals: ($0$, $25$, $50$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $3750$, $0$)
        )
      ]
      Vậy mức thuế suất $25%$ mang lại ngân sách lớn nhất.]
  ]
)

#tn(
  dir: "ngang",
  [Hiệu suất làm việc của một nhóm công nhân lắp ráp thiết bị điện tử trong ca làm việc $8$ tiếng được mô tả bởi hàm số $f(t) = -t^3 + 9t^2 + 21t$ (sản phẩm/giờ), với $t$ là số giờ làm việc tính từ lúc bắt đầu ca ($0 <= t <= 8$). Hỏi sau khi làm việc được bao nhiêu giờ thì hiệu suất làm việc của nhóm công nhân đạt giá trị lớn nhất?],
  (
    [$6$ giờ],
    True([$7$ giờ]),
    [$8$ giờ],
    [$5$ giờ]
  ),
  loigiai: [
    #step[Hàm hiệu suất làm việc là $f(t) = -t^3 + 9t^2 + 21t$ trên đoạn $0 <= t <= 8$.]
    #step[Đạo hàm $f'(t) = -3t^2 + 18t + 21$. Cho $f'(t) = 0 <=> -3(t^2 - 6t - 7) = 0 <=> t = 7$ (nhận) hoặc $t = -1$ (loại).]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $t$,
          der: $f'$,
          func: $f$,
          x-vals: ($0$, $7$, $8$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $f_"max"$, $f(8)$)
        )
      ]
      Vậy hiệu suất làm việc đạt lớn nhất ở giờ thứ $7$.]
  ]
)

#tn(
  dir: "ngang",
  [Một doanh nghiệp bán lẻ nhận thấy khi bán sản phẩm với giá $x$ (nghìn đồng) ($30 <= x <= 80$) thì lượng bán được mỗi ngày là $100 - x$ sản phẩm. Tuy nhiên, do chất lượng đóng gói, tỉ lệ sản phẩm bị hoàn trả và phải bồi hoàn tăng theo giá bán, gây chi phí phát sinh hàng ngày là $P_(r e t u r n)(x) = x^2 - 60x$ (nghìn đồng). Doanh nghiệp bán sản phẩm với mức giá $x$ bằng bao nhiêu nghìn đồng để doanh thu thuần hàng ngày (sau khi trừ chi phí hoàn trả) đạt giá trị lớn nhất?],
  (
    [$35$ nghìn đồng],
    True([$40$ nghìn đồng]),
    [$45$ nghìn đồng],
    [$50$ nghìn đồng]
  ),
  loigiai: [
    #step[Hàm doanh thu là $R(x) = x(100 - x)$.]
    #step[Doanh thu thuần sau khi trừ chi phí hoàn trả là $N(x) = x(100 - x) - (x^2 - 60x) = 100x - x^2 - x^2 + 60x = -2x^2 + 160x$ với $30 <= x <= 80$.]
    #step[Đạo hàm $N'(x) = -4x + 160$. Cho $N'(x) = 0 <=> x = 40$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $N'$,
          func: $N$,
          x-vals: ($30$, $40$, $80$),
          d-signs: ("+", "0", "-"),
          v-vals: ($N(30)$, $N_"max"$, $0$)
        )
      ]
      Vậy doanh nghiệp cần bán với giá $40$ nghìn đồng để doanh thu thuần lớn nhất.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Theo thống kê sản xuất tại nhà máy $Z$, một tuần làm việc tiêu chuẩn kéo dài $40$ giờ với quy mô nhân sự là $100$ tổ công nhân, mỗi tổ đạt năng suất $120$ sản phẩm mỗi giờ. Ban quản đốc ước tính nếu tăng thêm mỗi lần $2$ giờ làm việc mỗi tuần, sẽ có $1$ tổ công nhân xin nghỉ việc và năng suất của các tổ còn lại đồng loạt giảm đi $5$ sản phẩm mỗi tổ/giờ. Số phế phẩm ước tính phát sinh trong một tuần được tính theo công thức $P(x) = frac(95x^2 + 120x, 4)$ (với $x$ là số giờ làm việc thực tế mỗi tuần). Xét tính đúng/sai của các phát biểu sau:],
  (
    True([Nếu tăng thời gian làm việc thêm $2n$ giờ mỗi tuần ($n >= 0$), số giờ làm việc thực tế mỗi tuần là $x = 40 + 2n$ giờ.]),
    True([Số tổ công nhân thực tế làm việc sau khi điều chỉnh tăng giờ là $T(n) = 100 - n$ tổ.]),
    [Số lượng sản phẩm đạt tiêu chuẩn thu được sau khi trừ đi phế phẩm đạt giá trị lớn nhất khi ban quản đốc tăng thêm thời gian làm việc $10$ giờ mỗi tuần.],
    True([Số sản phẩm đạt tiêu chuẩn lớn nhất thu được của nhà máy $Z$ trong một tuần là $440.800$ sản phẩm.])
  ),
  loigiai: [
    #step[a) Số giờ làm việc sau khi tăng thêm $2n$ giờ mỗi tuần là $x = 40 + 2n$ giờ. (Đúng)]
    #step[b) Với mỗi $2$ giờ tăng thêm ($n$ lần), số tổ nghỉ việc là $n$, nên số tổ thực tế còn lại là $T(n) = 100 - n$. (Đúng)]
    #step[c, d) Sản lượng tiêu chuẩn $S(n) = (100 - n)(120 - 5n)(40 + 2n) = 10(100 - n)(24 - n)(20 + n) = 10n^3 - 1040n^2 - 800n + 480000$. Phế phẩm $P(n) = 95n^2 + 3860n + 39200$. 
    Lượng sản phẩm đạt chuẩn $F(n) = S(n) - P(n) = 10n^3 - 1135n^2 - 4660n + 440800$.
    Đạo hàm $F'(n) = 30n^2 - 2270n - 4660 = 0 <=> n approx 77.67$ hoặc $n = -2$.
    Bảng biến thiên trên đoạn $n >= 0$:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $n$,
          der: $F'$,
          func: $F$,
          x-vals: ($0$, $77.67$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($440800$, $F_"min"$, $+oo$)
        )
      ]
    Hàm số nghịch biến với mọi $n$ trong đoạn $[0, 77.67]$. Do đó, $F(n)$ đạt lớn nhất ngay tại $n = 0$ (tức là không tăng thêm giờ nào). Khi đó $F(0) = 440.800$ sản phẩm. 
    Vậy ý (c) "đạt lớn nhất khi tăng thêm 10 giờ" là Sai, và ý (d) "sản phẩm lớn nhất là 440.800" là Đúng.]
  ]
)

#ds(
  dir: "doc",
  [Một công ty độc quyền có hàm cầu đối với sản phẩm bán ra là $p = 200 - x$ (nghìn đồng/sản phẩm), trong đó $x$ là sản lượng ($x >= 0$). Chi phí để sản xuất $x$ sản phẩm là $C(x) = x^2 + 40x + 500$ (nghìn đồng). Nhà nước áp dụng chính sách thuế lũy tiến đối với doanh thu của công ty như sau: Nếu doanh thu dưới $8000$ nghìn đồng thì miễn thuế; nếu doanh thu từ $8000$ nghìn đồng trở lên thì tính thuế bằng $10\%$ tổng doanh thu. Xét tính đúng/sai của các nhận định sau:],
  (
    True([Hàm doanh thu của công ty trước thuế là $R(x) = 200x - x^2$ (nghìn đồng).]),
    True([Lợi nhuận của công ty khi chưa tính thuế đạt giá trị lớn nhất tại sản lượng sản xuất $x = 40$.]),
    True([Khi công ty sản xuất sản lượng $x = 40$, doanh thu thu được nằm dưới ngưỡng đánh thuế nên công ty được miễn thuế hoàn toàn.]),
    [Lợi nhuận lớn nhất sau thuế công ty độc quyền có thể đạt được là $2750$ nghìn đồng.]
  ),
  loigiai: [
    #step[a) Hàm doanh thu trước thuế $R(x) = p dot x = (200 - x)x = 200x - x^2$. (Đúng)]
    #step[b) Lợi nhuận trước thuế $L(x) = R(x) - C(x) = (200x - x^2) - (x^2 + 40x + 500) = -2x^2 + 160x - 500$.
    Đạo hàm $L'(x) = -4x + 160 = 0 <=> x = 40$. Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $40$, $+oo$),
          d-signs: ("+", "0", "-"),
          v-vals: ($-500$, $2700$, $-oo$)
        )
      ]
    Lợi nhuận lớn nhất tại $x = 40$. (Đúng)]
    #step[c) Tại $x = 40$, doanh thu là $R(40) = 200(40) - 40^2 = 6400 < 8000$, nên được miễn thuế toàn bộ. (Đúng)]
    #step[d) Lợi nhuận tại mức sản lượng tối ưu được miễn thuế là $L(40) = 2700$ nghìn đồng, không phải $2750$ nghìn đồng. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Một xe khách chạy chuyến hành trình dài $200$ km với vận tốc hành trình $v$ (km/h) ($40 <= v <= 90$). Chi phí cho nhiên liệu của xe tỉ lệ với bình phương vận tốc: $c_(f u e l) = 0.1v^2$ (đồng/km). Lương của tài xế xe khách được trả cố định là $80$ nghìn đồng cho mỗi giờ chạy xe. Xét tính đúng/sai của các nhận định sau:],
  (
    True([Chi phí nhiên liệu cho toàn bộ chuyến đi $200$ km là $20v^2$ (đồng).]),
    True([Chi phí chi trả lương cho tài xế cho cả chuyến hành trình là $frac(16000000, v)$ (đồng).]),
    [Vận tốc chạy xe để tổng chi phí chuyến đi nhỏ nhất là $80$ km/h.],
    True([Nếu cung đường chạy xe có quy định giới hạn tốc độ tối đa không quá $70$ km/h thì chi phí hành trình nhỏ nhất đạt được khi xe chạy đúng vận tốc giới hạn $70$ km/h.])
  ),
  loigiai: [
    #step[a) Chi phí nhiên liệu cho toàn bộ chuyến đi $200$ km là $C_("fuel") = 200 dot 0.1v^2 = 20v^2$. (Đúng)]
    #step[b) Thời gian đi là $t = (200)/(v)$ giờ. Chi phí trả lương là $80000 dot (200)/(v) = (16000000)/(v)$ đồng. (Đúng)]
    #step[c) Tổng chi phí $C(v) = 20v^2 + (16000000)/(v)$. Đạo hàm $C'(v) = 40v - (16000000)/(v^2) = 0 <=> v^3 = 400000 <=> v approx 73.68$. Vận tốc tối ưu không phải $80$ km/h. (Sai)]
    #step[d) Nếu bị giới hạn tốc độ tối đa $70$ km/h ($v <= 70$). Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $v$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $70$, $73.68$),
          d-signs: ("-", "-", "0"),
          v-vals: ($+oo$, $C(70)$, $C_"min"$)
        )
      ]
    Trên đoạn $(0, 70]$, hàm $C(v)$ nghịch biến nên chi phí nhỏ nhất đạt tại giới hạn lớn nhất $v = 70$ km/h. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Một doanh nghiệp sản xuất độc quyền có hàm chi phí bình quân cho mỗi sản phẩm là $A C (x) = x + 10 + 50/x$ (nghìn đồng) và hàm doanh thu cận biên của hãng là $M R (x) = 130 - 4x$ (nghìn đồng/sản phẩm) với $x > 0$ là sản lượng. Xét tính đúng/sai của các mệnh đề sau:],
  (
    True([Hàm chi phí sản xuất của công ty là $C(x) = x^2 + 10x + 50$ (nghìn đồng).]),
    True([Hàm doanh thu của doanh nghiệp có dạng $R(x) = 130x - 2x^2$ (nghìn đồng).]),
    [Nếu nhà nước áp mức thuế cố định $10$ nghìn đồng trên mỗi đơn vị sản phẩm bán ra thì lợi nhuận sau thuế cực đại là $550$ nghìn đồng.],
    True([Khi chưa bị đánh thuế, doanh nghiệp đạt lợi nhuận lớn nhất tại quy mô sản lượng $x = 20$ sản phẩm.])
  ),
  loigiai: [
    #step[a) Hàm chi phí sản xuất $C(x) = x dot A C(x) = x(x + 10 + 50/x) = x^2 + 10x + 50$. (Đúng)]
    #step[b) Hàm doanh thu $R(x) = integral M R(x) d x = integral (130 - 4x) d x = 130x - 2x^2$. (Đúng)]
    #step[c) Nếu bị áp mức thuế $10$ nghìn/sản phẩm, lợi nhuận sau thuế là $L_t(x) = R(x) - C(x) - 10x = (130x - 2x^2) - (x^2 + 10x + 50) - 10x = -3x^2 + 110x - 50$.
    Đạo hàm $L_t'(x) = -6x + 110 = 0 <=> x = 55/3$. Khi đó lợi nhuận cực đại là $L_t(55/3) approx 958.33 > 550$. (Sai)]
    #step[d) Khi chưa đánh thuế, lợi nhuận là $L(x) = R(x) - C(x) = -3x^2 + 120x - 50$.
    Đạo hàm $L'(x) = -6x + 120 = 0 <=> x = 20$. Lợi nhuận lớn nhất tại quy mô $x = 20$. (Đúng)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Để nuôi cá trong một hồ nước, nếu thả $x$ con cá trên một đơn vị diện tích mặt hồ ($x >= 10$), thì sau một vụ trung bình mỗi con cá thu hoạch được nặng $P(x) = 480 - 2x$ (gam). Cần thả bao nhiêu con cá trên một đơn vị diện tích mặt hồ để thu được tổng sản lượng cá lớn nhất?],
  [$120$],
  loigiai: [
    #step[Tổng sản lượng cá thu hoạch được là $S(x) = x P(x) = x(480 - 2x) = 480x - 2x^2$.]
    #step[Đạo hàm $S'(x) = 480 - 4x$. Cho $S'(x) = 0 <=> 4x = 480 <=> x = 120$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($10$, $120$, $+oo$),
          d-signs: ("+", "0", "-"),
          v-vals: ($S(10)$, $28800$, $-oo$)
        )
      ]
      Dựa vào bảng biến thiên, ta cần thả $120$ con cá trên một đơn vị diện tích mặt hồ để thu được sản lượng lớn nhất.]
  ]
)

#tln(
  dir: "ngang",
  [Một khách sạn có $80$ phòng nghỉ. Quản lý nhận thấy nếu đặt giá thuê phòng là $600$ nghìn đồng/ngày thì tất cả các phòng đều được thuê hết. Tuy nhiên, cứ mỗi lần tăng giá thuê phòng thêm $50$ nghìn đồng/ngày thì sẽ có thêm $4$ phòng trống. Khách sạn cần đặt giá thuê mỗi phòng bằng bao nhiêu nghìn đồng/ngày để tổng doanh thu thu về mỗi ngày đạt giá trị lớn nhất?],
  [$800$],
  loigiai: [
    #step[Gọi $n$ là số lần tăng giá thêm $50$ nghìn đồng/ngày. Khi đó, giá thuê mới là $p = 600 + 50n$ (nghìn đồng), số phòng có người thuê là $q = 80 - 4n$.]
    #step[Tổng doanh thu thu về mỗi ngày là $R(n) = (600 + 50n)(80 - 4n) = 200(12 + n)(20 - n) = 200(240 + 8n - n^2)$.]
    #step[Đạo hàm $R'(n) = 200(8 - 2n)$. Cho $R'(n) = 0 <=> n = 4$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $n$,
          der: $R'$,
          func: $R$,
          x-vals: ($0$, $4$, $20$),
          d-signs: ("+", "0", "-"),
          v-vals: ($48000$, $51200$, $0$)
        )
      ]
      Doanh thu đạt giá trị lớn nhất khi $n = 4$. Khách sạn cần đặt giá thuê là $p = 600 + 50(4) = 800$ nghìn đồng/ngày.]
  ]
)

#tln(
  dir: "ngang",
  [Một hãng taxi công nghệ tính doanh thu cho mỗi chuyến xe phụ thuộc vào quãng đường di chuyển $x$ (km) của khách hàng theo công thức $R(x) = 15x - 0.05x^2$ (nghìn đồng) với $x <= 150$. Biết chi phí vận hành xe thực tế tính trên mỗi km di chuyển là $5$ nghìn đồng. Quãng đường di chuyển $x$ (km) bằng bao nhiêu để hãng taxi đạt lợi nhuận lớn nhất trên chuyến đi?],
  [$100$],
  loigiai: [
    #step[Tổng chi phí vận hành xe thực tế là $C(x) = 5x$ (nghìn đồng).]
    #step[Hàm lợi nhuận của hãng taxi trên chuyến đi là $L(x) = R(x) - C(x) = (15x - 0.05x^2) - 5x = 10x - 0.05x^2$ (với $x <= 150$).]
    #step[Đạo hàm $L'(x) = 10 - 0.1x$. Cho $L'(x) = 0 <=> 0.1x = 10 <=> x = 100$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $100$, $150$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $L_"max"$, $L(150)$)
        )
      ]
      Dựa vào bảng biến thiên, quãng đường di chuyển $x = 100$ km sẽ mang lại lợi nhuận lớn nhất cho hãng.]
  ]
)

#tln(
  dir: "ngang",
  [Để sản xuất $x$ sản phẩm trong một ngày, một doanh nghiệp phải trả chi phí lao động cho công nhân là $C_("labor")(x) = 4x^2 + 100x$ (nghìn đồng), cùng chi phí khấu hao vận hành dây chuyền cố định là $10000$ (nghìn đồng). Quy mô sản xuất $x$ bằng bao nhiêu sản phẩm mỗi ngày để chi phí trung bình sản xuất mỗi sản phẩm đạt giá trị nhỏ nhất?],
  [$50$],
  loigiai: [
    #step[Tổng chi phí để sản xuất $x$ sản phẩm là $C(x) = C_("labor")(x) + 10000 = 4x^2 + 100x + 10000$.]
    #step[Hàm chi phí trung bình sản xuất mỗi sản phẩm là $A C(x) = (C(x))/(x) = 4x + 100 + (10000)/(x)$ (với $x > 0$).]
    #step[Đạo hàm $A C'(x) = 4 - (10000)/(x^2)$. Cho $A C'(x) = 0 <=> 4x^2 = 10000 <=> x^2 = 2500 <=> x = 50$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $A C'$,
          func: $A C$,
          x-vals: ($0$, $50$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $500$, $+oo$)
        )
      ]
      Vậy để chi phí trung bình nhỏ nhất, doanh nghiệp cần sản xuất $x = 50$ sản phẩm mỗi ngày.]
  ]
)

#tln(
  dir: "ngang",
  [Một chiếc xe xitéc chở dầu chạy quãng đường dài $200$ km. Chi phí dầu chạy xe ước tính tiêu hao khoảng $0.001v^2$ (nghìn đồng/km) với $v$ (km/h) là vận tốc chạy xe. Chi phí trả lương cho lái xe và phụ xe là $432$ nghìn đồng cho mỗi giờ chạy xe. Để tổng chi phí của cả chuyến đi đạt giá trị nhỏ nhất thì lái xe cần chạy với vận tốc bằng bao nhiêu km/h?],
  [$60$],
  loigiai: [
    #step[Thời gian để xe xitéc chạy hết quãng đường là $t = (200)/(v)$ (giờ). Tổng chi phí nhiên liệu của chuyến đi là $C_("fuel") = 200 dot 0.001v^2 = 0.2v^2$ (nghìn đồng).]
    #step[Tổng chi phí lương cho lái xe và phụ xe là $C_("salary") = 432 dot (200)/(v) = (86400)/(v)$ (nghìn đồng).]
    #step[Tổng chi phí của cả chuyến đi là $C(v) = 0.2v^2 + (86400)/(v)$ (với $v > 0$).]
    #step[Đạo hàm $C'(v) = 0.4v - (86400)/(v^2)$. Cho $C'(v) = 0 <=> 0.4v^3 = 86400 <=> v^3 = 216000 <=> v = 60$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $v$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $60$, $+oo$),
          d-signs: ("-", "0", "+"),
          v-vals: ($+oo$, $2160$, $+oo$)
        )
      ]
      Vậy lái xe cần chạy với vận tốc $60$ km/h để tổng chi phí chuyến đi nhỏ nhất.]
  ]
)

#tln(
  dir: "ngang",
  [Nhu cầu tiêu thụ một loại hàng hóa đặc thù trên thị trường phụ thuộc vào mức thuế suất $t$ (phần trăm) đánh trên giá sản phẩm bán ra theo công thức $D(t) = 400 - 8t$ (đơn vị sản phẩm). Tổng ngân sách nhà nước thu được từ thuế đối với mặt hàng này được tính bằng công thức $T(t) = t.D(t)$ (triệu đồng). Tính mức thuế suất $t$ (phần trăm) để tổng ngân sách thu được đạt giá trị lớn nhất.],
  [$25$],
  loigiai: [
    #step[Tổng ngân sách nhà nước thu được từ thuế đối với mặt hàng này là $T(t) = t dot D(t) = t(400 - 8t) = 400t - 8t^2$ (triệu đồng).]
    #step[Đạo hàm $T'(t) = 400 - 16t$. Cho $T'(t) = 0 <=> 16t = 400 <=> t = 25$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $t$,
          der: $T'$,
          func: $T$,
          x-vals: ($0$, $25$, $50$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $5000$, $0$)
        )
      ]
      Dựa vào bảng biến thiên, mức thuế suất để ngân sách thu được lớn nhất là $25%$.]
  ]
)
