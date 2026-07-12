// ═════════════════════════════════════════════════════════════════════════════
// CORE: PROJECTIONS
// Các phép chiếu 3D xuống 2D để vẽ trên CeTZ
// ═════════════════════════════════════════════════════════════════════════════

#import "utils.typ": deg-to-rad

/// Chiếu trực giao isometric.
/// Góc nhìn mặc định: 35.264° trên trục X, 45° quanh trục Z.
/// - pt (array): Điểm 3D (x, y, z).
/// -> array
#let project-isometric(pt) = {
  let (x, y, z) = pt
  // Góc isometric chuẩn
  let alpha = deg-to-rad(35.264)
  let beta = deg-to-rad(45)
  let x2 = x * calc.cos(beta) + z * calc.sin(beta)
  let y2 = y * calc.cos(alpha) - x * calc.sin(beta) * calc.sin(alpha) + z * calc.cos(beta) * calc.sin(alpha)
  (x2, y2)
}

/// Chiếu xiên (cabinet / cavalier).
/// - pt (array): Điểm 3D (x, y, z).
/// - angle (float): Góc xiên (độ), mặc định 45.
/// - scale (float): Tỉ lệ độ sâu, mặc định 0.5.
/// -> array
#let project-oblique(pt, angle: 45, scale: 0.5) = {
  let (x, y, z) = pt
  let rad = deg-to-rad(angle)
  (x + scale * z * calc.cos(rad), y + scale * z * calc.sin(rad))
}
