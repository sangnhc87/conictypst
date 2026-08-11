// MẪU 5: SANG MATH CREATIVE SHAPES & ICONS (VẺ ĐẸP HÌNH KHỐI)

// 1. COLOR PALETTE
#let c-blue = rgb("#0D47A1") // Deep Blue
#let c-red = rgb("#E53935") // Bright Red
#let c-green = rgb("#00897B") // Teal/Mint
#let c-orange = rgb("#F39C12") // Orange
#let c-purple = rgb("#8E44AD") // Purple

#set page(
  paper: "a4",
  margin: (top: 2.0cm, bottom: 2.0cm, left: 2cm, right: 2cm),
  header-ascent: 55%,
  footer-descent: 55%,
  background: {
    // 1. Header wave (Top of page - Siêu mỏng tiết kiệm giấy)
    place(top + left, block(width: 21cm, height: 1.5cm, clip: true)[
      #place(top + left, path(fill: c-red, closed: true,
        (0cm, 0cm), (21cm, 0cm), 
        ( (21cm, 1.3cm), (0cm, 0cm), (-8cm, 0cm) ), 
        ( (0cm, 1.4cm), (8cm, 0cm), (0cm, 0cm) )
      ))
      #place(top + left, path(fill: c-blue, closed: true,
        (0cm, 0cm), (21cm, 0cm), 
        ( (21cm, 1.1cm), (0cm, 0cm), (-8cm, 0cm) ), 
        ( (0cm, 1.2cm), (8cm, 0cm), (0cm, 0cm) )
      ))
    ])
    
    // 2. Footer wave (Bottom of page - Siêu mỏng)
    place(bottom + left, block(width: 21cm, height: 1.5cm, clip: true)[
      #place(bottom + left, path(fill: c-red, closed: true,
        (0cm, 1.5cm), (21cm, 1.5cm), 
        ( (21cm, 0.2cm), (0cm, 0cm), (-8cm, 0cm) ), 
        ( (0cm, 0.1cm), (8cm, 0cm), (0cm, 0cm) )
      ))
      #place(bottom + left, path(fill: c-blue, closed: true,
        (0cm, 1.5cm), (21cm, 1.5cm), 
        ( (21cm, 0.4cm), (0cm, 0cm), (-8cm, 0cm) ), 
        ( (0cm, 0.3cm), (8cm, 0cm), (0cm, 0cm) )
      ))
    ])
  },
  header: context {
    // Text ở header tự động căn chỉnh trong lề nhờ luồng flow chuẩn của Typst
    grid(
      columns: (1fr, auto),
      align(left)[#text(fill: white, weight: "bold", size: 9pt)[📚 SANG MATH - CHUYÊN ĐỀ HÀM SỐ]],
      align(right)[#text(fill: white, weight: "bold", size: 9pt)[📞 09.1234.5678]]
    )
  },
  footer: context {
    // Text ở footer tự động căn chỉnh đẹp mắt
    grid(
      columns: (auto, 1fr, auto),
      align(left)[#text(fill: white, weight: "bold", size: 9pt)[📄 TRANG #counter(page).display("1")]],
      align(center)[],
      align(right)[#text(fill: white, weight: "bold", size: 9pt)[Luyện thi THPT Quốc Gia 🎓]]
    )
  }
)

#set text(font: "New Computer Modern", size: 12pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

// 1.5. TABLE OF CONTENTS
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  box(
    width: 100%,
    fill: c-blue.lighten(90%),
    inset: (x: 8pt, y: 8pt),
    radius: 4pt,
    stroke: (left: 4pt + c-blue),
    text(fill: c-blue, weight: "bold", size: 12pt, it)
  )
}
#show outline.entry.where(level: 2): it => {
  v(6pt, weak: true)
  pad(left: 10pt)[
    #text(fill: c-red, weight: "bold", size: 11pt, it)
  ]
}

// 2. CHƯƠNG & BÀI (HÌNH KHỐI SÁNG TẠO)
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(1cm)
  align(center)[
    #box(
      fill: c-blue,
      radius: (top-left: 20pt, bottom-right: 20pt, top-right: 5pt, bottom-left: 5pt),
      inset: (x: 25pt, y: 15pt),
      stroke: 3pt + c-red
    )[
      #text(fill: white, weight: "bold", size: 18pt)[🚀 CHƯƠNG #num: #it.body]
    ]
  ]
  v(1cm)
}

#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  v(0.8cm)
  box(
    fill: c-red.lighten(90%),
    stroke: (left: 5pt + c-red, right: 5pt + c-blue),
    radius: 4pt,
    inset: (x: 12pt, y: 8pt)
  )[
    #text(fill: c-blue, weight: "bold", size: 14pt)[🎯 BÀI #num.] #h(5pt) #text(fill: c-red, weight: "bold", size: 14pt)[#it.body]
  ]
  v(0.5cm)
}

#show heading.where(level: 3): it => {
  v(0.5cm)
  text(fill: c-blue, weight: "bold", size: 12pt)[🔹 #it.body]
  v(0.3cm)
}

#let chapter(title) = [= #title]
#let lesson(title) = [== #title]
#let section(title) = [=== #title]

// 3. CÁC HỘP SƯ PHẠM (DIVERSE SHAPES)

// 3.1. Hộp Nổi Biển Hiệu (Cho Định Nghĩa)
#let dn(title: "Định nghĩa", body) = {
  v(1em)
  box(width: 100%)[
    // Thân hộp (Vẽ trước để nằm dưới)
    #box(
      width: 100%,
      fill: c-red.lighten(95%),
      stroke: 2pt + c-red,
      radius: 6pt,
      inset: (top: 15pt, bottom: 10pt, left: 15pt, right: 15pt)
    )[
      #text(size: 11pt)[#body]
    ]
    // Thẻ nổi lên trên (Vẽ sau để đè lên trên Thân hộp)
    #place(top + left, dy: -12pt, dx: 15pt)[
      #box(fill: c-red, radius: 4pt, inset: (x: 10pt, y: 5pt), stroke: 2pt + white)[
        #text(fill: white, weight: "bold", size: 11pt)[📖 #title]
      ]
    ]
  ]
  v(0.5em)
}

// 3.2. Hộp Hình Chiếc Lá (Cho Định Lí)
#let dl(title: "Định lí", body) = {
  v(0.5em)
  box(
    width: 100%,
    fill: c-blue.lighten(90%),
    stroke: 2pt + c-blue,
    radius: (top-left: 20pt, bottom-right: 20pt, top-right: 0pt, bottom-left: 0pt),
    inset: 15pt
  )[
    #text(fill: c-blue, weight: "bold", size: 12pt)[📌 #title:] #h(5pt) #text(size: 11pt)[#body]
  ]
  v(0.5em)
}

// 3.3. Hộp Nét Đứt Bồng Bềnh (Cho Nhận Xét)
#let nx(title: "Nhận xét", body) = {
  v(0.5em)
  box(
    width: 100%,
    fill: c-orange.lighten(90%),
    stroke: (paint: c-orange, thickness: 2pt, dash: "dashed"),
    radius: 10pt,
    inset: 15pt
  )[
    #align(center)[
      #text(fill: c-orange.darken(20%), weight: "bold", size: 12pt)[💡 #title]
    ]
    #v(0.2em)
    #text(size: 11pt)[#body]
  ]
  v(0.5em)
}

// 3.4. Hộp Viền Kép (Cho Tính Chất)
#let tc(title: "Tính chất", body) = {
  v(0.5em)
  box(
    width: 100%,
    fill: c-green.lighten(90%),
    stroke: (left: 4pt + c-green, right: 4pt + c-green),
    inset: 12pt
  )[
    #text(fill: c-green.darken(20%), weight: "bold", size: 12pt)[⚙️ #title:] #h(5pt) #text(size: 11pt)[#body]
  ]
  v(0.5em)
}

// 3.5. Hộp Cảnh Báo (Cho Lưu ý)
#let luuy(body) = {
  v(0.5em)
  box(
    width: 100%,
    fill: rgb("#FFF3E0"), // Soft orange background
    stroke: (left: 6pt + c-orange),
    inset: 12pt
  )[
    #text(fill: c-orange.darken(20%), weight: "bold", size: 12pt)[⚠️ Lưu ý:] #h(5pt) #text(size: 11pt)[#body]
  ]
  v(0.5em)
}


// 4. MAIN CONTENT DEMO
#align(center)[
  #text(fill: c-blue, weight: "bold", size: 24pt)[MỤC LỤC]
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
