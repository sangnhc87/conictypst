#import "@preview/cetz:0.5.0": canvas, draw
// ==========================================
// BỘ MACRO HOÀN MỸ CHO BẢNG BIẾN THIÊN VÀ BẢNG XÉT DẤU
// Cập nhật tính năng:
// 1. shade: Tô vùng không xác định (gạch chéo) chuẩn tkz-tab
// 2. Tự động ngắt mũi tên đi qua vùng không xác định
// 3. Tích hợp thêm macro bxd (Bảng xét dấu) siêu gọn nhẹ
// ==========================================

#let bbtv2(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: (),     
  d-signs: (),    
  v-vals: (),
  shade: (),      // Mảng chứa các cặp index vùng gạch chéo. VD: ((1, 2),)
  w1: 1.5,        
  w2: 10,         
  h1: 0.8,
  h2: 0.8,
  h3: 2.2
) = {
  canvas(length: 1cm, {
    import draw: *
    
    let n = x-vals.len()
    let tw = w1 + w2
    let th = h1 + h2 + h3
    
    // Tọa độ x cho các cột nội dung
    let x-pos = ()
    for i in range(n) {
      let px = w1 + 0.6 + (w2 - 1.2) * i / (n - 1)
      x-pos.push(px)
    }

    // 1. Kẻ khung cơ bản
    rect((0, 0), (tw, -th), stroke: 1pt)
    line((0, -h1), (tw, -h1), stroke: 1pt)
    line((0, -h1 - h2), (tw, -h1 - h2), stroke: 1pt)
    line((w1, 0), (w1, -th), stroke: 1pt)
    
    // 2. Xử lý vùng Shade (gạch chéo vùng không xác định)
    let hatch = std.pattern(size: (8pt, 8pt))[
      #std.line(start: (0pt, 8pt), end: (8pt, 0pt), stroke: rgb("888888") + 0.5pt)
    ]
    for s in shade {
      let xL = x-pos.at(s.at(0))
      let xR = x-pos.at(s.at(1))
      rect((xL, -h1), (xR, -th), fill: hatch, stroke: none)
      line((xL, -h1 - h2), (xR, -h1 - h2), stroke: 1pt)
    }

    // Nhãn cột trái
    content((w1/2, -h1/2), var)
    content((w1/2, -h1 - h2/2), der)
    content((w1/2, -h1 - h2 - h3/2), func)
    
    let render-sign(s) = {
      if s == "-" { $-$ } else if s == "+" { $+$ } else if s == "0" { $0$ } else if s == "||" { none } else { s }
    }
    
    for i in range(n) {
      content((x-pos.at(i), -h1/2), x-vals.at(i))
    }
    
    // Thuật toán chia Rank siêu việt
    let ranks = ()
    let cur = 0
    ranks.push((cur,))
    
    for i in range(n - 1) {
      let sign = d-signs.at(2*i + 1)
      // Nếu vùng bị shade thì không thay đổi rank
      let is-shaded = false
      for s in shade {
        if i >= s.at(0) and i < s.at(1) { is-shaded = true }
      }
      
      if not is-shaded {
        if sign == "+" { cur += 1 } else if sign == "-" { cur -= 1 }
      }
      
      let next_idx = 2*(i + 1)
      if next_idx < d-signs.len() and d-signs.at(next_idx) == "||" {
        let val = v-vals.at(i+1)
        if type(val) == array {
          let next_sign = if next_idx + 1 < d-signs.len() { d-signs.at(next_idx + 1) } else { "+" }
          let left_rank = cur
          cur = if next_sign == "-" { left_rank + 2 } else { left_rank - 2 }
          ranks.push((left_rank, cur))
        } else {
          ranks.push((cur,))
        }
      } else {
        ranks.push((cur,))
      }
    }
    
    let flat-ranks = ()
    for r in ranks { for v in r { if v != none { flat-ranks.push(v) } } }
    let min-r = if flat-ranks.len() > 0 { calc.min(..flat-ranks) } else { 0 }
    let max-r = if flat-ranks.len() > 0 { calc.max(..flat-ranks) } else { 0 }
    
    let y-top = -h1 - h2 - 0.5
    let y-bot = -th + 0.4
    
    let map-y(r) = {
      if max-r == min-r { return (y-top + y-bot)/2 }
      let factor = (r - min-r) / (max-r - min-r)
      return y-bot + factor * (y-top - y-bot)
    }
    
    let node-points = ()
    
    for i in range(n) {
      // VẼ KÝ HIỆU ĐẠO HÀM (|| HOẶC SỐ 0)
      if d-signs.len() > 2*i and d-signs.at(2*i) == "||" {
         let px = x-pos.at(i)
         let val = v-vals.at(i)
         if type(val) == array {
           line((px - 0.05, -h1), (px - 0.05, -th), stroke: 0.8pt)
           line((px + 0.05, -h1), (px + 0.05, -th), stroke: 0.8pt)
         } else {
           line((px - 0.05, -h1), (px - 0.05, -h1 - h2), stroke: 0.8pt)
           line((px + 0.05, -h1), (px + 0.05, -h1 - h2), stroke: 0.8pt)
         }
      } else {
         content((x-pos.at(i), -h1 - h2/2), render-sign(d-signs.at(2*i)))
      }
      
      // VẼ KHOẢNG DẤU Ở GIỮA
      if i < n - 1 {
         let is-shaded = false
         for s in shade {
           if i >= s.at(0) and i < s.at(1) { is-shaded = true }
         }
         // Nếu không bị gạch chéo thì in dấu
         if not is-shaded {
           let mid-x = (x-pos.at(i) + x-pos.at(i+1)) / 2
           content((mid-x, -h1 - h2/2), render-sign(d-signs.at(2*i + 1)))
         }
      }
      
      // TỌA ĐỘ CÁC ĐIỂM GIÁ TRỊ HÀM SỐ
      let rv = ranks.at(i)
      let val = v-vals.at(i)
      let px = x-pos.at(i)
      
      // Nếu giá trị là rỗng (ẩn đi khi nằm trong vùng gạch chéo)
      if val == "" or val == none {
        node-points.push((none, none))
      } else if rv.len() == 1 {
        let y = map-y(rv.at(0))
        let v-text = if type(val) == array { val.at(0) } else { val }
        content((px, y), v-text, name: "v" + str(i), padding: 0.15)
        node-points.push(("v" + str(i), "v" + str(i)))
      } else {
        let yL = map-y(rv.at(0))
        let yR = map-y(rv.at(1))
        let vL-text = if type(val) == array and val.len() > 0 { val.at(0) } else { val }
        let vR-text = if type(val) == array and val.len() > 1 { val.at(1) } else { val }
        
        let off = 0.35 
        content((px - off, yL), vL-text, name: "v" + str(i) + "L", padding: 0.15)
        content((px + off, yR), vR-text, name: "v" + str(i) + "R", padding: 0.15)
        node-points.push(("v" + str(i) + "L", "v" + str(i) + "R"))
      }
    }
    
    // NỐI MŨI TÊN
    for i in range(n - 1) {
      let is-shaded = false
      for s in shade {
        if i >= s.at(0) and i < s.at(1) { is-shaded = true }
      }
      
      // CHỈ NỐI NẾU KHÔNG ĐI QUA VÙNG GẠCH CHÉO VÀ CÓ TỒN TẠI NODE
      if not is-shaded {
        let start-node = node-points.at(i).at(1)
        let end-node = node-points.at(i+1).at(0)
        if start-node != none and end-node != none {
          line(start-node, end-node, mark: (end: ">", fill: black), stroke: 0.8pt)
        }
      }
    }
  })
}


// ==========================================
// MACRO BẢNG XÉT DẤU (DÀNH CHO XÉT DẤU y', BẤT PHƯƠNG TRÌNH)
// ==========================================
#let bxd(
  var: $x$,
  func: $f(x)$,
  x-vals: (),
  f-signs: (),
  w1: 1.5,
  w2: 8,
  h1: 0.8,
  h2: 0.8
) = {
  canvas(length: 1cm, {
    import draw: *
    let n = x-vals.len()
    let tw = w1 + w2
    let th = h1 + h2
    
    rect((0, 0), (tw, -th), stroke: 1pt)
    line((0, -h1), (tw, -h1), stroke: 1pt)
    line((w1, 0), (w1, -th), stroke: 1pt)
    
    content((w1/2, -h1/2), var)
    content((w1/2, -h1 - h2/2), func)
    
    let x-pos = ()
    for i in range(n) {
      let px = w1 + 0.6 + (w2 - 1.2) * i / (n - 1)
      x-pos.push(px)
      content((px, -h1/2), x-vals.at(i))
    }
    
    let render-sign(s) = {
      if s == "-" { $-$ } else if s == "+" { $+$ } else if s == "0" { $0$ } else if s == "||" { none } else { s }
    }
    
    for i in range(n) {
      if f-signs.len() > 2*i and f-signs.at(2*i) == "||" {
         let px = x-pos.at(i)
         line((px - 0.05, -h1), (px - 0.05, -th), stroke: 0.8pt)
         line((px + 0.05, -h1), (px + 0.05, -th), stroke: 0.8pt)
      } else {
         content((x-pos.at(i), -h1 - h2/2), render-sign(f-signs.at(2*i)))
      }
      if i < n - 1 {
         let mid-x = (x-pos.at(i) + x-pos.at(i+1)) / 2
         content((mid-x, -h1 - h2/2), render-sign(f-signs.at(2*i + 1)))
      }
    }
  })
}

#let bbbt(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: (),     
  d-signs: (),    
  v-vals: (),
  w1: 1.5,        
  w2: 10,         // Nới rộng thêm để chứa nhiều mốc x
  h1: 0.8,
  h2: 0.8,
  h3: 2.2
) = {
  canvas(length: 1cm, {
    import draw: *
    
    let n = x-vals.len()
    let tw = w1 + w2
    let th = h1 + h2 + h3
    
    // Kẻ khung
    rect((0, 0), (tw, -th), stroke: 1pt)
    line((0, -h1), (tw, -h1), stroke: 1pt)
    line((0, -h1 - h2), (tw, -h1 - h2), stroke: 1pt)
    line((w1, 0), (w1, -th), stroke: 1pt)
    
    content((w1/2, -h1/2), var)
    content((w1/2, -h1 - h2/2), der)
    content((w1/2, -h1 - h2 - h3/2), func)
    
    let render-sign(s) = {
      if s == "-" { $-$ } else if s == "+" { $+$ } else if s == "0" { $0$ } else if s == "||" { none } else { s }
    }
    
    let x-pos = ()
    for i in range(n) {
      let px = w1 + 0.6 + (w2 - 1.2) * i / (n - 1)
      x-pos.push(px)
      content((px, -h1/2), x-vals.at(i))
    }
    
    // Thuật toán chia Rank siêu việt
    let ranks = ()
    let cur = 0
    ranks.push((cur,))
    
    for i in range(n - 1) {
      let sign = d-signs.at(2*i + 1)
      if sign == "+" { cur += 1 } else if sign == "-" { cur -= 1 }
      
      let next_idx = 2*(i + 1)
      if next_idx < d-signs.len() and d-signs.at(next_idx) == "||" {
        // KIỂM TRA: Hàm số tại đây có xác định không?
        let val = v-vals.at(i+1)
        if type(val) == array {
          // Hàm không xác định -> Tiệm cận đứng -> Phân nhánh Rank
          let next_sign = if next_idx + 1 < d-signs.len() { d-signs.at(next_idx + 1) } else { "+" }
          let left_rank = cur
          // Tự động đoán độ cao nhánh phải dựa vào dấu tiếp theo
          cur = if next_sign == "-" { left_rank + 2 } else { left_rank - 2 }
          ranks.push((left_rank, cur))
        } else {
          // Hàm vẫn xác định (căn thức, trị tuyệt đối) -> Giữ nguyên 1 Rank
          ranks.push((cur,))
        }
      } else {
        ranks.push((cur,))
      }
    }
    
    let flat-ranks = ()
    for r in ranks { for v in r { flat-ranks.push(v) } }
    let min-r = calc.min(..flat-ranks)
    let max-r = calc.max(..flat-ranks)
    
    let y-top = -h1 - h2 - 0.5
    let y-bot = -th + 0.4
    
    let map-y(r) = {
      if max-r == min-r { return (y-top + y-bot)/2 }
      let factor = (r - min-r) / (max-r - min-r)
      return y-bot + factor * (y-top - y-bot)
    }
    
    let node-points = ()
    
    for i in range(n) {
      // KIỂM TRA ĐỂ VẼ NÉT ĐỨT HOẶC KÉP
      if d-signs.len() > 2*i and d-signs.at(2*i) == "||" {
         let px = x-pos.at(i)
         let val = v-vals.at(i)
         if type(val) == array {
           // Kéo dài || xuống tận hàng 3 (Hàm gián đoạn)
           line((px - 0.05, -h1), (px - 0.05, -th), stroke: 0.8pt)
           line((px + 0.05, -h1), (px + 0.05, -th), stroke: 0.8pt)
         } else {
           // Chỉ kẻ || ở hàng 2 đạo hàm (Hàm liên tục nhưng y' không xác định)
           line((px - 0.05, -h1), (px - 0.05, -h1 - h2), stroke: 0.8pt)
           line((px + 0.05, -h1), (px + 0.05, -h1 - h2), stroke: 0.8pt)
         }
      } else {
         content((x-pos.at(i), -h1 - h2/2), render-sign(d-signs.at(2*i)))
      }
      
      // Vẽ khoảng dấu
      if i < n - 1 {
         let mid-x = (x-pos.at(i) + x-pos.at(i+1)) / 2
         content((mid-x, -h1 - h2/2), render-sign(d-signs.at(2*i + 1)))
      }
      
      let rv = ranks.at(i)
      let val = v-vals.at(i)
      let px = x-pos.at(i)
      
      if rv.len() == 1 {
        let y = map-y(rv.at(0))
        let v-text = if type(val) == array { val.at(0) } else { val }
        content((px, y), v-text, name: "v" + str(i), padding: 0.15)
        node-points.push(("v" + str(i), "v" + str(i)))
      } else {
        // Tách nhánh trái / phải cho tiệm cận
        let yL = map-y(rv.at(0))
        let yR = map-y(rv.at(1))
        let vL-text = if type(val) == array and val.len() > 0 { val.at(0) } else { val }
        let vR-text = if type(val) == array and val.len() > 1 { val.at(1) } else { val }
        
        let off = 0.35 
        content((px - off, yL), vL-text, name: "v" + str(i) + "L", padding: 0.15)
        content((px + off, yR), vR-text, name: "v" + str(i) + "R", padding: 0.15)
        node-points.push(("v" + str(i) + "L", "v" + str(i) + "R"))
      }
    }
    
    // Nối mũi tên
    for i in range(n - 1) {
      let start-node = node-points.at(i).at(1)
      let end-node = node-points.at(i+1).at(0)
      line(start-node, end-node, mark: (end: ">", fill: black), stroke: 0.8pt)
    }
  })
}
// Chuyên dùng cho các bài toán tối ưu (1 cực trị trên đoạn)
// ==========================================
#let bbt-opt(
  var: $x$,
  der: $y'$,
  func: $y$,
  x-vals: ($0$, $x_0$, $oo$),
  d-signs: ($-$, $0$, $+$),
  v-vals: ($oo$, $0$, $oo$),
  is-min: true, // true: cực tiểu (\/), false: cực đại (/\)
  w1: 1.5,      // Chiều rộng cột nhãn
  w2: 7         // Chiều rộng cột nội dung
) = {
  canvas(length: 1cm, {
    import draw: *
    
    let h1 = 0.8
    let h2 = 0.8
    let h3 = 2.2
    let tw = w1 + w2
    let th = h1 + h2 + h3
    
    // Kẻ khung và các đường ngang, dọc
    rect((0, 0), (tw, -th), stroke: 1pt)
    line((0, -h1), (tw, -h1), stroke: 1pt)
    line((0, -h1 - h2), (tw, -h1 - h2), stroke: 1pt)
    line((w1, 0), (w1, -th), stroke: 1pt)
    
    // Nhãn các hàng
    content((w1/2, -h1/2), var)
    content((w1/2, -h1 - h2/2), der)
    content((w1/2, -h1 - h2 - h3/2), func)
    
    // Tọa độ x cho các cột nội dung
    let x1 = w1 + 0.6
    let x2 = w1 + w2/2
    let x3 = tw - 0.6
    
    // Hàng 1: x
    content((x1, -h1/2), x-vals.at(0))
    content((x2, -h1/2), x-vals.at(1))
    content((x3, -h1/2), x-vals.at(2))
    
    // Hàng 2: Đạo hàm
    content(((x1+x2)/2, -h1 - h2/2), d-signs.at(0))
    content((x2, -h1 - h2/2), d-signs.at(1))
    content(((x2+x3)/2, -h1 - h2/2), d-signs.at(2))
    
    // Hàng 3: Biến thiên
    let y-top = -h1 - h2 - 0.5
    let y-bot = -th + 0.4
    
    let (y1, y2, y3) = if is-min {
      (y-top, y-bot, y-top)
    } else {
      (y-bot, y-top, y-bot)
    }
    
    content((x1, y1), v-vals.at(0), name: "v1", padding: 0.1)
    content((x2, y2), v-vals.at(1), name: "v2", padding: 0.1)
    content((x3, y3), v-vals.at(2), name: "v3", padding: 0.1)
    
    // Vẽ mũi tên biến thiên
    line("v1", "v2", mark: (end: ">", fill: black), stroke: 0.8pt)
    line("v2", "v3", mark: (end: ">", fill: black), stroke: 0.8pt)
  })
}

#let auto-bbt(
  x: (),
  y-phay: (),
  y: ()
) = {
  align(center)[
    #canvas({
      import draw: *
      
      // Khởi tạo các thông số tự động
      let n = x.len()
      let col1 = 1.5           // Độ rộng cột tiêu đề
      let step = 3.0           // Khoảng cách giữa các điểm x
      let w = col1 + (n - 1) * step
      let h = 4.0
      
      // Vẽ khung và lưới cơ bản
      rect((0,0), (w, h), stroke: 0.75pt + black)
      line((0, 2), (w, 2), stroke: 0.75pt + black)
      line((0, 3), (w, 3), stroke: 0.75pt + black)
      line((col1, 0), (col1, h), stroke: 0.75pt + black)
      
      // Cột tiêu đề
      content((col1 / 2, 3.5), [$x$])
      content((col1 / 2, 2.5), [$f'(x)$])
      content((col1 / 2, 1.0), [$f(x)$])
      
      // 1. Điền hàng x tự động
      for i in range(n) {
        let cx = col1 + i * step
        content((cx, 3.5), x.at(i))
      }
      
      // 2. Điền hàng f'(x) tự động
      // Mảng y-phay có độ dài 2n - 1 (gồm nghiệm và khoảng giữa)
      for i in range(y-phay.len()) {
        let cx = col1 + i * (step / 2)
        content((cx, 2.5), y-phay.at(i))
      }
      
      // 3. Điền hàng f(x) và thuật toán tự động vẽ mũi tên
      let y_top = 1.6
      let y_mid = 1.0
      let y_bot = 0.4
      
      // Hàm phụ xác định cao độ: 1 (Trên), -1 (Dưới), 0 (Giữa)
      let get-y-coord(pos) = {
        if pos == 1 { y_top }
        else if pos == -1 { y_bot }
        else { y_mid }
      }
      
      // Điền các giá trị cực trị / giới hạn
      for i in range(n) {
        let item = y.at(i)
        let cx = col1 + i * step
        let cy = get-y-coord(item.at(1))
        content((cx, cy), item.at(0))
      }
      
      // Vòng lặp tự động phóng mũi tên
      let dx = 0.6  // Độ thu vào trục x (không đâm vào chữ)
      let dy = 0.25 // Độ thu vào trục y
      
      for i in range(n - 1) {
        let item1 = y.at(i)
        let item2 = y.at(i + 1)
        
        let x_start = col1 + i * step
        let y_start = get-y-coord(item1.at(1))
        
        let x_end = col1 + (i + 1) * step
        let y_end = get-y-coord(item2.at(1))
        
        // Thuật toán xét mũi tên đi lên hay đi xuống
        let x1 = x_start + dx
        let x2 = x_end - dx
        
        if y_start > y_end {
          // Nghịch biến (Đi xuống)
          line((x1, y_start - dy), (x2, y_end + dy), mark: (end: "stealth", fill: black))
        } else if y_start < y_end {
          // Đồng biến (Đi lên)
          line((x1, y_start + dy), (x2, y_end - dy), mark: (end: "stealth", fill: black))
        } else {
          // Hàm hằng (Đi ngang)
          line((x1 + 0.2, y_start), (x2 - 0.2, y_end), mark: (end: "stealth", fill: black))
        }
      }
    })
  ]
}