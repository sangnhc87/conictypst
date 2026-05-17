#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm)
)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
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
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body)
)

#show heading.where(level: 2): it => block(
  above: 1.5em, 
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body)
)

// ==========================================
// HÀM VẼ ĐA GIÁC CƠ BẢN (DÙNG CHUNG)
// ==========================================
#let draw-poly(n, r: 1.2) = {
  import cetz.draw: *
  circle((0,0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    circle((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
  }
}
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
// ==========================================
// NỘI DUNG TÀI LIỆU
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
        CHIM SĂN MỒI - ĐÓN MỤC TIÊU
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
       Vấn đề hai vật chuyển động có vận tốc gặp nhau
      ]
    ]
  )
]


#tln(
  // mode: "loigiai",
  [Cho một hồ nước nhỏ có hai bờ hồ song song cách nhau $20$ m. Ở hai bên bờ hồ có hai chiếc cọc thẳng đứng, hai đỉnh cọc $A$ và $B$ lần lượt có độ cao so với mặt nước hồ là $4$ m và $5$ m, hai điểm $A$ và $B$ cách nhau $30$ m. Một chú chim bói cá đậu tại $A$ và quan sát thấy có một con cá tại điểm $C$ (ở giữa hồ, cách bờ hồ phía chim bói cá $4$ m) đang bơi theo hướng vuông góc với bờ hồ với tốc độ $180 " cm/s"$ sang phía bờ bên kia. Chú chim bói cá này quan sát thấy con cá cách mình $6$ m và chú chim này sẽ bay thẳng với tốc độ $6 " m/s"$ để bắt con cá (coi thời gian bắt cá là $1$ giây) rồi mang theo con cá bay thẳng với tốc độ $5 " m/s"$ lên đỗ ở $B$. Hãy xác định khoảng thời gian tính từ lúc chú chim bói cá bắt đầu rời $A$ và đỗ vào $B$ theo đơn vị giây (làm tròn kết quả đến hàng phần trăm).],
  [$7,29$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Nền mặt nước (Hồ nước)
    let W_bl = (-4, -2)
    let W_br = (4, -2)
    let W_tr = (6, 1)
    let W_tl = (-2, 1)
    line(W_bl, W_br, W_tr, W_tl, close: true, fill: rgb("b3e5fc"), stroke: 0.5pt + rgb("0288d1"))
    
    // Kích thước bờ hồ 20m
    line((-4, -2), (4, -2), mark: (start: "<", end: ">"), stroke: 0.6pt)
    content((0, -2), [$20$ m], anchor: "south", padding: 4pt)
    
    // Chân cọc H và đỉnh A
    let H = (-2, -0.5)
    let A = (-2, 2.5)
    line(H, A, stroke: 1.5pt + rgb("388e3c"))
    circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "east", padding: 3pt)
    circle(A, radius: 1.5pt, fill: black); content(A, $A$, anchor: "east", padding: 3pt)
    content((-2, 1), [$4$ m], anchor: "east", padding: 3pt)
    
    // Chân cọc K và đỉnh B
    let K = (4.5, 0.5)
    let B = (4.5, 4)
    line(K, B, stroke: 1.5pt + rgb("388e3c"))
    circle(K, radius: 1.5pt, fill: black); content(K, $K$, anchor: "west", padding: 3pt)
    circle(B, radius: 1.5pt, fill: black); content(B, $B$, anchor: "west", padding: 3pt)
    content((4.5, 2.25), [$5$ m], anchor: "west", padding: 3pt)
    
    // Các đường nối nét đứt
    line(H, K, stroke: (dash: "dashed", paint: rgb("455a64")))
    line(A, B, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.25, 3.25), [$30$ m], anchor: "south-east", angle: 12deg)
    
    // Vị trí cá tại C
    let C = (-0.5, -1)
    content(C, text(size: 14pt)[🐟], anchor: "south", padding: 1pt)
    content(C, $C$, anchor: "north", padding: 4pt)
    
    // Đường nhìn của chim từ A đến C
    content(A, text(size: 14pt)[🦅], anchor: "south", padding: 1pt)
    line(A, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((-1.2, 0.6), [$6$ m], angle: -55deg, anchor: "south")
    
    // Khoảng cách từ C đến bờ (chiếu vuông góc)
    line(C, (-2, -1), stroke: (dash: "dashed", paint: rgb("455a64")))
    content((-1.25, -1), [$4$ m], anchor: "north", padding: 2pt)
  }),
  fig-pos: "center",
  fig-width: 60%,
  loigiai: [
    #ppgiai[
      - Chìa khóa bài toán này là sử dụng phương pháp *tọa độ hóa không gian $O x y z$*.
      - Chọn mặt nước làm mặt phẳng $(O x y)$. Gốc tọa độ $O$ trùng với chân cọc của điểm $A$.
      - Dựa vào khoảng cách để xác định tọa độ các điểm $A, B$ và vị trí ban đầu của cá $C$.
      - Tham số hóa tọa độ của cá theo thời gian $t$. Dựa vào quãng đường bay của chim để lập phương trình tìm thời gian bắt được cá ($t_1$).
      - Tính khoảng cách từ điểm bắt cá $D$ đến $B$ để tìm thời gian bay tiếp ($t_2$).
    ]
    
    *Bước 1: Tọa độ hóa không gian.*
    Chọn hệ trục $O x y z$ sao cho gốc $O$ trùng với chân cọc $H$ ($O equiv H(0; 0; 0)$).
    - Bờ hồ chứa $A$ là trục $O y$ ($x=0$). Mặt nước là $(O x y)$ ($z=0$).
    - Bờ hồ bên kia song song với $O y$ và cách $20$ m nên nằm trên đường thẳng $x = 20$.
    - Đỉnh cọc $A$ nằm thẳng đứng trên $H$, cao $4$ m $=> A(0; 0; 4)$.
    - Chân cọc thứ hai $K(20; y_K; 0)$, đỉnh cọc $B(20; y_K; 5)$.
    
    *Bước 2: Tìm tọa độ $B$ và $C$.*
    Khoảng cách $A B = 30$ m:
    $ A B^2 = (20 - 0)^2 + (y_K - 0)^2 + (5 - 4)^2 = 30^2 <=> 400 + y_K^2 + 1 = 900 <=> y_K^2 = 499. $
    Ta chọn chiều dương sao cho $y_K > 0$, suy ra $y_K = sqrt(499)$. Vậy $B(20; sqrt(499); 5)$.
    
    Con cá ở $C$ cách bờ $O y$ $4$ m nên hoành độ $x_C = 4$. Cá ở mặt nước nên $z_C = 0$. $=> C(4; y_C; 0)$.
    Khoảng cách $A C = 6$ m:
    $ A C^2 = (4 - 0)^2 + (y_C - 0)^2 + (0 - 4)^2 = 6^2 <=> 16 + y_C^2 + 16 = 36 <=> y_C^2 = 4. $
    Ta chọn chiều dương $y_C = 2$. Vậy $C(4; 2; 0)$.
    
    *Bước 3: Lập phương trình chuyển động để tìm thời gian bắt cá ($t_1$).*
    - Cá bơi vuông góc bờ sang bên kia (hướng theo trục $O x$) với vận tốc $v_c = 180 " cm/s" = 1,8 " m/s"$.
    - Tọa độ cá tại thời điểm $t_1$ giây là $D(4 + 1,8t_1; 2; 0)$.
    - Chim bay thẳng với tốc độ $6 " m/s"$. Khi bắt được cá, quãng đường chim bay là $A D = 6t_1$:
      $ A D^2 = (6t_1)^2 <=> (4 + 1,8t_1)^2 + (2 - 0)^2 + (0 - 4)^2 = 36t_1^2 $
      $ <=> 16 + 14,4t_1 + 3,24t_1^2 + 4 + 16 = 36t_1^2 $
      $ <=> 32,76t_1^2 - 14,4t_1 - 36 = 0. $
    - Giải phương trình bậc hai (chọn nghiệm dương), ta được:
      $ t_1 = (14,4 + sqrt(14.4^2 - 4 dot 32.76 dot (-36)))/(2 dot 32,76) approx 1,2908 " (s)". $
    
    *Bước 4: Tính thời gian mang cá bay về $B$ ($t_2$).*
    - Tọa độ điểm bắt cá $D$ là: $x_D = 4 + 1,8(1,2908) approx 6,3234$. Vậy $D(6,3234; 2; 0)$.
    - Khoảng cách từ $D$ đến $B$:
      $ D B = sqrt((20 - 6,3234)^2 + (sqrt(499) - 2)^2 + (5 - 0)^2) $
      $ D B = sqrt(13.6766^2 + 20.3383^2 + 25) = sqrt(187.049 + 413.646 + 25) = sqrt(625.695) approx 25,0139 " (m)". $
    - Thời gian chim mang cá bay về $B$ (với vận tốc $5 " m/s"$):
      $ t_2 = (D B)/5 = (25,0139)/5 approx 5,0028 " (s)". $
      
    Tổng thời gian từ lúc rời $A$, thời gian bắt cá ($1$ giây) và bay đến đỗ ở $B$ là:
    $ T_"tổng" = t_1 + 1 + t_2 approx 1,2908 + 1 + 5,0028 = 7,2936 " (s)". $
    Làm tròn đến hàng phần trăm, ta được kết quả là *$7,29$* giây.

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Trực quan hóa mặt phẳng Oxyz
        line((-1, 0), (6, 0), mark: (end: ">")); content((6, -0.3), $y$, anchor: "north")
        line((0, -1), (0, 5), mark: (end: ">")); content((-0.3, 5), $z$, anchor: "east")
        line((0, 0), (-3, -2), mark: (end: ">")); content((-3, -1.7), $x$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)
        
        let A = (0, 0, 3) 
        circle(A, radius: 1.5pt, fill: black); content(A, $A$, anchor: "east", padding: 3pt)
        
        let C = (-1.5, 1)
        let D = (-2.5, 1)
        circle(C, radius: 1.5pt, fill: orange); content(C, $C$, anchor: "north", padding: 4pt)
        circle(D, radius: 1.5pt, fill: red); content(D, $D(t_1)$, anchor: "north", padding: 4pt)
        
        line(C, D, mark: (end: ">"), stroke: (paint: orange, thickness: 1pt))
        content((-2, 1.2), $vec{v}_c$)
        
        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((-1.5, 1.8), [$v_("chim") dot t_1$], angle: 30deg, fill: classic.blue)
      })
    ]

    #nhanxet[Bài toán là một ví dụ điển hình của ứng dụng hình học giải tích $O x z$ vào vật lý động học. Việc chọn gốc tọa độ khéo léo (tại hình chiếu của điểm xuất phát) sẽ giúp triệt tiêu nhiều biến số, làm phương trình đơn giản hơn đáng kể.]
  ]
)

#tln(
  [Một sân tập thực nghiệm có một đường ray thẳng nằm trên mặt đất. Gần đường ray có một cột quan sát thẳng đứng, đỉnh cột $A$ cao $9$ m so với mặt đất. Hình chiếu vuông góc của $A$ lên mặt đất là điểm $H$. Khoảng cách từ $H$ đến đường ray là $12$ m. Một chiếc xe đua mô hình bắt đầu chạy trên đường ray từ điểm $C$ (với $C$ là điểm trên đường ray gần $H$ nhất) dọc theo đường ray với tốc độ không đổi $8 " m/s"$. Cùng lúc đó, một flycam cất cánh từ $A$, bay thẳng với tốc độ $17 " m/s"$ để đánh chặn và thả một gói hàng xuống xe đua (gọi vị trí gặp nhau là $D$). Quá trình thả hàng mất $1,5$ giây. Ngay sau đó, flycam tiếp tục bay thẳng với tốc độ $5 " m/s"$ đến đỗ tại trạm sạc $B$ trên một bức tường. Biết rằng nếu chọn hệ trục tọa độ $O x y z$ với mặt phẳng $(O x y)$ trùng mặt đất, gốc $O$ trùng $H$, trục $O y$ đi qua $C$ và trục $O x$ cùng hướng chạy của xe đua, thì trạm sạc $B$ có tọa độ là $(23; -4; 12)$ (đơn vị tọa độ là mét). Hỏi khoảng thời gian tính từ lúc flycam cất cánh tại $A$ cho đến khi đỗ tại $B$ là bao nhiêu giây? (Làm tròn kết quả đến hàng phần trăm).],
  [$7,50$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Nền đất
    line((-3, -1), (5, -1), (7, 3), (-1, 3), close: true, fill: rgb("e8f5e9"), stroke: 0.5pt + rgb("4caf50"))
    
    // Đường ray
    line((-1, 1), (6, 1), stroke: 1.5pt + rgb("455a64"))
    content((6, 1), [Đường ray], anchor: "west", padding: 4pt)
    
    // Cột HA
    let H = (1, -0.5)
    let A = (1, 3)
    line(H, A, stroke: 1.5pt + rgb("795548"))
    circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south", padding: 1pt)
    content(A, $A$, anchor: "east", padding: 4pt)
    content((1, 1.25), [$9$ m], anchor: "east", padding: 3pt)
    
    // Điểm C và H
    let C = (2, 1)
    circle(C, radius: 1.5pt, fill: red); content(C, $C$, anchor: "south-east", padding: 3pt)
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.5, 0.25), [$12$ m], anchor: "north-west", padding: 2pt)
    content(C, text(size: 14pt)[🏎️], anchor: "south-west")
    
    // Điểm đánh chặn D
    let D = (4.5, 1)
    circle(D, radius: 1.5pt, fill: orange); content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.25, 1), [$8 "m/s"$], anchor: "south", padding: 2pt)
    
    // Quỹ đạo bay 1: A -> D
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((2.5, 2.2), [$17 "m/s"$], angle: -30deg, anchor: "south")
    
    // Quỹ đạo bay 2: D -> B
    let B = (6, 4)
    circle(B, radius: 1.5pt, fill: black); content(B, $B(23; -4; 12)$, anchor: "west", padding: 3pt)
    line(D, B, stroke: (dash: "dashed", paint: orange), mark: (end: ">"))
    content((5.5, 2.5), [$5 "m/s"$], angle: 60deg, anchor: "south-east")
  }),
  fig-pos: "center",
  fig-width: 70%,
  loigiai: [
    #ppgiai[
      - Sử dụng hệ trục tọa độ $O x y z$ để giải bài toán động học không gian.
      - Tham số hóa tọa độ của xe đua $D(t)$ theo thời gian $t$.
      - Lập phương trình khoảng cách từ điểm xuất phát $A$ của flycam đến $D(t)$ bằng với quãng đường flycam bay được ($v_("flycam") dot t$) để giải tìm thời gian $t_1$.
      - Tính khoảng cách $D B$ trong không gian để tìm thời gian bay chặng thứ hai $t_2$.
    ]
    
    *Bước 1: Tọa độ hóa các điểm cơ bản.*
    Theo đề bài, gốc $O$ trùng $H(0; 0; 0)$.
    - Đỉnh cột $A$ nằm trên tia $O z$, cao $9$ m $=> A(0; 0; 9)$.
    - Đường ray song song với trục $O x$, điểm $C$ nằm trên trục $O y$ và cách $H$ một khoảng $12$ m $=> C(0; 12; 0)$.
    - Xe đua chạy từ $C$ dọc theo hướng dương trục $O x$ với tốc độ $8 " m/s"$. Tại thời điểm $t_1$ (giây), vị trí của xe đua là $D(8t_1; 12; 0)$.
    
    *Bước 2: Tìm thời gian bay chặng 1 ($t_1$).*
    - Khoảng cách từ $A$ đến $D$ chính là quãng đường flycam bay được với tốc độ $17 " m/s"$. Ta có $A D = 17t_1$.
    - Trong không gian $O x y z$, tính khoảng cách $A D$:
      $ A D^2 = (8t_1 - 0)^2 + (12 - 0)^2 + (0 - 9)^2 = 64t_1^2 + 144 + 81 = 64t_1^2 + 225 $
    - Ta có phương trình:
      $ (17t_1)^2 = 64t_1^2 + 225 <=> 289t_1^2 = 64t_1^2 + 225 $
      $ <=> 225t_1^2 = 225 <=> t_1^2 = 1 $
    - Vì $t_1 > 0$, suy ra $t_1 = 1$ (giây). 
    - Vị trí gặp nhau lúc này là $D(8; 12; 0)$.
    
    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Tọa độ trạm sạc là $B(23; -4; 12)$. Khoảng cách từ vị trí thả hàng $D$ đến $B$ là:
      $ D B = sqrt((23 - 8)^2 + (-4 - 12)^2 + (12 - 0)^2) $
      $ D B = sqrt(15^2 + (-16)^2 + 12^2) = sqrt(225 + 256 + 144) = sqrt(625) = 25 " (m)". $
    - Tốc độ bay chặng 2 là $5 " m/s"$. Thời gian bay từ $D$ đến $B$ là:
      $ t_2 = (D B)/v_2 = 25/5 = 5 " (s)". $
      
    *Bước 4: Tổng kết.*
    Tổng thời gian từ lúc cất cánh tại $A$ đến đỗ tại $B$ bao gồm: thời gian bay chặng 1 ($t_1$), thời gian dừng thả hàng ($t_("chờ")$) và thời gian bay chặng 2 ($t_2$).
    $ T_"tổng" = t_1 + t_("chờ") + t_2 = 1 + 1,5 + 5 = 7,5 " (s)". $
    Làm tròn kết quả đến hàng phần trăm, ta được *$7,50$* giây.

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Trực quan hóa mặt phẳng Oxyz
        line((-1, 0), (5, 0), mark: (end: ">")); content((5, -0.3), $y$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">")); content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">")); content((-2.5, -1.7), $x$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)
        
        let A = (0, 3) 
        circle(A, radius: 1.5pt, fill: black); content(A, $A(0;0;9)$, anchor: "east", padding: 3pt)
        
        let C = (3, 0)
        let D = (1.5, -1.2)
        circle(C, radius: 1.5pt, fill: red); content(C, $C(0;12;0)$, anchor: "south-west", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange); content(D, $D(t_1)$, anchor: "north", padding: 4pt)
        
        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((2.5, -0.6), $vec{v}_("xe")$, anchor: "west")
        
        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((0.3, 1.2), [$v_("flycam") dot t_1$], angle: 55deg, fill: classic.blue)
      })
    ]

    #nhanxet[Bản chất của các bài toán rượt đuổi, đánh chặn trong không gian là chuyển đổi vị trí của các vật thể thành hệ tọa độ tham số phụ thuộc biến thời gian $t$. Bộ số Pytago không gian $(12, 16, 15 arrow "cạnh huyền" 25)$ được vận dụng khéo léo để đảm bảo tính thẩm mỹ của kết quả.]
  ]
)
#tln(
  [Trên một vùng biển phẳng lặng, một trạm giàn khoan khai thác dầu khí có một bãi đỗ drone trực thăng $A$ nằm thẳng đứng cách mặt nước $100" m"$. Hình chiếu vuông góc của $A$ lên mặt nước là điểm $H$. Một chiếc canô cao tốc gặp sự cố bắt đầu di chuyển thẳng từ điểm $C$ (cách $H$ một khoảng $240" m"$) với tốc độ không đổi $15" m/s"$. Cùng lúc đó, một drone cứu hộ cất cánh từ $A$, bay theo đường thẳng với tốc độ $25" m/s"$ để đánh chặn và thả phao cứu sinh xuống chiếc canô (gọi vị trí gặp nhau là $D$). Thời gian drone khựng lại để thả phao là $2$ giây. Ngay sau đó, drone tiếp tục bay thẳng với tốc độ $20" m/s"$ để đỗ xuống bãi đáp $B$ trên nóc một tàu hải cảnh neo đậu gần đó. \
  Biết rằng nếu chọn hệ trục tọa độ $O x y z$ với mặt phẳng $(O x y)$ trùng mặt nước biển, gốc $O$ trùng với $H$, trục $O y$ đi qua $C$ và trục $O x$ song song cùng hướng di chuyển của canô, thì tàu hải cảnh $B$ có tọa độ $(339; 48; 100)$ (đơn vị tọa độ tính bằng mét). Tính tổng thời gian từ lúc drone cất cánh tại $A$ cho đến khi hạ cánh an toàn tại $B$ (tính bằng giây).],
  [$28$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Mặt biển (Oxy)
    line((-2, -1.5), (6, -1.5), (8, 2.5), (0, 2.5), close: true, fill: rgb("e1f5fe"), stroke: 0.5pt + rgb("0288d1"))
    content((6, 2), [Mặt biển $(O x y)$], fill: rgb("0288d1"))
    
    // Trục tọa độ cơ sở
    line((1, 0), (7, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
    content((7, -0.3), $x$)
    
    // Giàn khoan A và H
    let H = (1, 0)
    let A = (1, 3.5)
    line(H, A, stroke: 2pt + rgb("546e7a"))
    circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south")
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 1.7), [$100"m"$], anchor: "east", padding: 3pt)
    
    // Vị trí canô C
    let C = (2, 1)
    circle(C, radius: 1.5pt, fill: red); content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🚤], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.5, 0.5), [$240"m"$], anchor: "east", padding: 3pt)
    
    // Điểm đánh chặn D
    let D = (4.5, 1)
    circle(D, radius: 1.5pt, fill: orange); content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.25, 1), [$15"m/s"$], anchor: "south", padding: 2pt)
    
    // Quỹ đạo bay 1: A -> D
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((2.5, 2.5), [$25"m/s"$], angle: -32deg, anchor: "south")
    
    // Quỹ đạo bay 2: D -> B
    let B = (6.5, 3.5)
    circle(B, radius: 1.5pt, fill: black); content(B, $B(339; 48; 100)$, anchor: "west", padding: 3pt)
    line(D, B, stroke: (dash: "dashed", paint: orange), mark: (end: ">"))
    content((5.7, 2.5), [$20"m/s"$], angle: 45deg, anchor: "south-east")
  }),
  fig-pos: "center",
  fig-width: 75%,
  loigiai: [
    #ppgiai[
      - Bài toán có cấu trúc hình học giải tích không gian 3 chiều kết hợp với chuyển động thẳng đều.
      - Tham số hóa tọa độ của canô $D(t)$ đang di chuyển trên mặt phẳng $(O x y)$.
      - Lập phương trình động học $A D = v_("drone") dot t$ để giải tìm thời gian đánh chặn $t_1$.
      - Xác định tọa độ điểm $D$ thực tế. Từ đó dùng công thức khoảng cách 2 điểm $D B$ để tìm thời gian hạ cánh chặng 2.
    ]
    
    *Bước 1: Tọa độ hóa không gian.*
    - Chọn gốc tọa độ $O$ trùng với hình chiếu $H(0; 0; 0)$. 
    - Bãi đỗ $A$ nằm thẳng đứng trên $H$, có độ cao $100" m" => A(0; 0; 100)$.
    - Trục $O y$ đi qua vị trí xuất phát $C$ của canô và $H C = 240" m" => C(0; 240; 0)$.
    - Canô di chuyển song song hướng dương của trục $O x$ với tốc độ $15" m/s"$. Tại thời điểm $t_1$ (giây), tọa độ của canô là $D(15t_1; 240; 0)$.
    
    *Bước 2: Tìm thời gian đánh chặn chặng 1 ($t_1$).*
    - Khoảng cách từ vị trí xuất phát của drone $A(0; 0; 100)$ đến mục tiêu $D(15t_1; 240; 0)$ là:
      $ A D^2 &= (15t_1 - 0)^2 + (240 - 0)^2 + (0 - 100)^2 \
              &= 225t_1^2 + 57600 + 10000 = 225t_1^2 + 67600. $
    - Mặt khác, drone bay với tốc độ $25" m/s"$, nên quãng đường thực tế bay được là $A D = 25t_1$.
    - Lập phương trình:
      $ (25t_1)^2 = 225t_1^2 + 67600 <=> 625t_1^2 - 225t_1^2 = 67600 $
      $ <=> 400t_1^2 = 67600 <=> t_1^2 = 169 <=> t_1 = 13 " (giây)". $
    - Tọa độ điểm gặp nhau (thả phao) là $D(15 dot 13; 240; 0) = D(195; 240; 0)$.
    
    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Tọa độ tàu hải cảnh là $B(339; 48; 100)$. Khoảng cách bay chặng 2 từ $D$ đến $B$ là:
      $ D B &= sqrt((339 - 195)^2 + (48 - 240)^2 + (100 - 0)^2) \
            &= sqrt(144^2 + (-192)^2 + 100^2) \
            &= sqrt(20736 + 36864 + 10000) = sqrt(67600) = 260 " (m)". $
    - Thời gian bay chặng 2 với tốc độ $20" m/s"$ là:
      $ t_2 = (D B)/v_2 = 260/20 = 13 " (giây)". $
      
    *Bước 4: Tính tổng thời gian.*
    Tổng thời gian từ lúc cất cánh tại $A$, đánh chặn, dừng thả phao và hạ cánh đỗ ở $B$ là:
    $ T_"tổng" = t_1 + t_("chờ") + t_2 = 13 + 2 + 13 = 28 " (giây)". $

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Trực quan hóa hình chiếu vuông góc tam giác AHD
        line((0,0), (4,0), (0,2), close: true, stroke: 1pt + rgb("1976d2"))
        
        // Góc vuông H
        line((0,0.3), (0.3,0.3), (0.3,0), stroke: 0.5pt)
        
        circle((0,0), radius: 1.5pt, fill: black); content((0,0), $H$, anchor: "north-east", padding: 3pt)
        circle((0,2), radius: 1.5pt, fill: black); content((0,2), $A$, anchor: "east", padding: 3pt)
        circle((4,0), radius: 1.5pt, fill: black); content((4,0), $D(t_1)$, anchor: "west", padding: 3pt)
        
        content((0, 1), [$100$], anchor: "east", padding: 3pt)
        content((2, -0.3), [$sqrt((15t_1)^2 + 240^2)$])
        content((2, 1.3), [$25t_1$], angle: -26deg, fill: rgb("d32f2f"))
      })
    ]

    #nhanxet[Bài toán rượt đuổi trong không gian có thể chuyển thành bài toán Giải tam giác vuông $Delta A H D$ tại $H$. Khi đó $A D^2 = A H^2 + H D^2$. Mọi tính toán trong bài đều được thiết kế dựa trên các bộ ba Pythagoras: $(15, 20, 25)$ và $(144, 192, 240 arrow 260)$ giúp số liệu cực kỳ tròn trịa.]
  ]
)
#tln(
  [Trong một khu công nghiệp công nghệ cao, có một tháp điều khiển an ninh với bãi đỗ drone $A$ nằm ở độ cao $100$ m so với mặt đất. Hình chiếu vuông góc của $A$ xuống mặt đất là điểm $H$. Hệ thống radar phát hiện một robot vận chuyển tự hành (bị nghi ngờ mang hàng lậu) xuất phát từ điểm $C$ trên mặt đất (cách $H$ một khoảng $300$ m) và đang di chuyển theo đường thẳng vuông góc với $H C$ với tốc độ không đổi $15 " m/s"$. Ngay lập tức, một drone an ninh cất cánh từ $A$, bay thẳng với tốc độ $35 " m/s"$ để đánh chặn robot (gọi vị trí đánh chặn là $D$). Thời gian drone bay vòng quanh để vô hiệu hóa robot và kẹp lấy gói hàng là $2,5$ giây. Sau đó, drone mang theo gói hàng bay thẳng với tốc độ $25 " m/s"$ về hầm chứa vật chứng $B$ nằm trên sườn một ngọn núi gần đó. \ 
  Biết rằng nếu chọn hệ trục tọa độ $O x y z$ với mặt phẳng $(O x y)$ trùng mặt đất, gốc $O$ trùng $H$, trục $O y$ đi qua $C$ và trục $O x$ cùng hướng di chuyển của robot, thì hầm chứa $B$ có tọa độ $(240; 180; 200)$ (đơn vị mét). Hỏi tổng khoảng thời gian từ lúc drone an ninh cất cánh tại $A$ cho đến khi hạ cánh thành công tại $B$ là bao nhiêu giây? (Làm tròn đến hàng phần trăm).],
  [$22,50$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Nền đất khu công nghiệp (Mặt Oxy)
    line((-2, -1.5), (6, -1.5), (8, 2.5), (0, 2.5), close: true, fill: rgb("eceff1"), stroke: 0.5pt + rgb("90a4ae"))
    
    // Trục tọa độ cơ sở (mờ)
    line((0, 0), (7, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
    content((7, -0.3), $x$, fill: gray)
    
    // Tháp an ninh H -> A
    let H = (1, 0)
    let A = (1, 4)
    line(H, A, stroke: 2.5pt + rgb("37474f"))
    circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south")
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 2), [$100"m"$], anchor: "east", padding: 3pt)
    
    // Vị trí Robot C
    let C = (2, 1.5)
    circle(C, radius: 1.5pt, fill: red); content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🤖], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.3, 0.9), [$300"m"$], anchor: "east", padding: 3pt)
    
    // Điểm đánh chặn D
    let D = (5.5, 1.5)
    circle(D, radius: 1.5pt, fill: orange); content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.75, 1.5), [$15"m/s"$], anchor: "south", padding: 2pt)
    
    // Quỹ đạo bay 1: A -> D (Đánh chặn)
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((3, 2.9), [$35"m/s"$], angle: -28deg, anchor: "south", fill: blue)
    
    // Quỹ đạo bay 2: D -> B (Mang vật chứng)
    let B = (7.5, 4.5)
    circle(B, radius: 1.5pt, fill: black); content(B, $B(240; 180; 200)$, anchor: "west", padding: 3pt)
    content(B, text(size: 14pt)[📦], anchor: "south", padding: 1pt)
    line(D, B, stroke: (dash: "dashed", paint: orange), mark: (end: ">"))
    content((6.2, 3), [$25"m/s"$], angle: 56deg, anchor: "south-east", fill: orange)
  }),
  fig-pos: "center",
  fig-width: 80%,
  loigiai: [
    #ppgiai[
      - Bài toán chuyển động rượt đuổi trong không gian $3$ chiều. Mấu chốt là thiết lập phương trình khoảng cách từ điểm xuất phát của drone đến tọa độ tham số của mục tiêu $D(t)$.
      - Phương trình đánh chặn: Khoảng cách không gian $A D = v_("drone") dot t_1$.
      - Khi đã có $t_1$, thay ngược lại để lấy tọa độ thực tế của $D$, từ đó tính quãng đường $D B$ và thời gian $t_2$.
    ]
    
    *Bước 1: Tọa độ hóa không gian và tham số hóa mục tiêu.*
    - Chọn gốc tọa độ $O$ trùng $H(0; 0; 0)$. 
    - Tháp an ninh $A$ nằm thẳng đứng, cao $100" m" => A(0; 0; 100)$.
    - Robot xuất phát từ $C$, nằm trên trục $O y$ và cách $H$ $300" m" => C(0; 300; 0)$.
    - Robot di chuyển vuông góc với $H C$ (trục $O y$), tức là di chuyển song song cùng hướng trục $O x$ với tốc độ $15" m/s"$. Tại thời điểm $t_1$ (giây), tọa độ của robot là: 
      $D(15t_1; 300; 0)$.
    
    *Bước 2: Tìm thời gian đánh chặn chặng 1 ($t_1$).*
    - Khoảng cách từ đỉnh tháp $A(0; 0; 100)$ đến robot $D(15t_1; 300; 0)$ là:
      $ A D^2 &= (15t_1 - 0)^2 + (300 - 0)^2 + (0 - 100)^2 \
              &= 225t_1^2 + 90000 + 10000 = 225t_1^2 + 100000. $
    - Drone bay với tốc độ $35" m/s"$, nên quãng đường thực tế bay được là $A D = 35t_1$.
    - Lập phương trình động học:
      $ (35t_1)^2 = 225t_1^2 + 100000 <=> 1225t_1^2 - 225t_1^2 = 100000 $
      $ <=> 1000t_1^2 = 100000 <=> t_1^2 = 100 <=> t_1 = 10 " (giây)". $
    - Vậy sau $10$ giây thì drone bắt kịp robot. Tọa độ điểm đánh chặn là $D(15 dot 10; 300; 0) = D(150; 300; 0)$.
    
    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Hầm chứa vật chứng ở vị trí $B(240; 180; 200)$. Quãng đường bay chặng 2 từ $D$ đến $B$ là:
      $ D B &= sqrt((240 - 150)^2 + (180 - 300)^2 + (200 - 0)^2) \
            &= sqrt(90^2 + (-120)^2 + 200^2) \
            &= sqrt(8100 + 14400 + 40000) = sqrt(62500) = 250 " (m)". $
    - Thời gian bay chặng 2 mang vật chứng với tốc độ $25" m/s"$ là:
      $ t_2 = (D B)/v_2 = 250/25 = 10 " (giây)". $
      
    *Bước 4: Tính tổng thời gian toàn chiến dịch.*
    Tổng thời gian từ lúc cất cánh tại $A$, bay đến đánh chặn ($t_1$), dừng lại vô hiệu hóa ($t_("vhh")$) và mang về hầm chứa ($t_2$) là:
    $ T_"tổng" = t_1 + t_("vhh") + t_2 = 10 + 2,5 + 10 = 22,5 " (giây)". $
    Làm tròn đến hàng phần trăm, ta được kết quả là *$22,50$*.

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trực quan hóa hình học không gian Oxyz
        line((-1, 0), (6, 0), mark: (end: ">")); content((6, -0.3), $x$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">")); content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">")); content((-2.5, -1.7), $y$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)
        
        let A = (0, 2)
        circle(A, radius: 1.5pt, fill: black); content(A, $A$, anchor: "east", padding: 3pt)
        content((0, 1), [$100$], anchor: "east", padding: 2pt)
        
        let C = (-1.5, -1.2)
        let D = (2.5, -1.2)
        circle(C, radius: 1.5pt, fill: red); content(C, $C(0; 300; 0)$, anchor: "east", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange); content(D, $D(t_1)$, anchor: "north", padding: 4pt)
        
        line((0,0), C, stroke: (dash: "dashed", paint: gray))
        content((-0.75, -0.4), [$300$], anchor: "east", padding: 2pt)
        
        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((0.5, -1.2), [$15t_1$], anchor: "south", fill: red)
        
        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((1.2, 0.4), [$35t_1$], angle: -24deg, anchor: "south", fill: classic.blue)
      })
    ]

    #nhanxet[Hai bộ tứ Pythagoras hoàn hảo đã được sử dụng trong bài này để tạo ra kết quả tuyệt đẹp: \ Bộ 1: $(150, 300, 100 arrow 350)$ tương ứng hệ số $(3, 6, 2 arrow 7)$. \ Bộ 2: $(90, 120, 200 arrow 250)$ tương ứng hệ số $(9, 12, 20 arrow 25)$. Việc hiểu và làm chủ các bộ số Pytago không gian này giúp giáo viên sáng tác đề thi tự nhiên hơn rất nhiều.]
  ]
)

#tln(
  [Trong một cuộc diễn tập cứu hộ trên biển, một trực thăng cứu hộ đậu tại bãi đáp $A$ trên một vách đá thẳng đứng, cách mặt biển $120$ m. Hình chiếu vuông góc của $A$ lên mặt biển là điểm $H$. Một xuồng cao tốc xuất phát từ điểm $C$ trên mặt biển (cách $H$ một khoảng $160$ m) và di chuyển theo đường thẳng vuông góc với $H C$ với tốc độ không đổi $15 " m/s"$. Ngay khi xuồng xuất phát, trực thăng cất cánh từ $A$, bay theo đường thẳng với tốc độ $25 " m/s"$ để đánh chặn và thả thiết bị y tế xuống xuồng (gọi vị trí thả là $D$). Thời gian trực thăng bay lượn đồng tốc để thả thiết bị là $1,5$ giây. Ngay sau đó, trực thăng chuyển hướng bay thẳng với tốc độ $26 " m/s"$ về đỗ tại bãi đáp $B$ trên nóc một tàu bệnh viện. \
  Biết rằng nếu chọn hệ trục tọa độ $O x y z$ với mặt phẳng $(O x y)$ trùng với mặt biển, gốc $O$ trùng với $H$, trục $O y$ đi qua $C$ và trục $O x$ cùng hướng di chuyển của xuồng, thì tàu bệnh viện $B$ có tọa độ $(222; 64; 50)$ (đơn vị mét). Hỏi tổng khoảng thời gian từ lúc trực thăng cất cánh tại $A$ cho đến khi hạ cánh an toàn tại $B$ là bao nhiêu giây? (Làm tròn kết quả đến hàng phần mười).],
  [$16,5$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Nền mặt biển
    line((-2, -1.5), (6, -1.5), (8, 2.5), (0, 2.5), close: true, fill: rgb("e1f5fe"), stroke: 0.5pt + rgb("0288d1"))
    
    // Trục tọa độ cơ sở (mờ)
    line((0, 0), (7, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
    content((7, -0.3), $x$, fill: gray)
    
    // Vách đá H -> A
    let H = (1, 0)
    let A = (1, 4)
    line(H, A, stroke: 2.5pt + rgb("795548"))
    circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south")
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 2), [$120"m"$], anchor: "east", padding: 3pt)
    
    // Vị trí Xuồng C
    let C = (2, 1.5)
    circle(C, radius: 1.5pt, fill: red); content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🚤], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.3, 0.9), [$160"m"$], anchor: "east", padding: 3pt)
    
    // Điểm đánh chặn D
    let D = (5.5, 1.5)
    circle(D, radius: 1.5pt, fill: orange); content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.75, 1.5), [$15"m/s"$], anchor: "south", padding: 2pt)
    
    // Quỹ đạo bay 1: A -> D (Đánh chặn)
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((3, 2.9), [$25"m/s"$], angle: -28deg, anchor: "south", fill: blue)
    
    // Quỹ đạo bay 2: D -> B (Về tàu bệnh viện)
    let B = (7.5, 4.5)
    circle(B, radius: 1.5pt, fill: black); content(B, $B(222; 64; 50)$, anchor: "west", padding: 3pt)
    content(B, text(size: 14pt)[🚢], anchor: "south", padding: 1pt)
    line(D, B, stroke: (dash: "dashed", paint: orange), mark: (end: ">"))
    content((6.2, 3), [$26"m/s"$], angle: 56deg, anchor: "south-east", fill: orange)
  }),
  fig-pos: "center",
  fig-width: 80%,
  loigiai: [
    #ppgiai[
      - Mọi bài toán rượt đuổi trong không gian $3$ chiều đều có thể giải quyết gọn gàng bằng phương pháp tọa độ hóa và thiết lập phương trình khoảng cách.
      - Gọi tọa độ của mục tiêu (xuồng) tại thời điểm $t_1$ là $D(t_1)$.
      - Quãng đường bay của trực thăng là $A D = v_("trực thăng") dot t_1$. Lập phương trình bình phương khoảng cách để giải $t_1$.
      - Khi có tọa độ $D$, dùng công thức khoảng cách 2 điểm $D B$ để tìm quãng đường chặng 2, suy ra thời gian $t_2$.
    ]
    
    *Bước 1: Tọa độ hóa không gian và tham số hóa mục tiêu.*
    - Chọn gốc tọa độ $O$ trùng $H(0; 0; 0)$. 
    - Vách đá $A$ thẳng đứng nằm trên trục $O z$, cao $120" m" => A(0; 0; 120)$.
    - Xuồng xuất phát từ $C$, nằm trên trục $O y$ và cách $H$ $160" m" => C(0; 160; 0)$.
    - Xuồng di chuyển vuông góc với $H C$ (trục $O y$), tức là di chuyển song song cùng hướng trục $O x$ với tốc độ $15" m/s"$. 
    - Tại thời điểm $t_1$ (giây), tọa độ của xuồng là $D(15t_1; 160; 0)$.
    
    *Bước 2: Tìm thời gian đánh chặn chặng 1 ($t_1$).*
    - Bình phương khoảng cách từ trực thăng $A(0; 0; 120)$ đến xuồng $D(15t_1; 160; 0)$ là:
      $ A D^2 &= (15t_1 - 0)^2 + (160 - 0)^2 + (0 - 120)^2 \
              &= 225t_1^2 + 25600 + 14400 = 225t_1^2 + 40000. $
    - Trực thăng bay với tốc độ $25" m/s"$, nên quãng đường thực tế bay được là $A D = 25t_1$. Suy ra $A D^2 = (25t_1)^2 = 625t_1^2$.
    - Lập phương trình:
      $ 625t_1^2 = 225t_1^2 + 40000 <=> 400t_1^2 = 40000 $
      $ <=> t_1^2 = 100 <=> t_1 = 10 " (giây)". $
    - Vậy sau $10$ giây thì trực thăng thả được thiết bị. Tọa độ điểm đánh chặn lúc này là $D(15 dot 10; 160; 0) = D(150; 160; 0)$.
    
    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Tàu bệnh viện nằm ở vị trí $B(222; 64; 50)$. Quãng đường bay chặng 2 từ $D$ đến $B$ là:
      $ D B &= sqrt((222 - 150)^2 + (64 - 160)^2 + (50 - 0)^2) \
            &= sqrt(72^2 + (-96)^2 + 50^2) \
            &= sqrt(5184 + 9216 + 2500) = sqrt(14400 + 2500) = sqrt(16900) = 130 " (m)". $
    - Thời gian bay chặng 2 với tốc độ $26" m/s"$ là:
      $ t_2 = (D B)/v_2 = 130/26 = 5 " (giây)". $
      
    *Bước 4: Tính tổng thời gian.*
    Tổng thời gian chiến dịch bao gồm: bay đến đánh chặn ($t_1$), thời gian thả đồ ($t_("chờ")$) và bay về tàu bệnh viện ($t_2$):
    $ T_"tổng" = t_1 + t_("chờ") + t_2 = 10 + 1,5 + 5 = 16,5 " (giây)". $
    Kết quả là *$16,5$*.

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trực quan hóa hình học không gian Oxyz
        line((-1, 0), (6, 0), mark: (end: ">")); content((6, -0.3), $x$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">")); content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">")); content((-2.5, -1.7), $y$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)
        
        let A = (0, 2.4)
        circle(A, radius: 1.5pt, fill: black); content(A, $A(0;0;120)$, anchor: "west", padding: 3pt)
        content((0, 1.2), [$120$], anchor: "east", padding: 2pt)
        
        let C = (-1.5, -1.2)
        let D = (2.5, -1.2)
        circle(C, radius: 1.5pt, fill: red); content(C, $C(0; 160; 0)$, anchor: "east", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange); content(D, $D(t_1)$, anchor: "north", padding: 4pt)
        
        line((0,0), C, stroke: (dash: "dashed", paint: gray))
        content((-0.75, -0.4), [$160$], anchor: "east", padding: 2pt)
        
        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((0.5, -1.2), [$15t_1$], anchor: "south", fill: red)
        
        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((1.2, 0.6), [$25t_1$], angle: -32deg, anchor: "south", fill: classic.blue)
        
        // Đường nối HD 
        line((0,0), D, stroke: (dash: "dashed", paint: rgb("388e3c")))
        content((1.25, -0.6), [$sqrt(160^2 + (15t_1)^2)$], angle: -25deg, anchor: "north", fill: rgb("388e3c"), size: 9pt)
      })
    ]

    #nhanxet[n là giải tam giác vuông $A H D$ tại $H$. Khi đó $A D^2 = A H^2 + H D^2$. Bài toán này đã lồng ghép bộ số Pythagoras rất đẹp: \ Bộ 1: $(160, 120 arrow H D = 200) arrow (150, 200 arrow A D = 250)$ tương ứng $t_1 = 10$. \ Bộ 2 (Quadruples 3D): $72^2 + (-96)^2 + 50^2 = 130^2$. Các con số được tinh chỉnh để mọi quãng đường tính ra đều là số nguyên hoàn hảo.]
  ]
)
#tln(
  [Tại một trạm thử nghiệm hàng không vũ trụ mô phỏng địa hình bề mặt hành tinh, một tháp điều khiển có sân đỗ drone $A$ nằm ở độ cao $180" m"$ so với mặt đất phẳng. Hình chiếu vuông góc của $A$ xuống mặt đất là điểm $H$. Một siêu xe địa hình (Rover) bắt đầu di chuyển từ điểm $C$ trên mặt đất (cách $H$ một khoảng $240" m"$) theo một đường thẳng vuông góc với đoạn $H C$, với tốc độ không đổi $21" m/s"$. Đúng lúc Rover xuất phát, một drone cất cánh từ $A$ bay theo một đường thẳng với tốc độ $29" m/s"$ để đuổi theo và thả một module cảm biến xuống Rover (gọi vị trí thả là $D$). Thời gian drone đồng tốc và bay lượn phía trên Rover để chốt hạ module là $3,5$ giây. Ngay sau đó, drone chuyển hướng bay thẳng với tốc độ $34" m/s"$ để về hạ cánh tại trạm sạc dự phòng $B$ đặt trên một vách đá đá. \
  Biết rằng nếu chọn hệ trục tọa độ không gian $O x y z$ với mặt phẳng $(O x y)$ trùng với mặt đất, gốc $O$ trùng với $H$, trục $O y$ đi qua $C$ và trục $O x$ cùng hướng di chuyển của Rover, thì trạm sạc $B$ có tọa độ $(475; 0; 180)$ (đơn vị mét). Tính tổng thời gian từ lúc drone cất cánh tại $A$ cho đến khi hạ cánh hoàn toàn tại $B$ (tính bằng giây, làm tròn kết quả đến hàng phần mười).],
  [$28,5$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Nền mặt đất giả lập Sao Hỏa
    line((-2, -1.5), (6, -1.5), (8, 2.5), (0, 2.5), close: true, fill: rgb("ffccbc"), stroke: 0.5pt + rgb("e64a19"))
    content((6, 2), [Mặt đất $(O x y)$], fill: rgb("d84315"))
    
    // Trục tọa độ cơ sở (mờ)
    line((0, 0), (7, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
    content((7, -0.3), $x$, fill: gray)
    
    // Tháp điều khiển H -> A
    let H = (1, 0)
    let A = (1, 4.5)
    line(H, A, stroke: 3pt + rgb("455a64"))
    circle(H, radius: 1.5pt, fill: black); content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🛸], anchor: "south", padding: 2pt)
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 2.2), [$180"m"$], anchor: "east", padding: 3pt)
    
    // Vị trí Rover C
    let C = (2, 1.5)
    circle(C, radius: 1.5pt, fill: red); content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🚙], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.3, 0.9), [$240"m"$], anchor: "east", padding: 3pt)
    
    // Điểm đánh chặn D
    let D = (5.5, 1.5)
    circle(D, radius: 1.5pt, fill: orange); content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.75, 1.5), [$21"m/s"$], anchor: "south", padding: 2pt)
    
    // Quỹ đạo bay 1: A -> D (Đánh chặn)
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((3.2, 3), [$29"m/s"$], angle: -32deg, anchor: "south", fill: blue)
    
    // Quỹ đạo bay 2: D -> B (Về trạm sạc)
    let B = (7.5, 4.2)
    circle(B, radius: 1.5pt, fill: black); content(B, $B(475; 0; 180)$, anchor: "west", padding: 3pt)
    content(B, text(size: 14pt)[🛰️], anchor: "south", padding: 1pt)
    line(D, B, stroke: (dash: "dashed", paint: orange), mark: (end: ">"))
    content((6.2, 3.1), [$34"m/s"$], angle: 50deg, anchor: "south-east", fill: orange)
  }),
  fig-pos: "center",
  fig-width: 85%,
  loigiai: [
    #ppgiai[
      - Mọi bài toán rượt đuổi và đánh chặn trong không gian có thể được mô hình hóa bằng hệ tọa độ $O x y z$. 
      - Gọi thời gian từ lúc xuất phát đến khi bắt kịp nhau là $t_1$. Tham số hóa tọa độ của Rover (điểm $D$) theo $t_1$.
      - Lập phương trình từ dữ kiện $A D = v_("drone") dot t_1$ để giải tìm $t_1$.
      - Xác định tọa độ cụ thể của $D$, dùng công thức khoảng cách để tính quãng đường $D B$, từ đó suy ra thời gian chặng hai $t_2$.
    ]
    
    *Bước 1: Tọa độ hóa không gian và tham số hóa mục tiêu.*
    - Chọn gốc tọa độ $O$ trùng $H(0; 0; 0)$. 
    - Tháp điều khiển $A$ nằm thẳng đứng trên $H$, cao $180" m" => A(0; 0; 180)$.
    - Rover xuất phát từ $C$, nằm trên trục $O y$ và cách $H$ $240" m" => C(0; 240; 0)$.
    - Rover di chuyển vuông góc với đoạn $H C$ (tức là vuông góc trục $O y$), nên nó di chuyển song song và cùng hướng với trục $O x$ với tốc độ $21" m/s"$. 
    - Tại thời điểm $t_1$ (giây), tọa độ của Rover là $D(21t_1; 240; 0)$.
    
    *Bước 2: Tìm thời gian đánh chặn chặng 1 ($t_1$).*
    - Bình phương khoảng cách từ đỉnh tháp $A(0; 0; 180)$ đến Rover $D(21t_1; 240; 0)$ là:
      $ A D^2 &= (21t_1 - 0)^2 + (240 - 0)^2 + (0 - 180)^2 \
              &= 441t_1^2 + 57600 + 32400 = 441t_1^2 + 90000. $
    - Mặt khác, drone bay với tốc độ $29" m/s"$, nên quãng đường thực tế là $A D = 29t_1$. Suy ra $A D^2 = (29t_1)^2 = 841t_1^2$.
    - Lập phương trình động học:
      $ 841t_1^2 = 441t_1^2 + 90000 <=> 400t_1^2 = 90000 $
      $ <=> t_1^2 = 225 <=> t_1 = 15 " (giây)". $
    - Vậy sau $15$ giây drone thả được module. Tọa độ điểm đánh chặn lúc này là $D(21 dot 15; 240; 0) = D(315; 240; 0)$.
    
    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Trạm sạc dự phòng nằm ở vị trí $B(475; 0; 180)$. Quãng đường bay chặng 2 từ $D$ đến $B$ là:
      $ D B &= sqrt((475 - 315)^2 + (0 - 240)^2 + (180 - 0)^2) \
            &= sqrt(160^2 + (-240)^2 + 180^2) \
            &= sqrt(25600 + 57600 + 32400) = sqrt(115600) = 340 " (m)". $
    - Thời gian bay chặng 2 với tốc độ $34" m/s"$ là:
      $ t_2 = (D B)/v_2 = 340/34 = 10 " (giây)". $
      
    *Bước 4: Tính tổng thời gian toàn hành trình.*
    Tổng thời gian chiến dịch bao gồm: bay đến đánh chặn ($t_1$), thời gian đồng tốc thả cảm biến ($t_("chờ")$) và bay về trạm sạc ($t_2$):
    $ T_"tổng" = t_1 + t_("chờ") + t_2 = 15 + 3,5 + 10 = 28,5 " (giây)". $

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trực quan hóa hình học không gian tam giác vuông
        line((-1, 0), (6, 0), mark: (end: ">")); content((6, -0.3), $x$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">")); content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">")); content((-2.5, -1.7), $y$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)
        
        let A = (0, 3)
        circle(A, radius: 1.5pt, fill: black); content(A, $A(0;0;180)$, anchor: "west", padding: 3pt)
        content((0, 1.5), [$180$], anchor: "east", padding: 2pt)
        
        let C = (-1.5, -1.2)
        let D = (3.5, -1.2)
        circle(C, radius: 1.5pt, fill: red); content(C, $C(0; 240; 0)$, anchor: "east", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange); content(D, $D(t_1)$, anchor: "north", padding: 4pt)
        
        line((0,0), C, stroke: (dash: "dashed", paint: gray))
        content((-0.75, -0.4), [$240$], anchor: "east", padding: 2pt)
        
        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((1, -1.2), [$21t_1$], anchor: "south", fill: red)
        
        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((2.1, 0.9), [$29t_1$], angle: -36deg, anchor: "south", fill: classic.blue)
        
        // Đường nối HD 
        line((0,0), D, stroke: (dash: "dashed", paint: rgb("388e3c")))
        content((1.8, -0.5), [$sqrt(240^2 + (21t_1)^2)$], angle: -18deg, anchor: "north", fill: rgb("388e3c"), size: 9pt)
      })
    ]

    #nhanxet[Hai bộ số Pythagoras hoàn mỹ đã được kiến tạo trong cấu trúc bài toán này để biến một bài toán không gian phức tạp thành những phép tính số nguyên gọn gàng: \ Bộ 1: $(21, 20, 29)$ với $20t_1 = sqrt(180^2 + 240^2) = 300 arrow t_1 = 15$. \ Bộ 2: Mở rộng 3D $(160, 240, 180 arrow 340)$ dựa trên tỉ lệ gốc $(8, 12, 9 arrow 17)$. Việc hiểu rõ cách sinh các bộ ba, bộ bốn Pytago giúp kiểm soát chặt chẽ nghiệm của bài toán.]
  ]
)
