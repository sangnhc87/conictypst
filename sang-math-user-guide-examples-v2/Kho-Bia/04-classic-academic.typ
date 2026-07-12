#set page(paper: "a4", margin: 0pt, fill: rgb("#fcfbf9"))
#set text(font: "New Computer Modern")

// ==========================================
// MẪU SỐ 4: CLASSIC ACADEMIC (Hàn lâm Cổ điển)
// ==========================================

#let c-gold = rgb("#b8860b")
#let c-crimson = rgb("#8b0000")
#let c-ink = rgb("#2d2d2d")

#block(width: 100%, height: 100%, clip: true)[
  // ── Khung viền kép Cổ điển ──
  #place(top + left, dx: 30pt, dy: 30pt)[
    #block(width: 535pt, height: 782pt, stroke: 4pt + c-gold, radius: 0pt)
  ]
  #place(top + left, dx: 36pt, dy: 36pt)[
    #block(width: 523pt, height: 770pt, stroke: 1pt + c-gold, radius: 0pt)
  ]
  
  // ── Các góc viền cách điệu (Corner ornaments) ──
  // Góc trên trái
  #place(top + left, dx: 22pt, dy: 22pt)[
    #block(width: 16pt, height: 16pt, fill: c-crimson)
  ]
  // Góc trên phải
  #place(top + right, dx: -22pt, dy: 22pt)[
    #block(width: 16pt, height: 16pt, fill: c-crimson)
  ]
  // Góc dưới trái
  #place(bottom + left, dx: 22pt, dy: -22pt)[
    #block(width: 16pt, height: 16pt, fill: c-crimson)
  ]
  // Góc dưới phải
  #place(bottom + right, dx: -22pt, dy: -22pt)[
    #block(width: 16pt, height: 16pt, fill: c-crimson)
  ]

  // ── Nội dung Typography căn giữa ──
  #place(center + top, dy: 100pt)[
    #block(width: 400pt)[
        #align(center)[
        #text(fill: c-crimson, size: 14pt, weight: "bold", tracking: 5pt)[
          BỘ GIÁO DỤC VÀ ĐÀO TẠO
        ]
        #v(10pt)
        #line(length: 40%, stroke: 0.8pt + c-gold)
        
        #v(40pt)
        #text(fill: c-ink, size: 20pt, tracking: 2pt)[
          CHUYÊN KHẢO TOÁN HỌC
        ]
        #v(20pt)
        #text(fill: c-crimson, size: 55pt, weight: "bold")[
          GIẢI TÍCH
        ]
        #v(10pt)
        #text(fill: c-ink, size: 30pt, weight: "bold")[
          VÀ ỨNG DỤNG
        ]
        
        #v(40pt)
        // Emblem / Biểu tượng học thuật (Sao hoặc Diamond kép)
        #align(center)[
          #box(width: 50pt, height: 50pt)[
            #place(center + horizon)[
              #rotate(45deg)[
                #block(width: 30pt, height: 30pt, stroke: 2pt + c-gold)
              ]
            ]
            #place(center + horizon)[
              #rotate(45deg)[
                #block(width: 40pt, height: 40pt, stroke: 0.5pt + c-gold)
              ]
            ]
            #place(center + horizon)[
              #circle(radius: 5pt, fill: c-crimson)
            ]
          ]
        ]
        
        #v(40pt)
        #text(fill: c-ink, size: 16pt)[
          Cung cấp cơ sở lý luận và hệ thống bài tập thực hành dành cho học sinh giỏi cấp Quốc gia.
        ]
      ]
    ]
  ]
  
  // ── Tác giả & Nhà xuất bản (Footer) ──
  #place(center + bottom, dy: -100pt)[
    #align(center)[
      #text(fill: c-ink.lighten(30%), size: 14pt, weight: "bold")[
        Tác giả
      ]
      #v(8pt)
      #text(fill: c-ink, size: 22pt, weight: "bold")[
        NGUYỄN VĂN SANG
      ]
    ]
  ]
  
  #place(center + bottom, dy: -40pt)[
    #align(center)[
      #text(fill: c-gold.darken(20%), size: 14pt, tracking: 4pt)[
        CONICTYPST ACADEMIC PRESS
      ]
    ]
  ]
]
