#import "_config.typ": *

#let cover-page() = {
  set page(
    header: none,
    footer: none,
    margin: 0cm,
  )
  
  // Background decoration with a premium linear gradient
  place(top + left, rect(
    width: 100%,
    height: 100%,
    fill: gradient.linear(rgb("#ffffff"), rgb("#f8fafc"), rgb("#f1f5f9"), angle: 45deg),
  ))
  
  // Left decorative bars (clean and modern)
  place(top + left, rect(
    width: 24pt,
    height: 100%,
    fill: c-book,
  ))
  place(top + left, rect(
    width: 6pt,
    height: 100%,
    fill: rgb("#10b981"), // bright emerald accent
    inset: (left: 24pt),
  ))
  
  // Clean, high-end 3D Coordinate illustration
  place(center + horizon, dx: 3.8cm, dy: -2.0cm, canvas(length: 1.8cm, {
    import draw: *
    
    // Sleek projection function
    let to-2d(x, y, z) = (x * -0.4 + y * 0.45, x * -0.15 + z * 0.55)
    
    let O = to-2d(0, 0, 0)
    let X_ax = to-2d(3.8, 0, 0)
    let Y_ax = to-2d(0, 3.8, 0)
    let Z_ax = to-2d(0, 0, 3.8)
    
    // Cube Vertices for a bounding 3D box (shows coordinate space elegantly)
    let A = to-2d(2.2, 0, 0)
    let B = to-2d(2.2, 2.2, 0)
    let C = to-2d(0, 2.2, 0)
    let Ap = to-2d(2.2, 0, 2.2)
    let Bp = to-2d(2.2, 2.2, 2.2)
    let Cp = to-2d(0, 2.2, 2.2)
    let Op = to-2d(0, 0, 2.2)
    
    // 1. Draw coordinate axes first in premium colors
    line(O, X_ax, stroke: (paint: rgb("#ef4444").lighten(10%), thickness: 1.2pt), mark: (end: "stealth", scale: 0.5)) // Ox (Coral Red)
    line(O, Y_ax, stroke: (paint: rgb("#10b981").lighten(10%), thickness: 1.2pt), mark: (end: "stealth", scale: 0.5)) // Oy (Emerald Green)
    line(O, Z_ax, stroke: (paint: rgb("#3b82f6").lighten(10%), thickness: 1.2pt), mark: (end: "stealth", scale: 0.5)) // Oz (Royal Blue)
    
    // 2. Draw the 3D bounding box with clean, low-contrast lines (dashed for hidden, solid for visible)
    // Hidden edges (connected to O)
    line(O, A, stroke: (paint: rgb("#94a3b8"), thickness: 0.6pt, dash: "dashed"))
    line(O, C, stroke: (paint: rgb("#94a3b8"), thickness: 0.6pt, dash: "dashed"))
    line(O, Op, stroke: (paint: rgb("#94a3b8"), thickness: 0.6pt, dash: "dashed"))
    
    // Back planes edges (dashed)
    line(A, B, stroke: (paint: rgb("#cbd5e1"), thickness: 0.5pt, dash: "dashed"))
    line(C, B, stroke: (paint: rgb("#cbd5e1"), thickness: 0.5pt, dash: "dashed"))
    
    // Front and outer edges (solid, clean)
    line(A, Ap, stroke: (paint: rgb("#64748b"), thickness: 0.6pt))
    line(C, Cp, stroke: (paint: rgb("#64748b"), thickness: 0.6pt))
    line(B, Bp, stroke: (paint: rgb("#64748b"), thickness: 0.6pt))
    line(Op, Ap, stroke: (paint: rgb("#64748b"), thickness: 0.6pt))
    line(Op, Cp, stroke: (paint: rgb("#64748b"), thickness: 0.6pt))
    line(Ap, Bp, stroke: (paint: rgb("#64748b"), thickness: 0.6pt))
    line(Cp, Bp, stroke: (paint: rgb("#64748b"), thickness: 0.6pt))
    
    // 3. Highlight a single main vector starting from O and going to the outer corner Bp
    line(O, Bp, stroke: (paint: rgb("#f59e0b"), thickness: 2.2pt), mark: (end: "stealth", scale: 0.7))
    
    // Labels for axes
    content(to-2d(4.0, 0, 0), $x$, fill: none)
    content(to-2d(0, 4.0, 0), $y$, fill: none)
    content(to-2d(0, 0, 4.0), $z$, fill: none)
    
    // Point label
    content(to-2d(2.4, 2.4, 2.5), $M(x; y; z)$, fill: none)
    
    // Accent dots
    circle(O, radius: 0.04, fill: rgb("#1e293b"))
    circle(Bp, radius: 0.04, fill: rgb("#f59e0b"))
  }))
  
  // Title content block
  place(top + left, dx: 6.5cm, dy: 4.8cm, block(width: 13.0cm)[
    #text(size: 13pt, weight: "bold", fill: rgb("#0d9488"), tracking: 0.08em)[BỘ TÀI LIỆU HÌNH HỌC 3D THỰC CHIẾN]
    #v(1.4em)
    
    #line(length: 4.5cm, stroke: 4.5pt + c-book)
    #v(1.8em)
    
    #text(size: 32pt, weight: "black", fill: c-book, tracking: 0.02em)[HÌNH HỌC VECTƠ\ & HỆ TỌA ĐỘ 3D]
    
    #v(1.2em)
    #text(size: 13pt, weight: "medium", fill: rgb("#475569"))[Khung lý thuyết, bài mẫu và đề luyện tập chuyên sâu]
    
    #v(1.5em)
    #text(size: 12pt, style: "italic", fill: rgb("#64748b"))[Chương II — Chương trình Hình học lớp 12 mới]
  ])
  
  // Author info at the bottom
  place(bottom + left, dx: 6.5cm, dy: -4.0cm, block(width: 13.0cm)[
    #grid(
      columns: (auto,),
      row-gutter: 8pt,
      text(size: 11pt, weight: "bold", fill: c-book, tracking: 0.04em)[TỔ TOÁN – TÀI LIỆU CHUYÊN SÂU],
      text(size: 14pt, weight: "medium", fill: rgb("#1e293b"))[Biên soạn: *GV. Nguyễn Văn Sang*],
      text(size: 11pt, fill: rgb("#64748b"))[Năm học: 2025 – 2026],
    )
  ])
  
  pagebreak()
}
