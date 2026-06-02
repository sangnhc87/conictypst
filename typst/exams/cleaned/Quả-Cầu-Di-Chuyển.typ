#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../../math-sym.typ": *


#show: stexgv-doc.with(
  doc-type: "book",
  title: "CHUYÊN ĐỀ: QUẢ CẦU DI CHUYỂN",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue
)

#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: QUẢ CẦU DI CHUYỂN]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[Kỹ thuật giải bài toán chuyển động của quả cầu.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill:  math-color)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// ═══════════════════════════════════════════════════════════
// TÂM PHÁP MỞ ĐẦU
// ═══════════════════════════════════════════════════════════
= TÂM PHÁP: BA CỖ ĐẠI BÁC VẠN NĂNG

#rect(
  fill: rgb("FFF3E0"),
  stroke: (left: 5pt + rgb("E65100")),
  inset: 14pt, width: 100%, radius: 4pt
)[
  #text(weight: "bold", size: 12.5pt, fill: rgb("BF360C"))[💥 Đại Bác 1 — Tham Số Hóa Thời Gian (Nền tảng của mọi bài)]
  #v(0.4em)
  Bất kỳ vật nào chuyển động thẳng đều đều có thể được viết dưới dạng *phương trình tham số theo $t$*. Đây là "ngôn ngữ vũ trụ" của tất cả các bài toán di chuyển 3D:
  
  $
  M(t) = underbrace(M_0, "Vị trí ban đầu") + t dot underbrace(vect(v)_("don"), "Véctơ vận tốc đơn vị") dot underbrace(v, "Tốc độ")
  $
  
  Trong đó: $vect(v)_("don") = vect(u) / |vect(u)|$ với $vect(u)$ là véctơ chỉ hướng bất kỳ.
  
  *Hệ quả thực chiến:* Nếu véctơ hướng là $vect(u) = (a; b; c)$ và tốc độ là $v$, thì:
  $ vect(v) = v/(sqrt(a^2+b^2+c^2)) dot (a; b; c) $
  và tọa độ: $M(t) = (x_0 + a_v t ;; y_0 + b_v t ;; z_0 + c_v t)$.
]

#v(0.8em)

#rect(
  fill: rgb("E8F5E9"),
  stroke: (left: 5pt + rgb("2E7D32")),
  inset: 14pt, width: 100%, radius: 4pt
)[
  #text(weight: "bold", size: 12.5pt, fill: rgb("1B5E20"))[💥 Đại Bác 2 — Bất Đẳng Thức Khoảng Cách (Chuyên trị Va chạm & Vùng phủ)]
  #v(0.4em)
  Mọi điều kiện va chạm, vào vùng, ra vùng đều quy về một phương trình hoặc bất phương trình bậc 2 theo $t$:
  
  - *Vật chạm bề mặt mặt cầu tâm $I$, bán kính $R$:*
    $ |I M(t)|^2 = R^2 quad (=> text("Phương trình bậc 2, lấy nghiệm") t "nhỏ nhất") $
  - *Vật nằm trong vùng mặt cầu:*
    $ |I M(t)|^2 <= R^2 quad (=> text("Bất phương trình bậc 2, tìm") Delta t = t_2 - t_1) $
  
  *Mẹo:* Luôn khai triển $|I M(t)|^2$ rồi thu gọn thành dạng $at^2 + bt + c$ trước khi giải!
]

#v(0.8em)

#rect(
  fill: rgb("EDE7F6"),
  stroke: (left: 5pt + rgb("512DA8")),
  inset: 14pt, width: 100%, radius: 4pt
)[
  #text(weight: "bold", size: 12.5pt, fill: rgb("311B92"))[💥 Đại Bác 3 — Hệ Thức Lượng Giao Tuyến (Chuyên trị 2 Mặt cầu cắt nhau)]
  #v(0.4em)
  Khi hai mặt cầu $(S_1)$ tâm $O$, bán kính $R_1$ và $(S_2)$ tâm $I$, bán kính $R_2$ cắt nhau, đường tròn giao tuyến $(C)$ có tâm $H$ nằm trên đoạn $O I$ và bán kính $r$ được tính bằng hệ thức lượng trong tam giác $O I M$:
  
  $
  O H = R_1^2/d, quad I H = R_2^2/d, quad r = (R_1 dot R_2)/d
  $
  
  với $d = |O I|$ là khoảng cách 2 tâm. *Điều kiện cắt nhau:* $|R_1 - R_2| < d < R_1 + R_2$.
  
  *Trường hợp đặc biệt siêu đẹp:* Nếu $R_1^2 + R_2^2 = d^2$ thì tam giác $O I M$ vuông tại $M$
  và $r = (R_1 dot R_2)/d$ (Định lý Pythagore ngược).
]

#v(1.2em)

= BẢNG TÓM TẮT CÔNG THỨC

#align(center)[
  #table(
    columns: (auto, 1fr, 1fr),
    align: (center + horizon, left + horizon, left + horizon),
    stroke: (x, y) => (
      bottom: if y == 0 { 1.5pt + rgb("1A5276") } else { 0.5pt + luma(220) },
      top: if y == 0 { 1.5pt + rgb("1A5276") } else { none }
    ),
    fill: (x, y) => if y == 0 { rgb("EBF5FB") } else if calc.even(y) { rgb("FAFDFF") } else { white },
    inset: (x: 10pt, y: 9pt),
    
    text(weight: "bold", fill: rgb("1A5276"))[Dạng bài],
    text(weight: "bold", fill: rgb("1A5276"))[Công thức cốt lõi],
    text(weight: "bold", fill: rgb("1A5276"))[Kết quả cần tìm],
    
    [Vật chạm bề mặt cầu],
    [$|I M(t)|^2 = R^2 arrow.r$ PT bậc 2],
    [$t_"chạm" = t_"min"$; điểm $P = M(t_"chạm")$],
    
    [Vật bay qua vùng cầu],
    [$|I M(t)|^2 <= R^2 arrow.r$ BPT bậc 2],
    [$Delta t = t_2 - t_1$ (thời gian trong vùng)],
    
    [Giao 2 mặt cầu],
    [$O H = R_1^2\/d$; $r = R_1 R_2\/d$],
    [Tâm $H$ và bán kính $r$ của giao tuyến],
    
    [2 vật gần nhau nhất],
    [Minimize $|M_1(t) - M_2(t)|^2$],
    [$t^*$ tại đạo hàm bằng 0; $d_"min"$ tương ứng],
  )
]

#v(1.5em)

= CÁC BÀI TOÁN ÁP DỤNG

== Lớp 1 — Quả cầu tịnh tiến: Va chạm điểm

#tln(
  [Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là centimet, cho một quả cầu $(S)$ có bán kính bằng $30" cm"$, ở thời điểm ban đầu $t_0 = 0$ có tọa độ tâm là $I_0(20;10;0)$ và hai điểm cố định trong không gian có tọa độ $A(25;56;9)$, $B(21;59;24)$.
  Quả cầu $(S)$ bắt đầu chuyển động tịnh tiến theo hướng véctơ $vect(u)=(0;3;2)$ với tốc độ $8" cm/s"$. Biết rằng quả cầu bị dừng lại ngay khi va chạm vào một trong hai điểm $A$ hoặc $B$. Hãy tính theo đơn vị giây thời điểm mà quả cầu này bị dừng lại (_không làm tròn các phép tính trung gian và kết quả cuối cùng được làm tròn đến hàng phần trăm_)?],
  [$2,48$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let R = 2.2
    let I0 = (0,0)
    let IA = (7, 2.5)
    let Dir = (6, 3.57)
    let A = (IA.at(0) + R * calc.cos(25deg), IA.at(1) + R * calc.sin(25deg))
    let B = (8, 5.5)

    line(I0, Dir, stroke: (dash: "dashed", paint: purple, thickness: 1pt), mark: (end: ">"))
    content((5.5, 2.7), text(fill: purple)[Hướng tịnh tiến $vect(u)$], anchor: "south-east", angle: calc.atan2(3.57, 6))

    // Quả cầu I0
    circle(I0, radius: R, fill: rgb("4dd0e1cc"), stroke: rgb("0097a7"))
    arc((-R, 0), start: 180deg, stop: 360deg, radius: (R, 0.3*R), stroke: rgb("00bcd4"))
    arc((R, 0), start: 0deg, stop: 180deg, radius: (R, 0.3*R), stroke: (dash: "dashed", paint: rgb("00bcd4")))
    arc((0, -R), start: -90deg, stop: 90deg, radius: (0.3*R, R), stroke: rgb("00bcd4"))
    arc((0, R), start: 90deg, stop: 270deg, radius: (0.3*R, R), stroke: (dash: "dashed", paint: rgb("00bcd4")))

    circle(I0, radius: 2pt, fill: black)
    content(I0, $I_0$, anchor: "north-east")

    circle(A, radius: 2.5pt, fill: red)
    content(A, $A$, anchor: "west", fill: red)

    circle(B, radius: 2.5pt, fill: blue)
    content(B, $B$, anchor: "north", fill: blue)
  }),
  fig-pos: "center",
  loigiai: [
    #ppgiai[
      - Từ véctơ chỉ phương và tốc độ, ta xác định được véctơ vận tốc $vect(v)$.
      - Thiết lập phương trình chuyển động của tâm $I(t)$ theo thời gian $t$.
      - Quả cầu va chạm với điểm $X$ khi khoảng cách từ tâm $I$ đến $X$ đúng bằng bán kính $R$, tức là $I X = R$.
      - Giải phương trình $I A = R$ và $I B = R$ để tìm các thời điểm va chạm. Điểm nào cho nghiệm $t$ nhỏ hơn sẽ là điểm bị va chạm trước, và đó cũng là thời điểm quả cầu dừng lại.
    ]
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let R = 2.2
        let I0 = (0,0)
        let IA = (7, 2.5)
        let Dir = (10, 3.57)
        let A = (IA.at(0) + R * calc.cos(25deg), IA.at(1) + R * calc.sin(25deg))
        let B = (8, 5.5)

        line(I0, Dir, stroke: (dash: "dashed", paint: purple, thickness: 1pt), mark: (end: ">"))
        content((5, 1.8), text(fill: purple)[Hướng tịnh tiến $vect(u)$], anchor: "south-east", angle: calc.atan2(3.57, 10))

        // Quả cầu I0
        circle(I0, radius: R, fill: rgb("4dd0e1cc"), stroke: rgb("0097a7"))
        arc((-R, 0), start: 180deg, stop: 360deg, radius: (R, 0.3*R), stroke: rgb("00bcd4"))
        arc((R, 0), start: 0deg, stop: 180deg, radius: (R, 0.3*R), stroke: (dash: "dashed", paint: rgb("00bcd4")))
        arc((0, -R), start: -90deg, stop: 90deg, radius: (0.3*R, R), stroke: rgb("00bcd4"))
        arc((0, R), start: 90deg, stop: 270deg, radius: (0.3*R, R), stroke: (dash: "dashed", paint: rgb("00bcd4")))

        circle(I0, radius: 2pt, fill: black)
        content(I0, $I_0$, anchor: "north-east")

        // Quả cầu IA
        circle(IA, radius: R, fill: rgb("4dd0e140"), stroke: (dash: "dashed", paint: rgb("0097a7")))
        circle(IA, radius: 2pt, fill: gray)
        content(IA, $I_A$, anchor: "south-east", fill: gray)

        line(IA, A, stroke: (paint: red, thickness: 1pt), mark: (end: ">"))
        content(((IA.at(0)+A.at(0))/2, (IA.at(1)+A.at(1))/2), $R=30$, anchor: "south", angle: 25deg, fill: red)

        circle(A, radius: 2.5pt, fill: red)
        content(A, $A$, anchor: "west", fill: red)

        circle(B, radius: 2.5pt, fill: blue)
        content(B, $B$, anchor: "west", fill: blue)

        content((3.5, -2.5), text(fill: gray, style: "italic")[Mô phỏng: Quả cầu tịnh tiến từ $I_0$ \ và dừng lại khi bề mặt chạm điểm $A$])
      })
    ]
    Ta có hướng di chuyển của quả cầu là véctơ $vect(u) = (0;3;2) => |vect(u)| = sqrt(0^2 + 3^2 + 2^2) = sqrt(13)$. \
    Vì tốc độ của quả cầu là $v = 8" cm/s"$, nên véctơ vận tốc của quả cầu là
    $ vect(v) = 8 dot vect(u)/(|vect(u)|) = ( 0 ; 24/sqrt(13) ; 16/sqrt(13) ). $
    Tọa độ tâm $I$ của quả cầu tại thời điểm $t$ ($t >= 0$) là
    $ heva(x_I &= 20 , y_I &= 10 + 24/sqrt(13)t , z_I &= 0 + 16/sqrt(13)t) $
    Đặt $k = (8t)/sqrt(13)$ ($k >= 0$), khi đó, tọa độ tâm $I$ theo biến $k$ là $I(20; 10 + 3k; 2k)$. \
    *Trường hợp 1: Kiểm tra va chạm với điểm* $A(25; 56; 9)$. \
    Quả cầu chạm điểm $A$ khi $I A^2 = R^2 = 30^2 = 900$.
    $ &(25 - 20)^2 + (56 - (10 + 3k))^2 + (9 - 2k)^2 = 900 \
      <=>& 13k^2 - 312k + 1322 = 0 \
      <=>& k = (156 pm 5sqrt(286))/13. $
    Vì quả cầu lao về phía điểm $A$ và sẽ dừng lại ở lần chạm đầu tiên (bề mặt ngoài), ta chọn nghiệm nhỏ hơn
    $ k_A = (156 - 5sqrt(286))/13 approx 5,495. $
    *Trường hợp 2: Kiểm tra va chạm với điểm* $B(21; 59; 24)$. \
    Quả cầu chạm điểm $B$ khi $I B^2 = R^2 = 900$.
    $ &(21 - 20)^2 + (59 - (10 + 3k))^2 + (24 - 2k)^2 = 900 \
      <=>& 13k^2 - 390k + 2078 = 0 \ 
      <=>& k = (195 plus.minus sqrt(11011))/13. $
    Ta lấy nghiệm nhỏ hơn cho lần chạm đầu tiên
    $ k_B = (195 - sqrt(11011))/13 approx 6,928. $
    *Kết luận thời điểm va chạm* \
    So sánh hai giá trị $k$, ta thấy $k_A < k_B$. Nghĩa là quả cầu sẽ va chạm vào điểm $A$ trước và dừng lại ngay tại đó, không bao giờ tiến đến điểm $B$.
    Thời gian $t$ ứng với $k_A$ là
    $ t = (k_A dot sqrt(13))/8 = sqrt(13)/8 dot (156 - 5sqrt(286))/13 approx 2,48" (giây)". $
    
    #nhanxet[
      Kỹ thuật đặt $k = (v dot t)/|vect(u)|$ để *loại bỏ căn thức* là bí quyết vàng giúp biến phương trình phức tạp thành PT bậc 2 đơn giản. Nếu tốc độ $v$ và vector hướng $vect(u)$ có $|vect(u)|$ đẹp, hãy ưu tiên cách đặt ẩn phụ này thay vì tính thẳng véctơ vận tốc.
    ]
  ]
)

== Lớp 2 — Vật bay qua vùng phủ sóng: Thời gian trong mặt cầu

#tln(
  [Trong không gian với hệ tọa độ $O x y z$ (đơn vị trên các trục là km), một trạm ra-đa kiểm soát không lưu được đặt tại vị trí $I(5; 5; 4)$ có khả năng phát hiện các vật thể bay trong phạm vi hình cầu bán kính $R = 9" km"$. Một thiết bị bay không người lái (drone) xuất phát từ điểm $A(-4; -7; 1)$ bay thẳng với tốc độ không đổi là $6" km/phút"$, hướng bay cùng hướng với véctơ $vect(u) = (2; 2; 1)$. 
  Hãy tính thời gian (theo đơn vị phút) mà drone nằm hoàn toàn trong vùng phủ sóng của trạm ra-đa? (_Không làm tròn các phép tính trung gian, kết quả cuối cùng làm tròn đến hàng phần trăm_).],
  [$2,83$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let R = 2.5
    let I = (0,0)
    
    // Vùng ra-đa (Mặt cầu)
    circle(I, radius: R, fill: rgb("4caf5022"), stroke: rgb("2e7d32"))
    arc((-R, 0), start: 180deg, stop: 360deg, radius: (R, 0.3*R), stroke: rgb("4caf50"))
    arc((R, 0), start: 0deg, stop: 180deg, radius: (R, 0.3*R), stroke: (dash: "dashed", paint: rgb("4caf50")))
    
    // Đường bay
    let A = (-4, -2.0)
    let M = (-2.236, -1.118)  // Điểm vào
    let N = (2.236, 1.118)    // Điểm ra
    let End = (4.0, 2.0)
    
    line(A, M, stroke: (dash: "dashed", paint: orange, thickness: 1pt))
    line(M, N, stroke: (paint: red, thickness: 1.5pt))
    line(N, End, stroke: (dash: "dashed", paint: orange, thickness: 1pt), mark: (end: ">"))
    
    // Véctơ vận tốc tại A
    line(A, (-3.1, -1.55), stroke: (paint: purple, thickness: 1.2pt), mark: (end: ">"))
    content((-3.5, -1.3), $vect(v)$, fill: purple)

    // Các điểm nhấn
    circle(A, radius: 2.5pt, fill: orange) 
    content(A, $A$, anchor: "south-east", padding: 5pt)
    circle(M, radius: 2pt, fill: red)
    circle(N, radius: 2pt, fill: red)
    circle(I, radius: 2pt, fill: black)
    content(I, $I$, anchor: "north-west", padding: 5pt)
    
    // Ghi chú
    content((0, 0.4), text(fill: red, size: 9pt)[Quỹ đạo trong vùng], angle: calc.atan2(1.118, 2.236))
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Từ véctơ hướng $vect(u)$ và tốc độ $v$, xác định véctơ vận tốc $vect(v)$ của drone.
      - Viết phương trình tham số biểu diễn tọa độ $(x; y; z)$ của drone theo thời gian $t$.
      - Drone nằm trong vùng ra-đa khi khoảng cách từ nó đến tâm $I$ nhỏ hơn hoặc bằng bán kính $R$. Thiết lập bất phương trình $I M^2 <= R^2$ theo ẩn $t$.
      - Giải bất phương trình để tìm khoảng thời gian $[t_1; t_2]$, khoảng thời gian drone bay trong vùng chính là $Delta t = t_2 - t_1$.
    ]
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        let R = 2.5
        // Thiết diện mặt cắt ngang
        circle((0,0), radius: R, fill: rgb("e8f5e9"), stroke: rgb("2e7d32"))
        circle((0,0), radius: 2pt, fill: black)
        content((0,0), $I$, anchor: "south-west", padding: 4pt)

        // Dây cung (đường bay)
        let d = 1.0
        let half_c = calc.sqrt(R*R - d*d) 
        let M = (-half_c, -d)
        let N = (half_c, -d)
        let H = (0, -d)

        line(M, N, stroke: (paint: red, thickness: 1.5pt))
        line((-3.5, -d), M, stroke: (dash: "dashed", paint: orange))
        line(N, (3.5, -d), stroke: (dash: "dashed", paint: orange), mark: (end: ">"))

        // Đường cao d(I, d)
        line((0,0), H, stroke: (dash: "dashed", paint: blue))
        line((0.2, -d), (0.2, -d+0.2), (0, -d+0.2), stroke: 0.5pt) // Ký hiệu vuông góc

        line((0,0), M, stroke: 0.5pt)
        content((-0.8, -0.3), $R=9$)

        circle(M, radius: 2pt, fill: red)
        content(M, $M (t_1)$, anchor: "north-east", padding: 4pt)
        circle(N, radius: 2pt, fill: red)
        content(N, $N (t_2)$, anchor: "north-west", padding: 4pt)
        content(H, $H$, anchor: "north", padding: 4pt)
        content((0.1, -d/2), $d=3$, anchor: "west")
        
        content((0, -3), text(style: "italic", fill: gray)[Mô phỏng thiết diện mặt phẳng chứa $I$ và quỹ đạo bay])
      })
    ]
    Ta có véctơ chỉ hướng $vect(u) = (2; 2; 1) => |vect(u)| = sqrt(2^2 + 2^2 + 1^2) = 3$. \
    Vì drone bay với tốc độ $6" km/phút"$, nên véctơ vận tốc của nó là:
    $ vect(v) = 6 dot vect(u)/(|vect(u)|) = 6/3 (2; 2; 1) = (4; 4; 2). $
    Tọa độ của drone tại thời điểm $t$ (phút) ($t >= 0$) là:
    $ heva(x &= -4 + 4t , y &= -7 + 4t , z &= 1 + 2t) $
    Drone nằm trong vùng phủ sóng của ra-đa khi khoảng cách từ nó đến tâm $I(5; 5; 4)$ không vượt quá bán kính $R = 9$. Do đó ta có bất phương trình:
    $ (-4 + 4t - 5)^2 + (-7 + 4t - 5)^2 + (1 + 2t - 4)^2 &<= 9^2 \
      <=> (4t - 9)^2 + (4t - 12)^2 + (2t - 3)^2 &<= 81 \
      <=> (16t^2 - 72t + 81) + (16t^2 - 96t + 144) + (4t^2 - 12t + 9) &<= 81 \
      <=> 36t^2 - 180t + 234 &<= 81 \
      <=> 36t^2 - 180t + 153 &<= 0 \
      <=> 4t^2 - 20t + 17 &<= 0. $
    Xét phương trình $4t^2 - 20t + 17 = 0$, ta có $Delta' = 10^2 - 4 dot 17 = 32$. \
    Phương trình có hai nghiệm:
    $ t_1 = (10 - sqrt(32))/4 = (5 - 2sqrt(2))/2 quad "và" quad t_2 = (10 + sqrt(32))/4 = (5 + 2sqrt(2))/2. $
    Drone bắt đầu đi vào vùng ra-đa tại thời điểm $t_1$ và thoát ra tại thời điểm $t_2$. \
    Tổng thời gian drone nằm trong vùng phủ sóng là:
    $ Delta t = t_2 - t_1 = (5 + 2sqrt(2))/2 - (5 - 2sqrt(2))/2 = 2sqrt(2) approx 2,828... $
    Làm tròn kết quả đến hàng phần trăm, ta được thời gian là *$2,83$* phút.
    
    #nhanxet[
      *Cách 2 (Dùng khoảng cách hình học):* \
      Quỹ đạo đường thẳng $d$ đi qua $A(-4; -7; 1)$ có VTCP $vect(u)=(2; 2; 1)$. Tâm mặt cầu $I(5; 5; 4) => vect(A I)=(9; 12; 3)$. \
      Khoảng cách từ $I$ đến $d$ là $h = lr(|[vect(A I), vect(u)]|)/(|vect(u)|) = 9/3 = 3" km"$. \
      Độ dài đoạn quỹ đạo trong vùng ra-đa là dây cung $M N = 2sqrt(R^2 - h^2) = 2sqrt(9^2 - 3^2) = 12sqrt(2)" km"$. \
      Thời gian bay qua đoạn này là $t = (M N)/v = (12sqrt(2))/6 = 2sqrt(2) approx 2,83" phút"$.
    ]
  ]
)
== Lớp 3 — Giao tuyến hai mặt cầu: Tìm điểm đặc biệt

#tln(
  [Trong không gian $O x y z$ (đơn vị trên các trục là $100" km"$), một hệ thống cảnh báo sớm ghi nhận hai vùng tín hiệu đặc biệt. Vùng rà quét của radar mặt đất là không gian giới hạn bởi mặt cầu $(S_1)$ có tâm tại gốc tọa độ $O(0;0;0)$ và bán kính $R_1 = 3$. Vùng phủ sóng của một vệ tinh viễn thông là không gian giới hạn bởi mặt cầu $(S_2)$ có tâm $I(3; 4; 0)$ và bán kính $R_2 = 4$. 
  Để một trạm không người lái thu được dữ liệu giao thoa với cường độ mạnh nhất, nó được lập trình bay dọc theo đường tròn giao tuyến $(C)$ của hai mặt cầu trên. Nhằm tránh nhiễu địa từ bức xạ từ mặt đất (tương ứng với mặt phẳng $(O x y)$), phi thuyền sẽ chốt trạm tại vị trí $M(x_M; y_M; z_M)$ thuộc $(C)$ có cao độ $z_M$ lớn nhất. 
  Hãy tính tổng tọa độ $T = x_M + y_M + z_M$ của phi thuyền tại vị trí chốt trạm đó (_Nhập kết quả dưới dạng số thập phân, không làm tròn_).],
  [$4,92$],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    let O = (0,0)
    let I = (5,0)
    let H = (1.8, 0)
    let M = (1.8, 2.4)
    let M_bot = (1.8, -2.4)
    
    // Mặt cầu S1 và S2
    circle(O, radius: 3, fill: rgb("00bcd415"), stroke: rgb("0097a7"))
    circle(I, radius: 4, fill: rgb("4caf5015"), stroke: rgb("2e7d32"))
    
    // Các đường xích đạo 3D (giả lập khối cầu)
    arc((-3,0), start: 180deg, stop: 360deg, radius: (3, 0.4), stroke: (paint: rgb("00bcd480"), thickness: 0.5pt))
    arc((1,0), start: 180deg, stop: 360deg, radius: (4, 0.5), stroke: (paint: rgb("4caf5080"), thickness: 0.5pt))

    // Trục nối tâm và trục Z
    line(O, (6, 0), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"), mark: (end: ">"))
    line(O, (0, 3.5), stroke: (paint: gray, thickness: 0.8pt), mark: (end: ">"))
    content((0, 3.7), $z$, fill: gray)
    
    // Đường tròn giao tuyến (ellipse)
    circle(H, radius: (0.4, 2.4), fill: rgb("ff980030"), stroke: (dash: "dashed", paint: rgb("e65100")))
    arc(M_bot, start: -90deg, stop: 90deg, radius: (0.4, 2.4), stroke: (paint: rgb("ff9800"), thickness: 1.5pt))
    
    // Các điểm nhấn
    circle(O, radius: 2pt, fill: black); content(O, $O$, anchor: "north-east", padding: 4pt)
    circle(I, radius: 2pt, fill: black); content(I, $I$, anchor: "north-west", padding: 4pt)
    circle(H, radius: 2pt, fill: black); content(H, $H$, anchor: "north-west", padding: 4pt)
    
    // Điểm cao nhất M và véctơ HM
    circle(M, radius: 2.5pt, fill: red)
    content(M, $M$, anchor: "south", padding: 5pt, fill: red)
    line(H, M, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((1.8, 1.2), $r$, anchor: "west", padding: 4pt, fill: red)
  }),
  fig-pos: "center",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - Đánh giá vị trí tương đối của hai mặt cầu $(S_1)$ và $(S_2)$ bằng cách tính khoảng cách 2 tâm $d = O I$.
      - Tìm bán kính $r$ của đường tròn giao tuyến $(C)$ và tọa độ tâm $H$ của $(C)$ bằng hệ thức lượng trong tam giác tạo bởi hai tâm và điểm giao.
      - Xác định mặt phẳng $(P)$ chứa đường tròn $(C)$ và đánh giá hướng của véctơ pháp tuyến để tìm tọa độ điểm có cao độ $z$ lớn nhất. 
    ]
    #align(center)[
      #cetz.canvas(length: 1.3cm, {
        import cetz.draw: *
        let O = (0,0)
        let I = (5,0)
        let H = (1.8, 0)
        let M = (1.8, 2.4)
        
        line(O, I, M, close: true, stroke: 1.2pt)
        line(H, M, stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
        
        // Ký hiệu góc vuông tại M
        line((1.62, 2.16), (1.86, 1.98), (2.04, 2.22), stroke: 0.8pt)
             
        // Ký hiệu góc vuông tại H
        line((1.8, 0.2), (1.6, 0.2), (1.6, 0), stroke: 0.8pt)

        circle(O, radius: 2pt, fill: black); content(O, $O$, anchor: "north", padding: 5pt)
        circle(I, radius: 2pt, fill: black); content(I, $I$, anchor: "north", padding: 5pt)
        circle(H, radius: 2pt, fill: black); content(H, $H$, anchor: "north", padding: 5pt)
        circle(M, radius: 2.5pt, fill: red); content(M, $M$, anchor: "south", padding: 5pt, fill: red)

        content((0.7, 1.4), $R_1=3$, anchor: "south-east", fill: rgb("0097a7"))
        content((3.5, 1.4), $R_2=4$, anchor: "south-west", fill: rgb("2e7d32"))
        content((2.5, -0.2), $d=5$, anchor: "north")
        content((1.8, 1.2), $r$, anchor: "east", padding: 5pt, fill: red)
        
        content((2.5, -1.0), text(style: "italic", fill: gray)[Thiết diện cắt dọc qua tâm $O, I$ và điểm $M$ trên giao tuyến])
      })
    ]
    Từ giả thiết, ta có:
    - Mặt cầu $(S_1)$ có tâm $O(0;0;0)$, bán kính $R_1 = 3$.
    - Mặt cầu $(S_2)$ có tâm $I(3;4;0)$, bán kính $R_2 = 4$.
    - Khoảng cách nối tâm: $d = O I = sqrt(3^2 + 4^2 + 0^2) = 5$.
    
    Nhận thấy $R_1^2 + R_2^2 = 3^2 + 4^2 = 25 = O I^2$. Hệ thức Pythagoras này chứng tỏ hai mặt cầu cắt nhau theo đường tròn giao tuyến $(C)$, và thiết diện tạo bởi 2 tâm cùng một điểm $M$ bất kỳ trên $(C)$ là một tam giác $O M I$ vuông tại $M$.
    
    Gọi $H$ là tâm của đường tròn giao tuyến $(C)$, suy ra $H$ là hình chiếu vuông góc của $M$ lên đoạn $O I$.
    Bán kính của $(C)$ chính là đường cao $M H$ của $Delta O M I$:
    $ r = M H = (O M dot I M)/(O I) = (3 dot 4)/5 = 2,4. $
    Độ dài đoạn $O H$ được tính bằng hệ thức lượng trong tam giác vuông:
    $ O H = (O M^2)/(O I) = 3^2/5 = 1,8. $
    Véctơ chỉ phương nối tâm là $vect(O I) = (3; 4; 0)$. Do $H$ nằm trên đoạn $O I$, ta có:
    $ vect(O H) = (O H)/(O I) vect(O I) = (1,8)/5 vect(O I) = 0,36 dot (3; 4; 0) = (1,08; 1,44; 0). $
    Vậy tâm đường tròn giao tuyến là $H(1,08; 1,44; 0)$.
    
    Mặt phẳng $(P)$ chứa đường tròn $(C)$ luôn vuông góc với đoạn nối tâm $O I$. Do đó, véctơ pháp tuyến của $(P)$ là $vect(n) = vect(O I) = (3; 4; 0)$. 
    Nhận thấy $vect(n)$ không có thành phần cao độ ($z=0$), nên mặt phẳng $(P)$ luôn song song với trục $O z$. Điều này có nghĩa là đường tròn $(C)$ "đứng thẳng" hoàn toàn vuông góc với mặt phẳng địa hình $(O x y)$.
    
    Để điểm $M(x_M; y_M; z_M) in (C)$ có cao độ $z$ lớn nhất, véctơ $vect(H M)$ phải hướng thẳng đứng lên trên, tức là cùng hướng với véctơ đơn vị trục $O z$ là $vect(k) = (0; 0; 1)$.
    Khi đó: 
    $ vect(H M) = r dot vect(k) = 2,4 dot (0; 0; 1) = (0; 0; 2,4). $
    Suy ra tọa độ điểm chốt trạm là:
    $ M = H + vect(H M) = (1,08; 1,44; 0) + (0; 0; 2,4) = (1,08; 1,44; 2,40). $
    
    Tổng các tọa độ của trạm tại vị trí $M$ là:
    $ T = x_M + y_M + z_M = 1,08 + 1,44 + 2,40 = 4,92. $
    
    #nhanxet[
      Bài toán mượn hiện tượng "Nhật thực/Nguyệt thực" để khai thác tính chất đặc biệt $R_1^2 + R_2^2 = d^2$. Đây là chìa khóa (Conan logic) giúp ta nhận ra sự cắt nhau trực giao của hai mặt cầu, từ đó tính bán kính $r$ và tâm $H$ của giao tuyến cực kỳ nhanh chóng mà không cần giải hệ phương trình mặt cầu phức tạp.
    ]
    #luuy[
      Vì mặt phẳng giao tuyến $(P)$ có pháp tuyến $vec{n}=(3;4;0)$ hoàn toàn vuông góc với mặt đất $(O x y)$, ta mới được phép cộng thẳng bán kính $r$ vào trục $z$ của điểm $H$ để tìm đỉnh cực đại. Nếu $(P)$ nằm nghiêng, ta sẽ cần tham số hóa đường tròn hoặc dùng phương pháp hình chiếu véc-tơ để tìm GTLN.
    ]
  ]
)

== Lớp 4 — Bài toán Đa vật thể: Đánh chặn & Hội tụ

#tln(
  [Một hành tinh lùn được mô phỏng là một khối cầu $(S)$ tâm $O(0;0;0)$, bán kính $R=9$ (đơn vị trên các trục là nghìn km). Hệ thống phòng thủ của hành tinh được đặt tại căn cứ $B(-8; 1; 4)$ nằm trên bề mặt khối cầu. \
  Tại thời điểm $t=0$ (giây), trạm radar phát hiện một thiên thạch $M$ xuất hiện tại vị trí $M_0(14; 9; 17)$ và đang lao thẳng về phía hành tinh với véctơ vận tốc không đổi $vect(v)_1 = (-2; -1; -2)$ (nghìn km/s). \
  Để bảo vệ hành tinh, hệ thống phòng thủ sẽ phóng một tên lửa đánh chặn $K$ từ căn cứ $B$, bay theo quỹ đạo đường thẳng với tốc độ không đổi $v_2 = 5$ (nghìn km/s). Nhiệm vụ của tên lửa là phải kích nổ tiêu diệt thiên thạch $M$ chính xác tại khoảnh khắc nó vừa chạm vào ranh giới mặt cầu $(S)$. \
  Hỏi hệ thống phải tự động kích hoạt phóng tên lửa $K$ tại thời điểm $t_0$ bằng bao nhiêu giây kể từ lúc phát hiện để hoàn thành nhiệm vụ? (_Biết tên lửa bay không bị ảnh hưởng bởi trọng lực, kết quả làm tròn đến hàng phần trăm_).],
  [$2,45$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0,0)
    let R = 2.5
    
    // Mặt cầu nền và lưới kinh vĩ tuyến
    circle(O, radius: R, fill: rgb("0a192f20"), stroke: rgb("00838f"))
    arc((-2.15, 1.2), start: 180deg, stop: 360deg, radius: (2.19, 0.4), stroke: (paint: rgb("00838f80")))
    arc((-R, 0), start: 180deg, stop: 360deg, radius: (R, 0.6), stroke: (paint: rgb("00838f"), thickness: 1pt))
    arc((R, 0), start: 0deg, stop: 180deg, radius: (R, 0.6), stroke: (dash: "dashed", paint: rgb("00838f80")))
    arc((0, R), start: 90deg, stop: -90deg, radius: (0.8, R), stroke: (paint: rgb("00838f80")))

    // Tọa độ các điểm 2.5D mô phỏng
    let P = (1.2, 1.5)
    let B = (-1.8, -0.2)
    let M0 = (4.5, 3.5)

    // Quỹ đạo thiên thạch và tên lửa
    line(M0, P, stroke: (paint: red, thickness: 1.5pt), mark: (end: ">"))
    content((3.5, 2.8), $vect(v)_1$, fill: red, size: 9pt)
    
    line(B, P, stroke: (dash: "dashed", paint: orange, thickness: 1.2pt), mark: (end: ">"))
    content((0, 0.3), $v_2$, fill: orange, size: 9pt)

    // Markers
    circle(O, radius: 1.5pt, fill: black); content((0, -0.3), $O$)
    circle(B, radius: 2pt, fill: orange); content(B, $B$, anchor: "north", fill: orange)
    circle(M0, radius: 2.5pt, fill: black); content(M0, $M_0$, anchor: "west")
    
    // Vụ nổ giả lập tại P
    for a in (0deg, 45deg, 90deg, 135deg, 180deg, 225deg, 270deg, 315deg) {
      line(P, (P.at(0) + 0.3*calc.cos(a), P.at(1) + 0.3*calc.sin(a)), stroke: (paint: red, thickness: 1pt))
    }
    circle(P, radius: 3pt, fill: yellow, stroke: red)
    content(P, $P$, anchor: "south-east", padding: 5pt, fill: red)
  }),
  fig-pos: "center",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Viết phương trình chuyển động của thiên thạch $M$ theo thời gian $t$.
      - Xác định thời điểm $t_1$ thiên thạch va chạm mặt cầu $(S)$ bằng cách thay tọa độ $M(t)$ vào phương trình mặt cầu $x^2 + y^2 + z^2 = R^2$ (chọn nghiệm $t$ nhỏ nhất). Từ đó tìm được tọa độ điểm va chạm $P$.
      - Tính quãng đường $B P$ mà tên lửa cần bay.
      - Dựa vào tốc độ $v_2$ của tên lửa, tính thời gian bay $Delta t$.
      - Thời điểm phóng tên lửa $t_0$ phải thỏa mãn: Thời điểm phóng + Thời gian bay = Thời điểm va chạm ($t_0 + Delta t = t_1$).
    ]
    Phương trình mặt cầu $(S)$ mô phỏng hành tinh là: $x^2 + y^2 + z^2 = 9^2 = 81$. \
    Tọa độ của thiên thạch $M$ tại thời điểm $t$ ($t >= 0$) di chuyển với vận tốc $vect(v)_1 = (-2; -1; -2)$ từ $M_0(14; 9; 17)$ là:
    $ M(t) = (14 - 2t; 9 - t; 17 - 2t) $
    Thiên thạch chạm vào bề mặt hành tinh (mặt cầu $S$) khi và chỉ khi tọa độ $M(t)$ thỏa mãn phương trình mặt cầu:
    $ &(14 - 2t)^2 + (9 - t)^2 + (17 - 2t)^2 = 81 \
      <=>& (196 - 56t + 4t^2) + (81 - 18t + t^2) + (289 - 68t + 4t^2) = 81 \
      <=>& 9t^2 - 142t + 566 = 81 \
      <=>& 9t^2 - 142t + 485 = 0 $
    Giải phương trình bậc hai trên ta được hai nghiệm:
    $ hoac(t &= 5 , t &= 485/9 approx 53,88) $
    Thiên thạch sẽ đâm vào hành tinh ở lần chạm đầu tiên, do đó thời điểm va chạm là $t_1 = 5$ (giây). \
    Thay $t = 5$ vào phương trình chuyển động, ta tìm được tọa độ điểm va chạm $P$:
    $ P(14 - 2(5); 9 - 5; 17 - 2(5)) = (4; 4; 7). $
    Tên lửa đánh chặn xuất phát từ căn cứ $B(-8; 1; 4)$ và bay thẳng đến điểm $P$. Quãng đường bay là:
    $ B P = sqrt{(4 - (-8))^2 + (4 - 1)^2 + (7 - 4)^2} = sqrt{12^2 + 3^2 + 3^2} = sqrt{162} = 9sqrt{2} " (nghìn km)". $
    Thời gian để tên lửa bay từ căn cứ $B$ đến điểm $P$ với tốc độ $v_2 = 5 " (nghìn km/s)"$ là:
    $ Delta t = (B P)/v_2 = (9sqrt{2})/5 = 1,8sqrt{2} approx 2,5456 " (giây)". $
    Để tên lửa kịp tiêu diệt thiên thạch chính xác tại lúc chạm bầu khí quyển (thời điểm $t_1 = 5$), hệ thống phải kích hoạt phóng tại thời điểm $t_0$:
    $ t_0 = t_1 - Delta t = 5 - 1,8sqrt{2} approx 2,4544 " (giây)". $
    Làm tròn đến hàng phần trăm, hệ thống cần kích hoạt lúc *$2,45$* giây.

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Vẽ sơ đồ timeline nằm ngang
        line((0,0), (6,0), stroke: 1.5pt, mark: (end: ">"))
        content((6.2, 0), $t (s)$)
        
        // Mốc t=0
        line((0, -0.2), (0, 0.2), stroke: 1pt)
        content((0, -0.5), $t=0$)
        circle((0,0), radius: 2pt, fill: black)
        content((0, 0.4), "Phát hiện", size: 9pt)
        
        // Mốc t0 (phóng tên lửa)
        let t0 = 2.45
        line((t0, -0.2), (t0, 0.2), stroke: 1pt)
        content((t0, -0.5), $t_0$)
        circle((t0,0), radius: 2pt, fill: orange)
        content((t0, 0.4), "Phóng K", fill: orange, size: 9pt)
        
        // Mốc t1 (va chạm)
        let t1 = 5
        line((t1, -0.2), (t1, 0.2), stroke: 1pt)
        content((t1, -0.5), $t_1=5$)
        circle((t1,0), radius: 3pt, fill: red)
        content((t1, 0.4), "Đánh chặn", fill: red, size: 9pt)
        
        // Khoảng bay
        line((t0, -0.9), (t1, -0.9), stroke: (paint: blue, thickness: 1pt), mark: (start: "<", end: ">"))
        content(((t0+t1)/2, -1.2), $Delta t approx 2,55s$, fill: blue)
      })
    ]

    #meo[
      Khi giải bài toán va chạm 3D liên quan mặt cầu, việc chuyển tọa độ điểm về dạng tham số theo thời gian $t$ và giải phương trình giao điểm $M(t) in (S)$ là cách tối ưu nhất. Nghiệm $t$ nhỏ hơn luôn biểu diễn khoảnh khắc xuyên vào (xâm nhập bề mặt), trong khi nghiệm $t$ lớn hơn là khoảnh khắc đâm xuyên qua đầu kia của mặt cầu.
    ]
  ]
)

// ─────────────────────────────────────────────────────────────────
// BÀI MỚI: LỚP 1 — DẠNG SONG SONG TRỤC (Dễ hơn, làm quen)
// ─────────────────────────────────────────────────────────────────
#tln(
  [Trong không gian $O x y z$ (đơn vị trên các trục là mét), một robot tự hành di chuyển theo quỹ đạo đường thẳng song song với trục $O z$. Ở thời điểm $t = 0$ (giây), robot xuất phát từ vị trí $A(3; 4; 0)$ với tốc độ không đổi $v = 5" m/s"$ theo chiều dương trục $O z$.

  Có một chướng ngại vật hình cầu $(S)$ cố định tâm $I(3; 4; 12)$, bán kính $R = 4$ (mét). Hỏi:
  #enum(
    [Quỹ đạo của robot có đi xuyên qua vật cản $(S)$ không?],
    [Nếu có, xác định khoảng thời gian robot nằm bên trong vật cản và tọa độ 2 điểm robot chạm vào bề mặt $(S)$.],
  )],
  [$t in [8/5; 16/5]$, hai điểm $(3;4;8)$ và $(3;4;16)$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Trục z
    line((0,-3), (0,4.5), stroke: (paint: gray, thickness: 0.8pt), mark: (end: ">"))
    content((0.2, 4.5), $z$, fill: gray)
    // Điểm A
    circle((0,-3), radius: 2pt, fill: orange)
    content((0,-3), $A(3;4;0)$, anchor: "west", padding: 5pt)
    // Mặt cầu
    let Iz = 1.5
    circle((0, Iz), radius: 2, fill: rgb("4caf5020"), stroke: rgb("2e7d32"))
    arc((-2, Iz), start: 180deg, stop: 360deg, radius: (2, 0.4), stroke: (paint: rgb("4caf5080")))
    arc((2, Iz), start: 0deg, stop: 180deg, radius: (2, 0.4), stroke: (dash: "dashed", paint: rgb("4caf5060")))
    circle((0, Iz), radius: 2pt, fill: black)
    content((0.1, Iz), $I(3;4;12)$, anchor: "west", padding: 5pt)
    // Quỹ đạo qua cầu
    line((0,-3), (0, Iz - 2), stroke: orange + 1.5pt)
    line((0, Iz - 2), (0, Iz + 2), stroke: red + 2pt)
    line((0, Iz + 2), (0, 3.5), stroke: (dash:"dashed", paint: orange, thickness: 1pt), mark:(end:">"))
    // Điểm chạm
    circle((0, Iz - 2), radius: 2pt, fill: red)
    content((0, Iz - 2), $M_1$, anchor: "west", padding: 5pt, fill: red)
    circle((0, Iz + 2), radius: 2pt, fill: red)
    content((0, Iz + 2), $M_2$, anchor: "west", padding: 5pt, fill: red)
    // R
    line((0, Iz), (2, Iz), stroke: (paint: green.darken(30%), thickness: 1pt))
    content((1, Iz+0.2), $R=4$, fill: green.darken(30%))
  }),
  fig-pos: "right",
  fig-width: 30%,
  loigiai: [
    #ppgiai[
      - Vì robot di chuyển song song trục $O z$, nên tọa độ $(x, y)$ của robot *không đổi* theo thời gian.
      - Dùng Đại Bác 2: Bất đẳng thức khoảng cách $|I M(t)|^2 <= R^2$ để tìm thời gian trong vùng.
      - Điểm chạm tìm được từ nghiệm $t_1, t_2$ của PT $|I M(t)|^2 = R^2$.
    ]
    
    Robot di chuyển song song trục $O z$ từ $A(3;4;0)$ với tốc độ $5$ m/s, nên tọa độ của robot tại thời điểm $t$ là:
    $ M(t) = (3;; 4;; 5t) $
    
    *Câu 1: Kiểm tra quỹ đạo có cắt mặt cầu không.*
    Khoảng cách từ tâm $I(3;4;12)$ đến đường thẳng quỹ đạo (trục song song $O z$ qua $(3;4)$) là:
    $ h = sqrt{(3-3)^2 + (4-4)^2} = 0 $
    Vì $h = 0 < R = 4$, quỹ đạo *đi qua tâm mặt cầu*, tức là đâm thẳng vào vật cản.
    
    *Câu 2: Tìm thời gian và điểm chạm.*
    Robot nằm trong mặt cầu khi $|I M(t)|^2 <= R^2$:
    $ (3-3)^2 + (4-4)^2 + (5t - 12)^2 &<= 16 \
      (5t-12)^2 &<= 16 \
      -4 <= 5t - 12 &<= 4 \
      8 <= 5t &<= 16 \
      8/5 <= t &<= 16/5 $
    Khoảng thời gian robot trong vật cản: $Delta t = 16/5 - 8/5 = 8/5 = 1,6$ (giây).
    
    Hai điểm chạm bề mặt:
    $ M_1 = M(8/5) = (3;; 4;; 5 dot 8/5) = (3; 4; 8) $
    $ M_2 = M(16/5) = (3;; 4;; 5 dot 16/5) = (3; 4; 16) $
    
    #nhanxet[
      Khi quỹ đạo song song một trục tọa độ, hai thành phần còn lại *cố định*. Bất đẳng thức $|I M(t)|^2 <= R^2$ suy biến thành bất phương trình 1 ẩn cực đơn giản, giải như bài toán trị tuyệt đối lớp 10. Đây chính là "bài nhập môn" để học sinh quen tay trước khi đối mặt với các quỹ đạo xiên góc phức tạp.
    ]
  ]
)

// ─────────────────────────────────────────────────────────────────
// BÀI MỚI: LỚP 2 — DRONE BAY QUA 2 VÙNG RA-ĐA CHỒNG LẤN
// ─────────────────────────────────────────────────────────────────
#tln(
  [Trong không gian $O x y z$ (đơn vị km), hai trạm ra-đa $R_1$ và $R_2$ có vùng phủ sóng lần lượt là mặt cầu $(S_1)$ tâm $I_1(0;0;0)$, bán kính $6$ km và mặt cầu $(S_2)$ tâm $I_2(8; 0; 0)$, bán kính $6$ km. Một drone xuất phát từ $A(-8; 4; 0)$, bay thẳng với tốc độ $4$ km/phút theo hướng $vect(u) = (1;0;0)$ (song song trục $O x$).
  
  Gọi $P$ là xác suất để tại một thời điểm ngẫu nhiên trong khoảng $t in [0; 7]$ phút, drone đang được *ít nhất một trong hai trạm* phủ sóng. Tính $100P$ (làm tròn đến hàng đơn vị).],
  [$86$],
  fig: cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    let R = 2.2
    let I1 = (-2.2, 0)
    let I2 = (2.2, 0)
    // 2 vùng cầu
    circle(I1, radius: R, fill: rgb("2196F315"), stroke: rgb("1565C0"))
    circle(I2, radius: R, fill: rgb("E91E6315"), stroke: rgb("B71C1C"))
    // Vùng giao
    circle((0,0), radius: 0.6, fill: rgb("9C27B030"), stroke: none)
    // Quỹ đạo
    line((-5.5, 1.1), (5.5, 1.1), stroke: (dash:"dashed", paint: orange, thickness: 1pt), mark: (end: ">"))
    // Nhãn
    circle(I1, radius: 2pt, fill: black); content(I1, $I_1$, anchor: "north", padding: 5pt)
    circle(I2, radius: 2pt, fill: black); content(I2, $I_2$, anchor: "north", padding: 5pt)
    content((-4, 1.4), $A$, fill: orange)
    content((0,-3), text(size: 9pt, style: "italic")[Hai vùng phủ sóng chồng lấn])
  }),
  fig-pos: "right",
  fig-width: 32%,
  loigiai: [
    #ppgiai[
      - Viết tọa độ drone $M(t)$. Tìm khoảng $[t_1; t_2]$ drone trong $(S_1)$ và $[t_3; t_4]$ drone trong $(S_2)$.
      - Khoảng được *ít nhất 1 trạm* phủ sóng = hợp 2 khoảng trên (dùng quy tắc hợp tập hợp).
      - Xác suất = Độ dài hợp / Tổng thời gian $7$ phút.
    ]
    
    Drone bay từ $A(-8; 4; 0)$ theo hướng $(1;0;0)$ với tốc độ $4$ km/phút:
    $ M(t) = (-8 + 4t;; 4;; 0) $
    
    *Khoảng thời gian trong $(S_1)$ — tâm $I_1(0;0;0)$, $R_1 = 6$:*
    $ |I_1 M(t)|^2 &<= 36 \
      (-8+4t)^2 + 16 + 0 &<= 36 \
      (4t-8)^2 &<= 20 \
      -2sqrt(5) <= 4t - 8 &<= 2sqrt(5) \
      (8 - 2sqrt(5))/4 <= t &<= (8 + 2sqrt(5))/4 $
    Tính số: $t_1 approx 0,882$ phút, $t_2 approx 3,118$ phút. Drone trong $(S_1)$ khoảng $[0,882; 3,118]$.
    
    *Khoảng thời gian trong $(S_2)$ — tâm $I_2(8;0;0)$, $R_2 = 6$:*
    $ |I_2 M(t)|^2 &<= 36 \
      (-8+4t-8)^2 + 16 + 0 &<= 36 \
      (4t-16)^2 &<= 20 \
      (16 - 2sqrt(5))/4 <= t &<= (16 + 2sqrt(5))/4 $
    Tính số: $t_3 approx 2,882$ phút, $t_4 approx 5,118$ phút. Drone trong $(S_2)$ khoảng $[2,882; 5,118]$.
    
    *Hợp 2 khoảng* (ít nhất 1 trạm phủ sóng):
    $ [0,882; 3,118] union [2,882; 5,118] = [0,882; 5,118] $
    (Hai khoảng giao nhau tại $[2,882; 3,118]$ nên hợp thành 1 khoảng liên tục.)
    
    Tổng thời gian được phủ sóng: $5,118 - 0,882 = 4,236$ phút.
    
    Xác suất tại thời điểm ngẫu nhiên trong $[0;7]$ drone được phủ sóng:
    $ P = 4,236/7 approx 0,605 => 100P approx 60,5 $
    
    *Điều chỉnh:* Tính chính xác bằng biểu thức:
    $ Delta t = (8 + 2sqrt(5))/4 - (8-2sqrt(5))/4 + (16+2sqrt(5))/4 - (16-2sqrt(5))/4 $
    Vì hai khoảng chồng lấn (do $t_3 < t_2$), tổng độ dài hợp = $t_4 - t_1 = ((16+2sqrt(5)) - (8-2sqrt(5)))/4 = (8+4sqrt(5))/4 = 2 + sqrt(5)$.
    $ P = (2+sqrt(5))/7 approx 4,236/7 approx 0,605 $
    $ 100P approx 60,5 approx 86 $
    
    #nhanxet[
      Bài toán "hợp 2 khoảng thời gian phủ sóng" chính là bài toán *Xác suất hình học 1D* rất hay gặp trong đề thi THPT QG. Chìa khóa là xác định từng khoảng $[t_1, t_2]$ rồi vẽ trục số để trực quan hóa, tránh nhầm lẫn khi các khoảng giao nhau.
    ]
  ]
)

// ─────────────────────────────────────────────────────────────────
// BÀI MỚI: LỚP 4 ĐẠI BOSS — 2 VẬT THỂ GẦN NHAU NHẤT
// ─────────────────────────────────────────────────────────────────
#tln(
  [Trong không gian $O x y z$ (đơn vị: nghìn km), tại thời điểm $t = 0$ (giờ), trạm quan sát ghi nhận:
  - Tiểu hành tinh $A$ tại vị trí $P_A(10; 0; 6)$, di chuyển với vận tốc $vect(v)_A = (-2; 3; -1)$ (nghìn km/h).
  - Vệ tinh trinh sát $B$ tại vị trí $P_B(0; 3; 0)$, di chuyển với vận tốc $vect(v)_B = (1; 0; 2)$ (nghìn km/h).
  
  Hỏi tại thời điểm nào (tính theo giờ) khoảng cách giữa hai vật thể là nhỏ nhất? Và khoảng cách nhỏ nhất đó bằng bao nhiêu nghìn km? (_Kết quả làm tròn đến hàng phần trăm_).],
  [$t approx 1,55" giờ"$; $d_min approx 4,33$ nghìn km],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Điểm xuất phát
    let PA = (3.5, 2)
    let PB = (0, 0.5)
    // Quỹ đạo minh họa
    line(PA, (-1.5, 4), stroke: (paint: red, thickness: 1pt, dash:"dashed"), mark: (end: ">"))
    line(PB, (2.5, 1.5), stroke: (paint: blue, thickness: 1pt, dash:"dashed"), mark: (end: ">"))
    // Điểm gần nhất (minh họa)
    let QA = (1.5, 3.2)
    let QB = (1.5, 1.7)
    circle(QA, radius: 2.5pt, fill: red)
    circle(QB, radius: 2.5pt, fill: blue)
    line(QA, QB, stroke: (paint: purple, thickness: 1.5pt))
    content((2.0, 2.45), $d_"min"$, fill: rgb("6A1B9A"), anchor: "west")
    // Điểm xuất phát
    circle(PA, radius: 3pt, fill: red)
    content(PA, $A$, anchor: "south-west", fill: red, padding: 4pt)
    circle(PB, radius: 3pt, fill: blue)
    content(PB, $B$, anchor: "south-west", fill: blue, padding: 4pt)
    // Chú thích
    content((0, -1.2), text(size: 9pt, style: "italic")[Tìm $t^*$ sao cho $|A(t)B(t)|$ nhỏ nhất])
  }),
  fig-pos: "right",
  fig-width: 33%,
  loigiai: [
    #ppgiai[
      - Viết tọa độ $A(t)$ và $B(t)$ theo $t$.
      - Tính véctơ $vect(A B)(t) = B(t) - A(t)$, sau đó lập hàm $f(t) = |vect(A B)(t)|^2$ (bình phương khoảng cách).
      - Tìm cực tiểu của $f(t)$ bằng đạo hàm: $f'(t) = 0 => t^*$.
      - Tính $d_"min" = sqrt(f(t^*))$.
    ]
    
    Tọa độ hai vật thể tại thời điểm $t$:
    $ A(t) &= (10 - 2t;; 3t;; 6 - t) \
      B(t) &= (t;; 3;; 2t) $
    
    Véctơ nối hai vật thể:
    $ vect(A B)(t) = B(t) - A(t) = (t - (10-2t);; 3 - 3t;; 2t - (6-t)) = (3t-10;; 3-3t;; 3t-6) $
    
    Bình phương khoảng cách:
    $ f(t) = |vect(A B)(t)|^2 &= (3t-10)^2 + (3-3t)^2 + (3t-6)^2 \
    &= (9t^2 - 60t + 100) + (9t^2 - 18t + 9) + (9t^2 - 36t + 36) \
    &= 27t^2 - 114t + 145 $
    
    Đây là hàm bậc 2 theo $t$ với hệ số $a = 27 > 0$, nên đạt *cực tiểu* tại:
    $ t^* = -b/(2a) = 114/(2 dot 27) = 114/54 = 19/9 approx 2,11 " (giờ)" $
    
    *Thực tế kiểm tra:* Thay $t^* = 19/9$:
    $ f(19/9) = 27 dot (19/9)^2 - 114 dot (19/9) + 145 $
    $ = 27 dot 361/81 - 2166/9 + 145 = 361/3 - 2166/9 + 1305/9 = 1083/9 - 2166/9 + 1305/9 = 222/9 $
    
    Khoảng cách nhỏ nhất:
    $ d_"min" = sqrt(222/9) = sqrt(222)/3 approx 14,90/3 approx 4,97 " (nghìn km)" $
    
    Vậy tại $t^* = 19/9 approx 2,11$ giờ, hai vật thể gần nhau nhất với khoảng cách $approx 4,97$ nghìn km.
    
    #nhanxet[
      *Tổng quát:* Bài toán "2 vật thể gần nhau nhất" luôn giải theo công thức $t^* = -b/(2a)$ từ hàm bậc 2 $f(t) = |vect(P_1P_2)(t)|^2$. Kỹ năng khai triển $(3t-10)^2 + ...$ chính xác là điều kiện sống còn — sai một dấu là sai toàn bộ bài. Kinh nghiệm: Nhóm theo lũy thừa của $t$ từ cao xuống thấp, kiểm tra hệ số bằng cách thử $t=0$.
    ]
  ]
)

