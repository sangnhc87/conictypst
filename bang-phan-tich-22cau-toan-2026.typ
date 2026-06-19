// ╔══════════════════════════════════════════════════════╗
// ║  BẢNG DỰ ĐOÁN CHI TIẾT 22 CÂU — TOÁN THPT 2026    ║
// ║  Viết lại: Cụm kiến thức đa dạng, L10/11/12        ║
// ╚══════════════════════════════════════════════════════╝

#set page(
  paper: "a4",
  margin: (x: 1.4cm, y: 1.8cm),
  header: [
    #text(fill: rgb("6b7280"), size: 8pt)[_Dự đoán 22 câu Toán THPT 2026 — Cụm kiến thức theo Chương trình GDPT 2018 (Lớp 10 + 11 + 12)_]
    #line(length: 100%, stroke: 0.4pt + rgb("e5e7eb"))
  ],
  footer: [
    #line(length: 100%, stroke: 0.4pt + rgb("e5e7eb"))
    #align(center)[#text(fill: rgb("6b7280"), size: 8pt)[Trang #context counter(page).display()]]
  ]
)

#set text(font: "Times New Roman", size: 9.5pt, fill: rgb("111827"), lang: "vi")
#set par(justify: true, leading: 0.6em, first-line-indent: 0em)

// ── Màu sắc ──────────────────────────────────────────────
#let navy   = rgb("1e3a8a")
#let teal   = rgb("0f766e")
#let red    = rgb("b91c1c")
#let amber  = rgb("78350f")
#let purple = rgb("5b21b6")
#let indigo = rgb("3730a3")
#let slate  = rgb("f8fafc")
#let border = rgb("cbd5e1")

// ── Cấp lớp badge ────────────────────────────────────────
#let badge10 = box(fill: rgb("fef3c7"), stroke: 0.5pt + rgb("d97706"), inset: (x:4pt, y:2pt), radius: 3pt)[
  #text(size: 7.5pt, fill: rgb("92400e"), weight: "bold")[L10]
]
#let badge11 = box(fill: rgb("ede9fe"), stroke: 0.5pt + rgb("7c3aed"), inset: (x:4pt, y:2pt), radius: 3pt)[
  #text(size: 7.5pt, fill: rgb("5b21b6"), weight: "bold")[L11]
]
#let badge12 = box(fill: rgb("dbeafe"), stroke: 0.5pt + rgb("2563eb"), inset: (x:4pt, y:2pt), radius: 3pt)[
  #text(size: 7.5pt, fill: rgb("1e40af"), weight: "bold")[L12]
]
#let badgeNEW = box(fill: rgb("fee2e2"), stroke: 0.5pt + rgb("dc2626"), inset: (x:4pt, y:2pt), radius: 3pt)[
  #text(size: 7.5pt, fill: rgb("b91c1c"), weight: "bold")[MỚI]
]

// ── Hộp "Cụm kiến thức" ─────────────────────────────────
#let cum-box(items) = block(
  width: 100%,
  fill: rgb("f1f5f9"),
  stroke: (left: 3pt + teal),
  inset: (x: 8pt, y: 6pt),
  radius: (right: 3pt),
)[#items]

// ── Section header ────────────────────────────────────────
#let section-header(title, sub, col) = block(
  width: 100%,
  fill: col,
  inset: (x: 12pt, y: 9pt),
  radius: (top: 5pt, bottom: 0pt),
)[
  #text(size: 11.5pt, weight: "bold", fill: white)[#title] \
  #text(size: 8.5pt, fill: luma(230))[#sub]
]

// ╔════════════════════════════════════════════════════════╗
// ║  TIÊU ĐỀ                                             ║
// ╚════════════════════════════════════════════════════════╝
#align(center)[
  #block(width: 100%, fill: navy, inset: (x: 14pt, y: 13pt), radius: 6pt)[
    #text(size: 14.5pt, weight: "bold", fill: white)[
      BẢNG PHÂN TÍCH & DỰ ĐOÁN CHI TIẾT 22 CÂU
    ] \
    #v(0.3em)
    #text(size: 11pt, fill: rgb("93c5fd"), weight: "bold")[
      ĐỀ THI TỐT NGHIỆP THPT MÔN TOÁN 2026
    ] \
    #v(0.2em)
    #text(size: 8.5pt, fill: rgb("bfdbfe"))[
      Chương trình GDPT 2018 · Cụm kiến thức đa dạng · Bao gồm kiến thức Lớp 10, 11, 12
    ]
  ]
]
#v(0.6em)

// ── Chú thích ────────────────────────────────────────────
#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  block(fill: rgb("fef3c7"), stroke: 0.5pt + border, inset: 6pt, radius: 3pt)[
    #text(size: 8pt, fill: rgb("92400e"), weight: "bold")[🟡 L10] #text(size: 8pt)[Toán lớp 10]
  ],
  block(fill: rgb("ede9fe"), stroke: 0.5pt + border, inset: 6pt, radius: 3pt)[
    #text(size: 8pt, fill: purple, weight: "bold")[🟣 L11] #text(size: 8pt)[Toán lớp 11]
  ],
  block(fill: rgb("dbeafe"), stroke: 0.5pt + border, inset: 6pt, radius: 3pt)[
    #text(size: 8pt, fill: navy, weight: "bold")[🔵 L12] #text(size: 8pt)[Toán lớp 12]
  ],
  block(fill: rgb("fee2e2"), stroke: 0.5pt + border, inset: 6pt, radius: 3pt)[
    #text(size: 8pt, fill: red, weight: "bold")[🔴 MỚI] #text(size: 8pt)[KT mới CT2018]
  ],
  block(fill: rgb("dcfce7"), stroke: 0.5pt + border, inset: 6pt, radius: 3pt)[
    #text(size: 8pt, fill: rgb("166534"), weight: "bold")[★ Trọng tâm] #text(size: 8pt)[Ưu tiên ôn]
  ],
)
#v(0.8em)

// ╔════════════════════════════════════════════════════════╗
// ║  PHẦN I — 12 CÂU TRẮC NGHIỆM                        ║
// ╚════════════════════════════════════════════════════════╝
#section-header(
  "PHẦN I — TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN (12 câu · 3,0 điểm · 0,25 đ/câu)",
  "Mức độ: Nhận biết & Thông hiểu · Mục tiêu: Đạt TRỌN 3,0 điểm — Không được để mất điểm oan tại đây",
  navy
)

// ─── THIẾT KẾ: Mỗi câu = 1 block dài với cụm KT đa dạng ──
// Dùng layout 2 cột trong bảng để dễ đọc

#let pI-row(so, cum-kt, phan-tich, on-gi, bay) = (
  align(center)[#text(weight: "bold", size: 10pt)[#so]],
  cum-kt,
  phan-tich,
  on-gi,
  bay,
)

#table(
  columns: (0.5cm, 4.2cm, 5.4cm, 4.6cm, 3.1cm),
  inset: (x: 7pt, y: 7pt),
  align: (center, left, left, left, left),
  stroke: 0.5pt + border,
  fill: (x, y) => if y == 0 { indigo } else if calc.rem(y, 2) == 0 { slate } else { white },

  // Header
  text(fill: white, weight: "bold", size: 8.5pt)[Câu],
  text(fill: white, weight: "bold", size: 8.5pt)[Cụm kiến thức có thể xuất hiện],
  text(fill: white, weight: "bold", size: 8.5pt)[Phân tích & Nhận dạng dạng toán],
  text(fill: white, weight: "bold", size: 8.5pt)[Cần ôn tập & Lưu ý khi làm bài],
  text(fill: white, weight: "bold", size: 8.5pt)[Bẫy thường gặp],

  // ══ CÂU 1 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[1]],
  [
    #badge12 *Chiều đơn điệu hàm số bậc ba* \
    #badge12 *Đọc bảng biến thiên (BBT)* \
    #badge11 *Hàm số mũ / Hàm logarit cơ bản* \
    #badge10 *Hàm số bậc hai — chiều biến thiên*
  ],
  [#text(size: 8.5pt)[Câu dễ nhất Phần I. Thường cho đồ thị hoặc BBT sẵn rồi hỏi: khoảng tăng/giảm, tập xác định, giá trị lớn nhất trên đoạn. \
  • *Hàm bậc ba:* $f(x) = a x^3 + b x^2 + c x + d$ — BBT đã cho sẵn, chỉ cần đọc đúng.\
  • *Hàm mũ $a^x$:* tăng khi $a>1$, giảm khi $0<a<1$.\
  • *Hàm log $log_a x$:* tăng khi $a>1$, giảm khi $0<a<1$.
  ]],
  [#text(size: 8.5pt)[★ *Thuộc nhanh:* Quy tắc đọc BBT — dấu $f'(x)$ quyết định chiều hàm số. \
  Ôn: Hàm số bậc 3 lớp 12; Hàm mũ-log lớp 11; Hàm bậc 2 lớp 10.
  ]],
  [#text(size: 8.5pt)[Nhầm chiều tăng/giảm khi BBT có dấu âm phức tạp. Nhầm khoảng mở vs. đóng.]],

  // ══ CÂU 2 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[2]],
  [
    #badge12 *Cực trị hàm số — đọc từ đồ thị hoặc tính* \
    #badge11 *Đạo hàm: Quy tắc tính, hàm hợp* \
    #badge10 *Parabol — đỉnh, trục đối xứng* \
    #badge12 *Hàm phân thức bậc 1/1 — cực trị*
  ],
  [#text(size: 8.5pt)[Hỏi tọa độ cực đại, cực tiểu hoặc số điểm cực trị. Có 2 dạng:\
  • Cho đồ thị $y = f(x)$: đếm "đỉnh" đổi chiều.\
  • Cho hàm cụ thể: tính $f'(x) = 0$, kiểm tra đổi dấu.\
  Nếu cho đồ thị *$f'(x)$*: cực trị của $f$ là số lần $f'$ đổi dấu qua $O x$.
  ]],
  [#text(size: 8.5pt)[★ Ôn: Điều kiện cực trị (đổi dấu $f'$, không chỉ $f'=0$). \
  Phân biệt: điểm cực trị ≠ điểm uốn. \
  Với hàm bậc 3: tối đa 2 cực trị; hàm phân thức bậc 1/1: *không có cực trị*.
  ]],
  [#text(size: 8.5pt)[Nhầm điểm uốn là cực trị. Đọc đồ thị $f'$ nhưng kết luận cho $f$ — phải chuyển đổi tư duy.]],

  // ══ CÂU 3 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[3]],
  [
    #badge12 #badgeNEW *Tiệm cận đứng, ngang, xiên* \
    #badge11 *Giới hạn hàm số tại vô cực* \
    #badge10 *Đường tròn — phương trình, tiếp tuyến* \
    #badge11 *Hàm số lượng giác — chu kỳ, nghiệm*
  ],
  [#text(size: 8.5pt)[Tiệm cận là kiến thức *nền tảng lớp 12 mới*:\
  • *TCĐ:* $x = a$ khi mẫu $= 0$ và tử $≠ 0$.\
  • *TCN:* Giới hạn $x → ±∞$ cho ra hằng số hữu hạn.\
  • *TCX (MỚI):* Hàm bậc 2/bậc 1 — chia đa thức, lấy phần thương bậc nhất.\
  Câu này cũng có thể hỏi về giới hạn hàm log/mũ khi $x→ 0^+$ hoặc $x→+∞$.
  ]],
  [#text(size: 8.5pt)[★ Thuộc 3 quy tắc TCĐ/TCN/TCX.\
  Ôn thêm: Giới hạn đặc biệt lớp 11: $lim_(x→0) sin(x)/x = 1$.\
  Thực hành: Nhận dạng nhanh dạng hàm → chọn đúng loại tiệm cận.
  ]],
  [#text(size: 8.5pt)[Áp dụng công thức TCN cho hàm bậc 2/1 (kết quả $= ∞$) — đây là TCX, không phải TCN!]],

  // ══ CÂU 4 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[4]],
  [
    #badge12 *GTLN / GTNN trên đoạn đóng $[a; b]$* \
    #badge11 *Hàm mũ / logarit: Phương trình, BPT* \
    #badge10 *Bất phương trình bậc hai* \
    #badge11 *Đạo hàm ứng dụng: Phương trình tiếp tuyến*
  ],
  [#text(size: 8.5pt)[Tìm max/min trên đoạn đóng:\
  B1: Tính $f'(x) = 0$ → nghiệm trong khoảng.\
  B2: Lập bảng giá trị: $f(a)$, $f(b)$, và các nghiệm.\
  B3: So sánh → GTLN là giá trị lớn nhất trong bảng.\
  Nếu hỏi phương trình tiếp tuyến: $f'(x_0)$ là hệ số góc.
  ]],
  [#text(size: 8.5pt)[★ Bắt buộc: Tính giá trị tại 2 đầu mút $f(a)$, $f(b)$.\
  Ôn: Hàm mũ-log — PT dạng $2^x = 8$, $log_2 x = 3$.\
  Ôn: BPT bậc 2: Tam thức bậc hai, bảng dấu.
  ]],
  [#text(size: 8.5pt)[Quên kiểm tra đầu mút → chọn cực trị cục bộ thay vì GTLN. Nhầm $f'(x_0) = 0$ là điều kiện cần, không đủ.]],

  // ══ CÂU 5 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[5]],
  [
    #badge12 *Nguyên hàm — Công thức cơ bản* \
    #badge11 *Cấp số cộng / Cấp số nhân* \
    #badge10 *Tổ hợp — Chỉnh hợp — Hoán vị* \
    #badge11 *Nhị thức Newton*
  ],
  [#text(size: 8.5pt)[Nếu hỏi nguyên hàm: Nhận dạng $∫ x^n$, $∫ e^x$, $∫ sin x$, $∫ cos x$, $∫ 1/x$. Áp dụng thẳng bảng công thức.\
  Nếu hỏi cấp số: Tìm $u_n$, tổng $S_n$ của CSC / CSN.\
  Nếu hỏi tổ hợp: Phân biệt $A_n^k$ (có thứ tự) và $C_n^k$ (không có thứ tự).
  ]],
  [#text(size: 8.5pt)[★ Thuộc bảng nguyên hàm cơ bản (12 công thức).\
  Ôn: CSC — công sai; CSN — công bội. Ứng dụng lãi suất ngân hàng.\
  Ôn: Nhị thức Newton: $(a+b)^n$ — hệ số $C_n^k$.
  ]],
  [#text(size: 8.5pt)[Nguyên hàm $∫ e^{k x} d x = e^{k x}/k + C$ — quên chia $k$. CSN nhầm công thức $S_n$.]],

  // ══ CÂU 6 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[6]],
  [
    #badge12 *Tích phân xác định — Newton-Leibniz* \
    #badge12 *Tính chất tích phân* \
    #badge11 *Hàm số lượng giác: Phương trình lượng giác* \
    #badge10 *Hệ tọa độ phẳng: Vectơ, tích vô hướng*
  ],
  [#text(size: 8.5pt)[Tính $∫_a^b f(x)d x = F(b) - F(a)$. Câu này thường cho hàm đơn giản (đa thức, $e^x$, $sin/cos$).\
  Tính chất hay dùng: $∫_a^b [α f + β g] d x = α∫f d x + β∫g d x$.\
  Đổi cận: $∫_b^a f d x = -∫_a^b f d x$.
  ]],
  [#text(size: 8.5pt)[★ Thuộc Newton-Leibniz và 6 tính chất tích phân.\
  Ôn: PT lượng giác cơ bản: $sin x = m$, $cos x = m$, $tan x = m$.\
  Ôn: Vectơ mặt phẳng: $vec(u) dot vec(v) = |u||v|cos θ$.
  ]],
  [#text(size: 8.5pt)[Nhầm chiều đổi cận (đổi dấu tích phân). Tính F(b) - F(a) nhưng nhầm chiều trừ.]],

  // ══ CÂU 7 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[7]],
  [
    #badge12 *Diện tích hình phẳng — Tích phân ứng dụng* \
    #badge10 #badgeNEW *Đường cônic: Elip, Hyperbol, Parabol* \
    #badge11 *Xác suất biến ngẫu nhiên rời rạc* \
    #badge10 *Đường tròn — Vị trí tương đối, tiếp tuyến*
  ],
  [#text(size: 8.5pt)[*Diện tích hình phẳng:* $S = ∫_a^b |f(x) - g(x)| d x$. Cần xác định giao điểm trước.\
  *Cônic (kiến thức MỚI lớp 10):* Elip $x^2/a^2 + y^2/b^2 = 1$; Hyperbol $x^2/a^2 - y^2/b^2 = 1$. Nhận dạng phương trình chuẩn.\
  *Xác suất rời rạc:* $E(X)$, $D(X)$ của biến ngẫu nhiên.
  ]],
  [#text(size: 8.5pt)[★ Ôn: Cônic — nhận dạng a, b, c; tiêu cự; tâm sai. Rất dễ ra Phần I dạng nhận biết.\
  Ôn: Phân biệt diện tích "trên - dưới" vs. "phải - trái" trục.
  ]],
  [#text(size: 8.5pt)[Diện tích: Quên lấy $|f-g|$ → kết quả âm. Cônic: Nhầm $a^2$ và $b^2$ trong elip vs. hyperbol.]],

  // ══ CÂU 8 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[8]],
  [
    #badge12 *Phương trình mặt phẳng trong không gian* \
    #badge12 *Phương trình đường thẳng trong không gian* \
    #badge10 *Phương trình đường thẳng trong mặt phẳng* \
  ],
  [#text(size: 8.5pt)[*Mặt phẳng:* Nhận dạng phương trình $a x + b y + c z + d = 0$. Vec-tơ pháp tuyến $vec(n) = (a, b, c)$.\
  *Đường thẳng:* PT tham số hoặc chính tắc. Vec-tơ chỉ phương $vec(u)$.\
  ]],
  [#text(size: 8.5pt)[★ Ôn: Viết PTMP từ 3 điểm (tích có hướng). Viết PTĐT từ 1 điểm + vectơ chỉ phương.\
  ]],
  [#text(size: 8.5pt)[Nhầm VTPT của mp với VT chỉ phương của đt.]],

  // ══ CÂU 9 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[9]],
  [
    #badge12 *Khoảng cách trong không gian Oxyz* \
    #badge12 *Góc giữa hai mặt phẳng / đường thẳng* \
    #badge11 *Dãy số — Giới hạn của dãy số* \
    #badge10 *Xác suất cổ điển — Quy tắc đếm*
  ],
  [#text(size: 8.5pt)[*Khoảng cách điểm → mp:* $d = |a x_0 + b y_0 + c z_0 + d| / sqrt(a^2 + b^2 + c^2)$.\
  *Góc giữa 2 mp:* $cos θ = |vec(n_1) dot vec(n_2)| / (|vec(n_1)| dot |vec(n_2)|)$.\
  *Giới hạn dãy số:* $lim_{n→∞} 1/n = 0$; $lim_{n→∞} q^n = 0$ khi $|q| < 1$.
  ]],
  [#text(size: 8.5pt)[★ Thuộc công thức khoảng cách điểm-mp (dùng nhiều nhất trong Oxyz).\
  Ôn: Góc — luôn lấy giá trị tuyệt đối của tích vô hướng → góc $∈ [0°; 90°]$.\
  Ôn: Xác suất cổ điển: $P = |A|/|Ω|$.
  ]],
  [#text(size: 8.5pt)[Quên trị tuyệt đối tử số → khoảng cách âm. Góc giữa 2 mp nhầm lấy > 90°.]],

  // ══ CÂU 10 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[10]],
  [
    #badge12 *Tứ phân vị — Trung vị mẫu ghép nhóm* \
    #badge11 *Biến ngẫu nhiên —  Phương sai* \
    #badge10 *Thống kê mô tả: Số trung bình, Trung vị* \
    #badge11 *Xác suất — Quy tắc cộng, nhân*
  ],
  [#text(size: 8.5pt)[*Mẫu ghép nhóm (L12 MỚI):* Cho bảng phân phối tần số → Lập cột tần số tích lũy → Xác định nhóm chứa $Q_1, Q_2, Q_3$ → Nội suy tuyến tính.\
  *Biến ngẫu nhiên (L11):* Bảng phân phối xác suất → $E(X) = Σ x_i p_i$.
  ]],
  [#text(size: 8.5pt)[★ Ôn: Công thức nội suy tứ phân vị (thuộc lòng!).\
  Nhớ: $x_i$ trong ghép nhóm = *trung điểm* của khoảng, không phải cận.\
  Ôn: $E(X)$, $D(X) = E(X^2) - [E(X)]^2$.
  ]],
  [#text(size: 8.5pt)[Dùng cận dưới thay vì trung điểm nhóm. Nhầm công thức $k n/4$ (dùng 4, không phải 2 hay 3).]],

  // ══ CÂU 11 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[11]],
  [
    #badge12 *Xác suất có điều kiện cơ bản* \
    #badge11 *Hoán vị, Chỉnh hợp, Tổ hợp ứng dụng* \
    #badge10 *Bất phương trình — Hệ bất phương trình* \
    #badge11 *Phép thử Bernoulli — Phân phối nhị thức*
  ],
  [#text(size: 8.5pt)[*XS có điều kiện:* $P(A|B) = P(A ∩ B) / P(B)$. Câu nhận biết: cho bảng 2 chiều hoặc mô tả thử nghiệm đơn giản.\
  *Bernoulli (L11):* $X ~ B(n, p)$ → $P(X=k) = C_n^k p^k (1-p)^{n-k}$.\
  *Tổ hợp ứng dụng:* Bài toán chọn đội, sắp xếp có điều kiện.
  ]],
  [#text(size: 8.5pt)[★ Ôn: Phân biệt $P(A|B)$ vs. $P(B|A)$.\
  Ôn: Phân phối nhị thức — hay xuất hiện dạng "xác suất đúng $k$ lần trong $n$ lần thử".\
  Ôn: Tổ hợp — bài toán chia nhóm, chọn có điều kiện.
  ]],
  [#text(size: 8.5pt)[Nhầm $P(A|B)$ với $P(B|A)$. Bernoulli: Quên thừa số $C_n^k$ trong công thức.]],

  // ══ CÂU 12 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: navy)[12]],
  [
    #badge12 *Bài toán thực tế — Tổng hợp kiến thức* \
    #badge12 *Đọc đồ thị hàm hợp $f(2x-1)$* \
    #badge11 *Lãi suất kép — Ứng dụng CSN* \
    #badge10 *Hệ phương trình — Ứng dụng thực tế*
  ],
  [#text(size: 8.5pt)[Câu cuối Phần I, mức Thông hiểu nhẹ, thường có bối cảnh thực tế:\
  • *Lãi kép (L11):* Tiền sau $n$ năm = $P(1+r)^n$. Tìm $n$, $P$ hoặc $r$.\
  • *Hàm hợp:* Đọc đồ thị $y = f(u(x))$ — xác định cực trị bằng cách đặt $t = u(x)$.\
  • *Hệ PT:* Bài toán pha trộn, chuyển động, diện tích.
  ]],
  [#text(size: 8.5pt)[★ Ôn: CSN — Công thức $S_n = a_1(q^n - 1)/(q - 1)$ (ứng dụng tích lũy tiết kiệm).\
  Ôn: Nhận dạng nhanh "bài thực tế" và quy về mô hình toán học đã biết.
  ]],
  [#text(size: 8.5pt)[Đọc câu hỏi vội → áp nhầm công thức. Lãi kép: Nhầm lãi đơn vs. lãi kép (cộng vs. nhân).]],
)

#v(1em)

// ╔════════════════════════════════════════════════════════╗
// ║  PHẦN II — 4 CÂU ĐÚNG / SAI                         ║
// ╚════════════════════════════════════════════════════════╝
#section-header(
  "PHẦN II — ĐÚNG / SAI (4 câu lớn × 4 ý a/b/c/d = 16 ý · 4,0 điểm)",
  "Tính linh hoạt cao: Mỗi vị trí câu hỏi có thể trộn nhiều mảng kiến thức (Đại số, Hình học, XS-TK) thuộc Lớp 10, 11, 12",
  teal
)

#let ds-block(so, title, badge-list, ys) = {
  block(
    width: 100%,
    stroke: 0.5pt + border,
    inset: 0pt,
    radius: 4pt,
  )[
    #block(
      width: 100%,
      fill: rgb("0d6e63"),
      inset: (x: 10pt, y: 7pt),
      radius: (top: 4pt, bottom: 0pt),
    )[
      #grid(columns: (auto, 1fr), gutter: 8pt,
        text(size: 13pt, weight: "bold", fill: white)[#so],
        [
          #text(size: 10pt, weight: "bold", fill: white)[#title] \
          #badge-list
        ]
      )
    ]
    #table(
      columns: (0.6cm, 3.2cm, 5.5cm, 4.9cm, 3.6cm),
      inset: (x: 7pt, y: 7pt),
      align: (center, left, left, left, left),
      stroke: 0.5pt + border,
      fill: (x, y) => if y == 0 { rgb("e0f2fe") } else if calc.rem(y, 2) == 0 { white } else { slate },

      text(weight: "bold", size: 8.5pt, fill: teal)[Ý],
      text(weight: "bold", size: 8.5pt, fill: teal)[Kịch bản kiến thức / Cụm KT],
      text(weight: "bold", size: 8.5pt, fill: teal)[Nội dung chi tiết & Cách xử lý],
      text(weight: "bold", size: 8.5pt, fill: teal)[Trọng tâm Ôn tập & Lưu ý],
      text(weight: "bold", size: 8.5pt, fill: teal)[Bẫy & Chiến thuật],

      ..ys
    )
  ]
  v(0.7em)
}

// ══ CÂU 13: ĐẠI SỐ & GIẢI TÍCH 12 ══
#ds-block(
  "13",
  "Đại số & Giải tích — Hàm số, Mũ-Logarit, Lãi suất",
  [#badge12 Hàm số đa thức/phân thức · #badge12 Hàm ẩn · #badge11 Mũ - Logarit · #badge11 Dãy số & CSN],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 *KB 1:* Đọc tính chất từ đồ thị/BBT \ #badge11 *KB 2:* PT/BPT Mũ, Logarit cơ bản],
    [#text(size: 8.5pt)[*KB 1:* Nhìn BBT xác định khoảng đơn điệu, điểm cực trị. Có thể hỏi giới hạn tại vô cực (TCN).\ *KB 2:* Kiểm tra nghiệm của $2^x = 4$, $log_2(x) < 3$. Kiểm tra tập xác định của hàm Logarit (biểu thức trong Log > 0).]],
    [#text(size: 8.5pt)[Ôn kỹ tập xác định hàm Logarit, điều kiện $0 < a < 1$ làm đổi chiều BPT. Đọc đồ thị $f'(x)$ thì cực trị là giao điểm với trục hoành.]],
    [#text(size: 8.5pt)[🟢 Dễ kiếm 0,1đ. Quên đổi chiều BPT mũ/log. Nhầm uốn với cực trị.]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 *KB 1:* GTLN/GTNN trên đoạn \ #badge11 *KB 2:* Bài toán Lãi suất kép],
    [#text(size: 8.5pt)[*KB 1:* Tính $f'(x)$, tìm nghiệm, so sánh các giá trị ở đầu mút. \ *KB 2:* Ứng dụng lãi kép (CSN): $P_n = P_0(1+r)^n$. Kiểm tra sự gia tăng số lượng vi khuẩn, tiền gửi ngân hàng.]],
    [#text(size: 8.5pt)[★ Lãi kép/Tăng trưởng là dạng rất hay thi. Thuộc công thức $S_n$. Nếu $f(x)$ trên $(a, b)$ thì phải lập BBT để tìm cực trị.]],
    [#text(size: 8.5pt)[🟡 Không kiểm tra nghiệm đạo hàm có thuộc đoạn $[a; b]$ hay không. Lãi kép: Nhầm % (vd 5% = 0.05).]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Tiệm cận xiên / Tiếp tuyến \ #badge11 *KB 2:* Biện luận nghiệm BPT Log],
    [#text(size: 8.5pt)[*KB 1:* Chia đa thức (hàm $"bậc" 2 / "bậc" 1$) tìm TCX. Hoặc tìm pttt: $y - y_0 = f'(x_0)(x - x_0)$.\ *KB 2:* BPT logarit chứa tham số $m$: $log_a(f(x)) > m$. Đòi hỏi phân tích miền nghiệm.]],
    [#text(size: 8.5pt)[★ Bắt buộc thực hiện phép chia đa thức cho hàm phân thức. Ôn hệ số góc của đường TCX.]],
    [#text(size: 8.5pt)[🟠 Hàm bậc 2/1 hỏi TCN (sai, chỉ có TCX và TCĐ). Chia đa thức sai dấu.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Hàm ẩn chứa tham số $m$ \ #badge11 *KB 2:* Bài toán tăng trưởng hàm hợp],
    [#text(size: 8.5pt)[Hỏi m để đồ thị hàm số có 3 cực trị, hoặc pt $f(f(x)) = m$ có $k$ nghiệm. Yêu cầu vẽ phác đồ thị, tịnh tiến đồ thị (GTTĐ, hàm hợp). Phân tích bảng biến thiên của hàm hợp $g(x) = f(u(x))$.]],
    [#text(size: 8.5pt)[★ Dùng sơ đồ V (hàm trị tuyệt đối) hoặc đặt ẩn phụ $t = u(x)$ để đếm số nghiệm theo tham số $m$.]],
    [#text(size: 8.5pt)[🔴 Quên trường hợp đường thẳng $y=m$ tiếp xúc với cực đại/tiểu. Bỏ sót điều kiện cực trị của hàm $u(x)$.]],
  )
)

// ══ CÂU 14: HÌNH HỌC KHÔNG GIAN ══
#ds-block(
  "14",
  "Hình học Không gian — Kết hợp Oxyz và Không gian cổ điển",
  [#badge12 Oxyz toàn diện · #badge12 Thể tích khối đa diện · #badge11 Góc & Khoảng cách cổ điển],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 *KB 1:* Tọa độ điểm, vectơ (Oxyz) \ #badge11 *KB 2:* Nhận biết quan hệ song song/VG],
    [#text(size: 8.5pt)[*KB 1:* Các phép toán vectơ $+ - *$, tọa độ trung điểm, trọng tâm tam giác.\ *KB 2:* Cho hình chóp $S.A B C D$, kiểm tra $S A bot (A B C D)$ hoặc $A B parallel (S C D)$ từ giả thiết.]],
    [#text(size: 8.5pt)[Nhớ hệ tọa độ $O x y z$, công thức trung điểm $M = (A+B)/2$. Thuộc định lý đường thẳng vuông góc với mặt phẳng.]],
    [#text(size: 8.5pt)[🟢 Nhầm dấu khi tính $vec(A B) = B - A$. Trực quan hình học yếu dẫn đến nhìn sai quan hệ vuông góc.]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 *KB 1:* Pt mặt phẳng / đường thẳng \ #badge12 *KB 2:* Công thức thể tích cơ bản],
    [#text(size: 8.5pt)[*KB 1:* Lập pt mp qua 3 điểm (tích có hướng). Viết pt tham số của đường thẳng.\ *KB 2:* Tính thể tích hình chóp ($1/3 S h$), hình lăng trụ ($S h$). Xác định đường cao $h$ từ giả thiết.]],
    [#text(size: 8.5pt)[★ Tích có hướng: Dùng casio hoặc nhẩm cẩn thận. Thể tích: Xác định đúng đa giác đáy để tính $S$.]],
    [#text(size: 8.5pt)[🟡 Tính sai VTPT của mp. Quên nhân $1/3$ trong công thức thể tích khối chóp / nón.]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Khoảng cách & Góc trong Oxyz \ #badge11 *KB 2:* Góc & Khoảng cách (Cổ điển)],
    [#text(size: 8.5pt)[*KB 1:* $d(M, (P)) = |a x_M + b y_M + c z_M + d| / sqrt(a^2 + b^2 + c^2)$. Góc giữa 2 mặt phẳng (cosin).\ *KB 2:* Dựng hình chiếu vuông góc. Tính góc giữa đường và mặt, góc nhị diện (hai mặt phẳng).]],
    [#text(size: 8.5pt)[★ Oxyz dễ ăn điểm hơn cổ điển. Nếu gặp cổ điển khó, có thể "tọa độ hóa" (gắn hệ trục $O x y z$) để làm.]],
    [#text(size: 8.5pt)[🟠 Quên trị tuyệt đối ở tử số tính khoảng cách. Góc nhị diện: xác định sai giao tuyến và 2 đường vuông góc.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Mặt cầu tương quan \ #badge12 *KB 2:* Tối ưu cực trị không gian],
    [#text(size: 8.5pt)[*KB 1:* Tương giao mặt cầu và mp (cắt theo đường tròn, tính bán kính thiết diện $r = sqrt(R^2 - d^2)$). \ *KB 2:* Cho điểm $A, B$, tìm $M ∈ (P)$ sao cho chu vi $Delta M A B$ nhỏ nhất, $M A^2 + M B^2$ cực tiểu.]],
    [#text(size: 8.5pt)[★ Tâm đường tròn giao tuyến là hình chiếu của tâm mặt cầu lên mp. Cực trị Oxyz: Dùng tâm tỉ cự hoặc đối xứng mặt phẳng.]],
    [#text(size: 8.5pt)[🔴 Mặt cầu chưa ở dạng chuẩn (quên chia hệ số). Cực trị: Lấy sai điểm đối xứng qua mặt phẳng.]],
  )
)

// ══ CÂU 15: GIẢI TÍCH & ĐẠI SỐ ══
#ds-block(
  "15",
  "Giải tích & Đại số — Tích phân và Bất phương trình",
  [#badge12 Tích phân & Ứng dụng · #badge10 Bất phương trình · #badge10 Nhị thức Newton],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 Tích phân cơ bản],
    [#text(size: 8.5pt)[Tách $∫_a^b [f(x) - g(x)] d x$; Đổi cận tích phân.]],
    [#text(size: 8.5pt)[Tích phân: Đổi cận thì đổi dấu.]],
    [#text(size: 8.5pt)[🟢 Tính toán vội sai dấu.]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 Diện tích hình phẳng],
    [#text(size: 8.5pt)[$S = ∫_a^b |f(x) - g(x)| d x$. Tính diện tích 1 miền cụ thể.]],
    [#text(size: 8.5pt)[★ Diện tích: Giải pt $f(x)=g(x)$ tìm cận, nhét $| |$ vào trong máy tính Casio.]],
    [#text(size: 8.5pt)[🟡 Diện tích ra âm do quên trị tuyệt đối.]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Tích phân từng phần \ #badge10 *KB 2:* BPT 2 ẩn / Hệ BPT],
    [#text(size: 8.5pt)[*KB 1:* Tính $∫ f(x) e^x d x$ (Từng phần). \ *KB 2:* (Lớp 10) Biểu diễn miền nghiệm hệ BPT bậc nhất 2 ẩn, tìm GTLN/GTNN của hàm mục tiêu $F(x,y)$.]],
    [#text(size: 8.5pt)[★ Từng phần: Đặt $u$ theo thứ tự (Nhất log, nhì đa, tam lượng, tứ mũ). BPT: Tìm tọa độ các đỉnh miền đa giác.]],
    [#text(size: 8.5pt)[🟠 Từng phần sai quy tắc dấu. BPT: Xác định sai miền gạch chéo.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Thể tích vật tròn xoay / Thực tế \ #badge10 *KB 2:* Nhị thức Newton đa thức],
    [#text(size: 8.5pt)[*KB 1:* Quay miền quanh $O x$: $V = π ∫ f^2(x) d x$. Bài thực tế: tính quãng đường $S = ∫ v(t) d t$ với hàm $v(t)$ thay đổi dạng đa thức bậc 3. \ *KB 2:* Tìm hệ số của $x^k$ trong khai triển $(a x + b)^n$.]],
    [#text(size: 8.5pt)[★ Thể tích quay quanh $O y$ (đọc kỹ). Newton: $T_(k+1) = C_n^k a^(n-k) b^k$. Lưu ý khai triển gồm nhiều thành phần.]],
    [#text(size: 8.5pt)[🔴 Quên $π$ trong công thức thể tích. Quên bình phương $[f(x)]^2$. Newton: Quên dấu trừ nếu có $(-b)^k$.]],
  )
)

// ══ CÂU 16: XÁC SUẤT & THỐNG KÊ ══
#ds-block(
  "16",
  "Xác suất & Thống kê — Phân tích dữ liệu & Ra quyết định",
  [#badge12 Thống kê ghép nhóm · #badge12 Bayes · #badge11 Biến ngẫu nhiên · #badge10 Đại số tổ hợp],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 *KB 1:* Bảng ghép nhóm (Trung vị/Tứ phân vị) \ #badge10 *KB 2:* Quy tắc đếm cơ bản],
    [#text(size: 8.5pt)[*KB 1:* Chỉ định nhóm chứa $Q_1, Q_2, Q_3$ bằng tần số tích lũy. Tính độ dài nhóm ghép. \ *KB 2:* Nhận diện dùng Hoán vị ($P_n$), Chỉnh hợp ($A_n^k$) hay Tổ hợp ($C_n^k$). Bài toán đếm số cách xếp chỗ.]],
    [#text(size: 8.5pt)[Tần số tích lũy: Cực kỳ quan trọng để xác định nhóm. Tổ hợp: Chọn không phân biệt thứ tự là $C$.]],
    [#text(size: 8.5pt)[🟢 Nhầm tần số tích lũy với tần số tuyệt đối. Nhầm Chỉnh hợp ($A$) và Tổ hợp ($C$).]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 *KB 1:* Phương sai mẫu ghép nhóm \ #badge11 *KB 2:* Bảng PPXS của biến NN rời rạc],
    [#text(size: 8.5pt)[*KB 1:* Tính trung bình $overline(x)$, sau đó tính phương sai $s^2$. Đánh giá độ phân tán số liệu.]],
    [#text(size: 8.5pt)[★ *KB 1:* Bắt buộc dùng TRUNG ĐIỂM của mỗi nhóm làm đại diện. Dùng Casio 580/880 nhập bảng tần số thống kê.]],
    [#text(size: 8.5pt)[🟡 Lấy sai điểm đại diện nhóm (dùng cận thay vì trung điểm). Quên bình phương ở công thức độ lệch chuẩn.]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Xác suất toàn phần \ #badge11 *KB 2:* Phân phối Nhị thức Bernoulli],
    [#text(size: 8.5pt)[*KB 1:* Bài toán sx 2-3 nhà máy. $P(L) = P(A)P(L|A) + P(B)P(L|B)$. \ *KB 2:* Thực hiện $n$ phép thử độc lập, xs thành công $p$. Tính xs đạt đúng $k$ thành công: $P(X=k) = C_n^k p^k (1-p)^(n-k)$.]],
    [#text(size: 8.5pt)[★ Toàn phần: Vẽ sơ đồ cây rẽ nhánh 2 cấp, nhân theo nhánh, cộng dọc các cành. Nhị thức: Dùng cho bài bắn súng, gieo xúc xắc n lần.]],
    [#text(size: 8.5pt)[🟠 Bernoulli: Quên nhân với $C_n^k$ tổ hợp các vị trí xuất hiện. Toàn phần: Thiết lập thiếu 1 nhánh.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Công thức Bayes \ #badge11 *KB 2:* Phương sai biến NN / Tổ hợp xác suất],
    [#text(size: 8.5pt)[*KB 1:* Hỏi ngược: Biết có lỗi, tính xs do nhà máy A làm? $P(A|L) = (P(A)*P(L|A))/P(L)$. \ *KB 2:* Tính $D(X) = E(X^2) - (E(X))^2$. Hoặc bài bốc bi (tổ hợp XS) qua nhiều hộp liên tiếp.]],
    [#text(size: 8.5pt)[★ Bayes = Tỉ lệ của (1 nhánh cụ thể) trên (tổng tất cả các nhánh đích). Sử dụng luôn kết quả mẫu số $P(L)$ từ câu c.]],
    [#text(size: 8.5pt)[🔴 Nghịch lý Bayes: Kết quả rất nhỏ/lớn so với trực giác. Đừng sợ, nếu vẽ cây đúng thì cứ tự tin điền.]],
  )
)

#v(0.5em)

// ╔════════════════════════════════════════════════════════╗
// ║  PHẦN III — 6 CÂU TRẢ LỜI NGẮN                     ║
// ╚════════════════════════════════════════════════════════╝
#section-header(
  "PHẦN III — TRẢ LỜI NGẮN (6 câu · 3,0 điểm · 0,5 đ/câu · Tự làm — Điền kết quả)",
  "Phân hóa siêu mạnh (0.5đ/câu): Các bài toán ở mức độ Vận Dụng và Vận Dụng Cao, rải rác nhiều chuyên đề",
  red
)

#table(
  columns: (0.5cm, 3.2cm, 4.5cm, 4.6cm, 3.7cm),
  inset: (x: 6pt, y: 7pt),
  align: (center, left, left, left, left),
  stroke: 0.5pt + border,
  fill: (x, y) => if y == 0 { rgb("991b1b") } else if calc.rem(y, 2) == 0 { rgb("fff1f2") } else { white },

  text(fill: white, weight: "bold", size: 8.5pt)[Câu],
  text(fill: white, weight: "bold", size: 8.5pt)[Phạm vi & Dạng toán],
  text(fill: white, weight: "bold", size: 8.5pt)[Các Kịch bản có thể xuất hiện],
  text(fill: white, weight: "bold", size: 8.5pt)[Phương pháp giải cốt lõi],
  text(fill: white, weight: "bold", size: 8.5pt)[Bẫy & Chú ý],

  // ══ C17 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[17]],
  [#badge12 *Tối ưu hóa hình học* \ #badge12 *Tối ưu kinh tế* \ #badge10 *BPT hệ 2 ẩn*],
  [#text(size: 8.5pt)[- Làm hộp, lon sữa (cố định V, min S).\ - Lợi nhuận/Chi phí doanh nghiệp.\ - Tìm max $F(x,y)$ với đk hệ BPT đa giác.]],
  [#text(size: 8.5pt)[*Hàm số:* Đưa về 1 biến $f(x)$, đạo hàm $f'(x)=0$ tìm cực trị. Lập BBT.\ *Lớp 10:* Tính $F(x,y)$ tại các đỉnh đa giác, lấy giá trị lớn nhất.]],
  [#text(size: 8.5pt)[Quên đk $r > 0, h > 0$. Giải pt đạo hàm sai. Điền sai đơn vị (lít vs cm3).]],

  // ══ C18 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[18]],
  [#badge12 *Xác suất Bayes* \ #badge11 *Xác suất cổ điển* \ #badge10 *Tổ hợp số lượng*],
  [#text(size: 8.5pt)[- Tính Bayes y tế (Dương tính/âm tính giả).\ - Rút thẻ/bi từ nhiều hộp phức tạp.\ - Đếm số cách xếp đội hình đan xen.]],
  [#text(size: 8.5pt)[*Bayes:* Vẽ sơ đồ cây 100%. \ *Cổ điển:* Đếm n(A) và n(Ω). \ *Tổ hợp:* Chia giai đoạn, quy tắc nhân. Cẩn thận bài chia nhóm.]],
  [#text(size: 8.5pt)[Xác suất Bayes thường ra số lẻ dài, làm tròn đúng yêu cầu (vd 2 chữ số thập phân). Nhầm tổ hợp và chỉnh hợp.]],

  // ══ C19 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[19]],
  [#badge12 *Oxyz Khoảng cách* \ #badge12 *Mặt cầu* \ #badge11 *KG cổ điển*],
  [#text(size: 8.5pt)[- Tính kc điểm đến mp, góc đường-mp.\ - Bán kính đường tròn thiết diện.\ - Hình chóp/Lăng trụ: Thể tích góc, kc.]],
  [#text(size: 8.5pt)[*Oxyz:* Thuộc công thức $d, cos, sin$. \ *Thiết diện:* Pitago $r^2 = R^2 - d^2$. \ *Cổ điển:* Đổi đỉnh tính khoảng cách, thể tích tỉ lệ (Simpson).]],
  [#text(size: 8.5pt)[Quên lấy căn khi tính $r$. Oxyz hay bị sai dấu vô duyên. Cổ điển: nhầm chiều cao h.]],

  // ══ C20 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[20]],
  [#badge12 *Tích phân thực tế* \ #badge11 *Mũ-Log ứng dụng* \ #badge12 *Diện tích phức*],
  [#text(size: 8.5pt)[- Tính quãng đường ($∫ |v(t)| d t$).\ - Tăng trưởng dân số ($P = P_0 e^(r t)$).\ - Diện tích hình phẳng nhiều hàm cắt nhau.]],
  [#text(size: 8.5pt)[*Vận tốc:* Nếu hàm đổi dấu qua $t_0$, phải tách thành $∫_{t_1}^{t_0} - ∫_{t_0}^{t_2}$. \ *Tăng trưởng:* Logarit hóa tìm $t$. \ *DT:* Vẽ phác đồ thị.]],
  [#text(size: 8.5pt)[Vận tốc âm: quên trị tuyệt đối → kết quả sai lệch. Tăng trưởng: nhầm rate $r$ ra số thập phân.]],

  // ══ C21 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[21]],
  [#badge12 *Thống kê* \ #badge11 *Dãy số - CSN* \ #badge10 *Đại số*],
  [#text(size: 8.5pt)[- Tính Phương sai, CV mẫu ghép nhóm.\ - Tính tổng vô hạn, kỳ hạn trả góp.\ - Parabol, hệ PT ứng dụng.]],
  [#text(size: 8.5pt)[*Thống kê:* Nhập máy tính số trung bình, phương sai $s^2 = overline(x^2) - (overline(x))^2$. \ *Dãy số:* $S_n = u_1 (q^n-1)/(q-1)$.]],
  [#text(size: 8.5pt)[Thống kê: Bắt buộc dùng trung điểm nhóm làm $x_i$, không lấy biên. Dãy số: Sai $n$ (đếm số kỳ).]],

  // ══ C22 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[22]],
  [#badge12 *Vận dụng cao Oxyz* \ #badge12 *Hàm ẩn/PT hàm* \ #badge10 *Cônic nâng cao*],
  [#text(size: 8.5pt)[- Tìm min $M A + M B$ trên mp.\ - Tích phân hàm ẩn $f(x) f'(x) = g(x)$.\ - Bài toán Elip/Parabol radar/cáp treo.]],
  [#text(size: 8.5pt)[*Oxyz:* Dùng phép đối xứng mặt phẳng. $A' = A - 2t vec(n)$.\ *Hàm ẩn:* Tích phân hai vế. \ *Cônic:* Tọa độ hóa đặt gốc O chuẩn.]],
  [#text(size: 8.5pt)[Câu phân loại lấy 9.5-10. Đừng kẹt quá 5 phút. Điền bừa nếu hết giờ (ví dụ số nguyên đẹp).]],
)

#v(1em)

// ╔════════════════════════════════════════════════════════╗
// ║  BẢNG TỔNG KẾT & CHIẾN LƯỢC                         ║
// ╚════════════════════════════════════════════════════════╝
#block(width: 100%, fill: amber, inset: (x: 12pt, y: 9pt), radius: (top: 5pt, bottom: 0pt))[
  #text(size: 11pt, weight: "bold", fill: white)[BẢNG TỔNG KẾT — Cấu trúc bao phủ đa chiều (Lớp 10 / 11 / 12)]
]

#table(
  columns: (0.8cm, 2.3cm, 1.2cm, 1.2cm, 1.2cm, 4.5cm, 3.8cm),
  inset: (x: 6pt, y: 7pt),
  align: (center, left, center, center, center, left, left),
  stroke: 0.5pt + border,
  fill: (x, y) => if y == 0 { rgb("78350f") } else if calc.rem(y, 2) == 0 { rgb("fffbeb") } else { white },

  text(fill: white, weight: "bold", size: 8.5pt)[Câu],
  text(fill: white, weight: "bold", size: 8.5pt)[Lĩnh vực Trọng điểm],
  text(fill: white, weight: "bold", size: 8.5pt)[L10],
  text(fill: white, weight: "bold", size: 8.5pt)[L11],
  text(fill: white, weight: "bold", size: 8.5pt)[L12],
  text(fill: white, weight: "bold", size: 8.5pt)[Các Kịch Bản Cốt Lõi Có Thể Xuất Hiện],
  text(fill: white, weight: "bold", size: 8.5pt)[Mục tiêu Điểm],

  [1–5], [Đại số & Giải tích],
  text(size: 8pt)[Bậc 2\ Parabol], text(size: 8pt)[Mũ-Log\ Dãy số], text(size: 8pt)[Bậc 3\ Phân thức],
  [#text(size: 8pt)[★ BBT, cực trị, Tiệm cận xiên (MỚI), Lãi kép, BPT Logarit]],
  [#text(size: 8pt)[1,25 điểm · Bắt buộc lấy]],

  [6–7], [Tích phân & Conic],
  text(size: 8pt)[★ Cônic], text(size: 8pt)[Lượng giác], text(size: 8pt)[Tích phân],
  [#text(size: 8pt)[★ Diện tích/Thể tích, Elip/Hyperbol (L10 MỚI)]],
  [#text(size: 8pt)[0,5 điểm P.I]],

  [8–9], [Không gian & Oxyz],
  text(size: 8pt)[ĐT mp], text(size: 8pt)[Góc/KC], text(size: 8pt)[★ Oxyz],
  [#text(size: 8pt)[★ PT mặt phẳng, đường thẳng, góc, khoảng cách, mặt cầu]],
  [#text(size: 8pt)[0,5 điểm P.I]],

  [10–12], [TK, XS, Thực tế],
  text(size: 8pt)[Đếm], text(size: 8pt)[Bernoulli], text(size: 8pt)[★ Ghép\ nhóm],
  [#text(size: 8pt)[★ Tứ phân vị, Bayes, XS toàn phần, Nhị thức (L11)]],
  [#text(size: 8pt)[0,75 điểm P.I]],

  [13–16], [4 câu Đ/S Đa năng],
  text(size: 8pt)[Nhị thức\\ BPT], text(size: 8pt)[Mũ-Log], text(size: 8pt)[★ Chủ đạo],
  [#text(size: 8pt)[★ Không fix cứng chương! Trộn Đại số, Hình, TK-XS. Câu c, d phân hóa cực độ (Tiếp tuyến, Bayes, Cực trị Oxyz)]],
  [#text(size: 8pt)[4,0 điểm · Tâm điểm bài thi]],

  [17–22], [6 câu Trả lời ngắn],
  text(size: 8pt)[Hệ PT\ Đa giác], text(size: 8pt)[Lãi kép\ C.số], text(size: 8pt)[★ Chủ đạo],
  [#text(size: 8pt)[★ Có 3 kịch bản cho mỗi câu. Tối ưu thực tế, Bayes nâng cao, Tích phân ẩn, Oxyz cực trị, Phương sai mẫu nhóm.]],
  [#text(size: 8pt)[3,0 điểm · Chọn câu sở trường]],
)

#v(0.8em)

// Box chiến lược cuối
#block(width: 100%, fill: rgb("f0fdf4"), stroke: (left: 4pt + teal, rest: 0.5pt + rgb("bbf7d0")), inset: 12pt, radius: (right: 4pt))[
  #text(fill: teal, weight: "bold", size: 11pt)[📌 CHIẾN LƯỢC TỐI ƯU HÓA 90 PHÚT THEO TỪNG CẤP ĐỘ ĐIỂM MỤC TIÊU]
  #v(0.5em)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 10pt,
    block(fill: white, stroke: 0.5pt + border, inset: 8pt, radius: 3pt)[
      #text(weight: "bold", fill: navy, size: 9.5pt)[Mục tiêu 6.5 - 7.0: (3+3+1)]
      #text(size: 8.5pt)[
        - Hoàn hảo Phần I (3.0đ) trong 10p        
        - Phần II: Chỉ đánh ý a, b (chắc 1.4đ). Đoán c, d theo quy luật (chỉ 1-2 True/False).         
        - Phần III: Chỉ làm câu Dễ (Thống kê / Oxyz cơ bản)         
        - *Chiến thuật: Chậm, chắc, không sai ngu.*
      ]
    ],
    block(fill: white, stroke: 0.5pt + border, inset: 8pt, radius: 3pt)[
      #text(weight: "bold", fill: teal, size: 9.5pt)[Mục tiêu 8.0 - 8.5: (3+4+1.5)]
      #text(size: 8.5pt)[
        - Phần I: 10p tốc độ cao.         
        - Phần II: Làm 3 ý a, b, c của cả 4 câu (khoảng 2.0đ - 3.0đ). Cố gồng 1 ý d quen thuộc.         
        - Phần III: Làm 3-4 câu (Tối ưu hóa, Bayes, Thống kê ghép nhóm).
      ]
    ],
    block(fill: white, stroke: 0.5pt + border, inset: 8pt, radius: 3pt)[
      #text(weight: "bold", fill: red, size: 9.5pt)[Mục tiêu 9+]
      #text(size: 8.5pt)[
        - Phần I: 10p.         
        - Phần II: Quét sạch 4 ý d phân hóa (Cực trị đồ thị, Max-min Oxyz, Bayes khó).         
        - Phần III: Xử lý Tích phân hàm ẩn và Hệ PT/Conic Lớp 10.         
        - *Bẫy: Tỉnh táo đơn vị và điều kiện đầu mút.*
      ]
    ],
  )
]
