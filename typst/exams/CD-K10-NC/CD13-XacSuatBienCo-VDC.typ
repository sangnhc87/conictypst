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
  stroke: (bottom: 2pt + rgb("1E3A8A")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1E3A8A"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("2563EB")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("2563EB"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("60A5FA")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("60A5FA"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("2563EB")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Xác suất biến cố (Blue - Navy)
#let c-blue-dark = rgb("1E3A8A")
#let c-blue = rgb("2563EB")
#let c-blue-light = rgb("60A5FA")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-emerald = rgb("059669")
#let c-bg-blue = rgb("EFF6FF")
#let c-border = rgb("DBEAFE")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-blue,
    stroke: 1.5pt + c-blue,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-blue-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-blue, size: 16pt, weight: "black")[CHUYÊN ĐỀ 13: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO XÁC SUẤT BIẾN CỐ]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Xác suất Cổ điển Laplace, Biến cố Độc lập, Xác suất Hình học & Bài toán Chia cược Lịch sử của Pascal - Fermat
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-blue),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Sự Khởi sinh của Lý thuyết Xác suất & Bản chất Dự báo Tương lai:*
  
  Mùa hè năm 1654, một hiệp sĩ quý tộc mê cờ bạc tên là Chevalier de Méré đặt ra câu hỏi hóc búa cho nhà toán học Blaise Pascal: _"Nếu một trò chơi may rủi nhiều ván bị buộc phải dừng lại giữa chừng khi chưa ai thắng chung cuộc, thì số tiền cược phải được chia lại như thế nào cho công bằng?"_ Cuộc trao đổi thư từ huyền thoại giữa Pascal và Pierre de Fermat xoay quanh câu hỏi này đã khai sinh ra *Lý thuyết Xác suất*.
  
  Trong kỷ nguyên số thế kỷ XXI, xác suất không còn là công cụ sòng bạc, mà là linh hồn của:
  - *Mô hình ngôn ngữ lớn (LLM - Gemini, ChatGPT)*: Dự đoán phân phối xác suất của từ/token tiếp theo dựa trên ngữ cảnh $P(w_(t) | w_1, w_2, dots, w_(t-1))$.
  - *Khoa học Dữ liệu & Đánh giá Rủi ro*: Xét nghiệm y khoa chẩn đoán bệnh dịch, bài toán độ tin cậy của mạng lưới vệ tinh vũ trụ, giải thuật đầu tư tài chính định lượng.
  
  Trong đề thi HSG và tuyển sinh VDC:
  1. *Định nghĩa cổ điển của Laplace*: $P(A) = |A| / |Omega|$ đòi hỏi sự chính xác tuyệt đối trong việc xây dựng không gian mẫu đồng khả năng.
  2. *Quy tắc cộng & nhân xác suất*: Phân biệt giữa hai biến cố *xung khắc* ($A inter B = emptyset ==> P(A union B) = P(A) + P(B)$) và hai biến cố *độc lập* ($P(A inter B) = P(A) dot P(B)$).
  3. *Xác suất hình học (Geometric Probability)*: Đưa bài toán ngẫu nhiên liên tục về tỉ số diện tích trong không gian tọa độ hai chiều.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. HỆ THỐNG ĐỊNH LÝ & KỸ THUẬT TÍNH XÁC SUẤT VDC
// ══════════════════════════════════════════════════════════════

== 1. Bảng quy tắc xác suất căn bản & Nâng cao

#table(
  columns: (3fr, 4fr, 3fr),
  fill: (col, row) => if row == 0 { c-blue } else if calc.even(row) { rgb("EFF6FF") } else { none },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  inset: 7pt,
  stroke: 0.5pt + rgb("CBD5E0"),
  [#text(fill: white, weight: "bold")[Quy tắc / Định lý]],
  [#text(fill: white, weight: "bold")[Công thức toán học]],
  [#text(fill: white, weight: "bold")[Điều kiện áp dụng]],

  [*Định nghĩa Cổ điển*],
  [$P(A) = (|Omega_A|) / (|Omega|)$],
  [Không gian mẫu $Omega$ hữu hạn và các biến cố sơ cấp đồng khả năng],

  [*Biến cố Đối (Phần bù)*],
  [$P(A) = 1 - P(overline(A))$],
  [Bài toán có điều kiện "có ít nhất một", "không đồng thời"],

  [*Quy tắc Cộng tổng quát*],
  [$P(A union B) = P(A) + P(B) - P(A inter B)$],
  [Áp dụng cho hai biến cố bất kỳ (có thể giao nhau)],

  [*Quy tắc Cộng xung khắc*],
  [$P(A union B) = P(A) + P(B)$],
  [Hai biến cố xung khắc: $A inter B = emptyset$],

  [*Quy tắc Nhân độc lập*],
  [$P(A inter B) = P(A) dot P(B)$],
  [Hai biến cố độc lập: Biến cố này xảy ra không ảnh hưởng biến cố kia],

  [*Công thức Bernoulli*],
  [$P_n(k) = C_n^k p^k (1 - p)^(n - k)$],
  [Dãy $n$ phép thử độc lập lặp lại, xác suất thành công $p$],
)

#v(0.6em)

== 2. Mô hình Xác suất Hình học (Bài toán Hẹn gặp ngẫu nhiên)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hệ trục tọa độ đại diện cho thời điểm đến của A (trục x) và B (trục y)
    // Cả hai đến trong khoảng [0, 60] phút. Họ gặp nhau nếu |x - y| <= 15
    let scale = 0.05
    let T = 60
    let t0 = 15

    rect((0, 0), (T * scale, T * scale), stroke: 1.5pt + rgb("64748B"), fill: rgb("F1F5F9"))
    content((T * scale / 2, -0.35), text(fill: rgb("475569"), size: 8.5pt)[Thời điểm $A$ đến: $x in [0; 60]$ (phút)])
    content((-0.4, T * scale / 2), text(fill: rgb("475569"), size: 8.5pt)[$y in [0; 60]$])

    // Vùng gặp nhau: |x - y| <= 15  <=>  x - 15 <= y <= x + 15
    // Đa giác vùng gặp nhau: (0,0) -> (15,0) -> (60, 45) -> (60, 60) -> (45, 60) -> (0, 15) -> (0,0)
    let pts_meet = (
      (0, 0),
      (t0 * scale, 0),
      (T * scale, (T - t0) * scale),
      (T * scale, T * scale),
      ((T - t0) * scale, T * scale),
      (0, t0 * scale),
      (0, 0),
    )
    line(..pts_meet, fill: rgb("93C5FD"), stroke: 1.5pt + c-blue)

    // Đường chéo chính x = y
    line((0, 0), (T * scale, T * scale), stroke: (paint: c-red, dash: "dashed", thickness: 1pt))

    content((T * scale / 2, T * scale / 2 + 0.3), text(fill: c-blue-dark, weight: "bold", size: 8.5pt)[Vùng gặp nhau \ $|x - y| <= 15$])

    // Hai tam giác không gặp nhau ở góc
    content((T * scale - 0.5, 0.4), text(fill: rgb("64748B"), size: 7.5pt)[Không gặp])
    content((0.5, T * scale - 0.4), text(fill: rgb("64748B"), size: 7.5pt)[Không gặp])
  })
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - Biến cố độc lập & Độ tin cậy hệ thống phòng thủ):*
    Một mục tiêu bay không người lái bị theo dõi bởi 3 khẩu đội tên lửa phòng không độc lập $A, B, C$. Xác suất bắn trúng mục tiêu của từng khẩu đội lần lượt là $P(A) = 0.7$, $P(B) = 0.8$ và $P(C) = 0.9$. Cả 3 khẩu đội cùng đồng thời khai hỏa mỗi khẩu 1 quả tên lửa vào mục tiêu. Xác suất để mục tiêu bị tiêu diệt (bị bắn trúng bởi ít nhất một quả tên lửa) là:
  ],
  (
    [$0.998$],
    True([$0.994$]),
    [$0.850$],
    [$0.990$],
  ),
)
#step[
  *Lời giải chi tiết bằng Biến cố đối:*
  - Gọi $E$ là biến cố: "Mục tiêu bị tiêu diệt" (có ít nhất một quả bắn trúng).
  - Biến cố đối $overline(E)$ là: "Mục tiêu không bị tiêu diệt" (cả 3 khẩu đội đều bắn trượt).
  - Vì 3 khẩu đội khai hỏa độc lập, xác suất bắn trượt của từng khẩu đội là:
    - $P(overline(A)) = 1 - 0.7 = 0.3$.
    - $P(overline(B)) = 1 - 0.8 = 0.2$.
    - $P(overline(C)) = 1 - 0.9 = 0.1$.
  - Theo quy tắc nhân xác suất cho các biến cố độc lập:
    $ P(overline(E)) = P(overline(A)) dot P(overline(B)) dot P(overline(C)) = 0.3 dot 0.2 dot 0.1 = 0.006. $
  - Xác suất để mục tiêu bị tiêu diệt là:
    $ P(E) = 1 - P(overline(E)) = 1 - 0.006 = 0.994. $
  - Khả năng tiêu diệt mục tiêu lên tới $99.4\%$.
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Rút quân bài Tú lơ khơ & Tổ hợp xác suất):*
    Từ một bộ bài tây tiêu chuẩn gồm $52$ lá bài, rút ngẫu nhiên đồng thời $4$ lá bài. Xác suất để trong $4$ lá bài rút ra có đúng một bộ tứ quý (4 lá cùng giá trị số) là:
  ],
  (
    [$1 / 270.725$],
    True([$1 / 20.825$ (chính xác $13 / C_52^4$)]),
    [$4 / 52$],
    [$13 / 270.725$],
  ),
)
#step[
  *Lời giải chi tiết:*
  - Số phần tử của không gian mẫu (rút 4 lá từ 52 lá):
    $ |Omega| = C_52^4 = (52 dot 51 dot 50 dot 49) / (4 dot 3 dot 2 dot 1) = 270.725. $
  - Một bộ bài tây có 13 giá trị số khác nhau: ${"Át", 2, 3, dots, 10, "J", "Q", "K"}$.
  - Mỗi giá trị số có đúng 4 lá bài (tương ứng 4 chất: Cơ, Rô, Tép, Bích).
  - Để 4 lá bài rút ra tạo thành một bộ tứ quý, ta chỉ cần chọn 1 giá trị trong số 13 giá trị:
    $ |A| = C_13^1 = 13 " cách". $
  - Xác suất để rút được tứ quý là:
    $ P(A) = |A| / |Omega| = 13 / 270.725 = 1 / 20.825 approx 0.000048. $
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - Xác suất Hình học Bài toán Hẹn gặp ngẫu nhiên):*
    Hai người bạn $A$ và $B$ hẹn gặp nhau tại một quán cà phê trong khoảng thời gian từ 8h00 đến 9h00 sáng. Giả sử thời điểm đến của mỗi người là ngẫu nhiên và độc lập trong khoảng 60 phút đó. Người nào đến trước sẽ đợi người kia tối đa $15$ phút, nếu quá $15$ phút mà người kia chưa đến thì sẽ rời đi. Xác suất để hai người gặp được nhau là:
  ],
  (
    [$1/4$],
    True([$7/16 = 0.4375$]),
    [$9/16$],
    [$1/2$],
  ),
)
#step[
  *Lời giải chi tiết bằng Mô hình Xác suất Hình học:*
  - Gọi $x$ và $y$ lần lượt là số phút sau 8h00 mà người $A$ và người $B$ đến quán ($0 <= x, y <= 60$).
  - Không gian mẫu là một hình vuông cạnh $T = 60$ trên mặt phẳng tọa độ $O x y$:
    $ Omega = {(x, y) | 0 <= x <= 60, 0 <= y <= 60}. $
    Diện tích không gian mẫu là:
    $ S(Omega) = 60 dot 60 = 3600. $
  - Hai người gặp được nhau khi và chỉ khi độ chênh lệch thời gian đến không vượt quá 15 phút:
    $ |x - y| <= 15 <==> -15 <= x - y <= 15 <==> x - 15 <= y <= x + 15. $
  - Miền biến cố $A$ là dải mặt phẳng nằm giữa hai đường thẳng $y = x - 15$ và $y = x + 15$ bên trong hình vuông.
  - Ta tính diện tích phần bù $overline(A)$ (vùng hai người KHÔNG gặp nhau). Vùng này gồm hai tam giác vuông cân nằm ở hai góc đối diện của hình vuông:
    - Tam giác góc dưới phải: các cạnh góc vuông có độ dài $60 - 15 = 45$.
    - Tam giác góc trên trái: các cạnh góc vuông có độ dài $60 - 15 = 45$.
    - Tổng diện tích vùng không gặp nhau là:
      $ S(overline(A)) = 2 dot (1/2 dot 45 dot 45) = 45^2 = 2025. $
  - Diện tích vùng gặp nhau là:
    $ S(A) = S(Omega) - S(overline(A)) = 3600 - 2025 = 1575. $
  - Xác suất để hai người gặp nhau là tỉ số diện tích:
    $ P(A) = (S(A)) / (S(Omega)) = 1575 / 3600 = 7 / 16 = 0.4375 (43.75%). $
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Mô hình hóa Độ tin cậy Mạng lưới Rơ-le Viễn thông):*
    Một tín hiệu truyền từ trạm phát $S$ đến trạm thu $K$ qua một mạng lưới gồm 3 khóa điện tử (rơ-le) $R_1, R_2, R_3$. Trong đó rơ-le $R_1$ và $R_2$ được mắc song song với nhau, cụm song song này lại được mắc nối tiếp với rơ-le $R_3$. Xác suất hoạt động bình thường (đóng mạch thông suốt) của các rơ-le $R_1, R_2, R_3$ hoàn toàn độc lập và lần lượt bằng $p_1 = 0.8$, $p_2 = 0.8$, $p_3 = 0.9$.
  ],
  (
    True([a) Cụm rơ-le mắc song song $(R_1 " // " R_2)$ bị mất thông suốt khi và chỉ khi cả $R_1$ và $R_2$ cùng hỏng, xác suất này bằng $0.04$.]),
    True([b) Xác suất để cụm song song $(R_1 " // " R_2)$ truyền được tín hiệu là $0.96$.]),
    True([c) Toàn bộ hệ thống từ $S$ đến $K$ thông suốt khi và chỉ khi cụm song song thông suốt VÀ rơ-le $R_3$ thông suốt.]),
    False([d) Xác suất để toàn hệ thống truyền được tín hiệu thành công bằng $0.924$.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Vì $R_1$ và $R_2$ mắc song song, dòng tín hiệu chỉ bị chặn hoàn toàn khi cả hai rơ-le cùng hỏng:
    $ P("Cả hai hỏng") = (1 - p_1) dot (1 - p_2) = (1 - 0.8) dot (1 - 0.8) = 0.2 dot 0.2 = 0.04. $
  - *Ý b) Đúng:* Xác suất để cụm song song dẫn thông tín hiệu là biến cố đối:
    $ P("Cụm song song thông") = 1 - 0.04 = 0.96. $
  - *Ý c) Đúng:* Do cụm song song mắc nối tiếp với $R_3$, mạch tổng thể muốn thông thì bắt buộc cả hai khối nối tiếp này phải đồng thời hoạt động bình thường.
  - *Ý d) Sai:* Xác suất để toàn hệ thống truyền thông suốt là:
    $ P("Hệ thống") = P("Cụm song song") dot P(R_3) = 0.96 dot 0.9 = 0.864. $
    Giá trị này khác $0.924$. Mệnh đề d là Sai.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Xác suất tổng số chấm chia hết cho 3 khi gieo 3 con xúc xắc):*
    Gieo đồng thời 3 con xúc xắc cân đối và đồng chất. Tính xác suất để tổng số chấm xuất hiện trên 3 con xúc xắc là một số chia hết cho 3.
  ],
  [
    *Đáp số: 0.333 (hoặc 1/3)*
  ],
)
#step[
  *Lời giải chi tiết bằng Đồng dư thức (Modular Arithmetic):*
  - Mỗi con xúc xắc có 6 mặt mang số chấm ${1, 2, 3, 4, 5, 6}$.
  - Phân loại 6 mặt theo số dư khi chia cho 3:
    - Dư 0: ${3, 6}$ (có 2 mặt).
    - Dư 1: ${1, 4}$ (có 2 mặt).
    - Dư 2: ${2, 5}$ (có 2 mặt).
  - Nhận thấy số lượng các mặt có số dư 0, 1, 2 là hoàn toàn bằng nhau (mỗi loại đều có xác suất $2/6 = 1/3$).
  - Khi gieo con xúc xắc thứ nhất và thứ hai, tổng số chấm của hai con này nhận một số dư $r in {0, 1, 2}$ nào đó khi chia cho 3.
  - Khi gieo con xúc xắc thứ ba, để tổng cả 3 con chia hết cho 3:
    - Số chấm của con thứ ba bắt buộc phải có số dư là $(3 - r) mod 3$.
    - Do các lớp số dư có xác suất như nhau bằng $1/3$, bất kể hai con đầu có tổng là bao nhiêu, con xúc xắc thứ ba luôn có xác suất đúng bằng $1/3$ để hoàn thành tổng chia hết cho 3!
  - Vậy xác suất tổng số chấm chia hết cho 3 là chính xác $1/3 approx 0.333$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Bài toán Bước đi ngẫu nhiên 1 chiều - Random Walk):*
    Một chất điểm bắt đầu từ gốc tọa độ $O(0)$ trên trục số. Mỗi giây, chất điểm nhảy sang phải $+1$ đơn vị với xác suất $1/2$ hoặc nhảy sang trái $-1$ đơn vị với xác suất $1/2$. Các bước nhảy độc lập nhau. Tính xác suất để sau đúng $6$ giây chất điểm quay trở lại đúng gốc tọa độ $O(0)$ (kết quả viết dưới dạng phân số tối giản $a/b$).
  ],
  [
    *Đáp số: 5/16*
  ],
)
#step[
  *Lời giải chi tiết bằng Phân phối Nhị thức:*
  - Sau 6 bước nhảy, gọi $k$ là số bước nhảy sang phải ($+1$), khi đó số bước nhảy sang trái ($-1$) là $6 - k$.
  - Tọa độ của chất điểm sau 6 giây là:
    $ X_6 = k dot (+1) + (6 - k) dot (-1) = k - 6 + k = 2k - 6. $
  - Để chất điểm quay trở lại đúng gốc $O(0)$ thì:
    $ 2k - 6 = 0 <==> 2k = 6 <==> k = 3. $
  - Như vậy trong 6 bước nhảy, chất điểm phải có đúng 3 bước nhảy sang phải và 3 bước nhảy sang trái.
  - Số cách chọn 3 bước nhảy sang phải từ 6 bước là:
    $ C_6^3 = (6 dot 5 dot 4) / (3 dot 2 dot 1) = 20. $
  - Tổng số chuỗi bước nhảy có thể xảy ra trong 6 giây là:
    $ 2^6 = 64. $
  - Vì các chuỗi đều đồng khả năng (mỗi chuỗi có xác suất $(1/2)^6 = 1/64$), xác suất cần tìm là:
    $ P = C_6^3 / 2^6 = 20 / 64 = 5 / 16 = 0.3125. $
  - *Đáp số:* $5/16$.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Xác suất 3 số chọn ngẫu nhiên có tổng chia hết cho 3):*
    Chọn ngẫu nhiên đồng thời 3 số khác nhau từ tập hợp $X = {1, 2, 3, dots, 30}$. Tính xác suất để tổng của 3 số được chọn chia hết cho 3 (kết quả viết dưới dạng phân số tối giản $a/b$).
  ],
  [
    *Đáp số: 111/348 (hoặc 111/348 rút gọn)*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Tập hợp $X$ có 30 phần tử. Số cách chọn ngẫu nhiên 3 số là:
    $ |Omega| = C_30^3 = (30 dot 29 dot 28) / 6 = 4.060. $
  - Phân chia 30 số thành 3 tập hợp theo số dư khi chia cho 3:
    - Tập $A_0 = {3, 6, 9, dots, 30}$ (gồm 10 số chia hết cho 3).
    - Tập $A_1 = {1, 4, 7, dots, 28}$ (gồm 10 số chia 3 dư 1).
    - Tập $A_2 = {2, 5, 8, dots, 29}$ (gồm 10 số chia 3 dư 2).
  - Tổng của 3 số $a + b + c$ chia hết cho 3 khi và chỉ khi xảy ra một trong hai trường hợp sau:
    - *Trường hợp 1: Cả 3 số cùng thuộc một tập dư:*
      - 3 số cùng thuộc $A_0$: $C_10^3 = 120$ cách.
      - 3 số cùng thuộc $A_1$: $C_10^3 = 120$ cách.
      - 3 số cùng thuộc $A_2$: $C_10^3 = 120$ cách.
      - Số cách trong TH1: $3 dot 120 = 360$ cách.
    - *Trường hợp 2: Mỗi số thuộc một tập dư khác nhau (1 số dư 0, 1 số dư 1, 1 số dư 2):*
      - Số cách chọn: $C_10^1 dot C_10^1 dot C_10^1 = 10 dot 10 dot 10 = 1.000$ cách.
  - Tổng số cách chọn thỏa mãn là:
    $ |A| = 360 + 1.000 = 1.360. $
  - Xác suất cần tìm là:
    $ P(A) = 1360 / 4060 = 136 / 406 = 68 / 203 approx 0.33497. $
]

#v(1em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TOÁN THÁCH THỨC OLYMPIC (GRAND CHALLENGE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: 1.5pt + c-amber,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  *BÀI TOÁN (Bài toán Chia tiền cược Lịch sử của Blaise Pascal & Pierre de Fermat - 1654):*
  
  Hai đấu thủ $A$ và $B$ chơi một trận đấu cờ gồm nhiều ván độc lập, mỗi ván có xác suất thắng của mỗi người là $1/2$ (không có ván hòa). Người nào thắng trước đủ $5$ ván sẽ giành toàn bộ giải thưởng là $6400$ đồng vàng.
  
  Khi trận đấu đang diễn ra thì bị buộc phải dừng lại vì lý do bất khả kháng, lúc này đấu thủ $A$ đang dẫn trước với tỉ số $4 - 3$ (nghĩa là $A$ chỉ cần thắng thêm đúng 1 ván nữa là thắng chung cuộc, trong khi $B$ cần phải thắng liên tiếp 2 ván nữa).
  
  1. Hãy tính xác suất thắng chung cuộc $P(A)$ và $P(B)$ nếu trận đấu được tiếp tục.
  2. Dựa trên kỳ vọng toán học công bằng, số tiền thưởng $6400$ đồng vàng phải được phân chia cho $A$ và $B$ như thế nào?
]

#step[
  *Lời giải chuyên khảo lịch sử của Pascal & Fermat:*
  
  - *Ý 1: Tính xác suất thắng chung cuộc:*
    - Nhận xét quan trọng của Fermat: Để phân định thắng thua, trận đấu cần diễn ra thêm tối đa:
      $ (5 - 4) + (5 - 3) - 1 = 1 + 2 - 1 = 2 " ván nữa". $
    - Giả sử hai đấu thủ tiếp tục chơi thêm đúng 2 ván nữa bất kể kết quả.
    - Không gian mẫu gồm 4 kết quả đồng khả năng cho 2 ván tiếp theo (ký hiệu $(x, y)$ với $x, y in {A, B}$ là người thắng ván đó):
      $ Omega = {(A, A), (A, B), (B, A), (B, B)}. $
      Mỗi kết quả có xác suất xuất hiện là $(1/2)^2 = 1/4$.
    - Phân tích người thắng cuộc trong từng trường hợp:
      - Nếu kết quả là $(A, A)$: $A$ thắng ván đầu tiên $==>$ $A$ đạt 5 ván thắng trước $==>$ $A$ thắng.
      - Nếu kết quả là $(A, B)$: $A$ thắng ván đầu tiên $==>$ $A$ đạt 5 ván thắng trước $==>$ $A$ thắng.
      - Nếu kết quả là $(B, A)$: $B$ thắng ván đầu (tỉ số 4 - 4), $A$ thắng ván sau (tỉ số 5 - 4) $==>$ $A$ thắng.
      - Nếu kết quả là $(B, B)$: $B$ thắng cả hai ván tiếp theo $==>$ $B$ đạt 5 ván thắng (tỉ số 4 - 5) $==>$ $B$ thắng!
    - Như vậy, trong 4 kịch bản đồng khả năng, có $3$ kịch bản $A$ vô địch và chỉ có duy nhất $1$ kịch bản $B$ lội ngược dòng vô địch.
    - Xác suất vô địch thực tế của hai đấu thủ là:
      $ P(A) = 3/4 = 0.75 $
      $ P(B) = 1/4 = 0.25. $

  - *Ý 2: Phân chia giải thưởng công bằng theo Kỳ vọng:*
    - Theo nguyên lý công bằng toán học, mỗi đấu thủ phải nhận được số tiền đúng bằng giá trị kỳ vọng (Expected Value) của họ:
      $ E(A) = 6400 dot P(A) = 6400 dot 3/4 = 4800 " đồng vàng". $
      $ E(B) = 6400 dot P(B) = 6400 dot 1/4 = 1600 " đồng vàng". $
    - *Bình luận lịch sử:* Lời giải tuyệt mỹ này của Fermat và Pascal đã chấm dứt nhiều thế kỷ tranh cãi sai lầm (những người trước đó chia theo tỉ số ván thắng $4 : 3$, dẫn đến tỉ lệ bất công $4/7$ và $3/7$). Tư duy chia thưởng theo xác suất tương lai chính là khởi nguồn của toàn bộ ngành Định giá Tùy chọn Tài chính (Black - Scholes Model) hiện đại ngày nay!
]
