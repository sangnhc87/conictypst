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
    let sc = 0.25
    
    // Mặt đất
    line((-0.5, 0), (16 * sc, 0), stroke: 1pt + luma(100))
    line((0, 0), (3 * sc, 0), stroke: 2.5pt + rgb("1e293b"))
    
    let pRunway = (0, 0)
    let pPlane = (15 * sc, 1.2 * 2.5 * sc)
    
    stroke(1.5pt + rgb("0d9488"))
    line(pPlane, pRunway)
    
    // Đường gióng đứng độ cao
    stroke((paint: luma(120), dash: "dashed", thickness: 0.6pt))
    line(pPlane, (15 * sc, 0))
    content((15 * sc + 0.65, pPlane.at(1)/2), text(size: 7.5pt)[$1200" m"$])
    
    // Đường nằm ngang tầm bay
    line(pPlane, (pPlane.at(0) - 3 * sc, pPlane.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    
    content((0, -0.35), text(weight: "bold")[🛬 Đường băng])
    content((pPlane.at(0) + 0.5, pPlane.at(1) + 0.2), [✈️])
    
    content((7.5 * sc, -0.3), text(size: 8pt)[$15" km"$])
    draw_angle_arc(pPlane, 180deg, 184.57deg, radius: 1.0, stroke: 0.8pt + rgb("d97706"))
  })
