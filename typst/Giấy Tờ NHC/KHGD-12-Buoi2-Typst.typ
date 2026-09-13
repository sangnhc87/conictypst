// ==============================================================================
// PHÂN PHỐI CHƯƠNG TRÌNH MÔN TOÁN — KHỐI 12 (BUỔI 2)
// TRƯỜNG THPT NGUYỄN HỮU CẢNH — TỔ TOÁN
// Năm học 2025 – 2026 | Buổi 2 Học kì II: 17 tuần
// ==============================================================================

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 1.6cm, bottom: 1.6cm, left: 1.8cm, right: 1.5cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: gray.darken(30%), style: "italic")
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [Phân phối chương trình Toán 12 - Buổi 2],
        [Tổ Toán - THPT Nguyễn Hữu Cảnh]
      )
      #v(-0.5em)#line(length: 100%, stroke: 0.4pt + gray)
    ]
  },
  footer: context [
    #set text(size: 10pt)
    #align(center)[#counter(page).display("1")]
  ]
)

#set text(
  font: ("Times New Roman"),
  size: 12pt,
  lang: "vi",
)

#set par(leading: 0.6em, justify: false)

// --- PHẦN TIÊU NGỮ ---
#grid(
  columns: (1.1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ TOÁN] \
    #v(-0.4em)#line(length: 70pt, stroke: 0.8pt)
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập – Tự do – Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt)
  ]
)

#v(0.6em)

#align(center)[
  #text(weight: "bold", size: 14pt)[PHÂN PHỐI CHƯƠNG TRÌNH MÔN TOÁN – KHỐI 12] \
  #v(0.2em)
  #text(weight: "bold", size: 12.5pt)[Năm học 2025 – 2026] \
  #v(0.2em)
  #text(style: "italic", size: 12pt)[Buổi 2 Học kì II: 17 tuần]
]

#v(0.6em)

// --- BẢNG PHÂN PHỐI CHI TIẾT ---
#table(
  columns: (1.1cm, 2.5cm, 1.8cm, 1.4cm, 1fr),
  stroke: 0.5pt + black,
  inset: (x: 5pt, y: 5.5pt),
  align: (
    center + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
    left + horizon,
  ),
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else { none },

  // Header
  table.header(
    [*STT*], [*Tuần*], [*Tên môn*], [*TIẾT*], [*Tên bài dạy và Yêu cầu cần đạt*]
  ),

  // Tuần 1
  [1], table.cell(rowspan: 2)[*1* \ (19/01--25/01)], table.cell(rowspan: 2)[Toán 12], [1 B2], [*Chuyên đề nâng cao Nguyên hàm.*],
  [2], [2 B2], [_Yêu cầu:_ Vận dụng các phương pháp đổi biến, từng phần tìm nguyên hàm hàm hợp.],

  // Tuần 2
  [3], table.cell(rowspan: 2)[*2* \ (26/01--01/02)], table.cell(rowspan: 2)[Toán 12], [3 B2], [*Chuyên đề nâng cao PT mặt phẳng.*],
  [4], [4 B2], [_Yêu cầu:_ Giải bài toán cực trị về khoảng cách và góc liên quan đến mặt phẳng.],

  // Tuần 3
  [5], table.cell(rowspan: 2)[*3* \ (02/02--08/02)], table.cell(rowspan: 2)[Toán 12], [5 B2], [*Chuyên đề nâng cao tích phân.*],
  [6], [6 B2], [_Yêu cầu:_ Tính tích phân hàm ẩn và ứng dụng giải bài toán thực tế.],

  // Nghỉ Tết
  table.cell(colspan: 5, fill: rgb("#fef3c7"), align: center)[
    #text(weight: "bold", fill: rgb("#b45309"))[NGHỈ TẾT NGUYÊN ĐÁN (09/02 $->$ 22/02)]
  ],

  // Tuần 4
  [7], table.cell(rowspan: 2)[*4* \ (23/02--01/03)], table.cell(rowspan: 2)[Toán 12], [7 B2], [*Chuyên đề nâng cao PT mặt phẳng (tt).*],
  [8], [8 B2], [_Yêu cầu:_ Vận dụng phương trình mặt phẳng giải các bài toán tương giao phức tạp.],

  // Tuần 5
  [9], table.cell(rowspan: 2)[*5* \ (02/03--08/03)], table.cell(rowspan: 2)[Toán 12], [9 B2], [*CĐNC Ứng dụng hình học của tích phân.*],
  [10], [10 B2], [_Yêu cầu:_ Tính thiết diện, thể tích vật thể có hình dạng đặc biệt bằng tích phân.],

  // Tuần 6
  [11], table.cell(rowspan: 2)[*6* \ (09/03--15/03)], table.cell(rowspan: 2)[Toán 12], [11 B2], [*Chuyên đề nâng cao PT đường thẳng.*],
  [12], [12 B2], [_Yêu cầu:_ Lập phương trình đường thẳng thỏa mãn điều kiện hình học không gian.],

  // Tuần 7
  [13], table.cell(rowspan: 2)[*7* \ (16/03--22/03)], table.cell(rowspan: 2)[Toán 12], [13 B2], [*Chuyên đề nâng cao PT đường thẳng (tt).*],
  [14], [14 B2], [_Yêu cầu:_ Các bài toán khoảng cách và góc giữa hai đường thẳng chéo nhau.],

  // Tuần 8
  [15], table.cell(rowspan: 2)[*8* \ (23/03--29/03)], table.cell(rowspan: 2)[Toán 12], [15 B2], [*Chuyên đề nâng cao Mặt cầu.*],
  [16], [16 B2], [_Yêu cầu:_ Lập phương trình mặt cầu, xét vị trí tương đối mặt cầu với đường thẳng, mặt phẳng.],

  // Tuần 9
  [17], table.cell(rowspan: 2)[*9* \ (30/03--05/04)], table.cell(rowspan: 2)[Toán 12], [17 B2], [*Chuyên đề nâng cao Mặt cầu (tt).*],
  [18], [18 B2], [_Yêu cầu:_ Các bài toán cực trị tọa độ không gian $O x y z$ liên quan mặt cầu.],

  // Tuần 10
  [19], table.cell(rowspan: 2)[*10* \ (06/04--12/04)], table.cell(rowspan: 2)[Toán 12], [19 B2], [*Chuyên đề Xác suất có điều kiện.*],
  [20], [20 B2], [_Yêu cầu:_ Vận dụng công thức xác suất có điều kiện và công thức nhân xác suất.],

  // Tuần 11
  [21], table.cell(rowspan: 2)[*11* \ (13/04--19/04)], table.cell(rowspan: 2)[Toán 12], [21 B2], [*Chuyên đề Công thức xác suất toàn phần và Bayes.*],
  [22], [22 B2], [_Yêu cầu:_ Giải quyết các bài toán xác suất thực tế bằng sơ đồ cây và công thức Bayes.],

  // Tuần 12
  [23], table.cell(rowspan: 2)[*12* \ (20/04--26/04)], table.cell(rowspan: 2)[Toán 12], [23 B2], [*Ôn tập kiểm tra cuối học kỳ II.*],
  [24], [24 B2], [_Yêu cầu:_ Hệ thống hóa kiến thức trọng tâm giải tích, hình học $O x y z$ và xác suất.],

  // Tuần 13
  [25], table.cell(rowspan: 3)[*13* \ (27/04--03/05)], table.cell(rowspan: 3)[Toán 12], [25 B2], table.cell(rowspan: 3)[
    *Ôn tập tốt nghiệp THPT.* \
    _Yêu cầu:_ Luyện giải các dạng toán thực tế và vận dụng cao trong đề thi chính thức.
  ],
  [26], [26 B2],
  [27], [27 B2],

  // Tuần 14
  [28], [*14* \ (04/05--10/05)], [Toán 12], [28 B2], [*Ôn tập tốt nghiệp THPT.*],

  // Tuần 15
  [29], table.cell(rowspan: 2)[*15* \ (11/05--17/05)], table.cell(rowspan: 2)[Toán 12], [29 B2], table.cell(rowspan: 2)[*Ôn tập cuối năm, ôn thi tốt nghiệp THPT.*],
  [30], [30 B2],

  // Tuần 16
  [31], table.cell(rowspan: 2)[*16* \ (18/05--24/05)], table.cell(rowspan: 2)[Toán 12], [31 B2], table.cell(rowspan: 2)[*Ôn tập cuối năm, ôn thi tốt nghiệp THPT.*],
  [32], [32 B2],

  // Tuần 17
  [33], table.cell(rowspan: 2)[*17* \ (25/05--30/05)], table.cell(rowspan: 2)[Toán 12], [33 B2], table.cell(rowspan: 2)[*Ôn tập cuối năm, ôn thi tốt nghiệp THPT.*],
  [34], [34 B2],
)

#v(1.0em)
// --- CHỮ KÝ ---
#grid(
  columns: (1fr, 1fr, 1.2fr),
  align: (center, center, center),
  [
    #text(weight: "bold", size: 10.5pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 9pt)[(Ký, ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 10.5pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 10.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 9pt)[(Ký, ghi rõ họ tên)]
    #v(3.2em)
    #text(weight: "bold", size: 10.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(style: "italic", size: 9pt)[Tp. HCM, ngày 19 tháng 01 năm 2026] \
    #text(weight: "bold", size: 10.5pt)[P. HIỆU TRƯỞNG] \
    #text(style: "italic", size: 9pt)[(Ký, ghi rõ họ tên)]
    #v(3.2em)
    #text(weight: "bold", size: 10.5pt)[...........................................]
  ]
)
