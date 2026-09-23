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
    let sc = 0.02
    
    let pC = (0, 0)
    let pA = (80 * 0.5 * sc, 80 * 0.866 * sc)
    let pB = (120 * sc, 0)
    
    // Tia ngắm CA và CB
    stroke(1.2pt + rgb("0284c7"))
    line(pC, pA)
    line(pC, pB)
    
    // Nhịp cầu AB
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 2.2pt))
    line(pA, pB)
    content(((pA.at(0)+pB.at(0))/2, (pA.at(1)+pB.at(1))/2 + 0.4), [🌉])
    
    // Điểm
    circle(pC, radius: 2.5pt, fill: black)
    content((-0.4, 0), text(weight: "bold")[$C$])
    circle(pA, radius: 2.5pt, fill: rgb("dc2626"))
    content((pA.at(0), pA.at(1) + 0.35), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: rgb("dc2626"))
    content((pB.at(0) + 0.35, 0), text(weight: "bold")[$B$])
    
    content((pA.at(0)/2 - 0.45, pA.at(1)/2 + 0.2), text(fill: rgb("0284c7"), size: 8pt)[$80" m"$])
    content((60 * sc, -0.35), text(fill: rgb("0284c7"), size: 8pt)[$120" m"$])
    content(((pA.at(0)+pB.at(0))/2 + 0.6, pA.at(1)/2 - 0.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$A B = ?$])
    
    // Góc 60 độ tại C
    draw_angle_arc(pC, 0deg, 60deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((0.8, 0.4), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
  })
