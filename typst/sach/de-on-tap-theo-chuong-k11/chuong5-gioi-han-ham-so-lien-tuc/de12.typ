#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.frac: math.display

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// ĐỊNH NGHĨA CÁC HÌNH VẼ MINH HỌA (CETZ)
// ═══════════════════════════════════════════════════════════

// Hình 1: Xoắn ốc tam giác vuông cân lùi vô hạn
#let fig-right-triangles-spiral = canvas(length: 1cm, {
  import draw: *
  let colors = (
    rgb("#0057b8"), // Xanh dương
    rgb("#cc2200"), // Đỏ
    rgb("#1a7a2e"), // Xanh lá
    rgb("#e67e22"), // Cam
    rgb("#9b59b6"), // Tím
    rgb("#008080"), // Teal
  )
  
  let r = 4.5
  let angle = 0deg
  let pts = ()
  for i in range(7) {
    let theta = angle + i * 45deg
    let next-theta = theta + 45deg
    let next-r = r * calc.cos(45deg)
    
    let p_curr = (r * calc.cos(theta), r * calc.sin(theta))
    let p_next = (next-r * calc.cos(next-theta), next-r * calc.sin(next-theta))
    let O = (0,0)
    
    let col = colors.at(calc.rem(i, colors.len()))
    line(O, p_curr, p_next, close: true, stroke: (1.2pt - i * 0.15pt) + col, fill: col.lighten(92%))
    r = next-r
  }
  circle((0,0), radius: 2pt, fill: black)
  content((-0.3, -0.3), [O])
})

// Hình 2: Xoắn ốc cung tròn tỷ lệ vàng (Golden Spiral)
#let fig-golden-spiral = canvas(length: 1cm, {
  import draw: *
  let colors = (
    rgb("#0057b8"),
    rgb("#cc2200"),
    rgb("#1a7a2e"),
    rgb("#e67e22"),
    rgb("#9b59b6"),
    rgb("#008080"),
  )
  
  let q = 0.6
  let R = 3.0
  let cx = 0.0
  let cy = 0.0
  
  for k in range(6) {
    let col = colors.at(k)
    let start-ang = 270deg - k * 90deg
    
    let start-ang-rad = (270 - k * 90) * calc.pi / 180
    let start-pt = (cx + R * calc.cos(start-ang-rad), cy + R * calc.sin(start-ang-rad))
    
    arc(start-pt, start: start-ang, delta: -90deg, radius: R, stroke: 2pt + col)
    
    let m_quad = calc.rem(k, 4)
    if m_quad == 0 {
      rect((cx - R, cy - R), (cx, cy), stroke: 0.5pt + gray.lighten(50%))
    } else if m_quad == 1 {
      rect((cx - R, cy), (cx, cy + R), stroke: 0.5pt + gray.lighten(50%))
    } else if m_quad == 2 {
      rect((cx, cy), (cx + R, cy + R), stroke: 0.5pt + gray.lighten(50%))
    } else if m_quad == 3 {
      rect((cx, cy - R), (cx + R, cy), stroke: 0.5pt + gray.lighten(50%))
    }
    
    let next-R = R * q
    let d = R - next-R
    let step = k
    let m = calc.rem(step, 4)
    if m == 0 {
      cx = cx - d
    } else if m == 1 {
      cy = cy + d
    } else if m == 2 {
      cx = cx + d
    } else if m == 3 {
      cy = cy - d
    }
    R = next-R
  }
})

// Hình 3: Lục giác đều lồng nhau xoay góc
#let fig-nested-hexagons = canvas(length: 1.1cm, {
  import draw: *
  let colors = (
    rgb("#0057b8"),
    rgb("#cc2200"),
    rgb("#1a7a2e"),
    rgb("#e67e22"),
    rgb("#9b59b6"),
  )
  
  let R = 2.0
  let angle-offset = 0deg
  for k in range(5) {
    let col = colors.at(k)
    let pts = range(6).map(i => {
      let a = i * 60deg + angle-offset
      (R * calc.cos(a), R * calc.sin(a))
    })
    line(..pts, close: true, stroke: (1.3pt - k * 0.2pt) + col, fill: col.lighten(94%))
    
    R = R * calc.cos(30deg)
    angle-offset = angle-offset + 30deg
  }
})

// Hình 4: Đường gấp khúc ziczac tam giác cân
#let fig-zigzag-angle = canvas(length: 1cm, {
  import draw: *
  line((0, 0), (6, 0), stroke: 1.2pt + black)
  line((0, 0), (6 * calc.cos(30deg), 6 * calc.sin(30deg)), stroke: 1.2pt + black)
  
  arc((1.0, 0), start: 0deg, delta: 30deg, radius: 1.0, stroke: 0.8pt + black)
  content((1.3, 0.3), [$30°$])
  content((-0.2, -0.2), [O])
  
  let r = 5.0
  let pts = ((5.0, 0.0),)
  for k in range(1, 8) {
    let next-r = r * calc.cos(30deg)
    let p = (0.0, 0.0)
    if calc.odd(k) {
      p = (next-r * calc.cos(30deg), next-r * calc.sin(30deg))
    } else {
      p = (next-r, 0.0)
    }
    pts.push(p)
    r = next-r
  }
  
  for i in range(pts.len() - 1) {
    let stroke-val = (1.5pt - i * 0.15pt) + rgb("#cc2200")
    line(pts.at(i), pts.at(i+1), stroke: stroke-val)
    circle(pts.at(i), radius: 2.5pt - i * 0.2pt, fill: rgb("#0057b8"))
  }
})

// Hình 5: Tháp cầu xếp chồng
#let fig-stacked-spheres = canvas(length: 1cm, {
  import draw: *
  let colors = (
    rgb("#0057b8"),
    rgb("#cc2200"),
    rgb("#1a7a2e"),
    rgb("#e67e22"),
    rgb("#9b59b6"),
  )
  
  line((-2, 0), (2, 0), stroke: 1.5pt + black)
  
  let R = 1.2
  let cy = 0.0
  let q = 0.65
  
  for k in range(5) {
    let col = colors.at(k)
    circle((0, cy + R), radius: R, stroke: 1.2pt + col, fill: col.lighten(92%))
    cy = cy + 2 * R
    R = R * q
  }
})

// Hình 6: Quạt giấy xoắn ốc (Spiral Sector)
#let fig-spiral-sector = canvas(length: 1cm, {
  import draw: *
  let colors = (
    rgb("#0057b8"),
    rgb("#cc2200"),
    rgb("#1a7a2e"),
    rgb("#e67e22"),
    rgb("#9b59b6"),
    rgb("#008080"),
  )
  
  let R = 3.2
  let q = 0.75
  let O = (0,0)
  
  for k in range(6) {
    let col = colors.at(k)
    let start-ang = k * 60deg
    let end-ang = start-ang + 60deg
    
    let p_start = (R * calc.cos(start-ang), R * calc.sin(start-ang))
    let p_end = (R * calc.cos(end-ang), R * calc.sin(end-ang))
    
    // Fill the sector using mode: "PIE" (start point is p_start)
    arc(p_start, start: start-ang, stop: end-ang, radius: R, mode: "PIE", stroke: none, fill: col.lighten(94%))
    // Radial boundary lines
    line(O, p_start, stroke: 1pt + col)
    line(O, p_end, stroke: 1pt + col)
    // Curved outer boundary arc
    arc(p_start, start: start-ang, stop: end-ang, radius: R, stroke: 1.5pt + col)
    
    R = R * q
  }
  circle(O, radius: 2pt, fill: black)
})

// Hình 7: Chuỗi hình tròn tiếp xúc chêm góc 60 độ
#let fig-circles-wedge = canvas(length: 1cm, {
  import draw: *
  let colors = (
    rgb("#9b59b6"),
    rgb("#1a7a2e"),
    rgb("#cc2200"),
    rgb("#0057b8"),
  )
  
  line((0, 0), (6 * calc.cos(30deg), 6 * calc.sin(30deg)), stroke: 1.2pt + black)
  line((0, 0), (6 * calc.cos(-30deg), 6 * calc.sin(-30deg)), stroke: 1.2pt + black)
  
  let R = 0.0667
  let x = 0.1333
  for k in range(4) {
    let col = colors.at(k)
    circle((x, 0), radius: R, stroke: 1.2pt + col, fill: col.lighten(94%))
    x = x + R + R * 3
    R = R * 3
  }
})

// Hình 8: Thập tự hình vuông Fractal
#let fig-square-cross = canvas(length: 1cm, {
  import draw: *
  let c0 = rgb("#0057b8")
  let c1 = rgb("#cc2200")
  let c2 = rgb("#1a7a2e")
  
  let s0 = 1.6
  rect((-s0/2, -s0/2), (s0/2, s0/2), stroke: 0.8pt + c0, fill: c0.lighten(92%))
  
  let s1 = s0 * 0.45
  let d1 = s0/2 + s1/2
  let dirs = ((0, 1), (0, -1), (1, 0), (-1, 0))
  for (dx, dy) in dirs {
    rect((dx * d1 - s1/2, dy * d1 - s1/2), (dx * d1 + s1/2, dy * d1 + s1/2), stroke: 0.6pt + c1, fill: c1.lighten(92%))
    
    let s2 = s1 * 0.45
    let d2 = s1/2 + s2/2
    for (ddx, ddy) in dirs {
      if (ddx != -dx or ddy != -dy) {
        let cx2 = dx * d1 + ddx * d2
        let cy2 = dy * d1 + ddy * d2
        rect((cx2 - s2/2, cy2 - s2/2), (cx2 + s2/2, cy2 + s2/2), stroke: 0.4pt + c2, fill: c2.lighten(92%))
      }
    }
  }
})

// Hình 9: Xoắn ốc elip lồng nhau
#let fig-nested-ellipses = canvas(length: 1cm, {
  import draw: *
  let colors = (
    rgb("#0057b8"),
    rgb("#cc2200"),
    rgb("#1a7a2e"),
    rgb("#e67e22"),
    rgb("#9b59b6"),
  )
  
  let rx = 3.0
  let ry = 1.8
  let q = 0.7
  
  for k in range(5) {
    let col = colors.at(k)
    circle((0,0), radius: (rx, ry), stroke: (1.5pt - k * 0.25pt) + col, fill: col.lighten(95%))
    rx = rx * q
    ry = ry * q
  }
})

// Hình 10: Khối lập phương xếp chồng
#let fig-stacked-cubes = canvas(length: 1.1cm, {
  import draw: *
  let colors = (
    rgb("#0057b8"),
    rgb("#cc2200"),
    rgb("#1a7a2e"),
    rgb("#e67e22"),
  )
  
  line((-2, 0), (2, 0), stroke: 1.5pt + black)
  
  let s = 1.8
  let cy = 0.0
  let q = 0.6
  
  for k in range(4) {
    let col = colors.at(k)
    let cx = 0.0
    
    rect((cx - s/2, cy), (cx + s/2, cy + s), stroke: 1pt + col, fill: col.lighten(90%))
    
    let p1 = (cx - s/2, cy + s)
    let p2 = (cx + s/2, cy + s)
    let p3 = (cx + s/2 + s * 0.3, cy + s + s * 0.3)
    let p4 = (cx - s/2 + s * 0.3, cy + s + s * 0.3)
    line(p1, p2, p3, p4, close: true, stroke: 1pt + col, fill: col.lighten(85%))
    
    let s1 = (cx + s/2, cy)
    let s2 = (cx + s/2, cy + s)
    let s3 = (cx + s/2 + s * 0.3, cy + s + s * 0.3)
    let s4 = (cx + s/2 + s * 0.3, cy + s * 0.3)
    line(s1, s2, s3, s4, close: true, stroke: 1pt + col, fill: col.lighten(80%))
    
    cy = cy + s
    s = s * q
  }
})

// Hình 11: Fractal chữ T (T-Square)
#let fig-t-square = canvas(length: 1cm, {
  import draw: *
  let c0 = rgb("#0057b8")
  let c1 = rgb("#cc2200")
  let c2 = rgb("#1a7a2e")
  
  let s0 = 1.6
  rect((-s0/2, -s0/2), (s0/2, s0/2), stroke: 0.8pt + c0, fill: c0.lighten(90%))
  
  let s1 = s0 / 2
  let corners = ((-1, -1), (-1, 1), (1, -1), (1, 1))
  for (cx, cy) in corners {
    let x1 = cx * s0/2
    let y1 = cy * s0/2
    rect((x1 - s1/2, y1 - s1/2), (x1 + s1/2, y1 + s1/2), stroke: 0.6pt + c1, fill: c1.lighten(92%))
    
    let s2 = s1 / 2
    for (ccx, ccy) in corners {
      let x2 = x1 + ccx * s1/2
      let y2 = y1 + ccy * s1/2
      rect((x2 - s2/2, y2 - s2/2), (x2 + s2/2, y2 + s2/2), stroke: 0.4pt + c2, fill: c2.lighten(94%))
    }
  }
})

// Hình 12: Tam giác đều và đường tròn lồng nhau
#let fig-triangle-circle = canvas(length: 1.1cm, {
  import draw: *
  let h_val = calc.sqrt(3)
  
  let triangle-colors = (
    rgb("#0057b8"),
    rgb("#1a7a2e"),
    rgb("#9b59b6"),
    rgb("#008080"),
  )
  
  let circle-colors = (
    rgb("#cc2200"),
    rgb("#e67e22"),
    rgb("#e91e63"),
    rgb("#f1c40f"),
  )
  
  let R = 2.2
  for k in range(4) {
    let col-tri = triangle-colors.at(k)
    let stroke-tri = (1.3pt - k * 0.25pt) + col-tri
    let fill-tri = col-tri.lighten(92%)
    
    if calc.even(k) {
      let p1 = (0, R)
      let p2 = (-R * h_val / 2, -R / 2)
      let p3 = (R * h_val / 2, -R / 2)
      line(p1, p2, p3, close: true, stroke: stroke-tri, fill: fill-tri)
    } else {
      let p1 = (0, -R)
      let p2 = (-R * h_val / 2, R / 2)
      let p3 = (R * h_val / 2, R / 2)
      line(p1, p2, p3, close: true, stroke: stroke-tri, fill: fill-tri)
    }
    
    let r_rad = R / 2
    let col-cir = circle-colors.at(k)
    let stroke-cir = (1.1pt - k * 0.25pt) + col-cir
    let fill-cir = col-cir.lighten(94%)
    circle((0, 0), radius: r_rad, stroke: stroke-cir, fill: fill-cir)
    
    R = r_rad
  }
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 5",
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 12)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

#tn([Dựng một đường xoắn ốc tam giác vuông vô hạn chung đỉnh $O$ bằng cách xếp liên tiếp các tam giác vuông cân (như hình vẽ bên dưới). Tam giác đầu tiên có cạnh bên bằng $4$ cm. Mỗi tam giác tiếp theo có các cạnh bên giảm đi theo tỉ số diện tích là $q = 1/2$. Tính tổng diện tích của tất cả các tam giác vuông trong mô hình xoắn ốc vô hạn này (tính bằng xăng-ti-mét vuông).],
    (
        [8],
        True([16]),
        [12],
        [24]
    ),
    fig: fig-right-triangles-spiral,
    fig-width: 30%,
    loigiai: [
        - Diện tích tam giác vuông cân thứ nhất là:
          $ S_1 = (1)/(2) dot 4 dot 4 = 8" cm"^2 $.
        - Tỉ số diện tích giữa các tam giác vuông cân liên tiếp là $q = (1)/(2)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích của chuỗi tam giác vô hạn là:
          $ S = (S_1)/(1 - q) = (8)/(1 - (1)/(2)) = 16" cm"^2 $.
        Chọn đáp án B.
    ]
)

#tn([Một đường xoắn ốc được tạo bởi các cung tròn góc $90°$ liên tiếp (xoắn ốc tỷ lệ vàng như hình vẽ bên dưới). Cung tròn đầu tiên có bán kính $R_1 = 3$ cm. Bán kính của mỗi cung tròn tiếp theo bằng $60\%$ bán kính của cung tròn liền trước nó. Tính tổng độ dài đường xoắn ốc vô hạn này (tính bằng xăng-ti-mét).],
    (
        [$3 pi$],
        [$3.5 pi$],
        True([$3.75 pi$]),
        [$4 pi$]
    ),
    fig: fig-golden-spiral,
    fig-width: 28%,
    loigiai: [
        - Độ dài cung tròn thứ $n$ có bán kính $R_n$ là:
          $ L_n = (1)/(4) dot 2 pi R_n = (pi R_n)/(2) $.
        - Với $R_1 = 3$ cm, độ dài cung tròn thứ nhất là $L_1 = 1.5 pi$ cm.
        - Dãy các độ dài cung tròn lập thành cấp số nhân lùi vô hạn có công bội $q = 0.6$ (thỏa mãn $|q| < 1$).
        - Tổng độ dài đường xoắn ốc vô hạn là:
          $ L = (L_1)/(1 - q) = (1.5 pi)/(1 - 0.6) = (1.5 pi)/(0.4) = 3.75 pi" cm" $.
        Chọn đáp án C.
    ]
)

#tn([Cho một lục giác đều $H_1$ có độ dài cạnh bằng $4$ cm. Dựng lục giác đều $H_2$ bằng cách nối các trung điểm các cạnh của lục giác $H_1$, rồi cứ thế tiếp tục dựng các lục giác đều $H_3, H_4, ...$ vô hạn lần (như hình vẽ bên dưới). Tính tổng diện tích của tất cả các lục giác đều trong dãy vô hạn này (tính bằng xăng-ti-mét vuông).],
    (
        [$48 sqrt(3)$],
        [$72 sqrt(3)$],
        True([$96 sqrt(3)$]),
        [$120 sqrt(3)$]
    ),
    fig: fig-nested-hexagons,
    fig-width: 32%,
    loigiai: [
        - Diện tích lục giác đều thứ nhất $H_1$ cạnh $a_1 = 4$ cm là:
          $ S_1 = (3 sqrt(3))/(2) a_1^2 = (3 sqrt(3))/(2) dot 16 = 24 sqrt(3)" cm"^2 $.
        - Nối các trung điểm các cạnh lục giác đều thu được lục giác đều mới có tỉ số cạnh so với hình cũ là $k = cos 30° = (sqrt(3))/(2)$.
        - Do đó tỉ số diện tích giữa hai lục giác đều liên tiếp là $q = k^2 = (3)/(4)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích các lục giác đều là:
          $ S = (S_1)/(1 - q) = (24 sqrt(3))/(1 - (3)/(4)) = 96 sqrt(3)" cm"^2 $.
        Chọn đáp án C.
    ]
)

#tn([Cho góc nhọn $x O y = 30°$ và điểm $M_0$ trên cạnh $O x$ sao cho $O M_0 = 6$ cm. Một đường gấp khúc vô hạn $M_0 M_1 M_2 M_3 ...$ được dựng bằng cách hạ các đường vuông góc liên tiếp từ cạnh này sang cạnh kia của góc (như hình vẽ bên dưới). Tính tổng độ dài đường gấp khúc vô hạn đó (tính bằng xăng-ti-mét).],
    (
        True([$12 + 6 sqrt(3)$]),
        [$6 + 3 sqrt(3)$],
        [$18$],
        [$24$]
    ),
    fig: fig-zigzag-angle,
    fig-width: 35%,
    loigiai: [
        - Xét các tam giác vuông liên tiếp:
          $ M_0 M_1 = O M_0 dot sin 30° = 6 dot (1)/(2) = 3 $ cm.
        - Mỗi đoạn tiếp theo có độ dài bằng đoạn trước nhân với $cos 30° = (sqrt(3))/(2)$ vì tính chất đồng dạng vuông góc liên tiếp.
        - Dãy độ dài các đoạn thẳng lập thành cấp số nhân lùi vô hạn với $u_1 = 3$ và công bội $q = (sqrt(3))/(2)$.
        - Tổng độ dài đường gấp khúc là:
          $ L = (u_1)/(1 - q) = (3)/(1 - (sqrt(3))/(2)) = (6)/(2 - sqrt(3)) = 6(2 + sqrt(3)) = 12 + 6 sqrt(3)" cm" $.
        Chọn đáp án A.
    ]
)

#tn([Một mô hình tháp nghệ thuật gồm các quả cầu xếp chồng lên nhau liên tiếp dọc theo một trục thẳng đứng (như hình vẽ bên dưới). Quả cầu thứ nhất ở đáy có bán kính $R_1 = 3$ m. Mỗi quả cầu tiếp theo xếp chồng lên trên có bán kính giảm đi một nửa so với quả cầu ngay dưới nó. Tính tổng thể tích của tất cả các quả cầu trong mô hình tháp vô hạn này (tính bằng mét khối).],
    (
        [$32 pi$],
        [$40 pi$],
        True([$(288 pi)/(7)$]),
        [$(144 pi)/(7)$]
    ),
    fig: fig-stacked-spheres,
    fig-width: 25%,
    loigiai: [
        - Thể tích quả cầu thứ nhất là:
          $ V_1 = (4)/(3) pi R_1^3 = (4)/(3) pi dot 27 = 36 pi" m"^3 $.
        - Vì bán kính mỗi quả cầu tiếp theo giảm đi một nửa ($k = (1)/(2)$), nên thể tích của chúng giảm đi theo tỉ số công bội $q = k^3 = (1)/(8)$ (thỏa mãn $|q| < 1$).
        - Tổng thể tích của tất cả các quả cầu là:
          $ V = (V_1)/(1 - q) = (36 pi)/(1 - (1)/(8)) = (36 pi)/((7)/(8)) = (288 pi)/(7)" m"^3 $.
        Chọn đáp án C.
    ]
)

#tn([Một chiếc quạt giấy xoắn ốc được tạo bởi các hình quạt tròn (sector) liên kết với nhau (như hình vẽ bên dưới). Hình quạt thứ nhất có bán kính $R_1 = 6$ cm và góc ở tâm bằng $60°$. Mỗi hình quạt tiếp theo có góc ở tâm giữ nguyên bằng $60°$ nhưng bán kính giảm đi còn bằng $(2)/(3)$ bán kính của hình quạt ngay trước nó. Tính tổng độ dài của toàn bộ cung tròn trong chiếc quạt vô hạn này (tính bằng xăng-ti-mét).],
    (
        [$4 pi$],
        True([$6 pi$]),
        [$8 pi$],
        [$9 pi$]
    ),
    fig: fig-spiral-sector,
    fig-width: 30%,
    loigiai: [
        - Độ dài cung tròn thứ nhất với $R_1 = 6$ cm và góc ở tâm $60°$ là:
          $ L_1 = (60°)/(360°) dot 2 pi R_1 = (1)/(6) dot 12 pi = 2 pi" cm" $.
        - Vì bán kính giảm theo tỉ số $q = (2)/(3)$, độ dài các cung tròn cũng giảm theo tỉ số công bội $q = (2)/(3)$ (thỏa mãn $|q| < 1$).
        - Tổng độ dài các cung tròn trong quạt là:
          $ L = (L_1)/(1 - q) = (2 pi)/(1 - (2)/(3)) = 6 pi" cm" $.
        Chọn đáp án B.
    ]
)

#tn([Cho một góc nhọn góc $60°$ giới hạn bởi hai tia. Người ta xếp một dãy vô hạn các hình tròn tiếp xúc ngoài liên tiếp nhau, đồng thời tất cả các hình tròn đều tiếp xúc với hai tia của góc nhọn (như hình vẽ bên dưới). Biết hình tròn lớn nhất ở phía ngoài có bán kính $R_1 = 3$ cm. Tính tổng diện tích của tất cả các hình tròn trong dãy vô hạn này (tính bằng xăng-ti-mét vuông).],
    (
        [$10 pi$],
        True([$(81 pi)/(8)$]),
        [$(27 pi)/(4)$],
        [$12 pi$]
    ),
    fig: fig-circles-wedge,
    fig-width: 32%,
    loigiai: [
        - Diện tích hình tròn thứ nhất: $S_1 = pi R_1^2 = 9 pi" cm"^2 $.
        - Tỉ số bán kính giữa hai hình tròn liên tiếp là:
          $ k = (1 - sin 30°)/(1 + sin 30°) = (1 - 0.5)/(1 + 0.5) = (0.5)/(1.5) = (1)/(3) $.
        - Tỉ số diện tích giữa các hình tròn liên tiếp là công bội $q = k^2 = (1)/(9)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích của chuỗi hình tròn vô hạn là:
          $ S = (S_1)/(1 - q) = (9 pi)/(1 - (1)/(9)) = (9 pi)/((8)/(9)) = (81 pi)/(8)" cm"^2 $.
        Chọn đáp án B.
    ]
)

#tn([Một thập tự hình vuông Fractal được dựng bắt đầu từ một hình vuông gốc lớn ở trung tâm có cạnh bằng $3$ cm (như hình vẽ bên dưới). Ở bước thứ nhất, người ta gắn thêm 4 hình vuông nhỏ hơn vào 4 cạnh của hình vuông gốc, mỗi hình vuông nhỏ có cạnh bằng $(1)/(3)$ cạnh hình vuông gốc. Ở mỗi bước tiếp theo, trên mỗi cạnh lộ ra ngoài của các hình vuông mới, người ta lại gắn thêm các hình vuông nhỏ hơn nữa với tỉ lệ cạnh giảm đi một phần ba. Tính diện tích giới hạn của thập tự Fractal vô hạn này (tính bằng xăng-ti-mét vuông).],
    (
        [$12$],
        True([$15$]),
        [$16$],
        [$18$]
    ),
    fig: fig-square-cross,
    fig-width: 30%,
    loigiai: [
        - Diện tích hình vuông gốc trung tâm: $S_0 = 3^2 = 9" cm"^2 $.
        - Ở bước 1, diện tích thêm vào của 4 hình vuông mới là:
          $ A_1 = 4 dot 1^2 = 4" cm"^2 $.
        - Ở bước 2, mỗi hình vuông mới có 3 cạnh lộ ra ngoài, tổng cộng có $4 dot 3 = 12$ hình vuông mới với độ dài cạnh là $(1)/(3)$ cm. Diện tích thêm vào là:
          $ A_2 = 12 dot ((1)/(3))^2 = (12)/(9) = (4)/(3)" cm"^2 $.
        - Dãy diện tích các bước thêm vào lập thành một cấp số nhân lùi vô hạn với số hạng đầu $A_1 = 4$ và công bội $q = (3) dot ((1)/(3))^2 = (1)/(3)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích thêm vào là:
          $ A = (A_1)/(1 - q) = (4)/(1 - (1)/(3)) = 6" cm"^2 $.
        - Diện tích giới hạn của toàn bộ thập tự Fractal là:
          $ S = S_0 + A = 9 + 6 = 15" cm"^2 $.
        Chọn đáp án B.
    ]
)

#tn([Cho một lục giác đều $T_1$ có cạnh bằng $6$ cm. Dựng lục giác đều $T_2$ bằng cách nối trung điểm các cạnh của $T_1$, lục giác đều $T_3$ nối trung điểm các cạnh $T_2$, và cứ thế vô hạn lần (như hình vẽ lục giác đều lồng nhau bên dưới). Tính tổng diện tích của tất cả các lục giác đều trong mô hình lồng nhau này (tính bằng xăng-ti-mét vuông).],
    (
        [$108 sqrt(3)$],
        [$162 sqrt(3)$],
        True([$216 sqrt(3)$]),
        [$270 sqrt(3)$]
    ),
    fig: fig-nested-hexagons,
    fig-width: 32%,
    loigiai: [
        - Diện tích lục giác đều thứ nhất $T_1$ cạnh $a_1 = 6$ cm là:
          $ S_1 = (3 sqrt(3))/(2) a_1^2 = (3 sqrt(3))/(2) dot 36 = 54 sqrt(3)" cm"^2 $.
        - Công bội diện tích là $q = cos^2(30°) = (3)/(4)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích các lục giác đều là:
          $ S = (S_1)/(1 - q) = (54 sqrt(3))/(1 - (3)/(4)) = 216 sqrt(3)" cm"^2 $.
        Chọn đáp án C.
    ]
)

#tn([Một mô hình nghệ thuật gồm các hình elip đồng tâm lồng nhau đệ quy (như hình vẽ bên dưới). Hình elip ngoài cùng $E_1$ có các bán trục $a_1 = 5$ cm và $b_1 = 4$ cm. Các hình elip bên trong lần lượt có kích thước bán trục giảm đi một nửa so với hình elip liền kề chứa nó. Tính tổng diện tích của tất cả các hình elip trong mô hình vô hạn này (tính bằng xăng-ti-mét vuông).],
    (
        [$25 pi$],
        [$30 pi$],
        True([$(80 pi)/(3)$]),
        [$(40 pi)/(3)$]
    ),
    fig: fig-nested-ellipses,
    fig-width: 30%,
    loigiai: [
        - Diện tích hình elip thứ nhất $E_1$ là:
          $ S_1 = pi a_1 b_1 = pi dot 5 dot 4 = 20 pi" cm"^2 $.
        - Vì cả hai bán trục đều giảm đi một nửa ($k = (1)/(2)$), nên diện tích các hình elip giảm đi theo công bội $q = k^2 = (1)/(4)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích các hình elip là:
          $ S = (S_1)/(1 - q) = (20 pi)/(1 - (1)/(4)) = (20 pi)/((3)/(4)) = (80 pi)/(3)" cm"^2 $.
        Chọn đáp án C.
    ]
)

#tn([Người ta xếp các khối lập phương chồng lên nhau liên tiếp dọc theo một trục thẳng đứng để tạo thành một ngọn tháp đệ quy (như hình vẽ bên dưới). Khối lập phương thứ nhất ở đáy có cạnh bằng $2$ m. Mỗi khối lập phương tiếp theo xếp chồng lên trên có độ dài cạnh giảm đi một nửa so với khối lập phương ngay dưới nó. Tính tổng diện tích bề mặt lộ ra ngoài (diện tích toàn phần không tính mặt đáy tiếp xúc đất) của ngọn tháp lập phương vô hạn này (tính bằng mét vuông).],
    (
        [$24$],
        True([$(76)/(3)$]),
        [$(64)/(3)$],
        [$28$]
    ),
    fig: fig-stacked-cubes,
    fig-width: 25%,
    loigiai: [
        - Khối đáy có cạnh $a_1 = 2$ m. Diện tích mặt đáy dưới cùng đặt trên đất không lộ ra ngoài.
        - Diện tích mặt trên lộ ra ngoài của tháp luôn luôn có tổng hình chiếu bằng diện tích mặt trên của khối đáy: $S_("top") = a_1^2 = 2^2 = 4" m"^2$.
        - Diện tích các mặt bên lộ ra của mỗi khối lập phương thứ $n$ là 4 mặt bên: $S_("bên", n) = 4 a_n^2$.
        - Dãy diện tích các mặt bên tạo thành cấp số nhân lùi vô hạn với số hạng đầu $S_("bên", 1) = 4 a_1^2 = 16" m"^2$ và công bội $q = (1)/(4)$ (do cạnh giảm một nửa).
        - Tổng diện tích các mặt bên lộ ra ngoài:
          $ S_("bên") = (S_("bên", 1))/(1 - q) = (16)/(1 - (1)/(4)) = (64)/(3)" m"^2$.
        - Tổng diện tích bề mặt lộ ra của tháp là:
          $ S = S_("top") + S_("bên") = 4 + (64)/(3) = (76)/(3)" m"^2$.
        Chọn đáp án B.
    ]
)

#tn([Một Fractal chữ T (T-Square) nghệ thuật được dựng bắt đầu từ một hình vuông lớn ở trung tâm có cạnh bằng $4$ cm (như hình vẽ bên dưới). Ở mỗi bước, người ta vẽ thêm 4 hình vuông mới tại 4 góc của các hình vuông ở bước trước đó, với độ dài cạnh giảm đi một nửa so với hình vuông trước đó. Tính tổng diện tích của tất cả các hình vuông được vẽ trong chuỗi vô hạn này (không loại trừ các phần đè chồng lên nhau, tính bằng xăng-ti-mét vuông).],
    (
        [$48$],
        [$64$],
        True([$80$]),
        [$96$]
    ),
    fig: fig-t-square,
    fig-width: 30%,
    loigiai: [
        - Diện tích hình vuông gốc: $S_0 = 4^2 = 16" cm"^2$.
        - Thế hệ thứ nhất gồm 4 hình vuông tại 4 góc có cạnh bằng $2$ cm. Tổng diện tích là:
          $ A_1 = 4 dot 2^2 = 16" cm"^2$.
        - Thế hệ thứ hai gồm $4 dot 3 = 12$ hình vuông mới cạnh bằng $1$ cm. Tổng diện tích là:
          $ A_2 = 12 dot 1^2 = 12" cm"^2$.
        - Dãy tổng diện tích các bước thêm vào lập thành cấp số nhân lùi vô hạn có số hạng đầu $A_1 = 16$ và công bội $q = (3) dot ((1)/(2))^2 = (3)/(4)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích các hình vuông được vẽ thêm vô hạn là:
          $ A = (A_1)/(1 - q) = (16)/(1 - (3)/(4)) = 64" cm"^2$.
        - Tổng diện tích của toàn bộ tất cả các hình vuông vẽ ra là:
          $ S = S_0 + A = 16 + 64 = 80" cm"^2$.
        Chọn đáp án C.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

#ds([Cho một lục giác đều $H_1$ có độ dài cạnh bằng $12$ cm. Dựng lục giác đều $H_2$ bằng cách nối các trung điểm của các cạnh lục giác $H_1$. Tiếp tục quá trình dựng dãy các lục giác đều lồng nhau $H_3, H_4, ...$ vô hạn lần (như hình vẽ bên dưới). Các phát biểu sau đúng hay sai?],
    (
        True([Chu vi của lục giác đều thứ hai $H_2$ bằng $36 sqrt(3)$ cm.]),
        False([Dãy chu vi các lục giác đều trong mô hình lập thành cấp số nhân lùi vô hạn với công bội $q = 0.75$.]),
        False([Tổng chu vi của tất cả các lục giác đều trong dãy vô hạn bằng $72(2 + sqrt(3))$ cm.]),
        True([Tổng diện tích của tất cả các lục giác đều trong dãy vô hạn bằng $864 sqrt(3)" cm"^2$.])
    ),
    fig: fig-nested-hexagons,
    fig-width: 32%,
    loigiai: [
        - *a)* Đúng. Lục giác đều thứ nhất có cạnh $a_1 = 12$ cm. Lục giác đều thứ hai nối trung điểm có cạnh là $a_2 = a_1 cos 30° = 6 sqrt(3)$ cm. Chu vi của nó bằng $P_2 = 6 dot 6 sqrt(3) = 36 sqrt(3)$ cm.
        - *b)* Sai. Dãy các chu vi lập thành cấp số nhân lùi vô hạn với công bội $q = cos 30° = (sqrt(3))/(2)$ (không phải $0.75$).
        - *c)* Sai. Tổng chu vi của tất cả các lục giác đều trong chuỗi vô hạn:
          $ P = (P_1)/(1 - q) = (72)/(1 - (sqrt(3))/(2)) = (144)/(2 - sqrt(3)) = 144(2 + sqrt(3)) $ cm. (Phát biểu đề bài cho $72(2+sqrt(3))$ là Sai).
        - *d)* Đúng. Diện tích lục giác đầu tiên $S_1 = (3 sqrt(3))/(2) a_1^2 = 216 sqrt(3)" cm"^2 $. Công bội diện tích $q_s = (3)/(4)$. Tổng diện tích là:
          $ S = (S_1)/(1 - q_s) = (216 sqrt(3))/(1 - (3)/(4)) = 864 sqrt(3)" cm"^2 $.
    ]
)

#ds([Cho một góc nhọn góc $60°$ giới hạn bởi hai tia. Người ta xếp một dãy vô hạn các hình tròn tiếp xúc ngoài liên tiếp nhau và tiếp xúc với hai tia của góc nhọn (như hình vẽ bên dưới). Biết hình tròn lớn nhất ở ngoài cùng có bán kính $R_1 = 9$ cm. Các phát biểu sau đúng hay sai?],
    (
        True([Bán kính của hình tròn thứ hai trong dãy bằng $3$ cm.]),
        False([Dãy diện tích các hình tròn lập thành cấp số nhân lùi vô hạn với công bội $q = 1/3$.]),
        True([Tổng chu vi của tất cả các hình tròn trong dãy vô hạn bằng $27 pi$ cm.]),
        False([Tổng diện tích của tất cả các hình tròn trong dãy vô hạn bằng $(81 pi)/(8)" cm"^2$.])
    ),
    fig: fig-circles-wedge,
    fig-width: 32%,
    loigiai: [
        - *a)* Đúng. Bán kính hình tròn thứ hai là $R_2 = R_1 / 3 = 3$ cm.
        - *b)* Sai. Dãy diện tích các hình tròn lập thành cấp số nhân lùi vô hạn với công bội $q = (1)/(9)$ (không phải $1/3$).
        - *c)* Đúng. Chu vi hình tròn thứ nhất $C_1 = 18 pi$ cm. Công bội chu vi $q_c = (1)/(3)$. Tổng chu vi là:
          $ C = (C_1)/(1 - q_c) = (18 pi)/(1 - (1)/(3)) = 27 pi$ cm.
        - *d)* Sai. Diện tích hình tròn thứ nhất $S_1 = 81 pi" cm"^2$. Công bội diện tích $q_s = (1)/(9)$. Tổng diện tích là:
          $ S = (S_1)/(1 - q_s) = (81 pi)/(1 - (1)/(9)) = (729 pi)/(8)" cm"^2$ (chứ không phải $(81 pi)/(8)$).
    ]
)

#ds([Một thập tự hình vuông Fractal được dựng bắt đầu từ một hình vuông gốc lớn ở trung tâm có cạnh bằng $6$ cm (như hình vẽ bên dưới). Ở mỗi bước tiếp theo, người ta gắn thêm các hình vuông mới vào các cạnh lộ ra ngoài với tỉ lệ cạnh giảm đi còn một phần ba. Các phát biểu sau đúng hay sai?],
    (
        True([Diện tích của hình vuông gốc trung tâm bằng $36" cm"^2$.]),
        True([Số lượng các hình vuông được thêm vào ở thế hệ thứ ba là $36$.]),
        True([Tổng diện tích của các hình vuông được thêm vào ở thế hệ thứ nhất bằng $16" cm"^2$.]),
        True([Tổng diện tích của toàn bộ thập tự Fractal sau vô hạn bước bằng $60" cm"^2$.])
    ),
    fig: fig-square-cross,
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Diện tích hình vuông gốc trung tâm: $S_0 = 6^2 = 36" cm"^2$.
        - *b)* Đúng. Số lượng hình vuông gắn thêm: thế hệ 1 có 4 hình vuông, thế hệ 2 có $4 dot 3 = 12$, thế hệ 3 có $12 dot 3 = 36$ hình vuông.
        - *c)* Đúng. Ở thế hệ thứ nhất, 4 hình vuông mới có cạnh bằng $6/3 = 2$ cm. Diện tích của chúng là $4 dot 2^2 = 16" cm"^2$.
        - *d)* Đúng. Cấp số nhân lùi vô hạn của diện tích thêm vào có $u_1 = 16$ và công bội $q = 3 dot ((1)/(3))^2 = (1)/(3)$. Tổng diện tích Fractal là:
          $ S = S_0 + (u_1)/(1 - q) = 36 + (16)/(1 - (1)/(3)) = 36 + 24 = 60" cm"^2$.
    ]
)

#ds([Một đường xoắn ốc được tạo bởi các cung tròn góc $90°$ liên tiếp (xoắn ốc tỷ lệ vàng như hình vẽ bên dưới). Cung tròn thứ nhất có bán kính $R_1 = 10$ cm. Bán kính của mỗi cung tròn tiếp theo giảm đi một nửa so với cung tròn ngay trước nó. Các phát biểu sau đúng hay sai?],
    (
        True([Đoạn cung tròn thứ ba trong đường xoắn ốc có độ dài bằng $1.25 pi$ cm.]),
        True([Dãy độ dài các cung tròn lập thành cấp số nhân lùi vô hạn với công bội $q = 0.5$.]),
        True([Tổng độ dài đường xoắn ốc vô hạn này bằng $10 pi$ cm.]),
        False([Nếu bán kính ban đầu tăng lên thành $20$ cm, tổng độ dài đường xoắn ốc sẽ là $15 pi$ cm.])
    ),
    fig: fig-golden-spiral,
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Cung tròn thứ ba có bán kính $R_3 = 10 / 4 = 2.5$ cm. Độ dài cung thứ ba: $L_3 = (1.25 pi)$ cm.
        - *b)* Đúng. Dãy độ dài các cung tròn lập thành cấp số nhân lùi vô hạn với công bội $q = 0.5$.
        - *c)* Đúng. Độ dài cung tròn thứ nhất $L_1 = 10 pi / 2 = 5 pi$ cm. Tổng độ dài:
          $ L = (L_1)/(1 - q) = (5 pi)/(1 - 0.5) = 10 pi$ cm.
        - *d)* Sai. Khi bán kính ban đầu tăng lên $20$ cm, độ dài cung tròn thứ nhất là $10 pi$ cm. Tổng độ dài xoắn ốc mới sẽ là $10 pi / 0.5 = 20 pi$ cm (không phải $15 pi$ cm).
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

#tln([Dựng một đường xoắn ốc tam giác vuông vô hạn chung đỉnh $O$ bằng cách xếp liên tiếp các tam giác vuông cân (như hình vẽ bên dưới). Tam giác đầu tiên có cạnh bên bằng $8$ cm. Mỗi tam giác tiếp theo có các cạnh bên giảm đi theo tỉ số diện tích là $q = 1/2$. Tính tổng diện tích của tất cả các tam giác vuông trong mô hình xoắn ốc vô hạn này (tính bằng xăng-ti-mét vuông).],
    [64],
    fig: fig-right-triangles-spiral,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - Diện tích tam giác thứ nhất:
          $ S_1 = (1)/(2) dot 8 dot 8 = 32" cm"^2$.
        - Công bội diện tích $q = 1/2$.
        - Tổng diện tích:
          $ S = (S_1)/(1 - q) = (32)/(1 - (1)/(2)) = 64" cm"^2$.
    ]
)

#tln([Một mô hình nghệ thuật gồm các hình elip đồng tâm lồng nhau đệ quy (như hình vẽ bên dưới). Hình elip ngoài cùng $E_1$ có các bán trục $a_1 = 10$ cm và $b_1 = 6$ cm. Các hình elip bên trong lần lượt có kích thước bán trục giảm đi một nửa so với hình elip liền kề chứa nó. Tính tổng diện tích của tất cả các hình elip dưới dạng $b pi" cm"^2 $. Tìm giá trị của $b$.],
    [80],
    fig: fig-nested-ellipses,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - Diện tích elip thứ nhất $E_1$: $S_1 = pi a_1 b_1 = 60 pi" cm"^2$.
        - Tỉ số bán trục giảm một nửa nên diện tích giảm theo công bội $q = (1/2)^2 = (1)/(4)$.
        - Tổng diện tích là:
          $ S = (S_1)/(1 - q) = (60 pi)/(1 - (1)/(4)) = 80 pi" cm"^2$.
        Do đó $b = 80$.
    ]
)

#tln([Một Fractal chữ T (T-Square) nghệ thuật được dựng bắt đầu từ một hình vuông lớn ở trung tâm có cạnh bằng $8$ cm (như hình vẽ bên dưới). Ở mỗi bước, người ta vẽ thêm 4 hình vuông mới tại 4 góc của các hình vuông ở bước trước đó, với độ dài cạnh giảm đi một nửa so với hình vuông trước đó. Tính tổng diện tích của tất cả các hình vuông được vẽ trong chuỗi vô hạn này (tính bằng xăng-ti-mét vuông).],
    [320],
    fig: fig-t-square,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - Diện tích hình vuông gốc: $S_0 = 8^2 = 64" cm"^2$.
        - Thế hệ thứ nhất gồm 4 hình vuông tại 4 góc có cạnh bằng $4$ cm. Tổng diện tích là:
          $ A_1 = 4 dot 4^2 = 64" cm"^2$.
        - Dãy diện tích các bước thêm vào lập thành cấp số nhân lùi vô hạn có số hạng đầu $A_1 = 64$ và công bội $q = 3 dot ((1)/(2))^2 = (3)/(4)$.
        - Tổng diện tích các hình vuông được vẽ thêm vô hạn là:
          $ A = (A_1)/(1 - q) = (64)/(1 - (3)/(4)) = 256" cm"^2$.
        - Tổng diện tích của toàn bộ tất cả các hình vuông vẽ ra là:
          $ S = S_0 + A = 64 + 256 = 320" cm"^2$.
    ]
)

#tln([Một mô hình tháp nghệ thuật gồm các quả cầu xếp chồng lên nhau liên tiếp dọc theo một trục thẳng đứng (như hình vẽ bên dưới). Quả cầu thứ nhất ở đáy có bán kính $R_1 = 6$ cm. Mỗi quả cầu tiếp theo xếp chồng lên trên có bán kính giảm đi một nửa so với quả cầu ngay dưới nó. Tính tổng diện tích bề mặt (diện tích xung quanh) của tất cả các quả cầu dưới dạng $b pi" cm"^2 $. Tìm giá trị của $b$.],
    [192],
    fig: fig-stacked-spheres,
    fig-pos: "center",
    fig-width: 25%,
    loigiai: [
        - Diện tích bề mặt quả cầu thứ nhất:
          $ S_1 = 4 pi R_1^2 = 4 pi dot 36 = 144 pi" cm"^2$.
        - Vì bán kính giảm đi một nửa, nên diện tích bề mặt giảm đi theo công bội $q = (1/2)^2 = (1)/(4)$ (thỏa mãn $|q| < 1$).
        - Tổng diện tích bề mặt của tất cả các quả cầu là:
          $ S = (S_1)/(1 - q) = (144 pi)/(1 - (1)/(4)) = 192 pi" cm"^2$.
        Do đó $b = 192$.
    ]
)

#tln([Người ta xếp các khối lập phương chồng lên nhau liên tiếp dọc theo một trục thẳng đứng để tạo thành một ngọn tháp đệ quy (như hình vẽ bên dưới). Khối lập phương thứ nhất ở đáy có cạnh bằng $6$ cm. Mỗi khối lập phương tiếp theo xếp chồng lên trên có độ dài cạnh giảm đi một nửa so với khối lập phương ngay dưới nó. Tính tổng diện tích bề mặt lộ ra ngoài (diện tích toàn phần không tính mặt đáy tiếp xúc đất) của ngọn tháp lập phương vô hạn này (tính bằng xăng-ti-mét vuông).],
    [228],
    fig: fig-stacked-cubes,
    fig-pos: "center",
    fig-width: 25%,
    loigiai: [
        - Khối đáy có cạnh $a_1 = 6$ cm. Diện tích mặt đáy dưới cùng đặt trên đất không lộ ra ngoài.
        - Diện tích mặt trên lộ ra ngoài của tháp luôn luôn có tổng hình chiếu bằng diện tích mặt trên của khối đáy: $S_("top") = a_1^2 = 6^2 = 36" cm"^2$.
        - Diện tích các mặt bên lộ ra của mỗi khối lập phương thứ $n$ là 4 mặt bên: $S_("bên", n) = 4 a_n^2$.
        - Dãy diện tích các mặt bên tạo thành cấp số nhân lùi vô hạn với số hạng đầu $S_("bên", 1) = 4 a_1^2 = 144" cm"^2$ và công bội $q = (1)/(4)$ (do cạnh giảm một nửa).
        - Tổng diện tích các mặt bên lộ ra ngoài:
          $ S_("bên") = (S_("bên", 1))/(1 - q) = (144)/(1 - (1)/(4)) = 192" cm"^2$.
        - Tổng diện tích bề mặt lộ ra của tháp là:
          $ S = S_("top") + S_("bên") = 36 + 192 = 228" cm"^2$.
    ]
)

#tln([Cho một góc nhọn góc $60°$ giới hạn bởi hai tia. Người ta xếp một dãy vô hạn các hình tròn tiếp xúc ngoài liên tiếp nhau, đồng thời tất cả các hình tròn đều tiếp xúc với hai tia của góc nhọn (như hình vẽ bên dưới). Biết hình tròn lớn nhất ở phía ngoài có bán kính $R_1 = 6$ cm. Tính tổng chu vi của tất cả các hình tròn trong dãy vô hạn này dưới dạng $b pi$ cm. Tìm giá trị của $b$.],
    [18],
    fig: fig-circles-wedge,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Chu vi hình tròn thứ nhất: $C_1 = 2 pi R_1 = 12 pi$ cm.
        - Tỉ số bán kính giữa hai hình tròn liên tiếp là $k = (1 - sin 30°)/(1 + sin 30°) = (1)/(3)$.
        - Dãy chu vi lập thành cấp số nhân lùi vô hạn với số hạng đầu $C_1 = 12 pi$ và công bội $q = (1)/(3)$ (thỏa mãn $|q| < 1$).
        - Tổng chu vi của tất cả các hình tròn là:
          $ C = (C_1)/(1 - q) = (12 pi)/(1 - (1)/(3)) = 18 pi$ cm.
        Do đó $b = 18$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
