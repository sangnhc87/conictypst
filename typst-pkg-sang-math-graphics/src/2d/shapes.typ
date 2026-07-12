// ═════════════════════════════════════════════════════════════════════════════
// 2D: SHAPES
// Các hình học phẳng phức tạp (Tam giác, tứ giác, đường tròn, đồ thị...)
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2"

// ── Hằng ─────────────────────────────────────────────────
#let _ge-blue = rgb("#0057b8")
#let _ge-red = rgb("#cc2200")
#let _ge-green = rgb("#1a7a2e")
#let _ge-gray = rgb("#888")
#let _ge-scale = 0.7cm

// ── Tam giác từ 3 điểm cho trước ───────────────────────
#let tri-xyz(A, B, C, labels: ("A", "B", "C"), right-angle: none, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    line(A, B, C, A, stroke: 1.2pt + black)
    for ((p, lbl)) in ((A, labels.at(0)), (B, labels.at(1)), (C, labels.at(2))) {
      circle(p, radius: 2.5pt, fill: black)
      let (x, y) = p
      let dx = 0.25; let dy = 0.25
      if p == A { (dx, dy) = (-0.3, -0.35) }
      if p == B { (dx, dy) = (0.3, -0.35) }
      if p == C { (dx, dy) = (0, 0.35) }
      content((x + dx, y + dy), text(size: 9pt, weight: "bold")[#lbl])
    }
    if right-angle != none {
      let pts = (A, B, C)
      let i = if right-angle == "A" { 0 } else if right-angle == "B" { 1 } else if right-angle == "C" { 2 } else { -1 }
      if i >= 0 {
        let p = pts.at(i)
        let p1 = pts.at(calc.rem(i + 1, 3))
        let p2 = pts.at(calc.rem(i + 2, 3))
        let s = 0.4
        let v1 = ((p1.at(0) - p.at(0), p1.at(1) - p.at(1)))
        let v2 = ((p2.at(0) - p.at(0), p2.at(1) - p.at(1)))
        let d1 = calc.sqrt(v1.at(0) * v1.at(0) + v1.at(1) * v1.at(1))
        let d2 = calc.sqrt(v2.at(0) * v2.at(0) + v2.at(1) * v2.at(1))
        let u1 = (v1.at(0) / d1 * s, v1.at(1) / d1 * s)
        let u2 = (v2.at(0) / d2 * s, v2.at(1) / d2 * s)
        line((p.at(0) + u1.at(0), p.at(1) + u1.at(1)),
             (p.at(0) + u1.at(0) + u2.at(0), p.at(1) + u1.at(1) + u2.at(1)),
             (p.at(0) + u2.at(0), p.at(1) + u2.at(1)),
             stroke: 0.6pt + black)
      }
    }
  })
}

// ── Tam giác thường — cạnh đáy ngang, đỉnh trên ────────
#let tri-abc(base: 5, height: 3.5, labels: ("A", "B", "C"), scale: _ge-scale) = {
  let hw = base / 2
  tri-xyz(
    (-hw, 0), (hw, 0), (0, height),
    labels: labels,
    scale: scale,
  )
}

// ── Tam giác vuông tại A ────────────────────────────────
#let tri-right(leg1: 4, leg2: 3, labels: ("A", "B", "C"), right-angle-vertex: "A", scale: _ge-scale) = {
  tri-xyz(
    (0, 0), (leg1, 0), (0, leg2),
    labels: labels,
    right-angle: right-angle-vertex,
    scale: scale,
  )
}

// ── Hình chữ nhật / vuông ──────────────────────────────
#let rect-xyz(A: (0, 0), C: (5, 3), labels: ("A", "B", "C", "D"), scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let (ax, ay) = A; let (cx, cy) = C
    let B = (cx, ay); let D = (ax, cy)
    line(A, B, C, D, A, stroke: 1.2pt + black)
    for ((p, lbl)) in ((A, labels.at(0)), (B, labels.at(1)), (C, labels.at(2)), (D, labels.at(3))) {
      circle(p, radius: 2.5pt, fill: black)
      let (x, y) = p
      let (dx, dy) = if p == A { (-0.3, -0.35) }
        else if p == B { (0.3, -0.35) }
        else if p == C { (0.3, 0.35) }
        else { (-0.3, 0.35) }
      content((x + dx, y + dy), text(size: 9pt, weight: "bold")[#lbl])
    }
  })
}

#let rect-abc(width: 5, height: 3, labels: ("A", "B", "C", "D"), scale: _ge-scale) = {
  rect-xyz(A: (0, 0), C: (width, height), labels: labels, scale: scale)
}

#let square(a: 4, labels: ("A", "B", "C", "D"), scale: _ge-scale) = {
  rect-abc(width: a, height: a, labels: labels, scale: scale)
}

// ── Đường tròn tâm O, bán kính R ────────────────────────
#let circle-desc(
  center: (0, 0),
  radius: 2,
  label: "O",
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    circle(center, radius: radius, stroke: 1.2pt + black, fill: none)
    circle(center, radius: 2.8pt, fill: black)
    content((center.at(0) - 0.3, center.at(1) - 0.35), text(size: 10pt, weight: "bold")[#label])
    // Vẽ 2 đường kính nét mảnh
    line(
      (center.at(0) - radius, center.at(1)),
      (center.at(0) + radius, center.at(1)),
      stroke: (paint: _ge-gray, thickness: 0.4pt, dash: "dotted"),
    )
    line(
      (center.at(0), center.at(1) - radius),
      (center.at(0), center.at(1) + radius),
      stroke: (paint: _ge-gray, thickness: 0.4pt, dash: "dotted"),
    )
  })
}

// ── Đánh dấu góc ────────────────────────────────────────
#let angle-mark(A, O, B, radius: 0.5, label: none, fill: rgb("#FFE0B2"), scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let (ax, ay) = A
    let (ox, oy) = O
    let (bx, by) = B
    let angleA = calc.atan2(ay - oy, ax - ox)
    let angleB = calc.atan2(by - oy, bx - ox)
    let r = radius
    arc(O, r, angleA, angleB, stroke: 0.7pt + _ge-red, fill: fill)
    if label != none {
      let mx = ox + r * 1.5 * calc.cos((angleA + angleB) / 2)
      let my = oy + r * 1.5 * calc.sin((angleA + angleB) / 2)
      content((mx, my), text(size: 8pt, fill: _ge-red)[#label])
    }
  })
}

// ── Đường đứt nét giữa 2 điểm ──────────────────────────
#let dashed-seg(A, B, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    line(A, B, stroke: (paint: _ge-gray, thickness: 0.7pt, dash: "dashed"))
  })
}

// ── Đường tròn ngoại tiếp tam giác ──────────────────────
#let circle-circumcircle(A, B, C, label: "O", scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let (x1, y1) = A
    let (x2, y2) = B
    let (x3, y3) = C
    let D = 2 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2))
    
    if D != 0 {
      let S1 = x1 * x1 + y1 * y1
      let S2 = x2 * x2 + y2 * y2
      let S3 = x3 * x3 + y3 * y3
      
      let Ux = (S1 * (y2 - y3) + S2 * (y3 - y1) + S3 * (y1 - y2)) / D
      let Uy = (S1 * (x3 - x2) + S2 * (x1 - x3) + S3 * (x2 - x1)) / D
      
      let R = calc.sqrt((x1 - Ux) * (x1 - Ux) + (y1 - Uy) * (y1 - Uy))
      let O = (Ux, Uy)
      
      circle(O, radius: R, stroke: 1.2pt + _ge-blue, fill: none)
      circle(O, radius: 2.5pt, fill: _ge-red)
      content((Ux + 0.3, Uy - 0.3), text(size: 10pt, weight: "bold", fill: _ge-red)[#label])
    }
  })
}

// ── Đường tròn nội tiếp tam giác ────────────────────────
#let circle-incircle(A, B, C, label: "I", scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let (x1, y1) = A
    let (x2, y2) = B
    let (x3, y3) = C
    
    let a = calc.sqrt((x2 - x3) * (x2 - x3) + (y2 - y3) * (y2 - y3))
    let b = calc.sqrt((x1 - x3) * (x1 - x3) + (y1 - y3) * (y1 - y3))
    let c = calc.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    let P = a + b + c
    
    if P != 0 {
      let Ix = (a * x1 + b * x2 + c * x3) / P
      let Iy = (a * y1 + b * y2 + c * y3) / P
      
      // Bán kính R = S / p
      let p = P / 2
      let S = calc.sqrt(p * (p - a) * (p - b) * (p - c))
      let R = S / p
      let I = (Ix, Iy)
      
      circle(I, radius: R, stroke: 1.2pt + _ge-blue, fill: none)
      circle(I, radius: 2.5pt, fill: _ge-red)
      content((Ix + 0.3, Iy - 0.3), text(size: 10pt, weight: "bold", fill: _ge-red)[#label])
    }
  })
}
