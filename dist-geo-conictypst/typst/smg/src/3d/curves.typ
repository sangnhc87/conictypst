// ═════════════════════════════════════════════════════════════════════════════
// 3D: CURVES
// Các đường cong đặc biệt trong không gian
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw
#import "../core/utils.typ": deg-to-rad, range
#import "../core/projections.typ": project-isometric

/// Vẽ đường xoắn ốc (helix) trong không gian.
/// - name (string): Tên nhóm.
/// - center (array): Tâm đường xoắn ốc (x, y, z).
/// - radius (float): Bán kính.
/// - height (float): Chiều cao tổng cộng.
/// - loops (float): Số vòng xoắn.
/// - samples (int): Số điểm mẫu.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-helix(
  name: "helix",
  center: (0, 0, 0),
  radius: 2,
  height: 4,
  loops: 1.5,
  samples: 200,
  stroke: black,
) = {
  let (cx, cy, cz) = center
  let pts = range(0, samples).map(i => {
    let t = i / (samples - 1)
    let theta = 2 * calc.pi * loops * t
    let z = cz + height * t
    let x = cx + radius * calc.cos(theta)
    let y = cy + radius * calc.sin(theta)
    project-isometric((x, y, z))
  })

  draw.group(name: name, {
    draw.line(..pts, stroke: stroke)
    // Anchor đầu và cuối
    draw.anchor("start", pts.at(0))
    draw.anchor("end", pts.at(pts.len() - 1))
    draw.anchor("center", project-isometric(center))
  })
}

/// Vẽ đường xoắn ốc trên mặt nón (conical helix).
/// Bán kính giảm tuyến tính từ đáy lên đỉnh.
/// - name (string): Tên nhóm.
/// - center (array): Tâm đáy nón (x, y, z).
/// - base-radius (float): Bán kính đáy nón.
/// - height (float): Chiều cao nón.
/// - loops (float): Số vòng xoắn.
/// - samples (int): Số điểm mẫu.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-conical-helix(
  name: "conical-helix",
  center: (0, 0, 0),
  base-radius: 2,
  height: 4,
  loops: 2,
  samples: 200,
  stroke: black,
) = {
  let (cx, cy, cz) = center
  let pts = range(0, samples).map(i => {
    let t = i / (samples - 1)
    let theta = 2 * calc.pi * loops * t
    let z = cz + height * t
    let r = base-radius * (1 - t)
    let x = cx + r * calc.cos(theta)
    let y = cy + r * calc.sin(theta)
    project-isometric((x, y, z))
  })

  draw.group(name: name, {
    draw.line(..pts, stroke: stroke)
    draw.anchor("start", pts.at(0))
    draw.anchor("end", pts.at(pts.len() - 1))
    draw.anchor("apex", project-isometric((cx, cy, cz + height)))
  })
}
