#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let circ = sym.degree
#let c-book = rgb("#0057b8")
#let accent = rgb("#0057b8")
#let pm = sym.plus.minus

#canvas(length: 1cm, {
    import draw: *
    // Draw two parallel charged plates
    line((-2.0, 1.2), (2.0, 1.2), stroke: 1.5pt + rgb("#d32f2f")) // top plate (+)
    line((-2.0, -1.2), (2.0, -1.2), stroke: 1.5pt + rgb("#2E7D32")) // bottom plate (-)
    
    // Plus and minus signs on plates
    for x in range(-7, 8) {
      let px = x * 0.25
      content((px, 1.4), text(size: 8pt, fill: rgb("#d32f2f"))[$+$])
      content((px, -1.4), text(size: 8pt, fill: rgb("#2E7D32"))[$-$])
    }
    
    // Electric field lines (downward arrows)
    for x in range(-3, 4) {
      let px = x * 0.5
      line((px, 1.1), (px, -1.1), stroke: 0.5pt + gray, mark: (end: "stealth", fill: gray))
    }
    content((2.3, 0), text(fill: gray)[$arrow(E)$])
    
    // Charged particle in field
    circle((0.2, 0.2), radius: 0.15, fill: rgb("#2E7D32").lighten(50%), stroke: 1pt + rgb("#2E7D32"))
    content((0.2, 0.2), text(size: 7pt, fill: rgb("#2E7D32"))[$+$])
    content((0.6, 0.2), $M$)
    
    // Force arrow
    line((0.2, 0.05), (0.2, -0.9), stroke: 1.5pt + blue, mark: (end: "stealth", fill: blue))
    content((0.4, -0.6), text(fill: blue)[$arrow(F)$])
  })