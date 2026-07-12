#import "@preview/fontawesome:0.2.1": *

// 1. COLOR PALETTE
#let c-teal = rgb("#10868f")
#let c-darkblue = rgb("#0a063b")
#let c-orange = rgb("#f26422")
#let c-green = rgb("#4caf50")

#let c-def-line = rgb("#f44336")
#let c-def-bg = rgb("#ffebee")
#let c-theo-line = rgb("#2196f3")
#let c-theo-bg = rgb("#e3f2fd")
#let c-prop-line = rgb("#4caf50")
#let c-prop-bg = rgb("#e8f5e9")

// 2. PAGE SETUP
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 1.5cm, right: 1.5cm),
  header-ascent: 30%,
  footer-descent: 30%,
  header: context {
    let w = 100% + 4cm
    place(top + left, dx: -2cm, dy: -3cm, box(width: w, height: 4.5cm, clip: true)[
      #place(top + right, dx: 15%, dy: -30%, ellipse(width: 150%, height: 5.5cm, fill: c-orange))
      #place(top + right, dx: 10%, dy: -40%, ellipse(width: 145%, height: 5cm, fill: c-teal.lighten(15%)))
      #place(top + right, dx: 5%, dy: -50%, ellipse(width: 140%, height: 5cm, fill: c-teal))
      
      #align(bottom)[
        #pad(bottom: 15pt, left: 2.5cm, right: 2.5cm)[
          #grid(
            columns: (1fr, auto),
            align(left)[
              #text(fill: white, weight: "bold", size: 12pt)[LỚP TOÁN THẦY SANG] \
              #text(fill: white.darken(10%), size: 9pt)[Tài liệu luyện thi THPT Quốc Gia]
            ],
            align(right)[
              #text(fill: white, weight: "bold", size: 11pt)[ĐT: 09.1234.5678] \
              #text(fill: white.darken(10%), size: 9pt)[fb.com/loptoanthaysang]
            ]
          )
        ]
      ]
    ])
  },
  footer: context {
    let w = 100% + 4cm
    place(bottom + left, dx: -2cm, dy: 2.5cm, box(width: w, height: 4.5cm, clip: true)[
      #place(bottom + left, dx: -15%, dy: 30%, ellipse(width: 150%, height: 5.5cm, fill: c-orange))
      #place(bottom + left, dx: -10%, dy: 40%, ellipse(width: 145%, height: 5cm, fill: c-teal.lighten(15%)))
      #place(bottom + left, dx: -5%, dy: 50%, ellipse(width: 140%, height: 5cm, fill: c-teal))
      
      #align(top)[
        #pad(top: 25pt, left: 2.5cm, right: 2.5cm)[
          #grid(
            columns: (1fr, auto, 1fr),
            align: horizon,
            [
              #align(left)[
                #text(fill: white, weight: "bold", size: 9pt)[SANG MATH] \
                #text(fill: white.darken(20%), size: 8pt, style: "italic")[Tài liệu lưu hành nội bộ]
              ]
            ],
            [
              #box(fill: white, stroke: 1.5pt + c-teal, radius: 50%, width: 32pt, height: 32pt)[
                #align(center + horizon)[#text(fill: c-teal, weight: "bold", size: 11pt)[#counter(page).display("1")]]
              ]
            ],
            [
              #align(right)[
                #text(fill: white, weight: "bold", size: 9pt)[CHUYÊN ĐỀ HÀM SỐ] \
                #text(fill: white.darken(20%), size: 8pt, style: "italic")[Biên soạn: Thầy Sang]
              ]
            ]
          )
        ]
      ]
    ])
  }
)

#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.6em)
#set heading(numbering: "1.1")

// 3. TABLE OF CONTENTS STYLING (THE MASTERPIECE)
#show outline.entry.where(level: 1): it => {
  v(15pt, weak: true)
  box(
    width: 100%,
    fill: c-teal.lighten(90%),
    inset: (x: 10pt, y: 10pt),
    radius: 4pt,
    stroke: (left: 4pt + c-teal),
    text(fill: c-teal, weight: "bold", size: 13pt, it)
  )
}
#show outline.entry.where(level: 2): it => {
  v(10pt, weak: true)
  pad(left: 15pt)[
    #text(fill: c-darkblue, weight: "bold", size: 12pt, it)
  ]
}
#show outline.entry.where(level: 3): it => {
  v(6pt, weak: true)
  pad(left: 35pt)[
    #text(fill: black, size: 11pt, it)
  ]
}

// 4. CHAPTER & LESSON STYLES (NATIVE HEADINGS)
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(1.5cm)
  align(center)[
    #box(width: 90%)[
      // Hộp chữ nằm dưới
      #move(dy: 30pt)[
        #box(width: 100%, fill: c-teal.lighten(90%), stroke: 2pt + c-teal, radius: 12pt, inset: (top: 35pt, bottom: 20pt, left: 15pt, right: 15pt))[
          #text(fill: c-teal, weight: "bold", size: 14pt, tracking: 3pt)[CHƯƠNG]
          #v(0.5em)
          #text(fill: c-darkblue, weight: "bold", size: 22pt)[#it.body]
        ]
      ]
      
      // Huy hiệu nổi lên trên (Vẽ sau nên nằm trên Z-axis)
      #place(top + center, dy: 0pt)[
        #box(fill: c-orange, radius: 50%, width: 60pt, height: 60pt, stroke: 4pt + white)[
          #align(center + horizon)[
            #text(fill: white, weight: "bold", size: 28pt)[#num]
          ]
        ]
      ]
      
      #v(30pt)
    ]
  ]
  v(1cm)
}

#show heading.where(level: 2): it => {
  v(0.5cm)
  grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    box(fill: c-teal, radius: 4pt, inset: 6pt)[
      #text(fill: white, weight: "bold", size: 14pt)[BÀI #context counter(heading).display("1.1")]
    ],
    align(horizon)[
      #text(fill: c-darkblue, weight: "bold", size: 16pt)[#it.body]
    ]
  )
  v(0.5cm)
}

#let chapter(title) = [= #title]
#let lesson(title) = [== #title]

// Section styling (Level 3 heading)
#show heading.where(level: 3): it => {
  v(15pt)
  box(
    fill: c-orange,
    radius: (top-right: 10pt, bottom-left: 10pt),
    inset: (x: 12pt, y: 6pt)
  )[
    #text(fill: white, weight: "bold", size: 12pt)[#it.body]
  ]
  v(5pt)
}

// 5. COMPACT EDUCATIONAL BOXES (From Template 1)
#let ped-box(title: "", type: "def", body) = {
  let (c-line, c-bg, icon) = if type == "def" {
    (c-def-line, c-def-bg, fa-book())
  } else if type == "theo" {
    (c-theo-line, c-theo-bg, fa-gavel())
  } else if type == "prop" {
    (c-prop-line, c-prop-bg, fa-bolt())
  } else {
    (c-teal, c-teal.lighten(80%), fa-info-circle())
  }

  v(10pt)
  box(
    width: 100%,
    fill: c-bg,
    stroke: (left: 3pt + c-line),
    inset: 12pt,
    radius: (right: 4pt)
  )[
    #place(
      top + right,
      dx: 5pt,
      dy: -20pt,
      box(fill: c-line, inset: (x: 10pt, y: 4pt), radius: 4pt)[
        #text(fill: white, weight: "bold", size: 10pt)[#icon #h(4pt) #title]
      ]
    )
    #body
  ]
  v(10pt)
}

// =====================================================================
// DOCUMENT CONTENT
// =====================================================================

// TABLE OF CONTENTS
#align(center)[
  #text(fill: c-teal, weight: "bold", size: 28pt)[MỤC LỤC]
]
#v(1cm)
#outline(title: none, indent: auto)
#pagebreak()

// CHAPTER 1
#chapter[ỨNG DỤNG HÀM SINH (GENERATING FUNCTIONS)]

#lesson[LÝ THUYẾT CƠ BẢN VỀ HÀM SINH]



#ped-box(title: "Định nghĩa", type: "def")[
  Cho dãy số $(a_n) = a_0, a_1, a_2, ...$. Hàm sinh thường (Ordinary Generating Function - OGF) của dãy $(a_n)$ là một chuỗi lũy thừa hình thức:
  $ G(x) = sum_{n=0}^infinity a_n x^n = a_0 + a_1 x + a_2 x^2 + ... $
]

#ped-box(title: "Định lí", type: "thm")[
  Giả sử $A(x)$ và $B(x)$ lần lượt là hàm sinh của hai dãy $(a_n)$ và $(b_n)$. Khi đó, hàm sinh của dãy tổng $c_n = a_n + b_n$ chính là $A(x) + B(x)$. 
]

#ped-box(title: "Lưu ý", type: "note")[
  Sử dụng hàm sinh giúp chuyển bài toán đếm rời rạc thành bài toán tính toán đại số liên tục, cực kì mạnh mẽ trong giải tích tổ hợp. Hàm sinh ở đây được xét dưới góc độ chuỗi hình thức, do đó ta không cần bận tâm quá nhiều đến bán kính hội tụ của chuỗi.
]

#v(1.5cm)
#align(center)[
  #text(weight: "bold", size: 14pt)[CONICTYPST PUBLISHING - NÂNG TẦM TRÍ TUỆ]
]
