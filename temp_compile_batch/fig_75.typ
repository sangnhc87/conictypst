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
    
    let pA = (0, 0)
    let pB = (10 * sc, 0)
    let pH = (5 * sc, 0)
    let pC = (5 * sc, calc.sqrt(36 - 25) * sc)
    
    stroke(1.8pt + rgb("b45309"))
    line(pA, pC)
    line(pC, pB)
    stroke(1pt + luma(100))
    line(pA, pB)
    stroke((paint: rgb("2563eb"), dash: "dashed", thickness: 0.8pt))
    line(pC, pH)
    
    content((5 * sc, pC.at(1) + 0.45), [🏠])
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.3), text(weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((10 * sc, -0.3), text(weight: "bold")[$B$])
    circle(pH, radius: 1.5pt, fill: black)
    content((5 * sc, -0.3), text(weight: "bold")[$H$])
    
    content((2.5 * sc - 0.4, pC.at(1)/2 + 0.2), text(fill: rgb("b45309"), size: 8pt)[$6" m"$])
    content((2.5 * sc, -0.3), text(size: 8pt)[$5" m"$])
    
    draw_angle_arc(pA, 0deg, 34deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.1, 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$alpha$])
  })
