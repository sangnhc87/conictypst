#set page(paper: "a4", margin: 0pt, fill: white)
#set text(font: "New Computer Modern")

// ==========================================
// MẪU SỐ 2: ABSTRACT WAVES (Sóng trừu tượng)
// ==========================================

// Bảng màu Thanh lịch (Pastel)
#let c-bg = rgb("#fafafa")
#let wave1 = rgb("#e0c3fc")
#let wave2 = rgb("#8ec5fc")
#let wave3 = rgb("#a18cd1")
#let wave4 = rgb("#fbc2eb")

#let text-ink = rgb("#1e293b")
#let text-accent = rgb("#6366f1")

#block(width: 100%, height: 100%, clip: true, fill: c-bg)[
  
  // ── Sóng phía trên (Tạo từ các Elip chồng chéo) ──
  #place(top + left, dx: -150pt, dy: -200pt)[
    #ellipse(width: 800pt, height: 500pt, fill: gradient.linear(wave1.transparentize(30%), wave2.transparentize(30%), angle: 15deg))
  ]
  #place(top + left, dx: -50pt, dy: -250pt)[
    #ellipse(width: 700pt, height: 450pt, fill: gradient.linear(wave2.transparentize(50%), wave3.transparentize(50%), angle: -15deg))
  ]
  
  // ── Sóng phía dưới ──
  #place(bottom + right, dx: 150pt, dy: 200pt)[
    #ellipse(width: 800pt, height: 600pt, fill: gradient.linear(wave3.transparentize(20%), wave4.transparentize(20%), angle: 45deg))
  ]
  #place(bottom + right, dx: 50pt, dy: 150pt)[
    #ellipse(width: 700pt, height: 500pt, fill: gradient.linear(wave4.transparentize(50%), wave2.transparentize(50%), angle: 0deg))
  ]
  #place(bottom + right, dx: 250pt, dy: 300pt)[
    #ellipse(width: 600pt, height: 600pt, fill: gradient.linear(wave1, wave4, angle: 90deg))
  ]
  
  // ── Box Glassmorphism ở giữa ──
  #place(center + horizon)[
    #block(width: 80%, fill: white.transparentize(15%), stroke: 1.5pt + white.transparentize(20%), inset: 40pt, radius: 24pt)[
      #align(center)[
        #text(fill: text-accent, size: 14pt, weight: "bold", tracking: 3pt)[
          BỘ SÁCH GIÁO KHOA MỚI
        ]
        #v(20pt)
        #text(fill: text-ink, size: 45pt, weight: "bold")[
          CHUYÊN ĐỀ TOÁN 12
        ]
        #v(10pt)
        #text(fill: text-ink.lighten(30%), size: 24pt)[
          TẬP 1: GIẢI TÍCH & HÌNH HỌC
        ]
        
        #v(30pt)
        #line(length: 40%, stroke: 1pt + text-accent.lighten(50%))
        #v(30pt)
        
        #grid(columns: (1fr, 1fr), gutter: 20pt,
          [
            #text(fill: text-ink.lighten(40%), size: 11pt, weight: "bold")[BIÊN SOẠN BỞI] \
            #v(5pt)
            #text(fill: text-ink, size: 15pt, weight: "bold")[GV NGUYỄN VĂN SANG]
          ],
          [
            #text(fill: text-ink.lighten(40%), size: 11pt, weight: "bold")[NĂM XUẤT BẢN] \
            #v(5pt)
            #text(fill: text-ink, size: 15pt, weight: "bold")[2025 - 2026]
          ]
        )
      ]
    ]
  ]
  
  // ── Logo / Header ──
  #place(top + right, dx: -40pt, dy: 40pt)[
    #text(fill: text-ink.lighten(20%), size: 12pt, weight: "bold", tracking: 1pt)[
      CONICTYPST PUBLISHING
    ]
  ]
]
