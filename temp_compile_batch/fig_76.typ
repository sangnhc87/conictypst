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
    let sc = 0.015
    
    // Mặt đất
    line((-1, 0), (280 * sc, 0), stroke: 0.8pt + luma(100))
    
    let pA = (0, 0)
    let pB = (100 * sc, 0)
    let pH = ((100 + 137) * sc, 0)
    let pD = (pH.at(0), 137 * sc)
    
    // Núi đá vôi kèm emoji 🏔️
    fill(rgb("f8fafc"))
    stroke(1.2pt + luma(80))
    line(pH, pD)
    bezier(pD, (pH.at(0) + 40 * sc, 0), (pH.at(0) + 20 * sc, 100 * sc), (pH.at(0) + 35 * sc, 40 * sc))
    line((pH.at(0) + 40 * sc, 0), pH)
    content((pH.at(0) + 1.2, pD.at(1)/2), [🏔️])
    
    // Tia ngắm
    stroke(1.2pt + rgb("0284c7"))
    line(pA, pD)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pD)
    
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.3), text(weight: "bold")[$A$])
    content((0, 0.3), [👁️])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0), -0.3), text(weight: "bold")[$B$])
    content((pB.at(0), 0.3), [👁️])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((pD.at(0), pD.at(1) + 0.35), text(weight: "bold")[$D$ (Đỉnh)])
    
    content((50 * sc, -0.3), text(size: 8pt)[$100" m"$])
    
    draw_angle_arc(pA, 0deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("059669"))
    content((1.1, 0.25), text(fill: rgb("059669"), size: 7.5pt)[$30^circ$])
    
    draw_angle_arc(pB, 0deg, 45deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((pB.at(0) + 0.9, 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$45^circ$])
  })
