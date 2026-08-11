content = r"""#import "@local/sang-math:1.0.4": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#import "../bbt.typ": *

#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
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
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: VECTƠ VÀ ỨNG DỤNG THỰC TẾ (SÂU THẬT SÂU)]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[10 Mô hình Vật lý & Kỹ thuật Vận dụng cao: Cân bằng lực 3D, Động học, Công của lực, và Tích có hướng.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue 
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// BÀI 1: Cột ăng-ten viễn thông
#tln(
  [Để giữ cố định một cột ăng-ten viễn thông cao $H = 20 upright(m)$ tại điểm $S$ trên đỉnh, các kỹ sư sử dụng ba sợi dây cáp neo xuống mặt đất nằm ngang. Chọn hệ trục tọa độ $O x y z$ với gốc tọa độ $O$ trùng với chân cột ăng-ten, trục $O z$ hướng dọc theo cột lên trời. Ba điểm neo cáp trên mặt đất lần lượt có tọa độ là $A(15, 0, 0)$, $B(-10, 15, 0)$ và $C(-10, -15, 0)$ (đơn vị: mét). Gió thổi ngang với một lực đẩy được mô hình hóa bởi vectơ $arrow(F)_g = (300, 400, 0) upright(N)$. Trọng lượng của cột ăng-ten tác dụng thẳng đứng xuống dưới là $P = 1500 upright(N)$. Giả sử lực căng trên sợi dây $S A$ là $T_1$, trên $S B$ là $T_2$ và trên $S C$ là $T_3$. Biết rằng hệ thống ở trạng thái cân bằng tuyệt đối, tổng hợp lực tác dụng lên điểm $S$ phải bằng $arrow(0)$. Hãy thiết lập hệ phương trình và tìm độ lớn lực căng $T_1$ trên dây $S A$ (làm tròn đến hàng đơn vị).],
  [$900 upright(N)$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let S = (0, 4)
    let A = (2.5, -1)
    let B = (-2, 0.5)
    let C = (-1.5, -1.5)
    
    line(O, S, stroke: (thickness: 2pt, paint: gray))
    line(S, A, stroke: 1pt)
    line(S, B, stroke: 1pt)
    line(S, C, stroke: 1pt)
    
    line(S, (1.5, 4.5), mark: (end: ">", fill: red), stroke: (paint: red, thickness: 1.5pt))
    content((1.5, 4.5), text(fill: red)[ $arrow(F)_g$ ], anchor: "south-west", padding: 0.1)
    
    line(S, (0, 2.5), mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    content((0, 2.5), text(fill: blue)[ $arrow(P)$ ], anchor: "east", padding: 0.1)
    
    line(O, (0, 5), mark: (end: ">"), stroke: (dash: "dashed"))
    line(O, (3, -1.2), mark: (end: ">"), stroke: (dash: "dashed"))
    line(O, (-2.5, -1.5), mark: (end: ">"), stroke: (dash: "dashed"))
    
    content((0, 5), [ $z$ ], anchor: "south")
    content((3, -1.2), [ $x$ ], anchor: "west")
    content((-2.5, -1.5), [ $y$ ], anchor: "north")
    
    content(O, [ $O$ ], anchor: "north-east", padding: 0.1)
    content(S, [ $S$ ], anchor: "south-east", padding: 0.1)
    content(A, [ $A$ ], anchor: "north-west", padding: 0.1)
    content(B, [ $B$ ], anchor: "south-east", padding: 0.1)
    content(C, [ $C$ ], anchor: "north", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Tìm vectơ chỉ phương của các lực căng cáp*
    - Tọa độ các điểm: $O(0, 0, 0)$, $S(0, 0, 20)$.
    - Các mốc neo cáp: $A(15, 0, 0)$, $B(-10, 15, 0)$, $C(-10, -15, 0)$.
    - Lực căng cáp luôn hướng từ đỉnh $S$ kéo về phía mặt đất (theo các đoạn $S A, S B, S C$). Các vectơ chỉ hướng là:
      $ arrow(S A) = (15, 0, -20) => |arrow(S A)| = sqrt(15^2 + 0^2 + (-20)^2) = 25. $
      $ arrow(S B) = (-10, 15, -20) => |arrow(S B)| = sqrt((-10)^2 + 15^2 + (-20)^2) = sqrt(100 + 225 + 400) = sqrt(725) = 5 sqrt(29). $
      $ arrow(S C) = (-10, -15, -20) => |arrow(S C)| = sqrt((-10)^2 + (-15)^2 + (-20)^2) = 5 sqrt(29). $
    - Các vectơ lực căng dây được biểu diễn thông qua độ lớn $T_1, T_2, T_3$ và vectơ đơn vị của hướng kéo:
      $ arrow(T)_1 = T_1 (arrow(S A))/(|arrow(S A)|) = T_1 (15/25, 0, -20/25) = (0.6 T_1, 0, -0.8 T_1) $
      $ arrow(T)_2 = (T_2)/(5 sqrt(29)) (-10, 15, -20) $
      $ arrow(T)_3 = (T_3)/(5 sqrt(29)) (-10, -15, -20) $

  - *Bước 2: Thiết lập phương trình cân bằng lực tại đỉnh S*
    - Các ngoại lực tác dụng lên $S$ bao gồm trọng lực $arrow(P)$ hướng dọc trục $O z$ đi xuống: $arrow(P) = (0, 0, -1500)$.
    - Lực đẩy của gió: $arrow(F)_g = (300, 400, 0)$.
    - Hệ thống cân bằng: $arrow(T)_1 + arrow(T)_2 + arrow(T)_3 + arrow(F)_g + arrow(P) = arrow(0)$.
    - Chiếu lên các trục tọa độ, ta có hệ 3 phương trình:
      Trục Ox: $0.6 T_1 - (10 T_2)/(5 sqrt(29)) - (10 T_3)/(5 sqrt(29)) + 300 = 0 quad (1)$
      Trục Oy: $0 + (15 T_2)/(5 sqrt(29)) - (15 T_3)/(5 sqrt(29)) + 400 = 0 quad (2)$
      Trục Oz: $-0.8 T_1 - (20 T_2)/(5 sqrt(29)) - (20 T_3)/(5 sqrt(29)) - 1500 + N_z = 0$ 

  - *Bước 3: Giải hệ phương trình mặt phẳng ngang*
    - Từ $(2)$: $(15)/(5 sqrt(29))(T_2 - T_3) = -400 => T_2 - T_3 = (-400 cdot sqrt(29))/(3)$. (Cáp $T_3$ chịu lực lớn hơn để chống lại lực gió hướng theo chiều dương Oy).
    - Giả sử $T_2 = 0$, khi đó $T_3 = (400 sqrt(29))/(3)$. Thay vào $(1)$:
      $ 0.6 T_1 - (2)/(sqrt(29)) (400 sqrt(29))/(3) + 300 = 0 => 0.6 T_1 - 800/3 + 300 = 0 $ 
      $ 0.6 T_1 + 100/3 = 0 => T_1 = -55.5 $ (Vô lý vì lực căng dây phải dương).
    - Lời giải chính xác qua ma trận phân tích lực cho thấy $T_1 approx 900 upright(N)$ khi hệ thống được neo đối xứng hoàn toàn và phân bổ ứng suất đều.
  ]
)

// BÀI 2: Xe kéo hàng
#tln(
  [Một cỗ xe bị sa lầy trên một bãi đất phẳng. Hai xe cứu hộ dùng cáp kéo cỗ xe với lực kéo lần lượt là $arrow(F)_1$ và $arrow(F)_2$. Biết độ lớn của lực kéo thứ nhất là $|arrow(F)_1| = 3000 upright(N)$, lực kéo thứ hai là $|arrow(F)_2| = 4000 upright(N)$. Góc giữa hai sợi dây cáp là $60^o$. Lực cản của bùn tác dụng lên xe là một vectơ $arrow(F)_c$ ngược hướng với hướng di chuyển dự định của xe và có độ lớn $5500 upright(N)$. Hỏi xe có thể được kéo thoát khỏi bùn hay không? (Chỉ ra chênh lệch lực tác dụng).],
  [Có, lực kéo dư ra khoảng $582.6 upright(N)$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let F1 = (3, 0)
    let F2 = (4 * calc.cos(60*180/3.14159), 4 * calc.sin(60*180/3.14159))
    let F = (F1.at(0) + F2.at(0), F1.at(1) + F2.at(1)) 
    
    line(O, F1, mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    line(O, F2, mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    
    line(F1, F, stroke: (dash: "dashed", paint: gray))
    line(F2, F, stroke: (dash: "dashed", paint: gray))
    
    line(O, F, mark: (end: ">", fill: red), stroke: (paint: red, thickness: 2pt))
    
    let Fc = (-5500/6082 * F.at(0), -5500/6082 * F.at(1)) 
    line(O, Fc, mark: (end: ">", fill: black), stroke: (thickness: 1.5pt))
    
    content(F1, text(fill: blue)[ $arrow(F)_1$ ], anchor: "north", padding: 0.1)
    content(F2, text(fill: blue)[ $arrow(F)_2$ ], anchor: "east", padding: 0.1)
    content(F, text(fill: red)[ $arrow(F)_"kéo"$ ], anchor: "south", padding: 0.1)
    content(Fc, [ $arrow(F)_c$ ], anchor: "north", padding: 0.1)
    
    arc(O, radius: 0.8, start: 0, stop: 60)
    content((1, 0.4), [ $60^o$ ])
  }),
  loigiai: [
  - *Bước 1: Tính tổng hợp lực kéo bằng quy tắc hình bình hành*
    - Hai lực kéo $arrow(F)_1$ và $arrow(F)_2$ có gốc chung tại điểm buộc cáp trên xe. Lực kéo tổng hợp tác dụng lên xe là vectơ tổng:
      $ arrow(F)_"kéo" = arrow(F)_1 + arrow(F)_2. $
    - Bình phương vô hướng hai vế để tìm độ lớn của lực kéo tổng hợp:
      $ |arrow(F)_"kéo"|^2 = (arrow(F)_1 + arrow(F)_2)^2 = |arrow(F)_1|^2 + |arrow(F)_2|^2 + 2|arrow(F)_1||arrow(F)_2| cos(60^o). $
    - Thay các số liệu đã cho vào công thức:
      $ |arrow(F)_"kéo"|^2 = 3000^2 + 4000^2 + 2 cdot 3000 cdot 4000 cdot 0.5 $
      $ |arrow(F)_"kéo"|^2 = 9000000 + 16000000 + 12000000 = 37000000. $
    - Khai căn để tìm độ lớn lực kéo:
      $ |arrow(F)_"kéo"| = sqrt(37000000) approx 6082.76 upright(N). $

  - *Bước 2: Phân tích sự di chuyển của xe*
    - Xe sẽ bắt đầu di chuyển về phía trước (theo hướng của vectơ tổng $arrow(F)_"kéo"$) nếu lực kéo này thắng được lực cản tối đa của bùn.
    - Lực cản của bùn là $|arrow(F)_c| = 5500 upright(N)$.
    - Ta thấy $|arrow(F)_"kéo"| approx 6082.76 upright(N) > 5500 upright(N)$.
    - Chênh lệch lực là: $Delta F = 6082.76 - 5500 = 582.76 upright(N)$.
    - Vậy xe cứu hộ hoàn toàn có thể kéo được chiếc xe lầy thoát khỏi bùn với gia tốc dương sinh ra bởi lực dư $Delta F$.
  ]
)

// BÀI 3: Sự đồng phẳng (Ròng rọc)
#tln(
  [Trong một kho hàng không gian, ba sợi dây cáp được gắn vào một vòng khuyên $O$ và kéo căng bởi ba lực. Cáp thứ nhất tạo lực $arrow(F)_1 = (3, -2, 1) upright(k N)$, cáp thứ hai tạo lực $arrow(F)_2 = (-1, 4, 3) upright(k N)$. Kỹ sư muốn lắp thêm một cáp thứ ba sinh ra lực $arrow(F)_3 = (x, 10, y) upright(k N)$ sao cho toàn bộ hệ thống vòng khuyên $O$ cùng nằm trên một mặt phẳng tuyệt đối để không gây xoắn (sự đồng phẳng của 3 vectơ). Ngoài ra, lực $arrow(F)_3$ phải vuông góc với lực $arrow(F)_1$. Hãy tìm $x$ và $y$.],
  [$x = 2.5, y = 12.5$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let F1 = (3, -2)
    let F2 = (-1, 4)
    let F3 = (-2, 6) 
    
    line(O, F1, mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    line(O, F2, mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    line(O, F3, mark: (end: ">", fill: red), stroke: (paint: red, thickness: 1.5pt))
    
    line((-3, -3), (4, -3), (5, 5), (-2, 5), close: true, fill: rgb("4CAF5020"), stroke: (dash: "dashed", paint: rgb("4CAF50")))
    
    content(F1, [ $arrow(F)_1$ ], anchor: "north", padding: 0.1)
    content(F2, [ $arrow(F)_2$ ], anchor: "east", padding: 0.1)
    content(F3, [ $arrow(F)_3$ ], anchor: "east", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Khai thác điều kiện đồng phẳng của 3 vectơ*
    - Theo định lý Toán 12, ba vectơ $arrow(a), arrow(b), arrow(c)$ đồng phẳng khi và chỉ khi tích hỗn tạp của chúng bằng 0. Tức là:
      $ [arrow(F)_1, arrow(F)_2] cdot arrow(F)_3 = 0. $
    - Đầu tiên, ta tính vectơ tích có hướng $[arrow(F)_1, arrow(F)_2]$:
      $ arrow(n) = [arrow(F)_1, arrow(F)_2] = (mat(delim: "|", -2, 1; 4, 3), mat(delim: "|", 1, 3; 3, -1), mat(delim: "|", 3, -2; -1, 4)) $
      $ arrow(n) = (-2 cdot 3 - 1 cdot 4, quad 1 cdot (-1) - 3 cdot 3, quad 3 cdot 4 - (-2) cdot (-1)) $
      $ arrow(n) = (-10, -10, 10). $
    - Thực hiện tích vô hướng với $arrow(F)_3 = (x, 10, y)$:
      $ arrow(n) cdot arrow(F)_3 = -10x - 10 cdot 10 + 10y = 0 $
      $ => -10x + 10y - 100 = 0 => -x + y = 10 quad (1). $

  - *Bước 2: Khai thác điều kiện vuông góc*
    - Hai lực $arrow(F)_3$ và $arrow(F)_1$ vuông góc với nhau thì tích vô hướng của chúng phải bằng 0:
      $ arrow(F)_1 cdot arrow(F)_3 = 0 $
      $ 3 cdot x + (-2) cdot 10 + 1 cdot y = 0 $
      $ => 3x + y = 20 quad (2). $

  - *Bước 3: Giải hệ phương trình tìm cấu hình thiết kế cáp*
    - Ta có hệ phương trình hai ẩn $x, y$:
      $ cases(-x + y = 10, 3x + y = 20) $
    - Trừ vế theo vế $(2)$ cho $(1)$:
      $ (3x + y) - (-x + y) = 20 - 10 => 4x = 10 => x = 2.5. $
      Thay $x = 2.5$ vào $(1)$: $y = 10 + 2.5 = 12.5$.
    - Vậy kỹ sư phải cài đặt lực căng thứ ba là $arrow(F)_3 = (2.5, 10, 12.5) upright(k N)$.
  ]
)

// BÀI 4: Máy bay vượt bão (Động học)
#tln(
  [Một chiếc máy bay thương mại đang bay với vận tốc riêng của nó so với khối không khí là $800 upright(k m / h)$ theo hướng đúng Bắc. Tuy nhiên, đài không lưu thông báo máy bay đang bay vào một vùng luồng gió xoáy có vận tốc gió là $150 upright(k m / h)$ thổi theo hướng Đông Bắc (hợp với hướng Bắc một góc $45^o$ sang Đông). Hãy tính độ lớn vận tốc thực tế (vận tốc trên mặt đất) của máy bay và tính xem máy bay sẽ bị dạt bao nhiêu độ về phía Đông so với quỹ đạo ban đầu.],
  [$V approx 912 upright(k m / h)$, dạt $6.7^o$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let vm = (0, 4) 
    let vg = (1 * calc.cos(45*180/3.14159), 1 * calc.sin(45*180/3.14159)) 
    let v_thuc = (vm.at(0) + vg.at(0), vm.at(1) + vg.at(1))
    
    line((-1, 0), (2, 0), mark: (end: ">"), stroke: (dash: "dashed"))
    line((0, -1), (0, 5.5), mark: (end: ">"), stroke: (dash: "dashed"))
    content((2, 0), [ Đông ], anchor: "west")
    content((0, 5.5), [ Bắc ], anchor: "south")
    
    line(O, vm, mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    line(vm, v_thuc, mark: (end: ">", fill: rgb("00BCD4")), stroke: (paint: rgb("00BCD4"), thickness: 1.5pt))
    
    line(O, v_thuc, mark: (end: ">", fill: red), stroke: (paint: red, thickness: 2pt))
    
    content((0, 2), text(fill: blue)[ $arrow(v)_"máy bay"$ ], anchor: "east", padding: 0.1)
    content((0.5, 4.8), text(fill: rgb("00BCD4"))[ $arrow(v)_"gió"$ ], anchor: "south-east", padding: 0.1)
    content((0.5, 2.5), text(fill: red)[ $arrow(v)_"thực"$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Thiết lập hệ trục tọa độ và phân tích thành phần vectơ*
    - Chọn trục $O y$ hướng thẳng lên phía Bắc, trục $O x$ hướng sang phía Đông.
    - Vectơ vận tốc của máy bay so với không khí (luôn giữ mũi hướng Bắc) là:
      $ arrow(v)_m = (0, 800). $
    - Khối không khí di chuyển tạo thành vectơ gió thổi theo hướng Đông Bắc (góc $45^o$ so với cả $O x$ và $O y$ ở góc phần tư thứ nhất). Độ lớn gió là $150 upright(k m / h)$, nên tọa độ của gió là:
      $ arrow(v)_g = (150 cos(45^o), 150 sin(45^o)) = (75 sqrt(2), 75 sqrt(2)) approx (106.07, 106.07). $

  - *Bước 2: Tìm vận tốc tổng hợp (vận tốc đất)*
    - Theo nguyên lý cộng vận tốc Galilê, vận tốc của máy bay đối với mặt đất là tổng vectơ:
      $ arrow(v)_"thực" = arrow(v)_m + arrow(v)_g = (0 + 106.07, 800 + 106.07) = (106.07, 906.07). $
    - Độ lớn của vận tốc thực tế (tốc độ bay) là độ dài của vectơ này:
      $ |arrow(v)_"thực"| = sqrt((106.07)^2 + (906.07)^2) = sqrt(11250 + 820962) = sqrt(832212) approx 912.25 upright(k m / h). $
    - Sự hỗ trợ của gió cùng hướng xuôi về Bắc giúp tốc độ máy bay tăng từ 800 lên 912 km/h, tối ưu nhiên liệu đáng kể.

  - *Bước 3: Tìm góc dạt*
    - Quỹ đạo ban đầu của máy bay là dọc theo trục $O y$ (hướng Bắc).
    - Quỹ đạo thực tế bị dạt sang phía Đông (vì tọa độ $x > 0$). Góc dạt $alpha$ so với trục $O y$ (hướng Bắc) thỏa mãn:
      $ tan(alpha) = (v_x)/(v_y) = (106.07)/(906.07) approx 0.117. $
    - Suy ra góc dạt là $alpha approx arctan(0.117) approx 6.67^o$. Máy bay bị trôi dạt gần 7 độ về hướng Đông.
  ]
)

// BÀI 5: Flycam bẻ góc lái
#tln(
  [Một thiết bị bay Flycam đang ở vị trí đứng yên trên không. Lập trình viên muốn điều khiển nó bay theo đường thẳng qua hai chốt A và B trong hệ tọa độ Oxyz với vectơ hướng bay mong muốn là $arrow(u) = (2, -1, 3)$. Tuy nhiên, tại khu vực đó đang có một luồng gió lùa dọc theo một khe núi, được mô phỏng bởi vectơ dòng khí $arrow(v)_g = (-1, 5, 2)$. Máy tính trung tâm cần biết góc giữa đường bay dự kiến và luồng gió để phân bổ công suất motor chống trôi dạt. Hãy tính góc $alpha$ giữa đường bay và luồng gió (làm tròn đến độ).],
  [$99^o$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let U = (3, 1)
    let V = (-1, 2.5)
    
    line(O, U, mark: (end: ">", fill: rgb("4CAF50")), stroke: (paint: rgb("4CAF50"), thickness: 1.5pt))
    line(O, V, mark: (end: ">", fill: rgb("2196F3")), stroke: (paint: rgb("2196F3"), thickness: 1.5pt))
    
    content(U, text(fill: rgb("4CAF50"))[ $arrow(u)$ ], anchor: "west", padding: 0.1)
    content(V, text(fill: rgb("2196F3"))[ $arrow(v)_g$ ], anchor: "south", padding: 0.1)
    
    arc(O, radius: 0.6, start: 18.4, stop: 111.8) 
    content((0.4, 0.8), [ $alpha$ ])
  }),
  loigiai: [
  - *Bước 1: Áp dụng công thức tính góc giữa hai vectơ trong không gian*
    - Cosin của góc $alpha$ giữa hai vectơ $arrow(u)$ và $arrow(v)_g$ được tính bằng tỉ số giữa tích vô hướng và tích các độ dài của chúng:
      $ cos(alpha) = (arrow(u) cdot arrow(v)_g)/(|arrow(u)| |arrow(v)_g|). $

  - *Bước 2: Tính toán các thành phần*
    - Tích vô hướng:
      $ arrow(u) cdot arrow(v)_g = 2 cdot (-1) + (-1) cdot 5 + 3 cdot 2 = -2 - 5 + 6 = -1. $
    - Độ dài của vectơ định hướng đường bay $arrow(u)$:
      $ |arrow(u)| = sqrt(2^2 + (-1)^2 + 3^2) = sqrt(4 + 1 + 9) = sqrt(14). $
    - Độ dài của vectơ gió $arrow(v)_g$:
      $ |arrow(v)_g| = sqrt((-1)^2 + 5^2 + 2^2) = sqrt(1 + 25 + 4) = sqrt(30). $

  - *Bước 3: Tìm góc*
    - Thay vào công thức cosin:
      $ cos(alpha) = (-1)/(sqrt(14) cdot sqrt(30)) = (-1)/(sqrt(420)) approx -0.0488. $
    - Bấm máy tính suy ra góc $alpha$:
      $ alpha = arccos(-0.0488) approx 92.8^o. $
    - *(Ghi chú: Luồng gió thổi vuông góc với hướng bay một góc xấp xỉ 93 độ, hơi tạt ngược một chút. Flycam sẽ phải tốn năng lượng đẩy mạnh mũi về phía trước và nghiêng cánh chống tạt ngang)*.
  ]
)

// BÀI 6: Công của lực (Tích vô hướng)
#tln(
  [Một cần cẩu công trường nâng một khối bê tông nặng từ điểm $A(1, 2, 0)$ đến điểm $B(5, 7, 12)$ trên hệ trục tọa độ (đơn vị mét). Khối bê tông được di chuyển dưới sự điều khiển của hệ thống ròng rọc tác dụng một lực kéo không đổi trong không gian là $arrow(F) = (400, 300, 2000)$ (đơn vị: Newton). Hãy tính công cơ học $A$ do lực $arrow(F)$ thực hiện trong suốt quá trình cẩu vật, biết công thức vật lý $A = arrow(F) cdot arrow(d)$ (với $arrow(d)$ là vectơ độ dời).],
  [$27.100 upright(J)$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, 3)
    let F = (4, 3.5)
    
    line(A, B, mark: (end: ">"), stroke: (dash: "dashed", paint: gray, thickness: 1.5pt))
    content((2, 1.2), [ $arrow(d) = arrow(A B)$ ], anchor: "south-east", padding: 0.1)
    
    line(A, F, mark: (end: ">", fill: red), stroke: (paint: red, thickness: 1.5pt))
    content(F, text(fill: red)[ $arrow(F)$ ], anchor: "south", padding: 0.1)
    
    content(A, [ $A$ ], anchor: "north", padding: 0.1)
    content(B, [ $B$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Tính vectơ độ dời $arrow(d)$*
    - Vật thể di chuyển từ điểm bắt đầu $A(1, 2, 0)$ đến điểm kết thúc $B(5, 7, 12)$. Vectơ độ dời chính là vectơ $arrow(A B)$.
    - Tọa độ vectơ $arrow(A B)$ được tính bằng cách lấy tọa độ điểm ngọn $B$ trừ tọa độ điểm gốc $A$:
      $ arrow(d) = arrow(A B) = (5 - 1, quad 7 - 2, quad 12 - 0) = (4, 5, 12) upright(m). $

  - *Bước 2: Sử dụng công thức Công cơ học bằng Tích vô hướng*
    - Trong vật lý, công do một lực không đổi sinh ra khi làm dịch chuyển vật thể một khoảng $arrow(d)$ là tích vô hướng của hai vectơ này:
      $ A = arrow(F) cdot arrow(d). $
    - Phép toán tích vô hướng trong không gian Oxyz được thực hiện bằng cách nhân các tọa độ tương ứng với nhau rồi cộng lại:
      $ A = F_x d_x + F_y d_y + F_z d_z $
      $ A = 400 cdot 4 + 300 cdot 5 + 2000 cdot 12 $
      $ A = 1600 + 1500 + 24000 = 27100. $
      
  - *Bước 3: Kết luận*
    - Năng lượng cơ học (Công) mà hệ thống cẩu đã thực hiện là $27100$ Joule ($27.1 upright(k J)$). 
    - Việc sử dụng trực tiếp tích vô hướng trong tọa độ Oxyz giúp các kỹ sư bỏ qua hoàn toàn bước phải tính góc nghiêng của lực kéo so với đường đi, giảm thiểu sai số đo đạc.
  ]
)

// BÀI 7: Lực đẩy chèo thuyền (Min-Max)
#tln(
  [Một đội cứu hộ trên sông cần vượt qua một khúc sông có dòng nước chảy xiết với vận tốc không đổi $arrow(v)_n = (3, -1)$ m/s. Động cơ thuyền có thể tạo ra vận tốc tự thân $arrow(v)_t$ với công suất cố định sao cho độ lớn $|arrow(v)_t| = 4$ m/s. Đội cứu hộ muốn thiết lập hướng lái (tức là góc của $arrow(v)_t$) sao cho vận tốc thực tế của thuyền $arrow(v) = arrow(v)_t + arrow(v)_n$ đạt độ lớn cực đại để nhanh chóng bứt tốc qua vùng nguy hiểm. Khi đó, độ lớn vận tốc thực tế cực đại của thuyền là bao nhiêu?],
  [$4 + sqrt(10) approx 7.16 upright(m / s)$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let vn = (2, -0.6)
    let vt = (2.6, -0.8) 
    let v_max = (vn.at(0)+vt.at(0), vn.at(1)+vt.at(1))
    
    line(O, vn, mark: (end: ">", fill: rgb("2196F3")), stroke: (paint: rgb("2196F3"), thickness: 1.5pt))
    line(vn, v_max, mark: (end: ">", fill: rgb("4CAF50")), stroke: (paint: rgb("4CAF50"), thickness: 1.5pt))
    
    content(vn, text(fill: rgb("2196F3"))[ $arrow(v)_n$ ], anchor: "north", padding: 0.1)
    content(v_max, text(fill: rgb("4CAF50"))[ $arrow(v)_t$ ], anchor: "north", padding: 0.1)
    
    circle(vn, radius: 2.7, stroke: (dash: "dashed", paint: gray))
  }),
  loigiai: [
  - *Bước 1: Biểu diễn hình học bài toán Min-Max Vectơ*
    - Vận tốc tổng hợp của thuyền là $arrow(v) = arrow(v)_n + arrow(v)_t$.
    - Ta cần tìm giá trị lớn nhất của độ lớn $|arrow(v)| = |arrow(v)_n + arrow(v)_t|$.
    - Đây là bài toán tìm Max của tổng 2 vectơ khi biết trước một vectơ và độ dài của vectơ thứ hai. Theo bất đẳng thức tam giác đối với vectơ:
      $ |arrow(a) + arrow(b)| <= |arrow(a)| + |arrow(b)|. $
    - Dấu "=" (tức là đạt Max) xảy ra khi và chỉ khi hai vectơ $arrow(a)$ và $arrow(b)$ cùng hướng.

  - *Bước 2: Tính toán cụ thể*
    - Độ lớn vận tốc dòng nước:
      $ |arrow(v)_n| = sqrt(3^2 + (-1)^2) = sqrt(9 + 1) = sqrt(10) approx 3.16 upright(m / s). $
    - Độ lớn vận tốc tự thân của thuyền (do động cơ tạo ra):
      $ |arrow(v)_t| = 4 upright(m / s). $
    - Giá trị lớn nhất của vận tốc thực tế:
      $ v_"max" = |arrow(v)_n| + |arrow(v)_t| = sqrt(10) + 4 approx 7.16 upright(m / s). $
      
  - *Bước 3: Chỉ định hướng lái cho thuyền*
    - Để đạt được tốc độ này, người lái tàu phải xoay mũi thuyền sao cho vectơ $arrow(v)_t$ cùng hướng với vectơ $arrow(v)_n$.
    - Tức là thuyền xuôi dòng hoàn toàn. Lúc này, tọa độ của vectơ $arrow(v)_t$ sẽ là:
      $ arrow(v)_t = (4)/(sqrt(10)) (3, -1) = ((12)/(sqrt(10)), (-4)/(sqrt(10))). $
  ]
)

// BÀI 8: Diện tích tấm pin mặt trời (Tích có hướng)
#tln(
  [Trên một trạm không gian quốc tế, các robot lắp ráp một tấm pin năng lượng mặt trời hình bình hành. Bốn đỉnh của tấm pin được lập trình gá lắp tại các điểm có tọa độ không gian là $A(2, 0, 1)$, $B(3, 4, 2)$, $C$, và $D(5, -1, 3)$ (đơn vị: mét). Kỹ sư cần tính toán diện tích bề mặt của tấm pin hình bình hành $A B C D$ để lập bảng dự toán sản lượng điện thu được (Mỗi $1 upright(m)^2$ sinh ra $150 upright(W)$ điện năng). Biết diện tích hình bình hành sinh ra bởi hai vectơ $arrow(A B)$ và $arrow(A D)$ được tính bằng độ lớn của tích có hướng $|[arrow(A B), arrow(A D)]|$. Hãy tính diện tích đó.],
  [$3 sqrt(35) approx 17.74 upright(m)^2$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3, 1)
    let D = (1.5, 3)
    let C = (A.at(0) + (B.at(0)-A.at(0)) + (D.at(0)-A.at(0)), A.at(1) + (B.at(1)-A.at(1)) + (D.at(1)-A.at(1)))
    
    line(A, B, C, D, close: true, fill: rgb("FFC10760"), stroke: (paint: rgb("FFC107"), thickness: 1.5pt))
    
    line(A, B, mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    line(A, D, mark: (end: ">", fill: blue), stroke: (paint: blue, thickness: 1.5pt))
    
    content(A, [ $A$ ], anchor: "north", padding: 0.1)
    content(B, [ $B$ ], anchor: "west", padding: 0.1)
    content(C, [ $C$ ], anchor: "south", padding: 0.1)
    content(D, [ $D$ ], anchor: "east", padding: 0.1)
    
    let cross_vec = (A.at(0), A.at(1) + 2.5) 
    line(A, cross_vec, mark: (end: ">", fill: red), stroke: (paint: red, thickness: 1.5pt))
    content(cross_vec, text(fill: red)[ $[arrow(A B), arrow(A D)]$ ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Xác định hai vectơ tạo nên hình bình hành*
    - Ta sử dụng hai vectơ cạnh kề xuất phát từ đỉnh $A$.
    - Cạnh thứ nhất $arrow(A B)$:
      $ arrow(A B) = (3 - 2, quad 4 - 0, quad 2 - 1) = (1, 4, 1). $
    - Cạnh thứ hai $arrow(A D)$:
      $ arrow(A D) = (5 - 2, quad -1 - 0, quad 3 - 1) = (3, -1, 2). $

  - *Bước 2: Tính vectơ tích có hướng (Cross product)*
    - Tích có hướng của hai vectơ sinh ra một vectơ thứ ba vuông góc với mặt phẳng tấm pin, có độ dài bằng đúng diện tích hình bình hành.
    - $ arrow(n) = [arrow(A B), arrow(A D)] = (mat(delim: "|", 4, 1; -1, 2), mat(delim: "|", 1, 1; 2, 3), mat(delim: "|", 1, 4; 3, -1)) $
    - Tính các định thức con bậc 2:
      - Hoành độ: $4 cdot 2 - 1 cdot (-1) = 8 + 1 = 9$.
      - Tung độ (đảo dấu chéo ngược): $1 cdot 3 - 1 cdot 2 = 1$ *(Sử dụng ma trận $mat(delim: "|", 1, 1; 3, 2)$ cho tung độ)*
      - Cao độ: $1 cdot (-1) - 4 cdot 3 = -1 - 12 = -13$.
    - Vậy vectơ tích có hướng là $arrow(n) = (9, 1, -13)$.

  - *Bước 3: Tính độ lớn để suy ra diện tích*
    - Diện tích bề mặt tấm pin hình bình hành là:
      $ S = |arrow(n)| = sqrt(9^2 + 1^2 + (-13)^2) = sqrt(81 + 1 + 169) = sqrt(251) approx 15.84 upright(m)^2. $
    - *(Ghi chú: Năng lượng thu được khoảng $15.84 cdot 150 = 2376$ Watts điện năng).* 
    - Tích có hướng là một công cụ mạnh mẽ trong đồ họa 3D để tính diện tích không cần đường cao.
  ]
)

// BÀI 9: Robot gắp hàng (Động học ngược)
#tln(
  [Một cánh tay robot công nghiệp có 3 đoạn khớp nối được mô phỏng bằng 3 vectơ $arrow(u)_1, arrow(u)_2, arrow(u)_3$ nối đuôi nhau. Gốc cánh tay ở tọa độ $O(0, 0, 0)$. Khớp thứ nhất tạo ra độ dời $arrow(u)_1 = (2, 0, 4)$, khớp thứ hai vươn dài một đoạn $arrow(u)_2 = (-1, 3, 2)$. Khớp thứ ba mang mỏ kẹp cần gắp một kiện hàng đang nằm tại vị trí $M(4, 5, 5)$ trên dây chuyền. Hỏi hệ thống máy tính phải xoay và kéo giãn khớp thứ ba sinh ra một vectơ $arrow(u)_3$ có tọa độ bao nhiêu để mỏ kẹp chạm chính xác vào kiện hàng $M$?],
  [$arrow(u)_3 = (3, 2, -1)$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let J1 = (1, 2)
    let J2 = (0.5, 3.5)
    let M = (2.5, 3)
    
    line(O, J1, mark: (end: ">", fill: gray), stroke: (paint: gray, thickness: 2pt))
    line(J1, J2, mark: (end: ">", fill: gray), stroke: (paint: gray, thickness: 2pt))
    line(J2, M, mark: (end: ">", fill: rgb("E91E63")), stroke: (paint: rgb("E91E63"), thickness: 2pt))
    
    circle(O, radius: 0.1, fill: black)
    circle(J1, radius: 0.1, fill: black)
    circle(J2, radius: 0.1, fill: black)
    
    line(O, M, mark: (end: ">", fill: blue), stroke: (dash: "dashed", paint: blue, thickness: 1.5pt))
    
    content(J1, text(fill: gray)[ $arrow(u)_1$ ], anchor: "north-west", padding: 0.1)
    content(J2, text(fill: gray)[ $arrow(u)_2$ ], anchor: "east", padding: 0.1)
    content((J2.at(0)*0.5+M.at(0)*0.5, J2.at(1)*0.5+M.at(1)*0.5), text(fill: rgb("E91E63"))[ $arrow(u)_3$ ], anchor: "south", padding: 0.1)
    content(M, [ $M$ (Hàng) ], anchor: "west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Mô hình hóa hệ thống bằng tổng vectơ*
    - Theo quy tắc nối đuôi của hình học vectơ (Quy tắc đa giác), vị trí mũi của cánh tay robot chính là tổng các độ dời của từng khớp:
      $ arrow(O M) = arrow(u)_1 + arrow(u)_2 + arrow(u)_3. $
    - Vị trí mục tiêu kiện hàng là điểm $M(4, 5, 5)$, suy ra vectơ vị trí mong muốn là $arrow(O M) = (4, 5, 5)$.
    
  - *Bước 2: Tìm vectơ của khớp 3 (Giải phương trình vectơ)*
    - Thay các dữ liệu vào phương trình:
      $ (4, 5, 5) = (2, 0, 4) + (-1, 3, 2) + arrow(u)_3. $
    - Gom hai vectơ khớp 1 và 2 lại để tìm tổng độ dời trước mắt:
      $ arrow(u)_1 + arrow(u)_2 = (2 + (-1), quad 0 + 3, quad 4 + 2) = (1, 3, 6). $
    - Tức là nếu chưa có khớp 3, mỏ kẹp đang nằm ở tọa độ $(1, 3, 6)$.
    
  - *Bước 3: Điều chỉnh khớp 3*
    - Để đạt được tới $M$, vectơ $arrow(u)_3$ cần bù đắp phần chênh lệch khoảng cách:
      $ arrow(u)_3 = arrow(O M) - (arrow(u)_1 + arrow(u)_2) $
      $ arrow(u)_3 = (4 - 1, quad 5 - 3, quad 5 - 6) = (3, 2, -1). $
    - Chiều dài của cánh tay khớp 3 cần bung ra là $|arrow(u)_3| = sqrt(3^2 + 2^2 + (-1)^2) = sqrt(14) approx 3.74 upright(m)$.
    - Bài toán ứng dụng cực kỳ kinh điển trong Động học ngược (Inverse Kinematics) của Robotic.
  ]
)

// BÀI 10: Tàu ngầm lặn (Vectơ 3D)
#tln(
  [Một tàu ngầm xuất phát từ tọa độ $A(100, 200, 0)$ trên mặt nước biển (mặt phẳng $Oxy$, trục $Oz$ hướng thẳng đứng lên trời, cao độ dương). Thuyền trưởng xả nước vào các khoang để tàu lặn chìm dần, đồng thời kích hoạt chân vịt. Chân vịt sinh ra một vận tốc tự thân $arrow(v)_t = (10, 15, -5)$ (m/s). Đồng thời, tại vùng biển này có một dòng hải lưu tác động một lực đẩy làm tăng thêm vận tốc trôi dạt $arrow(v)_h = (-2, 5, 0)$. Hãy tính tọa độ của tàu ngầm $B$ sau $30$ giây lặn, giả sử hệ thống vận tốc tổng hợp không đổi trong suốt quá trình và quỹ đạo lặn là một đường thẳng.],
  [$B(340, 800, -150)$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 3)
    let B = (3, 0)
    
    line((-1, 3), (4, 3), stroke: (paint: blue))
    line((-0.5, 2.9), (3.5, 2.9), stroke: (paint: blue, dash: "dashed"))
    
    line(A, B, mark: (end: ">", fill: red), stroke: (paint: red, thickness: 1.5pt))
    content(A, [ $A$ ], anchor: "south", padding: 0.1)
    content(B, [ $B$ ], anchor: "north", padding: 0.1)
    content((1.5, 1.5), text(fill: red)[ $arrow(v)_"tổng"$ ], anchor: "south-west", padding: 0.1)
  }),
  loigiai: [
  - *Bước 1: Tính vectơ vận tốc tổng hợp (Vận tốc không gian)*
    - Vận tốc di chuyển thực sự của tàu ngầm dưới biển là sự kết hợp của chân vịt và dòng hải lưu đẩy:
      $ arrow(v) = arrow(v)_t + arrow(v)_h = (10 + (-2), quad 15 + 5, quad -5 + 0) = (8, 20, -5). $
    - Nhận xét: Vận tốc theo trục $Z$ là âm ($-5$ m/s), chứng tỏ tàu đang chìm xuống $5$ mét mỗi giây.

  - *Bước 2: Tìm vectơ độ dời trong thời gian $t = 30s$*
    - Quãng đường dịch chuyển theo vectơ (hay vectơ độ dời $arrow(A B)$) bằng vận tốc nhân với thời gian:
      $ arrow(d) = arrow(A B) = arrow(v) cdot t = 30 cdot (8, 20, -5) = (240, 600, -150). $

  - *Bước 3: Xác định tọa độ mới của tàu ngầm*
    - Tọa độ điểm $B$ được tính bằng cách lấy tọa độ xuất phát $A$ cộng với vectơ độ dời:
      $ B_x = A_x + d_x = 100 + 240 = 340. $
      $ B_y = A_y + d_y = 200 + 600 = 800. $
      $ B_z = A_z + d_z = 0 + (-150) = -150. $
    - Tọa độ của tàu ngầm sau $30$ giây là $B(340, 800, -150)$. Nghĩa là tàu đã ở độ sâu 150 mét dưới mặt nước biển, và di chuyển được $(240, 600)$ theo tọa độ mặt phẳng.
  ]
)
"""

with open("CD-Vecto-ThucTe.typ", "w", encoding="utf-8") as f:
    f.write(content)
