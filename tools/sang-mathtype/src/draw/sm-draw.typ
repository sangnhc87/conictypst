// SANG-MATH-DRAW: thư viện vẽ hình Hóa học / Vật lí bằng CeTZ cho add-in Sang Math.
// Quy ước: đơn vị cm, mỗi dụng cụ vẽ quanh gốc `pos` (thường là tâm đáy). Hàm trả về lệnh vẽ, gọi trong sm-canvas({ ... }).
#import "@preview/cetz:0.5.2": canvas, draw

#let ink = rgb("#1f2937")
#let glass = rgb(186, 220, 245, 45%)
#let water = rgb(96, 165, 250, 70%)
#let c-blue = rgb("#2563eb")
#let c-red = rgb("#dc2626")
#let c-green = rgb("#16a34a")
#let c-amber = rgb("#d97706")
#let c-purple = rgb("#7c3aed")
#let c-gray = rgb("#64748b")
#let lw = 0.9pt

#let sm-canvas(body, len: 1cm) = canvas(length: len, {
  import draw: *
  set-style(stroke: (thickness: lw, paint: ink, join: "round", cap: "round"), mark: (fill: ink, size: 0.18))
  body
})

// nhãn chữ: lab((x,y), [Chữ], anchor: "west")
#let lab(pos, txt, at: "center", size: 10pt, col: ink, ..args) = {
  import draw: *
  content(pos, text(size: size, fill: col, txt), anchor: at, padding: 2pt, ..args)
}

// công thức hóa học từ chuỗi: ch("H2SO4"), ch("Fe^3+"), ch("SO4^2-")
#let ch(s) = {
  let m = s.match(regex("^(.*?)(?:\^([0-9]*[+-]))?$"))
  let body = m.captures.at(0)
  let charge = m.captures.at(1)
  let out = ()
  let prev = ""
  let insub = false
  for c in body.clusters() {
    let digit = c.match(regex("^[0-9]$")) != none
    if digit and (insub or prev.match(regex("^[A-Za-z)\]]$")) != none) {
      out.push(sub(c))
      insub = true
    } else {
      out.push(c)
      insub = false
    }
    prev = c
  }
  [#out.join()#if charge != none [#super(charge.replace("-", "−"))]]
}

// văn bản có công thức hóa học xen lẫn: ct("O2, t° và H2SO4 đặc") — từ nào là công thức có chỉ số thì định dạng
#let ct(s) = {
  let out = ()
  for w in s.split(" ") {
    let m = w.match(regex("^([A-Z][A-Za-z0-9()^+-]*)([,;.:]?)$"))
    if m != none and m.captures.at(0).match(regex("[0-9]")) != none { out.push([#ch(m.captures.at(0))#m.captures.at(1)]) } else { out.push(w) }
  }
  out.join(" ")
}

// đường dẫn nhiều đoạn (ống dẫn khí) dày hơn nét thường
#let ong(..pts, w: 1.6pt) = {
  import draw: *
  line(..pts, stroke: (thickness: w, paint: ink.lighten(15%), cap: "round", join: "round"))
}

// ───── DỤNG CỤ THỦY TINH ─────
// Cốc có mỏ: gốc ở tâm đáy
#let coc(pos, w: 2.4, h: 2.6, lvl: 0.6, liq: water, name: none) = {
  import draw: *
  group({
    translate(pos)
    let x = w / 2
    if lvl > 0 { rect((-x, 0), (x, h * lvl), fill: liq, stroke: none) }
    line((-x - 0.12, h + 0.04), (-x, h), (-x, 0.15), (-x + 0.15, 0), (x - 0.15, 0), (x, 0.15), (x, h), (x + 0.12, h + 0.04), fill: none)
    if name != none { lab((0, h * lvl * 0.5), name, size: 9pt) }
  })
}

// Bình tam giác (erlen)
#let erlen(pos, w: 2.8, h: 3.0, lvl: 0.35, liq: water, nut: false) = {
  import draw: *
  group({
    translate(pos)
    let nw = 0.32
    let nh = 0.9
    let xb = w / 2
    // bề rộng của thân tại độ cao y (0 → xb, h-nh → nw)
    let wid(y) = xb + (nw - xb) * (y / (h - nh))
    let ly = (h - nh) * lvl * 1.4
    if lvl > 0 { line((-wid(ly), ly), (-xb, 0), (xb, 0), (wid(ly), ly), close: true, fill: liq, stroke: none) }
    line((-nw, h), (-nw, h - nh), (-xb, 0), (xb, 0), (nw, h - nh), (nw, h), fill: none)
    line((-nw - 0.08, h), (nw + 0.08, h))
    if nut { rect((-nw + 0.03, h - 0.1), (nw - 0.03, h + 0.35), fill: rgb("#d6b98c")) }
  })
}

// Bình cầu đáy tròn (có cổ). Gốc ở tâm quả cầu.
#let binh-cau(pos, r: 1.3, neck-h: 1.2, neck-w: 0.34, lvl: 0.4, liq: water) = {
  import draw: *
  group({
    translate(pos)
    let a = calc.asin(neck-w / r)
    let ytop = r * calc.cos(a)
    if lvl > 0 {
      let y = -r + 2 * r * lvl
      let psi = calc.asin(calc.max(-1, calc.min(1, y / r)))
      merge-path(fill: liq, stroke: none, close: true, {
        arc((0, 0), start: 180deg - psi, stop: 360deg + psi, radius: r, anchor: "origin")
      })
    }
    merge-path(fill: none, {
      line((-neck-w, ytop + neck-h), (-neck-w, ytop))
      arc((0, 0), start: 90deg + a, stop: 450deg - a, radius: r, anchor: "origin")
      line((neck-w, ytop), (neck-w, ytop + neck-h))
    })
    line((-neck-w - 0.07, ytop + neck-h), (neck-w + 0.07, ytop + neck-h))
  })
}

// Ống nghiệm đứng: gốc ở tâm đáy; lvl = mức chất lỏng 0..1; ketua = số hạt kết tủa
#let ong-nghiem(pos, h: 3.4, w: 0.7, lvl: 0.5, liq: water, ketua: 0, ktcol: ink) = {
  import draw: *
  group({
    translate(pos)
    let r = w / 2
    if lvl > 0 {
      merge-path(fill: liq, stroke: none, {
        line((-r, r + (h - r) * lvl), (-r, r))
        arc((0, r), start: 180deg, stop: 360deg, radius: r, anchor: "origin")
        line((r, r), (r, r + (h - r) * lvl))
        line((r, r + (h - r) * lvl), (-r, r + (h - r) * lvl))
      })
    }
    for i in range(ketua) {
      let a = i * 137deg
      circle((calc.cos(a) * r * 0.55, r * 0.7 + calc.abs(calc.sin(a * 3)) * r * 0.9 + i * 0.012), radius: 0.045, fill: ktcol, stroke: none)
    }
    merge-path(fill: none, {
      line((-r, h), (-r, r))
      arc((0, r), start: 180deg, stop: 360deg, radius: r, anchor: "origin")
      line((r, r), (r, h))
    })
    line((-r - 0.06, h), (r + 0.06, h))
  })
}

// Ống đong có vạch chia
#let ong-dong(pos, h: 4.0, w: 0.9, lvl: 0.5, liq: water, ticks: 10) = {
  import draw: *
  group({
    translate(pos)
    let x = w / 2
    if lvl > 0 { rect((-x, 0.12), (x, 0.12 + (h - 0.12) * lvl), fill: liq, stroke: none) }
    line((-x, h), (-x, 0.12), (-x - 0.35, 0), (x + 0.35, 0), (x, 0.12), (x, h))
    line((-x - 0.07, h), (x + 0.07, h))
    for i in range(1, ticks) {
      let y = 0.12 + (h - 0.12) * i / ticks
      line((-x, y), (-x + (if calc.rem(i, 5) == 0 { 0.3 } else { 0.18 }), y), stroke: 0.6pt)
    }
  })
}

// Buret: ống dài có khóa, đầu nhọn
#let buret(pos, h: 5.2, w: 0.5, lvl: 0.7, liq: water) = {
  import draw: *
  group({
    translate(pos)
    let x = w / 2
    let y0 = 1.1
    rect((-x, y0 + (h - y0) * (1 - lvl)), (x, h), fill: liq, stroke: none)
    line((-x, h), (-x, y0))
    line((x, h), (x, y0))
    line((-x - 0.05, h), (x + 0.05, h))
    for i in range(0, 13) {
      let y = y0 + (h - y0 - 0.3) * i / 12
      line((x, y), (x - (if calc.rem(i, 2) == 0 { 0.2 } else { 0.12 }), y), stroke: 0.55pt)
    }
    // khóa
    line((-x, y0), (-0.07, 0.62), (-0.07, 0.3))
    line((x, y0), (0.07, 0.62), (0.07, 0.3))
    rect((-0.2, 0.62), (0.2, 0.76), fill: c-gray.lighten(40%))
    line((-0.45, 0.69), (0.45, 0.69), stroke: (thickness: 2pt, paint: c-gray))
    line((-0.07, 0.3), (0, 0))
    line((0.07, 0.3), (0, 0))
  })
}

// Đèn cồn: gốc ở tâm đáy
#let den-con(pos, flame: true) = {
  import draw: *
  group({
    translate(pos)
    line((-0.35, 0.95), (-0.85, 0.3), (-0.85, 0.05), (0.85, 0.05), (0.85, 0.3), (0.35, 0.95), fill: glass)
    rect((-0.35, 0.95), (0.35, 1.12), fill: c-gray.lighten(35%))
    line((0, 1.12), (0, 1.35), stroke: (thickness: 1.5pt, paint: c-gray))
    rect((-0.78, 0.07), (0.78, 0.5), fill: rgb(253, 224, 71, 50%), stroke: none)
    if flame {
      merge-path(fill: rgb("#fb923c"), stroke: none, {
        bezier((0, 1.35), (0, 2.05), (-0.32, 1.55), (-0.05, 1.8))
        bezier((0, 2.05), (0, 1.35), (0.05, 1.8), (0.32, 1.55))
      })
      merge-path(fill: rgb("#fde047"), stroke: none, {
        bezier((0, 1.37), (0, 1.8), (-0.17, 1.5), (-0.03, 1.65))
        bezier((0, 1.8), (0, 1.37), (0.03, 1.65), (0.17, 1.5))
      })
    }
  })
}

// Giá sắt + kẹp: giá đứng cao h; kẹp ngang tại độ cao yk dài lk
#let gia(pos, h: 6.0, w: 2.4) = {
  import draw: *
  group({
    translate(pos)
    rect((0, 0), (w, 0.25), fill: c-gray.lighten(30%))
    rect((0.18, 0.25), (0.34, h), fill: c-gray.lighten(45%))
  })
}
#let kep(from, to, w: 0.3) = {
  import draw: *
  line(from, to, stroke: (thickness: 3pt, paint: c-gray))
  circle(to, radius: w / 2, fill: c-gray.lighten(40%))
}

// Phễu thủy tinh: gốc ở đầu cuống
#let pheu(pos, r: 0.9, h: 1.0, stem: 1.0, long: false) = {
  import draw: *
  group({
    translate(pos)
    line((0.05, 0), (0.05, stem), (r, stem + h), fill: none)
    line((-0.05, 0), (-0.05, stem), (-r, stem + h))
    line((-r, stem + h), (r, stem + h))
    line((-0.05, 0), (0.05, 0))
  })
}

// Chậu nước với mặt nước ở độ cao hn
#let chau(pos, w: 5.0, h: 1.8, hn: 1.3) = {
  import draw: *
  group({
    translate(pos)
    rect((-w / 2, 0.1), (w / 2, hn), fill: water, stroke: none)
    line((-w / 2, h), (-w / 2, 0.25), (-w / 2 + 0.25, 0), (w / 2 - 0.25, 0), (w / 2, 0.25), (w / 2, h))
    line((-w / 2, hn), (w / 2, hn), stroke: (thickness: 0.6pt, paint: c-blue, dash: "dashed"))
  })
}

// Bọt khí (dãy hạt tròn nhỏ)
#let bot(..pts) = {
  import draw: *
  for p in pts.pos() { circle(p, radius: 0.07, fill: white, stroke: 0.6pt) }
}

// Mũi tên có nhãn
#let mt(from, to, txt: none, at: "south", col: ink, w: 1pt, mark-end: ">", off: 0.0) = {
  import draw: *
  line(from, to, stroke: (thickness: w, paint: col), mark: (end: mark-end, fill: col, size: 0.2))
  if txt != none { lab((rel: (0, off), to: (from, 50%, to)), txt, at: at, col: col, size: 9pt) }
}

// Hộp chất trong sơ đồ chuyển hóa
#let hop(pos, txt, w: auto, col: c-blue, fill-col: none, name: none) = {
  import draw: *
  let f = if fill-col == none { col.lighten(88%) } else { fill-col }
  content(pos, box(inset: (x: 7pt, y: 5pt), radius: 3pt, fill: f, stroke: 1pt + col, text(size: 11pt, txt)), name: name)
}

// ───── DỤNG CỤ (PHẦN 2) ─────
// Điểm trên trục ống: từ đáy `p0` theo hướng góc `ang` (độ), khoảng `d`
#let along(p0, ang, d) = (p0.at(0) + d * calc.cos(ang), p0.at(1) + d * calc.sin(ang))

// Ống nghiệm đặt nghiêng: đáy tại p0, miệng hướng `ang` (độ, 0° = sang phải). Trả về lệnh vẽ.
#let ong-nghiem-nghieng(p0, ang: -15deg, h: 3.6, w: 0.75, lvl: 0.3, liq: none, bot-dots: 0, dotcol: c-purple) = {
  import draw: *
  group({
    translate(p0)
    rotate(ang - 90deg)
    let r = w / 2
    if bot-dots > 0 {
      for i in range(bot-dots) {
        let a = i * 137deg
        circle((calc.cos(a) * r * 0.6, r * 0.7 + calc.abs(calc.sin(a * 2.3)) * 0.5), radius: 0.06, fill: dotcol, stroke: none)
      }
    }
    if liq != none { ong-nghiem((0, 0), h: h, w: w, lvl: lvl, liq: liq) } else { ong-nghiem((0, 0), h: h, w: w, lvl: 0) }
  })
}

// Ống nghiệm úp ngược (thu khí): miệng ở y = ymiệng, đóng ở trên. gas: nhãn khí, water-lvl: mực nước bên trong (0..1)
#let ong-up(pos, h: 3.4, w: 0.8, wl: 0.4, gas: none, gcol: rgb(254, 240, 138, 60%)) = {
  import draw: *
  group({
    translate(pos)  // pos = miệng ống
    let r = w / 2
    rect((-r, 0), (r, h - r), fill: gcol, stroke: none)
    if wl > 0 { rect((-r, 0), (r, (h - r) * wl), fill: water, stroke: none) }
    merge-path(fill: none, {
      line((-r, 0), (-r, h - r))
      arc((0, h - r), start: 180deg, stop: 0deg, radius: r, anchor: "origin")
      line((r, h - r), (r, 0))
    })
    line((-r - 0.06, 0), (r + 0.06, 0))
    if gas != none { lab((0, (h - r) * (0.5 + wl / 2)), gas, size: 9pt) }
  })
}

// Lọ thu khí hình trụ miệng rộng (đặt đứng, ngửa) tại tâm đáy
#let lo-khi(pos, w: 1.6, h: 3.4, gas: none, gcol: rgb(190, 242, 100, 35%), cover: false) = {
  import draw: *
  group({
    translate(pos)
    rect((-w / 2, 0), (w / 2, h), fill: gcol, stroke: none)
    line((-w / 2, h), (-w / 2, 0.2), (-w / 2 + 0.2, 0), (w / 2 - 0.2, 0), (w / 2, 0.2), (w / 2, h))
    line((-w / 2 - 0.06, h), (w / 2 + 0.06, h))
    if cover { rect((-w / 2 - 0.1, h), (w / 2 + 0.1, h + 0.1), fill: c-gray.lighten(60%)) }
    if gas != none { lab((0, h * 0.5), gas, size: 9pt) }
  })
}

// Nút cao su (hình thang) tại tâm miệng, hướng lên
#let nut(pos, w: 0.7, h: 0.45) = {
  import draw: *
  line((pos.at(0) - w / 2, pos.at(1) - h / 2 + 0.05), (pos.at(0) - w / 2 - 0.08, pos.at(1) + h / 2), (pos.at(0) + w / 2 + 0.08, pos.at(1) + h / 2), (pos.at(0) + w / 2, pos.at(1) - h / 2 + 0.05), close: true, fill: rgb("#a16207"), stroke: 0.7pt)
}

// Nhiệt kế
#let nhiet-ke(pos, h: 2.6, col: c-red) = {
  import draw: *
  group({
    translate(pos)
    circle((0, 0.15), radius: 0.14, fill: col)
    rect((-0.06, 0.2), (0.06, h), fill: white)
    rect((-0.035, 0.2), (0.035, h * 0.55), fill: col, stroke: none)
    for i in range(0, 6) { line((0.06, 0.6 + i * (h - 0.9) / 5), (0.16, 0.6 + i * (h - 0.9) / 5), stroke: 0.5pt) }
  })
}

// Phễu chiết (bầu tròn + khóa), tâm bầu tại pos
#let pheu-chiet(pos, r: 0.9, lvl: 0.5, liq1: water, liq2: rgb(250, 204, 21, 60%)) = {
  import draw: *
  group({
    translate(pos)
    circle((0, 0), radius: r, fill: glass)
    // hai lớp chất lỏng
    let y1 = -r + 2 * r * lvl
    rect((-r * 0.85, -r * 0.5), (r * 0.85, y1 * 0.9), fill: liq1, stroke: none)
    line((-0.2, r * 0.95), (-0.2, r * 1.5), (0.2, r * 1.5), (0.2, r * 0.95))
    rect((-0.28, r * 1.5), (0.28, r * 1.75), fill: rgb("#a16207"))
    line((-0.14, -r * 0.97), (-0.14, -r - 0.9), (0, -r - 1.5), (0.14, -r - 0.9), (0.14, -r * 0.97))
    rect((-0.16, -r - 0.6), (0.16, -r - 0.78), fill: c-gray.lighten(30%))
    line((-0.5, -r - 0.69), (0.5, -r - 0.69), stroke: (thickness: 2pt, paint: c-gray))
  })
}

// Giá kẹp tổng hợp: cột đứng tại x0, từ y=0 lên h; các kẹp là (độ cao, điểm giữ)
#let gia-do(x0, h, w: 2.2, y0: 0, ..clamps) = {
  import draw: *
  rect((x0 - 0.2, y0 - 0.28), (x0 + w, y0 - 0.02), fill: c-gray.lighten(25%))
  rect((x0 - 0.07, y0 - 0.02), (x0 + 0.07, h), fill: c-gray.lighten(45%))
  for cl in clamps.pos() {
    let y = cl.at(0)
    let q = cl.at(1)
    line((x0, y), (q.at(0), y), q, stroke: (thickness: 2.4pt, paint: c-gray))
    circle((x0, y), radius: 0.13, fill: c-gray.lighten(25%))
    circle(q, radius: 0.1, fill: c-gray.lighten(25%))
  }
}

// Cầu muối hình chữ U
#let cau-muoi(x1, x2, ytop, ybot, col: rgb(254, 215, 170, 80%)) = {
  import draw: *
  let r = (x2 - x1) / 2
  merge-path(fill: col, close: true, {
    line((x1 - 0.12, ytop), (x1 - 0.12, ybot + r))
    arc(((x1 + x2) / 2, ybot + r), start: 180deg, stop: 360deg, radius: r + 0.12, anchor: "origin")
    line((x2 + 0.12, ybot + r), (x2 + 0.12, ytop))
    line((x2 + 0.12, ytop), (x2 - 0.12, ytop))
    line((x2 - 0.12, ytop), (x2 - 0.12, ybot + r))
    arc(((x1 + x2) / 2, ybot + r), start: 360deg, stop: 180deg, radius: r - 0.12, anchor: "origin")
    line((x1 + 0.12, ybot + r), (x1 + 0.12, ytop))
  })
}

// Đồng hồ đo (vôn kế/ampe kế/điện kế): chữ ở giữa
#let may-do(pos, txt, r: 0.5) = {
  import draw: *
  circle(pos, radius: r, fill: white)
  lab(pos, text(weight: "bold", txt), size: 12pt)
}

// Điện cực thanh
#let dien-cuc(pos, h: 2.6, w: 0.22, col: c-gray, txt: none) = {
  import draw: *
  rect((pos.at(0) - w / 2, pos.at(1)), (pos.at(0) + w / 2, pos.at(1) + h), fill: col, stroke: 0.7pt)
  if txt != none { lab((pos.at(0), pos.at(1) + h + 0.3), txt, size: 9pt) }
}

// Dây điện (nét mảnh, đỏ/đen)
#let day(..pts, col: ink, w: 1pt) = {
  import draw: *
  line(..pts, stroke: (thickness: w, paint: col, join: "round", cap: "round"))
}

// Hộp trong sơ đồ khối (quy trình sản xuất)
#let khoi(pos, txt, w: 3, h: 1.1, col: c-blue, name: none) = {
  import draw: *
  rect((pos.at(0) - w / 2, pos.at(1) - h / 2), (pos.at(0) + w / 2, pos.at(1) + h / 2), radius: 0.12, fill: col.lighten(88%), stroke: 1pt + col, name: name)
  lab(pos, txt, size: 10.5pt)
}

// Chuỗi phản ứng nằm ngang: các chất `items`; `conds` là điều kiện trên mũi tên (số phần tử = len(items)-1),
// `under` là chú thích bên dưới mũi tên (phương trình số…). gap = khoảng cách tâm các hộp.
#let chuoi(items, conds: (), under: (), gap: 3.4, y: 0, x0: 0, col: c-blue) = {
  import draw: *
  for (i, it) in items.enumerate() { hop((x0 + i * gap, y), ch(it), col: col, name: "c" + str(i)) }
  for i in range(items.len() - 1) {
    let a = "c" + str(i) + ".east"
    let b = "c" + str(i + 1) + ".west"
    mt((rel: (0.12, 0), to: a), (rel: (-0.12, 0), to: b), col: ink)
    if i < conds.len() and conds.at(i) != none { lab((rel: (0, 0.12), to: (a, 50%, b)), text(size: 9.5pt, ct(conds.at(i))), at: "south") }
    if i < under.len() and under.at(i) != none { lab((rel: (0, -0.12), to: (a, 50%, b)), text(size: 9pt, fill: c-gray, under.at(i)), at: "north") }
  }
}

// Bình rửa khí: erlen có nút, ống vào (cắm sâu) bên trái, ống ra (ngắn) bên phải; trả về lệnh vẽ. Tâm đáy tại pos.
#let binh-rua(pos, liq: water, lbl: none, w: 2.4, h: 2.6) = {
  import draw: *
  erlen(pos, w: w, h: h, lvl: 0.28, liq: liq, nut: false)
  nut((pos.at(0), pos.at(1) + h + 0.12), w: 0.7, h: 0.5)
  ong((pos.at(0) - 0.14, pos.at(1) + h + 0.8), (pos.at(0) - 0.14, pos.at(1) + 0.45), w: 1.5pt)
  ong((pos.at(0) + 0.14, pos.at(1) + h + 0.8), (pos.at(0) + 0.14, pos.at(1) + h - 0.4), w: 1.5pt)
  if lbl != none { lab((pos.at(0), pos.at(1) - 0.35), lbl, at: "north", size: 9pt) }
}

// ═══════════ VẬT LÍ ═══════════
// Phần tử mạch điện đặt giữa hai điểm a→b (tự xoay theo hướng). kind: "R","bt"(biến trở),"den","ctac","ctac-h"(hở),
// "A","V","G","tu","cuon","pin","ac","nguon"(bộ pin). lbl hiện bên cạnh (side = ±1 chọn phía).
#let sym(a, b, kind, lbl: none, side: 1, len: 1.3, col: ink) = {
  import draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let ang = calc.atan2(dx, dy)
  let m = d / 2
  group({
    translate(a)
    rotate(ang)
    let hl = len / 2
    // dây nối hai đầu
    line((0, 0), (m - hl, 0), stroke: (paint: col))
    line((m + hl, 0), (d, 0), stroke: (paint: col))
    translate((m, 0))
    if kind == "R" {
      rect((-hl, -0.17), (hl, 0.17), fill: white)
    } else if kind == "bt" {
      rect((-hl, -0.17), (hl, 0.17), fill: white)
      line((-hl * 0.6, -0.4), (hl * 0.7, 0.45), mark: (end: ">", size: 0.16))
    } else if kind == "den" {
      circle((0, 0), radius: 0.32, fill: white)
      line((-0.23, -0.23), (0.23, 0.23))
      line((-0.23, 0.23), (0.23, -0.23))
    } else if kind == "ctac" {
      circle((-hl, 0), radius: 0.06, fill: ink)
      circle((hl, 0), radius: 0.06, fill: ink)
      line((-hl, 0), (hl, 0))
    } else if kind == "ctac-h" {
      circle((-hl, 0), radius: 0.06, fill: ink)
      circle((hl, 0), radius: 0.06, fill: ink)
      line((-hl, 0), (hl - 0.1, 0.55))
    } else if kind == "A" or kind == "V" or kind == "G" {
      circle((0, 0), radius: 0.36, fill: white)
    } else if kind == "tu" {
      line((-0.12, -0.42), (-0.12, 0.42), stroke: 1.8pt)
      line((0.12, -0.42), (0.12, 0.42), stroke: 1.8pt)
      line((-hl, 0), (-0.12, 0))
      line((0.12, 0), (hl, 0))
    } else if kind == "cuon" {
      for i in range(4) { arc((-0.6 + i * 0.4 + 0.2, 0), start: 180deg, stop: 0deg, radius: (0.2, 0.26), anchor: "origin") }
    } else if kind == "pin" {
      line((-0.12, -0.5), (-0.12, 0.5), stroke: 1.8pt)
      line((0.12, -0.3), (0.12, 0.3), stroke: 1.8pt)
      line((-hl, 0), (-0.12, 0))
      line((0.12, 0), (hl, 0))
    } else if kind == "nguon" {
      for i in range(2) {
        line((-0.35 + i * 0.4, -0.5), (-0.35 + i * 0.4, 0.5), stroke: 1.8pt)
        line((-0.15 + i * 0.4, -0.3), (-0.15 + i * 0.4, 0.3), stroke: 1.8pt)
      }
    } else if kind == "ac" {
      circle((0, 0), radius: 0.4, fill: white)
      bezier((-0.25, 0), (0.25, 0), (-0.12, 0.3), (0.12, -0.3))
    }
  })
  // chữ trong đồng hồ & nhãn: vẽ ngoài nhóm để không bị xoay
  let mid = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  if kind == "A" or kind == "V" or kind == "G" { lab(mid, text(weight: "bold", kind), size: 11pt) }
  if lbl != none {
    let nx = side * (-dy / d)
    let ny = side * (dx / d)
    let off = if kind == "A" or kind == "V" or kind == "G" or kind == "ac" or kind == "den" { 0.62 } else if kind == "pin" or kind == "nguon" or kind == "tu" { 0.55 } else { 0.45 }
    let at = if calc.abs(ny) >= calc.abs(nx) { if ny > 0 { "south" } else { "north" } } else { if nx > 0 { "west" } else { "east" } }
    lab((mid.at(0) + nx * off, mid.at(1) + ny * off), lbl, at: at, size: 10pt)
  }
}

// điểm nối dây
#let nutd(..pts) = {
  import draw: *
  for p in pts.pos() { circle(p, radius: 0.07, fill: ink, stroke: none) }
}

// Lò xo đường gấp khúc từ a đến b (n vòng, biên độ w)
#let lo-xo(a, b, n: 8, w: 0.28, lead: 0.4) = {
  import draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / d
  let uy = dy / d
  let p(t, off) = (a.at(0) + ux * t - uy * off, a.at(1) + uy * t + ux * off)
  let pts = (a, p(lead, 0))
  let body = d - 2 * lead
  for i in range(n * 2) { pts.push(p(lead + body * (i + 0.5) / (n * 2), if calc.rem(i, 2) == 0 { w } else { -w })) }
  pts.push(p(d - lead, 0))
  pts.push(b)
  line(..pts, stroke: 1.1pt)
}

// Mũi tên lực: from→to, nhãn gần đầu mũi (at: neo của nhãn)
#let luc(from, to, txt, col: c-red, at: "south-west", w: 1.6pt, off: (0, 0)) = {
  import draw: *
  line(from, to, stroke: (thickness: w, paint: col), mark: (end: ">", fill: col, size: 0.22))
  lab((to.at(0) + off.at(0), to.at(1) + off.at(1)), text(fill: col, txt), at: at, size: 10.5pt)
}

// Vật hình khối
#let khoi-vat(pos, w: 1.2, h: 0.8, txt: none, col: c-blue) = {
  import draw: *
  rect((pos.at(0) - w / 2, pos.at(1) - h / 2), (pos.at(0) + w / 2, pos.at(1) + h / 2), fill: col.lighten(80%), stroke: 1pt + col)
  if txt != none { lab(pos, txt, size: 10pt) }
}

// Trục tọa độ có mũi tên: gốc (0,0), dài X, Y; nhãn trục
#let truc(X, Y, lx: none, ly: none, x0: 0, y0: 0) = {
  import draw: *
  line((x0, y0), (X, y0), mark: (end: ">"))
  line((x0, y0), (x0, Y), mark: (end: ">"))
  if lx != none { lab((X + 0.05, y0 - 0.08), lx, at: "north-east", size: 10pt) }
  if ly != none { lab((x0 - 0.05, Y + 0.05), ly, at: "south-east", size: 10pt) }
}

// Thấu kính mỏng tại x, cao h: kind "ht" hội tụ (mũi tên hướng ra), "pk" phân kì (hướng vào)
#let thau-kinh(x, h, kind: "ht") = {
  import draw: *
  line((x, -h), (x, h), stroke: 1.3pt)
  if kind == "ht" {
    line((x - 0.22, h - 0.35), (x, h), (x + 0.22, h - 0.35), stroke: 1.3pt)
    line((x - 0.22, -h + 0.35), (x, -h), (x + 0.22, -h + 0.35), stroke: 1.3pt)
  } else {
    line((x - 0.22, h + 0.35), (x, h), (x + 0.22, h + 0.35), stroke: 1.3pt)
    line((x - 0.22, -h - 0.35), (x, -h), (x + 0.22, -h - 0.35), stroke: 1.3pt)
  }
}

// Tia sáng có mũi tên giữa đoạn
#let tia(..pts, col: c-red, w: 1pt, dash: none, arrow: true) = {
  import draw: *
  let st = if dash == none { (thickness: w, paint: col) } else { (thickness: w, paint: col, dash: dash) }
  line(..pts, stroke: st)
  if arrow {
    let p = pts.pos()
    let a = p.at(0)
    let b = p.at(1)
    let m = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let d = calc.sqrt(dx * dx + dy * dy)
    line((m.at(0) - dx / d * 0.1, m.at(1) - dy / d * 0.1), (m.at(0) + dx / d * 0.1, m.at(1) + dy / d * 0.1), stroke: (thickness: w, paint: col), mark: (end: ">", fill: col, size: 0.2))
  }
}

// Hàm số vẽ thành đường: f nhận x (đơn vị trục) trả y; đổi sang cm bằng kx, ky
#let duong(f, x1, x2, kx: 1, ky: 1, n: 120, col: c-blue, w: 1.5pt, dash: none) = {
  import draw: *
  let pts = ()
  for i in range(n + 1) {
    let x = x1 + (x2 - x1) * i / n
    pts.push((x * kx, f(x) * ky))
  }
  let st = if dash == none { (thickness: w, paint: col) } else { (thickness: w, paint: col, dash: dash) }
  line(..pts, stroke: st)
}

// ═══════════ HÓA: MÔ HÌNH PHÂN TỬ, ELECTRON, HỮU CƠ ═══════════
#let cpk = (
  H: white, C: rgb("#6b7280"), O: rgb("#ef4444"), N: rgb("#3b82f6"), S: rgb("#facc15"), Cl: rgb("#22c55e"),
  F: rgb("#84cc16"), Na: rgb("#a855f7"), P: rgb("#f97316"), Br: rgb("#9a3412"), Ca: rgb("#14b8a6"), Fe: rgb("#b45309"),
  K: rgb("#c026d3"), Mg: rgb("#4ade80"), Al: rgb("#94a3b8"), Cu: rgb("#c2773a"), Zn: rgb("#64748b"),
)
#let ar = (H: 0.28, C: 0.4, O: 0.36, N: 0.37, S: 0.46, Cl: 0.44, F: 0.32, Na: 0.5, P: 0.44, Br: 0.5, Ca: 0.52, Fe: 0.46, K: 0.56, Mg: 0.5, Al: 0.48, Cu: 0.46, Zn: 0.46)

// Nguyên tử dạng quả cầu có bóng (mô hình), nhãn là ký hiệu
#let nguyen-tu(pos, s, r: auto, nhan: true) = {
  import draw: *
  let col = cpk.at(s, default: c-gray)
  let rad = if r == auto { ar.at(s, default: 0.4) } else { r }
  circle(pos, radius: rad, fill: gradient.radial(col.lighten(60%), col, center: (35%, 32%), radius: 85%), stroke: 0.7pt + col.darken(40%))
  if nhan { lab(pos, text(size: 8.5pt, weight: "bold", fill: if s == "H" { ink } else { white }, s), size: 8.5pt) }
}

// Liên kết a–b: n = 1, 2, 3 vạch song song
#let lien-ket(a, b, n: 1, w: 1.6pt, col: rgb("#475569")) = {
  import draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let nx = -dy / d
  let ny = dx / d
  let gap = 0.1
  for i in range(n) {
    let o = (i - (n - 1) / 2) * gap * 1.0
    line((a.at(0) + nx * o, a.at(1) + ny * o), (b.at(0) + nx * o, b.at(1) + ny * o), stroke: (thickness: w, paint: col, cap: "round"))
  }
}

// Mô hình phân tử: atoms = ((sym, x, y), ...), bonds = ((i, j, n), ...)
#let mo-hinh(atoms, bonds) = {
  import draw: *
  for bd in bonds { lien-ket((atoms.at(bd.at(0)).at(1), atoms.at(bd.at(0)).at(2)), (atoms.at(bd.at(1)).at(1), atoms.at(bd.at(1)).at(2)), n: bd.at(2)) }
  for at in atoms { nguyen-tu((at.at(1), at.at(2)), at.at(0)) }
}

// Liên kết trong công thức cấu tạo dạng khung: kind "don", "doi", "ba", "dam" (nét đậm), "dut" (nét đứt)
#let lk(len: 1.2, kind: "don", w: 1.4pt) = {
  import draw: *
  if kind == "don" { line((0, 0), (len, 0), stroke: w) }
  else if kind == "doi" { line((0, 0.07), (len, 0.07), stroke: w); line((0, -0.07), (len, -0.07), stroke: w) }
  else if kind == "ba" { for o in (-0.12, 0, 0.12) { line((0, o), (len, o), stroke: w) } }
  else if kind == "dam" { line((0, 0), (len, 0.16), (len, -0.16), close: true, fill: ink, stroke: 0.4pt) }
  else if kind == "dut" {
    let n = 7
    for i in range(n) { let t = (i + 0.5) / n; line((t * len, -0.02 - 0.14 * t), (t * len, 0.02 + 0.14 * t), stroke: 1pt) }
  }
}

// Vòng n cạnh đều bán kính r (n=6 benzen). kek: vẽ nối đôi xen kẽ; tron: vòng tròn bên trong. Đỉnh đầu tiên ở trên cùng.
#let vong(n: 6, r: 1.2, kek: false, tron: false, w: 1.4pt) = {
  import draw: *
  let pts = range(n).map(i => (r * calc.cos(90deg + i * 360deg / n), r * calc.sin(90deg + i * 360deg / n)))
  line(..pts, close: true, stroke: w)
  if tron { circle((0, 0), radius: r * 0.62, stroke: 1pt, fill: none) }
  if kek {
    for i in range(0, n, step: 2) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, n))
      let mx = (a.at(0) + b.at(0)) / 2
      let my = (a.at(1) + b.at(1)) / 2
      let k = 0.16 / r
      line((a.at(0) * (1 - k) + 0.0, a.at(1) * (1 - k)), (b.at(0) * (1 - k), b.at(1) * (1 - k)), stroke: 1pt)
    }
  }
}

// Mô hình nguyên tử Bo: Z electron chia lớp 2,8,8,18
#let bo(z, sym: none, r0: 0.95, dr: 0.7) = {
  import draw: *
  let caps = (2, 8, 8, 18)
  let left = z
  let shells = ()
  for c in caps {
    let n = calc.min(left, c)
    if n > 0 { shells.push(n) }
    left -= n
  }
  circle((0, 0), radius: 0.5, fill: rgb("#fecaca"), stroke: 1pt + c-red)
  lab((0, 0), text(size: 9pt, weight: "bold")[+#z])
  for (k, n) in shells.enumerate() {
    let r = r0 + dr * k
    circle((0, 0), radius: r, stroke: 0.7pt + c-gray, fill: none)
    for i in range(n) {
      let a = i * 360deg / n + 20deg * k
      circle((r * calc.cos(a), r * calc.sin(a)), radius: 0.1, fill: c-blue, stroke: none)
    }
  }
}

// Cấu hình electron dạng ô lượng tử: "1s2 2s2 2p6 3s1"
#let o-luong-tu(cfg, size: 0.5) = {
  import draw: *
  let x = 0.0
  for tok in cfg.split(" ") {
    if tok.len() < 3 { continue }
    let m = tok.match(regex("^(\d)([spdf])(\d+)$"))
    if m == none { continue }
    let kind = m.captures.at(1)
    let e = int(m.captures.at(2))
    let nb = (s: 1, p: 3, d: 5, f: 7).at(kind)
    let ups = calc.min(e, nb)
    let downs = e - ups
    for b in range(nb) {
      let bx = x + b * size
      rect((bx, 0), (bx + size, size), stroke: 0.9pt)
      if b < ups { line((bx + size * 0.34, size * 0.14), (bx + size * 0.34, size * 0.86), mark: (end: ">", size: 0.14), stroke: 0.9pt) }
      if b < downs { line((bx + size * 0.66, size * 0.86), (bx + size * 0.66, size * 0.14), mark: (end: ">", size: 0.14), stroke: 0.9pt) }
    }
    lab((x + nb * size / 2, -0.12), text(size: 9pt)[#tok.slice(0, 2)#super[#tok.slice(2)]], at: "north")
    x += nb * size + 0.3
  }
}

// Obitan s (cầu) và p (hai thùy)
#let obitan(kind: "s", r: 0.9) = {
  import draw: *
  if kind == "s" {
    circle((0, 0), radius: r, fill: gradient.radial(rgb("#bfdbfe"), rgb("#60a5fa"), center: (40%, 35%)), stroke: 0.8pt + c-blue)
  } else {
    for sgn in (1, -1) {
      let c = if sgn == 1 { rgb("#fca5a5") } else { rgb("#93c5fd") }
      merge-path(fill: c, stroke: 0.8pt + ink, close: true, {
        bezier((0, 0), (0, sgn * r * 2), (r * 0.9, sgn * r * 0.2), (r * 0.9, sgn * r * 1.7))
        bezier((0, sgn * r * 2), (0, 0), (-r * 0.9, sgn * r * 1.7), (-r * 0.9, sgn * r * 0.2))
      })
    }
    lab((0, 0), text(size: 8pt)[+], size: 8pt)
  }
}

// ═══════════ TOÁN: ĐỒ THỊ HÀM SỐ ═══════════
// f là chuỗi biểu thức theo x (vd. "x*x*x - 3*x"); hỗ trợ sin, cos, tan, exp, ln, sqrt, abs, pow(a,b), pi, e.
#let eval-f(f, xv) = {
  let sc = (
    x: xv, sin: calc.sin, cos: calc.cos, tan: calc.tan, exp: calc.exp, ln: calc.ln, sqrt: calc.sqrt, abs: calc.abs,
    pow: calc.pow, pi: calc.pi, e: calc.e, log: calc.log, floor: calc.floor, calc: calc,
  )
  eval(f, mode: "code", scope: sc)
}

#let do-thi(
  f1, f2: none, f3: none,
  x1: -4, x2: 4, y1: -4, y2: 4, ux: 1, uy: 1,
  luoi: true, nhan: true, col1: c-blue, col2: c-red, col3: c-green, n: 200,
) = {
  import draw: *
  if luoi {
    for k in range(calc.ceil(x1), calc.floor(x2) + 1) { line((k * ux, y1 * uy), (k * ux, y2 * uy), stroke: 0.35pt + rgb("#e2e8f0")) }
    for k in range(calc.ceil(y1), calc.floor(y2) + 1) { line((x1 * ux, k * uy), (x2 * ux, k * uy), stroke: 0.35pt + rgb("#e2e8f0")) }
  }
  line((x1 * ux, 0), (x2 * ux + 0.25, 0), mark: (end: ">"))
  line((0, y1 * uy), (0, y2 * uy + 0.25), mark: (end: ">"))
  lab((x2 * ux + 0.3, 0), text(style: "italic")[x], at: "west", size: 10pt)
  lab((0, y2 * uy + 0.3), text(style: "italic")[y], at: "south", size: 10pt)
  lab((-0.05, -0.05), text(size: 9pt)[O], at: "north-east")
  if nhan {
    for k in range(calc.ceil(x1), calc.floor(x2) + 1) { if k != 0 { line((k * ux, -0.07), (k * ux, 0.07), stroke: 0.6pt); lab((k * ux, -0.1), text(size: 7.5pt)[#k], at: "north") } }
    for k in range(calc.ceil(y1), calc.floor(y2) + 1) { if k != 0 { line((-0.07, k * uy), (0.07, k * uy), stroke: 0.6pt); lab((-0.1, k * uy), text(size: 7.5pt)[#k], at: "east") } }
  }
  for (f, col) in ((f1, col1), (f2, col2), (f3, col3)) {
    if f == none or f == "" { continue }
    let seg = ()
    for i in range(n + 1) {
      let xv = x1 + (x2 - x1) * i / n + 0.000137 // lệch nhẹ để tránh chia cho 0 tại điểm nguyên
      let yv = eval-f(f, xv)
      if type(yv) == float or type(yv) == int {
        if yv >= y1 - 0.05 and yv <= y2 + 0.05 and not (yv != yv) { seg.push((xv * ux, yv * uy)) } else if seg.len() > 1 { line(..seg, stroke: 1.5pt + col); seg = () } else { seg = () }
      } else if seg.len() > 1 { line(..seg, stroke: 1.5pt + col); seg = () } else { seg = () }
    }
    if seg.len() > 1 { line(..seg, stroke: 1.5pt + col) }
  }
}

// ═══════════ BỔ SUNG: QUANG, SÓNG, THỐNG KÊ, HÌNH HỌC, DỤNG CỤ ═══════════
// Ảnh tạo bởi thấu kính (f > 0 hội tụ, f < 0 phân kì); d = khoảng cách vật–thấu kính, h = cao vật. Đơn vị cm trên hình.
#let thau-kinh-anh(d, f, h, nhan: true) = {
  import draw: *
  let dp = d * f / (d - f)           // vị trí ảnh (dương: sau thấu kính)
  let hp = -h * dp / d               // chiều cao ảnh (âm: ngược chiều)
  let real = dp > 0
  let H = calc.max(h, calc.abs(hp)) + 1.2
  let xmax = calc.max(dp, f) + 2.2
  let xmin = -d - 1.6
  line((xmin, 0), (xmax, 0), stroke: (thickness: 0.8pt, dash: "dash-dotted"))
  thau-kinh(0, H, kind: if f > 0 { "ht" } else { "pk" })
  // tiêu điểm
  for (x, t) in ((f, $F'$), (-f, $F$)) { circle((x, 0), radius: 0.05, fill: ink); lab((x, -0.08), t, at: "north", size: 9pt) }
  lab((0.1, -0.08), $O$, at: "north-west", size: 9pt)
  // vật
  line((-d, 0), (-d, h), stroke: 1.8pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.22))
  if nhan { lab((-d, h + 0.05), $B$, at: "south"); lab((-d, -0.08), $A$, at: "north") }
  // ảnh
  let st = if real { 1.8pt + c-red } else { (thickness: 1.8pt, paint: c-red, dash: "dashed") }
  line((dp, 0), (dp, hp), stroke: st, mark: (end: ">", fill: c-red, size: 0.22))
  if nhan { lab((dp, hp + (if hp > 0 { 0.05 } else { -0.05 })), $B'$, at: if hp > 0 { "south" } else { "north" }); lab((dp, -0.08), $A'$, at: "north") }
  // tia 1: song song trục chính -> qua tiêu điểm / có đường kéo dài qua tiêu điểm
  let dir1 = if real { (dp, hp - h) } else { (0 - dp, h - hp) }
  let n1 = calc.sqrt(dir1.at(0) * dir1.at(0) + dir1.at(1) * dir1.at(1))
  let ext(p0, dir, L) = (p0.at(0) + dir.at(0) / calc.sqrt(dir.at(0) * dir.at(0) + dir.at(1) * dir.at(1)) * L, p0.at(1) + dir.at(1) / calc.sqrt(dir.at(0) * dir.at(0) + dir.at(1) * dir.at(1)) * L)
  tia((-d, h), (0, h), col: c-red)
  if real { tia((0, h), ext((0, h), (dp, hp - h), xmax - 0.2), col: c-red) }
  else { tia((0, h), ext((0, h), (-dp, h - hp), xmax - 0.2), col: c-red); line((0, h), (dp, hp), stroke: (thickness: 1pt, paint: c-red, dash: "dashed")) }
  // tia 2: qua quang tâm
  tia((-d, h), (xmax - 0.4, -h * (xmax - 0.4) / d), col: c-green)
  if not real { line((0, 0), (dp, hp), stroke: (thickness: 1pt, paint: c-green, dash: "dashed")) }
}

// Khúc xạ ánh sáng tại mặt phân cách nằm ngang: góc tới i (độ), chiết suất n1 (trên), n2 (dưới)
#let khuc-xa(i, n1, n2, L: 3.4) = {
  import draw: *
  line((-L - 0.6, 0), (L + 0.6, 0), stroke: 1.4pt)
  rect((-L - 0.6, -L), (L + 0.6, 0), fill: rgb(186, 220, 245, 35%), stroke: none)
  line((0, -L), (0, L), stroke: (thickness: 0.8pt, dash: "dashed", paint: c-gray))
  lab((0.1, L), [pháp tuyến], at: "south-west", size: 9pt)
  let ir = i * 1deg
  let s = n1 * calc.sin(ir) / n2
  tia((-L * calc.sin(ir), L * calc.cos(ir)), (0, 0), col: c-red)
  if s <= 1 {
    let r = calc.asin(s)
    tia((0, 0), (L * calc.sin(r), -L * calc.cos(r)), col: c-red)
    arc((0, 0), start: -90deg, stop: -90deg + r, radius: 1.0, anchor: "origin")
    lab((0.45 * calc.sin(r / 2) + 0.2, -1.3 * calc.cos(r / 2)), $r$, size: 10pt)
  }
  arc((0, 0), start: 90deg, stop: 90deg + ir, radius: 1.0, anchor: "origin")
  lab((-1.35 * calc.sin(ir / 2), 1.15 * calc.cos(ir / 2)), $i$, size: 10pt)
  lab((L + 0.5, 0.35), [$n_1$], at: "south-east", size: 10pt)
  lab((L + 0.5, -0.35), [$n_2$], at: "north-east", size: 10pt)
}

// Sóng ngang hình sin dọc trục x: lambda (cm), biên độ A
#let song(lam, A, n: 2.5, col: c-blue, nhan: true) = {
  import draw: *
  let L = lam * n
  line((-0.2, 0), (L + 0.4, 0), mark: (end: ">"))
  duong(x => A * calc.sin(360deg * x / lam), 0, L, kx: 1, ky: 1, n: 120, col: col)
  if nhan {
    mt((lam * 0.25 + 0.0, -A - 0.3), (lam * 1.25, -A - 0.3), txt: [$lambda$], at: "north", col: c-red)
    line((lam * 0.25, -A - 0.45), (lam * 0.25, -A - 0.15), stroke: 0.6pt)
    line((lam * 1.25, -A - 0.45), (lam * 1.25, -A - 0.15), stroke: 0.6pt)
    line((lam * 0.25, 0), (lam * 0.25, A), stroke: (thickness: 0.7pt, dash: "dotted"))
    mt((-0.3, 0), (-0.3, A), col: c-purple, txt: [$A$], at: "east")
  }
}

// Sóng dừng hai đầu cố định có k bó
#let song-dung(k, L, A) = {
  import draw: *
  for sgn in (1, -1) { duong(x => sgn * A * calc.sin(180deg * k * x / L), 0, L, kx: 1, ky: 1, n: 160, col: c-blue) }
  duong(x => A * calc.sin(180deg * k * x / L + 90deg) * 0, 0, L, kx: 1, ky: 1, n: 2, col: c-gray)
  for i in range(k + 1) { circle((i * L / k, 0), radius: 0.06, fill: c-red, stroke: none); lab((i * L / k, -0.1), [N], at: "north", size: 8.5pt) }
  for i in range(k) { lab(((i + 0.5) * L / k, A + 0.1), [B], at: "south", size: 8.5pt) }
}

// Trục số có các điểm đánh dấu: pts = ((giá trị, nhãn), ...), từ a đến b
#let truc-so(a, b, pts, u: 1.0) = {
  import draw: *
  line((a * u - 0.3, 0), (b * u + 0.4, 0), mark: (end: ">"))
  for k in range(calc.ceil(a), calc.floor(b) + 1) { line((k * u, -0.08), (k * u, 0.08), stroke: 0.7pt); lab((k * u, -0.12), text(size: 9pt)[#k], at: "north") }
  for (v, t) in pts { circle((v * u, 0), radius: 0.08, fill: c-red, stroke: none); lab((v * u, 0.15), t, at: "south", size: 10pt) }
}

// Khoảng/đoạn trên trục số: tô đậm từ x1 đến x2; ngoặc: "[" hoặc "(" cho đầu trái, "]" hoặc ")" cho đầu phải
#let khoang(x1, x2, tl: "(", tp: ")", u: 1.0, y: 0.25) = {
  import draw: *
  line((x1 * u, y), (x2 * u, y), stroke: 2.4pt + c-blue)
  circle((x1 * u, y), radius: 0.09, fill: if tl == "[" { c-blue } else { white }, stroke: 1pt + c-blue)
  circle((x2 * u, y), radius: 0.09, fill: if tp == "]" { c-blue } else { white }, stroke: 1pt + c-blue)
}

// Biểu đồ cột: vals = mảng số, labels = nhãn
#let bieu-do-cot(vals, labels, W: 6, H: 3.5, col: c-blue) = {
  import draw: *
  let mx = calc.max(..vals)
  let bw = W / vals.len()
  line((0, 0), (W + 0.2, 0), mark: (end: ">"))
  line((0, 0), (0, H + 0.4), mark: (end: ">"))
  for (i, v) in vals.enumerate() {
    let h = H * v / mx
    rect((i * bw + bw * 0.15, 0), (i * bw + bw * 0.85, h), fill: col.lighten(35%), stroke: 0.8pt + col)
    lab((i * bw + bw / 2, h + 0.04), text(size: 9pt)[#v], at: "south")
    lab((i * bw + bw / 2, -0.08), text(size: 9pt)[#labels.at(i)], at: "north")
  }
}

// Biểu đồ tròn: vals, labels
#let bieu-do-tron(vals, labels, r: 1.6) = {
  import draw: *
  let tot = vals.sum()
  let cols = (c-blue, c-red, c-green, c-amber, c-purple, c-gray, rgb("#0891b2"), rgb("#be185d"))
  let a0 = 90deg
  for (i, v) in vals.enumerate() {
    let a1 = a0 - 360deg * v / tot
    merge-path(fill: cols.at(calc.rem(i, 8)).lighten(30%), stroke: 1pt + white, close: true, {
      line((0, 0), (r * calc.cos(a0), r * calc.sin(a0)))
      arc((0, 0), start: a0, stop: a1, radius: r, anchor: "origin")
    })
    let am = (a0 + a1) / 2
    lab((r * 1.25 * calc.cos(am), r * 1.25 * calc.sin(am)), text(size: 9pt)[#labels.at(i)\ #calc.round(100 * v / tot, digits: 1)%], size: 9pt)
    a0 = a1
  }
}

// Biểu đồ Ven 2 hoặc 3 tập
#let venn(n, a: "A", b: "B", c: "C") = {
  import draw: *
  let f(col) = col.transparentize(75%)
  circle((-0.6, 0), radius: 1.2, fill: f(c-blue), stroke: 1pt + c-blue)
  circle((0.6, 0), radius: 1.2, fill: f(c-red), stroke: 1pt + c-red)
  lab((-1.35, 0.2), a, size: 12pt); lab((1.35, 0.2), b, size: 12pt)
  if n == 3 {
    circle((0, -1.0), radius: 1.2, fill: f(c-green), stroke: 1pt + c-green)
    lab((0, -1.85), c, size: 12pt)
  }
}

// Hệ trục Oxyz (phối cảnh)
#let oxyz(L: 3) = {
  import draw: *
  line((0, 0), (L, 0), mark: (end: ">"))
  line((0, 0), (0, L), mark: (end: ">"))
  line((0, 0), (-L * 0.6, -L * 0.5), mark: (end: ">"))
  lab((L + 0.1, 0), $y$, at: "west"); lab((0, L + 0.1), $z$, at: "south"); lab((-L * 0.6 - 0.05, -L * 0.5 - 0.05), $x$, at: "north-east"); lab((-0.05, -0.05), $O$, at: "north-east")
}

// Tam giác với tâm đường tròn ngoại/nội tiếp: A, B, C là toạ độ
#let tam-giac-tron(A, B, C, kind: "ngoai") = {
  import draw: *
  let ax = A.at(0); let ay = A.at(1); let bx = B.at(0); let by = B.at(1); let cx = C.at(0); let cy = C.at(1)
  line(A, B, C, close: true, stroke: 1.3pt)
  for (p, nm, an) in ((A, "A", "north-east"), (B, "B", "north-west"), (C, "C", "south")) { circle(p, radius: 0.06, fill: ink, stroke: none); lab(p, nm, at: an) }
  if kind == "ngoai" {
    let d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
    let ux = ((ax * ax + ay * ay) * (by - cy) + (bx * bx + by * by) * (cy - ay) + (cx * cx + cy * cy) * (ay - by)) / d
    let uy = ((ax * ax + ay * ay) * (cx - bx) + (bx * bx + by * by) * (ax - cx) + (cx * cx + cy * cy) * (bx - ax)) / d
    let R = calc.sqrt(calc.pow(ax - ux, 2) + calc.pow(ay - uy, 2))
    circle((ux, uy), radius: R, stroke: 1pt + c-blue)
    circle((ux, uy), radius: 0.05, fill: c-blue, stroke: none); lab((ux, uy), "O", at: "south-west", size: 9pt)
  } else {
    let a = calc.sqrt(calc.pow(bx - cx, 2) + calc.pow(by - cy, 2))
    let b = calc.sqrt(calc.pow(ax - cx, 2) + calc.pow(ay - cy, 2))
    let c = calc.sqrt(calc.pow(ax - bx, 2) + calc.pow(ay - by, 2))
    let s = a + b + c
    let ix = (a * ax + b * bx + c * cx) / s
    let iy = (a * ay + b * by + c * cy) / s
    let area = calc.abs(ax * (by - cy) + bx * (cy - ay) + cx * (ay - by)) / 2
    let r = 2 * area / s
    circle((ix, iy), radius: r, stroke: 1pt + c-green)
    circle((ix, iy), radius: 0.05, fill: c-green, stroke: none); lab((ix, iy), "I", at: "south-west", size: 9pt)
  }
}

// Lọ hóa chất có nhãn; ống nhỏ giọt; chén sứ; thìa; đũa thủy tinh
#let lo-hoa-chat(pos, nhan, mau: rgb("#fde68a"), h: 2.0, w: 1.3) = {
  import draw: *
  group({
    translate(pos)
    rect((-w / 2, 0), (w / 2, h), radius: 0.15, fill: glass, stroke: 1pt)
    rect((-w / 2 + 0.05, 0.05), (w / 2 - 0.05, h * 0.55), fill: mau, stroke: none)
    rect((-0.3, h), (0.3, h + 0.35), fill: rgb("#a16207"), stroke: 0.8pt)
    rect((-w / 2 + 0.1, h * 0.25), (w / 2 - 0.1, h * 0.7), fill: white, stroke: 0.6pt)
    lab((0, h * 0.475), ct(nhan), size: 8.5pt)
  })
}
#let ong-nho-giot(pos, h: 2.4, mau: water) = {
  import draw: *
  group({
    translate(pos)
    rect((-0.1, 0.15), (0.1, h - 0.7), fill: mau, stroke: 0.9pt)
    line((0, 0.15), (0, 0), stroke: 1pt)
    merge-path(fill: rgb("#dc2626"), stroke: 0.8pt, { arc((0, h - 0.35), start: 180deg, stop: 0deg, radius: (0.22, 0.4), anchor: "origin"); line((0.22, h - 0.35), (-0.22, h - 0.35)) })
    circle((0, -0.2), radius: 0.05, fill: mau, stroke: 0.4pt)
  })
}
#let chen-su(pos, r: 0.8) = {
  import draw: *
  group({
    translate(pos)
    merge-path(fill: white, stroke: 1pt, close: true, { line((-r, 0.5), (-r * 0.6, 0)); line((-r * 0.6, 0), (r * 0.6, 0)); line((r * 0.6, 0), (r, 0.5)) })
    line((-r - 0.05, 0.5), (r + 0.05, 0.5), stroke: 1.1pt)
  })
}
#let dua-thuy-tinh(a, b) = { import draw: *; line(a, b, stroke: (thickness: 2.2pt, paint: rgb("#94a3b8"), cap: "round")) }
#let sinh-han(pos, len: 5.5) = {
  import draw: *
  group({
    translate(pos)
    rect((0.4, -0.45), (len - 0.4, 0.45), fill: rgb(186, 220, 245, 35%))
    rect((0.4, -0.16), (len - 0.4, 0.16), fill: white)
    line((0.1, 0), (len - 0.1, 0), stroke: 2pt)
    line((1.0, 0.45), (1.0, 0.85), stroke: 2pt + c-blue)
    line((len - 1.0, -0.45), (len - 1.0, -0.85), stroke: 2pt + c-blue)
  })
}
#let con-lac-don(l: 4, goc: 25deg, r: 0.3) = {
  import draw: *
  line((-1.2, 0), (1.2, 0), stroke: 2pt)
  for i in range(6) { line((-1.2 + i * 0.45, 0), (-1.4 + i * 0.45, 0.3), stroke: 0.6pt) }
  line((0, 0), (0, -l - 0.5), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray))
  let b = (l * calc.sin(goc), -l * calc.cos(goc))
  line((0, 0), b, stroke: 1.2pt)
  circle(b, radius: r, fill: c-blue.lighten(60%), stroke: 1pt + c-blue)
}
#let loxo-treo(l: 3, m: "m") = {
  import draw: *
  line((-1, 0), (1, 0), stroke: 2pt)
  for i in range(5) { line((-1 + i * 0.5, 0), (-1.2 + i * 0.5, 0.3), stroke: 0.6pt) }
  lo-xo((0, 0), (0, -l), n: 7, w: 0.28)
  khoi-vat((0, -l - 0.4), w: 1.0, h: 0.8, txt: [$#m$])
}
// Đường sức từ quanh nam châm thanh (nằm ngang, N bên trái)
#let duong-suc-nam-cham(w: 2.4) = {
  import draw: *
  rect((-w / 2, -0.3), (0, 0.3), fill: rgb("#fecaca"), stroke: 1pt); rect((0, -0.3), (w / 2, 0.3), fill: rgb("#bfdbfe"), stroke: 1pt)
  lab((-w / 4, 0), [N]); lab((w / 4, 0), [S])
  for k in (1, 2) {
    for sgn in (1, -1) {
      bezier((-w / 2, 0.0), (w / 2, 0.0), (-w / 2 - 1.2 * k, sgn * 1.4 * k), (w / 2 + 1.2 * k, sgn * 1.4 * k), stroke: (thickness: 0.8pt, paint: c-purple), mark: (end: ">", fill: c-purple, size: 0.15))
    }
  }
}
// Tia phóng xạ α, β, γ qua điện trường giữa hai bản tụ
#let tia-phong-xa() = {
  import draw: *
  rect((-0.9, -0.5), (0, 0.5), fill: c-gray.lighten(40%), stroke: 1pt)
  lab((-0.45, 0), [nguồn], size: 8.5pt)
  line((1.0, 1.0), (4.0, 1.0), stroke: 2.6pt); line((1.0, -1.0), (4.0, -1.0), stroke: 2.6pt)
  lab((0.8, 1.0), [−], at: "east"); lab((0.8, -1.0), [+], at: "east")
  line((0, 0), (1.0, 0), stroke: 1.2pt + c-green)
  line((1.0, 0), (6.5, 0), stroke: 1.2pt + c-green, mark: (end: ">", fill: c-green, size: 0.18))
  bezier((1.0, 0), (6.5, 0.9), (2.8, 0.15), (4.3, 0.35), stroke: 1.2pt + c-red, mark: (end: ">", fill: c-red, size: 0.18))
  bezier((1.0, 0), (6.5, -2.2), (2.2, -0.5), (4.0, -1.3), stroke: 1.2pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.18))
  lab((6.6, 0.9), [$alpha$], at: "west"); lab((6.6, 0), [$gamma$], at: "west"); lab((6.6, -2.2), [$beta$], at: "west")
}

// ═══════════════════════════════════════════════════════════════
// MỞ RỘNG KHO MẪU (đợt 2): dụng cụ Hóa, mô hình, thí nghiệm, Lý, Toán
// ═══════════════════════════════════════════════════════════════
#let dot-line(a, b, col: c-gray) = { import draw: *; line(a, b, stroke: (thickness: 0.6pt, paint: col, dash: "dotted")) }
#let kt-ran(cx, cy, w, h, n: 14, col: c-gray) = {
  import draw: *
  for i in range(n) {
    let a = i * 137deg
    let k = calc.rem(i * 0.37, 1)
    circle((cx + (calc.cos(a) * 0.5) * w * 0.8 * (0.4 + k * 0.6), cy + (0.15 + 0.7 * calc.abs(calc.sin(a * 1.7))) * h), radius: 0.07, fill: col, stroke: 0.4pt)
  }
}

// Bình Kíp (điều chế khí không cần đun): gốc ở tâm đáy bầu dưới
#let binh-kip(pos, liq: water, solid: c-gray, kl: none) = {
  import draw: *
  group({
    translate(pos)
    // bầu dưới (chứa axit), bầu giữa (chất rắn), bầu trên (phễu)
    circle((0, 1.0), radius: 1.0, fill: glass)
    circle((0, 2.75), radius: 0.8, fill: glass)
    circle((0, 4.4), radius: 0.85, fill: glass)
    // mực axit: bầu dưới và bầu trên
    merge-path(fill: liq, stroke: none, close: true, { arc((0, 1.0), start: 195deg, stop: 345deg, radius: 1.0, anchor: "origin") })
    merge-path(fill: liq, stroke: none, close: true, { arc((0, 4.4), start: 200deg, stop: 340deg, radius: 0.85, anchor: "origin") })
    kt-ran(0, 2.2, 1.1, 0.9, n: 16, col: solid)
    // cổ nối giữa các bầu + ống phễu trung tâm
    for (y0, y1) in ((1.75, 2.1), (3.35, 3.7)) { rect((-0.3, y0), (0.3, y1), fill: glass, stroke: none); line((-0.3, y0), (-0.3, y1)); line((0.3, y0), (0.3, y1)) }
    line((-0.09, 5.1), (-0.09, 0.45)); line((0.09, 5.1), (0.09, 0.45)); line((-0.09, 0.45), (0.09, 0.45))
    // miệng phễu trên
    line((-0.5, 5.25), (-0.5, 5.0)); line((0.5, 5.25), (0.5, 5.0)); line((-0.62, 5.25), (0.62, 5.25))
    // ống nhánh có khóa
    line((0.78, 2.9), (1.55, 2.9)); line((0.7, 2.6), (1.55, 2.6)); line((1.55, 2.9), (1.55, 2.6))
    rect((1.55, 2.55), (1.95, 2.95), fill: c-gray.lighten(50%), stroke: 0.9pt)
    line((1.75, 2.95), (1.75, 3.3), stroke: 1.6pt)
    line((1.95, 2.75), (2.5, 2.75), stroke: 1.6pt)
    if kl != none { lab((0, -0.2), kl, at: "north", size: 9pt) }
  })
}

// Kiềng 3 chân + lưới amiăng; pos = giữa mặt lưới
#let kieng(pos, w: 2.8, h: 1.4) = {
  import draw: *
  group({
    translate(pos)
    line((-w / 2, 0), (w / 2, 0), stroke: 2.6pt + c-gray)
    line((-w / 2 + 0.15, -0.09), (w / 2 - 0.15, -0.09), stroke: 0.5pt)
    for i in range(7) { line((-w / 2 + 0.2 + i * (w - 0.4) / 6, 0), (-w / 2 + 0.3 + i * (w - 0.4) / 6, -0.09), stroke: 0.4pt) }
    line((-w / 2 + 0.25, -0.05), (-w / 2 - 0.1, -h), stroke: 1.6pt + c-gray)
    line((w / 2 - 0.25, -0.05), (w / 2 + 0.1, -h), stroke: 1.6pt + c-gray)
    line((0, -0.05), (0, -h), stroke: 1.2pt + c-gray.lighten(25%))
  })
}

// Cốc đun trên kiềng với đèn cồn; pos = tâm đáy cốc (sát lưới)
#let coc-kieng(pos, w: 2.4, h: 2.4, lvl: 0.6, liq: water, flame: true, nhiet: true, nhan: none) = {
  import draw: *
  group({
    translate(pos)
    kieng((0, 0), w: w + 0.7, h: 1.6)
    coc((0, 0.04), w: w, h: h, lvl: lvl, liq: liq)
    den-con((0, -2.65), flame: flame)
    if nhiet { nhiet-ke((w / 4, 0.25), h: h + 0.7) }
    if nhan != none { lab((0, h * lvl * 0.5), nhan, size: 9pt) }
  })
}

// Cân điện tử có cốc / vật; hien: số hiển thị
#let can-dien-tu(pos, hien: "125,40 g", vat: true) = {
  import draw: *
  group({
    translate(pos)
    rect((-1.9, 0), (1.9, 0.75), radius: 0.18, fill: c-gray.lighten(75%), stroke: 1.1pt)
    rect((-1.2, 0.18), (1.2, 0.58), radius: 0.06, fill: rgb("#dcfce7"), stroke: 0.8pt)
    lab((0, 0.38), text(font: "DejaVu Sans Mono", weight: "bold", hien), size: 9pt)
    circle((1.55, 0.37), radius: 0.09, fill: c-red, stroke: none)
    line((0, 0.75), (0, 0.95), stroke: 1.8pt)
    rect((-1.35, 0.95), (1.35, 1.08), radius: 0.05, fill: c-gray.lighten(45%), stroke: 1pt)
    if vat { coc((0, 1.08), w: 1.5, h: 1.5, lvl: 0.45) }
  })
}

// Bình cầu cất Wurtz (có nhánh bên) + nhiệt kế; pos = tâm bình
#let binh-wurtz(pos, r: 1.2, lvl: 0.4, liq: water, nhanh: 1.8, nhiet: true) = {
  import draw: *
  group({
    translate(pos)
    binh-cau((0, 0), r: r, neck-h: 1.9, lvl: lvl, liq: liq)
    let yt = r + 1.9
    nut((0, yt + 0.05), w: 0.55, h: 0.4)
    if nhiet { rect((-0.05, yt - 1.0), (0.05, yt + 0.9), fill: white, stroke: 0.8pt); rect((-0.03, yt - 1.0), (0.03, yt - 0.2), fill: c-red, stroke: none); circle((0, yt - 1.0), radius: 0.1, fill: c-red, stroke: none) }
    // nhánh bên: từ cổ hơi dốc xuống phải
    let y0 = yt - 0.55
    line((0.34, y0 + 0.14), (1.2, y0 + 0.05), (1.2 + nhanh, y0 - 0.9))
    line((0.34, y0 - 0.14), (1.1, y0 - 0.2), (1.1 + nhanh, y0 - 1.2))
    line((1.2 + nhanh, y0 - 0.9), (1.1 + nhanh, y0 - 1.2))
    bot((0.5 * r, -0.4 * r), (-0.4 * r, -0.7 * r))
  })
}

// Bình cầu 3 cổ: cổ giữa thẳng đứng, hai cổ nghiêng; pos = tâm
#let binh-cau-3-co(pos, r: 1.3, lvl: 0.35, liq: water) = {
  import draw: *
  group({
    translate(pos)
    if lvl > 0 {
      let y = -r + 2 * r * lvl
      let psi = calc.asin(calc.max(-1, calc.min(1, y / r)))
      merge-path(fill: liq, stroke: none, close: true, { arc((0, 0), start: 180deg - psi, stop: 360deg + psi, radius: r, anchor: "origin") })
    }
    circle((0, 0), radius: r, fill: glass)
    for (a, l) in ((90deg, 1.5), (45deg, 1.3), (135deg, 1.3)) {
      let bx = r * calc.cos(a)
      let by = r * calc.sin(a)
      let ux = calc.cos(a)
      let uy = calc.sin(a)
      let nx = -uy
      let ny = ux
      let w = 0.3
      let p1 = (bx + nx * w, by + ny * w)
      let p2 = (bx - nx * w, by - ny * w)
      line(p1, (p1.at(0) + ux * l, p1.at(1) + uy * l), (p2.at(0) + ux * l, p2.at(1) + uy * l), p2, stroke: 0.9pt, fill: glass)
      line((bx + nx * (w - 0.02) - ux * 0.04, by + ny * (w - 0.02) - uy * 0.04), (bx + nx * (w - 0.02) + ux * 0.1, by + ny * (w - 0.02) + uy * 0.1), (bx - nx * (w - 0.02) + ux * 0.1, by - ny * (w - 0.02) + uy * 0.1), (bx - nx * (w - 0.02) - ux * 0.04, by - ny * (w - 0.02) - uy * 0.04), close: true, fill: rgb("#e4f1fb"), stroke: none)
      let ex = bx + ux * l
      let ey = by + uy * l
      line((ex + nx * (w + 0.07), ey + ny * (w + 0.07)), (ex - nx * (w + 0.07), ey - ny * (w + 0.07)), stroke: 0.9pt)
    }
    // vẽ lại viền thân sau khi che cổ
    circle((0, 0), radius: r, fill: none)
    bot((0.3 * r, -0.5 * r), (-0.35 * r, -0.6 * r))
  })
}

// Ống chữ U đựng chất rắn (CaCl₂ khan, vôi xút…) có hai nút và ống dẫn; pos = giữa đáy chữ U
#let ong-U-ran(pos, w: 1.4, h: 2.4, solid: c-gray, nhan: none) = {
  import draw: *
  group({
    translate(pos)
    let r = w / 2
    let tw = 0.3
    // chất rắn
    merge-path(fill: solid.lighten(70%), stroke: none, close: true, {
      line((-r - tw, h - 0.5), (-r - tw, r))
      arc((0, r), start: 180deg, stop: 360deg, radius: r + tw, anchor: "origin")
      line((r + tw, r), (r + tw, h - 0.5))
      line((r + tw, h - 0.5), (r - tw, h - 0.5))
      line((r - tw, h - 0.5), (r - tw, r))
      arc((0, r), start: 360deg, stop: 180deg, radius: r - tw, anchor: "origin")
      line((-r + tw, r), (-r + tw, h - 0.5))
    })
    kt-ran(-r, r + 0.4, 0.5, 1.3, n: 9, col: solid)
    kt-ran(r, r + 0.4, 0.5, 1.3, n: 9, col: solid)
    merge-path(fill: none, {
      line((-r - tw, h), (-r - tw, r))
      arc((0, r), start: 180deg, stop: 360deg, radius: r + tw, anchor: "origin")
      line((r + tw, r), (r + tw, h))
    })
    merge-path(fill: none, {
      line((-r + tw, h), (-r + tw, r))
      arc((0, r), start: 180deg, stop: 360deg, radius: r - tw, anchor: "origin")
      line((r - tw, r), (r - tw, h))
    })
    for sx in (-1, 1) {
      nut((sx * r, h + 0.08), w: 0.5, h: 0.4)
      ong((sx * r, h + 0.55), (sx * r, h + 0.5), (sx * (r + 0.7), h + 0.5), w: 1.5pt)
    }
    if nhan != none { lab((0, -0.4), nhan, at: "north", size: 9pt) }
  })
}

// Tháp chưng cất phân đoạn (mâm + sản phẩm các phân đoạn); pos = tâm đáy tháp
#let thap-chung-cat(pos, h: 6.0, w: 1.6, mam: 7, cac: ("Khí", "Xăng", "Dầu hỏa", "Dầu điêden", "Dầu nhờn", "Cặn mazut")) = {
  import draw: *
  group({
    translate(pos)
    rect((-w / 2, 0), (w / 2, h), radius: 0.25, fill: glass, stroke: 1.2pt)
    for i in range(mam) {
      let y = 0.8 + i * (h - 1.2) / (mam - 1)
      line((-w / 2, y), (w / 2 - 0.3, y), stroke: 0.8pt)
      line((w / 2 - 0.3, y), (w / 2 - 0.3, y - 0.12), stroke: 0.8pt)
      circle((0, y + 0.08), radius: 0.04, fill: ink)
    }
    // dầu thô vào qua lò đun
    line((-w / 2 - 1.2, 1.3), (-w / 2, 1.3), mark: (end: ">", fill: ink, size: 0.2), stroke: 1.2pt)
    lab((-w / 2 - 1.25, 1.3), [Dầu thô], at: "east", size: 9pt)
    // sản phẩm từ trên xuống dưới
    let n = cac.len()
    for (i, t) in cac.enumerate() {
      let y = if i == 0 { h + 0.4 } else if i == n - 1 { 0.05 } else { h - 0.5 - (i - 1) * (h - 1.4) / (n - 3) }
      let ly = if i == 0 { h + 0.4 } else { y }
      line((w / 2, ly), (w / 2 + 0.9, ly), mark: (end: ">", fill: ink, size: 0.18), stroke: 1pt)
      lab((w / 2 + 0.95, ly), t, at: "west", size: 9pt)
    }
    // mũi tên nhiệt độ tăng
    line((-w / 2 - 0.5, 0.4), (-w / 2 - 0.5, h - 0.2), stroke: 1pt + c-red, mark: (end: ">", fill: c-red, size: 0.18))
    lab((-w / 2 - 0.55, h / 2), text(fill: c-red)[nhiệt độ sôi giảm dần], at: "east", size: 8pt)
  })
}

// ───── HÓA: MÔ HÌNH & CÔNG THỨC KHUNG ─────
// Công thức khung tổng quát: pts = tọa độ đỉnh; bonds = ((i, j, bậc), …); lbls = (chỉ-số: "nhãn", …) – đỉnh có nhãn thì đầu liên kết lùi lại.
#let khung(pts, bonds, lbls: (:), w: 1.4pt, sz: 10pt) = {
  import draw: *
  let half(i) = {
    // nửa bề rộng nhãn (cm) để đầu liên kết lùi vừa đủ
    if str(i) not in lbls { return 0 }
    let n = lbls.at(str(i)).clusters().filter(c => c.match(regex("[A-Za-z]")) != none).len()
    0.13 + 0.1 * n
  }
  for bd in bonds {
    let i = bd.at(0)
    let j = bd.at(1)
    let n = bd.at(2)
    let side = bd.at(3, default: none)
    let a = pts.at(i)
    let b = pts.at(j)
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let d = calc.sqrt(dx * dx + dy * dy)
    let ux = dx / d
    let uy = dy / d
    let sa = half(i)
    let sb = half(j)
    let a2 = (a.at(0) + ux * sa, a.at(1) + uy * sa)
    let b2 = (b.at(0) - ux * sb, b.at(1) - uy * sb)
    if side != none and n == 2 {
      line(a2, b2, stroke: w)
      let o = 0.16 * side
      let sh = 0.13
      line((a2.at(0) - uy * o + ux * sh, a2.at(1) + ux * o + uy * sh), (b2.at(0) - uy * o - ux * sh, b2.at(1) + ux * o - uy * sh), stroke: w)
    } else {
      for k in range(n) {
        let o = (k - (n - 1) / 2) * 0.12
        line((a2.at(0) - uy * o, a2.at(1) + ux * o), (b2.at(0) - uy * o, b2.at(1) + ux * o), stroke: w)
      }
    }
  }
  for (k, v) in lbls { lab(pts.at(int(k)), ch(v), size: sz) }
}

// Vòng glucozơ dạng Haworth. alpha: OH ở C1 hướng xuống (α) hay lên (β)
#let glucozo-vong(alpha: true, so: true) = {
  import draw: *
  let c1 = (1.7, 0)
  let c2 = (1.0, -0.7)
  let c3 = (-1.0, -0.7)
  let c4 = (-1.7, 0)
  let c5 = (-1.0, 0.7)
  let o = (1.0, 0.7)
  line(c4, c5, o, c1, stroke: 1.3pt)
  line(c4, c3, stroke: 2.6pt)
  line(c3, c2, stroke: 3.4pt)
  line(c2, c1, stroke: 2.6pt)
  lab(o, text(weight: "bold")[O], size: 10.5pt)
  let sub(p, up, t, dy: 0.55) = {
    let y1 = if up { p.at(1) + dy } else { p.at(1) - dy }
    line(p, (p.at(0), y1), stroke: 1.2pt)
    lab((p.at(0), y1 + if up { 0.08 } else { -0.08 }), ct(t), at: if up { "south" } else { "north" }, size: 10pt)
  }
  sub(c1, not alpha, "OH")
  sub(c1, alpha, "H", dy: 0.5)
  sub(c2, false, "OH"); sub(c2, true, "H", dy: 0.5)
  sub(c3, true, "OH", dy: 0.45); sub(c3, false, "H", dy: 0.5)
  sub(c4, false, "OH"); sub(c4, true, "H", dy: 0.5)
  sub(c5, true, "CH2OH", dy: 0.6)
  if so {
    for (p, t) in (((2.1, -0.2), "1"), ((1.6, -0.42), "2"), ((-1.6, -0.42), "3"), ((-2.1, -0.2), "4"), ((-0.62, 1.0), "5")) { lab(p, text(size: 7.5pt, fill: c-gray)[#t], size: 7.5pt) }
  }
}

// Axit amin tổng quát H₂N–CH(R)–COOH; ion = dạng ion lưỡng cực
#let axit-amin(r: "R", ion: false) = {
  import draw: *
  let n = (-1.7, 0)
  let c = (0, 0)
  let k = (1.7, 0)
  lab(n, if ion { [H#sub[3]N#super[+]] } else { [H#sub[2]N] }, size: 11pt)
  lab(k, if ion { [COO#super[−]] } else { [COOH] }, size: 11pt)
  line((-1.15, 0), (-0.3, 0), stroke: 1.3pt)
  line((0.3, 0), (0.95, 0), stroke: 1.3pt)
  lab(c, [C], size: 11pt)
  line((0, 0.3), (0, 0.85), stroke: 1.3pt)
  lab((0, 0.95), ct(r), at: "south", size: 11pt)
  line((0, -0.3), (0, -0.85), stroke: 1.3pt)
  lab((0, -0.95), [H], at: "north", size: 11pt)
}

// Mạch cacbon n nguyên tử zigzag; kind: ankan / anken / ankin; vt: nối đa ở giữa C_vt và C_{vt+1}; so: ghi số C
#let mach-n(n, kind: "ankan", vt: 1, so: false, mach-nhanh: ()) = {
  import draw: *
  let pts = range(n).map(i => (i * 0.87, if calc.rem(i, 2) == 0 { 0 } else { 0.5 }))
  let bonds = range(n - 1).map(i => (i, i + 1, if i + 1 == vt and kind == "anken" { 2 } else if i + 1 == vt and kind == "ankin" { 3 } else { 1 }))
  khung(pts, bonds, lbls: (:))
  if so { for i in range(n) { lab((pts.at(i).at(0), pts.at(i).at(1) + if calc.rem(i, 2) == 0 { -0.28 } else { 0.28 }), text(size: 8pt, fill: c-gray)[#(i + 1)], size: 8pt) } }
}

// Đồng phân: kind chọn bộ hình; mỗi hình có tên bên dưới
#let dong-phan(kind) = {
  import draw: *
  let z(n, x0, y0) = range(n).map(i => (x0 + i * 0.87, y0 + if calc.rem(i, 2) == 0 { 0 } else { 0.5 }))
  let name(x, y, t) = lab((x, y), text(size: 9pt, t), at: "north", size: 9pt)
  if kind == "C4H10" {
    let a = z(4, 0, 0)
    khung(a, ((0, 1, 1), (1, 2, 1), (2, 3, 1)))
    name(1.3, -0.3, [butan])
    let b = ((5.0, 0), (5.87, 0.5), (6.74, 0), (5.87, 1.5))
    khung(b, ((0, 1, 1), (1, 2, 1), (1, 3, 1)))
    name(5.87, -0.3, [2-metylpropan])
  } else if kind == "C5H12" {
    khung(z(5, 0, 0), ((0, 1, 1), (1, 2, 1), (2, 3, 1), (3, 4, 1)))
    name(1.7, -0.3, [pentan])
    khung(((5.2, 0), (6.07, 0.5), (6.94, 0), (7.81, 0.5), (6.07, 1.5)), ((0, 1, 1), (1, 2, 1), (2, 3, 1), (1, 4, 1)))
    name(6.5, -0.3, [2-metylbutan])
    khung(((10.5, 0.5), (11.37, 0), (12.24, 0.5), (11.37, 1.0), (11.37, -1.0)), ((0, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1)))
    name(11.37, -1.3, [2,2-đimetylpropan])
  } else if kind == "C4H8" {
    khung(z(4, 0, 0), ((0, 1, 2), (1, 2, 1), (2, 3, 1)))
    name(1.3, -0.3, [but-1-en])
    khung(z(4, 4.4, 0), ((0, 1, 1), (1, 2, 2), (2, 3, 1)))
    name(5.7, -0.3, [but-2-en])
    khung(((9.0, 0), (9.87, 0.5), (10.74, 0), (9.87, 1.5)), ((0, 1, 1), (1, 2, 2), (1, 3, 1)))
    name(9.87, -0.3, [2-metylpropen])
  } else if kind == "C2H6O" {
    khung(((0, 0), (0.87, 0.5), (1.74, 0)), ((0, 1, 1), (1, 2, 1)), lbls: ("2": "OH"))
    name(0.87, -0.3, [ancol etylic])
    khung(((4.6, 0), (5.47, 0.5), (6.34, 0)), ((0, 1, 1), (1, 2, 1)), lbls: ("1": "O"))
    name(5.47, -0.3, [đimetyl ete])
  } else if kind == "CIS" {
    khung(((0, 0.5), (0.87, 0), (1.87, 0), (2.74, 0.5)), ((0, 1, 1), (1, 2, 2), (2, 3, 1)))
    name(1.37, -0.3, [cis-but-2-en])
    khung(((5.2, 0.5), (6.07, 0), (7.07, 0), (7.94, -0.5)), ((0, 1, 1), (1, 2, 2), (2, 3, 1)))
    name(6.57, -0.8, [trans-but-2-en])
  } else if kind == "C3H8O" {
    khung(z(4, 0, 0), ((0, 1, 1), (1, 2, 1), (2, 3, 1)), lbls: ("3": "OH"))
    name(0.87, -0.3, [propan-1-ol])
    khung(((4.4, 0), (5.27, 0.5), (6.14, 0), (5.27, 1.4)), ((0, 1, 1), (1, 2, 1), (1, 3, 1)), lbls: ("3": "OH"))
    name(5.27, -0.3, [propan-2-ol])
  } else if kind == "C2H4O2" {
    khung(((0, 0), (0.87, 0.5), (1.74, 0), (0.87, 1.5)), ((0, 1, 1), (1, 2, 1), (1, 3, 2)), lbls: ("2": "OH", "3": "O"))
    name(0.87, -0.4, [axit axetic])
    khung(((4.6, 0), (5.47, 0.5), (6.34, 0), (6.34, 1.0), (7.2, 0.5)), ((0, 1, 1), (1, 2, 1), (2, 3, 2), (2, 4, 1)), lbls: ("1": "O", "3": "O", "4": "H"))
    name(6.0, -0.4, [metyl fomat])
  }
}

// Ô mạng tinh thể lập phương. kind: nacl | kimcuong | tamkhoi | tamdien | donggian ; s = cạnh (cm)
#let o-mang(kind: "nacl", s: 3.2, nhan: true) = {
  import draw: *
  let px(x, y, z) = ((x + 0.42 * z) * s, (y + 0.3 * z) * s)
  let cols = (a: c-purple, b: c-green, g: c-gray, k: c-amber)
  let cube-edges = ()
  for (a, b) in (((0, 0, 0), (1, 0, 0)), ((0, 1, 0), (1, 1, 0)), ((0, 0, 0), (0, 1, 0)), ((1, 0, 0), (1, 1, 0)), ((0, 0, 1), (1, 0, 1)), ((0, 1, 1), (1, 1, 1)), ((0, 0, 1), (0, 1, 1)), ((1, 0, 1), (1, 1, 1)), ((0, 0, 0), (0, 0, 1)), ((1, 0, 0), (1, 0, 1)), ((0, 1, 0), (0, 1, 1)), ((1, 1, 0), (1, 1, 1))) {
    let hidden = (a == (0, 0, 1) or b == (0, 0, 1)) or ((a == (0, 0, 0)) and (b == (0, 0, 1)))
    let hid = (a, b) in (((0, 0, 1), (1, 0, 1)), ((0, 0, 1), (0, 1, 1)), ((0, 0, 0), (0, 0, 1)))
    line(px(..a), px(..b), stroke: if hid { (thickness: 0.7pt, paint: c-gray, dash: "dashed") } else { (thickness: 0.9pt, paint: ink) })
  }
  let ball(p, r, c) = circle(px(..p), radius: r, fill: gradient.radial(c.lighten(65%), c, center: (35%, 32%), radius: 85%), stroke: 0.6pt + c.darken(35%))
  if kind == "nacl" {
    // lưới 3×3×3 (bước 1/2): Na⁺ nhỏ tím, Cl⁻ lớn xanh
    let pts = ()
    for i in range(3) { for j in range(3) { for k in range(3) { pts.push((i / 2, j / 2, k / 2)) } } }
    let ord = pts.sorted(key: p => (-p.at(2), p.at(1)))
    for p in ord {
      let par = calc.rem(int(p.at(0) * 2 + p.at(1) * 2 + p.at(2) * 2), 2)
      // nối với láng giềng ở phía trước (để thấy liên kết): vẽ trước quả cầu
      ball(p, if par == 0 { 0.21 } else { 0.13 }, if par == 0 { c-green } else { c-purple })
    }
    if nhan {
      lab((px(0.5, 0, 0).at(0) + 0.2, -0.45), text(size: 9pt)[#box(width: 0.9em, height: 0.9em, radius: 50%, fill: c-green) Cl#super[−] #h(0.8em) #box(width: 0.7em, height: 0.7em, radius: 50%, fill: c-purple) Na#super[+]], at: "north", size: 9pt)
    }
  } else if kind == "kimcuong" {
    let corner = ((0, 0, 0), (1, 0, 0), (0, 1, 0), (1, 1, 0), (0, 0, 1), (1, 0, 1), (0, 1, 1), (1, 1, 1))
    let faces = ((0.5, 0.5, 0), (0.5, 0.5, 1), (0.5, 0, 0.5), (0.5, 1, 0.5), (0, 0.5, 0.5), (1, 0.5, 0.5))
    let inner = (
      ((0.25, 0.25, 0.25), ((0, 0, 0), (0.5, 0.5, 0), (0.5, 0, 0.5), (0, 0.5, 0.5))),
      ((0.75, 0.75, 0.25), ((1, 1, 0), (0.5, 0.5, 0), (1, 0.5, 0.5), (0.5, 1, 0.5))),
      ((0.75, 0.25, 0.75), ((1, 0, 1), (0.5, 0, 0.5), (1, 0.5, 0.5), (0.5, 0.5, 1))),
      ((0.25, 0.75, 0.75), ((0, 1, 1), (0, 0.5, 0.5), (0.5, 1, 0.5), (0.5, 0.5, 1))),
    )
    for (c, ns) in inner { for nb in ns { line(px(..c), px(..nb), stroke: (thickness: 1.5pt, paint: c-gray.darken(30%))) } }
    let all = (corner + faces + inner.map(t => t.at(0))).sorted(key: p => (-p.at(2), p.at(1)))
    for p in all { ball(p, 0.09, if p in inner.map(t => t.at(0)) { c-amber } else { c-gray }) }
    if nhan { lab((px(0.5, 0, 0).at(0), -0.5), text(size: 9pt)[Mỗi nguyên tử C liên kết với 4 nguyên tử C lân cận (tứ diện)], at: "north", size: 9pt) }
  } else {
    let pts = ((0, 0, 0), (1, 0, 0), (0, 1, 0), (1, 1, 0), (0, 0, 1), (1, 0, 1), (0, 1, 1), (1, 1, 1))
    if kind == "tamkhoi" { pts.push((0.5, 0.5, 0.5)) }
    if kind == "tamdien" { for f in ((0.5, 0.5, 0), (0.5, 0.5, 1), (0.5, 0, 0.5), (0.5, 1, 0.5), (0, 0.5, 0.5), (1, 0.5, 0.5)) { pts.push(f) } }
    for p in pts.sorted(key: p => (-p.at(2), p.at(1))) { ball(p, if kind == "donggian" { 0.1 } else { 0.11 }, if p.all(v => v == 0 or v == 1) { c-gray } else { c-amber }) }
  }
}

// Mạng than chì: hai lớp lục giác (nhìn xiên), khoảng cách lớp 0,335 nm
#let than-chi(nhan: true) = {
  import draw: *
  let r = 0.5
  let sq = 0.38
  let hex-layer(y0, col) = {
    for hi in range(5) {
      for hj in range(3) {
        let cx = hi * 1.5 * r
        let cy = y0 + (hj * 1.732 * r + calc.rem(hi, 2) * 0.866 * r) * sq
        let vs = range(6).map(k => (cx + r * calc.cos(k * 60deg), cy + r * calc.sin(k * 60deg) * sq))
        line(..vs, close: true, stroke: 0.9pt + col)
        for v in vs { circle(v, radius: 0.04, fill: col, stroke: none) }
      }
    }
  }
  hex-layer(0, c-gray.darken(10%))
  hex-layer(1.7, c-blue)
  if nhan {
    line((7.5 * r + 0.3, 0.15), (7.5 * r + 0.3, 1.85), mark: (start: ">", end: ">", fill: ink, size: 0.15), stroke: 0.8pt)
    lab((7.5 * r + 0.4, 1.0), [0,335 nm], at: "west", size: 9pt)
    lab((3.2, -0.6), [0,142 nm giữa hai nguyên tử C cùng lớp], at: "north", size: 9pt)
  }
}

// ───── HÓA: SƠ ĐỒ THÍ NGHIỆM HOÀN CHỈNH ─────
// Khối bông tẩm kiềm / chất hấp thụ ở miệng bình
#let bong(pos, w: 0.5) = { import draw: *; circle(pos, radius: (w, w * 0.45), fill: rgb("#f1f5f9"), stroke: 0.7pt) }
// Chậu nước + ống nghiệm úp thu khí qua nước; ống dẫn vào từ trái. pos = giữa đáy chậu. Trả về điểm vào của ống dẫn là (x - 0.0, y_cao)
#let thu-nuoc(pos, gas: none, w: 4.4) = {
  import draw: *
  group({
    translate(pos)
    chau((0, 0), w: w, h: 2.0, hn: 1.5)
    ong-up((0.3, 0.75), h: 3.3, w: 0.85, wl: 0.25, gas: gas)
  })
}
// Nhãn có đường chỉ (chú thích): từ điểm `a` đến nhãn tại `b`
#let chuthich(a, b, t, at: "west", size: 9.5pt) = {
  import draw: *
  line(a, b, stroke: 0.5pt + c-gray)
  lab(b, ct(t), at: at, size: size)
}

// Điều chế khí rắn + lỏng (không đun), thu bằng đẩy không khí: SO₂, CO₂, H₂…
// ran: chất rắn trong bình, long: chất lỏng trong phễu; up: ngửa bình thu (khí nặng hơn không khí) hay úp (nhẹ hơn)
#let tn-binh-pheu(ran: "Na2SO3", long: "H2SO4 đặc", khi: "SO2", up: true, bong-kiem: false, rua: none) = {
  import draw: *
  // bình cầu + phễu nhỏ giọt
  binh-cau((0, 0), r: 1.2, neck-h: 1.0, lvl: 0.35, liq: rgb("#e5e7eb"))
  kt-ran(0, -1.0, 1.4, 0.4, n: 10, col: c-gray)
  nut((0, 2.2), w: 0.7, h: 0.5)
  // phễu nhỏ giọt: cuống xuyên nút xuống gần mặt chất rắn
  line((-0.12, -0.1), (-0.12, 3.0), stroke: 1.1pt); line((-0.03, -0.1), (-0.03, 3.0), stroke: 1.1pt)
  line((-0.12, 3.0), (-0.7, 3.9), (0.55, 3.9), (-0.03, 3.0), stroke: 1pt, fill: rgb(253, 224, 71, 45%))
  rect((-0.28, 2.72), (0.1, 2.82), radius: 0.03, fill: c-gray.lighten(40%), stroke: 0.7pt)
  chuthich((-0.7, 3.6), (-1.5, 3.8), long, at: "east")
  // ống dẫn khí
  let gx = 3.6
  ong((0.26, 1.6), (0.26, 2.75), (gx, 2.75), (gx, 0.2), w: 1.6pt)
  if up {
    lo-khi((gx, -0.7), w: 1.9, h: 2.9, gas: ch(khi), cover: false)
    if bong-kiem { bong((gx, 2.25), w: 0.55) }
    chuthich((gx + 0.95, 1.2), (gx + 1.4, 1.2), "Khí " + khi + " (nặng hơn không khí)", at: "west", size: 9pt)
  } else {
    ong-up((gx, -0.7 + 0.0), h: 3.4, w: 1.0, wl: 0, gas: ch(khi))
  }
  chuthich((-0.9, -0.95), (-1.6, -1.2), ran, at: "east")
}

// Hai khí đặc thù: dùng chung bình rửa
#let tn-so2(rua: false) = {
  import draw: *
  tn-binh-pheu(ran: "Na2SO3 (rắn)", long: "H2SO4 đặc", khi: "SO2", up: true, bong-kiem: true)
  lab((2.4, 4.5), text(size: 9pt)[Bông tẩm NaOH ở miệng bình hấp thụ SO#sub[2] dư], at: "south-west", size: 9pt)
  line((4.2, 4.45), (3.6, 2.55), stroke: 0.5pt + c-gray)
}
#let tn-co2() = {
  import draw: *
  tn-binh-pheu(ran: "CaCO3 (rắn)", long: "dd HCl", khi: "CO2", up: true)
}

// NH₃: đun NH₄Cl + Ca(OH)₂ trong ống nghiệm nghiêng, thu bằng úp ngược ống
#let tn-nh3() = {
  import draw: *
  ong-nghiem-nghieng((0.0, 1.0), ang: -12deg, h: 3.8, w: 0.95, bot-dots: 14, dotcol: c-gray)
  den-con((0.65, -1.6), flame: true)
  nut((3.8, 0.1), w: 0.45, h: 0.5)
  ong((3.8, 0.0), (5.4, 0.0), (5.4, 3.3), w: 1.6pt)
  ong-up((5.4, 0.2), h: 3.6, w: 1.1, wl: 0, gas: ch("NH3"))
  bong((5.4, 0.2), w: 0.32)
  chuthich((0.3, 1.5), (-0.3, 2.9), "NH4Cl + Ca(OH)2 (rắn)", at: "south")
  chuthich((5.95, 2.0), (6.6, 2.0), "Khí NH3 (nhẹ hơn không khí)", at: "west", size: 9pt)
}

// C₂H₄: C₂H₅OH + H₂SO₄ đặc, 170°C, bình cầu đun, thu qua nước
#let tn-c2h4() = {
  import draw: *
  binh-cau((0, 0), r: 1.25, neck-h: 1.0, lvl: 0.45, liq: rgb("#e5e7eb"))
  kt-ran(0, -1.15, 0.6, 0.4, n: 6, col: c-gray)
  nut((0, 2.3), w: 0.7, h: 0.5)
  nhiet-ke((-0.12, -0.5), h: 3.4)
  ong((0.2, 0.7), (0.2, 3.1), (4.0, 3.1), (4.0, 0.9), w: 1.6pt)
  kieng((0, -1.35), w: 2.6, h: 1.1)
  den-con((0, -3.3), flame: true)
  thu-nuoc((4.9, -0.8), gas: ch("C2H4"), w: 4.2)
  ong((4.0, 0.9), (4.0, -0.2), (5.2, -0.2), (5.2, 0.5), w: 1.6pt)
  bot((5.18, 0.9), (5.25, 1.6))
  chuthich((-0.6, 0.0), (-2.1, 0.6), "C2H5OH + H2SO4 đặc", at: "east")
  chuthich((0.0, -0.9), (-2.1, -0.9), "đá bọt, 170°C", at: "east")
  lab((5.2, -1.2), text(size: 9pt)[Khí C#sub[2]H#sub[4] đẩy nước (ít tan)], at: "north", size: 9pt)
}

// C₂H₂: CaC₂ + H₂O (nước muối bão hòa), thu qua nước
#let tn-c2h2() = {
  import draw: *
  erlen((0, 0), w: 3.0, h: 3.0, lvl: 0.25, liq: rgb("#e5e7eb"), nut: false)
  kt-ran(0, 0.15, 1.6, 0.3, n: 8, col: c-gray)
  nut((0, 3.1), w: 0.8, h: 0.5)
  line((-0.13, 0.7), (-0.13, 3.9), stroke: 1.1pt); line((-0.03, 0.7), (-0.03, 3.9), stroke: 1.1pt)
  line((-0.13, 3.9), (-0.7, 4.8), (0.55, 4.8), (-0.03, 3.9), stroke: 1pt, fill: rgb(147, 197, 253, 55%))
  rect((-0.27, 3.55), (0.1, 3.65), radius: 0.03, fill: c-gray.lighten(40%), stroke: 0.7pt)
  ong((0.3, 3.2), (0.3, 3.7), (4.0, 3.7), (4.0, 0.9), w: 1.6pt)
  thu-nuoc((4.9, -0.8), gas: ch("C2H2"), w: 4.2)
  ong((4.0, 0.9), (4.0, -0.2), (5.2, -0.2), (5.2, 0.5), w: 1.6pt)
  bot((5.18, 0.9), (5.25, 1.6))
  chuthich((-0.7, 4.5), (-1.4, 4.7), "H2O hoặc dd NaCl bão hòa", at: "east")
  chuthich((-0.9, 0.3), (-1.6, 0.0), "CaC2 (rắn)", at: "east")
}

// Ăn mòn điện hóa: hai điện cực nối dây qua điện kế trong dung dịch chất điện li
#let tn-an-mon(a: "Fe", c: "Cu", dd: "dd NaCl", ac: rgb("#cbd5e1"), cc: rgb("#d97706")) = {
  import draw: *
  coc((0, 0), w: 5.0, h: 3.2, lvl: 0.7, liq: rgb(147, 197, 253, 60%))
  dien-cuc((-1.2, 0.35), h: 3.9, col: ac)
  dien-cuc((1.2, 0.35), h: 3.9, col: cc)
  day((-1.2, 4.25), (-1.2, 5.3), (-0.5, 5.3))
  day((0.5, 5.3), (1.2, 5.3), (1.2, 4.25))
  may-do((0, 5.3), "G", r: 0.5)
  line((-0.9, 5.95), (0.9, 5.95), mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.2pt + c-blue)
  lab((0, 6.05), text(fill: c-blue)[e], at: "south", size: 10pt)
  lab((-1.4, 4.0), [#ct(a) (−) anot], at: "east", size: 9.5pt)
  lab((1.4, 4.0), [#ct(c) (+) catot], at: "west", size: 9.5pt)
  lab((0, 0.35), ct(dd), at: "south", size: 9.5pt)
  lab((-1.4, 1.6), text(size: 8.5pt, fill: c-red)[bị ăn mòn], at: "east", size: 8.5pt)
}

// Mạ điện: anot Cu hòa tan, catot là vật cần mạ, nguồn một chiều
#let tn-ma-dien(anot: "Cu", catot: "Vật cần mạ", dd: "dd CuSO4") = {
  import draw: *
  coc((0, 0), w: 5.2, h: 3.2, lvl: 0.72, liq: rgb(96, 165, 250, 70%))
  dien-cuc((-1.3, 0.4), h: 3.8, col: rgb("#d97706"))
  dien-cuc((1.3, 0.4), h: 3.8, col: rgb("#94a3b8"))
  rect((1.2, 0.4), (1.4, 1.5), fill: rgb("#d97706"), stroke: none)
  day((-1.3, 4.2), (-1.3, 5.3), (-0.3, 5.3))
  day((0.3, 5.3), (1.3, 5.3), (1.3, 4.2))
  sym((-0.3, 5.3), (0.3, 5.3), "pin", len: 0.6)
  lab((-1.5, 4.0), [#ct(anot) (+) anot], at: "east", size: 9.5pt)
  lab((1.5, 4.0), [(−) catot: #ct(catot)], at: "west", size: 9.5pt)
  lab((0, 0.4), ct(dd), at: "south", size: 9.5pt)
  lab((-1.5, 1.6), text(size: 8.5pt, fill: c-red)[tan dần], at: "east", size: 8.5pt)
  lab((1.5, 1.0), text(size: 8.5pt, fill: c-green)[kim loại bám vào], at: "west", size: 8.5pt)
}

// Thí nghiệm tráng bạc: ống nghiệm nhúng trong cốc nước nóng đun trên kiềng
#let tn-trang-bac() = {
  import draw: *
  coc-kieng((0, 0), w: 3.0, h: 2.6, lvl: 0.75, liq: rgb(147, 197, 253, 55%), flame: true, nhiet: false)
  // ống nghiệm dựng trong cốc (kẹp bằng giá)
  merge-path(fill: rgb("#e5e7eb"), stroke: none, close: true, {
    line((-0.45, 3.9), (-0.45, 0.85))
    arc((0, 0.85), start: 180deg, stop: 360deg, radius: 0.45, anchor: "origin")
    line((0.45, 0.85), (0.45, 3.9))
  })
  line((-0.4, 3.0), (-0.4, 0.9), stroke: 2.6pt + c-gray.lighten(30%))
  line((0.4, 3.0), (0.4, 0.9), stroke: 2.6pt + c-gray.lighten(30%))
  merge-path(fill: none, { line((-0.45, 4.2), (-0.45, 0.85)); arc((0, 0.85), start: 180deg, stop: 360deg, radius: 0.45, anchor: "origin"); line((0.45, 0.85), (0.45, 4.2)) })
  line((-0.52, 4.2), (0.52, 4.2))
  line((0.45, 3.9), (2.2, 3.9), stroke: 2.4pt + c-gray)
  rect((2.0, 3.0), (2.3, 4.3), fill: c-gray.lighten(50%), stroke: 0.7pt)
  chuthich((0.45, 2.2), (2.4, 2.3), "Lớp Ag bám thành ống (gương bạc)", at: "west", size: 9pt)
  chuthich((-0.2, 1.4), (-3.1, 1.2), "dd AgNO3/NH3 + glucozơ", at: "east", size: 9pt)
  chuthich((1.2, 0.9), (2.4, 0.6), "Nước nóng 60–70°C", at: "west", size: 9pt)
}

// ═══════════ VẬT LÍ (đợt 2): thí nghiệm kinh điển ═══════════
// Điốt đặt giữa a→b (mũi tam giác hướng về b)
#let diot(a, b, lbl: none, side: 1, len: 0.6) = {
  import draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let ang = calc.atan2(dx, dy)
  group({
    translate(a)
    rotate(ang)
    let m = d / 2
    line((0, 0), (m - len / 2, 0)); line((m + len / 2, 0), (d, 0))
    line((m - len / 2, 0.3), (m - len / 2, -0.3), (m + len / 2, 0), close: true, fill: white)
    line((m + len / 2, 0.3), (m + len / 2, -0.3))
  })
  if lbl != none {
    let nx = side * (-dy / d)
    let ny = side * (dx / d)
    lab(((a.at(0) + b.at(0)) / 2 + nx * 0.6, (a.at(1) + b.at(1)) / 2 + ny * 0.6), lbl, size: 10pt)
  }
}

// Thí nghiệm Young hoàn chỉnh: S → khe S₁S₂ → màn; vân sáng/tối; a, D, i
#let young-tn(i: 0.6, n: 4, a: 1.2, D: 6.0, mau: rgb("#facc15"), nhan: true) = {
  import draw: *
  let x1 = 2.2   // màn có khe S
  let x2 = 4.4   // màn có hai khe S₁S₂
  let x3 = x2 + D
  // nguồn sáng S
  circle((0.2, 0), radius: 0.14, fill: mau, stroke: 0.8pt)
  lab((0.2, -0.4), [$S$], size: 10pt)
  // màn chắn 1 (một khe), màn chắn 2 (hai khe)
  for (x, gaps) in ((x1, (0,)), (x2, (a / 2, -a / 2))) {
    let ys = (-3.6,) + gaps.sorted().map(g => (g - 0.07, g + 0.07)).flatten() + (3.6,)
    for k in range(0, ys.len(), step: 2) { rect((x - 0.07, ys.at(k)), (x + 0.07, ys.at(k + 1)), fill: c-gray.lighten(30%), stroke: 0.6pt) }
  }
  // tia: S → S, S → S₁S₂, S₁S₂ → vân trung tâm và vân sáng bậc 1
  tia((0.3, 0), (x1, 0), col: mau.darken(15%), w: 0.9pt)
  tia((x1, 0), (x2, a / 2), col: mau.darken(15%), w: 0.9pt)
  tia((x1, 0), (x2, -a / 2), col: mau.darken(15%), w: 0.9pt)
  tia((x2, a / 2), (x3, 0), col: mau.darken(15%), w: 0.9pt)
  tia((x2, -a / 2), (x3, 0), col: mau.darken(15%), w: 0.9pt)
  tia((x2, a / 2), (x3, i), col: mau.darken(15%), w: 0.9pt, dash: "dashed")
  tia((x2, -a / 2), (x3, i), col: mau.darken(15%), w: 0.9pt, dash: "dashed")
  // màn quan sát
  line((x3, -3.6), (x3, 3.6), stroke: 1.6pt)
  let bw = 0.5
  let kmax = calc.floor(3.5 / i)
  for k in range(-kmax, kmax + 1) {
    rect((x3 + 0.05, k * i - i / 4), (x3 + 0.05 + bw, k * i + i / 4), fill: mau, stroke: none)
  }
  rect((x3 + 0.05, -3.5), (x3 + 0.05 + bw, 3.5), fill: rgb(0, 0, 0, 18%), stroke: none)
  for k in range(-kmax, kmax + 1) { rect((x3 + 0.05, k * i - i / 4), (x3 + 0.05 + bw, k * i + i / 4), fill: mau, stroke: none) }
  if nhan {
    lab((x1, 3.75), [$E_1$], at: "south", size: 10pt)
    lab((x2, 3.75), [$E_2$], at: "south", size: 10pt)
    lab((x3, 3.75), [$E$], at: "south", size: 10pt)
    lab((x2 - 0.15, a / 2), [$S_1$], at: "east", size: 10pt)
    lab((x2 - 0.15, -a / 2), [$S_2$], at: "east", size: 10pt)
    // a
    line((x2 - 1.0, -a / 2), (x2 - 1.0, a / 2), mark: (start: ">", end: ">", fill: ink, size: 0.14), stroke: 0.7pt)
    lab((x2 - 1.05, 0), [$a$], at: "east", size: 10pt)
    // D
    line((x2, -3.0), (x3, -3.0), mark: (start: ">", end: ">", fill: ink, size: 0.14), stroke: 0.7pt)
    lab((x2 + D / 2, -3.05), [$D$], at: "north", size: 10pt)
    // i
    line((x3 + bw + 0.55, 0), (x3 + bw + 0.55, i), mark: (start: ">", end: ">", fill: ink, size: 0.12), stroke: 0.7pt)
    lab((x3 + bw + 0.6, i / 2), [$i$], at: "west", size: 10pt)
    lab((x3 + bw + 0.15, 0), [$O$], at: "west", size: 9pt)
    lab((x3 + 0.2, -3.9), text(size: 8.5pt)[vân sáng #box(width: 0.7em, height: 0.7em, fill: mau) / vân tối #box(width: 0.7em, height: 0.7em, fill: rgb("#cbd5e1"))], at: "north", size: 8.5pt)
  }
}

// Cảm ứng điện từ: nam châm thanh chuyển động so với ống dây nối điện kế
#let cam-ung-tn(tien: true, vong: 7) = {
  import draw: *
  let x0 = 3.0
  let L = vong * 0.32
  // ống dây
  for k in range(vong) { let x = x0 - L / 2 + k * 0.32; circle((x, 0), radius: (0.22, 0.85), stroke: 1.1pt + c-amber.darken(10%), fill: none) }
  day((x0 - L / 2, -0.85), (x0 - L / 2 - 0.4, -0.85), (x0 - L / 2 - 0.4, -2.4), (x0 - 0.5, -2.4))
  day((x0 + L / 2, -0.85), (x0 + L / 2 + 0.4, -0.85), (x0 + L / 2 + 0.4, -2.4), (x0 + 0.5, -2.4))
  may-do((x0, -2.4), "G", r: 0.5)
  // nam châm
  let mx = if tien { -2.4 } else { 0.9 }
  rect((mx, -0.4), (mx + 1.3, 0.4), fill: rgb("#fecaca"), stroke: 1pt)
  rect((mx + 1.3, -0.4), (mx + 2.6, 0.4), fill: rgb("#bfdbfe"), stroke: 1pt)
  lab((mx + 0.65, 0), [N], size: 11pt); lab((mx + 1.95, 0), [S], size: 11pt)
  let dir = if tien { 1 } else { -1 }
  line((mx + 1.3, 0.85), (mx + 1.3 + dir * 1.2, 0.85), mark: (end: ">", fill: c-red, size: 0.22), stroke: 1.5pt + c-red)
  lab((mx + 1.3 + dir * 0.6, 0.95), text(fill: c-red)[$arrow(v)$], at: "south", size: 11pt)
  lab((x0, 1.25), text(size: 9pt)[ống dây (cuộn dây)], at: "south", size: 9pt)
  lab((x0, -3.1), text(size: 9pt)[điện kế: kim lệch khi nam châm chuyển động], at: "north", size: 9pt)
}

// Tế bào quang điện: catot K nhận ánh sáng, êlectron bật ra tới anot A
#let quang-dien-tn(nhan: true) = {
  import draw: *
  circle((0, 0), radius: (1.7, 1.45), fill: glass, stroke: 1.2pt)
  // catot cong (tấm kim loại)
  bezier((-0.9, 0.95), (-0.9, -0.95), (-1.35, 0.5), (-1.35, -0.5), stroke: 3pt + c-gray)
  lab((-1.0, 1.1), [K], at: "south-east", size: 10pt)
  line((1.0, 0.55), (1.0, -0.55), stroke: 3pt + c-gray)
  lab((1.1, 0.75), [A], at: "south-west", size: 10pt)
  // ánh sáng kích thích
  for dy in (0.6, 0.0, -0.6) {
    line((-3.4, 1.8 + dy * 0.9), (-1.15, dy * 0.7), stroke: 1.6pt + c-purple, mark: (end: ">", fill: c-purple, size: 0.2))
  }
  lab((-3.5, 2.1), text(fill: c-purple)[ánh sáng kích thích], at: "south-east", size: 9.5pt)
  // êlectron
  for (y, dx) in ((0.4, 0.0), (0.0, 0.2), (-0.4, 0.0)) {
    line((-0.7, y), (0.8 + dx - 0.2, y), stroke: 0.8pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.14))
    circle((-0.45, y), radius: 0.06, fill: c-blue, stroke: none)
  }
  lab((0.05, 1.5), text(size: 8.5pt, fill: c-blue)[êlectron quang điện], at: "south", size: 8.5pt)
  // mạch ngoài: K – miliampe kế – nguồn – A
  day((-1.25, -0.8), (-1.25, -3.2), (1.0, -3.2), (1.0, -0.55))
  // vẽ lại chỗ đặt dụng cụ
  sym((-1.25, -1.6), (-1.25, -2.7), "A", lbl: [$mu$A], side: -1)
  sym((-0.4, -3.2), (0.6, -3.2), "pin")
  lab((-0.4, -3.9), [$U_(A K)$], at: "south", size: 9.5pt)
}

// Rutherford: tán xạ hạt α qua lá vàng mỏng
#let rutherford-tn(nhan: true) = {
  import draw: *
  // hộp chì chứa nguồn α có khe thoát
  rect((-1.6, -0.9), (0.2, 0.9), fill: c-gray.lighten(35%), stroke: 1pt)
  rect((0.15, -0.09), (0.25, 0.09), fill: white, stroke: none)
  lab((-0.7, 0), text(size: 9pt)[nguồn α], size: 9pt)
  // chùm hẹp
  line((0.2, 0), (3.2, 0), stroke: 1.1pt + c-red, mark: (end: ">", fill: c-red, size: 0.16))
  // lá vàng
  rect((3.1, -1.9), (3.3, 1.9), fill: rgb("#fde68a"), stroke: 0.8pt)
  for k in range(-3, 4) { circle((3.2, k * 0.5), radius: 0.07, fill: c-amber, stroke: none) }
  lab((3.2, 2.2), text(size: 9pt)[lá vàng], at: "south", size: 9pt)
  // tia đi thẳng, lệch ít, lệch nhiều, bật ngược
  line((3.3, 0.02), (7.4, 0.02), stroke: 1.1pt + c-red, mark: (end: ">", fill: c-red, size: 0.16))
  bezier((3.3, 0.5), (7.2, 2.0), (4.6, 0.55), (6.0, 1.1), stroke: 1.1pt + c-red, mark: (end: ">", fill: c-red, size: 0.16))
  line((0.3, 0.55), (3.1, 0.55), stroke: 0.9pt + c-red)
  bezier((3.1, 0.55), (4.4, -2.4), (3.15, 0.55), (3.9, -1.6), stroke: 1.1pt + c-red, mark: (end: ">", fill: c-red, size: 0.16))
  line((0.3, -0.45), (3.0, -0.45), stroke: 0.9pt + c-red)
  bezier((3.0, -0.45), (1.2, -2.3), (3.7, -0.4), (3.5, -1.4), stroke: 1.1pt + c-red, mark: (end: ">", fill: c-red, size: 0.16))
  // màn huỳnh quang
  arc((3.2, 0), start: -60deg, stop: 60deg, radius: 4.6, anchor: "origin", stroke: 2.2pt + c-green)
  arc((3.2, 0), start: 120deg, stop: 240deg, radius: 4.6, anchor: "origin", stroke: 2.2pt + c-green)
  if nhan {
    lab((8.5, 0), text(size: 9pt)[màn huỳnh quang ZnS], at: "west", size: 9pt)
    lab((7.3, 2.1), text(size: 8.5pt)[lệch nhỏ (đa số)], at: "south-west", size: 8.5pt)
    lab((4.5, -2.5), text(size: 8.5pt)[lệch lớn], at: "west", size: 8.5pt)
    lab((1.1, -2.4), text(size: 8.5pt)[bật ngược (rất ít)], at: "east", size: 8.5pt)
  }
}

// Cầu Wheatstone
#let cau-wheatstone(nhan: true) = {
  import draw: *
  let A = (0, 0)
  let C = (2.6, 1.9)
  let B = (5.2, 0)
  let D = (2.6, -1.9)
  sym(A, C, "R", lbl: [$R_1$], side: -1)
  sym(C, B, "R", lbl: [$R_2$], side: -1)
  sym(A, D, "R", lbl: [$R_3$], side: 1)
  sym(D, B, "R", lbl: [$R_4$], side: 1)
  sym(C, D, "G", len: 1.3)
  nutd(A, B, C, D)
  lab(A, [$A$], at: "east", size: 10pt)
  lab(B, [$B$], at: "west", size: 10pt)
  lab((2.6, 2.05), [$C$], at: "south", size: 10pt)
  lab((2.6, -2.05), [$D$], at: "north", size: 10pt)
  // nguồn và khóa
  day(A, (0, -3.6), (1.7, -3.6))
  sym((1.7, -3.6), (3.5, -3.6), "pin")
  day((3.5, -3.6), (5.2, -3.6), B)
  if nhan { lab((2.6, -4.2), [$E$], at: "north", size: 10pt); lab((6.2, 0), text(size: 9pt)[cân bằng: $R_1/R_3 = R_2/R_4$], at: "west", size: 9pt) }
}

// Máy biến áp: lõi sắt, cuộn sơ cấp N₁, thứ cấp N₂
#let may-bien-ap(n1: [$N_1$], n2: [$N_2$], nhan: true) = {
  import draw: *
  rect((-1.8, -1.7), (1.8, 1.7), fill: c-gray.lighten(70%), stroke: 1.2pt)
  rect((-0.9, -0.9), (0.9, 0.9), fill: white, stroke: 1.2pt)
  for k in range(7) {
    let y = -1.2 + k * 0.4
    circle((-1.35, y), radius: (0.5, 0.09), stroke: 1.1pt + c-blue, fill: none)
    circle((1.35, y), radius: (0.5, 0.09), stroke: 1.1pt + c-red, fill: none)
  }
  day((-1.85, 1.2), (-3.0, 1.2), (-3.0, 0.5)); day((-1.85, -1.2), (-3.0, -1.2), (-3.0, -0.5))
  sym((-3.0, -0.5), (-3.0, 0.5), "ac")
  day((1.85, 1.2), (3.0, 1.2), (3.0, 0.5)); day((1.85, -1.2), (3.0, -1.2), (3.0, -0.5))
  sym((3.0, 0.5), (3.0, -0.5), "R", len: 0.8)
  if nhan {
    lab((-1.35, 1.95), n1, at: "south", size: 11pt)
    lab((1.35, 1.95), n2, at: "south", size: 11pt)
    lab((-3.5, 0), [$U_1$], at: "east", size: 10pt)
    lab((3.35, 0), [$U_2$], at: "west", size: 10pt)
    lab((0, 0), text(size: 8.5pt)[lõi sắt], size: 8.5pt)
  }
}

// Mạch chỉnh lưu kèm đồ thị: "nua" (một điốt) hoặc "cau" (bốn điốt)
#let chinh-luu(kind: "nua", nhan: true) = {
  import draw: *
  sym((0, 0), (0, 2.4), "ac", lbl: [$u$], side: -1)
  if kind == "nua" {
    day((0, 2.4), (1.0, 2.4)); diot((1.0, 2.4), (2.6, 2.4)); day((2.6, 2.4), (4.0, 2.4), (4.0, 1.7))
    sym((4.0, 1.7), (4.0, 0.7), "R", len: 0.8, lbl: [$R$], side: -1)
    day((4.0, 0.7), (4.0, 0), (0, 0))
  } else {
    // cầu bốn điốt: đỉnh trái P, phải Q, trên T, dưới U
    let P = (1.8, 1.2); let Q = (4.2, 1.2); let T = (3.0, 2.4); let Bm = (3.0, 0)
    day((0, 2.4), (0.0, 2.4), (1.8, 2.4), P); day((0, 0), (1.8, 0), P)
    diot(P, T); diot(Bm, Q); diot(Bm, P); diot(Q, T)
    day(T, (3.0, 2.8), (5.4, 2.8), (5.4, 1.9)); sym((5.4, 1.9), (5.4, 0.5), "R", len: 0.8, lbl: [$R$], side: -1); day((5.4, 0.5), (5.4, -0.4), (3.0, -0.4), Bm)
    nutd(P, Q)
  }
  // đồ thị điện áp
  let X0 = if kind == "nua" { 5.4 } else { 7.2 }
  let w = 4.6
  line((X0, 1.2), (X0 + w, 1.2), mark: (end: ">")); line((X0, -0.6), (X0, 2.8), mark: (end: ">"))
  lab((X0 + w, 1.2), [$t$], at: "north-west", size: 9pt); lab((X0, 2.85), [$u_R$], at: "south", size: 9pt)
  let T = 2.0
  let pts = ()
  let pts2 = ()
  for k in range(0, 161) {
    let t = k / 160 * w
    let v = calc.sin(360deg * t / (w / 2))
    pts.push((X0 + t, 1.2 + 1.2 * v))
  }
  line(..pts, stroke: (thickness: 0.8pt, paint: c-gray, dash: "dashed"))
  let pr = ()
  for k in range(0, 161) {
    let t = k / 160 * w
    let v = calc.sin(360deg * t / (w / 2))
    let o = if kind == "nua" { calc.max(v, 0) } else { calc.abs(v) }
    pr.push((X0 + t, 1.2 + 1.2 * o))
  }
  line(..pr, stroke: 1.6pt + c-blue)
  if nhan { lab((X0 + w / 2, -0.9), text(size: 9pt)[nét đứt: $u$ vào; nét liền: $u_R$ ra (#if kind == "nua" [chỉnh lưu nửa chu kì] else [chỉnh lưu hai nửa chu kì])], at: "north", size: 9pt) }
}

// Khung dây quay trong từ trường đều (nhìn từ trên): pháp tuyến n hợp với B góc α
#let khung-tu-truong(ga: 40deg, nhan: true) = {
  import draw: *
  rect((-4.4, -1.2), (-3.2, 1.2), fill: rgb("#fecaca"), stroke: 1pt); lab((-3.8, 0), [N], size: 12pt)
  rect((3.2, -1.2), (4.4, 1.2), fill: rgb("#bfdbfe"), stroke: 1pt); lab((3.8, 0), [S], size: 12pt)
  for y in (-0.9, -0.3, 0.3, 0.9) { line((-3.1, y), (3.1, y), stroke: 0.9pt + c-purple, mark: (end: ">", fill: c-purple, size: 0.16)) }
  lab((0, 1.45), text(fill: c-purple)[$arrow(B)$], at: "south", size: 11pt)
  // khung: đoạn thẳng vuông góc n; trục quay qua O
  let nx = calc.cos(ga)
  let ny = calc.sin(ga)
  line((-1.0 * -ny, -1.0 * nx), (1.0 * -ny, 1.0 * nx), stroke: 3pt + c-amber)
  circle((0, 0), radius: 0.09, fill: ink, stroke: none)
  line((0, 0), (1.6 * nx, 1.6 * ny), stroke: 1.4pt + c-red, mark: (end: ">", fill: c-red, size: 0.2))
  lab((1.7 * nx, 1.7 * ny), text(fill: c-red)[$arrow(n)$], at: "south-west", size: 11pt)
  arc((0, 0), start: 0deg, stop: ga, radius: 0.9, anchor: "origin", stroke: 0.8pt)
  lab((1.15 * calc.cos(ga / 2), 1.15 * calc.sin(ga / 2)), [$alpha$], size: 10pt)
  lab((-0.2, -0.4), text(size: 9pt)[trục quay], at: "north-east", size: 9pt)
  if nhan { lab((0, -1.9), text(size: 9pt)[$Phi = B S cos alpha$], at: "north", size: 10pt) }
}

// Con lắc xoắn: dây treo đàn hồi + đĩa quay góc θ
#let con-lac-xoan(gt: 35deg, nhan: true) = {
  import draw: *
  line((-1.3, 0), (1.3, 0), stroke: 2pt)
  for i in range(7) { line((-1.3 + i * 0.4, 0), (-1.5 + i * 0.4, 0.3), stroke: 0.6pt) }
  line((0, 0), (0, -3.0), stroke: 1pt)
  let ry = 0.42
  circle((0, -3.0), radius: (1.4, ry), fill: c-blue.lighten(75%), stroke: 1.2pt + c-blue)
  line((-1.4, -3.0), (1.4, -3.0), stroke: (thickness: 0.7pt, paint: c-gray, dash: "dashed"))
  line((-1.4 * calc.cos(gt), -3.0 + ry * -calc.sin(gt) * 1.0), (1.4 * calc.cos(gt), -3.0 + ry * calc.sin(gt) * 1.0), stroke: 1.6pt + c-red)
  arc((0, -3.0), start: 180deg, stop: 180deg + 55deg, radius: (1.0, 0.3), anchor: "origin", stroke: 0.8pt, mark: (end: ">", fill: ink, size: 0.14))
  if nhan {
    lab((0.12, -1.4), text(size: 9pt)[dây treo\ (hệ số xoắn $kappa$)], at: "west", size: 9pt)
    lab((1.6, -3.0), [$theta$], at: "west", size: 11pt)
    lab((0, -3.7), text(size: 9pt)[đĩa], at: "north", size: 9pt)
  }
}

// Ống Cu-lít-giơ (ống tia X)
#let ong-culitgio(nhan: true) = {
  import draw: *
  rect((0, 0), (7.2, 3.2), radius: 1.3, fill: glass, stroke: 1.2pt)
  // catot: cuộn dây nóng đỏ trong chén hội tụ
  line((0.9, 2.2), (1.3, 2.2), (1.3, 0.9), (0.9, 0.9), stroke: 1.6pt + c-gray)
  for k in range(4) { arc((1.05, 1.2 + k * 0.28), start: -90deg, stop: 90deg, radius: (0.18, 0.14), anchor: "origin", stroke: 1.6pt + c-red) }
  lab((0.9, 2.45), [K], at: "south", size: 10pt)
  // anot: khối đồng nghiêng 45°
  line((5.4, 2.6), (6.4, 2.6), (6.4, 0.5), (5.4, 0.5), close: true, fill: c-gray.lighten(55%), stroke: 1pt)
  line((5.4, 2.0), (5.4, 1.1), (4.75, 1.55), close: true, fill: c-amber, stroke: 0.8pt)
  line((5.4, 2.6), (5.4, 0.5), stroke: 1pt)
  lab((6.0, 2.8), [A], at: "south", size: 10pt)
  // chùm êlectron
  line((1.5, 1.55), (4.7, 1.55), stroke: 1.4pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
  lab((3.1, 1.7), text(fill: c-blue, size: 9pt)[êlectron], at: "south", size: 9pt)
  // tia X thoát ra
  line((5.0, 1.45), (4.3, -0.8), stroke: 1.5pt + c-purple, mark: (end: ">", fill: c-purple, size: 0.2))
  lab((4.2, -0.85), text(fill: c-purple, size: 9pt)[tia X], at: "north-east", size: 9pt)
  // dây nối: nguồn đốt nóng K ở bên trái; cao áp nối giữa K và A
  day((-1.2, 2.2), (0.9, 2.2)); day((-1.2, 0.9), (0.9, 0.9))
  sym((-1.2, 0.9), (-1.2, 2.2), "pin")
  day((-1.2, 0.9), (-1.2, -1.9), (2.1, -1.9)); day((3.5, -1.9), (5.9, -1.9), (5.9, 0.5))
  sym((2.1, -1.9), (3.5, -1.9), "pin", lbl: [$U$ (cao áp)], side: -1)
  if nhan { lab((-1.45, 1.55), text(size: 9pt)[đốt nóng K], at: "east", size: 9pt) }
}

// Đo g bằng con lắc đơn: giá, dây dài ℓ, thước, đồng hồ bấm giây
#let do-g-con-lac(l: 4.0, nhan: true) = {
  import draw: *
  rect((-2.4, -l - 1.3), (-1.2, -l - 1.1), fill: c-gray.lighten(40%))
  rect((-1.9, -l - 1.1), (-1.7, 1.0), fill: c-gray.lighten(45%))
  line((-1.9, 0.8), (0.4, 0.8), stroke: 2.4pt + c-gray)
  circle((0.4, 0.8), radius: 0.1, fill: ink)
  let b = (0.4 + l * calc.sin(20deg), 0.8 - l * calc.cos(20deg))
  line((0.4, 0.8), (0.4, 0.8 - l - 0.4), stroke: (thickness: 0.7pt, paint: c-gray, dash: "dashed"))
  line((0.4, 0.8), b, stroke: 1pt)
  circle(b, radius: 0.28, fill: c-blue.lighten(55%), stroke: 1pt + c-blue)
  arc((0.4, 0.8), start: -90deg, stop: -90deg + 20deg, radius: 1.2, anchor: "origin", stroke: 0.7pt)
  lab((0.4 + 1.2 * calc.sin(10deg) + 0.05, 0.8 - 1.2 * calc.cos(10deg) + 0.0), [$alpha_0$], at: "north-west", size: 9pt)
  // chiều dài ℓ
  line((-0.5, 0.8), (-0.5, 0.8 - l), mark: (start: ">", end: ">", fill: ink, size: 0.14), stroke: 0.7pt)
  lab((-0.55, 0.8 - l / 2), [$ell$], at: "east", size: 11pt)
  // thước
  rect((-1.65, -l + 0.8 - 0.4), (-1.15, 0.8), fill: rgb("#fef3c7"), stroke: 0.7pt)
  for k in range(0, int(l * 5) + 1, step: 1) { line((-1.15, 0.8 - k * 0.2), (-1.15 - (if calc.rem(k, 5) == 0 { 0.28 } else { 0.14 }), 0.8 - k * 0.2), stroke: 0.4pt) }
  // đồng hồ bấm giây
  circle((4.6, -1.2), radius: 0.9, fill: white, stroke: 1.2pt)
  circle((4.6, -1.2), radius: 0.06, fill: ink)
  line((4.6, -1.2), (5.0, -0.6), stroke: 1pt)
  rect((4.5, -0.2), (4.7, 0.05), fill: c-gray)
  for k in range(12) { line((4.6 + 0.78 * calc.cos(k * 30deg), -1.2 + 0.78 * calc.sin(k * 30deg)), (4.6 + 0.88 * calc.cos(k * 30deg), -1.2 + 0.88 * calc.sin(k * 30deg)), stroke: 0.5pt) }
  if nhan {
    lab((4.6, -2.4), text(size: 9pt)[đồng hồ bấm giây: đo $T$], at: "north", size: 9pt)
    lab((3.0, 1.2), [$g = (4 pi^2 ell) / T^2$], at: "west", size: 11pt)
  }
}

// ───── Đồ thị chất khí: bộ ba đồ thị (p–V, V–T, p–T) của một đẳng quá trình ─────
// qt: "nhiet" (T không đổi), "ap" (p không đổi), "tich" (V không đổi). Mỗi ô: gốc cục bộ, trục dài 2.7×2.5
#let truc-nho(x0, lx, ly, W: 2.7, H: 2.5) = {
  import draw: *
  line((x0, 0), (x0 + W, 0), mark: (end: ">"))
  line((x0, 0), (x0, H), mark: (end: ">"))
  lab((x0 + W, -0.05), lx, at: "north-east", size: 9.5pt)
  lab((x0 - 0.05, H), ly, at: "north-east", size: 9.5pt)
  lab((x0 - 0.05, -0.05), text(size: 8.5pt)[O], at: "north-east")
}
#let chuyen(x0, p1, p2, col: c-blue, dash-origin: false, curve: none, n1: [1], n2: [2]) = {
  import draw: *
  let a = (x0 + p1.at(0), p1.at(1))
  let b = (x0 + p2.at(0), p2.at(1))
  if curve != none {
    let pts = ()
    for k in range(41) { let v = p1.at(0) + (p2.at(0) - p1.at(0)) * k / 40; pts.push((x0 + v, curve(v))) }
    line(..pts, stroke: 1.7pt + col, mark: (end: ">", fill: col, size: 0.18))
  } else {
    line(a, b, stroke: 1.7pt + col, mark: (end: ">", fill: col, size: 0.18))
  }
  if dash-origin { line((x0, 0), a, stroke: (thickness: 0.7pt, paint: c-gray, dash: "dashed")) }
  circle(a, radius: 0.06, fill: c-red, stroke: none); circle(b, radius: 0.06, fill: c-red, stroke: none)
  lab((a.at(0) - 0.08, a.at(1) + 0.05), n1, at: "south-east", size: 9pt)
  lab((b.at(0) + 0.08, b.at(1) + 0.05), n2, at: "south-west", size: 9pt)
  line((x0, a.at(1)), a, stroke: (thickness: 0.5pt, dash: "dotted", paint: c-gray)); line((a.at(0), 0), a, stroke: (thickness: 0.5pt, dash: "dotted", paint: c-gray))
  line((x0, b.at(1)), b, stroke: (thickness: 0.5pt, dash: "dotted", paint: c-gray)); line((b.at(0), 0), b, stroke: (thickness: 0.5pt, dash: "dotted", paint: c-gray))
}
#let ba-do-thi-khi(qt: "nhiet", ten: true) = {
  import draw: *
  let g = 4.0
  truc-nho(0, [$V$], [$p$]); truc-nho(g, [$T$], [$V$]); truc-nho(2 * g, [$T$], [$p$])
  if qt == "nhiet" {
    chuyen(0, (0.8, 2.0), (2.0, 0.8), curve: v => 1.6 / v)
    chuyen(g, (1.4, 0.8), (1.4, 2.0))
    chuyen(2 * g, (1.4, 2.0), (1.4, 0.8))
  } else if qt == "ap" {
    chuyen(0, (0.8, 1.4), (2.0, 1.4))
    chuyen(g, (0.8, 0.8), (2.0, 2.0), dash-origin: true)
    chuyen(2 * g, (0.8, 1.4), (2.0, 1.4))
  } else {
    chuyen(0, (1.4, 0.8), (1.4, 2.0))
    chuyen(g, (0.8, 1.4), (2.1, 1.4))
    chuyen(2 * g, (0.8, 0.8), (2.0, 2.0), dash-origin: true)
  }
  if ten {
    let t = if qt == "nhiet" { [Quá trình đẳng nhiệt ($T$ không đổi)] } else if qt == "ap" { [Quá trình đẳng áp ($p$ không đổi)] } else { [Quá trình đẳng tích ($V$ không đổi)] }
    lab((4.0, -0.7), text(size: 10pt, t), at: "north", size: 10pt)
  }
}

// Đồ thị một quá trình trên một hệ trục. kind ∈ pv-nhiet2 (hai đường đẳng nhiệt), pv-ap, pv-tich, vt-ap, vt-celsius, pt-tich, pt-celsius, vt-nhiet, pt-nhiet
#let do-thi-khi(kind) = {
  import draw: *
  if kind == "pv-nhiet2" {
    truc(5, 4, lx: [$V$], ly: [$p$])
    duong(v => 2.0 / v, 0.55, 4.3, col: c-blue); duong(v => 4.0 / v, 1.05, 4.3, col: c-red)
    lab((4.35, 0.47), text(fill: c-blue)[$T_1$], at: "west", size: 10pt); lab((4.35, 0.95), text(fill: c-red)[$T_2 > T_1$], at: "west", size: 10pt)
  } else if kind == "pv-ap" {
    truc(5, 4, lx: [$V$], ly: [$p$])
    line((0.8, 2), (4, 2), stroke: 1.7pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
    line((0.8, 0), (0.8, 2), stroke: (thickness: 0.5pt, dash: "dotted")); line((4, 0), (4, 2), stroke: (thickness: 0.5pt, dash: "dotted"))
    lab((0.8, -0.1), [$V_1$], at: "north", size: 9.5pt); lab((4, -0.1), [$V_2$], at: "north", size: 9.5pt); lab((-0.1, 2), [$p$], at: "east", size: 9.5pt)
  } else if kind == "pv-tich" {
    truc(5, 4, lx: [$V$], ly: [$p$])
    line((2.4, 0.8), (2.4, 3.2), stroke: 1.7pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
    line((0, 0.8), (2.4, 0.8), stroke: (thickness: 0.5pt, dash: "dotted")); line((0, 3.2), (2.4, 3.2), stroke: (thickness: 0.5pt, dash: "dotted"))
    lab((-0.1, 0.8), [$p_1$], at: "east", size: 9.5pt); lab((-0.1, 3.2), [$p_2$], at: "east", size: 9.5pt); lab((2.4, -0.1), [$V_0$], at: "north", size: 9.5pt)
  } else if kind == "vt-ap" {
    truc(5, 4, lx: [$T$ (K)], ly: [$V$])
    line((0, 0), (4.2, 3.4), stroke: 1.7pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
  } else if kind == "pt-tich" {
    truc(5, 4, lx: [$T$ (K)], ly: [$p$])
    line((0, 0), (4.2, 3.4), stroke: 1.7pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
  } else if kind == "vt-celsius" or kind == "pt-celsius" {
    let ly = if kind == "vt-celsius" { [$V$] } else { [$p$] }
    line((-2.2, 0), (4.8, 0), mark: (end: ">")); line((0, -0.3), (0, 4), mark: (end: ">"))
    lab((4.8, -0.08), [$t$ (°C)], at: "north-east", size: 10pt); lab((-0.05, 4), ly, at: "north-east", size: 10pt)
    line((-2.0, 0), (4.2, 3.4), stroke: 1.7pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
    line((-2.0, 0), (0, 1.1), stroke: (thickness: 0.8pt, paint: c-blue, dash: "dashed"))
    lab((-2.0, -0.1), [$-273$], at: "north", size: 9pt); lab((0.05, 1.1), [$V_0$], at: "west", size: 0pt)
  } else if kind == "vt-nhiet" {
    truc(5, 4, lx: [$T$], ly: [$V$])
    line((2.4, 0.8), (2.4, 3.2), stroke: 1.7pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
  } else if kind == "pt-nhiet" {
    truc(5, 4, lx: [$T$], ly: [$p$])
    line((2.4, 3.2), (2.4, 0.8), stroke: 1.7pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2))
  }
}

// Chu trình trên đồ thị p–V
#let chu-trinh(kind: "hcn", tomau: true) = {
  import draw: *
  truc(6, 4.6, lx: [$V$], ly: [$p$])
  let pt(p, t, an) = { circle(p, radius: 0.07, fill: c-red, stroke: none); lab((p.at(0), p.at(1)), t, at: an, size: 10pt) }
  if kind == "hcn" {
    let a = (1.2, 1.0); let b = (1.2, 3.4); let c = (4.4, 3.4); let d = (4.4, 1.0)
    if tomau { line(a, b, c, d, close: true, fill: c-blue.lighten(88%), stroke: none) }
    line(a, b, mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.7pt + c-blue); line(b, c, mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.7pt + c-blue)
    line(c, d, mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.7pt + c-blue); line(d, a, mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.7pt + c-blue)
    pt(a, [1], "north-east"); pt(b, [2], "south-east"); pt(c, [3], "south-west"); pt(d, [4], "north-west")
    lab((2.8, 2.2), text(size: 9pt)[$A = (p_2 - p_1)$ \ $dot (V_3 - V_1)$], size: 9pt)
  } else if kind == "tamgiac" {
    let a = (1.2, 1.0); let b = (4.4, 1.0); let c = (4.4, 3.6)
    if tomau { line(a, b, c, close: true, fill: c-blue.lighten(88%), stroke: none) }
    line(a, b, mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.7pt + c-blue); line(b, c, mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.7pt + c-blue); line(c, a, mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.7pt + c-blue)
    pt(a, [1], "north-east"); pt(b, [2], "north-west"); pt(c, [3], "south-west")
    lab((3.5, 1.55), text(size: 9pt)[$1 -> 2$ đẳng áp #linebreak() $2 -> 3$ đẳng tích], size: 9pt)
  } else {
    // Cacnô (vẽ minh họa, γ = 2,5): hai đẳng nhiệt p = k/V, hai đoạn nhiệt p = c/V^γ
    let ga = 2.5
    let k1 = 4.0; let k2 = 2.0
    let v1 = 1.0; let v2 = 2.0
    let p1 = k1 / v1; let p2 = k1 / v2
    let c2 = p2 * calc.pow(v2, ga)
    let c1 = p1 * calc.pow(v1, ga)
    let v3 = calc.pow(c2 / k2, 1 / (ga - 1))
    let v4 = calc.pow(c1 / k2, 1 / (ga - 1))
    let P(v, p) = (v * 1.5, p * 0.9)
    let seg(f, va, vb, col) = {
      let pts = range(41).map(i => { let v = va + (vb - va) * i / 40; P(v, f(v)) })
      line(..pts, stroke: 1.7pt + col, mark: (end: ">", fill: col, size: 0.18))
    }
    if tomau {
      let area = range(41).map(i => { let v = v1 + (v2 - v1) * i / 40; P(v, k1 / v) }) + range(41).map(i => { let v = v2 + (v3 - v2) * i / 40; P(v, c2 / calc.pow(v, ga)) }) + range(41).map(i => { let v = v3 + (v4 - v3) * i / 40; P(v, k2 / v) }) + range(41).map(i => { let v = v4 + (v1 - v4) * i / 40; P(v, c1 / calc.pow(v, ga)) })
      line(..area, close: true, fill: c-blue.lighten(90%), stroke: none)
    }
    seg(v => k1 / v, v1, v2, c-red)
    seg(v => c2 / calc.pow(v, ga), v2, v3, c-blue)
    seg(v => k2 / v, v3, v4, c-green)
    seg(v => c1 / calc.pow(v, ga), v4, v1, c-purple)
    pt(P(v1, p1), [1], "south-east"); pt(P(v2, p2), [2], "south-west"); pt(P(v3, k2 / v3), [3], "south-west"); pt(P(v4, k2 / v4), [4], "north-east")
    lab((3.6, 4.4), text(size: 9pt, fill: c-red)[$1 -> 2$: đẳng nhiệt $T_1$], at: "west", size: 9pt)
    lab((3.6, 4.0), text(size: 9pt, fill: c-blue)[$2 -> 3$: đoạn nhiệt], at: "west", size: 9pt)
    lab((3.6, 3.6), text(size: 9pt, fill: c-green)[$3 -> 4$: đẳng nhiệt $T_2$], at: "west", size: 9pt)
    lab((3.6, 3.2), text(size: 9pt, fill: c-purple)[$4 -> 1$: đoạn nhiệt], at: "west", size: 9pt)
  }
}

// Giao thoa sóng nước hai nguồn: các đường cực đại (liền), cực tiểu (đứt)
#let giao-thoa-2-nguon(lam: 0.7, d: 2.0, kmax: 3) = {
  import draw: *
  let c = d / 2
  let L = 4.0
  line((0, -L), (0, L), stroke: 1.2pt + c-red)
  for k in range(1, kmax + 1) {
    let a = k * lam / 2
    if a < c {
      let b = calc.sqrt(c * c - a * a)
      for sg in (-1, 1) {
        let pts = range(-30, 31).map(i => { let t = i / 30 * 1.55; (sg * a * calc.cosh(t), b * calc.sinh(t)) })
        let pts2 = pts.filter(p => calc.abs(p.at(1)) <= L and calc.abs(p.at(0)) <= 5)
        if pts2.len() > 1 { line(..pts2, stroke: 1.2pt + c-red) }
      }
    }
  }
  for k in range(0, kmax) {
    let a = (k + 0.5) * lam / 2
    if a < c {
      let b = calc.sqrt(c * c - a * a)
      for sg in (-1, 1) {
        let pts = range(-30, 31).map(i => { let t = i / 30 * 1.55; (sg * a * calc.cosh(t), b * calc.sinh(t)) })
        let pts2 = pts.filter(p => calc.abs(p.at(1)) <= L and calc.abs(p.at(0)) <= 5)
        if pts2.len() > 1 { line(..pts2, stroke: (thickness: 1pt, paint: c-blue, dash: "dashed")) }
      }
    }
  }
  for sg in (-1, 1) { circle((sg * c, 0), radius: 0.11, fill: ink, stroke: none) }
  lab((-c, -0.2), [$S_1$], at: "north", size: 10pt); lab((c, -0.2), [$S_2$], at: "north", size: 10pt)
  lab((0, L + 0.1), text(size: 9pt, fill: c-red)[cực đại bậc 0], at: "south", size: 9pt)
  lab((5.2, -L), text(size: 8.5pt)[liền: cực đại · đứt: cực tiểu], at: "south-east", size: 8.5pt)
}

// Nhiễu xạ qua khe hẹp: chùm tới, khe a, màn và đồ thị cường độ
#let nhieu-xa-khe-don(nhan: true) = {
  import draw: *
  for y in (-1.2, -0.6, 0.0, 0.6, 1.2) { line((-2.2, y), (-0.1, y), stroke: 0.9pt + c-purple, mark: (end: ">", fill: c-purple, size: 0.15)) }
  rect((-0.1, -3.0), (0.1, -0.35), fill: c-gray.lighten(30%)); rect((-0.1, 0.35), (0.1, 3.0), fill: c-gray.lighten(30%))
  line((-0.5, -0.35), (-0.5, 0.35), mark: (start: ">", end: ">", fill: ink, size: 0.12), stroke: 0.6pt)
  lab((-0.55, 0), [$a$], at: "east", size: 10pt)
  let X = 7.0
  line((X, -3.0), (X, 3.0), stroke: 1.6pt)
  // vân trên màn
  for k in range(-60, 60) {
    let y = k * 0.05
    let u = 3.14159 * y / 1.0
    let inten = if calc.abs(u) < 0.0001 { 1.0 } else { calc.pow(calc.sin(u * 1rad) / u, 2) }
    rect((X - 0.35, y), (X, y + 0.05), fill: rgb(250, 204, 21, int(inten * 255 * 0.95)), stroke: none)
  }
  // đồ thị cường độ I(y)
  let pts = range(-100, 101).map(k => { let y = k * 0.03; let u = 3.14159 * y / 1.0; let it = if calc.abs(u) < 0.0001 { 1.0 } else { calc.pow(calc.sin(u * 1rad) / u, 2) }; (X + 0.5 + 2.6 * it, y) })
  line(..pts, stroke: 1.5pt + c-blue)
  line((X + 0.5, -3.0), (X + 0.5, 3.0), stroke: 0.6pt)
  // tia ứng với cực tiểu thứ nhất
  line((0, 0), (X, 1.0 * 1.0), stroke: (thickness: 0.7pt, paint: c-red, dash: "dashed")); line((0, 0), (X, -1.0), stroke: (thickness: 0.7pt, paint: c-red, dash: "dashed"))
  if nhan {
    lab((X + 0.5 + 2.7, 3.0), [$I$], at: "south", size: 10pt)
    lab((X, -3.15), text(size: 9pt)[màn quan sát], at: "north", size: 9pt)
    lab((X - 0.4, 1.0), text(size: 8.5pt)[cực tiểu thứ nhất: $sin theta = lambda / a$], at: "east", size: 8.5pt)
    lab((X + 3.2, 0.0), text(size: 8.5pt)[cực đại giữa], at: "west", size: 8.5pt)
  }
}

// Cường độ vân giao thoa Young I(x) = I₀ cos²(π x / i)
#let giao-thoa-I(i: 1.0, n: 3) = {
  import draw: *
  let W = (2 * n + 1) * i
  line((-W / 2 - 0.3, 0), (W / 2 + 0.5, 0), mark: (end: ">")); line((0, -0.2), (0, 3.1), mark: (end: ">"))
  lab((W / 2 + 0.5, 0), [$x$], at: "north-east", size: 10pt); lab((0, 3.1), [$I$], at: "south-east", size: 10pt)
  let pts = range(0, 201).map(k => { let x = -W / 2 + W * k / 200; (x, 2.6 * calc.pow(calc.cos(180deg * x / i), 2)) })
  line(..pts, stroke: 1.6pt + c-blue)
  for k in range(-n, n + 1) { line((k * i, -0.07), (k * i, 0.07)); lab((k * i, -0.1), text(size: 8.5pt)[#if k == 0 [$0$] else if k == 1 [$i$] else if k == -1 [$-i$] else [$#k i$]], at: "north", size: 8.5pt) }
  lab((-0.1, 2.6), [$I_(max)$], at: "east", size: 9.5pt)
}

// ═══════════ TOÁN (đợt 2): HÌNH HỌC KHÔNG GIAN ═══════════
// Động cơ chiếu 3D: điểm là (x, y, z) với z hướng lên. kieu "co-dien" = chiếu xiên (mặt trước là hình thật, trục sâu lệch ↗),
// kieu "phoi-canh" = chiếu vuông góc xoay yaw/pitch (dùng khi vẽ mặt cầu để đường tròn khớp đúng).
#let pj(kieu: "co-dien", k: 0.5, al: 40deg, yaw: 25deg, pitch: 22deg) = {
  if kieu == "co-dien" {
    (
      f: p => (p.at(0) + k * calc.cos(al) * p.at(1), p.at(2) + k * calc.sin(al) * p.at(1)),
      v: (k * calc.cos(al), -1, k * calc.sin(al)),
      sy: 1,
    )
  } else {
    (
      f: p => {
        let x1 = p.at(0) * calc.cos(yaw) - p.at(1) * calc.sin(yaw)
        let y1 = p.at(0) * calc.sin(yaw) + p.at(1) * calc.cos(yaw)
        (x1, p.at(2) * calc.cos(pitch) + y1 * calc.sin(pitch))
      },
      v: (-calc.cos(pitch) * calc.sin(yaw), -calc.cos(pitch) * calc.cos(yaw), calc.sin(pitch)),
      sy: calc.sin(pitch),
    )
  }
}
#let sub3(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1), a.at(2) - b.at(2))
#let add3(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1), a.at(2) + b.at(2))
#let mul3(a, t) = (a.at(0) * t, a.at(1) * t, a.at(2) * t)
#let dot3(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1) + a.at(2) * b.at(2)
#let cross3(a, b) = (a.at(1) * b.at(2) - a.at(2) * b.at(1), a.at(2) * b.at(0) - a.at(0) * b.at(2), a.at(0) * b.at(1) - a.at(1) * b.at(0))
#let lerp3(a, b, t) = add3(a, mul3(sub3(b, a), t))
#let len3(a) = calc.sqrt(dot3(a, a))
#let tam3(pts) = { let s = (0, 0, 0); for p in pts { s = add3(s, p) }; mul3(s, 1 / pts.len()) }

// Mặt nhìn thấy? (pháp tuyến hướng ra ngoài so với tâm khối)
#let mat-thay(vs, f, pr, tam) = {
  let a = vs.at(f.at(0))
  let n = cross3(sub3(vs.at(f.at(1)), a), sub3(vs.at(f.at(2)), a))
  let fc = tam3(f.map(i => vs.at(i)))
  if dot3(n, sub3(fc, tam)) < 0 { n = mul3(n, -1) }
  dot3(n, pr.v) > 0.0001
}

// Vẽ khối đa diện lồi: cạnh khuất nét đứt, cạnh thấy nét liền; nm = tên đỉnh (mảng chuỗi hoặc none)
#let da-dien(vs, fs, pr, nm: (), tam: auto, lw: 1.3pt, dut: true, nhan-dist: 0.32, to-mat: none) = {
  import draw: *
  let c = if tam == auto { tam3(vs) } else { tam }
  let vis = fs.map(f => mat-thay(vs, f, pr, c))
  if to-mat != none {
    for (i, f) in fs.enumerate() { if vis.at(i) { line(..f.map(j => (pr.f)(vs.at(j))), close: true, fill: to-mat, stroke: none) } }
  }
  let ed = (:)
  for (i, f) in fs.enumerate() {
    for k in range(f.len()) {
      let a = f.at(k)
      let b = f.at(calc.rem(k + 1, f.len()))
      let key = str(calc.min(a, b)) + "-" + str(calc.max(a, b))
      if key in ed { ed.insert(key, (ed.at(key).at(0) or vis.at(i), a, b)) } else { ed.insert(key, (vis.at(i), a, b)) }
    }
  }
  for (_, e) in ed { if not e.at(0) { line((pr.f)(vs.at(e.at(1))), (pr.f)(vs.at(e.at(2))), stroke: (thickness: 0.8pt, paint: ink, dash: if dut { "dashed" } else { none })) } }
  for (_, e) in ed { if e.at(0) { line((pr.f)(vs.at(e.at(1))), (pr.f)(vs.at(e.at(2))), stroke: lw + ink) } }
  let cp = (pr.f)(c)
  for (i, t) in nm.enumerate() {
    if t != none {
      let p = (pr.f)(vs.at(i))
      let dx = p.at(0) - cp.at(0)
      let dy = p.at(1) - cp.at(1)
      let d = calc.max(0.001, calc.sqrt(dx * dx + dy * dy))
      lab((p.at(0) + dx / d * nhan-dist, p.at(1) + dy / d * nhan-dist), t, size: 11pt)
    }
  }
}
// Điểm phụ: chấm + nhãn; hướng nhãn dir = (dx, dy) trên màn hình
#let diem3(pr, p, t, dir: (0.3, 0.2), col: ink, r: 0.055) = {
  import draw: *
  let q = (pr.f)(p)
  circle(q, radius: r, fill: col, stroke: none)
  if t != none { lab((q.at(0) + dir.at(0), q.at(1) + dir.at(1)), t, size: 10.5pt, col: col) }
}
#let doan3(pr, a, b, col: ink, w: 1pt, dash: none) = {
  import draw: *
  line((pr.f)(a), (pr.f)(b), stroke: (thickness: w, paint: col, dash: dash))
}
// Góc vuông tại điểm q (màn hình) giữa hai hướng đến p1, p2
#let goc-vuong-2d(q, p1, p2, s: 0.22) = {
  import draw: *
  let u(a) = { let dx = a.at(0) - q.at(0); let dy = a.at(1) - q.at(1); let d = calc.sqrt(dx * dx + dy * dy); (dx / d * s, dy / d * s) }
  let a = u(p1)
  let b = u(p2)
  line((q.at(0) + a.at(0), q.at(1) + a.at(1)), (q.at(0) + a.at(0) + b.at(0), q.at(1) + a.at(1) + b.at(1)), (q.at(0) + b.at(0), q.at(1) + b.at(1)), stroke: 0.7pt)
}
// Cung góc tại q giữa hai điểm p1, p2 (màn hình) kèm nhãn
#let cung-goc-2d(q, p1, p2, r: 0.5, t: none, col: c-red) = {
  import draw: *
  let a1 = calc.atan2(p1.at(0) - q.at(0), p1.at(1) - q.at(1))
  let a2 = calc.atan2(p2.at(0) - q.at(0), p2.at(1) - q.at(1))
  let d = a2 - a1
  let dg = d / 1deg
  let a2n = if dg > 180 { a2 - 360deg } else if dg < -180 { a2 + 360deg } else { a2 }
  arc(q, start: a1, stop: a2n, radius: r, anchor: "origin", stroke: 1pt + col)
  if t != none {
    let am = (a1 + a2n) / 2
    lab((q.at(0) + (r + 0.22) * calc.cos(am), q.at(1) + (r + 0.22) * calc.sin(am)), text(fill: col, t), size: 10.5pt)
  }
}

// Đa giác đáy đều n cạnh bán kính ngoại tiếp R, tâm gốc, đỉnh đầu ở góc a0
#let day-deu(n, R, a0: 0deg) = range(n).map(i => (R * calc.cos(a0 + i * 360deg / n), R * calc.sin(a0 + i * 360deg / n), 0))
#let ten-chu(n) = ("A", "B", "C", "D", "E", "F").slice(0, n)

// Chóp đều S.A₁…Aₙ: đường cao SO, trung đoạn SM (M là trung điểm AB)
#let chop-deu(n: 4, a: 3.0, h: 3.4, kieu: "co-dien", yaw: 25deg, pitch: 22deg, cao: true, trung-doan: false, nhan: true) = {
  import draw: *
  let pr = pj(kieu: kieu, yaw: yaw, pitch: pitch)
  let R = a / (2 * calc.sin(180deg / n))
  // đáy: cạnh AB song song trục x ở phía trước
  let base = day-deu(n, R, a0: -90deg - 180deg / n).map(p => p)
  let vs = base + ((0, 0, h),)
  let fs = (range(n),) + range(n).map(i => (i, calc.rem(i + 1, n), n))
  da-dien(vs, fs, pr, nm: if nhan { ten-chu(n) + ("S",) } else { () }, tam: (0, 0, h / 3))
  if cao {
    doan3(pr, (0, 0, 0), (0, 0, h), dash: "dashed", col: c-red)
    diem3(pr, (0, 0, 0), if nhan { [$O$] } else { none }, dir: (0.2, -0.28), col: c-red)
    let q = (pr.f)((0, 0, 0))
    goc-vuong-2d(q, (pr.f)((0, 0, h)), (pr.f)(lerp3(base.at(1), base.at(2), 0.5)), s: 0.16)
  }
  if trung-doan {
    let M = lerp3(base.at(0), base.at(1), 0.5)
    doan3(pr, (0, 0, h), M, col: c-blue, w: 1.2pt)
    if cao { doan3(pr, (0, 0, 0), M, col: c-blue, dash: "dashed") }
    diem3(pr, M, if nhan { [$M$] } else { none }, dir: (0, -0.3), col: c-blue)
  }
}

// Lăng trụ n cạnh (n = 3 hoặc 4…), đứng hoặc xiên (lệch (dx, dy) ở đáy trên)
#let lang-tru(n: 3, a: 2.6, h: 3.0, dx: 0.0, dy: 0.0, kieu: "co-dien", yaw: 25deg, pitch: 22deg, nhan: true, tam-giac-deu: false) = {
  import draw: *
  let pr = pj(kieu: kieu, yaw: yaw, pitch: pitch)
  let base = if n == 4 { ((0, 0, 0), (a, 0, 0), (a, a * 0.8, 0), (0, a * 0.8, 0)) } else { ((0, 0, 0), (a, 0, 0), (a * 0.38, a * 0.7, 0)) }
  let top = base.map(p => (p.at(0) + dx, p.at(1) + dy, h))
  let vs = base + top
  let fs = (range(n), range(n).map(i => i + n)) + range(n).map(i => (i, calc.rem(i + 1, n), calc.rem(i + 1, n) + n, i + n))
  let nm = if n == 4 { ("A", "B", "C", "D", "A′", "B′", "C′", "D′") } else { ("A", "B", "C", "A′", "B′", "C′") }
  da-dien(vs, fs, pr, nm: if nhan { nm } else { () })
}

// Hình lập phương ABCD.A′B′C′D′ với phần phụ: none | "cheo" (AC′) | "cheo-mat" (AC, BD) | "mat-cheo" (ACC′A′)
#let lap-phuong(a: 3.0, kieu: "co-dien", yaw: 25deg, pitch: 22deg, them: "none", nhan: true) = {
  import draw: *
  let pr = pj(kieu: kieu, yaw: yaw, pitch: pitch)
  let vs = ((0, 0, 0), (a, 0, 0), (a, a, 0), (0, a, 0), (0, 0, a), (a, 0, a), (a, a, a), (0, a, a))
  let fs = ((0, 1, 2, 3), (4, 5, 6, 7), (0, 1, 5, 4), (1, 2, 6, 5), (2, 3, 7, 6), (3, 0, 4, 7))
  if them == "mat-cheo" {
    line(..((0, 0, 0), (a, a, 0), (a, a, a), (0, 0, a)).map(p => (pr.f)(p)), close: true, fill: c-red.lighten(82%), stroke: none)
  }
  da-dien(vs, fs, pr, nm: if nhan { ("A", "B", "C", "D", "A′", "B′", "C′", "D′") } else { () })
  if them == "cheo" { doan3(pr, vs.at(0), vs.at(6), col: c-red, w: 1.3pt, dash: "dashed") }
  if them == "cheo-mat" { doan3(pr, vs.at(0), vs.at(2), col: c-red, w: 1.2pt, dash: "dashed"); doan3(pr, vs.at(1), vs.at(3), col: c-red, w: 1.2pt, dash: "dashed") }
  if them == "mat-cheo" { doan3(pr, vs.at(0), vs.at(2), col: c-red, w: 1.2pt, dash: "dashed"); doan3(pr, vs.at(0), vs.at(6), col: c-red, w: 1.2pt, dash: "dashed") }
}

// Thiết diện của hình lập phương bởi mặt phẳng n·p = d (tính giao các cạnh, sắp theo góc quanh tâm)
#let cat-lap-phuong(n, d, a) = {
  let vs = ((0, 0, 0), (a, 0, 0), (a, a, 0), (0, a, 0), (0, 0, a), (a, 0, a), (a, a, a), (0, a, a))
  let es = ((0, 1), (1, 2), (2, 3), (3, 0), (4, 5), (5, 6), (6, 7), (7, 4), (0, 4), (1, 5), (2, 6), (3, 7))
  let pts = ()
  for v in vs { if calc.abs(dot3(n, v) - d) < 0.000001 { pts.push(v) } }
  for (i, j) in es {
    let fa = dot3(n, vs.at(i)) - d
    let fb = dot3(n, vs.at(j)) - d
    if fa * fb < -0.000001 { pts.push(lerp3(vs.at(i), vs.at(j), fa / (fa - fb))) }
  }
  let c = tam3(pts)
  let u0 = if calc.abs(n.at(0)) < 0.9 { (1, 0, 0) } else { (0, 1, 0) }
  let u = cross3(n, u0)
  let w = cross3(n, u)
  pts.sorted(key: p => calc.atan2(dot3(sub3(p, c), u), dot3(sub3(p, c), w)))
}
#let thiet-dien-lp(kind: "luc-giac", a: 3.0, kieu: "co-dien", yaw: 25deg, pitch: 22deg, nhan: true) = {
  import draw: *
  let pr = pj(kieu: kieu, yaw: yaw, pitch: pitch)
  let vs = ((0, 0, 0), (a, 0, 0), (a, a, 0), (0, a, 0), (0, 0, a), (a, 0, a), (a, a, a), (0, a, a))
  let fs = ((0, 1, 2, 3), (4, 5, 6, 7), (0, 1, 5, 4), (1, 2, 6, 5), (2, 3, 7, 6), (3, 0, 4, 7))
  let nm = ("A", "B", "C", "D", "A′", "B′", "C′", "D′")
  let (n, d) = if kind == "luc-giac" { ((-1, -1, 1), -a / 2) } else if kind == "tam-giac" { ((-1, -1, 1), 0) } else if kind == "chu-nhat" { ((1, -1, 0), 0) } else { ((-1, -2, 1), -a / 2) }
  let ps = cat-lap-phuong(n, d, a)
  let c = tam3(vs)
  let vis = fs.map(f => mat-thay(vs, f, pr, c))
  let fpl(p, i) = if i == 0 { calc.abs(p.at(2)) < 0.00001 } else if i == 1 { calc.abs(p.at(2) - a) < 0.00001 } else if i == 2 { calc.abs(p.at(1)) < 0.00001 } else if i == 3 { calc.abs(p.at(0) - a) < 0.00001 } else if i == 4 { calc.abs(p.at(1) - a) < 0.00001 } else { calc.abs(p.at(0)) < 0.00001 }
  line(..ps.map(p => (pr.f)(p)), close: true, fill: c-red.lighten(78%), stroke: none)
  da-dien(vs, fs, pr, nm: if nhan { nm } else { () }, tam: c)
  for i in range(ps.len()) {
    let p = ps.at(i)
    let q = ps.at(calc.rem(i + 1, ps.len()))
    let fi = range(6).filter(k => fpl(p, k) and fpl(q, k))
    let hid = fi.len() > 0 and fi.all(k => not vis.at(k))
    line((pr.f)(p), (pr.f)(q), stroke: (thickness: 1.8pt, paint: c-red, dash: if hid { "dashed" } else { none }))
  }
  if nhan {
    let letters = ("M", "N", "P", "Q", "R", "S")
    let cnt = 0
    for p in ps {
      let idx = range(8).filter(k => len3(sub3(vs.at(k), p)) < 0.00001)
      if idx.len() == 0 { diem3(pr, p, [$#letters.at(cnt)$], dir: (0.26, 0.18), col: c-red); cnt += 1 } else { diem3(pr, p, none, col: c-red) }
    }
  }
}

// Chóp S.ABCD (đáy chữ nhật) với thiết diện: "song-song" (song song đáy tại tỉ số t), "qua-sac" (mp SAC), "ba-diem" (qua M∈SA, N∈SB, P∈SC)
#let thiet-dien-chop(kind: "song-song", t: 0.5, a: 3.2, b: 2.2, h: 3.3, kieu: "co-dien", yaw: 25deg, pitch: 22deg, nhan: true) = {
  import draw: *
  let pr = pj(kieu: kieu, yaw: yaw, pitch: pitch)
  let vs = ((0, 0, 0), (a, 0, 0), (a, b, 0), (0, b, 0), (a * 0.45, b * 0.5, h))
  let fs = ((0, 1, 2, 3), (0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4))
  let S = vs.at(4)
  let sec = if kind == "song-song" {
    range(4).map(i => lerp3(S, vs.at(i), t))
  } else if kind == "qua-sac" {
    (S, vs.at(0), vs.at(2))
  } else {
    let M = lerp3(S, vs.at(0), t)
    let N = lerp3(S, vs.at(1), t * 0.8)
    let P = lerp3(S, vs.at(2), t * 1.1)
    let n = cross3(sub3(N, M), sub3(P, M))
    let d = sub3(vs.at(3), S)
    let tt = dot3(n, sub3(M, S)) / dot3(n, d)
    (M, N, P, add3(S, mul3(d, tt)))
  }
  line(..sec.map(p => (pr.f)(p)), close: true, fill: c-red.lighten(78%), stroke: none)
  da-dien(vs, fs, pr, nm: if nhan { ("A", "B", "C", "D", "S") } else { () }, tam: (a / 2, b / 2, h / 3))
  for i in range(sec.len()) { line((pr.f)(sec.at(i)), (pr.f)(sec.at(calc.rem(i + 1, sec.len()))), stroke: 1.8pt + c-red) }
  if nhan and kind != "qua-sac" {
    let names = if kind == "song-song" { ("M", "N", "P", "Q") } else { ("M", "N", "P", "Q") }
    for (i, p) in sec.enumerate() { diem3(pr, p, [$#names.at(i)$], dir: (0.3, 0.12), col: c-red) }
  }
}

// Góc giữa đường thẳng và mặt phẳng (chóp S.ABCD, SA ⊥ đáy): góc SCA; hoặc góc giữa mặt bên và đáy (chóp đều): góc SMO
#let chop-goc(kind: "duong-mat", a: 3.0, h: 3.2, kieu: "co-dien", yaw: 25deg, pitch: 22deg, nhan: true) = {
  import draw: *
  let pr = pj(kieu: kieu, yaw: yaw, pitch: pitch)
  if kind == "duong-mat" {
    let b = a * 0.7
    let vs = ((0, 0, 0), (a, 0, 0), (a, b, 0), (0, b, 0), (0, 0, h))
    let fs = ((0, 1, 2, 3), (0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4))
    da-dien(vs, fs, pr, nm: if nhan { ("A", "B", "C", "D", "S") } else { () }, tam: (a / 2, b / 2, h / 3))
    doan3(pr, vs.at(0), vs.at(2), col: c-red, w: 1.3pt, dash: "dashed")
    doan3(pr, vs.at(2), vs.at(4), col: c-red, w: 1.6pt)
    let qC = (pr.f)(vs.at(2))
    cung-goc-2d(qC, (pr.f)(vs.at(4)), (pr.f)(vs.at(0)), r: 0.65, t: [$phi$])
    goc-vuong-2d((pr.f)(vs.at(0)), (pr.f)(vs.at(4)), (pr.f)(vs.at(2)), s: 0.2)
    if nhan { lab((a * 0.9, -0.7), text(size: 9pt)[$S A perp (A B C D)$: góc giữa $S C$ và đáy là $angle S C A$], at: "north-west", size: 9pt) }
  } else {
    let R = a / calc.sqrt(2)
    let base = day-deu(4, R, a0: -135deg)
    let vs = base + ((0, 0, h),)
    let fs = ((0, 1, 2, 3), (0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4))
    da-dien(vs, fs, pr, nm: if nhan { ("A", "B", "C", "D", "S") } else { () }, tam: (0, 0, h / 3))
    let M = lerp3(base.at(1), base.at(2), 0.5)
    let O = (0, 0, 0)
    let S = (0, 0, h)
    doan3(pr, S, M, col: c-red, w: 1.6pt)
    doan3(pr, O, M, col: c-red, w: 1.3pt, dash: "dashed")
    doan3(pr, S, O, col: c-gray, w: 1pt, dash: "dashed")
    diem3(pr, M, [$M$], dir: (0.3, -0.12), col: c-red)
    diem3(pr, O, [$O$], dir: (-0.05, -0.3), col: c-gray)
    cung-goc-2d((pr.f)(M), (pr.f)(S), (pr.f)(O), r: 0.6, t: [$phi$])
    goc-vuong-2d((pr.f)(O), (pr.f)(S), (pr.f)(M), s: 0.18)
    if nhan { lab((a * 0.75, -R * 0.7 - 0.7), text(size: 9pt)[góc giữa $(S B C)$ và đáy là $angle S M O$ ($M$ là trung điểm $B C$)], at: "north", size: 9pt) }
  }
}

// Khoảng cách từ A tới (SBC), chóp S.ABCD đáy chữ nhật, SA ⊥ đáy: AH ⊥ SB
#let kc-diem-mp(a: 3.0, b: 2.2, h: 3.3, kieu: "co-dien", yaw: 25deg, pitch: 22deg, nhan: true) = {
  import draw: *
  let pr = pj(kieu: kieu, yaw: yaw, pitch: pitch)
  let vs = ((0, 0, 0), (a, 0, 0), (a, b, 0), (0, b, 0), (0, 0, h))
  let fs = ((0, 1, 2, 3), (0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4))
  line(..(vs.at(4), vs.at(1), vs.at(2)).map(p => (pr.f)(p)), close: true, fill: c-blue.lighten(85%), stroke: none)
  da-dien(vs, fs, pr, nm: if nhan { ("A", "B", "C", "D", "S") } else { () }, tam: (a / 2, b / 2, h / 3))
  let A = vs.at(0)
  let B = vs.at(1)
  let S = vs.at(4)
  let sb = sub3(S, B)
  let tt = dot3(sub3(A, B), sb) / dot3(sb, sb)
  let H = add3(B, mul3(sb, tt))
  doan3(pr, A, H, col: c-red, w: 1.7pt)
  diem3(pr, H, [$H$], dir: (0.28, 0.12), col: c-red)
  goc-vuong-2d((pr.f)(H), (pr.f)(A), (pr.f)(S), s: 0.18)
  if nhan { lab((a * 0.8, -0.7), text(size: 9pt)[$d(A, (S B C)) = A H$ với $A H perp S B$], at: "north", size: 9pt) }
}

// Khoảng cách giữa hai đường thẳng chéo nhau: đoạn vuông góc chung MN trong hai mặt phẳng song song
#let kc-hai-dt-cheo(nhan: true) = {
  import draw: *
  // hai mặt phẳng song song (hình bình hành)
  line((0, 0), (5.2, 0), (6.2, 1.1), (1.0, 1.1), close: true, fill: c-blue.lighten(90%), stroke: 1pt + c-blue)
  line((0, 2.6), (5.2, 2.6), (6.2, 3.7), (1.0, 3.7), close: true, fill: c-green.lighten(90%), stroke: 1pt + c-green)
  lab((0.0, 0.1), [$(alpha)$], at: "south-east", size: 10.5pt); lab((0.0, 2.7), [$(beta)$], at: "south-east", size: 10.5pt)
  line((0.8, 0.2), (5.3, 0.9), stroke: 1.6pt + c-blue)
  lab((0.8, 0.2), [$a$], at: "north-east", size: 10.5pt)
  line((2.2, 3.6), (4.4, 2.7), stroke: 1.6pt + c-green)
  lab((4.4, 2.7), [$b$], at: "south-west", size: 10.5pt)
  // đoạn vuông góc chung
  let M = (3.3, 0.55)
  line(M, (3.3, 3.15), stroke: 1.6pt + c-red)
  circle(M, radius: 0.06, fill: c-red, stroke: none); circle((3.3, 3.15), radius: 0.06, fill: c-red, stroke: none)
  lab(M, [$M$], at: "north-west", size: 10.5pt); lab((3.3, 3.15), [$N$], at: "south-east", size: 10.5pt)
  goc-vuong-2d(M, (3.3, 3.15), (4.0, 0.65), s: 0.2); goc-vuong-2d((3.3, 3.15), M, (3.9, 3.0), s: 0.2)
  if nhan { lab((6.4, 1.8), text(size: 9pt)[$d(a, b) = M N$ ($M N perp a$, $M N perp b$)], at: "west", size: 9pt) }
}

// Mặt cầu và khối nội/ngoại tiếp: cube-ngoai, cube-noi, chop-ngoai, chop-noi
#let mat-cau-3d(kind: "cube-ngoai", a: 2.8, h: 3.0, yaw: 28deg, pitch: 22deg, nhan: true) = {
  import draw: *
  let pr = pj(kieu: "phoi-canh", yaw: yaw, pitch: pitch)
  let cx = 0
  let C = (a / 2, a / 2, a / 2)
  let R = 0
  let draw-sphere(ctr, rr) = {
    let q = (pr.f)(ctr)
    circle(q, radius: rr, fill: rgb(147, 197, 253, 18%), stroke: 1.3pt + c-blue)
    let ey = rr * calc.sin(pitch)
    arc(q, start: 0deg, stop: 180deg, radius: (rr, ey), anchor: "origin", stroke: (thickness: 0.8pt, paint: c-blue, dash: "dashed"))
    arc(q, start: 180deg, stop: 360deg, radius: (rr, ey), anchor: "origin", stroke: 0.9pt + c-blue)
  }
  if kind == "cube-ngoai" or kind == "cube-noi" {
    let vs = ((0, 0, 0), (a, 0, 0), (a, a, 0), (0, a, 0), (0, 0, a), (a, 0, a), (a, a, a), (0, a, a))
    let fs = ((0, 1, 2, 3), (0, 1, 5, 4), (1, 2, 6, 5), (2, 3, 7, 6), (3, 0, 4, 7), (4, 5, 6, 7))
    let rr = if kind == "cube-ngoai" { a * calc.sqrt(3) / 2 } else { a / 2 }
    draw-sphere(C, rr)
    da-dien(vs, fs, pr, nm: if nhan { ("A", "B", "C", "D", "A′", "B′", "C′", "D′") } else { () }, tam: C, lw: 1.2pt)
    diem3(pr, C, if nhan { [$O$] } else { none }, dir: (0.2, -0.22), col: c-red)
    if kind == "cube-ngoai" { doan3(pr, vs.at(0), vs.at(6), col: c-red, w: 1.1pt, dash: "dashed"); if nhan { lab((a * 1.0, -1.6), text(size: 9pt)[$R = (a sqrt(3)) / 2$ (tâm $O$ là trung điểm $A C'$)], at: "north", size: 9pt) } } else { if nhan { lab((a * 1.0, -1.6), text(size: 9pt)[$r = a / 2$ (tiếp xúc 6 mặt)], at: "north", size: 9pt) } }
  } else {
    let n = 4
    let Rb = a / calc.sqrt(2)
    let base = day-deu(n, Rb, a0: -135deg)
    let vs = base + ((0, 0, h),)
    let fs = ((0, 1, 2, 3), (0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4))
    let ctr = if kind == "chop-ngoai" { (0, 0, (h * h - Rb * Rb) / (2 * h)) } else { (0, 0, a * h / (a + calc.sqrt(a * a + 4 * h * h))) }
    let rr = if kind == "chop-ngoai" { h - (h * h - Rb * Rb) / (2 * h) } else { a * h / (a + calc.sqrt(a * a + 4 * h * h)) }
    draw-sphere(ctr, calc.abs(rr))
    da-dien(vs, fs, pr, nm: if nhan { ("A", "B", "C", "D", "S") } else { () }, tam: (0, 0, h / 3), lw: 1.2pt)
    diem3(pr, ctr, if nhan { [$I$] } else { none }, dir: (0.22, -0.2), col: c-red)
    doan3(pr, (0, 0, 0), (0, 0, h), col: c-gray, w: 0.8pt, dash: "dashed")
    if nhan { lab((0, -Rb - 1.4), text(size: 9pt)[#if kind == "chop-ngoai" [mặt cầu ngoại tiếp chóp đều: tâm $I in S O$, $I S = I A = R$] else [mặt cầu nội tiếp chóp đều: tâm $I in S O$, $d(I, "đáy") = d(I, "mặt bên") = r$]], at: "north", size: 9pt) }
  }
}

// ═══════════ TOÁN (đợt 2): CONIC, ĐỒ THỊ HÀM SỐ ═══════════
// Trục Oxy trống có mũi tên, gốc O
#let oxy(x1, x2, y1, y2, o: true) = {
  import draw: *
  line((x1, 0), (x2, 0), mark: (end: ">"))
  line((0, y1), (0, y2), mark: (end: ">"))
  lab((x2, -0.05), text(style: "italic")[x], at: "north-east", size: 10pt)
  lab((-0.05, y2), text(style: "italic")[y], at: "north-east", size: 10pt)
  if o { lab((-0.05, -0.05), [$O$], at: "north-east", size: 9.5pt) }
}
#let cham(p, t, an: "south-west", col: ink, r: 0.06, size: 10pt) = {
  import draw: *
  circle(p, radius: r, fill: col, stroke: none)
  if t != none { lab(p, t, at: an, size: size, col: col) }
}
#let net-dut(a, b, col: c-gray, w: 0.8pt) = { import draw: *; line(a, b, stroke: (thickness: w, paint: col, dash: "dashed")) }

// Elip (E): x²/a² + y²/b² = 1, tiêu điểm F₁, F₂, điểm M(t), đường chuẩn
#let elip-tn(a: 3.0, b: 2.0, t: 50deg, chuan: false, nhan: true) = {
  import draw: *
  let c = calc.sqrt(a * a - b * b)
  oxy(-a - 0.9, a + 0.9, -b - 0.7, b + 0.7)
  circle((0, 0), radius: (a, b), stroke: 1.7pt + c-blue)
  for (p, tx, an) in (((-a, 0), [$A_1$], "south-east"), ((a, 0), [$A_2$], "south-west"), ((0, -b), [$B_1$], "south-west"), ((0, b), [$B_2$], "south-west")) { cham(p, if nhan { tx } else { none }, an: an, size: 10pt) }
  let F1 = (-c, 0)
  let F2 = (c, 0)
  cham(F1, if nhan { [$F_1$] } else { none }, an: "north", col: c-red); cham(F2, if nhan { [$F_2$] } else { none }, an: "north", col: c-red)
  let M = (a * calc.cos(t), b * calc.sin(t))
  cham(M, [$M$], an: "south-west", col: c-purple)
  line(F1, M, stroke: 1pt + c-purple); line(F2, M, stroke: 1pt + c-purple)
  if chuan and c > 0.05 {
    let xd = a * a / c
    for s in (-1, 1) { net-dut((s * xd, -b - 0.5), (s * xd, b + 0.5), col: c-green); lab((s * xd, b + 0.55), if s < 0 { [$Delta_1$] } else { [$Delta_2$] }, at: "south", size: 9.5pt, col: c-green) }
  }
  if nhan { lab((0, -b - 0.95), text(size: 9pt)[$M F_1 + M F_2 = 2a$, $c^2 = a^2 - b^2$, $e = c / a$], at: "north", size: 9pt) }
}

// Hypebol (H): x²/a² − y²/b² = 1
#let hypebol-tn(a: 1.8, b: 1.3, t: 0.9, tiem-can: true, chuan: false, nhan: true) = {
  import draw: *
  let c = calc.sqrt(a * a + b * b)
  let L = 3.6
  oxy(-L - 0.6, L + 0.6, -3.2, 3.2)
  if tiem-can {
    let k = b / a
    net-dut((-L, -k * L), (L, k * L), col: c-gray); net-dut((-L, k * L), (L, -k * L), col: c-gray)
    rect((-a, -b), (a, b), stroke: (thickness: 0.6pt, paint: c-gray, dash: "dotted"))
  }
  for sg in (-1, 1) {
    let pts = range(-60, 61).map(i => { let u = i / 60 * 1.7; (sg * a * calc.cosh(u), b * calc.sinh(u)) }).filter(p => calc.abs(p.at(1)) <= 3.0 and calc.abs(p.at(0)) <= L)
    line(..pts, stroke: 1.7pt + c-blue)
  }
  cham((-a, 0), if nhan { [$A_1$] } else { none }, an: "south-east"); cham((a, 0), if nhan { [$A_2$] } else { none }, an: "south-west")
  cham((-c, 0), if nhan { [$F_1$] } else { none }, an: "north", col: c-red); cham((c, 0), if nhan { [$F_2$] } else { none }, an: "north", col: c-red)
  let M = (a * calc.cosh(t), b * calc.sinh(t))
  cham(M, [$M$], an: "south-east", col: c-purple)
  line((-c, 0), M, stroke: 1pt + c-purple); line((c, 0), M, stroke: 1pt + c-purple)
  if chuan {
    let xd = a * a / c
    for s in (-1, 1) { net-dut((s * xd, -3.0), (s * xd, 3.0), col: c-green); lab((s * xd, 3.05), if s < 0 { [$Delta_1$] } else { [$Delta_2$] }, at: "south", size: 9.5pt, col: c-green) }
  }
  if nhan { lab((0, -3.35), text(size: 9pt)[$|M F_1 - M F_2| = 2a$, $c^2 = a^2 + b^2$, tiệm cận $y = plus.minus b / a x$], at: "north", size: 9pt) }
}

// Parabol y² = 2px (huong "phai") hoặc x² = 2py (huong "len"): tiêu điểm F, đường chuẩn Δ, điểm M, MF = MH
#let parabol-tn(p: 1.0, x0: 2.0, huong: "phai", nhan: true) = {
  import draw: *
  let s(q) = if huong == "len" { (q.at(1), q.at(0)) } else { q }
  let Y = 3.2
  let y0 = calc.sqrt(2 * p * x0)
  if huong == "len" { oxy(-3.8, 3.8, -p / 2 - 0.9, 4.0) } else { oxy(-p / 2 - 0.9, 4.0, -3.8, 3.8) }
  line(..range(-40, 41).map(i => { let y = i / 40 * Y; s((y * y / (2 * p), y)) }), stroke: 1.7pt + c-blue)
  net-dut(s((-p / 2, -Y)), s((-p / 2, Y)), col: c-green, w: 1pt)
  let an-f = if huong == "len" { "south-west" } else { "north-east" }
  cham(s((p / 2, 0)), if nhan { [$F$] } else { none }, an: if huong == "len" { "south-west" } else { "south-east" }, col: c-red)
  let M = s((x0, y0))
  let H = s((-p / 2, y0))
  cham(M, [$M$], an: if huong == "len" { "south-east" } else { "south-west" }, col: c-purple)
  cham(H, [$H$], an: if huong == "len" { "north-east" } else { "south-east" }, col: c-purple)
  line(s((p / 2, 0)), M, stroke: 1pt + c-purple); line(M, H, stroke: 1pt + c-purple)
  if nhan {
    lab(s((-p / 2, if huong == "len" { -Y } else { Y })), [$Delta$], at: if huong == "len" { "north-west" } else { "south-east" }, size: 10pt, col: c-green)
    if huong == "len" { lab((0, -p / 2 - 0.95), text(size: 9pt)[$x^2 = 2 p y$, $F(0; p/2)$, $Delta: y = -p/2$, $M F = M H$], at: "north", size: 9pt) } else { lab((1.5, -3.95), text(size: 9pt)[$y^2 = 2 p x$, $F(p/2; 0)$, $Delta: x = -p/2$, $M F = M H$], at: "north", size: 9pt) }
  }
}

// Đồ thị hàm số có tiệm cận và điểm đặc biệt. f là biểu thức theo x (chuỗi, cú pháp CeTZ/Typst code).
// tcd: hoành độ tiệm cận đứng; tcn: tung độ tiệm cận ngang (mảng); tcx: ((m, n), …) tiệm cận xiên y = m x + n
// diem: ((x, y, nhãn), …) – điểm đặc biệt, kẻ nét đứt xuống hai trục
#let do-thi-dac-biet(f, x1: -4, x2: 4, y1: -4, y2: 4, ux: 1, uy: 1, tcd: (), tcn: (), tcx: (), diem: (), luoi: true, nhan-tc: true) = {
  import draw: *
  do-thi(f, x1: x1, x2: x2, y1: y1, y2: y2, ux: ux, uy: uy, luoi: luoi, nhan: true)
  for a in tcd {
    net-dut((a * ux, y1 * uy), (a * ux, y2 * uy), col: c-red)
    if nhan-tc { lab((a * ux, y2 * uy + 0.05), text(fill: c-red)[$x = #a$], at: "south-west", size: 9pt) }
  }
  for b in tcn {
    net-dut((x1 * ux, b * uy), (x2 * ux, b * uy), col: c-red)
    if nhan-tc { lab((x2 * ux, b * uy), text(fill: c-red)[$y = #b$], at: "south-east", size: 9pt) }
  }
  for (m, n) in tcx {
    net-dut((x1 * ux, (m * x1 + n) * uy), (x2 * ux, (m * x2 + n) * uy), col: c-red)
  }
  for (px, py, nh) in diem {
    net-dut((px * ux, 0), (px * ux, py * uy), col: c-gray, w: 0.6pt); net-dut((0, py * uy), (px * ux, py * uy), col: c-gray, w: 0.6pt)
    cham((px * ux, py * uy), if nh == "" { none } else { text(fill: c-purple)[#nh] }, an: "south-west", col: c-purple, size: 9.5pt)
  }
}

// ═══════════ TOÁN (đợt 2): XÁC SUẤT & THỐNG KÊ ═══════════
// Nhãn toán từ chuỗi: m("overline(A)") → $overline(A)$
#let toan(s) = if s == none or s == "" { none } else { eval(s, mode: "math") }

// Cây xác suất hai mức. l1/p1: nhãn và xác suất nhánh gốc; l2: nhãn nhánh mức 2; p2: xác suất (mảng theo từng nút mức 1); kq: xác suất kết quả (mảng phẳng, hoặc none)
#let cay-xs(l1, p1, l2, p2, kq: none, tieu-de: none) = {
  import draw: *
  let n1 = l1.len()
  let n2 = l2.len()
  let dy = 1.1
  let total = n1 * n2
  let x1 = 3.6
  let x2 = 7.6
  let y-of(i, j) = ((total - 1) / 2 - (i * n2 + j)) * dy
  let nhanh(a, b, t) = {
    let tm = 0.52
    let mx = a.at(0) + (b.at(0) - a.at(0)) * tm
    let my = a.at(1) + (b.at(1) - a.at(1)) * tm
    let up = b.at(1) >= a.at(1)
    lab((mx, my + if up { 0.22 } else { -0.22 }), text(size: 10pt, toan(t)), size: 10pt)
  }
  circle((0, 0), radius: 0.08, fill: ink, stroke: none)
  for i in range(n1) {
    let yi = ((total - 1) / 2 - (i * n2 + (n2 - 1) / 2)) * dy
    let p = (x1, yi)
    line((0, 0), p, stroke: 1.2pt + c-blue)
    circle(p, radius: 0.08, fill: c-blue, stroke: none)
    nhanh((0, 0), p, p1.at(i))
    lab((x1 + 0.1, yi + 0.0), text(size: 11pt, weight: "bold", toan(l1.at(i))), at: "south-east", size: 11pt)
    for j in range(n2) {
      let q = (x2, y-of(i, j))
      line(p, q, stroke: 1.2pt + c-green)
      circle(q, radius: 0.08, fill: c-green, stroke: none)
      nhanh(p, q, p2.at(i).at(j))
      lab((x2 + 0.2, y-of(i, j)), [#text(weight: "bold", toan(l1.at(i)))#text(weight: "bold", toan(l2.at(j)))#if kq != none [ : #toan(kq.at(i * n2 + j))]], at: "west", size: 10.5pt)
    }
  }
  if tieu-de != none { lab((x1, ((total - 1) / 2) * dy + 0.7), tieu-de, at: "south", size: 10pt) }
}

// Biểu đồ tần số ghép nhóm (histogram): edges = các biên lớp (n+1), freq = tần số (n)
#let histogram(edges, freq, W: 7.0, H: 4.0, da-giac: false, nhan: true, col: c-blue) = {
  import draw: *
  let n = freq.len()
  let fmax = calc.max(..freq)
  let ymax = calc.ceil(fmax * 1.15)
  let x0 = edges.at(0)
  let x1 = edges.at(n)
  let sx(v) = (v - x0) / (x1 - x0) * W
  let sy(v) = v / ymax * H
  line((0, 0), (W + 0.4, 0), mark: (end: ">")); line((0, 0), (0, H + 0.4), mark: (end: ">"))
  let st = if ymax <= 12 { 1 } else if ymax <= 30 { 2 } else if ymax <= 60 { 5 } else { 10 }
  for v in range(0, int(ymax) + 1, step: st) { line((-0.07, sy(v)), (0, sy(v)), stroke: 0.6pt); lab((-0.1, sy(v)), text(size: 8.5pt)[#v], at: "east", size: 8.5pt); if v > 0 { line((0, sy(v)), (W, sy(v)), stroke: 0.3pt + rgb("#e2e8f0")) } }
  for i in range(n) {
    rect((sx(edges.at(i)), 0), (sx(edges.at(i + 1)), sy(freq.at(i))), fill: col.lighten(55%), stroke: 1pt + col)
    if nhan { lab(((sx(edges.at(i)) + sx(edges.at(i + 1))) / 2, sy(freq.at(i)) + 0.05), text(size: 9pt)[#freq.at(i)], at: "south", size: 9pt) }
  }
  for i in range(n + 1) { line((sx(edges.at(i)), 0), (sx(edges.at(i)), -0.07), stroke: 0.6pt); lab((sx(edges.at(i)), -0.1), text(size: 8.5pt)[#edges.at(i)], at: "north", size: 8.5pt) }
  if da-giac {
    let pts = ((sx(edges.at(0)) - (sx(edges.at(1)) - sx(edges.at(0))) / 2, 0),) + range(n).map(i => ((sx(edges.at(i)) + sx(edges.at(i + 1))) / 2, sy(freq.at(i)))) + ((sx(edges.at(n)) + (sx(edges.at(n)) - sx(edges.at(n - 1))) / 2, 0),)
    line(..pts, stroke: 1.6pt + c-red)
    for p in pts.slice(1, pts.len() - 1) { circle(p, radius: 0.06, fill: c-red, stroke: none) }
  }
}

// Biểu đồ hộp: rows = ((nhãn, min, Q1, trung vị, Q3, max), …), trục từ t0 đến t1
#let hop-boxplot(rows, t0, t1, W: 8.0, buoc: 1, nhan: true) = {
  import draw: *
  let sx(v) = (v - t0) / (t1 - t0) * W
  let n = rows.len()
  let gap = 1.3
  let yb = -0.6
  line((0, yb), (W + 0.3, yb), mark: (end: ">"))
  for v in range(calc.ceil(t0), calc.floor(t1) + 1, step: buoc) { line((sx(v), yb), (sx(v), yb - 0.08), stroke: 0.6pt); lab((sx(v), yb - 0.1), text(size: 8.5pt)[#v], at: "north", size: 8.5pt) }
  for (i, r) in rows.enumerate() {
    let y = (n - 1 - i) * gap + 0.5
    let (nh, mn, q1, md, q3, mx) = r
    line((sx(mn), y), (sx(q1), y), stroke: 1.3pt); line((sx(q3), y), (sx(mx), y), stroke: 1.3pt)
    line((sx(mn), y - 0.2), (sx(mn), y + 0.2), stroke: 1.3pt); line((sx(mx), y - 0.2), (sx(mx), y + 0.2), stroke: 1.3pt)
    rect((sx(q1), y - 0.35), (sx(q3), y + 0.35), fill: c-blue.lighten(75%), stroke: 1.3pt + c-blue)
    line((sx(md), y - 0.35), (sx(md), y + 0.35), stroke: 2pt + c-red)
    if nh != "" { lab((-0.15, y), nh, at: "east", size: 10pt) }
    if nhan {
      for (v, t) in ((mn, [$min$]), (q1, [$Q_1$]), (md, [$Q_2$]), (q3, [$Q_3$]), (mx, [$max$])) { lab((sx(v), y + 0.45), text(size: 8.5pt, t), at: "south", size: 8.5pt) }
    }
  }
}

// Phân phối chuẩn N(μ, σ²): đường cong, các mốc μ ± kσ, tô vùng [μ − σ; μ + σ]
#let phan-phoi-chuan(ky: 0, dl: 1, k: 3, to-mau: true, nhan: true) = {
  import draw: *
  let W = 3.0
  let sx(v) = (v - ky) / dl * 1.5
  let f(v) = 3.2 * calc.exp(-calc.pow((v - ky) / dl, 2) / 2)
  line((-k * 1.5 - 0.5, 0), (k * 1.5 + 0.6, 0), mark: (end: ">"))
  let pts = range(0, 121).map(i => { let v = ky + dl * (-k + 2 * k * i / 120); (sx(v), f(v)) })
  if to-mau {
    let band = range(0, 61).map(i => { let v = ky + dl * (-1 + 2 * i / 60); (sx(v), f(v)) })
    line((sx(ky - dl), 0), ..band, (sx(ky + dl), 0), close: true, fill: c-blue.lighten(78%), stroke: none)
  }
  line(..pts, stroke: 1.7pt + c-blue)
  line((0, 0), (0, f(ky)), stroke: (thickness: 0.8pt, paint: c-gray, dash: "dashed"))
  for j in range(-k, k + 1) {
    line((j * 1.5, 0), (j * 1.5, -0.08), stroke: 0.6pt)
    let t = if j == 0 { [$mu$] } else if j == 1 { [$mu + sigma$] } else if j == -1 { [$mu - sigma$] } else if j > 0 { [$mu + #j sigma$] } else { [$mu - #(-j) sigma$] }
    lab((j * 1.5, -0.1), text(size: 8.5pt, t), at: "north", size: 8.5pt)
  }
  if nhan { lab((0, 1.1), text(size: 9pt)[$approx 68 %$], size: 9pt) }
}

// Biểu đồ phân tán + đường hồi quy bình phương tối thiểu
#let phan-tan(xs, ys, hoi-quy: true, W: 6.0, H: 4.0, nhan: true) = {
  import draw: *
  let n = xs.len()
  let x0 = calc.min(..xs)
  let x1 = calc.max(..xs)
  let y0 = calc.min(..ys)
  let y1 = calc.max(..ys)
  let px = (x1 - x0) * 0.1 + 0.001
  let py = (y1 - y0) * 0.1 + 0.001
  let sx(v) = (v - x0 + px) / (x1 - x0 + 2 * px) * W
  let sy(v) = (v - y0 + py) / (y1 - y0 + 2 * py) * H
  line((0, 0), (W + 0.3, 0), mark: (end: ">")); line((0, 0), (0, H + 0.3), mark: (end: ">"))
  lab((W + 0.3, -0.05), [$x$], at: "north-east", size: 10pt); lab((-0.05, H + 0.3), [$y$], at: "north-east", size: 10pt)
  for i in range(n) { circle((sx(xs.at(i)), sy(ys.at(i))), radius: 0.07, fill: c-blue, stroke: none) }
  if hoi-quy and n > 1 {
    let mx = xs.sum() / n
    let my = ys.sum() / n
    let sxy = range(n).map(i => (xs.at(i) - mx) * (ys.at(i) - my)).sum()
    let sxx = range(n).map(i => calc.pow(xs.at(i) - mx, 2)).sum()
    let b = if sxx == 0 { 0 } else { sxy / sxx }
    let a = my - b * mx
    line((sx(x0 - px * 0.5), sy(a + b * (x0 - px * 0.5))), (sx(x1 + px * 0.5), sy(a + b * (x1 + px * 0.5))), stroke: 1.5pt + c-red)
    if nhan { lab((0.2, H), text(fill: c-red, size: 9.5pt)[$y = #calc.round(a, digits: 2) + #calc.round(b, digits: 2) dot x$], at: "north-west", size: 9.5pt) }
  }
}

// Biểu đồ đường (đoạn thẳng nối các giá trị theo nhãn)
#let bieu-do-duong(vals, labels, W: 6.0, H: 3.5, col: c-blue) = {
  import draw: *
  let n = vals.len()
  let vmax = calc.max(..vals)
  let vmin = calc.min(0, ..vals)
  let sx(i) = if n == 1 { W / 2 } else { 0.4 + i * (W - 0.8) / (n - 1) }
  let sy(v) = (v - vmin) / (vmax - vmin) * H
  line((0, 0), (W + 0.3, 0), mark: (end: ">")); line((0, 0), (0, H + 0.4), mark: (end: ">"))
  line(..range(n).map(i => (sx(i), sy(vals.at(i)))), stroke: 1.6pt + col)
  for i in range(n) {
    circle((sx(i), sy(vals.at(i))), radius: 0.07, fill: col, stroke: none)
    lab((sx(i), sy(vals.at(i)) + 0.1), text(size: 8.5pt)[#vals.at(i)], at: "south", size: 8.5pt)
    lab((sx(i), -0.1), text(size: 9pt)[#labels.at(i)], at: "north", size: 9pt)
  }
}

// ═══════════════════════════════════════════════════════════════
// ĐỢT 3: thêm Hóa – Lý – Toán
// ═══════════════════════════════════════════════════════════════
// ───── HÓA ─────
#let binh-dinh-muc(pos, h: 4.2, r: 1.0, lvl: 0.55, liq: water, nhan: none) = {
  import draw: *
  group({
    translate(pos)
    let nw = 0.22
    let cy = r * 0.95
    let yy = calc.max(-0.97, calc.min(0.97, 2 * 0.55 * 0 + (-1 + 2 * lvl)))
    let psi = calc.asin(yy)
    merge-path(fill: liq, stroke: none, close: true, { arc((0, cy), start: 180deg - psi, stop: 360deg + psi, radius: r, anchor: "origin") })
    merge-path(fill: none, {
      line((-nw, h), (-nw, r * 1.8 + 0.2))
      arc((0, r * 0.95), start: 90deg + 14deg, stop: 450deg - 14deg, radius: r, anchor: "origin")
      line((nw, r * 1.8 + 0.2), (nw, h))
    })
    line((-nw - 0.07, h), (nw + 0.07, h))
    line((-nw, h * 0.72), (nw, h * 0.72), stroke: 1.2pt + c-red)
    rect((-r * 0.6, r * 0.55), (r * 0.6, r * 1.0), fill: white, stroke: 0.5pt)
    if nhan != none { lab((0, r * 0.78), nhan, size: 8pt) }
  })
}
#let pipet(pos, h: 4.6, mau: water, mut: true) = {
  import draw: *
  group({
    translate(pos)
    rect((-0.09, 0.2), (0.09, h - 1.3), fill: mau, stroke: 0.9pt)
    line((0, 0.2), (0, 0), stroke: 1pt)
    circle((0, h - 0.9), radius: (0.2, 0.55), fill: glass, stroke: 0.9pt)
    if mut { merge-path(fill: c-red, stroke: 0.7pt, { arc((0, h - 0.25), start: 180deg, stop: 0deg, radius: (0.2, 0.4), anchor: "origin"); line((0.2, h - 0.25), (-0.2, h - 0.25)) }) }
    for k in range(3) { line((0.09, 1.0 + k * 0.4), (0.22, 1.0 + k * 0.4), stroke: 0.5pt) }
  })
}
// Lọc thường: giá, phễu có giấy lọc, đũa thủy tinh dẫn dòng, cốc hứng
#let loc-thuong() = {
  import draw: *
  gia-do(0, 5.6, w: 3.2, y0: -2.0)
  line((0, 3.3), (1.55, 3.3), stroke: 2.4pt + c-gray); circle((1.55, 3.3), radius: 0.1, fill: c-gray.lighten(25%))
  pheu((1.55, 1.0), r: 1.1, h: 1.3, stem: 1.1)
  line((0.6, 3.55), (1.55, 1.9), (2.5, 3.55), close: true, fill: rgb(254, 243, 199, 55%), stroke: (thickness: 0.6pt, dash: "dashed", paint: c-amber))
  rect((0.7, 3.0), (2.4, 3.5), fill: rgb(147, 197, 253, 55%), stroke: none)
  dua-thuy-tinh((3.3, 4.4), (1.75, 2.9))
  rect((3.15, 3.7), (3.6, 4.5), fill: rgb(147, 197, 253, 55%), stroke: 0.7pt)
  coc((1.55, -2.0), w: 2.2, h: 2.0, lvl: 0.35, liq: rgb(253, 224, 71, 55%))
  lab((3.3, 4.7), text(size: 9pt)[hỗn hợp cần lọc], at: "south", size: 9pt)
  lab((2.9, 3.0), text(size: 9pt)[giấy lọc], at: "west", size: 9pt)
  lab((1.55, -2.35), text(size: 9pt)[dịch lọc], at: "north", size: 9pt)
}
// Chưng cất thường: bình cất Wurtz – sinh hàn nghiêng – bình hứng
#let chung-cat-thuong() = {
  import draw: *
  binh-wurtz((0, 0), r: 1.1, lvl: 0.45, liq: water, nhanh: 1.4, nhiet: true)
  group({
    translate((2.4, 1.2))
    rotate(-20deg)
    sinh-han((0, 0), len: 5.0)
  })
  erlen((7.6, -3.3), w: 2.4, h: 2.4, lvl: 0.3, liq: water)
  kieng((0, -1.35), w: 2.6, h: 1.0)
  den-con((0, -3.2), flame: true)
  lab((6.4, 0.8), text(size: 9pt)[nước ra], at: "west", size: 9pt)
  lab((3.6, -0.5), text(size: 9pt)[nước vào], at: "east", size: 9pt)
  lab((7.6, -3.35), text(size: 9pt)[chất lỏng ngưng tụ], at: "north", size: 9pt)
}
// Điều chế Cl₂: MnO₂ + HCl đặc (đun), qua dd NaCl, H₂SO₄ đặc, thu bằng đẩy không khí, bông NaOH
#let dieu-che-cl2() = {
  import draw: *
  binh-cau((0, 0), r: 1.2, neck-h: 1.0, lvl: 0.35, liq: rgb("#e5e7eb"))
  kt-ran(0, -0.95, 1.3, 0.4, n: 10, col: c-gray.darken(30%))
  nut((0, 2.2), w: 0.7, h: 0.5)
  line((-0.12, -0.1), (-0.12, 3.0), stroke: 1.1pt); line((-0.03, -0.1), (-0.03, 3.0), stroke: 1.1pt)
  line((-0.12, 3.0), (-0.7, 3.9), (0.55, 3.9), (-0.03, 3.0), stroke: 1pt, fill: rgb(253, 224, 71, 45%))
  kieng((0, -1.35), w: 2.6, h: 1.0); den-con((0, -3.2), flame: true)
  ong((0.26, 1.6), (0.26, 2.75), (2.5, 2.75), (2.5, 1.9), w: 1.6pt)
  binh-rua((2.5, -0.7), liq: rgb(147, 197, 253, 60%), lbl: ct("dd NaCl"))
  ong((2.64, 1.75), (2.64, 2.75), (5.2, 2.75), (5.2, 1.9), w: 1.6pt)
  binh-rua((5.2, -0.7), liq: rgb(253, 224, 71, 60%), lbl: ct("H2SO4 đặc"))
  ong((5.34, 1.75), (5.34, 2.75), (8.3, 2.75), (8.3, -0.3), w: 1.6pt)
  lo-khi((8.3, -0.7), w: 1.9, h: 2.9, gas: ch("Cl2"), gcol: rgb(190, 242, 100, 40%))
  bong((8.3, 2.25), w: 0.55)
  chuthich((-0.9, 3.7), (-1.6, 3.9), "dd HCl đặc", at: "east")
  chuthich((-1.0, -0.9), (-1.7, -1.2), "MnO2 (rắn)", at: "east")
  chuthich((8.9, 2.3), (9.6, 2.9), "bông tẩm NaOH", at: "west", size: 9pt)
}
// Điều chế O₂ (nhiệt phân KMnO₄) hoặc H₂ (Zn + HCl) và thu qua nước
#let dieu-che-o2() = {
  import draw: *
  ong-nghiem-nghieng((0.0, 1.0), ang: -12deg, h: 3.8, w: 0.95, bot-dots: 14, dotcol: c-purple)
  bong((3.55, 0.25), w: 0.3)
  den-con((0.65, -1.6), flame: true)
  nut((3.8, 0.1), w: 0.45, h: 0.5)
  ong((3.8, 0.0), (5.3, 0.0), (5.3, 0.4), w: 1.6pt)
  thu-nuoc((5.4, -0.8), gas: ch("O2"), w: 4.4)
  ong((5.3, 0.4), (5.3, -0.2), (5.7, -0.2), (5.7, 0.5), w: 1.6pt)
  bot((5.68, 0.9), (5.74, 1.6))
  chuthich((0.3, 1.5), (-0.3, 2.9), "KMnO4 (rắn)", at: "south")
  lab((5.7, -1.25), text(size: 9pt)[O#sub[2] ít tan trong nước], at: "north", size: 9pt)
}
#let dieu-che-h2() = {
  import draw: *
  erlen((0, 0), w: 3.0, h: 3.0, lvl: 0.3, liq: rgb("#e5e7eb"))
  kt-ran(0, 0.1, 1.4, 0.3, n: 8, col: c-gray)
  nut((0, 3.1), w: 0.8, h: 0.5)
  line((-0.13, 0.7), (-0.13, 3.9), stroke: 1.1pt); line((-0.03, 0.7), (-0.03, 3.9), stroke: 1.1pt)
  line((-0.13, 3.9), (-0.7, 4.8), (0.55, 4.8), (-0.03, 3.9), stroke: 1pt, fill: rgb(147, 197, 253, 55%))
  ong((0.3, 3.2), (0.3, 3.7), (4.0, 3.7), (4.0, 0.9), w: 1.6pt)
  thu-nuoc((4.9, -0.8), gas: ch("H2"), w: 4.2)
  ong((4.0, 0.9), (4.0, -0.2), (5.2, -0.2), (5.2, 0.5), w: 1.6pt)
  bot((5.18, 0.9), (5.25, 1.6))
  chuthich((-0.7, 4.5), (-1.4, 4.7), "dd HCl (hoặc H2SO4 loãng)", at: "east")
  chuthich((-0.9, 0.3), (-1.6, 0.0), "Zn (rắn)", at: "east")
}
// Điện phân dung dịch NaCl (điện cực trơ): khí Cl₂ ở anot, H₂ ở catot
#let dien-phan-nacl() = {
  import draw: *
  coc((0, 0), w: 5.0, h: 3.0, lvl: 0.8, liq: rgb(147, 197, 253, 55%))
  dien-cuc((-1.2, 0.35), h: 3.9, col: c-gray.darken(20%))
  dien-cuc((1.2, 0.35), h: 3.9, col: c-gray.darken(20%))
  ong-up((-1.2, 1.2), h: 2.2, w: 0.9, wl: 0, gas: ch("Cl2"), gcol: rgb(190, 242, 100, 50%))
  ong-up((1.2, 1.2), h: 2.2, w: 0.9, wl: 0, gas: ch("H2"), gcol: rgb(254, 240, 138, 55%))
  day((-1.2, 4.25), (-1.2, 5.3), (-0.3, 5.3)); day((0.3, 5.3), (1.2, 5.3), (1.2, 4.25))
  sym((-0.3, 5.3), (0.3, 5.3), "pin")
  lab((0, -0.35), text(size: 9.5pt)[(+) anot: 2Cl#super[−] → Cl#sub[2] + 2e], at: "north", size: 9.5pt)
  lab((0, -0.95), text(size: 9.5pt)[(−) catot: 2H#sub[2]O + 2e → H#sub[2] + 2OH#super[−]], at: "north", size: 9.5pt)
  lab((0, 0.35), ct("dd NaCl bão hòa"), at: "south", size: 9pt)
}
// Pin điện hóa Zn–Cu với cầu muối
#let pin-zn-cu(a: "Zn", c: "Cu") = {
  import draw: *
  coc((-2.2, 0), w: 2.8, h: 2.8, lvl: 0.7, liq: rgb(226, 232, 240, 70%))
  coc((2.2, 0), w: 2.8, h: 2.8, lvl: 0.7, liq: rgb(96, 165, 250, 60%))
  dien-cuc((-2.2, 0.3), h: 3.0, col: c-gray.lighten(25%))
  dien-cuc((2.2, 0.3), h: 3.0, col: rgb("#d97706"))
  cau-muoi(-1.5, 1.5, 2.6, 0.9)
  day((-2.2, 3.3), (-2.2, 4.5), (-0.5, 4.5)); day((0.5, 4.5), (2.2, 4.5), (2.2, 3.3))
  may-do((0, 4.5), "V", r: 0.5)
  line((-1.5, 5.25), (1.5, 5.25), mark: (end: ">", fill: c-blue, size: 0.2), stroke: 1.2pt + c-blue)
  lab((0, 5.35), text(fill: c-blue)[e], at: "south", size: 10pt)
  lab((-2.2, 3.55), [#ct(a) (−) anot], at: "south", size: 9.5pt)
  lab((2.2, 3.55), [#ct(c) (+) catot], at: "south", size: 9.5pt)
  lab((-2.2, -0.15), ct("dd ZnSO4"), at: "north", size: 9pt)
  lab((2.2, -0.15), ct("dd CuSO4"), at: "north", size: 9pt)
  lab((0, 2.0), text(size: 8.5pt)[cầu muối], size: 8.5pt)
}
// Thí nghiệm phun NH₃ (tính tan lớn): bình cầu úp, ống vuốt nhọn, cốc nước phenolphtalein
#let phun-nh3() = {
  import draw: *
  group({
    translate((0, 4.4))
    rotate(180deg)
    binh-cau((0, 0), r: 1.4, neck-h: 1.3, lvl: 0, liq: water)
  })
  circle((0, 4.4), radius: 1.4, fill: rgb(254, 240, 138, 25%), stroke: none)
  lab((0, 4.7), ch("NH3"), size: 11pt)
  line((-0.12, 0.8), (-0.12, 1.7), stroke: 1pt); line((0.12, 0.8), (0.12, 1.7), stroke: 1pt)
  nut((0, 1.9), w: 0.6, h: 0.4)
  coc((0, -1.2), w: 3.0, h: 2.2, lvl: 0.7, liq: rgb(244, 114, 182, 55%))
  for k in range(5) { circle((-0.3 + k * 0.15, 0.2 + k * 0.1 * (if calc.rem(k, 2) == 0 { 1 } else { 0.5 })), radius: 0.05, fill: rgb(244, 114, 182), stroke: none) }
  line((0, 0.5), (0, 0.1), stroke: 1.6pt + rgb(244, 114, 182))
  lab((1.7, -1.2), text(size: 9pt)[nước + phenolphtalein → phun, đổi màu hồng], at: "west", size: 9pt)
  gia-do(-2.6, 6.6, w: 1.2, y0: -2.3)
  line((-2.6, 4.6), (-1.35, 4.6), stroke: 2.4pt + c-gray)
}
// Ô nguyên tố trong bảng tuần hoàn
#let o-nguyen-to(z, sym-nt, ten, kl, dam: none, col: c-blue) = {
  import draw: *
  rect((-1.0, -1.1), (1.0, 1.1), fill: col.lighten(85%), stroke: 1.4pt + col, radius: 0.1)
  lab((-0.78, 0.82), text(size: 10pt, weight: "bold")[#z], at: "west", size: 10pt)
  lab((0, 0.1), text(size: 26pt, weight: "bold", fill: col.darken(30%))[#sym-nt], size: 26pt)
  lab((0, -0.55), text(size: 9pt)[#ten], size: 9pt)
  lab((0, -0.9), text(size: 8pt, fill: c-gray)[#kl], size: 8pt)
  if dam != none { lab((0.78, 0.82), text(size: 8pt, fill: c-red)[#dam], at: "east", size: 8pt) }
}
// Phân tử CH₄ dạng tứ diện với nét nêm
#let ch4-tu-dien() = {
  import draw: *
  lab((0, 0), [C], size: 13pt)
  line((0, 0.28), (0, 1.2), stroke: 1.5pt); lab((0, 1.3), [H], at: "south", size: 12pt)
  line((-0.25, -0.15), (-1.1, -0.65), stroke: 1.5pt); lab((-1.2, -0.7), [H], at: "east", size: 12pt)
  line((0.2, -0.05), (0.75, 0.35), (0.75, -0.2), close: true, fill: ink, stroke: 0.5pt); lab((0.85, 0.05), [H], at: "west", size: 12pt)
  for k in range(7) { let t = (k + 0.5) / 7; line((0.15 + t * 0.9, -0.2 - t * 0.55 - 0.03 - t * 0.05), (0.15 + t * 0.9, -0.2 - t * 0.55 + 0.03 + t * 0.05), stroke: 0.9pt) }
  lab((1.15, -0.85), [H], at: "west", size: 12pt)
  lab((0, -1.7), text(size: 9pt)[tứ diện đều, góc H–C–H = 109,5°], at: "north", size: 9pt)
}

// ───── LÝ ─────
// Mạch RLC nối tiếp
#let rlc-noi-tiep(nhan: true) = {
  import draw: *
  sym((0, 0), (0, 2.2), "ac", lbl: [$u$], side: -1)
  day((0, 2.2), (1.2, 2.2)); sym((1.2, 2.2), (2.8, 2.2), "R", lbl: [$R$]); day((2.8, 2.2), (3.4, 2.2))
  sym((3.4, 2.2), (5.2, 2.2), "cuon", lbl: [$L$]); day((5.2, 2.2), (5.8, 2.2))
  sym((5.8, 2.2), (7.0, 2.2), "tu", lbl: [$C$]); day((7.0, 2.2), (7.6, 2.2), (7.6, 0), (0, 0))
  nutd((1.2, 2.2), (2.8, 2.2), (5.8, 2.2), (7.0, 2.2))
  if nhan {
    lab((2.0, 3.5), [$u_R$], at: "south", size: 10pt); lab((4.3, 3.5), [$u_L$], at: "south", size: 10pt); lab((6.4, 3.5), [$u_C$], at: "south", size: 10pt)
    lab((3.8, -0.35), text(size: 9pt)[$Z = sqrt(R^2 + (Z_L - Z_C)^2)$], at: "north", size: 9pt)
  }
}
// Giản đồ Fresnel: U_R ngang, U_L lên, U_C xuống, U tổng; φ
#let gian-do-fresnel(ur: 3.0, ul: 3.6, uc: 1.6) = {
  import draw: *
  let o = (0, 0)
  line(o, (ur, 0), stroke: 1.6pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.2)); lab((ur, 0), text(fill: c-blue)[$arrow(U)_R$ ($arrow(I)$)], at: "north-west", size: 10pt)
  line((ur, 0), (ur, ul), stroke: 1.6pt + c-green, mark: (end: ">", fill: c-green, size: 0.2)); lab((ur + 0.1, ul), text(fill: c-green)[$arrow(U)_L$], at: "west", size: 10pt)
  line((ur, ul), (ur, ul - uc), stroke: 1.6pt + c-purple, mark: (end: ">", fill: c-purple, size: 0.2)); lab((ur + 0.1, ul - uc), text(fill: c-purple)[$arrow(U)_C$], at: "west", size: 10pt)
  line(o, (ur, ul - uc), stroke: 1.8pt + c-red, mark: (end: ">", fill: c-red, size: 0.22)); lab((ur / 2, (ul - uc) / 2 + 0.1), text(fill: c-red)[$arrow(U)$], at: "south-east", size: 11pt)
  line(o, (ur, ul), stroke: (thickness: 0.8pt, paint: c-gray, dash: "dashed"))
  arc(o, start: 0deg, stop: calc.atan2(ur, ul - uc), radius: 0.9, anchor: "origin", stroke: 0.9pt)
  lab((1.15, 0.28), [$phi$], size: 11pt)
  lab((0.0, -0.4), text(size: 9pt)[$tan phi = (U_L - U_C) / U_R$], at: "north-west", size: 9pt)
}
// Đồ thị u, i theo thời gian lệch pha φ
#let do-thi-ui(dp: 60deg) = {
  import draw: *
  let W = 8.0
  line((-0.2, 0), (W, 0), mark: (end: ">")); line((0, -1.8), (0, 1.9), mark: (end: ">"))
  lab((W, 0), [$t$], at: "north-east", size: 10pt)
  let f(x, ph) = 1.4 * calc.sin(360deg * x / 4.0 - ph)
  line(..range(0, 161).map(k => { let x = k / 160 * (W - 0.3); (x, f(x, 0deg)) }), stroke: 1.6pt + c-blue)
  line(..range(0, 161).map(k => { let x = k / 160 * (W - 0.3); (x, f(x, dp)) }), stroke: 1.6pt + c-red)
  lab((7.6, f(7.6, 0deg) + 0.15), text(fill: c-blue)[$u$], size: 10pt); lab((7.6, f(7.6, dp) - 0.25), text(fill: c-red)[$i$], size: 10pt)
  lab((0.1, 1.9), text(size: 9pt)[$phi = phi_u - phi_i$], at: "west", size: 9pt)
}
// Mạch dao động LC
#let mach-lc() = {
  import draw: *
  sym((0, 0), (0, 2.2), "tu", lbl: [$C$], side: -1)
  day((0, 2.2), (1.5, 2.2)); sym((1.5, 2.2), (3.0, 2.2), "ctac-h", lbl: [$K$]); day((3.0, 2.2), (4.2, 2.2))
  sym((4.2, 2.2), (4.2, 0), "cuon", lbl: [$L$], side: -1)
  day((4.2, 0), (0, 0))
  lab((2.1, -0.4), text(size: 9pt)[$T = 2 pi sqrt(L C)$, $omega = 1 / sqrt(L C)$], at: "north", size: 9pt)
}
// Hạt mang điện trong từ trường đều (B ⊗ vào mặt phẳng): quỹ đạo tròn
#let luc-lorentz(r: 1.8, duong: true) = {
  import draw: *
  for x in range(-3, 4) { for y in range(-3, 4) { if calc.abs(x) <= 3 and calc.abs(y) <= 3 { let p = (x * 1.2, y * 1.1); line((p.at(0) - 0.12, p.at(1) - 0.12), (p.at(0) + 0.12, p.at(1) + 0.12), stroke: 0.7pt + c-gray); line((p.at(0) - 0.12, p.at(1) + 0.12), (p.at(0) + 0.12, p.at(1) - 0.12), stroke: 0.7pt + c-gray) } } }
  circle((0, 0), radius: r, stroke: 1.6pt + c-blue, fill: none)
  let p = (r * calc.cos(-60deg), r * calc.sin(-60deg))
  circle(p, radius: 0.12, fill: c-red, stroke: none)
  lab((p.at(0) + 0.15, p.at(1) - 0.1), [$q$], at: "west", size: 10pt)
  let v = (-calc.sin(-60deg), calc.cos(-60deg))
  line(p, (p.at(0) + 1.3 * v.at(0), p.at(1) + 1.3 * v.at(1)), stroke: 1.6pt + c-green, mark: (end: ">", fill: c-green, size: 0.2))
  lab((p.at(0) + 1.4 * v.at(0), p.at(1) + 1.4 * v.at(1)), text(fill: c-green)[$arrow(v)$], at: "west", size: 11pt)
  line(p, (p.at(0) * 0.45, p.at(1) * 0.45), stroke: 1.6pt + c-red, mark: (end: ">", fill: c-red, size: 0.2))
  lab((p.at(0) * 0.55 - 0.1, p.at(1) * 0.55), text(fill: c-red)[$arrow(F)_L$], at: "east", size: 11pt)
  circle((0, 0), radius: 0.06, fill: ink, stroke: none)
  lab((0.05, 0.1), [$O$], at: "south-west", size: 9.5pt)
  lab((-3.9, 3.7), text(size: 9pt)[$arrow(B)$ hướng vào mặt phẳng (⊗)], at: "west", size: 9pt)
  if duong { lab((0, -r - 0.5), text(size: 9pt)[$R = (m v) / (|q| B)$, $F_L = |q| v B$], at: "north", size: 9pt) }
}
// Êlectron bay vào điện trường đều giữa hai bản tụ: quỹ đạo parabol
#let dien-truong-lech() = {
  import draw: *
  rect((1.0, 1.4), (5.0, 1.55), fill: c-gray.lighten(40%)); rect((1.0, -1.55), (5.0, -1.4), fill: c-gray.lighten(40%))
  lab((3.0, 1.9), [$-$], size: 12pt); lab((3.0, -1.9), [$+$], size: 12pt)
  for x in (1.8, 3.0, 4.2) { line((x, -1.3), (x, 1.3), stroke: 0.8pt + c-purple, mark: (start: ">", fill: c-purple, size: 0.14)) }
  lab((3.0, -0.55), text(fill: c-purple)[$arrow(E)$], at: "west", size: 10pt)
  line((-1.2, 0.0), (1.0, 0.0), stroke: 1.5pt + c-green, mark: (end: ">", fill: c-green, size: 0.2)); lab((-1.2, 0.15), text(fill: c-green)[$arrow(v)_0$], at: "south-east", size: 10pt)
  line(..range(0, 41).map(k => { let x = 1.0 + 4.0 * k / 40; (x, -0.9 * calc.pow((x - 1.0) / 4.0, 2) * 1.0) }), stroke: 1.6pt + c-blue)
  line((5.0, -0.9), (7.2, -0.9 - 1.8 * 0.9 / 2.0 * 1.0), stroke: (thickness: 1.4pt, paint: c-blue, dash: "dashed"), mark: (end: ">", fill: c-blue, size: 0.2))
  circle((1.0, 0), radius: 0.08, fill: c-blue, stroke: none); lab((0.9, 0.1), [e], at: "south-east", size: 9pt)
  lab((5.0, -0.5), [$y$], at: "west", size: 9pt)
  lab((3.0, 2.6), text(size: 9pt)[$y = (e E) / (2 m v_0^2) x^2$], at: "south", size: 9pt)
}
// Mắt: bình thường, cận, viễn; sửa bằng kính
#let mat-kinh(kind: "can", kinh: false) = {
  import draw: *
  circle((0, 0), radius: (2.6, 1.7), fill: rgb("#fef9c3"), stroke: 1.3pt)
  arc((0, 0), start: -50deg, stop: 50deg, radius: (2.6, 1.7), anchor: "origin", stroke: 3pt + c-red)
  circle((-1.7, 0), radius: (0.28, 0.9), fill: glass, stroke: 1.2pt)
  lab((2.7, 0), text(size: 9pt)[võng mạc], at: "west", size: 9pt)
  lab((-1.7, 1.95), text(size: 9pt)[thể thủy tinh], at: "south", size: 9pt)
  let xf = if kind == "can" and not kinh { 1.5 } else if kind == "vien" and not kinh { 3.4 } else { 2.45 }
  for y in (0.55, 0, -0.55) {
    let ys = if kinh { y } else { y }
    line((-4.8, ys), (-1.7, ys), stroke: 1pt + c-red)
    line((-1.7, ys), (xf, 0), stroke: 1pt + c-red, mark: (end: ">", fill: c-red, size: 0.14))
  }
  if kinh {
    let kx = -3.0
    circle((kx, 0), radius: (0.18, 1.0), fill: rgb(186, 230, 253, 70%), stroke: 1.1pt + c-blue)
    lab((kx, 1.15), text(size: 9pt, fill: c-blue)[#if kind == "can" [kính phân kì] else [kính hội tụ]], at: "south", size: 9pt)
  }
  lab((-4.8, -2.0), text(size: 9pt)[#if kind == "can" [mắt cận: ảnh hiện trước võng mạc] else if kind == "vien" [mắt viễn: ảnh hiện sau võng mạc] else [mắt bình thường]#if kinh [ (đã đeo kính)]], at: "north-west", size: 9pt)
}
// Con lắc lò xo nằm ngang: vị trí cân bằng, ly độ x, biên độ A
#let con-lac-lo-xo-ngang() = {
  import draw: *
  rect((-0.3, -0.9), (0, 1.1), fill: c-gray.lighten(40%)); for k in range(6) { line((-0.3, -0.9 + k * 0.35), (-0.5, -0.8 + k * 0.35), stroke: 0.6pt) }
  line((-0.3, -0.6), (6.5, -0.6), stroke: 1.4pt)
  lo-xo((0, 0.2), (3.4, 0.2), n: 8, w: 0.28)
  rect((3.4, -0.55), (4.6, 0.95), fill: c-blue.lighten(75%), stroke: 1pt + c-blue); lab((4.0, 0.2), [$m$], size: 11pt)
  line((4.0, -0.7), (4.0, -1.6), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray)); lab((4.0, -1.65), [$O$ (VTCB)], at: "north", size: 9pt)
  line((4.0, -1.3), (5.3, -1.3), stroke: 1pt, mark: (end: ">", fill: ink, size: 0.16)); lab((5.4, -1.3), [$x$], at: "west", size: 10pt)
  line((4.0, 1.4), (5.3, 1.4), stroke: 0.7pt, mark: (start: ">", end: ">", fill: ink, size: 0.12)); lab((4.65, 1.45), [$A$], at: "south", size: 9.5pt)
  lab((1.7, 0.7), [$k$], at: "south", size: 10pt)
}
// Đòn bẩy cân bằng
#let don-bay(d1: 2.4, d2: 1.6, f1: [$F_1$], f2: [$F_2$]) = {
  import draw: *
  line((-d1 - 0.5, 0.15), (d2 + 0.5, 0.15), stroke: 3pt + c-amber.darken(10%))
  line((0, 0.1), (-0.6, -1.1), (0.6, -1.1), close: true, fill: c-gray.lighten(30%), stroke: 1pt)
  lab((0, 0.35), [$O$], at: "south", size: 10pt)
  line((-d1, 0.15), (-d1, -1.6), stroke: 1.8pt + c-red, mark: (end: ">", fill: c-red, size: 0.22)); lab((-d1, -1.65), f1, at: "north", size: 11pt)
  line((d2, 0.15), (d2, -1.2 - d1 / d2 * 0.4), stroke: 1.8pt + c-red, mark: (end: ">", fill: c-red, size: 0.22)); lab((d2, -1.25 - d1 / d2 * 0.4), f2, at: "north", size: 11pt)
  line((-d1, 0.95), (0, 0.95), stroke: 0.7pt, mark: (start: ">", end: ">", fill: ink, size: 0.12)); lab((-d1 / 2, 1.0), [$d_1$], at: "south", size: 10pt)
  line((0, 0.95), (d2, 0.95), stroke: 0.7pt, mark: (start: ">", end: ">", fill: ink, size: 0.12)); lab((d2 / 2, 1.0), [$d_2$], at: "south", size: 10pt)
  lab((0, -2.5), text(size: 9pt)[$F_1 d_1 = F_2 d_2$], at: "north", size: 9.5pt)
}
// Lực trên mặt phẳng nghiêng
#let luc-mat-nghieng(al: 30deg, ma-sat: true) = {
  import draw: *
  let L = 6.0
  line((0, 0), (L * calc.cos(al), 0), (L * calc.cos(al), L * calc.sin(al)), close: true, fill: rgb("#e2e8f0"), stroke: 1.2pt)
  arc((L * calc.cos(al), 0), start: 180deg - al, stop: 180deg, radius: 1.2, anchor: "origin")
  lab((L * calc.cos(al) - 1.6, 0.25), [$alpha$], size: 10pt)
  let u = (calc.cos(al), calc.sin(al))
  let n = (-calc.sin(al), calc.cos(al))
  let c0 = (L * calc.cos(al) * 0.5 + n.at(0) * 0.45, L * calc.sin(al) * 0.5 + n.at(1) * 0.45)
  group({
    translate(c0); rotate(al)
    rect((-0.6, -0.45), (0.6, 0.45), fill: c-blue.lighten(75%), stroke: 1pt + c-blue)
  })
  let c = (c0.at(0) + n.at(0) * 0.0, c0.at(1) + n.at(1) * 0.0)
  luc(c, (c.at(0), c.at(1) - 2.2), [$arrow(P)$], at: "west", off: (0.1, 0))
  luc(c, (c.at(0) + n.at(0) * 1.8, c.at(1) + n.at(1) * 1.8), [$arrow(N)$], at: "south", col: c-green)
  if ma-sat { luc(c, (c.at(0) - u.at(0) * 1.5, c.at(1) - u.at(1) * 1.5), [$arrow(F)_(m s)$], at: "north", col: c-purple) }
  let pxe = (c.at(0) + u.at(0) * (-2.2 * calc.sin(al) * -1) * -1, 0)
  line(c, (c.at(0) - u.at(0) * 2.2 * calc.sin(al), c.at(1) - u.at(1) * 2.2 * calc.sin(al)), stroke: (thickness: 0.8pt, paint: c-red, dash: "dashed"))
}
// Từ trường của dòng điện thẳng (⊙ hoặc ⊗) – các đường sức tròn đồng tâm
#let tu-truong-day-thang(ra: true) = {
  import draw: *
  for k in (1, 2, 3) {
    circle((0, 0), radius: k * 0.8, stroke: 1pt + c-purple)
    let a = 40deg
    let p = (k * 0.8 * calc.cos(a), k * 0.8 * calc.sin(a))
    let q = (k * 0.8 * calc.cos(a + 12deg), k * 0.8 * calc.sin(a + 12deg))
    line(p, q, stroke: 1pt + c-purple, mark: (end: ">", fill: c-purple, size: 0.16))
  }
  circle((0, 0), radius: 0.28, fill: white, stroke: 1.3pt)
  if ra { circle((0, 0), radius: 0.07, fill: ink, stroke: none) } else { line((-0.17, -0.17), (0.17, 0.17), stroke: 1.3pt); line((-0.17, 0.17), (0.17, -0.17), stroke: 1.3pt) }
  lab((0, -2.8), text(size: 9pt)[#if ra [dòng điện hướng ra (⊙): đường sức ngược chiều kim đồng hồ] else [dòng điện hướng vào (⊗): đường sức cùng chiều kim đồng hồ]], at: "north", size: 9pt)
}
// Sóng điện từ: E (đứng) và B (ngang, phối cảnh) vuông góc, lan truyền theo c
#let song-dien-tu() = {
  import draw: *
  line((-0.4, 0), (8.4, 0), mark: (end: ">"), stroke: 1.2pt); lab((8.4, 0), [$arrow(c)$], at: "west", size: 11pt)
  line((-0.4, -0.2), (-0.4, 0.2), stroke: 0pt)
  line(..range(0, 161).map(k => { let x = k / 160 * 8; (x, 1.6 * calc.sin(360deg * x / 4)) }), stroke: 1.6pt + c-blue)
  line(..range(0, 161).map(k => { let x = k / 160 * 8; (x - 0.9 * calc.sin(360deg * x / 4) * 0.7, -0.9 * calc.sin(360deg * x / 4) * 0.6) }), stroke: 1.6pt + c-red)
  for k in (0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5) { let x = k; let e = 1.6 * calc.sin(360deg * x / 4); line((x, 0), (x, e), stroke: 0.5pt + c-blue, mark: (end: ">", fill: c-blue, size: 0.1)) }
  lab((2.0, 1.75), text(fill: c-blue)[$arrow(E)$], at: "south", size: 11pt); lab((1.0, -1.2), text(fill: c-red)[$arrow(B)$], at: "north", size: 11pt)
}
// Thang sóng điện từ
#let thang-song-dt() = {
  import draw: *
  let it = (("Sóng vô\ntuyến", "#ef4444"), ("Vi ba", "#f97316"), ("Hồng ngoại", "#eab308"), ("Ánh sáng\nnhìn thấy", "#22c55e"), ("Tử ngoại", "#3b82f6"), ("Tia X", "#8b5cf6"), ("Tia γ", "#a855f7"))
  for (i, (t, c)) in it.enumerate() {
    rect((i * 1.7, 0), (i * 1.7 + 1.7, 1.0), fill: rgb(c).lighten(55%), stroke: 0.8pt + rgb(c))
    lab((i * 1.7 + 0.85, 0.5), text(size: 8.5pt, t), size: 8.5pt)
  }
  line((0, -0.4), (11.9, -0.4), mark: (end: ">"), stroke: 1pt); lab((0, -0.45), text(size: 9pt)[bước sóng λ giảm, tần số f tăng →], at: "north-west", size: 9pt)
}
// Quang phổ vạch (Hiđrô, vùng nhìn thấy) – phát xạ hoặc hấp thụ
#let quang-pho-vach(kind: "phat-xa") = {
  import draw: *
  let rainbow = gradient.linear(rgb("#7c3aed"), rgb("#2563eb"), rgb("#16a34a"), rgb("#eab308"), rgb("#f97316"), rgb("#dc2626"))
  let W = 9.0
  let lines = ((410, "H_delta"), (434, "H_gamma"), (486, "H_beta"), (656, "H_alpha"))
  let sx(l) = (l - 380) / (700 - 380) * W
  if kind == "phat-xa" {
    rect((0, 0), (W, 1.4), fill: black, stroke: 0.8pt)
    for (l, _) in lines { let c = if l < 440 { rgb("#7c3aed") } else if l < 500 { rgb("#38bdf8") } else { rgb("#ef4444") }; line((sx(l), 0), (sx(l), 1.4), stroke: 2.2pt + c) }
  } else {
    rect((0, 0), (W, 1.4), fill: rainbow, stroke: 0.8pt)
    for (l, _) in lines { line((sx(l), 0), (sx(l), 1.4), stroke: 2.4pt + black) }
  }
  for l in (400, 450, 500, 550, 600, 650, 700) { line((sx(l), 0), (sx(l), -0.1), stroke: 0.6pt); lab((sx(l), -0.12), text(size: 8pt)[#l], at: "north", size: 8pt) }
  lab((W / 2, -0.7), text(size: 9pt)[λ (nm) – #if kind == "phat-xa" [quang phổ vạch phát xạ của hiđrô] else [quang phổ vạch hấp thụ của hiđrô]], at: "north", size: 9pt)
  for (l, n) in lines { lab((sx(l), 1.55), text(size: 8.5pt)[$#eval(n, mode: "math")$], at: "south", size: 8.5pt) }
}
// Phản ứng phân hạch U-235
#let phan-hach() = {
  import draw: *
  let nt(p, t, col, r: 0.55) = { circle(p, radius: r, fill: col.lighten(60%), stroke: 1.2pt + col); lab(p, t, size: 9pt) }
  nt((0, 0), text(size: 7pt)[n], c-gray, r: 0.25)
  line((0.3, 0), (1.9, 0), stroke: 1.2pt, mark: (end: ">", fill: ink, size: 0.18))
  nt((2.6, 0), [$""^235 "U"$], c-purple, r: 0.75)
  line((3.5, 0), (4.3, 0), stroke: 1.2pt, mark: (end: ">", fill: ink, size: 0.18))
  lab((4.55, 0), [$""^236 "U"^*$], size: 10pt)
  line((5.4, 0), (6.1, 0), stroke: 1.2pt, mark: (end: ">", fill: ink, size: 0.18))
  nt((7.0, 1.2), [$""^141 "Ba"$], c-blue, r: 0.65); nt((7.0, -1.2), [$""^92 "Kr"$], c-green, r: 0.55)
  line((6.2, 0.2), (6.7, 0.9), stroke: 1pt, mark: (end: ">", fill: ink, size: 0.14)); line((6.2, -0.2), (6.7, -0.8), stroke: 1pt, mark: (end: ">", fill: ink, size: 0.14))
  for dy in (0.7, 0, -0.7) { line((7.8, dy * 1.2), (9.0, dy * 1.8), stroke: 1pt + c-gray, mark: (end: ">", fill: c-gray, size: 0.14)); circle((9.1, dy * 1.8), radius: 0.14, fill: c-gray.lighten(50%), stroke: 0.8pt) }
  lab((9.5, 0), text(size: 9pt)[3 nơtron + năng lượng], at: "west", size: 9pt)
}
// Nhiệt lượng kế
#let nhiet-luong-ke() = {
  import draw: *
  rect((-1.8, 0), (1.8, 3.2), radius: 0.15, fill: rgb("#e2e8f0"), stroke: 1.4pt)
  rect((-1.5, 0.2), (1.5, 2.1), fill: rgb(147, 197, 253, 60%), stroke: 0.7pt)
  rect((-1.95, 3.2), (1.95, 3.45), fill: c-gray.lighten(50%), stroke: 1pt)
  nhiet-ke((-0.7, 0.45), h: 3.6)
  line((0.6, 3.45), (0.6, 4.3), stroke: 1.6pt + c-gray); lab((0.6, 4.4), text(size: 8.5pt)[que khuấy], at: "south", size: 8.5pt)
  line((0.6, 0.5), (0.6, 3.45), stroke: 1pt + c-gray)
  circle((0.6, 0.6), radius: 0.35, fill: c-amber.lighten(40%), stroke: 1pt)
  lab((2.1, 1.3), text(size: 9pt)[nước (m#sub[1], c#sub[1])], at: "west", size: 9pt)
  lab((2.1, 0.6), text(size: 9pt)[vật (m#sub[2], c#sub[2])], at: "west", size: 9pt)
  lab((-0.7, 4.2), text(size: 8.5pt)[nhiệt kế], at: "south", size: 8.5pt)
}

// ───── TOÁN ─────
// Đường tròn lượng giác với các góc đặc biệt
#let duong-tron-lg(goc: true, toa-do: true) = {
  import draw: *
  let R = 3.2
  line((-R - 0.5, 0), (R + 0.6, 0), mark: (end: ">")); line((0, -R - 0.5), (0, R + 0.6), mark: (end: ">"))
  circle((0, 0), radius: R, stroke: 1.3pt + c-blue)
  lab((R + 0.6, 0), [$x$], at: "north-east", size: 10pt); lab((0, R + 0.6), [$y$], at: "north-east", size: 10pt); lab((-0.05, -0.05), [$O$], at: "north-east", size: 9pt)
  let items = (
    (0, "0", "(1; 0)"), (30, "pi/6", "(sqrt(3)/2; 1/2)"), (45, "pi/4", "(sqrt(2)/2; sqrt(2)/2)"), (60, "pi/3", "(1/2; sqrt(3)/2)"), (90, "pi/2", "(0; 1)"),
    (120, "(2 pi)/3", "(-1/2; sqrt(3)/2)"), (135, "(3 pi)/4", "(-sqrt(2)/2; sqrt(2)/2)"), (150, "(5 pi)/6", "(-sqrt(3)/2; 1/2)"), (180, "pi", "(-1; 0)"),
    (210, "(7 pi)/6", "(-sqrt(3)/2; -1/2)"), (225, "(5 pi)/4", "(-sqrt(2)/2; -sqrt(2)/2)"), (240, "(4 pi)/3", "(-1/2; -sqrt(3)/2)"), (270, "(3 pi)/2", "(0; -1)"),
    (300, "(5 pi)/3", "(1/2; -sqrt(3)/2)"), (315, "(7 pi)/4", "(sqrt(2)/2; -sqrt(2)/2)"), (330, "(11 pi)/6", "(sqrt(3)/2; -1/2)"),
  )
  for (d, rad, tt) in items {
    let a = d * 1deg
    let p = (R * calc.cos(a), R * calc.sin(a))
    circle(p, radius: 0.06, fill: c-red, stroke: none)
    if goc {
      let q = ((R + 0.55) * calc.cos(a), (R + 0.55) * calc.sin(a))
      lab(q, text(size: 8pt, fill: c-red)[$#eval(rad, mode: "math")$], size: 8pt)
    }
    if toa-do and calc.rem(d, 90) != 0 {
      let q = ((R - 0.85) * calc.cos(a), (R - 0.85) * calc.sin(a))
      lab(q, text(size: 6.5pt, fill: c-gray)[$#eval(tt, mode: "math")$], size: 6.5pt)
    }
  }
}
// Cắt nửa mặt phẳng (Sutherland–Hodgman): poly là mảng điểm, nửa mặt phẳng a x + b y ≤ c
#let cat-nua(poly, a, b, c) = {
  let out = ()
  let n = poly.len()
  for i in range(n) {
    let p = poly.at(i)
    let q = poly.at(calc.rem(i + 1, n))
    let fp = a * p.at(0) + b * p.at(1) - c
    let fq = a * q.at(0) + b * q.at(1) - c
    if fp <= 0 { out.push(p) }
    if fp * fq < 0 {
      let t = fp / (fp - fq)
      out.push((p.at(0) + t * (q.at(0) - p.at(0)), p.at(1) + t * (q.at(1) - p.at(1))))
    }
  }
  out
}
// Miền nghiệm của hệ bất phương trình bậc nhất hai ẩn; cons = ((a, b, c, "<="), …) nghĩa là a x + b y ≤ c (hoặc ≥)
#let mien-nghiem(cons, x1: -2, x2: 8, y1: -2, y2: 8, u: 0.6, ve-duong: true) = {
  import draw: *
  let poly = ((x1, y1), (x2, y1), (x2, y2), (x1, y2))
  for (a, b, c, s) in cons { poly = if s == ">=" { cat-nua(poly, -a, -b, -c) } else { cat-nua(poly, a, b, c) } }
  if poly.len() > 2 { line(..poly.map(p => (p.at(0) * u, p.at(1) * u)), close: true, fill: c-blue.lighten(78%), stroke: none) }
  for k in range(calc.ceil(x1), calc.floor(x2) + 1) { line((k * u, y1 * u), (k * u, y2 * u), stroke: 0.3pt + rgb("#e2e8f0")) }
  for k in range(calc.ceil(y1), calc.floor(y2) + 1) { line((x1 * u, k * u), (x2 * u, k * u), stroke: 0.3pt + rgb("#e2e8f0")) }
  line((x1 * u, 0), (x2 * u + 0.2, 0), mark: (end: ">")); line((0, y1 * u), (0, y2 * u + 0.2), mark: (end: ">"))
  lab((x2 * u + 0.25, 0), [$x$], at: "west", size: 10pt); lab((0, y2 * u + 0.3), [$y$], at: "south", size: 10pt)
  for k in range(calc.ceil(x1), calc.floor(x2) + 1) { if k != 0 { lab((k * u, -0.08), text(size: 7.5pt)[#k], at: "north", size: 7.5pt) } }
  for k in range(calc.ceil(y1), calc.floor(y2) + 1) { if k != 0 { lab((-0.08, k * u), text(size: 7.5pt)[#k], at: "east", size: 7.5pt) } }
  if ve-duong {
    for (a, b, c, s) in cons {
      let pts = ()
      if calc.abs(b) < 0.000001 { pts = ((c / a, y1), (c / a, y2)) } else { pts = ((x1, (c - a * x1) / b), (x2, (c - a * x2) / b)) }
      let ps = pts.map(p => (p.at(0) * u, p.at(1) * u))
      line(..ps, stroke: 1.4pt + c-red)
    }
  }
  if poly.len() > 2 { for p in poly { if p.at(0) > x1 + 0.01 and p.at(0) < x2 - 0.01 and p.at(1) > y1 + 0.01 and p.at(1) < y2 - 0.01 { circle((p.at(0) * u, p.at(1) * u), radius: 0.06, fill: c-red, stroke: none) } } }
}
// Diện tích hình phẳng giới hạn bởi y = f(x), (tùy chọn) y = g(x), x = a, x = b
#let dien-tich-tp(f, g: none, a: 0, b: 2, x1: -1, x2: 4, y1: -1, y2: 5, u: 0.8, nhan: true) = {
  import draw: *
  let ys = if g == none { range(0, 81).map(k => { let x = a + (b - a) * k / 80; (x * u, eval-f(f, x) * u) }) } else { range(0, 81).map(k => { let x = a + (b - a) * k / 80; (x * u, eval-f(f, x) * u) }) }
  let lower = if g == none { range(0, 81).map(k => { let x = b - (b - a) * k / 80; (x * u, 0) }) } else { range(0, 81).map(k => { let x = b - (b - a) * k / 80; (x * u, eval-f(g, x) * u) }) }
  line(..(ys + lower), close: true, fill: c-blue.lighten(75%), stroke: none)
  do-thi(f, f2: g, x1: x1, x2: x2, y1: y1, y2: y2, ux: u, uy: u, luoi: false, nhan: true)
  for xv in (a, b) { net-dut((xv * u, 0), (xv * u, eval-f(f, xv) * u), col: c-red); lab((xv * u, -0.55), text(fill: c-red)[#if xv == a [$a$] else [$b$]], at: "north", size: 9.5pt) }
  if nhan { lab(((a + b) / 2 * u, eval-f(f, (a + b) / 2) * u / 2), text(size: 11pt)[$S$], size: 11pt) }
}
// Thể tích khối tròn xoay quanh Ox
#let the-tich-xoay(f, a: 0, b: 3, u: 0.9, nhan: true) = {
  import draw: *
  let top = range(0, 81).map(k => { let x = a + (b - a) * k / 80; (x * u, eval-f(f, x) * u) })
  let bot = range(0, 81).map(k => { let x = a + (b - a) * k / 80; (x * u, -eval-f(f, x) * u) })
  line(..(top + bot.rev()), close: true, fill: c-blue.lighten(85%), stroke: none)
  line((a * u - 0.5, 0), (b * u + 0.6, 0), mark: (end: ">")); line((0, -eval-f(f, b) * u - 0.5), (0, eval-f(f, b) * u + 0.7), mark: (end: ">"))
  line(..top, stroke: 1.6pt + c-blue); line(..bot, stroke: (thickness: 1pt, paint: c-blue, dash: "dashed"))
  for xv in (a, b) {
    let r = eval-f(f, xv) * u
    if r > 0.02 { circle((xv * u, 0), radius: (r * 0.25, r), stroke: 1.1pt + c-blue, fill: if xv == b { rgb(147, 197, 253, 25%) } else { none } ) }
  }
  lab((b * u + 0.6, 0), [$x$], at: "north-west", size: 10pt); lab((0, eval-f(f, b) * u + 0.8), [$y$], at: "south", size: 10pt)
  if nhan { lab(((a + b) / 2 * u, -eval-f(f, b) * u - 0.7), text(size: 9pt)[$V = pi integral_a^b [f(x)]^2 dif x$], at: "north", size: 9pt) }
}
// Vectơ: tổng theo quy tắc tam giác hoặc hình bình hành
#let vecto-tong(kind: "tam-giac", u: (3, 0.6), v: (1.2, 2.0)) = {
  import draw: *
  let o = (0, 0)
  let arr(a, b, col, t, an: "north") = { line(a, b, stroke: 1.8pt + col, mark: (end: ">", fill: col, size: 0.22)); lab(((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2), text(fill: col, t), at: an, size: 11pt) }
  if kind == "tam-giac" {
    arr(o, u, c-blue, [$arrow(a)$], an: "north-west")
    arr(u, (u.at(0) + v.at(0), u.at(1) + v.at(1)), c-green, [$arrow(b)$], an: "west")
    arr(o, (u.at(0) + v.at(0), u.at(1) + v.at(1)), c-red, [$arrow(a) + arrow(b)$], an: "south-east")
  } else {
    arr(o, u, c-blue, [$arrow(a)$], an: "north-west")
    arr(o, v, c-green, [$arrow(b)$], an: "south-east")
    line(u, (u.at(0) + v.at(0), u.at(1) + v.at(1)), stroke: (thickness: 0.8pt, paint: c-green, dash: "dashed"))
    line(v, (u.at(0) + v.at(0), u.at(1) + v.at(1)), stroke: (thickness: 0.8pt, paint: c-blue, dash: "dashed"))
    arr(o, (u.at(0) + v.at(0), u.at(1) + v.at(1)), c-red, [$arrow(a) + arrow(b)$], an: "south-east")
  }
  circle(o, radius: 0.06, fill: ink, stroke: none); lab(o, [$O$], at: "north-east", size: 9.5pt)
}
// Đường tròn và tiếp tuyến tại M trong Oxy
#let duong-tron-tt(cx: 2.0, cy: 2.0, r: 1.8, goc: 40deg) = {
  import draw: *
  oxy(-0.5, cx + r + 1.2, -0.5, cy + r + 1.0)
  circle((cx, cy), radius: r, stroke: 1.6pt + c-blue)
  let M = (cx + r * calc.cos(goc), cy + r * calc.sin(goc))
  cham((cx, cy), [$I$], an: "north-east", col: c-red); cham(M, [$M$], an: "south-west", col: c-purple)
  line((cx, cy), M, stroke: 1pt + c-purple)
  let t = (-calc.sin(goc), calc.cos(goc))
  line((M.at(0) - 2.0 * t.at(0), M.at(1) - 2.0 * t.at(1)), (M.at(0) + 2.0 * t.at(0), M.at(1) + 2.0 * t.at(1)), stroke: 1.4pt + c-green)
  lab((M.at(0) + 2.0 * t.at(0), M.at(1) + 2.0 * t.at(1)), text(fill: c-green)[$Delta$], at: "south-west", size: 10pt)
  goc-vuong-2d(M, (cx, cy), (M.at(0) + t.at(0), M.at(1) + t.at(1)), s: 0.2)
  lab((cx, -0.7), text(size: 9pt)[$(x - a)^2 + (y - b)^2 = R^2$, $Delta perp I M$], at: "north", size: 9pt)
}
// Tam giác với đường đặc biệt: "trung-tuyen" (G), "duong-cao" (H), "phan-giac" (I), "trung-truc" (O)
#let tam-giac-dac-biet(kind: "trung-tuyen") = {
  import draw: *
  let A = (1.4, 3.2)
  let B = (0, 0)
  let C = (5.0, 0)
  line(A, B, C, close: true, stroke: 1.5pt)
  let lbl(p, t, an) = { cham(p, none); lab(p, text(size: 11pt)[$#t$], at: an, size: 11pt) }
  lbl(A, "A", "south"); lbl(B, "B", "north-east"); lbl(C, "C", "north-west")
  let sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
  let len(a) = calc.sqrt(a.at(0) * a.at(0) + a.at(1) * a.at(1))
  let mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  let draw-extra = {
    if kind == "trung-tuyen" {
      let G = ((A.at(0) + B.at(0) + C.at(0)) / 3, (A.at(1) + B.at(1) + C.at(1)) / 3)
      for (P, Q, nm) in ((A, mid(B, C), "M"), (B, mid(A, C), "N"), (C, mid(A, B), "P")) { line(P, Q, stroke: 1.1pt + c-blue); cham(Q, [$#nm$], an: "south", col: c-blue) }
      cham(G, [$G$], an: "south-west", col: c-red)
    } else if kind == "duong-cao" {
      let proj(p, a, b) = { let d = sub(b, a); let t = ((p.at(0) - a.at(0)) * d.at(0) + (p.at(1) - a.at(1)) * d.at(1)) / (d.at(0) * d.at(0) + d.at(1) * d.at(1)); (a.at(0) + t * d.at(0), a.at(1) + t * d.at(1)) }
      let hs = ((A, proj(A, B, C), "D"), (B, proj(B, A, C), "E"), (C, proj(C, A, B), "F"))
      for (P, Q, nm) in hs { line(P, Q, stroke: 1.1pt + c-blue); cham(Q, [$#nm$], an: "south", col: c-blue) }
      // trực tâm: giao hai đường cao
      let D = proj(A, B, C)
      let Hx = A.at(0)
      let E = proj(B, A, C)
      let k = (E.at(1) - B.at(1)) / (E.at(0) - B.at(0))
      let H = (Hx, B.at(1) + k * (Hx - B.at(0)))
      cham(H, [$H$], an: "north-west", col: c-red)
      goc-vuong-2d(D, A, C, s: 0.22)
    } else if kind == "phan-giac" {
      let a = len(sub(B, C)); let b = len(sub(A, C)); let c = len(sub(A, B))
      let I = ((a * A.at(0) + b * B.at(0) + c * C.at(0)) / (a + b + c), (a * A.at(1) + b * B.at(1) + c * C.at(1)) / (a + b + c))
      let s = (a + b + c) / 2
      let area = calc.abs(A.at(0) * (B.at(1) - C.at(1)) + B.at(0) * (C.at(1) - A.at(1)) + C.at(0) * (A.at(1) - B.at(1))) / 2
      let r = area / s
      circle(I, radius: r, stroke: 1pt + c-green)
      for (P, Q) in ((A, (b * B.at(0) + c * C.at(0)) / (b + c)), (B, 0), (C, 0)) { line(P, I, stroke: 1.1pt + c-blue) }
      line(A, ((b * B.at(0) + c * C.at(0)) / (b + c), (b * B.at(1) + c * C.at(1)) / (b + c)), stroke: 1.1pt + c-blue)
      cham(I, [$I$], an: "south", col: c-red)
    } else {
      let ctr(p, q, r) = {
        let d = 2 * (p.at(0) * (q.at(1) - r.at(1)) + q.at(0) * (r.at(1) - p.at(1)) + r.at(0) * (p.at(1) - q.at(1)))
        let ux = ((p.at(0) * p.at(0) + p.at(1) * p.at(1)) * (q.at(1) - r.at(1)) + (q.at(0) * q.at(0) + q.at(1) * q.at(1)) * (r.at(1) - p.at(1)) + (r.at(0) * r.at(0) + r.at(1) * r.at(1)) * (p.at(1) - q.at(1))) / d
        let uy = ((p.at(0) * p.at(0) + p.at(1) * p.at(1)) * (r.at(0) - q.at(0)) + (q.at(0) * q.at(0) + q.at(1) * q.at(1)) * (p.at(0) - r.at(0)) + (r.at(0) * r.at(0) + r.at(1) * r.at(1)) * (q.at(0) - p.at(0))) / d
        (ux, uy)
      }
      let O = ctr(A, B, C)
      let R = len(sub(O, A))
      circle(O, radius: R, stroke: 1pt + c-green)
      for (P, Q) in ((B, C), (A, B), (A, C)) { let M = mid(P, Q); line(M, O, stroke: 1.1pt + c-blue); cham(M, none, col: c-blue) }
      cham(O, [$O$], an: "south-west", col: c-red)
    }
  }
  draw-extra
  lab((2.5, if kind == "trung-truc" { -2.2 } else { -0.6 }), text(size: 9pt)[#if kind == "trung-tuyen" [ba trung tuyến đồng quy tại trọng tâm $G$] else if kind == "duong-cao" [ba đường cao đồng quy tại trực tâm $H$] else if kind == "phan-giac" [ba phân giác đồng quy tại tâm đường tròn nội tiếp $I$] else [ba trung trực đồng quy tại tâm đường tròn ngoại tiếp $O$]], at: "north", size: 9pt)
}
// Hệ thức lượng trong tam giác vuông tại A, đường cao AH
#let he-thuc-luong() = {
  import draw: *
  let A = (0, 2.6)
  let B = (-1.9, 0)
  let C = (3.4, 0)
  line(A, B, C, close: true, stroke: 1.5pt)
  let H = (0, 0)
  line(A, H, stroke: 1.2pt + c-red)
  goc-vuong-2d(A, B, C, s: 0.22); goc-vuong-2d(H, A, C, s: 0.2)
  lab(A, [$A$], at: "south", size: 11pt); lab(B, [$B$], at: "north-east", size: 11pt); lab(C, [$C$], at: "north-west", size: 11pt); lab(H, [$H$], at: "north", size: 11pt)
  lab((0.75, -0.75), [$a$], at: "north", size: 10pt); lab((-1.15, 1.45), [$c$], at: "east", size: 10pt); lab((1.9, 1.45), [$b$], at: "west", size: 10pt); lab((0.1, 1.3), text(fill: c-red)[$h$], at: "west", size: 10pt)
  lab((-0.95, -0.2), [$c'$], at: "north", size: 10pt); lab((1.7, -0.2), [$b'$], at: "north", size: 10pt)
  lab((0.7, -1.4), text(size: 9pt)[$b^2 = a b'$, $c^2 = a c'$, $h^2 = b' c'$, $a h = b c$], at: "north", size: 9pt)
}
// Điểm M(x; y; z) trong Oxyz kèm hình hộp chiếu
#let oxyz-diem(x: 2, y: 3, z: 2) = {
  import draw: *
  let ex = (-0.55, -0.45)
  let P(a, b, c) = (a * ex.at(0) + b, a * ex.at(1) + c)
  line(P(0, 0, 0), P(4, 0, 0), mark: (end: ">")); line(P(0, 0, 0), P(0, 5, 0), mark: (end: ">")); line(P(0, 0, 0), P(0, 0, 4), mark: (end: ">"))
  lab(P(4, 0, 0), [$x$], at: "north-east", size: 10pt); lab(P(0, 5, 0), [$y$], at: "west", size: 10pt); lab(P(0, 0, 4), [$z$], at: "south", size: 10pt); lab(P(0, 0, 0), [$O$], at: "north-east", size: 10pt)
  let M = P(x, y, z)
  for (a, b) in ((P(x, 0, 0), P(x, y, 0)), (P(0, y, 0), P(x, y, 0)), (P(x, y, 0), M), (P(0, 0, z), P(0, y, z)), (P(0, y, z), M), (P(x, 0, z), M), (P(0, 0, z), P(x, 0, z)), (P(0, y, 0), P(0, y, z)), (P(x, 0, 0), P(x, 0, z))) { net-dut(a, b) }
  cham(M, [$M$#("(" + str(x) + "; " + str(y) + "; " + str(z) + ")")], an: "south-west", col: c-red, size: 10pt)
  for (p, t) in ((P(x, 0, 0), [$x$]), (P(0, y, 0), [$y$]), (P(0, 0, z), [$z$])) { cham(p, text(size: 8pt, fill: c-gray, t), an: "north-east", col: c-gray, r: 0.04, size: 8pt) }
}
// Hình trụ / nón / nón cụt có kích thước
#let hinh-tron-xoay(kind: "non", r: 1.6, h: 3.2, r2: 0.8) = {
  import draw: *
  let ry = r * 0.3
  if kind == "tru" {
    line((-r, 0), (-r, h)); line((r, 0), (r, h))
    circle((0, h), radius: (r, ry), stroke: 1.2pt)
    arc((0, 0), start: 180deg, stop: 360deg, radius: (r, ry), anchor: "origin", stroke: 1.2pt)
    arc((0, 0), start: 0deg, stop: 180deg, radius: (r, ry), anchor: "origin", stroke: (thickness: 0.8pt, dash: "dashed"))
    line((0, 0), (0, h), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray)); line((0, 0), (r, 0), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-red))
    lab((r / 2, -0.05), text(fill: c-red)[$r$], at: "north", size: 10pt); lab((0.05, h / 2), text(fill: c-red)[$h$], at: "west", size: 10pt)
  } else if kind == "non" {
    line((-r, 0), (0, h), (r, 0), stroke: 1.2pt)
    arc((0, 0), start: 180deg, stop: 360deg, radius: (r, ry), anchor: "origin", stroke: 1.2pt)
    arc((0, 0), start: 0deg, stop: 180deg, radius: (r, ry), anchor: "origin", stroke: (thickness: 0.8pt, dash: "dashed"))
    line((0, 0), (0, h), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray)); line((0, 0), (r, 0), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-red))
    lab((0, h), [$S$], at: "south", size: 10pt); lab((0, 0), [$O$], at: "north", size: 10pt)
    lab((r / 2, -0.05), text(fill: c-red)[$r$], at: "north", size: 10pt); lab((0.05, h / 2), text(fill: c-red)[$h$], at: "west", size: 10pt); lab((r / 2 + 0.1, h / 2 + 0.2), text(fill: c-blue)[$l$], at: "west", size: 10pt)
  } else {
    line((-r, 0), (-r2, h)); line((r, 0), (r2, h))
    circle((0, h), radius: (r2, r2 * 0.3), stroke: 1.2pt)
    arc((0, 0), start: 180deg, stop: 360deg, radius: (r, ry), anchor: "origin", stroke: 1.2pt)
    arc((0, 0), start: 0deg, stop: 180deg, radius: (r, ry), anchor: "origin", stroke: (thickness: 0.8pt, dash: "dashed"))
    line((0, 0), (0, h), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray))
    lab((r / 2, -0.05), text(fill: c-red)[$R$], at: "north", size: 10pt); lab((r2 / 2, h + 0.4), text(fill: c-red)[$r$], at: "south", size: 10pt); lab((0.05, h / 2), text(fill: c-red)[$h$], at: "west", size: 10pt)
  }
}
// Đồ thị sin / cos / tan với trục chia theo π
#let do-thi-lg(kind: "sin", chu-ky: 2) = {
  import draw: *
  let u = 1.6
  let X = chu-ky * 2 * u + 0.4
  line((-X / 2 - 0.2, 0), (X / 2 + 0.4, 0), mark: (end: ">")); line((0, -1.9), (0, 1.9), mark: (end: ">"))
  lab((X / 2 + 0.4, 0), [$x$], at: "north-west", size: 10pt); lab((0, 1.9), [$y$], at: "south-west", size: 10pt)
  let f(x) = if kind == "sin" { calc.sin(x * 1rad) } else if kind == "cos" { calc.cos(x * 1rad) } else { calc.tan(x * 1rad) }
  let lim = chu-ky * calc.pi
  if kind == "tan" {
    for k in range(-chu-ky * 2, chu-ky * 2 + 1) { if calc.rem(calc.abs(k), 2) == 1 { net-dut((k * u / 2, -1.8), (k * u / 2, 1.8), col: c-red) } }
    let w = calc.atan(1.8 / 1.5) / 1rad
    for k in range(-chu-ky, chu-ky) {
      let c0 = k * calc.pi
      line(..range(0, 61).map(i => { let x = c0 - w + 2 * w * i / 60; (x / calc.pi * u, 1.5 * f(x)) }), stroke: 1.6pt + c-blue)
    }
  } else {
    line(..range(0, 241).map(i => { let x = -lim + 2 * lim * i / 240; (x / calc.pi * u, 1.5 * f(x)) }), stroke: 1.7pt + c-blue)
  }
  for k in range(-chu-ky * 2, chu-ky * 2 + 1) {
    if k != 0 {
      line((k * u * 0.5, -0.06), (k * u * 0.5, 0.06), stroke: 0.6pt)
      let t = if calc.rem(k, 2) == 0 { let m = int(k / 2); if m == 1 { "pi" } else if m == -1 { "-pi" } else { str(m) + " pi" } } else if k == 1 { "pi/2" } else if k == -1 { "-pi/2" } else { "(" + str(k) + " pi)/2" }
      lab((k * u * 0.5, -0.1), text(size: 7.5pt)[$#eval(t, mode: "math")$], at: "north", size: 7.5pt)
    }
  }
  for yy in (-1, 1) { line((-0.06, 1.5 * yy), (0.06, 1.5 * yy), stroke: 0.6pt); lab((-0.1, 1.5 * yy), text(size: 8pt)[#yy], at: "east", size: 8pt) }
}

// Phương trình hoá học đã có hệ số: vế trái/phải = ((hệ số, "công thức", "↑|↓|"), …); dk = điều kiện trên mũi tên; kieu "->" hoặc "<=>"
#let pt-hh(trai, phai, dk: "", duoi: "", kieu: "->", size: 13pt) = {
  import draw: *
  let term(t) = [#if t.at(0) != 1 [#t.at(0)]#ch(t.at(1))#if t.at(2) != "" [#t.at(2)]]
  let side(a) = a.map(term).join([ $+$ ])
  let arrow = if kieu == "<=>" { $arrow.l.r.double$ } else { $arrow.r$ }
  let mid = if dk != "" { [#box(inset: (x: 3pt))[#stack(dir: ttb, spacing: 2pt, align(center, text(size: 0.7em, ct(dk))), align(center, text(size: 1.3em, arrow)), align(center, text(size: 0.7em, ct(duoi))))]] } else { [ #text(size: 1.3em, arrow) ] }
  content((0, 0), text(size: size)[#side(trai)#mid#side(phai)], anchor: "center")
}
