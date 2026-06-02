// ════════════════════════════════════════════════════════════════════
// BÌA SÁCH — tách riêng để dễ chỉnh màu / layout
// ════════════════════════════════════════════════════════════════════
#import "_config.typ": *

#{
  // ── Nền toàn trang ──
  place(top + left, dx: -2cm, dy: -1.8cm, rect(width: 210mm, height: 297mm, fill: c-book, radius: 0pt))
  // ── Dải trái — gradient 5 phần theo chiều dọc ──
  let part-colors = (c-p1, c-p2, c-p3, c-p4, c-p5)
  let strip-h = 297mm / 5
  for (i, col) in part-colors.enumerate() {
    place(top + left, dx: -2cm, dy: -1.8cm + i * strip-h, rect(width: 6mm, height: strip-h, fill: col, radius: 0pt))
  }
  // ── Dải 5 màu dưới ──
  place(bottom + left, dx: -2cm, dy: 1.8cm, block(width: 210mm, height: 18mm)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      rows: 18mm,
      rect(fill: c-p1, stroke: none),
      rect(fill: c-p2, stroke: none),
      rect(fill: c-p3, stroke: none),
      rect(fill: c-p4, stroke: none),
      rect(fill: c-p5, stroke: none),
    )
  ])

  v(26mm)
  align(center, {
    // ── Nhãn chuyên đề ──
    box(
      stroke: 1pt + white.transparentize(50%),
      fill: white.transparentize(85%),
      inset: (x: 18pt, y: 7pt),
      radius: 20pt,
    )[
      #text(fill: white, weight: "bold", size: 10pt, tracking: 0.07em)[
        ◆ CHUYÊN ĐỀ TOÁN 12  ·  2025 – 2026
      ]
    ]
    v(1.5em)
    // ── Công thức trang trí ──
    text(fill: white.transparentize(45%), size: 11pt)[
      $integral_a^b f(x) d x = F(b) - F(a)$
    ]
    v(1.4em)
    // ── Khung tiêu đề chính ──
    block(
      width: 88%,
      fill: white,
      inset: (top: 0pt, bottom: 22pt, x: 24pt),
      radius: 12pt,
      {
        block(
          width: 100%,
          height: 6pt,
          fill: c-p1,
          radius: (top-left: 12pt, top-right: 12pt, bottom-left: 0pt, bottom-right: 0pt),
        )
        v(1.2em)
        text(size: 26pt, weight: "bold", fill: c-book)[TÍCH PHÂN]
        linebreak()
        text(size: 16pt, weight: "bold", fill: c-p1)[ỨNG DỤNG THỰC TẾ]
        v(0.7em)
        line(length: 100%, stroke: 1.5pt + c-p1.lighten(55%))
        v(0.6em)
        text(size: 10.5pt, style: "italic", fill: rgb("#475569"))[
          Từ Tích lũy đến Hình khối · Toán 12 GDPT 2018 · Luyện thi ĐGNL
        ]
        v(1.2em)
        // ── Nhãn 5 phần ──
        grid(
          columns: (1fr, 1fr, 1fr, 1fr, 1fr),
          column-gutter: 5pt,
          block(fill: c-p1, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.1]]
          ],
          block(fill: c-p2, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.2]]
          ],
          block(fill: c-p3, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.3]]
          ],
          block(fill: c-p4, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.4]]
          ],
          block(fill: c-p5, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[P.5]]
          ],
        )
      },
    )
    v(1.8em)
    // ── Số liệu thống kê ──
    grid(
      columns: (auto, auto, auto),
      column-gutter: 12pt,
      align: center,
      box(
        fill: white.transparentize(82%),
        stroke: 1pt + white.transparentize(55%),
        inset: (x: 18pt, y: 10pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 17pt)[5]
        #linebreak()
        #text(fill: white.transparentize(30%), size: 9pt, tracking: 0.04em)[PHẦN]
      ],
      box(
        fill: white.transparentize(82%),
        stroke: 1pt + white.transparentize(55%),
        inset: (x: 18pt, y: 10pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 17pt)[12]
        #linebreak()
        #text(fill: white.transparentize(30%), size: 9pt, tracking: 0.04em)[CHỦ ĐỀ]
      ],
      box(
        fill: white.transparentize(82%),
        stroke: 1pt + white.transparentize(55%),
        inset: (x: 18pt, y: 10pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 17pt)[12]
        #linebreak()
        #text(fill: white.transparentize(30%), size: 9pt, tracking: 0.04em)[Lớp]
      ],
    )
    v(2em)
    // ── Tác giả ──
    box(stroke: 1pt + white.transparentize(45%), inset: (x: 22pt, y: 13pt), radius: 8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ GV Nguyễn Văn Sang]
      #linebreak()
      #text(fill: white.transparentize(40%), size: 9.5pt)[
        Tổ Toán – Bộ tài liệu Thực chiến ĐGNL
      ]
    ]
  })
  pagebreak()
}
