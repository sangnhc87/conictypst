#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương IX: Một Số Yếu Tố Xác Suất],
  subtitle: [TOÁN 10 — HỆ THỐNG TOÀN DIỆN LÝ THUYẾT XÁC SUẤT, RÈN LUYỆN KỸ NĂNG & CỘT MỐC TOÀN KHÓA TOÁN 10],
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
// PHẦN I: HỆ THỐNG HÓA LÝ THUYẾT CHƯƠNG IX
// ════════════════════════════════════════════════
#lt-section-link("sec-he-thong-ly-thuyet", "🗺️", [I. Hệ Thống Hóa Lý Thuyết Xác Suất])

#lt-slide-back(title: "🗺️ 1. Bản Đồ Khái Niệm Xác Suất Cổ Điển")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[1. Phép Thử & Biến Cố]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Phép thử ngẫu nhiên $T$:* Kết quả không đoán trước được.
          - *Không gian mẫu $Omega$:* Tập mọi kết quả có thể xảy ra.
          - *Biến cố $A subset.eq Omega$:* Tập các kết quả thuận lợi.
          - *Biến cố đối $overline(A) = Omega backslash A$:* "Không xảy ra $A$".
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.2pt + rgb("#22c55e"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10pt)[2. Định Nghĩa Cổ Điển & Tính Chất]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Công thức Laplace:*
            $ P(A) = (|A|) / (|Omega|) $
          - *Biên độ giá trị:* $0 <= P(A) <= 1$.
          - *Biến cố chắc chắn & không thể:* $P(Omega) = 1, P(emptyset) = 0$.
          - *Công thức biến cố đối:* $P(A) = 1 - P(overline(A))$.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🎲 2. Lưới Không Gian Mẫu Xúc Xắc (CeTZ)")[
  #lt-two-col(
    ratio: (46%, 54%),
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for x in range(1, 7) {
            for y in range(1, 7) {
              if x + y >= 10 {
                rect((x * 0.38, y * 0.38), (x * 0.38 + 0.34, y * 0.38 + 0.34), fill: rgb("#dbeafe"), stroke: 1pt + rgb("#2563eb"))
                content((x * 0.38 + 0.17, y * 0.38 + 0.17), text(fill: rgb("#1d4ed8"), size: 6.5pt, str(x) + str(y)))
              } else {
                rect((x * 0.38, y * 0.38), (x * 0.38 + 0.34, y * 0.38 + 0.34), stroke: 0.4pt + rgb("#cbd5e1"))
              }
            }
          }
          content((1.5, 0.1), text(size: 7.5pt, fill: rgb("#475569"))[6 ô có tổng $x + y >= 10$])
        })
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.2pt + rgb("#eab308"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 10pt)[💡 Mô Hình Lưới 36 Ô Cân Đối]\
        #v(0.12em)
        #text(size: 8.2pt)[
          - Gieo $2$ xúc xắc sinh ra $36$ kết quả đồng khả năng.
          - Các ô màu xanh thỏa mãn tổng $>= 10$ gồm $6$ cặp:
            $(4, 6), (5, 5), (6, 4), (5, 6), (6, 5), (6, 6)$.
          - Xác suất trực quan: $P = 6 / 36 = 1 / 6$.
          - Lưới tọa độ giúp tránh bỏ sót hoặc đếm trùng lặp!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: BÀI TẬP LUYỆN TẬP & VẬN DỤNG TỔNG HỢP
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [II. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG IX ÔN TẬP],
  questions: (
    (num: 1, type: "TN", desc: [Gieo 2 xúc xắc tổng số chấm >= 10]),
    (num: 2, type: "TN", desc: [Rút 3 bi có ít nhất 2 bi đỏ]),
    (num: 3, type: "TN", desc: [Lập số có 3 chữ số chia hết cho 3]),
    (num: 4, type: "TN", desc: [Xếp 5 bạn An và Bình cách đúng 1 bạn]),
    (num: 5, type: "TN", desc: [Hai xạ thủ độc lập ít nhất 1 trúng]),
    (num: 6, type: "TN", desc: [Rút thẻ chia hết cho cả 2 và 5]),
    (num: 7, type: "DS", desc: [Đúng/Sai hộp 6 đỏ và 4 xanh]),
    (num: 8, type: "TLN", desc: [Xác suất An và Bình cách đúng 1 bạn]),
    (num: 9, type: "TLN", desc: [Số tam giác vuông từ 10 đỉnh đa giác]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên hai mặt lớn hơn hoặc bằng $10$ bằng:],
  (
    [$1 / 6$],
    [$5 / 36$],
    [$7 / 36$],
    [$1 / 4$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 32A — Xác Suất Tổng Số Chấm Lớn Hơn Hoặc Bằng 10",
  loigiai: [
    Không gian mẫu: $|Omega| = 6 times 6 = 36$.\
    Các cặp có tổng $>= 10$: $(4, 6), (5, 5), (6, 4), (5, 6), (6, 5), (6, 6) ==> |A| = 6$.\
    Xác suất: $P(A) = 6 / 36 = 1 / 6$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Một hộp có $6$ viên bi đỏ và $4$ viên bi xanh. Lấy ngẫu nhiên đồng thời $3$ viên bi. Xác suất để có ít nhất hai viên bi đỏ bằng:],
  (
    [$2 / 3$],
    [$1 / 2$],
    [$7 / 12$],
    [$5 / 12$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 32A — Lấy Bi Có Ít Nhất Hai Viên Cùng Màu",
  loigiai: [
    Không gian mẫu: $|Omega| = C_(10)^3 = 120$.\
    Lấy ít nhất $2$ đỏ có $2$ trường hợp: $2$ đỏ $1$ xanh hoặc $3$ đỏ.\
    Số cách chọn: $|A| = C_6^2 times C_4^1 + C_6^3 = 15 times 4 + 20 = 80$.\
    Xác suất: $P(A) = 80 / 120 = 2 / 3$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ tập $S = {1, 2, 3, 4, 5, 6}$, lập ngẫu nhiên số tự nhiên gồm $3$ chữ số đôi một khác nhau. Xác suất số được lập chia hết cho $3$ là:],
  (
    [$2 / 5$],
    [$1 / 3$],
    [$3 / 10$],
    [$1 / 2$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 32A — Lập Số Chia Hết Cho Ba Dùng Số Dư Tổ Hợp",
  loigiai: [
    Không gian mẫu: $|Omega| = A_6^3 = 120$.\
    Chia các số thành $3$ nhóm dư: $D_0 = {3, 6}, D_1 = {1, 4}, D_2 = {2, 5}$.\
    Chọn $1$ số từ mỗi nhóm: có $2 times 2 times 2 = 8$ bộ; mỗi bộ tạo $3! = 6$ số: $|A| = 8 times 6 = 48$.\
    Xác suất: $P(A) = 48 / 120 = 2 / 5$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Xếp ngẫu nhiên $5$ bạn An, Bình, Cường, Dũng, Hoa thành hàng ngang. Xác suất để An và Bình đứng cách nhau đúng $1$ bạn bằng:],
  (
    [$3 / 10$],
    [$1 / 5$],
    [$2 / 5$],
    [$1 / 10$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 32A — Vị Trí Tương Đối Của Hai Bạn Trong Hàng Ngang",
  loigiai: [
    Không gian mẫu: $|Omega| = 5! = 120$.\
    Các cặp vị trí cách nhau đúng $1$ chỗ cho An và Bình: $(1, 3), (2, 4), (3, 5)$ ($3$ cặp).\
    An và Bình có $2!$ cách hoán vị; $3$ bạn còn lại có $3!$ cách xếp: $|A| = 3 times 2! times 3! = 36$.\
    Xác suất: $P(A) = 36 / 120 = 3 / 10$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Hai xạ thủ độc lập cùng bắn vào bia với xác suất bắn trúng lần lượt là $0.8$ và $0.7$. Xác suất để có ít nhất một xạ thủ bắn trúng bia là:],
  (
    [$0.94$],
    [$0.56$],
    [$0.86$],
    [$0.90$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 32A — Xác Suất Bắn Trúng Bia Biến Cố Độc Lập",
  loigiai: [
    Xét biến cố đối $overline(A)$: "Cả hai xạ thủ đều bắn trượt".\
    Xác suất bắn trượt của xạ thủ $1$ là $1 - 0.8 = 0.2$; của xạ thủ $2$ là $1 - 0.7 = 0.3$.\
    Vì hai xạ thủ bắn độc lập: $P(overline(A)) = 0.2 times 0.3 = 0.06$.\
    Xác suất cần tìm: $P(A) = 1 - 0.06 = 0.94$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Một hộp có $50$ tấm thẻ đánh số từ $1$ đến $50$. Rút ngẫu nhiên $1$ tấm thẻ. Xác suất để số ghi trên thẻ chia hết cho cả $2$ và $5$ bằng:],
  (
    [$1 / 10$],
    [$1 / 5$],
    [$3 / 10$],
    [$1 / 25$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 32A — Số Chia Hết Cho Cả Hai Số Trong Hộp Thẻ",
  loigiai: [
    Số chia hết cho cả $2$ và $5$ là số chia hết cho $10$.\
    Trong tập ${1, 2, ..., 50}$, các số chia hết cho $10$ là: ${10, 20, 30, 40, 50}$ (gồm $5$ số).\
    Xác suất: $P = 5 / 50 = 1 / 10$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Một hộp chứa $6$ viên bi đỏ và $4$ viên bi xanh. Lấy ngẫu nhiên đồng thời $3$ viên bi từ hộp. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Số phần tử của không gian mẫu là $C_(10)^3 = 120$.], "true": true),
    (body: [Xác suất lấy được $3$ viên bi màu đỏ là $1 / 6$.], "true": true),
    (body: [Xác suất lấy được ít nhất $2$ viên bi màu đỏ là $2 / 3$.], "true": true),
    (body: [Xác suất lấy được $3$ viên bi cùng màu là $1 / 2$.], "true": false),
  ),
  num: 7,
  de: "Đề 32A — Khảo Sát Toàn Diện Lấy Bi Từ Hộp",
  loigiai: [
    - a) *Đ:* Không gian mẫu $|Omega| = C_(10)^3 = 120$.
    - b) *Đ:* Chọn $3$ đỏ: $C_6^3 = 20 ==> P = 20 / 120 = 1 / 6$.
    - c) *Đ:* Ít nhất $2$ đỏ: $C_6^2 times C_4^1 + C_6^3 = 80 ==> P = 80 / 120 = 2 / 3$.
    - d) *S:* Cùng màu: $C_6^3 + C_4^3 = 24 ==> P = 24 / 120 = 1 / 5 != 1 / 2$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Xếp ngẫu nhiên $5$ bạn học sinh (trong đó có An và Bình) thành hàng ngang. Tính xác suất để An và Bình đứng cách nhau đúng $1$ bạn (dưới dạng phân số tối giản $a / b$).],
  "3/10",
  num: 8,
  de: "Đề 32A — Tính Xác Suất An Và Bình Cách Nhau Một Bạn",
  loigiai: [
    1. Không gian mẫu: $|Omega| = 5! = 120$.\
    2. Các cặp vị trí cách nhau $1$ bạn: $(1, 3), (2, 4), (3, 5)$ ($3$ cặp).\
    3. Hoán vị An và Bình: $2! = 2$ cách; xếp $3$ bạn còn lại: $3! = 6$ cách.\
    4. Số cách xếp thuận lợi: $|A| = 3 times 2 times 6 = 36 ==> P = 36 / 120 = 3 / 10$.\
    5. Đáp số: *$3/10$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho đa giác đều có $10$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $10$ đỉnh của đa giác. Có bao nhiêu tam giác vuông được tạo thành?],
  "40",
  num: 9,
  de: "Đề 32A — Đếm Số Tam Giác Vuông Từ Đa Giác Đều Mười Đỉnh",
  loigiai: [
    1. Đa giác đều $10$ đỉnh nội tiếp đường tròn có $10 / 2 = 5$ đường kính qua tâm.\
    2. Mỗi tam giác vuông nội tiếp đường tròn nhận một đường kính làm cạnh huyền.\
    3. Với mỗi đường kính, chọn $1$ đỉnh trong $10 - 2 = 8$ đỉnh còn lại để tạo tam giác vuông.\
    4. Tổng số tam giác vuông tạo thành là: $N = 5 times 8 = 40$.\
    5. Đáp số: *$40$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN III: TỔNG KẾT & CỘT MỐC TOÀN KHÓA TOÁN 10
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [III. Tổng Kết & Cột Mốc Toàn Khóa])

#lt-slide-back(title: "🗺️ Bảng Vàng Tổng Kết 9 Chương Toán 10")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: 8pt,
        row-gutter: 6pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 5pt, radius: 5pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"), size: 8.5pt)[HỌC KỲ I]\
            #v(0.1em)
            #text(size: 7.5pt)[
              - Ch. I: Mệnh đề & Tập hợp\
              - Ch. II: BPT & Hệ BPT bậc nhất\
              - Ch. III: Hệ thức lượng trong tam giác\
              - Ch. IV: Vectơ & Các phép toán\
              - Ch. V: Số đặc trưng mẫu số liệu
            ]
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 5pt, radius: 5pt)[
            #text(weight: "bold", fill: rgb("#a16207"), size: 8.5pt)[HỌC KỲ II (PHẦN 1)]\
            #v(0.1em)
            #text(size: 7.5pt)[
              - Ch. VI: Hàm số, đồ thị & ứng dụng (Tam thức bậc hai, PT quy về bậc hai)\
              - Ch. VII: Phương pháp tọa độ mặt phẳng (Đường thẳng, Đường tròn, Ba đường conic)
            ]
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#22c55e"), inset: 5pt, radius: 5pt)[
            #text(weight: "bold", fill: rgb("#15803d"), size: 8.5pt)[HỌC KỲ II (PHẦN 2)]\
            #v(0.1em)
            #text(size: 7.5pt)[
              - Ch. VIII: Đại số tổ hợp (Quy tắc đếm, Hoán vị, Chỉnh hợp, Tổ hợp, Nhị thức Newton)\
              - Ch. IX: Một số yếu tố xác suất (Xác suất cổ điển Laplace)
            ]
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Toàn Bộ Khóa Học Toán 10!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 88%
    )[
      #text(size: 19pt, weight: "bold", fill: rgb("#15803d"))[🎓 VINH QUANG CHINH PHỤC TOÀN BỘ TOÁN 10!]\
      #v(0.4em)
      #text(size: 10.5pt, fill: rgb("#166534"))[
        Chúc mừng bạn đã hoàn thành xuất sắc toàn bộ $9$ chương của chương trình Toán 10!\
        *Từ Đại số, Hình học tọa độ Oxy, Đại số tổ hợp cho đến Xác suất cổ điển.*\
        Bạn đã xây dựng một nền tảng tư duy toán học kiên cố, sẵn sàng tỏa sáng ở Toán 11!
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
