#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *

#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════
// HELPER: projection 3D → 2D (góc nhìn isometric nhẹ)
// ═══════════════════════════════════════════════
// Dùng chung cho mọi hình vẽ trong chuyên đề
// prj(x, y, z): chiếu với ox nhìn xiên, oy lùi vào, oz lên
// Điều chỉnh hệ số để cân bằng góc nhìn

// ═══════════════════════════════════════════════
// TIÊU ĐỀ
// ═══════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Treo Vật
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Các bài tập được tuyển chọn và biên soạn bởi Nguyễn Văn Sang
    ]
  ]
]

#import "@preview/cetz:0.5.2"

// 1. HÌNH VẼ CHO PHẦN ĐỀ BÀI (KHÔNG CÓ TRỤC TỌA ĐỘ)
#let fig-q = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-0.5, 2.5)
  let B = (-2, 0.5)
  let C = (0.5, -0.5)
  let D = (4, 1)
  let I = (0.5, -3.5)
  let R = 1.2
  
  // Trần nhà - Dùng line với close: true 
  line((-3, 1.5), (-1, -1.5), (5.5, -0.5), (2, 3.5), close: true, fill: rgb("E5E5E5").lighten(30%), stroke: none)
  
  // Các cạnh hình thang
  line(A, B, stroke: 1pt)
  line(B, C, stroke: 1pt)
  line(C, D, stroke: (paint: black, dash: "dashed"))
  line(A, D, stroke: 1pt)
  
  // Dây treo
  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  line(D, I, stroke: 0.7pt)
  
  // Quả cầu (Đổ bóng gradient)
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  
  // Các điểm neo
  for pt in (A, B, C, D) { circle(pt, radius: 1.5pt, fill: black) }
  
  // Nhãn đỉnh
  content((A.at(0), A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.2, C.at(1) - 0.3), [*C*])
  content((D.at(0) + 0.3, D.at(1)), [*D*])
  
  let lbl(txt) = box(fill: white.transparentize(20%), inset: 1pt, radius: 2pt, txt)
  
  // Nhãn kích thước cạnh
  content((-1.5, 1.7), lbl[$40$])
  content((-0.6, -0.1), lbl[$40$])
  content((1.5, 2.0), lbl[$60$])
  
  // Nhãn chiều dài dây
  content((-0.1, 0), lbl[$70$])
  content((-1.1, -1.2), lbl[$70$])
  content((0.7, -1.6), lbl[$60$])
  content((2.5, -1.0), lbl[$60$])
})

// 2. HÌNH VẼ CHO PHẦN LỜI GIẢI (CÓ TRỤC TỌA ĐỘ Oxyz)
#let fig-sol = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-0.5, 2.5)
  let B = (-2, 0.5)
  let C = (0.5, -0.5)
  let D = (4, 1)
  let I = (0.5, -3.5)
  let R = 1.2
  
  line((-3, 1.5), (-1, -1.5), (5.5, -0.5), (2, 3.5), close: true, fill: rgb("E5E5E5").lighten(30%), stroke: none)
  
  // Trục Tọa độ Oxyz (gốc A)
  let vX = (B.at(0) - A.at(0), B.at(1) - A.at(1))
  let vY = (D.at(0) - A.at(0), D.at(1) - A.at(1))
  line(A, (A.at(0) + 1.4*vX.at(0), A.at(1) + 1.4*vX.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0) + 1.2*vY.at(0), A.at(1) + 1.2*vY.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0), A.at(1) - 7), mark: (end: ">", fill: red), stroke: 1pt + red)
  
  content((A.at(0) + 1.5*vX.at(0), A.at(1) + 1.5*vX.at(1)), text(fill: red, weight: "bold")[$x$])
  content((A.at(0) + 1.3*vY.at(0), A.at(1) + 1.3*vY.at(1)), text(fill: red, weight: "bold")[$y$])
  content((A.at(0) + 0.3, A.at(1) - 6.8), text(fill: red, weight: "bold")[$z$])

  line(A, B, stroke: 1pt)
  line(B, C, stroke: 1pt)
  line(C, D, stroke: (paint: black, dash: "dashed"))
  line(A, D, stroke: 1pt)
  
  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  line(D, I, stroke: 0.7pt)
  
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  
  for pt in (A, B, C, D) { circle(pt, radius: 1.5pt, fill: black) }
  circle(I, radius: 1.5pt, fill: red)
  content((I.at(0) + 0.4, I.at(1) - 0.2), text(fill: red, weight: "bold")[$I$])
  
  content((A.at(0) + 0.3, A.at(1) + 0.2), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.2, C.at(1) - 0.3), [*C*])
  content((D.at(0) + 0.3, D.at(1)), [*D*])
})

// 3. MÃ TRÌNH BÀY CÂU HỎI
#tln(
  [Trên trần nhà được coi là phẳng song song với mặt đất có bốn điểm $A, B, C, D$ theo thứ tự tạo thành một hình thang vuông tại $A$ và $B$, có các kích thước $A B = 40$ cm, $B C = 40$ cm, $A D = 60$ cm. Người ta dự định đặt mua một quả cầu phong thuỷ $(T)$ rất nặng có bán kính $R$ chưa biết và sẽ sử dụng 4 đoạn dây không giãn có độ dài $70$ cm, $70$ cm, $60$ cm, $60$ cm lần lượt có một đầu treo vào các điểm $A, B, C, D$ và đầu còn lại gắn vào các điểm trên quả cầu $(T)$. Biết rằng các đoạn dây này đều có đường kéo dài đi qua tâm của $(T)$. Hãy tính theo đơn vị centimet khoảng cách từ điểm thấp nhất của quả cầu $(T)$ đến trần nhà (làm tròn kết quả đến hàng đơn vị)?],
  [168],
  fig: fig-q,
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      Để giải quyết các bài toán "treo vật thể" bằng dây hoặc các bài toán khoảng cách hình học không gian có hình thù phức tạp, không đối xứng, ta nên sử dụng *Phương pháp tọa độ hóa (Oxyz)*.
      - *Bước 1:* Chọn hệ trục tọa độ $O x y z$ sao cho mặt phẳng trần nhà (hoặc mặt đất) trùng với mặt phẳng tọa độ $(O x y)$. Chọn gốc tọa độ $O$ tại vị trí có nhiều góc vuông (như điểm $A$) để dễ dàng thiết lập tọa độ các điểm neo.
      - *Bước 2:* Gọi tọa độ tâm quả cầu là $I(x; y; z)$. Dựa vào giả thiết chiều dài dây và đường kéo dài đi qua tâm, ta thiết lập các phương trình khoảng cách: $I A^2 = (R + l_A)^2$, $I B^2 = (R + l_B)^2$,...
      - *Bước 3:* Giải hệ phương trình vế theo vế để triệt tiêu các đại lượng bậc hai ($R^2, z^2...$), từ đó tìm được hình chiếu $(x; y)$ của $I$ lên mặt trần, sau đó tìm được $R$ và độ cao $|z|$.
      - *Bước 4:* Xác định kết quả. Khoảng cách từ tâm đến trần nhà là $|z|$. Khoảng cách đến *điểm thấp nhất* của quả cầu sẽ là $|z| + R$.
    ]
    #align(center)[#fig-sol]
    #v(0.5em)
    #step[
      Chọn hệ trục tọa độ $O x y z$ sao cho mặt phẳng $(O x y)$ trùng với mặt trần nhà. Chọn $A(0; 0; 0)$ là gốc tọa độ.
      Vì hình thang $A B C D$ vuông tại $A$ và $B$ nên $A D parallel B C$.
      Dựa vào kích thước $A B = 40$, $B C = 40$, $A D = 60$, ta xác định được tọa độ các đỉnh:
      $ B(40; 0; 0), quad C(40; 40; 0), quad D(0; 60; 0) $
    ]
    #step[
      Gọi $I(x; y; z)$ là tâm của quả cầu $(T)$. Vì quả cầu nằm dưới trần nhà nên $z < 0$.
      Do các đoạn dây được gắn vào mặt quả cầu và đường kéo dài đi qua tâm $I$, nên khoảng cách từ các điểm treo đến tâm $I$ chính bằng chiều dài đoạn dây cộng thêm bán kính $R$.
      Ta có hệ thức khoảng cách:
      $ I A = I B = R + 70 $
      $ I C = I D = R + 60 $
    ]
    #step[
      Từ $I A = I B arrow.r.double I A^2 = I B^2$, ta có:
      $ x^2 + y^2 + z^2 = (x - 40)^2 + y^2 + z^2 arrow.r.double x^2 = (x - 40)^2 arrow.r.double x = 20 $
      
      Từ $I C = I D arrow.r.double I C^2 = I D^2$, ta có:
      $ (x - 40)^2 + (y - 40)^2 + z^2 = x^2 + (y - 60)^2 + z^2 $
      Thay $x = 20$ vào, ta thấy lượng $x$ hai bên bằng nhau và triệt tiêu:
      $ (y - 40)^2 = (y - 60)^2 arrow.r.double y - 40 = 60 - y arrow.r.double 2y = 100 arrow.r.double y = 50 $
      
      Vậy tọa độ hình chiếu của $I$ lên trần nhà là $(20; 50; 0)$ và $I(20; 50; z)$.
    ]
    #step[
      Thay tọa độ $I$ vào biểu thức tính $I A^2$ và $I D^2$ để tìm $R$ và $z$:
      $ I A^2 = 20^2 + 50^2 + z^2 = 2900 + z^2 arrow.r.double 2900 + z^2 = (R + 70)^2 quad (1) $
      $ I D^2 = 20^2 + (50 - 60)^2 + z^2 = 500 + z^2 arrow.r.double 500 + z^2 = (R + 60)^2 quad (2) $
      
      Lấy (1) trừ (2) vế theo vế:
      $ (R + 70)^2 - (R + 60)^2 = 2900 - 500 = 2400 $
      $ (R^2 + 140R + 4900) - (R^2 + 120R + 3600) = 2400 $
      $ 20R + 1300 = 2400 arrow.r.double 20R = 1100 arrow.r.double R = 55 text(" (cm)") $
    ]
    #step[
      Thay bán kính $R = 55$ vào phương trình (2) để tìm độ cao $z$:
      $ 500 + z^2 = (55 + 60)^2 = 115^2 = 13225 $
      $ z^2 = 12725 arrow.r.double |z| = sqrt(12725) approx 112.805 text(" (cm)") $
      Vậy khoảng cách từ tâm $I$ đến trần nhà là $112.805$ cm.
    ]
    #step[
      Khoảng cách từ *điểm thấp nhất* của quả cầu đến trần nhà bằng khoảng cách từ tâm $I$ đến trần cộng thêm bán kính $R$:
      $ d = |z| + R = sqrt(12725) + 55 approx 112.805 + 55 = 167.805 text(" (cm)") $
      
      Làm tròn kết quả đến hàng đơn vị, ta được đáp án là *$168$ cm*.
    ]
  ]
)

#import "@preview/cetz:0.5.2"

// 1. HÌNH VẼ ĐỀ BÀI
#let fig-q1 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1, 1)
  let B = (-3, -1)
  let C = (3, 0)
  let I = (0, -3.5)
  let R = 1.2
  
  // Trần nhà tam giác vuông (Dùng line close: true)
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  
  // Dây treo
  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  // Quả cầu
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  
  content((A.at(0), A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
})

// 2. HÌNH VẼ LỜI GIẢI (CÓ TRỤC Oxyz)
#let fig-sol1 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1, 1)
  let B = (-3, -1)
  let C = (3, 0)
  let I = (0, -3.5)
  let R = 1.2
  
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  
  // Trục Tọa độ Oxyz (gốc A)
  let vX = (B.at(0) - A.at(0), B.at(1) - A.at(1))
  let vY = (C.at(0) - A.at(0), C.at(1) - A.at(1))
  line(A, (A.at(0) + 1.3*vX.at(0), A.at(1) + 1.3*vX.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0) + 1.2*vY.at(0), A.at(1) + 1.2*vY.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0), A.at(1) - 6.5), mark: (end: ">", fill: red), stroke: 1pt + red)
  
  content((A.at(0) + 1.4*vX.at(0), A.at(1) + 1.4*vX.at(1)), text(fill: red, weight: "bold")[$x$])
  content((A.at(0) + 1.3*vY.at(0), A.at(1) + 1.3*vY.at(1)), text(fill: red, weight: "bold")[$y$])
  content((A.at(0) + 0.3, A.at(1) - 6.3), text(fill: red, weight: "bold")[$z$])

  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  circle(I, radius: 1.5pt, fill: red)
  content((I.at(0) + 0.4, I.at(1) - 0.2), text(fill: red, weight: "bold")[$I$])
  
  content((A.at(0) - 0.2, A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
})

// 3. MÃ TRÌNH BÀY CÂU HỎI
#tln(
  [Trên trần nhà nằm ngang có ba điểm $A, B, C$ tạo thành một tam giác vuông tại $A$, có các kích thước $A B = 30$ cm, $A C = 40$ cm. Người ta treo một quả cầu pha lê $(T)$ có bán kính $R = 15$ cm lên trần nhà bằng ba sợi dây cước thanh mảnh, không dãn. Một đầu dây được gắn vào các điểm $A, B, C$, đầu còn lại gắn vào mặt quả cầu sao cho đường kéo dài của các sợi dây đều đi qua tâm của quả cầu. Biết chiều dài của ba sợi dây treo lần lượt là $l_A = 20$ cm, $l_B = 20$ cm, $l_C = 30$ cm. Tính khoảng cách từ **điểm thấp nhất** của quả cầu $(T)$ đến mặt trần nhà (tính bằng centimet).],
  [45],
  fig: fig-q1,
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      Để giải quyết bài toán treo vật thể bằng dây, ta dùng **Phương pháp tọa độ hóa (Oxyz)**:
      - **Bước 1:** Gắn hệ trục tọa độ $O x y z$ với mặt trần nhà là mặt phẳng $(O x y)$. Chọn gốc tọa độ tại vị trí góc vuông $A$ để tối ưu hóa tọa độ các điểm neo.
      - **Bước 2:** Gọi tọa độ tâm vật thể là $I(x; y; z)$. 
      - **Bước 3:** Sử dụng công thức khoảng cách từ $I$ đến các điểm treo (bằng chiều dài dây $+$ bán kính quả cầu) để lập hệ phương trình. Giải hệ tìm $(x; y; z)$.
      - **Bước 4:** Độ cao tâm quả cầu đến trần là $|z|$. Khoảng cách đến điểm thấp nhất là $|z| + R$.
    ]
    #align(center)[#fig-sol1]
    #v(0.5em)
    #step[
      Chọn hệ trục tọa độ $O x y z$ sao cho mặt phẳng $(O x y)$ trùng với mặt trần nhà. Chọn $A(0; 0; 0)$ là gốc tọa độ, tia $A B$ nằm trên trục $O x$, tia $A C$ nằm trên trục $O y$.
      Từ giả thiết $A B = 30$, $A C = 40$, ta có tọa độ các điểm treo:
      $ A(0; 0; 0), quad B(30; 0; 0), quad C(0; 40; 0) $
    ]
    #step[
      Gọi $I(x; y; z)$ là tâm của quả cầu $(T)$. Vì quả cầu treo dưới trần nhà nên $z < 0$.
      Khoảng cách từ các điểm treo đến tâm $I$ bằng chiều dài dây cộng với bán kính $R = 15$:
      $ I A = l_A + R = 20 + 15 = 35 $
      $ I B = l_B + R = 20 + 15 = 35 $
      $ I C = l_C + R = 30 + 15 = 45 $
    ]
    #step[
      Từ $I A = I B arrow.r.double I A^2 = I B^2$, ta có:
      $ x^2 + y^2 + z^2 = (x - 30)^2 + y^2 + z^2 arrow.r.double x^2 = (x - 30)^2 arrow.r.double x = 15 $
      
      Từ $I C^2 = 45^2 = 2025$, ta có:
      $ x^2 + (y - 40)^2 + z^2 = 2025 quad (1) $
      
      Mặt khác, từ $I A^2 = 35^2 = 1225$, ta có:
      $ x^2 + y^2 + z^2 = 1225 quad (2) $
    ]
    #step[
      Lấy phương trình (1) trừ đi phương trình (2) vế theo vế:
      $ (y - 40)^2 - y^2 = 2025 - 1225 $
      $ y^2 - 80y + 1600 - y^2 = 800 $
      $ -80y = -800 arrow.r.double y = 10 $
    ]
    #step[
      Thay $x = 15$ và $y = 10$ vào phương trình (2) để tìm cao độ $z$:
      $ 15^2 + 10^2 + z^2 = 1225 $
      $ 225 + 100 + z^2 = 1225 arrow.r.double z^2 = 900 arrow.r.double z = -30 text(" (do } z < 0 text{)") $
      Vậy tâm quả cầu cách trần nhà một khoảng là $|z| = 30$ cm.
    ]
    #step[
      Khoảng cách từ **điểm thấp nhất** của quả cầu đến trần nhà bằng khoảng cách từ tâm $I$ đến trần cộng thêm bán kính $R$:
      $ d = |z| + R = 30 + 15 = 45 text(" (cm)") $
    ]
  ]
)

#import "@preview/cetz:0.5.2"

// 1. HÌNH VẼ ĐỀ BÀI
#let fig-q2 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1.5, 1)
  let B = (-3.5, -0.5)
  let C = (2.5, -0.5)
  let I = (-0.5, -3)
  let R = 1.0
  
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  
  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  
  content((A.at(0), A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
})

// 2. HÌNH VẼ LỜI GIẢI
#let fig-sol2 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1.5, 1)
  let B = (-3.5, -0.5)
  let C = (2.5, -0.5)
  let I = (-0.5, -3)
  let R = 1.0
  
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  
  let vX = (B.at(0) - A.at(0), B.at(1) - A.at(1))
  let vY = (C.at(0) - A.at(0), C.at(1) - A.at(1))
  line(A, (A.at(0) + 1.3*vX.at(0), A.at(1) + 1.3*vX.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0) + 1.2*vY.at(0), A.at(1) + 1.2*vY.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0), A.at(1) - 6.0), mark: (end: ">", fill: red), stroke: 1pt + red)
  
  content((A.at(0) + 1.4*vX.at(0), A.at(1) + 1.4*vX.at(1)), text(fill: red, weight: "bold")[$x$])
  content((A.at(0) + 1.3*vY.at(0), A.at(1) + 1.3*vY.at(1)), text(fill: red, weight: "bold")[$y$])
  content((A.at(0) + 0.3, A.at(1) - 5.8), text(fill: red, weight: "bold")[$z$])

  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  circle(I, radius: 1.5pt, fill: red)
  content((I.at(0) + 0.4, I.at(1) - 0.2), text(fill: red, weight: "bold")[$I$])
  
  content((A.at(0) - 0.2, A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
})

// 3. MÃ TRÌNH BÀY CÂU HỎI
#tln(
  [Trên mặt trần nhà phẳng, người ta định vị ba điểm $A, B, C$ sao cho tam giác $A B C$ vuông tại $A$, với $A B = 24$ cm và $A C = 44$ cm. Một chiếc đèn lồng hình cầu $(T)$ có bán kính $R = 5$ cm được treo lên trần nhà bằng ba đoạn dây thanh mảnh. Các đoạn dây này có một đầu gắn vào $A, B, C$ và đầu còn lại gắn vào bề mặt của vỏ đèn sao cho đường kéo dài của chúng luôn đi qua tâm của đèn. Biết chiều dài của ba đoạn dây lần lượt là $l_A = 24$ cm, $l_B = 24$ cm và $l_C = 32$ cm. Tính khoảng cách từ **điểm cao nhất** của chiếc đèn $(T)$ đến mặt trần nhà (tính bằng centimet).],
  [16],
  fig: fig-q2,
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      Sử dụng **Phương pháp tọa độ hóa (Oxyz)**:
      - Chọn gốc tọa độ $A(0;0;0)$, áp dụng giả thiết về độ dài để xác định tọa độ các điểm treo.
      - Gọi tọa độ tâm đèn là $I(x; y; z)$. Dùng công thức độ dài $I A, I B, I C$ để lập hệ phương trình.
      - Chú ý: Khoảng cách từ tâm đến các móc treo phải bao gồm cả chiều dài dây và bán kính quả cầu (ví dụ $I A = l_A + R$).
      - Cần đọc kỹ yêu cầu: Khoảng cách đến **điểm cao nhất** của quả cầu sẽ bằng khoảng cách từ tâm $I$ đến trần nhà trừ đi bán kính $R$.
    ]
    #align(center)[#fig-sol2]
    #v(0.5em)
    #step[
      Chọn hệ trục tọa độ $O x y z$ với mặt trần nhà là mặt phẳng $(O x y)$. Gốc tọa độ tại $A(0; 0; 0)$, trục $O x$ chứa $A B$, trục $O y$ chứa $A C$.
      Ta có tọa độ các điểm treo:
      $ A(0; 0; 0), quad B(24; 0; 0), quad C(0; 44; 0) $
    ]
    #step[
      Gọi tâm của chiếc đèn là $I(x; y; z)$ (với $z < 0$). Khoảng cách từ tâm $I$ đến các điểm treo bằng chiều dài dây cộng bán kính $R = 5$:
      $ I A = l_A + R = 24 + 5 = 29 $
      $ I B = l_B + R = 24 + 5 = 29 $
      $ I C = l_C + R = 32 + 5 = 37 $
    ]
    #step[
      Do $I A = I B arrow.r.double I A^2 = I B^2$, ta có:
      $ x^2 + y^2 + z^2 = (x - 24)^2 + y^2 + z^2 arrow.r.double x^2 = (x - 24)^2 arrow.r.double x = 12 $
      
      Do $I C^2 = 37^2 = 1369$, ta có:
      $ x^2 + (y - 44)^2 + z^2 = 1369 quad (1) $
      
      Mặt khác, từ $I A^2 = 29^2 = 841$, ta có:
      $ x^2 + y^2 + z^2 = 841 quad (2) $
    ]
    #step[
      Lấy (1) trừ đi (2) vế theo vế để triệt tiêu $x^2$ và $z^2$:
      $ (y - 44)^2 - y^2 = 1369 - 841 $
      $ y^2 - 88y + 1936 - y^2 = 528 $
      $ -88y = -1408 arrow.r.double y = 16 $
    ]
    #step[
      Thay $x = 12$ và $y = 16$ vào (2) để tìm $z$:
      $ 12^2 + 16^2 + z^2 = 841 $
      $ 144 + 256 + z^2 = 841 arrow.r.double z^2 = 441 arrow.r.double z = -21 text(" (do } z < 0 text{)") $
      Vậy khoảng cách từ tâm $I$ của quả đèn đến trần nhà là $|z| = 21$ cm.
    ]
    #step[
      Khoảng cách từ **điểm cao nhất** của chiếc đèn lồng đến trần nhà bằng khoảng cách từ tâm $I$ trừ đi bán kính $R$:
      $ d = |z| - R = 21 - 5 = 16 text(" (cm)") $
    ]
  ]
)
#import "@preview/cetz:0.5.2"

// 1. HÌNH VẼ ĐỀ BÀI
#let fig-q3 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1, 1); let B = (-3, -1); let C = (3, 0)
  let I = (0, -3.5); let R = 1.0
  
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  
  content((A.at(0), A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
})

// 2. HÌNH VẼ LỜI GIẢI
#let fig-sol3 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1, 1); let B = (-3, -1); let C = (3, 0)
  let I = (0, -3.5); let R = 1.0
  
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  
  let vX = (B.at(0) - A.at(0), B.at(1) - A.at(1))
  let vY = (C.at(0) - A.at(0), C.at(1) - A.at(1))
  line(A, (A.at(0) + 1.3*vX.at(0), A.at(1) + 1.3*vX.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0) + 1.2*vY.at(0), A.at(1) + 1.2*vY.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0), A.at(1) - 6.5), mark: (end: ">", fill: red), stroke: 1pt + red)
  
  content((A.at(0) + 1.4*vX.at(0), A.at(1) + 1.4*vX.at(1)), text(fill: red, weight: "bold")[$x$])
  content((A.at(0) + 1.3*vY.at(0), A.at(1) + 1.3*vY.at(1)), text(fill: red, weight: "bold")[$y$])
  content((A.at(0) + 0.3, A.at(1) - 6.3), text(fill: red, weight: "bold")[$z$])

  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: 0.7pt)
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  circle(I, radius: R, fill: gradient.radial(white, rgb("444444")), stroke: none)
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  circle(I, radius: 1.5pt, fill: red)
  content((I.at(0) + 0.4, I.at(1) - 0.2), text(fill: red, weight: "bold")[$I$])
  
  content((A.at(0) - 0.2, A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
})

// 3. MÃ TRÌNH BÀY CÂU HỎI
#tln(
  [Trên trần nhà phẳng, người ta chọn ba điểm $A, B, C$ tạo thành một tam giác vuông tại $A$ với các kích thước $A B = 24$ cm, $A C = 39$ cm. Người ta treo một quả cầu $(T)$ có bán kính $R$ chưa biết lên trần nhà bằng ba sợi dây thanh mảnh. Đầu các sợi dây được gắn vào $A, B, C$, đầu còn lại gắn vào mặt quả cầu sao cho đường kéo dài của chúng luôn đi qua tâm quả cầu. Biết chiều dài của ba đoạn dây lần lượt là $l_A = 10$ cm, $l_B = 10$ cm, $l_C = 23$ cm. Đồng thời, đo được khoảng cách từ **điểm thấp nhất** của quả cầu đến mặt trần nhà là $35$ cm. Tính bán kính $R$ của quả cầu (đơn vị: centimet).],
  [15],
  fig: fig-q3,
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      Đây là bài toán ngược của cấu trúc tọa độ hóa $O x y z$.
      - Thiết lập trục tọa độ tương tự: $A(0;0;0)$. Gọi $I(x; y; z)$ là tâm quả cầu ($z < 0$).
      - Khoảng cách đến điểm thấp nhất là $d = |z| + R = -z + R = 35 arrow.r.double z = R - 35$.
      - Lập hệ 3 phương trình khoảng cách từ $I$ đến $A, B, C$ (với ẩn là $x, y$ và $R$).
      - Rút thế linh hoạt để giải ra $y$, từ đó tìm được $R$.
    ]
    #align(center)[#fig-sol3]
    #v(0.5em)
    #step[
      Chọn hệ trục tọa độ $O x y z$ với mặt trần nhà là mặt phẳng $(O x y)$. Gốc tọa độ tại $A(0; 0; 0)$, trục $O x$ chứa $A B$, trục $O y$ chứa $A C$.
      Tọa độ các điểm neo:
      $ A(0; 0; 0), quad B(24; 0; 0), quad C(0; 39; 0) $
    ]
    #step[
      Gọi tâm của quả cầu là $I(x; y; z)$ (với $z < 0$).
      Theo giả thiết, điểm thấp nhất cách trần 35 cm nên:
      $ |z| + R = 35 arrow.r.double -z + R = 35 arrow.r.double z = R - 35 $
      
      Khoảng cách từ tâm $I$ đến các điểm neo là chiều dài dây cộng bán kính:
      $ I A^2 = (10 + R)^2 quad (1) $
      $ I B^2 = (10 + R)^2 quad (2) $
      $ I C^2 = (23 + R)^2 quad (3) $
    ]
    #step[
      Do $I A^2 = I B^2$, ta có phương trình:
      $ x^2 + y^2 + z^2 = (x - 24)^2 + y^2 + z^2 arrow.r.double x^2 = (x - 24)^2 arrow.r.double x = 12 $
      
      Lấy (3) trừ (1) vế theo vế để tìm mối liên hệ giữa $y$ và $R$:
      $ [x^2 + (y - 39)^2 + z^2] - [x^2 + y^2 + z^2] = (R + 23)^2 - (R + 10)^2 $
      $ (y - 39)^2 - y^2 = (R^2 + 46R + 529) - (R^2 + 20R + 100) $
      $ -78y + 1521 = 26R + 429 $
      $ 78y + 26R = 1092 $
      Chia cả hai vế cho 26, ta thu được:
      $ 3y + R = 42 arrow.r.double R = 42 - 3y $
    ]
    #step[
      Thay $x = 12$, $z = R - 35 = (42 - 3y) - 35 = 7 - 3y$ và $R = 42 - 3y$ vào phương trình (1):
      $ x^2 + y^2 + z^2 = (R + 10)^2 $
      $ 12^2 + y^2 + (7 - 3y)^2 = (52 - 3y)^2 $
      $ 144 + y^2 + 49 - 42y + 9y^2 = 2704 - 312y + 9y^2 $
    ]
    #step[
      Nhận thấy đại lượng $9y^2$ ở hai vế triệt tiêu cho nhau, đưa về phương trình bậc hai tuyệt đẹp:
      $ y^2 - 42y + 193 = -312y + 2704 $
      $ y^2 + 270y - 2511 = 0 $
      Giải phương trình bậc hai này, ta được hai nghiệm:
      $ hoac(y &= 9, y &= -279) $
      - Nếu $y = -279 arrow.r.double R = 42 - 3(-279) = 879$ (cm) $arrow.r.double z = 879 - 35 = 844 > 0$ (Vô lý vì $z < 0$).
      - Nếu $y = 9 arrow.r.double R = 42 - 3(9) = 15$ (cm) $arrow.r.double z = 15 - 35 = -20 < 0$ (Thỏa mãn).
      
      Vậy bán kính của quả cầu là **$R = 15$ cm**.
    ]
  ]
)


#import "@preview/cetz:0.5.2"

// 1. HÌNH VẼ ĐỀ BÀI
#let fig-q4 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1.5, 1); let B = (-3.5, -0.5); let C = (2.5, -0.5)
  let I = (-0.5, -3) // Camera là một điểm
  
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  
  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: (paint: red, dash: "dotted", thickness: 1.2pt)) // Dây cần tìm
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  circle(I, radius: 2.5pt, fill: blue) // Mô phỏng camera
  
  content((A.at(0), A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
  content((I.at(0), I.at(1) - 0.4), text(fill: blue, weight: "bold")[Camera])
  content((-1.5, -1.8), text(fill: red)[$?$])
})

// 2. HÌNH VẼ LỜI GIẢI
#let fig-sol4 = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let A = (-1.5, 1); let B = (-3.5, -0.5); let C = (2.5, -0.5)
  let I = (-0.5, -3)
  
  line(A, B, C, close: true, fill: rgb("E5E5E5").lighten(30%), stroke: 1pt)
  
  let vX = (B.at(0) - A.at(0), B.at(1) - A.at(1))
  let vY = (C.at(0) - A.at(0), C.at(1) - A.at(1))
  line(A, (A.at(0) + 1.3*vX.at(0), A.at(1) + 1.3*vX.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0) + 1.2*vY.at(0), A.at(1) + 1.2*vY.at(1)), mark: (end: ">", fill: red), stroke: 1pt + red)
  line(A, (A.at(0), A.at(1) - 5.5), mark: (end: ">", fill: red), stroke: 1pt + red)
  
  content((A.at(0) + 1.4*vX.at(0), A.at(1) + 1.4*vX.at(1)), text(fill: red, weight: "bold")[$x$])
  content((A.at(0) + 1.3*vY.at(0), A.at(1) + 1.3*vY.at(1)), text(fill: red, weight: "bold")[$y$])
  content((A.at(0) + 0.3, A.at(1) - 5.3), text(fill: red, weight: "bold")[$z$])

  line(A, I, stroke: 0.7pt)
  line(B, I, stroke: (paint: red, thickness: 1.2pt))
  line(C, I, stroke: (paint: black, dash: "dashed", thickness: 0.7pt))
  
  for pt in (A, B, C) { circle(pt, radius: 1.5pt, fill: black) }
  circle(I, radius: 2.5pt, fill: blue)
  content((I.at(0) + 0.4, I.at(1) - 0.2), text(fill: blue, weight: "bold")[$I$])
  
  content((A.at(0) - 0.2, A.at(1) + 0.3), [*A*])
  content((B.at(0) - 0.3, B.at(1)), [*B*])
  content((C.at(0) + 0.3, C.at(1)), [*C*])
})

// 3. MÃ TRÌNH BÀY CÂU HỎI
#tln(
  [Người ta lắp đặt một chiếc Camera an ninh (kích thước rất nhỏ, được coi như một điểm) treo dưới trần nhà bằng ba sợi dây cáp thanh mảnh. Trên mặt trần nhà phẳng, định vị ba điểm neo $A, B, C$ sao cho tam giác $A B C$ vuông tại $A$, có kích thước $A B = 24$ cm, $A C = 36$ cm. Biết chiều dài sợi dây cáp neo tại $A$ là $l_A = 25$ cm, chiều dài sợi neo tại $C$ là $l_C = 29$ cm và khoảng cách từ Camera đến mặt trần nhà đo được là $16$ cm. Tính chiều dài sợi dây cáp neo tại $B$ (biết hình chiếu vuông góc của Camera lên trần nhà nằm hoàn toàn bên trong tam giác $A B C$).],
  [25],
  fig: fig-q4,
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Tọa độ hóa $O x y z$ với $A(0;0;0)$. Gọi tọa độ Camera là $I(x; y; z)$.
      - Vì kích thước Camera được coi là một điểm, khoảng cách từ $I$ đến mặt phẳng trần $(O x y)$ chính bằng độ cao $|z|$. Suy ra $z = -16$.
      - Chiều dài dây chính là khoảng cách hình học: $I A = l_A$, $I C = l_C$.
      - Thiết lập hệ phương trình để tìm tọa độ $x, y$ của Camera. Sau đó dễ dàng tính được $l_B = I B$.
    ]
    #align(center)[#fig-sol4]
    #v(0.5em)
    #step[
      Chọn hệ trục tọa độ $O x y z$ với mặt trần nhà là mặt phẳng $(O x y)$. Gốc tọa độ tại $A(0; 0; 0)$, trục $O x$ chứa $A B$, trục $O y$ chứa $A C$.
      Tọa độ các điểm neo dây:
      $ A(0; 0; 0), quad B(24; 0; 0), quad C(0; 36; 0) $
    ]
    #step[
      Gọi tọa độ của chiếc Camera là $I(x; y; z)$. Vì Camera treo dưới trần nhà nên $z < 0$.
      Giả thiết cho biết khoảng cách từ Camera đến trần là 16 cm, do đó:
      $ |z| = 16 arrow.r.double z = -16 $
    ]
    #step[
      Vì kích thước Camera không đáng kể ($R = 0$), độ dài các sợi dây chính là khoảng cách từ $I$ đến các móc treo. Ta có hệ phương trình:
      $ heva(
        I A^2 = l_A^2 &= 25^2 = 625,
        I C^2 = l_C^2 &= 29^2 = 841
      ) $
      Khai triển tọa độ, thay $z = -16$, ta được:
      $ heva(
        x^2 + y^2 + (-16)^2 &= 625 quad (1),
        x^2 + (y - 36)^2 + (-16)^2 &= 841 quad (2)
      ) $
    ]
    #step[
      Từ (1) suy ra: $x^2 + y^2 = 625 - 256 = 369$. \
      Từ (2) suy ra: $x^2 + (y - 36)^2 = 841 - 256 = 585$. \
      
      Lấy (2) trừ (1) vế theo vế để giải $y$:
      $ (y - 36)^2 - y^2 = 585 - 369 $
      $ y^2 - 72y + 1296 - y^2 = 216 $
      $ -72y = -1080 arrow.r.double y = 15 $
    ]
    #step[
      Thay $y = 15$ ngược lại vào (1) để tìm $x$:
      $ x^2 + 15^2 = 369 arrow.r.double x^2 + 225 = 369 arrow.r.double x^2 = 144 $
      Vì hình chiếu của $I$ nằm trong tam giác $A B C$ (tức là $x > 0, y > 0$), ta chọn $x = 12$.
      Vậy tọa độ chính xác của Camera là $I(12; 15; -16)$.
    ]
    #step[
      Chiều dài sợi dây cáp neo tại $B$ chính là khoảng cách $I B$:
      $ l_B = I B &= sqrt((12 - 24)^2 + (15 - 0)^2 + (-16 - 0)^2) $
      $ l_B &= sqrt((-12)^2 + 15^2 + (-16)^2) $
      $ l_B &= sqrt(144 + 225 + 256) = sqrt(625) = 25 text(" (cm)") $
      
      Vậy chiều dài sợi cáp neo tại $B$ là **$25$ cm**.
    ]
  ]
)


#tln(
  [Một giờ hoạt động ngoài trời của lớp 1/1 trường tiểu học X, cô giáo cho $35$ học sinh lớp mình nắm tay nhau xếp thành một vòng tròn để chơi trò chơi “Mèo bắt Chuột”. Sau khi ổn định, cô gọi tên ngẫu nhiên $6$ học sinh trong lớp ra giữa vòng ($3$ em làm “Mèo”, $3$ em làm “Chuột”). Xác suất $6$ em được gọi tên không có hai em nào đứng cạnh nhau trong vòng tròn bằng $P$. Tính $11594 P$.],
  [$4095$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
    for i in range(35) {
      let angle = i * 360deg / 35
      let is-chosen = (i == 0 or i == 6 or i == 12 or i == 18 or i == 24 or i == 30)
      let r = if is-chosen { 2.5pt } else { 1pt }
      let c = if is-chosen { red } else { black }
      circle((angle, 1.5), radius: r, fill: c, stroke: none)
    }
    content((0, -2), [_Minh họa chọn 6 em_ \ _không kề nhau_], size: 8pt, fill: gray)
  }),
  fig-pos: "right",
  fig-width: 30%,
  loigiai: [
    #ppgiai[
      - *Bài toán đếm số cách chọn phần tử trên vòng tròn:* Số cách chọn $k$ phần tử không kề nhau từ $n$ phần tử được xếp trên một vòng tròn là:
        $ S = n/(n-k) C_(n-k)^k $
      - Xác suất của biến cố: $P(A) = (n(A))/(n(Omega))$.
      - Việc phân vai "Mèo" và "Chuột" thực chất là chọn thêm $3$ học sinh từ $6$ học sinh đã được chọn. Hai công đoạn này diễn ra liên tiếp nên ta dùng quy tắc nhân.
    ]
    *Bước 1: Tính số phần tử của không gian mẫu.*
    Chọn ngẫu nhiên $6$ học sinh từ $35$ học sinh và phân vai (chọn $3$ em làm Mèo từ $6$ em vừa chọn, $3$ em còn lại tự động làm Chuột):
    $ n(Omega) = C_{35}^6 dot C_6^3 $
    
    *Bước 2: Tính số kết quả thuận lợi cho biến cố $A$.*
    Gọi $A$ là biến cố: "$6$ em được gọi tên không có hai em nào đứng cạnh nhau".
    Số cách chọn $6$ học sinh không kề nhau từ $35$ học sinh xếp thành vòng tròn ($n=35, k=6$) là:
    $ 35/(35-6) C_{35-6}^6 = 35/29 C_{29}^6 = 573300 " (cách)" $
    Sau đó phân vai Mèo - Chuột cho $6$ em này có $C_6^3$ cách.
    Suy ra số kết quả thuận lợi cho biến cố $A$ là:
    $ n(A) = 573300 dot C_6^3 $
    
    *Bước 3: Tính xác suất.*
    Xác suất để $6$ em được gọi tên không có hai em nào đứng cạnh nhau là:
    $ P = (n(A))/(n(Omega)) = (573300 dot C_6^3)/(C_{35}^6 dot C_6^3) = 573300/1623160 = 4095/11594 $
    
    Vậy giá trị cần tính là:
    $ 11594 P = 11594 dot 4095/11594 = 4095. $

    #meo[
      Khi bài toán yêu cầu phân bổ chức vụ (Mèo/Chuột) sau khi chọn nhóm, thao tác phân bổ này xuất hiện ở cả không gian mẫu $n(Omega)$ và tập kết quả thuận lợi $n(A)$. Ta có thể triệt tiêu thành phần $C_6^3$ ngay từ đầu để tiết kiệm thời gian tính toán.
    ]
  ]
)

// Câu 6
#tln(
  [Một giờ hoạt động ngoài trời của lớp 1/1 trường tiểu học X, cô giáo cho $35$ học sinh lớp mình nắm tay nhau xếp thành một vòng tròn để chơi trò chơi “Mèo bắt Chuột”. Sau khi ổn định, cô gọi tên ngẫu nhiên $6$ học sinh trong lớp ra giữa vòng ($3$ em làm “Mèo”, $3$ em làm “Chuột”). Xác suất $6$ em được gọi tên không có hai em nào đứng cạnh nhau trong vòng tròn bằng $P$. Tính $11594 P$.],
  [$4095$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
    for i in range(35) {
      let angle = i * 360deg / 35
      let is-chosen = (i == 0 or i == 6 or i == 12 or i == 18 or i == 24 or i == 30)
      let r = if is-chosen { 2.5pt } else { 1pt }
      let c = if is-chosen { red } else { black }
      circle((angle, 1.5), radius: r, fill: c, stroke: none)
    }
    content((0, -2), [_Minh họa chọn 6 em_ \ _không kề nhau_], size: 8pt, fill: gray)
  }),
  fig-pos: "right",
  fig-width: 30%,
  loigiai: [
    #ppgiai[
      *Khung lý thuyết đếm số cách chọn phần tử không kề nhau (Bổ đề Kaplansky):*
      - *Bài toán trên đường thẳng:* Chọn $k$ phần tử không kề nhau từ $n$ phần tử xếp thành hàng ngang. Lấy $n-k$ phần tử không được chọn làm vách ngăn, tạo ra $(n-k)+1$ khoảng trống. Số cách chọn là "thả" $k$ phần tử vào các khoảng trống đó: $S_"thẳng" = C_{n-k+1}^k$.
      - *Bài toán trên vòng tròn:* Chọn $k$ phần tử không kề nhau từ $n$ phần tử trên vòng tròn. Đánh số $1$ đến $n$. Ta chia làm 2 trường hợp rời nhau:
        + *TH1: Chọn phần tử ở vị trí số 1.* Khi đó không được phép chọn vị trí 2 và $n$. Bài toán trở thành chọn $k-1$ phần tử từ $n-3$ phần tử còn lại (đã mất tính vòng tròn, trở thành đường thẳng). Số cách chọn: $S_1 = C_{(n-3)-(k-1)+1}^(k-1) = C_(n-k-1)^(k-1)$.
        + *TH2: Không chọn phần tử ở vị trí số 1.* Vị trí số 1 trở thành vách ngăn làm đứt vòng tròn. Bài toán trở thành chọn $k$ phần tử từ $n-1$ phần tử trên đường thẳng. Số cách chọn: $S_2 = C_{(n-1)-k+1}^k = C_(n-k)^k$.
      - *Tổng hợp lại:* Tổng số cách chọn $k$ phần tử không kề nhau trên vòng tròn là $S = S_1 + S_2$:
        $ S = C_(n-k-1)^(k-1) + C_(n-k)^k $
      - Việc phân vai "Mèo" và "Chuột" thực chất là chọn thêm $3$ học sinh từ $6$ học sinh đã được chọn. Hai công đoạn này diễn ra liên tiếp nên ta dùng quy tắc nhân.
    ]
    *Bước 1: Tính số phần tử của không gian mẫu.*
    Chọn ngẫu nhiên $6$ học sinh từ $35$ học sinh và phân vai (chọn $3$ em làm Mèo từ $6$ em vừa chọn, $3$ em còn lại làm Chuột):
    $ n(Omega) = C_(35)^6 dot C_6^3 $
    
    *Bước 2: Tính số kết quả thuận lợi cho biến cố $A$.*
    Gọi $A$ là biến cố: "$6$ em được gọi tên không có hai em nào đứng cạnh nhau".
    Áp dụng công thức Kaplansky trên vòng tròn với $n=35, k=6$, số cách chọn $6$ học sinh không kề nhau là:
    $ S = C_(35-6-1)^(6-1) + C_(35-6)^6 = C_28^5 + C_29^6 = 98280 + 475020 = 573300 " (cách)" $
    Sau đó, phân vai Mèo - Chuột cho $6$ em này có $C_6^3$ cách.
    Suy ra số kết quả thuận lợi cho biến cố $A$ là:
    $ n(A) = 573300 dot C_6^3 $
    
    *Bước 3: Tính xác suất.*
    Xác suất để $6$ em được gọi tên không có hai em nào đứng cạnh nhau là:
    $ P = (n(A))/(n(Omega)) = (573300 dot C_6^3)/(C_{35}^6 dot C_6^3) = 573300/1623160 = 4095/11594 $
    
    Vậy giá trị cần tính là:
    $ 11594 P = 11594 dot 4095/11594 = 4095. $

    #meo[
      Khi bài toán yêu cầu phân bổ tính chất (ví dụ phân chia chức vụ Mèo/Chuột) đối với một nhóm vừa được chọn ra, bạn sẽ thấy tổ hợp phân bổ này (ở đây là $C_6^3$) đồng thời xuất hiện ở cả $n(A)$ và $n(Omega)$. Việc nhận diện sớm giúp ta triệt tiêu nó ngay từ đầu, đơn giản hóa phép tính xác suất chỉ còn lại bài toán đếm số cách chọn người cơ bản.
    ]
  ]
)