// ═════════════════════════════════════════════════════════════════════════════
// 3D: SOLIDS
// Các hình khối cơ bản: nón, trụ, cầu với anchor
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw
#import "../core/utils.typ": deg-to-rad, range
#import "../core/projections.typ": project-isometric

/// Vẽ hình nón 3D với các anchor.
/// - name: Tên namespace anchor.
/// - radius: Bán kính đáy; `height`: chiều cao.
/// - center: Tâm đáy `(x, y, z)`.
/// - stroke: Kiểu nét; `fill`: màu tô thân nón hoặc `none`.
/// - show-hidden: Có vẽ nửa sau của đáy bằng nét đứt hay không.
#let draw-cone(
  name: "cone",
  radius: 2,
  height: 4,
  center: (0, 0, 0),
  samples: 64,
  stroke: black,
  fill: none,
  show-hidden: true,
) = {
  let cx-cy = project-isometric(center)
  let top-2d = project-isometric((center.at(0), center.at(1), center.at(2) + height))
  // Tỉ lệ trục phối cảnh chuẩn SGK
  let rx = radius
  let ry = radius * 0.35
  let left = (cx-cy.at(0) - rx, cx-cy.at(1))
  let right = (cx-cy.at(0) + rx, cx-cy.at(1))

  draw.group(name: name, {
    if fill != none {
      draw.line(top-2d, right, left, close: true, fill: fill, stroke: none)
    }

    // Vẽ đáy: nửa sau đứt, nửa trước liền
    if show-hidden {
      draw.arc(cx-cy, start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: stroke, dash: "dashed"))
    }
    draw.arc(cx-cy, start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke)

    // Hai đường sinh
    draw.line(top-2d, left, stroke: stroke)
    draw.line(top-2d, right, stroke: stroke)

    draw.anchor("center", cx-cy)
    draw.anchor("base-center", cx-cy)
    draw.anchor("bottom-center", cx-cy)
    draw.anchor("top", top-2d)
    draw.anchor("apex", top-2d)
    draw.anchor("left", left)
    draw.anchor("right", right)
    // front/back là tên anchor cũ của package; giữ lại để không hỏng tài liệu.
    draw.anchor("front", right)
    draw.anchor("back", left)
  })
}

/// Vẽ hình trụ 3D.
/// - name: Tên namespace anchor.
/// - radius: Bán kính đáy; `height`: chiều cao.
/// - center: Tâm đáy `(x, y, z)`.
/// - stroke: Kiểu nét; `fill`: màu tô thân trụ hoặc `none`.
/// - show-hidden: Có vẽ nửa sau của đáy dưới bằng nét đứt hay không.
#let draw-cylinder(
  name: "cylinder",
  radius: 2,
  height: 4,
  center: (0, 0, 0),
  samples: 64,
  stroke: black,
  fill: none,
  show-hidden: true,
) = {
  let cx-cy = project-isometric(center)
  let top-2d = project-isometric((center.at(0), center.at(1), center.at(2) + height))
  let rx = radius
  let ry = radius * 0.35
  let left = (cx-cy.at(0) - rx, cx-cy.at(1))
  let right = (cx-cy.at(0) + rx, cx-cy.at(1))
  let top-left = (top-2d.at(0) - rx, top-2d.at(1))
  let top-right = (top-2d.at(0) + rx, top-2d.at(1))

  draw.group(name: name, {
    if fill != none {
      draw.line((cx-cy.at(0) - rx, cx-cy.at(1)), (cx-cy.at(0) - rx, top-2d.at(1)), (cx-cy.at(0) + rx, top-2d.at(1)), (cx-cy.at(0) + rx, cx-cy.at(1)), close: true, fill: fill, stroke: none)
      draw.arc(top-2d, start: 0deg, stop: 360deg, radius: (rx, ry), fill: fill, stroke: none)
    }

    // Đáy dưới
    if show-hidden {
      draw.arc(cx-cy, start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: stroke, dash: "dashed"))
    }
    draw.arc(cx-cy, start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke)

    // Đáy trên
    draw.arc(top-2d, start: 0deg, stop: 360deg, radius: (rx, ry), stroke: stroke)

    // Hai đường sinh hai bên
    draw.line(left, top-left, stroke: stroke)
    draw.line(right, top-right, stroke: stroke)

    draw.anchor("bottom-center", cx-cy)
    draw.anchor("bottom", cx-cy)
    draw.anchor("center", ((cx-cy.at(0) + top-2d.at(0)) / 2, (cx-cy.at(1) + top-2d.at(1)) / 2))
    draw.anchor("top-center", top-2d)
    draw.anchor("top", top-2d)
    draw.anchor("left", left)
    draw.anchor("right", right)
    // front/back là tên anchor cũ của package; giữ lại để không hỏng tài liệu.
    draw.anchor("front", right)
    draw.anchor("back", left)
  })
}

/// Vẽ hình cầu 3D.
/// - name: Tên namespace anchor.
/// - radius: Bán kính; `center`: Tâm `(x, y, z)`.
/// - fill: Màu tô mặt cầu hoặc `none`.
/// - show-equator: Vẽ xích đạo; `show-meridian`: Vẽ kinh tuyến đứng.
/// - show-hidden: Nửa khuất dùng nét đứt.
#let draw-sphere(
  name: "sphere",
  radius: 2,
  center: (0, 0, 0),
  samples: 64,
  stroke: black,
  fill: none,
  show-equator: true,
  show-meridian: false,
  show-hidden: true,
) = {
  let cx-cy = project-isometric(center)
  let rx = radius
  let ry = radius * 0.35

  draw.group(name: name, {
    // Vòng tròn ngoài
    draw.circle(cx-cy, radius: radius, fill: fill, stroke: stroke)

    // Vòng xích đạo
    if show-equator {
      if show-hidden {
        draw.arc(cx-cy, start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (paint: stroke, dash: "dashed"))
      }
      draw.arc(cx-cy, start: 180deg, stop: 360deg, radius: (rx, ry), stroke: stroke)
    }

    // Kinh tuyến đứng tùy chọn.
    if show-meridian {
      if show-hidden {
        draw.arc(cx-cy, start: 0deg, stop: 180deg, radius: (ry, rx), stroke: (paint: stroke, dash: "dashed"))
      }
      draw.arc(cx-cy, start: 180deg, stop: 360deg, radius: (ry, rx), stroke: stroke)
    }

    draw.circle(cx-cy, radius: 2.5pt, fill: black)

    draw.anchor("center", cx-cy)
    draw.anchor("top", (cx-cy.at(0), cx-cy.at(1) + radius))
    draw.anchor("bottom", (cx-cy.at(0), cx-cy.at(1) - radius))
    draw.anchor("left", (cx-cy.at(0) - radius, cx-cy.at(1)))
    draw.anchor("right", (cx-cy.at(0) + radius, cx-cy.at(1)))
  })
}
