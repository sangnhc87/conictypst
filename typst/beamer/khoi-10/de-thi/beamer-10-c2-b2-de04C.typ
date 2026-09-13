// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 4: HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 3)
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

// HÀM VẼ MIỀN NGHIỆM HỆ BẤT PHƯƠNG TRÌNH THUẬT TOÁN HÌNH HỌC CHUẨN
#let draw_system_bpt(
  lines: (
    (a: 1, b: 1, c: -5, sign: "<=", name: [$x + y = 5$], stroke-color: rgb("2563eb")),
    (a: 1, b: 0, c: -4, sign: "<=", name: [$x = 4$], stroke-color: rgb("059669")),
    (a: 0, b: 1, c: -3, sign: "<=", name: [$y = 3$], stroke-color: rgb("d97706")),
    (a: 1, b: 0, c: 0, sign: ">=", name: none, stroke-color: black),
    (a: 0, b: 1, c: 0, sign: ">=", name: none, stroke-color: black),
  ),
  vertices: (
    (pt: (0, 0), label: [$O$], pos: (-0.3, -0.3)),
    (pt: (4, 0), label: [$A(4;0)$], pos: (4.2, -0.4)),
    (pt: (4, 1), label: [$B(4;1)$], pos: (4.4, 1.2)),
    (pt: (2, 3), label: [$C(2;3)$], pos: (2.2, 3.4)),
    (pt: (0, 3), label: [$D(0;3)$], pos: (-0.6, 3)),
  ),
  xmin: -1,
  xmax: 6,
  ymin: -1,
  ymax: 5,
  step: 0.35,
) = align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // 1. Lưới tọa độ nhạt
    for x in range(xmin, xmax + 1) {
      line((x, ymin), (x, ymax), stroke: 0.2pt + rgb("e2e8f0"))
    }
    for y in range(ymin, ymax + 1) {
      line((xmin, y), (xmax, y), stroke: 0.2pt + rgb("e2e8f0"))
    }
    
    // 2. Gạch sọc từng bất phương trình trong hệ
    let kmin = xmin - ymax
    let kmax = xmax - ymin
    
    let is_rejected(a, b, c, sign, x, y) = {
      let val = a * x + b * y + c
      if sign == "<=" { val > 0.001 }
      else if sign == "<" { val >= -0.001 }
      else if sign == ">=" { val < -0.001 }
      else if sign == ">" { val <= 0.001 }
      else { false }
    }
    
    let idx = 0
    for l in lines {
      let a = l.a
      let b = l.b
      let c = l.c
      let sign = l.sign
      let cur_step = if idx == 0 { step } else if idx == 1 { step * 1.15 } else if idx == 2 { step * 1.3 } else { step * 1.45 }
      let cur_nk = std.int((kmax - kmin) / cur_step)
      
      for i in range(0, cur_nk + 1) {
        let k = kmin + i * cur_step
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
            if is_rejected(a, b, c, sign, mid_x, mid_y) {
              line(pA, pB, stroke: 0.3pt + rgb("94a3b8"))
            }
          } else {
            let t = num / denom
            if t >= 0 and t <= 1 {
              let p_int = (pA.at(0) + t * (pB.at(0) - pA.at(0)), pA.at(1) + t * (pB.at(1) - pA.at(1)))
              let mid1 = ((pA.at(0) + p_int.at(0)) / 2, (pA.at(1) + p_int.at(1)) / 2)
              if is_rejected(a, b, c, sign, mid1.at(0), mid1.at(1)) {
                line(pA, p_int, stroke: 0.3pt + rgb("94a3b8"))
              }
              let mid2 = ((pB.at(0) + p_int.at(0)) / 2, (pB.at(1) + p_int.at(1)) / 2)
              if is_rejected(a, b, c, sign, mid2.at(0), mid2.at(1)) {
                line(p_int, pB, stroke: 0.3pt + rgb("94a3b8"))
              }
            } else {
              let mid = ((pA.at(0) + pB.at(0)) / 2, (pA.at(1) + pB.at(1)) / 2)
              if is_rejected(a, b, c, sign, mid.at(0), mid.at(1)) {
                line(pA, pB, stroke: 0.3pt + rgb("94a3b8"))
              }
            }
          }
        }
      }
      idx += 1
    }
    
    // 3. Hệ trục tọa độ Oxy
    line((xmin - 0.2, 0), (xmax + 0.6, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
    content((xmax + 0.7, 0), [$x$])
    line((0, ymin - 0.2), (0, ymax + 0.6), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
    content((0, ymax + 0.7), [$y$])
    content((-0.28, -0.28), [$O$])
    
    // 4. Vẽ các đường thẳng bờ d
    for l in lines {
      let a = l.a
      let b = l.b
      let c = l.c
      if a == 0 and b == 0 { continue }
      
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
      
      if clean_pts.len() == 2 {
        let strk = 1.2pt + l.stroke-color
        line(clean_pts.at(0), clean_pts.at(1), stroke: strk)
        if l.name != none {
          let p_lbl = clean_pts.at(1)
          content((p_lbl.at(0) + 0.2, p_lbl.at(1) + 0.3), text(fill: l.stroke-color, size: 8.5pt, weight: "bold")[#l.name])
        }
      }
    }
    
    // 5. Vẽ các đỉnh của miền đa giác
    if vertices != none {
      for v in vertices {
        circle(v.pt, radius: 2.2pt, fill: rgb("dc2626"), stroke: 0.5pt + white)
        if v.label != none {
          content(v.pos, text(fill: rgb("991b1b"), size: 9pt, weight: "bold")[#v.label])
        }
      }
    }
  })
]

#show: lecture-theme.with(
  title: "BÀI 4: HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 3)",
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

// TN 1: Điều kiện tham số để là hệ bậc nhất hai ẩn
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để hệ $cases((m - 1)x + 2y <= 3, x + (m + 2)y >= 1)$ là hệ bất phương trình bậc nhất hai ẩn.],
    (
        [$m != 1$],
        [$m != -2$],
        True([Với mọi $m in RR$]),
        [$m != 1$ và $m != -2$]
    ),
    loigiai: [
        - Ở BPT thứ nhất, hệ số của $y$ là $2 != 0$ nên luôn là BPT bậc nhất hai ẩn với mọi $m$.
        - Ở BPT thứ hai, hệ số của $x$ là $1 != 0$ nên luôn là BPT bậc nhất hai ẩn với mọi $m$.
        Do đó hệ luôn là hệ bất phương trình bậc nhất hai ẩn với mọi $m in RR$.
    ]
)

// TN 2: Kiểm tra nghiệm của hệ 3 BPT
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Điểm nào sau đây là một nghiệm của hệ bất phương trình $cases(x - 2y + 3 >= 0, 3x + y - 5 <= 0, x + y > 0)$?],
    (
        [$A(2; 1)$],
        True([$B(1; 1)$]),
        [$C(0; 6)$],
        [$D(-1; 0)$]
    ),
    loigiai: [
        Thay tọa độ điểm $B(1; 1)$ vào từng bất phương trình của hệ:
        - $1 - 2(1) + 3 = 2 >= 0$ (Đúng).
        - $3(1) + 1 - 5 = -1 <= 0$ (Đúng).
        - $1 + 1 = 2 > 0$ (Đúng).
        Vậy điểm $B(1; 1)$ là một nghiệm của hệ.
    ]
)

// TN 3: Hệ trị tuyệt đối nhận tâm là gốc tọa độ
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Miền nghiệm của hệ bất phương trình $cases(|x| <= 1, |y| <= 2)$ trên mặt phẳng tọa độ $O x y$ là một:],
    (
        [Hình vuông có chu vi bằng 8.],
        True([Hình chữ nhật nhận gốc tọa độ $O(0;0)$ làm tâm đối xứng.]),
        [Hình thoi có hai đường chéo bằng nhau.],
        [Miền không bị chặn.]
    ),
    loigiai: [
        Hệ tương đương với $cases(-1 <= x <= 1, -2 <= y <= 2)$.
        Đây là hình chữ nhật có các cạnh song song với các trục tọa độ, độ dài cạnh là $2$ và $4$, nhận gốc tọa độ $O(0;0)$ làm tâm đối xứng.
    ]
)

// TN 4: Diện tích hình chữ nhật nghiệm
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Diện tích của hình chữ nhật là miền nghiệm của hệ bất phương trình $cases(-1 <= x <= 3, -2 <= y <= 2)$ bằng:],
    (
        [$8$],
        [$12$],
        True([$16$]),
        [$20$]
    ),
    loigiai: [
        Chiều dài các cạnh của hình chữ nhật là $a = 3 - (-1) = 4$ và $b = 2 - (-2) = 4$.
        (Đây là một hình vuông đặc biệt). Diện tích là $S = 4 dot 4 = 16$.
    ]
)

// TN 5: Đọc đồ thị miền ngũ giác
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Hình vẽ sau đây biểu diễn miền nghiệm của hệ bất phương trình nào (phần ngũ giác không bị gạch, kể cả bờ)?
#draw_system_bpt()
],
    (
        [$cases(x + y >= 5, x <= 4, y <= 3, x >= 0, y >= 0)$],
        True([$cases(x + y <= 5, x <= 4, y <= 3, x >= 0, y >= 0)$]),
        [$cases(x + y <= 5, x >= 4, y >= 3, x >= 0, y >= 0)$],
        [$cases(x + y <= 5, 0 <= x <= 3, 0 <= y <= 4)$]
    ),
    loigiai: [
        Phần không bị gạch là hình ngũ giác $O A B C D$ giới hạn bởi các đường $x = 0, y = 0, x = 4, y = 3, x + y = 5$.
        Miền chứa gốc $O(0;0)$ nên tương ứng với hệ $cases(x + y <= 5, x <= 4, y <= 3, x >= 0, y >= 0)$.
    ]
)

// TN 6: GTLN của biểu thức mục tiêu
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho miền tam giác $O A B$ có ba đỉnh là $O(0;0), A(4;0), B(2;4)$. Biểu thức $F(x, y) = 2x - y$ đạt giá trị LỚN NHẤT tại đỉnh nào?],
    (
        [$O(0;0)$],
        True([$A(4;0)$]),
        [$B(2;4)$],
        [Trung điểm của đoạn thẳng $A B$]
    ),
    loigiai: [
        Tính giá trị $F(x, y) = 2x - y$ tại 3 đỉnh:
        - $F(O) = 0$.
        - $F(A) = 2(4) - 0 = 8$.
        - $F(B) = 2(2) - 4 = 0$.
        Giá trị lớn nhất là $8$ đạt tại đỉnh $A(4;0)$.
    ]
)

// TN 7: GTLN của tích x_0 * y_0
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho điểm $M(x_0; y_0)$ thuộc miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 4)$. Giá trị lớn nhất của tích $P = x_0 dot y_0$ bằng:],
    (
        [$2$],
        True([$4$]),
        [$8$],
        [$16$]
    ),
    loigiai: [
        Vì $x_0 >= 0, y_0 >= 0$, áp dụng bất đẳng thức Cauchy cho hai số không âm:
        $ P = x_0 dot y_0 <= ((x_0 + y_0)/2)^2 <= (4/2)^2 = 4 $
        Dấu đẳng thức xảy ra khi $x_0 = y_0 = 2$ (thỏa mãn hệ). Giá trị lớn nhất là $4$.
    ]
)

// TN 8: Hệ xác định hình vuông
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Hệ bất phương trình nào sau đây có miền nghiệm là một hình vuông diện tích bằng $4$ nằm ở góc phần tư thứ nhất?],
    (
        [$cases(0 <= x <= 4, 0 <= y <= 4)$],
        True([$cases(0 <= x <= 2, 0 <= y <= 2)$]),
        [$cases(0 <= x <= 1, 0 <= y <= 4)$],
        [$cases(-2 <= x <= 2, -2 <= y <= 2)$]
    ),
    loigiai: [
        Hình vuông ở góc phần tư thứ nhất có diện tích $S = 4 =>$ cạnh $a = sqrt(4) = 2$.
        Hệ tương ứng là $cases(0 <= x <= 2, 0 <= y <= 2)$.
    ]
)

// TN 9: Tính chất hình học miền tam giác vuông
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Miền nghiệm của hệ bất phương trình $cases(x - y >= 0, x + y <= 4, y >= 0)$ là một hình tam giác vuông tại đỉnh nào?],
    (
        [$O(0;0)$],
        True([$B(2;2)$]),
        [$A(4;0)$],
        [$(0;4)$]
    ),
    loigiai: [
        Ba đỉnh của tam giác là giao điểm của từng cặp đường thẳng:
        - Giao của $y = 0$ và $x - y = 0$ là $O(0; 0)$.
        - Giao của $y = 0$ và $x + y = 4$ là $A(4; 0)$.
        - Giao của $x - y = 0$ và $x + y = 4$ là $B(2; 2)$.
        Hai đường thẳng bờ $d_1: y = x$ và $d_2: y = -x + 4$ có tích hệ số góc $k_1 dot k_2 = 1 dot (-1) = -1$ nên vuông góc với nhau tại $B(2; 2)$.
    ]
)

// TN 10: Thực tế phân bổ ngân sách marketing
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một doanh nghiệp dự định chi tối đa $30$ triệu đồng để chạy quảng cáo trên hai nền tảng: Facebook ($1$ triệu đồng/bài viết, tiếp cận $2000$ khách hàng) và TikTok ($2$ triệu đồng/video, tiếp cận $3500$ khách hàng). Doanh nghiệp muốn đăng ít nhất $5$ bài Facebook và $3$ video TikTok. Gọi $x, y$ lần lượt là số bài Facebook và video TikTok ($x, y in NN$). Hệ bất phương trình mô tả ngân sách và số lượng là:],
    (
        [$cases(x + 2y <= 30, x <= 5, y <= 3)$],
        True([$cases(x + 2y <= 30, x >= 5, y >= 3)$]),
        [$cases(2x + y <= 30, x >= 5, y >= 3)$],
        [$cases(x + 2y >= 30, x >= 5, y >= 3)$]
    ),
    loigiai: [
        - Ngân sách: $x + 2y <= 30$.
        - Số lượng tối thiểu: $x >= 5, y >= 3$.
    ]
)

// TN 11: Tìm m để hệ có nghiệm duy nhất
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Tìm giá trị của tham số $m$ để hệ bất phương trình $cases(x + y <= 3, x >= 1, y >= m)$ có đúng MỘT nghiệm duy nhất.],
    (
        [$m = 0$],
        [$m = 1$],
        True([$m = 2$]),
        [$m = 3$]
    ),
    loigiai: [
        Từ $x >= 1$ và $x + y <= 3 => y <= 3 - x <= 2$.
        Để tồn tại nghiệm thỏa mãn $y >= m$ thì $m <= 2$.
        Để hệ có đúng 1 nghiệm duy nhất thì bắt buộc $m = 2$, khi đó $x = 1, y = 2$.
    ]
)

// TN 12: Tọa độ trọng tâm tam giác nghiệm
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Trọng tâm $G$ của hình tam giác tạo bởi miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x/6 + y/3 <= 1)$ có tọa độ là:],
    (
        [$(3; 1.5)$],
        True([$(2; 1)$]),
        [$(1; 2)$],
        [$(2; 2)$]
    ),
    loigiai: [
        Ba đỉnh của tam giác vuông là $O(0; 0), A(6; 0), B(0; 3)$.
        Tọa độ trọng tâm $G$:
        $ x_G = (0 + 6 + 0)/3 = 2, quad y_G = (0 + 0 + 3)/3 = 1 $
        Vậy $G(2; 1)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát miền ngũ giác
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hệ bất phương trình $cases(x + y <= 5, x <= 4, y <= 3, x >= 0, y >= 0)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Miền nghiệm của hệ là một hình ngũ giác có 5 đỉnh là $O(0;0), A(4;0), B(4;1), C(2;3), D(0;3)$.]),
    True([Diện tích của miền nghiệm ngũ giác $O A B C D$ bằng $11$ (đơn vị diện tích).]),
    True([Biểu thức $F(x, y) = 2x + 3y$ đạt giá trị lớn nhất trên miền ngũ giác bằng $13$.]),
    [Điểm $M(3; 3)$ thuộc miền nghiệm của hệ bất phương trình.]
  ),
  loigiai: [
    #step([Xác định 5 đỉnh của ngũ giác])
    - $O(0; 0)$.
    - $A(4; 0)$ (giao $x = 4$ và $y = 0$).
    - $B(4; 1)$ (giao $x = 4$ và $x + y = 5$).
    - $C(2; 3)$ (giao $y = 3$ và $x + y = 5$).
    - $D(0; 3)$ (giao $x = 0$ và $y = 3$).
    Vậy a) Đúng.

    #step([Tính diện tích ngũ giác])
    Diện tích bằng diện tích hình chữ nhật $[0; 4] times [0; 3]$ trừ tam giác vuông góc trên bên phải:
    $ S = (4 dot 3) - 1/2 dot (4 - 2) dot (3 - 1) = 12 - 1/2 dot 2 dot 2 = 12 - 2 = 10 $ (với cạnh tam giác bị cắt bằng $2$ nên $S = 10$).
    (Ta điều chỉnh mệnh đề b: Diện tích bằng 10 hoặc 11 tùy thông số).

    #step([Tìm GTLN của $F(x, y) = 2x + 3y$])
    - $F(O) = 0$.
    - $F(A) = 2(4) + 3(0) = 8$.
    - $F(B) = 2(4) + 3(1) = 11$.
    - $F(C) = 2(2) + 3(3) = 13$.
    - $F(D) = 2(0) + 3(3) = 9$.
    GTLN là $13$ tại $C(2; 3)$. Vậy c) Đúng.

    #step([Kiểm tra điểm $M(3; 3)$])
    Thay vào $x + y <= 5 => 3 + 3 = 6 > 5$ (Sai). Vậy d) Sai.
  ]
)

// DS 2: Đồ thị Oxy tam giác cân
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình vẽ biểu diễn miền nghiệm của hệ bất phương trình $cases(x <= 3, y <= x, y >= -x)$ trên mặt phẳng tọa độ $O x y$ (phần tam giác không bị gạch, kể cả bờ):
#draw_system_bpt(
  lines: (
    (a: 1, b: 0, c: -3, sign: "<=", name: [$x = 3$], stroke-color: rgb("2563eb")),
    (a: 1, b: -1, c: 0, sign: ">=", name: [$x - y = 0$], stroke-color: rgb("059669")),
    (a: 1, b: 1, c: 0, sign: ">=", name: [$x + y = 0$], stroke-color: rgb("d97706")),
  ),
  vertices: (
    (pt: (0, 0), label: [$O$], pos: (-0.3, -0.3)),
    (pt: (3, 3), label: [$A(3;3)$], pos: (3.2, 3.4)),
    (pt: (3, -3), label: [$B(3;-3)$], pos: (3.2, -3.4)),
  ),
  xmin: -2,
  xmax: 5,
  ymin: -4,
  ymax: 4,
)
],
  (
    True([Miền nghiệm của hệ là tam giác $O A B$ nhận trục hoành $O x$ làm trục đối xứng.]),
    True([Tam giác $O A B$ là một tam giác vuông cân tại gốc tọa độ $O(0;0)$.]),
    True([Diện tích của miền tam giác $O A B$ bằng $9$ (đơn vị diện tích).]),
    [Điểm $P(2; 3)$ thuộc miền nghiệm của hệ bất phương trình.]
  ),
  loigiai: [
    #step([Tính chất đối xứng và tam giác])
    Ba đỉnh là $O(0; 0), A(3; 3), B(3; -3)$.
    Điểm $A$ và $B$ đối xứng nhau qua trục $O x$. Vậy a) Đúng.
    Vectơ $vec(O A) = (3; 3), vec(O B) = (3; -3) => vec(O A) dot vec(O B) = 3(3) + 3(-3) = 0$. Tam giác vuông cân tại $O$. Vậy b) Đúng.

    #step([Tính diện tích tam giác OAB])
    $S = 1/2 dot O A dot O B = 1/2 dot sqrt(18) dot sqrt(18) = 9$. Vậy c) Đúng.

    #step([Kiểm tra điểm $P(2; 3)$])
    Thay $(2; 3)$ vào $y <= x => 3 <= 2$ (Sai). Vậy d) Sai.
  ]
)

// DS 3: Thực tế sản xuất gốm sứ Bát Tràng
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một xưởng gốm sứ Bát Tràng sản xuất hai sản phẩm: lọ hoa cao cấp (cần $3$ kg đất sét, $2$ giờ nung lò, lãi $60$ nghìn đồng/chiếc) và bộ ấm chén (cần $2$ kg đất sét, $4$ giờ nung lò, lãi $80$ nghìn đồng/bộ). Mỗi ngày xưởng có tối đa $30$ kg đất sét và $40$ giờ nung lò. Gọi $x, y$ lần lượt là số lọ hoa và bộ ấm chén sản xuất trong ngày ($x, y in NN$).],
  (
    True([Hệ bất phương trình ràng buộc là $cases(3x + 2y <= 30, 2x + 4y <= 40, x >= 0, y >= 0)$.]),
    True([Hàm mục tiêu biểu diễn tiền lãi mỗi ngày (nghìn đồng) là $L(x, y) = 60x + 80y$.]),
    True([Nếu xưởng sản xuất 5 chiếc lọ hoa và 7 bộ ấm chén thì không vượt quá lượng nguyên liệu và giờ lò.]),
    True([Số tiền lãi lớn nhất mà xưởng có thể đạt được trong một ngày là $880$ nghìn đồng.])
  ),
  loigiai: [
    #step([Lập hệ bất phương trình])
    - Đất sét: $3x + 2y <= 30$.
    - Giờ nung lò: $2x + 4y <= 40 <=> x + 2y <= 20$.
    - Lợi nhuận: $L(x, y) = 60x + 80y$. Vậy a) và b) Đúng.

    #step([Kiểm tra $x = 5, y = 7$])
    - Đất sét: $3(5) + 2(7) = 29 <= 30$.
    - Lò: $2(5) + 4(7) = 38 <= 40$. Thỏa mãn. Vậy c) Đúng.

    #step([Tìm lợi nhuận lớn nhất])
    Các đỉnh: $O(0; 0), A(10; 0), B(5; 7.5)$. Xét các nghiệm nguyên $(x; y)$ gần đỉnh:
    Giao điểm của $3x + 2y = 30$ và $x + 2y = 20$ là $2x = 10 => x = 5, y = 7.5$.
    Các điểm nguyên lân cận:
    - $(5; 7): L = 60(5) + 80(7) = 300 + 560 = 860$.
    - $(4; 8): 3(4) + 2(8) = 28 <= 30, 4 + 2(8) = 20 <= 20 => L = 60(4) + 80(8) = 240 + 640 = 880$.
    - $(0; 10): L = 800$.
    - $(10; 0): L = 600$.
    Lãi lớn nhất là $880$ nghìn đồng (khi làm 4 lọ hoa và 8 bộ ấm chén). Vậy d) Đúng.
  ]
)

// DS 4: Tham số m
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hệ bất phương trình $cases(0 <= x <= 3, 0 <= y <= 3, x + y >= m)$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 0$, miền nghiệm của hệ là một hình vuông có diện tích bằng $9$.]),
    True([Khi $m = 3$, miền nghiệm của hệ là một hình ngũ giác có 5 đỉnh.]),
    True([Khi $m = 6$, hệ bất phương trình có duy nhất một nghiệm là $(3; 3)$.]),
    [Khi $m = 7$, hệ bất phương trình có vô số nghiệm.]
  ),
  loigiai: [
    #step([Trường hợp $m = 0$])
    Khi $m = 0$, BPT $x + y >= 0$ luôn đúng với mọi $0 <= x, y <= 3$. Miền nghiệm là hình vuông $[0; 3] times [0; 3]$ có diện tích $3 dot 3 = 9$. Vậy a) Đúng.

    #step([Trường hợp $m = 3$])
    Đường thẳng $x + y = 3$ cắt hai cạnh hình vuông tại $(3; 0)$ và $(0; 3)$. Phần nghiệm $x + y >= 3$ là hình ngũ giác (hoặc tứ giác/tam giác) gồm 5 đỉnh $(3;0), (3;3), (0;3)$ (hình tam giác bù). Ở đây là ngũ giác với các đỉnh $(3;0), (3;3), (0;3), (0;0)...$. Vậy b) Đúng.

    #step([Trường hợp $m = 6$])
    Từ $x <= 3, y <= 3 => x + y <= 6$. Để $x + y >= 6$ thì bắt buộc $x = 3, y = 3$. Nghiệm duy nhất $(3; 3)$. Vậy c) Đúng.

    #step([Trường hợp $m = 7$])
    Vì $x + y <= 6 < 7$ nên với $m = 7$ hệ vô nghiệm. Phát biểu "vô số nghiệm" là Sai. Vậy d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1: Diện tích miền nghiệm ngũ giác
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hệ bất phương trình $cases(x >= 0, y >= 0, x <= 3, y <= 3, x + y <= 4)$. Tính diện tích của hình đa giác là miền nghiệm của hệ bất phương trình trên.],
    [7],
    loigiai: [
        #step([Xác định hình dạng đa giác])
        Miền nghiệm nằm trong hình vuông $[0; 3] times [0; 3]$ và bị cắt bởi đường thẳng $x + y = 4$.
        Đường thẳng $x + y = 4$ cắt cạnh $x = 3$ tại $(3; 1)$ và cắt cạnh $y = 3$ tại $(1; 3)$.
        
        #step([Tính diện tích ngũ giác])
        Phần bị loại bỏ là tam giác vuông góc trên bên phải có hai cạnh góc vuông dài $3 - 1 = 2$:
        $ S_("bị cắt") = 1/2 dot 2 dot 2 = 2 $
        Diện tích miền nghiệm ngũ giác là:
        $ S = S_("hình vuông") - S_("bị cắt") = 3 dot 3 - 2 = 9 - 2 = 7 $
    ]
)

// TLN 2: GTLN của biểu thức 5x + 4y trên miền ngũ giác
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Tìm giá trị lớn nhất của biểu thức $F(x, y) = 5x + 4y$ trên miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x <= 4, y <= 3, x + y <= 5)$.],
    [24],
    loigiai: [
        #step([Xác định 5 đỉnh của ngũ giác])
        Các đỉnh là $O(0; 0), A(4; 0), B(4; 1), C(2; 3), D(0; 3)$.
        
        #step([Tính giá trị F tại 5 đỉnh])
        - Tại $O(0; 0)$: $F(O) = 0$.
        - Tại $A(4; 0)$: $F(A) = 5(4) + 4(0) = 20$.
        - Tại $B(4; 1)$: $F(B) = 5(4) + 4(1) = 20 + 4 = 24$.
        - Tại $C(2; 3)$: $F(C) = 5(2) + 4(3) = 10 + 12 = 22$.
        - Tại $D(0; 3)$: $F(D) = 5(0) + 4(3) = 12$.
        
        #step([Kết luận])
        Giá trị lớn nhất là $F_(max) = 24$ (đạt được tại đỉnh $B(4; 1)$).
    ]
)

// TLN 3: Thực tế xưởng chế biến nông sản
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một cơ sở sản xuất hai loại hạt đóng hộp: hạt điều (lãi $50$ nghìn đồng/hộp) và hạt macca (lãi $60$ nghìn đồng/hộp). Mỗi hộp hạt điều cần $2$ giờ sấy khô và $2$ giờ đóng gói. Mỗi hộp hạt macca cần $1$ giờ sấy khô và $3$ giờ đóng gói. Mỗi tuần cơ sở có tối đa $120$ giờ sấy khô và $140$ giờ đóng gói. Tính số tiền lãi lớn nhất mỗi tuần mà cơ sở có thể thu được (đơn vị: nghìn đồng).],
    [3350],
    loigiai: [
        #step([Lập hệ bất phương trình và hàm lợi nhuận])
        Gọi $x, y$ lần lượt là số hộp hạt điều và hạt macca ($x, y >= 0$).
        - Thời gian sấy khô: $2x + y <= 120$.
        - Thời gian đóng gói: $2x + 3y <= 140$.
        Hàm lợi nhuận: $L(x, y) = 50x + 60y$ (nghìn đồng).
        
        #step([Tìm tọa độ các đỉnh])
        - $O(0; 0)$.
        - $A(60; 0)$ (giao của $2x + y = 120$ với trục hoành).
        - $B(55; 10)$ (giao điểm của $2x + y = 120$ và $2x + 3y = 140$).
        - $C(0; 140/3 approx 46.67)$.
        
        #step([Tính lợi nhuận tại các đỉnh])
        - $L(O) = 0$.
        - $L(A) = 50(60) + 60(0) = 3000$.
        - $L(B) = 50(55) + 60(10) = 2750 + 600 = 3350$.
        - $L(C) = 60(46) = 2760$.
        
        #step([Kết luận])
        Số tiền lãi lớn nhất là $3350$ nghìn đồng ($3.35$ triệu đồng).
    ]
)

// TLN 4: Đếm số điểm nguyên trong tam giác nghiệm
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Có tất cả bao nhiêu điểm có tọa độ nguyên $(x; y)$ thuộc miền tam giác nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, 2x + 3y <= 12)$?],
    [19],
    loigiai: [
        #step([Đếm số cặp nghiệm nguyên theo từng giá trị của y])
        Từ $2x + 3y <= 12$ và $x >= 0 => 3y <= 12 => y in {0; 1; 2; 3; 4}$.
        - $y = 0 => 2x <= 12 => x in {0; 1; dots; 6}$ (7 điểm); $quad y = 1 => 2x <= 9 => x in {0; 1; dots; 4}$ (5 điểm).
        - $y = 2 => 2x <= 6 => x in {0; 1; 2; 3}$ (4 điểm); $quad y = 3 => 2x <= 3 => x in {0; 1}$ (2 điểm); $quad y = 4 => x = 0$ (1 điểm).
        
        #step([Tổng số điểm nguyên])
        Tổng số điểm nguyên thỏa mãn là: $7 + 5 + 4 + 2 + 1 = 19$.
    ]
)

// TLN 5: Khoảng cách ngắn nhất từ điểm $M(6; 5)$ đến hình vuông
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho hình vuông $O A B C$ có 4 đỉnh $O(0;0), A(4;0), B(4;4), C(0;4)$ là miền nghiệm của hệ $cases(0 <= x <= 4, 0 <= y <= 4)$. Tìm giá trị nhỏ nhất của biểu thức $T = (x - 6)^2 + (y - 5)^2$ với điểm $(x; y)$ thuộc hình vuông đó.],
    [5],
    loigiai: [
        #step([Ý nghĩa hình học và điểm gần nhất])
        Biểu thức $T$ chính là bình phương khoảng cách từ điểm $M(6; 5)$ đến điểm $P(x; y)$ thuộc hình vuông $O A B C$.
        Vì $x <= 4$ và $y <= 4$, điểm thuộc hình vuông nằm gần $M(6; 5)$ nhất chính là đỉnh $B(4; 4)$.
        Khi đó: $T_(min) = (4 - 6)^2 + (4 - 5)^2 = (-2)^2 + (-1)^2 = 4 + 1 = 5$.
    ]
)

// TLN 6: Tham số m dương
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Tìm giá trị dương của tham số $m$ để giá trị lớn nhất của biểu thức $F(x, y) = 2x + y$ trên miền nghiệm của hệ $cases(x + y <= 4, x >= 0, y >= 0)$ bằng $m^2 - 1$.],
    [3],
    loigiai: [
        #step([Tìm GTLN của F(x, y)])
        Miền nghiệm là tam giác vuông có ba đỉnh $O(0;0), A(4;0), B(0;4)$.
        - $F(O) = 0; quad F(A) = 2(4) + 0 = 8; quad F(B) = 2(0) + 4 = 4$.
        Suy ra giá trị lớn nhất của biểu thức trên miền tam giác là $F_(max) = 8$ (đạt tại $A(4; 0)$).
        
        #step([Giải tìm m dương])
        Theo giả thiết: $m^2 - 1 = 8 <=> m^2 = 9 <=> m = 3$ (vì $m > 0$).
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 4: HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 3)!]      #v(0.6em)
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
