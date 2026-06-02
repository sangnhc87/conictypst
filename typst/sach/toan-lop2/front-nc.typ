// ══════════════════════════════════════════════════════════════════════════
// front-nc.typ — Trang bìa & mở đầu Quyển II (Advanced)
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ══════════════════════════════════════════════════════════════════════════
// TRANG BÌA / COVER PAGE
// ══════════════════════════════════════════════════════════════════════════
#page(
  margin: 0pt,
  fill: gradient.linear(
    rgb("#0F0C29"),
    rgb("#302B63"),
    rgb("#24243E"),
    angle: 150deg,
  ),
)[
  #set text(fill: white)
  #block(
    width: 100%,
    height: 100%,
    inset: (x: 3cm, top: 3.5cm, bottom: 2.5cm),
  )[
    // Badge series
    #block(
      fill: rgb("#FCD34D"),
      inset: (x: 14pt, y: 7pt),
      radius: 20pt,
    )[
      #text(fill: rgb("#1E1B4B"), weight: "black", size: 10pt, tracking: 2pt)[TOÁN VIỆT–ANH • SINGAPORE METHOD]
    ]
    #v(1.2em)
    // Main title
    #text(size: 15pt, fill: rgb("#C7D2FE"), tracking: 6pt)[TOÁN TIỂU HỌC LỚP 2]
    #v(0.4em)
    #text(size: 42pt, weight: "black", fill: white)[TOÁN]
    #text(size: 42pt, weight: "black", fill: rgb("#FCD34D"))[ NÂNG CAO]
    #v(0.2em)
    #text(size: 20pt, style: "italic", fill: rgb("#A5B4FC"))[Advanced Mathematics — Grade 2]
    #v(1.5em)
    // Volume badge
    #block(
      fill: gradient.linear(rgb("#7C3AED"), rgb("#4F46E5"), angle: 45deg),
      inset: (x: 20pt, y: 10pt),
      radius: 10pt,
    )[
      #text(weight: "black", size: 13pt)[✦ Quyển II — Volume II ✦]
    ]
    #v(1.2em)
    // Decorative divider
    #line(length: 80%, stroke: (paint: rgb("#6366F1"), thickness: 1.5pt))
    #v(1.2em)
    // Chapter preview icons
    #grid(
      columns: (5 * (1fr,)),
      gutter: 12pt,
      ..for (icon, name) in (
        ("🧠", "Tư Duy"),
        ("⚡", "Tính Nhẩm"),
        ("🎯", "Chiến Lược"),
        ("📐", "Hình Học"),
        ("🏆", "Olympiad"),
      ) {
        (
          block(
            fill: white.transparentize(85%),
            inset: (x: 8pt, y: 8pt),
            radius: 8pt,
            width: 100%,
          )[
            #align(center)[
              #text(size: 20pt)[#icon]
              #v(0.2em)
              #text(fill: rgb("#C7D2FE"), size: 8pt, weight: "bold")[#name]
            ]
          ],
        )
      },
    )
    #v(1.8em)
    // Description
    #block(
      fill: white.transparentize(90%),
      inset: (x: 16pt, y: 12pt),
      radius: 8pt,
    )[
      #text(fill: rgb("#E0E7FF"), size: 10pt)[
        Dành cho *học sinh xuất sắc* — năng khiếu toán lớp 2 \
        *For gifted & talented Grade 2 learners*
      ]
    ]
    #v(2em)
    // Fill-in fields
    #line(length: 70%, stroke: (paint: white.transparentize(60%), dash: "dashed"))
    #v(0.3em)
    #text(
      fill: white.transparentize(40%),
      size: 10pt,
    )[Học sinh: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_  •  Lớp: \_\_\_\_ ]
  ]
]

// ══════════════════════════════════════════════════════════════════════════
// LỜI MỞ ĐẦU / PREFACE (page 2)
// ══════════════════════════════════════════════════════════════════════════
#pagebreak()
#v(1em)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 20pt, y: 16pt),
  radius: 12pt,
)[
  #set text(fill: white)
  #align(center)[
    #text(size: 18pt, weight: "black")[📖 Lời Mở Đầu]
    #h(2em)
    #text(size: 16pt, weight: "black", fill: rgb("#FCD34D"))[Preface]
  ]
]

#v(1em)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  // Tiếng Việt
  block(
    fill: rgb("#F0F4FF"),
    stroke: (left: 4pt + C-CH-NC.at(0)),
    inset: (left: 14pt, right: 12pt, y: 14pt),
    radius: (right: 8pt),
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(0), weight: "bold", size: 11pt)[🇻🇳 Tiếng Việt]
    #v(0.8em)
    #set text(size: 10pt)
    Quyển sách này được thiết kế dành riêng cho các bạn học sinh lớp 2 *yêu thích toán* và muốn phát triển tư duy vượt bậc.

    #v(0.5em)
    Không chỉ học các phép tính đơn giản — ở đây em sẽ:
    #v(0.3em)
    #for item in (
      "🧠 Rèn luyện tư duy logic",
      "⚡ Học tính nhẩm siêu nhanh",
      "🎯 Giải toán bằng chiến lược",
      "📐 Khám phá hình học sáng tạo",
      "🏆 Thử sức với bài Olympiad",
    ) {
      [• #item \ ]
    }
    #v(0.5em)
    Mỗi bài có *4 cấp độ*: từ ôn luyện cơ bản đến thử thách Olympic. Em hãy cố gắng hết sức nhé!
  ],
  // English
  block(
    fill: rgb("#F0F4FF"),
    stroke: (left: 4pt + C-CH-NC.at(1)),
    inset: (left: 14pt, right: 12pt, y: 14pt),
    radius: (right: 8pt),
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-CH-NC.at(1), weight: "bold", size: 11pt)[🇬🇧 English]
    #v(0.8em)
    #set text(size: 10pt)
    This workbook is specially designed for Grade 2 students who *love mathematics* and want to develop exceptional thinking skills.

    #v(0.5em)
    Go beyond basic calculations — here you will:
    #v(0.3em)
    #for item in (
      "🧠 Build logical thinking",
      "⚡ Master mental math speed",
      "🎯 Solve using strategies",
      "📐 Explore creative geometry",
      "🏆 Try Olympiad challenges",
    ) {
      [• #item \ ]
    }
    #v(0.5em)
    Each lesson has *4 levels*: review, application, challenge, and Olympiad prep. Give it your very best!
  ],
)

#v(1.5em)

// How to use this book
#block(
  width: 100%,
  fill: rgb("#FFFBEB"),
  stroke: 1.5pt + C-GOLD,
  inset: (x: 16pt, y: 14pt),
  radius: 10pt,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GOLD, weight: "bold", size: 11pt)[⭐ Cách dùng sách / How to Use This Book]
  #v(0.8em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 16pt,
    [
      #set text(size: 10pt)
      *Cấp độ bài tập / Difficulty Levels:*
      #v(0.3em)
      ⭐ #h(6pt) Ôn tập / Review \
      ⭐⭐ #h(6pt) Vận dụng / Apply \
      ⭐⭐⭐ #h(6pt) Thử thách / Challenge \
      ⭐⭐⭐⭐ #h(6pt) Olympic / Olympiad
    ],
    [
      #set text(size: 10pt)
      *Các ký hiệu / Symbols:*
      #v(0.3em)
      💡 Gợi ý chiến lược / Strategy hint \
      🔭 Khám phá thêm / Explore more \
      🎯 Bước suy luận / Reasoning steps \
      🏆 Bài Olympic / Competition problem
    ],
  )
]

// ══════════════════════════════════════════════════════════════════════════
// MỤC LỤC / TABLE OF CONTENTS (pages 3–4)
// ══════════════════════════════════════════════════════════════════════════
#pagebreak()
#v(0.5em)

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
  inset: (x: 20pt, y: 14pt),
  radius: 12pt,
)[
  #align(center)[
    #text(fill: white, size: 18pt, weight: "black")[📋 Mục Lục — Contents]
  ]
]

#v(1em)

#let toc-chapter(so, icon, ten-vi, ten-en, bais, c) = {
  v(0.6em)
  block(
    width: 100%,
    fill: c.lighten(92%),
    stroke: (left: 5pt + c),
    inset: (left: 14pt, right: 12pt, y: 12pt),
    radius: (right: 8pt),
  )[
    #set par(first-line-indent: 0em)
    #grid(
      columns: (auto, 1fr),
      gutter: 12pt,
      align(horizon)[
        #block(
          fill: c,
          inset: (x: 10pt, y: 6pt),
          radius: 6pt,
        )[
          #text(fill: white, weight: "black", size: 11pt)[CH.#str(so) #icon]
        ]
      ],
      align(horizon)[
        #text(fill: c, weight: "black", size: 12pt)[#ten-vi]
        #v(0.1em)
        #text(fill: c.darken(10%), size: 10pt, style: "italic")[#ten-en]
      ],
    )
    #v(0.5em)
    #for (num, name) in bais {
      grid(
        columns: (auto, 1fr, auto),
        gutter: 4pt,
        text(fill: C-MID, size: 9.5pt)[Bài #num],
        box(width: 1fr, height: 0.8em, align(bottom)[
          #line(length: 100%, stroke: (paint: C-LIGHT, dash: "dotted", thickness: 0.7pt))
        ]),
        text(fill: C-MID, size: 9.5pt)[#name],
      )
      v(0.1em)
    }
  ]
}

#toc-chapter(
  1,
  "🧠",
  "Tư Duy Số Học",
  "Number Logic & Patterns",
  (
    ("1", "Dãy số và quy luật — Sequences & Patterns"),
    ("2", "Ô vuông ma thuật — Magic Squares"),
    ("3", "Số bí ẩn — Mystery Numbers"),
    ("4", "Tổng chữ số — Digit Sums"),
    ("5", "So sánh nâng cao — Advanced Comparisons"),
  ),
  C-CH-NC.at(0),
)

#toc-chapter(
  2,
  "⚡",
  "Tính Nhẩm Thần Tốc",
  "Lightning Mental Math",
  (
    ("6", "Cộng nhẩm tới 100 — Mental Addition to 100"),
    ("7", "Trừ nhẩm thần tốc — Mental Subtraction Tricks"),
    ("8", "Nhân siêu nhanh — Multiplication Speed"),
    ("9", "Chia có dư — Division with Remainder"),
    ("10", "Biểu thức số — Number Expressions"),
  ),
  C-CH-NC.at(1),
)

#toc-chapter(
  3,
  "🎯",
  "Chiến Lược Giải Toán",
  "Problem-Solving Strategies",
  (
    ("11", "Vẽ hình để giải — Draw-a-Picture Strategy"),
    ("12", "Lập bảng — Make-a-Table Strategy"),
    ("13", "Làm ngược — Work-Backwards Strategy"),
    ("14", "Thử và điều chỉnh — Guess and Check"),
    ("15", "Tìm quy luật — Find-a-Pattern Strategy"),
  ),
  C-CH-NC.at(2),
)

#toc-chapter(
  4,
  "📐",
  "Hình Học Nâng Cao",
  "Advanced Geometry",
  (
    ("16", "Đếm hình phức hợp — Count Shapes in Figures"),
    ("17", "Đối xứng — Lines of Symmetry"),
    ("18", "Diện tích ô vuông — Area by Counting"),
    ("19", "Cắt ghép hình — Dissect & Rearrange"),
  ),
  C-CH-NC.at(3),
)

#toc-chapter(
  5,
  "🏆",
  "Thử Thách Tư Duy",
  "Thinking Challenges",
  (
    ("20", "Toán mật mã — Cryptarithmetic"),
    ("21", "Lưới logic — Logic Grids"),
    ("22", "Đếm tổ hợp — Counting & Combinations"),
    ("23", "Toán Olympiad — Olympiad Problems"),
  ),
  C-CH-NC.at(4),
)
