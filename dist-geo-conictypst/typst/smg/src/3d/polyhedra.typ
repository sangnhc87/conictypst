// ═════════════════════════════════════════════════════════════════════════════
// 3D: POLYHEDRA
// Các khối đa diện: chóp, chóp cụt, lăng trụ
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw
#import "../core/utils.typ": deg-to-rad, range
#import "../core/projections.typ": project-isometric

/// Vẽ khối chóp cụt tứ giác đều (truncated pyramid).
/// - name (string): Tên nhóm.
/// - base-size (float): Cạnh đáy lớn.
/// - top-size (float): Cạnh đáy nhỏ (mặt trên).
/// - height (float): Chiều cao.
/// - center (array): Tâm đáy dưới (x, y, z).
/// - stroke (stroke): Kiểu nét vẽ.
/// - fill (color): Màu tô mặt bên.
/// -> group
#let draw-truncated-pyramid(
  name: "trunc-pyramid",
  base-size: 4,
  top-size: 2,
  height: 3,
  center: (0, 0, 0),
  stroke: black,
  fill: none,
) = {
  let (cx, cy, cz) = center
  let half-base = base-size / 2
  let half-top = top-size / 2

  // 8 đỉnh
  let A = (cx - half-base, cy - half-base, cz)
  let B = (cx + half-base, cy - half-base, cz)
  let C = (cx + half-base, cy + half-base, cz)
  let D = (cx - half-base, cy + half-base, cz)
  let E = (cx - half-top, cy - half-top, cz + height)
  let F = (cx + half-top, cy - half-top, cz + height)
  let G = (cx + half-top, cy + half-top, cz + height)
  let H = (cx - half-top, cy + half-top, cz + height)

  let pts = (A, B, C, D, E, F, G, H).map(project-isometric)
  let (a, b, c, d, e, f, g, h) = pts

  draw.group(name: name, {
    // Đáy dưới
    draw.line(a, b, c, d, close: true, stroke: stroke)
    // Đáy trên
    draw.line(e, f, g, h, close: true, stroke: stroke)
    // Các cạnh bên
    draw.line(a, e, stroke: stroke)
    draw.line(b, f, stroke: stroke)
    draw.line(c, g, stroke: stroke)
    draw.line(d, h, stroke: (paint: stroke, dash: "dashed"))

    // Tô mặt bên nếu có
    if fill != none {
      draw.line(a, b, f, e, close: true, fill: fill, stroke: none)
      draw.line(b, c, g, f, close: true, fill: fill, stroke: none)
    }

    // Anchor
    draw.anchor("bottom-center", project-isometric((cx, cy, cz)))
    draw.anchor("top-center", project-isometric((cx, cy, cz + height)))
    draw.anchor("A", a)
    draw.anchor("B", b)
    draw.anchor("C", c)
    draw.anchor("D", d)
    draw.anchor("E", e)
    draw.anchor("F", f)
    draw.anchor("G", g)
    draw.anchor("H", h)
  })
}

/// Vẽ khối chóp tứ giác đều.
/// - name (string): Tên nhóm.
/// - base-size (float): Cạnh đáy.
/// - height (float): Chiều cao.
/// - center (array): Tâm đáy.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-pyramid(
  name: "pyramid",
  base-size: 4,
  height: 4,
  center: (0, 0, 0),
  stroke: black,
) = {
  let (cx, cy, cz) = center
  let half = base-size / 2
  let A = (cx - half, cy - half, cz)
  let B = (cx + half, cy - half, cz)
  let C = (cx + half, cy + half, cz)
  let D = (cx - half, cy + half, cz)
  let S = (cx, cy, cz + height)

  let pts = (A, B, C, D, S).map(project-isometric)
  let (a, b, c, d, s) = pts

  draw.group(name: name, {
    draw.line(a, b, c, stroke: stroke)
    draw.line(c, d, a, stroke: (paint: stroke, dash: "dashed"))
    draw.line(a, s, stroke: stroke)
    draw.line(b, s, stroke: stroke)
    draw.line(c, s, stroke: stroke)
    draw.line(d, s, stroke: (paint: stroke, dash: "dashed"))

    draw.anchor("apex", s)
    draw.anchor("A", a)
    draw.anchor("B", b)
    draw.anchor("C", c)
    draw.anchor("D", d)
    draw.anchor("center", project-isometric((cx, cy, cz)))
  })
}
