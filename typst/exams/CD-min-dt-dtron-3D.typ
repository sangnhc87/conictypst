#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
#set text(font: "New Computer Modern", size: 10pt, lang: "vi")
#set par(justify: true, leading: 0.75em)
#set list(indent: 1em, body-indent: 0.5em)

// ==========================================
// THIẾT KẾ GIAO DIỆN TIÊU ĐỀ
// ==========================================
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 14pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.2em,
  below: 0.6em,
  text(fill: rgb("900C3F"), size: 11pt, weight: "bold", it.body),
)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ==========================================
// PHÉP CHIẾU 3D TRỰC GIAO CHUẨN (ORTHOGRAPHIC)
// ==========================================
#let prj(x, y, z) = {
  let alpha = -30 * 0.0174532925 // -30 độ đổi ra rad
  let beta = 20 * 0.0174532925   // 20 độ đổi ra rad
  let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
  let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
  let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
  (xp, ypp)
}

// ==========================================
// HÀM VẼ HÌNH 3D CHO MẶT CẦU (BÀI 1 & BÀI 4)
// ==========================================
#let ve-hinh-3d(
  R: 8,
  plane: "xoy",
  line-start: (0, -30, 10),
  line-end: (0, -10, -30),
  M: (0, -8, 0),
  N: (0, -21.6, -6.8),
  scale: 0.3,
  line-label: [$Delta$],
  circle-label: [$(C)$],
) = {
  cetz.canvas(length: scale * 1cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Quả cầu nền (đường bao hình tròn chuẩn bán kính R)
    circle(O, radius: R, stroke: 0.8pt + gray, fill: rgb("e0f2fe40"))
    
    // Nửa sau xích đạo (nét đứt) - luôn nằm trong đường bao
    let back-pts = ()
    for deg in range(30, 211, step: 5) {
      let rad = deg * 0.0174532925
      back-pts.push(prj(R * calc.cos(rad), R * calc.sin(rad), 0))
    }
    line(..back-pts, stroke: (paint: rgb("#0057b8").lighten(20%), dash: "dashed", thickness: 0.8pt))
    
    // Trục tọa độ
    line(prj(0, 0, 0), prj(R + 5, 0, 0), stroke: (dash: "dotted", paint: gray), mark: (end: ">"))
    content(prj(R + 5.5, 0, 0), [$x$], anchor: "west")
    
    line(prj(0, 0, 0), prj(0, R + 5, 0), stroke: (dash: "dotted", paint: gray), mark: (end: ">"))
    content(prj(0, R + 5.5, 0), [$y$], anchor: "south-west")
    
    line(prj(0, 0, 0), prj(0, 0, R + 3), stroke: (dash: "dotted", paint: gray), mark: (end: ">"))
    content(prj(0, 0, R + 3.5), [$z$], anchor: "south")
    
    // Nửa trước xích đạo (nét liền)
    let front-pts = ()
    for deg in range(210, 391, step: 5) {
      let rad = deg * 0.0174532925
      front-pts.push(prj(R * calc.cos(rad), R * calc.sin(rad), 0))
    }
    line(..front-pts, stroke: 1.2pt + rgb("#0057b8"))
    content(prj(R + 0.2, 2, 0), text(fill: rgb("#0057b8"))[#circle-label], anchor: "west")
    
    // Quỹ đạo đường thẳng
    line(prj(..line-start), prj(..line-end), stroke: 1.2pt + rgb("#dc2626"))
    content(prj(..line-end), text(fill: rgb("#dc2626"))[#line-label], anchor: "south-west")
    
    // Điểm M, N
    let pM = prj(..M)
    let pN = prj(..N)
    circle(pM, radius: 1.8pt, fill: rgb("#0284c7"))
    content(pM, [$M$], anchor: "south-east", padding: 2pt)
    circle(pN, radius: 1.8pt, fill: rgb("#dc2626"))
    content(pN, [$N$], anchor: "north-west", padding: 2pt)
    
    // Khoảng cách ngắn nhất
    line(pM, pN, stroke: 1.2pt + rgb("#16a34a"))
    
    circle(O, radius: 1.2pt, fill: black)
  })
}

// ==========================================
// TIÊU ĐỀ TÀI LIỆU
// ==========================================
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        CHUYÊN ĐỀ ÔN LUYỆN: ĐA MÔ HÌNH CỰC TRỊ 3D
      ]
      #v(0.3em)
      #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
        Tối ưu hóa khoảng cách trên các mặt bậc hai (Mặt cầu, Trụ, Nón, Ellipsoid, Paraboloid, Hyperboloid)
      ]
    ],
  )
]

#chapter([Danh sách các câu hỏi ôn luyện đa mô hình])

// ═══════════════════════════════════════════════════════════
// BÀI 1: MÔ HÌNH ĐƯỜNG TRÒN - ĐƯỜNG THẲNG
// ═══════════════════════════════════════════════════════════
#tln(
  [Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là $800$ km, bề mặt Trái Đất được mô tả bởi mặt cầu $x^2 + y^2 + z^2 = 64$, với mặt phẳng xích đạo là mặt phẳng $(O x y)$. Một thiên thạch coi như một hạt chuyển động trên quỹ đạo là đường thẳng có phương trình tham số:
  $ cases(x = 0, y = t, z = -50 - 2t.) $
  Khi đã dự đoán được hướng bay người ta bố trí một trạm quan sát đặt tại một điểm trên đường xích đạo của Trái Đất sao cho khoảng cách ngắn nhất từ nó đến thiên thạch đạt nhỏ nhất bằng $b$ kilômet. Hãy tính $b / 100$ *(làm tròn kết quả đến hàng đơn vị)*?],
  [122],
  fig: ve-hinh-3d(
    R: 8,
    plane: "xoy",
    line-start: (0, -30, 10),
    line-end: (0, -10, -30),
    M: (0, -8, 0),
    N: (0, -21.6, -6.8),
    scale: 0.28
  ),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Đường xích đạo: $(C): cases(x^2 + y^2 = 64, z = 0) ==> x^2 + y^2 = 64$ và $y in [-8; 8]$.
      - Thiên thạch di động: $N(0; t; -50 - 2t)$ trên đường thẳng $Delta$.
      - Trạm quan sát di động: $M(x; y; 0)$ trên $(C)$.
    ]
    *Cách 1: Phương pháp đại số (Cách gốc)*
    Bình phương khoảng cách giữa $M$ và $N$:
    $ M N^2 &= x^2 + (t - y)^2 + (-50 - 2t)^2 \
           &= x^2 + y^2 + t^2 - 2y t + 4t^2 + 200t + 2500 \
           &= 5t^2 + 2(100 - y)t + 2564. $
    Do hệ số $a = 5 > 0$, tam thức đạt cực tiểu tại $t = -frac(100 - y, 5)$.
    Khi đó, bình phương khoảng cách từ $M$ đến $Delta$ là:
    $ d(M, Delta)^2 = frac(-y^2 + 200y + 2820, 5). $
    Xét $f(y) = -y^2 + 200y + 2820$ trên $[-8; 8]$ có $f'(y) = -2y + 200 > 0$. Hàm số đồng biến nên giá trị nhỏ nhất đạt tại $y = -8$:
    $ f(-8) = 1156 ==> min d(M, Delta) = sqrt(frac(1156, 5)) = frac(34, sqrt(5)) " (đơn vị)". $
    Khoảng cách thực tế: $b = frac(34, sqrt(5)) dot 800 approx 12164.21$ km $==> b / 100 approx 122$.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,t) = x^2 + (y-t)^2 + (2t+50)^2$ với $g(x, y) = x^2 + y^2 - 64 = 0$.
    Hàm Lagrange: $L(x,y,t,lambda) = F(x, y, t) + lambda (x^2 + y^2 - 64)$.
    Hệ điểm tới hạn:
    $ cases(
      2x(1 + lambda) = 0 & (1),
      y(1 + lambda) - t = 0 & (2),
      5t - y + 100 = 0 & (3),
      x^2 + y^2 - 64 = 0 & (4)
    ) $
    - Với $lambda = -1 ==> t = 0 ==> y = 100 ==> x^2 = -9936 < 0$ (loại).
    - Với $x = 0 ==> y = plus.minus 8$.
      - $y = 8 ==> t = -18.4 ==> F = 871.2$.
      - $y = -8 ==> t = -21.6 ==> F = 231.2$ (Cực tiểu).
    Vậy $d_{\min} = sqrt(231.2) = frac(34, sqrt(5)) ==> b / 100 approx 122$.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 2: MÔ HÌNH ĐƯỜNG TRÒN - ĐƯỜNG THẲNG
// ═══════════════════════════════════════════════════════════
#tln(
  [Một cảm biến phát tín hiệu dạng vòng tròn $(C)$ nằm trên mặt phẳng ngang có phương trình $x^2 + y^2 = 36, z = 0$ (đơn vị tương ứng với $10$ mét). Một thiết bị bay trượt dọc đường dẫn truyền thẳng có quỹ đạo:
  $ d: cases(x = 0, y = 4t, z = 3t + 30) $
  Khoảng cách ngắn nhất giữa cảm biến vòng tròn và thiết bị bay bằng $b$ mét. Tính $b$ *(làm tròn đến hàng đơn vị)*?],
  [204],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    // Đường tròn (C)
    let pts = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts.push(prj(6 * calc.cos(rad), 6 * calc.sin(rad), 0)) 
    }
    line(..pts, stroke: 1.2pt + rgb("#0057b8"))
    content(prj(6.2, 0, 0), text(fill: rgb("#0057b8"))[$(C)$], anchor: "west")
    
    // Đường thẳng quỹ đạo
    let d_pts = ()
    for t in range(-8, -1) { d_pts.push(prj(0, 4*t, 3*t + 30)) }
    line(..d_pts, stroke: 1.2pt + rgb("#dc2626"))
    
    // Điểm M, N
    let M = prj(0, -6, 0)
    let N = prj(0, -18.24, 16.32)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "north-east", padding: 3pt)
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    line(M, N, stroke: 1.2pt + rgb("#16a34a"))
    
    // Nhãn đường thẳng d
    content(prj(0, -20, 15), text(fill: rgb("#dc2626"))[$d$], anchor: "south-east")
  }),
  fig-pos: "center",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Cảm biến vòng: $M(x; y; 0)$ trên $(C): x^2 + y^2 = 36, z=0 ==> y in [-6; 6]$.
      - Thiết bị bay: $N(0; 4t; 3t + 30)$.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách giữa $M$ và $N$:
    $ M N^2 = x^2 + (4t - y)^2 + (3t + 30)^2 = 25t^2 + 2(90-4y)t + 936. $
    Đạt cực tiểu tại $t = -frac(90-4y, 25)$. Khi đó:
    $ d(M, d)^2 = 936 - frac((90-4y)^2, 25) = frac(9(y+40)^2, 25). $
    Với $y in [-6; 6]$, giá trị nhỏ nhất của hàm số đạt tại $y = -6$:
    $ d_{\min} = frac(3(-6 + 40), 5) = 20.4 " (đơn vị)". $
    Khoảng cách thực tế: $b = 20.4  cdot 10 = 204$ mét.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,t) = x^2 + (y-4t)^2 + (3t+30)^2$ với điều kiện $x^2+y^2-36 = 0$.
    Hệ Lagrange: $2x(1+lambda)=0$, $2(y-4t)+2lambda y = 0$, $-4(y-4t)+6(3t+30)=0$.
    Với $x=0$, ta có $y = plus.minus 6$.
    - $y = 6 ==> t = -2.64 ==> F = 576$.
    - $y = -6 ==> t = -4.56 ==> F = 416.16$ (Cực tiểu).
    Suy ra $d_{\min} = sqrt(416.16) = 20.4 ==> b = 204$ mét.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 3: MÔ HÌNH ĐƯỜNG TRÒN - ĐƯỜNG THẲNG
// ═══════════════════════════════════════════════════════════
#tln(
  [Quỹ đạo của một thiết bị khảo sát khí tượng trên bầu trời được biểu diễn bởi đường tròn $(C): x^2 + y^2 = 100, z = 0$ (đơn vị trục đo bằng $100$ mét). Một khinh khí cầu nghiên cứu đang trôi theo đường thẳng có phương trình:
  $ Delta: cases(x = 0, y = t, z = -2t + 40) $
  Tính khoảng cách thực tế ngắn nhất $b$ (mét) giữa thiết bị khảo sát và khinh khí cầu *(làm tròn đến hàng đơn vị)*?],
  [894],
  fig: cetz.canvas(length: 0.22cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    // Đường tròn (C)
    let pts = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts.push(prj(10 * calc.cos(rad), 10 * calc.sin(rad), 0)) 
    }
    line(..pts, stroke: 1.2pt + rgb("#0057b8"))
    content(prj(10.2, 0, 0), text(fill: rgb("#0057b8"))[$(C)$], anchor: "west")
    
    // Đường thẳng Delta
    let d_pts = ()
    for t in range(5, 25) { d_pts.push(prj(0, t, -2*t + 40)) }
    line(..d_pts, stroke: 1.2pt + rgb("#dc2626"))
    
    // Điểm M, N
    let M = prj(0, 10, 0)
    let N = prj(0, 18, 4)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "south-east", padding: 3pt)
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "north-west", padding: 3pt)
    line(M, N, stroke: 1.2pt + rgb("#16a34a"))
    
    // Nhãn đường thẳng Delta
    content(prj(0, 24, -8), text(fill: rgb("#dc2626"))[$Delta$], anchor: "north-west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Vị trí thiết bị: $M(x; y; 0)$ trên $(C): x^2 + y^2 = 100, z=0 ==> y in [-10; 10]$.
      - Khinh khí cầu: $N(0; t; -2t + 40)$.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách giữa $M$ và $N$:
    $ M N^2 = x^2 + (t-y)^2 + (-2t+40)^2 = 5t^2 - 2(80+y)t + 1700. $
    Đạt cực tiểu tại $t = frac(80+y, 5)$. Bình phương khoảng cách từ $M$ đến $Delta$ là:
    $ d(M, Delta)^2 = 1700 - frac((80+y)^2, 5) = frac(-y^2 - 160y + 2100, 5). $
    Hàm số nghịch biến trên $[-10; 10]$. Do đó giá trị nhỏ nhất đạt tại $y = 10$:
    $ d_{\min}^2 = frac(-100 - 1600 + 2100, 5) = 80 ==> d_{\min} = 4 sqrt(5) " (đơn vị)". $
    Khoảng cách thực tế: $b = 4 sqrt(5)  cdot 100 approx 894.43$ mét.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,t) = x^2 + (y-t)^2 + (-2t+40)^2$ với $x^2+y^2-100 = 0$.
    Hàm Lagrange: $L = x^2 + (y-t)^2 + (-2t+40)^2 + lambda(x^2+y^2-100)$.
    Giải hệ điểm tới hạn thu được $x = 0 ==> y = plus.minus 10$.
    - Với $y = -10 ==> t = 14 ==> F = 240$.
    - Với $y = 10 ==> t = 18 ==> F = 80$ (Cực tiểu).
    Vậy $d_{\min} = sqrt(80) = 4 sqrt(5) ==> b approx 894$ mét.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 4: MÔ HÌNH MẶT CẦU - ĐƯỜNG THẲNG
// ═══════════════════════════════════════════════════════════
#tln(
  [Một buồng phản ứng nhiệt hạch hạt nhân được thiết kế có dạng hình cầu $(S): x^2 + y^2 + z^2 = 9$ (đơn vị trục tương ứng với $10$ mét). Một chùm tia năng lượng hạt chuyển động dọc theo đường dẫn thẳng có phương trình:
  $ d: cases(x = t, y = 3, z = 4) $
  Tính khoảng cách ngắn nhất $b$ (mét) giữa buồng phản ứng hình cầu và chùm tia hạt *(làm tròn đến hàng đơn vị)*?],
  [20],
  fig: ve-hinh-3d(
    R: 3,
    plane: "xoy",
    line-start: (-6, 3, 4),
    line-end: (6, 3, 4),
    M: (0, 1.8, 2.4),
    N: (0, 3, 4),
    scale: 0.35,
    line-label: [$d$]
  ),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Mặt cầu: $(S): x^2 + y^2 + z^2 = 9$.
      - Chùm tia: $N(t; 3; 4) in d$.
      - Ta cần tìm cực tiểu khoảng cách giữa điểm $M(x; y; z) in (S)$ và $N(t; 3; 4) in d$.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách giữa $M$ và $N$ là:
    $ M N^2 = (x - t)^2 + (y - 3)^2 + (z - 4)^2. $
    Để khoảng cách nhỏ nhất theo $t$, ta chọn $t = x$ (tối thiểu hóa theo biến $t$), lúc này:
    $ d(M, d)^2 = (y - 3)^2 + (z - 4)^2 = y^2 + z^2 - 6y - 8z + 25. $
    Do $x^2 + y^2 + z^2 = 9 ==> y^2 + z^2 = 9 - x^2$. Thay vào ta có:
    $ d(M, d)^2 = 34 - x^2 - (6y + 8z). $
    Theo bất đẳng thức Cauchy-Schwarz: $6y + 8z leq sqrt(6^2+8^2) sqrt(y^2+z^2) = 10 sqrt(9 - x^2)$.
    Suy ra: $d(M, d)^2 geq 34 - x^2 - 10 sqrt(9-x^2)$.
    Đặt $u = sqrt(9-x^2) in [0; 3] ==> x^2 = 9 - u^2$. Khi đó:
    $ d(M, d)^2 geq 34 - (9-u^2) - 10u = u^2 - 10u + 25 = (u - 5)^2. $
    Hàm số $(u-5)^2$ nghịch biến trên $[0; 3]$, đạt giá trị nhỏ nhất tại $u = 3$:
    $ d(M, d)^2 geq (3 - 5)^2 = 4 ==> min d(M, d) = 2 " (đơn vị)". $
    Khoảng cách thực tế: $b = 2  cdot 10 = 20$ mét.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,z,t) = (x-t)^2 + (y-3)^2 + (z-4)^2$ với $g(x,y,z) = x^2+y^2+z^2-9=0$.
    Hàm Lagrange: $L = (x-t)^2 + (y-3)^2 + (z-4)^2 + lambda(x^2+y^2+z^2-9)$.
    Đạo hàm theo $t$: $-2(x-t) = 0 ==> x = t$.
    Đạo hàm theo $x, y, z$:
    $ 2(x-t) + 2lambda x = 0 ==> lambda x = 0 $
    $ 2(y-3) + 2lambda y = 0 ==> y(1+lambda) = 3 $
    $ 2(z-4) + 2lambda z = 0 ==> z(1+lambda) = 4 $
    Từ $lambda x = 0$:
    - Nếu $lambda = 0 ==> y = 3, z = 4 ==> x^2 = 9 - 9 - 16 = -16 < 0$ (loại).
    - Nếu $x = 0 ==> y^2 + z^2 = 9$. Từ tỷ lệ: $y/z = 3/4 ==> y = 1.8, z = 2.4$ (hoặc ngược dấu).
    - Tại điểm $M(0; 1.8; 2.4)$ và $t = 0 ==> N(0; 3; 4)$, ta có:
      $ F = (0-0)^2 + (1.8-3)^2 + (2.4-4)^2 = 1.44 + 2.56 = 4. $
    Vậy $d_{\min} = 2 ==> b = 20$ mét.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 5: MÔ HÌNH HÌNH TRỤ - ĐƯỜNG THẲNG
// ═══════════════════════════════════════════════════════════
#tln(
  [Một bồn chứa nhiên liệu dạng hình trụ đứng có bề mặt xung quanh được mô tả bởi phương trình $x^2 + y^2 = 16$ với chiều cao giới hạn bởi $z in [-10; 10]$ (đơn vị đo trên các trục tương ứng là mét). Một đường ống dẫn khí chạy dọc theo đường thẳng:
  $ d: cases(x = 5, y = t, z = t + 5) $
  Khoảng cách ngắn nhất giữa bồn chứa hình trụ và đường ống dẫn khí bằng $b$ mét. Xác định giá trị $b$ *(làm tròn đến hàng đơn vị)*?],
  [1],
  fig: cetz.canvas(length: 0.32cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Vẽ elip đáy dưới z = -8 (phần khuất và phần nhìn thấy)
    let bot_back = ()
    for deg in range(30, 211, step: 5) { 
      let rad = deg * 0.0174532925
      bot_back.push(prj(4*calc.cos(rad), 4*calc.sin(rad), -8)) 
    }
    line(..bot_back, stroke: (paint: gray, dash: "dashed", thickness: 0.8pt))
    
    let bot_front = ()
    for deg in range(210, 391, step: 5) { 
      let rad = deg * 0.0174532925
      bot_front.push(prj(4*calc.cos(rad), 4*calc.sin(rad), -8)) 
    }
    line(..bot_front, stroke: 1pt + rgb("#0057b8"))
    
    // Vẽ elip đáy trên z = 8
    let pts_top = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts_top.push(prj(4*calc.cos(rad), 4*calc.sin(rad), 8)) 
    }
    line(..pts_top, stroke: 1.2pt + rgb("#0057b8"))
    
    // Viền trụ dọc chuẩn trực giao (tiếp tuyến biên tại theta = 30 độ và 210 độ)
    line(prj(3.464, 2, -8), prj(3.464, 2, 8), stroke: 1pt + gray)
    line(prj(-3.464, -2, -8), prj(-3.464, -2, 8), stroke: 1pt + gray)
    
    // Đường thẳng d
    let d_pts = ()
    for t in range(-12, 5) { d_pts.push(prj(5, t, t + 5)) }
    line(..d_pts, stroke: 1.2pt + rgb("#dc2626"))
    
    // Điểm M, N
    let M = prj(4, 0, 5)
    let N = prj(5, 0, 5)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "south-east", padding: 2pt)
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "west", padding: 3pt)
    line(M, N, stroke: 1.2pt + rgb("#16a34a"))
    
    // Nhãn cho đường thẳng d và hình trụ
    content(prj(5, 4, 9), text(fill: rgb("#dc2626"))[$d$], anchor: "south-west")
    content(prj(4.2, 0, 8), text(fill: rgb("#0057b8"))[$(T)$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Mặt trụ: $x^2 + y^2 = 16$ với $z in [-10; 10]$.
      - Đường thẳng: $N(5; t; t + 5) in d$.
      - Khoảng cách hình học phẳng từ hình chiếu trục trụ (trục $O z$) đến hình chiếu đường thẳng trên $(O x y)$ là khoảng cách từ $(0;0)$ đến đường $x=5$, bằng $5$.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách giữa $M(x;y;z)$ trên hình trụ và $N(5;t;t+5)$ trên đường thẳng:
    $ M N^2 = (x - 5)^2 + (y - t)^2 + (z - t - 5)^2. $
    Tối thiểu hóa biểu thức trên theo $t$ bằng cách lấy đạo hàm hoặc tọa độ đỉnh parabol theo $t$:
    $ t = frac(y + z - 5, 2). $
    Thay vào, ta được khoảng cách tối thiểu từ $M$ đến $d$:
    $ d(M, d)^2 = (x - 5)^2 + frac((y - z + 5)^2, 2). $
    Để $d(M, d)^2$ nhỏ nhất:
    - Với $x in [-4; 4]$, để $(x-5)^2$ nhỏ nhất ta chọn $x = 4$ (khi đó $(x-5)^2 = 1$).
    - Từ $x = 4 ==> y = 0$ (do $x^2 + y^2 = 16$).
    - Để phần thứ hai $frac((y - z + 5)^2, 2) = frac((-z+5)^2, 2) = 0$ ta chọn $z = 5 in [-10; 10]$.
    Vậy $min d(M, d)^2 = 1 ==> d_{\min} = 1$ mét.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,z,t) = (x-5)^2 + (y-t)^2 + (z-t-5)^2$ trên điều kiện $x^2+y^2-16=0$ và $z in [-10; 10]$.
    Hàm Lagrange: $L = (x-5)^2 + (y-t)^2 + (z-t-5)^2 + lambda(x^2+y^2-16)$.
    Lấy các đạo hàm theo các biến:
    - Đạo hàm theo $t$: $-2(y-t) - 2(z-t-5) = 0 ==> 2t = y+z-5$.
    - Đạo hàm theo $x, y$:
      $ (x-5) + lambda x = 0 $
      $ (y-t) + lambda y = 0 $
    Từ hệ thu được $y = 0 ==> x = 4$. Thay vào ta giải được $z = 5, t = 0$.
    Khoảng cách tối thiểu là $d = sqrt{(4-5)^2 + (0-0)^2 + (5-5)^2} = 1$ mét.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 6: MÔ HÌNH ELLIPSOID - ĐIỂM
// ═══════════════════════════════════════════════════════════
#tln(
  [Một mái vòm nhà thi đấu thể thao dạng nửa ellipsoid có phương trình nửa trên là $x^2 + y^2 + 4z^2 = 4$ với $z geq 0$ (đơn vị trục đo tương ứng với $10$ mét). Một drone giám sát bay cố định tại điểm $A(0; 0; 3)$. Tính khoảng cách ngắn nhất $b$ (mét) từ drone đến mái vòm nhà thi đấu *(làm tròn đến hàng đơn vị)*?],
  [20],
  fig: cetz.canvas(length: 0.4cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Vẽ elip xích đạo z = 0, bán kính 2 (phần khuất và phần nhìn thấy)
    let base_back = ()
    for deg in range(30, 211, step: 5) {
      let rad = deg * 0.0174532925
      base_back.push(prj(2*calc.cos(rad), 2*calc.sin(rad), 0))
    }
    line(..base_back, stroke: (paint: gray, dash: "dashed", thickness: 0.8pt))
    
    let base_front = ()
    for deg in range(210, 391, step: 5) {
      let rad = deg * 0.0174532925
      base_front.push(prj(2*calc.cos(rad), 2*calc.sin(rad), 0))
    }
    line(..base_front, stroke: 1.2pt + rgb("#0057b8"))
    
    // Đường biên trái/phải của vòm ellipsoid z = sqrt(1 - (x^2+y^2)/4) => r(z) = sqrt(4 - 4z^2)
    let left_pts = ()
    let right_pts = ()
    for i in range(0, 51) {
      let z = i / 50
      let r = calc.sqrt(calc.max(0.0, 4 - 4*z*z))
      left_pts.push(prj(-r * 0.866025, -r * 0.5, z))
      right_pts.push(prj(r * 0.866025, r * 0.5, z))
    }
    line(..left_pts, stroke: 1pt + gray)
    line(..right_pts, stroke: 1pt + gray)
    
    // Vẽ elip nằm ngang z = 0.5 làm đường lưới
    let Rz = calc.sqrt(3) // bán kính tại z=0.5
    let mid_back = ()
    for deg in range(30, 211, step: 5) { 
      let rad = deg * 0.0174532925
      mid_back.push(prj(Rz * calc.cos(rad), Rz * calc.sin(rad), 0.5)) 
    }
    line(..mid_back, stroke: (paint: gray.lighten(20%), dash: "dashed", thickness: 0.6pt))
    
    let mid_front = ()
    for deg in range(210, 391, step: 5) { 
      let rad = deg * 0.0174532925
      mid_front.push(prj(Rz * calc.cos(rad), Rz * calc.sin(rad), 0.5)) 
    }
    line(..mid_front, stroke: 0.6pt + gray)
    
    // Vẽ elip đứng dọc qua trục x-z (y = 0)
    let pts_xz = ()
    for deg in range(0, 181, step: 5) { 
      let rad = deg * 0.0174532925
      pts_xz.push(prj(2*calc.cos(rad), 0, 1*calc.sin(rad))) 
    }
    line(..pts_xz, stroke: 0.6pt + gray)
    
    // Điểm A và M
    let A = prj(0, 0, 3)
    let M = prj(0, 0, 1)
    circle(A, radius: 2pt, fill: rgb("#dc2626"))
    content(A, [$A$], anchor: "south-west", padding: 2pt)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "north-east", padding: 2pt)
    line(A, M, stroke: 1.2pt + rgb("#16a34a"))
    
    // Gốc O và nhãn mặt vòm
    circle(O, radius: 1pt, fill: black)
    content(O, [$O$], anchor: "north", padding: 2pt)
    content(prj(1.6, 1, 0.4), text(fill: rgb("#0057b8"))[$(S)$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Mái vòm ellipsoid: $x^2 + y^2 + 4z^2 = 4$ với $z geq 0$.
      - Điểm $A(0; 0; 3)$. Ta cần tìm giá trị nhỏ nhất của đoạn $A M$ với $M(x; y; z)$ thuộc mặt ellipsoid.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách giữa $A$ và $M(x;y;z)$ là:
    $ A M^2 = x^2 + y^2 + (z - 3)^2. $
    Do $M$ thuộc ellipsoid nên $x^2 + y^2 = 4 - 4z^2$. Từ điều kiện $x^2 + y^2 geq 0$ ta có $4 - 4z^2 geq 0 ==> z in [0; 1]$.
    Thay thế $x^2 + y^2$ vào biểu thức khoảng cách:
    $ A M^2 = 4 - 4z^2 + (z - 3)^2 = -3z^2 - 6z + 13. $
    Xét hàm số $g(z) = -3z^2 - 6z + 13$ trên đoạn $z in [0; 1]$.
    Ta có $g'(z) = -6z - 6 < 0$ với mọi $z in [0; 1]$. Do đó hàm số $g(z)$ nghịch biến trên đoạn $[0; 1]$.
    Suy ra giá trị nhỏ nhất của hàm số đạt được tại đầu mút bên phải $z = 1$:
    $ A M_{\min}^2 = g(1) = -3(1)^2 - 6(1) + 13 = 4 ==> A M_{\min} = 2 " (đơn vị)". $
    Khoảng cách thực tế: $b = 2  cdot 10 = 20$ mét.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,z) = x^2 + y^2 + (z-3)^2$ với điều kiện $x^2+y^2+4z^2-4=0$.
    Hàm Lagrange: $L = x^2 + y^2 + (z-3)^2 + lambda(x^2+y^2+4z^2-4)$.
    Đạo hàm theo các biến:
    $ 2x(1+lambda) = 0 $
    $ 2y(1+lambda) = 0 $
    $ 2(z-3) + 8lambda z = 0 $
    - Xét trường hợp $x = y = 0 ==> 4z^2 = 4 ==> z = 1$ (do $z geq 0$).
      - Tại điểm $M(0; 0; 1)$, ta có $F = 0^2 + 0^2 + (1-3)^2 = 4$.
    - Xét trường hợp $lambda = -1 ==> 2(z-3) - 8z = 0 ==> -6z = 6 ==> z = -1$ (không thỏa mãn $z geq 0$).
    Vậy khoảng cách tối thiểu bình phương là $4 ==> b = 20$ mét.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 7: MÔ HÌNH PARABOLOID - ĐIỂM
// ═══════════════════════════════════════════════════════════
#tln(
  [Một chao đèn chiếu sáng có mặt phản xạ dạng paraboloid tròn xoay có phương trình $z = x^2 + y^2$ (đơn vị đo tương ứng với $10$ cm). Một bóng đèn LED siêu sáng được đặt cố định tại tiêu điểm lý thuyết ở tọa độ $A(0; 0; 5/4)$. Tính khoảng cách ngắn nhất $b$ (cm) từ bóng đèn LED đến bề mặt của chao đèn phản xạ?],
  [10],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Vẽ paraboloid cắt ngang z = 1.5 (vành ngoài cùng phía trên)
    let pts = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts.push(prj(calc.sqrt(1.5)*calc.cos(rad), calc.sqrt(1.5)*calc.sin(rad), 1.5)) 
    }
    line(..pts, stroke: 1.2pt + rgb("#0057b8"))
    
    // Đường sườn biên trái và sườn biên phải của paraboloid
    let left_pts = ()
    let right_pts = ()
    for i in range(0, 51) {
      let z = 1.5 * i / 50
      let r = calc.sqrt(z)
      left_pts.push(prj(-r * 0.866025, -r * 0.5, z))
      right_pts.push(prj(r * 0.866025, r * 0.5, z))
    }
    line(..left_pts, stroke: 1pt + gray)
    line(..right_pts, stroke: 1pt + gray)
    
    // Khung parabol đứng dọc trục x-z để tạo chiều sâu 3D
    let para = ()
    for x in range(-12, 13) {
      let val = x * 0.1
      para.push(prj(val, 0, val*val))
    }
    line(..para, stroke: 0.6pt + gray)
    
    // Điểm A và M
    let A = prj(0, 0, 1.25)
    let M = prj(0, calc.sqrt(0.75), 0.75)
    circle(A, radius: 2pt, fill: rgb("#dc2626"))
    content(A, [$A$], anchor: "south-west", padding: 2pt)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "north-west", padding: 2pt)
    line(A, M, stroke: 1.2pt + rgb("#16a34a"))
    
    // Điểm O và nhãn chao đèn (P)
    circle(O, radius: 1pt, fill: black)
    content(O, [$O$], anchor: "north", padding: 2pt)
    content(prj(calc.sqrt(1.5), 0, 1.5), text(fill: rgb("#0057b8"))[$(P)$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Chao đèn paraboloid: $z = x^2 + y^2$ với $z geq 0$.
      - Bóng đèn LED: $A(0; 0; 5/4)$.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách từ $A$ đến điểm $M(x;y;z)$ trên mặt phản xạ là:
    $ A M^2 = x^2 + y^2 + (z - frac(5, 4))^2. $
    Do $M$ thuộc paraboloid nên $x^2 + y^2 = z$ (với $z geq 0$). Thế vào ta được:
    $ A M^2 = z + z^2 - frac(5, 2)z + frac(25, 16) = z^2 - frac(3, 2)z + frac(25, 16). $
    Đây là tam thức bậc hai theo biến $z$ với hệ số của $z^2$ là $1 > 0$. Parabol đạt cực tiểu tại điểm đỉnh:
    $ z = -frac(-3/2, 2) = frac(3, 4) > 0. $
    Khi đó, giá trị cực tiểu của $A M^2$ là:
    $ A M_{\min}^2 = (frac(3, 4))^2 - frac(3, 2)dot frac(3, 4) + frac(25, 16) = frac(9 - 18 + 25, 16) = frac(16, 16) = 1. $
    Suy ra $A M_{\min} = 1$ đơn vị dài $==> b = 1  cdot 10 = 10$ cm.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,z) = x^2 + y^2 + (z - 5/4)^2$ với ràng buộc $g(x,y,z) = x^2 + y^2 - z = 0$.
    Hàm Lagrange: $L = x^2 + y^2 + (z - 5/4)^2 + lambda(x^2 + y^2 - z)$.
    Đạo hàm riêng theo các biến:
    $ 2x(1 + lambda) = 0 $
    $ 2y(1 + lambda) = 0 $
    $ 2(z - 5/4) - lambda = 0 $
    - Xét trường hợp $x = y = 0 ==> z = 0$. Khi đó $F = (0-5/4)^2 = 25/16$.
    - Xét trường hợp $lambda = -1 ==> 2(z-5/4) + 1 = 0 ==> 2z - 2.5 + 1 = 0 ==> z = 0.75$.
      - Khi $z = 0.75 ==> x^2 + y^2 = 0.75$, ta có $F = 0.75 + (0.75 - 1.25)^2 = 0.75 + 0.25 = 1$ (Cực tiểu).
    Vậy khoảng cách ngắn nhất là $d = 1$ đơn vị dài $==> b = 10$ cm.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 8: MÔ HÌNH HÌNH NÓN - ĐIỂM
// ═══════════════════════════════════════════════════════════
#tln(
  [Bề mặt của một ngọn núi lửa dạng hình nón được mô phỏng bởi phương trình mặt nửa nón $z = sqrt(x^2 + y^2)$ (đơn vị dài trên mỗi trục tương ứng với $1$ km). Một trực thăng cứu hộ đang định vị cứu hộ đứng tại điểm cố định $A(0; 6; 0)$ trên không. Tính khoảng cách ngắn nhất $b$ (mét) từ trực thăng cứu hộ đến sườn núi lửa dạng nón này *(làm tròn đến hàng đơn vị)*?],
  [4243],
  fig: cetz.canvas(length: 0.35cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Đường tròn nón tại z = 6 (bán kính R = 6)
    let pts = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts.push(prj(6*calc.cos(rad), 6*calc.sin(rad), 6)) 
    }
    line(..pts, stroke: 1.2pt + rgb("#0057b8"))
    
    // Nối đỉnh nón với biên bên ngoài chuẩn trực giao (tiếp tuyến thực tại 8.66 và 231.34 độ)
    let p_side1 = prj(6 * calc.cos(8.66 * 0.0174532925), 6 * calc.sin(8.66 * 0.0174532925), 6)
    let p_side2 = prj(6 * calc.cos(231.34 * 0.0174532925), 6 * calc.sin(231.34 * 0.0174532925), 6)
    line(O, p_side1, stroke: 1pt + gray)
    line(O, p_side2, stroke: 1pt + gray)
    
    // Điểm A và M
    let A = prj(0, 6, 0)
    let M = prj(0, 3, 3)
    circle(A, radius: 2pt, fill: rgb("#dc2626"))
    content(A, [$A$], anchor: "north-west", padding: 3pt)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "south-west", padding: 3pt)
    line(A, M, stroke: 1.2pt + rgb("#16a34a"))
    
    // Đỉnh O và nhãn sườn nón
    circle(O, radius: 1.2pt, fill: black)
    content(O, [$O$], anchor: "north", padding: 2pt)
    content(prj(6.2, 0, 6), text(fill: rgb("#0057b8"))[$(N)$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Mặt nón: $z^2 = x^2 + y^2$ với $z geq 0$.
      - Điểm trực thăng: $A(0; 6; 0)$.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách giữa $A$ và điểm $M(x;y;z)$ trên mặt nón là:
    $ A M^2 = x^2 + (y-6)^2 + z^2. $
    Do $M$ thuộc sườn nón nên $x^2 + y^2 = z^2 ==> x^2 = z^2 - y^2 geq 0$. Thế vào ta được:
    $ A M^2 = (z^2 - y^2) + y^2 - 12y + 36 + z^2 = 2z^2 - 12y + 36. $
    Để khoảng cách nhỏ nhất, ta cần chọn $z^2$ nhỏ nhất có thể. Vì $z^2 geq y^2$, giá trị nhỏ nhất của $z^2$ đạt được khi $z^2 = y^2$ (tương ứng $x = 0$).
    Khi đó, biểu thức khoảng cách rút gọn còn:
    $ A M^2 = 2y^2 - 12y + 36. $
    Tam thức bậc hai theo biến $y$ có hệ số $2 > 0$ đạt cực tiểu tại $y = -frac(-12, 4) = 3$.
    Giá trị cực tiểu là:
    $ A M_{\min}^2 = 2(3)^2 - 12(3) + 36 = 18 ==> A M_{\min} = 3 sqrt(2) " (đơn vị)". $
    Khoảng cách thực tế: $b = 3  sqrt(2)  cdot 1000 approx 4242.64$ mét $==> b  approx 4243$ mét.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,z) = x^2 + (y-6)^2 + z^2$ với điều kiện $x^2+y^2-z^2=0$.
    Hàm Lagrange: $L = x^2 + (y-6)^2 + z^2 + lambda(x^2+y^2-z^2)$.
    Đạo hàm theo các biến:
    $ 2x(1+lambda) = 0 $
    $ 2(y-6) + 2lambda y = 0 ==> y(1+lambda) = 6 $
    $ 2z(1-lambda) = 0 $
    - Từ đạo hàm theo $z$ ta có $z = 0$ hoặc $lambda = 1$.
      - Nếu $z = 0 ==> x^2+y^2 = 0 ==> x = y = 0$. Tại $(0;0;0)$, $F = 36$.
      - Nếu $lambda = 1 ==> y(2) = 6 ==> y = 3$. Thay vào đạo hàm theo $x$ ta được $x = 0$ (vì $lambda = 1 neq -1$).
        - Khi $y = 3, x = 0 ==> z^2 = 9 ==> z = 3$ (do $z geq 0$).
        - Tại điểm $M(0; 3; 3)$, $F = 0^2 + (3-6)^2 + 3^2 = 18$ (Cực tiểu).
    Vậy khoảng cách ngắn nhất là $d = sqrt(18) = 3 sqrt(2) ==> b approx 4243$ mét.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 9: MÔ HÌNH ELIP - ĐƯỜNG THẲNG
// ═══════════════════════════════════════════════════════════
#tln(
  [Quỹ đạo di chuyển của một hành tinh nhỏ trong hệ mặt trời được mô hình hóa bởi đường elip $(E)$ trên mặt phẳng $(O x y)$ có phương trình $x^2 / 25 + y^2 / 9 = 1, z = 0$. Một tàu vũ trụ thám hiểm chuyển động thẳng đều dọc theo đường thẳng đứng:
  $ d: cases(x = 0, y = 5, z = t) $
  (đơn vị trục đo bằng $100$ triệu km). Tính khoảng cách thực tế ngắn nhất $b$ (triệu km) từ tàu vũ trụ tới quỹ đạo elip của hành tinh *(làm tròn đến hàng đơn vị)*?],
  [200],
  fig: cetz.canvas(length: 0.35cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Vẽ elip x^2/25 + y^2/9 = 1
    let pts = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts.push(prj(5*calc.cos(rad), 3*calc.sin(rad), 0)) 
    }
    line(..pts, stroke: 1.2pt + rgb("#0057b8"))
    content(prj(5.2, 0, 0), text(fill: rgb("#0057b8"))[$(E)$], anchor: "west")
    
    // Vẽ đường thẳng d đứng
    let d_pts = ()
    for t in range(-6, 7) { d_pts.push(prj(0, 5, t)) }
    line(..d_pts, stroke: 1.2pt + rgb("#dc2626"))
    
    // Điểm M, N
    let M = prj(0, 3, 0)
    let N = prj(0, 5, 0)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "south-east", padding: 3pt)
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    line(M, N, stroke: 1.2pt + rgb("#16a34a"))
    
    // Nhãn đường thẳng d
    content(prj(0, 5, 6), text(fill: rgb("#dc2626"))[$d$], anchor: "south-west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Quỹ đạo elip: $(E): x^2/25 + y^2/9 = 1, z=0 ==> y in [-3; 3]$.
      - Tàu vũ trụ: $N(0; 5; t)$ trên đường thẳng $d$.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách giữa điểm $M(x;y;0)$ trên elip và $N(0;5;t)$ trên đường thẳng $d$:
    $ M N^2 = x^2 + (y-5)^2 + t^2. $
    Để khoảng cách ngắn nhất theo $t$, ta chọn $t = 0$. Khi đó khoảng cách rút gọn còn:
    $ d(M, d)^2 = x^2 + (y-5)^2. $
    Do $M$ thuộc elip nên $x^2 = 25(1 - y^2/9)$. Thế vào ta được hàm số theo biến $y$:
    $ g(y) = 25(1 - frac(y^2, 9)) + y^2 - 10y + 25 = -frac(16, 9)y^2 - 10y + 50. $
    Đây là một parabol quay bề lõm xuống dưới (do hệ số $y^2$ âm). Do đó, giá trị nhỏ nhất của hàm số trên đoạn $[-3; 3]$ phải đạt tại một trong hai đầu mút:
    - Tại $y = 3 ==> g(3) = -16 - 30 + 50 = 4$.
    - Tại $y = -3 ==> g(-3) = -16 + 30 + 50 = 64$.
    Suy ra giá trị nhỏ nhất của bình phương khoảng cách là $4 ==> d_{\min} = 2$ (đơn vị).
    Khoảng cách thực tế: $b = 2  cdot 100 = 200$ triệu km.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,t) = x^2 + (y-5)^2 + t^2$ với điều kiện $x^2/25 + y^2/9 - 1 = 0$.
    Với $t = 0$, ta lập hàm Lagrange cho biến phẳng:
    $ L = x^2 + (y-5)^2 + lambda(x^2/25 + y^2/9 - 1). $
    Đạo hàm riêng theo các biến:
    $ 2x(1 + lambda/25) = 0 $
    $ 2(y-5) + 2lambda y / 9 = 0 $
    - Xét $x = 0 ==> y^2/9 = 1 ==> y = plus.minus 3$.
      - Với $y = 3 ==> F = 0^2 + (3-5)^2 = 4$ (Cực tiểu).
      - Với $y = -3 ==> F = 0^2 + (-3-5)^2 = 64$.
    Vậy khoảng cách tối thiểu là $d = 2 ==> b = 200$ triệu km.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI 10: MÔ HÌNH HYPERBOLOID - ĐIỂM
// ═══════════════════════════════════════════════════════════
#tln(
  [Một tháp làm nguội nhiệt điện có bề mặt là một mặt hyperboloid một tầng có phương trình $x^2 + y^2 - z^2 = 16$ (đơn vị trục đo tương ứng với $10$ mét). Người ta đặt một thiết bị đo tại điểm $A(0; 0; 6)$ trên trục đối xứng của tháp. Hãy tính khoảng cách ngắn nhất $b$ (mét) từ thiết bị đo đến bề mặt tường tháp hyperboloid *(làm tròn đến hàng đơn vị)*?],
  [58],
  fig: cetz.canvas(length: 0.35cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Vẽ elip đáy dưới z = -4 (phần khuất và phần nhìn thấy, bán kính sqrt(32) ≈ 5.66)
    let bot_back = ()
    for deg in range(30, 211, step: 5) {
      let rad = deg * 0.0174532925
      bot_back.push(prj(5.66*calc.cos(rad), 5.66*calc.sin(rad), -4))
    }
    line(..bot_back, stroke: (paint: gray, dash: "dashed", thickness: 0.8pt))
    
    let bot_front = ()
    for deg in range(210, 391, step: 5) {
      let rad = deg * 0.0174532925
      bot_front.push(prj(5.66*calc.cos(rad), 5.66*calc.sin(rad), -4))
    }
    line(..bot_front, stroke: 1.2pt + rgb("#0057b8"))
    
    // Đường tròn họng tại z = 0, bán kính 4 (phần khuất và phần nhìn thấy)
    let throat_back = ()
    for deg in range(30, 211, step: 5) { 
      let rad = deg * 0.0174532925
      throat_back.push(prj(4*calc.cos(rad), 4*calc.sin(rad), 0)) 
    }
    line(..throat_back, stroke: (paint: gray.lighten(20%), dash: "dashed", thickness: 0.6pt))
    
    let throat_front = ()
    for deg in range(210, 391, step: 5) { 
      let rad = deg * 0.0174532925
      throat_front.push(prj(4*calc.cos(rad), 4*calc.sin(rad), 0)) 
    }
    line(..throat_front, stroke: 0.6pt + gray)
    
    // Đường tròn tháp trên tại z = 4, bán kính R = sqrt(32) = 5.66 (nhìn thấy hoàn toàn)
    let pts_top = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts_top.push(prj(5.66*calc.cos(rad), 5.66*calc.sin(rad), 4)) 
    }
    line(..pts_top, stroke: 1.2pt + rgb("#0057b8"))
    
    // Khung sườn tháp hyperboloid dọc theo điểm tiếp tuyến biên (dùng 81 điểm cực mịn)
    let hyper_l = ()
    let hyper_r = ()
    for i in range(0, 81) {
      let z = -4 + 8 * i / 80
      let r = calc.sqrt(16 + z*z)
      hyper_l.push(prj(-r * 0.866025, -r * 0.5, z))
      hyper_r.push(prj(r * 0.866025, r * 0.5, z))
    }
    line(..hyper_l, stroke: 1pt + gray)
    line(..hyper_r, stroke: 1pt + gray)
    
    // Điểm A và M
    let A = prj(0, 0, 6)
    let M = prj(0, calc.sqrt(22.25), 2.5)
    circle(A, radius: 2pt, fill: rgb("#dc2626"))
    content(A, [$A$], anchor: "south-west", padding: 2pt)
    circle(M, radius: 2pt, fill: rgb("#0284c7"))
    content(M, [$M$], anchor: "north-west", padding: 2.5pt)
    line(A, M, stroke: 1.2pt + rgb("#16a34a"))
    
    // Gốc O và nhãn tháp (H)
    circle(O, radius: 1pt, fill: black)
    content(O, [$O$], anchor: "north-east", padding: 2pt)
    content(prj(5.8, 0, 4), text(fill: rgb("#0057b8"))[$(H)$], anchor: "west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Tháp hyperboloid: $x^2 + y^2 - z^2 = 16$.
      - Thiết bị đo: $A(0; 0; 6)$. Ta cần tìm giá trị nhỏ nhất của $A M$ với $M(x; y; z)$ thuộc hyperboloid.
    ]
    *Cách 1: Khảo sát hàm số (Cách gốc)*
    Bình phương khoảng cách từ $A$ đến $M(x;y;z)$ là:
    $ A M^2 = x^2 + y^2 + (z - 6)^2. $
    Do $M$ thuộc hyperboloid nên $x^2 + y^2 = 16 + z^2$. Thế vào biểu thức trên:
    $ A M^2 = 16 + z^2 + z^2 - 12z + 36 = 2z^2 - 12z + 52. $
    Đây là tam thức bậc hai theo biến $z$ với hệ số của $z^2$ là $2 > 0$. Tam thức đạt cực tiểu tại:
    $ z = -frac(-12, 4) = 3. $
    Giá trị cực tiểu của khoảng cách bình phương là:
    $ A M_{\min}^2 = 2(3)^2 - 12(3) + 52 = 34 ==> A M_{\min} = sqrt(34) " (đơn vị)". $
    Khoảng cách thực tế: $b = sqrt(34)  cdot 10 approx 58.31$ mét $==> b approx 58$ mét.

    *Cách 2: Phương pháp nhân tử Lagrange*
    Tối thiểu hóa $F(x,y,z) = x^2 + y^2 + (z - 6)^2$ với điều kiện $x^2 + y^2 - z^2 - 16 = 0$.
    Hàm Lagrange: $L = x^2 + y^2 + (z - 6)^2 + lambda(x^2 + y^2 - z^2 - 16)$.
    Đạo hàm riêng theo các biến:
    $ 2x(1 + lambda) = 0 $
    $ 2(y - 12t) $ (nhầm ký hiệu đạo hàm cũ) ==> thay bằng:
    $ 2y(1 + lambda) = 0 $
    $ 2(z - 6) - 2lambda z = 0 $
    - Xét trường hợp $x = y = 0 ==> -z^2 = 16$ (không có nghiệm thực).
    - Xét trường hợp $lambda = -1$. Thế vào đạo hàm theo $z$:
      $ 2(z-6) + 2z = 0 ==> 4z - 12 = 0 ==> z = 3. $
      - Khi $z = 3 ==> x^2 + y^2 = 16 + 9 = 25$.
      - Khi đó, $F = 25 + (3-6)^2 = 25 + 9 = 34$ (Cực tiểu).
    Khoảng cách ngắn nhất là $d = sqrt(34) ==> b approx 58$ mét.
  ],
)
