"// ═══════════════════════════════════════════════════════════════════════
// LỊCH SỬ ĐẠI SỐ TỔ HỢP — TỪ ĐẾM ĐẾN TOÁN HỌC HIỆN ĐẠI
// Một hành trình xuyên thời gian qua các bài toán, phát minh và con người
// Biên soạn: Nguyễn Văn Sang
// ═══════════════════════════════════════════════════════════════════════

#set page(
  paper: \"a4\",
  margin: (x: 1.7cm, top: 2.4cm, bottom: 2.8cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8pt, fill: rgb(\"#6B4A1E\"), style: \"italic\")[
            Lịch Sử Đại Số Tổ Hợp — Từ Đếm Đến Toán Học Hiện Đại
          ]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb(\"#7B1D1D\"), weight: \"bold\")[
            Nguyễn Văn Sang
          ]
        ],
      )
      v(2pt)
      line(length: 100%, stroke: 0.5pt + rgb(\"#C4A265\"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 {
      line(length: 100%, stroke: 0.4pt + rgb(\"#E8D9C0\"))
      v(2pt)
      text(size: 9pt, fill: rgb(\"#8B7355\"))[— #counter(page).display() —]
    }
  }),
)

#set text(font: \"New Computer Modern\", size: 10.5pt, lang: \"vi\")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb(\"#1A0A00\"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display
#show heading: it => {
  set par(first-line-indent: 0em)
  it
}

// ─── Màu sắ
<truncated 109106 bytes>