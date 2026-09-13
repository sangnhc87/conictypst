#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("6d28d9") // Purple Violet

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN",
  exam-title: "CHỦ ĐỀ 1E: DI CHUYỂN, VẬN TỐC & QUY HOẠCH ĐƯỜNG ĐI (SNELL & FERMAT) (VD - VDC)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "505",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

#tn(
  [Một giàn khoan dầu khí $A$ nằm ngoài khơi cách bờ biển một khoảng $A H = 6$ km. Nhà máy lọc dầu $C$ nằm trên bờ biển cách hình chiếu $H$ một khoảng $H C = 15$ km. Để dẫn dầu từ giàn khoan về nhà máy, người ta lắp đặt đường ống dưới biển từ $A$ đến điểm $M$ trên bờ biển (nằm giữa $H$ và $C$), rồi sau đó lắp đường ống trên đất liền từ $M$ đến $C$. Chi phí lắp đường ống dưới biển là $5$ tỷ đồng/km, chi phí trên đất liền là $3$ tỷ đồng/km. Khoảng cách $H M$ bằng bao nhiêu để tổng chi phí lắp đặt đường ống là nhỏ nhất?],
  (
    [$4","5$ km],
    True([$4","5$ km]),
    [$5$ km],
    [$6$ km],
    [$3$ km]
  ),
  loigiai: [
    #step([Thiết lập hàm chi phí])
    Đặt $H M = x$ (km) với $0 <= x <= 15$.
    Khoảng cách trên biển: $A M = sqrt(A H^2 + H M^2) = sqrt(36 + x^2)$ (km).
    Khoảng cách trên đất liền: $M C = 15 - x$ (km).
    Tổng chi phí lắp đặt:
    $f(x) = 5 sqrt(36 + x^2) + 3(15 - x) quad ("tỷ đồng").$

    #step([Khảo sát hàm số tìm cực trị])
    Đạo hàm:
    $f'(x) = (5x) / sqrt(36 + x^2) - 3.$
    Cho $f'(x) = 0 <=> 5x = 3 sqrt(36 + x^2) <=> 25x^2 = 9(36 + x^2) <=> 16x^2 = 324 <=> x^2 = 81/4 <=> x = 9/2 = 4","5$ km (vì $x > 0$).
    Vì hàm số liên tục trên $[0; 15]$ và $f'(x)$ đổi dấu từ âm sang dương qua $x = 4","5$ nên $f(x)$ đạt giá trị nhỏ nhất tại $x = 4","5$ km.
  ]
)

#tn(
  [Một nhân viên cứu hộ ở vị trí $A$ trên bãi cát cách mép nước $30$ m. Một người tắm biển gặp nạn ở vị trí $B$ cách mép nước $40$ m. Khoảng cách giữa hai hình chiếu $A', B'$ của $A$ và $B$ lên mép nước là $A' B' = 100$ m. Biết vận tốc chạy trên cát của nhân viên cứu hộ là $5$ m/s và vận tốc bơi trong nước là $2$ m/s. Điểm chạm mép nước $M$ của nhân viên cứu hộ nên cách $A'$ một đoạn $x$ thỏa mãn hệ thức nào sau đây để thời gian đến ứng cứu nạn nhân là ngắn nhất?],
  (
    True([$(x)/(5 sqrt(900 + x^2)) = (100 - x)/(2 sqrt(1600 + (100 - x)^2))$]),
    [$(x)/(2 sqrt(900 + x^2)) = (100 - x)/(5 sqrt(1600 + (100 - x)^2))$],
    [$(5x)/sqrt(900 + x^2) = (2(100 - x))/sqrt(1600 + (100 - x)^2)$],
    [$x / 5 = (100 - x) / 2$]
  ),
  loigiai: [
    #step([Nguyên lý Fermat và hàm thời gian])
    Đặt $A' M = x$ ($0 <= x <= 100$, đơn vị mét). Khi đó $M B' = 100 - x$.
    Quãng đường chạy trên cát: $A M = sqrt(30^2 + x^2) = sqrt(900 + x^2)$ (m).
    Quãng đường bơi dưới nước: $M B = sqrt(40^2 + (100 - x)^2) = sqrt(1600 + (100 - x)^2)$ (m).
    Tổng thời gian di chuyển:
    $T(x) = (sqrt(900 + x^2)) / 5 + (sqrt(1600 + (100 - x)^2)) / 2.$

    #step([Đạo hàm và điều kiện cực trị])
    $T'(x) = x / (5 sqrt(900 + x^2)) - (100 - x) / (2 sqrt(1600 + (100 - x)^2)).$
    Để thời gian ngắn nhất, $T'(x) = 0 <=> (x)/(5 sqrt(900 + x^2)) = (100 - x)/(2 sqrt(1600 + (100 - x)^2))$.
    Hệ thức này chính là dạng tương đương của Định luật Snell trong quang học: $(sin alpha_1) / v_1 = (sin alpha_2) / v_2$.
  ]
)

#tn(
  [Hai ngôi làng $A$ và $B$ nằm cùng một phía so với một dòng sông thẳng. Khoảng cách từ $A$ đến bờ sông là $A H = 3$ km, khoảng cách từ $B$ đến bờ sông là $B K = 5$ km, khoảng cách giữa hai hình chiếu $H$ và $K$ trên bờ sông là $H K = 6$ km. Người ta cần xây dựng một trạm bơm nước $P$ nằm trên bờ sông giữa $H$ và $K$ để cung cấp nước cho cả hai làng. Tổng chiều dài đường ống dẫn nước $P A + P B$ ngắn nhất bằng bao nhiêu?],
  (
    [$10$ km],
    True([$10$ km]),
    [$12$ km],
    [$2 sqrt(34)$ km],
    [$8 sqrt(2)$ km]
  ),
  loigiai: [
    #step([Phương pháp hình học đối xứng Fermat - Heron])
    Lấy điểm $A'$ đối xứng với $A$ qua bờ sông. Khi đó $A' H = A H = 3$ km, $A' H perp H K$.
    Với mọi điểm $P$ trên bờ sông, ta có $P A = P A'$, do đó $P A + P B = P A' + P B$.
    Tổng $P A' + P B >= A' B$, dấu "=" xảy ra khi $P = A' B inter H K$.
    Kẻ $A' E perp B K$ kéo dài tại $E$. Ta có hình chữ nhật $A' H K E$, suy ra:
    $A' E = H K = 6$ km; $B E = B K + K E = B K + A' H = 5 + 3 = 8$ km.
    Tam giác $A' E B$ vuông tại $E$, do đó:
    $A' B = sqrt(A' E^2 + B E^2) = sqrt(6^2 + 8^2) = 10$ km.
    Vậy tổng độ dài đường ống ngắn nhất là $10$ km.
  ]
)

#tn(
  [Một người chèo một chiếc thuyền từ điểm $A$ trên bờ một con sông rộng $0","5$ km sang một điểm $B$ ở bờ bên kia, biết hình chiếu của $B$ trên bờ có điểm $A$ là $B'$ cách $A$ một đoạn $A B' = 2$ km. Vận tốc chèo thuyền là $v_1 = 3$ km/h, vận tốc đi bộ trên bờ là $v_2 = 5$ km/h. Người đó chèo thuyền cập bến tại $M$ trên bờ bên kia (giữa hình chiếu vuông góc của $A$ và $B$) rồi đi bộ đến $B$. Thời gian ngắn nhất để người đó đi từ $A$ đến $B$ là bao nhiêu phút?],
  (
    [$32$ phút],
    True([$32$ phút]),
    [$30$ phút],
    [$36$ phút],
    [$40$ phút]
  ),
  loigiai: [
    #step([Lập hàm thời gian])
    Gọi $H$ là hình chiếu của $A$ trên bờ chứa $B$. Khi đó $A H = 0","5$ km và $H B = 2$ km.
    Đặt $H M = x$ (km) với $0 <= x <= 2$.
    Khoảng cách chèo thuyền: $A M = sqrt(A H^2 + H M^2) = sqrt(0","25 + x^2)$.
    Khoảng cách đi bộ: $M B = 2 - x$.
    Tổng thời gian:
    $T(x) = (sqrt(0","25 + x^2)) / 3 + (2 - x) / 5 quad ("giờ").$

    #step([Tìm cực trị])
    $T'(x) = x / (3 sqrt(0","25 + x^2)) - 1/5.$
    $T'(x) = 0 <=> 5x = 3 sqrt(0","25 + x^2) <=> 25x^2 = 9(0","25 + x^2) <=> 16x^2 = 2","25 <=> x = 1","5 / 4 = 0","375$ km.
    Thay $x = 0","375$ vào hàm thời gian:
    $A M = sqrt(0","5^2 + 0","375^2) = 0","625$ km.
    $T(0","375) = (0","625)/3 + (2 - 0","375)/5 = 5/24 + 13/40 = 8/15$ giờ.
    Đổi ra phút: $8/15 dot 60 = 32$ phút.
  ]
)

#tn(
  [Một đường dây điện cao thế cần được kéo từ nhà máy điện $A$ trên đất liền đến một trạm biến áp trên một hòn đảo $B$. Hòn đảo cách bờ biển thẳng một khoảng $B H = 4$ km. Khoảng cách từ nhà máy $A$ đến hình chiếu $H$ là $A H = 10$ km. Chi phí kéo $1$ km đường dây trên đất liền là $600$ triệu đồng, dưới đáy biển là $1$ tỷ đồng ($1000$ triệu đồng). Vị trí điểm rẽ $M$ trên bờ biển cách $H$ bao nhiêu km để tổng chi phí kéo dây là thấp nhất?],
  (
    [$3$ km],
    True([$3$ km]),
    [$2$ km],
    [$4$ km],
    [$2","5$ km]
  ),
  loigiai: [
    #step([Thiết lập bài toán])
    Đặt $M H = x$ (km) với $0 <= x <= 10$. Điểm $M$ nằm giữa $A$ và $H$.
    Khi đó đoạn dây trên đất liền dài $A M = 10 - x$ (km).
    Đoạn dây dưới biển dài $M B = sqrt(x^2 + 4^2) = sqrt(x^2 + 16)$ (km).
    Tổng chi phí (đơn vị: triệu đồng):
    $C(x) = 600(10 - x) + 1000 sqrt(x^2 + 16).$

    #step([Khảo sát đạo hàm])
    $C'(x) = -600 + (1000 x) / sqrt(x^2 + 16).$
    $C'(x) = 0 <=> 1000 x = 600 sqrt(x^2 + 16) <=> 5x = 3 sqrt(x^2 + 16) <=> 25x^2 = 9(x^2 + 16) <=> 16x^2 = 144 <=> x = 3$ km.
    Hàm số đạt giá trị nhỏ nhất tại $x = 3$ km.
  ]
)

#tn(
  [Một vận động viên tham gia cuộc thi phối hợp: Bắt đầu từ vị trí $A$ trên đảo cách bờ biển $3$ km, vận động viên chèo thuyền với vận tốc $6$ km/h đến điểm $M$ trên bờ biển, sau đó chạy bộ với vận tốc $10$ km/h đến đích $B$ trên bờ biển. Biết khoảng cách từ hình chiếu $H$ của $A$ trên bờ biển đến $B$ là $H B = 8$ km. Thời gian ngắn nhất để hoàn thành cuộc đua là:],
  (
    [$1$ giờ $20$ phút],
    True([$1$ giờ $12$ phút]),
    [$1$ giờ $10$ phút],
    [$1$ giờ $30$ phút]
  ),
  loigiai: [
    #step([Hàm thời gian])
    Đặt $H M = x$ ($0 <= x <= 8$, đơn vị km).
    Quãng đường chèo thuyền: $A M = sqrt(3^2 + x^2) = sqrt(9 + x^2)$ (km).
    Quãng đường chạy bộ: $M B = 8 - x$ (km).
    Thời gian di chuyển:
    $T(x) = (sqrt(9 + x^2)) / 6 + (8 - x) / 10.$

    #step([Đạo hàm và cực trị])
    $T'(x) = x / (6 sqrt(9 + x^2)) - 1/10.$
    $T'(x) = 0 <=> 10x = 6 sqrt(9 + x^2) <=> 5x = 3 sqrt(9 + x^2) <=> 25x^2 = 9(9 + x^2) <=> 16x^2 = 81 <=> x = 9/4 = 2","25$ km.
    Khi $x = 2","25$ km, ta có $A M = sqrt(9 + 2","25^2) = 3","75$ km.
    $T(2","25) = (3","75)/6 + (8 - 2","25)/10 = 0","625 + 0","575 = 1","2$ giờ.
    Đổi sang giờ và phút: $1","2$ giờ = $1$ giờ $12$ phút (vì $0","2 dot 60 = 12$ phút).
  ]
)

#tn(
  [Hai con tàu $A$ và $B$ xuất phát cùng lúc từ hai vị trí cách nhau $100$ hải lý. Tàu $A$ di chuyển về phía đông với vận tốc không đổi $30$ hải lý/giờ, tàu $B$ di chuyển về phía bắc với vận tốc không đổi $40$ hải lý/giờ. Ban đầu tàu $A$ nằm tại gốc tọa độ $O(0; 0)$ đi dọc theo trục $O x$, tàu $B$ nằm tại điểm $(0; -100)$ đi dọc theo trục $O y$ hướng về $O$. Khoảng cách nhỏ nhất giữa hai con tàu trong quá trình chuyển động là bao nhiêu hải lý?],
  (
    [$60$ hải lý],
    True([$60$ hải lý]),
    [$50$ hải lý],
    [$70$ hải lý],
    [$80$ hải lý]
  ),
  loigiai: [
    #step([Tọa độ hóa vị trí hai con tàu theo thời gian])
    Chọn hệ tọa độ $O x y$, gốc $O$ là vị trí ban đầu của tàu $A$.
    Vị trí tàu $A$ sau thời gian $t$ (giờ): $A(t) = (30t; 0)$.
    Vị trí tàu $B$ sau thời gian $t$ (giờ): $B(t) = (0; -100 + 40t)$.
    Bình phương khoảng cách giữa hai tàu:
    $d^2(t) = (30t)^2 + (40t - 100)^2 = 900t^2 + 1600t^2 - 8000t + 10000 = 2500t^2 - 8000t + 10000.$

    #step([Tìm cực tiểu của tam thức bậc hai])
    $d^2(t)$ đạt giá trị nhỏ nhất tại đỉnh parabol:
    $t = -((-8000)) / (2 dot 2500) = 8000 / 5000 = 1","6$ giờ.
    Giá trị nhỏ nhất của $d^2$:
    $d^2(1","6) = 2500(1","6)^2 - 8000(1","6) + 10000 = 6400 - 12800 + 10000 = 3600.$
    Suy ra khoảng cách nhỏ nhất là $d_min = sqrt(3600) = 60$ hải lý.
  ]
)

#tn(
  [Một xe tải cần vận chuyển hàng từ một kho $A$ đến một công trường $B$. Điểm $A$ nằm trên trục đường quốc lộ thẳng, còn công trường $B$ nằm trong khu rừng cách quốc lộ $12$ km. Hình chiếu của $B$ lên quốc lộ là $H$, khoảng cách $A H = 25$ km. Trên quốc lộ, xe chạy với vận tốc $60$ km/h; trên đường mòn xuyên rừng, xe chạy với vận tốc $30$ km/h. Xe tải nên rẽ vào đường mòn tại điểm $M$ cách $H$ bao nhiêu km để thời gian vận chuyển hàng là ngắn nhất?],
  (
    [$4 sqrt(3)$ km],
    True([$4 sqrt(3)$ km]),
    [$6$ km],
    [$8$ km],
    [$5$ km]
  ),
  loigiai: [
    #step([Lập hàm thời gian di chuyển])
    Đặt $H M = x$ ($0 <= x <= 25$, đơn vị km).
    Đoạn đường chạy trên quốc lộ: $A M = 25 - x$ (km), thời gian $t_1 = (25 - x) / 60$.
    Đoạn đường chạy trong rừng: $M B = sqrt(x^2 + 12^2) = sqrt(x^2 + 144)$ (km), thời gian $t_2 = (sqrt(x^2 + 144)) / 30$.
    Tổng thời gian:
    $T(x) = (25 - x) / 60 + (sqrt(x^2 + 144)) / 30.$

    #step([Tìm cực trị])
    $T'(x) = -1/60 + x / (30 sqrt(x^2 + 144)).$
    $T'(x) = 0 <=> (2x) / sqrt(x^2 + 144) = 1 <=> 4x^2 = x^2 + 144 <=> 3x^2 = 144 <=> x^2 = 48 <=> x = 4 sqrt(3) approx 6","93$ km.
    Vì $4 sqrt(3) in [0; 25]$ và $T'(x)$ đổi dấu từ âm sang dương nên thời gian đạt cực tiểu tại $x = 4 sqrt(3)$ km.
  ]
)

#tn(
  [Hai điểm $A$ và $B$ nằm ở hai bên một con sông có hai bờ song song cách nhau $d = 1$ km. Khoảng cách từ $A$ đến bờ sông của nó là $2$ km, khoảng cách từ $B$ đến bờ sông của nó là $3$ km. Hình chiếu của $A$ và $B$ dọc theo hướng dòng sông cách nhau $12$ km. Người ta muốn xây dựng một cây cầu $M N$ vuông góc với dòng sông ($M$ nằm ở bờ phía $A$, $N$ nằm ở bờ phía $B$). Độ dài ngắn nhất của đường đi từ $A$ qua cầu $M N$ rồi đến $B$ (tức $A M + M N + N B$) là:],
  (
    [$14$ km],
    True([$14$ km]),
    [$13$ km],
    [$15$ km],
    [$16$ km]
  ),
  loigiai: [
    #step([Phương pháp tịnh tiến hình học])
    Vì cây cầu luôn có độ dài $M N = d = 1$ km và có phương vuông góc không đổi với hai bờ sông, nên vector $arrow(M N)$ là vector không đổi có độ dài $1$ km hướng từ bờ $A$ sang bờ $B$.
    Tịnh tiến điểm $A$ theo vector $arrow(M N)$ ta được điểm $A_1$. Khi đó tứ giác $A M N A_1$ là hình bình hành, nên $A M = A_1 N$.
    Đường đi: $A M + M N + N B = A_1 N + N B + M N = A_1 N + N B + 1$.
    Để tổng này nhỏ nhất thì $A_1, N, B$ phải thẳng hàng, khi đó $A_1 N + N B = A_1 B$.

    #step([Tính độ dài $A_1 B$])
    Khoảng cách từ $A_1$ đến bờ sông chứa $B$ là: khoảng cách từ $A$ đến bờ đó trừ đi $M N$, tức là $2 + 1 - 1 = 2$ km (hoặc hình chiếu: khoảng cách vuông góc giữa $A_1$ và $B$ là $2 + 3 = 5$ km).
    Khoảng cách dọc sông giữa $A_1$ và $B$ vẫn bằng $12$ km.
    Tam giác vuông có hai cạnh góc vuông là $5$ km và $12$ km, do đó:
    $A_1 B = sqrt(5^2 + 12^2) = 13$ km.
    Vậy tổng độ dài ngắn nhất là $A_1 B + M N = 13 + 1 = 14$ km.
  ]
)

#tn(
  [Một tia sáng đi từ điểm $A$ trong môi trường không khí (vận tốc ánh sáng $c$) đến điểm $B$ trong khối thủy tinh (vận tốc ánh sáng $v = c/n$, với $n$ là chiết suất). Điểm $A$ cách mặt phân cách một khoảng $h_1$, điểm $B$ cách mặt phân cách một khoảng $h_2$. Gọi $i$ là góc tới trong không khí và $r$ là góc khúc xạ trong thủy tinh. Theo nguyên lý thời gian cực tiểu của Fermat, mối quan hệ giữa $i$ và $r$ là:],
  (
    True([$(sin i)/(sin r) = n$]),
    [$(cos i)/(cos r) = n$],
    [$(tan i)/(tan r) = n$],
    [$(sin i)/(sin r) = 1/n$]
  ),
  loigiai: [
    #step([Nguyên lý Fermat trong quang hình học])
    Thời gian truyền ánh sáng từ $A$ qua điểm $M$ trên mặt phân cách đến $B$:
    $t = (A M) / c + (M B) / v.$
    Gọi $x$ là tọa độ của điểm tới $M$. Ta có:
    $(dif (A M))/(dif x) = sin i$ và $(dif (M B))/(dif x) = - sin r$.
    Do đó:
    $(dif t)/(dif x) = (sin i)/c - (sin r)/v = 0 <=> (sin i)/c = (sin r)/v <=> (sin i)/(sin r) = c/v = n.$
    Đây chính là Định luật khúc xạ ánh sáng Snell - Descartes.
  ]
)

#tn(
  [Một hồ nước hình tròn có bán kính $R = 1$ km. Một người chèo thuyền xuất phát từ điểm $A$ trên bờ hồ muốn đi đến điểm $C$ đối diện qua đường kính $A C = 2$ km. Người đó có thể chèo thuyền theo dây cung $A B$ với vận tốc $3$ km/h rồi chạy bộ theo cung tròn $B C$ trên bờ hồ với vận tốc $6$ km/h (hoặc chỉ chèo thuyền thẳng, hoặc chỉ chạy bộ). Thời gian ngắn nhất để người đó đi từ $A$ đến $C$ là bao nhiêu?],
  (
    [$pi/6$ giờ],
    True([$pi/6$ giờ]),
    [$2/3$ giờ],
    [$pi/3$ giờ],
    [$1/2$ giờ]
  ),
  loigiai: [
    #step([Lập hàm số thời gian theo góc])
    Gọi $O$ là tâm hồ nước. Đặt góc $hat(C A B) = alpha$ với $0 <= alpha <= pi/2$.
    Tam giác $A B C$ vuông tại $B$ (nội tiếp chắn nửa đường tròn), nên:
    Độ dài dây cung $A B = A C cos alpha = 2 cos alpha$ (km).
    Góc ở tâm chắn cung $B C$ là $hat(B O C) = 2 alpha$ (rad).
    Độ dài cung tròn $B C = R dot (2 alpha) = 1 dot 2 alpha = 2 alpha$ (km).
    Tổng thời gian di chuyển:
    $T(alpha) = (2 cos alpha)/3 + (2 alpha)/6 = 2/3 cos alpha + alpha / 3 quad ("giờ"), quad alpha in [0; pi/2].$

    #step([Tìm giá trị nhỏ nhất])
    Đạo hàm:
    $T'(alpha) = -2/3 sin alpha + 1/3.$
    $T'(alpha) = 0 <=> sin alpha = 1/2 <=> alpha = pi/6$ (do $alpha in [0; pi/2]$).
    Tính giá trị tại các điểm đặc biệt:
    $T(0) = 2/3 cos 0 + 0 = 2/3 approx 0","667$ giờ.
    $T(pi/2) = 2/3 cos(pi/2) + (pi/2)/3 = pi/6 approx 0","524$ giờ.
    $T(pi/6) = 2/3 cos(pi/6) + (pi/6)/3 = 2/3 dot sqrt(3)/2 + pi/18 = sqrt(3)/3 + pi/18 approx 0","577 + 0","174 = 0","751$ giờ.
    Lưu ý: $T'(alpha) > 0$ khi $0 <= alpha < pi/6$ (hàm đồng biến) và $T'(alpha) < 0$ khi $pi/6 < alpha <= pi/2$ (hàm nghịch biến).
    Do đó $alpha = pi/6$ là điểm cực đại!
    Giá trị nhỏ nhất xảy ra tại một trong hai biên: $T(0) = 2/3$ và $T(pi/2) = pi/6$.
    So sánh: $pi/6 approx 0","5236 < 2/3 approx 0","6667$.
    Vậy người đó nên chạy bộ toàn bộ dọc theo nửa đường tròn bờ hồ với thời gian $pi/6$ giờ.
  ]
)

#tn(
  [Một người thợ săn ở vị trí $A$ cách đường cao tốc thẳng một khoảng $A H = 3$ km. Người thợ săn cần đến vị trí $B$ nằm trên bờ cao tốc, cách hình chiếu $H$ một khoảng $H B = 5$ km. Trong rừng rậm, người thợ săn đi bộ với vận tốc $3$ km/h; khi ra đến đường cao tốc thì người đó đi xe với vận tốc $5$ km/h. Người thợ săn đi xuyên qua rừng đến điểm $M$ trên đường cao tốc (nằm giữa $H$ và $B$) rồi đi xe dọc cao tốc đến $B$. Thời gian ngắn nhất để người thợ săn đi từ $A$ đến $B$ là bao nhiêu giờ?],
  (
    [$1","90$ giờ],
    True([$1","80$ giờ]),
    [$1","75$ giờ],
    [$1","85$ giờ]
  ),
  loigiai: [
    #step([Thiết lập hàm thời gian])
    Gọi $M$ là điểm người thợ săn bước ra đường cao tốc ($M$ nằm giữa $H$ và $B$).
    Đặt $H M = x$ ($0 <= x <= 5$, km).
    Khoảng cách đi trong rừng: $A M = sqrt(3^2 + x^2) = sqrt(9 + x^2)$ (km).
    Khoảng cách đi trên cao tốc: $M B = 5 - x$ (km).
    Tổng thời gian:
    $T(x) = (sqrt(9 + x^2)) / 3 + (5 - x) / 5.$

    #step([Khảo sát cực trị])
    $T'(x) = x / (3 sqrt(9 + x^2)) - 1/5.$
    $T'(x) = 0 <=> 5x = 3 sqrt(9 + x^2) <=> 25x^2 = 9(9 + x^2) <=> 16x^2 = 81 <=> x = 9/4 = 2","25$ km.
    Khi $x = 2","25$ km, ta có $A M = sqrt(9 + 2","25^2) = 3","75$ km.
    Thời gian di chuyển ngắn nhất:
    $T(2","25) = (3","75) / 3 + (5 - 2","25) / 5 = 1","25 + 0","55 = 1","80$ giờ.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

#ds(
  [Một kỹ sư muốn thiết kế tuyến cáp ngầm viễn thông nối một trạm trung tâm $A$ trên bờ biển với một trung tâm dữ liệu đặt trên đảo $B$. Bờ biển được xem là một đường thẳng. Khoảng cách từ trạm $A$ đến bờ biển là $A H = 0$ (trạm $A$ nằm ngay trên bờ biển). Đảo $B$ cách bờ biển một khoảng $B K = 8$ km, và hình chiếu $K$ cách $A$ một khoảng $A K = 15$ km. Chi phí chôn cáp trên đất liền dọc theo bờ biển là $30$ triệu đồng/km, chi phí rải cáp ngầm dưới đáy biển là $50$ triệu đồng/km. Tuyến cáp đi dọc bờ biển từ $A$ đến điểm $M$ (nằm giữa $A$ và $K$), sau đó rải ngầm dưới đáy biển từ $M$ đến $B$. Gọi khoảng cách $M K = x$ (km) với $0 <= x <= 15$.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-1, 0), (7, 0), stroke: (paint: rgb("#4b5563"), thickness: 1.5pt))
      content((7.2, 0), [Bờ biển], anchor: "west")
      circle((0, 0), radius: 0.08, fill: rgb("#6d28d9"))
      content((0, -0.3), [$A$])
      circle((5, 0), radius: 0.08, fill: rgb("#6d28d9"))
      content((5, -0.3), [$K$])
      circle((3, 0), radius: 0.08, fill: rgb("#dc2626"))
      content((3, -0.3), [$M$])
      circle((5, 3), radius: 0.08, fill: rgb("#2563eb"))
      content((5.2, 3), [$B$ (Đảo)], anchor: "west")
      line((0, 0), (3, 0), stroke: (paint: rgb("#16a34a"), thickness: 2.5pt))
      line((3, 0), (5, 3), stroke: (paint: rgb("#2563eb"), thickness: 2pt, dash: "dashed"))
      line((5, 0), (5, 3), stroke: (paint: rgb("#9ca3af"), thickness: 1pt, dash: "dotted"))
      content((1.5, 0.3), [$15 - x$])
      content((4, -0.3), [$x$])
      content((5.4, 1.5), [$8$ km])
    })
  ]],
  (
    True([Độ dài đoạn cáp rải ngầm dưới biển theo biến $x$ là $M B = sqrt(x^2 + 64)$ (km).]),
    True([Hàm số biểu thị tổng chi phí dự án là $C(x) = 30(15 - x) + 50 sqrt(x^2 + 64)$ (triệu đồng).]),
    True([Tại vị trí chi phí nhỏ nhất, tỉ số giữa $x$ và độ dài đoạn cáp dưới biển $M B$ là $(x)/(M B) = 3/5$.]),
    [Tổng chi phí nhỏ nhất của dự án là $850$ triệu đồng.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Tam giác $M K B$ vuông tại $K$, với $M K = x$ và $K B = 8$. Theo định lý Pytago:
    $M B = sqrt(M K^2 + K B^2) = sqrt(x^2 + 64)$ (km). Ý a ĐÚNG.

    #step([Phân tích ý b])
    Đoạn cáp trên bờ biển: $A M = A K - M K = 15 - x$ (km).
    Chi phí trên bờ: $30(15 - x)$ triệu đồng.
    Chi phí dưới biển: $50 sqrt(x^2 + 64)$ triệu đồng.
    Tổng chi phí: $C(x) = 30(15 - x) + 50 sqrt(x^2 + 64)$ (triệu đồng). Ý b ĐÚNG.

    #step([Phân tích ý c])
    Đạo hàm hàm chi phí:
    $C'(x) = -30 + (50 x) / sqrt(x^2 + 64) = -30 + 50 dot (x)/(M B).$
    $C'(x) = 0 <=> (x)/(M B) = 30/50 = 3/5$.
    Điều này tương đương với $cos hat(K M B) = 3/5$. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Từ $x / sqrt(x^2 + 64) = 3/5 <=> 5x = 3 sqrt(x^2 + 64) <=> 25x^2 = 9(x^2 + 64) <=> 16x^2 = 576 <=> x = 6$ km.
    Khi $x = 6$ km:
    $M B = sqrt(6^2 + 64) = sqrt(100) = 10$ km.
    $A M = 15 - 6 = 9$ km.
    Tổng chi phí tối thiểu:
    $C(6) = 30 dot 9 + 50 dot 10 = 270 + 500 = 770$ triệu đồng.
    Do $770 != 850$ nên ý d SAI.
  ]
)

#ds(
  [Một người nông dân sở hữu một cánh đồng rộng lớn tiếp giáp một con kênh thẳng. Nông trại $A$ cách con kênh $4$ km, nông trại $B$ cách con kênh $6$ km. Hai hình chiếu $H, K$ của $A, B$ trên bờ kênh cách nhau $H K = 10$ km. Người nông dân muốn đặt một trạm bơm nước $P$ tại một vị trí trên bờ kênh nằm giữa $H$ và $K$ để dẫn nước về cả hai nông trại. Đặt khoảng cách $H P = x$ (km) với $0 <= x <= 10$.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-1, 0), (6, 0), stroke: (paint: rgb("#0284c7"), thickness: 2pt))
      content((6.2, 0), [Bờ kênh], anchor: "west")
      circle((0, 2), radius: 0.08, fill: rgb("#6d28d9"))
      content((-0.2, 2.2), [$A$])
      circle((5, 3), radius: 0.08, fill: rgb("#6d28d9"))
      content((5.2, 3.2), [$B$])
      circle((0, 0), radius: 0.06, fill: rgb("#4b5563"))
      content((0, -0.3), [$H$])
      circle((5, 0), radius: 0.06, fill: rgb("#4b5563"))
      content((5, -0.3), [$K$])
      circle((2, 0), radius: 0.08, fill: rgb("#dc2626"))
      content((2, -0.3), [$P$])
      line((0, 2), (2, 0), stroke: (paint: rgb("#dc2626"), thickness: 1.5pt))
      line((5, 3), (2, 0), stroke: (paint: rgb("#dc2626"), thickness: 1.5pt))
      line((0, 0), (0, 2), stroke: (paint: rgb("#9ca3af"), thickness: 1pt, dash: "dotted"))
      line((5, 0), (5, 3), stroke: (paint: rgb("#9ca3af"), thickness: 1pt, dash: "dotted"))
      content((1, -0.3), [$x$])
      content((3.5, -0.3), [$10 - x$])
    })
  ]],
  (
    True([Tổng chiều dài ống dẫn nước từ trạm bơm về hai nông trại là $L(x) = sqrt(x^2 + 16) + sqrt((10 - x)^2 + 36)$ (km).]),
    True([Đạo hàm $L'(x) = x / sqrt(x^2 + 16) - (10 - x) / sqrt((10 - x)^2 + 36)$.]),
    True([Vị trí đặt trạm bơm để tổng chiều dài ống dẫn nhỏ nhất là cách $H$ một khoảng $x = 4$ km.]),
    [Tổng chiều dài ống dẫn ngắn nhất là $10 sqrt(3)$ km.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    $P A = sqrt(H P^2 + A H^2) = sqrt(x^2 + 4^2) = sqrt(x^2 + 16)$.
    $P B = sqrt(P K^2 + B K^2) = sqrt((10 - x)^2 + 6^2) = sqrt((10 - x)^2 + 36)$.
    Tổng độ dài đường ống: $L(x) = P A + P B = sqrt(x^2 + 16) + sqrt((10 - x)^2 + 36)$ (km). Ý a ĐÚNG.

    #step([Phân tích ý b])
    Đạo hàm:
    $L'(x) = x / sqrt(x^2 + 16) - (10 - x) / sqrt((10 - x)^2 + 36)$. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Cho $L'(x) = 0 <=> x / sqrt(x^2 + 16) = (10 - x) / sqrt((10 - x)^2 + 36) <=> cos hat(A P H) = cos hat(B P K)$.
    Do đó hai tam giác vuông $A H P$ và $B K P$ đồng dạng:
    $(H P) / (P K) = (A H) / (B K) <=> x / (10 - x) = 4/6 = 2/3 <=> 3x = 20 - 2x <=> 5x = 20 <=> x = 4$ km. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Tại $x = 4$ km:
    $P A = sqrt(4^2 + 16) = sqrt(32) = 4 sqrt(2)$ km.
    $P B = sqrt(6^2 + 36) = sqrt(72) = 6 sqrt(2)$ km.
    Tổng chiều dài: $L_min = 4 sqrt(2) + 6 sqrt(2) = 10 sqrt(2)$ km.
    (Cách khác: lấy $A'$ đối xứng qua kênh, $A' B = sqrt(10^2 + (4 + 6)^2) = sqrt(200) = 10 sqrt(2)$ km).
    Vì $10 sqrt(2) != 10 sqrt(3)$ nên ý d SAI.
  ]
)

#ds(
  [Một nhân viên cứu hộ bãi biển đang quan sát từ vị trí chòi cứu hộ $S$ trên bãi cát. Chòi $S$ cách mép nước biển một khoảng $20$ m. Một du khách bị sóng cuốn ra xa đang cầu cứu tại vị trí $C$ cách mép nước biển $30$ m. Khoảng cách giữa hai hình chiếu vuông góc của $S$ và $C$ lên mép nước là $50$ m. Vận tốc chạy của nhân viên cứu hộ trên cát là $v_1 = 4$ m/s, vận tốc bơi trong nước biển là $v_2 = 2$ m/s. Người cứu hộ xuất phát từ $S$, chạy trên cát đến mép nước tại điểm $M$, rồi bơi thẳng từ $M$ đến $C$. Gọi $x$ là khoảng cách từ hình chiếu của $S$ trên mép nước đến điểm chạm nước $M$ ($0 <= x <= 50$, mét).],
  (
    True([Thời gian chạy trên cát của nhân viên cứu hộ là $t_1 = (sqrt(x^2 + 400)) / 4$ (giây).]),
    True([Thời gian bơi dưới nước biển là $t_2 = (sqrt((50 - x)^2 + 900)) / 2$ (giây).]),
    [Người cứu hộ nên chạy thẳng vuông góc ra mép nước (tức chọn $x = 0$) rồi bơi chéo đến nạn nhân để giảm tối đa quãng đường chạy trên cát.],
    True([Góc tới $alpha$ (góc giữa đường chạy $S M$ và đường pháp tuyến với mép nước) và góc khúc xạ $beta$ (góc giữa đường bơi $M C$ và pháp tuyến) tại vị trí tối ưu thỏa mãn $(sin alpha)/(sin beta) = 2$.])
  ),
  loigiai: [
    #step([Phân tích ý a])
    Quãng đường chạy trên cát: $S M = sqrt(x^2 + 20^2) = sqrt(x^2 + 400)$ (m).
    Thời gian chạy trên cát: $t_1 = (S M) / v_1 = (sqrt(x^2 + 400)) / 4$ (giây). Ý a ĐÚNG.

    #step([Phân tích ý b])
    Quãng đường bơi dưới nước: $M C = sqrt((50 - x)^2 + 30^2) = sqrt((50 - x)^2 + 900)$ (m).
    Thời gian bơi dưới biển: $t_2 = (M C) / v_2 = (sqrt((50 - x)^2 + 900)) / 2$ (giây). Ý b ĐÚNG.

    #step([Phân tích ý c])
    Nếu $x = 0$, thời gian bơi dưới nước sẽ rất dài ($M C = sqrt(50^2 + 30^2) = sqrt(3400) approx 58","3$ m).
    Vì vận tốc bơi ($2$ m/s) chậm hơn nhiều so với vận tốc chạy ($4$ m/s), nên việc tối ưu thời gian đòi hỏi phải tận dụng quãng đường chạy trên cát nhanh hơn, tức $x > 0$. Ý c SAI.

    #step([Phân tích ý d])
    Hàm tổng thời gian: $T(x) = (sqrt(x^2 + 400)) / 4 + (sqrt((50 - x)^2 + 900)) / 2$.
    Đạo hàm:
    $T'(x) = x / (4 sqrt(x^2 + 400)) - (50 - x) / (2 sqrt((50 - x)^2 + 900))$.
    Ta nhận thấy $sin alpha = x / sqrt(x^2 + 400)$ và $sin beta = (50 - x) / sqrt((50 - x)^2 + 900)$.
    Tại điểm cực trị: $T'(x) = 0 <=> (sin alpha) / 4 = (sin beta) / 2 <=> (sin alpha) / (sin beta) = 4/2 = 2$.
    Hệ thức này hoàn toàn phù hợp với nguyên lý Fermat. Ý d ĐÚNG.
  ]
)

#ds(
  [Một công ty du lịch sinh thái khảo sát hành trình di chuyển qua hai địa hình: Một vùng đồng cỏ bằng phẳng và một vùng đầm lầy. Ranh giới giữa đồng cỏ và đầm lầy là một đường thẳng. Điểm cắm trại $A$ nằm trên đồng cỏ cách ranh giới $6$ km. Trạm quan sát chim $B$ nằm trong đầm lầy cách ranh giới $8$ km. Khoảng cách hai hình chiếu của $A$ và $B$ trên đường ranh giới là $14$ km. Xe chuyên dụng chạy trên đồng cỏ với vận tốc $40$ km/h và chạy trong đầm lầy với vận tốc $20$ km/h. Gọi $M$ là điểm xe vượt qua ranh giới, $x$ là khoảng cách từ hình chiếu của $A$ đến $M$ ($0 <= x <= 14$, km).],
  (
    True([Thời gian di chuyển từ $A$ đến $B$ là hàm số $f(x) = (sqrt(x^2 + 36)) / 40 + (sqrt((14 - x)^2 + 64)) / 20$ (giờ).]),
    True([Phương trình tìm điểm cực trị là $(x)/(2 sqrt(x^2 + 36)) = (14 - x)/(sqrt((14 - x)^2 + 64))$.]),
    True([Nếu chọn điểm vượt ranh giới tại $x = 2 sqrt(3) approx 3","46$ km thì góc giữa hướng đi trên đồng cỏ và pháp tuyến của ranh giới bằng $30^circ$.]),
    [Thời gian di chuyển ngắn nhất trên toàn bộ hành trình là dưới $30$ phút.]
  ),
  loigiai: [
    #step([Phân tích ý a])
    Quãng đường trên đồng cỏ: $A M = sqrt(x^2 + 6^2) = sqrt(x^2 + 36)$ (km). Vận tốc $40$ km/h.
    Quãng đường trong đầm lầy: $M B = sqrt((14 - x)^2 + 8^2) = sqrt((14 - x)^2 + 64)$ (km). Vận tốc $20$ km/h.
    Tổng thời gian: $f(x) = (sqrt(x^2 + 36)) / 40 + (sqrt((14 - x)^2 + 64)) / 20$ (giờ). Ý a ĐÚNG.

    #step([Phân tích ý b])
    Đạo hàm:
    $f'(x) = x / (40 sqrt(x^2 + 36)) - (14 - x) / (20 sqrt((14 - x)^2 + 64))$.
    $f'(x) = 0 <=> x / (40 sqrt(x^2 + 36)) = (14 - x) / (20 sqrt((14 - x)^2 + 64)) <=> x / (2 sqrt(x^2 + 36)) = (14 - x) / sqrt((14 - x)^2 + 64)$. Ý b ĐÚNG.

    #step([Phân tích ý c])
    Gọi $alpha$ là góc giữa $A M$ và đường vuông góc với ranh giới.
    Ta có $tan alpha = x / 6$. Khi $x = 2 sqrt(3)$, $tan alpha = (2 sqrt(3)) / 6 = sqrt(3)/3 => alpha = 30^circ$. Ý c ĐÚNG.

    #step([Phân tích ý d])
    Xét thời gian di chuyển:
    Tại bất kỳ điểm nào, quãng đường trên đồng cỏ tối thiểu là $A H = 6$ km ($t_1 >= 6/40 = 0","15$ h).
    Quãng đường trong đầm lầy tối thiểu là $B K = 8$ km ($t_2 >= 8/20 = 0","4$ h).
    Tổng thời gian $f(x) >= 0","15 + 0","4 = 0","55$ giờ = $33$ phút.
    Do đó không thể nào dưới $30$ phút ($0","5$ giờ). Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

#tln(
  [Một công ty dầu khí muốn đặt một đường ống dẫn dầu từ giàn khoan $A$ ngoài khơi vào một nhà máy lọc dầu $B$ trên bờ biển. Giàn khoan $A$ cách bờ biển một khoảng $A H = 9$ km. Nhà máy lọc dầu $B$ nằm trên bờ biển cách $H$ một khoảng $H B = 20$ km. Chi phí đặt ống dẫn dưới biển là $5$ triệu USD/km, chi phí đặt ống dẫn trên bờ là $4$ triệu USD/km. Đường ống được đặt dưới biển từ $A$ đến một điểm $M$ trên bờ, sau đó đi dọc theo bờ biển từ $M$ đến $B$. Khoảng cách $H M$ bằng bao nhiêu km để tổng chi phí đặt đường ống là nhỏ nhất?],
  [12],
  loigiai: [
    #step([Hàm chi phí])
    Đặt $H M = x$ (km) với $0 <= x <= 20$.
    Đoạn ống dưới biển: $A M = sqrt(x^2 + 9^2) = sqrt(x^2 + 81)$ (km).
    Đoạn ống trên bờ: $M B = 20 - x$ (km).
    Tổng chi phí:
    $C(x) = 5 sqrt(x^2 + 81) + 4(20 - x) quad ("triệu USD").$

    #step([Tìm cực trị])
    $C'(x) = (5x) / sqrt(x^2 + 81) - 4.$
    $C'(x) = 0 <=> 5x = 4 sqrt(x^2 + 81) <=> 25x^2 = 16(x^2 + 81) <=> 9x^2 = 16 dot 81 <=> x^2 = 16 dot 9 = 144 <=> x = 12$ km.
    Vì hàm số liên tục trên $[0; 20]$ nên chi phí đạt giá trị nhỏ nhất tại $x = 12$ km.
  ]
)

#tln(
  [Một vận động viên chèo thuyền kayak từ hòn đảo $A$ cách bờ biển một khoảng $A H = 12$ km đến một vị trí $M$ trên bờ biển, rồi sau đó chạy bộ dọc theo bờ biển đến đích $B$. Biết khoảng cách từ hình chiếu $H$ đến đích $B$ là $H B = 24$ km. Vận tốc chèo thuyền của vận động viên là $3$ km/h, vận tốc chạy bộ là $5$ km/h. Thời gian ngắn nhất để vận động viên hoàn thành chặng đua là bao nhiêu giờ?],
  [8],
  loigiai: [
    #step([Lập hàm thời gian])
    Đặt $H M = x$ ($0 <= x <= 24$, km).
    Khoảng cách chèo thuyền: $A M = sqrt(x^2 + 12^2) = sqrt(x^2 + 144)$ (km).
    Khoảng cách chạy bộ: $M B = 24 - x$ (km).
    Tổng thời gian:
    $T(x) = (sqrt(x^2 + 144)) / 3 + (24 - x) / 5.$

    #step([Tìm cực trị])
    $T'(x) = x / (3 sqrt(x^2 + 144)) - 1/5.$
    $T'(x) = 0 <=> 5x = 3 sqrt(x^2 + 144) <=> 25x^2 = 9(x^2 + 144) <=> 16x^2 = 1296 <=> x = 9$ km.
    Khi $x = 9$ km:
    $A M = sqrt(9^2 + 144) = sqrt(225) = 15$ km.
    $M B = 24 - 9 = 15$ km.
    Thời gian chèo thuyền: $15 / 3 = 5$ giờ.
    Thời gian chạy bộ: $15 / 5 = 3$ giờ.
    Tổng thời gian ngắn nhất:
    $T_min = 5 + 3 = 8$ giờ.
  ]
)

#tln(
  [Hai nhà máy $A$ và $B$ nằm cùng một phía của một con sông thẳng. Nhà máy $A$ cách bờ sông $2$ km, nhà máy $B$ cách bờ sông $6$ km. Khoảng cách hai hình chiếu vuông góc của $A$ và $B$ lên bờ sông là $15$ km. Người ta muốn xây dựng một trạm xử lý nước thải chung $P$ trên bờ sông để tiếp nhận nước thải từ hai nhà máy. Tổng chiều dài đường ống dẫn từ hai nhà máy đến trạm xử lý (tức $P A + P B$) ngắn nhất bằng bao nhiêu km?],
  [17],
  loigiai: [
    #step([Phương pháp điểm đối xứng Heron])
    Lấy điểm $A'$ đối xứng với $A$ qua bờ sông.
    Khoảng cách từ $A'$ đến bờ sông là $A' H = A H = 2$ km.
    Với mọi điểm $P$ trên bờ sông, $P A = P A'$ nên:
    $P A + P B = P A' + P B >= A' B.$
    Dấu bằng xảy ra khi $P = A' B inter ("bờ sông")$.

    #step([Tính độ dài $A' B$])
    Dựng tam giác vuông có cạnh huyền $A' B$:
    Một cạnh góc vuông là khoảng cách dọc theo bờ sông: $Delta x = 15$ km.
    Cạnh góc vuông còn lại là khoảng cách vuông góc giữa $A'$ và $B$:
    $Delta y = A' H + B K = 2 + 6 = 8$ km.
    Áp dụng định lý Pytago:
    $A' B = sqrt(Delta x^2 + Delta y^2) = sqrt(15^2 + 8^2) = sqrt(225 + 64) = sqrt(289) = 17$ km.
    Vậy tổng độ dài đường ống ngắn nhất là $17$ km.
  ]
)

#tln(
  [Một con tàu tuần tra xuất phát từ vị trí $A$ cách bờ biển $6$ hải lý. Tàu chạy với vận tốc $20$ hải lý/giờ đến một điểm $M$ trên bờ biển để tiếp nhiên liệu, sau đó chạy thẳng đến vị trí $B$ cách bờ biển $14$ hải lý. Biết khoảng cách giữa hai hình chiếu của $A$ và $B$ trên bờ biển là $15$ hải lý. Tổng thời gian di chuyển ngắn nhất của con tàu (không kể thời gian tiếp nhiên liệu) là bao nhiêu giờ? (Nhập kết quả dưới dạng số thập phân)],
  [1.25],
  loigiai: [
    #step([Đưa về bài toán tìm quãng đường ngắn nhất])
    Vì vận tốc của tàu không đổi trên toàn bộ hành trình ($v = 20$ hải lý/giờ), nên thời gian di chuyển $T = (A M + M B) / v$ ngắn nhất khi và chỉ khi tổng quãng đường $S = A M + M B$ ngắn nhất.

    #step([Tính quãng đường ngắn nhất])
    Lấy $A'$ đối xứng với $A$ qua đường bờ biển.
    Khoảng cách vuông góc từ $A'$ đến đường bờ là $6$ hải lý.
    Tổng khoảng cách vuông góc từ $A'$ đến $B$ là: $6 + 14 = 20$ hải lý.
    Khoảng cách dọc theo bờ biển là: $15$ hải lý.
    Độ dài ngắn nhất của quãng đường là:
    $S_min = A' B = sqrt(15^2 + 20^2) = sqrt(225 + 400) = sqrt(625) = 25$ hải lý.

    #step([Tính thời gian ngắn nhất])
    $T_min = S_min / v = 25 / 20 = 1","25$ giờ.
  ]
)

#tln(
  [Một nhóm kỹ sư muốn kéo một đường cáp ngầm từ một trạm biến áp $A$ trên bờ hồ sang một trạm thu nhận $B$ nằm trên bờ bên kia. Độ rộng của hồ nước là $A H = 600$ m (vuông góc với hai bờ đối diện). Trạm thu nhận $B$ nằm dọc bờ đối diện cách hình chiếu $H$ một khoảng $H B = 800$ m. Chi phí kéo cáp dưới nước là $10$ triệu đồng cho mỗi $100$ m (tức $100$ nghìn đồng/m). Chi phí kéo cáp trên cạn là $6$ triệu đồng cho mỗi $100$ m (tức $60$ nghìn đồng/m). Điểm cập bờ $M$ nên cách $H$ bao nhiêu mét để tổng chi phí kéo cáp là thấp nhất?],
  [450],
  loigiai: [
    #step([Hàm chi phí kéo cáp])
    Đặt $H M = x$ ($0 <= x <= 800$, mét).
    Đoạn cáp dưới nước: $A M = sqrt(600^2 + x^2)$ (m).
    Đoạn cáp trên cạn: $M B = 800 - x$ (m).
    Đơn vị chi phí: nghìn đồng.
    $C(x) = 100 sqrt(360000 + x^2) + 60(800 - x).$

    #step([Khảo sát cực tiểu])
    $C'(x) = (100 x) / sqrt(360000 + x^2) - 60.$
    $C'(x) = 0 <=> 100 x = 60 sqrt(360000 + x^2) <=> 5x = 3 sqrt(360000 + x^2)$
    $<=> 25x^2 = 9(360000 + x^2) <=> 16x^2 = 9 dot 360000 <=> 4x = 3 dot 600 <=> x = 450$ m.
    Vậy điểm cập bờ $M$ cách $H$ một đoạn $450$ m.
  ]
)

#tln(
  [Hai chất điểm chuyển động đều trên hai trục tọa độ vuông góc $O x$ và $O y$. Tại thời điểm ban đầu $t = 0$, chất điểm thứ nhất ở vị trí $(8; 0)$ và chuyển động về phía gốc tọa độ $O$ với vận tốc $4$ m/s; chất điểm thứ hai ở vị trí $(0; 6)$ và chuyển động ra xa gốc tọa độ $O$ theo chiều dương trục $O y$ với vận tốc $3$ m/s. Khoảng cách nhỏ nhất giữa hai chất điểm trong quá trình chuyển động bằng bao nhiêu mét?],
  [9.6],
  loigiai: [
    #step([Tọa độ hai chất điểm theo thời gian])
    Vị trí của chất điểm thứ nhất tại thời điểm $t$ ($t >= 0$):
    $x_1(t) = 8 - 4t, quad y_1(t) = 0.$
    Vị trí của chất điểm thứ hai tại thời điểm $t$:
    $x_2(t) = 0, quad y_2(t) = 6 + 3t.$
    Bình phương khoảng cách giữa hai chất điểm:
    $d^2(t) = (8 - 4t)^2 + (6 + 3t)^2 = 64 - 64t + 16t^2 + 36 + 36t + 9t^2 = 25t^2 - 28t + 100.$

    #step([Tìm cực tiểu của khoảng cách])
    Hàm số $f(t) = 25t^2 - 28t + 100$ là một parabol có đỉnh tại $t = 28 / 50 = 0","56$ s (thỏa mãn $t >= 0$).
    Giá trị nhỏ nhất của $d^2$:
    $d^2(0","56) = 25(0","56)^2 - 28(0","56) + 100 = 7","84 - 15","68 + 100 = 92","16.$
    Suy ra khoảng cách nhỏ nhất:
    $d_min = sqrt(92","16) = 9","6$ m.
  ]
)

]

#make-questions()
