#let render-bia(khoi_label) = {
  set page(paper: "a4", margin: 2cm, header: none, footer: none)
  set text(font: "Times New Roman", lang: "vi")

  // Khung viền đôi sang trọng (cách mép giấy 1cm)
  place(top + left, dx: -1cm, dy: -1cm)[
    #rect(
      width: 100% + 2cm,
      height: 100% + 2cm,
      stroke: 3pt + rgb("003366"),
      inset: 3pt
    )[
      #rect(width: 100%, height: 100%, stroke: 1pt + rgb("003366"))
    ]
  ]

  // Nội dung chính
  block(height: 100%, width: 100%)[
    #align(center)[
      #v(0.5cm)
      #text(size: 13pt, tracking: 1pt)[SỞ GIÁO DỤC VÀ ĐÀO TẠO TP. HỒ CHÍ MINH]
      #linebreak()
      #v(3mm)
      #text(size: 15pt, weight: "bold", fill: rgb("003366"))[TRƯỜNG THPT NGUYỄN HỮU CẢNH]
      #v(4mm)
      #line(length: 40%, stroke: 0.5pt + rgb("888888"))
      
      #v(1fr)
      #text(size: 14pt, fill: rgb("555555"), tracking: 4pt)[TỔ TOÁN]
      
      #v(1cm)
      #text(size: 60pt, weight: "bold", fill: rgb("003366"), tracking: 5pt)[GIÁO ÁN]
      
      #v(2mm)
      #text(size: 28pt, weight: "bold", fill: rgb("B58500"))[MÔN TOÁN]
      
      #v(1fr)
      // Box for Grade
      #rect(
        inset: (x: 2.5cm, y: 1cm),
        stroke: 1.5pt + rgb("B58500"),
        radius: 5pt,
        fill: rgb("FDFBF7")
      )[
        #text(size: 18pt, fill: rgb("003366"), weight: "bold")[
          #khoi_label  •  Năm học 2026 – 2027
        ]
      ]

      #v(1.5fr)

      // Thông tin giáo viên
      #align(left)[
        #pad(left: 3cm)[
          #set text(size: 16pt, fill: rgb("000000"))
          #grid(
            columns: (4.5cm, auto),
            row-gutter: 18pt,
            [#text(style: "italic")[Giáo viên:]],
            [#text(weight: "bold")[Nguyễn Văn Sang]],

            [#text(style: "italic")[Tổ bộ môn:]],
            [Toán],

            [#text(style: "italic")[Trường:]],
            [THPT Nguyễn Hữu Cảnh],
          )
        ]
      ]

      #v(1fr)

      // Footer
      #line(length: 60%, stroke: 0.5pt + rgb("888888"))
      #v(4mm)
      #text(size: 12pt, fill: rgb("555555"), tracking: 2pt)[TP. HỒ CHÍ MINH, NĂM 2026]
      #v(0.5cm)
    ]
  ]
  pagebreak()
}
