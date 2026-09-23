#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let circ = sym.degree
#let c-book = rgb("#0057b8")
#let accent = rgb("#0057b8")
#let pm = sym.plus.minus

#canvas(length: 1cm, {
    import draw: *
    
    // Ceiling
    let ceiling_w = 1.5
    let O = (0, 3.5)
    line((-ceiling_w, O.at(1)), (ceiling_w, O.at(1)), stroke: 1.5pt + rgb("#333"))
    for i in range(-5, 6) {
      let x = i * 0.25
      line((x, O.at(1)), (x + 0.15, O.at(1) + 0.15), stroke: 0.8pt + gray)
    }
    
    circle(O, radius: 0.06, fill: black)
    content((O.at(0), O.at(1) + 0.35), $O$)
    
    // The suspended lamp disk (drawn as an ellipse)
    let lamp_center = (0, 0.5)
    let r_x = 1.6
    let r_y = 0.6
    
    // Points on the disk
    let A = (-1.2, 0.5 - 0.2)
    let B = (0.5, 0.5 + 0.45) // back point
    let C = (1.2, 0.5 - 0.1)
    
    // Back string OB (hidden part and visible part)
    line(O, B, stroke: (thickness: 1pt, dash: "dashed", paint: rgb("#7f8c8d")))
    
    // Draw lamp disk
    circle(lamp_center, radius: (r_x, r_y), fill: rgb(224, 234, 245, 80%), stroke: 1.5pt + rgb("#2980b9"))
    // Inner decorations
    circle(lamp_center, radius: (r_x * 0.8, r_y * 0.8), fill: none, stroke: 0.8pt + rgb("#3498db"))
    
    // Front strings
    line(O, A, stroke: 1.2pt + rgb("#2c3e50"))
    line(O, C, stroke: 1.2pt + rgb("#2c3e50"))
    
    // Force vectors at O
    let vA = (A.at(0) - O.at(0), A.at(1) - O.at(1))
    let vB = (B.at(0) - O.at(0), B.at(1) - O.at(1))
    let vC = (C.at(0) - O.at(0), C.at(1) - O.at(1))
    
    let scale = 0.4
    let F1 = (O.at(0) + vA.at(0)*scale, O.at(1) + vA.at(1)*scale)
    let F2 = (O.at(0) + vB.at(0)*scale, O.at(1) + vB.at(1)*scale)
    let F3 = (O.at(0) + vC.at(0)*scale, O.at(1) + vC.at(1)*scale)
    
    line(O, F1, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    line(O, F2, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    line(O, F3, stroke: 1.8pt + rgb("#e74c3c"), mark: (end: "stealth", fill: rgb("#e74c3c")))
    
    content((F1.at(0) - 0.35, F1.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_1)$])
    content((F2.at(0) + 0.4, F2.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_2)$])
    content((F3.at(0) + 0.4, F3.at(1) + 0.1), text(fill: rgb("#c0392b"))[$arrow(F_3)$])
    
    // Points labels
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)
    content((A.at(0) - 0.25, A.at(1) - 0.2), $A$)
    content((B.at(0) + 0.2, B.at(1) + 0.2), $B$)
    content((C.at(0) + 0.25, C.at(1) - 0.2), $C$)
    
    // Gravity P
    circle(lamp_center, radius: 0.06, fill: rgb("#27ae60"))
    line(lamp_center, (lamp_center.at(0), lamp_center.at(1) - 1.5), stroke: 2.5pt + rgb("#27ae60"), mark: (end: "stealth", fill: rgb("#27ae60")))
    content((lamp_center.at(0) + 0.4, lamp_center.at(1) - 1.0), text(fill: rgb("#27ae60"))[$arrow(P)$])
  })