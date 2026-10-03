#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "loigiai"
#let accent = rgb("d97706")
#let ma-de = "1001"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - GIẢI TÍCH 12",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Một công ty nghiên cứu cho thấy lợi nhuận $P(x)$ (tính bằng tỷ đồng) của họ trong năm đầu tiên phụ thuộc vào tháng thứ $x$ ($1 <= x <= 12$) với đạo hàm $P'(x) = -x^2 + 10x - 16$. Công ty làm ăn có lãi (lợi nhuận tăng) trong khoảng thời gian nào sau đây?],
  (
    [Từ tháng 1 đến tháng 2.],
    True([Từ tháng 2 đến tháng 8.]),
    [Từ tháng 8 đến tháng 12.],
    [Từ tháng 4 đến tháng 10.]
  ),
  loigiai: [
    + Ta có $P'(x) = -x^2 + 10x - 16 = 0 <=> x=2$ hoặc $x=8$.
    + $P'(x) > 0 <=> 2 < x < 8$.
    + Vậy công ty làm ăn có lãi từ tháng 2 đến tháng 8.
  ]
)

#tn([Cho hàm số $y=f(x)$ có bảng biến thiên trên đoạn $[-3; 5]$ như sau:
#align(center)[
  #bbbt(
    x-vals: ($-3$, $1$, $4$, $5$),
    d-signs: ($+$, $0$, $-$, $0$, $+$),
    v-vals: ($-2$, $6$, $1$, $3$),
  )
]
Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $g(x) = f(x) + 2$ trên đoạn $[-3; 5]$. Tính $M - m$.],
  (
    True([8]),
    [4],
    [5],
    [7]
  ),
  loigiai: [
    + Dựa vào BBT, trên đoạn $[-3; 5]$, giá trị lớn nhất của $f(x)$ là $max f(x) = 6$ (tại $x=1$), giá trị nhỏ nhất là $min f(x) = -2$ (tại $x=-3$).
    + Suy ra $M = max g(x) = max f(x) + 2 = 6+2 = 8$.
    + $m = min g(x) = min f(x) + 2 = -2+2 = 0$.
    + Tính $M - m = 8 - 0 = 8$.
  ]
)

#tn([Quỹ đạo chuyển động của một vật thể được cho bởi phương trình $s(t) = -t^3 + 6t^2 + 15t + 2$, trong đó $t$ (giây) là thời gian và $s$ (mét) là quãng đường di chuyển. Vận tốc của vật thể đạt giá trị lớn nhất tại thời điểm nào?],
  (
    True([$t = 2$ s]),
    [$t = 3$ s],
    [$t = 1$ s],
    [$t = 4$ s]
  ),
  loigiai: [
    + Vận tốc $v(t) = s'(t) = -3t^2 + 12t + 15$.
    + Đạo hàm $v'(t) = -6t + 12 = 0 <=> t = 2$.
    + Bảng biến thiên của vận tốc $v(t)$:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $2$, $+oo$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($15$, $27$, $-oo$),
      )
    ]
    + Vậy vận tốc của vật thể đạt giá trị lớn nhất $27 "m/s"$ tại thời điểm $t=2$ s.
  ]
)

#tn([Một người nông dân muốn rào một mảnh vườn hình chữ nhật dọc theo một bờ tường bằng 100 mét dây rào. (Bờ tường không cần rào, dây rào chỉ dùng cho 3 cạnh còn lại). Diện tích lớn nhất của mảnh vườn có thể rào được là bao nhiêu?],
  (
    [1000 $m^2$],
    True([1250 $m^2$]),
    [2500 $m^2$],
    [1200 $m^2$]
  ),
  loigiai: [
    + Gọi chiều rộng mảnh vườn là $x$ ($m$), chiều dài là $y$ ($m$).
    + Ta có $2x + y = 100 => y = 100 - 2x$ (với $0 < x < 50$).
    + Diện tích mảnh vườn: $S(x) = x(100-2x) = 100x - 2x^2$.
    + Đạo hàm $S'(x) = 100 - 4x = 0 <=> x=25$.
    + Bảng biến thiên:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $25$, $50$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $1250$, $0$),
      )
    ]
    + Diện tích lớn nhất của mảnh vườn có thể rào được là $1250 m^2$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1, 0), (6, 0), stroke: (paint: gray, thickness: 3pt))
      content((2.5, 0.4), text(fill: gray)[Bờ tường])
      rect((0,0), (5,-2), stroke: blue, fill: rgb(0,0,255,20))
      content((2.5, -2.4), $y = 100 - 2x$)
      content((-0.4, -1), $x$)
      content((5.4, -1), $x$)
    })]
  ]
)

#tn([Tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (x^2+3)/(x-1)$ trên đoạn $[2; 4]$ bằng],
  (
    True([$13$]),
    [$40/3$],
    [$14$],
    [$6$]
  ),
  loigiai: [
    + Đạo hàm $y' = (x^2-2x-3)/(x-1)^2 = 0 <=> x=3, x=-1$.
    + Trên $[2;4]$ nhận $x=3$.
    + Ta có $y(2)=7$, $y(3)=6$, $y(4)=19/3$.
    + $"Max" = 7$, $"Min" = 6$. Tổng $7+6 = 13$.
  ]
)

#tn([Khoảng cách giữa hai điểm cực trị của đồ thị hàm số $y = (x^2+x+4)/(x+1)$ bằng],
  (
    [$sqrt(5)$],
    [$4$],
    True([$4sqrt(5)$]),
    [$5$]
  ),
  loigiai: [
    + Đạo hàm $y' = (x^2+2x-3)/(x+1)^2 = 0 <=> x=1$ hoặc $x=-3$.
    + Tọa độ hai điểm cực trị là $A(1; 3)$ và $B(-3; -5)$.
    + Khoảng cách $A B = sqrt((-3-1)^2 + (-5-3)^2) = sqrt(16 + 64) = sqrt(80) = 4sqrt(5)$.
  ]
)

#tn([Số lượng vi khuẩn $N(t)$ (đơn vị: nghìn con) trong một mẫu nuôi cấy sau $t$ giờ được mô hình hóa bởi hàm số $N(t) = (1000t)/(t^2+1)$. Quần thể vi khuẩn này suy giảm trong khoảng thời gian nào?],
  (
    [Từ giờ thứ 0 đến giờ thứ 1.],
    True([Từ giờ thứ 1 trở đi.]),
    [Từ giờ thứ 0 đến giờ thứ 2.],
    [Không bao giờ suy giảm.]
  ),
  loigiai: [
    + $N'(t) = (1000(1-t^2))/(t^2+1)^2$.
    + $N'(t) < 0 <=> 1-t^2 < 0 <=> t > 1$ (do $t > 0$).
    + Vậy quần thể suy giảm từ giờ thứ 1 trở đi.
  ]
)

#tn([Một thiết bị theo dõi mực nước hồ thủy điện (tính bằng mét) theo thời gian $t$ (giờ) ghi nhận được đồ thị biến thiên của mực nước như bảng sau:
#align(center)[
  #bbbt(
    x-vals: ($0$, $8$, $16$, $24$),
    d-signs: ($+$, $0$, $-$, $0$, $+$),
    v-vals: ($20$, $45$, $15$, $30$),
  )
]
Trong một ngày (từ $t=0$ đến $t=24$), mực nước trong hồ đạt mức thấp nhất vào thời điểm nào?],
  (
    [$t=0$ giờ],
    [$t=8$ giờ],
    True([$t=16$ giờ]),
    [$t=24$ giờ]
  ),
  loigiai: [
    + Dựa vào BBT, giá trị nhỏ nhất của mực nước trong hồ trên đoạn $[0; 24]$ là 15 mét, đạt được tại $t=16$ giờ.
  ]
)

#tn([Biết rằng đồ thị hàm số $y = x^3 - 3x^2 - 9x + 2$ có hai điểm cực trị là $A$ và $B$. Đường thẳng đi qua hai điểm $A$ và $B$ có phương trình là],
  (
    [$y = -8x + 2$],
    True([$y = -8x - 1$]),
    [$y = 8x - 1$],
    [$y = -8x + 1$]
  ),
  loigiai: [
    + Ta có $y' = 3x^2 - 6x - 9 = 0 <=> x=-1$ hoặc $x=3$.
    + Với $x=-1 => y = 7 => A(-1; 7)$.
    + Với $x=3 => y = -25 => B(3; -25)$.
    + Phương trình đường thẳng $A B$ là $y = -8x - 1$.
  ]
)

#tn([Chi phí sản xuất $x$ sản phẩm của một nhà máy được cho bởi $C(x) = 1/3 x^3 - 30x^2 + 1000x + 5000$ (nghìn đồng). Hàm chi phí biên (tốc độ thay đổi chi phí theo số lượng sản phẩm, tức $C'(x)$) đạt giá trị nhỏ nhất khi nhà máy sản xuất bao nhiêu sản phẩm?],
  (
    True([30 sản phẩm.]),
    [20 sản phẩm.],
    [15 sản phẩm.],
    [60 sản phẩm.]
  ),
  loigiai: [
    + Chi phí biên $f(x) = C'(x) = x^2 - 60x + 1000$.
    + Để tìm GTLN/GTNN của $f(x)$, ta lấy đạo hàm: $f'(x) = 2x - 60 = 0 <=> x = 30$.
    + Bảng biến thiên của hàm chi phí biên $f(x)$:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $30$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($1000$, $100$, $+oo$),
      )
    ]
    + Dựa vào BBT, chi phí biên nhỏ nhất đạt được khi nhà máy sản xuất $x = 30$ sản phẩm.
  ]
)

#tn([Cho biết hàm số $y = (x^2+a x+b)/(x+c)$ đạt cực đại tại điểm $M(0; -1)$ và đạt cực tiểu tại điểm $N(2; 3)$. Tính giá trị của biểu thức $T = a+b+c$.],
  (
    [$T = 3$],
    True([$T = -1$]),
    [$T = 1$],
    [$T = -4$]
  ),
  loigiai: [
    + Ta có $y' = (x^2+2c x+a c-b)/(x+c)^2$.
    + $y'$ bằng 0 tại $x=0$ và $x=2 => c=-1, a c-b=0 => a(-1)-b=0 => a=-b$.
    + Thế $c=-1$ vào hàm số: $y=(x^2+a x-a)/(x-1)$.
    + Điểm $M(0;-1) => -a/(-1) = -1 => a = -1 => b = 1$.
    + Vậy $T = a+b+c = -1+1-1 = -1$.
  ]
)

#tn([Nồng độ một loại thuốc trong máu của bệnh nhân (tính bằng mg/L) sau $t$ giờ tiêm được mô phỏng bởi hàm $C(t) = 4t e^(-t)$. Nồng độ thuốc cao nhất trong máu là bao nhiêu (làm tròn đến hai chữ số thập phân)?],
  (
    True([$1.47$ mg/L]),
    [$2.00$ mg/L],
    [$1.50$ mg/L],
    [$1.35$ mg/L]
  ),
  loigiai: [
    + Đạo hàm $C'(t) = 4e^(-t) - 4t e^(-t) = 4e^(-t)(1-t)$.
    + Cho $C'(t) = 0 <=> 1-t = 0 <=> t = 1$.
    + Bảng biến thiên:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $1$, $+oo$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $4/e$, $0$),
      )
    ]
    + Nồng độ thuốc cao nhất trong máu là $C(1) = 4/e approx 1.47$ mg/L.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y=f(x)$ liên tục trên $RR$ và có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $-1$, $1$, $+oo$),
    d-signs: ($-$, $0$, $+$, $0$, $-$),
    v-vals: ($2$, $-3$, $4$, $-1$),
  )
]],
  (
    True([Đồ thị hàm số có hai đường tiệm cận ngang là $y = 2$ và $y = -1$.]),
    False([Đồ thị hàm số có tiệm cận đứng là $x = 1$.]),
    True([Giá trị lớn nhất của hàm số trên $RR$ bằng 4.]),
    False([Hàm số nghịch biến trên khoảng $(0; 2)$.])
  ),
  loigiai: [
    + $lim_(x -> -oo) f(x) = 2$ và $lim_(x -> +oo) f(x) = -1$ nên có hai tiệm cận ngang $y=2, y=-1$. => a) Đúng.
    + Hàm số liên tục trên $RR$ nên không có tiệm cận đứng. => b) Sai.
    + Dựa vào BBT, giá trị cao nhất là 4 nên GTLN là 4. => c) Đúng.
    + Trên $(0; 2)$, đạo hàm đổi dấu từ dương sang âm tại $x=1$ nên không thể luôn nghịch biến. => d) Sai.
  ]
)

#ds([Một nghiên cứu chỉ ra rằng nhịp tim của một bệnh nhân $H(t)$ (nhịp/phút) trong thời gian dùng thuốc phản ứng theo phương trình $H(t) = 60 + (100t)/(t^2 + 25)$ với $t >= 0$ là thời gian tính bằng phút.],
  (
    True([Khi bắt đầu uống thuốc ($t=0$), nhịp tim của bệnh nhân là 60 nhịp/phút.]),
    False([Nhịp tim của bệnh nhân liên tục tăng trong 10 phút đầu tiên.]),
    True([Nhịp tim đạt mức cao nhất tại thời điểm $t = 5$ phút.]),
    False([Nhịp tim cao nhất mà bệnh nhân đạt được lớn hơn 80 nhịp/phút.])
  ),
  loigiai: [
    + Nhịp tim tại $t=0$: $H(0) = 60$. => a) Đúng.
    + Tính đạo hàm: $H'(t) = (100(25-t^2))/(t^2+25)^2 = 0 <=> t = 5$.
    + Lập bảng biến thiên:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $5$, $+oo$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($60$, $70$, $60$),
      )
    ]
    + Hàm số đồng biến trên $[0;5]$, nghịch biến trên $(5; +oo)$. Nhịp tim chỉ tăng trong 5 phút đầu => b) Sai.
    + Đạt max tại $t=5$ => c) Đúng.
    + $"Max" H(5) = 70 < 80$ => d) Sai.
  ]
)

#ds([Cho đồ thị của hàm số đạo hàm $y = f'(x)$ là một Parabol có bề lõm hướng lên, cắt trục hoành tại hai điểm phân biệt có hoành độ $x=0$ và $x=2$.],
  (
    False([Hàm số $y = f(x)$ đồng biến trên khoảng $(0; 2)$.]),
    True([Hàm số $y = f(x)$ đạt cực đại tại $x = 0$.]),
    True([Hàm số $y = f(x)$ đạt cực tiểu tại $x = 2$.]),
    True([Hàm số $y = f(x)$ nghịch biến trên khoảng $(0; 1)$.])
  ),
  loigiai: [
    + Vì đồ thị $f'(x)$ là parabol lõm lên cắt trục hoành tại $0, 2$ nên $f'(x) < 0$ trên $(0; 2)$ và $f'(x) > 0$ trên $(-oo; 0)$ và $(2; +oo)$.
    + => $f(x)$ nghịch biến trên $(0;2)$ => a) Sai, c) Đúng.
    + Đổi dấu từ dương sang âm tại $x=0$ => Cực đại tại $x=0$ => b) Đúng.
    + Khoảng $(0; 1)$ nằm trong $(0; 2)$ nên hàm số nghịch biến trên $(0; 1)$ => d) Đúng.
  ]
)

#ds([Một công ty sản xuất đồ uống muốn thiết kế một chiếc lon hình trụ đứng có thể tích $V = 330$ ml. Để lon cứng cáp, vật liệu làm hai mặt đáy phải dày và đắt gấp đôi vật liệu làm thân lon (tính trên cùng 1 đơn vị diện tích).],
  (
    True([Nếu bán kính đáy là $R$ (cm) thì chiều cao của lon là $h = 330/(pi R^2)$.]),
    True([Hàm biểu diễn chi phí sản xuất (bỏ qua hệ số đơn giá) tỉ lệ với $S(R) = 4pi R^2 + 660/R$.]),
    False([Chi phí thấp nhất đạt được khi lon có chiều cao gấp đôi bán kính đáy ($h = 2R$).]),
    True([Nếu chi phí làm mặt xung quanh (thân) là $100$ VNĐ/$c m^2$, tổng chi phí vật liệu thấp nhất để làm vỏ lon (làm tròn đến hàng nghìn đồng) xấp xỉ $33.000$ VNĐ.])
  ),
  loigiai: [
    *Câu a)*
    + Thể tích hình trụ $V = pi R^2 h = 330 => h = 330/(pi R^2)$. 
    + => a) Đúng.
    
    *Câu b)*
    + Diện tích 2 mặt đáy là $2 pi R^2$. Vì vật liệu đáy đắt gấp đôi thân, ta tính tương đương diện tích là $4 pi R^2$. 
    + Diện tích xung quanh thân là $2 pi R h = 2 pi R * 330/(pi R^2) = 660/R$. 
    + Do đó hàm chi phí tỉ lệ với $S(R) = 4pi R^2 + 660/R$. 
    + => b) Đúng.
    
    *Câu c)*
    + Lấy đạo hàm: $S'(R) = 8pi R - 660/R^2 = 0 <=> 8pi R^3 = 660 <=> 4pi R^3 = 330$. 
    + Khi đó $h = 330/(pi R^2) = (4pi R^3)/(pi R^2) = 4R$. 
    + Vậy $h = 4R$ mới là kích thước tối ưu. 
    + => c) Sai.
    
    *Câu d)*
    + Từ $4pi R^3 = 330 => R = root(3, 330/(4pi)) approx 2.972$ cm. 
    + Suy ra $S("min") = 4pi * 2.972^2 + 660/2.972 approx 333.09 c m^2$. 
    + Tổng chi phí là $333.09 * 100 = 33309$ VNĐ $approx 33.000$ VNĐ. 
    + => d) Đúng.
    
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      circle((0,3), radius: (1.5, 0.4))
      arc((-1.5,0), radius: (1.5, 0.4), start: 180deg, stop: 360deg)
      arc((1.5,0), radius: (1.5, 0.4), start: 0deg, stop: 180deg, stroke: (dash: "dashed"))
      line((-1.5,0), (-1.5,3))
      line((1.5,0), (1.5,3))
      line((0,0), (1.5,0), stroke: (dash: "dashed"))
      content((0.7, 0.25), $R$)
      line((-2,0), (-2,3), mark: (start: ">", end: ">"))
      content((-2.4, 1.5), $h$)
    })]
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Một nhà nghiên cứu theo dõi dân số của một đàn ong trong một khu bảo tồn thiên nhiên. Hàm số $P(t) = (40t)/(t^2 + 16)$ mô phỏng số lượng ong (tính bằng vạn con) sau $t$ năm (với $t >= 0$). Theo mô hình này, sau bao nhiêu năm thì số lượng ong trong đàn đạt mức lớn nhất?],
  [4],
  loigiai: [
    + Đạo hàm $P'(t) = (40(t^2+16) - 40t(2t))/(t^2+16)^2 = (640 - 40t^2)/(t^2+16)^2$.
    + $P'(t) = 0 <=> t^2 = 16 => t = 4$ (vì $t >= 0$).
    + Bảng biến thiên của số lượng đàn ong:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $4$, $+oo$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $5$, $0$),
      )
    ]
    + Dựa vào BBT, số lượng ong đạt cực đại tại $t=4$ năm.
  ]
)

#tln([Một rạp chiếu phim có sức chứa tối đa 500 khán giả. Hiện tại, với giá vé là 80.000 VNĐ, trung bình mỗi suất chiếu có 300 khán giả đến xem. Theo khảo sát thị trường, cứ giảm giá vé 5.000 VNĐ thì sẽ có thêm 50 khán giả đến xem suất chiếu đó. Hỏi rạp phim nên đặt giá vé là bao nhiêu (nghìn đồng) để doanh thu từ bán vé là lớn nhất?],
  [60],
  loigiai: [
    + Giả sử rạp phim quyết định giảm giá vé $x$ lần, mỗi lần 5.000 VNĐ ($x >= 0$).
    + Giá vé mới là $80 - 5x$ (nghìn đồng).
    + Số lượng khán giả tương ứng là $300 + 50x$ (người).
    + Sức chứa tối đa của rạp là 500, nên điều kiện là: $300 + 50x <= 500 <=> 50x <= 200 <=> x <= 4$.
    + Hàm số mô tả tổng doanh thu: $R(x) = (80 - 5x)(300 + 50x)$.
    + Đạo hàm: $R'(x) = -5(300 + 50x) + 50(80 - 5x) = -1500 - 250x + 4000 - 250x = 2500 - 500x$.
    + Do $x <= 4$ nên $R'(x) >= 2500 - 2000 = 500 > 0$. Suy ra hàm $R(x)$ đồng biến trên đoạn $[0; 4]$.
    + Bảng biến thiên:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $4$),
        d-signs: ($+$,),
        v-vals: ($24000$, $30000$),
      )
    ]
    + Doanh thu lớn nhất đạt được khi $x=4$. Khi đó giá vé tối ưu là $80 - 5*4 = 60$ (nghìn đồng).
  ]
)

#tln([Cho hàm số $y = (a x + b)/(x + c)$ có đồ thị như một đường cong Hypebol, với tiệm cận đứng $x = 2$ và tiệm cận ngang $y = -1$. Đồ thị hàm số đi qua điểm $A(3; 0)$. Tính giá trị của biểu thức $S = a + b + c$.],
  [0],
  loigiai: [
    + Tiệm cận đứng $x = -c = 2 => c = -2$.
    + Tiệm cận ngang $y = a = -1 => a = -1$.
    + Đồ thị qua $A(3; 0) => (a*3 + b)/(3 + c) = 0 => 3a + b = 0 => -3 + b = 0 => b = 3$.
    + Vậy $a = -1, b = 3, c = -2$. Tính $S = a + b + c = -1 + 3 - 2 = 0$.
  ]
)

#tln([Một trạm điện đặt ở vị trí $A$ trên bờ hồ (bờ hồ được coi là đường thẳng). Người ta cần kéo một đường dây cáp điện từ trạm $A$ đến một hòn đảo $B$ nằm ngoài hồ. Biết khoảng cách từ đảo $B$ đến bờ hồ là $C H = 3$ km ($H$ là hình chiếu của $B$ trên bờ), và khoảng cách từ $A$ đến $H$ là $8$ km. Chi phí để kéo mỗi km dây cáp ngầm dưới nước đắt gấp $1,25$ lần chi phí kéo dây cáp trên bờ. Để tiết kiệm nhất, người ta kéo cáp trên bờ từ $A$ đến một điểm $D$ (nằm giữa $A, H$), rồi từ $D$ kéo cáp ngầm dưới nước thẳng đến $B$. Tính độ dài đoạn cáp trên bờ $A D$ (đơn vị: km).],
  [4],
  loigiai: [
    + Gọi $x$ (km) là khoảng cách từ hình chiếu $H$ của hòn đảo $B$ đến điểm $D$ ($0 <= x <= 8$).
    + Khoảng cách đoạn cáp ngầm $B D$ là $sqrt(C H^2 + D H^2) = sqrt(3^2 + x^2) = sqrt(x^2 + 9)$ (km).
    + Khoảng cách đoạn cáp trên bờ $A D = 8 - x$ (km).
    + Vì chi phí cáp ngầm đắt gấp 1,25 lần cáp trên bờ, tổng chi phí sẽ tỉ lệ thuận với hàm: $f(x) = 8 - x + 1.25 sqrt(x^2 + 9)$.
    + Đạo hàm: $f'(x) = -1 + 1.25 * x/sqrt(x^2+9) = 0 <=> 1.25x = sqrt(x^2+9) <=> 1.5625 x^2 = x^2 + 9 <=> 0.5625 x^2 = 9 <=> x^2 = 16 <=> x = 4$.
    + Bảng biến thiên:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $4$, $8$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($11.75$, $10.25$, $10.68$),
      )
    ]
    + Dựa vào BBT, tổng chi phí nhỏ nhất khi $x=4$. Khi đó chiều dài đoạn cáp trên bờ là $A D = 8 - 4 = 4$ km.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (8,0), stroke: (paint: gray, thickness: 2pt))
      content((4, -0.4), text(fill: gray)[Bờ hồ])
      content((0, 0.4), $A$)
      circle((0,0), radius: 0.05, fill: black)
      content((8, 0.4), $H$)
      circle((8,0), radius: 0.05, fill: black)
      content((8, 3.4), $B$)
      circle((8,3), radius: 0.05, fill: black)
      line((8,0), (8,3), stroke: (dash: "dashed"))
      content((8.4, 1.5), $3$)
      content((5, -0.4), $D$)
      circle((5,0), radius: 0.05, fill: black)
      line((0,0), (5,0), stroke: (paint: red, thickness: 2pt))
      content((2.5, 0.4), text(fill: red)[$8-x$])
      line((5,0), (8,0), stroke: (dash: "dashed"))
      content((6.5, -0.4), $x$)
      line((5,0), (8,3), stroke: (paint: blue, thickness: 2pt))
      content((5.5, 1.9), text(fill: blue)[$sqrt(x^2+9)$])
    })]
  ]
)

#tln([Chi phí tiền nhiên liệu $C$ (tính bằng nghìn đồng/giờ) của một chiếc xe tải chạy với tốc độ $v$ (km/h) ($v > 0$) được cho bởi $C(v) = 30 + v^2/120$. Quãng đường xe tải cần phải hoàn thành là 100 km. Xe tải nên duy trì tốc độ đều là bao nhiêu km/h để tổng chi phí tiền nhiên liệu cho chuyến đi là thấp nhất?],
  [60],
  loigiai: [
    + Quãng đường là 100 km, xe chạy tốc độ $v$ (km/h) thì thời gian chạy là $t = 100/v$ (giờ).
    + Tổng chi phí nhiên liệu trong cả chuyến đi là: $T(v) = C(v) * t = (30 + v^2/120) * 100/v = 3000/v + (5v)/6$.
    + Tính đạo hàm: $T'(v) = -3000/v^2 + 5/6 = 0 <=> 5v^2 = 18000 <=> v^2 = 3600 <=> v = 60$ (vì $v > 0$).
    + Bảng biến thiên:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $60$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $100$, $+oo$),
      )
    ]
    + Vậy xe nên duy trì tốc độ 60 km/h để chi phí nhỏ nhất.
  ]
)

#tln([Từ một tấm tôn hình chữ nhật có kích thước $50 "cm" times 80 "cm"$, người thợ cắt đi ở bốn góc bốn hình vuông bằng nhau có cạnh bằng $x$ (cm), rồi gập 4 mép lên để tạo thành một chiếc khay hình hộp chữ nhật không nắp. Tính giá trị của $x$ để khay có thể tích chứa được lớn nhất.],
  [10],
  loigiai: [
    + Hình hộp chữ nhật được tạo ra sẽ có chiều cao $h = x$, chiều rộng là $50 - 2x$, chiều dài là $80 - 2x$. Điều kiện: $0 < 2x < 50 <=> 0 < x < 25$.
    + Thể tích hộp: $V(x) = x(50 - 2x)(80 - 2x) = 4x^3 - 260x^2 + 4000x$.
    + Tính đạo hàm: $V'(x) = 12x^2 - 520x + 4000 = 0 <=> 3x^2 - 130x + 1000 = 0$.
    + Phương trình có hai nghiệm: $x = 10$ (nhận) và $x = 100/3 approx 33.3$ (loại vì $x < 25$).
    + Bảng biến thiên của hàm thể tích:
    #align(center)[
      #bbbt(
        x-vals: ($0$, $10$, $25$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $18000$, $0$),
      )
    ]
    + Thể tích đạt cực đại $18000 c m^3$ tại $x=10$ cm.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      rect((0,0), (8,5), stroke: black)
      rect((0,0), (1.5, 1.5), fill: gray)
      rect((6.5,0), (8, 1.5), fill: gray)
      rect((0, 3.5), (1.5, 5), fill: gray)
      rect((6.5, 3.5), (8, 5), fill: gray)
      line((1.5,0), (1.5,5), stroke: (dash: "dashed"))
      line((6.5,0), (6.5,5), stroke: (dash: "dashed"))
      line((0,1.5), (8,1.5), stroke: (dash: "dashed"))
      line((0,3.5), (8,3.5), stroke: (dash: "dashed"))
      content((4, -0.4), $80$)
      content((-0.4, 2.5), $50$)
      content((0.75, 0.75), $x$)
    })]
  ]
)
