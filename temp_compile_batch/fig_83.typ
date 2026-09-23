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
    let sc = 0.04
    
    // Trục hướng Đông
    line((-1, 0), (140 * sc, 0), stroke: 0.4pt + luma(160))
    
    let pA = (0, 0)
    let pB = (60 * 0.866 * sc, 60 * 0.5 * sc)
    let pC = (pB.at(0) + 80 * 0.707 * sc, pB.at(1) - 80 * 0.707 * sc)
    
    // Vùng bão tròn màu đỏ nhạt ở giữa kèm emoji 🌪️
    fill(rgb("fef2f2"))
    stroke((paint: rgb("ef4444"), dash: "dotted", thickness: 1pt))
    circle((55 * sc, 5 * sc), radius: 1.2)
    content((55 * sc, 5 * sc), [🌪️])
    content((55 * sc, 5 * sc - 0.4), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[Tâm bão])
    
    // Hải trình hai chặng AB và BC
    stroke(1.8pt + rgb("0d9488"))
    line(pA, pB)
    stroke(1.8pt + rgb("0284c7"))
    line(pB, pC)
    
    // Tuyến đường thẳng AC nét đứt
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pC)
    
    // Đường gióng hướng Đông tại B
    stroke((paint: luma(120), dash: "dotted", thickness: 0.8pt))
    line(pB, (pB.at(0) + 30 * sc, pB.at(1)))
    
    // Các điểm và emoji
    content((pA.at(0) - 0.4, 0), [⚓ $A$])
    content((pB.at(0), pB.at(1) + 0.4), [🚢 $B$])
    content((pC.at(0) + 0.45, pC.at(1)), [🏝️ $C$])
    
    // Nhãn chiều dài
    content((pB.at(0)/2 - 0.5, pB.at(1)/2 + 0.3), text(fill: rgb("0d9488"), size: 8.5pt)[$60$ HL])
    content(((pB.at(0)+pC.at(0))/2 + 0.6, (pB.at(1)+pC.at(1))/2 + 0.3), text(fill: rgb("0284c7"), size: 8.5pt)[$80$ HL])
    content(((pA.at(0)+pC.at(0))/2, pC.at(1) - 0.4), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$A C = ?$])
    
    // Cung góc chuẩn xác qua draw_angle_arc
    draw_angle_arc(pA, 0deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.0, 0.2), text(fill: rgb("d97706"), size: 7.5pt)[$30^circ$])
  })
