// MẪU 28: THIẾT KẾ LƯỚI LỤC GIÁC & CÔNG NGHỆ HIỆN ĐẠI (SPACE TECH LAYOUT)
// Thiết kế đẳng cấp hoàn toàn mới: Ứng dụng hình học Lục giác (Hexagon) và Ruy-băng động (Dynamic Ribbon)
// Phối màu sang trọng: Xanh phi hành trụ (Deep Slate) và Vàng Hổ Phách (Amber) kết hợp Teal thanh lịch.

// 1. COLOR PALETTE (Bảng màu không gian số hiện đại)
#let c-space = rgb("#0a063b")   // Navy/Darkblue từ Mẫu 21 (Chính - ấm áp và sang trọng hơn)
#let c-teal = rgb("#0D9488")    // Teal/Cyan (Phụ - tạo sự thanh thoát)
#let c-amber = rgb("#F59E0B")   // Vàng hổ phách (Điểm nhấn nổi bật)
#let c-coral = rgb("#EF4444")   // Đỏ Coral (Cảnh báo)
#let c-green = rgb("#10B981")   // Xanh lá (Tính chất)
#let c-purple = rgb("#8B5CF6")  // Tím (Hệ quả)
#let c-light-bg = rgb("#F8FAFC") // Nền hộp Slate nhẹ

// Vẽ huy hiệu lục giác hoàn hảo (Hexagon Badge)
#let hex-badge(fill-color, content) = {
  box(width: 24pt, height: 24pt)[
    #place(top + left, polygon(
      fill: fill-color,
      (12pt, 0pt), (24pt, 7pt), (24pt, 17pt), (12pt, 24pt), (0pt, 17pt), (0pt, 7pt)
    ))
    #place(center + horizon)[#content]
  ]
}

// Hàm vẽ ruy-băng tự động co giãn theo chiều dài chữ (Dynamic Ribbon)
#let ribbon(fill-color, content) = {
  grid(
    columns: (auto, auto),
    gutter: 0pt,
    rect(fill: fill-color, height: 18pt, radius: (left: 3pt), inset: (x: 8pt), align(center + horizon)[#content]),
    box(width: 8pt, height: 18pt)[
      #place(top + left, polygon(fill: fill-color, (0pt, 0pt), (8pt, 9pt), (0pt, 18pt)))
    ]
  )
}

// Thiết lập trang
#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 1.8cm, right: 1.8cm),
  header-ascent: 50%,
  footer-descent: 50%,
  
  // Header phong cách hiện đại với thanh ngang mảnh
  header: context {
    grid(
      columns: (1fr, auto),
      align(left + horizon)[#text(fill: c-space, weight: "bold", size: 9pt)[🚀 SANG MATH SPACE-TECH LAYOUT]],
      align(right + horizon)[#text(fill: c-teal, weight: "bold", size: 9pt)[CHUYÊN ĐỀ HÀM SỐ]]
    )
    v(0.15cm)
    line(length: 100%, stroke: 0.8pt + c-space)
  },
  
  // Footer công nghệ với Huy hiệu Lục giác chứa số trang ở chính giữa
  footer: context {
    place(top + left, dy: -6pt, line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1")))
    grid(
      columns: (1fr, auto, 1fr),
      align(left + horizon)[#text(fill: c-space.lighten(40%), size: 8.5pt)[🌐 thptquocgia.math.vn]],
      hex-badge(c-amber, text(fill: white, weight: "bold", size: 9pt)[#counter(page).display("1")]),
      align(right + horizon)[#text(fill: c-space.lighten(40%), size: 8.5pt)[Luyện thi Toán THPT Quốc Gia 🎓]]
    )
  }
)

#set text(font: "New Computer Modern", size: 10.5pt, fill: c-space)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

// 2. THIẾT KẾ MỤC LỤC ĐỘC ĐÁO CHUẨN TECH
#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  box(
    width: 100%,
    fill: c-space.lighten(94%),
    inset: (x: 12pt, y: 8pt),
    radius: 4pt,
    stroke: (left: 4pt + c-space),
    text(fill: c-space, weight: "bold", size: 11pt, it)
  )
}

#show outline.entry.where(level: 2): it => {
  v(8pt, weak: true)
  pad(left: 10pt)[
    #grid(
      columns: (auto, 1fr),
      gutter: 8pt,
      align(center + horizon)[
        #box(width: 6pt, height: 6pt)[
          #polygon(fill: c-amber, (3pt, 0pt), (6pt, 1.5pt), (6pt, 4.5pt), (3pt, 6pt), (0pt, 4.5pt), (0pt, 1.5pt))
        ]
      ],
      align(left + horizon)[#text(fill: c-teal, weight: "bold", size: 10pt, it)]
    )
  ]
}

// 3. TIÊU ĐỀ HÌNH KHỐI CÔNG NGHỆ

// Tiêu đề chương (Heading 1) cắt vát công nghệ
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(0.8cm)
  box(width: 100%, height: 42pt)[
    #place(top + left, rect(fill: c-space, width: 100% - 20pt, height: 42pt, radius: (left: 4pt)))
    #place(top + right, polygon(fill: c-space, (-20pt, 0pt), (0pt, 21pt), (-20pt, 42pt)))
    #place(top + left, dx: 15pt, dy: 9pt)[
      #grid(
        columns: (auto, 1fr),
        gutter: 15pt,
        hex-badge(c-amber, text(fill: white, weight: "bold", size: 12pt)[#num]),
        align(left + horizon)[#text(fill: white, weight: "bold", size: 13pt)[#upper(it.body)]]
      )
    ]
  ]
  v(0.8cm)
}

// Tiêu đề bài (Heading 2) ruy-băng dài màu Teal bắt mắt
#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  v(0.8cm)
  box(width: 100%, height: 28pt)[
    #place(top + left, rect(fill: c-teal, width: 100% - 14pt, height: 28pt, radius: (left: 4pt)))
    #place(top + right, polygon(fill: c-teal, (-14pt, 0pt), (0pt, 14pt), (-14pt, 28pt)))
    #place(top + left, dx: 15pt, dy: 7pt)[
      #text(fill: white, weight: "bold", size: 11pt)[BÀI #num. #upper(it.body)]
    ]
  ]
  v(0.5cm)
}

// Tiêu đề phần (Heading 3) đi kèm khối lục giác nhỏ
#show heading.where(level: 3): it => {
  v(0.5cm)
  grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    align(center + horizon)[
      #box(width: 8pt, height: 8pt)[
        #polygon(fill: c-amber, (4pt, 0pt), (8pt, 2pt), (8pt, 6pt), (4pt, 8pt), (0pt, 6pt), (0pt, 2pt))
      ]
    ],
    align(left + horizon)[#text(fill: c-teal, weight: "bold", size: 11pt)[#it.body]]
  )
  v(0.3cm)
}

// 4. ĐẦY ĐỦ CÁC HỘP SƯ PHẠM ĐẲNG CẤP (FULL BOX TEMPLATES)

// Hộp Định nghĩa (Ruy-băng Teal nổi)
#let dn(title: "Định nghĩa", body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: c-light-bg,
      stroke: 1pt + c-teal.lighten(60%),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #text(size: 10pt)[#body]
    ]
    #place(top + left, dx: 10pt, dy: -9pt)[
      #ribbon(c-teal, text(fill: white, weight: "bold", size: 8.5pt)[🧬 #upper(title)])
    ]
  ]
  v(0.6em)
}

// Hộp Định lý (Ruy-băng Space-Navy nổi)
#let dl(title: "Định lí", body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: c-light-bg,
      stroke: 1pt + c-space.lighten(60%),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #text(size: 10pt)[#body]
    ]
    #place(top + left, dx: 10pt, dy: -9pt)[
      #ribbon(c-space, text(fill: white, weight: "bold", size: 8.5pt)[🎯 #upper(title)])
    ]
  ]
  v(0.6em)
}

// Hộp Tính chất (Ruy-băng Lục bảo nổi - Emerald Green)
#let tc(title: "Tính chất", body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: c-light-bg,
      stroke: 1pt + c-green.lighten(60%),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #text(size: 10pt)[#body]
    ]
    #place(top + left, dx: 10pt, dy: -9pt)[
      #ribbon(c-green, text(fill: white, weight: "bold", size: 8.5pt)[⚙️ #upper(title)])
    ]
  ]
  v(0.6em)
}

// Hộp Hệ quả (Ruy-băng Tím nổi - Purple)
#let hq(title: "Hệ quả", body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: c-light-bg,
      stroke: 1pt + c-purple.lighten(60%),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #text(size: 10pt)[#body]
    ]
    #place(top + left, dx: 10pt, dy: -9pt)[
      #ribbon(c-purple, text(fill: white, weight: "bold", size: 8.5pt)[💎 #upper(title)])
    ]
  ]
  v(0.6em)
}

// Hộp Nhận xét (Ruy-băng Xám đen nổi)
#let nx(title: "Nhận xét", body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: c-light-bg,
      stroke: 1pt + rgb("#cbd5e1"),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #text(size: 10pt, style: "italic")[#body]
    ]
    #place(top + left, dx: 10pt, dy: -9pt)[
      #ribbon(rgb("#475569"), text(fill: white, weight: "bold", size: 8.5pt)[💡 #upper(title)])
    ]
  ]
  v(0.6em)
}

// Hộp Ví dụ (Ruy-băng Vàng Amber nổi)
#let vd(title: "Ví dụ minh họa", body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: c-light-bg,
      stroke: 1pt + c-amber.lighten(60%),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #text(size: 10pt)[#body]
    ]
    #place(top + left, dx: 10pt, dy: -9pt)[
      #ribbon(c-amber, text(fill: white, weight: "bold", size: 8.5pt)[📝 #upper(title)])
    ]
  ]
  v(0.6em)
}

// Hộp Cảnh báo / Lưu ý (Ruy-băng Đỏ Coral nổi, nền hồng ấm)
#let luuy(title: "Lưu ý quan trọng", body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: rgb("#fef2f2"),
      stroke: 1pt + c-coral.lighten(60%),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #text(size: 10pt)[#body]
    ]
    #place(top + left, dx: 10pt, dy: -9pt)[
      #ribbon(c-coral, text(fill: white, weight: "bold", size: 8.5pt)[⚠️ #upper(title)])
    ]
  ]
  v(0.6em)
}

// 5. TRANG DEMO NỘI DUNG SỰ PHẠM
#align(center)[
  #v(2cm)
  #text(fill: c-space, weight: "bold", size: 22pt)[MỤC LỤC CHI TIẾT]
  #v(0.5cm)
  #text(fill: c-teal, style: "italic", size: 11pt)[Bản nâng cấp thiết kế Toán học phong cách Lưới Lục Giác]
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
