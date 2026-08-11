// ═════════════════════════════════════════════════════════════════════════════
// 3D: SURFACES
// Các mặt cong đặc biệt: yên ngựa, paraboloid...
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw
#import "../core/utils.typ": range
#import "../core/projections.typ": project-isometric

/// Vẽ mặt yên ngựa (saddle surface) z = x^2 - y^2 dạng lưới.
/// - name (string): Tên nhóm.
/// - x-range (array): Khoảng x [xmin, xmax].
/// - y-range (array): Khoảng y [ymin, ymax].
/// - samples (int): Số điểm trên mỗi trục.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-saddle(
  name: "saddle",
  x-range: (-2, 2),
  y-range: (-2, 2),
  samples: 20,
  stroke: black,
) = {
  let (xmin, xmax) = x-range
  let (ymin, ymax) = y-range

  draw.group(name: name, {
    // Lưới theo trục x
    for i in range(0, samples + 1) {
      let x = xmin + (xmax - xmin) * i / samples
      let pts = range(0, samples + 1).map(j => {
        let y = ymin + (ymax - ymin) * j / samples
        let z = x * x - y * y
        project-isometric((x, y, z))
      })
      draw.line(..pts, stroke: stroke)
    }

    // Lưới theo trục y
    for j in range(0, samples + 1) {
      let y = ymin + (ymax - ymin) * j / samples
      let pts = range(0, samples + 1).map(i => {
        let x = xmin + (xmax - xmin) * i / samples
        let z = x * x - y * y
        project-isometric((x, y, z))
      })
      draw.line(..pts, stroke: stroke)
    }

    draw.anchor("center", project-isometric((0, 0, 0)))
  })
}

/// Vẽ paraboloid elliptic z = (x^2/a^2 + y^2/b^2) dạng lưới.
/// - name (string): Tên nhóm.
/// - a (float): Bán trục x.
/// - b (float): Bán trục y.
/// - z-max (float): Độ cao tối đa.
/// - samples (int): Số điểm mẫu.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-paraboloid(
  name: "paraboloid",
  a: 2,
  b: 2,
  z-max: 4,
  samples: 24,
  stroke: black,
) = {
  draw.group(name: name, {
    let n = samples
    for i in range(0, n + 1) {
      let theta = 2 * calc.pi * i / n
      let pts = range(0, n + 1).map(j => {
        let t = j / n
        let r = t * calc.sqrt(z-max)
        let x = a * r * calc.cos(theta)
        let y = b * r * calc.sin(theta)
        let z = x * x / (a * a) + y * y / (b * b)
        project-isometric((x, y, z))
      })
      draw.line(..pts, stroke: stroke)
    }

    for j in range(0, n + 1) {
      let r = calc.sqrt(z-max) * j / n
      let pts = range(0, n + 1).map(i => {
        let theta = 2 * calc.pi * i / n
        let x = a * r * calc.cos(theta)
        let y = b * r * calc.sin(theta)
        let z = x * x / (a * a) + y * y / (b * b)
        project-isometric((x, y, z))
      })
      draw.line(..pts, stroke: stroke)
    }

    draw.anchor("center", project-isometric((0, 0, 0)))
  })
}
