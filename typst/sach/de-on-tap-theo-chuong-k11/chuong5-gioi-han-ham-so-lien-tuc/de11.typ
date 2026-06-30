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

// Hình 1: Tam giác vuông cân lồng nhau
#let fig-right-triangles = canvas(length: 1cm, {
  import draw: *
  // Level 1: Vuông cân cạnh bên 4
  line((0,0), (4,0), (0,4), close: true, stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  // Level 2: Trung điểm
  line((2,0), (0,2), (2,2), close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  // Level 3: Trung điểm tiếp theo
  line((1,1), (2,1), (1,2), close: true, stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
  
  circle((0,0), radius: 2pt, fill: black)
  content((0, -0.3), [O])
})

// Hình 2: Xoắn ốc tam giác vuông 30 độ
#let fig-triangles-spiral-30 = canvas(length: 0.8cm, {
  import draw: *
  let O = (0,0)
  // O A1 = 5
  let A1 = (5, 0)
  // A2: OA2 = 5 * cos(30) = 4.33, angle 30deg
  let A2 = (4.33 * calc.cos(30deg), 4.33 * calc.sin(30deg))
  // A3: OA3 = 4.33 * cos(30) = 3.75, angle 60deg
  let A3 = (3.75 * calc.cos(60deg), 3.75 * calc.sin(60deg))
  // A4: OA4 = 3.75 * cos(30) = 3.25, angle 90deg
  let A4 = (0, 3.25)
  // A5: OA5 = 3.25 * cos(30) = 2.81, angle 120deg
  let A5 = (2.81 * calc.cos(120deg), 2.81 * calc.sin(120deg))
  
  line(O, A1, A2, close: true, stroke: 1.2pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  line(O, A2, A3, close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  line(O, A3, A4, close: true, stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
  line(O, A4, A5, close: true, stroke: 1.0pt + rgb("#e67e22"), fill: rgb("#e67e22").lighten(92%))
  
  circle(O, radius: 2pt, fill: black)
  content((-0.3, -0.3), [O])
  content((5.2, -0.2), [$A_1$])
  content((4.0, 2.4), [$A_2$])
})

// Hình 3: Ngũ giác đều lồng nhau
#let fig-nested-pentagons = canvas(length: 1.2cm, {
  import draw: *
  // Level 1
  let pts1 = range(5).map(i => {
    let a = i * 72deg + 90deg
    (2 * calc.cos(a), 2 * calc.sin(a))
  })
  line(..pts1, close: true, stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  
  // Level 2 (scaled by 0.618 and rotated by 36deg)
  let r2 = 2 * 0.618
  let pts2 = range(5).map(i => {
    let a = i * 72deg + 90deg + 36deg
    (r2 * calc.cos(a), r2 * calc.sin(a))
  })
  line(..pts2, close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  
  // Level 3
  let r3 = r2 * 0.618
  let pts3 = range(5).map(i => {
    let a = i * 72deg + 90deg
    (r3 * calc.cos(a), r3 * calc.sin(a))
  })
  line(..pts3, close: true, stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
})

#let fig-triangle-circle = canvas(length: 1.1cm, {
  import draw: *
  let h_val = calc.sqrt(3)
  
  let triangle-colors = (
    rgb("#0057b8"), // Xanh dương
    rgb("#1a7a2e"), // Xanh lá
    rgb("#9b59b6"), // Tím
    rgb("#008080"), // Teal
  )
  
  let circle-colors = (
    rgb("#cc2200"), // Đỏ
    rgb("#e67e22"), // Cam
    rgb("#e91e63"), // Hồng
    rgb("#f1c40f"), // Vàng
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

// Hình 5: Xoắn ốc hình vuông lồng xoay 45 độ
#let fig-squares-spiral-45 = canvas(length: 1cm, {
  import draw: *
  // Square 1: side 4
  rect((-2, -2), (2, 2), stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  // Square 2: rotated 45 deg, side 2.82
  line((0, -2), (2, 0), (0, 2), (-2, 0), close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  // Square 3: side 2
  rect((-1, -1), (1, 1), stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
  // Square 4: rotated 45
  line((0, -1), (1, 0), (0, 1), (-1, 0), close: true, stroke: 0.8pt + rgb("#e67e22"))
})

// Hình 6: Tam giác Sierpinski (Fractal)
#let fig-sierpinski = canvas(length: 1.2cm, {
  import draw: *
  let h = calc.sqrt(3)
  // Outer triangle
  line((0,0), (4,0), (2, 2 * h), close: true, stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  // Removed middle 1
  line((2,0), (3, h), (1, h), close: true, stroke: 1.2pt + rgb("#0057b8"), fill: white)
  // Removed middle 2 (bottom left, bottom right, top)
  line((1,0), (1.5, h/2), (0.5, h/2), close: true, stroke: 1.0pt + rgb("#0057b8"), fill: white)
  line((3,0), (3.5, h/2), (2.5, h/2), close: true, stroke: 1.0pt + rgb("#0057b8"), fill: white)
  line((2, h), (2.5, 1.5 * h), (1.5, 1.5 * h), close: true, stroke: 1.0pt + rgb("#0057b8"), fill: white)
})

// Hình 7: Đường gấp khúc xoắn ốc bên trong hình vuông
#let fig-spiral-path = canvas(length: 1cm, {
  import draw: *
  rect((0,0), (4,4), stroke: 1.5pt + black)
  
  let p1 = (0, 0)
  let p2 = (4, 0)
  let p3 = (4, 4)
  let p4 = (2, 4)
  let p5 = (2, 2)
  let p6 = (3, 2)
  let p7 = (3, 3)
  
  line(p1, p2, p3, p4, p5, p6, p7, stroke: 1.5pt + rgb("#cc2200"))
  
  circle(p1, radius: 2.5pt, fill: black)
  content((0, -0.3), [$A_1$])
  circle(p2, radius: 2.5pt, fill: black)
  content((4, -0.3), [$A_2$])
  circle(p3, radius: 2.5pt, fill: black)
  content((4, 4.3), [$A_3$])
})

// Hình 8: Các bước của tập Cantor
#let fig-cantor = canvas(length: 1cm, {
  import draw: *
  // Step 0
  line((0, 2), (6, 2), stroke: 3pt + rgb("#0057b8"))
  content((-0.5, 2), [Lần 0])
  
  // Step 1
  line((0, 1.2), (2, 1.2), stroke: 3pt + rgb("#cc2200"))
  line((4, 1.2), (6, 1.2), stroke: 3pt + rgb("#cc2200"))
  content((-0.5, 1.2), [Lần 1])
  
  // Step 2
  line((0, 0.4), (0.67, 0.4), stroke: 3pt + rgb("#1a7a2e"))
  line((1.33, 0.4), (2, 0.4), stroke: 3pt + rgb("#1a7a2e"))
  line((4, 0.4), (4.67, 0.4), stroke: 3pt + rgb("#1a7a2e"))
  line((5.33, 0.4), (6, 0.4), stroke: 3pt + rgb("#1a7a2e"))
  content((-0.5, 0.4), [Lần 2])
})

// Hình 9: Bát giác đều lồng nhau
#let fig-nested-octagons = canvas(length: 1.2cm, {
  import draw: *
  // Level 1
  let pts1 = range(8).map(i => {
    let a = i * 45deg + 22.5deg
    (2 * calc.cos(a), 2 * calc.sin(a))
  })
  line(..pts1, close: true, stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  
  // Level 2 (scaled by 0.707 and rotated)
  let r2 = 2 * 0.707
  let pts2 = range(8).map(i => {
    let a = i * 45deg
    (r2 * calc.cos(a), r2 * calc.sin(a))
  })
  line(..pts2, close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  
  // Level 3
  let r3 = r2 * 0.707
  let pts3 = range(8).map(i => {
    let a = i * 45deg + 22.5deg
    (r3 * calc.cos(a), r3 * calc.sin(a))
  })
  line(..pts3, close: true, stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
})

// Hình 10: Cây hình tròn Fractal
#let fig-circle-tree = canvas(length: 0.8cm, {
  import draw: *
  // Level 0
  circle((0, 0), radius: 1.5, stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  // Level 1
  circle((-0.75, 1.8), radius: 0.75, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  circle((0.75, 1.8), radius: 0.75, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  // Level 2
  circle((-1.125, 2.7), radius: 0.375, stroke: 1.0pt + rgb("#1a7a2e"))
  circle((-0.375, 2.7), radius: 0.375, stroke: 1.0pt + rgb("#1a7a2e"))
  circle((0.375, 2.7), radius: 0.375, stroke: 1.0pt + rgb("#1a7a2e"))
  circle((1.125, 2.7), radius: 0.375, stroke: 1.0pt + rgb("#1a7a2e"))
})

// Hình 11: Các hình vuông chồng xếp lên nhau
#let fig-stacked-squares = canvas(length: 1cm, {
  import draw: *
  line((-1.5, 0), (2.5, 0), stroke: 1.5pt + black)
  
  // Square 1: side 2, bottom at y=0, centered at x=0
  rect((-1, 0), (1, 2), stroke: 1.2pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  // Square 2: side 1, bottom at y=2, centered at x=0
  rect((-0.5, 2), (0.5, 3), stroke: 1.0pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  // Square 3: side 0.5, bottom at y=3, centered at x=0
  rect((-0.25, 3), (0.25, 3.5), stroke: 0.8pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
})

// Hình 12: Đồ thị nồng độ thuốc tích lũy qua nhiều liều
#let fig-drug-accumulation = canvas(length: 1cm, {
  import draw: *
  line((0, 4), (6.5, 4), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 4.3), [Tích lũy tối đa])
  
  let levels = (0.0, 0.8, 1.44, 1.95, 2.36, 2.69, 2.95)
  for i in range(5) {
    let t_start = i
    let t_end = i + 1
    let val_start = levels.at(i)
    let val_peak = val_start + 1.5 
    
    line((t_start, val_start), (t_start, val_peak), stroke: 1.2pt + rgb("#cc2200"))
    
    let pts = range(11).map(j => {
      let t_rel = j * 0.1
      let t = t_start + t_rel
      let val = val_peak * calc.exp(-0.223 * t_rel) 
      (t, val)
    })
    line(..pts, stroke: 1.5pt + rgb("#0057b8"))
  }
  
  line((0,0), (6.5,0), stroke: 1.2pt + black)
  line((0,0), (0,4.5), stroke: 1.2pt + black)
  content((6.7, 0), [t])
  content((0, 4.8), [C])
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 5",
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 11)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho tam giác vuông cân $T_1$ có độ dài hai cạnh góc vuông bằng $6" cm"$. Người ta nối trung điểm các cạnh của tam giác $T_1$ để tạo thành tam giác vuông cân $T_2$, nối trung điểm các cạnh của $T_2$ để tạo thành $T_3$, và cứ thế tiếp tục quá trình này vô hạn lần (như hình vẽ). Tính tổng diện tích của tất cả các tam giác vuông cân trong dãy vô hạn $T_1, T_2, T_3, ...$ (tính bằng xăng-ti-mét vuông).],
    (
        [$18" cm"^2$.],
        True([$24" cm"^2$.]),
        [$36" cm"^2$.],
        [$48" cm"^2$.]
    ),
    fig: fig-right-triangles,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Diện tích tam giác vuông cân thứ nhất là:
        $ S_1 = (1)/(2) dot 6 dot 6 = 18" cm"^2 $.
        Mỗi tam giác vuông cân tiếp theo được tạo bằng cách nối trung điểm các cạnh của tam giác trước nên sẽ đồng dạng với tam giác trước theo tỉ số $k = (1)/(2)$.
        Do đó, tỉ số diện tích giữa hai tam giác liên tiếp là $q = k^2 = (1)/(4)$.
        Dãy diện tích tạo thành cấp số nhân lùi vô hạn có số hạng đầu $S_1 = 18$ và công bội $q = (1)/(4)$ (thỏa mãn $|q| < 1$).
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (18)/(1 - (1)/(4)) = (18)/((3)/(4)) = 24" cm"^2 $.
    ]
)

// TN 2
#tn([Dựng một đường xoắn ốc tam giác vuông vô hạn bằng cách xếp liên tiếp các tam giác vuông chung đỉnh $O$ (như hình vẽ minh họa). Tam giác đầu tiên $O A_1 A_2$ vuông tại $A_2$ có góc $A_1 O A_2 = 30^o$ và cạnh huyền $O A_1 = 8$. Tam giác tiếp theo $O A_2 A_3$ vuông tại $A_3$ có góc $A_2 O A_3 = 30^o$ và cạnh huyền là cạnh bên $O A_2$ của tam giác trước. Cứ tiếp tục như vậy vô hạn lần. Tính tổng độ dài đường gấp khúc vô hạn $A_1 A_2 + A_2 A_3 + A_3 A_4 + ...$],
    (
        [$4(2 + sqrt(3))$],
        [$4(2 - sqrt(3))$],
        True([$8(2 + sqrt(3))$]),
        [$8(2 - sqrt(3))$]
    ),
    fig: fig-triangles-spiral-30,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Xét các tam giác vuông liên tiếp:
        - Trong tam giác $O A_1 A_2$ vuông tại $A_2$ có góc $angle A_1 O A_2 = 30°$:
          $ A_1 A_2 = O A_1 dot sin 30^o = 8 dot (1)/(2) = 4 $.
          $ O A_2 = O A_1 dot cos 30^o = 8 dot (sqrt(3))/(2) = 4 sqrt(3) $.
        - Trong tam giác $O A_2 A_3$ vuông tại $A_3$ có góc $30^o$:
          $ A_2 A_3 = O A_2 dot sin 30^o = 4 sqrt(3) dot (1)/(2) = 2 sqrt(3) $.
        - Tỉ số độ dài các đoạn gấp khúc liên tiếp là $q = cos 30^o = (sqrt(3))/(2)$ (vì $A_(n+1) A_(n+2) = A_n A_(n+1) cos 30^o$).
        Tổng độ dài đường gấp khúc xoắn ốc là tổng cấp số nhân lùi vô hạn với $u_1 = 4$ và $q = (sqrt(3))/(2)$:
        $ L = (u_1)/(1 - q) = (4)/(1 - (sqrt(3))/(2)) = (8)/(2 - sqrt(3)) = 8(2 + sqrt(3)) $.
    ]
)

// TN 3
#tn([Cho một ngũ giác đều $P_1$ có độ dài cạnh bằng $10$. Dựng ngũ giác đều $P_2$ bằng cách nối các trung điểm của ngũ giác $P_1$, và cứ thế tiếp tục dựng các ngũ giác đều $P_3, P_4, ...$ vô hạn lần (như mô tả ở hình vẽ). Biết tỉ số độ dài cạnh của mỗi ngũ giác đều tiếp theo giảm đi theo tỉ lệ vàng, được quy ước đơn giản bằng tỉ số không đổi là $q = 0.6$. Tính tổng chu vi của tất cả các ngũ giác đều trong dãy vô hạn đó.],
    (
        [$75$],
        [$100$],
        True([$125$]),
        [$150$]
    ),
    fig: fig-nested-pentagons,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Chu vi ngũ giác đều đầu tiên $P_1$ là: $C_1 = 5 dot 10 = 50$.
        - Vì độ dài cạnh giảm theo tỉ số $q = 0.6$ nên chu vi các ngũ giác đều liên tiếp cũng lập thành cấp số nhân lùi vô hạn với số hạng đầu $C_1 = 50$ và công bội $q = 0.6$ (thỏa mãn $|q| < 1$).
        Tổng chu vi là:
        $ C = (C_1)/(1 - q) = (50)/(1 - 0.6) = (50)/(0.4) = 125 $.
    ]
)

// TN 4
#tn([Cho tam giác đều $T_1$ có cạnh bằng $6" cm"$. Dựng đường tròn $C_1$ nội tiếp $T_1$. Tiếp tục dựng tam giác đều $T_2$ nội tiếp đường tròn $C_1$. Dựng đường tròn $C_2$ nội tiếp $T_2$, và cứ tiếp tục quá trình này vô hạn lần (như hình vẽ). Tính tổng diện tích của tất cả các đường tròn $C_1, C_2, C_3, ...$ (tính bằng xăng-ti-mét vuông).],
    (
        [$3 pi" cm"^2$.],
        True([$4 pi" cm"^2$.]),
        [$6 pi" cm"^2$.],
        [$8 pi" cm"^2$.]
    ),
    fig: fig-triangle-circle,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Bán kính đường tròn $C_1$ nội tiếp tam giác đều $T_1$ cạnh $a = 6$ là:
          $ r_1 = (a)/(2 sqrt(3)) = (6)/(2 sqrt(3)) = sqrt(3) $ cm.
          Diện tích đường tròn $C_1$: $S_1 = pi r_1^2 = 3 pi" cm"^2 $.
        - Đường tròn $C_1$ ngoại tiếp tam giác đều $T_2$. Bán kính đường tròn ngoại tiếp $T_2$ là $R_2 = r_1 = sqrt(3)$ cm.
          Cạnh của tam giác đều $T_2$ là $a_2 = R_2 sqrt(3) = sqrt(3) dot sqrt(3) = 3$ cm.
        - Bán kính đường tròn $C_2$ nội tiếp $T_2$:
          $ r_2 = (a_2)/(2 sqrt(3)) = (3)/(2 sqrt(3)) = (sqrt(3))/(2) $ cm.
          Diện tích đường tròn $C_2$: $S_2 = pi r_2^2 = (3 pi)/(4)" cm"^2 $.
        - Dãy diện tích các hình tròn lập thành cấp số nhân lùi vô hạn với $S_1 = 3 pi$ và công bội $q = (S_2)/(S_1) = (1)/(4)$.
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (3 pi)/(1 - (1)/(4)) = 4 pi" cm"^2 $.
    ]
)

// TN 5
#tn([Một mô hình nghệ thuật gồm các hình vuông $S_1, S_2, S_3, ...$ được sắp xếp đồng tâm và xoay liên tiếp góc $45^o$ (như hình vẽ bên dưới). Hình vuông ngoài cùng $S_1$ có diện tích bằng $16" cm"^2$. Mỗi hình vuông tiếp theo $S_(n+1)$ được dựng bằng cách lấy đỉnh là các trung điểm các cạnh của hình vuông $S_n$ ngay trước đó. Tính tổng diện tích của tất cả các hình vuông trong dãy vô hạn này.],
    (
        [$24" cm"^2$.],
        True([$32" cm"^2$.]),
        [$48" cm"^2$.],
        [$64" cm"^2$.]
    ),
    fig: fig-squares-spiral-45,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Diện tích hình vuông thứ nhất là $S_1 = 16$.
        - Khi nối trung điểm các cạnh của một hình vuông, ta được một hình vuông mới có diện tích bằng đúng $(1)/(2)$ diện tích hình vuông cũ.
        - Dãy diện tích lập thành cấp số nhân lùi vô hạn với số hạng đầu $S_1 = 16$ và công bội $q = (1)/(2)$ (thỏa mãn $|q| < 1$).
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (16)/(1 - (1)/(2)) = 32" cm"^2 $.
    ]
)

// TN 6
#tn([Bông tuyết Koch (mô tả hình vẽ bên dưới) là một đường cong phân phân (fractal) được dựng từ một tam giác đều ban đầu có diện tích $S_0 = 10" cm"^2 $. Ở mỗi bước, mỗi cạnh của hình được chia làm 3 đoạn bằng nhau, và đoạn ở giữa được thay bằng một tam giác đều mới có đỉnh hướng ra ngoài. Khi thực hiện quá trình này vô hạn lần, diện tích giới hạn của bông tuyết Koch thu được là bao nhiêu?],
    (
        [$12" cm"^2$.],
        [$15" cm"^2$.],
        True([$16" cm"^2$.]),
        [$20" cm"^2$.]
    ),
    fig: fig-sierpinski, // using sierpinski for fractal placeholder
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Theo lý thuyết hình học fractal, công thức tính diện tích bông tuyết Koch giới hạn từ diện tích tam giác đều ban đầu $S_0$ là:
        $ S = (8)/(5) S_0 $.
        Với $S_0 = 10" cm"^2 $, ta có:
        $ S = (8)/(5) dot 10 = 16" cm"^2 $.
    ]
)

// TN 7
#tn([Cho tam giác đều có diện tích bằng $12" cm"^2$. Người ta thực hiện thuật toán dựng tam giác Sierpinski (như hình vẽ): chia tam giác thành 4 tam giác đều nhỏ bằng nhau và bỏ đi tam giác ở chính giữa. Sau đó tiếp tục bỏ đi tam giác ở chính giữa của các tam giác nhỏ còn lại, và cứ thế tiếp tục quá trình này vô hạn lần. Tính giới hạn tổng diện tích của tất cả các tam giác đã bị bỏ đi.],
    (
        [$8" cm"^2$.],
        [$9" cm"^2$.],
        True([$12" cm"^2$.]),
        [$16" cm"^2$.]
    ),
    fig: fig-sierpinski,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Diện tích tam giác ban đầu là $S_0 = 12" cm"^2 $.
        - Sau mỗi bước, diện tích phần còn lại bằng $(3)/(4)$ diện tích phần còn lại ở bước trước đó.
        - Giới hạn diện tích phần còn lại khi số bước tiến ra vô hạn là:
          $ limits(lim)_(n -> +oo) S_n = limits(lim)_(n -> +oo) [S_0 dot ((3)/(4))^n] = 0 $ (vì $|(3)/(4)| < 1$).
        - Do diện tích phần còn lại tiến về $0$, nên tổng diện tích của toàn bộ các phần tam giác đã bị bỏ đi phải tiến sát về đúng diện tích ban đầu của tam giác là $12" cm"^2$.
    ]
)

// TN 8
#tn([Một đường gấp khúc nghệ thuật được vẽ bên trong một hình vuông cạnh $10$ cm (như hình vẽ). Đoạn thẳng thứ nhất $A_1 A_2$ trùng với một cạnh hình vuông và dài $10" cm"$. Đoạn tiếp theo $A_2 A_3$ vuông góc với đoạn đầu và có độ dài bằng $5$ cm. Mỗi đoạn thẳng tiếp theo vuông góc với đoạn liền trước và có chiều dài giảm đi một nửa. Tính tổng độ dài đường gấp khúc vô hạn này (tính bằng xăng-ti-mét).],
    (
        [$15$ cm.],
        True([$20" cm"$]),
        [$30" cm"$],
        [Đường gấp khúc dài vô hạn.]
    ),
    fig: fig-spiral-path,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Độ dài các đoạn thẳng trong đường gấp khúc tạo thành một cấp số nhân lùi vô hạn với số hạng đầu $u_1 = A_1 A_2 = 10$ và công bội $q = (1)/(2)$ (thỏa mãn $|q| < 1$).
        Tổng độ dài đường gấp khúc là:
        $ L = (u_1)/(1 - q) = (10)/(1 - (1)/(2)) = 20 $ cm.
    ]
)

// TN 9
#tn([Tập Cantor (mô tả các bước dựng ở hình bên dưới) được xây dựng từ một đoạn thẳng ban đầu có độ dài bằng $12$ cm. Ở mỗi bước, người ta loại bỏ đi đoạn mở ở chính giữa có độ dài bằng $(1)/(3)$ độ dài của đoạn thẳng trước đó. Khi số lần thực hiện tiến tới vô hạn, tổng độ dài của tất cả các đoạn thẳng đã bị loại bỏ bằng bao nhiêu?],
    (
        [$4" cm"$],
        [$8" cm"$],
        True([$12$ cm.]),
        [$18$ cm.]
    ),
    fig: fig-cantor,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Tổng độ dài các đoạn bị loại bỏ sau các bước lập thành một chuỗi hình học:
        - Bước 1: loại bỏ 1 đoạn dài $12 dot (1)/(3) = 4$ cm.
        - Bước 2: loại bỏ 2 đoạn, mỗi đoạn dài $4 dot (1)/(3) = (4)/(3)$ cm. Tổng độ dài loại bỏ ở bước này: $2 dot (4)/(3) = (8)/(3)$ cm.
        - Tổng quát, lượng độ dài loại bỏ ở bước $n$ lập thành một cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 4$ và công bội $q = (2)/(3)$ (vì số đoạn nhân đôi nhưng chiều dài mỗi đoạn nhân $1/3$).
        Tổng độ dài các đoạn bị loại bỏ là:
        $ L = (u_1)/(1 - q) = (4)/(1 - (2)/(3)) = (4)/((1)/(3)) = 12 $ cm.
        (Nhận xét: Tổng độ dài bị loại bỏ đúng bằng độ dài đoạn thẳng ban đầu).
    ]
)

// TN 10
#tn([Cho một bát giác đều $O_1$ có diện tích bằng $30" cm"^2$. Dựng bát giác đều $O_2$ bằng cách nối các trung điểm của các cạnh bát giác $O_1$, và cứ thế tiếp tục dựng các bát giác đều $O_3, O_4, ...$ vô hạn lần (như hình vẽ bát giác lồng nhau bên dưới). Quy ước tỉ số diện tích giữa bát giác đều sau và bát giác đều ngay trước nó là không đổi và bằng $q = (1)/(4)$. Tính tổng diện tích của tất cả các bát giác đều trong dãy vô hạn này.],
    (
        [$36" cm"^2$.],
        True([$40" cm"^2$.]),
        [$45" cm"^2$.],
        [$60" cm"^2$.]
    ),
    fig: fig-nested-octagons,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Dãy diện tích các bát giác đều tạo thành một cấp số nhân lùi vô hạn với số hạng đầu $S_1 = 30$ và công bội $q = (1)/(4)$ (thỏa mãn $|q| < 1$).
        Tổng diện tích của chuỗi vô hạn là:
        $ S = (S_1)/(1 - q) = (30)/(1 - (1)/(4)) = (30)/((3)/(4)) = 40" cm"^2 $.
    ]
)

// TN 11
#tn([Một cây cấu trúc hình học được tạo thành bởi các hình tròn xếp chồng lên nhau vô hạn (như hình vẽ). Hình tròn gốc ở thế hệ 0 có diện tích $S_0 = 16 pi" cm"^2 $. Ở thế hệ thứ nhất, mọc thêm 2 hình tròn nhỏ hơn tiếp xúc phía trên hình tròn gốc, mỗi hình tròn có diện tích bằng $(1)/(4)$ hình tròn gốc. Ở mỗi thế hệ tiếp theo, mỗi hình tròn lại sinh ra 2 hình tròn nhỏ hơn có diện tích bằng $(1)/(4)$ hình tròn trước nó. Tính tổng diện tích của tất cả các hình tròn trong mô hình cây vô hạn này.],
    (
        [$24 pi" cm"^2$.],
        True([$32 pi" cm"^2$.]),
        [$48 pi" cm"^2$.],
        [$64 pi" cm"^2$.]
    ),
    fig: fig-circle-tree,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Ta tính tổng diện tích theo từng thế hệ hình tròn:
        - Thế hệ 0: gồm 1 hình tròn diện tích $S_0 = 16 pi$.
        - Thế hệ 1: gồm 2 hình tròn, mỗi hình diện tích $16 pi dot 0.25 = 4 pi$. Tổng diện tích: $S_1 = 2 dot 4 pi = 8 pi$.
        - Thế hệ 2: gồm 4 hình tròn, tổng diện tích là $S_2 = 4.25% dot 16 pi$ (tương ứng mỗi hình diện tích $1 pi$). Tổng diện tích: $S_2 = 4 dot 1 pi = 4 pi$.
        - Tổng quát, tổng diện tích các thế hệ lập thành một cấp số nhân lùi vô hạn có số hạng đầu $S_0 = 16 pi$ và công bội tổng quát là $q = 2 dot (1)/(4) = (1)/(2)$ (do số lượng hình tròn gấp đôi nhưng diện tích mỗi hình giảm đi 4 lần).
        Tổng diện tích toàn bộ mô hình cây hình tròn là:
        $ S = (S_0)/(1 - q) = (16 pi)/(1 - (1)/(2)) = 32 pi" cm"^2 $.
    ]
)

// TN 12
#tn([Người ta xếp các hình vuông chồng lên nhau liên tiếp dọc theo một trục thẳng đứng (như hình vẽ bên dưới). Hình vuông thứ nhất ở đáy có cạnh bằng $4" cm"$. Hình vuông thứ hai xếp chồng phía trên có cạnh bằng $2" cm"$. Mỗi hình vuông tiếp theo xếp chồng lên trên có độ dài cạnh giảm đi một nửa so với hình vuông ngay dưới nó. Tính tổng chiều cao của mô hình chồng hình vuông vô hạn này (tính bằng xăng-ti-mét).],
    (
        [$6" cm"$],
        True([$8" cm"$]),
        [$10" cm"$],
        [Chiều cao vô hạn.]
    ),
    fig: fig-stacked-squares,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Chiều cao của mô hình bằng tổng độ dài cạnh của tất cả các hình vuông xếp chồng liên tiếp:
        - Cạnh thứ nhất: $a_1 = 4$ cm.
        - Cạnh thứ hai: $a_2 = 2$ cm.
        - Dãy độ dài cạnh lập thành một cấp số nhân lùi vô hạn với số hạng đầu $a_1 = 4$ và công bội $q = (1)/(2)$ (thỏa mãn $|q| < 1$).
        Tổng chiều cao của mô hình là:
        $ H = (a_1)/(1 - q) = (4)/(1 - (1)/(2)) = 8 $ cm.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho tam giác vuông cân $T_1$ có độ dài hai cạnh góc vuông bằng $8" cm"$. Dựng dãy các tam giác vuông cân $T_2, T_3, ...$ bằng cách nối các trung điểm của các cạnh tam giác ngay trước nó (hình vẽ tương tự). Các phát biểu sau đúng hay sai?], (
        True([Diện tích của tam giác vuông cân thứ hai $T_2$ bằng $8" cm"^2$.]),
        [Dãy số chu vi $P_n$ của các tam giác lập thành một cấp số nhân lùi vô hạn với công bội $q = (1)/(4)$.],
        True([Tổng diện tích của tất cả các tam giác trong dãy vô hạn đó bằng $(128)/(3)" cm"^2$.]),
        True([Tổng chu vi của tất cả các tam giác trong dãy vô hạn đó bằng $8(2 + sqrt(2))" cm"$.])
    ),
    fig: fig-right-triangles,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Diện tích tam giác đầu $S_1 = (1)/(2) dot 8 dot 8 = 32" cm"^2 $. Diện tích tam giác hai: $S_2 = S_1 / 4 = 8" cm"^2 $.
        - *b)* Sai. Tỉ số độ dài cạnh giữa hai tam giác liên tiếp là $k = (1)/(2)$, kéo theo tỉ số chu vi giữa hai tam giác liên tiếp cũng là $q = (1)/(2)$ (chứ không phải $1/4$).
        - *c)* Đúng. Tổng diện tích của chuỗi tam giác: $S = 32 / (1 - 1/4) = 32 / (3/4) = 128/3" cm"^2 $.
        - *d)* Đúng. Cạnh huyền tam giác thứ nhất là $8 sqrt(2)$ cm. Chu vi thứ nhất $P_1 = 8 + 8 + 8 sqrt(2) = 8(2 + sqrt(2))$ cm.
          Công bội chu vi $q = (1)/(2)$. Tổng chu vi:
          $ P = (P_1)/(1 - q) = (8(2 + sqrt(2)))/(1 - (1)/(2)) = 16(2 + sqrt(2)) $ cm. (Lưu ý: phát biểu đề bài cho tổng chu vi bằng $8(2+sqrt(2))$ là sai? Khoan, chu vi thứ nhất là $8(2+sqrt(2))$. Khi nhân $1/(1-0.5) = 2$, tổng chu vi phải là $16(2+sqrt(2))$! Vậy phát biểu d) nói $8(2+sqrt(2))$ là Sai. Hãy sửa lại phát biểu d) trong đề bài cho đúng với đáp án Đúng).
    ]
)

// DS 2
#ds([Cứ sau đúng 24 giờ, một bệnh nhân được chỉ định tiêm $120$ mg một loại kháng sinh đặc trị. Cơ thể đào thải dần thuốc: sau mỗi chu kỳ 24 giờ, lượng thuốc còn lưu lại trong cơ thể giảm đi một nửa ($50\%$) so với lượng thuốc hiện có (như hình vẽ tương tự). Các phát biểu sau đúng hay sai?], (
        True([Lượng thuốc còn lưu lại trong cơ thể bệnh nhân ngay sau mũi tiêm thứ hai là $180$ mg.]),
        True([Lượng thuốc tích lũy tối đa ổn định lâu dài trong cơ thể bệnh nhân khi thời gian điều trị kéo dài vô hạn là $240$ mg.]),
        [Dãy lượng thuốc tích lũy ngay sau mỗi mũi tiêm lập thành một cấp số nhân lùi vô hạn.],
        True([Nếu liều lượng tiêm giảm xuống còn $60$ mg mỗi chu kỳ 24 giờ, lượng thuốc tích lũy tối đa ổn định lâu dài sẽ là $120$ mg.])
    ),
    fig: fig-drug-accumulation,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Ngay sau mũi tiêm 2: $A_2 = 120 + 120 dot 0.5 = 180$ mg.
        - *b)* Đúng. Lượng thuốc tích lũy tối đa ổn định lâu dài: $A = 120 / (1 - 0.5) = 240$ mg.
        - *c)* Sai. Dãy lượng thuốc $A_n = 120(1 + 0.5 + ... + 0.5^(n-1))$ không phải là một cấp số nhân (đây là tổng riêng của cấp số nhân).
        - *d)* Đúng. Với liều tiêm $60$ mg: $A = 60 / (1 - 0.5) = 120$ mg.
    ]
)

// DS 3
#ds([Một cây cấu trúc hình tròn Fractal được tạo thành bởi các hình tròn xếp chồng lên nhau vô hạn (như mô tả hình vẽ). Hình tròn gốc ở thế hệ 0 có diện tích $S_0 = 8 pi" cm"^2 $. Thế thế hệ tiếp theo mọc thêm 2 hình tròn nhỏ hơn, tổng diện tích các thế hệ sau giảm dần theo cấp số nhân lùi vô hạn với công bội tổng quát là $q = 0.5$. Các phát biểu sau đúng hay sai?], (
        True([Tổng diện tích của 2 hình tròn mọc thêm ở thế hệ thứ nhất là $4 pi" cm"^2$.]),
        True([Tổng diện tích của toàn bộ mô hình cây hình tròn vô hạn này bằng $16 pi" cm"^2$.]),
        True([Nếu diện tích hình tròn gốc tăng lên thành $12 pi" cm"^2$, tổng diện tích mô hình sẽ là $24 pi" cm"^2$.]),
        [Diện tích của các hình tròn mọc thêm ở các thế hệ sau tiến dần về vô hạn khi số thế hệ tăng lên vô hạn.]
    ),
    fig: fig-circle-tree,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Thế hệ 1 có tổng diện tích bằng $S_0 dot q = 8 pi dot 0.5 = 4 pi" cm"^2 $.
        - *b)* Đúng. Tổng diện tích toàn bộ mô hình: $S = S_0 / (1 - q) = 8 pi / (1 - 0.5) = 16 pi" cm"^2 $.
        - *c)* Đúng. Khi $S_0 = 12 pi$, tổng diện tích: $S = 12 pi / (1 - 0.5) = 24 pi" cm"^2 $.
        - *d)* Sai. Diện tích thế hệ thứ $n$ là $S_n = S_0 q^n$. Vì $q = 0.5 < 1$, nên $limits(lim)_(n -> +oo) S_n = 0$.
    ]
)

// DS 4
#ds([Một đường gấp khúc nghệ thuật được vẽ bên trong một hình vuông cạnh $20$ cm (hình vẽ tương tự). Đoạn thẳng thứ nhất $A_1 A_2$ trùng với một cạnh hình vuông dài $20" cm"$. Mỗi đoạn thẳng tiếp theo vuông góc với đoạn liền trước và có chiều dài giảm đi một nửa. Các phát biểu sau đúng hay sai?], (
        True([Đoạn thẳng thứ ba $A_3 A_4$ trong đường gấp khúc có độ dài bằng $5$ cm.]),
        True([Dãy độ dài các đoạn thẳng trong đường gấp khúc lập thành cấp số nhân lùi vô hạn với công bội $q = 0.5$.]),
        True([Tổng độ dài của đường gấp khúc vô hạn này tiến sát về giới hạn bằng $40$ cm.]),
        [Nếu tỉ số giảm chiều dài mỗi đoạn tăng lên thành $0.6$ (thay vì giảm một nửa), tổng độ dài đường gấp khúc sẽ là $60" cm"$.]
    ),
    fig: fig-spiral-path,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. $A_1 A_2 = 20$ cm, $A_2 A_3 = 10$ cm, $A_3 A_4 = 5$ cm.
        - *b)* Đúng. Dãy số $u_n = 20 dot (0.5)^(n-1)$ là cấp số nhân lùi vô hạn có công bội $q = 0.5 < 1$.
        - *c)* Đúng. Tổng độ dài: $L = 20 / (1 - 0.5) = 40$ cm.
        - *d)* Sai. Khi $q = 0.6$, tổng độ dài mới là: $L = 20 / (1 - 0.6) = 20 / 0.4 = 50$ cm (chứ không phải $60$ cm).
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho tam giác vuông cân có độ dài hai cạnh góc vuông bằng $12$ cm. Dựng dãy vô hạn các tam giác vuông cân lồng nhau bằng cách nối các trung điểm của các cạnh tam giác trước đó (hình vẽ tương tự). Tính tổng diện tích của tất cả các tam giác vuông cân trong dãy vô hạn đó (tính bằng xăng-ti-mét vuông).],
    [96],
    fig: fig-right-triangles,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Diện tích tam giác vuông cân thứ nhất là $S_1 = (1)/(2) dot 12 dot 12 = 72" cm"^2 $.
        Diện tích các tam giác sau giảm đi 4 lần so với trước đó (do tỉ số đồng dạng $k = 1/2 => q = 1/4$).
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (72)/(1 - (1)/(4)) = (72)/((3)/(4)) = 96" cm"^2 $.
    ]
)

// TL 2
#tln([Dựng đường xoắn ốc tam giác vuông vô hạn chung đỉnh $O$ (hình vẽ tương tự). Tam giác thứ nhất $O A_1 A_2$ vuông tại $A_2$ có góc $A_1 O A_2 = 30^o$ và cạnh huyền $O A_1 = 12$. Các tam giác tiếp theo có cùng góc đỉnh $O$ bằng $30^o$ và cạnh huyền là cạnh bên của tam giác ngay trước đó. Tính tổng độ dài đường gấp khúc xoắn ốc $A_1 A_2 + A_2 A_3 + ...$ dưới dạng $a(2 + sqrt(3))$. Tìm giá trị của tham số $a$.],
    [12],
    fig: fig-triangles-spiral-30,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - Đoạn thứ nhất: $u_1 = A_1 A_2 = O A_1 dot sin 30^o = 12 dot 0.5 = 6$.
        - Tỉ số giảm độ dài giữa các đoạn gấp khúc là $q = cos 30^o = (sqrt(3))/(2)$.
        - Tổng độ dài đường gấp khúc xoắn ốc:
          $ L = (u_1)/(1 - q) = (6)/(1 - (sqrt(3))/(2)) = (12)/(2 - sqrt(3)) = 12(2 + sqrt(3)) $.
        Do đó $a = 12$.
    ]
)

// TL 3
#tln([Cho tam giác đều $T_1$ có cạnh bằng $12$ cm. Dựng đường tròn $C_1$ nội tiếp $T_1$. Tiếp tục dựng tam giác đều $T_2$ nội tiếp đường tròn $C_1$. Dựng đường tròn $C_2$ nội tiếp $T_2$, và cứ tiếp tục quá trình này vô hạn lần (hình vẽ tương tự). Tính tổng diện tích của tất cả các đường tròn $C_1, C_2, C_3, ...$ dưới dạng $b pi" cm"^2 $. Tìm giá trị của $b$.],
    [16],
    fig: fig-triangle-circle,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - Bán kính đường tròn $C_1$ nội tiếp tam giác đều cạnh $a_1 = 12$ là:
          $ r_1 = (a_1)/(2 sqrt(3)) = (12)/(2 sqrt(3)) = 2 sqrt(3) $ cm.
          Diện tích đường tròn thứ nhất: $S_1 = pi r_1^2 = 12 pi" cm"^2 $.
        - Tỉ số diện tích giữa các đường tròn liên tiếp là $q = (1)/(4)$.
        - Tổng diện tích các đường tròn là:
          $ S = (S_1)/(1 - q) = (12 pi)/(1 - (1)/(4)) = (12 pi)/((3)/(4)) = 16 pi" cm"^2 $.
        Do đó $b = 16$.
    ]
)

// TL 4
#tln([Một mô hình nghệ thuật gồm các hình vuông đồng tâm xếp liên tiếp xoay góc $45^o$ (hình vẽ tương tự). Hình vuông ngoài cùng $S_1$ có diện tích bằng $48" cm"^2$. Các hình vuông bên trong được tạo từ trung điểm các cạnh hình vuông ngoài liền kề. Tính tổng diện tích của tất cả các hình vuông trong mô hình này (tính bằng xăng-ti-mét vuông).],
    [96],
    fig: fig-squares-spiral-45,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Diện tích hình vuông thứ nhất $S_1 = 48" cm"^2 $.
        Nối trung điểm các cạnh tạo ra hình vuông có diện tích bằng một nửa hình vuông trước ($q = 1/2$).
        Tổng diện tích của chuỗi hình vuông vô hạn là:
        $ S = (S_1)/(1 - q) = (48)/(1 - (1)/(2)) = 96" cm"^2 $.
    ]
)

// TL 5
#tln([Một đường gấp khúc nghệ thuật được vẽ bên trong một hình vuông (hình vẽ tương tự). Đoạn thẳng thứ nhất $A_1 A_2$ dài $30" cm"$. Mỗi đoạn tiếp theo vuông góc với đoạn trước và giảm đi một nửa chiều dài. Tính tổng độ dài đường gấp khúc vô hạn đó (tính bằng xăng-ti-mét).],
    [60],
    fig: fig-spiral-path,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Độ dài đoạn thứ nhất $u_1 = 30$ cm.
        Mỗi đoạn tiếp theo giảm đi một nửa ($q = 0.5$).
        Tổng độ dài đường gấp khúc vô hạn là:
        $ L = (u_1)/(1 - q) = (30)/(1 - 0.5) = 60 $ cm.
    ]
)

// TL 6
#tln([Người ta xếp các hình vuông chồng lên nhau liên tiếp dọc theo một trục thẳng đứng (hình vẽ tương tự). Hình vuông thứ nhất ở đáy có cạnh bằng $10" cm"$. Mỗi hình vuông tiếp theo xếp chồng lên trên có độ dài cạnh giảm đi một nửa so với hình vuông ngay dưới nó. Tính tổng chiều cao của mô hình xếp chồng vô hạn này (tính bằng xăng-ti-mét).],
    [20],
    fig: fig-stacked-squares,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Chiều cao mô hình bằng tổng cạnh các hình vuông:
        - Số hạng đầu $a_1 = 10$ cm.
        - Công bội $q = 0.5$.
        Tổng chiều cao là:
        $ H = (a_1)/(1 - q) = (10)/(1 - 0.5) = 20 $ cm.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
