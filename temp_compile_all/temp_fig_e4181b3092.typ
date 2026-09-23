#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let circ = sym.degree
#let c-book = rgb("#0057b8")
#let accent = rgb("#0057b8")
#let pm = sym.plus.minus

#canvas(length: 1cm, {
    import draw: *
    // Axes
    line((-2.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.5pt)
    content((5.5, 0), $x$, anchor: "north", padding: 2pt)
    line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt)
    content((0, 3.5), $y$, anchor: "west", padding: 2pt)
    content((0.25, -0.35), $O$)
    
    // Labels
    content((-1, 0.4), $-1$)
    content((1, -0.35), $1$)
    content((4, -0.35), $4$)
    content((3.5, 1.8), $y = f'(x)$)
    
    // Curve
    bezier((-1.8, -1.8), (1, 0), (-1.2, 2.5), (0.2, 2.5), stroke: 1.2pt + blue)
    bezier((1, 0), (4.8, 2.2), (2, -3.2), (3.8, -3.2), stroke: 1.2pt + blue)
  })