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



#lythuyet(
  title: [CHUYÊN ĐỀ: SƠ ĐỒ TRẠNG THÁI HỮU HẠN (FSM) VÀ ỨNG DỤNG TRONG BÀI TOÁN ĐẾM TỔ HỢP],
  [
    Sơ đồ trạng thái hữu hạn (Finite State Machine - FSM) là một công cụ mạnh mẽ của toán rời rạc, giúp giải quyết các bài toán đếm (tô màu, xếp dãy, lập mã) có *nhiều ràng buộc tuần tự đan chéo* mà phương pháp tổ hợp truyền thống dễ bị đếm sót hoặc trùng lặp.
    
    *Cấu trúc giải toán bằng FSM:*
    + *Xác định trạng thái (Nodes):* Biểu diễn các tính chất/màu sắc tại một bước $i$ bằng các ô tròn.
    + *Xác định bước chuyển (Lines/Beziers):* Vẽ các đường nối từ trạng thái $i$ sang trạng thái $i+1$ tuân theo đúng tập quy tắc ràng buộc của đề bài.
    + *Hệ thức truy hồi:* Số cách để đạt được một trạng thái ở bước $n$ bằng tổng số cách của các trạng thái có mũi tên trỏ VÀO nó ở bước $n-1$.
  ]
)

#tln(
  [Một dải đèn LED trang trí được cấu tạo từ $n$ bóng đèn xếp thành một hàng ngang. Mỗi bóng đèn có thể phát ra một trong $3$ màu: Đỏ (Đ), Xanh lá (X), Xanh dương (B). Để dải đèn đạt được hiệu ứng thị giác theo thiết kế của kỹ sư, hệ thống được lập trình với các quy tắc sau:
  1. Hai bóng kề nhau không được phát cùng một màu (quy tắc chống nháy liên tục).
  2. Nếu một bóng phát màu Đỏ (Đ), thì bóng ngay phía sau nó (bên phải) bắt buộc phải phát màu Xanh lá (X). Nghĩa là, cấm sự xuất hiện của bóng Xanh dương (B) ngay sau bóng Đỏ.
  
  Hãy vẽ sơ đồ trạng thái mô tả hệ thống, lập hệ thức truy hồi và tính số dải màu khác nhau có thể tạo ra khi dải có $6$ bóng đèn ($n=6$).],
  fig: cetz.canvas(length: 1.25cm, {
    import cetz.draw: *
        
        let n-style(f-col, s-col) = (
          radius: 0.55, 
          fill: f-col, 
          stroke: 1.5pt + s-col
        )
        
        // Vẽ 3 trạng thái (Node)
        circle((0, 2.5), name: "D", ..n-style(rgb("ffebee"), rgb("c62828")))
        content("D", text(weight: "bold", fill: rgb("c62828"))[Đỏ (Đ)])
        
        circle((-2, 0), name: "X", ..n-style(rgb("e8f5e9"), rgb("2e7d32")))
        content("X", text(weight: "bold", fill: rgb("2e7d32"))[Xanh lá (X)])
        
        circle((2, 0), name: "B", ..n-style(rgb("e3f2fd"), rgb("1565c0")))
        content("B", text(weight: "bold", fill: rgb("1565c0"))[Xanh dương (B)])
        
        // Phong cách nét vẽ
        let edge-style = (mark: (end: "stealth", fill: black, scale: 1.2), stroke: 1.2pt + rgb("444444"))
        
        // 1. Đ -> X (cong ra ngoài bằng bezier)
        bezier("D.west", "X.north", (-1.5, 2.5), (-2, 1.5), ..edge-style)
        content((-1.5, 1.8), text(fill: rgb("c62828"), weight: "bold")[1])
        
        // 2. X -> Đ (cong vào trong)
        bezier("X.east", "D.south", (-0.8, 0), (0, 1.2), ..edge-style)
        content((-0.3, 0.9), text(weight: "bold")[1])
        
        // 3. X -> B (cong xuống dưới)
        bezier("X.south-east", "B.south-west", (-1, -1), (1, -1), ..edge-style)
        content((0, -0.8), text(weight: "bold")[1])
        
        // 4. B -> X (cong lên trên)
        bezier("B.north-west", "X.north-east", (1, 1), (-1, 1), ..edge-style)
        content((0, 0.8), text(weight: "bold")[1])
        
        // 5. B -> Đ (đường thẳng)
        line("B.north", "D.south-east", ..edge-style)
        content((1.2, 1.5), text(weight: "bold")[1])
  }),
  fig-pos: "center",
  fig-width: 50%,
  [34],
  loigiai: [
    #ppgiai[
      Ta mô hình hóa dải màu bằng cách coi mỗi bóng đèn thứ $i$ là một "bước", và màu của nó là một "trạng thái".
      - *Trạng thái:* Có 3 trạng thái tương ứng với màu của bóng đèn: Đỏ (Đ), Xanh lá (X), Xanh dương (B).
      - *Quy tắc chuyển trạng thái:*
        + Từ Đỏ (Đ): Theo quy tắc 2, chỉ có thể chuyển sang Xanh lá (X).
        + Từ Xanh lá (X): Theo quy tắc 1, có thể chuyển sang Đỏ (Đ) hoặc Xanh dương (B).
        + Từ Xanh dương (B): Theo quy tắc 1, có thể chuyển sang Đỏ (Đ) hoặc Xanh lá (X).
    ]

    *1. Sơ đồ trạng thái (FSM):*
    Dựa vào phân tích, ta thiết lập đồ thị có hướng mô tả các bước chuyển.

    #align(center)[
      #cetz.canvas(length: 1.5cm, {
        import cetz.draw: *
        
        let n-style(f-col, s-col) = (
          radius: 0.55, 
          fill: f-col, 
          stroke: 1.5pt + s-col
        )
        
        // Vẽ 3 trạng thái (Node)
        circle((0, 2.5), name: "D", ..n-style(rgb("ffebee"), rgb("c62828")))
        content("D", text(weight: "bold", fill: rgb("c62828"))[Đỏ (Đ)])
        
        circle((-2, 0), name: "X", ..n-style(rgb("e8f5e9"), rgb("2e7d32")))
        content("X", text(weight: "bold", fill: rgb("2e7d32"))[Xanh lá (X)])
        
        circle((2, 0), name: "B", ..n-style(rgb("e3f2fd"), rgb("1565c0")))
        content("B", text(weight: "bold", fill: rgb("1565c0"))[Xanh dương (B)])
        
        // Phong cách nét vẽ
        let edge-style = (mark: (end: "stealth", fill: black, scale: 1.2), stroke: 1.2pt + rgb("444444"))
        
        // 1. Đ -> X (cong ra ngoài bằng bezier)
        bezier("D.west", "X.north", (-1.5, 2.5), (-2, 1.5), ..edge-style)
        content((-1.5, 1.8), text(fill: rgb("c62828"), weight: "bold")[1])
        
        // 2. X -> Đ (cong vào trong)
        bezier("X.east", "D.south", (-0.8, 0), (0, 1.2), ..edge-style)
        content((-0.3, 0.9), text(weight: "bold")[1])
        
        // 3. X -> B (cong xuống dưới)
        bezier("X.south-east", "B.south-west", (-1, -1), (1, -1), ..edge-style)
        content((0, -0.8), text(weight: "bold")[1])
        
        // 4. B -> X (cong lên trên)
        bezier("B.north-west", "X.north-east", (1, 1), (-1, 1), ..edge-style)
        content((0, 0.8), text(weight: "bold")[1])
        
        // 5. B -> Đ (đường thẳng)
        line("B.north", "D.south-east", ..edge-style)
        content((1.2, 1.5), text(weight: "bold")[1])
      })
    ]

    *2. Lập hệ thức truy hồi:* \
    Gọi $D_n, X_n, B_n$ lần lượt là số lượng dải màu hợp lệ có độ dài $n$ và kết thúc bằng màu Đỏ, Xanh lá, Xanh dương. \
    Nhìn vào sơ đồ, đếm các mũi tên *chỉ vào* một trạng thái ở bước $n$, ta có hệ thức từ bước $n-1$:
    $ heva(
      D_n &= X_(n-1) + B_(n-1) ,
      X_n &= D_(n-1) + B_(n-1) ,
      B_n &= X_(n-1)
    ) $
    Tại bóng đầu tiên ($n=1$), do không bị ràng buộc bởi bóng nào phía trước nên:
    $D_1 = 1, quad X_1 = 1, quad B_1 = 1$. \
    Tổng số cách tạo dải màu độ dài $n$ là $S_n = D_n + X_n + B_n$.

    *3. Bảng tính toán truy hồi giải tay:* \
    Cộng dồn tuyến tính từ trên xuống dưới, ta có bảng trạng thái:

    #align(center)[
      #table(
        columns: 5,
        align: center,
        stroke: 0.5pt + black,
        [*Độ dài $n$*], [*Đuôi Đỏ ($D_n$)*], [*Đuôi Xanh lá ($X_n$)*], [*Đuôi Xanh dương ($B_n$)*], [*Tổng dải $S_n$*],
        [$1$], [$1$], [$1$], [$1$], [*3*],
        [$2$], [$1+1=2$], [$1+1=2$], [$1$], [*5*],
        [$3$], [$2+1=3$], [$2+1=3$], [$2$], [*8*],
        [$4$], [$3+2=5$], [$3+2=5$], [$3$], [*13*],
        [$5$], [$5+3=8$], [$5+3=8$], [$5$], [*21*],
        [$6$], [$8+5=13$], [$8+5=13$], [$8$], [*34*]
      )
    ]

    Vậy có tất cả *$34$* dải màu khác nhau khi dải gồm $6$ bóng đèn.
  ]
)