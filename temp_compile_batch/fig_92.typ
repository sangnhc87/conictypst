#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw

#let c-book = rgb("#0057b8")
#let c-main = rgb("#0057b8")
#let sm-blue = rgb("#0057b8")
#let sm-blue-light = rgb("#e0f2fe")
#let sm-green = rgb("#059669")
#let sm-green-light = rgb("#d1fae5")
#let sm-red = rgb("#e11d48")
#let sm-red-light = rgb("#ffe4e6")
#let sm-amber = rgb("#d97706")
#let sm-purple = rgb("#7c3aed")
#let sm-gray = rgb("#64748b")
#let draw-ellipse(x, y, rx, ry, stroke: 1pt, style: "solid") = {
  draw.circle((x, y), radius: (rx, ry), stroke: stroke)
}

#canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.5
    
    // Tường và sàn
    line((0, 0), (0, 3 * sc), stroke: 2pt + luma(80))
    line((0, 0), (9 * sc, 0), stroke: 1pt + luma(100))
    
    let pCam = (0, 3 * sc)
    let pA = (2 * sc, 0)
    let pB = (8 * sc, 0)
    
    stroke(1.2pt + rgb("0284c7"))
    line(pCam, pA)
    stroke(1.2pt + rgb("2563eb"))
    line(pCam, pB)
    
    content((0, 3 * sc + 0.35), [📹 Camera])
    content((2 * sc, -0.3), text(weight: "bold")[$A (2" m")$])
    content((8 * sc, -0.3), text(weight: "bold")[$B (8" m")$])
    
    draw_angle_arc(pCam, -69.4deg, -20.5deg, radius: 0.9, stroke: 0.8pt + rgb("d97706"))
    content((0.7, 3 * sc - 0.7), text(fill: rgb("d97706"), size: 8pt)[$beta$])
  })
