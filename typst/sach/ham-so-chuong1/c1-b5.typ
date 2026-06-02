#import "_config.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════════════════
// CÁC HÌNH VẼ ĐỒ THỊ MINH HỌA BẰNG CETZ
// ═══════════════════════════════════════════════════════════

// 1. Đồ thị hàm bậc ba: y = x^3 - 3x + 1
#let fig-bac3 = cetz.canvas(length: 0.9cm, {
  import cetz.draw: *
  // Hệ trục tọa độ Ox, Oy
  line((-3.2, 0), (3.2, 0), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  line((0, -2.5), (0, 4.5), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  content((3.0, -0.3), $x$)
  content((0.3, 4.2), $y$)
  content((-0.25, -0.25), $O$)

  // Vẽ đồ thị y = x^3 - 3x + 1
  let f(x) = { x * x * x - 3 * x + 1 }
  let pts = ()
  for i in range(50) {
    let x = -2.1 + i * 4.2 / 50
    pts.push((x, f(x)))
  }
  line(..pts, stroke: rgb("#0f4c81") + 1.2pt)

  // Cực đại (-1; 3) và Cực tiểu (1; -1)
  line((-1, 0), (-1, 3), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  line((0, 3), (-1, 3), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  circle((-1, 3), radius: 0.05, fill: black)
  content((-1.3, 3.2), $(-1; 3)$)

  line((1, 0), (1, -1), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  line((0, -1), (1, -1), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  circle((1, -1), radius: 0.05, fill: black)
  content((1.3, -1.2), $(1; -1)$)

  // Điểm uốn I(0; 1)
  circle((0, 1), radius: 0.06, fill: rgb("#b91c1c"))
  content((0.3, 1.2), $I(0; 1)$, fill: white)

  content((2.1, 2.5), $y = x^3 - 3x + 1$)
})

// 2. Đồ thị hàm phân thức 1/1: y = (2x - 1)/(x - 1) = 2 + 1/(x - 1)
#let fig-phanthuc11 = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  // Ox, Oy
  line((-3.2, 0), (5.2, 0), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  line((0, -2.2), (0, 5.5), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  content((5.0, -0.35), $x$)
  content((0.35, 5.2), $y$)
  content((-0.25, -0.25), $O$)

  // Tiệm cận đứng: x = 1, Tiệm cận ngang: y = 2
  line((1, -2.0), (1, 5.0), stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
  line((-3.0, 2), (5.0, 2), stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
  content((1.5, 4.8), $x = 1$, fill: white)
  content((4.4, 2.3), $y = 2$, fill: white)

  // Nhánh trái x < 1: y = 2 + 1/(x - 1)
  let f_left(x) = { 2 + 1 / (x - 1) }
  let pts_left = ()
  for i in range(40) {
    let x = -2.8 + i * 3.55 / 40
    pts_left.push((x, f_left(x)))
  }
  line(..pts_left, stroke: rgb("#0f4c81") + 1.2pt)

  // Nhánh phải x > 1
  let f_right(x) = { 2 + 1 / (x - 1) }
  let pts_right = ()
  for i in range(40) {
    let x = 1.25 + i * 3.55 / 40
    pts_right.push((x, f_right(x)))
  }
  line(..pts_right, stroke: rgb("#0f4c81") + 1.2pt)

  // Tâm đối xứng I(1; 2)
  circle((1, 2), radius: 0.06, fill: rgb("#b91c1c"))
  content((1.4, 1.6), $I(1; 2)$)
})

// 3. Đồ thị hàm phân thức 2/1: y = (x^2 - x + 1)/(x - 1) = x + 1/(x - 1)
#let fig-phanthuc21 = cetz.canvas(length: 0.8cm, {
  import cetz.draw: *
  // Ox, Oy
  line((-3.2, 0), (5.2, 0), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  line((0, -4.2), (0, 6.2), mark: (end: "stealth", scale: 0.4), stroke: 0.5pt)
  content((5.0, -0.35), $x$)
  content((0.35, 5.9), $y$)
  content((-0.25, -0.25), $O$)

  // Tiệm cận đứng: x = 1
  line((1, -4.0), (1, 5.8), stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
  // Tiệm cận xiên: y = x
  line((-3.0, -3.0), (5.0, 5.0), stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
  content((1.5, 5.5), $x = 1$, fill: white)
  content((4.2, 4.5), $y = x$, fill: white)

  // Nhánh trái x < 1: y = x + 1/(x - 1)
  let f_left(x) = { x + 1 / (x - 1) }
  let pts_left = ()
  for i in range(40) {
    let x = -2.8 + i * 3.55 / 40
    pts_left.push((x, f_left(x)))
  }
  line(..pts_left, stroke: rgb("#0f4c81") + 1.2pt)

  // Nhánh phải x > 1
  let f_right(x) = { x + 1 / (x - 1) }
  let pts_right = ()
  for i in range(40) {
    let x = 1.25 + i * 3.55 / 40
    pts_right.push((x, f_right(x)))
  }
  line(..pts_right, stroke: rgb("#0f4c81") + 1.2pt)

  // Cực đại (0; -1) và Cực tiểu (2; 3)
  circle((0, -1), radius: 0.05, fill: black)
  content((0.6, -1.2), $(0; -1)$)
  circle((2, 3), radius: 0.05, fill: black)
  content((2.5, 2.7), $(2; 3)$)

  // Tâm đối xứng I(1; 1) - giao điểm 2 tiệm cận
  circle((1, 1), radius: 0.06, fill: rgb("#b91c1c"))
  content((1.4, 0.7), $I(1; 1)$)
})

// ═══════════════════════════════════════════════════════════
// NỘI DUNG LÝ THUYẾT BÀI HỌC
// ═══════════════════════════════════════════════════════════

#lesson([Khảo sát và vẽ đồ thị của hàm số], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Sơ đồ khảo sát hàm số tổng quát])

#block(breakable: false)[
  #phuongphap(title: [Các bước khảo sát sự biến thiên và vẽ đồ thị hàm số])[
    Để khảo sát sự biến thiên và vẽ đồ thị hàm số $y = f(x)$, ta thực hiện theo 3 bước chính sau:

    1. *Tìm tập xác định* của hàm số.
    2. *Khảo sát sự biến thiên:*
      - Tính đạo hàm $y'$. Tìm các nghiệm của $y' = 0$ và các điểm tại đó đạo hàm không xác định.
      - Xét dấu đạo hàm để chỉ ra các khoảng đồng biến, nghịch biến của hàm số.
      - Tìm cực trị của hàm số.
      - Tìm các giới hạn tại vô cực ($lim_(x->+-oo) y$) và tìm các tiệm cận (nếu có).
      - Lập bảng biến thiên (BBT) tổng hợp các kết quả trên.
    3. *Vẽ đồ thị:*
      - Xác định các điểm đặc biệt (giao điểm với trục hoành, trục tung, các điểm cực trị).
      - Tìm tâm đối xứng hoặc trục đối xứng của đồ thị (nếu có).
      - Vẽ các đường tiệm cận trước, sau đó vẽ đường cong đồ thị đi qua các điểm đặc biệt dựa theo chiều mũi tên trong BBT.
  ]
]

#pagebreak()

#muc([Hàm số bậc ba: $y = a x^3 + b x^2 + c x + d$ ($a != 0$)])

#block(breakable: false)[
  #dn(title: [Đặc trưng của hàm bậc ba])[
    - *Tập xác định:* $D = RR$.
    - *Đạo hàm:* $y' = 3a x^2 + 2b x + c$ là tam thức bậc hai.
    - *Số điểm cực trị:* Đồ thị có thể có $2$ điểm cực trị (khi $y' = 0$ có 2 nghiệm phân biệt) hoặc không có cực trị (khi $y' = 0$ vô nghiệm hoặc có nghiệm kép).
    - *Tâm đối xứng:* Đồ thị hàm số bậc ba luôn nhận điểm uốn $I(x_0; y_0)$ làm tâm đối xứng, trong đó hoành độ điểm uốn là nghiệm của phương trình đạo hàm cấp hai:
      $ y'' = 6a x + 2b = 0 <=> x_0 = - b / (3a). $
  ]
]

#v(0.5em)
#align(center)[
  #fig-bac3
  #v(0.2em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 1. Đồ thị hàm số bậc ba $y = x^3 - 3x + 1$]
]

#pagebreak()

#muc([Hàm số phân thức bậc nhất trên bậc nhất: $y = frac(a x + b, c x + d)$ ($c != 0, a d - b c != 0$)])

#block(breakable: false)[
  #dn(title: [Đặc trưng của hàm số phân thức 1/1])[
    - *Tập xác định:* $D = RR without \{- d/c \}$.
    - *Đạo hàm:* $y' = frac(a d - b c, (c x + d)^2)$. Đạo hàm luôn cùng dấu với $a d - b c$ với mọi $x in D$.
    - *Cực trị:* Hàm số không có cực trị.
    - *Các đường tiệm cận:*
      - Tiệm cận đứng: Đường thẳng $x = - d/c$.
      - Tiệm cận ngang: Đường thẳng $y = a/c$.
    - *Tâm đối xứng:* Đồ thị nhận giao điểm $I(-d/c; a/c)$ của hai đường tiệm cận làm tâm đối xứng.
  ]
]

#v(0.5em)
#align(center)[
  #fig-phanthuc11
  #v(0.2em)
  #text(
    size: 10pt,
    style: "italic",
    fill: gray,
  )[Hình 2. Đồ thị hàm số phân thức bậc nhất trên bậc nhất $y = frac(2x - 1, x - 1)$]
]

#pagebreak()

#muc([Hàm số phân thức bậc hai trên bậc nhất: $y = frac(a x^2 + b x + c, d x + e)$ ($a, d != 0$)])

#block(breakable: false)[
  #dn(title: [Đặc trưng của hàm số phân thức 2/1])[
    - *Tập xác định:* $D = RR without \{- e/d \}$.
    - *Đường tiệm cận:*
      - Tiệm cận đứng: Đường thẳng $x = - e/d$.
      - Tiệm cận xiên: Bằng cách thực hiện phép chia đa thức ở tử cho mẫu, ta đưa về dạng:
        $ y = m x + n + frac(r, d x + e) $
        Đường thẳng $y = m x + n$ chính là tiệm cận xiên của đồ thị.
    - *Cực trị:* Đồ thị có thể có 2 điểm cực trị (1 cực đại, 1 cực tiểu) hoặc không có cực trị nào.
    - *Tâm đối xứng:* Đồ thị nhận giao điểm $I$ của đường tiệm cận đứng và đường tiệm cận xiên làm tâm đối xứng. Hoành độ của $I$ là $x_I = -e/d$ và tung độ $y_I = m x_I + n$.
  ]
]

#v(0.5em)
#align(center)[
  #fig-phanthuc21
  #v(0.2em)
  #text(
    size: 10pt,
    style: "italic",
    fill: gray,
  )[Hình 3. Đồ thị hàm số phân thức bậc hai trên bậc nhất $y = frac(x^2 - x + 1, x - 1)$]
]

#pagebreak()

#q-label([Đọc đồ thị trong bối cảnh thực tế], c-book)

Khi trục hoành và trục tung biểu diễn các đại lượng thực như *thời gian, giá bán, sản lượng, nồng độ, chi phí, lợi nhuận*, thì mỗi chi tiết trên đồ thị đều mang một ý nghĩa thực tế rõ ràng.

- *Đồ thị đi lên:* đại lượng đang tăng theo biến điều khiển.
- *Đồ thị đi xuống:* đại lượng đang giảm.
- *Điểm cực đại:* mức đỉnh như lợi nhuận lớn nhất, nồng độ cao nhất, doanh thu tối đa hoặc tải cực đại.
- *Điểm cực tiểu:* mức thấp nhất như chi phí nhỏ nhất, hao phí nhỏ nhất hoặc rủi ro thấp nhất.
- *Giao với trục hoành:* ngưỡng hòa vốn, thời điểm bằng $0$, hoặc mức chuyển pha.
- *Tiệm cận ngang:* giới hạn bão hòa hoặc mức ổn định dài hạn.
- *Tiệm cận đứng:* ngưỡng cấm hoặc vùng mô hình không còn hợp lệ.
- *Điểm uốn:* thời điểm tốc độ tăng bắt đầu chậm lại hoặc tốc độ giảm bắt đầu dịu đi.

#block[
  #ghinho(title: [★ Ba câu hỏi phải đọc ra từ đồ thị])[
    - *Đồ thị đang tăng hay giảm trên khoảng nào?* Đây là câu trả lời cho xu hướng biến thiên của đại lượng thực tế.
    - *Đỉnh, đáy hoặc giao điểm nằm ở đâu?* Đây là câu trả lời cho mức tối ưu, ngưỡng hòa vốn, hoặc thời điểm quan trọng.
    - *Đồ thị tiến về đâu khi thời gian hoặc quy mô rất lớn?* Đây là câu trả lời cho trạng thái bền vững, giới hạn công suất, hoặc mức bão hòa dài hạn.
  ]
]

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c1-b5-de1.typ"
#include "c1-b5-de2.typ"
#include "c1-b5-de3.typ"
#include "c1-b5-de4.typ"
