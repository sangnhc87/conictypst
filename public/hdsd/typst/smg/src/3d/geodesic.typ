// ═════════════════════════════════════════════════════════════════════════════
// MODULE GEODESICS (TỰ ĐỘNG TÍNH TOÁN ĐƯỜNG ĐI NGẮN NHẤT TRÊN MẶT 3D)
// Cung cấp các macro tự động sinh toạ độ đường xoắn ốc và tự động nét đứt.
// ═════════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2"

#let _ge-blue = rgb("#0057b8")
#let _ge-red = rgb("#E91E63") // Màu đỏ hồng chuẩn bài giảng
#let _ge-scale = 0.8cm

// ── Hàm phụ: Sửa lỗi arc cho cetz 0.5.2 ───────────────────
#let _arc(center, start: 0deg, stop: 180deg, radius: 1, ..style) = {
  let (rx, ry) = if type(radius) == dictionary or type(radius) == array {
    (radius.at(0), radius.at(1))
  } else {
    (radius, radius)
  }
  let sx = center.at(0) + rx * calc.cos(start)
  let sy = center.at(1) + ry * calc.sin(start)
  cetz.draw.arc((sx, sy), start: start, stop: stop, radius: radius, ..style)
}

// ── Hàm phụ: Phép chiếu 3D -> 2D ──────────────────────────
#let project-3d(x, y, z, tilt: 0.266) = {
  return (x, y * tilt + z)
}

// ── Hàm phụ: Chia mảng toạ độ thành các đoạn front/back ───
// Truyền vào mảng các object: (pt: (x,y), is-back: bool)
#let draw-path-segments(pts) = {
  import cetz.draw: *
  let current-segment = ()
  let current-is-back = pts.at(0).is-back
  
  for p in pts {
    if p.is-back == current-is-back {
      current-segment.push(p.pt)
    } else {
      // Đổi trạng thái, vẽ đoạn cũ
      if current-segment.len() > 1 {
        if current-is-back {
          line(..current-segment, stroke: (dash: "dashed", paint: _ge-red, thickness: 1.5pt))
        } else {
          line(..current-segment, stroke: 1.5pt + _ge-red)
        }
      }
      // Khởi tạo đoạn mới, nối tiếp điểm cuối của đoạn cũ để không bị đứt quãng
      current-segment = (current-segment.last(), p.pt)
      current-is-back = p.is-back
    }
  }
  // Vẽ đoạn cuối cùng
  if current-segment.len() > 1 {
    if current-is-back {
      line(..current-segment, stroke: (dash: "dashed", paint: _ge-red, thickness: 1.5pt))
    } else {
      line(..current-segment, stroke: 1.5pt + _ge-red)
    }
  }
}

// ── 1. ĐƯỜNG XOẮN ỐC TRÊN HÌNH NÓN (3D) ───────────────────
#let cone-geodesic-3d(
  r: 3, h: 8, 
  loops: 3, 
  start-angle: 180deg, 
  end-distance: 5, // Khoảng cách từ đỉnh S đến điểm kết thúc B
  tilt: 0.266,     // Độ bẹp của elip (ví dụ 0.8 / 3 = 0.266)
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    
    // Đỉnh nón và tâm đáy
    let S = (0, h)
    let O = (0, 0)
    let l = calc.sqrt(r * r + h * h)
    
    // Vẽ đáy nón
    _arc(O, start: 0deg, stop: -180deg, radius: (r, r * tilt), stroke: 1.5pt)
    _arc(O, start: 0deg, stop: 180deg, radius: (r, r * tilt), stroke: (dash: "dashed", paint: rgb("555")))
    
    // Viền trái, viền phải
    line(S, (-r, 0), stroke: 1.5pt)
    line(S, (r, 0), stroke: 1.5pt)
    
    // Trục SO (ẩn)
    line(S, O, stroke: (dash: "dashed", paint: rgb("999")))
    
    circle(S, radius: 0.08, fill: black); content((S.at(0), S.at(1) + 0.5), [$S$])
    
    // Tính toán mảng điểm xoắn ốc (Geodesic)
    let alpha-cone = (r / l) * 360deg
    let total-angle = loops * alpha-cone
    
    // Trên hình trải phẳng: Đỉnh S là gốc toạ độ (0,0).
    // Điểm A (bắt đầu):
    let pA-flat = (l * calc.cos(0deg), l * calc.sin(0deg))
    // Điểm B (kết thúc):
    let pB-flat = (end-distance * calc.cos(total-angle), end-distance * calc.sin(total-angle))
    
    let num-points = int(100 * loops) // Càng nhiều vòng càng cần nhiều điểm cho mượt
    let path-pts = ()
    
    for i in range(num-points + 1) {
      let t = i / num-points
      // Nội suy tuyến tính trên hình trải phẳng (Geodesic = đường thẳng)
      let x-flat = pA-flat.at(0) * (1 - t) + pB-flat.at(0) * t
      let y-flat = pA-flat.at(1) * (1 - t) + pB-flat.at(1) * t
      
      let rho = calc.sqrt(x-flat * x-flat + y-flat * y-flat)
      let phi = calc.atan2(x-flat, y-flat) // Hệ đo góc của Typst
      
      // Chuyển lại toạ độ 3D
      let theta = phi * (l / r) + start-angle
      let r-3d = rho * (r / l)
      let z-3d = h - rho * (h / l)
      
      // Cân chỉnh góc xoay: Cetz tính 0deg là trục Ox (bên phải).
      let X = r-3d * calc.cos(theta)
      let Y = r-3d * calc.sin(theta)
      
      let p-2d = project-3d(X, Y, z-3d, tilt: tilt)
      
      // Nếu Y > 0 (nửa sau của nón) thì bị khuất
      let is-back = Y > 0
      
      path-pts.push((pt: p-2d, is-back: is-back))
    }
    
    // Vẽ quỹ đạo
    draw-path-segments(path-pts)
    
    // Nhãn A và B
    let pA = path-pts.first().pt
    let pB = path-pts.last().pt
    circle(pA, radius: 0.1, fill: _ge-blue); content((pA.at(0) - 0.5, pA.at(1) - 0.2), [$A$])
    circle(pB, radius: 0.1, fill: rgb("388E3C")); content((pB.at(0) + 0.4, pB.at(1)), [$B$])
  })
}

// ── 2. TRẢI PHẲNG NHIỀU VÒNG NÓN (2D) ──────────────────────
#let cone-unfold-2d(
  r: 3, h: 8, 
  loops: 3,
  end-distance: 5,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let S = (0, 0)
    let l = calc.sqrt(r * r + h * h)
    let alpha-cone = (r / l) * 360deg
    let total-angle = loops * alpha-cone
    
    let base-angle = 0deg // Góc bắt đầu vẽ quạt
    
    // Vẽ từng "vành nón" ghép lại
    for i in range(int(calc.ceil(loops))) {
      let start-a = base-angle + i * alpha-cone
      let end-a = start-a + alpha-cone
      
      let pA = (l * calc.cos(start-a), l * calc.sin(start-a))
      let pB = (l * calc.cos(end-a), l * calc.sin(end-a))
      
      // Đường phân tách các vòng
      line(S, pA, stroke: (dash: "dashed", paint: rgb("999")))
      if i == loops - 1 {
        line(S, pB, stroke: 1.5pt + _ge-blue) // Viền cuối cùng
      }
      
      // Viền cung
      _arc(S, start: start-a, stop: end-a, radius: l, stroke: 1.5pt + _ge-blue)
    }
    
    let pA-start = (l * calc.cos(base-angle), l * calc.sin(base-angle))
    line(S, pA-start, stroke: 1.5pt + _ge-blue) // Viền đầu tiên
    
    // Đường đi ngắn nhất (căng dây)
    let pB-end = (end-distance * calc.cos(base-angle + total-angle), end-distance * calc.sin(base-angle + total-angle))
    
    line(pA-start, pB-end, stroke: 2pt + _ge-red)
    
    circle(S, radius: 0.1, fill: black); content((S.at(0) - 0.4, S.at(1)), [$S$])
    circle(pA-start, radius: 0.1, fill: _ge-blue); content((pA-start.at(0) + 0.4, pA-start.at(1)), [$A$])
    circle(pB-end, radius: 0.1, fill: rgb("388E3C")); content((pB-end.at(0) + 0.4, pB-end.at(1)), [$B'$])
  })
}

// ── 3. ĐƯỜNG XOẮN ỐC TRÊN HÌNH TRỤ (3D) ────────────────────
#let cylinder-geodesic-3d(
  r: 2, h: 5,
  loops: 2,
  start-angle: 180deg,
  tilt: 0.3,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let O1 = (0, 0)
    let O2 = (0, h)
    
    // Đáy dưới
    _arc(O1, start: 0deg, stop: -180deg, radius: (r, r * tilt), stroke: 1.5pt)
    _arc(O1, start: 0deg, stop: 180deg, radius: (r, r * tilt), stroke: (dash: "dashed", paint: rgb("555")))
    
    // Đáy trên
    circle(O2, radius: (r, r * tilt), stroke: 1.5pt)
    
    // Viền bên
    line((-r, 0), (-r, h), stroke: 1.5pt)
    line((r, 0), (r, h), stroke: 1.5pt)
    
    // Trục (ẩn)
    line(O1, O2, stroke: (dash: "dashed", paint: rgb("999")))
    
    // Geodesic (Quỹ đạo)
    let num-points = int(100 * loops)
    let path-pts = ()
    
    for i in range(num-points + 1) {
      let t = i / num-points
      let theta = start-angle + t * loops * 360deg
      let Z = t * h
      let X = r * calc.cos(theta)
      let Y = r * calc.sin(theta)
      
      let p-2d = project-3d(X, Y, Z, tilt: tilt)
      let is-back = Y > 0
      path-pts.push((pt: p-2d, is-back: is-back))
    }
    
    draw-path-segments(path-pts)
  })
}

// ── 4. TRẢI PHẲNG NHIỀU VÒNG TRỤ (2D) ──────────────────────
#let cylinder-unfold-2d(
  r: 2, h: 5,
  loops: 2,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let W = 2 * calc.pi * r
    let H = h
    
    let total-W = loops * W
    
    // Viền khung chữ nhật tổng
    line((0, 0), (total-W, 0), (total-W, H), (0, H), (0, 0), stroke: 1.5pt + _ge-blue)
    
    // Viền phân tách các vòng
    for i in range(1, int(calc.ceil(loops))) {
      line((i * W, 0), (i * W, H), stroke: (dash: "dashed", paint: rgb("999")))
    }
    
    // Quỹ đạo căng dây
    line((0, 0), (total-W, H), stroke: 2pt + _ge-red)
    
    circle((0,0), radius: 0.1, fill: _ge-blue); content((-0.4, -0.4), [$A$])
    circle((total-W, H), radius: 0.1, fill: rgb("388E3C")); content((total-W + 0.4, H + 0.4), [$B'$])
  })
}

// ── 5. ĐƯỜNG XOẮN ỐC TRÊN HÌNH NÓN CỤT (3D) ────────────────
#let truncated-cone-geodesic-3d(
  R: 3, r: 1, h: 4, 
  loops: 2, 
  start-angle: 180deg, 
  tilt: 0.266,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    
    let H = h * R / (R - r)
    let lc = calc.sqrt((R - r)*(R - r) + h * h)
    let L = lc * R / (R - r)
    let l_small = L - lc
    
    let S = (0, H)
    let O_bottom = (0, 0)
    let O_top = (0, h)
    
    _arc(O_bottom, start: 0deg, stop: -180deg, radius: (R, R * tilt), stroke: 1.5pt)
    _arc(O_bottom, start: 0deg, stop: 180deg, radius: (R, R * tilt), stroke: (dash: "dashed", paint: rgb("555")))
    
    _arc(O_top, start: 0deg, stop: -180deg, radius: (r, r * tilt), stroke: 1.5pt)
    _arc(O_top, start: 0deg, stop: 180deg, radius: (r, r * tilt), stroke: 1.5pt) 
    
    line((-R, 0), (-r, h), stroke: 1.5pt)
    line((R, 0), (r, h), stroke: 1.5pt)
    
    line((-r, h), S, stroke: (dash: "dashed", paint: rgb("999")))
    line((r, h), S, stroke: (dash: "dashed", paint: rgb("999")))
    
    let alpha-cone = (R / L) * 360deg
    let total-angle = loops * alpha-cone
    
    let pA-flat = (L * calc.cos(0deg), L * calc.sin(0deg))
    let pB-flat = (l_small * calc.cos(total-angle), l_small * calc.sin(total-angle))
    
    let num-points = int(100 * calc.max(1.0, loops))
    let path-pts = ()
    
    for i in range(num-points + 1) {
      let t = i / num-points
      let x-flat = pA-flat.at(0) * (1 - t) + pB-flat.at(0) * t
      let y-flat = pA-flat.at(1) * (1 - t) + pB-flat.at(1) * t
      
      let rho = calc.sqrt(x-flat * x-flat + y-flat * y-flat)
      let phi = calc.atan2(x-flat, y-flat)
      
      let theta = phi * (L / R) + start-angle
      let r-3d = rho * (R / L)
      let z-3d = H - rho * (H / L)
      
      let X = r-3d * calc.cos(theta)
      let Y = r-3d * calc.sin(theta)
      
      let p-2d = project-3d(X, Y, z-3d, tilt: tilt)
      let is-back = Y > 0
      
      path-pts.push((pt: p-2d, is-back: is-back))
    }
    
    draw-path-segments(path-pts)
  })
}

// ── 6. TRẢI PHẲNG NHIỀU VÒNG NÓN CỤT (2D) ──────────────────
#let truncated-cone-unfold-2d(
  R: 3, r: 1, h: 4, 
  loops: 2,
  scale: _ge-scale,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *
    let H = h * R / (R - r)
    let lc = calc.sqrt((R - r)*(R - r) + h * h)
    let L = lc * R / (R - r)
    let l_small = L - lc
    
    let S = (0, 0)
    let alpha-cone = (R / L) * 360deg
    let total-angle = loops * alpha-cone
    let base-angle = 0deg
    
    for i in range(int(calc.ceil(loops))) {
      let start-a = base-angle + i * alpha-cone
      let end-a = start-a + alpha-cone
      
      let pA = (L * calc.cos(start-a), L * calc.sin(start-a))
      let pB = (L * calc.cos(end-a), L * calc.sin(end-a))
      
      let pa = (l_small * calc.cos(start-a), l_small * calc.sin(start-a))
      let pb = (l_small * calc.cos(end-a), l_small * calc.sin(end-a))
      
      line(pa, pA, stroke: (dash: "dashed", paint: rgb("999")))
      if i == int(calc.ceil(loops)) - 1 {
        line(pb, pB, stroke: 1.5pt + _ge-blue)
      }
      
      _arc(S, start: start-a, stop: end-a, radius: L, stroke: 1.5pt + _ge-blue)
      _arc(S, start: start-a, stop: end-a, radius: l_small, stroke: 1.5pt + _ge-blue)
    }
    
    let pA-start = (L * calc.cos(base-angle), L * calc.sin(base-angle))
    let pa-start = (l_small * calc.cos(base-angle), l_small * calc.sin(base-angle))
    line(pa-start, pA-start, stroke: 1.5pt + _ge-blue)
    
    let pB-end = (l_small * calc.cos(base-angle + total-angle), l_small * calc.sin(base-angle + total-angle))
    
    line(pA-start, pB-end, stroke: 2pt + _ge-red)
    
    circle(pA-start, radius: 0.1, fill: _ge-blue); content((pA-start.at(0) + 0.4, pA-start.at(1)), [$A$])
    circle(pB-end, radius: 0.1, fill: rgb("388E3C")); content((pB-end.at(0) + 0.4, pB-end.at(1)), [$B'$])
    
    circle(S, radius: 0.1, fill: rgb("999")); content((S.at(0) - 0.4, S.at(1)), [$S$])
    line(S, pa-start, stroke: (dash: "dashed", paint: rgb("999")))
    let pb-end = (l_small * calc.cos(base-angle + total-angle), l_small * calc.sin(base-angle + total-angle))
    line(S, pb-end, stroke: (dash: "dashed", paint: rgb("999")))
  })
}
