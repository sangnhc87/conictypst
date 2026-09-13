#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// HÀM VẼ MIỀN NGHIỆM BẤT PHƯƠNG TRÌNH THUẬT TOÁN HÌNH HỌC CHUẨN
// ═══════════════════════════════════════════════════════════
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
  exam-title: "BÀI 3: BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN (ĐỀ SỐ 2)",
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

// TN 1: Rút gọn biểu thức nhận diện BPT bậc nhất hai ẩn
#tn([Biểu thức nào sau đây sau khi rút gọn là một bất phương trình bậc nhất hai ẩn?],
    (
        [$(x + y)^2 - (x - y)^2 <= 4$],
        [$x^3 - y^3 >= 3(x - y)$],
        True([$(x + 2)(y - 1) - x y >= 0$]),
        [$(x + 1)/y + 2 <= 0$]
    ),
    loigiai: [
        Ta khai triển từng bất phương trình:
        - $(x + 2)(y - 1) - x y >= 0 <=> x y - x + 2y - 2 - x y >= 0 <=> -x + 2y - 2 >= 0$. Đây là bất phương trình bậc nhất hai ẩn.
        - $(x + y)^2 - (x - y)^2 <= 4 <=> 4x y <= 4 <=> x y <= 1$ (chứa tích $x y$, bậc hai).
        - $x^3 - y^3 >= 3(x - y)$ chứa bậc ba.
        - $(x + 1)/y + 2 <= 0$ chứa ẩn ở mẫu số.
    ]
)

// TN 2: Vị trí cùng phía đối với đường thẳng bờ
#tn([Cho đường thẳng bờ $d: 2x - y + 4 = 0$. Cặp điểm nào sau đây nằm CÙNG PHÍA đối với đường thẳng $d$?],
    (
        [$M(0; 0)$ và $N(1; 7)$],
        [$P(-3; 0)$ và $Q(0; 5)$],
        True([$A(1; 1)$ và $B(0; 2)$]),
        [$C(2; 1)$ và $D(-4; 1)$]
    ),
    loigiai: [
        Đặt $f(x, y) = 2x - y + 4$. Hai điểm nằm cùng phía khi và chỉ khi $f(A) dot f(B) > 0$:
        - Với $A(1; 1)$ và $B(0; 2)$: $f(A) = 2(1) - 1 + 4 = 5 > 0$ và $f(B) = 2(0) - 2 + 4 = 2 > 0$.
        Tích $f(A) dot f(B) = 5 dot 2 = 10 > 0 => A$ và $B$ nằm cùng phía.
        - Với $M(0; 0)$ và $N(1; 7)$: $f(M) = 4 > 0, f(N) = 2(1) - 7 + 4 = -1 < 0 =>$ khác phía.
    ]
)

// TN 3: Điểm trên đường thẳng bờ và giá trị biểu thức
#tn([Cho điểm $M(x_0; y_0)$ nằm trên đường thẳng bờ $x - 3y + 6 = 0$. Giá trị của biểu thức $P = 2x_0 - 6y_0 + 15$ bằng:],
    (
        [$0$],
        True([$3$]),
        [$15$],
        [$27$]
    ),
    loigiai: [
        Vì $M(x_0; y_0)$ thuộc đường thẳng $x - 3y + 6 = 0$ nên $x_0 - 3y_0 = -6$.
        Thay vào biểu thức $P$:
        $ P = 2(x_0 - 3y_0) + 15 = 2(-6) + 15 = -12 + 15 = 3 $
    ]
)

// TN 4: Đường thẳng bờ đi qua 1 điểm và có hệ số góc
#tn([Đường thẳng bờ của một bất phương trình đi qua điểm $A(1; 2)$ và có hệ số góc $k = -2$. Phương trình tổng quát của đường thẳng bờ đó là:],
    (
        [$x + 2y - 5 = 0$],
        [$2x - y = 0$],
        True([$2x + y - 4 = 0$]),
        [$2x + y + 4 = 0$]
    ),
    loigiai: [
        Phương trình đường thẳng đi qua $A(1; 2)$ có hệ số góc $k = -2$:
        $ y - 2 = -2(x - 1) <=> y - 2 = -2x + 2 <=> 2x + y - 4 = 0 $
    ]
)

// TN 5: Đọc đồ thị dạng đoạn chắn
#tn([Hình vẽ sau đây (phần không bị gạch chéo, kể cả bờ) biểu diễn miền nghiệm của bất phương trình nào?
#draw_bpt(
  a: 2,
  b: 1,
  c: -4,
  sign: "<=",
  xmin: -2,
  xmax: 4,
  ymin: -2,
  ymax: 5,
  line-name: [$2x + y = 4$],
)
],
    (
        [$2x + y > 4$],
        [$2x + y >= 4$],
        True([$2x + y <= 4$]),
        [$2x + y < 4$]
    ),
    loigiai: [
        Đường thẳng bờ đi qua $(2; 0)$ và $(0; 4)$ có phương trình $2x + y = 4$.
        Đường nét liền lấy cả bờ. Miền nghiệm chứa gốc tọa độ $O(0;0)$.
        Thay $(0;0)$ vào vế trái: $2(0) + 0 = 0 <= 4$. Vậy BPT là $2x + y <= 4$.
    ]
)

// TN 6: Dạng phân thức đoạn chắn
#tn([Bất phương trình $x/3 + y/(-2) <= 1$ tương đương với bất phương trình nào sau đây?],
    (
        [$2x - 3y - 6 <= 0$],
        True([$2x - 3y - 6 >= 0$]),
        [$3x - 2y - 6 <= 0$],
        [$-2x + 3y + 6 >= 0$]
    ),
    loigiai: [
        Ta có $x/3 - y/2 <= 1$. Quy đồng mẫu số chung là 6:
        $ (2x - 3y)/6 <= 1 <=> 2x - 3y <= 6 <=> 2x - 3y - 6 <= 0 $
        (Lưu ý: Nhân hai vế với $-1$: $-2x + 3y + 6 >= 0$).
        Biến đổi tương đương chuẩn: $2x - 3y - 6 <= 0$.
    ]
)

// TN 7: Tìm m để đường thẳng bờ đi qua điểm cho trước
#tn([Tìm giá trị của tham số $m$ để đường thẳng bờ $(m - 1)x + 2y - 6 = 0$ đi qua điểm $M(2; 1)$.],
    (
        [$m = 1$],
        [$m = 2$],
        True([$m = 3$]),
        [$m = 4$]
    ),
    loigiai: [
        Thay tọa độ điểm $M(2; 1)$ vào phương trình:
        $ (m - 1)(2) + 2(1) - 6 = 0 <=> 2m - 2 + 2 - 6 = 0 <=> 2m = 6 <=> m = 3 $
    ]
)

// TN 8: Điểm đối xứng qua gốc tọa độ O
#tn([Điểm đối xứng của $P(-1; 2)$ qua gốc tọa độ $O(0;0)$ là $P'$. Điểm $P'$ thuộc miền nghiệm của bất phương trình nào sau đây?],
    (
        [$2x + y + 1 < 0$],
        [$x - 2y - 6 > 0$],
        True([$3x - 2y - 5 >= 0$]),
        [$-x + 3y > 0$]
    ),
    loigiai: [
        Điểm đối xứng của $P(-1; 2)$ qua gốc tọa độ $O(0;0)$ là $P'(1; -2)$.
        Thay tọa độ $P'(1; -2)$ vào $3x - 2y - 5$:
        $ 3(1) - 2(-2) - 5 = 3 + 4 - 5 = 2 >= 0 $ (Thỏa mãn).
    ]
)

// TN 9: So sánh khoảng cách đến đường bờ
#tn([Trong các điểm sau, điểm nào có khoảng cách LỚN NHẤT đến đường thẳng bờ $d: x + y - 4 = 0$?],
    (
        True([$O(0; 0)$]),
        [$A(1; 2)$],
        [$B(2; -1)$],
        [$C(-2; 3)$]
    ),
    loigiai: [
        Khoảng cách từ điểm $M(x_0; y_0)$ đến $d$ tỉ lệ thuận với $|x_0 + y_0 - 4|$:
        - $O(0; 0): |0 + 0 - 4| = 4$.
        - $A(1; 2): |1 + 2 - 4| = 1$.
        - $B(2; -1): |2 - 1 - 4| = 3$.
        - $C(-2; 3): |-2 + 3 - 4| = 3$.
        Vậy điểm $O(0;0)$ có khoảng cách lớn nhất ($d = 4/sqrt(2) = 2 sqrt(2)$).
    ]
)

// TN 10: Thực tế tải trọng xe buýt
#tn([Một chiếc xe buýt du lịch chở học sinh và giáo viên. Tổng số người trên xe không vượt quá 45 người. Gọi $x$ là số học sinh và $y$ là số giáo viên ($x, y in NN$). Bất phương trình mô tả giới hạn số lượng người trên xe là:],
    (
        [$x + y >= 45$],
        [$x - y <= 45$],
        True([$x + y <= 45$]),
        [$x + 2y <= 45$]
    ),
    loigiai: [
        Tổng số người trên xe là $x + y$. Do số người không vượt quá 45 nên $x + y <= 45$.
    ]
)

// TN 11: Điều kiện m để là BPT bậc nhất hai ẩn
#tn([Tìm tất cả các giá trị của tham số $m$ để bất phương trình $(m^2 - 4)x + (m - 2)y + 5 >= 0$ là bất phương trình bậc nhất hai ẩn.],
    (
        [$m != 2$ và $m != -2$],
        [$m = 2$],
        True([$m != 2$]),
        [$m != -2$]
    ),
    loigiai: [
        Để là bất phương trình bậc nhất hai ẩn, hai hệ số không đồng thời bằng 0:
        $ cases(m^2 - 4 = 0, m - 2 = 0) <=> cases(m = plus.minus 2, m = 2) <=> m = 2 $
        Do đó, để là BPT bậc nhất hai ẩn thì $m != 2$.
    ]
)

// TN 12: Miền nghiệm chứa các điểm tung độ lớn hơn hoành độ
#tn([Miền nghiệm của bất phương trình $x - y < 0$ là nửa mặt phẳng gồm tất cả các điểm:],
    (
        [Có hoành độ lớn hơn tung độ ($x > y$).],
        True([Có tung độ lớn hơn hoành độ ($y > x$).]),
        [Nằm hoàn toàn trong góc phần tư thứ nhất.],
        [Nằm hoàn toàn trong góc phần tư thứ ba.]
    ),
    loigiai: [
        Ta có $x - y < 0 <=> y > x$. Do đó miền nghiệm gồm tất cả các điểm có tung độ lớn hơn hoành độ.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát vị trí tương đối của 3 điểm với đường thẳng
#ds([Cho đường thẳng $d: x - 2y + 4 = 0$ và ba điểm $A(0; 3), B(2; 1), C(-4; 0)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Điểm $C(-4; 0)$ nằm trên đường thẳng $d$.]),
    True([Điểm $A(0; 3)$ thuộc miền nghiệm của bất phương trình $x - 2y + 4 <= 0$.]),
    True([Hai điểm $A(0; 3)$ và $B(2; 1)$ nằm về hai phía khác nhau đối với đường thẳng $d$.]),
    [Đoạn thẳng $A B$ không cắt đường thẳng $d$.]
  ),
  loigiai: [
    Đặt $f(x, y) = x - 2y + 4$.
    #step([Kiểm tra điểm $C(-4; 0)$])
    $f(-4, 0) = -4 - 2(0) + 4 = 0$. Điểm $C$ thuộc $d$. Vậy a) Đúng.

    #step([Kiểm tra điểm $A(0; 3)$])
    $f(0, 3) = 0 - 2(3) + 4 = -2 <= 0$. Vậy điểm $A$ thuộc miền nghiệm của BPT $x - 2y + 4 <= 0$. b) Đúng.

    #step([Xét vị trí tương đối của A và B])
    $f(A) = -2 < 0$ và $f(B) = 2 - 2(1) + 4 = 4 > 0$.
    Vì $f(A) dot f(B) = -8 < 0$ nên $A$ và $B$ nằm về hai phía khác nhau đối với đường thẳng $d$. c) Đúng.

    #step([Kiểm tra đoạn thẳng AB])
    Vì $A$ và $B$ nằm về hai phía khác nhau nên đoạn thẳng $A B$ bắt buộc phải cắt đường thẳng $d$. Phát biểu d) Sai.
  ]
)

// DS 2: Đồ thị đường thẳng đứng
#ds([Cho hình vẽ biểu diễn miền nghiệm của một bất phương trình trên mặt phẳng $O x y$ (phần không bị gạch, kể cả bờ):
#draw_bpt(
  a: 2,
  b: 1,
  c: -2,
  sign: ">=",
  xmin: -2,
  xmax: 3,
  ymin: -3,
  ymax: 3,
  line-name: [$2x + y - 2 = 0$],
)
],
  (
    True([Đường thẳng bờ của miền nghiệm đi qua hai điểm $(1; 0)$ và $(0; 2)$.]),
    True([Gốc tọa độ $O(0;0)$ không thuộc miền nghiệm của bất phương trình.]),
    True([Bất phương trình tương ứng với hình vẽ là $2x + y - 2 >= 0$.]),
    True([Điểm $A(2; 1)$ thuộc miền nghiệm của bất phương trình.])
  ),
  loigiai: [
    #step([Xác định phương trình đường thẳng bờ])
    Đường thẳng đi qua $(1; 0)$ và $(0; 2)$ có phương trình $x/1 + y/2 = 1 <=> 2x + y - 2 = 0$. Vậy a) Đúng.

    #step([Kiểm tra gốc $O(0;0)$])
    Gốc $O(0;0)$ nằm ở phần bị gạch chéo nên $O(0;0)$ không thuộc miền nghiệm. Vậy b) Đúng.

    #step([Xác định bất phương trình])
    Thay $(0;0)$ vào $2x + y - 2$: được $-2 < 0$. Do miền nghiệm không chứa $O(0;0)$ và lấy cả bờ nên BPT là $2x + y - 2 >= 0$. Vậy c) Đúng.

    #step([Kiểm tra điểm $A(2; 1)$])
    Thay $A(2; 1)$ vào BPT: $2(2) + 1 - 2 = 3 >= 0$ (Đúng). Vậy d) Đúng.
  ]
)

// DS 3: Thực tế dinh dưỡng thể thao
#ds([Một vận động viên bơi lội cần nạp tối thiểu $120$ g protein mỗi ngày từ hai nguồn thực phẩm: ức gà (mỗi $100$ g cung cấp $30$ g protein) và thịt bò nạc (mỗi $100$ g cung cấp $25$ g protein). Gọi $x, y$ lần lượt là số lạng (mỗi lạng $= 100$ g) ức gà và thịt bò mà vận động viên ăn trong ngày ($x, y >= 0$).],
  (
    True([Bất phương trình mô tả lượng protein cần nạp là $6x + 5y >= 24$.]),
    True([Nếu vận động viên ăn $2$ lạng ức gà và $3$ lạng thịt bò thì đạt chỉ tiêu protein trong ngày.]),
    True([Nếu vận động viên chỉ ăn thịt bò (không ăn ức gà) thì cần ăn ít nhất $5$ lạng thịt bò.]),
    True([Nếu vận động viên ăn đúng $4$ lạng ức gà thì không cần ăn thêm thịt bò vẫn đạt chỉ tiêu.])
  ),
  loigiai: [
    #step([Lập bất phương trình protein])
    Lượng protein là $30x + 25y$ (g). Chỉ tiêu tối thiểu $120$ g:
    $ 30x + 25y >= 120 <=> 6x + 5y >= 24 $
    Vậy a) Đúng.

    #step([Kiểm tra 2 lạng gà, 3 lạng bò])
    $6(2) + 5(3) = 12 + 15 = 27 >= 24$ (Đạt chỉ tiêu). Vậy b) Đúng.

    #step([Trường hợp chỉ ăn thịt bò ($x = 0$)])
    $6(0) + 5y >= 24 <=> 5y >= 24 <=> y >= 4.8$.
    Vì số lạng là số nguyên thực tế khi mua nên cần ít nhất 5 lạng thịt bò. Vậy c) Đúng.

    #step([Trường hợp ăn 4 lạng ức gà ($x = 4, y = 0$)])
    $6(4) + 5(0) = 24 >= 24$ (Vừa đúng đạt chỉ tiêu). Vậy d) Đúng.
  ]
)

// DS 4: Tham số và điểm cố định
#ds([Cho bất phương trình $(2m - 1)x + (m + 2)y - 4m <= 0$ (với $m$ là tham số). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 0$, bất phương trình trở thành $-x + 2y <= 0$.]),
    [Đường thẳng bờ luôn đi qua điểm cố định $I(2; 0)$ với mọi giá trị của tham số $m$.],
    True([Gốc tọa độ $O(0;0)$ thuộc miền nghiệm của bất phương trình khi và chỉ khi $m >= 0$.]),
    [Khi $m = 1$, miền nghiệm của bất phương trình chứa điểm $P(3; 1)$.]
  ),
  loigiai: [
    #step([Trường hợp $m = 0$])
    Khi $m = 0$, BPT là $-x + 2y - 0 <= 0 <=> -x + 2y <= 0$. Vậy a) Đúng.

    #step([Tìm điểm cố định của đường thẳng bờ])
    Phương trình bờ: $m(2x + y - 4) + (-x + 2y) = 0$.
    Điểm cố định thỏa mãn hệ:
    $ cases(2x + y - 4 = 0, -x + 2y = 0) <=> cases(x = 2y, 4y + y = 4) <=> cases(y = 4/5, x = 8/5) $
    Điểm cố định là $(8/5; 4/5) != (2; 0)$. Vậy b) Sai.

    #step([Điều kiện để $O(0;0)$ thuộc miền nghiệm])
    Thay $(0; 0)$ vào BPT: $(2m-1)(0) + (m+2)(0) - 4m <= 0 <=> -4m <= 0 <=> m >= 0$. Vậy c) Đúng.

    #step([Kiểm tra điểm $P(3; 1)$ khi $m = 1$])
    Khi $m = 1$, BPT là $x + 3y - 4 <= 0$. Thay $(3; 1)$: $3 + 3(1) - 4 = 2 > 0$ (Không thỏa mãn). Vậy d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1: Đếm cặp số nguyên dương
#tln([Cho bất phương trình $3x + 4y <= 25$. Có tất cả bao nhiêu cặp số nguyên dương $(x; y)$ thỏa mãn bất phương trình trên?],
    [20],
    loigiai: [
        #step([Điều kiện nguyên dương])
        $x, y in NN^*$ ($x >= 1, y >= 1$).
        Ta có $4y <= 25 - 3x$. Vì $y >= 1$ nên $25 - 3x >= 4 <=> 3x <= 21 <=> x <= 7$.
        Do đó $x in {1; 2; 3; 4; 5; 6; 7}$.
        
        #step([Đếm số giá trị của y theo từng x])
        - $x = 1: 4y <= 22 => y in {1; 2; 3; 4; 5}$ (có 5 cặp).
        - $x = 2: 4y <= 19 => y in {1; 2; 3; 4}$ (có 4 cặp).
        - $x = 3: 4y <= 16 => y in {1; 2; 3; 4}$ (có 4 cặp).
        - $x = 4: 4y <= 13 => y in {1; 2; 3}$ (có 3 cặp).
        - $x = 5: 4y <= 10 => y in {1; 2}$ (có 2 cặp).
        - $x = 6: 4y <= 7 => y = 1$ (có 1 cặp).
        - $x = 7: 4y <= 4 => y = 1$ (có 1 cặp).
        
        #step([Tổng số cặp nghiệm])
        Tổng số cặp nguyên dương là: $5 + 4 + 4 + 3 + 2 + 1 + 1 = 20$.
    ]
)

// TLN 2: Khoảng cách từ giao điểm đến trục tung
#tln([Đường thẳng bờ $d: 2x - 5y + 10 = 0$ của một bất phương trình cắt đường thẳng nằm ngang $y = 4$ tại điểm $P$. Tính khoảng cách từ điểm $P$ đến trục tung $O y$.],
    [5],
    loigiai: [
        #step([Tìm tọa độ điểm P])
        Thay $y = 4$ vào phương trình đường thẳng $d$:
        $ 2x - 5(4) + 10 = 0 <=> 2x - 20 + 10 = 0 <=> 2x = 10 <=> x = 5 $
        Vậy điểm $P$ có tọa độ là $(5; 4)$.
        
        #step([Tính khoảng cách đến trục Oy])
        Khoảng cách từ điểm $P(5; 4)$ đến trục tung $O y$ là $|x_P| = |5| = 5$.
    ]
)

// TLN 3: Thực tế trạm sạc điện
#tln([Một trạm sạc xe điện có hai loại trụ sạc: trụ sạc nhanh (công suất $60$ kW) và trụ sạc tiêu chuẩn (công suất $20$ kW). Tổng công suất cấp điện đồng thời tối đa của trạm là $300$ kW. Nếu trạm đang có 3 trụ sạc nhanh hoạt động thì có thể vận hành tối đa bao nhiêu trụ sạc tiêu chuẩn cùng lúc?],
    [6],
    loigiai: [
        #step([Thiết lập bất phương trình công suất])
        Gọi $y$ là số trụ sạc tiêu chuẩn hoạt động ($y in NN$).
        Công suất của 3 trụ sạc nhanh là $3 dot 60 = 180$ kW.
        Tổng công suất không vượt quá 300 kW:
        $ 180 + 20y <= 300 <=> 20y <= 120 <=> y <= 6 $
        
        #step([Kết luận])
        Trạm có thể vận hành tối đa $6$ trụ sạc tiêu chuẩn.
    ]
)

// TLN 4: Điểm M(m, m^2) thuộc miền nghiệm
#tln([Có bao nhiêu giá trị nguyên của tham số $m$ để điểm $M(m; m^2)$ thuộc miền nghiệm của bất phương trình $2x - y + 3 >= 0$?],
    [5],
    loigiai: [
        #step([Thay tọa độ điểm M vào bất phương trình])
        Điểm $M(m; m^2)$ thuộc miền nghiệm khi và chỉ khi:
        $ 2m - m^2 + 3 >= 0 <=> m^2 - 2m - 3 <= 0 <=> (m + 1)(m - 3) <= 0 <=> -1 <= m <= 3 $
        
        #step([Đếm số giá trị nguyên])
        Các giá trị nguyên của $m$ là: $m in {-1; 0; 1; 2; 3}$ (có đúng $5$ giá trị).
    ]
)

// TLN 5: Điểm nguyên trên đoạn thẳng
#tln([Trên đoạn thẳng nối hai điểm $A(-1; 1)$ và $B(5; 7)$, có tất cả bao nhiêu điểm có tọa độ nguyên $(x; y)$ thuộc miền nghiệm của bất phương trình $2x - y + 3 >= 0$?],
    [7],
    loigiai: [
        #step([Phương trình đoạn thẳng AB])
        Đoạn thẳng $A B$ nằm trên đường thẳng $y = x + 2$ với $x in [-1; 5]$.
        Các điểm có tọa độ nguyên trên đoạn $A B$ có dạng $(t; t + 2)$ với $t in {-1; 0; 1; 2; 3; 4; 5}$.
        
        #step([Thay vào bất phương trình])
        $ 2t - (t + 2) + 3 >= 0 <=> t + 1 >= 0 <=> t >= -1 $
        Vì mọi $t in {-1; 0; 1; 2; 3; 4; 5}$ đều thỏa mãn $t >= -1$ nên toàn bộ $7$ điểm nguyên trên đoạn $A B$ đều thuộc miền nghiệm.
    ]
)

// TLN 6: Tìm GTLN trên miền nghiệm nguyên
#tln([Cho cặp số nguyên không âm $(x; y)$ thỏa mãn bất phương trình $x + 2y <= 6$. Tìm giá trị lớn nhất của biểu thức $F(x, y) = 3x + 2y$.],
    [18],
    loigiai: [
        #step([Liệt kê các cặp nghiệm nguyên không âm])
        Vì $x, y in NN$ và $x <= 6 - 2y$, ta xét các điểm cực biên:
        - Nếu $y = 0: x in {0..6} => F(6, 0) = 3(6) + 2(0) = 18$.
        - Nếu $y = 1: x in {0..4} => F(4, 1) = 3(4) + 2(1) = 14$.
        - Nếu $y = 2: x in {0..2} => F(2, 2) = 3(2) + 2(2) = 10$.
        - Nếu $y = 3: x = 0 => F(0, 3) = 3(0) + 2(3) = 6$.
        
        #step([Kết luận])
        Giá trị lớn nhất của biểu thức là $F_(max) = 18$ (đạt được khi $x = 6, y = 0$).
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
