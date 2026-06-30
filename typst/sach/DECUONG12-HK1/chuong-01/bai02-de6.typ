#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#let draw-ellipse(cx, cy, rx, ry, stroke: 1pt, style: "solid") = {
  let stroke-val = stroke
  import draw: *
  if style == "dashed" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  } else if style == "dashed-back" {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  } else {
    arc((cx + rx, cy), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: stroke-val)
    arc((cx - rx, cy), start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke-val)
  }
}

#muc([Đề Luyện Tập Số 06 - Bài Toán Thực Tế & Tối Ưu Hóa Hình Học])

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "doc",
  [Một tấm bìa hình vuông có cạnh $a = 60$ cm. Người ta cắt bỏ đi $4$ hình vuông bằng nhau ở bốn góc, mỗi hình vuông có cạnh bằng $x$ (cm), rồi gấp phần còn lại lên để tạo thành một chiếc hộp không nắp. Tính $x$ để hộp tạo thành có thể tích lớn nhất.
  
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      // Tấm bìa trải phẳng
      rect((-3,-3), (3,3), stroke: 1pt)
      // Các ô vuông bị cắt
      rect((-3,-3), (-2,-2), fill: rgb("eee"))
      rect((2,-3), (3,-2), fill: rgb("eee"))
      rect((-3,2), (-2,3), fill: rgb("eee"))
      rect((2,2), (3,3), fill: rgb("eee"))
      // Đường gấp
      line((-2,-2), (2,-2), stroke: (dash: "dashed", paint: blue))
      line((-2,2), (2,2), stroke: (dash: "dashed", paint: blue))
      line((-2,-2), (-2,2), stroke: (dash: "dashed", paint: blue))
      line((2,-2), (2,2), stroke: (dash: "dashed", paint: blue))
      // Ghi chú
      content((-2.5,-2.5), $x$)
      content((0,-3.3), $60$)
      line((-3,-3.1), (3,-3.1), mark: (start: ">", end: ">"), stroke: 0.5pt)
    })
  ]
  ],
  (
    True([$10$ cm]),
    [$15$ cm],
    [$20$ cm],
    [$12$ cm]
  ),
  loigiai: [
    #step[Thể tích hộp là $V(x) = x(60 - 2x)^2$ với $0 < x < 30$.]
    #step[Đạo hàm $V'(x) = (60 - 2x)^2 - 4x(60 - 2x) = (60 - 2x)(60 - 6x)$. Cho $V'(x) = 0 <=> x = 10$ hoặc $x = 30$ (loại).]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $10$, $30$),
          d-signs: ("+", "0", "-"),
          v-vals: ($0$, $V_"max"$, $0$)
        )
      ]
      Thể tích lớn nhất khi $x = 10$ cm.]
  ]
)

#tn(
  dir: "doc",
  [Từ một khúc gỗ hình trụ tròn có bán kính đáy $R = 20$ cm, người ta muốn đẽo thành một thanh xà gồ có tiết diện là một hình chữ nhật có kích thước $x, y$ (cm). Biết rằng độ cứng của thanh xà gồ tỉ lệ thuận với tích $x y^3$. Để thanh xà gồ có độ cứng lớn nhất, kích thước $x, y$ phải thỏa mãn điều kiện gì?
  
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      circle((0,0), radius: 2, stroke: 1pt)
      rect((-1, -1.732), (1, 1.732), stroke: 1.2pt + blue, fill: blue.lighten(80%))
      line((0,0), (1, 1.732), stroke: (dash: "dashed", paint: red))
      content((0.3, 0.9), $R$)
      content((1.2, 0), $y$)
      content((0, 1.9), $x$)
    })
  ]
  ],
  (
    [$x = 10, y = 10sqrt(3)$],
    True([$x = 20, y = 20sqrt(3)$]),
    [$x = 20sqrt(2), y = 20sqrt(2)$],
    [$x = 10sqrt(2), y = 10sqrt(6)$]
  ),
  loigiai: [
    #step[Ta có $x^2 + y^2 = (2R)^2 = 1600$. Độ cứng $S = k dot x y^3$.]
    #step[Xét hàm $g(y) = (1600 - y^2) y^6 = 1600y^6 - y^8$.]
    #step[Đạo hàm $g'(y) = 9600y^5 - 8y^7 = 0 <=> y^2 = 1200 <=> y = 20sqrt(3)$. Khi đó $x = sqrt(1600 - 1200) = 20$.]
  ]
)

#tn(
  dir: "ngang",
  [Một nhà sản xuất cần làm những chiếc phễu hình nón từ các tấm tôn hình tròn bán kính $R = 1$ m. Để làm phễu, người ta cắt bỏ một hình quạt tròn ở tâm rồi ghép hai mép cắt lại. Góc ở tâm của phần tôn được giữ lại bằng bao nhiêu radian để phễu có thể tích lớn nhất?],
  (
    [$pi / 3$],
    [$pi$],
    True([$2sqrt(6)/3 pi$]),
    [$3pi / 2$]
  ),
  loigiai: [
    #step[Phần tôn giữ lại có cung dài $l = R alpha = alpha$. Bán kính đáy phễu là $r = l/(2pi) = alpha/(2pi)$.]
    #step[Đường sinh của phễu chính là bán kính $R = 1$. Chiều cao phễu $h = sqrt(1 - r^2)$.]
    #step[Thể tích phễu $V(r) = (1)/(3) pi r^2 sqrt(1 - r^2)$. Đặt $t = r^2$, tối đa hóa $f(t) = t^2(1 - t) = t^2 - t^3$.]
    #step[$f'(t) = 2t - 3t^2 = 0 <=> t = 2/3$. Suy ra $r = sqrt(2/3)$. Góc ở tâm $alpha = 2pi r = 2pi sqrt(2/3) = 2sqrt(6)/3 pi$.]
  ]
)

#tn(
  dir: "ngang",
  [Người ta muốn đặt một đường ống dẫn dầu từ một giàn khoan trên biển $A$ đến một nhà máy $B$ trên bờ. Khoảng cách từ giàn khoan đến đường bờ biển thẳng là $A H = 10$ km. Nhà máy $B$ nằm trên bờ biển cách $H$ một khoảng $H B = 20$ km. Chi phí lắp đặt đường ống dưới biển là $50$ nghìn USD/km và trên bờ là $30$ nghìn USD/km. Khoảng cách từ $H$ đến điểm cập bờ $X$ để tổng chi phí nhỏ nhất bằng bao nhiêu?
  
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      line((-3,0), (4,0), stroke: 2pt)
      circle((0, -2), radius: 0.1, fill: black)
      content((0, -2.4), $A$)
      circle((0, 0), radius: 0.1, fill: black)
      content((0, 0.3), $H$)
      circle((3, 0), radius: 0.1, fill: black)
      content((3, 0.3), $B$)
      line((0, -2), (0, 0), stroke: (dash: "dashed"))
      circle((1.5, 0), radius: 0.08, fill: blue)
      content((1.5, 0.3), text(blue)[$X$])
      line((0, -2), (1.5, 0), stroke: 1pt + blue)
      line((1.5, 0), (3, 0), stroke: 1pt + blue)
    })
  ]
  ],
  (
    [$5$ km],
    True([$7.5$ km]),
    [$10$ km],
    [$8$ km]
  ),
  loigiai: [
    #step[Gọi $x = H X$ ($0 <= x <= 20$). Quãng đường dưới biển $A X = sqrt(x^2 + 100)$, quãng đường trên bờ $X B = 20 - x$.]
    #step[Hàm chi phí $C(x) = 50sqrt(x^2 + 100) + 30(20 - x)$.]
    #step[Đạo hàm $C'(x) = (50x)/(sqrt(x^2 + 100)) - 30$. Cho $C'(x) = 0 <=> 50x = 30sqrt(x^2 + 100) <=> 25x^2 = 9(x^2 + 100) <=> 16x^2 = 900 <=> x = 7.5$.]
    #step[Bảng biến thiên:
      #v(0.5em)
      #align(center)[
        #my-bbbt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $7.5$, $20$),
          d-signs: ("-", "0", "+"),
          v-vals: ($1100$, $1000$, $50sqrt(500)$)
        )
      ]
      Chi phí nhỏ nhất khi $x = 7.5$ km.]
  ]
)

#tn(
  dir: "ngang",
  [Một công ty muốn in các trang quảng cáo hình chữ nhật. Mỗi trang cần có diện tích phần in chữ là $384$ cm². Các lề trên và dưới là $3$ cm, lề trái và phải là $2$ cm. Kích thước (chiều rộng $times$ chiều dài) của trang giấy sao cho diện tích trang giấy nhỏ nhất là bao nhiêu?],
  (
    [$16 times 24$ cm],
    True([$20 times 30$ cm]),
    [$18 times 28$ cm],
    [$22 times 32$ cm]
  ),
  loigiai: [
    #step[Gọi $x, y$ là chiều rộng và dài của phần in chữ ($x, y > 0$). Ta có $x y = 384 <=> y = 384/x$.]
    #step[Kích thước trang giấy là $(x + 4) times (y + 6)$. Diện tích giấy $S(x) = (x + 4)(y + 6) = (x + 4)(384/x + 6) = 384 + 6x + 1536/x + 24 = 6x + 1536/x + 408$.]
    #step[Đạo hàm $S'(x) = 6 - 1536/x^2 = 0 <=> 6x^2 = 1536 <=> x^2 = 256 <=> x = 16$.]
    #step[Chiều rộng trang giấy là $16 + 4 = 20$ cm, chiều dài là $384/16 + 6 = 24 + 6 = 30$ cm.]
  ]
)

#tn(
  dir: "ngang",
  [Một nhà thiết kế cần làm một chiếc bồn chứa nước hình trụ có nắp che bằng tôn. Bồn có thể tích yêu cầu là $V = 16pi$ m³. Do nắp bồn phải chịu tải trọng như nhau nên vật liệu làm nắp, đáy, và thân bồn có cùng đơn giá. Gọi $r$ là bán kính đáy bồn. Để chi phí vật liệu là nhỏ nhất thì $r$ bằng bao nhiêu?],
  (
    [$1$ m],
    [$2.5$ m],
    True([$2$ m]),
    [$3$ m]
  ),
  loigiai: [
    #step[Chiều cao $h = (16pi)/(pi r^2) = (16)/(r^2)$.]
    #step[Hàm chi phí vật liệu tỉ lệ với diện tích toàn phần: $C(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 32pi/r$.]
    #step[Đạo hàm $C'(r) = 4pi r - 32pi/r^2 = 0 <=> r^3 = 8 <=> r = 2$. Vậy $r = 2$ m.]
  ]
)

#tn(
  dir: "ngang",
  [Cho hai tàu biển $A$ và $B$. Tàu $A$ xuất phát từ một cảng và chạy về hướng Đông với vận tốc $20$ km/h. Cùng lúc đó, tàu $B$ xuất phát từ điểm cách cảng $100$ km về phía Bắc và chạy thẳng về hướng Nam (về phía cảng) với vận tốc $15$ km/h. Khoảng cách nhỏ nhất giữa hai tàu là bao nhiêu?],
  (
    [$60$ km],
    [$75$ km],
    True([$80$ km]),
    [$50$ km]
  ),
  loigiai: [
    #step[Sau $t$ giờ, tọa độ tàu $A$ là $(20t, 0)$. Tọa độ tàu $B$ là $(0, 100 - 15t)$.]
    #step[Khoảng cách bình phương $D^2(t) = (20t)^2 + (100 - 15t)^2 = 400t^2 + 10000 - 3000t + 225t^2 = 625t^2 - 3000t + 10000$.]
    #step[Đạo hàm $(D^2)' = 1250t - 3000 = 0 <=> t = 3000/1250 = 2.4$.]
    #step[Khoảng cách min: $D^2(2.4) = 625(2.4)^2 - 3000(2.4) + 10000 = 3600 - 7200 + 10000 = 6400 <=> D = 80$ km.]
  ]
)

#tn(
  dir: "ngang",
  [Một ô cửa sổ có hình dạng là một hình chữ nhật phía dưới và một hình bán nguyệt ở trên. Biết chu vi của cửa sổ là $P = 4 + pi$ (m). Để cửa sổ đón được nhiều ánh sáng nhất (diện tích lớn nhất) thì chiều rộng của cửa sổ bằng bao nhiêu?],
  (
    [$1.5$ m],
    True([$2$ m]),
    [$2.5$ m],
    [$3$ m]
  ),
  loigiai: [
    #step[Gọi chiều rộng hình chữ nhật là $2r$ (đường kính bán nguyệt), chiều cao là $h$. Chu vi $P = 2h + 2r + pi r = 4 + pi => h = ((4+pi) - r(2+pi))/(2)$.]
    #step[Diện tích $S(r) = 2r h + 1/2 pi r^2 = r(4 + pi - 2r - pi r) + 1/2 pi r^2 = (4+pi)r - 2r^2 - 1/2 pi r^2$.]
    #step[Đạo hàm $S'(r) = (4+pi) - 4r - pi r = 0 <=> r(4+pi) = 4+pi <=> r = 1$.]
    #step[Chiều rộng cửa sổ là $2r = 2$ m.]
  ]
)

#tn(
  dir: "ngang",
  [Một khối cầu có bán kính $R=6$ cm. Một khối nón nội tiếp khối cầu đó có thể tích lớn nhất bằng bao nhiêu?],
  (
    [$128pi/3$],
    True([$256pi/3$]),
    [$64pi$],
    [$128pi$]
  ),
  loigiai: [
    #step[Gọi đường cao khối nón là $h$ ($0 < h < 12$). Bán kính đáy $r$. Ta có $r^2 = R^2 - (h - R)^2 = 2h R - h^2 = 12h - h^2$.]
    #step[Thể tích $V(h) = (1)/(3) pi r^2 h = (1)/(3) pi (12h - h^2) h = (pi)/(3) (12h^2 - h^3)$.]
    #step[Đạo hàm $V'(h) = (pi)/(3) (24h - 3h^2) = 0 <=> h = 8$.]
    #step[V max là $V(8) = (pi)/(3) (12(64) - 512) = 256pi/3$.]
  ]
)

#tn(
  dir: "ngang",
  [Một người cần làm một hộp hình hộp chữ nhật không nắp từ một tấm bìa hình chữ nhật kích thước $30 times 40$ cm bằng cách cắt đi $4$ hình vuông bằng nhau ở $4$ góc. Gọi $x$ (cm) là cạnh hình vuông bị cắt. Giá trị $x$ gần nhất với số nào sau đây để thể tích hộp là lớn nhất?],
  (
    [$4$ cm],
    [$5$ cm],
    True([$5.66$ cm]),
    [$6$ cm]
  ),
  loigiai: [
    #step[Thể tích $V(x) = x(30 - 2x)(40 - 2x) = x(1200 - 140x + 4x^2) = 4x^3 - 140x^2 + 1200x$ với $0 < x < 15$.]
    #step[Đạo hàm $V'(x) = 12x^2 - 280x + 1200$. Cho $V'(x) = 0 <=> 3x^2 - 70x + 300 = 0$.]
    #step[Nghiệm $x = (70 - sqrt(4900 - 3600))/(6) = (70 - 10sqrt(13))/(6) approx 5.657$.]
  ]
)

#tn(
  dir: "ngang",
  [Chi phí để duy trì một hệ thống máy móc trong $t$ năm (bao gồm chi phí bảo dưỡng và hao mòn) được tính bằng hàm $f(t) = (800)/(t) + 32t$ (triệu đồng). Sau bao nhiêu năm thì chi phí trung bình là nhỏ nhất?],
  (
    [$3$ năm],
    [$4$ năm],
    True([$5$ năm]),
    [$6$ năm]
  ),
  loigiai: [
    #step[Hàm chi phí $f(t) = (800)/(t) + 32t$.]
    #step[Đạo hàm $f'(t) = -800/t^2 + 32 = 0 <=> t^2 = 25 <=> t = 5$. Vậy sau $5$ năm chi phí nhỏ nhất.]
  ]
)

#tn(
  dir: "ngang",
  [Một doanh nghiệp sản xuất điện thoại. Lợi nhuận gộp mỗi chiếc là $5$ triệu đồng nếu sản xuất $1000$ chiếc. Cứ tăng sản lượng thêm $100$ chiếc thì do thị trường bão hòa, lợi nhuận gộp mỗi chiếc giảm $200$ nghìn đồng. Doanh nghiệp cần sản xuất bao nhiêu chiếc để tổng lợi nhuận lớn nhất?],
  (
    [$1500$ chiếc],
    [$1600$ chiếc],
    True([$1750$ chiếc]),
    [$2000$ chiếc]
  ),
  loigiai: [
    #step[Gọi $n$ là số lần tăng $100$ chiếc. Sản lượng $x = 1000 + 100n$. Lợi nhuận mỗi chiếc $p = 5 - 0.2n$.]
    #step[Tổng lợi nhuận $L(n) = (1000 + 100n)(5 - 0.2n) = 100(10 + n) dot 0.2(25 - n) = 20(250 + 15n - n^2)$.]
    #step[Đạo hàm $L'(n) = 20(15 - 2n) = 0 <=> n = 7.5$.]
    #step[Sản lượng là $x = 1000 + 100(7.5) = 1750$ chiếc.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",lines: 4,
  [Cho hình trụ nội tiếp một mặt cầu có bán kính $R = 3$ dm. Gọi $h$ là chiều cao của hình trụ và $r$ là bán kính đáy hình trụ. Xét tính đúng/sai của các mệnh đề sau:
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      circle((0,0), radius: 2, stroke: 1pt)
      draw-ellipse(0, 1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      draw-ellipse(0, -1.15, 1.63, 0.4, stroke: 1pt + blue, style: "dashed-back")
      line((-1.63, 1.15), (-1.63, -1.15), stroke: 1pt + blue)
      line((1.63, 1.15), (1.63, -1.15), stroke: 1pt + blue)
    })
  ]
  ],
  (
    True([Mối liên hệ giữa bán kính mặt cầu, đáy trụ và chiều cao trụ là $r^2 + (h^2)/(4) = 9$.]),
    True([Thể tích khối trụ được tính bởi hàm số $V(h) = pi h (9 - (h^2)/(4))$.]),
    [Đạo hàm $V'(h) = pi (9 - (3h^2)/(4))$ nên khối trụ có thể tích lớn nhất khi $h = 3$ dm.],
    True([Thể tích lớn nhất của khối trụ là $12sqrt(3)pi$ (dm³).])
  ),
  loigiai: [
    #step[a) Dựa vào định lý Pytago trong tam giác vuông tạo bởi tâm mặt cầu, tâm đáy trụ và một điểm trên đường tròn đáy: $r^2 + (h/2)^2 = R^2 = 9$. (Đúng)]
    #step[b) Thể tích trụ $V = pi r^2 h = pi (9 - h^2/4) h$. (Đúng)]
    #step[c) Đạo hàm $V'(h) = pi(9 - 3h^2/4)$. $V'(h) = 0 <=> h^2 = 12 <=> h = 2sqrt(3)$. (Sai)]
    #step[d) Với $h = 2sqrt(3)$, $V = pi (2sqrt(3))(9 - 3) = 12sqrt(3)pi$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Một công ty vận tải quản lý đội xe chở khách. Chi phí vận hành trung bình cho một xe tỷ lệ với hàm $C(v) = 0.5v^2 - 40v + 1500$ (nghìn đồng/giờ), với $v$ (km/h) là tốc độ ($40 <= v <= 100$). Xét tính đúng/sai:],
  (
    [Chi phí vận hành theo một giờ là nhỏ nhất khi vận tốc $v = 60$ km/h.],
    True([Tốc độ $v = 40$ km/h mang lại chi phí vận hành mỗi giờ nhỏ nhất trong khoảng cho phép.]),
    True([Nếu chạy với $v = 100$ km/h, chi phí một giờ là $2500$ nghìn đồng.]),
    [Để tiết kiệm nhất, xe nên chạy ở vận tốc càng chậm càng tốt (không giới hạn dưới).]
  ),
  loigiai: [
    #step[a) $C'(v) = v - 40$. $C'(v) = 0 <=> v = 40$. Vậy cực tiểu đạt tại $v = 40$. Tại $v=60$ chi phí không nhỏ nhất. (Sai)]
    #step[b) Hàm đồng biến trên $[40, 100]$, cực tiểu tại biên $v=40$. (Đúng)]
    #step[c) $C(100) = 0.5(10000) - 4000 + 1500 = 5000 - 4000 + 1500 = 2500$. (Đúng)]
    #step[d) Không thể chạy chậm tùy ý vì có giới hạn dưới $40$ và chi phí thời gian thực tế thường có giới hạn. Tại $v=0$, hàm chi phí là $1500$ (lớn hơn $C(40)=700$). (Sai)]
  ]
)

#ds(
  dir: "doc",lines:4,
  [Một công ty nông nghiệp trồng cà chua trong nhà kính. Nếu trồng $40$ cây trên một đơn vị diện tích, sản lượng mỗi cây là $12$ kg. Cứ trồng thêm một cây thì do chật chội, sản lượng mỗi cây giảm $0.2$ kg. Gọi $x$ là số cây trồng thêm ($x >= 0$). Xét tính đúng/sai:],
  (
    True([Tổng sản lượng thu hoạch trên một đơn vị diện tích là $S(x) = (40 + x)(12 - 0.2x)$.]),
    True([Nếu trồng $50$ cây/đơn vị diện tích thì tổng sản lượng là $500$ kg.]),
    True([Sản lượng đạt cực đại khi trồng tổng cộng $50$ cây.]),
    [Sản lượng thu hoạch cao nhất có thể đạt được là $480$ kg.]
  ),
  loigiai: [
    #step[a) Số cây là $40+x$, năng suất là $12-0.2x$. Tổng $S(x) = (40+x)(12-0.2x)$. (Đúng)]
    #step[b) Nếu tổng $50$ cây, $x=10$. $S(10) = 50(12 - 2) = 500$ kg. (Đúng)]
    #step[c) $S(x) = 480 + 4x - 0.2x^2$. $S'(x) = 4 - 0.4x = 0 <=> x = 10$. Tổng cộng $40+10=50$ cây. (Đúng)]
    #step[d) Năng suất cao nhất là $S(10) = 500$ kg, không phải $480$ kg. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Cắt hình chóp tứ giác đều $S . A B C D$ có cạnh đáy $a = 6$, chiều cao $h = 9$ thành một hình lăng trụ tứ giác đều nội tiếp (một mặt đáy của lăng trụ nằm trên $A B C D$, các đỉnh đáy còn lại nằm trên các cạnh bên của hình chóp). Gọi cạnh đáy lăng trụ là $x$, chiều cao lăng trụ là $y$. Xét tính đúng/sai:],
  (
    True([Từ định lý Ta-lét, ta có hệ thức tỉ lệ giữa cạnh đáy lăng trụ và chiều cao là $y = 9 - 1.5x$.]),
    True([Thể tích lăng trụ được tính bằng $V(x) = x^2(9 - 1.5x)$.]),
    True([Thể tích lớn nhất của lăng trụ đạt được khi cạnh đáy $x = 4$.]),
    [Lăng trụ có thể tích lớn nhất bằng $24$.]
  ),
  loigiai: [
    #step[a) Kẻ đường cao $S H$. Mặt lăng trụ cắt $S H$ tại $H'$. Đáy lăng trụ là hình vuông cạnh $x$. Ta-lét: $(x)/(6) = (9 - y)/(9) <=> 9 - y = 1.5x <=> y = 9 - 1.5x$. (Đúng)]
    #step[b) Thể tích $V = x^2 y = x^2(9 - 1.5x)$. (Đúng)]
    #step[c) $V'(x) = 18x - 4.5x^2 = 0 <=> x = 4$. (Đúng)]
    #step[d) Tại $x = 4$, $V(4) = 16(9 - 6) = 48 > 24$. (Sai)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Một nhà sản xuất bao bì cần thiết kế một chiếc hộp hình hộp chữ nhật có đáy là hình vuông và không có nắp. Yêu cầu hộp phải chứa được thể tích $108$ cm³. Giá thành của vật liệu làm đáy hộp và làm mặt bên là bằng nhau. Tính độ dài cạnh đáy của hộp (đơn vị: cm) để chi phí vật liệu là nhỏ nhất.],
  [$6$],
  loigiai: [
    #step[Gọi cạnh đáy là $x$, chiều cao $h$. Thể tích $V = x^2 h = 108 => h = 108/x^2$.]
    #step[Hàm diện tích toàn phần $C(x) = x^2 + 4x h = x^2 + 4x(108/x^2) = x^2 + 432/x$.]
    #step[Cho $C'(x) = 0 <=> 2x - 432/x^2 = 0 <=> 2x^3 = 432 <=> x^3 = 216 <=> x = 6$. Vậy $x = 6$ cm.]
  ]
)

#tln(
  dir: "ngang",
  [Một công ty có hàm doanh thu cận biên $M R(x) = 300 - 0.2x$ và chi phí cận biên $M C(x) = 40 + 0.3x$. Hỏi sản lượng $x$ bằng bao nhiêu để công ty đạt lợi nhuận cực đại?],
  [$520$],
  loigiai: [
    #step[Lợi nhuận đạt cực đại khi $M R = M C <=> 300 - 0.2x = 40 + 0.3x <=> 0.5x = 260 <=> x = 520$.]
  ]
)

#tln(
  dir: "ngang",
  [Một bãi đỗ xe tính phí $P(t) = 10t + 5$ (nghìn đồng) cho $t$ giờ đỗ xe ($0 <= t <= 24$). Một công ty vận tải có $n$ xe cần đỗ trong $t$ giờ. Biết số giờ đỗ xe phụ thuộc vào số lượng xe theo hàm $t = 24 - 0.5n$. Lợi nhuận của bãi đỗ (bằng doanh thu) lớn nhất khi số xe đỗ $n$ bằng bao nhiêu?],
  [$24$],
  loigiai: [
    #step[Doanh thu $R(n) = n P(t) = n(10(24 - 0.5n) + 5) = n(240 - 5n + 5) = n(245 - 5n) = 245n - 5n^2$.]
    #step[Đạo hàm $R'(n) = 245 - 10n = 0 <=> n = 24.5$. Vì $n$ nguyên nên $n = 24$ hoặc $n = 25$. Tại $n=24$, $R(24) = 3000$. Tại $n=25$, $R(25) = 3000$. Chọn 24 hoặc 25 đều được. Ghi 24.]
  ]
)

#tln(
  dir: "ngang",
  [Một người thợ cơ khí cần cắt một thanh kim loại dài $10$ m thành hai đoạn. Đoạn thứ nhất uốn thành một hình vuông, đoạn thứ hai uốn thành một vòng tròn. Gọi $x$ (m) là độ dài đoạn uốn thành hình tròn. Tìm $x$ (làm tròn đến hai chữ số thập phân) để tổng diện tích của hình vuông và hình tròn thu được là nhỏ nhất.],
  [$4.40$],
  loigiai: [
    #step[Đoạn uốn thành hình vuông là $10 - x$. Diện tích hình vuông là $S_v = (10-x)^2/16$. Đoạn uốn vòng tròn chu vi $x => r = x/(2pi) => S_t = pi r^2 = x^2 / (4pi)$.]
    #step[Tổng $S(x) = (10-x)^2/16 + x^2/(4pi)$. $S'(x) = -(10-x)/8 + x/(2pi) = 0 <=> 4x = pi(10-x) <=> x = 10pi/(4+pi) approx 4.40$ m.]
  ]
)

#tln(
  dir: "ngang",
  [Một công ty sản xuất máy chiếu muốn thiết kế vỏ hộp bảo vệ dạng lăng trụ tam giác đều có thể tích $V = 16$ dm³. Tính cạnh đáy của hộp (dm) sao cho tốn ít nguyên liệu nhất (diện tích toàn phần nhỏ nhất).],
  [$4$],
  loigiai: [
    #step[Gọi cạnh đáy là $a$, chiều cao $h$. Thể tích $V = a^2 sqrt(3)/4 h = 16 => h = 64/(a^2 sqrt(3))$.]
    #step[Diện tích toàn phần $S(a) = 2(a^2 sqrt(3)/4) + 3a h = a^2 sqrt(3)/2 + 3a(64/(a^2 sqrt(3))) = a^2 sqrt(3)/2 + 64sqrt(3)/a$.]
    #step[Đạo hàm $S'(a) = a sqrt(3) - 64sqrt(3)/a^2 = 0 <=> a^3 = 64 <=> a = 4$.]
  ]
)

#tln(
  dir: "ngang",
  [Theo thống kê, chi phí y tế cho một đợt dịch bệnh phụ thuộc vào số ngày phong tỏa $t$ ($t >= 0$) theo hàm số $C(t) = t^3 - 30t^2$ (tỷ đồng). Tuy nhiên, nếu phong tỏa quá lâu, chi phí xã hội sẽ tăng thêm theo hàm $S(t) = 225t$ (tỷ đồng). Tổng chi phí tổn thất là $F(t) = C(t) + S(t)$. Trong khoảng từ $10$ đến $20$ ngày, tổng chi phí nhỏ nhất là bao nhiêu tỷ đồng?],
  [$0$],
  loigiai: [
    #step[Hàm tổng $F(t) = t^3 - 30t^2 + 225t$.]
    #step[Đạo hàm $F'(t) = 3t^2 - 60t + 225 = 0 <=> t^2 - 20t + 75 = 0 <=> t = 15$ hoặc $t = 5$.]
    #step[Tại $t = 15$: $F(15) = 3375 - 6750 + 3375 = 0$.]
  ]
)
