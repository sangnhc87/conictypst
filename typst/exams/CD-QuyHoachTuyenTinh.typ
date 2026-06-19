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
// PHẦN BÀI TẬP: QUY HOẠCH TUYẾN TÍNH
// ═══════════════════════════════════════════════════════════
= Chuyên đề: Bài Toán Quy Hoạch Tuyến Tính (2, 3 Điều Kiện)

== I. Lý Thuyết Trọng Tâm & Phương Pháp Giải

#lythuyet(title: [Định lý cơ bản của Quy hoạch tuyến tính])[
  Xét biểu thức $F(x,y) = a x + b y$ trên một miền đa giác (miền nghiệm của hệ bất phương trình bậc nhất hai ẩn).
  - Nếu miền đa giác là miền đa giác lồi bị chặn (kín), $F(x,y)$ luôn đạt giá trị lớn nhất và nhỏ nhất tại một trong các đỉnh của đa giác đó.
  - Nếu miền đa giác là miền không bị chặn (thường gặp trong bài toán chi phí/dinh dưỡng với các điều kiện $>=$), $F(x,y)$ sẽ đạt giá trị nhỏ nhất tại một trong các đỉnh của đa giác.
]

#ppgiai(title: [Các bước giải chuẩn bài toán quy hoạch tuyến tính thực tế])[
  + *Bước 1 (Lập mô hình toán học):* Gọi $x, y$ lần lượt là số lượng đại lượng thứ nhất và thứ hai (với $x, y >= 0$). Lập biểu thức cần tối ưu (Max/Min) $F(x,y) = a x + b y$.
  + *Bước 2 (Thiết lập hệ bất phương trình):* Dựa vào các giả thiết về giới hạn tài nguyên, nhân lực, hoặc yêu cầu dinh dưỡng tối thiểu để lập hệ bất phương trình ràng buộc.
  + *Bước 3 (Vẽ hình và tìm miền nghiệm):* Biểu diễn miền nghiệm của hệ bất phương trình trên mặt phẳng toạ độ $O x y$. Tìm toạ độ các đỉnh của đa giác miền nghiệm (có thể dùng phương pháp giao điểm của 2 đường thẳng).
  + *Bước 4 (Kết luận):* Thay toạ độ các đỉnh vào biểu thức $F(x,y)$ để tìm giá trị Lớn nhất hoặc Nhỏ nhất, sau đó kết luận theo yêu cầu bài toán.
]

#lythuyet(title: [Mẹo làm bài & Những lỗi sai thường gặp])[
  - *Lỗi hay gặp nhất: Đặt sai ẩn số và sai đơn vị.* Bí quyết để lập hệ bất phương trình nhanh nhất là lập bảng tóm tắt đại lượng. Đọc câu hỏi "Hỏi nhà trường cần thuê bao nhiêu xe mỗi loại?", từ đó đặt ẩn $x, y$ là số xe mỗi loại. Cột dọc của bảng luôn là các đối tượng được chọn (sản phẩm, loại thức ăn, tài sản), cột ngang là các ràng buộc (nguyên liệu, rủi ro, tiền vốn).
  - *Lỗi điều kiện nguyên:* Trong các bài toán thực tế đếm số lượng (chiếc xe, người, đồ vật), nghiệm tối ưu $(x,y)$ bắt buộc phải là số nguyên ($x,y in NN$). Nếu giao điểm hình học ra số thập phân, ta không làm tròn bừa bãi mà phải xét nghiệm nguyên lân cận gần nhất nằm TRONG miền nghiệm.
  - *Lỗi xác định miền nghiệm:* Nhầm lẫn giữa dấu $>=$ (lớn hơn, lấy phần hướng ra xa $O$) và $<=$ (nhỏ hơn, lấy phần hướng về $O$).
]

== II. Phân Loại Các Dạng Toán Thực Tế

=== Dạng 1: Bài toán Kinh tế (Tối đa hoá Lợi nhuận) - 2 điều kiện
Dạng bài này thường yêu cầu tìm giá trị Lớn Nhất (Max) của biểu thức lợi nhuận với miền nghiệm là một tứ giác hoặc đa giác bị chặn.

#tln(
  [Một xí nghiệp sản xuất hai loại sản phẩm A và B. Để sản xuất một đơn vị sản phẩm A cần $1$ giờ chạy máy và $2$ kg nguyên liệu; lợi nhuận thu được là $30$ nghìn đồng. Để sản xuất một đơn vị sản phẩm B cần $2$ giờ chạy máy và $1$ kg nguyên liệu; lợi nhuận thu được là $40$ nghìn đồng. Xí nghiệp hiện có tối đa $10$ giờ chạy máy và $8$ kg nguyên liệu. Để thu được lợi nhuận cao nhất, xí nghiệp cần sản xuất bao nhiêu sản phẩm mỗi loại? Hỏi tổng lợi nhuận lớn nhất đó là bao nhiêu (đơn vị: nghìn đồng)?],
  [220],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là số sản phẩm A và B được sản xuất ($x >= 0, y >= 0$).\
    Lợi nhuận thu được là: $F(x,y) = 30x + 40y$ (nghìn đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Loại SP*], [*Số lượng*], [*Giờ máy/sp*], [*Nguyên liệu/sp*], [*Lợi nhuận/sp*],
        [Sản phẩm A], [$x$], [$1$], [$2$], [$30$],
        [Sản phẩm B], [$y$], [$2$], [$1$], [$40$],
        [*Giới hạn*], [], [*$<= 10$*], [*$<= 8$*], [*(Tối đa)*]
      )
    ]]
    #step[Dựa vào lượng tài nguyên hiện có, ta có hệ bất phương trình:\
    - Ràng buộc về thời gian máy: $x + 2y <= 10$\
    - Ràng buộc về nguyên liệu: $2x + y <= 8$]
    #step[
      Miền nghiệm của hệ là tứ giác $O M N P$ với các đỉnh: $O(0;0)$, $M(4;0)$, giao điểm $N(2;4)$, và $P(0;5)$.
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Shade region
          line((0,0), (4,0), (2,4), (0,5), close: true, fill: col-bg-lt, stroke: none)
          
          // Axes
          line((-1, 0), (6, 0), mark: (end: ">"))
          line((0, -1), (0, 7), mark: (end: ">"))
          content((6, -0.4), [$x$])
          content((-0.4, 7), [$y$])
          content((-0.4, -0.4), [$O$])
          
          // Lines
          line((-1, 5.5), (6, 2), stroke: (paint: red, dash: "dashed"))
          content((5.5, 2.5), text(red)[$x+2y=10$])
          
          line((1, 6), (4.5, -1), stroke: (paint: green.darken(30%), dash: "dashed"))
          content((3.5, -1.2), text(green.darken(30%))[$2x+y=8$])
          
          // Vertices
          circle((0,0), radius: 0.08, fill: black)
          circle((4,0), radius: 0.08, fill: black)
          circle((2,4), radius: 0.08, fill: black)
          circle((0,5), radius: 0.08, fill: black)
          
          content((4, -0.5), [$4$])
          content((4.3, 0.4), [$M$])
          content((-0.5, 5), [$5$])
          content((0.4, 5.3), [$P$])
          content((2.3, 4.3), [$N(2;4)$])
        })
      ]
    ]
    #step[Thay toạ độ các đỉnh vào biểu thức $F(x,y)$:\
    - Tại $O(0;0)$: $F = 30(0) + 40(0) = 0$\
    - Tại $M(4;0)$: $F = 30(4) + 40(0) = 120$\
    - Tại $N(2;4)$: $F = 30(2) + 40(4) = 220$ (Lớn nhất)\
    - Tại $P(0;5)$: $F = 30(0) + 40(5) = 200$\
    Vậy cần sản xuất $2$ sản phẩm A và $4$ sản phẩm B để thu lợi nhuận lớn nhất là $220$ nghìn đồng.]
  ]
)

=== Dạng 2: Bài toán Kinh tế (Tối đa hoá Lợi nhuận) - Hệ 3 điều kiện

#tln(
  [Một xưởng may cần sản xuất hai loại áo sơ mi cao cấp A và B. Để may một chiếc áo A cần $2"m"$ vải cotton, $1"m"$ vải lụa, và tốn $1$ giờ công thợ; lợi nhuận là $300$ nghìn đồng. Để may một chiếc áo B cần $1"m"$ vải cotton, $2"m"$ vải lụa, và $1$ giờ công thợ; lợi nhuận là $400$ nghìn đồng. Trong kho hiện có sẵn tối đa $16"m"$ vải cotton, $14"m"$ vải lụa và $9$ giờ công thợ. Hỏi tổng lợi nhuận lớn nhất xưởng may có thể đạt được là bao nhiêu (đơn vị: nghìn đồng)?],
  [3200],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là số lượng áo A và B được sản xuất ($x, y >= 0$).\
    Tổng lợi nhuận: $F(x,y) = 300x + 400y$ (nghìn đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Loại áo*], [*Số lượng*], [*Cotton/áo*], [*Lụa/áo*], [*Giờ công/áo*], [*Lợi nhuận*],
        [Áo sơ mi A], [$x$], [$2$], [$1$], [$1$], [$300$],
        [Áo sơ mi B], [$y$], [$1$], [$2$], [$1$], [$400$],
        [*Giới hạn*], [], [*$<= 16$*], [*$<= 14$*], [*$<= 9$*], [*(Tối đa)*]
      )
    ]]
    #step[Hệ bất phương trình ràng buộc (3 điều kiện):\
    - Vải cotton: $2x + y <= 16 \ (d_1)$\
    - Vải lụa: $x + 2y <= 14 \ (d_2)$\
    - Giờ công: $x + y <= 9 \ (d_3)$]
    #step[
      Vẽ các đường thẳng lên mặt phẳng toạ độ. Miền đa giác lồi OABCD là phần giao của các nửa mặt phẳng:
      - Đỉnh $O(0;0)$.
      - Đỉnh $A(8;0)$ (giao điểm $d_1$ với $O x$).
      - Đỉnh $B(7;2)$ (giao điểm $d_1$ và $d_3$).
      - Đỉnh $C(4;5)$ (giao điểm $d_2$ và $d_3$).
      - Đỉnh $D(0;7)$ (giao điểm $d_2$ với $O y$).
      
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0,0), (8,0), (7,2), (4,5), (0,7), close: true, fill: col-bg-amb, stroke: none)
          
          line((-1, 0), (10, 0), mark: (end: ">"))
          line((0, -1), (0, 10), mark: (end: ">"))
          content((10, -0.4), [$x$])
          content((-0.4, 10), [$y$])
          
          line((-1, 18), (8.5, -1), stroke: (paint: gray, dash: "dashed"))
          line((-1, 7.5), (10, 2), stroke: (paint: gray, dash: "dashed"))
          line((-1, 10), (10, -1), stroke: (paint: gray, dash: "dashed"))
          
          circle((8,0), radius: 0.08, fill: black); content((8,-0.5), [$8$])
          circle((7,2), radius: 0.08, fill: black); content((7.4,2.3), [$B(7;2)$])
          circle((4,5), radius: 0.08, fill: black); content((4.4,5.4), [$C(4;5)$])
          circle((0,7), radius: 0.08, fill: black); content((-0.5,7), [$7$])
        })
      ]
    ]
    #step[Tính giá trị $F(x,y)$ tại các đỉnh:\
    - $F(8,0) = 300(8) + 400(0) = 2400$\
    - $F(7,2) = 300(7) + 400(2) = 2900$\
    - $F(4,5) = 300(4) + 400(5) = 3200$\
    - $F(0,7) = 300(0) + 400(7) = 2800$\
    Vậy lợi nhuận lớn nhất đạt được là $3200$ nghìn đồng khi sản xuất $4$ áo A và $5$ áo B.]
  ]
)

=== Dạng 3: Bài toán Khẩu phần ăn / Dinh dưỡng (Tối thiểu hoá Chi phí)
Dạng bài này yêu cầu tìm giá trị Nhỏ Nhất (Min) của biểu thức chi phí. Miền nghiệm thường là phần mặt phẳng KHÔNG bị chặn (được giới hạn bởi các điều kiện $>=$, hướng ra xa gốc toạ độ).

#tln(
  [Để bổ sung đủ vitamin cho đàn gia súc, một nông trại cần sử dụng hai loại thức ăn công nghiệp A và B. Để có $1$ kg thức ăn A tốn $15$ nghìn đồng, loại này chứa $2$ đơn vị Vitamin X và $1$ đơn vị Vitamin Y. Để có $1$ kg thức ăn B tốn $10$ nghìn đồng, loại này chứa $1$ đơn vị Vitamin X và $1$ đơn vị Vitamin Y. Nông trại yêu cầu mỗi ngày đàn gia súc phải được cung cấp ít nhất $10$ đơn vị Vitamin X và $7$ đơn vị Vitamin Y. Hỏi chi phí mua thức ăn thấp nhất mỗi ngày là bao nhiêu (đơn vị: nghìn đồng) để vẫn đảm bảo đủ lượng dinh dưỡng?],
  [85],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là số kg thức ăn A và B được mua ($x, y >= 0$).\
    Hàm chi phí cần đạt cực tiểu: $F(x,y) = 15x + 10y$ (nghìn đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Loại thức ăn*], [*Số lượng*], [*Vitamin X/kg*], [*Vitamin Y/kg*], [*Chi phí/kg*],
        [Thức ăn A], [$x$], [$2$], [$1$], [$15$],
        [Thức ăn B], [$y$], [$1$], [$1$], [$10$],
        [*Tối thiểu*], [], [*$>= 10$*], [*$>= 7$*], [*(Tối thiểu)*]
      )
    ]]
    #step[Ràng buộc về dinh dưỡng (ít nhất -> dấu $>=$):\
    - Vitamin X: $2x + y >= 10$\
    - Vitamin Y: $x + y >= 7$]
    #step[
      Vẽ hai đường thẳng $d_1: 2x+y=10$ và $d_2: x+y=7$. Giao điểm của hai đường thẳng này là $M(3;4)$.
      Miền nghiệm là đa giác không bị chặn nằm bên trên cả hai đường thẳng. Các đỉnh thuộc miền nghiệm bao gồm: $A(7;0)$, $M(3;4)$ và $B(0;10)$.
      
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Unbounded region shading
          line((12,0), (7,0), (3,4), (0,10), (0,12), (12,12), close: true, fill: col-bg-grn, stroke: none)
          
          line((-1, 0), (12, 0), mark: (end: ">"))
          line((0, -1), (0, 12), mark: (end: ">"))
          content((12, -0.4), [$x$])
          content((-0.4, 12), [$y$])
          
          line((6, -2), (-1, 12), stroke: (paint: gray, dash: "dashed"))
          line((10, -3), (-1, 8), stroke: (paint: gray, dash: "dashed"))
          
          circle((7,0), radius: 0.08, fill: black); content((7,-0.5), [$7$])
          circle((3,4), radius: 0.08, fill: black); content((2.5,3.7), [$M(3;4)$])
          circle((0,10), radius: 0.08, fill: black); content((-0.5,10), [$10$])
        })
      ]
    ]
    #step[Tính chi phí tại các đỉnh biên giới hạn:\
    - Tại $A(7;0)$: $F = 15(7) + 10(0) = 105$\
    - Tại $M(3;4)$: $F = 15(3) + 10(4) = 85$ (Nhỏ nhất)\
    - Tại $B(0;10)$: $F = 15(0) + 10(10) = 100$\
    Vậy chi phí tối thiểu là $85$ nghìn đồng (khi mua $3$ kg loại A và $4$ kg loại B).]
  ]
)

#tln(
  [Một nhà vườn muốn trộn hai loại phân bón A và B để bón cho cây trồng. Mỗi kg phân bón A giá $20$ nghìn đồng, cung cấp $3$ đơn vị Nitơ, $1$ đơn vị Kali và $1$ đơn vị Lân. Mỗi kg phân bón B giá $25$ nghìn đồng, cung cấp $1$ đơn vị Nitơ, $2$ đơn vị Kali và $1$ đơn vị Lân. Cây trồng cần được bón ít nhất $15$ đơn vị Nitơ, $10$ đơn vị Kali và $8$ đơn vị Lân. Hỏi chi phí nhỏ nhất nhà vườn phải bỏ ra là bao nhiêu (đơn vị: nghìn đồng)?],
  [170],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là lượng phân bón A và B cần trộn ($x >= 0, y >= 0$).\
    Chi phí: $F(x,y) = 20x + 25y$ (nghìn đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Loại phân bón*], [*Số lượng*], [*Nitơ/kg*], [*Kali/kg*], [*Lân/kg*], [*Chi phí/kg*],
        [Phân bón A], [$x$], [$3$], [$1$], [$1$], [$20$],
        [Phân bón B], [$y$], [$1$], [$2$], [$1$], [$25$],
        [*Tối thiểu*], [], [*$>= 15$*], [*$>= 10$*], [*$>= 8$*], [*(Tối thiểu)*]
      )
    ]]
    #step[Hệ ràng buộc 3 điều kiện khoáng chất tối thiểu:\
    - Nitơ: $3x + y >= 15$\
    - Kali: $x + 2y >= 10$\
    - Lân: $x + y >= 8$]
    #step[
      Vẽ ba đường thẳng trên cùng hệ toạ độ. Giao điểm tạo thành đường dích dắc giới hạn dưới của miền không bị chặn. Toạ độ các đỉnh thuộc miền biên là: 
      $(10;0)$, giao điểm $P(6;2)$ (của $x+2y=10$ và $x+y=8$), giao điểm $Q(3.5;4.5)$ (của $3x+y=15$ và $x+y=8$), và $(0;15)$.
      
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((12,0), (10,0), (6,2), (3.5,4.5), (0,15), (0,16), (12,16), close: true, fill: col-bg-red, stroke: none)
          
          line((-1, 0), (12, 0), mark: (end: ">"))
          line((0, -1), (0, 16), mark: (end: ">"))
          
          circle((10,0), radius: 0.08, fill: black); content((10,-0.6), [$10$])
          circle((6,2), radius: 0.08, fill: black); content((6.6,2), [$P(6;2)$])
          circle((3.5,4.5), radius: 0.08, fill: black); content((4.5,4.8), [$Q(3.5; 4.5)$])
          circle((0,15), radius: 0.08, fill: black); content((-0.6,15), [$15$])
        })
      ]
    ]
    #step[Tính chi phí tại các đỉnh biên:\
    - $F(10; 0) = 20(10) + 25(0) = 200$\
    - $F(6; 2) = 20(6) + 25(2) = 170$ (Nhỏ nhất)\
    - $F(3.5; 4.5) = 20(3.5) + 25(4.5) = 182.5$\
    - $F(0; 15) = 20(0) + 25(15) = 375$\
    Vậy chi phí thấp nhất là $170$ nghìn đồng (mua $6$ kg A và $2$ kg B).]
  ]
)

=== Dạng 3: Bài toán Đầu tư & Trồng trọt (Tối đa hoá Lợi nhuận - Khó)
Dạng bài này kết hợp nhiều điều kiện phức tạp hơn, miền nghiệm có thể là ngũ giác hoặc đa giác nhiều cạnh.

#tln(
  [Một nhà đầu tư có $1,2$ tỷ đồng muốn phân bổ vốn vào hai loại tài sản: Cổ phiếu A và Cổ phiếu B. Lợi nhuận dự kiến của cổ phiếu A là $15%$, của cổ phiếu B là $10%$. Tuy nhiên, để kiểm soát rủi ro, chuyên gia đánh giá điểm rủi ro của cổ phiếu A là $4$, của cổ phiếu B là $2$ và tổng điểm rủi ro danh mục không được vượt quá $36$. Ngoài ra, để tránh tập trung quá nhiều, quỹ quy định không đầu tư quá $800$ triệu đồng vào cổ phiếu A. Hỏi nhà đầu tư nên phân bổ vốn như thế nào (tính bằng trăm triệu đồng) để thu được lợi nhuận cao nhất?],
  [150],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là số tiền (trăm triệu đồng) đầu tư vào cổ phiếu A và B ($x >= 0, y >= 0$).\
    Hàm lợi nhuận: $F(x,y) = 15x + 10y$ (triệu đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Tài sản*], [*Vốn đầu tư*], [*Điểm rủi ro/đơn vị*], [*Giới hạn vốn A*], [*Lợi nhuận dự kiến*],
        [Cổ phiếu A], [$x$], [$4$], [$1$], [$15$],
        [Cổ phiếu B], [$y$], [$2$], [$0$], [$10$],
        [*Tối đa*], [*$<= 12$*], [*$<= 36$*], [*$<= 8$*], [*(Tối đa)*]
      )
    ]]
    #step[Hệ bất phương trình ràng buộc:\
    - Tổng vốn: $x + y <= 12$\
    - Điểm rủi ro: $4x + 2y <= 36 <=> 2x + y <= 18$\
    - Giới hạn vốn A: $x <= 8$]
    #step[
      Miền nghiệm là ngũ giác tạo bởi các đỉnh: $O(0;0)$, giao điểm $P(8;0)$ (của $x=8$ và trục hoành), giao điểm $Q(8;2)$ (của $x=8$ và $2x+y=18$), giao điểm $M(6;6)$ (của $x+y=12$ và $2x+y=18$), và điểm $N(0;12)$ trên trục tung.
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0,0), (8,0), (8,2), (6,6), (0,12), close: true, fill: col-bg-lt, stroke: none)
          line((-1, 0), (12, 0), mark: (end: ">"))
          line((0, -1), (0, 14), mark: (end: ">"))
          
          line((-1, 13), (13, -1), stroke: (paint: gray, dash: "dashed"))
          line((-1, 20), (10, -2), stroke: (paint: gray, dash: "dashed"))
          line((8, -1), (8, 14), stroke: (paint: gray, dash: "dashed"))
          
          circle((8,0), radius: 0.1, fill: black); content((8,-0.6), [$8$])
          circle((8,2), radius: 0.1, fill: black); content((8.6,2), [$Q(8;2)$])
          circle((6,6), radius: 0.1, fill: black); content((6.6,6.6), [$M(6;6)$])
          circle((0,12), radius: 0.1, fill: black); content((-0.6,12), [$12$])
        })
      ]
    ]
    #step[Tính lợi nhuận tại các đỉnh:\
    - $F(8; 0) = 15(8) + 10(0) = 120$\
    - $F(8; 2) = 15(8) + 10(2) = 140$\
    - $F(6; 6) = 15(6) + 10(6) = 150$ (Cao nhất)\
    - $F(0; 12) = 15(0) + 10(12) = 120$\
    Vậy cần đầu tư $600$ triệu vào cổ phiếu A và $600$ triệu vào B để đạt lợi nhuận cực đại $150$ triệu đồng.]
  ]
)

#tln(
  [Một hộ nông dân có $10$ hecta đất nông nghiệp để trồng ngô và khoai tây. Trồng $1$ hecta ngô cho lợi nhuận $50$ triệu đồng, tốn $2$ ngày công chăm sóc và $1$ đơn vị lượng nước. Trồng $1$ hecta khoai tây cho lợi nhuận $40$ triệu đồng, tốn $1$ ngày công chăm sóc và $3$ đơn vị lượng nước. Do điều kiện nhân lực và thuỷ lợi, nông hộ có tối đa $14$ ngày công và chỉ có hạn ngạch cấp $24$ đơn vị nước. Diện tích đất trồng là bao nhiêu hecta mỗi loại để đạt lợi nhuận lớn nhất?],
  [440],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là số hecta đất trồng ngô và khoai tây ($x >= 0, y >= 0$).\
    Lợi nhuận: $F(x,y) = 50x + 40y$ (triệu đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Loại cây*], [*Diện tích*], [*Quỹ đất/ha*], [*Ngày công/ha*], [*Nước/ha*], [*Lợi nhuận/ha*],
        [Ngô], [$x$], [$1$], [$2$], [$1$], [$50$],
        [Khoai tây], [$y$], [$1$], [$1$], [$3$], [$40$],
        [*Tối đa*], [], [*$<= 10$*], [*$<= 14$*], [*$<= 24$*], [*(Tối đa)*]
      )
    ]]
    #step[Hệ ràng buộc 3 điều kiện:\
    - Diện tích đất: $x + y <= 10$\
    - Nhân công: $2x + y <= 14$\
    - Nước tưới: $x + 3y <= 24$]
    #step[
      Miền nghiệm là một ngũ giác với các đỉnh: $O(0;0)$, $A(7;0)$ (giao $2x+y=14$ với $O x$), $B(4;6)$ (giao $x+y=10$ và $2x+y=14$), $C(3;7)$ (giao $x+y=10$ và $x+3y=24$), và $D(0;8)$ (giao $x+3y=24$ với $O y$).
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0,0), (7,0), (4,6), (3,7), (0,8), close: true, fill: col-bg-amb, stroke: none)
          line((-1, 0), (12, 0), mark: (end: ">"))
          line((0, -1), (0, 12), mark: (end: ">"))
          
          line((-1, 11), (11, -1), stroke: (paint: gray, dash: "dashed"))
          line((-1, 16), (8, -2), stroke: (paint: gray, dash: "dashed"))
          line((-1, 25/3), (12, 4), stroke: (paint: gray, dash: "dashed"))
          
          circle((7,0), radius: 0.1, fill: black); content((7,-0.6), [$7$])
          circle((4,6), radius: 0.1, fill: black); content((4.6,6.2), [$B(4;6)$])
          circle((3,7), radius: 0.1, fill: black); content((3.6,7.5), [$C(3;7)$])
          circle((0,8), radius: 0.1, fill: black); content((-0.6,8), [$8$])
        })
      ]
    ]
    #step[Tính lợi nhuận:\
    - $F(7;0) = 50(7) + 40(0) = 350$\
    - $F(4;6) = 50(4) + 40(6) = 440$ (Lớn nhất)\
    - $F(3;7) = 50(3) + 40(7) = 430$\
    - $F(0;8) = 50(0) + 40(8) = 320$\
    Nông dân cần trồng $4$ ha ngô và $6$ ha khoai tây để lãi $440$ triệu đồng.]
  ]
)

=== Dạng 4: Bài toán Điều kiện Nguyên & Vận Tải (Vận dụng cao)

#tln(
  [Để phục vụ chuyến tham quan dã ngoại cho $140$ học sinh và cần chở theo $9$ tấn hành lý, nhà trường cần thuê hai loại xe A và B. Xe A chở được $20$ người và $1$ tấn hàng với giá thuê $4$ triệu đồng/chuyến. Xe B chở được $10$ người và $2$ tấn hàng với giá thuê $3$ triệu đồng/chuyến. Biết trung tâm cho thuê xe chỉ có $10$ chiếc xe loại A và $9$ chiếc xe loại B. Hỏi nhà trường cần thuê bao nhiêu xe mỗi loại để chi phí thuê là thấp nhất (tính bằng triệu đồng)?],
  [30],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là số xe loại A và B cần thuê. *Lưu ý điều kiện nguyên*: $x, y in NN$ và $x <= 10, y <= 9$.\
    Hàm chi phí: $F(x,y) = 4x + 3y$ (triệu đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Loại xe*], [*Số lượng*], [*Khách/xe*], [*Hàng/xe*], [*Giới hạn tồn*], [*Chi phí/xe*],
        [Xe A], [$x$], [$20$], [$1$], [$<= 10$], [$4$],
        [Xe B], [$y$], [$10$], [$2$], [$<= 9$], [$3$],
        [*Tối thiểu*], [], [*$>= 140$*], [*$>= 9$*], [*Nguyên*], [*(Tối thiểu)*]
      )
    ]]
    #step[Hệ bất phương trình tải trọng:\
    - Chở khách: $20x + 10y >= 140 <=> 2x + y >= 14$\
    - Chở hàng: $x + 2y >= 9$]
    #step[
      Tìm giao điểm của hai đường biên thẳng: $2x+y=14$ và $x+2y=9$ là $M(19/3; 4/3) approx M(6.33; 1.33)$. 
      Vì $(x, y)$ phải là số nguyên, điểm cực tiểu sẽ không nằm đúng tại giao điểm hình học mà là điểm nguyên nằm kề gần nhất bên trong miền nghiệm, thoả mãn $x <= 10$ và $y <= 9$.
      
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((12,0), (9,0), (19/3, 4/3), (0,14), (0,16), (12,16), close: true, fill: col-bg-red, stroke: none)
          line((-1, 0), (12, 0), mark: (end: ">"))
          line((0, -1), (0, 16), mark: (end: ">"))
          
          line((-1, 16), (8, -2), stroke: (paint: gray, dash: "dashed"))
          line((-1, 5), (11, -1), stroke: (paint: gray, dash: "dashed"))
          
          circle((19/3, 4/3), radius: 0.1, fill: black); content((19/3 + 1, 4/3), [$M(6.33; 1.33)$])
          circle((6, 2), radius: 0.15, fill: red); content((6.6, 2.3), text(red)[$T(6;2)$])
        })
      ]
      
      Kiểm tra các điểm nguyên trong lân cận giao điểm:\
      - Tại $(x=6; y=2)$: Kiểm tra $2(6)+2 = 14 >= 14$ (thỏa mãn) và $6+2(2) = 10 >= 9$ (thỏa mãn). Chi phí $F = 4(6) + 3(2) = 30$.\
      - Tại $(x=7; y=1)$: Kiểm tra $2(7)+1 = 15 >= 14$ (thỏa mãn) và $7+2(1) = 9 >= 9$ (thỏa mãn). Chi phí $F = 4(7) + 3(1) = 31$.\
      - Tại $(x=5; y=4)$: Kiểm tra $10+4 = 14$ và $5+8 = 13 >= 9$. Chi phí $F = 4(5) + 3(4) = 32$.
    ]
    #step[Từ các kết quả thử, chi phí tối thiểu đạt được là $30$ triệu đồng khi thuê $6$ xe loại A và $2$ xe loại B.]
  ]
)

#tln(
  [Một mỏ quặng khai thác hai hầm hố X và Y. Để vận hành hầm X tốn chi phí $200$ triệu đồng/ngày, hầm Y tốn $150$ triệu đồng/ngày. Mỗi ngày hoạt động, hầm X cho ra $1$ tấn quặng chất lượng cao, $2$ tấn chất lượng vừa và $3$ tấn chất lượng thấp. Hầm Y cho ra $2$ tấn cao cấp, $1$ tấn vừa và $1$ tấn thấp. Công ty hiện đang nhận đơn hàng cần ít nhất $12$ tấn quặng cao cấp, $9$ tấn quặng vừa và $10$ tấn quặng thấp. Công ty cần bố trí số ngày hoạt động của mỗi hầm là bao nhiêu để đáp ứng đơn hàng với chi phí thấp nhất? Hỏi chi phí đó là bao nhiêu (triệu đồng)?],
  [1150],
  loigiai: [
    #step[Gọi $x, y$ lần lượt là số ngày vận hành hầm X và Y ($x, y >= 0$).\
    Hàm chi phí: $F(x,y) = 200x + 150y$ (triệu đồng).
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        fill: (_, row) => if row == 0 { col-bg-lt } else if row == 3 { col-bg-red } else { none },
        [*Hầm quặng*], [*Ngày hoạt động*], [*Cao cấp/ngày*], [*Trung cấp/ngày*], [*Thấp cấp/ngày*], [*Chi phí/ngày*],
        [Hầm X], [$x$], [$1$], [$2$], [$3$], [$200$],
        [Hầm Y], [$y$], [$2$], [$1$], [$1$], [$150$],
        [*Yêu cầu*], [], [*$>= 12$*], [*$>= 9$*], [*$>= 10$*], [*(Tối thiểu)*]
      )
    ]]
    #step[Hệ bất phương trình sản lượng:\
    - Cao cấp: $x + 2y >= 12$\
    - Trung cấp: $2x + y >= 9$\
    - Thấp cấp: $3x + y >= 10$]
    #step[
      Đường gấp khúc miền nghiệm là giao của các nửa mặt phẳng:
      - Cắt trục tung tại $A(0; 10)$ (vì các giao tung lớn nhất là $6, 9, 10$).
      - Giao $3x+y=10$ và $2x+y=9$ tại $B(1; 7)$.
      - Giao $2x+y=9$ và $x+2y=12$ tại $C(2; 5)$.
      - Cắt trục hoành tại $D(12; 0)$ (giao hoành lớn nhất là $12, 4.5, 3.3$).
      
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((15,0), (12,0), (2,5), (1,7), (0,10), (0,12), (15,12), close: true, fill: col-bg-grn, stroke: none)
          line((-1, 0), (15, 0), mark: (end: ">"))
          line((0, -1), (0, 12), mark: (end: ">"))
          
          line((-1, 6.5), (14, -1), stroke: (paint: gray, dash: "dashed"))
          line((-1, 11), (5.5, -2), stroke: (paint: gray, dash: "dashed"))
          line((-1, 13), (4, -2), stroke: (paint: gray, dash: "dashed"))
          
          circle((12,0), radius: 0.1, fill: black); content((12,-0.6), [$12$])
          circle((2,5), radius: 0.1, fill: black); content((2.7,5), [$C(2;5)$])
          circle((1,7), radius: 0.1, fill: black); content((1.7,7), [$B(1;7)$])
          circle((0,10), radius: 0.1, fill: black); content((-0.6,10), [$10$])
        })
      ]
    ]
    #step[Tính chi phí tại các đỉnh:\
    - $F(12; 0) = 200(12) + 150(0) = 2400$\
    - $F(2; 5) = 200(2) + 150(5) = 1150$ (Nhỏ nhất)\
    - $F(1; 7) = 200(1) + 150(7) = 1250$\
    - $F(0; 10) = 200(0) + 150(10) = 1500$\
    Vậy cần vận hành hầm X trong $2$ ngày và hầm Y trong $5$ ngày để tối ưu chi phí ở mức $1150$ triệu đồng.]
  ]
)
