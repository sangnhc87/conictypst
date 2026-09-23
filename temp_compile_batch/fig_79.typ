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
    let sc = 0.35
    
    let pO = (0, 0)
    let pA = (6 * sc, 0)
    let pB = (0, 8 * sc)
    
    stroke(1.2pt + rgb("0284c7"))
    line(pO, pA)
    line(pO, pB)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pB)
    
    content((-0.45, -0.3), [🗼 $O$])
    content((pA.at(0) + 0.45, 0), [⛵ $A$])
    content((0, pB.at(1) + 0.35), [⛵ $B$])
    
    content((3 * sc, -0.3), text(size: 8pt)[$6" km"$])
    content((-0.6, 4 * sc), text(size: 8pt)[$8" km"$])
    content((3 * sc + 0.4, 4 * sc + 0.2), text(fill: rgb("dc2626"), size: 8pt)[$10" km"$])
    
    // Góc vuông tại O
    rect((0, 0), (0.3, 0.3), stroke: 0.8pt + rgb("d97706"))
  })
