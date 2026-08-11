// ═════════════════════════════════════════════════════════════════════════════
// CORE: UTILS
// Các hàm tính toán tọa độ và phép biến đổi cơ bản
// ═════════════════════════════════════════════════════════════════════════════

/// Chuyển độ sang radian.
/// - deg (float): Góc tính bằng độ.
/// -> float
#let deg-to-rad(deg) = deg * calc.pi / 180

/// Chuyển radian sang độ.
/// - rad (float): Góc tính bằng radian.
/// -> float
#let rad-to-deg(rad) = rad * 180 / calc.pi

/// Nội suy tuyến tính giữa hai giá trị.
/// - a (float): Giá trị đầu.
/// - b (float): Giá trị cuối.
/// - t (float): Hệ số nội suy, t ∈ [0, 1].
/// -> float
#let lerp(a, b, t) = a + (b - a) * t

/// Xoay một điểm 2D quanh gốc tọa độ.
/// - pt (array): Điểm (x, y).
/// - angle (float): Góc xoay (độ).
/// -> array
#let rotate-2d(pt, angle) = {
  let rad = deg-to-rad(angle)
  let c = calc.cos(rad)
  let s = calc.sin(rad)
  let (x, y) = pt
  (x * c - y * s, x * s + y * c)
}

/// Xoay một điểm 3D quanh trục Z.
/// - pt (array): Điểm (x, y, z).
/// - angle (float): Góc xoay (độ).
/// -> array
#let rotate-3d-z(pt, angle) = {
  let rad = deg-to-rad(angle)
  let c = calc.cos(rad)
  let s = calc.sin(rad)
  let (x, y, z) = pt
  (x * c - y * s, x * s + y * c, z)
}

/// Xoay một điểm 3D quanh trục X.
/// - pt (array): Điểm (x, y, z).
/// - angle (float): Góc xoay (độ).
/// -> array
#let rotate-3d-x(pt, angle) = {
  let rad = deg-to-rad(angle)
  let c = calc.cos(rad)
  let s = calc.sin(rad)
  let (x, y, z) = pt
  (x, y * c - z * s, y * s + z * c)
}

/// Xoay một điểm 3D quanh trục Y.
/// - pt (array): Điểm (x, y, z).
/// - angle (float): Góc xoay (độ).
/// -> array
#let rotate-3d-y(pt, angle) = {
  let rad = deg-to-rad(angle)
  let c = calc.cos(rad)
  let s = calc.sin(rad)
  let (x, y, z) = pt
  (x * c + z * s, y, -x * s + z * c)
}

/// Xoay điểm 3D theo thứ tự trục Z → Y → X.
/// - pt (array): Điểm (x, y, z).
/// - angles (array): Bộ góc (rx, ry, rz) tính bằng độ.
/// -> array
#let rotate-3d(pt, angles) = {
  let (rx, ry, rz) = angles
  rotate-3d-x(rotate-3d-y(rotate-3d-z(pt, rz), ry), rx)
}

/// Tạo dãy số từ start đến end với bước step.
/// - start (float): Giá trị bắt đầu.
/// - end (float): Giá trị kết thúc.
/// - step (float): Bước nhảy.
/// -> array
#let range(start, end, step: 1) = {
  let result = ()
  let n = 0
  let val = start
  while val <= end {
    result.push(val)
    n = n + 1
    val = start + n * step
  }
  result
}
