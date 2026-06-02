#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

= CHƯƠNG I — ĐƯỜNG THAM SỐ TRONG KHÔNG GIAN 3D

== 1. Từ Phương Trình Đường Thẳng Phổ Thông Đến Đường Cong Tham Số 3D

Trong chương trình hình học lớp 12, chúng ta đã được học cách viết phương trình tham số của một đường thẳng $d$ đi qua điểm $M_0(x_0, y_0, z_0)$ và có vectơ chỉ phương $vec(u) = (a, b, c)$:
$ cases(
  x = x_0 + a t,
  y = y_0 + b t,
  z = z_0 + c t
) quad (t in RR) $
Ở đây, ta cho tham số $t$ nhận các giá trị thực khác nhau. Với mỗi giá trị $t$ cụ thể, bộ ba số $(x, y, z)$ tính được chính là tọa độ của một điểm nằm trên đường thẳng. Nếu ta xem $t$ là thời gian trôi qua, phương trình này mô tả chuyển động thẳng đều của một chất điểm trong không gian với vận tốc không đổi là $vec(u) = (a, b, c)$.

Bây giờ, nếu ta thay thế các hàm bậc nhất theo $t$ (là $a t, b t, c t$) bằng các hàm số phi tuyến bất kỳ (như hàm bậc hai, hàm lượng giác, hàm mũ), ta sẽ thu được gì? 
$ vec(r)(t) = (x(t), y(t), z(t)) quad (t in [alpha, beta]) $
Ánh xạ này sẽ không còn vẽ ra một đường thẳng đơn điệu nữa. Khi $t$ chạy liên tục từ $alpha$ đến $beta$, điểm đầu bút $M(x(t), y(t), z(t))$ sẽ vạch ra một *đường cong tham số* uốn lượn mềm mại trong không gian 3D. Đây chính là bước chuyển giao từ hình học tĩnh sang hình học động.

#eye-box[
  *Trực giác vật lý về đường tham số:*
  
  Hãy tưởng tượng bạn đang lái một chiếc xe hơi chạy dọc theo một con đường đèo quanh co trên núi.
  - Tại mỗi thời điểm $t$ (giây), xe của bạn đang ở một vị trí xác định trong không gian. Bộ ba số tọa độ $(x(t), y(t), z(t))$ chính là phương trình tham số mô tả con đường đèo đó.
  - Chiếc kim đồng hồ đo tốc độ (tốc kế) trước mặt bạn chỉ độ lớn vận tốc tức thời của xe, chính là tốc độ di chuyển của bạn trên đường cong.
  - Hướng mũi xe của bạn tại mỗi tích tắc luôn chỉ thẳng theo hướng tiếp tuyến của con đường đèo tại vị trí đó.
]

#tech-box[
  *Đại lượng Động học của Đường tham số:*
  
  Cho đường cong tham số $C: vec(r)(t) = (x(t), y(t), z(t))$. Các đại lượng cốt lõi được định nghĩa tương tự như trong vật lý phổ thông:
  
  1. *Vectơ vị trí:* $vec(r)(t)$ xuất phát từ gốc tọa độ $O$ đến điểm trên đường cong.
  2. *Vectơ vận tốc (Vectơ tiếp tuyến):* Là đạo hàm của vectơ vị trí theo thời gian $t$:
     $ vec(v)(t) = vec(r)'(t) = (x'(t), y'(t), z'(t)) $
     Vectơ này luôn trùng với vectơ chỉ phương của đường thẳng tiếp tuyến của đường cong tại thời điểm $t$.
  3. *Tốc độ di chuyển:* Là độ dài của vectơ vận tốc:
     $ v(t) = |vec(r)'(t)| = sqrt((x'(t))^2 + (y'(t))^2 + (z'(t))^2) $
  4. *Phương trình tiếp tuyến:* Đường thẳng tiếp tuyến tại thời điểm $t_0$ đi qua điểm $M_0(x(t_0), y(t_0), z(t_0))$ và nhận $vec(r)'(t_0)$ làm vectơ chỉ phương:
     $ cases(
       x = x(t_0) + x'(t_0) dot s,
       y = y(t_0) + y'(t_0) dot s,
       z = z(t_0) + z'(t_0) dot s
     ) quad (s in RR) $
]

== 2. Bài Toán Quãng Đường (Độ Dài Cung) Dưới Góc Nhìn Tích Phân

Trong vật lý lớp 10, ta biết rằng quãng đường đi được bằng vận tốc nhân thời gian ($s = v dot t$) nếu vận tốc không đổi. Nếu vận tốc thay đổi liên tục, ta phải chia nhỏ thời gian thành các khoảng cực ngắn $d t$, tính quãng đường nhỏ $d s = v(t) d t$, rồi cộng dồn lại bằng phép tính tích phân.

Công thức tính độ dài của một sợi dây cong trong không gian từ điểm ứng với tham số $t = a$ đến $t = b$ chính là tích phân của tốc độ tức thời:

#core-box[
  *Công thức tính Độ dài cung (Arc Length):*
  
  $ L = integral_a^b |vec(r)'(t)| d t = integral_a^b sqrt((x'(t))^2 + (y'(t))^2 + (z'(t))^2) d t $
  
  Công thức này liên kết trực tiếp hình học không gian với công cụ *Tích phân đơn biến* của giải tích lớp 12.
]

== 3. Khái Niệm Trực Quan về Độ Cong và Độ Xoắn

Làm thế nào để ta đo lường xem một đường đi bẻ cua gấp khúc ra sao (độ cong) hay nó uốn xoắn ra khỏi mặt phẳng như thế nào (độ xoắn)? Trong toán cao cấp, người ta dùng hệ tọa độ di động Frenet-Serret. Để phù hợp với trình độ phổ thông, chúng ta sẽ định nghĩa hai đại lượng này thông qua các phép toán vectơ của lớp 12:

1. *Độ cong $kappa$ (kappa):* Đo tốc độ thay đổi hướng đi của đường cong.
   - Nếu $kappa = 0$ tại mọi điểm, đường cong thực chất là một đường thẳng (không bẻ cong).
   - Đối với một đường tròn bán kính $R$, độ cong tại mọi điểm đều như nhau và bằng $kappa = 1/R$ (bán kính càng nhỏ cua càng gấp, độ cong càng lớn).
   - Công thức tính nhanh bằng tọa độ Oxyz thông qua tích có hướng và tích vô hướng:
     $ kappa = (|vec(r)'(t) times vec(r)''(t)|) / (|vec(r)'(t)|^3) $
     *Ý nghĩa vật lý:* Đạo hàm bậc hai $vec(r)''(t)$ chính là vectơ gia tốc. Tích có hướng $vec(r)' times vec(r)''$ đo lường phần gia tốc vuông góc với vận tốc (phần lực kéo vật lệch khỏi đường đi thẳng). Độ lớn tích có hướng này càng lớn thì đường bẻ cua càng gấp.
     *Liên hệ thực tế:* Theo vật lý phổ thông, khi xe đi qua khúc cua có độ cong $kappa$, lực ly tâm tác dụng lên xe là $F_c = m v^2 kappa$. Độ cong $kappa$ càng lớn thì lực ly tâm càng mạnh, xe càng dễ bị trượt bánh khỏi đường đèo.

2. *Độ xoắn $tau$ (tau):* Đo lường mức độ đường cong vặn mình thoát ra khỏi mặt phẳng chứa nó.
   - Nếu $tau = 0$ tại mọi điểm, đường cong là một đường cong phẳng (ví dụ như đường parabol, đường elip nằm phẳng trên bàn).
   - Nếu $tau != 0$, đường cong là đường cong không gian 3D thực thụ (như lò xo xoắn ốc).
   - Công thức tính nhanh qua tích hỗn tạp Oxyz của ba đạo hàm bậc một, hai và ba:
     $ tau = ((vec(r)' times vec(r)'') dot vec(r)''') / (|vec(r)' times vec(r)''|^2) $

#bridge-box("Ứng dụng trong thiết kế đường cao tốc và đường sắt")[
  Khi thiết kế đường bộ hoặc đường sắt, các kỹ sư không bao giờ nối trực tiếp một đoạn đường thẳng tắp vào một đoạn cua tròn. Tại sao?
  - Đoạn đường thẳng có độ cong $kappa = 0$.
  - Đoạn đường cong tròn có độ cong $kappa = 1/R > 0$.
  Nếu nối trực tiếp, tại điểm tiếp giáp, độ cong thay đổi đột ngột từ $0$ lên $1/R$. Điều này dẫn đến lực ly tâm tác dụng lên hành khách và phương tiện thay đổi đột ngột từ $0$ lên $m v^2/R$. Kết quả là xe bị giật mạnh, hành khách khó chịu và tàu hỏa rất dễ bị trật bánh!
  
  Để khắc phục, người ta chèn vào giữa một đoạn *đường cong chuyển tiếp* (transition curve, thường là đường xoắn ốc Euler hay Clothoid). Đường cong này có tham số hóa sao cho độ cong $kappa(t)$ tăng dần một cách tuyến tính từ $0$ lên $1/R$, giúp lực ly tâm tăng từ từ, đảm bảo xe chạy êm ái.
]

== 4. Đường Xoắn Ốc Helix – Quỹ Đạo Đối Xứng Hoàn Hảo

Đường xoắn ốc tròn (Helix) là đường đi của một điểm chuyển động tròn đều trên mặt phẳng ngang đồng thời đi lên đều theo phương thẳng đứng. Đây là quỹ đạo của hạt điện tích chuyển động trong từ trường đều, hay các ren của đinh ốc.

#tech-box[
  *Phương trình tham số của đường Helix:*
  $ vec(r)(t) = (R cos t, R sin t, h t) quad (t in RR) $
  Trong đó $R$ là bán kính của hình trụ bao quanh, và $h$ là hệ số tốc độ đi lên theo trục $z$.
]

Hãy cùng tính toán độ cong và độ xoắn của đường Helix này để thấy vẻ đẹp đối xứng của nó:
- Đạo hàm các cấp theo $t$:
  $ vec(r)'(t) = (-R sin t, R cos t, h) $
  $ vec(r)''(t) = (-R cos t, -R sin t, 0) $
  $ vec(r)'''(t) = (R sin t, -R cos t, 0) $
- Độ dài đạo hàm bậc nhất (tốc độ):
  $ |vec(r)'(t)| = sqrt((-R sin t)^2 + (R cos t)^2 + h^2) = sqrt(R^2 + h^2) $
- Tích có hướng của đạo hàm bậc một và hai:
  $ vec(r)'(t) times vec(r)''(t) = (h R sin t, -h R cos t, R^2) $
- Độ lớn của tích có hướng này:
  $ |vec(r)'(t) times vec(r)''(t)| = sqrt((h R sin t)^2 + (-h R cos t)^2 + (R^2)^2) = R sqrt(R^2 + h^2) $
- Tính độ cong $kappa$:
  $ kappa = (R sqrt(R^2 + h^2)) / ((R^2 + h^2)^(3/2)) = R / (R^2 + h^2) $
  Ta thấy $kappa$ hoàn toàn là một hằng số không phụ thuộc vào $t$.
- Tính tích hỗn tạp:
  $ (vec(r)' times vec(r)'') dot vec(r)''' = (h R sin t)(R sin t) + (-h R cos t)(-R cos t) + R^2 (0) = h R^2 $
- Tính độ xoắn $tau$:
  $ tau = (h R^2) / (R^2 (R^2 + h^2)) = h / (R^2 + h^2) $
  Độ xoắn $tau$ cũng là một hằng số không đổi tại mọi điểm!
  
*Kết luận:* Đường Helix là đường cong không gian duy nhất (ngoài đường thẳng và đường tròn) có cả độ cong và độ xoắn đều là hằng số. Nó có một cấu trúc đối xứng tuyệt hảo trong không gian 3D.

#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    let sx = -0.45
    let sy = -0.3
    let proj(x, y, z) = (x + y * sx, z + y * sy)
    
    let r = 1.3
    let h = 4.0
    
    // Khung nét đứt bao ngoài hình trụ
    line(proj(-r, 0, 0), proj(-r, 0, h), stroke: 0.5pt + gray.lighten(50%))
    line(proj(r, 0, 0), proj(r, 0, h), stroke: 0.5pt + gray.lighten(50%))
    
    // Vẽ lưới tròn đáy trên
    for angle in range(0, 36) {
      let t1 = angle * 10 * 3.14159 / 180
      let t2 = (angle + 1) * 10 * 3.14159 / 180
      line(proj(r * calc.cos(t1), r * calc.sin(t1), h), proj(r * calc.cos(t2), r * calc.sin(t2), h), stroke: 0.5pt + gray.lighten(40%))
    }
    
    // Vẽ đường Helix
    let steps = 100
    let pts = ()
    for i in range(0, steps + 1) {
      let t = i * (3.0 * 2.0 * 3.14159) / steps
      let x = r * calc.cos(t)
      let y = r * calc.sin(t)
      let z = h * (i / steps)
      pts.push(proj(x, y, z))
    }
    
    for i in range(0, steps) {
      let color = if calc.sin(i * (3.0 * 2.0 * 3.14159) / steps) < 0 { rgb("#0284C7") } else { rgb("#0EA5E9").lighten(20%) }
      let thickness = if calc.sin(i * (3.0 * 2.0 * 3.14159) / steps) < 0 { 1.5pt } else { 0.8pt }
      line(pts.at(i), pts.at(i+1), stroke: thickness + color)
    }
    
    content(proj(0, 0, h + 0.3), text(size: 8pt, style: "italic")[Đường xoắn ốc Helix trong không gian])
  })
]

== 5. Đường Cong Bézier Dưới Góc Nhìn Nhị Thức Newton Phổ Thông

Đường cong Bézier là công cụ nền tảng trong đồ họa máy tính, giúp tạo ra các phông chữ vector mượt mà (như phông chữ bạn đang đọc) hay các bề mặt thân xe hơi Aerodynamic trong phần mềm CAD.

Toán học đằng sau đường cong Bézier thực chất cực kỳ gần gũi với học sinh phổ thông: nó dựa trên các hệ số của *Nhị thức Newton*!

#tech-box[
  *Đường cong Bézier bậc $n$ (Bézier Curve of degree $n$):*
  
  Cho $n+1$ điểm kiểm soát $vec(P)_0, vec(P)_1, ..., vec(P)_n$ trong không gian 3D. Đường cong Bézier bậc $n$ là một tổ hợp đa thức tham số theo thời gian $t in [0, 1]$:
  $ vec(B)(t) = sum_(i=0)^n C_n^i (1-t)^(n-i) t^i vec(P)_i $
  Trong đó $C_n^i$ chính là tổ hợp chập $i$ của $n$ phần tử (hệ số nhị thức Newton).
]

Hãy xét hai trường hợp quen thuộc nhất:
- *Đường cong Bézier bậc 2 (3 điểm kiểm soát $vec(P)_0, vec(P)_1, vec(P)_2$):*
  $ vec(B)(t) = (1-t)^2 vec(P)_0 + 2t(1-t) vec(P)_1 + t^2 vec(P)_2 $
- *Đường cong Bézier bậc 3 (4 điểm kiểm soát $vec(P)_0, vec(P)_1, vec(P)_2, vec(P)_3$):*
  $ vec(B)(t) = (1-t)^3 vec(P)_0 + 3t(1-t)^2 vec(P)_1 + 3t^2(1-t) vec(P)_2 + t^3 vec(P)_3 $

=== Thuật Toán Hình Học de Casteljau: Phép Chia Tỉ Lệ Đơn Giản

Tại sao công thức trên lại tạo ra một đường cong mượt mà? Paul de Casteljau đã chứng minh điều này bằng một cơ chế hình học vô cùng trực quan dựa trên *phép chia đoạn thẳng theo tỉ lệ $t : (1-t)$* (kiến thức vectơ lớp 10).

Hãy xét trường hợp bậc 2 với 3 điểm kiểm soát $P_0, P_1, P_2$ tại thời điểm $t = 0.4$:
1. Lấy điểm $Q_0$ nằm trên đoạn $P_0 P_1$ sao cho $Q_0$ chia đoạn này theo tỉ lệ $t = 0.4$ (tức là $Q_0 = (1-t)P_0 + t P_1$).
2. Lấy điểm $Q_1$ nằm trên đoạn $P_1 P_2$ sao cho $Q_1$ chia đoạn này theo tỉ lệ $t = 0.4$ (tức là $Q_1 = (1-t)P_1 + t P_2$).
3. Nối $Q_0$ và $Q_1$ thành một đoạn thẳng mới.
4. Lấy điểm $B$ trên đoạn $Q_0 Q_1$ sao cho $B$ chia đoạn này theo tỉ lệ $t = 0.4$ (tức là $B = (1-t)Q_0 + t Q_1$).
Khi cho $t$ chạy liên tục từ $0$ đến $1$, điểm $B(t)$ sẽ vạch ra chính xác đường cong Bézier bậc 2!

#align(center)[
  #canvas(length: 1.2cm, {
    import draw: *
    
    let p0 = (0.0, 0.0)
    let p1 = (2.0, 3.0)
    let p2 = (5.0, 1.0)
    
    // Đa giác kiểm soát
    line(p0, p1, stroke: 0.8pt + gray)
    line(p1, p2, stroke: 0.8pt + gray)
    
    // Các điểm kiểm soát
    circle(p0, radius: 2.5pt, fill: rgb("#0F172A"))
    circle(p1, radius: 2.5pt, fill: rgb("#0F172A"))
    circle(p2, radius: 2.5pt, fill: rgb("#0F172A"))
    
    content((p0.at(0) - 0.3, p0.at(1) - 0.3), $P_0$)
    content((p1.at(0) - 0.3, p1.at(1) + 0.3), $P_1$)
    content((p2.at(0) + 0.3, p2.at(1) - 0.3), $P_2$)
    
    // Tại t = 0.4
    let t = 0.4
    let q0 = (p0.at(0)*(1-t) + p1.at(0)*t, p0.at(1)*(1-t) + p1.at(1)*t)
    let q1 = (p1.at(0)*(1-t) + p2.at(0)*t, p1.at(1)*(1-t) + p2.at(1)*t)
    
    // Đoạn nối trung gian
    line(q0, q1, stroke: 0.8pt + rgb("#BE123C"))
    circle(q0, radius: 2pt, fill: rgb("#BE123C"))
    circle(q1, radius: 2pt, fill: rgb("#BE123C"))
    content((q0.at(0) - 0.3, q0.at(1) + 0.2), $Q_0$)
    content((q1.at(0) + 0.3, q1.at(1) + 0.2), $Q_1$)
    
    // Điểm Bézier cuối cùng
    let b = (q0.at(0)*(1-t) + q1.at(0)*t, q0.at(1)*(1-t) + q1.at(1)*t)
    circle(b, radius: 3pt, fill: rgb("#0284C7"))
    content((b.at(0), b.at(1) - 0.3), $B(t)$)
    
    // Vẽ toàn bộ đường cong Bézier
    let steps = 40
    let bezier-pts = ()
    for i in range(0, steps + 1) {
      let curr-t = i / steps
      let omt = 1 - curr-t
      let x = omt*omt * p0.at(0) + 2*curr-t*omt * p1.at(0) + curr-t*curr-t * p2.at(0)
      let y = omt*omt * p0.at(1) + 2*curr-t*omt * p1.at(1) + curr-t*curr-t * p2.at(1)
      bezier-pts.push((x, y))
    }
    for i in range(0, steps) {
      line(bezier-pts.at(i), bezier-pts.at(i+1), stroke: 1.5pt + rgb("#0284C7"))
    }
  })
  #v(0.4em)
  #text(size: 8.5pt, fill: rgb("#64748B"), style: "italic")[Thuật toán de Casteljau kiến tạo đường cong Bézier bậc 2 thông qua các bước chia đoạn thẳng tỉ lệ]
]

Cơ chế này áp dụng tương tự cho bậc 3 và mọi bậc cao hơn. Thuật toán này cực kỳ dễ lập trình trên máy tính bằng các vòng lặp tuyến tính đơn giản, không cần tính toán lũy thừa phức tạp.

== 6. Các Ví Dụ Áp Dụng Chi Tiết (Giải từng bước chuẩn phổ thông)

#vd-box("Ví dụ 1", "Viết phương trình tiếp tuyến của đường cong phi tuyến")[
  Cho chất điểm chuyển động dọc theo đường cong tham số $C$ có phương trình:
  $ vec(r)(t) = (t^3 - t, e^(2t), cos t) $
  Hãy viết phương trình tham số của đường thẳng tiếp tuyến của $C$ tại thời điểm $t = 0$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tìm tọa độ điểm tiếp xúc $M_0$ tại thời điểm $t = 0$:
    $ x(0) = 0^3 - 0 = 0 $
    $ y(0) = e^(2 dot 0) = e^0 = 1 $
    $ z(0) = cos 0 = 1 $
    Suy ra điểm tiếp xúc là $M_0(0, 1, 1)$.
  - *Bước 2:* Tính đạo hàm riêng biệt từng thành phần tọa độ theo $t$:
    $ x'(t) = 3t^2 - 1 $
    $ y'(t) = 2e^(2t) $
    $ z'(t) = -sin t $
    Như vậy vectơ đạo hàm (vectơ vận tốc) là:
    $ vec(r)'(t) = (3t^2 - 1, 2e^(2t), -sin t) $
  - *Bước 3:* Thế $t = 0$ vào để tìm vectơ chỉ phương của tiếp tuyến:
    $ vec(u) = vec(r)'(0) = (3(0)^2 - 1, 2e^0, -sin 0) = (-1, 2, 0) $
  - *Bước 4:* Viết phương trình tham số của đường thẳng tiếp tuyến đi qua $M_0(0, 1, 1)$ có vectơ chỉ phương $vec(u) = (-1, 2, 0)$:
    $ cases(
      x = -s,
      y = 1 + 2s,
      z = 1
    ) quad (s in RR) $
]

#vd-box("Ví dụ 2", "Tính độ dài thực tế của lò xo xoắn ốc")[
  Một con kiến bò dọc theo một cọng kẽm có hình dạng đường xoắn ốc Helix có phương trình tham số:
  $ vec(r)(t) = (3 cos t, 3 sin t, 4 t) quad (t in [0, 2 pi]) $
  (Đơn vị đo độ dài là cm). Tính quãng đường thực tế con kiến đã bò được khi tham số $t$ đi hết một vòng từ $0$ đến $2 pi$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tính vectơ đạo hàm $vec(r)'(t)$:
    $ vec(r)'(t) = (-3 sin t, 3 cos t, 4) $
  - *Bước 2:* Tính tốc độ di chuyển $v(t) = |vec(r)'(t)|$:
    $ v(t) = sqrt((-3 sin t)^2 + (3 cos t)^2 + 4^2) = sqrt(9(sin^2 t + cos^2 t) + 16) $
    Vì $sin^2 t + cos^2 t = 1$ nên ta được:
    $ v(t) = sqrt(9 + 16) = sqrt(25) = 5 quad "(cm/s)" $
    Tốc độ di chuyển của con kiến là hằng số và bằng 5 cm/s.
  - *Bước 3:* Áp dụng công thức tính độ dài cung bằng tích phân:
    $ L = integral_0^(2 pi) |vec(r)'(t)| d t = integral_0^(2 pi) 5 d t = [5t]_0^(2 pi) = 10 pi approx 31.42 quad "(cm)" $
  - *Kết luận:* Con kiến đã bò được một quãng đường bằng $10 pi$ cm (khoảng 31.42 cm).
]

#vd-box("Ví dụ 3", "Bài toán quỹ đạo hạt điện tích trong từ trường")[
  Một electron bay vào vùng từ trường đều theo phương nghiêng góc, chuyển động của nó tuân theo phương trình tham số:
  $ vec(r)(t) = (2 cos(100 t), 2 sin(100 t), 10 t) $
  Trong đó $t$ là thời gian tính bằng giây, tọa độ tính bằng milimét (mm).
  1. Xác định vận tốc tức thời và tốc độ của electron tại thời điểm $t$.
  2. Tính quãng đường electron đi được sau $0.1$ giây.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:* 
    - Đạo hàm vectơ tọa độ theo thời gian $t$ để tìm vận tốc:
      $ vec(v)(t) = vec(r)'(t) = (-200 sin(100 t), 200 cos(100 t), 10) quad "(mm/s)" $
    - Độ lớn vận tốc (tốc độ):
      $ v = |vec(v)(t)| = sqrt((-200 sin(100t))^2 + (200 cos(100t))^2 + 10^2) = sqrt(40000 + 100) = sqrt(40100) approx 200.25 quad "(mm/s)" $
  - *Câu 2:* 
    - Vì tốc độ $v approx 200.25$ mm/s là hằng số, quãng đường đi được sau thời gian $T = 0.1$ giây là:
      $ s = integral_0^(0.1) |vec(v)(t)| d t = sqrt(40100) dot 0.1 approx 20.035 quad "(mm)" $
]

#vd-box("Ví dụ 4", "Thiết lập phương trình Bézier kết nối trơn hai đường đi")[
  Trong thiết kế đồ họa, người ta muốn vẽ một đường cong Bézier bậc 2 nối từ điểm đầu $A(0,0,0)$ đến điểm cuối $B(4,2,0)$. Để đường cong này xuất phát theo hướng của vectơ $vec(u) = (2, 4, 0)$, hãy xác định tọa độ điểm kiểm soát trung gian $vec(P)_1$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Đường cong Bézier bậc 2 có 3 điểm kiểm soát: $vec(P)_0, vec(P)_1, vec(P)_2$.
    - Theo đề bài, điểm đầu là $A$ nên $vec(P)_0 = A(0,0,0)$.
    - Điểm cuối là $B$ nên $vec(P)_2 = B(4,2,0)$.
  - *Bước 2:* Đạo hàm của đường cong Bézier bậc 2 tại điểm đầu $t=0$ có công thức là:
    $ vec(B)'(0) = 2(vec(P)_1 - vec(P)_0) $
  - *Bước 3:* Để đường cong xuất phát theo hướng của vectơ $vec(u)$, vectơ tiếp tuyến $vec(B)'(0)$ phải cùng hướng với $vec(u)$. Giả sử có một số thực dương $k$ sao cho:
    $ vec(B)'(0) = k vec(u) => 2(vec(P)_1 - (0,0,0)) = k (2, 4, 0) => vec(P)_1 = (k, 2k, 0) $
  - *Bước 4:* Chọn giá trị $k$ tương ứng với tốc độ vẽ ban đầu mong muốn. Ví dụ chọn $k=1$, ta thu được tọa độ của điểm kiểm soát trung gian cần thiết là $vec(P)_1(1, 2, 0)$.
]

#vd-box("Ví dụ 5", "Tính độ cong của đường parabol trong không gian")[
  Tìm độ cong $kappa$ của đường cong $C$ tại điểm đỉnh $O(0,0,0)$, biết phương trình tham số của nó là:
  $ vec(r)(t) = (t, t^2, 0) $
  (Đây là một đường Parabol $y = x^2$ nằm trong mặt phẳng $O x y$).
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tính đạo hàm cấp một và đạo hàm cấp hai của vectơ vị trí:
    $ vec(r)'(t) = (1, 2t, 0) $
    $ vec(r)''(t) = (0, 2, 0) $
  - *Bước 2:* Tính tích có hướng $vec(r)'(t) times vec(r)''(t)$:
    $ vec(r)'(t) times vec(r)''(t) = det mat(vec(i), vec(j), vec(k); 1, 2t, 0; 0, 2, 0) = (0, 0, 2) $
    Độ lớn tích có hướng này bằng:
    $ |vec(r)'(t) times vec(r)''(t)| = sqrt(0^2 + 0^2 + 2^2) = 2 $
  - *Bước 3:* Tính độ lớn của đạo hàm bậc một:
    $ |vec(r)'(t)| = sqrt(1^2 + (2t)^2 + 0^2) = sqrt(1 + 4t^2) $
  - *Bước 4:* Áp dụng công thức tính độ cong $kappa(t)$:
    $ kappa(t) = (|vec(r)'(t) times vec(r)''(t)|) / (|vec(r)'(t)|^3) = 2 / ((1 + 4t^2)^(3/2)) $
  - *Bước 5:* Tại điểm đỉnh $O(0,0,0)$, ứng với tham số $t = 0$:
    $ kappa(0) = 2 / ((1 + 4(0)^2)^(3/2)) = 2 / 1 = 2 $
  - *Nhận xét:* Khi đi xa đỉnh Parabol ($t -> +- oo$), độ cong $kappa(t) -> 0$, nghĩa là Parabol ngày càng thẳng ra, cua càng ngày càng rộng. Tại đỉnh $t=0$, cua là gấp nhất nên độ cong đạt giá trị lớn nhất bằng 2.
]

#vd-box("Ví dụ 6", "Bài toán bo tròn góc trong cơ khí CNC")[
  Một máy cắt laser cần di chuyển để cắt một góc vuông từ cạnh thẳng dọc trục $x$ sang cạnh thẳng dọc trục $y$. Kỹ sư bo tròn góc này bằng một cung tròn có bán kính $R = 10$ mm, được tham số hóa từ góc $theta = 0$ đến $theta = pi/2$:
  $ vec(r)(theta) = (10 - 10 sin theta, 10 - 10 cos theta, 0) $
  Hãy kiểm tra xem tại điểm kết nối góc thẳng ban đầu (khi $theta = 0$, tương ứng với đường thẳng đi vào song song trục $x$), hướng đi có trùng khớp trơn tru không.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Xét hướng đi của đường thẳng ban đầu đi vào song song với trục $x$: Vectơ chỉ phương của nó là $vec(i) = (1, 0, 0)$.
  - *Bước 2:* Tính đạo hàm của cung tròn bo góc theo tham số $theta$:
    $ vec(r)'(theta) = (-10 cos theta, 10 sin theta, 0) $
  - *Bước 3:* Tại điểm bắt đầu cung bo tròn ($theta = 0$):
    $ vec(r)'(0) = (-10 cos 0, 10 sin 0, 0) = (-10, 0, 0) $
  - *Bước 4:* Vectơ vận tốc này hướng ngược chiều trục $x$ (do máy di chuyển lùi từ phải qua trái). Hướng của nó hoàn toàn trùng khớp (song song) với hướng trục $x$, đảm bảo không có sự bẻ góc đột ngột tại điểm nối tiếp! Đường cắt sẽ cực kỳ mượt mà.
]

#vd-box("Ví dụ 7", "Tính độ dài sợi chỉ cong (Cung bậc 3/2)")[
  Một đoạn dây trang trí nghệ thuật trong không gian 3D được tham số hóa bởi phương trình:
  $ vec(r)(t) = (t, 2/3 t^(3/2), 0) quad (t in [0, 3]) $
  Tính độ dài thực tế của đoạn dây này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Tính đạo hàm của vectơ vị trí theo tham số $t$:
    $ vec(r)'(t) = (1, 2/3 dot 3/2 t^(1/2), 0) = (1, t^(1/2), 0) $
  - *Bước 2:* Tính tốc độ di chuyển $v(t) = |vec(r)'(t)|$:
    $ v(t) = sqrt(1^2 + (t^(1/2))^2 + 0^2) = sqrt(1 + t) $
  - *Bước 3:* Áp dụng công thức tính độ dài cung:
    $ L = integral_0^3 |vec(r)'(t)| d t = integral_0^3 sqrt(1 + t) d t $
    Để tính tích phân này, ta dùng công thức nguyên hàm cơ bản:
    $ L = [ 2/3 (1 + t)^(3/2) ]_0^3 = 2/3 (1 + 3)^(3/2) - 2/3 (1 + 0)^(3/2) $
    $ L = 2/3 (4)^(3/2) - 2/3 (1)^(3/2) = 2/3 (8) - 2/3 (1) = 16/3 - 2/3 = 14/3 approx 4.67 quad "(đơn vị độ dài)" $
  - *Kết luận:* Độ dài của đoạn dây là $14/3$ đơn vị độ dài (khoảng 4.67).
]

#vd-box("Ví dụ 8", "Thiết kế đường nối lượn mượt tránh lực giật ly tâm")[
  Một đoạn đường sắt đang chạy thẳng dọc trục $x$ (phương trình $y = 0$, từ trục âm đi về gốc $O(0,0)$). Để tránh một quả đồi phía trước, các kỹ sư muốn uốn cong đường sắt này bắt đầu từ điểm $O(0,0)$ đi vào một đường cong chuyển tiếp kết nối trơn tru với một cung tròn có bán kính $R = 100$ m. 
  Đường cong chuyển tiếp được thiết kế dạng parabol bậc ba tham số hóa theo trục hoành độ:
  $ vec(r)(x) = (x, k x^3, 0) quad (x >= 0) $
  1. Tính độ cong $kappa(x)$ của đường cong chuyển tiếp này tại điểm $x$ bất kỳ.
  2. Để độ cong tại điểm bắt đầu gốc tọa độ $O(0,0)$ bằng $0$ (khớp với đường thẳng chạy vào) và tăng dần đều, đồng thời tại điểm cuối cách gốc tọa độ $x = 10$ m, độ cong đạt đúng giá trị $kappa = 1/200$ $m^(-1)$ để nối vào cung tròn tiếp theo, hãy xác định hệ số thiết kế $k$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:*
    - Xem $x$ là tham số chạy. Tính đạo hàm cấp một và cấp hai của vectơ vị trí:
      $ vec(r)'(x) = (1, 3k x^2, 0) $
      $ vec(r)''(x) = (0, 6k x, 0) $
    - Tính tích có hướng của đạo hàm bậc một và hai:
      $ vec(r)'(x) times vec(r)''(x) = det mat(vec(i), vec(j), vec(k); 1, 3k x^2, 0; 0, 6k x, 0) = (0, 0, 6k x) $
      Độ lớn tích có hướng này là:
      $ |vec(r)'(x) times vec(r)''(x)| = sqrt((6k x)^2) = 6|k|x quad ("với " x >= 0) $
    - Tính tốc độ di chuyển theo tham số $x$:
      $ |vec(r)'(x)| = sqrt(1^2 + (3k x^2)^2 + 0) = sqrt(1 + 9k^2 x^4) $
    - Áp dụng công thức tính độ cong $kappa(x)$:
      $ kappa(x) = (6|k|x) / ((1 + 9k^2 x^4)^(3/2)) $
  - *Câu 2:*
    - Tại gốc tọa độ $x=0$, ta có $kappa(0) = (6|k| dot 0) / 1^(3/2) = 0$. Điều này khớp hoàn hảo với đoạn đường thẳng có độ cong bằng 0 đi vào gốc tọa độ.
    - Tại điểm cuối của đoạn chuyển tiếp $x = 10$, ta mong muốn độ cong là $1/200$. Thế $x = 10$ vào công thức độ cong:
      $ kappa(10) = (60|k|) / ((1 + 90000 k^2)^(3/2)) = 1/200 $
    - Vì độ cong khúc cua thường rất nhỏ và hệ số $k$ rất bé ($90000 k^2 approx 0$), ta có thể xấp xỉ mẫu số bằng $1$. Khi đó:
      $ 60|k| approx 1/200 => |k| approx 1/12000 $
    - Chọn hệ số dương $k = 1/12000$, ta có phương trình thiết kế tối ưu cho đoạn cua xe chạy êm ái:
      $ y = x^3 / 12000 $
]
