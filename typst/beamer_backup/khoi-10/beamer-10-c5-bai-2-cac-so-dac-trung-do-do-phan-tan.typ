#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Các Số Đặc Trưng Đo Độ Phân Tán],
  subtitle: [TOÁN 10 — CHƯƠNG V: KHOẢNG BIẾN THIÊN, KHOẢNG TỨ PHÂN VỊ, PHƯƠNG SAI & ĐỘ LỆCH CHUẨN],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI HỌC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: TẠI SAO CẦN ĐO ĐỘ PHÂN TÁN?
// ════════════════════════════════════════════════
#lt-section-link("sec-y-nghia-do-phan-tan", "🎯", [I. Ý Nghĩa & Nhu Cầu Đo Độ Phân Tán])

#lt-slide-back(title: "🎯 Tại Sao Chỉ Biết Số Trung Bình Là Chưa Đủ?")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-example(title: "Bài toán chọn xạ thủ Olympic")[
        Hai xạ thủ $A$ và $B$ bắn 5 viên đạn với số điểm:
        - Xạ thủ $A$: $8, 9, 8, 9, 8.5 => overline(x)_A = 8.5$
        - Xạ thủ $B$: $10, 7, 10, 7, 8.5 => overline(x)_B = 8.5$
        #v(0.2em)
        *Ai có phong độ ổn định hơn để cử đi thi?*
        Dù điểm trung bình bằng nhau, xạ thủ $A$ có các phát bắn co cụm rất gần $8.5$, trong khi xạ thủ $B$ phân tán thất thường!
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[💡 Định Nghĩa Độ Phân Tán]
        #v(0.2em)
        #text(size: 9.5pt)[
          *Độ phân tán* là đại lượng đo lường mức độ phân tán hay co cụm của các số liệu xung quanh giá trị trung tâm.
          - Độ phân tán nhỏ $=>$ Dữ liệu đồng đều, độ ổn định cao, rủi ro thấp.
          - Độ phân tán lớn $=>$ Dữ liệu tản mác, độ ổn định kém, rủi ro cao.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: KHOẢNG BIẾN THIÊN & KHOẢNG TỨ PHÂN VỊ
// ════════════════════════════════════════════════
#lt-section-link("sec-khoang-bien-thien-tu-phan-vi", "📏", [II. Khoảng Biến Thiên & Khoảng Tứ Phân Vị])

#lt-slide-back(title: "📏 Khoảng Biến Thiên & Khoảng Tứ Phân Vị")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "1. Khoảng biến thiên (Range - R)")[
        $ R = x_(max) - x_(min) $
        Là hiệu số giữa giá trị lớn nhất và nhỏ nhất của mẫu số liệu.
        - *Ưu điểm:* Cực kì dễ tính, trực quan.
        - *Nhược điểm:* Bị chi phối hoàn toàn bởi 2 giá trị cực đoan, không phản ánh độ phân tán của phần còn lại.
      ]
    ],
    [
      #lt-definition(title: "2. Khoảng tứ phân vị (IQR - Delta Q)")[
        $ Delta_Q = Q_3 - Q_1 $
        Là hiệu số giữa tứ phân vị thứ ba và tứ phân vị thứ nhất.
        - Đo độ biến thiên của *50% số liệu chính giữa*.
        - *Ưu điểm lớn:* Không bị ảnh hưởng bởi các giá trị bất thường ngoại lệ!
      ]
    ]
  )
]

#lt-slide-back(title: "🔍 Giá Trị Bất Thường (Outlier) & Biểu Đồ Hộp")[
  #lt-theorem(title: "Tiêu chuẩn xác định giá trị bất thường (Tukey)")[
    Một giá trị $x$ trong mẫu số liệu được coi là *giá trị bất thường (outlier)* nếu:
    $ x < Q_1 - 1.5 Delta_Q quad "hoặc" quad x > Q_3 + 1.5 Delta_Q $
  ]
  #v(0.2em)
  #align(center)[
    #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
      #text(weight: "bold", fill: rgb("#1e3a8a"), size: 10.5pt)[Biểu Đồ Hộp (Box Plot) Tóm Tắt 5 Số Đặc Trưng]
      #v(0.3em)
      #cetz.canvas({
        import cetz.draw: *
        // Trục số
        line((0, 0), (7, 0), mark: (end: "stealth", fill: rgb("#64748b")), stroke: 1.5pt + rgb("#64748b"))

        // Hộp [Q1, Q3]
        rect((1.8, -0.4), (5.2, 0.4), fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"))

        // Trung vị Q2
        line((3.2, -0.4), (3.2, 0.4), stroke: 2pt + rgb("#d81b60"))

        // Râu whiskers
        line((0.8, 0), (1.8, 0), stroke: 1.2pt + rgb("#2563eb"))
        line((0.8, -0.2), (0.8, 0.2), stroke: 1.5pt + rgb("#2563eb"))

        line((5.2, 0), (6.2, 0), stroke: 1.2pt + rgb("#2563eb"))
        line((6.2, -0.2), (6.2, 0.2), stroke: 1.5pt + rgb("#2563eb"))

        // Chú thích
        content((0.8, -0.45), text(size: 8.5pt, weight: "bold")[$x_(min)$])
        content((1.8, 0.65), text(size: 8.5pt, fill: rgb("#2563eb"), weight: "bold")[$Q_1$])
        content((3.2, 0.65), text(size: 8.5pt, fill: rgb("#d81b60"), weight: "bold")[$Q_2 (M_e)$])
        content((5.2, 0.65), text(size: 8.5pt, fill: rgb("#2563eb"), weight: "bold")[$Q_3$])
        content((6.2, -0.45), text(size: 8.5pt, weight: "bold")[$x_(max)$])
        content((3.5, -0.7), text(size: 9pt, fill: rgb("#2563eb"), weight: "bold")[$Delta_Q = Q_3 - Q_1$])
      })
    ]
  ]
]

// ════════════════════════════════════════════════
// PHẦN III: PHƯƠNG SAI & ĐỘ LỆCH CHUẨN
// ════════════════════════════════════════════════
#lt-section-link("sec-phuong-sai-do-lech-chuan", "⚡", [III. Phương Sai & Độ Lệch Chuẩn])

#lt-slide-back(title: "⚡ Công Thức Phương Sai & Độ Lệch Chuẩn")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Phương sai (Variance - s^2)")[
        Cho mẫu $x_1, x_2, ..., x_n$ có số trung bình $overline(x)$:
        $ s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2 $
        Công thức tính nhanh:
        $ s^2 = 1/n sum_(i=1)^n x_i^2 - (overline(x))^2 $
      ]
      #v(0.2em)
      #lt-important(title: "Độ lệch chuẩn (Standard Deviation - s)")[
        $ s = sqrt(s^2) $
        Cùng đơn vị đo với mẫu dữ liệu ban đầu!
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[💡 Ý Nghĩa Khoa Học Của s]
        #v(0.2em)
        #text(size: 9.5pt)[
          - Độ lệch chuẩn $s$ là thước đo mức độ dao động trung bình của mỗi cá thể quanh giá trị trung bình $overline(x)$.
          - *Trong quản trị Six Sigma (Motorola/TSMC):* Tỉ lệ sai hỏng $< 3.4$ lỗi trên $1$ triệu sản phẩm.
          - *Trong tài chính chứng khoán:* Độ lệch chuẩn $s$ đo lường *mức độ rủi ro (Volatility)* của danh mục đầu tư!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM CHỌN 1 ĐÁP ÁN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "✍️", [IV. Luyện tập: Trắc nghiệm 4 phương án])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN],
  questions: (
    (num: 1, type: "TN", desc: [Khoảng Biến Thiên R]),
    (num: 2, type: "TN", desc: [Khoảng Tứ Phân Vị IQR]),
    (num: 3, type: "TN", desc: [Xác Định Giá Trị Ngoại Lệ]),
    (num: 4, type: "TN", desc: [Tính Phương Sai]),
    (num: 5, type: "TN", desc: [So Sánh Độ Ổn Định]),
    (num: 6, type: "TN", desc: [Mối Quan Hệ Giữa s và s^2]),
    (num: 7, type: "DS", desc: [Đúng/Sai Đo Độ Phân Tán]),
    (num: 8, type: "TLN", desc: [Tính Khoảng Tứ Phân Vị]),
    (num: 9, type: "TLN", desc: [Độ Lệch Chuẩn Số Nguyên Đẹp]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho mẫu số liệu về điểm thi của một học sinh: $4, 6, 7, 8, 9, 10$. Khoảng biến thiên $R$ của mẫu số liệu trên bằng:],
  (
    [$4$],
    [$5$],
    [$6$],
    [$10$],
  ),
  correct: 3,
  num: 1,
  de: "Đề 14A — Khoảng Biến Thiên R",
  loigiai: [
    Giá trị lớn nhất: $x_(max) = 10$.\
    Giá trị nhỏ nhất: $x_(min) = 4$.\
    Khoảng biến thiên: $R = x_(max) - x_(min) = 10 - 4 = 6$. Chọn đáp án *C: 6*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu đã sắp xếp: $2, 4, 5, 7, 8, 10, 11, 15$. Khoảng tứ phân vị $Delta_Q$ của mẫu số liệu bằng:],
  (
    [$5.5$],
    [$6.0$],
    [$6.5$],
    [$13$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 14A — Khoảng Tứ Phân Vị IQR",
  loigiai: [
    Cỡ mẫu $n = 8$ (chẵn). $Q_2 = (7 + 8)/2 = 7.5$.\
    Nửa dưới: $2, 4, 5, 7 => Q_1 = (4 + 5)/2 = 4.5$.\
    Nửa trên: $8, 10, 11, 15 => Q_3 = (10 + 11)/2 = 10.5$.\
    Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 10.5 - 4.5 = 6.0$. Chọn đáp án *B: 6.0*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu có $Q_1 = 12$ và $Q_3 = 20$. Theo tiêu chuẩn Tukey, giá trị nào sau đây được coi là một giá trị bất thường (outlier)?],
  (
    [$5$],
    [$-1$],
    [$30$],
    [$31$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 14B — Xác Định Giá Trị Ngoại Lệ",
  loigiai: [
    Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 20 - 12 = 8$.\
    Ngưỡng dưới: $Q_1 - 1.5 Delta_Q = 12 - 1.5(8) = 12 - 12 = 0$.\
    Ngưỡng trên: $Q_3 + 1.5 Delta_Q = 20 + 1.5(8) = 20 + 12 = 32$.\
    Giá trị bất thường là các số $< 0$ hoặc $> 32$. Trong 4 phương án, chỉ có $-1 < 0$. Chọn *B*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu: $2, 4, 6, 8, 10$. Phương sai $s^2$ của mẫu số liệu trên bằng:],
  (
    [$6$],
    [$8$],
    [$4$],
    [$10$],
  ),
  correct: 2,
  num: 4,
  de: "Đề 14B — Tính Phương Sai",
  loigiai: [
    Số trung bình: $overline(x) = (2 + 4 + 6 + 8 + 10) / 5 = 30 / 5 = 6$.\
    Các độ lệch bình phương: $(2-6)^2 = 16, (4-6)^2 = 4, (6-6)^2 = 0, (8-6)^2 = 4, (10-6)^2 = 16$.\
    Phương sai: $s^2 = (16 + 4 + 0 + 4 + 16) / 5 = 40 / 5 = 8$. Chọn đáp án *B: 8*.
  ]
)

#lt-tn(
  [Hai lớp 10A và 10B có cùng điểm trung bình kiểm tra môn Toán là $overline(x) = 7.5$. Lớp 10A có độ lệch chuẩn $s_A = 0.6$, lớp 10B có độ lệch chuẩn $s_B = 1.4$. Khẳng định nào sau đây đúng?],
  (
    [Lớp 10B có kết quả học tập đồng đều hơn lớp 10A.],
    [Lớp 10A có kết quả học tập đồng đều hơn lớp 10B.],
    [Hai lớp có kết quả học tập phân tán như nhau.],
    [Không đủ thông tin để so sánh độ phân tán.],
  ),
  correct: 2,
  num: 5,
  de: "Đề 14C — So Sánh Độ Ổn Định",
  loigiai: [
    Độ lệch chuẩn $s$ phản ánh mức độ phân tán của dữ liệu quanh số trung bình.\
    Vì $s_A = 0.6 < s_B = 1.4$ nên điểm số lớp 10A ít biến thiên hơn, phân bố co cụm hơn $=>$ Lớp 10A đồng đều hơn. Chọn *B*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu kích thước $n$ có phương sai bằng $s^2 = 16$. Khi đó độ lệch chuẩn $s$ của mẫu số liệu bằng:],
  (
    [$4$],
    [$8$],
    [$256$],
    [$2$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 14C — Mối Quan Hệ Giữa s và s^2",
  loigiai: [
    Theo định nghĩa, độ lệch chuẩn là căn bậc hai số học của phương sai:\
    $s = sqrt(s^2) = sqrt(16) = 4$.\
    Chọn đáp án *A: 4*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho mẫu số liệu về nhiệt độ (°C) ghi nhận trong 7 ngày: $25, 26, 26, 28, 29, 31, 35$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Khoảng biến thiên của mẫu số liệu là $R = 10$.], "true": true),
    (body: [Tứ phân vị thứ nhất và thứ ba lần lượt là $Q_1 = 26$ và $Q_3 = 31$.], "true": true),
    (body: [Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 5$.], "true": true),
    (body: [Giá trị $35$ là một giá trị bất thường (outlier) của mẫu số liệu.], "true": false),
  ),
  de: "Đề 14D — Đúng/Sai Đo Độ Phân Tán",
  num: 7,
  loigiai: [
    - a) *Đ:* $R = 35 - 25 = 10$.
    - b) *Đ:* $n = 7$, $Q_2 = 28$. Nửa dưới là $25, 26, 26 => Q_1 = 26$. Nửa trên là $29, 31, 35 => Q_3 = 31$.
    - c) *Đ:* $Delta_Q = Q_3 - Q_1 = 31 - 26 = 5$.
    - d) *S:* Ngưỡng trên là $Q_3 + 1.5 Delta_Q = 31 + 1.5(5) = 38.5$. Do $35 < 38.5$ nên $35$ không phải outlier.
  ]
)

#lt-tln(
  [Cho mẫu số liệu: $10, 12, 14, 15, 18, 20, 22, 25$. Khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$ của mẫu số liệu trên bằng bao nhiêu?],
  [8],
  num: 8,
  de: "Đề 14E — Tính Khoảng Tứ Phân Vị",
  loigiai: [
    Cỡ mẫu $n = 8$ (chẵn). $Q_2 = (15 + 18)/2 = 16.5$.\
    Nửa dưới: $10, 12, 14, 15 => Q_1 = (12 + 14)/2 = 13$.\
    Nửa trên: $18, 20, 22, 25 => Q_3 = (20 + 22)/2 = 21$.\
    Khoảng tứ phân vị: $Delta_Q = 21 - 13 = 8$. Đáp số: *$8$*.
  ]
)

#lt-tln(
  [Cho mẫu số liệu gồm 5 giá trị: $2, 4, 5, 6, 8$. Độ lệch chuẩn $s$ của mẫu số liệu trên bằng bao nhiêu?],
  [2],
  num: 9,
  de: "Đề 14F — Độ Lệch Chuẩn Số Nguyên Đẹp",
  loigiai: [
    Số trung bình: $overline(x) = (2 + 4 + 5 + 6 + 8) / 5 = 25 / 5 = 5$.\
    Tổng bình phương sai số: $(2-5)^2 + (4-5)^2 + (5-5)^2 + (6-5)^2 + (8-5)^2 = 9 + 1 + 0 + 1 + 9 = 20$.\
    Phương sai: $s^2 = 20 / 5 = 4$.\
    Độ lệch chuẩn: $s = sqrt(4) = 2$. Đáp số: *$2$*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c5-b2", "💎", [VI. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Kiến Thức Đo Độ Phân Tán")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. KHOẢNG BIẾN THIÊN]
        #v(0.2em)
        #text(size: 10pt)[
          - $R = x_(max) - x_(min)$.
          - Đơn giản, trực quan.
          - Dễ bị kéo lệch bởi cực trị.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. KHOẢNG TỨ PHÂN VỊ]
        #v(0.2em)
        #text(size: 10pt)[
          - $Delta_Q = Q_3 - Q_1$.
          - Độ phân tán 50% ở giữa.
          - Bền bỉ trước các ngoại lệ.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. OUTLIER (Tukey)]
        #v(0.2em)
        #text(size: 10pt)[
          - $< Q_1 - 1.5 Delta_Q$ hoặc
          - $> Q_3 + 1.5 Delta_Q$.
          - Minh họa bằng Box Plot.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. PHƯƠNG SAI s^2]
        #v(0.2em)
        #text(size: 10pt)[
          - $s^2 = 1/n sum (x_i - overline(x))^2$.
          - Tính nhanh: $overline(x^2) - (overline(x))^2$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. ĐỘ LỆCH CHUẨN s]
        #v(0.2em)
        #text(size: 10pt)[
          - $s = sqrt(s^2)$.
          - Cùng đơn vị với dữ liệu.
          - $s$ bé $=>$, dữ liệu ổn định.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. BƯỚC ĐỆM TIẾP THEO]
        #v(0.2em)
        #text(size: 10pt)[
          - Bài tập cuối chương V: Tổng ôn toàn bộ thống kê mô tả không ghép nhóm!
        ]
      ]
    ]
  )
]

#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 28pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 2 — CHƯƠNG V!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Độ lệch chuẩn là tấm khiên vững chắc giúp nhân loại kiểm soát rủi ro trong kỷ nguyên số."\
        Chuẩn bị tổng kết cùng #text(fill: rgb("#fde047"), weight: "bold")[Bài tập Cuối Chương V]!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 13pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
