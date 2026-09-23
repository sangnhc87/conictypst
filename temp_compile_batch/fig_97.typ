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
    let sc = 0.08
    
    line((-1, 0), (60 * sc, 0), stroke: 1pt + luma(100))
    
    let pPole = (0, 0)
    let pTop = (0, 30 * sc)
    let pShadow = (52 * sc, 0)
    
    stroke(2.5pt + rgb("1e293b"))
    line(pPole, pTop)
    content((0, pTop.at(1) + 0.35), text(weight: "bold")[Cột thu lôi])
    
    stroke(1.5pt + rgb("d97706"))
    line(pTop, pShadow)
    content((pShadow.at(0) + 0.5, pTop.at(1)), [☀️])
    
    stroke(2.5pt + rgb("475569"))
    line(pPole, pShadow)
    content((26 * sc, -0.35), text(size: 8pt)[Bóng $52" m"$])
    content((-0.6, 15 * sc), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$h = ?$])
    
    draw_angle_arc(pShadow, 150deg, 180deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((52 * sc - 1.1, 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$30^circ$])
  })
