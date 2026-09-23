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
    let sc = 0.005
    
    // Mặt biển
    line((-0.5, 0), (850 * sc, 0), stroke: 1pt + rgb("0284c7"))
    content((400 * sc, 0.3), text(fill: rgb("0284c7"), size: 8pt)[🌊 Mặt biển])
    
    let pStart = (0, 0)
    let pSub = (800 * 0.966 * sc, -800 * 0.259 * sc)
    
    stroke(1.8pt + rgb("0f766e"))
    line(pStart, pSub)
    content((pSub.at(0) + 0.35, pSub.at(1)), [🚢])
    
    // Đường gióng độ sâu
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 0.8pt))
    line(pSub, (pSub.at(0), 0))
    content((pSub.at(0) + 0.65, pSub.at(1)/2), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$h = ?$])
    
    content((400 * 0.966 * sc - 0.5, -400 * 0.259 * sc - 0.2), text(fill: rgb("0f766e"), size: 8pt)[$800" m"$])
    
    draw_angle_arc(pStart, -15deg, 0deg, radius: 1.0, stroke: 0.8pt + rgb("d97706"))
    content((1.3, -0.2), text(fill: rgb("d97706"), size: 7.5pt)[$15^circ$])
  })
