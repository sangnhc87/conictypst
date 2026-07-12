// MẪU 29: THIẾT KẾ ORIGAMI 3D & NGHỆ THUẬT GẤP GIẤY (3D FOLDED RIBBON LAYOUT)
// Mẫu thiết kế độc đáo nhất: Sử dụng hiệu ứng giả lập 3D Origami làm cho các ruy-băng tiêu đề chương, 
// hộp định lý và tiêu đề bài học như đang gập cuộn quanh mép trang giấy và viền hộp.

// 1. COLOR PALETTE (Bảng màu Origami sặc sỡ nhưng sang trọng)
#let c-primary = rgb("#1E40AF")   // Royal Blue (Chương, Định lý)
#let c-secondary = rgb("#0D9488") // Teal/Cyan (Bài học, Định nghĩa)
#let c-accent = rgb("#F59E0B")    // Amber/Gold (Ví dụ, Điểm nhấn)
#let c-coral = rgb("#DC2626")    // Coral Red (Cảnh báo)
#let c-green = rgb("#047857")    // Forest Green (Tính chất)
#let c-purple = rgb("#7C3AED")   // Violet (Hệ quả)
#let c-slate = rgb("#475569")    // Slate Gray (Nhận xét)
#let c-space = rgb("#0F172A")    // Deep Slate (Chữ thân bài)
#let c-light-bg = rgb("#F8FAFC") // Nền hộp Slate nhẹ

// Thiết lập trang
#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2.0cm, right: 2.0cm),
  header-ascent: 60%,
  footer-descent: 60%,
  
  // Dải ruy-băng Origami 3D ở Background trang trí đỉnh và đáy trang
  background: {
    // 1. Ruy-băng Header cuộn từ lề trái sang phải
    place(top + left, dx: -0.5cm, dy: 0.2cm, block(width: 22cm, height: 1.1cm)[
      // Thân ruy-băng chính màu Navy
      #place(top + left, rect(fill: c-primary, width: 21.5cm, height: 1.1cm, radius: (right: 4pt)))
      // Điểm gập 3D ở góc trái (màu tối hơn tạo chiều sâu)
      #place(top + left, dx: 0.5cm, dy: 1.1cm, polygon(fill: c-primary.darken(35%), (0cm, 0cm), (-0.5cm, 0cm), (0cm, 0.4cm)))
    ])
    
    // 2. Ruy-băng Footer cuộn từ lề phải sang trái
    place(bottom + left, dx: -0.5cm, dy: -0.2cm, block(width: 22cm, height: 0.9cm)[
      // Thân ruy-băng chính màu Teal
      #place(top + left, dx: 0.5cm, rect(fill: c-secondary, width: 21.5cm, height: 0.9cm, radius: (left: 4pt)))
      // Điểm gập 3D ở góc phải (màu tối hơn tạo chiều sâu)
      #place(top + left, dx: 21.5cm, dy: -0.4cm, polygon(fill: c-secondary.darken(35%), (0cm, 0.4cm), (0.5cm, 0.4cm), (0cm, 0cm)))
    ])
  },
  
  // Header chữ trắng trên dải ruy-băng 3D
  header: context {
    grid(
      columns: (1fr, auto),
      align(left + horizon)[#text(fill: white, weight: "bold", size: 9pt)[📚 SANG MATH ORIGAMI-3D LAYOUT]],
      align(right + horizon)[#text(fill: white.transparentize(20%), weight: "bold", size: 9pt)[CHUYÊN ĐỀ HÀM SỐ]]
    )
  },
  
  // Footer chữ trắng sang trọng
  footer: context {
    grid(
      columns: (auto, 1fr, auto),
      align(left + horizon)[#text(fill: white, weight: "bold", size: 9pt)[📄 TRANG #counter(page).display("1")]],
      align(center)[],
      align(right + horizon)[#text(fill: white.transparentize(20%), weight: "bold", size: 8.5pt)[thptquocgia.math.vn - Luyện thi chất lượng cao 🎓]]
    )
  }
)

#set text(font: "New Computer Modern", size: 10.5pt, fill: c-space)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

// 2. PHẦN TẠO HIỆU ỨNG RUY-BĂNG ĐỘNG GẤP KHỐI 3D (DYNAMIC 3D FOLDED RIBBONS)
#let ribbon-3d(fill-color, icon, title) = {
  box(width: 100%)[
    // 1. Thân ruy-băng chính (Nhô sang trái 8pt)
    #place(top + left, dx: -8pt, dy: -8pt)[
      #box(fill: fill-color, inset: (x: 8pt, y: 4pt), radius: (top-left: 2pt, bottom-left: 2pt, top-right: 2pt))[
        #text(fill: white, weight: "bold", size: 8.5pt)[#icon #upper(title)]
      ]
    ]
    // 2. Góc gập 3D màu tối hơn phía dưới mép trái
    #place(top + left, dx: -8pt, dy: 10pt)[
      #polygon(fill: fill-color.darken(35%), (0pt, 0pt), (8pt, 0pt), (8pt, 8pt))
    ]
  ]
}

// Hàm bao bọc khung ruy-băng 3D tổng quát
#let box-3d(fill-color, icon, title, body) = {
  v(0.8em)
  box(width: 100%)[
    #box(
      width: 100%,
      fill: c-light-bg,
      stroke: 1pt + fill-color.lighten(60%),
      inset: (top: 20pt, bottom: 12pt, left: 12pt, right: 12pt),
      radius: 4pt
    )[
      #body
    ]
    #ribbon-3d(fill-color, icon, title)
  ]
  v(0.6em)
}

// 3. THIẾT LẬP CÁC TIÊU ĐỀ GẤP GIẤY 3D

// Tiêu đề chương (Heading 1) cuốn mép lề trái
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(1.2cm)
  place(left, dx: -12pt)[
    #box(width: 100% + 12pt, height: 42pt)[
      // Thân tiêu đề
      #place(top + left, rect(fill: c-primary, width: 100% - 12pt, height: 42pt, radius: (top-right: 4pt, bottom-right: 4pt)))
      // Điểm gập 3D phía dưới lề trái
      #place(top + left, dx: 0pt, dy: 42pt)[
        #polygon(fill: c-primary.darken(35%), (0pt, 0pt), (12pt, 0pt), (12pt, 12pt))
      ]
      // Chữ tiêu đề
      #place(top + left, dx: 22pt, dy: 9pt)[
        #grid(
          columns: (auto, 1fr),
          gutter: 15pt,
          align(center + horizon)[
            #text(fill: c-accent, weight: "black", size: 20pt)[0#num]
          ],
          align(left + horizon)[
            #text(fill: white, weight: "bold", size: 13pt)[#upper(it.body)]
          ]
        )
      ]
    ]
  ]
  v(2.0cm)
}

// Tiêu đề bài (Heading 2) cuốn mép màu Teal
#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  v(1.0cm)
  place(left, dx: -12pt)[
    #box(width: 100% + 12pt, height: 32pt)[
      #place(top + left, rect(fill: c-secondary, width: 100% - 12pt, height: 32pt, radius: (top-right: 4pt, bottom-right: 4pt)))
      #place(top + left, dx: 0pt, dy: 32pt)[
        #polygon(fill: c-secondary.darken(35%), (0pt, 0pt), (12pt, 0pt), (12pt, 10pt))
      ]
      #place(top + left, dx: 22pt, dy: 7pt)[
        #text(fill: white, weight: "bold", size: 11pt)[BÀI #num. #upper(it.body)]
      ]
    ]
  ]
  v(1.3cm)
}

// Tiêu đề mục (Heading 3) đi kèm ruy-băng giấy mini gập chéo
#show heading.where(level: 3): it => {
  v(0.6cm)
  grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    align(center + horizon)[
      #box(width: 14pt, height: 14pt)[
        #place(top + left, rect(fill: c-accent, width: 10pt, height: 10pt, radius: 1pt))
        #place(top + left, dx: 0pt, dy: 10pt, polygon(fill: c-accent.darken(35%), (0pt, 0pt), (4pt, 0pt), (4pt, 4pt)))
      ]
    ],
    align(left + horizon)[#text(fill: c-secondary, weight: "bold", size: 11pt)[#it.body]]
  )
  v(0.3cm)
}

// 4. KHAI BÁO CÁC HỘP SƯ PHẠM ĐẲNG CẤP 3D ORIGAMI

// Hộp Định nghĩa (Teal)
#let dn(title: "Định nghĩa", body) = box-3d(c-secondary, [🧬], title, body)

// Hộp Định lý (Royal Blue)
#let dl(title: "Định lí", body) = box-3d(c-primary, [🎯], title, body)

// Hộp Tính chất (Forest Green)
#let tc(title: "Tính chất", body) = box-3d(c-green, [⚙️], title, body)

// Hộp Hệ quả (Violet)
#let hq(title: "Hệ quả", body) = box-3d(c-purple, [💎], title, body)

// Hộp Nhận xét (Slate Gray)
#let nx(title: "Nhận xét", body) = box-3d(c-slate, [💡], title, body)

// Hộp Ví dụ (Amber)
#let vd(title: "Ví dụ minh họa", body) = box-3d(c-accent, [📝], title, body)

// Hộp Cảnh báo / Lưu ý (Coral Red)
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
      #body
    ]
    #ribbon-3d(c-coral, [⚠️], title)
  ]
  v(0.6em)
}

// 5. TRANG THIẾT KẾ MỤC LỤC 3D ORIGAMI
#show outline.entry.where(level: 1): it => {
  v(14pt, weak: true)
  box(width: 100%)[
    #place(top + left, dx: -8pt, dy: -4pt)[
      #polygon(fill: c-primary.darken(35%), (0pt, 0pt), (8pt, 0pt), (8pt, 8pt))
    ]
    #box(
      width: 100%,
      fill: c-primary.lighten(94%),
      stroke: (left: 4pt + c-primary),
      inset: (x: 12pt, y: 8pt),
      radius: (top-right: 4pt, bottom-right: 4pt),
      text(fill: c-primary, weight: "bold", size: 11pt, it)
    )
  ]
}

#show outline.entry.where(level: 2): it => {
  v(8pt, weak: true)
  pad(left: 10pt)[
    #grid(
      columns: (auto, 1fr),
      gutter: 8pt,
      align(center + horizon)[
        #box(width: 8pt, height: 8pt)[
          #place(top + left, rect(fill: c-accent, width: 6pt, height: 6pt, radius: 1pt))
          #place(top + left, dx: 0pt, dy: 6pt, polygon(fill: c-accent.darken(35%), (0pt, 0pt), (2pt, 0pt), (2pt, 2pt)))
        ]
      ],
      align(left + horizon)[#text(fill: c-secondary, weight: "bold", size: 10pt, it)]
    )
  ]
}

#align(center)[
  #v(2cm)
  #text(fill: c-primary, weight: "bold", size: 22pt)[MỤC LỤC CHI TIẾT]
  #v(0.5cm)
  #text(fill: c-secondary, style: "italic", size: 11pt)[Bản nâng cấp thiết kế Toán học phong cách Gấp Giấy 3D Origami]
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
