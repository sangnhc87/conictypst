#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// HÀM VẼ MIỀN NGHIỆM HỆ BẤT PHƯƠNG TRÌNH THUẬT TOÁN HÌNH HỌC CHUẨN
// ═══════════════════════════════════════════════════════════
#let draw_system_bpt(
  lines: (
    (a: 1, b: 2, c: -6, sign: ">=", name: [$x + 2y = 6$], stroke-color: rgb("2563eb")),
    (a: 2, b: 1, c: -6, sign: ">=", name: [$2x + y = 6$], stroke-color: rgb("059669")),
    (a: 1, b: 0, c: 0, sign: ">=", name: none, stroke-color: black),
    (a: 0, b: 1, c: 0, sign: ">=", name: none, stroke-color: black),
  ),
  vertices: (
    (pt: (0, 6), label: [$A(0;6)$], pos: (-0.6, 6)),
    (pt: (2, 2), label: [$B(2;2)$], pos: (2.3, 2.4)),
    (pt: (6, 0), label: [$C(6;0)$], pos: (6.2, -0.4)),
  ),
  xmin: -2,
  xmax: 8,
  ymin: -2,
  ymax: 8,
  step: 0.4,
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
  exam-title: "BÀI 4: HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 2)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "102",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1: Rút gọn hệ phân thức về hệ chuẩn
#tn([Hệ bất phương trình nào sau đây tương đương với hệ $cases((x + 1)/2 - (y - 1)/3 >= 1, x - 2y <= 0)$?],
    (
        [$cases(3x - 2y - 1 <= 0, x - 2y <= 0)$],
        True([$cases(3x - 2y - 1 >= 0, x - 2y <= 0)$]),
        [$cases(3x - 2y + 5 >= 0, x - 2y <= 0)$],
        [$cases(2x - 3y - 1 >= 0, x - 2y <= 0)$]
    ),
    loigiai: [
        Quy đồng mẫu số chung là 6 ở bất phương trình thứ nhất:
        $ 3(x + 1) - 2(y - 1) >= 6 <=> 3x + 3 - 2y + 2 >= 6 <=> 3x - 2y - 1 >= 0 $
        Kết hợp với $x - 2y <= 0$, ta được hệ $cases(3x - 2y - 1 >= 0, x - 2y <= 0)$.
    ]
)

// TN 2: Điểm không thuộc miền nghiệm của hệ
#tn([Điểm nào sau đây KHÔNG THUỘC miền nghiệm của hệ bất phương trình $cases(2x + y >= 4, x - 2y <= 2, y >= 0)$?],
    (
        [$A(3; 1)$],
        [$B(2; 1)$],
        True([$M(0; 2)$]),
        [$C(4; 0)$]
    ),
    loigiai: [
        Thay tọa độ điểm $M(0; 2)$ vào bất phương trình thứ nhất:
        $ 2(0) + 2 = 2 >= 4 $ (Sai).
        Do đó điểm $M(0; 2)$ không thuộc miền nghiệm của hệ.
    ]
)

// TN 3: Đặc điểm miền nghiệm không bị chặn
#tn([Miền nghiệm của hệ bất phương trình $cases(x + 2y >= 6, 2x + y >= 6, x >= 0, y >= 0)$ có đặc điểm nào sau đây?],
    (
        [Là miền hình tam giác đóng kín.],
        [Là miền hình chữ nhật.],
        True([Là miền đa giác không bị chặn (mở về vô cùng).]),
        [Là tập rỗng (vô nghiệm).]
    ),
    loigiai: [
        Miền nghiệm là phần giao của các nửa mặt phẳng nằm phía trên các đường thẳng $x + 2y = 6$ và $2x + y = 6$ trong góc phần tư thứ nhất.
        Miền này kéo dài vô hạn khi $x, y -> +oo$, do đó nó là miền không bị chặn.
    ]
)

// TN 4: Giao điểm của hai đường biên
#tn([Cho hệ bất phương trình $cases(x + 2y >= 6, 2x + y >= 6, x >= 0, y >= 0)$. Tọa độ giao điểm của hai đường thẳng bờ $x + 2y = 6$ và $2x + y = 6$ là:],
    (
        [$(3; 3)$],
        True([$(2; 2)$]),
        [$(1; 4)$],
        [$(4; 1)$]
    ),
    loigiai: [
        Giải hệ phương trình:
        $ cases(x + 2y = 6, 2x + y = 6) <=> cases(2x + 4y = 12, 2x + y = 6) <=> cases(3y = 6, x = 6 - 2y) <=> cases(y = 2, x = 2) $
        Vậy tọa độ đỉnh giao điểm là $(2; 2)$.
    ]
)

// TN 5: Đồ thị miền không bị chặn
#tn([Hình vẽ sau đây biểu diễn miền nghiệm của hệ bất phương trình nào (phần không bị gạch, kể cả các đường bờ)?
#draw_system_bpt(
  lines: (
    (a: 1, b: 2, c: -6, sign: ">=", name: [$x + 2y = 6$], stroke-color: rgb("2563eb")),
    (a: 2, b: 1, c: -6, sign: ">=", name: [$2x + y = 6$], stroke-color: rgb("059669")),
    (a: 1, b: 0, c: 0, sign: ">=", name: none, stroke-color: black),
    (a: 0, b: 1, c: 0, sign: ">=", name: none, stroke-color: black),
  ),
  vertices: (
    (pt: (0, 6), label: [$A(0;6)$], pos: (-0.6, 6)),
    (pt: (2, 2), label: [$B(2;2)$], pos: (2.3, 2.4)),
    (pt: (6, 0), label: [$C(6;0)$], pos: (6.2, -0.4)),
  ),
  xmin: -2,
  xmax: 8,
  ymin: -2,
  ymax: 8,
)
],
    (
        [$cases(x + 2y <= 6, 2x + y <= 6, x >= 0, y >= 0)$],
        True([$cases(x + 2y >= 6, 2x + y >= 6, x >= 0, y >= 0)$]),
        [$cases(x + 2y >= 6, 2x + y <= 6, x >= 0, y >= 0)$],
        [$cases(x + 2y <= 6, 2x + y >= 6, x >= 0, y >= 0)$]
    ),
    loigiai: [
        Gốc tọa độ $O(0;0)$ nằm ở phần bị gạch chéo.
        Thay $O(0;0)$ vào $x + 2y - 6 = -6 < 0$ và $2x + y - 6 = -6 < 0$.
        Vì phần không bị gạch không chứa $O(0;0)$ và lấy phía trên nên hệ là $cases(x + 2y >= 6, 2x + y >= 6, x >= 0, y >= 0)$.
    ]
)

// TN 6: GTNN trên miền không bị chặn
#tn([Giá trị nhỏ nhất của biểu thức $F(x, y) = 3x + 2y$ trên miền nghiệm không bị chặn có các đỉnh $A(0; 6), B(2; 2), C(6; 0)$ bằng:],
    (
        [$6$],
        True([$10$]),
        [$12$],
        [$18$]
    ),
    loigiai: [
        Tính giá trị của biểu thức $F(x, y) = 3x + 2y$ tại 3 đỉnh:
        - $F(A) = F(0, 6) = 3(0) + 2(6) = 12$.
        - $F(B) = F(2, 2) = 3(2) + 2(2) = 6 + 4 = 10$.
        - $F(C) = F(6, 0) = 3(6) + 2(0) = 18$.
        Giá trị nhỏ nhất là $F_(min) = 10$ tại đỉnh $B(2; 2)$.
    ]
)

// TN 7: Điều kiện để hệ có nghiệm
#tn([Tìm tất cả các giá trị của tham số $m$ để hệ bất phương trình $cases(x + y <= 2, x + y >= m)$ có nghiệm.],
    (
        [$m > 2$],
        True([$m <= 2$]),
        [$m >= 2$],
        [$m < 2$]
    ),
    loigiai: [
        Hệ tương đương với dải mặt phẳng nằm giữa hai đường thẳng song song: $m <= x + y <= 2$.
        Để hệ có nghiệm (miền nghiệm không rỗng) thì $m <= 2$.
    ]
)

// TN 8: Diện tích hình chữ nhật nghiệm
#tn([Hệ bất phương trình $cases(1 <= x <= 4, -1 <= y <= 3)$ có miền nghiệm là một hình chữ nhật. Diện tích của hình chữ nhật đó bằng:],
    (
        [$7$],
        [$10$],
        True([$12$]),
        [$14$]
    ),
    loigiai: [
        Hình chữ nhật có chiều dài cạnh theo trục $O x$ là $4 - 1 = 3$, chiều dài cạnh theo trục $O y$ là $3 - (-1) = 4$.
        Diện tích hình chữ nhật là $S = 3 dot 4 = 12$.
    ]
)

// TN 9: Chu vi miền hình chữ nhật
#tn([Chu vi của hình chữ nhật là miền nghiệm của hệ bất phương trình $cases(0 <= x <= 5, 0 <= y <= 3)$ bằng:],
    (
        [$8$],
        [$15$],
        True([$16$]),
        [$30$]
    ),
    loigiai: [
        Hình chữ nhật có chiều dài các cạnh là $a = 5$ và $b = 3$.
        Chu vi hình chữ nhật là $P = 2(a + b) = 2(5 + 3) = 16$.
    ]
)

// TN 10: Thực tế trang trại bò sữa
#tn([Một trang trại bò sữa cần bổ sung dinh dưỡng hàng ngày tối thiểu $40$ đơn vị protein và $30$ đơn vị canxi từ hai loại thức ăn công nghiệp $X$ và $Y$. Mỗi bao loại $X$ chứa $2$ đơn vị protein, $1$ đơn vị canxi. Mỗi bao loại $Y$ chứa $1$ đơn vị protein, $2$ đơn vị canxi. Gọi $x, y$ lần lượt là số bao thức ăn $X$ và $Y$ sử dụng ($x, y in NN$). Hệ bất phương trình mô tả nhu cầu dinh dưỡng là:],
    (
        [$cases(2x + y <= 40, x + 2y <= 30, x >= 0, y >= 0)$],
        True([$cases(2x + y >= 40, x + 2y >= 30, x >= 0, y >= 0)$]),
        [$cases(x + 2y >= 40, 2x + y >= 30, x >= 0, y >= 0)$],
        [$cases(2x + y >= 30, x + 2y >= 40, x >= 0, y >= 0)$]
    ),
    loigiai: [
        - Nhu cầu protein tối thiểu $40$: $2x + y >= 40$.
        - Nhu cầu canxi tối thiểu $30$: $x + 2y >= 30$.
        - Số bao thức ăn không âm: $x >= 0, y >= 0$.
    ]
)

// TN 11: Đếm số điểm nguyên trong hình chữ nhật
#tn([Có tất cả bao nhiêu điểm có tọa độ nguyên $(x; y)$ thuộc miền nghiệm của hệ bất phương trình $cases(1 <= x <= 4, 2 <= y <= 5)$?],
    (
        [$12$],
        True([$16$]),
        [$20$],
        [$25$]
    ),
    loigiai: [
        - $x in {1; 2; 3; 4}$ có 4 giá trị nguyên.
        - $y in {2; 3; 4; 5}$ có 4 giá trị nguyên.
        Tổng số điểm nguyên là $4 dot 4 = 16$ điểm.
    ]
)

// TN 12: Tìm tham số m thuộc đoạn
#tn([Tìm tất cả các giá trị của tham số $m$ để điểm $M(m; 2)$ là nghiệm của hệ bất phương trình $cases(2x - y >= 0, x + 3y <= 10)$?],
    (
        [$m <= 1$],
        [$m >= 4$],
        True([$1 <= m <= 4$]),
        [$-1 <= m <= 4$]
    ),
    loigiai: [
        Thay $x = m, y = 2$ vào hệ:
        $ cases(2m - 2 >= 0, m + 3(2) <= 10) <=> cases(2m >= 2, m + 6 <= 10) <=> cases(m >= 1, m <= 4) <=> 1 <= m <= 4 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát hệ không bị chặn
#ds([Cho hệ bất phương trình bậc nhất hai ẩn $cases(2x + y >= 4, x + 2y >= 4, x >= 0, y >= 0)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Gốc tọa độ $O(0;0)$ không thuộc miền nghiệm của hệ bất phương trình.]),
    True([Miền nghiệm của hệ là một miền đa giác không bị chặn có 3 đỉnh là $A(0; 4), B(4/3; 4/3), C(4; 0)$.]),
    True([Biểu thức $F(x, y) = x + y$ đạt giá trị nhỏ nhất trên miền nghiệm bằng $8/3$.]),
    [Biểu thức $F(x, y) = x + y$ đạt giá trị lớn nhất trên miền nghiệm tại điểm $A(0; 4)$.]
  ),
  loigiai: [
    #step([Kiểm tra gốc $O(0;0)$])
    Thay $(0;0)$ vào $2x + y >= 4 => 0 >= 4$ (Sai). Do đó $O(0;0)$ không thuộc miền nghiệm. Vậy a) Đúng.

    #step([Tìm tọa độ các đỉnh])
    - $A$ là giao của $2x + y = 4$ với trục tung $O y$ ($x=0$) $=> A(0; 4)$.
    - $B$ là giao của $2x + y = 4$ và $x + 2y = 4 => B(4/3; 4/3)$.
    - $C$ là giao của $x + 2y = 4$ với trục hoành $O x$ ($y=0$) $=> C(4; 0)$.
    Miền nghiệm là miền không bị chặn có 3 đỉnh $A, B, C$. Vậy b) Đúng.

    #step([Tìm GTNN của $F(x, y) = x + y$])
    - $F(A) = 0 + 4 = 4$.
    - $F(B) = 4/3 + 4/3 = 8/3$.
    - $F(C) = 4 + 0 = 4$.
    Giá trị nhỏ nhất là $F_(min) = 8/3$ tại $B(4/3; 4/3)$. Vậy c) Đúng.

    #step([Xét giá trị lớn nhất])
    Vì miền nghiệm không bị chặn khi $x, y -> +oo$ nên $F(x, y) -> +oo$, biểu thức không có giá trị lớn nhất. Phát biểu d) Sai.
  ]
)

// DS 2: Đồ thị Oxy dải miền nghiệm song song
#ds([Cho hình vẽ biểu diễn miền nghiệm của hệ bất phương trình $cases(0 <= x - y <= 3, y >= 0)$ trên mặt phẳng $O x y$ (phần không bị gạch, kể cả bờ):
#draw_system_bpt(
  lines: (
    (a: 1, b: -1, c: 0, sign: ">=", name: [$x - y = 0$], stroke-color: rgb("2563eb")),
    (a: 1, b: -1, c: -3, sign: "<=", name: [$x - y = 3$], stroke-color: rgb("059669")),
    (a: 0, b: 1, c: 0, sign: ">=", name: none, stroke-color: black),
  ),
  vertices: (
    (pt: (0, 0), label: [$O$], pos: (-0.3, -0.3)),
    (pt: (3, 0), label: [$A(3;0)$], pos: (3.2, -0.4)),
  ),
  xmin: -2,
  xmax: 6,
  ymin: -1,
  ymax: 5,
)
],
  (
    True([Hai đường thẳng bờ $x - y = 0$ và $x - y = 3$ là hai đường thẳng song song với nhau.]),
    True([Gốc tọa độ $O(0;0)$ thuộc miền nghiệm của hệ bất phương trình.]),
    True([Điểm $M(4; 2)$ thuộc miền nghiệm của hệ bất phương trình.]),
    [Miền nghiệm của hệ là một miền đa giác đóng kín có diện tích hữu hạn.]
  ),
  loigiai: [
    #step([Tính chất song song])
    Hai đường thẳng có cùng hệ số $a=1, b=-1$ và hệ số tự do khác nhau nên song song. Vậy a) Đúng.

    #step([Kiểm tra gốc $O(0;0)$])
    $0 <= 0 - 0 = 0 <= 3$ và $0 >= 0$ (Đúng). Vậy b) Đúng.

    #step([Kiểm tra điểm $M(4; 2)$])
    $x - y = 4 - 2 = 2 in [0; 3]$ và $y = 2 >= 0$ (Đúng). Vậy c) Đúng.

    #step([Tính chất đóng/mở của miền])
    Dải mặt phẳng này kéo dài vô hạn khi $x, y -> +oo$, không bị chặn nên không phải miền đóng kín. Vậy d) Sai.
  ]
)

// DS 3: Thực tế chi phí vận tải tối ưu
#ds([Một công ty cần vận chuyển ít nhất $100$ tấn hàng và $120$ hành khách. Công ty có thể thuê hai loại xe: loại $A$ (giá thuê $4$ triệu đồng/chuyến, chở được $20$ tấn hàng và $15$ khách) và loại $B$ (giá thuê $3$ triệu đồng/chuyến, chở được $10$ tấn hàng và $30$ khách). Gọi $x, y$ lần lượt là số xe loại $A$ và $B$ cần thuê ($x, y in NN$).],
  (
    True([Hệ bất phương trình ràng buộc là $cases(2x + y >= 10, x + 2y >= 8, x >= 0, y >= 0)$.]),
    True([Hàm mục tiêu chi phí thuê xe (triệu đồng) là $C(x, y) = 4x + 3y$.]),
    True([Nếu thuê $4$ xe loại $A$ và $2$ xe loại $B$ thì vận chuyển được $100$ tấn hàng và $120$ khách.]),
    [Chi phí thuê xe thấp nhất mà công ty phải trả là $18$ triệu đồng.]
  ),
  loigiai: [
    #step([Lập hệ bất phương trình])
    - Hàng hóa: $20x + 10y >= 100 <=> 2x + y >= 10$.
    - Hành khách: $15x + 30y >= 120 <=> x + 2y >= 8$.
    - Chi phí: $C(x, y) = 4x + 3y$. Vậy a) và b) Đúng.

    #step([Kiểm tra $x = 4, y = 2$])
    - Hàng: $20(4) + 10(2) = 100$ tấn.
    - Khách: $15(4) + 30(2) = 120$ khách. Vừa đủ chỉ tiêu. Vậy c) Đúng.

    #step([Tìm chi phí nhỏ nhất])
    Các đỉnh của miền nghiệm: $A(0; 10), B(4; 2), C(8; 0)$.
    - $C(A) = 4(0) + 3(10) = 30$ triệu.
    - $C(B) = 4(4) + 3(2) = 16 + 6 = 22$ triệu.
    - $C(C) = 4(8) + 3(0) = 32$ triệu.
    Chi phí nhỏ nhất là $22$ triệu đồng (đạt khi thuê 4 xe A và 2 xe B). Phát biểu $18$ triệu đồng là Sai. Vậy d) Sai.
  ]
)

// DS 4: Tham số m và cấu trúc miền nghiệm
#ds([Cho hệ bất phương trình $cases(x + y <= 4, x - y <= 2, x >= m)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 0$, miền nghiệm của hệ nằm hoàn toàn ở nửa bên phải trục tung ($x >= 0$).]),
    True([Khi $m = 3$, miền nghiệm của hệ là miền tam giác có 3 đỉnh là $(3; 1), (3; -1), (3; 1)$ (suy biến thành đoạn thẳng).]),
    True([Giao điểm của hai đường thẳng $x + y = 4$ và $x - y = 2$ có tọa độ là $(3; 1)$.]),
    [Khi $m = 4$, hệ bất phương trình có vô số nghiệm.]
  ),
  loigiai: [
    #step([Trường hợp $m = 0$])
    Khi $m = 0, x >= 0$ là nửa mặt phẳng bên phải trục tung. Vậy a) Đúng.

    #step([Tìm giao điểm của 2 đường bờ])
    $cases(x + y = 4, x - y = 2) <=> 2x = 6 <=> x = 3 => y = 1$. Giao điểm là $(3; 1)$. Vậy c) Đúng.

    #step([Trường hợp $m = 3$])
    Với $x >= 3$: từ $x - y <= 2 => y >= x - 2 >= 1$ và $x + y <= 4 => y <= 4 - x <= 1 => y = 1$. Khi $x = 3, y = 1$. Điểm nghiệm duy nhất $(3; 1)$. Vậy b) Đúng.

    #step([Trường hợp $m = 4$])
    Nếu $x >= 4$, từ $x - y <= 2 => y >= 2$ nhưng $x + y <= 4 => y <= 0$, dẫn đến $2 <= y <= 0$ (Vô lý). Do đó khi $m = 4$ hệ vô nghiệm. Phát biểu "vô số nghiệm" là Sai. Vậy d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1: GTNN của biểu thức 2x + 3y
#tln([Cho hệ bất phương trình $cases(x + 2y >= 6, 2x + y >= 6, x >= 0, y >= 0)$. Tìm giá trị nhỏ nhất của biểu thức $F(x, y) = 2x + 3y$ trên miền nghiệm của hệ bất phương trình trên.],
    [10],
    loigiai: [
        #step([Xác định các đỉnh của miền nghiệm])
        Miền nghiệm có 3 đỉnh:
        - $A(0; 6)$ (giao của $2x + y = 6$ với trục tung).
        - $B(2; 2)$ (giao của $x + 2y = 6$ và $2x + y = 6$).
        - $C(6; 0)$ (giao của $x + 2y = 6$ với trục hoành).
        
        #step([Tính giá trị F tại các đỉnh])
        - Tại $A(0; 6)$: $F(A) = 2(0) + 3(6) = 18$.
        - Tại $B(2; 2)$: $F(B) = 2(2) + 3(2) = 4 + 6 = 10$.
        - Tại $C(6; 0)$: $F(C) = 2(6) + 3(0) = 12$.
        
        #step([Kết luận])
        Giá trị nhỏ nhất là $F_(min) = 10$ (đạt được tại $(2; 2)$).
    ]
)

// TLN 2: Diện tích hình bình hành
#tln([Tính diện tích của hình bình hành là miền nghiệm của hệ bất phương trình $cases(0 <= x <= 4, x <= y <= x + 3)$ trên mặt phẳng $O x y$.],
    [12],
    loigiai: [
        #step([Xác định 4 đỉnh của hình bình hành])
        - Điểm $O(0; 0)$ (giao của $x = 0$ và $y = x$).
        - Điểm $A(0; 3)$ (giao của $x = 0$ và $y = x + 3$).
        - Điểm $B(4; 7)$ (giao của $x = 4$ và $y = x + 3$).
        - Điểm $C(4; 4)$ (giao của $x = 4$ và $y = x$).
        
        #step([Tính diện tích])
        Đoạn thẳng $O A$ nằm trên trục tung có độ dài đáy $b = 3$.
        Khoảng cách giữa hai đường thẳng $x = 0$ và $x = 4$ là chiều cao $h = 4$.
        Diện tích hình bình hành là $S = b dot h = 3 dot 4 = 12$.
    ]
)

// TLN 3: Thực tế nhà máy nước ngọt
#tln([Một xưởng sản xuất hai loại nước giải khát: loại $A$ (cần $2$ kg đường, $1$ giờ máy chạy, lãi $40$ nghìn đồng/thùng) và loại $B$ (cần $1$ kg đường, $2$ giờ máy chạy, lãi $50$ nghìn đồng/thùng). Mỗi ngày xưởng có tối đa $100$ kg đường và $110$ giờ máy chạy. Số tiền lãi lớn nhất mỗi ngày mà xưởng có thể thu được là bao nhiêu nghìn đồng?],
    [3200],
    loigiai: [
        #step([Lập hệ bất phương trình và hàm lợi nhuận])
        Gọi $x, y$ lần lượt là số thùng loại $A$ và loại $B$ ($x, y >= 0$).
        - Đường: $2x + y <= 100$.
        - Thời gian máy: $x + 2y <= 110$.
        Hàm lợi nhuận: $L(x, y) = 40x + 50y$ (nghìn đồng).
        
        #step([Tính tọa độ các đỉnh])
        - $O(0; 0)$.
        - $A(50; 0)$ (giao của $2x + y = 100$ với trục hoành).
        - $B(30; 40)$ (giao điểm của $2x + y = 100$ và $x + 2y = 110$).
        - $C(0; 55)$ (giao của $x + 2y = 110$ với trục tung).
        
        #step([Tính lợi nhuận tại các đỉnh])
        - $L(O) = 0$.
        - $L(A) = 40(50) + 50(0) = 2000$.
        - $L(B) = 40(30) + 50(40) = 1200 + 2000 = 3200$.
        - $L(C) = 40(0) + 50(55) = 2750$.
        
        #step([Kết luận])
        Số tiền lãi lớn nhất là $3200$ nghìn đồng ($3.2$ triệu đồng).
    ]
)

// TLN 4: Đếm cặp số nguyên
#tln([Có tất cả bao nhiêu cặp số nguyên $(x; y)$ thỏa mãn hệ bất phương trình $cases(-2 <= x <= 2, x - 1 <= y <= x + 1)$?],
    [15],
    loigiai: [
        #step([Phân tích các giá trị nguyên của x])
        Có 5 giá trị nguyên của $x in {-2; -1; 0; 1; 2}$.
        
        #step([Đếm số giá trị của y theo từng x])
        Với mỗi giá trị của $x$, bất đẳng thức $x - 1 <= y <= x + 1$ cho đúng 3 giá trị nguyên của $y$ là $\{x - 1; x; x + 1\}$.
        
        #step([Tổng số cặp nghiệm])
        Tổng số cặp nguyên là $5 dot 3 = 15$ cặp.
    ]
)

// TLN 5: GTLN của biểu thức 5x + 3y
#tln([Cho hệ bất phương trình $cases(x + y <= 6, 2x + y <= 8, x >= 0, y >= 0)$. Tìm giá trị lớn nhất của biểu thức $F(x, y) = 5x + 3y$ trên miền nghiệm của hệ.],
    [22],
    loigiai: [
        #step([Xác định các đỉnh của miền tứ giác])
        - $O(0; 0)$.
        - $A(4; 0)$ (giao của $2x + y = 8$ với trục hoành).
        - $B(2; 4)$ (giao của $2x + y = 8$ và $x + y = 6$).
        - $C(0; 6)$ (giao của $x + y = 6$ với trục tung).
        
        #step([Tính giá trị F tại 4 đỉnh])
        - $F(O) = 0$.
        - $F(A) = 5(4) + 3(0) = 20$.
        - $F(B) = 5(2) + 3(4) = 10 + 12 = 22$.
        - $F(C) = 5(0) + 3(6) = 18$.
        
        #step([Kết luận])
        Giá trị lớn nhất là $F_(max) = 22$ (đạt được tại $(2; 4)$).
    ]
)

// TLN 6: Tham số m nguyên nhỏ nhất
#tln([Tìm giá trị nguyên nhỏ nhất của tham số $m$ để hệ bất phương trình $cases(x + y >= 5, x <= 3, y <= m)$ có nghiệm.],
    [2],
    loigiai: [
        #step([Đánh giá chặn dưới của tung độ y])
        Từ hai bất phương trình đầu của hệ, ta có:
        $ cases(x + y >= 5 <=> y >= 5 - x, x <= 3 <=> -x >= -3) => y >= 5 - x >= 5 - 3 = 2 $
        Đẳng thức $y = 2$ đạt được khi $x = 3$, ứng với điểm biên $M(3; 2)$ thuộc miền nghiệm của hai bất phương trình đầu. Do đó, tung độ nhỏ nhất trong miền nghiệm là $y_(min) = 2$.
        
        #step([Tìm điều kiện của tham số m để hệ có nghiệm])
        Bất phương trình thứ ba $y <= m$ biểu diễn nửa mặt phẳng nằm phía dưới đường thẳng nằm ngang $y = m$.
        Để hệ ba bất phương trình có nghiệm, nửa mặt phẳng $y <= m$ phải có điểm chung với miền nghiệm của hai bất phương trình đầu, điều này tương đương với:
        $ m >= y_(min) = 2 $
        Vì $m in ZZ$ nên giá trị nguyên nhỏ nhất cần tìm của tham số là $m = 2$.
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
