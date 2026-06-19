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
    #text(fill: white, size: 22pt, weight: "black")[Phương Trình Mặt Phẳng Oxyz]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 13.5pt)[Góc máng xối mái che · Tiếp cận Glide Slope hàng không · Quét 3D LiDAR]
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
      [I. Cơ học kết cấu & Mô hình hóa 3D], [II. Tấm pin mặt trời & Góc chiếu tia nắng],
      [III. Xây dựng: Độ dốc của mái nhà xưởng], [IV. Đo đạc & Cảm biến quét Laser phẳng],
      [V. Thiết kế: Góc giao máng xối mái nhà], [VI. Hàng không: Glide Slope hạ cánh],
      [VII. Quang học & Địa chất học], [VIII. Bài tập trắc nghiệm & đúng sai],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề Toán 12 nâng cao: Mặt phẳng Oxyz thực tế], [GV Nguyễn Văn Sang],
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

= I. Cơ học kết cấu & Mô hình hóa 3D

Hình học giải tích trong không gian (Oxyz) là ngôn ngữ nền tảng của các phần mềm CAD/CAM, công nghệ in 3D và cơ học kết cấu. Bất kỳ bề mặt phẳng nào trong thực tế cũng có thể được xác định tọa độ thông qua các điểm chân đỡ và mô hình hóa bằng một phương trình mặt phẳng tuyến tính.

= II. Năng lượng xanh: Tấm pin năng lượng mặt trời

#ds(
  id: "MP-01-SP",
  [Một tấm pin năng lượng mặt trời hình chữ nhật phẳng được nâng đỡ bởi các cột đỡ chân đế. Trong hệ trục tọa độ $O x y z$ (đơn vị đo là mét, mặt đất trùng với mặt phẳng $O x y$), tọa độ ba điểm chân đỡ trên bề mặt tấm pin lần lượt là $A(0, 0, 1)$, $B(2, 0, 1)$, $C(0, 3, 4)$. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([Vectơ pháp tuyến của mặt phẳng chứa tấm pin mặt trời có tọa độ cùng phương với $arrow(n) = (0, -1, 1)$.]),
    True([Phương trình mặt phẳng biểu diễn bề mặt tấm pin mặt trời là $y - z + 1 = 0$.]),
    True([Góc nghiêng của tấm pin năng lượng mặt trời so với mặt đất nằm ngang bằng $45°$.]),
    [Một cảm biến nhiệt độ siêu nhỏ được gắn cố định tại điểm $D(1, 2, 2)$ sẽ nằm phía trên tấm pin mặt trời (tức là có cao độ $z$ lớn hơn cao độ của tấm pin tại cùng vị trí $(x, y)$).],
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Lập phương trình mặt phẳng đi qua 3 điểm bằng tích có hướng, tính góc giữa mặt phẳng chứa tấm pin và mặt phẳng đất $z=0$, sau đó so sánh cao độ của điểm $D$ với cao độ của mặt phẳng.]

    #step[Tìm vectơ pháp tuyến (Ý a)]
    Ta có:
    $ arrow(A B) = (2, 0, 0) $
    $ arrow(A C) = (0, 3, 3) $
    Vectơ tích có hướng:
    $ arrow(n)_0 = arrow(A B) times arrow(A C) = (0 dot 3 - 0 dot 3, 0 dot 0 - 2 dot 3, 2 dot 3 - 0 dot 0) = (0, -6, 6) $
    Chọn vectơ pháp tuyến rút gọn là $arrow(n) = (0, -1, 1)$ (cùng phương với $arrow(n)_0$).
    Do đó, nhận định a) là *Đúng*.

    #step[Lập phương trình mặt phẳng (Ý b)]
    Mặt phẳng đi qua $A(0, 0, 1)$ có vectơ pháp tuyến $arrow(n) = (0, -1, 1)$:
    $ 0(x - 0) - 1(y - 0) + 1(z - 1) = 0 <=> -y + z - 1 = 0 <=> y - z + 1 = 0 $
    Nhận định b) là *Đúng*.

    #step[Tính góc nghiêng so với mặt đất (Ý c)]
    Mặt đất nằm ngang (mặt phẳng $O x y$) có phương trình $z = 0$, tương ứng pháp vectơ $arrow(k) = (0, 0, 1)$.
    Gọi $alpha$ là góc nghiêng của tấm pin so với mặt đất ($0° <= alpha <= 90°$):
    $ cos alpha = frac(|arrow(n) dot arrow(k)|, |arrow(n)| dot |arrow(k)|) = frac(|0 dot 0 + (-1) dot 0 + 1 dot 1|, sqrt(0^2 + (-1)^2 + 1^2) dot sqrt(0^2 + 0^2 + 1^2)) = frac(1, sqrt(2) dot 1) = frac(sqrt(2), 2) $
    Suy ra $alpha = 45°$. Nhận định c) là *Đúng*.

    #step[Xét vị trí điểm cảm biến $D(1, 2, 2)$ (Ý d)]
    Mặt phẳng tấm pin có phương trình $y - z + 1 = 0 <=> z = y + 1$.
    Tại vị trí có tọa độ $(x, y) = (1, 2)$, cao độ của tấm pin là:
    $ z_"pin" = 2 + 1 = 3 quad (m) $
    Cao độ của điểm cảm biến $D$ là $z_D = 2$ m.
    Vì $z_D = 2 < 3 = z_"pin"$, nên điểm cảm biến $D$ nằm bên dưới tấm pin mặt trời chứ không phải phía trên.
    Nhận định d) là *Sai*.
  ]
)

#pagebreak()

= III. Xây dựng: Độ dốc của mái nhà xưởng

#tln(
  id: "MP-02-RF",
  [Trong hệ tọa độ không gian $O x y z$ (đơn vị đo là mét, mặt đất là mặt phẳng $O x y$), một phần mái dốc nhà xưởng có cấu trúc là một mặt phẳng đi qua ba điểm cố định $A(0, 0, 4)$, $B(6, 0, 4)$, $C(0, 8, 8)$. Tính góc nghiêng (độ dốc) của phần mái nhà này so với mặt đất nằm ngang (làm tròn kết quả đến hàng đơn vị của độ)?],
  [$27$],
  loigiai: [
    #reset-step()
    #ppgiai[Lập phương trình mặt phẳng mái nhà đi qua 3 điểm, tính góc giữa mặt phẳng này với mặt đất $z=0$ bằng công thức cosin.]

    #step[Tìm vectơ pháp tuyến của mặt phẳng mái nhà]
    Ta có:
    $ arrow(A B) = (6, 0, 0) $
    $ arrow(A C) = (0, 8, 4) $
    Tích có hướng của hai vectơ:
    $ arrow(n)_0 = arrow(A B) times arrow(A C) = (0 dot 4 - 0 dot 8, 0 dot 0 - 6 dot 4, 6 dot 8 - 0 dot 0) = (0, -24, 48) $
    Rút gọn ta chọn vectơ pháp tuyến $arrow(n) = (0, -1, 2)$ (cùng phương với $arrow(n)_0$).

    #step[Tính góc dốc $alpha$ so với mặt đất]
    Mặt đất có vectơ pháp tuyến $arrow(k) = (0, 0, 1)$.
    $ cos alpha = frac(|arrow(n) dot arrow(k)|, |arrow(n)| dot |arrow(k)|) = frac(|0 dot 0 + (-1) dot 0 + 2 dot 1|, sqrt(0^2 + (-1)^2 + 2^2) dot 1) = frac(2, sqrt(5)) approx 0.8944 $
    Bấm máy tính tìm góc $alpha$:
    $ alpha = arccos(0.8944) approx 26.565° $
    Làm tròn đến hàng đơn vị của độ ta được $27°$.
    #eg-box(title: "Kết luận")[Độ dốc của mái nhà xưởng là *27* độ.]
  ]
)

#pagebreak()

= IV. Đo đạc & Cảm biến quét Laser phẳng

#tln(
  id: "MP-03-LS",
  [Một thiết bị phát chùm tia laser dẹt tạo ra một mặt phẳng quét có phương trình trong hệ tọa độ $O x y z$ là:
  $ x - 2y + 2z - 9 = 0 $
  Một robot tự hành di chuyển trong không gian có tọa độ tâm cảm biến tại thời điểm $t$ (giây) là $M(t, 2t, 3)$. Tính khoảng cách từ tâm cảm biến của robot đến mặt phẳng quét của thiết bị laser tại thời điểm $t = 2$ giây (mét)?],
  [$3$],
  loigiai: [
    #reset-step()
    #ppgiai[Xác định tọa độ của robot tại thời điểm $t=2$, sau đó áp dụng công thức khoảng cách từ một điểm đến mặt phẳng.]

    #step[Xác định tọa độ robot tại $t=2$]
    Thế $t = 2$ vào công thức tọa độ của $M$:
    $ M(2, 2 dot 2, 3) = M(2, 4, 3) $

    #step[Tính khoảng cách từ điểm $M$ đến mặt phẳng]
    Phương trình mặt phẳng quét: $x - 2y + 2z - 9 = 0$.
    Khoảng cách $d(M, (P))$ là:
    $ d = frac(|2 - 2(4) + 2(3) - 9|, sqrt(1^2 + (-2)^2 + 2^2)) = frac(|2 - 8 + 6 - 9|, sqrt(1 + 4 + 4)) = frac(|-9|, sqrt(9)) = frac(9, 3) = 3 quad (m) $
    #eg-box(title: "Kết luận")[Khoảng cách từ robot đến mặt phẳng quét là *3* mét.]
  ]
)

#pagebreak()

= V. Thiết kế: Góc giao máng xối mái nhà

Khi hai mái dốc giao nhau, chúng tạo thành một giao tuyến là máng xối thoát nước. Việc tính toán góc nhị diện giữa hai mặt phẳng dốc này quyết định loại máng tôn phù hợp để chống rò rỉ.

#tln(
  id: "MP-04-GT",
  [Một nhà xưởng công nghiệp có hai mái dốc phẳng giao nhau. Mái thứ nhất nằm trên mặt phẳng $(P_1): 2x - y + 2z - 4 = 0$. Mái thứ hai nằm trên mặt phẳng $(P_2): x + 2y - 2z - 6 = 0$. Tính góc giữa hai mái nhà dốc này (làm tròn kết quả đến hàng đơn vị của độ)?],
  [$64$],
  loigiai: [
    #reset-step()
    #ppgiai[Xác định các pháp vectơ của hai mặt phẳng và áp dụng công thức tính góc giữa hai mặt phẳng trong Oxyz.]

    #step[Xác định pháp vectơ]
    - Mặt phẳng $(P_1)$ có pháp vectơ: $arrow(n)_1 = (2, -1, 2)$
    - Mặt phẳng $(P_2)$ có pháp vectơ: $arrow(n)_2 = (1, 2, -2)$

    #step[Tính cosin của góc $theta$ giữa hai mặt phẳng]
    $ cos theta = frac(|arrow(n)_1 dot arrow(n)_2|, |arrow(n)_1| dot |arrow(n)_2|) = frac(|2(1) + (-1)(2) + 2(-2)|, sqrt(2^2 + (-1)^2 + 2^2) dot sqrt(1^2 + 2^2 + (-2)^2)) $
    $ cos theta = frac(|2 - 2 - 4|, sqrt(9) dot sqrt(9)) = frac(4, 3 dot 3) = frac(4, 9) approx 0.4444 $

    #step[Tính góc $theta$]
    $ theta = arccos(frac(4, 9)) approx 63.612° $
    Làm tròn kết quả đến hàng đơn vị của độ ta được $64°$.
    #eg-box(title: "Kết luận")[Góc dốc giữa hai mái nhà là *64* độ.]
  ]
)

#pagebreak()

= VI. Hàng không: Mặt phẳng tiếp cận hạ cánh (Glide Slope)

Để đảm bảo máy bay hạ cánh an toàn trong điều kiện sương mù hoặc thiếu sáng, đài kiểm soát không lưu thiết lập một mặt phẳng dẫn đường điện tử (Glide slope plane) để máy bay bám theo.

#tln(
  id: "MP-05-GS",
  [Trong hệ tọa độ không gian $O x y z$ (đơn vị đo là mét), một mặt phẳng hạ cánh an toàn $(P)$ được thiết lập có phương trình:
  $ 2x - 2y + z = 0 $
  Một máy bay chiến đấu đang bay tiếp cận đường băng theo đường thẳng có phương trình tham số:
  $ x = 100 + 4t , quad y = 50 + 5t , quad z = 100 - 9t quad (t >= 0) $
  Tính khoảng cách từ máy bay đến mặt phẳng hạ cánh $(P)$ tại thời điểm $t = 10$ giây kể từ lúc bắt đầu đo đạc (mét)?],
  [$30$],
  loigiai: [
    #reset-step()
    #ppgiai[Tìm tọa độ máy bay tại thời điểm $t=10$, sau đó tính khoảng cách từ điểm đó đến mặt phẳng $(P)$ bằng công thức khoảng cách từ điểm đến mặt phẳng.]

    #step[Xác định tọa độ máy bay tại $t=10$]
    Thế $t = 10$ vào phương trình tham số đường bay của máy bay:
    $ x = 100 + 4(10) = 140 $
    $ y = 50 + 5(10) = 100 $
    $ z = 100 - 9(10) = 10 $
    Vậy tại thời điểm $t=10$, máy bay ở tọa độ điểm $M(140, 100, 10)$.

    #step[Tính khoảng cách từ điểm $M$ đến mặt phẳng $(P)$]
    Mặt phẳng $(P): 2x - 2y + z = 0$ có pháp vectơ $arrow(n) = (2, -2, 1)$.
    Khoảng cách từ máy bay đến mặt phẳng $(P)$ là:
    $ d(M, (P)) = frac(|2(140) - 2(100) + 10|, sqrt(2^2 + (-2)^2 + 1^2)) = frac(|280 - 200 + 10|, sqrt(4 + 4 + 1)) = frac(90, 3) = 30 quad (m) $
    #eg-box(title: "Kết luận")[Khoảng cách từ máy bay đến mặt phẳng hạ cánh là *30* mét.]
  ]
)

#pagebreak()

= VII. Quang học & Địa chất học

Trong đồ họa máy tính và địa chất, phương trình mặt phẳng đóng vai trò cốt lõi để tính toán tia phản xạ của ánh sáng hoặc cấu trúc cắt lớp của Trái đất.

#tln(
  id: "MP-08-REFLECT",
  [Trong một mô hình đồ họa máy tính 3D, một tia laser được phát ra từ nguồn $S(1, 2, 3)$ và chiếu thẳng đến một mặt gương phẳng $(P)$ có phương trình $x + y + z - 3 = 0$. Điểm chạm của tia laser trên mặt gương là $I(1, 1, 1)$. Biết rằng tia phản xạ nằm trên đường thẳng đi qua $I$ và điểm đối xứng $S'$ của $S$ qua mặt phẳng $(P)$. Tìm tổng các tọa độ của điểm $S'$.],
  [$0$],
  loigiai: [
    #reset-step()
    #ppgiai[Tìm hình chiếu vuông góc của $S$ lên mặt phẳng $(P)$, sau đó sử dụng công thức trung điểm để tìm điểm đối xứng $S'$.]

    #step[Tìm hình chiếu vuông góc H của S lên (P)]
    Gọi $d$ là đường thẳng đi qua $S(1, 2, 3)$ và vuông góc với $(P)$.
    Vectơ chỉ phương của $d$ chính là pháp vectơ của $(P)$: $arrow(u)_d = arrow(n)_P = (1, 1, 1)$.
    Phương trình tham số của $d$:
    $ x = 1 + t , quad y = 2 + t , quad z = 3 + t $
    Hình chiếu $H$ là giao điểm của $d$ và $(P)$. Thế $x, y, z$ vào phương trình $(P)$:
    $ (1+t) + (2+t) + (3+t) - 3 = 0 <=> 3t + 3 = 0 => t = -1 $
    Tọa độ hình chiếu $H$:
    $ x_H = 1 + (-1) = 0 , quad y_H = 2 + (-1) = 1 , quad z_H = 3 + (-1) = 2 $
    Vậy $H(0, 1, 2)$.

    #step[Tìm điểm đối xứng S']
    Vì $H$ là trung điểm của đoạn thẳng $S S'$, tọa độ $S'(x', y', z')$ thỏa mãn:
    $ x' = 2x_H - x_S = 2(0) - 1 = -1 $
    $ y' = 2y_H - y_S = 2(1) - 2 = 0 $
    $ z' = 2z_H - z_S = 2(2) - 3 = 1 $
    Vậy điểm đối xứng $S'$ có tọa độ là $(-1, 0, 1)$.

    #step[Tính tổng tọa độ]
    Tổng các tọa độ của $S'$ là:
    $ x' + y' + z' = (-1) + 0 + 1 = 0 $
    #eg-box(title: "Kết luận")[Tổng các tọa độ của $S'$ là *0*.]
  ]
)

#v(1.5em)

#ds(
  id: "MP-09-GEOL",
  [Tại một mỏ than, các kỹ sư khảo sát được hai vỉa than giao nhau tạo thành một đường đứt gãy. Vỉa thứ nhất nằm trên mặt phẳng $(alpha): 2x - y + 2z - 5 = 0$. Vỉa thứ hai nằm trên mặt phẳng $(beta): x + 2y - 2z + 1 = 0$ (tọa độ đo bằng đơn vị 10 mét). Xét tính đúng/sai của các phát biểu sau:],
  (
    True([Vectơ pháp tuyến của vỉa than thứ nhất là $arrow(n)_1 = (2, -1, 2)$ và của vỉa thứ hai là $arrow(n)_2 = (1, 2, -2)$.]),
    True([Giao tuyến của hai vỉa than này (đường đứt gãy) có vectơ chỉ phương $arrow(u) = (-2, 6, 5)$.]),
    False([Góc nghiêng giữa hai vỉa than này bằng $90°$ (tức là hai vỉa vuông góc với nhau).]),
    True([Khoảng cách từ một trạm quan trắc $M(1, 1, 1)$ đến vỉa than thứ nhất là đúng bằng khoảng cách từ trạm đó đến vỉa than thứ hai.]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát pháp vectơ, tính góc giữa hai mặt phẳng, tìm chỉ phương giao tuyến và tính khoảng cách.]

    #step[Pháp vectơ (Ý a)]
    Hiển nhiên từ phương trình mặt phẳng, ta có $arrow(n)_1 = (2, -1, 2)$ và $arrow(n)_2 = (1, 2, -2)$. Nhận định a) *Đúng*.

    #step[Chỉ phương của giao tuyến (Ý b)]
    Đường thẳng giao tuyến vuông góc với cả hai pháp vectơ, nên vectơ chỉ phương của nó bằng tích có hướng:
    $ arrow(u) = arrow(n)_1 times arrow(n)_2 = ( (-1)(-2) - 2(2) , 2(1) - 2(-2) , 2(2) - (-1)(1) ) $
    $ arrow(u) = (2 - 4 , 2 + 4 , 4 + 1) = (-2, 6, 5) $
    Nhận định b) *Đúng*.

    #step[Góc giữa hai mặt phẳng (Ý c)]
    Cosin góc $theta$ giữa hai mặt phẳng:
    $ cos theta = frac(|arrow(n)_1 dot arrow(n)_2|, |arrow(n)_1| dot |arrow(n)_2|) = frac(|2(1) + (-1)(2) + 2(-2)|, sqrt(2^2 + (-1)^2 + 2^2) dot sqrt(1^2 + 2^2 + (-2)^2)) $
    $ cos theta = frac(|2 - 2 - 4|, 3 dot 3) = frac(4, 9) $
    Vì $cos theta = 4/9 != 0$, hai vỉa than không vuông góc với nhau ($theta approx 63.6°$). Nhận định c) *Sai*.

    #step[Khoảng cách từ trạm M(1, 1, 1) (Ý d)]
    Khoảng cách đến $(alpha)$:
    $ d(M, alpha) = frac(|2(1) - 1 + 2(1) - 5|, sqrt(2^2 + (-1)^2 + 2^2)) = frac(|2 - 1 + 2 - 5|, 3) = frac(|-2|, 3) = frac(2, 3) $
    Khoảng cách đến $(beta)$:
    $ d(M, beta) = frac(|1 + 2(1) - 2(1) + 1|, sqrt(1^2 + 2^2 + (-2)^2)) = frac(|1 + 2 - 2 + 1|, 3) = frac(|2|, 3) = frac(2, 3) $
    Hai khoảng cách bằng nhau. Nhận định d) là *Đúng*.
  ]
)

#pagebreak()

= VIII. Bài tập trắc nghiệm & Đúng/Sai tổng hợp

#tn(
  id: "MP-06-WT",
  [Một bức tường kính nghiêng của một trung tâm thương mại hiện đại được cố định bởi ba chân đỡ nằm trên ba trục tọa độ của hệ trục Oxyz là $A(2, 0, 0)$, $B(0, 3, 0)$ và $C(0, 0, 4)$ (đơn vị: mét). Phương trình mặt phẳng chứa bức tường kính này là:],
  (
    [$6x + 4y + 3z - 12 = 0$],
    [$6x + 4y + 3z + 12 = 0$],
    [$2x + 3y + 4z - 1 = 0$],
    [$x + y + z - 9 = 0$],
  ),
  correct: (1,),
  loigiai: [
    #reset-step()
    #ppgiai[Sử dụng phương trình mặt phẳng theo đoạn chắn đi qua ba điểm trên ba trục tọa độ.]

    #step[Thiết lập phương trình đoạn chắn]
    Do mặt phẳng đi qua ba điểm $A(2,0,0)$ trên trục $O x$, $B(0,3,0)$ trên trục $O y$, và $C(0,0,4)$ trên trục $O z$, phương trình mặt phẳng có dạng đoạn chắn:
    $ frac(x, 2) + frac(y, 3) + frac(z, 4) = 1 $

    #step[Quy đồng và rút gọn]
    Quy đồng mẫu số chung là $12$:
    $ 6x + 4y + 3z = 12 <=> 6x + 4y + 3z - 12 = 0 $
    #eg-box(title: "Kết luận")[Phương trình mặt phẳng chứa bức tường là $6x + 4y + 3z - 12 = 0$. Chọn phương án A.]
  ]
)

#v(1.5em)

#ds(
  id: "MP-07-SP2",
  [Một tấm pin năng lượng mặt trời được lắp đặt cố định trên mặt phẳng có phương trình $(P): x + y + sqrt(2) z - 4 = 0$ trong hệ tọa độ Oxyz (đơn vị: mét). Hướng các tia nắng chiếu thẳng xuống song song với một vectơ chỉ phương $arrow(u)$. Xét tính đúng/sai của các nhận định sau đây:],
  (
    True([Vectơ pháp tuyến của mặt phẳng chứa tấm pin mặt trời có tọa độ $arrow(n) = (1, 1, sqrt(2))$.]),
    True([Góc chiếu sáng của tia nắng lên tấm pin mặt trời chính là góc giữa đường thẳng chứa tia nắng (có vectơ chỉ phương $arrow(u)$) và mặt phẳng tấm pin $(P)$.]),
    True([Nếu các tia nắng chiếu theo hướng có vectơ chỉ phương $arrow(u) = (-1, -1, -sqrt(2))$, thì tia nắng chiếu vuông góc (góc chiếu bằng $90°$) lên tấm pin.]),
    False([Nếu các tia nắng chiếu theo hướng song song với trục hoành tức là có chỉ phương $arrow(u) = (1, 0, 0)$, thì góc chiếu sáng của tia nắng lên tấm pin bằng $45°$.]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Xác định pháp vectơ $arrow(n)$ của mặt phẳng pin, sử dụng công thức tính góc giữa đường thẳng và mặt phẳng thông qua sin góc giữa pháp vectơ và chỉ phương.]

    #step[Tìm vectơ pháp tuyến (Ý a)]
    Từ phương trình mặt phẳng $(P): x + y + sqrt(2)z - 4 = 0$, ta có vectơ pháp tuyến là $arrow(n) = (1, 1, sqrt(2))$. Nhận định a) là *Đúng*.

    #step[Ý nghĩa góc chiếu sáng (Ý b)]
    Góc chiếu sáng của tia nắng lên bề mặt phẳng chính là góc giữa đường thẳng chỉ hướng tia nắng và mặt phẳng đó. Nhận định b) là *Đúng*.

    #step[Xét tia nắng chiếu vuông góc (Ý c)]
    Nếu tia nắng chiếu theo hướng $arrow(u) = (-1, -1, -sqrt(2)) = -arrow(n)$, tức là chỉ phương của tia nắng ngược hướng (cùng phương) với vectơ pháp tuyến của mặt phẳng tấm pin. Do đó tia nắng sẽ chiếu vuông góc lên tấm pin (góc chiếu $90°$). Nhận định c) là *Đúng*.

    #step[Tính góc chiếu khi tia nắng đi dọc trục hoành (Ý d)]
    Khi $arrow(u) = (1, 0, 0)$, gọi $phi$ là góc chiếu ($0° <= phi <= 90°$):
    $ sin phi = frac(|arrow(u) dot arrow(n)|, |arrow(u)| dot |arrow(n)|) = frac(|1(1) + 0(1) + 0(sqrt(2))|, sqrt(1^2 + 0^2 + 0^2) dot sqrt(1^2 + 1^2 + (sqrt(2))^2)) = frac(1, 1 dot sqrt(4)) = frac(1, 2) $
    Suy ra $phi = 30°$. Do đó góc chiếu sáng bằng $30°$, chứ không phải $45°$. Nhận định d) là *Sai*.
  ]
)
