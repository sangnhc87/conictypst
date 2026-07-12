// MẪU 27: THIẾT KẾ BẤT ĐỐI XỨNG PHỐI MÀU TEAL - DARKBLUE (SANG TRỌNG & NỔI BẬT)
// Thiết kế nâng cao: Kết hợp bố cục bất đối xứng hiện đại và hệ màu sắc đặc sắc của Mẫu 21.
// Tích hợp khung ghi chú (Side Notes) lơ lửng ở lề trái được sắp xếp hợp lý, tránh chồng chéo.

// 1. COLOR PALETTE (Hệ màu Mẫu 21 chuẩn xác)
#let c-teal = rgb("#10868f")      // Teal hiện đại
#let c-darkblue = rgb("#0a063b")  // Navy cực đậm
#let c-orange = rgb("#f26422")    // Cam hổ phách
#let c-green = rgb("#4caf50")     // Xanh lá cây
#let c-light-bg = rgb("#f8fafc")  // Xám Slate siêu nhẹ

// Màu các hộp sư phạm
#let c-def-line = rgb("#10868f")
#let c-def-bg = rgb("#e0f7fa")
#let c-thm-line = rgb("#0a063b")
#let c-thm-bg = rgb("#e8eaf6")
#let c-warn-line = rgb("#f44336")
#let c-warn-bg = rgb("#fae6e5")

// Thiết lập trang với lề lề trái rộng 3.8cm làm cột phụ
#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.0cm, left: 3.8cm, right: 1.8cm),
  header-ascent: 60%,
  footer-descent: 60%,
  
  // Đường gióng cột phụ lề trái xám mảnh nhẹ nhàng, tinh tế
  background: {
    place(
      top + left, 
      dx: 3.0cm, 
      dy: 0cm, 
      line(
        start: (0cm, 0cm), 
        end: (0cm, 29.7cm), 
        stroke: 0.5pt + rgb("#cbd5e1")
      )
    )
    
    // Dải màu Header ở đỉnh trang
    place(top + left, block(width: 21cm, height: 1.2cm)[
      #place(top + left, rect(fill: c-darkblue, width: 3.2cm, height: 1.2cm))
      #place(top + left, dx: 3.2cm, polygon(fill: c-darkblue, (0cm, 0cm), (0.4cm, 0cm), (0cm, 1.2cm)))
      #place(top + left, dx: 3.2cm, rect(fill: c-teal, width: 17.8cm, height: 1.2cm))
      #place(top + left, dx: 3.2cm, polygon(fill: c-teal, (0cm, 1.2cm), (0.4cm, 0cm), (0cm, 0cm)))
    ])
    
    // Dải màu Footer ở đáy trang
    place(bottom + left, block(width: 21cm, height: 1.0cm)[
      #place(bottom + left, rect(fill: c-orange, width: 3.2cm, height: 1.0cm))
      #place(bottom + left, dx: 3.2cm, polygon(fill: c-orange, (0cm, 0cm), (0.3cm, 1.0cm), (0cm, 1.0cm)))
      #place(bottom + left, dx: 3.2cm, rect(fill: c-darkblue, width: 17.8cm, height: 1.0cm))
      #place(bottom + left, dx: 3.2cm, polygon(fill: c-darkblue, (0cm, 0cm), (0.3cm, 1.0cm), (0cm, 1.0cm)))
    ])
  },
  
  // Header chữ trắng nổi bật
  header: context {
    grid(
      columns: (1fr, auto),
      align(left)[#text(fill: white, weight: "bold", size: 8.5pt)[📚 SANG MATH EDITORIAL LAYOUT]],
      align(right)[#text(fill: white, weight: "bold", size: 8.5pt)[MẪU THIẾT KẾ SỐ 27]]
    )
  },
  
  // Footer chữ trắng sang trọng
  footer: context {
    grid(
      columns: (auto, 1fr, auto),
      align(left)[#text(fill: white, weight: "bold", size: 9pt)[📄 TRANG #counter(page).display("1")]],
      align(center)[],
      align(right)[#text(fill: white, weight: "bold", size: 8.5pt)[thptquocgia.math.vn - Luyện thi chất lượng cao 🎓]]
    )
  }
)

#set text(font: "New Computer Modern", size: 10.5pt, fill: c-darkblue)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

// Hàm đẩy nội dung ra cột lề trái
#let side-note(content) = {
  place(left, dx: -2.8cm, dy: 0cm, block(width: 2.1cm)[
    #align(right)[#content]
  ])
}

// Khung ghi chú lơ lửng ngoài lề trái (Side Note) rộng hơn để không bị xuống dòng
#let ghichu(body) = {
  place(left, dx: -3.3cm, dy: 0cm, block(width: 2.3cm)[
    #box(
      width: 100%,
      fill: c-orange.lighten(92%),
      stroke: (right: 3pt + c-orange),
      inset: (x: 5pt, y: 6pt),
      radius: (left: 3pt),
      [
        #align(left)[
          #text(fill: c-orange.darken(20%), weight: "bold", size: 8pt)[💡 GHI CHÚ] \
          #v(2pt)
          #text(size: 7.5pt, style: "italic", fill: c-darkblue.lighten(20%))[#body]
        ]
      ]
    )
  ])
}

// Tiêu đề chương (Heading 1)
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(1cm)
  place(left, dx: -2.8cm)[
    #box(
      width: 100% + 2.8cm,
      fill: gradient.linear(c-darkblue, c-teal),
      inset: (x: 15pt, y: 12pt),
      radius: 4pt,
      stroke: (left: 5pt + c-orange)
    )[
      #grid(
        columns: (auto, 1fr),
        gutter: 15pt,
        align(center + horizon)[
          #text(fill: c-orange, weight: "black", size: 22pt)[#num]
        ],
        align(left + horizon)[
          #text(fill: white, weight: "bold", size: 13pt)[#upper(it.body)]
        ]
      )
    ]
  ]
  v(2.0cm)
}

// Tiêu đề bài (Heading 2) với tag tròn lề trái
#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  v(0.8cm)
  side-note(
    box(
      fill: c-teal,
      radius: 3pt,
      inset: (x: 6pt, y: 4pt),
      text(fill: white, weight: "bold", size: 9pt)[BÀI #num]
    )
  )
  text(fill: c-darkblue, weight: "bold", size: 12pt)[#it.body]
  v(0.4cm)
}

// Tiêu đề phần (Heading 3)
#show heading.where(level: 3): it => {
  v(0.5cm)
  text(fill: c-teal, weight: "bold", size: 11pt)[🌟 #it.body]
  v(0.3cm)
}

// Hộp Định nghĩa (Màu Đỏ/Hồng Mẫu 21)
#let dn(title: "Định nghĩa", body) = {
  v(0.6em)
  box(
    width: 100%,
    fill: rgb("#fae6e5"),
    stroke: (left: 4.0pt + rgb("#f44336")),
    inset: 12pt,
    radius: (top-right: 4pt, bottom-right: 4pt)
  )[
    #text(fill: rgb("#f44336").darken(25%), weight: "bold", size: 10pt)[🧬 #upper(title)] \
    #v(6pt)
    #text(size: 10pt)[#body]
  ]
  v(0.6em)
}

// Hộp Định lý (Màu Lam Nhẹ Mẫu 21)
#let dl(title: "Định lí", body) = {
  v(0.6em)
  box(
    width: 100%,
    fill: rgb("#e3f2fd"),
    stroke: (left: 4.0pt + rgb("#1976d2")),
    inset: 12pt,
    radius: (top-right: 4pt, bottom-right: 4pt)
  )[
    #text(fill: rgb("#1976d2").darken(25%), weight: "bold", size: 10pt)[🎯 #upper(title)] \
    #v(6pt)
    #text(size: 10pt)[#body]
  ]
  v(0.6em)
}

// Hộp Nhận xét (Trong dòng - dùng khi không muốn đẩy ra lề)
#let nx(title: "Nhận xét", body) = {
  v(0.6em)
  box(
    width: 100%,
    fill: rgb("#e0f7fa"),
    stroke: (left: 4.0pt + rgb("#00838f")),
    inset: 12pt,
    radius: (top-right: 4pt, bottom-right: 4pt)
  )[
    #text(fill: rgb("#00838f").darken(25%), weight: "bold", size: 10pt)[💡 #upper(title)] \
    #v(6pt)
    #text(size: 10pt, style: "italic")[#body]
  ]
  v(0.6em)
}

// Hộp Cảnh báo (Màu vàng cam)
#let luuy(body) = {
  v(0.6em)
  box(
    width: 100%,
    fill: rgb("#fff3e0"),
    stroke: (left: 4.0pt + rgb("#f26422")),
    inset: 12pt,
    radius: (top-right: 4pt, bottom-right: 4pt)
  )[
    #text(fill: rgb("#f26422").darken(20%), weight: "bold", size: 10pt)[⚠️ CẢNH BÁO SƯ PHẠM:] \
    #v(6pt)
    #text(size: 10pt)[#body]
  ]
  v(0.6em)
}

// 5. TRANG DEMO NỘI DUNG SỰ PHẠM
#align(center)[
  #v(2cm)
  #text(fill: c-darkblue, weight: "bold", size: 22pt)[MỤC LỤC CHI TIẾT]
  #v(0.5cm)
  #text(fill: c-teal, style: "italic", size: 11pt)[Ấn bản toán học đặc sắc dành cho học sinh THPT]
]
#v(1cm)
#outline(title: none, indent: auto)
#pagebreak()

#heading(level: 1)[ỨNG DỤNG HÀM SINH (GENERATING FUNCTIONS)]

#heading(level: 2)[LÝ THUYẾT CƠ BẢN VỀ HÀM SINH]

#heading(level: 3)[A. KHÁI NIỆM VÀ ĐỊNH LÍ]

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
