#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Quy Tắc Đếm],
  subtitle: [TOÁN 10 — CHƯƠNG VIII: QUY TẮC CỘNG, QUY TẮC NHÂN & SƠ ĐỒ HÌNH CÂY],
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
// PHẦN I: QUY TẮC CỘNG & SƠ ĐỒ HÌNH CÂY
// ════════════════════════════════════════════════
#lt-section-link("sec-quy-tac-cong", "➕", [I. Quy Tắc Cộng & Sơ Đồ Hình Cây])

#lt-slide-back(title: "➕ Nghệ Thuật Đếm Thông Minh Của Gottfried Leibniz")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Nghệ thuật đếm mà không cần đếm")[
        - Thời tiền sử: Người ta đếm cừu bằng cách nhặt từng hòn sỏi.
        - Khi các khả năng lên tới hàng triệu, hàng tỷ, việc đếm thủ công trở thành bất khả thi!
        - *Đại số tổ hợp* ra đời để giúp con người *đếm thông minh* thông qua các quy luật logic mà không cần chạm vào từng đối tượng.
      ]
      #v(0.1em)
      #lt-tip(title: "Ý nghĩa nền tảng")[
        Quy tắc cộng và Quy tắc nhân là hai viên gạch đầu tiên xây dựng ngành Khoa học Máy tính hiện đại!
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[📜 Leibniz & Giấc Mơ AI Đầu Tiên (1666)]\
        #v(0.2em)
        #text(size: 8.5pt)[
          - Năm 20 tuổi, *G.W. Leibniz* bảo vệ luận án *“Dissertatio de Arte Combinatoria”*.
          - Ông nhận định: Mọi tư tưởng nhân loại thực chất chỉ là *sự tổ hợp* của các ý niệm cơ bản.
          - Leibniz mơ ước cỗ máy tính toán tự động giải quyết mọi tranh luận: *“Calculemus! (Nào, hãy cùng tính toán!)”* — mầm mống của AI!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "➕ Quy Tắc Cộng (Phương Án Độc Lập)")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Định nghĩa quy tắc cộng")[
        Một công việc có thể hoàn thành bởi một trong hai phương án $A$ hoặc $B$:
        - Phương án $A$ có $m$ cách thực hiện.
        - Phương án $B$ có $n$ cách thực hiện (không trùng với bất kỳ cách nào của phương án $A$).
        Khi đó, công việc có thể hoàn thành theo:
        $ m + n quad text("cách") $
      ]
    ],
    [
      #lt-theorem(title: "Biểu diễn theo lý thuyết tập hợp")[
        Gọi $A$ và $B$ là hai tập hợp hữu hạn rời nhau ($A inter B = emptyset$). Số phần tử của tập hợp hợp là:
        $ |A union B| = |A| + |B| $
        - Mở rộng cho $k$ phương án đôi một xung khắc:
        $ N = m_1 + m_2 + dots + m_k $
      ]
      #v(0.1em)
      #lt-important(title: "Dấu hiệu nhận biết")[
        Chỉ cần chọn *HOẶC* phương án 1, *HOẶC* phương án 2 là công việc đã *xong ngay*!
      ]
    ]
  )
]

#lt-slide-back(title: "🌳 Sơ Đồ Hình Cây & Cây Quyết Định Trong AI")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Sơ đồ hình cây (Tree Diagram)")[
        - Sơ đồ hình cây là công cụ đồ họa trực quan giúp liệt kê không sót bất kỳ trường hợp nào.
        - Gốc cây đại diện cho thời điểm bắt đầu.
        - Mỗi cành cây rẽ nhánh tương ứng với một lựa chọn khả dĩ.
        - Số cành ở tầng lá cuối cùng chính là *tổng số cách thực hiện*.
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[🤖 Decision Tree & Random Forest Trong AI]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Sơ đồ cây chính là cấu trúc cơ sở của thuật toán *Cây quyết định (Decision Tree)* trong Machine Learning.
          - Hệ thống AI ngân hàng duyệt hồ sơ vay tiền qua các nhánh cây: Thu nhập $>= 20$ triệu? (Có/Không) $==>$ Có nợ xấu? (Có/Không) $==>$ Quyết định duyệt hay từ chối trong vài giây!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: QUY TẮC NHÂN & SỰ BÙNG NỔ TỔ HỢP
// ════════════════════════════════════════════════
#lt-section-link("sec-quy-tac-nhan", "✖️", [II. Quy Tắc Nhân & Sự Bùng Nổ Tổ Hợp])

#lt-slide-back(title: "✖️ Quy Tắc Nhân (Công Đoạn Liên Tiếp)")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Định nghĩa quy tắc nhân")[
        Một công việc đòi hỏi phải thực hiện qua hai công đoạn liên tiếp 1 và 2:
        - Công đoạn 1 có $m$ cách thực hiện.
        - Với mỗi cách thực hiện công đoạn 1, có $n$ cách thực hiện công đoạn 2.
        Khi đó, toàn bộ công việc có thể hoàn thành theo:
        $ m times n quad text("cách") $
      ]
    ],
    [
      #lt-theorem(title: "Mở rộng cho k công đoạn")[
        Nếu công việc trải qua $k$ bước liên hoàn:
        $ N = m_1 times m_2 times dots times m_k $
      ]
      #v(0.1em)
      #lt-important(title: "Dấu hiệu phân biệt")[
        - *Quy tắc cộng (HOẶC)*: Làm 1 phương án là xong việc.
        - *Quy tắc nhân (VÀ)*: Phải làm bước 1 *VÀ* bước 2 mới xong việc!
      ]
    ]
  )
]

#lt-slide-back(title: "🔐 Khóa Vali Số & Hiện Tượng Bùng Nổ Tổ Hợp")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10pt)[1. Khóa vali 3 vòng số (0 đến 9)]\
        #v(0.1em)
        #text(size: 8.5pt)[
          - Mỗi vòng có $10$ cách chọn.
          - Theo Quy tắc nhân: Có $10 times 10 times 10 = 1.000$ mã.
          - Nếu thử mỗi mã mất $2$ giây, kẻ trộm chỉ mất tối đa $2.000$ giây ($approx 33$ phút) là bẻ xong khóa!
        ]
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[2. Khóa bảo mật 6 ký tự (chữ & số)]\
        #v(0.1em)
        #text(size: 8.5pt)[
          - Gồm chữ hoa, chữ thường và số: $62$ ký tự.
          - Số mã khả dĩ: $62^6 approx 56,8$ tỷ mã!
          - Nếu thử $2$ giây/mã, thời gian để dò hết là:
          $ (56,8 times 10^9 times 2) / (3600 times 24 times 365) approx 3.600 "NĂM"! $
          - Sự bùng nổ tổ hợp bảo vệ an ninh mạng!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & ỨNG DỤNG
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VIII BÀI 1],
  questions: (
    (num: 1, type: "TN", desc: [Quy tắc cộng: Chọn món ăn / nước]),
    (num: 2, type: "TN", desc: [Quy tắc nhân: Phối đồ áo và quần]),
    (num: 3, type: "TN", desc: [Mạng lưới giao thông liên tỉnh]),
    (num: 4, type: "TN", desc: [Lập số có 3 chữ số khác nhau]),
    (num: 5, type: "TN", desc: [Lập số chẵn có 3 chữ số khác nhau]),
    (num: 6, type: "TN", desc: [Số mật mã khóa 4 chữ số]),
    (num: 7, type: "DS", desc: [Đúng/Sai mạng lưới logistics]),
    (num: 8, type: "TLN", desc: [Số tự nhiên lẻ có 3 chữ số khác]),
    (num: 9, type: "TLN", desc: [Xếp sách Toán - Văn cùng môn cạnh nhau]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Nhà hàng có $5$ món ăn chính và $4$ loại nước giải khát. Một khách chọn đúng $1$ món ăn hoặc $1$ loại nước giải khát. Số cách chọn là:],
  (
    [$9$],
    [$20$],
    [$1$],
    [$5$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 26A — Áp Dụng Quy Tắc Cộng Cơ Bản",
  loigiai: [
    Chọn $1$ món ăn ($5$ cách) HOẶC $1$ loại nước ($4$ cách) là hai phương án độc lập.\
    Theo quy tắc cộng: $5 + 4 = 9$ cách.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Bạn Nam có $4$ áo sơ mi khác nhau và $3$ quần âu khác nhau. Để chọn một bộ trang phục gồm $1$ áo và $1$ quần, số cách chọn là:],
  (
    [$12$],
    [$7$],
    [$4$],
    [$3$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 26A — Áp Dụng Quy Tắc Nhân Cơ Bản",
  loigiai: [
    Chọn $1$ áo sơ mi ($4$ cách) VÀ chọn $1$ quần âu ($3$ cách) là hai công đoạn liên tiếp.\
    Theo quy tắc nhân: $4 times 3 = 12$ cách.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ thành phố $A$ đến $B$ có $3$ con đường, từ $B$ đến $C$ có $4$ con đường. Hỏi có bao nhiêu cách đi từ $A$ đến $C$ qua $B$?],
  (
    [$12$],
    [$7$],
    [$24$],
    [$14$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 26A — Tuyến Đường Giao Thông Liên Hoàn",
  loigiai: [
    Hành trình gồm hai chặng liên tiếp: $A -> B$ ($3$ cách) VÀ $B -> C$ ($4$ cách).\
    Theo quy tắc nhân: $3 times 4 = 12$ cách.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ tập $S = {1, 2, 3, 4, 5}$, có thể lập được bao nhiêu số tự nhiên gồm $3$ chữ số đôi một khác nhau?],
  (
    [$60$],
    [$125$],
    [$15$],
    [$20$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 26A — Lập Số Tự Nhiên Chữ Số Khác Nhau",
  loigiai: [
    Số $overline(a b c)$: Chọn $a$ ($5$ cách), chọn $b != a$ ($4$ cách), chọn $c != a, b$ ($3$ cách).\
    Theo quy tắc nhân: $5 times 4 times 3 = 60$ số.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ tập $S = {1, 2, 3, 4, 5, 6}$, lập được bao nhiêu số tự nhiên chẵn gồm $3$ chữ số đôi một khác nhau?],
  (
    [$60$],
    [$120$],
    [$30$],
    [$72$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 26A — Lập Số Tự Nhiên Chẵn Khác Nhau",
  loigiai: [
    Số chẵn $overline(a b c)$: Chọn $c in {2, 4, 6}$ ($3$ cách), chọn $a != c$ ($5$ cách), chọn $b != a, c$ ($4$ cách).\
    Theo quy tắc nhân: $3 times 5 times 4 = 60$ số.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Khóa vali có $4$ vòng số quay độc lập (từ $0$ đến $9$). Số mật mã khả dĩ khác nhau có thể cài đặt là:],
  (
    [$10.000$],
    [$5.040$],
    [$40$],
    [$1.000$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 26A — Bài Toán Mã Số Bảo Mật Khóa Vali",
  loigiai: [
    Mỗi vòng có $10$ cách chọn. Bốn vòng quay liên tiếp:\
    Theo quy tắc nhân: $10 times 10 times 10 times 10 = 10^4 = 10.000$ mã.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Mạng lưới logistics: $A -> B$ có $3$ đường bộ, $2$ đường sắt; $B -> C$ có $4$ đường bộ; $A -> C$ có $2$ đường bay; $C -> D$ có $3$ đường cao tốc. Xét tính Đúng / Sai:],
  (
    (body: [Số cách đi từ kho $A$ đến kho $B$ là $5$ cách.], "true": true),
    (body: [Số hành trình từ $A$ đến $C$ qua $B$ là $20$ cách.], "true": true),
    (body: [Tổng số hành trình từ $A$ đến $C$ là $22$ cách.], "true": true),
    (body: [Tổng số hành trình từ $A$ đến $D$ là $60$ cách.], "true": false),
  ),
  num: 7,
  de: "Đề 26B — Khảo Sát Mạng Lưới Logistics",
  loigiai: [
    - a) *Đ:* $3 + 2 = 5$ cách.
    - b) *Đ:* $5 times 4 = 20$ cách.
    - c) *Đ:* $20 + 2 = 22$ cách (qua $B$ hoặc bay thẳng).
    - d) *S:* Từ $A$ đến $D$: $22 times 3 = 66 != 60$ cách.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Từ các chữ số thuộc tập hợp $S = {1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên lẻ gồm $3$ chữ số đôi một khác nhau?],
  "120",
  num: 8,
  de: "Đề 26A — Đếm Số Tự Nhiên Lẻ Có Các Chữ Số Đôi Một Khác Nhau",
  loigiai: [
    1. Gọi số cần tìm có dạng $overline(a b c)$ ($a, b, c in S$ đôi một khác nhau).\
    2. Vì là số lẻ nên chữ số tận cùng $c in {1, 3, 5, 7}$: có $4$ cách chọn.\
    3. Chọn chữ số $a in S \\ {c}$: có $7 - 1 = 6$ cách chọn.\
    4. Chọn chữ số $b in S \\ {a, c}$: có $7 - 2 = 5$ cách chọn.\
    5. Theo quy tắc nhân, số các số tự nhiên lẻ lập được là:\
       $N = 4 times 6 times 5 = 120 " số"$.\
    6. Đáp số: *$120$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Có $3$ cuốn sách Toán khác nhau và $2$ cuốn sách Ngữ văn khác nhau được xếp thành một hàng ngang trên giá sách. Có bao nhiêu cách xếp sao cho các cuốn sách cùng một môn luôn luôn đứng cạnh nhau?],
  "24",
  num: 9,
  de: "Đề 26B — Phương Pháp Đóng Gói Khối Trong Bài Toán Sắp Xếp Sách",
  loigiai: [
    1. Gom $3$ cuốn sách Toán thành khối $T$, gom $2$ cuốn sách Ngữ văn thành khối $V$.\
    2. Xếp thứ tự hai khối $T$ và $V$ trên giá sách: có $2! = 2$ cách ($T V$ hoặc $V T$).\
    3. Với mỗi cách xếp khối, ta hoán vị các cuốn sách bên trong mỗi khối:\
       - Xếp $3$ cuốn sách Toán trong khối $T$: có $3! = 3 times 2 times 1 = 6$ cách.\
       - Xếp $2$ cuốn sách Văn trong khối $V$: có $2! = 2 times 1 = 2$ cách.\
    4. Theo quy tắc nhân, tổng số cách xếp thỏa mãn là:\
       $N = 2 times 6 times 2 = 24 " cách"$.\
    5. Đáp số: *$24$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Bảng Đối Sánh Quy Tắc Cộng Và Quy Tắc Nhân")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 14pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 9pt, radius: 7pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Quy tắc cộng (HOẶC)]\
            #v(0.1em)
            - Các phương án *độc lập / xung khắc nhau*.\
            - Chọn $1$ phương án là *hoàn thành* công việc.\
            - Công thức: $N = m + n$.\
            - Tập hợp: $|A union B| = |A| + |B|$ khi $A inter B = emptyset$.
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#10b981"), inset: 9pt, radius: 7pt)[
            #text(weight: "bold", fill: rgb("#047857"))[2. Quy tắc nhân (VÀ)]\
            #v(0.1em)
            - Các công đoạn *liên hoàn / nối tiếp nhau*.\
            - Phải thực hiện *tất cả các bước* mới xong việc.\
            - Công thức: $N = m times n$.\
            - Cội nguồn của bùng nổ tổ hợp và bảo mật mật mã.
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 23!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 23!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn hai viên gạch nền tảng của Đại số tổ hợp:\
        *Quy tắc cộng (Phương án độc lập), Quy tắc nhân (Công đoạn liên hoàn) & Sơ đồ hình cây.*
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
