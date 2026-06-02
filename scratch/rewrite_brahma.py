import os

content = r"""#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ"
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm),
)

#show: stexgv-doc.with(
  doc-type: "book",
  title: "CHUYÊN ĐỀ OXYZ: BRAHMAGUPTA & BRETSCHNEIDER",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue,
)

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════

= Tầm Nhìn Giáo Sư: Brahmagupta & Bretschneider Trong Không Gian 3D

#lythuyet[
  *Bộ Đôi Vũ Khí Bí Mật*

  - *Brahmagupta (thế kỉ VII):* Diện tích tứ giác *nội tiếp* $A B C D$ (biết 4 cạnh $a, b, c, d$):
  $ S_"Brahmagupta" = sqrt((p-a)(p-b)(p-c)(p-d)), p = frac(a+b+c+d, 2). $
  - *Bretschneider (1842):* Tổng quát hóa cho *mọi tứ giác* (biết 4 cạnh và tổng 2 góc đối diện $theta = A+C$):
  $ S_"Bret" = sqrt((p-a)(p-b)(p-c)(p-d) - a b c d cos^2(theta/2)). $
  Khi $A + C = 180°$ (tứ giác nội tiếp), $cos(90°) = 0$ $=>$ Bretschneider $=>$ Brahmagupta.

  *Bản đồ nhận diện nhanh trong Oxyz:*
  - 4 điểm thuộc giao tuyến (Mặt Cầu $inter$ Mặt Phẳng) $=>$ nằm trên *đường tròn* $=>$ dùng *Brahmagupta*.
  - 4 điểm thuộc mặt phẳng cắt *Mặt Trụ*, *Hình Hộp*, *khung phẳng nghiêng*... nhưng không có dấu hiệu nội tiếp tròn $=>$ ưu tiên *Bretschneider*.
  - Nếu đề cho tọa độ, quy trình chuẩn là: tính 4 cạnh $->$ tính hoặc nhận ra tổng 2 góc đối $->$ thay vào công thức đúng.
]

// ─────────────────────────────────────────────────────────────
== Bài 1 — Vòm Kính Radar (Mặt Cầu cắt Mặt Phẳng → Brahmagupta)
// ─────────────────────────────────────────────────────────────

#tln(
  [Một trạm radar thời tiết có dạng mặt cầu $(S): (x-1)^2 + (y-2)^2 + (z-3)^2 = 100$. Người ta thi công cắt vát vòm radar bằng một mặt phẳng $(P): 2x - 2y + z + 15 = 0$ để chừa ra một lỗ hổng hình tròn. Trên đường viền của lỗ hổng này, các kỹ sư khoan 4 chốt neo theo thứ tự $A, B, C, D$ và căng một tấm lưới che chắn. Người thợ đo được khoảng cách giữa các chốt neo lần lượt là $A B = 3$ m, $B C = 4$ m, $C D = 5$ m, $D A = 6$ m. Hãy tính diện tích bề mặt của tấm lưới tứ giác vừa căng (làm tròn đến hàng phần trăm).],
  [18.97],
  fig: align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *

      // Box 3D
      let pt000 = (-3.5, -2.5)
      let pt100 = (3.5, -2.5)
      let pt010 = (-1.5, -1.0)
      let pt110 = (5.5, -1.0)
      let pt001 = (-3.5, 3.5)
      let pt101 = (3.5, 3.5)
      let pt011 = (-1.5, 5.0)
      let pt111 = (5.5, 5.0)

      // Back lines
      line(pt010, pt110, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt011, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt000, stroke: (paint: gray.lighten(40%), dash: "dashed"))

      // Sphere
      circle((1.0, 1.2), radius: 2.2, stroke: (paint: gray.lighten(10%), thickness: 1.2pt))
      arc((3.2, 1.2), radius: (2.2, 0.5), start: 0deg, stop: 180deg, stroke: (
        paint: gray.lighten(30%),
        thickness: 0.8pt,
        dash: "dashed",
      ))
      arc((-1.2, 1.2), radius: (2.2, 0.5), start: 180deg, stop: 360deg, stroke: (
        paint: gray.lighten(30%),
        thickness: 0.8pt,
      ))

      // Ellipse plane
      let cy = 2.0
      let cx = 1.0
      let ex = 1.8
      let ey = 0.5
      let k = 0.5523

      bezier((cx - ex, cy), (cx + ex, cy), (cx - ex, cy - ey * k), (cx + ex, cy - ey * k), stroke: (paint: rgb("1F618D"), thickness: 1.5pt))
      bezier((cx - ex, cy), (cx + ex, cy), (cx - ex, cy + ey * k), (cx + ex, cy + ey * k), stroke: (paint: rgb("1F618D"), thickness: 1pt, dash: "dashed"))

      content((cx + ex + 0.3, cy + 0.4), text(size: 9pt, fill: rgb("1F618D"), weight: "bold")[$P$])

      // Quad
      let pt-a = (cx - 1.5, cy - 0.28)
      let pt-b = (cx + 0.4, cy - 0.48)
      let pt-c = (cx + 1.6, cy + 0.2)
      let pt-d = (cx - 0.6, cy + 0.45)

      line(pt-a, pt-b, pt-c, pt-d, close: true, fill: rgb("C0392B").transparentize(80%), stroke: none)
      line(pt-a, pt-b, stroke: (paint: rgb("C0392B"), thickness: 1.5pt))
      line(pt-b, pt-c, stroke: (paint: rgb("C0392B"), thickness: 1.5pt))
      line(pt-c, pt-d, stroke: (paint: rgb("C0392B"), thickness: 1.2pt, dash: "dashed"))
      line(pt-d, pt-a, stroke: (paint: rgb("C0392B"), thickness: 1.2pt, dash: "dashed"))

      content((cx - 0.5, cy - 0.5), text(size: 8pt)[$3$])
      content((cx + 1.2, cy - 0.3), text(size: 8pt)[$4$])

      for pt in (pt-a, pt-b, pt-c, pt-d) {
        circle(pt, radius: 3pt, fill: white, stroke: 1.2pt + black)
      }
      content(pt-a, $A$, anchor: "east", padding: 7pt)
      content(pt-b, $B$, anchor: "north", padding: 7pt)
      content(pt-c, $C$, anchor: "west", padding: 7pt)
      content(pt-d, $D$, anchor: "south", padding: 7pt)

      // Front lines of box
      line(pt000, pt100, pt101, pt001, close: true, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt100, pt110, pt111, pt101, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt001, pt011, pt111, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
    })
  ],
  fig-pos: "center",
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Nhận Diện Tứ Giác Nội Tiếp Trong Không Gian])[
      - Dữ kiện phương trình mặt cầu và mặt phẳng cồng kềnh là *bẫy*. Học sinh yếu sẽ mải tìm tọa độ $A, B, C, D$.
      - *Chìa khóa:* Giao tuyến (Mặt Cầu $inter$ Mặt Phẳng) luôn là một *đường tròn*. Bốn chốt neo nằm trên đường tròn đó $=> A B C D$ là *tứ giác nội tiếp* $=>$ dùng *Brahmagupta* ngay!
    ]

    #step[Bước 1: Xác định loại tứ giác]
    Vì $A, B, C, D$ đồng thuộc giao tuyến của Mặt Cầu $(S)$ và Mặt Phẳng $(P)$ — là một đường tròn — nên $A B C D$ là tứ giác nội tiếp.

    #step[Bước 2: Tính nửa chu vi]
    $ p = frac(3+4+5+6, 2) = 9 upright(" m"). $

    #step[Bước 3: Áp dụng Brahmagupta]
    $
      S & = sqrt((p-a)(p-b)(p-c)(p-d)) \
        & = sqrt(6 dot 5 dot 4 dot 3) = sqrt(360) = 6sqrt(10) approx #calc.round(calc.sqrt(360), digits: 2) upright(" m")^2.
    $

    #nhanxet[
      Điều kỳ diệu: Phương trình mặt cầu và mặt phẳng không liên quan đến kết quả! Đây là nghệ thuật "chôn" dữ kiện giả — đặc trưng của đề thi phân loại 9-10 điểm.
    ]
  ],
)

// ─────────────────────────────────────────────────────────────
== Bài 2 — Thể Tích Khuôn Đúc (Chóp Nội Tiếp Cầu → Brahmagupta)
// ─────────────────────────────────────────────────────────────

#tln(
  [Một kỹ sư thiết kế một khuôn đúc hình chóp $S.A B C D$ được đặt gọn bên trong một mặt cầu ngoại tiếp $(T)$ bán kính $R=10$ cm. Đỉnh $S$ của khuôn nằm trên mặt cầu. Bốn đỉnh đáy $A, B, C, D$ nằm trên một mặt phẳng $(P)$ cắt mặt cầu theo giao tuyến là một đường tròn. Biết rằng khoảng cách từ $S$ đến mặt phẳng đáy $(P)$ là $12$ cm, và độ dài các cạnh đáy của khuôn đúc lần lượt là $a=7$ cm, $b=15$ cm, $c=20$ cm, $d=24$ cm. Hãy tính thể tích của khuôn đúc khối chóp $S.A B C D$.],
  [936],
  fig: align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *

      // Box 3D
      let pt000 = (-3.5, -2.5)
      let pt100 = (3.5, -2.5)
      let pt010 = (-1.5, -1.0)
      let pt110 = (5.5, -1.0)
      let pt001 = (-3.5, 3.5)
      let pt101 = (3.5, 3.5)
      let pt011 = (-1.5, 5.0)
      let pt111 = (5.5, 5.0)

      // Back lines
      line(pt010, pt110, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt011, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt000, stroke: (paint: gray.lighten(40%), dash: "dashed"))

      // Sphere
      circle((1.0, 1.2), radius: 2.2, stroke: (paint: gray.lighten(10%), thickness: 1.2pt))
      arc((3.2, 1.2), radius: (2.2, 0.5), start: 0deg, stop: 180deg, stroke: (
        paint: gray.lighten(30%),
        thickness: 0.8pt,
        dash: "dashed",
      ))
      arc((-1.2, 1.2), radius: (2.2, 0.5), start: 180deg, stop: 360deg, stroke: (
        paint: gray.lighten(30%),
        thickness: 0.8pt,
      ))

      // Ellipse plane for base
      let cy = 0.0
      let cx = 1.0
      let ex = 1.8
      let ey = 0.5
      let k = 0.5523

      bezier((cx - ex, cy), (cx + ex, cy), (cx - ex, cy - ey * k), (cx + ex, cy - ey * k), stroke: (paint: rgb("1F618D"), thickness: 1.5pt))
      bezier((cx - ex, cy), (cx + ex, cy), (cx - ex, cy + ey * k), (cx + ex, cy + ey * k), stroke: (paint: rgb("1F618D"), thickness: 1pt, dash: "dashed"))

      // Pyramid base quad
      let pt-a = (cx - 1.5, cy - 0.28)
      let pt-b = (cx + 0.4, cy - 0.48)
      let pt-c = (cx + 1.6, cy + 0.2)
      let pt-d = (cx - 0.6, cy + 0.45)
      let pt-s = (cx, cy + 3.0)

      line(pt-a, pt-b, pt-c, pt-d, close: true, fill: rgb("E67E22").transparentize(80%), stroke: none)
      line(pt-a, pt-b, stroke: (paint: rgb("E67E22"), thickness: 1.2pt))
      line(pt-b, pt-c, stroke: (paint: rgb("E67E22"), thickness: 1.2pt))
      line(pt-c, pt-d, stroke: (paint: rgb("E67E22"), thickness: 1.0pt, dash: "dashed"))
      line(pt-d, pt-a, stroke: (paint: rgb("E67E22"), thickness: 1.0pt, dash: "dashed"))
      
      // Pyramid edges
      line(pt-s, pt-a, stroke: (paint: rgb("D35400"), thickness: 1.2pt))
      line(pt-s, pt-b, stroke: (paint: rgb("D35400"), thickness: 1.2pt))
      line(pt-s, pt-c, stroke: (paint: rgb("D35400"), thickness: 1.2pt))
      line(pt-s, pt-d, stroke: (paint: rgb("D35400"), thickness: 1.0pt, dash: "dashed"))

      // Height line
      line(pt-s, (cx, cy), stroke: (paint: rgb("27AE60"), thickness: 1.0pt, dash: "dashed"))
      content((cx + 0.2, cy + 1.5), text(size: 8pt, fill: rgb("27AE60"))[$12$])

      for pt in (pt-a, pt-b, pt-c, pt-d, pt-s) {
        circle(pt, radius: 3pt, fill: white, stroke: 1.2pt + black)
      }
      content(pt-a, $A$, anchor: "east", padding: 7pt)
      content(pt-b, $B$, anchor: "north", padding: 7pt)
      content(pt-c, $C$, anchor: "west", padding: 7pt)
      content(pt-d, $D$, anchor: "south", padding: 7pt)
      content(pt-s, $S$, anchor: "south", padding: 7pt)

      // Front lines of box
      line(pt000, pt100, pt101, pt001, close: true, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt100, pt110, pt111, pt101, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt001, pt011, pt111, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
    })
  ],
  fig-pos: "center",
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Bóc Tách Bài Toán Thể Tích])[
      - Công thức: $V = frac(1, 3) dot S_("đáy") dot h$, trong đó $h=12$ đã biết.
      - Chỉ cần tính $S_("đáy")$ của tứ giác $A B C D$.
      - "Mặt cầu ngoại tiếp hình chóp" $=>$ các đỉnh đáy $A, B, C, D$ cùng thuộc mặt cầu và đồng phẳng $=>$ *nội tiếp đường tròn* $=>$ Brahmagupta!
    ]

    #step[Bước 1: Khẳng định đáy là tứ giác nội tiếp]
    Các đỉnh $A, B, C, D$ thuộc mặt cầu $(T)$ và đồng phẳng $(P)$, nên chúng thuộc giao tuyến — một đường tròn. Vậy $A B C D$ là tứ giác nội tiếp.

    #step[Bước 2: Tính diện tích đáy (Brahmagupta)]
    Nửa chu vi: $p = frac(7+15+20+24, 2) = 33$ cm.
    $
      S_("đáy") & = sqrt((33-7)(33-15)(33-20)(33-24)) \
                & = sqrt(26 dot 18 dot 13 dot 9) = sqrt(4 dot 169 dot 81) = 2 dot 13 dot 9 = 234 upright(" cm")^2.
    $

    #step[Bước 3: Tính thể tích]
    $ V = frac(1, 3) dot 234 dot 12 = 936 upright(" cm")^3. $
  ],
)

// ─────────────────────────────────────────────────────────────
= Siêu Vũ Khí Bretschneider: Khi Tứ Giác Không Nội Tiếp
// ─────────────────────────────────────────────────────────────

#lythuyet[
  *Tại sao cần Bretschneider trong Oxyz?*

  Nếu 4 điểm nằm trên *Mặt Trụ* bị cắt bởi mặt phẳng không vuông góc trục, giao tuyến là *ellipse*, không phải đường tròn. Tứ giác tạo thành *không nội tiếp* đường tròn nào $=>$ Brahmagupta vô dụng $=>$ cần Bretschneider.

  *Công thức Bretschneider:*
  $ S = sqrt((p-a)(p-b)(p-c)(p-d) - a b c d dot cos^2 frac(A+C, 2)) $
  với $A, C$ là hai góc đối của tứ giác.

  *Quy trình 4 bước khi đề cho tọa độ:*
  - Bước 1: Kiểm tra 4 điểm có đồng phẳng không, hoặc đọc ngay bối cảnh để biết chúng nằm trên cùng một mặt phẳng cắt.
  - Bước 2: Dùng công thức khoảng cách để tính 4 cạnh $a, b, c, d$.
  - Bước 3: Dùng tích vô hướng để tính một hoặc hai góc đối, từ đó suy ra $A+C$.
  - Bước 4: Chỉ khi nào chứng minh được nội tiếp đường tròn mới rút về Brahmagupta; nếu không thì giữ nguyên Bretschneider.
]

// ─────────────────────────────────────────────────────────────
== Bài 3 — Tấm Phao Cứu Trợ Trên Trụ Silo (Mặt Trụ → Bretschneider)
// ─────────────────────────────────────────────────────────────

#tln(
  [Một bồn chứa ngũ cốc hình *trụ đứng* có trục là trục $O z$, phương trình mặt trụ $x^2 + y^2 = 25$. Người ta cắt bồn bằng mặt phẳng nghiêng $(P): z = x + 3$ để tạo một cửa thoát hình ellipse. Trên đường viền ellipse đó, người thợ đánh dấu 4 điểm $A, B, C, D$ (theo thứ tự) lần lượt là các điểm có tọa độ:
    $A(5; 0; 8)$, $B(0; 5; 3)$, $C(-5; 0; -2)$, $D(0; -5; 3)$.
    Hãy tính diện tích của tấm phao chắn $A B C D$ bằng công thức Bretschneider (làm tròn đến hàng phần trăm).],
  [70.71],
  fig: align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *

      // Box 3D
      let pt000 = (-3.5, -3.5)
      let pt100 = (3.5, -3.5)
      let pt010 = (-1.5, -2.0)
      let pt110 = (5.5, -2.0)
      let pt001 = (-3.5, 4.0)
      let pt101 = (3.5, 4.0)
      let pt011 = (-1.5, 5.5)
      let pt111 = (5.5, 5.5)

      // Back lines
      line(pt010, pt110, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt011, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt000, stroke: (paint: gray.lighten(40%), dash: "dashed"))

      // Cylinder body
      let r = 2.0
      let hbot = -2.5
      let htop = 3.0
      let ey = 0.5
      let cx = 1.0

      line((cx - r, hbot), (cx - r, htop), stroke: (paint: gray.lighten(20%), thickness: 1.2pt))
      line((cx + r, hbot), (cx + r, htop), stroke: (paint: gray.lighten(20%), thickness: 1.2pt))

      arc((cx - r, hbot), radius: (r, ey), start: 180deg, stop: 360deg, stroke: (paint: gray.lighten(20%), thickness: 1.2pt))
      arc((cx + r, hbot), radius: (r, ey), start: 0deg, stop: 180deg, stroke: (
        paint: gray.lighten(50%),
        thickness: 0.8pt,
        dash: "dashed",
      ))

      // Ellipse plane slanted
      let pt-a2 = (cx + r, 2.5)
      let pt-b3 = (cx - 0.2, 0.45)
      let pt-c2 = (cx - r, -1.0)
      let pt-d3 = (cx + 0.2, 0.45)

      line(pt-a2, pt-b3, pt-c2, pt-d3, close: true, fill: rgb("1F618D").transparentize(80%), stroke: none)
      line(pt-a2, pt-b3, stroke: (paint: rgb("C0392B"), thickness: 1.5pt))
      line(pt-b3, pt-c2, stroke: (paint: rgb("C0392B"), thickness: 1.5pt))
      line(pt-c2, pt-d3, stroke: (paint: rgb("C0392B"), thickness: 1.5pt, dash: "dashed"))
      line(pt-d3, pt-a2, stroke: (paint: rgb("C0392B"), thickness: 1.5pt, dash: "dashed"))

      content((cx + r + 0.4, 2.0), text(size: 8pt, fill: rgb("8E44AD"))[$angle A$])
      content((cx - r - 0.4, -1.0), text(size: 8pt, fill: rgb("8E44AD"))[$angle C$])

      for (pt, lbl, anch) in (
        (pt-a2, $A$, "west"),
        (pt-b3, $B$, "east"),
        (pt-c2, $C$, "east"),
        (pt-d3, $D$, "west"),
      ) {
        circle(pt, radius: 3pt, fill: white, stroke: 1.2pt + black)
        content(pt, lbl, anchor: anch, padding: 7pt)
      }

      line((cx, hbot - 0.3), (cx, htop + 1.0), stroke: (paint: black, dash: "dashed"), mark: (end: "stealth"))
      content((cx + 0.2, htop + 1.1), $z$, text(weight: "bold"))

      // Front lines of box
      line(pt000, pt100, pt101, pt001, close: true, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt100, pt110, pt111, pt101, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt001, pt011, pt111, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
    })
  ],
  fig-pos: "center",
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Nhận Diện Khi Nào Phải Dùng Bretschneider])[
      - Giao tuyến của Mặt *Trụ* và mặt phẳng nghiêng là một *ellipse*, không phải đường tròn.
      - Tứ giác $A B C D$ nội tiếp trong *ellipse*, nhưng *không nội tiếp trong đường tròn nào*.
      - Với bài có tọa độ, ta không đoán góc bằng mắt; ta tính trực tiếp qua tích vô hướng để đưa về đúng dữ kiện mà Bretschneider cần.
    ]

    #step[Bước 1: Tính 4 độ dài cạnh]
    $
      A B & = sqrt((5-0)^2 + (0-5)^2 + (8-3)^2) = sqrt(25+25+25) = 5sqrt(3). \
      B C & = sqrt((0+5)^2 + (5-0)^2 + (3+2)^2) = sqrt(25+25+25) = 5sqrt(3). \
      C D & = sqrt((-5-0)^2 + (0+5)^2 + (-2-3)^2) = sqrt(25+25+25) = 5sqrt(3). \
      D A & = sqrt((0-5)^2 + (-5-0)^2 + (3-8)^2) = sqrt(25+25+25) = 5sqrt(3).
    $
    $=> A B C D$ là *hình thoi* với cạnh $a = b = c = d = 5sqrt(3)$.

    #step[Bước 2: Tính nửa chu vi]
    $ p = frac(4 dot 5sqrt(3), 2) = 10sqrt(3). $

    #step[Bước 3: Tính góc đối qua tích vô hướng]
    Xét tại đỉnh $A$:
    $ vec(A B) = (-5; 5; -5), vec(A D) = (-5; -5; -5). $
    Khi đó:
    $ vec(A B) dot vec(A D) = 25 - 25 + 25 = 25. $
    Mặt khác:
    $ |vec(A B)| = |vec(A D)| = 5sqrt(3). $
    Suy ra:
    $ cos A = frac(25, (5sqrt(3))(5sqrt(3))) = frac(1, 3). $

    Vì $A B C D$ là hình thoi nên $A = C$, do đó:
    $ frac(A+C, 2) = A, cos^2 frac(A+C, 2) = frac(1, 9). $

    #step[Bước 4: Áp dụng Bretschneider]
    $
      S &= sqrt((p-a)^4 - a^4 cos^2 frac(A+C, 2)) \
      &= sqrt((5sqrt(3))^4 - (5sqrt(3))^4 dot frac(1, 9)) \
      &= sqrt(75^2 dot frac(8, 9)) = 75 dot frac(2sqrt(2), 3) = 50sqrt(2) approx #calc.round(50 * calc.sqrt(2), digits: 2).
    $

    #nhanxet[
      Bài này vẫn có thể giải bằng công thức diện tích hình thoi qua hai đường chéo. Tuy nhiên Bretschneider cho thấy một điều quan trọng hơn: *mọi tứ giác đồng phẳng trong Oxyz, miễn tính được 4 cạnh và tổng hai góc đối, đều có thể gom về cùng một siêu công cụ*.
    ]
  ],
)

// ─────────────────────────────────────────────────────────────
== Bài 4 — Khung Kính Nghiêng Trên Mặt Phẳng $z = x$ (Hình Bình Hành Lệch → Bretschneider)
// ─────────────────────────────────────────────────────────────

#tln(
  [Trong không gian $O x y z$, một khung kính nghiêng có bốn đỉnh $A(0; 0; 0)$, $B(4; 0; 4)$, $C(5; 2; 5)$, $D(1; 2; 1)$. Bốn điểm này cùng nằm trên mặt phẳng $z = x$ và tạo thành một tứ giác không nội tiếp đường tròn. Hãy tính diện tích tứ giác $A B C D$ bằng ý tưởng Bretschneider (làm tròn đến hàng phần trăm).],
  [11.31],
  fig: align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *

      // Box 3D
      let pt000 = (-2.0, -1.5)
      let pt100 = (5.0, -1.5)
      let pt010 = (0.0, 0.0)
      let pt110 = (7.0, 0.0)
      let pt001 = (-2.0, 5.0)
      let pt101 = (5.0, 5.0)
      let pt011 = (0.0, 6.5)
      let pt111 = (7.0, 6.5)

      // Axes
      line(pt010, pt110, stroke: (paint: gray.lighten(10%), dash: "dashed"), mark: (end: "stealth"))
      content((7.2, 0.2), $x$, text(weight: "bold"))
      line(pt010, pt000, stroke: (paint: gray.lighten(10%), dash: "dashed"), mark: (end: "stealth"))
      content((-2.2, -1.7), $y$, text(weight: "bold"))
      line(pt010, pt011, stroke: (paint: gray.lighten(10%), dash: "dashed"), mark: (end: "stealth"))
      content((0.2, 6.7), $z$, text(weight: "bold"))
      content((-0.3, -0.3), $O$, text(weight: "bold"))

      // Draw Parallelogram
      // Coordinate mapping approx: p(x,y,z) = (x - 0.5*y, z - 0.3*y)
      let p(x, y, z) = (x - 0.5 * y, z - 0.3 * y)
      
      let pA = p(0, 0, 0)
      let pB = p(4, 0, 4)
      let pC = p(5, 2, 5)
      let pD = p(1, 2, 1)

      line(pA, pB, pC, pD, close: true, fill: rgb("2ECC71").transparentize(70%), stroke: none)
      line(pA, pB, stroke: (paint: rgb("27AE60"), thickness: 1.5pt))
      line(pB, pC, stroke: (paint: rgb("27AE60"), thickness: 1.5pt))
      line(pC, pD, stroke: (paint: rgb("27AE60"), thickness: 1.5pt))
      line(pD, pA, stroke: (paint: rgb("27AE60"), thickness: 1.5pt))

      for (pt, lbl, anch) in (
        (pA, $A$, "north-west"),
        (pB, $B$, "south-east"),
        (pC, $C$, "south"),
        (pD, $D$, "south-east"),
      ) {
        circle(pt, radius: 2.5pt, fill: white, stroke: 1.2pt + black)
        content(pt, lbl, anchor: anch, padding: 6pt)
      }

      // Box 3D lines
      line(p(0, 0, 0), p(6, 0, 0), p(6, 0, 6), p(0, 0, 6), close: true, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(p(6, 0, 0), p(6, 4, 0), p(6, 4, 6), p(6, 0, 6), stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(p(0, 0, 6), p(0, 4, 6), p(6, 4, 6), stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(p(0, 4, 0), p(6, 4, 0), stroke: (paint: gray.lighten(40%), thickness: 0.8pt, dash: "dashed"))
      line(p(0, 4, 0), p(0, 0, 0), stroke: (paint: gray.lighten(40%), thickness: 0.8pt, dash: "dashed"))
      line(p(0, 4, 0), p(0, 4, 6), stroke: (paint: gray.lighten(40%), thickness: 0.8pt, dash: "dashed"))
    })
  ],
  fig-pos: "center",
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Bretschneider Không Chỉ Dành Cho Tứ Giác Lệch])[
      - Nhiều học sinh nghĩ Bretschneider chỉ dùng khi tứ giác rất tổng quát. Thực ra *hình bình hành lệch* cũng là một ứng viên tốt nếu ta muốn gom lời giải về cùng một bộ công cụ.
      - Ở đây các cạnh đối bằng nhau, nhưng góc không vuông nên tứ giác không nội tiếp đường tròn.
    ]

    #step[Bước 1: Tính 4 cạnh]
    $ A B = C D = sqrt(4^2 + 0^2 + 4^2) = 4sqrt(2). $
    $ B C = D A = sqrt(1^2 + 2^2 + 1^2) = sqrt(6). $
    Suy ra nửa chu vi là:
    $ p = frac(4sqrt(2) + sqrt(6) + 4sqrt(2) + sqrt(6), 2) = 4sqrt(2) + sqrt(6). $

    #step[Bước 2: Tính góc đối]
    Xét tại đỉnh $A$:
    $ vec(A B) = (4; 0; 4), vec(A D) = (1; 2; 1). $
    Khi đó:
    $ vec(A B) dot vec(A D) = 8. $
    Mặt khác:
    $ |vec(A B)| = 4sqrt(2), |vec(A D)| = sqrt(6). $
    Do đó:
    $ cos A = frac(8, 4sqrt(2) dot sqrt(6)) = frac(1, sqrt(3)). $

    Vì $A B C D$ là hình bình hành nên $A = C$, suy ra:
    $ frac(A+C, 2) = A, cos^2 frac(A+C, 2) = frac(1, 3). $

    #step[Bước 3: Áp dụng Bretschneider]
    Đặt $a = c = 4sqrt(2)$, $b = d = sqrt(6)$. Khi đó:
    $ p-a = sqrt(6), p-b = 4sqrt(2). $
    Vậy:
    $
      S & = sqrt((p-a)(p-b)(p-c)(p-d) - a b c d dot cos^2 frac(A+C, 2)) \
        & = sqrt((sqrt(6))(4sqrt(2))(sqrt(6))(4sqrt(2)) - (4sqrt(2))(sqrt(6))(4sqrt(2))(sqrt(6)) dot frac(1, 3)) \
        & = sqrt(192 - 64) = sqrt(128) = 8sqrt(2) approx #calc.round(8 * calc.sqrt(2), digits: 2).
    $

    #nhanxet[
      Nếu dùng tích có hướng, ta cũng thu được đúng $|vec(A B) times vec(A D)| = 8sqrt(2)$. Nhưng Bretschneider giúp học sinh nhìn ra một bức tranh lớn hơn: *hình thoi lệch, hình bình hành lệch, hay tứ giác bất kỳ trong Oxyz đều có thể quy về chung một bộ tư duy*.
    ]
  ],
)

// ─────────────────────────────────────────────────────────────
= Phần Mở Rộng: Dự Đoán Đề Thi Từ Mô Hình Toán Thực Tế
// ─────────────────────────────────────────────────────────────

// ─────────────────────────────────────────────────────────────
== Bài 5 — Khung Bạt Che Nắng (Brahmagupta)
// ─────────────────────────────────────────────────────────────

#tln(
  [Một kiến trúc sư thiết kế một tháp quan sát có phần đỉnh là một mái vòm hình bán cầu $(S): x^2 + y^2 + z^2 = 36$ (với $z >= 0$). Để tạo bóng râm, người ta căng một khung bạt tứ giác $A B C D$. Biết rằng 4 đỉnh của khung bạt cùng nằm trên mặt phẳng nghiêng $(P): 2x + 2y - z + 6 = 0$ và đồng thời chạm vào mái vòm $(S)$. Người thợ đo được ba cạnh liên tiếp của bạt là $A B = 3$ m, $B C = 4$ m, $C D = 6$ m, và cạnh còn lại $D A = 5$ m. Tính diện tích của tấm bạt che nắng này.],
  [21.21],
  fig: align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      let p(x, y, z) = (x - 0.4 * y, z - 0.3 * y)

      // Box 3D
      line(p(-7, -7, 0), p(7, -7, 0), p(7, 7, 0), p(-7, 7, 0), close: true, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(p(7, -7, 0), p(7, -7, 7), stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(p(-7, -7, 0), p(-7, -7, 7), stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(p(-7, -7, 7), p(7, -7, 7), stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      
      // Hemisphere (approx 2D for 3D look)
      arc(p(0, 0, 0), radius: 2.8, start: 0deg, stop: 180deg, stroke: (paint: gray.lighten(20%), thickness: 1.2pt))
      bezier(p(-6, 0, 0), p(6, 0, 0), p(-6, 4, 0), p(6, 4, 0), stroke: (paint: gray.lighten(40%), dash: "dashed"))
      bezier(p(-6, 0, 0), p(6, 0, 0), p(-6, -4, 0), p(6, -4, 0), stroke: (paint: gray.lighten(20%), thickness: 1.2pt))

      // Plane P
      let cy = 1.2
      let cx = -0.5
      let ex = 1.6
      let ey = 0.5
      
      bezier((cx - ex, cy), (cx + ex, cy), (cx - ex, cy - ey), (cx + ex, cy - ey), stroke: (paint: rgb("1F618D"), thickness: 1.5pt))
      bezier((cx - ex, cy), (cx + ex, cy), (cx - ex, cy + ey), (cx + ex, cy + ey), stroke: (paint: rgb("1F618D"), thickness: 1pt, dash: "dashed"))

      // Quad
      let pt-a = (cx - 1.4, cy - 0.2)
      let pt-b = (cx + 0.3, cy - 0.4)
      let pt-c = (cx + 1.5, cy + 0.1)
      let pt-d = (cx - 0.5, cy + 0.35)

      line(pt-a, pt-b, pt-c, pt-d, close: true, fill: rgb("3498DB").transparentize(80%), stroke: none)
      line(pt-a, pt-b, stroke: (paint: rgb("2980B9"), thickness: 1.5pt))
      line(pt-b, pt-c, stroke: (paint: rgb("2980B9"), thickness: 1.5pt))
      line(pt-c, pt-d, stroke: (paint: rgb("2980B9"), thickness: 1.2pt, dash: "dashed"))
      line(pt-d, pt-a, stroke: (paint: rgb("2980B9"), thickness: 1.2pt, dash: "dashed"))

      for pt in (pt-a, pt-b, pt-c, pt-d) {
        circle(pt, radius: 3pt, fill: white, stroke: 1.2pt + black)
      }
      content(pt-a, $A$, anchor: "east", padding: 6pt)
      content(pt-b, $B$, anchor: "north", padding: 6pt)
      content(pt-c, $C$, anchor: "west", padding: 6pt)
      content(pt-d, $D$, anchor: "south", padding: 6pt)
    })
  ],
  fig-pos: "center",
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Mô Hình Hóa Đi Về Đâu])[
      - Bài toán có vẻ rất hầm hố với khung vòm, tọa độ mặt cắt, nhưng cốt lõi là: Các đỉnh vừa thuộc mặt cầu, vừa thuộc mặt phẳng $=>$ Thuộc một đường tròn giao tuyến.
      - Tứ giác có 4 đỉnh thuộc đường tròn $=>$ Tứ giác nội tiếp $=>$ Công thức Brahmagupta.
    ]

    #step[Bước 1: Khẳng định tính chất tứ giác]
    Các đỉnh $A, B, C, D$ nằm trên giao tuyến của mặt phẳng $(P)$ và mặt cầu $(S)$. Giao tuyến này là một đường tròn, do đó $A B C D$ là tứ giác nội tiếp.

    #step[Bước 2: Tính diện tích bằng Brahmagupta]
    Ta có độ dài các cạnh: $a=3, b=4, c=6, d=5$.
    Nửa chu vi:
    $ p = frac(3+4+6+5, 2) = 9 upright(" m"). $
    Diện tích tấm bạt:
    $ S = sqrt((9-3)(9-4)(9-6)(9-5)) = sqrt(6 dot 5 dot 3 dot 4) = sqrt(360) = 6sqrt(10) approx #calc.round(calc.sqrt(360), digits: 2) upright(" m")^2. $

    #nhanxet[
      Bài toán là một ví dụ tuyệt vời về "toán học che dấu". Phương trình cầu và phẳng đưa ra chỉ để đánh lừa học sinh đi tính tọa độ giao tuyến, trong khi chìa khóa nằm ở tính chất hình học thuần túy.
    ]
  ],
)

// ─────────────────────────────────────────────────────────────
== Bài 6 — Giao Tuyến Ống Thông Gió (Bretschneider)
// ─────────────────────────────────────────────────────────────

#tln(
  [Tại một nhà máy, có một ống thông gió hình trụ đứng với phương trình $x^2 + y^2 = 16$ (trục là trục $O z$). Để nối với hệ thống xả khí nghiêng, người ta cắt ống thông gió bằng một mặt phẳng $(P): z = 2x + 1$, tạo ra một mặt cắt hình ellipse. Một lưới lọc dạng tứ giác $M N P Q$ được gắn vào bên trong mặt cắt này, sao cho 4 đỉnh của lưới nằm trên viền ellipse. Biết tọa độ các đỉnh là $M(4; 0; 9)$, $N(0; 4; 1)$, $P(-4; 0; -7)$, $Q(0; -4; 1)$. Hãy tính diện tích phần lưới lọc $M N P Q$.],
  [68.30],
  fig: align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *

      let cx = 0
      let r = 2.0
      let hbot = -3.5
      let htop = 3.5
      let ey = 0.5

      // Box 3D
      let pt000 = (-4.0, -4.0)
      let pt100 = (4.0, -4.0)
      let pt010 = (-1.5, -2.5)
      let pt110 = (6.5, -2.5)
      let pt001 = (-4.0, 5.0)
      let pt101 = (4.0, 5.0)
      let pt011 = (-1.5, 6.5)
      let pt111 = (6.5, 6.5)

      line(pt010, pt110, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt011, stroke: (paint: gray.lighten(40%), dash: "dashed"))
      line(pt010, pt000, stroke: (paint: gray.lighten(40%), dash: "dashed"))

      // Cylinder
      line((cx - r, hbot), (cx - r, htop), stroke: (paint: gray.lighten(20%), thickness: 1.2pt))
      line((cx + r, hbot), (cx + r, htop), stroke: (paint: gray.lighten(20%), thickness: 1.2pt))
      arc((cx - r, hbot), radius: (r, ey), start: 180deg, stop: 360deg, stroke: (paint: gray.lighten(20%), thickness: 1.2pt))
      arc((cx + r, hbot), radius: (r, ey), start: 0deg, stop: 180deg, stroke: (paint: gray.lighten(50%), thickness: 0.8pt, dash: "dashed"))

      // Quad in Ellipse
      let pM = (cx + r, 2.5)
      let pN = (cx - 0.2, 0.4)
      let pP = (cx - r, -1.8)
      let pQ = (cx + 0.2, 0.4)

      line(pM, pN, pP, pQ, close: true, fill: rgb("9B59B6").transparentize(80%), stroke: none)
      line(pM, pN, stroke: (paint: rgb("8E44AD"), thickness: 1.5pt))
      line(pN, pP, stroke: (paint: rgb("8E44AD"), thickness: 1.5pt))
      line(pP, pQ, stroke: (paint: rgb("8E44AD"), thickness: 1.5pt, dash: "dashed"))
      line(pQ, pM, stroke: (paint: rgb("8E44AD"), thickness: 1.5pt, dash: "dashed"))

      for (pt, lbl, anch) in (
        (pM, $M$, "west"),
        (pN, $N$, "east"),
        (pP, $P$, "east"),
        (pQ, $Q$, "west"),
      ) {
        circle(pt, radius: 3pt, fill: white, stroke: 1.2pt + black)
        content(pt, lbl, anchor: anch, padding: 7pt)
      }

      line((cx, hbot - 0.5), (cx, htop + 1.2), stroke: (paint: black, dash: "dashed"), mark: (end: "stealth"))
      content((cx + 0.3, htop + 1.2), $z$, text(weight: "bold"))

      // Front Box
      line(pt000, pt100, pt101, pt001, close: true, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt100, pt110, pt111, pt101, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
      line(pt001, pt011, pt111, stroke: (paint: gray.lighten(40%), thickness: 0.8pt))
    })
  ],
  fig-pos: "center",
  loigiai: [
    #step[Bước 1: Tính 4 độ dài cạnh]
    $
      M N & = sqrt((0-4)^2 + (4-0)^2 + (1-9)^2) = sqrt(16+16+64) = sqrt(96) = 4sqrt(6). \
      N P & = sqrt((-4-0)^2 + (0-4)^2 + (-7-1)^2) = sqrt(16+16+64) = sqrt(96) = 4sqrt(6). \
      P Q & = sqrt((0+4)^2 + (-4-0)^2 + (1+7)^2) = sqrt(16+16+64) = sqrt(96) = 4sqrt(6). \
      Q M & = sqrt((4-0)^2 + (0+4)^2 + (9-1)^2) = sqrt(16+16+64) = sqrt(96) = 4sqrt(6).
    $
    $=> M N P Q$ là *hình thoi* với cạnh $a = 4sqrt(6)$.

    #step[Bước 2: Nửa chu vi]
    $ p = 8sqrt(6). $

    #step[Bước 3: Tính góc đối qua tích vô hướng]
    Tại đỉnh $M$: $vec(M N) = (-4; 4; -8)$, $vec(M Q) = (-4; -4; -8)$.
    $ vec(M N) dot vec(M Q) = (-4)(-4) + (4)(-4) + (-8)(-8) = 16 - 16 + 64 = 64. $
    $ cos M = frac(64, (4sqrt(6))(4sqrt(6))) = frac(64, 96) = frac(2, 3). $
    Vì hình thoi nên góc $M = P$, suy ra $cos^2(frac(M+P, 2)) = cos^2 M = frac(4, 9)$.

    #step[Bước 4: Áp dụng Bretschneider]
    $
      S &= sqrt((p-a)^4 - a^4 cos^2 frac(M+P, 2)) \
      &= sqrt((4sqrt(6))^4 - (4sqrt(6))^4 dot frac(4, 9)) \
      &= sqrt(9216 - 9216 dot frac(4, 9)) = sqrt(9216 dot frac(5, 9)) = 32sqrt(5) approx #calc.round(32 * calc.sqrt(5), digits: 2) upright(" m")^2.
    $
    #nhanxet[
      Bài toán có cấu trúc tương tự Bài 3 nhưng thay đổi mô hình thành lưới lọc trong ống thông gió với độ dốc của mặt phẳng lớn hơn ($z = 2x + 1$). Điều này minh chứng cho tính ưu việt của Bretschneider: nó giải quyết tất cả các tình huống "lệch" một cách hệ thống!
    ]
  ],
)
"""

with open('typst/exams/Brahmagupta-Oxyz.typ', 'w', encoding='utf-8') as f:
    f.write(content)

