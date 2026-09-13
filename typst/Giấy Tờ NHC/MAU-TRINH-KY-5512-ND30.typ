// ==============================================================================
// BỘ BIỂU MẪU KẾ HOẠCH DẠY HỌC & GIÁO DỤC
// Theo Công văn 5512/BGDĐT-GDTrH và Nghị định 30/2020/NĐ-CP
// TRƯỜNG THPT NGUYỄN HỮU CẢNH — NĂM HỌC 2026 - 2027
// ==============================================================================

#set page(
  paper: "a4",
  flipped: true, // Trang nằm ngang (Landscape) theo đúng mẫu chuẩn
  margin: (top: 1.1cm, bottom: 1.0cm, left: 2.0cm, right: 2.0cm),
)

#set text(
  font: ("Times New Roman"),
  size: 12.5pt,
  lang: "vi",
)

#set par(leading: 0.55em, justify: false)

// ─── CÁC HÀM TIỆN ÍCH DÙNG CHUNG ──────────────────────────────────────────────

#let badge(title) = align(center)[
  #rect(
    fill: rgb("#fef08a"),
    stroke: none,
    radius: 2pt,
    inset: (x: 14pt, y: 3.5pt),
    text(weight: "bold", size: 12.5pt)[#title]
  )
]

#let note-red(..lines) = [
  #set text(fill: rgb("#dc2626"), size: 11.5pt, weight: "bold", style: "italic")
  #for line in lines.pos() [
    #line \
  ]
]

// ─── TRANG 1: PHỤ LỤC I (KẾ HOẠCH DẠY HỌC TỔ CHUYÊN MÔN K10) ────────────────
#badge[Phụ lục I]
#v(0.1em)
#align(center)[
  #text(weight: "bold", size: 13pt)[KHUNG KẾ HOẠCH DẠY HỌC MÔN HỌC CỦA TỔ CHUYÊN MÔN] \
  #text(style: "italic", size: 11.5pt)[(Kèm theo Công văn số 5512/BGDĐT-GDTrH ngày 18 tháng 12 năm 2020 của Bộ GDĐT)]
]

#v(0.8em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ: TOÁN] \
    #v(-0.4em)#line(length: 75pt, stroke: 0.8pt)
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt)
  ]
)

#v(1.2em)
#align(center)[
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH DẠY HỌC CỦA TỔ CHUYÊN MÔN] \
  #v(0.2em)
  #text(weight: "bold", size: 13pt)[MÔN HỌC: TOÁN HỌC, KHỐI LỚP #text(fill: rgb("#dc2626"))[10]] \
  #v(0.2em)
  #text(style: "italic", size: 12pt)[(Năm học 2026 - 2027)]
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Nội dung bên trong trình bày theo đúng mẫu công văn Công văn số 5512/BGDĐT-GDTrH)]
]

#v(0.9em)
#align(right)[
  #pad(right: 2.2cm)[
    #text(style: "italic", size: 12pt)[Thành phố Hồ Chí Minh, ngày 05 tháng 9 năm 2026]
  ]
]

#v(0.2em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Lâm Đức Tín]
  ]
)

#v(1fr)
#note-red(
  [Note: Thầy/Cô TTCM thực hiện tương tự cho Khối 11,12],
  [Tên file: KH\_DAYHOC\_TOAN\_K10\_2026\_2027],
  [PL1: TTCM trình ký 03 file (K10, K11, K12) – Hạn cuối: 05/9/2026]
)

#pagebreak()
// ─── TRANG 2: BẢNG QUI ƯỚC TÊN FILE & VÍ DỤ MINH HỌA ─────────────────────────
#v(1.2em)
#rect(
  fill: rgb("#fef08a"),
  stroke: none,
  radius: 2pt,
  inset: (x: 10pt, y: 7pt),
  text(weight: "bold", size: 12pt)[
    Qui ước viết tắt của các môn khi đặt tên file: TOAN, VAN, HOA, NN, LI, SINH(CN), ĐIA, SU, TIN(CN), GDKTPL, GDQPAN, GDTC
  ]
)

#v(1.2em)
#text(weight: "bold", size: 12.5pt)[Ví dụ minh họa:]

#v(0.6em)
#table(
  columns: (1fr, 1fr, 1fr),
  stroke: 0.5pt + black,
  inset: (x: 10pt, y: 11pt),
  align: (center + horizon, center + horizon, center + horizon),
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_TOAN\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_VAN\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_HOA\_K10\_2026\_2027],

  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_NN\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_LI\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_SINH(CN)\_K10\_2026\_2027],

  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_ĐIA\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_SU\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_TIN(CN)\_K10\_2026\_2027],

  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_GDKTPL\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_GDQPAN\_K10\_2026\_2027],
  text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[KH\_DAYHOC\_GDTC\_K10\_2026\_2027],
)

#pagebreak()
// ─── TRANG 3: PHỤ LỤC II (HOẠT ĐỘNG GIÁO DỤC TỔ CHUYÊN MÔN) ──────────────────
#badge[Phụ lục II]
#v(0.1em)
#align(center)[
  #text(weight: "bold", size: 13pt)[KHUNG KẾ HOẠCH TỔ CHỨC CÁC HOẠT ĐỘNG GIÁO DỤC CỦA TỔ CHUYÊN MÔN] \
  #text(style: "italic", size: 11.5pt)[(Kèm theo Công văn số 5512/BGDĐT-GDTrH ngày 18 tháng 12 năm 2020 của Bộ GDĐT)]
]

#v(0.8em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ: TOÁN] \
    #v(-0.4em)#line(length: 75pt, stroke: 0.8pt)
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt)
  ]
)

#v(1.2em)
#align(center)[
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH TỔ CHỨC CÁC HOẠT ĐỘNG GIÁO DỤC CỦA TỔ CHUYÊN MÔN] \
  #v(0.2em)
  #text(style: "italic", size: 12pt)[(Năm học 2026 - 2027)]
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Nội dung bên trong trình bày theo đúng mẫu công văn Công văn số 5512/BGDĐT-GDTrH)]
]

#v(0.9em)
#align(right)[
  #pad(right: 2.2cm)[
    #text(style: "italic", size: 12pt)[Thành phố Hồ Chí Minh, ngày 05 tháng 9 năm 2026]
  ]
]

#v(0.2em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Lâm Đức Tín]
  ]
)

#v(1fr)
#note-red(
  [Tên file: KH\_HDGD\_TOAN\_2026\_2027],
  [PL: TTCM trình ký 01 file. Hạn cuối: 05/9/2026]
)

#pagebreak()
// ─── TRANG 4: PHỤ LỤC III (KẾ HOẠCH GIÁO DỤC GIÁO VIÊN - MÔN TOÁN 10-12) ─────
#badge[Phụ lục III]
#v(0.1em)
#align(center)[
  #text(weight: "bold", size: 13pt)[KHUNG KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN] \
  #text(style: "italic", size: 11.5pt)[(Kèm theo Công văn số 5512/BGDĐT-GDTrH ngày 18 tháng 12 năm 2020 của Bộ GDĐT)]
]

#v(0.8em)
#grid(
  columns: (1.1fr, 1fr),
  align: (left, center),
  [
    #align(center)[
      #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
      #text(weight: "bold")[TỔ TOÁN] \
      #text(style: "italic")[Họ và tên giáo viên: Nguyễn Văn Sang]
    ]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt)
  ]
)

#v(1.2em)
#align(center)[
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN, LỚP #text(fill: rgb("#dc2626"))[10 – 12]] \
  #v(0.2em)
  #text(weight: "bold", size: 13pt)[MÔN HỌC: TOÁN] \
  #v(0.2em)
  #text(style: "italic", size: 12pt)[(Năm học 2026 - 2027)]
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Nội dung bên trong trình bày theo đúng mẫu công văn Công văn số 5512/BGDĐT-GDTrH)]
]

#v(0.9em)
#align(right)[
  #pad(right: 1.5cm)[
    #text(style: "italic", size: 12pt)[Thành phố Hồ Chí Minh, ngày #text(fill: rgb("#dc2626"))[10] tháng 9 năm 2026]
  ]
]

#v(0.2em)
#grid(
  columns: (1fr, 1fr, 1.2fr),
  align: (center, center, center),
  [
    #text(weight: "bold", size: 12.5pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 12.5pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[KT. HIỆU TRƯỞNG] \
    #text(weight: "bold", size: 12.5pt)[PHÓ HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(3.2em)
    #text(weight: "bold", size: 12.5pt)[Phan Ngọc Tường Vi]
  ]
)

#v(1fr)
#note-red(
  [Tên file: KH\_GDCN\_NTTIEN\_2026\_2027],
  [PL3: GVBM trình ký 01 file thuộc chuyên môn chính. Hạn cuối: 10/9/2026]
)

#pagebreak()
// ─── TRANG 5: PHỤ LỤC III (HOẠT ĐỘNG TRẢI NGHIỆM HƯỚNG NGHIỆP) ────────────────
#badge[Phụ lục III]
#v(0.1em)
#align(center)[
  #text(weight: "bold", size: 13pt)[KHUNG KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN] \
  #text(style: "italic", size: 11.5pt)[(Kèm theo Công văn số 5512/BGDĐT-GDTrH ngày 18 tháng 12 năm 2020 của Bộ GDĐT)]
]

#v(0.8em)
#grid(
  columns: (1.1fr, 1fr),
  align: (left, center),
  [
    #align(center)[
      #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
      #text(weight: "bold")[BAN HĐTNHN] \
      #text(style: "italic")[Họ và tên giáo viên: Nguyễn Văn Sang]
    ]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt)
  ]
)

#v(1.2em)
#align(center)[
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN] \
  #v(0.2em)
  #text(weight: "bold", size: 13pt)[HOẠT ĐỘNG TRẢI NGHIỆM HƯỚNG NGHIỆP] \
  #v(0.2em)
  #text(style: "italic", size: 12pt)[(Năm học 2026 - 2027)]
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Nội dung bên trong trình bày theo đúng mẫu công văn Công văn số 5512/BGDĐT-GDTrH)]
]

#v(0.9em)
#align(right)[
  #pad(right: 1.5cm)[
    #text(style: "italic", size: 12pt)[Thành phố Hồ Chí Minh, ngày 10 tháng 9 năm 2026]
  ]
]

#v(0.2em)
#grid(
  columns: (1fr, 1fr, 1.2fr),
  align: (center, center, center),
  [
    #text(weight: "bold", size: 12.5pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 12.5pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[KT. HIỆU TRƯỞNG] \
    #text(weight: "bold", size: 12.5pt)[PHÓ HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(3.2em)
    #text(weight: "bold", size: 12.5pt)[Phan Ngọc Tường Vi]
  ]
)

#v(1fr)
#note-red(
  [Tên file: KH\_TNHN\_NTTIEN\_2026\_2027],
  [PL3: GVBM trình ký 01 file thuộc hoạt động TNHN (khi được phân công). Hạn cuối: 10/9/2026]
)

#pagebreak()
// ─── TRANG 6: PHỤ LỤC III (GIÁO DỤC ĐỊA PHƯƠNG) ──────────────────────────────
#badge[Phụ lục III]
#v(0.1em)
#align(center)[
  #text(weight: "bold", size: 13pt)[KHUNG KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN] \
  #text(style: "italic", size: 11.5pt)[(Kèm theo Công văn số 5512/BGDĐT-GDTrH ngày 18 tháng 12 năm 2020 của Bộ GDĐT)]
]

#v(0.8em)
#grid(
  columns: (1.1fr, 1fr),
  align: (left, center),
  [
    #align(center)[
      #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
      #text(weight: "bold")[MÔN GIÁO DỤC ĐỊA PHƯƠNG] \
      #text(style: "italic")[Họ và tên giáo viên: Nguyễn Văn Sang]
    ]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt)
  ]
)

#v(1.2em)
#align(center)[
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN] \
  #v(0.2em)
  #text(weight: "bold", size: 13pt)[MÔN: GIÁO DỤC ĐỊA PHƯƠNG] \
  #v(0.2em)
  #text(style: "italic", size: 12pt)[(Năm học 2026 - 2027)]
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Nội dung bên trong trình bày theo đúng mẫu công văn Công văn số 5512/BGDĐT-GDTrH)]
]

#v(0.9em)
#align(right)[
  #pad(right: 1.5cm)[
    #text(style: "italic", size: 12pt)[Thành phố Hồ Chí Minh, ngày 10 tháng 9 năm 2026]
  ]
]

#v(0.2em)
#grid(
  columns: (1fr, 1fr, 1.2fr),
  align: (center, center, center),
  [
    #text(weight: "bold", size: 12.5pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 12.5pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[KT. HIỆU TRƯỞNG] \
    #text(weight: "bold", size: 12.5pt)[PHÓ HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(3.2em)
    #text(weight: "bold", size: 12.5pt)[Phan Ngọc Tường Vi]
  ]
)

#v(1fr)
#note-red(
  [Tên file: KH\_GDĐP\_NTTIEN\_2026\_2027],
  [PL3: GVBM trình ký 01 file thuộc môn GDĐP (khi được phân công). Hạn cuối: 10/9/2026]
)

#pagebreak()
// ─── TRANG 7: PHỤ LỤC IV (KHUNG KẾ HOẠCH BÀI DẠY / GIÁO ÁN) ──────────────────
#badge[Phụ lục IV]
#v(0.1em)
#align(center)[
  #text(weight: "bold", size: 13pt)[KHUNG KẾ HOẠCH BÀI DẠY] \
  #text(style: "italic", size: 11.5pt)[(Kèm theo Công văn số 5512/BGDĐT-GDTrH ngày 18 tháng 12 năm 2020 của Bộ GDĐT)]
]

#v(0.8em)
#grid(
  columns: (1.2fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ TOÁN]
  ],
  [
    #text(style: "italic")[Họ và tên giáo viên:] \
    #text(weight: "bold")[Nguyễn Văn Sang]
  ]
)

#v(1.5em)
#align(center)[
  #text(weight: "bold", size: 13.5pt)[TÊN BÀI DẠY: ....................................................] \
  #v(0.3em)
  #text(size: 12.5pt)[Môn học/Hoạt động giáo dục: ..........; lớp:.........] \
  #v(0.2em)
  #text(size: 12pt)[Thời gian thực hiện: (số tiết)]
]

#v(1.5em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Nội dung bên trong trình bày theo đúng mẫu công văn Công văn số 5512/BGDĐT-GDTrH)]
]

#v(0.9em)
#align(right)[
  #pad(right: 2.2cm)[
    #text(style: "italic", size: 12pt)[Thành phố Hồ Chí Minh, ngày #text(fill: rgb("#dc2626"))[10] tháng 9 năm 2026]
  ]
]

#v(0.2em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 12.5pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 12.5pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ]
)

#v(1fr)
#note-red(
  [Tên file: KHBD\_K10\_NTTIEN\_HKI\_2026\_2027 (môn chính + chuyên đề học tập)],
  [PL4: GVBM trình ký 01 file KHBD.]
)

#pagebreak()
// ─── TRANG 8: KẾ HOẠCH NGÀY HỘI TOÁN HỌC (NGHỊ ĐỊNH 30/2020/NĐ-CP) ───────────
#v(0.3em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ TOÁN] \
    #v(0.2em)
    #text()[Số: #h(1.5em) /KH-TOAN]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt) \
    #v(0.3em)
    #text(style: "italic", size: 11.5pt)[Thành phố Hồ Chí Minh, ngày #text(fill: rgb("#dc2626"))[05] tháng 9 năm 2026]
  ]
)

#v(1.2em)
#align(center)[
  #text(weight: "bold", size: 14pt)[KẾ HOẠCH] \
  #v(0.2em)
  #text(weight: "bold", size: 13pt)[Tổ chức Ngày hội Toán học năm học 2026-2027] \
  #v(-0.3em)#line(length: 230pt, stroke: 0.8pt)
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Trình này theo đúng nghị định Nghị định 30/2020/NĐ-CP)]
]

#v(1.0em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Lâm Đức Tín]
  ]
)

#v(0.8fr)
#note-red(
  [Tên file: KH\_HĐBM\_TOAN\_2026\_2027 ( hoặc KH\_HĐBM\_TOAN\_HKI\_2026\_2027)],
  [TTCM trình ký theo thực tế hoạt động.],
  [Qui định đặt tên số kế hoạch của tổ:]
)

#v(0.2em)
#table(
  columns: (1fr, 1fr, 1fr),
  stroke: 0.5pt + black,
  inset: (x: 8pt, y: 5pt),
  align: (left, left, left),
  [Số: #h(1.2em) /KH-TOAN], [Số: #h(1.2em) /KH-VAN], [Số: #h(1.2em) /KH-HOA],
  [Số: #h(1.2em) /KH-NN], [Số: #h(1.2em) /KH-LI], [Số: #h(1.2em) /KH-SINH(CN)],
  [Số: #h(1.2em) /KH-ĐIA], [Số: #h(1.2em) /KH-SU], [Số: #h(1.2em) /KH-TIN(CN)],
  [Số: #h(1.2em) /KH-GDKTPL], [Số: #h(1.2em) /KH-GDQPAN], [Số: #h(1.2em) /KH-GDTC],
)

#pagebreak()
// ─── TRANG 9: KẾ HOẠCH CÂU LẠC BỘ (NGHỊ ĐỊNH 30/2020/NĐ-CP) ──────────────────
#v(0.3em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ TOÁN] \
    #v(0.2em)
    #text()[Số: #h(1.5em) /KH-TOAN]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt) \
    #v(0.3em)
    #text(style: "italic", size: 11.5pt)[Thành phố Hồ Chí Minh, ngày #text(fill: rgb("#dc2626"))[05] tháng 9 năm 2026]
  ]
)

#v(1.2em)
#align(center)[
  #text(weight: "bold", size: 14pt)[KẾ HOẠCH] \
  #v(0.2em)
  #text(weight: "bold", size: 13pt)[Tổ chức Câu Lạc Bộ năm học 2026-2027] \
  #v(-0.3em)#line(length: 230pt, stroke: 0.8pt)
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Trình này theo đúng nghị định Nghị định 30/2020/NĐ-CP)]
]

#v(1.0em)
#grid(
  columns: (1fr, 1fr, 1.2fr),
  align: (center, center, center),
  [
    #text(weight: "bold", size: 12.5pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 12.5pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[KT. HIỆU TRƯỞNG] \
    #text(weight: "bold", size: 12.5pt)[PHÓ HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký, ghi rõ họ tên)]
    #v(3.2em)
    #text(weight: "bold", size: 12.5pt)[Phan Ngọc Tường Vi]
  ]
)

#v(0.8fr)
#note-red(
  [Tên file: KH\_CLB\_TOAN\_2026\_2027 ( hoặc KH\_HĐBM\_TOAN\_HKI\_2026\_2027)],
  [TTCM trình ký theo thực tế hoạt động.],
  [Qui định đặt tên số kế hoạch của tổ:]
)

#v(0.2em)
#table(
  columns: (1fr, 1fr, 1fr),
  stroke: 0.5pt + black,
  inset: (x: 8pt, y: 5pt),
  align: (left, left, left),
  [Số: #h(1.2em) /KH-TOAN], [Số: #h(1.2em) /KH-VAN], [Số: #h(1.2em) /KH-HOA],
  [Số: #h(1.2em) /KH-NN], [Số: #h(1.2em) /KH-LI], [Số: #h(1.2em) /KH-SINH(CN)],
  [Số: #h(1.2em) /KH-ĐIA], [Số: #h(1.2em) /KH-SU], [Số: #h(1.2em) /KH-TIN(CN)],
  [Số: #h(1.2em) /KH-GDKTPL], [Số: #h(1.2em) /KH-GDQPAN], [Số: #h(1.2em) /KH-GDTC],
)

#pagebreak()
// ─── TRANG 10: BỒI DƯỠNG THƯỜNG XUYÊN CỦA TỔ (NGHỊ ĐỊNH 30/2020/NĐ-CP) ────────
#v(0.3em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ TOÁN] \
    #v(0.2em)
    #text()[Số: #h(1.5em) /KH-TOAN]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt) \
    #v(0.3em)
    #text(style: "italic", size: 11.5pt)[Thành phố Hồ Chí Minh, ngày #text(fill: rgb("#dc2626"))[05] tháng 9 năm 2026]
  ]
)

#v(1.4em)
#align(center)[
  #text(weight: "bold", size: 14pt)[KẾ HOẠCH] \
  #v(0.2em)
  #text(weight: "bold", size: 13pt)[Bồi dưỡng thường xuyên cho cán bộ quản lý, giáo viên] \
  #v(0.2em)
  #text(weight: "bold", size: 12.5pt)[Năm học 2026-2027] \
  #v(-0.3em)#line(length: 230pt, stroke: 0.8pt)
]

#v(1.2em)
#align(center)[
  #text(style: "italic", size: 11.5pt)[(Trình này theo đúng nghị định Nghị định 30/2020/NĐ-CP)]
]

#v(1.0em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 12.5pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(weight: "bold", size: 12.5pt)[HIỆU TRƯỞNG] \
    #text(style: "italic", size: 11.5pt)[(Ký và ghi rõ họ tên)]
    #v(4.2em)
    #text(weight: "bold", size: 12.5pt)[Lâm Đức Tín]
  ]
)

#v(1fr)
#note-red(
  [Tên file: KH\_BDTX\_TOAN\_2026\_2027],
  [TTCM trình ký 01 file BDTX. Hạn cuối: 10/9/2026]
)

#pagebreak()
// ─── TRANG 11: BỒI DƯỠNG THƯỜNG XUYÊN CÁ NHÂN (NGHỊ ĐỊNH 30/2020/NĐ-CP) ────────
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold")[TRƯỜNG THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ TOÁN]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt) \
    #v(0.1em)
    #text(style: "italic", size: 11.5pt)[Thành phố Hồ Chí Minh, ngày #text(fill: rgb("#dc2626"))[10] tháng 9 năm 2026]
  ]
)

#v(0.4em)
#align(center)[
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH] \
  #v(0.1em)
  #text(weight: "bold", size: 12.5pt)[Bồi dưỡng thường xuyên cá nhân năm học 2026 – 2027] \
  #v(-0.3em)#line(length: 240pt, stroke: 0.8pt)
]

#v(0.3em)
#align(center)[
  #block(width: 85%)[
    #set align(left)
    #set text(size: 11.5pt)
    #let dot-line(label) = [
      #grid(
        columns: (auto, 1fr),
        gutter: 4pt,
        [#label],
        [#box(width: 100%, repeat[.])],
      )
    ]
    #dot-line[Họ và tên giáo viên:]
    #dot-line[Ngày, tháng, năm sinh:]
    #dot-line[Tổ chuyên môn:]
    #dot-line[Năm vào ngành giáo dục:]
    #dot-line[Nhiệm vụ được giao trong năm học:]
  ]
]

#v(0.3em)
#align(center)[
  #text(style: "italic", size: 11pt)[(Trình này theo đúng nghị định Nghị định 30/2020/NĐ-CP)]
]

#v(0.3em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  [
    #text(weight: "bold", size: 12pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 11pt)[(Ký và ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 12pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 12pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 11pt)[(Ký và ghi rõ họ tên)]
    #v(2.5em)
    #text(weight: "bold", size: 12pt)[Đỗ Thị Bạch Lan]
  ]
)

#v(1fr)
#note-red(
  [Tên file: KH\_BDTX\_NVSANG\_2026\_2027],
  [GVBM trình ký 01 file BDTX. Hạn cuối: 10/9/2026]
)
