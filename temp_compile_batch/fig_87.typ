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
    let sc = 0.2
    
    // Mặt đất
    line((-0.5, 0), (22 * sc, 0), stroke: 1pt + luma(100))
    
    let pA = (0, 0)
    let pB = (20 * sc, 0)
    let pH = (15 * sc, 0)
    let pM = (15 * sc, 8.66 * sc)
    
    stroke(1.2pt + rgb("0284c7"))
    line(pA, pM)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pM)
    
    // Đường cao h
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pM, pH)
    content((15 * sc + 0.6, pM.at(1)/2), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$h = ?$])
    
    content((-0.4, 0), [📡 $A$])
    content((20 * sc + 0.4, 0), [📡 $B$])
    content((pM.at(0), pM.at(1) + 0.45), [✈️ $M$])
    
    content((10 * sc, -0.3), text(size: 8pt)[$20" km"$])
    
    draw_angle_arc(pA, 0deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("059669"))
    content((1.1, 0.25), text(fill: rgb("059669"), size: 7.5pt)[$30^circ$])
    
    draw_angle_arc(pB, 120deg, 180deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((20 * sc - 0.9, 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
