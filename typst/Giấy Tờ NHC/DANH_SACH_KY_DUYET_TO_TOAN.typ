// ==============================================================================
// DANH SÁCH GIÁO VIÊN TỔ TOÁN — KÝ DUYỆT & XÁC NHẬN CHUYÊN MÔN
// TRƯỜNG THPT NGUYỄN HỮU CẢNH — NĂM HỌC 2025 - 2026
// Thiết kế ô chữ ký số rộng rãi, thoáng đẹp
// ==============================================================================

#set page(
  paper: "a4",
  flipped: true, // Trang nằm ngang (Landscape)
  margin: (top: 1.2cm, bottom: 1.2cm, left: 1.5cm, right: 1.5cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: gray.darken(30%), style: "italic")
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [Trường THPT Nguyễn Hữu Cảnh - Tổ Toán],
        [Danh sách ký duyệt & xác nhận chuyên môn]
      )
      #v(-0.5em)#line(length: 100%, stroke: 0.4pt + gray)
    ]
  },
  footer: context [
    #set text(size: 9.5pt)
    #align(center)[#counter(page).display("1")]
  ]
)

#set text(
  font: ("Times New Roman"),
  size: 11pt,
  lang: "vi",
)

#set par(leading: 0.5em, justify: false)

// --- PHẦN TIÊU NGỮ ---
#grid(
  columns: (1.2fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 10.5pt)[SỞ GIÁO DỤC VÀ ĐÀO TẠO TP. HỒ CHÍ MINH] \
    #text(weight: "bold", size: 11pt)[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold", size: 10.5pt)[TỔ CHUYÊN MÔN: TOÁN] \
    #v(-0.4em)#line(length: 140pt, stroke: 0.6pt)
  ],
  [
    #text(weight: "bold", size: 10.5pt)[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold", size: 11pt)[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 150pt, stroke: 0.8pt)
  ]
)

#v(0.6em)

#align(center)[
  #text(weight: "bold", size: 13.5pt)[DANH SÁCH GIÁO VIÊN TỔ TOÁN KÝ DUYỆT & XÁC NHẬN CHUYÊN MÔN] \
  #v(0.2em)
  #text(style: "italic", size: 10.5pt)[(Kèm theo Kế hoạch giáo dục / Quy chế chuyên môn — Năm học 2025 - 2026)]
]

#v(0.6em)

#let sign-box = v(2.6em)

// --- BẢNG DANH SÁCH 2 PHẦN SONG SONG RỘNG RÃI (TRỌN 1 TRANG NGANG) ---
#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  [
    #table(
      columns: (0.9cm, 1.8fr, 0.9fr, 2.5fr),
      stroke: 0.5pt + black,
      inset: (x: 4pt, y: 5.5pt),
      align: (center + horizon, left + horizon, left + horizon, center + horizon),
      fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else { none },
      table.cell(align: center)[*STT*],
      table.cell(align: center)[*Họ và đệm*],
      table.cell(align: center)[*Tên*],
      table.cell(align: center)[*Chữ ký số / Ký nhận*],

      [1], [Nguyễn Thị Thu], [Thủy], [#sign-box],
      [2], [Đỗ Thị Bạch], [Lan], [#sign-box],
      [3], [Đặng Thị], [Sáu], [#sign-box],
      [4], [Nguyễn Văn], [Sang], [#sign-box],
      [5], [Đổng Quang], [Phúc], [#sign-box],
      [6], [Vũ Tiến], [Lực], [#sign-box],
    )
  ],
  [
    #table(
      columns: (0.9cm, 1.8fr, 0.9fr, 2.5fr),
      stroke: 0.5pt + black,
      inset: (x: 4pt, y: 5.5pt),
      align: (center + horizon, left + horizon, left + horizon, center + horizon),
      fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else { none },
      table.cell(align: center)[*STT*],
      table.cell(align: center)[*Họ và đệm*],
      table.cell(align: center)[*Tên*],
      table.cell(align: center)[*Chữ ký số / Ký nhận*],

      [7], [Đào Khánh], [Duy], [#sign-box],
      [8], [Nguyễn Đức Thanh], [Nga], [#sign-box],
      [9], [Nguyễn Tân], [Tiến], [#sign-box],
      [10], [Trần Ngọc Thanh], [Trang], [#sign-box],
      [11], [Phạm Hoàng], [Long], [#sign-box],
      [12], [Nguyễn Văn], [Nguyện], [#sign-box],
    )
  ]
)

#v(0.8em)

// --- KHỐI PHÊ DUYỆT ---
#grid(
  columns: (1fr, 1.2fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 11pt)[TỔ TRƯỞNG CHUYÊN MÔN] \
    #text(style: "italic", size: 9.5pt)[(Ký, ghi rõ họ tên)]
    #v(3.8em)
    #text(weight: "bold", size: 11pt)[\ Đỗ Thị Bạch Lan]
  ],
  [
    #text(style: "italic", size: 9.5pt)[Tp. Hồ Chí Minh, ngày 05 tháng 09 năm 2025] \
    #text(weight: "bold", size: 11pt)[KT. HIỆU TRƯỞNG] \
    #text(weight: "bold", size: 11pt)[PHÓ HIỆU TRƯỞNG]
    #v(3.8em)
    #text(weight: "bold", size: 11pt)[Phan Ngọc Tường Vi]
  ]
)
