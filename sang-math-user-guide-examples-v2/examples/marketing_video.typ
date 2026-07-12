#import "@local/sang-math:1.0.0": *

#set page(
  width: 1920pt,
  height: 1080pt,
  fill: rgb("#111111"), // sleek dark background
  margin: 60pt
)
#set text(size: 48pt, fill: white, font: "New Computer Modern")
#show math.equation: set text(fill: rgb("#f6e8c3"))

#let slide(content) = {
  page(align(center + horizon, block(breakable: false, width: 100%, content)))
}

#let card(body, width: 950pt) = {
  box(
    width: width,
    fill: white,
    stroke: 1pt + rgb("#e4e4e7"),
    radius: 20pt,
    inset: 50pt,
    align(left)[
      #set text(fill: black, size: 36pt)
      #show math.equation: set text(fill: black, size: 36pt)
      #body
    ]
  )
}

#let img-card(path) = {
  box(
    stroke: 4pt + rgb("#333333"),
    radius: 16pt,
    clip: true,
    image(path, height: 850pt)
  )
}

// Slide 1: Intro (Big centered text)
#slide[
  #align(center)[
    #text(size: 96pt, fill: rgb("#ff9e64"), weight: "bold")[SANG MATH]
    #v(0.5em)
    #text(size: 64pt, fill: white, weight: "bold")[ĐỈNH CAO THIẾT KẾ ĐỀ THI]
    #v(1em)
    #text(size: 44pt, fill: rgb("#a1a1aa"))[Biến mọi đề bài khô khan thành tác phẩm nghệ thuật]
  ]
]

// Slide 2: Classic theme
#slide[
  #grid(
    columns: (1fr, 1.2fr),
    gutter: 80pt,
    align(center + horizon)[#img-card("promo_classic.png")],
    align(left + horizon)[
      #text(size: 80pt, fill: rgb("#00d2ff"), weight: "bold")[Giao Diện Cổ Điển]
      #v(0.5em)
      #text(size: 48pt, fill: white)[Chuẩn mực Bộ Giáo dục & Đào tạo\ Tiết kiệm mực in tối đa]
    ]
  )
]

// Slide 3: Graphite theme
#slide[
  #grid(
    columns: (1fr, 1.2fr),
    gutter: 80pt,
    align(center + horizon)[#img-card("promo_graphite.png")],
    align(left + horizon)[
      #text(size: 80pt, fill: rgb("#a1a1aa"), weight: "bold")[Giao Diện Xám Chì]
      #v(0.5em)
      #text(size: 48pt, fill: white)[Tone màu `graphite` trung tính\ Hiện đại, tối giản và chuyên nghiệp]
    ]
  )
]

// Slide 4: Navy Gold theme
#slide[
  #grid(
    columns: (1fr, 1.2fr),
    gutter: 80pt,
    align(center + horizon)[#img-card("promo_navy-gold.png")],
    align(left + horizon)[
      #text(size: 80pt, fill: rgb("#ffb347"), weight: "bold")[Giao Diện Navy Gold]
      #v(0.5em)
      #text(size: 48pt, fill: white)[Tone màu hoàng gia sang trọng\ Sắc xanh biển kết hợp viền vàng nổi bật]
    ]
  )
]

// Slide 5: Aurora theme
#slide[
  #grid(
    columns: (1fr, 1.2fr),
    gutter: 80pt,
    align(center + horizon)[#img-card("promo_aurora.png")],
    align(left + horizon)[
      #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[Giao Diện Aurora]
      #v(0.5em)
      #text(size: 48pt, fill: white)[Độc đáo, rực rỡ và cá tính\ Tạo cảm hứng học tập mạnh mẽ]
    ]
  )
]

// Slide 6: Opt style intro
#slide[
  #align(center)[
    #text(size: 80pt, fill: rgb("#b388ff"), weight: "bold")[KHÔNG GIAN SÁNG TẠO VÔ TẬN]
    #v(1em)
    #text(size: 48pt, fill: white)[Cung cấp hàng chục tùy chọn ký hiệu khoanh đáp án]
  ]
]

// Slide 7: Opt-style Solid Square
#slide[
  #let mode = exam-mode(accent: rgb("#ffb347"), opt-style: "solid-square", q-label-style: "plain", boxed: false)
  #let tn = mode.tn
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #tn([Nghiệm của phương trình $2x + 1 = 0$ là?], ([$1$], [$-1$], [$-1/2$], [$0$]))
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#ffb347"), weight: "bold")[Hình Vuông Khối]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Cấu hình đơn giản với:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[opt-style: "solid-square"]
    ]
  )
]

// Slide 8: Opt-style Solid Hexagon
#slide[
  #let mode = exam-mode(accent: rgb("#00d2ff"), opt-style: "solid-hexagon", q-label-style: "plain", boxed: false)
  #let tn = mode.tn
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #tn([Số phức liên hợp của $z = 1 - 2i$ là?], ([$1 + 2i$], [$-1 - 2i$], [$-1 + 2i$], [$2 - i$]))
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#00d2ff"), weight: "bold")[Lục Giác Khối]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Cấu hình linh hoạt:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[opt-style: "solid-hexagon"]
    ]
  )
]

// Slide 9: Opt-style Vietnam Star
#slide[
  #let mode = exam-mode(accent: rgb("#ff0000"), opt-style: "vietnam-star", q-label-style: "plain", boxed: false)
  #let tn = mode.tn
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #tn([Đạo hàm của hàm số $y = x^2$ là?], ([$x$], [$2x$], [$x^2$], [$2$]))
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#ff0000"), weight: "bold")[Ngôi Sao Việt Nam]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Niềm tự hào dân tộc:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[opt-style: "vietnam-star"]
    ]
  )
]

// Slide 10: Opt-style Badge
#slide[
  #let mode = exam-mode(accent: rgb("#b388ff"), opt-style: "badge", q-label-style: "plain", boxed: false)
  #let tn = mode.tn
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #tn([Tập xác định của hàm số $y = log_2 x$ là?], ([$(0; +oo)$], [$RR$], [$[0; +oo)$], [$RR \\ {0}$]))
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#b388ff"), weight: "bold")[Huy Hiệu Đẹp Mắt]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Phong cách hiện đại:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[opt-style: "badge"]
    ]
  )
]

// Slide 11: Q-label Ribbon
#slide[
  #let mode = exam-mode(accent: rgb("#00e5ff"), opt-style: "plain", q-label-style: "ribbon", boxed: false)
  #let tn = mode.tn
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #tn([Hàm số nào đồng biến trên $RR$?], ([$y = x^3$], [$y = x^2$], [$y = x^4$], [$y = sin x$]))
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#00e5ff"), weight: "bold")[Nhãn Ruy Băng]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Nhãn câu hỏi cách điệu:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[q-label-style: "ribbon"]
    ]
  )
]

// Slide 12: Q-label Flag
#slide[
  #let mode = exam-mode(accent: rgb("#ffb347"), opt-style: "plain", q-label-style: "flag", boxed: false)
  #let tn = mode.tn
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #tn([Cho khối lăng trụ có diện tích đáy $B$, cao $h$. Thể tích là?], ([$V = B h$], [$V = 1/3 B h$], [$V = 1/2 B h$], [$V = 2 B h$]))
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#ffb347"), weight: "bold")[Nhãn Lá Cờ]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Nhãn hình lá cờ cá tính:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[q-label-style: "flag"]
    ]
  )
]

// Slide 13: Q-label Spark
#slide[
  #let mode = exam-mode(accent: rgb("#ff9e64"), opt-style: "plain", q-label-style: "spark", boxed: false)
  #let tn = mode.tn
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #tn([Đồ thị hàm số $y = (2x+1)/(x-1)$ có đường tiệm cận đứng là?], ([$x=1$], [$x=-1$], [$y=2$], [$y=-1/2$]))
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#ff9e64"), weight: "bold")[Nhãn Phát Sáng]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Nhãn phát sáng hiện đại:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[q-label-style: "spark"]
    ]
  )
]

// Slide 14: DS-style Folder
#slide[
  #let mode = exam-mode(accent: rgb("#00d2ff"), opt-style: "plain", q-label-style: "plain", boxed: false)
  #let ds = mode.ds
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #ds([Cho hàm số $y = f(x)$. Mệnh đề sau đúng hay sai?], 
          (
            True([Hàm số liên tục trên $RR$.]), 
            [Đạo hàm $f'(x) = 0$ vô nghiệm.]
          ), ds-style: "folder"
        )
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#00d2ff"), weight: "bold")[Dạng Thư Mục]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Danh sách kiểu thư mục:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[ds-style: "folder"]
    ]
  )
]

// Slide 15: DS-style Bookmark
#slide[
  #let mode = exam-mode(accent: rgb("#ff9e64"), opt-style: "plain", q-label-style: "plain", boxed: false)
  #let ds = mode.ds
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #ds([Một số tính chất của hình chóp.], 
          (
            [Hình chóp đều có đáy là đa giác đều.], 
            True([Hình chóp tam giác gọi là tứ diện.])
          ), ds-style: "bookmark"
        )
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#ff9e64"), weight: "bold")[Đánh Dấu Trang]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Danh sách kiểu bookmark:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[ds-style: "bookmark"]
    ]
  )
]

// Slide 16: DS-style Diamond
#slide[
  #let mode = exam-mode(accent: rgb("#b388ff"), opt-style: "plain", q-label-style: "plain", boxed: false)
  #let ds = mode.ds
  #grid(
    columns: (1.2fr, 1fr),
    gutter: 60pt,
    align(center + horizon)[
      #card[
        #ds([Cho số phức $z = 3 - 4i$.], 
          (
            True([Phần thực của $z$ là $3$.]), 
            [Mô-đun của $z$ bằng $25$.]
          ), ds-style: "diamond"
        )
      ]
    ],
    align(left + horizon)[
      #text(size: 72pt, fill: rgb("#b388ff"), weight: "bold")[Viên Kim Cương]
      #v(0.5em)
      #text(size: 44pt, fill: rgb("#a1a1aa"))[Danh sách kiểu diamond:]\
      #v(0.2em)
      #text(size: 40pt, font: "Courier New", fill: white)[ds-style: "diamond"]
    ]
  )
]

// Slide 17: Outro
#slide[
  #align(center)[
    #text(size: 96pt, fill: rgb("#ff9e64"), weight: "bold")[SANG MATH]
    #v(0.8em)
    #text(size: 64pt, fill: white, weight: "bold")[NÂNG TẦM TÀI LIỆU GIÁO DỤC CỦA BẠN]
    #v(1em)
    #text(size: 44pt, fill: rgb("#a1a1aa"))[Đồng hành kiến tạo tương lai tri thức]
  ]
]
