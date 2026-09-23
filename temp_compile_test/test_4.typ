#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  // fallback if any
}

#canvas(length: 0.8cm, {
    import draw: *
    // Sector
    // Sector
    line((0, 0), (2.5 * calc.cos(15deg), 2.5 * calc.sin(15deg)), stroke: 1.2pt)
    line((0, 0), (2.5 * calc.cos(105deg), 2.5 * calc.sin(105deg)), stroke: 1.2pt)
    arc((2.5 * calc.cos(15deg), 2.5 * calc.sin(15deg)), start: 15deg, stop: 105deg, radius: 2.5, stroke: 1.2pt)
    content((1, 1), $R=6$)
    
    // Arrow
    content((3.5, 1), $=>$ )
    
    // Cone
    let cx = 6
    let cy = 1
    draw-ellipse(cx, cy - 1.5, 1.2, 0.35, stroke: 1.2pt, style: "dashed-back")
    line((cx - 1.2, cy - 1.5), (cx, cy + 1.5), (cx + 1.2, cy - 1.5), stroke: 1.2pt)
    
    circle((cx, cy - 1.5), radius: 0.05, fill: black)
    line((cx, cy - 1.5), (cx, cy + 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    line((cx, cy - 1.5), (cx + 1.2, cy - 1.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    content((cx + 0.6, cy - 1.8), $r$)
    content((cx - 0.3, cy), $h$)
    content((cx + 0.9, cy), $l=R$)
  })
