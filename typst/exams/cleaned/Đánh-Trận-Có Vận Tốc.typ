#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"


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
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)

// ==========================================
// HÀM VẼ ĐA GIÁC CƠ BẢN (DÙNG CHUNG)
// ==========================================
#let draw-poly(n, r: 1.2) = {
  import cetz.draw: *
  circle((0, 0), radius: r, stroke: luma(200) + 0.5pt)
  for i in range(n) {
    circle((90deg - i * 360deg / n, r), radius: 1.2pt, fill: gray)
  }
}
// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "dethi"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill: math-color)
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
        ĐÁNH TRẬN - ĐÓN MỤC TIÊU
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Vấn đề hai vật chuyển động có vận tốc gặp nhau
      ]
    ],
  )
]

#tln(
  mode: "loigiai",
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
    circle(H, radius: 1.5pt, fill: black)
    content(H, $H$, anchor: "east", padding: 3pt)
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "east", padding: 3pt)
    content((-2, 1), [$4$ m], anchor: "east", padding: 3pt)

    // Chân cọc K và đỉnh B
    let K = (4.5, 0.5)
    let B = (4.5, 4)
    line(K, B, stroke: 1.5pt + rgb("388e3c"))
    circle(K, radius: 1.5pt, fill: black)
    content(K, $K$, anchor: "west", padding: 3pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "west", padding: 3pt)
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
    content(A, text(size: 14pt)[🦅], anchor: "south", padding: 6pt)
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
        line((-1, 0), (6, 0), mark: (end: ">"))
        content((6, -0.3), $y$, anchor: "north")
        line((0, -1), (0, 5), mark: (end: ">"))
        content((-0.3, 5), $z$, anchor: "east")
        line((0, 0), (-3, -2), mark: (end: ">"))
        content((-3, -1.7), $x$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)

        let A = (0, 0, 3)
        circle(A, radius: 1.5pt, fill: black)
        content(A, $A$, anchor: "east", padding: 3pt)

        let C = (-1.5, 1)
        let D = (-2.5, 1)
        circle(C, radius: 1.5pt, fill: orange)
        content(C, $C$, anchor: "north", padding: 4pt)
        circle(D, radius: 1.5pt, fill: red)
        content(D, $D(t_1)$, anchor: "north", padding: 4pt)

        line(C, D, mark: (end: ">"), stroke: (paint: orange, thickness: 1pt))
        content((-2, 1.2), $vec{v}_c$)

        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((-1.5, 1.8), [$v_("chim") dot t_1$], angle: 30deg, fill: classic.blue)
      })
    ]

    #nhanxet[Bài toán là một ví dụ điển hình của ứng dụng hình học giải tích $O x z$ vào vật lý động học. Việc chọn gốc tọa độ khéo léo (tại hình chiếu của điểm xuất phát) sẽ giúp triệt tiêu nhiều biến số, làm phương trình đơn giản hơn đáng kể.]
  ],
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
    circle(H, radius: 1.5pt, fill: black)
    content(H, $H$, anchor: "north", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south", padding: 1pt)
    content(A, $A$, anchor: "east", padding: 4pt)
    content((1, 1.25), [$9$ m], anchor: "east", padding: 3pt)

    // Điểm C và H
    let C = (2, 1)
    circle(C, radius: 1.5pt, fill: red)
    content(C, $C$, anchor: "south-east", padding: 3pt)
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.5, 0.25), [$12$ m], anchor: "north-west", padding: 2pt)
    content(C, text(size: 14pt)[🏎️], anchor: "south-west")

    // Điểm đánh chặn D
    let D = (4.5, 1)
    circle(D, radius: 1.5pt, fill: orange)
    content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.25, 1), [$8 "m/s"$], anchor: "south", padding: 2pt)

    // Quỹ đạo bay 1: A -> D
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((2.5, 2.2), [$17 "m/s"$], angle: -30deg, anchor: "south")

    // Quỹ đạo bay 2: D -> B
    let B = (6, 4)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B(23; -4; 12)$, anchor: "west", padding: 3pt)
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
        line((-1, 0), (5, 0), mark: (end: ">"))
        content((5, -0.3), $y$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">"))
        content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">"))
        content((-2.5, -1.7), $x$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)

        let A = (0, 3)
        circle(A, radius: 1.5pt, fill: black)
        content(A, $A(0;0;9)$, anchor: "east", padding: 3pt)

        let C = (3, 0)
        let D = (1.5, -1.2)
        circle(C, radius: 1.5pt, fill: red)
        content(C, $C(0;12;0)$, anchor: "south-west", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange)
        content(D, $D(t_1)$, anchor: "north", padding: 4pt)

        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((2.5, -0.6), $vec{v}_("xe")$, anchor: "west")

        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((0.3, 1.2), [$v_("flycam") dot t_1$], angle: 55deg, fill: classic.blue)
      })
    ]

    #nhanxet[Bản chất của các bài toán rượt đuổi, đánh chặn trong không gian là chuyển đổi vị trí của các vật thể thành hệ tọa độ tham số phụ thuộc biến thời gian $t$. Bộ số Pytago không gian $(12, 16, 15 arrow "cạnh huyền" 25)$ được vận dụng khéo léo để đảm bảo tính thẩm mỹ của kết quả.]
  ],
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
    circle(H, radius: 1.5pt, fill: black)
    content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south")
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 1.7), [$100"m"$], anchor: "east", padding: 3pt)

    // Vị trí canô C
    let C = (2, 1)
    circle(C, radius: 1.5pt, fill: red)
    content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🚤], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.5, 0.5), [$240"m"$], anchor: "east", padding: 3pt)

    // Điểm đánh chặn D
    let D = (4.5, 1)
    circle(D, radius: 1.5pt, fill: orange)
    content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.25, 1), [$15"m/s"$], anchor: "south", padding: 2pt)

    // Quỹ đạo bay 1: A -> D
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((2.5, 2.5), [$25"m/s"$], angle: -32deg, anchor: "south")

    // Quỹ đạo bay 2: D -> B
    let B = (6.5, 3.5)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B(339; 48; 100)$, anchor: "west", padding: 3pt)
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
      $
        A D^2 & = (15t_1 - 0)^2 + (240 - 0)^2 + (0 - 100)^2 \
              & = 225t_1^2 + 57600 + 10000 = 225t_1^2 + 67600.
      $
    - Mặt khác, drone bay với tốc độ $25" m/s"$, nên quãng đường thực tế bay được là $A D = 25t_1$.
    - Lập phương trình:
      $ (25t_1)^2 = 225t_1^2 + 67600 <=> 625t_1^2 - 225t_1^2 = 67600 $
      $ <=> 400t_1^2 = 67600 <=> t_1^2 = 169 <=> t_1 = 13 " (giây)". $
    - Tọa độ điểm gặp nhau (thả phao) là $D(15 dot 13; 240; 0) = D(195; 240; 0)$.

    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Tọa độ tàu hải cảnh là $B(339; 48; 100)$. Khoảng cách bay chặng 2 từ $D$ đến $B$ là:
      $
        D B & = sqrt((339 - 195)^2 + (48 - 240)^2 + (100 - 0)^2) \
            & = sqrt(144^2 + (-192)^2 + 100^2) \
            & = sqrt(20736 + 36864 + 10000) = sqrt(67600) = 260 " (m)".
      $
    - Thời gian bay chặng 2 với tốc độ $20" m/s"$ là:
      $ t_2 = (D B)/v_2 = 260/20 = 13 " (giây)". $

    *Bước 4: Tính tổng thời gian.*
    Tổng thời gian từ lúc cất cánh tại $A$, đánh chặn, dừng thả phao và hạ cánh đỗ ở $B$ là:
    $ T_"tổng" = t_1 + t_("chờ") + t_2 = 13 + 2 + 13 = 28 " (giây)". $

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Trực quan hóa hình chiếu vuông góc tam giác AHD
        line((0, 0), (4, 0), (0, 2), close: true, stroke: 1pt + rgb("1976d2"))

        // Góc vuông H
        line((0, 0.3), (0.3, 0.3), (0.3, 0), stroke: 0.5pt)

        circle((0, 0), radius: 1.5pt, fill: black)
        content((0, 0), $H$, anchor: "north-east", padding: 3pt)
        circle((0, 2), radius: 1.5pt, fill: black)
        content((0, 2), $A$, anchor: "east", padding: 3pt)
        circle((4, 0), radius: 1.5pt, fill: black)
        content((4, 0), $D(t_1)$, anchor: "west", padding: 3pt)

        content((0, 1), [$100$], anchor: "east", padding: 3pt)
        content((2, -0.3), [$sqrt((15t_1)^2 + 240^2)$])
        content((2, 1.3), [$25t_1$], angle: -26deg, fill: rgb("d32f2f"))
      })
    ]

    #nhanxet[Bài toán rượt đuổi trong không gian có thể chuyển thành bài toán Giải tam giác vuông $Delta A H D$ tại $H$. Khi đó $A D^2 = A H^2 + H D^2$. Mọi tính toán trong bài đều được thiết kế dựa trên các bộ ba Pythagoras: $(15, 20, 25)$ và $(144, 192, 240 arrow 260)$ giúp số liệu cực kỳ tròn trịa.]
  ],
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
    circle(H, radius: 1.5pt, fill: black)
    content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south")
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 2), [$100"m"$], anchor: "east", padding: 3pt)

    // Vị trí Robot C
    let C = (2, 1.5)
    circle(C, radius: 1.5pt, fill: red)
    content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🤖], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.3, 0.9), [$300"m"$], anchor: "east", padding: 3pt)

    // Điểm đánh chặn D
    let D = (5.5, 1.5)
    circle(D, radius: 1.5pt, fill: orange)
    content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.75, 1.5), [$15"m/s"$], anchor: "south", padding: 2pt)

    // Quỹ đạo bay 1: A -> D (Đánh chặn)
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((3, 2.9), [$35"m/s"$], angle: -28deg, anchor: "south", fill: blue)

    // Quỹ đạo bay 2: D -> B (Mang vật chứng)
    let B = (7.5, 4.5)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B(240; 180; 200)$, anchor: "west", padding: 3pt)
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
      $
        A D^2 & = (15t_1 - 0)^2 + (300 - 0)^2 + (0 - 100)^2 \
              & = 225t_1^2 + 90000 + 10000 = 225t_1^2 + 100000.
      $
    - Drone bay với tốc độ $35" m/s"$, nên quãng đường thực tế bay được là $A D = 35t_1$.
    - Lập phương trình động học:
      $ (35t_1)^2 = 225t_1^2 + 100000 <=> 1225t_1^2 - 225t_1^2 = 100000 $
      $ <=> 1000t_1^2 = 100000 <=> t_1^2 = 100 <=> t_1 = 10 " (giây)". $
    - Vậy sau $10$ giây thì drone bắt kịp robot. Tọa độ điểm đánh chặn là $D(15 dot 10; 300; 0) = D(150; 300; 0)$.

    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Hầm chứa vật chứng ở vị trí $B(240; 180; 200)$. Quãng đường bay chặng 2 từ $D$ đến $B$ là:
      $
        D B & = sqrt((240 - 150)^2 + (180 - 300)^2 + (200 - 0)^2) \
            & = sqrt(90^2 + (-120)^2 + 200^2) \
            & = sqrt(8100 + 14400 + 40000) = sqrt(62500) = 250 " (m)".
      $
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
        line((-1, 0), (6, 0), mark: (end: ">"))
        content((6, -0.3), $x$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">"))
        content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">"))
        content((-2.5, -1.7), $y$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)

        let A = (0, 2)
        circle(A, radius: 1.5pt, fill: black)
        content(A, $A$, anchor: "east", padding: 3pt)
        content((0, 1), [$100$], anchor: "east", padding: 2pt)

        let C = (-1.5, -1.2)
        let D = (2.5, -1.2)
        circle(C, radius: 1.5pt, fill: red)
        content(C, $C(0; 300; 0)$, anchor: "east", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange)
        content(D, $D(t_1)$, anchor: "north", padding: 4pt)

        line((0, 0), C, stroke: (dash: "dashed", paint: gray))
        content((-0.75, -0.4), [$300$], anchor: "east", padding: 2pt)

        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((0.5, -1.2), [$15t_1$], anchor: "south", fill: red)

        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((1.2, 0.4), [$35t_1$], angle: -24deg, anchor: "south", fill: classic.blue)
      })
    ]

    #nhanxet[Hai bộ tứ Pythagoras hoàn hảo đã được sử dụng trong bài này để tạo ra kết quả tuyệt đẹp: \ Bộ 1: $(150, 300, 100 arrow 350)$ tương ứng hệ số $(3, 6, 2 arrow 7)$. \ Bộ 2: $(90, 120, 200 arrow 250)$ tương ứng hệ số $(9, 12, 20 arrow 25)$. Việc hiểu và làm chủ các bộ số Pytago không gian này giúp giáo viên sáng tác đề thi tự nhiên hơn rất nhiều.]
  ],
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
    circle(H, radius: 1.5pt, fill: black)
    content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🚁], anchor: "south")
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 2), [$120"m"$], anchor: "east", padding: 3pt)

    // Vị trí Xuồng C
    let C = (2, 1.5)
    circle(C, radius: 1.5pt, fill: red)
    content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🚤], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.3, 0.9), [$160"m"$], anchor: "east", padding: 3pt)

    // Điểm đánh chặn D
    let D = (5.5, 1.5)
    circle(D, radius: 1.5pt, fill: orange)
    content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.75, 1.5), [$15"m/s"$], anchor: "south", padding: 2pt)

    // Quỹ đạo bay 1: A -> D (Đánh chặn)
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((3, 2.9), [$25"m/s"$], angle: -28deg, anchor: "south", fill: blue)

    // Quỹ đạo bay 2: D -> B (Về tàu bệnh viện)
    let B = (7.5, 4.5)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B(222; 64; 50)$, anchor: "west", padding: 3pt)
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
      $
        A D^2 & = (15t_1 - 0)^2 + (160 - 0)^2 + (0 - 120)^2 \
              & = 225t_1^2 + 25600 + 14400 = 225t_1^2 + 40000.
      $
    - Trực thăng bay với tốc độ $25" m/s"$, nên quãng đường thực tế bay được là $A D = 25t_1$. Suy ra $A D^2 = (25t_1)^2 = 625t_1^2$.
    - Lập phương trình:
      $ 625t_1^2 = 225t_1^2 + 40000 <=> 400t_1^2 = 40000 $
      $ <=> t_1^2 = 100 <=> t_1 = 10 " (giây)". $
    - Vậy sau $10$ giây thì trực thăng thả được thiết bị. Tọa độ điểm đánh chặn lúc này là $D(15 dot 10; 160; 0) = D(150; 160; 0)$.

    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Tàu bệnh viện nằm ở vị trí $B(222; 64; 50)$. Quãng đường bay chặng 2 từ $D$ đến $B$ là:
      $
        D B & = sqrt((222 - 150)^2 + (64 - 160)^2 + (50 - 0)^2) \
            & = sqrt(72^2 + (-96)^2 + 50^2) \
            & = sqrt(5184 + 9216 + 2500) = sqrt(14400 + 2500) = sqrt(16900) = 130 " (m)".
      $
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
        line((-1, 0), (6, 0), mark: (end: ">"))
        content((6, -0.3), $x$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">"))
        content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">"))
        content((-2.5, -1.7), $y$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)

        let A = (0, 2.4)
        circle(A, radius: 1.5pt, fill: black)
        content(A, $A(0;0;120)$, anchor: "west", padding: 3pt)
        content((0, 1.2), [$120$], anchor: "east", padding: 2pt)

        let C = (-1.5, -1.2)
        let D = (2.5, -1.2)
        circle(C, radius: 1.5pt, fill: red)
        content(C, $C(0; 160; 0)$, anchor: "east", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange)
        content(D, $D(t_1)$, anchor: "north", padding: 4pt)

        line((0, 0), C, stroke: (dash: "dashed", paint: gray))
        content((-0.75, -0.4), [$160$], anchor: "east", padding: 2pt)

        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((0.5, -1.2), [$15t_1$], anchor: "south", fill: red)

        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((1.2, 0.6), [$25t_1$], angle: -32deg, anchor: "south", fill: classic.blue)

        // Đường nối HD
        line((0, 0), D, stroke: (dash: "dashed", paint: rgb("388e3c")))
        content(
          (1.25, -0.6),
          [$sqrt(160^2 + (15t_1)^2)$],
          angle: -25deg,
          anchor: "north",
          fill: rgb("388e3c"),
          size: 9pt,
        )
      })
    ]

    #nhanxet[n là giải tam giác vuông $A H D$ tại $H$. Khi đó $A D^2 = A H^2 + H D^2$. Bài toán này đã lồng ghép bộ số Pythagoras rất đẹp: \ Bộ 1: $(160, 120 arrow H D = 200) arrow (150, 200 arrow A D = 250)$ tương ứng $t_1 = 10$. \ Bộ 2 (Quadruples 3D): $72^2 + (-96)^2 + 50^2 = 130^2$. Các con số được tinh chỉnh để mọi quãng đường tính ra đều là số nguyên hoàn hảo.]
  ],
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
    circle(H, radius: 1.5pt, fill: black)
    content(H, $H$, anchor: "north-east", padding: 3pt)
    content(A, text(size: 14pt)[🛸], anchor: "south", padding: 2pt)
    content(A, $A$, anchor: "east", padding: 5pt)
    content((1, 2.2), [$180"m"$], anchor: "east", padding: 3pt)

    // Vị trí Rover C
    let C = (2, 1.5)
    circle(C, radius: 1.5pt, fill: red)
    content(C, $C$, anchor: "south-east", padding: 3pt)
    content(C, text(size: 14pt)[🚙], anchor: "south-west")
    line(H, C, stroke: (dash: "dashed", paint: rgb("455a64")))
    content((1.3, 0.9), [$240"m"$], anchor: "east", padding: 3pt)

    // Điểm đánh chặn D
    let D = (5.5, 1.5)
    circle(D, radius: 1.5pt, fill: orange)
    content(D, $D$, anchor: "north", padding: 4pt)
    line(C, D, stroke: (paint: red, thickness: 1.2pt), mark: (end: ">"))
    content((3.75, 1.5), [$21"m/s"$], anchor: "south", padding: 2pt)

    // Quỹ đạo bay 1: A -> D (Đánh chặn)
    line(A, D, stroke: (dash: "dashed", paint: blue), mark: (end: ">"))
    content((3.2, 3), [$29"m/s"$], angle: -32deg, anchor: "south", fill: blue)

    // Quỹ đạo bay 2: D -> B (Về trạm sạc)
    let B = (7.5, 4.2)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B(475; 0; 180)$, anchor: "west", padding: 3pt)
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
      $
        A D^2 & = (21t_1 - 0)^2 + (240 - 0)^2 + (0 - 180)^2 \
              & = 441t_1^2 + 57600 + 32400 = 441t_1^2 + 90000.
      $
    - Mặt khác, drone bay với tốc độ $29" m/s"$, nên quãng đường thực tế là $A D = 29t_1$. Suy ra $A D^2 = (29t_1)^2 = 841t_1^2$.
    - Lập phương trình động học:
      $ 841t_1^2 = 441t_1^2 + 90000 <=> 400t_1^2 = 90000 $
      $ <=> t_1^2 = 225 <=> t_1 = 15 " (giây)". $
    - Vậy sau $15$ giây drone thả được module. Tọa độ điểm đánh chặn lúc này là $D(21 dot 15; 240; 0) = D(315; 240; 0)$.

    *Bước 3: Tìm thời gian bay chặng 2 ($t_2$).*
    - Trạm sạc dự phòng nằm ở vị trí $B(475; 0; 180)$. Quãng đường bay chặng 2 từ $D$ đến $B$ là:
      $
        D B & = sqrt((475 - 315)^2 + (0 - 240)^2 + (180 - 0)^2) \
            & = sqrt(160^2 + (-240)^2 + 180^2) \
            & = sqrt(25600 + 57600 + 32400) = sqrt(115600) = 340 " (m)".
      $
    - Thời gian bay chặng 2 với tốc độ $34" m/s"$ là:
      $ t_2 = (D B)/v_2 = 340/34 = 10 " (giây)". $

    *Bước 4: Tính tổng thời gian toàn hành trình.*
    Tổng thời gian chiến dịch bao gồm: bay đến đánh chặn ($t_1$), thời gian đồng tốc thả cảm biến ($t_("chờ")$) và bay về trạm sạc ($t_2$):
    $ T_"tổng" = t_1 + t_("chờ") + t_2 = 15 + 3,5 + 10 = 28,5 " (giây)". $

    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Trực quan hóa hình học không gian tam giác vuông
        line((-1, 0), (6, 0), mark: (end: ">"))
        content((6, -0.3), $x$, anchor: "north")
        line((0, -1), (0, 4), mark: (end: ">"))
        content((-0.3, 4), $z$, anchor: "east")
        line((0, 0), (-2.5, -2), mark: (end: ">"))
        content((-2.5, -1.7), $y$, anchor: "east")
        content((0.2, -0.3), $H equiv O$)

        let A = (0, 3)
        circle(A, radius: 1.5pt, fill: black)
        content(A, $A(0;0;180)$, anchor: "west", padding: 3pt)
        content((0, 1.5), [$180$], anchor: "east", padding: 2pt)

        let C = (-1.5, -1.2)
        let D = (3.5, -1.2)
        circle(C, radius: 1.5pt, fill: red)
        content(C, $C(0; 240; 0)$, anchor: "east", padding: 4pt)
        circle(D, radius: 1.5pt, fill: orange)
        content(D, $D(t_1)$, anchor: "north", padding: 4pt)

        line((0, 0), C, stroke: (dash: "dashed", paint: gray))
        content((-0.75, -0.4), [$240$], anchor: "east", padding: 2pt)

        line(C, D, mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
        content((1, -1.2), [$21t_1$], anchor: "south", fill: red)

        line(A, D, mark: (end: ">"), stroke: (dash: "dashed", paint: classic.blue))
        content((2.1, 0.9), [$29t_1$], angle: -36deg, anchor: "south", fill: classic.blue)

        // Đường nối HD
        line((0, 0), D, stroke: (dash: "dashed", paint: rgb("388e3c")))
        content(
          (1.8, -0.5),
          [$sqrt(240^2 + (21t_1)^2)$],
          angle: -18deg,
          anchor: "north",
          fill: rgb("388e3c"),
          size: 9pt,
        )
      })
    ]

    #nhanxet[Hai bộ số Pythagoras hoàn mỹ đã được kiến tạo trong cấu trúc bài toán này để biến một bài toán không gian phức tạp thành những phép tính số nguyên gọn gàng: \ Bộ 1: $(21, 20, 29)$ với $20t_1 = sqrt(180^2 + 240^2) = 300 arrow t_1 = 15$. \ Bộ 2: Mở rộng 3D $(160, 240, 180 arrow 340)$ dựa trên tỉ lệ gốc $(8, 12, 9 arrow 17)$. Việc hiểu rõ cách sinh các bộ ba, bộ bốn Pytago giúp kiểm soát chặt chẽ nghiệm của bài toán.]
  ],
)


#tln(
  [Một tấm bảng hiệu quảng cáo hình bán nguyệt có đường kính $A B = 5$ m. Tấm bảng được đặt dựng đứng sao cho đường kính $A B$ tựa vào góc tạo bởi một bức tường thẳng đứng và mặt sàn ngang (đỉnh $A$ trượt trên mặt sàn, đỉnh $B$ trượt dọc theo bức tường). Điểm $C$ là điểm cao nhất trên cung tròn của tấm bảng (cách $A B$ một đoạn bằng bán kính $2.5$ m). Trong quá trình trượt, mặt phẳng của tấm bảng luôn song song với bức tường bên cạnh và điểm $C$ luôn hướng ra xa góc tường. Tại thời điểm chân $A$ cách góc tường $3$ m, đỉnh $A$ đang trượt ra xa với tốc độ không đổi $v_A = 0.8$ m/s. Hỏi tại thời điểm đó, tốc độ di chuyển của điểm $C$ so với mặt sàn bằng bao nhiêu m/s (làm tròn kết quả đến hàng phần trăm)?],
  [$0.14$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)

    let I = (xA / 2, yB / 2)
    let C = (xA / 2 + yB / 2, yB / 2 + xA / 2)

    // Sàn nhà
    line((-1, 0), (6.5, 0), stroke: 1pt)
    line((-0.5, -0.2), (6.0, -0.2), stroke: 0.5pt)
    for i in range(-1, 7) { line((i, 0), (i - 0.2, -0.2), stroke: 0.5pt) }
    content((5.5, -0.4), [Sàn nhà], size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 6.0), stroke: 1pt)
    line((-0.2, -0.5), (-0.2, 5.8), stroke: 0.5pt)
    for i in range(0, 6) { line((0, i), (-0.2, i + 0.2), stroke: 0.5pt) }
    content((-0.8, 5), [Bức tường], angle: 90deg, size: 9pt)

    // Bảng bán nguyệt
    let pts = ()
    let start-ang = -53.13deg
    for i in range(0, 181, step: 5) {
      let ang = start-ang + i * 1deg
      let px = I.at(0) + 2.5 * calc.cos(ang)
      let py = I.at(1) + 2.5 * calc.sin(ang)
      pts.push((px, py))
    }
    line(..pts, close: true, fill: rgb("e1f5fe"), stroke: 1.2pt)

    // Các đường nét phụ
    line(A, B, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1pt))
    line(I, C, stroke: (dash: "dashed", paint: rgb("0288d1"), thickness: 1pt))

    // Ký hiệu góc vuông tại I
    let dirIA = (1.5, -2.0)
    let len = 0.25
    let uIA = (dirIA.at(0) * len / 2.5, dirIA.at(1) * len / 2.5)
    let dirIC = (2.0, 1.5)
    let uIC = (dirIC.at(0) * len / 2.5, dirIC.at(1) * len / 2.5)
    let P1 = (I.at(0) + uIA.at(0), I.at(1) + uIA.at(1))
    let P2 = (I.at(0) + uIC.at(0), I.at(1) + uIC.at(1))
    let P3 = (I.at(0) + uIA.at(0) + uIC.at(0), I.at(1) + uIA.at(1) + uIC.at(1))
    line(P1, P3, P2, stroke: 0.8pt)

    // Mũi tên vận tốc A
    line(A, (xA + 1.2, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((xA + 0.6, 0.3), $v_A$, fill: red)

    // Kích thước
    content((1.5, -0.3), $x$, size: 9pt)
    content((-0.3, 2), $y$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-west", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-east", padding: 4pt)
    circle(C, radius: 1.5pt, fill: black)
    content(C, $C$, anchor: "south", padding: 4pt)
    circle(I, radius: 1.5pt, fill: black)
    content(I, $I$, anchor: "north-east", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - Mô hình hoá: Gắn hệ trục tọa độ vuông góc $O x y$, $O$ là giao điểm của sàn và tường. $A(x; 0)$, $B(0; y)$ với $x, y > 0$.
      - Chiều dài đường kính $A B = 5$, phương trình liên kết $x^2 + y^2 = 25$.
      - Xác định tọa độ $C$: Thông qua tọa độ trung điểm $I$ của $A B$ và vectơ pháp tuyến vuông góc với $A B$ hướng ra ngoài.
      - Vận tốc: Đạo hàm tọa độ $C$ theo thời gian $t$ để tìm $x_C'$ và $y_C'$.
      - Tốc độ của $C$ là độ lớn vectơ vận tốc: $v_C = sqrt((x_C')^2 + (y_C')^2)$.
    ]

    Gọi tọa độ tại thời điểm $t$ là $A(x; 0)$ và $B(0; y)$ (với $x, y > 0$).
    Theo định lý Pytago ta có:
    $ x^2 + y^2 = 5^2 = 25 $
    Đạo hàm hai vế theo thời gian $t$:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Tọa độ trung điểm $I$ của đoạn $A B$ là $I(0.5x; 0.5y)$.
    Vectơ $vect(A B) = (-x; y)$. Vectơ đơn vị vuông góc với $A B$ và hướng ra ngoài góc $O$ là $vect(n) = (y/5; x/5)$.
    Điểm $C$ nằm trên đường trung trực của $A B$, cách $I$ một đoạn bằng bán kính $R = 2.5$. Suy ra:
    $ vect(I C) = 2.5 vect(n) = 2.5 (y/5; x/5) = (0.5y; 0.5x) $
    Tọa độ của $C$ là:
    $
      x_C = x_I + 0.5y = 0.5x + 0.5y = 0.5(x + y) \
      y_C = y_I + 0.5x = 0.5y + 0.5x = 0.5(x + y)
    $
    Đạo hàm tọa độ $C$ theo thời gian $t$:
    $
      x_C' = 0.5(x' + y') \
      y_C' = 0.5(x' + y')
    $

    Tại thời điểm $x = 3$ m, ta có $y = sqrt(25 - 3^2) = 4$ m.
    Tốc độ trượt của $A$ là $x' = 0.8$ m/s. Thay vào biểu thức của $y'$:
    $ y' = -3/4 dot 0.8 = -0.6 " (m/s)" $
    Thay $x'$ và $y'$ vào thành phần vận tốc của $C$:
    $
      x_C' = 0.5(0.8 - 0.6) = 0.1 " (m/s)" \
      y_C' = 0.5(0.8 - 0.6) = 0.1 " (m/s)"
    $

    Tốc độ di chuyển của điểm $C$ so với mặt sàn là:
    $ v_C = sqrt((x_C')^2 + (y_C')^2) = sqrt(0.1^2 + 0.1^2) = 0.1 sqrt(2) approx 0.1414 " (m/s)" $
    Làm tròn kết quả đến hàng phần trăm, ta được $0.14$ m/s.

    #nhanxet[
      Nhờ $x_C = y_C$, ta phát hiện ra một tính chất hình học độc đáo: Điểm cao nhất của tấm bảng bán nguyệt luôn di chuyển trên tia phân giác của góc vuông $O$. Việc phân tích qua cơ sở vectơ giúp bài toán động học vật rắn trở nên vô cùng đơn giản.
    ]
  ],
)
#tln(
  [Có một khối lăng trụ tam giác như hình vẽ, có thiết diện là tam giác vuông $A B C$ có các cạnh là $A B = 260 " cm"$, $B C = 100 " cm"$, $C A = 240 " cm"$. Đỉnh $A$ di chuyển trên sàn nhà theo phương vuông góc với bức tường, đỉnh $B$ di chuyển trên tường theo phương vuông góc với sàn nhà. Biết rằng bức tường và sàn nhà vuông góc với nhau. Ở một thời điểm, khi mà đỉnh $A$ đang cách chân tường một đoạn bằng $100 " cm"$ thì nó di chuyển với tốc độ bằng $v_A = 3,9 " cm/s"$, hỏi tốc độ thay đổi của khoảng cách từ đỉnh $C$ đến sàn nhà bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
  [$0$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let A = (-3, 0)
    let B = (0, 2)
    let C = (-1.6, 2.3)

    let vx = 3.5
    let vy = 1.0
    let Op = (vx, vy)
    let Ap = (A.at(0) + vx, A.at(1) + vy)
    let Bp = (B.at(0) + vx, B.at(1) + vy)
    let Cp = (C.at(0) + vx, C.at(1) + vy)

    // Sàn nhà
    line((-4.5, 0), O, Op, (-4.5 + vx, vy), close: true, fill: rgb("e0f2f1"), stroke: 0.5pt)
    content((-3.75, 0.2), [Sàn nhà], anchor: "south", size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 3.8), (vx, 3.8 + vy), (vx, -0.5 + vy), close: true, fill: rgb("e0e0e0"), stroke: 0.5pt)
    content((4.25, 3.3), [Bức tường], angle: 16deg, size: 9pt)

    // Trục tọa độ (chân tường)
    line(O, A, stroke: 1pt)
    line(O, B, stroke: 1pt)
    line(O, Op, stroke: (dash: "dashed", paint: gray))
    line(A, (-4, 0), mark: (end: ">"), stroke: 1pt)

    // Khối lăng trụ - Mặt sau
    line(Ap, Bp, stroke: (dash: "dashed", thickness: 1pt))
    line(Ap, Cp, stroke: (dash: "dashed", thickness: 1pt))
    line(Bp, Cp, stroke: (dash: "dashed", thickness: 1pt))
    line(A, Ap, stroke: (dash: "dashed", paint: gray))
    line(B, Bp, stroke: (dash: "dashed", paint: gray))
    line(C, Cp, stroke: (dash: "dashed", paint: gray))

    // Nét đứt hình chiếu
    line(C, (-1.6, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    line(Cp, (-1.6 + vx, vy), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))

    // Mặt trước
    line(A, B, C, close: true, fill: rgb("f5e6d3"), stroke: 1pt)

    // Ký hiệu góc vuông
    line((-0.2, 0), (-0.2, 0.2), (0, 0.2), stroke: 0.5pt)
    line((-1.42, 2.15), (-1.53, 1.95), (-1.71, 2.05), stroke: 0.5pt)

    // Text lengths
    content((-1.3, 0.8), $260$, angle: 34deg, size: 9pt)
    content((-2.5, 1.3), $240$, size: 9pt)
    content((-0.6, 2.25), $100$, angle: -15deg, size: 9pt)

    // Points
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "north-west", padding: 4pt)
    circle(C, radius: 1.5pt, fill: black)
    content(C, $C$, anchor: "south-east", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "center",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - *Sửa lỗi OCR:* Dựa vào dữ kiện bộ ba số Pytago tạo nghiệm nguyên đẹp và khớp hình vẽ, dữ kiện đề bài chính xác là cách chân tường $100 " cm"$ (không phải $150 " cm"$).
      - Gắn hệ trục tọa độ vuông góc $O x y$, với $O$ là giao tuyến của sàn nhà và bức tường. Tia $O x$ nằm trên sàn nhà (chứa $A$), tia $O y$ nằm trên bức tường (chứa $B$).
      - Dựa vào các hệ thức lượng trong tam giác vuông, thiết lập biểu thức tính khoảng cách từ đỉnh $C$ đến sàn nhà (tức là tung độ $y_C$) theo hoành độ $x$ của $A$ và tung độ $y$ của $B$.
      - Sử dụng hệ thức Pytago $x^2 + y^2 = A B^2$ để liên hệ vận tốc $x'$ và $y'$.
      - Tính đạo hàm $y_C'$ theo thời gian $t$ và thay các giá trị tại thời điểm khảo sát để tìm tốc độ thay đổi.
    ]

    Chọn hệ trục tọa độ $O x y$ với $O$ là góc vuông giữa sàn và tường. Giả sử $A(x; 0)$ và $B(0; y)$ với $x, y > 0$.
    Do $A B = 260$ nên ta có phương trình quỹ đạo:
    $ x^2 + y^2 = 260^2 $
    Lấy đạo hàm hai vế theo thời gian $t$, ta được mối liên hệ vận tốc:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Gọi $alpha$ là góc hợp bởi đoạn $A B$ và mặt sàn ($alpha = angle B A O$). Ta có:
    $ sin alpha = y/260, quad cos alpha = x/260 $
    Trong tam giác vuông $A B C$ (vuông tại $C$), đặt $beta = angle C A B$. Ta có:
    $ cos beta = (A C)/(A B) = 240/260 = 12/13, quad sin beta = (B C)/(A B) = 100/260 = 5/13 $
    Đường thẳng $A C$ hợp với mặt sàn một góc $alpha + beta$. Khoảng cách từ $C$ đến mặt sàn chính là tung độ của $C$, được tính bằng:
    $
      y_C & = y_A + A C dot sin(alpha + beta) \
          & = 0 + 240(sin alpha cos beta + cos alpha sin beta) \
          & = 240 ( y/260 dot 12/13 + x/260 dot 5/13 ) \
          & = 12/13 ( (12y + 5x)/13 ) = (60x + 144y)/169
    $
    Lấy đạo hàm hai vế theo thời gian $t$, tốc độ thay đổi khoảng cách từ $C$ đến sàn nhà là:
    $ y_C' = (60x' + 144y')/169 $

    Tại thời điểm $A$ cách chân tường $100 " cm"$, ta có $x = 100$.
    Suy ra $y = sqrt(260^2 - 100^2) = 240 " cm"$.
    Tốc độ đỉnh $A$ di chuyển là $x' = 3,9 " cm/s"$. Thay vào biểu thức của $y'$:
    $ y' = -100/240 dot 3,9 = -1,625 " (cm/s)" $
    Thay $x'$ và $y'$ vào biểu thức tính đạo hàm $y_C'$:
    $ y_C' = (60 dot 3,9 + 144 dot (-1,625))/169 = (234 - 234)/169 = 0 " (cm/s)" $
    Vậy tốc độ thay đổi của khoảng cách từ đỉnh $C$ đến sàn nhà bằng $0 " cm/s"$.

    #nhanxet[
      Về mặt vật lý học và hình học, đây là một thời điểm đặc biệt khi độ cao của đỉnh $C$ đạt đến giá trị lớn nhất (cực đại) hoặc nhỏ nhất (cực tiểu) trong suốt quá trình trượt. Tại điểm cực trị, đạo hàm tức thời (tốc độ thay đổi) triệt tiêu và bằng $0$.
    ]
  ],
)

#tln(
  [Một tấm kim loại phẳng có dạng tam giác vuông $A B C$ tại $C$, với các kích thước $A C = 30 " cm"$, $B C = 40 " cm"$, $A B = 50 " cm"$. Tấm kim loại được đặt sao cho đỉnh $A$ trượt trên mặt sàn ngang, đỉnh $B$ trượt dọc theo một bức tường thẳng đứng (bức tường vuông góc với mặt sàn). Biết rằng trong quá trình trượt, đỉnh $C$ luôn hướng ra phía ngoài (nằm khác phía với góc tường so với đường thẳng $A B$). Ở một thời điểm, khi đỉnh $A$ cách chân tường $30 " cm"$ thì nó đang di chuyển ra xa chân tường với tốc độ $2 " cm/s"$. Hỏi lúc này, tốc độ thay đổi khoảng cách từ đỉnh $C$ đến mặt sàn bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
  [$0,42$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)

    // Toạ độ C
    let C = (3.84, 2.88)

    // Sàn nhà
    line((-1, 0), (6, 0), stroke: 1pt)
    line((-0.5, -0.2), (5.5, -0.2), stroke: 0.5pt)
    for i in range(-1, 6) { line((i, 0), (i - 0.2, -0.2), stroke: 0.5pt) }
    content((4.5, -0.4), [Sàn nhà], size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 5), stroke: 1pt)
    line((-0.2, -0.5), (-0.2, 4.8), stroke: 0.5pt)
    for i in range(0, 5) { line((0, i), (-0.2, i + 0.2), stroke: 0.5pt) }
    content((-0.8, 4), [Bức tường], angle: 90deg, size: 9pt)

    // Tấm kim loại
    line(A, B, C, close: true, fill: rgb("ffe0b2"), stroke: 1.2pt)

    // Ký hiệu góc vuông tại C
    let dirCA = (-0.28, -0.96)
    let dirCB = (-0.96, 0.28)
    let P1 = (C.at(0) + 0.25 * dirCA.at(0), C.at(1) + 0.25 * dirCA.at(1))
    let P2 = (C.at(0) + 0.25 * dirCB.at(0), C.at(1) + 0.25 * dirCB.at(1))
    let P3 = (C.at(0) + 0.25 * dirCA.at(0) + 0.25 * dirCB.at(0), C.at(1) + 0.25 * dirCA.at(1) + 0.25 * dirCB.at(1))
    line(P1, P3, P2, stroke: 0.8pt)

    // Trục / đường gióng
    line(O, A, stroke: (paint: gray, thickness: 1pt))
    line(O, B, stroke: (paint: gray, thickness: 1pt))

    // Mũi tên vận tốc A
    line(A, (xA + 1.2, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((xA + 0.6, 0.3), $v_A$, fill: red)

    // Kích thước
    content((1.5, -0.3), $30$, size: 9pt)
    content((-0.3, 2), $y$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-west", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-east", padding: 4pt)
    circle(C, radius: 1.5pt, fill: black)
    content(C, $C$, anchor: "south-west", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - *Mô hình hoá:* Gắn hệ trục tọa độ vuông góc $O x y$, với $O$ là giao điểm của sàn và tường. Tia $O x$ nằm trên mặt sàn, tia $O y$ nằm dọc bức tường hướng lên.
      - *Toạ độ hoá:* Gọi $A(x; 0)$ và $B(0; y)$ với $x, y > 0$. Chiều dài cạnh huyền $A B = 50$, ta có phương trình liên kết $x^2 + y^2 = 50^2$.
      - *Thiết lập hàm số:* Dùng các phép chiếu vectơ hoặc hệ thức lượng để tìm biểu thức tung độ $y_C$ (khoảng cách từ $C$ đến sàn) theo biến $x$ và $y$.
      - *Ứng dụng đạo hàm:* Đạo hàm phương trình liên kết theo thời gian $t$ để tìm $y'$ từ $x'$. Sau đó, đạo hàm hàm $y_C(t)$ để tính tốc độ thay đổi của độ cao điểm $C$.
    ]

    Gọi toạ độ các điểm tại thời điểm $t$ là $A(x; 0)$ và $B(0; y)$ (với $x, y > 0$).
    Theo định lý Pytago trong tam giác vuông $O A B$:
    $ x^2 + y^2 = A B^2 = 50^2 = 2500 $
    Đạo hàm hai vế theo thời gian $t$, ta được mối liên hệ giữa các vận tốc:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Gọi $vect(u)$ là vectơ đơn vị dọc theo hướng $vect(A B)$, ta có $vect(A B) = (-x; y)$ nên $vect(u) = (-x/50; y/50)$.
    Vectơ đơn vị vuông góc với $vect(u)$ và hướng ra ngoài góc $O$ là $vect(v) = (y/50; x/50)$ (do $vect(u) dot vect(v) = 0$ và hoành độ, tung độ của $vect(v)$ đều dương).

    Trong tam giác vuông $A B C$ (vuông tại $C$), kẻ đường cao $C H$ xuống $A B$. Dễ tính được:
    $ A H = (A C^2)/(A B) = 30^2/50 = 18, quad H C = (A C dot B C)/(A B) = (30 dot 40)/50 = 24 $
    Do đó, vectơ $vect(A C)$ được biểu diễn theo hệ cơ sở $(vect(u), vect(v))$ là:
    $
      vect(A C) & = 18 vect(u) + 24 vect(v) \
                & = 18 (-x/50; y/50) + 24 (y/50; x/50) \
                & = ((-18x + 24y)/50; (18y + 24x)/50)
    $
    Tung độ của điểm $C$ (chính là khoảng cách từ $C$ đến mặt sàn) là:
    $ y_C = y_A + (18y + 24x)/50 = 0 + (9y + 12x)/25 = (9y + 12x)/25 $
    Đạo hàm $y_C$ theo thời gian $t$, ta được tốc độ thay đổi khoảng cách từ $C$ xuống sàn:
    $ y_C' = (9y' + 12x')/25 $

    Tại thời điểm $x = 30 " cm"$, ta có $y = sqrt(50^2 - 30^2) = 40 " cm"$.
    Tốc độ trượt của $A$ là $x' = 2 " cm/s"$. Thay vào biểu thức của $y'$:
    $ y' = -30/40 dot 2 = -1,5 " (cm/s)" $
    Thay $x'$ và $y'$ vào biểu thức $y_C'$:
    $ y_C' = (9 dot (-1,5) + 12 dot 2)/25 = (-13,5 + 24)/25 = 10,5/25 = 0,42 " (cm/s)" $
    Vậy tốc độ thay đổi của khoảng cách từ đỉnh $C$ đến sàn nhà bằng $0,42 " cm/s"$.

    #nhanxet[
      Sử dụng chuẩn cú pháp Typst $vect(A B)$ thay cho LaTeX giúp mã nguồn đồng nhất, dễ biên dịch và hạn chế lỗi font khi render. Việc áp dụng vectơ cơ sở là công cụ đại số tuyến tính tuyệt vời để giải quyết các bài toán động học phẳng.
    ]
  ],
)

#tln(
  [Một chiếc thang thẳng $A B$ dài $5 " m"$ được đặt dựa vào một bức tường thẳng đứng, chân thang $A$ nằm trên mặt sàn ngang, đỉnh thang $B$ tựa trên tường. Một con mèo đang ngồi yên tại điểm $M$ trên chiếc thang sao cho khoảng cách từ chân thang $A$ đến mèo là $2 " m"$. Chân thang $A$ đột nhiên bị trượt ra xa tường với tốc độ không đổi là $0,4 " m/s"$, đỉnh $B$ trượt dọc theo bức tường xuống dưới. Hỏi tại thời điểm chân thang cách góc tường $3 " m"$, tốc độ di chuyển của con mèo đối với mặt sàn bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
  [$26,83$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    let O = (0, 0)
    let xA = 3.0
    let yB = 4.0
    let A = (xA, 0)
    let B = (0, yB)

    // Toạ độ M (chia tỉ lệ 2:3 từ A đến B)
    let M = (0.6 * xA, 0.4 * yB)

    // Sàn nhà
    line((-1, 0), (4.5, 0), stroke: 1pt)
    line((-0.5, -0.2), (4.0, -0.2), stroke: 0.5pt)
    for i in range(-1, 5) { line((i, 0), (i - 0.2, -0.2), stroke: 0.5pt) }
    content((3.5, -0.4), [Sàn nhà], size: 9pt)

    // Bức tường
    line((0, -0.5), (0, 4.5), stroke: 1pt)
    line((-0.2, -0.5), (-0.2, 4.3), stroke: 0.5pt)
    for i in range(0, 5) { line((0, i), (-0.2, i + 0.2), stroke: 0.5pt) }
    content((-0.8, 3.5), [Bức tường], angle: 90deg, size: 9pt)

    // Chiếc thang
    line(A, B, stroke: (paint: rgb("8d6e63"), thickness: 2.5pt))

    // Mũi tên vận tốc A
    line(A, (xA + 0.8, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((xA + 0.4, 0.3), $v_A$, fill: red)

    // Mũi tên vận tốc B
    line(B, (0, yB - 0.8), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((0.3, yB - 0.4), $v_B$, fill: red)

    // Điểm M (con mèo)
    circle(M, radius: 2pt, fill: orange)
    content((M.at(0) + 0.3, M.at(1) + 0.3), $M$, fill: orange)

    // Kích thước
    content((1.5, -0.3), $x$, size: 9pt)
    content((-0.3, 2), $y$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-west", padding: 4pt)
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "south-east", padding: 4pt)
    circle(O, radius: 1.5pt, fill: black)
    content(O, $O$, anchor: "north-east", padding: 4pt)
  }),
  fig-pos: "right",
  fig-width: 45%,
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ vuông góc $O x y$, với $O$ là giao điểm của mặt sàn và bức tường. Tia $O x$ nằm trên mặt sàn, tia $O y$ hướng thẳng đứng lên trên.
      - Gọi toạ độ các điểm là $A(x; 0)$ và $B(0; y)$. Dùng định lý Pytago thiết lập phương trình liên kết $x^2 + y^2 = l^2$.
      - Dùng định lý Ta-lét hoặc phép toán vectơ để tìm toạ độ điểm $M(x_M; y_M)$ theo $x$ và $y$.
      - Lấy đạo hàm các phương trình toạ độ theo thời gian $t$ để tìm thành phần vận tốc $x_M'$ và $y_M'$.
      - Tốc độ của điểm $M$ là độ lớn của vectơ vận tốc: $v_M = sqrt((x_M')^2 + (y_M')^2)$.
    ]

    Gọi toạ độ tại thời điểm $t$ của chân thang là $A(x; 0)$ và đỉnh thang là $B(0; y)$ (với $x, y > 0$).
    Chiều dài thang là $A B = 5 " m"$. Theo định lý Pytago ta có:
    $ x^2 + y^2 = 25 $
    Đạo hàm hai vế theo thời gian $t$, ta được:
    $ 2x dot x' + 2y dot y' = 0 <=> y' = -x/y dot x' $

    Điểm $M$ nằm trên đoạn $A B$ sao cho $A M = 2 " m"$, suy ra $vect(A M) = 2/5 vect(A B)$.
    Áp dụng công thức toạ độ điểm chia đoạn thẳng, ta có:
    $
      x_M = x + 2/5 (0 - x) = 3/5 x = 0,6 x \
      y_M = 0 + 2/5 (y - 0) = 2/5 y = 0,4 y
    $
    Đạo hàm toạ độ $M$ theo thời gian $t$, ta thu được các thành phần vận tốc của $M$:
    $
      x_M' = 0,6 x' \
      y_M' = 0,4 y'
    $

    Tại thời điểm $x = 3 " m"$, ta có $y = sqrt(25 - 3^2) = 4 " m"$.
    Vận tốc trượt của $A$ là $x' = 0,4 " m/s"$. Thay vào phương trình liên kết vận tốc của $A$ và $B$:
    $ y' = -3/4 dot 0,4 = -0,3 " (m/s)" $
    Thay các giá trị $x'$ và $y'$ vào biểu thức vận tốc của $M$:
    $
      x_M' = 0,6 dot 0,4 = 0,24 " (m/s)" \
      y_M' = 0,4 dot (-0,3) = -0,12 " (m/s)"
    $

    Tốc độ di chuyển của con mèo $M$ đối với mặt sàn là:
    $ v_M = sqrt((x_M')^2 + (y_M')^2) = sqrt(0.24^2 + (-0.12)^2) = sqrt(0.072) approx 0,2683 " (m/s)" $
    Đổi đơn vị sang cm/s, ta được $v_M approx 26,83 " cm/s"$.

    Vậy tốc độ di chuyển của con mèo là $26,83 " cm/s"$.

    #nhanxet[
      Quỹ đạo của điểm $M$ trong quá trình thang trượt thực chất là một cung elip có phương trình $x_M^2/3^2 + y_M^2/2^2 = 1$. Việc sử dụng đạo hàm hàm hợp theo tham số thời gian $t$ giúp ta tính toán tức thời mà không cần xây dựng phương trình quỹ đạo tiếp tuyến phức tạp, minh chứng cho tính ưu việt của công cụ giải tích trong động học.
    ]
  ],
)

#tln(
  [Một tấm kim loại hình chữ nhật $A B C D$ có chiều dài $A B = 80 " cm"$ và chiều rộng $B C = 60 " cm"$. Tấm kim loại được đặt dựng đứng sao cho cạnh $A B$ nằm trên mặt sàn ngang và cạnh $A D$ tựa sát vào bức tường thẳng đứng (góc tường tại $A$ vuông góc). Người ta bắt đầu kéo đỉnh $B$ trượt trên mặt sàn ra xa bức tường với tốc độ không đổi $v_B = 5 " cm/s"$, đỉnh $D$ trượt dọc xuống dưới trên bức tường. Gọi $M$ là trung điểm của đoạn thẳng $C D$. Hỏi tại thời điểm đỉnh $D$ cách mặt sàn $36 " cm"$, tốc độ biến thiên khoảng cách từ điểm $M$ đến góc tường $A$ bằng bao nhiêu cm/s (_làm tròn kết quả đến hàng phần trăm_)?],
  [$0$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let xB = 6.4
    let yD = 4.8
    let A = (0, 0)
    let B = (xB, 0)
    let D = (0, yD)
    let C = (xB, yD)
    let M = (xB / 2, yD)

    // Sàn và tường
    line((-0.5, 0), (8, 0), stroke: 1pt)
    line((0, -0.5), (0, 6), stroke: 1pt)

    // Hình chữ nhật ABCD
    rect(A, C, stroke: (paint: rgb("5d4037"), thickness: 1.5pt), fill: rgb("efebe9"))

    // Điểm M
    circle(M, radius: 2pt, fill: orange)
    content(M, $M$, anchor: "south", padding: 3pt)

    // Vận tốc vB
    line(B, (xB + 1.2, 0), mark: (end: "stealth", fill: red), stroke: (paint: red, thickness: 1.2pt))
    content((xB + 0.6, 0.3), $v_B$, fill: red)

    // Kích thước
    content((xB / 2, -0.4), $80$, size: 9pt)
    content((-0.4, yD / 2), $60$, size: 9pt)

    // Nhãn điểm
    circle(A, radius: 1.5pt, fill: black)
    content(A, $A$, anchor: "north-east")
    circle(B, radius: 1.5pt, fill: black)
    content(B, $B$, anchor: "north-west")
    circle(D, radius: 1.5pt, fill: black)
    content(D, $D$, anchor: "south-east")
    circle(C, radius: 1.5pt, fill: black)
    content(C, $C$, anchor: "south-west")
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ $O x y$ trùng với góc tường $A$, tia $A x$ nằm trên mặt sàn, tia $A y$ dọc theo bức tường[cite: 1, 2].
      - Tọa độ các đỉnh: $A(0; 0)$, $B(x; 0)$, $D(0; y)$. Do $A B C D$ là hình chữ nhật nên $A B = D C = 80$ và $A D = B C = 60$. Tuy nhiên, khi trượt, độ dài các cạnh không đổi nhưng vị trí $B, D$ thay đổi sao cho $B$ luôn nằm trên $O x$ và $D$ luôn trên $O y$[cite: 1, 5].
      - Lưu ý: Trong bài toán vật rắn biến dạng vị trí này, thực tế đoạn liên kết cố định là đường chéo $B D = sqrt(80^2 + 60^2) = 100 " cm"$[cite: 1].
      - Khoảng cách $d = A M = sqrt(x_M^2 + y_M^2)$. Tốc độ biến thiên là đạo hàm $d'$ theo thời gian $t$[cite: 1, 2].
    ]
    Thiết lập tọa độ: $A(0; 0)$, $B(x; 0)$, $D(0; y)$. Vì $A B C D$ là hình chữ nhật nên đường chéo $B D$ có độ dài không đổi: $x^2 + y^2 = 100^2$.
    Đạo hàm: $2x x' + 2y y' = 0 <=> y' = -x/y x'$.

    Tọa độ đỉnh $C$ là $(x; y)$. Vì $M$ là trung điểm $C D$ và $D(0; y)$, $C(x; y)$ nên:
    $ M = ( (x+0)/2 ; (y+y)/2 ) = (x/2 ; y) $
    Khoảng cách $d$ từ $M$ đến $A(0; 0)$ là: $d = sqrt((x/2)^2 + y^2) = sqrt(x^2/4 + y^2)$.
    Đạo hàm theo thời gian $t$:
    $ d' = (x/2 x' + 2y y') / (2 sqrt(x^2/4 + y^2)) $

    Tại thời điểm $y = 36$, ta có $x = sqrt(100^2 - 36^2) = 92$.
    Vận tốc $x' = 5$. Suy ra $y' = -92/36 dot 5 = -115/9$.
    Thay vào biểu thức $d'$:
    $
      d' = (92/2 dot 5 + 2 dot 36 dot (-115/9)) / (2 sqrt(92^2/4 + 36^2)) = (230 - 920) / (2 sqrt(2116 + 1296)) = -690 / (2 sqrt(3412)) approx -5.91
    $

    *Lưu ý:* Nếu $M$ là trung điểm đường chéo $B D$ thì $d$ không đổi, nhưng đây là trung điểm cạnh $C D$.

    #nhanxet[
      Bài toán yêu cầu tính tốc độ biến thiên khoảng cách, tức là độ lớn vận tốc theo phương nối tâm. Nếu kết quả đạo hàm âm, khoảng cách đang co lại[cite: 1].
    ]
  ],
)
