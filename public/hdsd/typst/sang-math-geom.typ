// ═════════════════════════════════════════════════════════════════════════════
// SANG-MATH-GEOM v2.0 — THƯ VIỆN HÌNH MẪU HÌNH HỌC TOÁN THPT CHUẨN MỰC
// Phong cách sư phạm SANG-MATH, tích hợp toàn bộ tinh hoa conic-toan & Luadraw 3D
// ═════════════════════════════════════════════════════════════════════════════

#import "conic-toan/baigiang.typ": *
#import "@preview/cetz:0.5.2"

// ── Bảng màu Sư phạm Chuẩn sang-math ──────────────────────────────────────
#let sm-blue         = rgb("#0057b8") // Xanh lam chuẩn
#let sm-blue-light   = rgb("#e0f2fe") // Xanh lam nhạt fill
#let sm-green        = rgb("#059669") // Xanh lá bảo ngọc
#let sm-green-light  = rgb("#d1fae5") // Xanh lá nhạt fill
#let sm-red          = rgb("#e11d48") // Đỏ hồng thắm
#let sm-red-light    = rgb("#ffe4e6") // Đỏ nhạt fill
#let sm-amber        = rgb("#d97706") // Vàng cam hổ phách
#let sm-amber-light  = rgb("#fef3c7") // Vàng nhạt fill
#let sm-purple       = rgb("#7c3aed") // Tím thạch anh
#let sm-purple-light = rgb("#ede9fe") // Tím nhạt fill
#let sm-gray         = rgb("#64748b") // Xám đá
#let sm-gray-light   = rgb("#f1f5f9") // Xám nhạt

// ── 0. ĐẠI SỐ HÌNH HỌC DỰNG HÌNH & THAO TÁC NỐI TIẾP (GEOMETRIC ALGEBRA) ────
// Các hàm toán học tính toán tọa độ thuần túy, dùng trực tiếp trong hook `them`

/// Tính tọa độ trung điểm của đoạn thẳng AB: M = (A + B) / 2
#let sm-trung-diem(A, B) = (
  (A.at(0) + B.at(0)) / 2.0,
  (A.at(1) + B.at(1)) / 2.0,
)

/// Điểm chia đoạn thẳng AB theo tỉ lệ k: P = A + k * (B - A)
/// - k = 0.5: trung điểm
/// - k = 1/3: chia 3 (gần A hơn)
/// - k = 2/3: chia 3 (gần B hơn, vị trí trọng tâm)
#let sm-ti-le(A, B, k) = (
  A.at(0) + k * (B.at(0) - A.at(0)),
  A.at(1) + k * (B.at(1) - A.at(1)),
)

/// Trọng tâm của hệ điểm (tam giác, tứ giác, ...)
#let sm-trong-tam(..pts) = {
  let arr = pts.pos()
  let n = float(arr.len())
  let sx = 0.0
  let sy = 0.0
  for p in arr {
    sx += p.at(0)
    sy += p.at(1)
  }
  (sx / n, sy / n)
}

/// Tìm giao điểm của 2 đường thẳng AB và CD trong mặt phẳng
#let sm-giao-diem(A, B, C, D) = {
  let x1 = A.at(0); let y1 = A.at(1)
  let x2 = B.at(0); let y2 = B.at(1)
  let x3 = C.at(0); let y3 = C.at(1)
  let x4 = D.at(0); let y4 = D.at(1)
  let m = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  if calc.abs(m) < 1e-9 { return none }
  (
    ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / m,
    ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / m,
  )
}

/// Dựng điểm D sao cho tứ giác ABDC là hình bình hành (hoặc vec(CD) = vec(AB))
#let sm-song-song(A, B, C) = (
  C.at(0) + (B.at(0) - A.at(0)),
  C.at(1) + (B.at(1) - A.at(1)),
)

/// Tìm tọa độ hình chiếu vuông góc của điểm P lên đường thẳng AB
#let sm-hinh-chieu(P, A, B) = {
  let vx = B.at(0) - A.at(0)
  let vy = B.at(1) - A.at(1)
  let q = vx * vx + vy * vy
  if q < 1e-9 { return A }
  let t = ((P.at(0) - A.at(0)) * vx + (P.at(1) - A.at(1)) * vy) / q
  (A.at(0) + t * vx, A.at(1) + t * vy)
}

/// Khoảng cách Euclid giữa 2 điểm
#let sm-khoang-cach(A, B) = {
  let dx = B.at(0) - A.at(0)
  let dy = B.at(1) - A.at(1)
  calc.sqrt(dx * dx + dy * dy)
}

/// Vectơ từ điểm A đến điểm B: arrow(AB) = B - A
#let sm-vecto(A, B) = (B.at(0) - A.at(0), B.at(1) - A.at(1))

/// Quay điểm P quanh tâm một góc lượng giác
#let sm-quay(P, tam, goc) = {
  let g = if type(goc) == angle { goc } else { goc * 1deg }
  let dx = P.at(0) - tam.at(0)
  let dy = P.at(1) - tam.at(1)
  let c = calc.cos(g)
  let s = calc.sin(g)
  (tam.at(0) + dx * c - dy * s, tam.at(1) + dx * s + dy * c)
}

// ── CÁC HÀM VẼ THÊM TRỰC DIỆN (DRAWING PRIMITIVES) ───────────────────────────

/// Chuẩn hóa hướng nhãn (hỗ trợ cả tiếng Việt phương hướng, vị trí và tiếng Anh)
#let _sm-chuan-hoa-huong(h) = {
  if h == auto or h == none { auto }
  else if h == "dong" or h == "east" { "phai" }
  else if h == "tay" or h == "west" { "trai" }
  else if h == "bac" or h == "north" { "tren" }
  else if h == "nam" or h == "south" { "duoi" }
  else if h == "dong-bac" or h == "north-east" { "tren-phai" }
  else if h == "tay-bac" or h == "north-west" { "tren-trai" }
  else if h == "dong-nam" or h == "south-east" { "duoi-phai" }
  else if h == "tay-nam" or h == "south-west" { "duoi-trai" }
  else { h }
}

/// Chấm điểm và đặt nhãn trong khung vẽ
#let sm-diem(ctx, P, ten: none, huong: "tren", bk: 2.2pt, mau: black, cach: 6pt, mau-ten: auto) = {
  diem(ctx, P, ten: ten, huong: _sm-chuan-hoa-huong(huong), bk: bk, mau: mau, cach: cach, mau-ten: mau-ten)
}

/// Vẽ đoạn thẳng nét liền hoặc đứt kèm nhãn
#let sm-doan(ctx, A, B, dut: false, mau: black, day: 1.1pt, ten: none, tai: 0.5, huong: auto) = {
  doan(ctx, A, B, mau: mau, day: day, dut: dut, ten: ten, tai: tai, huong: huong)
}

/// Vẽ và tô màu mặt phẳng thiết diện đa giác (độ mờ trong suốt đẹp mắt)
#let sm-thiet-dien(ctx, pts, to: rgb(239, 68, 68, 40), mau: sm-red, day: 1.1pt, dut: false) = {
  da-giac(ctx, pts, to: to, mau: mau, day: day, dut: dut)
}

/// Ký hiệu góc vuông tại O giữa 2 tia OA và OB: sm-goc-vuong(ctx, O, A, B)
#let sm-goc-vuong(ctx, O, A, B, r: 0.28, mau: sm-red, day: 0.9pt) = {
  goc-vuong(ctx, O, A, B, r: r, mau: mau, day: day)
}

/// Ký hiệu góc vuông theo phong cách TikZ A-O-B (vuông tại O ở giữa): sm-ve-goc-vuong(ctx, A, O, B)
#let sm-ve-goc-vuong(ctx, A, O, B, r: 0.28, mau: sm-red, day: 0.9pt) = {
  goc-vuong(ctx, O, A, B, r: r, mau: mau, day: day)
}

/// Ký hiệu góc thường tại O giữa tia OA và OB kèm nhãn góc: sm-goc(ctx, O, A, B)
#let sm-goc(ctx, O, A, B, r: 0.45, ten: none, mau: sm-red, day: 0.85pt, to: none) = {
  goc(ctx, O, A, B, r: r, ten: ten, mau: mau, day: day, to: to)
}

/// Ký hiệu góc thường theo phong cách TikZ A-O-B (đỉnh O ở giữa): sm-ve-goc(ctx, A, O, B)
#let sm-ve-goc(ctx, A, O, B, r: 0.45, ten: none, mau: sm-red, day: 0.85pt, to: none) = {
  goc(ctx, O, A, B, r: r, ten: ten, mau: mau, day: day, to: to)
}

/// Vẽ mũi tên vectơ
#let sm-mui-ten(ctx, A, B, mau: black, day: 1.1pt) = {
  mui-ten(ctx, A, B, mau: mau, day: day)
}

// ── BÍ DANH TIỆN ÍCH NGẮN GỌN (SHORT ALIASES) ──────────────────────────────
#let trung-diem  = sm-trung-diem
#let ti-le       = sm-ti-le
#let trong-tam   = sm-trong-tam
#let giao-diem   = sm-giao-diem
#let song-song   = sm-song-song
#let hinh-chieu  = sm-hinh-chieu
#let khoang-cach = sm-khoang-cach
#let thiet-dien  = sm-thiet-dien
#let ve-diem     = sm-diem
#let ve-doan     = sm-doan
#let ve-goc-vuong = sm-ve-goc-vuong
#let ve-goc      = sm-ve-goc


/// Chóp tam giác S.ABC có SA vuông góc đáy (hoặc đường cao tại trọng tâm H)
#let sm-chop-sabc(
  w: 7cm,
  ten: ($S$, $A$, $B$, $C$),
  duong-cao: "dinh-a", // "dinh-a" (SA vuông góc đáy) | "tam" (chóp đều)
  ten-chan: $H$,
  mau: black,
  mau-phu: sm-red,
  day: 1.1pt,
  them: none,
) = hinh-chop-tam-giac(
  w: w,
  ten: ten,
  duong-cao: duong-cao,
  ten-chan: ten-chan,
  mau: mau,
  mau-phu: mau-phu,
  day: day,
  them: them,
)

/// Chóp tam giác đều S.ABC (đường cao SO hạ xuống trọng tâm đáy O)
#let sm-chop-sabc-deu(
  w: 7cm,
  ten: ($S$, $A$, $B$, $C$),
  ten-tam: $O$,
  trung-tuyen: true,
  ten-trung-diem: $M$,
  mau: black,
  mau-phu: sm-red,
  day: 1.1pt,
  them: none,
) = hinh-chop-tam-giac-deu(
  w: w,
  ten: ten,
  ten-tam: ten-tam,
  ten-trung-diem: ten-trung-diem,
  trung-tuyen: trung-tuyen,
  mau: mau,
  mau-phu: mau-phu,
  day: day,
  them: them,
)

/// Chóp tứ giác S.ABCD đều (SO vuông góc đáy tại tâm O giao điểm 2 đường chéo)
#let sm-chop-sabcd-deu(
  w: 7.6cm,
  ten: ($S$, $A$, $B$, $C$, $D$),
  ten-tam: $O$,
  mau: black,
  mau-phu: sm-red,
  day: 1.1pt,
  them: none,
) = hinh-chop-tu-giac(
  w: w,
  ten: ten,
  duong-cao: "tam",
  duong-cheo: true,
  ten-tam: ten-tam,
  mau: mau,
  mau-phu: mau-phu,
  day: day,
  them: them,
)

/// Chóp tứ giác S.ABCD có SA vuông góc đáy
#let sm-chop-sabcd-sa(
  w: 7.6cm,
  ten: ($S$, $A$, $B$, $C$, $D$),
  mau: black,
  mau-phu: sm-red,
  day: 1.1pt,
  them: none,
) = hinh-chop-tu-giac(
  w: w,
  ten: ten,
  duong-cao: "dinh-a",
  duong-cheo: false,
  mau: mau,
  mau-phu: mau-phu,
  day: day,
  them: them,
)

/// Chóp tứ giác đáy hình thang
#let sm-chop-day-hinh-thang(
  w: 7.6cm,
  ten: ($S$, $A$, $B$, $C$, $D$),
  duong-cao: "dinh-a",
  duong-cheo: false,
  mau: black,
  mau-phu: sm-red,
  day: 1.1pt,
  them: none,
) = hinh-chop-day-hinh-thang(
  w: w,
  ten: ten,
  duong-cao: duong-cao,
  duong-cheo: duong-cheo,
  mau: mau,
  mau-phu: mau-phu,
  day: day,
  them: them,
)

/// Lăng trụ tam giác ABC.A'B'C'
#let sm-lang-tru-tam-giac(
  w: 7cm,
  ten: ($A$, $B$, $C$, $A'$, $B'$, $C'$),
  mau: black,
  day: 1.1pt,
  them: none,
) = hinh-lang-tru-tam-giac(
  w: w,
  ten: ten,
  mau: mau,
  day: day,
  them: them,
)

/// Lăng trụ tứ giác ABCD.A'B'C'D'
#let sm-lang-tru-tu-giac(
  w: 7.6cm,
  ten: ($A$, $B$, $C$, $D$, $A'$, $B'$, $C'$, $D'$),
  mau: black,
  to: sm-blue-light,
  them: none,
) = da-dien(
  w: w,
  ..khoi-lang-tru-deu(n: 4, R: 2.2, cao: 3.2, pha: 45deg, ten: ten),
  mau: mau,
  to: to,
  them: them,
)

/// Lăng trụ lục giác đều ABCDEF.A'B'C'D'E'F'
#let sm-lang-tru-luc-giac-deu(
  w: 7.6cm,
  ten: auto,
  mau: black,
  day: 1.1pt,
  them: none,
) = hinh-lang-tru-luc-giac-deu(
  w: w,
  ten: ten,
  mau: mau,
  day: day,
  them: them,
)

/// Hình hộp chữ nhật ABCD.A'B'C'D' (có đường chéo BD' hoặc AC')
#let sm-hop-chu-nhat(
  w: 7.6cm,
  ten: ($A$, $B$, $C$, $D$, $A'$, $B'$, $C'$, $D'$),
  duong-cheo: true,
  them: none,
) = hinh-hop-chu-nhat(
  w: w,
  ten: ten,
  duong-cheo: duong-cheo,
  them: them,
)

/// Hình lập phương ABCD.A'B'C'D'
#let sm-lap-phuong(
  w: 7cm,
  ten: ($A$, $B$, $C$, $D$, $A'$, $B'$, $C'$, $D'$),
  duong-cheo: true,
  them: none,
) = hinh-lap-phuong(
  w: w,
  ten: ten,
  duong-cheo: duong-cheo,
  them: them,
)

// ── 2. KHỐI ĐA DIỆN ĐỀU PLATON & ĐA DIỆN PHỨC HỢP (THUẬT TOÁN TỰ ĐỘNG) ────────

/// Khối tứ diện đều (4 mặt tam giác đều)
#let sm-tu-dien-deu(
  w: 6.5cm,
  a: 3.2,
  ten: ($A$, $B$, $C$, $D$),
  mau: black,
  to: sm-blue-light,
  them: none,
) = da-dien(
  w: w,
  ..khoi-tu-dien-deu(a: a, ten: ten),
  mau: mau,
  to: to,
  them: them,
)

/// Khối lập phương (6 mặt vuông đều)
#let sm-khoi-lap-phuong(
  w: 6.5cm,
  a: 2.8,
  ten: ($A$, $B$, $C$, $D$, $A'$, $B'$, $C'$, $D'$),
  mau: black,
  to: sm-green-light,
  them: none,
) = da-dien(
  w: w,
  ..khoi-lap-phuong(a: a, ten: ten),
  mau: mau,
  to: to,
  them: them,
)

/// Khối bát diện đều (8 mặt tam giác đều)
#let sm-bat-dien-deu(
  w: 6.5cm,
  a: 2.6,
  ten: ($A$, $B$, $C$, $D$, $S$, $S'$),
  mau: black,
  to: sm-purple-light,
  them: none,
) = da-dien(
  w: w,
  ..khoi-bat-dien-deu(a: a, ten: ten),
  mau: mau,
  to: to,
  them: them,
)

/// Khối mười hai mặt đều (12 mặt ngũ giác đều - Dodecahedron)
#let sm-12-mat-deu(
  w: 7cm,
  radius: 2.2,
  mau: black,
  to: sm-amber-light,
  them: none,
) = {
  let p = (1.0 + calc.sqrt(5.0)) / 2.0
  let q = (calc.sqrt(5.0) - 1.0) / 2.0
  let s = radius / calc.sqrt(3.0)
  let raw = (
    (-q*s, 0.0, p*s), (q*s, 0.0, p*s), (-1.0*s, 1.0*s, 1.0*s), (-1.0*s, -1.0*s, 1.0*s),
    (1.0*s, 1.0*s, 1.0*s), (1.0*s, -1.0*s, 1.0*s), (0.0, p*s, q*s), (0.0, -p*s, q*s),
    (-p*s, q*s, 0.0), (-p*s, -q*s, 0.0), (p*s, q*s, 0.0), (p*s, -q*s, 0.0),
    (0.0, p*s, -q*s), (0.0, -p*s, -q*s), (-1.0*s, 1.0*s, -1.0*s), (-1.0*s, -1.0*s, -1.0*s),
    (1.0*s, 1.0*s, -1.0*s), (1.0*s, -1.0*s, -1.0*s), (-q*s, 0.0, -p*s), (q*s, 0.0, -p*s),
  )
  let faces = (
    (0, 1, 4, 6, 2), (0, 2, 8, 9, 3), (0, 3, 7, 5, 1), (1, 5, 11, 10, 4),
    (14, 12, 16, 19, 18), (15, 9, 8, 14, 18), (19, 17, 13, 15, 18), (16, 10, 11, 17, 19),
    (15, 13, 7, 3, 9), (11, 5, 7, 13, 17), (8, 2, 6, 12, 14), (16, 12, 6, 4, 10),
  )
  da-dien(w: w, dinh: raw, mat: faces, mau: mau, to: to, them: them)
}

/// Khối hai mươi mặt đều (20 mặt tam giác đều - Icosahedron)
#let sm-20-mat-deu(
  w: 7cm,
  radius: 2.3,
  mau: black,
  to: sm-blue-light,
  them: none,
) = {
  let p = (1.0 + calc.sqrt(5.0)) / 2.0
  let norm = calc.sqrt(1.0 + p * p)
  let s = radius / norm
  let raw = (
    (-1.0*s, 0.0, p*s), (1.0*s, 0.0, p*s), (0.0, p*s, 1.0*s), (0.0, -p*s, 1.0*s),
    (-p*s, 1.0*s, 0.0), (-p*s, -1.0*s, 0.0), (p*s, 1.0*s, 0.0), (p*s, -1.0*s, 0.0),
    (0.0, p*s, -1.0*s), (0.0, -p*s, -1.0*s), (-1.0*s, 0.0, -p*s), (1.0*s, 0.0, -p*s),
  )
  let faces = (
    (0, 1, 2), (0, 2, 4), (0, 4, 5), (0, 5, 3), (0, 3, 1),
    (4, 10, 5), (5, 10, 9), (9, 3, 5), (3, 9, 7), (3, 7, 1),
    (1, 7, 6), (1, 6, 2), (2, 6, 8), (2, 8, 4), (4, 8, 10),
    (11, 6, 7), (11, 7, 9), (11, 8, 6), (11, 9, 10), (11, 10, 8),
  )
  da-dien(w: w, dinh: raw, mat: faces, mau: mau, to: to, them: them)
}

/// Chóp cụt tam giác đều
#let sm-chop-cuc-tam-giac(
  w: 7cm,
  R: 2.2,
  r: 1.2,
  cao: 2.8,
  ten: ($A$, $B$, $C$, $A'$, $B'$, $C'$),
  mau: black,
  to: sm-blue-light,
  them: none,
) = da-dien(
  w: w,
  ..khoi-chop-cut-deu(n: 3, R: R, r: r, cao: cao),
  ten: ten,
  mau: mau,
  to: to,
  them: them,
)

/// Chóp cụt tứ giác đều
#let sm-chop-cuc-tu-giac(
  w: 7.6cm,
  R: 2.2,
  r: 1.2,
  cao: 2.8,
  ten: ($A$, $B$, $C$, $D$, $A'$, $B'$, $C'$, $D'$),
  mau: black,
  to: sm-green-light,
  them: none,
) = da-dien(
  w: w,
  ..khoi-chop-cut-deu(n: 4, R: R, r: r, cao: cao),
  ten: ten,
  mau: mau,
  to: to,
  them: them,
)

/// Chóp lục giác đều
#let sm-chop-luc-giac-deu(
  w: 7cm,
  R: 2.2,
  cao: 3.5,
  mau: black,
  to: sm-amber-light,
  them: none,
) = da-dien(
  w: w,
  ..khoi-chop-deu(n: 6, R: R, cao: cao),
  mau: mau,
  to: to,
  them: them,
)

// ── 3. KHÔNG GIAN TOẠ ĐỘ OXYZ CHUẨN 12 ─────────────────────────────────────

/// Hệ trục toạ độ Oxyz đơn vị thật kèm vạch chia và lưới
#let sm-oxyz(
  w: 7.5cm,
  x: 5, y: 7, z: 7,
  vach: true,
  so: true,
  luoi: "xy",
  mau-luoi: rgb("#e2e8f0"),
  them: none,
) = oxyz(
  w: w,
  x: x, y: y, z: z,
  vach: vach,
  so: so,
  luoi: luoi,
  mau-luoi: mau-luoi,
  them: them,
)

/// Điểm M(x0, y0, z0) và hộp gióng toạ độ đứt nét xuống 3 mặt phẳng toạ độ
#let sm-oxyz-hop-giong(
  w: 7.5cm,
  pt: (4, 5, 5),
  ten: $M$,
  x-len: 5, y-len: 7, z-len: 7,
) = oxyz(w: w, x: x-len, y: y-len, z: z-len, them: (ctx, t3) => {
  giong-oxyz(ctx, t3, pt, mau: sm-blue)
  diem-oxyz(ctx, t3, pt, ten: ten, huong: "above-right", bk: 2.5pt, mau: sm-blue)
  vecto-oxyz(ctx, t3, (0, 0, 0), pt, mau: sm-red, day: 1.2pt)
})

/// Mặt phẳng đoạn chắn x/a + y/b + z/c = 1 với tam giác vết cắt ABC tô màu
#let sm-oxyz-mat-phang-chan(
  w: 7.5cm,
  a: 3.5, b: 4.5, c: 4.5,
  x-len: 5, y-len: 6, z-len: 6,
) = oxyz(w: w, x: x-len, y: y-len, z: z-len, them: (ctx, t3) => {
  let A = t3((a, 0, 0))
  let B = t3((0, b, 0))
  let C = t3((0, 0, c))
  da-giac(ctx, (A, B, C), to: rgb(225, 29, 72, 40), mau: sm-red, day: 1.2pt)
  diem(ctx, A, ten: $A$, huong: "duoi-trai")
  diem(ctx, B, ten: $B$, huong: "duoi")
  diem(ctx, C, ten: $C$, huong: "trai")
})

// ── 4. KHỐI TRÒN XOAY & MẶT CONG 3D ───────────────────────────────────────

/// Hình nón có trục SO, bán kính đáy r và đường sinh SA
#let sm-non(
  w: 6.5cm,
  r: 2.0, cao: 3.8,
  ten-dinh: $S$, ten-tam: $O$, ten-bk: $r$,
  truc: true,
  mau: black,
  mau-phu: sm-red,
  them: none,
) = hinh-non(
  w: w,
  r: r, cao: cao,
  ten-dinh: ten-dinh,
  ten-tam: ten-tam,
  ten-bk: ten-bk,
  truc: truc,
  mau: mau,
  mau-phu: mau-phu,
  them: them,
)

/// Hình trụ có trục O1O2, 2 đáy và bán kính
#let sm-tru(
  w: 6.5cm,
  r: 1.8, cao: 3.6,
  ten-tam: ($O$, $O'$), ten-bk: $r$,
  truc: true,
  mau: black,
  mau-phu: sm-blue,
  them: none,
) = hinh-tru(
  w: w,
  r: r, cao: cao,
  ten-tam: ten-tam,
  ten-bk: ten-bk,
  truc: truc,
  mau: mau,
  mau-phu: mau-phu,
  them: them,
)

/// Hình cầu có tâm O, bán kính R và đường kinh/vĩ tuyến
#let sm-cau(
  w: 6.5cm,
  r: 2.2,
  ten-tam: $O$, ten-bk: $R$,
  ban-kinh: true,
  mau: black,
  mau-phu: sm-green,
  them: none,
) = hinh-cau(
  w: w,
  r: r,
  ten-tam: ten-tam,
  ten-bk: ten-bk,
  ban-kinh: ban-kinh,
  mau: mau,
  mau-phu: mau-phu,
  them: them,
)

/// Khối tròn xoay tích phân sinh bởi hàm f(x) quay quanh Ox
#let sm-khoi-tron-xoay(
  f: x => calc.sqrt(x),
  a: 0, b: 4,
  ten-ham: $y = sqrt(x)$,
  the-tich: true,
  mat-cat: none,
  w: 6.5cm,
) = khoi-tron-xoay(
  f, a, b,
  ten-ham: ten-ham,
  the-tich: the-tich,
  mat-cat: mat-cat,
  w: w,
)

// ── 5. HÌNH HỌC PHẲNG 2D CHUẨN MỰC ────────────────────────────────────────

/// Tam giác ABC với trực tâm H và 3 đường cao
#let sm-tam-giac-truc-tam(
  A: (0.5, 0), B: (5.5, 0), C: (3.5, 4),
  w: 6.5cm,
) = hinh(w: w, ..khung-vua((A, B, C)), ctx => {
  ve-truc-tam(ctx, A, B, C, mau-cao: sm-red, ten: $H$)
})

/// Tam giác ABC với đường tròn ngoại tiếp tâm O
#let sm-tam-giac-ngoai-tiep(
  A: (0.5, 0), B: (5.5, 0), C: (3.5, 4),
  w: 6.5cm,
) = {
  let (O, R) = tron-qua-diem((A, B, C))
  hinh(w: w, ..khung-vua((A, B, C), (O, R)), ctx => {
    tam-giac(ctx, A, B, C)
    duong-tron-ngoai-tiep(ctx, A, B, C, ban-kinh: true, ten-r: $R$, mau: sm-blue)
  })
}

/// Tam giác ABC với đường tròn nội tiếp tâm I
#let sm-tam-giac-noi-tiep(
  A: (0.5, 0), B: (5.5, 0), C: (3.5, 4),
  w: 6.5cm,
) = hinh(w: w, ..khung-vua((A, B, C)), ctx => {
  tam-giac(ctx, A, B, C)
  duong-tron-noi-tiep(ctx, A, B, C, ban-kinh: true, mau: sm-green)
})

/// Tiếp tuyến từ một điểm M đến đường tròn tâm O bán kính r
#let sm-tiep-tuyen-duong-tron(
  O: (0, 0), r: 2.0, M: (4.5, 1.5),
  w: 6.5cm,
) = hinh(w: w, ..khung-vua((O, r), M), ctx => {
  duong-tron(ctx, O, r, mau: sm-blue)
  diem(ctx, O, ten: $O$, huong: "trai")
  diem(ctx, M, ten: $M$, huong: "phai")
  tiep-tuyen-tu-diem(ctx, O, r, M, mau: sm-red)
})

// ── 6. ĐỒ THỊ HÀM SỐ & CONIC ───────────────────────────────────────────────

/// Đồ thị hàm bậc ba y = a x^3 + b x^2 + c x + d với 2 điểm cực trị gióng toạ độ
#let sm-do-thi-bac-ba(a, b, c, d, w: 7cm) = do-thi-bac-ba(a, b, c, d, w: w, mau: sm-blue)

/// Đồ thị hàm bậc 4 trùng phương y = a x^4 + b x^2 + c
#let sm-do-thi-trung-phuong(a, b, c, w: 7cm) = do-thi-trung-phuong(a, b, c, w: w, mau: sm-purple)

/// Đồ thị hàm phân thức y = (a x + b)/(c x + d) với 2 đường tiệm cận
#let sm-do-thi-phan-thuc(a, b, c, d, w: 7cm) = do-thi-phan-thuc(a, b, c, d, w: w, mau: sm-red)

/// Đồ thị Parabol y = a x^2 + b x + c gióng toạ độ đỉnh I
#let sm-do-thi-bac-hai(a, b, c, w: 7cm) = do-thi-bac-hai(a, b, c, w: w, mau: sm-green)

/// Đường Elip (x/a)^2 + (y/b)^2 = 1 với 2 tiêu điểm F1, F2
#let sm-elip(a: 3, b: 2, scale: 0.8cm) = cetz.canvas(length: scale, {
  import cetz.draw: *
  line((-a - 0.8, 0), (a + 0.8, 0), mark: (end: ">"), stroke: 0.7pt)
  line((0, -b - 0.8), (0, b + 0.8), mark: (end: ">"), stroke: 0.7pt)
  content((a + 0.9, 0), [$x$])
  content((0, b + 0.9), [$y$])
  content((-0.25, -0.25), [$O$])
  let pts = ()
  for i in range(0, 61) {
    let t = i * 2 * calc.pi / 60
    pts.push((a * calc.cos(t), b * calc.sin(t)))
  }
  line(..pts, close: true, fill: sm-purple-light, stroke: 1.5pt + sm-purple)
  let c = calc.sqrt(calc.max(0, a * a - b * b))
  if c > 0 {
    circle((-c, 0), radius: 2.5pt, fill: sm-red)
    circle((c, 0), radius: 2.5pt, fill: sm-red)
    content((-c, -0.35), text(size: 8.5pt, fill: sm-red, weight: "bold")[$F_1$])
    content((c, -0.35), text(size: 8.5pt, fill: sm-red, weight: "bold")[$F_2$])
  }
})

/// Đường Hyperbol (x/a)^2 - (y/b)^2 = 1 với 2 đường tiệm cận và tiêu điểm
#let sm-hyperbol(a: 1.8, b: 1.2, x-max: 3.8, scale: 0.8cm) = cetz.canvas(length: scale, {
  import cetz.draw: *
  line((-x-max - 0.6, 0), (x-max + 0.6, 0), mark: (end: ">"), stroke: 0.7pt)
  line((0, -2.8), (0, 2.8), mark: (end: ">"), stroke: 0.7pt)
  content((x-max + 0.8, 0), [$x$])
  content((0, 3.0), [$y$])
  content((-0.25, -0.25), [$O$])
  let k = b / a
  line((-x-max, -k * x-max), (x-max, k * x-max), stroke: (paint: sm-gray, thickness: 0.8pt, dash: "dashed"))
  line((-x-max, k * x-max), (x-max, -k * x-max), stroke: (paint: sm-gray, thickness: 0.8pt, dash: "dashed"))
  let right-branch = ()
  let left-branch = ()
  for i in range(-20, 21) {
    let t = i * 1.35 / 20
    let x = a * calc.cosh(t)
    let y = b * calc.sinh(t)
    right-branch.push((x, y))
    left-branch.push((-x, y))
  }
  line(..right-branch, stroke: 1.5pt + sm-red)
  line(..left-branch, stroke: 1.5pt + sm-red)
  let c = calc.sqrt(a * a + b * b)
  circle((-c, 0), radius: 2.5pt, fill: sm-amber)
  circle((c, 0), radius: 2.5pt, fill: sm-amber)
  content((-c, -0.35), text(size: 8.5pt, fill: sm-amber, weight: "bold")[$F_1$])
  content((c, -0.35), text(size: 8.5pt, fill: sm-amber, weight: "bold")[$F_2$])
})
#let sm-hypebol = sm-hyperbol

// ── 7. XÁC SUẤT: SƠ ĐỒ CÂY ─────────────────────────────────────────────────

/// Sơ đồ cây xác suất chuẩn mực THPT
#let sm-so-do-cay(
  goc: $Omega$,
  nhanh: (
    nut($A$, xs: $0.4$, con: (
      nut($B$, xs: $0.7$, kq: $P(A B) = 0.28$),
      nut($overline(B)$, xs: $0.3$, kq: $P(A overline(B)) = 0.12$),
    )),
    nut($overline(A)$, xs: $0.6$, con: (
      nut($B$, xs: $0.5$, kq: $P(overline(A) B) = 0.30$),
      nut($overline(B)$, xs: $0.5$, kq: $P(overline(A) overline(B)) = 0.30$),
    )),
  ),
  w: 12cm,
) = so-do-cay(goc: goc, nhanh: nhanh)

// ── 8. PHẲNG HOÁ & KHAI TRIỂN HÌNH KHÔNG GIAN (GEODESIC) ───────────────────
#import "@preview/cetz:0.5.2"

/// Khai triển hình nón thành quạt tròn trên mặt phẳng
#let sm-khai-trien-non(
  r: 3, h: 4,
  labels: ("S", "A", "A'"),
  draw-base: true,
  scale: 0.7cm,
) = cetz.canvas(length: scale, {
  import cetz.draw: *
  let l = calc.sqrt(r * r + h * h)
  let theta = (r / l) * 360deg
  let S = (0, 0)
  let start-angle = 270deg - theta / 2
  let end-angle = 270deg + theta / 2
  let A = (l * calc.cos(start-angle), l * calc.sin(start-angle))
  let A-prime = (l * calc.cos(end-angle), l * calc.sin(end-angle))
  arc(S, start: start-angle, stop: end-angle, radius: l, fill: sm-blue-light, stroke: 1.2pt + sm-blue)
  line(S, A, stroke: 1.2pt + sm-blue)
  line(S, A-prime, stroke: 1.2pt + sm-blue)
  circle(S, radius: 2.5pt, fill: black)
  content((S.at(0), S.at(1) + 0.4), text(size: 10pt, weight: "bold")[#labels.at(0)])
  circle(A, radius: 2.5pt, fill: black)
  content((A.at(0) - 0.4, A.at(1) - 0.3), text(size: 10pt, weight: "bold")[#labels.at(1)])
  circle(A-prime, radius: 2.5pt, fill: black)
  content((A-prime.at(0) + 0.4, A-prime.at(1) - 0.3), text(size: 10pt, weight: "bold")[#labels.at(2)])
  if draw-base {
    let mid-angle = 270deg
    let M = (l * calc.cos(mid-angle), l * calc.sin(mid-angle))
    let O = (M.at(0), M.at(1) - r)
    circle(O, radius: r, stroke: 1pt + sm-blue, fill: sm-blue-light)
    circle(O, radius: 2.5pt, fill: black)
    content((O.at(0) + 0.3, O.at(1)), text(size: 10pt, weight: "bold")[$O$])
  }
})

/// Khai triển hình trụ thành hình chữ nhật và 2 hình tròn đáy
#let sm-khai-trien-tru(
  r: 2, h: 5,
  labels: ("A", "B", "B'", "A'"),
  draw-bases: true,
  scale: 0.6cm,
) = cetz.canvas(length: scale, {
  import cetz.draw: *
  let width = 2 * calc.pi * r
  let height = h
  let A = (0, 0)
  let B = (0, height)
  let B-prime = (width, height)
  let A-prime = (width, 0)
  line(A, B, B-prime, A-prime, A, fill: sm-green-light, stroke: 1.2pt + sm-green)
  if draw-bases {
    let O1 = (width / 2, height + r)
    let O2 = (width / 2, -r)
    circle(O1, radius: r, stroke: 1pt + sm-green, fill: sm-green-light)
    circle(O2, radius: r, stroke: 1pt + sm-green, fill: sm-green-light)
    circle(O1, radius: 2.5pt, fill: black)
    content((O1.at(0) + 0.3, O1.at(1)), text(size: 10pt, weight: "bold")[$O'$])
    circle(O2, radius: 2.5pt, fill: black)
    content((O2.at(0) + 0.3, O2.at(1)), text(size: 10pt, weight: "bold")[$O$])
  }
  let pts = (A, B, B-prime, A-prime)
  for (i, p) in pts.enumerate() {
    circle(p, radius: 2.5pt, fill: black)
    let (dx, dy) = if i == 0 { (-0.3, -0.3) } else if i == 1 { (-0.3, 0.3) } else if i == 2 { (0.3, 0.3) } else { (0.3, -0.3) }
    content((p.at(0) + dx, p.at(1) + dy), text(size: 10pt, weight: "bold")[#labels.at(i)])
  }
})

/// Khai triển chóp S.ABC ra mặt phẳng
#let sm-khai-trien-sabc(
  SA: 5, SB: 6, SC: 5.5,
  AB: 4, BC: 4.5, CA: 3.5,
  labels: ("S", "A", "B", "C1", "C2"),
  scale: 0.7cm,
) = cetz.canvas(length: scale, {
  import cetz.draw: *
  let intersect-circles(P1, r1, P2, r2) = {
    let (x1, y1) = P1
    let (x2, y2) = P2
    let d = calc.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
    if d > r1 + r2 or d < calc.abs(r1 - r2) or d == 0 { return (P1, P1) }
    let a = (r1 * r1 - r2 * r2 + d * d) / (2 * d)
    let h = calc.sqrt(r1 * r1 - a * a)
    let x3 = x1 + a * (x2 - x1) / d
    let y3 = y1 + a * (y2 - y1) / d
    let pA = (x3 + h * (y2 - y1) / d, y3 - h * (x2 - x1) / d)
    let pB = (x3 - h * (y2 - y1) / d, y3 + h * (x2 - x1) / d)
    (pA, pB)
  }
  let cross-product(P1, P2, P3) = {
    (P2.at(0) - P1.at(0)) * (P3.at(1) - P1.at(1)) - (P2.at(1) - P1.at(1)) * (P3.at(0) - P1.at(0))
  }
  let A = (0, 0)
  let B = (AB, 0)
  let (S1, S2) = intersect-circles(A, SA, B, SB)
  let S = if S1.at(1) > S2.at(1) { S1 } else { S2 }
  let (C1-A, C1-B) = intersect-circles(B, BC, S, SC)
  let cp-A = cross-product(S, B, A)
  let cp-C1-A = cross-product(S, B, C1-A)
  let C1 = if cp-A * cp-C1-A < 0 { C1-A } else { C1-B }
  let (C2-A, C2-B) = intersect-circles(A, CA, S, SC)
  let cp-B = cross-product(S, A, B)
  let cp-C2-A = cross-product(S, A, C2-A)
  let C2 = if cp-B * cp-C2-A < 0 { C2-A } else { C2-B }
  line(A, B, S, A, fill: rgb("#fff5ee"), stroke: 1.2pt + black)
  line(B, C1, S, B, fill: sm-blue-light, stroke: 1.2pt + black)
  line(A, C2, S, A, fill: sm-green-light, stroke: 1.2pt + black)
  line(C2, C1, stroke: (paint: sm-red, thickness: 1.3pt, dash: "dashed"))
  let pts = (S, A, B, C1, C2)
  for (i, p) in pts.enumerate() {
    circle(p, radius: 2.5pt, fill: black)
    let lbl = labels.at(i)
    let (dx, dy) = if lbl == "S" { (0, 0.4) } else if lbl == "A" { (-0.3, -0.3) } else if lbl == "B" { (0.3, -0.3) } else if lbl == "C1" { (0.4, 0.1) } else { (-0.4, 0.1) }
    content((p.at(0) + dx, p.at(1) + dy), text(size: 10pt, weight: "bold")[#lbl])
  }
})

// Tương thích ngược:
#let phanghoa-non = sm-khai-trien-non
#let phanghoa-tru = sm-khai-trien-tru
#let phanghoa-sabc = sm-khai-trien-sabc
