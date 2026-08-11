#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../bbt.typ": bbbt, bbt-opt
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ GIAO DIỆN
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1565C0"), rgb("1976D2"), angle: 0deg),
  stroke: none,
  inset: (x: 15pt, y: 10pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("E67E22")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("E67E22"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1E8449"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Các hộp màu sắc chuẩn ────────────────────────────────────
#let eco-box(body) = block(
  fill: rgb("EEF4FB"), stroke: (left: 4pt + rgb("1565C0"), rest: 0.8pt + rgb("AACCE0")),
  radius: (right: 7pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[#body]

#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFFBF2"), stroke: (left: 4pt + rgb("E67E22"), rest: 0.6pt + rgb("FAD7A0")),
  radius: (right: 6pt), inset: (x: 14pt, y: 11pt), width: 100%,
)[#text(fill: rgb("E67E22"), weight: "bold")[#title]#v(0.3em)#body]

#let ans-box(body) = block(
  fill: rgb("FFFDE7"), stroke: (left: 4pt + rgb("B7950B"), rest: 0.6pt + rgb("F9E79F")),
  radius: (right: 6pt), inset: (x: 14pt, y: 11pt), width: 100%,
)[#text(fill: rgb("7D6608"), weight: "bold")[✅ Kết Luận]#v(0.3em)#body]

#let True(content) = content
#let False(content) = content

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1B3A6B"), rgb("0D1B2A"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 22pt),
  )[
    #text(fill: rgb("E67E22"), size: 10pt, weight: "bold", tracking: 3pt)[
      CHUYÊN ĐỀ ỨNG DỤNG THỰC TẾ
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "bold")[GIỚI HẠN & HÀM SỐ LIÊN TỤC]
    #v(0.4em)
  ]
]

#note-box(title: "MỤC TIÊU HỌC TẬP")[
  - Phân tích sự hội tụ và giới hạn vô cực trong các mô hình thực tế (Sinh thái học, Dược động học).
  - Vận dụng hàm số liên tục và điểm gián đoạn để mô phỏng các hàm chi phí (cước taxi, bãi đỗ xe) và thuế lũy tiến.
  - Sử dụng định lý giá trị trung gian trong phân tích sự tồn tại nghiệm (Giao điểm quỹ đạo).
]

== A. CÁC MÔ HÌNH TRỌNG ĐIỂM VÀ BÀI TẬP MẪU

#eco-box[
    *1. Mô hình Giới hạn Tiệm cận (Limits to Infinity)*
    - *Mô hình Dược động học:* Khi tiêm tĩnh mạch liên tục, nồng độ thuốc trong máu $C(t)$ không tăng lên vô hạn mà sẽ tiệm cận một mức bão hòa $C_max$.
    $ lim_{t -> +oo} C(t) = C_max $
    - *Sức chứa môi trường (Carrying Capacity):* Theo phương trình Logistic $P(t) = K / (1 + A e^(-r t))$, khi thời gian $t -> +oo$, số lượng cá thể sẽ tiến tới sức chứa tối đa của môi trường $K$.
    - *Kinh tế học:* Chi phí trung bình $A(x) = C(x) / x$. Khi sản lượng $x -> +oo$, chi phí cố định bị chia nhỏ, $A(x)$ tiệm cận chi phí biến đổi biên.
]

#eco-box[
    *2. Hàm Bậc Thang (Step Functions) và Điểm Gián Đoạn*
    Trong thực tế, nhiều đại lượng không thay đổi liên tục mà nhảy vọt tại các mốc nhất định (gọi là hàm bước - step functions).
    - *Cước taxi / Cước gửi xe:* Giá tiền giữ nguyên trong một khoảng thời gian, sau đó nhảy lên một mức mới khi bước sang khoảng thời gian tiếp theo.
    - Tại các điểm thời gian chuyển giao này, hàm số bị *gián đoạn*. Giới hạn trái khác giới hạn phải:
    $ lim_{x -> x_0^-} f(x) != lim_{x -> x_0^+} f(x) $
]

#eco-box[
    *3. Sự Liên Tục Trong Thiết Kế và Quản Lý*
    - *Thuế thu nhập lũy tiến:* Để tránh tình trạng người tăng lương lên một chút nhưng đóng thuế vọt lên khiến thu nhập sau thuế bị giảm, các hàm tính thuế thường được thiết kế để *liên tục* tại các mốc chuyển bậc thuế.
    $ lim_{x -> x_0^-} f(x) = lim_{x -> x_0^+} f(x) = f(x_0) $
    - *Thiết kế công nghiệp:* Khi ghép nối hai đoạn đường ray cong hoặc hai đoạn ống, phương trình đường cong của chúng phải liên tục tại điểm nối để không bị gãy khúc (đồng thời đạo hàm cũng phải liên tục để trơn tru).
]

== B. BÀI TẬP TỰ LUYỆN ĐỊNH DẠNG MỚI (2025)

=== PHẦN I: Câu trắc nghiệm nhiều phương án lựa chọn
*(Thí sinh chọn 1 đáp án đúng duy nhất trong 4 phương án)*

#tn(
  id: "M1",
  [Sự tăng trưởng của một loài vi khuẩn trong phòng thí nghiệm được mô hình hóa bởi hàm số $P(t) = (5000) / (1 + 49 e^(-0.2 t))$, trong đó $P(t)$ là số lượng vi khuẩn sau $t$ ngày. Khi thời gian $t$ kéo dài vô tận, số lượng vi khuẩn sẽ tiến gần đến giá trị nào?],
  ([$100$], [$250000$], True([$5000$]), [$+oo$]),
  loigiai: [
    *Bước 1: Tính giới hạn khi $t -> +oo$* 
    
    Ta cần tính $lim_{t -> +oo} P(t)$.
    $ lim_{t -> +oo} (5000) / (1 + 49 e^(-0.2 t)) $
    
    *Bước 2: Phân tích thành phần* 
    
    Khi $t -> +oo$, số mũ $-0.2t -> -oo$.
    Do đó, $e^(-0.2 t) -> 0$.
    Mẫu số tiến tới: $1 + 49 times 0 = 1$.
    
    *Bước 3: Kết luận* 
    
    $ lim_{t -> +oo} P(t) = 5000 / 1 = 5000 $.
    Đây chính là sức chứa tối đa của môi trường (Carrying Capacity).
    
    #ans-box[Số lượng vi khuẩn tiến đến *$5000$*.]
  ]
)

#tn(
  id: "M2",
  [Chi phí sản xuất $x$ sản phẩm (tính bằng triệu đồng) của một nhà máy được cho bởi hàm số $C(x) = 200 + 5x + 0.01x^2$. Chi phí trung bình để sản xuất một sản phẩm là $A(x) = (C(x)) / x$. Mệnh đề nào sau đây biểu diễn giới hạn của chi phí trung bình khi số lượng sản phẩm cực kỳ lớn? (Nếu giả sử dây chuyền vô hạn năng suất)],
  ([$5$ triệu/sp.], [$200$ triệu/sp.], [Tiến tới $0$.], True([Tiến tới $+oo$.])),
  loigiai: [
    *Bước 1: Thiết lập hàm chi phí trung bình* 
    
    $ A(x) = (C(x))/x = (200 + 5x + 0.01x^2)/x = 200/x + 5 + 0.01x $
    
    *Bước 2: Tính giới hạn khi $x -> +oo$* 
    
    $ lim_{x -> +oo} A(x) = lim_{x -> +oo} (200/x + 5 + 0.01x) $
    - $lim_{x -> +oo} 200/x = 0$.
    - $lim_{x -> +oo} 5 = 5$.
    - $lim_{x -> +oo} 0.01x = +oo$.
    
    *Bước 3: Tổng hợp* 
    
    $ 0 + 5 + (+oo) = +oo $.
    Khi sản xuất quá nhiều, do thành phần biến phí $0.01x^2$ tăng bậc 2, chi phí trung bình sẽ bị đẩy lên vô cực (chi phí bảo trì, rủi ro vật lý quá tải).
    
    #ans-box[Chi phí trung bình tiến tới *$+oo$*.]
  ]
)

#tn(
  id: "M3",
  [Giá cước gửi xe máy tại một bãi đỗ xe là: 5.000đ cho 2 giờ đầu tiên (bao gồm cả đúng 2 giờ); sau đó cứ mỗi giờ tiếp theo (hoặc phần lẻ của giờ) sẽ tính thêm 2.000đ. Gọi $f(x)$ là giá tiền (nghìn đồng) phải trả khi gửi xe $x$ giờ ($x > 0$). Hàm số $f(x)$ gián đoạn tại các điểm nào?],
  ([$x = 2$], True([$x = 2, 3, 4, ...$]), [$x = 1, 2, 3, ...$], [Hàm số liên tục trên mọi $x$]),
  loigiai: [
    *Bước 1: Xây dựng hàm số $f(x)$* 
    
    - Nếu $0 < x <= 2$: $f(x) = 5$.
    - Nếu $2 < x <= 3$: $f(x) = 5 + 2 = 7$.
    - Nếu $3 < x <= 4$: $f(x) = 7 + 2 = 9$.
    - ...
    
    *Bước 2: Kiểm tra giới hạn tại $x = 2$* 
    
    - Giới hạn trái: $lim_{x -> 2^-} f(x) = 5$.
    - Giới hạn phải: $lim_{x -> 2^+} f(x) = 7$.
    Vì giới hạn trái $!=$ giới hạn phải, hàm số gián đoạn tại $x = 2$.
    
    *Bước 3: Khái quát hóa* 
    
    Tại mỗi mốc thời gian nguyên giờ bắt đầu từ 2 (2, 3, 4...), giá cước bị nhảy vọt một nấc. Do đó hàm số bị gián đoạn (nhảy bậc) tại tất cả các mốc thời gian này.
    
    #ans-box[Hàm số bị gián đoạn tại các điểm *$x = 2, 3, 4, ...$*.]
  ]
)

#tn(
  id: "M4",
  [Một vật thể được lấy ra từ lò nung và đặt vào môi trường có nhiệt độ $25 degree C$. Theo định luật làm nguội của Newton, nhiệt độ của vật sau $t$ phút được cho bởi công thức $T(t) = 25 + 800 e^(-0.05 t) (degree C)$. Nhiệt độ ban đầu của vật khi vừa lấy ra khỏi lò nung và nhiệt độ tiệm cận của nó khi để ngoài môi trường rất lâu lần lượt là:],
  (True([$825 degree C$ và $25 degree C$]), [$800 degree C$ và $25 degree C$], [$825 degree C$ và $0 degree C$], [$800 degree C$ và $0 degree C$]),
  loigiai: [
    *Bước 1: Tính nhiệt độ ban đầu* 
    
    Nhiệt độ ban đầu ứng với thời điểm $t = 0$.
    $ T(0) = 25 + 800 e^(-0.05 times 0) = 25 + 800 times 1 = 825 (degree C) $
    
    *Bước 2: Tính nhiệt độ khi $t -> +oo$* 
    
    Giới hạn nhiệt độ khi thời gian cực kỳ lâu (tiệm cận nhiệt độ môi trường):
    $ lim_{t -> +oo} T(t) = lim_{t -> +oo} (25 + 800 e^(-0.05 t)) $
    
    Vì $lim_{t -> +oo} e^(-0.05 t) = 0$, ta có:
    $ lim_{t -> +oo} T(t) = 25 + 800 times 0 = 25 (degree C) $
    
    #ans-box[Nhiệt độ ban đầu là *$825 degree C$* và tiến tới *$25 degree C$*.]
  ]
)


#tn(
  id: "M5",
  [Thuế thu nhập cá nhân được tính theo hàm lũy tiến. Giả sử tại một quốc gia, nếu thu nhập $x <= 50$ triệu đồng thì không phải nộp thuế ($f(x) = 0$). Nếu thu nhập $x > 50$ triệu đồng, người dân phải nộp thuế $10%$ cho phần vượt quá cộng thêm một khoản cố định $A$. Tức là hàm thuế $f(x) = 0.1(x - 50) + A$ khi $x > 50$. Để hệ thống thuế đảm bảo tính công bằng và không bị nhảy vọt tại mốc thu nhập 50 triệu đồng (hàm số liên tục tại $x = 50$), thì hằng số $A$ phải bằng bao nhiêu?],
  ([$A = 5$], [$A = 50$], True([$A = 0$]), [$A = 10$]),
  loigiai: [
    *Bước 1: Tính giới hạn trái và giá trị tại $x = 50$* 
    
    Khi $x <= 50$, hàm số là $f(x) = 0$.
    Do đó $f(50) = 0$ và giới hạn trái: $lim_{x -> 50^-} f(x) = 0$.
    
    *Bước 2: Tính giới hạn phải* 
    
    Khi $x > 50$, $f(x) = 0.1(x - 50) + A$.
    Giới hạn phải: $lim_{x -> 50^+} f(x) = 0.1(50 - 50) + A = 0 + A = A$.
    
    *Bước 3: Điều kiện để hàm số liên tục* 
    
    Để hàm số liên tục tại điểm giao thời $x = 50$, giới hạn trái phải bằng giới hạn phải và bằng giá trị của hàm tại đó:
    $ lim_{x -> 50^-} f(x) = lim_{x -> 50^+} f(x) = f(50) $
    $ 0 = A = 0 => A = 0 $.
    
    #ans-box[Hằng số $A$ phải bằng *$0$*.]
  ]
)

#tn(
  id: "M6",
  [Một công ty cung cấp dịch vụ Internet với bảng giá: Gói cơ bản $200.000$đ/tháng cho $50 "GB"$ dữ liệu đầu tiên, sau đó sẽ tính $5.000$đ cho mỗi $"GB"$ vượt quá. Gọi $f(x)$ là số tiền phải trả (nghìn đồng) cho $x "GB"$ dữ liệu sử dụng trong một tháng. Tính giới hạn $lim_{x -> 50^+} f(x)$.],
  ([$205$], True([$200$]), [$250$], [Không tồn tại]),
  loigiai: [
    *Bước 1: Thiết lập hàm số $f(x)$* 
    
    Hàm số $f(x)$ (đơn vị: nghìn đồng) được viết dưới dạng:
    - Nếu $0 <= x <= 50$: $f(x) = 200$.
    - Nếu $x > 50$: $f(x) = 200 + 5(x - 50)$.
    
    *Bước 2: Phân tích tính liên tục và giới hạn* 
    
    Ta cần tính giới hạn phải khi $x$ tiến tới $50$:
    $ lim_{x -> 50^+} f(x) = lim_{x -> 50^+} (200 + 5(x - 50)) $
    
    Khi $x -> 50^+$, cụm $(x-50) -> 0$.
    Do đó, giới hạn bằng: $200 + 5(0) = 200$.
    
    *(Chú ý: Hàm số này liên tục tại $x=50$ vì giới hạn trái cũng bằng $200$. Nó không phải hàm bậc thang vì phí vượt lưu lượng được tính theo từng đơn vị liên tục chứ không phải "cứ bắt đầu 1 GB tiếp theo là tính tiền nguyên cục")* 
    
    #ans-box[Giới hạn bên phải là *$200$*.]
  ]
)

#tn(
  id: "M7",
  [Trong quá trình thiết kế một con dốc trượt nước, mặt dốc được ghép từ hai parabol khác nhau để thay đổi độ nghiêng. Phương trình mặt dốc mô phỏng (trong hệ tọa độ $O x y$) là $y = x^2$ với $x <= 1$, và $y = a x^2 + b x + c$ với $x > 1$. Để người chơi không bị va vấp, máng trượt phải "nối trơn" (liên tục) tại điểm nối $x = 1$. Mệnh đề nào sau đây biểu diễn chính xác điều kiện để hàm số $y$ liên tục tại $x = 1$?],
  ([$a + b + c = 0$], True([$a + b + c = 1$]), [$a - b + c = 1$], [$2a + b = 2$]),
  loigiai: [
    *Bước 1: Tính tọa độ điểm cuối của đoạn đường thứ nhất* 
    
    Tại điểm nối $x = 1$, giá trị của phương trình thứ nhất là:
    $ y(1) = 1^2 = 1 $
    Giới hạn trái: $lim_{x -> 1^-} y = 1$.
    
    *Bước 2: Tính giới hạn của phương trình thứ hai* 
    
    Giới hạn phải:
    $ lim_{x -> 1^+} (a x^2 + b x + c) = a(1)^2 + b(1) + c = a + b + c $
    
    *Bước 3: Khớp điều kiện liên tục* 
    
    Để ghép nối vừa khít, không bị đứt gãy, giới hạn trái phải bằng giới hạn phải:
    $ a + b + c = 1 $
    (Lưu ý: Để máng trượt trơn nhẵn hoàn toàn và không có "góc nhọn", đạo hàm của hai bên cũng phải bằng nhau, tức là $2a + b = 2$, nhưng bài toán chỉ hỏi điều kiện liên tục bề mặt).
    
    #ans-box[Điều kiện liên tục là *$a + b + c = 1$*.]
  ]
)

#tn(
  id: "M8",
  [Hai nhà du hành vũ trụ di chuyển theo hai quỹ đạo khác nhau trên cùng một mặt phẳng tọa độ quanh Trái Đất. Quỹ đạo của tàu A là đường thẳng $y = x + 1$. Quỹ đạo của tàu B là đường cong $y = e^x - 2$. Để biết hai tàu có khả năng đâm vào nhau hay không, hệ thống tính toán xem phương trình $e^x - x - 3 = 0$ có nghiệm hay không. Bằng Định lý giá trị trung gian, khoảng nào sau đây chắc chắn chứa nghiệm của phương trình (tức là giao điểm)?],
  ([$[-1, 0]$], [$[-2, -1]$], True([$[1, 2]$]), [$[0, 1]$]),
  loigiai: [
    *Bước 1: Thiết lập hàm số* 
    
    Xét hàm số $f(x) = e^x - x - 3$. 
    Hàm số này liên tục trên tập số thực $RR$.
    
    *Bước 2: Thử giá trị tại các đầu mút (Định lý giá trị trung gian)* 
    
    Nếu $f(a) times f(b) < 0$ thì phương trình $f(x) = 0$ có ít nhất một nghiệm trong khoảng $(a, b)$.
    - Khoảng $[0, 1]$: 
      $f(0) = e^0 - 0 - 3 = 1 - 3 = -2 < 0$.
      $f(1) = e - 1 - 3 = e - 4 approx 2.718 - 4 < 0$. (Chưa đổi dấu).
    - Khoảng $[1, 2]$:
      $f(1) = e - 4 < 0$.
      $f(2) = e^2 - 2 - 3 = e^2 - 5 approx 7.389 - 5 = 2.389 > 0$.
    
    *Bước 3: Kết luận* 
    
    Vì $f(1) times f(2) < 0$ và hàm số liên tục trên $[1, 2]$, phương trình chắc chắn có ít nhất 1 nghiệm trong khoảng $(1, 2)$.
    
    #ans-box[Khoảng chứa giao điểm là *$[1, 2]$*.]
  ]
)

#tn(
  id: "M9",
  [Một vận động viên nhảy dù nhảy khỏi máy bay. Do lực cản của không khí, vận tốc rơi của người đó (tính bằng m/s) được mô hình hóa bởi hàm số $v(t) = 55(1 - e^(-0.2 t))$, trong đó $t$ là thời gian tính bằng giây kể từ lúc bắt đầu rơi. Tính vận tốc rơi tối đa (vận tốc tới hạn) mà người đó có thể đạt được khi rơi trong một thời gian rất dài.],
  ([$0$ m/s], [$22$ m/s], True([$55$ m/s]), [$+oo$ m/s]),
  loigiai: [
    *Bước 1: Hiểu ý nghĩa vật lý* 
    
    Khi thời gian rơi rất dài ($t -> +oo$), lực cản không khí sẽ cân bằng với trọng lực, làm cho vận tốc không tăng thêm nữa mà đạt một "vận tốc tới hạn" (terminal velocity).
    
    *Bước 2: Tính giới hạn toán học* 
    
    Vận tốc tới hạn chính là giới hạn:
    $ lim_{t -> +oo} v(t) = lim_{t -> +oo} 55(1 - e^(-0.2 t)) $
    
    Khi $t -> +oo$, số mũ $-0.2 t -> -oo$. Do đó $e^(-0.2 t) -> 0$.
    
    *Bước 3: Tính toán kết quả* 
    
    $ lim_{t -> +oo} v(t) = 55(1 - 0) = 55 $ (m/s).
    
    #ans-box[Vận tốc rơi tối đa đạt được là *$55$ m/s*.]
  ]
)

#tn(
  id: "M10",
  [Một khoản tiền gửi ngân hàng $P$ được tính lãi kép liên tục với lãi suất danh nghĩa $r$ mỗi năm. Hàm số mô tả số dư trong tài khoản sau $t$ năm là $A(n) = P(1 + r/n)^(n t)$, với $n$ là số lần ghép lãi trong một năm. Khi ngân hàng ghép lãi liên tục (tức là $n -> +oo$), số dư tài khoản sẽ tiệm cận công thức nào sau đây?],
  ([$A = P(1 + r)^t$], [$A = P(1 + r t)$], True([$A = P e^(r t)$]), [$A = P e^(r/t)$]),
  loigiai: [
    *Bước 1: Nhắc lại giới hạn cơ bản* 
    
    Trong giải tích, giới hạn cơ bản liên quan đến số $e$ là:
    $ lim_{x -> +oo} (1 + 1/x)^x = e $
    Hoặc tổng quát hơn: $lim_{n -> +oo} (1 + k/n)^n = e^k$.
    
    *Bước 2: Biến đổi hàm số $A(n)$* 
    
    Ta cần tính giới hạn:
    $ lim_{n -> +oo} P(1 + r/n)^(n t) = P ( lim_{n -> +oo} (1 + r/n)^n )^t $
    
    *Bước 3: Áp dụng giới hạn cơ bản* 
    
    $ lim_{n -> +oo} (1 + r/n)^n = e^r $.
    Do đó, $A = P (e^r)^t = P e^(r t)$.
    Đây chính là công thức lãi kép liên tục nổi tiếng trong tài chính.
    
    #ans-box[Số dư tiệm cận công thức *$A = P e^(r t)$*.]
  ]
)

#tn(
  id: "M11",
  [Trong một mạch điện RC, điện áp trên tụ điện khi đang sạc được cho bởi $V(t) = 12(1 - e^(-t/5))$, trong đó $t$ tính bằng giây và $V$ tính bằng vôn (V). Nếu để mạch sạc trong một thời gian vô hạn, điện áp trên tụ điện sẽ tiến gần đến giới hạn nào?],
  ([$5$ V], True([$12$ V]), [$0$ V], [$2.4$ V]),
  loigiai: [
    *Bước 1: Tính giới hạn điện áp* 
    
    Ta tính $lim_{t -> +oo} V(t)$.
    $ lim_{t -> +oo} 12(1 - e^(-t/5)) $
    
    *Bước 2: Đánh giá thành phần mũ* 
    
    Khi $t -> +oo$, biểu thức $-t/5 -> -oo$.
    Hàm số mũ $e^(-t/5)$ sẽ tiến về $0$.
    
    *Bước 3: Kết luận* 
    
    Thay giá trị giới hạn vào hàm:
    $ V_max = 12(1 - 0) = 12 \ (V) $.
    Đây chính là điện áp của nguồn (bão hòa tụ).
    
    #ans-box[Điện áp trên tụ sẽ tiến tới *$12$ V*.]
  ]
)

#tn(
  id: "M12",
  [Theo "đường cong kinh nghiệm" (Learning Curve) trong quản trị sản xuất, chi phí trung bình để sản xuất một đơn vị sản phẩm sẽ giảm dần khi công nhân làm quen với công việc. Giả sử chi phí trung bình $C(x)$ (đơn vị: nghìn đồng) để sản xuất chiếc áo thứ $x$ được mô hình hóa bởi $C(x) = 150 + 400/x$. Giới hạn của chi phí trung bình này khi $x -> +oo$ có ý nghĩa thực tế là gì?],
  ([Chi phí sẽ giảm về 0 nếu sản xuất vô hạn.], [Chi phí trung bình thấp nhất có thể đạt được là 550 nghìn đồng.], [Chi phí nguyên vật liệu bị triệt tiêu theo thời gian.], True([Dù công nhân có thành thạo đến đâu, chi phí sản xuất mỗi chiếc áo không thể giảm xuống dưới 150 nghìn đồng.])),
  loigiai: [
    *Bước 1: Tính toán giới hạn* 
    
    Tính $lim_{x -> +oo} C(x)$:
    $ lim_{x -> +oo} (150 + 400/x) = 150 + 0 = 150 $ (nghìn đồng).
    
    *Bước 2: Phân tích ý nghĩa thực tế* 
    
    Thành phần $400/x$ đại diện cho chi phí "học việc", rèn luyện kỹ năng, hao phí ban đầu. Nó giảm dần về 0 khi công nhân làm đủ nhiều.
    Thành phần hằng số $150$ đại diện cho chi phí cứng không thể tối ưu thêm (tiền vải, chỉ, khấu hao máy móc tối thiểu).
    
    *Bước 3: Kết luận* 
    
    Giới hạn này chứng tỏ chi phí luôn bị chặn dưới bởi 150 nghìn đồng, không thể tối ưu hóa thấp hơn mức này chỉ bằng cách tăng số lượng.
    
    #ans-box[Chi phí không thể giảm xuống dưới mức sàn là *$150$ nghìn đồng*.]
  ]
)

#tn(
  id: "M13",
  [Một lượng chất thải hữu cơ được xả vào hồ. Mức độ ô nhiễm (tính bằng miligam/lít) sau $t$ ngày được ước tính bởi hàm số $C(t) = 5 + 45 e^(-0.15 t)$. Hỏi sau một thời gian rất dài ($t -> +oo$), mức độ ô nhiễm trong hồ sẽ là bao nhiêu?],
  ([$0$ mg/l], True([$5$ mg/l]), [$45$ mg/l], [$50$ mg/l]),
  loigiai: [
    *Bước 1: Đánh giá hàm số theo thời gian* 
    
    Mức độ ô nhiễm gồm một phần phân hủy theo hàm mũ $45 e^(-0.15 t)$ và một mức nền không đổi là $5$.
    
    *Bước 2: Tính giới hạn vô cực* 
    
    $ lim_{t -> +oo} C(t) = lim_{t -> +oo} (5 + 45 e^(-0.15 t)) $
    Khi $t -> +oo$, $e^(-0.15 t) -> 0$.
    $ lim_{t -> +oo} C(t) = 5 + 45(0) = 5 $.
    
    *Bước 3: Diễn giải* 
    
    Mặc dù tự nhiên có khả năng tự phân hủy chất thải, nhưng hồ vẫn còn tồn dư một mức ô nhiễm nền là $5$ mg/l mà quá trình phân hủy sinh học không thể làm sạch hết.
    
    #ans-box[Mức độ ô nhiễm tiệm cận *$5$ mg/l*.]
  ]
)

#tn(
  id: "M14",
  [Cước phí gửi một bưu kiện được bưu điện tính theo hàm bậc thang: $15.000$đ cho $50$ gam đầu tiên (kể cả đúng $50$g). Với mỗi $50$ gam tiếp theo (hoặc phần lẻ của $50$g), khách hàng phải trả thêm $5.000$đ. Khẳng định nào sau đây là *SAI* khi nói về tính liên tục của hàm chi phí $C(x)$ (với $x$ là khối lượng bưu kiện, tính bằng gam)?],
  ([Hàm số $C(x)$ bị gián đoạn tại $x = 50$.], [Giới hạn trái $lim_{x -> 50^-} C(x) = 15.000$.], True([Giới hạn phải $lim_{x -> 50^+} C(x) = 15.000$.]), [Tại $x = 100$, hàm số bị nhảy bậc từ $20.000$đ lên $25.000$đ.]),
  loigiai: [
    *Bước 1: Viết tường minh hàm cước phí $C(x)$* 
    
    - Với $0 < x <= 50$: $C(x) = 15.000$.
    - Với $50 < x <= 100$: $C(x) = 15.000 + 5.000 = 20.000$.
    - Với $100 < x <= 150$: $C(x) = 20.000 + 5.000 = 25.000$.
    
    *Bước 2: Kiểm tra các mốc gián đoạn* 
    
    Tại $x = 50$:
    - Giới hạn trái: $lim_{x -> 50^-} C(x) = 15.000$.
    - Giới hạn phải: $lim_{x -> 50^+} C(x) = 20.000$. (Do vừa lố 50g đã phải trả thêm 5.000đ).
    
    *Bước 3: Đánh giá các mệnh đề* 
    
    Mệnh đề "Giới hạn phải $lim_{x -> 50^+} C(x) = 15.000$" là sai, vì giới hạn phải bằng $20.000$.
    
    #ans-box[Mệnh đề sai là: *Giới hạn phải bằng 15.000*.]
  ]
)

#tn(
  id: "M15",
  [Trong hệ thống đường sắt đô thị, để chuyển từ một đoạn đường thẳng sang một đoạn đường cong tròn, người ta dùng một đường cong chuyển tiếp (ví dụ đường cong Clothoid) để tránh lực ly tâm thay đổi đột ngột gây lật tàu. Yêu cầu tối thiểu về toán học đối với quỹ đạo tại điểm tiếp nối giữa hai đoạn đường ray là gì?],
  ([Đạo hàm tại điểm nối phải bằng 0.], [Chỉ cần giới hạn trái bằng giới hạn phải của phương trình quỹ đạo.], True([Hàm số và đạo hàm bậc nhất của nó đều phải liên tục tại điểm tiếp nối.]), [Quỹ đạo không được phép là hàm liên tục.]),
  loigiai: [
    *Bước 1: Ý nghĩa của sự liên tục hàm số* 
    
    Nếu hàm số quỹ đạo $y = f(x)$ không liên tục tại điểm nối ($lim_{x -> x_0^-} f(x) != lim_{x -> x_0^+} f(x)$), đường ray sẽ bị đứt gãy, tàu sẽ trật bánh. Do đó nó *bắt buộc* phải liên tục.
    
    *Bước 2: Ý nghĩa của đạo hàm liên tục* 
    
    Đạo hàm $f'(x)$ thể hiện hệ số góc (hướng tiếp tuyến). Nếu $f'(x)$ không liên tục, đường ray sẽ có một "góc nhọn" (corner). Tàu đi qua góc nhọn sẽ bị bẻ lái đột ngột, gây sốc lực và tai nạn. Do đó đạo hàm cũng phải liên tục (tiếp tuyến phải khớp nhau).
    (Trong thực tế kỹ thuật, đạo hàm bậc 2 cũng cần liên tục để tránh bước nhảy lực ly tâm).
    
    *Bước 3: Kết luận* 
    
    Yêu cầu tối thiểu là cả hàm số và đạo hàm bậc 1 đều phải liên tục.
    
    #ans-box[Cả hàm số và đạo hàm bậc 1 đều phải *liên tục*.]
  ]
)


=== PHẦN II: Câu trắc nghiệm đúng sai
*(Thí sinh trả lời ĐÚNG hoặc SAI cho mỗi ý a, b, c, d của từng câu hỏi)*

#ds(
  id: "D1",
  [Sự thay đổi số lượng cá thể của một quần thể động vật trong một khu bảo tồn sinh thái được dự báo bằng mô hình logistic: $P(t) = 12000 / (1 + 3 e^(-0.1 t))$, trong đó $P(t)$ là số lượng cá thể và $t$ là số năm kể từ hiện tại ($t >= 0$). Dựa vào mô hình, hãy xác định các nhận định sau đây đúng hay sai:],
  (
    [a) Số lượng cá thể của quần thể ở thời điểm hiện tại (năm 0) là $3000$ con.],
    [b) Sau khoảng thời gian rất dài, số lượng cá thể có thể vượt qua mức $13000$ con.],
    [c) Sức chứa tối đa (Carrying Capacity) của khu bảo tồn đối với loài động vật này là $12000$ cá thể.],
    [d) Giới hạn của hàm số khi thời gian tiến tới vô cực cho thấy không có giới hạn sinh thái, quần thể sẽ bùng nổ vô hạn.]
  ),
  (True, False, True, False),
  loigiai: [
    *Phân tích hàm số:* 
    
    Hàm số $P(t) = 12000 / (1 + 3 e^(-0.1 t))$.
    
    *Xét từng mệnh đề:* 
    
    - *a)* Tại $t=0$, $P(0) = 12000 / (1 + 3 times e^0) = 12000 / (1+3) = 12000 / 4 = 3000$. (ĐÚNG).
    - *b)* Khi $t -> +oo$, lượng $e^(-0.1 t) -> 0$.
      Do đó, $lim_{t -> +oo} P(t) = 12000 / (1 + 3 times 0) = 12000$.
      Dân số tối đa chỉ tiệm cận về $12000$ con, không thể vượt qua mức này, càng không thể lên tới $13000$. (SAI).
    - *c)* Giới hạn khi $t -> +oo$ chính là sức chứa của môi trường $K = 12000$. (ĐÚNG).
    - *d)* Mô hình logistic giới hạn sự tăng trưởng nhờ vào mẫu số chứa biến mũ âm. Quần thể bị chặn trên bởi $12000$, do đó nó không bùng nổ vô hạn. (SAI).
    
    #ans-box[a. Đúng, b. Sai, c. Đúng, d. Sai.]
  ]
)

#ds(
  id: "D2",
  [Một quốc gia áp dụng hệ thống thuế thu nhập cá nhân được tính bằng hàm $T(x)$, với $x$ là thu nhập tính thuế (đơn vị: triệu đồng).
$ T(x) = cases(
  0.05 x &"khi" 0 < x <= 10,
  0.1 x - 0.5 &"khi" 10 < x <= 30,
  a x + b &"khi" x > 30
) $
Biết rằng bộ tài chính thiết kế để hàm $T(x)$ phải liên tục trên toàn bộ miền xác định $(0; +oo)$ nhằm đảm bảo tính công bằng thuế, và tỷ lệ thuế biên (hệ số $a$) cho mức thu nhập trên $30$ triệu là $20%$ (tức là $a = 0.2$).],
  (
    [a) Hàm số $T(x)$ liên tục tại $x = 10$.],
    [b) Tiền thuế phải nộp cho người có thu nhập $30$ triệu đồng là $2.5$ triệu đồng.],
    [c) Để hàm số liên tục tại điểm giao $x = 30$, giá trị của $b$ phải bằng $-3.5$.],
    [d) Nếu thu nhập của một người tăng từ 30 triệu lên 31 triệu thì số tiền nộp thuế sẽ tăng đột biến (nhảy vọt) lên mức $6.2$ triệu đồng.]
  ),
  (True, True, True, False),
  loigiai: [
    *Phân tích tính liên tục của hàm số:* 
    
    - Tại mốc $x = 10$:
      + Giới hạn trái: $lim_{x -> 10^-} T(x) = 0.05 times 10 = 0.5$.
      + Giới hạn phải: $lim_{x -> 10^+} T(x) = 0.1 times 10 - 0.5 = 1 - 0.5 = 0.5$.
      + Giá trị hàm: $T(10) = 0.5$.
      + Hai giới hạn bằng nhau, hàm liên tục tại 10. (Mệnh đề a ĐÚNG).
      
    - Tại mốc $x = 30$:
      + Giới hạn trái: $lim_{x -> 30^-} T(x) = 0.1 times 30 - 0.5 = 3 - 0.5 = 2.5$.
      + Đồng thời $T(30) = 2.5$. Do đó tiền thuế cho người thu nhập 30 triệu là 2.5 triệu. (Mệnh đề b ĐÚNG).
      + Giới hạn phải: $lim_{x -> 30^+} T(x) = a times 30 + b = 30a + b$.
      + Theo đề bài, $a = 0.2$ (thuế biên $20%$).
      + Để liên tục, giới hạn phải bằng giới hạn trái: $30(0.2) + b = 2.5 => 6 + b = 2.5 => b = -3.5$. (Mệnh đề c ĐÚNG).
      
    - Đánh giá sự nhảy vọt:
      Vì hàm số đã được thiết kế liên tục (với $b = -3.5$), nên thu nhập tăng nhẹ thì thuế cũng chỉ tăng tương ứng theo tỉ lệ tuyến tính (không có sự nhảy vọt bậc thang). Cụ thể tại $x = 31$, $T(31) = 0.2 times 31 - 3.5 = 6.2 - 3.5 = 2.7$ triệu (tăng nhẹ từ 2.5, chứ không phải vọt lên 6.2). (Mệnh đề d SAI).
    
    #ans-box[a. Đúng, b. Đúng, c. Đúng, d. Sai.]
  ]
)

#ds(
  id: "D3",
  [Trong động lực học, vận tốc $v(t)$ (đơn vị: m/s) của một vật thể rơi tự do có tính đến lực cản của không khí được cho bởi phương trình $v(t) = 50(1 - e^(-0.2 t))$, với $t >= 0$ là thời gian rơi tính bằng giây. Dựa vào mô hình toán học này, xét tính đúng sai của các nhận định sau:],
  (
    [a) Vận tốc ban đầu của vật thể tại thời điểm thả ($t = 0$) là $50$ m/s.],
    [b) Gia tốc rơi của vật thể (sự thay đổi vận tốc) ngày càng tăng khi thời gian trôi qua.],
    [c) Vận tốc tới hạn (vận tốc lớn nhất mà vật có thể đạt được khi rơi rất lâu) là $50$ m/s.],
    [d) Phải mất một khoảng thời gian vô hạn để vật thể đạt được chính xác vận tốc $50$ m/s.]
  ),
  (False, False, True, True),
  loigiai: [
    *Phân tích vật lý và toán học:* 
    
    - *a)* Tại $t=0$, $v(0) = 50(1 - e^0) = 50(1 - 1) = 0$ m/s. Vật bắt đầu rơi từ trạng thái nghỉ. (SAI).
    - *b)* Gia tốc $a(t) = v'(t) = 50 times 0.2 e^(-0.2 t) = 10 e^(-0.2 t)$. Khi $t$ tăng, $e^(-0.2 t)$ giảm, nên gia tốc *giảm dần* về 0 (lực cản dần cân bằng với trọng lực). (SAI).
    - *c)* Vận tốc tới hạn $lim_{t -> +oo} v(t) = 50(1 - 0) = 50$ m/s. (ĐÚNG).
    - *d)* Phương trình $50(1 - e^(-0.2 t)) = 50 => e^(-0.2 t) = 0$. Phương trình này vô nghiệm với mọi $t$ hữu hạn. Chỉ khi $t -> +oo$ thì giới hạn mới bằng 50. (ĐÚNG).
    
    #ans-box[a. Sai, b. Sai, c. Đúng, d. Đúng.]
  ]
)

#ds(
  id: "D4",
  [Một công ty sản xuất bao bì áp dụng chính sách chiết khấu lũy thoái cho khách hàng mua sỉ. Gọi $x$ là số lượng sản phẩm (nghìn cái) và $C(x)$ là tổng số tiền khách hàng phải trả (triệu đồng).
$ C(x) = cases(
  10 x &"khi" 0 < x <= 100,
  9 x &"khi" x > 100
) $
Do bộ phận kinh doanh thiết lập hàm giá không tinh tế, hệ thống giá này bị đứt đoạn. Xét tính đúng sai của các phát biểu:],
  (
    [a) Khách hàng mua $100$ nghìn sản phẩm phải trả số tiền là $1000$ triệu đồng (1 tỷ).],
    [b) Khách hàng mua $101$ nghìn sản phẩm chỉ phải trả $909$ triệu đồng.],
    [c) Hàm số $C(x)$ liên tục tại $x = 100$.],
    [d) Để hàm số liên tục và hợp lý hơn, công ty nên đổi chính sách thành: 100 nghìn sản phẩm đầu tính giá 10, từ sản phẩm thứ 100.001 trở đi tính giá 9.]
  ),
  (True, True, False, True),
  loigiai: [
    *Phân tích hàm chi phí:* 
    
    - *a)* Tại $x = 100$, áp dụng công thức trên: $C(100) = 10 times 100 = 1000$ triệu đồng. (ĐÚNG).
    - *b)* Tại $x = 101$, áp dụng công thức dưới: $C(101) = 9 times 101 = 909$ triệu đồng. (ĐÚNG).
    *(Đây là một lỗ hổng trong định giá: mua nhiều hơn lại phải trả ít tiền hơn một cách vô lý).*
    - *c)* Giới hạn trái: $lim_{x -> 100^-} C(x) = 1000$. Giới hạn phải: $lim_{x -> 100^+} C(x) = 900$. Giới hạn trái $!= $ giới hạn phải nên hàm số gián đoạn tại $x=100$. (SAI).
    - *d)* Nếu tính theo lũy tiến từng phần: $C_"new"(x) = 10 times 100 + 9(x - 100) = 1000 + 9(x - 100)$ khi $x > 100$. Khi đó $lim_{x -> 100^+} C_"new"(x) = 1000$, hàm số sẽ liên tục và triệt tiêu lỗ hổng định giá. (ĐÚNG).
    
    #ans-box[a. Đúng, b. Đúng, c. Sai, d. Đúng.]
  ]
)

#ds(
  id: "D5",
  [Trong y khoa, khi một bệnh nhân được tiêm một liều thuốc $D$ miligam, nồng độ thuốc trong máu sẽ giảm dần theo thời gian. Giả sử cứ sau mỗi khoảng thời gian $T$, lượng thuốc trong máu giảm chỉ còn một phần tư ($1/4$). Bệnh nhân được tiêm lặp lại liều $D$ cứ sau mỗi chu kỳ $T$. Gọi $A_n$ là lượng thuốc ngay sau lần tiêm thứ $n$. Xét các mệnh đề sau:],
  (
    [a) Lượng thuốc ngay sau lần tiêm thứ 2 là $A_2 = D + 0.25 D$.],
    [b) Lượng thuốc $A_n$ tạo thành một cấp số nhân có công bội $q = 0.25$.],
    [c) Khi điều trị kéo dài ($n -> +oo$), lượng thuốc tối đa trong máu ngay sau khi tiêm sẽ tiệm cận mức $4/3 D$.],
    [d) Giới hạn của lượng thuốc tối thiểu trong máu (ngay trước khi tiêm liều tiếp theo) tiến về $0$ khi $n -> +oo$.]
  ),
  (True, False, True, False),
  loigiai: [
    *Phân tích quá trình tiêm thuốc:* 
    
    - Lần 1: $A_1 = D$.
    - Lần 2: Lượng cũ còn $D/4$, tiêm thêm $D$ $=> A_2 = D + D/4 = 1.25 D$. (Mệnh đề a ĐÚNG).
    - Lần 3: $A_3 = D + A_2/4 = D + D/4 + D/16$.
    - Lần $n$: $A_n = D (1 + 1/4 + (1/4)^2 + ... + (1/4)^(n-1))$.
    
    *Xét các mệnh đề:* 
    - *b)* Dãy $A_n$ là tổng của một cấp số nhân (chuỗi hình học), bản thân $A_n$ KHÔNG phải là một cấp số nhân. (SAI).
    - *c)* Khi $n -> +oo$, $A_n$ tiến tới tổng của CSN lùi vô hạn với $u_1 = D, q = 1/4$:
      $ lim_{n -> +oo} A_n = D / (1 - 1/4) = D / (3/4) = 4/3 D $. (ĐÚNG).
    - *d)* Lượng thuốc tối thiểu ngay *trước* liều thứ $n+1$ bằng $1/4$ lượng thuốc tối đa ngay *sau* liều thứ $n$.
      $ lim_{n -> +oo} A_min = 1/4 times (4/3 D) = 1/3 D $. Không tiến về 0. (SAI).
    
    #ans-box[a. Đúng, b. Sai, c. Đúng, d. Sai.]
  ]
)

#ds(
  id: "D6",
  [Một kiến trúc sư thiết kế vòm của một đường hầm. Mặt cắt của vòm được ghép từ 3 đoạn cong khác nhau để tạo hiệu ứng thẩm mỹ. Phương trình cao độ của vòm (đơn vị: mét) là:
$ y = f(x) = cases(
  -x^2 + 4 &"khi" -2 <= x < 0,
  a x + b &"khi" 0 <= x <= 2,
  - (x - 4)^2 + 4 &"khi" 2 < x <= 4
) $
Yêu cầu bắt buộc là đường vòm phải liên tục và không bị "gãy khúc" (đạo hàm liên tục) tại $x = 0$ và $x = 2$.],
  (
    [a) Giới hạn bên trái của chiều cao vòm tại $x = 0$ là $4$ mét.],
    [b) Để vòm liên tục tại $x = 0$, hằng số $b$ bắt buộc phải bằng $4$.],
    [c) Để vòm không bị "gãy khúc" tại $x = 0$, hằng số $a$ phải bằng $0$.],
    [d) Có thể tìm được cặp tham số $(a, b)$ để toàn bộ vòm liên tục trên $[-2, 4]$.]
  ),
  (True, True, True, False),
  loigiai: [
    *Phân tích tại điểm nối $x = 0$:* 
    - Giới hạn trái: $lim_{x -> 0^-} (-x^2 + 4) = 4$. (Mệnh đề a ĐÚNG).
    - Giới hạn phải: $lim_{x -> 0^+} (a x + b) = b$.
    - Để hàm số liên tục tại $x = 0 => b = 4$. (Mệnh đề b ĐÚNG).
    - Đạo hàm bên trái tại $0$: $y' = -2x => y'(0) = 0$.
    - Đạo hàm bên phải tại $0$: $y' = a$.
    - Để không gãy khúc (đạo hàm liên tục), $a = 0$. (Mệnh đề c ĐÚNG).
    
    *Phân tích tại điểm nối $x = 2$:* 
    - Với $a=0, b=4$, đoạn giữa là hàm hằng $y = 4$.
    - Tại $x = 2$:
      + Giới hạn trái: $lim_{x -> 2^-} 4 = 4$.
      + Giới hạn phải: $lim_{x -> 2^+} (-(x-4)^2 + 4) = -(2-4)^2 + 4 = -4 + 4 = 0$.
    - Vì giới hạn trái $!= $ giới hạn phải ($4 != 0$), vòm bị nứt gãy (không liên tục) tại $x = 2$. Do ta đã cố định $(a, b) = (0, 4)$ từ điều kiện tại $x=0$, nên không tồn tại cặp $(a, b)$ nào thỏa mãn liên tục ở *cả 2 điểm* cùng lúc. (Mệnh đề d SAI).
    
    #ans-box[a. Đúng, b. Đúng, c. Đúng, d. Sai.]
  ]
)


=== PHẦN III: Câu trắc nghiệm trả lời ngắn
*(Thí sinh điền kết quả số học vào ô trống)*

#tln(
  id: "S1",
  [Sau khi một hóa chất vô tình bị rò rỉ vào hồ nước, nồng độ (phần triệu) của hóa chất này theo thời gian $t$ (tuần) được tính bằng công thức $C(t) = (30t) / (t^2 + 9) + 2$. Khi thời gian kéo dài vô tận, nồng độ của hóa chất trong hồ sẽ ổn định ở mức bao nhiêu phần triệu?],
  [$2$],
  loigiai: [
    *Bước 1: Thiết lập bài toán giới hạn* 
    
    Khi thời gian kéo dài vô tận, ta cần tính giới hạn của hàm nồng độ $C(t)$ khi $t -> +oo$:
    $ lim_{t -> +oo} C(t) = lim_{t -> +oo} ((30t) / (t^2 + 9) + 2) $
    
    *Bước 2: Đánh giá giới hạn của phân thức* 
    
    Xét phân thức $(30t) / (t^2 + 9)$: 
    Bậc của tử số (bậc 1) nhỏ hơn bậc của mẫu số (bậc 2). 
    Do đó:
    $ lim_{t -> +oo} (30t) / (t^2 + 9) = 0 $
    
    *Bước 3: Kết luận* 
    
    $ lim_{t -> +oo} C(t) = 0 + 2 = 2 $
    
    #ans-box[Nồng độ hóa chất ổn định ở mức *$2$ phần triệu*.]
  ]
)

#tln(
  id: "S2",
  [Một kỹ sư đang lập trình quỹ đạo cho một robot tự hành. Để chuyển hướng mà không bị giật, vận tốc của robot được thiết kế bằng một hàm số theo thời gian $t$ (giây). 
$ v(t) = cases(
  (t^2 - 4) / (t - 2) &"khi" 0 <= t < 2,
  a t + 1 &"khi" t >= 2
) $
Để robot không bị giật (vận tốc phải là hàm liên tục tại thời điểm chuyển hướng $t = 2$), kỹ sư cần nạp giá trị $a$ bằng bao nhiêu vào hệ thống? (Viết kết quả dưới dạng số thập phân).],
  [$1.5$],
  loigiai: [
    *Bước 1: Tính giới hạn trái của vận tốc tại $t = 2$* 
    
    Khi $t -> 2^-$, hàm $v(t) = (t^2 - 4) / (t - 2)$.
    Ta có giới hạn dạng $0/0$:
    $ lim_{t -> 2^-} (t^2 - 4) / (t - 2) = lim_{t -> 2^-} ((t - 2)(t + 2)) / (t - 2) = lim_{t -> 2^-} (t + 2) = 4 $
    
    *Bước 2: Tính giới hạn phải và giá trị tại $t = 2$* 
    
    Khi $t -> 2^+$, hàm $v(t) = a t + 1$.
    Giới hạn phải: $lim_{t -> 2^+} (a t + 1) = 2a + 1$.
    Giá trị hàm: $v(2) = 2a + 1$.
    
    *Bước 3: Điều kiện liên tục* 
    
    Để hàm số liên tục tại $t = 2$, giới hạn trái phải bằng giới hạn phải:
    $ 2a + 1 = 4 => 2a = 3 => a = 1.5 $
    
    #ans-box[Giá trị $a$ cần tìm là *$1.5$*.]
  ]
)

#tln(
  id: "S3",
  [Một công ty nghiên cứu thị trường ước tính rằng doanh thu $R$ (tỷ đồng) thu được từ một chiến dịch quảng cáo phụ thuộc vào số tiền chi cho quảng cáo $x$ (tỷ đồng) theo mô hình: $R(x) = (150 x) / (2 + x)$ với $x >= 0$. Theo mô hình này, nếu công ty có thể chi một ngân sách khổng lồ (vô hạn) cho quảng cáo, doanh thu tối đa (mức bão hòa thị trường) mà công ty có thể đạt được là bao nhiêu tỷ đồng?],
  [150],
  loigiai: [
    *Bước 1: Thiết lập giới hạn* 
    
    Doanh thu tối đa khi ngân sách vô hạn chính là giới hạn của $R(x)$ khi $x -> +oo$:
    $ lim_{x -> +oo} R(x) = lim_{x -> +oo} (150 x) / (2 + x) $
    
    *Bước 2: Tính giới hạn* 
    
    Chia cả tử và mẫu cho $x$:
    $ lim_{x -> +oo} 150 / (2/x + 1) = 150 / (0 + 1) = 150 $ (tỷ đồng).
    
    *Bước 3: Kết luận* 
    
    Doanh thu không thể vượt quá $150$ tỷ đồng dù chi bao nhiêu tiền quảng cáo, vì thị trường đã bão hòa.
    
    #ans-box[Doanh thu tối đa tiệm cận là *$150$* tỷ đồng.]
  ]
)

#tln(
  id: "S4",
  [Để khuyến khích tiết kiệm, một công ty điện lực tính giá điện theo bậc. Nếu dùng $x$ kWh ($0 < x <= 200$), giá phải trả là $1.5$ nghìn đồng/kWh. Nếu dùng trên $200$ kWh, biểu giá cho *toàn bộ* số điện sử dụng chuyển sang hàm $P(x) = a x + b$. Biết rằng để biểu giá không bị "nhảy cóc" vô lý tại mốc $200$ kWh (hàm tổng tiền liên tục), và nếu dùng $300$ kWh thì khách hàng phải trả $500$ nghìn đồng. Tìm giá trị của $a$ (tính bằng nghìn đồng).],
  [2],
  loigiai: [
    *Bước 1: Tính số tiền tại mốc 200 kWh* 
    
    Khi $x = 200$, số tiền phải trả là:
    $ f(200) = 1.5 times 200 = 300 $ (nghìn đồng).
    Giới hạn trái $lim_{x -> 200^-} f(x) = 300$.
    
    *Bước 2: Sử dụng điều kiện liên tục* 
    
    Để hàm liên tục tại $x = 200$, giới hạn phải phải bằng giới hạn trái:
    $ lim_{x -> 200^+} (a x + b) = 300 => 200a + b = 300 quad (1) $
    
    *Bước 3: Sử dụng giả thiết tại 300 kWh* 
    
    Tại $x = 300$, số tiền là $500$ nghìn đồng:
    $ 300a + b = 500 quad (2) $
    
    *Bước 4: Giải hệ phương trình* 
    
    Lấy (2) trừ (1):
    $ 100a = 200 => a = 2 $
    (Và $b = 300 - 400 = -100$).
    
    #ans-box[Giá trị của tham số $a$ là *$2$*.]
  ]
)

#tln(
  id: "S5",
  [Trong quá trình luyện kim, một thỏi kim loại đang ở nhiệt độ $800$ độ C (Celsius) được đưa vào lò làm nguội. Theo định luật Newton, nhiệt độ của thỏi kim loại sau $t$ phút là $T(t) = 30 + 770 e^(-k t)$, với $30$ độ C là nhiệt độ môi trường. Biết rằng sau $10$ phút, nhiệt độ giảm xuống còn $415$ độ C. Hỏi giới hạn nhiệt độ của thỏi kim loại khi $t -> +oo$ là bao nhiêu độ C?],
  [30],
  loigiai: [
    *Bước 1: Đánh giá hàm nhiệt độ* 
    
    Ta cần tính $lim_{t -> +oo} T(t) = lim_{t -> +oo} (30 + 770 e^(-k t))$.
    
    *Bước 2: Phân tích thành phần mũ* 
    
    Vì $k > 0$ (hằng số làm nguội), khi $t -> +oo$ thì $-k t -> -oo$.
    Do đó, $e^(-k t) -> 0$.
    
    *Bước 3: Tính giới hạn* 
    
    $ lim_{t -> +oo} T(t) = 30 + 770 times 0 = 30 $.
    (Dữ kiện "sau 10 phút còn 415 độ C" chỉ để tìm $k$, không ảnh hưởng đến giới hạn khi $t -> +oo$. Nhiệt độ vật luôn tiệm cận nhiệt độ môi trường).
    
    #ans-box[Giới hạn nhiệt độ là *$30$* độ C.]
  ]
)

#tln(
  id: "S6",
  [Một hệ thống máy chủ xử lý dữ liệu đám mây có khả năng xử lý song song. Khi số lượng máy chủ (Node) là $n$, tốc độ xử lý của hệ thống (tính bằng Terabytes/giây) được mô hình hóa bằng hàm số $V(n) = (50 n^2 + 10 n) / (2 n^2 + 5)$. Nếu mạng lưới đám mây này được mở rộng vô hạn ($n -> +oo$), tốc độ xử lý lý thuyết tối đa (giới hạn băng thông) của toàn bộ hệ thống là bao nhiêu Terabytes/giây?],
  [25],
  loigiai: [
    *Bước 1: Thiết lập bài toán giới hạn* 
    
    Tốc độ tối đa khi mở rộng vô hạn chính là:
    $ lim_{n -> +oo} V(n) = lim_{n -> +oo} (50 n^2 + 10 n) / (2 n^2 + 5) $
    
    *Bước 2: Tính toán giới hạn của hàm phân thức* 
    
    Cả tử và mẫu đều là đa thức bậc 2. Ta chia cả tử và mẫu cho $n^2$:
    $ lim_{n -> +oo} (50 + 10/n) / (2 + 5/n^2) $
    
    Khi $n -> +oo$, các thành phần $10/n -> 0$ và $5/n^2 -> 0$.
    
    *Bước 3: Kết luận* 
    
    Giới hạn thu được là: $50 / 2 = 25$ (Terabytes/giây).
    Dù có thêm bao nhiêu máy chủ, do độ trễ truyền tải mạng (overhead), tốc độ cũng không thể vượt ngưỡng này.
    
    #ans-box[Tốc độ tối đa tiệm cận là *$25$* Terabytes/giây.]
  ]
)
