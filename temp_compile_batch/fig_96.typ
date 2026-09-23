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
    let sc = 0.6
    
    let pB = (0, 0)
    let pC = (8 * sc, 0)
    let pH = (4 * sc, 0)
    let pA = (4 * sc, 3 * sc)
    let pM = (2 * sc, 1.5 * sc)
    let pN = (6 * sc, 1.5 * sc)
    
    stroke(2pt + rgb("1e293b"))
    line(pB, pA)
    line(pA, pC)
    line(pB, pC)
    
    // Thanh giằng MN
    stroke(1.8pt + rgb("dc2626"))
    line(pM, pN)
    content((4 * sc, 1.5 * sc + 0.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[Thanh giằng $M N$])
    
    // Bồn nước mặt trời emoji
    content((4 * sc, 3 * sc + 0.45), [☀️ 🛢️])
    
    circle(pB, radius: 2pt, fill: black)
    content((0, -0.3), text(weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((8 * sc, -0.3), text(weight: "bold")[$C$])
    circle(pA, radius: 2.5pt, fill: black)
    content((4 * sc + 0.35, 3 * sc), text(weight: "bold")[$A$])
    
    content((2 * sc - 0.4, 1.5 * sc + 0.2), text(size: 8pt)[$5" m"$])
    content((4 * sc, -0.3), text(size: 8pt)[$8" m"$])
  })
