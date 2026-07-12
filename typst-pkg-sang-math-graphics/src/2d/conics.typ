// ═════════════════════════════════════════════════════════════════════════════
// 2D: CONICS
// Các hàm vẽ conic cơ bản: Parabol, Elip, Hyperbol
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw
#import "../core/utils.typ": deg-to-rad, range

/// Vẽ parabol y = a*x^2 + b*x + c.
/// - a (float): Hệ số bậc 2.
/// - b (float): Hệ số bậc 1.
/// - c (float): Hệ số tự do.
/// - x-range (array): Khoảng x [xmin, xmax].
/// - samples (int): Số điểm mẫu.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-parabola(
  a: 1,
  b: 0,
  c: 0,
  x-range: (-3, 3),
  samples: 80,
  stroke: black,
) = {
  let (xmin, xmax) = x-range
  let pts = range(0, samples).map(i => {
    let t = i / (samples - 1)
    let x = xmin + (xmax - xmin) * t
    let y = a * x * x + b * x + c
    (x, y)
  })
  draw.group({
    draw.line(..pts, stroke: stroke)
  })
}

/// Vẽ elip tâm O, bán trục a, b.
/// - center (array): Tâm (x, y).
/// - a (float): Bán trục lớn.
/// - b (float): Bán trục nhỏ.
/// - angle (float): Góc xoay (độ).
/// - samples (int): Số điểm mẫu.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-ellipse(
  center: (0, 0),
  a: 3,
  b: 2,
  angle: 0,
  samples: 100,
  stroke: black,
) = {
  let (cx, cy) = center
  let pts = range(0, samples).map(i => {
    let t = 2 * calc.pi * i / (samples - 1)
    let rad = deg-to-rad(angle)
    let x = a * calc.cos(t)
    let y = b * calc.sin(t)
    let xr = x * calc.cos(rad) - y * calc.sin(rad) + cx
    let yr = x * calc.sin(rad) + y * calc.cos(rad) + cy
    (xr, yr)
  })
  draw.group({
    draw.line(..pts, stroke: stroke, close: true)
  })
}

/// Vẽ nhánh hyperbol x^2/a^2 - y^2/b^2 = 1.
/// - a (float): Bán trục thực.
/// - b (float): Bán trục ảo.
/// - x-range (array): Khoảng x [xmin, xmax], |x| > a.
/// - samples (int): Số điểm mẫu.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-hyperbola(
  a: 1,
  b: 1,
  x-range: (1.2, 4),
  samples: 80,
  stroke: black,
) = {
  let (xmin, xmax) = x-range
  let pts-right = range(0, samples).map(i => {
    let t = i / (samples - 1)
    let x = xmin + (xmax - xmin) * t
    let y = b * calc.sqrt(x * x / (a * a) - 1)
    (x, y)
  })
  let pts-right-lower = range(0, samples).map(i => {
    let t = i / (samples - 1)
    let x = xmin + (xmax - xmin) * t
    let y = -b * calc.sqrt(x * x / (a * a) - 1)
    (x, y)
  })
  let pts-left = range(0, samples).map(i => {
    let t = i / (samples - 1)
    let x = -xmin - (xmax - xmin) * t
    let y = b * calc.sqrt(x * x / (a * a) - 1)
    (x, y)
  })
  let pts-left-lower = range(0, samples).map(i => {
    let t = i / (samples - 1)
    let x = -xmin - (xmax - xmin) * t
    let y = -b * calc.sqrt(x * x / (a * a) - 1)
    (x, y)
  })
  draw.group({
    draw.line(..pts-right, stroke: stroke)
    draw.line(..pts-right-lower, stroke: stroke)
    draw.line(..pts-left, stroke: stroke)
    draw.line(..pts-left-lower, stroke: stroke)
  })
}
