// MẪU 26: THIẾT KẾ BẤT ĐỐI XỨNG & TẠP CHÍ HIỆN ĐẠI (EDITORIAL MAGAZINE LAYOUT)
// Sử dụng cột lề trái rộng (Left Margin) để hiển thị các ghi chú, icon và số trang lơ lửng cực kỳ chuyên nghiệp.

// 1. COLOR SYSTEM (Bảng màu hiện đại phong cách Tạp chí)
#let c-primary = rgb("#1E3A8A")   // Deep Navy (Chính)
#let c-secondary = rgb("#0D9488") // Teal/Cyan (Phụ)
#let c-accent = rgb("#F59E0B")    // Amber/Gold (Điểm nhấn)
#let c-warning = rgb("#EF4444")   // Coral Red (Cảnh báo)
#let c-light = rgb("#F8FAFC")     // Slate Light (Nền nhẹ)
#let c-dark = rgb("#1E293B")      // Charcoal (Chữ chính)

// Thiết lập trang với lề trái rộng 4.2cm (để làm cột lề phụ) và lề phải 1.8cm
#set page(
  paper: "a4",
  margin: (top: 2.0cm, bottom: 2.0cm, left: 4.2cm, right: 1.8cm),
  header-ascent: 30%,
  footer-descent: 30%,
  
  // Vẽ vạch ngăn cách lề trái tinh tế ở phần background
  background: {
    // Đường gióng cột lề phụ mờ màu xám nhạt dọc suốt trang
    place(top + left, dx: 3.2cm, dy: 0cm, line(start: (0cm, 0cm), end: (0cm, 29.7cm), stroke: 0.5pt + rgb("#E2E8F0")))
  },
  
  // Thiết kế Header tối giản, hiện đại
  header: context {
    grid(
      columns: (1fr, auto),
      align(left)[#text(fill: c-primary.lighten(20%), weight: "medium", size: 8.5pt)[📖 SANG MATH EDITORIAL LAYOUT]],
      align(right)[#text(fill: c-secondary, weight: "bold", size: 8.5pt)[CHUYÊN ĐỀ HÀM SỐ]]
    )
    v(0.2cm)
    line(length: 100%, stroke: 0.8pt + c-primary.lighten(80%))
  },
  
  // Thiết kế Footer bất đối xứng độc đáo
  footer: context {
    line(length: 100%, stroke: 0.8pt + c-primary.lighten(80%))
    v(0.2cm)
    layout(size => {
      // Số trang nằm lơ lửng ở cột lề trái bên ngoài văn bản
      place(left, dx: -3.2cm, dy: 0cm)[
        #box(
          fill: c-primary,
          radius: 3pt,
          inset: (x: 8pt, y: 4pt),
          align(center + horizon)[
            #text(fill: white, weight: "bold", size: 9pt)[#counter(page).display("1")]
          ]
        )
      ]
      
      // Thông tin bản quyền ở khu vực lề phải chuẩn
      grid(
        columns: (1fr, auto),
        align(left)[#text(fill: rgb("#64748B"), size: 8.5pt)[🌐 thptquocgia.math.vn]],
        align(right)[#text(fill: c-secondary, weight: "bold", size: 8.5pt)[Luyện thi Toán chất lượng cao 🎓]]
      )
    })
  }
)

#set text(font: "New Computer Modern", size: 10.5pt, fill: c-dark)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

// 2. PHẦN TẠO BIỂU TƯỢNG VÀ GHI CHÚ CỘT LỀ TRÁI (LEFT SIDEBAR FLOATING)
// Hàm đẩy nội dung lơ lửng ra cột phụ lề trái
#let side-note(content) = {
  place(left, dx: -3.2cm, dy: 0cm, block(width: 2.6cm)[
    #align(right)[#content]
  ])
}

// 3. ĐỊNH DẠNG TIÊU ĐỀ BẤT ĐỐI XỨNG (ASYNCHRONOUS HEADINGS)
// Chương (Heading 1) tràn ngang, kéo dài từ cột phụ sang tận lề phải
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(1cm)
  place(left, dx: -3.2cm)[
    #box(
      width: 100% + 3.2cm,
      fill: c-primary,
      inset: (x: 15pt, y: 15pt),
      radius: 4pt,
      stroke: (left: 6pt + c-accent)
    )[
      #grid(
        columns: (auto, 1fr),
        gutter: 15pt,
        align(center + horizon)[
          #text(fill: c-accent, weight: "black", size: 24pt)[0#num]
        ],
        align(left + horizon)[
          #text(fill: white, weight: "bold", size: 15pt)[#upper(it.body)]
        ]
      )
    ]
  ]
  v(2.2cm) // Khoảng trống chừa ra cho khối place tràn lề bên trên
}

// Bài (Heading 2) với tag màu nổi bật bên lề trái
#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  v(0.8cm)
  side-note(
    box(
      fill: c-secondary,
      radius: 2pt,
      inset: (x: 6pt, y: 4pt),
      text(fill: white, weight: "bold", size: 10pt)[BÀI #num]
    )
  )
  text(fill: c-primary, weight: "bold", size: 13pt)[#it.body]
  v(0.4cm)
}

// Mục nhỏ (Heading 3) đi kèm Icon hiện đại
#show heading.where(level: 3): it => {
  v(0.5cm)
  text(fill: c-secondary, weight: "bold", size: 11pt)[⚡ #it.body]
  v(0.3cm)
}

// 4. CÁC HỘP SƯ PHẠM ĐỘC ĐÁO (MAGAZINE STYLE PEDAGOGICAL BOXES)

// Hộp Định nghĩa: Nền xám mượt, khung mỏng, tiêu đề đặt ngang lề
#let dn(title: "Định nghĩa", body) = {
  v(0.5em)
  box(
    width: 100%,
    fill: c-light,
    stroke: (left: 4pt + c-secondary),
    inset: 12pt,
    radius: (top-right: 4pt, bottom-right: 4pt)
  )[
    #text(fill: c-secondary, weight: "bold", size: 10.5pt)[🧬 #upper(title)]
    #v(4pt)
    #text(size: 10pt)[#body]
  ]
  v(0.5em)
}

// Hộp Định lí: Khung viền kép bo tròn mềm mại, điểm nhấn nút thắt màu vàng
#let dl(title: "Định lí", body) = {
  v(0.5em)
  box(
    width: 100%,
    stroke: 1pt + c-primary.lighten(50%),
    inset: 12pt,
    radius: 6pt,
    fill: white
  )[
    #place(top + left, dx: -2pt, dy: -20pt)[
      #box(fill: c-primary, inset: (x: 8pt, y: 4pt), radius: 3pt)[
        #text(fill: white, weight: "bold", size: 9pt)[🎯 #title]
      ]
    ]
    #v(4pt)
    #text(size: 10pt)[#body]
  ]
  v(0.5em)
}

// Hộp Cảnh báo: Thiết kế tối giản tinh tế, viền kép đỏ
#let luuy(body) = {
  v(0.5em)
  // Đặt Icon cảnh báo lơ lửng ngoài lề trái để tạo điểm nhấn thị giác cực mạnh
  side-note(
    box(
      fill: c-warning.lighten(90%),
      stroke: 1pt + c-warning,
      radius: 50%,
      width: 24pt,
      height: 24pt,
      align(center + horizon)[#text(fill: c-warning, weight: "bold", size: 10pt)[⚠️]]
    )
  )
  box(
    width: 100%,
    fill: c-warning.lighten(96%),
    stroke: (left: 4pt + c-warning),
    inset: 10pt,
    radius: (top-right: 4pt, bottom-right: 4pt)
  )[
    #text(fill: c-warning.darken(20%), weight: "bold", size: 10pt)[CẢNH BÁO SƯ PHẠM:]
    #h(4pt)
    #text(size: 10pt)[#body]
  ]
  v(0.5em)
}

// Hộp Nhận xét: Được chuyển thành dạng "Side-Note" nổi bật hoàn toàn ngoài cột lề phụ!
// Vừa tiết kiệm giấy vừa tạo nét thiết kế độc đáo chuẩn tạp chí Mỹ.
#let nx(body) = {
  side-note(
    box(
      width: 2.6cm,
      fill: c-accent.lighten(90%),
      stroke: (right: 3pt + c-accent),
      inset: 6pt,
      radius: (left: 3pt),
      [
        #align(left)[
          #text(fill: c-accent.darken(30%), weight: "bold", size: 8pt)[💡 GỢI Ý / LƯU Ý] \
          #v(2pt)
          #text(size: 8pt, style: "italic")[#body]
        ]
      ]
    )
  )
}

// 5. TRANG DEMO NỘI DUNG SỰ PHẠM
#align(center)[
  #v(2cm)
  #text(fill: c-primary, weight: "bold", size: 22pt)[MỤC LỤC CHI TIẾT]
  #v(0.5cm)
  #text(fill: c-secondary, style: "italic", size: 11pt)[Ấn bản toán học đặc sắc dành cho học sinh THPT]
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
