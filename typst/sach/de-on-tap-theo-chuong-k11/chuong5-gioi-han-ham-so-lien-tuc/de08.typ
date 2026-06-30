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

// Hình 1: Hình vuông lồng nhau vô hạn
#let fig-nested-squares = canvas(length: 1cm, {
  import draw: *
  rect((0,0), (4,4), stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  line((2,0), (4,2), (2,4), (0,2), close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  line((3,1), (3,3), (1,3), (1,1), close: true, stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
  line((2,1), (3,2), (2,3), (1,2), close: true, stroke: 0.8pt + rgb("#e67e22"))
  content((0, 4.3), [A])
  content((4, 4.3), [B])
  content((4, -0.3), [C])
  content((0, -0.3), [D])
})

#let fig-nested-triangles = canvas(length: 1.2cm, {
  import draw: *
  let h = calc.sqrt(3)
  
  let colors = (
    rgb("#0057b8"), // Xanh dương
    rgb("#cc2200"), // Đỏ
    rgb("#1a7a2e"), // Xanh lá
    rgb("#e67e22"), // Cam
    rgb("#9b59b6"), // Tím
  )
  
  let pts = ((0, 0), (4, 0), (2, 2 * h))
  
  for i in range(5) {
    let stroke-width = 1.5pt - i * 0.25pt
    let col = colors.at(i)
    line(..pts, close: true, stroke: stroke-width + col, fill: col.lighten(92%))
    
    let (p1, p2, p3) = pts
    let m1 = ((p1.at(0) + p2.at(0))/2, (p1.at(1) + p2.at(1))/2)
    let m2 = ((p2.at(0) + p3.at(0))/2, (p2.at(1) + p3.at(1))/2)
    let m3 = ((p3.at(0) + p1.at(0))/2, (p3.at(1) + p1.at(1))/2)
    pts = (m1, m2, m3)
  }
  
  content((2, 2 * h + 0.3), [A])
  content((-0.2, -0.2), [B])
  content((4.2, -0.2), [C])
})

// Hình 3: Hình vuông và hình tròn lồng nhau
#let fig-square-circle-nest = canvas(length: 1cm, {
  import draw: *
  rect((0,0), (4,4), stroke: 1.2pt + rgb("#0057b8"))
  circle((2,2), radius: 2, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(95%))
  line((2,0), (4,2), (2,4), (0,2), close: true, stroke: 1.0pt + rgb("#1a7a2e"))
  circle((2,2), radius: calc.sqrt(2), stroke: 1.0pt + rgb("#e67e22"), fill: rgb("#e67e22").lighten(95%))
  line((3,1), (3,3), (1,3), (1,1), close: true, stroke: 0.8pt + rgb("#9b59b6"))
})

// Hình 4: Đường xoắn ốc nửa đường tròn (Lưu ý: arc vẽ từ start point)
#let fig-semicircle-spiral = canvas(length: 0.35cm, {
  import draw: *
  line((-2, 0), (20, 0), stroke: 0.5pt + gray)
  
  arc((0, 0), start: 180deg, stop: 0deg, radius: 8, stroke: 1.5pt + rgb("#0057b8"))
  arc((16, 0), start: 0deg, stop: -180deg, radius: 4, stroke: 1.3pt + rgb("#cc2200"))
  arc((8, 0), start: 180deg, stop: 0deg, radius: 2, stroke: 1.1pt + rgb("#1a7a2e"))
  arc((12, 0), start: 0deg, stop: -180deg, radius: 1, stroke: 0.9pt + rgb("#e67e22"))
  
  circle((0,0), radius: 2.5pt, fill: black)
  content((0, -0.8), [$A_1$])
  circle((16,0), radius: 2.5pt, fill: black)
  content((16, 0.8), [$A_2$])
  circle((8,0), radius: 2.5pt, fill: black)
  content((8, -0.8), [$A_3$])
  circle((12,0), radius: 2.5pt, fill: black)
  content((12, 0.8), [$A_4$])
})

// Hình 5: Đường gấp khúc trong góc 30 độ
#let fig-zigzag-angle = canvas(length: 1cm, {
  import draw: *
  line((0, 0), (7.5, 0), stroke: 1.2pt + black) 
  line((0, 0), (7.5 * calc.cos(30deg), 7.5 * calc.sin(30deg)), stroke: 1.2pt + black) 
  
  arc((1, 0), start: 0deg, stop: 30deg, radius: 1, stroke: 0.8pt + red)
  content((1.4, 0.35), [30°])
  
  let p1 = (6, 0)
  let p2 = (4.5, 1.5 * calc.sqrt(3))
  let p3 = (4.5, 0)
  let p4 = (3.375, 1.125 * calc.sqrt(3))
  let p5 = (3.375, 0)
  
  line(p1, p2, stroke: 1.5pt + rgb("#cc2200"))
  line(p2, p3, stroke: 1.5pt + rgb("#0057b8"))
  line(p3, p4, stroke: 1.5pt + rgb("#1a7a2e"))
  line(p4, p5, stroke: 1.5pt + rgb("#e67e22"))
  
  circle((0,0), radius: 2.5pt, fill: black)
  content((0, -0.3), [O])
  circle(p1, radius: 2.5pt, fill: rgb("#cc2200"))
  content((6, -0.35), [$A_1$])
  circle(p2, radius: 2.5pt, fill: rgb("#0057b8"))
  content((4.5, 1.5 * calc.sqrt(3) + 0.35), [$A_2$])
  circle(p3, radius: 2.5pt, fill: rgb("#1a7a2e"))
  content((4.5, -0.35), [$A_3$])
  circle(p4, radius: 2.5pt, fill: rgb("#e67e22"))
  content((3.375, 1.125 * calc.sqrt(3) + 0.35), [$A_4$])
  
  content((7.7, 0), [x])
  content((7.5 * calc.cos(30deg) + 0.2, 7.5 * calc.sin(30deg) + 0.1), [y])
})

// Hình 6: Lục giác đều lồng nhau vô hạn
#let fig-nested-hexagons = canvas(length: 1.2cm, {
  import draw: *
  let pts1 = range(6).map(i => {
    let a = i * 60deg
    (2 * calc.cos(a), 2 * calc.sin(a))
  })
  line(..pts1, close: true, stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  
  let r2 = 2 * calc.cos(30deg)
  let pts2 = range(6).map(i => {
    let a = i * 60deg + 30deg
    (r2 * calc.cos(a), r2 * calc.sin(a))
  })
  line(..pts2, close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  
  let r3 = r2 * calc.cos(30deg)
  let pts3 = range(6).map(i => {
    let a = i * 60deg
    (r3 * calc.cos(a), r3 * calc.sin(a))
  })
  line(..pts3, close: true, stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
})

// Hình 7: Cây phân nhánh Fractal
#let fig-tree-fractal = canvas(length: 0.8cm, {
  import draw: *
  line((0,0), (0,2), stroke: 2.5pt + rgb("#8b5a2b"))
  
  line((0,2), (-1.2, 3.2), stroke: 1.8pt + rgb("#27ae60"))
  line((0,2), (1.2, 3.2), stroke: 1.8pt + rgb("#27ae60"))
  
  line((-1.2, 3.2), (-2.0, 4.1), stroke: 1.2pt + rgb("#2ecc71"))
  line((-1.2, 3.2), (-0.6, 4.1), stroke: 1.2pt + rgb("#2ecc71"))
  line((1.2, 3.2), (0.6, 4.1), stroke: 1.2pt + rgb("#2ecc71"))
  line((1.2, 3.2), (2.0, 4.1), stroke: 1.2pt + rgb("#2ecc71"))
  
  line((-2.0, 4.1), (-2.5, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
  line((-2.0, 4.1), (-1.7, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
  line((-0.6, 4.1), (-0.9, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
  line((-0.6, 4.1), (-0.3, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
  line((0.6, 4.1), (0.3, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
  line((0.6, 4.1), (0.9, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
  line((2.0, 4.1), (1.7, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
  line((2.0, 4.1), (2.5, 4.7), stroke: 0.8pt + rgb("#e74c3c"))
})

// Hình 8: Hình xoắn ốc tam giác vuông cân liên tiếp
#let fig-triangles-spiral = canvas(length: 1cm, {
  import draw: *
  let O = (0,0)
  let p1 = (4,0)
  let p2 = (2,2)
  let p3 = (0,2)
  let p4 = (-1,1)
  let p5 = (-1,0)
  
  line(O, p1, p2, close: true, stroke: 1.2pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(90%))
  line(O, p2, p3, close: true, stroke: 1.2pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(92%))
  line(O, p3, p4, close: true, stroke: 1.0pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(92%))
  line(O, p4, p5, close: true, stroke: 1.0pt + rgb("#e67e22"), fill: rgb("#e67e22").lighten(92%))
  
  circle(O, radius: 2.5pt, fill: black)
  content((0, -0.3), [O])
  content((4.2, -0.2), [$A_1$])
  content((2.2, 2.2), [$A_2$])
  content((-0.2, 2.2), [$A_3$])
})

// Hình 9: Đường gấp khúc Koch bước 1
#let fig-koch-step = canvas(length: 0.8cm, {
  import draw: *
  let h = calc.sqrt(3)
  line((0,0), (2,0), (3, h), (4,0), (6,0), stroke: 1.5pt + rgb("#0057b8"))
  line((2,0), (4,0), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  circle((0,0), radius: 2pt, fill: black)
  circle((6,0), radius: 2pt, fill: black)
})

// Hình 10: Quả cầu nội tiếp chồng nhau trong hình nón
#let fig-cone-spheres = canvas(length: 1.2cm, {
  import draw: *
  let h = calc.sqrt(3)
  line((-3, 0), (3, 0), (0, 3 * h), close: true, stroke: 1.5pt + black)
  circle((0, h), radius: h, stroke: 1.2pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(92%))
  circle((0, 7/3 * h), radius: h/3, stroke: 1.0pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(94%))
  circle((0, 25/9 * h), radius: h/9, stroke: 0.8pt + rgb("#1a7a2e"), fill: rgb("#1a7a2e").lighten(94%))
})

// Hình 11: Đường gấp khúc trong góc 60 độ
#let fig-zigzag-60 = canvas(length: 1.2cm, {
  import draw: *
  let h = calc.sqrt(3)
  line((0, 0), (5, 0), stroke: 1.2pt + black)
  line((0, 0), (5 * 0.5, 5 * 0.5 * h), stroke: 1.2pt + black)
  
  arc((0.8, 0), start: 0deg, stop: 60deg, radius: 0.8, stroke: 0.8pt + red)
  content((1.2, 0.6), [60°])
  
  let p1 = (4, 0)
  let p2 = (1, h)
  let p3 = (1, 0)
  let p4 = (0.25, 0.25 * h)
  let p5 = (0.25, 0)
  
  line(p1, p2, stroke: 1.5pt + rgb("#cc2200"))
  line(p2, p3, stroke: 1.5pt + rgb("#0057b8"))
  line(p3, p4, stroke: 1.5pt + rgb("#1a7a2e"))
  line(p4, p5, stroke: 1.5pt + rgb("#e67e22"))
  
  circle((0,0), radius: 2.5pt, fill: black)
  content((0, -0.3), [O])
  circle(p1, radius: 2.5pt, fill: rgb("#cc2200"))
  content((4, -0.35), [$M_1$])
  circle(p2, radius: 2.5pt, fill: rgb("#0057b8"))
  content((1.1, h + 0.35), [$M_2$])
  circle(p3, radius: 2.5pt, fill: rgb("#1a7a2e"))
  content((1.1, -0.35), [$M_3$])
  
  content((5.2, 0), [x])
  content((2.7, 2.5 * h + 0.1), [y])
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 5",
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 08)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho hình vuông $C_1$ có diện tích bằng $36$. Người ta nối trung điểm các cạnh của hình vuông $C_1$ để tạo thành hình vuông $C_2$, nối trung điểm các cạnh của $C_2$ để tạo thành $C_3$, và cứ tiếp tục như vậy vô hạn lần (như hình vẽ minh họa bên dưới). Tính tổng diện tích của tất cả các hình vuông trong dãy vô hạn $C_1, C_2, C_3, ...$],
    (
        [$54$],
        True([$72$]),
        [$108$],
        [$144$]
    ),
    fig: fig-nested-squares,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Diện tích hình vuông ban đầu là $S_1 = 36$.
        Mỗi hình vuông tiếp theo được tạo từ trung điểm các cạnh của hình vuông ngay trước đó sẽ có diện tích bằng $(1)/(2)$ diện tích hình vuông trước nó.
        Dãy diện tích các hình vuông lập thành một cấp số nhân lùi vô hạn với số hạng đầu $S_1 = 36$ và công bội $q = (1)/(2)$ (thỏa mãn $|q| < 1$).
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (36)/(1 - (1)/(2)) = 72 $.
    ]
)

// TN 2
#tn([Cho hình vuông $C_1$ có cạnh bằng $4$ cm. Nối trung điểm các cạnh của $C_1$ để được hình vuông $C_2$, nối trung điểm các cạnh của $C_2$ để được hình vuông $C_3$, và cứ tiếp tục như vậy vô hạn lần (như hình vẽ minh họa bên dưới). Tính tổng chu vi của tất cả các hình vuông trong dãy vô hạn này (tính bằng xăng-ti-mét).],
    (
        [$16(2 - sqrt(2))$ cm.],
        True([$16(2 + sqrt(2))$ cm.]),
        [$32(2 + sqrt(2))$ cm.],
        [$32(2 - sqrt(2))$ cm.]
    ),
    fig: fig-nested-squares,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Chu vi hình vuông thứ nhất: $P_1 = 4 dot 4 = 16$ cm.
        - Cạnh hình vuông thứ hai: $a_2 = sqrt( 2^2 + 2^2 ) = 2 sqrt(2)$ cm.
          Chu vi hình vuông thứ hai: $P_2 = 4 dot 2 sqrt(2) = 8 sqrt(2)$ cm.
        - Dãy chu vi lập thành cấp số nhân lùi vô hạn có số hạng đầu $P_1 = 16$ và công bội $q = (P_2)/(P_1) = (8 sqrt(2))/(16) = (sqrt(2))/(2)$ (thỏa mãn $|q| < 1$).
        Tổng chu vi là:
        $ P = (P_1)/(1 - q) = (16)/(1 - (sqrt(2))/(2)) = (32)/(2 - sqrt(2)) = 16(2 + sqrt(2)) $ cm.
    ]
)

// TN 3
#tn([Cho tam giác đều $T_1$ có cạnh bằng $8$ cm. Nối trung điểm các cạnh của $T_1$ để được tam giác đều $T_2$, nối trung điểm các cạnh của $T_2$ để được tam giác đều $T_3$, và cứ tiếp tục như vậy vô hạn lần (như hình vẽ minh họa). Tính tổng diện tích của tất cả các tam giác trong dãy vô hạn đó (tính bằng xăng-ti-mét vuông).],
    (
        [$16 sqrt(3)$],
        [$32 sqrt(3)$],
        True([$(64 sqrt(3))/(3)$]),
        [$(32 sqrt(3))/(3)$]
    ),
    fig: fig-nested-triangles,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Diện tích tam giác đều $T_1$: $S_1 = (8^2 sqrt(3))/(4) = 16 sqrt(3)$ $"cm"^2$.
        - Mỗi tam giác đều tiếp theo có diện tích bằng $(1)/(4)$ diện tích tam giác ngay trước nó.
        - Dãy diện tích lập thành cấp số nhân lùi vô hạn với số hạng đầu $S_1 = 16 sqrt(3)$ và công bội $q = (1)/(4)$ (thỏa mãn $|q| < 1$).
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (16 sqrt(3))/(1 - (1)/(4)) = (16 sqrt(3))/((3)/(4)) = (64 sqrt(3))/(3) $ $"cm"^2$.
    ]
)

// TN 4
#tn([Cho hình vuông $C_1$ cạnh bằng $2$. Dựng đường tròn $D_1$ nội tiếp $C_1$. Dựng hình vuông $C_2$ nội tiếp $D_1$. Dựng đường tròn $D_2$ nội tiếp $C_2$, và cứ tiếp tục như vậy vô hạn lần (như hình vẽ minh họa). Tính tổng diện tích của tất cả các hình tròn $D_1, D_2, D_3, ...$],
    (
        [$pi$],
        [$1.5 pi$],
        True([$2 pi$]),
        [$4 pi$]
    ),
    fig: fig-square-circle-nest,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Bán kính đường tròn $D_1$ nội tiếp $C_1$: $R_1 = (2)/(2) = 1$.
          Diện tích đường tròn thứ nhất: $S_1 = pi R_1^2 = pi$.
        - Hình vuông $C_2$ nội tiếp $D_1$ có bán kính đường tròn ngoại tiếp bằng bán kính $D_1$ là $R_1 = 1$.
          Độ dài đường chéo $C_2$ bằng $2$. Cạnh hình vuông $C_2$ là $a_2 = sqrt(2)$.
        - Bán kính đường tròn $D_2$ nội tiếp $C_2$: $R_2 = (a_2)/(2) = (sqrt(2))/(2)$.
          Diện tích đường tròn thứ hai: $S_2 = pi R_2^2 = (pi)/(2)$.
        - Dãy diện tích các đường tròn lập thành một cấp số nhân lùi vô hạn với số hạng đầu $S_1 = pi$ và công bội $q = (S_2)/(S_1) = (1)/(2)$.
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (pi)/(1 - (1)/(2)) = 2 pi $.
    ]
)

// TN 5
#tn([Cho góc nhọn $x O y = 30^o$. Điểm $A_1$ nằm trên cạnh $O x$ sao cho $O A_1 = 4$. Hạ hình chiếu vuông góc $A_2$ của $A_1$ trên cạnh $O y$. Hạ hình chiếu vuông góc $A_3$ của $A_2$ trên cạnh $O x$, và cứ tiếp tục quá trình này vô hạn lần để tạo thành đường gấp khúc $A_1 A_2 A_3 A_4 ...$ (như hình vẽ bên dưới). Tính tổng độ dài đường gấp khúc vô hạn này.],
    (
        [$4(2 - sqrt(3))$],
        True([$4(2 + sqrt(3))$]),
        [$8(2 + sqrt(3))$],
        [$8(2 - sqrt(3))$]
    ),
    fig: fig-zigzag-angle,
    fig-pos: "center",
    fig-width: 45%,
    loigiai: [
        Xét các tam giác vuông liên tiếp:
        - Trong tam giác vuông $O A_1 A_2$ vuông tại $A_2$: $A_1 A_2 = O A_1 dot sin 30^o = 4 dot (1)/(2) = 2$.
          Cạnh kề $O A_2 = O A_1 dot cos 30^o = 4 dot (sqrt(3))/(2) = 2 sqrt(3)$.
        - Trong tam giác vuông $O A_2 A_3$ vuông tại $A_3$ trên $O x$: $A_2 A_3 = O A_2 dot sin 30^o = 2 sqrt(3) dot (1)/(2) = sqrt(3)$.
        - Nhận thấy độ dài các đoạn gấp khúc $d_n = A_n A_(n+1)$ lập thành cấp số nhân lùi vô hạn với số hạng đầu $d_1 = 2$ và công bội $q = cos 30^o = (sqrt(3))/(2)$ (vì $d_(n+1) = d_n cos 30^o$).
        Tổng độ dài là:
        $ d = (d_1)/(1 - q) = (2)/(1 - (sqrt(3))/(2)) = (4)/(2 - sqrt(3)) = 4(2 + sqrt(3)) $.
    ]
)

// TN 6
#tn([Một đường xoắn ốc nghệ thuật được tạo bởi các cung tròn nối tiếp nhau vô hạn lần (như hình vẽ minh họa bên dưới). Cung tròn thứ nhất là nửa đường tròn có bán kính $R_1 = 8$ cm. Cung tròn thứ hai là nửa đường tròn có bán kính $R_2 = 4$ cm. Mỗi cung tròn tiếp theo là nửa đường tròn có bán kính giảm đi một nửa so với cung trước đó. Tính tổng độ dài của đường xoắn ốc đó (tính bằng xăng-ti-mét).],
    (
        [$8 pi$ cm.],
        [$12 pi$ cm.],
        True([$16 pi$ cm.]),
        [$32 pi$ cm.]
    ),
    fig: fig-semicircle-spiral,
    fig-pos: "center",
    fig-width: 55%,
    loigiai: [
        - Độ dài cung tròn thứ $n$ (nửa đường tròn) là: $L_n = pi R_n$.
        - Độ dài cung thứ nhất: $L_1 = 8 pi$.
        - Độ dài cung thứ hai: $L_2 = 4 pi$.
        - Dãy độ dài lập thành cấp số nhân lùi vô hạn có số hạng đầu $L_1 = 8 pi$ và công bội $q = (1)/(2)$ (thỏa mãn $|q| < 1$).
        Tổng độ dài xoắn ốc là:
        $ L = (L_1)/(1 - q) = (8 pi)/(1 - (1)/(2)) = 16 pi $ cm.
    ]
)

// TN 7
#tn([Cho một lục giác đều $H_1$ có diện tích bằng $24$. Người ta nối trung điểm các cạnh liên tiếp của lục giác đều $H_1$ để tạo thành lục giác đều $H_2$, nối trung điểm các cạnh liên tiếp của $H_2$ để tạo thành lục giác đều $H_3$, và cứ tiếp tục như vậy vô hạn lần (như hình vẽ minh họa). Tính tổng diện tích của tất cả các lục giác đều trong dãy vô hạn đó.],
    (
        [$48$],
        [$72$],
        True([$96$]),
        [$120$]
    ),
    fig: fig-nested-hexagons,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Xét lục giác đều có cạnh $a$. Chiều cao của tam giác đều cấu thành lục giác là $(a sqrt(3))/(2)$.
        - Lục giác đều tiếp theo dựng từ trung điểm các cạnh của lục giác trước sẽ có cạnh bằng $(a sqrt(3))/(2)$.
        - Do đó, tỉ số diện tích giữa hai lục giác liên tiếp là $q = ( (sqrt(3))/(2) )^2 = (3)/(4)$.
        - Dãy diện tích lập thành cấp số nhân lùi vô hạn với số hạng đầu $S_1 = 24$ và công bội $q = (3)/(4)$ (thỏa mãn $|q| < 1$).
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (24)/(1 - (3)/(4)) = (24)/((1)/(4)) = 96 $.
    ]
)

// TN 8
#tn([Một mô hình cây nghệ thuật phát triển từ một đoạn thân thẳng đứng dài $10$ cm. Từ ngọn thân, mọc ra hai nhánh nghiêng đối xứng nhau, mỗi nhánh có chiều dài bằng $40\%$ chiều dài của thân trước đó. Từ đầu mỗi nhánh lại mọc ra hai nhánh nhỏ hơn dài bằng $40\%$ nhánh liền trước, và cứ thế tiếp tục quá trình này vô hạn lần (như mô hình vẽ bên dưới). Tính tổng chiều dài của thân cây và tất cả các nhánh trong mô hình này (tính bằng xăng-ti-mét).],
    (
        [$20$ cm.],
        [$40$ cm.],
        True([$50$ cm.]),
        [Cây dài vô hạn.]
    ),
    fig: fig-tree-fractal,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Ta tính tổng chiều dài theo từng thế hệ nhánh:
        - Thân ban đầu (thế hệ 0): $L_0 = 10$ cm.
        - Thế hệ 1: gồm 2 nhánh, mỗi nhánh dài $10 dot 0.4 = 4$ cm. Tổng chiều dài thế hệ 1: $L_1 = 2 dot 4 = 8$ cm.
        - Thế hệ 2: gồm 4 nhánh, mỗi nhánh dài $4 dot 0.4 = 1.6$ cm. Tổng chiều dài thế hệ 2: $L_2 = 4 dot 1.6 = 6.4$ cm.
        - Nhận thấy tổng chiều dài các thế hệ lập thành cấp số nhân lùi vô hạn có số hạng đầu $L_0 = 10$ và công bội tổng quát là $q = 2 dot 0.4 = 0.8$ (do số nhánh gấp đôi nhưng chiều dài mỗi nhánh nhân $0.4$). Vì $|0.8| < 1$ nên chuỗi hội tụ.
        Tổng chiều dài toàn bộ mô hình cây là:
        $ L = (L_0)/(1 - q) = (10)/(1 - 0.8) = (10)/(0.2) = 50 $ cm.
    ]
)

// TN 9
#tn([Cho tam giác vuông cân $O A_1 A_2$ vuông tại $A_2$ có cạnh huyền $O A_1 = 4$. Dựng tiếp tam giác vuông cân $O A_2 A_3$ vuông cân tại $A_3$ có cạnh huyền là cạnh bên $O A_2$, dựng tiếp tam giác vuông cân $O A_3 A_4$ vuông cân tại $A_4$, và cứ thế vô hạn lần để tạo thành một hình xoắn ốc tam giác (như hình vẽ minh họa bên dưới). Tính tổng diện tích của tất cả các tam giác vuông cân trong dãy vô hạn đó.],
    (
        [$4$],
        [$6$],
        True([$8$]),
        [$12$]
    ),
    fig: fig-triangles-spiral,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - Cạnh huyền tam giác thứ nhất $O A_1 = 4$. Vì tam giác vuông cân tại $A_2$ nên:
          $ O A_2 = A_1 A_2 = (O A_1)/(sqrt(2)) = (4)/(sqrt(2)) = 2 sqrt(2) $.
          Diện tích tam giác thứ nhất: $S_1 = (1)/(2) A_1 A_2 dot O A_2 = (1)/(2) dot 2 sqrt(2) dot 2 sqrt(2) = 4$.
        - Tam giác thứ hai $O A_2 A_3$ vuông cân tại $A_3$ có cạnh huyền $O A_2 = 2 sqrt(2)$:
          $ O A_3 = (O A_2)/(sqrt(2)) = (2 sqrt(2))/(sqrt(2)) = 2 $.
          Diện tích tam giác thứ hai: $S_2 = (1)/(2) O A_3^2 = (1)/(2) dot 2^2 = 2$.
        - Dãy diện tích các tam giác lập thành một cấp số nhân lùi vô hạn với số hạng đầu $S_1 = 4$ và công bội $q = (S_2)/(S_1) = (2)/(4) = (1)/(2)$.
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (4)/(1 - (1)/(2)) = 8 $.
    ]
)

// TN 10
#tn([Một con kiến bò dọc theo một đường gấp khúc vô hạn $A_1 A_2 A_3 A_4 ...$ được dựng trong mặt phẳng. Biết đoạn đầu tiên $A_1 A_2$ là cạnh của hình vuông $C_1$ có cạnh dài $4$ m. Đoạn tiếp theo $A_2 A_3$ là cạnh của hình vuông $C_2$ (dựng bằng cách nối trung điểm các cạnh của $C_1$). Tổng quát, mỗi đoạn $A_n A_(n+1)$ là độ dài cạnh của hình vuông $C_n$ trong chuỗi hình vuông lồng nhau liên tiếp (như hình vẽ bên dưới). Tính tổng quãng đường con kiến bò được (tính bằng mét).],
    (
        [$4(2 - sqrt(2))$ m.],
        True([$4(2 + sqrt(2))$ m.]),
        [$8(2 + sqrt(2))$ m.],
        [$8(2 - sqrt(2))$ m.]
    ),
    fig: fig-nested-squares,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Quãng đường di chuyển là tổng các cạnh của chuỗi hình vuông lồng nhau:
        - Đoạn thứ nhất: $d_1 = 4$ m.
        - Đoạn thứ hai là cạnh của hình vuông $C_2$: $d_2 = sqrt( 2^2 + 2^2 ) = 2 sqrt(2)$ m.
        - Tỉ số độ dài cạnh giữa hai hình vuông liên tiếp là $q = (sqrt(2))/(2)$ (vì $d_(n+1) = d_n dot (sqrt(2))/(2)$).
        Tổng quãng đường con kiến đi được là tổng cấp số nhân lùi vô hạn:
        $ d = (d_1)/(1 - q) = (4)/(1 - (sqrt(2))/(2)) = (8)/(2 - sqrt(2)) = (8(2 + sqrt(2)))/(2) = 4(2 + sqrt(2)) $ m.
    ]
)

// TN 11
#tn([Một đường gấp khúc dạng phân phân (fractal) được xây dựng từ một đoạn thẳng ban đầu dài $9$ cm. Ở mỗi bước, người ta chia mỗi đoạn thẳng thành $3$ phần bằng nhau, thay thế phần ở chính giữa bằng hai cạnh của một tam giác đều hướng lên trên (như hình vẽ mô tả bước đầu tiên dưới đây). Quá trình này thực hiện vô hạn lần. Tìm giới hạn tổng độ dài đường gấp khúc thu được ở vô hạn bước.],
    (
        [$12$ cm.],
        [$16$ cm.],
        [$36$ cm.],
        True([Vô hạn ($+oo$).])
    ),
    fig: fig-koch-step,
    fig-pos: "center",
    fig-width: 35%,
    loigiai: [
        - Ban đầu độ dài đoạn là $L_0 = 9$ cm.
        - Ở bước 1: Một đoạn được thay thế bởi 4 đoạn nhỏ có độ dài bằng $(1)/(3)$ đoạn cũ.
          Tổng độ dài ở bước 1: $L_1 = 4 dot (9)/(3) = 12$ cm.
        - Tổng quát, sau mỗi bước, số đoạn nhân lên 4 lần, chiều dài mỗi đoạn nhân $(1)/(3)$, do đó tổng độ dài được nhân với tỉ lệ $q = (4)/(3)$.
          Độ dài ở bước thứ $n$ là: $L_n = 9 dot ((4)/(3))^n$.
        - Vì công bội $q = (4)/(3) > 1$ nên giới hạn độ dài khi $n -> +oo$ là:
          $ limits(lim)_(n -> +oo) L_n = limits(lim)_(n -> +oo) [9 dot ((4)/(3))^n] = +oo $.
    ]
)

// TN 12
#tn([Cho một hình nón có góc ở đỉnh là $60^o$ và bán kính đáy bằng $3$ m. Người ta xếp một dãy vô hạn các quả cầu nội tiếp hình nón sao cho quả cầu thứ nhất tiếp xúc với đáy và mặt xung quanh của nón, quả cầu thứ hai nằm phía trên quả cầu thứ nhất tiếp xúc với quả cầu thứ nhất và mặt xung quanh nón, cứ thế tiếp tục lên trên (như hình vẽ minh họa bên dưới). Tính tổng thể tích của tất cả các quả cầu trong dãy vô hạn đó.],
    (
        [$4 sqrt(3) pi" m"^3$.],
        [$(27 sqrt(3) pi)/(13)" m"^3$.],
        True([$(54 sqrt(3) pi)/(13)" m"^3$.]),
        [$(108 sqrt(3) pi)/(13)" m"^3$.]
    ),
    fig: fig-cone-spheres,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Mặt cắt dọc của hình nón là một tam giác đều có cạnh $6$ m.
        - Quả cầu thứ nhất nội tiếp phần dưới của nón. Mặt cắt của nó là đường tròn nội tiếp tam giác đều cạnh $6$ m.
          Bán kính quả cầu thứ nhất: $R_1 = (6 sqrt(3))/(6) = sqrt(3)$ m.
          Thể tích quả cầu thứ nhất: $V_1 = (4)/(3) pi R_1^3 = (4)/(3) pi (sqrt(3))^3 = 4 sqrt(3) pi" m"^3$.
        - Quả cầu thứ hai nội tiếp phần nón thu nhỏ phía trên quả cầu thứ nhất.
          Tỉ số bán kính giữa quả cầu tiếp theo và quả cầu trước đó được tính theo công thức:
          $ k = (1 - sin 30^o)/(1 + sin 30^o) = (1 - 0.5)/(1 + 0.5) = (1)/(3) $.
          Bán kính quả cầu thứ hai là $R_2 = (1)/(3) R_1$.
        - Thể tích quả cầu tỉ lệ với lập phương bán kính, nên công bội thể tích giữa hai quả cầu liên tiếp là $q = k^3 = ( (1)/(3) )^3 = (1)/(27)$ (thỏa mãn $|q| < 1$).
        Tổng thể tích của tất cả các quả cầu là:
        $ V = (V_1)/(1 - q) = (4 sqrt(3) pi)/(1 - (1)/(27)) = (4 sqrt(3) pi)/((26)/(27)) = (54 sqrt(3) pi)/(13) " m"^3$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hình vuông $C_1$ có cạnh bằng $8$ cm. Dựng dãy các hình vuông $C_2, C_3, ...$ bằng cách nối các trung điểm của các cạnh hình vuông ngay trước nó. Các phát biểu sau đúng hay sai?], (
        True([Chu vi của hình vuông $C_2$ bằng $16 sqrt(2)$ cm.]),
        [Dãy số chu vi $P_n$ của các hình vuông lập thành một cấp số nhân lùi vô hạn với công bội $q = (1)/(2)$.],
        True([Tổng diện tích của tất cả các hình vuông trong dãy vô hạn đó bằng $128$ $"cm"^2$.]),
        True([Tổng chu vi của tất cả các hình vuông trong dãy vô hạn đó bằng $32(2 + sqrt(2))$ cm.])
    ),
    fig: fig-nested-squares,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Cạnh của hình vuông $C_2$ là $a_2 = sqrt( 4^2 + 4^2 ) = 4 sqrt(2)$ cm. Chu vi $P_2 = 4 dot 4 sqrt(2) = 16 sqrt(2)$ cm.
        - *b)* Sai. Tỉ số chu vi giữa hai hình vuông liên tiếp là $q = (sqrt(2))/(2)$ (chứ không phải $1/2$).
        - *c)* Đúng. Diện tích hình vuông thứ nhất là $S_1 = 64$ $"cm"^2$. Tỉ số diện tích là $q = (1)/(2)$. Tổng diện tích: $S = 64 / (1 - 1/2) = 128$ $"cm"^2$.
        - *d)* Đúng. Chu vi thứ nhất $P_1 = 32$ cm. Công bội chu vi $q = (sqrt(2))/(2)$.
          Tổng chu vi: $P = (32)/(1 - (sqrt(2))/(2)) = (64)/(2 - sqrt(2)) = 32(2 + sqrt(2))$ cm.
    ]
)

// DS 2
#ds([Cho góc $x O y = 60^o$. Điểm $M_1$ nằm trên cạnh $O x$ sao cho $O M_1 = 2$. Hạ hình chiếu vuông góc $M_2$ của $M_1$ trên cạnh $O y$. Hạ hình chiếu vuông góc $M_3$ của $M_2$ trên cạnh $O x$, và cứ tiếp tục quá trình này vô hạn lần tạo thành đường gấp khúc $M_1 M_2 M_3 M_4 ...$ (như hình vẽ bên dưới). Các phát biểu sau đúng hay sai?], (
        True([Độ dài đoạn gấp khúc đầu tiên $M_1 M_2$ bằng $sqrt(3)$.]),
        True([Đoạn độ dài các đoạn gấp khúc $d_n = M_n M_(n+1)$ lập thành một cấp số nhân lùi vô hạn với công bội $q = (1)/(2)$.]),
        True([Độ dài đoạn gấp khúc thứ ba $M_3 M_4$ bằng $(sqrt(3))/(4)$.]),
        True([Tổng độ dài của đường gấp khúc vô hạn này tiến sát về giới hạn bằng $2 sqrt(3)$.])
    ),
    fig: fig-zigzag-60,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        - *a)* Đúng. Trong tam giác vuông $O M_1 M_2$ vuông tại $M_2$: $M_1 M_2 = O M_1 dot sin 60^o = 2 dot (sqrt(3))/(2) = sqrt(3)$.
        - *b)* Đúng. Độ dài các đoạn gấp khúc là $d_1 = sqrt(3)$, $d_2 = M_2 M_3 = O M_2 dot sin 60^o = (O M_1 cos 60^o) sin 60^o = d_1 cos 60^o = (sqrt(3))/(2)$.
          Do đó công bội $q = cos 60^o = 0.5$ có $|q| < 1$.
        - *c)* Đúng. $d_3 = d_1 dot q^2 = sqrt(3) dot ( (1)/(2) )^2 = (sqrt(3))/(4)$.
        - *d)* Đúng. Tổng độ dài: $S = (d_1)/(1 - q) = (sqrt(3))/(1 - 0.5) = 2 sqrt(3)$.
    ]
)

// DS 3
#ds([Một mô hình nhánh cây hình học bắt đầu từ một đoạn thẳng đứng dài $16$ cm làm thân chính. Từ ngọn thân mọc ra 2 nhánh nghiêng đối xứng, mỗi nhánh dài bằng $30\%$ thân trước. Từ ngọn mỗi nhánh phụ lại mọc ra 2 nhánh nhỏ hơn dài bằng $30\%$ nhánh trước đó, cứ thế vô hạn lần (như hình vẽ minh họa bên dưới). Các phát biểu sau đúng hay sai?], (
        True([Tổng số nhánh cây mới mọc ra ở thế hệ thứ hai (không tính thân chính) là $4$ nhánh.]),
        True([Tổng chiều dài các nhánh mọc ra ở thế hệ thứ $n$ lập thành một cấp số nhân với công bội $q = 0.6$.]),
        True([Hệ thống tổng chiều dài các nhánh này là một cấp số nhân lùi vô hạn.]),
        True([Tổng chiều dài của toàn bộ mô hình cây nghệ thuật này (gồm thân chính và toàn bộ các nhánh phụ) là $40$ cm.])
    ),
    fig: fig-tree-fractal,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Thế hệ 1 mọc ra 2 nhánh, thế hệ 2 mọc ra $2 dot 2 = 4$ nhánh.
        - *b)* Đúng. Tại bước $n$, số lượng nhánh gấp đôi ($2$ lần) nhưng chiều dài mỗi nhánh nhân $0.3$, tổng chiều dài nhân $2 dot 0.3 = 0.6$.
        - *c)* Đúng. Vì công bội của tổng chiều dài các nhánh thế hệ là $q = 0.6$ thỏa mãn $|q| < 1$.
        - *d)* Đúng. Tổng chiều dài toàn bộ cây là:
          $ L = (u_1)/(1 - q) = (16)/(1 - 0.6) = (16)/(0.4) = 40 $ cm.
    ]
)

// DS 4
#ds([Một đường xoắn ốc gồm các cung tròn nối tiếp nhau trong mặt phẳng (như hình vẽ minh họa câu 6). Cung tròn thứ nhất là nửa đường tròn bán kính $R_1 = 12$ cm. Mỗi cung tròn tiếp theo là nửa đường tròn có bán kính bằng $(2)/(3)$ bán kính cung tròn ngay trước đó. Các phát biểu sau đúng hay sai?], (
        True([Đoạn độ dài cung tròn thứ hai bằng $8 pi$ cm.]),
        True([Dãy độ dài các cung tròn lập thành một cấp số nhân lùi vô hạn với công bội $q = (2)/(3)$.]),
        True([Tổng độ dài của đường xoắn ốc vô hạn này là $36 pi$ cm.]),
        True([Nếu tỉ số bán kính của mỗi cung tròn giảm xuống còn $(1)/(2)$, tổng độ dài đường xoắn ốc sẽ là $24 pi$ cm.])
    ),
    fig: fig-semicircle-spiral,
    fig-pos: "center",
    fig-width: 50%,
    loigiai: [
        - *a)* Đúng. Bán kính cung hai $R_2 = 12 dot (2)/(3) = 8$ cm. Độ dài cung hai: $L_2 = pi R_2 = 8 pi$ cm.
        - *b)* Đúng. Công bội bán kính là $2/3$, kéo theo công bội độ dài cung là $q = 2/3$ thỏa mãn $|q| < 1$.
        - *c)* Đúng. Chuỗi có số hạng đầu $L_1 = 12 pi$. Tổng độ dài:
          $ L = (L_1)/(1 - q) = (12 pi)/(1 - (2)/(3)) = 36 pi $ cm.
        - *d)* Đúng. Khi $q = 1/2$, tổng độ dài mới: $L = (12 pi)/(1 - 0.5) = 24 pi$ cm.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho hình vuông có cạnh dài $10$ cm. Dựng dãy vô hạn các hình vuông lồng nhau bằng cách nối các trung điểm của các cạnh hình vuông trước đó (hình vẽ bên dưới). Tính tổng diện tích của tất cả các hình vuông trong dãy vô hạn đó (tính bằng xăng-ti-mét vuông).],
    [200],
    fig: fig-nested-squares,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Diện tích hình vuông thứ nhất là $S_1 = 10^2 = 100$ $"cm"^2$.
        Diện tích các hình vuông sau giảm đi một nửa so với trước đó ($q = (1)/(2)$).
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (100)/(1 - (1)/(2)) = 200 $ $"cm"^2$.
    ]
)

// TL 2
#tln([Một đường xoắn ốc gồm các nửa đường tròn có bán kính giảm dần theo cấp số nhân lùi vô hạn (hình vẽ bên dưới). Nửa đường tròn đầu tiên có bán kính $R_1 = 6$ cm. Các nửa đường tròn tiếp theo có bán kính bằng $(1)/(2)$ bán kính của cung ngay trước đó. Tính tổng độ dài đường xoắn ốc này dưới dạng $a pi$ cm. Tìm giá trị của tham số $a$.],
    [12],
    fig: fig-semicircle-spiral,
    fig-pos: "center",
    fig-width: 50%,
    loigiai: [
        Độ dài nửa đường tròn thứ nhất: $L_1 = pi R_1 = 6 pi$ cm.
        Mỗi cung tiếp theo có độ dài bằng một nửa cung trước, lập thành cấp số nhân lùi vô hạn có công bội $q = (1)/(2)$.
        Tổng độ dài là:
        $ L = (L_1)/(1 - q) = (6 pi)/(1 - (1)/(2)) = 12 pi $ cm.
        Do đó $a = 12$.
    ]
)

// TL 3
#tln([Cho một tam giác đều có diện tích bằng $12$ $"cm"^2$. Người ta nối trung điểm các cạnh để tạo thành tam giác đều thứ hai, rồi lại tiếp tục nối trung điểm để tạo thành tam giác đều thứ ba, cứ thế tiếp tục quá trình này vô hạn lần (như hình vẽ bên dưới). Tính tổng diện tích của tất cả các tam giác trong dãy vô hạn đó (tính bằng xăng-ti-mét vuông).],
    [16],
    fig: fig-nested-triangles,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Diện tích tam giác thứ nhất $S_1 = 12$ $"cm"^2$.
        Nối trung điểm các cạnh tạo ra tam giác có diện tích bằng $(1)/(4)$ tam giác trước đó.
        Tổng diện tích của chuỗi tam giác vô hạn là:
        $ S = (S_1)/(1 - q) = (12)/(1 - (1)/(4)) = 16 $ $"cm"^2$.
    ]
)

// TL 4
#tln([Cho góc nhọn $x O y = 30^o$ và điểm $M_1$ trên cạnh $O x$ sao cho $O M_1 = 12$. Một đường gấp khúc vô hạn $M_1 M_2 M_3 M_4 ...$ được dựng bằng cách hạ các đường vuông góc liên tiếp từ cạnh này sang cạnh kia của góc (như hình vẽ bên dưới). Tính tổng độ dài đường gấp khúc đó dưới dạng $p + q sqrt(3)$ với $p, q$ là các số nguyên. Tính giá trị của biểu thức $P = p + 2q$.],
    [48],
    fig: fig-zigzag-angle,
    fig-pos: "center",
    fig-width: 40%,
    loigiai: [
        - Đoạn đầu tiên: $M_1 M_2 = O M_1 dot sin 30^o = 12 dot (1)/(2) = 6$.
        - Cạnh kề $O M_2 = O M_1 dot cos 30^o = 6 sqrt(3)$.
        - Đoạn thứ hai: $M_2 M_3 = O M_2 dot sin 30^o = 3 sqrt(3)$.
        - Tổng độ dài đường gấp khúc là tổng cấp số nhân lùi vô hạn với $u_1 = 6$ và công bội $q = cos 30^o = (sqrt(3))/(2)$.
        $ S = (u_1)/(1 - q) = (6)/(1 - (sqrt(3))/(2)) = (12)/(2 - sqrt(2)) = 12(2 + sqrt(3)) = 24 + 12 sqrt(3) $.
        Do đó $p = 24$ và $q = 12$.
        Giá trị biểu thức: $P = p + 2q = 24 + 2 dot 12 = 48$.
    ]
)

// TL 5
#tln([Một mô hình cây nghệ thuật có thân thẳng đứng dài $20$ cm. Từ ngọn thân mọc ra 2 nhánh nghiêu đối xứng dài bằng $40\%$ thân trước. Từ ngọn mỗi nhánh phụ lại mọc ra 2 nhánh nhỏ hơn dài bằng $40\%$ nhánh trước đó, cứ thế vô hạn lần (mô hình bên dưới). Tính tổng chiều dài của thân và tất cả các nhánh trong mô hình này (tính bằng xăng-ti-mét).],
    [100],
    fig: fig-tree-fractal,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - Thân chính: $L_0 = 20$ cm.
        - Tổng chiều dài các thế hệ nhánh lập thành cấp số nhân lùi vô hạn với số hạng đầu $L_0 = 20$ và công bội $q = 2 dot 0.4 = 0.8$.
        Tổng chiều dài toàn bộ cây là:
        $ L_("tổng") = (L_0)/(1 - q) = (20)/(1 - 0.8) = (20)/(0.2) = 100 $ cm.
    ]
)

// TL 6
#tln([Một hình nón có góc ở đỉnh bằng $60^o$ và bán kính đáy bằng $sqrt(3)$ m. Người ta xếp một dãy vô hạn các quả cầu nội tiếp hình nón sao cho quả cầu thứ nhất tiếp xúc với đáy và mặt xung quanh nón, quả cầu thứ hai nằm phía trên tiếp xúc với quả cầu thứ nhất và mặt xung quanh nón, cứ thế tiếp tục vô hạn lần (hình vẽ bên dưới2). Tính tổng thể tích của tất cả các quả cầu dưới dạng $(a)/(b) pi" m"^3$ với $(a)/(b)$ là phân số tối giản. Tìm giá trị của $a + b$.],
    [31],
    fig: fig-cone-spheres,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Mặt cắt dọc của nón qua trục là tam giác đều có chiều cao $h = R_("đáy") sqrt(3) = sqrt(3) dot sqrt(3) = 3$ m.
        - Bán kính quả cầu thứ nhất bằng bán kính đường tròn nội tiếp tam giác đều mặt cắt có chiều cao bằng $3$ m:
          $ R_1 = (h)/(3) = (3)/(3) = 1 $ m.
          Thể tích quả cầu thứ nhất: $V_1 = (4)/(3) pi R_1^3 = (4)/(3) pi" m"^3$.
        - Tỉ số bán kính giữa quả cầu sau và quả cầu liền trước:
          $ k = (1 - sin 30^o)/(1 + sin 30^o) = (1)/(3) $.
        - Công bội thể tích giữa các quả cầu: $q = k^3 = (1)/(27)$ (thỏa mãn $|q| < 1$).
        Tổng thể tích các quả cầu là:
        $ V = (V_1)/(1 - q) = ((4)/(3) pi)/(1 - (1)/(27)) = ((4)/(3) pi)/((26)/(27)) = (18)/(13) pi " m"^3$.
        Phân số tối giản là $(18)/(13) => a = 18, b = 13$.
        Giá trị biểu thức: $a + b = 18 + 13 = 31$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
