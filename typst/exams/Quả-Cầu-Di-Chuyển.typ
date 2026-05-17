#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

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
  ]
)

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
      - Tìm bán kính $r$ của đường tròn giao tuyến $(C)$ và tọa độ tâm $H$ của $(C)$ bằng hệ thức lượng trong tam giác tạo bởi hai tâm và điểm giao (chú ý đặc điểm "cắt nhau trực giao").
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
