// MẪU 4: SANG MATH COMPACT PREMIUM (SIÊU TIẾT KIỆM GIẤY)

// 1. COLOR PALETTE (Royal & Compact)
#let c-main = rgb("#4A235A") // Deep Purple
#let c-accent = rgb("#F39C12") // Royal Gold
#let c-dark = rgb("#2C3E50") // Dark Slate

#set page(
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
  header-ascent: 20%,
  footer-descent: 20%,
  header: context move(dx: -1.5cm, dy: -0.5cm)[
    #box(width: 21cm, height: 1.0cm, fill: c-main, clip: true)[
      // Mảnh cắt màu Vàng Kim ở góc phải
      #place(top + left, polygon(
        fill: c-accent,
        (21cm, 0cm), (21cm, 1cm), (16cm, 1cm), (15.5cm, 0cm)
      ))
      #align(horizon)[
        #pad(x: 1.5cm)[
          #grid(
            columns: (1fr, auto),
            align(left)[#text(fill: white, weight: "bold", size: 10pt)[SANG MATH - CHUYÊN ĐỀ HÀM SỐ]],
            align(right)[#text(fill: c-main, weight: "bold", size: 10pt)[09.1234.5678]]
          )
        ]
      ]
    ]
  ],
  footer: context move(dx: -1.5cm, dy: 0.5cm)[
    #box(width: 21cm, height: 1.0cm, fill: c-main, clip: true)[
      // Mảnh cắt màu Vàng Kim ở góc trái
      #place(top + left, polygon(
        fill: c-accent,
        (0cm, 0cm), (5.5cm, 0cm), (6cm, 1cm), (0cm, 1cm)
      ))
      #align(horizon)[
        #pad(x: 1.5cm)[
          #grid(
            columns: (auto, 1fr, auto),
            align(left)[#text(fill: c-main, weight: "bold", size: 10pt)[TRANG #counter(page).display("1")]],
            align(center)[],
            align(right)[#text(fill: white, weight: "bold", size: 10pt)[Luyện thi THPT Quốc Gia]]
          )
        ]
      ]
    ]
  ]
)

#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.55em)
#set heading(numbering: "1.1")

// 3. TABLE OF CONTENTS
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  box(
    width: 100%,
    fill: c-main.lighten(90%),
    inset: (x: 8pt, y: 8pt),
    radius: 2pt,
    stroke: (left: 3pt + c-main),
    text(fill: c-main, weight: "bold", size: 12pt, it)
  )
}
#show outline.entry.where(level: 2): it => {
  v(6pt, weak: true)
  pad(left: 10pt)[
    #text(fill: c-dark, weight: "bold", size: 11pt, it)
  ]
}
#show outline.entry.where(level: 3): it => {
  v(4pt, weak: true)
  pad(left: 20pt)[
    #text(fill: black, size: 11pt, it)
  ]
}

// 4. CHAPTER & LESSON STYLES (Inline Compact)
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(1em)
  box(width: 100%, fill: c-main.lighten(95%), stroke: (left: 4pt + c-main), radius: 2pt, inset: 10pt)[
    #text(fill: c-main, weight: "bold", size: 14pt)[CHƯƠNG #num.] #h(4pt)
    #text(fill: c-dark, weight: "bold", size: 14pt)[#it.body]
  ]
  v(0.8em)
}

#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  v(0.8em)
  box(width: 100%, fill: c-accent.lighten(90%), stroke: (left: 4pt + c-accent), radius: 2pt, inset: 8pt)[
    #text(fill: c-main, weight: "bold", size: 12pt)[BÀI #num.] #h(4pt)
    #text(fill: c-dark, weight: "bold", size: 12pt)[#it.body]
  ]
  v(0.5em)
}

#show heading.where(level: 3): it => {
  v(0.8em)
  text(fill: c-main, weight: "bold", size: 11pt)[#it.body]
  v(0.4em)
}

#let chapter(title) = [= #title]
#let lesson(title) = [== #title]
#let section(title) = [=== #title]

// 5. COMPACT INLINE BOXES
#let compact-box(title, color, body) = {
  v(0.5em)
  box(width: 100%, stroke: (left: 3pt + color), fill: color.lighten(90%), inset: 8pt, radius: 2pt)[
    #box(fill: color, radius: 2pt, inset: (x: 6pt, y: 3pt), baseline: 20%)[
      #text(fill: white, weight: "bold", size: 9pt)[#title]
    ]
    #h(6pt)
    #text(size: 11pt)[#body]
  ]
  v(0.5em)
}

#let dn(title: "Định nghĩa", body) = compact-box(title, rgb("#E74C3C"), body)
#let dl(title: "Định lí", body) = compact-box(title, rgb("#2980B9"), body)
#let tc(title: "Tính chất", body) = compact-box(title, rgb("#27AE60"), body)
#let hq(title: "Hệ quả", body) = compact-box(title, rgb("#8E44AD"), body)
#let nx(title: "Nhận xét", body) = compact-box(title, rgb("#F39C12"), body)
#let luuy(body) = compact-box("Lưu ý", rgb("#D35400"), body)


// 6. MAIN CONTENT DEMO
#align(center)[
  #text(fill: c-main, weight: "bold", size: 24pt)[MỤC LỤC]
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
