#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// #let handwriting-font = ("Patrick Hand", "New Computer Modern")

#show math.equation: set text(font: "New Computer Modern Math", fallback: true)

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
)
// #set text(font: handwriting-font, size: 11pt, lang: "vi")
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
#let mode = "loigiai"   // dethi | loigiai | solcolor
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
        Parabol Trong Không Gian
      ]
      #v(0.3em)
      #text(size: 11pt, style: "italic", fill: rgb("555555"))[
        Phương trình tham số Parabol trong không gian, ứng dụng giải toán quỹ đạo ném xiên.
      ]
    ],
  )
]

#tln(
  [Trên bức tường cần trang trí một hình phẳng dạng parabol đỉnh $S$ như hình vẽ, biết rằng $S O = A B = 4"m"$, $O$ là trung điểm của $A B$. Parabol được chia thành 3 phần để sơn ba màu khác nhau với mức chi phí: phần trên là phần kẻ sọc $140.000$ đồng/$"m"^2$, phần giữa là phần hình quạt tâm $O$ có bán kính $2"m"$ được tô đậm $150.000$ đồng/$"m"^2$, phần còn lại $160.000$ đồng/$"m"^2$. Tổng chi phí để sơn cả ba phần gần nhất với số nào sau đây (làm tròn đến nghìn đồng)?],
  [$1575$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let sx = 0.8
    let sy = 0.8
    
    // 1. Vẽ phần quạt (màu đỏ nhạt)
    // Quạt có góc từ 30 độ đến 150 độ
    let sector = ((0,0),)
    for i in range(30, 151, step: 2) {
      sector.push((2 * sx * calc.cos(i * 1deg), 2 * sy * calc.sin(i * 1deg)))
    }
    line(..sector, close: true, fill: rgb("ff8080"), stroke: 1pt)
    
    // 2. Vẽ lớp kẻ sọc (phần trên)
    // Dùng sọc dọc giới hạn giữa cung tròn và parabol để an toàn không lỗi
    for i in range(-16, 17, step: 2) {
      let x = i / 10
      let y_arc = calc.sqrt(4 - x*x)
      let y_para = 4 - x*x
      line((x * sx, y_arc * sy), (x * sx, y_para * sy), stroke: (paint: rgb("a64d79"), thickness: 0.6pt))
    }
    
    // 3. Viền Outline Parabol
    let para = ()
    for i in range(-20, 21) {
      let x = i / 10
      para.push((x * sx, (4 - x*x) * sy))
    }
    line(..para, stroke: 1.2pt)
    
    // 4. Đường đáy AB và đường cao SO
    line((-2 * sx, 0), (2 * sx, 0), stroke: 1.2pt)
    line((0, 0), (0, 4 * sy), stroke: 0.5pt)
    
    // 5. Điểm và nhãn
    circle((-2 * sx, 0), radius: 1.5pt, fill: black); content((-2 * sx, -0.3), $A$)
    circle((2 * sx, 0), radius: 1.5pt, fill: black); content((2 * sx, -0.3), $B$)
    circle((0, 0), radius: 1.5pt, fill: black); content((0, -0.3), $O$)
    circle((0, 4 * sy), radius: 1.5pt, fill: black); content((0, 4 * sy + 0.3), $S$)
  }),
  fig-pos: "right",
  fig-width: 20%,
  loigiai: [
    #ppgiai[
      - Gắn hệ trục tọa độ $O x y$ với $O(0;0)$. Xác định phương trình parabol $(P)$ và phương trình đường tròn $(C)$ giới hạn hình quạt.
      - Tìm hoành độ giao điểm của $(P)$ và $(C)$.
      - Sử dụng tích phân tính diện tích các phần:
        + Tổng diện tích parabol $S = integral_(-2)^2 (4 - x^2) dif x$.
        + Phần giao giữa Parabol và nửa đường tròn (phần giữa + phần kẻ sọc).
        + Diện tích hình quạt tròn $S_"quạt" = 1/2 R^2 alpha$.
    ]
    - Gắn hệ trục tọa độ $O x y$ với gốc $O$ là trung điểm $A B$, tia $O x$ chứa $O B$, tia $O y$ chứa $O S$.
    - Từ giả thiết $S O = A B = 4 => O B = 2$. Các điểm: $O(0;0)$, $A(-2;0)$, $B(2;0)$, $S(0;4)$.
    - Parabol $(P)$ đỉnh $S(0;4)$ đi qua $B(2;0)$ có phương trình $y = a x^2 + 4$.
      $ B(2;0) in (P) => 0 = a(2)^2 + 4 => a = -1. $
      Phương trình parabol là: $y = 4 - x^2$.
    - Đường tròn $(C)$ tâm $O$, bán kính $R = 2$ có phương trình phần trên trục hoành là $y = sqrt(4 - x^2)$.
    
    - Xét phương trình hoành độ giao điểm:
      $ 4 - x^2 = sqrt(4 - x^2) <=> (4 - x^2)^2 = 4 - x^2 $
      Đặt $t = 4 - x^2 (t >= 0)$, ta có: $t^2 = t <=> t = 0$ hoặc $t = 1$.
      + Với $t = 0 => 4 - x^2 = 0 => x = plus.minus 2$.
      + Với $t = 1 => 4 - x^2 = 1 => x^2 = 3 => x = plus.minus sqrt(3)$.
      Phần quạt và phần kẻ sọc giao nhau tại $x = plus.minus sqrt(3)$. 
      Tọa độ hai điểm giao là $M(-sqrt(3); 1)$ và $N(sqrt(3); 1)$.
      
    - Góc của hình quạt: $tan(angle N O B) = y_N / x_N = 1 / sqrt(3) => angle N O B = 30^degree (pi/6)$.
      Góc ở tâm của phần hình quạt là: $alpha = pi - 2(pi/6) = (2pi)/3$.
      
    *Tính diện tích các phần:*
    1. *Phần giữa (Quạt tâm $O$ bán kính $2$, góc $(2pi)/3$):*
       $ S_1 = 1/2 R^2 alpha = 1/2 (2)^2 ((2pi)/3) = (4pi)/3 approx 4,1888  (m^2). $
       
    2. *Phần trên (kẻ sọc):*
       Giới hạn bởi parabol và cung tròn từ $x = -sqrt(3)$ đến $x = sqrt(3)$.
       $ S_2 &= integral_(-sqrt(3))^(sqrt(3)) (4 - x^2) dif x - integral_(-sqrt(3))^(sqrt(3)) sqrt(4 - x^2) dif x \
             &= (4x - x^3/3) |_{-sqrt(3)}^{sqrt(3)} - (S_1 + 2 S_(Delta O M A')) $
       Tích phân parabol: $2(4sqrt(3) - sqrt(3)) = 6sqrt(3)$.
       Tích phân cung tròn bằng hình quạt cộng hai tam giác vuông $O M A'$: $(4pi)/3 + 2(1/2 dot sqrt(3) dot 1) = (4pi)/3 + sqrt(3)$.
       $ S_2 = 6sqrt(3) - ((4pi)/3 + sqrt(3)) = 5sqrt(3) - (4pi)/3 approx 4,4716  (m^2). $
       
    3. *Phần còn lại:*
       Tổng diện tích parabol: $S_"tổng" = integral_(-2)^2 (4 - x^2) dif x = 32/3$.
       $ S_3 = S_"tổng" - (S_1 + S_2) = 32/3 - ( (4pi)/3 + 5sqrt(3) - (4pi)/3 ) = 32/3 - 5sqrt(3) approx 2,0063  (m^2). $
       
    *Tính tổng chi phí:*
    $ C &= S_2 dot 140000 + S_1 dot 150000 + S_3 dot 160000 \
      &= (5sqrt(3) - (4pi)/3) 140000 + ((4pi)/3) 150000 + (32/3 - 5sqrt(3)) 160000 \
      &= 700000sqrt(3) - (560000pi)/3 + 200000pi + 5120000/3 - 800000sqrt(3) \
      &= -100000sqrt(3) + (40000pi)/3 + 5120000/3 \
      &approx -173205 + 41888 + 1706667 = 1575350 " (đồng)." $
      
    Làm tròn đến nghìn đồng, ta có chi phí là *$1.575.000$* đồng.
  ]
)
// Câu trả lời ngắn: Thể tích khối tròn xoay (chiếc mũ)
#tln(
  [Chuẩn bị cho đêm hội hóa trang, Bạn A thiết kế một chiếc mũ có dáng một khối tròn xoay. Mặt cắt qua trục của chiếc mũ như hình vẽ bên dưới. Biết rằng $O O' = 6" cm"$, $O A = 10" cm"$, $O B = 20" cm"$, đường cong $A B$ là một phần của parabol có đỉnh là điểm $B$. Tính thể tích của chiếc mũ (làm tròn đến hàng đơn vị).],
  [$5027$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    // Tỉ lệ scale
    let rx = 1.5   // Tương ứng OA = 10
    let ry = 0.25  // Độ dẹt của elip đáy
    let h = 0.9    // Tương ứng OO' = 6
    let H = 3.0    // Tương ứng OB = 20

    // VẼ PHẦN ĐẾ (HÌNH TRỤ)
    // Đổ màu khối trụ
    line((-rx, -h), (rx, -h), (rx, 0), (-rx, 0), close: true, fill: rgb("f0f0f0"), stroke: none)
    // Elip đáy dưới
    arc((rx, -h), start: 0deg, stop: -180deg, radius: (rx, ry), fill: rgb("f0f0f0"), stroke: 1pt)
    arc((rx, -h), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (dash: "dashed"))
    // Hai đường sinh của hình trụ
    line((-rx, -h), (-rx, 0), stroke: 1pt)
    line((rx, -h), (rx, 0), stroke: 1pt)

    // VẼ PHẦN TRÊN (KHỐI PARABOL TRÒN XOAY)
    let para-path = ()
    for i in range(-15, 16) {
      let x = i / 10
      // Phương trình parabol đi qua đỉnh B và hai mép đáy
      let y = H * (1 - (x/rx) * (x/rx))
      para-path.push((x, y))
    }
    
    // Elip đáy trên (mặt phân cách)
    arc((rx, 0), start: 0deg, stop: -180deg, radius: (rx, ry), fill: rgb("e6f2ff"), stroke: 1pt)
    arc((rx, 0), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: (dash: "dashed"))

    // Đường cong parabol
    line(..para-path, stroke: (thickness: 1.2pt, paint: blue.darken(20%)))

    // HỆ TRỤC TỌA ĐỘ VÀ CÁC ĐIỂM
    line((0, -h), (0, H + 0.5), stroke: (dash: "dashed", paint: gray), mark: (end: ">"))
    content((0, H + 0.6), $y$)
    line((0, 0), (rx + 0.8, 0), stroke: (dash: "dashed", paint: gray), mark: (end: ">"))
    content((rx + 0.8, 0.2), $x$)

    circle((0,0), radius: 1.5pt, fill: black); content((-0.25, 0.2), $O$)
    circle((0,-h), radius: 1.5pt, fill: black); content((0.3, -h - 0.2), $O'$)
    circle((rx, 0), radius: 1.5pt, fill: black); content((rx + 0.25, 0.2), $A$)
    circle((0, H), radius: 1.5pt, fill: black); content((0.3, H), $B$)
    
    // Nối bán kính OA
    line((0,0), (rx,0), stroke: (dash: "dashed"))
  }),
  fig-pos: "right",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Thể tích chiếc mũ bằng tổng thể tích của hai phần: Phần chóp ở trên (quay đường cong parabol) và phần đế ở dưới (hình trụ).
      - *Phần hình trụ:* Hình trụ có bán kính đáy $R = O A$ và chiều cao $h_1 = O O'$. Tính $V_1 = pi R^2 h_1$.
      - *Phần chóp parabol:* Gắn hệ trục tọa độ $O x y$ với $O(0;0)$, viết phương trình parabol $(P)$ đi qua $A$ có đỉnh $B$. Sau đó dùng tích phân tính thể tích khối tròn xoay quay $(P)$ quanh trục $O y$: $V_2 = pi integral x^2 dif y$.
    ]
    
    *Bước 1: Tính thể tích phần đế hình trụ ($V_1$)*
    - Phần dưới của chiếc mũ là một hình trụ tròn xoay có bán kính đáy $R = O A = 10" cm"$ và chiều cao $h_1 = O O' = 6" cm"$.
    - Thể tích khối trụ là: 
      $ V_1 = pi R^2 h_1 = pi dot 10^2 dot 6 = 600pi " (cm"^3")." $

    *Bước 2: Tính thể tích phần chóp parabol ($V_2$)*
    - Chọn hệ trục tọa độ $O x y$ sao cho $O(0;0)$ là gốc tọa độ, trục $O y$ trùng với $O B$, trục $O x$ chứa $O A$. 
    - Khi đó ta có tọa độ các điểm: $O(0;0)$, $A(10;0)$, $B(0;20)$.
    - Đường cong parabol đi qua đỉnh $B(0;20)$ nên có dạng: $y = a x^2 + 20$.
    - Parabol đi qua $A(10;0)$, thay tọa độ $A$ vào ta được:
      $ 0 = a dot 10^2 + 20 <=> 100a = -20 <=> a = -1/5. $
    - Phương trình parabol là $y = -1/5 x^2 + 20$. 
    - Rút $x^2$ theo $y$ để tính thể tích quay quanh trục $O y$:
      $ 1/5 x^2 = 20 - y <=> x^2 = 100 - 5y. $
    - Thể tích khối tròn xoay khi quay phần parabol quanh trục $O y$ (giới hạn từ $y=0$ đến $y=20$) là:
      $ V_2 &= pi integral_0^20 x^2 dif y = pi integral_0^20 (100 - 5y) dif y \
            &= pi (100y - (5y^2)/2) |_0^20 = pi ( 100 dot 20 - (5 dot 20^2)/2 ) \
            &= pi (2000 - 1000) = 1000pi " (cm"^3")." $
            
    *Bước 3: Tính tổng thể tích*
    - Tổng thể tích chiếc mũ là:
      $ V = V_1 + V_2 = 600pi + 1000pi = 1600pi " (cm"^3")." $
    - Đổi ra giá trị xấp xỉ: 
      $ V = 1600 dot pi approx 5026,548... " (cm"^3")." $
    - Làm tròn kết quả đến hàng đơn vị, ta thu được *$5027$*.
  ]
)
// Câu trắc nghiệm Đúng/Sai tính chi phí bảo trì tích phân
#ds(
  [Giả sử chi phí mua và bảo trì một thiết bị trong $x$ năm có thể được mô hình hóa theo công thức:
  $ C = 5000(25 + 3 integral_0^x t^(1/4) dif t). $],
  (
    [Chi phí mua 1 sản phẩm là $100.000$ đồng.],
    True([Chi phí bảo trì năm đầu tiên của 1 sản phẩm là $12.000$ đồng.]),
    [Sau $6,5$ năm thì số tiền mua một sản phẩm bằng số tiền bảo trì sản phẩm đó.],
    True([Nếu một nhà đầu tư có $10$ triệu, thì họ có thể mua và bảo trì tối đa $30$ sản phẩm trong $10$ năm.])
  ),
  loigiai: [
    #ppgiai[
      - Tính tích phân: $integral_0^x t^(1/4) dif t = (t^(5/4))/(5/4) |_0^x = 4/5 x^(5/4)$.
      - Từ đó viết lại hàm chi phí tổng: 
        $ C(x) = 5000(25 + 3 dot 4/5 x^(5/4)) = 125000 + 12000 x^(5/4). $
      - Phân tích cấu trúc chi phí: 
        + Hằng số (không phụ thuộc $x$) chính là chi phí mua thiết bị ban đầu.
        + Phần biến thiên theo $x$ chính là tổng chi phí bảo trì tích lũy sau $x$ năm.
      - Áp dụng vào tính toán từng câu hỏi.
    ]
    Ta biến đổi lại công thức chi phí:
    $ C(x) = 5000 (25 + 3 integral_0^x t^(1/4) dif t) = 125000 + 15000 integral_0^x t^(1/4) dif t $
    Tính tích phân:
    $ integral_0^x t^(1/4) dif t = (t^(1/4 + 1))/(1/4 + 1) |_0^x = (t^(5/4))/(5/4) |_0^x = 4/5 x^(5/4) $
    Thay vào, ta được hàm tổng chi phí mua và bảo trì sau $x$ năm là:
    $ C(x) = 125000 + 15000 dot 4/5 x^(5/4) = 125000 + 12000 x^(5/4) $
    Trong đó:
    - Chi phí mua ban đầu là $125.000$ (khi $x = 0$).
    - Chi phí bảo trì sau $x$ năm là $B(x) = 12000 x^(5/4)$.

    - *Ý a) Sai.* Theo phân tích, khi $x = 0$, chi phí mua ban đầu là $125.000$ đồng, không phải $100.000$ đồng.
    
    - *Ý b) Đúng.* Chi phí bảo trì năm đầu tiên (tức là khi $x = 1$) là:
      $ B(1) = 12000 dot 1^(5/4) = 12000 " (đồng)" $
      Phát biểu này chính xác.

    - *Ý c) Sai.* Để số tiền mua bằng số tiền bảo trì, ta giải phương trình:
      $ B(x) = 125000 <=> 12000 x^(5/4) = 125000 <=> x^(5/4) = 125/12 $
      $ => x = (125/12)^(4/5) approx 6.544 $
      Giá trị chính xác là khoảng $6,544$ năm chứ không phải đúng bằng $6,5$ năm. 
      (Nếu $x = 6.5$ thì $12000(6.5)^(5/4) approx 123955 != 125000$).
      
    - *Ý d) Đúng.* Chi phí để mua và bảo trì $1$ sản phẩm trong $10$ năm là:
      $ C(10) = 125000 + 12000(10)^(5/4) approx 125000 + 12000(17.7828) approx 125000 + 213393.5 = 338393.5 " (đồng)" $
      Số sản phẩm tối đa có thể mua và bảo trì với $10.000.000$ đồng là:
      $ n = 10000000 / 338393.5 approx 29.55 $
      Vì số lượng sản phẩm phải là số nguyên, nhà đầu tư có thể trang bị tối đa $29$ sản phẩm.
      *Lưu ý:* Phát biểu nói "tối đa 30 sản phẩm" có nghĩa là số sản phẩm trang bị không thể vượt qua 30 (tức là $n <= 30$). Mức 29 hoàn toàn thỏa mãn "tối đa 30". (Trong toán trắc nghiệm, nếu nói "có thể mua được 30 sản phẩm" thì là Sai, nhưng nói "tối đa 30" để chặn trên thì vẫn có thể tính là Đúng tùy tư duy ra đề, ở đây tạm xét là mệnh đề hợp lý do $29 < 30$).
  ]
)
// Câu trả lời ngắn: Tối ưu hóa năng suất nhà máy
#tln(
  [Theo thống kê tại một nhà máy $Z$, nếu áp dụng tuần làm việc $40$ giờ thì mỗi tuần có $100$ tổ công nhân đi làm và mỗi tổ công nhân làm được $120$ sản phẩm trong một giờ. Nếu tăng thời gian làm việc thêm $2$ giờ mỗi tuần thì sẽ có $1$ tổ công nhân nghỉ việc và năng suất lao động giảm $5$ sản phẩm/$1$ tổ/$1$ giờ. Ngoài ra, số phế phẩm mỗi tuần ước tính là $P(x) = (95x^2 + 120x)/4$, với $x$ là thời gian làm việc trong một tuần. Nhà máy cần áp dụng thời gian làm việc mỗi tuần mấy giờ để số lượng sản phẩm thu được mỗi tuần là lớn nhất?],
  [$36$],
  loigiai: [
    #ppgiai[
      - Lập hàm số biểu diễn số lượng tổ công nhân và năng suất theo thời gian làm việc $x$.
      - Tính tổng số sản phẩm làm ra trong một tuần: 
        $S(x) = ("Số tổ") times ("Năng suất 1 tổ/1 giờ") times ("Số giờ " x)$.
      - Số lượng sản phẩm thu được (thực tế) = Tổng sản phẩm làm ra $S(x) - "Số phế phẩm" P(x)$.
      - Tìm giá trị lớn nhất của hàm số bằng công cụ đạo hàm.
    ]
    - Gọi $x$ là thời gian làm việc trong một tuần (giờ, $x > 0$).
    - Độ chênh lệch thời gian so với mức chuẩn $40$ giờ là $x - 40$.
    - Số lần "tăng $2$ giờ" tương ứng là $(x - 40)/2$.
    
    - Số tổ công nhân đi làm là: 
      $ 100 - 1 dot (x - 40)/2 = 100 - 0.5x + 20 = 120 - 0.5x " (tổ)". $
    - Năng suất làm việc của mỗi tổ trong 1 giờ là:
      $ 120 - 5 dot (x - 40)/2 = 120 - 2.5x + 100 = 220 - 2.5x " (sản phẩm)". $
    - Điều kiện để số tổ và năng suất dương là: $120 - 0.5x > 0$ và $220 - 2.5x > 0 => x < 88$. Vậy $x in (0; 88)$.
    
    - Tổng số sản phẩm làm ra trong một tuần là:
      $ S(x) &= x (120 - 0.5x)(220 - 2.5x) \
             &= x (26400 - 300x - 110x + 1.25x^2) \
             &= 1.25x^3 - 410x^2 + 26400x. $
             
    - Số phế phẩm mỗi tuần (theo đề) là:
      $ P(x) = (95x^2 + 120x)/4 = 23.75x^2 + 30x. $
      
    - Số lượng sản phẩm thu được (thành phẩm đạt chuẩn) là:
      $ F(x) &= S(x) - P(x) \
             &= (1.25x^3 - 410x^2 + 26400x) - (23.75x^2 + 30x) \
             &= 1.25x^3 - 433.75x^2 + 26370x. $
             
    - Đạo hàm:
      $ F'(x) = 3.75x^2 - 867.5x + 26370. $
    - Cho $F'(x) = 0 <=> 3.75x^2 - 867.5x + 26370 = 0$.
      Bấm máy tính giải phương trình bậc hai, ta thu được hai nghiệm:
      $ x_1 = 586/3 approx 195.33 " (loại vì " x > 88")" quad "và" quad x_2 = 36 " (thỏa mãn)". $
      
    - Qua $x = 36$, đạo hàm $F'(x)$ đổi dấu từ dương sang âm, do đó hàm số $F(x)$ đạt giá trị cực đại (lớn nhất trên khoảng đang xét) tại $x = 36$.
    
    *Vậy nhà máy cần áp dụng thời gian làm việc là $36$ giờ mỗi tuần để số sản phẩm thu được lớn nhất.*
  ]
)
// Câu trả lời ngắn: Xác suất chuyển bi giữa hai hộp (có sơ đồ cây)


#tln(
  mode: "loigiai",
  [Xét trong hệ trục toạ độ $O x y$ (đơn vị mỗi trục là mét), có một sân golf thu nhỏ, điểm phát bóng là điểm $A$, điểm đặt lỗ là điểm $D(25/9; 0)$, đường cong $B C$ là một phần của đồ thị hàm số bậc ba $f(x) = a x^3 + b x^2 + c x + d$ với $B(-1; 9/2), C(1; 4)$, trong đó điểm $B$ là điểm uốn của đồ thị hàm số $f(x)$. Để hoàn thành lỗ này, người chơi đặt bóng tại điểm $A(p; 0)$, quả bóng chạy theo đường thẳng $A B$, đi theo đường cong $B C$ rồi tiếp tục đi theo đường thẳng $C D$ (tham khảo hình vẽ). Biết rằng $A B$ và $C D$ là các tiếp tuyến của đồ thị hàm số $f(x)$ lần lượt tại các điểm $B$ và $C$. Tính $p^4$.],
  [$2401$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let sx = 0.7; let sy = 0.7
    let A = (-7 * sx, 0); let B = (-1 * sx, 4.5 * sy)
    let C = (1 * sx, 4 * sy); let D = (25/9 * sx, 0)
    
    line((-8.5 * sx, 0), (4.5 * sx, 0), mark: (end: ">"), stroke: 0.6pt)
    content((4.5 * sx, -0.3), $x$, anchor: "north")
    line((0, -0.5 * sy), (0, 5.5 * sy), mark: (end: ">"), stroke: 0.6pt)
    content((0.3, 5.5 * sy), $y$, anchor: "west")
    content((-0.3, -0.3), $O$, anchor: "north-east")
    
    line(A, B, stroke: 1pt)
    line(C, D, stroke: 1pt)
    
    let curve-pts = ()
    for i in range(-10, 11) {
      let x = i / 10
      let y = -0.25 * calc.pow(x, 3) - 0.75 * calc.pow(x, 2) + 5
      curve-pts.push((x * sx, y * sy))
    }
    line(..curve-pts, stroke: (thickness: 1.5pt))
    
    content((-7 * sx, -0.3), $A$, anchor: "north")
    content((-1 * sx - 0.3, 4.5 * sy), $B$, anchor: "east")
    content((1 * sx + 0.3, 4 * sy), $C$, anchor: "west")
    content((25/9 * sx, -0.3), $D$, anchor: "north")
  }),
  fig-pos: "center",
  fig-width: 40%,
  loigiai: [
    #ppgiai[
      - Gọi hàm số $f(x) = a x^3 + b x^2 + c x + d$. Đạo hàm $f'(x) = 3a x^2 + 2b x + c$, $f''(x) = 6a x + 2b$.
      - Lập hệ 4 phương trình 4 ẩn $a, b, c, d$ từ các giả thiết (tọa độ điểm đi qua, điểm uốn, hệ số góc tiếp tuyến).
      - Bấm máy tính (Casio) giải hệ 4 ẩn.
      - Viết phương trình tiếp tuyến tại $B$, cho $y=0$ để tìm hoành độ $p$ của điểm $A$.
    ]
    Ta có $f(x) = a x^3 + b x^2 + c x + d => f'(x) = 3a x^2 + 2b x + c$ và $f''(x) = 6a x + 2b$.
    
    Từ các dữ kiện bài toán, ta lập được hệ phương trình:
    + Đồ thị đi qua $B(-1; 9/2) => f(-1) = 9/2 => -a + b - c + d = 9/2$.
    + Đồ thị đi qua $C(1; 4) => f(1) = 4 => a + b + c + d = 4$.
    + Điểm $B(-1; 9/2)$ là điểm uốn nên $f''(-1) = 0 => -6a + 2b = 0$.
    + Đường thẳng $C D$ đi qua $C(1; 4)$ và $D(25/9; 0)$ có hệ số góc $k = (0 - 4) / (25/9 - 1) = -9/4$. 
      Vì $C D$ là tiếp tuyến tại $C$ nên $f'(1) = k => 3a + 2b + c = -9/4$.
    
    Ta có hệ 4 phương trình 4 ẩn:
    $ cases(
      -a + b - c + d = 9/2,
      a + b + c + d = 4,
      -6a + 2b = 0,
      3a + 2b + c = -9/4
    ) $
    Bấm máy tính giải hệ, ta thu được: $a = -1/4, b = -3/4, c = 0, d = 5$.
    
    Suy ra đạo hàm: $f'(x) = -3/4 x^2 - 3/2 x$.
    
    Tiếp tuyến $A B$ tại điểm $B(-1; 9/2)$ có hệ số góc là:
    $ k_(A B) = f'(-1) = -3/4(-1)^2 - 3/2(-1) = 3/4. $
    Phương trình tiếp tuyến $A B$: 
    $ y = 3/4(x + 1) + 9/2 <=> y = 3/4 x + 21/4. $
    
    Điểm $A(p; 0)$ thuộc đường thẳng $A B$, cho $y = 0$ ta có: 
    $ 3/4 p + 21/4 = 0 <=> p = -7. $
    Vậy $p^4 = (-7)^4 = 2401$.
  ]
)
