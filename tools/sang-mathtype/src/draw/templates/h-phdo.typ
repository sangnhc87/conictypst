// @nhom Hóa học
// @muc Đồ thị & giản đồ
// @ten Đường cong chuẩn độ axit mạnh bằng bazơ mạnh
// @mota pH theo thể tích bazơ thêm vào; điểm tương đương tại pH = 7
// @tu duong cong chuan do ph diem tuong duong
#import "/sm-draw.typ": *
#let p-v = 20 // Thể tích bazơ tại điểm tương đương (mL)
#sm-canvas({
  import draw: *
  let X = 0.22  // cm cho mỗi mL
  let Y = 0.42  // cm cho mỗi đơn vị pH
  line((0, 0), (0, 14 * Y + 0.5), mark: (end: ">"))
  line((0, 0), (2 * p-v * X + 0.6, 0), mark: (end: ">"))
  for k in range(0, 15, step: 2) {
    line((-0.08, k * Y), (0, k * Y), stroke: 0.6pt)
    lab((-0.1, k * Y), [#k], at: "east", size: 8.5pt)
  }
  for v in range(0, 2 * p-v + 1, step: 10) {
    line((v * X, 0), (v * X, -0.08), stroke: 0.6pt)
    lab((v * X, -0.1), [#v], at: "north", size: 8.5pt)
  }
  let pts = ()
  for i in range(0, 2 * p-v * 4 + 1) {
    let v = i / 4
    let t = (v - p-v) / (p-v * 0.04 + 0.4)
    let ph = 7 + 6 * (calc.exp(2 * t) - 1) / (calc.exp(2 * t) + 1) * (1 - 0.4 * calc.exp(-calc.abs(v - p-v) / 4))
    pts.push((v * X, calc.max(1, calc.min(13, ph)) * Y))
  }
  line(..pts, stroke: 1.6pt + c-blue)
  line((p-v * X, 0), (p-v * X, 7 * Y), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray))
  line((0, 7 * Y), (p-v * X, 7 * Y), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray))
  circle((p-v * X, 7 * Y), radius: 0.09, fill: c-red, stroke: none)
  lab((p-v * X + 0.15, 7 * Y - 0.15), [Điểm tương đương\ pH = 7], at: "north-west", size: 9pt)
  lab((-0.7, 14 * Y + 0.5), [pH], size: 10pt)
  lab((2 * p-v * X + 0.6, -0.5), [V (mL)], at: "north-east", size: 9.5pt)
})
