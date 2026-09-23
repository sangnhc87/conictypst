#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 0.8cm, {
    import draw: *
    // Sphere
    circle((0, 0), radius: 2, stroke: 1pt)
    draw-ellipse(0, 0, 2, 0.5, stroke: 0.5pt + gray, style: "dashed-back")
    
    // Cone inside (apex at top, base below center)
    // For apex at (0, 2), base at y = -0.5, radius = sqrt(4 - 0.25) = sqrt(3.75) ≈ 1.93
    draw-ellipse(0, -0.6, 1.9, 0.45, stroke: 1.2pt + blue, style: "dashed-back")
    line((-1.9, -0.6), (0, 2), (1.9, -0.6), stroke: 1.2pt + blue)
    
    // Centers and labels
    circle((0, 0), radius: 0.05, fill: black)
    content((0.2, 0.2), $O$)
    circle((0, -0.6), radius: 0.05, fill: blue)
    line((0, -0.6), (0, 2), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    line((0, -0.6), (1.9, -0.6), stroke: (dash: "dashed", paint: blue, thickness: 0.8pt))
    content((1, -0.9), text(blue)[$r$])
    
    line((0, 0), (2 * calc.cos(30deg), -2 * calc.sin(30deg)), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((1.2, -0.2), $R$)
  })
