#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

// ═══════════════════════════════════════════════════════════════════
// TƯ DUY ĐẠI BÁC DIỆT RUỒI — TẬP 3: NGUYÊN HÀM, TÍCH PHÂN VÀ ỨNG DỤNG
// CHƯƠNG 3: TOÁN HỌC CỦA SỰ TÍCH LŨY
// BẢN KHAI MỞ + XƯỞNG CHIỀU SÂU
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
            Tư Duy Đại Bác Diệt Ruồi — Tập 3: Nguyên Hàm, Tích Phân Và Ứng Dụng
          ]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb("#0F766E"), weight: "bold")[
            Chương 3: Toán Học Của Sự Tích Lũy
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
    fill: gradient.linear(C-FOREST, C-TEAL, angle: 90deg),
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
  [TẬP 3: NGUYÊN HÀM, TÍCH PHÂN VÀ ỨNG DỤNG],
  [Một Con Đường Từ Sự Thay Đổi Cục Bộ Tới Sự Tích Lũy Toàn Cục],
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
    #text(fill: rgb("#8D6E00"), weight: "bold")[Lời mở đầu của Tập 3]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      "Nếu đạo hàm là con mắt nhìn thấy sự thay đổi, thì nguyên hàm và tích phân là trí nhớ của cả một quá trình.#linebreak()
      Chúng dạy ta cách phục hồi cái toàn cục từ cái cục bộ, cách đọc tổng lượng từ tốc độ, cách đi từ đường cong tới diện tích, từ thiết diện tới thể tích, từ chi phí biên tới tổng chi phí.#linebreak()
      Đây không phải chỉ là một chương công thức. Đây là cánh cửa dẫn vào toán học của sự tích lũy."
    ]
  ]
]

#v(0.9em)

#quote-block[
  Có những ý tưởng toán học làm thay đổi cách ta nhìn thế giới. Tích phân là một trong số đó. Nó khiến ta hiểu rằng đôi khi muốn biết "tổng cộng bao nhiêu", ta không cần nhìn vật thể như một khối cứng đã hoàn tất; ta có thể nhìn nó như kết quả của vô số đóng góp cực nhỏ được cộng dồn lại.
]

#v(1em)

#outline(title: [Mục Lục Tập 3], depth: 2)

#pagebreak()

#include "parts/01-khai-mo.typ"

#include "parts/02-xuong-chieu-sau.typ"
