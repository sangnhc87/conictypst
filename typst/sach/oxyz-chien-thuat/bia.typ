// ════════════════════════════════════════════════════════════════════
// BÌA SÁCH — tách riêng để dễ chỉnh màu / layout
// ════════════════════════════════════════════════════════════════════
#import "_config.typ": *

// ─── Màu bìa (chỉnh tại đây) ─────────────────────────────────────
// #let c-book = rgb("#0a0f1e")  // ví dụ: tối hơn

#{
  // ── Nền toàn trang ──
  place(top + left, dx: -2cm, dy: -1.8cm, rect(width: 210mm, height: 297mm, fill: c-book, radius: 0pt))
  // ── Dải 7 màu trái (mỗi dải ≈ 4mm) ──
  let part-colors = (c-p1, c-p2, c-p3, c-p4, c-p5, c-p6, c-p7)
  let strip-h = 297mm / 7
  for (i, col) in part-colors.enumerate() {
    place(top + left, dx: -2cm, dy: -1.8cm + i * strip-h,
      rect(width: 6mm, height: strip-h, fill: col, radius: 0pt))
  }
  // ── Dải 7 màu dưới ──
  place(bottom + left, dx: -2cm, dy: 1.8cm, block(width: 210mm, height: 18mm)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      rows: 18mm,
      rect(fill: c-p1, stroke: none),
      rect(fill: c-p2, stroke: none),
      rect(fill: c-p3, stroke: none),
      rect(fill: c-p4, stroke: none),
      rect(fill: c-p5, stroke: none),
      rect(fill: c-p6, stroke: none),
      rect(fill: c-p7, stroke: none),
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
      $arrow(O M) = x arrow(i) + y arrow(j) + z arrow(k)$
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
        text(size: 28pt, weight: "bold", fill: c-book)[OXYZ THỰC TẾ]
        linebreak()
        text(size: 14pt, weight: "bold", fill: c-p1)[KỶ NGUYÊN SỐ & KHÔNG GIAN CHIẾN THUẬT]
        v(0.7em)
        line(length: 100%, stroke: 1.5pt + c-p1.lighten(55%))
        v(0.6em)
        text(size: 10.5pt, style: "italic", fill: rgb("#475569"))[
          Hình học Giải tích 3D · Toán 12 · Luyện thi ĐGNL
        ]
        v(1.2em)
        // ── Nhãn 7 phần ──
        grid(
          columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
          column-gutter: 4pt,
          block(fill: c-p1, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[P.1]]
          ],
          block(fill: c-p2, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[P.2]]
          ],
          block(fill: c-p3, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[P.3]]
          ],
          block(fill: c-p4, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[P.4]]
          ],
          block(fill: c-p5, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[P.5]]
          ],
          block(fill: c-p6, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[P.6]]
          ],
          block(fill: c-p7, inset: (x: 2pt, y: 6pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[P.7]]
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
        #text(fill: white, weight: "bold", size: 17pt)[7]
        #linebreak()
        #text(fill: white.transparentize(30%), size: 9pt, tracking: 0.04em)[PHẦN]
      ],
      box(
        fill: white.transparentize(82%),
        stroke: 1pt + white.transparentize(55%),
        inset: (x: 18pt, y: 10pt),
        radius: 8pt,
      )[
        #text(fill: white, weight: "bold", size: 17pt)[17]
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
