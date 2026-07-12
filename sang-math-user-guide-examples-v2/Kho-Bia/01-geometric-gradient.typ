#set page(paper: "a4", margin: 0pt, fill: white)
#set text(font: "New Computer Modern")

// ==========================================
// MẪU SỐ 1: GEOMETRIC GRADIENT
// ==========================================

// Bảng màu hiện đại (Gradient từ Tím đậm -> Đỏ -> Cam)
#let g-start = rgb("#1a2a6c")
#let g-mid = rgb("#b21f1f")
#let g-end = rgb("#fdbb2d")
#let bg-gradient = gradient.linear(g-start, g-mid, g-end, angle: 45deg)

#block(width: 100%, height: 100%, clip: true)[
  // Lớp nền Gradient
  #place(top + left)[
    #block(width: 100%, height: 100%, fill: bg-gradient)
  ]
  
  // Các lớp mảng khối hình học (Polygons & Circles)
  #place(top + right, dx: 100pt, dy: -50pt)[
    #circle(radius: 250pt, fill: white.transparentize(92%))
  ]
  
  #place(top + right, dx: -50pt, dy: -100pt)[
    #circle(radius: 150pt, fill: white.transparentize(85%))
  ]
  
  #place(bottom + left, dx: -100pt, dy: 150pt)[
    #circle(radius: 350pt, fill: black.transparentize(80%))
  ]
  
  #place(top + left, dx: -50pt, dy: 350pt)[
    #polygon(fill: white.transparentize(90%), (0pt, 0pt), (700pt, -250pt), (700pt, 300pt), (-100pt, 500pt))
  ]
  
  #place(bottom + right, dx: 100pt, dy: 100pt)[
    #polygon(fill: white.transparentize(88%), (0pt, 0pt), (300pt, -100pt), (400pt, 400pt), (0pt, 300pt))
  ]

  // Đường line mờ tạo cảm giác tech
  #place(top + left, dx: 50pt, dy: 0pt)[
    #line(length: 100%, angle: 90deg, stroke: 1pt + white.transparentize(85%))
  ]
  #place(top + left, dx: 60pt, dy: 0pt)[
    #line(length: 100%, angle: 90deg, stroke: 0.5pt + white.transparentize(90%))
  ]
  
  // ── Phần Typography chính ──
  #place(left + horizon, dx: 50pt, dy: -50pt)[
    #block(width: 450pt)[
      #text(fill: white.transparentize(30%), size: 16pt, weight: "bold", tracking: 4pt)[
        SANG-MATH PREMIUM COLLECTION
      ]
      #v(20pt)
      // Tựa đề lớn
      #text(fill: white, size: 55pt, weight: "bold")[
        TÀI LIỆU TOÁN \
        CHUYÊN SÂU
      ]
      #v(10pt)
      // Vạch ngang trang trí
      #block(width: 120pt, height: 6pt, fill: g-end)
      #v(20pt)
      // Mô tả phụ
      #text(fill: white.transparentize(15%), size: 18pt)[
        Tuyển tập các chuyên đề bồi dưỡng và luyện thi THPT Quốc gia theo cấu trúc mới nhất. Đặc biệt tích hợp các kỹ thuật trắc nghiệm nhanh gọn, súc tích.
      ]
    ]
  ]
  
  // ── Phần Footer (Tác giả, Năm học) ──
  #place(bottom + left, dx: 50pt, dy: -50pt)[
    #block(width: 450pt, stroke: (left: 4pt + g-end), inset: (left: 15pt))[
      #text(fill: white, size: 15pt, weight: "bold")[BIÊN SOẠN: GV NGUYỄN VĂN SANG]
      #linebreak()
      #v(6pt)
      #text(fill: white.transparentize(40%), size: 12pt, tracking: 1pt)[NĂM HỌC 2025 - 2026  |  DÀNH CHO LỚP 12]
    ]
  ]
]
