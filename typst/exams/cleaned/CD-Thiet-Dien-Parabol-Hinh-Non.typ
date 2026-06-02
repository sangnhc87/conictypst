#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"


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
#show math.equation: set text(fill: rgb("000000"))
// #show math.equation.where(block: ): math.display
#show math.frac: math.display

#let brand = rgb("1A5276")
#let brand-soft = rgb("EDF6FB")
#let wine = rgb("900C3F")
#let mint = rgb("117A65")
#let fig-card(body, caption, width: 94%, inset: (x: 12pt, y: 10pt), radius: 10pt) = align(center)[
  #rect(
    width: width,
    fill: rgb("FBFDFE"),
    stroke: 0.7pt + rgb("D4E6F1"),
    inset: inset,
    radius: radius,
  )[
    #body
    #if caption != none [
      #v(0.45em)
      #align(center)[
        #text(size: 9pt, style: "italic", fill: rgb("5D6D7E"))[#caption]
      ]
    ]
  ]
]

#let qfig(body, note: none) = fig-card(body, note, width: 100%, inset: (x: 8pt, y: 8pt), radius: 8pt)

// ══════════════════════════════════════════════════════════════
//  HÀM VẼ HÌNH NÓN DÙNG CHUNG
//  R = bán kính đáy, H = chiều cao, sc = tỉ lệ, k-vals = vị trí cắt
// ══════════════════════════════════════════════════════════════
#let draw-cone(
  R: 1.0,
  H: 2.0,
  sc: 2.8,
  k-vals: (), // danh sách k để vẽ thiết diện parabol
  colors: (blue, rgb(0, 150, 0), rgb(200, 100, 0)),
  fills: (rgb(0, 0, 255, 30), rgb(0, 150, 0, 30), rgb(200, 100, 0, 30)),
  show-labels: true,
  show-axis: true,
) = {
  import cetz.draw: *
  let bx = 0.35
  let p(x, y, z) = (x * sc, (z - bx * y) * sc)

  // Nửa đường tròn đáy nhìn thấy
  let visible-arc = range(0, 181).map(i => {
    let deg = i * 1.0
    let x = R * calc.cos(deg * calc.pi / 180)
    let y = R * calc.sin(deg * calc.pi / 180)
    p(x, y, 0)
  })
  line(..visible-arc, stroke: 1.0pt + black)

  // Đường kính AB (chiều sâu) và MN (ngang)
  line(p(0, -R, 0), p(0, R, 0), stroke: (paint: gray.darken(20%), thickness: 0.8pt, dash: "dashed"))
  line(p(-R, 0, 0), p(R, 0, 0), stroke: (paint: gray.darken(20%), thickness: 0.8pt, dash: "dashed"))

  // Trục S O
  if show-axis {
    line(p(0, 0, 0), p(0, 0, H), stroke: (paint: red, thickness: 1.0pt, dash: "dash-dotted"))
  }

  // Đường sinh SM (trái, sau)
  line(p(0, 0, H), p(-R, 0, 0), stroke: 1.0pt + black)

  // Các thiết diện parabol
  for i in range(k-vals.len()) {
    let k = k-vals.at(i)
    let c_line = colors.at(calc.rem(i, colors.len()))
    let c_fill = fills.at(calc.rem(i, fills.len()))
    let y_max = calc.sqrt(R * R - k * k)

    let curve_all = range(0, 101).map(j => {
      let y = -y_max + 2.0 * y_max * j / 100.0
      let x = ((R + k) * (R + k) - y * y) / (2.0 * (R + k))
      let z = (H / R) * (x - k)
      p(x, y, z)
    })
    let curve_back = range(0, 101)
      .filter(j => {
        let y = -y_max + 2.0 * y_max * j / 100.0
        y <= 0
      })
      .map(j => {
        let y = -y_max + 2.0 * y_max * j / 100.0
        let x = ((R + k) * (R + k) - y * y) / (2.0 * (R + k))
        let z = (H / R) * (x - k)
        p(x, y, z)
      })
    let curve_front = range(0, 101)
      .filter(j => {
        let y = -y_max + 2.0 * y_max * j / 100.0
        y >= 0
      })
      .map(j => {
        let y = -y_max + 2.0 * y_max * j / 100.0
        let x = ((R + k) * (R + k) - y * y) / (2.0 * (R + k))
        let z = (H / R) * (x - k)
        p(x, y, z)
      })

    // Tô màu thiết diện
    line(..curve_all, close: true, fill: c_fill, stroke: none)
    // Dây cung đáy
    line(p(k, -y_max, 0), p(k, y_max, 0), stroke: (paint: c_line, thickness: 0.8pt, dash: "dashed"))
    // Trục parabol (từ midpoint dây cung lên đỉnh)
    let x_V = (R + k) / 2.0
    let z_V = (H / R) * (x_V - k)
    line(p(k, 0, 0), p(x_V, 0, z_V), stroke: (paint: c_line, thickness: 1.0pt, dash: "dashed"))
    // Viền parabol
    if curve_back.len() > 1 {
      line(..curve_back, stroke: (paint: c_line, thickness: 1.5pt, dash: "dashed"))
    }
    if curve_front.len() > 1 {
      line(..curve_front, stroke: 1.5pt + c_line)
    }
    // Đánh dấu đỉnh
    circle(p(x_V, 0, z_V), radius: 1.2pt, fill: c_line)
  }

  // Nửa đường tròn đáy khuất (cung M N, nét đứt)
  let hidden-arc = range(181, 361).map(i => {
    let deg = i * 1.0
    let x = R * calc.cos(deg * calc.pi / 180)
    let y = R * calc.sin(deg * calc.pi / 180)
    p(x, y, 0)
  })
  line(..hidden-arc, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))

  // Đường sinh SN (phải, trước)
  line(p(0, 0, H), p(R, 0, 0), stroke: 1.0pt + black)

  // Nhãn
  if show-labels {
    content(p(0, 0, H + 0.2), $S$)
    content(p(-0.12, 0.15, -0.07), $O$)
    content(p(0, R + 0.25, 0), $A$)
    content(p(-0.1, -R - 0.25, 0), $B$)
    content(p(-R - 0.2, 0, 0), $M$)
    content(p(R + 0.18, 0, 0), $N$)
  }
}

#let plain-cone-fig(note: none, sc: 0.72, show-labels: true, show-axis: true) = qfig(
  [
    #cetz.canvas({
      draw-cone(
        R: 3.0,
        H: 6.0,
        sc: sc,
        k-vals: (),
        show-labels: show-labels,
        show-axis: show-axis,
      )
    })
  ],
  note: note,
)

#let cut-fig(
  k-vals: (0.0,),
  note: none,
  sc: 0.72,
  show-labels: true,
  show-axis: true,
  colors: (blue, rgb(0, 150, 0), rgb(200, 100, 0), rgb(150, 0, 150)),
  fills: (rgb(0, 0, 255, 25), rgb(0, 150, 0, 25), rgb(200, 100, 0, 25), rgb(150, 0, 150, 25)),
) = qfig(
  [
    #cetz.canvas({
      draw-cone(
        R: 3.0,
        H: 6.0,
        sc: sc,
        k-vals: k-vals,
        colors: colors,
        fills: fills,
        show-labels: show-labels,
        show-axis: show-axis,
      )
    })
  ],
  note: note,
)

#let funnel-fig(water-h: 3.0, note: none) = qfig(
  [
    #cetz.canvas({
      import cetz.draw: *
      let sc = .5
      let bx = 0.35
      let R = 3.0
      let H = 6.0
      let p(x, y, z) = (x * sc, (z - bx * y) * sc)
      let rw = water-h / 2.0

      let wfront = range(181, 361).map(i => {
        let deg = i * 1.0
        p(rw * calc.cos(deg * calc.pi / 180), rw * calc.sin(deg * calc.pi / 180), water-h)
      })
      let wback = range(0, 181).map(i => {
        let deg = i * 1.0
        p(rw * calc.cos(deg * calc.pi / 180), rw * calc.sin(deg * calc.pi / 180), water-h)
      })
      let water-left = range(0, 181).map(i => {
        let deg = i * 1.0
        p(rw * calc.cos(deg * calc.pi / 180), rw * calc.sin(deg * calc.pi / 180), water-h)
      })

      line(p(0, 0, 0), ..water-left, close: true, fill: rgb(173, 216, 230, 120), stroke: none)
      line(..wback, stroke: (paint: blue.lighten(30%), thickness: 0.8pt, dash: "dashed"))
      line(p(0, 0, 0), p(-rw, 0, water-h), stroke: (paint: blue, thickness: 1pt, dash: "dashed"))

      let front-cone = range(181, 361).map(i => {
        let deg = i * 1.0
        p(R * calc.cos(deg * calc.pi / 180), R * calc.sin(deg * calc.pi / 180), H)
      })
      let back-cone = range(0, 181).map(i => {
        let deg = i * 1.0
        p(R * calc.cos(deg * calc.pi / 180), R * calc.sin(deg * calc.pi / 180), H)
      })

      line(p(0, 0, 0), p(-R, 0, H), stroke: 1pt + blue)
      line(..front-cone, stroke: 1pt + blue)
      line(p(0, 0, 0), p(R, 0, H), stroke: 1pt + black)
      line(..back-cone, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))

      line(..wfront, stroke: (dash: "dashed"))
      line(p(0, 0, 0), p(rw, 0, water-h), stroke: (dash: "dashed"))

      content(p(0, 0, -0.2), $S$)
      content(p(R + 0.2, 0, H), $R$)
      content(p(0, rw + 0.3, water-h), text(fill: blue)[$h$])
    })
  ],
  note: note,
)

// ══════════════════════════════════════════════════════════════
//  TIÊU ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (
      left: 5pt + rgb("1A5276"),
      top: 0.5pt + rgb("d0e4f0"),
      right: 0.5pt + rgb("d0e4f0"),
      bottom: 0.5pt + rgb("d0e4f0"),
    ),
    inset: (x: 16pt, y: 14pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Thiết Diện Parabol Của Hình Nón
    ]
    #v(0.5em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Mặt phẳng song song đường sinh · Phương trình thiết diện · Diện tích ·
      Thể tích · Bể nước · Tối ưu — Vận dụng cao THPT Quốc Gia
    ]
  ]
]


// ══════════════════════════════════════════════════════════════
= Lý Thuyết Nền
// ══════════════════════════════════════════════════════════════

#lythuyet[
  *Định lý cơ bản (Hình nón — Apollonius):* Khi cắt hình nón tròn xoay bởi một mặt phẳng
  $(alpha)$ *song song đúng với một đường sinh* (không đi qua đỉnh và không song song
  với hai đường sinh), thiết diện là một *parabol*.

  *Thiết lập tọa độ chuẩn:* Đặt hình nón đỉnh $S=(0,0,H)$, đáy tâm $O=(0,0,0)$, bán kính $R$.
  - Phương trình hình nón: $x^2 + y^2 = display(R^2/H^2)(H-z)^2$, =<.
  - Mặt phẳng cắt song song đường sinh $S M$ (với $M=(-R,0,0)$):
    $ alpha_k : quad z = (H/R)(x - k), quad k in (-R, R) $
  - *Phương trình parabol thiết diện* (trong hệ $O x y z$, với ràng buộc $z = (H/R)(x-k)$):
    $
      y^2 = -2(R+k)lr((x - frac(R+k, 2)), size: #130%)
    $

  #table(
    columns: (auto, 2fr, 2fr, 2fr, 2fr),
    fill: (c, r) => if r == 0 { rgb("EBF5FB") } else if calc.odd(r) { rgb("f9fbfd") } else { white },
    stroke: 0.5pt + gray,
    inset: (x: 8pt, y: 6pt),
    align: center + horizon,
    table.header(
      [*Tham số $k$*],
      [*Đỉnh parabol $V$*],
      [*Nửa dây cung*\ $y_max = sqrt(R^2 - k^2)$],
      [*"Chiều cao"*\ $h_p = display(frac(R-k, 2))$],
      [*Diện tích*\ $S_k$],
    ),
    [$k = 0$ (qua $O$)], [$((R)/2, 0, H/2)$], [$R$], [$R/2$], [$display(frac(2sqrt(1+(H/R)^2), 3)) R^2$],
    [$k > 0$ (về phía $N$)], [$((R+k)/2, 0, H(R-k)/2R)$], [$<R$], [$< R/2$], [nhỏ hơn],
    [$k < 0$ (về phía $M$)], [$((R+k)/2, 0, H(R-k)/2R)$], [$<R$], [$> R/2$], [lớn hơn],
  )

  *Công thức diện tích thiết diện* (diện tích thực trong không gian 3D):
  $
    S_k = sqrt(1 + (H/R)^2) dot underbrace(frac(2, 3) dot 2 y_"max" dot h_p, "diện tích trong mp Oxy")
    = frac(2sqrt(R^2+H^2), 3 R) (R-k)^(3/2)(R+k)^(1/2)
  $

  *Thể tích hình nón* tính bằng tích phân mặt cắt ngang:
  $ V = integral_0^H pi R^2/H^2 (H-z)^2 d z = (pi R^2 H)/3 $
]

#ppgiai[
  *Quy trình làm nhanh cho dạng thiết diện parabol của hình nón:*
  #step[Xác định tham số $k$ từ vị trí mặt phẳng cắt và viết ngay $alpha_k: z = (H/R)(x-k)$.]
  #step[Thay phương trình mặt phẳng vào phương trình hình nón để thu được parabol chuẩn theo $x, y$.]
  #step[Rút các đại lượng hình học cần dùng: đỉnh $V_k$, dây cung đáy $2sqrt(R^2-k^2)$, chiều cao $h_p = (R-k)/2$.]
  #step[Khi hỏi diện tích hay cực trị, ưu tiên dùng công thức $S_k = frac(2sqrt(R^2+H^2), 3R)(R-k)^(3/2)(R+k)^(1/2)$ rồi mới triển khai đạo hàm hoặc so sánh.]
  #reset-step()
]

#meo[
  *Ba dấu hiệu để kiểm tra nhanh kết quả:*
  - Nếu $k -> R$, thiết diện co lại và diện tích phải tiến về $0$.
  - Nếu thay $k$ bởi $-k$, độ dài dây cung đáy giữ nguyên nhưng diện tích nhìn chung *không* giữ nguyên.
  - Với $R=3, H=6$, hệ số nghiêng luôn tạo thừa số $sqrt(1+(H/R)^2) = sqrt(5)$ khi đổi từ hình chiếu sang diện tích thật.
]

#v(1.5em)

// ══════════════════════════════════════════════════════════════
= Dạng 1 — Trắc Nghiệm: Nhận Diện & Phương Trình Thiết Diện
// ══════════════════════════════════════════════════════════════

== Bài 1: Loại conic của thiết diện

#tn(
  [Cắt hình nón tròn xoay bởi một mặt phẳng $(alpha)$ song song với đúng *một*
    đường sinh và không đi qua đỉnh. Thiết diện thu được là đường conic loại nào?],
  (
    [Elip],
    [Hyperbol],
    [Parabol],
    [Đường tròn],
  ),
  correct: (3,),
  fig: cut-fig(
    k-vals: (-1.2, 0.0, 1.2),
    note: [Ba mặt cắt song song đường sinh đều cho thiết diện parabol.],
    sc: 0.62,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Theo định lý Apollonius, mặt phẳng song song *đúng một* đường sinh của hình nón cho thiết diện là *parabol*.]
    #step[Nhận nhanh các trường hợp còn lại: song song với *không* đường sinh thì được elip hoặc đường tròn; đi qua đỉnh cho hai đường thẳng; song song với hai đường sinh cho hyperbol.]
    #reset-step()
  ],
)

== Bài 2: Đỉnh của parabol thiết diện

#tn(
  [Cho hình nón đỉnh $S$, đáy tâm $O$ bán kính $R = 3$, chiều cao $H = 6$.
    Mặt phẳng $(alpha)$ song song đường sinh $S M$ ($M = (-3, 0, 0)$) và cắt đoạn $O N$
    ($N=(3,0,0)$) tại điểm có hoành độ $k = 1$.
    Tọa độ đỉnh $V$ của parabol thiết diện là:],
  (
    [$(3/2, 0, 3)$],
    [$(2, 0, 2)$],
    [$(2, 0, 1)$],
    [$(5/2, 0, 1)$],
  ),
  correct: (2,),
  fig: cut-fig(
    k-vals: (1.0,),
    note: [Mặt cắt tại $k=1$ cho một parabol mở về phía $M$.],
    sc: 0.64,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Với $R=3$, $H=6$, $k=1$ ta có $H/R = 2$. Công thức đỉnh cho bởi
      $x_V = (R+k)/2 = (3+1)/2 = 2$.]
    #step[Tung độ cao của đỉnh là
      $z_V = (H/R)(x_V-k) = 2(2-1) = 2$.]
    #step[Vậy $V = (2, 0, 2)$. Kiểm tra lại trên mặt phẳng cắt $z = 2(x-1)$: tại $x=2$ thì $z=2$, hoàn toàn khớp.]
    #reset-step()
  ],
)

== Bài 3: Phương trình parabol thiết diện

#tn(
  [Cho hình nón $R=3$, $H=6$. Xét mặt phẳng $(alpha)$ song song đường sinh $S M$,
    đi qua điểm có hoành độ $k=1$ trên đoạn $O N$, nên có phương trình $z = 2(x-1)$.
    Phương trình parabol thiết diện trong hệ $O x y z$ là:],
  (
    [$y^2 = -6(x - 3/2)$],
    [$y^2 = -8(x - 2)$],
    [$y^2 = -4(x - 1)$],
    [$y^2 = -10(x - 5/2)$],
  ),
  correct: (2,),
  fig: cut-fig(
    k-vals: (1.0,),
    note: [Cùng dữ kiện $k=1$, ta đọc phương trình bằng cách thế mặt phẳng cắt vào phương trình nón.],
    sc: 0.64,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Thay $z = 2(x-1)$ vào phương trình hình nón $x^2 + y^2 = (6-z)^2/4$:
      $ x^2 + y^2 = (6 - 2(x-1))^2/4 = (8-2x)^2/4 = (4-x)^2 $.]
    #step[Chuyển vế:
      $ y^2 = (4-x)^2 - x^2 = 16 - 8x = -8(x-2) $.]
    #step[Vì vậy phương trình thiết diện là $y^2 = -8(x-2)$, tương ứng đáp án B.]
    #reset-step()
  ],
)

== Bài 4: Nhận dạng từ phương trình

#tn(
  [Hình nón $R=3, H=6$. Phương trình parabol thiết diện tương ứng với mặt cắt qua
    *tâm O* (tức $k = 0$) là:],
  (
    [$y^2 = -3(x - 3/2)$],
    [$y^2 = -4(x - 2)$],
    [$y^2 = -6(x - 3/2)$],
    [$y^2 = -9(x - 3)$],
  ),
  correct: (3,),
  fig: cut-fig(
    k-vals: (0.0,),
    note: [Mặt cắt qua tâm $O$ là vị trí chuẩn nhất của họ parabol thiết diện.],
    sc: 0.64,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Với mặt cắt qua tâm $O$ ta có $k=0$.]
    #step[Thay vào công thức tổng quát:
      $y^2 = -2(R+k)(x - (R+k)/2) = -2 dot 3 dot (x - 3/2) = -6(x - 3/2)$.]
    #step[Đây là đáp án C. Đồng thời đỉnh có cao độ $z=3$, tức nằm ở nửa chiều cao của hình nón.]
    #reset-step()
  ],
)

== Bài 4A: Tìm mặt phẳng cắt từ vị trí đỉnh

#tn(
  [Vẫn với hình nón $R=3, H=6$. Một thiết diện parabol có đỉnh nằm ở độ cao $z_V = 4$.
    Mặt phẳng cắt song song đường sinh $S M$ khi đó là: ],
  (
    [$z = 2(x+1)$],
    [$z = 2(x-1)$],
    [$z = 2x + 4$],
    [$z = 2x - 4$],
  ),
  correct: (1,),
  fig: cut-fig(
    k-vals: (-1.0,),
    note: [Đỉnh nằm cao hơn mức giữa nên mặt cắt phải lệch về phía $M$.],
    sc: 0.64,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Với $R=3, H=6$, công thức cao độ đỉnh là $z_V = 3-k$.]
    #step[Điều kiện $z_V = 4$ cho $3-k = 4 => k = -1$.]
    #step[Do đó mặt phẳng cắt là $z = 2(x-k) = 2(x+1)$, tức đáp án A.]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Dạng 2 — Đúng/Sai: Tính Chất Thiết Diện Parabol
// ══════════════════════════════════════════════════════════════

== Bài 5: Tính chất cơ bản

#ds(
  [Cho hình nón đỉnh $S=(0,0,6)$, đáy tâm $O$, bán kính $R = 3$.
    Ký hiệu $alpha_k$ là mặt phẳng song song đường sinh $S M$ ($M=(-3,0,0)$),
    cắt trục $M N$ tại điểm có hoành độ $k$ (với $-3 < k < 3$).
    Xét các phát biểu sau:],
  (
    True([Mặt phẳng $alpha_0$ (qua tâm $O$) cho thiết diện parabol có đỉnh $V = (3/2, 0, 3)$,
      tức nằm ở nửa chiều cao của hình nón.]),
    (
      [Khi $k$ tăng từ $0$ đến $3$, đỉnh parabol di chuyển từ $(3/2, 0, 3)$ lên phía
        đỉnh $S$, và đồng thời diện tích thiết diện *tăng*.]
    ),
    True([Phương trình parabol thiết diện $alpha_k$ là
      $y^2 = -2(3+k)(x - (3+k)/2)$; thiết diện cắt đáy hình nón theo đoạn thẳng
      (dây cung) có độ dài $2sqrt(9-k^2)$.]),
    True([Thiết diện $alpha_{-2}$ (tức $k = -2$) có diện tích $50/3$ (đơn vị $m^2$ nếu $R,H$ tính bằng $m$).]),
  ),
  fig: cut-fig(
    k-vals: (-2.0, 0.0, 1.0, 2.0),
    note: [So sánh trực tiếp bốn thiết diện tiêu biểu khi thay đổi tham số $k$.],
    sc: 0.82,
  ),
  fig-pos: "center",
  fig-width: 74%,
  loigiai: [
    #reset-step()
    #step[*Mệnh đề (a).* Với $k=0$: $x_V = (3+0)/2 = 3/2$, $z_V = 2(3/2) = 3$. Vậy đỉnh $V=(3/2,0,3)$ nằm đúng ở *nửa chiều cao* của hình nón, nên phát biểu đã sửa là *Đúng*.]
    #step[*Mệnh đề (b).* Khi $k -> 3^-$ thì $V_k -> (3, 0, 0) = N$, nghĩa là đỉnh đi xuống đáy chứ không đi lên $S$. Đồng thời $S_k = frac(2sqrt(45), 9)(3-k)^(3/2)(3+k)^(1/2) -> 0$, nên phát biểu là *Sai*.]
    #step[*Mệnh đề (c).* Trên đáy $z=0$ ta có $x=k$. Thay vào phương trình parabol thu được $y^2 = (3+k)(3-k) = 9-k^2$, nên $y_("max") = sqrt(9-k^2)$ và dây cung đáy dài $2sqrt(9-k^2)$. Mệnh đề *Đúng*.]
    #step[*Mệnh đề (d).* Với $k=-2$:
      $S_(-2) = frac(2sqrt(45), 9) dot 5^(3/2) dot 1^(1/2) = frac(2 dot 3sqrt(5), 9) dot 5sqrt(5) = 50/3$.
      Vậy mệnh đề *Đúng*.]
    #reset-step()
  ],
)

== Bài 6: So sánh hai thiết diện đối xứng

#ds(
  [Cho hình nón $R=3, H=6$. Xét thiết diện $alpha_k$ và $alpha_{-k}$ (đối xứng qua
    mặt phẳng $x=0$). Các phát biểu:],
  (
    [Hai thiết diện $alpha_k$ và $alpha_{-k}$ có diện tích bằng nhau.],
    True([Tổng độ dài hai dây cung tại đáy của $alpha_k$ và $alpha_{-k}$ bằng $4sqrt(9-k^2)$.]),
    True([Đỉnh của $alpha_k$ và đỉnh của $alpha_{-k}$ có cùng tọa độ $z$ khi và chỉ khi $k = 0$.]),
    (
      [Với $k = sqrt(5)$, parabol $alpha_k$ có hệ số $4p = 2(3+sqrt(5))$ và đỉnh tại
        $z_V = 3+sqrt(5)$.]
    ),
  ),
  fig: cut-fig(
    k-vals: (-1.5, 1.5),
    note: [Hai mặt cắt đối xứng có cùng dây cung đáy nhưng không có cùng diện tích.],
    sc: 0.76,
  ),
  fig-pos: "center",
  fig-width: 68%,
  loigiai: [
    #reset-step()
    #step[*Mệnh đề (a).* Ta có
      $S_k = frac(2sqrt(45), 9)(3-k)^(3/2)(3+k)^(1/2)$ và $S_(-k) = frac(2sqrt(45), 9)(3+k)^(3/2)(3-k)^(1/2)$.
      Suy ra $S_k/S_(-k) = (3-k)/(3+k) != 1$ nếu $k != 0$, nên mệnh đề *Sai*.]
    #step[*Mệnh đề (b).* Mỗi dây cung đáy đều dài $2sqrt(9-k^2)$, nên tổng độ dài hai dây là $4sqrt(9-k^2)$. Mệnh đề *Đúng*.]
    #step[*Mệnh đề (c).* $z_V(k) = 3-k$ và $z_V(-k) = 3+k$. Hai giá trị này bằng nhau khi và chỉ khi $3-k = 3+k <=> k=0$. Mệnh đề *Đúng*.]
    #step[*Mệnh đề (d).* Với $k = sqrt(5)$ ta có $4p = 2(3+sqrt(5))$ là đúng, nhưng $z_V = 3-k = 3-sqrt(5)$ chứ không phải $3+sqrt(5)$. Vì vậy mệnh đề *Sai*.]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Dạng 3 — Trả Lời Ngắn: Diện Tích Thiết Diện
// ══════════════════════════════════════════════════════════════

== Bài 7: Diện tích thiết diện qua tâm O

#tln(
  [Hình nón đỉnh $S$, đáy tâm $O$, bán kính $R = 3$ m, chiều cao $H = 6$ m.
    Cắt bởi mặt phẳng $(alpha)$ song song đường sinh $S M$ và đi qua tâm $O$.
    Tính diện tích (đơn vị $m^2$) của thiết diện parabol thu được.
    Kết quả dạng $a sqrt(5)$, tìm $a$.],
  $6$,
  fig: cut-fig(
    k-vals: (0.0,),
    note: [Thiết diện qua tâm $O$ là bài mẫu để suy ra công thức diện tích.],
    sc: 0.64,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Mặt phẳng qua tâm $O$ ứng với $k = 0$. Khi đó thiết diện là parabol trung tâm của họ mặt cắt.]
    #step[Áp dụng công thức diện tích:
      $S_0 = frac(2sqrt(R^2+H^2), 3R) R^(3/2) dot R^(1/2) = frac(2sqrt(9+36), 9) dot 9 = 2sqrt(45) = 6sqrt(5)$.]
    #step[Nhìn theo hình chiếu lên mặt phẳng $O x y$: dây cung đáy dài $6$, chiều cao parabol là $3/2$, nên
      $S_("proj") = frac(2, 3) dot 6 dot 3/2 = 6$.]
    #step[Do mặt phẳng cắt có pháp tuyến $(2,0,-1)$ nên hệ số đổi từ hình chiếu sang diện tích thật là $sqrt(1+2^2) = sqrt(5)$. Suy ra $S = sqrt(5) dot 6 = 6sqrt(5)$ và $a = 6$.]
    #reset-step()
  ],
)

== Bài 8: Diện tích thiết diện tại k = 2

#tln(
  [Hình nón $R=3$ m, $H=6$ m. Cắt bởi mặt phẳng $(alpha)$ song song $S M$,
    đi qua điểm $(2, 0, 0)$ trên đường tròn đáy (tức $k=2$).
    Diện tích thiết diện là bao nhiêu ($m^2$)?],
  $10/3$,
  fig: cut-fig(
    k-vals: (2.0,),
    note: [Khi mặt cắt tiến về phía $N$, thiết diện thu hẹp nhanh.],
    sc: 0.64,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Với $k=2$ ta có $y_("max") = sqrt(9-4) = sqrt(5)$, nên dây cung đáy dài $2sqrt(5)$.]
    #step[Chiều cao parabol trong hình chiếu là $h_p = (R-k)/2 = (3-2)/2 = 1/2$. Do đó
      $S_("proj") = frac(2, 3) dot 2sqrt(5) dot 1/2 = 2sqrt(5)/3$.]
    #step[Đổi sang diện tích thật:
      $S = sqrt(1+(H/R)^2) dot S_("proj") = sqrt(5) dot 2sqrt(5)/3 = 10/3$.]
    #reset-step()
  ],
)

== Bài 9: Diện tích thiết diện tại k = −2

#tln(
  [Hình nón $R=3$ m, $H=6$ m. Cắt bởi mặt phẳng $(alpha)$ song song $S M$,
    đi qua điểm $(-2, 0, 0)$ trên đường tròn đáy (tức $k=-2$).
    Diện tích thiết diện là bao nhiêu ($m^2$)?],
  $50/3$,
  fig: cut-fig(
    k-vals: (-2.0,),
    note: [Khi mặt cắt lùi về phía $M$, thiết diện lớn hơn rõ rệt.],
    sc: 0.64,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Với $k=-2$, parabol thiết diện có phương trình
      $y^2 = -2(3-2)(x - 1/2) = -2(x-1/2)$.]
    #step[Dây cung đáy vẫn có nửa độ dài $y_("max") = sqrt(9-4) = sqrt(5)$, nhưng chiều cao parabol tăng lên:
      $h_p = (R-k)/2 = (3-(-2))/2 = 5/2$.]
    #step[Suy ra diện tích hình chiếu là
      $S_("proj") = frac(2, 3) dot 2sqrt(5) dot 5/2 = 10sqrt(5)/3$.]
    #step[Diện tích thật bằng
      $S = sqrt(5) dot 10sqrt(5)/3 = 50/3$. Ngoài ra $S_(-2)/S_2 = 5$, nên mặt cắt lệch về phía $M$ lớn hơn hẳn mặt cắt đối xứng qua phía $N$.]
    #reset-step()
  ],
)

== Bài 9A: Tìm tham số k từ dây cung đáy

#tn(
  [Hình nón $R=3, H=6$. Một thiết diện parabol cắt đáy theo dây cung dài $4sqrt(2)$.
    Giá trị của $|k|$ là: ],
  (
    [$1$],
    [$sqrt(2)$],
    [$2$],
    [$sqrt(5)$],
  ),
  correct: (1,),
  fig: cut-fig(
    k-vals: (-1.0, 1.0),
    note: [Dây cung đáy xác định được $|k|$ nhưng chưa quyết định dấu của $k$.],
    sc: 0.72,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Dây cung đáy của mặt cắt $alpha_k$ có độ dài $2sqrt(9-k^2)$.]
    #step[Theo giả thiết:
      $2sqrt(9-k^2) = 4sqrt(2) => sqrt(9-k^2) = 2sqrt(2)$.]
    #step[Bình phương hai vế được $9-k^2 = 8 => k^2 = 1$, nên $|k| = 1$. Đáp án A.]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Dạng 4 — Bài Toán Tối Ưu: Thiết Diện Có Diện Tích Lớn Nhất
// ══════════════════════════════════════════════════════════════

== Bài 10: Tìm vị trí cắt cho diện tích lớn nhất

#tn(
  [Hình nón $R=3$ m, $H=6$ m. Trong tất cả các mặt phẳng song song đường sinh $S M$
    cắt hình nón theo thiết diện parabol, mặt phẳng nào cho *diện tích lớn nhất*?],
  (
    [Mặt phẳng qua $N = (3, 0, 0)$ ($k = 3$)],
    [Mặt phẳng qua $O$ ($k = 0$)],
    [Mặt phẳng qua điểm $(-1, 0, 0)$ ($k = -1$)],
    [Mặt phẳng qua điểm $(-3/2, 0, 0)$ ($k = -3/2$)],
  ),
  correct: (4,),
  fig: cut-fig(
    k-vals: (-1.5, 0.0, 1.5),
    note: [Thiết diện lớn nhất không nằm ở giữa mà lệch về phía $M$.],
    sc: 0.78,
  ),
  fig-pos: "center",
  fig-width: 70%,
  loigiai: [
    #reset-step()
    #step[Đặt $S(k) = C(3-k)^(3/2)(3+k)^(1/2)$ với $C > 0$ là hằng số.]
    #step[Lấy đạo hàm:
      $
        S'(k) = C (3-k)^(1/2)(3+k)^(-1/2) lr[-(3/2)(3+k) + (1/2)(3-k)]
      $
      $ = C (3-k)^(1/2)(3+k)^(-1/2)(-3-2k) $.]
    #step[Cho $S'(k)=0$ suy ra $-3-2k = 0 => k = -3/2$.]
    #step[Vì $S(k)$ tiến về $0$ khi $k$ tiến ra hai biên $-3$ và $3$, nên điểm tới hạn trong khoảng là vị trí cho cực đại. Mặt phẳng cần tìm đi qua điểm $(-3/2,0,0)$.]
    #reset-step()
  ],
)

== Bài 11: Giá trị diện tích lớn nhất

#tln(
  [Hình nón $R=3$ m, $H=6$ m. Tính diện tích lớn nhất của thiết diện parabol
    (lấy gần đúng đến chữ số thập phân thứ hai, đơn vị $m^2$).],
  [xấp xỉ $17,43$ m²],
  fig: cut-fig(
    k-vals: (-1.5,),
    note: [Tại $k=-3/2$, parabol đạt diện tích cực đại trong toàn họ mặt cắt.],
    sc: 0.66,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Từ bài 10, diện tích lớn nhất đạt tại $k = -3/2$.]
    #step[Thế vào công thức:
      $ S_("max") = frac(2sqrt(45), 9) dot (9/2)^(3/2) dot (3/2)^(1/2) $.]
    #step[Rút gọn:
      $(9/2)^(3/2) = 27/(2sqrt(2))$ và $(3/2)^(1/2) = sqrt(6)/2$,
      nên
      $ S_("max") = frac(2 dot 3sqrt(5), 9) dot frac(27, 2sqrt(2)) dot frac(sqrt(6), 2)
      = frac(9sqrt(15), 2)
      approx 17.43 " m"^2 $.]
    #step[Vậy diện tích lớn nhất xấp xỉ $17,43$ m².]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Dạng 5 — Thể Tích Bằng Tích Phân Thiết Diện
// ══════════════════════════════════════════════════════════════

== Bài 12: Thể tích phần nón giữa hai mặt phẳng ngang

#tln(
  [Hình nón $R=3$ m, $H=6$ m. Tính thể tích phần hình nón nằm giữa hai mặt phẳng
    $z = 0$ (đáy) và $z = 3$ (mặt cắt giữa). Cho biết thể tích tính được dưới dạng $a pi$ m³.
    Tìm $a$.],
  $63 pi / 4$,
  fig: plain-cone-fig(
    note: [Mặt phẳng $z=3$ tách hình nón thành một nón nhỏ đồng dạng và phần còn lại ở phía dưới.],
    sc: 0.66,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Tại độ cao $z$, bán kính mặt cắt ngang là
      $r(z) = R(H-z)/H = 3(6-z)/6 = (6-z)/2$.]
    #step[Thể tích phần dưới được tính bởi
      $ V = integral_0^3 pi r(z)^2 d z = pi integral_0^3 (6-z)^2/4 d z
      = frac(pi, 4) lr[-(6-z)^3/3]_0^3
      = frac(63pi, 4) " m"^3 $.]
    #step[Kiểm tra nhanh bằng đồng dạng: thể tích toàn nón là $18pi$, còn nón nhỏ phía trên có tỉ lệ $1/2$ nên thể tích bằng $18pi/8 = 9pi/4$.]
    #step[Vậy phần nằm giữa $z=0$ và $z=3$ có thể tích
      $18pi - 9pi/4 = 63pi/4$, nên $a = 63/4$.]
    #reset-step()
  ],
)

== Bài 13: Thể tích bằng thiết diện song song trục Oy

#tln(
  [Hình nón $R=3, H=6$. Tính thể tích của khối hình nón bằng cách tích phân theo $y$
    qua diện tích thiết diện $A(y)$ (thiết diện song song mặt phẳng $O x z$).
    Diện tích thiết diện tại vị trí $y$ (=<) là
    $A(y) = integral_0^{6 - 2|y|} sqrt((6-z)^2 - 4y^2) d z$. Tổng thể tích là $a pi$.
    Tìm $a$.],
  $18$,
  fig: plain-cone-fig(
    note: [Tư duy Cavalieri: cộng diện tích các lát cắt song song mặt phẳng $O x z$ để thu thể tích toàn khối.],
    sc: 0.66,
  ),
  fig-pos: "right",
  fig-width: 34%,
  loigiai: [
    #reset-step()
    #step[Theo nguyên lý Cavalieri,
      $V = integral_(-3)^3 A(y) d y$.]
    #step[Nhưng đây chính là thể tích của cả hình nón bán kính $R=3$, chiều cao $H=6$, nên
      $V = pi R^2 H / 3 = pi dot 9 dot 6 / 3 = 18pi$.]
    #step[Suy ra $a = 18$. Đây là bài nhận dạng mô hình tích phân hơn là bài tính tích phân dài.]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Dạng 6 — Ứng Dụng: Phễu Nước Hình Nón
// ══════════════════════════════════════════════════════════════

#note[
  *Tình huống thực tế:* Với phễu hoặc bình hình nón lộn ngược, bán kính mặt thoáng tăng tuyến tính theo chiều cao nước.
  Nhờ đó thể tích nước luôn đưa về hàm bậc ba theo $h$.
]

== Bài 14: Mực nước và thời gian đổ đầy

#ds(
  [Một phễu lọc nước có dạng hình nón lộn ngược: đỉnh $S$ ở dưới tại gốc tọa độ $(0,0,0)$,
    miệng phễu tròn ở trên có bán kính $R = 3$ dm và chiều cao $H = 6$ dm.
    Phương trình hình nón là $x^2 + y^2 = z^2/4$.
    Nước chảy vào phễu với lưu lượng không đổi $Q = 3pi$ dm³/giờ.
    Xét các phát biểu sau:],
  (
    True([Thể tích nước khi mực cao $h$ dm là $V(h) = pi h^3/12$ dm³.]),
    True([Phễu chứa tối đa $18pi$ dm³ nước.]),
    [Thời gian đổ đầy phễu là $4$ giờ.],
    True([Sau $3/4$ giờ, mực nước đạt độ cao $h = 3$ dm.]),
  ),
  fig: funnel-fig(
    water-h: 3.0,
    note: [Mặt thoáng ở độ cao $h$ có bán kính $r = h/2$ do hai tam giác đồng dạng.],
  ),
  fig-pos: "center",
  fig-width: 68%,
  loigiai: [
    #reset-step()
    #step[*Mệnh đề (a).* Do đồng dạng, khi nước cao $h$ thì bán kính mặt thoáng là $r(h) = R dot h/H = h/2$.
      Suy ra
      $V(h) = integral_0^h pi r(z)^2 d z = pi integral_0^h z^2/4 d z = pi h^3/12$.
      Mệnh đề *Đúng*.]
    #step[*Mệnh đề (b).* Dung tích tối đa ứng với $h=6$:
      $V(6) = pi dot 6^3/12 = 18pi$ dm³. Mệnh đề *Đúng*.]
    #step[*Mệnh đề (c).* Thời gian đổ đầy là
      $t = V_("max") / Q = 18pi / (3pi) = 6$ giờ,
      nên phát biểu $4$ giờ là *Sai*.]
    #step[*Mệnh đề (d).* Sau $3/4$ giờ, lượng nước đã vào là $Q dot t = 3pi dot 3/4 = 9pi/4$.
      Giải $pi h^3/12 = 9pi/4$ được $h^3 = 27 => h = 3$, nên mệnh đề *Đúng*.]
    #reset-step()
  ],
)

== Bài 15: Tốc độ tăng mực nước

#tln(
  [Một phễu hình nón lộn ngược có đỉnh ở gốc tọa độ, bán kính miệng $R = 3$ dm,
    chiều cao $H = 6$ dm. Nước chảy vào với lưu lượng không đổi $Q = 3pi$ dm³/giờ.
    Khi mực nước đang ở độ cao $h = 3$ dm, tốc độ tăng của mực nước $d h / d t$ bằng bao nhiêu (dm/giờ)?],
  $4/3$,
  fig: funnel-fig(
    water-h: 3.0,
    note: [Tại thời điểm xét, mặt thoáng có bán kính $3/2$ dm và thể tích đang tăng với tốc độ không đổi.],
  ),
  fig-pos: "center",
  fig-width: 64%,
  loigiai: [
    #reset-step()
    #step[Từ bài toán đồng dạng, ta có $V(h) = pi h^3/12$.]
    #step[Lấy đạo hàm theo thời gian:
      $d V / d t = pi h^2/4 dot d h / d t$.]
    #step[Do $d V / d t = Q = 3pi$, tại $h=3$ ta được
      $pi dot 9/4 dot d h / d t = 3pi$.]
    #step[Suy ra $d h / d t = 4/3$ dm/giờ.]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Dạng 7 — Nâng Cao: Thiết Diện Parabol & Thể Tích Wedge
// ══════════════════════════════════════════════════════════════

#luuy[
  *Ở các bài cắt nón bởi mặt phẳng nghiêng, chia đều đáy không đồng nghĩa chia đều thể tích.*
  Từ đây nên kiểm tra theo lát cắt hoặc theo đối xứng thực sự của khối, không suy từ hình nhìn đáy.
]

== Bài 16: Tỉ lệ thể tích (Đúng/Sai)

#ds(
  [Hình nón $R=3, H=6$. Mặt phẳng $alpha_0$ (qua $O$, $k=0$) chia hình nón thành
    hai phần: phần có đỉnh $S$ và phần còn lại.
    Phương trình mặt phẳng: $z = 2x$ (hay $2x - z = 0$).
    Xét các phát biểu về hai phần này:],
  (
    [Hai phần có thể tích bằng nhau.],
    True([Mặt phẳng $alpha_0$ chia đáy hình nón (hình tròn bán kính $3$) thành hai phần bằng nhau.]),
    True([Phần chứa trục $S O$ (phía $S$) có thể tích nhỏ hơn phần còn lại.]),
    True([Tổng diện tích mặt bên tiếp xúc giữa hai phần (thiết diện parabol) bằng $6sqrt(5)$ m².]),
  ),
  fig: cut-fig(
    k-vals: (0.0,),
    note: [Mặt cắt $k=0$ đi qua tâm $O$ và cắt đáy theo một đường kính.],
    sc: 0.72,
  ),
  fig-pos: "center",
  fig-width: 68%,
  loigiai: [
    #reset-step()
    #step[*Mệnh đề (a).* Mặt phẳng $2x-z=0$ không phải là mặt phẳng đối xứng của hình nón, nên không thể kết luận hai phần có thể tích bằng nhau. Mệnh đề *Sai*.]
    #step[*Mệnh đề (b).* Trên đáy $z=0$, ta có giao tuyến $x=0$, tức một đường kính của hình tròn đáy. Vì vậy đáy bị chia thành hai nửa bằng nhau. Mệnh đề *Đúng*.]
    #step[*Mệnh đề (c).* Dù đáy chia đều, khối nón không đối xứng qua mặt phẳng $alpha_0$, nên phần thể tích hai bên vẫn khác nhau. Phần về phía $N$ lớn hơn, do đó phần chứa trục $S O$ nhỏ hơn. Mệnh đề *Đúng*.]
    #step[*Mệnh đề (d).* Tại $k=0$, diện tích thiết diện parabol bằng trực tiếp $6sqrt(5)$ m². Mệnh đề *Đúng*.]
    #reset-step()
  ],
)

== Bài 17: Bài toán sơn thiết diện

#tln(
  [Hình nón $R=3$ m, $H=6$ m. Người ta muốn sơn phủ *cả hai mặt* của ba thiết diện parabol
    tương ứng với $k = -2, 0, 2$. Chi phí sơn $200{,}000$ đồng/m². Tổng chi phí sơn là bao nhiêu
    (triệu đồng, làm tròn đến hàng đơn vị)?],
  [xấp xỉ $13$ triệu đồng],
  fig: cut-fig(
    k-vals: (-2.0, 0.0, 2.0),
    note: [Ba thiết diện cần sơn được đặt trên cùng một hình để so sánh độ lớn.],
    sc: 0.8,
  ),
  fig-pos: "center",
  fig-width: 72%,
  loigiai: [
    #reset-step()
    #step[Tổng diện tích một mặt của ba thiết diện là
      $S = S_(-2) + S_0 + S_2 = 50/3 + 6sqrt(5) + 10/3 = 20 + 6sqrt(5) approx 33.42$ m².]
    #step[Vì sơn *cả hai mặt*, diện tích cần sơn là
      $2S approx 66.84$ m².]
    #step[Chi phí tương ứng:
      $66.84 times 200{,}000 = 13{,}368{,}000$ đồng.]
    #step[Làm tròn đến hàng triệu đồng, ta được khoảng $13$ triệu đồng.]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Dạng 8 — Tổng Hợp Cấp Độ Cao (Đề Thi Thử)
// ══════════════════════════════════════════════════════════════

== Bài 18: Đề thi thử vận dụng cao (DS)

#ds(
  [Trong không gian $O x y z$ (đơn vị: mét), cho hình nón $(N)$ đỉnh $S=(0,0,6)$,
    đáy hình tròn tâm $O=(0,0,0)$ bán kính $R=3$.
    Gọi $M=(-3,0,0)$, $N=(3,0,0)$ là hai đầu đường kính.
    Họ các mặt phẳng $alpha_k: z = 2(x-k)$ ($k in (-3,3)$) đều song song đường sinh $S M$.
    Ký hiệu $P_k$ là parabol thiết diện của $(N)$ bởi $alpha_k$.],
  (
    True([Điểm $(1, 0, 2)$ nằm trên trục đối xứng của parabol $P_0$ trong mặt phẳng $alpha_0$.]),
    (
      [Khi $k$ thay đổi, đỉnh $V_k$ của $P_k$ vạch ra đường thẳng song song với
        đường sinh $S M$.]
    ),
    True([Tổng diện tích của $P_k$ và $P_{-k}$ đạt *cực đại* khi $k = 0$.]),
    (
      [Nếu cắt hình nón $(N)$ đồng thời bởi hai mặt phẳng $alpha_1$ và $alpha_{-1}$,
        phần hình nón nằm *giữa* hai mặt phẳng có thể tích bằng $9pi$ m³.]
    ),
  ),
  fig: cut-fig(
    k-vals: (-1.0, 0.0, 1.0),
    note: [Ba vị trí cắt đối chiếu trực tiếp cho thấy quỹ tích đỉnh đi dọc theo đường sinh $S N$.],
    sc: 0.8,
  ),
  fig-pos: "center",
  fig-width: 76%,
  loigiai: [
    #reset-step()
    #step[*Mệnh đề (a).* Với $k=0$, mặt phẳng cắt là $z=2x$ và trục đối xứng của parabol là giao tuyến giữa $alpha_0$ và mặt phẳng $y=0$, tức đường thẳng $y=0$, $z=2x$. Điểm $(1,0,2)$ thuộc đường này, nên mệnh đề *Đúng*.]
    #step[*Mệnh đề (b).* $V_k = ((3+k)/2, 0, 3-k)$. Đặt $t=(3+k)/2$ thì $z = 6-2t = 6-2x_V$, nên quỹ tích đỉnh thỏa $2x_V + z = 6$. Đây là đường sinh $S N$, không phải $S M$. Mệnh đề *Sai*.]
    #step[*Mệnh đề (c).* Ta có
      $S_k + S_(-k) = C[(3-k)^(3/2)(3+k)^(1/2) + (3+k)^(3/2)(3-k)^(1/2)] = 6C sqrt(9-k^2)$.
      Biểu thức này lớn nhất khi $k=0$, nên mệnh đề *Đúng*.]
    #step[*Mệnh đề (d).* Hai mặt phẳng $alpha_1$ và $alpha_(-1)$ không chia khối nón thành ba phần đối xứng đơn giản. Ở đáy, chúng chỉ cắt ra một dải có bề rộng $2$, không phải nửa hình tròn; lên cao hơn nữa dải này còn thu hẹp dần. Vì vậy thể tích phần giữa hai mặt phẳng không thể bằng ngay $9pi = V_("cone")/2$. Mệnh đề *Sai*.]
    #reset-step()
  ],
)

// ══════════════════════════════════════════════════════════════
= Bảng Tổng Kết Công Thức
// ══════════════════════════════════════════════════════════════

#align(center)[
  #table(
    columns: (3.5cm, 1fr, 1fr),
    fill: (c, r) => if r == 0 { rgb("1A5276") } else if calc.odd(r) { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + gray,
    inset: (x: 9pt, y: 7pt),
    align: (left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Đại lượng],
      text(fill: white, weight: "bold")[Công thức tổng quát ($R, H, k$)],
      text(fill: white, weight: "bold")[Ví dụ $R=3, H=6$],
    ),
    [Pt. parabol $P_k$], [$y^2 = -2(R+k)(x - (R+k)/2)$], [$k=0: y^2=-6(x-3/2)$],
    [Đỉnh $V_k$], [$((R+k)/2,\ 0,\ H(R-k)/(2R))$], [$k=1: (2,0,2)$],
    [Quỹ tích $V_k$], [Nằm trên đường sinh $S N$!], [$2x+z=6$],
    [Nửa dây cung tại đáy], [$sqrt(R^2-k^2)$], [$k=2: sqrt(5)$],
    [Diện tích $S_k$], [$frac(2sqrt(R^2+H^2), 3R)(R-k)^(3/2)(R+k)^(1/2)$], [$k=-2: 50/3$],
    [Cực đại $S_k$], [Đạt tại $k=-R/3$], [$k=-1: 16sqrt(10)/3$],
    [Thể tích nón lộn ngược], [$V(h) = pi R^2 h^3/(3H^2)$], [$= pi h^3/12$],
  )
]
