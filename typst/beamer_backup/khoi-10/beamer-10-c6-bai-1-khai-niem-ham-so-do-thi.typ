#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Khái Niệm Hàm Số & Đồ Thị],
  subtitle: [TOÁN 10 — CHƯƠNG VI: ĐỊNH NGHĨA, TẬP XÁC ĐỊNH, ĐỒ THỊ & SỰ BIẾN THIÊN],
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
// PHẦN I: KHÁI NIỆM HÀM SỐ & TẬP XÁC ĐỊNH
// ════════════════════════════════════════════════
#lt-section-link("sec-khai-niem-ham-so", "🎯", [I. Khái Niệm Hàm Số & Tập Xác Định])

#lt-slide-back(title: "🎯 Bước Chuyển Từ Tĩnh Học Sang Động Học")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Từ thế giới tĩnh đến dòng chảy biến thiên")[
        - Hình học Euclid cổ điển nghiên cứu các hình khối tĩnh và bất biến.
        - Tự nhiên luôn vận động: quả táo rơi, dân số tăng, nhiệt độ thay đổi.
        - *Hàm số* là cầu nối mô tả quy luật biến thiên phụ thuộc lẫn nhau.
      ]
      #v(0.15em)
      #lt-tip(title: "Ý nghĩa")[
        Hàm số là cỗ máy: nhận đầu vào $x$ (nguyên nhân), sinh ra duy nhất một đầu ra $y = f(x)$ (kết quả).
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 7pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[📜 Euler & Ký Hiệu f(x) (1734)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Thuật ngữ *Function* xuất hiện từ năm 1692 bởi *Gottfried Leibniz*.
          - Năm 1734, *Leonhard Euler* chính thức đưa ra ký hiệu tao nhã $f(x)$.
          - Euler giải phóng toán học khỏi mô tả văn xuôi cồng kềnh, trở thành cú pháp *hàm số đầu tiên*, làm nền tảng cho mọi ngôn ngữ lập trình (`Python`, `C++`, `JS`)!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Định Nghĩa Hàm Số & Tập Xác Định")[
  #lt-definition(title: "Định nghĩa chính xác hàm số")[
    Giả sử $D$ là một tập hợp con khác rỗng của $RR$.
    Một *hàm số* $f$ xác định trên $D$ là một quy tắc cho tương ứng mỗi số $x in D$ với *một và chỉ một* số thực $y$.
    - $x$ gọi là *biến số* (độc lập), $y$ gọi là *hàm số* của $x$.
    - Tập $D$ gọi là *tập xác định* (TXĐ).
    - Tập tất cả các giá trị $y = f(x)$ với $x in D$ gọi là *tập giá trị* (kí hiệu $T$ hoặc $f(D)$).
  ]
  #v(0.3em)
  #lt-important(title: "Ba điều kiện xác định cơ bản cần ghi nhớ")[
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 8pt,
      [#align(center)[$1 / (P(x)) <=> P(x) != 0$]],
      [#align(center)[$sqrt(P(x)) <=> P(x) >= 0$]],
      [#align(center)[$1 / sqrt(P(x)) <=> P(x) > 0$]]
    )
  ]
]

#lt-slide-back(title: "📋 Các Cách Cho Một Hàm Số")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-theorem(title: "Ba hình thức biểu diễn hàm số")[
        1. *Bằng công thức giải tích:*
           - Một công thức: $y = 2x - 3$, $y = sqrt(x + 1)$.
           - Nhiều công thức (phân đoạn):
           $ f(x) = cases(2x + 1 quad &"khi" x >= 0, -x^2 &"khi" x < 0) $
        2. *Bằng bảng số liệu:* Phổ biến trong thực nghiệm, thống kê, bảng điểm.
        3. *Bằng biểu đồ / đồ thị:* Minh họa trực quan xu hướng biến thiên.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"))[Ví dụ: Hàm phân đoạn cước taxi]\
        #text(size: 9.5pt)[
          Giá mở cửa $1$ km đầu là $10.000$ đ. Mỗi km tiếp theo giá $14.000$ đ.
          Số tiền $C(x)$ (nghìn đồng) theo quãng đường $x$ (km):
          $ C(x) = cases(
            10 &"nếu" 0 < x <= 1,
            10 + 14(x - 1) &"nếu" x > 1
          ) $
          Khi đi $5$ km: $C(5) = 10 + 14(4) = 66$ nghìn đồng.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ĐỒ THỊ & SỰ BIẾN THIÊN
// ════════════════════════════════════════════════
#lt-section-link("sec-do-thi-bien-thien", "📈", [II. Đồ Thị & Sự Biến Thiên])

#lt-slide-back(title: "📈 Đồ Thị Của Hàm Số")[
  #lt-two-col(
    ratio: (56%, 44%),
    [
      #lt-definition(title: "Đồ thị hàm số trong mặt phẳng Oxy")[
        Đồ thị của hàm số $y = f(x)$ xác định trên tập $D$ là tập hợp tất cả các điểm $M(x; f(x))$ trên mặt phẳng tọa độ $O x y$:
        $ (C) = { M(x; y) in RR^2 : x in D, y = f(x) } $
      ]
      #v(0.2em)
      #lt-important(title: "Tiêu chuẩn đường thẳng đứng (Vertical Line Test)")[
        Một đường cong trên mặt phẳng $O x y$ là đồ thị của một hàm số $y = f(x)$ khi và chỉ khi *mọi đường thẳng đứng* $x = x_0$ cắt đường cong tại *tối đa một điểm*!
      ]
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Hệ trục tọa độ
          line((-2.2, 0), (2.5, 0), stroke: 1pt + rgb("#64748b"), mark: (end: "stealth"))
          line((0, -1.2), (0, 2.6), stroke: 1pt + rgb("#64748b"), mark: (end: "stealth"))
          content((2.5, -0.25), text(size: 8pt, fill: rgb("#334155"))[$x$])
          content((-0.25, 2.5), text(size: 8pt, fill: rgb("#334155"))[$y$])
          content((-0.2, -0.2), text(size: 8pt, fill: rgb("#334155"))[$O$])

          // Đường cong hàm số minh họa y = 0.5 x^3 - x + 1
          bezier((-1.8, -0.8), (2.0, 2.2), (-0.8, 1.8), (0.8, -0.2), stroke: 1.8pt + rgb("#d81b60"))
          content((1.8, 1.6), text(size: 8.5pt, weight: "bold", fill: rgb("#d81b60"))[$y = f(x)$])

          // Điểm M(x0, y0)
          let x0 = 1.2
          let y0 = 0.95
          line((x0, 0), (x0, y0), stroke: 1pt + rgb("#94a3b8"), dash: "dashed")
          line((0, y0), (x0, y0), stroke: 1pt + rgb("#94a3b8"), dash: "dashed")
          circle((x0, y0), radius: 0.08, fill: rgb("#2563eb"), stroke: 1pt + white)
          content((x0, -0.25), text(size: 7.5pt, fill: rgb("#1e3a8a"))[$x_0$])
          content((-0.35, y0), text(size: 7.5pt, fill: rgb("#1e3a8a"))[$f(x_0)$])
          content((x0 + 0.35, y0 + 0.2), text(size: 8pt, weight: "bold", fill: rgb("#1e3a8a"))[$M$])
        })
      ]
    ]
  )
]

#lt-slide-back(title: "🚀 Sự Biến Thiên: Đồng Biến & Nghịch Biến")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Đồng biến & Nghịch biến")[
        Cho hàm số $y = f(x)$ trên khoảng $(a; b)$:
        - *Đồng biến (tăng)* trên $(a; b)$:
          $forall x_1 < x_2 => f(x_1) < f(x_2)$
          $arrow.tr$ *Đồ thị đi lên từ trái sang phải.*
        - *Nghịch biến (giảm)* trên $(a; b)$:
          $forall x_1 < x_2 => f(x_1) > f(x_2)$
          $arrow.br$ *Đồ thị đi xuống từ trái sang phải.*
      ]
    ],
    [
      #lt-tip(title: "Tỉ số biến thiên")[
        Với $x_1 != x_2 in (a; b)$, xét tỉ số:
        $ T = (f(x_2) - f(x_1)) / (x_2 - x_1) $
        - $T > 0$: hàm số *đồng biến*.
        - $T < 0$: hàm số *nghịch biến*.
      ]
      #v(0.15em)
      #lt-important(title: "Quy ước")[
        Khoảng biến thiên luôn ghi theo $x$, không ghi theo $y$!
      ]
    ]
  )
]

#lt-slide-back(title: "📊 Bảng Biến Thiên & Ứng Dụng Trong AI")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Bảng biến thiên (BBT)")[
        Bảng biến thiên tóm tắt sự thay đổi của hàm số:
        - Hàng 1: Dòng giá trị của biến số $x$.
        - Hàng 2: Chiều mũi tên biến thiên của $y$:
          + Mũi tên đi lên ($arrow.tr$): Khoảng đồng biến.
          + Mũi tên đi xuống ($arrow.br$): Khoảng nghịch biến.
      ]
      #v(0.2em)
      #lt-important(title: "Lưu ý")[
        Khoảng đồng biến / nghịch biến luôn ghi theo biến số $x$, không ghi theo $y$!
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 11pt)[🤖 Hàm Kích Hoạt Trong AI (ReLU)]\
        #v(0.2em)
        #text(size: 9pt)[
          Trong mạng nơ-ron Deep Learning, hàm kích hoạt phổ biến nhất là *ReLU* (Rectified Linear Unit):
          $ f(x) = max(0, x) = cases(x quad &"nếu" x >= 0, 0 &"nếu" x < 0) $
          - Đồng biến trên khoảng $[0; +infinity)$.
          - Không đổi (bằng $0$) trên $(-infinity; 0)$.
          Chính sự phi tuyến đơn giản này cho phép AI học được các đặc trưng thị giác cực kỳ phức tạp!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM (4 PHƯƠNG ÁN)
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Trắc nghiệm 4 phương án])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VI BÀI 1],
  questions: (
    (num: 1, type: "TN", desc: [TXĐ phân thức bậc nhất]),
    (num: 2, type: "TN", desc: [TXĐ chứa căn & mẫu số]),
    (num: 3, type: "TN", desc: [Hàm phân đoạn nhiều công thức]),
    (num: 4, type: "TN", desc: [Đọc khoảng biến thiên từ BBT]),
    (num: 5, type: "TN", desc: [Tính đơn điệu hàm bậc nhất]),
    (num: 6, type: "TN", desc: [Mô hình thực tế cước taxi]),
    (num: 7, type: "DS", desc: [Đúng/Sai khảo sát hàm số]),
    (num: 8, type: "TLN", desc: [Tìm m để hàm số xác định]),
    (num: 9, type: "TLN", desc: [Điểm hòa vốn xưởng may]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tập xác định $D$ của hàm số $y = (2x + 1) / (x - 3)$ là:],
  (
    [$D = RR \\ {3}$],
    [$D = (3; +infinity)$],
    [$D = RR \\ {-1/2}$],
    [$D = RR$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 15A — Tập Xác Định Hàm Phân Thức Bậc Nhất",
  loigiai: [
    Hàm số phân thức xác định khi và chỉ khi mẫu số khác $0$:\
    $x - 3 != 0 <=> x != 3$.\
    Vậy tập xác định là $D = RR \\ {3}$.\
    Chọn đáp án *A: $D = RR \\ {3}$*.
  ]
)

#lt-tn(
  [Tập xác định của hàm số $y = sqrt(4 - 2x) + 1 / (x + 1)$ là:],
  (
    [$D = [2; +infinity) \\ {-1}$],
    [$D = (-infinity; 2] \\ {-1}$],
    [$D = (-infinity; 2)$],
    [$D = [-1; 2]$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 15B — Tập Xác Định Chứa Căn & Mẫu",
  loigiai: [
    Điều kiện: $4 - 2x >= 0 <=> x <= 2$ và $x + 1 != 0 <=> x != -1$.\
    Kết hợp lại ta được: $D = (-infinity; 2] \\ {-1}$.\
    Chọn đáp án *B: $D = (-infinity; 2] \\ {-1}$*.
  ]
)

#lt-tn(
  [Cho hàm số phân đoạn $f(x) = cases(2x - 1 quad &"khi" x >= 1, 3 - x^2 &"khi" x < 1)$. Giá trị biểu thức $P = f(2) + f(-1)$ bằng:],
  (
    [$P = 4$],
    [$P = 5$],
    [$P = 6$],
    [$P = 2$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 15C — Giá Trị Của Hàm Số Cho Bởi Nhiều Công Thức",
  loigiai: [
    - Với $x = 2 >= 1$, ta dùng nhánh trên: $f(2) = 2(2) - 1 = 3$.\
    - Với $x = -1 < 1$, ta dùng nhánh dưới: $f(-1) = 3 - (-1)^2 = 3 - 1 = 2$.\
    - Do đó: $P = f(2) + f(-1) = 3 + 2 = 5$.\
    Chọn đáp án *B: $P = 5$*.
  ]
)

#lt-tn(
  [Cho hàm số $y = f(x)$ có bảng biến thiên: $x$ tăng từ $-infinity$ đến $1$ thì $f(x)$ giảm từ $+infinity$ xuống $-2$; $x$ tăng từ $1$ đến $+infinity$ thì $f(x)$ tăng từ $-2$ lên $+infinity$. Khẳng định nào sau đây đúng?],
  (
    [Hàm số nghịch biến trên $(-infinity; 1)$ và đồng biến trên $(1; +infinity)$.],
    [Hàm số đồng biến trên toàn bộ $RR$.],
    [Hàm số đồng biến trên $(-infinity; 1)$.],
    [Hàm số nghịch biến trên $(-2; +infinity)$.],
  ),
  correct: 1,
  num: 4,
  de: "Đề 15D — Đọc Khoảng Đồng Biến & Nghịch Biến",
  loigiai: [
    Căn cứ vào chiều mũi tên trên bảng biến thiên:\
    - Trên khoảng $(-infinity; 1)$, mũi tên đi xuống $=>$ hàm số nghịch biến.\
    - Trên khoảng $(1; +infinity)$, mũi tên đi lên $=>$ hàm số đồng biến.\
    Chọn đáp án *A*.
  ]
)

#lt-tn(
  [Trong các hàm số sau đây, hàm số nào đồng biến trên khoảng $(-infinity; +infinity)$?],
  (
    [$y = -3x + 5$],
    [$y = 2x - 7$],
    [$y = -x^2 + 1$],
    [$y = (x + 1)/(x - 2)$],
  ),
  correct: 2,
  num: 5,
  de: "Đề 15E — Tính Đơn Điệu Của Hàm Số",
  loigiai: [
    Hàm số bậc nhất $y = a x + b$ đồng biến trên $RR <=> a > 0$.\
    - Đáp án B có $a = 2 > 0$ nên đồng biến trên $(-infinity; +infinity)$.\
    - Đáp án A có $a = -3 < 0$ nên nghịch biến trên $RR$.\
    Chọn đáp án *B: $y = 2x - 7$*.
  ]
)

#lt-tn(
  [Một hãng taxi tính cước: Giá mở cửa $1$ km đầu là $12.000$ đ; mỗi km tiếp theo giá $15.000$ đ. Công thức tính tiền cước $T(x)$ (nghìn đồng) khi đi $x$ km ($x > 1$) là:],
  (
    [$T(x) = 15x - 3$],
    [$T(x) = 15x + 12$],
    [$T(x) = 12x + 15$],
    [$T(x) = 15x - 15$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 15F — Mô Hình Hóa Bài Toán Cước Taxi",
  loigiai: [
    Quãng đường $x > 1$ km gồm $1$ km đầu giá $12$ nghìn và $(x - 1)$ km sau giá $15$ nghìn:\
    $T(x) = 12 + 15(x - 1) = 15x - 3$ (nghìn đồng).\
    Chọn đáp án *A: $T(x) = 15x - 3$*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [IV. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho hàm số $y = f(x) = (sqrt(x + 2)) / (x - 1)$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Điều kiện xác định của hàm số là $x >= -2$ và $x != 1$.], "true": true),
    (body: [Tập xác định của hàm số là $D = [-2; +infinity) \\ {1}$.], "true": true),
    (body: [Điểm $M(2; 2)$ thuộc đồ thị của hàm số.], "true": true),
    (body: [Hàm số xác định tại điểm $x = -3$.], "true": false),
  ),
  de: "Đề 15G — Đúng/Sai Toàn Diện Về Hàm Số",
  num: 7,
  loigiai: [
    - a) *Đ:* Biểu thức trong căn $x + 2 >= 0 <=> x >= -2$ và mẫu $x - 1 != 0 <=> x != 1$.
    - b) *Đ:* Tập xác định là $D = [-2; +infinity) \\ {1}$.
    - c) *Đ:* Thay $x = 2$ vào hàm số: $f(2) = (sqrt(2 + 2)) / (2 - 1) = sqrt(4)/1 = 2$. Vậy $M(2; 2)$ thuộc đồ thị.
    - d) *S:* Tại $x = -3$, biểu thức dưới căn là $-3 + 2 = -1 < 0$ nên hàm số không xác định tại $x = -3$.
  ]
)

#lt-tln(
  [Tìm số giá trị nguyên của tham số $m$ thuộc đoạn $[-5; 5]$ để hàm số $y = sqrt(x - m + 1)$ xác định trên khoảng $(2; +infinity)$.],
  [9],
  num: 8,
  de: "Đề 15H — Tìm Tham Số m Để Hàm Số Xác Định",
  loigiai: [
    Hàm số xác định khi $x - m + 1 >= 0 <=> x >= m - 1$.\
    Tập xác định của hàm số là $D = [m - 1; +infinity)$.\
    Để hàm số xác định trên $(2; +infinity)$ thì $(2; +infinity) subset [m - 1; +infinity)$,\
    điều này xảy ra khi và chỉ khi: $m - 1 <= 2 <=> m <= 3$.\
    Vì $m in ZZ$ và $m in [-5; 5]$, nên $m in {-5, -4, -3, -2, -1, 0, 1, 2, 3}$.\
    Số giá trị nguyên của $m$ là: $3 - (-5) + 1 = 9$.\
    Đáp số: *$9$*.
  ]
)

#lt-tln(
  [Một xưởng sản xuất khẩu trang có chi phí cố định là $5.000$ nghìn đồng/ngày và chi phí nguyên liệu cho mỗi hộp là $20$ nghìn đồng. Xưởng bán ra với giá $45$ nghìn đồng/hộp. Để hòa vốn (lợi nhuận bằng $0$), xưởng cần bán được ít nhất bao nhiêu hộp khẩu trang trong ngày?],
  [200],
  num: 9,
  de: "Đề 15K — Điểm Hòa Vốn Mô Hình Hàm Doanh Thu",
  loigiai: [
    Gọi $x$ ($x in NN^*$) là số hộp khẩu trang bán được trong ngày.\
    - Doanh thu: $R(x) = 45 x$ (nghìn đồng).\
    - Tổng chi phí: $C(x) = 5000 + 20 x$ (nghìn đồng).\
    - Lợi nhuận: $L(x) = R(x) - C(x) = 45x - (5000 + 20x) = 25x - 5000$.\
    Xưởng hòa vốn khi $L(x) = 0 <=> 25x - 5000 = 0 <=> x = 200$.\
    Vậy xưởng cần bán ít nhất $200$ hộp khẩu trang. Đáp số: *$200$*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c6-b1", "💎", [V. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Kiến Thức Hàm Số & Đồ Thị")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. KHÁI NIỆM HÀM SỐ]
        #v(0.2em)
        #text(size: 10pt)[
          - Quy tắc cho mỗi $x in D$ duy nhất một $y = f(x)$.
          - $x$ biến độc lập, $y$ biến phụ thuộc.
          - Euler đưa ra ký hiệu $f(x)$ năm 1734.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. TẬP XÁC ĐỊNH (TXĐ)]
        #v(0.2em)
        #text(size: 10pt)[
          - $D = {x in RR: f(x) "có nghĩa"}$.
          - $1/P(x) => P(x) != 0$.
          - $sqrt(P(x)) => P(x) >= 0$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. CÁCH CHO HÀM SỐ]
        #v(0.2em)
        #text(size: 10pt)[
          - Công thức giải tích (1 hoặc nhiều nhánh).
          - Bảng số liệu thống kê.
          - Đồ thị trực quan.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. ĐỒ THỊ TRONG OXY]
        #v(0.2em)
        #text(size: 10pt)[
          - Tập hợp các điểm $M(x; f(x))$.
          - Tiêu chuẩn đường thẳng đứng: cắt tối đa tại $1$ điểm.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. TÍNH ĐƠN ĐIỆU]
        #v(0.2em)
        #text(size: 10pt)[
          - Đồng biến: $x_1 < x_2 => f(x_1) < f(x_2)$ (đi lên).
          - Nghịch biến: $x_1 < x_2 => f(x_1) > f(x_2)$ (đi xuống).
          - Tóm tắt bằng Bảng biến thiên.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. BƯỚC ĐỆM TIẾP THEO]
        #v(0.2em)
        #text(size: 10pt)[
          - *Bài 2: Hàm số bậc hai $y = a x^2 + b x + c$.*
          - Đỉnh Parabol $I(-b/(2a); -Delta/(4a))$ & Quỹ đạo ném xiên Galileo!
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 1 — CHƯƠNG VI!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Hàm số là chiếc chìa khóa giải phóng toán học khỏi thế giới tĩnh, mở ra vũ trụ chuyển động."\
        Sẵn sàng bước vào #text(fill: rgb("#fde047"), weight: "bold")[Bài 2: Hàm Số Bậc Hai & Đường Cong Parabol]!
      ]
      #v(0.6em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#4f46e5"),
          inset: (x: 18pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 12pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
