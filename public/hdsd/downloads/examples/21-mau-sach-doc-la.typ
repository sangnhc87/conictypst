// 1. COLOR PALETTE
#let c-teal = rgb("#10868f")
#let c-darkblue = rgb("#0a063b")
#let c-orange = rgb("#f26422")
#let c-green = rgb("#4caf50")

#let c-def-line = rgb("#f44336")
#let c-def-bg = rgb("#fae6e5")
#let c-thm-line = rgb("#1976d2")
#let c-thm-bg = rgb("#e3f2fd")
#let c-prop-line = rgb("#388e3c")
#let c-prop-bg = rgb("#e8f5e9")
#let c-sch-line = rgb("#00838f")
#let c-sch-bg = rgb("#e0f7fa")

// 2. PAGE SETUP (Header & Footer)
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 1.5cm, right: 1.5cm),
  header-ascent: 30%,
  footer-descent: 30%,
  header: context {
    let w = 100% + 3cm
    place(top + left, dx: -1.5cm, dy: 0pt, box(width: w, height: 1.2cm)[
      #grid(
        columns: (1fr, 1fr),
        box(width: 100%, height: 100%)[
          #place(polygon(
            fill: c-teal.lighten(50%).transparentize(20%),
            (0%, 0%), (100%, 0%), (100% - 40pt, 100%), (0%, 100%)
          ))
          #place(polygon(
            fill: gradient.linear(dir: rtl, c-teal.darken(20%), c-teal.lighten(10%)),
            (0%, 0%), (100%, 0%), (100% - 20pt, 100%), (0%, 100%)
          ))
          #align(horizon)[
            #pad(left: 2cm, right: 30pt, top: 0pt)[
              #text(fill: white, weight: "bold", size: 10pt)[
                #grid(columns: (auto, auto), gutter: 6pt, align: horizon)[
                  #box(stroke: 1pt + white, radius: 2pt, inset: 3pt, baseline: 15%)[P]
                ][
                  LỚP TOÁN \ THẦY SANG
                ]
              ]
            ]
          ]
        ],
        box(width: 100%, height: 100%)[
          #place(polygon(
            fill: c-orange.lighten(50%).transparentize(20%),
            (20pt, 0%), (100%, 0%), (100%, 100%), (0%, 100%)
          ))
          #place(polygon(
            fill: gradient.linear(dir: ltr, c-orange, c-orange.lighten(30%)),
            (40pt, 0%), (100%, 0%), (100%, 100%), (20pt, 100%)
          ))
          #align(horizon + right)[
            #pad(right: 2cm)[
              #text(fill: white, size: 11pt, weight: "bold")[fb.com/loptoanthaysang — ĐT: 09.1234.5678]
            ]
          ]
        ]
      )
    ])
  },
  footer: context {
    let w = 100% + 3cm
    place(bottom + left, dx: -1.5cm, dy: 0pt, box(width: w, height: 1.2cm)[
      #grid(
        columns: (1fr, auto, 1fr),
        box(width: 100%, height: 100%)[
          #place(polygon(
            fill: c-orange.lighten(50%).transparentize(20%),
            (0%, 100%), (0%, 0%), (100% - 20pt, 0%), (100%, 100%)
          ))
          #place(polygon(
            fill: gradient.linear(dir: ltr, c-orange.lighten(10%), c-orange),
            (0%, 100%), (0%, 0%), (100% - 40pt, 0%), (100% - 20pt, 100%)
          ))
          #align(horizon + left)[
            #pad(left: 2cm)[
              #text(fill: white, weight: "bold", size: 10pt)[SANG MATH] \
              #text(fill: white, size: 9pt)[Tài liệu lưu hành nội bộ]
            ]
          ]
        ],
        box(width: 40pt, height: 100%, fill: c-orange)[
          #place(center + horizon)[
            #box(fill: white, radius: 50%, width: 28pt, height: 28pt)[
              #align(center + horizon)[#text(fill: c-orange, weight: "bold", size: 11pt)[#counter(page).display("1")]]
            ]
          ]
        ],
        box(width: 100%, height: 100%)[
          #place(polygon(
            fill: c-green.lighten(50%).transparentize(20%),
            (0%, 100%), (20pt, 0%), (100%, 0%), (100%, 100%)
          ))
          #place(polygon(
            fill: gradient.linear(dir: ltr, c-green, c-green.lighten(20%)),
            (20pt, 100%), (40pt, 0%), (100%, 0%), (100%, 100%)
          ))
          #align(horizon + right)[
            #pad(right: 2cm)[
              #text(fill: white, weight: "bold", size: 10pt)[CHUYÊN ĐỀ HÀM SỐ] \
              #text(fill: white, size: 9pt)[Biên soạn: Thầy Sang]
            ]
          ]
        ]
      )
    ])
  }
)

#set text(font: "New Computer Modern", size: 12pt)
#set heading(numbering: "1.1")

// 3. TABLE OF CONTENTS STYLING
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

// 4. COMPONENTS

// Bảng thông tin (Info box)
#let info-box(chuyen-de: "", ma-de: "", ky-thi: "", nam-hoc: "", khoi-mon: "") = {
  align(center)[
    #box(
      width: 90%, 
      stroke: 1.5pt + c-teal, 
      radius: 12pt, 
      inset: 15pt,
      fill: white
    )[
      #grid(
        columns: (1fr, auto, 1.5fr),
        align(center + horizon)[
          #text(fill: c-teal, weight: "bold", size: 14pt)[CHUYÊN ĐỀ #chuyen-de]
          #v(0.8em)
          #box(fill: c-teal, radius: 4pt, inset: (x: 10pt, y: 5pt))[
            #text(fill: white, weight: "bold", size: 11pt)[ĐỀ SỐ #ma-de]
          ]
        ],
        line(start: (0pt, 0pt), end: (0pt, 50pt), stroke: (paint: c-teal, thickness: 1pt, dash: "dashed")),
        align(center + horizon)[
          #set text(fill: c-teal, weight: "bold", size: 12pt)
          #ky-thi \
          #v(0.3em)
          #text(size: 11pt)[NĂM HỌC #nam-hoc] \
          #v(0.3em)
          #text(size: 11pt)[Khối #khoi-mon]
        ]
      )
    ]
  ]
}

// Đề bài header
#let title-text(title) = {
  v(1em)
  align(center)[
    #text(fill: c-teal, weight: "bold", size: 16pt)[#title]
  ]
  v(1em)
}

// Tiêu đề chương
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  box(width: 100%, fill: c-teal, radius: 12pt, inset: 12pt)[
    #grid(
      columns: (auto, 1fr),
      gutter: 15pt,
      align(horizon)[
        #box(stroke: 1.5pt + white, radius: 50%, width: 35pt, height: 35pt)[
          #align(center + horizon)[#text(fill: white, weight: "bold", size: 16pt)[#num]]
        ]
      ],
      align(horizon)[
        #text(fill: white, weight: "bold", size: 11pt)[CHƯƠNG #num] \
        #text(fill: white, weight: "bold", size: 18pt)[#it.body]
      ]
    )
  ]
  v(0.5em)
}

// Tiêu đề bài
#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  box(width: 100%, fill: c-darkblue, radius: 4pt, inset: (x: 12pt, y: 8pt))[
    #grid(
      columns: (auto, 1fr),
      align(left)[#text(fill: white, weight: "bold", size: 12pt)[BÀI #num]],
      align(center)[#text(fill: white, weight: "bold", size: 14pt)[#it.body]]
    )
  ]
  v(0.5em)
}

// Tiêu đề mục
#show heading.where(level: 3): it => {
  box(width: 100%, fill: c-teal.lighten(10%), radius: 2pt, inset: (x: 12pt, y: 6pt))[
    #text(fill: white, weight: "bold", size: 12pt)[#it.body]
  ]
  v(0.5em)
}

#let chapter(title) = [= #title]
#let lesson(title) = [== #title]
#let section(title) = [=== #title]

// Mục lục dạng số tròn
#let num-heading(num, title) = {
  grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    align(horizon)[
      #box(fill: c-teal, radius: 50%, width: 22pt, height: 22pt)[
        #align(center + horizon)[#text(fill: white, weight: "bold", size: 11pt)[#num]]
      ]
    ],
    align(horizon)[
      #text(fill: c-teal, weight: "bold", size: 14pt)[#title]
    ]
  )
  v(0.5em)
}

// Hộp sư phạm đa năng
#let sp-box(title, bg, line-color, icon, body) = {
  v(1.5em)
  box(width: 100%)[
    // Thân hộp
    #box(
      width: 100%, 
      fill: bg, 
      stroke: (left: 4pt + line-color),
      radius: (right: 4pt),
      inset: (top: 15pt, bottom: 10pt, left: 15pt, right: 10pt)
    )[
      #body
    ]
    // Nhãn đính trên viền
    #place(top + left, dx: 15pt, dy: -12pt)[
      #box(fill: line-color, radius: (top-left: 6pt, bottom-right: 6pt, top-right: 2pt, bottom-left: 2pt), inset: (x: 10pt, y: 4pt))[
        #text(fill: white, weight: "bold", size: 10pt)[#icon #title]
      ]
    ]
  ]
  v(0.5em)
}

#let dn(title: "Định nghĩa 1", body) = sp-box(title, c-def-bg, c-def-line, "⚡", body)
#let dl(title: "Định lí 1", body) = sp-box(title, c-thm-bg, c-thm-line, "⚡", body)
#let tc(title: "Tính chất 1", body) = sp-box(title, c-prop-bg, c-prop-line, "⚡", body)
#let hq(title: "Hệ quả 1", body) = sp-box(title, c-prop-bg, c-prop-line, "⚡", body)
#let nx(title: "Nhận xét 1", body) = sp-box(title, c-prop-bg, c-prop-line, "⚡", body)
#let sodo(title: "Sơ đồ khảo sát hàm số", body) = sp-box(title, c-sch-bg, c-sch-line, "📊", body)

// Các dòng lưu ý nhỏ
#let note-line(icon, label, color, body) = {
  grid(
    columns: (auto, 1fr),
    gutter: 6pt,
    text(fill: color, size: 12pt)[#icon],
    [#text(fill: color, weight: "bold")[#label:] #emph[#body]]
  )
  v(2pt)
}

#let luuy(body) = note-line("⚠️", "Lưu ý", rgb("#ff9800"), body)
#let ghichu(body) = note-line("📝", "Ghi chú", rgb("#9c27b0"), body)
#let binhluan(body) = note-line("💬", "Bình luận", rgb("#e91e63"), body)


// 5. MAIN CONTENT DEMO
#info-box(
  chuyen-de: "HÀM SỐ",
  ma-de: "0103",
  ky-thi: "KÌ THI TỐT NGHIỆP THPT",
  nam-hoc: "2025 – 2026",
  khoi-mon: "12 — Môn: TOÁN"
)

#title-text[ĐỀ BÀI]

// TABLE OF CONTENTS
#align(center)[
  #text(fill: c-teal, weight: "bold", size: 28pt)[MỤC LỤC]
]
#v(1cm)
#outline(title: none, indent: auto)
#pagebreak()

#chapter[ỨNG DỤNG HÀM SINH (GENERATING FUNCTIONS)]

#lesson[LÝ THUYẾT CƠ BẢN VỀ HÀM SINH]



#dn()[
  Cho dãy số $(a_n) = a_0, a_1, a_2, ...$. Hàm sinh thường (Ordinary Generating Function - OGF) của dãy $(a_n)$ là một chuỗi lũy thừa hình thức:
  $ G(x) = sum_{n=0}^infinity a_n x^n = a_0 + a_1 x + a_2 x^2 + ... $
]

#dl()[
  Giả sử $A(x)$ và $B(x)$ lần lượt là hàm sinh của hai dãy $(a_n)$ và $(b_n)$. Khi đó, hàm sinh của dãy tổng $c_n = a_n + b_n$ chính là $A(x) + B(x)$. 
]

#luuy[
  Sử dụng hàm sinh giúp chuyển bài toán đếm rời rạc thành bài toán tính toán đại số liên tục, cực kì mạnh mẽ trong giải tích tổ hợp. Hàm sinh ở đây được xét dưới góc độ chuỗi hình thức, do đó ta không cần bận tâm quá nhiều đến bán kính hội tụ của chuỗi.
]

#v(1.5cm)
#align(center)[
  #text(weight: "bold", size: 14pt)[CONICTYPST PUBLISHING - NÂNG TẦM TRÍ TUỆ]
]
