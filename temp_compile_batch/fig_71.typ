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
    
    // Ngọn núi kèm icon 🏔️
    fill(rgb("f8fafc"))
    stroke(1.2pt + luma(100))
    bezier((-100 * sc, 0), (1000 * sc, 0), (200 * sc, 800 * sc), (700 * sc, 900 * sc))
    content((550 * sc, 500 * sc), text(size: 20pt)[🏔️])
    
    // Tuyến hầm ngầm AB
    let pA = (50 * sc, 0)
    let pB = (850 * sc, 0)
    let pC = (400 * sc, 600 * sc)
    
    // Tuyến hầm nét đứt đôi
    stroke((paint: rgb("b45309"), dash: "dashed", thickness: 2.5pt))
    line(pA, pB)
    content(((pA.at(0) + pB.at(0))/2, -0.4), text(fill: rgb("b45309"), weight: "bold", size: 8.5pt)[Tuyến hầm $A B = ?$])
    
    // Tia ngắm từ trạm C
    stroke(1.2pt + rgb("2563eb"))
    line(pC, pA)
    line(pC, pB)
    
    // Các điểm mốc
    circle(pC, radius: 3pt, fill: rgb("dc2626"))
    content((pC.at(0), pC.at(1) + 0.45), text(fill: rgb("dc2626"), weight: "bold")[📡 $C$ (Trạm trắc địa)])
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.45, 0), text(weight: "bold")[$A$ (Cửa 1)])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.55, 0), text(weight: "bold")[$B$ (Cửa 2)])
    
    // Nhãn kích thước
    content((150 * sc, 350 * sc), text(fill: rgb("2563eb"), size: 8.5pt)[$C A = 600" m"$])
    content((680 * sc, 350 * sc), text(fill: rgb("2563eb"), size: 8.5pt)[$C B = 800" m"$])
    
    // Góc C chuẩn qua draw_angle_arc
    draw_angle_arc(pC, -125deg, -65deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((pC.at(0), pC.at(1) - 1.1), text(fill: rgb("d97706"), weight: "bold", size: 8pt)[$60^circ$])
  })
