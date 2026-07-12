#import "../lib.typ": *
#import "../../typst-pkg-submit/sang-beamer-themes.typ": get-beamer-theme, beamer-themes

#set page(
  width: 1920pt,
  height: 1080pt,
  fill: rgb("#111111"),
  margin: 40pt
)

#set text(size: 32pt, fill: white, font: "New Computer Modern")
#show math.equation: set text(fill: rgb("#f6e8c3"), size: 40pt)
#set align(center)

// Hàm tạo một trang trình chiếu xịn xò
#let scene(title, code-str, render-func, ratio: (1fr, 1.2fr)) = {
  page(align(center + horizon)[
    #text(size: 56pt, fill: rgb("#ff9e64"), weight: "bold")[#title]
    #v(3em)
    
    #grid(
      columns: ratio,
      gutter: 4em,
      align(left)[
        #box(fill: rgb("#1a1b26"), stroke: 2pt + rgb("#3b4261"), inset: 2em, radius: 1em, width: 100%)[
          #text(size: 28pt, fill: rgb("#9ece6a"))[Mã nguồn Typst:]
          #v(1em)
          #text(size: 24pt, fill: rgb("#a9b1d6"))[#raw(code-str, block: true, lang: "typst")]
        ]
      ],
      align(left)[
        #box(fill: rgb("#ffffff"), inset: 0pt, radius: 1em, width: 100%, stroke: 4pt + rgb("#3b4261"), clip: true)[
          #render-func()
        ]
      ]
    )
  ])
}

// Giả lập giao diện slide để nhúng vào màn hình đôi
#let mock-slide(theme-id: "1", q-num: "1", stem: [], opts: (), correct-idx: none) = {
  let thm = get-beamer-theme(theme-id)
  let bg = thm.bg_color
  let fg = thm.text_fill
  let accent = thm.accent
  let m-col = thm.math_color
  let card-fill = bg.lighten(15%)
  
  box(width: 100%, height: 600pt, fill: bg, inset: (x: 40pt, y: 30pt))[
    #show math.equation: set text(fill: m-col)
    // Header
    #align(center)[
      #block(width: 80%, stroke: (top: 3pt + accent, bottom: 3pt + accent), inset: (y: 15pt))[
        #text(size: 16pt, fill: accent, weight: "bold", tracking: 2pt)[CHƯƠNG TRÌNH]
        #v(0.5em)
        #text(size: 28pt, weight: "bold", fill: fg)[PHẦN I. CÂU TRẮC NGHIỆM]
      ]
    ]
    #v(2em)
    // Câu hỏi
    #grid(
      columns: (auto, 1fr),
      gutter: 15pt,
      box(fill: accent, inset: (x: 15pt, y: 10pt), radius: 6pt)[
        #text(weight: "bold", fill: white, size: 22pt)[Câu #q-num]
      ],
      text(size: 24pt, fill: fg)[#stem]
    )
    #v(2em)
    // Đáp án
    #grid(
      columns: (1fr, 1fr), row-gutter: 20pt, column-gutter: 20pt,
      ..opts.enumerate().map(((i, t)) => {
        let labels = ("A", "B", "C", "D")
        let is-correct = i == correct-idx
        let c-bg = if is-correct { rgb("#22c55e").darken(50%) } else { card-fill }
        let c-str = if is-correct { 2pt + rgb("#22c55e") } else { 0pt }
        let l-bg = if is-correct { rgb("#22c55e") } else { accent }
        box(width: 100%, fill: c-bg, stroke: c-str, radius: 10pt)[
          #grid(columns: (auto, 1fr))[
            #box(fill: l-bg, inset: (x: 18pt, y: 15pt), radius: (top-left: 8pt, bottom-left: 8pt))[
              #text(weight: "bold", fill: white, size: 22pt)[#labels.at(i).]
            ]
          ][
            #pad(x: 15pt, y: 15pt)[
              #text(size: 20pt, fill: fg)[#t]
            ]
          ]
        ]
      })
    )
  ]
}

// Cảnh 1: Giới thiệu trình chiếu
#page(align(center + horizon)[
  #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[SANG-BEAMER: TRÌNH CHIẾU ĐỈNH CAO]
  #v(2em)
  #text(size: 40pt, fill: rgb("#7aa2f7"))[Không cần soạn lại - Đẹp ngay từ dòng đầu tiên]
  #v(3em)
  #box(stroke: 4pt + rgb("#ff9e64"), inset: 2em, radius: 1em)[
    #text(size: 32pt, fill: white)[#raw("#import \"@preview/sang-math:0.1.0\": *")]
  ]
])

// Cảnh 2: 1 dòng đổi A4 thành Slide
#scene(
  "1. ĐỔI GIẤY A4 THÀNH SLIDE CHỈ 1 DÒNG",
  "// Đề thi cũ:\n// #let (mcq, tf) = exam-mode(\n//   profile: \"dethi\" \n// )\n\n// Chuyển sang trình chiếu:\n#show: sang-beamer-theme.with(\n  title: \"TOÁN 12\",\n  theme: \"1\"\n)\n\n#let (mcq, tf) = exam-mode(\n  profile: \"beamer\"\n)",
  () => mock-slide(
    theme-id: "1", 
    stem: [Đạo hàm của hàm số $y=x^3-3x+1$ là],
    opts: ([$3x^2$], [$3x^2-3$], [$x^2-3$], [$3x^2+1$])
  )
)

// Cảnh 3: Giao diện khi hiện đáp án
#scene(
  "2. TỰ ĐỘNG BUNG ĐÁP ÁN VÀ LỜI GIẢI",
  "#let (mcq, tf) = exam-mode(\n  profile: \"beamer\",\n  mode: \"loigiai\"\n)\n\n#mcq(\n  [Đạo hàm của hàm số...],\n  (..),\n  correct: 2,\n  loigiai: [Ta có $y' = 3x^2-3$.]\n)",
  () => mock-slide(
    theme-id: "1", 
    stem: [Đạo hàm của hàm số $y=x^3-3x+1$ là],
    opts: ([$3x^2$], [$3x^2-3$], [$x^2-3$], [$3x^2+1$]),
    correct-idx: 1
  )
)

// Cảnh 4: Bắt đầu showcase 30 themes
#page(align(center + horizon)[
  #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[BỘ SƯU TẬP 30 THEMES MÀU SẮC]
  #v(2em)
  #text(size: 40pt, fill: rgb("#7aa2f7"))[Thay đổi diện mạo bài giảng chỉ với 1 con số]
])

// Lặp 30 themes
#for i in range(1, 31) {
  let tid = str(i)
  let thm = get-beamer-theme(tid)
  scene(
    "THEME " + tid + ": " + upper(thm.name),
    "#show: sang-beamer-theme.with(\n  theme: \"" + tid + "\"\n)\n\n// Theme: " + thm.name + "\n// Giao diện sẽ tự động đổi màu\n// nền, chữ, công thức toán...",
    () => mock-slide(
      theme-id: tid, 
      stem: [Khẳng định nào sau đây đúng?],
      opts: ([$sin(pi) = 0$], [$cos(pi) = 0$], [$tan(pi) = 0$], [$cot(pi) = 0$]),
      correct-idx: 0
    )
  )
}

// Cảnh cuối
#page(align(center + horizon)[
  #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[CẢM ƠN THẦY CÔ!]
  #v(2em)
  #text(size: 40pt, fill: rgb("#7aa2f7"))[Chúc thầy cô có những tiết dạy thật bùng nổ cùng Sang Math!]
])
