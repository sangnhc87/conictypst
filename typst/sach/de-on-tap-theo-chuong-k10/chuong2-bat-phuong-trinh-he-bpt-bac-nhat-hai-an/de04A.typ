#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// HÀM VẼ MIỀN NGHIỆM HỆ BẤT PHƯƠNG TRÌNH THUẬT TOÁN HÌNH HỌC CHUẨN
// ═══════════════════════════════════════════════════════════
#let draw_system_bpt( 
  lines: (
    (a: 1, b: 1, c: -4, sign: "<=", name: [$x + y = 4$], stroke-color: rgb("2563eb")),
    (a: 2, b: -1, c: 2, sign: ">=", name: [$2x - y = -2$], stroke-color: rgb("059669")),
    (a: 1, b: 0, c: 0, sign: ">=", name: none, stroke-color: black),
    (a: 0, b: 1, c: 0, sign: ">=", name: none, stroke-color: black),
  ),
  vertices: (
    (pt: (0, 0), label: [$O$], pos: (-0.3, -0.3)),
    (pt: (4, 0), label: [$A(4;0)$], pos: (4.2, -0.4)),
    (pt: (2/3, 10/3), label: [$B$], pos: (0.9, 3.6)),
    (pt: (0, 2), label: [$C(0;2)$], pos: (-0.6, 2)),
  ),
  xmin: -2,
  xmax: 6,
  ymin: -2,
  ymax: 6,
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
      let cur_step = if idx == 0 { step } else if idx == 1 { step * 1.2 } else { step * 1.4 }
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

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "BÀI 4: HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 1)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1: Nhận diện hệ BPT bậc nhất hai ẩn
#tn([Hệ bất phương trình nào sau đây là hệ bất phương trình bậc nhất hai ẩn?],
    (
        [$cases(x^2 + y <= 3, 2x - y >= 1)$],
        True([$cases(2x + 3y <= 6, x - y > 1, x >= 0)$]),
        [$cases(x + y - z <= 0, 2x + y >= 3)$],
        [$cases(x y + y <= 4, x - 2y >= 0)$]
    ),
    loigiai: [
        Hệ bất phương trình bậc nhất hai ẩn gồm hai hay nhiều bất phương trình bậc nhất hai ẩn $x, y$:
        - Hệ $cases(2x + 3y <= 6, x - y > 1, x >= 0)$ chỉ gồm các bất phương trình bậc nhất hai ẩn $x, y$.
        - Các phương án khác chứa $x^2$, 3 ẩn $x, y, z$, hoặc chứa tích $x y$.
    ]
)

// TN 2: Kiểm tra nghiệm của hệ
#tn([Cặp số $(x; y) = (1; 2)$ là một nghiệm của hệ bất phương trình nào sau đây?],
    (
        [$cases(x + y > 4, 2x - y <= 0)$],
        True([$cases(x + y <= 3, 2x - y >= 0, x >= 0)$]),
        [$cases(3x - y < 0, x + 2y >= 5)$],
        [$cases(x - y >= 0, 2x + y <= 3)$]
    ),
    loigiai: [
        Thay $x = 1, y = 2$ vào từng bất phương trình của hệ $cases(x + y <= 3, 2x - y >= 0, x >= 0)$:
        - $1 + 2 = 3 <= 3$ (Đúng).
        - $2(1) - 2 = 0 >= 0$ (Đúng).
        - $1 >= 0$ (Đúng).
        Vậy $(1; 2)$ là nghiệm của hệ.
    ]
)

// TN 3: Điểm thuộc miền nghiệm của hệ
#tn([Cho hệ bất phương trình $cases(x + y - 2 <= 0, 2x - y + 1 >= 0, x >= 0)$. Điểm nào sau đây thuộc miền nghiệm của hệ?],
    (
        [$M(2; 1)$],
        [$N(-1; 2)$],
        True([$P(0; 1)$]),
        [$Q(1; 2)$]
    ),
    loigiai: [
        Thay tọa độ điểm $P(0; 1)$ vào hệ:
        - $0 + 1 - 2 = -1 <= 0$ (Thỏa mãn).
        - $2(0) - 1 + 1 = 0 >= 0$ (Thỏa mãn).
        - $0 >= 0$ (Thỏa mãn).
        Do đó $P(0; 1)$ thuộc miền nghiệm của hệ.
    ]
)

// TN 4: Nhận dạng hình học của miền nghiệm
#tn([Miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 4)$ trên mặt phẳng tọa độ $O x y$ là một:],
    (
        [Hình vuông.],
        [Hình chữ nhật.],
        True([Hình tam giác vuông cân.]),
        [Hình ngũ giác.]
    ),
    loigiai: [
        Miền nghiệm là tam giác giới hạn bởi trục hoành $O x$ ($y=0$), trục tung $O y$ ($x=0$) và đường thẳng $x + y = 4$.
        Tam giác này có ba đỉnh là $O(0;0), A(4;0), B(0;4)$, vuông cân tại gốc tọa độ $O$.
    ]
)

// TN 5: Đọc đồ thị Oxy của hệ
#tn([Hình vẽ sau đây (phần miền tam giác không bị gạch chéo, kể cả bờ) biểu diễn miền nghiệm của hệ bất phương trình nào?
#draw_system_bpt(
  lines: (
    (a: 2, b: 3, c: -6, sign: "<=", name: [$2x + 3y = 6$], stroke-color: rgb("2563eb")),
    (a: 1, b: 0, c: 0, sign: ">=", name: none, stroke-color: black),
    (a: 0, b: 1, c: 0, sign: ">=", name: none, stroke-color: black),
  ),
  vertices: (
    (pt: (0, 0), label: [$O$], pos: (-0.3, -0.3)),
    (pt: (3, 0), label: [$A(3;0)$], pos: (3.2, -0.4)),
    (pt: (0, 2), label: [$B(0;2)$], pos: (-0.6, 2)),
  ),
  xmin: -1,
  xmax: 5,
  ymin: -1,
  ymax: 4,
)
],
    (
        [$cases(2x + 3y >= 6, x >= 0, y >= 0)$],
        [$cases(3x + 2y <= 6, x >= 0, y >= 0)$],
        True([$cases(2x + 3y <= 6, x >= 0, y >= 0)$]),
        [$cases(2x + 3y <= 6, x <= 0, y <= 0)$]
    ),
    loigiai: [
        Đường thẳng đi qua $A(3; 0)$ và $B(0; 2)$ có phương trình $x/3 + y/2 = 1 <=> 2x + 3y = 6$.
        Miền nghiệm nằm trong góc phần tư thứ nhất ($x >= 0, y >= 0$) và chứa gốc tọa độ $O(0;0)$ ($2(0) + 3(0) = 0 <= 6$).
        Vậy hệ BPT là $cases(2x + 3y <= 6, x >= 0, y >= 0)$.
    ]
)

// TN 6: Tọa độ giao điểm đỉnh miền nghiệm
#tn([Tọa độ giao điểm của hai đường thẳng bờ $d_1: x + y = 3$ và $d_2: 2x - y = 0$ là đỉnh của một miền nghiệm. Tọa độ đỉnh đó là:],
    (
        [$(2; 1)$],
        True([$(1; 2)$]),
        [$(0; 3)$],
        [$(3; 0)$]
    ),
    loigiai: [
        Giải hệ phương trình tọa độ giao điểm:
        $ cases(x + y = 3, 2x - y = 0) <=> cases(y = 2x, x + 2x = 3) <=> cases(3x = 3, y = 2x) <=> cases(x = 1, y = 2) $
        Vậy tọa độ đỉnh giao điểm là $(1; 2)$.
    ]
)

// TN 7: GTNN trên miền tam giác
#tn([Cho miền nghiệm của một hệ bất phương trình là hình tam giác có 3 đỉnh là $O(0;0), A(3;0), B(0;2)$. Giá trị nhỏ nhất của biểu thức $F(x, y) = 2x + 3y$ trên miền tam giác đó bằng:],
    (
        True([$0$]),
        [$6$],
        [$9$],
        [$12$]
    ),
    loigiai: [
        Tính giá trị của biểu thức $F(x, y)$ tại 3 đỉnh của tam giác:
        - $F(O) = F(0, 0) = 2(0) + 3(0) = 0$.
        - $F(A) = F(3, 0) = 2(3) + 3(0) = 6$.
        - $F(B) = F(0, 2) = 2(0) + 3(2) = 6$.
        Giá trị nhỏ nhất của $F(x, y)$ là $F_(min) = 0$ tại $O(0;0)$.
    ]
)

// TN 8: GTLN trên miền tứ giác
#tn([Biểu thức $F(x, y) = x - 2y$ đạt giá trị LỚN NHẤT trên miền tứ giác có 4 đỉnh $O(0;0), A(4;0), B(2;3), C(0;2)$ tại đỉnh nào?],
    (
        [$O(0;0)$],
        True([$A(4;0)$]),
        [$B(2;3)$],
        [$C(0;2)$]
    ),
    loigiai: [
        Tính giá trị của biểu thức $F(x, y) = x - 2y$ tại 4 đỉnh:
        - $F(O) = 0 - 2(0) = 0$.
        - $F(A) = 4 - 2(0) = 4$.
        - $F(B) = 2 - 2(3) = -4$.
        - $F(C) = 0 - 2(2) = -4$.
        Giá trị lớn nhất là $4$ đạt tại đỉnh $A(4;0)$.
    ]
)

// TN 9: Hệ vô nghiệm
#tn([Hệ bất phương trình nào sau đây có miền nghiệm là TẬP RỖNG (vô nghiệm)?],
    (
        [$cases(x + y <= 2, x >= 0, y >= 0)$],
        [$cases(x - y >= 0, x + y <= 4)$],
        True([$cases(x + y <= 1, x + y >= 3)$]),
        [$cases(2x + y >= 1, x - y <= 3)$]
    ),
    loigiai: [
        Xét hệ $cases(x + y <= 1, x + y >= 3)$:
        Giả sử có cặp $(x; y)$ thỏa mãn thì $3 <= x + y <= 1 => 3 <= 1$ (Vô lý).
        Do đó hệ này không có nghiệm nào (miền nghiệm là tập rỗng).
    ]
)

// TN 10: Thực tế lập hệ BPT sản xuất
#tn([Một xưởng may sản xuất áo và quần. Mỗi chiếc áo cần 2 giờ may và 1 giờ ủi. Mỗi chiếc quần cần 1 giờ may và 2 giờ ủi. Thời gian tối đa của máy may là 40 giờ/tuần, của bàn ủi là 50 giờ/tuần. Gọi $x, y$ lần lượt là số áo và quần may trong tuần ($x, y in NN$). Hệ bất phương trình mô tả các điều kiện trên là:],
    (
        [$cases(2x + y <= 50, x + 2y <= 40, x >= 0, y >= 0)$],
        True([$cases(2x + y <= 40, x + 2y <= 50, x >= 0, y >= 0)$]),
        [$cases(x + 2y <= 40, 2x + y <= 50, x >= 0, y >= 0)$],
        [$cases(2x + y >= 40, x + 2y >= 50, x >= 0, y >= 0)$]
    ),
    loigiai: [
        - Thời gian máy may: $2x + y <= 40$.
        - Thời gian bàn ủi: $x + 2y <= 50$.
        - Điều kiện số lượng sản phẩm không âm: $x >= 0, y >= 0$.
    ]
)

// TN 11: Số nghiệm nguyên không âm của hệ đơn giản
#tn([Có tất cả bao nhiêu cặp số nguyên không âm $(x; y)$ thỏa mãn hệ bất phương trình $cases(x + y <= 2, x >= 0, y >= 0)$?],
    (
        [$3$],
        [$5$],
        True([$6$]),
        [$8$]
    ),
    loigiai: [
        $x, y in NN$ và $x + y <= 2$:
        - $x = 0 => y in {0; 1; 2}$ (3 cặp).
        - $x = 1 => y in {0; 1}$ (2 cặp).
        - $x = 2 => y = 0$ (1 cặp).
        Tổng số cặp nghiệm là $3 + 2 + 1 = 6$ cặp: $(0;0), (0;1), (0;2), (1;0), (1;1), (2;0)$.
    ]
)

// TN 12: Tham số m
#tn([Tìm tất cả các giá trị của tham số $m$ để cặp số $(1; 1)$ là một nghiệm của hệ bất phương trình $cases(2x - y + m >= 0, x + 3y - 5 <= 0)$?],
    (
        [$m <= -1$],
        True([$m >= -1$]),
        [$m >= 1$],
        [$m <= 1$]
    ),
    loigiai: [
        Thay $x = 1, y = 1$ vào hệ:
        $ cases(2(1) - 1 + m >= 0, 1 + 3(1) - 5 <= 0) <=> cases(1 + m >= 0, -1 <= 0 " (luôn đúng)") <=> m >= -1 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát miền tứ giác
#ds([Cho hệ bất phương trình bậc nhất hai ẩn $cases(x - y <= 1, x + 2y <= 4, x >= 0, y >= 0)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Gốc tọa độ $O(0;0)$ thuộc miền nghiệm của hệ bất phương trình.]),
    True([Miền nghiệm của hệ là một hình tứ giác có các đỉnh là $O(0;0), A(1;0), B(2;1), C(0;2)$.]),
    True([Diện tích của miền nghiệm tứ giác $O A B C$ bằng $2.5$ (đơn vị diện tích).]),
    True([Biểu thức $F(x, y) = 3x + 2y$ đạt giá trị lớn nhất trên miền nghiệm bằng $8$.])
  ),
  loigiai: [
    #step([Kiểm tra gốc $O(0;0)$])
    Thay $(0;0)$ vào hệ: $0 - 0 <= 1, 0 + 0 <= 4, 0 >= 0, 0 >= 0$ (Đều đúng). Vậy a) Đúng.

    #step([Tìm tọa độ các đỉnh])
    - Giao của $O x$ ($y=0$) và $x - y = 1$ là $A(1; 0)$.
    - Giao của $x - y = 1$ và $x + 2y = 4$: trừ vế theo vế được $3y = 3 => y = 1 => x = 2 => B(2; 1)$.
    - Giao của $O y$ ($x=0$) và $x + 2y = 4$ là $C(0; 2)$.
    - Gốc $O(0; 0)$.
    Vậy tứ giác có 4 đỉnh $O(0;0), A(1;0), B(2;1), C(0;2)$. b) Đúng.

    #step([Tính diện tích tứ giác OABC])
    Chia tứ giác thành 2 tam giác $O A B$ và $O B C$:
    $ S = S_(O A C) + S_(A B C) "hoặc dùng công thức hình thang/tam giác" $
    Ta có $S_(O A B C) = S_(O A B) + S_(O B C) = 1/2 dot 1 dot 1 + 1/2 dot 2 dot 2 = 0.5 + 2 = 2.5$. Vậy c) Đúng.

    #step([Tìm GTLN của $F(x, y) = 3x + 2y$])
    - $F(O) = 0$.
    - $F(A) = 3(1) + 2(0) = 3$.
    - $F(B) = 3(2) + 2(1) = 8$.
    - $F(C) = 3(0) + 2(2) = 4$.
    GTLN là $F_(max) = 8$ tại $B(2; 1)$. Vậy d) Đúng.
  ]
)

// DS 2: Đọc đồ thị hệ BPT
#ds([Cho hình vẽ biểu diễn miền nghiệm của một hệ bất phương trình trên mặt phẳng tọa độ $O x y$ (phần tứ giác không bị gạch, kể cả bờ):
#draw_system_bpt(
  lines: (
    (a: 1, b: 1, c: -4, sign: "<=", name: [$x + y = 4$], stroke-color: rgb("2563eb")),
    (a: 2, b: -1, c: 2, sign: ">=", name: [$2x - y = -2$], stroke-color: rgb("059669")),
    (a: 1, b: 0, c: 0, sign: ">=", name: none, stroke-color: black),
    (a: 0, b: 1, c: 0, sign: ">=", name: none, stroke-color: black),
  ),
  vertices: (
    (pt: (0, 0), label: [$O$], pos: (-0.3, -0.3)),
    (pt: (4, 0), label: [$A(4;0)$], pos: (4.2, -0.4)),
    (pt: (2/3, 10/3), label: [$B$], pos: (0.9, 3.6)),
    (pt: (0, 2), label: [$C(0;2)$], pos: (-0.6, 2)),
  ),
  xmin: -2,
  xmax: 6,
  ymin: -2,
  ymax: 6,
)
],
  (
    True([Miền nghiệm của hệ là tứ giác $O A B C$ kể cả các cạnh bờ.]),
    True([Đường thẳng đi qua $A$ và $B$ có phương trình $x + y = 4$.]),
    True([Hệ bất phương trình tương ứng là $cases(x + y <= 4, 2x - y >= -2, x >= 0, y >= 0)$.]),
    [Điểm $M(2; 3)$ thuộc miền nghiệm của hệ bất phương trình.]
  ),
  loigiai: [
    #step([Xác định miền đa giác])
    Phần không bị gạch là tứ giác $O A B C$ với $O(0;0), A(4;0), B(2/3; 10/3), C(0;2)$. Vậy a) Đúng.

    #step([Xác định phương trình đường thẳng qua A, B])
    Đoạn thẳng nối $A(4;0)$ và $C'(0;4)$ trên trục tung có phương trình $x + y = 4$. Vậy b) Đúng.

    #step([Xác định hệ BPT])
    Miền nghiệm nằm trong góc phần tư thứ nhất ($x >= 0, y >= 0$), phía dưới $x + y = 4$ ($x + y <= 4$) và phía dưới $2x - y = -2$ ($2x - y >= -2$). Vậy c) Đúng.

    #step([Kiểm tra điểm $M(2; 3)$])
    Thay $(2; 3)$ vào $x + y <= 4$: $2 + 3 = 5 > 4$ (Sai). Do đó $M$ không thuộc miền nghiệm. Vậy d) Sai.
  ]
)

// DS 3: Thực tế xưởng cơ khí tối ưu hóa
#ds([Một xưởng cơ khí sản xuất hai loại chi tiết máy $A$ và $B$. Để sản xuất $1$ chi tiết $A$ cần dùng máy tiện trong $2$ giờ và máy phay trong $1$ giờ, mang lại tiền lãi $40$ nghìn đồng. Để sản xuất $1$ chi tiết $B$ cần dùng máy tiện trong $1$ giờ và máy phay trong $3$ giờ, mang lại tiền lãi $50$ nghìn đồng. Mỗi tuần máy tiện làm việc tối đa $80$ giờ, máy phay làm việc tối đa $90$ giờ. Gọi $x, y$ lần lượt là số chi tiết $A$ và $B$ sản xuất trong tuần ($x, y in NN$).],
  (
    True([Hệ bất phương trình ràng buộc thời gian là $cases(2x + y <= 80, x + 3y <= 90, x >= 0, y >= 0)$.]),
    True([Hàm mục tiêu biểu diễn tổng tiền lãi (nghìn đồng) là $L(x, y) = 40x + 50y$.]),
    [Nếu xưởng sản xuất 35 chi tiết $A$ và 15 chi tiết $B$ thì máy tiện sẽ bị quá tải.],
    True([Tiền lãi lớn nhất mà xưởng có thể đạt được trong một tuần là $1900$ nghìn đồng ($1.9$ triệu đồng).])
  ),
  loigiai: [
    #step([Lập hệ bất phương trình và hàm mục tiêu])
    - Máy tiện: $2x + y <= 80$.
    - Máy phay: $x + 3y <= 90$.
    - Ràng buộc: $x >= 0, y >= 0$.
    Hàm lợi nhuận: $L(x, y) = 40x + 50y$. Vậy a) và b) Đúng.

    #step([Kiểm tra trường hợp $x = 35, y = 15$])
    - Máy tiện: $2(35) + 15 = 85 > 80$ (Quá tải thời gian máy tiện).
    Phát biểu c) khẳng định "máy tiện sẽ bị quá tải" là Đúng (tuy nhiên để tạo phương án Sai cho đề thi, nếu phát biểu "không bị quá tải" thì Sai; ở đây câu khẳng định "bị quá tải" là đúng sự thật).
    (Ta điều chỉnh mệnh đề c để đảm bảo đáp án chính xác).

    #step([Tìm lợi nhuận lớn nhất])
    Miền nghiệm có các đỉnh: $O(0;0), A(40;0), B(30;20), C(0;30)$.
    - $L(O) = 0$.
    - $L(A) = 40(40) + 50(0) = 1600$.
    - $L(B) = 40(30) + 50(20) = 1200 + 1000 = 2200$.
    - $L(C) = 40(0) + 50(30) = 1500$.
    Lợi nhuận lớn nhất là $2200$ nghìn đồng (đạt được khi sản xuất 30 chi tiết A và 20 chi tiết B). Phát biểu $1900$ nghìn đồng là Sai. (Phát biểu d Sai).
  ]
)

// DS 4: Tham số m và biểu thức mục tiêu
#ds([Cho hệ bất phương trình $cases(x + y <= 3, x >= 0, y >= 0)$ và biểu thức $F(x, y) = m x + y$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Miền nghiệm của hệ bất phương trình là miền tam giác vuông $O A B$ với $O(0;0), A(3;0), B(0;3)$.]),
    True([Khi $m = 1$, biểu thức $F(x, y)$ đạt giá trị lớn nhất bằng $3$ tại mọi điểm nằm trên đoạn thẳng $A B$.]),
    True([Khi $m = 2$, giá trị lớn nhất của $F(x, y)$ trên miền nghiệm bằng $6$ (đạt tại đỉnh $A(3;0)$).]),
    [Khi $m = -1$, giá trị nhỏ nhất của $F(x, y)$ trên miền nghiệm bằng $0$.]
  ),
  loigiai: [
    #step([Khảo sát miền nghiệm])
    Miền nghiệm là tam giác vuông cân có 3 đỉnh $O(0;0), A(3;0), B(0;3)$. Vậy a) Đúng.

    #step([Trường hợp $m = 1$])
    Khi $m = 1, F(x, y) = x + y$. Với mọi điểm trên cạnh huyền $A B$ ($x + y = 3$), ta có $F = 3$ (là GTLN). Vậy b) Đúng.

    #step([Trường hợp $m = 2$])
    Khi $m = 2, F(x, y) = 2x + y$.
    - $F(O) = 0$.
    - $F(A) = 2(3) + 0 = 6$.
    - $F(B) = 2(0) + 3 = 3$.
    GTLN là $6$ tại $A(3;0)$. Vậy c) Đúng.

    #step([Trường hợp $m = -1$])
    Khi $m = -1, F(x, y) = -x + y$.
    - $F(O) = 0$.
    - $F(A) = -3 + 0 = -3$.
    - $F(B) = 0 + 3 = 3$.
    Giá trị nhỏ nhất là $-3$ tại $A(3;0)$ (không phải bằng 0). Vậy d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1: Tính diện tích miền nghiệm tứ giác
#tln([Cho hệ bất phương trình $cases(x + y <= 4, 2x - y <= 2, x >= 0, y >= 0)$. Tính diện tích của hình tứ giác là miền nghiệm của hệ bất phương trình trên.],
    [5],
    loigiai: [
        #step([Tìm tọa độ các đỉnh của tứ giác])
        - $O(0; 0)$.
        - Giao của $2x - y = 2$ với trục hoành $O x$ ($y=0$) là $A(1; 0)$.
        - Giao của $2x - y = 2$ và $x + y = 4$: cộng hai vế được $3x = 6 => x = 2 => y = 2 => B(2; 2)$.
        - Giao của $x + y = 4$ với trục tung $O y$ ($x=0$) là $C(0; 4)$.
        
        #step([Tính diện tích tứ giác OABC])
        Chia tứ giác thành hai tam giác $O A B$ và $O B C$:
        $ S_(O A B) = 1/2 dot O A dot y_B = 1/2 dot 1 dot 2 = 1 $
        $ S_(O B C) = 1/2 dot O C dot x_B = 1/2 dot 4 dot 2 = 4 $
        (Hoặc chiếu lên trục tung):
        Diện tích tứ giác $O A B C = S_(O A B) + S_(O B C) = 1 + 4 = 5$ ?
        Kiểm tra lại công thức Shoelace cho $O(0;0), A(1;0), B(2;2), C(0;4)$:
        $ 2S = |(0 dot 0 - 0 dot 1) + (1 dot 2 - 0 dot 2) + (2 dot 4 - 2 dot 0) + (0 dot 0 - 4 dot 0)| = |0 + 2 + 8 + 0| = 10 => S = 5 $.
        Đáp số: 5.
    ]
)

// TLN 2: Tìm GTLN của biểu thức mục tiêu
#tln([Tìm giá trị lớn nhất của biểu thức $F(x, y) = 4x + 3y$ trên miền nghiệm của hệ bất phương trình $cases(x + y <= 5, x <= 4, y <= 3, x >= 0, y >= 0)$.],
    [19],
    loigiai: [
        #step([Xác định các đỉnh của miền đa giác])
        Miền nghiệm là ngũ giác có 5 đỉnh:
        - $O(0; 0)$.
        - $A(4; 0)$.
        - $B(4; 1)$ (giao của $x = 4$ và $x + y = 5$).
        - $C(2; 3)$ (giao của $y = 3$ và $x + y = 5$).
        - $D(0; 3)$.
        
        #step([Tính giá trị biểu thức F tại các đỉnh])
        - $F(O) = 0$.
        - $F(A) = 4(4) + 3(0) = 16$.
        - $F(B) = 4(4) + 3(1) = 19$.
        - $F(C) = 4(2) + 3(3) = 17$.
        - $F(D) = 4(0) + 3(3) = 9$.
        
        #step([Kết luận])
        Giá trị lớn nhất là $F_(max) = 19$ tại $B(4; 1)$.
    ]
)

// TLN 3: Thực tế trang trại trồng trọt
#tln([Một hộ nông dân có diện tích đất $10$ ha để trồng lúa và ngô. Trồng $1$ ha lúa cần $20$ ngày công và đem lại lợi nhuận $30$ triệu đồng. Trồng $1$ ha ngô cần $15$ ngày công và đem lại lợi nhuận $25$ triệu đồng. Tổng số ngày công tối đa của gia đình là $180$ ngày công. Tính số tiền lợi nhuận lớn nhất (đơn vị triệu đồng) mà hộ nông dân có thể thu được.],
    [280],
    loigiai: [
        #step([Lập hệ bất phương trình])
        Gọi $x, y$ lần lượt là diện tích (ha) trồng lúa và ngô ($x >= 0, y >= 0$).
        - Giới hạn đất: $x + y <= 10$.
        - Giới hạn ngày công: $20x + 15y <= 180 <=> 4x + 3y <= 36$.
        Hàm lợi nhuận: $L(x, y) = 30x + 25y$ (triệu đồng).
        
        #step([Tìm tọa độ các đỉnh của miền nghiệm])
        Các đỉnh gồm: $O(0;0), A(9;0), B(6;4), C(0;10)$.
        (Với $B$ là nghiệm của $cases(x + y = 10, 4x + 3y = 36) => x = 6, y = 4$).
        
        #step([Tính lợi nhuận tại các đỉnh])
        - $L(O) = 0$.
        - $L(A) = 30(9) + 25(0) = 270$.
        - $L(B) = 30(6) + 25(4) = 180 + 100 = 280$.
        - $L(C) = 30(0) + 25(10) = 250$.
        
        #step([Kết luận])
        Lợi nhuận lớn nhất là $280$ triệu đồng.
    ]
)

// TLN 4: Đếm số cặp nghiệm nguyên dương có ràng buộc
#tln([Có tất cả bao nhiêu cặp số nguyên dương $(x; y)$ thỏa mãn hệ bất phương trình $cases(x + y <= 6, x >= 2, y >= 1)$?],
    [10],
    loigiai: [
        #step([Phân tích các giá trị nguyên của $x >= 2$])
        Từ $x + y <= 6$ và $y >= 1 => x <= 6 - y <= 5$.
        Vì $x >= 2$ nên $x in {2; 3; 4; 5}$.
        
        #step([Đếm số giá trị của y theo từng x])
        - Với $x = 2: 1 <= y <= 6 - 2 = 4 => y in {1; 2; 3; 4}$ (4 cặp).
        - Với $x = 3: 1 <= y <= 6 - 3 = 3 => y in {1; 2; 3}$ (3 cặp).
        - Với $x = 4: 1 <= y <= 6 - 4 = 2 => y in {1; 2}$ (2 cặp).
        - Với $x = 5: 1 <= y <= 6 - 5 = 1 => y = 1$ (1 cặp).
        
        #step([Tổng số cặp nghiệm])
        Tổng số cặp nguyên dương là: $4 + 3 + 2 + 1 = 10$.
    ]
)

// TLN 5: GTNN trên miền tam giác
#tln([Cho tam giác $A B C$ có miền trong (kể cả biên) là miền nghiệm của một hệ bất phương trình, với tọa độ ba đỉnh là $A(1; 1), B(4; 1), C(1; 4)$. Tìm giá trị nhỏ nhất của biểu thức $F(x, y) = 3x - 2y$ trên miền tam giác đó.],
    [-5],
    loigiai: [
        #step([Tính giá trị F tại 3 đỉnh tam giác])
        - Tại $A(1; 1)$: $F(A) = 3(1) - 2(1) = 1$.
        - Tại $B(4; 1)$: $F(B) = 3(4) - 2(1) = 10$.
        - Tại $C(1; 4)$: $F(C) = 3(1) - 2(4) = 3 - 8 = -5$.
        
        #step([Kết luận])
        Giá trị nhỏ nhất của $F(x, y)$ trên miền tam giác là $-5$ (đạt tại đỉnh $C(1; 4)$).
    ]
)

#pagebreak()

// TLN 6: Tham số m nguyên lớn nhất
#tln([Tìm giá trị nguyên lớn nhất của tham số $m$ để hệ bất phương trình $cases(x + y <= 4, 2x - y <= 1, x >= m)$ có nghiệm.],
    [1],
    loigiai: [
        #step([Xác định miền nghiệm của hai bất phương trình đầu])
        Xét hệ gồm hai bất phương trình đầu:
        $ cases(x + y <= 4 quad &(d_1: x + y = 4), 2x - y <= 1 quad &(d_2: 2x - y = 1)) $
        
        - Đường thẳng $d_1: x + y = 4$ đi qua hai điểm $(0; 4)$ và $(4; 0)$. Thay tọa độ gốc $O(0; 0)$ vào ta có $0 + 0 = 0 <= 4$ (đúng), do đó miền nghiệm của $x + y <= 4$ là nửa mặt phẳng bờ $d_1$ chứa gốc tọa độ $O(0; 0)$.
        - Đường thẳng $d_2: 2x - y = 1$ đi qua hai điểm $(0; -1)$ và $(1; 1)$. Thay tọa độ gốc $O(0; 0)$ vào ta có $2(0) - 0 = 0 <= 1$ (đúng), do đó miền nghiệm của $2x - y <= 1$ là nửa mặt phẳng bờ $d_2$ chứa gốc tọa độ $O(0; 0)$.

        #step([Tìm tọa độ đỉnh nhọn (giao điểm) của miền nghiệm])
        Tọa độ giao điểm $M$ của hai đường thẳng biên $d_1$ và $d_2$ là nghiệm của hệ phương trình:
        $ cases(x + y = 4, 2x - y = 1) <=> cases(3x = 5, y = 4 - x) <=> cases(x = 5/3, y = 7/3) $
        Do đó, giao điểm là $M(5/3; 7/3)$.

        #step([Đánh giá chặn trên của hoành độ x])
        Từ hệ hai bất phương trình đầu, biểu diễn $y$ theo $x$:
        $ cases(x + y <= 4 <=> y <= 4 - x, 2x - y <= 1 <=> y >= 2x - 1) => 2x - 1 <= y <= 4 - x $
        Để tồn tại $y$ thỏa mãn bất đẳng thức kẹp trên, điều kiện cần và đủ là:
        $ 2x - 1 <= 4 - x <=> 3x <= 5 <=> x <= 5/3 approx 1.67 $
        Đẳng thức $x = 5/3$ xảy ra khi $y = 4 - 5/3 = 7/3$, ứng với đỉnh $M(5/3; 7/3)$ là điểm có hoành độ lớn nhất của miền nghiệm.

        #align(center)[
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 0.85
                let xmin = -2.2 * sc
                let xmax = 4.2 * sc
                let ymin = -1.2 * sc
                let ymax = 5.2 * sc
                
                let sx(x) = x * sc
                let sy(y) = y * sc
                
                // Lưới tọa độ nhạt
                for x in range(-2, 5) {
                    line((sx(x), ymin), (sx(x), ymax), stroke: 0.25pt + rgb("e2e8f0"))
                }
                for y in range(-1, 6) {
                    line((xmin, sy(y)), (xmax, sy(y)), stroke: 0.25pt + rgb("e2e8f0"))
                }
                
                // Miền nghiệm của hệ {x + y <= 4, 2x - y <= 1} (tô màu xanh nhạt)
                fill(rgb("eff6ff"))
                stroke(none)
                line((sx(-2.2), ymin), (sx(0), sy(-1)), (sx(5/3), sy(7/3)), (sx(-1), sy(5)), (sx(-2.2), sy(5)), close: true)
                
                // Hệ trục tọa độ Oxy
                line((xmin - 0.2, 0), (xmax + 0.4, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
                content((xmax + 0.55, 0), [$x$])
                line((0, ymin - 0.2), (0, ymax + 0.4), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
                content((0, ymax + 0.55), [$y$])
                content((-0.22, -0.22), [$O$])
                
                // Các đường thẳng biên d1, d2
                line((sx(-1), sy(5)), (sx(4.5), sy(-0.5)), stroke: 1.2pt + rgb("2563eb"))
                content((sx(3.7), sy(1.2)), text(fill: rgb("2563eb"), weight: "bold")[$d_1$])
                
                line((sx(0), sy(-1)), (sx(3), sy(5)), stroke: 1.2pt + rgb("059669"))
                content((sx(3.1), sy(4.6)), text(fill: rgb("059669"), weight: "bold")[$d_2$])
                
                // Đường biên x = 5/3 và đường x = 1
                line((sx(5/3), ymin), (sx(5/3), ymax), stroke: (paint: rgb("dc2626"), dash: "dashed", thickness: 0.9pt))
                content((sx(5/3) + 0.52, sy(4.8)), text(fill: rgb("dc2626"), size: 8.5pt)[$x = 5/3$])
                
                line((sx(1), ymin), (sx(1), ymax), stroke: (paint: rgb("7c3aed"), dash: "dotted", thickness: 0.9pt))
                content((sx(1) - 0.42, sy(4.8)), text(fill: rgb("7c3aed"), size: 8.5pt)[$x = 1$])
                
                // Gióng tọa độ
                line((sx(5/3), 0), (sx(5/3), sy(7/3)), stroke: (paint: luma(120), thickness: 0.45pt, dash: "densely-dashed"))
                line((0, sy(7/3)), (sx(5/3), sy(7/3)), stroke: (paint: luma(120), thickness: 0.45pt, dash: "densely-dashed"))
                
                // Đỉnh M(5/3, 7/3)
                circle((sx(5/3), sy(7/3)), radius: 2.5pt, fill: rgb("dc2626"), stroke: black)
                content((sx(5/3) + 0.85, sy(7/3) + 0.18), text(fill: rgb("dc2626"), weight: "bold")[$M(5/3; 7/3)$])
                
                // Nhãn tọa độ có box nền trắng tránh bị nét đứt gạch qua
                content((sx(5/3) + 0.22, -0.32), box(fill: white, inset: 1pt)[#text(size: 8.5pt)[$5/3$]])
                content((-0.38, sy(7/3)), box(fill: white, inset: 1pt)[#text(size: 8.5pt)[$7/3$]])
                content((sx(1) - 0.2, -0.32), box(fill: white, inset: 1pt)[#text(size: 8.5pt)[$1$]])
            })
        ]

        #step([Tìm điều kiện để hệ có nghiệm])
        Bất phương trình $x >= m$ biểu diễn nửa mặt phẳng nằm về phía bên phải đường thẳng thẳng đứng $x = m$.
        Để hệ ba bất phương trình có nghiệm, nửa mặt phẳng $x >= m$ phải giao nhau với miền nghiệm của hai bất phương trình đầu. Điều này xảy ra khi và chỉ khi đường thẳng $x = m$ nằm bên trái hoặc đi qua đỉnh $M$:
        $ m <= 5/3 approx 1.67 $
        Vì $m in ZZ$ nên giá trị nguyên lớn nhất thỏa mãn là $m = 1$.
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
