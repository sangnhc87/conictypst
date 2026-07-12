#set page(paper: "a4", margin: 0pt, fill: rgb("#0b0f19"))
#set text(font: "New Computer Modern")

// ==========================================
// MẪU SỐ 3: DARK CYBER (Không gian mạng)
// ==========================================

#let c-bg = rgb("#0b0f19")
#let c-cyan = rgb("#00f0ff")
#let c-magenta = rgb("#ff003c")
#let c-grid = rgb("#1e293b")

#block(width: 100%, height: 100%, clip: true)[
  // ── Lưới Không gian mạng (Cyber Grid) ──
  #place(top + left)[
    #for x in range(0, 800, step: 40) {
      place(top + left, dx: x * 1pt, dy: 0pt)[
        #line(length: 1200pt, angle: 90deg, stroke: 0.5pt + c-grid)
      ]
    }
    #for y in range(0, 1200, step: 40) {
      place(top + left, dx: 0pt, dy: y * 1pt)[
        #line(length: 800pt, stroke: 0.5pt + c-grid)
      ]
    }
  ]
  
  // ── Hiệu ứng ánh sáng (Glow effects) ──
  #place(top + right, dx: 200pt, dy: -100pt)[
    #circle(radius: 300pt, fill: c-cyan.transparentize(85%))
  ]
  #place(bottom + left, dx: -150pt, dy: 150pt)[
    #circle(radius: 400pt, fill: c-magenta.transparentize(90%))
  ]
  
  // ── Mảng cắt chéo (Cyber slashes) ──
  #place(top + left, dx: 100pt, dy: 200pt)[
    #polygon(fill: c-magenta, (0pt, 0pt), (20pt, 0pt), (150pt, 300pt), (130pt, 300pt))
  ]
  #place(top + left, dx: 140pt, dy: 200pt)[
    #polygon(fill: c-cyan, (0pt, 0pt), (5pt, 0pt), (135pt, 300pt), (130pt, 300pt))
  ]

  // ── Typography ──
  #place(left + horizon, dx: 60pt, dy: -80pt)[
    #block(width: 480pt)[
      // Glitch effect (Fake)
      #text(fill: c-cyan.transparentize(50%), size: 16pt, weight: "bold", tracking: 6pt)[
        [ SANG-MATH VDC SERIES ]
      ]
      #v(15pt)
      
      #text(fill: white, size: 60pt, weight: "bold")[
        TƯ DUY ĐỘT PHÁ
      ]
      #v(5pt)
      #text(fill: c-cyan, size: 35pt, weight: "bold")[
        PHÂN LOẠI & VẬN DỤNG CAO
      ]
      
      #v(20pt)
      // Dải phân cách tech
      #grid(columns: (40pt, 1fr), gutter: 10pt, align: (left + horizon, left + horizon),
        block(height: 4pt, fill: c-magenta),
        line(length: 100%, stroke: 1pt + c-grid.lighten(30%))
      )
      #v(20pt)
      
      #text(fill: white.transparentize(30%), size: 16pt)[
        Tuyển tập các phương pháp giải siêu tốc bằng kỹ thuật số hóa, đồ thị và không gian mạng. Tài liệu luyện thi phiên bản ĐẶC BIỆT.
      ]
    ]
  ]
  
  // ── Footer ──
  #place(bottom + left, dx: 60pt, dy: -60pt)[
    #grid(columns: (auto, auto), gutter: 40pt,
      [
        #text(fill: c-cyan, size: 12pt, weight: "bold")[TÁC GIẢ] \
        #v(5pt)
        #text(fill: white, size: 18pt, weight: "bold")[GV NGUYỄN VĂN SANG]
      ],
      [
        #text(fill: c-magenta, size: 12pt, weight: "bold")[MÃ TÀI LIỆU] \
        #v(5pt)
        #text(fill: white, size: 18pt, weight: "bold")[SM-CYBER-001]
      ]
    )
  ]
]
