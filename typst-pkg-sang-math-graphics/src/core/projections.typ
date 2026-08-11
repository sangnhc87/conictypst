// ═════════════════════════════════════════════════════════════════════════════
// CORE: PROJECTIONS
// Các phép chiếu 3D xuống 2D để vẽ trên CeTZ
// ═════════════════════════════════════════════════════════════════════════════

#import "utils.typ": deg-to-rad

/// Chiếu trực giao isometric, giữ trục Z theo phương đứng trên trang.
/// Hai trục đáy đối xứng ở góc 30° để hợp với hình minh họa SGK.
/// - pt (array): Điểm 3D (x, y, z).
/// -> array
#let project-isometric(pt) = {
  let (x, y, z) = pt
  // Isometric chuẩn với Z hướng thẳng đứng (Up)
  let alpha = deg-to-rad(30)
  let x2 = (y - x) * calc.cos(alpha)
  let y2 = z - (x + y) * calc.sin(alpha)
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
