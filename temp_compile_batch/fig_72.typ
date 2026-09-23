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
    
    // Mặt đất
    line((-1, 0), (140 * sc, 0), stroke: 0.8pt + luma(100))
    
    // Trục tháp CD
    let pC = (120 * sc, 0)
    let pD = (120 * sc, (1.2 + 84.9) * sc)
    
    // Tháp cao tầng kèm icon 🗼
    stroke(3pt + rgb("1e293b"))
    line(pC, pD)
    content((pC.at(0) + 1.2, pD.at(1) / 2), text(weight: "bold")[🗼 Tháp $C D$])
    
    // Tường rào chắn
    rect((105 * sc, 0), (110 * sc, 15 * sc), fill: luma(180), stroke: 0.8pt)
    content((107.5 * sc, 8 * sc), [🧱])
    
    // Hai điểm đặt máy A và B
    let pA = (0, 1.2 * sc)
    let pB = (50 * sc, 1.2 * sc)
    
    // Đường nằm ngang tầm ngắm
    stroke((paint: luma(140), dash: "dashed", thickness: 0.6pt))
    line((0, 1.2 * sc), (120 * sc, 1.2 * sc))
    content((25 * sc, 0.4 * sc), text(size: 8pt)[$A B = 50" m"$])
    
    // Chân máy kinh vĩ
    line((0, 0), (0, 1.2 * sc), stroke: 1.5pt + rgb("0284c7"))
    line((50 * sc, 0), (50 * sc, 1.2 * sc), stroke: 1.5pt + rgb("0284c7"))
    content((-0.35, 1.2 * sc + 0.2), [👁️])
    content((50 * sc - 0.35, 1.2 * sc + 0.2), [👁️])
    
    // Tia ngắm AD và BD
    stroke(1pt + rgb("0284c7"))
    line(pA, pD)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pD)
    
    // Góc nâng chuẩn qua draw_angle_arc
    draw_angle_arc(pA, 0deg, 35deg, radius: 0.9, stroke: 0.8pt + rgb("059669"))
    content((1.3, 1.2 * sc + 0.35), text(fill: rgb("059669"), size: 8pt)[$35^circ$])
    draw_angle_arc(pB, 0deg, 50deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((50 * sc + 1.1, 1.2 * sc + 0.45), text(fill: rgb("d97706"), size: 8pt)[$50^circ$])
  })
