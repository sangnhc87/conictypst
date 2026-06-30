// ═══════════════════════════════════════════════════════════════════════════════
// GIAO-AN.TYP  ·  Module Giáo án chuẩn CTGDPT 2018 (Bản nâng cấp thẩm mỹ)
// Trường THPT Nguyễn Hữu Cảnh  ·  Tổ Toán  ·  GV: Nguyễn Văn Sang
//
// ═══════════════════════════════════════════════════════════════════════════════

// ── MÀU SẮC CHỦ ĐẠO (PREMIUM PALETTE) ──────────────────────────────────────────
#let _navy    = rgb("#0F4C81")   // Xanh hải quân sang trọng - Dùng cho Phân chính (I, II, III), Tiêu đề chính
#let _crimson = rgb("#8B1E3F")   // Đỏ đô trầm ấm - Dùng cho Hoạt động, các mục nhỏ (1, 2, 3) và chữ nhấn mạnh
#let _xam     = rgb("#4A5568")   // Xám đen - Dùng cho footer và ghi chú phụ
#let _line    = rgb("#E2E8F0")   // Xám nhạt - Dùng cho đường kẻ chia cắt

// ── TEMPLATE CHÍNH ─────────────────────────────────────────────────────────────
#let giao-an(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "TÊN BÀI HỌC",
  thoi-gian: "2 tiết",
  body,
) = {
  // Trang A4, lề chuẩn giáo án hành chính
  set page(
    paper: "a4",
    margin: (top: 2cm, bottom: 2.2cm, left: 3cm, right: 2cm),
    footer: context [
      #set text(size: 9.5pt, fill: _xam, font: "Times New Roman")
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(style: "italic")[Giáo án Toán — Trường THPT Nguyễn Hữu Cảnh]],
        align(right)[Trang #counter(page).display()],
      )
    ],
  )

  // Cấu hình Font và đoạn văn bản
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "vi",
  )
  set par(justify: true, leading: 0.8em, spacing: 0.6em)

  // Cấu hình Bảng biểu (tuỳ chọn có viền)
  set table(
    stroke: 0.5pt + black,
    inset: (x: 0.6em, y: 0.6em),
    align: center + horizon
  )

  // Định dạng Danh sách (List)
  set list(
    marker: ([•], [○], [▪]),
    indent: 1em,
    body-indent: 0.5em,
  )

  // Toán học: inline -> display tự động cho đẹp mắt
  show math.equation.where(block: false): math.display

  // Tự động đứng chữ C, A, P trong tổ hợp chập
  show math.attach: it => {
    let f = it.base.fields()
    if "text" in f and f.text in ("C", "A", "P") {
      return math.attach(
        math.upright(f.text),
        t: it.t, b: it.b, tl: it.tl, bl: it.bl, tr: it.tr, br: it.br
      )
    }
    it
  }

  // ── ĐỊNH DẠNG HEADING (XUẤT RA PDF VẪN ĐẸP VÀ GIỮ NGUYÊN STYLE KHI SANG WORD) ──
  // Việc giữ nguyên đối tượng "it" thay vì thay bằng "block" giúp Pandoc
  // nhận diện đúng Heading và áp dụng màu sắc/font từ reference.docx sang Word.
  show heading.where(level: 1): it => {
    v(1.8em)
    set text(fill: _navy, weight: "bold", size: 13pt)
    it
    v(0.4em)
  }

  show heading.where(level: 2): it => {
    v(0.8em)
    set text(fill: _crimson, style: "italic", weight: "bold", size: 12pt)
    it
    v(0.25em)
  }

  show heading.where(level: 3): it => {
    v(1.6em)
    line(length: 100%, stroke: 0.8pt + _line)
    v(0.6em)
    set text(fill: _crimson, style: "italic", weight: "bold", size: 12.5pt)
    it
    v(0.5em)
  }

  show heading.where(level: 4): it => {
    v(1.1em)
    set text(fill: _navy, weight: "bold", size: 12pt)
    it
    v(0.35em)
  }

  // ── PHẦN ĐẦU TRANG (HEADER) ────────────────────────────────────────────────
  grid(
    columns: (1.2fr, 1fr),
    align: (left + top, right + top),
    gutter: 1em,
    [
      #set text(size: 11pt)
      #set par(leading: 0.4em)
      *#upper(truong)*\
      #text(fill: _navy, weight: "bold")[#upper(to)]
    ],
    [
      #set text(size: 11pt)
      #set par(leading: 0.4em)
      Giáo viên soạn:\
      *#giao-vien*
    ],
  )

  v(1em)

  align(center, {
    block(below: 0.4em)[
      #text(size: 14pt, weight: "bold", fill: _navy)[#upper(ten-bai)]
    ]
    text(size: 11pt, style: "italic", fill: _crimson)[
      Thời gian thực hiện: #thoi-gian
    ]
  })

  v(0.6em)
  line(length: 100%, stroke: 1.5pt + _navy)
  v(0.8em)

  // ── NỘI DUNG GIÁO ÁN ──────────────────────────────────────────────────────
  body

  // ── PHẦN KÝ DUYỆT (SIGNATURE BLOCK) ────────────────────────────────────────
  v(3em)
  table(
    columns: (1fr, 1.2fr),
    stroke: none,
    align: center,
    [
      #set text(size: 11pt)
      #set par(leading: 0.4em)
      *DUYỆT CỦA TỔ TRƯỞNG CHUYÊN MÔN*

      #text(style: "italic", size: 10pt, fill: _xam)[(Ký và ghi rõ họ tên)]

      ~

      ~

      ~

      ~


      ...................................................
    ],
    [
      #set text(size: 11pt)
      #set par(leading: 0.4em)
      #text(style: "italic", fill: _xam)[Ngày ...... tháng ...... năm 2026]

      *NGƯỜI SOẠN (GIÁO VIÊN)*

      #text(style: "italic", size: 10pt, fill: _xam)[(Ký và ghi rõ họ tên)]

      ~

      ~

      ~

      ~


      *#giao-vien*
    ]
  )
}

// ═══════════════════════════════════════════════════════════════════════════════
// CÁC TIÊU ĐỀ PHẦN (Ánh xạ sang Heading để Pandoc hiểu khi xuất DOCX)
// ═══════════════════════════════════════════════════════════════════════════════

/// Tiêu đề chính (I. MỤC TIÊU / II. THIẾT BỊ / III. TIẾN TRÌNH DẠY HỌC)
#let phan(la-ma, ten) = {
  heading(level: 1, bookmarked: true, outlined: true)[#la-ma. #upper(ten)]
}

/// Tiêu đề mục con (1. Về kiến thức / 2. Về năng lực / 3. Về phẩm chất)
#let muc(so, ve) = {
  heading(level: 2, bookmarked: true, outlined: true)[#so. Về #ve]
}

// ═══════════════════════════════════════════════════════════════════════════════
// CÁC HOẠT ĐỘNG DẠY HỌC
// ═══════════════════════════════════════════════════════════════════════════════

/// Hoạt động chính (Mở đầu, Hình thành kiến thức, Luyện tập, Vận dụng)
#let hd(so, ten, phut) = {
  heading(level: 3, bookmarked: true, outlined: true)[#so. Hoạt động #so: #ten (#phut phút)]
}

/// Hoạt động thành phần (Hoạt động 2.1, 2.2...)
#let hd-tp(so, ten, phut) = {
  heading(level: 4, bookmarked: true, outlined: true)[Hoạt động thành phần #so: #ten (#phut phút)]
}

// ═══════════════════════════════════════════════════════════════════════════════
// CÁC BỘ PHẬN BÊN TRONG HOẠT ĐỘNG (a, b, c, d)
// ═══════════════════════════════════════════════════════════════════════════════

/// Tên hoạt động
#let ten-hd(content) = {
  parbreak()
  v(0.4em)
  block(inset: (left: 0.5em))[
    #text(fill: _navy, weight: "bold")[Tên hoạt động:] #content
  ]
}

/// a) Mục tiêu
#let mt-hd(content) = {
  parbreak()
  v(0.5em)
  block(inset: (left: 0.5em))[
    #text(fill: _crimson, weight: "bold")[a) Mục tiêu:] #content
  ]
}

/// b) Nội dung
#let nd-hd(content) = {
  parbreak()
  v(0.6em)
  block(inset: (left: 0.5em))[
    #text(fill: _crimson, weight: "bold")[b) Nội dung:]
    #v(0.25em)
    #content
  ]
}

/// c) Sản phẩm
#let sp-hd(content) = {
  parbreak()
  v(0.6em)
  block(inset: (left: 0.5em))[
    #text(fill: _crimson, weight: "bold")[c) Sản phẩm:]
    #v(0.25em)
    #content
  ]
}

/// d) Tổ chức thực hiện
#let tc-hd(content) = {
  parbreak()
  v(0.6em)
  block(inset: (left: 0.5em))[
    #text(fill: _crimson, weight: "bold")[d) Tổ chức thực hiện:]
    #v(0.25em)
    #content
  ]
}

/// Các bước chi tiết trong mục (d)
#let buoc(so, ten, phut, content) = {
  parbreak()
  v(0.4em)
  block(inset: (left: 1em))[
    #text(fill: _navy, weight: "bold")[Bước #so: #ten (#phut phút):] #content
  ]
}

/// Dòng tích hợp năng lực số
#let nl-so(content) = {
  parbreak()
  v(0.3em)
  block(inset: (left: 1em))[
    #text(fill: _xam, style: "italic")[*Tích hợp Năng lực số:* #content]
  ]
}

// ═══════════════════════════════════════════════════════════════════════════════
// HỖ TRỢ LUYỆN TẬP & BÀI TẬP
// ═══════════════════════════════════════════════════════════════════════════════

/// Dạng bài
#let dang(so, ten, content) = {
  parbreak()
  v(0.5em)
  block(inset: (left: 0.5em))[
    #text(fill: _navy, weight: "bold")[Dạng #so (#ten):]
    #v(0.2em)
    #content
  ]
}

/// Đề bài tập
#let bai(so, content, dap-an: none) = {
  parbreak()
  v(0.3em)
  block(inset: (left: 1em))[
    *Bài #so:* #content
    #if dap-an != none [ #text(fill: _crimson)[(Đáp án: #dap-an)] ]
  ]
}

// ═══════════════════════════════════════════════════════════════════════════════
// NĂNG LỰC & PHẨM CHẤT
// ═══════════════════════════════════════════════════════════════════════════════

#let pc(ten, content) = [
  - *#ten:* #content
]

#let nl(ten, content) = [
  - *#ten:* #content
]

#let nls(ma, content) = [
  - *#ma* — #content
]

// ═══════════════════════════════════════════════════════════════════════════════
// TIỆN ÍCH BỔ SUNG (VÍ DỤ, DỰ KIẾN KHÓ KHĂN)
// ═══════════════════════════════════════════════════════════════════════════════

/// Ví dụ minh họa
#let vi-du(content) = {
  parbreak()
  v(0.5em)
  block(
    fill: rgb("#F8FAFC"),
    inset: (left: 1em, top: 0.6em, bottom: 0.6em, right: 1em),
    stroke: (left: 3pt + _navy),
    width: 100%,
    [
      #set text(size: 11.5pt)
      #text(fill: _navy, weight: "bold")[Ví dụ minh họa:] #content
    ]
  )
  v(0.5em)
}

/// Dự kiến khó khăn của học sinh
#let du-kien(content) = {
  parbreak()
  v(0.3em)
  block(inset: (left: 1em))[
    #set text(style: "italic", fill: _xam, size: 10.5pt)
    (Dự kiến khó khăn: #content)
  ]
}

// ── VECTƠ CHUẨN (VECT) ────────────────────────────────────────────────────────
#let vect(body) = $arrow(#body)$
