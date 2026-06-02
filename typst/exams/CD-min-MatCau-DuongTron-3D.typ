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

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
    [
      #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
        CHUYÊN ĐỀ: CỰC TRỊ KHOẢNG CÁCH MẶT CẦU - ĐƯỜNG TRÒN
      ]
      #v(0.3em)
      #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
        12 Mô hình Ứng dụng Thực tế & Hình học hóa 3D
      ]
    ],
  )
]

== A. BẢN CHẤT TOÁN HỌC & CÔNG THỨC GIẢI NHANH

Cho mặt cầu $(S)$ tâm $I$, bán kính $R_S$. Đường tròn $(C)$ tâm $J$, bán kính $R_C$ nằm trong mặt phẳng $(P)$.
Một điểm $M$ di động trên mặt cầu $(S)$, một điểm $N$ di động trên đường tròn $(C)$. Tìm khoảng cách nhỏ nhất giữa $M$ và $N$.

*Ý tưởng cốt lõi:* Chiếu tâm mặt cầu $I$ vuông góc xuống mặt phẳng $(P)$ chứa đường tròn $(C)$ để thu được hình chiếu $H$. Mọi khoảng cách đều được tính toán thông qua điểm trung gian $H$ này.

*Phân tích hình học:*
Theo bất đẳng thức tam giác với điểm $I, M, N$, ta có:
$ M N >= I N - I M = I N - R_S $
Do $R_S$ không đổi, $M N$ đạt giá trị nhỏ nhất khi và chỉ khi đoạn thẳng $I N$ đạt giá trị nhỏ nhất, đồng thời $I, M, N$ thẳng hàng (M nằm giữa I và N).

Gọi $H$ là hình chiếu vuông góc của tâm $I$ lên mặt phẳng $(P)$. Xét tam giác vuông $I H N$, theo định lý Pitago:
$ I N^2 = I H^2 + H N^2 $
Vì $I$ và $(P)$ cố định nên đoạn $I H = d(I, (P))$ không đổi. Để $I N$ nhỏ nhất thì $H N$ phải nhỏ nhất.
$H$ là điểm cố định nằm trên mặt phẳng $(P)$, còn $N$ là điểm di động trên đường tròn tâm $J$, bán kính $R_C$ cùng nằm trên mặt phẳng $(P)$. Khoảng cách ngắn nhất từ điểm $H$ đến đường tròn tâm $J$ chính là:
$ H N_(min) = |H J - R_C| $

#align(center)[
  #cetz.canvas(length: 0.4 * 1cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    // Mặt phẳng P
    let p1 = prj(-6, -6, 0)
    let p2 = prj(6, -6, 0)
    let p3 = prj(6, 6, 0)
    let p4 = prj(-6, 6, 0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    content(prj(5, 5, 0), text(fill: rgb("#0284c7"))[$(P)$], anchor: "south-west")
    
    // Đường tròn (C)
    let pts = ()
    for deg in range(0, 361, step: 5) { 
      let rad = deg * 0.0174532925
      pts.push(prj(4 * calc.cos(rad) - 2, 4 * calc.sin(rad), 0)) 
    }
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    content(prj(2, 0, 0), text(fill: rgb("#dc2626"))[$(C)$], anchor: "west")
    let J = prj(-2, 0, 0)
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Tâm I và Hình chiếu H
    let I = prj(3, 0, 7)
    let H = prj(3, 0, 0)
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    
    // N (trên C)
    let N = prj(-2 + 4, 0, 0)
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    
    // QUẢ CẦU 3D ĐẸP TẠI I
    let r = 2.5
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    content(prj(3, 0, 9.8), text(fill: rgb("#16a34a"))[$(S)$], anchor: "south-west")
    
    // Điểm M
    let M = prj(3 - 0.71, 0, 7 - 2.4)
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "east", padding: 3pt)
    
    // Đoạn thẳng
    line(I, N, stroke: 1.2pt + gray)
    line(M, N, stroke: 1.5pt + rgb("#d97706"))
  })
]

*Từ đó ta suy ra công thức tổng quát (Siêu tốc):*
#rect(fill: rgb("fef2f2"), stroke: 1pt + rgb("ef4444"), inset: 8pt, radius: 4pt)[
  $ M N_(min) = sqrt(d^2 (I, (P)) + (|H J| - R_C)^2) - R_S $
]

#chapter([Hệ thống bài tập phân loại mức độ (Thực tiễn & Hình học hóa)])

#tln(
  [(Bậc 1) Dưới đáy biển (được mô hình hóa bởi mặt phẳng tọa độ $O x y: z=0$), một trạm dò tìm quét một vùng vòng tròn giới hạn bởi phương trình $x^2 + y^2 = 16$. Trên mặt nước, một phao tiêu báo hiệu có dạng hình cầu $(S)$ với phương trình $(x-6)^2 + (y-8)^2 + (z-12)^2 = 4$. Tính khoảng cách ngắn nhất từ một điểm trên phao tiêu đến khu vực dò tìm của trạm (đơn vị mét)?],
  [11.42],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(6, 8, 12)
    let J = prj(0, 0, 0)
    let H = prj(6.0, 8.0, 0.0)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 6.0
    let p1 = prj(6.0 - pw*0.0 - pw*1.0, 8.0 - pw*-1.0 - pw*0.0, 0.0 - pw*0.0 - pw*-0.0)
    let p2 = prj(6.0 + pw*0.0 - pw*1.0, 8.0 + pw*-1.0 - pw*0.0, 0.0 + pw*0.0 - pw*-0.0)
    let p3 = prj(6.0 + pw*0.0 + pw*1.0, 8.0 + pw*-1.0 + pw*0.0, 0.0 + pw*0.0 + pw*-0.0)
    let p4 = prj(6.0 - pw*0.0 + pw*1.0, 8.0 - pw*-1.0 + pw*0.0, 0.0 - pw*0.0 + pw*-0.0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(0.0, -4.0, 0.0), prj(0.34862297099063266, -3.984778792366982, 0.0), prj(0.6945927106677213, -3.939231012048832, 0.0), prj(1.035276180410083, -3.8637033051562732, 0.0), prj(1.3680805733026749, -3.7587704831436337, 0.0), prj(1.6904730469627978, -3.6252311481465997, 0.0), prj(1.9999999999999998, -3.464101615137755, 0.0), prj(2.294305745404184, -3.276608177155967, 0.0), prj(2.571150438746157, -3.064177772475912, 0.0), prj(2.82842712474619, -2.8284271247461903, 0.0), prj(3.064177772475912, -2.5711504387461575, 0.0), prj(3.276608177155967, -2.2943057454041846, 0.0), prj(3.4641016151377544, -2.0000000000000004, 0.0), prj(3.6252311481465997, -1.6904730469627978, 0.0), prj(3.7587704831436333, -1.3680805733026753, 0.0), prj(3.8637033051562732, -1.035276180410083, 0.0), prj(3.939231012048832, -0.6945927106677217, 0.0), prj(3.984778792366982, -0.3486229709906325, 0.0), prj(4.0, -2.4492935982947064e-16, 0.0), prj(3.984778792366982, 0.34862297099063294, 0.0), prj(3.939231012048832, 0.6945927106677212, 0.0), prj(3.8637033051562732, 1.0352761804100834, 0.0), prj(3.7587704831436337, 1.3680805733026749, 0.0), prj(3.6252311481466, 1.6904730469627973, 0.0), prj(3.4641016151377553, 1.9999999999999991, 0.0), prj(3.276608177155967, 2.2943057454041846, 0.0), prj(3.064177772475912, 2.571150438746157, 0.0), prj(2.8284271247461903, 2.82842712474619, 0.0), prj(2.571150438746158, 3.0641777724759116, 0.0), prj(2.2943057454041837, 3.2766081771559676, 0.0), prj(1.9999999999999998, 3.464101615137755, 0.0), prj(1.690473046962798, 3.6252311481465997, 0.0), prj(1.3680805733026755, 3.7587704831436333, 0.0), prj(1.035276180410084, 3.863703305156273, 0.0), prj(0.694592710667721, 3.939231012048832, 0.0), prj(0.3486229709906328, 3.984778792366982, 0.0), prj(4.898587196589413e-16, 4.0, 0.0), prj(-0.3486229709906318, 3.984778792366982, 0.0), prj(-0.6945927106677219, 3.939231012048832, 0.0), prj(-1.0352761804100832, 3.8637033051562732, 0.0), prj(-1.3680805733026746, 3.7587704831436337, 0.0), prj(-1.690473046962797, 3.6252311481466, 0.0), prj(-2.0000000000000004, 3.4641016151377544, 0.0), prj(-2.2943057454041846, 3.276608177155967, 0.0), prj(-2.571150438746157, 3.064177772475912, 0.0), prj(-2.8284271247461894, 2.8284271247461907, 0.0), prj(-3.0641777724759116, 2.5711504387461583, 0.0), prj(-3.2766081771559663, 2.2943057454041855, 0.0), prj(-3.4641016151377535, 2.0000000000000018, 0.0), prj(-3.6252311481466006, 1.6904730469627964, 0.0), prj(-3.7587704831436337, 1.368080573302674, 0.0), prj(-3.8637033051562732, 1.0352761804100825, 0.0), prj(-3.939231012048832, 0.6945927106677213, 0.0), prj(-3.984778792366982, 0.348622970990633, 0.0), prj(-4.0, 7.347880794884119e-16, 0.0), prj(-3.984778792366982, -0.34862297099063155, 0.0), prj(-3.9392310120488325, -0.6945927106677199, 0.0), prj(-3.8637033051562737, -1.0352761804100812, 0.0), prj(-3.7587704831436333, -1.3680805733026762, 0.0), prj(-3.6252311481465993, -1.6904730469627984, 0.0), prj(-3.4641016151377544, -2.0, 0.0), prj(-3.276608177155967, -2.294305745404184, 0.0), prj(-3.0641777724759125, -2.571150438746157, 0.0), prj(-2.8284271247461907, -2.8284271247461894, 0.0), prj(-2.5711504387461583, -3.0641777724759116, 0.0), prj(-2.2943057454041855, -3.2766081771559663, 0.0), prj(-2.0000000000000018, -3.4641016151377535, 0.0), prj(-1.6904730469627967, -3.6252311481466, 0.0), prj(-1.3680805733026742, -3.7587704831436337, 0.0), prj(-1.0352761804100827, -3.8637033051562732, 0.0), prj(-0.6945927106677215, -3.939231012048832, 0.0), prj(-0.3486229709906333, -3.984778792366982, 0.0), prj(-9.797174393178826e-16, -4.0, 0.0))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 2
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Phao tiêu $(S)$ có tâm $I(6; 8; 12)$, bán kính $R_S = 2$.
  - Khu vực dò tìm là đường tròn $(C)$ tâm $J(0; 0; 0)$, bán kính $R_C = 4$, nằm trong $(O x y): z = 0$.
]
*Bước 1:* Hình chiếu vuông góc của tâm $I(6; 8; 12)$ lên mặt phẳng đáy biển $(O x y)$ là $H(6; 8; 0)$. Khoảng cách từ $I$ đến đáy biển: $I H = d(I, (O x y)) = 12$.
*Bước 2:* Khoảng cách từ $H(6; 8; 0)$ đến tâm $J(0; 0; 0)$ của đường tròn: $H J = 10$. Khoảng cách nhỏ nhất từ $H$ đến đường tròn $(C)$: $H N_(min) = |10 - 4| = 6$.
*Bước 3:* Áp dụng định lý Pitago: $I N_(min) = sqrt(12^2 + 6^2) = 6 sqrt(5)$. Khoảng cách cực tiểu: $M N_(min) = 6 sqrt(5) - 2$.
  ]
)

#tln(
  [(Bậc 1) Một vệ tinh định vị hình cầu có phương trình $x^2 + (y-15)^2 + (z-8)^2 = 9$. Nó đang rà quét một hệ thống đĩa cảm biến viễn vọng hình tròn có phương trình $x^2 + y^2 = 49$ nằm trên mặt phẳng xích đạo $z=0$. Xác định khoảng cách ngắn nhất giữa vệ tinh và đĩa viễn vọng?],
  [8.31],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(0, 15, 8)
    let J = prj(0, 0, 0)
    let H = prj(0.0, 15.0, 0.0)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 10.5
    let p1 = prj(0.0 - pw*0.0 - pw*1.0, 15.0 - pw*-1.0 - pw*0.0, 0.0 - pw*0.0 - pw*-0.0)
    let p2 = prj(0.0 + pw*0.0 - pw*1.0, 15.0 + pw*-1.0 - pw*0.0, 0.0 + pw*0.0 - pw*-0.0)
    let p3 = prj(0.0 + pw*0.0 + pw*1.0, 15.0 + pw*-1.0 + pw*0.0, 0.0 + pw*0.0 + pw*-0.0)
    let p4 = prj(0.0 - pw*0.0 + pw*1.0, 15.0 - pw*-1.0 + pw*0.0, 0.0 - pw*0.0 + pw*-0.0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(0.0, -7.0, 0.0), prj(0.6100901992336072, -6.973362886642219, 0.0), prj(1.2155372436685123, -6.893654271085456, 0.0), prj(1.8117333157176452, -6.761480784023478, 0.0), prj(2.394141003279681, -6.5778483455013586, 0.0), prj(2.9583278321848963, -6.3441545092565494, 0.0), prj(3.4999999999999996, -6.062177826491071, 0.0), prj(4.015035054457322, -5.7340643100229425, 0.0), prj(4.499513267805774, -5.362311101832846, 0.0), prj(4.949747468305832, -4.949747468305833, 0.0), prj(5.362311101832846, -4.499513267805775, 0.0), prj(5.7340643100229425, -4.015035054457323, 0.0), prj(6.06217782649107, -3.500000000000001, 0.0), prj(6.3441545092565494, -2.9583278321848963, 0.0), prj(6.5778483455013586, -2.3941410032796817, 0.0), prj(6.761480784023478, -1.8117333157176452, 0.0), prj(6.893654271085456, -1.2155372436685128, 0.0), prj(6.973362886642219, -0.6100901992336069, 0.0), prj(7.0, -4.286263797015736e-16, 0.0), prj(6.973362886642219, 0.6100901992336076, 0.0), prj(6.893654271085456, 1.2155372436685121, 0.0), prj(6.761480784023478, 1.811733315717646, 0.0), prj(6.5778483455013586, 2.394141003279681, 0.0), prj(6.34415450925655, 2.9583278321848954, 0.0), prj(6.062177826491071, 3.4999999999999982, 0.0), prj(5.7340643100229425, 4.015035054457323, 0.0), prj(5.362311101832846, 4.499513267805774, 0.0), prj(4.949747468305833, 4.949747468305832, 0.0), prj(4.499513267805776, 5.362311101832845, 0.0), prj(4.0150350544573215, 5.734064310022943, 0.0), prj(3.4999999999999996, 6.062177826491071, 0.0), prj(2.9583278321848967, 6.3441545092565494, 0.0), prj(2.394141003279682, 6.5778483455013586, 0.0), prj(1.8117333157176472, 6.761480784023478, 0.0), prj(1.2155372436685117, 6.893654271085456, 0.0), prj(0.6100901992336074, 6.973362886642219, 0.0), prj(8.572527594031472e-16, 7.0, 0.0), prj(-0.6100901992336056, 6.973362886642219, 0.0), prj(-1.2155372436685132, 6.893654271085456, 0.0), prj(-1.8117333157176456, 6.761480784023478, 0.0), prj(-2.394141003279681, 6.5778483455013586, 0.0), prj(-2.958327832184895, 6.34415450925655, 0.0), prj(-3.500000000000001, 6.06217782649107, 0.0), prj(-4.015035054457323, 5.7340643100229425, 0.0), prj(-4.499513267805774, 5.362311101832846, 0.0), prj(-4.949747468305832, 4.949747468305834, 0.0), prj(-5.362311101832845, 4.499513267805777, 0.0), prj(-5.734064310022941, 4.015035054457325, 0.0), prj(-6.062177826491069, 3.500000000000003, 0.0), prj(-6.344154509256551, 2.9583278321848936, 0.0), prj(-6.5778483455013586, 2.3941410032796795, 0.0), prj(-6.761480784023478, 1.8117333157176443, 0.0), prj(-6.893654271085456, 1.2155372436685123, 0.0), prj(-6.973362886642219, 0.6100901992336077, 0.0), prj(-7.0, 1.2858791391047208e-15, 0.0), prj(-6.973362886642219, -0.6100901992336052, 0.0), prj(-6.893654271085457, -1.2155372436685097, 0.0), prj(-6.761480784023479, -1.811733315717642, 0.0), prj(-6.5778483455013586, -2.3941410032796835, 0.0), prj(-6.344154509256549, -2.958327832184897, 0.0), prj(-6.06217782649107, -3.5, 0.0), prj(-5.7340643100229425, -4.015035054457322, 0.0), prj(-5.362311101832847, -4.499513267805774, 0.0), prj(-4.949747468305834, -4.949747468305832, 0.0), prj(-4.499513267805777, -5.362311101832845, 0.0), prj(-4.015035054457325, -5.734064310022941, 0.0), prj(-3.500000000000003, -6.062177826491069, 0.0), prj(-2.958327832184894, -6.34415450925655, 0.0), prj(-2.39414100327968, -6.5778483455013586, 0.0), prj(-1.8117333157176447, -6.761480784023478, 0.0), prj(-1.2155372436685128, -6.893654271085456, 0.0), prj(-0.6100901992336082, -6.973362886642219, 0.0), prj(-1.7145055188062944e-15, -7.0, 0.0))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 3
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Vệ tinh $(S)$ có tâm $I(0; 15; 8)$, bán kính $R_S = 3$.
  - Đĩa viễn vọng là đường tròn $(C)$ tâm $J(0; 0; 0)$, bán kính $R_C = 7$, nằm trên $z=0$.
]
*Bước 1:* Hình chiếu của $I(0; 15; 8)$ lên $z=0$ là $H(0; 15; 0)$. Khoảng cách là $I H = 8$.
*Bước 2:* Khoảng cách từ $H(0; 15; 0)$ đến tâm đĩa $J(0; 0; 0)$ là: $H J = 15$. Khoảng cách cực tiểu từ $H$ đến $(C)$: $H N_(min) = |15 - 7| = 8$.
*Bước 3:* Pitago: $I N_(min) = sqrt(8^2 + 8^2) = 8 sqrt(2)$. Khoảng cách cực tiểu: $M N_(min) = 8 sqrt(2) - 3$.
  ]
)

#tln(
  [(Bậc 2) Khinh khí cầu do thám dạng hình cầu $(S): (x-3)^2 + (y-4)^2 + (z-15)^2 = 25$ lơ lửng trên không trung. Flycam bay theo quỹ đạo là đường tròn $(C): (x-8)^2 + (y-16)^2 = 64, z=10$. Tìm khoảng cách ngắn nhất giữa flycam và khinh khí cầu?],
  [2.07],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(3, 4, 15)
    let J = prj(8, 16, 10)
    let H = prj(3.0, 4.0, 10.0)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 12.0
    let p1 = prj(3.0 - pw*0.0 - pw*1.0, 4.0 - pw*-1.0 - pw*0.0, 10.0 - pw*0.0 - pw*-0.0)
    let p2 = prj(3.0 + pw*0.0 - pw*1.0, 4.0 + pw*-1.0 - pw*0.0, 10.0 + pw*0.0 - pw*-0.0)
    let p3 = prj(3.0 + pw*0.0 + pw*1.0, 4.0 + pw*-1.0 + pw*0.0, 10.0 + pw*0.0 + pw*-0.0)
    let p4 = prj(3.0 - pw*0.0 + pw*1.0, 4.0 - pw*-1.0 + pw*0.0, 10.0 - pw*0.0 + pw*-0.0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(8.0, 8.0, 10.0), prj(8.697245941981265, 8.030442415266036, 10.0), prj(9.389185421335442, 8.121537975902335, 10.0), prj(10.070552360820166, 8.272593389687454, 10.0), prj(10.73616114660535, 8.482459033712733, 10.0), prj(11.380946093925596, 8.7495377037068, 10.0), prj(12.0, 9.07179676972449, 10.0), prj(12.588611490808368, 9.446783645688065, 10.0), prj(13.142300877492314, 9.871644455048177, 10.0), prj(13.65685424949238, 10.34314575050762, 10.0), prj(14.128355544951823, 10.857699122507686, 10.0), prj(14.553216354311935, 11.411388509191632, 10.0), prj(14.928203230275509, 12.0, 10.0), prj(15.2504622962932, 12.619053906074404, 10.0), prj(15.517540966287267, 13.263838853394649, 10.0), prj(15.727406610312546, 13.929447639179834, 10.0), prj(15.878462024097665, 14.610814578664556, 10.0), prj(15.969557584733964, 15.302754058018735, 10.0), prj(16.0, 16.0, 10.0), prj(15.969557584733964, 16.697245941981265, 10.0), prj(15.878462024097665, 17.38918542133544, 10.0), prj(15.727406610312546, 18.070552360820166, 10.0), prj(15.517540966287267, 18.73616114660535, 10.0), prj(15.2504622962932, 19.380946093925594, 10.0), prj(14.92820323027551, 20.0, 10.0), prj(14.553216354311935, 20.58861149080837, 10.0), prj(14.128355544951823, 21.142300877492314, 10.0), prj(13.65685424949238, 21.65685424949238, 10.0), prj(13.142300877492316, 22.128355544951823, 10.0), prj(12.588611490808368, 22.553216354311935, 10.0), prj(12.0, 22.92820323027551, 10.0), prj(11.380946093925596, 23.2504622962932, 10.0), prj(10.736161146605351, 23.517540966287267, 10.0), prj(10.070552360820168, 23.727406610312546, 10.0), prj(9.389185421335442, 23.878462024097665, 10.0), prj(8.697245941981265, 23.969557584733963, 10.0), prj(8.000000000000002, 24.0, 10.0), prj(7.302754058018737, 23.969557584733963, 10.0), prj(6.610814578664556, 23.878462024097665, 10.0), prj(5.929447639179834, 23.727406610312546, 10.0), prj(5.263838853394651, 23.517540966287267, 10.0), prj(4.619053906074406, 23.2504622962932, 10.0), prj(3.999999999999999, 22.928203230275507, 10.0), prj(3.4113885091916307, 22.553216354311935, 10.0), prj(2.857699122507686, 22.128355544951823, 10.0), prj(2.343145750507621, 21.656854249492383, 10.0), prj(1.8716444550481768, 21.142300877492318, 10.0), prj(1.4467836456880674, 20.588611490808372, 10.0), prj(1.071796769724493, 20.000000000000004, 10.0), prj(0.7495377037067987, 19.380946093925594, 10.0), prj(0.4824590337127326, 18.736161146605347, 10.0), prj(0.2725933896874535, 18.070552360820166, 10.0), prj(0.12153797590233584, 17.389185421335444, 10.0), prj(0.03044241526603564, 16.697245941981265, 10.0), prj(0.0, 16.0, 10.0), prj(0.03044241526603564, 15.302754058018737, 10.0), prj(0.12153797590233495, 14.61081457866456, 10.0), prj(0.2725933896874526, 13.929447639179838, 10.0), prj(0.48245903371273346, 13.263838853394647, 10.0), prj(0.7495377037068014, 12.619053906074402, 10.0), prj(1.0717967697244912, 12.0, 10.0), prj(1.4467836456880656, 11.411388509191632, 10.0), prj(1.871644455048175, 10.857699122507686, 10.0), prj(2.3431457505076185, 10.34314575050762, 10.0), prj(2.8576991225076833, 9.871644455048177, 10.0), prj(3.411388509191629, 9.446783645688068, 10.0), prj(3.9999999999999964, 9.071796769724493, 10.0), prj(4.619053906074407, 8.7495377037068, 10.0), prj(5.263838853394652, 8.482459033712733, 10.0), prj(5.929447639179834, 8.272593389687454, 10.0), prj(6.610814578664557, 8.121537975902335, 10.0), prj(7.302754058018733, 8.030442415266036, 10.0), prj(7.999999999999998, 8.0, 10.0))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 5
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Khinh khí cầu $(S)$ tâm $I(3; 4; 15)$, bán kính $R_S = 5$.
  - Quỹ đạo flycam $(C)$ tâm $J(8; 16; 10)$, bán kính $R_C = 8$, thuộc mặt phẳng $z=10$.
]
*Bước 1:* Hình chiếu của $I$ lên $z=10$ là $H(3; 4; 10)$. Độ dài $I H = 5$.
*Bước 2:* Khoảng cách $H J = sqrt((8-3)^2 + (16-4)^2) = 13$. Độ lệch khoảng cách từ $H$ đến đường tròn $(C)$: $H N_(min) = |13 - 8| = 5$.
*Bước 3:* Pitago: $I N_(min) = sqrt(5^2 + 5^2) = 5 sqrt(2)$. Khoảng cách cực tiểu: $M N_(min) = 5 sqrt(2) - 5$.
  ]
)

#tln(
  [(Bậc 2) Bề mặt một tòa nhà được trang bị một hệ thống vòng đệm an toàn tròn $(C): (y+2)^2 + z^2 = 49$ nằm trên mặt kính $x = 3$. Một drone khảo sát $(S)$ có phương trình $(x-12)^2 + (y-10)^2 + (z-5)^2 = 4$. Tính khoảng cách tối thiểu giữa drone và vòng đệm?],
  [8.82],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(12, 10, 5)
    let J = prj(3, -2, 0)
    let H = prj(3.0, 10.0, 5.0)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 10.5
    let p1 = prj(3.0 - pw*0.0 - pw*0.0, 10.0 - pw*1.0 - pw*0.0, 5.0 - pw*0.0 - pw*1.0)
    let p2 = prj(3.0 + pw*0.0 - pw*0.0, 10.0 + pw*1.0 - pw*0.0, 5.0 + pw*0.0 - pw*1.0)
    let p3 = prj(3.0 + pw*0.0 + pw*0.0, 10.0 + pw*1.0 + pw*0.0, 5.0 + pw*0.0 + pw*1.0)
    let p4 = prj(3.0 - pw*0.0 + pw*0.0, 10.0 - pw*1.0 + pw*0.0, 5.0 - pw*0.0 + pw*1.0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(3.0, 5.0, 0.0), prj(3.0, 4.973362886642219, 0.6100901992336072), prj(3.0, 4.893654271085456, 1.2155372436685123), prj(3.0, 4.761480784023478, 1.8117333157176452), prj(3.0, 4.5778483455013586, 2.394141003279681), prj(3.0, 4.3441545092565494, 2.9583278321848963), prj(3.0, 4.062177826491071, 3.4999999999999996), prj(3.0, 3.7340643100229425, 4.015035054457322), prj(3.0, 3.362311101832846, 4.499513267805774), prj(3.0, 2.9497474683058327, 4.949747468305832), prj(3.0, 2.499513267805775, 5.362311101832846), prj(3.0, 2.0150350544573232, 5.7340643100229425), prj(3.0, 1.5000000000000009, 6.06217782649107), prj(3.0, 0.9583278321848963, 6.3441545092565494), prj(3.0, 0.3941410032796817, 6.5778483455013586), prj(3.0, -0.18826668428235482, 6.761480784023478), prj(3.0, -0.7844627563314872, 6.893654271085456), prj(3.0, -1.389909800766393, 6.973362886642219), prj(3.0, -1.9999999999999996, 7.0), prj(3.0, -2.610090199233608, 6.973362886642219), prj(3.0, -3.2155372436685123, 6.893654271085456), prj(3.0, -3.811733315717646, 6.761480784023478), prj(3.0, -4.394141003279681, 6.5778483455013586), prj(3.0, -4.958327832184896, 6.34415450925655), prj(3.0, -5.499999999999998, 6.062177826491071), prj(3.0, -6.015035054457323, 5.7340643100229425), prj(3.0, -6.499513267805774, 5.362311101832846), prj(3.0, -6.949747468305832, 4.949747468305833), prj(3.0, -7.362311101832845, 4.499513267805776), prj(3.0, -7.734064310022943, 4.0150350544573215), prj(3.0, -8.062177826491071, 3.4999999999999996), prj(3.0, -8.34415450925655, 2.9583278321848967), prj(3.0, -8.577848345501359, 2.394141003279682), prj(3.0, -8.761480784023478, 1.8117333157176472), prj(3.0, -8.893654271085456, 1.2155372436685117), prj(3.0, -8.973362886642219, 0.6100901992336074), prj(3.0, -9.0, 8.572527594031472e-16), prj(3.0, -8.973362886642219, -0.6100901992336056), prj(3.0, -8.893654271085456, -1.2155372436685132), prj(3.0, -8.761480784023478, -1.8117333157176456), prj(3.0, -8.577848345501359, -2.394141003279681), prj(3.0, -8.344154509256551, -2.958327832184895), prj(3.0, -8.06217782649107, -3.500000000000001), prj(3.0, -7.7340643100229425, -4.015035054457323), prj(3.0, -7.362311101832846, -4.499513267805774), prj(3.0, -6.949747468305834, -4.949747468305832), prj(3.0, -6.499513267805777, -5.362311101832845), prj(3.0, -6.015035054457325, -5.734064310022941), prj(3.0, -5.5000000000000036, -6.062177826491069), prj(3.0, -4.958327832184894, -6.344154509256551), prj(3.0, -4.39414100327968, -6.5778483455013586), prj(3.0, -3.8117333157176443, -6.761480784023478), prj(3.0, -3.2155372436685123, -6.893654271085456), prj(3.0, -2.610090199233608, -6.973362886642219), prj(3.0, -2.0000000000000013, -7.0), prj(3.0, -1.3899098007663948, -6.973362886642219), prj(3.0, -0.7844627563314903, -6.893654271085457), prj(3.0, -0.18826668428235793, -6.761480784023479), prj(3.0, 0.3941410032796835, -6.5778483455013586), prj(3.0, 0.9583278321848971, -6.344154509256549), prj(3.0, 1.5, -6.06217782649107), prj(3.0, 2.0150350544573223, -5.7340643100229425), prj(3.0, 2.4995132678057743, -5.362311101832847), prj(3.0, 2.949747468305832, -4.949747468305834), prj(3.0, 3.3623111018328453, -4.499513267805777), prj(3.0, 3.7340643100229407, -4.015035054457325), prj(3.0, 4.062177826491069, -3.500000000000003), prj(3.0, 4.34415450925655, -2.958327832184894), prj(3.0, 4.5778483455013586, -2.39414100327968), prj(3.0, 4.761480784023478, -1.8117333157176447), prj(3.0, 4.893654271085456, -1.2155372436685128), prj(3.0, 4.973362886642219, -0.6100901992336082), prj(3.0, 5.0, -1.7145055188062944e-15))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 2
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Drone $(S)$ tâm $I(12; 10; 5)$, bán kính $R_S = 2$.
  - Vòng đệm $(C)$ tâm $J(3; -2; 0)$, bán kính $R_C = 7$, thuộc mặt phẳng $x=3$.
]
*Bước 1:* Hình chiếu của $I$ lên mặt kính $x=3$ là $H(3; 10; 5)$. Khoảng cách: $I H = |12 - 3| = 9$.
*Bước 2:* Khoảng cách $H J = sqrt((10 - (-2))^2 + (5 - 0)^2) = 13$. Giá trị tối thiểu trên mặt kính: $H N_(min) = |13 - 7| = 6$.
*Bước 3:* Pitago: $I N_(min) = sqrt(9^2 + 6^2) = 3 sqrt(13)$. Khoảng cách cực tiểu: $M N_(min) = 3 sqrt(13) - 2$.
  ]
)

#tln(
  [(Bậc 3) Một hành tinh nhỏ dạng cầu $(S_1): x^2 + y^2 + z^2 = 25$ bị cắt bởi một mặt phẳng kiến tạo $z = 4$ tạo ra một miệng núi lửa hình tròn $(C)$. Một tàu trinh sát không gian dạng cầu $(S_2): (x-8)^2 + (y-15)^2 + (z-24)^2 = 16$. Tìm khoảng cách cực tiểu từ thân tàu vũ trụ đến vành của miệng núi lửa?],
  [20.41],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(8, 15, 24)
    let J = prj(0, 0, 4)
    let H = prj(8.0, 15.0, 4.0)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 6
    let p1 = prj(8.0 - pw*0.0 - pw*1.0, 15.0 - pw*-1.0 - pw*0.0, 4.0 - pw*0.0 - pw*-0.0)
    let p2 = prj(8.0 + pw*0.0 - pw*1.0, 15.0 + pw*-1.0 - pw*0.0, 4.0 + pw*0.0 - pw*-0.0)
    let p3 = prj(8.0 + pw*0.0 + pw*1.0, 15.0 + pw*-1.0 + pw*0.0, 4.0 + pw*0.0 + pw*-0.0)
    let p4 = prj(8.0 - pw*0.0 + pw*1.0, 15.0 - pw*-1.0 + pw*0.0, 4.0 - pw*0.0 + pw*-0.0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(0.0, -3.0, 4.0), prj(0.2614672282429745, -2.988584094275237, 4.0), prj(0.520944533000791, -2.954423259036624, 4.0), prj(0.7764571353075622, -2.897777478867205, 4.0), prj(1.0260604299770062, -2.8190778623577253, 4.0), prj(1.2678547852220983, -2.7189233611099497, 4.0), prj(1.4999999999999998, -2.598076211353316, 4.0), prj(1.7207293090531381, -2.4574561328669753, 4.0), prj(1.9283628290596178, -2.298133329356934, 4.0), prj(2.1213203435596424, -2.121320343559643, 4.0), prj(2.298133329356934, -1.9283628290596182, 4.0), prj(2.4574561328669753, -1.7207293090531386, 4.0), prj(2.598076211353316, -1.5000000000000004, 4.0), prj(2.7189233611099497, -1.2678547852220983, 4.0), prj(2.819077862357725, -1.0260604299770064, 4.0), prj(2.897777478867205, -0.7764571353075622, 4.0), prj(2.954423259036624, -0.5209445330007912, 4.0), prj(2.988584094275237, -0.26146722824297436, 4.0), prj(3.0, -1.8369701987210297e-16, 4.0), prj(2.988584094275237, 0.2614672282429747, 4.0), prj(2.954423259036624, 0.5209445330007909, 4.0), prj(2.897777478867205, 0.7764571353075626, 4.0), prj(2.8190778623577253, 1.0260604299770062, 4.0), prj(2.71892336110995, 1.267854785222098, 4.0), prj(2.5980762113533165, 1.4999999999999993, 4.0), prj(2.4574561328669753, 1.7207293090531386, 4.0), prj(2.298133329356934, 1.9283628290596178, 4.0), prj(2.121320343559643, 2.1213203435596424, 4.0), prj(1.9283628290596184, 2.2981333293569337, 4.0), prj(1.7207293090531377, 2.4574561328669757, 4.0), prj(1.4999999999999998, 2.598076211353316, 4.0), prj(1.2678547852220985, 2.7189233611099497, 4.0), prj(1.0260604299770066, 2.819077862357725, 4.0), prj(0.7764571353075631, 2.8977774788672046, 4.0), prj(0.5209445330007907, 2.954423259036624, 4.0), prj(0.2614672282429746, 2.988584094275237, 4.0), prj(3.6739403974420594e-16, 3.0, 4.0), prj(-0.26146722824297386, 2.988584094275237, 4.0), prj(-0.5209445330007914, 2.954423259036624, 4.0), prj(-0.7764571353075624, 2.897777478867205, 4.0), prj(-1.026060429977006, 2.8190778623577253, 4.0), prj(-1.2678547852220978, 2.71892336110995, 4.0), prj(-1.5000000000000004, 2.598076211353316, 4.0), prj(-1.7207293090531386, 2.4574561328669753, 4.0), prj(-1.9283628290596178, 2.298133329356934, 4.0), prj(-2.121320343559642, 2.121320343559643, 4.0), prj(-2.2981333293569337, 1.9283628290596186, 4.0), prj(-2.457456132866975, 1.720729309053139, 4.0), prj(-2.598076211353315, 1.5000000000000013, 4.0), prj(-2.7189233611099506, 1.2678547852220974, 4.0), prj(-2.8190778623577253, 1.0260604299770055, 4.0), prj(-2.897777478867205, 0.7764571353075619, 4.0), prj(-2.954423259036624, 0.520944533000791, 4.0), prj(-2.988584094275237, 0.26146722824297475, 4.0), prj(-3.0, 5.51091059616309e-16, 4.0), prj(-2.988584094275237, -0.26146722824297364, 4.0), prj(-2.9544232590366244, -0.5209445330007899, 4.0), prj(-2.897777478867205, -0.7764571353075609, 4.0), prj(-2.819077862357725, -1.026060429977007, 4.0), prj(-2.7189233611099493, -1.2678547852220987, 4.0), prj(-2.598076211353316, -1.5, 4.0), prj(-2.4574561328669753, -1.7207293090531381, 4.0), prj(-2.2981333293569346, -1.9283628290596178, 4.0), prj(-2.121320343559643, -2.121320343559642, 4.0), prj(-1.9283628290596186, -2.2981333293569337, 4.0), prj(-1.720729309053139, -2.457456132866975, 4.0), prj(-1.5000000000000013, -2.598076211353315, 4.0), prj(-1.2678547852220974, -2.71892336110995, 4.0), prj(-1.0260604299770058, -2.8190778623577253, 4.0), prj(-0.776457135307562, -2.897777478867205, 4.0), prj(-0.5209445330007911, -2.954423259036624, 4.0), prj(-0.26146722824297497, -2.988584094275237, 4.0), prj(-7.347880794884119e-16, -3.0, 4.0))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 4
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Tàu trinh sát $(S_2)$ tâm $I(8; 15; 24)$, bán kính $R_S = 4$.
  - Miệng núi lửa là đường tròn $(C)$ giao tuyến của $(S_1)$ tâm $O(0;0;0)$ bán kính $R_1=5$ và mặt phẳng $z=4$.
]
*Bước 1:* Khoảng cách từ tâm $O$ đến mặt phẳng $z=4$ là $d = 4$.
Bán kính đường tròn $(C)$ là $R_C = sqrt(R_1^2 - d^2) = sqrt(25 - 16) = 3$. Tâm của $(C)$ là $J(0; 0; 4)$.
*Bước 2:* Hình chiếu của tâm tàu $I(8; 15; 24)$ lên $z=4$ là $H(8; 15; 4)$. Khoảng cách $I H = 20$.
Độ dài $H J = sqrt(8^2 + 15^2) = 17$. Khoảng cách cực tiểu: $H N_(min) = |17 - 3| = 14$.
*Bước 3:* Khoảng cách từ tâm tàu $I$ đến miệng núi lửa: $I N_(min) = sqrt(20^2 + 14^2) = 2 sqrt(149)$. Khoảng cách cực tiểu: $M N_(min) = 2 sqrt(149) - 4$.
  ]
)

#tln(
  [(Bậc 4) Một đĩa mặt trời nhân tạo thu năng lượng $(C)$ có tâm $J(2; 2; 2)$, bán kính $R_C = 5$ được lắp đặt nằm trên mặt dốc $(P): 2x + 2y - z - 6 = 0$. Một quả cầu trữ năng lượng $(S): (x-11)^2 + (y-14)^2 + (z-15)^2 = 4$ bay lơ lửng bên trên. Tìm độ dài đoạn cáp ngắn nhất kết nối quả cầu với viền của đĩa mặt trời?],
  [13.67],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(11, 14, 15)
    let J = prj(2, 2, 2)
    let H = prj(4.555555555555555, 7.555555555555555, 18.22222222222222)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 7.5
    let p1 = prj(4.555555555555555 - pw*-0.7071067811865475 - pw*0.23570226039551587, 7.555555555555555 - pw*0.7071067811865475 - pw*0.23570226039551587, 18.22222222222222 - pw*0.0 - pw*0.9428090415820635)
    let p2 = prj(4.555555555555555 + pw*-0.7071067811865475 - pw*0.23570226039551587, 7.555555555555555 + pw*0.7071067811865475 - pw*0.23570226039551587, 18.22222222222222 + pw*0.0 - pw*0.9428090415820635)
    let p3 = prj(4.555555555555555 + pw*-0.7071067811865475 + pw*0.23570226039551587, 7.555555555555555 + pw*0.7071067811865475 + pw*0.23570226039551587, 18.22222222222222 + pw*0.0 + pw*0.9428090415820635)
    let p4 = prj(4.555555555555555 - pw*-0.7071067811865475 + pw*0.23570226039551587, 7.555555555555555 - pw*0.7071067811865475 + pw*0.23570226039551587, 18.22222222222222 - pw*0.0 + pw*0.9428090415820635)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(-1.5355339059327373, 5.535533905932738, 2.0), prj(-1.4193661041534276, 5.624794159874158, 2.410856111441462), prj(-1.277174861651806, 5.686467541548382, 2.8185853597931523), prj(-1.1100423396407308, 5.720084679281462, 3.220084679281462), prj(-0.9192405175300816, 5.725389726356666, 3.6122984176531685), prj(-0.7062215123954092, 5.702342308162475, 3.9922415915341327), prj(-0.47260652749018306, 5.651117829467762, 4.3570226039551585), prj(-0.22017351391011408, 5.5721061394855775, 4.703865251150926), prj(0.049156360688230816, 5.465908564885249, 5.030129851146958), prj(0.33333333333333337, 5.333333333333333, 5.333333333333334), prj(0.6301946456726181, 5.175389422393055, 5.6111681361313455), prj(0.9374810038694211, 4.993278880595809, 5.861519768930462), prj(1.2528537731932887, 4.788387679126027, 6.08248290463863), prj(1.573912776442382, 4.56227516374358, 6.272375880371924), prj(1.8982145607412482, 4.316662187221001, 6.429753495924499), prj(2.2232909936926024, 4.053418012614795, 6.553418012614796), prj(2.5466680473551673, 3.774546087044896, 6.642428268800126), prj(2.8658846270901677, 3.482168794252361, 6.696106842685058), prj(3.1785113019775793, 3.1785113019775793, 6.714045207910317), prj(3.4821687942523614, 2.8658846270901677, 6.696106842685058), prj(3.7745460870448952, 2.5466680473551673, 6.642428268800126), prj(4.053418012614796, 2.2232909936926024, 6.553418012614796), prj(4.3166621872210005, 1.8982145607412488, 6.4297534959244995), prj(4.56227516374358, 1.5739127764423826, 6.272375880371925), prj(4.788387679126026, 1.25285377319329, 6.082482904638632), prj(4.993278880595809, 0.9374810038694211, 5.861519768930462), prj(5.175389422393055, 0.6301946456726185, 5.6111681361313455), prj(5.333333333333334, 0.3333333333333339, 5.333333333333334), prj(5.465908564885249, 0.04915636068823115, 5.03012985114696), prj(5.5721061394855775, -0.22017351391011464, 4.703865251150925), prj(5.651117829467762, -0.47260652749018306, 4.3570226039551585), prj(5.702342308162475, -0.7062215123954092, 3.9922415915341327), prj(5.725389726356664, -0.9192405175300805, 3.6122984176531694), prj(5.720084679281461, -1.1100423396407297, 3.2200846792814635), prj(5.686467541548382, -1.277174861651806, 2.818585359793152), prj(5.624794159874158, -1.4193661041534276, 2.4108561114414626), prj(5.535533905932738, -1.535533905932737, 2.0000000000000004), prj(5.419366104153427, -1.6247941598741584, 1.5891438885585387), prj(5.2771748616518055, -1.6864675415483823, 1.1814146402068468), prj(5.110042339640731, -1.720084679281462, 0.7799153207185376), prj(4.919240517530082, -1.7253897263566658, 0.3877015823468317), prj(4.70622151239541, -1.7023423081624758, 0.007758408465868394), prj(4.472606527490182, -1.6511178294677618, -0.35702260395515895), prj(4.220173513910114, -1.572106139485577, -0.7038652511509262), prj(3.950843639311769, -1.4659085648852481, -1.0301298511469579), prj(3.666666666666667, -1.3333333333333337, -1.333333333333333), prj(3.3698053543273834, -1.1753894223930557, -1.6111681361313455), prj(3.0625189961305805, -0.9932788805958103, -1.8615197689304606), prj(2.747146226806713, -0.7883876791260276, -2.0824829046386295), prj(2.4260872235576167, -0.5622751637435792, -2.272375880371926), prj(2.1017854392587503, -0.31666218722100026, -2.4297534959244995), prj(1.7767090063073974, -0.053418012614795174, -2.553418012614796), prj(1.4533319526448327, 0.2254539129551043, -2.642428268800126), prj(1.1341153729098323, 0.5178312057476384, -2.696106842685058), prj(0.8214886980224212, 0.8214886980224201, -2.714045207910317), prj(0.5178312057476397, 1.1341153729098314, -2.696106842685058), prj(0.22545391295510542, 1.4533319526448312, -2.642428268800127), prj(-0.053418012614794286, 1.7767090063073958, -2.553418012614797), prj(-0.31666218722100203, 2.1017854392587525, -2.4297534959244986), prj(-0.5622751637435808, 2.4260872235576185, -2.272375880371924), prj(-0.7883876791260263, 2.747146226806711, -2.0824829046386304), prj(-0.9932788805958092, 3.0625189961305783, -1.8615197689304614), prj(-1.1753894223930546, 3.369805354327381, -1.6111681361313464), prj(-1.3333333333333328, 3.666666666666665, -1.3333333333333348), prj(-1.4659085648852486, 3.9508436393117687, -1.0301298511469597), prj(-1.572106139485577, 4.2201735139101135, -0.7038652511509276), prj(-1.6511178294677613, 4.472606527490181, -0.3570226039551607), prj(-1.7023423081624756, 4.70622151239541, 0.007758408465868838), prj(-1.7253897263566658, 4.919240517530082, 0.3877015823468324), prj(-1.720084679281462, 5.110042339640731, 0.7799153207185381), prj(-1.686467541548382, 5.2771748616518055, 1.1814146402068473), prj(-1.6247941598741589, 5.419366104153427, 1.589143888558537), prj(-1.5355339059327375, 5.535533905932738, 1.999999999999999))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 2
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Quả cầu $(S)$ tâm $I(11; 14; 15)$, bán kính $R_S = 2$.
  - Đĩa mặt trời $(C)$ tâm $J(2; 2; 2)$, bán kính $R_C = 5$, thuộc $(P): 2x+2y-z-6=0$.
]
*Bước 1:* Tính khoảng cách vuông góc từ $I$ đến mặt dốc $(P)$:
$ I H = d(I, (P)) = (abs(2(11) + 2(14) - 15 - 6)) / 3 = 29/3. $
*Bước 2:* Đường thẳng qua $I$ vuông góc với $(P)$ có phương trình tham số $x = 11 + 2t, y = 14 + 2t, z = 15 - t$. Thay vào $(P)$ giải ra $t = -29/9$. Tọa độ hình chiếu $H(41/9; 68/9; 164/9)$.
Độ dài $H J = sqrt(24345) / 9 approx 17.33$.
Khoảng cách cực tiểu trên mặt dốc: $H N_(min) = |H J - 5|$.
*Bước 3:* Độ dài cáp ngắn nhất:
$ I N_(min) = sqrt(I H^2 + H N_(min)^2) = sqrt((29/3)^2 + (H J - 5)^2). $
$ M N_(min) = I N_(min) - 2. $
  ]
)

#tln(
  [(Bậc 5) Vòng quay Mặt Trời (Sun Wheel) tại khu công viên có quỹ đạo của một cabin tuân theo phương trình tham số $x = 3 + 10 cos t, y = 4 + 10 sin t, z = 5$ (với $t in [0; 2pi]$). Một quả bóng bay khổng lồ dạng mặt cầu $(S): x^2 + (y-12)^2 + (z-20)^2 = 16$ bị vướng trên không trung. Bỏ qua kích thước cabin, tìm khoảng cách ngắn nhất giữa cabin và quả bóng bay?],
  [11.07],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(0, 12, 20)
    let J = prj(3, 4, 5)
    let H = prj(0.0, 12.0, 5.0)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 15.0
    let p1 = prj(0.0 - pw*0.0 - pw*1.0, 12.0 - pw*-1.0 - pw*0.0, 5.0 - pw*0.0 - pw*-0.0)
    let p2 = prj(0.0 + pw*0.0 - pw*1.0, 12.0 + pw*-1.0 - pw*0.0, 5.0 + pw*0.0 - pw*-0.0)
    let p3 = prj(0.0 + pw*0.0 + pw*1.0, 12.0 + pw*-1.0 + pw*0.0, 5.0 + pw*0.0 + pw*-0.0)
    let p4 = prj(0.0 - pw*0.0 + pw*1.0, 12.0 - pw*-1.0 + pw*0.0, 5.0 - pw*0.0 + pw*-0.0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(3.0, -6.0, 5.0), prj(3.8715574274765814, -5.961946980917455, 5.0), prj(4.7364817766693035, -5.8480775301220795, 5.0), prj(5.588190451025207, -5.659258262890683, 5.0), prj(6.420201433256687, -5.396926207859085, 5.0), prj(7.2261826174069945, -5.063077870366499, 5.0), prj(7.999999999999999, -4.660254037844387, 5.0), prj(8.73576436351046, -4.191520442889917, 5.0), prj(9.427876096865393, -3.66044443118978, 5.0), prj(10.071067811865476, -3.0710678118654755, 5.0), prj(10.66044443118978, -2.4278760968653934, 5.0), prj(11.191520442889917, -1.7357643635104614, 5.0), prj(11.660254037844386, -1.0000000000000009, 5.0), prj(12.063077870366499, -0.22618261740699452, 5.0), prj(12.396926207859083, 0.5797985667433116, 5.0), prj(12.659258262890683, 1.4118095489747926, 5.0), prj(12.84807753012208, 2.2635182233306956, 5.0), prj(12.961946980917455, 3.1284425725234186, 5.0), prj(13.0, 3.9999999999999996, 5.0), prj(12.961946980917455, 4.871557427476582, 5.0), prj(12.84807753012208, 5.736481776669303, 5.0), prj(12.659258262890683, 6.588190451025208, 5.0), prj(12.396926207859085, 7.420201433256687, 5.0), prj(12.0630778703665, 8.226182617406995, 5.0), prj(11.660254037844389, 8.999999999999998, 5.0), prj(11.191520442889917, 9.735764363510462, 5.0), prj(10.66044443118978, 10.427876096865393, 5.0), prj(10.071067811865476, 11.071067811865476, 5.0), prj(9.427876096865395, 11.660444431189779, 5.0), prj(8.735764363510459, 12.191520442889919, 5.0), prj(7.999999999999999, 12.660254037844387, 5.0), prj(7.2261826174069945, 13.063077870366499, 5.0), prj(6.420201433256689, 13.396926207859083, 5.0), prj(5.58819045102521, 13.659258262890681, 5.0), prj(4.736481776669303, 13.84807753012208, 5.0), prj(3.871557427476582, 13.961946980917455, 5.0), prj(3.0000000000000013, 14.0, 5.0), prj(2.1284425725234204, 13.961946980917455, 5.0), prj(1.2635182233306952, 13.84807753012208, 5.0), prj(0.41180954897479216, 13.659258262890683, 5.0), prj(-0.4202014332566866, 13.396926207859085, 5.0), prj(-1.2261826174069927, 13.0630778703665, 5.0), prj(-2.000000000000001, 12.660254037844386, 5.0), prj(-2.7357643635104614, 12.191520442889917, 5.0), prj(-3.4278760968653925, 11.66044443118978, 5.0), prj(-4.071067811865474, 11.071067811865477, 5.0), prj(-4.660444431189779, 10.427876096865397, 5.0), prj(-5.1915204428899155, 9.735764363510464, 5.0), prj(-5.660254037844384, 9.000000000000004, 5.0), prj(-6.063077870366502, 8.226182617406991, 5.0), prj(-6.396926207859085, 7.420201433256684, 5.0), prj(-6.659258262890683, 6.5881904510252065, 5.0), prj(-6.8480775301220795, 5.7364817766693035, 5.0), prj(-6.961946980917455, 4.871557427476582, 5.0), prj(-7.0, 4.000000000000002, 5.0), prj(-6.961946980917455, 3.1284425725234213, 5.0), prj(-6.848077530122081, 2.2635182233307, 5.0), prj(-6.659258262890685, 1.411809548974797, 5.0), prj(-6.396926207859083, 0.5797985667433094, 5.0), prj(-6.063077870366499, -0.2261826174069963, 5.0), prj(-5.6602540378443855, -1.0, 5.0), prj(-5.191520442889917, -1.7357643635104605, 5.0), prj(-4.660444431189781, -2.4278760968653925, 5.0), prj(-4.071067811865477, -3.0710678118654737, 5.0), prj(-3.427876096865396, -3.660444431189779, 5.0), prj(-2.735764363510464, -4.1915204428899155, 5.0), prj(-2.0000000000000044, -4.660254037844384, 5.0), prj(-1.2261826174069919, -5.0630778703665005, 5.0), prj(-0.42020143325668524, -5.396926207859085, 5.0), prj(0.41180954897479305, -5.659258262890683, 5.0), prj(1.263518223330696, -5.8480775301220795, 5.0), prj(2.128442572523417, -5.961946980917455, 5.0), prj(2.9999999999999973, -6.0, 5.0))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 4
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Quả bóng bay $(S)$ tâm $I(0; 12; 20)$, bán kính $R_S = 4$.
  - Quỹ đạo cabin chính là phương trình tham số của đường tròn $(C)$ tâm $J(3; 4; 5)$, bán kính $R_C = 10$, thuộc mặt phẳng $z=5$.
]
*Bước 1:* Hình chiếu tâm $I(0; 12; 20)$ lên mặt phẳng $z=5$ là $H(0; 12; 5)$. Khoảng cách $I H = |20 - 5| = 15$.
*Bước 2:* Độ dài đoạn $H J = sqrt((3-0)^2 + (4-12)^2) = sqrt(73)$.
Khoảng cách từ $H$ đến quỹ đạo $(C)$:
$ H N_(min) = |H J - R_C| = |sqrt(73) - 10| = 10 - sqrt(73) quad ("Vì " sqrt(73) approx 8.54 < 10). $
*Bước 3:* Khoảng cách từ $I$ đến cabin:
$ I N_(min) = sqrt(I H^2 + H N_(min)^2) = sqrt(15^2 + (10 - sqrt(73))^2) = sqrt(398 - 20sqrt(73)). $
Khoảng cách ngắn nhất cần tìm:
$ M N_(min) = sqrt(398 - 20sqrt(73)) - 4. $
  ]
)

#tln(
  [(Bậc 6) Một trạm vũ trụ nhỏ được neo tại một vị trí di động trên mặt cầu $(S): (x-m)^2 + y^2 + z^2 = 1$. Nó phải duy trì khoảng cách kết nối an toàn tối thiểu tới một vành đai vành khuyên $(C): x^2 + y^2 = 16, z=4$ (bỏ qua độ dày vành khuyên) đúng bằng $4$. Tìm giá trị thực dương của tham số $m$ để thỏa mãn hệ thống an toàn này?],
  [1; 7],
  fig: cetz.canvas(length: 0.3cm, {
    import cetz.draw: *
    let prj(x, y, z) = {
      let alpha = -30 * 0.0174532925
      let beta = 20 * 0.0174532925
      let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
      let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
      let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
      (xp, ypp)
    }
    
    let I = prj(7, 0, 0)
    let J = prj(0, 0, 4)
    let H = prj(7.0, 0.0, 4.0)
    
    // Mặt phẳng (P) ảo (vẽ theo u, v)
    let pw = 6.0
    let p1 = prj(7.0 - pw*0.0 - pw*1.0, 0.0 - pw*-1.0 - pw*0.0, 4.0 - pw*0.0 - pw*-0.0)
    let p2 = prj(7.0 + pw*0.0 - pw*1.0, 0.0 + pw*-1.0 - pw*0.0, 4.0 + pw*0.0 - pw*-0.0)
    let p3 = prj(7.0 + pw*0.0 + pw*1.0, 0.0 + pw*-1.0 + pw*0.0, 4.0 + pw*0.0 + pw*-0.0)
    let p4 = prj(7.0 - pw*0.0 + pw*1.0, 0.0 - pw*-1.0 + pw*0.0, 4.0 - pw*0.0 + pw*-0.0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe40"), stroke: 0.8pt + rgb("#0284c7"))
    
    // Đường tròn (C)
    let pts = (prj(0.0, -4.0, 4.0), prj(0.34862297099063266, -3.984778792366982, 4.0), prj(0.6945927106677213, -3.939231012048832, 4.0), prj(1.035276180410083, -3.8637033051562732, 4.0), prj(1.3680805733026749, -3.7587704831436337, 4.0), prj(1.6904730469627978, -3.6252311481465997, 4.0), prj(1.9999999999999998, -3.464101615137755, 4.0), prj(2.294305745404184, -3.276608177155967, 4.0), prj(2.571150438746157, -3.064177772475912, 4.0), prj(2.82842712474619, -2.8284271247461903, 4.0), prj(3.064177772475912, -2.5711504387461575, 4.0), prj(3.276608177155967, -2.2943057454041846, 4.0), prj(3.4641016151377544, -2.0000000000000004, 4.0), prj(3.6252311481465997, -1.6904730469627978, 4.0), prj(3.7587704831436333, -1.3680805733026753, 4.0), prj(3.8637033051562732, -1.035276180410083, 4.0), prj(3.939231012048832, -0.6945927106677217, 4.0), prj(3.984778792366982, -0.3486229709906325, 4.0), prj(4.0, -2.4492935982947064e-16, 4.0), prj(3.984778792366982, 0.34862297099063294, 4.0), prj(3.939231012048832, 0.6945927106677212, 4.0), prj(3.8637033051562732, 1.0352761804100834, 4.0), prj(3.7587704831436337, 1.3680805733026749, 4.0), prj(3.6252311481466, 1.6904730469627973, 4.0), prj(3.4641016151377553, 1.9999999999999991, 4.0), prj(3.276608177155967, 2.2943057454041846, 4.0), prj(3.064177772475912, 2.571150438746157, 4.0), prj(2.8284271247461903, 2.82842712474619, 4.0), prj(2.571150438746158, 3.0641777724759116, 4.0), prj(2.2943057454041837, 3.2766081771559676, 4.0), prj(1.9999999999999998, 3.464101615137755, 4.0), prj(1.690473046962798, 3.6252311481465997, 4.0), prj(1.3680805733026755, 3.7587704831436333, 4.0), prj(1.035276180410084, 3.863703305156273, 4.0), prj(0.694592710667721, 3.939231012048832, 4.0), prj(0.3486229709906328, 3.984778792366982, 4.0), prj(4.898587196589413e-16, 4.0, 4.0), prj(-0.3486229709906318, 3.984778792366982, 4.0), prj(-0.6945927106677219, 3.939231012048832, 4.0), prj(-1.0352761804100832, 3.8637033051562732, 4.0), prj(-1.3680805733026746, 3.7587704831436337, 4.0), prj(-1.690473046962797, 3.6252311481466, 4.0), prj(-2.0000000000000004, 3.4641016151377544, 4.0), prj(-2.2943057454041846, 3.276608177155967, 4.0), prj(-2.571150438746157, 3.064177772475912, 4.0), prj(-2.8284271247461894, 2.8284271247461907, 4.0), prj(-3.0641777724759116, 2.5711504387461583, 4.0), prj(-3.2766081771559663, 2.2943057454041855, 4.0), prj(-3.4641016151377535, 2.0000000000000018, 4.0), prj(-3.6252311481466006, 1.6904730469627964, 4.0), prj(-3.7587704831436337, 1.368080573302674, 4.0), prj(-3.8637033051562732, 1.0352761804100825, 4.0), prj(-3.939231012048832, 0.6945927106677213, 4.0), prj(-3.984778792366982, 0.348622970990633, 4.0), prj(-4.0, 7.347880794884119e-16, 4.0), prj(-3.984778792366982, -0.34862297099063155, 4.0), prj(-3.9392310120488325, -0.6945927106677199, 4.0), prj(-3.8637033051562737, -1.0352761804100812, 4.0), prj(-3.7587704831436333, -1.3680805733026762, 4.0), prj(-3.6252311481465993, -1.6904730469627984, 4.0), prj(-3.4641016151377544, -2.0, 4.0), prj(-3.276608177155967, -2.294305745404184, 4.0), prj(-3.0641777724759125, -2.571150438746157, 4.0), prj(-2.8284271247461907, -2.8284271247461894, 4.0), prj(-2.5711504387461583, -3.0641777724759116, 4.0), prj(-2.2943057454041855, -3.2766081771559663, 4.0), prj(-2.0000000000000018, -3.4641016151377535, 4.0), prj(-1.6904730469627967, -3.6252311481466, 4.0), prj(-1.3680805733026742, -3.7587704831436337, 4.0), prj(-1.0352761804100827, -3.8637033051562732, 4.0), prj(-0.6945927106677215, -3.939231012048832, 4.0), prj(-0.3486229709906333, -3.984778792366982, 4.0), prj(-9.797174393178826e-16, -4.0, 4.0))
    line(..pts, stroke: 1.2pt + rgb("#dc2626"))
    
    circle(J, radius: 1.5pt, fill: black)
    content(J, [$J$], anchor: "north", padding: 3pt)
    
    // Cầu (S) tại I
    let r = 1
    circle(I, radius: r, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
    circle(I, radius: (0.35 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    circle(I, radius: (0.7 * r, r), stroke: (dash: "dashed", paint: rgb("b0bec5"), thickness: 0.6pt))
    arc((I.at(0) + r, I.at(1)), start: 0deg, stop: 180deg, radius: (r, 0.2 * r), stroke: (dash: "dashed", paint: rgb("#16a34a"), thickness: 1pt))
    arc((I.at(0) - r, I.at(1)), start: 180deg, stop: 360deg, radius: (r, 0.2 * r), stroke: (paint: rgb("#16a34a"), thickness: 1pt))
    
    circle(I, radius: 1.5pt, fill: black)
    content(I, [$I$], anchor: "south-west", padding: 3pt)
    
    circle(H, radius: 1.5pt, fill: black)
    content(H, [$H$], anchor: "north", padding: 3pt)
    line(I, H, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(H, J, stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #ppgiai[
  - Mặt cầu $(S)$ tâm $I(m; 0; 0)$, bán kính $R_S = 1$.
  - Vành đai $(C)$ tâm $J(0; 0; 4)$, bán kính $R_C = 4$, nằm trên mặt phẳng $z=4$.
]
*Bước 1:* Hình chiếu của tâm $I(m; 0; 0)$ lên mặt phẳng $z=4$ là $H(m; 0; 4)$. Khoảng cách: $I H = 4$.
*Bước 2:* Khoảng cách $H J = sqrt(m^2) = m$ (vì $m > 0$). Khoảng cách từ $H$ đến vành đai $(C)$: $H N_(min) = |m - 4|$.
*Bước 3:* Lập phương trình khoảng cách ngắn nhất: $M N_(min) = sqrt(I H^2 + H N_(min)^2) - R_S = sqrt(16 + (m-4)^2) - 1$.
Theo bài toán, $M N_(min) = 4$:
$ sqrt(16 + (m-4)^2) - 1 = 4 <=> 16 + (m-4)^2 = 25 <=> (m-4)^2 = 9 $
Do đó $m - 4 = 3 => m = 7$ hoặc $m - 4 = -3 => m = 1$.
Vậy có hai giá trị thực dương của tham số là $m = 7$ và $m = 1$.

  ]
)
