// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 1)
// Lớp: Khối 10  ·  Mã đề: 101  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")

// HÀM VẼ MIỀN NGHIỆM BẤT PHƯƠNG TRÌNH THUẬT TOÁN HÌNH HỌC CHUẨN
#let draw_bpt(
  a: 1,           // ax + by + c <= 0 (hoặc >= 0)
  b: 1,
  c: -2,
  sign: "<=",     // "<=", ">=", "<", ">"
  xmin: -2,
  xmax: 4,
  ymin: -2,
  ymax: 4,
  line-name: [$x + y = 2$],
  step: 0.35,
) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // 1. Tìm các giao điểm của đường thẳng bờ d: ax + by + c = 0 với các cạnh hộp chữ nhật
    let pts_line = ()
    if b != 0 {
      let y_left = (-c - a * xmin) / b
      if y_left >= ymin and y_left <= ymax { pts_line.push((xmin, y_left)) }
      let y_right = (-c - a * xmax) / b
      if y_right >= ymin and y_right <= ymax { pts_line.push((xmax, y_right)) }
    }
    if a != 0 {
      let x_bot = (-c - b * ymin) / a
      if x_bot >= xmin and x_bot <= xmax { pts_line.push((x_bot, ymin)) }
      let x_top = (-c - b * ymax) / a
      if x_top >= xmin and x_top <= xmax { pts_line.push((x_top, ymax)) }
    }
    
    let clean_pts = ()
    for p in pts_line {
      let is_dup = false
      for q in clean_pts {
        if calc.abs(p.at(0) - q.at(0)) < 0.01 and calc.abs(p.at(1) - q.at(1)) < 0.01 { is_dup = true }
      }
      if not is_dup { clean_pts.push(p) }
    }
    
    // 2. Kiểm tra điểm (x, y) có thuộc miền bị gạch bỏ hay không
    let is_rejected(x, y) = {
      let val = a * x + b * y + c
      if sign == "<=" { val > 0.001 }
      else if sign == "<" { val >= -0.001 }
      else if sign == ">=" { val < -0.001 }
      else if sign == ">" { val <= 0.001 }
      else { false }
    }
    
    // Lưới tọa độ nhạt
    for x in range(xmin, xmax + 1) {
      line((x, ymin), (x, ymax), stroke: 0.2pt + rgb("e2e8f0"))
    }
    for y in range(ymin, ymax + 1) {
      line((xmin, y), (xmax, y), stroke: 0.2pt + rgb("e2e8f0"))
    }
    
    // Thuật toán gạch sọc chính xác từng đoạn thẳng
    let kmin = xmin - ymax
    let kmax = xmax - ymin
    let nk = std.int((kmax - kmin) / step)
    
    for i in range(0, nk + 1) {
      let k = kmin + i * step
      let seg_pts = ()
      let y1 = xmin - k
      if y1 >= ymin and y1 <= ymax { seg_pts.push((xmin, y1)) }
      let y2 = xmax - k
      if y2 >= ymin and y2 <= ymax { seg_pts.push((xmax, y2)) }
      let x3 = ymin + k
      if x3 >= xmin and x3 <= xmax { seg_pts.push((x3, ymin)) }
      let x4 = ymax + k
      if x4 >= xmin and x4 <= xmax { seg_pts.push((x4, ymax)) }
      
      let unique_seg = ()
      for p in seg_pts {
        let is_dup = false
        for q in unique_seg {
          if calc.abs(p.at(0) - q.at(0)) < 0.01 and calc.abs(p.at(1) - q.at(1)) < 0.01 { is_dup = true }
        }
        if not is_dup { unique_seg.push(p) }
      }
      
      if unique_seg.len() == 2 {
        let pA = unique_seg.at(0)
        let pB = unique_seg.at(1)
        let denom = a * (pB.at(0) - pA.at(0)) + b * (pB.at(1) - pA.at(1))
        let num = -c - a * pA.at(0) - b * pA.at(1)
        
        if calc.abs(denom) < 0.0001 {
          let mid_x = (pA.at(0) + pB.at(0)) / 2
          let mid_y = (pA.at(1) + pB.at(1)) / 2
          if is_rejected(mid_x, mid_y) {
            line(pA, pB, stroke: 0.45pt + rgb("94a3b8"))
          }
        } else {
          let t = num / denom
          if t >= 0 and t <= 1 {
            let p_int = (pA.at(0) + t * (pB.at(0) - pA.at(0)), pA.at(1) + t * (pB.at(1) - pA.at(1)))
            let mid1 = ((pA.at(0) + p_int.at(0)) / 2, (pA.at(1) + p_int.at(1)) / 2)
            if is_rejected(mid1.at(0), mid1.at(1)) {
              line(pA, p_int, stroke: 0.45pt + rgb("94a3b8"))
            }
            let mid2 = ((pB.at(0) + p_int.at(0)) / 2, (pB.at(1) + p_int.at(1)) / 2)
            if is_rejected(mid2.at(0), mid2.at(1)) {
              line(p_int, pB, stroke: 0.45pt + rgb("94a3b8"))
            }
          } else {
            let mid = ((pA.at(0) + pB.at(0)) / 2, (pA.at(1) + pB.at(1)) / 2)
            if is_rejected(mid.at(0), mid.at(1)) {
              line(pA, pB, stroke: 0.45pt + rgb("94a3b8"))
            }
          }
        }
      }
    }
    
    // 3. Hệ trục tọa độ Oxy
    line((xmin - 0.2, 0), (xmax + 0.6, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
    content((xmax + 0.7, 0), [$x$])
    line((0, ymin - 0.2), (0, ymax + 0.6), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
    content((0, ymax + 0.7), [$y$])
    content((-0.28, -0.28), [$O$])
    
    // 4. Đường thẳng bờ d
    if clean_pts.len() == 2 {
      let is_dashed = (sign == "<" or sign == ">")
      let strk = if is_dashed { (dash: "dashed", stroke: 1.3pt + rgb("2563eb")) } else { 1.3pt + rgb("2563eb") }
      line(clean_pts.at(0), clean_pts.at(1), stroke: strk)
    }
    
    // Giao điểm với Ox, Oy
    if a != 0 and b != 0 {
      let x0 = -c / a
      let y0 = -c / b
      if x0 >= xmin and x0 <= xmax and x0 != 0 {
        circle((x0, 0), radius: 1.8pt, fill: black)
        content((x0, -0.35), text(size: 9pt)[$#x0$])
      }
      if y0 >= ymin and y0 <= ymax and y0 != 0 {
        circle((0, y0), radius: 1.8pt, fill: black)
        content((-0.35, y0), text(size: 9pt)[$#y0$])
      }
    }
    
    // Nhãn tên đường thẳng
    if line-name != none and clean_pts.len() == 2 {
      let p_label = clean_pts.at(1)
      content((p_label.at(0) + 0.2, p_label.at(1) + 0.3), text(fill: rgb("2563eb"), size: 9pt, weight: "bold")[#line-name])
    }
  })
]

#show: lecture-theme.with(
  title: "BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 1)",
  subtitle: "ÔN TẬP CHƯƠNG 2 — MÃ ĐỀ: 101",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 101]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1: Nhận diện qua rút gọn hằng đẳng thức
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Sau khi rút gọn, bất phương trình nào sau đây trở thành bất phương trình bậc nhất hai ẩn?],
    (
        [$(x + y)^2 - x^2 <= 4$],
        True([$(x + 1)^2 - x^2 + 2y <= 5$]),
        [$(x + 1)(y - 1) > 2$],
        [$x^2 + y^2 - 4 >= 0$]
    ),
    loigiai: [
        Ta khai triển và rút gọn từng bất phương trình:
        - $(x + 1)^2 - x^2 + 2y <= 5 <=> x^2 + 2x + 1 - x^2 + 2y <= 5 <=> 2x + 2y <= 4$. Đây là bất phương trình bậc nhất hai ẩn $x, y$.
        - $(x + y)^2 - x^2 <= 4 <=> 2x y + y^2 <= 4$ (chứa tích $x y$ và $y^2$).
        - $(x + 1)(y - 1) > 2 <=> x y - x + y - 1 > 2$ (chứa tích $x y$).
        - $x^2 + y^2 - 4 >= 0$ là bất phương trình bậc hai.
    ]
)

// TN 2: Kiểm tra nghiệm phân số
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cặp số $(x; y) = (1/2; -1/3)$ là nghiệm của bất phương trình nào sau đây?],
    (
        [$2x + 3y > 1$],
        [$4x - 6y - 5 >= 0$],
        True([$6x + 9y + 1 >= 0$]),
        [$2x - 3y + 2 < 0$]
    ),
    loigiai: [
        Thay $x = 1/2, y = -1/3$ vào biểu thức $6x + 9y + 1$:
        $ 6 dot (1/2) + 9 dot (-1/3) + 1 = 3 - 3 + 1 = 1 >= 0 $ (Thỏa mãn).
    ]
)

// TN 3: BPT có bờ đi qua gốc tọa độ
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho bất phương trình $2x - 3y > 0$. Miền nghiệm của bất phương trình chứa điểm nào sau đây?],
    (
        [$O(0; 0)$],
        [$M(1; 1)$],
        True([$N(3; 1)$]),
        [$P(-2; 1)$]
    ),
    loigiai: [
        Thay tọa độ các điểm vào vế trái $f(x, y) = 2x - 3y$:
        - $f(0, 0) = 0 > 0$ (Sai).
        - $f(1, 1) = 2(1) - 3(1) = -1 > 0$ (Sai).
        - $f(3, 1) = 2(3) - 3(1) = 3 > 0$ (Đúng).
        - $f(-2, 1) = 2(-2) - 3(1) = -7 > 0$ (Sai).
    ]
)

// TN 4: BPT song song trục hoành
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Miền nghiệm của bất phương trình $y >= -2$ trên mặt phẳng tọa độ $O x y$ là:],
    (
        [Nửa mặt phẳng nằm phía dưới đường thẳng $y = -2$, kể cả bờ.],
        True([Nửa mặt phẳng nằm phía trên đường thẳng $y = -2$, kể cả bờ.]),
        [Nửa mặt phẳng nằm bên phải đường thẳng $x = -2$, không kể bờ.],
        [Nửa mặt phẳng nằm bên trái đường thẳng $x = -2$, kể cả bờ.]
    ),
    loigiai: [
        Đường thẳng $y = -2$ là đường thẳng song song với trục hoành $O x$.
        Bất phương trình $y >= -2$ lấy tất cả các điểm có tung độ từ $-2$ trở lên (nửa mặt phẳng phía trên) và kể cả đường bờ.
    ]
)

// TN 5: Đọc đồ thị Oxy
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Hình vẽ sau đây (phần không bị gạch chéo, kể cả bờ) biểu diễn miền nghiệm của bất phương trình nào?
#draw_bpt(
  a: 1,
  b: 1,
  c: -2,
  sign: "<=",
  xmin: -2,
  xmax: 4,
  ymin: -2,
  ymax: 4,
  line-name: [$x + y = 2$],
)
],
    (
        [$x + y > 2$],
        [$x + y < 2$],
        True([$x + y <= 2$]),
        [$x + y >= 2$]
    ),
    loigiai: [
        Đường thẳng bờ đi qua hai điểm $(2;0)$ và $(0;2)$ có phương trình $x + y = 2$.
        Đường nét liền nên lấy cả bờ. Phần không bị gạch chéo chứa gốc tọa độ $O(0;0)$.
        Thay $(0;0)$ vào biểu thức: $0 + 0 = 0 <= 2$.
        Vậy bất phương trình cần tìm là $x + y <= 2$.
    ]
)

// TN 6: Biến đổi quy đồng mẫu số
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Bất phương trình $(x - y)/2 <= (2x + y - 1)/3$ tương đương với bất phương trình nào sau đây?],
    (
        [$x + 5y - 2 <= 0$],
        True([$x + 5y - 2 >= 0$]),
        [$-x + 5y - 2 >= 0$],
        [$x - 5y + 2 <= 0$]
    ),
    loigiai: [
        Quy đồng khử mẫu số dương (mẫu chung là 6):
        $ 3(x - y) <= 2(2x + y - 1) <=> 3x - 3y <= 4x + 2y - 2 <=> -x - 5y + 2 <= 0 <=> x + 5y - 2 >= 0 $
    ]
)

// TN 7: Khoảng cách từ gốc tọa độ đến đường bờ
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Khoảng cách từ gốc tọa độ $O(0;0)$ đến đường thẳng bờ của bất phương trình $3x + 4y - 10 <= 0$ bằng:],
    (
        [$1$],
        True([$2$]),
        [$5$],
        [$10$]
    ),
    loigiai: [
        Đường thẳng bờ có phương trình $d: 3x + 4y - 10 = 0$.
        Khoảng cách từ $O(0;0)$ đến đường thẳng $d$ là:
        $ d(O, d) = (|3 dot 0 + 4 dot 0 - 10|) / (sqrt(3^2 + 4^2)) = 10 / 5 = 2 $
    ]
)

// TN 8: Điểm đối xứng qua trục Ox
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho bất phương trình $x - 2y + 3 > 0$. Điểm $A(1; 3)$ có điểm đối xứng qua trục hoành $O x$ là $A'$. Khẳng định nào sau đây đúng?],
    (
        [$A$ và $A'$ đều không thuộc miền nghiệm.],
        [$A$ thuộc miền nghiệm nhưng $A'$ không thuộc miền nghiệm.],
        True([$A'$ thuộc miền nghiệm nhưng $A$ không thuộc miền nghiệm.]),
        [$A$ và $A'$ đều thuộc miền nghiệm.]
    ),
    loigiai: [
        Điểm đối xứng của $A(1; 3)$ qua trục hoành $O x$ là $A'(1; -3)$.
        - Thay tọa độ $A(1; 3)$: $1 - 2(3) + 3 = -2 < 0 => A$ không thuộc miền nghiệm.
        - Thay tọa độ $A'(1; -3)$: $1 - 2(-3) + 3 = 10 > 0 => A'$ thuộc miền nghiệm.
    ]
)

// TN 9: Quan hệ góc phần tư
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Góc phần tư thứ II trên mặt phẳng $O x y$ ($x < 0, y > 0$) chứa điểm nào sau đây thuộc miền nghiệm của bất phương trình $2x + y + 5 > 0$?],
    (
        [$(-4; 1)$],
        [$(-3; 0)$],
        True([$(-1; 2)$]),
        [$(-1; -1)$]
    ),
    loigiai: [
        Điểm thuộc góc phần tư thứ II phải có $x < 0$ và $y > 0$.
        - Điểm $(-1; 2)$ có $x = -1 < 0, y = 2 > 0$ và $2(-1) + 2 + 5 = 5 > 0$ (Thỏa mãn).
        - $(-4; 1)$ có $2(-4) + 1 + 5 = -2 < 0$ (Loại).
    ]
)

// TN 10: Thực tế gói quà Tết
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Một cơ sở chuẩn bị các giỏ quà Tết gồm hai loại bánh: bánh quy (giá 60 nghìn đồng/hộp) và bánh socola (giá 90 nghìn đồng/hộp). Mỗi giỏ quà có ngân sách tối đa 450 nghìn đồng cho bánh. Gọi $x, y$ lần lượt là số hộp bánh quy và bánh socola trong một giỏ ($x, y in NN$). Bất phương trình mô tả giới hạn ngân sách là:],
    (
        [$3x + 2y <= 15$],
        True([$2x + 3y <= 15$]),
        [$2x + 3y >= 15$],
        [$6x + 9y <= 450$]
    ),
    loigiai: [
        Số tiền mua bánh là $60x + 90y$ (nghìn đồng).
        Điều kiện ngân sách: $60x + 90y <= 450$.
        Chia cả hai vế cho 30 ta được: $2x + 3y <= 15$.
    ]
)

// TN 11: Tham số m
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để cặp số $(m; m - 1)$ là nghiệm của bất phương trình $2x - y + 3 <= 0$.],
    (
        [$m >= -4$],
        True([$m <= -4$]),
        [$m <= 4$],
        [$m >= 4$]
    ),
    loigiai: [
        Thay $x = m, y = m - 1$ vào bất phương trình:
        $ 2m - (m - 1) + 3 <= 0 <=> m + 4 <= 0 <=> m <= -4 $
    ]
)

// TN 12: Điều kiện tham số để là BPT bậc nhất hai ẩn
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Tìm điều kiện của tham số $m$ để bất phương trình $(m^2 - 1)x^2 + 2x - 3y + 1 >= 0$ là bất phương trình bậc nhất hai ẩn.],
    (
        [$m != 1$],
        [$m != -1$],
        True([$m = 1$ hoặc $m = -1$]),
        [$m in RR$]
    ),
    loigiai: [
        Để bất phương trình không còn chứa số hạng bậc hai $x^2$, hệ số của $x^2$ phải triệt tiêu:
        $ m^2 - 1 = 0 <=> m = plus.minus 1 $
        Khi đó bất phương trình trở thành $2x - 3y + 1 >= 0$ (là BPT bậc nhất hai ẩn).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho bất phương trình bậc nhất hai ẩn $3x - 4y + 12 >= 0$ và hai điểm $A(0; 4), B(-2; 1)$. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Đường thẳng bờ của bất phương trình cắt trục tung $O y$ tại điểm $M(0; 3)$.]),
    True([Gốc tọa độ $O(0;0)$ thuộc miền nghiệm của bất phương trình.]),
    True([Điểm $A(0; 4)$ không thuộc miền nghiệm của bất phương trình.]),
    True([Hai điểm $O(0;0)$ và $B(-2; 1)$ nằm cùng phía đối với đường thẳng bờ $3x - 4y + 12 = 0$.])
  ),
  loigiai: [
    Đặt $f(x, y) = 3x - 4y + 12$.
    #step([Tìm giao điểm với trục Oy])
    Cho $x = 0 => -4y + 12 = 0 => y = 3 => M(0; 3)$. Vậy a) Đúng.

    #step([Kiểm tra gốc $O(0;0)$])
    $f(0, 0) = 12 >= 0$ (Đúng). Vậy $O(0;0)$ thuộc miền nghiệm. b) Đúng.

    #step([Kiểm tra điểm $A(0; 4)$])
    $f(0, 4) = 3(0) - 4(4) + 12 = -4 < 0$. Do $-4 >= 0$ là sai nên $A$ không thuộc miền nghiệm. c) Đúng.

    #step([Xét vị trí tương đối của O và B])
    $f(0, 0) = 12 > 0$ và $f(-2, 1) = 3(-2) - 4(1) + 12 = 2 > 0$.
    Vì $f(0, 0) dot f(-2, 1) = 12 dot 2 = 24 > 0$ nên hai điểm $O$ và $B$ nằm cùng phía đối với đường thẳng bờ. d) Đúng.
  ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho hình vẽ biểu diễn miền nghiệm của một bất phương trình trên mặt phẳng tọa độ $O x y$ (phần không bị gạch, kể cả bờ):
#draw_bpt(
  a: 1,
  b: -2,
  c: 2,
  sign: ">=",
  xmin: -4,
  xmax: 4,
  ymin: -2,
  ymax: 4,
  line-name: [$x - 2y + 2 = 0$],
)
],
  (
    True([Đường thẳng bờ của miền nghiệm có phương trình $x - 2y + 2 = 0$.]),
    True([Gốc tọa độ $O(0;0)$ thuộc miền nghiệm của bất phương trình.]),
    True([Bất phương trình tương ứng biểu diễn miền nghiệm là $x - 2y + 2 >= 0$.]),
    [Điểm $M(-4; 0)$ thuộc miền nghiệm của bất phương trình.]
  ),
  loigiai: [
    #step([Xác định phương trình đường thẳng bờ])
    Đường thẳng bờ đi qua $(-2; 0)$ và $(0; 1)$ có phương trình:
    $ (x)/(-2) + (y)/(1) = 1 <=> -x + 2y = 2 <=> x - 2y + 2 = 0 $
    Vậy a) Đúng.

    #step([Kiểm tra miền nghiệm chứa gốc tọa độ])
    Gốc tọa độ $O(0;0)$ nằm ở phần mặt phẳng không bị gạch chéo, tức là $O(0;0)$ thuộc miền nghiệm. Vậy b) Đúng.

    #step([Xác định bất phương trình])
    Thay $(0;0)$ vào biểu thức $x - 2y + 2$: ta có $0 - 0 + 2 = 2 >= 0$. 
    Vì miền nghiệm chứa $O(0;0)$ và lấy cả bờ nên BPT là $x - 2y + 2 >= 0$. Vậy c) Đúng.

    #step([Kiểm tra điểm $M(-4; 0)$])
    Thay $M(-4; 0)$ vào BPT: $-4 - 2(0) + 2 = -2 < 0$. Điểm $M$ thuộc miền bị gạch bỏ. Vậy d) Sai.
  ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Một thuê bao di động sử dụng gói cước trả trước: cước gọi nội mạng là $1$ nghìn đồng/phút và cước dung lượng 4G là $5$ nghìn đồng/GB. Khách hàng nạp vào tài khoản $100$ nghìn đồng. Gọi $x$ là số phút gọi nội mạng và $y$ là số GB dung lượng 4G đã sử dụng trong tháng ($x, y in NN$).],
  (
    True([Bất phương trình chi phí là $x + 5y <= 100$.]),
    True([Nếu khách hàng gọi 40 phút thì có thể dùng tối đa 12 GB data.]),
    [Nếu khách hàng dùng 15 GB data thì số phút gọi tối đa còn lại là 30 phút.],
    True([Có đúng 21 giá trị nguyên khác nhau của dung lượng 4G $y$ mà khách hàng có thể chọn dùng.])
  ),
  loigiai: [
    #step([Lập bất phương trình chi phí])
    Số tiền gọi là $1x = x$, số tiền data là $5y$. Tổng chi phí: $x + 5y <= 100$. Vậy a) Đúng.

    #step([Trường hợp gọi 40 phút ($x = 40$)])
    $40 + 5y <= 100 <=> 5y <= 60 <=> y <= 12$. Vậy tối đa 12 GB. b) Đúng.

    #step([Trường hợp dùng 15 GB ($y = 15$)])
    $x + 5(15) <= 100 <=> x + 75 <= 100 <=> x <= 25$ phút. Phát biểu 30 phút là Sai. c) Sai.

    #step([Số giá trị của y])
    Vì $x >= 0$ nên $5y <= 100 <=> y <= 20$. Vì $y in NN$ nên $y in {0; 1; 2; ...; 20}$ (có đúng 21 giá trị). d) Đúng.
  ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho bất phương trình $(m + 2)x + (2m - 1)y - 5 <= 0$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 1/2$, đường thẳng bờ của bất phương trình vuông góc với trục hoành $O x$.]),
    True([Điểm $N(-2; 1)$ luôn thuộc miền nghiệm của bất phương trình với mọi giá trị của tham số $m$.]),
    [Gốc tọa độ $O(0;0)$ không thuộc miền nghiệm của bất phương trình khi $m < 0$.],
    True([Khi $m = -2$, bất phương trình có miền nghiệm là nửa mặt phẳng $y >= -1$.])
  ),
  loigiai: [
    #step([Trường hợp $m = 1/2$])
    Khi $m = 1/2$, hệ số của $y$ bằng $2(1/2) - 1 = 0$, BPT trở thành $(5/2)x - 5 <= 0 <=> x <= 2$.
    Đường thẳng bờ $x = 2$ là đường thẳng đứng, vuông góc với $O x$. Vậy a) Đúng.

    #step([Kiểm tra điểm $N(-2; 1)$])
    Biến đổi bất phương trình theo tham số $m$:
    $ (m + 2)x + (2m - 1)y - 5 <= 0 <=> m(x + 2y) + 2x - y - 5 <= 0 $
    Thay tọa độ điểm $N(-2; 1)$ vào vế trái:
    $ m(-2 + 2 dot 1) + 2(-2) - 1 - 5 = m(0) - 10 = -10 <= 0 $
    Bất đẳng thức $-10 <= 0$ luôn ĐÚNG với mọi giá trị của tham số $m in RR$.
    Do đó điểm $N(-2; 1)$ luôn thuộc miền nghiệm của bất phương trình với mọi $m$. Vậy b) Đúng.

    #step([Kiểm tra gốc $O(0;0)$])
    Thay $(0; 0)$ vào BPT: $-5 <= 0$ (Luôn đúng với mọi $m$). Do đó $O(0;0)$ luôn thuộc miền nghiệm. Phát biểu c) Sai.

    #step([Trường hợp $m = -2$])
    Khi $m = -2$, BPT là $(0)x + (-5)y - 5 <= 0 <=> -5y <= 5 <=> y >= -1$. Vậy d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1: Đếm cặp nghiệm nguyên không âm
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho bất phương trình $2x + 3y <= 12$. Có tất cả bao nhiêu cặp số nguyên không âm $(x; y)$ thỏa mãn bất phương trình trên?],
    [19],
    loigiai: [
        #step([Điều kiện nguyên không âm])
        $x, y in NN$ và $3y <= 12 - 2x <= 12 => y in {0; 1; 2; 3; 4}$.
        
        #step([Đếm số giá trị của x theo từng y])
        - Với $y = 0: 2x <= 12 => x <= 6 => x in {0..6}$ (có 7 cặp).
        - Với $y = 1: 2x <= 9 => x <= 4.5 => x in {0..4}$ (có 5 cặp).
        - Với $y = 2: 2x <= 6 => x <= 3 => x in {0..3}$ (có 4 cặp).
        - Với $y = 3: 2x <= 3 => x <= 1.5 => x in {0; 1}$ (có 2 cặp).
        - Với $y = 4: 2x <= 0 => x = 0$ (có 1 cặp).
        
        #step([Tổng số cặp nghiệm])
        Tổng số cặp nguyên không âm là: $7 + 5 + 4 + 2 + 1 = 19$.
        (Kiểm tra lại: $y=0: 7; y=1: 5; y=2: 4; y=3: 2; y=4: 1 => 19$). Đáp số: 19.
    ]
)

// TLN 2: Kiểm tra đỉnh tam giác thuộc miền nghiệm
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có tọa độ các đỉnh là $A(1; 2), B(3; 0), C(0; 4)$. Có bao nhiêu đỉnh của tam giác $A B C$ thuộc miền nghiệm của bất phương trình $x + 2y - 5 <= 0$?],
    [2],
    loigiai: [
        #step([Thay tọa độ từng đỉnh vào bất phương trình])
        - Đỉnh $A(1; 2)$: $1 + 2(2) - 5 = 0 <= 0$ (Thỏa mãn).
        - Đỉnh $B(3; 0)$: $3 + 2(0) - 5 = -2 <= 0$ (Thỏa mãn).
        - Đỉnh $C(0; 4)$: $0 + 2(4) - 5 = 3 > 0$ (Không thỏa mãn).
        
        #step([Kết luận])
        Có đúng $2$ đỉnh ($A$ và $B$) thuộc miền nghiệm.
    ]
)

// TLN 3: Thực tế xưởng bánh
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Một xưởng bánh Trung thu sản xuất bánh nướng và bánh dẻo. Lượng bột đường dự trữ là $45$ kg. Mỗi chiếc bánh nướng cần $0.3$ kg bột, mỗi chiếc bánh dẻo cần $0.2$ kg bột. Nếu xưởng dự định làm ít nhất 50 chiếc bánh dẻo thì xưởng có thể làm tối đa bao nhiêu chiếc bánh nướng?],
    [116],
    loigiai: [
        #step([Thiết lập bất phương trình])
        Gọi $x$ là số bánh nướng ($x in NN$).
        Lượng bột dùng cho 50 bánh dẻo là $50 dot 0.2 = 10$ kg.
        Lượng bột còn lại cho bánh nướng không quá $45 - 10 = 35$ kg:
        $ 0.3x <= 35 <=> x <= 35 / 0.3 approx 116.67 $
        
        #step([Kết luận])
        Số bánh nướng tối đa có thể làm là $116$ chiếc.
    ]
)

// TLN 4: Tham số m để đoạn thẳng thuộc miền nghiệm
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Tìm giá trị nguyên dương nhỏ nhất của tham số $m$ để cả hai điểm $A(1; 1)$ và $B(2; 3)$ đều thuộc miền nghiệm của bất phương trình $m x - y + 2 >= 0$.],
    [1],
    loigiai: [
        #step([Điều kiện để A và B thuộc miền nghiệm])
        - Điểm $A(1; 1)$: $m(1) - 1 + 2 >= 0 <=> m + 1 >= 0 <=> m >= -1$.
        - Điểm $B(2; 3)$: $m(2) - 3 + 2 >= 0 <=> 2m - 1 >= 0 <=> m >= 1/2$.
        
        #step([Kết hợp điều kiện])
        Để cả hai điểm đều thuộc miền nghiệm thì $m >= 1/2$.
        Vì $m$ là số nguyên dương nên giá trị nhỏ nhất là $m = 1$.
    ]
)

// TLN 5: Diện tích tam giác vuông
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Đường thẳng bờ $d: 4x + 3y = 24$ cùng với hai trục tọa độ $O x, O y$ tạo thành một tam giác vuông. Tính diện tích của tam giác vuông đó.],
    [24],
    loigiai: [
        #step([Tìm giao điểm với các trục tọa độ])
        - Cắt trục hoành tại $A(6; 0) => O A = 6$.
        - Cắt trục tung tại $B(0; 8) => O B = 8$.
        
        #step([Tính diện tích tam giác vuông OAB])
        $ S = 1/2 dot O A dot O B = 1/2 dot 6 dot 8 = 24 $
    ]
)

// TLN 6: Đếm nghiệm nguyên có miền chặn
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Có tất cả bao nhiêu cặp số nguyên $(x; y)$ thỏa mãn đồng thời bất phương trình $x + y <= 3$ với $x in [0; 3]$ và $y in [0; 3]$?],
    [10],
    loigiai: [
        #step([Phân tích các giá trị của x trong đoạn [0; 3]])
        $x in {0; 1; 2; 3}$. Với mỗi $x$, ta có $0 <= y <= 3 - x$:
        - $x = 0 => 0 <= y <= 3 => y in {0; 1; 2; 3}$ (có 4 cặp).
        - $x = 1 => 0 <= y <= 2 => y in {0; 1; 2}$ (có 3 cặp).
        - $x = 2 => 0 <= y <= 1 => y in {0; 1}$ (có 2 cặp).
        - $x = 3 => 0 <= y <= 0 => y = 0$ (có 1 cặp).
        
        #step([Tổng số cặp nghiệm])
        Tổng số cặp nguyên là: $4 + 3 + 2 + 1 = 10$.
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 1)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
