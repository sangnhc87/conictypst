// 1. COLOR PALETTE (Indigo & Cyan Minimalist)
#let c-main = rgb("#1a2a6c") // Deep Indigo
#let c-accent = rgb("#b21f1f") // Deep Red
#let c-cyan = rgb("#2980b9") // Cyan
#let c-text = rgb("#333333")

// Box Colors
#let c-def = rgb("#e74c3c")
#let c-thm = rgb("#2980b9")
#let c-prop = rgb("#27ae60")
#let c-sch = rgb("#8e44ad")

// 2. PAGE SETUP (Floating Header & Minimal Footer)
#set page(
  paper: "a4",
  margin: (top: 3cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header-ascent: 40%,
  footer-descent: 40%,
  header: context {
    let w = 100% + 4cm
    place(top + left, dx: -2cm, dy: -3cm, box(width: w, height: 4.5cm, clip: true)[
      #place(top + left, dx: -20%, dy: -20%, ellipse(width: 80%, height: 4cm, fill: c-cyan.lighten(60%).transparentize(50%)))
      #place(top + right, dx: 10%, dy: -10%, ellipse(width: 70%, height: 4.5cm, fill: c-main.lighten(40%).transparentize(30%)))
      #place(top + center, dy: -50%, ellipse(width: 120%, height: 4cm, fill: gradient.linear(dir: ltr, c-main, c-cyan)))
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
      #place(bottom + left, dx: -10%, dy: 30%, ellipse(width: 70%, height: 4cm, fill: c-main.lighten(40%).transparentize(30%)))
      #place(bottom + right, dx: 20%, dy: 10%, ellipse(width: 80%, height: 4.5cm, fill: c-cyan.lighten(60%).transparentize(50%)))
      #place(bottom + center, dy: 60%, ellipse(width: 120%, height: 4cm, fill: gradient.linear(dir: ltr, c-main, c-cyan)))
      
      #align(top)[
        #pad(top: 25pt, left: 2.5cm, right: 2.5cm)[
          #grid(
            columns: (1fr, auto, 1fr),
            align: horizon,
            [
              #align(left)[
                #text(fill: c-main, weight: "bold", size: 9pt)[SANG MATH] \
                #text(fill: rgb("#888"), size: 8pt, style: "italic")[Tài liệu luyện thi THPT Quốc Gia]
              ]
            ],
            [
              #box(fill: white, stroke: 1.5pt + c-main, radius: 50%, width: 32pt, height: 32pt)[
                #align(center + horizon)[#text(fill: c-main, weight: "bold", size: 11pt)[#counter(page).display("1")]]
              ]
            ],
            [
              #align(right)[
                #text(fill: c-main, weight: "bold", size: 9pt)[CHUYÊN ĐỀ HÀM SỐ] \
                #text(fill: rgb("#888"), size: 8pt, style: "italic")[Biên soạn: Thầy Sang]
              ]
            ]
          )
        ]
      ]
    ])
  }
)

#set text(font: "New Computer Modern", size: 12pt, fill: c-text)
#set heading(numbering: "1.1")

// 3. TABLE OF CONTENTS STYLING
#show outline.entry.where(level: 1): it => {
  v(15pt, weak: true)
  box(
    width: 100%,
    fill: c-main.lighten(90%),
    inset: (x: 10pt, y: 10pt),
    radius: 4pt,
    stroke: (left: 4pt + c-main),
    text(fill: c-main, weight: "bold", size: 13pt, it)
  )
}
#show outline.entry.where(level: 2): it => {
  v(10pt, weak: true)
  pad(left: 15pt)[
    #text(fill: c-cyan, weight: "bold", size: 12pt, it)
  ]
}
#show outline.entry.where(level: 3): it => {
  v(6pt, weak: true)
  pad(left: 35pt)[
    #text(fill: c-text, size: 11pt, it)
  ]
}

// 4. COMPONENTS

// Bảng thông tin siêu thanh mảnh
#let info-box(chuyen-de: "", ma-de: "", ky-thi: "", nam-hoc: "", khoi-mon: "") = {
  align(center)[
    #box(
      width: 90%, 
      stroke: (top: 2pt + c-main, bottom: 2pt + c-main, left: 0.5pt + rgb("#eee"), right: 0.5pt + rgb("#eee")), 
      inset: (y: 15pt),
      fill: rgb("#fafafa")
    )[
      #grid(
        columns: (1fr, auto, 1fr),
        align(center + horizon)[
          #text(fill: c-main, weight: "bold", size: 13pt)[CHUYÊN ĐỀ #chuyen-de]
          #v(0.5em)
          #text(fill: c-accent, weight: "bold", size: 11pt)[(ĐỀ SỐ #ma-de)]
        ],
        line(start: (0pt, 0pt), end: (0pt, 40pt), stroke: (paint: rgb("#ccc"), thickness: 1pt)),
        align(center + horizon)[
          #set text(fill: c-main, weight: "bold", size: 11pt)
          #ky-thi \
          #v(0.3em)
          #text(size: 10pt, weight: "regular")[NĂM HỌC #nam-hoc] \
          #v(0.3em)
          #text(size: 10pt, weight: "regular")[Khối #khoi-mon]
        ]
      )
    ]
  ]
}

// Đề bài header
#let title-text(title) = {
  v(1.5em)
  align(center)[
    #text(fill: c-main, weight: "bold", size: 16pt, tracking: 2pt)[#title]
  ]
  v(1em)
}

// Tiêu đề chương
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(1em)
  box(width: 100%, fill: c-main.lighten(95%), stroke: (left: 6pt + gradient.linear(dir: ttb, c-main, c-cyan)), radius: 4pt, inset: 15pt)[
    #grid(
      columns: (auto, 1fr),
      gutter: 15pt,
      align(horizon)[
        #box(fill: gradient.linear(dir: ltr, c-main, c-cyan), radius: 20pt, inset: (x: 15pt, y: 8pt))[
          #text(fill: white, weight: "bold", size: 12pt, tracking: 2pt)[CHƯƠNG #num]
        ]
      ],
      align(horizon)[
        #text(fill: c-main, weight: "bold", size: 18pt)[#it.body]
      ]
    )
  ]
  v(1em)
}

// Tiêu đề bài (Ghost button style)
#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  box(width: 100%, stroke: 1pt + c-cyan, radius: 4pt, inset: (x: 12pt, y: 8pt), fill: c-cyan.lighten(90%))[
    #grid(
      columns: (auto, 1fr),
      align(left)[#text(fill: c-cyan, weight: "bold", size: 12pt)[BÀI #num]],
      align(center)[#text(fill: c-cyan, weight: "bold", size: 13pt)[#it.body]]
    )
  ]
  v(0.5em)
}

// Tiêu đề mục (Left-aligned minimalist)
#show heading.where(level: 3): it => {
  v(1em)
  text(fill: c-main, weight: "bold", size: 13pt)[#it.body]
  v(0.5em)
}

#let chapter(title) = [= #title]
#let lesson(title) = [== #title]
#let section(title) = [=== #title]

// Hộp sư phạm phong cách Neumorphism / Thanh mảnh
#let sp-box-v2(title, icon, color, body) = {
  v(1em)
  box(
    width: 100%,
    stroke: 0.5pt + color,
    fill: color.lighten(93%),
    radius: 6pt,
    inset: 12pt
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 12pt,
      align(top)[
        #box(fill: color.lighten(80%), stroke: 1pt + color.lighten(40%), radius: 50%, width: 28pt, height: 28pt)[
          #align(center + horizon)[#text(size: 11pt)[#icon]]
        ]
      ],
      [
        #text(fill: color, weight: "bold", size: 11pt)[#title]
        #v(6pt)
        #line(length: 100%, stroke: (paint: color.lighten(50%), thickness: 1pt, dash: "dotted"))
        #v(6pt)
        #set par(leading: 0.8em)
        #text(fill: c-text, size: 11.5pt)[#body]
      ]
    )
  ]
  v(0.5em)
}

#let dn(title: "Định nghĩa 1", body) = sp-box-v2(title, "⚡", c-def, body)
#let dl(title: "Định lí 1", body) = sp-box-v2(title, "💎", c-thm, body)
#let tc(title: "Tính chất 1", body) = sp-box-v2(title, "🌿", c-prop, body)
#let hq(title: "Hệ quả 1", body) = sp-box-v2(title, "📌", c-prop, body)
#let nx(title: "Nhận xét 1", body) = sp-box-v2(title, "🔍", c-prop, body)
#let sodo(title: "Sơ đồ khảo sát", body) = sp-box-v2(title, "📈", c-sch, body)

// Các dòng lưu ý (Floating icon style)
#let note-line(icon, label, color, body) = {
  v(0.5em)
  grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    align(top)[
      #text(fill: color, size: 12pt)[#icon]
    ],
    [#text(fill: color, weight: "bold")[#label.] #emph[#body]]
  )
  v(0.5em)
}

#let luuy(body) = note-line("⚠️", "Lưu ý", rgb("#d35400"), body)
#let ghichu(body) = note-line("📝", "Ghi chú", rgb("#8e44ad"), body)
#let binhluan(body) = note-line("💬", "Bình luận", rgb("#2980b9"), body)


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
  #text(fill: c-main, weight: "bold", size: 28pt)[MỤC LỤC]
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
