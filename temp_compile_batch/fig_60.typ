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
    
    // Mặt hồ nước vẽ cách điệu
    fill(rgb("eff6ff"))
    stroke(none)
    bezier((0, 0), (2.5, 1.8), (1.2, 0.4), (2.0, 1.0))
    bezier((2.5, 1.8), (4.2, 0.2), (3.0, 1.5), (3.8, 0.8))
    bezier((4.2, 0.2), (0, 0), (3.0, -0.6), (1.0, -0.4))
    
    // Ba điểm C, A, B
    let pC = (0.5, 0.2)
    let pA = (3.2, 2.3)
    let pB = (4.0, -0.2)
    
    // Các đoạn thẳng
    stroke(1pt + rgb("0284c7"))
    line(pC, pA)
    line(pC, pB)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pB)
    
    // Điểm và nhãn
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) - 0.35, pC.at(1)), text(weight: "bold")[$C$])
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) + 0.35, pA.at(1) + 0.1), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.35, pB.at(1) - 0.1), text(weight: "bold")[$B$])
    
    // Nhãn kích thước
    content((1.6, 1.5), text(fill: rgb("0284c7"), size: 8.5pt)[$150" m"$])
    content((2.4, -0.25), text(fill: rgb("0284c7"), size: 8.5pt)[$200" m"$])
    // Hồ nước emoji
    content((2.5, 0.8), [🌊])
    
    // Cung góc C chuẩn xác
    draw_angle_arc(pC, -5deg, 55deg, radius: 0.6, stroke: 0.8pt + rgb("d97706"))
    content((pC.at(0) + 0.85, pC.at(1) + 0.25), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
  })
