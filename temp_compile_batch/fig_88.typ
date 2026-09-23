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
        let sc = 0.15
        
        // Trục tháp radar thẳng đứng
        line((18 * sc, 0), (18 * sc, 30 * sc), stroke: 2.2pt + luma(100))
        content((18 * sc, 30 * sc + 0.45), [📡])
        content((18 * sc + 1.8, 28 * sc), text(weight: "bold")[Tháp radar])
        
        // Mặt biển nằm ngang
        line((-2 * sc, 0), (20 * sc, 0), stroke: 1pt + rgb("0284c7"))
        content((9 * sc, -1.0), text(fill: rgb("0284c7"), size: 8.5pt)[🌊 Mặt biển ($x = O M$)])
        
        let pM = (0, 0)
        let pO = (18 * sc, 0)
        let pB = (18 * sc, 9 * sc)
        let pA = (18 * sc, 25 * sc)
        
        // Cửa sổ phát sóng AB tô màu xanh lam nổi bật
        line(pB, pA, stroke: 4.5pt + rgb("0d9488"))
        content((18 * sc + 2.4, 17 * sc), text(fill: rgb("0d9488"), weight: "bold")[Cửa sóng ($16" m"$)])
        
        // Tia sóng radar tới tàu
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        content((-0.8, 0), [🚢 $M$])
        circle(pO, radius: 2pt, fill: black)
        content((18 * sc + 0.35, -0.3), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("0d9488"))
        content((18 * sc + 0.4, 9 * sc), text(weight: "bold")[$B (9" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("0d9488"))
        content((18 * sc + 0.4, 25 * sc), text(weight: "bold")[$A (25" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 26.5deg, 54.2deg, radius: 1.5, stroke: 1pt + rgb("d97706"))
        content((1.4, 1.2), text(fill: rgb("d97706"), weight: "bold")[$alpha$])
    })
