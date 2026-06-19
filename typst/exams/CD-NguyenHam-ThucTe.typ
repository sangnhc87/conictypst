#import "../sang-exam.typ": *
#import "../template.typ": *

// CẤU HÌNH TRANG
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.9em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0F1B5F"), rgb("1A237E"), rgb("3949AB"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("283593")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("283593"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// MÀU CHỦ ĐỀ
#let col-navy = rgb("1A237E")
#let col-blue = rgb("1565C0")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")

// HỘP TRÌNH BÀY
#let rev-box(title: none, body) = block(
  fill: rgb("E8EAF6"),
  stroke: (left: 4pt + col-navy, rest: 0.8pt + rgb("C5CAE9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-navy, size: 11pt, weight: "bold")[#title]
    #v(0.35em)
  ]
  #body
]

#let eg-box(title: "Ví dụ", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let note-box(title: "Nhận xét", body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let insight-box(title: "💡 Trực Giác Sư Phạm", body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 4pt + rgb("00897B"), rest: 0.6pt + rgb("B2DFDB")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("00897B"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

// TRANG BÌA
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("09152E"), rgb("102A63"), rgb("1A237E"), rgb("3949AB"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("C5CAE9"), size: 11pt, weight: "bold", tracking: 2pt)[
      TÀI LIỆU CHUYÊN SÂU HỌC SINH GIỎI & LUYỆN THI ĐGNL
    ]
    #v(0.55em)
    #text(fill: white, size: 22pt, weight: "bold")[Nguyên Hàm & Hằng Số Tích Phân]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 13.5pt)[Tích lũy thủy văn bể chứa · Doanh thu dao động mùa vụ · Động học phanh xe]
    #v(1.1em)
    #line(length: 72%, stroke: 1.5pt + rgb("C5CAE9"))
  ]
]

#v(1.35em)

// MỤC LỤC
#align(center)[
  #block(
    width: 95%,
    fill: rgb("E8EAF6").lighten(60%),
    stroke: 1pt + rgb("C5CAE9"),
    radius: 8pt,
    inset: (x: 16pt, y: 12pt),
  )[
    #text(fill: col-navy, size: 11pt, weight: "bold")[Nội dung chuyên đề]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.65em,
      align: left,
      [I. Bản chất toán học của nguyên hàm], [II. Kinh tế: Chi phí & Doanh thu tích lũy],
      [III. Vật lý: Động học phanh dừng xe], [IV. Sinh thái: Dân số học tức thời],
      [V. Thủy văn & Môi trường: Tích lũy ròng], [VI. Mạch điện tụ xoay chiều & Lực cản],
      [VII. PP tích phân: Từng phần & Đổi biến], [VIII. Bài tập trắc nghiệm & đúng sai],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề Toán 12 nâng cao: Nguyên hàm trong thực tế], [GV Nguyễn Văn Sang],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("C5CAE9"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [], [Trang #counter(page).display()],
    )
  },
)

= I. Định lý cơ bản & Ý nghĩa tích lũy

Nguyên hàm là phép toán ngược của đạo hàm. Trong thực tế mô hình hóa, nếu $f(t)$ đại diện cho *tốc độ thay đổi tức thời* của một đại lượng nào đó tại thời điểm $t$, thì nguyên hàm $F(t) = integral f(t) d t$ là hàm số biểu diễn *tổng lượng tích lũy* của đại lượng đó. Để tìm hằng số tích phân $C$, ta luôn cần một điều kiện ban đầu (ví dụ: lượng nước ban đầu trong bể, dân số tại năm mốc).

= II. Kinh tế học: Hàm tổng chi phí sản xuất

#ds(
  id: "NH-01-EC",
  [Một doanh nghiệp xác định chi phí cận biên để sản xuất $x$ sản phẩm ($x >= 0$) được cho bởi hàm số:
  $ M C(x) = 3x^2 - 12x + 10 quad ("triệu đồng/sản phẩm") $
  Biết rằng chi phí cố định ban đầu (chi phí khi chưa sản xuất sản phẩm nào) của doanh nghiệp là $50$ triệu đồng. Xét tính đúng/sai của các nhận định sau:],
  (
    True([Chi phí cố định ban đầu của doanh nghiệp chính là điều kiện biên để tìm hằng số tích phân: $C(0) = 50$.]),
    True([Hàm tổng chi phí sản xuất của doanh nghiệp là $C(x) = x^3 - 6x^2 + 10x + 50$.]),
    True([Chi phí cận biên để sản xuất sản phẩm thứ $10$ của doanh nghiệp là $190$ triệu đồng.]),
    [Nếu doanh nghiệp sản xuất $5$ sản phẩm thì tổng chi phí sản xuất là $125$ triệu đồng.],
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Tìm họ nguyên hàm của hàm chi phí cận biên $M C(x)$, sử dụng điều kiện $C(0) = 50$ để tìm hằng số $C$, sau đó tính các giá trị cụ thể.]

    #step[Xác định điều kiện biên (Ý a)]
    Do chi phí cố định là chi phí phát sinh khi sản lượng bằng $0$, ta có điều kiện biên:
    $ C(0) = 50 quad ("triệu đồng") $
    Do đó, nhận định a) là *Đúng*.

    #step[Tìm hàm tổng chi phí $C(x)$ (Ý b)]
    Hàm tổng chi phí $C(x)$ là nguyên hàm của chi phí cận biên $M C(x)$:
    $ C(x) = integral M C(x) d x = integral (3x^2 - 12x + 10) d x = x^3 - 6x^2 + 10x + C $
    Dựa vào điều kiện $C(0) = 50$:
    $ 0^3 - 6(0)^2 + 10(0) + C = 50 => C = 50 $
    Vậy hàm tổng chi phí là:
    $ C(x) = x^3 - 6x^2 + 10x + 50 $
    Nhận định b) là *Đúng*.

    #step[Tính chi phí cận biên tại $x=10$ (Ý c)]
    Chi phí cận biên để sản xuất sản phẩm thứ 10 là:
    $ M C(10) = 3(10)^2 - 12(10) + 10 = 300 - 120 + 10 = 190 quad ("triệu đồng") $
    Nhận định c) là *Đúng*.

    #step[Tính tổng chi phí khi sản xuất 5 sản phẩm (Ý d)]
    Tổng chi phí khi $x = 5$:
    $ C(5) = 5^3 - 6(5)^2 + 10(5) + 50 = 125 - 150 + 50 + 50 = 75 quad ("triệu đồng") $
    Như vậy tổng chi phí là $75$ triệu đồng, chứ không phải $125$ triệu đồng.
    Nhận định d) là *Sai*.
  ]
)

#pagebreak()

= III. Vật lý học: Quỹ đạo phanh dừng xe máy

#tln(
  id: "NH-02-PH",
  [Một người đang lái xe máy di chuyển với vận tốc $9$ m/s thì bất ngờ gặp chướng ngại vật và đạp phanh. Kể từ thời điểm đó, xe máy chuyển động chậm dần với gia tốc biến đổi theo thời gian $t$ (giây) là $a(t) = -2t$ (m/s²). Hỏi sau bao nhiêu giây kể từ lúc bắt đầu đạp phanh thì xe máy dừng hẳn?],
  [$3$],
  loigiai: [
    #reset-step()
    #ppgiai[Vận tốc là nguyên hàm của gia tốc. Sử dụng vận tốc ban đầu tại $t=0$ để tìm hằng số $C$, sau đó giải phương trình vận tốc bằng 0 để tìm thời điểm dừng.]

    #step[Tìm hàm vận tốc $v(t)$]
    Ta có gia tốc $a(t) = v'(t) = -2t$. Vận tốc $v(t)$ là nguyên hàm của $a(t)$:
    $ v(t) = integral a(t) d t = integral (-2t) d t = -t^2 + C $
    Tại thời điểm đạp phanh $t = 0$, vận tốc ban đầu là $v(0) = 9$ m/s:
    $ -0^2 + C = 9 => C = 9 $
    Do đó, hàm vận tốc của xe máy là:
    $ v(t) = -t^2 + 9 quad (m/s) $

    #step[Tìm thời điểm xe dừng hẳn]
    Xe máy dừng hẳn khi vận tốc giảm về $0$:
    $ v(t) = 0 <=> -t^2 + 9 = 0 <=> t^2 = 9 <=> t = 3 quad ("giây") quad ("do " t >= 0) $
    #eg-box(title: "Kết luận")[Xe máy dừng hẳn sau *3* giây.]
  ]
)

#pagebreak()

= IV. Sinh thái học: Dân số học tức thời

#tln(
  id: "NH-03-PO",
  [Tốc độ tăng trưởng dân số của một thị trấn nông nghiệp được mô hình hóa bởi hàm số:
  $ P'(t) = 30 e^(0.05t) quad ("người/năm") $
  Trong đó $t$ là số năm tính từ mốc năm 2020 ($t=0$). Biết rằng dân số của thị trấn vào năm 2020 là $5000$ người. Hãy tính dân số của thị trấn này vào năm 2040 (làm tròn kết quả đến hàng đơn vị).],
  [$6031$],
  loigiai: [
    #reset-step()
    #ppgiai[Tìm hàm số dân số $P(t)$ là nguyên hàm của $P'(t)$, sử dụng dân số năm 2020 để xác định hằng số $C$, sau đó tính giá trị tại $t=20$.]

    #step[Tìm hàm dân số $P(t)$]
    $ P(t) = integral P'(t) d t = integral 30 e^(0.05t) d t = frac(30, 0.05) e^(0.05t) + C = 600 e^(0.05t) + C $
    Dân số năm 2020 ($t = 0$) là $5000$ người:
    $ P(0) = 600 e^0 + C = 5000 <=> 600 + C = 5000 => C = 4400 $
    Hàm dân số của thị trấn là:
    $ P(t) = 600 e^(0.05t) + 4400 quad ("người") $

    #step[Tính dân số năm 2040]
    Năm 2040 tương ứng với $t = 20$:
    $ P(20) = 600 e^(0.05 dot 20) + 4400 = 600 e^1 + 4400 $
    Sử dụng số thực $e approx 2.71828$:
    $ P(20) approx 600 dot 2.71828 + 4400 = 1630.968 + 4400 = 6030.968 $
    Làm tròn kết quả đến hàng đơn vị, ta được $6031$ người.
    #eg-box(title: "Kết luận")[Dân số năm 2040 dự kiến là *6031* người.]
  ]
)

#pagebreak()

= V. Thủy văn học: Tích lũy ròng trong bể chứa

Trong các bài toán thực tế chứa nước, lượng chất lỏng trong bể thay đổi do cả dòng chảy vào (inflow) và dòng chảy ra (outflow). Tốc độ thay đổi thể tích nước ròng là hiệu số giữa hai tốc độ này.

#ds(
  id: "NH-04-HY",
  [Một bể chứa nước thủy văn ban đầu chứa $100$ m³ nước. Kể từ thời điểm $t = 0$ (giờ), nước được bơm vào bể với tốc độ $I(t) = 15 - 0.5t$ (m³/giờ) và đồng thời nước bị rò rỉ ra ngoài với tốc độ $O(t) = 0.5t$ (m³/giờ) ($t in [0, 24]$). Xét tính đúng/sai của các phát biểu sau đây:],
  (
    True([Tốc độ thay đổi ròng của thể tích nước trong bể tại thời điểm $t$ là $V'(t) = 15 - t$ (m³/giờ).]),
    True([Thể tích nước trong bể tại thời điểm $t$ được cho bởi hàm số $V(t) = -0.5t^2 + 15t + 100$ (m³).]),
    True([Thể tích nước trong bể đạt giá trị lớn nhất tại thời điểm $t = 15$ giờ kể từ lúc bắt đầu sạc nước.]),
    [Lượng nước tích lũy lớn nhất mà bể có thể đạt được trong suốt quá trình là $250$ m³.],
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Lập hàm tốc độ thay đổi ròng bằng hiệu $I(t) - O(t)$, lấy nguyên hàm kết hợp điều kiện ban đầu $V(0) = 100$ để lập hàm thể tích $V(t)$, từ đó tìm cực đại.]

    #step[Tìm tốc độ thay đổi ròng $V'(t)$ (Ý a)]
    Tốc độ thay đổi ròng thể tích nước trong bể tại mỗi thời điểm là:
    $ V'(t) = I(t) - O(t) = (15 - 0.5t) - 0.5t = 15 - t quad ("m³/giờ") $
    Nhận định a) *Đúng*.

    #step[Tìm hàm thể tích nước $V(t)$ (Ý b)]
    Thể tích nước $V(t)$ là nguyên hàm của tốc độ thay đổi ròng:
    $ V(t) = integral V'(t) d t = integral (15 - t) d t = 15t - 0.5t^2 + C $
    Do ban đầu lượng nước là $100$ m³ ($V(0) = 100$):
    $ 15(0) - 0.5(0)^2 + C = 100 => C = 100 $
    Vậy hàm thể tích nước trong bể là:
    $ V(t) = -0.5t^2 + 15t + 100 quad (m³) $
    Nhận định b) *Đúng*.

    #step[Tìm thời điểm đạt thể tích lớn nhất (Ý c)]
    Thể tích nước đạt cực đại khi tốc độ thay đổi ròng bằng 0:
    $ V'(t) = 0 <=> 15 - t = 0 <=> t = 15 quad ("giờ") $
    Do $V''(t) = -1 < 0$ nên đây là điểm cực đại của hàm số. Nhận định c) *Đúng*.

    #step[Tính thể tích lớn nhất (Ý d)]
    Thế $t = 15$ vào hàm số $V(t)$:
    $ V(15) = -0.5(15)^2 + 15(15) + 100 = -112.5 + 225 + 100 = 212.5 quad (m³) $
    Lượng nước cực đại đạt được là $212.5$ m³, chứ không phải $250$ m³.
  ]
)

#v(1.5em)

#tln(
  id: "NH-06-EN",
  [Một phòng thí nghiệm hóa học ban đầu hoàn toàn sạch khí độc. Do một sự cố kỹ thuật tại thời điểm $t = 0$ (phút), khí độc phát tán vào phòng với tốc độ $I(t) = 0.6 t$ (ppm/phút), đồng thời hệ thống thông gió hút khí độc ra ngoài với tốc độ $O(t) = 0.2 t$ (ppm/phút). Gọi $C(t)$ (ppm) là nồng độ khí độc tích lũy trong phòng tại thời điểm $t$. Hỏi sau bao nhiêu phút thì nồng độ khí độc trong phòng đạt ngưỡng cảnh báo nguy hiểm là $5$ ppm?],
  [$5$],
  loigiai: [
    #reset-step()
    #ppgiai[Xác định tốc độ thay đổi nồng độ khí độc ròng $C'(t) = I(t) - O(t)$, lấy nguyên hàm kết hợp điều kiện ban đầu $C(0) = 0$ để tìm hàm nồng độ $C(t)$, sau đó giải phương trình $C(t) = 5$.]

    #step[Xác định tốc độ thay đổi ròng]
    Tốc độ thay đổi nồng độ khí độc ròng là hiệu giữa tốc độ phát tán vào và tốc độ hút ra ngoài:
    $ C'(t) = I(t) - O(t) = 0.6t - 0.2t = 0.4t quad ("ppm/phút") $

    #step[Tìm hàm nồng độ tích lũy C(t)]
    Hàm nồng độ khí độc $C(t)$ là nguyên hàm của tốc độ thay đổi ròng:
    $ C(t) = integral C'(t) d t = integral 0.4t d t = 0.2t^2 + C $
    Do ban đầu phòng hoàn toàn không có khí độc ($t=0$, nồng độ bằng $0$):
    $ C(0) = 0.2(0)^2 + C = 0 => C = 0 $
    Vậy hàm nồng độ khí độc tích lũy theo thời gian là:
    $ C(t) = 0.2t^2 quad ("ppm") $

    #step[Tính thời điểm đạt ngưỡng nguy hiểm]
    Đặt $C(t) = 5$:
    $ 0.2t^2 = 5 <=> t^2 = 25 $
    Vì thời gian $t >= 0$, ta chọn $t = 5$ phút.
    #eg-box(title: "Kết luận")[Nồng độ khí độc đạt ngưỡng nguy hiểm sau *5* phút.]
  ]
)

#pagebreak()

= VI. Dao động tuần hoàn lượng giác & Ứng dụng tích lũy

Doanh thu của nhiều ngành dịch vụ (du lịch, bán lẻ) biến động tuần hoàn theo các mùa trong năm. Chúng ta mô phỏng tốc độ doanh thu bằng hàm số lượng giác.

#tln(
  id: "NH-05-SR",
  [Tốc độ thay đổi doanh thu của một công ty du lịch lữ hành tại bãi biển được mô tả bởi hàm số:
  $ R'(t) = 20 - 10 cos(frac(pi, 6) t) quad ("triệu đồng/tháng") $
  Trong đó $t$ là số tháng tính từ tháng 1 năm 2026 ($t=0$). Biết rằng doanh nghiệp tích lũy doanh thu ban đầu bằng 0 ($R(0)=0$). Tính tổng doanh thu tích lũy của công ty này sau đúng $6$ tháng đầu năm (làm tròn kết quả đến hàng đơn vị của triệu đồng)?],
  [$120$],
  loigiai: [
    #reset-step()
    #ppgiai[Tìm hàm doanh thu tích lũy $R(t)$ là nguyên hàm của $R'(t)$, sử dụng điều kiện $R(0)=0$ để tìm hằng số $C$, sau đó tính giá trị tại $t=6$.]

    #step[Tìm họ nguyên hàm]
    $ R(t) = integral (20 - 10 cos(frac(pi, 6) t)) d t = 20t - 10 \cdot frac(6, pi) sin(frac(pi, 6) t) + C = 20t - frac(60, pi) sin(frac(pi, 6) t) + C $
    Do doanh thu tích lũy ban đầu tại $t = 0$ bằng $0$:
    $ R(0) = 20(0) - frac(60, pi) sin(0) + C = 0 => C = 0 $
    Hàm tổng doanh thu tích lũy là:
    $ R(t) = 20t - frac(60, pi) sin(frac(pi, 6) t) quad ("triệu đồng") $

    #step[Tính doanh thu tích lũy sau 6 tháng]
    Thế $t = 6$:
    $ R(6) = 20(6) - frac(60, pi) sin(frac(pi, 6) dot 6) = 120 - frac(60, pi) sin(pi) $
    Vì $sin(pi) = 0$, ta được:
    $ R(6) = 120 - 0 = 120 quad ("triệu đồng") $
    #eg-box(title: "Kết luận")[Tổng doanh thu tích lũy sau 6 tháng là *120* triệu đồng.]
  ]
)

#pagebreak()

#pagebreak()

= VII. Phương pháp nguyên hàm đặc biệt trong mô hình hóa

Trong nhiều bài toán thực tế, hàm tốc độ thay đổi là tích của hai loại hàm số khác nhau (ví dụ: đa thức và hàm mũ). Khi đó ta phải sử dụng phương pháp *nguyên hàm từng phần* hoặc *đổi biến số* để tìm hàm tích lũy.

#tln(
  id: "NH-09-MIG",
  [Tốc độ di cư ròng của người dân vào một khu đô thị mới được mô hình hóa bởi hàm số:
  $ M'(t) = 5 t e^(-0.1 t) quad ("nghìn người/năm") $
  Trong đó $t$ là số năm tính từ thời điểm khu đô thị bắt đầu hoạt động ($t=0$). Biết rằng tại $t=0$, dân số của khu đô thị bằng 0. Tính tổng số lượng người đã di cư vào khu đô thị sau 10 năm đầu tiên (làm tròn kết quả đến hàng đơn vị của nghìn người). Biết $e approx 2.718$.],
  [$132$],
  loigiai: [
    #reset-step()
    #ppgiai[Sử dụng phương pháp nguyên hàm từng phần $integral u d v = u v - integral v d u$ để tìm hàm tích lũy $M(t)$, sau đó tính $M(10)$.]

    #step[Thiết lập nguyên hàm từng phần]
    Hàm tổng số lượng người di cư $M(t) = integral 5 t e^(-0.1 t) d t$.
    Đặt:
    $ u = 5t => d u = 5 d t $
    $ d v = e^(-0.1 t) d t => v = -10 e^(-0.1 t) $
    Áp dụng công thức nguyên hàm từng phần:
    $ M(t) = (5t)(-10 e^(-0.1 t)) - integral (-10 e^(-0.1 t)) (5 d t) $
    $ M(t) = -50t e^(-0.1 t) + 50 integral e^(-0.1 t) d t $
    $ M(t) = -50t e^(-0.1 t) + 50(-10 e^(-0.1 t)) + C = -50t e^(-0.1 t) - 500 e^(-0.1 t) + C $
    $ M(t) = -50 e^(-0.1 t) (t + 10) + C $

    #step[Tìm hằng số C]
    Tại $t=0$, $M(0) = 0$:
    $ -50 e^0 (0 + 10) + C = 0 <=> -500 + C = 0 => C = 500 $
    Vậy hàm dân số di cư là $M(t) = 500 - 50 e^(-0.1 t) (t + 10)$ (nghìn người).

    #step[Tính tổng lượng người sau 10 năm]
    Thay $t = 10$:
    $ M(10) = 500 - 50 e^(-1) (10 + 10) = 500 - 1000 e^(-1) = 500 - frac(1000, e) $
    Sử dụng $e approx 2.718$:
    $ M(10) approx 500 - 367.9 = 132.1 quad ("nghìn người") $
    Làm tròn đến hàng đơn vị, ta được $132$ nghìn người.
    #eg-box(title: "Kết luận")[Tổng số người di cư sau 10 năm là *132* nghìn người.]
  ]
)

#v(1.5em)

#tln(
  id: "NH-10-OIL",
  [Tại một giàn khoan dầu trên biển, một sự cố rò rỉ làm dầu tràn ra mặt nước tạo thành một vết dầu loang hình tròn. Tốc độ tăng bán kính của vết dầu loang tại thời điểm $t$ (giờ) sau sự cố được quan sát là:
  $ r'(t) = frac(10, sqrt(t+1)) quad ("m/giờ") $
  Biết tại thời điểm bắt đầu sự cố ($t=0$), vết dầu chưa xuất hiện nên bán kính $r(0) = 0$ m. Tính diện tích bề mặt của vết dầu loang sau 3 giờ kể từ khi sự cố xảy ra (lấy $pi approx 3.14$ và làm tròn đến hàng đơn vị của $m^2$).],
  [$1256$],
  loigiai: [
    #reset-step()
    #ppgiai[Tìm hàm bán kính $r(t)$ thông qua nguyên hàm (có thể nhẩm hoặc đổi biến $u = t+1$), sau đó tính diện tích hình tròn $S = pi r^2$ tại $t=3$.]

    #step[Tìm hàm bán kính r(t)]
    $ r(t) = integral r'(t) d t = integral frac(10, sqrt(t+1)) d t = integral 10 (t+1)^(-1/2) d(t+1) $
    $ r(t) = 10 dot frac((t+1)^(1/2), 1/2) + C = 20 sqrt(t+1) + C $
    Tại $t=0$, $r(0) = 0$:
    $ 20 sqrt(0+1) + C = 0 <=> 20 + C = 0 => C = -20 $
    Hàm bán kính của vết dầu loang là:
    $ r(t) = 20 sqrt(t+1) - 20 quad (m) $

    #step[Tính bán kính sau 3 giờ]
    Thay $t = 3$:
    $ r(3) = 20 sqrt(3+1) - 20 = 20 sqrt(4) - 20 = 20(2) - 20 = 20 quad (m) $

    #step[Tính diện tích vết dầu]
    Vết dầu hình tròn có bán kính $r = 20$ m.
    Diện tích là:
    $ S = pi r^2 = 3.14 dot 20^2 = 3.14 dot 400 = 1256 quad (m^2) $
    #eg-box(title: "Kết luận")[Diện tích vết dầu loang sau 3 giờ là *1256* $m^2$.]
  ]
)

#pagebreak()

= VIII. Bài tập trắc nghiệm & Đúng/Sai tổng hợp

#tn(
  id: "NH-07-AC2",
  [Cường độ dòng điện xoay chiều chạy qua một tụ điện biến thiên theo thời gian $t$ (giây) được xác định bởi công thức:
  $ i(t) = 2 cos(100 pi t) quad (A) $
  Biết điện tích của tụ điện tại thời điểm $t = 0$ bằng $0$ Coulomb ($q(0)=0$). Điện tích tích lũy trên tụ điện tại thời điểm $t$ (giây) được tính bởi công thức $q(t) = integral i(t) d t$. Công thức biểu diễn điện tích $q(t)$ (đơn vị: Coulomb) là:],
  (
    [$q(t) = frac(1, 50 pi) sin(100 pi t)$ (C)],
    [$q(t) = -frac(1, 50 pi) sin(100 pi t)$ (C)],
    [$q(t) = frac(1, 50 pi) cos(100 pi t)$ (C)],
    [$q(t) = 2 sin(100 pi t)$ (C)],
  ),
  correct: (1,),
  loigiai: [
    #reset-step()
    #ppgiai[Tính họ nguyên hàm của dòng điện $i(t)$, sử dụng điều kiện biên $q(0) = 0$ để xác định hằng số tích phân $C$.]

    #step[Tìm họ nguyên hàm]
    Hàm điện tích $q(t)$ là một nguyên hàm của cường độ dòng điện $i(t)$:
    $ q(t) = integral 2 cos(100 pi t) d t = 2 dot frac(1, 100 pi) sin(100 pi t) + C = frac(1, 50 pi) sin(100 pi t) + C $

    #step[Xác định hằng số tích phân C]
    Từ điều kiện biên $q(0) = 0$:
    $ frac(1, 50 pi) sin(0) + C = 0 <=> 0 + C = 0 => C = 0 $
    Vậy biểu thức của điện tích tích lũy trên tụ điện là:
    $ q(t) = frac(1, 50 pi) sin(100 pi t) quad (C) $
    #eg-box(title: "Kết luận")[Hàm điện tích tích lũy là $q(t) = frac(1, 50 pi) sin(100 pi t)$ (C). Chọn phương án A.]
  ]
)

#v(1.5em)

#ds(
  id: "NH-08-DR",
  [Một tàu cao tốc đang di chuyển ổn định với vận tốc $20$ m/s thì bất ngờ tắt máy tại thời điểm $t = 0$ (giây). Do sức cản của nước, tàu chuyển động chậm dần với gia tốc cản thay đổi theo thời gian $t$ là:
  $ a(t) = -0.5 sqrt(t) quad ("m/s²") $
  Xét tính đúng/sai của các nhận định sau đây:],
  (
    True([Hàm vận tốc của tàu cao tốc tại thời điểm $t$ giây sau khi tắt máy là $v(t) = 20 - frac(1, 3) t sqrt(t)$ (m/s).]),
    False([Vận tốc của tàu sau 4 giây kể từ lúc tắt máy là $16$ m/s.]),
    True([Kể từ lúc tắt máy, tàu sẽ dừng hẳn sau khoảng $15.3$ giây (làm tròn đến hàng phần mười).]),
    True([Quãng đường tàu đi được từ lúc tắt máy đến khi dừng hẳn có thể tính bằng cách lấy tích phân của hàm vận tốc $v(t)$ trên đoạn từ $0$ đến thời điểm dừng hẳn.]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Tìm hàm vận tốc $v(t)$ là nguyên hàm của gia tốc $a(t)$ với vận tốc đầu $v(0) = 20$, sau đó khảo sát các giá trị đặc biệt và giải phương trình $v(t) = 0$.]

    #step[Tìm hàm vận tốc $v(t)$ (Ý a)]
    Hàm vận tốc là nguyên hàm của gia tốc:
    $ v(t) = integral a(t) d t = integral (-0.5 t^(1/2)) d t = -0.5 dot frac(2, 3) t^(3/2) + C = -frac(1, 3) t sqrt(t) + C $
    Do vận tốc ban đầu tại $t = 0$ là $20$ m/s ($v(0) = 20$):
    $ -frac(1, 3) (0) sqrt(0) + C = 20 => C = 20 $
    Vậy hàm vận tốc của tàu là:
    $ v(t) = 20 - frac(1, 3) t sqrt(t) quad (m/s) $
    Nhận định a) là *Đúng*.

    #step[Tính vận tốc tại $t = 4$ giây (Ý b)]
    Thay $t = 4$ vào hàm vận tốc:
    $ v(4) = 20 - frac(1, 3) (4) sqrt(4) = 20 - frac(8, 3) = frac(52, 3) approx 17.33 quad ("m/s") $
    Vận tốc bằng $17.33$ m/s, chứ không phải $16$ m/s. Nhận định b) là *Sai*.

    #step[Xác định thời điểm tàu dừng hẳn (Ý c)]
    Tàu dừng hẳn khi vận tốc giảm về 0:
    $ v(t) = 0 <=> 20 - frac(1, 3) t sqrt(t) = 0 <=> t^(3/2) = 60 $
    Lấy lũy thừa $2/3$ hai vế:
    $ t = 60^(2/3) = root(3, 3600) approx 15.32 quad ("giây") $
    Làm tròn đến hàng phần mười ta được $15.3$ giây. Nhận định c) là *Đúng*.

    #step[Cách tính quãng đường (Ý d)]
    Quãng đường $S$ đi được từ $t=0$ đến khi dừng hẳn $t_0 approx 15.3$ s chính là tích lũy của vận tốc:
    $ S = integral_0^(t_0) v(t) d t $
    Nhận định d) là *Đúng*.
  ]
)
