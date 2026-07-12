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
    #text(size: 40pt, weight: "bold", fill: rgb("#10868f"))[HỆ THỐNG ĐỀ THI TỰ ĐỘNG]
    #v(0.5em)
    #text(size: 24pt, style: "italic")[Chuyên Nghiệp, Chính Xác, Đẹp Mắt]
  ]
]

// Slide 2: Classic
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-01-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Phong Cách Cổ Điển]
      #v(0.5em)
      Chuẩn cấu trúc BGD, tối giản và nghiêm túc.
    ]
  )
]

// Slide 3: Ocean
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-02-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#f26422"))[Đại Dương Xanh]
      #v(0.5em)
      Dịu mắt, nhãn bo góc mềm mại, thân thiện.
    ]
  )
]

// Slide 4: Violet + Vietnam Star
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-03-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Tím Mộng Mơ]
      #v(0.5em)
      Kết hợp nhãn đáp án Ngôi Sao Vàng Việt Nam.
    ]
  )
]

// Slide 5: Crimson
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-04-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Đỏ Rực Rỡ]
      #v(0.5em)
      Mạnh mẽ, nhãn câu hỏi dạng ruy băng (ribbon).
    ]
  )
]

// Slide 6: Teal-Pro + Diamond
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-05-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Xanh Mòng Két]
      #v(0.5em)
      Hiện đại với nhãn lá cờ đuôi nheo và đáp án kim cương.
    ]
  )
]

// Slide 7: Navy-Gold
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-06-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Navy Vàng Kim]
      #v(0.5em)
      Sang trọng, đẳng cấp với đa giác và nhãn gạch chân.
    ]
  )
]

// Slide 8: Plum + Hexagon
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-07-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Đỏ Mận Độc Lạ]
      #v(0.5em)
      Quyến rũ, đáp án hình lục giác phá cách.
    ]
  )
]

// Slide 9: Sky + Calligraphy
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-08-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Xanh Bầu Trời]
      #v(0.5em)
      Font chữ Calligraphy bay bổng, tràn đầy sức sống.
    ]
  )
]

// Slide 10: Lời giải Ocean
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-09-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Chế Độ Giáo Viên]
      #v(0.5em)
      Hiện lời giải chi tiết, tô đỏ đáp án đúng chỉ với 1 thao tác.
    ]
  )
]

// Slide 11: Lời giải Crimson
#slide[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(horizon)[
      #image("images/exam-config-10-2.png", height: 80%)
    ],
    align(horizon)[
      #text(size: 28pt, weight: "bold", fill: rgb("#10868f"))[Đồng Bộ Lời Giải]
      #v(0.5em)
      Tự động đóng khung màu sắc theo phong cách chủ đề.
    ]
  )
]

// Slide 12: Outro
#slide[
  #align(center + horizon)[
    #text(size: 36pt, weight: "bold", fill: rgb("#10868f"))[CONICTYPST PUBLISHING]
    #v(0.5em)
    #text(size: 24pt)[Sáng Tạo Không Giới Hạn]
  ]
]
