#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

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
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════
// HÀM CHIẾU PHỐI CẢNH 3D DÙNG CHUNG
// ═══════════════════════════════════════════════
// Chiếu trục x vào mặt phẳng giấy theo góc 30°, tỉ lệ 0.5
#let proj3d(x, y, z, sc: 3.5) = {
  let px = (y - 0.5 * x) * sc
  let py = (z - 0.35 * x) * sc
  (px, py)
}

// ─────────────────────────────────────────────────────────
// VẼ TRỤC TỌA ĐỘ xyz (dùng lại nhiều hình)
// ─────────────────────────────────────────────────────────
#let draw-axes(sc: 3.5, xl: 2.5, yl: 1.4, zl: 1.2) = {
  import cetz.draw: *
  let p = proj3d.with(sc: sc)
  line(p(0, 0, 0), p(xl, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
  content(p(xl, -0.12, 0), $x$)
  line(p(0, -1.2, 0), p(0, yl, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
  content(p(0, yl, -0.1), $y$)
  line(p(0, 0, -0.3), p(0, 0, zl), mark: (end: ">", fill: black), stroke: 0.7pt)
  content(p(0, -0.1, zl), $z$)
}

#let section-grid-stroke = (paint: rgb("C0392B"), thickness: 0.95pt, dash: "dotted")

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
      Chuyên Đề: Conic Và Khối Không Gian\
      Tích Phân Ứng Dụng — Thể Tích & Bài Toán Thực Tiễn
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Parabol · Elip · Cắt khối · Bể nước · Đập tràn · Ống dẫn — Vận dụng cao THPT Quốc Gia
    ]
  ]
]

// ═══════════════════════════════════════════════
// LÝ THUYẾT NỀN
// ═══════════════════════════════════════════════
= Lý Thuyết Tích Phân Tính Diện Tích & Thể Tích

#lythuyet[
  *Diện tích hình phẳng giới hạn bởi đường cong $y = f(x)$:*
  $S = integral_a^b |f(x) - g(x)| d x$.

  *Thể tích khối có mặt cắt ngang biến thiên:*
  Nếu tại vị trí $x$ (hoặc $z$), diện tích mặt cắt ngang là $A(x)$, thì:
  $V = integral_a^b A(x) d x$.

  *Ứng dụng bể nước hình conic:* Gọi $w(z)$ là chiều rộng mặt cắt ngang tại cao độ $z$:
  - Diện tích mặt cắt: $A(z) = w(z) dot L$ (bể có chiều dài $L$).
  - Thể tích nước đến mức $z = k$: $V(k) = L integral_0^k w(z) d z$.
  - Thời gian đầy: $t = V_"total" / Q$ (lưu lượng $Q$).
  - Mực nước tại thời điểm $t_0$: giải $V(k) = Q dot t_0$.

  *Ba dạng conic thường gặp:*
  #table(
    columns: (auto, 2fr, 2fr),
    fill: (c, r) => if r == 0 { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + gray,
    inset: (x: 8pt, y: 6pt),
    table.header([*Conic*], [*Phương trình*], [*Chiều rộng tại độ cao $z$*]),
    [Parabol đứng], [$z = a y^2 + c$], [$w = 2sqrt((z-c)/a)$],
    [Elip], [$(y/b)^2 + (z/a)^2 = 1$], [$w = 2b sqrt(1-(z/a)^2)$],
    [Parabol nằm ngang], [$y^2 + k z = 0$], [$w = 2sqrt(-k z)$],
  )
]

// ═══════════════════════════════════════════════════════════════════════
// BÀI 1 — BỂ NƯỚC PARABOL (bài gốc mở rộng thêm câu hỏi)
// ═══════════════════════════════════════════════════════════════════════
= Bài 1 — Bể Nước Tiết Diện Parabol

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, được giới hạn bởi parabol $(P)$ và hai đoạn $C D$, $C' D'$ như hình vẽ. Hình không gian $(K)$ có hai đáy dạng $(H)$ và chiều dài $2$ m. Bể nước hình $(K)$, đáy $A B C D$ kín nằm dưới, miệng $A' B' C' D'$ để hở. Vòi nước lưu lượng không đổi $0","02 space (m^3 \/ "phút")$ chảy vào bể.],
  (
    True([Phương trình parabol $(P)$ là $z = 25/9 y^2 - 0","2$. ]),
    True([Diện tích hình phẳng $(H)$ bằng $0","73 space m^2$ (làm tròn đến hàng phần trăm).]),
    True([Thời gian để nước chảy đầy bể là $72","8$ phút (làm tròn đến hàng phần mười).]),
    True([Sau $60$ phút, chiều cao mực nước so với đáy bằng $0","69$ m (làm tròn đến hàng phần trăm).]),
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 3.5
      let p(x, y, z) = ((y - 0.5 * x) * sc, (z - 0.35 * x) * sc)
      let y0 = 0.26833
      let hfill = rgb(173, 216, 230, 150)

      // Hình phẳng (H) + đáy ABCD
      let h-pts = ()
      for i in range(-60, 61) {
        let y = i / 100.0
        let z = 25.0 / 9.0 * y * y - 0.2
        if z >= 0 { h-pts.push(p(0, y, z)) }
      }
      h-pts.push(p(0, 0.6, 0.8))
      h-pts.push(p(0, -0.6, 0.8))
      line(..h-pts, close: true, fill: hfill, stroke: none)
      line(p(0, -y0, 0), p(0, y0, 0), p(2, y0, 0), p(2, -y0, 0), close: true, fill: hfill, stroke: none)

      // Parabol đầy mặt sau
      let bp = ()
      for i in range(-70, 71) {
        let y = i / 100.0
        bp.push(p(0, y, 25.0 / 9.0 * y * y - 0.2))
      }
      line(..bp, stroke: 0.5pt)

      // Biên bể — mặt sau
      line(p(0, -0.6, 0.8), p(0, 0.6, 0.8), stroke: 1.2pt + red)
      line(p(0, -y0, 0), p(0, y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      let bl = ()
      let br = ()
      for i in range(-60, 61) {
        let y = i / 100.0
        let z = 25.0 / 9.0 * y * y - 0.2
        if z >= 0 { if y < 0 { bl.push(p(0, y, z)) } else { br.push(p(0, y, z)) } }
      }
      line(..bl, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..br, stroke: 1.2pt + red)

      // Sườn giữa
      for xv in (0.5, 1.0, 1.5) {
        let pts = ()
        for i in range(-60, 61) {
          let y = i / 100.0
          let z = 25.0 / 9.0 * y * y - 0.2
          if z >= 0 { pts.push(p(xv, y, z)) }
        }
        line(..pts, stroke: section-grid-stroke)
        line(p(xv, -0.6, 0.8), p(xv, 0.6, 0.8), stroke: section-grid-stroke)
        line(p(xv, -y0, 0), p(xv, y0, 0), stroke: section-grid-stroke)
      }

      // Biên bể — mặt trước
      line(p(2, -0.6, 0.8), p(2, 0.6, 0.8), stroke: 1.2pt + red)
      line(p(2, -y0, 0), p(2, y0, 0), stroke: 1.2pt + red)
      let fl = ()
      let fr = ()
      for i in range(-60, 61) {
        let y = i / 100.0
        let z = 25.0 / 9.0 * y * y - 0.2
        if z >= 0 { if y < -y0 { fl.push(p(2, y, z)) } else if y > y0 { fr.push(p(2, y, z)) } }
      }
      line(..fl, stroke: 1.2pt + red)
      line(..fr, stroke: 1.2pt + red)
      let fd = ()
      for i in range(-27, 28) {
        let y = i / 100.0
        fd.push(p(2, y, 25.0 / 9.0 * y * y - 0.2))
      }
      line(..fd, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))

      // Đường sinh
      line(p(0, -0.6, 0.8), p(2, -0.6, 0.8), stroke: 1.2pt + red)
      line(p(0, 0.6, 0.8), p(2, 0.6, 0.8), stroke: 1.2pt + red)
      line(p(0, -y0, 0), p(2, -y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, y0, 0), p(2, y0, 0), stroke: 1.2pt + red)

      // Nhãn
      content(p(0, -0.6, 0.9), $D'$)
      content(p(0, 0.6, 0.9), $C'$)
      content(p(0, 0.05, -0.1), $O$)
      content(p(0, 0.35, 0.1), $C$)
      content(p(2, -0.65, 0.8), $A'$)
      content(p(2, 0.6, 0.85), $B'$)
      content(p(2, -0.35, -0.1), $A$)
      content(p(2, 0.35, -0.1), $B$)

      // Kích thước
      line(p(0, -0.6, 1.05), p(0, 0.6, 1.05), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.2, 1.15), $1","2$)
      line(p(0, 0.9, 0), p(0, 0.9, 0.8), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 1.05, 0.4), $0","8$)
      line(p(-1, -0.5, -0.35), p(1, -0.5, -0.35), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(1, -0.4, -0.45), $2$)
      content(p(0, 0, -0.28), $-0","2$)

      // Chú thích
      content(p(0, 0.3, 0.4), $(H)$)
      content(p(0.5, -0.5, 0.55), $(P)$)
      line(p(0.4, -0.5, 0.5), p(0, -0.5, 0.3), mark: (end: ">"), stroke: 0.5pt)
      content(p(1.5, -0.65, 0.7), $(K)$)
      line(p(1.5, -0.55, 0.65), p(1.2, -0.5, 0.5), mark: (end: ">"), stroke: 0.5pt)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Lập phương trình parabol $(P)$])
    Parabol có đỉnh $V(0; -0","2)$ nên có dạng $z = a y^2 - 0","2$.
    Thay tọa độ điểm $C'(0","6; 0","8)$ vào phương trình, ta được
    $
      0","8 = a(0","6)^2 - 0","2
      => 1 = 0","36 a
      => a = 25/9.
    $
    Vậy $(P): z = 25/9 y^2 - 0","2$. *Mệnh đề (a) ĐÚNG.*

    #step([Tính diện tích $(H)$])
    Với $0 <= z <= 0","8$, từ $(P)$) suy ra
    $
      y = plus.minus 3/5 sqrt(z+0","2),
      quad w(z) = 6/5 sqrt(z+0","2).
    $
    Do đó
    $
      S_(H) = integral_0^(0","8) 6/5 sqrt(z+0","2) d z
      = 6/5 dot 2/3 [(z+0","2)^(3/2)]_0^(0","8)
      = 4/5 [(1","0)^(3/2) - (0","2)^(3/2)]
      approx 0","7284 space m^2.
    $
    Suy ra $S_(H) approx 0","73 space m^2$. *Mệnh đề (b) ĐÚNG.*

    #step([Thể tích và thời gian đầy bể])
    Thể tích bể là
    $
      V = S_(H) dot 2 approx 0","7284 dot 2 = 1","4568 space m^3.
    $
    Do lưu lượng $Q = 0","02 space (m^3 / "phút")$, ta có
    $
      t = V / Q = 1","4568 / 0","02 = 72","84 approx 72","8.
    $
    Suy ra thời gian bơm đầy bể xấp xỉ $72","8$ phút. *Mệnh đề (c) ĐÚNG.*

    #step([Mực nước sau 60 phút])
    Sau $60$ phút,
    $
      V_(60) = 60 dot 0","02 = 1","2 space m^3,
      quad A = V_(60)/2 = 0","6 space m^2.
    $
    Ta giải phương trình
    $
      4/5 [(k+0","2)^(3/2) - (0","2)^(3/2)] = 0","6.
    $
    Suy ra
    $
      (k+0","2)^(3/2) = 0","75 + 0","0894 = 0","8394,
      quad k+0","2 approx 0","8394^(2/3) approx 0","8899,
      quad k approx 0","69.
    $
    *Mệnh đề (d) ĐÚNG.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 2 — BỂ NƯỚC TIẾT DIỆN ELIP (nằm ngang)
// ═══════════════════════════════════════════════════════════════════════
= Bài 2 — Bể Nước Tiết Diện Nửa Elip

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, là nửa dưới của elip $(E): y^2/4 + z^2/1 = 1$ ($z <= 0$), tịnh tiến lên trên $1$ m. Cụ thể $(H)$ là vùng giới hạn bởi elip $(E'): y^2/4 + (z-1)^2 = 1$ với $z >= 0$ và đoạn $C D$ nằm trên trục $y$ ($z=0$). Một bể nước $(K)$ có chiều dài $3$ m, hai đáy hình $(H)$, đáy phẳng nằm ở $z=0$, miệng là đường elip phía trên. Lưu lượng vòi nước $0","03 space (m^3 \/ "phút")$.],
  (
    True([Chiều rộng mặt cắt ngang tại cao độ $z$ ($0 <= z <= 1$) là $w(z) = 4 sqrt(1 - (z-1)^2) = 4 sqrt(z(2-z))$.]),
    True([Diện tích $(H)$ bằng $pi approx 3","14 space m^2$ (làm tròn đến hàng phần trăm).]),
    [Thể tích bể $(K)$ bằng $6 space m^3$.],
    True([Sau $100$ phút, mực nước cao hơn $0","43$ m so với đáy (làm tròn đến hàng phần trăm).]),
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 2.8
      let p(x, y, z) = ((y - 0.45 * x) * sc, (z - 0.3 * x) * sc)

      let hfill = rgb(100, 180, 220, 130)
      // H = vùng: y^2/4 + (z-1)^2 <= 1, 0 <= z <= 1
      let left-arc = ()
      let right-arc = ()
      for i in range(0, 101) {
        let z = i / 100.0
        let hw = 2 * calc.sqrt(calc.max(0, 1 - (z - 1) * (z - 1)))
        left-arc.push(p(0, -hw, z))
        right-arc.push(p(0, hw, z))
      }
      // Tô hình H
      let poly = ()
      for pt in left-arc { poly.push(pt) }
      for pt in right-arc.rev() { poly.push(pt) }
      line(..poly, close: true, fill: hfill, stroke: none)

      // Tô đáy bể ABCD (z=0, y từ -2 đến 2)
      line(p(0, -2, 0), p(0, 2, 0), p(3, 2, 0), p(3, -2, 0), close: true, fill: hfill, stroke: none)

      // Vẽ elip đầy trong mặt phẳng sau (chỉ phần z>=0)
      let ell = ()
      for i in range(-100, 101) {
        let y = i / 50.0
        let dz = calc.sqrt(calc.max(0, 1 - y * y / 4))
        ell.push(p(0, y, 1 - dz))
      }
      line(..ell, stroke: 0.5pt)

      let ell2 = ()
      for i in range(-100, 101) {
        let y = i / 50.0
        let dz = calc.sqrt(calc.max(0, 1 - y * y / 4))
        ell2.push(p(0, y, 1 + dz))
      }
      line(..ell2, stroke: (paint: gray, thickness: 0.4pt, dash: "dotted"))

      // Biên bể — viền elip mặt sau (z=0 đến 1, phần biên trái/phải)
      line(..left-arc, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..right-arc, stroke: 1.2pt + red)
      line(p(0, -2, 0), p(0, 2, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      // Miệng bể mặt sau
      let mouth = ()
      for i in range(-100, 101) {
        let y = i / 50.0
        let dz = calc.sqrt(calc.max(0, 1 - y * y / 4))
        mouth.push(p(0, y, 1 + dz))
      }
      line(..mouth, stroke: 1.2pt + red)

      // Đường sinh trên
      line(p(0, -2, 2), p(3, -2, 2), stroke: 1.2pt + red)
      line(p(0, 2, 2), p(3, 2, 2), stroke: 1.2pt + red)
      // Đường sinh đáy
      line(p(0, -2, 0), p(3, -2, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, 2, 0), p(3, 2, 0), stroke: 1.2pt + red)

      // Biên mặt trước
      let fl = ()
      let fr = ()
      for i in range(0, 101) {
        let z = i / 100.0
        let hw = 2 * calc.sqrt(calc.max(0, 1 - (z - 1) * (z - 1)))
        fl.push(p(3, -hw, z))
        fr.push(p(3, hw, z))
      }
      line(..fl, stroke: 1.2pt + red)
      line(..fr, stroke: 1.2pt + red)
      line(p(3, -2, 0), p(3, 2, 0), stroke: 1.2pt + red)
      let fm = ()
      for i in range(-100, 101) {
        let y = i / 50.0
        let dz = calc.sqrt(calc.max(0, 1 - y * y / 4))
        fm.push(p(3, y, 1 + dz))
      }
      line(..fm, stroke: 1.2pt + red)

      // Nhãn
      content(p(0, -2.1, 0.1), $D$)
      content(p(0, 2.1, 0.1), $C$)
      content(p(0, -2.1, 2.1), $D'$)
      content(p(0, 2.1, 2.1), $C'$)
      content(p(3, -2.1, 0.1), $A$)
      content(p(3, 2.1, 0.1), $B$)
      content(p(3, -2.1, 2.1), $A'$)
      content(p(3, 2.1, 2.1), $B'$)
      content(p(0, 0.1, -0.2), $O$)

      // Trục
      line(p(0, 0, 0), p(3.2, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(3.2, -0.1, 0), $x$)
      line(p(0, -2.3, 0), p(0, 2.4, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 2.4, -0.1), $y$)
      line(p(0, 0, -0.2), p(0, 0, 2.5), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.15, 2.4), $z$)

      // Kích thước
      line(p(0, -2, 2.3), p(0, 2, 2.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.2, 2.5), $4$)
      line(p(0, 2.5, 0), p(0, 2.5, 1), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 2.8, 0.5), $1$)
      line(p(-0.5, -1.8, -0.4), p(1.5, -1.8, -0.4), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(1.7, -1.7, -0.5), $3$)

      // Nhãn (H), (E')
      content(p(0, 0.5, 0.5), $(H)$)
      content(p(0.3, -1.2, 1.2), $(E')$)
      line(p(0.2, -1.2, 1.1), p(0, -1.3, 0.6), mark: (end: ">"), stroke: 0.5pt)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Chiều rộng mặt cắt ngang])
    Elip $(E')$ có phương trình $y^2/4 + (z-1)^2 = 1$.
    Tại cao độ $z$, ta có
    $
      y^2/4 = 1 - (z-1)^2
      => y = plus.minus 2sqrt(1-(z-1)^2)
      => w(z) = 4sqrt(1-(z-1)^2) = 4sqrt(z(2-z)).
    $
    Vì bể chỉ lấy nửa dưới nên $0 <= z <= 1$. *Mệnh đề (a) ĐÚNG.*

    #step([Diện tích $(H)$])
    Hình $(H)$ là nửa dưới của elip có hai bán trục lần lượt bằng $2$ và $1$.
    Vì thế
    $
      S_(H) = 1/2 pi dot 2 dot 1 = pi approx 3","14 space m^2.
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Thể tích bể])
    $
      V = S_(H) dot L = pi dot 3 = 3pi approx 9","42 space m^3.
    $
    Do đó khẳng định $V = 6 space m^3$ là sai. *Mệnh đề (c) SAI.*

    #step([Mực nước sau 100 phút])
    Sau $100$ phút,
    $
      V_(100) = 100 dot 0","03 = 3 space m^3,
      quad A = V_(100)/3 = 1 space m^2.
    $
    Ta cần giải phương trình diện tích
    $
      integral_0^k 4sqrt(1-(z-1)^2) d z = 1.
    $
    Đặt $u = z-1$, suy ra
    $
      2[(k-1)sqrt(1-(k-1)^2) + arcsin(k-1)] + pi = 1.
    $
    Giải gần đúng được
    $
      k approx 0","4325 approx 0","43 space m.
    $
    *Mệnh đề (d) ĐÚNG.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 3 — ĐẬP TRÀN (PARABOL — MÔ HÌNH THỦY LỢI)
// ═══════════════════════════════════════════════════════════════════════
= Bài 3 — Đập Tràn Hình Parabol

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, giới hạn bởi parabol $(P): z = y^2$ (đỉnh $O$) và đoạn $C D$ ở $z = 2$ ($y in [-sqrt(2); sqrt(2)]$). Hình không gian $(K)$: đập tràn thủy lợi rộng $L = 10$ m (theo $x$), hai đáy dạng $(H)$. Nước tràn qua khi đầy đến $z = 2$ m. Vận tốc nước tràn đều $v = 0","5$ m/s.],
  (
    True([Tại cao độ $z in [0; 2]$, chiều rộng mặt cắt ngang là $w(z) = 2sqrt(z)$.]),
    True([Diện tích mặt cắt ngang $(H)$ khi nước đầy là $S = (8 sqrt(2))/3 approx 3","77 space m^2$.]),
    True(
      [Lưu lượng nước tràn là $Q = S times v times L = (8sqrt(2))/3 times 0","5 times 10 approx 18","86 space m^3/s$.],
    ),
    True([Nếu lớp bùn dày $0","5$ m lắng từ đáy lên, diện tích hữu dụng giảm $12","5\%$ so với ban đầu.]),
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 2.5
      let p(x, y, z) = ((y - 0.4 * x) * sc, (z - 0.25 * x) * sc)
      let hfill = rgb(100, 160, 220, 130)
      let bfill = rgb(180, 140, 80, 160)

      // Tô hình H (giữa parabol, z từ 0 đến 2)
      let left = ()
      let right = ()
      for i in range(0, 101) {
        let z = i * 2.0 / 100
        let hw = calc.sqrt(z)
        left.push(p(0, -hw, z))
        right.push(p(0, hw, z))
      }
      let poly = ()
      poly.push(p(0, 0, 0))
      for pt in right { poly.push(pt) }
      for pt in left.rev() { poly.push(pt) }
      line(..poly, close: true, fill: hfill, stroke: none)

      // Tô lớp bùn (z từ 0 đến 0.5)
      let bl = ()
      let br = ()
      for i in range(0, 51) {
        let z = i * 0.5 / 50
        let hw = calc.sqrt(z)
        bl.push(p(0, -hw, z))
        br.push(p(0, hw, z))
      }
      let poly-bun = ()
      poly-bun.push(p(0, 0, 0))
      for pt in br { poly-bun.push(pt) }
      for pt in bl.rev() { poly-bun.push(pt) }
      line(..poly-bun, close: true, fill: bfill, stroke: none)

      // Tô mặt phẳng đỉnh đập (z=2)
      line(
        p(0, -calc.sqrt(2), 2),
        p(0, calc.sqrt(2), 2),
        p(10, calc.sqrt(2), 2),
        p(10, -calc.sqrt(2), 2),
        close: true,
        fill: rgb(173, 216, 230, 60),
        stroke: none,
      )

      // Vẽ parabol đầy mặt sau
      let para = ()
      for i in range(-80, 81) {
        let y = i * 1.6 / 80
        para.push(p(0, y, y * y))
      }
      line(..para, stroke: 0.6pt)

      // Biên đập mặt sau
      line(p(0, -calc.sqrt(2), 2), p(0, calc.sqrt(2), 2), stroke: 1.5pt + red)
      line(..left, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..right, stroke: 1.2pt + red)
      line(p(0, 0, 0), p(0, 0, 0), stroke: none)

      // Biên mặt trước
      let fl = ()
      let fr = ()
      for i in range(0, 101) {
        let z = i * 2.0 / 100
        let hw = calc.sqrt(z)
        fl.push(p(10, -hw, z))
        fr.push(p(10, hw, z))
      }
      line(..fl, stroke: 1.2pt + red)
      line(..fr, stroke: 1.2pt + red)
      line(p(10, -calc.sqrt(2), 2), p(10, calc.sqrt(2), 2), stroke: 1.5pt + red)

      // Đường sinh đỉnh và đáy
      line(p(0, -calc.sqrt(2), 2), p(10, -calc.sqrt(2), 2), stroke: 1.2pt + red)
      line(p(0, calc.sqrt(2), 2), p(10, calc.sqrt(2), 2), stroke: 1.2pt + red)
      line(p(0, 0, 0), p(10, 0, 0), stroke: (paint: red, thickness: 1pt, dash: "dashed"))

      // Mức bùn (z=0.5)
      let bun-line = ()
      for i in range(-100, 101) {
        let y = i * 1.6 / 100
        bun-line.push(p(0, y, 0.5))
      }
      line(p(0, -calc.sqrt(0.5), 0.5), p(0, calc.sqrt(0.5), 0.5), stroke: (
        paint: rgb(140, 100, 40),
        thickness: 0.8pt,
        dash: "dashed",
      ))
      content(p(0, calc.sqrt(0.5) + 0.2, 0.5), text(fill: rgb(140, 100, 40), size: 8pt)[bùn $z{=}0","5$])

      // Mực nước (z=2)
      content(p(0, calc.sqrt(2) + 0.2, 2.1), text(fill: blue, size: 9pt)[$z=2$])

      // Trục
      line(p(0, 0, 0), p(11.5, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(11.5, -0.15, 0), $x$)
      line(p(0, -1.6, 0), p(0, 1.8, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 1.8, -0.15), $y$)
      line(p(0, 0, -0.2), p(0, 0, 2.7), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.15, 2.6), $z$)
      content(p(0, 0.1, -0.2), $O$)

      // Kích thước
      line(p(0, -calc.sqrt(2), 2.3), p(0, calc.sqrt(2), 2.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 2.5), $2sqrt(2)$)
      line(p(0, 1.6, 0), p(0, 1.6, 2), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 1.9, 1), $2$)
      line(p(-1, -1, -0.35), p(5, -1, -0.35), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(5.2, -0.9, -0.45), text(size: 9pt)[$10$])

      // Nhãn
      content(p(0, calc.sqrt(2) + 0.25, 2.15), $C$)
      content(p(0, -calc.sqrt(2) - 0.25, 2.15), $D$)
      content(p(0, 0.12, -0.2), $O$)
      content(p(0, 0.35, 1.1), $(H)$)
      content(p(0, -0.7, 0.6), $(P)$)
      line(p(0, -0.65, 0.55), p(0, -0.5, 0.3), mark: (end: ">"), stroke: 0.4pt)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Chiều rộng mặt cắt tại cao độ $z$])
    Từ $(P): z = y^2$, suy ra
    $
      y = plus.minus sqrt(z),
      quad w(z) = 2sqrt(z).
    $
    *Mệnh đề (a) ĐÚNG.*

    #step([Diện tích mặt cắt khi nước đầy ($z = 2$)])
    $
      S = integral_0^2 2sqrt(z) d z
      = [4/3 z^(3/2)]_0^2
      = 4/3 dot 2sqrt(2)
      = (8sqrt(2))/3
      approx 3","77 space m^2.
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Lưu lượng nước tràn])
    $
      Q = S dot v dot L
      = (8sqrt(2))/3 times 0","5 times 10
      = (40sqrt(2))/3
      approx 18","86 space m^3/s.
    $
    *Mệnh đề (c) ĐÚNG.*

    #step([Ảnh hưởng bùn lấp đến $z = 0","5$ m])
    Diện tích phần bùn lấp là
    $
      S_"bùn" = integral_0^(0","5) 2sqrt(z) d z
      = [4/3 z^(3/2)]_0^(0","5)
      = sqrt(2)/3
      approx 0","471 space m^2.
    $
    Tỉ lệ diện tích bị mất bằng
    $
      S_"bùn"/S = (sqrt(2)/3)/((8sqrt(2))/3) = 1/8 = 12","5\%.
    $
    Vậy diện tích hữu dụng giảm đúng $12","5\%$ so với ban đầu. *Mệnh đề (d) ĐÚNG.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 4 — ỐNG DẪN TIẾT DIỆN PARABOL PHỨC HỢP
// ═══════════════════════════════════════════════════════════════════════
= Bài 4 — Ống Dẫn Nước Tiết Diện Vòm Parabol

#ds(
  [Một ống dẫn nước ngầm có mặt cắt ngang tạo bởi parabol $(P_1): z = -(y^2)/2 + 2$ (phần vòm trên, $z >= 0$) và đoạn thẳng đáy $z = 0$ ($-2 <= y <= 2$). Đơn vị đo: đềximét. Ống có chiều dài $50$ dm. Nước chảy đầy ống với vận tốc $v = 0","4 "dm/s"$.],
  (
    True([Diện tích mặt cắt ngang ống là $S = 16/3 approx 5","33 space "dm"^2$.]),
    True([Lưu lượng nước trong ống là $Q = S times v = 16/3 times 0","4 approx 2","13 space "dm"^3/s$.]),
    True(
      [Diện tích mặt trong ống (mặt parabol) bằng $integral_(-2)^(2) sqrt(1 + y^2) d y approx 5","92 space "dm"^2$ (làm tròn đến hàng phần trăm).],
    ),
    True(
      [Khi nước chỉ chảy đến $z = 1$ dm, thể tích nước trong ống bằng $(200sqrt(2))/3 (2sqrt(2)-1) approx 172","3 space "dm"^3$.],
    ),
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 2.5
      let p(x, y, z) = ((y - 0.4 * x) * sc, (z - 0.28 * x) * sc)
      let hfill = rgb(100, 160, 220, 120)

      // Tô vòm ống
      let arc = ()
      for i in range(-100, 101) {
        let y = i * 2.0 / 100
        let z = -(y * y) / 2 + 2
        if z >= 0 { arc.push(p(0, y, z)) }
      }
      let poly = ()
      for pt in arc { poly.push(pt) }
      poly.push(p(0, 2, 0))
      poly.push(p(0, -2, 0))
      line(..poly, close: true, fill: hfill, stroke: none)

      // Tô đáy
      line(p(0, -2, 0), p(0, 2, 0), p(5, 2, 0), p(5, -2, 0), close: true, fill: hfill, stroke: none)

      // Vẽ parabol đầy
      let para = ()
      for i in range(-100, 101) {
        let y = i * 2.5 / 100
        let z = -(y * y) / 2 + 2
        para.push(p(0, y, z))
      }
      line(..para, stroke: 0.5pt)

      // Biên ống mặt sau
      line(..arc, stroke: 1.2pt + red)
      line(p(0, -2, 0), p(0, 2, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))

      // Mặt trước
      let fa = ()
      for i in range(-100, 101) {
        let y = i * 2.0 / 100
        let z = -(y * y) / 2 + 2
        if z >= 0 { fa.push(p(5, y, z)) }
      }
      line(..fa, stroke: 1.2pt + red)
      line(p(5, -2, 0), p(5, 2, 0), stroke: 1.2pt + red)

      // Đường sinh
      line(p(0, -2, 0), p(5, -2, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, 2, 0), p(5, 2, 0), stroke: 1.2pt + red)
      // Đỉnh vòm
      line(p(0, 0, 2), p(5, 0, 2), stroke: 1.2pt + red)

      // Gạch chỉ mức z=1
      let wl = ()
      for i in range(-100, 101) {
        let y = i * 2.0 / 100
        let hw = calc.sqrt(calc.max(0, 2 * (2 - 1)))
        if calc.abs(y) <= hw { wl.push(p(0, y, 1)) }
      }
      line(..wl, stroke: (paint: blue.lighten(20%), thickness: 0.7pt, dash: "dashed"))
      content(p(0, 2.2, 1), text(fill: blue, size: 9pt)[$z=1$])

      // Trục
      line(p(0, 0, 0), p(6, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(6, -0.1, 0), $x$)
      line(p(0, -2.5, 0), p(0, 2.7, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 2.7, -0.1), $y$)
      line(p(0, 0, -0.2), p(0, 0, 2.5), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.15, 2.4), $z$)
      content(p(0, 0.1, -0.2), $O$)

      // Kích thước
      line(p(0, -2, 2.3), p(0, 2, 2.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 2.5), text(size: 9pt)[$4$])
      line(p(0, 2.7, 0), p(0, 2.7, 2), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 3.1, 1), text(size: 9pt)[$2$])

      // Nhãn
      content(p(0, 0.3, 1.2), $(P_1)$)
      line(p(0, 0.2, 1.1), p(0, 0.5, 1.0), mark: (end: ">"), stroke: 0.5pt)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Diện tích mặt cắt ngang])
    Từ $(P_1): z = -(y^2)/2 + 2$, giao với đáy $z = 0$ cho
    $
      y = plus.minus 2.
    $
    Vì thế
    $
      S = integral_(-2)^2 (2 - y^2/2) d y
      = [2y - y^3/6]_(-2)^2
      = 8 - 8/3
      = 16/3
      approx 5","33 space "dm"^2.
    $
    *Mệnh đề (a) ĐÚNG.*

    #step([Lưu lượng nước])
    $
      Q = S dot v = (16/3) times 0","4 = 6","4/3 approx 2","13 space "dm"^3/s.
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Diện tích mặt trong vòm])
    Với $z = 2 - y^2/2$, ta có $d z/d y = -y$, nên
    $
      d s = sqrt(1 + y^2) d y.
    $
    Do đó
    $
      S_"vòm" = integral_(-2)^2 sqrt(1+y^2) d y
      = 2 integral_0^2 sqrt(1+y^2) d y.
    $
    Dùng nguyên hàm chuẩn,
    $
      integral sqrt(1+y^2) d y = y sqrt(1+y^2)/2 + 1/2 ln(y + sqrt(1+y^2)).
    $
    Suy ra
    $
      S_"vòm"
      = [y sqrt(1+y^2) + ln(y + sqrt(1+y^2))]_0^2
      = 2sqrt(5) + ln(2 + sqrt(5))
      approx 5","92 space "dm"^2.
    $
    *Mệnh đề (c) ĐÚNG.*

    #step([Thể tích nước khi $z = 1$ dm])
    Với $z = 1$, phần nước chiếm miền $0 <= z <= 1$.
    Tại cao độ $z$, chiều rộng mặt cắt là
    $
      y = plus.minus sqrt(2(2-z)),
      quad w(z) = 2sqrt(2)sqrt(2-z).
    $
    Vì thế
    $
      V = 50 integral_0^1 2sqrt(2) sqrt(2-z) d z
      = 100 sqrt(2) dot 2/3 [2^(3/2) - 1]
      = (200 sqrt(2))/3 (2sqrt(2) - 1)
      approx 172","3 space "dm"^3.
    $
    *Mệnh đề (d) ĐÚNG.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 5 — BỂ NƯỚC KÉP: ĐÁY PARABOL, THÀNH ELIP
// ═══════════════════════════════════════════════════════════════════════
= Bài 5 — Bể Kênh Tưới Tiết Diện Hỗn Hợp

#ds(
  [Một kênh tưới có mặt cắt ngang hình chữ U: phần dưới là parabol $(P): z = y^2$ ($z in [0; 1]$), phần trên là hình chữ nhật rộng $2$ m, cao $1$ m (từ $z=1$ đến $z=2$). Đơn vị mét. Chiều dài kênh $L = 100$ m. Lưu lượng bơm $Q = 0","5 space m^3/s$.],
  (
    True([Chiều rộng mặt cắt ngang tại $z in [0;1]$ là $w_1(z) = 2sqrt(z)$; tại $z in [1;2]$ là $w_2 = 2$.]),
    True([Diện tích mặt cắt tổng khi kênh đầy ($z=2$) là $S = 4/3 + 2 = 10/3 approx 3","33 space m^2$.]),
    True([Thể tích toàn kênh là $V = 1000/3 approx 333","33 space m^3$.]),
    [Thời gian bơm đầy kênh là $t = 10$ phút.],
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 2.8
      let p(x, y, z) = ((y - 0.4 * x) * sc, (z - 0.28 * x) * sc)
      let hfill = rgb(173, 216, 230, 130)
      let wfill = rgb(100, 160, 220, 100)

      // Mặt sau — Tô vùng parabol (z từ 0 đến 1)
      let bot-left = ()
      let bot-right = ()
      for i in range(0, 101) {
        let z = i * 1.0 / 100
        let hw = calc.sqrt(z)
        bot-left.push(p(0, -hw, z))
        bot-right.push(p(0, hw, z))
      }
      let poly-bot = ()
      for pt in bot-left { poly-bot.push(pt) }
      poly-bot.push(p(0, 0, 0))
      for pt in bot-right.rev() { poly-bot.push(pt) }
      line(..poly-bot, close: true, fill: hfill, stroke: none)

      // Tô vùng hình chữ nhật (z từ 1 đến 2)
      line(p(0, -1, 1), p(0, 1, 1), p(0, 1, 2), p(0, -1, 2), close: true, fill: hfill, stroke: none)

      // Tô đáy kênh (z=0)
      line(p(0, -0.01, 0), p(0, 0.01, 0), p(4, 0.01, 0), p(4, -0.01, 0), close: true, fill: hfill, stroke: none)
      line(p(0, -1, 1), p(0, 1, 1), p(4, 1, 1), p(4, -1, 1), close: true, fill: hfill, stroke: none)

      // Vẽ parabol đầy
      let para = ()
      for i in range(-80, 81) {
        let y = i * 1.2 / 80
        para.push(p(0, y, y * y))
      }
      line(..para, stroke: 0.5pt)

      // Biên mặt sau
      line(..bot-left, stroke: 1.2pt + red)
      line(..bot-right, stroke: 1.2pt + red)
      // Thành hình chữ nhật
      line(p(0, -1, 1), p(0, -1, 2), stroke: 1.2pt + red)
      line(p(0, 1, 1), p(0, 1, 2), stroke: 1.2pt + red)
      line(p(0, -1, 2), p(0, 1, 2), stroke: 1.2pt + red)
      // Đường tiếp giáp
      line(p(0, -1, 1), p(0, 1, 1), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))

      // Biên mặt trước
      let fa-l = ()
      let fa-r = ()
      for i in range(0, 101) {
        let z = i * 1.0 / 100
        let hw = calc.sqrt(z)
        fa-l.push(p(4, -hw, z))
        fa-r.push(p(4, hw, z))
      }
      line(..fa-l, stroke: 1.2pt + red)
      line(..fa-r, stroke: 1.2pt + red)
      line(p(4, -1, 1), p(4, -1, 2), stroke: 1.2pt + red)
      line(p(4, 1, 1), p(4, 1, 2), stroke: 1.2pt + red)
      line(p(4, -1, 2), p(4, 1, 2), stroke: 1.2pt + red)

      // Đường sinh
      line(p(0, -1, 2), p(4, -1, 2), stroke: 1.2pt + red)
      line(p(0, 1, 2), p(4, 1, 2), stroke: 1.2pt + red)
      line(p(0, -1, 1), p(4, -1, 1), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
      line(p(0, 1, 1), p(4, 1, 1), stroke: 0.8pt + red)
      line(p(0, 0, 0), p(4, 0, 0), stroke: (paint: red, thickness: 1pt, dash: "dashed"))

      // Trục
      line(p(0, 0, 0), p(5.2, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(5.2, -0.1, 0), $x$)
      line(p(0, -1.4, 0), p(0, 1.6, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 1.6, -0.12), $y$)
      line(p(0, 0, -0.2), p(0, 0, 2.4), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.15, 2.3), $z$)
      content(p(0, 0.1, -0.2), $O$)

      // Kích thước
      line(p(0, -1, 2.3), p(0, 1, 2.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 2.5), text(size: 9pt)[$2$])
      line(p(0, 1.4, 0), p(0, 1.4, 2), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 1.7, 1), text(size: 9pt)[$2$])

      // Nhãn
      content(p(0, 0.2, 0.5), $(P)$)
      content(p(2, -0.3, 1.7), text(fill: rgb("555555"), size: 9pt)[Hình chữ nhật])
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Chiều rộng mặt cắt ngang])
    Ở phần parabol $0 <= z <= 1$, ta có
    $
      z = y^2 => y = plus.minus sqrt(z) => w_1(z) = 2sqrt(z).
    $
    Ở phần hình chữ nhật $1 <= z <= 2$, chiều rộng không đổi nên $w_2 = 2$.
    *Mệnh đề (a) ĐÚNG.*

    #step([Diện tích mặt cắt tổng])
    $
      S = integral_0^1 2sqrt(z) d z + integral_1^2 2 d z
      = [4/3 z^(3/2)]_0^1 + [2z]_1^2
      = 4/3 + 2
      = 10/3
      approx 3","33 space m^2.
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Thể tích kênh])
    $
      V = S dot L = (10/3) dot 100 = 1000/3 approx 333","33 space m^3.
    $
    *Mệnh đề (c) ĐÚNG.*

    #step([Thời gian bơm đầy])
    $
      t = V/Q = (1000/3)/0","5 = 2000/3 approx 666","7.
    $
    Suy ra thời gian bơm đầy kênh xấp xỉ $666","7$ giây, tức khoảng $11","1$ phút.
    Vì vậy khẳng định $10$ phút là sai. *Mệnh đề (d) SAI.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 6 — SÀN NHÀ VÒM (KHỐI TRỤ PARABOL)
// ═══════════════════════════════════════════════════════════════════════
= Bài 6 — Nhà Kho Mái Vòm Parabol

#ds(
  [Một nhà kho có mặt cắt ngang hình vòm parabol $(P): z = 4 - y^2$ ($-2 <= y <= 2$, $z >= 0$, đơn vị: mét). Chiều dài nhà kho $10$ m. Bên trong nhà kho, người ta cần đặt một kệ hàng hình hộp chữ nhật với đáy rộng $2a$ m (đối xứng qua trục $z$), cao $h$ m, chiều dài $10$ m. Kệ hàng phải nằm gọn trong vòm.],
  (
    True([Với $a = 1$, chiều cao tối đa của kệ là $h = 3$ m (kệ chạm đúng vòm tại 2 cạnh trên).]),
    True([Thể tích của kệ hàng là $V_"kệ" = 2a(4 - a^2) dot 10 = 20a(4-a^2)$.]),
    True([Thể tích kệ lớn nhất đạt được khi $a = 2/sqrt(3)$, $V_"max" = (320sqrt(3))/9 approx 61","6 space m^3$.]),
    [Tỉ lệ thể tích kệ hàng tối ưu trên thể tích vòm parabol là $50\%$.],
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 1.8
      let p(x, y, z) = ((y - 0.4 * x) * sc, (z - 0.28 * x) * sc)
      let vfill = rgb(200, 230, 200, 150)
      let kfill = rgb(255, 200, 100, 180)

      // Tô vòm
      let arc = ()
      for i in range(-100, 101) {
        let y = i * 2.0 / 100
        let z = 4 - y * y
        if z >= 0 { arc.push(p(0, y, z)) }
      }
      let poly = ()
      for pt in arc { poly.push(pt) }
      poly.push(p(0, 2, 0))
      poly.push(p(0, -2, 0))
      line(..poly, close: true, fill: vfill, stroke: none)

      // Tô kệ (a=1.15 ≈ 2/√3)
      let a = 1.155
      let h = 4 - a * a
      line(p(0, -a, 0), p(0, a, 0), p(0, a, h), p(0, -a, h), close: true, fill: kfill, stroke: none)

      // Vẽ vòm mặt sau
      line(..arc, stroke: 1.2pt + red)
      line(p(0, -2, 0), p(0, 2, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))

      // Kệ mặt sau
      line(p(0, -a, 0), p(0, a, 0), stroke: 1.5pt + rgb("8B4513"))
      line(p(0, -a, 0), p(0, -a, h), stroke: 1.5pt + rgb("8B4513"))
      line(p(0, a, 0), p(0, a, h), stroke: 1.5pt + rgb("8B4513"))
      line(p(0, -a, h), p(0, a, h), stroke: 1.5pt + rgb("8B4513"))

      // Vòm mặt trước
      let fa = ()
      for i in range(-100, 101) {
        let y = i * 2.0 / 100
        let z = 4 - y * y
        if z >= 0 { fa.push(p(6, y, z)) }
      }
      line(..fa, stroke: 1.2pt + red)
      line(p(6, -2, 0), p(6, 2, 0), stroke: 1.2pt + red)

      // Kệ mặt trước
      line(p(6, -a, 0), p(6, a, 0), stroke: 1.5pt + rgb("8B4513"))
      line(p(6, -a, 0), p(6, -a, h), stroke: 1.5pt + rgb("8B4513"))
      line(p(6, a, 0), p(6, a, h), stroke: 1.5pt + rgb("8B4513"))
      line(p(6, -a, h), p(6, a, h), stroke: 1.5pt + rgb("8B4513"))

      // Đường sinh vòm
      line(p(0, -2, 0), p(6, -2, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, 2, 0), p(6, 2, 0), stroke: 1.2pt + red)
      line(p(0, 0, 4), p(6, 0, 4), stroke: 1.2pt + red)

      // Đường sinh kệ
      line(p(0, -a, 0), p(6, -a, 0), stroke: (paint: rgb("8B4513"), thickness: 0.8pt, dash: "dashed"))
      line(p(0, a, 0), p(6, a, 0), stroke: 0.8pt + rgb("8B4513"))
      line(p(0, -a, h), p(6, -a, h), stroke: (paint: rgb("8B4513"), thickness: 0.8pt, dash: "dashed"))
      line(p(0, a, h), p(6, a, h), stroke: 0.8pt + rgb("8B4513"))

      // Trục
      line(p(0, 0, 0), p(7.5, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(7.5, -0.1, 0), $x$)
      line(p(0, -2.5, 0), p(0, 2.8, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 2.8, -0.12), $y$)
      line(p(0, 0, -0.2), p(0, 0, 4.7), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.15, 4.5), $z$)
      content(p(0, 0.1, -0.3), $O$)

      // Kích thước
      line(p(0, -2, 4.4), p(0, 2, 4.4), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 4.65), text(size: 9pt)[$4$])
      line(p(0, 2.7, 0), p(0, 2.7, 4), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 3.2, 2), text(size: 9pt)[$4$])

      // Nhãn kệ
      content(p(3, 0, h / 2 + 0.3), text(fill: rgb("8B4513"), size: 9pt)[Kệ hàng])
      // Nhãn vòm
      content(p(0, 0.3, 2.5), $(P)$)
      // Nhãn 2a
      line(p(6.5, -a, -0.3), p(6.5, a, -0.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(6.5, 0, -0.55), text(size: 9pt)[$2a$])
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Với $a=1$, chiều cao tối đa của kệ])
    Khi $a = 1$, kệ rộng $2a = 2$ nên hai cạnh trên nằm tại $y = plus.minus 1$.
    Trên vòm parabol,
    $
      z = 4 - y^2 => z = 4 - 1 = 3.
    $
    Vậy chiều cao tối đa $h = 3$ m. *Mệnh đề (a) ĐÚNG.*

    #step([Thể tích kệ tổng quát])
    Khi kệ chạm vòm tại $y = plus.minus a$, chiều cao của kệ là
    $
      h = 4 - a^2.
    $
    Do đó
    $
      V_"kệ" = 2a dot h dot 10 = 2a(4-a^2) dot 10 = 20a(4-a^2).
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Thể tích kệ tối đa])
    Xét hàm
    $
      V(a) = 20(4a - a^3).
    $
    Khi đó
    $
      V'(a) = 20(4 - 3a^2) = 0 => a = 2/sqrt(3).
    $
    Suy ra
    $
      h = 4 - a^2 = 4 - 4/3 = 8/3,
    $
    và
    $
      V_"max" = 20 dot 2/sqrt(3) dot 8/3
      = 320/(3sqrt(3))
      = (320sqrt(3))/9
      approx 61","6 space m^3.
    $
    *Mệnh đề (c) ĐÚNG.*

    #step([Tỉ lệ thể tích])
    Thể tích phần vòm là
    $
      V_"vòm" = 10 dot integral_(-2)^2 (4-y^2) d y
      = 10 dot [4y - y^3/3]_(-2)^2
      = 320/3.
    $
    Vì thế
    $
      V_"max" / V_"vòm"
      = (320sqrt(3)/9)/(320/3)
      = sqrt(3)/3
      = 1/sqrt(3)
      approx 57","7\%.
    $
    Khẳng định $50\%$ là sai. *Mệnh đề (d) SAI.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 7 — MÁNG TƯỚI V-HÌNH TIẾT DIỆN PARABOL (ĐỈNH TẠI O)
// ═══════════════════════════════════════════════════════════════════════
= Bài 7 — Máng Tưới Tiết Diện Parabol Đỉnh Nhọn

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, được giới hạn bởi parabol $(P)$ có đỉnh tại $O(0; 0; 0)$ và đoạn $C'D'$ như hình vẽ. Hình không gian $(K)$ có hai đáy dạng $(H)$ và chiều dài $3$ m. Một máng nước có dạng $(K)$, đáy nhọn hướng xuống, miệng $C'D'$ để hở. Vòi nước lưu lượng $0","04 space (m^3 \/ "phút")$ chảy vào máng.],
  (
    True([Phương trình parabol $(P)$ là $z = y^2$.]),
    True([Diện tích hình phẳng $(H)$ bằng $4/3 approx 1","33 space m^2$ (làm tròn đến hàng phần trăm).]),
    True([Thời gian để nước chảy đầy máng $(K)$ là $100$ phút.]),
    True([Sau $60$ phút, chiều cao mực nước so với đáy máng bằng $0","71$ m (làm tròn đến hàng phần trăm).]),
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 3.5
      let p(x, y, z) = ((y - 0.5 * x) * sc, (z - 0.35 * x) * sc)
      let hfill = rgb(173, 216, 230, 150)

      // Tô hình H (parabol z=y^2, z từ 0 đến 1)
      let left = ()
      let right = ()
      for i in range(0, 101) {
        let z = i * 1.0 / 100
        let hw = calc.sqrt(z)
        left.push(p(0, -hw, z))
        right.push(p(0, hw, z))
      }
      let poly = ()
      poly.push(p(0, 0, 0))
      for pt in right { poly.push(pt) }
      for pt in left.rev() { poly.push(pt) }
      line(..poly, close: true, fill: hfill, stroke: none)

      // Tô đáy máng theo chiều dài (rất hẹp ở z=0)
      line(p(0, 0, 0), p(0, 0, 0), p(3, 0, 0), p(3, 0, 0), close: true, fill: hfill, stroke: none)
      // Tô mặt phẳng miệng (hình giữa hai đáy)
      line(p(0, -1, 1), p(0, 1, 1), p(3, 1, 1), p(3, -1, 1), close: true, fill: hfill, stroke: none)

      // Vẽ parabol đầy mặt sau
      let para = ()
      for i in range(-80, 81) {
        let y = i * 1.2 / 80
        para.push(p(0, y, y * y))
      }
      line(..para, stroke: 0.5pt)

      // Sườn giữa tạo độ sâu
      for xv in (0.75, 1.5, 2.25) {
        let pts = ()
        for i in range(0, 101) {
          let z = i * 1.0 / 100
          pts.push(p(xv, -calc.sqrt(z), z))
        }
        let pts2 = ()
        for i in range(0, 101) {
          let z = i * 1.0 / 100
          pts2.push(p(xv, calc.sqrt(z), z))
        }
        line(p(xv, 0, 0), ..pts2, stroke: section-grid-stroke)
        line(p(xv, 0, 0), ..pts, stroke: section-grid-stroke)
        line(p(xv, -1, 1), p(xv, 1, 1), stroke: section-grid-stroke)
      }

      // Biên máng mặt sau
      line(..left, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..right, stroke: 1.2pt + red)
      line(p(0, -1, 1), p(0, 1, 1), stroke: 1.2pt + red)

      // Biên máng mặt trước
      let fl = ()
      let fr = ()
      for i in range(0, 101) {
        let z = i * 1.0 / 100
        fl.push(p(3, -calc.sqrt(z), z))
        fr.push(p(3, calc.sqrt(z), z))
      }
      line(..fl, stroke: 1.2pt + red)
      line(..fr, stroke: 1.2pt + red)
      line(p(3, -1, 1), p(3, 1, 1), stroke: 1.2pt + red)

      // Đường sinh
      line(p(0, -1, 1), p(3, -1, 1), stroke: 1.2pt + red)
      line(p(0, 1, 1), p(3, 1, 1), stroke: 1.2pt + red)
      line(p(0, 0, 0), p(3, 0, 0), stroke: (paint: red, thickness: 1pt, dash: "dashed"))

      // Nhãn đỉnh
      content(p(0, 0, 0.08), $O$)
      content(p(0, -1.1, 1.1), $D'$)
      content(p(0, 1.1, 1.1), $C'$)
      content(p(3, -1.1, 1.1), $A'$)
      content(p(3, 1.1, 1.1), $B'$)

      // Trục
      line(p(0, 0, 0), p(3.8, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(3.8, -0.1, 0), $x$)
      line(p(0, -1.4, 0), p(0, 1.6, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 1.6, -0.1), $y$)
      line(p(0, 0, -0.1), p(0, 0, 1.4), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.12, 1.3), $z$)

      // Kích thước
      line(p(0, -1, 1.2), p(0, 1, 1.2), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 1.35), $2$)
      line(p(0, 1.3, 0), p(0, 1.3, 1), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 1.55, 0.5), $1$)
      line(p(-0.8, -0.8, -0.3), p(1.2, -0.8, -0.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(1.5, -0.7, -0.4), $3$)

      // Nhãn
      content(p(0, 0.4, 0.5), $(H)$)
      content(p(0.4, -0.7, 0.55), $(P)$)
      line(p(0.3, -0.7, 0.5), p(0, -0.65, 0.42), mark: (end: ">"), stroke: 0.5pt)
      content(p(1.8, -0.6, 0.7), $(K)$)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Lập phương trình parabol $(P)$])
    Parabol có đỉnh tại $O$ và trục đối xứng là trục $O z$ nên có dạng $z = a y^2$.
    Miệng máng nằm ở cao độ $z = 1$ và rộng $2$ m, nên điểm $C'(1; 1)$ thuộc $(P)$.
    Vì thế
    $
      1 = a(1)^2 => a = 1.
    $
    Vậy $(P): z = y^2$. *Mệnh đề (a) ĐÚNG.*

    #step([Tính diện tích $(H)$])
    Với $0 <= z <= 1$, từ $(P)$ suy ra
    $
      y = plus.minus sqrt(z),
      quad w(z) = 2sqrt(z).
    $
    $
      S_(H) = integral_0^1 2sqrt(z) d z = [4/3 z^(3/2)]_0^1 = 4/3 approx 1","33 space m^2.
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Thời gian chảy đầy máng])
    $
      V = S_(H) times L = 4/3 times 3 = 4 space m^3,
      quad t = V/Q = 4/0","04 = 100.
    $
    Suy ra thời gian chảy đầy máng là $100$ phút. *Mệnh đề (c) ĐÚNG.*

    #step([Mực nước sau 60 phút])
    Sau $60$ phút,
    $
      V_(60) = 60 times 0","04 = 2","4 space m^3,
      quad A = V_(60)/L = 2","4/3 = 0","8 space m^2.
    $
    Khi đó
    $
      4/3 k^(3/2) = 0","8
      => k^(3/2) = 0","6
      => k = 0","6^(2/3) approx 0","7114.
    $
    Suy ra $k approx 0","71$ m.
    *Mệnh đề (d) ĐÚNG.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 8 — CỐNG TIẾT DIỆN NỬA ELIP ĐỨNG
// ═══════════════════════════════════════════════════════════════════════
= Bài 8 — Cống Thoát Nước Tiết Diện Nửa Elip

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$ là nửa trên của elip $(E): y^2/9 + z^2/4 = 1$ ($z >= 0$), giới hạn bởi $(E)$ và đoạn $C D$ trên trục $O y$. Hình không gian $(K)$ là cống thoát nước, chiều dài $L = 50$ m, tiết diện hình $(H)$. Nước chảy đầy cống với vận tốc đều $v = 0","1$ m/s.],
  (
    True([Chiều rộng mặt cắt ngang tại cao độ $z$ ($0 <= z <= 2$) là $w(z) = 3 sqrt(4 - z^2)$.]),
    True([Diện tích tiết diện cống bằng $3 pi approx 9","42 space m^2$ (làm tròn đến hàng phần trăm).]),
    True([Lưu lượng nước trong cống là $Q = 0","3 pi approx 0","94 space m^3/s$ (làm tròn đến hàng phần trăm).]),
    [Khi mực nước chỉ dâng đến $z = 1$ m, diện tích mặt cắt ngập nước bằng $50\%$ diện tích toàn tiết diện.],
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 2.6
      let p(x, y, z) = ((y - 0.45 * x) * sc, (z - 0.30 * x) * sc)
      let hfill = rgb(100, 180, 220, 130)
      let wfill = rgb(173, 216, 230, 80)

      // Tô hình H (nửa elip trên, z từ 0 đến 2)
      let left = ()
      let right = ()
      for i in range(0, 101) {
        let z = i * 2.0 / 100
        let hw = 3 * calc.sqrt(calc.max(0, 1 - z * z / 4))
        left.push(p(0, hw, z))
        right.push(p(0, -hw, z))
      }
      let poly = ()
      poly.push(p(0, -3, 0))
      for pt in left.rev() { poly.push(pt) }
      for pt in right { poly.push(pt) }
      poly.push(p(0, 3, 0))
      line(..poly, close: true, fill: hfill, stroke: none)

      // Tô đáy (z=0, y từ -3 đến 3)
      line(p(0, -3, 0), p(0, 3, 0), p(4, 3, 0), p(4, -3, 0), close: true, fill: wfill, stroke: none)

      // Vẽ elip đầy mặt sau
      let ell = ()
      for i in range(-100, 101) {
        let y = i * 3.0 / 100
        let z = 2 * calc.sqrt(calc.max(0, 1 - y * y / 9))
        ell.push(p(0, y, z))
      }
      line(p(0, -3, 0), ..ell, p(0, 3, 0), stroke: 0.5pt)

      // Gạch mức z=1 (đường chấm nước bên trong)
      let wl = ()
      for i in range(-100, 101) {
        let y = i * 3.0 / 100
        let hw = 3 * calc.sqrt(calc.max(0, 1 - 1.0 / 4))
        if calc.abs(y) <= hw { wl.push(p(0, y, 1)) }
      }
      line(..wl, stroke: (paint: blue.lighten(30%), thickness: 0.8pt, dash: "dashed"))
      content(p(0, 3.3, 1), text(fill: blue, size: 9pt)[$z=1$])

      // Sườn giữa tạo độ sâu
      for xv in (1.0, 2.0, 3.0) {
        let pts = ()
        for i in range(0, 101) {
          let z = i * 2.0 / 100
          let hw = 3 * calc.sqrt(calc.max(0, 1 - z * z / 4))
          pts.push(p(xv, -hw, z))
        }
        let pts2 = ()
        for i in range(0, 101) {
          let z = i * 2.0 / 100
          let hw = 3 * calc.sqrt(calc.max(0, 1 - z * z / 4))
          pts2.push(p(xv, hw, z))
        }
        line(p(xv, -3, 0), ..pts, stroke: section-grid-stroke)
        line(p(xv, 3, 0), ..pts2, stroke: section-grid-stroke)
        line(p(xv, -3, 0), p(xv, 3, 0), stroke: section-grid-stroke)
      }

      // Biên cống mặt sau
      line(p(0, -3, 0), p(0, 3, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      let lb = ()
      let rb = ()
      for i in range(0, 101) {
        let z = i * 2.0 / 100
        let hw = 3 * calc.sqrt(calc.max(0, 1 - z * z / 4))
        lb.push(p(0, -hw, z))
        rb.push(p(0, hw, z))
      }
      line(..lb, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..rb, stroke: 1.2pt + red)

      // Biên cống mặt trước
      line(p(4, -3, 0), p(4, 3, 0), stroke: 1.2pt + red)
      let lf = ()
      let rf = ()
      for i in range(0, 101) {
        let z = i * 2.0 / 100
        let hw = 3 * calc.sqrt(calc.max(0, 1 - z * z / 4))
        lf.push(p(4, -hw, z))
        rf.push(p(4, hw, z))
      }
      line(..lf, stroke: 1.2pt + red)
      line(..rf, stroke: 1.2pt + red)

      // Đường sinh
      line(p(0, -3, 0), p(4, -3, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, 3, 0), p(4, 3, 0), stroke: 1.2pt + red)
      line(p(0, 0, 2), p(4, 0, 2), stroke: 1.2pt + red)

      // Nhãn
      content(p(0, -3.2, 0.1), $D$)
      content(p(0, 3.2, 0.1), $C$)
      content(p(0, 0.1, -0.2), $O$)
      content(p(4, -3.2, 0.1), $A$)
      content(p(4, 3.2, 0.1), $B$)

      // Trục
      line(p(0, 0, 0), p(5.3, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(5.3, -0.1, 0), $x$)
      line(p(0, -3.6, 0), p(0, 4.0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 4.0, -0.12), $y$)
      line(p(0, 0, -0.2), p(0, 0, 2.7), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.18, 2.6), $z$)

      // Kích thước
      line(p(0, -3, 2.4), p(0, 3, 2.4), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 2.65), $6$)
      line(p(0, 3.8, 0), p(0, 3.8, 2), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 4.3, 1), $2$)
      line(p(-1, -2.5, -0.4), p(2, -2.5, -0.4), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(2.5, -2.4, -0.55), text(size: 9pt)[$50$])

      // Nhãn H, E
      content(p(0, 0.5, 1.0), $(H)$)
      content(p(0.5, -2.5, 1.3), $(E)$)
      line(p(0.4, -2.4, 1.1), p(0, -2.4, 0.9), mark: (end: ">"), stroke: 0.5pt)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Chiều rộng mặt cắt tại cao độ $z$])
    Từ phương trình elip
    $
      y^2/9 + z^2/4 = 1,
    $
    suy ra
    $
      y = plus.minus 3 sqrt(1 - z^2/4) = plus.minus 3/2 sqrt(4-z^2).
    $
    Do đó
    $
      w(z) = 2 times 3/2 sqrt(4-z^2) = 3sqrt(4-z^2).
    $
    *Mệnh đề (a) ĐÚNG.*

    #step([Diện tích tiết diện])
    $
      S = integral_0^2 3 sqrt(4-z^2) d z.
    $
    Đặt $z = 2 sin theta$, khi đó $d z = 2 cos theta d theta$ và các cận trở thành $0$ đến $pi/2$.
    $
      S = integral_0^(pi/2) 3 dot 2 cos theta dot 2 cos theta d theta
      = 12 integral_0^(pi/2) cos^2 theta d theta = 12 dot pi/4 = 3 pi approx 9","42 space m^2.
    $
    Kết quả này cũng đúng với công thức nửa diện tích elip: $1/2 pi dot 3 dot 2 = 3 pi$.
    *Mệnh đề (b) ĐÚNG.*

    #step([Lưu lượng nước])
    $
      Q = S dot v = 3 pi dot 0","1 = 0","3 pi approx 0","94 space m^3/s.
    $
    *Mệnh đề (c) ĐÚNG.*

    #step([Diện tích ngập khi $z = 1$ m])
    $
      S_1 = integral_0^1 3 sqrt(4-z^2) d z = 3 [z/2 sqrt(4-z^2) + 2 arcsin(z/2)]_0^1.
    $
    Suy ra
    $
      S_1 = 3 [sqrt(3)/2 + pi/3] = (3sqrt(3))/2 + pi approx 5","74 space m^2.
    $
    Do đó
    $
      S_1 / S = 5","74 / (3 pi) approx 60","9\%.
    $
    Khẳng định $50\%$ là sai. *Mệnh đề (d) SAI.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 9 — BỂ NƯỚC PARABOL DẠNG GỐC (ĐỈNH DƯỚI ĐÁY)
// ═══════════════════════════════════════════════════════════════════════
= Bài 9 — Bể Chứa Nước Mưa Tiết Diện Parabol Lõm

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, được giới hạn bởi parabol $(P)$ và hai đoạn $C D$, $C' D'$ như hình vẽ. Parabol $(P)$ có đỉnh tại $V$ nằm dưới đáy bể ($z < 0$). Hình không gian $(K)$ có chiều dài $4$ m, hai đáy hình $(H)$, đáy $A B C D$ kín nằm dưới ($z = 0$), miệng $A' B' C' D'$ để hở ($z = 3$). Vòi nước lưu lượng $0","2 space (m^3 \/ "phút")$ chảy vào bể.],
  (
    True([Phương trình parabol $(P)$ là $z = 4y^2 - 1$.]),
    True([Chiều rộng mặt cắt ngang tại cao độ $z$ ($0 <= z <= 3$) là $w(z) = sqrt(z+1)$.]),
    True([Diện tích hình phẳng $(H)$ bằng $14/3 approx 4","67 space m^2$ (làm tròn đến hàng phần trăm).]),
    [Thời gian để nước chảy đầy bể $(K)$ là $90$ phút.],
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 3.2
      let p(x, y, z) = ((y - 0.5 * x) * sc, (z - 0.35 * x) * sc)
      let hfill = rgb(173, 216, 230, 150)
      let y0 = 0.5 // tại z=0: y = ±sqrt(1/4) = ±0.5

      // Tô hình H (parabol z=4y^2-1, z từ 0 đến 3)
      let left = ()
      let right = ()
      for i in range(0, 101) {
        let z = i * 3.0 / 100
        let hw = calc.sqrt((z + 1) / 4)
        left.push(p(0, -hw, z))
        right.push(p(0, hw, z))
      }
      let poly = ()
      for pt in left { poly.push(pt) }
      for pt in right.rev() { poly.push(pt) }
      line(..poly, close: true, fill: hfill, stroke: none)
      // Tô đáy ABCD
      line(p(0, -y0, 0), p(0, y0, 0), p(4, y0, 0), p(4, -y0, 0), close: true, fill: hfill, stroke: none)

      // Vẽ parabol đầy (kể cả phần dưới z=0)
      let para = ()
      for i in range(-80, 81) {
        let y = i * 1.1 / 80
        para.push(p(0, y, 4 * y * y - 1))
      }
      line(..para, stroke: 0.5pt)

      // Sườn giữa
      for xv in (1.0, 2.0, 3.0) {
        let pl = ()
        let pr = ()
        for i in range(0, 101) {
          let z = i * 3.0 / 100
          let hw = calc.sqrt((z + 1) / 4)
          pl.push(p(xv, -hw, z))
          pr.push(p(xv, hw, z))
        }
        line(..pl, stroke: section-grid-stroke)
        line(..pr, stroke: section-grid-stroke)
        line(p(xv, -y0, 0), p(xv, y0, 0), stroke: section-grid-stroke)
        line(p(xv, -1, 3), p(xv, 1, 3), stroke: section-grid-stroke)
      }

      // Biên bể mặt sau
      line(p(0, -1, 3), p(0, 1, 3), stroke: 1.2pt + red)
      line(p(0, -y0, 0), p(0, y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..left, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..right, stroke: 1.2pt + red)

      // Biên bể mặt trước
      line(p(4, -1, 3), p(4, 1, 3), stroke: 1.2pt + red)
      line(p(4, -y0, 0), p(4, y0, 0), stroke: 1.2pt + red)
      let fl = ()
      let fr = ()
      for i in range(0, 101) {
        let z = i * 3.0 / 100
        let hw = calc.sqrt((z + 1) / 4)
        fl.push(p(4, -hw, z))
        fr.push(p(4, hw, z))
      }
      line(..fl, stroke: 1.2pt + red)
      line(..fr, stroke: 1.2pt + red)

      // Đường sinh
      line(p(0, -1, 3), p(4, -1, 3), stroke: 1.2pt + red)
      line(p(0, 1, 3), p(4, 1, 3), stroke: 1.2pt + red)
      line(p(0, -y0, 0), p(4, -y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, y0, 0), p(4, y0, 0), stroke: 1.2pt + red)

      // Đỉnh parabol V (dưới đáy)
      let vz = -1.0
      content(p(0, 0.08, vz + 0.05), text(size: 9pt)[$V$])
      circle(p(0, 0, vz), radius: 1.5pt, fill: gray)
      line(p(0, 0, 0), p(0, 0, vz), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      content(p(0, -0.15, vz - 0.05), text(size: 9pt)[$-1$])

      // Nhãn đỉnh
      content(p(0, -1.15, 3.12), $D'$)
      content(p(0, 1.15, 3.12), $C'$)
      content(p(0, -0.55, 0.12), $D$)
      content(p(0, 0.55, 0.12), $C$)
      content(p(4, -1.15, 3.12), $A'$)
      content(p(4, 1.15, 3.12), $B'$)
      content(p(4, -0.55, 0.12), $A$)
      content(p(4, 0.55, 0.12), $B$)

      // Trục
      line(p(0, 0, 0), p(5.2, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(5.2, -0.1, 0), $x$)
      line(p(0, -1.4, 0), p(0, 1.6, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 1.6, -0.12), $y$)
      line(p(0, 0, -1.3), p(0, 0, 3.6), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.15, 3.5), $z$)
      content(p(0, 0.08, -0.12), $O$)

      // Kích thước
      line(p(0, -1, 3.4), p(0, 1, 3.4), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 3.6), $2$)
      line(p(0, 1.4, 0), p(0, 1.4, 3), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 1.7, 1.5), $3$)
      line(p(-1, -1, -0.7), p(1, -1, -0.7), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(1.4, -0.9, -0.85), $4$)
      line(p(0, -y0, 0.2), p(0, y0, 0.2), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 0.38), text(size: 9pt)[$1$])

      // Nhãn H, P, K
      content(p(0, 0.5, 1.5), $(H)$)
      content(p(0, -0.9, 2.0), $(P)$)
      line(p(0, -0.85, 1.85), p(0, -0.7, 1.5), mark: (end: ">"), stroke: 0.5pt)
      content(p(2, -1.0, 1.8), $(K)$)
    })
  ],
  fig-pos: "center",
  fig-width: 40%,
  loigiai: [
    #step([Lập phương trình parabol $(P)$])
    Parabol có đỉnh trên trục $O z$ nên có dạng $z = a y^2 + c$.
    Từ đáy $C D$ tại $z = 0$ và bề rộng đáy bằng $1$ m, điểm $C(0","5; 0)$ thuộc $(P)$:
    $
      0 = a(0","5)^2 + c => c = -a/4.
    $
    Từ miệng $C'D'$ tại $z = 3$ và bề rộng miệng bằng $2$ m, điểm $C'(1; 3)$ cũng thuộc $(P)$:
    $
      3 = a + c = a - a/4 = 3a/4 => a = 4,
      quad c = -1.
    $
    Vậy $(P): z = 4y^2 - 1$. *Mệnh đề (a) ĐÚNG.*

    #step([Chiều rộng mặt cắt tại $z$])
    Từ $4y^2 = z + 1$, suy ra
    $
      y = plus.minus 1/2 sqrt(z+1),
      quad w(z) = sqrt(z+1).
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Diện tích $(H)$])
    $
      S_(H) = integral_0^3 sqrt(z+1) dif z = [2/3 (z+1)^(3/2)]_0^3
      = 2/3 (4^(3/2) - 1) = 2/3 (8 - 1) = 14/3 approx 4","67 space m^2.
    $
    *Mệnh đề (c) ĐÚNG.*

    #step([Thời gian chảy đầy bể])
    $
      V = S_(H) times L = 14/3 times 4 = 56/3 approx 18","67 space m^3,
    $
    và
    $
      t = V/Q = (56/3) / 0","2 = 280/3 approx 93","3.
    $
    Vậy thời gian đúng là khoảng $93","3$ phút, không phải $90$ phút. *Mệnh đề (d) SAI.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BẢNG TỔNG KẾT
// ═══════════════════════════════════════════════════════════════════════
// ═══════════════════════════════════════════════════════════════════════
// BÀI 10 — BỂ NHŨ TƯƠNG TIẾT DIỆN PARABOL (ĐỀ KIỂU GỐC)
// ═══════════════════════════════════════════════════════════════════════
= Bài 10 — Bồn Chứa Xăng Tiết Diện Parabol

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, được giới hạn bởi parabol $(P)$ và hai đoạn $C D$, $C' D'$ như hình vẽ. Hình không gian $(K)$ có hai đáy dạng $(H)$ và chiều dài $5$ m. Bồn xăng hình $(K)$, đáy $A B C D$ kín nằm dưới, miệng $A' B' C' D'$ để hở ở trên. Vòi bơm lưu lượng không đổi $0","1 space (m^3 \/ "phút")$.],
  (
    True([Phương trình parabol $(P)$ là $z = 3y^2 - 0","3$.]),
    True([Diện tích hình phẳng $(H)$ bằng $0","89 space m^2$ (làm tròn đến hàng phần trăm).]),
    True([Thời gian để bơm đầy bồn là khoảng $44","27$ phút.]),
    True([Sau $24$ phút, chiều cao mực xăng so với đáy bồn bằng $0","55$ m (làm tròn đến hàng phần trăm).]),
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 3.5
      let p(x, y, z) = ((y - 0.5 * x) * sc, (z - 0.35 * x) * sc)
      // y0: tại z=0, 3y^2=0.3 → y=sqrt(0.1)≈0.3162
      let y0 = calc.sqrt(0.1)
      // y1: tại z=0.9, 3y^2=1.2 → y=0.6325
      let y1 = calc.sqrt(0.4)
      let hfill = rgb(255, 220, 100, 150) // vàng xăng

      // Tô hình H (parabol z=3y^2 -0.3, z từ 0 đến 0.9)
      let left = ()
      let right = ()
      for i in range(0, 101) {
        let z = i * 0.9 / 100
        let hw = calc.sqrt((z + 0.3) / 3)
        left.push(p(0, hw, z))
        right.push(p(0, -hw, z))
      }
      let poly = ()
      poly.push(p(0, -y0, 0))
      for pt in left.rev() { poly.push(pt) }
      for pt in right { poly.push(pt) }
      poly.push(p(0, y1, 0.9))
      line(..poly, close: true, fill: hfill, stroke: none)
      // Tô đáy ABCD
      line(p(0, -y0, 0), p(0, y0, 0), p(5, y0, 0), p(5, -y0, 0), close: true, fill: hfill, stroke: none)

      // Vẽ parabol đầy mặt sau
      let para = ()
      for i in range(-80, 81) {
        let y = i * 0.7 / 80
        para.push(p(0, y, 3 * y * y - 0.3))
      }
      line(..para, stroke: 0.5pt)

      // Sườn giữa
      for xv in (1.25, 2.5, 3.75) {
        let pts = ()
        for i in range(0, 101) {
          let z = i * 0.9 / 100
          let hw = calc.sqrt((z + 0.3) / 3)
          pts.push(p(xv, -hw, z))
        }
        let pts2 = ()
        for i in range(0, 101) {
          let z = i * 0.9 / 100
          let hw = calc.sqrt((z + 0.3) / 3)
          pts2.push(p(xv, hw, z))
        }
        line(p(xv, -y0, 0), ..pts, stroke: section-grid-stroke)
        line(p(xv, y0, 0), ..pts2, stroke: section-grid-stroke)
        line(p(xv, -y1, 0.9), p(xv, y1, 0.9), stroke: section-grid-stroke)
        line(p(xv, -y0, 0), p(xv, y0, 0), stroke: section-grid-stroke)
      }

      // Biên bồn mặt sau
      line(p(0, -y1, 0.9), p(0, y1, 0.9), stroke: 1.2pt + red)
      line(p(0, -y0, 0), p(0, y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..left, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..right, stroke: 1.2pt + red)

      // Biên mặt trước
      line(p(5, -y1, 0.9), p(5, y1, 0.9), stroke: 1.2pt + red)
      line(p(5, -y0, 0), p(5, y0, 0), stroke: 1.2pt + red)
      let fl = ()
      let fr = ()
      for i in range(0, 101) {
        let z = i * 0.9 / 100
        let hw = calc.sqrt((z + 0.3) / 3)
        fl.push(p(5, -hw, z))
        fr.push(p(5, hw, z))
      }
      line(..fl, stroke: 1.2pt + red)
      line(..fr, stroke: 1.2pt + red)

      // Đường sinh
      line(p(0, -y1, 0.9), p(5, -y1, 0.9), stroke: 1.2pt + red)
      line(p(0, y1, 0.9), p(5, y1, 0.9), stroke: 1.2pt + red)
      line(p(0, -y0, 0), p(5, -y0, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, y0, 0), p(5, y0, 0), stroke: 1.2pt + red)

      // Đỉnh parabol V (dưới đáy, z= -0.3)
      let vz = -0.3
      circle(p(0, 0, vz), radius: 1.5pt, fill: gray)
      content(p(0, 0.08, vz - 0.08), text(size: 8pt)[$V$])
      line(p(0, 0, 0), p(0, 0, vz), stroke: (paint: gray, thickness: 0.4pt, dash: "dashed"))
      content(p(0, -0.2, vz - 0.05), text(size: 8pt)[$-0","3$])

      // Nhãn đỉnh
      content(p(0, -y1 - 0.1, 1.0), $D'$)
      content(p(0, y1 + 0.1, 1.0), $C'$)
      content(p(0, -y0 - 0.05, 0.1), $D$)
      content(p(0, y0 + 0.05, 0.1), $C$)
      content(p(5, -y1 - 0.1, 1.0), $A'$)
      content(p(5, y1 + 0.1, 1.0), $B'$)
      content(p(5, -y0 - 0.05, 0.1), $A$)
      content(p(5, y0 + 0.05, 0.1), $B$)

      // Trục
      line(p(0, 0, 0), p(6.5, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(6.5, -0.1, 0), $x$)
      line(p(0, -0.8, 0), p(0, 0.9, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 0.9, -0.1), $y$)
      line(p(0, 0, -0.5), p(0, 0, 1.3), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.12, 1.2), $z$)
      content(p(0, 0.08, -0.1), $O$)

      // Kích thước
      line(p(0, -y1, 1.1), p(0, y1, 1.1), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 1.25), $approx 1","26$)
      line(p(0, 0.8, 0), p(0, 0.8, 0.9), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 1.0, 0.45), $0","9$)
      line(p(-0.8, -0.7, -0.15), p(2, -0.7, -0.15), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(2.3, -0.6, -0.22), $5$)

      // Nhãn H, P, K
      content(p(0, 0.25, 0.45), $(H)$)
      content(p(0, -0.55, 0.5), $(P)$)
      line(p(0, -0.5, 0.45), p(0, -0.4, 0.25), mark: (end: ">"), stroke: 0.4pt)
      content(p(2.5, -0.6, 0.6), $(K)$)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Lập phương trình parabol $(P)$])
    Parabol có đỉnh $V(0; -0","3)$ nên có dạng $z = a y^2 - 0","3$.
    Nếu $a = 3$ thì tại cao độ $z = 0","9$ ta có
    $
      y = plus.minus sqrt((0","9 + 0","3)/3) = plus.minus sqrt(0","4),
    $
    nên bề rộng miệng là $2sqrt(0","4) approx 1","26$ m, khớp với hình vẽ.
    Vậy mô hình $(P): z = 3y^2 - 0","3$ là phù hợp. *Mệnh đề (a) ĐÚNG.*

    #step([Tính diện tích $(H)$])
    Với $0 <= z <= 0","9$, từ $(P)$ suy ra
    $
      y = plus.minus sqrt((z+0","3)/3),
      quad w(z) = 2sqrt((z+0","3)/3) = 2/sqrt(3) sqrt(z+0","3).
    $
    Do đó
    $
      S_(H) = integral_0^(0","9) 2/sqrt(3) sqrt(z+0","3) d z
      = 4/(3sqrt(3)) [(z+0","3)^(3/2)]_0^(0","9)
      = 4/(3sqrt(3)) ((1","2)^(3/2) - (0","3)^(3/2)).
    $
    Tính gần đúng,
    $
      S_(H) approx 0","8852 space m^2 approx 0","89 space m^2.
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Thời gian bơm đầy bồn])
    $
      V = S_(H) times L approx 0","8852 times 5 = 4","426 space m^3,
      quad t = V/Q approx 4","426/0","1 = 44","27.
    $
    Suy ra thời gian bơm đầy bồn khoảng $44","27$ phút. *Mệnh đề (c) ĐÚNG.*

    #step([Mực xăng sau $24$ phút])
    Sau $24$ phút,
    $
      V_(24) = 24 times 0","1 = 2","4 space m^3,
      quad A = V_(24)/L = 2","4/5 = 0","48 space m^2.
    $
    Khi đó $k$ thỏa
    $
      4/(3sqrt(3)) ((k+0","3)^(3/2) - (0","3)^(3/2)) = 0","48.
    $
    Suy ra
    $
      (k+0","3)^(3/2) = 0","48 dot 3sqrt(3)/4 + (0","3)^(3/2) approx 0","7879,
    $
    nên
    $
      k+0","3 approx 0","7879^(2/3) approx 0","8530
      => k approx 0","5530.
    $
    Vậy chiều cao mực xăng xấp xỉ $0","55$ m. *Mệnh đề (d) ĐÚNG.*
  ],
)

// ═══════════════════════════════════════════════════════════════════════
// BÀI 11 — BỂ NƯỚC MÁI VÒM PARABOL NGƯỢC (ĐỈNH TRÊN)
// ═══════════════════════════════════════════════════════════════════════
= Bài 11 — Bể Ngầm Tiết Diện Parabol Lật Ngược

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), hình phẳng $(H)$ nằm trong mặt phẳng $(O y z)$, giới hạn bởi parabol $(P): z = -y^2 + 1$ ($z >= 0$) và đoạn $A B$ nằm trên trục $y$ ($z = 0$). Đây là bể chứa nước mưa kiểu "vòm ngược" — tiết diện ngang là parabol lật ngược, đỉnh ở trên. Chiều dài bể $L = 4$ m. Nước đổ vào với lưu lượng $Q = 0","08 space (m^3 \/ "phút")$.],
  (
    True([Tại cao độ $z in [0; 1]$, chiều rộng mặt cắt ngang là $w(z) = 2sqrt(1-z)$.]),
    True([Diện tích hình phẳng $(H)$ bằng $4/3 approx 1","33 space m^2$ (làm tròn đến hàng phần trăm).]),
    True([Thể tích bể $(K)$ bằng $16/3 approx 5","33 space m^3$. Thời gian đầy bể là $200/3 approx 66","7$ phút.]),
    True([Sau $48$ phút, chiều cao mực nước so với đáy bồn bằng $0","57$ m (làm tròn đến hàng phần trăm).]),
  ),
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let sc = 3.5
      let p(x, y, z) = ((y - 0.5 * x) * sc, (z - 0.35 * x) * sc)
      let hfill = rgb(173, 216, 230, 150)

      // Tô hình H (parabol z=-y^2+1, z từ 0 đến 1)
      // Tại z=0: y=±1; z=1: y=0 (đỉnh)
      let left = ()
      let right = ()
      for i in range(0, 101) {
        let z = i * 1.0 / 100
        let hw = calc.sqrt(calc.max(0, 1 - z))
        left.push(p(0, hw, z))
        right.push(p(0, -hw, z))
      }
      let poly = ()
      poly.push(p(0, -1, 0))
      for pt in left.rev() { poly.push(pt) }
      for pt in right { poly.push(pt) }
      poly.push(p(0, 1, 0))
      line(..poly, close: true, fill: hfill, stroke: none)
      // Tô đáy ABCD (z=0)
      line(p(0, -1, 0), p(0, 1, 0), p(4, 1, 0), p(4, -1, 0), close: true, fill: hfill, stroke: none)

      // Vẽ parabol đầy mặt sau
      let para = ()
      for i in range(-80, 81) {
        let y = i * 1.2 / 80
        para.push(p(0, y, -y * y + 1))
      }
      line(..para, stroke: 0.5pt)

      // Sườn giữa
      for xv in (1.0, 2.0, 3.0) {
        let pts = ()
        for i in range(0, 101) {
          let z = i * 1.0 / 100
          let hw = calc.sqrt(calc.max(0, 1 - z))
          pts.push(p(xv, -hw, z))
        }
        let pts2 = ()
        for i in range(0, 101) {
          let z = i * 1.0 / 100
          let hw = calc.sqrt(calc.max(0, 1 - z))
          pts2.push(p(xv, hw, z))
        }
        line(p(xv, -1, 0), ..pts, p(xv, 0, 1), stroke: section-grid-stroke)
        line(p(xv, 1, 0), ..pts2, p(xv, 0, 1), stroke: section-grid-stroke)
        line(p(xv, -1, 0), p(xv, 1, 0), stroke: section-grid-stroke)
      }

      // Biên bể mặt sau
      line(p(0, -1, 0), p(0, 1, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..left, stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(..right, stroke: 1.2pt + red)

      // Biên mặt trước
      line(p(4, -1, 0), p(4, 1, 0), stroke: 1.2pt + red)
      let fl = ()
      let fr = ()
      for i in range(0, 101) {
        let z = i * 1.0 / 100
        let hw = calc.sqrt(calc.max(0, 1 - z))
        fl.push(p(4, -hw, z))
        fr.push(p(4, hw, z))
      }
      line(..fl, stroke: 1.2pt + red)
      line(..fr, stroke: 1.2pt + red)

      // Đường sinh
      line(p(0, -1, 0), p(4, -1, 0), stroke: (paint: red, thickness: 1.2pt, dash: "dashed"))
      line(p(0, 1, 0), p(4, 1, 0), stroke: 1.2pt + red)
      line(p(0, 0, 1), p(4, 0, 1), stroke: 1.2pt + red)

      // Nhãn đỉnh
      content(p(0, -1.15, 0.12), $D$)
      content(p(0, 1.15, 0.12), $C$)
      content(p(0, 0.12, 1.15), $V$)
      content(p(4, -1.15, 0.12), $A$)
      content(p(4, 1.15, 0.12), $B$)
      content(p(4, 0.12, 1.15), $V'$)

      // Trục
      line(p(0, 0, 0), p(5.2, 0, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(5.2, -0.12, 0), $x$)
      line(p(0, -1.4, 0), p(0, 1.6, 0), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, 1.6, -0.12), $y$)
      line(p(0, 0, -0.2), p(0, 0, 1.5), mark: (end: ">", fill: black), stroke: 0.7pt)
      content(p(0, -0.15, 1.4), $z$)
      content(p(0, 0.1, -0.18), $O$)

      // Kích thước
      line(p(0, -1, 1.25), p(0, 1, 1.25), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 0.1, 1.4), $2$)
      line(p(0, 1.3, 0), p(0, 1.3, 1), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(0, 1.55, 0.5), $1$)
      line(p(-0.7, -1.1, -0.25), p(1.3, -1.1, -0.25), mark: (start: ">", end: ">"), stroke: 0.5pt)
      content(p(1.65, -1.0, -0.35), $4$)

      // Nhãn H, P, K
      content(p(0, 0.4, 0.35), $(H)$)
      content(p(0, -0.7, 0.55), $(P)$)
      line(p(0, -0.65, 0.5), p(0, -0.6, 0.3), mark: (end: ">"), stroke: 0.4pt)
      content(p(2, -0.8, 0.6), $(K)$)
    })
  ],
  fig-pos: "center",
  fig-width: 50%,
  loigiai: [
    #step([Chiều rộng mặt cắt tại cao độ $z$])
    Từ $(P): z = -y^2 + 1$ suy ra
    $
      y^2 = 1-z,
      quad y = plus.minus sqrt(1-z).
    $
    Do đó
    $
      w(z) = 2sqrt(1-z).
    $
    *Mệnh đề (a) ĐÚNG.*

    #step([Diện tích $(H)$])
    $
      S_(H) = integral_0^1 2sqrt(1-z) d z = lr((-4/3(1-z)^(3/2))|)_0^1 = 4/3 approx 1","33 space m^2.
    $
    *Mệnh đề (b) ĐÚNG.*

    #step([Thể tích và thời gian đầy])
    $
      V = S_(H) times L = 4/3 times 4 = 16/3 approx 5","33 space m^3,
      quad t = V / Q = (16/3) / 0","08 = 200/3 approx 66","7.
    $
    *Mệnh đề (c) ĐÚNG.*

    #step([Mực nước sau 48 phút])
    Sau $48$ phút,
    $
      V_(48) = 48 times 0","08 = 3","84 space m^3,
      quad A = V_(48)/L = 3","84/4 = 0","96 space m^2.
    $
    Ta giải phương trình
    $
      integral_0^k 2sqrt(1-z) d z = 0","96.
    $
    Khi đó
    $
      [-4/3(1-z)^(3/2)]_0^k = 0","96
      => 4/3 - 4/3(1-k)^(3/2) = 0","96
      => (1-k)^(3/2) = 0","28.
    $
    Suy ra
    $
      1-k = 0","28^(2/3) approx 0","4265
      => k approx 0","5735 approx 0","57.
    $
    Vậy chiều cao mực nước xấp xỉ $0","57$ m. *Mệnh đề (d) ĐÚNG.*

    #nhanxet[Parabol lật ngược có đặc tính thú vị: nước đầy nhanh hơn ở phần gần đáy (rộng) và chậm hơn ở phần trên (hẹp dần về đỉnh). Hoàn toàn ngược với bể parabol đứng (bài 1) — nơi nước đầy chậm ở dưới, nhanh hơn ở trên.]
  ],
)

= Bảng Tổng Kết & Công Thức Cần Nhớ

#align(center)[
  #table(
    columns: (1.5fr, 2fr, 2fr, 2fr),
    fill: (c, r) => if r == 0 { rgb("1A5276") } else if calc.odd(r) { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + gray,
    inset: (x: 8pt, y: 6pt),
    align: (left, left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Bài],
      text(fill: white, weight: "bold")[Mô hình],
      text(fill: white, weight: "bold")[Công thức chính],
      text(fill: white, weight: "bold")[Kỹ năng],
    ),
    [Bài 1], [Bể parabol $z=a y^2+c$, đỉnh dưới đáy], [$V = L integral_0^H w(z) d z$], [Tích phân, giải PT],
    [Bài 2], [Bể nửa elip tịnh tiến], [$S = pi a b / 2$], [Tích phân elip],
    [Bài 3], [Đập tràn parabol], [$S = integral_0^H 2sqrt(z/a) d z$], [Tích phân, tỉ lệ],
    [Bài 4], [Ống vòm parabol], [$S_"vòm" = integral_(-b)^b sqrt(1+(f')^2)dif y$], [Độ dài cung],
    [Bài 5], [Kênh chữ U hỗn hợp], [$S = S_"para" + S_"chữ nhật"$], [Tích phân từng đoạn],
    [Bài 6], [Mái vòm — tối ưu kệ], [$V(a) = 20a(4-a^2)$, cực trị], [Đạo hàm tối ưu],
    [Bài 7], [Máng V-hình, đỉnh $O$], [$S = 4/3$; $k=0","6^(2/3)$], [Giải PT lũy thừa],
    [Bài 8], [Cống nửa elip đứng], [$S = 3 pi$; $Q = S dot v$], [Tích phân lượng giác],
    [Bài 9], [Bể parabol lõm (đỉnh $<0$)], [$S = 14/3$; $t = 280/3$], [Lập PT từ điều kiện],
    [Bài 10],
    [Bồn xăng parabol thẳng],
    [$S approx 0","89$; $t approx 44","27$; $k approx 0","55$],
    [PT có đỉnh dưới đáy],

    [Bài 11], [Bể parabol lật ngược], [$S=4/3$; $t=200/3$; $k=0","57$], [Parabol đỉnh ở trên],
  )
]

#v(0.8em)
#meo[
  *Quy trình giải bài conic bể nước/khối trụ:*
  1. *Xác định dạng conic*: đọc hình và phương trình để lấy $w(z)$.
  2. *Tích phân diện tích*: $S = integral_(z_1)^(z_2) w(z) d z$.
  3. *Thể tích = diện tích × chiều dài*: $V = S dot L$.
  4. *Bài toán ngược* (tìm mực nước): đặt $integral_0^k w(z) d z = V/L$, giải phương trình vô tỉ.
  5. *Bài toán tối ưu*: lập hàm thể tích/diện tích theo tham số, lấy đạo hàm tìm cực trị.

  *Chiều rộng mặt cắt thường dùng:*
  - Parabol $z = a y^2$: $w(z) = 2sqrt(z/a)$.
  - Elip $(y/b)^2 + (z/c)^2 = 1$: $w(z) = (2b/c)sqrt(c^2-z^2)$.
  - Parabol ngược $z = c - a y^2$: $w(z) = 2sqrt((c-z)/a)$.
]
