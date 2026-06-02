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
    fill: gradient.linear(rgb("#ffffff"), rgb("#faf5ff"), rgb("#f5f3ff"), angle: 45deg),
  ))
  
  // Left decorative bars (purple theme)
  place(top + left, rect(
    width: 24pt,
    height: 100%,
    fill: c-book,
  ))
  place(top + left, rect(
    width: 6pt,
    height: 100%,
    fill: rgb("#a78bfa"), // bright violet accent
    inset: (left: 24pt),
  ))
  
  // Premium Statistical illustration (Histogram & Bell Curve)
  place(center + horizon, dx: 3.8cm, dy: -2.0cm, canvas(length: 0.9cm, {
    import draw: *
    
    // Draw grid lines
    for x in range(0, 7) {
      line((x, 0), (x, 5.5), stroke: 0.3pt + rgb("#e9d5ff"))
    }
    for y in range(1, 6) {
      line((0, y), (6.5, y), stroke: 0.3pt + rgb("#e9d5ff"))
    }
    
    // Axes
    line((0, 0), (7.0, 0), mark: (end: "stealth", scale: 0.5), stroke: 1.0pt + rgb("#475569"))
    line((0, 0), (0, 6.0), mark: (end: "stealth", scale: 0.5), stroke: 1.0pt + rgb("#475569"))
    
    content((6.8, -0.35), [Nhóm])
    content((-0.4, 5.8), [$f$])
    
    // Histogram bars (Grouped statistics)
    // [0, 1]: height 1.2
    rect((0, 0), (1, 1.2), fill: rgb("#ddd6fe").transparentize(30%), stroke: 0.8pt + rgb("#7c3aed"))
    // [1, 2]: height 2.6
    rect((1, 0), (2, 2.6), fill: rgb("#c4b5fd").transparentize(30%), stroke: 0.8pt + rgb("#7c3aed"))
    // [2, 3]: height 4.8
    rect((2, 0), (3, 4.8), fill: rgb("#a78bfa").transparentize(30%), stroke: 0.8pt + rgb("#7c3aed"))
    // [3, 4]: height 3.8
    rect((3, 0), (4, 3.8), fill: rgb("#c4b5fd").transparentize(30%), stroke: 0.8pt + rgb("#7c3aed"))
    // [4, 5]: height 2.0
    rect((4, 0), (5, 2.0), fill: rgb("#ddd6fe").transparentize(30%), stroke: 0.8pt + rgb("#7c3aed"))
    // [5, 6]: height 0.8
    rect((5, 0), (6, 0.8), fill: rgb("#ede9fe").transparentize(30%), stroke: 0.8pt + rgb("#7c3aed"))
    
    // Bell curve (Normal distribution approximation)
    // C * e^(-(x - 2.8)^2 / 2.5)
    let pts = ()
    let steps = 40
    let xmin = 0.2
    let xmax = 5.8
    for i in range(steps + 1) {
      let x = xmin + i * (xmax - xmin) / steps
      let diff = x - 2.8
      let y = 4.9 * calc.exp(- (diff * diff) / 2.6)
      pts.push((x, y))
    }
    line(..pts, stroke: 2pt + rgb("#db2777")) // Pink/crimson bell curve
    
    // Mean line (x = 2.8)
    line((2.8, 0), (2.8, 4.9), stroke: (paint: rgb("#b45309"), thickness: 1.0pt, dash: "dashed"))
    circle((2.8, 4.9), radius: 0.05, fill: rgb("#b45309"))
    content((2.8, -0.45), [$bar(x)$])
    
    // Standard deviation indicators
    line((1.6, 2.3), (4.0, 2.3), stroke: 0.8pt + rgb("#475569"), mark: (start: "stealth", end: "stealth", scale: 0.4))
    content((2.8, 2.6), [$s$])
  }))
  
  // Title content block
  place(top + left, dx: 6.5cm, dy: 4.8cm, block(width: 13.0cm)[
    #text(size: 13pt, weight: "bold", fill: rgb("#7c3aed"), tracking: 0.08em)[BỘ TÀI LIỆU THỐNG KÊ THỰC CHIẾN]
    #v(1.4em)
    
    #line(length: 4.5cm, stroke: 4.5pt + c-book)
    #v(1.8em)
    
    #text(size: 32pt, weight: "black", fill: c-book, tracking: 0.02em)[THỐNG KÊ\ GHÉP NHÓM]
    
    #v(1.2em)
    #text(size: 13pt, weight: "medium", fill: rgb("#475569"))[Đo độ phân tán của mẫu số liệu ghép nhóm và các ứng dụng thực tế]
    
    #v(1.5em)
    #text(size: 12pt, style: "italic", fill: rgb("#64748b"))[Chương III — Chương trình Toán lớp 12 mới]
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
