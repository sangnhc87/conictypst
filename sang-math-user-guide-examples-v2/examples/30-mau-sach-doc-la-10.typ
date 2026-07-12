// MẪU 30: PHONG CÁCH HỘP THẺ NỔI & TỐI ƯU HÓA DIỆN TÍCH (COMPACT PILL-TAB LAYOUT)
// Thiết kế siêu tiết kiệm giấy: Thu hẹp tối đa 4 lề trang (lề trái/phải/trên 1.2cm, lề dưới 1.5cm).
// Định vị Header/Footer an toàn bằng trị số tuyệt đối (0.8cm) chống khuất/ẩn chữ khi in ấn.

// 1. COLOR SYSTEM (Hệ màu nhã nhặn từ Mẫu 21)
#let c-dark = rgb("#0a063b")      // Navy đậm (Chữ chính & khung chính)
#let c-teal = rgb("#10868f")      // Teal hiện đại (Bài học, định nghĩa)
#let c-orange = rgb("#f26422")    // Cam hổ phách (Lưu ý, ghi chú)
#let c-green = rgb("#4caf50")     // Xanh lá (Tính chất)
#let c-purple = rgb("#7c3aed")    // Tím (Hệ quả)
#let c-slate = rgb("#475569")     // Xám Slate (Nhận xét)
#let c-coral = rgb("#ef4444")     // Đỏ Coral (Cảnh báo)
#let c-gray-line = rgb("#cbd5e1") // Xám nhạt cho đường kẻ

// Thiết lập trang siêu tiết kiệm diện tích (4 lề cực nhỏ)
#set page(
  paper: "a4",
  margin: (top: 2.0cm, bottom: 2.0cm, left: 1.2cm, right: 1.2cm),
  header-ascent: 0.8cm,
  footer-descent: 0.8cm,
  
  // Header tinh giản đối xứng (Sử dụng đường kẻ nét đứt thanh lịch ở dưới)
  header: context {
    v(2pt) // Hạ text header xuống một chút
    grid(
      columns: (1fr, auto),
      align(left)[#text(fill: c-dark, weight: "bold", size: 8.5pt)[📚 SANG MATH COMPACT EDITORIAL]],
      align(right)[#text(fill: c-teal, weight: "bold", size: 8.5pt)[CHUYÊN ĐỀ HÀM SỐ HỌC]]
    )
    v(-2pt) // Kéo dòng kẻ cao lên sát chữ hơn
    line(length: 100%, stroke: (paint: c-gray-line, thickness: 0.8pt, dash: "dashed"))
  },
  
  // Footer hiển thị an toàn tuyệt đối, sát mép dưới nhưng không bị cắt do dùng đường kẻ lơ lửng phía trên
  footer: context {
    place(top + left, dy: -6pt, line(length: 100%, stroke: 1.2pt + c-dark))
    place(top + left, dy: -3.8pt, line(length: 100%, stroke: 0.5pt + c-gray-line))
    
    grid(
      columns: (1fr, auto),
      align(left + horizon)[
        #text(fill: c-dark.lighten(30%), size: 8pt)[thptquocgia.math.vn - Ấn bản học tập siêu tiết kiệm 🎓]
      ],
      align(right + horizon)[
        #box(stroke: 0.8pt + c-dark, inset: (x: 5pt, y: 3pt), radius: 2pt)[
          #text(fill: c-dark, weight: "bold", size: 8pt)[TRANG #counter(page).display("01")]
        ]
      ]
    )
  }
)

#set text(font: "New Computer Modern", size: 10.5pt, fill: c-dark)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

// Khung gợi ý / ghi chú toàn chiều rộng cực kỳ đẹp mắt, không lo bị xuống dòng vụn vặt
#let ghichu(body) = {
  v(0.4em)
  box(
    width: 100%,
    fill: rgb("#fffde7"), // Màu vàng giấy note nhã nhặn
    stroke: (left: 3pt + c-orange, rest: 0.5pt + rgb("#fef08a")),
    inset: 8pt,
    radius: (right: 4pt)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 6pt,
      align(top)[#text(fill: c-orange.darken(15%), weight: "bold", size: 8.5pt)[💡 GỢI Ý:]],
      align(left)[#text(size: 9pt, style: "italic", fill: c-dark.lighten(10%))[#body]]
    )
  ]
  v(0.4em)
}

// 2. THIẾT KẾ TIÊU ĐỀ KHỐI ĐỐI XỨNG COMPACT

// Tiêu đề chương (Heading 1) - Tiết kiệm chiều cao
#show heading.where(level: 1): it => {
  let num = context counter(heading).display("1")
  v(0.4cm)
  box(
    width: 100%,
    fill: c-dark,
    inset: (x: 12pt, y: 10pt),
    radius: 4pt,
    stroke: (left: 4pt + c-orange)
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 12pt,
      align(center + horizon)[
        #text(fill: c-orange, weight: "black", size: 18pt)[0#num]
      ],
      align(left + horizon)[
        #text(fill: white, weight: "bold", size: 11.5pt)[#upper(it.body)]
      ]
    )
  ]
  v(0.4cm)
}

// Tiêu đề bài (Heading 2)
#show heading.where(level: 2): it => {
  let num = context counter(heading).display("1.1")
  v(0.5cm)
  grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    align(center + horizon)[
      #box(fill: c-teal, radius: 2pt, inset: (x: 6pt, y: 4pt))[
        #text(fill: white, weight: "bold", size: 9pt)[BÀI #num]
      ]
    ],
    align(left + horizon)[
      #text(fill: c-dark, weight: "bold", size: 11.5pt)[#it.body]
    ]
  )
  v(0.1cm)
  line(length: 100%, stroke: 0.6pt + c-gray-line)
  v(0.2cm)
}

// Tiêu đề mục (Heading 3)
#show heading.where(level: 3): it => {
  v(0.3cm)
  grid(
    columns: (auto, 1fr),
    gutter: 6pt,
    align(center + horizon)[
      #circle(fill: c-teal, radius: 2pt)
    ],
    align(left + horizon)[#text(fill: c-teal, weight: "bold", size: 10pt)[#it.body]]
  )
  v(0.2cm)
}

// 3. KHAI BÁO CÁC HỘP SƯ PHẠM ĐẲNG CẤP PILL-TAB CARDS

#let card-pill(fill-color, stroke-color, text-color, icon, title, body) = {
  v(0.6em)
  box(width: 100%)[
    // Thân hộp chính
    #box(
      width: 100%,
      fill: fill-color,
      stroke: (left: 3.5pt + stroke-color, rest: 0.5pt + stroke-color.lighten(60%)),
      inset: (top: 15pt, bottom: 8pt, left: 10pt, right: 10pt),
      radius: (right: 4pt)
    )[
      #text(size: 9.5pt, fill: c-dark)[#body]
    ]
    // Thẻ ruy-băng bo tròn (Pill-Tab) đè lên góc trên
    #place(top + left, dx: 8pt, dy: -7pt)[
      #box(fill: stroke-color, radius: 8pt, inset: (x: 8pt, y: 3.5pt))[
        #text(fill: text-color, weight: "bold", size: 8pt)[#icon #upper(title)]
      ]
    ]
  ]
  v(0.4em)
}

// Hộp Định nghĩa (Màu Đỏ/Hồng Mẫu 21)
#let dn(body) = card-pill(rgb("#fae6e5"), rgb("#f44336"), white, [🧬], "Định nghĩa", body)

// Hộp Định lý (Màu Lam Nhẹ Mẫu 21)
#let dl(title: "Định lí", body) = card-pill(rgb("#e3f2fd"), rgb("#1976d2"), white, [🎯], title, body)

// Hộp Tính chất (Xanh lá Mẫu 21)
#let tc(body) = card-pill(rgb("#e8f5e9"), rgb("#388e3c"), white, [⚙️], "Tính chất", body)

// Hộp Hệ quả (Tím)
#let hq(body) = card-pill(rgb("#f3e5f5"), c-purple, white, [💎], "Hệ quả", body)

// Hộp Nhận xét (Xám Slate)
#let nx(body) = card-pill(rgb("#f1f5f9"), c-slate, white, [💡], "Nhận xét", body)

// Hộp Ví dụ (Cam Amber Mẫu 21)
#let vd(body) = card-pill(rgb("#fff3e0"), c-orange, white, [📝], "Ví dụ minh họa", body)

// Hộp Cảnh báo (Đỏ Coral)
#let luuy(body) = card-pill(rgb("#fef2f2"), c-coral, white, [⚠️], "Cảnh báo quan trọng", body)

// 4. THIẾT KẾ MỤC LỤC ĐỐI XỨNG
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    align(center + horizon)[
      #box(fill: c-dark, radius: 2pt, inset: (x: 6pt, y: 3pt))[
        #text(fill: white, weight: "bold", size: 8pt)[Mục]
      ]
    ],
    align(left + horizon)[#text(fill: c-dark, weight: "bold", size: 10pt, it)]
  )
}

#show outline.entry.where(level: 2): it => {
  v(6pt, weak: true)
  pad(left: 8pt)[
    #grid(
      columns: (auto, 1fr),
      gutter: 6pt,
      align(center + horizon)[
        #circle(fill: c-teal, radius: 2pt)
      ],
      align(left + horizon)[#text(fill: c-teal, weight: "bold", size: 9.5pt, it)]
    )
  ]
}

// 5. TRANG DEMO NỘI DUNG SỰ PHẠM
#align(center)[
  #v(1cm)
  #text(fill: c-dark, weight: "bold", size: 18pt)[MỤC LỤC CHI TIẾT]
  #v(0.3cm)
  #text(fill: c-teal, style: "italic", size: 10pt)[Giáo trình khảo sát hàm số bậc cao]
]
#v(0.5cm)
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
