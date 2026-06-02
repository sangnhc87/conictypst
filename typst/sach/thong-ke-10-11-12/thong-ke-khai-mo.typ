#import "_theme.typ": *

// ═══════════════════════════════════════════════════════════════════
// TƯ DUY ĐẠI BÁC DIỆT RUỒI — TẬP 4: THỐNG KÊ
// TỪ LỚP 10, 11 ĐẾN THỐNG KÊ GHÉP NHÓM LỚP 12
// ═══════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8pt, fill: rgb("#607D8B"), style: "italic")[
            Tư Duy Đại Bác Diệt Ruồi — Tập 4: Thống Kê
          ]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb("#0F766E"), weight: "bold")[
            Từ Lớp 10, 11 Đến Thống Kê Ghép Nhóm Lớp 12
          ]
        ],
      )
      v(2pt)
      line(length: 100%, stroke: 0.4pt + rgb("#CFD8DC"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 {
      text(size: 9pt, fill: rgb("#607D8B"))[— #counter(page).display() —]
    }
  }),
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#0A0A0A"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display
#show heading: it => {
  set par(first-line-indent: 0em)
  it
}

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(
    fill: gradient.linear(C-FOREST, C-EMERALD, angle: 90deg),
    inset: (x: 16pt, y: 10pt),
    radius: 5pt,
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: white, weight: "black", size: 14pt)[#it.body]
  ]
  v(0.9em)
}

#show heading.where(level: 2): it => block(
  fill: rgb("#F0FDFA"),
  stroke: (left: 4pt + C-EMERALD),
  inset: (x: 14pt, y: 10pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 0.6em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-FOREST, weight: "bold", size: 12pt)[#it.body]
]

#cover-box(
  [TẬP 4: THỐNG KÊ],
  [Một Con Đường Từ Việc Đọc Bảng Số Liệu Tới Tư Duy Ghép Nhóm Và Độ Phân Tán],
)

#v(1em)

#align(center)[
  #block(
    fill: rgb("#FFF9C4"),
    stroke: 0.8pt + rgb("#FBC02D"),
    inset: 12pt,
    radius: 6pt,
    width: 92%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: rgb("#8D6E00"), weight: "bold")[Lời mở đầu của Tập 4]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      "Nếu ba tập đầu của bộ này đi qua sự thay đổi, khả năng và sự tích lũy, thì tập này đi vào một năng lực rất đời thường nhưng cực sâu: đọc dữ liệu.#linebreak()
      Thống kê ở phổ thông thường bị dạy như một chuỗi công thức bấm nhanh: trung bình, trung vị, phương sai, độ lệch chuẩn. Nhưng lõi của nó không phải là bấm. Lõi của nó là học cách biến một đám số lộn xộn thành một câu chuyện có cấu trúc.#linebreak()
      Quyển này đi từ trực giác lớp 10 và 11 tới thống kê ghép nhóm lớp 12, với mục tiêu không chỉ làm được bài mà còn hiểu mình đang đo cái gì, đang mất thông tin ở đâu, và đang kết luận điều gì từ dữ liệu."
    ]
  ]
]

#v(0.9em)

#quote-block[
  Dữ liệu không tự nói. Nó chỉ nói khi ta biết hỏi đúng câu hỏi: cái gì là điển hình, cái gì là bất thường, dữ liệu phân tán đến đâu, và ta đã nén bao nhiêu thông tin khi thay cả một đám số bằng chỉ vài đại lượng đại diện.
]

#v(1em)

#outline(title: [Mục Lục Tập 4], depth: 2)

#pagebreak()

#include "parts/01-khai-mo.typ"

#include "parts/01b-dao-sau.typ"

#include "parts/02-xuong-ghep-nhom.typ"
