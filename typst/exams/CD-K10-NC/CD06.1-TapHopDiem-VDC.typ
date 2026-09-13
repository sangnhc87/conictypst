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
  stroke: (bottom: 2pt + rgb("831843")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("831843"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("BE185D")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("BE185D"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("DB2777")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("DB2777"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("BE185D")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Tập hợp điểm
#let c-pink-dark = rgb("831843")
#let c-pink = rgb("BE185D")
#let c-rose = rgb("E11D48")
#let c-red = rgb("DC2626")
#let c-amber = rgb("D97706")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-pink = rgb("FDF2F8")
#let c-border = rgb("FCE7F3")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-pink,
    stroke: (
      left: 6pt + c-pink-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-pink-dark)[
      CHUYÊN ĐỀ 6.1: TẬP HỢP ĐIỂM & QUỸ TÍCH HÌNH HỌC VECTƠ (VDC)
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Quỹ Tích Đường Trung Trực, Đường Tròn & Đường Tròn Apollonius · Phương Tích & Trục Đẳng Phương\
      Kỹ Thuật Tâm Tỉ Cự Hóa Quỹ Tích · Ứng Dụng Radar, Viễn Thông 5G & Vùng Phủ Sóng — Dành cho 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("BE185D"), rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-pink-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("64748B"))[Từ hình học động Euclid đến Phương trình đại số chuẩn tắc · Khám phá Đường tròn Apollonius · Nền tảng Định vị Không gian]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Vào thế kỷ thứ 3 TCN, nhà toán học Hy Lạp cổ đại *Apollonius xứ Perga* (được mệnh danh là "Nhà hình học vĩ đại") đã phát hiện một định lý làm kinh ngạc thế giới: *Tập hợp tất cả các điểm có tỉ số khoảng cách đến hai điểm cố định bằng một hằng số $k eq.not 1$ là một đường tròn hoàn hảo* (ngày nay mang tên *Đường tròn Apollonius*). Cùng với khái niệm quỹ tích của *René Descartes* và *Pierre de Fermat*, bài toán tập hợp điểm đã trở thành cây cầu nối kỳ diệu giữa hình học thuần túy và giải tích hiện đại.

  - *2. Tại sao phải học bài này? (Vượt qua nỗi sợ hình học động):*
    Học sinh THCS thường rất sợ các bài toán quỹ tích vì phải chứng minh hai chiều (phần thuận, phần đảo và giới hạn quỹ tích) với nhiều đường phụ khó đoán. Khi lên lớp 10, vectơ biến toàn bộ bài toán quỹ tích thành *các phép biến đổi đại số tương đương một chiều*:
    Nhờ kỹ thuật dời gốc tâm tỉ cự, mọi hệ thức vectơ dù phức tạp đến đâu cũng được đưa về các dạng chuẩn tắc: $M I = R$ (đường tròn), $M A = M B$ (đường trung trực), hoặc $vec(M A) dot vec(M B) = 0$ (đường tròn đường kính $A B$).

  - *3. Học để làm gì? (Kỷ nguyên 5G, Radar Hàng hải & Robot tự hành):*
    Trong kỹ thuật viễn thông hiện đại, khi hai trạm phát sóng 5G đặt tại $A$ và $B$ phát tín hiệu với công suất khác nhau (ví dụ trạm $A$ mạnh gấp đôi trạm $B$), đường ranh giới nơi điện thoại nhận được cường độ sóng như nhau chính là *Đường tròn Apollonius*! Các kỹ sư mạng viễn thông dùng đúng định lý này để chia ô phủ sóng di động (Cellular Network Planning). Trong robot tự hành, bài toán né tránh vật cản chính là tìm quỹ đạo di chuyển nằm ngoài các đường tròn tập hợp điểm nguy hiểm.

  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy mở đầu bài học bằng một câu đố thực tế: "Hai người bạn cùng hẹn gặp nhau tại một quán cà phê, nhưng một người đi xe máy nhanh gấp đôi người đi xe đạp. Những quán cà phê nào mà hai người xuất phát cùng lúc sẽ đến nơi cùng một thời điểm?" Học sinh sẽ ngỡ ngàng khi biết tất cả các quán cà phê đó đều nằm trên một đường tròn Apollonius xinh đẹp!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & NĂM DẠNG CHUẨN TẮC QUỸ TÍCH VECTƠ
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FDF2F8"),
  stroke: (left: 3pt + c-pink),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-pink-dark)[Bảng Tổng Hợp Năm Dạng Chuẩn Tắc Quỹ Tích Vectơ] \
  - *Dạng 1: Đường tròn tâm $I$ bán kính $R$ cố định*:
    $ |sum k_i vec(M A_i)| = c <=> |(sum k_i) vec(M I)| = c <=> M I = c / (|sum k_i|) = R quad ("với" sum k_i eq.not 0). $
    $<=>$ Tập hợp điểm $M$ là đường tròn tâm $I$ bán kính $R$.
  - *Dạng 2: Đường trung trực của đoạn thẳng*:
    $ |vec(M A) + vec(M B)| = |vec(M C) + vec(M D)| <=> 2 M I = 2 M J <=> M I = M J, $
    trong đó $I, J$ lần lượt là trung điểm của $A B$ và $C D$. \
    $<=>$ Tập hợp điểm $M$ là đường trung trực của đoạn thẳng $I J$.
  - *Dạng 3: Đường tròn đường kính $A B$*:
    $ vec(M A) dot vec(M B) = 0 <=> M A perp M B <=> M $ nhìn đoạn thẳng $A B$ dưới một góc vuông. \
    $<=>$ Tập hợp điểm $M$ là đường tròn đường kính $A B$.
  - *Dạng 4: Đường tròn Apollonius*:
    Cho hai điểm phân biệt $A, B$ và số thực dương $k eq.not 1$. Tập hợp các điểm $M$ thỏa mãn:
    $ (M A)/(M B) = k $
    là một đường tròn có đường kính là đoạn thẳng $E F$, trong đó $E$ và $F$ lần lượt là các điểm chia trong và chia ngoài đoạn thẳng $A B$ theo tỉ số $k$:
    $ vec(E A) = -k vec(E B), quad vec(F A) = k vec(F B). $
  - *Dạng 5: Đường thẳng vuông góc*:
    $ M A^2 - M B^2 = k (k "là hằng số") <=> vec(A B) dot (vec(M A) + vec(M B)) = k <=> 2 vec(A B) dot vec(M I) = k $ ($I$ là trung điểm $A B$). \
    $<=>$ Tập hợp điểm $M$ là đường thẳng vuông góc với $A B$ tại một điểm xác định trên $A B$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đoạn AB trên trục hoành
    let ax = -2
    let bx = 2
    line((-4, 0), (6, 0), stroke: 0.8pt + rgb("94A3B8"))
    circle((ax, 0), radius: 2.5pt, fill: c-blue)
    content((ax, -0.4), text(fill: c-blue, weight: "bold")[$A$])
    circle((bx, 0), radius: 2.5pt, fill: c-blue)
    content((bx, -0.4), text(fill: c-blue, weight: "bold")[$B$])

    // Điểm chia trong E và chia ngoài F với k = 2
    // MA = 2 MB. EA = 2 EB -> E chia AB theo tỉ số 2:1. AB = 4. EB = 4/3 ~ 1.33 -> Ex = 2 - 1.33 = 0.67
    let ex = 0.667
    let fx = 6
    circle((ex, 0), radius: 2pt, fill: c-amber)
    content((ex, -0.4), text(fill: c-amber, weight: "bold")[$E$])
    circle((fx, 0), radius: 2pt, fill: c-amber)
    content((fx, -0.4), text(fill: c-amber, weight: "bold")[$F$])

    // Tâm đường tròn Apollonius: trung điểm EF
    let ox = (ex + fx) / 2 // 3.333
    let r_apo = (fx - ex) / 2 // 2.667
    circle((ox, 0), radius: 2.5pt, fill: c-pink-dark)
    content((ox, -0.4), text(fill: c-pink-dark, weight: "bold")[$O_("Apo")$])

    // Vẽ đường tròn Apollonius
    circle((ox, 0), radius: r_apo, stroke: 1.8pt + c-pink)
    content((ox, r_apo + 0.35), text(fill: c-pink, weight: "bold")[Đường tròn Apollonius $(M A = 2 M B)$])

    // Một điểm M trên đường tròn
    let mx = ox + r_apo * calc.cos(60deg)
    let my = r_apo * calc.sin(60deg)
    circle((mx, my), radius: 2.5pt, fill: c-red)
    content((mx + 0.3, my + 0.2), text(fill: c-red, weight: "bold")[$M$])
    line((ax, 0), (mx, my), stroke: 1.2pt + c-blue)
    line((bx, 0), (mx, my), stroke: 1.2pt + c-emerald)
  })
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN TẬP HỢP ĐIỂM VDC & KỸ THUẬT GIẢI QUYẾT
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Quỹ tích đường tròn xác định bởi độ dài vectơ chứa tham số*
  - Khảo sát biểu thức $|a vec(M A) + b vec(M B) + c vec(M C)| = k$.
  - Tìm tâm tỉ cự $I$ của hệ điểm với các trọng số $a, b, c$.
  - Bán kính đường tròn phụ thuộc tham số $R(m) = k(m) / |a + b + c|$. Biện luận điều kiện đường tròn tồn tại hoặc tiếp xúc với một đường thẳng cho trước.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Quỹ tích liên quan đến Tích vô hướng & Đường tròn Apollonius*
  - Biểu thức dạng $vec(M A) dot vec(M B) = k$ đưa về $M I^2 - A B^2 / 4 = k <=> M I = sqrt(k + A B^2 / 4)$.
  - Tỉ số khoảng cách $M A / M B = k$ đưa về đường tròn Apollonius với tâm và bán kính tính bằng công thức tọa độ.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Bài toán Cực trị khoảng cách trên quỹ tích tập hợp điểm*
  - Khi điểm $M$ di động trên đường tròn quỹ tích $(C)$ tâm $I$ bán kính $R$:
    + Khoảng cách từ một điểm cố định $P$ đến $M$: $d_("min") = |P I - R|$, $d_("max") = P I + R$.
    + Tiếp tuyến từ $P$ đến đường tròn: độ dài tiếp tuyến $P T = sqrt(P I^2 - R^2)$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bài toán Thực tế Viễn thông & Radar Vùng phủ sóng*
  - Mô hình hóa ranh giới thu nhận tín hiệu giữa hai trạm thu phát có công suất $P_1, P_2$.
  - Xác định vị trí lắp đặt trạm tiếp sóng tối ưu trên đường tròn Apollonius.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: QUỸ TÍCH ĐƯỜNG TRÒN TÂM TỈ CỰ ─────────────────
#tln(
  [*(Xác định quỹ tích đường tròn bằng kỹ thuật tâm tỉ cự)*: \
  Cho tam giác $A B C$ có trọng tâm $G$ và $A B = 6, A C = 8, B C = 10$. Tìm tập hợp tất cả các điểm $M$ trong mặt phẳng thỏa mãn đẳng thức vectơ:
  $ |2 vec(M A) + vec(M B) + vec(M C)| = 2 |vec(M B) - vec(M C)|. $
  Tính chu vi và diện tích của hình phẳng giới hạn bởi quỹ tích của điểm $M$.],
  [Đường tròn tâm $I$ bán kính $R = 5$; Chu vi $10pi$, diện tích $25pi$],
  loigiai: [
    #step[
      *Bước 1: Thu gọn vế trái bằng tâm tỉ cự:* \
      Xét vế trái: Gọi $I$ là điểm thỏa mãn $2 vec(I A) + vec(I B) + vec(I C) = vec(0)$. \
      Vì tổng hệ số $2 + 1 + 1 = 4 eq.not 0$ nên điểm $I$ tồn tại duy nhất. \
      Gọi $M_0$ là trung điểm của $B C$, ta có $vec(I B) + vec(I C) = 2 vec(I M_0)$. \
      Do đó: $2 vec(I A) + 2 vec(I M_0) = vec(0) <=> vec(I A) + vec(I M_0) = vec(0) <=> I$ là trung điểm của đoạn nối đỉnh $A$ với trung điểm $M_0$ của $B C$. \
      Khi đó với mọi điểm $M$:
      $ 2 vec(M A) + vec(M B) + vec(M C) = 4 vec(M I). $
      Suy ra: $|2 vec(M A) + vec(M B) + vec(M C)| = 4 M I$.
    ]
    #step[
      *Bước 2: Thu gọn vế phải:* \
      Theo quy tắc trừ vectơ:
      $ vec(M B) - vec(M C) = vec(C B). $
      Do đó:
      $ 2 |vec(M B) - vec(M C)| = 2 |vec(C B)| = 2 B C = 2 times 10 = 20. $
    ]
    #step[
      *Bước 3: Xác định quỹ tích và tính chu vi, diện tích:* \
      Đẳng thức đã cho tương đương với:
      $ 4 M I = 20 <=> M I = 5. $
      Vì $I$ là điểm cố định và $R = 5$ là hằng số không đổi, tập hợp các điểm $M$ là *đường tròn tâm $I$ bán kính $R = 5$*. \
      - Chu vi đường tròn: $C = 2 pi R = 2 pi times 5 = 10 pi$. \
      - Diện tích hình tròn giới hạn: $S = pi R^2 = pi times 5^2 = 25 pi$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2: ĐƯỜNG TRÒN APOLLONIUS & TRẠM VIỄN THÔNG 5G ─────
#tln(
  [*(Ứng dụng thực tế: Cân bằng vùng phủ sóng viễn thông 5G giữa hai trạm phát)*: \
  Hai trạm phát sóng di động $A$ và $B$ đặt cách nhau một khoảng $A B = 6$ km. Công suất của trạm $A$ mạnh hơn trạm $B$ nên cường độ sóng đo được từ máy thu tại vị trí $M$ tỷ lệ nghịch với bình phương khoảng cách. Để chất lượng cuộc gọi từ hai trạm cân bằng nhau, khoảng cách từ thiết bị $M$ đến trạm $A$ phải gấp đôi khoảng cách từ $M$ đến trạm $B$ ($M A = 2 M B$).
  1. Chứng minh rằng tập hợp các vị trí đặt thiết bị $M$ là một đường tròn Apollonius.
  2. Hãy tính bán kính của đường tròn này và khoảng cách từ tâm đường tròn đến trạm phát $A$ (đơn vị: km).],
  [$R_("Apo") = 4$ km; Khoảng cách đến $A$ là $8$ km],
  loigiai: [
    #step[
      *Bước 1: Xác định điểm chia trong $E$ và điểm chia ngoài $F$:* \
      Điều kiện bài toán: $(M A)/(M B) = 2$ ($k = 2$). \
      - Điểm chia trong $E$ trên đoạn $A B$:
        $ vec(E A) = -2 vec(E B) <=> E A = 2 E B. $
        Vì $E A + E B = A B = 6$ nên $2 E B + E B = 6 <=> 3 E B = 6 => E B = 2$ km, $E A = 4$ km.
      - Điểm chia ngoài $F$ trên đường thẳng $A B$:
        $ vec(F A) = 2 vec(F B) <=> F A = 2 F B. $
        Vì $F$ nằm ngoài đoạn $A B$ về phía $B$: $F A - F B = A B <=> 2 F B - F B = 6 => F B = 6$ km, $F A = 12$ km.
    ]
    #step[
      *Bước 2: Chứng minh tính chất trực giao góc vuông:* \
      Theo tính chất đường phân giác trong và ngoài của tam giác $M A B$:
      - $M E$ là đường phân giác trong của góc $hat(A M B)$.
      - $M F$ là đường phân giác ngoài của góc $hat(A M B)$. \
      Vì hai đường phân giác trong và ngoài luôn vuông góc với nhau:
      $ M E perp M F <=> hat(E M F) = 90^circle. $
      Suy ra điểm $M$ luôn nhìn đoạn thẳng cố định $E F$ dưới một góc vuông. \
      Vậy quỹ tích của điểm $M$ là *đường tròn đường kính $E F$* (Đường tròn Apollonius).
    ]
    #step[
      *Bước 3: Tính bán kính và tọa độ tâm:* \
      Độ dài đường kính $E F$:
      $ E F = E B + B F = 2 + 6 = 8 quad text("(km)"). $
      Bán kính đường tròn Apollonius:
      $ R_("Apo") = (E F)/2 = 8 / 2 = 4 quad text("(km)"). $
      Tâm $O_("Apo")$ là trung điểm của $E F$:
      Khoảng cách từ $A$ đến tâm: $A O_("Apo") = A E + E O_("Apo") = 4 + 4 = 8$ km.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần I: Trắc nghiệm 4 phương án lựa chọn

// ── CÂU 1 ─────────────────────────────────────────────────────
#tn(
  [Cho hai điểm cố định $A, B$ phân biệt. Tập hợp các điểm $M$ thỏa mãn đẳng thức $|vec(M A) + vec(M B)| = |vec(M A) - vec(M B)|$ là hình gì?],
  (
    [Đường trung trực của đoạn thẳng $A B$],
    True([Đường tròn đường kính $A B$]),
    [Đoạn thẳng $A B$],
    [Đường tròn tâm $A$ bán kính $A B$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Biến đổi hệ thức vectơ:* \
      Gọi $I$ là trung điểm của $A B$. \
      - Vế trái: $vec(M A) + vec(M B) = 2 vec(M I) => |vec(M A) + vec(M B)| = 2 M I$.
      - Vế phải: $vec(M A) - vec(M B) = vec(B A) => |vec(M A) - vec(M B)| = A B$. \
      Đẳng thức đã cho tương đương với:
      $ 2 M I = A B <=> M I = (A B)/2. $
      Vì $I$ cố định và $A B / 2$ không đổi, tập hợp điểm $M$ là *đường tròn tâm $I$ bán kính $A B / 2$*, tức là *đường tròn đường kính $A B$*. Chọn đáp án *B*.
    ]
  ]
)

#v(0.5em)

== Phần II: Trắc nghiệm Đúng / Sai

// ── CÂU 2 (ĐÚNG/SAI) ──────────────────────────────────────────
#ds(
  [Cho đoạn thẳng $A B = 6$ cm có trung điểm $I$. Xét các tập hợp điểm $M$ thỏa mãn các điều kiện sau:],
  (
    True([Nếu $vec(M A) dot vec(M B) = 0$ thì tập hợp điểm $M$ là đường tròn đường kính $A B$ bán kính $R = 3$ cm.]),
    True([Nếu $vec(M A) dot vec(M B) = 7$ thì tập hợp điểm $M$ là đường tròn đồng tâm $I$ bán kính $R = 4$ cm.]),
    False([Nếu $M A / M B = 1$ thì tập hợp điểm $M$ là đường tròn Apollonius.]),
    True([Nếu $M A^2 - M B^2 = 12$ thì tập hợp điểm $M$ là một đường thẳng vuông góc với $A B$.]),
  ),
  loigiai: [
    *(a) Đúng.* $vec(M A) dot vec(M B) = 0 <=> M A perp M B => M$ thuộc đường tròn đường kính $A B$. \
    *(b) Đúng.* $vec(M A) dot vec(M B) = (vec(M I) + vec(I A)) dot (vec(M I) + vec(I B)) = M I^2 - I A^2 = M I^2 - 3^2 = M I^2 - 9$. \
    Phương trình: $M I^2 - 9 = 7 <=> M I^2 = 16 <=> M I = 4$ cm (đường tròn tâm $I$ bán kính $4$ cm). \
    *(c) Sai.* Khi $M A / M B = 1 <=> M A = M B$, tập hợp điểm $M$ là *đường trung trực* của đoạn thẳng $A B$, không phải đường tròn (đường tròn Apollonius chỉ xét khi $k eq.not 1$). \
    *(d) Đúng.* $M A^2 - M B^2 = (vec(M A) + vec(M B)) dot (vec(M A) - vec(M B)) = 2 vec(M I) dot vec(B A) = 12$. Đây là phương trình đường thẳng vuông góc với $A B$.
  ]
)

#v(0.5em)

== Phần III: Trắc nghiệm Trả lời ngắn

// ── CÂU 3 (TRẢ LỜI NGẮN) ──────────────────────────────────────
#tln(
  [Cho tam giác $A B C$ đều cạnh $a = 4$. Tập hợp các điểm $M$ thỏa mãn $|vec(M A) + 2 vec(M B) + 3 vec(M C)| = 12$ là một đường tròn có bán kính $R$. Hãy tính giá trị của $R$.],
  [$2$],
  loigiai: [
    #step[
      *Thu gọn bằng tâm tỉ cự:* \
      Gọi $J$ là tâm tỉ cự của hệ ba điểm $A, B, C$ với các hệ số tương ứng $1, 2, 3$:
      $ 1 vec(J A) + 2 vec(J B) + 3 vec(J C) = vec(0). $
      Vì $1 + 2 + 3 = 6 eq.not 0$ nên điểm $J$ tồn tại duy nhất. \
      Khi đó:
      $ vec(M A) + 2 vec(M B) + 3 vec(M C) = 6 vec(M J). $
      Đẳng thức bài toán trở thành:
      $ |6 vec(M J)| = 12 <=> 6 M J = 12 <=> M J = 2. $
      Vậy tập hợp điểm $M$ là đường tròn tâm $J$ bán kính $R = 2$. Đáp số: *2*.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC ĐỈNH CAO: TRỤC ĐẲNG PHƯƠNG & QUỸ TÍCH
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[BÀI TOÁN OLYMPIC: TRỤC ĐẲNG PHƯƠNG CỦA HAI ĐƯỜNG TRÒN KHÔNG ĐỒNG TÂM] \
  *Đề bài*: Cho hai đường tròn không đồng tâm $(C_1)$ tâm $O_1$ bán kính $R_1$ và $(C_2)$ tâm $O_2$ bán kính $R_2$. Tập hợp tất cả các điểm $M$ có phương tích bằng nhau đối với hai đường tròn:
  $ cal(P)_(M / (C_1)) = cal(P)_(M / (C_2)) <=> M O_1^2 - R_1^2 = M O_2^2 - R_2^2 $
  được gọi là *Trục đẳng phương* của hai đường tròn:
  1. Chứng minh rằng trục đẳng phương luôn là một đường thẳng vuông góc với đường nối tâm $O_1 O_2$.
  2. Khi hai đường tròn cắt nhau tại hai điểm phân biệt $A$ và $B$, hãy chứng minh trục đẳng phương chính là đường thẳng chứa dây cung chung $A B$.

  #v(0.4em)
  #text(weight: "bold", fill: c-pink-dark)[Hướng dẫn giải tư duy chuyên sâu:] \
  Biến đổi hệ thức phương tích:
  $ M O_1^2 - M O_2^2 = R_1^2 - R_2^2. $
  Gọi $I$ là trung điểm của đoạn nối tâm $O_1 O_2$. Theo công thức hiệu bình phương:
  $ (vec(M O_1) - vec(M O_2)) dot (vec(M O_1) + vec(M O_2)) = R_1^2 - R_2^2 <=> vec(O_2 O_1) dot (2 vec(M I)) = R_1^2 - R_2^2. $
  Gọi $H$ là hình chiếu vuông góc của $M$ lên đường thẳng $O_1 O_2$:
  $ 2 vec(O_1 O_2) dot vec(I H) = R_2^2 - R_1^2. $
  Vì vế phải là hằng số và $O_1, O_2, I$ cố định, điểm $H$ là điểm duy nhất cố định trên đường thẳng $O_1 O_2$. \
  Do đó tập hợp các điểm $M$ là *đường thẳng vuông góc với $O_1 O_2$ tại điểm $H$* (Trục đẳng phương). \
  Khi hai đường tròn cắt nhau tại $A$ và $B$:
  Vì $A$ thuộc cả hai đường tròn nên $cal(P)_(A / (C_1)) = cal(P)_(A / (C_2)) = 0$. \
  Tương tự với $B$, $cal(P)_(B / (C_1)) = cal(P)_(B / (C_2)) = 0$. \
  Vì cả $A$ và $B$ đều có phương tích bằng nhau đối với hai đường tròn nên đường thẳng $A B$ chính là trục đẳng phương!
]
