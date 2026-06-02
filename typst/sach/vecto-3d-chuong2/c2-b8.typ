#import "_config.typ": *

#lesson([Ứng dụng thực tế và Toán tối ưu hình học 3D], theme-color: c-book)

#q-label([A. LÝ THUYẾT VÀ PHƯƠNG PHÁP], c-book)

#muc([Ứng dụng vectơ và tọa độ trong Vật lí])

#block(breakable: false)[
  #phuongphap(title: [Mô hình hóa hệ lực và vận tốc])[
    - *Hợp lực:* Khi một vật chịu tác dụng của nhiều lực $vec(F)_1, vec(F)_2, ..., vec(F)_n$, hợp lực tác dụng lên vật là tổng các vectơ lực đó:
      $ vec(F) = vec(F)_1 + vec(F)_2 + ... + vec(F)_n $
    - *Điều kiện cân bằng:* Vật ở trạng thái cân bằng lực khi và chỉ khi hợp lực bằng vectơ không:
      $ vec(F) = vec(0) <=> vec(F)_1 + vec(F)_2 + ... + vec(F)_n = vec(0) $
    - *Vận tốc tổng hợp:* Vận tốc thực tế của một vật chuyển động trong môi trường động (như thuyền đi trên nước sông đang chảy, máy bay bay trong gió) bằng tổng vectơ của vận tốc vật và vận tốc môi trường:
      $ vec(v) = vec(v)_1 + vec(v)_2 $
  ]
]

#v(0.5em)
#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Mặt trần nhà (ceiling)
    let C_A = (-2.0, 2.5)
    let C_B = (2.0, 2.5)
    let C_C = (2.8, 3.2)
    let C_D = (-1.2, 3.2)
    
    line(C_A, C_B, C_C, C_D, close: true, fill: rgb("#f8fafc"), stroke: 0.6pt + gray)
    
    // Ba điểm treo trên trần
    let A = (-1.0, 2.7)
    let B = (1.2, 2.6)
    let C = (0.3, 3.0)
    
    // Điểm treo đèn M
    let M = (0.2, 0.8)
    
    // Vẽ dây treo
    line(M, A, stroke: 0.8pt + gray)
    line(M, B, stroke: 0.8pt + gray)
    line(M, C, stroke: 0.8pt + gray)
    
    // Vẽ các vectơ lực căng dây
    // Lực F1 dọc theo MA
    line(M, (-0.4, 1.75), mark: (end: "stealth", scale: 0.4), stroke: 1.5pt + rgb("#0d9488"))
    // Lực F2 dọc theo MB
    line(M, (0.7, 1.7), mark: (end: "stealth", scale: 0.4), stroke: 1.5pt + rgb("#065f46"))
    // Lực F3 dọc theo MC
    line(M, (0.25, 1.9), mark: (end: "stealth", scale: 0.4), stroke: 1.5pt + rgb("#0284c7"))
    
    // Vẽ vectơ trọng lực P thẳng đứng xuống dưới
    let P_pt = (0.2, -0.7)
    line(M, P_pt, mark: (end: "stealth", scale: 0.5), stroke: 1.8pt + rgb("#b91c1c"))
    
    // Vẽ bóng đèn treo tại M
    circle(M, radius: 0.12, fill: rgb("#fbbf24"), stroke: 0.8pt + black)
    
    // Điểm nút treo trần
    circle(A, radius: 0.04, fill: black)
    circle(B, radius: 0.04, fill: black)
    circle(C, radius: 0.04, fill: black)
    
    // Nhãn
    content((-0.6, 1.8), $vec(F)_1$)
    content((0.9, 1.8), $vec(F)_2$)
    content((0.5, 2.0), $vec(F)_3$)
    content((0.55, -0.4), $vec(P)$)
    content((-0.1, 0.8), $M$)
    content((-1.2, 2.9), $A$)
    content((1.4, 2.8), $B$)
    content((0.3, 3.2), $C$)
  })
  #v(0.3em)
  #text(size: 10pt, style: "italic", fill: gray)[Hình 8. Mô hình phân tích lực căng của các dây treo đèn trần ở trạng thái cân bằng]
]

#muc([Ứng dụng trong Định vị vệ tinh và Địa kĩ thuật])

#block(breakable: false)[
  #phuongphap(title: [Mô hình hóa định vị vệ tinh và bề mặt địa hình])[
    - *Mô hình mặt cầu Trái Đất:* Trái Đất có thể xem như mặt cầu $(S)$ tâm $O(0;0;0)$ bán kính $R approx 6371$ km. Một điểm $M(x;y;z)$ trên bề mặt Trái Đất thỏa mãn phương trình:
      $ x^2 + y^2 + z^2 = R^2 $
    - *Định vị GPS:* Thiết bị thu sóng nhận tín hiệu từ các vệ tinh $S_1, S_2, S_3$ có tọa độ đã biết. Bằng cách tính khoảng cách $d_i$ từ máy thu $M(x;y;z)$ đến mỗi vệ tinh $S_i(x_i;y_i;z_i)$, ta thiết lập hệ phương trình mặt cầu giao nhau để xác định vị trí $M$:
      $ (x - x_i)^2 + (y - y_i)^2 + (z - z_i)^2 = d_i^2 quad (i = 1, 2, 3) $
    - *Độ dốc địa hình:* Mặt đất hoặc mái nghiêng của các công trình xây dựng được biểu diễn dưới dạng mặt phẳng $(P): A x + B y + C z + D = 0$. Độ dốc được xác định qua góc giữa mặt phẳng nghiêng và mặt phẳng nằm ngang (thường là mặt phẳng $O x y$).
  ]
]

#v(0.5em)

#muc([Bài toán tối ưu hóa trong thực tế])

#block(breakable: false)[
  #phuongphap(title: [Các bước giải bài toán tối ưu hình học])[
    - *Bước 1:* Thiết lập hệ tọa độ thích hợp cho mô hình thực tế (ví dụ: góc phòng, mặt đất, tháp truyền hình,...).
    - *Bước 2:* Biểu diễn các đại lượng cần tối ưu dưới dạng hàm số của một biến số $x$ (hoặc góc $theta$).
    - *Bước 3:* Tìm tập xác định thực tế của biến số $x$.
    - *Bước 4:* Khảo sát hàm số đó bằng công cụ đạo hàm, lập bảng biến thiên để tìm giá trị lớn nhất (cực đại) hoặc nhỏ nhất (cực tiểu).
  ]
]

#pagebreak()

#q-wrap(dir: "doc", text(weight: "bold")[Ví dụ mẫu 1 (Bài toán tối ưu hóa đường ống dẫn):] + [
  Một đường ống dẫn dầu nối từ trạm dầu $A(1; 2; 5)$ đến một vị trí $M(x; y; 0)$ trên mặt đất (mặt phẳng $O x y$) và sau đó dẫn tiếp đến nhà máy $B(5; 5; 3)$. Hãy tìm tọa độ của trạm trung chuyển $M$ sao cho tổng chiều dài đường ống $A M + M B$ ngắn nhất.
  
  *Lời giải:*
  - Nhận xét: $A$ và $B$ đều nằm ở phía trên mặt phẳng $O x y$ (cao độ dương $z_A = 5 > 0, z_B = 3 > 0$).
  - Để tổng khoảng cách $A M + M B$ ngắn nhất, ta lấy điểm đối xứng $A'$ của $A$ qua mặt phẳng $O x y$. Tọa độ của $A'$ là $A'(1; 2; -5)$.
  - Khi đó, với mọi $M in (O x y)$, ta luôn có $A M = A' M$, suy ra $A M + M B = A' M + M B >= A' B$.
  - Dấu đẳng thức xảy ra khi và chỉ khi ba điểm $A', M, B$ thẳng hàng, tức là $M$ là giao điểm của đường thẳng $A' B$ với mặt phẳng $O x y$.
  - Vectơ chỉ phương của đường thẳng $A' B$: $vec(A' B) = (4; 3; 8)$.
  - Phương trình tham số của $A' B$: $x = 1 + 4t, y = 2 + 3t, z = -5 + 8t$.
  - Giao điểm $M$ của $A' B$ với mặt phẳng $O x y$ ứng với $z = 0 <=> -5 + 8t = 0 <=> t = 5/8$.
  - Thế $t = 5/8$ vào tọa độ $x, y$ của $M$:
    $x_M = 1 + 4(5/8) = 7/2$; $y_M = 2 + 3(5/8) = 31/8$.
  - Vậy vị trí đặt trạm trung chuyển là $M(7/2; 31/8; 0)$.
])

#v(0.5em)

#q-wrap(dir: "doc", text(weight: "bold")[Ví dụ mẫu 2 (Bài toán cơ học dây treo đối xứng):] + [
  Một chiếc đèn nghệ thuật có trọng lượng $P = 40$ N được treo cố định tại điểm $O(0; 0; 0)$ bởi bốn dây cáp đối xứng gắn vào trần nhà tại bốn điểm $A(1; 1; 2)$, $B(-1; 1; 2)$, $C(-1; -1; 2)$, và $D(1; -1; 2)$. Hãy xác định độ lớn lực căng của mỗi sợi dây.
  
  *Lời giải:*
  - Do tính đối xứng của hệ thống treo và vị trí treo, độ lớn lực căng trên bốn sợi dây cáp là bằng nhau: $T_A = T_B = T_C = T_D = T$.
  - Lực căng $vec(T)_A$ của dây cáp nối từ vật $O(0; 0; 0)$ đến $A(1; 1; 2)$ hướng theo vectơ $vec(O A) = (1; 1; 2)$.
  - Ta có độ dài $vec(O A)$: $|vec(O A)| = sqrt(1^2 + 1^2 + 2^2) = sqrt(6)$.
  - Vectơ lực căng của dây cáp $O A$ là:
    $ vec(T)_A = T dot.c frac(vec(O A), |vec(O A)|) = frac(T, sqrt(6)) (1; 1; 2) $
  - Tương tự, do tính đối xứng, ta có:
    - $vec(T)_B = frac(T, sqrt(6)) (-1; 1; 2)$
    - $vec(T)_C = frac(T, sqrt(6)) (-1; -1; 2)$
    - $vec(T)_D = frac(T, sqrt(6)) (1; -1; 2)$
  - Tổng các lực tác dụng lên đèn khi cân bằng là:
    $ vec(T)_A + vec(T)_B + vec(T)_C + vec(T)_D + vec(P) = vec(0) $
    với $vec(P) = (0; 0; -40)$ là trọng lượng của đèn hướng thẳng đứng xuống dưới.
  - Chiếu phương trình cân bằng lên trục $O z$ (hoặc cộng thành phần cao độ):
    $ frac(2 T, sqrt(6)) + frac(2 T, sqrt(6)) + frac(2 T, sqrt(6)) + frac(2 T, sqrt(6)) - 40 = 0 $
    $ <=> frac(8 T, sqrt(6)) = 40 <=> T = 5 sqrt(6) approx 12.25 quad (N). $
  - Vậy độ lớn lực căng của mỗi sợi dây cáp là $5 sqrt(6)$ N (xấp xỉ $12.25$ N).
])
#muc([Chuyển động học Oxyz và Bài toán đón mục tiêu])

#block(breakable: false)[
  #phuongphap(title: [Chuyển động thẳng đều và đón chặn mục tiêu])[
    - *Phương trình chuyển động:* Một vật chuyển động thẳng đều xuất phát từ điểm $M_0 (x_0; y_0; z_0)$ với vận tốc không đổi $vec(v) = (a; b; c)$ có tọa độ tại thời điểm $t$ là:
      $ M(t) = M_0 + t dot.c vec(v) = (x_0 + a t; y_0 + b t; z_0 + c t) $
    - *Tốc độ chuyển động:* Tốc độ $v$ là độ dài của vectơ vận tốc: $v = |vec(v)| = sqrt(a^2 + b^2 + c^2)$.
    - *Khoảng cách ngắn nhất:* Khoảng cách giữa hai vật chuyển động $M_1(t) = A_0 + t vec(v)_1$ và $M_2(t) = B_0 + t vec(v)_2$ tại thời điểm $t$ là độ dài vectơ $vec(M_1 M_2)(t)$. Khoảng cách này đạt giá trị nhỏ nhất khi vectơ khoảng cách vuông góc với vectơ vận tốc tương đối:
      $ vec(M_1 M_2)(t) dot.c (vec(v)_2 - vec(v)_1) = 0 $
    - *Đón chặn mục tiêu:* Thiết bị đánh chặn phóng từ vị trí $B$ tại thời điểm $t_0$ với vận tốc $vec(v)_c$ để đón mục tiêu $M(t)$ tại thời điểm $t_1 > t_0$ khi và chỉ khi:
      $ M(t_1) = B + (t_1 - t_0) dot.c vec(v)_c $
  ]
]

#v(0.5em)

#vidu(title: [Đón chặn tàu chiến địch (Kịch bản quân sự)], [
  Trong một kịch bản diễn tập phòng thủ bờ biển, radar phát hiện một tàu địch (coi là điểm $M$) chuyển động thẳng đều từ vị trí $A(10; -5; -0.1)$ (km) theo hướng vectơ chỉ phương $vec(u) = (3; 4; 0)$ với tốc độ $v_1 = 30$ km/h. Trạm pháo phòng thủ bờ biển đặt tại vị trí $S(0; 0; 0)$. Sau khi phát hiện tàu địch chuyển động được 10 phút, trạm pháo phóng một quả đạn tự dẫn (coi là điểm $P$) chuyển động thẳng đều hướng thẳng đến tàu địch nhằm bắn hạ nó. Biết đạn pháo bắn trúng tàu địch sau 12 phút kể từ khi đạn được phóng đi.
  - a) Xác định vị trí của tàu địch tại thời điểm bị bắn trúng.
  - b) Xác định vectơ vận tốc $vec(v)_2$ và tốc độ của đạn pháo.
], [
  - Đổi thời gian sang giờ:
    - Thời gian tàu chạy trước khi đạn được bắn: $t_1 = 10 " phút" = 1/6 " giờ"$.
    - Thời gian đạn bay: $t_2 = 12 " phút" = 1/5 " giờ"$.
    - Tổng thời gian tàu địch di chuyển từ lúc ở $A$ đến lúc bị trúng đạn:
      $ t = t_1 + t_2 = frac(1, 6) + frac(1, 5) = frac(11, 30) " giờ" $
  - Vectơ chỉ phương của hướng đi của tàu là $vec(u) = (3; 4; 0)$ có độ dài $|vec(u)| = sqrt(3^2 + 4^2 + 0^2) = 5$.
  - Vectơ vận tốc $vec(v)_1$ của tàu địch là:
    $ vec(v)_1 = frac(v_1, |vec(u)|) dot.c vec(u) = frac(30, 5) (3; 4; 0) = (18; 24; 0) " (km/h)" $
  - Vị trí của tàu địch tại thời điểm bị bắn trúng:
    $ M_c = A + t vec(v)_1 = (10; -5; -0.1) + frac(11, 30) (18; 24; 0) = (16.6; 3.8; -0.1) " (km)" $
  - Đạn pháo xuất phát từ trạm pháo $S(0; 0; 0)$ tại thời điểm $t_1 = 1/6$ giờ và gặp tàu tại $M_c$ sau $t_2 = 1/5$ giờ bay. Vectơ dịch chuyển của đạn là $vec(S M_c) = (16.6; 3.8; -0.1)$.
  - Vectơ vận tốc $vec(v)_2$ của đạn pháo:
    $ vec(v)_2 = frac(vec(S M_c), t_2) = 5 vec(S M_c) = 5 (16.6; 3.8; -0.1) = (83; 19; -0.5) " (km/h)" $
  - Tốc độ của đạn pháo:
    $ v_2 = |vec(v)_2| = sqrt(83^2 + 19^2 + (-0.5)^2) = sqrt(6889 + 361 + 0.25) = sqrt(7250.25) approx 85.15 " (km/h)" $
])

#v(0.5em)

#vidu(title: [Khoảng cách ngắn nhất giữa hai chuyển động bay drone], [
  Hai chiếc máy bay không người lái (drone) $A$ và $B$ cất cảnh đồng thời từ hai vị trí cách xa nhau:
  - Drone $A$ xuất phát từ điểm $A_0(1; 2; 0.5)$ (km) và bay thẳng đều theo hướng vectơ $vec(v)_A = (60; 80; 10)$ (km/h).
  - Drone $B$ xuất phát từ điểm $B_0(5; 9; 1.2)$ (km) và bay thẳng đều theo hướng vectơ $vec(v)_B = (-40; -70; 20)$ (km/h).
  - a) Thiết lập biểu thức khoảng cách giữa hai chiếc drone tại thời điểm $t$ giờ.
  - b) Tìm khoảng cách ngắn nhất giữa hai chiếc drone và thời điểm đạt được khoảng cách đó.
], [
  - Vị trí của drone $A$ tại thời điểm $t$ (giờ):
    $ A(t) = A_0 + t vec(v)_A = (1 + 60t; 2 + 80t; 0.5 + 10t) $
  - Vị trí của drone $B$ tại thời điểm $t$ (giờ):
    $ B(t) = B_0 + t vec(v)_B = (5 - 40t; 9 - 70t; 1.2 + 20t) $
  - Vectơ khoảng cách giữa hai chiếc drone:
    $ vec(A B)(t) = B(t) - A(t) = (4 - 100t; 7 - 150t; 0.7 + 10t) $
  - Bình phương khoảng cách giữa hai chiếc drone:
    $ f(t) = |vec(A B)(t)|^2 = (4 - 100t)^2 + (7 - 150t)^2 + (0.7 + 10t)^2 $
    $ f(t) = (16 - 800t + 10000t^2) + (49 - 2100t + 22500t^2) + (0.49 + 14t + 100t^2) $
    $ f(t) = 32600t^2 - 2886t + 65.49 $
  - Khoảng cách ngắn nhất đạt được khi hàm số bậc hai $f(t)$ đạt cực tiểu:
    $ t_0 = -frac(-2886, 2 dot 32600) = frac(1443, 32600) approx 0.04426 " (giờ) " approx 2.66 " (phút)" $
  - Giá trị nhỏ nhất của $f(t)$:
    $ f(t_0) = 32600(0.04426)^2 - 2886(0.04426) + 65.49 approx 1.56 " (km"^2")" $
  - Vậy khoảng cách ngắn nhất giữa hai chiếc drone là:
    $ d_(min) = sqrt(1.56) approx 1.25 " (km)" $
])

#muc([Chuyển động có tốc độ trên các hình hình học không gian])

#block(breakable: false)[
  #phuongphap(title: [Phương pháp mô tả tọa độ chuyển động trên cạnh/mặt hình học])[
    - *Bước 1:* Thiết lập hệ tọa độ $O x y z$ tương ứng với hình hình học (thường đặt góc tại đỉnh vuông góc).
    - *Bước 2:* Xác định phương trình tham số hoặc dạng vectơ cho từng đoạn thẳng của đường di chuyển.
    - *Bước 3:* Phân tích quãng đường đi được theo thời gian $s(t) = v dot t$. Sử dụng điều kiện biên để xác định vị trí của vật trên từng đoạn tại mỗi thời điểm.
    - *Bước 4:* Tính khoảng cách giữa vật di chuyển với điểm, mặt phẳng hoặc vật khác tại thời điểm $t$, từ đó giải quyết yêu cầu bài toán tối ưu.
  ]
]

#v(0.5em)

#vidu(title: [Chuyển động trên các cạnh của hình lập phương], [
  Cho hình lập phương $A B C D . A' B' C' D'$ có cạnh bằng $a = 6$ cm. Thiết lập hệ trục tọa độ sao cho $A(0; 0; 0)$, $B(6; 0; 0)$, $D(0; 6; 0)$ và $A'(0; 0; 6)$.
  Một điểm $M$ bắt đầu di chuyển từ đỉnh $A$ dọc theo đường gấp khúc $A - B - C - C'$ với tốc độ không đổi $v_M = 2$ cm/s. Đồng thời, một điểm $N$ xuất phát từ đỉnh $D'$ di chuyển dọc theo cạnh $D' D$ với tốc độ không đổi $v_N = 1$ cm/s.
  - a) Xác định tọa độ của $M$ và $N$ tại thời điểm $t$ giây ($0 <= t <= 9$).
  - b) Tìm khoảng cách giữa $M$ và $N$ tại thời điểm $t = 5$ giây.
  - c) Tìm thời điểm $t$ để khoảng cách giữa $M$ và $N$ đạt giá trị nhỏ nhất trong khoảng thời gian trên.
], [
  - Tọa độ các đỉnh liên quan: $A(0;0;0)$, $B(6;0;0)$, $C(6;6;0)$, $D(0;6;0)$, $D'(0;6;6)$.
  - *Xác định tọa độ của điểm $N$ tại thời điểm $t$ ($0 <= t <= 6$):*
    - $N$ xuất phát từ $D'(0;6;6)$ di chuyển dọc theo cạnh $D' D$ về phía $D(0;6;0)$ với tốc độ 1 cm/s.
    - Tại thời điểm $t$ ($0 <= t <= 6$), khoảng cách $D' N = 1 dot t = t$, do đó cao độ của $N$ giảm đi $t$.
    - Tọa độ của $N$ là: $N(t) = (0; 6; 6 - t)$.
  - *Xác định tọa độ của điểm $M$ tại thời điểm $t$ ($0 <= t <= 9$):*
    - Quãng đường $M$ di chuyển được là $s(t) = 2t$ (cm).
    - *Trường hợp 1:* $0 <= t <= 3$ (quãng đường $2t <= 6$):
      $M$ di chuyển trên cạnh $A B$ từ $A(0;0;0)$ đến $B(6;0;0)$. Tọa độ của $M$ là: $M(t) = (2t; 0; 0)$.
    - *Trường hợp 2:* $3 < t <= 6$ (quãng đường $6 < 2t <= 12$):
      $M$ di chuyển trên cạnh $B C$ từ $B(6;0;0)$ đến $C(6;6;0)$. Đoạn đường trên $B C$ là $2t - 6$.
      Tọa độ của $M$ là: $M(t) = (6; 2t - 6; 0)$.
    - *Trường hợp 3:* $6 < t <= 9$ (quãng đường $12 < 2t <= 18$):
      $M$ di chuyển trên cạnh $C C'$ từ $C(6;6;0)$ đến $C'(6;6;6)$. Đoạn đường trên $C C'$ là $2t - 12$.
      Tọa độ của $M$ là: $M(t) = (6; 6; 2t - 12)$.
  - *Tại thời điểm $t = 5$ giây (thuộc Trường hợp 2):*
    - Tọa độ của $M(5) = (6; 2 dot 5 - 6; 0) = (6; 4; 0)$.
    - Tọa độ của $N(5) = (0; 6; 6 - 5) = (0; 6; 1)$.
    - Khoảng cách giữa $M$ và $N$ tại $t = 5$ s là:
      $ M N = sqrt((0 - 6)^2 + (6 - 4)^2 + (1 - 0)^2) = sqrt((-6)^2 + 2^2 + 1^2) = sqrt(36 + 4 + 1) = sqrt(41) approx 6.40 " (cm)" $
  - *Tìm thời điểm khoảng cách đạt giá trị nhỏ nhất:*
    - Ta xét bình phương khoảng cách $d^2(t) = M N^2(t)$ trên các khoảng thời gian khác nhau của $t$:
      - *Với $0 <= t <= 3$:* $M(t) = (2t; 0; 0)$ và $N(t) = (0; 6; 6 - t)$.
        $ d^2(t) = (2t - 0)^2 + (0 - 6)^2 + (0 - (6 - t))^2 = 4t^2 + 36 + (6 - t)^2 = 5t^2 - 12t + 72 $
        Hàm số bậc hai này đạt giá trị nhỏ nhất tại đỉnh $t = -frac(-12, 2 dot 5) = 1.2$ s (nằm trong đoạn $[0; 3]$).
        Giá trị nhỏ nhất khi đó là: $d^2(1.2) = 5(1.2)^2 - 12(1.2) + 72 = 64.8$ cm#super[2].
      - *Với $3 < t <= 6$:* $M(t) = (6; 2t - 6; 0)$ và $N(t) = (0; 6; 6 - t)$.
        $ d^2(t) = (6 - 0)^2 + (2t - 6 - 6)^2 + (0 - (6 - t))^2 = 36 + (2t - 12)^2 + (t - 6)^2 $
        $ d^2(t) = 36 + 4(t - 6)^2 + (t - 6)^2 = 36 + 5(t - 6)^2 $
        Trên khoảng $(3; 6]$, hàm số $d^2(t) = 36 + 5(t - 6)^2$ nghịch biến nên đạt giá trị nhỏ nhất tại đầu mút $t = 6$ với $d^2(6) = 36$ cm#super[2].
      - *Với $6 < t <= 9$:* Tọa độ $N$ giữ nguyên tại đỉnh $D(0; 6; 0)$ vì sau $6$ s $N$ đã đến đích.
        $M(t) = (6; 6; 2t - 12)$.
        $ d^2(t) = (6 - 0)^2 + (6 - 6)^2 + (2t - 12 - 0)^2 = 36 + (2t - 12)^2 $
        Hàm số này đồng biến trên $(6; 9]$ nên đạt giá trị nhỏ nhất tại đầu mút $t = 6$ với $d^2(6) = 36$ cm#super[2].
    - *So sánh:* Giá trị nhỏ nhất của $d^2(t)$ trên cả 3 khoảng là $36$ (cm#super[2]), tương ứng với khoảng cách $d = 6$ cm tại thời điểm $t = 6$ giây.
])

#muc([Ứng dụng Định vị vệ tinh nâng cao])

#vidu(title: [Xác định tọa độ thiết bị định vị GPS], [
  Một trạm đo lường mặt đất nhận tín hiệu từ ba vệ tinh $S_1(0; 0; 20)$, $S_2(15; 0; 20)$, $S_3(0; 15; 20)$ (đơn vị tọa độ là nghìn kilômét). Thiết bị thu tín hiệu $M(x; y; z)$ nằm trên bề mặt Trái Đất xem như mặt cầu có phương trình $x^2 + y^2 + z^2 = R^2 = 64$.
  Biết khoảng cách từ trạm thu $M$ đến vệ tinh $S_1$ là $12$ nghìn km, và khoảng cách đến hai vệ tinh $S_2, S_3$ đều bằng $sqrt(369)$ nghìn km. Hãy xác định tọa độ của trạm thu $M$.
], [
  - Ta có hệ phương trình khoảng cách từ $M(x; y; z)$ đến $S_1, S_2, S_3$:
    $ (x - 0)^2 + (y - 0)^2 + (z - 20)^2 = 12^2 = 144  quad  (1) $
    $ (x - 15)^2 + (y - 0)^2 + (z - 20)^2 = (sqrt(369))^2 = 369  quad  (2) $
    $ (x - 0)^2 + (y - 15)^2 + (z - 20)^2 = (sqrt(369))^2 = 369  quad  (3) $
  - Khai triển phương trình $(1)$ và $(2)$, sau đó trừ vế theo vế:
    $ (2) - (1) <=> (x - 15)^2 - x^2 = 369 - 144 = 225 $
    $ <=> -30x + 225 = 225 <=> x = 0 $
  - Tương tự, khai triển phương trình $(1)$ và $(3)$, sau đó trừ vế theo vế:
    $ (3) - (1) <=> (y - 15)^2 - y^2 = 369 - 144 = 225 $
    $ <=> -30y + 225 = 225 <=> y = 0 $
  - Thế $x = 0$ và $y = 0$ vào phương trình mặt cầu Trái Đất $x^2 + y^2 + z^2 = 64$, ta được:
    $ z^2 = 64 <=> z = 8 " hoặc " z = -8 $
  - Thay lại vào phương trình $(1)$ để kiểm tra cao độ $z$:
    - Nếu $z = -8$: $( -8 - 20 )^2 = (-28)^2 = 784  !=  144$ (loại).
    - Nếu $z = 8$: $( 8 - 20 )^2 = (-12)^2 = 144$ (thỏa mãn).
  - Vậy tọa độ của trạm thu là $M(0; 0; 8)$.
])

#pagebreak()

#vidu(title: [Đón chặn mục tiêu bay quân sự], [
  Một thiết bị bay mục tiêu (drone) chuyển động thẳng đều với vận tốc $vec(v)_1 = (2; 3; 2)$ (km/phút), tại thời điểm $t = 0$ phút mục tiêu ở vị trí $A(8; 10; 11)$. Trạm phòng thủ mặt đất đặt tại vị trí $S(0; 0; 0)$ phát hiện mục tiêu và phóng một tên lửa đánh chặn chuyển động thẳng đều với vận tốc $vec(v)_c$ để bắn hạ mục tiêu tại thời điểm $t = 2$ phút.
  + a) Tìm tọa độ vị trí mục tiêu tại thời điểm bị bắn hạ.
  + b) Tìm vectơ vận tốc $vec(v)_c$ và tốc độ của tên lửa đánh chặn (km/phút).
], [
  - Tọa độ mục tiêu tại thời điểm $t$ là $M(t) = (8 + 2t; 10 + 3t; 11 + 2t)$.
  - Tại thời điểm bị bắn hạ $t = 2$ phút, tọa độ của mục tiêu là:
    $ M(2) = (8 + 2 dot.c 2; 10 + 3 dot.c 2; 11 + 2 dot.c 2) = (12; 16; 15). $
  - Tên lửa xuất phát từ gốc tọa độ $S(0; 0; 0)$ tại thời điểm $t = 0$ và gặp mục tiêu tại $M(2)$ sau $2$ phút. Vectơ dịch chuyển của tên lửa là:
    $ vec(S M(2)) = (12; 16; 15). $
  - Vectơ vận tốc của tên lửa đánh chặn là:
    $ vec(v)_c = frac(vec(S M(2)), 2) = (6; 8; 7.5) quad ("km/phút"). $
  - Tốc độ của tên lửa đánh chặn là:
    $ v_c = |vec(v)_c| = sqrt(6^2 + 8^2 + 7.5^2) = sqrt(36 + 64 + 56.25) = sqrt(156.25) = 12.5 quad ("km/phút"). $
])

#pagebreak()

#q-label([B. ĐỀ LUYỆN TẬP], c-book)

#include "c2-b8-de1.typ"

#v(1.5em)
#print-answer-key()
#resetexamstate()
