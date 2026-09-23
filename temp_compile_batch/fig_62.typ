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
    let sc = 0.007
    
    // Hệ trục chỉ hướng
    line((-1.5, 0), (3.5, 0), stroke: 0.3pt + luma(180))
    line((0, -0.8), (0, 3.8), stroke: 0.3pt + luma(180))
    
    // Tọa độ 3 điểm A, B, C
    let pA = (0, 0)
    let pB = (0, 300 * sc)
    let pC = (400 * 0.707 * sc, (300 + 400 * 0.707) * sc)
    
    // Đoạn đường bay AB và BC
    stroke(1.2pt + rgb("0d9488"))
    line(pA, pB)
    line(pB, pC)
    
    // Đường bay thẳng AC (nét đứt)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pC)
    
    // Đường kéo dài theo hướng Bắc từ B
    stroke((paint: luma(120), dash: "dotted", thickness: 0.8pt))
    line(pB, (0, (300 + 150) * sc))
    
    // Các điểm và nhãn
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.35, pA.at(1)), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) - 0.35, pB.at(1)), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.35, pC.at(1)), text(weight: "bold")[$C$])
    
    // Nhãn độ dài
    content((-0.6, 150 * sc), text(fill: rgb("0d9488"), size: 8.5pt)[$300" km"$])
    content((1.3, 2.8), text(fill: rgb("0d9488"), size: 8.5pt)[$400" km"$])
    content((1.2, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$A C = ?$])
    
    // Góc lệch 45 độ chuẩn xác
    draw_angle_arc(pB, 45deg, 90deg, radius: 0.5, stroke: 0.8pt + rgb("d97706"))
    content((0.35, pB.at(1) + 0.5), text(fill: rgb("d97706"), size: 8pt)[$45^circ$])
    
    // Góc trong B = 135 độ chuẩn xác
    draw_angle_arc(pB, -90deg, 45deg, radius: 0.35, stroke: 0.8pt + rgb("2563eb"))
    content((0.2, pB.at(1) - 0.3), text(fill: rgb("2563eb"), size: 7.5pt)[$135^circ$])
  })
