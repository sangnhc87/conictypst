#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Thực Hành Tính Xác Suất Cổ Điển],
  subtitle: [TOÁN 10 — CHƯƠNG IX: MÔ HÌNH HÓA XÁC SUẤT, BÀI TOÁN THI CỬ, RÚT BÀI & PHÂN BỔ THỰC TẾ],
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
// PHẦN I: PHƯƠNG PHÁP MÔ HÌNH HÓA XÁC SUẤT
// ════════════════════════════════════════════════
#lt-section-link("sec-phuong-phap", "🧭", [I. Phương Pháp Mô Hình Hóa & Chiến Thuật Giải])

#lt-slide-back(title: "🧭 1. Ba Chiến Thuật Đếm Thuận Lợi Cốt Lõi")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[1. Chiến Thuật Biến Cố Đối $overline(A)$]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Dấu hiệu nhận biết:* "Có ít nhất một", "ít nhất hai", hoặc tính trực tiếp có quá nhiều trường hợp phức tạp.
          - *Công thức:* $P(A) = 1 - P(overline(A))$.
          - *Ví dụ:* Ít nhất 1 linh kiện hỏng $<==>$ Biến cố đối là *"Cả 3 linh kiện đều tốt"*.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.2pt + rgb("#eab308"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 10pt)[2. Kỹ Thuật Buộc Phần Tử & Vách Ngăn]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Buộc phần tử (Đứng cạnh nhau):* Xem các đối tượng đứng cạnh nhau như $1$ phần tử kép (có hoán vị bên trong).
          - *Vách ngăn (Không đứng cạnh nhau):* Xếp nhóm đối tượng thứ nhất trước, tạo ra các khe trống rồi xếp nhóm thứ hai vào.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🃏 2. Mô Hình Bộ Bài Tây 52 Lá Tiêu Chuẩn (CeTZ)")[
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let suits = ("♠", "♥", "♦", "♣")
          let cols = (black, rgb("#dc2626"), rgb("#dc2626"), black)
          for i in range(4) {
            rect((i * 1.15, 0), (i * 1.15 + 0.95, 1.35), stroke: 1pt + rgb("#94a3b8"), fill: rgb("#f8fafc"), radius: 0.08)
            content((i * 1.15 + 0.25, 1.1), text(fill: cols.at(i), weight: "bold", size: 9pt, [A]))
            content((i * 1.15 + 0.48, 0.65), text(fill: cols.at(i), size: 15pt, suits.at(i)))
          }
          content((2.0, -0.3), text(size: 8pt, fill: rgb("#475569"))[Bộ 4 lá Át (Tứ quý A)])
        })
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.2pt + rgb("#8b5cf6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10pt)[📊 Cấu Trúc Bộ Bài 52 Lá]\
        #v(0.12em)
        #text(size: 8.2pt)[
          - *4 chất:* Bích (♠), Cơ (♥), Rô (♦), Tép/Chuồn (♣). Mỗi chất có đúng $13$ lá.
          - *13 giá trị:* $2, 3, dots, 10, J, Q, K, A$.
          - Tứ quý: $4$ lá có cùng giá trị số (có $13$ bộ tứ quý).
          - Rút $4$ lá bất kỳ: $|Omega| = C_(52)^4 = 270.725$ khả năng.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: BÀI TẬP LUYỆN TẬP & VẬN DỤNG THỰC TẾ
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [II. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG IX BÀI 2],
  questions: (
    (num: 1, type: "TN", desc: [Rút 4 lá bài được bộ tứ quý]),
    (num: 2, type: "TN", desc: [Thi vấn đáp ít nhất 1 câu bài tập]),
    (num: 3, type: "TN", desc: [Gieo 3 xúc xắc ít nhất 2 cùng chấm]),
    (num: 4, type: "TN", desc: [Xếp 4 nam 4 nữ xen kẽ nhau]),
    (num: 5, type: "TN", desc: [Rút 2 hộp bi được 2 bi cùng màu]),
    (num: 6, type: "TN", desc: [Chia 10 bạn An và Bình cùng nhóm]),
    (num: 7, type: "DS", desc: [Đúng/Sai rút 4 lá bài từ bộ 52 lá]),
    (num: 8, type: "TLN", desc: [Xác suất xếp xen kẽ hàng dọc]),
    (num: 9, type: "TLN", desc: [Xác suất thi vấn đáp tối giản]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Rút ngẫu nhiên đồng thời $4$ lá bài từ bộ bài tú lơ khơ tiêu chuẩn gồm $52$ lá. Xác suất để rút được một bộ tứ quý (gồm $4$ lá bài có cùng giá trị) bằng:],
  (
    [$1 / 20.825$],
    [$1 / 270.725$],
    [$13 / 270.725$],
    [$4 / 20.825$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 31A — Xác Suất Rút Được Bộ Tứ Quý Trong Bộ Bài Tây",
  loigiai: [
    Không gian mẫu: $|Omega| = C_(52)^4 = 270.725$.\
    Bộ bài có $13$ giá trị số, mỗi giá trị có đúng $C_4^4 = 1$ bộ tứ quý: $|A| = 13 times 1 = 13$.\
    Xác suất: $P(A) = 13 / 270.725 = 1 / 20.825$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Ngân hàng câu hỏi có $20$ câu (gồm $12$ lý thuyết và $8$ bài tập). Thí sinh rút ngẫu nhiên $3$ câu. Xác suất rút được ít nhất một câu bài tập là:],
  (
    [$46 / 57$],
    [$11 / 57$],
    [$35 / 57$],
    [$2 / 3$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 31A — Bài Toán Rút Đề Thi Vấn Đáp Dùng Biến Cố Đối",
  loigiai: [
    Không gian mẫu: $|Omega| = C_(20)^3 = 1.140$.\
    Biến cố đối $overline(A)$: "Cả $3$ câu rút được đều là lý thuyết": $|overline(A)| = C_(12)^3 = 220$.\
    Xác suất: $P(A) = 1 - 220 / 1.140 = 1 - 11 / 57 = 46 / 57$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Gieo đồng thời $3$ con xúc xắc cân đối và đồng chất. Xác suất để có ít nhất hai con xúc xắc xuất hiện cùng số chấm bằng:],
  (
    [$4 / 9$],
    [$5 / 9$],
    [$1 / 2$],
    [$7 / 18$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 31A — Gieo Ba Con Xúc Xắc Đồng Khả Năng",
  loigiai: [
    Không gian mẫu gieo $3$ xúc xắc: $|Omega| = 6^3 = 216$.\
    Biến cố đối $overline(A)$: "Cả $3$ con xúc xắc xuất hiện số chấm đôi một khác nhau":\
    $|overline(A)| = A_6^3 = 6 times 5 times 4 = 120$.\
    Xác suất: $P(A) = 1 - 120 / 216 = 1 - 5 / 9 = 4 / 9$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Xếp ngẫu nhiên $4$ bạn nam và $4$ bạn nữ thành một hàng dọc gồm $8$ người. Xác suất để các bạn nam và nữ đứng xen kẽ nhau từng người một bằng:],
  (
    [$1 / 35$],
    [$2 / 35$],
    [$1 / 70$],
    [$1 / 140$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 31A — Xác Suất Nam Nữ Đứng Xen Kẽ Từng Người Một",
  loigiai: [
    Không gian mẫu xếp $8$ người: $|Omega| = 8! = 40.320$.\
    Có 2 dạng hàng xen kẽ: (Nam - Nữ) hoặc (Nữ - Nam).\
    Mỗi dạng có $4!$ cách xếp nam và $4!$ cách xếp nữ: $|A| = 2 times 4! times 4! = 1.152$.\
    Xác suất: $P(A) = 1.152 / 40.320 = 1 / 35$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Hộp I chứa $4$ bi trắng và $6$ bi đen. Hộp II chứa $5$ bi trắng và $5$ bi đen. Lấy ngẫu nhiên từ mỗi hộp ra $1$ bi. Xác suất để hai bi lấy ra cùng màu là:],
  (
    [$1 / 2$],
    [$2 / 5$],
    [$3 / 5$],
    [$7 / 10$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 31A — Lấy Bi Độc Lập Từ Hai Hộp Riêng Biệt",
  loigiai: [
    Không gian mẫu: $|Omega| = 10 times 10 = 100$.\
    Hai bi cùng màu có 2 trường hợp: Cùng trắng ($4 times 5 = 20$) hoặc Cùng đen ($6 times 5 = 30$).\
    Số kết quả thuận lợi: $|A| = 20 + 30 = 50$.\
    Xác suất: $P(A) = 50 / 100 = 1 / 2$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Chia ngẫu nhiên $10$ học sinh (trong đó có An và Bình) thành $2$ nhóm học tập đều nhau, mỗi nhóm $5$ bạn. Xác suất để An và Bình cùng một nhóm là:],
  (
    [$4 / 9$],
    [$5 / 9$],
    [$1 / 2$],
    [$3 / 8$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 31A — Chia Nhóm Ngẫu Nhiên Hai Học Sinh Cùng Nhóm",
  loigiai: [
    Xếp An vào trước một nhóm bất kỳ. Nhóm này còn $4$ chỗ trống trong tổng số $9$ bạn còn lại.\
    Xác suất để Bình cũng được chọn vào cùng nhóm với An là:\
    $P = C_8^3 / C_9^4 = 56 / 126 = 4 / 9$. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Xét phép thử rút ngẫu nhiên đồng thời $4$ lá bài từ bộ bài tú lơ khơ tiêu chuẩn gồm $52$ lá. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Số phần tử của không gian mẫu là $C_(52)^4 = 270.725$.], "true": true),
    (body: [Số cách rút được $4$ lá bài có cùng một chất là $2.860$.], "true": true),
    (body: [Số cách rút được một bộ tứ quý là $13$ cách.], "true": true),
    (body: [Xác suất rút được $4$ lá bài thuộc $4$ chất khác nhau là $1 / 2$.], "true": false),
  ),
  num: 7,
  de: "Đề 31A — Khảo Sát Toàn Diện Phép Thử Rút Bài Tây",
  loigiai: [
    - a) *Đ:* Không gian mẫu $|Omega| = C_(52)^4 = 270.725$.
    - b) *Đ:* Chọn $1$ trong $4$ chất rồi chọn $4$ lá: $4 times C_(13)^4 = 4 times 715 = 2.860$.
    - c) *Đ:* Có $13$ giá trị số từ Át đến K, mỗi giá trị có đúng $1$ bộ tứ quý.
    - d) *S:* Thuận lợi: $13^4 = 28.561 ==> P = 28.561 / 270.725 approx 0.1055 != 1 / 2$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Xếp ngẫu nhiên $4$ bạn nam và $4$ bạn nữ thành một hàng dọc. Tính xác suất để các bạn nam và nữ đứng xen kẽ nhau (kết quả viết dưới dạng phân số tối giản $a / b$).],
  "1/35",
  num: 8,
  de: "Đề 31A — Tính Xác Suất Nam Nữ Đứng Xen Kẽ",
  loigiai: [
    1. Không gian mẫu: $|Omega| = 8! = 40.320$.\
    2. Hai cách xếp xen kẽ: Bắt đầu bằng nam hoặc bắt đầu bằng nữ ($2$ dạng).\
    3. Số cách xếp thuận lợi: $|A| = 2 times 4! times 4! = 2 times 24 times 24 = 1.152$.\
    4. Xác suất: $P = 1.152 / 40.320 = 1 / 35$.\
    5. Đáp số: *$1/35$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Rút $3$ câu từ ngân hàng $20$ câu (gồm $12$ lý thuyết, $8$ bài tập). Tính xác suất rút được ít nhất một câu bài tập (kết quả viết dưới dạng phân số tối giản $a / b$).],
  "46/57",
  num: 9,
  de: "Đề 31A — Tính Xác Suất Rút Đề Thi Vấn Đáp",
  loigiai: [
    1. Không gian mẫu: $|Omega| = C_(20)^3 = 1.140$.\
    2. Xét biến cố đối: Rút $3$ câu toàn lý thuyết: $|overline(A)| = C_(12)^3 = 220$.\
    3. Xác suất biến cố đối: $P(overline(A)) = 220 / 1.140 = 11 / 57$.\
    4. Xác suất cần tìm: $P(A) = 1 - 11 / 57 = 46 / 57$.\
    5. Đáp số: *$46/57$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN III: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [III. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Tổng Kết Kỹ Năng Thực Hành Xác Suất Cổ Điển")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: 10pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"), size: 9.5pt)[1. Dấu Hiệu Đối Ngẫu]\
            #v(0.1em)
            #text(size: 8.2pt)[
              - "Có ít nhất $1$" $==>$ Dùng đối ngẫu: "Không có cái nào".\
              - "Có ít nhất $2$" $==>$ "Không có hoặc chỉ có đúng $1$".
            ]
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"), size: 9.5pt)[2. Kỹ Thuật Độc Lập]\
            #v(0.1em)
            #text(size: 8.2pt)[
              - Phép thử gồm nhiều hành động độc lập $==>$ Nhân số cách chọn của từng hành động để ra $|Omega|$ và $|A|$.
            ]
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#22c55e"), inset: 7pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#15803d"), size: 9.5pt)[3. Cố Định Vị Trí]\
            #v(0.1em)
            #text(size: 8.2pt)[
              - Bài toán chia nhóm hoặc xếp bàn tròn: Cố định một người mốc, rồi tính xác suất người kia vào vị trí tương ứng.
            ]
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 27!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 18pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 27!]\
      #v(0.4em)
      #text(size: 10.5pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn kỹ năng mô hình hóa bài toán xác suất thực tế:\
        *Bài toán rút bài Tây, Ngân hàng đề thi, Xếp chỗ ngồi & Chia nhóm ngẫu nhiên.*
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
