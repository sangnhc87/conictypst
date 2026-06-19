#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

// ── Heading styles ───────────────────────────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D47A1"), rgb("1565C0"), rgb("1976D2"), angle: 90deg),
  stroke: none,
  inset: (x: 16pt, y: 12pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("C62828")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("C62828"), size: 12.5pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("2E7D32")),
  inset: (left: 8pt, y: 4pt),
  text(fill: rgb("2E7D32"), size: 11.5pt, weight: "bold", it.body),
)

// ── Chế độ in ─────────────────────────────────────────────
#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ── Màu chủ đề ───────────────────────────────────────────
#let col-blue = rgb("0D47A1")
#let col-red = rgb("C62828")
#let col-green = rgb("2E7D32")
#let col-amber = rgb("E65100")
#let col-teal = rgb("00695C")
#let col-purple = rgb("6A1B9A")
#let col-bg-lt = rgb("E3F2FD")
#let col-bg-red = rgb("FFEBEE")
#let col-bg-grn = rgb("E8F5E9")
#let col-bg-amb = rgb("FFF3E0")

// ── Hộp lý thuyết tùy chỉnh ───────────────────────────────
#let theory-box(title: none, color: col-blue, bg: col-bg-lt, body) = block(
  fill: bg,
  stroke: (left: 4pt + color, rest: 0.7pt + color.lighten(50%)),
  radius: (right: 6pt),
  inset: (x: 15pt, y: 13pt),
  width: 100%,
  below: 1em,
)[
  #if title != none [
    #text(weight: "bold", fill: color, size: 11pt)[#title]
    #v(0.5em)
  ]
  #body
]

#let ppgiai(title: none, body) = theory-box(title: title, color: col-amber, bg: col-bg-amb, body)
#let lythuyet(title: none, body) = theory-box(title: title, color: col-teal, bg: col-bg-lt, body)

// ═══════════════════════════════════════════════════════════
// PHẦN BÀI TẬP: SỰ TIẾP XÚC GIỮA CÁC ĐƯỜNG CONIC VÀ HÌNH TRÒN
// ═══════════════════════════════════════════════════════════
= Chuyên đề: Sự Tiếp Xúc Giữa Đường Tròn Và Các Đường Conic

== I. Lý Thuyết Trọng Tâm

#lythuyet(title: [1. Tiếp xúc giữa Đường tròn và Parabol])[
  Xét đường tròn $(C)$ có tâm $I(0; c)$ nằm trên trục tung và bán kính $R$.
  Phương trình của $(C)$ là: $x^2 + (y - c)^2 = R^2$.
  
  Xét Parabol $(P)$ có phương trình: $y = a x^2$ (với $a > 0$).
  
  Để tìm giao điểm của $(C)$ và $(P)$, ta thế $x^2 = y/a$ (điều kiện $y >= 0$) vào phương trình của $(C)$:
  $ y/a + (y - c)^2 = R^2 <=> y^2 + (1/a - 2c)y + c^2 - R^2 = 0 quad (1) $
  
  Sự tiếp xúc xảy ra khi phương trình $(1)$ có *nghiệm kép* $y_0 >= 0$. 
  - *Trường hợp 1 (Tiếp xúc tại đỉnh $O$):* Nghiệm kép là $y = 0$. Bán kính lớn nhất để chạm đáy là $R = 1/(2a)$ (bán kính cong).
  - *Trường hợp 2 (Tiếp xúc tại 2 điểm đối xứng):* Nghiệm kép $y_0 > 0$. Điều kiện là $Delta = 0 <=> 4R^2 = 4c/a - 1/a^2$.
]

#lythuyet(title: [2. Tiếp xúc giữa Đường tròn với Elip và Hypebol])[
  *A. Với Elip $(E): x^2/a^2 + y^2/b^2 = 1$*
  Bán kính cong tại đỉnh nằm trên trục tung (ví dụ $(0; -b)$) là $R_c = a^2/b$.
  Một đường tròn nằm trong Elip sẽ có thể chạm đáy nếu bán kính $R <= a^2/b$. Nếu $R > a^2/b$, đường tròn sẽ bị kẹt lại ở hai bên hông và không thể chạm tới đáy.

  *B. Với Hypebol $(H): x^2/a^2 - y^2/b^2 = 1$*
  Khoảng cách hẹp nhất giữa hai nhánh là $2a$. Một đường tròn tâm nằm trên trục $O y$ di chuyển qua lại giữa hai nhánh. Bán kính tối đa để không bao giờ va chạm với Hypebol chính bằng $a$ (khi đó nó lọt qua khe hẹp nhất). 
]

== II. Hệ Thống Bài Tập Phân Dạng

=== Dạng 1: Đường tròn tiếp xúc Parabol tại đỉnh

#ds(
  [Một kỹ sư thiết kế một cái phễu có mặt cắt ngang là một Parabol $(P): y = x^2$. Người ta nhỏ một giọt nước hình cầu (xem như hình tròn trên mặt cắt 2D) rơi vào trong phễu. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Nếu bán kính giọt nước $R = 1$ thì giọt nước có thể chạm tới đáy phễu (điểm $O$).],
    True([Nếu bán kính giọt nước $R = 0.2$ thì giọt nước nằm hoàn toàn dưới $y = 0.5$ và chạm đáy phễu.]),
    True([Bán kính lớn nhất của giọt nước để nó còn chạm được đáy phễu là $R = 1/2$.]),
    [Nếu $R = 1$, giọt nước sẽ tiếp xúc với phễu tại hai điểm có tung độ $y = 3/4$.],
  ),
  loigiai: [
    #step[Đường tròn mô phỏng giọt nước có dạng $x^2 + (y - R)^2 = R^2$ (do chạm đáy $O(0;0)$ nên tâm là $(0; R)$).]
    #step[Thế $x^2 = y$ vào: $y + y^2 - 2R y + R^2 = R^2 <=> y^2 + (1 - 2R)y = 0$.]
    #step[Phương trình này luôn có nghiệm $y = 0$. Để $y = 0$ là nghiệm kép (tiếp xúc duy nhất tại đỉnh, không cắt xuyên qua), thì nghiệm còn lại $y = 2R - 1$ phải nhỏ hơn hoặc bằng $0$.]
    #step[Tức là $2R - 1 <= 0 <=> R <= 1/2$.]
    
    #step[*Ý a)* Sai. Khi $R = 1 > 1/2$, giọt nước sẽ bị kẹt lại phía trên, tiếp xúc tại 2 điểm chứ không chạm đáy.]
    #step[*Ý b)* Đúng. $R = 0.2 < 1/2$ nên giọt nước chạm đáy $O$. Điểm cao nhất của nó là $2R = 0.4 < 0.5$.]
    #step[*Ý c)* Đúng. Theo chứng minh trên $R_(max) = 1/2$.]
    #step[*Ý d)* Đúng. Nếu $R = 1$, tâm giọt nước nằm ở tọa độ $(0; c)$.
    Thế $x^2 = y$ vào $x^2 + (y - c)^2 = 1 <=> y^2 + (1 - 2c)y + c^2 - 1 = 0$. 
    Điều kiện $Delta = 0 <=> (1 - 2c)^2 - 4(c^2 - 1) = 0 <=> -4c + 5 = 0 <=> c = 5/4$.
    Nghiệm kép (tung độ tiếp điểm) là $y = - (1 - 2c)/2 = c - 1/2 = 5/4 - 1/2 = 3/4$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-2, 0), (2, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -0.5), (0, 3), mark: (end: ">"), stroke: rgb("C62828"))
      let p-pts = range(-18, 19).map(x => (x/10, (x/10)*(x/10)))
      line(..p-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      circle((0, 0.5), radius: 0.5, stroke: blue)
      circle((0, 1.25), radius: 1, stroke: green)
      content((0.5, 0.5), text(size: 8pt, fill: blue)[$R=1/2$])
      content((0, 2.5), text(size: 8pt, fill: green)[$R=1$])
    })
  ]
)

=== Dạng 2: Đường tròn tiếp xúc tại 2 điểm đối xứng (Parabol)

#tn(
  [Một quả bóng hình cầu có bán kính $R = sqrt(10)$ cm được thả vào một chiếc cốc hình Parabol có mặt cắt là đồ thị hàm số $y = 1/4 x^2$. Biết rằng quả bóng không thể chạm tới đáy cốc. Tìm khoảng cách từ tâm quả bóng đến đáy cốc (trục tung chứa tâm quả bóng, đáy cốc nằm tại gốc tọa độ).],
  ([$3$ cm], True([$3.5$ cm]), [$4$ cm], [$4.5$ cm]),
  loigiai: [
    #step[Tâm quả bóng nằm trên trục $O y$ nên có tọa độ $I(0; c)$. Bán kính $R = sqrt(10)$.]
    #step[Phương trình mặt cắt quả bóng: $x^2 + (y - c)^2 = 10$.]
    #step[Phương trình Parabol: $y = 1/4 x^2 => x^2 = 4y$.]
    #step[Thế $x^2 = 4y$ vào phương trình đường tròn:
    $4y + (y - c)^2 = 10 <=> y^2 + (4 - 2c)y + c^2 - 10 = 0$]
    #step[Để quả bóng tiếp xúc với thành cốc (bị kẹt lại), phương trình trên phải có nghiệm kép $y_0 > 0$.]
    #step[Xét $Delta' = (2 - c)^2 - (c^2 - 10) = 0 <=> 4 - 4c + c^2 - c^2 + 10 = 0 <=> 4c = 14 <=> c = 3.5$.]
    #step[Khi đó nghiệm kép $y_0 = -(2 - c) = c - 2 = 1.5 > 0$ (thỏa mãn).]
    #step[Khoảng cách từ tâm quả bóng đến đáy cốc là tung độ $c = 3.5$ cm. Chọn đáp án B.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-5, 0), (5, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -1), (0, 7), mark: (end: ">"), stroke: rgb("C62828"))
      let p-pts = range(-50, 51).map(x => (x/10, (x/10)*(x/10)/4))
      line(..p-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      let R = calc.sqrt(10)
      circle((0, 3.5), radius: R, stroke: blue)
      circle((0, 3.5), radius: 0.1, fill: black)
      content((0.5, 3.5), [$I$])
    })
  ]
)

=== Dạng 3: Đường tròn tiếp xúc tại 2 điểm đối xứng (Elip)

#tn(
  [Một quả bóng hình cầu được thả vào một bồn chứa có mặt cắt ngang là một nửa Elip (phần $y \le 0$) với phương trình $x^2/4 + y^2/16 = 1$. Biết quả bóng có bán kính $R = 2$ m và thả dọc theo trục tung. Vị trí tâm của quả bóng cách đáy bồn chứa một khoảng bao nhiêu mét?],
  ([$2$ m], [$3$ m], True([$4$ m]), [$5$ m]),
  loigiai: [
    #step[Đáy bồn chứa là đỉnh dưới của Elip: $(0; -4)$. Quả bóng nằm kẹt trong Elip có tâm $I(0; c)$ và bán kính $R = 2$.]
    #step[Phương trình quả bóng: $x^2 + (y - c)^2 = 4$.]
    #step[Từ phương trình Elip: $x^2 = 4(1 - y^2/16) = 4 - y^2/4$. Thế vào phương trình đường tròn:]
    #step[$4 - y^2/4 + (y - c)^2 = 4 <=> -y^2/4 + y^2 - 2c y + c^2 = 0 <=> 3/4 y^2 - 2c y + c^2 = 0$.]
    #step[Để quả bóng tiếp xúc hai bên thành bồn chứa, phương trình phải có nghiệm kép. 
    Xét $Delta' = c^2 - 3/4 c^2 = 1/4 c^2 = 0 <=> c = 0$.]
    #step[Khi $c = 0$, tâm quả bóng nằm chính xác tại gốc toạ độ $O(0;0)$.]
    #step[Khoảng cách từ tâm quả bóng đến đáy bồn $(0; -4)$ là $4$ m. Chọn đáp án C.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -5), (0, 1), mark: (end: ">"), stroke: rgb("C62828"))
      // Vẽ nửa dưới Elip x = 2 * cos, y = 4 * sin
      let e-pts = range(-180, 1).map(t => {
        let rad = t * 3.14159 / 180
        (2 * calc.cos(rad), 4 * calc.sin(rad))
      })
      line(..e-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      circle((0, 0), radius: 2, stroke: blue)
      circle((0, 0), radius: 0.1, fill: black)
      content((0.5, 0.3), [$O$])
      content((0.5, -4), [Đáy])
    })
  ]
)

=== Dạng 4: Chi tiết máy lách qua ngàm Hypebol

#tln(
  [Trong một hệ thống cơ khí, người ta cần đưa một chi tiết máy hình đĩa tròn đi qua một khe hở giữa hai ngàm kẹp cố định. Mặt cắt ngang của hai ngàm kẹp này là hai nhánh của đường Hypebol $x^2/9 - y^2/16 = 1$. Tâm của đĩa tròn di chuyển dọc theo trục tung $O y$. Tìm bán kính $R$ lớn nhất (tính bằng mm) của đĩa tròn để nó có thể lọt qua khe hở mà không bị kẹt ở bất kỳ độ cao nào.],
  [$3$],
  loigiai: [
    #step[Đĩa tròn có mặt cắt là đường tròn $(C)$ tâm $I(0; c)$ và bán kính $R$. Phương trình: $x^2 + (y-c)^2 = R^2$.]
    #step[Mặt cắt ngàm kẹp: $x^2/9 - y^2/16 = 1 <=> x^2 = 9 + 9/16 y^2$.]
    #step[Thế $x^2$ vào phương trình đường tròn để tìm toạ độ va chạm:
    $9 + 9/16 y^2 + y^2 - 2c y + c^2 = R^2 <=> 25/16 y^2 - 2c y + 9 + c^2 - R^2 = 0 quad (*)$]
    #step[Để đĩa lọt qua khe hở mà không bị kẹt ở bất kỳ độ cao $c$ nào, phương trình $(*)$ phải *vô nghiệm* hoặc có *nghiệm kép* với mọi $c$.]
    #step[Tức là $Delta' = c^2 - 25/16 (9 + c^2 - R^2) <= 0 quad forall c in RR$.]
    #step[Rút gọn $Delta'$: $-9/16 c^2 - 225/16 + 25/16 R^2 <= 0 <=> 25 R^2 <= 9 c^2 + 225 quad forall c$.]
    #step[Bất phương trình này phải đúng với mọi $c$. Đặt $c = 0$ (trạng thái hẹp nhất), ta có $25 R^2 <= 225 <=> R^2 <= 9 <=> R <= 3$.]
    #step[Thử lại, nếu $R <= 3$ thì $25 R^2 <= 225 <= 9 c^2 + 225$ luôn đúng. Vậy bán kính lớn nhất là $R = 3$ mét.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-6, 0), (6, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -4), (0, 4), mark: (end: ">"), stroke: rgb("C62828"))
      
      let h1-pts = range(-30, 31).map(y => {
        let y0 = y/10
        (3 * calc.sqrt(1 + y0*y0*9/16), y0)
      })
      let h2-pts = range(-30, 31).map(y => {
        let y0 = y/10
        (-3 * calc.sqrt(1 + y0*y0*9/16), y0)
      })
      line(..h1-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      line(..h2-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      
      circle((0, 1), radius: 3, stroke: blue)
      circle((0, 1), radius: 0.1, fill: black)
      content((0.5, 1), [$I$])
    })
  ]
)

=== Dạng 5: Cấu hình hai đường tròn trong Elip

#tln(
  [Cho một mảnh gỗ phẳng hình Elip có phương trình $x^2/16 + y^2/4 = 1$. Một thợ mộc muốn khoét hai lỗ tròn bằng nhau ở hai bên, sao cho hai lỗ tròn này tiếp xúc ngoài với nhau tại gốc toạ độ $O$ và mỗi lỗ tròn đều tiếp xúc với cạnh của mảnh gỗ Elip. Tính bán kính của các lỗ tròn đó (nhập kết quả dưới dạng số thập phân, làm tròn 2 chữ số sau dấu phẩy).],
  [$1","73$],
  loigiai: [
    #step[Vì hai lỗ tròn bằng nhau và tiếp xúc nhau tại $O$, nên tâm của chúng nằm trên trục hoành. Giả sử lỗ tròn bên phải $(C_1)$ có tâm $I_1(R; 0)$ và bán kính $R$.]
    #step[Phương trình $(C_1): (x - R)^2 + y^2 = R^2$.]
    #step[Từ phương trình Elip: $y^2 = 4(1 - x^2/16) = 4 - x^2/4$. Thế vào phương trình đường tròn:]
    #step[$(x - R)^2 + 4 - x^2/4 = R^2 <=> x^2 - 2R x + R^2 + 4 - x^2/4 = R^2 <=> 3/4 x^2 - 2R x + 4 = 0$.]
    #step[Để đường tròn tiếp xúc với Elip, phương trình trên phải có nghiệm kép:
    $Delta' = (-R)^2 - 3/4(4) = 0 <=> R^2 - 3 = 0 <=> R = sqrt(3)$.]
    #step[Giá trị xấp xỉ của $sqrt(3) approx 1,732$. Làm tròn 2 chữ số, kết quả là $1,73$.]
  ],
  fig-pos: "center",
  fig-width: 55%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-5, 0), (5, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -3), (0, 3), mark: (end: ">"), stroke: rgb("C62828"))
      
      let e-pts = range(-180, 181).map(t => {
        let rad = t * 3.14159 / 180
        (4 * calc.cos(rad), 2 * calc.sin(rad))
      })
      line(..e-pts, stroke: (paint: rgb("C62828"), thickness: 1pt), close: true)
      
      let R = 1.732
      circle((R, 0), radius: R, stroke: blue)
      circle((-R, 0), radius: R, stroke: blue)
      circle((R, 0), radius: 0.1, fill: black)
      circle((-R, 0), radius: 0.1, fill: black)
    })
  ]
)

=== Dạng 6: Chuỗi hình tròn tiếp xúc Parabol

#tln(
  [Trong một trò chơi thiết kế hình học, người ta xếp hai quả cầu (nhìn trên mặt cắt là hai hình tròn) vào trong một rãnh có hình Parabol $y = 1/2 x^2$. Quả cầu thứ nhất $(C_1)$ có bán kính $R_1 = 1$, chạm đáy rãnh tại tọa độ $(0; 0)$. Quả cầu thứ hai $(C_2)$ nằm bên trên, tiếp xúc với $(C_1)$ và tiếp xúc với cả hai bên thành rãnh Parabol. Tìm bán kính $R_2$ của quả cầu thứ hai.],
  [$3$],
  loigiai: [
    #step[Bán kính cong của Parabol tại đỉnh là $1/(2a) = 1/(2(1/2)) = 1$. Vì $R_1 = 1$ nên $(C_1)$ vừa vặn chạm đáy tại gốc tọa độ $O$.
    Tâm của $(C_1)$ là $I_1(0; 1)$. Phương trình $(C_1): x^2 + (y - 1)^2 = 1$.]
    #step[Giả sử $(C_2)$ có tâm $I_2(0; c_2)$ và bán kính $R_2$. Vì $(C_2)$ tiếp xúc ngoài với $(C_1)$ nên khoảng cách giữa hai tâm là tổng hai bán kính:
    $c_2 - 1 = R_1 + R_2 = 1 + R_2 => c_2 = R_2 + 2$.]
    #step[Đường tròn $(C_2): x^2 + (y - c_2)^2 = R_2^2$ tiếp xúc với Parabol $y = 1/2 x^2 => x^2 = 2y$.
    Thế vào phương trình $(C_2)$ ta được:
    $2y + (y - c_2)^2 = R_2^2 <=> y^2 + (2 - 2c_2)y + c_2^2 - R_2^2 = 0$.]
    #step[Để $(C_2)$ tiếp xúc hai bên thành Parabol thì phương trình trên phải có nghiệm kép $y > 0$:
    $Delta' = (1 - c_2)^2 - (c_2^2 - R_2^2) = 0 <=> 1 - 2c_2 + c_2^2 - c_2^2 + R_2^2 = 0 <=> 2c_2 = R_2^2 + 1$.]
    #step[Thay $c_2 = R_2 + 2$ vào ta được:
    $2(R_2 + 2) = R_2^2 + 1 <=> R_2^2 - 2R_2 - 3 = 0$.
    Phương trình này có hai nghiệm $R_2 = -1$ (loại) và $R_2 = 3$.]
    #step[Vậy bán kính của quả cầu thứ hai là $R_2 = 3$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-4, 0), (4, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -1), (0, 9), mark: (end: ">"), stroke: rgb("C62828"))
      let p-pts = range(-40, 41).map(x => (x/10, (x/10)*(x/10)/2))
      line(..p-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      circle((0, 1), radius: 1, stroke: blue)
      circle((0, 5), radius: 3, stroke: green)
      circle((0, 1), radius: 0.1, fill: black)
      circle((0, 5), radius: 0.1, fill: black)
      content((-0.8, 1), [$I_1$])
      content((-0.8, 5), [$I_2$])
    })
  ]
)


=== Dạng 8: Quỹ tích tâm đường tròn (Sự tiếp xúc của Parabol và Đường chuẩn)

#ds(
  [Cho Parabol $(P): y = 1/4 x^2$. Lấy một điểm $M$ bất kỳ di động trên $(P)$. Dựng một đường tròn $(C)$ có tâm $M$ và luôn tiếp xúc với đường thẳng $Delta: y = -1$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Parabol $(P)$ có tiêu điểm là $F(0; 1)$ và đường chuẩn là $y = -1$.]),
    True([Bán kính của đường tròn $(C)$ luôn bằng khoảng cách từ $M$ đến tiêu điểm $F$.]),
    [Đường tròn $(C)$ luôn đi qua một điểm cố định là gốc toạ độ $O$.],
    True([Nếu điểm $M$ có hoành độ $x_M = 4$ thì diện tích của đường tròn $(C)$ là $25 pi$.]),
  ),
  loigiai: [
    #step[*Ý a)* Đúng. $(P): x^2 = 4y => 2p = 4 => p = 2$. Tiêu điểm $F(0; 1)$ và đường chuẩn $Delta: y = -1$.]
    #step[*Ý b)* Đúng. Theo định nghĩa Parabol, mọi điểm $M in (P)$ đều có khoảng cách đến tiêu điểm bằng khoảng cách đến đường chuẩn ($M F = d(M, Delta)$).
    Vì $(C)$ có tâm $M$ tiếp xúc với $Delta$ nên bán kính $R = d(M, Delta)$. Suy ra $R = M F$.]
    #step[*Ý c)* Sai. Do $M F = R$, nên điểm $F$ luôn nằm trên đường tròn $(C)$. Vậy $(C)$ luôn đi qua điểm cố định là tiêu điểm $F(0; 1)$, không phải gốc toạ độ $O$.]
    #step[*Ý d)* Đúng. Nếu $x_M = 4 => y_M = 1/4 (4^2) = 4$. Toạ độ $M(4; 4)$. Bán kính $R = d(M, Delta) = y_M - (-1) = 4 + 1 = 5$. Diện tích $(C) = pi R^2 = 25 pi$.]
  ],
  fig-pos: "center",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-5, 0), (5, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -2), (0, 6), mark: (end: ">"), stroke: rgb("C62828"))
      let p-pts = range(-45, 46).map(x => (x/10, (x/10)*(x/10)/4))
      line(..p-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      // Đường chuẩn
      line((-4, -1), (4, -1), stroke: (paint: blue, dash: "dashed"))
      // Điểm M(2, 1)
      circle((2, 1), radius: 0.1, fill: black)
      content((2.5, 1.2), [$M$])
      // Tiêu điểm F
      circle((0, 1), radius: 0.1, fill: black)
      content((-0.5, 1.3), [$F$])
      // Đường tròn (C) tâm M
      circle((2, 1), radius: 2, stroke: green)
      content((-3, -1.3), text(fill: blue)[$Delta: y=-1$])
    })
  ]
)

=== Dạng 9: Quả cầu lọt thỏm trong khe hẹp (Parabol)

#tln(
  [Trong một chiếc cốc hình Parabol $y = 1/4 x^2$, người ta đặt một quả cầu thủy tinh lớn $(C_1)$ sao cho tâm của nó nằm trên trục tung tại toạ độ $(0; 5)$ và tiếp xúc với hai bên thành cốc. Phía dưới quả cầu $(C_1)$ sẽ tạo ra một khoảng trống với đáy cốc. Người ta thả tiếp một viên bi nhỏ $(C_2)$ lọt thỏm vào khoảng trống đó sao cho viên bi chạm đáy cốc tại $O$ và tiếp xúc ngoài với quả cầu $(C_1)$. Tìm bán kính $r$ của viên bi $(C_2)$.],
  [$0","5$],
  loigiai: [
    #step[Giả sử quả cầu lớn $(C_1)$ có bán kính $R_1$. Tâm $I_1(0; 5)$. Phương trình: $x^2 + (y-5)^2 = R_1^2$.]
    #step[Mặt cắt cốc: $y = 1/4 x^2 <=> x^2 = 4y$. Thế vào phương trình $(C_1)$:
    $4y + y^2 - 10y + 25 = R_1^2 <=> y^2 - 6y + 25 - R_1^2 = 0$.]
    #step[Để $(C_1)$ tiếp xúc hai bên thành cốc, phương trình trên phải có nghiệm kép:
    $Delta' = (-3)^2 - (25 - R_1^2) = 0 <=> 9 - 25 + R_1^2 = 0 <=> R_1^2 = 16 <=> R_1 = 4$.]
    #step[Điểm thấp nhất của quả cầu lớn $(C_1)$ nằm trên trục tung có tung độ là $y_{min} = 5 - R_1 = 5 - 4 = 1$.
    Khoảng trống dưới đáy cốc là đoạn từ $y = 0$ đến $y = 1$.]
    #step[Viên bi $(C_2)$ nằm trong khoảng trống, chạm đáy cốc nên tâm $I_2(0; r)$, điểm cao nhất của $(C_2)$ là $2r$.
    Viên bi $(C_2)$ tiếp xúc ngoài với $(C_1)$ tại điểm thấp nhất của $(C_1)$. Do đó: $2r = 1 <=> r = 0.5$.]
    #step[Kiểm tra lại: Bán kính cong của đáy Parabol là $R_c = 1/(2a) = 2$. Vì $r = 0.5 < 2$, viên bi nhỏ hoàn toàn lọt thỏm và chạm được tới đáy cốc mà không bị kẹt ở hai bên thành. Vậy $r = 0.5$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-5, 0), (5, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -1), (0, 10), mark: (end: ">"), stroke: rgb("C62828"))
      let p-pts = range(-60, 61).map(x => (x/10, (x/10)*(x/10)/4))
      line(..p-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      
      circle((0, 5), radius: 4, stroke: blue)
      circle((0, 0.5), radius: 0.5, stroke: green, fill: green.lighten(80%))
      
      circle((0, 5), radius: 0.1, fill: black)
      content((0.5, 5), [$I_1$])
      content((-0.8, 1), [$1$])
    })
  ]
)

=== Dạng 7: Bài toán tổng hợp Tính diện tích giới hạn

== Câu 20 (Diện tích giới hạn bởi Parabol và hai hình tròn)

#tln(
  [Trên mặt phẳng toạ độ $O x y$, cho hai hình tròn và parabol $(P): y = x^2$ như hình vẽ. Hình tròn nhỏ có tâm $(0; 10)$, hai hình tròn này tiếp xúc với nhau và tiếp xúc với $(P)$. Hãy tính diện tích phần tô màu (làm tròn kết quả đến hàng phần mười).],
  [$38","1$],
  loigiai: [
    #step[Giả sử hình tròn nhỏ là $(C_1)$ có tâm $I_1(0; 10)$ và bán kính $R_1$. Hình tròn lớn là $(C_2)$ có tâm $I_2(0; c_2)$ và bán kính $R_2$.]
    #step[Phương trình của $(C_1): x^2 + (y - 10)^2 = R_1^2$. Thay $x^2 = y$ từ phương trình $(P)$ vào, ta được:
    $y + (y - 10)^2 = R_1^2 <=> y^2 - 19y + 100 - R_1^2 = 0 quad (1)$
    Để $(C_1)$ tiếp xúc $(P)$ thì $(1)$ có nghiệm kép:
    $Delta = (-19)^2 - 4(100 - R_1^2) = 0 <=> 4R_1^2 = 39 <=> R_1 = sqrt(39)/2$.]
    #step[Phương trình của $(C_2): x^2 + (y - c_2)^2 = R_2^2$. Tương tự thay $x^2 = y$:
    $y^2 + (1 - 2c_2)y + c_2^2 - R_2^2 = 0 quad (2)$
    Điều kiện tiếp xúc: $Delta = (1 - 2c_2)^2 - 4(c_2^2 - R_2^2) = 0 <=> c_2 = R_2^2 + 1/4$.]
    #step[Hai đường tròn tiếp xúc ngoài: $I_1 I_2 = R_1 + R_2 => c_2 = 10 + R_1 + R_2$.
    Từ đó: $R_2^2 + 1/4 = 10 + sqrt(39)/2 + R_2 <=> R_2^2 - R_2 - (39 + 2sqrt(39))/4 = 0$.
    Giải phương trình: $R_2 = 1/2 + sqrt(10 + sqrt(39)/2) approx 4","1225$.]
    #step[Tính các thông số tiếp điểm của $(C_2)$:
    $c_2 = R_2^2 + 1/4 approx 17","245$, tung độ tiếp điểm $y_2 = c_2 - 1/2 approx 16","745$, hoành độ $x_2 = sqrt(y_2) approx 4","092$.]
    #step[Phần tô màu là vùng nằm dưới $(C_2)$, nằm trong $(P)$ nhưng nằm ngoài $(C_1)$. Ta có thể tính bằng:
    $ S = integral_(-x_2)^(x_2) (c_2 - sqrt(R_2^2 - x^2) - x^2) dif x - pi R_1^2 $
    $ S approx 68","78 - 9","75 pi approx 38","15 $
    Làm tròn đến hàng phần mười, ta được $38","1$.]
  ],
  fig-pos: "center",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let R1 = 3.1225
      let R2 = 4.1225
      let c2 = 17.245
      
      line((-5, 0), (5, 0), mark: (end: ">"), stroke: (paint: rgb("C62828")))
      content((5, -0.3), [$x$])
      line((0, -1), (0, 23), mark: (end: ">"), stroke: (paint: rgb("C62828")))
      content((0.3, 23), [$y$])
      content((-0.3, -0.4), [$O$])
      circle((0,0), radius: 0.1, fill: black)

      let p-pts = range(-46, 47).map(x => (x/10, (x/10)*(x/10)))
      
      let left-x = -4.092
      let right-x = 4.092
      let fill-p-pts = range(int(left-x*10), int(right-x*10) + 1).map(x => (x/10, (x/10)*(x/10)))
      fill-p-pts.insert(0, (left-x, left-x*left-x))
      fill-p-pts.push((right-x, right-x*right-x))
      
      let big-arc-pts = range(int(right-x*10), int(left-x*10) - 1, step: -1).map(x => {
        let x0 = x/10
        (x0, c2 - calc.sqrt(R2*R2 - x0*x0))
      })
      big-arc-pts.insert(0, (right-x, right-x*right-x))
      big-arc-pts.push((left-x, left-x*left-x))
      
      let fill-pts = fill-p-pts + big-arc-pts
      line(..fill-pts, close: true, fill: rgb(173, 216, 230, 150), stroke: none)
      
      circle((0, 10), radius: R1, fill: white, stroke: none)
      
      line(..p-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
      circle((0, 10), radius: R1, stroke: (paint: blue, thickness: 1pt))
      circle((0, c2), radius: R2, stroke: (paint: blue, thickness: 1pt))
      
      circle((0, 10), radius: 0.1, fill: black)
      content((-0.8, 9.5), [$10$])
      circle((0, c2), radius: 0.1, fill: black)
      circle((right-x, right-x*right-x), radius: 0.1, fill: black)
      
      content((-2.5, 12), [$(P)$])
    })
  ]
)

= Phần III: Sự Tiếp Xúc Phi-Conic (Dự đoán đề thi THPT QG)

Tiếp xúc không chỉ là bài toán của hình học giải tích phẳng (Conic) mà còn là chìa khóa để giải quyết các bài toán Vận dụng cao (VDC) trong các mảng kiến thức trọng tâm của Giải tích và Hình học không gian lớp 12.

=== Dạng 10: Sự tiếp xúc của hai đồ thị (Giải tích 12)

#tn(
  [Cho hai hàm số $f(x) = e^x$ và $g(x) = ln x$. Gọi $M$ và $N$ lần lượt là các điểm di động trên đồ thị của $f(x)$ và $g(x)$. Biết khoảng cách ngắn nhất giữa $M$ và $N$ là $d$. Chọn mệnh đề đúng trong các mệnh đề sau:],
  (
    [$d = sqrt(2)$],
    [$d = sqrt(2)/2$],
    [$d = 1$],
    [$d = e - 1$]
  ),
  loigiai: [
    #step[Hai đồ thị $y = e^x$ và $y = ln x$ là hai hàm ngược của nhau nên chúng đối xứng nhau qua đường phân giác $y = x$.]
    #step[Do tính đối xứng, khoảng cách ngắn nhất giữa $M$ và $N$ đạt được khi $M N$ vuông góc với đường thẳng $y = x$, đồng thời tiếp tuyến của hai đồ thị tại $M$ và $N$ phải *tiếp xúc* và song song với đường phân giác $y = x$.]
    #step[Xét đồ thị $y = e^x$. Ta tìm điểm $M(x_0; y_0)$ sao cho tiếp tuyến tại $M$ song song với $y = x$.]
    #step[Hệ số góc của $y = x$ là $k = 1$. Đạo hàm: $f'(x) = e^x$.]
    #step[Giải phương trình $f'(x_0) = 1 <=> e^(x_0) = 1 <=> x_0 = 0$. Suy ra $y_0 = e^0 = 1$. Vậy $M(0; 1)$.]
    #step[Khoảng cách từ $M(0; 1)$ đến đường thẳng $x - y = 0$ là: $d(M, Delta) = (|0 - 1|)/sqrt(1^2 + (-1)^2) = 1/sqrt(2) = sqrt(2)/2$.]
    #step[Khoảng cách ngắn nhất $M N$ là đoạn thẳng gấp đôi khoảng cách từ $M$ đến trục đối xứng: $d = 2 times sqrt(2)/2 = sqrt(2)$.]
    => *Chọn đáp án A.*
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-2, 0), (4, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -2), (0, 4), mark: (end: ">"), stroke: rgb("C62828"))
      
      // y = e^x
      let exp-pts = range(-20, 15).map(x => (x/10, calc.exp(x/10)))
      line(..exp-pts, stroke: (paint: blue, thickness: 1pt))
      
      // y = ln x
      let ln-pts = range(1, 40).map(x => (x/10, calc.ln(x/10)))
      line(..ln-pts, stroke: (paint: green, thickness: 1pt))
      
      // y = x
      line((-2, -2), (4, 4), stroke: (paint: gray, dash: "dashed"))
      
      // Điểm M(0,1) và N(1,0)
      circle((0, 1), radius: 0.1, fill: black)
      circle((1, 0), radius: 0.1, fill: black)
      line((0, 1), (1, 0), stroke: (paint: red, dash: "dotted", thickness: 1pt))
      
      content((-0.5, 1.2), [$M$])
      content((1.2, -0.5), [$N$])
    })
  ]
)

=== Dạng 11: Sự tiếp xúc của Mặt cầu (Hình học Oxyz)

#ds(
  [Trong không gian $O x y z$, cho mặt phẳng $(P): z = 0$ và mặt cầu cố định $(S)$ có tâm $I(0; 0; 4)$ và bán kính $R = 2$. Gọi $(S')$ là mặt cầu di động luôn tiếp xúc ngoài với $(S)$ và đồng thời tiếp xúc với mặt phẳng $(P)$. Khẳng định nào sau đây về quỹ tích tâm $I'$ của mặt cầu $(S')$ là đúng hay sai?],
  (
    [Tâm $I'$ luôn di động trên một mặt nón tròn xoay.],
    True([Nếu gọi tọa độ $I'$ là $(x; y; z)$, bán kính của $(S')$ chính là $z$.]),
    True([Tập hợp các điểm $I'$ là một mặt Paraboloid tròn xoay có phương trình $x^2 + y^2 = 12z - 12$.]),
    [Mặt cầu $(S')$ luôn chứa một điểm cố định trên trục $O z$.]
  ),
  loigiai: [
    #step[*Ý a)* Sai. Quỹ tích tâm $I'$ là một mặt Paraboloid (mặt chảo parabol), không phải mặt nón.]
    #step[*Ý b)* Đúng. Mặt cầu $(S')$ tiếp xúc với mặt phẳng $(P): z=0$. Do tâm $I'(x; y; z)$ nằm trên mặt phẳng nên bán kính của $(S')$ là khoảng cách từ $I'$ đến $(P)$: $r = |z|$. Vì $(S)$ nằm hoàn toàn trên mặt phẳng $(P)$ nên $(S')$ cũng phải nằm trên, do đó $z > 0 => r = z$.]
    #step[*Ý c)* Đúng. Mặt cầu $(S')$ tiếp xúc ngoài với $(S)$ nên khoảng cách giữa hai tâm $I I'$ bằng tổng hai bán kính: 
    $I I' = R + r = 2 + z$.]
    #step[Khoảng cách $I I' = sqrt((x - 0)^2 + (y - 0)^2 + (z - 4)^2) = sqrt(x^2 + y^2 + (z - 4)^2)$.]
    #step[Bình phương hai vế: $x^2 + y^2 + z^2 - 8z + 16 = (z + 2)^2$
    $<=> x^2 + y^2 + z^2 - 8z + 16 = z^2 + 4z + 4 <=> x^2 + y^2 = 12z - 12$. Đây chính là phương trình mặt Paraboloid tròn xoay.]
    #step[*Ý d)* Sai. Mặt cầu $(S')$ thay đổi với bán kính có thể tùy ý tiến đến 0 hoặc $+oo$ dọc theo quỹ tích Paraboloid, không có điểm cố định nào được đảm bảo ngoài mặt phẳng tiếp xúc.]
    => *Cập nhật đáp án:* (a) Sai, (b) Đúng, (c) Đúng, (d) Sai.
  ]
)

=== Dạng 12: Sự tiếp xúc giữa Nón và Cầu (Khối tròn xoay)

#tln(
  [Cho mặt cầu $(S)$ tâm $O$, bán kính $R = 3$. Một khối nón $(N)$ có đỉnh $S$ ngoại tiếp mặt cầu $(S)$ (tức là đáy và mặt xung quanh của nón đều tiếp xúc với mặt cầu). Tính thể tích nhỏ nhất của khối nón $(N)$ bằng bao nhiêu lần $pi$?],
  [$72$],
  loigiai: [
    #step[Cắt hình nón qua trục, ta được thiết diện là tam giác cân $S A B$ ngoại tiếp đường tròn lớn của mặt cầu tâm $O$ bán kính $R=3$. Gọi $I$ là trung điểm của $A B$, ta có $S I$ là đường cao của nón $(h = S I > 2R = 6)$.]
    #step[Mặt bên của nón tiếp xúc với mặt cầu tại điểm $H$ nằm trên cạnh $S A$. Bán kính đáy của nón là $r = I A$. Xét hai tam giác vuông đồng dạng $S H O$ và $S I A$:]
    #step[$(S O)/(S A) = (H O)/(I A) => (h - R)/sqrt(h^2 + r^2) = R/r <=> ((h-3)^2)/(h^2 + r^2) = 9/r^2$.]
    #step[Nhân chéo: $r^2 (h^2 - 6h + 9) = 9h^2 + 9r^2 <=> r^2(h^2 - 6h) = 9h^2 <=> r^2 = (9h)/(h - 6)$.]
    #step[Thể tích khối nón: $V = 1/3 pi r^2 h = 1/3 pi * (9h)/(h - 6) * h = 3pi * (h^2)/(h - 6)$.]
    #step[Xét hàm số $f(h) = h^2/(h - 6)$ trên khoảng $(6, +oo)$. Đạo hàm $f'(h) = (2h(h-6) - h^2)/((h-6)^2) = (h^2 - 12h)/((h-6)^2)$.]
    #step[Cho $f'(h) = 0 <=> h^2 - 12h = 0 <=> h = 12$ (thỏa mãn). Bảng biến thiên cho thấy hàm đạt cực tiểu tại $h = 12$.]
    #step[Giá trị thể tích cực tiểu: $V_{min} = 3pi * (12^2)/(12 - 6) = 3pi * 144 / 6 = 72 pi$. Vậy đáp án là $72$.]
  ]
)
#pagebreak()
=== Dạng 13: Sự tiếp xúc "trơn" trong thiết kế Trang sức (Ứng dụng Tích phân)

#tln(
  [Một nghệ nhân chế tác một mặt dây chuyền bằng pha lê. Thiết kế cắt dọc của mặt dây chuyền là một hình phẳng $(H)$ giới hạn bởi trục hoành, đường thẳng $x = 0$, đường thẳng $x = 3$ và một đường cong $(C)$. Biết rằng đường cong $(C)$ được ghép từ hai phần: 
  - Nửa trước (từ $x = 0$ đến $x = 1$) là một cung của đường tròn $x^2 + y^2 = 5$.
  - Nửa sau (từ $x = 1$ đến $x = 3$) là một cung Parabol $(P): y = a x^2 + b x + c$ đi qua điểm $(3; 0)$.
  Để mặt dây chuyền không bị gãy khúc, hai đường cong này được ghép nối "trơn mượt" (tức là tiếp xúc với nhau) tại điểm $M(1; 2)$. Khi quay hình phẳng $(H)$ quanh trục $O x$, ta thu được khối pha lê tròn xoay. Biết thể tích của khối pha lê này là $V$. Tính giá trị của $V/pi$ (làm tròn đến hàng phần mười).],
  [$8","1$],
  loigiai: [
    #step[Trên $[0; 1]$: $y_1 = sqrt(5 - x^2) => y'_1 = (-x)/sqrt(5 - x^2)$. Tại $x = 1: y_1 = 2, y'_1 = -1/2$.]
    #step[Trên $[1; 3]$: Parabol $y_2 = a x^2 + b x + c => y'_2 = 2a x + b$.]
    #step[Tiếp xúc trơn tại $M(1; 2)$ và đi qua $(3; 0)$:
    $ cases(y_2(1) = 2, y'_2(1) = -1/2, y_2(3) = 0) <=> cases(a + b + c = 2, 2a + b = -1/2, 9a + 3b + c = 0) <=> cases(a = -1/4, b = 0, c = 9/4) $]
    #step[Vậy $(P): y_2 = -1/4 x^2 + 9/4$.]
    #step[Tính tích phân thể tích:
    $ V = pi integral_0^1 (5 - x^2) d x + pi integral_1^3 (-1/4 x^2 + 9/4)^2 d x = 14/3 pi + 17/5 pi = 121/15 pi $]
    #step[Tính xấp xỉ: $V/pi = 121/15 approx 8,067 approx 8,1$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-1, 0), (4, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -3.5), (0, 3.5), mark: (end: ">"), stroke: rgb("C62828"))
      
      // Vẽ nửa trên
      let c_pts_top = range(0, 11).map(x => (x/10, calc.sqrt(5 - (x/10)*(x/10))))
      let p_pts_top = range(10, 31).map(x => (x/10, -0.25 * (x/10)*(x/10) + 2.25))
      line(..c_pts_top, stroke: (paint: blue, thickness: 1.5pt))
      line(..p_pts_top, stroke: (paint: green.darken(20%), thickness: 1.5pt))
      
      // Vẽ nửa dưới (tạo hiệu ứng 3D khối tròn xoay)
      let c_pts_bot = range(0, 11).map(x => (x/10, -calc.sqrt(5 - (x/10)*(x/10))))
      let p_pts_bot = range(10, 31).map(x => (x/10, -(-0.25 * (x/10)*(x/10) + 2.25)))
      line(..c_pts_bot, stroke: (paint: blue.lighten(50%), thickness: 1pt))
      line(..p_pts_bot, stroke: (paint: green.lighten(50%), thickness: 1pt))
      
      // Các vòng elip cắt ngang - Chuẩn nét đứt / nét liền
      // Tại x = 1 (rx = 0.4, ry = 2)
      arc((1.4, 0), start: 0deg, stop: 180deg, radius: (0.4, 2), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      arc((0.6, 0), start: 180deg, stop: 360deg, radius: (0.4, 2), stroke: (paint: gray, thickness: 0.5pt))
      
      // Tại x = 0 (rx = 0.4, ry = 2.236)
      arc((0.4, 0), start: 0deg, stop: 180deg, radius: (0.4, 2.236), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      arc((-0.4, 0), start: 180deg, stop: 360deg, radius: (0.4, 2.236), stroke: (paint: gray, thickness: 0.5pt))
      
      // Tại x = 2 (rx = 0.3, ry = 1.25)
      arc((2.3, 0), start: 0deg, stop: 180deg, radius: (0.3, 1.25), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      arc((1.7, 0), start: 180deg, stop: 360deg, radius: (0.3, 1.25), stroke: (paint: gray, thickness: 0.5pt))
      
      // Điểm nối M(1, 2)
      circle((1, 2), radius: 0.1, fill: black)
      content((1.2, 2.3), [$M$])
      line((1, 0), (1, 2), stroke: (paint: gray, dash: "dashed"))
      content((1.3, -0.4), [$1$])
      content((3, -0.4), [$3$])
      
      // Tiếp tuyến chung
      line((0, 2.5), (3, 1), stroke: (paint: orange, dash: "dotted", thickness: 1pt))
    })
  ]
)

=== Dạng 14: Mô hình 3D Bình gốm (Tiếp xúc 2 Parabol)

#tln(
  [Một nghệ nhân gốm tạo ra một chiếc bình có mặt cắt dọc là hình phẳng giới hạn bởi trục hoành và hai cung Parabol $(P_1), (P_2)$. Phần miệng và thân trên của bình (từ $x=0$ đến $x=1$) là cung của $(P_1): y = -x^2 + 4x$. Phần thân dưới và đáy bình (từ $x=1$ đến $x=3$) là cung của $(P_2): y = a x^2 + b x + c$. 
  Để chiếc bình có đường cong hoàn mỹ, hai cung này được ghép nối "trơn mượt" (tiếp xúc nhau) tại điểm có hoành độ $x=1$. Biết đáy bình nằm tại $x=3$ là một điểm nhọn (tức là $(P_2)$ đi qua điểm $(3; 0)$). Tính giá trị của biểu thức $S = 4a + 2b - 4c$.],
  [$7$],
  loigiai: [
    #step[Hàm $(P_1): y_1 = -x^2 + 4x => y'_1 = -2x + 4$. Tại điểm tiếp xúc $x=1$: $y_1(1) = 3, y'_1(1) = 2$.]
    #step[Hàm $(P_2): y_2 = a x^2 + b x + c => y'_2 = 2a x + b$. Điều kiện ghép trơn tại $x=1$ và đáy $(3; 0)$:
    $ cases(y_2(1) = 3, y'_2(1) = 2, y_2(3) = 0) <=> cases(a + b + c = 3, 2a + b = 2, 9a + 3b + c = 0) <=> cases(a = -7/4, b = 11/2, c = -3/4) $]
    #step[Tính giá trị $S = 4(-7/4) + 2(11/2) - 4(-3/4) = -7 + 11 + 3 = 7$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Xoay trục đứng cho giống bình gốm thực tế
      line((0, 1), (0, -4), mark: (end: ">"), stroke: (paint: gray, dash: "dashed"))
      
      // Hàm vẽ 3D các vòng elip chuẩn nét đứt liền
      let draw_ellipse(y_coord, r, color) = {
        let ry = 0.3 * r
        arc((r, -y_coord), start: 0deg, stop: 180deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((-r, -y_coord), start: 180deg, stop: 360deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // (P1): x từ 0 đến 1
      let p1_pts = range(0, 11).map(x => { let h = x/10; return (-h*h + 4*h, -h) })
      let p1_pts_neg = range(0, 11).map(x => { let h = x/10; return (-(-h*h + 4*h), -h) })
      
      // (P2): x từ 1 đến 3
      let p2_pts = range(10, 31).map(x => { let h = x/10; return (-1.75 * h*h + 5.5 * h - 0.75, -h) })
      let p2_pts_neg = range(10, 31).map(x => { let h = x/10; return (-(-1.75 * h*h + 5.5 * h - 0.75), -h) })
      
      // Vẽ viền bình gốm
      line(..p1_pts, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p1_pts_neg, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p2_pts, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      line(..p2_pts_neg, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      
      // Vẽ các vòng elip
      draw_ellipse(0.5, 1.75, rgb("D7CCC8"))
      draw_ellipse(1, 3, rgb("8D6E63"))
      draw_ellipse(2, 3.25, rgb("D7CCC8"))
      
      content((3.5, -1), [$M(1; 3)$])
      circle((3, -1), radius: 0.1, fill: black)
      circle((-3, -1), radius: 0.1, fill: black)
    })
  ]
)

=== Dạng 15: Bể cá cảnh Nón cụt tiếp xúc Cầu (Hình học 3D)

#tln(
  [Trong một bể cá thủy tinh có dạng khối nón cụt, người ta đặt một quả cầu trang trí sao cho quả cầu vừa khít với bề mặt bể (tiếp xúc với cả mặt đáy lớn, đáy nhỏ và mặt xung quanh của khối nón cụt). Biết bán kính của quả cầu là $R = 2$ (dm), bán kính đáy nhỏ của nón cụt là $r_1 = 1$ (dm). Tính thể tích của bể cá (khối nón cụt) đó (đơn vị $upright("dm")^3$, _làm tròn kết quả đến hàng đơn vị_).],
  [$88$],
  loigiai: [
    #step[Mặt cắt qua trục là hình thang cân ngoại tiếp đường tròn tâm $O$ bán kính $R = 2$. Đáy nhỏ $2 r_1 = 2$, đáy lớn $2 r_2$, chiều cao $h = 2R = 4$.]
    #step[Tứ giác ngoại tiếp đường tròn nên tổng 2 cạnh đối bằng nhau: $ 2 l = 2r_1 + 2r_2 => l = r_1 + r_2 $]
    #step[Áp dụng Pytago cho tam giác vuông hạ từ đáy nhỏ xuống đáy lớn: 
    $ l^2 = h^2 + (r_2 - r_1)^2 => (r_1 + r_2)^2 = 4^2 + (r_2 - r_1)^2 <=> 4r_1 r_2 = 16 <=> r_1 r_2 = 4 $]
    #step[Do $r_1 = 1$ nên $r_2 = 4$. Thể tích khối nón cụt:
    $ V = 1/3 pi h (r_1^2 + r_2^2 + r_1 r_2) = 1/3 pi dot 4 (1 + 16 + 4) = 28 pi approx 87,96. $]
    #step[Làm tròn đến hàng phần mười ta được $88$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Quả cầu bên trong
      cetz.draw.circle((0, 0), radius: 2, stroke: (paint: rgb("FFB300"), thickness: 1.5pt), fill: rgb("FFB300").lighten(80%))
      // Xích đạo quả cầu
      arc((2, 0), start: 0deg, stop: 180deg, radius: (2, 0.6), stroke: (paint: rgb("FFB300"), thickness: 1pt, dash: "dashed"))
      arc((-2, 0), start: 180deg, stop: 360deg, radius: (2, 0.6), stroke: (paint: rgb("FFB300"), thickness: 1pt))
      // Đáy lớn
      arc((4, -2), start: 0deg, stop: 180deg, radius: (4, 1.2), stroke: (paint: blue, thickness: 1.5pt, dash: "dashed"))
      arc((-4, -2), start: 180deg, stop: 360deg, radius: (4, 1.2), stroke: (paint: blue, thickness: 1.5pt))
      // Đáy nhỏ
      arc((1, 2), start: 0deg, stop: 180deg, radius: (1, 0.3), stroke: (paint: blue, thickness: 1.5pt))
      arc((-1, 2), start: 180deg, stop: 360deg, radius: (1, 0.3), stroke: (paint: blue, thickness: 1.5pt))
      // Cạnh bên
      line((-1, 2), (-4, -2), stroke: (paint: blue, thickness: 1.5pt))
      line((1, 2), (4, -2), stroke: (paint: blue, thickness: 1.5pt))
      
      
      
      // Trục
      line((0, 2.5), (0, -2.5), stroke: (paint: gray, dash: "dashed"))
      circle((0, 0), radius: 0.1, fill: black)
      content((0.4, 0.3), [$O$])
    })
  ]
)

=== Dạng 16: Sự tiếp xúc góc tường của hai Mặt cầu (Hình học Oxyz)

#tln(
  [Trong một góc căn phòng (tương ứng với gốc tọa độ $O$ và ba bức tường là các mặt phẳng tọa độ $O x y, O y z, O z x$), người ta đặt hai quả bóng hình cầu. Quả bóng nhỏ $(S_1)$ có tâm $I(1; 1; 1)$ và tiếp xúc với cả ba bức tường. Quả bóng lớn $(S_2)$ tâm $J$ cũng tiếp xúc với cả ba bức tường và đồng thời tiếp xúc ngoài với $(S_1)$. Tính bán kính của quả bóng lớn $(S_2)$ (làm tròn kết quả đến 1 chữ số thập phân).],
  [$3","7$],
  loigiai: [
    #step[Mặt cầu $(S_1)$ tâm $I(1; 1; 1)$ tiếp xúc 3 mặt toạ độ nên bán kính $R_1 = 1$.]
    #step[Mặt cầu $(S_2)$ tâm $J$ tiếp xúc 3 mặt toạ độ tại góc phần tám thứ nhất nên $J(R; R; R)$ với bán kính $R > 1$.]
    #step[Khoảng cách hai tâm: $I J = sqrt((R-1)^2 + (R-1)^2 + (R-1)^2) = sqrt(3)(R - 1)$.]
    #step[Hai quả bóng tiếp xúc ngoài: $I J = R_1 + R <=> sqrt(3)(R - 1) = 1 + R <=> R(sqrt(3) - 1) = sqrt(3) + 1$.]
    #step[Suy ra $R = (sqrt(3) + 1)/(sqrt(3) - 1) = 2 + sqrt(3) approx 3,732$. Làm tròn 1 chữ số thập phân là $3,7$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Trục Oxyz 3D isometric
      line((0, 0), (-2, -1.5), mark: (end: ">"), stroke: gray, name: "x")
      line((0, 0), (3, 0), mark: (end: ">"), stroke: gray, name: "y")
      line((0, 0), (0, 3.5), mark: (end: ">"), stroke: gray, name: "z")
      content((-2.2, -1.5), [$x$])
      content((3.2, 0), [$y$])
      content((0, 3.7), [$z$])
      content((-0.2, -0.3), [$O$])
      
      // Bóng nhỏ
      cetz.draw.circle((-0.3, 0.4), radius: 0.4, stroke: rgb("2196F3"), fill: rgb("2196F3").lighten(70%))
      arc((-0.3+0.4, 0.4), start: 0deg, stop: 180deg, radius: (0.4, 0.12), stroke: (paint: rgb("2196F3"), dash: "dashed"))
      arc((-0.3-0.4, 0.4), start: 180deg, stop: 360deg, radius: (0.4, 0.12), stroke: rgb("2196F3"))
      circle((-0.3, 0.4), radius: 0.05, fill: black)
      content((-0.3, 0.7), [$I$])
      
      // Bóng lớn
      cetz.draw.circle((0.7, 1.8), radius: 1.2, stroke: rgb("F44336"), fill: rgb("F44336").lighten(70%))
      arc((0.7+1.2, 1.8), start: 0deg, stop: 180deg, radius: (1.2, 0.36), stroke: (paint: rgb("F44336"), dash: "dashed"))
      arc((0.7-1.2, 1.8), start: 180deg, stop: 360deg, radius: (1.2, 0.36), stroke: rgb("F44336"))
      circle((0.7, 1.8), radius: 0.05, fill: black)
      content((0.7, 2.1), [$J$])
      
      // Đường nối tâm
      line((-0.3, 0.4), (0.7, 1.8), stroke: (paint: black, dash: "dashed"))
    })
  ]
)

=== Dạng 17: Khối Trụ lọt thỏm trong Khối Nón (Max-Min Thể tích)

#tln(
  [Một khối nón thủy tinh có bán kính đáy $R=3$, chiều cao $h=4$. Người ta muốn đặt một khối trụ vào bên trong khối nón đó sao cho đáy dưới của khối trụ nằm khít trên mặt đáy của khối nón, và đường tròn viền của mặt đáy trên khối trụ tiếp xúc với mặt xung quanh của khối nón. Tìm thể tích lớn nhất có thể đạt được của khối trụ này (làm tròn kết quả đến 1 chữ số thập phân).],
  [$16","8$],
  loigiai: [
    #step[Gọi $r$ và $x$ lần lượt là bán kính đáy và chiều cao trụ ($0 < r < 3, 0 < x < 4$).]
    #step[Theo định lý Talet trong tam giác mặt cắt: $x/h = (R - r)/R <=> x/4 = (3 - r)/3 => x = 4/3(3 - r)$.]
    #step[Thể tích khối trụ: $V(r) = pi r^2 x = 4/3 pi (3r^2 - r^3)$.]
    #step[Khảo sát hàm $f(r) = 3r^2 - r^3$: $f'(r) = 6r - 3r^2 = 0 => r = 2$.]
    #step[Thể tích cực đại: $V_max = 4/3 pi (3*4 - 8) = 16/3 pi approx 16,755$. Làm tròn 1 chữ số thập phân là $16,8$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Nón
      arc((3, -2), start: 0deg, stop: 180deg, radius: (3, 0.8), stroke: (paint: gray, dash: "dashed"))
      arc((-3, -2), start: 180deg, stop: 360deg, radius: (3, 0.8), stroke: gray)
      line((-3, -2), (0, 3), stroke: gray)
      line((3, -2), (0, 3), stroke: gray)
      
      // Trụ (r=2, h=4/3) -> tọa độ y từ -2 đến -0.667
      // Đáy dưới trụ
      arc((2.125, -2), start: 0deg, stop: 180deg, radius: (2.125, 0.533), stroke: (paint: green, dash: "dashed"))
      arc((-2.125, -2), start: 180deg, stop: 360deg, radius: (2.125, 0.533), stroke: green)
      
      // Đáy trên trụ
      arc((2.125, -0.667), start: 0deg, stop: 180deg, radius: (2.125, 0.533), stroke: (paint: green, dash: "dashed"))
      arc((-2.125, -0.667), start: 180deg, stop: 360deg, radius: (2.125, 0.533), stroke: green)
      
      // Cạnh bên trụ
      line((-2.125, -2), (-2.125, -0.667), stroke: green)
      line((2.125, -2), (2.125, -0.667), stroke: green)
      
      // Trục
      line((0, -2.125), (0, 3.5), stroke: (paint: gray, dash: "dashed"))
    })
  ]
)

=== Dạng 18: Chế tác Mặt dây chuyền "Trái Tim Vàng" (Tích phân & Thực tế)

#tln(
  [Một thương hiệu trang sức chế tác một mặt dây chuyền vàng khối 18K mang hình dáng một trái tim 3D. Trên mặt phẳng tọa độ, thiết diện cắt ngang của trái tim là một hình phẳng đối xứng qua trục $O y$. Nửa bên phải trục $O y$ (ứng với $x >= 0$) được giới hạn bởi hai đường cong: nửa trên (khi $y >= 0$) là cung của đường Elip $(E): x = 2sqrt(1 - y^2)$; nửa dưới (khi $y < 0$) là cung Parabol $(P): x = a y^2 + b y + c$. 
  Biết $(P)$ ghép nối trơn mượt với $(E)$ tại điểm $M(2; 0)$ và kết thúc tại điểm "chóp tim" $N(0; -2)$. Khi quay thiết diện này quanh trục $O y$, ta thu được mặt dây chuyền tròn xoay.
  Quy ước $1$ đơn vị tọa độ ứng với $0,5$ cm. Khối lượng riêng của vàng 18K là $15,6$ g/$upright("cm")^3$. Giá vàng và tiền công chế tác trọn gói là $1,5$ triệu VNĐ/gam. Tính số tiền (triệu VNĐ) để đúc mặt dây chuyền này (làm tròn kết quả đến hàng đơn vị).],
  [$64$],
  loigiai: [
    #step[Tại $y=0$, điểm nối $M(2; 0)$. Hàm số $ (E): x_1(y) = 2sqrt(1 - y^2) => x'_1(y) = (-2y)/sqrt(1-y^2) => x'_1(0) = 0 $]
    #step[Hàm $(P): x_2(y) = a y^2 + b y + c => x'_2(y) = 2a y + b$. Điều kiện ghép trơn tại $M$ và qua $N(0; -2)$:
    $ cases(x_2(0) = 2, x'_2(0) = 0, x_2(-2) = 0) <=> cases(c = 2, b = 0, 4a - 2b + c = 0) <=> cases(a = -1/2, b = 0, c = 2) $]
    #step[Phương trình Parabol là $x_2(y) = 2 - y^2/2$. Thể tích khối tròn xoay (theo đơn vị tọa độ) khi quay quanh $O y$:
    $ V_0 = pi integral_0^1 x_1^2 d y + pi integral_(-2)^0 x_2^2 d y = pi integral_0^1 4(1 - y^2) d y + pi integral_(-2)^0 (2 - y^2/2)^2 d y $]
    #step[$ V_0 = 4pi(y - y^3/3) |_0^1 + pi(4y - (2y^3)/3 + y^5/20) |_(-2)^0 = 8/3 pi + pi(0 - (-8 + 16/3 - 32/20)) = 8/3 pi + 64/15 pi = 104/15 pi. $]
    #step[Với $1$ đv = $0,5$ cm, thể tích thực là $V = V_0 * (0,5)^3 = V_0 / 8 = 13/15 pi$ ($upright("cm")^3$).]
    #step[Khối lượng mặt dây chuyền: $m = D * V = 15,6 * (13/15 pi) = 13,52 pi$ (gam).]
    #step[Số tiền cần để đúc là: $T = 13,52 pi * 1,5 = 20,28 pi approx 63,711$ (triệu VNĐ). Làm tròn ta được $64$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Trục toạ độ
      line((-3.5, 0), (3.5, 0), mark: (end: ">"), stroke: gray, name: "x")
      line((0, -2.5), (0, 1.5), mark: (end: ">"), stroke: gray, name: "y")
      content((3.2, 0.3), [$x$])
      content((0.3, 1.3), [$y$])
      
      // Hàm vẽ elip 3D xoay quanh trục Y
      let draw_ellipse_y(y_coord, r, color) = {
        let ry = 0.25 * r
        arc((r, y_coord), start: 0deg, stop: 180deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((-r, y_coord), start: 180deg, stop: 360deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // Viền Elip (y > 0)
      let e_pts_r = range(0, 11).map(y => { let hy = y/10; return (2*calc.sqrt(1 - hy*hy), hy) })
      let e_pts_l = range(0, 11).map(y => { let hy = y/10; return (-2*calc.sqrt(1 - hy*hy), hy) })
      line(..e_pts_r, stroke: (paint: rgb("FFC107"), thickness: 2pt))
      line(..e_pts_l, stroke: (paint: rgb("FFC107"), thickness: 2pt))
      
      // Viền Parabol (y < 0)
      let p_pts_r = range(-20, 1).map(y => { let hy = y/10; return (2 - hy*hy/2, hy) })
      let p_pts_l = range(-20, 1).map(y => { let hy = y/10; return (-(2 - hy*hy/2), hy) })
      line(..p_pts_r, stroke: (paint: rgb("FFB300"), thickness: 2pt))
      line(..p_pts_l, stroke: (paint: rgb("FFB300"), thickness: 2pt))
      
      // Các elip cắt ngang tạo hình khối 3D Trái tim vàng
      draw_ellipse_y(0.5, 2*calc.sqrt(1 - 0.25), rgb("FFECB3")) // y=0.5
      draw_ellipse_y(0, 2, rgb("FF8F00")) // y=0
      draw_ellipse_y(-1, 1.5, rgb("FFECB3")) // y=-1
      
      content((2.4, 0.3), [$M(2; 0)$])
      circle((2, 0), radius: 0.08, fill: black)
      circle((-2, 0), radius: 0.08, fill: black)
      content((0.4, -2.2), [$N$])
    })
  ]
)

=== Dạng 19: Chế tác Nhẫn cưới "Comfort Fit" (Hình xuyến lủng lỗ)

#tln(
  [Nhẫn "Comfort Fit" là kiểu nhẫn bo tròn mặt ngoài và làm phẳng mặt trong để khi đeo không bị cấn ngón tay. Mặt cắt ngang của một chiếc nhẫn vàng 24K là hình phẳng giới hạn bởi đường thẳng $y = 9$ (tương ứng với lổ xỏ ngón tay bán kính 9 mm) và một nửa đường tròn có phương trình $y = 9 + sqrt(4 - x^2)$ (với $x in [-2; 2]$). 
  Khi quay hình phẳng này quanh trục $O x$, ta thu được khối chiếc nhẫn. Đơn vị trên hệ trục tọa độ là milimét (mm). Biết khối lượng riêng của vàng 24K là $19,3$ g/$upright("cm")^3$ và $1$ chỉ vàng tương đương $3,75$ gam. Hỏi chiếc nhẫn này có khối lượng bao nhiêu chỉ vàng? (Làm tròn kết quả đến 1 chữ số thập phân).],
  [$2","0$],
  loigiai: [
    #step[Thể tích của chiếc nhẫn là thể tích khối tròn xoay rỗng, được tính theo công thức:
    $ V = pi integral_(-2)^2 [ (9 + sqrt(4 - x^2))^2 - 9^2 ] d x = pi integral_(-2)^2 ( 18sqrt(4 - x^2) + 4 - x^2 ) d x $]
    #step[Tách làm hai phần tích phân: $I_1 = integral_(-2)^2 (4 - x^2) d x$ và $I_2 = integral_(-2)^2 18sqrt(4 - x^2) d x$.]
    #step[$I_1 = (4x - x^3/3) |_(-2)^2 = (8 - 8/3) - (-8 + 8/3) = 32/3$.]
    #step[$I_2$ chứa tích phân của nửa đường tròn tâm $O$ bán kính $R=2$, nên diện tích là $1/2 pi(2)^2 = 2pi$. Suy ra $I_2 = 18 * 2pi = 36pi$.]
    #step[Thể tích nhẫn: $V = pi (32/3 + 36pi) = 32/3 pi + 36pi^2 approx 388,816$ ($upright("mm")^3$).]
    #step[Đổi sang $upright("cm")^3$: $V approx 0,3888$ $upright("cm")^3$. Khối lượng vàng: $m = D * V = 19,3 * 0,3888 = 7,504$ (gam).]
    #step[Đổi sang đơn vị chỉ vàng: Số chỉ $= 7,504 / 3,75 approx 2,001$. Làm tròn 1 chữ số thập phân, ta được $2,0$.]
  ],
  fig-pos: "center",
  fig-width: 25%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      let draw_ellipse_x(x_coord, r, color, dashed_back: true) = {
        let rx = 0.3 * r
        if dashed_back {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        } else {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
        }
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 1.5pt))
      }
      
      // Trục trung tâm ngón tay
      line((-5, 0), (5, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      content((4.8, 0.8), [$x$])
      
      // Viền nhẫn ngoài 
      let out_top = range(-20, 21).map(x => { let h = x/10; return (h, 9 + calc.sqrt(4 - h*h)) })
      let out_bot = range(-20, 21).map(x => { let h = x/10; return (h, -(9 + calc.sqrt(4 - h*h))) })
      line(..out_top, stroke: (paint: rgb("FF8F00"), thickness: 2pt))
      line(..out_bot, stroke: (paint: rgb("FF8F00"), thickness: 2pt))
      
      // Lổ nhẫn (cylinder bên trong)
      line((-2, 9), (2, 9), stroke: (paint: rgb("FBC02D"), thickness: 1.5pt))
      line((-2, -9), (2, -9), stroke: (paint: rgb("FBC02D"), thickness: 1.5pt, dash: "dashed"))
      
      // Các elip 3D
      // Mặt cắt bên trái (x = -2)
      draw_ellipse_x(-2, 9, rgb("F57F17"), dashed_back: true)
      // Khúc phình to nhất (x = 0)
      draw_ellipse_x(0, 11, rgb("FFE082"), dashed_back: true)
      // Mặt cắt bên phải (x = 2) - Nét liền toàn bộ để lộ rõ lổ nhẫn
      draw_ellipse_x(2, 9, rgb("F57F17"), dashed_back: false)
      
      content((0, 12.5), [Khối nhẫn Vàng 3D])
    })
  ]
)

=== Dạng 20: Mái vòm nhà kính (Mô hình Paraboloid và Bán cầu)

#tln(
  [Một công trình nhà kính sinh thái có dạng khối tròn xoay. Phần mái vòm phía trên là một chỏm cầu bán kính $R=5$ m. Phần thân bên dưới là một mặt Paraboloid (tạo bởi Parabol quay quanh trục đối xứng thẳng đứng). Đáy của nhà kính nằm trên mặt đất là một hình tròn bán kính $r=7$ m. Biết phần mái cầu và phần thân Paraboloid được ghép nối "trơn mượt" với nhau (có tiếp tuyến chung) tại các điểm cách trục đối xứng của nhà kính $3$ m. Tính tổng chiều cao của công trình nhà kính này (đơn vị: mét).],
  [$6$],
  loigiai: [
    #step[Chọn hệ trục tọa độ với $O y$ là trục đối xứng, tâm mặt cầu tại $(0; y_c)$. Phương trình nửa đường tròn mái vòm là $(C): y = y_c + sqrt(25 - x^2)$.]
    #step[Tại điểm ghép $x = 3$, đạo hàm của đường tròn là $y'_C = (-x)/sqrt(25-x^2) = -3/sqrt(25-9) = -3/4$. Tọa độ điểm ghép là $(3; y_c + 4)$.]
    #step[Thân là Parabol $(P): y = a x^2 + c => y'_P = 2a x$. Điều kiện tiếp xúc trơn tại $x = 3$ là $y'_P (3) = y'_C (3) <=> 6a = -3/4 <=> a = -1/8$.]
    #step[Hai đồ thị khớp nhau tại $x = 3 => a(3^2) + c = y_c + 4 <=> -9/8 + c = y_c + 4 <=> c - y_c = 41/8$.]
    #step[Mặt đất có bán kính $x = 7$, tọa độ $y$ tương ứng là $y_"base" = a(7^2) + c = -49/8 + c$. Đỉnh mái vòm tại $x = 0$ có tọa độ $y_"top" = y_c + 5$.]
    #step[Chiều cao công trình: $H = y_"top" - y_"base" = (y_c + 5) - (-49/8 + c) = 5 + 49/8 - (c - y_c) = 89/8 - 41/8 = 48/8 = 6$ (m).]
  ],
  fig-pos: "center",
  fig-width: 55%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Mặt đất
      line((-8, -1), (8, -1), stroke: (paint: gray, thickness: 1.5pt))
      
      // Paraboloid
      let p_pts = range(-70, 71).map(x => { let h = x/10; return (h, -0.125 * h * h + 5.125) })
      line(..p_pts, stroke: (paint: green, thickness: 1.5pt))
      
      // Chỏm cầu
      let c_pts = range(-30, 31).map(x => { let h = x/10; return (h, calc.sqrt(25 - h*h)) })
      line(..c_pts, stroke: (paint: blue, thickness: 1.5pt))
      
      // Các nét đứt hiển thị khối 3D
      arc((7, -1), start: 0deg, stop: 180deg, radius: (7, 1.5), stroke: (paint: gray, dash: "dashed"))
      arc((-7, -1), start: 180deg, stop: 360deg, radius: (7, 1.5), stroke: gray)
      
      arc((3, 4), start: 0deg, stop: 180deg, radius: (3, 0.6), stroke: (paint: gray, dash: "dashed"))
      arc((-3, 4), start: 180deg, stop: 360deg, radius: (3, 0.6), stroke: gray)
      
      // Điểm ghép
      circle((3, 4), radius: 0.1, fill: black)
      circle((-3, 4), radius: 0.1, fill: black)
      
      // Trục
      line((0, -1.5), (0, 6), stroke: (paint: gray, dash: "dashed"))
    })
  ]
)

=== Dạng 21: Con quay đồ chơi bằng gỗ (Tích phân ghép trơn trục Ox)

#tln(
  [Một con quay đồ chơi bằng gỗ có hình dạng là một khối tròn xoay được tạo thành khi quay mặt cắt dọc của nó quanh trục $O x$. Nửa trên của mặt cắt (phần thân phình to) là hình phẳng giới hạn bởi trục $O x$ và một cung Parabol $(P): y = a x^2 + b x + c$ (từ $x = 0$ đến $x = 2$). Nửa dưới của mặt cắt (phần mũi nhọn) là giới hạn bởi đoạn thẳng $(d): y = 1/2 x + 2$ (từ $x = -4$ đến $x = 0$). 
  Biết cung Parabol $(P)$ ghép nối "trơn mượt" với đoạn thẳng $(d)$ tại điểm có hoành độ $x = 0$ và cắt trục $O x$ tại $x = 2$. Tính thể tích khối gỗ làm con quay đó (đơn vị: $upright("cm")^3$, làm tròn kết quả đến hàng phần mười).],
  [$33","3$],
  loigiai: [
    #step[Tại điểm ghép $x = 0$: Hàm đoạn thẳng $y_1 = 1/2 x + 2 => y'_1 = 1/2$. Giá trị $y_1(0) = 2, y'_1(0) = 1/2$.]
    #step[Hàm $(P): y_2 = a x^2 + b x + c => y'_2 = 2a x + b$. Điều kiện ghép trơn tại $x = 0$ và cắt $O x$ tại $x = 2$:
    $ cases(y_2(0) = 2, y'_2(0) = 1/2, y_2(2) = 0) <=> cases(c = 2, b = 1/2, 4a + 2b + c = 0) <=> cases(a = -3/4, b = 1/2, c = 2) $]
    #step[Vậy phương trình Parabol là $(P): y_2 = -3/4 x^2 + 1/2 x + 2$. Thể tích con quay gồm 2 phần (khối nón bên trái và khối Paraboloid bên phải):
    $ V = pi integral_(-4)^0 (1/2 x + 2)^2 d x + pi integral_0^2 (-3/4 x^2 + 1/2 x + 2)^2 d x $]
    #step[Tích phân 1 (Khối nón): $V_1 = pi integral_(-4)^0 (1/4 x^2 + 2x + 4) d x = pi (x^3/12 + x^2 + 4x) |_(-4)^0 = 16/3 pi$.]
    #step[Tích phân 2: $V_2 = pi integral_0^2 (9/16 x^4 - 3/4 x^3 - 11/4 x^2 + 2x + 4) d x = pi (9/80 x^5 - 3/16 x^4 - 11/12 x^3 + x^2 + 4x) |_0^2 = 79/15 pi$.]
    #step[Tổng thể tích: $V = 16/3 pi + 79/15 pi = 159/15 pi = 53/5 pi approx 33,3008$. Làm tròn phần mười ta được $33,3$.]
  ],
  fig-pos: "center",
  fig-width: 55%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Trục toạ độ
      line((-5, 0), (3, 0), mark: (end: ">"), stroke: gray, name: "x")
      line((0, -3), (0, 3), mark: (end: ">"), stroke: gray, name: "y")
      
      // Đường sinh
      // Nón trái
      line((-4, 0), (0, 2), stroke: (paint: rgb("795548"), thickness: 2pt))
      line((-4, 0), (0, -2), stroke: (paint: rgb("795548"), thickness: 2pt))
      
      // Bầu Parabol phải
      let p_pts_top = range(0, 21).map(x => { let h = x/10; return (h, -0.75*h*h + 0.5*h + 2) })
      let p_pts_bot = range(0, 21).map(x => { let h = x/10; return (h, -(-0.75*h*h + 0.5*h + 2)) })
      line(..p_pts_top, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      line(..p_pts_bot, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      
      // Các elip cắt ngang tạo hình khối 3D (xoay quanh trục Ox nên Elip đứng)
      let draw_ellipse_x(x_coord, r, color) = {
        let rx = 0.25 * r
        arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
      }
      
      draw_ellipse_x(0, 2, rgb("BCAAA4")) // Mép nối lớn nhất
      draw_ellipse_x(1, 1.75, rgb("BCAAA4")) // Tại x=1, r=1.75
      draw_ellipse_x(-2, 1, rgb("BCAAA4")) // Tại x=-2, r=1
      
      // Điểm mút
      circle((-4, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
)

=== Dạng 22: Tượng đài "Giọt nước" Kỷ niệm nạn nhân Covid-19 (Ghép Tròn và Parabol)

#tln(
  [Tại công viên Lý Thái Tổ (TP.HCM), biểu tượng kỷ niệm đồng bào tử vong do Covid-19 có hình dáng một "Giọt nước" 3D khổng lồ (bề mặt trơn nhẵn). Đặt vào hệ trục tọa độ $O x y$, mặt cắt dọc của tượng là một hình phẳng xoay quanh trục $O y$. Nửa bên phải trục $O y$ (ứng với $x >= 0$) giới hạn bởi 2 đường:
  - Cung bên dưới là một phần tư đường tròn tâm $I(0; 1)$, bán kính $R=1$ (từ $y=0$ đến $y=1$).
  - Cung bên trên là một nhánh Parabol $(P): x = a y^2 + b y + c$ (từ $y=1$ đến $y=4$).
  Biết Parabol tiếp xúc trơn với cung tròn tại điểm có tung độ $y=1$ và thuôn lên tận đỉnh tượng ở tung độ $y=4$. Giả sử tượng đài được đúc đặc bằng Đồng, khối lượng riêng của khối đồng là $8,9$ tấn/$upright("m")^3$ (đơn vị trên hệ trục tọa độ tính bằng mét). Tính tổng khối lượng của bức tượng này (đơn vị: tấn, làm tròn kết quả đến hàng đơn vị).],
  [$63$],
  loigiai: [
    #step[Cung tròn bên dưới có phương trình $x^2 + (y-1)^2 = 1 => x = sqrt(1 - (y-1)^2)$ (do $x >= 0$).]
    #step[Tại điểm ghép $y=1$: $x(1) = 1$. Đạo hàm $x'(y) = (-(y-1))/sqrt(1 - (y-1)^2) => x'(1) = 0$.]
    #step[Nhánh Parabol $(P): x = a(y-1)^2 + b(y-1) + c$. Tiếp xúc trơn tại $(1; 1)$ nên $x(1)=1 => c=1$, và $x'(1)=0 => b=0$.]
    #step[Đỉnh tượng tại $y=4 => x=0 => a(3)^2 + 1 = 0 => a = -1/9$. Suy ra $(P): x = 1 - (y-1)^2/9$.]
    #step[Thể tích khối giọt nước khi quay quanh $O y$: 
    $ V = pi integral_0^1 (1 - (y-1)^2) d y + pi integral_1^4 (1 - (y-1)^2/9)^2 d y $]
    #step[Tích phân thứ nhất (bán cầu dưới) bằng $2/3 pi$. Tích phân thứ hai (đặt $u=y-1$): 
    $ V_2 = pi integral_0^3 (1 - 2/9 u^2 + 1/81 u^4) d u = pi (u - 2/27 u^3 + 1/405 u^5) |_0^3 = pi(3 - 2 + 0,6) = 1,6 pi = 8/5 pi $]
    #step[Tổng thể tích $V = 2/3 pi + 8/5 pi = 34/15 pi$ ($upright("m")^3$).]
    #step[Khối lượng tượng đài $m = D * V = 8,9 * 34/15 pi approx 63,38$ (tấn). Làm tròn ta được $63$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Mặt đất
      line((-3, 0), (3, 0), stroke: (paint: gray, thickness: 1.5pt))
      
      // Hàm vẽ elip 3D xoay quanh trục Y
      let draw_ellipse_y(y_coord, r, color) = {
        let ry = 0.2 * r
        arc((r, y_coord), start: 0deg, stop: 180deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((-r, y_coord), start: 180deg, stop: 360deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // Bầu tròn dưới
      let c_pts_r = range(0, 11).map(y => { let hy = y/10; return (calc.sqrt(1 - (hy - 1)*(hy - 1)), hy) })
      let c_pts_l = range(0, 11).map(y => { let hy = y/10; return (-calc.sqrt(1 - (hy - 1)*(hy - 1)), hy) })
      line(..c_pts_r, stroke: (paint: rgb("FF9800"), thickness: 2pt))
      line(..c_pts_l, stroke: (paint: rgb("FF9800"), thickness: 2pt))
      
      // Chóp Parabol trên
      let p_pts_r = range(10, 41).map(y => { let hy = y/10; return (1 - (hy - 1)*(hy - 1)/9, hy) })
      let p_pts_l = range(10, 41).map(y => { let hy = y/10; return (-(1 - (hy - 1)*(hy - 1)/9), hy) })
      line(..p_pts_r, stroke: (paint: rgb("FFC107"), thickness: 2pt))
      line(..p_pts_l, stroke: (paint: rgb("FFC107"), thickness: 2pt))
      
      // Các nét elip 3D
      draw_ellipse_y(1, 1, rgb("FFE082")) // Điểm phình to nhất
      draw_ellipse_y(2.5, 1 - 2.25/9, rgb("FFE082")) // Cắt ngang thân
      
      circle((0, 4), radius: 0.05, fill: black)
      circle((0, 1), radius: 0.05, fill: black)
      
      // Trục y
      line((0, 0), (0, 4.5), stroke: (paint: gray, dash: "dashed"))
    })
  ]
)

=== Dạng 23: Điêu khắc Pha lê "Trái Lê" (Sự kỳ diệu của Hàm vô tỉ)

#tln(
  [Một nghệ nhân điêu khắc một tác phẩm nghệ thuật bằng khối pha lê có hình dáng một "Trái Lê" (Pear) 3D tuyệt đẹp. Trái lê này được tạo thành khi quay một hình phẳng giới hạn bởi đường cong $(C)$ và trục $O y$ quanh chính trục $O y$. 
  Bằng sự kỳ diệu của Toán học, đường cong $(C)$ này không cần phải ghép nối nhiều đường, mà chỉ tuân theo một hàm vô tỉ duy nhất: $x = (1-y)sqrt(y+2)$ (với điều kiện $y in [-2; 1]$).
  Biết đơn vị trên hệ trục tọa độ là cm, và khối lượng riêng của pha lê là $3,1$ g/$upright("cm")^3$. Hỏi tác phẩm nghệ thuật Trái Lê này nặng khoảng bao nhiêu gam? (Làm tròn kết quả đến hàng đơn vị).],
  [$66$],
  loigiai: [
    #step[Thể tích khối pha lê khi quay hình phẳng quanh trục $O y$ là:
    $ V = pi integral_(-2)^1 x^2 d y = pi integral_(-2)^1 (1-y)^2 (y+2) d y $]
    #step[Sử dụng phương pháp đổi biến số: Đặt $u = y+2 => d u = d y$. Khi đó $y = u - 2 => 1 - y = 3 - u$.]
    #step[Đổi cận: $y = -2 => u = 0$; $y = 1 => u = 3$. Tích phân trở thành:
    $ V = pi integral_0^3 (3-u)^2 u d u = pi integral_0^3 (9u - 6u^2 + u^3) d u $]
    #step[Tính nguyên hàm:
    $ V = pi (9/2 u^2 - 2u^3 + u^4/4) |_0^3 = pi(81/2 - 54 + 81/4) = pi (162/4 - 216/4 + 81/4) = 27/4 pi " " (upright("cm")^3) $]
    #step[Khối lượng khối pha lê Trái Lê là: $m = D * V = 3,1 * 27/4 pi = (83,7 pi)/4 approx 65,738$ (gam).]
    #step[Làm tròn đến hàng đơn vị ta được $66$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Trục y
      line((0, -2.5), (0, 1.5), stroke: (paint: gray, dash: "dashed"))
      line((-2.5, 0), (2.5, 0), stroke: (paint: gray, dash: "dashed"))
      
      // Hàm vẽ elip 3D xoay quanh trục Y
      let draw_ellipse_y(y_coord, r, color) = {
        let ry = 0.2 * r
        arc((r, y_coord), start: 0deg, stop: 180deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((-r, y_coord), start: 180deg, stop: 360deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // Đồ thị hàm số trái lê
      let pear_pts_r = range(-20, 11).map(y => { let hy = y/10; return ((1 - hy)*calc.sqrt(hy+2), hy) })
      let pear_pts_l = range(-20, 11).map(y => { let hy = y/10; return (-(1 - hy)*calc.sqrt(hy+2), hy) })
      
      line(..pear_pts_r, stroke: (paint: rgb("8BC34A"), thickness: 2pt))
      line(..pear_pts_l, stroke: (paint: rgb("8BC34A"), thickness: 2pt))
      
      // Các vòng Elip 3D căng mọng bề mặt Lê
      // Tính x tại một vài y đẹp
      draw_ellipse_y(-1, 2, rgb("AED581")) // Phần hông phình to nhất
      draw_ellipse_y(0, 1.414, rgb("AED581"))
      
      circle((0, 1), radius: 0.05, fill: black) // Cuống lê
      circle((0, -2), radius: 0.05, fill: black) // Đáy lê
    })
  ]
)

=== Dạng 24: Thiết kế Bình gốm "Hoàng gia" (Sự tiếp xúc của Hàm Mũ và Đa thức)

#tln(
  [Một xưởng gốm thiết kế chiếc bình hoa có dạng tròn xoay. Đặt vào hệ trục toạ độ $O x y$ (đơn vị dm), mặt cắt dọc (nửa bên trên trục $O x$) của bình gồm hai phần: phần thân bầu là một nhánh Parabol $(P): y = -0,5 x^2 + 2,5$ (với $x in [0; 1]$) và phần cổ thon gọn là một đường cong có dạng hàm số mũ $(E): y = e^(1-x) + 1$ (với $x in [1; 3]$).
  Biết phần cổ và phần thân tiếp xúc trơn với nhau tại điểm nối $x = 1$. Khi cho toàn bộ hình phẳng giới hạn bởi $(P), (E)$, trục $O x$ và các đường thẳng $x = 0, x = 3$ quay quanh trục $O x$, ta được hình khối không gian của chiếc bình. Tính thể tích rỗng bên trong chiếc bình này (tính bằng lít, làm tròn đến hàng đơn vị).],
  [$30$],
  loigiai: [
    #step[Thử lại điều kiện tiếp xúc tại $x = 1$:
    $(P): y(1) = 2, y'(1) = -1$; $(E): y(1) = e^0 + 1 = 2, y'(1) = -e^0 = -1$. Hai đường cong ghép trơn hoàn hảo.]
    #step[Thể tích của bình khi xoay quanh trục $O x$ gồm tổng 2 khối tròn xoay:
    $ V = pi integral_0^1 (-0,5x^2 + 2,5)^2 d x + pi integral_1^3 (e^(1-x) + 1)^2 d x $]
    #step[Tích phân phần Parabol: 
    $ V_1 = pi integral_0^1 (0,25x^4 - 2,5x^2 + 6,25) d x = pi (x^5/20 - 5/6 x^3 + 25/4 x) |_0^1 = 82/15 pi $]
    #step[Tích phân phần Hàm mũ (đặt $u = 1-x$): 
    $ V_2 = pi integral_0^(-2) (e^u + 1)^2 (-d u) = pi integral_(-2)^0 (e^(2u) + 2e^u + 1) d u = pi (e^(2u)/2 + 2e^u + u) |_(-2)^0 $]
    #step[Tính toán $V_2 = pi [ (1/2 + 2 + 0) - (e^(-4)/2 + 2e^(-2) - 2) ] = pi (4,5 - 0,5 e^(-4) - 2e^(-2))$.]
    #step[Tổng thể tích $V = V_1 + V_2 = pi (82/15 + 4,5 - 0,5 e^(-4) - 2e^(-2)) approx 30,42$ (lít). Làm tròn thành $30$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Trục toạ độ
      line((-0.5, 0), (4, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      
      // Hàm vẽ elip 3D xoay quanh trục X
      let draw_ellipse_x(x_coord, r, color) = {
        let rx = 0.2 * r
        arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // Phần thân bầu (Parabol)
      let p_pts_top = range(0, 11).map(x => { let h = x/10; return (h, -0.5*h*h + 2.5) })
      let p_pts_bot = range(0, 11).map(x => { let h = x/10; return (h, -(-0.5*h*h + 2.5)) })
      line(..p_pts_top, stroke: (paint: rgb("00BCD4"), thickness: 2pt))
      line(..p_pts_bot, stroke: (paint: rgb("00BCD4"), thickness: 2pt))
      
      // Phần cổ bình (Hàm mũ)
      let e_pts_top = range(10, 31).map(x => { let h = x/10; return (h, calc.exp(1-h) + 1) })
      let e_pts_bot = range(10, 31).map(x => { let h = x/10; return (h, -(calc.exp(1-h) + 1)) })
      line(..e_pts_top, stroke: (paint: rgb("26C6DA"), thickness: 2pt))
      line(..e_pts_bot, stroke: (paint: rgb("26C6DA"), thickness: 2pt))
      
      // Các elip 3D
      draw_ellipse_x(0, 2.5, rgb("B2EBF2")) // Đáy
      draw_ellipse_x(1, 2, rgb("B2EBF2")) // Chỗ nối
      draw_ellipse_x(3, calc.exp(-2) + 1, rgb("B2EBF2")) // Miệng bình
    })
  ]
)

=== Dạng 25: Loa phát thanh Âm thanh vòm (Sự tiếp xúc thần kỳ của Căn thức và Logarit)

#tln(
  [Kỹ sư thiết kế phần vỏ kim loại của một chiếc kèn loa phát thanh. Mặt cắt ngang của chiếc loa có dạng khối tròn xoay quanh trục $O x$ (đơn vị: dm).
  Phần vỏ đặc được giới hạn bởi mặt ngoài sinh bởi nhánh đường cong $(C_1): y = a sqrt(x)$ (với $x in [0; e^2]$) và mặt lõi rỗng bên trong sinh bởi đường logarit $(C_2): y = ln(x)$ (với $x in [1; e^2]$).
  Để tạo tính khí động học tại miệng loa (hoành độ $x = e^2$), kỹ sư thiết kế sao cho viền cong mặt trong và mặt ngoài tiếp xúc trơn với nhau (có chung tiếp tuyến). Tính thể tích phần vỏ kim loại đặc để đúc chiếc loa này (đơn vị: lít, làm tròn đến một chữ số thập phân).],
  [$6","3$],
  loigiai: [
    #step[Tại miệng loa $x = e^2$, toạ độ điểm ghép là $(e^2; 2)$ vì $y_2(e^2) = ln(e^2) = 2$.
    Mặt ngoài $(C_1)$ đi qua điểm này nên $a sqrt(e^2) = 2 => a = 2/e$. Vậy $(C_1): y_1 = (2/e) sqrt(x)$.]
    #step[Thử lại tính tiếp xúc: $y'_1(e^2) = (2/e) * 1/(2sqrt(e^2)) = 1/e^2$ và $y'_2(e^2) = 1/e^2$. Hai đồ thị thực sự có tiếp tuyến chung tại miệng loa!]
    #step[Thể tích vỏ loa (phần đặc) bằng thể tích tạo bởi mặt ngoài trừ đi thể tích lổ rỗng bên trong:
    $ V = pi integral_0^(e^2) ((2/e) sqrt(x))^2 d x - pi integral_1^(e^2) (ln(x))^2 d x = V_("ngoài") - V_("trong") $]
    #step[Tính $V_("ngoài") = pi integral_0^(e^2) 4/e^2 x d x = pi * 4/e^2 * (x^2/2) |_0^(e^2) = 2pi e^2$.]
    #step[Tính $V_("trong"):$ Đặt $u = ln(x) => d x = e^u d u$. Cận $x=1 => u=0; x=e^2 => u=2$. Tích phân từng phần 2 lần:
    $ V_("trong") = pi integral_0^2 u^2 e^u d u = pi (e^u(u^2 - 2u + 2)) |_0^2 = pi (e^2(4 - 4 + 2) - e^0(2)) = pi (2e^2 - 2) $]
    #step[*ĐIỀU KỲ DIỆU*: Tổng thể tích khối loa kim loại đặc là:
    $ V = V_("ngoài") - V_("trong") = 2pi e^2 - pi (2e^2 - 2) = 2pi " " ("lít") $]
    #step[Kết quả triệt tiêu hoàn toàn hằng số $e$. Khối lượng thể tích là $2 * 3,14159 approx 6,28$ (lít). Làm tròn được $6,3$.]
  ],
  fig-pos: "center",
  fig-width: 55%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Trục x
      line((-0.5, 0), (8.5, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      
      let draw_ellipse_x(x_coord, r, color, dashed_back: true) = {
        let rx = 0.2 * r
        if dashed_back {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        } else {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
        }
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 1.5pt))
      }
      
      // Mặt ngoài (Căn thức)
      let c1_top = range(0, 74).map(x => { let h = x/10; return (h, (2/2.718) * calc.sqrt(h)) })
      let c1_bot = range(0, 74).map(x => { let h = x/10; return (h, -(2/2.718) * calc.sqrt(h)) })
      line(..c1_top, stroke: (paint: rgb("F44336"), thickness: 2pt))
      line(..c1_bot, stroke: (paint: rgb("F44336"), thickness: 2pt))
      
      // Mặt trong (Logarit)
      let c2_top = range(10, 74).map(x => { let h = x/10; return (h, calc.ln(h)) })
      let c2_bot = range(10, 74).map(x => { let h = x/10; return (h, -calc.ln(h)) })
      line(..c2_top, stroke: (paint: rgb("EF9A9A"), thickness: 2pt, dash: "dashed"))
      line(..c2_bot, stroke: (paint: rgb("EF9A9A"), thickness: 2pt, dash: "dashed"))
      
      // Miệng loa
      draw_ellipse_x(7.389, 2, rgb("D32F2F"), dashed_back: false)
      
      // Vùng vật liệu bị khoét rỗng
      draw_ellipse_x(3, calc.ln(3), rgb("EF9A9A"), dashed_back: true)
      
      circle((7.389, 2), radius: 0.05, fill: black)
      circle((7.389, -2), radius: 0.05, fill: black)
      
      content((4, 2.5), [Vỏ kèn Căn thức])
      content((4, 0.5), [Lõi kèn Logarit])
    })
  ]
)

=== Dạng 26: Thiết bị lặn ngầm (Ghép mặt cầu và Hàm số mũ)

#tln(
  [Một thiết bị lặn không người lái có vỏ ngoài là một khối tròn xoay (quay quanh trục $O x$). Để tối ưu hóa lực cản của nước, thiết bị được tạo hình thành 2 phần:
  - Phần đầu là chỏm cầu $(C_1)$ (khi cắt ngang là nửa đường tròn $x^2 + y^2 = 25$, lấy $y >= 0$), giới hạn từ hoành độ $x = -5$ đến $x = 4$.
  - Phần đuôi là khối vuốt thon dài về sau tạo bởi đường cong $(C_2): y = A dot e^(k x)$, giới hạn từ $x = 4$ đến $x = 10$.
  Biết phần đầu và phần đuôi được ghép nối với nhau "trơn mượt" (có tiếp tuyến chung) tại vị trí $x = 4$. Lấy đơn vị trên hệ trục toạ độ là decimet (dm). Bằng cách thiết lập tích phân, hãy dùng máy tính Casio để tính phần thể tích giới hạn bên trong thiết bị lặn này (đơn vị: lít, làm tròn đến hàng đơn vị).],
  [$541$],
  loigiai: [
    #step[Phần đầu $(C_1): y_1 = sqrt(25-x^2) => y'_1 = (-x)/sqrt(25-x^2)$.\
    Tại điểm nối $x = 4$: $y_1(4) = 3$ và $y'_1(4) = -4/3$.]
    #step[Phần đuôi $(C_2): y_2 = A e^(k x) => y'_2 = A k e^(k x)$. Điều kiện tiếp xúc trơn tại $x = 4$:
    $ cases(A e^(4k) = 3, A k e^(4k) = -4/3) => (A k e^(4k))/(A e^(4k)) = (-4/3)/3 => k = -4/9 $]
    #step[Thay $k = -4/9$ vào phương trình đầu, ta được $A e^(-16/9) = 3 => A = 3 e^(16/9)$. Vậy phương trình phần đuôi là $(C_2): y_2 = 3 e^((16-4x)/9)$.]
    #step[Thể tích của thiết bị lặn bằng tổng thể tích của phần đầu và phần đuôi:
    $ V = pi integral_(-5)^4 (25-x^2) d x + pi integral_4^10 (3 e^((16-4x)/9))^2 d x $]
    #step[Sử dụng máy tính Casio để bấm trực tiếp tổng của 2 tích phân này:
    - Tích phân phần đầu: $I_1 = pi integral_(-5)^4 (25-x^2) d x = 162 pi approx 508,938$.
    - Tích phân phần đuôi: $I_2 = pi integral_4^10 9 e^((32-8x)/9) d x approx 10,076 pi approx 31,655$.]
    #step[Tổng thể tích $V = I_1 + I_2 approx 540,59$ ($upright("dm")^3$ = lít). Làm tròn đến hàng đơn vị, ta được $541$.]
  ],
  fig-pos: "center",
  fig-width: 55%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Trục toạ độ
      line((-6, 0), (11, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      
      // Hàm vẽ elip 3D xoay quanh trục X
      let draw_ellipse_x(x_coord, r, color) = {
        let rx = 0.2 * r
        arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // Phần đầu (nửa đường tròn)
      let c_pts_top = range(-50, 41).map(x => { let h = x/10; return (h, calc.sqrt(25 - h*h)) })
      let c_pts_bot = range(-50, 41).map(x => { let h = x/10; return (h, -calc.sqrt(25 - h*h)) })
      line(..c_pts_top, stroke: (paint: rgb("FF9800"), thickness: 2pt))
      line(..c_pts_bot, stroke: (paint: rgb("FF9800"), thickness: 2pt))
      
      // Phần đuôi (Hàm mũ)
      let p_pts_top = range(40, 101).map(x => { let h = x/10; return (h, 3 * calc.exp((16 - 4*h)/9)) })
      let p_pts_bot = range(40, 101).map(x => { let h = x/10; return (h, -3 * calc.exp((16 - 4*h)/9)) })
      line(..p_pts_top, stroke: (paint: rgb("FFC107"), thickness: 2pt))
      line(..p_pts_bot, stroke: (paint: rgb("FFC107"), thickness: 2pt))
      
      // Các elip 3D
      draw_ellipse_x(0, 5, rgb("FFE082")) // Bụng phình to nhất
      draw_ellipse_x(4, 3, rgb("FFE082")) // Chỗ nối
      draw_ellipse_x(8, 3 * calc.exp((16 - 32)/9), rgb("FFE082")) // Đuôi
      
      circle((4, 3), radius: 0.05, fill: black)
      circle((4, -3), radius: 0.05, fill: black)
      circle((-5, 0), radius: 0.05, fill: black)
      
      content((4, 3.5), [Điểm ghép])
    })
  ]
)

=== Dạng 27: Con lăn Massage rãnh lồi lõm (Siêu phẩm Lượng giác và Parabol)

#tln(
  [Một xưởng sản xuất thiết bị thể thao đúc một con lăn massage bằng nhựa khối. Con lăn có dạng khối tròn xoay quanh trục $O x$ (chiều dài từ $x = 0$ đến $x = 4$ cm), với cấu trúc rỗng xuyên tâm là một lỗ hình trụ bán kính $r = 1$ cm. Mặt ngoài của con lăn có các rãnh lồi lõm được tạo bởi hai đường cong ghép trơn với nhau:
  - Khúc lồi (nằm ở hai đầu) là đường lượng giác $(T): y = 4 + cos((pi x)/2)$ (giới hạn từ $x=0$ đến $x=1$ và từ $x=3$ đến $x=4$).
  - Khúc lõm sâu ở giữa là một đường Parabol $(P): y = a x^2 + b x + c$ (giới hạn từ $x=1$ đến $x=3$).
  Biết đường Lượng giác và đường Parabol ghép nối hoàn hảo với nhau (tiếp xúc trơn) tại điểm $x=1$ và $x=3$. Tìm hệ số của Parabol, sau đó sử dụng máy tính Casio để tính thể tích phần nhựa (vật liệu đặc) cấu tạo nên con lăn massage này (đơn vị: $upright("cm")^3$, làm tròn đến 1 chữ số thập phân).],
  [$199","4$],
  loigiai: [
    #step[Tại điểm ghép $x = 1$, đường Lượng giác có toạ độ: $y_1(1) = 4 + cos(pi/2) = 4$. Đạo hàm $y'_1 = -pi/2 sin((pi x)/2) => y'_1(1) = -pi/2$.]
    #step[Parabol $(P): y_2 = a x^2 + b x + c => y'_2 = 2a x + b$. Parabol đối xứng qua $x = 2$ (đáy rãnh lõm) nên $y'_2(2) = 0 => 4a + b = 0$.
    Mặt khác $(P)$ tiếp xúc trơn với $(T)$ tại $x = 1$ nên $y'_2(1) = -pi/2 => 2a + b = -pi/2$.]
    #step[Giải hệ hai đạo hàm ta được $2a = pi/2 => a = pi/4$ và $b = -pi$. 
    Tại $x = 1$, ta có $y_2(1) = 4 => pi/4 - pi + c = 4 => c = 4 + (3pi)/4$.
    Vậy phương trình rãnh lõm là $(P): y_2 = (pi/4)x^2 - pi x + 4 + (3pi)/4$.]
    #step[Phần lỗ rỗng xuyên tâm của con lăn là một hình trụ bán kính $r=1$ trải dài từ $x=0$ đến $x=4$.]
    #step[Thiết lập tích phân tính thể tích vỏ nhựa (Thể tích tổng khối lồi lõm trừ đi lỗ rỗng xuyên tâm):
    $ V = pi integral_0^1 y_1^2 d x + pi integral_1^3 y_2^2 d x + pi integral_3^4 y_1^2 d x - pi integral_0^4 1^2 d x $]
    #step[Nhập trực tiếp toàn bộ biểu thức sau vào máy tính Casio (nhớ để chế độ Radian):
    $ V = pi (2 integral_0^1 (4+cos((pi x)/2))^2 d x + integral_1^3 (pi/4 x^2 - pi x + 4 + (3pi)/4)^2 d x - 4) $]
    #step[Casio sẽ trả về kết quả cực kỳ chuẩn xác: $V approx 199,385$. Làm tròn một chữ số thập phân ta được $199,4$ ($upright("cm")^3$).]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Trục x
      line((-0.5, 0), (4.5, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      
      let draw_ellipse_x(x_coord, r, color, dashed_back: true) = {
        let rx = 0.2 * r
        if dashed_back {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        } else {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
        }
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 1.5pt))
      }
      
      // Lõi rỗng
      line((0, 1), (4, 1), stroke: (paint: rgb("EEEEEE"), thickness: 2pt))
      line((0, -1), (4, -1), stroke: (paint: rgb("EEEEEE"), thickness: 2pt, dash: "dashed"))
      
      // Khúc 1 & 3: Lượng giác
      let t1_top = range(0, 11).map(x => { let h = x/10; return (h, 4 + calc.cos(calc.pi * h / 2)) })
      let t1_bot = range(0, 11).map(x => { let h = x/10; return (h, -(4 + calc.cos(calc.pi * h / 2))) })
      line(..t1_top, stroke: (paint: rgb("E91E63"), thickness: 2pt))
      line(..t1_bot, stroke: (paint: rgb("E91E63"), thickness: 2pt))
      
      let t2_top = range(30, 41).map(x => { let h = x/10; return (h, 4 + calc.cos(calc.pi * h / 2)) })
      let t2_bot = range(30, 41).map(x => { let h = x/10; return (h, -(4 + calc.cos(calc.pi * h / 2))) })
      line(..t2_top, stroke: (paint: rgb("E91E63"), thickness: 2pt))
      line(..t2_bot, stroke: (paint: rgb("E91E63"), thickness: 2pt))
      
      // Khúc 2: Parabol
      let p_top = range(10, 31).map(x => { let h = x/10; return (h, calc.pi/4*h*h - calc.pi*h + 4 + 0.75*calc.pi) })
      let p_bot = range(10, 31).map(x => { let h = x/10; return (h, -(calc.pi/4*h*h - calc.pi*h + 4 + 0.75*calc.pi)) })
      line(..p_top, stroke: (paint: rgb("C2185B"), thickness: 2pt))
      line(..p_bot, stroke: (paint: rgb("C2185B"), thickness: 2pt))
      
      // Viền elip
      draw_ellipse_x(0, 5, rgb("F48FB1")) // Mặt ngoài đầu 1
      draw_ellipse_x(0, 1, rgb("BDBDBD")) // Mặt lổ đầu 1
      
      draw_ellipse_x(1, 4, rgb("F48FB1")) // Cắt ngang
      draw_ellipse_x(2, 4 - calc.pi/4, rgb("F48FB1")) // Đáy rãnh
      draw_ellipse_x(3, 4, rgb("F48FB1")) // Cắt ngang
      
      draw_ellipse_x(4, 5, rgb("F48FB1"), dashed_back: false) // Mặt ngoài đầu 2 (nhìn thấy viền lổ trong)
      draw_ellipse_x(4, 1, rgb("BDBDBD"), dashed_back: false)
      
    })
  ]
)
