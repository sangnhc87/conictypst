// front-nc.typ — Front matter for Grade 3 Math Book II (Advanced)

#import "_theme-nc.typ": *

// Cover page
#page(
  fill: C-BG-NC,
)[
  #v(4cm)
  #block(
    fill: C-HEADING-NC,
    inset: 20pt,
    radius: 12pt,
    width: 100%,
  )[
    #text(
      fill: white,
      weight: "bold",
      size: 28pt,
      align: center,
    )[Toán Lớp 3 — Nâng Cao]
    #v(0.3em)
    #text(
      fill: white,
      size: 16pt,
      align: center,
    )[Grade 3 Mathematics — Advanced]
  ]
  #v(1cm)
  #text(
    fill: C-TEXT-NC,
    size: 14pt,
    align: center,
  )[Quyển II — Phát Triển Toàn Diện]
  #v(0.5em)
  #text(
    fill: C-TEXT-NC,
    size: 12pt,
    align: center,
  )[Book II — Comprehensive Enrichment]
  #v(2cm)
  #block(
    fill: white,
    inset: 10pt,
    radius: 8pt,
    stroke: 1pt + C-TEAL-NC,
  )[
    #text(size: 10pt, align: center)[
      Dành cho học sinh lớp 3 / For Grade 3 Students
      #v(0.3em)
      Song ngữ Việt – Anh / Bilingual Vietnamese – English
      #v(0.3em)
      Dành cho 20% học sinh xuất sắc / For Top 20% Students
    ]
  ]
  #v(3cm)
  #text(size: 9pt, fill: gray, align: center)[
    Biên soạn theo chương trình Giáo dục Phổ thông 2018
    #v(0.2em)
    Aligned with the 2018 National Curriculum
  ]
]

// Table of Contents
#page[
  #chapter-header-nc(0, "Mục lục / Table of Contents", C-HEADING-NC)
  #v(1em)
  #table(
    columns: (1fr, 3fr, 1fr),
    inset: 6pt,
    stroke: 0pt,
    [Chương], [Nội dung], [Trang],
    [1], [Lý thuyết số / Number Theory], [3],
    [2], [Tính nhẩm siêu tốc / Speed Arithmetic], [15],
    [3], [Chiến lược giải toán / Problem Strategies], [27],
    [4], [Hình học nâng cao / Advanced Geometry], [39],
    [5], [Phân số nâng cao / Advanced Fractions], [51],
    [6], [Thử thách Olympiad / Olympiad Challenges], [63],
    [ ], [Luyện tập mở rộng / Extended Practice], [75],
    [ ], [Khám phá toán học / Math Discovery], [85],
    [ ], [Đề tổng kết / Final Review], [95],
    [ ], [Đáp án / Answer Key], [105],
  )
]

// Introduction page
#page[
  #chapter-header-nc(0, "Lời nói đầu / Introduction", C-HEADING-NC)
  #v(1em)
  #text(size: 11pt)[
    Chào các em học sinh lớp 3 xuất sắc!
    #v(0.5em)
    Cuốn sách nâng cao này dành cho các em yêu thích thử thách và muốn phát triển tư duy toán học toàn diện.
    Mỗi bài học đều có:
    - Mục tiêu rõ ràng
    - Nhắc lại kiến thức nền tảng
    - Ví dụ minh họa nâng cao
    - Bài tập thực hành đa dạng
    - Bài tập Olympiad thử thách
    #v(0.5em)
    Chúc các em chinh phục những đỉnh cao toán học!
    #v(1em)
    Hello outstanding Grade 3 students!
    #v(0.5em)
    This advanced book is designed for those who love challenges and want to develop comprehensive mathematical thinking.
    Each lesson includes:
    - Clear learning objectives
    - Foundation knowledge reminders
    - Advanced illustrated examples
    - Diverse practice exercises
    - Olympiad-level challenges
    #v(0.5em)
    We wish you success in conquering mathematical heights!
  ]
]
