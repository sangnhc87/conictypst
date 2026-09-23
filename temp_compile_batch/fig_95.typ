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
    let sc = 0.05
    
    let pA = (0, 0)
    let pB = (50 * sc, 0)
    let pC = (50 * 0.5 * sc, 80 * 0.866 * 0.8 * sc)
    
    stroke(1.8pt + rgb("0d9488"))
    line(pA, pB)
    line(pB, pC)
    line(pC, pA)
    
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.35), text(weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((50 * sc, -0.35), text(weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((pC.at(0), pC.at(1) + 0.35), text(weight: "bold")[$C$])
    
    content((25 * sc, 15 * sc), [🚗])
    content((25 * sc, -0.35), text(size: 8pt)[$50" m"$])
    content((pC.at(0)/2 - 0.4, pC.at(1)/2 + 0.2), text(size: 8pt)[$80" m"$])
    content(((pB.at(0)+pC.at(0))/2 + 0.4, pC.at(1)/2), text(size: 8pt)[$70" m"$])
  })
