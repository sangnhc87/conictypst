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
    
    // Đường bờ biển
    line((0, -20 * sc), (0, 60 * sc), stroke: 1.5pt + rgb("0d9488"))
    content((-0.6, 20 * sc), text(fill: rgb("0d9488"), weight: "bold")[Bờ biển])
    
    let pO = (0, 0)
    let pA = (30 * 0.5 * sc, 30 * 0.866 * sc)
    let pB = (50 * 0.866 * sc, -50 * 0.5 * sc)
    
    // Tia ngắm OA và OB
    stroke(1.2pt + rgb("0284c7"))
    line(pO, pA)
    line(pO, pB)
    
    // Đoạn thẳng nối hai tàu AB
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.5pt))
    line(pA, pB)
    
    // Điểm và emoji
    content((-0.45, 0), [📡 $O$])
    content((pA.at(0) + 0.45, pA.at(1)), [🚢 $A$])
    content((pB.at(0) + 0.45, pB.at(1)), [🚢 $B$])
    
    // Nhãn khoảng cách
    content((pA.at(0)/2 - 0.4, pA.at(1)/2 + 0.2), text(fill: rgb("0284c7"), size: 8.5pt)[$30" km"$])
    content((pB.at(0)/2 + 0.4, pB.at(1)/2 - 0.3), text(fill: rgb("0284c7"), size: 8.5pt)[$50" km"$])
    content(((pA.at(0)+pB.at(0))/2 + 0.5, (pA.at(1)+pB.at(1))/2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$A B = ?$])
    
    // Cung góc 120 độ chuẩn qua draw_angle_arc
    draw_angle_arc(pO, -30deg, 60deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((0.9, 0.2), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$120^circ$])
  })
