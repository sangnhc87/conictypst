#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"


#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)

#show heading.where(level: 1): it => block(
  width: 100%,
  above: 1.8em,
  below: 1.2em,
  fill: rgb("1A5276"),
  inset: (x: 12pt, y: 8pt),
  radius: 4pt,
  text(fill: white, size: 13pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.6em,
  stroke: (bottom: 2pt + rgb("E67E22")),
  inset: (bottom: 4pt),
  text(fill: rgb("E67E22"), size: 11.5pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let fig-shadow = rgb(198, 210, 224, 70)
#let iso-point(p, dx: 0.18, dy: -0.14) = (p.at(0) + dx, p.at(1) + dy)
#let iso-points(pts, dx: 0.18, dy: -0.14) = pts.map(p => iso-point(p, dx: dx, dy: dy))
#let fig-panel(body) = block(
  fill: gradient.linear(rgb("FDFEFE"), rgb("ECF5F8"), angle: 90deg),
  stroke: 0.8pt + rgb("D4E6EC"),
  radius: 10pt,
  inset: (x: 8pt, y: 8pt),
)[
  #body
]

#align(center)[
  #block(
    fill: gradient.linear(rgb("1A5276"), rgb("117A65"), angle: 45deg),
    inset: (x: 20pt, y: 14pt),
    radius: 6pt,
    width: 100%,
  )[
    #text(fill: white, size: 17pt, weight: "bold")[SỰ TIẾP XÚC CỦA HAI ĐƯỜNG CONG]
    #v(0.3em)
    #text(fill: rgb("AED6F1"), size: 10pt, style: "italic")[
      Bộ mô hình 2D-3D: nhẫn cưới · chén thủy tinh · cổ chai · gioăng kín · turbine · nắp thể thao · tay nắm xuyến · phễu · đèn pha
    ]
  ]
]
#v(0.8em)

= I. LÝ THUYẾT NỀN TẢNG

#lythuyet[
  Hai đường cong được xem là *tiếp xúc* tại $M(x_0; y_0)$ khi:
  + Chúng cùng đi qua $M$.
  + Chúng có cùng tiếp tuyến tại $M$.

  Với hai đồ thị $y = f(x)$ và $y = g(x)$, ta thường dùng hai điều kiện:
  $f(x_0) = g(x_0)$ và $f'(x_0) = g'(x_0)$.

  Nếu một trong hai đường là *đường tròn* thì cách làm nhanh, chắc tay là:
  + Chốt điểm ghép $N$.
  + Tính tiếp tuyến hoặc pháp tuyến của đường còn lại tại $N$.
  + Dùng tính chất bán kính vuông góc với tiếp tuyến để suy ra tâm.
]

#ppgiai(title: [Khung trình bày sư phạm])[
  + *Bước 1:* xác định đúng điểm ghép trơn hoặc điểm tiếp xúc.
  + *Bước 2:* viết điều kiện đồng điểm, rồi viết điều kiện đồng tiếp tuyến.
  + *Bước 3:* sau khi có tham số hình học mới chuyển sang tích phân hoặc diện tích.
  + *Bước 4:* kết luận bằng một đáp án số ngắn để tiện tô phiếu.
]

#ppgiai(title: [Công thức dùng nhiều nhất])[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 16pt,
    [*Quay quanh $O x$:* $V = pi integral_a^b [f(x)]^2 dif x$],
    [*Quay quanh $O y$:* $V = pi integral_c^d [x(y)]^2 dif y$],
  )
  Nếu miền phẳng được kẹp giữa hai đồ thị theo biến $x$ thì:
  $S = integral_a^b (f(x) - g(x)) dif x$ với $f(x) >= g(x)$.
]

= II. CÁC MÔ HÌNH THỰC TẾ

== Bài 1. Vòng Nhẫn Cưới - Mép Bo Tròn Ghép Với Parabol

#tln(
  [Nửa phải của rãnh một chiếc *nhẫn cưới* được tạo bởi hai nét ghép trơn:
    - Cung parabol $y = x^2 - 1$ từ $V(0; -1)$ đến $N(1; 0)$.
    - Một cung tròn ghép trơn với parabol tại $N$, có tâm nằm trên trục $O y$.

    Hãy tìm tâm $I$, bán kính $R$ của cung tròn. Sau đó tính thể tích khối tạo bởi miền giới hạn bởi cung parabol, trục $O y$ và đường thẳng $y = 0$ khi quay quanh $O y$.
  ],
  [1.57],
  fig: fig-panel(cetz.canvas(length: 0.95cm, {
    import cetz.draw: *

    let par = ()
    for i in range(21) {
      let x = i * 1.0 / 20.0
      let y = x * x - 1.0
      par.push((x, y))
    }

    let fill-pts = ((0.0, -1.0),)
    for p in par { fill-pts.push(p) }
    fill-pts.push((0.0, 0.0))

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 35), stroke: none)
    line(..fill-pts, close: true, fill: rgb(241, 196, 15, 90), stroke: none)
    line(..iso-points(par), stroke: 2.2pt + fig-shadow)
    line(..par, stroke: 1.4pt + rgb("1A5276"))
    circle(iso-point((0.0, 0.5)), radius: calc.sqrt(5.0) / 2.0, stroke: 1.6pt + fig-shadow)
    circle((0.0, 0.5), radius: calc.sqrt(5.0) / 2.0, stroke: 1pt + rgb("C0392B"))

    line((-0.3, 0.0), (1.5, 0.0), mark: (end: ">"), stroke: 0.6pt)
    line((0.0, -1.3), (0.0, 1.8), mark: (end: ">"), stroke: 0.6pt)
    content((1.45, -0.2), $x$)
    content((-0.2, 1.8), $y$)

    circle((1.0, 0.0), radius: 1.4pt, fill: rgb("C0392B"))
    circle((0.0, 0.5), radius: 1.4pt, fill: black)
    content((1.12, 0.14), text(size: 8pt)[$N$])
    content((-0.28, 0.68), text(size: 8pt)[$I$])
    content((0.55, -0.68), text(size: 8pt, fill: rgb("1A5276"))[$y = x^2 - 1$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm tâm cung tròn.*

      Parabol có đạo hàm $y' = 2x$. Tại $N(1; 0)$, hệ số góc tiếp tuyến là $2$, nên pháp tuyến có hệ số góc $-frac(1, 2)$.

      Pháp tuyến qua $N$ có phương trình:
      $y = -frac(1, 2)(x - 1).$

      Tâm cung tròn nằm trên trục $O y$, nên thay $x = 0$ ta được:
      $I(0; frac(1, 2)).$
    ]
    #step[
      *Tính bán kính và lập tích phân thể tích.*

      $R = I N = sqrt(1^2 + (frac(1, 2))^2) = frac(sqrt(5), 2).$

      Với miền quay quanh $O y$, ta đổi theo biến $y$:
      $y = x^2 - 1 => x^2 = y + 1,$
      với $-1 <= y <= 0$.

      Do đó:
      $V = pi integral_(-1)^0 (y + 1) dif y.$
    ]
    #step[
      *Tính ra đáp số.*

      $V = pi (frac(y^2, 2) + y)|_(-1)^0 = frac(pi, 2) approx 1.57.$

      #nhanxet[Đáp số tô phiếu: *1.57*. Bài này phải tách rõ hai việc: ghép trơn để tìm tâm, rồi mới chuyển sang tích phân tròn xoay.]
    ]
  ],
)

== Bài 2. Chén Thủy Tinh - Viên Bi Cầu Tựa Thành Parabol

#tln(
  [Mặt trong của một *cái chén thủy tinh* là parabol tròn xoay $y = x^2$ (đơn vị cm). Một viên bi cầu bán kính $r$ được thả vào chén, tâm bi là $I(0; H)$ và bi tiếp xúc với thành chén theo một vòng tròn.

    Hãy chứng minh $r^2 = H - frac(1, 4)$. Sau đó, với $r = frac(sqrt(3), 2)$ cm, tính thể tích chất lỏng có thể đổ vào chén khi mực nước ngang đúng qua tâm bi.
  ],
  [0.21],
  fig: fig-panel(cetz.canvas(length: 0.95cm, {
    import cetz.draw: *

    let bowl = ()
    for i in range(-28, 29) {
      let x = i * 0.12
      let y = x * x
      if y <= 6.2 { bowl.push((x, y)) }
    }
    line(..iso-points(bowl), stroke: 2.2pt + fig-shadow)
    line(..bowl, stroke: 1.4pt + rgb("117A65"))

    let r = calc.sqrt(3.0) / 2.0
    let h = 1.0
    circle(iso-point((0.0, h)), radius: r, fill: rgb(160, 174, 192, 28), stroke: none)
    circle((0.0, h), radius: r, stroke: 1.1pt + rgb("C0392B"), fill: rgb(192, 57, 43, 60))
    line((-2.05, h - 0.12), (2.35, h - 0.12), stroke: (dash: "dashed", paint: rgb(189, 195, 199), thickness: 0.9pt))
    line((-2.2, h), (2.2, h), stroke: (dash: "dashed", paint: rgb("2980B9"), thickness: 0.9pt))

    line((-2.8, 0.0), (2.8, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -0.2), (0.0, 6.5), mark: (end: ">"), stroke: 0.6pt)
    content((2.65, -0.2), $x$)
    content((-0.2, 6.5), $y$)

    circle((0.0, h), radius: 1.4pt, fill: black)
    content((0.18, h + 0.12), text(size: 8pt)[$I$])
    content((1.55, h + 0.2), text(size: 8pt, fill: rgb("2980B9"))[mực nước])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Thiết lập điều kiện tiếp xúc.*

      Gọi $N(x_0; x_0^2)$ là điểm tiếp xúc trên parabol. Vì $y = x^2$ nên $y' = 2x$, do đó pháp tuyến tại $N$ có hệ số góc $-frac(1, 2x_0)$.

      Đường thẳng $I N$ cũng là pháp tuyến, nên:
      $frac(H - x_0^2, 0 - x_0) = -frac(1, 2x_0) => H = x_0^2 + frac(1, 2).$
    ]
    #step[
      *Rút ra hệ thức giữa $r$ và $H$.*

      $r^2 = I N^2 = x_0^2 + (H - x_0^2)^2 = x_0^2 + frac(1, 4).$

      Thay $x_0^2 = H - frac(1, 2)$, ta được:
      $r^2 = H - frac(1, 4).$
    ]
    #step[
      *Thế số để tính thể tích chất lỏng.*

      Với $r = frac(sqrt(3), 2)$ thì $r^2 = frac(3, 4)$, nên:
      $H = r^2 + frac(1, 4) = 1.$

      Thể tích phần chén đến cao độ $y = 1$ là:
      $V_"chén" = pi integral_0^1 y dif y = frac(pi, 2).$

      Mực nước đi qua tâm bi nên phần bi chìm đúng là *nửa dưới* của hình cầu:
      $V_"bi" = frac(2pi r^3, 3) = frac(2pi (frac(sqrt(3), 2))^3, 3) = frac(pi sqrt(3), 4).$

      Vậy:
      $V_"lỏng" = frac(pi, 2) - frac(pi sqrt(3), 4) approx 0.21.$

      #nhanxet[Đáp số tô phiếu: *0.21*. Trọng tâm sư phạm là nhận ra mực nước qua tâm bi thì phần bi chiếm chỗ đúng bằng *nửa khối cầu*.]
    ]
  ],
)

== Bài 3. Cổ Chai Thể Thao - Elip Ghép Trơn Với Parabol
#tln(
  id: "2D4N3-3",
  [Một công ty chuyên sản xuất dụng cụ thể thao đang thiết kế một mẫu bình chứa nước nguyên khối. Khi đặt bình trong hệ trục tọa độ $O x y$, mặt cắt dọc của bình được tạo thành bởi hai đường cong ghép trơn tru với nhau:
    - Phần thân dưới (ứng với $1 <= y <= 2$) có biên dạng là một cung elip mang phương trình $x^2/4 + (y - 2)^2 = 1$.
    - Phần cổ và miệng bình (ứng với $2 <= y <= 5$) có biên dạng là một cung parabol $x = a(y - b)^2 + c$. Biết miệng bình vuốt nhọn nằm trên trục tung tại điểm $P(0; 5)$ và cung parabol ghép trơn với cung elip tại điểm chuyển tiếp $N$ có tung độ $y_N = 2$.

    Không gian chứa nước bên trong bình chính là phần thể tích khối tròn xoay sinh ra khi quay hình phẳng giới hạn bởi trục $O y$ và biên dạng mặt cắt ngoài nói trên (với $1 <= y <= 5$) xung quanh trục $O y$. Hãy xác định tọa độ điểm $N$, tìm phương trình parabol và tính dung tích chứa nước của bình (đơn vị thể tích, làm tròn kết quả đến hàng phần mười).],
  [$28,5$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *

    // Tính toán tọa độ biên dạng
    let ell_r = ()
    let ell_l = ()
    for i in range(31) {
      let y = 1.0 + i * 1.0 / 30.0
      let val = 1.0 - (y - 2.0) * (y - 2.0)
      let x = 2.0 * calc.sqrt(calc.max(0.0, val))
      ell_r.push((x, y))
      ell_l.push((-x, y))
    }

    let para_r = ()
    let para_l = ()
    for i in range(31) {
      let y = 2.0 + i * 3.0 / 30.0
      let x = -2.0 / 9.0 * (y - 2.0) * (y - 2.0) + 2.0
      para_r.push((x, y))
      para_l.push((-x, y))
    }

    // Đổ màu khối xoay mô phỏng 3D
    let outline_r = ell_r + para_r
    let outline_l = ell_l + para_l
    let solid_pts = outline_r + outline_l.rev()
    line(..solid_pts, close: true, fill: rgb("e3f2fd"), stroke: none)

    // Hiệu ứng các lát cắt hình nón (ellipses ngang)
    // Lát cắt tại N (y = 2, bán kính = 2)
    arc((0, 2), start: 0deg, stop: -180deg, radius: (2, 0.4), stroke: 0.8pt + rgb("1565c0"))
    arc((0, 2), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (
      dash: "dashed",
      paint: rgb("1565c0"),
      thickness: 0.8pt,
    ))

    // Lát cắt tại phần cổ (y = 3.5, bán kính = 1.5)
    arc((0, 3.5), start: 0deg, stop: -180deg, radius: (1.5, 0.3), stroke: 0.6pt + rgb("42a5f5"))
    arc((0, 3.5), start: 180deg, stop: 360deg, radius: (1.5, 0.3), stroke: (
      dash: "dashed",
      paint: rgb("42a5f5"),
      thickness: 0.6pt,
    ))

    // Lát cắt tại phần thân dưới (y = 1.5, bán kính = 2*sqrt(0.75) ~ 1.732)
    let r_15 = 2.0 * calc.sqrt(0.75)
    arc((0, 1.5), start: 0deg, stop: -180deg, radius: (r_15, 0.35), stroke: 0.6pt + rgb("42a5f5"))
    arc((0, 1.5), start: 180deg, stop: 360deg, radius: (r_15, 0.35), stroke: (
      dash: "dashed",
      paint: rgb("42a5f5"),
      thickness: 0.6pt,
    ))

    // Đường viền biên dạng
    line(..ell_r, stroke: 1.5pt + rgb("0d47a1"))
    line(..ell_l, stroke: 1.5pt + rgb("0d47a1"))
    line(..para_r, stroke: 1.5pt + rgb("0d47a1"))
    line(..para_l, stroke: 1.5pt + rgb("0d47a1"))

    // Hệ trục tọa độ O x y
    line((-3.2, 0), (3.5, 0), mark: (end: ">"), stroke: 0.8pt + luma(80))
    content((3.3, -0.3), $x$, fill: luma(80), size: 10pt)
    line((0, 0), (0, 5.8), mark: (end: ">"), stroke: 0.8pt + luma(80))
    content((-0.3, 5.6), $y$, fill: luma(80), size: 10pt)
    content((-0.3, -0.3), $O$, fill: luma(80), size: 10pt)

    // Điểm chú thích
    circle((2, 2), radius: 1.5pt, fill: rgb("b71c1c"))
    content((2.5, 2.1), text(fill: rgb("b71c1c"), size: 10pt)[$N$])
    circle((0, 5), radius: 1.5pt, fill: rgb("b71c1c"))
    content((-0.5, 5.2), text(fill: rgb("b71c1c"), size: 10pt)[$P$])

    // Ký hiệu xoay quanh O y
    arc((0, 5.4), start: -150deg, stop: 30deg, radius: (0.4, 0.15), mark: (end: ">"), stroke: 0.8pt + rgb("d32f2f"))
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Từ phương trình elip ban đầu, rút ra hàm $x = f(y)$ tương ứng với nhánh bên phải trục $O y$. Tính tọa độ điểm chuyển tiếp $N$ và đạo hàm của hàm elip tại đó.
      - Sử dụng điều kiện *ghép trơn* (hai đường cong chung điểm và chung đạo hàm bậc nhất) tại $N$ cùng tọa độ đỉnh $P$ để xác định phương trình parabol $x = g(y)$.
      - Tính thể tích khối tròn xoay theo công thức $V = pi integral_a^b [f(y)]^2 dif y$, chia làm 2 giai đoạn: phần elip và phần parabol.
    ]

    *Bước 1: Khảo sát nhánh elip và điểm ghép $N$.* \
    Từ phương trình elip $x^2/4 + (y - 2)^2 = 1$, ta xét phần $x >= 0$:
    $ x = f(y) = 2 sqrt(1 - (y - 2)^2). $
    Tại điểm $N$ có $y_N = 2$, hoành độ là $x_N = 2 sqrt(1 - 0) = 2$. Vậy $N(2; 2)$. \
    Đạo hàm của $f(y)$ theo $y$:
    $ x'(y) = f'(y) = 2 dot (-2(y - 2)) / (2 sqrt(1 - (y - 2)^2)) = (-2(y - 2)) / sqrt(1 - (y - 2)^2). $
    Tại $y = 2$, $f'(2) = 0$.

    *Bước 2: Xác định phương trình parabol.* \
    Xét parabol $x = g(y) = a(y - b)^2 + c$. Đạo hàm $g'(y) = 2a(y - b)$. \
    Để ghép trơn tại $N(2; 2)$, ta cần:
    - $g'(2) = f'(2) <=> 2a(2 - b) = 0 => b = 2$ (do biên dạng cong nên $a != 0$).
    - $g(2) = 2 <=> a(2 - 2)^2 + c = 2 => c = 2$.

    Phương trình parabol lúc này là $x = a(y - 2)^2 + 2$. \
    Do parabol đi qua đỉnh miệng bình $P(0; 5)$ nên:
    $ 0 = a(5 - 2)^2 + 2 <=> 9a = -2 <=> a = -2/9. $
    Vậy parabol có phương trình: $x = -2/9(y - 2)^2 + 2$.

    *Bước 3: Tính thể tích tổng.* \
    - Phần thân (sinh bởi elip từ $y=1$ đến $y=2$):
      $
        V_1 & = pi integral_1^2 [2 sqrt(1 - (y - 2)^2)]^2 dif y = 4pi integral_1^2 (1 - (y - 2)^2) dif y \
            & = 4pi (y - (y - 2)^3/3) |_1^2 = 4pi (2 - (1 + 1/3)) = (8pi)/3.
      $
    - Phần cổ (sinh bởi parabol từ $y=2$ đến $y=5$):
      Đặt $t = y - 2$, cận từ $0$ đến $3$:
      $
        V_2 & = pi integral_2^5 [-2/9(y - 2)^2 + 2]^2 dif y = pi integral_0^3 (-2/9 t^2 + 2)^2 dif t \
            & = pi integral_0^3 (4/81 t^4 - 8/9 t^2 + 4) dif t = pi (4/405 t^5 - 8/27 t^3 + 4t) |_0^3 \
            & = pi (2,4 - 8 + 12) = 6,4 pi = (32pi)/5.
      $

    Thể tích của toàn bộ bình:
    $ V = V_1 + V_2 = (8pi)/3 + (32pi)/5 = (136pi)/15 approx 28,4839... $
    Làm tròn kết quả đến hàng phần mười, ta được *$28,5$*.

    #luuy[Phải cẩn thận với khái niệm "đạo hàm" tại điểm ghép trơn. Trong mặt phẳng $O x y$, do trục quay là trục tung nên hàm số được viết dưới dạng hàm $x$ theo biến $y$ ($x = f(y)$) sẽ thuận tiện hơn rất nhiều để áp dụng công thức $V_y = pi integral x^2 dif y$ cũng như xét tính trơn ($x'_y$).]
  ],
)

#tln(
  id: "2D4N3-5",
  [Một công ty chuyên sản xuất đồ dùng dã ngoại đang phát triển một mẫu *bình nước thể thao* nguyên khối. Để tối ưu hóa đặc tính khí động học và thẩm mỹ, các kỹ sư đã thiết kế bình sao cho khi đặt trong hệ trục tọa độ $O x y$ (đơn vị: dm), mặt cắt dọc của bình là một miền phẳng giới hạn bởi trục tung và một đường cong ghép trơn tru từ hai phần:
    - Phần thân dưới (ứng với $1 <= y <= 2$) có biên dạng là một cung elip với phương trình $x^2/4 + (y - 2)^2 = 1$ nằm bên phải trục $O y$.
    - Phần cổ và miệng bình (ứng với $2 <= y <= 5$) có biên dạng là một cung parabol $x = a(y - b)^2 + c$. Biên dạng này đi qua đỉnh nhọn của miệng bình trên trục tung tại $P(0; 5)$ và ghép trơn với cung elip tại điểm chuyển tiếp $N$ có tung độ $y_N = 2$.

    Không gian chứa nước của bình chính là phần thể tích khối tròn xoay được sinh ra khi quay miền phẳng trên quanh trục $O y$. Hãy xác định tọa độ điểm ghép $N$, tìm phương trình parabol và tính dung tích chứa nước tối đa của bình (đơn vị: lít, làm tròn kết quả đến hàng phần mười). Biết $1 " dm"^3 = 1$ lít.],
  [$28,5$],
  fig: cetz.canvas(length: 0.7cm, {
    import cetz.draw: *

    // Tính toán biên dạng Elip (y từ 1 đến 2)
    let ell_r = ()
    for i in range(31) {
      let y = 1.0 + i * 1.0 / 30.0
      let val = 1.0 - (y - 2.0) * (y - 2.0)
      let x = 2.0 * calc.sqrt(calc.max(0.0, val))
      ell_r.push((x, y))
    }

    // Tính toán biên dạng Parabol (y từ 2 đến 5)
    let para_r = ()
    for i in range(31) {
      let y = 2.0 + i * 3.0 / 30.0
      let x = -2.0 / 9.0 * (y - 2.0) * (y - 2.0) + 2.0
      para_r.push((x, y))
    }

    // --- HÌNH 1: MẶT CẮT 2D ---
    group(name: "2d", {
      // Đổ màu vùng phẳng
      let region = ((0, 1),) + ell_r + para_r + ((0, 5),)
      line(..region, close: true, fill: rgb("e3f2fd"), stroke: none)

      // Hệ trục tọa độ O x y
      line((-1, 0), (4, 0), mark: (end: ">"), stroke: 0.8pt + luma(80))
      content((3.8, -0.4), $x$, fill: luma(80), size: 10pt)
      line((0, -0.5), (0, 6.5), mark: (end: ">"), stroke: 0.8pt + luma(80))
      content((-0.4, 6.3), $y$, fill: luma(80), size: 10pt)
      content((-0.4, -0.4), $O$, fill: luma(80), size: 10pt)

      // Vẽ đường biên
      line(..ell_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_r, stroke: 1.5pt + rgb("0d47a1"))

      // Điểm đặc biệt
      circle((2, 2), radius: 1.5pt, fill: rgb("b71c1c"))
      content((2.5, 2.1), text(fill: rgb("b71c1c"), size: 10pt)[$N$])
      circle((0, 5), radius: 1.5pt, fill: rgb("b71c1c"))
      content((-0.5, 5.2), text(fill: rgb("b71c1c"), size: 10pt)[$P$])

      content((1.5, -1.2), text(weight: "bold")[Mặt cắt phẳng $2 D$])
    })

    // --- HÌNH 2: KHỐI TRÒN XOAY 3D ---
    group(name: "3d", {
      set-origin((8, 0)) // Dịch sang phải 8 đơn vị

      let ell_l = ell_r.map(p => (-p.at(0), p.at(1)))
      let para_l = para_r.map(p => (-p.at(0), p.at(1)))

      // Đổ màu khối xoay
      let solid_pts = ell_r + para_r + para_l.rev() + ell_l.rev()
      line(..solid_pts, close: true, fill: rgb("e3f2fd"), stroke: none)

      // Các lát cắt (ellipses ngang) tạo hiệu ứng 3D
      arc((0, 2), start: 0deg, stop: -180deg, radius: (2, 0.4), stroke: 0.8pt + rgb("1565c0"))
      arc((0, 2), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (
        dash: "dashed",
        paint: rgb("1565c0"),
        thickness: 0.8pt,
      ))

      let r_15 = 2.0 * calc.sqrt(0.75)
      arc((0, 1.5), start: 0deg, stop: -180deg, radius: (r_15, 0.35), stroke: 0.6pt + rgb("42a5f5"))
      arc((0, 1.5), start: 180deg, stop: 360deg, radius: (r_15, 0.35), stroke: (
        dash: "dashed",
        paint: rgb("42a5f5"),
        thickness: 0.6pt,
      ))

      arc((0, 3.5), start: 0deg, stop: -180deg, radius: (1.5, 0.3), stroke: 0.6pt + rgb("42a5f5"))
      arc((0, 3.5), start: 180deg, stop: 360deg, radius: (1.5, 0.3), stroke: (
        dash: "dashed",
        paint: rgb("42a5f5"),
        thickness: 0.6pt,
      ))

      // Biên dạng 2 bên
      line(..ell_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..ell_l, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_r, stroke: 1.5pt + rgb("0d47a1"))
      line(..para_l, stroke: 1.5pt + rgb("0d47a1"))

      // Trục quay
      line((0, 0), (0, 6.5), stroke: (dash: "dash-dotted", paint: luma(100)))
      arc((0, 6.0), start: -150deg, stop: 30deg, radius: (0.5, 0.2), mark: (end: ">"), stroke: 1pt + rgb("d32f2f"))

      content((0, -1.2), text(weight: "bold")[Khối tròn xoay $3 D$])
    })
  }),
  fig-pos: "center",
  fig-width: 80%,
  loigiai: [
    #ppgiai[
      - Từ phương trình elip, rút ra hàm số $x = f(y)$ tương ứng với nhánh bên phải trục $O y$. Tìm tọa độ điểm chuyển tiếp $N$ và đạo hàm bậc nhất của $f(y)$ tại đó.
      - Thiết lập điều kiện *ghép trơn*: Hai đường cong tại điểm $N$ phải có cùng tọa độ và cùng đạo hàm bậc nhất theo biến $y$ ($x'_1 = x'_2$). Kết hợp với điểm đỉnh $P$ để xác định phương trình parabol $x = g(y)$.
      - Tính thể tích khối tròn xoay quanh trục tung $O y$ theo công thức $V = pi integral_a^b x^2 dif y$. Chia tích phân làm 2 đoạn tương ứng với elip và parabol.
    ]

    *Bước 1: Khảo sát nhánh elip và điểm ghép $N$.* \
    Từ phương trình elip $x^2/4 + (y - 2)^2 = 1$, ta lấy phần nhánh phải $x >= 0$:
    $ x = f(y) = 2 sqrt(1 - (y - 2)^2). $
    Tại điểm chuyển tiếp $N$ có $y_N = 2$, hoành độ của điểm đó là $x_N = 2 sqrt(1 - 0) = 2$. Suy ra tọa độ điểm nối là $N(2; 2)$. \
    Đạo hàm của $x$ theo biến $y$:
    $ f'(y) = 2 dot (-2(y - 2)) / (2 sqrt(1 - (y - 2)^2)) = (-2(y - 2)) / sqrt(1 - (y - 2)^2). $
    Tại $y = 2$, đạo hàm $f'(2) = 0$.

    *Bước 2: Xác định phương trình parabol.* \
    Xét đường parabol $x = g(y) = a(y - b)^2 + c$. Đạo hàm theo $y$ là $g'(y) = 2a(y - b)$. \
    Để ghép trơn tại điểm $N(2; 2)$, ta có hệ điều kiện:
    - Tiếp tuyến chung: $g'(2) = f'(2) <=> 2a(2 - b) = 0$. Do parabol là đường cong nên $a != 0$, suy ra $b = 2$.
    - Chung điểm đi qua: $g(2) = 2 <=> a(2 - 2)^2 + c = 2 <=> c = 2$.

    Vậy parabol có dạng $x = a(y - 2)^2 + 2$. \
    Lại có parabol đi qua điểm $P(0; 5)$ (miệng bình nằm trên trục tung):
    $ 0 = a(5 - 2)^2 + 2 <=> 9a = -2 <=> a = -2/9. $
    Phương trình parabol là: $x = -2/9(y - 2)^2 + 2$.

    *Bước 3: Tính thể tích của bình nước.* \
    Thể tích khối tròn xoay được tính bằng tổng thể tích phần đáy và phần cổ bình: $V = V_1 + V_2$.

    Thể tích phần đáy (sinh bởi nửa elip từ $y=1$ đến $y=2$):
    $
      V_1 & = pi integral_1^2 [2 sqrt(1 - (y - 2)^2)]^2 dif y = 4pi integral_1^2 (1 - (y - 2)^2) dif y \
          & = 4pi (y - (y - 2)^3/3) |_1^2 = 4pi (2 - (1 + 1/3)) = (8pi)/3.
    $

    Thể tích phần cổ bình (sinh bởi parabol từ $y=2$ đến $y=5$): \
    Đặt $t = y - 2$, với $y in [2; 5]$ thì $t in [0; 3]$, ta có:
    $
      V_2 & = pi integral_2^5 [-2/9(y - 2)^2 + 2]^2 dif y = pi integral_0^3 (-2/9 t^2 + 2)^2 dif t \
          & = pi integral_0^3 (4/81 t^4 - 8/9 t^2 + 4) dif t = pi (4/405 t^5 - 8/27 t^3 + 4t)|_0^3 \
          & = pi (4/405 dot 243 - 8/27 dot 27 + 12) = pi (2,4 - 8 + 12) = 6,4 pi = (32pi)/5.
    $

    Dung tích chứa nước tối đa của chiếc bình là:
    $ V = V_1 + V_2 = (8pi)/3 + (32pi)/5 = (136pi)/15 approx 28,4839... (d m^3). $

    Làm tròn kết quả đến hàng phần mười, ta thu được dung tích của bình là *$28,5$* lít.

    #luuy[Việc đạo hàm $x'_y$ (coi $y$ là biến số) giúp bài toán ghép trơn trở nên đơn giản hóa hơn rất nhiều so với việc để $y = f(x)$. Khái niệm "ghép trơn" (smooth joint) thường xuyên xuất hiện trong các bài toán thực tế của tích phân để đánh giá tư duy liên kết kiến thức giải tích của học sinh.]
  ],
)

#tln(
  [Mặt cắt một *chai thể thao* gồm hai phần ghép trơn khi quay quanh trục $O y$:
    - Thân dưới là nửa elip $frac(x^2, 4) + (y - 2)^2 = 1$ với $1 <= y <= 2$.
    - Cổ chai là parabol $x = a(y - b)^2 + c$, đi qua đỉnh miệng $P(0; 5)$ và ghép trơn với elip tại $N$ có tung độ $2$.

    Hãy tìm $N$, xác định $a, b, c$, rồi tính thể tích khối tròn xoay từ $y = 1$ đến $y = 5$.
  ],
  [28.5],
  fig: fig-panel(cetz.canvas(length: 0.9cm, {
    import cetz.draw: *

    let ell = ()
    for i in range(31) {
      let y = 1.0 + i * 1.0 / 30.0
      let x = 2.0 * calc.sqrt(calc.max(0.0, 1.0 - (y - 2.0) * (y - 2.0)))
      ell.push((x, y))
    }

    let para = ()
    for i in range(31) {
      let y = 2.0 + i * 3.0 / 30.0
      let x = -2.0 / 9.0 * (y - 2.0) * (y - 2.0) + 2.0
      para.push((x, y))
    }

    let fill-pts = ((0.0, 1.0),)
    for p in ell { fill-pts.push(p) }
    for p in para { fill-pts.push(p) }
    fill-pts.push((0.0, 5.0))

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 30), stroke: none)
    line(..fill-pts, close: true, fill: rgb(46, 204, 113, 80), stroke: none)
    line(..iso-points(ell), stroke: 2.1pt + fig-shadow)
    line(..iso-points(para), stroke: 2.1pt + fig-shadow)
    line(..ell, stroke: 1.4pt + rgb("117A65"))
    line(..para, stroke: 1.4pt + rgb("1A5276"))

    line((-0.2, 0.0), (2.9, 0.0), mark: (end: ">"), stroke: 0.6pt)
    line((0.0, 0.6), (0.0, 5.7), mark: (end: ">"), stroke: 0.6pt)
    content((2.85, -0.2), $x$)
    content((-0.2, 5.7), $y$)

    circle((2.0, 2.0), radius: 1.4pt, fill: rgb("C0392B"))
    circle((0.0, 5.0), radius: 1.4pt, fill: rgb("8E44AD"))
    content((2.15, 2.15), text(size: 8pt)[$N$])
    content((-0.35, 5.15), text(size: 8pt)[$P$])
  })),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm điểm ghép $N$.*

      Trên elip ta có:
      $x = 2sqrt(1 - (y - 2)^2).$

      Vì $y_N = 2$ nên:
      $x_N = 2sqrt(1 - 0) = 2.$

      Vậy $N(2; 2)$.
    ]
    #step[
      *Xác định parabol.*

      Đặt $x = a(y - b)^2 + c$.

      Điều kiện ghép trơn tại $N$ cho ta đạo hàm theo $y$ bằng $0$, nên:
      $2a(2 - b) = 0 => b = 2.$

      Thế $N(2; 2)$ vào parabol, được $c = 2$.

      Thế điểm $P(0; 5)$, ta có:
      $0 = a(5 - 2)^2 + 2 => 9a = -2 => a = -frac(2, 9).$

      Vậy parabol là:
      $x = -frac(2, 9)(y - 2)^2 + 2.$
    ]
    #step[
      *Tính thể tích tròn xoay.*

      Với phần elip, đặt $u = y - 2$, khi đó $-1 <= u <= 0$ và:
      $x^2 = 4(1 - u^2).$

      Suy ra:
      $V_"elip" = pi integral_(-1)^0 4(1 - u^2) dif u = frac(8pi, 3).$

      Với phần parabol, đặt $t = y - 2$, $0 <= t <= 3$:
      $x = -frac(2, 9)t^2 + 2,$
      nên
      $V_"para" = pi integral_0^3 (frac(4t^4, 81) - frac(8t^2, 9) + 4) dif t = 6.4 pi.$

      Do đó:
      $V = frac(8pi, 3) + 6.4 pi = frac(136pi, 15) approx 28.5.$

      #nhanxet[Đáp số tô phiếu: *28.5*. Bài này nên trình bày theo đúng thứ tự: chốt $N$, tìm parabol, rồi chia thể tích thành hai đoạn tích phân.]
    ]
  ],
)

== Bài 4. Gioăng Silicon - Khe Đệm Giữa Parabol Và Cung Tròn

#tln(
  [Mặt cắt một *gioăng silicon chống rò* gồm hai mép cong:
    - Mép trên là parabol $y = x^2 + 1$.
    - Mép dưới là cung tròn dưới của đường tròn $x^2 + (y - 2)^2 = 1$.

    Hai mép chạm nhau tại $N(0; 1)$. Hãy kiểm tra điều đó bằng điều kiện tiếp tuyến, rồi tính diện tích khe đệm giữa hai mép trong đoạn $-1 <= x <= 1$.
  ],
  [0.24],
  fig: fig-panel(cetz.canvas(length: 1.0cm, {
    import cetz.draw: *

    let upper = ()
    let lower = ()
    for i in range(-20, 21) {
      let x = i * 1.0 / 20.0
      upper.push((x, x * x + 1.0))
      lower.push((x, 2.0 - calc.sqrt(calc.max(0.0, 1.0 - x * x))))
    }

    let fill-pts = ()
    for p in lower { fill-pts.push(p) }
    for p in upper.rev() { fill-pts.push(p) }

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 32), stroke: none)
    line(..fill-pts, close: true, fill: rgb(245, 176, 65, 90), stroke: none)
    line(..iso-points(upper), stroke: 2.1pt + fig-shadow)
    line(..iso-points(lower), stroke: 2.1pt + fig-shadow)
    line(..upper, stroke: 1.4pt + rgb("1A5276"))
    line(..lower, stroke: 1.4pt + rgb("C0392B"))

    line((-1.3, 0.0), (1.3, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, 0.0), (0.0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((1.2, -0.18), $x$)
    content((-0.2, 2.5), $y$)

    circle((0.0, 1.0), radius: 1.4pt, fill: black)
    content((0.14, 1.14), text(size: 8pt)[$N$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Kiểm tra điểm tiếp xúc.*

      Với parabol, tại $x = 0$ ta có $y = 1$, nên $N(0; 1)$ nằm trên mép trên.

      Với đường tròn, thay $x = 0$, $y = 1$ vào $x^2 + (y - 2)^2 = 1$ cũng đúng. Vậy hai đường cùng đi qua $N$.
    ]
    #step[
      *Kiểm tra tiếp tuyến tại $N$.*

      Parabol có đạo hàm $y' = 2x$, nên tại $x = 0$ thì $y' = 0$.

      Với đường tròn:
      $2x + 2(y - 2)y' = 0 => y' = -frac(x, y - 2).$

      Tại $N(0; 1)$, ta cũng được $y' = 0$.

      Vậy hai mép *tiếp xúc* tại $N$.
    ]
    #step[
      *Tính diện tích khe đệm.*

      Cung tròn dưới có phương trình:
      $y = 2 - sqrt(1 - x^2).$

      Diện tích cần tìm là:
      $S = integral_(-1)^1 ((x^2 + 1) - (2 - sqrt(1 - x^2))) dif x.$

      Rút gọn:
      $S = integral_(-1)^1 (x^2 - 1 + sqrt(1 - x^2)) dif x = -frac(4, 3) + frac(pi, 2) approx 0.24.$

      #nhanxet[Đáp số tô phiếu: *0.24*. Đây là kiểu bài rất phù hợp để luyện tư duy: chứng minh tiếp xúc trước, rồi mới tính khe hở.]
    ]
  ],
)

== Bài 5. Cánh Turbine Làm Mát - Vỏ Elip Ghép Với Nửa Đường Tròn

#tln(
  [Mặt cắt một *cánh turbine mini* được mô hình hóa bởi một đường cong kín gồm:
    - Nửa elip trên $frac(x^2, 9) + y^2 = 1$.
    - Nửa đường tròn dưới $x^2 + y^2 = 9$, lấy nhánh $y <= 0$.

    Hai cung ghép tại $A(-3; 0)$ và $B(3; 0)$. Hãy kiểm tra tính ghép trơn tại hai đầu mút, rồi tính diện tích mặt cắt của cánh.
  ],
  [18.8],
  fig: fig-panel(cetz.canvas(length: 0.8cm, {
    import cetz.draw: *

    let upper = ()
    let lower = ()
    for i in range(-30, 31) {
      let x = i * 0.1
      upper.push((x, calc.sqrt(calc.max(0.0, 1.0 - x * x / 9.0))))
      lower.push((x, -calc.sqrt(calc.max(0.0, 9.0 - x * x))))
    }

    let fill-pts = ()
    for p in upper { fill-pts.push(p) }
    for p in lower.rev() { fill-pts.push(p) }

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 30), stroke: none)
    line(..fill-pts, close: true, fill: rgb(93, 173, 226, 90), stroke: none)
    line(..iso-points(upper), stroke: 2.1pt + fig-shadow)
    line(..iso-points(lower), stroke: 2.1pt + fig-shadow)
    line(..upper, stroke: 1.4pt + rgb("1A5276"))
    line(..lower, stroke: 1.4pt + rgb("C0392B"))

    line((-3.4, 0.0), (3.4, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -3.4), (0.0, 1.4), mark: (end: ">"), stroke: 0.6pt)
    content((3.25, -0.18), $x$)
    content((-0.2, 1.4), $y$)

    circle((-3.0, 0.0), radius: 1.3pt, fill: black)
    circle((3.0, 0.0), radius: 1.3pt, fill: black)
    content((-3.25, 0.15), text(size: 8pt)[$A$])
    content((3.1, 0.15), text(size: 8pt)[$B$])
  })),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[
      *Kiểm tra hai đầu mút chung.*

      Trên elip, khi $x = plus.minus 3$ thì $y = 0$.

      Trên đường tròn $x^2 + y^2 = 9$, khi $x = plus.minus 3$ cũng cho $y = 0$.

      Vậy cả hai cung cùng đi qua $A(-3; 0)$ và $B(3; 0)$.
    ]
    #step[
      *Kiểm tra ghép trơn tại $A, B$.*

      Với elip:
      $frac(2x, 9) + 2y y' = 0 => y' = -frac(x, 9y).$

      Với đường tròn:
      $2x + 2y y' = 0 => y' = -frac(x, y).$

      Tại $A$ và $B$, ta đều có $y = 0$, nên cả hai tiếp tuyến đều *thẳng đứng*. Do đó hai cung ghép trơn ở hai đầu mút.
    ]
    #step[
      *Tính diện tích mặt cắt.*

      Nửa elip trên có diện tích:
      $S_"elip" = frac(pi a b, 2) = frac(pi dot 3 dot 1, 2) = frac(3pi, 2).$

      Nửa đường tròn dưới bán kính $3$ có diện tích:
      $S_"tròn" = frac(pi 3^2, 2) = frac(9pi, 2).$

      Vậy tổng diện tích là:
      $S = frac(3pi, 2) + frac(9pi, 2) = 6pi approx 18.8.$

      #nhanxet[Đáp số tô phiếu: *18.8*. Cách trình bày đẹp nhất ở bài này là tách rõ phần kiểm tra ghép trơn và phần cộng diện tích hai mảnh hình học chuẩn.]
    ]
  ],
)

== Bài 6. Nắp Chai Thể Thao - Đường Thẳng Tiếp Xúc Parabol

#tln(
  [Mặt cắt rỗng của *nắp chai thể thao* được tạo bởi:
    - Mép trên là đường thẳng $y = 2$.
    - Mặt dưới là parabol $y = 2 - frac(x^2, 4)$ trên đoạn $-2 <= x <= 2$.

    Hai đường tiếp xúc tại đỉnh $N(0; 2)$. Khi quay miền kẹp giữa hai đường quanh trục $O y$, ta được một khoang rỗng bên trong nắp. Hãy tính thể tích khoang rỗng đó.
  ],
  [6.28],
  fig: fig-panel(cetz.canvas(length: 0.95cm, {
    import cetz.draw: *

    let para = ()
    let cap = ((-2.0, 2.0), (2.0, 2.0))
    for i in range(-20, 21) {
      let x = i * 0.1
      para.push((x, 2.0 - x * x / 4.0))
    }

    let fill-pts = ((-2.0, 2.0), (2.0, 2.0))
    for p in para.rev() { fill-pts.push(p) }

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 32), stroke: none)
    line(..fill-pts, close: true, fill: rgb(174, 214, 241, 90), stroke: none)
    line(..iso-points(para), stroke: 2.1pt + fig-shadow)
    line(
      (cap.at(0).at(0) + 0.18, cap.at(0).at(1) - 0.14),
      (cap.at(1).at(0) + 0.18, cap.at(1).at(1) - 0.14),
      stroke: 2.1pt + fig-shadow,
    )
    line(..cap, stroke: 1.3pt + rgb("C0392B"))
    line(..para, stroke: 1.4pt + rgb("1A5276"))

    line((-2.5, 0.0), (2.5, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, 0.0), (0.0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((2.35, -0.18), $x$)
    content((-0.2, 2.5), $y$)

    circle((0.0, 2.0), radius: 1.4pt, fill: black)
    content((0.14, 2.14), text(size: 8pt)[$N$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Kiểm tra tiếp xúc tại đỉnh.*

      Parabol có đạo hàm:
      $y' = -frac(x, 2).$

      Tại $x = 0$, suy ra $y' = 0$, đúng bằng hệ số góc của đường thẳng $y = 2$.

      Vì hai đường cũng cùng đi qua $N(0; 2)$ nên chúng tiếp xúc tại đó.
    ]
    #step[
      *Đổi theo biến $y$ để tính thể tích.*

      Từ $y = 2 - frac(x^2, 4)$ suy ra:
      $x^2 = 8 - 4y.$

      Miền rỗng chạy từ $y = 1$ đến $y = 2$, nên:
      $V = pi integral_1^2 (8 - 4y) dif y.$
    ]
    #step[
      *Tính ra kết quả.*

      $V = pi (8y - 2y^2)|_1^2 = 2pi approx 6.28.$

      #nhanxet[Đáp số tô phiếu: *6.28*. Điểm đẹp của bài là sau khi kiểm tra tiếp xúc, phần thể tích chỉ còn là một tích phân rất gọn theo biến $y$.]
    ]
  ],
)

== Bài 7. Tay Nắm Cốc - Vành Xuyến Sinh Ra Từ Một Đĩa Tròn

#tln(
  [Mặt cắt của một *tay nắm cốc* là đĩa tròn $(x - 3)^2 + y^2 <= 9$. Đĩa này vừa chạm trục $O y$ tại gốc $O$, rồi được quay quanh trục $O y$ để tạo thành một vành xuyến.

    Hãy chỉ ra vì sao đĩa tròn tiếp xúc với trục $O y$, rồi tính thể tích vành xuyến thu được.
  ],
  [533],
  fig: fig-panel(cetz.canvas(length: 0.75cm, {
    import cetz.draw: *

    circle(iso-point((3.0, 0.0)), radius: 3.0, fill: rgb(189, 195, 199, 26), stroke: none)
    circle((3.0, 0.0), radius: 3.0, stroke: 1.4pt + rgb("1A5276"), fill: rgb(245, 203, 167, 80))
    circle((3.0, 0.0), radius: 2.5, stroke: 0.7pt + rgb("FDEBD0"))
    line((0.0, -3.7), (0.0, 3.7), mark: (start: "<", end: ">"), stroke: 0.8pt)
    line((-0.3, 0.0), (6.8, 0.0), mark: (end: ">"), stroke: 0.6pt)
    content((-0.2, 3.7), $y$)
    content((6.7, -0.2), $x$)

    circle((0.0, 0.0), radius: 1.4pt, fill: rgb("C0392B"))
    circle((3.0, 0.0), radius: 1.4pt, fill: black)
    content((-0.38, 0.18), text(size: 8pt)[$O$])
    content((3.16, 0.18), text(size: 8pt)[$I$])
  })),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[
      *Giải thích vì sao đĩa tròn chạm trục $O y$.*

      Tâm đĩa tròn là $I(3; 0)$ và bán kính bằng $3$.

      Khoảng cách từ tâm $I$ đến trục $O y$ đúng bằng $3$, tức bằng bán kính. Vì thế đĩa tròn tiếp xúc với trục $O y$ tại $O(0; 0)$.
    ]
    #step[
      *Áp dụng định lý Pappus.*

      Diện tích đĩa tròn là:
      $A = pi 3^2 = 9pi.$

      Tâm diện tích của đĩa chính là tâm $I$, nên khi quay quanh $O y$, nó đi được quãng đường:
      $2pi dot 3 = 6pi.$

      Do đó thể tích vành xuyến là:
      $V = A dot 6pi = 9pi dot 6pi = 54pi^2 approx 533.$

      #nhanxet[Đáp số tô phiếu: *533*. Đây là ví dụ 3D rất đẹp cho thấy tiếp xúc giữa một đường tròn và trục quay dẫn thẳng tới định lý Pappus.]
    ]
  ],
)

== Bài 8. Phễu Công Nghiệp - Quả Cầu Lớn Nhất Chạm Thành Parabol

#tln(
  [Mặt trong của một *phễu công nghiệp* là parabol tròn xoay $y = x^2$ với $0 <= y <= 9$. Một quả cầu bán kính $r$ đặt trong phễu có tâm $I(0; H)$, tiếp xúc với thành phễu và vừa chạm mép trên $y = 9$.

    Hãy chứng minh $r^2 = H - frac(1, 4)$, rồi tính bán kính lớn nhất $r$ của quả cầu.
  ],
  [2.50],
  fig: fig-panel(cetz.canvas(length: 0.7cm, {
    import cetz.draw: *

    let wall = ()
    for i in range(46) {
      let y = i * 9.0 / 45.0
      wall.push((calc.sqrt(y), y))
    }
    line(..iso-points(wall.map(p => (-p.at(0), p.at(1)))), stroke: 2.1pt + fig-shadow)
    line(..iso-points(wall), stroke: 2.1pt + fig-shadow)
    line(..wall.map(p => (-p.at(0), p.at(1))), stroke: 1.4pt + rgb("117A65"))
    line(..wall, stroke: 1.4pt + rgb("117A65"))

    circle(iso-point((0.0, 6.5)), radius: 2.5, fill: rgb(160, 174, 192, 26), stroke: none)
    circle((0.0, 6.5), radius: 2.5, stroke: 1.1pt + rgb("C0392B"), fill: rgb(192, 57, 43, 60))
    line((-3.2, 9.0), (3.2, 9.0), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))

    line((-3.4, 0.0), (3.4, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -0.2), (0.0, 9.7), mark: (end: ">"), stroke: 0.6pt)
    content((3.25, -0.18), $x$)
    content((-0.2, 9.7), $y$)

    circle((0.0, 6.5), radius: 1.4pt, fill: black)
    content((0.16, 6.68), text(size: 8pt)[$I$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Lập quan hệ hình học tại điểm tiếp xúc.*

      Gọi $N(x_0; x_0^2)$ là điểm tiếp xúc trên parabol. Vì $y = x^2$ nên pháp tuyến tại $N$ có hệ số góc $-frac(1, 2x_0)$.

      Đường thẳng $I N$ cũng là pháp tuyến, do đó:
      $frac(H - x_0^2, 0 - x_0) = -frac(1, 2x_0) => H = x_0^2 + frac(1, 2).$
    ]
    #step[
      *Rút ra công thức của bán kính.*

      $r^2 = I N^2 = x_0^2 + (H - x_0^2)^2 = x_0^2 + frac(1, 4).$

      Thay $x_0^2 = H - frac(1, 2)$, suy ra:
      $r^2 = H - frac(1, 4).$
    ]
    #step[
      *Dùng điều kiện vừa chạm mép trên.*

      Quả cầu vừa chạm đường thẳng $y = 9$ nên:
      $H + r = 9.$

      Kết hợp với $H = r^2 + frac(1, 4)$, ta có:
      $r^2 + r + frac(1, 4) = 9 => (r + frac(1, 2))^2 = 9.$

      Vì $r > 0$ nên:
      $r = 2.50.$

      #nhanxet[Đáp số tô phiếu: *2.50*. Đây là một mô hình 3D gọn, đẹp: bước khó nhất chỉ là viết đúng pháp tuyến tại điểm tiếp xúc.]
    ]
  ],
)

== Bài 9. Đèn Pha Ô Tô - Khoang Không Khí Giữa Parabol Và Cung Tròn

#tln(
  [Mặt cắt một *đèn pha ô tô* có khoang không khí được giới hạn bởi:
    - Kính bảo vệ dạng parabol $y = frac(x^2, 4)$.
    - Chóa phản xạ là cung dưới của đường tròn $x^2 + (y - 2)^2 = 4$.
    - Hai mép dựng tại $x = -2$ và $x = 2$.

    Hai mặt cong chạm nhau tại gốc $O$. Hãy kiểm tra điều đó, rồi tính diện tích khoang không khí.
  ],
  [0.38],
  fig: fig-panel(cetz.canvas(length: 0.95cm, {
    import cetz.draw: *

    let para = ()
    let circ = ()
    for i in range(-20, 21) {
      let x = i * 0.1
      para.push((x, x * x / 4.0))
      circ.push((x, 2.0 - calc.sqrt(calc.max(0.0, 4.0 - x * x))))
    }

    let fill-pts = ()
    for p in circ { fill-pts.push(p) }
    for p in para.rev() { fill-pts.push(p) }

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 32), stroke: none)
    line(..fill-pts, close: true, fill: rgb(214, 234, 248, 95), stroke: none)
    line(..iso-points(para), stroke: 2.1pt + fig-shadow)
    line(..iso-points(circ), stroke: 2.1pt + fig-shadow)
    line(..para, stroke: 1.4pt + rgb("1A5276"))
    line(..circ, stroke: 1.4pt + rgb("C0392B"))
    line((-2.0, 1.0), (-2.0, 2.1), stroke: 0.8pt + gray)
    line((2.0, 1.0), (2.0, 2.1), stroke: 0.8pt + gray)

    line((-2.4, 0.0), (2.4, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -0.1), (0.0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((2.25, -0.18), $x$)
    content((-0.2, 2.5), $y$)

    circle((0.0, 0.0), radius: 1.4pt, fill: black)
    content((0.14, 0.12), text(size: 8pt)[$O$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Kiểm tra hai mặt cong chạm nhau tại $O$.*

      Với parabol, tại $x = 0$ ta được $y = 0$.

      Với đường tròn, thay $x = 0$, $y = 0$ vào $x^2 + (y - 2)^2 = 4$ cũng đúng. Vậy hai đường cùng đi qua $O$.
    ]
    #step[
      *Kiểm tra tiếp tuyến tại $O$.*

      Parabol có đạo hàm:
      $y' = frac(x, 2),$
      nên tại $x = 0$ thì $y' = 0$.

      Với đường tròn:
      $2x + 2(y - 2)y' = 0 => y' = -frac(x, y - 2).$

      Tại $O(0; 0)$, ta cũng có $y' = 0$. Vì thế hai mặt cong tiếp xúc tại $O$.
    ]
    #step[
      *Tính diện tích khoang không khí.*

      Cung tròn dưới có phương trình:
      $y = 2 - sqrt(4 - x^2).$

      Diện tích cần tìm là:
      $S = integral_(-2)^2 (2 - sqrt(4 - x^2) - frac(x^2, 4)) dif x.$

      Dùng tính đối xứng:
      $S = 2 integral_0^2 (2 - sqrt(4 - x^2) - frac(x^2, 4)) dif x.$

      Từ đó:
      $S = 2(4 - pi - frac(2, 3)) = frac(20, 3) - 2pi approx 0.38.$

      #nhanxet[Đáp số tô phiếu: *0.38*. Khi trình bày, nên nói rõ miền còn được khép bởi hai mép dựng $x = plus.minus 2$, như vậy hình giới hạn mới kín.]
    ]
  ],
)


== Bài 10. Kỷ Niệm Chương Pha Lê - Parabol Ghép Trơn Hyperbol

#tln(
  [Một doanh nghiệp sản xuất cúp pha lê thiết kế một *kỷ niệm chương nguyên khối* có dạng khối tròn xoay. Trên bản vẽ 2D với hệ trục tọa độ $O x y$, mặt cắt dọc của kỷ niệm chương hợp bởi ba đoạn giao nhau:
    - Thân trên là parabol $y = 3 - x^2$ với đỉnh $P(0; 3)$.
    - Thân giữa là hyperbol $y = frac(2, x)$. Parabol và hyperbol ghép trơn với nhau tại điểm $N$.
    - Đế trụ phẳng có biên thẳng đứng $x = 2$, kéo từ $y = 0$ đến mép dưới hyperbol.

    Khối pha lê được sinh ra khi miền phẳng mô tả trên quay quanh trục tung $O y$. Hãy xác định điểm ghép nối $N$, tính thể tích khối cúp. Biết $1$ đơn vị độ dài hệ trục tương ứng với $2" cm"$, khối lượng riêng của pha lê là $3.1" g/cm"^3$ và đơn giá pha lê thô là $800" VNĐ/g"$. Tính số tiền vật liệu cần mua để đúc 1000 sản phẩm này (đơn vị: triệu đồng, làm tròn 1 chữ số thập phân).
  ],
  [405.1],
  fig: fig-panel(cetz.canvas(length: 0.95cm, {
    import cetz.draw: *

    let para = ()
    for i in range(21) {
      let y = 2.0 + i * 1.0 / 20.0
      para.push((calc.sqrt(3.0 - y), y))
    }

    let hyper = ()
    for i in range(21) {
      let y = 1.0 + i * 1.0 / 20.0
      hyper.push((2.0 / y, y))
    }

    let fill-pts = ((0.0, 0.0), (2.0, 0.0), (2.0, 1.0))
    for p in hyper { fill-pts.push(p) }
    for p in para { fill-pts.push(p) }
    fill-pts.push((0.0, 3.0))

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 32), stroke: none)
    line(..fill-pts, close: true, fill: rgb(174, 214, 241, 60), stroke: none)
    line(..iso-points(para), stroke: 2.1pt + fig-shadow)
    line(..iso-points(hyper), stroke: 2.1pt + fig-shadow)
    line((2.18, -0.14), (2.18, 0.86), stroke: 2.1pt + fig-shadow)

    line(..para, stroke: 1.4pt + rgb("1A5276"))
    line(..hyper, stroke: 1.4pt + rgb("C0392B"))
    line((2.0, 0.0), (2.0, 1.0), stroke: 1.4pt + rgb("117A65"))

    line((-0.2, 0.0), (2.8, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -0.2), (0.0, 3.5), mark: (end: ">"), stroke: 0.6pt)
    content((2.65, -0.18), $x$)
    content((-0.2, 3.5), $y$)

    circle((1.0, 2.0), radius: 1.4pt, fill: black)
    content((1.2, 2.1), text(size: 8pt)[$N(1; 2)$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm điểm ghép và kiểm tra tính ghép trơn.*

      Phương trình hoành độ giao điểm của parabol và hyperbol:
      $3 - x^2 = frac(2, x) <=> x^3 - 3x + 2 = 0 <=> (x - 1)^2(x + 2) = 0.$
      Với $x > 0$, ta nhận nghiệm kép $x = 1$, suy ra $y = 2$. Vậy $N(1; 2)$.

      Đạo hàm của $y = 3 - x^2$ là $y' = -2x$, tại $x=1$ thì $y' = -2$.
      \ Đạo hàm của $y = 2/x$ là $y' = -2/x^2$, tại $x=1$ thì $y' = -2$.
      Hai đường cong chung tiếp tuyến tại $N$, tạo nên mặt ghép trơn cực kỳ thẩm mỹ!
    ]
    #step[
      *Tính tổng thể tích khối cúp quanh $O y$.*

      Viết đường biên x theo y:
      - Từ $y=2$ đến $y=3$: $x = sqrt(3 - y) => V_1 = pi integral_2^3 (3 - y) dif y = 0.5 pi$.
      - Từ $y=1$ đến $y=2$: $x = 2/y => V_2 = pi integral_1^2 frac(4, y^2) dif y = 2 pi$.
      - Đáy trụ từ $y=0$ đến $y=1$: $x = 2 => V_3 = pi integral_0^1 2^2 dif y = 4 pi$.

      Tổng thể tích: $V_"chuẩn" = V_1 + V_2 + V_3 = 6.5 pi$.
    ]
    #step[
      *Tính toán vật lý và báo giá.*

      Do 1 đơn vị bằng $2" cm"$, ta phải nhân lập phương tỷ lệ:
      $V_"thực" = 6.5 pi dot 2^3 = 52 pi " cm"^3.$

      Khối lượng một chiếc cúp: $m = V_"thực" dot rho = 52 pi dot 3.1 = 161.2 pi approx 506.42 " (g)"$.
      \ Số tiền mua pha lê cho 1000 cúp:
      $T = 1000 times 506.425 times 800 approx 405 139 800 " (VNĐ)".$
      Làm tròn theo yêu cầu, ta được *405,1* triệu đồng. Khung bài đánh mạnh năng lực tích hợp Toán - Vật lý - Kinh tế.
    ]
  ],
)


== Bài 11. Quả Dọi Bằng Đồng - Khối Nón Cắt Khối Cầu

#tln(
  [Phần đo kiểm của một *quả dọi kỹ thuật* làm từ đồng thỏi có mặt cắt rỗng trong bản vẽ 2D được định hình bởi:
    - Cung tròn trên: $x^2 + y^2 = 4$ nằm trong khoảng $-1 <= y <= 2$.
    - Cung nón dưới: đường thẳng nối từ đỉnh $P(0; -4)$ và tiếp xúc hoàn hảo với cung tròn ở điểm $N$. \
    Khi xoay 360 độ quanh trục $O y$, ta thu được hình khối $3 D$ của quả dọi.

    Mọi đơn vị đồ thị là $2" cm"$. Vật liệu đồng thỏi có khối lượng riêng $8.7" g/cm"^3$. Biết giá khai thác và đúc đồng nguyên khối là $150 000" VNĐ/kg"$. Xác định khoảng cách từ đỉnh $P$ đến vị trí ghép trơn $N$, tính khối lượng quả dọi và chi phí vật liệu (đơn vị: nghìn đồng, làm tròn một chữ số thập phân).
  ],
  [393.6],
  fig: fig-panel(cetz.canvas(length: 0.7cm, {
    import cetz.draw: *

    let circ = ()
    for i in range(31) {
      let y = -1.0 + i * 3.0 / 30.0
      circ.push((calc.sqrt(4.0 - y * y), y))
    }

    let cone = ((0.0, -4.0), (calc.sqrt(3.0), -1.0))

    let fill-pts = ((0.0, -4.0), (calc.sqrt(3.0), -1.0))
    for p in circ { fill-pts.push(p) }
    fill-pts.push((0.0, 2.0))

    line(..iso-points(fill-pts), close: true, fill: rgb(189, 195, 199, 42), stroke: none)
    line(..fill-pts, close: true, fill: rgb(243, 156, 18, 80), stroke: none)
    line(..iso-points(circ), stroke: 2.1pt + fig-shadow)

    line((0.18, -4.14), (calc.sqrt(3.0) + 0.18, -1.14), stroke: 2.1pt + fig-shadow)

    line(..circ, stroke: 1.4pt + rgb("1A5276"))
    line(..cone, stroke: 1.4pt + rgb("C0392B"))

    line((-2.5, 0.0), (2.5, 0.0), mark: (start: "<", end: ">"), stroke: 0.6pt)
    line((0.0, -4.5), (0.0, 3.0), mark: (end: ">"), stroke: 0.6pt)
    content((2.35, -0.2), $x$)
    content((-0.2, 2.8), $y$)

    circle((calc.sqrt(3.0), -1.0), radius: 1.4pt, fill: black)
    content((calc.sqrt(3.0) + 0.3, -1.0), text(size: 8pt)[$N$])
  })),
  fig-pos: "right",
  fig-width: 33%,
  loigiai: [
    #reset-step()
    #step[
      *Tìm tọa độ tiếp điểm quy chuẩn.*

      Phương trình giao tiếp tuyến: Đường thẳng từ $P(0; -4)$ tiếp xúc đường tròn $x^2 + y^2 = 4$.
      Gọi tiếp điểm $N(x_0; y_0)$. Tiếp tuyến tại $N$ là $x x_0 + y y_0 = 4$.
      Vì đi qua $P(0; -4)$, thay $x=0, y=-4 => -4y_0 = 4 => y_0 = -1$.
      Thay lại vào đường tròn $x_0^2 + 1 = 4 => x_0 = sqrt(3)$. Điểm nối tuyệt mỹ tại $N(sqrt(3); -1)$.
    ]
    #step[
      *Thiết lập hệ tọa độ sinh khối xoay.*

      Đường kính nón là đoạn thẳng qua $(0; -4)$ và $(sqrt(3); -1)$, hệ số góc $x'_y = 1/sqrt(3)$.
      Hàm nón: $x = frac(y + 4, sqrt(3))$ kéo dài từ $y = -4$ đến $y = -1$.
      Hàm nắp cầu: $x = sqrt(4 - y^2)$ từ $y = -1$ đến $y = 2$.

      Thể tích chuẩn trên trục $O y$:
      $V_"nón" &= pi integral_(-4)^(-1) frac((y + 4)^2, 3) dif y = pi/3 (frac((y + 4)^3, 3))|_(-4)^(-1) = 3 pi.$
      $V_"cầu" &= pi integral_(-1)^2 (4 - y^2) dif y = pi (4y - y^3/3)|_(-1)^2 = 9 pi.$
      Tổng cộng: $V_"chuẩn" = 12 pi.$
    ]
    #step[
      *Chuyển hệ đánh giá thực tiễn.*

      Nhân tỷ lệ thể tích cho hệ tọa độ scale "1 ăn 2":
      $V_"thực" = 12 pi dot 2^3 = 96 pi " cm"^3 approx 301.59 " cm"^3.$

      Khối lượng đồng: $m = 301.59 dot 8.7 approx 2623.86 " (g)" = 2.624 " (kg)".$ \
      Chi phí vật liệu: $C = 2.624 times 150000 = 393600 " VNĐ".$
      Quy tròn số tiền ra nghìn ta được *393,6*.
    ]
  ],
)


== Bài 12. Con Quay Gỗ Mộc - Logarit Ôm Lấy Đường Thẳng

#tln(
  [Một món đồ chơi *con quay gỗ (xu dĩ)* được tiện bằng máy CNC. Mặt cắt dọc của món đồ chơi xoay quanh trục $O x$ khớp với diện tích mặt phẳng chắn bởi các đường:
    - Hàm logarit tự nhiên $y = ln(x)$.
    - Trục hoành $y = 0$.
    - Đường thẳng $d$ đi qua gốc tọa độ và *tiếp xúc* với đồ thị $ln(x)$.

    Sau khi xoay vùng này quanh $O x$, ta đem khối này tiện trên phôi gỗ Gõ Đỏ (khối lượng riêng $0.8" g/cm"^3$). Quy ước 1 đơn vị đồ thị dài đúng $10" cm"$. Giá vật liệu gỗ khối là $80 000" VNĐ/kg"$ và tiền duy trì máy CNC cắt gọt là $50 000" VNĐ"$ mỗi sản phẩm. Tính giá thành xuất xưởng trọn gói của một con quay (đơn vị: nghìn đồng, làm tròn một chữ số thập phân).
  ],
  [87.8],
  fig: fig-panel(cetz.canvas(length: 1.0cm, {
    import cetz.draw: *

    let log_c = ()
    for i in range(21) {
      let x = 1.0 + i * (calc.e - 1.0) / 20.0
      log_c.push((x, calc.ln(x)))
    }

    let lin_c = ((0.0, 0.0), (calc.e, 1.0))

    let fill-pts = ((0.0, 0.0),)
    for p in log_c.rev() { fill-pts.push(p) }

    // The shaded region is above ln(x) and under x/e and above y=0
    let shade = ()
    shade.push((0, 0))
    for x in range(1, 21) {
      let xx = x * 1.0 / 20.0
      shade.push((xx, xx / calc.e))
    }
    // from 1 to e
    for x in range(20, -1, step: -1) {
      let xx = 1.0 + x * (calc.e - 1.0) / 20.0
      shade.push((xx, calc.ln(xx)))
    }
    line(..shade, close: true, fill: rgb(211, 84, 0, 40), stroke: none)

    // draw the 3d projection hints
    let shade2 = ()
    for p in shade { shade2.push((p.at(0), -p.at(1))) }
    line(..shade2, close: true, fill: rgb(211, 84, 0, 15), stroke: none)

    line(..log_c, stroke: 1.4pt + rgb("117A65"))
    line(..lin_c, stroke: 1.4pt + rgb("C0392B"))

    // mirror curves for visual
    let log_c_m = log_c.map(p => (p.at(0), -p.at(1)))
    let lin_c_m = lin_c.map(p => (p.at(0), -p.at(1)))
    line(..log_c_m, stroke: (dash: "dashed", paint: rgb("117A65")))
    line(..lin_c_m, stroke: (dash: "dashed", paint: rgb("C0392B")))

    line((-0.2, 0.0), (3.3, 0.0), mark: (start: "<", end: ">"), stroke: 0.8pt)
    line((0.0, -1.5), (0.0, 1.5), mark: (end: ">"), stroke: 0.6pt)
    content((3.1, -0.2), $x$)
    content((-0.2, 1.3), $y$)

    circle((calc.e, 1.0), radius: 1.4pt, fill: black)
    content((calc.e + 0.3, 1.0), text(size: 8pt)[$M(e; 1)$])
  })),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #reset-step()
    #step[
      *Truy vết đường tiếp xúc Logarit.*

      Đường thẳng qua gốc tọa độ có dạng $y = k x$.
      Tại điểm tiếp xúc $x_0$, ta có hệ:
      $k x_0 = ln(x_0)$ và $k = frac(1, x_0)$.
      Suy ra $frac(x_0, x_0) = ln(x_0) => ln(x_0) = 1 => x_0 = e$.
      Thế vào được $k = 1/e$. Phương trình đường thẳng là $y = x/e$, điểm tiếp xúc siêu trơn ở $M(e; 1)$.
    ]
    #step[
      *Tích phân kép xử lý mặt chắn hình côn.*

      Miền bị chắn giới hạn bởi nón ngoài $y = x/e$ sinh ra và cái ruột bị khoét lõm bởi $y = ln(x)$ từ $x = 1$ đến $e$.

      Thể tích khối đặc tổng hợp (quay trục hoành $O x$):
      $V = V_"nón" - V_"khoét" = pi integral_0^e (frac(x, e))^2 dif x - pi integral_1^e (ln(x))^2 dif x.$
      Tính dễ dàng $V_"nón" = pi (e/3)$.
      Tích phân từng phần 2 lần với hàm Logarit sinh ra: $integral (ln(x))^2 = x(ln(x))^2 - 2x ln(x) + 2x$.
      Do đó $V_"khoét" = pi(e - 2)$.
      $V = pi(frac(e, 3) - e + 2) = pi(2 - frac(2e, 3)) approx 0.5900 " (đvtt)".$
    ]
    #step[
      *Thực tế hóa quy mô hệ tọa độ.*

      Scale đồ thị 10 lần thì khối lượng dội lên theo lập phương:
      $V_"thực" = 0.5900 times 10^3 = 590.0 " cm"^3.$
      Cân nặng gỗ: $m = 590.0 times 0.8 = 472.0 " g" = 0.472 " kg".$

      Khối lượng tiền:
      Tiền gỗ là $0.472 times 80 000 = 37 760 " VNĐ"$.
      Phí gia công $50 000 " VNĐ"$.
      Tổng tiền = $87 760 " VNĐ"$. Nhập kết quả quy tròn là *87,8* nghìn đồng.
    ]
  ],
)



= III. TỔNG KẾT NHANH

#ppgiai(title: [Dấu hiệu tuyển sinh cần nhớ])[
  + Với hai đồ thị $y = f(x)$ và $y = g(x)$, hãy đặt $h(x) = f(x) - g(x)$. Nếu hai đường tiếp xúc tại $x_0$ thì $h(x_0) = 0$ và $h'(x_0) = 0$, nên $x_0$ là một nghiệm kép của $h(x) = 0$.
  + Nếu có một đường thẳng đi qua điểm cố định và tiếp xúc với đường cong, hãy viết điều kiện đồng điểm và đồng hệ số góc ngay tại tiếp điểm. Đó là bước quyết định, không phải phần tích phân.
  + Sau khi chốt được điểm chạm, bán kính hoặc tham số ghép trơn, khi ấy mới chuyển sang diện tích, thể tích, chi phí hay khối lượng.
]


#lythuyet(title: [Quy trình chuẩn cho bài ghép trơn])[
  + Xác định điểm chạm hoặc đầu mút ghép.
  + Kiểm tra đồng điểm trước, đồng tiếp tuyến sau.
  + Nếu có đường tròn thì ưu tiên viết pháp tuyến đi qua tâm.
  + Khi tính diện tích hay thể tích, đổi biến theo đường nào cho biểu thức bán kính đơn giản hơn.
]

#ppgiai(title: [Bảng đáp số ngắn để tô phiếu])[
  #table(
    columns: (auto, 3fr, auto, auto),
    fill: (c, r) => if r == 0 { rgb("1A5276") } else if calc.rem(r, 2) == 1 { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + gray,
    inset: (x: 8pt, y: 6pt),
    table.header(
      text(fill: white)[*Bài*],
      text(fill: white)[*Mô hình*],
      text(fill: white)[*Đại lượng*],
      text(fill: white)[*Đáp số*],
    ),
    [1], [Nhẫn cưới - parabol + cung tròn], [$V$], [*1.57*],
    [2], [Chén thủy tinh - parabol + bi cầu], [$V_"lỏng"$], [*0.21*],
    [3], [Cổ chai thể thao - elip + parabol], [$V$], [*28.5*],
    [4], [Gioăng silicon - parabol + cung tròn], [$S$], [*0.24*],
    [5], [Cánh turbine - elip + nửa đường tròn], [$S$], [*18.8*],
    [6], [Nắp chai thể thao - đường thẳng + parabol], [$V$], [*6.28*],
    [7], [Tay nắm cốc - đĩa tròn tiếp xúc trục], [$V$], [*533*],
    [8], [Phễu công nghiệp - parabol + quả cầu], [$r$], [*2.50*],
    [9], [Đèn pha ô tô - parabol + cung tròn], [$S$], [*0.38*],
    [10], [Cúp pha lê - parabol tiếp tuyến hyperbol], [Cost], [*405.1*],
    [11], [Quả dọi kỹ thuật - nón ghép đỉnh nắp cầu], [Cost], [*393.6*],
    [12], [Con quay gỗ - hàm logarit tự nhiên lõm], [Cost], [*87.8*],

    [13], [Mô hình tuyển sinh - hyperbol và tiếp tuyến], [$V$], [*737.2*],
    [14], [Mô hình tuyển sinh - bậc ba tiếp xúc parabol], [$V$], [*16.28*],
  )
]
