#import "../lib.typ": *

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
#let scene(title, code-str, render-func) = {
  page(align(center + horizon)[
    #text(size: 56pt, fill: rgb("#ff9e64"), weight: "bold")[#title]
    #v(3em)
    
    #grid(
      columns: (1fr, 1fr),
      gutter: 4em,
      align(left)[
        #box(fill: rgb("#1a1b26"), stroke: 2pt + rgb("#3b4261"), inset: 2em, radius: 1em, width: 100%)[
          #text(size: 28pt, fill: rgb("#9ece6a"))[Mã nguồn Typst:]
          #v(1em)
          #text(size: 24pt, fill: rgb("#a9b1d6"))[#raw(code-str, block: true, lang: "typst")]
        ]
      ],
      align(left)[
        #box(fill: rgb("#ffffff"), inset: 2em, radius: 1em, width: 100%)[
          #text(size: 28pt, fill: rgb("#111111"), weight: "bold")[Kết quả hiển thị:]
          #v(1em)
          #set text(fill: rgb("#111111"))
          #render-func()
        ]
      ]
    )
  ])
}

// Cảnh 1: Giới thiệu
#page(align(center + horizon)[
  #text(size: 80pt, fill: rgb("#ff9e64"), weight: "bold")[SANG-MATH: TẠO ĐỀ THI SIÊU TỐC]
  #v(2em)
  #text(size: 40pt, fill: rgb("#7aa2f7"))[Soạn thảo một lần - Tùy biến vạn năng]
  #v(3em)
  #box(stroke: 4pt + rgb("#ff9e64"), inset: 2em, radius: 1em)[
    #text(size: 32pt, fill: white)[#raw("#import \"@preview/sang-math:0.1.0\": *")]
  ]
])

// Cảnh 2: Hỗ trợ 18 Themes Màu sắc
#scene(
  "1. ĐỔI MÀU GIAO DIỆN CHỈ VỚI 1 TỪ KHOÁ",
  "#show: exam-theme.with(\n  theme: \"ocean\"\n)\n\n#exam-part([PHẦN I. Câu trắc nghiệm])\n\n#tn(\"Câu 1\", [Nội dung...], ...)",
  () => {
    let preset = exam-preset(theme: "ocean", profile: "dethi")
    let (tn, ds, tln, tl) = exam-mode(..preset.question)
    show: sang-setup.with(math-color: preset.accent)
    text(size: 24pt, fill: rgb("#111111"))[
      #text(fill: preset.accent, size: 28pt, weight: "bold")[PHẦN I. Câu trắc nghiệm]
      #v(0.5em)
      #tn([Hàm số $y=sin(x)$ tuần hoàn với chu kì là?], ([$pi$], True([$2pi$]), [$pi/2$], [$3pi$]))
    ]
  }
)

// Cảnh 3: Profile Đề thi vs Lời giải
#scene(
  "2. PROFILE THÔNG MINH: ẨN/HIỆN LỜI GIẢI",
  "#let (tn, ds, ..) = exam-mode(\n  profile: \"loigiai\"\n)\n\n#tn(\"Câu 1\", [Tính đạo hàm], \n  (..),\n  loigiai: [Ta có $y' = 3x^2$]\n)",
  () => {
    let preset = exam-preset(profile: "loigiai")
    let (tn, ds, tln, tl) = exam-mode(..preset.question)
    show: sang-setup.with(math-color: preset.accent)
    text(size: 24pt, fill: rgb("#111111"))[
      #tn([Đạo hàm của $y=x^3-3x+1$ là], ([$3x^2$], True([$3x^2-3$]), [$x^2-3$], [$3x^2+1$]), loigiai: [Ta có $y' = 3x^2 - 3$.])
    ]
  }
)

// Cảnh 4: Style câu hỏi
#scene(
  "3. TUỲ CHỈNH KIỂU DÁNG CÂU HỎI",
  "#let (tn, ..) = exam-mode(\n  opt-style: \"circle\",\n  q-label-style: \"badge\"\n)\n\n#tn(\"Câu 2\", [Phong cách mới], ..)",
  () => {
    let preset = exam-preset(profile: "loigiai", opt-style: "circle", q-label-style: "badge")
    let (tn, ds, tln, tl) = exam-mode(..preset.question)
    show: sang-setup.with(math-color: preset.accent)
    text(size: 24pt, fill: rgb("#111111"))[
      #tn([Chữ cái nào sau đây là nguyên âm?], ([$B$], True([$E$]), [$C$], [$D$]))
    ]
  }
)

// Cảnh 5: Format 2025
#scene(
  "4. HỖ TRỢ TRỌN BỘ ĐỊNH DẠNG THI MỚI 2025",
  "// Trắc nghiệm Đúng/Sai:\n#ds(\"Câu 1\", [Phát biểu sau:],\n  (True([Đúng]), [Sai])\n)\n\n// Trắc nghiệm Trả lời ngắn:\n#tln(\"Câu 2\", [Tính f(2)], [5])",
  () => {
    let preset = exam-preset(profile: "loigiai")
    let (tn, ds, tln, tl) = exam-mode(..preset.question)
    show: sang-setup.with(math-color: preset.accent)
    text(size: 24pt, fill: rgb("#111111"))[
      *1. Câu trắc nghiệm Đúng/Sai:*
      #ds([Xét hàm số $f(x)=x^2$.], (True([$f(0)=0$]), [$f(1)=2$]))
      
      *2. Câu trắc nghiệm trả lời ngắn:*
      #tln([Tính $f(2)$ biết $f(x)=x^2+1$.], [$5$])
    ]
  }
)
