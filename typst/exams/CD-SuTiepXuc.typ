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
    #step[Trên đoạn $[0; 1]$, đường cong là phần nhánh dương của đường tròn: $y_1 = sqrt(5 - x^2)$.]
    #step[Tại $x = 1$, ta có $y_1(1) = 2$. Đạo hàm $y'_1 = (-x)/sqrt(5 - x^2) => y'_1(1) = -1/2$.]
    #step[Trên đoạn $[1; 3]$, đường cong là Parabol $y_2 = a x^2 + b x + c$. Đạo hàm $y'_2 = 2a x + b$.]
    #step[Sự tiếp xúc "trơn" tại $M(1; 2)$ đòi hỏi hàm số liên tục và có cùng hệ số góc tiếp tuyến (đạo hàm bằng nhau):
    $ cases(
      y_2(1) = y_1(1) = 2,
      y'_2(1) = y'_1(1) = -1/2
    ) <=> cases(
      a + b + c = 2 quad (1),
      2a + b = -1/2 quad (2)
    ) $]
    #step[Mặt khác, Parabol đi qua điểm $(3; 0)$ nên: $9a + 3b + c = 0 quad (3)$.]
    #step[Từ (2) ta có $b = -2a - 1/2$. Thay vào (1) được $c = 2 - a - b = a + 5/2$.
    Thay $b, c$ vào (3): $9a + 3(-2a - 1/2) + (a + 5/2) = 0 <=> 4a + 1 = 0 <=> a = -1/4$.
    Suy ra $b = 0$ và $c = 9/4$. Vậy phương trình Parabol là $y_2 = -1/4 x^2 + 9/4$.]
    #step[Thể tích khối pha lê được tính bằng tổng thể tích 2 phần: $V = V_1 + V_2 = pi integral_0^1 y_1^2 d x + pi integral_1^3 y_2^2 d x$.]
    #step[$V_1 = pi integral_0^1 (5 - x^2) d x = pi (5x - x^3/3) |_0^1 = 14/3 pi$.]
    #step[$V_2 = pi integral_1^3 (-1/4 x^2 + 9/4)^2 d x = pi integral_1^3 (1/16 x^4 - 9/8 x^2 + 81/16) d x = pi (x^5/80 - (3x^3)/8 + (81x)/16) |_1^3$.]
    #step[Thay cận: Tại $x=3$ biểu thức bằng $81/10$. Tại $x=1$ biểu thức bằng $47/10$. $=> V_2 = pi (81/10 - 47/10) = 17/5 pi$.]
    #step[Tổng thể tích: $V = 14/3 pi + 17/5 pi = 121/15 pi$. Do đó $V/pi = 121/15 approx 8,067 approx 8,1$.]
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
      
      // Vẽ các vòng elip (mặt cắt 3D)
      // Tại x = 1 (R = 2)
      cetz.draw.circle((1, 0), radius: (0.4, 2), stroke: (paint: gray, thickness: 0.5pt))
      // Tại x = 0 (R = sqrt(5) = 2.236)
      cetz.draw.circle((0, 0), radius: (0.4, 2.236), stroke: (paint: gray, thickness: 0.5pt))
      // Tại x = 2 (R = -1/4 * 4 + 9/4 = 5/4 = 1.25)
      cetz.draw.circle((2, 0), radius: (0.3, 1.25), stroke: (paint: gray, thickness: 0.5pt))
      
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
    #step[Tại $x=1$, điểm trên $(P_1)$ là $M(1; 3)$. Đạo hàm $y'_1 = -2x + 4 => y'_1(1) = 2$.]
    #step[Vì $(P_2)$ nối trơn với $(P_1)$ tại $M(1; 3)$ nên đồ thị $(P_2)$ cũng đi qua $M$ và có hệ số góc tiếp tuyến tại đó bằng 2. Ta có hệ điều kiện:
    $ cases(
      y_2(1) = 3,
      y'_2(1) = 2
    ) <=> cases(
      a + b + c = 3 quad (1),
      2a + b = 2 quad (2)
    ) $]
    #step[Ngoài ra $(P_2)$ đi qua $(3; 0)$ nên: $9a + 3b + c = 0 quad (3)$.]
    #step[Từ (2) $=> b = 2 - 2a$. Thế vào (1): $a + (2 - 2a) + c = 3 => c = a + 1$.]
    #step[Thế $b, c$ vào (3): $9a + 3(2 - 2a) + (a + 1) = 0 <=> 4a + 7 = 0 <=> a = -7/4$.]
    #step[Suy ra $b = 2 - 2(-7/4) = 11/2$ và $c = -7/4 + 1 = -3/4$.]
    #step[Tính biểu thức $S = 4(-7/4) + 2(11/2) - 4(-3/4) = -7 + 11 + 3 = 7$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Xoay trục đứng cho giống bình gốm thực tế
      // Tức là x đóng vai trò chiều cao (trục y cũ), y đóng vai trò bán kính (trục x cũ)
      // Chuyển trục: x_draw = y, y_draw = -x
      
      // Trục trung tâm
      line((0, 1), (0, -4), mark: (end: ">"), stroke: (paint: gray, dash: "dashed"))
      
      // Hàm vẽ 3D các vòng elip
      let draw_ellipse(y_coord, radius, color) = {
        cetz.draw.circle((0, -y_coord), radius: (radius, 0.3 * radius), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // (P1): y_r = -x^2 + 4x (x từ 0 đến 1)
      let p1_pts = range(0, 11).map(x => {
        let h = x/10
        let r = -h*h + 4*h
        return (r, -h)
      })
      let p1_pts_neg = range(0, 11).map(x => {
        let h = x/10
        let r = -h*h + 4*h
        return (-r, -h)
      })
      
      // (P2): y_r = -1.75 x^2 + 5.5 x - 0.75 (x từ 1 đến 3)
      let p2_pts = range(10, 31).map(x => {
        let h = x/10
        let r = -1.75 * h*h + 5.5 * h - 0.75
        return (r, -h)
      })
      let p2_pts_neg = range(10, 31).map(x => {
        let h = x/10
        let r = -1.75 * h*h + 5.5 * h - 0.75
        return (-r, -h)
      })
      
      // Vẽ viền bình gốm
      line(..p1_pts, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p1_pts_neg, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p2_pts, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      line(..p2_pts_neg, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      
      // Vẽ các vòng elip tạo hiệu ứng khối
      // Miệng bình tại x=0, r=0
      // Vòng tại x=0.5, r = -0.25+2 = 1.75
      draw_ellipse(0.5, 1.75, rgb("D7CCC8"))
      // Vòng tại tiếp điểm x=1, r=3
      draw_ellipse(1, 3, rgb("8D6E63"))
      // Vòng tại x=2, r = -1.75*4 + 11 - 0.75 = -7+11-0.75 = 3.25
      draw_ellipse(2, 3.25, rgb("D7CCC8"))
      
      content((3.5, -1), [$M(1; 3)$])
      circle((3, -1), radius: 0.1, fill: black)
      circle((-3, -1), radius: 0.1, fill: black)
    })
  ]
)

=== Dạng 15: Bể cá cảnh Nón cụt tiếp xúc Cầu (Hình học 3D)

#tln(
  [Trong một bể cá thủy tinh có dạng khối nón cụt, người ta đặt một quả cầu trang trí sao cho quả cầu vừa khít với bề mặt bể (tiếp xúc với cả mặt đáy lớn, đáy nhỏ và mặt xung quanh của khối nón cụt). Biết bán kính của quả cầu là $R = 2$ (dm), bán kính đáy nhỏ của nón cụt là $r_1 = 1$ (dm). Tính thể tích của bể cá (khối nón cụt) đó (đơn vị dm$^3$, làm tròn kết quả đến hàng phần mười).],
  [$88","0$],
  loigiai: [
    #step[Cắt dọc bể cá qua trục, ta được thiết diện là một hình thang cân ngoại tiếp một đường tròn tâm $O$, bán kính $R = 2$. Gọi đáy nhỏ là $A B = 2 r_1 = 2$, đáy lớn là $C D = 2 r_2$, chiều cao hình thang chính là đường kính quả cầu: $h = 2R = 4$.]
    #step[Đường sinh của nón cụt tương ứng với cạnh bên hình thang cân: $l = B C$. Do tứ giác ngoại tiếp đường tròn nên tổng hai cạnh đối bằng nhau:
    $A B + C D = A D + B C <=> 2r_1 + 2r_2 = 2l => l = r_1 + r_2$.]
    #step[Hạ đường cao từ $B$ xuống $C D$ tại $H$, xét tam giác vuông $B H C$ có $B H = h = 4$, $H C = r_2 - r_1$. Theo định lý Pytago:
    $l^2 = B H^2 + H C^2 => (r_1 + r_2)^2 = (2R)^2 + (r_2 - r_1)^2$
    $<=> r_1^2 + 2r_1 r_2 + r_2^2 = 4R^2 + r_2^2 - 2r_1 r_2 + r_1^2 <=> 4r_1 r_2 = 4R^2 <=> r_1 r_2 = R^2$.]
    #step[Với $R = 2$ và $r_1 = 1$, ta có $1 * r_2 = 2^2 = 4 => r_2 = 4$ (dm).]
    #step[Thể tích của khối nón cụt là:
    $V = 1/3 pi h (r_1^2 + r_2^2 + r_1 r_2) = 1/3 pi * 4 * (1^2 + 4^2 + 1*4) = 4/3 pi (1 + 16 + 4) = 28 pi$.]
    #step[Tính giá trị xấp xỉ: $V = 28 * 3,14159... approx 87,964$. Làm tròn đến hàng phần mười ta được $88,0$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Hình nón cụt
      
      // Đáy lớn (elip)
      cetz.draw.circle((0, -2), radius: (4, 1.2), stroke: (paint: blue, thickness: 1.5pt))
      // Đáy nhỏ (elip)
      cetz.draw.circle((0, 2), radius: (1, 0.3), stroke: (paint: blue, thickness: 1.5pt))
      // Cạnh bên
      line((-1, 2), (-4, -2), stroke: (paint: blue, thickness: 1.5pt))
      line((1, 2), (4, -2), stroke: (paint: blue, thickness: 1.5pt))
      
      // Quả cầu bên trong (đổ màu 3D)
      cetz.draw.circle((0, 0), radius: 2, stroke: (paint: rgb("FFB300"), thickness: 1.5pt), fill: rgb("FFB300").lighten(80%))
      // Vẽ thêm đường xích đạo của cầu để tạo 3D
      cetz.draw.circle((0, 0), radius: (2, 0.6), stroke: (paint: rgb("FFB300"), thickness: 0.5pt))
      
      // Trục
      line((0, 2.5), (0, -2.5), stroke: (paint: gray, dash: "dashed"))
      circle((0, 0), radius: 0.1, fill: black)
      content((0.4, 0.3), [$O$])
    })
  ]
)
