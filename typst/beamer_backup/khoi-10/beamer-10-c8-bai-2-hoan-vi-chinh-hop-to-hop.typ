#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Hoán Vị, Chỉnh Hợp & Tổ Hợp],
  subtitle: [TOÁN 10 — CHƯƠNG VIII: GIAI THỪA, CÔNG THỨC P(n), A(n, k), C(n, k) & BÀI TOÁN CHỌN LỌC],
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
// PHẦN I: HOÁN VỊ & CHỈNH HỢP
// ════════════════════════════════════════════════
#lt-section-link("sec-hoan-vi-chinh-hop", "🔄", [I. Hoán Vị & Chỉnh Hợp])

#lt-slide-back(title: "🔄 1. Hoán Vị (Xếp Thứ Tự Cả n Phần Tử)")[
  #lt-two-col(
    ratio: (53%, 47%),
    [
      #lt-definition(title: "Khái niệm hoán vị")[
        Cho tập hợp $X$ gồm $n$ phần tử ($n >= 1$).
        Mỗi kết quả của sự sắp xếp thứ tự $n$ phần tử của tập hợp $X$ được gọi là một *hoán vị* của $n$ phần tử đó.
        - Số các hoán vị của $n$ phần tử kí hiệu là $P_n$:
        $ P_n = n! = n(n - 1)(n - 2) dots 2 dot 1 $
        - Quy ước đặc biệt: $0! = 1$.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[💡 Ví Dụ Kinh Điển]\
        #v(0.1em)
        #text(size: 8.5pt)[
          - Xếp $5$ bạn học sinh vào một dãy $5$ chiếc ghế: có $P_5 = 5! = 120$ cách.
          - Xếp $4$ chữ cái $A, B, C, D$ thành một hàng: có $4! = 24$ từ (kể cả vô nghĩa).
          - Số hoán vị tăng cực nhanh khi $n$ tăng: $10! = 3.628.800$ cách!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🎯 2. Chỉnh Hợp (Chọn k Phần Tử & Có Xếp Thứ Tự)")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Khái niệm chỉnh hợp")[
        Cho tập hợp $X$ gồm $n$ phần tử ($n >= 1$) và số nguyên $k$ ($1 <= k <= n$).
        Mỗi kết quả của việc lấy ra $k$ phần tử từ $X$ và sắp xếp chúng theo một thứ tự được gọi là một *chỉnh hợp chập $k$ của $n$ phần tử*.
        $ A_n^k = (n!) / ((n - k)!) = n(n - 1) dots (n - k + 1) $
        - Khi $k = n$, ta có $A_n^n = P_n = n!$.
      ]
    ],
    [
      #lt-important(title: "Dấu hiệu nhận biết chỉnh hợp")[
        - Bước 1: Chọn $k$ phần tử từ $n$ phần tử.
        - Bước 2: *Có phân biệt thứ tự* (như xếp hàng, trao giải Nhất - Nhì - Ba, phân công chức vụ).
        - Nếu đổi chỗ $2$ phần tử trong kết quả mà sinh ra *cách mới* thì đó là Chỉnh hợp!
      ]
    ]
  )
]

#lt-slide-back(title: "🤖 Cờ Vây & Siêu Trí Tuệ AlphaGo (DeepMind 2016)")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[🤖 Bùng Nổ Chỉnh Hợp Trong Cờ Vây]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Bàn cờ vây có $19 times 19 = 361$ giao điểm.
          - Nước đi đầu có $361$ cách chọn, nước 2 có $360$ cách, nước 3 có $359$ cách...
          - Số lượng ván cờ khả dĩ là một chỉnh hợp khổng lồ: khoảng $10^(170)$ trạng thái!
          - Con số này *lớn hơn toàn bộ số nguyên tử trong vũ trụ quan sát được ($approx 10^(80)$)*!
        ]
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[⚡ Chiến Thắng Lịch Sử Của AI]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Máy tính không thể dùng "vét cạn" (brute-force) để duyệt $10^(170)$ khả năng.
          - Năm 2016, DeepMind tạo ra *AlphaGo* kết hợp mạng nơ-ron sâu và thuật toán tìm kiếm cây Monte Carlo (MCTS) để cắt tỉa các nhánh tổ hợp kém, đánh bại huyền thoại Lee Sedol 4-1!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: TỔ HỢP & TÍNH CHẤT ĐỐI XỨNG
// ════════════════════════════════════════════════
#lt-section-link("sec-to-hop", "🤝", [II. Tổ Hợp & Tính Chất Đối Xứng])

#lt-slide-back(title: "🤝 Tổ Hợp (Chọn k Phần Tử — Không Tính Thứ Tự)")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Khái niệm tổ hợp")[
        Cho tập hợp $X$ gồm $n$ phần tử ($n >= 1$) và số nguyên $k$ ($0 <= k <= n$).
        Mỗi tập hợp con gồm $k$ phần tử được lấy ra từ $X$ được gọi là một *tổ hợp chập $k$ của $n$ phần tử*.
        $ C_n^k = (n!) / (k! (n - k)!) = (A_n^k) / (k!) $
        - Quy ước: $C_n^0 = 1$ và $C_n^n = 1$.
      ]
    ],
    [
      #lt-important(title: "Phân biệt Chỉnh hợp và Tổ hợp")[
        - *Chỉnh hợp $A_n^k$*: CÓ thứ tự (đổi chỗ tạo ra kết quả mới).
        - *Tổ hợp $C_n^k$*: KHÔNG thứ tự (chọn nhóm trực nhật, bắt tay, chọn tập con).
        - Mối liên hệ: $A_n^k = k! dot C_n^k$.
      ]
    ]
  )
]

#lt-slide-back(title: "✨ Hai Tính Chất Đối Xứng Vàng Của Tổ Hợp")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "1. Tính chất đối xứng")[
        $ C_n^k = C_n^(n - k) quad (0 <= k <= n) $
        - *Ý nghĩa thực tế:* Chọn $k$ người đi thực hiện nhiệm vụ cũng tương đương với việc chỉ định $n - k$ người ở lại!
        - Ví dụ: $C_(10)^8 = C_(10)^2 = (10 times 9)/2 = 45$.
      ]
    ],
    [
      #lt-theorem(title: "2. Công thức Pascal")[
        $ C_n^k = C_(n - 1)^(k - 1) + C_(n - 1)^k quad (1 <= k <= n) $
        - *Ý nghĩa:* Để chọn $k$ người từ $n$ người có chứa bạn An:
          + Hoặc có An: chọn thêm $k-1$ người từ $n-1$ người còn lại ($C_(n-1)^(k-1)$).
          + Hoặc không có An: chọn $k$ người từ $n-1$ người ($C_(n-1)^k$).
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & ỨNG DỤNG
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VIII BÀI 2],
  questions: (
    (num: 1, type: "TN", desc: [Hoán vị xếp chỗ ngồi]),
    (num: 2, type: "TN", desc: [Chỉnh hợp phân công chức vụ]),
    (num: 3, type: "TN", desc: [Tổ hợp chọn ban trực nhật]),
    (num: 4, type: "TN", desc: [Số đường chéo đa giác lồi]),
    (num: 5, type: "TN", desc: [Số hình bình hành từ các đường song song]),
    (num: 6, type: "TN", desc: [Lập số 4 chữ số khác nhau]),
    (num: 7, type: "DS", desc: [Đúng/Sai chọn ban đại diện lớp]),
    (num: 8, type: "TLN", desc: [Số tự nhiên có chữ số giảm dần]),
    (num: 9, type: "TLN", desc: [Tìm số đỉnh đa giác có 135 đường chéo]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Có bao nhiêu cách xếp $5$ bạn học sinh ngồi vào một dãy gồm $5$ chiếc ghế kê thành hàng ngang?],
  (
    [$120$],
    [$24$],
    [$5$],
    [$25$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 27A — Áp Dụng Công Thức Hoán Vị Cơ Bản",
  loigiai: [
    Mỗi cách xếp $5$ bạn học sinh vào $5$ chiếc ghế là một hoán vị của $5$ phần tử.\
    Số cách xếp là: $P_5 = 5! = 5 times 4 times 3 times 2 times 1 = 120$ cách.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ một nhóm gồm $10$ học sinh, cần chọn ra $3$ bạn đảm nhiệm $3$ chức vụ khác nhau: Lớp trưởng, Lớp phó và Bí thư. Số cách chọn là:],
  (
    [$720$],
    [$120$],
    [$30$],
    [$240$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 27A — Áp Dụng Công Thức Chỉnh Hợp Phân Công Chức Vụ",
  loigiai: [
    Việc chọn $3$ bạn từ $10$ bạn và phân công $3$ chức vụ khác nhau (có phân biệt thứ tự) là một chỉnh hợp chập $3$ của $10$ phần tử:\
    $A_(10)^3 = 10 times 9 times 8 = 720$ cách.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ một nhóm gồm $10$ học sinh, cần chọn ra một tổ gồm $3$ bạn đi trực nhật (không phân biệt nhiệm vụ). Số cách chọn là:],
  (
    [$120$],
    [$720$],
    [$30$],
    [$60$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 27A — Áp Dụng Công Thức Tổ Hợp Chọn Tổ Trực Nhật",
  loigiai: [
    Việc chọn $3$ bạn từ $10$ bạn đi trực nhật (không quan tâm thứ tự) là một tổ hợp chập $3$ của $10$ phần tử:\
    $C_(10)^3 = (10 times 9 times 8) / (3 times 2 times 1) = 120$ cách.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Số đường chéo của một đa giác lồi có $10$ đỉnh bằng:],
  (
    [$35$],
    [$45$],
    [$20$],
    [$90$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 27A — Số Đường Chéo Của Đa Giác Lồi",
  loigiai: [
    Nối hai đỉnh bất kỳ của đa giác $10$ đỉnh tạo ra $C_(10)^2$ đoạn thẳng (gồm cả cạnh và đường chéo).\
    Đa giác có $10$ cạnh. Số đường chéo là:\
    $N = C_(10)^2 - 10 = (10 times 9)/2 - 10 = 45 - 10 = 35$ đường chéo.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Trong mặt phẳng cho một họ gồm $4$ đường thẳng song song cắt một họ gồm $5$ đường thẳng song song khác. Số hình bình hành tạo thành là:],
  (
    [$60$],
    [$20$],
    [$120$],
    [$30$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 27A — Số Hình Bình Hành Tạo Thành Từ Các Đường Song Song",
  loigiai: [
    Mỗi hình bình hành được tạo thành từ việc chọn $2$ đường trong họ thứ nhất và $2$ đường trong họ thứ hai:\
    - Chọn $2$ đường từ $4$ đường: có $C_4^2 = 6$ cách.\
    - Chọn $2$ đường từ $5$ đường: có $C_5^2 = 10$ cách.\
    Theo quy tắc nhân: số hình bình hành là $6 times 10 = 60$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ tập hợp các chữ số $S = {1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau?],
  (
    [$840$],
    [$35$],
    [$2401$],
    [$28$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 27A — Lập Số Tự Nhiên Bằng Chỉnh Hợp",
  loigiai: [
    Mỗi số tự nhiên gồm $4$ chữ số đôi một khác nhau lấy từ $7$ chữ số của $S$ là một chỉnh hợp chập $4$ của $7$ phần tử:\
    $A_7^4 = 7 times 6 times 5 times 4 = 840$ số.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Một lớp học có $30$ học sinh gồm $18$ nam và $12$ nữ. Chọn ra một ban đại diện gồm $4$ học sinh. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Số cách chọn $4$ học sinh bất kỳ là $C_(30)^4 = 27.405$ cách.], "true": true),
    (body: [Số cách chọn $4$ học sinh toàn là nam là $C_(18)^4 = 3.060$ cách.], "true": true),
    (body: [Số cách chọn $4$ học sinh gồm đúng $2$ nam và $2$ nữ là $10.098$ cách.], "true": true),
    (body: [Số cách chọn có ít nhất $1$ bạn nữ là $25.000$ cách.], "true": false),
  ),
  num: 7,
  de: "Đề 27A — Khảo Sát Chọn Ban Đại Diện Lớp Học",
  loigiai: [
    - a) *Đ:* Chọn $4$ từ $30$: $C_(30)^4 = 27.405$ cách.
    - b) *Đ:* Chọn $4$ từ $18$ nam: $C_(18)^4 = 3.060$ cách.
    - c) *Đ:* Chọn $2$ nam ($C_(18)^2 = 153$) và $2$ nữ ($C_(12)^2 = 66$): $153 times 66 = 10.098$ cách.
    - d) *S:* Biến cố đối (toàn nam): $27.405 - 3.060 = 24.345 != 25.000$ cách.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Có bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau $overline(a b c d e)$ thỏa mãn điều kiện các chữ số giảm dần từ trái sang phải: $a > b > c > d > e$?],
  "252",
  num: 8,
  de: "Đề 27B — Số Tự Nhiên Có Chữ Số Giảm Dần (Song Ánh Tổ Hợp)",
  loigiai: [
    1. Lấy $5$ chữ số bất kỳ từ tập $10$ chữ số ${0, 1, 2, ..., 9}$.\
    2. Vì $a > b > c > d > e >= 0$ nên chữ số đầu $a > 0$ luôn tự động thỏa mãn.\
    3. Với mỗi bộ $5$ chữ số phân biệt được chọn, chỉ có duy nhất $1$ cách sắp xếp giảm dần.\
    4. Do đó số các số tự nhiên giảm dần đúng bằng số cách chọn $5$ chữ số từ $10$ chữ số:\
       $N = C_(10)^5 = (10 times 9 times 8 times 7 times 6) / (5 times 4 times 3 times 2 times 1) = 252 " số"$.\
    5. Đáp số: *$252$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Một đa giác lồi có tất cả $135$ đường chéo. Hỏi đa giác đó có bao nhiêu đỉnh?],
  "18",
  num: 9,
  de: "Đề 27A — Phương Trình Tổ Hợp Tìm Số Đỉnh Đa Giác Lồi",
  loigiai: [
    1. Gọi $n$ ($n in NN, n >= 4$) là số đỉnh của đa giác lồi.\
    2. Số đường chéo của đa giác lồi $n$ đỉnh được tính bởi công thức:\
       $C_n^2 - n = (n(n - 1))/2 - n = (n(n - 3))/2$.\
    3. Theo đề bài ta có phương trình: $(n(n - 3))/2 = 135 <=> n^2 - 3n - 270 = 0$.\
    4. Giải phương trình bậc hai ta được: $n = 18$ (thỏa mãn) hoặc $n = -15$ (loại).\
    5. Đáp số: *$18$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Bảng Đối Sánh Hoán Vị, Chỉnh Hợp Và Tổ Hợp")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: 10pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Hoán vị P(n)]\
            #v(0.1em)
            $P_n = n!$\
            Lấy *tất cả $n$ phần tử*\
            *Có thứ tự*\
            Xếp hàng, hoán đổi vị trí
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"))[2. Chỉnh hợp A(n, k)]\
            #v(0.1em)
            $A_n^k = (n!) / ((n-k)!)$\
            Lấy *$k$ từ $n$ phần tử*\
            *Có thứ tự*\
            Chức vụ, lập số tự nhiên
          ]
        ],
        [
          #block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#a855f7"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#7e22ce"))[3. Tổ hợp C(n, k)]\
            #v(0.1em)
            $C_n^k = (n!) / (k! (n-k)!)$\
            Lấy *$k$ từ $n$ phần tử*\
            *KHÔNG thứ tự*\
            Chọn tổ, tập con, hình học
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 24!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 24!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn hảo ba cỗ máy biến hóa kỳ diệu của Đại số tổ hợp:\
        *Hoán vị P(n), Chỉnh hợp A(n, k) & Tổ hợp C(n, k).*
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 12pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
