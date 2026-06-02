#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// CẤU HÌNH TRANG
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.88em)

// Định dạng heading
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("004D40"), rgb("00695C"), rgb("00897B"), angle: 135deg),
  inset: (x: 16pt, y: 11pt), radius: 6pt, above: 1.9em, below: 1.3em,
  text(fill: white, size: 14pt, weight: "bold", it.body)
)
#show heading.where(level: 2): it => block(
  above: 1.5em, below: 0.8em, stroke: (left: 4pt + rgb("00695C")), inset: (left: 10pt, y: 5pt),
  text(fill: rgb("00695C"), size: 12pt, weight: "bold", it.body)
)

#let theory-box(title: "Khung Lý Thuyết", body) = block(
  fill: rgb("E0F2F1"), stroke: (left: 4pt + rgb("00695C"), rest: 0.8pt + rgb("80CBC4")),
  radius: (right: 7pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[
  #text(fill: rgb("004D40"), weight: "bold", size: 12pt)[#title]
  #v(0.3em)
  #body
]

#let cannon-box(title, body) = block(
  fill: rgb("FFF3E0"), stroke: (left: 5pt + rgb("D84315"), rest: 0.7pt + rgb("FFAB91")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: rgb("BF360C"), weight: "bold")[🚀 #title]
  #v(0.35em)
  #body
]

= Cẩm Nang: Khoảng Cách Ngắn Nhất Bằng Tiếp Tuyến Song Song
_Dự đoán xu hướng đề thi: Giải quyết các bài toán Tối ưu hóa - Mô hình thực tế bằng tư duy Đạo hàm và Cặp tiếp tuyến song song._

== 1. Nền Tảng Lý Thuyết (Tư Duy Toán Học)

Trong các bài toán quy hoạch, xây dựng hay vật lý, chúng ta thường xuyên phải tìm khoảng cách ngắn nhất giữa hai quỹ đạo (hai đường cong rời nhau, hoặc một đường cong và một đường thẳng). 

Bản chất hình học của điểm gần nhau nhất giữa hai đường nằm ở khái niệm *Cặp Tiếp Tuyến Song Song* và *Pháp Tuyến Chung*.

#theory-box(title: "Nguyên Lý Tiếp Tuyến Song Song")[
  *1. Khoảng cách từ Đường cong $(C)$ đến Đường thẳng $d: y = a x + b$*
  - Nếu điểm $M \in (C)$ gần đường thẳng $d$ nhất, thì tiếp tuyến của $(C)$ tại $M$ bắt buộc phải *song song* với đường thẳng $d$.
  - Thuật toán: Giải phương trình đạo hàm $f'(x) = a$ để tìm hoành độ tiếp điểm $x_0$. Khoảng cách ngắn nhất chính là khoảng cách từ $M(x_0, y_0)$ đến $d$.

  *2. Khoảng cách giữa Hai Đường cong $(C_1): f(x)$ và $(C_2): g(x)$*
  - Nếu điểm $A \in (C_1)$ và $B \in (C_2)$ là hai điểm gần nhau nhất, thì tiếp tuyến tại $A$ và tiếp tuyến tại $B$ phải *song song với nhau*, đồng thời đoạn thẳng $A B$ phải vuông góc với cả hai tiếp tuyến đó (Pháp tuyến chung).
  - Thuật toán Đặc Biệt (Đối xứng): Nếu $(C_1)$ và $(C_2)$ là hai hàm ngược của nhau (ví dụ $e^x$ và $\ln x$), chúng đối xứng qua đường phân giác $y = x$. Lúc này, ta chỉ cần tìm tiếp tuyến của $(C_1)$ song song với $y = x$, sau đó nhân đôi khoảng cách lên là xong!
]

== 2. Các Mô Hình Toán Thực Tế (Dự Đoán Đề Thi)

Dưới đây là các mô hình thực tiễn cao, đòi hỏi kỹ năng mô hình hóa kết hợp sức mạnh của đạo hàm.

#cannon-box("Mô hình 1: Quỹ đạo Drone cứu hộ & Dòng lũ quét (Hàm phân thức)", [
  *Bài toán:* Một dòng lũ quét bùn đỏ lan truyền trong thung lũng, ranh giới của nó được vệ tinh quét và mô hình hóa bằng hàm số $y = x + 1/(x-1)$ (với $x > 1$, tính bằng km). Một chiếc Drone (phương tiện bay không người lái) mang hàng cứu trợ đang bay theo một đường bay thẳng định trước có phương trình $y = -3x + 10$. 
  Hỏi khoảng cách ngắn nhất mà Drone có thể tiếp cận dòng lũ quét là bao nhiêu km để thả hàng an toàn?
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Draw axes
      line((0, 0), (4.5, 0), mark: (end: ">"))
      line((0, 0), (0, 4.5), mark: (end: ">"))
      content((4.4, -0.3), [$x$])
      content((-0.3, 4.4), [$y$])
      
      // Draw Drone path: y = -3x + 10 (approximate scaled for view)
      // Pass through (2, 4) and (3, 1)
      line((2, 4), (3.2, 0.4), stroke: 1.5pt + blue)
      content((3.3, 0.6), text(fill: blue)[$d: y = -3x+10$])
      
      // Draw Flood path: y = x + 1/(x-1) (approx scaled)
      // at x=1.5 -> y=3.5. Point (1.5, 3.5)
      bezier((1.2, 4.2), (3.5, 3.8), (1.5, 3.5), (2.5, 2.5), stroke: 1.5pt + red)
      content((3.5, 4.0), text(fill: red)[$y = x + 1/(x-1)$])
      
      // Draw shortest distance line
      line((1.5, 3.5), (1.8, 4.4), stroke: (dash: "dashed", paint: rgb("AAAAAA")))
      circle((1.5, 3.5), radius: 0.05, fill: red)
      content((1.2, 3.5), [$M$])
    })
  ]
  
  *Giải pháp:*
  Gọi $M(x_0, y_0)$ là điểm trên ranh giới lũ quét (đường cong $C$) gần với đường bay của Drone (đường thẳng $d$) nhất. Tiếp tuyến của $(C)$ tại $M$ phải *song song* với đường thẳng $d$.
  - Hệ số góc của $d$ là $a = -3$.
  - Đạo hàm của đường cong: $y' = 1 - 1/(x-1)^2$.
  
  Ép tiếp tuyến song song: 
  $ 1 - 1/(x-1)^2 = -3 => 1/(x-1)^2 = 4 => (x-1)^2 = 1/4 $
  Vì vùng lũ ở $x > 1$, ta chọn nghiệm $x - 1 = 1/2 => x_0 = 3/2$.
  Thay vào hàm số, ta có tung độ $y_0 = 3/2 + 1/(1/2) = 3.5 = 7/2$.
  Vậy điểm tiếp cận gần nhất trên dòng lũ là $M(1.5, 3.5)$.
  
  Khoảng cách ngắn nhất là khoảng cách từ $M$ đến đường $d: 3x + y - 10 = 0$:
  $ d_{min} = (|3(1.5) + 3.5 - 10|) / sqrt(3^2 + 1^2) = (|4.5 + 3.5 - 10|) / sqrt(10) = 2 / sqrt(10) approx 0.632 " (km)" $
  *Kết luận:* Drone có thể tiếp cận vùng lũ ở khoảng cách gần nhất là $0.632$ km.
])

#v(0.5em)

#cannon-box("Mô hình 2: Tàu lượn siêu tốc và Cáp treo (Hàm Đa Thức Bậc 3)", [
  *Bài toán:* Trong một công viên giải trí, hệ thống đường ray của tàu lượn siêu tốc (Roller Coaster) uốn lượn theo hàm số $y = x^3 - 3x^2 + 5x + 2$. Cùng lúc đó, tuyến cáp treo tham quan chạy vắt ngang qua không trung theo đường thẳng $y = 5x - 10$. Ban quản lý cần xác định khoảng cách không gian ngắn nhất giữa tàu lượn và cáp treo để đảm bảo an toàn tĩnh không.

  *Giải pháp:*
  Đường cáp treo $d: y = 5x - 10 => 5x - y - 10 = 0$.
  Tiếp tuyến tại điểm gần nhất trên quỹ đạo tàu lượn phải song song với cáp treo, tức là đạo hàm $y' = 5$.
  - $y' = 3x^2 - 6x + 5 = 5$
  - $3x^2 - 6x = 0 => x = 0 " hoặc " x = 2$.
  
  Chúng ta tìm được 2 điểm ứng viên (hai khúc lượn sóng có tiếp tuyến cùng độ dốc):
  - Điểm $A$: Tại $x=0 => y=2$. Tiếp tuyến đi qua $A(0, 2)$ là $d_1: 5x - y + 2 = 0$.
  - Điểm $B$: Tại $x=2 => y = 8 - 12 + 10 + 2 = 8$. Tiếp tuyến đi qua $B(2, 8)$ là $d_2: 5x - y - 2 = 0$.
  
  Do hai tiếp tuyến này cùng song song với cáp treo $d: 5x - y - 10 = 0$, ta tính khoảng cách giữa hai tiếp tuyến với $d$ để xem nhánh nào gần hơn:
  - Khoảng cách từ nhánh $A$ tới cáp treo: $d_A = (|2 - (-10)|) / sqrt(5^2 + (-1)^2) = 12 / sqrt(26)$.
  - Khoảng cách từ nhánh $B$ tới cáp treo: $d_B = (|-2 - (-10)|) / sqrt(26) = 8 / sqrt(26)$.
  
  Rõ ràng $d_B < d_A$. Điểm "nguy hiểm" nhất chính là lúc tàu lượn lướt qua lượn xuống tại $x=2$. Khoảng cách an toàn tối thiểu là $8 / sqrt(26) approx 1.57$ đơn vị.
])

#v(0.5em)

#cannon-box("Mô hình 3: Vành đai nhiệt điện - Hàm Mũ & Logarit", [
  *Bài toán:* Một nhà máy nhiệt điện xả nước thải làm mát lan tỏa theo ranh giới nhiệt độ $y = e^x$. Một khu bảo tồn sinh thái phát triển tự nhiên dọc theo đường bờ viền $y = \ln(x)$. Chính quyền cần xây dựng một *Hành lang cách ly sinh thái* thẳng tắp nằm kẹp giữa hai khu vực này. Hỏi hành lang này có bề rộng hẹp nhất là bao nhiêu?

  *Giải pháp:*
  Nhận xét sắc bén: Hàm số $y = e^x$ và $y = \ln(x)$ là hai hàm ngược của nhau, do đó đồ thị của chúng *đối xứng nhau qua đường phân giác $y = x$*. 
  Đường cong nào gần đường trung tâm $y = x$ nhất thì cũng sẽ gần đường cong kia nhất. Ta chỉ cần tìm điểm tiếp xúc trên đường $y = e^x$ sao cho tiếp tuyến song song với $y = x$.
  - Hệ số góc phân giác $a = 1$.
  - Đạo hàm $y' = e^x = 1 => x = 0$.
  
  Tung độ tương ứng $y = e^0 = 1$. Điểm tiếp cận sát nhất từ vùng nhiệt điện là $M(0, 1)$.
  Khoảng cách từ $M(0,1)$ đến đường trung tâm $x - y = 0$ là:
  $ d_0 = (|0 - 1|) / sqrt(1^2 + (-1)^2) = 1 / sqrt(2) $
  
  Vì hai vùng đối xứng, khoảng cách ngắn nhất kẹp giữa 2 vùng sẽ gấp đôi khoảng cách đến đường trung tâm:
  $ d_{min} = 2 times d_0 = 2 times 1 / sqrt(2) = sqrt{2} approx 1.414 " (km)" $
  *Kết luận:* Hành lang sinh thái hẹp nhất đạt mức $approx 1.414$ km. Không cần giải hệ phương trình phức tạp, tính đối xứng đã triệt tiêu hoàn toàn sự cồng kềnh của bài toán!
])

#v(0.5em)

#cannon-box("Mô hình 4: Khai thác khoáng sản ngầm (Hàm Bậc 4)", [
  *Bài toán:* Một vỉa quặng quý hiếm nằm sâu dưới lòng đất, mặt cắt của vỉa quặng được mô phỏng bằng đồ thị bậc 4: $y = 1/4x^4 - x^3 + 5x$. Một đường hầm chính đang được thi công theo hướng thẳng tắp có phương trình $y = x - 10$. Kỹ sư cần tìm vị trí để đào một giếng nối thẳng đứng (hoặc xiên vuông góc) từ đường hầm chính tới vỉa quặng với chi phí đào thấp nhất (đoạn nối ngắn nhất).

  *Giải pháp:*
  Yêu cầu khoảng cách từ đường hầm $y = x - 10$ đến quỹ đạo quặng là ngắn nhất. Ta tìm hoành độ tiếp điểm bằng cách ép đạo hàm đường bậc 4 bằng với hệ số góc đường hầm $a = 1$.
  - $y' = x^3 - 3x^2 + 5 = 1$
  - $x^3 - 3x^2 + 4 = 0$
  
  Phân tích đa thức thành nhân tử: 
  $(x+1)(x-2)^2 = 0 => x = -1 " hoặc " x = 2$.
  
  Tại $x = -1$: Tung độ vỉa quặng $y = 1/4 - (-1) - 5 = -3.75$.
  - Khoảng cách đến $x - y - 10 = 0$ là: $d_1 = (|-1 - (-3.75) - 10|) / sqrt(2) = 7.25 / sqrt(2)$.
  
  Tại $x = 2$: Tung độ vỉa quặng $y = 4 - 8 + 10 = 6$.
  - Khoảng cách đến $x - y - 10 = 0$ là: $d_2 = (|2 - 6 - 10|) / sqrt(2) = 14 / sqrt(2)$.
  
  So sánh thấy $7.25 < 14$, nên giếng nối ngắn nhất sẽ nằm tại điểm có tọa độ $M(-1, -3.75)$ trên vỉa quặng. Chiều dài đoạn đào là $7.25 / sqrt(2) approx 5.12$ đơn vị chiều dài.
])

