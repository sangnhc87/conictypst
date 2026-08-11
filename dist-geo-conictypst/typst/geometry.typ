// ═══════════════════════════════════════════════════════════════════════════
// SANG-MATH GEOMETRY v1.1.0 — THƯ VIỆN HÌNH HỌC & ĐỒ HỌA TOÁN THPT SIÊU MẠNH MẼ
// (Dành cho Typst Universe @preview/sang-math)
// ═══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2"

// ── 0. CORE MATH UTILS & COLOR PALETTE ─────────────────────────────────────
#let linspace(start, stop, n) = {
  if n <= 1 { return (start,) }
  let step = (stop - start) / (n - 1)
  range(0, n).map(i => start + i * step)
}
#let lerp(a, b, t) = a + (b - a) * t
#let _get-lbl(labels, i, default) = {
  if labels != none and labels.len() > i { labels.at(i) } else { default }
}

// Bảng màu Sư phạm Modern Palette
#let sm-blue         = rgb("1e40af") // Xanh lam đậm (#1e40af)
#let sm-blue-light   = rgb("dbeafe") // Xanh lam nhạt fill
#let sm-green        = rgb("059669") // Xanh lá bảo ngọc (#059669)
#let sm-green-light  = rgb("d1fae5") // Xanh lá nhạt fill
#let sm-red          = rgb("e11d48") // Đỏ hồng thắm (#e11d48)
#let sm-red-light    = rgb("ffe4e6") // Đỏ hồng nhạt fill
#let sm-amber        = rgb("d97706") // Vàng cam hổ phách (#d97706)
#let sm-amber-light  = rgb("fef3c7") // Vàng nhạt fill
#let sm-purple       = rgb("7c3aed") // Tím thạch anh (#7c3aed)
#let sm-purple-light = rgb("ede9fe") // Tím nhạt fill
#let sm-gray         = rgb("64748b") // Xám đá
#let sm-gray-light   = rgb("f1f5f9") // Xám nhạt
#let sm-face-top     = rgb("bae6fd") // Mặt đỉnh 3D
#let sm-face-front   = rgb("e0f2fe") // Mặt trước 3D

#let _ge-scale = 0.75cm

// ── 1. GEOMETRY BASIC 2D & 3D ──────────────────────────────────────────────
#let tri-xyz(
  A, B, C,
  labels: ("A", "B", "C"),
  right-angle: none,
  show-altitude: false,
  fill-color: none,
  stroke-color: black,
  stroke-width: 1.2pt,
  show-points: true,
  scale: _ge-scale
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    if fill-color != none {
      line(A, B, C, close: true, fill: fill-color, stroke: stroke-width + stroke-color)
    } else {
      line(A, B, C, A, stroke: stroke-width + stroke-color)
    }
    
    if show-altitude {
      let (ax, ay) = A; let (bx, by) = B; let (cx, cy) = C
      let dx = bx - ax; let dy = by - ay
      let len2 = dx*dx + dy*dy
      if len2 > 0 {
        let t = ((cx - ax)*dx + (cy - ay)*dy) / len2
        let H = (ax + t*dx, ay + t*dy)
        line(C, H, stroke: (paint: sm-red, thickness: 1pt, dash: "dashed"))
        circle(H, radius: 2pt, fill: sm-red)
        content((H.at(0), H.at(1) - 0.3), text(size: 8.5pt, fill: sm-red, weight: "bold")[H])
        let v1 = (C.at(0) - H.at(0), C.at(1) - H.at(1))
        let v2 = (B.at(0) - H.at(0), B.at(1) - H.at(1))
        let l1 = calc.sqrt(v1.at(0)*v1.at(0) + v1.at(1)*v1.at(1))
        let l2 = calc.sqrt(v2.at(0)*v2.at(0) + v2.at(1)*v2.at(1))
        if l1 > 0 and l2 > 0 {
          let u1 = (v1.at(0)/l1 * 0.25, v1.at(1)/l1 * 0.25)
          let u2 = (v2.at(0)/l2 * 0.25, v2.at(1)/l2 * 0.25)
          let corner = (H.at(0) + u1.at(0) + u2.at(0), H.at(1) + u1.at(1) + u2.at(1))
          line(..((H.at(0) + u1.at(0), H.at(1) + u1.at(1)), corner, (H.at(0) + u2.at(0), H.at(1) + u2.at(1))), stroke: 0.7pt + sm-red)
        }
      }
    }

    if show-points {
      let l0 = _get-lbl(labels, 0, "A"); let l1 = _get-lbl(labels, 1, "B"); let l2 = _get-lbl(labels, 2, "C")
      for ((p, lbl)) in ((A, l0), (B, l1), (C, l2)) {
        circle(p, radius: 2.5pt, fill: stroke-color)
        let (x, y) = p
        let (dx, dy) = if p == A { (-0.3, -0.35) } else if p == B { (0.3, -0.35) } else { (0, 0.35) }
        content((x + dx, y + dy), text(size: 9pt, weight: "bold")[#lbl])
      }
    }
    if right-angle != none {
      let pts = (A, B, C)
      let i = if right-angle == "A" { 0 } else if right-angle == "B" { 1 } else if right-angle == "C" { 2 } else { -1 }
      if i >= 0 {
        let p = pts.at(i); let p1 = pts.at(calc.rem(i + 1, 3)); let p2 = pts.at(calc.rem(i + 2, 3))
        let v1 = (p1.at(0) - p.at(0), p1.at(1) - p.at(1)); let v2 = (p2.at(0) - p.at(0), p2.at(1) - p.at(1))
        let len1 = calc.sqrt(v1.at(0)*v1.at(0) + v1.at(1)*v1.at(1)); let len2 = calc.sqrt(v2.at(0)*v2.at(0) + v2.at(1)*v2.at(1))
        if len1 > 0 and len2 > 0 {
          let u1 = (v1.at(0)/len1 * 0.35, v1.at(1)/len1 * 0.35)
          let u2 = (v2.at(0)/len2 * 0.35, v2.at(1)/len2 * 0.35)
          let p-corner = (p.at(0) + u1.at(0) + u2.at(0), p.at(1) + u1.at(1) + u2.at(1))
          line(..((p.at(0) + u1.at(0), p.at(1) + u1.at(1)), p-corner, (p.at(0) + u2.at(0), p.at(1) + u2.at(1))), stroke: 0.8pt + black)
        }
      }
    }
  })
}

#let tri-angles(a, alpha, beta, labels: ("A", "B", "C"), fill-color: sm-blue-light, scale: _ge-scale) = {
  let gamma = 180deg - alpha - beta
  let b = a * calc.sin(beta) / calc.sin(gamma)
  let A = (0, 0); let B = (a, 0); let C = (b * calc.cos(alpha), b * calc.sin(alpha))
  tri-xyz(A, B, C, labels: labels, fill-color: fill-color, scale: scale)
}

#let tri-right(a: 4, b: 3, right-angle: "A", labels: ("A", "B", "C"), show-altitude: true, fill-color: sm-green-light, scale: _ge-scale) = {
  let A = (0, 0); let B = (a, 0); let C = (0, b)
  tri-xyz(A, B, C, labels: labels, right-angle: right-angle, show-altitude: show-altitude, fill-color: fill-color, scale: scale)
}

#let rect-abc(a: 4, b: 2.5, labels: ("A", "B", "C", "D"), show-diagonals: true, fill-color: sm-amber-light, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let A = (0, 0); let B = (a, 0); let C = (a, b); let D = (0, b)
    if fill-color != none {
      line(A, B, C, D, close: true, fill: fill-color, stroke: 1.2pt + black)
    } else {
      line(A, B, C, D, A, stroke: 1.2pt + black)
    }
    if show-diagonals {
      line(A, C, stroke: (paint: sm-gray, thickness: 1pt, dash: "dashed"))
      line(B, D, stroke: (paint: sm-gray, thickness: 1pt, dash: "dashed"))
      let O = (a/2, b/2)
      circle(O, radius: 2.5pt, fill: sm-amber)
      content((a/2, b/2 + 0.3), text(size: 8.5pt, fill: sm-amber, weight: "bold")[O])
    }
    for (p, lbl, dx, dy) in ((A, _get-lbl(labels,0,"A"), -0.3, -0.3), (B, _get-lbl(labels,1,"B"), 0.3, -0.3), (C, _get-lbl(labels,2,"C"), 0.3, 0.3), (D, _get-lbl(labels,3,"D"), -0.3, 0.3)) {
      circle(p, radius: 2.5pt, fill: black)
      content((p.at(0) + dx, p.at(1) + dy), text(size: 9pt, weight: "bold")[#lbl])
    }
  })
}

#let chóp-sabc(h: 3.5, a: 4, b: 2.5, labels: ("S", "A", "B", "C"), show-altitude: true, fill-base: sm-blue-light, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let A = (0, 0); let B = (1.8, -1.2); let C = (a, 0)
    let S = (0, h)
    if fill-base != none { line(A, B, C, close: true, fill: fill-base, stroke: none) }
    line(A, B, C, stroke: 1.2pt + black)
    line(A, C, stroke: (paint: luma(120), thickness: 1pt, dash: "dashed"))
    line(S, A, stroke: 1.2pt + black); line(S, B, stroke: 1.2pt + black); line(S, C, stroke: 1.2pt + black)

    if show-altitude {
      let H = (A.at(0), A.at(1))
      line(S, H, stroke: (paint: sm-red, thickness: 1.2pt, dash: "dashed"))
      circle(H, radius: 2.5pt, fill: sm-red)
    }

    for (p, lbl, dx, dy) in ((S, _get-lbl(labels,0,"S"), 0, 0.35), (A, _get-lbl(labels,1,"A"), -0.3, 0), (B, _get-lbl(labels,2,"B"), 0, -0.35), (C, _get-lbl(labels,3,"C"), 0.3, 0)) {
      circle(p, radius: 2.5pt, fill: black)
      content((p.at(0) + dx, p.at(1) + dy), text(size: 9pt, weight: "bold")[#lbl])
    }
  })
}

#let chóp-sabcd(h: 3.5, w: 4, d: 2, labels: ("S", "A", "B", "C", "D"), show-altitude: true, show-diagonals: true, fill-base: sm-purple-light, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let A = (0, 0); let B = (1.5, -1.2); let C = (w + 1.5, -1.2); let D = (w, 0)
    let S = (w/2, h); let O = (w/2 + 0.75, -0.6)
    if fill-base != none { line(A, B, C, D, close: true, fill: fill-base, stroke: none) }
    line(A, B, C, D, stroke: 1.2pt + black)
    line(A, D, stroke: (paint: luma(120), thickness: 1pt, dash: "dashed"))
    line(S, A, stroke: 1.2pt + black); line(S, B, stroke: 1.2pt + black); line(S, C, stroke: 1.2pt + black); line(S, D, stroke: 1.2pt + black)

    if show-diagonals {
      line(A, C, stroke: (paint: sm-gray, thickness: 0.8pt, dash: "dashed"))
      line(B, D, stroke: (paint: sm-gray, thickness: 0.8pt, dash: "dashed"))
      circle(O, radius: 2pt, fill: sm-gray)
      content((O.at(0), O.at(1) - 0.25), text(size: 8.5pt, fill: sm-gray, weight: "bold")[O])
    }
    if show-altitude { line(S, O, stroke: (paint: sm-red, thickness: 1.2pt, dash: "dashed")) }

    for (p, lbl, dx, dy) in ((S, _get-lbl(labels,0,"S"), 0, 0.35), (A, _get-lbl(labels,1,"A"), -0.3, 0.2), (B, _get-lbl(labels,2,"B"), -0.2, -0.35), (C, _get-lbl(labels,3,"C"), 0.3, -0.35), (D, _get-lbl(labels,4,"D"), 0.3, 0.2)) {
      circle(p, radius: 2.5pt, fill: black)
      content((p.at(0) + dx, p.at(1) + dy), text(size: 9pt, weight: "bold")[#lbl])
    }
  })
}

#let lang-tru-abc(h: 3.5, a: 3.5, b: 2.2, labels: ("A", "B", "C", "A'", "B'", "C'"), fill-top: sm-face-top, fill-bottom: sm-blue-light, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let A = (0, 0); let B = (1.6, -1.2); let C = (a, 0)
    let A1 = (0, h); let B1 = (1.6, h - 1.2); let C1 = (a, h)
    if fill-bottom != none { line(A, B, C, close: true, fill: fill-bottom, stroke: none) }
    if fill-top != none { line(A1, B1, C1, close: true, fill: fill-top, stroke: none) }
    line(A, B, C, stroke: 1.2pt + black)
    line(A, C, stroke: (paint: luma(120), thickness: 1pt, dash: "dashed"))
    line(A1, B1, C1, A1, stroke: 1.2pt + black)
    line(A, A1, stroke: 1.2pt + black); line(B, B1, stroke: 1.2pt + black); line(C, C1, stroke: 1.2pt + black)

    for (p, lbl, dx, dy) in (
      (A, _get-lbl(labels,0,"A"), -0.3, 0), (B, _get-lbl(labels,1,"B"), 0, -0.35), (C, _get-lbl(labels,2,"C"), 0.3, 0),
      (A1, _get-lbl(labels,3,"A'"), -0.3, 0.2), (B1, _get-lbl(labels,4,"B'"), 0, 0.35), (C1, _get-lbl(labels,5,"C'"), 0.3, 0.2)
    ) {
      circle(p, radius: 2.5pt, fill: black)
      content((p.at(0) + dx, p.at(1) + dy), text(size: 9pt, weight: "bold")[#lbl])
    }
  })
}

#let circle-desc(r: 2, label: "O", show-radius: true, show-diameter: false, fill-color: sm-blue-light, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    if fill-color != none { circle((0,0), radius: r, fill: fill-color, stroke: 1.2pt + black) } else { circle((0,0), radius: r, stroke: 1.2pt + black) }
    circle((0,0), radius: 2.5pt, fill: black)
    if show-radius {
      line((0,0), (r, 0), stroke: 1.2pt + sm-blue)
      circle((r,0), radius: 2.5pt, fill: sm-blue)
      content((r/2, 0.25), text(size: 8.5pt, fill: sm-blue, weight: "bold")[$r$])
    }
    if show-diameter {
      line((-r, 0), (r, 0), stroke: (paint: sm-red, thickness: 1pt, dash: "dashed"))
      content((-r/2, -0.25), text(size: 8.5pt, fill: sm-red)[$d$])
    }
    content((-0.3, -0.3), text(size: 9pt, weight: "bold")[#label])
  })
}

#let angle-mark(A, O, B, radius: 0.5, label: none, stroke-style: 0.8pt + black) = {
  import cetz.draw: *
  let v1 = (A.at(0) - O.at(0), A.at(1) - O.at(1))
  let v2 = (B.at(0) - O.at(0), B.at(1) - O.at(1))
  let a1 = calc.atan2(v1.at(0), v1.at(1))
  let a2 = calc.atan2(v2.at(0), v2.at(1))
  group({
    stroke(stroke-style)
    arc(O, start: a1, stop: a2, radius: radius)
    if label != none {
      let mid-angle = (a1 + a2) / 2
      let lx = O.at(0) + (radius + 0.25) * calc.cos(mid-angle)
      let ly = O.at(1) + (radius + 0.25) * calc.sin(mid-angle)
      content((lx, ly), text(size: 8.5pt)[#label])
    }
  })
}

#let right-angle(A, O, B, size: 0.3, stroke-style: 0.8pt + black) = {
  import cetz.draw: *
  let v1 = (A.at(0) - O.at(0), A.at(1) - O.at(1))
  let v2 = (B.at(0) - O.at(0), B.at(1) - O.at(1))
  let len1 = calc.sqrt(v1.at(0)*v1.at(0) + v1.at(1)*v1.at(1))
  let len2 = calc.sqrt(v2.at(0)*v2.at(0) + v2.at(1)*v2.at(1))
  if len1 > 0 and len2 > 0 {
    let u1 = (v1.at(0)/len1 * size, v1.at(1)/len1 * size)
    let u2 = (v2.at(0)/len2 * size, v2.at(1)/len2 * size)
    let p-corner = (O.at(0) + u1.at(0) + u2.at(0), O.at(1) + u1.at(1) + u2.at(1))
    group({
      line(..((O.at(0) + u1.at(0), O.at(1) + u1.at(1)), p-corner, (O.at(0) + u2.at(0), O.at(1) + u2.at(1))), stroke: stroke-style)
    })
  }
}

#let seg-label(A, B, label, pos: 0.5, offset: (0, 0.3)) = {
  import cetz.draw: *
  let mx = lerp(A.at(0), B.at(0), pos) + offset.at(0)
  let my = lerp(A.at(1), B.at(1), pos) + offset.at(1)
  group({ content((mx, my), text(size: 9pt)[#label]) })
}

#let point-label(p, label, offset: (0.25, 0.25)) = {
  import cetz.draw: *
  group({
    circle(p, radius: 2.5pt, fill: black)
    content((p.at(0) + offset.at(0), p.at(1) + offset.at(1)), text(size: 9pt, weight: "bold")[#label])
  })
}

#let draw-axis-xy(xmin, xmax, ymin, ymax, labels: ($x$, $y$), show-grid: false, grid-step: 1) = {
  import cetz.draw: *
  group({
    if show-grid {
      let x = calc.ceil(xmin)
      while x <= xmax {
        if x != 0 { line((x, ymin), (x, ymax), stroke: (paint: rgb("e2e8f0"), thickness: 0.5pt, dash: "dotted")) }
        x += grid-step
      }
      let y = calc.ceil(ymin)
      while y <= ymax {
        if y != 0 { line((xmin, y), (xmax, y), stroke: (paint: rgb("e2e8f0"), thickness: 0.5pt, dash: "dotted")) }
        y += grid-step
      }
    }
    line((xmin, 0), (xmax, 0), mark: (end: "stealth"), stroke: 1.2pt + black)
    line((0, ymin), (0, ymax), mark: (end: "stealth"), stroke: 1.2pt + black)
    content((xmax + 0.3, 0), text(size: 9.5pt, style: "italic", weight: "bold")[#labels.at(0)])
    content((0, ymax + 0.3), text(size: 9.5pt, style: "italic", weight: "bold")[#labels.at(1)])
    content((-0.25, -0.25), text(size: 9pt, weight: "bold")[O])
  })
}

#let axis-xy(xmin, xmax, ymin, ymax, labels: ($x$, $y$), show-grid: false, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    draw-axis-xy(xmin, xmax, ymin, ymax, labels: labels, show-grid: show-grid)
  })
}

// ── 2. CONICS 2D ───────────────────────────────────────────────────────────
#let draw-parabola(
  name: "par", a: 0.5, h: 0, k: -1, x-range: (-3.0, 3.0),
  color: sm-blue, stroke-width: 1.5pt, label-vertex: [$P$],
  show-focus: true, fill-area: none
) = {
  import cetz.draw: *
  let xs = linspace(x-range.at(0), x-range.at(1), 60)
  let pts = xs.map(x => (x, a * (x - h) * (x - h) + k))
  group({
    if fill-area != none {
      line((x-range.at(0), 0), ..pts, (x-range.at(1), 0), close: true, fill: fill-area, stroke: none)
    }
    line(..pts, stroke: stroke-width + color)
    if label-vertex != none {
      circle((h, k), radius: 2.5pt, fill: color)
      let dy = if a > 0 { -0.35 } else { 0.35 }
      content((h, k + dy), text(size: 9pt, weight: "bold", fill: color)[#label-vertex])
    }
    if show-focus {
      let fy = k + 1 / (4 * a)
      circle((h, fy), radius: 2.5pt, fill: sm-red)
      content((h + 0.3, fy), text(size: 8.5pt, fill: sm-red, weight: "bold")[$F$])
    }
  })
}

#let draw-ellipse(
  name: "el", a: 3, b: 2, center: (0, 0),
  color: sm-green, stroke-width: 1.5pt, fill-color: sm-green-light, show-foci: true
) = {
  import cetz.draw: *
  let pts = linspace(0, 2 * calc.pi, 80).map(t => (
    center.at(0) + a * calc.cos(t),
    center.at(1) + b * calc.sin(t)
  ))
  group({
    if fill-color != none {
      line(..pts, close: true, fill: fill-color, stroke: stroke-width + color)
    } else {
      line(..pts, stroke: stroke-width + color)
    }
    circle(center, radius: 2.5pt, fill: color)
    if show-foci and a > b {
      let c = calc.sqrt(a * a - b * b)
      let F1 = (center.at(0) - c, center.at(1))
      let F2 = (center.at(0) + c, center.at(1))
      circle(F1, radius: 2.5pt, fill: sm-red)
      circle(F2, radius: 2.5pt, fill: sm-red)
      content((F1.at(0), F1.at(1) - 0.35), text(size: 8.5pt, fill: sm-red, weight: "bold")[$F_1$])
      content((F2.at(0), F2.at(1) - 0.35), text(size: 8.5pt, fill: sm-red, weight: "bold")[$F_2$])
    }
  })
}

#let draw-hyperbola(
  name: "hyp", a: 2, b: 1.5, x-max: 4.0,
  color: sm-red, stroke-width: 1.5pt, show-asymptotes: true, show-foci: true
) = {
  import cetz.draw: *
  let steps = 40
  let ts = linspace(-1.4, 1.4, steps)
  let branch-right = ts.map(t => (a * calc.cosh(t), b * calc.sinh(t)))
  let branch-left  = ts.map(t => (-a * calc.cosh(t), b * calc.sinh(t)))
  group({
    if show-asymptotes {
      let k = b / a
      line((-x-max, -k * x-max), (x-max, k * x-max), stroke: (paint: sm-gray, thickness: 0.8pt, dash: "dashed"))
      line((-x-max, k * x-max), (x-max, -k * x-max), stroke: (paint: sm-gray, thickness: 0.8pt, dash: "dashed"))
    }
    line(..branch-right, stroke: stroke-width + color)
    line(..branch-left,  stroke: stroke-width + color)
    if show-foci {
      let c = calc.sqrt(a * a + b * b)
      circle((-c, 0), radius: 2.5pt, fill: sm-amber)
      circle((c, 0), radius: 2.5pt, fill: sm-amber)
      content((-c, -0.35), text(size: 8.5pt, fill: sm-amber, weight: "bold")[$F_1$])
      content((c, -0.35), text(size: 8.5pt, fill: sm-amber, weight: "bold")[$F_2$])
    }
  })
}

// ── 3. REVOLUTION 3D & TRẢI PHẲNG (UNFOLDED NETS) ──────────────────────────
#let draw-cylinder(
  name: "cyl", center: (0, 0), radius: 2, height: 4,
  color: sm-blue, stroke-width: 1.5pt, fill-top: sm-face-top, fill-body: sm-blue-light, persp: 0.35, show-axis: true
) = {
  import cetz.draw: *
  let (cx, cy) = center
  let ry = radius * persp
  let pts-top = linspace(0, 2 * calc.pi, 60).map(t => (cx + radius * calc.cos(t), cy + height + ry * calc.sin(t)))
  let pts-bot-front = linspace(calc.pi, 2 * calc.pi, 30).map(t => (cx + radius * calc.cos(t), cy + ry * calc.sin(t)))
  let pts-bot-back  = linspace(0, calc.pi, 30).map(t => (cx + radius * calc.cos(t), cy + ry * calc.sin(t)))
  
  group(name: name, {
    if fill-body != none {
      line((cx - radius, cy), ..pts-bot-front, (cx + radius, cy), (cx + radius, cy + height), ..pts-top.rev(), (cx - radius, cy + height), close: true, fill: fill-body, stroke: none)
    }
    if fill-top != none {
      line(..pts-top, close: true, fill: fill-top, stroke: stroke-width + color)
    } else {
      line(..pts-top, stroke: stroke-width + color)
    }
    line(..pts-bot-front, stroke: stroke-width + color)
    line(..pts-bot-back, stroke: (paint: color, thickness: stroke-width, dash: "dashed"))
    line((cx - radius, cy), (cx - radius, cy + height), stroke: stroke-width + color)
    line((cx + radius, cy), (cx + radius, cy + height), stroke: stroke-width + color)
    if show-axis {
      line((cx, cy), (cx, cy + height), stroke: (paint: sm-red, thickness: 1.2pt, dash: "dashed"))
    }
    circle((cx, cy), radius: 2.5pt, fill: color)
    circle((cx, cy + height), radius: 2.5pt, fill: color)

    anchor("bottom",    (cx, cy))
    anchor("top",       (cx, cy + height))
    anchor("center",    (cx, cy + height / 2))
    anchor("bot-left",  (cx - radius, cy))
    anchor("bot-right", (cx + radius, cy))
    anchor("top-left",  (cx - radius, cy + height))
    anchor("top-right", (cx + radius, cy + height))
  })
}

#let draw-cone(
  name: "cone", center: (0, 0), radius: 2.5, height: 4,
  color: sm-red, stroke-width: 1.5pt, fill-base: sm-red-light, persp: 0.35, show-axis: true
) = {
  import cetz.draw: *
  let (cx, cy) = center
  let ry = radius * persp
  let apex = (cx, cy + height)
  let pts-bot-front = linspace(calc.pi, 2 * calc.pi, 30).map(t => (cx + radius * calc.cos(t), cy + ry * calc.sin(t)))
  let pts-bot-back  = linspace(0, calc.pi, 30).map(t => (cx + radius * calc.cos(t), cy + ry * calc.sin(t)))
  let pts-full-bot  = linspace(0, 2 * calc.pi, 60).map(t => (cx + radius * calc.cos(t), cy + ry * calc.sin(t)))

  group(name: name, {
    if fill-base != none {
      line(..pts-full-bot, close: true, fill: fill-base, stroke: none)
    }
    line(..pts-bot-front, stroke: stroke-width + color)
    line(..pts-bot-back, stroke: (paint: color, thickness: stroke-width, dash: "dashed"))
    line((cx - radius, cy), apex, stroke: stroke-width + color)
    line((cx + radius, cy), apex, stroke: stroke-width + color)
    if show-axis {
      line((cx, cy), apex, stroke: (paint: sm-gray, thickness: 1.2pt, dash: "dashed"))
      line((cx, cy), (cx + radius, cy), stroke: (paint: sm-gray, thickness: 1.2pt, dash: "dashed"))
    }
    circle((cx, cy), radius: 2.5pt, fill: color)
    circle(apex, radius: 2.5pt, fill: color)

    anchor("apex",   apex)
    anchor("center", (cx, cy))
    anchor("left",   (cx - radius, cy))
    anchor("right",  (cx + radius, cy))
  })
}

#let draw-truncated-cone(
  name: "tcone", center: (0, 0), r1: 2.5, r2: 1.2, height: 3.5,
  color: sm-purple, stroke-width: 1.5pt, fill-top: sm-face-top, fill-body: sm-purple-light, persp: 0.35
) = {
  import cetz.draw: *
  let (cx, cy) = center
  let ry1 = r1 * persp; let ry2 = r2 * persp
  let pts-top = linspace(0, 2 * calc.pi, 60).map(t => (cx + r2 * calc.cos(t), cy + height + ry2 * calc.sin(t)))
  let pts-bot-front = linspace(calc.pi, 2 * calc.pi, 30).map(t => (cx + r1 * calc.cos(t), cy + ry1 * calc.sin(t)))
  let pts-bot-back  = linspace(0, calc.pi, 30).map(t => (cx + r1 * calc.cos(t), cy + ry1 * calc.sin(t)))

  group(name: name, {
    if fill-body != none {
      line((cx - r1, cy), ..pts-bot-front, (cx + r1, cy), (cx + r2, cy + height), ..pts-top.rev(), (cx - r2, cy + height), close: true, fill: fill-body, stroke: none)
    }
    if fill-top != none {
      line(..pts-top, close: true, fill: fill-top, stroke: stroke-width + color)
    } else {
      line(..pts-top, stroke: stroke-width + color)
    }
    line(..pts-bot-front, stroke: stroke-width + color)
    line(..pts-bot-back, stroke: (paint: color, thickness: stroke-width, dash: "dashed"))
    line((cx - r1, cy), (cx - r2, cy + height), stroke: stroke-width + color)
    line((cx + r1, cy), (cx + r2, cy + height), stroke: stroke-width + color)
  })
}

#let draw-sphere(
  name: "sph", center: (0, 0), radius: 2.5,
  color: sm-green, stroke-width: 1.5pt, fill-sphere: sm-green-light, persp: 0.3
) = {
  import cetz.draw: *
  let (cx, cy) = center
  let ry = radius * persp
  let pts-front = linspace(calc.pi, 2 * calc.pi, 30).map(t => (cx + radius * calc.cos(t), cy + ry * calc.sin(t)))
  let pts-back  = linspace(0, calc.pi, 30).map(t => (cx + radius * calc.cos(t), cy + ry * calc.sin(t)))
  group(name: name, {
    if fill-sphere != none {
      circle(center, radius: radius, fill: fill-sphere, stroke: stroke-width + color)
    } else {
      circle(center, radius: radius, stroke: stroke-width + color)
    }
    line(..pts-front, stroke: 1.2pt + color)
    line(..pts-back, stroke: (paint: color, thickness: 1.2pt, dash: "dashed"))
    circle(center, radius: 2.5pt, fill: color)

    anchor("center", (cx, cy))
    anchor("top",    (cx, cy + radius))
    anchor("bottom", (cx, cy - radius))
    anchor("left",   (cx - radius, cy))
    anchor("right",  (cx + radius, cy))
  })
}

// ── Hình Trải Phẳng (Unfolded Nets) ───────────────
#let net-cylinder(r: 1.5, h: 4, fill-body: sm-blue-light, fill-base: sm-face-top, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let w = 2 * calc.pi * r * 0.45 // Tỷ lệ thu nhỏ chiều dài 2πr
    rect((0, 0), (w, h), fill: fill-body, stroke: 1.2pt + sm-blue)
    circle((w/2, h + r), radius: r, fill: fill-base, stroke: 1.2pt + sm-blue)
    circle((w/2, -r), radius: r, fill: fill-base, stroke: 1.2pt + sm-blue)
    content((w/2, h/2), text(size: 8.5pt, fill: sm-blue, weight: "bold")[$2 pi r times h$])
    content((w/2, h + r), text(size: 8.5pt, fill: sm-blue, weight: "bold")[$S_1$])
    content((w/2, -r), text(size: 8.5pt, fill: sm-blue, weight: "bold")[$S_2$])
  })
}

#let net-cone(r: 1.5, s: 3.5, fill-body: sm-red-light, fill-base: sm-amber-light, scale: _ge-scale) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let theta = (r / s) * 360deg
    let half = theta / 2
    let start-angle = 90deg - half
    let stop-angle = 90deg + half
    arc((0, 0), start: start-angle, stop: stop-angle, radius: s, fill: fill-body, stroke: 1.2pt + sm-red)
    line((0, 0), (s * calc.cos(start-angle), s * calc.sin(start-angle)), stroke: 1.2pt + sm-red)
    line((0, 0), (s * calc.cos(stop-angle), s * calc.sin(stop-angle)), stroke: 1.2pt + sm-red)
    let mid-y = s * calc.sin(90deg)
    circle((0, mid-y + r), radius: r, fill: fill-base, stroke: 1.2pt + sm-red)
    circle((0, 0), radius: 2.5pt, fill: sm-red)
    content((0, -0.3), text(size: 9pt, weight: "bold", fill: sm-red)[$S$])
    content((0, mid-y + r), text(size: 8.5pt, weight: "bold", fill: sm-red)[Đáy $r$])
  })
}

// ── 4. CURVES 3D & HELIX & SPRING ──────────────────────────────────────────
#let helix-points(
  center: (0, 0), radius: 2, height: 4, loops: 1.5, steps: 60, persp-y: 0.3, offset-angle: calc.pi
) = {
  let (cx, cy) = center
  let total-angle = loops * 2 * calc.pi
  let ts = linspace(0, 1, steps + 1)
  ts.map(t => {
    let angle = offset-angle + t * total-angle
    let x = cx + radius * calc.cos(angle)
    let y = cy + t * height + radius * persp-y * calc.sin(angle)
    (x, y)
  })
}

#let helix-split-visible(pts, loops: 1.5, offset-angle: calc.pi) = {
  let n = pts.len()
  let total-angle = loops * 2 * calc.pi
  let vis-segs = (); let hid-segs = ()
  let cur = (); let cur-front = none

  for i in range(0, n) {
    let t = if n > 1 { i / (n - 1) } else { 0.0 }
    let angle = offset-angle + t * total-angle
    let is-front = calc.sin(angle) >= 0
    let pt = pts.at(i)
    if cur-front == none {
      cur = (pt,); cur-front = is-front
    } else if is-front == cur-front {
      cur += (pt,)
    } else {
      cur += (pt,)
      if cur.len() >= 2 {
        if cur-front { vis-segs += (cur,) } else { hid-segs += (cur,) }
      }
      cur = (pt,); cur-front = is-front
    }
  }
  if cur.len() >= 2 {
    if cur-front { vis-segs += (cur,) } else { hid-segs += (cur,) }
  }
  (vis-segs, hid-segs)
}

#let draw-helix(
  center: (0, 0), radius: 2, height: 4, loops: 1.5, steps: 80,
  color: sm-red, stroke-width: 1.8pt, auto-dashed: true, persp-y: 0.3, offset-angle: calc.pi
) = {
  import cetz.draw: *
  let pts = helix-points(center: center, radius: radius, height: height, loops: loops, steps: steps, persp-y: persp-y, offset-angle: offset-angle)
  group({
    if auto-dashed {
      let (vis-segs, hid-segs) = helix-split-visible(pts, loops: loops, offset-angle: offset-angle)
      for seg in vis-segs { if seg.len() >= 2 { line(..seg, stroke: stroke-width + color) } }
      for seg in hid-segs { if seg.len() >= 2 { line(..seg, stroke: (dash: "dashed", paint: color, thickness: stroke-width)) } }
    } else {
      line(..pts, stroke: stroke-width + color)
    }
  })
}

#let draw-spring(
  center: (0, 0), radius: 1.2, height: 5, loops: 4, color: sm-blue, stroke-width: 2.2pt, steps: 120
) = {
  draw-helix(center: center, radius: radius, height: height, loops: loops, color: color, stroke-width: stroke-width, steps: steps, auto-dashed: false, persp-y: 0.5)
}
