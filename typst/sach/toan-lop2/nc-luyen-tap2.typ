// ══════════════════════════════════════════════════════════════════════════
// nc-luyen-tap2.typ — Additional Practice Part 2 / Luyện Tập Phần 2
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ══════════════════════════════════════════════════════════════════════════
// ÔN TẬP CUỐI KỲ — END OF TERM COMPREHENSIVE REVIEW
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#4C1D95"), rgb("#6D28D9"), angle: 90deg),
  inset: (x: 20pt, y: 16pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 20pt, weight: "black")[🎯 Ôn Tập Cuối Kỳ — Toàn Diện]
    #v(0.3em)
    #text(fill: rgb("#FDE68A"), size: 14pt)[End of Term — Full Review (All 5 Chapters)]
    #v(0.2em)
    #text(fill: white.transparentize(20%), size: 10pt)[Chương 1–5 / Chapters 1–5]
  ]
]

#v(0.8em)

== Phần 1: Ôn Tập Số Học (Chương 1 & 2)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,

  block(fill: C-CH-NC.at(0).lighten(92%), stroke: (left: 3pt + C-CH-NC.at(0)), inset: 14pt, radius: (right: 8pt))[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(0), weight: "bold")[🧠 Dãy số và quy luật]
    #v(0.4em)
    *1.* 2, 6, 18, 54, \_\_\_\_, \_\_\_\_  (×3) \
    *2.* 64, 32, 16, \_\_\_\_, \_\_\_\_  (÷2) \
    *3.* 0, 1, 3, 6, 10, 15, \_\_\_\_, \_\_\_\_ \
    #text(size: 8.5pt, style: "italic")[(Số tam giác: thêm 1,2,3,...)] \
    *4.* 1, 2, 4, 7, 11, 16, \_\_\_\_, \_\_\_\_ \
    #text(size: 8.5pt, style: "italic")[(Hiệu tăng dần: +1,+2,+3,...)] \
    *5.* Tìm ba số liên tiếp có tổng = 48: \_\_\_\_, \_\_\_\_, \_\_\_\_
  ],

  block(fill: C-CH-NC.at(1).lighten(92%), stroke: (left: 3pt + C-CH-NC.at(1)), inset: 14pt, radius: (right: 8pt))[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(1), weight: "bold")[⚡ Tính nhẩm siêu nhanh]
    #v(0.4em)
    *6.* 347 + 253 = \_\_\_\_ *(gợi ý: 347+253=600)* \
    *7.* 804 − 398 = \_\_\_\_ *(bù số: +2 cả hai)* \
    *8.* 6 × 9 + 5 × 8 = \_\_\_\_ \
    *9.* 125 × 8 = \_\_\_\_ *(125×8=1000)* \
    *10.* 3 × 7 × 4 = \_\_\_\_ *(linh hoạt thứ tự)* \
    *11.* 99 × 6 = \_\_\_\_ *(=(100−1)×6)* \
    *12.* 48 ÷ 4 + 35 ÷ 7 = \_\_\_\_
  ],
)

#v(0.8em)

== Phần 2: Ôn Tập Giải Toán (Chương 3)

*Bài toán bar model — vẽ sơ đồ và giải:*

#block(fill: C-CH-NC.at(2).lighten(92%), stroke: (left: 3pt + C-CH-NC.at(2)), inset: 14pt, radius: (right: 8pt))[
  #set par(first-line-indent: 0em)
  Lớp 2A có 35 học sinh. Số học sinh giỏi chiếm một phần ba lớp. Số học sinh khá nhiều hơn số học sinh giỏi là 5. Còn lại là học sinh trung bình. Tìm số học sinh mỗi loại.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [*Sơ đồ:* #rect(width: 100%, height: 3.5cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]],
  [*Bài giải:* #dong-viet(n: 5)],
)

#v(0.8em)

== Phần 3: Ôn Tập Hình Học (Chương 4)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    *Đếm hình và tính toán:*
    #canvas(length: 1cm, {
      import draw: *
      // 3x3 grid
      for x in range(4) {
        line((x, 0), (x, 3), stroke: 1.5pt + C-CH-NC.at(3))
      }
      for y in range(4) {
        line((0, y), (3, y), stroke: 1.5pt + C-CH-NC.at(3))
      }
      // Diagonal in some squares
      line((0, 3), (1, 2), stroke: 1.5pt + C-ORANGE)
      line((1, 3), (2, 2), stroke: 1.5pt + C-ORANGE)
      line((2, 2), (3, 3), stroke: 1.5pt + C-ORANGE)
    })
    Số ô vuông nhỏ 1×1: \_\_\_\_ \
    Số ô vuông 2×2: \_\_\_\_ \
    Số ô vuông 3×3: \_\_\_\_ \
    Tổng hình vuông: \_\_\_\_
  ],
  [
    *Bài toán diện tích thực tế:*

    Vườn cây của bà gồm 2 mảnh: Mảnh 1 hình chữ nhật dài 12m, rộng 8m. Mảnh 2 hình vuông cạnh 5m. Hai mảnh có chung một cạnh bên.

    *a)* Tổng diện tích = \_\_\_\_ m² \
    *b)* Nếu dùng hàng rào bao quanh *toàn bộ* (trừ cạnh chung nằm bên trong), cần bao nhiêu mét? \
    Chu vi = \_\_\_\_ m \
    #dong-viet(n: 2)
  ],
)

#v(0.8em)

== Phần 4: Ôn Tập Tư Duy (Chương 5)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    *Giải mật mã:*
    Biết A, B, C là các chữ số khác nhau:

    #block(fill: C-CH-NC.at(4).lighten(92%), inset: 12pt, radius: 8pt)[
      #align(center)[
        #text(weight: "bold", size: 13pt)[
          A × B = C B \
          và A + B + C = 15
        ]
      ]
    ]
    Tìm A, B, C: \
    \_\_\_ × \_\_\_ = \_\_\_\_ → A=\_\_\_, B=\_\_\_, C=\_\_\_
    #dong-viet(n: 2)
  ],
  [
    *Đếm tổ hợp:*

    *a)* Từ 5 màu tô 2 cạnh của tam giác cân (không trùng nhau). Có bao nhiêu cách? \
    \_\_\_\_ × \_\_\_\_ = \_\_\_\_ cách

    *b)* Xếp 4 cuốn sách khác nhau lên kệ. Có bao nhiêu cách? \
    4! = 4 × 3 × 2 × 1 = \_\_\_\_

    *c)* Chọn 2 trong 5 học sinh làm đội trưởng và đội phó. Có bao nhiêu cách? \
    \_\_\_\_ × \_\_\_\_ = \_\_\_\_ cách
  ],
)

// ══════════════════════════════════════════════════════════════════════════
// BẢNG TỔNG HỢP KỸ NĂNG — SKILL SUMMARY CHART
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[📊 Bảng Tổng Hợp Kiến Thức Quyển II]
    #v(0.2em)
    #text(fill: rgb("#FCD34D"), size: 12pt)[Knowledge Summary — Volume II]
  ]
]

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  block(fill: C-CH-NC.at(0).lighten(90%), stroke: 1.5pt + C-CH-NC.at(0), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(0), weight: "bold", size: 11pt)[🧠 Chương 1: Tư Duy Số Học]
    #v(0.4em)
    #set text(size: 9.5pt)
    ✅ Dãy số cộng/trừ/nhân/chia \
    ✅ Dãy số Fibonacci (1,1,2,3,5,8,13,...) \
    ✅ Ô vuông ma thuật 3×3 (tổng = 3 × tâm) \
    ✅ Số bí ẩn — tìm số theo điều kiện \
    ✅ Tổng chữ số và chia hết cho 3 \
    ✅ So sánh bằng suy luận không tính
  ],

  block(fill: C-CH-NC.at(1).lighten(90%), stroke: 1.5pt + C-CH-NC.at(1), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(1), weight: "bold", size: 11pt)[⚡ Chương 2: Tính Nhẩm]
    #v(0.4em)
    #set text(size: 9.5pt)
    ✅ Cộng bằng làm tròn rồi điều chỉnh \
    ✅ Trừ bằng phương pháp bù \
    ✅ ×9 trick: n×10 − n \
    ✅ ×11 trick: n×10 + n \
    ✅ Chia có dư: a = b×q + r (0 ≤ r < b) \
    ✅ Thứ tự thực hiện: ngoặc → × ÷ → + −
  ],

  block(fill: C-CH-NC.at(2).lighten(90%), stroke: 1.5pt + C-CH-NC.at(2), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(2), weight: "bold", size: 11pt)[🎯 Chương 3: Chiến Lược Giải Toán]
    #v(0.4em)
    #set text(size: 9.5pt)
    ✅ *Vẽ sơ đồ* (Singapore bar model) \
    ✅ *Lập bảng* (Make a table) \
    ✅ *Làm ngược* (Work backwards) \
    ✅ *Thử và điều chỉnh* (Guess & check) \
    ✅ *Tìm quy luật* (Look for patterns) \
    ✅ Chọn chiến lược phù hợp từng bài
  ],

  block(fill: C-CH-NC.at(3).lighten(90%), stroke: 1.5pt + C-CH-NC.at(3), inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(3), weight: "bold", size: 11pt)[📐 Chương 4: Hình Học]
    #v(0.4em)
    #set text(size: 9.5pt)
    ✅ Đếm hình trong hình (tam giác, hình vuông) \
    ✅ Trục đối xứng (vuông=4, chữ nhật=2, tròn=∞) \
    ✅ Diện tích bằng đếm ô vuông \
    ✅ Chu vi = tổng các cạnh \
    ✅ Cắt ghép hình không đổi diện tích \
    ✅ Phân biệt chu vi và diện tích
  ],
)

#v(0.8em)

#block(fill: C-CH-NC.at(4).lighten(90%), stroke: 1.5pt + C-CH-NC.at(4), inset: 14pt, radius: 10pt)[
  #set par(first-line-indent: 0em)
  #text(fill: C-CH-NC.at(4), weight: "bold", size: 11pt)[🏆 Chương 5: Thử Thách Tư Duy]
  #v(0.4em)
  #set text(size: 9.5pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    [
      ✅ *Toán mật mã* (mỗi chữ cái = 1 chữ số) \
      ✅ *Lưới logic 4×4* (Sudoku cơ bản) \
      ✅ *Nguyên lý nhân* (m cách × n cách) \
      ✅ *Hoán vị* n! = n×(n−1)×...×2×1
    ],
    [
      ✅ Bài toán Olympiad nhiều bước \
      ✅ *Bắt tay:* n(n−1)÷2 \
      ✅ Số bình phương: 1,4,9,16,25,... \
      ✅ Số tam giác: 1,3,6,10,15,21,...
    ],
  )
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI TẬP TỔNG HỢP CUỐI NĂM — YEAR-END PRACTICE
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#7F1D1D"), rgb("#991B1B"), angle: 90deg),
  inset: (x: 20pt, y: 16pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 18pt, weight: "black")[🌟 Bài Tập Tổng Hợp — 50 Câu Luyện Tập]
    #v(0.2em)
    #text(fill: rgb("#FDE68A"), size: 12pt)[Year-End Practice — 50 Mixed Problems]
  ]
]

#v(0.8em)

#block(fill: rgb("#FFF7ED"), stroke: 1.5pt + C-GOLD, inset: 10pt, radius: 8pt)[
  #set text(size: 9pt)
  Bộ 50 câu này ôn tập toàn diện tất cả kỹ năng. Làm mỗi ngày 5 câu trong 10 ngày! \
  _This set of 50 problems covers all skills. Do 5 problems per day for 10 days!_
]

#v(0.6em)

#set par(first-line-indent: 0em)

*Nhóm A — Dãy Số và Quy Luật (Câu 1–10)*

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    *1.* Điền: 5, 8, 13, 21, \_\_\_\_, \_\_\_\_ \
    *2.* Điền: 2, 4, 8, 16, \_\_\_\_, \_\_\_\_ \
    *3.* Điền: 100, 91, 83, 76, \_\_\_\_, \_\_\_\_ \
    *4.* Tìm quy luật: 1, 4, 9, 16, 25, \_\_\_\_
  ],
  [
    *5.* Số tiếp theo: 1, 3, 6, 10, 15, \_\_\_\_ \
    *6.* Điền vào: \_, \_, 6, \_, \_, 18 (nhân 3) \
    *7.* Ba số liên tiếp có tổng = 57: \_\_, \_\_, \_\_ \
    *8–10.* Tự tạo 3 dãy số có quy luật khác nhau!
  ],
)

#dong-viet(n: 2)

#v(0.6em)
*Nhóm B — Tính Nhẩm Tốc Độ (Câu 11–20)*

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 8pt,
  [*11.* 9×9=\_\_], [*12.* 8×7=\_\_], [*13.* 6×8=\_\_], [*14.* 7×7=\_\_],
  [*15.* 12×9=\_\_\_], [*16.* 11×11=\_\_\_], [*17.* 99+1=\_\_\_], [*18.* 998+3=\_\_\_],
  [*19.* 1001−2=\_\_\_], [*20.* 500−247=\_\_\_], [], [],
)

#v(0.6em)
*Nhóm C — Giải Toán (Câu 21–30)*

*21.* Lan có 120.000đ. Mua 3 quyển sách hết 75.000đ. Còn lại mua được bao nhiêu bút chì giá 5.000đ/cái?
#dong-viet(n: 2)

*22.* Tuổi bố gấp 4 lần tuổi con. Sau 5 năm tổng tuổi hai bố con là 59. Tính tuổi mỗi người hiện nay.
#dong-viet(n: 3)

*23.* 7 bạn cùng uống nước: mỗi người uống 2 ly. Cô bán nước tính tiền 126.000đ. Giá 1 ly nước là bao nhiêu?
#dong-viet(n: 2)

*24.* Có 5 loại quả: táo, lê, cam, nho, xoài. Muốn chọn 2 loại để làm sinh tố, có bao nhiêu cách?
#dong-viet(n: 2)

*25.* Xếp ngăn kéo 3 hàng, mỗi hàng 4 ngăn. Cần dán nhãn mỗi ngăn một màu: 3 màu liền nhau trên cùng hàng không trùng. Có bao nhiêu cách dán hàng đầu?
#dong-viet(n: 2)

*26–30.* Vẽ hình và giải: #dong-viet(n: 6)

#v(0.6em)
*Nhóm D — Hình Học (Câu 31–40)*

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [
    *31.* Một ô vuông cạnh 4cm: diện tích = \_\_\_\_ cm²; chu vi = \_\_\_\_ cm \
    *32.* Chữ nhật dài 9cm, rộng 5cm: DT = \_\_\_\_; CV = \_\_\_\_ \
    *33.* Tăng mỗi cạnh hình vuông lên 2 lần → diện tích tăng \_\_\_\_ lần \
    *34.* Hình gồm 2 hình vuông cạnh 3cm ghép cạnh nhau: DT=\_\_\_\_ ; CV=\_\_\_\_
  ],
  [
    *35.* Đếm hình vuông trong lưới 4×4: \_\_\_\_ hình \
    *36.* Hình tam giác đều chia thành 4 tam giác nhỏ bằng nhau. Đếm tổng tam giác (các loại): \_\_\_\_ \
    *37–40.* Vẽ các hình có diện tích 12 ô nhưng chu vi khác nhau (tìm 4 hình khác nhau):
    #rect(width: 100%, height: 4cm, stroke: 1pt + C-LIGHT, fill: white, radius: 4pt)[]
  ],
)

#v(0.6em)
*Nhóm E — Thử Thách Tư Duy (Câu 41–50)*

*41.* Mật mã: AB + BA = 121. Tìm A và B. \
\_\_\_\_, \_\_\_\_ → kiểm tra: \_\_\_\_ + \_\_\_\_ = 121 ✓?

*42.* Sudoku 4×4: điền số 1–4 không trùng hàng, cột, ô 2×2:

#grid(
  columns: (auto, 1fr),
  gutter: 16pt,
  table(
    columns: (1.5cm, 1.5cm, 1.5cm, 1.5cm),
    rows: (1.3cm, 1.3cm, 1.3cm, 1.3cm),
    align: center + horizon,
    stroke: (x, y) => (
      left: if x == 0 or x == 2 { 2pt + C-DARK } else { 0.5pt + C-LIGHT },
      top: if y == 0 or y == 2 { 2pt + C-DARK } else { 0.5pt + C-LIGHT },
      right: if x == 3 { 2pt + C-DARK } else { none },
      bottom: if y == 3 { 2pt + C-DARK } else { none },
    ),
    [4], [], [], [1],
    [], [3], [2], [],
    [], [2], [3], [],
    [1], [], [], [4],
  ),
  [
    *43.* Từ số 1, 2, 3, 4, 5 lấy ra 3 số bất kỳ, tổng nhỏ nhất = \_\_\_\_, tổng lớn nhất = \_\_\_\_ \
    *44.* Có bao nhiêu số có 3 chữ số từ tập {1,2,3} (dùng lặp lại)? \_\_\_ × \_\_\_ × \_\_\_ = \_\_\_\_ \
    *45.* Bài toán: 3 đường thẳng tạo ra nhiều nhất bao nhiêu điểm giao nhau? \_\_\_\_ \
    4 đường thẳng? \_\_\_\_. n đường thẳng? Công thức: \_\_\_\_\_\_\_
  ],
)

*46–50.* Bài toán sáng tạo — tự đặt đề:
#dong-viet(n: 8)

// ══════════════════════════════════════════════════════════════════════════
// GÓC ĐỌC THÊM — MATH READING CORNER
// ══════════════════════════════════════════════════════════════════════════
#pagebreak(weak: true)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#064E3B"), rgb("#047857"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 17pt, weight: "black")[📖 Góc Đọc Thêm — Math Stories]
    #v(0.2em)
    #text(fill: rgb("#FDE68A"), size: 12pt)[Fun Mathematical Stories and History]
  ]
]

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  block(fill: C-TEAL.lighten(88%), stroke: 1.5pt + C-TEAL, inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-TEAL, weight: "bold", size: 11pt)[🌟 Câu Chuyện: Gauss Và Bài Toán Lớp 3]
    #v(0.5em)
    #set text(size: 9.5pt)
    Năm 1787, giáo viên của Gauss (10 tuổi) ra bài: "Tính tổng 1+2+3+...+100". Ông thầy nghĩ học sinh sẽ mất hàng giờ, nhưng Gauss trả lời sau vài giây:

    #v(0.3em)
    #block(fill: white, inset: 10pt, radius: 6pt)[
      #align(center)[
        1 + 2 + 3 + ... + 100 \
        100 + 99 + 98 + ... + 1 \
        #line(length: 100%, stroke: 1pt + C-DARK) \
        101 × 100 cặp = 10.100 \
        Chia 2 = *5.050*
      ]
    ]
    #v(0.3em)
    Gauss sau này trở thành một trong những nhà toán học vĩ đại nhất. Ông đã dùng *quy luật đối xứng*!

    *Thử áp dụng:* 1+2+3+...+10 = \_\_\_\_
  ],

  block(fill: C-PURPLE.lighten(88%), stroke: 1.5pt + C-PURPLE, inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-PURPLE, weight: "bold", size: 11pt)[🔢 Dãy Fibonacci Trong Thiên Nhiên]
    #v(0.5em)
    #set text(size: 9.5pt)
    Nhà toán học Fibonacci (Ý, năm 1202) tìm ra dãy số:

    #block(fill: white, inset: 8pt, radius: 6pt)[
      *1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...*
    ]

    Quy tắc: Mỗi số = tổng 2 số trước.

    *Kỳ diệu:* Dãy Fibonacci xuất hiện ở khắp nơi!
    - Cánh hoa (hướng dương: 34 và 55 cánh)
    - Vỏ ốc xoắn ốc
    - Ngón tay và đốt xương ngón tay
    - Vảy dứa và quả thông

    *Tiếp dãy:* 1,1,2,3,5,8,13,21, \_\_\_\_, \_\_\_\_

    *Tỉ số:* 8÷5=1.6; 13÷8=1.625; 21÷13≈1.615 → tỉ số gần *1.618* (Tỉ Vàng / Golden Ratio)!
  ],
)

#v(0.8em)

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  block(fill: C-ORANGE.lighten(88%), stroke: 1.5pt + C-ORANGE, inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: C-ORANGE, weight: "bold", size: 11pt)[🧩 Câu Đố Cổ Điển: Tháp Hà Nội]
    #v(0.5em)
    #set text(size: 9.5pt)
    Có 3 cột và n đĩa xếp từ lớn đến nhỏ trên cột 1. Mục tiêu: chuyển tất cả sang cột 3.

    *Quy tắc:* Mỗi lần di chuyển 1 đĩa; đĩa lớn không bao giờ đặt lên đĩa nhỏ.

    *Số lần di chuyển ít nhất:*
    - 1 đĩa: 1 lần
    - 2 đĩa: 3 lần
    - 3 đĩa: 7 lần
    - n đĩa: 2ⁿ − 1 lần

    *Điền:* 4 đĩa → \_\_\_\_\_ lần; 5 đĩa → \_\_\_\_ lần

    *Thú vị:* Nếu có 64 đĩa, cần 2⁶⁴ − 1 ≈ *18 tỉ tỉ* lần!
  ],

  block(fill: C-GOLD.lighten(80%), stroke: 1.5pt + C-GOLD, inset: 14pt, radius: 10pt)[
    #set par(first-line-indent: 0em)
    #text(fill: rgb("#92400E"), weight: "bold", size: 11pt)[🏆 Toán Olympiad Lịch Sử]
    #v(0.5em)
    #set text(size: 9.5pt)
    *Bài toán nổi tiếng — Con ếch và giếng:*

    Con ếch ở đáy giếng sâu 30m. Mỗi ngày nó nhảy lên được 3m, nhưng ban đêm lại tụt xuống 2m.

    *Câu hỏi:* Sau bao nhiêu ngày con ếch leo lên miệng giếng?

    #dong-viet(n: 3)

    *Mở rộng:* Nếu giếng sâu 10m, ngày leo 4m, đêm tụt 3m → bao nhiêu ngày?

    #dong-viet(n: 2)

    *Đáp án bài 30m:* 28 ngày (ngày 28: đã ở độ cao 27m, nhảy lên 3m = 30m thoát ra!)
  ],
)

#v(0.8em)

#block(
  fill: gradient.linear(rgb("#FFF9E6"), rgb("#FFF3CD"), angle: 90deg),
  stroke: 1.5pt + C-GOLD,
  inset: 16pt,
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(fill: C-GOLD, weight: "bold", size: 12pt)[💡 Lời Khuyên Cho Học Sinh Toán Nâng Cao]
    #text(fill: rgb("#92400E"), size: 10pt, style: "italic")[ \/ Advice for Advanced Math Students]
  ]
  #v(0.4em)
  #set text(size: 9.5pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      🎯 *Đọc kỹ đề* — Gạch chân các dữ kiện quan trọng \
      📝 *Vẽ hình* — Hình ảnh giúp hiểu bài nhanh hơn \
      🔍 *Thử đơn giản hóa* — Bắt đầu bằng trường hợp nhỏ \
      🧩 *Tìm quy luật* — Quan sát, so sánh, tổng quát hóa
    ],
    [
      ✅ *Kiểm tra lại* — Luôn thử lại đáp án vào đề bài \
      🌟 *Không bỏ cuộc* — Bài khó cần kiên nhẫn và sáng tạo \
      📚 *Đọc thêm* — Toán là môn khám phá không có giới hạn \
      🤝 *Thảo luận* — Trao đổi cách giải với bạn bè
    ],
  )
]
