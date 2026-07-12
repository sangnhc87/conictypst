#import "@preview/touying:0.5.3": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-colors(
    primary: rgb("#10868f"), // c-teal
    primary-light: rgb("#e0f7fa"),
    secondary: rgb("#f26422"),
  ),
)

#set text(font: "New Computer Modern", size: 20pt)

// Slide 1: Intro
#slide[
  #align(center + horizon)[
    #text(size: 40pt, weight: "bold", fill: rgb("#10868f"))[BỘ SƯU TẬP 10 MẪU SÁCH]
    #v(0.5em)
    #text(size: 24pt, style: "italic")[Khẳng Định Đẳng Cấp Tài Liệu Toán Học]
  ]
]

// Slide 2: Template 21
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-21-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 01: Chuẩn Mực]
      #v(0.5em)
      Thiết kế thanh lịch với tông màu xanh nhạt, lý tưởng cho sách giáo khoa và chuyên đề sâu.
    ]
  )
]

// Slide 3: Template 22
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-22-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#f26422"))[Mẫu số 02: Tạp Chí Mĩ]
      #v(0.5em)
      Độc đáo với cấu trúc hộp chú thích (side-note) nổi bật ở lề phải trang giấy.
    ]
  )
]

// Slide 4: Template 23
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-23-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 03: Đương Đại]
      #v(0.5em)
      Góc bo tròn mềm mại kết hợp màu sắc tương phản cao, kích thích thị giác tối đa.
    ]
  )
]

// Slide 5: Template 24
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-24-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 04: Cổ Điển]
      #v(0.5em)
      Hệ thống đánh số rõ ràng, đường nét dứt khoát, chuyên trị các mảng kiến thức hàn lâm.
    ]
  )
]

// Slide 6: Template 25
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-25-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 05: Phá Cách]
      #v(0.5em)
      Sử dụng mảng khối 3D tinh tế, biến những trang lý thuyết khô khan trở nên sống động.
    ]
  )
]

// Slide 7: Template 26
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-26-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 06: Minimalist]
      #v(0.5em)
      Loại bỏ các chi tiết rườm rà, tập trung 100% vào vẻ đẹp nguyên bản của công thức Toán.
    ]
  )
]

// Slide 8: Template 27
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-27-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 07: Kỹ Thuật Số]
      #v(0.5em)
      Giao diện mang âm hưởng công nghệ, rất phù hợp cho tài liệu Khoa học Máy tính.
    ]
  )
]

// Slide 9: Template 28
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-28-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 08: Nghệ Thuật]
      #v(0.5em)
      Phối màu Pastel nhẹ nhàng nhưng không kém phần sang trọng và lôi cuốn.
    ]
  )
]

// Slide 10: Template 29
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-29-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 09: Bứt Phá]
      #v(0.5em)
      Các dải ruy-băng rực rỡ thu hút sự chú ý vào các Định lý, Định nghĩa quan trọng.
    ]
  )
]

// Slide 11: Template 30
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/book-temp-30-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Mẫu số 10: Đỉnh Cao]
      #v(0.5em)
      Tuyệt tác thiết kế sách giáo khoa hiện đại. Đẳng cấp của hệ thống Sang-Math Typst.
    ]
  )
]

// Slide 12: Outro
#slide[
  #align(center + horizon)[
    #text(size: 36pt, weight: "bold", fill: rgb("#10868f"))[CONICTYPST PUBLISHING]
    #v(0.5em)
    #text(size: 24pt)[Sáng Tạo Không Giới Hạn Với Toán Học]
  ]
]
