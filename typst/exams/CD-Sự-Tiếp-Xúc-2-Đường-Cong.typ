#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
  footer: context align(right)[
    #text(size: 7.2pt, fill: rgb("7F8C8D"))[GV Nguyễn Văn Sang]
  ],
)
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

= III. TỔNG KẾT NHANH

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
  )
]
