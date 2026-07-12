// ═════════════════════════════════════════════════════════════════════════════
// 3D: PSEUDO-3D SHAPES
// Các khối hình học không gian được vẽ bằng tọa độ 2D giả lập phối cảnh
// (Hình chóp, lăng trụ...)
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2"

// ── Hằng ─────────────────────────────────────────────────
#let _ge-blue = rgb("#0057b8")
#let _ge-red = rgb("#e11d48")
#let _ge-gray = rgb("#888")
#let _ge-scale = 0.7cm

// ── Hình chóp tam giác S.ABC ────────────────────────────
// base: 3 điểm đáy, S: đỉnh
#let chop-sabc(
  S: (0, 8),
  A: (-4, 0), B: (4, 0), C: (0, -2),
  labels: ("S", "A", "B", "C"),
  hidden: (), // tuple đỉnh bị che: ("AC",) → AC nét đứt
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let pts = (S, A, B, C)
    let edges = ((0, 1), (0, 2), (0, 3), (1, 2), (2, 3), (3, 1))
    for e in edges {
      let (i, j) = e
      let lbl = labels.at(i) + labels.at(j)
      let rev = labels.at(j) + labels.at(i)
      let st = if hidden.contains(lbl) or hidden.contains(rev) {
        (paint: _ge-gray, thickness: 0.7pt, dash: "dashed")
      } else {
        1.1pt + black
      }
      line(pts.at(i), pts.at(j), stroke: st)
    }
    for (i, lbl) in labels.enumerate() {
      let (x, y) = pts.at(i)
      circle((x, y), radius: 2.5pt, fill: if i == 0 { _ge-blue } else { black })
      let (dx, dy) = if lbl == "S" { (0, 0.45) }
        else if lbl == "A" { (-0.4, -0.3) }
        else if lbl == "B" { (0.4, -0.3) }
        else { (0.1, -0.4) }
      content((x + dx, y + dy), text(size: 10pt, weight: "bold")[#lbl])
    }
  })
}

// ── Hình chóp tứ giác S.ABCD ────────────────────────────
#let chop-sabcd(
  S: (0, 7),
  A: (-3, 0), B: (3, 0), C: (2, -2), D: (-2, -2),
  labels: ("S", "A", "B", "C", "D"),
  hidden: (),
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let pts = (S, A, B, C, D)
    let edges = ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (2, 3), (3, 4), (4, 1))
    for e in edges {
      let (i, j) = e
      let lbl = labels.at(i) + labels.at(j)
      let rev = labels.at(j) + labels.at(i)
      let st = if hidden.contains(lbl) or hidden.contains(rev) {
        (paint: _ge-gray, thickness: 0.7pt, dash: "dashed")
      } else {
        1.1pt + black
      }
      line(pts.at(i), pts.at(j), stroke: st)
    }
    for (i, lbl) in labels.enumerate() {
      let (x, y) = pts.at(i)
      circle((x, y), radius: 2.5pt, fill: if i == 0 { _ge-blue } else { black })
      let (dx, dy) = if lbl == "S" { (0, 0.45) }
        else if lbl == "A" { (-0.35, -0.3) }
        else if lbl == "B" { (0.35, -0.3) }
        else if lbl == "C" { (0.3, 0.3) }
        else { (-0.3, 0.3) }
      content((x + dx, y + dy), text(size: 10pt, weight: "bold")[#lbl])
    }
  })
}

// ── Lăng trụ tam giác ABC.A'B'C' ────────────────────────
#let lang-tru-abc(
  A: (-3, 0), B: (3, 0), C: (0, -2),
  A2: (-3, 5), B2: (3, 5), C2: (0, 3),
  labels: ("A", "B", "C", "A'", "B'", "C'"),
  hidden: (), // "AA'" hoặc "AB" để đánh dấu nét đứt
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let pts = (A, B, C, A2, B2, C2)
    let edges = ((0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 3), (0, 3), (1, 4), (2, 5))
    for e in edges {
      let (i, j) = e
      let lbl = labels.at(i) + labels.at(j)
      let rev = labels.at(j) + labels.at(i)
      let st = if hidden.contains(lbl) or hidden.contains(rev) {
        (paint: _ge-gray, thickness: 0.7pt, dash: "dashed")
      } else {
        1.1pt + black
      }
      line(pts.at(i), pts.at(j), stroke: st)
    }
    for (i, lbl) in labels.enumerate() {
      let (x, y) = pts.at(i)
      circle((x, y), radius: 2.5pt, fill: black)
      let (dx, dy) = if lbl == "A" or lbl == "A'" { (-0.35, -0.3) }
        else if lbl == "B" or lbl == "B'" { (0.35, -0.3) }
        else { (0, 0.35) }
      content((x + dx, y + dy), text(size: 10pt, weight: "bold")[#lbl])
    }
  })
}

// ── Hệ trục toạ độ Oxyz ──────────────────────────────────
#let axis-xyz(
  O: (0, 0),
  x-len: 3, y-len: 4, z-len: 4,
  x-angle: -135deg, // Ox hướng xuống dưới bên trái
  labels: ("x", "y", "z", "O"),
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let X = (O.at(0) + x-len * calc.cos(x-angle), O.at(1) + x-len * calc.sin(x-angle))
    let Y = (O.at(0) + y-len, O.at(1))
    let Z = (O.at(0), O.at(1) + z-len)
    
    // Draw axes
    line(O, X, mark: (end: ">"), stroke: 1pt + black)
    line(O, Y, mark: (end: ">"), stroke: 1pt + black)
    line(O, Z, mark: (end: ">"), stroke: 1pt + black)
    
    // Labels
    content((X.at(0) - 0.3, X.at(1) - 0.3), text(size: 10pt, weight: "bold")[#labels.at(0)])
    content((Y.at(0) + 0.3, Y.at(1) - 0.3), text(size: 10pt, weight: "bold")[#labels.at(1)])
    content((Z.at(0) + 0.3, Z.at(1) + 0.3), text(size: 10pt, weight: "bold")[#labels.at(2)])
    content((O.at(0) - 0.3, O.at(1) - 0.3), text(size: 10pt, weight: "bold")[#labels.at(3)])
  })
}

// ── Hình chóp tam giác đều S.ABC ────────────────────────
#let chop-sabc-deu(
  S-height: 6,
  A: (-3, -1.5), B: (3, -1.5), C: (0, 1.5),
  labels: ("S", "A", "B", "C", "O"),
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    // Tâm O của đáy là trọng tâm tam giác ABC
    let Ox = (A.at(0) + B.at(0) + C.at(0)) / 3
    let Oy = (A.at(1) + B.at(1) + C.at(1)) / 3
    let O = (Ox, Oy)
    let S = (Ox, Oy + S-height)
    
    let pts = (S, A, B, C)
    let edges = ((0, 1), (0, 2), (0, 3), (1, 2), (2, 3), (3, 1))
    // Trong chóp tam giác đều, thường cạnh AC bị che
    let hidden-edges = ((1, 3),) 
    
    // Vẽ đáy và các cạnh bên
    for e in edges {
      let (i, j) = e
      let st = if hidden-edges.contains(e) or hidden-edges.contains((j, i)) {
        (paint: _ge-gray, thickness: 0.7pt, dash: "dashed")
      } else {
        1.1pt + black
      }
      line(pts.at(i), pts.at(j), stroke: st)
    }
    
    // Vẽ đường cao SO nét đứt
    line(O, S, stroke: (paint: _ge-red, thickness: 0.7pt, dash: "dashed"))
    
    // Điểm và nhãn
    for (i, lbl) in labels.slice(0, 4).enumerate() {
      let (x, y) = pts.at(i)
      circle((x, y), radius: 2.5pt, fill: if i == 0 { _ge-blue } else { black })
      let (dx, dy) = if lbl == "S" { (0, 0.45) }
        else if lbl == "A" { (-0.4, -0.3) }
        else if lbl == "B" { (0.4, -0.3) }
        else { (0.1, -0.4) }
      content((x + dx, y + dy), text(size: 10pt, weight: "bold")[#lbl])
    }
    // Điểm O
    circle(O, radius: 2.5pt, fill: _ge-red)
    content((O.at(0) + 0.3, O.at(1) - 0.25), text(size: 10pt, weight: "bold", fill: _ge-red)[#labels.at(4)])
  })
}

// ── Hình chóp tứ giác đều S.ABCD ────────────────────────
#let chop-sabcd-deu(
  S-height: 7,
  A: (-3, -1.5), B: (3, -1.5), C: (5, 1.5),
  labels: ("S", "A", "B", "C", "D", "O"),
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    // Tâm O là trung điểm AC, D đối xứng B qua O
    let Ox = (A.at(0) + C.at(0)) / 2
    let Oy = (A.at(1) + C.at(1)) / 2
    let O = (Ox, Oy)
    let D = (2 * Ox - B.at(0), 2 * Oy - B.at(1))
    let S = (Ox, Oy + S-height)
    
    let pts = (S, A, B, C, D)
    let edges = ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (2, 3), (3, 4), (4, 1))
    // Cạnh bị che trong chóp tứ giác đều (thường AD, DC và SD)
    let hidden-edges = ((0, 4), (4, 1), (3, 4))
    
    for e in edges {
      let (i, j) = e
      let st = if hidden-edges.contains(e) or hidden-edges.contains((j, i)) {
        (paint: _ge-gray, thickness: 0.7pt, dash: "dashed")
      } else {
        1.1pt + black
      }
      line(pts.at(i), pts.at(j), stroke: st)
    }
    
    // Vẽ hai đường chéo AC, BD và đường cao SO nét đứt
    line(A, C, stroke: (paint: _ge-gray, thickness: 0.6pt, dash: "dashed"))
    line(B, D, stroke: (paint: _ge-gray, thickness: 0.6pt, dash: "dashed"))
    line(O, S, stroke: (paint: _ge-red, thickness: 0.7pt, dash: "dashed"))
    
    // Điểm và nhãn
    for (i, lbl) in labels.slice(0, 5).enumerate() {
      let (x, y) = pts.at(i)
      circle((x, y), radius: 2.5pt, fill: if i == 0 { _ge-blue } else { black })
      let (dx, dy) = if lbl == "S" { (0, 0.45) }
        else if lbl == "A" { (-0.35, -0.3) }
        else if lbl == "B" { (0.35, -0.3) }
        else if lbl == "C" { (0.3, 0.3) }
        else { (-0.3, 0.3) }
      content((x + dx, y + dy), text(size: 10pt, weight: "bold")[#lbl])
    }
    // Điểm O
    circle(O, radius: 2.5pt, fill: _ge-red)
    content((O.at(0), O.at(1) - 0.4), text(size: 10pt, weight: "bold", fill: _ge-red)[#labels.at(5)])
  })
}

// ── Hình nón (Pseudo Cone) ────────────────────────────────
#let pseudo-cone(
  O: (0, 0),
  radius-x: 3, radius-y: 1, height: 6,
  label-S: "S", label-O: "O",
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let S = (O.at(0), O.at(1) + height)
    let A = (O.at(0) - radius-x, O.at(1))
    let B = (O.at(0) + radius-x, O.at(1))
    
    // Nửa elip đứt nét (nửa sau)
    arc(A, start: 180deg, stop: 0deg, radius: (radius-x, radius-y), stroke: (paint: _ge-gray, thickness: 0.7pt, dash: "dashed"))
    
    // Nửa elip nét liền (nửa trước)
    arc(A, start: 180deg, stop: 360deg, radius: (radius-x, radius-y), stroke: 1.1pt + black)
    
    // Đường sinh
    line(A, S, stroke: 1.1pt + black)
    line(B, S, stroke: 1.1pt + black)
    
    // Đường cao và bán kính
    line(O, S, stroke: (paint: _ge-red, thickness: 0.7pt, dash: "dashed"))
    line(O, B, stroke: (paint: _ge-gray, thickness: 0.7pt, dash: "dashed"))
    
    // Points & Labels
    circle(S, radius: 2.5pt, fill: _ge-blue)
    content((S.at(0), S.at(1) + 0.45), text(size: 10pt, weight: "bold")[#label-S])
    
    circle(O, radius: 2.5pt, fill: _ge-red)
    content((O.at(0) - 0.3, O.at(1) - 0.3), text(size: 10pt, weight: "bold", fill: _ge-red)[#label-O])
  })
}

// ── Hình trụ (Pseudo Cylinder) ────────────────────────────
#let pseudo-cylinder(
  O1: (0, 0), O2: (0, 6),
  radius-x: 3, radius-y: 1,
  label-O1: "O", label-O2: "O'",
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let A1 = (O1.at(0) - radius-x, O1.at(1))
    let B1 = (O1.at(0) + radius-x, O1.at(1))
    let A2 = (O2.at(0) - radius-x, O2.at(1))
    let B2 = (O2.at(0) + radius-x, O2.at(1))
    
    // Đáy dưới (O1)
    arc(A1, start: 180deg, stop: 0deg, radius: (radius-x, radius-y), stroke: (paint: _ge-gray, thickness: 0.7pt, dash: "dashed"))
    arc(A1, start: 180deg, stop: 360deg, radius: (radius-x, radius-y), stroke: 1.1pt + black)
    
    // Đáy trên (O2) - thấy toàn bộ
    circle(O2, radius: (radius-x, radius-y), stroke: 1.1pt + black)
    
    // Đường sinh 2 bên
    line(A1, A2, stroke: 1.1pt + black)
    line(B1, B2, stroke: 1.1pt + black)
    
    // Trục O1O2
    line(O1, O2, stroke: (paint: _ge-red, thickness: 0.7pt, dash: "dashed"))
    line(O1, B1, stroke: (paint: _ge-gray, thickness: 0.7pt, dash: "dashed"))
    line(O2, B2, stroke: (paint: _ge-gray, thickness: 0.7pt, dash: "dashed"))
    
    // Points & Labels
    circle(O1, radius: 2.5pt, fill: _ge-red)
    content((O1.at(0) - 0.3, O1.at(1) - 0.3), text(size: 10pt, weight: "bold", fill: _ge-red)[#label-O1])
    circle(O2, radius: 2.5pt, fill: _ge-red)
    content((O2.at(0) - 0.3, O2.at(1) + 0.35), text(size: 10pt, weight: "bold", fill: _ge-red)[#label-O2])
  })
}
