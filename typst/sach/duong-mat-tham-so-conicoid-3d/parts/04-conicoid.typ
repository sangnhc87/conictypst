#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

= CHƯƠNG III — CÁC MẶT BẬC HAI (CONICOIDS) TRONG 3D

== 1. Khái Niệm Tổng Quan và Sự Tương Đồng Với Conic Phẳng

Trong hình học phẳng, chúng ta đã rất quen thuộc với các đường *Conic* (đường elip, hypebol, parabol) – là các đường cong bậc hai đối với hai biến $x, y$. 

Khi bước vào không gian 3D, các bề mặt được mô tả bởi các phương trình đa thức bậc hai đối với ba biến số $x, y, z$ được gọi là các mặt *Conicoids* (hay các mặt bậc hai - Quadrics). Phương trình tổng quát của chúng có dạng:
$ A x^2 + B y^2 + C z^2 + 2 D x y + 2 E y z + 2 F z x + 2 G x + 2 H y + 2 I z + J = 0 $

Thông qua các phép biến đổi xoay trục và tịnh tiến hệ tọa độ Oxyz (để triệt tiêu các số hạng chéo như $x y, y z, z x$), ta luôn có thể đưa mọi mặt bậc hai không suy biến về các dạng chính tắc. Chúng ta sẽ cùng xây dựng một "Từ điển các mặt bậc hai 3D" để nắm vững cấu trúc của chúng.

== 2. Từ Điển Các Mặt Bậc Hai 3D Chính Tắc

=== A. Mặt Ellipsoid – Khối Quả Bóng Bầu Dục

Mặt Ellipsoid là phiên bản 3D của đường elip phẳng, thu được bằng cách co dãn mặt cầu theo ba trục tọa độ với các bán trục $a, b, c$ khác nhau.

- *Phương trình chính tắc:*
  $ x^2/a^2 + y^2/b^2 + z^2/c^2 = 1 $
- *Phương trình tham số hóa:*
  $ cases(
    x = a sin u cos v,
    y = b sin u sin v,
    z = c cos u
  ) quad (u in [0, pi], v in [0, 2 pi]) $
- *Ý nghĩa hình học của tham số:* Tham số $u$ hoạt động giống vĩ độ (quét từ cực Bắc $u=0$ xuống cực Nam $u=pi$), còn tham số $v$ hoạt động giống kinh độ (quét một vòng tròn quanh xích đạo).
- *Ứng dụng thực tế:*
  1. *GPS Toàn cầu:* Mô hình chuẩn GPS toàn cầu (WGS-84) sử dụng một mặt Ellipsoid xoay có bán trục xích đạo $a = b approx 6378.137$ km, và bán trục cực $c approx 6356.752$ km.
  2. *Hành lang thì thầm (Whispering Gallery):* Nếu bạn đứng ở một tiêu điểm của phòng có trần hình ellipsoid và thì thầm, âm thanh sẽ phản xạ qua trần hội tụ chính xác vào tai một người đứng ở tiêu điểm đối diện, dù khoảng cách rất xa.

=== B. Hyperboloid Một Tầng – Mặt Cong Dệt Từ Những Thanh Thẳng

Hyperboloid một tầng là một bề mặt kỳ lạ: dù bề mặt của nó hoàn toàn cong lõm hướng vào trong, nhưng nó lại chứa hai họ đường thẳng nằm trọn vẹn 100% bên trên mặt cong đó (được gọi là *Mặt kẻ - Ruled Surface*).

- *Phương trình chính tắc:*
  $ x^2/a^2 + y^2/b^2 - z^2/c^2 = 1 $
- *Phương trình tham số hóa (Trực giao lượng giác):*
  $ cases(
    x = a cosh u cos v,
    y = b cosh u sin v,
    z = c sinh u
  ) quad (u in RR, v in [0, 2 pi]) $
- *Phương trình tham số hóa dạng đường sinh (Mặt kẻ):*
  $ cases(
    x = a (cos v +- u sin v),
    y = b (sin v -+ u cos v),
    z = +- c u
  ) quad (u in RR, v in [0, 2 pi]) $
  Công thức này chỉ ra rằng, với mỗi góc $v$ cố định, khi ta cho $u$ chạy tự do, ta đang vẽ một đường thẳng. Toàn bộ bề mặt được dệt nên từ việc xoay các đường thẳng chéo nhau này quanh trục.
- *Ứng dụng thực tế:* Canton Tower (tháp truyền hình Quảng Châu) hay tháp giải nhiệt khổng lồ của các nhà máy điện hạt nhân được xây dựng dựa trên mặt này. Người ta dựng các thanh thép thẳng tắp đan chéo nhau để dệt nên tháp cong chịu gió siêu tốt, tiết kiệm chi phí đúc cốt pha cong.

#align(center)[
  #canvas(length: 1.0cm, {
    import draw: *
    let sx = -0.45
    let sy = -0.3
    let proj(x, y, z) = (x + y * sx, z + y * sy)
    
    let a = 1.2
    let c = 1.5
    let z-bottom = -2.0
    let z-top = 2.0
    let r-top = a * calc.sqrt(1 + (z-top*z-top)/(c*c))
    
    // Vẽ vành trên và đáy dưới
    for angle in range(0, 36) {
      let t1 = angle * 10 * 3.14159 / 180
      let t2 = (angle + 1) * 10 * 3.14159 / 180
      line(proj(r-top * calc.cos(t1), r-top * calc.sin(t1), z-top), proj(r-top * calc.cos(t2), r-top * calc.sin(t2), z-top), stroke: 0.8pt + gray)
      line(proj(r-top * calc.cos(t1), r-top * calc.sin(t1), z-bottom), proj(r-top * calc.cos(t2), r-top * calc.sin(t2), z-bottom), stroke: 0.8pt + gray)
    }
    
    // Vẽ các đường thẳng sinh
    let num-lines = 12
    for i in range(0, num-lines) {
      let v = i * (2 * 3.14159) / num-lines
      
      // Đường thẳng sinh họ 1 (+)
      let p1_x = a * (calc.cos(v) - 1.5 * calc.sin(v))
      let p1_y = a * (calc.sin(v) + 1.5 * calc.cos(v))
      let p1_z = c * 1.5
      
      let p2_x = a * (calc.cos(v) + 1.5 * calc.sin(v))
      let p2_y = a * (calc.sin(v) - 1.5 * calc.cos(v))
      let p2_z = -c * 1.5
      
      line(proj(p1_x, p1_y, p1_z), proj(p2_x, p2_y, p2_z), stroke: 0.7pt + rgb("#0284C7"))
    }
    content(proj(0, 0, z-top + 0.4), text(size: 8pt, style: "italic")[Mặt kẻ Hyperboloid một tầng cấu trúc từ các thanh thẳng])
  })
]

=== C. Hyperboloid Hai Tầng – Hai Bát Úp Đối Nhau

Khác với hyperboloid một tầng liền mạch, hyperboloid hai tầng bị chia đôi thành hai mảnh độc lập cách nhau một khoảng trống.

- *Phương trình chính tắc:*
  $ x^2/a^2 + y^2/b^2 - z^2/c^2 = -1 $
- *Phương trình tham số hóa:*
  $ cases(
    x = a sinh u cos v,
    y = b sinh u sin v,
    z = +- c cosh u
  ) quad (u >= 0, v in [0, 2 pi]) $
  Dấu $+$ ứng với nhánh trên ($z >= c$), dấu $-$ ứng với nhánh dưới ($z <= -c$).
- *Ứng dụng thực tế:* Được ứng dụng làm gương phụ (sub-reflector) trong hệ thống kính thiên văn phản xạ hoặc anten Cassegrain để hội tụ sóng phản xạ từ gương parabol chính về đầu thu.

=== D. Paraboloid Elliptic – Hình Chảo Ăng-ten

Đây là mặt cong xoay có dạng hình chiếc chảo tròn hoặc elip. Tất cả các mặt cắt song song với trục đứng đều là các đường parabol.

- *Phương trình chính tắc:*
  $ z/c = x^2/a^2 + y^2/b^2 $
- *Phương trình tham số hóa:*
  $ cases(
    x = a u cos v,
    y = b u sin v,
    z = c u^2
  ) quad (u >= 0, v in [0, 2 pi]) $
- *Ứng dụng thực tế:* 
  1. *Chảo vệ tinh:* Mọi tia sáng hay sóng điện từ đi song song với trục đối xứng khi chiếu vào lòng chảo paraboloid đều sẽ phản xạ hội tụ về đúng một điểm gọi là tiêu điểm.
  2. *Đèn pha ô tô:* Đặt bóng đèn phát sáng tại tiêu điểm, ánh sáng sẽ phản xạ tạo thành luồng sáng thẳng tắp song song chiếu xa.

=== E. Paraboloid Hyperbolic (Mặt Yên Ngựa) – Thiết Kế Độc Đáo

Mặt yên ngựa là một trong những mặt cong kỳ diệu nhất. Nó vừa có tính chất của Paraboloid, vừa là một *Mặt kẻ (Ruled Surface)* chứa hai họ đường thẳng đan chéo nhau!

- *Phương trình chính tắc:*
  $ z/c = x^2/a^2 - y^2/b^2 $
- *Phương trình tham số hóa (Dạng yên ngựa thông thường):*
  $ cases(
    x = a u,
    y = b v,
    z = c (u^2 - v^2)
  ) quad (u, v in RR) $
- *Phương trình tham số hóa dạng đường sinh (Mặt kẻ):*
  $ cases(
    x = a (u + v) / 2,
    y = b (u - v) / 2,
    z = c u v
  ) quad (u, v in RR) $
  Với mỗi tham số $v$ cố định, ta có một đường thẳng theo biến $u$. Điều này chứng tỏ mặt yên ngựa có thể dệt nên từ những đường thẳng thẳng tắp!
- *Đặc tính chịu lực & Ứng dụng:* 
  - *Khoai tây chiên Pringles:* Hình dáng cong của miếng khoai tây chiên chính là mặt yên ngựa giúp nó chịu được lực nén khi xếp chồng trong hộp giấy, tránh bị vỡ vụn.
  - *Mái nhà yên ngựa (Saddle roofs):* Cắt mặt yên ngựa bằng các mặt phẳng đứng song song, ta thu được các parabol hướng lõm lên (như dây võng) và parabol hướng lõm xuống (như mái vòm). Sự triệt tiêu ứng suất nén và kéo giúp các kỹ sư xây dựng những mái vòm bê tông mỏng nhẹ nhưng cực kỳ vững chắc (như mái sân vận động Munich).

== 3. Chứng Minh Đại Số: Mặt Yên Ngựa Là Mặt Kẻ

Hãy chứng minh bằng toán học phổ thông rằng mặt Paraboloid Hyperbolic chứa các đường thẳng.

#vd-box("Chứng minh", "Chứng minh mặt yên ngựa chứa hai họ đường thẳng sinh")[
  Chứng minh rằng mặt yên ngựa $(S): z = x^2/a^2 - y^2/b^2$ chứa hai họ đường thẳng nằm trọn vẹn trên bề mặt cong đó.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Biến đổi vế phải của phương trình mặt $(S)$ thành tích nhờ hằng đẳng thức hiệu hai bình phương:
    $ z = (x/a - y/b)(x/a + y/b) $
  - *Bước 2:* Đưa ra hai tham số tỉ lệ $u$ và $v$ (không đồng thời bằng 0):
    - *Họ đường thẳng thứ nhất $(L_1)$:*
      $ cases(
        x/a - y/b = u,
        u(x/a + y/b) = z
      ) $
    - *Họ đường thẳng thứ hai $(L_2)$:*
      $ cases(
        x/a + y/b = v,
        v(x/a - y/b) = z
      ) $
  - *Bước 3: Kiểm tra tính thuộc bề mặt.*
    Với mỗi giá trị tham số $u$ cụ thể, hệ phương trình $(L_1)$ là giao tuyến của hai mặt phẳng bậc nhất, do đó nó xác định một đường thẳng trong không gian.
    Nhân vế theo vế hai phương trình của hệ $(L_1)$:
    $ u (x/a - y/b)(x/a + y/b) = u z $
    Chia cả hai vế cho tham số $u$ (với điều kiện $u != 0$), ta thu được:
    $ (x/a - y/b)(x/a + y/b) = z  <=>  x^2/a^2 - y^2/b^2 = z $
    Phương trình này trùng khớp hoàn toàn với phương trình mặt $(S)$.
    Vậy mọi điểm nằm trên đường thẳng $(L_1)$ đều thỏa mãn phương trình mặt $(S)$. Đường thẳng $(L_1)$ nằm trọn vẹn trên mặt yên ngựa. Việc chứng minh cho họ $(L_2)$ hoàn toàn tương tự.
]

== 4. Các Ví Dụ Áp Dụng Chi Tiết (Giải từng bước chuẩn phổ thông)

#vd-box("Ví dụ 1", "Tính góc giữa hai đường thẳng sinh trên mặt thắt eo")[
  Cho mặt Hyperboloid một tầng chính tắc có phương trình:
  $ (S): x^2/1 + y^2/1 - z^2/1 = 1 $
  Tại điểm $A(1, 1, 1)$ thuộc bề mặt $(S)$, hãy tìm phương trình của hai đường thẳng sinh $d_1$ và $d_2$ đi qua $A$ và tính góc giữa chúng.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Viết phương trình tìm họ đường thẳng sinh.*
    Biến đổi phương trình của $(S)$ về dạng tích:
    $ (x - z)(x + z) = (1 - y)(1 + y) $
    Họ đường sinh $(L_1)$ có dạng:
    $ cases(
      lambda (x - z) = mu (1 - y) quad (1),
      mu (x + z) = lambda (1 + y) quad (2)
    ) $
  - *Bước 2: Thế điểm $A(1, 1, 1)$ vào để tìm cặp tỉ lệ $(lambda : mu)$.*
    Thế tọa độ của $A$ vào (1) và (2):
    $ cases(
      lambda (1 - 1) = mu (1 - 1)  =>  lambda dot 0 = mu dot 0,
      mu (1 + 1) = lambda (1 + 1)  =>  2 mu = 2 lambda  =>  lambda = mu
    ) $
    Chọn $lambda = mu = 1$, ta có phương trình đường thẳng sinh $d_1$:
    $ d_1: cases(
      x - z = 1 - y,
      x + z = 1 + y
    )  =>  d_1: cases(
      x + y - z = 1,
      x - y + z = 1
    ) $
    Giải hệ bằng cách đặt $z = t$:
    - Cộng hai phương trình: $2x = 2  =>  x = 1$.
    - Thế vào: $y = z = t$.
    Vậy đường thẳng sinh thứ nhất có phương trình tham số:
    $ d_1: cases(
      x = 1,
      y = t,
      z = t
    ) quad (t in RR) $
  - *Bước 3: Lập họ đường sinh $(L_2)$:*
    $ cases(
      lambda (x - z) = mu (1 + y) quad (3),
      mu (x + z) = lambda (1 - y) quad (4)
    ) $
    Thế điểm $A(1, 1, 1)$ vào:
    $ cases(
      lambda (1 - 1) = mu (1 + 1)  =>  0 = 2 mu  =>  mu = 0,
      0 dot (1 + 1) = lambda (1 - 1)  =>  0 = 0
    ) $
    Vì $mu = 0$, ta chọn $lambda = 1$. Hệ phương trình đường thẳng $d_2$ là:
    $ d_2: cases(
      x - z = 0,
      1 - y = 0
    )  =>  d_2: cases(
      x = z,
      y = 1
    ) $
    Đặt $z = t$, ta có phương trình tham số của $d_2$:
    $ d_2: cases(
      x = t,
      y = 1,
      z = t
    ) quad (t in RR) $
  - *Bước 4: Tính góc giữa $d_1$ và $d_2$.*
    - Vectơ chỉ phương của $d_1$ là $vec(u)_1 = (0, 1, 1)$.
    - Vectơ chỉ phương của $d_2$ là $vec(u)_2 = (1, 0, 1)$.
    Áp dụng công thức tính góc giữa hai đường thẳng của lớp 12:
    $ cos phi = (|vec(u)_1 dot vec(u)_2|) / (|vec(u)_1| dot |vec(u)_2|) = (|0 dot 1 + 1 dot 0 + 1 dot 1|) / (sqrt(0^2+1^2+1^2) dot sqrt(1^2+0^2+1^2)) = 1 / (sqrt(2) dot sqrt(2)) = 1/2 $
    Suy ra góc giữa hai đường thẳng sinh tại điểm $A(1,1,1)$ là $phi = 60^degree$.
]

#vd-box("Ví dụ 2", "Bài toán thiết diện phẳng cắt mặt ellipsoid")[
  Cho mặt Ellipsoid có phương trình:
  $ (E): x^2 / 9 + y^2 / 4 + z^2 / 1 = 1 $
  Hãy tìm hình dạng và kích thước của thiết diện thu được khi cắt mặt $(E)$ bởi mặt phẳng nằm ngang $(P): z = 1/2$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Thế phương trình thiết diện $z = 1/2$ vào phương trình của mặt $(E)$:
    $ x^2 / 9 + y^2 / 4 + (1/2)^2 / 1 = 1 => x^2 / 9 + y^2 / 4 + 1 / 4 = 1 $
  - *Bước 2:* Rút gọn phương trình đại số:
    $ x^2 / 9 + y^2 / 4 = 3 / 4 $
  - *Bước 3:* Chia cả hai vế cho $3/4$ để đưa về phương trình elip chính tắc:
    $ x^2 / (27/4) + y^2 / (3) = 1 $
  - *Kết luận:* Thiết diện cắt bởi mặt phẳng $z = 1/2$ là một đường Elip nằm trong mặt phẳng song song với $O x y$, có các bán trục là:
    $ a' = sqrt(27/4) = (3 sqrt(3)) / 2, quad b' = sqrt(3) $
]

#vd-box("Ví dụ 3", "Tìm giao tuyến của paraboloid hyperbolic và mặt phẳng thẳng đứng")[
  Cho mặt yên ngựa có phương trình:
  $ (S): z = x^2 - y^2 $
  Hãy tìm phương trình giao tuyến của mặt $(S)$ với mặt phẳng đứng $y = 2$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Thế $y = 2$ vào phương trình mặt yên ngựa:
    $ z = x^2 - 2^2 => z = x^2 - 4 $
  - *Bước 2:* Viết hệ phương trình xác định giao tuyến:
    $ cases(z = x^2 - 4, y = 2) $
  - *Kết luận:* Giao tuyến là một đường Parabol nằm trong mặt phẳng đứng $y = 2$, có đỉnh tại điểm $I(0, 2, -4)$ và có bề lõm hướng lên trên.
]

#vd-box("Ví dụ 4", "Tìm giao tuyến xiên của mặt trụ đứng với mặt phẳng nghiêng")[
  Cho mặt trụ tròn xoay đứng có phương trình:
  $ (C): x^2 + y^2 = 9 $
  và mặt phẳng nghiêng cắt qua nó có phương trình:
  $ (P): z = x + y + 5 $
  Tìm phương trình tham số hóa của đường giao tuyến (thiết diện) thu được và xác định hình dạng của nó.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Chọn cách tham số hóa.*
    Hình chiếu của đường giao tuyến xuống mặt phẳng đáy $O x y$ chính là hình tròn đáy của hình trụ có phương trình $x^2 + y^2 = 9$.
    Ta tham số hóa hình tròn đáy này bằng lượng giác:
    $ cases(x = 3 cos t, y = 3 sin t) quad (t in [0, 2 pi]) $
  - *Bước 2: Thế vào phương trình mặt phẳng nghiêng để tìm cao độ $z$ theo $t$:*
    $ z = x + y + 5 = 3 cos t + 3 sin t + 5 $
  - *Bước 3: Viết phương trình tham số của giao tuyến:*
    $ vec(r)(t) = (3 cos t, 3 sin t, 3 cos t + 3 sin t + 5) quad (t in [0, 2 pi]) $
  - *Kết luận:* Giao tuyến thu được là một đường cong kín khép vòng. Vì mặt phẳng $(P)$ cắt xiên qua toàn bộ các đường sinh của mặt trụ đứng, thiết diện thu được chắc chắn là một đường Elip nghiêng trong không gian 3D.
]

#vd-box("Ví dụ 5", "Tính khoảng cách cực trị từ ellipsoid đến tâm")[
  Cho mặt Ellipsoid $(E): x^2 + 4y^2 + 9z^2 = 36$. Hãy tìm các điểm thuộc mặt $(E)$ có khoảng cách ngắn nhất và dài nhất đến gốc tọa độ $O(0,0,0)$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Đưa phương trình mặt $(E)$ về dạng chính tắc:
    $ x^2 / 36 + y^2 / 9 + z^2 / 4 = 1 $
    Các bán trục tương ứng là $a = 6, b = 3, c = 2$.
  - *Bước 2:* Khoảng cách từ một điểm $M(x,y,z)$ bất kỳ trên $(E)$ đến gốc tọa độ $O$ là:
    $ d = sqrt(x^2 + y^2 + z^2) $
  - *Bước 3:* Sử dụng điều kiện ràng buộc của mặt $(E)$:
    $ x^2 / 36 + y^2 / 9 + z^2 / 4 = 1 => x^2 = 36 - 4y^2 - 9z^2 $
    Thế vào công thức khoảng cách bình phương:
    $ d^2 = x^2 + y^2 + z^2 = (36 - 4y^2 - 9z^2) + y^2 + z^2 = 36 - 3y^2 - 8z^2 $
  - *Bước 4:* Vì $y^2 >= 0$ và $z^2 >= 0$, ta có:
    $ d^2 = 36 - 3y^2 - 8z^2 <= 36 $
    Đẳng thức xảy ra khi và chỉ khi $y = 0$ và $z = 0$.
    Khi đó thế lại ta có $x^2 = 36 => x = +- 6$.
    Như vậy, khoảng cách lớn nhất từ điểm trên ellipsoid đến tâm là $d_("max") = 6$ tại hai cực xích đạo $M_1(6,0,0)$ và $M_2(-6,0,0)$.
  - *Bước 5: Tìm khoảng cách ngắn nhất.*
    Tương tự, ta rút $z^2$ theo $x^2, y^2$:
    $ z^2 / 4 = 1 - x^2 / 36 - y^2 / 9 => z^2 = 4 - x^2 / 9 - (4 y^2) / 9 $
    Thế vào công thức khoảng cách bình phương:
    $ d^2 = x^2 + y^2 + 4 - x^2 / 9 - (4 y^2) / 9 = 4 + (8 x^2) / 9 + (5 y^2) / 9 $
    Vì $x^2 >= 0$ và $y^2 >= 0$, ta có:
    $ d^2 >= 4 $
    Đẳng thức xảy ra khi và chỉ khi $x = 0$ và $y = 0$.
    Khi đó thế lại ta có $z^2 = 4 => z = +- 2$.
    Như vậy, khoảng cách ngắn nhất từ điểm trên ellipsoid đến tâm là $d_("min") = 2$ tại hai cực của trục nhỏ nhất là $M_3(0,0,2)$ và $M_4(0,0,-2)$.
]

#vd-box("Ví dụ 6", "Xác định phương trình đường thẳng sinh đi qua điểm trên mặt yên ngựa")[
  Cho mặt yên ngựa $(S): z = x^2 - y^2$. Hãy viết phương trình của hai đường thẳng sinh $d_1, d_2$ nằm trọn vẹn trên $(S)$ và đi qua điểm $A(2, 1, 3)$ thuộc bề mặt.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Áp dụng phân tích tích của mặt yên ngựa.*
    $ (x - y)(x + y) = z $
  - *Bước 2: Lập hệ phương trình cho hai họ đường thẳng.*
    - *Họ thứ nhất $(L_1)$:*
      $ cases(x - y = u, u(x + y) = z) $
      Thế tọa độ của $A(2, 1, 3)$ vào phương trình thứ nhất để tìm tham số $u$:
      $ 2 - 1 = u  =>  u = 1 $
      Thế $u = 1$ vào phương trình thứ hai: $1(2 + 1) = 3$ (đúng).
      Vậy đường thẳng sinh thứ nhất $d_1$ là:
      $ d_1: cases(x - y = 1, x + y = z)  =>  d_1: cases(x = y + 1, z = 2y + 1) $
      Đặt $y = t$, ta được phương trình tham số của $d_1$:
      $ d_1: cases(x = 1 + t, y = t, z = 1 + 2t) quad (t in RR) $
    - *Họ thứ hai $(L_2)$:*
      $ cases(x + y = v, v(x - y) = z) $
      Thế tọa độ của $A(2, 1, 3)$ vào để tìm $v$:
      $ 2 + 1 = v  =>  v = 3 $
      Kiểm tra phương trình hai: $3(2 - 1) = 3$ (đúng).
      Vậy đường thẳng sinh thứ hai $d_2$ là:
      $ d_2: cases(x + y = 3, 3(x - y) = z)  =>  d_2: cases(y = 3 - x, z = 3(2x - 3) = 6x - 9) $
      Đặt $x = t$, ta được phương trình tham số của $d_2$:
      $ d_2: cases(x = t, y = 3 - t, z = -9 + 6t) quad (t in RR) $
  - *Kết luận:* Hai đường thẳng sinh đi qua điểm $A(2,1,3)$ nằm trên mặt yên ngựa là $d_1$ và $d_2$.
]

#vd-box("Ví dụ 7", "Tìm giao điểm của đường thẳng và mặt cầu")[
  Cho mặt cầu $(S): x^2 + y^2 + z^2 = 9$ và đường thẳng $d$ có phương trình tham số:
  $ d: cases(x = 1 + t, y = 2 - t, z = t) $
  Xác định tọa độ giao điểm của đường thẳng $d$ và mặt cầu $(S)$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Thế các biểu thức tọa độ của đường thẳng $d$ theo tham số $t$ vào phương trình mặt cầu $(S)$:
    $ (1 + t)^2 + (2 - t)^2 + t^2 = 9 $
  - *Bước 2:* Khai triển và rút gọn phương trình bậc hai đơn biến theo $t$:
    $ (1 + 2t + t^2) + (4 - 4t + t^2) + t^2 = 9 $
    $ 3t^2 - 2t + 5 = 9 => 3t^2 - 2t - 4 = 0 $
  - *Bước 3:* Giải phương trình bậc hai tìm nghiệm $t$:
    $ Delta' = (-1)^2 - 3(-4) = 1 + 12 = 13 $
    $ t_1 = (1 + sqrt(13)) / 3, quad t_2 = (1 - sqrt(13)) / 3 $
  - *Bước 4:* Thế các nghiệm $t$ ngược lại vào phương trình tham số của $d$ để tìm tọa độ giao điểm:
    - Với $t_1 = (1 + sqrt(13))/3$:
      $ x_1 = 1 + t_1 = (4 + sqrt(13))/3, quad y_1 = 2 - t_1 = (5 - sqrt(13))/3, quad z_1 = (1 + sqrt(13))/3 $
    - Với $t_2 = (1 - sqrt(13))/3$:
      $ x_2 = 1 + t_2 = (4 - sqrt(13))/3, quad y_2 = 2 - t_2 = (5 + sqrt(13))/3, quad z_2 = (1 - sqrt(13))/3 $
  - *Kết luận:* Đường thẳng cắt mặt cầu tại hai điểm phân biệt có tọa độ trên.
]

#vd-box("Ví dụ 8", "Lập phương trình mặt phẳng tiếp xúc mặt cầu tại một điểm")[
  Cho mặt cầu $(S): x^2 + y^2 + z^2 - 2x + 4y - 6z - 2 = 0$. Hãy viết phương trình mặt phẳng tiếp diện của mặt cầu $(S)$ tại điểm $M(2, 1, 1)$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Kiểm tra điểm $M$ có thuộc mặt cầu hay không bằng cách thế tọa độ của $M$:
    $ 2^2 + 1^2 + 1^2 - 2(2) + 4(1) - 6(1) - 2 = 4 + 1 + 1 - 4 + 4 - 6 - 2 = 0 $ (luôn đúng).
  - *Bước 2:* Xác định tâm $I$ và bán kính của mặt cầu từ phương trình:
    - Các hệ số trước $x, y, z$ chia cho $-2$:
      $ a = 1, quad b = -2, quad c = 3 => I(1, -2, 3) $
  - *Bước 3:* Mặt phẳng tiếp xúc mặt cầu tại điểm $M$ nhận vectơ đoạn thẳng nối từ tâm đến điểm tiếp xúc $vec(I M)$ làm vectơ pháp tuyến:
    $ vec(n) = vec(I M) = (2 - 1, 1 - (-2), 1 - 3) = (1, 3, -2) $
  - *Bước 4:* Viết phương trình mặt phẳng đi qua $M(2, 1, 1)$ có pháp vectơ $vec(n) = (1, 3, -2)$:
    $ 1(x - 2) + 3(y - 1) - 2(z - 1) = 0 $
    $ x + 3y - 2z - 3 = 0 $
]
