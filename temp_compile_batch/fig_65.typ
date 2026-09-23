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
    let sc = 0.03
    
    // Mặt phẳng ngang qua A
    line((0, 0), (120 * sc, 0), stroke: 0.6pt + luma(140))
    
    // Đồi và tháp
    let pA = (0, 0)
    let pC0 = (100 * sc, 0)
    let pC = (100 * sc, 100 * 0.577 * sc)
    let pD = (100 * sc, 100 * sc)
    
    // Sườn đồi
    fill(rgb("f1f5f9"))
    stroke(1pt + luma(100))
    bezier(pA, pC, (40 * sc, 5 * sc), (70 * sc, 25 * sc))
    line(pC, pC0)
    line(pC0, pA)
    
    // Tháp truyền hình CD
    stroke(3pt + rgb("dc2626"))
    line(pC, pD)
    
    // Tia ngắm từ A đến C và D
    stroke(0.8pt + rgb("0284c7"))
    line(pA, pC)
    stroke(1.2pt + rgb("2563eb"))
    line(pA, pD)
    
    // Điểm và nhãn
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.35, 0), text(weight: "bold")[$A$])
    circle(pC0, radius: 2pt, fill: black)
    content((pC0.at(0) + 0.35, -0.2), text(weight: "bold")[$C_0$])
    circle(pC, radius: 2.5pt, fill: rgb("dc2626"))
    content((pC.at(0) + 0.65, pC.at(1)), text(weight: "bold")[$C$ (Chân tháp)])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((pD.at(0) + 0.65, pD.at(1)), text(weight: "bold")[$D$ (Đỉnh tháp)])
    
    // Góc nâng chuẩn xác
    draw_angle_arc(pA, 0deg, 30deg, radius: 1.0, stroke: 0.8pt + rgb("059669"))
    content((1.2, 0.35), text(fill: rgb("059669"), size: 8pt)[$30^circ$])
    draw_angle_arc(pA, 0deg, 45deg, radius: 1.6, stroke: 0.8pt + rgb("d97706"))
    content((1.8, 0.95), text(fill: rgb("d97706"), size: 8.5pt)[$45^circ$])
    
    // Nhãn khoảng cách
    content((50 * sc, -0.3), text(size: 8.5pt)[$100" m"$])
    content((100 * sc + 1.2, (pC.at(1) + pD.at(1))/2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[🗼 Tháp $C D$])
  })
