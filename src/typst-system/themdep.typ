// ═══════════════════════════════════════════════════════════
// THEMDEP.TYP v1.0 — Bộ Layout & Template Nâng Cao STEXGV
// ═══════════════════════════════════════════════════════════
//
// IMPORT:
//   #import "../themdep.typ": *        (từ exams/)
//   #import "themdep.typ": *           (cùng thư mục typst/)
//
// ┌──────────────────────────────────────────────────────┐
// │ DANH SÁCH TÍNH NĂNG                                  │
// ├──────────────────────────────────────────────────────┤
// │ Layout Modes (show rules):                           │
// │   layout-draft        1 cột, lề nháp luân phiên    │
// │   layout-2col         2 cột, heading span đầy       │
// │   layout-2col-draft   2 cột + lề nháp               │
// │                                                      │
// │ Cover Pages:                                         │
// │   cover-exam          Trang bìa đề thi chính thức  │
// │   cover-cd            Trang bìa chuyên đề           │
// │   cover-book          Trang bìa sách/tài liệu       │
// │                                                      │
// │ Phiếu & Bảng:                                        │
// │   answer-sheet        Phiếu trả lời trắc nghiệm    │
// │   barem               Bảng barem/chấm điểm          │
// │   matrix-box          Ma trận đề (đặc tả)           │
// │   student-block       Block thông tin thí sinh       │
// │                                                      │
// │ UI Enhancements:                                     │
// │   chuyende-header     Tiêu đề chuyên đề fancy       │
// │   part-fancy          Tiêu đề phần fancy             │
// │   callout             Hộp thông báo (info/warn/…)   │
// │   deco-line           Đường trang trí               │
// │   timeline            Dòng thời gian / quy trình    │
// │   progress-strip      Dải tiến trình (bộ đề)        │
// │   stamp               Con dấu mờ (NHÁP / BẢO MẬT) │
// │   qr-placeholder      Ô QR code placeholder         │
// │   option-box          MCQ options dạng ô riêng      │
// │   exam-2col-wrap      Bọc câu hỏi 2 cột cục bộ      │
// │   info / warn / tip-box / quote-box  Callout alias  │
// └──────────────────────────────────────────────────────┘

// ─────────────────────────────────────────────────────────
// 0. Màu & hằng số nội bộ
// ─────────────────────────────────────────────────────────
#let _td-blue = rgb("#1A5276")
#let _td-red = rgb("#900C3F")
#let _td-green = rgb("#117A65")
#let _td-orange = rgb("#B7410E")
#let _td-gold = rgb("#B8860B")
#let _a4-w = 21cm
#let _a4-h = 29.7cm

// ─────────────────────────────────────────────────────────
// 1. LAYOUT-DRAFT — 1 cột, lề nháp luân phiên trái/phải
// ─────────────────────────────────────────────────────────
// Trang LẺ  → nội dung bên trái,  vùng nháp 28% bên PHẢI
// Trang CHẴN → nội dung bên phải, vùng nháp 28% bên TRÁI
// (phù hợp để in 2 mặt, học sinh gấp nháp vào bên trong)
//
// Dùng:
//   #show: layout-draft
//   #show: layout-draft.with(nháp-pct: 30%, accent: rgb("#1A5276"))
// ─────────────────────────────────────────────────────────
#let layout-draft(
  body,
  nháp-pct: 28%,
  nháp-fill: luma(248),
  nháp-line: luma(210),
  nháp-label: "NHÁP",
  accent: _td-blue,
  content-margin: 1.5cm,
  top-margin: 2cm,
  bottom-margin: 2cm,
) = {
  let nw = _a4-w * nháp-pct // ≈ 5.88cm ở 28%

  set page(
    paper: "a4",
    margin: (top: top-margin, bottom: bottom-margin, left: content-margin, right: content-margin + nw),
    background: context {
      let pg = counter(page).get().first()
      let odd = calc.odd(pg)
      // Khi trang chẵn, dịch nội dung sang phải (flip margins)
      // (Typst không support margin per-page trực tiếp, ta fake bằng background)

      // ── Vùng nháp ──────────────────────────────────────
      let dx = if odd { _a4-w - nw } else { 0pt }
      place(top + left, dx: dx, dy: 0pt, rect(width: nw, height: _a4-h, fill: nháp-fill, stroke: if odd {
        (left: 0.8pt + nháp-line, rest: none)
      } else {
        (right: 0.8pt + nháp-line, rest: none)
      }))

      // ── Nhãn "NHÁP" (dọc, mờ) ─────────────────────────
      let label-dx = if odd { dx + nw * 0.5 - 8pt } else { nw * 0.5 - 8pt }
      place(top + left, dx: label-dx, dy: top-margin, rotate(90deg, text(
        size: 7.5pt,
        fill: luma(190),
        weight: "bold",
        tracking: 5pt,
      )[#upper(nháp-label)]))

      // ── Dòng kẻ nháp (27 dòng đều nhau) ───────────────
      let content-h = _a4-h - top-margin - bottom-margin
      let line-gap = content-h / 27
      for i in range(27) {
        place(top + left, dx: dx + 6pt, dy: top-margin + i * line-gap, line(length: nw - 12pt, stroke: (
          paint: nháp-line,
          thickness: 0.4pt,
        )))
      }
    },
  )
  body
}

// ─────────────────────────────────────────────────────────
// 2. LAYOUT-2COL — 2 cột bằng nhau, heading span full
// ─────────────────────────────────────────────────────────
// Heading level 1 & 2 luôn chiếm full width.
// Heading level 3 trở xuống nằm trong cột.
//
// Dùng:
//   #show: layout-2col
//   #show: layout-2col.with(col-gutter: 18pt)
// ─────────────────────────────────────────────────────────
#let layout-2col(
  body,
  col-gutter: 14pt,
) = {
  show heading.where(level: 1): it => place(
    top + start,
    float: true,
    clearance: 6pt,
    block(width: 100%)[#it],
  )
  show heading.where(level: 2): it => place(
    top + start,
    float: true,
    clearance: 4pt,
    block(width: 100%)[#it],
  )
  columns(2, gutter: col-gutter, body)
}

// ─────────────────────────────────────────────────────────
// 3. LAYOUT-2COL-DRAFT — 2 cột + lề nháp luân phiên
// ─────────────────────────────────────────────────────────
#let layout-2col-draft(body, nháp-pct: 22%, ..args) = {
  show: layout-draft.with(nháp-pct: nháp-pct, ..args.named())
  show heading.where(level: 1): it => place(
    top + start,
    float: true,
    clearance: 6pt,
    block(width: 100%)[#it],
  )
  show heading.where(level: 2): it => place(
    top + start,
    float: true,
    clearance: 4pt,
    block(width: 100%)[#it],
  )
  columns(2, gutter: 12pt, body)
}

// ─────────────────────────────────────────────────────────
// 4. COVER-EXAM — Trang bìa đề thi chính thức
// ─────────────────────────────────────────────────────────
// Tự đứng trên 1 trang riêng (dùng page() bên trong).
//
// Dùng:
//   #cover-exam(
//     department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
//     school: "TRƯỜNG THPT ABC",
//     exam-title: "ĐỀ THI CUỐI KỲ 1",
//     subject: "TOÁN 12",
//     duration: "90 phút",
//     code: "101",
//     date: "15/01/2026",
//     academic-year: "2025 – 2026",
//     note: [Thí sinh được sử dụng máy tính.],
//   )
// ─────────────────────────────────────────────────────────
#let cover-exam(
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  exam-title: "ĐỀ THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  code: "101",
  date: none,
  academic-year: "2025 – 2026",
  note: none,
  accent: _td-blue,
  logo: none,
) = page(paper: "a4", margin: (x: 2cm, y: 2.5cm), numbering: none)[

  // Viền kép trang bìa
  #place(top + left, dx: -2cm, dy: -2.5cm, rect(
    width: 21cm,
    height: 29.7cm,
    stroke: (x: 3pt + accent, y: 2pt + accent.lighten(30%)),
    fill: none,
  ))
  #place(top + left, dx: -1.8cm, dy: -2.3cm, rect(
    width: 20.6cm,
    height: 29.3cm,
    stroke: 0.5pt + accent.lighten(60%),
    fill: none,
  ))

  #v(1.5cm)

  // ── Tiêu đề trường ──
  #align(center)[
    #if logo != none {
      logo
      v(0.5em)
    }
    #set text(font: "Libertinus Serif", size: 13pt)
    #text(weight: "bold")[#department] \
    #v(-0.3em)
    #text(weight: "bold", fill: accent, size: 14pt)[#school] \
    #v(0.3em)
    #line(length: 38%, stroke: 2pt + accent)
    #v(0.15em)
    #text(size: 10.5pt, style: "italic")[Năm học #academic-year]
  ]

  #v(2cm)

  // ── Box tiêu đề đề thi ──
  #align(center)[
    #rect(
      fill: accent,
      inset: (x: 2cm, y: 1.2cm),
      radius: 8pt,
      width: 88%,
    )[
      #text(fill: white, size: 20pt, weight: "bold")[#upper(exam-title)]
      #v(0.3em)
      #text(fill: white.transparentize(15%), size: 13pt, weight: "bold")[MÔN: #upper(subject)]
      #v(0.4em)
      #text(fill: white.transparentize(10%), size: 11.5pt, style: "italic")[
        Thời gian làm bài: #duration
        #if code != "" [ · Mã đề: *#code*]
      ]
    ]
  ]

  #v(1.5cm)

  // ── Thông tin thí sinh ──
  #align(center)[
    #box(
      width: 80%,
      stroke: 0.8pt + accent.lighten(40%),
      inset: (x: 1.5cm, y: 1.2cm),
      radius: 6pt,
    )[
      #grid(
        columns: (auto, 1fr),
        row-gutter: 12pt,
        column-gutter: 6pt,
        align: (left + bottom, left + bottom),
        text(weight: "bold")[Họ và tên thí sinh:], line(length: 100%, stroke: (paint: luma(150), dash: "dotted")),
        text(weight: "bold")[Số Báo Danh:], line(length: 100%, stroke: (paint: luma(150), dash: "dotted")),
        text(weight: "bold")[Phòng thi:], line(length: 100%, stroke: (paint: luma(150), dash: "dotted")),
      )
    ]
  ]

  #v(1cm)
  #if date != none {
    align(center)[#text(size: 11pt, style: "italic")[📅 Ngày thi: #date]]
    v(0.5cm)
  }

  #if note != none {
    align(center)[
      #block(
        width: 80%,
        fill: accent.lighten(90%),
        stroke: 0.8pt + accent.lighten(50%),
        inset: (x: 1cm, y: 0.8cm),
        radius: 5pt,
      )[#text(size: 10.5pt, style: "italic")[#note]]
    ]
  }

  // ── Footer bìa ──
  #place(bottom + center, dy: -0.8cm)[
    #line(length: 60%, stroke: 0.5pt + luma(180))
    #v(0.3em)
    #text(size: 9pt, fill: luma(150), style: "italic")[
      Thí sinh không được sử dụng tài liệu. Cán bộ coi thi không giải thích gì thêm.
    ]
  ]
]

// ─────────────────────────────────────────────────────────
// 5. COVER-CD — Trang bìa chuyên đề
// ─────────────────────────────────────────────────────────
// Thiết kế: gradient header ~40% trang, sóng trang trí, box mô tả.
//
// Dùng:
//   #cover-cd(
//     title: "Thiết Diện Parabol Của Hình Nón",
//     subtitle: "Vận dụng cao THPT Quốc Gia",
//     author: "Thầy Nguyễn Văn A",
//     subject: "Toán", grade: "12",
//     cd-number: "07",
//     series: "Bộ Chuyên Đề Hình Học Không Gian",
//     description: [Phân tích đầy đủ từ lý thuyết đến vận dụng...],
//   )
// ─────────────────────────────────────────────────────────
#let cover-cd(
  title: "CHUYÊN ĐỀ TOÁN",
  subtitle: none,
  author: "Giáo viên",
  subject: "Toán",
  grade: "12",
  academic-year: "2025 – 2026",
  series: none,
  cd-number: none,
  accent: _td-blue,
  accent2: _td-red,
  description: none,
  logo: none,
  cover-note: none,
) = page(paper: "a4", margin: 0pt, numbering: none, background: {
  // Gradient header ~40% chiều cao
  place(top + left, rect(width: 21cm, height: 11.5cm, fill: gradient.linear(accent, accent.lighten(35%), dir: ttb)))
  // Tam giác góc phải
  place(top + right, polygon(
    fill: accent2.lighten(20%).transparentize(55%),
    (21cm, 0cm),
    (21cm, 5cm),
    (15.5cm, 0cm),
  ))
  // Sóng chuyển tiếp header → nội dung
  place(top + left, dy: 10.6cm, path(
    fill: white,
    ((0cm, 0.6cm), (1.5cm, -0.4cm)),
    ((5cm, 0.1cm), (2cm, 0.3cm)),
    ((10cm, 0.55cm), (2cm, -0.3cm)),
    ((15cm, 0.05cm), (2cm, 0.3cm)),
    ((21cm, 0.45cm), (1.5cm, -0.2cm)),
    (21cm, 1.2cm),
    (0cm, 1.2cm),
    closed: true,
  ))
})[
  #v(0.9cm)
  #pad(x: 1.8cm)[
    // Logo + số chuyên đề
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      [
        #if logo != none { logo }
        #if series != none {
          text(fill: white.transparentize(20%), size: 10pt, style: "italic")[#series]
        }
      ],
      if cd-number != none {
        box(
          fill: accent2,
          inset: (x: 12pt, y: 8pt),
          radius: (top-left: 4pt, bottom-left: 8pt, bottom-right: 8pt, top-right: 4pt),
        )[
          #text(fill: white, weight: "bold", size: 11pt)[CD #cd-number]
        ]
      },
    )
    #v(0.6cm)

    // Badge môn / lớp
    #box(fill: accent2, inset: (x: 10pt, y: 6pt), radius: 20pt)[
      #text(fill: white, size: 10pt, weight: "bold")[📚 #subject — Lớp #grade]
    ]

    #v(0.9cm)

    // Tiêu đề chính
    #text(fill: white, size: 25pt, weight: "bold", hyphenate: false)[#title]
    #if subtitle != none {
      v(0.4em)
      text(fill: white.transparentize(20%), size: 13pt, style: "italic")[#subtitle]
    }
  ]

  #v(2.8cm)

  #pad(x: 1.8cm)[
    // Mô tả (nếu có)
    #if description != none {
      block(
        width: 78%,
        fill: white.transparentize(3%),
        stroke: none,
        inset: (x: 16pt, y: 12pt),
        radius: 8pt,
      )[
        #set text(size: 10.5pt, fill: luma(40))
        #description
      ]
      v(1cm)
    }

    #v(1fr)

    // Tác giả + năm học
    #grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      [
        #text(size: 11pt, fill: luma(50))[
          ✍️ *#author*
          #if academic-year != none [
            \ 📅 Năm học #academic-year
          ]
        ]
      ],
      if cover-note != none {
        text(size: 9.5pt, fill: luma(120), style: "italic")[#cover-note]
      },
    )
  ]
]

// ─────────────────────────────────────────────────────────
// 6. COVER-BOOK — Trang bìa sách / tài liệu tham khảo
// ─────────────────────────────────────────────────────────
#let cover-book(
  title: "TÀI LIỆU TOÁN THPT",
  subtitle: none,
  author: "Tác Giả",
  publisher: none,
  year: none,
  edition: none,
  isbn: none,
  accent: _td-blue,
  spine-color: none,
  cover-image: none,
) = page(paper: "a4", margin: 0pt, numbering: none)[

  // Gáy sách (8pt bên trái)
  #place(top + left, rect(width: 8pt, height: 29.7cm, fill: if spine-color != none { spine-color } else { accent }))
  // Header band (gradient ngang)
  #place(top + left, dx: 8pt, rect(width: 20.92cm, height: 8cm, fill: gradient.linear(
    accent,
    accent.darken(25%),
    dir: ltr,
  )))
  // Tam giác trang trí góc phải
  #place(top + right, polygon(
    fill: accent.lighten(30%).transparentize(45%),
    (21cm, 0cm),
    (21cm, 8cm),
    (13cm, 0cm),
  ))
  // Vùng hình ảnh / placeholder giữa
  #place(top + left, dx: 8pt, dy: 8cm, if cover-image != none {
    block(width: 20.92cm, height: 12cm, clip: true, fill: luma(240))[
      #align(center + horizon, cover-image)
    ]
  } else {
    rect(width: 20.92cm, height: 12cm, fill: luma(248), stroke: (
      top: 0.5pt + accent.lighten(40%),
      bottom: 0.5pt + accent.lighten(40%),
    ))
  })

  // Nội dung header
  #pad(left: 1.5cm, right: 1.5cm, top: 0pt)[
    #v(1.2cm)
    #text(fill: white, size: 30pt, weight: "bold")[#title]
    #if subtitle != none {
      v(0.35em)
      text(fill: white.transparentize(20%), size: 14pt, style: "italic")[#subtitle]
    }
    #v(0.65cm)
    #text(fill: white.transparentize(10%), size: 11pt)[*#author*]
    #if edition != none {
      h(1em)
      box(fill: white.transparentize(8%), inset: (x: 8pt, y: 4pt), radius: 3pt)[
        #text(fill: accent, size: 9pt, weight: "bold")[Lần #edition]
      ]
    }
  ]

  // Footer thông tin nhà xuất bản
  #place(bottom + left, dx: 1.5cm, dy: -1.2cm)[
    #grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      [
        #if publisher != none { text(size: 11pt, weight: "bold")[📖 #publisher] }
        #if year != none {
          h(1em)
          text(size: 10pt, fill: luma(100))[#year]
        }
      ],
      if isbn != none { text(size: 9pt, fill: luma(130))[ISBN: #isbn] },
    )
  ]
]

// ─────────────────────────────────────────────────────────
// 7. ANSWER-SHEET — Phiếu trả lời trắc nghiệm
// ─────────────────────────────────────────────────────────
// Tạo 1 trang phiếu trả lời với các ô tròn A/B/C/D.
//
// Dùng:
//   #answer-sheet(n-questions: 40, n-cols: 4)
//   #answer-sheet(n-questions: 50, answers: ("1": "B", "5": "D"))
// ─────────────────────────────────────────────────────────
#let answer-sheet(
  n-questions: 50,
  n-cols: 5,
  options: ("A", "B", "C", "D"),
  accent: _td-blue,
  title: "PHIẾU TRẢ LỜI TRẮC NGHIỆM",
  show-student-info: true,
  answers: (:),
) = page(paper: "a4", margin: (x: 1.5cm, y: 2cm), numbering: none)[

  // ── Tiêu đề ──
  #align(center)[
    #block(
      fill: accent,
      inset: (x: 1.5cm, y: 0.5em),
      radius: 4pt,
      width: 88%,
    )[
      #text(fill: white, weight: "bold", size: 13pt)[#title]
    ]
  ]
  #v(0.5em)

  // ── Thông tin thí sinh ──
  #if show-student-info {
    grid(
      columns: (1fr, 1fr),
      column-gutter: 12pt,
      [
        *Họ và tên:*
        #line(length: 100%, stroke: (paint: luma(150), dash: "dotted"))
        #v(0.2em)
        *Lớp:* #line(length: 100%, stroke: (paint: luma(150), dash: "dotted"))
      ],
      [
        *Số báo danh:*
        #line(length: 100%, stroke: (paint: luma(150), dash: "dotted"))
        #v(0.2em)
        *Mã đề:* #line(length: 100%, stroke: (paint: luma(150), dash: "dotted"))
      ],
    )
    v(0.6em)
    line(length: 100%, stroke: 0.5pt + luma(180))
    v(0.6em)
  }

  // ── Bảng ô tô ──
  #let per-col = calc.ceil(n-questions / n-cols)
  #grid(
    columns: (1fr,) * n-cols,
    column-gutter: 5pt,
    ..range(n-cols).map(ci => {
      let from = ci * per-col + 1
      let to = calc.min((ci + 1) * per-col, n-questions)
      block[
        // Header cột
        #block(
          width: 100%,
          fill: accent.lighten(88%),
          inset: (y: 3pt),
        )[
          #align(center)[
            #set text(size: 7.5pt, weight: "bold")
            #text(fill: accent)[Câu]
            #for opt in options {
              h(3pt)
              text(fill: accent)[#opt]
            }
          ]
        ]
        // Các hàng câu
        #for q in range(from, to + 1) {
          let row-fill = if calc.odd(q) { white } else { luma(250) }
          block(width: 100%, fill: row-fill, inset: (y: 2pt))[
            #align(center)[
              #set text(size: 7.5pt)
              #text(weight: "bold")[#q]
              #for opt in options {
                h(2.5pt)
                let is-ans = answers.at(str(q), default: "") == opt
                box(
                  width: 1.35em,
                  height: 1.35em,
                  stroke: 0.6pt + (if is-ans { accent } else { luma(160) }),
                  fill: if is-ans { accent } else { white },
                  radius: 50%,
                )[
                  #align(center + horizon)[
                    #text(
                      size: 6.5pt,
                      fill: if is-ans { white } else { luma(110) },
                      weight: if is-ans { "bold" } else { "regular" },
                    )[#opt]
                  ]
                ]
              }
            ]
          ]
        }
      ]
    }),
  )
]

// ─────────────────────────────────────────────────────────
// 8. BAREM — Bảng barem / chấm điểm
// ─────────────────────────────────────────────────────────
// items: array of (phần, từ-câu, đến-câu, điểm-câu, ghi-chú)
//
// Dùng:
//   #barem(
//     (
//       ("Trắc nghiệm",  1, 18, [0.25], [Mỗi câu đúng 0.25đ]),
//       ("Đúng / Sai",  19, 22, [0–1],  [a 0.1 · b 0.25 · c 0.5 · d 1.0]),
//       ("Điền số",     23, 24, [0.5],  []),
//       ("Tự luận",     25, 28, [1.0],  [Theo thang điểm chi tiết]),
//     ),
//     total: 10,
//   )
// ─────────────────────────────────────────────────────────
#let barem(
  items,
  accent: _td-blue,
  title: "BẢNG BAREM CHẤM ĐIỂM",
  total: 10,
) = {
  align(center)[
    #block(fill: accent, inset: (x: 1.5cm, y: 0.5em), radius: 4pt, width: 65%)[
      #text(fill: white, weight: "bold", size: 12pt)[#title]
    ]
    #v(0.4em)
    #table(
      columns: (1.8fr, auto, auto, auto, 2fr),
      stroke: 0.5pt + luma(185),
      inset: (x: 8pt, y: 6pt),
      align: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
      table.header(
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Phần / Dạng câu]],
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Từ câu]],
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Đến câu]],
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Điểm / câu]],
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Ghi chú]],
      ),
      ..items
        .enumerate()
        .map(((i, row)) => {
          let bg = if calc.odd(i) { luma(250) } else { white }
          let (phan, from, to, pts, note) = row
          (
            table.cell(fill: bg)[#phan],
            table.cell(fill: bg, align: center)[#from],
            table.cell(fill: bg, align: center)[#to],
            table.cell(fill: bg, align: center)[#pts],
            table.cell(fill: bg)[#note],
          )
        })
        .flatten(),
      // Dòng tổng
      table.cell(colspan: 3, fill: accent.lighten(88%))[
        #text(weight: "bold", fill: accent)[TỔNG ĐIỂM]
      ],
      table.cell(fill: accent.lighten(88%), align: center)[
        #text(weight: "bold", fill: accent, size: 13pt)[#total]
      ],
      table.cell(fill: accent.lighten(88%))[],
    )
  ]
}

// ─────────────────────────────────────────────────────────
// 9. MATRIX-BOX — Ma trận đề / bảng đặc tả
// ─────────────────────────────────────────────────────────
// items: array of (chủ-đề, chương, mức-độ, số-câu)
//
// Dùng:
//   #matrix-box((
//     ("Hàm số bậc 4", "Chương 1", "NB:2 TH:2 VD:2 VDC:1", "7 câu"),
//     ("Hình học KG",  "Chương 3", "NB:2 TH:2 VD:2 VDC:2", "8 câu"),
//   ))
// ─────────────────────────────────────────────────────────
#let matrix-box(
  items,
  accent: _td-blue,
  title: "MA TRẬN ĐỀ THI",
) = {
  align(center)[
    #block(fill: accent, inset: (x: 1.5cm, y: 0.5em), radius: 4pt, width: 65%)[
      #text(fill: white, weight: "bold", size: 12pt)[#title]
    ]
    #v(0.4em)
    #table(
      columns: (2fr, 1.5fr, 2fr, 1.5fr),
      stroke: 0.5pt + luma(185),
      inset: (x: 8pt, y: 6pt),
      align: (left, center, left, center),
      table.header(
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Chủ đề]],
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Chương]],
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Mức độ nhận thức]],
        table.cell(fill: accent)[#text(fill: white, weight: "bold")[Số câu]],
      ),
      ..items
        .enumerate()
        .map(((i, row)) => {
          let bg = if calc.odd(i) { luma(250) } else { white }
          row.map(cell => table.cell(fill: bg)[#cell])
        })
        .flatten(),
    )
  ]
}

// ─────────────────────────────────────────────────────────
// 10. STUDENT-BLOCK — Block thông tin thí sinh nâng cao
// ─────────────────────────────────────────────────────────
#let student-block(
  show-room: true,
  show-code: true,
  show-dob: false,
  accent: _td-blue,
) = {
  block(
    width: 100%,
    stroke: 0.8pt + accent.lighten(50%),
    inset: (x: 12pt, y: 10pt),
    radius: 5pt,
    fill: accent.lighten(95%),
  )[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 16pt,
      row-gutter: 9pt,
      align: (left + bottom, left + bottom),
      [*Họ và tên thí sinh:*
        #line(length: 100%, stroke: (paint: luma(150), dash: "dotted"))],
      if show-dob {
        [*Ngày sinh:* #line(length: 100%, stroke: (paint: luma(150), dash: "dotted"))]
      } else {
        [*Lớp / Khối:* #line(length: 100%, stroke: (paint: luma(150), dash: "dotted"))]
      },

      [*Số Báo Danh:*
        #box(stroke: 0.7pt + luma(150), inset: (x: 6pt, y: 3pt), width: 3.5cm)[]],
      if show-room {
        [*Phòng thi:* #box(stroke: 0.7pt + luma(150), inset: (x: 6pt, y: 3pt), width: 2cm)[]]
      } else if show-code {
        box(stroke: 0.8pt + accent, inset: (x: 9pt, y: 6pt))[
          #text(weight: "bold")[Mã đề: #box(stroke: 0.7pt + luma(150), inset: (x: 6pt, y: 3pt), width: 1.5cm)[]]
        ]
      } else { [] },
    )
  ]
}

// ─────────────────────────────────────────────────────────
// 11. CHUYENDE-HEADER — Tiêu đề chuyên đề nổi bật
// ─────────────────────────────────────────────────────────
// Giống kiểu header trong file CD-Thiet-Dien-Parabol-Hinh-Non.typ,
// nhưng có thêm tuỳ chọn màu sắc và phụ đề.
//
// Dùng:
//   #chuyende-header(
//     title: "Chuyên Đề: Thiết Diện Parabol Của Hình Nón",
//     subtitle: "Mặt phẳng song song đường sinh · Diện tích · Thể tích",
//   )
// ─────────────────────────────────────────────────────────
#let chuyende-header(
  title: "CHUYÊN ĐỀ: TÊN CHUYÊN ĐỀ",
  subtitle: none,
  accent: _td-blue,
  width: 95%,
) = {
  align(center)[
    #rect(
      fill: accent.lighten(95%),
      stroke: (
        left: 5pt + accent,
        top: 0.5pt + accent.lighten(50%),
        right: 0.5pt + accent.lighten(50%),
        bottom: 0.5pt + accent.lighten(50%),
      ),
      inset: (x: 16pt, y: 14pt),
      width: width,
      radius: (right: 5pt),
    )[
      #text(size: 16pt, weight: "bold", fill: accent)[#title]
      #if subtitle != none {
        v(0.4em)
        text(size: 10.5pt, style: "italic", fill: luma(80))[#subtitle]
      }
    ]
  ]
  v(0.5em)
}

// ─────────────────────────────────────────────────────────
// 12. PART-FANCY — Tiêu đề phần đẹp hơn
// ─────────────────────────────────────────────────────────
// Thay thế exam-part() khi muốn nhiều tuỳ chọn hơn.
//
// Dùng:
//   #part-fancy([Phần I — Trắc Nghiệm], icon: "I", count-label: "18 câu")
// ─────────────────────────────────────────────────────────
#let part-fancy(
  title,
  subtitle: none,
  icon: none,
  count-label: none,
  accent: _td-blue,
) = {
  block(width: 100%, below: 1.2em, above: 1.5em)[
    #grid(
      columns: (
        if icon != none { auto } else { 0pt },
        1fr,
        if count-label != none { auto } else { 0pt },
      ),
      column-gutter: 9pt,
      align: (center + horizon, left + horizon, right + horizon),
      // Icon
      if icon != none {
        box(
          fill: accent,
          inset: (x: 9pt, y: 7pt),
          radius: 50%,
        )[#text(fill: white, weight: "bold", size: 11pt)[#icon]]
      },
      // Tiêu đề
      block(
        fill: gradient.linear(accent.lighten(90%), white, dir: ltr),
        stroke: (left: 4pt + accent, rest: 0.5pt + accent.lighten(60%)),
        inset: (left: 12pt, right: 8pt, y: 8pt),
        radius: (right: 4pt),
        width: 100%,
      )[
        #text(weight: "bold", fill: accent)[#title]
        #if subtitle != none [
          #h(0.5em)
          #text(style: "italic", fill: luma(80), size: 0.88em)[— #subtitle]
        ]
      ],
      // Đếm câu
      if count-label != none {
        text(size: 9pt, fill: luma(120), style: "italic")[(#count-label)]
      },
    )
  ]
}

// ─────────────────────────────────────────────────────────
// 13. CALLOUT — Hộp thông báo đa phong cách
// ─────────────────────────────────────────────────────────
// type: "info" | "warn" | "success" | "error" | "tip" | "quote"
//
// Dùng:
//   #callout[Nội dung ở đây]
//   #callout(type: "warn", title: [Lưu ý!])[Đây là cảnh báo]
//   #warn(title: [Cẩn thận!])[Text]
//   #tip-box[Mẹo hay]
// ─────────────────────────────────────────────────────────
#let _ct-styles = (
  info: (icon: "ℹ", ac: rgb("#1d4ed8"), fill: rgb("#eff6ff")),
  warn: (icon: "⚠", ac: rgb("#d97706"), fill: rgb("#fffbeb")),
  success: (icon: "✓", ac: rgb("#15803d"), fill: rgb("#f0fdf4")),
  error: (icon: "✕", ac: rgb("#b91c1c"), fill: rgb("#fff1f2")),
  tip: (icon: "💡", ac: rgb("#c2185b"), fill: rgb("#fce4ec")),
  quote: (icon: "❝", ac: rgb("#6b21a8"), fill: rgb("#faf5ff")),
  dark: (icon: "★", ac: rgb("#1e293b"), fill: rgb("#f8fafc")),
)

#let callout(body, type: "info", title: none, ..args) = {
  let s = _ct-styles.at(type, default: _ct-styles.info)
  block(
    width: 100%,
    below: 0.85em,
    fill: s.fill,
    stroke: (left: 5pt + s.ac, rest: 0.6pt + s.ac.lighten(55%)),
    inset: (left: 12pt, right: 10pt, top: 8pt, bottom: 8pt),
    radius: (right: 5pt),
  )[
    #text(weight: "bold", fill: s.ac)[
      #s.icon
      #if title != none [#h(3pt) #title]
    ]
    #if title != none { v(0.2em) }
    #set text(fill: luma(30))
    #body
  ]
}

// Alias tiện lợi
#let info(body, ..a) = callout(body, type: "info", ..a.named())
#let warn(body, ..a) = callout(body, type: "warn", ..a.named())
#let success-box(body, ..a) = callout(body, type: "success", ..a.named())
#let tip-box(body, ..a) = callout(body, type: "tip", ..a.named())
#let quote-box(body, ..a) = callout(body, type: "quote", ..a.named())

// ─────────────────────────────────────────────────────────
// 14. DECO-LINE — Đường trang trí
// ─────────────────────────────────────────────────────────
// style: "double" | "gradient" | "dots" | "single"
// ─────────────────────────────────────────────────────────
#let deco-line(accent: _td-blue, style: "double") = {
  if style == "double" {
    line(length: 100%, stroke: 1.5pt + accent)
    v(-0.35em)
    line(length: 100%, stroke: 0.4pt + accent.lighten(40%))
  } else if style == "gradient" {
    block(width: 100%, height: 2pt)[
      #rect(width: 100%, height: 2pt, fill: gradient.linear(white, accent, accent, white, dir: ltr))
    ]
  } else if style == "dots" {
    align(center)[
      #text(fill: accent.lighten(30%), size: 14pt)[· · · · · · · · · ·]
    ]
  } else {
    line(length: 100%, stroke: 1pt + accent)
  }
}

// ─────────────────────────────────────────────────────────
// 15. STAMP — Con dấu mờ (NHÁP / BẢO MẬT / chữ tuỳ ý)
// ─────────────────────────────────────────────────────────
// Dùng trong background hoặc trực tiếp trong body:
//   #set page(background: stamp(label: "BẢN NHÁP"))
//   #stamp()   ← dùng trực tiếp trong body (đè lên nội dung)
// ─────────────────────────────────────────────────────────
#let stamp(
  label: "BẢN NHÁP",
  color: rgb("#cc2200"),
  angle: -35deg,
  opacity: 0.10,
) = place(
  center + horizon,
  rotate(angle, text(
    size: 52pt,
    weight: "bold",
    fill: color.transparentize(100% - opacity * 100%),
    tracking: 6pt,
  )[#upper(label)]),
)

// ─────────────────────────────────────────────────────────
// 16. QR-PLACEHOLDER — Ô placeholder QR code
// ─────────────────────────────────────────────────────────
#let qr-placeholder(size: 2.5cm, label: "Mã QR", url: none) = {
  box(width: size, height: size, stroke: 0.8pt + luma(160), fill: white)[
    #align(center + horizon)[
      #grid(
        columns: (auto,) * 7, rows: (auto,) * 7,
        ..range(49).map(i => {
          let r = calc.div-euclid(i, 7)
          let c = calc.rem(i, 7)
          let border = r == 0 or r == 6 or c == 0 or c == 6
          let inner = r >= 2 and r <= 4 and c >= 2 and c <= 4
          rect(
            width: size / 9,
            height: size / 9,
            fill: if border or inner { luma(30) } else if calc.odd(r + c) { luma(200) } else { white },
          )
        }),
      )
      #if url != none {
        v(2pt)
        text(size: 5pt, fill: luma(150))[#url]
      }
    ]
  ]
}

// ─────────────────────────────────────────────────────────
// 17. OPTION-BOX — MCQ options trong ô riêng, tuỳ cols
// ─────────────────────────────────────────────────────────
// Dùng thay thế phần options bên trong mcq/tn khi muốn boxed style.
// Cũng có thể dùng standalone:
//   #option-box(
//     ($2x-3$, $x+1$, $4x^2$, $-x$),
//     correct: (1,),   // 1-indexed
//     mode: "loigiai",
//   )
// ─────────────────────────────────────────────────────────
#let option-box(
  opts,
  labels: ("A", "B", "C", "D"),
  correct: (),
  accent: _td-blue,
  wrong-accent: _td-red,
  cols: 2,
  mode: "dethi",
) = {
  let n = opts.len()
  let show-ans = mode != "dethi"
  grid(
    columns: (1fr,) * calc.min(cols, n),
    column-gutter: 6pt, row-gutter: 5pt,
    ..range(n).map(i => {
      let is-ok = correct.contains(i + 1)
      let bg = if show-ans and is-ok { accent.lighten(88%) } else { white }
      let bdr = if show-ans and is-ok { accent } else { luma(180) }
      box(
        width: 1fr,
        fill: bg,
        stroke: 0.7pt + bdr,
        inset: (x: 8pt, y: 6pt),
        radius: 4pt,
      )[
        #text(weight: "bold", fill: if show-ans and is-ok { accent } else {
          luma(60)
        })[#labels.at(i, default: str(i + 1)).]
        #h(4pt)
        #opts.at(i)
      ]
    }),
  )
}

// ─────────────────────────────────────────────────────────
// 18. EXAM-2COL-WRAP — Bọc câu hỏi thành 2 cột cục bộ
// ─────────────────────────────────────────────────────────
// Chỉ bọc nội dung được truyền vào, không ảnh hưởng phần khác.
//
// Dùng:
//   #exam-2col-wrap[
//     #tn(...) #tn(...) #tn(...)
//   ]
// ─────────────────────────────────────────────────────────
#let exam-2col-wrap(body, gutter: 14pt) = columns(2, gutter: gutter, body)

// ─────────────────────────────────────────────────────────
// 19. TIMELINE — Dòng thời gian / quy trình giải
// ─────────────────────────────────────────────────────────
// Dùng:
//   #timeline((
//     [Xác định tham số $k$ từ vị trí mặt phẳng cắt.],
//     [Thay vào phương trình hình nón để thu parabol.],
//     [Rút đỉnh, dây cung, diện tích.],
//   ))
// ─────────────────────────────────────────────────────────
#let timeline(items, accent: _td-blue) = {
  block(width: 100%)[
    #for (i, item) in items.enumerate() {
      grid(
        columns: (28pt, 1fr),
        column-gutter: 8pt,
        align: (center + top, left + top),
        [
          #box(
            width: 22pt,
            height: 22pt,
            fill: accent,
            radius: 50%,
          )[
            #align(center + horizon)[
              #text(fill: white, weight: "bold", size: 10pt)[#(i + 1)]
            ]
          ]
          #if i < items.len() - 1 {
            v(0.1em)
            align(center, line(start: (0pt, 0pt), end: (0pt, 0.8em), stroke: (
              paint: accent.lighten(40%),
              thickness: 2pt,
            )))
          }
        ],
        block(below: 1em, above: 0.1em)[#item],
      )
    }
  ]
}

// ─────────────────────────────────────────────────────────
// 20. PROGRESS-STRIP — Dải tiến trình (bộ đề nhiều đề)
// ─────────────────────────────────────────────────────────
// Dùng ở đầu mỗi đề trong bộ đề:
//   #progress-strip(current: 2, total: 5, label: "Đề")
// ─────────────────────────────────────────────────────────
#let progress-strip(
  current: 1,
  total: 5,
  label: "Đề",
  accent: _td-blue,
) = {
  block(width: 100%, below: 0.5em)[
    #stack(
      dir: ltr,
      spacing: 4pt,
      ..range(total).map(i => box(
        width: 1fr,
        height: 6pt,
        fill: if i + 1 == current { accent } else if i + 1 < current { accent.lighten(30%) } else { luma(218) },
        radius: 3pt,
      )),
    )
    #v(-0.1em)
    #align(right)[
      #text(size: 8pt, fill: luma(130), style: "italic")[#label #current / #total]
    ]
  ]
}
