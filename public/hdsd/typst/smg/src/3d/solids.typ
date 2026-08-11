// ═════════════════════════════════════════════════════════════════════════════
// 3D: SOLIDS
// Các hình khối cơ bản: nón, trụ, cầu với anchor
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw
#import "../core/utils.typ": deg-to-rad, range
#import "../core/projections.typ": project-isometric

/// Vẽ hình nón 3D với các anchor để người dùng móc nối thêm.
/// - name (string): Tên nhóm để tham chiếu anchor.
/// - radius (float): Bán kính đáy.
/// - height (float): Chiều cao hình nón.
/// - center (array): Tâm đáy (x, y, z).
/// - samples (int): Số điểm trên đường tròn đáy.
/// - stroke (stroke): Kiểu nét vẽ.
/// - fill (color): Màu tô mặt bên.
/// -> group
#let draw-cone(
  name: "cone",
  radius: 2,
  height: 4,
  center: (0, 0, 0),
  samples: 64,
  stroke: black,
  fill: none,
) = {
  let (cx, cy, cz) = center
  let top = (cx, cy, cz + height)

  // Tạo các điểm trên đường tròn đáy
  let base-pts = range(0, samples).map(i => {
    let theta = 2 * calc.pi * i / (samples - 1)
    let x = cx + radius * calc.cos(theta)
    let y = cy + radius * calc.sin(theta)
    (x, y, cz)
  })

  // Chiếu xuống 2D
  let base-2d = base-pts.map(project-isometric)
  let top-2d = project-isometric(top)
  let center-2d = project-isometric(center)

  draw.group(name: name, {
    // Vẽ đáy (nét đứt phía sau, nét liền phía trước)
    let half = int(samples / 2)
    draw.line(..base-2d.slice(half, samples - 1), stroke: (paint: stroke, dash: "dashed"))
    draw.line(..base-2d.slice(0, half + 1), stroke: stroke)

    // Vẽ các đường sinh
    draw.line(top-2d, base-2d.at(0), stroke: stroke)
    draw.line(top-2d, base-2d.at(half), stroke: stroke)

    // Tô mặt bên (tùy chọn)
    if fill != none {
      draw.line(..base-2d, close: true, fill: fill, stroke: none)
      draw.line(top-2d, ..base-2d, close: true, fill: fill, stroke: none)
    }

    // Định nghĩa anchor
    draw.anchor("top", top-2d)
    draw.anchor("center", center-2d)
    draw.anchor("front", base-2d.at(0))
    draw.anchor("back", base-2d.at(half))
    draw.anchor("left", base-2d.at(int(samples / 4)))
    draw.anchor("right", base-2d.at(int(3 * samples / 4)))
  })
}

/// Vẽ hình trụ 3D với anchor.
/// - name (string): Tên nhóm.
/// - radius (float): Bán kính.
/// - height (float): Chiều cao.
/// - center (array): Tâm đáy.
/// - samples (int): Số điểm trên đường tròn.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-cylinder(
  name: "cylinder",
  radius: 2,
  height: 4,
  center: (0, 0, 0),
  samples: 64,
  stroke: black,
) = {
  let (cx, cy, cz) = center
  let top-center = (cx, cy, cz + height)

  let base-pts = range(0, samples).map(i => {
    let theta = 2 * calc.pi * i / (samples - 1)
    (cx + radius * calc.cos(theta), cy + radius * calc.sin(theta), cz)
  })
  let top-pts = base-pts.map(pt => (pt.at(0), pt.at(1), cz + height))

  let base-2d = base-pts.map(project-isometric)
  let top-2d = top-pts.map(project-isometric)
  let center-2d = project-isometric(center)
  let top-center-2d = project-isometric(top-center)

  draw.group(name: name, {
    let half = int(samples / 2)
    // Đáy
    draw.line(..base-2d.slice(half, samples - 1), stroke: (paint: stroke, dash: "dashed"))
    draw.line(..base-2d.slice(0, half + 1), stroke: stroke)
    // Mặt trên
    draw.line(..top-2d, stroke: stroke)
    // Đường sinh
    draw.line(base-2d.at(0), top-2d.at(0), stroke: stroke)
    draw.line(base-2d.at(half), top-2d.at(half), stroke: stroke)

    // Anchor
    draw.anchor("bottom-center", center-2d)
    draw.anchor("top-center", top-center-2d)
    draw.anchor("front", base-2d.at(0))
    draw.anchor("back", base-2d.at(half))
  })
}

/// Vẽ hình cầu 3D dạng lưới.
/// - name (string): Tên nhóm.
/// - radius (float): Bán kính.
/// - center (array): Tâm cầu.
/// - samples (int): Số điểm trên mỗi vòng.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-sphere(
  name: "sphere",
  radius: 2,
  center: (0, 0, 0),
  samples: 32,
  stroke: black,
) = {
  draw.group(name: name, {
    // Vòng ngang
    let pts-h = range(0, samples).map(i => {
      let theta = 2 * calc.pi * i / (samples - 1)
      let pt = (center.at(0) + radius * calc.cos(theta), center.at(1) + radius * calc.sin(theta), center.at(2))
      project-isometric(pt)
    })
    draw.line(..pts-h, close: true, stroke: stroke)

    // Vòng đứng
    let pts-v = range(0, samples).map(i => {
      let theta = 2 * calc.pi * i / (samples - 1)
      let pt = (center.at(0) + radius * calc.cos(theta), center.at(1), center.at(2) + radius * calc.sin(theta))
      project-isometric(pt)
    })
    draw.line(..pts-v, close: true, stroke: stroke)

    draw.anchor("center", project-isometric(center))
  })
}
