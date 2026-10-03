#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Biến Cố & Định Nghĩa Cổ Điển Của Xác Suất],
  subtitle: [TOÁN 10 — CHƯƠNG IX: PHÉP THỬ NGẪU NHIÊN, KHÔNG GIAN MẪU, BIẾN CỐ ĐỐI & CÔNG THỨC P(A)],
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
// PHẦN I: PHÉP THỬ, KHÔNG GIAN MẪU & BIẾN CỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-khai-niem-nen-tang", "🎲", [I. Phép Thử, Không Gian Mẫu & Biến Cố])

#lt-slide-back(title: "🎲 1. Phép Thử Ngẫu Nhiên & Không Gian Mẫu")[
  #lt-two-col(
    ratio: (53%, 47%),
    [
      #lt-definition(title: "Phép thử & Không gian mẫu")[
        - *Phép thử ngẫu nhiên (gọi tắt là phép thử):* Một hành động hay thí nghiệm mà kết quả của nó không thể biết trước, nhưng ta biết trước tập hợp tất cả các kết quả có thể xảy ra.
        - *Không gian mẫu:* Tập hợp mọi kết quả khả dĩ của phép thử, kí hiệu là $Omega$.
        - Số phần tử của không gian mẫu kí hiệu là $|Omega|$ hoặc $n(Omega)$.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[💡 Ví Dụ Kinh Điển]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Gieo $1$ đồng xu:* $Omega = {S, N} ==> |Omega| = 2$.
          - *Gieo $1$ con xúc xắc:* $Omega = {1, 2, 3, 4, 5, 6} ==> |Omega| = 6$.
          - *Gieo đồng thời $2$ xúc xắc:* Mỗi kết quả là cặp $(i, j)$ với $i, j in {1, dots, 6}$.
            $ |Omega| = 6 times 6 = 36 $
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🎯 2. Biến Cố & Các Mối Quan Hệ Giữa Các Biến Cố")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Khái niệm biến cố")[
        - *Biến cố (biến cố ngẫu nhiên):* Là một tập con của không gian mẫu ($A subset.eq Omega$).
        - Biến cố chắc chắn là $Omega$; Biến cố không thể là $emptyset$.
        - *Biến cố hợp:* $A union B$ ("$A$ hoặc $B$ xảy ra").
        - *Biến cố giao:* $A inter B$ ("Cả $A$ và $B$ cùng xảy ra").
        - *Hai biến cố xung khắc:* $A inter B = emptyset$.
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.2pt + rgb("#ef4444"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10pt)[⚡ Biến Cố Đối (Vũ Khí Lợi Hại)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Cho biến cố $A$. Biến cố *"Không xảy ra $A$"* được gọi là *biến cố đối* của $A$, kí hiệu là $overline(A)$.
          - Quan hệ tập hợp: $overline(A) = Omega backslash A$.
          - Dấu hiệu sử dụng biến cố đối:
            Trong đề bài có cụm từ *"có ít nhất một"*, *"ít nhất hai"*, tính trực tiếp quá nhiều trường hợp.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia-co-dien", "📊", [II. Định Nghĩa Cổ Điển Của Xác Suất])

#lt-slide-back(title: "📊 1. Định Nghĩa Cổ Điển Của Xác Suất (Laplace)")[
  #lt-two-col(
    ratio: (53%, 47%),
    [
      #lt-theorem(title: "Công thức xác suất cổ điển")[
        Giả sử phép thử có không gian mẫu $Omega$ gồm hữu hạn phần tử và các kết quả có *đồng khả năng xuất hiện*.
        Xác suất của biến cố $A$, kí hiệu là $P(A)$, được xác định bởi:
        $ P(A) = (|A|) / (|Omega|) = (n(A)) / (n(Omega)) $
        - $|A|$: Số kết quả thuận lợi cho biến cố $A$.
        - $|Omega|$: Số kết quả có thể xảy ra của phép thử.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.2pt + rgb("#22c55e"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10pt)[📌 Các Tính Chất Bất Biến]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Với mọi biến cố $A$: $0 <= P(A) <= 1$.
          - $P(emptyset) = 0$ và $P(Omega) = 1$.
          - *Công thức biến cố đối:*
            $ P(overline(A)) = 1 - P(A) <=> P(A) = 1 - P(overline(A)) $
          - Nếu $A$ và $B$ xung khắc:
            $ P(A union B) = P(A) + P(B) $
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🎨 2. Trực Quan Hóa Bằng Biểu Đồ Venn (CeTZ)")[
  #lt-two-col(
    ratio: (46%, 54%),
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Bounding sample space Omega
          rect((-2.2, -1.3), (2.2, 1.3), fill: rgb("#f8fafc"), stroke: 1.5pt + rgb("#64748b"), radius: 0.15)
          content((1.8, 1.0), text(weight: "bold", fill: rgb("#475569"), size: 9pt)[$Omega$])
          
          // Event A
          circle((-0.5, 0), radius: 0.85, fill: rgb("#dbeafe"), stroke: 1.5pt + rgb("#2563eb"))
          content((-0.5, 0.15), text(weight: "bold", fill: rgb("#1d4ed8"), size: 9pt)[$A$])
          content((-0.5, -0.2), text(size: 7pt, fill: rgb("#1e40af"))[$P(A) = |A| / |Omega|$])
          
          // Complementary event A_bar
          content((1.1, 0.1), text(weight: "bold", fill: rgb("#dc2626"), size: 8.5pt)[$overline(A) = Omega backslash A$])
          content((1.1, -0.25), text(size: 7pt, fill: rgb("#991b1b"))[$P(overline(A)) = 1 - P(A)$])
        })
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.2pt + rgb("#eab308"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 10pt)[💡 Quy Trình 4 Bước Chuẩn Mực]\
        #v(0.12em)
        #text(size: 8.2pt)[
          - *Bước 1:* Gọi tên biến cố và mô tả phép thử.
          - *Bước 2:* Dùng công cụ đếm (Quy tắc đếm, $A_n^k, C_n^k$) tính $|Omega|$.
          - *Bước 3:* Đếm số kết quả thuận lợi $|A|$ (hoặc đếm gián tiếp $|overline(A)|$).
          - *Bước 4:* Tính thương số $P(A) = |A| / |Omega|$ và rút gọn phân số.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP LUYỆN TẬP & VẬN DỤNG CAO
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG IX BÀI 1],
  questions: (
    (num: 1, type: "TN", desc: [Gieo 2 xúc xắc tổng số chấm bằng 8]),
    (num: 2, type: "TN", desc: [Rút 3 bi đủ cả 3 màu]),
    (num: 3, type: "TN", desc: [Xếp 6 bạn để An và Bình cạnh nhau]),
    (num: 4, type: "TN", desc: [Kiểm tra linh kiện có ít nhất 1 hỏng]),
    (num: 5, type: "TN", desc: [Chọn 3 đỉnh tạo tam giác vuông]),
    (num: 6, type: "TN", desc: [Rút thẻ chia hết cho 3 hoặc 5]),
    (num: 7, type: "DS", desc: [Đúng/Sai lấy ngẫu nhiên 3 viên bi]),
    (num: 8, type: "TLN", desc: [Gieo 2 xúc xắc tích chấm là số chẵn]),
    (num: 9, type: "TLN", desc: [Số tam giác vuông trong đa giác 12 đỉnh]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên mặt của hai con xúc xắc bằng $8$ là:],
  (
    [$5 / 36$],
    [$1 / 6$],
    [$1 / 9$],
    [$7 / 36$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 30A — Xác Suất Tổng Số Chấm Khi Gieo Hai Con Xúc Xắc",
  loigiai: [
    Không gian mẫu: $|Omega| = 6 times 6 = 36$.\
    Các kết quả thuận lợi có tổng bằng $8$: $A = {(2, 6), (3, 5), (4, 4), (5, 3), (6, 2)} ==> |A| = 5$.\
    Xác suất: $P(A) = (|A|) / (|Omega|) = 5 / 36$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Một hộp chứa $5$ bi đỏ, $4$ bi xanh và $3$ bi vàng. Lấy ngẫu nhiên đồng thời $3$ viên bi. Xác suất để lấy được đủ cả $3$ màu là:],
  (
    [$3 / 11$],
    [$6 / 11$],
    [$1 / 22$],
    [$9 / 22$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 30A — Xác Suất Lấy Đủ Ba Màu Bi Từ Hộp",
  loigiai: [
    Tổng số bi là $5 + 4 + 3 = 12$. Không gian mẫu: $|Omega| = C_(12)^3 = 220$.\
    Lấy đủ $3$ màu gồm $1$ đỏ, $1$ xanh, $1$ vàng: $|A| = C_5^1 times C_4^1 times C_3^1 = 5 times 4 times 3 = 60$.\
    Xác suất: $P(A) = 60 / 220 = 3 / 11$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Xếp ngẫu nhiên $6$ học sinh (trong đó có An và Bình) thành một hàng ngang. Xác suất để An và Bình đứng cạnh nhau bằng:],
  (
    [$1 / 3$],
    [$1 / 6$],
    [$1 / 2$],
    [$2 / 5$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 30A — Xác Suất Hai Học Sinh Đứng Cạnh Nhau Khi Xếp Hàng",
  loigiai: [
    Không gian mẫu: $|Omega| = 6! = 720$.\
    Buộc An và Bình thành $1$ phần tử kép: có $2!$ cách hoán vị An và Bình.\
    Xếp phần tử kép cùng $4$ bạn còn lại (gồm $5$ phần tử): có $5!$ cách.\
    Số cách xếp: $|A| = 2! times 5! = 240 ==> P(A) = 240 / 720 = 1 / 3$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Kiện hàng gồm $10$ linh kiện ($7$ tốt và $3$ hỏng). Chọn ngẫu nhiên đồng thời $3$ linh kiện. Xác suất lấy được ít nhất $1$ linh kiện hỏng là:],
  (
    [$17 / 24$],
    [$7 / 24$],
    [$1 / 2$],
    [$5 / 12$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 30A — Áp Dụng Biến Cố Đối Với Dấu Hiệu 'Ít Nhất Một'",
  loigiai: [
    Không gian mẫu: $|Omega| = C_(10)^3 = 120$.\
    Xét biến cố đối $overline(A)$: "Cả $3$ linh kiện lấy ra đều tốt".\
    Số cách chọn: $|overline(A)| = C_7^3 = 35 ==> P(overline(A)) = 35 / 120 = 7 / 24$.\
    Xác suất cần tìm: $P(A) = 1 - P(overline(A)) = 1 - 7 / 24 = 17 / 24$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Chọn ngẫu nhiên $3$ đỉnh từ $12$ đỉnh của đa giác đều nội tiếp đường tròn. Xác suất để $3$ đỉnh tạo thành tam giác vuông bằng:],
  (
    [$3 / 11$],
    [$1 / 11$],
    [$6 / 55$],
    [$12 / 55$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 30A — Xác Suất Tạo Tam Giác Vuông Từ Đa Giác Đều",
  loigiai: [
    Không gian mẫu: $|Omega| = C_(12)^3 = 220$.\
    Đa giác đều $12$ đỉnh có $12 / 2 = 6$ đường kính qua tâm.\
    Mỗi đường kính kết hợp với $1$ trong $10$ đỉnh còn lại tạo thành $1$ tam giác vuông.\
    Số tam giác vuông: $|A| = 6 times 10 = 60 ==> P(A) = 60 / 220 = 3 / 11$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Rút ngẫu nhiên một tấm thẻ từ hộp gồm $30$ thẻ đánh số từ $1$ đến $30$. Xác suất số ghi trên thẻ chia hết cho $3$ hoặc chia hết cho $5$ là:],
  (
    [$7 / 15$],
    [$8 / 15$],
    [$1 / 2$],
    [$2 / 5$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 30A — Công Thức Cộng Xác Suất Cho Biến Cố Hợp",
  loigiai: [
    Số thẻ chia hết cho $3$ là $30 / 3 = 10$; chia hết cho $5$ là $30 / 5 = 6$.\
    Số thẻ chia hết cho cả $3$ và $5$ (chia hết cho $15$) là $30 / 15 = 2$.\
    Số kết quả thuận lợi: $|A union B| = 10 + 6 - 2 = 14$.\
    Xác suất: $P = 14 / 30 = 7 / 15$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Một hộp chứa $5$ bi đỏ, $4$ bi xanh và $3$ bi vàng. Lấy ngẫu nhiên đồng thời $3$ viên bi từ hộp. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Số phần tử của không gian mẫu là $C_(12)^3 = 220$.], "true": true),
    (body: [Xác suất lấy được $3$ viên bi màu đỏ là $1 / 22$.], "true": true),
    (body: [Xác suất lấy được $3$ viên bi cùng màu là $3 / 44$.], "true": true),
    (body: [Xác suất lấy được ít nhất $1$ viên bi màu vàng là $1 / 2$.], "true": false),
  ),
  num: 7,
  de: "Đề 30A — Khảo Sát Xác Suất Rút Bi Đa Sắc",
  loigiai: [
    - a) *Đ:* Không gian mẫu $|Omega| = C_(12)^3 = 220$.
    - b) *Đ:* Chọn $3$ đỏ: $C_5^3 = 10 ==> P = 10 / 220 = 1 / 22$.
    - c) *Đ:* Cùng màu: $C_5^3 + C_4^3 + C_3^3 = 10 + 4 + 1 = 15 ==> P = 15 / 220 = 3 / 44$.
    - d) *S:* Không có vàng: $C_9^3 = 84 ==> P("ít nhất 1 vàng") = 1 - 84 / 220 = 34 / 55 != 1 / 2$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Gieo hai con xúc xắc cân đối đồng chất. Tính xác suất để tích số chấm xuất hiện trên hai mặt là một số chẵn (kết quả viết dưới dạng phân số tối giản $a / b$).],
  "3/4",
  num: 8,
  de: "Đề 30A — Xác Suất Tích Số Chấm Là Số Chẵn",
  loigiai: [
    1. Không gian mẫu gieo $2$ con xúc xắc: $|Omega| = 6 times 6 = 36$.\
    2. Xét biến cố đối $overline(A)$: "Tích hai số chấm là số lẻ".\
    3. Tích lẻ khi và chỉ khi cả hai xúc xắc đều xuất hiện mặt lẻ (${1, 3, 5}$):\
       $|overline(A)| = 3 times 3 = 9 ==> P(overline(A)) = 9 / 36 = 1 / 4$.\
    4. Xác suất tích chẵn là: $P(A) = 1 - P(overline(A)) = 1 - 1 / 4 = 3 / 4$.\
    5. Đáp số: *$3/4$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho đa giác đều có $12$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $12$ đỉnh của đa giác. Có bao nhiêu tam giác vuông được tạo thành?],
  "60",
  num: 9,
  de: "Đề 30A — Đếm Số Tam Giác Vuông Từ Đa Giác Đều",
  loigiai: [
    1. Đa giác đều $12$ đỉnh nội tiếp đường tròn có $12 / 2 = 6$ đường kính qua tâm.\
    2. Theo định lý góc nội tiếp chắn nửa đường tròn, mỗi tam giác vuông có cạnh huyền là một đường kính.\
    3. Với mỗi đường kính, chọn $1$ đỉnh trong $12 - 2 = 10$ đỉnh còn lại sẽ tạo thành $1$ tam giác vuông.\
    4. Tổng số tam giác vuông tạo thành là: $N = 6 times 10 = 60$.\
    5. Đáp số: *$60$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Quy Trình Tính Xác Suất Cổ Điển Thần Tốc")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        column-gutter: 8pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"), size: 9pt)[Bước 1: Phép Thử]\
            #v(0.1em)
            #text(size: 8pt)[
              - Xác định hành động lấy/chọn.\
              - Gọi tên biến cố $A$.\
              - Điều kiện đồng khả năng.
            ]
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"), size: 9pt)[Bước 2: Không Gian Mẫu]\
            #v(0.1em)
            #text(size: 8pt)[
              - Đếm $|Omega|$ bằng tổ hợp $C_n^k$ hoặc quy tắc nhân.\
              - Kiểm tra lấy có/không hoàn lại.
            ]
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#22c55e"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#15803d"), size: 9pt)[Bước 3: Đếm Thuận Lợi]\
            #v(0.1em)
            #text(size: 8pt)[
              - Tính trực tiếp $|A|$.\
              - Hoặc dùng biến cố đối:\
                $|overline(A)| = |Omega| - |A|$.
            ]
          ]
        ],
        [
          #block(fill: rgb("#fdf2f8"), stroke: 1pt + rgb("#ec4899"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#be185d"), size: 9pt)[Bước 4: Kết Luận]\
            #v(0.1em)
            #text(size: 8pt)[
              $P(A) = (|A|) / (|Omega|)$\
              Rút gọn phân số tối giản.\
              Kiểm tra $0 <= P(A) <= 1$.
            ]
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 26!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 18pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 26!]\
      #v(0.4em)
      #text(size: 10.5pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn các kỹ năng xác suất cơ bản:\
        *Không gian mẫu, Biến cố ngẫu nhiên, Biến cố đối & Định nghĩa xác suất Laplace.*
      ]
      #v(0.7em)
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
