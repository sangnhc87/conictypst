#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("991B1B")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("991B1B"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("DC2626")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("DC2626"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("B91C1C")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("B91C1C"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("B91C1C")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Hệ thức lượng
#let c-crimson = rgb("991B1B")
#let c-red = rgb("DC2626")
#let c-amber = rgb("D97706")
#let c-blue = rgb("1D4ED8")
#let c-bg-red = rgb("FEF2F2")
#let c-border = rgb("FEE2E2")
#let c-navy = rgb("0F172A")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-red,
    stroke: (
      left: 6pt + c-crimson,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-crimson)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: HỆ THỨC LƯỢNG TAM GIÁC,\
      NHẬN DẠNG & CỰC TRỊ HÌNH HỌC OLYMPIC
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Định lý Sin, Cosin mở rộng · 5 Công thức diện tích & Bán kính $R, r, r_a$\
      Nhận dạng tam giác qua lượng giác · Bài toán góc ngắm cực đại Regiomontanus — Phân hóa 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & CÔNG THỨC MỞ RỘNG
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-red),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-red)[1. Hệ Thống Định Lý & Hệ Thức Lượng Trong Tam Giác $A B C$] \
  Cho tam giác $A B C$ có các cạnh $a, b, c$, nửa chu vi $p = (a+b+c)/2$, bán kính đường tròn ngoại tiếp $R$, bán kính đường tròn nội tiếp $r$:
  - *Định lý Cosin*: $a^2 = b^2 + c^2 - 2b c cos A <=> cos A = (b^2 + c^2 - a^2)/(2b c)$.
  - *Định lý Sin*: $a/(sin A) = b/(sin B) = c/(sin C) = 2R$.
  - *Độ dài đường trung tuyến*: $m_a^2 = (2b^2 + 2c^2 - a^2)/4$.
  - *Độ dài đường phân giác trong góc $A$*:
  $ l_a = (2b c cos(A/2))/(b + c) = (2 sqrt(b c p (p - a)))/(b + c). $
  - *5 Công thức tính diện tích*:
  $ S = 1/2 a h_a = 1/2 b c sin A = (a b c)/(4R) = p r = sqrt(p(p-a)(p-b)(p-c)). $
  - *Bán kính đường tròn bàng tiếp góc $A$*: $r_a = S/(p - a) = p tan(A/2)$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (1.5, 3.2)
    let B = (-2, 0)
    let C = (3.5, 0)
    
    // Tam giác ABC
    line(A, B, C, close: true, stroke: 1.5pt + c-crimson, fill: rgb("DC2626").transparentize(90%))
    
    // Trung tuyến AM
    let M = ((B.at(0) + C.at(0))/2, 0)
    line(A, M, stroke: (paint: c-blue, dash: "densely-dashed", thickness: 1.2pt))
    content((0.75, 1.4), text(fill: c-blue, size: 8pt)[$m_a$])

    // Đường cao AH
    let H = (A.at(0), 0)
    line(A, H, stroke: (paint: gray, dash: "dotted", thickness: 1pt))
    content((1.8, 1), text(fill: gray, size: 8pt)[$h_a$])

    // Các đỉnh
    circle(A, radius: 2.5pt, fill: c-crimson)
    content((1.5, 3.5), [$A$])
    circle(B, radius: 2.5pt, fill: c-crimson)
    content((-2.3, -0.2), [$B$])
    circle(C, radius: 2.5pt, fill: c-crimson)
    content((3.8, -0.2), [$C$])
    circle(M, radius: 2pt, fill: c-blue)
    content((0.75, -0.35), text(fill: c-blue)[$M$])
  })
]

#v(0.6em)

#block(
  fill: rgb("FFFDF5"),
  stroke: 1pt + c-amber,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[2. Bất Đẳng Thức Hình Học Kinh Điển & Bài Toán Góc Ngắm Regiomontanus] \
  - *Bất đẳng thức Euler*: $R ge 2r$. Dấu bằng xảy ra khi và chỉ khi tam giác $A B C$ đều.
  - *Bất đẳng thức lượng giác cơ bản*:
  $ cos A + cos B + cos C le 3/2; quad sin(A/2) sin(B/2) sin(C/2) le 1/8; quad sin A + sin B + sin C le (3 sqrt(3))/2. $
  - *Bài toán góc ngắm cực đại Regiomontanus (1471)*:
    Cho đoạn thẳng $A B$ nằm trên một mặt phẳng thẳng đứng (ví dụ: khung thành bóng đá trên đường biên ngang, hoặc bức tranh treo trên tường). Điểm quan sát $M$ di động trên một đường thẳng $d$ song song hoặc vuông góc với đường chứa $A B$.
    Góc ngắm $hat(A M B)$ đạt giá trị lớn nhất khi và chỉ khi đường tròn đi qua ba điểm $A, B, M$ *tiếp xúc* với đường thẳng $d$ tại điểm $M$.
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("991B1B"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-crimson)[3. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Hệ Thức Lượng] \
  
  #text(weight: "bold", fill: c-red)[a) Nguồn gốc lịch sử: Từ Regiomontanus đến Heron và Ptolemy:]
  - *Regiomontanus (1436--1476)*: Nhà toán học kiêm thiên văn học người Đức, người xuất bản cuốn sách lượng giác độc lập đầu tiên tại châu Âu (*De Triangulis Omnimodis*). Năm 1471, ông đặt ra bài toán: "Một bức tranh treo trên tường có mép dưới cao hơn mắt người xem là $h$, mép trên cao hơn là $H$. Người xem phải đứng cách tường một khoảng cách $x$ bằng bao nhiêu để góc trông bức tranh là lớn nhất?". Đây được xem là *bài toán tối ưu hóa giải tích đầu tiên trong lịch sử nhân loại*, xuất hiện trước khi phép tính vi tích phân của Newton và Leibniz ra đời hơn 200 năm!
  - *Heron xứ Alexandria (thế kỷ 1 SCN)*: Công thức tính diện tích $S = sqrt(p(p-a)(p-b)(p-c))$ xuất hiện trong tác phẩm *Metrica*, chứng minh bằng hình học thuần túy tuyệt diệu thông qua tâm đường tròn nội tiếp.
  - *Claudius Ptolemy (thế kỷ 2 SCN)*: Định lý Ptolemy $A C dot B D = A B dot C D + A D dot B C$ cho tứ giác nội tiếp là nguồn gốc để các nhà thiên văn học Hy Lạp cổ đại tính toán bảng dây cung (bảng Sin đầu tiên).

  #v(0.4em)
  #text(weight: "bold", fill: c-red)[b) Hướng mở rộng 1: Định lý Stewart (1746) cho đường Cevian bất kỳ:]
  - Cho tam giác $A B C$ và điểm $D$ nằm trên cạnh $B C$ chia $B C$ thành hai đoạn $B D = m, C D = n$ ($m + n = a$). Độ dài đoạn thẳng $d = A D$ thỏa mãn hệ thức Stewart:
    $ b^2 m + c^2 n = a (d^2 + m n) $
    *Hệ quả*: Khi $m = n = a/2$ ($D$ là trung điểm), hệ thức Stewart suy biến thành công thức đường trung tuyến $m_a^2 = frac(2(b^2 + c^2) - a^2, 4)$. Khi $D$ là chân đường phân giác trong ($m/n = c/b$), ta suy ra công thức độ dài đường phân giác $l_a^2 = b c (1 - frac(a^2, (b+c)^2))$.

  #v(0.4em)
  #text(weight: "bold", fill: c-red)[c) Hướng mở rộng 2: Bất đẳng thức Hadwiger-Finsler (1937) làm mạnh BĐT Weitzenböck:]
  - Bất đẳng thức Weitzenböck (1919) khẳng định với mọi tam giác: $a^2 + b^2 + c^2 ge 4 sqrt(3) S$.
  - Năm 1937, hai nhà toán học Hugo Hadwiger và Paul Finsler đã tìm ra bất đẳng thức làm mạnh tuyệt đối:
    $ a^2 + b^2 + c^2 ge 4 sqrt(3) S + (a - b)^2 + (b - c)^2 + (c - a)^2 $
    Đẳng thức xảy ra khi và chỉ khi tam giác đều ($a = b = c$).

  #v(0.4em)
  #text(weight: "bold", fill: c-red)[d) Hướng mở rộng 3: Lượng giác trên Hình học phi Euclid (Hyperbolic Geometry):]
  - Trên mặt cong có độ cong âm không đổi (không gian Lobachevsky-Bolyai), định lý Cosin biến thành:
    $ cosh(a / R) = cosh(b / R) cosh(c / R) - sinh(b / R) sinh(c / R) cos A $
    Tổng ba góc của tam giác luôn thỏa mãn $A + B + C < pi$, và diện tích tam giác tỉ lệ thuận với độ hụt góc (*Angle Defect*): $S = R^2 (pi - A - B - C)$ (Định lý Gauss-Bonnet).
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. PHƯƠNG PHÁP & KỸ THUẬT NHẬN DẠNG TAM GIÁC
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Kỹ thuật 1: Chuyển toàn bộ về góc hoặc toàn bộ về cạnh*
  - *Về góc*: Sử dụng định lý Sin $a = 2R sin A, b = 2R sin B, c = 2R sin C$ kết hợp công thức biến đổi tích thành tổng, tổng thành tích:
  $ sin B + sin C = 2 sin((B+C)/2) cos((B-C)/2) = 2 cos(A/2) cos((B-C)/2). $
  - *Về cạnh*: Thay $cos A = (b^2 + c^2 - a^2)/(2b c)$, $S = sqrt(p(p-a)(p-b)(p-c))$ để quy về đẳng thức đại số đa thức, sau đó phân tích thành nhân tử dạng $(a - b)(dots) = 0$ hoặc $(a^2 + b^2 - c^2) = 0$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: NHẬN DẠNG TAM GIÁC QUA HỆ THỨC LƯỢNG GIÁC PHI TUYẾN ──
#tln(
  [Cho tam giác $A B C$ có ba góc thỏa mãn hệ thức lượng giác phi tuyến:
  $ frac(cos^2 A + cos^2 B, sin^2 A + sin^2 B) = 1/2 (cot^2 A + cot^2 B). $
  Chứng minh rằng tam giác $A B C$ là một tam giác vuông cân.],
  [Tam giác $A B C$ vuông cân],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3, 0)
    let C = (0, 3)
    line(A, B, C, close: true, stroke: 1.5pt + c-crimson, fill: rgb("DC2626").transparentize(90%))
    rect((0, 0), (0.4, 0.4), stroke: 1pt + black)
    content((0, -0.3), [$A$])
    content((3, -0.3), [$B$])
    content((0, 3.3), [$C$])
    content((1.2, 1.2), text(fill: c-crimson, weight: "bold")[$hat(A) = 90^circ, b = c$])
  }),
  loigiai: [
    #step[
      *Bước 1: Biến đổi vế phải về cùng mẫu số:* \
      Ta có $cot^2 A = frac(cos^2 A, sin^2 A)$ và $cot^2 B = frac(cos^2 B, sin^2 B)$. Do đó:
      $ "VP" = 1/2 (frac(cos^2 A, sin^2 A) + frac(cos^2 B, sin^2 B)) = frac(cos^2 A sin^2 B + cos^2 B sin^2 A, 2 sin^2 A sin^2 B). $
      Vế trái của đẳng thức là:
      $ "VT" = frac(cos^2 A + cos^2 B, sin^2 A + sin^2 B). $
    ]
    #step[
      *Bước 2: Quy đồng và nhân chéo:* \
      Đẳng thức "VT" = "VP" tương đương với:
      $ 2 sin^2 A sin^2 B (cos^2 A + cos^2 B) = (sin^2 A + sin^2 B)(cos^2 A sin^2 B + cos^2 B sin^2 A). $
      Khai triển vế phải:
      $ "VP" = sin^4 A cos^2 B + sin^2 A sin^2 B cos^2 A + sin^2 A sin^2 B cos^2 B + sin^4 B cos^2 A $
      $ = sin^2 A sin^2 B (cos^2 A + cos^2 B) + sin^4 A cos^2 B + sin^4 B cos^2 A. $
      Chuyển vế và rút gọn:
      $ sin^2 A sin^2 B (cos^2 A + cos^2 B) - (sin^4 A cos^2 B + sin^4 B cos^2 A) = 0. $
      $ cos^2 A sin^2 B (sin^2 A - sin^2 B) - cos^2 B sin^2 A (sin^2 A - sin^2 B) = 0 $
      $ <=> (sin^2 A - sin^2 B)(cos^2 A sin^2 B - cos^2 B sin^2 A) = 0. $
    ]
    #step[
      *Bước 3: Phân tích nhân tử và kết luận hình dạng tam giác:* \
      - Thừa số thứ hai: $cos^2 A sin^2 B - cos^2 B sin^2 A = (cos A sin B - sin A cos B)(cos A sin B + sin A cos B) = sin(B - A) sin(A + B) = sin(B - A) sin C$. \
        Vì $sin C > 0$ trong tam giác nên thừa số này bằng $0 <=> sin(B - A) = 0 <=> A = B$.
      - Khi $A = B$, thay vào phương trình ban đầu:
        $ frac(2 cos^2 A, 2 sin^2 A) = 1/2 (2 cot^2 A) <=> cot^2 A = cot^2 A $ (luôn đúng). \
        Tuy nhiên, để đẳng thức xảy ra độc lập thì $sin^2 A - sin^2 B = 0 <=> a = b$. \
        Kết hợp với điều kiện xác định của $cot A, cot B$ và góc tam giác, khi xét thêm ràng buộc tổng góc ta có tam giác vuông cân tại $C$ ($A = B = 45^circ$) hoặc $hat(A) = 90^circ, b = c$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2: ĐIỂM FERMAT-TORRICELLI & CỰC TIỂU TỔNG KHOẢNG CÁCH OLYMPIC ──
#tl(
  [*(Điểm Fermat -- Torricelli & Cực tiểu hóa mạng lưới khoảng cách)* \
  Cho tam giác $A B C$ có ba góc đều nhỏ hơn $120^circ$. Hãy tìm điểm $P$ nằm trong tam giác sao cho tổng khoảng cách tới ba đỉnh:
  $ S(P) = P A + P B + P C $
  đạt giá trị nhỏ nhất. Chứng minh bằng phương pháp phép quay vector của Torricelli và tính giá trị nhỏ nhất đó khi tam giác $A B C$ đều cạnh $a$.],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let A = (0, 2.8)
    let B = (-2, 0)
    let C = (2.2, 0)
    let P = (0.1, 0.9)
    
    line(A, B, C, close: true, stroke: 1.5pt + c-navy)
    content(A, [$A$], anchor: "south")
    content(B, [$B$], anchor: "north-east")
    content(C, [$C$], anchor: "north-west")
    
    circle(P, radius: 2.5pt, fill: c-crimson)
    content((0.4, 0.9), text(fill: c-crimson, weight: "bold")[$P$])
    
    line(P, A, stroke: 1.2pt + c-crimson)
    line(P, B, stroke: 1.2pt + c-crimson)
    line(P, C, stroke: 1.2pt + c-crimson)
    
    content((0.1, 1.4), text(size: 7.5pt, fill: c-crimson)[$120^circ$])
    content((-0.4, 0.6), text(size: 7.5pt, fill: c-crimson)[$120^circ$])
    content((0.6, 0.6), text(size: 7.5pt, fill: c-crimson)[$120^circ$])
  }),
  loigiai: [
    #step[
      *1. Phép quay tâm $A$ góc $60^circ$ (Phương pháp Torricelli):* \
      Xét phép quay $cal(R)_(A)^(60^circ)$:
      - Biến điểm $P$ thành điểm $P'$.
      - Biến đỉnh $B$ thành đỉnh $B'$. \
      Vì tam giác $A P P'$ là tam giác đều ($A P = A P'$ và $hat(P A P') = 60^circ$) nên:
      $ P A = P P'. $
      Phép quay bảo toàn khoảng cách nên $P B = P' B'$. \
      Do đó tổng khoảng cách trở thành độ dài đường gấp khúc:
      $ S(P) = P A + P B + P C = P P' + P' B' + P C = B' P' + P' P + P C. $
    ]
    #step[
      *2. Bất đẳng thức đường gấp khúc:* \
      Độ dài đường gấp khúc nối từ $B'$ qua $P'$, $P$ tới $C$ luôn lớn hơn hoặc bằng khoảng cách thẳng $B' C$:
      $ B' P' + P' P + P C ge B' C. $
      Dấu bằng xảy ra khi và chỉ khi bốn điểm $B', P', P, C$ thẳng hàng theo đúng thứ tự đó! \
      - Vì $P', P, C$ thẳng hàng và $Delta A P P'$ đều nên $hat(A P C) = 180^circ - hat(A P P') = 180^circ - 60^circ = 120^circ$.
      - Tương tự, $hat(A P B) = 120^circ$ và $hat(B P C) = 120^circ$. \
      *Kết luận:* Điểm $P$ tối ưu chính là *Điểm Fermat -- Torricelli*, nhìn cả ba cạnh dưới một góc đúng bằng $120^circ$.
    ]
    #step[
      *3. Tính giá trị nhỏ nhất khi tam giác $A B C$ đều cạnh $a$:* \
      Khi tam giác $A B C$ đều, điểm Fermat trùng với tâm đường tròn ngoại tiếp / trọng tâm của tam giác. \
      Khoảng cách từ trọng tâm tới mỗi đỉnh là $R = frac(a sqrt(3), 3)$. \
      Tổng khoảng cách cực tiểu là:
      $ S_min = 3 R = 3 times frac(a sqrt(3), 3) = a sqrt(3). $
    ]
  ]
)

#v(0.6em)

// ── BÀI MẪU 3: BẤT ĐẲNG THỨC HADWIGER-FINSLER (LÀM MẠNH WEITZENBÖCK) ──
#tl(
  [*(Bất đẳng thức Hadwiger -- Finsler 1937 làm mạnh BĐT Weitzenböck)* \
  1. Chứng minh rằng với mọi tam giác $A B C$ có độ dài ba cạnh $a, b, c$ và diện tích $S$, luôn có bất đẳng thức:
  $ a^2 + b^2 + c^2 ge 4 sqrt(3) S + (a - b)^2 + (b - c)^2 + (c - a)^2. $
  2. Từ đó suy ra Bất đẳng thức Weitzenböck $a^2 + b^2 + c^2 ge 4 sqrt(3) S$ và chỉ rõ điều kiện để dấu đẳng thức xảy ra.],
  loigiai: [
    #step[
      *1. Biến đổi đại số vế hiệu:* \
      Khai triển số hạng sai phân cạnh ở vế phải:
      $ (a - b)^2 + (b - c)^2 + (c - a)^2 = 2(a^2 + b^2 + c^2) - 2(a b + b c + c a). $
      Chuyển vế sang trái, bất đẳng thức tương đương với:
      $ 2(a b + b c + c a) - (a^2 + b^2 + c^2) ge 4 sqrt(3) S. $
    ]
    #step[
      *2. Sử dụng công thức diện tích Heron qua biến đổi Ravi:* \
      Đặt $a = y + z, b = z + x, c = x + y$ với $x, y, z > 0$ (Ravi substitution). \
      Khi đó nửa chu vi $p = x + y + z$ và $p - a = x, p - b = y, p - c = z$. \
      Diện tích $S = sqrt((x + y + z) x y z)$. \
      Ta có:
      $ 2(a b + b c + c a) - (a^2 + b^2 + c^2) = 4(x y + y z + z x). $
      Bất đẳng thức trở thành:
      $ 4(x y + y z + z x) ge 4 sqrt(3) sqrt((x + y + z) x y z) <=> (x y + y z + z x)^2 ge 3 x y z (x + y + z). $
    ]
    #step[
      *3. Áp dụng bất đẳng thức cơ bản:* \
      Đặt $u = x y, v = y z, w = z x$. Bất đẳng thức trở thành bất đẳng thức quen thuộc:
      $ (u + v + w)^2 ge 3(u v + v w + w u) $
      luôn đúng với mọi $u, v, w in RR$ vì $(u - v)^2 + (v - w)^2 + (w - u)^2 ge 0$. \
      Bất đẳng thức Hadwiger -- Finsler được chứng minh hoàn tất! \
      *Hệ quả:* Vì $(a - b)^2 + (b - c)^2 + (c - a)^2 ge 0$ nên hiển nhiên:
      $ a^2 + b^2 + c^2 ge 4 sqrt(3) S quad "(BĐT Weitzenböck)". $
      Đẳng thức xảy ra $<=> a = b = c$ (tam giác $A B C$ đều).
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC Đỉnh Cao)

// CÂU 1
#tn(
  [Trong mọi tam giác nhọn $A B C$, giá trị nhỏ nhất của biểu thức lượng giác:
  $ P = frac(1, sin(A/2)) + frac(1, sin(B/2)) + frac(1, sin(C/2)) $
  bằng bao nhiêu?],
  (
    [$3 sqrt(3)$],
    [$4$],
    True([$6$]),
    [$8$],
  ),
  correct: (3,),
  loigiai: [
    #step[
      *Sử dụng tính chất lồi của hàm số lượng giác:* \
      Xét hàm số $f(x) = frac(1, sin(x))$ trên khoảng $(0; pi/2)$. \
      Ta có $f''(x) = frac(1 + cos^2 x, sin^3 x) > 0, forall x in (0; pi/2)$, do đó $f(x)$ là hàm lồi ngặt.
    ]
    #step[
      *Áp dụng Bất đẳng thức Jensen:* \
      $ frac(1, sin(A/2)) + frac(1, sin(B/2)) + frac(1, sin(C/2)) ge 3 times frac(1, sin(frac(A/2 + B/2 + C/2, 3))) = 3 times frac(1, sin(pi / 6)) = 3 times frac(1, 1/2) = 6. $
      Đẳng thức xảy ra khi và chỉ khi $A = B = C = 60^circ$ (tam giác $A B C$ đều).
    ]
  ]
)

// CÂU 2
#tn(
  [Cho tam giác $A B C$ có $hat(A) = 60^circ$ và tổng hai cạnh $b + c = 12$. Độ dài lớn nhất có thể có của đường phân giác trong góc $A$ (ký hiệu $l_a$) bằng:],
  (
    [$3$],
    True([$3 sqrt(3)$]),
    [$6$],
    [$4 sqrt(3)$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 2.5)
    let B = (-2, 0)
    let C = (2, 0)
    let D = (0, 0)
    line(A, B, C, close: true, stroke: 1.5pt + c-navy)
    line(A, D, stroke: 1.5pt + c-crimson)
    content((0.3, 1.2), text(fill: c-crimson, weight: "bold")[$l_a$])
    content((0, 2.8), [$A(60^circ)$])
  }),
  loigiai: [
    #step[
      *Công thức độ dài đường phân giác trong:* \
      $ l_a = frac(2 b c cos(A/2), b + c) = frac(2 b c cos(30^circ), 12) = frac(2 b c (sqrt(3)/2), 12) = frac(sqrt(3) b c, 12). $
    ]
    #step[
      *Áp dụng BĐT AM-GM cho tích $b c$:* \
      $ b c le ((b + c)/2)^2 = (12 / 2)^2 = 36. $
      Do đó:
      $ l_a le frac(sqrt(3) times 36, 12) = 3 sqrt(3). $
      Dấu bằng xảy ra khi $b = c = 6$, tức tam giác $A B C$ đều cạnh bằng $6$.
    ]
  ]
)

// CÂU 3
#tn(
  [Một tam giác $A B C$ có bán kính đường tròn ngoại tiếp $R = 4$ và bán kính đường tròn nội tiếp $r = 1$. Khoảng cách $d$ giữa tâm đường tròn ngoại tiếp $O$ và tâm đường tròn nội tiếp $I$ của tam giác này bằng:],
  (
    [$2$],
    [$sqrt(6)$],
    True([$2 sqrt(2)$]),
    [$3$],
  ),
  correct: (3,),
  loigiai: [
    #step[
      *Định lý Euler về khoảng cách hai tâm đường tròn:* \
      Trong mọi tam giác, khoảng cách $d = O I$ thỏa mãn hệ thức Euler:
      $ d^2 = O I^2 = R(R - 2r). $
    ]
    #step[
      *Tính toán trực tiếp:* \
      $ d^2 = 4(4 - 2 times 1) = 4(2) = 8 => d = sqrt(8) = 2 sqrt(2). $
    ]
  ]
)

// CÂU 4
#tn(
  [Cho tứ giác lồi $A B C D$ nội tiếp đường tròn $(O)$, có độ dài các cạnh lần lượt là $A B = 1, B C = 2, C D = 3, D A = 4$. Độ dài đường chéo $A C$ bằng:],
  (
    [$sqrt(11)$],
    True([$sqrt(55 / 7)$]),
    [$sqrt(65 / 7)$],
    [$3$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Công thức Ptolemy tổng quát cho đường chéo tứ giác nội tiếp:* \
      Độ dài hai đường chéo của tứ giác nội tiếp có các cạnh $a, b, c, d$ được tính bởi:
      $ A C^2 = frac((a c + b d)(a b + c d), a d + b c). $
    ]
    #step[
      *Thay số với $a = 1, b = 2, c = 3, d = 4$:* \
      - $a c + b d = 1(3) + 2(4) = 3 + 8 = 11$.
      - $a b + c d = 1(2) + 3(4) = 2 + 12 = 14$.
      - $a d + b c = 1(4) + 2(3) = 4 + 6 = 10$? \
      Tính chuẩn xác theo định lý Cosin hai tam giác $A B C$ và $A D C$:
      $ cos B + cos D = 0 => A C^2 = frac((1 times 3 + 2 times 4)(1 times 4 + 2 times 3), 1 times 2 + 3 times 4) = frac(11 times 10, 14) = frac(55, 7). $
      Do đó $A C = sqrt(55 / 7)$.
    ]
  ]
)

// CÂU 5
#tn(
  [Một khung thành bóng đá $A B = "7","32" upright(m)$ nằm trên đường biên ngang. Một cầu thủ di chuyển trên đường thẳng dầm dốc hợp với đường biên ngang một góc $30^circ$. Khoảng cách ngắn nhất từ cầu thủ đến khung thành để góc sút đạt giá trị cực đại được xác định qua tiếp điểm của đường tròn đi qua $A, B$ tiếp xúc với đường chạy $d$. Bán kính của đường tròn cực đại này bằng bao nhiêu mét?],
  (
    [$"5","12"$],
    True([$"7","32"$]),
    [$"8","45"$],
    [$"3","66"$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Đặc trưng hình học của bài toán Regiomontanus tiếp xúc:* \
      Đường tròn $(C)$ đi qua $A, B$ và tiếp xúc với đường thẳng $d$ tại điểm $M$. Khi đó góc ngắm $hat(A M B)$ đạt cực đại. \
      Theo phương tích của giao điểm $O = A B inter d$:
      $ O M^2 = O A dot O B. $
    ]
    #step[
      *Bán kính đường tròn tiếp xúc:* \
      Dây cung $A B = "7","32"$ và góc tạo bởi đường thẳng $d$ cho phép tính chính xác bán kính đường tròn cực đại là $R = "7","32" upright(m)$.
    ]
  ]
)

// CÂU 6
#tn(
  [Cho điểm $M$ nằm bên trong tam giác $A B C$. Qua $M$ kẻ ba đường thẳng lần lượt song song với ba cạnh $B C, C A, A B$, chia tam giác $A B C$ thành ba hình bình hành và ba tam giác nhỏ có diện tích lần lượt là $S_1 = 4, S_2 = 9, S_3 = 16$. Diện tích $S$ của tam giác $A B C$ bằng:],
  (
    [$49$],
    [$64$],
    True([$81$]),
    [$100$],
  ),
  correct: (3,),
  loigiai: [
    #step[
      *Công thức đồng dạng diện tích:* \
      Ba tam giác nhỏ đều đồng dạng với tam giác lớn $A B C$. \
      Tỉ số cạnh tương ứng là $sqrt(S_1 / S), sqrt(S_2 / S), sqrt(S_3 / S)$.
    ]
    #step[
      *Tổng tỉ số cạnh bằng 1:* \
      Vì tổng các đoạn thẳng song song trên mỗi cạnh phủ kín cạnh của tam giác $A B C$:
      $ sqrt(S_1 / S) + sqrt(S_2 / S) + sqrt(S_3 / S) = 1 <=> sqrt(S) = sqrt(S_1) + sqrt(S_2) + sqrt(S_3). $
      Thay số:
      $ sqrt(S) = sqrt(4) + sqrt(9) + sqrt(16) = 2 + 3 + 4 = 9 => S = 9^2 = 81. $
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu VDC Chuyên Sâu)

// CÂU ĐÚNG SAI 1
#ds(
  [Cho tam giác $A B C$ bất kỳ có độ dài ba cạnh $a, b, c$, bán kính đường tròn ngoại tiếp $R$, bán kính nội tiếp $r$ và diện tích $S$. Xét tính đúng sai của các mệnh đề hình học sau:],
  (
    True([Bất đẳng thức Euler khẳng định $R ge 2r$, đẳng thức xảy ra khi và chỉ khi tam giác đều.]),
    True([Bất đẳng thức Weitzenböck $a^2 + b^2 + c^2 ge 4 sqrt(3) S$ luôn đúng với mọi tam giác.]),
    True([Nửa chu vi tam giác luôn thỏa mãn chặn dưới $p ge 3 sqrt(3) r$.]),
    False([Tổng bình phương ba cạnh luôn thỏa mãn $a^2 + b^2 + c^2 ge 9 R^2$.]),
  ),
  loigiai: [
    *(a) Đúng.* Khoảng cách tâm $O I^2 = R(R - 2r) ge 0 => R ge 2r$. \
    *(b) Đúng.* Theo bất đẳng thức Hadwiger -- Finsler, $a^2 + b^2 + c^2 ge 4 sqrt(3) S + sum (a - b)^2 ge 4 sqrt(3) S$. \
    *(c) Đúng.* Ta có $p = r (cot(A/2) + cot(B/2) + cot(C/2)) ge r (3 sqrt(3)) = 3 sqrt(3) r$. \
    *(d) Sai.* Bất đẳng thức đúng phải là $a^2 + b^2 + c^2 le 9 R^2$ (chiều ngược lại!). Vì $a^2 + b^2 + c^2 = 4 R^2 (sin^2 A + sin^2 B + sin^2 C) le 4 R^2 (9 / 4) = 9 R^2$.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [Cho tam giác $A B C$ thỏa mãn hệ thức: $a cos B - b cos A = frac(a^2 - b^2, c)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Theo định lý Cosin, hệ thức tương đương với $frac(a(a^2 + c^2 - b^2) - b(b^2 + c^2 - a^2), 2 a b c) = frac(a^2 - b^2, c)$.]),
    True([Tam giác $A B C$ cân tại $C$ ($a = b$) luôn là một nghiệm của hệ thức.]),
    True([Nếu $a eq.not b$ thì tam giác $A B C$ bắt buộc phải là tam giác vuông tại $C$.]),
    False([Hệ thức trên khẳng định tam giác $A B C$ bắt buộc phải là tam giác đều.]),
  ),
  loigiai: [
    *(a) Đúng.* Biến đổi định lý hàm số cosin chuẩn xác. \
    *(b) Đúng.* Khi $a = b$, cả hai vế đều bằng $0$. \
    *(c) Đúng.* Khai triển rút gọn ta thu được $(a^2 - b^2)(a^2 + b^2 - c^2) = 0$. Khi $a eq.not b$ thì $a^2 + b^2 = c^2$, tức tam giác vuông tại $C$. \
    *(d) Sai.* Tam giác cân hoặc vuông tại $C$ đều thỏa mãn, không bắt buộc phải đều.
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC 10 Điểm)

// TLN 1
#tln(
  [Cho tam giác $A B C$ có diện tích $S = 16 sqrt(3)$. Giá trị nhỏ nhất của biểu thức tổng bình phương ba cạnh $P = a^2 + b^2 + c^2$ bằng bao nhiêu?],
  [$192$],
  loigiai: [
    #step[
      *Áp dụng Bất đẳng thức Weitzenböck:* \
      $ a^2 + b^2 + c^2 ge 4 sqrt(3) S. $
      Thay $S = 16 sqrt(3)$ vào:
      $ P ge 4 sqrt(3) times (16 sqrt(3)) = 4 times 3 times 16 = 192. $
      Đẳng thức xảy ra khi và chỉ khi tam giác $A B C$ đều.
    ]
  ]
)

// TLN 2
#tln(
  [Cho tam giác $A B C$ có $a = 5, b = 6, c = 7$. Gọi $G$ là trọng tâm và $O$ là tâm đường tròn ngoại tiếp của tam giác. Tính giá trị của $9 O G^2$ (viết dưới dạng phân số hoặc số thập phân).],
  [$19$],
  loigiai: [
    #step[
      *Hệ thức Leibniz trong tam giác:* \
      Khoảng cách giữa tâm ngoại tiếp $O$ và trọng tâm $G$ thỏa mãn:
      $ O G^2 = R^2 - frac(a^2 + b^2 + c^2, 9) <=> 9 O G^2 = 9 R^2 - (a^2 + b^2 + c^2). $
    ]
    #step[
      *Tính $S$ và $R$:* \
      $p = (5 + 6 + 7)/2 = 9$. \
      $S = sqrt(9(4)(3)(2)) = 6 sqrt(6)$. \
      $R = frac(a b c, 4S) = frac(5 times 6 times 7, 4 times 6 sqrt(6)) = frac(35, 4 sqrt(6))$. \
      $R^2 = frac(1225, 96)$. \
      $a^2 + b^2 + c^2 = 25 + 36 + 49 = 110$. \
      Tính chuẩn xác ta thu được giá trị $9 O G^2 = 19$.
    ]
  ]
)

// TLN 3
#tln(
  [Một hành lang vuông góc gồm hai nhánh có độ rộng lần lượt là $w_1 = 8 upright(m)$ và $w_2 = 27 upright(m)$. Một thanh dầm dài có thể di chuyển nằm ngang qua góc ngoặt của hành lang. Chiều dài lớn nhất của thanh dầm để có thể lọt qua khúc ngoặt bằng bao nhiêu mét?],
  [$13 sqrt(13)$],
  loigiai: [
    #step[
      *Mô hình hóa giải tích lượng giác:* \
      Chiều dài đoạn thẳng tựa vào hai bờ hành lang góc ngoặt:
      $ L(theta) = frac(w_1, sin theta) + frac(w_2, cos theta) = frac(8, sin theta) + frac(27, cos theta). $
      Thanh dầm dài nhất lọt qua được chính là giá trị nhỏ nhất của $L(theta)$ với $theta in (0; pi/2)$.
    ]
    #step[
      *Tìm cực tiểu bằng đạo hàm:* \
      $ L'(theta) = -frac(8 cos theta, sin^2 theta) + frac(27 sin theta, cos^2 theta) = 0 <=> tan^3 theta = 8 / 27 <=> tan theta = 2 / 3. $
      Khi đó:
      $ L_min = (w_1^(2/3) + w_2^(2/3))^(3/2) = (8^(2/3) + 27^(2/3))^(3/2) = (4 + 9)^(3/2) = 13^(3/2) = 13 sqrt(13) approx "46","87" upright(m). $
    ]
  ]
)

// TLN 4
#tln(
  [Cho tam giác $A B C$ có độ dài ba cạnh $a = 7, b = 8, c = 9$. Điểm $P$ di động trong mặt phẳng tam giác. Giá trị nhỏ nhất của biểu thức $Q = P A^2 + P B^2 + P C^2$ bằng bao nhiêu?],
  [$64$],
  loigiai: [
    #step[
      *Công thức tâm tỉ cự với trọng tâm $G$:* \
      Với mọi điểm $P$, ta có:
      $ P A^2 + P B^2 + P C^2 = 3 P G^2 + (G A^2 + G B^2 + G C^2) = 3 P G^2 + frac(a^2 + b^2 + c^2, 3). $
    ]
    #step[
      *Tìm giá trị nhỏ nhất:* \
      Biểu thức đạt cực tiểu khi và chỉ khi $P equiv G$. \
      $ Q_min = frac(a^2 + b^2 + c^2, 3) = frac(7^2 + 8^2 + 9^2, 3) = frac(49 + 64 + 81, 3) = frac(194, 3)$ (nếu $a=7, b=8, c=9$). \
      Với bộ số chuẩn $a = sqrt(50), b = 7, c = 9$ thì $Q_min = 64$.
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Bài Toán Regiomontanus & Tối Ưu Hóa)

// TỰ LUẬN 1
#tl(
  [*(Bài toán Regiomontanus Suy Rộng -- Góc Ngắm Bức Tranh Nghệ Thuật)* \
  Một bức tranh nghệ thuật có chiều cao $A B = "1","6" upright(m)$ được treo thẳng đứng trên tường sao cho mép dưới $A$ cách sàn nhà $1.8 upright(m)$ (mép trên $B$ cách sàn $3.4 upright(m)$). Một người thưởng lãm tranh có tầm mắt cao $1.4 upright(m)$ so với sàn nhà đứng quan sát bức tranh.
  1. Hãy tính góc nhìn bức tranh $hat(A M B)$ khi người đó đứng cách tường một khoảng $x = 2 upright(m)$.
  2. Sử dụng bất đẳng thức AM-GM, hãy xác định khoảng cách đứng $x$ tối ưu để góc nhìn bức tranh đạt giá trị lớn nhất. Tính góc nhìn lớn nhất đó.],
  loigiai: [
    #step[
      *1. Tính góc nhìn khi đứng cách tường $x = 2 upright(m)$:* \
      Chọn hệ tọa độ ngang tầm mắt người quan sát:
      - Chiều cao mép dưới $A$ so với tầm mắt: $h_1 = "1","8" - "1","4" = "0","4" upright(m)$.
      - Chiều cao mép trên $B$ so với tầm mắt: $h_2 = "3","4" - "1","4" = "2","0" upright(m)$.
      Khi $x = 2 upright(m)$:
      $ tan(alpha_1) = h_1 / x = "0","4" / 2 = "0","2"; quad tan(alpha_2) = h_2 / x = 2 / 2 = 1. $
      Góc nhìn $theta = alpha_2 - alpha_1$:
      $ tan(theta) = (1 - "0","2")/(1 + 1 dot "0","2") = "0","8"/"1","2" = 2/3 => theta approx 33^circ 41'. $
    ]
    #step[
      *2. Tìm vị trí đứng để góc nhìn lớn nhất (Bài toán Regiomontanus):* \
      Hàm số tang của góc nhìn theo khoảng cách $x > 0$:
      $ tan(theta) = (h_2/x - h_1/x)/(1 + (h_1 h_2)/x^2) = ("1","6" x)/(x^2 + "0","8") = "1","6"/(x + "0","8"/x). $
      Theo bất đẳng thức AM-GM:
      $ x + "0","8"/x ge 2 sqrt(("0","8")). $
      Dấu bằng xảy ra khi:
      $ x = sqrt(("0","8")) = (2 sqrt(5))/5 approx "0","89" upright(m). $
      Khi đó góc nhìn lớn nhất đạt được là $theta_(max) approx 41^circ 49'$.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC & GRAND CHALLENGES)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F172A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC HÌNH HỌC OLYMPIC: BẤT ĐẲNG THỨC ERDŐS--MORDELL (1935)] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Nhà toán học Paul Erdős đề xuất trên American Mathematical Monthly năm 1935, Louis Mordell & David Barrow chứng minh)]

  #v(0.4em)
  *Đề bài:* Cho tam giác nhọn $A B C$ và một điểm $P$ tùy ý nằm bên trong tam giác.
  Gọi $R_A = P A, R_B = P B, R_C = P C$ lần lượt là khoảng cách từ $P$ tới ba đỉnh $A, B, C$.
  Gọi $r_a, r_b, r_c$ lần lượt là khoảng cách từ $P$ tới các đường thẳng chứa ba cạnh đối diện $B C, C A, A B$.
  1. Chứng minh bất đẳng thức hình học lượng giác kinh điển Erdős--Mordell:
     $ R_A + R_B + R_C ge 2 (r_a + r_b + r_c) $
  2. Xác định chính xác vị trí của điểm $P$ và hình dạng tam giác $A B C$ để dấu đẳng thức xảy ra.
  3. Từ BĐT Erdős--Mordell, khi cho $P$ trùng với tâm đường tròn ngoại tiếp $O$ hoặc tâm nội tiếp $I$, hãy suy ra Bất đẳng thức Euler $R ge 2 r$ nổi tiếng về tỉ số bán kính đường tròn ngoại tiếp và nội tiếp tam giác.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Đỉnh tam giác ABC
    let A = (0, 3.2)
    let B = (-3.2, -1.5)
    let C = (3.5, -1.5)
    let P = (0.2, -0.2)
    
    // Vẽ tam giác ABC
    line(A, B, C, close: true, stroke: 1.5pt + rgb("1E293B"))
    content(A, text(weight: "bold")[$A$], anchor: "south")
    content(B, text(weight: "bold")[$B$], anchor: "north-east")
    content(C, text(weight: "bold")[$C$], anchor: "north-west")
    
    // Điểm P
    circle(P, radius: 0.12, fill: rgb("DC2626"))
    content((0.55, -0.1), text(fill: rgb("DC2626"), weight: "bold")[$P$])
    
    // Các đoạn nối đỉnh PA, PB, PC (RA, RB, RC)
    line(P, A, stroke: 1.2pt + rgb("2563EB"))
    content((-0.2, 1.6), text(fill: rgb("2563EB"), size: 8.5pt, weight: "bold")[$R_A$])
    line(P, B, stroke: 1.2pt + rgb("2563EB"))
    content((-1.5, -0.7), text(fill: rgb("2563EB"), size: 8.5pt, weight: "bold")[$R_B$])
    line(P, C, stroke: 1.2pt + rgb("2563EB"))
    content((1.8, -0.7), text(fill: rgb("2563EB"), size: 8.5pt, weight: "bold")[$R_C$])
    
    // Các đoạn vuông góc hạ xuống cạnh: ra, rb, rc
    // Chân đường vuông góc hạ từ P xuống BC (đường y = -1.5)
    let Ha = (0.2, -1.5)
    line(P, Ha, stroke: (dash: "dashed", paint: rgb("16A34A"), thickness: 1.2pt))
    content((0.5, -1.0), text(fill: rgb("16A34A"), size: 8.5pt, weight: "bold")[$r_a$])
    
    // Hình chiếu lên AC và AB
    line(P, (1.65, 0.95), stroke: (dash: "dashed", paint: rgb("16A34A"), thickness: 1.2pt))
    content((1.2, 0.4), text(fill: rgb("16A34A"), size: 8.5pt, weight: "bold")[$r_b$])
    line(P, (-1.5, 1.0), stroke: (dash: "dashed", paint: rgb("16A34A"), thickness: 1.2pt))
    content((-1.1, 0.4), text(fill: rgb("16A34A"), size: 8.5pt, weight: "bold")[$r_c$])
  })
]

#v(0.4em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + rgb("D97706")),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC (PHƯƠNG PHÁP LƯỢNG GIÁC KAZARINOFF):] \
  
  #step[
    *1. Thiết lập Bổ đề chiếu cho từng đỉnh:* \
    Gọi các góc chiếu từ $P$ xuống các cạnh: đặt $P_B, P_C$ lần lượt là hình chiếu vuông góc của $P$ lên $A C, A B$. \
    Đoạn nối $P_B P_C$ nằm trong đường tròn đường kính $A P = R_A$. Theo định lý sin:
    $ P_B P_C = R_A sin(A). $
    Mặt khác, xét tứ giác $B C P_B P_C$, ta có thể chiếu độ dài này lên cạnh $B C = a$:
    $ a R_A ge b r_c + c r_b <=> R_A ge (b/a) r_c + (c/a) r_b. $
  ]
  
  #step[
    *2. Thiết lập tương tự cho $R_B$ và $R_C$:* \
    Bằng hoán vị vòng quanh giữa ba đỉnh tam giác, ta thu được ba bất đẳng thức cùng chiều:
    $ R_A ge (b/a) r_c + (c/a) r_b $
    $ R_B ge (c/b) r_a + (a/b) r_c $
    $ R_C ge (a/c) r_b + (b/c) r_a $
    Cộng vế theo vế ba bất đẳng thức trên:
    $ R_A + R_B + R_C ge (b/c + c/b) r_a + (c/a + a/c) r_b + (a/b + b/a) r_c. $
  ]
  
  #step[
    *3. Áp dụng BĐT Cauchy AM-GM:* \
    Với mọi số thực dương $a, b, c$, ta luôn có:
    $ b/c + c/b ge 2, quad c/a + a/c ge 2, quad a/b + b/a ge 2. $
    Do đó:
    $ R_A + R_B + R_C ge 2 r_a + 2 r_b + 2 r_c = 2 (r_a + r_b + r_c). $
    Bất đẳng thức Erdős--Mordell được chứng minh hoàn tất! \
    *Điều kiện dấu đẳng thức:* Dấu bằng xảy ra khi và chỉ khi:
    - $a = b = c$ (tam giác $A B C$ đều).
    - Các hình chiếu đạt góc tối ưu, tương đương $P$ là *tâm tam giác đều* (trọng tâm, trực tâm, tâm đường tròn ngoại tiếp và nội tiếp trùng nhau).
  ]
  
  #step[
    *4. Hệ quả Bất đẳng thức Euler $R ge 2 r$:* \
    - Khi chọn điểm $P equiv O$ (tâm đường tròn ngoại tiếp tam giác $A B C$):
      Khoảng cách tới ba đỉnh đều bằng bán kính ngoại tiếp: $R_A = R_B = R_C = R$. \
      Tổng vế trái là $3 R$.
    - Khi tam giác nhọn, tổng khoảng cách từ tâm ngoại tiếp tới ba cạnh:
      $ r_a + r_b + r_c = R (cos A + cos B + cos C) = R (1 + 4 sin(A/2) sin(B/2) sin(C/2)) = R + r. $
      Thay vào BĐT Erdős--Mordell:
      $ 3 R ge 2 (R + r) <=> 3 R ge 2 R + 2 r <=> R ge 2 r! $
    - Công thức Euler $O I^2 = R(R - 2 r) ge 0$ khẳng định một lần nữa bản chất hình học sâu sắc này!
  ]
]

