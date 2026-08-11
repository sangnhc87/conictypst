#set page(
  width: 1920pt,
  height: 1080pt,
  fill: rgb("#0f172a"), // Slate 900
  margin: 60pt
)

// Font setup
#set text(size: 32pt, fill: rgb("#f8fafc"), font: "New Computer Modern")
#show math.equation: set text(fill: rgb("#fde047"), size: 48pt)
#set align(center)

// PAGE 1: Line 1
#page[
  #align(center + horizon)[
    #text(size: 80pt, fill: rgb("#38bdf8"), weight: "bold")[DÀNH CHO GIÁO VIÊN TIẾNG ANH] 
    #v(1.5em)
    #text(size: 60pt, fill: rgb("#e2e8f0"))[Thầy cô gặp khó khăn khi thiết kế bài giảng trình chiếu?]
  ]
]

// PAGE 2: Line 2
#page[
  #align(center + horizon)[
    #text(size: 80pt, fill: rgb("#38bdf8"), weight: "bold")[DÀNH CHO GIÁO VIÊN TIẾNG ANH] 
    #v(1.5em)
    #text(size: 60pt, fill: rgb("#e2e8f0"))[Thầy cô gặp khó khăn khi thiết kế bài giảng trình chiếu?]
    #v(2em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 40pt,
      block(fill: rgb("#be123c"), inset: 50pt, radius: 40pt)[
        #text(size: 100pt)[📄] \ #text(size: 40pt, fill: white, weight: "bold")[Cắt dán PDF]
      ],
      block(fill: rgb("#1d4ed8"), inset: 50pt, radius: 40pt)[
        #text(size: 100pt)[📝] \ #text(size: 40pt, fill: white, weight: "bold")[Gõ lại WORD]
      ],
      block(fill: rgb("#15803d"), inset: 50pt, radius: 40pt)[
        #text(size: 100pt)[🖼️] \ #text(size: 40pt, fill: white, weight: "bold")[Chèn ẢNH]
      ]
    )
  ]
]

// PAGE 3: Line 3
#page[
  #align(center + horizon)[
    #text(size: 90pt, fill: rgb("#10b981"), weight: "bold")[GIẢI PHÁP ĐÃ CÓ MẶT] 
    #v(2em)
    #block(
      fill: rgb("#e11d48"),
      inset: 60pt,
      radius: 50pt
    )[
      #text(size: 100pt, fill: white, weight: "bold")[trinhchieu.pages.dev]
    ]
  ]
]

// PAGE 4: Line 4
#page[
  #align(center + horizon)[
    #text(size: 60pt, fill: rgb("#38bdf8"), weight: "bold")[CHỈ CẦN KÉO THẢ TẤT CẢ VÀO HỆ THỐNG]
    #v(1.5em)
    #block(
      stroke: 6pt + rgb("#38bdf8"), 
      radius: 20pt, 
      clip: true,
      width: 85%
    )[
      #image("home.png", width: 100%)
    ]
  ]
]

// PAGE 5: Line 5
#page[
  #align(center + horizon)[
    #text(size: 80pt, fill: rgb("#f59e0b"), weight: "bold")[AI PHÂN TÍCH TỰ ĐỘNG] 
    #v(1.5em)
    #text(size: 60pt, fill: rgb("#f8fafc"))[Tạo bài giảng Siêu Nhanh - Siêu Đẹp]
    #v(1em)
    #text(size: 60pt, fill: rgb("#34d399"))[Tối ưu đặc biệt cho môn Tiếng Anh!]
  ]
]

// PAGE 6: Line 6
#page[
  #align(center + horizon)[
    #text(size: 55pt, fill: rgb("#10b981"), weight: "bold")[BÀI ĐỌC HIỂU DÀI ĐƯỢC CHIA CỘT THÔNG MINH]
    #v(1.5em)
    #block(
      stroke: 6pt + rgb("#10b981"), 
      radius: 20pt, 
      clip: true,
      width: 85%
    )[
      #image("demo_quiz.png", width: 100%)
    ]
  ]
]

// PAGE 7: Line 7
#page[
  #align(center + horizon)[
    #text(size: 55pt, fill: rgb("#f43f5e"), weight: "bold")[HIỆU ỨNG LẬT MỞ ĐÁP ÁN TỨC THÌ]
    #v(1.5em)
    #block(
      stroke: 6pt + rgb("#f43f5e"), 
      radius: 20pt, 
      clip: true,
      width: 85%
    )[
      #image("demo_answer.png", width: 100%)
    ]
  ]
]

// PAGE 8: Line 8
#page[
  #align(center + horizon)[
    #text(size: 90pt, fill: rgb("#a855f7"), weight: "bold")[TRẢI NGHIỆM DÙNG THỬ] 
    #v(2em)
    #text(size: 60pt, fill: rgb("#f8fafc"))[Hoàn toàn không mất phí ban đầu!]
  ]
]

// PAGE 9: Line 9
#page[
  #align(center + horizon)[
    #text(size: 90pt, fill: rgb("#14b8a6"), weight: "bold")[ỦNG HỘ DỰ ÁN] 
    #v(2em)
    #text(size: 60pt, fill: rgb("#f8fafc"))[Nếu hệ thống giúp ích cho thầy cô...]
  ]
]

// PAGE 10: Line 10
#page[
  #align(center + horizon)[
    #text(size: 90pt, fill: rgb("#facc15"), weight: "bold")[GIÁ TRỊ VƯỢT TRỘI] 
    #v(1.5em)
    #text(size: 70pt, fill: rgb("#f8fafc"))[Chi phí chỉ bằng vài ly Cà phê / Năm]
    #v(2em)
    #block(
      fill: rgb("#e11d48"),
      inset: 60pt,
      radius: 50pt
    )[
      #text(size: 100pt, fill: white, weight: "bold")[trinhchieu.pages.dev]
    ]
  ]
]
