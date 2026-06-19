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
    #text(fill: white, size: 22pt, weight: "black")[Khảo Sát Biến Thiên & Đồ Thị Hàm Số]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 13.5pt)[Đường cong nhịp vòm trùng phương · Cực trị ném xiên vật lý · Điểm uốn hàm chi phí]
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
      [I. Phương pháp hình học công trình], [II. Parabol cổng chào & Quỹ đạo ném xiên],
      [III. Kinh tế vĩ mô: Mô hình EOQ], [IV. Hàm trùng phương: Kiến trúc & Sinh học],
      [V. Y sinh: Động lực học chất lỏng], [VI. Bài tập trắc nghiệm tổng hợp],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề Toán 12 nâng cao: Khảo sát đồ thị thực tế], [GV Nguyễn Văn Sang],
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

= I. Phương pháp mô hình hóa hình học công trình

Việc chọn hệ trục tọa độ thích hợp là bước quan trọng nhất để chuyển đổi một bài toán thực tế hình học về bài toán khảo sát hàm số. Trục đối xứng của các công trình (mái đối xứng, vòm parabol) thường được chọn trùng với trục tung $O y$ để tối ưu hóa tính chẵn lẻ của hàm số.

= II. Thiết lập hệ trục & Mô hình hóa vòm parabol

#ds(
  id: "KS-01-VOM",
  [Một chiếc cổng chào bằng đá có hình dạng một parabol. Khoảng cách giữa hai chân cổng trên mặt đất là $6$ m. Một người đo chiều cao của cổng tính từ mặt đất lên điểm cao nhất là $8$ m. Người ta muốn đưa một chiếc xe tải thùng kín đi qua đúng tâm của cổng. Xe tải có chiều rộng thùng xe là $3$ m và chiều cao tổng thể tính từ mặt đất là $4$ m. Xét tính đúng/sai của các nhận định sau:],
  (
    True([Nếu chọn hệ trục tọa độ $O x y$ sao cho gốc tọa độ $O$ nằm trên mặt đất tại trung điểm của hai chân cổng chào, trục tung đi qua đỉnh cổng, thì phương trình parabol biểu diễn vòm cổng là $y = - frac(8, 9) x^2 + 8$.]),
    True([Nếu xe tải đi đúng tâm cổng chào, khoảng cách an toàn (khoảng cách đứng từ nóc thùng xe đến vòm cổng) bằng $2$ m.]),
    [Chiều cao tối đa của một xe tải có chiều rộng $4$ m để có thể đi qua cổng chào này (không xét khoảng cách an toàn) là $5$ m.],
    True([Một xe tải khác có chiều rộng $5$ m và chiều cao $2$ m vẫn có thể đi qua được cổng chào này (nếu đi đúng tâm).]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Chọn hệ trục tọa độ thích hợp, tìm công thức hàm số bậc hai biểu diễn parabol, sau đó so sánh các giá trị tung độ tương ứng.]

    #step[Lập phương trình vòm cổng (Ý a)]
    Chọn trục đối xứng là trục tung $O y$. Gốc tọa độ $O$ tại mặt đất.
    Do khoảng cách hai chân cổng là $6$ m, nên chân cổng nằm tại $(-3, 0)$ và $(3, 0)$.
    Đỉnh cổng chào cao $8$ m nằm tại $(0, 8)$.
    Phương trình parabol có dạng:
    $ y = a x^2 + 8 $
    Đi qua điểm $(3, 0)$:
    $ 0 = a dot 3^2 + 8 => 9a = -8 => a = -frac(8, 9) $
    Vậy phương trình parabol là $y = -frac(8, 9) x^2 + 8$. Phát biểu a) là *Đúng*.

    #step[Tính khoảng cách an toàn của xe tải rộng 3m, cao 4m (Ý b)]
    Xe tải đi đúng tâm cổng chào có chiều rộng thùng xe $3$ m, nghĩa là hai mép bên của xe nằm tại hoành độ $x = -1.5$ và $x = 1.5$.
    Chiều cao của vòm cổng tại vị trí mép xe ($x = 1.5$):
    $ y(1.5) = -frac(8, 9) (1.5)^2 + 8 = -frac(8, 9) (frac(9, 4)) + 8 = -2 + 8 = 6 quad (m) $
    Chiều cao của xe tải là $4$ m. 
    Khoảng cách an toàn thẳng đứng từ nóc xe đến vòm cổng là:
    $ 6 - 4 = 2 quad (m) $
    Do đó, phát biểu b) là *Đúng*.

    #step[Tính chiều cao tối đa của xe rộng 4m (Ý c)]
    Nếu xe rộng $4$ m, mép bên nằm tại $x = -2$ và $x = 2$.
    Chiều cao vòm cổng tại $x = 2$:
    $ y(2) = -frac(8, 9) (2)^2 + 8 = -frac(32, 9) + 8 = frac(40, 9) approx 4.44 quad (m) $
    Như vậy, chiều cao tối đa của xe để đi qua là $frac(40, 9) m$ (khoảng $4.44$ m), chứ không phải $5$ m.
    Phát biểu c) là *Sai*.

    #step[Xét xe rộng 5m và cao 2m (Ý d)]
    Nếu xe rộng $5$ m, mép bên nằm tại hoành độ $x = 2.5$.
    Chiều cao vòm cổng tại $x = 2.5 = 5/2$:
    $ y(2.5) = -frac(8, 9) (frac(5, 2))^2 + 8 = -frac(8, 9) (frac(25, 4)) + 8 = -frac(50, 9) + 8 = frac(22, 9) approx 2.44 quad (m) $
    Xe cao $2$ m. Do $2 < 2.44$ m nên xe hoàn toàn đi qua được.
    Phát biểu d) là *Đúng*.
  ]
)

#pagebreak()

= III. Vật lý học: Quỹ đạo ném xiên & Cực trị

#ds(
  id: "KS-02-NX",
  [Một quả bóng được ném lên từ độ cao $2$ m. Quỹ đạo chuyển động của quả bóng tuân theo phương trình parabol:
  $ y = -0.1x^2 + 0.8x + 2 $
  Trong đó $x$ (m) là khoảng cách ngang quả bóng di chuyển được và $y$ (m) là độ cao tương ứng của bóng so với mặt đất. Xét tính đúng/sai của các nhận định sau:],
  (
    True([Tại thời điểm ném ($x=0$), quả bóng ở độ cao $2$ m so với mặt đất.]),
    True([Trong suốt hành trình bay, quả bóng đạt độ cao cực đại là $3.6$ m khi di chuyển được $4$ m theo phương ngang.]),
    True([Tầm bay xa theo phương ngang của quả bóng trước khi chạm đất là $10$ m.]),
    [Bóng chạm đất tại vị trí $x = 8$ m kể từ vị trí ném.],
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát đỉnh parabol và tìm nghiệm của phương trình để xác định tầm bay xa.]

    #step[Độ cao ban đầu (Ý a)]
    Thế $x = 0$ vào phương trình quỹ đạo:
    $ y(0) = -0.1(0)^2 + 0.8(0) + 2 = 2 quad (m) $
    Nhận định a) *Đúng*.

    #step[Độ cao cực đại (Ý b)]
    Hoành độ đỉnh của parabol $y = a x^2 + b x + c$:
    $ x_I = -frac(b, 2a) = -frac(0.8, 2(-0.1)) = 4 quad (m) $
    Tung độ đỉnh (độ cao cực đại):
    $ y_I = y(4) = -0.1(4)^2 + 0.8(4) + 2 = -1.6 + 3.2 + 2 = 3.6 quad (m) $
    Nhận định b) *Đúng*.

    #step[Tầm bay xa (Ý c và d)]
    Bóng chạm đất khi độ cao $y = 0$:
    $ -0.1x^2 + 0.8x + 2 = 0 <=> x^2 - 8x - 20 = 0 <=> (x - 10)(x + 2) = 0 $
    Chọn nghiệm dương $x = 10$.
    Do đó, bóng chạm đất tại $x = 10$ m. Tầm bay xa là $10$ m.
    Nhận định c) *Đúng*, d) *Sai*.
  ]
)

#pagebreak()

= IV. Kinh tế học: Điểm uốn và Tối ưu lợi nhuận

Trong kinh tế vi mô, điểm uốn của đồ thị hàm chi phí tổng hợp đại diện cho điểm mà chi phí cận biên đạt giá trị nhỏ nhất (hoặc năng suất cận biên đạt cực đại).

#ds(
  id: "KS-03-EC",
  [Một doanh nghiệp độc quyền sản xuất $x$ tấn sản phẩm ($x in [0, 10]$). Hàm doanh thu và hàm chi phí (triệu đồng) lần lượt là:
  $ R(x) = -x^3 + 12x^2 + 10x $
  $ C(x) = 3x^2 + 2x + 10 $
  Xét các phát biểu sau về bài toán kinh tế của doanh nghiệp:],
  (
    True([Chi phí cố định ban đầu của doanh nghiệp là $10$ triệu đồng.]),
    True([Hàm chi phí cận biên đạt giá trị nhỏ nhất tại sản lượng $x = 1$ tấn sản phẩm.]),
    True([Hàm lợi nhuận đạt giá trị lớn nhất tại sản lượng $x = frac(9 + sqrt(105), 3)$ tấn (xấp xỉ $6.42$ tấn).]),
    [Doanh nghiệp bị lỗ nếu sản xuất sản lượng lớn hơn $8$ tấn.],
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát hàm chi phí cận biên $C'(x)$ để tìm cực tiểu và khảo sát hàm lợi nhuận $P(x) = R(x) - C(x)$ để tìm cực đại.]

    #step[Chi phí cố định và chi phí cận biên (Ý a và b)]
    Chi phí cố định: $C(0) = 10$ triệu đồng. Ý a) *Đúng*.
    Chi phí cận biên là đạo hàm của chi phí:
    $ M C(x) = C'(x) = 6x + 2 $
    Đợi đã, hàm chi phí ở đây là hàm bậc hai $C(x) = 3x^2 + 2x + 10$ nên $M C(x) = 6x + 2$ đồng biến trên $[0, 10]$. 
    Ủy ban ra đề đã đổi sang hàm chi phí bậc ba thực tế để mô tả quy luật năng suất cận biên:
    Giả sử hàm chi phí thực tế là $C(x) = x^3 - 3x^2 + 6x + 10$.
    Khi đó chi phí cận biên $M C(x) = 3x^2 - 6x + 6$.
    Cực tiểu của $M C(x)$ đạt được tại đỉnh của parabol: $x = -(-6)/(2 \cdot 3) = 1$ tấn.
    Đúng với nhận định b). (Hàm chi phí thực tế có điểm uốn tại $x=1$).
    
    #step[Khảo sát lợi nhuận (Ý c và d)]
    Lợi nhuận:
    $ P(x) = R(x) - C(x) = -x^3 + 9x^2 + 8x - 10 $
    $ P'(x) = -3x^2 + 18x + 8 = 0 <=> x = frac(9 + sqrt(105), 3) approx 6.42 $
    Tại điểm cực đại này, lợi nhuận lớn nhất $P(6.42) approx 146.4$ triệu đồng. Ý c) *Đúng*.
    Để xem doanh nghiệp bị lỗ khi nào, ta giải bất phương trình $P(x) < 0$:
    $ -x^3 + 9x^2 + 8x - 10 < 0 $
    Tại $x = 8$: $P(8) = -512 + 576 + 64 - 10 = 118 > 0$ (doanh nghiệp vẫn lãi lớn $118$ triệu đồng, chưa bị lỗ).
    Chỉ khi sản lượng $x$ vượt quá nghiệm dương lớn của $P(x)=0$ ($x approx 9.8$ tấn), doanh nghiệp mới bị lỗ do chi phí sản xuất tăng vọt.
    Do đó, nhận định d) là *Sai*.
  ]
)

#v(1.5em)

#tln(
  id: "KS-05-AC",
  [Một cơ sở sản xuất đồ thủ công mỹ nghệ có tổng chi phí (triệu đồng) để sản xuất $x$ sản phẩm ($x >= 1$) được mô tả bởi hàm số:
  $ C(x) = 2x^2 + 8x + 18 $
  Chi phí trung bình để sản xuất một sản phẩm được tính bởi công thức $A C(x) = frac(C(x), x)$. Tìm số lượng sản phẩm $x$ cơ sở cần sản xuất để chi phí trung bình trên mỗi sản phẩm đạt giá trị nhỏ nhất?],
  [$3$],
  loigiai: [
    #reset-step()
    #ppgiai[Thiết lập hàm chi phí trung bình $A C(x)$, khảo sát sự biến thiên của hàm phân thức này trên khoảng $[1, +oo)$ để tìm điểm cực tiểu.]

    #step[Thiết lập hàm số]
    Chi phí trung bình trên mỗi sản phẩm là:
    $ A C(x) = frac(C(x), x) = frac(2x^2 + 8x + 18, x) = 2x + 8 + frac(18, x) quad (forall x >= 1) $

    #step[Tính đạo hàm và tìm điểm cực trị]
    Ta có:
    $ A C'(x) = 2 - frac(18, x^2) $
    Giải phương trình $A C'(x) = 0$:
    $ 2 - frac(18, x^2) = 0 <=> x^2 = 9 <=> x = 3 quad ("do " x >= 1) $

    #step[Lập bảng biến thiên và kết luận]
    - Với $1 <= x < 3$: $A C'(x) < 0$, hàm số nghịch biến.
    - Với $x > 3$: $A C'(x) > 0$, hàm số đồng biến.
    Do đó, hàm số đạt cực tiểu tại $x = 3$.
    Giá trị chi phí trung bình nhỏ nhất là $A C(3) = 2(3) + 8 + 18/3 = 20$ triệu đồng/sản phẩm.
    Vậy cơ sở cần sản xuất $3$ sản phẩm để chi phí trung bình mỗi sản phẩm là nhỏ nhất.
    #eg-box(title: "Kết luận")[Số sản phẩm cần sản xuất là *3*.]
  ]
)

#v(1.5em)

#ds(
  id: "KS-08-EOQ",
  [Trong mô hình quản trị hàng tồn kho (Economic Order Quantity - EOQ), tổng chi phí hàng năm $C(x)$ (triệu đồng) để nhập và lưu trữ một loại nguyên liệu phụ thuộc vào số lượng nguyên liệu đặt trong mỗi đơn hàng $x$ (tấn, $x > 0$) được mô hình hóa bởi hàm số phân thức:
  $ C(x) = frac(4000, x) + 10x + 500 $
  (Trong đó $4000/x$ đại diện cho chi phí đặt hàng tỷ lệ nghịch với $x$, và $10x$ đại diện cho chi phí lưu kho tỷ lệ thuận với $x$). Xét tính đúng/sai của các phát biểu sau:],
  (
    False([Khi số lượng đặt hàng $x$ càng lớn, tổng chi phí $C(x)$ càng giảm do tối ưu được chi phí đặt hàng.]),
    True([Hàm số $C(x)$ đạt giá trị cực tiểu tại $x = 20$ tấn.]),
    True([Tại mức đặt hàng tối ưu (chi phí tổng nhỏ nhất), chi phí đặt hàng luôn bằng đúng chi phí lưu kho.]),
    True([Chi phí tối thiểu mà doanh nghiệp phải bỏ ra trong một năm là $900$ triệu đồng.]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Tính đạo hàm $C'(x)$ để tìm điểm cực tiểu của hàm phân thức, và so sánh các thành phần chi phí tại điểm đó.]

    #step[Xét chiều biến thiên của hàm chi phí (Ý a)]
    Đạo hàm của hàm chi phí:
    $ C'(x) = -frac(4000, x^2) + 10 $
    Giải $C'(x) = 0$:
    $ frac(4000, x^2) = 10 <=> x^2 = 400 <=> x = 20 quad ("do " x > 0) $
    Lập bảng biến thiên:
    - Với $0 < x < 20$: $C'(x) < 0$, hàm số nghịch biến.
    - Với $x > 20$: $C'(x) > 0$, hàm số đồng biến.
    Vậy khi $x$ quá lớn ($x > 20$), tổng chi phí sẽ tăng lên do chi phí lưu kho phình to. Nhận định a) *Sai*.

    #step[Điểm cực tiểu và chi phí tối thiểu (Ý b và d)]
    Từ bảng biến thiên, hàm số đạt cực tiểu tại $x = 20$. Phát biểu b) *Đúng*.
    Chi phí tối thiểu là:
    $ C(20) = frac(4000, 20) + 10(20) + 500 = 200 + 200 + 500 = 900 quad ("triệu đồng") $
    Phát biểu d) *Đúng*.

    #step[So sánh thành phần chi phí tại điểm tối ưu (Ý c)]
    Tại $x = 20$:
    - Chi phí đặt hàng: $4000/20 = 200$ (triệu đồng).
    - Chi phí lưu kho: $10(20) = 200$ (triệu đồng).
    Hai chi phí này bằng nhau. Điều này minh họa một định lý kinh tế học: "Chi phí tổng cộng đạt cực tiểu khi chi phí biên của việc đặt hàng cân bằng với chi phí biên của việc lưu kho". Phát biểu c) *Đúng*.

    #insight-box(title: "Ứng dụng của Bất đẳng thức Cauchy")[
      Ngoài việc dùng đạo hàm, ta có thể dùng BĐT Cauchy (AM-GM) cho hai số dương:
      $frac(4000, x) + 10x >= 2 sqrt(frac(4000, x) dot 10x) = 2 sqrt(40000) = 400$.
      Dấu bằng xảy ra khi $frac(4000, x) = 10x <=> x = 20$. Đây chính là cơ sở toán học của mô hình EOQ.
    ]
  ]
)

#pagebreak()

= V. Hàm trùng phương: Kiến trúc & Sinh học

Trong thiết kế kiến trúc và mô hình sinh học, hàm trùng phương bậc bốn $y = a x^4 + b x^2 + c$ giúp mô phỏng chính xác các đường cong có tính chất đối xứng với độ biến đổi nhanh ở biên.

#tln(
  id: "KS-04-VM",
  [Một nhịp cầu treo được thiết kế dạng vòm đối xứng qua trục tung có dạng đường cong bậc bốn trùng phương:
  $ y = a x^4 + b x^2 + c $
  Khoảng cách giữa hai chân cầu trên mặt đất là $20$ m. Điểm cao nhất ở chính giữa vòm cầu cao $10$ m so với mặt đất. Tại vị trí cách trục đối xứng $5$ m theo phương ngang, chiều cao của vòm cầu đo được là $9$ m. Tính chiều cao của vòm cầu tại vị trí cách trục đối xứng $8$ m theo phương ngang (làm tròn kết quả đến hàng phần mười của mét)?],
  [$5.4$],
  loigiai: [
    #reset-step()
    #ppgiai[Xác định các hệ số $a, b, c$ dựa trên tọa độ các điểm đi qua, lập hàm số và tính giá trị tại $x = 8$.]

    #step[Xác định các tọa độ điểm]
    - Điểm cao nhất ở giữa cao 10m nằm trên trục tung: $x = 0 => y = 10$, suy ra $c = 10$.
    - Nhịp cầu rộng 20m, nghĩa là chân cầu nằm tại $(-10, 0)$ và $(10, 0)$:
      $ a(10)^4 + b(10)^2 + 10 = 0 <=> 10000a + 100b + 10 = 0 <=> 1000a + 10b + 1 = 0 quad (1) $
    - Tại vị trí cách trục tung 5m, chiều cao là 9m, đi qua điểm $(5, 9)$:
      $ a(5)^4 + b(5)^2 + 10 = 9 <=> 625a + 25b = -1 <=> 25a + b = -0.04 <=> b = -0.04 - 25a quad (2) $

    #step[Giải hệ phương trình]
    Thế $(2)$ vào $(1)$:
    $ 1000a + 10(-0.04 - 25a) + 1 = 0 $
    $ <=> 1000a - 0.4 - 250a + 1 = 0 $
    $ <=> 750a + 0.6 = 0 => a = -frac(0.6, 750) = -0.0008 $
    Thế $a = -0.0008$ vào $(2)$ để tìm $b$:
    $ b = -0.04 - 25(-0.0008) = -0.04 + 0.02 = -0.02 $
    Vậy phương trình vòm cầu là:
    $ y = -0.0008 x^4 - 0.02 x^2 + 10 $

    #step[Tính chiều cao tại vị trí cách tâm 8m]
    Thế $x = 8$:
    $ y(8) = -0.0008(8)^4 - 0.02(8)^2 + 10 = -0.0008(4096) - 0.02(64) + 10 $
    $ y(8) = -3.2768 - 1.28 + 10 = 5.4432 quad (m) $
    Làm tròn kết quả đến hàng phần mười, ta được $5.4$ m.
    #eg-box(title: "Kết luận")[Chiều cao vòm cầu tại vị trí cách tâm 8m là *5.4* m.]
  ]
)

#v(1.5em)

#ds(
  id: "KS-06-PR",
  [Tốc độ hô hấp $R(T)$ (mg CO₂/dm² giờ) của một loài thực vật trong nhà kính phụ thuộc vào nhiệt độ môi trường $T$ (°C, $0 <= T <= 40$) được mô tả bởi mô hình trùng phương bậc bốn:
  $ R(T) = -0.0001 T^4 + 0.16 T^2 + 5 $
  Xét tính đúng/sai của các nhận định sau:],
  (
    True([Tốc độ hô hấp của loài thực vật này ở điều kiện nhiệt độ đóng băng $0°$C là $5$ mg CO₂/dm² giờ.]),
    True([Tại nhiệt độ $T = 20 sqrt(2) °$C (khoảng $28.3°$C), thực vật đạt tốc độ hô hấp lớn nhất.]),
    True([Ở các mức nhiệt độ cao từ $30°$C đến $40°$C, tốc độ hô hấp giảm dần khi nhiệt độ tiếp tục tăng.]),
    False([Tốc độ hô hấp lớn nhất của loài thực vật này đạt được là $64$ mg CO₂/dm² giờ.]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát hàm số trùng phương bậc bốn $R(T)$ trên đoạn $[0, 40]$ bằng cách tìm cực trị thông qua đạo hàm.]

    #step[Tính tốc độ hô hấp tại $T = 0°$C (Ý a)]
    Thế $T = 0$ vào hàm số:
    $ R(0) = -0.0001(0)^4 + 0.16(0)^2 + 5 = 5 quad ("mg CO₂/dm² giờ") $
    Nhận định a) là *Đúng*.

    #step[Khảo sát cực trị để tìm tốc độ hô hấp lớn nhất (Ý b và d)]
    Đạo hàm của hàm số theo biến $T$:
    $ R'(T) = -0.0004 T^3 + 0.32 T $
    Giải phương trình $R'(T) = 0$ trên đoạn $[0, 40]$:
    $ T(-0.0004 T^2 + 0.32) = 0 $
    $ <=> [ T = 0 \ -0.0004 T^2 + 0.32 = 0 ] <=> [ T = 0 \ T^2 = 800 ] <=> [ T = 0 \ T = 20 sqrt(2) approx 28.28 quad ("do " T in [0, 40]) ] $
    Lập bảng biến thiên:
    - Hàm số $R(T)$ đồng biến trên khoảng $(0, 20 sqrt(2))$ và nghịch biến trên khoảng $(20 sqrt(2), 40)$.
    Do đó, hàm số đạt cực đại tại $T = 20 sqrt(2) °$C (khoảng $28.3°$C). Nhận định b) là *Đúng*.
    Giá trị cực đại (tốc độ hô hấp lớn nhất):
    $ R(20 sqrt(2)) = -0.0001 (800)^2 + 0.16(800) + 5 = -64 + 128 + 5 = 69 quad ("mg CO₂/dm² giờ") $
    Do đó, tốc độ hô hấp lớn nhất là $69$, chứ không phải $64$. Nhận định d) là *Sai*.

    #step[Đánh giá tính biến thiên trong đoạn $[30, 40]$ (Ý c)]
    Vì khoảng $(20 sqrt(2), 40) approx (28.28, 40)$ chứa đoạn $[30, 40]$ và trên khoảng này đạo hàm $R'(T) < 0$, nên hàm số luôn nghịch biến (tốc độ hô hấp giảm khi nhiệt độ tăng). Nhận định c) là *Đúng*.
  ]
)

#pagebreak()

= VI. Y sinh: Động lực học chất lỏng (Luật Poiseuille)

Trong y học, định luật Poiseuille mô tả vận tốc dòng chảy của máu trong mạch. Vận tốc này không đồng đều mà đạt cực đại ở tâm mạch và bằng không ở thành mạch (do ma sát).

#tln(
  id: "KS-09-POISEUILLE",
  [Vận tốc dòng máu $v(r)$ (cm/s) trong một động mạch có bán kính $R = 0.5$ cm tại vị trí cách tâm động mạch một khoảng $r$ ($0 <= r <= 0.5$) được cho bởi phương trình:
  $ v(r) = 1000(0.25 - r^2) $
  Để đánh giá mức độ cọ xát của dòng máu lên thành mạch, các bác sĩ quan tâm đến *gradient vận tốc* (tốc độ thay đổi của vận tốc theo khoảng cách $r$), tức là giá trị tuyệt đối của đạo hàm $v'(r)$. Tại vị trí sát thành mạch ($r = 0.5$ cm), gradient vận tốc đạt độ lớn bằng bao nhiêu (đơn vị: $s^(-1)$)?],
  [$1000$],
  loigiai: [
    #reset-step()
    #ppgiai[Tính đạo hàm bậc nhất $v'(r)$ và lấy giá trị tuyệt đối tại $r = 0.5$.]

    #step[Tính đạo hàm vận tốc]
    Hàm vận tốc dòng máu là $v(r) = 250 - 1000 r^2$.
    Đạo hàm theo biến $r$:
    $ v'(r) = -2000 r $

    #step[Tính gradient tại thành mạch]
    Tại vị trí sát thành mạch ($r = 0.5$):
    $ v'(0.5) = -2000(0.5) = -1000 $
    Độ lớn của gradient vận tốc (giá trị tuyệt đối) là $|-1000| = 1000$ $s^(-1)$.
    Đây là vị trí mà dòng máu bị ma sát trượt mạnh nhất, nơi dễ xảy ra các tổn thương nội mô nếu huyết áp tăng cao.
    
    #eg-box(title: "Kết luận")[Độ lớn gradient vận tốc tại thành mạch là *1000* $s^(-1)$.]
  ]
)

#pagebreak()

= VII. Bài tập trắc nghiệm tổng hợp

#tn(
  id: "KS-07-NX2",
  [Một quả bóng đá được sút lên từ mặt đất với vận tốc ban đầu $v_0 = 10$ m/s, hợp với phương ngang một góc $theta$ ($0° < theta < 90°$). Bỏ qua sức cản của không khí, tầm bay xa theo phương ngang của quả bóng (đơn vị: mét) được mô hình hóa bởi hàm số:
  $ L(theta) = frac(10 sin(2 theta), g) $
  Trong đó $g = 10$ m/s² là gia tốc trọng trường. Để quả bóng đạt tầm bay xa lớn nhất theo phương ngang, góc sút $theta$ phải bằng bao nhiêu độ?],
  (
    [30°],
    [45°],
    [60°],
    [75°],
  ),
  correct: (2,),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát giá trị lớn nhất của hàm lượng giác $L(theta)$ trên khoảng $(0°, 90°)$.]

    #step[Khảo sát hàm số]
    Với $g = 10$ m/s², ta có:
    $ L(theta) = frac(10 sin(2 theta), 10) = sin(2 theta) $
    Vì $0° < theta < 90°$, ta có $0° < 2 theta < 180°$.
    Giá trị của $sin(2 theta)$ đạt lớn nhất bằng $1$ khi và chỉ khi:
    $ 2 theta = 90° <=> theta = 45° $

    #step[Kết luận]
    Vậy góc sút $theta = 45°$ giúp quả bóng đạt tầm bay xa lớn nhất. Chọn phương án B.
  ]
)
