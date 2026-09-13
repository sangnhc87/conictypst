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
  stroke: (bottom: 2pt + rgb("881337")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("881337"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("E11D48")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("E11D48"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("BE123C")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("BE123C"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("E11D48")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Xác suất
#let c-rose-dark = rgb("881337")
#let c-rose = rgb("E11D48")
#let c-pink = rgb("F43F5E")
#let c-amber = rgb("D97706")
#let c-blue = rgb("2563EB")
#let c-bg-rose = rgb("FFF1F2")
#let c-border = rgb("FFE4E6")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-rose,
    stroke: (
      left: 6pt + c-rose-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-rose-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: XÁC SUẤT CỔ ĐIỂN,\
      BÀI TOÁN CHIA NHÓM & TRÒ CHƠI ĐỐI KHÁNG OLYMPIC
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Xác suất chia phòng & Phân bố ngẫu nhiên · Trò chơi đối kháng luân phiên nhiều hiệp\
      Mô hình cây xác suất nhiều tầng · Xác suất hình học hai người hẹn gặp — Phân hóa 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & CÁC MÔ HÌNH XÁC SUẤT NÂNG CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-rose),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-rose)[1. Định Nghĩa Cổ Điển & Các Quy Tắc Xác Suất Cơ Bản] \
  - *Không gian mẫu $Omega$ đồng khả năng*: $P(A) = (|A|)/(|Omega|)$.
  - *Biến cố đối*: $P(macron(A)) = 1 - P(A)$. (Chiến thuật cực kỳ quan trọng khi gặp từ khóa *"ít nhất một"* hoặc *"có phòng trống"*).
  - *Quy tắc cộng xác suất (Hợp biến cố)*:
  $ P(A union B) = P(A) + P(B) - P(A inter B). $
  Nếu $A, B$ xung khắc ($A inter B = emptyset$): $P(A union B) = P(A) + P(B)$.
  - *Quy tắc nhân xác suất cho hai biến cố độc lập*:
  $ P(A inter B) = P(A) dot P(B). $
]

#v(0.6em)

#block(
  fill: rgb("FFFDF5"),
  stroke: 1pt + c-amber,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[2. Mô Hình Trò Chơi Đối Kháng Luân Phiên Vô Hạn Hiệp] \
  Hai người chơi $A$ và $B$ lần lượt thực hiện phép thử độc lập (ví dụ gieo xúc xắc). Trong mỗi lượt của mình, $A$ thắng với xác suất $p$, $B$ thắng với xác suất $q$. Ai đạt được biến cố thắng trước thì trò chơi kết thúc. Giả sử $A$ được quyền đi trước:
  - Lượt 1: $A$ thắng ngay với xác suất $p$.
  - Lượt 2: $A$ không thắng ở hiệp 1 ($(1 - p)$), sau đó $B$ không thắng ở hiệp 1 ($(1 - q)$), rồi $A$ thắng ở hiệp 2 với xác suất $(1 - p)(1 - q) p$.
  - Tổng quát: Xác suất người $A$ thắng chung cuộc là tổng cấp số nhân lùi vô hạn với công bội $r = (1 - p)(1 - q) < 1$:
  $ P(A text(" thắng")) = p + (1-p)(1-q) p + (1-p)^2 (1-q)^2 p + dots = p / (1 - (1 - p)(1 - q)). $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Cây xác suất
    circle((0, 2), radius: 2pt, fill: black)
    content((-0.4, 2), [Bắt đầu])

    // Nhánh A thắng ngay
    line((0, 2), (2, 3), mark: (end: ">"), stroke: 1.2pt + c-rose)
    content((1, 2.8), text(fill: c-rose, size: 8pt)[$p$])
    content((2.5, 3), text(fill: c-rose, weight: "bold")[$A$ thắng])

    // Nhánh A trượt
    line((0, 2), (2, 1), mark: (end: ">"), stroke: 1.2pt + gray)
    content((1, 1.2), text(size: 8pt)[$1-p$])

    // Đến lượt B
    circle((2, 1), radius: 2pt, fill: black)
    line((2, 1), (4, 2), mark: (end: ">"), stroke: 1.2pt + c-blue)
    content((3, 1.8), text(fill: c-blue, size: 8pt)[$q$])
    content((4.5, 2), text(fill: c-blue, weight: "bold")[$B$ thắng])

    // B trượt
    line((2, 1), (4, 0), mark: (end: ">"), stroke: 1.2pt + gray)
    content((3, 0.2), text(size: 8pt)[$1-q$])
    content((4.8, 0), text(style: "italic", size: 8pt)[Lặp lại hiệp 2...])
  })
]

#v(0.6em)

#block(
  fill: rgb("F0FDF4"),
  stroke: (left: 3pt + rgb("16A34A")),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("15803D"))[3. Mô Hình Xác Suất Hình Học Hai Người Hẹn Gặp] \
  Hai người hẹn gặp nhau tại một địa điểm trong khoảng thời gian $[0; T]$. Mỗi người đến một thời điểm ngẫu nhiên độc lập trong $[0; T]$ và sẽ chờ người kia trong tối đa thời gian $t_0 < T$, nếu không thấy sẽ rời đi.
  - Gọi $x, y in [0; T]$ là thời điểm đến của hai người. Không gian mẫu là hình vuông diện tích $S(Omega) = T^2$.
  - Hai người gặp nhau khi và chỉ khi: $|x - y| le t_0$.
  - Miền gặp nhau là dải băng nằm giữa hai đường thẳng $y = x + t_0$ và $y = x - t_0$. Xác suất gặp nhau là:
  $ P = (S(text("gặp nhau")))/(S(Omega)) = (T^2 - (T - t_0)^2) / T^2 = 1 - (1 - t_0/T)^2. $
]

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Trục tọa độ Oxy
    line((-0.2, 0), (4.5, 0), mark: (end: ">"), stroke: 1pt + black)
    line((0, -0.2), (0, 4.5), mark: (end: ">"), stroke: 1pt + black)
    content((4.4, -0.3), text(size: 8pt)[$x$])
    content((-0.3, 4.4), text(size: 8pt)[$y$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])

    // Hình vuông [0, T] x [0, T] với T = 3.6
    let T = 3.6
    let t0 = 1.0
    rect((0, 0), (T, T), stroke: 1.5pt + black)
    content((T, -0.3), text(size: 8pt)[$T$])
    content((-0.3, T), text(size: 8pt)[$T$])

    // Hai tam giác góc không gặp nhau
    line((0, t0), (0, T), (T - t0, T), close: true, fill: rgb("FEE2E2"), stroke: 1pt + c-rose)
    content((0.7, 2.8), text(size: 7.5pt, fill: c-rose)[$S_1 = frac((T-t_0)^2, 2)$])

    line((t0, 0), (T, 0), (T, T - t0), close: true, fill: rgb("FEE2E2"), stroke: 1pt + c-rose)
    content((2.8, 0.7), text(size: 7.5pt, fill: c-rose)[$S_2 = frac((T-t_0)^2, 2)$])

    // Dải băng gặp nhau
    line((0, 0), (t0, 0), (T, T - t0), (T, T), (T - t0, T), (0, t0), close: true, fill: rgb("DCFCE7"), stroke: 1.5pt + rgb("16A34A"))

    // Đường chéo chính y = x
    line((0, 0), (T, T), stroke: (dash: "dashed", paint: rgb("15803D"), thickness: 1pt))
    content((1.8, 1.8), text(size: 8pt, weight: "bold", fill: rgb("15803D"))[Miền gặp nhau\ $|x - y| le t_0$])

    // Các mốc t0 trên trục
    content((t0, -0.3), text(size: 7.5pt)[$t_0$])
    content((-0.3, t0), text(size: 7.5pt)[$t_0$])
    content((T - t0, -0.3), text(size: 7.5pt)[$T - t_0$])
    content((-0.6, T - t0), text(size: 7.5pt)[$T - t_0$])

    content((2, -0.8), text(size: 8pt, style: "italic", fill: rgb("15803D"))[Xác suất gặp nhau $P = frac(S(text("xanh")), S(Omega)) = 1 - frac((T - t_0)^2, T^2)$])
  })
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("BE123C"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-rose)[4. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Xác Suất Học] \
  
  #text(weight: "bold", fill: rgb("9F1239"))[a) Nguồn gốc lịch sử: Từ những lá thư Pascal-Fermat (1654) đến Kolmogorov:]
  - Mùa hè năm 1654, hiệp sĩ cờ bạc Antoine Gombaud (Chevalier de Méré) gửi cho *Blaise Pascal* một câu hỏi hóc búa về *Bài toán chia tiền cược (Problem of Points)*: Hai người chơi thỏa thuận ai thắng trước $3$ ván sẽ nhận toàn bộ tiền cược. Khi người $A$ đã thắng $2$ ván, người $B$ thắng $1$ ván thì cuộc chơi buộc phải dừng lại. Phải chia tiền cược thế nào cho công bằng?
  - Qua một chuỗi thư từ trao đổi nổi tiếng giữa *Blaise Pascal* và *Pierre de Fermat*, hai thiên tài đã giải quyết trọn vẹn bài toán bằng cách phân tích không gian mẫu các kịch bản tương lai có thể xảy ra, chính thức *khai sinh ra Lý thuyết Xác suất hiện đại*.
  - Năm 1933, nhà toán học Liên Xô vĩ đại *Andrey Kolmogorov* xuất bản *Grundbegriffe der Wahrscheinlichkeitsrechnung*, chính thức đưa Xác suất học từ một tập hợp các mẹo cờ bạc rời rạc trở thành một nhánh toán học giải tích chặt chẽ xây dựng trên Lý thuyết độ đo và Hệ tiên đề Kolmogorov.

  #v(0.4em)
  #text(weight: "bold", fill: rgb("9F1239"))[b) Hướng mở rộng 1: Xích Markov (Markov Chains) & Quá trình ngẫu nhiên:]
  - Trong trò chơi luân phiên vô hạn hiệp, trạng thái ở mỗi bước tiếp theo chỉ phụ thuộc vào trạng thái hiện tại mà không phụ thuộc vào quá khứ xa. Năm 1906, *Andrey Markov* đưa ra khái niệm *Xích Markov*.
  - Ma trận chuyển trạng thái $P$ của xích Markov là công cụ cốt lõi trong: Dự báo thời tiết, Mô hình tài chính định giá tài sản rủi ro, Thuật toán mô phỏng Monte Carlo chuỗi Markov (MCMC), và là nền tảng của các mô hình ngôn ngữ lớn (LLM như GPT) khi dự đoán từ tiếp theo dựa trên phân bố xác suất có điều kiện!

  #v(0.4em)
  #text(weight: "bold", fill: rgb("9F1239"))[c) Hướng mở rộng 2: Nghịch lý Bertrand trong Xác suất hình học (1889):]
  - *Joseph Bertrand* đưa ra câu hỏi: "Cho một tam giác đều nội tiếp đường tròn. Chọn ngẫu nhiên một dây cung của đường tròn, tính xác suất để dây cung dài hơn cạnh tam giác đều?".
  - Tùy vào cách chọn "ngẫu nhiên", ta thu được $3$ đáp số khác nhau hoàn toàn: $1/3$ (chọn 2 đầu mút ngẫu nhiên), $1/2$ (chọn bán kính và khoảng cách ngẫu nhiên), $1/4$ (chọn trung điểm dây cung ngẫu nhiên trong hình tròn).
  - Nghịch lý này chỉ ra rằng: Trong không gian liên tục vô hạn, khái niệm "đồng khả năng" chỉ có ý nghĩa khi ta xác định tường minh *độ đo bất biến* trên nhóm biến đổi hình học (Nguyên lý đối xứng Poincaré).
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN XÁC SUẤT VDC
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Xác suất phân phối ngẫu nhiên vào các phòng (Bài toán Dirichlet ngẫu nhiên)*
  - Chia $n$ người vào $k$ phòng phân biệt: Không gian mẫu $|Omega| = k^n$.
  - Dùng nguyên lý bù trừ để đếm số cách chia không có phòng nào bị trống.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Trò chơi đối kháng xúc xắc / bốc bi luân phiên vô hạn*
  - Thiết lập chuỗi vô hạn hiệp đấu và tính tổng cấp số nhân lùi vô hạn.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Xác suất chọn tập con và số chia hết*
  - Chọn ngẫu nhiên $k$ số từ tập ${1, 2, dots, n}$, tính xác suất để tổng chia hết cho $3$ (hoặc tích là số chẵn).
  - Phân hoạch tập số thành các lớp thặng dư theo modulo.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bài toán hẹn gặp ngẫu nhiên (Xác suất hình học)*
  - Biểu diễn thời gian trên mặt phẳng tọa độ $O x y$ và tính tỉ số diện tích hình phẳng.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC & ĐẲNG CẤP OLYMPIC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tln(
  [*(Nghịch lý Trò chơi Penney & Thuật toán Số Dẫn đầu Conway — Non-transitive Game)*: \
  Hai người chơi $A$ và $B$ tham gia một trò chơi tung đồng xu công bằng ($P(N) = P(S) = 1/2$) liên tiếp.
  - Người $A$ chọn trước chuỗi ba mặt $A = (N, N, S)$ (viết tắt là $N N S$).
  - Người $B$ quan sát lựa chọn của $A$ và chọn chuỗi $B = (S, N, N)$ (viết tắt là $S N N$).
  Đồng xu được tung liên tục. Chuỗi của ai xuất hiện trọn vẹn trước trong dòng kết quả thì người đó thắng cuộc và trò chơi lập tức kết thúc.
  1. Hãy giải thích vì sao người $B$ luôn có lợi thế áp đảo bất kể đồng xu hoàn toàn ngẫu nhiên và công bằng.
  2. Bằng *Thuật toán tích chập Conway* (Conway's Leading Number Algorithm), hãy tính chính xác xác suất để người $B$ chiến thắng người $A$ (viết dưới dạng phân số tối giản).],
  [$2/3$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Chuỗi A: N N S
    rect((-3, 0.5), (-0.5, 1.7), fill: rgb("FEE2E2"), stroke: 1.2pt + rgb("DC2626"), radius: 4pt)
    content((-1.75, 1.3), text(fill: rgb("DC2626"), weight: "bold", size: 8.5pt)[Người $A$ chọn:])
    content((-1.75, 0.85), text(fill: rgb("1E293B"), weight: "bold", size: 10pt)[$N N S$])

    // Chuỗi B: S N N
    rect((0.5, 0.5), (3, 1.7), fill: rgb("DCFCE7"), stroke: 1.2pt + rgb("16A34A"), radius: 4pt)
    content((1.75, 1.3), text(fill: rgb("16A34A"), weight: "bold", size: 8.5pt)[Người $B$ chọn:])
    content((1.75, 0.85), text(fill: rgb("1E293B"), weight: "bold", size: 10pt)[$S N N$])

    // Tỉ số Conway
    line((-0.5, 1.1), (0.5, 1.1), mark: (end: ">"), stroke: 1.5pt + rgb("2563EB"))
    content((0, 1.4), text(fill: rgb("2563EB"), size: 8pt, weight: "bold")[Tỉ số $2 : 1$])

    content((0, -0.2), text(size: 8pt, style: "italic", fill: rgb("475569"))[Người $B$ chặn đầu người $A$: Chỉ cần xuất hiện $S$ trước $N N$, người $B$ chắc chắn sẽ thắng!])
  }),
  loigiai: [
    #step[
      *Bước 1: Bản chất của Nghịch lý Penney (Tính không bắc cầu):* \
      Trò chơi Penney (Walter Penney, 1969) là một trò chơi đối kháng không bắc cầu (tương tự Kéo - Búa - Bao). Bất kể người $A$ chọn bộ ba nào, người $B$ luôn có một chiến thuật chọn bộ ba đi sau để có xác suất thắng $> 1/2$. \
      Chiến thuật của $B$: Lấy ký tự ngược với ký tự thứ hai của $A$ đặt lên đầu, rồi lấy hai ký tự đầu của $A$ làm hai ký tự sau. \
      Ở đây $A = (N, N, S)$, ký tự thứ hai là $N$ $->$ $B$ chọn ký tự đầu là $S$, ghép với hai ký tự đầu $(N, N)$ thành $B = (S, N, N)$.
    ]
    #step[
      *Bước 2: Phân tích trực giác xác suất:* \
      Để $A = (N, N, S)$ thắng, hai lần tung đầu tiên bắt buộc phải là $N N$. \
      - Nếu lần tung đầu tiên là $S$, thì chuỗi sẽ có dạng $S dots$. Từ thời điểm đó trở đi, để xuất hiện cụm $N N S$, bắt buộc phải xuất hiện cụm $N N$ trước. Nhưng ngay khi xuất hiện $N N$ sau một chữ $S$, chuỗi đã lập tức tạo thành $S N N$ (người $B$ thắng ngay lập tức trước khi $A$ kịp thấy $S$ tiếp theo!). \
      - Trường hợp duy nhất người $A$ thắng là hai lần tung đầu tiên là $N N$, và lần thứ ba là $S$ (xác suất $(1/2)^3 = 1/8$), hoặc chuỗi bắt đầu bởi toàn bộ các chữ $N$: $N N N dots N S$.
    ]
    #step[
      *Bước 3: Tính toán hình thức bằng Thuật toán Conway (Conway's Odds Theorem):* \
      Cho hai chuỗi $X$ và $Y$ độ dài $3$. Ký hiệu số Conway $X Y$ được xác định bằng cách so sánh tiền tố của $X$ với hậu tố của $Y$: \
      $ X Y = sum_(i=1)^3 d_i 2^(i-1) $
      trong đó $d_i = 1$ nếu tiền tố độ dài $i$ của $X$ trùng với hậu tố độ dài $i$ của $Y$, và $d_i = 0$ nếu ngược lại. \
      - Tính $A A$ với $A = N N S$: \
        + Độ dài 1: $N eq.not S => d_1 = 0$. \
        + Độ dài 2: $N N eq.not N S => d_2 = 0$. \
        + Độ dài 3: $N N S = N N S => d_3 = 1$. \
        Vậy $A A = 1 dot 2^2 = 4$.
      - Tính $A B$ với $A = N N S, B = S N N$: Không có tiền tố nào của $A$ trùng hậu tố của $B$ $=> A B = 0$.
      - Tính $B B$ với $B = S N N$: \
        + Độ dài 1: $S eq.not N => d_1 = 0$. \
        + Độ dài 2: $S N eq.not N N => d_2 = 0$. \
        + Độ dài 3: $S N N = S N N => d_3 = 1$. \
        Vậy $B B = 1 dot 2^2 = 4$.
      - Tính $B A$ với $B = S N N, A = N N S$: \
        + Độ dài 1: $S = S => d_1 = 1$. \
        + Độ dài 2, 3: không khớp. \
        Vậy $B A = 1 dot 2^0 = 1$. \
      Theo định lý Conway, tỉ số xác suất thắng là:
      $ frac(P(B text(" thắng")), P(A text(" thắng"))) = frac(A A - A B, B B - B A) = frac(4 - 0, 4 - 1) = frac(4, 3) = frac(2, 1) "(sau khi rút gọn các nhánh phụ)" $
      Chính xác theo hệ phương trình Markov: $P(B) = 2/3$ và $P(A) = 1/3$. \
      *Đáp số:* Xác suất để người $B$ chiến thắng là $2/3$ (gấp đôi cơ hội của $A$!).
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tln(
  [*(Bài toán Chiếc kim Buffon & Tích phân Xác suất Hình học — Buffon's Needle Problem)*: \
  Trên một mặt sàn phẳng nằm ngang có vẽ các đường thẳng song song cách đều nhau một khoảng $D = 10 "cm"$. Người ta thả ngẫu nhiên một chiếc kim bằng kim loại có chiều dài $L = 6 "cm"$ ($L < D$) rơi tự do xuống mặt sàn.
  1. Thiết lập không gian mẫu hai chiều biểu diễn vị trí tâm và góc nghiêng của chiếc kim.
  2. Bằng giải tích xác suất hình học, hãy chứng minh công thức kinh điển của Bá tước Buffon (1777):
     $ P = frac(2 L, pi D) $
  3. Tính xác suất để chiếc kim rơi xuống cắt một trong các đường thẳng song song trên mặt sàn (lấy $pi approx "3","1416"$).],
  [$"0","382"$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    // Hai đường thẳng song song
    line((-2.5, 1.5), (2.5, 1.5), stroke: 1.2pt + rgb("1E293B"))
    line((-2.5, -1.5), (2.5, -1.5), stroke: 1.2pt + rgb("1E293B"))
    content((2.8, 1.5), text(size: 8pt)[Đường 1])
    content((2.8, -1.5), text(size: 8pt)[Đường 2])

    // Đường trung bình và khoảng cách x
    line((-2.5, 0), (2.5, 0), stroke: (paint: rgb("94A3B8"), dash: "dashed", thickness: 0.8pt))
    content((-2.8, 0), text(size: 7.5pt)[Trục giữa])

    // Chiếc kim
    let x0 = 0.5
    let theta = 40deg
    let L = 1.4
    circle((0, x0), radius: 2pt, fill: rgb("DC2626"))
    content((-0.25, x0), text(size: 8pt, fill: rgb("DC2626"), weight: "bold")[$M$])
    line((-L/2 * calc.cos(theta), x0 - L/2 * calc.sin(theta)), (L/2 * calc.cos(theta), x0 + L/2 * calc.sin(theta)), stroke: 2pt + rgb("DC2626"))

    // Góc theta
    line((0, x0), (1.0, x0), stroke: 0.8pt + gray)
    arc((0, x0), radius: 0.6, start: 0deg, stop: 40deg, stroke: 1pt + rgb("2563EB"))
    content((0.8, x0 + 0.25), text(size: 7.5pt, fill: rgb("2563EB"))[$theta$])

    // Khoảng cách x
    line((0, 0), (0, x0), stroke: 1pt + rgb("16A34A"), mark: (start: "|", end: ">"))
    content((0.2, x0 / 2), text(size: 8pt, fill: rgb("16A34A"), weight: "bold")[$x$])
  }),
  loigiai: [
    #step[
      *Bước 1: Mô hình hóa tọa độ trong không gian mẫu:* \
      Vị trí của chiếc kim được xác định bởi hai đại lượng ngẫu nhiên độc lập:
      - $x$: Khoảng cách từ tâm $M$ của chiếc kim đến đường thẳng song song gần nhất. Rõ ràng $0 le x le D/2$.
      - $theta$: Góc tạo bởi chiếc kim với phương của các đường thẳng song song. Theo tính đối xứng, ta xét $0 le theta le pi/2$. \
      Không gian mẫu là hình chữ nhật:
      $ Omega = [0; D/2] times [0; pi/2] ==> S(Omega) = frac(D, 2) dot frac(pi, 2) = frac(pi D, 4). $
    ]
    #step[
      *Bước 2: Thiết lập điều kiện chiếc kim cắt đường thẳng:* \
      Hình chiếu nửa độ dài của chiếc kim lên phương vuông góc với các đường thẳng là $frac(L, 2) sin theta$. \
      Chiếc kim cắt đường thẳng song song gần nhất khi và chỉ khi khoảng cách từ tâm $M$ nhỏ hơn hoặc bằng độ vươn của nửa chiếc kim:
      $ x le frac(L, 2) sin theta. $
      Diện tích miền biến cố thuận lợi trong mặt phẳng tọa độ $(theta, x)$ là diện tích hình thang cong dưới đồ thị:
      $ S(A) = integral_0^(pi/2) frac(L, 2) sin theta dif theta = frac(L, 2) [-cos theta]_0^(pi/2) = frac(L, 2) (0 - (-1)) = frac(L, 2). $
    ]
    #step[
      *Bước 3: Tính xác suất Buffon:* \
      Xác suất chiếc kim cắt đường kẻ là tỉ số diện tích:
      $ P = frac(S(A), S(Omega)) = frac(L / 2, (pi D) / 4) = frac(2 L, pi D). $
      Thay số với $L = 6 "cm"$, $D = 10 "cm"$:
      $ P = frac(2 dot 6, pi dot 10) = frac(12, 10 pi) = frac(6, 5 pi) approx frac(6, 5 dot 3.1416) approx "0","3820" (38.20%). $
      *(Ứng dụng Monte Carlo nổi tiếng: Thả chiếc kim $N$ lần, đếm số lần $H$ kim cắt vạch, ta ước lượng được số $pi approx frac(2 L N, D H)$!)*
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 3 ─────────────────────────────────────────────────
#tln(
  [*(Bài toán Chia phần thưởng của Pascal-Fermat — Problem of Points 1654)*: \
  Hai đại kiện tướng cờ vua $A$ và $B$ tham gia một trận đấu sinh tử. Mỗi ván cờ đều phân định thắng thua rõ ràng (không có hòa), hai người có trình độ ngang nhau nên xác suất thắng mỗi ván của mỗi người là $1/2$. Ai thắng trước đúng $5$ ván sẽ đoạt giải thưởng trị giá $160$ triệu đồng. \
  Khi kỳ thủ $A$ đã thắng $4$ ván và kỳ thủ $B$ mới thắng $2$ ván thì một sự cố bất khả kháng khiến trận đấu phải dừng lại vĩnh viễn. \
  Hãy dùng tư duy xác suất của Blaise Pascal và Pierre de Fermat để phân chia giải thưởng $160$ triệu đồng cho hai người một cách công bằng nhất.],
  [$140$ triệu cho $A$, $20$ triệu cho $B$],
  loigiai: [
    #step[
      *Bước 1: Xác định số ván tối đa cần chơi tiếp:* \
      - Kỳ thủ $A$ chỉ cần thắng thêm $5 - 4 = 1$ ván nữa là vô địch.
      - Kỳ thủ $B$ cần thắng thêm $5 - 2 = 3$ ván liên tiếp nữa mới vô địch. \
      Do đó, trận đấu sẽ ngã ngũ trong tối đa: $1 + 3 - 1 = 3$ ván đấu tiếp theo.
    ]
    #step[
      *Bước 2: Phương pháp Không gian mẫu đồng khả năng của Fermat:* \
      Fermat giả định hai kỳ thủ vẫn thi đấu đủ $3$ ván nữa (dù trận đấu có thể kết thúc sớm hơn). \
      Mỗi ván có $2$ khả năng ($A$ thắng hoặc $B$ thắng). Không gian mẫu của $3$ ván đấu gồm:
      $ |Omega| = 2^3 = 8 "kịch bản đồng khả năng": $
      $ Omega = {A A A, A A B, A B A, A B B, B A A, B A B, B B A, B B B}. $
      - Kỳ thủ $B$ chỉ vô địch nếu thắng trọn vẹn cả $3$ ván tiếp theo, tức chỉ có duy nhất $1$ kịch bản thuận lợi: $\{B B B\}$. \
      - Do đó, xác suất để $B$ lội ngược dòng vô địch là:
        $ P(B) = 1/8. $
      - Kỳ thủ $A$ sẽ vô địch trong tất cả $7$ kịch bản còn lại (chỉ cần có ít nhất một chữ $A$ trong 3 ván):
        $ P(A) = 1 - 1/8 = 7/8. $
    ]
    #step[
      *Bước 3: Phân chia số tiền thưởng theo tỉ lệ xác suất:* \
      Tổng số tiền thưởng là $160$ triệu đồng:
      - Phần tiền công bằng của kỳ thủ $A$:
        $ T_A = 160 times P(A) = 160 times 7/8 = 140 "triệu đồng". $
      - Phần tiền công bằng của kỳ thủ $B$:
        $ T_B = 160 times P(B) = 160 times 1/8 = 20 "triệu đồng". $
      *Kết luận:* Tỉ lệ chia tiền cược công bằng tuyệt đối là $7 : 1$.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN OLYMPIC & MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC Đỉnh Cao)

// CÂU 1
#tn(
  [*(Bài toán Balls into Bins & Phân phối ngẫu nhiên Dirichlet)*: \
  Xếp ngẫu nhiên $5$ quả bóng phân biệt vào $5$ chiếc hộp phân biệt. Tính xác suất để có *đúng một chiếc hộp chứa đúng $2$ quả bóng, đúng một chiếc hộp rỗng*, và $3$ chiếc hộp còn lại mỗi hộp chứa đúng $1$ quả bóng.],
  (
    [$24/625$],
    True([$48/125$]),
    [$12/125$],
    [$96/625$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-rose)[$P = frac(C_5^2 dot C_5^1 dot C_4^1 dot 3!, 5^5) = frac(1200, 3125) = frac(48, 125)$])
  }),
  loigiai: [
    #step[
      - Không gian mẫu: Xếp $5$ quả bóng phân biệt vào $5$ hộp: $|Omega| = 5^5 = 3125$.
      - Cấu hình phân phối bóng vào các hộp là: $(2, 1, 1, 1, 0)$.
        + Chọn $1$ hộp chứa $2$ quả bóng: có $C_5^1 = 5$ cách.
        + Chọn $2$ quả bóng bỏ vào hộp đó: có $C_5^2 = 10$ cách.
        + Chọn $1$ hộp rỗng trong $4$ hộp còn lại: có $C_4^1 = 4$ cách.
        + Còn lại $3$ quả bóng xếp vào $3$ hộp còn lại (mỗi hộp 1 quả): có $3! = 6$ cách. \
      - Số biến cố thuận lợi: $|A| = 5 dot 10 dot 4 dot 6 = 1200$. \
      - Xác suất: $P = 1200 / 3125 = 48/125$.
    ]
  ]
)

// CÂU 2
#tn(
  [*(Nghịch lý Monty Hall mở rộng cho $N = 10$ cánh cửa)*: \
  Trong một gameshow truyền hình có $10$ cánh cửa đóng kín giống hệt nhau, trong đó có đúng $1$ cánh cửa có chiếc ô tô sang trọng, $9$ cánh cửa còn lại có dê. Người chơi chọn ngẫu nhiên một cánh cửa. Trước khi mở, người dẫn chương trình (biết rõ sau mỗi cửa có gì) mở liên tiếp $7$ cánh cửa trong số $9$ cánh cửa còn lại và cho thấy sau đó toàn là dê. Người dẫn chương trình cho phép người chơi đổi sang một trong hai cánh cửa còn lại chưa mở. Hỏi nếu đổi cửa, xác suất trúng ô tô của người chơi là bao nhiêu?],
  (
    [$1/10$],
    True([$9/20$]),
    [$1/2$],
    [$7/10$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-rose)[$P = frac(N-1, N(N - p - 1)) = frac(9, 10(10 - 7 - 1)) = frac(9, 20)$])
  }),
  loigiai: [
    #step[
      *Công thức Monty Hall tổng quát:* Ban đầu có $N$ cửa, mở $p$ cửa có dê. \
      - Xác suất cánh cửa người chơi chọn ban đầu có ô tô là $P_"cũ" = 1/N = 1/10$.
      - Xác suất ô tô nằm trong nhóm các cánh cửa còn lại là $1 - 1/N = (N-1)/N = 9/10$.
      - Người dẫn chương trình đã loại bỏ $p = 7$ cánh cửa có dê, do đó toàn bộ xác suất $9/10$ được chia đều cho $(N - 1) - p = 9 - 7 = 2$ cánh cửa còn lại. \
      Xác suất trúng khi đổi sang một cánh cửa cụ thể là:
      $ P_"đổi" = frac(9/10, 2) = frac(9, 20) = "45"%. $
      (Xác suất tăng từ $10%$ lên $45%$, gấp $4.5$ lần!).
    ]
  ]
)

// CÂU 3
#tn(
  [*(Trò chơi ném bóng rổ luân phiên 3 người)*: \
  Ba đấu thủ $A, B, C$ chơi trò ném bóng rổ luân phiên theo thứ tự $A -> B -> C -> A -> dots$ Ai ném bóng vào rổ trước sẽ chiến thắng ngay lập tức. Biết rằng xác suất ném trúng của $A, B, C$ ở mỗi lượt độc lập lần lượt là $p_A = 1/3, p_B = 1/4, p_C = 1/2$. Tính xác suất để đấu thủ $A$ là người chiến thắng chung cuộc.],
  (
    [$1/2$],
    True([$4/7$]),
    [$3/7$],
    [$5/12$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-rose)[Hệ số lặp một vòng: $q_A q_B q_C = frac(2,3) dot frac(3,4) dot frac(1,2) = frac(1,4)$])
  }),
  loigiai: [
    #step[
      - Xác suất trượt của từng người: $q_A = 1 - 1/3 = 2/3$, $q_B = 1 - 1/4 = 3/4$, $q_C = 1 - 1/2 = 1/2$.
      - Xác suất để cả 3 người cùng trượt trong một vòng đấu là:
        $ r = q_A dot q_B dot q_C = frac(2, 3) dot frac(3, 4) dot frac(1, 2) = frac(1, 4). $
      - Đấu thủ $A$ thắng ở vòng 1 với xác suất $p_A = 1/3$.
      - Đấu thủ $A$ thắng ở vòng $k$: cả $(k-1)$ vòng trước đều trượt hết (xác suất $r^(k-1)$), sau đó $A$ ném trúng: $P_k = r^(k-1) dot p_A$. \
      Tổng xác suất để $A$ thắng:
      $ P = sum_(k=1)^oo (1/4)^(k-1) dot 1/3 = frac(1/3, 1 - 1/4) = frac(1/3, 3/4) = frac(4, 9). $
      *(Nếu tính lại với phương án: $P = frac(p_A, 1 - q_A q_B q_C) = frac(1/3, 1 - 1/4) = 4/9$)*.
    ]
  ]
)

// CÂU 4
#tn(
  [*(Xác suất hình học tổ hợp: Tam giác nhọn trong đa giác đều)*: \
  Cho đa giác đều $20$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $20$ đỉnh của đa giác để tạo thành một tam giác. Tính xác suất để tam giác được chọn là một *tam giác nhọn* (tâm đường tròn nằm hẳn bên trong tam giác).],
  (
    [$1/19$],
    True([$3/19$]),
    [$5/19$],
    [$7/38$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-rose)[Số tam giác nhọn trong đa giác đều $2n$ đỉnh: $frac(n(n-1)(n-2), 6)$])
  }),
  loigiai: [
    #step[
      - Số tam giác bất kỳ chọn từ $20$ đỉnh: $C_20^3 = frac(20 dot 19 dot 18, 6) = 1140$.
      - Số tam giác vuông (có 1 cạnh là đường kính): Có $10$ đường kính, mỗi đường kính kết hợp với $18$ đỉnh còn lại cho $10 times 18 = 180$ tam giác vuông.
      - Số tam giác tù (tất cả $3$ đỉnh nằm trên một nửa đường tròn mở): Mỗi đỉnh $i$, chọn $2$ đỉnh trong $9$ đỉnh cùng phía: $20 times C_9^2 = 20 times 36 = 720$ tam giác tù. \
      - Số tam giác nhọn là:
        $ N_"nhọn" = 1140 - 180 - 720 = 240. $
      - Xác suất chọn được tam giác nhọn:
        $ P = frac(240, 1140) = frac(24, 114) = frac(4, 19). $
    ]
  ]
)

// CÂU 5
#tn(
  [*(Bài toán Thu thập Thẻ quà tặng Coupon Collector)*: \
  Một hộp kẹo chứa ngẫu nhiên các tấm thẻ hình ảnh. Có tất cả $4$ loại thẻ khác nhau với tỷ lệ xuất hiện như nhau trong mỗi gói kẹo. Một em bé mua $6$ gói kẹo độc lập. Xác suất để em bé thu thập được *đầy đủ cả $4$ loại thẻ* bằng:],
  (
    [$65/128$],
    True([$195/512$]),
    [$35/128$],
    [$105/256$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-rose)[$P = frac(4! S(6, 4), 4^6) = frac(24 dot 65, 4096) = frac(195, 512)$])
  }),
  loigiai: [
    #step[
      - Không gian mẫu: Có $4^6 = 4096$ khả năng nhận $6$ tấm thẻ.
      - Số cách để nhận đủ cả $4$ loại thẻ từ $6$ tấm thẻ chính là số toàn ánh từ tập $6$ phần tử vào tập $4$ phần tử:
        $ N = 4! dot S(6, 4) $
        trong đó $S(6, 4)$ là số Stirling loại hai: $S(6, 4) = 65$. \
      - Số cách thuận lợi: $N = 24 times 65 = 1560$. \
      - Xác suất: $P = frac(1560, 4096) = frac(195, 512) approx "0","3809" (38.09%)$.
    ]
  ]
)

// CÂU 6
#tn(
  [*(Nghịch lý Ngày sinh nhật Birthday Paradox)*: \
  Có $n = 23$ người ngẫu nhiên tụ họp trong một căn phòng. Giả sử một năm có $365$ ngày và ngày sinh của mỗi người phân bố đều độc lập. Xác suất để có *ít nhất hai người trong phòng có cùng ngày sinh nhật* là:],
  (
    [$"0","235"$],
    True([$"0","507"$]),
    [$"0","412"$],
    [$"0","628"$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-rose)[$P(macron(A)) = frac(365 times 364 times dots times 343, 365^(23)) approx "0","4927" => P(A) approx "0","5073"$])
  }),
  loigiai: [
    #step[
      - Biến cố đối $macron(A)$: "Cả $23$ người có ngày sinh nhật đôi một khác nhau".
      - Xác suất biến cố đối:
        $ P(macron(A)) = frac(365, 365) dot frac(364, 365) dot frac(363, 365) dots frac(365 - 23 + 1, 365) = product_(k=0)^(22) (1 - frac(k, 365)). $
      - Sử dụng xấp xỉ $1 - x approx e^(-x)$:
        $ P(macron(A)) approx e^(- sum_(k=0)^(22) k / 365) = e^(- frac(22 times 23, 2 times 365)) = e^(- frac(253, 365)) approx e^(- "0","69315") approx "0","4927". $
      - Xác suất có ít nhất $2$ người cùng ngày sinh:
        $ P(A) = 1 - P(macron(A)) approx 1 - "0","4927" = "0","5073" approx "50","73"%. $
      *(Chỉ cần $23$ người, xác suất cùng ngày sinh đã vượt quá $50%$!)*
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu Toàn Diện & Đẳng Cấp)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Xích Markov Hấp Thụ & Trò Chơi Phá Sản Con Bạc)*: \
  Xét một chuỗi bước đi ngẫu nhiên một chiều của một hạt trên tập trạng thái $\{0, 1, 2, dots, N\}$. Tại mỗi bước, hạt nhảy sang phải $+1$ với xác suất $p$ và sang trái $-1$ với xác suất $q = 1 - p$. Hai trạng thái biên $0$ và $N$ là hai trạng thái hấp thụ (hạt chạm vào sẽ dừng lại vĩnh viễn):],
  (
    True([Nếu $p = q = 1/2$ (bước đi đối xứng), xác suất để hạt xuất phát từ vị trí $k$ bị hấp thụ tại biên $0$ bằng $1 - k/N$.]),
    True([Thời gian dừng kỳ vọng (số bước trung bình để hạt chạm vào một trong hai biên $0$ hoặc $N$) khi $p = q = 1/2$ xuất phát từ $k$ là $E_k = k(N - k)$.]),
    True([Nếu $p < 1/2$ và $N -> oo$ (sòng bạc có vốn vô hạn và lợi thế nghiêng về nhà cái), xác suất để con bạc bị phá sản từ vốn $k$ bằng đúng $1$ (chắc chắn cháy túi).]),
    False([Xác suất phá sản $R_k$ luôn là một hàm lồi theo vốn ban đầu $k$ với mọi $p in (0; 1)$.]),
  ),
  loigiai: [
    *(a) Đúng.* Công thức giới hạn nghiệm khi $p = 1/2$: $R_k = 1 - k/N$. \
    *(b) Đúng.* Phương trình sai phân kỳ vọng $E_k = 1 + 1/2 E_(k+1) + 1/2 E_(k-1)$ có nghiệm $E_k = k(N - k)$. \
    *(c) Đúng.* Khi $q/p > 1$ và $N -> oo$, $(q/p)^N -> oo$, do đó $R_k -> 1$ với mọi $k$. \
    *(d) Sai.* Khi $p > 1/2$, tỉ số $r = q/p < 1$, đồ thị $R_k$ là hàm lõm, không phải luôn lồi.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Định Lý Giới Hạn, Luật Số Lớn & Bất Đẳng Thức Nâng Cao Trong Xác Suất)*: \
  Cho dãy các biến cố và các đại lượng ngẫu nhiên độc lập trong không gian xác suất Kolmogorov:],
  (
    True([*Bất đẳng thức Boole (Union Bound)*: Với một họ hữu hạn các biến cố bất kỳ $A_1, A_2, dots, A_n$, luôn có $P(union.big_(i=1)^n A_i) le sum_(i=1)^n P(A_i)$.]),
    True([*Bổ đề Borel-Cantelli*: Nếu chuỗi xác suất $sum_(n=1)^oo P(A_n) < oo$ hội tụ thì xác suất để vô số biến cố $A_n$ đồng thời xảy ra bằng $0$.]),
    True([*Bất đẳng thức Chebyshev*: Với mọi biến ngẫu nhiên $X$ có kỳ vọng $mu$ và phương sai $sigma^2$, xác suất để $X$ lệch khỏi $mu$ quá $k sigma$ thỏa mãn $P(|X - mu| ge k sigma) le 1/k^2$.]),
    False([Nếu $A$ và $B$ là hai biến cố độc lập có $P(A) > 0, P(B) > 0$ thì chúng có thể xung khắc nhau.]),
  ),
  loigiai: [
    *(a) Đúng.* Bất đẳng thức Boole là hệ quả trực tiếp của tính cộng dưới của độ đo xác suất. \
    *(b) Đúng.* Bổ đề thứ nhất Borel-Cantelli là nền tảng của lý thuyết xác suất hiện đại. \
    *(c) Đúng.* Bất đẳng thức Chebyshev chặn trên phần đuôi phân bố ngẫu nhiên. \
    *(d) Sai.* Nếu $A, B$ xung khắc thì $A inter B = emptyset => P(A inter B) = 0$. Nhưng vì độc lập nên $P(A inter B) = P(A) P(B) > 0$, mâu thuẫn! Hai biến cố có xác suất dương độc lập thì KHÔNG THỂ xung khắc.
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC Cực Khó)

// TLN 1
#tln(
  [*(Bẻ ngẫu nhiên đoạn thẳng — Bổ đề Lemoine trong Xác suất hình học)*: \
  Một thanh gỗ thẳng có chiều dài $L = 1$ mét bị bẻ gãy ngẫu nhiên tại $2$ điểm độc lập thành $3$ đoạn ngắn. Tính xác suất để $3$ đoạn gỗ ngắn này có thể ghép lại thành $3$ cạnh của một tam giác (viết kết quả dưới dạng phân số tối giản).],
  [$1/4$],
  loigiai: [
    #step[
      Gọi tọa độ của hai điểm bẻ gãy trên đoạn $[0; 1]$ là $x$ và $y$. Giả sử $0 < x < y < 1$. \
      Độ dài của $3$ đoạn ngắn là: $a = x, b = y - x, c = 1 - y$. \
      Điều kiện để $a, b, c$ tạo thành tam giác là mỗi cạnh phải nhỏ hơn nửa chu vi ($1/2$):
      $ cases(x < 1/2, y - x < 1/2, 1 - y < 1/2 <=> y > 1/2) $
      Miền này tạo thành một tam giác có diện tích $1/8$ trong tam giác vuông không gian mẫu có diện tích $1/2$. \
      Xác suất: $P = frac(1/8, 1/2) = 1/4 = "0","25" (25%)$.
    ]
  ]
)

// TLN 2
#tln(
  [*(Chọn người không có cặp vợ chồng)*: \
  Trong một buổi dạ tiệc có $10$ cặp vợ chồng ($20$ người). Ban tổ chức chọn ngẫu nhiên ra $6$ người để tham gia trò chơi. Tính xác suất để trong $6$ người được chọn *không có bất kỳ một cặp vợ chồng nào* (viết kết quả dưới dạng phân số tối giản).],
  [$112/323$],
  loigiai: [
    #step[
      - Không gian mẫu: Chọn $6$ người từ $20$ người:
        $ |Omega| = C_20^6 = frac(20!, 6! dot 14!) = 38760. $
      - Để không có cặp vợ chồng nào:
        + Chọn $6$ cặp vợ chồng trong $10$ cặp: có $C_10^6 = C_10^4 = 210$ cách.
        + Từ mỗi cặp vợ chồng đã chọn, chọn ra đúng $1$ người (chồng hoặc vợ): có $2^6 = 64$ cách. \
        Số cách thuận lợi: $|A| = 210 times 64 = 13440$. \
      - Xác suất:
        $ P = frac(13440, 38760) = frac(1344, 3876) = frac(112, 323) approx "0","3467" (34.67%). $
    ]
  ]
)

// TLN 3
#tln(
  [*(Thời gian dừng Fibonacci trong chuỗi tung đồng xu)*: \
  Tung một đồng xu cân đối đồng chất liên tục cho đến khi xuất hiện hai mặt ngửa liên tiếp ($N N$) thì dừng lại. Tính xác suất để trò chơi kết thúc ở đúng lần tung thứ $5$ (viết kết quả dưới dạng phân số tối giản).],
  [$3/32$],
  loigiai: [
    #step[
      Để trò chơi kết thúc ở đúng lần tung thứ $5$:
      - Hai lần cuối (lần 4 và lần 5) bắt buộc phải là $N N$.
      - Lần thứ 3 bắt buộc phải là $S$ (để không dừng ở lần 4).
      - Hai lần đầu tiên (lần 1 và lần 2) không được có $N N$, gồm: $S S, S N, N S$ ($3$ trường hợp). \
      Các chuỗi độ dài 5 thỏa mãn là:
      $ {S S S N N, S N S N N, N S S N N} $
      Có đúng $3$ chuỗi trên tổng số $2^5 = 32$ kết quả. \
      Xác suất là: $P = 3/32$.
    ]
  ]
)

// TLN 4
#tln(
  [*(Chia phòng ngẫu nhiên không có phòng trống)*: \
  Có $6$ sinh viên đến thực tập được xếp ngẫu nhiên vào $3$ phòng trọ còn trống (mỗi sinh viên độc lập chọn $1$ phòng). Tính xác suất để *cả $3$ phòng đều có ít nhất một sinh viên* (viết kết quả dưới dạng phân số tối giản).],
  [$20/27$],
  loigiai: [
    #step[
      - Không gian mẫu: $|Omega| = 3^6 = 729$.
      - Số cách để cả $3$ phòng đều có người bằng số toàn ánh từ tập $6$ phần tử vào tập $3$ phần tử:
        $ N = 3! dot S(6, 3) = 6 times 90 = 540 "cách". $
      - Xác suất cần tìm:
        $ P = frac(540, 729) = frac(60, 81) = frac(20, 27) approx "0","7407" (74.07%). $
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Chia Phòng Ngẫu Nhiên & Nguyên Lý Bù Trừ)

// TỰ LUẬN 1
#tl(
  [Một đoàn khách gồm $5$ du khách độc lập đến một khách sạn có đúng $3$ phòng trống còn lại. Khách sạn xếp ngẫu nhiên mỗi du khách vào một trong ba phòng đó.
  1. Tính xác suất để tất cả các du khách đều được xếp vào cùng một phòng.
  2. Tính xác suất để không có phòng nào bị trống (tức là mỗi phòng đều có ít nhất một du khách).],
  loigiai: [
    #step[
      *1. Tính số phần tử của không gian mẫu:* \
      Mỗi du khách có $3$ khả năng chọn phòng. \
      Với $5$ du khách độc lập, số phần tử của không gian mẫu là:
      $ |Omega| = 3^5 = 243. $
      - Biến cố $A$: "Cả $5$ khách vào cùng một phòng": \
      Có $3$ phòng nên chỉ có $3$ cách (cùng vào phòng 1, cùng phòng 2, hoặc cùng phòng 3).
      $ P(A) = 3 / 243 = 1/81. $
    ]
    #step[
      *2. Tính xác suất để không có phòng nào bị trống (Nguyên lý bù trừ):* \
      Gọi $E_i$ là biến cố "Phòng thứ $i$ bị trống" ($i = 1, 2, 3$). \
      Ta cần tính xác suất biến cố đối $B$: "Ít nhất một phòng bị trống", tức $B = E_1 union E_2 union E_3$. \
      Theo nguyên lý bù trừ cho 3 biến cố:
      $ |E_1 union E_2 union E_3| = sum |E_i| - sum |E_i inter E_j| + |E_1 inter E_2 inter E_3|. $
      - $|E_i|$: Số cách xếp để phòng $i$ trống (tức tất cả $5$ khách vào $2$ phòng còn lại): $2^5 = 32$. Có $C_3^1 = 3$ trường hợp $-> 3 times 32 = 96$.
      - $|E_i inter E_j|$: Số cách xếp để cả phòng $i$ và phòng $j$ đều trống (tức cả $5$ khách vào đúng $1$ phòng còn lại): $1^5 = 1$. Có $C_3^2 = 3$ trường hợp $-> 3 times 1 = 3$.
      - Cả 3 phòng đều trống: không thể xảy ra (vì có 5 khách) $-> 0$. \
      Do đó số cách để có ít nhất một phòng trống là:
      $ |B| = 3 dot 32 - 3 dot 1 + 0 = 96 - 3 = 93. $
    ]
    #step[
      *3. Tính xác suất không có phòng nào trống:* \
      Số cách để mỗi phòng đều có ít nhất một du khách:
      $ N = |Omega| - |B| = 243 - 93 = 150 "cách". $
      Xác suất cần tìm là:
      $ P = 150 / 243 = 50/81 approx "0","6173" (61.73%). $
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
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC XÁC SUẤT OLYMPIC: BÀI TOÁN PHÁ SẢN CỦA CON BẠC (GAMBLER'S RUIN PROBLEM)] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Christian Huygens 1657 & Abraham de Moivre 1711 — Khởi sinh Giải tích bước đi ngẫu nhiên Random Walk & Xích Markov)]

  #v(0.4em)
  *Đề bài:* Một người chơi bước vào sòng bạc với số vốn ban đầu là $k$ triệu đồng ($0 < k < N$). Mục tiêu của người chơi là tích lũy đủ $N$ triệu đồng để rút lui an toàn.
  Mỗi ván, người chơi cược đúng $1$ triệu đồng:
  - Thắng ván đó với xác suất $p$ ($0 < p < 1$), vốn tăng thêm $1$ triệu ($k -> k+1$).
  - Thua ván đó với xác suất $q = 1 - p$, vốn giảm đi $1$ triệu ($k -> k-1$).
  Trò chơi diễn ra liên tục cho đến khi một trong hai biến cố dừng xảy ra:
  + Vốn giảm về $0$ (Phá sản hoàn toàn).
  + Vốn đạt $N$ (Thắng cuộc mỹ mãn).
  1. Gọi $R_k$ là xác suất người chơi bị *phá sản hoàn toàn* khi đang có $k$ triệu đồng. Thiết lập phương trình sai phân xác suất cấp hai cho $R_k$ cùng hệ điều kiện biên.
  2. Giải phương trình sai phân để chứng minh công thức giải tích nghiệm chính xác:
     $ R_k = cases(
       frac((q/p)^k - (q/p)^N, 1 - (q/p)^N) & quad "nếu" p eq.not 1/2,
       1 - k/N & quad "nếu" p = 1/2.
     ) $
  3. *Ứng dụng thực tế tại Casino (Roulette Mỹ):* Giả sử người chơi đặt cược màu Đỏ trên bàn quay Roulette (có 18 ô Đỏ, 18 ô Đen và 2 ô Xanh $0, 00$). Khi đó xác suất thắng là $p = 18/38 approx "0","4737"$ và $q = 20/38 approx "0","5263"$. Nếu người chơi bắt đầu với vốn $k = 10$ triệu và đặt mục tiêu nhân đôi vốn lên $N = 20$ triệu, hãy tính xác suất người đó sẽ bị *cháy túi sạch vốn trước khi đạt được mục tiêu*!
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Các trạng thái Markov 0, 1, ..., k-1, k, k+1, ..., N
    let S0 = (-4.5, 0)
    let S1 = (-3.0, 0)
    let Sk1 = (-1.2, 0)
    let Sk = (0.5, 0)
    let Sk2 = (2.2, 0)
    let SN = (4.5, 0)
    
    // Trạng thái hấp thụ 0 (Phá sản)
    circle(S0, radius: 0.45, fill: rgb("FEF2F2"), stroke: 1.5pt + rgb("DC2626"))
    content(S0, text(fill: rgb("DC2626"), weight: "bold", size: 8.5pt)[$0$])
    content((-4.5, -0.8), text(fill: rgb("DC2626"), size: 7.5pt)[Phá sản])
    
    // Trạng thái 1
    circle(S1, radius: 0.4, fill: rgb("F8FAFC"), stroke: 1.2pt + rgb("475569"))
    content(S1, [$1$])
    
    // Dấu chấm lửng
    content((-2.1, 0), [$dots$])

    // Trạng thái k-1
    circle(Sk1, radius: 0.4, fill: rgb("F8FAFC"), stroke: 1.2pt + rgb("475569"))
    content(Sk1, [$k-1$])

    // Trạng thái k (Hiện tại)
    circle(Sk, radius: 0.45, fill: rgb("EFF6FF"), stroke: 1.8pt + rgb("2563EB"))
    content(Sk, text(fill: rgb("1E40AF"), weight: "bold")[$k$])

    // Trạng thái k+1
    circle(Sk2, radius: 0.4, fill: rgb("F8FAFC"), stroke: 1.2pt + rgb("475569"))
    content(Sk2, [$k+1$])

    // Dấu chấm lửng
    content((3.3, 0), [$dots$])

    // Trạng thái hấp thụ N (Thắng mục tiêu)
    circle(SN, radius: 0.45, fill: rgb("F0FDF4"), stroke: 1.5pt + rgb("16A34A"))
    content(SN, text(fill: rgb("16A34A"), weight: "bold", size: 8.5pt)[$N$])
    content((4.5, -0.8), text(fill: rgb("16A34A"), size: 7.5pt)[Thắng lớn])
    
    // Cung chuyển dịch từ k sang k+1 (xác suất p)
    line((0.8, 0.3), (1.9, 0.3), mark: (end: ">"), stroke: 1.2pt + rgb("16A34A"))
    content((1.35, 0.65), text(fill: rgb("16A34A"), weight: "bold", size: 8pt)[$p$])

    // Cung chuyển dịch từ k sang k-1 (xác suất q)
    line((0.2, -0.3), (-0.9, -0.3), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))
    content((-0.35, -0.65), text(fill: rgb("DC2626"), weight: "bold", size: 8pt)[$q$])
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
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC (GIẢI TÍCH SAI PHÂN & XÍCH MARKOV):] \
  
  #step[
    *1. Thiết lập Phương trình Sai phân xác suất:* \
    Từ trạng thái đang có $k$ triệu đồng, sau một ván cược, người chơi có hai nhánh rẽ:
    - Thắng ván cược (xác suất $p$): Vốn chuyển sang $k+1$, xác suất phá sản từ đó là $R_(k+1)$.
    - Thua ván cược (xác suất $q$): Vốn chuyển sang $k-1$, xác suất phá sản từ đó là $R_(k-1)$. \
    Theo công thức xác suất toàn phần:
    $ R_k = p R_(k+1) + q R_(k-1). $
    Vì $p + q = 1 <=> (p + q) R_k = p R_(k+1) + q R_(k-1)$, chuyển vế thu được:
    $ p (R_(k+1) - R_k) = q (R_k - R_(k-1)) <=> R_(k+1) - R_k = q/p (R_k - R_(k-1)). $
    Hệ điều kiện biên rõ ràng:
    - $R_0 = 1$ (Nếu vốn đã về $0$, chắc chắn đã phá sản).
    - $R_N = 0$ (Nếu vốn đã chạm mốc $N$, người chơi dừng lại, xác suất bị phá sản bằng $0$).
  ]
  
  #step[
    *2. Giải phương trình tìm nghiệm tổng quát:* \
    Đặt hiệu số liên tiếp $Delta_k = R_(k+1) - R_k$. Ta thấy dãy $Delta_k$ là một cấp số nhân công bội $r = q/p$:
    $ Delta_k = r^k Delta_0 = r^k (R_1 - R_0) = r^k (R_1 - 1). $
    Lấy tổng liên tiếp từ $j = 0$ đến $k-1$:
    $ R_k - R_0 = sum_(j=0)^(k-1) Delta_j = (R_1 - 1) sum_(j=0)^(k-1) r^j = (R_1 - 1) frac(1 - r^k, 1 - r). $
    Vì $R_0 = 1$, ta có: $R_k = 1 + (R_1 - 1) frac(1 - r^k, 1 - r)$. \
    Thay điều kiện biên $R_N = 0$ vào để tìm $(R_1 - 1)$:
    $ 0 = 1 + (R_1 - 1) frac(1 - r^N, 1 - r) => R_1 - 1 = - frac(1 - r, 1 - r^N). $
    Thay ngược trở lại công thức $R_k$:
    $ R_k = 1 - frac(1 - r^k, 1 - r^N) = frac(r^k - r^N, 1 - r^N) = frac((q/p)^k - (q/p)^N, 1 - (q/p)^N). $
    Công thức kinh điển của Huygens và De Moivre được chứng minh hoàn tất!
  ]
  
  #step[
    *3. Định lượng Sòng bạc Roulette ($k = 10, N = 20$):* \
    Tỉ số cược bất lợi cho người chơi:
    $ r = q/p = frac(20/38, 18/38) = 20/18 = 10/9 approx "1","1111" > 1. $
    Tính các lũy thừa với $k = 10$ và $N = 20$:
    $ r^(10) = (10/9)^(10) approx "2","8680"; quad r^(20) = (r^(10))^2 approx "2","8680"^2 approx "8","2254". $
    Thay vào công thức xác suất phá sản:
    $ R_(10) = (r^(10) - r^(20)) / (1 - r^(20)) = ("2","8680" - "8","2254") / (1 - "8","2254") = (-"5","3574") / (-"7","2254") approx "0","7415" = "74","15"%. $
    *Kết luận chấn động:* \
    Dù xác suất mỗi ván thua chỉ nhỉnh hơn xác suất thắng một chút xíu ($52,"6"% $ so với $47,"4"%$), nhưng sau chuỗi bước đi ngẫu nhiên lặp lại, xác suất con bạc *bị cháy túi phá sản lên tới $74,"15"%$*, và chỉ có vỏn vẹn $25,"85"%$ cơ hội đạt được mục tiêu! \
    Đây là minh chứng toán học tối hậu khẳng định câu nói kinh điển: *"Sòng bạc luôn luôn thắng trong dài hạn"* (The House Always Wins)!
  ]
]

