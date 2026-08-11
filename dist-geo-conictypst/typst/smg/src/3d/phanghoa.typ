// ═════════════════════════════════════════════════════════════════════════════
// CHUYÊN ĐỀ PHẲNG HOÁ (FLATTENING / UNFOLDING)
// Khai triển các khối không gian thành mặt phẳng để giải bài toán đường đi.
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2"

#let _ge-blue = rgb("#0057b8")
#let _ge-red = rgb("#cc2200")
#let _ge-scale = 0.7cm

// ── 1. Khai triển Hình Nón ────────────────────────────────
#let phanghoa-non(
  r: 3, h: 4, 
  labels: ("S", "A", "A'"),
  draw-base: false,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let l = calc.sqrt(r * r + h * h)
    let theta = (r / l) * 360deg
    
    // Đỉnh nón ở (0,0)
    let S = (0, 0)
    // Các điểm đáy A, A'
    let start-angle = 270deg - theta / 2
    let end-angle = 270deg + theta / 2
    
    let A = (l * calc.cos(start-angle), l * calc.sin(start-angle))
    let A-prime = (l * calc.cos(end-angle), l * calc.sin(end-angle))
    
    // Vẽ quạt tròn
    arc(S, start: start-angle, stop: end-angle, radius: l, fill: rgb("#f0f8ff"), stroke: 1.2pt + _ge-blue)
    line(S, A, stroke: 1.2pt + _ge-blue)
    line(S, A-prime, stroke: 1.2pt + _ge-blue)
    
    // Nhãn
    circle(S, radius: 2.5pt, fill: black)
    content((S.at(0), S.at(1) + 0.4), text(size: 10pt, weight: "bold")[#labels.at(0)])
    
    circle(A, radius: 2.5pt, fill: black)
    content((A.at(0) - 0.4, A.at(1) - 0.3), text(size: 10pt, weight: "bold")[#labels.at(1)])
    
    circle(A-prime, radius: 2.5pt, fill: black)
    content((A-prime.at(0) + 0.4, A-prime.at(1) - 0.3), text(size: 10pt, weight: "bold")[#labels.at(2)])
    
    // Tuỳ chọn vẽ đường tròn đáy dính vào giữa cung
    if draw-base {
      let mid-angle = 270deg
      let M = (l * calc.cos(mid-angle), l * calc.sin(mid-angle))
      let O = (M.at(0), M.at(1) - r) // Tâm đường tròn đáy
      circle(O, radius: r, stroke: 1pt + _ge-blue)
      circle(O, radius: 2.5pt, fill: black)
      content((O.at(0) + 0.3, O.at(1)), text(size: 10pt, weight: "bold")[O])
    }
  })
}

// ── 2. Khai triển Hình Trụ ────────────────────────────────
#let phanghoa-tru(
  r: 2, h: 5,
  labels: ("A", "B", "B'", "A'"),
  draw-bases: false,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let width = 2 * calc.pi * r
    let height = h
    
    let A = (0, 0)
    let B = (0, height)
    let B-prime = (width, height)
    let A-prime = (width, 0)
    
    // Vẽ hình chữ nhật
    line(A, B, B-prime, A-prime, A, fill: rgb("#fff5ee"), stroke: 1.2pt + _ge-blue)
    
    // Tuỳ chọn gắn đáy
    if draw-bases {
      let O1 = (width / 2, height + r)
      let O2 = (width / 2, -r)
      circle(O1, radius: r, stroke: 1pt + _ge-blue)
      circle(O2, radius: r, stroke: 1pt + _ge-blue)
    }
    
    // Điểm và nhãn
    let pts = (A, B, B-prime, A-prime)
    for (i, p) in pts.enumerate() {
      circle(p, radius: 2.5pt, fill: black)
      let (dx, dy) = if i == 0 { (-0.3, -0.3) }
        else if i == 1 { (-0.3, 0.3) }
        else if i == 2 { (0.3, 0.3) }
        else { (0.3, -0.3) }
      content((p.at(0) + dx, p.at(1) + dy), text(size: 10pt, weight: "bold")[#labels.at(i)])
    }
  })
}

// ── 3. Khai triển Hình Chóp S.ABC ─────────────────────────
// Cần truyền độ dài các cạnh: SA, SB, SC, AB, BC, CA
// Thuật toán: Trải phẳng bằng giao điểm 2 đường tròn.
#let phanghoa-sabc(
  SA: 5, SB: 6, SC: 5.5,
  AB: 4, BC: 4.5, CA: 3.5,
  labels: ("S", "A", "B", "C1", "C2"),
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    
    // Hàm phụ: Tìm giao điểm 2 đường tròn
    let intersect-circles(P1, r1, P2, r2) = {
      let (x1, y1) = P1
      let (x2, y2) = P2
      let d = calc.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
      if d > r1 + r2 or d < calc.abs(r1 - r2) or d == 0 { return (P1, P1) } // Không cắt
      let a = (r1 * r1 - r2 * r2 + d * d) / (2 * d)
      let h = calc.sqrt(r1 * r1 - a * a)
      let x3 = x1 + a * (x2 - x1) / d
      let y3 = y1 + a * (y2 - y1) / d
      
      let pA = (x3 + h * (y2 - y1) / d, y3 - h * (x2 - x1) / d)
      let pB = (x3 - h * (y2 - y1) / d, y3 + h * (x2 - x1) / d)
      return (pA, pB)
    }
    
    // Hàm phụ: Tính tích có hướng (cross product Z) của 2 vector P1P2 và P1P3
    let cross-product(P1, P2, P3) = {
      return (P2.at(0) - P1.at(0)) * (P3.at(1) - P1.at(1)) - (P2.at(1) - P1.at(1)) * (P3.at(0) - P1.at(0))
    }
    
    // 1. Mặt phẳng gốc SAB
    let A = (0, 0)
    let B = (AB, 0)
    // S nằm ở đâu? Giao của (A, SA) và (B, SB). Chọn điểm có y > 0
    let (S1, S2) = intersect-circles(A, SA, B, SB)
    let S = if S1.at(1) > S2.at(1) { S1 } else { S2 }
    
    // 2. Lật mặt SBC ra phẳng (Quay quanh SB)
    // Phải tìm C1 sao cho BC1 = BC, SC1 = SC
    // C1 phải nằm khác phía với A so với đường SB. (Tích có hướng trái dấu)
    let (C1-A, C1-B) = intersect-circles(B, BC, S, SC)
    let cp-A = cross-product(S, B, A)
    let cp-C1-A = cross-product(S, B, C1-A)
    let C1 = if cp-A * cp-C1-A < 0 { C1-A } else { C1-B }
    
    // 3. Lật mặt SAC ra phẳng (Quay quanh SA)
    // Tìm C2 sao cho AC2 = CA, SC2 = SC
    // C2 phải nằm khác phía với B so với đường SA.
    let (C2-A, C2-B) = intersect-circles(A, CA, S, SC)
    let cp-B = cross-product(S, A, B)
    let cp-C2-A = cross-product(S, A, C2-A)
    let C2 = if cp-B * cp-C2-A < 0 { C2-A } else { C2-B }
    
    // Vẽ các mặt
    // Mặt SAB
    line(A, B, S, A, fill: rgb("#fff5ee"), stroke: 1.2pt + black)
    // Mặt SBC1
    line(B, C1, S, B, fill: rgb("#f0f8ff"), stroke: 1.2pt + black)
    // Mặt SAC2
    line(A, C2, S, A, fill: rgb("#f5fffa"), stroke: 1.2pt + black)
    
    // Vẽ đường chéo (đường đi ngắn nhất từ C2 đến C1)
    line(C2, C1, stroke: (paint: _ge-red, thickness: 1.2pt, dash: "dashed"))
    
    // Điểm và nhãn
    let pts = (S, A, B, C1, C2)
    for (i, p) in pts.enumerate() {
      circle(p, radius: 2.5pt, fill: black)
      let lbl = labels.at(i)
      let (dx, dy) = if lbl == "S" { (0, 0.4) }
        else if lbl == "A" { (-0.3, -0.3) }
        else if lbl == "B" { (0.3, -0.3) }
        else if lbl == "C1" { (0.4, 0.1) }
        else { (-0.4, 0.1) }
      content((p.at(0) + dx, p.at(1) + dy), text(size: 10pt, weight: "bold")[#lbl])
    }
  })
}
