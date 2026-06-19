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
    #text(fill: white, size: 22pt, weight: "black")[Đường Tiệm Cận & Mô Hình Hóa Hệ Thống]
    #v(0.45em)
    #text(fill: rgb("E8EAF6"), size: 13.5pt)[Phân tích giới hạn Y sinh · Động học thuốc hai giai đoạn · Trạng thái cân bằng Logistic]
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
      [I. Bản chất Toán học của Tiệm cận], [II. Y sinh: Dược động học hai giai đoạn],
      [III. Sinh thái: Sức chứa Logistic mở rộng], [IV. Kinh tế & Tâm lý: Đường cong học tập],
      [V. Vật lý & Điện tử: Mạch RC], [VI. Cơ học: Lực căng dây ly tâm],
      [VII. Vật lý Hiện đại & Động học Sinh thái], [VIII. Bài tập trắc nghiệm & điền số ngắn],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("283593"))
    grid(
      columns: (1fr, auto),
      [Chuyên đề Toán 12 nâng cao: Đường tiệm cận thực tế], [GV Nguyễn Văn Sang],
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

= I. Bản chất Toán học của Tiệm cận

Trong các mô hình động học thực tế, các đường tiệm cận không đơn thuần là các đường thẳng hình học, mà chúng đại diện cho các giới hạn vật lý quan trọng:

#rev-box(title: "Tiệm cận Ngang y = y_0")[
  Đại diện cho *Trạng thái dừng ổn định lâu dài* (Steady-state or Carrying Capacity). Khi thời gian $t -> +oo$, hệ thống tự điều chỉnh và tiến về trạng thái cân bằng động $y_0$.
]

#rev-box(title: "Tiệm cận Đứng x = x_0")[
  Đại diện cho *Giới hạn vận hành hoặc Ngưỡng sụp đổ* (Singularity or Safety Boundary). Khi biến số tiến sát đến $x_0$, hệ thống sẽ tăng trưởng bùng nổ hoặc suy giảm không thể kiểm soát, gây mất ổn định vật lý.
]

#pagebreak()

= II. Y sinh học: Dược động học hai giai đoạn (Pharmacokinetics)

Trong thực tế, khi bệnh nhân uống thuốc hoặc tiêm bắp, thuốc cần có thời gian hấp thụ vào máu trước khi bị đào thải. Mô hình dược động học hai giai đoạn mô tả nồng độ thuốc trong máu chính xác hơn mô hình tiêm trực tiếp tĩnh mạch một giai đoạn.

#ds(
  id: "TC-01-PK",
  [Nồng độ thuốc trong máu (mg/L) của một bệnh nhân tại thời điểm $t$ (giờ) sau khi uống một liều thuốc được mô tả bởi mô hình hai giai đoạn (hấp thụ và đào thải):
  $ C(t) = 15(e^(-0.2t) - e^(-0.8t)) quad (t >= 0) $
  Xét tính đúng/sai của các phát biểu sau đây:],
  (
    True([Ngay tại thời điểm uống thuốc ($t=0$), nồng độ thuốc trong máu của bệnh nhân bằng $0$ mg/L.]),
    True([Nồng độ thuốc trong máu đạt giá trị lớn nhất tại thời điểm $t = frac(5 ln 4, 3)$ giờ sau khi uống.]),
    True([Đường thẳng $y = 0$ là đường tiệm cận ngang của đồ thị hàm số $C(t)$ khi $t -> +oo$.]),
    [Hàm số $C(t)$ có một đường tiệm cận đứng là $t = 0$ do nồng độ thuốc thay đổi đột ngột.],
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát đạo hàm để tìm điểm cực đại và tính giới hạn khi $t -> +oo$ để xác định tiệm cận ngang.]

    #step[Xét phát biểu a (Nồng độ ban đầu)]
    Thế $t = 0$ vào hàm số:
    $ C(0) = 15(e^0 - e^0) = 15(1 - 1) = 0 quad ("mg/L") $
    Như vậy, lúc bắt đầu uống thuốc thì thuốc chưa đi vào máu nên nồng độ bằng 0. Phát biểu a) *Đúng*.

    #step[Xét phát biểu b (Thời điểm đạt nồng độ tối đa)]
    Tính đạo hàm của $C(t)$:
    $ C'(t) = 15(-0.2 e^(-0.2t) - (-0.8) e^(-0.8t)) = 15(-0.2 e^(-0.2t) + 0.8 e^(-0.8t)) $
    Giải $C'(t) = 0$:
    $ -0.2 e^(-0.2t) + 0.8 e^(-0.8t) = 0 <=> 0.8 e^(-0.8t) = 0.2 e^(-0.2t) $
    Chia cả hai vế cho $0.2 e^(-0.8t)$:
    $ 4 = frac(e^(-0.2t), e^(-0.8t)) <=> e^(0.6t) = 4 $
    Lấy logarit tự nhiên hai vế:
    $ 0.6t = ln 4 <=> frac(3, 5) t = ln 4 <=> t = frac(5 ln 4, 3) quad ("giờ") $
    Bảng biến thiên cho thấy hàm số đồng biến trước $t = frac(5 ln 4, 3)$ và nghịch biến sau đó. Vậy nồng độ đạt giá trị lớn nhất tại thời điểm này. Phát biểu b) *Đúng*.

    #step[Xét phát biểu c và d (Tiệm cận)]
    Vì $-0.2 < 0$ và $-0.8 < 0$, ta có:
    $ lim_(t -> +oo) e^(-0.2t) = 0 quad "và" quad lim_(t -> +oo) e^(-0.8t) = 0 $
    Do đó:
    $ lim_(t -> +oo) C(t) = 15(0 - 0) = 0 $
    Vậy đường thẳng $y = 0$ (trục hoành) là tiệm cận ngang của đồ thị hàm số khi $t -> +oo$.
    Về mặt sinh học, cơ thể liên tục lọc và đào thải thuốc qua gan/thận khiến nồng độ thuốc trong máu giảm dần về 0. Phát biểu c) *Đúng*.
    Đồ thị hàm số liên tục trên khoảng $[0, +oo)$, không có điểm vô cực nào làm hàm số tiến ra vô cùng, do đó không có tiệm cận đứng. Phát biểu d) *Sai*.

    #insight-box(title: "Trực Giác Sư Phạm")[
      Hàm số dạng hiệu hai hàm mũ $A(e^(-a t) - e^(-b t))$ thường xuất hiện trong các mô hình lan truyền (dịch bệnh, tin đồn, hấp thụ thuốc). Ban đầu bằng 0, đạt đỉnh và tiệm cận về 0 khi thời gian tiến ra vô hạn.
    ]
  ]
)

#ds(
  id: "TC-07-MM",
  [Trong sinh hóa học, tốc độ phản ứng enzyme $v([S])$ (mol/L.s) phụ thuộc vào nồng độ cơ chất $[S]$ (mol/L) được xác định theo mô hình Michaelis-Menten:
  $ v([S]) = frac(0.08 [S], 0.05 + [S]) quad ([S] >= 0) $
  Xét tính đúng/sai của các nhận định sau:],
  (
    True([Khi nồng độ cơ chất $[S] = 0.05$ mol/L, tốc độ phản ứng đạt $0.04$ mol/L.s.]),
    False([Tốc độ phản ứng $v([S])$ giảm dần khi nồng độ cơ chất $[S]$ tăng lên.]),
    True([Đường thẳng $v = 0.08$ là đường tiệm cận ngang của đồ thị hàm số $v([S])$ khi $[S] -> +oo$.]),
    True([Khi nồng độ cơ chất tăng lên cực lớn, tốc độ phản ứng tiến dần về $0.08$ mol/L.s, đại diện cho tốc độ bão hòa phản ứng.]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát giá trị hàm số, đạo hàm và tính giới hạn của hàm số $v([S])$ khi $[S] -> +oo$.]

    #step[Tính tốc độ phản ứng tại $[S] = 0.05$]
    Thế $[S] = 0.05$ vào công thức:
    $ v(0.05) = frac(0.08 dot 0.05, 0.05 + 0.05) = frac(0.004, 0.1) = 0.04 quad ("mol/L.s") $
    Nhận định a) là *Đúng*.

    #step[Xét chiều biến thiên của tốc độ phản ứng]
    Đạo hàm của hàm số $v([S])$ theo biến $[S]$:
    $ v'([S]) = frac(0.08 dot 0.05, (0.05 + [S])^2) = frac(0.004, (0.05 + [S])^2) > 0 quad (forall [S] >= 0) $
    Vì $v'([S]) > 0$ với mọi $[S] >= 0$, hàm số $v([S])$ luôn đồng biến (tốc độ phản ứng tăng dần khi nồng độ cơ chất tăng).
    Nhận định b) là *Sai*.

    #step[Tìm tiệm cận ngang và ý nghĩa giới hạn bão hòa]
    Tính giới hạn khi $[S] -> +oo$:
    $ lim_([S] -> +oo) v([S]) = lim_([S] -> +oo) frac(0.08 [S], 0.05 + [S]) = lim_([S] -> +oo) frac(0.08, frac(0.05, [S]) + 1) = frac(0.08, 0 + 1) = 0.08 $
    Vậy đồ thị hàm số có đường tiệm cận ngang là $v = 0.08$ khi $[S] -> +oo$.
    Về mặt sinh hóa, khi nồng độ cơ chất cực lớn, toàn bộ các trung tâm hoạt động của enzyme đều bị chiếm giữ bởi cơ chất, phản ứng đạt đến trạng thái bão hòa và tốc độ phản ứng tiến sát về giới hạn tối đa $V_(max) = 0.08$ mol/L.s.
    Do đó, nhận định c) và d) đều *Đúng*.
  ]
)

#pagebreak()

#pagebreak()

= III. Sinh thái học: Sức chứa Logistic mở rộng

Trong tự nhiên, một quần thể sinh vật không thể tăng trưởng vô hạn theo mô hình mũ $P(t) = P_0 e^(r t)$ do giới hạn về nguồn sống. Hàm số Logistic phản ánh quy luật này một cách chính xác.

#ds(
  id: "TC-02-LG",
  [Một quần thể cá hồi trong một hồ sinh thái được bảo tồn nghiêm ngặt có số lượng cá thể $P(t)$ sau $t$ tháng được mô hình hóa bởi hàm số:
  $ P(t) = frac(6000, 1 + 5e^(-0.08t)) quad (t >= 0) $
  Xét tính đúng/sai của các nhận định sau:],
  (
    True([Số lượng cá hồi ban đầu khi bắt đầu đưa vào bảo tồn là $1000$ con.]),
    True([Tốc độ tăng trưởng của quần thể cá hồi đạt giá trị lớn nhất tại thời điểm quần thể đạt $3000$ con.]),
    True([Khi thời gian kéo dài vô hạn ($t -> +oo$), số lượng cá thể tối đa mà hồ sinh thái này có thể duy trì (sức chứa môi trường) là $6000$ con.]),
    [Đường thẳng $x = 6000$ là đường tiệm cận ngang của đồ thị hàm số $P(t)$ khi $t -> +oo$.],
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát giá trị tại $t=0$, phân tích tốc độ tăng trưởng (đạo hàm bậc hai để tìm điểm uốn) và tìm giới hạn khi $t -> +oo$ để xác định tiệm cận.]

    #step[Xét phát biểu a (Số lượng ban đầu)]
    Tại $t = 0$:
    $ P(0) = frac(6000, 1 + 5e^0) = frac(6000, 1 + 5) = 1000 quad ("con") $
    Nhận định a) *Đúng*.

    #step[Xét phát biểu b (Tốc độ tăng trưởng cực đại)]
    Tốc độ tăng trưởng của quần thể chính là đạo hàm $P'(t)$. Tốc độ này đạt cực đại tại điểm uốn của đồ thị hàm số $P(t)$.
    Đối với hàm số Logistic dạng $P(t) = frac(K, 1 + A e^(-r t))$, điểm uốn xảy ra khi quần thể đạt đúng một nửa sức chứa tối đa:
    $ P(t) = frac(K, 2) = frac(6000, 2) = 3000 quad ("con") $
    (Ta có thể kiểm tra bằng đạo hàm bậc hai $P''(t) = 0$). Nhận định b) *Đúng*.

    #step[Xét phát biểu c và d (Đường tiệm cận ngang)]
    Giới hạn khi $t -> +oo$:
    $ lim_(t -> +oo) P(t) = lim_(t -> +oo) frac(6000, 1 + 5e^(-0.08t)) = frac(6000, 1 + 5 \cdot 0) = 6000 $
    Do đó, giới hạn tối đa của quần thể là $6000$ con. Đường tiệm cận ngang của đồ thị hàm số là đường thẳng *$y = 6000$*, chứ không phải $x = 6000$ (đây là tiệm cận đứng nếu có).
    Do đó, nhận định c) là *Đúng*, d) là *Sai*.

    #note-box(title: "Ý nghĩa sinh thái")[
      Đường tiệm cận ngang $y = K$ (ở đây $K = 6000$) đại diện cho sức chứa sinh thái của hồ. Dù ban đầu tốc độ sinh sản có lớn, khi quần thể tiến sát đến $6000$, nguồn thức ăn và không gian sống khan hiếm khiến tốc độ sinh trưởng giảm dần về 0.
    ]
  ]
)

#pagebreak()

= IV. Kinh tế & Tâm lý học: Đường cong học tập (Learning Curve)

Đường cong học tập mô tả hiệu suất làm việc hoặc khả năng tiếp thu kiến thức của con người tăng trưởng nhanh lúc đầu, sau đó chậm lại và tiệm cận về một giới hạn sinh lý hoặc năng lực tối đa.

#tln(
  id: "TC-03-LC",
  [Một công nhân mới tuyển dụng vào dây chuyền lắp ráp linh kiện điện tử. Số lượng sản phẩm lắp ráp hoàn chỉnh trung bình mỗi giờ của người công nhân này sau $t$ tuần thực hành được mô hình hóa bởi hàm số:
  $ L(t) = 50 - 35 e^(-0.25t) quad (t >= 0) $
  Khi thời gian thực hành kéo dài vô hạn ($t \to +oo$), năng suất lắp ráp tối đa của người công nhân này tiến dần về bao nhiêu sản phẩm mỗi giờ (đây là đường tiệm cận ngang của đồ thị)?],
  [$50$],
  loigiai: [
    #reset-step()
    #ppgiai[Tính giới hạn của hàm số $L(t)$ khi $t \to +oo$.]

    #step[Tính giới hạn]
    Vì $-0.25 < 0$, ta có:
    $ lim_(t -> +oo) e^(-0.25t) = 0 $
    Do đó:
    $ lim_(t -> +oo) L(t) = lim_(t -> +oo) (50 - 35 e^(-0.25t)) = 50 - 35 \cdot 0 = 50 $

    #step[Kết luận]
    Năng suất lắp ráp tối đa của người công nhân này tiến dần về $50$ sản phẩm mỗi giờ. Đường thẳng $y = 50$ là tiệm cận ngang của đồ thị biểu diễn năng suất.
    #eg-box(title: "Kết luận")[Năng suất tối đa là *50* sản phẩm/giờ.]
  ]
)

#pagebreak()

= V. Vật lý & Điện tử: Sạc phóng điện mạch RC

Khi sạc điện cho tụ điện trong mạch RC (gồm điện trở và tụ điện nối tiếp), điện áp trên tụ tăng dần theo thời gian và tiệm cận về suất điện động của nguồn điện.

#tln(
  id: "TC-04-RC",
  [Một tụ điện có điện dung $C$ được sạc từ nguồn điện một chiều có điện áp $E = 12$ V qua một điện trở $R$. Điện áp trên tụ điện tại thời điểm $t$ (giây) được cho bởi công thức:
  $ U(t) = 12(1 - e^(-2t)) quad (t >= 0) $
  Khi thời gian sạc kéo dài vô hạn ($t \to +oo$), điện áp trên tụ điện tiến dần về bao nhiêu Volt?],
  [$12$],
  loigiai: [
    #reset-step()
    #ppgiai[Tìm giới hạn của hàm số điện áp $U(t)$ khi $t \to +oo$.]

    #step[Tính giới hạn ở vô cực]
    $ lim_(t -> +oo) e^(-2t) = 0 $
    Do đó:
    $ lim_(t -> +oo) U(t) = lim_(t -> +oo) 12(1 - e^(-2t)) = 12(1 - 0) = 12 quad ("Volt") $

    #step[Kết luận vật lý]
    Điện áp trên tụ điện tiến dần về $12$ Volt (bằng điện áp nguồn sạc). Đường thẳng $y = 12$ là tiệm cận ngang của đồ thị điện áp theo thời gian.
    #eg-box(title: "Kết luận")[Điện áp tiệm cận là *12* Volt.]
  ]
)

#pagebreak()

= VI. Cơ học: Lực căng dây ly tâm & Tiệm cận đứng

Trong cơ học, khi một vật khối lượng $m$ chuyển động tròn trong mặt phẳng thẳng đứng hoặc chuyển động quay ly tâm với góc lệch $theta$ so với phương thẳng đứng, lực căng của sợi dây thường có dạng phân thức chứa $cos theta$ ở mẫu số. Khi $theta$ tiến sát đến $90°$ ($pi/2$), lực căng dây tăng vọt ra vô cực, đại diện cho một tiệm cận đứng vật lý.

#tln(
  id: "TC-06-EL",
  [Một sợi dây nhẹ không giãn dài $L = 1$ m treo một vật nặng khối lượng $m = 0.5$ kg quay ly tâm tạo với phương thẳng đứng một góc $theta$ ($0° <= theta < 90°$). Lực căng dây $T(theta)$ (đơn vị: Newton) được xác định bởi công thức:
  $ T(theta) = frac(5, cos theta) + 8 $
  Biết rằng sợi dây này chỉ chịu được lực căng tối đa là $T_"max" = 28$ N trước khi bị đứt. Tìm số đo góc lệch $theta$ lớn nhất (làm tròn đến hàng đơn vị của độ) mà sợi dây chưa bị đứt?],
  [$76$],
  loigiai: [
    #reset-step()
    #ppgiai[Giải bất phương trình lực căng dây $T(theta) <= T_"max"$ để tìm giới hạn cho góc $theta$.]

    #step[Thiết lập bất phương trình]
    Để sợi dây chưa bị đứt, lực căng dây phải thỏa mãn:
    $ T(theta) <= 28 $
    $ <=> frac(5, cos theta) + 8 <= 28 $
    $ <=> frac(5, cos theta) <= 20 $

    #step[Giải tìm giới hạn góc]
    Vì $0° <= theta < 90°$, ta có $cos theta > 0$. Bất phương trình tương đương:
    $ cos theta >= frac(5, 20) <=> cos theta >= 0.25 $
    Suy ra:
    $ theta <= arccos(0.25) $
    Sử dụng máy tính bỏ túi:
    $ arccos(0.25) approx 75.52° $
    Do đó, góc lệch tối đa để dây chưa bị đứt là $theta approx 75.52°$.
    Làm tròn đến hàng đơn vị của độ, ta được $76°$.

    #insight-box(title: "Ý nghĩa tiệm cận đứng")[
      Khi $theta -> 90°$, $cos theta -> 0^+$, do đó $T(theta) -> +oo$. Đường thẳng $theta = 90°$ là tiệm cận đứng của hàm lực căng. Thực tế, không bao giờ ta quay được sợi dây nằm ngang hoàn toàn ($theta = 90°$) vì lúc đó cần một lực căng vô hạn để triệt tiêu trọng lực của vật.
    ]
  ]
)

#pagebreak()

= VII. Vật lý Hiện đại: Thuyết tương đối hẹp & Hàm Gompertz

#ds(
  id: "TC-09-RELATIVITY",
  [Theo Thuyết tương đối hẹp của Albert Einstein, khối lượng tương đối tính $m(v)$ của một vật thể chuyển động với vận tốc $v$ ($0 <= v < c$) được mô tả bởi phương trình:
  $ m(v) = frac(m_0, sqrt(1 - frac(v^2, c^2))) $
  Trong đó $m_0$ là khối lượng nghỉ của vật, và $c approx 3 dot 10^8$ m/s là tốc độ ánh sáng trong chân không. Xét tính đúng/sai của các phát biểu sau:],
  (
    True([Khi vận tốc $v$ của vật tiến sát đến tốc độ ánh sáng $c$, khối lượng tương đối tính của vật tiến ra vô cực.]),
    False([Đường thẳng $v = c$ là đường tiệm cận ngang của đồ thị hàm số $m(v)$.]),
    True([Năng lượng động năng cực đại để gia tốc một vật có khối lượng nghỉ $m_0 > 0$ đạt đến vận tốc ánh sáng $c$ là vô hạn.]),
    True([Hàm số $m(v)$ đồng biến trên khoảng $[0, c)$.]),
  ),
  loigiai: [
    #reset-step()
    #ppgiai[Khảo sát giới hạn và đạo hàm của hàm số $m(v)$ để tìm tiệm cận đứng và chiều biến thiên.]
    
    #step[Xét phát biểu a và b (Giới hạn và Tiệm cận)]
    Khi $v -> c^-$, ta có $v^2/c^2 -> 1^-$, do đó $1 - v^2/c^2 -> 0^+$.
    Giới hạn của hàm số là:
    $ lim_(v -> c^-) m(v) = lim_(v -> c^-) frac(m_0, sqrt(1 - frac(v^2, c^2))) = +oo $
    Điều này có nghĩa là khi vật đạt vận tốc gần bằng tốc độ ánh sáng, khối lượng của nó tiến ra vô cực. Phát biểu a) *Đúng*.
    Vì giới hạn tại $v = c$ là vô cực, đường thẳng $v = c$ là đường tiệm cận đứng (không phải tiệm cận ngang). Phát biểu b) *Sai*.

    #step[Xét phát biểu c (Ý nghĩa vật lý)]
    Vì khối lượng tương đối tính tiến ra vô hạn, năng lượng cần thiết để gia tốc vật ($E = m c^2$) cũng tiến ra vô hạn. Do đó, không có bất kỳ lực nào trong vũ trụ có thể cung cấp đủ năng lượng để gia tốc một vật có khối lượng nghỉ khác $0$ đạt đến tốc độ ánh sáng. Phát biểu c) *Đúng*.

    #step[Xét phát biểu d (Chiều biến thiên)]
    Hàm số $m(v)$ có mẫu số là hàm chứa căn bậc hai. Hàm số lõi $f(v) = 1 - v^2/c^2$ nghịch biến trên $[0, c)$. Do đó $sqrt(f(v))$ nghịch biến, kéo theo $1/sqrt(f(v))$ đồng biến.
    Vậy $m(v)$ tăng dần khi vận tốc $v$ tăng. Phát biểu d) *Đúng*.

    #insight-box(title: "Tiệm cận đứng cực hạn")[
      Tiệm cận đứng $v=c$ trong hàm khối lượng tương đối tính là một trong những ứng dụng vĩ đại nhất của khái niệm giới hạn trong vật lý, giải thích vì sao tốc độ ánh sáng là giới hạn tốc độ tối đa của vũ trụ.
    ]
  ]
)

#tln(
  id: "TC-10-GOMPERTZ",
  [Sự tăng trưởng khối u ung thư (hoặc dân số trong một môi trường rất hạn chế) thường không tuân theo hàm Logistic thông thường, mà tuân theo hàm Gompertz. Kích thước khối u $V(t)$ (tính bằng $m m^3$) tại thời gian $t$ (ngày) được cho bởi:
  $ V(t) = 1200 e^(-4 e^(-0.1 t)) quad (t >= 0) $
  Khi thời gian $t$ đủ lớn ($t -> +oo$), khối u này sẽ phát triển đến kích thước giới hạn là bao nhiêu $m m^3$ (đây chính là đường tiệm cận ngang của đồ thị)?],
  [$1200$],
  loigiai: [
    #reset-step()
    #ppgiai[Tính giới hạn của hàm mũ lồng nhau (double exponential) khi $t -> +oo$.]
    
    #step[Tính giới hạn lớp hàm trong cùng]
    Khi $t -> +oo$, lũy thừa của $e$ trong cùng là $-0.1 t -> -oo$.
    Do đó:
    $ lim_(t -> +oo) e^(-0.1 t) = 0 $

    #step[Tính giới hạn toàn hàm]
    Thế giá trị này vào hàm mũ bên ngoài:
    $ lim_(t -> +oo) V(t) = lim_(t -> +oo) 1200 e^(-4 e^(-0.1 t)) = 1200 e^(-4 dot 0) = 1200 e^0 = 1200 quad (m m^3) $
    
    #step[Kết luận]
    Kích thước khối u sẽ tiệm cận giới hạn cực đại là $1200$ $m m^3$. Đường tiệm cận ngang là $V = 1200$. Hàm Gompertz mô tả sự tăng trưởng bất đối xứng, nhanh ở giai đoạn đầu nhưng giảm tốc rất chậm sau đó do khối u bắt đầu hoại tử ở lõi.
    #eg-box(title: "Kết luận")[Kích thước giới hạn là *1200* $m m^3$.]
  ]
)

#pagebreak()

= VIII. Bài tập trắc nghiệm và điền số ngắn tổng hợp

#tln(
  id: "TC-05-AC",
  [Một công ty sản xuất thiết bị gia dụng có tổng chi phí cố định là $2500$ triệu đồng, và chi phí sản xuất trực tiếp cho mỗi sản phẩm là $15$ triệu đồng. Gọi $A C(x)$ là chi phí trung bình để sản xuất một sản phẩm khi công ty sản xuất $x$ sản phẩm ($x >= 1$). Khi số lượng sản phẩm sản xuất tăng lên vô cùng ($x \to +oo$), chi phí trung bình của mỗi sản phẩm tiến dần về bao nhiêu triệu đồng?],
  [$15$],
  loigiai: [
    #reset-step()
    #ppgiai[Thiết lập hàm chi phí trung bình $A C(x) = C(x)/x$ và tính giới hạn khi $x \to +oo$.]

    #step[Thiết lập hàm số]
    Tổng chi phí sản xuất $x$ sản phẩm là:
    $ C(x) = 2500 + 15x quad ("triệu đồng") $
    Chi phí trung bình trên mỗi sản phẩm là:
    $ A C(x) = frac(C(x), x) = frac(2500 + 15x, x) = frac(2500, x) + 15 quad ("triệu đồng") $

    #step[Tìm giới hạn tiệm cận]
    $ lim_(x -> +oo) A C(x) = lim_(x -> +oo) (frac(2500, x) + 15) = 0 + 15 = 15 $
    Vậy đường tiệm cận ngang là $y = 15$. Khi quy mô sản xuất cực lớn, chi phí cố định phân bổ cho mỗi sản phẩm giảm dần về 0 và chi phí trung bình tiến sát về chi phí biến đổi là $15$ triệu đồng/sản phẩm.
    #eg-box(title: "Kết luận")[Chi phí trung bình tiến dần về *15* triệu đồng.]
  ]
)

#v(1.5em)

#tn(
  id: "TC-08-RC2",
  [Một tụ điện đã tích điện đầy đến hiệu điện thế $U_0 = 24$ V. Tại thời điểm $t = 0$ (giây), người ta cho tụ điện phóng điện qua một điện trở $R$. Hiệu điện thế giữa hai bản tụ điện tại thời điểm $t$ giây sau đó được mô tả bởi hàm số:
  $ U(t) = 24 e^(-0.5t) quad (V) $
  Khi thời gian phóng điện kéo dài vô hạn ($t -> +oo$), hiệu điện thế giữa hai bản tụ điện tiến dần về giá trị nào sau đây (đây chính là tiệm cận ngang của đồ thị)?],
  (
    [0 V.],
    [24 V.],
    [12 V.],
    [6 V.],
  ),
  correct: (1,),
  loigiai: [
    #reset-step()
    #ppgiai[Tính giới hạn của hàm hiệu điện thế $U(t)$ khi $t -> +oo$.]

    #step[Tính giới hạn]
    Vì $-0.5 < 0$, ta có:
    $ lim_(t -> +oo) e^(-0.5t) = 0 $
    Do đó:
    $ lim_(t -> +oo) U(t) = lim_(t -> +oo) 24 e^(-0.5t) = 24 dot 0 = 0 quad ("Volt") $

    #step[Ý nghĩa vật lý]
    Khi thời gian phóng điện tiến ra vô hạn, tụ điện phóng sạch toàn bộ điện tích tích lũy của nó qua điện trở dưới dạng nhiệt năng, khiến hiệu điện thế giữa hai bản tụ giảm dần về 0 V. Đường thẳng $U = 0$ là tiệm cận ngang của đồ thị.
    #eg-box(title: "Kết luận")[Hiệu điện thế tiến dần về *0 V*. Chọn phương án A.]
  ]
)
