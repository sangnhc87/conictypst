// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 3)
// Lớp: Khối 10  ·  Mã đề: 103  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 3)",
  subtitle: "ÔN TẬP CHƯƠNG 2 — MÃ ĐỀ: 103",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 103]],
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

// TN 1: Điều kiện để không phải là BPT bậc nhất hai ẩn
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cặp số $(a; b)$ nào sau đây làm cho bất phương trình $(a - 1)x + (b + 2)y + 5 <= 0$ KHÔNG PHẢI là bất phương trình bậc nhất hai ẩn?],
    (
        [$(1; 2)$],
        [$(-1; -2)$],
        True([$(1; -2)$]),
        [$(0; 0)$]
    ),
    loigiai: [
        Bất phương trình $A x + B y + C <= 0$ không phải là bậc nhất hai ẩn khi và chỉ khi cả hai hệ số $A$ và $B$ đồng thời bằng 0:
        $ cases(a - 1 = 0, b + 2 = 0) <=> cases(a = 1, b = -2) $
        Vậy cặp số cần tìm là $(1; -2)$.
    ]
)

// TN 2: Phân giác góc phần tư thứ I và III
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Bất phương trình đường phân giác của góc phần tư thứ nhất và thứ ba $x - y >= 0$ có miền nghiệm chứa điểm nào sau đây?],
    (
        [$A(1; 3)$],
        [$B(-2; 1)$],
        True([$C(2; 1)$]),
        [$D(-1; 2)$]
    ),
    loigiai: [
        Thay tọa độ điểm $C(2; 1)$ vào vế trái: $2 - 1 = 1 >= 0$ (Đúng).
        Do đó miền nghiệm chứa điểm $C(2; 1)$.
    ]
)

// TN 3: BPT giá trị tuyệt đối đưa về dải mặt phẳng
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Miền nghiệm của bất phương trình $|x| <= 2$ trên mặt phẳng tọa độ $O x y$ là:],
    (
        [Nửa mặt phẳng nằm bên phải đường thẳng $x = 2$.],
        [Hình tròn tâm $O(0;0)$ bán kính $R = 2$.],
        True([Dải mặt phẳng nằm giữa hai đường thẳng $x = -2$ và $x = 2$ (kể cả bờ).]),
        [Góc phần tư thứ nhất của hệ tọa độ.]
    ),
    loigiai: [
        Ta có $|x| <= 2 <=> -2 <= x <= 2$.
        Đây là tập hợp các điểm có hoành độ nằm trong đoạn $[-2; 2]$, tương ứng với dải mặt phẳng nằm giữa hai đường thẳng song song $x = -2$ và $x = 2$, kể cả hai đường thẳng bờ.
    ]
)

// TN 4: Đếm điểm nguyên trong hình tròn
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Có bao nhiêu điểm có tọa độ nguyên $(x; y)$ thỏa mãn $x^2 + y^2 <= 1$ thuộc miền nghiệm của bất phương trình $3x - 4y + 5 < 0$?],
    (
        True([$0$]),
        [$1$],
        [$2$],
        [$4$]
    ),
    loigiai: [
        Các điểm có tọa độ nguyên thỏa mãn $x^2 + y^2 <= 1$ gồm 5 điểm: $(0; 0), (1; 0), (-1; 0), (0; 1), (0; -1)$.
        Thay từng điểm vào $f(x, y) = 3x - 4y + 5$:
        - $f(0, 0) = 5 < 0$ (Sai).
        - $f(1, 0) = 8 < 0$ (Sai).
        - $f(-1, 0) = 2 < 0$ (Sai).
        - $f(0, 1) = 1 < 0$ (Sai).
        - $f(0, -1) = 9 < 0$ (Sai).
        Vậy có $0$ điểm thỏa mãn.
    ]
)

// TN 5: Đọc đồ thị Oxy dốc
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Hình vẽ sau đây (phần không bị gạch chéo, kể cả bờ) biểu diễn miền nghiệm của bất phương trình nào?
#draw_bpt(
  a: 1,
  b: 3,
  c: -3,
  sign: "<=",
  xmin: -2,
  xmax: 5,
  ymin: -2,
  ymax: 3,
  line-name: [$x + 3y = 3$],
)
],
    (
        [$x + 3y >= 3$],
        [$x + 3y > 3$],
        True([$x + 3y <= 3$]),
        [$x + 3y < 3$]
    ),
    loigiai: [
        Đường thẳng bờ đi qua $(3;0)$ và $(0;1)$ có phương trình $x + 3y = 3$.
        Đường nét liền và phần không bị gạch chứa gốc $O(0;0)$.
        Thay $(0;0)$: $0 + 0 = 0 <= 3$. Vậy BPT là $x + 3y <= 3$.
    ]
)

// TN 6: Đoạn thẳng không cắt đường thẳng bờ
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hai điểm $A(1; 2)$ và $B(m; 1)$. Tìm tất cả các giá trị của tham số $m$ để đoạn thẳng $A B$ KHÔNG CẮT đường thẳng $d: x + y - 4 = 0$.],
    (
        [$m > 3$],
        True([$m < 3$]),
        [$m <= 3$],
        [$m >= 3$]
    ),
    loigiai: [
        Đặt $f(x, y) = x + y - 4$.
        Ta có $f(A) = 1 + 2 - 4 = -1 < 0$.
        Để đoạn thẳng $A B$ không cắt đường thẳng $d$ thì $A$ và $B$ phải nằm cùng phía đối với $d$:
        $ f(A) dot f(B) > 0 <=> (-1) dot (m + 1 - 4) > 0 <=> -(m - 3) > 0 <=> m - 3 < 0 <=> m < 3 $
    ]
)

// TN 7: Tìm hệ số a, b của đường thẳng bờ
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Đường thẳng bờ $d: a x + b y = 6$ đi qua hai điểm $M(2; 0)$ và $N(0; 3)$. Tổng $a + b$ bằng:],
    (
        [$3$],
        [$4$],
        True([$5$]),
        [$6$]
    ),
    loigiai: [
        Thay tọa độ $M$ và $N$ vào phương trình đường thẳng:
        - $M(2; 0) in d => a(2) + b(0) = 6 => 2a = 6 => a = 3$.
        - $N(0; 3) in d => a(0) + b(3) = 6 => 3b = 6 => b = 2$.
        Vậy $a + b = 3 + 2 = 5$.
    ]
)

// TN 8: BPT không chứa gốc tọa độ
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Bất phương trình nào sau đây có miền nghiệm là nửa mặt phẳng KHÔNG CHỨA gốc tọa độ $O(0;0)$?],
    (
        [$2x - y + 3 >= 0$],
        [$x + 4y - 1 < 0$],
        True([$3x + 2y - 6 > 0$]),
        [$-x + y + 2 >= 0$]
    ),
    loigiai: [
        Thay $O(0;0)$ vào từng bất phương trình:
        - $3(0) + 2(0) - 6 = -6 > 0$ (Mệnh đề Sai).
        Do đó gốc $O(0;0)$ không thuộc miền nghiệm của bất phương trình $3x + 2y - 6 > 0$.
    ]
)

// TN 9: Miền nghiệm chứa hình vuông đơn vị
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Trong mặt phẳng $O x y$, hình vuông đơn vị có 4 đỉnh $O(0;0), A(1;0), B(1;1), C(0;1)$ nằm hoàn toàn trong miền nghiệm của bất phương trình nào sau đây?],
    (
        [$2x + y - 4 > 0$],
        True([$x + y - 3 <= 0$]),
        [$x - 2y + 1 < 0$],
        [$3x + 2y - 6 >= 0$]
    ),
    loigiai: [
        Thay 4 đỉnh của hình vuông vào biểu thức $x + y - 3$:
        - $O(0; 0): 0 + 0 - 3 = -3 <= 0$ (Đúng).
        - $A(1; 0): 1 + 0 - 3 = -2 <= 0$ (Đúng).
        - $B(1; 1): 1 + 1 - 3 = -1 <= 0$ (Đúng).
        - $C(0; 1): 0 + 1 - 3 = -2 <= 0$ (Đúng).
        Vậy cả 4 đỉnh đều thỏa mãn nên hình vuông nằm hoàn toàn trong miền nghiệm.
    ]
)

// TN 10: Thực tế điện mặt trời & điện gió
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một hộ gia đình lắp đặt hệ thống năng lượng tái tạo gồm pin mặt trời (mỗi tấm công suất $0.5$ kW) và tuabin gió mini (mỗi tuabin công suất $1.5$ kW). Gia đình muốn tổng công suất đạt tối thiểu $15$ kW. Gọi $x, y$ lần lượt là số tấm pin và số tuabin gió ($x, y in NN$). Bất phương trình mô tả điều kiện công suất là:],
    (
        [$3x + y >= 30$],
        True([$x + 3y >= 30$]),
        [$x + 3y <= 30$],
        [$0.5x + 1.5y <= 15$]
    ),
    loigiai: [
        Tổng công suất là $0.5x + 1.5y$ (kW).
        Yêu cầu tối thiểu $15$ kW: $0.5x + 1.5y >= 15$.
        Nhân cả hai vế với 2 ta được: $x + 3y >= 30$.
    ]
)

// TN 11: Bờ qua gốc tọa độ khi c = 0
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Bất phương trình bậc nhất hai ẩn $a x + b y <= c$ có đường thẳng bờ đi qua gốc tọa độ $O(0;0)$ khi và chỉ khi:],
    (
        [$a = 0$],
        [$b = 0$],
        True([$c = 0$]),
        [$a + b = c$]
    ),
    loigiai: [
        Đường thẳng $a x + b y = c$ đi qua $O(0;0) <=> a(0) + b(0) = c <=> c = 0$.
    ]
)

// TN 12: Miền nghiệm chứa 2 điểm O và A
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để miền nghiệm của bất phương trình $x + (m - 1)y <= 2$ chứa đồng thời cả hai điểm $O(0;0)$ và $A(1; 1)$.],
    (
        [$m >= 2$],
        True([$m <= 2$]),
        [$m <= 1$],
        [$m >= 1$]
    ),
    loigiai: [
        - Với $O(0; 0)$: $0 + (m-1)0 = 0 <= 2$ (Luôn đúng với mọi $m$).
        - Với $A(1; 1)$: $1 + (m - 1)(1) <= 2 <=> m <= 2$.
        Vậy $m <= 2$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Tính chất hình học góc nghiêng & đối xứng
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho bất phương trình bậc nhất hai ẩn $x - y + 2 >= 0$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đường thẳng bờ $d: x - y + 2 = 0$ tạo với tia $O x$ một góc bằng $45^compose$.]),
    [Điểm đối xứng của $M(3; 0)$ qua trục tung $O y$ là $M'(-3; 0)$ thuộc miền nghiệm của bất phương trình.],
    True([Mọi điểm nằm trên đường phân giác của góc phần tư thứ nhất $y = x$ đều thuộc miền nghiệm của bất phương trình.]),
    True([Miền nghiệm của bất phương trình bao gồm cả đường thẳng bờ $x - y + 2 = 0$.])
  ),
  loigiai: [
    #step([Tính góc tạo bởi đường bờ với trục Ox])
    Phương trình bờ: $y = x + 2 =>$ Hệ số góc $k = 1$.
    Vì $k = tan alpha = 1 => alpha = 45^compose$. Vậy a) Đúng.

    #step([Kiểm tra điểm đối xứng $M'(-3; 0)$])
    Thay $M'(-3; 0)$ vào BPT: $-3 - 0 + 2 = -1 < 0$. Do $-1 >= 0$ là sai nên $M'$ không thuộc miền nghiệm. b) Sai.

    #step([Kiểm tra các điểm trên đường thẳng $y = x$])
    Điểm trên đường thẳng $y = x$ có dạng $(t; t)$.
    Thay vào BPT: $t - t + 2 = 2 >= 0$ (Luôn đúng với mọi $t$). Vậy c) Đúng.

    #step([Tính chất bờ])
    BPT có dấu "$>=$" nên lấy cả đường biên. Vậy d) Đúng.
  ]
)

// DS 2: Đồ thị đường thẳng x = -2
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình vẽ biểu diễn miền nghiệm của một bất phương trình trên mặt phẳng tọa độ $O x y$ (phần không bị gạch chéo, kể cả bờ):
#draw_bpt(
  a: 1,
  b: 2,
  c: -4,
  sign: ">=",
  xmin: -2,
  xmax: 6,
  ymin: -2,
  ymax: 4,
  line-name: [$x + 2y - 4 = 0$],
)
],
  (
    True([Đường thẳng bờ của miền nghiệm cắt trục hoành tại $(4; 0)$ và trục tung tại $(0; 2)$.]),
    True([Gốc tọa độ $O(0;0)$ không thuộc miền nghiệm của bất phương trình.]),
    True([Bất phương trình tương ứng với hình vẽ là $x + 2y - 4 >= 0$.]),
    True([Điểm $M(2; 2)$ thuộc miền nghiệm của bất phương trình.])
  ),
  loigiai: [
    #step([Xác định phương trình đường bờ])
    Đường thẳng đi qua $(4; 0)$ và $(0; 2)$ có phương trình $x/4 + y/2 = 1 <=> x + 2y - 4 = 0$. Vậy a) Đúng.

    #step([Kiểm tra gốc $O(0;0)$])
    Gốc $O(0;0)$ nằm ở nửa mặt phẳng bị gạch bỏ nên $O(0;0)$ không thuộc miền nghiệm. Vậy b) Đúng.

    #step([Xác định bất phương trình])
    Thay $(0;0)$ vào $x + 2y - 4$: được $-4 < 0$. Do miền nghiệm không chứa $O(0;0)$ và lấy cả bờ nên BPT là $x + 2y - 4 >= 0$. Vậy c) Đúng.

    #step([Kiểm tra điểm $M(2; 2)$])
    Thay $M(2; 2)$ vào BPT: $2 + 2(2) - 4 = 2 >= 0$ (Đúng). Vậy d) Đúng.
  ]
)

// DS 3: Thực tế dự án trồng rừng
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một dự án trồng rừng phủ xanh đồi trọc gồm hai loại cây: cây keo lai (chi phí $20$ nghìn đồng/cây, hấp thụ $15$ kg $"CO"_2$/năm) và cây bạch đàn (chi phí $30$ nghìn đồng/cây, hấp thụ $20$ kg $"CO"_2$/năm). Ban quản lý dự án có ngân sách tối đa $60$ triệu đồng ($60000$ nghìn đồng) cho cây giống. Gọi $x$ là số cây keo lai và $y$ là số cây bạch đàn ($x, y in NN$).],
  (
    True([Bất phương trình ngân sách trồng rừng là $2x + 3y <= 6000$.]),
    True([Nếu dự án trồng $1500$ cây keo lai thì có thể trồng thêm tối đa $1000$ cây bạch đàn.]),
    [Nếu dự án trồng $2500$ cây keo lai và $500$ cây bạch đàn thì không bị vượt ngân sách.],
    True([Bất phương trình để tổng lượng khí $"CO"_2$ hấp thụ đạt tối thiểu $45$ tấn ($45000$ kg) mỗi năm là $3x + 4y >= 9000$.])
  ),
  loigiai: [
    #step([Lập bất phương trình ngân sách])
    Chi phí: $20x + 30y <= 60000 <=> 2x + 3y <= 6000$. Vậy a) Đúng.

    #step([Trường hợp 1500 cây keo lai])
    $2(1500) + 3y <= 6000 <=> 3y <= 3000 <=> y <= 1000$. Vậy tối đa 1000 cây bạch đàn. b) Đúng.

    #step([Trường hợp 2500 cây keo và 500 cây bạch đàn])
    $2(2500) + 3(500) = 5000 + 1500 = 6500 > 6000$ (Vượt quá ngân sách). Vậy c) Sai.

    #step([Bất phương trình hấp thụ CO2])
    Tổng lượng $"CO"_2$: $15x + 20y >= 45000 <=> 3x + 4y >= 9000$. Vậy d) Đúng.
  ]
)

// DS 4: Họ bất phương trình và điểm cố định
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho họ đường thẳng bờ $(m + 1)x + (m - 2)y - 3m = 0$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 2$, đường thẳng bờ trở thành $x = 2$.]),
    True([Đường thẳng bờ luôn đi qua điểm cố định $I(2; 1)$ với mọi giá trị của tham số $m$.]),
    True([Khi $m = -1$, đường thẳng bờ song song với trục hoành $O x$.]),
    [Không tồn tại giá trị nào của tham số $m$ để đường thẳng bờ đi qua gốc tọa độ $O(0;0)$.]
  ),
  loigiai: [
    #step([Trường hợp $m = 2$])
    Khi $m = 2$: $3x + 0y - 6 = 0 <=> 3x = 6 <=> x = 2$. Vậy a) Đúng.

    #step([Tìm điểm cố định])
    Phương trình bờ: $m(x + y - 3) + (x - 2y) = 0$.
    Điểm cố định thỏa mãn hệ:
    $ cases(x + y - 3 = 0, x - 2y = 0) <=> cases(x = 2y, 3y = 3) <=> cases(y = 1, x = 2) $
    Điểm cố định là $I(2; 1)$. Vậy b) Đúng.

    #step([Trường hợp $m = -1$])
    Khi $m = -1$: $0x - 3y + 3 = 0 <=> -3y = -3 <=> y = 1$ (Song song với trục hoành $O x$). Vậy c) Đúng.

    #step([Kiểm tra đường bờ đi qua gốc $O(0;0)$])
    Thay $(0; 0)$ vào phương trình: $-3m = 0 <=> m = 0$.
    Do tồn tại $m = 0$ nên mệnh đề "không tồn tại" là Sai. Vậy d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1: Điểm nguyên trong tam giác
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác $O A B$ có ba đỉnh là $O(0;0), A(6;0), B(0;4)$. Có tất cả bao nhiêu điểm có tọa độ nguyên $(x; y) in NN^*$ nằm nghiêm ngặt phía trong tam giác $O A B$?],
    [7],
    loigiai: [
        #step([Thiết lập điều kiện điểm trong tam giác OAB])
        Cạnh $A B$ đi qua $A(6; 0)$ và $B(0; 4)$ có phương trình:
        $ x/6 + y/4 = 1 <=> 2x + 3y = 12 $
        Điểm $(x; y) in NN^*$ ($x >= 1, y >= 1$) nằm nghiêm ngặt phía trong tam giác khi và chỉ khi:
        $ 2x + 3y < 12 $
        
        #step([Đếm số cặp (x; y)])
        - Với $y = 1: 2x < 12 - 3 = 9 => x < 4.5 => x in {1; 2; 3; 4}$ (có 4 điểm).
        - Với $y = 2: 2x < 12 - 6 = 6 => x < 3 => x in {1; 2}$ (có 2 điểm).
        - Với $y = 3: 2x < 12 - 9 = 3 => x < 1.5 => x = 1$ (có 1 điểm: $(1; 3)$).
        - Với $y >= 4: 2x < 0$ (Không có nghiệm nguyên dương).
        
        #step([Tổng số điểm])
        Tổng số điểm nguyên nằm phía trong tam giác là: $4 + 2 + 1 = 7$.
    ]
)

// TLN 2: Tìm GTLN trên miền số tự nhiên
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho các số tự nhiên $x, y$ thỏa mãn bất phương trình $x + y <= 5$. Tìm giá trị lớn nhất của biểu thức $F(x, y) = 3x + 2y$.],
    [15],
    loigiai: [
        #step([Đánh giá biểu thức F])
        Vì $x, y in NN$ và $x + y <= 5 => y <= 5 - x$.
        Ta có:
        $ F(x, y) = 3x + 2y <= 3x + 2(5 - x) = x + 10 $
        Vì $x <= 5$ nên $F(x, y) <= 5 + 10 = 15$.
        
        #step([Dấu đẳng thức])
        Dấu đẳng thức xảy ra khi $x = 5$ và $y = 0$ (thỏa mãn $x, y in NN$ và $5 + 0 = 5 <= 5$).
        Vậy giá trị lớn nhất là $15$.
    ]
)

// TLN 3: Thực tế phối trộn cà phê
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một xưởng chế biến cà phê phối trộn hai loại: Robusta (giá $80$ nghìn đồng/kg) và Arabica (giá $120$ nghìn đồng/kg). Một khách hàng có ngân sách tối đa $1.2$ triệu đồng ($1200$ nghìn đồng) và muốn mua đúng $5$ kg Arabica. Khách hàng đó có thể mua tối đa bao nhiêu kg Robusta (làm tròn lấy số nguyên kg)?],
    [7],
    loigiai: [
        #step([Lập bất phương trình chi phí])
        Gọi số kg cà phê Robusta là $x$ ($x >= 0$).
        Số tiền mua 5 kg Arabica là $5 dot 120 = 600$ (nghìn đồng).
        Tổng chi phí không vượt quá 1200 nghìn đồng:
        $ 80x + 600 <= 1200 <=> 80x <= 600 <=> x <= 600 / 80 = 7.5 $
        
        #step([Kết luận])
        Số kg nguyên tối đa có thể mua là $7$ kg.
    ]
)

// TLN 4: Tham số m để chứa trọn đoạn thẳng CD
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho bất phương trình $(m - 2)x + 3y - 6 <= 0$. Có tất cả bao nhiêu giá trị nguyên của tham số $m in [-5; 5]$ để miền nghiệm chứa cả hai điểm $C(1; 1)$ và $D(2; 0)$?],
    [11],
    loigiai: [
        #step([Điều kiện để C và D thuộc miền nghiệm])
        - Điểm $C(1; 1)$: $(m - 2)(1) + 3(1) - 6 <= 0 <=> m - 5 <= 0 <=> m <= 5$.
        - Điểm $D(2; 0)$: $(m - 2)(2) + 3(0) - 6 <= 0 <=> 2m - 10 <= 0 <=> m <= 5$.
        
        #step([Đếm số giá trị nguyên của m])
        Cả hai điều kiện đều là $m <= 5$.
        Với $m in [-5; 5]$ và $m in ZZ$, các giá trị của $m$ là:
        $ m in {-5; -4; -3; -2; -1; 0; 1; 2; 3; 4; 5} $
        Có tất cả $11$ giá trị nguyên.
    ]
)

// TLN 5: Diện tích hình tứ giác giới hạn bởi hai đường song song
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Trong góc phần tư thứ nhất, hai đường thẳng $d_1: x + y = 4$ và $d_2: x + y = 6$ cùng với hai trục tọa độ $O x, O y$ tạo thành một hình tứ giác. Tính diện tích của hình tứ giác đó.],
    [10],
    loigiai: [
        #step([Tính diện tích hai tam giác vuông])
        - Đường thẳng $d_2: x + y = 6$ tạo với hai trục tọa độ tam giác vuông $O A_2 B_2$ với $O A_2 = 6, O B_2 = 6$:
        $ S_2 = 1/2 dot 6 dot 6 = 18 $
        - Đường thẳng $d_1: x + y = 4$ tạo với hai trục tọa độ tam giác vuông $O A_1 B_1$ với $O A_1 = 4, O B_1 = 4$:
        $ S_1 = 1/2 dot 4 dot 4 = 8 $
        
        #step([Diện tích hình tứ giác])
        Diện tích tứ giác là:
        $ S = S_2 - S_1 = 18 - 8 = 10 $
    ]
)

// TLN 6: Đếm nghiệm nguyên dương có y >= 1
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Có tất cả bao nhiêu cặp số nguyên $(x; y)$ thỏa mãn bất phương trình $2x + 5y <= 20$ với điều kiện $x >= 0$ và $y >= 1$?],
    [18],
    loigiai: [
        #step([Phân tích theo các giá trị của $y >= 1$])
        Vì $x >= 0$ nên $5y <= 20 - 2x <= 20 => y <= 4$.
        Do $y$ nguyên và $y >= 1$ nên $y in {1; 2; 3; 4}$.
        
        #step([Đếm số giá trị của x theo từng y])
        - Với $y = 1: 2x <= 15 => x <= 7.5 => x in {0; 1; 2; 3; 4; 5; 6; 7}$ (có 8 cặp).
        - Với $y = 2: 2x <= 10 => x <= 5 => x in {0; 1; 2; 3; 4; 5}$ (có 6 cặp).
        - Với $y = 3: 2x <= 5 => x <= 2.5 => x in {0; 1; 2}$ (có 3 cặp).
        - Với $y = 4: 2x <= 0 => x = 0$ (có 1 cặp).
        
        #step([Tổng số cặp nghiệm])
        Tổng số cặp nguyên là: $8 + 6 + 3 + 1 = 18$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 3)!]      #v(0.6em)
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
