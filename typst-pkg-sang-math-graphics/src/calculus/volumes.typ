// ═════════════════════════════════════════════════════════════════════════════
// CALCULUS: VOLUMES
// Các hàm vẽ vật thể tính thể tích bằng tích phân theo mặt cắt
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": draw
#import "../core/utils.typ": range

/// Vẽ vật thể có mặt cắt vuông góc trục Ox là hình vuông,
/// cạnh nằm trên mặt đáy Oxy cho bởi hàm y = f(x).
/// - name (string): Tên nhóm.
/// - f (function): Hàm f(x) cho cạnh hình vuông.
/// - x-range (array): Khoảng [xmin, xmax].
/// - samples (int): Số mặt cắt minh họa.
/// - proj (function): Hàm chiếu 3D -> 2D.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-square-cross-section(
  name: "sq-solid",
  f,
  x-range: (0, 2),
  samples: 5,
  proj: (x, y, z) => (1.8 * x + 0.45 * y, z + 0.35 * y),
  stroke: rgb("00aadd"),
) = {
  let (xmin, xmax) = x-range

  draw.group(name: name, {
    // Đường biên trên mặt đáy
    let c-xy = range(0, 41).map(i => {
      let x = xmin + (xmax - xmin) * i / 40
      let s = f(x)
      proj(x, s, 0)
    })
    // Đường biên trên mặt Oxz
    let c-xz = range(0, 41).map(i => {
      let x = xmin + (xmax - xmin) * i / 40
      let s = f(x)
      proj(x, 0, s)
    })
    // Đường bao đỉnh
    let c-top = range(0, 41).map(i => {
      let x = xmin + (xmax - xmin) * i / 40
      let s = f(x)
      proj(x, s, s)
    })

    draw.line(..c-xz, stroke: 1.5pt + stroke)
    draw.line(..c-xy, stroke: 1.5pt + stroke)
    draw.line(..c-top, stroke: 1.5pt + stroke)

    // Vẽ các mặt cắt
    for i in range(0, samples) {
      let t = if samples > 1 { i / (samples - 1) } else { 0 }
      let x = xmin + (xmax - xmin) * t
      let s = f(x)
      let alpha = if i == samples - 1 { "66" } else { "33" }
      let p1 = proj(x, 0, 0)
      let p2 = proj(x, s, 0)
      let p3 = proj(x, s, s)
      let p4 = proj(x, 0, s)
      draw.line(p1, p2, p3, p4, close: true, fill: rgb("ffcc00" + alpha), stroke: 1pt + rgb("cc8800"))
    }

    draw.anchor("start", proj(xmin, 0, 0))
    draw.anchor("end", proj(xmax, 0, 0))
  })
}

/// Vẽ vật thể có mặt cắt vuông góc trục Oy là hình vuông cạnh a(y).
/// - name (string): Tên nhóm.
/// - a (function): Hàm a(y) cho cạnh hình vuông.
/// - y-range (array): Khoảng [ymin, ymax].
/// - samples (int): Số mặt cắt minh họa.
/// - proj (function): Hàm chiếu 3D -> 2D.
/// - stroke (stroke): Kiểu nét vẽ.
/// -> group
#let draw-square-y-cross-section(
  name: "sq-y-solid",
  a,
  y-range: (0, 8),
  samples: 4,
  proj: (x, y, z) => (x + 0.5 * z, y + 0.3 * z),
  stroke: rgb("0057b8"),
) = {
  let (ymin, ymax) = y-range

  draw.group(name: name, {
    // Đường sinh khuất phía sau
    let back-l = range(0, 81).map(i => {
      let y = ymin + (ymax - ymin) * i / 80
      let half = a(y) / 2
      proj(-half, y, -half)
    })
    let back-r = range(0, 81).map(i => {
      let y = ymin + (ymax - ymin) * i / 80
      let half = a(y) / 2
      proj(half, y, -half)
    })
    draw.line(..back-l, stroke: 0.8pt + rgb("b8008d"))
    draw.line(..back-r, stroke: 0.8pt + rgb("b8008d"))

    // Đường sinh thấy phía trước
    let front-l = range(0, 81).map(i => {
      let y = ymin + (ymax - ymin) * i / 80
      let half = a(y) / 2
      proj(-half, y, half)
    })
    let front-r = range(0, 81).map(i => {
      let y = ymin + (ymax - ymin) * i / 80
      let half = a(y) / 2
      proj(half, y, half)
    })
    draw.line(..front-l, stroke: (dash: "dashed", paint: gray))
    draw.line(..front-r, stroke: 1.2pt + stroke)

    // Các mặt cắt
    for i in range(0, samples) {
      let t = if samples > 1 { i / (samples - 1) } else { 0 }
      let y = ymin + (ymax - ymin) * t
      let half = a(y) / 2
      let alpha = if i == samples - 1 { "44" } else { "22" }
      let p1 = proj(-half, y, half)
      let p2 = proj(half, y, half)
      let p3 = proj(half, y, -half)
      let p4 = proj(-half, y, -half)
      draw.line(p1, p2, p3, p4, close: true, fill: rgb("0077bb" + alpha), stroke: none)
      draw.line(p1, p4, p3, stroke: (dash: "dashed", paint: gray))
      draw.line(p1, p2, p3, stroke: (dash: "dashed", paint: gray))
    }

    draw.anchor("bottom", proj(0, ymin, 0))
    draw.anchor("top", proj(0, ymax, 0))
  })
}

/// Vẽ đường hầm có thiết diện nửa elip.
/// - name (string): Tên nhóm.
/// - length (float): Chiều dài đường hầm.
/// - h-start (float): Chiều cao nửa elip tại đầu vào.
/// - h-end (float): Chiều cao nửa elip tại đầu ra.
/// - ratio (float): Tỉ số trục lớn / trục bé.
/// - samples (int): Số mặt cắt.
/// -> group
#let draw-half-elliptical-tunnel(
  name: "tunnel",
  length: 6,
  h-start: 4,
  h-end: 1,
  ratio: 3,
  samples: 2,
) = {
  let Ws = length
  let We = h-end * ratio / 2
  let O1 = (0, 0)
  let O2 = (length * 0.8, -length * 0.4)

  draw.group(name: name, {
    // Mặt đáy
    draw.line((-Ws, 0), O1, stroke: 1pt)
    draw.line((-Ws, 0), (-We + O2.at(0), O2.at(1)), stroke: (dash: "dashed", paint: gray))
    draw.line((-We + O2.at(0), O2.at(1)), (We + O2.at(0), O2.at(1)), stroke: (dash: "dashed", paint: gray))
    draw.line((Ws, 0), (We + O2.at(0), O2.at(1)), stroke: 1pt)

    // Trục tọa độ
    draw.line(O1, (O2.at(0) + 2.5, O2.at(1) - 1.25), mark: (end: ">"), stroke: 0.5pt)
    draw.content((O2.at(0) + 2.8, O2.at(1) - 1.25), $x$)
    draw.line(O1, (0, h-start), stroke: (dash: "dashed", paint: gray))

    // Nửa elip phía cuối
    draw.arc((O2.at(0) + length / 8, O2.at(1)), start: 0deg, stop: 180deg, radius: (We, h-end), stroke: (
      dash: "dashed",
      paint: black,
      thickness: 1pt,
    ))

    // Đường sinh trên cùng
    draw.line((0, h-start), (O2.at(0), O2.at(1) + h-end), stroke: 1.2pt)

    // Nửa elip phía trước
    draw.arc((0, 0), start: 0deg, stop: 180deg, radius: (Ws, h-start), fill: rgb("0000ff1a"), stroke: 1.2pt)

    // Ký hiệu kích thước
    draw.line((-0.8, 0), (-0.8, h-start), mark: (start: ">", end: ">"), stroke: 0.5pt)
    draw.content((-1.2, h-start / 2), $h(0)$, anchor: "east")

    draw.line(
      (O2.at(0) + 0.8, O2.at(1)),
      (O2.at(0) + 0.8, O2.at(1) + h-end),
      mark: (start: ">", end: ">"),
      stroke: 0.5pt,
    )
    draw.content((O2.at(0) + 1.2, O2.at(1) + h-end / 2), $h(L)$, anchor: "west")

    draw.line((0, h-start + 1), (O2.at(0), O2.at(1) + h-end + 1), mark: (start: ">", end: ">"), stroke: 0.5pt)
    draw.content((O2.at(0) / 2, O2.at(1) / 2 + h-start / 2 + 1.5), $L=#length$)

    draw.content(O1, $O$, anchor: "north", padding: 4pt)
    draw.content(O2, $L$, anchor: "north", padding: 4pt)
  })
}
