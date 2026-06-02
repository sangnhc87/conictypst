#import "../sang-exam.typ": *
#import "../template.typ": *

#set page(paper: "a4", margin: (x: 1.45cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0B1F54"), rgb("0D47A1"), rgb("006064"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.7em,
  below: 1.1em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.35em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("006064")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("006064"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("0B1F54")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let col-navy = rgb("0B1F54")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")

#let intro-box(title: none, body) = block(
  fill: rgb("EEF6FF"),
  stroke: (left: 4pt + col-navy, rest: 0.6pt + rgb("CFD8DC")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-navy, weight: "bold")[#title]
    #v(0.3em)
  ]
  #body
]

#let note-box(title: none, body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFE082")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-amber, weight: "bold")[#title]
    #v(0.3em)
  ]
  #body
]

#let ans-box(body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("C8E6C9")),
  radius: (right: 7pt),
  inset: (x: 15pt, y: 12pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[Kết luận]
  #v(0.3em)
  #body
]

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("09152E"), rgb("0B1F54"), rgb("0D47A1"), rgb("006064"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 24pt),
  )[
    #text(fill: rgb("B3E5FC"), size: 11pt, weight: "bold", tracking: 2pt)[BỘ ĐỀ LUYỆN RIÊNG]
    #v(0.5em)
    #text(fill: white, size: 21pt, weight: "bold")[Tăng Giảm Liên Tục - 16 Câu - 8 Chủ Đề Phải Biết]
    #v(0.35em)
    #text(fill: rgb("E1F5FE"), size: 12.5pt)[Bám đúng 5 dạng trong file chính]
    #v(0.5em)
    #text(
      fill: rgb("B3E5FC"),
      size: 10.5pt,
      style: "italic",
    )[(Mỗi câu có đáp án duy nhất, lời giải ngắn, đủ để giao sau khi dạy xong một dạng)]
  ]
]

#v(0.9em)

#intro-box(title: [Góc nhìn sư phạm — Tăng giảm "Liên Tục" khác gì "Rời Rạc"?])[
  Nhiệm vụ đầu tiên là giúp học sinh không nhầm lẫn giữa lãi kép ngân hàng (nhảy bậc theo kỳ hạn cố định) với mô hình phân rã phóng xạ hay làm nguội (dòng chảy biến thiên trơn tru theo từng mảnh thời gian nhỏ vô hạn). 
  - *Chìa khóa nhận diện:* Khi đề bài xuất hiện cụm từ *"tốc độ thay đổi tỉ lệ thuận với..."*, đó là tín hiệu kinh điển của phương trình vi phân $y'(t) = k y(t)$, buộc ta phải chuyển sang dùng nghiệm mũ cơ số tự nhiên $e$.
  - Mọi bài toán biến thiên liên tục loại này chỉ xoay quanh việc thiết lập phương trình lõi và dùng các "chốt" dữ liệu ban đầu $(t_0, y_0)$ và điểm neo tiếp theo $(t_1, y_1)$ để khóa chặt hệ số.
]

#note-box(title: [Ba trụ cột cốt lõi của Sự biến thiên liên tục])[
  1. *Tăng/giảm thuần túy* ($y' = k y$): $y(t) = y_0 e^(k t)$. (Sinh sôi sinh học, phân rã phóng xạ). Lượng vật chất hướng tới vô cực hoặc cạn kiệt về $0$.
  2. *Hao hụt kết hợp bù đắp* ($y' = a y + b$): Có sự giằng co giữa hai dòng chảy. Dưới lăng kính vi phân, hệ luôn lùi dần về neo an toàn (mức cân bằng) $y_* = -b/a$.
  3. *Làm nguội Newton* ($T' = -k(T - T_"mt")$): Lượng nhiệt dư thừa bị vắt kiệt mượt mà theo hàm mũ giảm, đẩy vật thể đi vào trạng thái "đồng hóa" với môi trường.
]

#note-box(title: [Dự đoán xu hướng đề thi mới — Các mô hình mở rộng])[
  Ngoài 3 trụ cột cơ bản, học sinh cần tủ sẵn các mô hình thực tế chuyên sâu rất hay bị hỏi trong các đề thi lấy điểm giỏi:
  - *Mô hình Logistic (Tăng trưởng có giới hạn):* Tăng nhanh lúc đầu nhưng bị hãm lại bởi sức chứa tối đa $M$. Phương trình lõi $P'(t) = k P(t) (M - P(t))$. *Đặc biệt chú ý:* Tốc độ tăng $P'(t)$ đạt MAX khi dân số vừa chạm đúng một nửa sức chứa $P(t) = M/2$.
  - *Lãi kép liên tục:* $A(t) = P e^(r t)$ mô tả dòng tiền sinh sôi từng nano-giây. Dấu hiệu nhận biết là chữ "lãi kép tính liên tục".
  - *Phân rã phóng xạ (chu kỳ bán rã):* Sự sụt giảm liên tục theo hàm $m(t) = m_0 e^(-k t)$. Điểm chốt để xử lý nhanh không cần vi phân vòng vèo là nhận diện hệ số vắt kiệt: $k = (ln 2)/T$ ($T$ là chu kỳ bán rã).
]

#resetexamstate()

= Dạng I — Từ Lời Văn Sang Phương Trình Vi Phân

#tln(
  id: "TG-DL-01",
  [Một bồn nước có lượng nước là $V(t)$ lít tại thời điểm $t$ giờ. Nước bị rò rỉ ra ngoài với tốc độ tỉ lệ thuận với lượng nước đang có theo hệ số $0","12$. Đồng thời hệ thống bơm cấp vào bồn đều đặn $9$ lít mỗi giờ. Biết phương trình vi phân mô tả sự biến thiên lượng nước có dạng $V'(t) = a V(t) + b$. Tính giá trị của biểu thức $P = -100a + b$.],
  [$21$],
  loigiai: [
    #ppgiai(title: [Giải phẫu tốc độ biến thiên])[
      Tốc độ thay đổi tổng cộng của lượng nước $V'(t)$ luôn do hai dòng chảy xung đột định đoạt:
      - *Dòng ra (rút ruột do rò rỉ):* Tỉ lệ với chính lượng nước hiện dung, nên lực kéo lùi mang dấu âm $-> -0","12 V(t)$.
      - *Dòng vào (tiếp ứng từ bơm):* Độc lập và cố định, lực đẩy đẩy lên mang dấu dương $-> +9$.
    ]

    Vậy phương trình vi phân có dạng:
    $
      V'(t) = -0","12 V(t) + 9.
    $
    Đồng nhất hệ số ta có $a = -0","12$ và $b = 9$.
    Suy ra $P = -100(-0","12) + 9 = 12 + 9 = 21$.

    #ans-box[Giá trị của biểu thức là *$21$*.]
  ],
)

#tln(
  id: "TG-DL-02",
  [Một cốc nước nóng có nhiệt độ $T(t)$ tại thời điểm $t$ phút. Cốc được đặt trong căn phòng có nhiệt độ không đổi 24°C. Theo mô hình làm nguội Newton, tốc độ thay đổi nhiệt độ tỉ lệ với độ chênh giữa nhiệt độ của cốc và nhiệt độ phòng, với hằng số tỉ lệ $0","25$. Giả sử phương trình vi phân mô tả nhiệt độ có dạng $T'(t) = a T(t) + b$. Tính tỉ số $k = b/a$.],
  [$-24$],
  loigiai: [
    #ppgiai(title: [Cơ chế "đồng hóa" của nhiệt học])[
      - Bản chất của Định luật Newton là vật thể chịu sức sát thương/sưởi ấm từ môi trường. Đại lượng áp đặt mức quán tính là độ vênh nhiệt: $T(t) - 24$.
      - Việc đặt sẵn dấu âm ở hệ số $"-0","25"$ chính là cơ chế *tự hãm an toàn*: Nếu $T > 24$ (đang nóng) đạo hàm tự bị kéo âm xuống (nguội đi); Tương tự nếu $T < 24$ đạo hàm tự xoay dương (nóng lên). Định luật mô hình khóa chặt trạng thái không thể chạy lệch ray.
    ]

    Mô hình thiết lập được là:
    $
      T'(t) = -0","25 (T(t) - 24) = -0","25 T(t) + 6.
    $
    Đồng nhất hệ số ta có $a = -0","25$ và $b = 6$.
    Tỉ số $k = 6 / (-0","25) = -24$.

    #ans-box[Tỷ số cần tìm là *$-24$*.]
  ],
)

#pagebreak()

= Dạng II — Tăng Hoặc Giảm Thuần: $y'(t) = k y(t)$

#tln(
  id: "TG-DL-03",
  [Một nền tảng học trực tuyến có số tài khoản hoạt động là $N(t)$ tại thời điểm $t$ tháng. Biết rằng tốc độ tăng của $N(t)$ tỉ lệ thuận với chính $N(t)$. Lúc ban đầu có $6000$ tài khoản, sau $4$ tháng có $9000$ tài khoản. Hỏi sau khoảng bao nhiêu tháng kể từ lúc bắt đầu thì nền tảng đạt $18000$ tài khoản hoạt động? (_làm tròn đến hàng phần mười_).],
  [$10","8$],
  loigiai: [
    #ppgiai(title: [Khai thác động lực tăng trưởng thuần túy])[
      - Cụm từ "tốc độ tăng tỉ lệ thuận với chính nó" dịch ngay ra nguyên mẫu $N'(t) = k N(t)$, sinh ra quy luật phình to theo hàm $N(t) = N_0 e^(k t)$.
      - Ma trận giải toán đi qua 2 trạm duy nhất: Ép dữ liệu thực địa tại $t=4$ để bắt chết gia tốc $k$, sau đó phóng tầm ngắm tìm lời giải với đích $N(t) = 18000$.
    ]

    Ta có
    $
      N(t) = 6000 e^(k t).
    $

    Từ $N(4) = 9000$:
    $
      6000 e^(4 k) = 9000
      <=> e^(4 k) = frac(3, 2).
    $

    Khi $N(t) = 18000$:
    $
      6000 e^(k t) = 18000
      <=> e^(k t) = 3.
    $

    Suy ra
    $
      t = frac(4 ln 3, ln (3/2)) approx 10","840...
    $

    #ans-box[Sau khoảng *$10","8$ tháng* thì nền tảng đạt $18000$ tài khoản.]
  ],
)

#tln(
  id: "TG-DL-04",
  [Lượng hoạt chất của một loại thuốc trong máu được ký hiệu là $A(t)$ (mg) sau $t$ giờ. Biết rằng tốc độ đào thải của thuốc tỉ lệ thuận với lượng thuốc còn lại trong máu. Ban đầu có $160$ mg thuốc, sau $5$ giờ còn $128$ mg. Hỏi sau khoảng bao nhiêu giờ kể từ lúc uống thuốc thì lượng thuốc còn lại giảm xuống còn đúng $40$ mg? (_làm tròn đến hàng phần mười_).],
  [$31","1$],
  loigiai: [
    #ppgiai[
      - Mô hình đúng là $A'(t) = -k A(t)$, nên $A(t) = 160 e^(-k t)$.
      - Dùng dữ kiện $A(5) = 128$ để xác định $k$.
    ]

    Từ $A(5) = 128$:
    $
      160 e^(-5 k) = 128
      <=> e^(-5 k) = 0","8.
    $

    Khi $A(t) = 40$:
    $
      160 e^(-k t) = 40
      <=> e^(-k t) = frac(1, 4).
    $

    Suy ra
    $
      t = frac(5 ln 4, ln (1/0","8)) approx 31","065...
    $

    #ans-box[Sau khoảng *$31","1$ giờ* thì lượng thuốc còn lại là $40$ mg.]
  ],
)

#pagebreak()

= Dạng III — Vừa Hao Hụt Vừa Được Bổ Sung: $y'(t) = a y(t) + b$

#tln(
  id: "TG-DL-05",
  [Số người dùng hoạt động của một ứng dụng được ký hiệu là $N(t)$ (nghìn tài khoản) và thỏa mãn phương trình $N'(t) = -0","3 N(t) + 2","4$ với điều kiện ban đầu $N(0) = 15$. Nghiệm của phương trình có dạng $N(t) = A + B e^(k t)$. Tính giá trị của biểu thức $S = A + B - 10k$.],
  [$18$],
  loigiai: [
    #ppgiai(title: [Trạng thái tiệm cận và Lời giải bám dính])[
      - Đặc sản cực bén của khuôn vi phân $y' = a y + b$ chính là hiện diện của một *mức cân bằng sinh thái* $N_* = -b/a = -frac(2","4, -0","3) = 8$.
      - Ở tầm cao, lượng dao động chỉ là phần chênh của nền với mức cân bằng, bị bào mòn theo hàm mũ. Ta chộp rễ vào ngay kết cấu $N(t) = 8 + C e^(-0","3 t)$. Tiếp cận này giúp học sinh thấy "mọi thứ đổ dồn về 8".
    ]

    Dùng $N(0) = 15$:
    $
      15 = 8 + C => C = 7.
    $

    Do đó hàm nghiệm là:
    $
      N(t) = 8 + 7 e^(-0","3 t).
    $
    Suy ra $A = 8$, $B = 7$, $k = -0","3$.
    Nên $S = 8 + 7 - 10(-0","3) = 15 + 3 = 18$.

    #ans-box[Giá trị của biểu thức là *$18$*.]
  ],
)

#tln(
  id: "TG-DL-06",
  [Mức năng lượng khả dụng của một bộ pin dự phòng được ký hiệu là $Q(t)$ và thỏa mãn phương trình $Q'(t) = -0","4 Q(t) + 18$. Biết $Q(0) = 60$. Hỏi sau khoảng bao nhiêu giờ thì mức năng lượng giảm xuống còn đúng $48$ đơn vị? (_làm tròn đến hàng phần mười_).],
  [$4","0$],
  loigiai: [
    #ppgiai[
      - Mức cân bằng là $Q_* = -frac(18, -0","4) = 45$.
      - Nghiệm có dạng $Q(t) = 45 + C e^(-0","4 t)$.
    ]

    Từ $Q(0) = 60$ suy ra $C = 15$, nên
    $
      Q(t) = 45 + 15 e^(-0","4 t).
    $

    Tìm thời điểm $Q(t) = 48$:
    $
      45 + 15 e^(-0","4 t) = 48
      <=> e^(-0","4 t) = frac(1, 5).
    $

    Suy ra
    $
      t = frac(ln 5, 0","4) approx 4","024...
    $

    #ans-box[Sau khoảng *$4","0$ giờ* thì bộ pin còn $48$ đơn vị năng lượng.]
  ],
)

#tln(
  id: "TG-DL-07",
  [Một hồ nuôi thủy sinh được theo dõi lượng oxy hòa tan $M(t)$ (mg/L) và biết rằng $M'(t) = -0","25 M(t) + 5$ với $M(0) = 30$. Hỏi giá trị mà $M(t)$ tiến dần tới khi thời gian tăng rất lớn là bao nhiêu?],
  [$20$],
  loigiai: [
    #ppgiai[
      - Với mô hình $M'(t) = a M(t) + b$ cùng $a < 0$, trạng thái lâu dài chính là mức cân bằng $M_* = -frac(b, a)$.
    ]

    Ta có
    $
      M_* = -frac(5, -0","25) = 20.
    $

    #ans-box[Khi $t -> +oo$, $M(t)$ tiến dần tới *$20$ mg/L*.]
  ],
)

#pagebreak()

= Dạng IV — Định Luật Làm Nguội Newton

#tln(
  id: "TG-DL-08",
  [Một bát súp vừa nấu có nhiệt độ $85$°C, được đặt trong phòng có nhiệt độ không đổi $25$°C. Biết rằng sau $4$ phút thì nhiệt độ của súp còn $55$°C và quá trình tuân theo định luật làm nguội Newton. Hỏi sau khoảng bao nhiêu phút kể từ lúc bắt đầu thì nhiệt độ của súp giảm xuống còn đúng $35$°C? (_làm tròn đến hàng phần mười_).],
  [$10","3$],
  loigiai: [
    #ppgiai(title: [Làm chủ Newton mà không học vẹt])[
      - Hãy đọc thuộc nằm lòng: Nhiệt độ tức thời = *Nhiệt độ môi trường* $+$ *Nhiệt lượng dư thừa đang cạn kiệt*.
      - Tức là $T(t) = T_"mt" + Delta T_0 e^(-k t)$. Ở đây bệ đỡ là $T_"mt" = 25$, nhiệt hầm hập dư dôi ban đầu tách hẳn ra là $Delta T_0 = 85 - 25 = 60$. Nhờ vậy thiết lập trơn tru hàm $T(t) = 25 + 60 e^(-k t)$ không một nếp gấp.
    ]

    Dùng dữ kiện $T(4) = 55$:
    $
      25 + 60 e^(-4 k) = 55
      <=> e^(-4 k) = frac(1, 2).
    $

    Khi $T(t) = 35$:
    $
      25 + 60 e^(-k t) = 35
      <=> e^(-k t) = frac(1, 6).
    $

    Suy ra
    $
      t = frac(4 ln 6, ln 2) approx 10","340...
    $

    #ans-box[Sau khoảng *$10","3$ phút* thì bát súp còn $35$°C.]
  ],
)

#tln(
  id: "TG-DL-09",
  [Một cốc trà có nhiệt độ ban đầu $90$°C, được đặt trong phòng nhiệt độ $30$°C. Quá trình nguội tuân theo định luật Newton: $T'(t) = -k (T(t) - 30)$. Biết rằng sau $5$ phút thì nhiệt độ còn $60$°C. Hãy tính giá trị gần đúng của hằng số $k$ (_làm tròn đến hàng phần trăm_).],
  [$0","14$],
  loigiai: [
    #ppgiai[
      - Công thức nhiệt độ là $T(t) = 30 + 60 e^(-k t)$.
      - Thay dữ kiện tại $t = 5$ để tìm $k$.
    ]

    Từ $T(5) = 60$:
    $
      30 + 60 e^(-5 k) = 60
      <=> e^(-5 k) = frac(1, 2).
    $

    Suy ra
    $
      k = frac(ln 2, 5) approx 0","1386...
    $

    #ans-box[Giá trị gần đúng của hằng số là *$k approx 0","14$*.]
  ],
)

#pagebreak()

= Dạng V — Tự Luyện Tổng Hợp

#luuy[
  Ở khối luyện tổng hợp, kỹ năng tối thượng là phải liếc nhanh phán án xem dữ liệu đi theo "dòng hụt cạn kiệt về $0$" (Dạng II) hay là "dòng hụt nhưng được giằng co bởi ngưỡng môi trường/trạng thái bù đắp" (Dạng III, Dạng IV) để quăng khuôn hàm chính xác.
]

#tln(
  id: "TG-DL-10",
  [Nồng độ một chất ô nhiễm trong nước được ký hiệu là $C(t)$ (mg/L) sau $t$ giờ và thỏa mãn phương trình $C'(t) = -0","16 C(t)$. Biết ban đầu $C(0) = 40$. Hỏi sau khoảng bao nhiêu giờ thì nồng độ giảm xuống dưới mức $8$ mg/L? (_làm tròn đến hàng phần mười_).],
  [$10","1$],
  loigiai: [
    #ppgiai[
      - Nghiệm là $C(t) = 40 e^(-0","16 t)$.
      - Ta giải bất phương trình $40 e^(-0","16 t) < 8$.
    ]

    $
      40 e^(-0","16 t) < 8
      <=> e^(-0","16 t) < frac(1, 5).
    $

    Suy ra
    $
      t > frac(ln 5, 0","16) approx 10","059...
    $

    #ans-box[Sau khoảng *$10","1$ giờ* thì nồng độ xuống dưới $8$ mg/L.]
  ],
)

#tln(
  id: "TG-DL-11",
  [Mức năng lượng của một bộ tích điện được mô hình hóa bởi phương trình $Q'(t) = -0","25 Q(t) + 10$ và $Q(0) = 20$. Hỏi sau $8$ giờ thì mức năng lượng của bộ tích điện gần đúng bằng bao nhiêu? (_làm tròn đến hàng phần mười_).],
  [$37","3$],
  loigiai: [
    #ppgiai[
      - Mức cân bằng là $Q_* = -frac(10, -0","25) = 40$.
      - Nghiệm có dạng $Q(t) = 40 + C e^(-0","25 t)$.
    ]

    Từ $Q(0) = 20$ suy ra $C = -20$, nên
    $
      Q(t) = 40 - 20 e^(-0","25 t).
    $

    Tại $t = 8$:
    $
      Q(8) = 40 - 20 e^(-2) approx 37","29.
    $

    #ans-box[Sau $8$ giờ, mức năng lượng gần đúng là *$37","3$*.]
  ],
)

#tln(
  id: "TG-DL-12",
  [Khối lượng muối hòa tan trong một bể được ký hiệu là $S(t)$ (kg) và thỏa mãn phương trình $S'(t) = -0","1 S(t) + 5$. Biết ban đầu trong bể có $20$ kg muối. Hỏi sau khoảng bao nhiêu giờ thì lượng muối đạt đúng $45$ kg? (_làm tròn đến hàng phần mười_).],
  [$17","9$],
  loigiai: [
    #ppgiai[
      - Mức cân bằng là $S_* = -frac(5, -0","1) = 50$.
      - Nghiệm có dạng $S(t) = 50 + C e^(-0","1 t)$.
    ]

    Từ $S(0) = 20$ suy ra $C = -30$, nên
    $
      S(t) = 50 - 30 e^(-0","1 t).
    $

    Tìm thời điểm $S(t) = 45$:
    $
      50 - 30 e^(-0","1 t) = 45
      <=> e^(-0","1 t) = frac(1, 6).
    $

    Suy ra
    $
      t = 10 ln 6 approx 17","918...
    $

    #ans-box[Sau khoảng *$17","9$ giờ* thì lượng muối đạt $45$ kg.]
  ],
)

#pagebreak()

= Dạng VI — Dự Đoán Đề Thi: Logistic, Phóng Xạ & Lãi Kép

#tln(
  id: "TG-DL-13",
  [Một quần thể sinh vật trong môi trường khép kín có sức chứa tối đa là $M = 4000$ cá thể. Tốc độ sinh trưởng của quần thể tuân theo phương trình Logistic $P'(t) = 0","005 P(t)(4000 - P(t))$. Hỏi lúc tốc độ tăng trưởng của quần thể đạt mức lớn nhất (quần thể lây lan/sinh sôi nhanh nhất) thì lúc đó quần thể đang có bao nhiêu cá thể?],
  [$2000$],
  loigiai: [
    #ppgiai(title: [Chốt nhanh cực trị tam thức bậc hai])[
      - Biểu thức đạo hàm tốc độ $P'(t)$ chính là một hàm số bậc hai đối với quy mô $P(t)$. Đặt $f(P) = 0","005 P (4000 - P)$.
      - Ta cần tìm mức quy mô $P$ để $P'(t)$ móc đỉnh. Cấu trúc bài toán trở về tìm hoành độ đỉnh của parabol lật úp.
    ]

    Hàm bậc hai $f(P) = 0","005 P (4000 - P)$ có hai nghiệm cắt trục hiển nhiên là $P=0$ và $P=4000$.
    Đỉnh của parabol đối xứng sẽ rơi trúng đúng ở điểm trung bình:
    $
      P = frac(0 + 4000, 2) = 2000.
    $

    #ans-box[Tốc độ tăng trưởng đạt tối cao tại bề mặt số cá thể là *$2000$*.]
    #luuy[
      Từ đây rút ra lý thuyết đạn đạo cực nhanh: Trong mô hình Logistic, tốc độ lây lan dịch bệnh hay sự phát triển quần thể *luôn luôn* bùng phát gắt nhất khi quy mô chạm đúng *một nửa sức chứa tối đa* ($M/2$).
    ]
  ],
)

#tln(
  id: "TG-DL-14",
  [Sự lây lan bùng phát của một loại virus trên hòn đảo có $10000$ người được mô phỏng bằng độ bao phủ $N(t) = frac(10000, 1 + A e^(-k t))$, với $t$ là số ngày. Ở ngày đầu tiên quan sát $t=0$, nhà chức trách ghi nhận có đúng $200$ người nhiễm đầu tiên. Tính giá trị bằng số của tham số $A$.],
  [$49$],
  loigiai: [
    #ppgiai(title: [Đọc thấu tham số khởi tạo])[
      - Hàm phân thức ở trích dẫn trên chính là khuôn nghiệm bắt buộc (nghiệm tổng quát) của mô hình giới hạn ngặt Logistic.
      - Đừng bị ngợp trước hàm lạ, nguyên lý siêu kinh điển là dùng "cọc thời gian gốc" $t=0$ để bắt chết hệ số nền $A$.
    ]

    Tại ngày $t=0$, ta tính được lượng người nhiễm theo mặt lý thuyết:
    $
      N(0) = frac(10000, 1 + A e^0) = frac(10000, 1 + A).
    $
    Khớp biên dữ liệu thực địa ghi nhận được là $N(0) = 200$, suy ra phương trình:
    $
      frac(10000, 1 + A) = 200 <=> 1 + A = 10000 / 200 = 50 <=> A = 49.
    $

    #ans-box[Giá trị của tham số khởi động chốt ở mức *$49$*.]
  ],
)

#tln(
  id: "TG-DL-15",
  [Chất phóng xạ làm nhiên liệu hạt nhân có chu kỳ bán rã là $8$ ngày. Tại kho chứa, người ta cất giữ $100$ gam chất này. Mô hình khối lượng còn lại phân rã trơn tru tuân thủ hàm $m(t) = 100 e^(-k t)$. Khi đồng nhất mô hình, chuyên gia tính ra $k = (ln a)/b$. Hãy tính tổng giá trị của $a + b$ (nhận biết: $a, b$ là các số nguyên, với $a$ là số nguyên tố).],
  [$10$],
  loigiai: [
    #ppgiai(title: [Điểm huyệt hệ số góc của sự phân rã])[
      - Cứ đi hết một chu kỳ bán rã trọn vẹn $T$, lượng vật chất còn lại bị chẻ một nửa.
      - Thay vì mò lại đạo hàm lằng nhằng, mọi sự đứt gãy khi chuyển qua hệ số mũ cơ số tự nhiên $e$ được khóa cứng định luật: $k = (ln 2)/T$.
    ]

    Với chu kỳ bán rã $T = 8$ ngày, thay vào nguyên lý cơ bản $(1/2)$ ta lật ra sự bảo toàn:
    $
      m(t) = m_0 (frac(1, 2))^(t/8) = m_0 e^(ln(1/2) dot t/8) = m_0 e^(- (ln 2)/8 t).
    $
    So vào khuôn hàm chuẩn $m(t) = 100 e^(-k t)$, hệ số phân rã bị chốt ở:
    $
      k = frac(ln 2, 8).
    $
    So đối chiếu định dạng $k = (ln a)/b$, ta nhìn thấu $a=2$ (rất chuẩn số nguyên tố), và $b=8$.
    Ghép tổng chỉ tiêu ta được: $a + b = 2 + 8 = 10$.

    #ans-box[Tổng hai chỉ số $a, b$ ghép lại là *$10$*.]
  ],
)

#tln(
  id: "TG-DL-16",
  [Một chủ đầu tư thiết đặt tự động chuyển $100$ triệu đồng lợi nhuận vào ngân hàng với định dạng lãi kép liên tục. Lãi suất niêm yết là $7%$/năm ($r=0,07$). Biết dòng tiền liên tục đội quỹ sẽ sinh trưởng qua phương trình vi phân quy chuẩn $A(t) = P e^(r t)$. Hỏi sau trọn vẹn $10$ năm, số tiền lãi ròng sinh ra (chỉ tính thuần túy phần tiền lãi dư ra, không ôm gốc) làm tròn tới hàng đơn vị là bao nhiêu triệu đồng? (Ban kỹ thuật cho hệ số $e^(0,7) approx 2,0137$).],
  [$101$],
  loigiai: [
    #ppgiai(title: [Sức mạnh vi phân của dòng tiền trả liên tục])[
      - So với việc rút lãi kép định kỳ băm theo quỹ tháng/năm, lãi kép liên tục tương đương việc kỳ hạn tính lãi bị bóp xuống vô hạn cỡ nano-giây.
      - Chốt thẳng thông số vào phương trình tích lũy: $P=100$, $r=0.07$, $t=10$.
    ]

    Tổng lượng tiền ứ lại tài khoản đoạt được (hút trên danh nghĩa cả gốc + lãi suất) ở mốc $10$ năm:
    $
      A(10) = 100 dot e^(0","07 dot 10) = 100 e^(0","7).
    $
    Thả chỉ số đo nghiệm theo đề cho $e^(0","7) approx 2","0137$, ta chốt thu quỹ:
    $
      A(10) approx 100 dot 2","0137 = 201","37 " (triệu đồng)".
    $

    Do thước đo chỉ test kỹ năng lọc lõi tinh giản biên độ thặng dư *tiền lãi*:
    $
      "Tiền lãi dôi ra" = A(10) - "Quỹ Gốc " P = 201","37 - 100 = 101","37.
    $
    Điều hướng làm tròn tới hàng đơn vị triệt để phần nguyên, khoanh mốc $101$.

    #ans-box[Số tiền *lãi tinh túy dôi ra* tính theo vi phân xấp xỉ *$101$* (Triệu).]
  ],
)

= Bảng Đáp Số Nhanh

#align(center)[
  #table(
    columns: 6,
    stroke: 0.45pt + rgb("B0BEC5"),
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E3F2FD") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    align: center,
    table.header([*Câu*], [*Đáp số*], [*Câu*], [*Đáp số*], [*Câu*], [*Đáp số*]),
    [$1$], [$21$],     [$7$], [$20$],      [$13$], [$2000$],
    [$2$], [$-24$],    [$8$], [$10","3$], [$14$], [$49$],
    [$3$], [$10","8$], [$9$], [$0","14$], [$15$], [$10$],
    [$4$], [$31","1$], [$10$], [$10","1$],[$16$], [$101$],
    [$5$], [$18$],     [$11$], [$37","3$], [], [],
    [$6$], [$4","0$],  [$12$], [$17","9$], [], [],
  )
]
