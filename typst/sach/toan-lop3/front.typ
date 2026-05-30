// front.typ — Front matter for Grade 3 Math Book I

#import "_theme.typ": *

// Cover page
#page(
  fill: C-BG,
)[
  #v(4cm)
  #block(
    fill: C-HEADING,
    inset: 20pt,
    radius: 12pt,
    width: 100%,
  )[
    #text(
      fill: white,
      weight: "bold",
      size: 28pt,
      align: center,
    )[Toán Lớp 3]
    #v(0.3em)
    #text(
      fill: white,
      size: 16pt,
      align: center,
    )[Grade 3 Mathematics]
  ]
  #v(1cm)
  #text(
    fill: C-TEXT,
    size: 14pt,
    align: center,
  )[Quyển I — Cơ Bản & Tư Duy]
  #v(0.5em)
  #text(
    fill: C-TEXT,
    size: 12pt,
    align: center,
  )[Book I — Core Curriculum & Thinking Skills]
  #v(2cm)
  #block(
    fill: white,
    inset: 10pt,
    radius: 8pt,
    stroke: 1pt + C-TEAL,
  )[
    #text(size: 10pt, align: center)[
      Dành cho học sinh lớp 3 / For Grade 3 Students
      #v(0.3em)
      Song ngữ Việt – Anh / Bilingual Vietnamese – English
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
  #chapter-header(0, "Mục lục / Table of Contents", C-HEADING)
  #v(1em)
  #table(
    columns: (1fr, 3fr, 1fr),
    inset: 6pt,
    stroke: 0pt,
    [Chương], [Nội dung], [Trang],
    [1], [Số đến 10,000 / Numbers to 10,000], [3],
    [2], [Cộng – Trừ / Addition – Subtraction], [15],
    [3], [Nhân – Chia / Multiplication – Division], [27],
    [4], [Hình Học / Geometry], [39],
    [5], [Phân Số / Fractions], [51],
    [ ], [Đáp án / Answer Key], [63],
  )
]

// Introduction page
#page[
  #chapter-header(0, "Lời nói đầu / Introduction", C-HEADING)
  #v(1em)
  #text(size: 11pt)[
    Chào các em học sinh lớp 3 thân mến!
    #v(0.5em)
    Cuốn sách này được biên soạn để giúp các em học Toán một cách vui vẻ và hiệu quả.
    Mỗi bài học đều có:
    - Mục tiêu rõ ràng
    - Nhắc lại kiến thức cần thiết
    - Ví dụ minh họa
    - Bài tập thực hành
    - Bài tập tư duy
    #v(0.5em)
    Chúc các em học tốt và yêu thích môn Toán!
    #v(1em)
    Hello dear Grade 3 students!
    #v(0.5em)
    This book is designed to help you learn Mathematics in a fun and effective way.
    Each lesson includes:
    - Clear learning objectives
    - Key knowledge reminders
    - Illustrated examples
    - Practice exercises
    - Thinking challenges
    #v(0.5em)
    We wish you great success and enjoyment in learning Math!
  ]
]
