#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

= CHƯƠNG IV — CHIẾN THUẬT TƯ DUY CAO GIẢI TOÁN PHỔ THÔNG NÂNG CAO

Trong các đề thi tuyển sinh Đại học (kỳ thi Tốt nghiệp THPT) và đặc biệt là các kỳ thi Học sinh giỏi các cấp, những bài toán Vận dụng cao (VDC) về hình học giải tích $O x y z$ luôn là nỗi khiếp sợ của nhiều thế hệ học sinh. Đề bài thường yêu cầu tìm giá trị lớn nhất (GTLN), giá trị nhỏ nhất (GTNN) của các biểu thức khoảng cách, góc, thể tích hoặc diện tích thiết diện của các khối hình phẳng xiên cắt qua khối tròn xoay.

Nếu chỉ sử dụng hình học cổ điển thuần túy hoặc biến đổi đại số thông thường, lời giải thường vô cùng dài dòng, đòi hỏi tư duy dựng hình cực kỳ phức tạp và rất dễ rơi vào bẫy sai sót. Tuy nhiên, nếu chúng ta thay đổi góc nhìn – chuyển từ hệ tọa độ tĩnh sang tư duy động của đường và mặt tham số – mọi bài toán VDC phức tạp đều có thể được giải quyết một cách gọn gàng, tuần tự và đẹp mắt. 

Trong chương này, chúng ta sẽ làm quen và làm chủ hai "vũ khí tối tân" để bẻ gãy các bài toán VDC này: *Kỹ thuật lượng giác hóa không gian* và *Định lý hình chiếu diện tích*.

== 1. Kỹ Thuật Lượng Giác Hóa Không Gian 3D

=== A. Ý tưởng bản chất: Phép "trải phẳng" mặt cong
Hãy tưởng tượng bạn được yêu cầu tìm điểm trên quả địa cầu sao cho khoảng cách từ điểm đó đến một mặt phẳng cho trước là ngắn nhất. Quả địa cầu là một bề mặt cong 2D bị khóa trong không gian 3D bởi ràng buộc:
$ x^2 + y^2 + z^2 = R^2 $
Nếu ta làm việc trực tiếp với ba biến $x, y, z$, ta luôn phải mang theo điều kiện ràng buộc phi tuyến này. Phép lượng giác hóa thực chất là một phép bản đồ học: ta trải phẳng bề mặt quả cầu thành một hình chữ nhật phẳng với hai tọa độ tự do là kinh độ $v in [0, 2 pi]$ và vĩ độ $u in [0, pi]$. 

Khi đó, ba tọa độ $(x, y, z)$ của điểm $M$ trên mặt cầu được biểu diễn hoàn toàn theo hai biến góc tự do $u, v$:
$ cases(
  x = R sin u cos v,
  y = R sin u sin v,
  z = R cos u
) $

#why-box[
  *Tại sao lượng giác hóa lại tối ưu hơn đại số thông thường?*
  1. *Triệt tiêu ràng buộc:* Sau khi tham số hóa, điều kiện $x^2 + y^2 + z^2 = R^2$ luôn được thỏa mãn một cách tự động nhờ đồng nhất thức lượng giác $sin^2 u (cos^2 v + sin^2 v) + cos^2 u = 1$. Chúng ta được giải phóng hoàn toàn khỏi phương trình ràng buộc!
  2. *Chuyển bài toán 3 biến ràng buộc thành 2 biến tự do:* Thay vì tìm cực trị của hàm $f(x, y, z)$ dưới ràng buộc khó chịu, ta tìm cực trị của hàm lượng giác $g(u, v)$ với $u, v$ chạy hoàn toàn tự do. Việc giải quyết các hàm lượng giác phẳng bằng bất đẳng thức Bunhiacopxki lượng giác là cực kỳ quen thuộc với học sinh phổ thông.
]

#align(center)[
  #canvas(length: 1.2cm, {
    import draw: *
    let sx = -0.4
    let sy = -0.3
    let proj(x, y, z) = (x + y * sx, z + y * sy)
    
    // Trục tọa độ
    line(proj(-2.5, 0, 0), proj(2.5, 0, 0), stroke: 0.5pt + gray, mark: (end: "stealth", scale: 0.4))
    line(proj(0, -2.5, 0), proj(0, 2.5, 0), stroke: 0.5pt + gray, mark: (end: "stealth", scale: 0.4))
    line(proj(0, 0, -2.2), proj(0, 0, 2.5), stroke: 0.5pt + gray, mark: (end: "stealth", scale: 0.4))
    
    content(proj(2.7, 0, 0), text(size: 8pt)[$x$])
    content(proj(0, 2.7, 0), text(size: 8pt)[$y$])
    content(proj(0, 0, 2.7), text(size: 8pt)[$z$])
    content(proj(-0.2, -0.2, -0.2), text(size: 8pt)[$O$])
    
    let R = 1.8
    
    // Vẽ vòng tròn biên (hình chiếu phẳng của quả cầu)
    circle((0,0), radius: R, stroke: 0.5pt + rgb("#CBD5E1"))
    
    // Vẽ đường xích đạo (z = 0) dưới dạng elip
    for angle in range(0, 36) {
      let t1 = angle * 10 * 3.14159 / 180
      let t2 = (angle + 1) * 10 * 3.14159 / 180
      line(proj(R * calc.cos(t1), R * calc.sin(t1), 0), proj(R * calc.cos(t2), R * calc.sin(t2), 0), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    }
    
    // Chọn một điểm M trên mặt cầu
    let u = 45 * 3.14159 / 180 // vĩ độ
    let v = 50 * 3.14159 / 180 // kinh độ
    
    let mx = R * calc.sin(u) * calc.cos(v)
    let my = R * calc.sin(u) * calc.sin(v)
    let mz = R * calc.cos(u)
    
    let p-M = proj(mx, my, mz)
    let p-M-proj = proj(mx, my, 0)
    
    // Vẽ bán kính OM
    line(proj(0,0,0), p-M, stroke: 1pt + rgb("#0284C7"))
    // Vẽ đường nét đứt chiếu xuống xy
    line(p-M, p-M-proj, stroke: (paint: rgb("#64748B"), thickness: 0.6pt, dash: "dashed"))
    line(proj(0,0,0), p-M-proj, stroke: (paint: rgb("#64748B"), thickness: 0.6pt, dash: "dashed"))
    
    circle(p-M, radius: 2.5pt, fill: rgb("#BE123C"))
    circle(p-M-proj, radius: 1.5pt, fill: rgb("#475569"))
    
    content((p-M.at(0) + 0.3, p-M.at(1) + 0.2), $M(x, y, z)$)
    
    // Góc u (với trục Oz)
    // Góc v (trên mặt phẳng Oxy)
    content(proj(0.2, 0.2, 0.8), text(size: 8pt, fill: rgb("#0284C7"))[$u$])
    content(proj(0.5, 0.2, -0.1), text(size: 8pt, fill: rgb("#0D9488"))[$v$])
    
    content(proj(0, 0, -2.0), text(size: 8.5pt, style: "italic")[Tham số hóa góc tọa độ kinh - vĩ trên mặt cầu])
  })
]

=== B. Lượng giác hóa các mặt cong phổ biến

#tech-box[
  *1. Mặt cầu $(S): (x-x_0)^2 + (y-y_0)^2 + (z-z_0)^2 = R^2$*
  Đặt:
  $ cases(
    x = x_0 + R sin u cos v,
    y = y_0 + R sin u sin v,
    z = z_0 + R cos u
  ) quad (u in [0, pi], v in [0, 2 pi]) $

  *2. Mặt Ellipsoid $(E): x^2/a^2 + y^2/b^2 + z^2/c^2 = 1$*
  Đặt:
  $ cases(
    x = a sin u cos v,
    y = b sin u sin v,
    z = c cos u
  ) quad (u in [0, pi], v in [0, 2 pi]) $

  *3. Mặt trụ đứng $(C): (x-x_0)^2 + (y-y_0)^2 = R^2$* (với cao độ $z$ giới hạn hoặc tự do)
  Đặt:
  $ cases(
    x = x_0 + R cos t,
    y = y_0 + R sin t,
    z = z
  ) quad (t in [0, 2 pi], z in RR) $
]

=== C. Chiến thuật xử lý biểu thức cực trị lượng giác phẳng
Sau khi thế tọa độ tham số vào biểu thức cần tìm cực trị, ta thường thu được biểu thức có dạng:
$ P = A sin u cos v + B sin u sin v + C cos u $
Để tìm GTLN và GTNN của biểu thức này một cách nhanh chóng, học sinh hãy ghi nhớ quy trình 2 bước vàng sau:

- *Bước 1: Nhóm biến số và áp dụng Bunhiacopxki lượng giác phẳng cho góc $v$ trước.*
  Ta viết lại $P$ dưới dạng:
  $ P = sin u (A cos v + B sin v) + C cos u $
  Áp dụng bất đẳng thức lượng giác phẳng kinh định:
  $ -sqrt(A^2 + B^2) <= A cos v + B sin v <= sqrt(A^2 + B^2) $
  Do đó, vì $sin u >= 0$ trên miền $[0, pi]$, ta có đánh giá:
  $ P <= sqrt(A^2 + B^2) sin u + C cos u $

- *Bước 2: Áp dụng tiếp Bunhiacopxki lượng giác cho góc $u$.*
  Xem $sqrt(A^2 + B^2)$ và $C$ như hai hệ số tự do, áp dụng tiếp bất đẳng thức lượng giác phẳng cho biến $u$:
  $ sqrt(A^2 + B^2) sin u + C cos u <= sqrt((sqrt(A^2 + B^2))^2 + C^2) = sqrt(A^2 + B^2 + C^2) $
  Như vậy, ta nhanh chóng tìm được:
  $ -sqrt(A^2 + B^2 + C^2) <= P <= sqrt(A^2 + B^2 + C^2) $
  Đẳng thức xảy ra khi các góc $u, v$ đạt giá trị thích hợp thỏa mãn điều kiện dấu bằng.

== 2. Thiết Diện Xiên và Định Lý Hình Chiếu Diện Tích

=== A. Khái niệm hình chiếu diện tích và trực giác
Hãy tưởng tượng bạn cầm một bìa giấy hình elip nằm nghiêng trong không gian và chiếu một luồng ánh sáng song song thẳng đứng từ trên xuống. Bóng của bìa giấy elip in trên sàn nhà nằm ngang sẽ là một hình tròn hoặc một hình elip phẳng khác. 

Nếu ta nghiêng bìa giấy càng nhiều (góc nghiêng $phi$ càng lớn gần về $90^degree$), bóng của nó trên sàn nhà sẽ càng nhỏ đi. Ngược lại, nếu đặt bìa giấy song song với sàn nhà ($phi = 0$), bóng của nó sẽ có diện tích bằng đúng diện tích gốc. 

Mối liên hệ giữa diện tích hình phẳng nghiêng $S$ và diện tích hình chiếu của nó $S'$ được mô tả bởi định lý vô cùng đẹp đẽ sau:

#core-box[
  *Định lý hình chiếu diện tích (Projection Area Theorem):*
  
  Gọi $S$ là diện tích của một thiết diện hình phẳng nằm trên mặt phẳng $(P)$, và $S'$ là diện tích hình chiếu vuông góc của thiết diện đó xuống mặt phẳng đáy $(Q)$. Gọi $phi$ là góc giữa hai mặt phẳng $(P)$ và $(Q)$ ($0 <= phi < pi/2$). Khi đó:
  $ S' = S dot cos phi => S = S' / (cos phi) $
]

#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    let sx = -0.5
    let sy = -0.25
    let proj(x, y, z) = (x + y * sx, z + y * sy)
    
    // Mặt phẳng đáy Q (hình bình hành vẽ mờ)
    line(proj(-2, -2, 0), proj(2.5, -2, 0), stroke: 0.6pt + rgb("#CBD5E1"))
    line(proj(2.5, -2, 0), proj(1.5, 2, 0), stroke: 0.6pt + rgb("#CBD5E1"))
    line(proj(1.5, 2, 0), proj(-3, 2, 0), stroke: 0.6pt + rgb("#CBD5E1"))
    line(proj(-3, 2, 0), proj(-2, -2, 0), stroke: 0.6pt + rgb("#CBD5E1"))
    content(proj(2.1, -1.7, 0), text(size: 8.5pt, fill: gray)[$(Q)$])
    
    // Mặt phẳng cắt nghiêng P (chỉ vẽ đường biên cắt chéo hoặc hình phẳng nghiêng)
    // Vẽ hình elip nghiêng S
    let a = 1.4
    let b = 0.9
    let tilt-angle = 30 * 3.14159 / 180 // nghiêng 30 độ quanh trục x
    
    let get-ellipse-pt(t, is-projected) = {
      let ex = a * calc.cos(t)
      let ey = b * calc.sin(t)
      if is-projected {
        // Chiếu thẳng xuống z = 0
        return proj(ex, ey * calc.cos(tilt-angle), 0)
      } else {
        // Nằm trên mặt phẳng nghiêng z = ey * sin(tilt-angle)
        return proj(ex, ey * calc.cos(tilt-angle), ey * calc.sin(tilt-angle))
      }
    }
    
    // Vẽ elip nghiêng S (màu xanh dương)
    let pts-S = ()
    for i in range(0, 37) {
      pts-S.push(get-ellipse-pt(i * 10 * 3.14159 / 180, false))
    }
    for i in range(0, 36) {
      line(pts-S.at(i), pts-S.at(i+1), stroke: 1.2pt + rgb("#0284C7"))
    }
    content(proj(0, 0.4, 0.8), text(size: 9pt, fill: rgb("#0284C7"), weight: "bold")[$S$])
    
    // Vẽ elip hình chiếu S' (màu đỏ gạch, nằm ở z = 0)
    let pts-Sp = ()
    for i in range(0, 37) {
      pts-Sp.push(get-ellipse-pt(i * 10 * 3.14159 / 180, true))
    }
    for i in range(0, 36) {
      line(pts-Sp.at(i), pts-Sp.at(i+1), stroke: (paint: rgb("#BE123C"), thickness: 1.0pt, dash: "dashed"))
    }
    content(proj(0, -0.4, 0), text(size: 9pt, fill: rgb("#BE123C"), weight: "bold")[$S'$])
    
    // Vẽ các đường chiếu thẳng đứng nét đứt từ S xuống S' tại 4 góc
    for t in (0, 90, 180, 270) {
      let p1 = get-ellipse-pt(t * 3.14159 / 180, false)
      let p2 = get-ellipse-pt(t * 3.14159 / 180, true)
      line(p1, p2, stroke: (paint: rgb("#64748B"), thickness: 0.5pt, dash: "dashed"))
    }
    
    content(proj(0, -2.5, 0), text(size: 8.5pt, style: "italic")[Định lý hình chiếu diện tích: $S' = S dot cos phi$])
  })
]

=== B. Chứng minh định lý chuẩn phổ thông
Nhiều bạn học sinh lo sợ định lý này là kiến thức ngoài chương trình phổ thông. Thực chất, ta hoàn toàn có thể chứng minh nó bằng kiến thức hình học cơ bản của lớp 10 và 11 một cách vô cùng dễ hiểu:

1. *Với một tam giác $A B C$ nghiêng:*
   Giả sử tam giác $A B C$ nằm trên mặt phẳng $(P)$, có cạnh đáy $A B$ song song hoặc nằm ngay trên giao tuyến của $(P)$ với mặt phẳng chiếu $(Q)$. 
   Gọi $C'$ là hình chiếu vuông góc của $C$ xuống mặt phẳng $(Q)$. Khi đó, hình chiếu của tam giác $A B C$ xuống mặt phẳng $(Q)$ chính là tam giác $A B C'$.
   - Kẻ đường cao $C H$ của tam giác $A B C$ ($H in A B$).
   - Theo định lý ba đường vuông góc, $C' H$ cũng vuông góc với $A B$. Do đó $C' H$ chính là đường cao của tam giác hình chiếu $A B C'$.
   - Góc giữa hai mặt phẳng $(P)$ và $(Q)$ chính là góc giữa hai đường thẳng $C H$ và $C' H$ cắt nhau tại $H$. Gọi góc đó là $phi = angle(C H C')$.
   - Trong tam giác vuông $C H C'$ tại $C'$, ta có hệ thức lượng cơ bản:
     $ C' H = C H dot cos phi $
   - Diện tích tam giác hình chiếu $S' = S_(A B C')$ là:
     $ S' = 1/2 A B dot C' H = 1/2 A B dot (C H dot cos phi) = (1/2 A B dot C H) dot cos phi = S dot cos phi $

2. *Mở rộng cho đa giác và hình cong bất kỳ:*
   Mọi hình đa giác phức tạp bất kỳ đều có thể chia nhỏ thành các tam giác không chồng lên nhau. Vì định lý đúng cho từng tam giác nhỏ, nó cũng sẽ đúng cho tổng diện tích của đa giác. 
   Đối với các hình có đường biên cong (như hình tròn, hình elip), ta có thể coi chúng là giới hạn của đa giác đều có số cạnh tiến tới vô cùng. Do đó, công thức $S' = S dot cos phi$ luôn đúng cho mọi hình phẳng.

=== C. Ứng dụng bẻ gãy các bài toán hình trụ và hình nón
- *Đối với hình trụ tròn xoay đứng:* Khi bị cắt bởi một mặt phẳng nghiêng góc $phi$, thiết diện sinh ra luôn là một hình elip xiên. Hình chiếu vuông góc của hình elip này xuống mặt phẳng đáy của hình trụ chính là hình tròn đáy có diện tích $S' = pi R^2$. Do đó ta lập tiếp diện tích thiết diện elip là:
  $ S_("elip xiên") = (pi R^2) / (cos phi) $
- *Tính góc $phi$ bằng vectơ pháp tuyến:* Trong không gian Oxyz, nếu ta biết phương trình mặt phẳng nghiêng $(P)$ và mặt phẳng đáy $(Q)$ (thường là mặt phẳng tọa độ $O x y: z = 0$ có vectơ pháp tuyến $vec(n)_Q = (0, 0, 1)$), góc nghiêng $phi$ được tính cực kỳ nhanh chóng bằng tích vô hướng lớp 12:
  $ cos phi = (|vec(n)_P dot vec(n)_Q|) / (|vec(n)_P| dot |vec(n)_Q|) $

== 3. Các Ví Dụ Giải Chi Tiết Chuẩn Vận Dụng Cao

#vd-box("Ví dụ 1", "Tìm cực trị trên mặt cầu bằng ba phương pháp học thuật")[
  Cho các số thực $x, y, z$ thỏa mãn điều kiện ràng buộc: $x^2 + y^2 + z^2 = 14$. Tìm giá trị lớn nhất (GTLN) và giá trị nhỏ nhất (GTNN) của biểu thức $P = x + 2y + 3z$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Phương pháp 1: Đại số vectơ (Cauchy-Schwarz / Bunhiacopxki).*
    Xét hai vectơ trong không gian $O x y z$: $vec(a) = (1, 2, 3)$ và $vec(u) = (x, y, z)$.
    Tích vô hướng của chúng là: $vec(a) dot vec(u) = x + 2y + 3z = P$.
    Theo bất đẳng thức Cauchy-Schwarz đối với tích vô hướng:
    $ (vec(a) dot vec(u))^2 <= |vec(a)|^2 dot |vec(u)|^2 $
    $ P^2 <= (1^2 + 2^2 + 3^2)(x^2 + y^2 + z^2) $
    Thế dữ kiện đề bài cho $x^2 + y^2 + z^2 = 14$:
    $ P^2 <= (1 + 4 + 9) dot 14 = 14 dot 14 = 196 $
    $ -14 <= P <= 14 $
    - GTLN của $P$ bằng $14$. Dấu đẳng thức xảy ra khi hai vectơ $vec(a)$ và $vec(u)$ cùng hướng và cùng chiều, tức là:
      $ x/1 = y/2 = z/3 = k > 0$
      Thế vào ràng buộc mặt cầu: $k^2 + 4k^2 + 9k^2 = 14 => 14k^2 = 14 => k = 1$ (do $k > 0$).
      Điểm đạt cực đại là $M_1(1, 2, 3)$.
    - GTNN của $P$ bằng $-14$. Điểm đạt cực tiểu ứng với hai vectơ ngược chiều ($k = -1$) là $M_2(-1, -2, -3)$.
  
  - *Phương pháp 2: Lượng giác hóa mặt cầu (Chủ đề chính của chương).*
    Tham số hóa tọa độ của điểm $M(x, y, z)$ nằm trên mặt cầu bán kính $R = sqrt(14)$:
    $ cases(
      x = sqrt(14) sin u cos v,
      y = sqrt(14) sin u sin v,
      z = sqrt(14) cos u
    ) quad (u in [0, pi], v in [0, 2 pi]) $
    Thế các biểu thức tham số này vào biểu thức $P$:
    $ P = sqrt(14) sin u cos v + 2 sqrt(14) sin u sin v + 3 sqrt(14) cos u $
    $ P = sqrt(14) [ sin u (cos v + 2 sin v) ] + 3 sqrt(14) cos u $
    Áp dụng bất đẳng thức lượng giác phẳng cho ngoặc tròn theo biến $v$:
    $ cos v + 2 sin v <= sqrt(1^2 + 2^2) = sqrt(5) $
    Thế ngược vào biểu thức $P$, vì $sin u >= 0$ nên ta giữ nguyên chiều bất đẳng thức:
    $ P <= sqrt(14) [ sqrt(5) sin u ] + 3 sqrt(14) cos u = sqrt(14) (sqrt(5) sin u + 3 cos u) $
    Tiếp tục áp dụng bất đẳng thức lượng giác phẳng cho biến $u$:
    $ sqrt(5) sin u + 3 cos u <= sqrt((sqrt(5))^2 + 3^2) = sqrt(5 + 9) = sqrt(14) $
    Thế vào đánh giá của $P$:
    $ P <= sqrt(14) dot sqrt(14) = 14 $
    Chứng minh cực tiểu hoàn toàn tương tự bằng cách lấy cận dưới âm. Ta cũng có kết quả nhanh chóng.
    
  - *Phương pháp 3: Hình học tiếp xúc Oxyz lớp 12.*
    Biểu thức $P = x + 2y + 3z$ tương đương với phương trình mặt phẳng $(alpha_P): x + 2y + 3z - P = 0$.
    Yêu cầu bài toán tìm điểm $M(x, y, z)$ thuộc mặt cầu $(S): x^2 + y^2 + z^2 = 14$ sao cho biểu thức $P$ đạt giá trị lớn nhất hoặc nhỏ nhất thực chất là tìm vị trí mặt phẳng $(alpha_P)$ sao cho nó tiếp xúc với mặt cầu $(S)$ ở hai vị trí biên ngoài cùng.
    Điều kiện tiếp xúc là khoảng cách từ tâm mặt cầu $O(0, 0, 0)$ đến mặt phẳng $(alpha_P)$ đúng bằng bán kính $R = sqrt(14)$:
    $ d(O, alpha_P) = R <=> (|0 + 2(0) + 3(0) - P|) / (sqrt(1^2 + 2^2 + 3^2)) = sqrt(14) $
    $ (| -P |) / sqrt(14) = sqrt(14) <=> |P| = 14 <=> P = +- 14 $
    Vậy GTLN là $14$ và GTNN là $-14$. Đây là lời giải hình học rất sáng tạo!
]

#vd-box("Ví dụ 2", "Giải cực trị Ellipsoid bằng hai phương pháp")[
  Cho ba số thực $x, y, z$ thỏa mãn phương trình mặt cong Ellipsoid: $x^2 + 4y^2 + 9z^2 = 36$. Tìm giá trị lớn nhất của biểu thức:
  $ Q = x + 2y + 6z $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Cách 1: Sử dụng phép đổi biến tỉ lệ.*
    Đặt $X = x$, $Y = 2y$, $Z = 3z$. 
    Phương trình mặt Ellipsoid trở thành phương trình mặt cầu chính tắc:
    $ X^2 + Y^2 + Z^2 = 36 $
    Lúc này, biểu thức $Q$ được viết lại theo các biến mới:
    $ Q = X + Y + 2Z $
    Áp dụng bất đẳng thức Bunhiacopxki cho ba biến mới:
    $ Q^2 = (1 dot X + 1 dot Y + 2 dot Z)^2 <= (1^2 + 1^2 + 2^2)(X^2 + Y^2 + Z^2) $
    $ Q^2 <= (1 + 1 + 4) dot 36 = 6 dot 36 = 216 $
    $ Q <= sqrt(216) = 6 sqrt(6) $
    Đẳng thức xảy ra khi $X/1 = Y/1 = Z/2 > 0$. Giải ra ta tìm được điểm cực trị tương ứng.
    
  - *Cách 2: Sử dụng lượng giác hóa Ellipsoid.*
    Đưa phương trình mặt Ellipsoid về dạng chuẩn chính tắc bằng cách chia hai vế cho 36:
    $ x^2 / 36 + y^2 / 9 + z^2 / 4 = 1 $
    Các bán trục tương ứng là $a = 6, b = 3, c = 2$.
    Ta tham số hóa lượng giác điểm $M(x, y, z)$ di động trên Ellipsoid:
    $ cases(
      x = 6 sin u cos v,
      y = 3 sin u sin v,
      z = 2 cos u
    ) quad (u in [0, pi], v in [0, 2 pi]) $
    Thế vào biểu thức $Q$:
    $ Q = 6 sin u cos v + 2(3 sin u sin v) + 6(2 cos u) $
    $ Q = 6 sin u (cos v + sin v) + 12 cos u $
    Đánh giá theo biến $v$ trước: $cos v + sin v <= sqrt(1^2 + 1^2) = sqrt(2)$.
    Do đó, vì $sin u >= 0$:
    $ Q <= 6 sqrt(2) sin u + 12 cos u $
    Đánh giá tiếp theo biến $u$:
    $ 6 sqrt(2) sin u + 12 cos u <= sqrt((6 sqrt(2))^2 + 12^2) = sqrt(72 + 144) = sqrt(216) = 6 sqrt(6) $
    GTLN của $Q$ là $6 sqrt(6)$. Cả hai phương pháp đều cho kết quả đồng nhất và rất nhanh gọn.
]

#vd-box("Ví dụ 3", "Tính diện tích thiết diện xiên hình trụ đứng bằng định lý hình chiếu")[
  Một hình trụ tròn xoay đứng có bán kính đáy $R = 2$, nằm trên mặt phẳng đáy $O x y$ (phương trình đáy $z = 0$). Một mặt phẳng phẳng cắt chéo $(P)$ có phương trình $x + y + z - 2 = 0$ cắt hình trụ này tạo thành một thiết diện là một hình elip xiên. Hãy tính diện tích thiết diện elip này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Xác định diện tích hình chiếu vuông góc $S'$ của thiết diện elip xiên xuống mặt phẳng đáy.
    Đối với hình trụ đứng, hình chiếu vuông góc của bất kỳ thiết diện xiên nào cắt qua toàn bộ các đường sinh xuống mặt phẳng đáy nằm ngang chính là hình tròn đáy của hình trụ.
    Diện tích hình chiếu tròn là:
    $ S' = pi R^2 = pi dot 2^2 = 4 pi $
  - *Bước 2:* Xác định góc $phi$ giữa mặt phẳng cắt $(P)$ và mặt phẳng đáy $O x y$ (ký hiệu là mặt phẳng $(Q): z = 0$):
    - Vectơ pháp tuyến của mặt phẳng cắt $(P): x + y + z - 2 = 0$ là $vec(n)_P = (1, 1, 1)$.
    - Vectơ pháp tuyến của mặt đáy $(Q): z = 0$ là $vec(n)_Q = (0, 0, 1)$.
    - Tính cosin góc giữa hai mặt phẳng bằng công thức góc pháp vectơ lớp 12:
      $ cos phi = (|vec(n)_P dot vec(n)_Q|) / (|vec(n)_P| dot |vec(n)_Q|) = (|1(0) + 1(0) + 1(1)|) / (sqrt(1^2 + 1^2 + 1^2) dot sqrt(1)) = 1 / sqrt(3) $
  - *Bước 3:* Áp dụng định lý hình chiếu diện tích để tính diện tích thiết diện elip:
    $ S_("elip") = S' / (cos phi) = (4 pi) / (1/sqrt(3)) = 4 sqrt(3) pi $
  - *Kết luận:* Diện tích thiết diện cần tìm là $4 sqrt(3) pi$ (đơn vị diện tích). Lời giải cực kỳ ngắn gọn mà không cần vẽ hình hay tính toán tích phân phức tạp.
]

#vd-box("Ví dụ 4", "Tìm khoảng cách ngắn nhất từ ellipsoid đến mặt phẳng")[
  Cho mặt Ellipsoid $(E): x^2 + 4y^2 + z^2 = 4$ và mặt phẳng $(P): 2x - 2y + z - 10 = 0$. Tìm khoảng cách ngắn nhất từ một điểm bất kỳ trên mặt $(E)$ đến mặt phẳng $(P)$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Đưa phương trình mặt Ellipsoid về dạng chính tắc để xác định các bán trục:
    $ x^2 / 4 + y^2 / 1 + z^2 / 4 = 1 => a = 2, b = 1, c = 2 $
  - *Bước 2: Tham số hóa lượng giác điểm $M(x,y,z)$ di động trên $(E)$:*
    $ cases(
      x = 2 sin u cos v,
      y = sin u sin v,
      z = 2 cos u
    ) quad (u in [0, pi], v in [0, 2 pi]) $
  - *Bước 3:* Sử dụng công thức khoảng cách từ điểm $M$ đến mặt phẳng $(P)$ lớp 12:
    $ d(M, P) = (|2x - 2y + z - 10|) / (sqrt(2^2 + (-2)^2 + 1^2)) = (|2x - 2y + z - 10|) / 3 $
  - *Bước 4:* Tìm GTLN và GTNN của biểu thức tử số $A = 2x - 2y + z$:
    Thế các biểu thức tham số của $x, y, z$ vào $A$:
    $ A = 2(2 sin u cos v) - 2(sin u sin v) + 2 cos u $
    $ A = sin u (4 cos v - 2 sin v) + 2 cos u $
    Áp dụng Bunhiacopxki lượng giác phẳng cho biến $v$:
    $ 4 cos v - 2 sin v <= sqrt(4^2 + (-2)^2) = sqrt(20) = 2 sqrt(5) $
    Thế vào biểu thức $A$:
    $ A <= 2 sqrt(5) sin u + 2 cos u $
    Tiếp tục áp dụng Bunhiacopxki lượng giác phẳng cho biến $u$:
    $ A <= sqrt((2 sqrt(5))^2 + 2^2) = sqrt(20 + 4) = sqrt(24) = 2 sqrt(6) $
    Suy ra giá trị của biểu thức $A$ dao động trong đoạn:
    $ -2 sqrt(6) <= 2x - 2y + z <= 2 sqrt(6) $
  - *Bước 5:* Tính khoảng cách cực tiểu:
    Vì $2 sqrt(6) approx 4.9 < 10$, biểu thức tử số $A - 10 = 2x - 2y + z - 10$ luôn mang giá trị âm. 
    Để khoảng cách $d(M, P) = |A - 10| / 3$ đạt giá trị nhỏ nhất, ta cần tử số có độ lớn nhỏ nhất, tức là $A$ phải đạt giá trị lớn nhất (gần 10 nhất):
    $ d_("min") = (10 - A_("max")) / 3 = (10 - 2 sqrt(6)) / 3 $
]

#vd-box("Ví dụ 5", "Tối ưu hóa thể tích khối hộp nội tiếp Ellipsoid")[
  Một hình hộp chữ nhật có các cạnh song song với các trục tọa độ, nội tiếp bên trong một mặt phẳng Ellipsoid $(E): x^2/a^2 + y^2/b^2 + z^2/c^2 = 1$ ($a, b, c > 0$). Tìm thể tích lớn nhất của hình hộp chữ nhật này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Gọi tọa độ của đỉnh nằm ở góc phần tư thứ nhất của hình hộp chữ nhật là $M(x, y, z)$ với $x, y, z > 0$.
    Do các mặt của hình hộp chữ nhật song song với các mặt phẳng tọa độ và đối xứng qua gốc tọa độ $O$, kích thước 3 cạnh của hình hộp sẽ là $2x, 2y, 2z$.
    Thể tích của hình hộp chữ nhật này là:
    $ V = (2x)(2y)(2z) = 8 x y z $
  - *Bước 2:* Sử dụng bất đẳng thức Cô-si (AM-GM) cho ba số dương $x^2/a^2$, $y^2/b^2$, $z^2/c^2$ thỏa mãn ràng buộc của Ellipsoid:
    $ (x^2/a^2) dot (y^2/b^2) dot (z^2/c^2) <= ((x^2/a^2 + y^2/b^2 + z^2/c^2) / 3)^3 = (1 / 3)^3 = 1 / 27 $
    $ (x^2 y^2 z^2) / (a^2 b^2 c^2) <= 1 / 27 $
  - *Bước 3:* Lấy căn bậc hai hai vế:
    $ (x y z) / (a b c) <= 1 / (3 sqrt(3)) => x y z <= (a b c) / (3 sqrt(3)) $
  - *Bước 4:* Suy ra thể tích lớn nhất của hình hộp chữ nhật nội tiếp Ellipsoid:
    $ V_("max") = 8 x y z_("max") = (8 a b c) / (3 sqrt(3)) = (8 a b c sqrt(3)) / 9 $
    Đẳng thức xảy ra khi và chỉ khi:
    $ x^2 / a^2 = y^2 / b^2 = z^2 / c^2 = 1/3 => x = a / sqrt(3), y = b / sqrt(3), z = c / sqrt(3) $
]

#vd-box("Ví dụ 6", "Bài toán tính diện tích thiết diện xiên elip của hình nón tròn xoay")[
  Cho hình nón tròn xoay ngược có đỉnh tại gốc tọa độ $O(0, 0, 0)$, trục trùng với trục $z$. Phương trình của mặt nón là $x^2 + y^2 = z^2$ (với $z >= 0$). Một mặt phẳng phẳng cắt chéo $(P)$ có phương trình $z = 1/2 x + 2$ cắt hình nón tạo thành một thiết diện khép kín là một đường elip xiên. Hãy tính diện tích thiết diện elip này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Tìm phương trình hình chiếu vuông góc $S'$ của thiết diện xuống mặt đáy $O x y$.*
    Giao tuyến của mặt phẳng $(P)$ và mặt nón thỏa mãn hệ phương trình:
    $ cases(x^2 + y^2 = z^2, z = 1/2 x + 2) $
    Thế $z = 1/2 x + 2$ vào phương trình mặt nón:
    $ x^2 + y^2 = (1/2 x + 2)^2 <=> x^2 + y^2 = 1/4 x^2 + 2x + 4 $
    $ 3/4 x^2 - 2x + y^2 = 4 <=> 3/4 (x^2 - 8/3 x) + y^2 = 4 $
    $ 3/4 (x - 4/3)^2 + y^2 = 4 + 3/4 dot 16/9 = 4 + 4/3 = 16/3 $
    Chia cả hai vế cho $16/3$:
    $ (x - 4/3)^2 / (64/9) + y^2 / (16/3) = 1 $
    Đây chính là phương trình elip hình chiếu $S'$ trên mặt phẳng $O x y$!
    Các bán trục của elip hình chiếu $S'$ là:
    $ a' = sqrt(64/9) = 8/3, quad b' = sqrt(16/3) = 4 / sqrt(3) $
    Diện tích của hình chiếu elip $S'$ là:
    $ S' = pi a' b' = pi (8/3) (4 / sqrt(3)) = (32 pi) / (3 sqrt(3)) $
  - *Bước 2: Tìm góc $phi$ giữa mặt phẳng cắt $(P)$ và mặt phẳng chiếu $O x y$ (mặt phẳng $z=0$).*
    - Vectơ pháp tuyến của $(P): 1/2 x - 0y - z + 2 = 0$ là $vec(n)_P = (1/2, 0, -1)$.
    - Vectơ pháp tuyến của $O x y$ là $vec(n)_Q = (0, 0, 1)$.
    - Tính cosin góc giữa hai mặt phẳng:
      $ cos phi = (|vec(n)_P dot vec(n)_Q|) / (|vec(n)_P| dot |vec(n)_Q|) = (|-1|) / (sqrt((1/2)^2 + 0^2 + (-1)^2) dot 1) = 1 / sqrt(5/4) = 2 / sqrt(5) $
  - *Bước 3: Áp dụng định lý hình chiếu diện tích để tìm diện tích elip thiết diện $S$:*
    $ S = S' / (cos phi) = ((32 pi) / (3 sqrt(3))) / (2 / sqrt(5)) = (16 sqrt(5) pi) / (3 sqrt(3)) = (16 sqrt(15) pi) / 9 $
]

#vd-box("Ví dụ 7", "Cực trị khoảng cách từ elip phẳng đến một đường thẳng đứng")[
  Cho đường cong elip phẳng nằm trên mặt phẳng $z = 0$:
  $ (C): vec(r)(t) = (3 cos t, 2 sin t, 0) quad (t in [0, 2 pi]) $
  và mặt phẳng đứng $(P): x + y + z - 6 = 0$. Tìm điểm trên elip có khoảng cách đến mặt phẳng $(P)$ là lớn nhất và nhỏ nhất.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Viết công thức khoảng cách từ điểm $M(3 cos t, 2 sin t, 0)$ thuộc elip đến mặt phẳng $(P)$:
    $ d(M, P) = (|3 cos t + 2 sin t + 0 - 6|) / (sqrt(1^2 + 1^2 + 1^2)) = (|3 cos t + 2 sin t - 6|) / sqrt(3) $
  - *Bước 2:* Tìm cực trị của biểu thức trong dấu giá trị tuyệt đối $A = 3 cos t + 2 sin t$:
    Áp dụng bất đẳng thức lượng giác phẳng:
    $ -sqrt(3^2 + 2^2) <= 3 cos t + 2 sin t <= sqrt(3^2 + 2^2) <=> -sqrt(13) <= A <= sqrt(13) $
    Vì $sqrt(13) approx 3.6 < 6$, ta có $A - 6 < 0$. Do đó, ta bỏ dấu giá trị tuyệt đối bằng cách đảo dấu:
    $ d(M, P) = (6 - (3 cos t + 2 sin t)) / sqrt(3) $
  - *Bước 3:* 
    - Khoảng cách lớn nhất đạt được khi $3 cos t + 2 sin t$ đạt giá trị nhỏ nhất (bằng $-sqrt(13)$):
      $ d_("max") = (6 + sqrt(13)) / sqrt(3) = 2 sqrt(3) + sqrt(39)/3 $
      Dấu bằng xảy ra khi $3 cos t + 2 sin t = -sqrt(13) => cases(cos t = -3/sqrt(13), sin t = -2/sqrt(13))$.
      Tọa độ điểm tương ứng là $M_1(-9/sqrt(13), -4/sqrt(13), 0)$.
    - Khoảng cách nhỏ nhất đạt được khi $3 cos t + 2 sin t$ đạt giá trị lớn nhất (bằng $sqrt(13)$):
      $ d_("min") = (6 - sqrt(13)) / sqrt(3) = 2 sqrt(3) - sqrt(39)/3 $
      Dấu bằng xảy ra khi $3 cos t + 2 sin t = sqrt(13) => cases(cos t = 3/sqrt(13), sin t = 2/sqrt(13))$.
      Tọa độ điểm tương ứng là $M_2(9/sqrt(13), 4/sqrt(13), 0)$.
]

#vd-box("Ví dụ 8", "Xác định điểm trên mặt cầu gần mặt phẳng nhất")[
  Cho mặt cầu $(S): (x-1)^2 + (y+2)^2 + (z-3)^2 = 9$ và mặt phẳng $(P): 2x - 2y + z + 5 = 0$. Hãy xác định tọa độ điểm $M$ trên mặt cầu có khoảng cách đến mặt phẳng $(P)$ là ngắn nhất.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Xác định tâm $I$ và bán kính $R$ của mặt cầu:
    $ I(1, -2, 3), quad R = 3 $
  - *Bước 2:* Nhận xét hình học: Điểm $M$ thuộc mặt cầu gần mặt phẳng $(P)$ nhất chính là giao điểm của đường thẳng đi qua tâm $I$ vuông góc với $(P)$ và bề mặt cầu (chọn điểm nằm cùng phía với mặt phẳng so với tâm).
    Đường thẳng $Delta$ qua $I$ vuông góc với $(P)$ nhận vectơ pháp tuyến $vec(n)_P = (2, -2, 1)$ làm vectơ chỉ phương:
    $ Delta: cases(x = 1 + 2t, y = -2 - 2t, z = 3 + t) $
  - *Bước 3: Tìm giao điểm của $Delta$ với mặt cầu $(S)$:*
    Thế phương trình đường thẳng $Delta$ vào phương trình mặt cầu:
    $ (1 + 2t - 1)^2 + (-2 - 2t + 2)^2 + (3 + t - 3)^2 = 9 $
    $ (2t)^2 + (-2t)^2 + t^2 = 9 <=> 9t^2 = 9 <=> t = +- 1 $
    - Với $t = 1$: Ta được điểm $M_1(3, -4, 4)$.
    - Với $t = -1$: Ta được điểm $M_2(-1, 0, 2)$.
  - *Bước 4: Kiểm tra khoảng cách để kết luận:*
    Tính khoảng cách từ hai điểm $M_1, M_2$ đến mặt phẳng $(P)$:
    $ d(M_1, P) = (|2(3) - 2(-4) + 4 + 5|) / (sqrt(2^2 + (-2)^2 + 1^2)) = |6 + 8 + 4 + 5| / 3 = 23 / 3 $
    $ d(M_2, P) = (|2(-1) - 2(0) + 2 + 5|) / 3 = |-2 + 2 + 5| / 3 = 5 / 3 $
    Vì $5/3 < 23/3$, điểm gần mặt phẳng nhất là $M_2(-1, 0, 2)$.
]

#vd-box("Ví dụ 9", "Cực trị khoảng cách từ paraboloid tròn xoay đến mặt phẳng phẳng")[
  Cho mặt cong paraboloid tròn xoay $(P): z = x^2 + y^2$ và mặt phẳng $(alpha): 2x + 2y - z - 6 = 0$. Tìm khoảng cách ngắn nhất từ một điểm $M$ thuộc mặt cong $(P)$ đến mặt phẳng $(alpha)$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Tham số hóa mặt Paraboloid.*
    Ta đặt trực tiếp hai tọa độ hoành độ và tung độ là tham số tự do: $x = u, y = v$ (với $u, v in RR$).
    Khi đó, tọa độ điểm $M$ di động trên mặt cong là:
    $ M(u, v, u^2 + v^2) $
  - *Bước 2: Thiết lập biểu thức khoảng cách.*
    Áp dụng công thức khoảng cách từ $M$ đến mặt phẳng $(alpha)$:
    $ d(M, alpha) = (|2u + 2v - (u^2 + v^2) - 6|) / (sqrt(2^2 + 2^2 + (-1)^2)) = (| - (u^2 - 2u) - (v^2 - 2v) - 6 |) / 3 $
    $ d(M, alpha) = (| - (u - 1)^2 - (v - 1)^2 - 4 |) / 3 $
  - *Bước 3: Tối ưu hóa khoảng cách.*
    Nhận xét rằng biểu thức trong dấu giá trị tuyệt đối:
    $ B = - (u - 1)^2 - (v - 1)^2 - 4 $
    luôn nhỏ hơn hoặc bằng $-4$ với mọi số thực $u, v$.
    Do đó, giá trị tuyệt đối $|B|$ sẽ đạt giá trị nhỏ nhất khi $B$ lớn nhất (gần 0 nhất), tức là khi phần bình phương đạt GTNN bằng 0:
    $ B_("max") = -4 <=> u = 1, v = 1 $
    Khi đó, khoảng cách ngắn nhất là:
    $ d_("min") = |-4| / 3 = 4/3 $
    Điểm đạt khoảng cách ngắn nhất trên paraboloid là $M_0(1, 1, 2)$.
]

#vd-box("Ví dụ 10", "Tối ưu hóa góc của thiết diện cắt mặt trụ đứng")[
  Một hình trụ tròn xoay đứng có bán kính đáy $R = sqrt(3)$. Một mặt phẳng cắt $(alpha)$ đi qua tâm của hình trụ và nghiêng so với mặt đáy một góc $phi$. Biết diện tích của thiết diện elip thu được bằng $2 sqrt(3) pi$. Hãy xác định góc nghiêng $phi$ của mặt phẳng cắt đó.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1:* Xác định diện tích hình chiếu vuông góc $S'$ của thiết diện elip.
    Vì hình trụ đứng, hình chiếu của elip thiết diện xuống mặt đáy nằm ngang chính là hình tròn đáy của hình trụ:
    $ S' = pi R^2 = pi (sqrt(3))^2 = 3 pi $
  - *Bước 2:* Áp dụng định lý hình chiếu diện tích để liên hệ diện tích thiết diện $S$ và diện tích hình chiếu $S'$:
    $ cos phi = S' / S = (3 pi) / (2 sqrt(3) pi) = 3 / (2 sqrt(3)) = sqrt(3)/2 $
    Vì góc nghiêng $phi in [0, pi/2)$, ta suy ra:
    $ phi = 30^degree $
  - *Kết luận:* Góc nghiêng của mặt phẳng cắt so với mặt đáy là $30^degree$.
]

#vd-box("Ví dụ 11", "Bài toán thể tích khối tứ diện tối ưu tiếp xúc Ellipsoid")[
  Một mặt phẳng $(P)$ tiếp xúc với mặt Ellipsoid $(E): x^2/4 + y^2/9 + z^2/1 = 1$ tại một điểm $M_0(x_0, y_0, z_0)$ nằm ở góc phần tư thứ nhất ($x_0, y_0, z_0 > 0$). Mặt phẳng $(P)$ cắt ba trục tọa độ $O x, O y, O z$ lần lượt tại ba điểm $A(a, 0, 0)$, $B(0, b, 0)$, $C(0, 0, c)$ với $a, b, c > 0$. Tìm giá trị nhỏ nhất của thể tích khối tứ diện $O A B C$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Viết phương trình tiếp diện của Ellipsoid tại điểm $M_0$.*
    Sử dụng công thức phân đôi tọa độ tiếp tuyến cho mặt bậc hai (hoặc đạo hàm riêng tìm pháp vectơ):
    Phương trình tiếp diện $(P)$ tại điểm $M_0(x_0, y_0, z_0)$ thuộc $(E)$ là:
    $ (x x_0) / 4 + (y y_0) / 9 + (z z_0) / 1 = 1 $
  - *Bước 2: Xác định tọa độ giao điểm của tiếp diện với các trục tọa độ.*
    - Giao với trục $O x$ (cho $y=0, z=0$): $x x_0 / 4 = 1 => x = 4 / x_0 => A(4 / x_0, 0, 0) => a = 4 / x_0$.
    - Giao với trục $O y$ (cho $x=0, z=0$): $y y_0 / 9 = 1 => y = 9 / y_0 => B(0, 9 / y_0, 0) => b = 9 / y_0$.
    - Giao với trục $O z$ (cho $x=0, y=0$): $z z_0 / 1 = 1 => z = 1 / z_0 => C(0, 0, 1 / z_0) => c = 1 / z_0$.
  - *Bước 3: Tính thể tích khối tứ diện $O A B C$.*
    Thể tích tứ diện vuông tại gốc tọa độ $O$ là:
    $ V = 1/6 a b c = 1/6 (4 / x_0) (9 / y_0) (1 / z_0) = 6 / (x_0 y_0 z_0) $
  - *Bước 4: Tối ưu hóa thể tích.*
    Để thể tích $V$ đạt giá trị nhỏ nhất, ta cần tích $x_0 y_0 z_0$ đạt giá trị lớn nhất.
    Áp dụng bất đẳng thức Cô-si (AM-GM) cho ba số dương $x_0^2/4$, $y_0^2/9$, $z_0^2$ thỏa mãn ràng buộc thuộc Ellipsoid:
    $ (x_0^2/4) dot (y_0^2/9) dot (z_0^2) <= ((x_0^2/4 + y_0^2/9 + z_0^2) / 3)^3 = (1 / 3)^3 = 1 / 27 $
    $ (x_0^2 y_0^2 z_0^2) / 36 <= 1 / 27 <=> x_0^2 y_0^2 z_0^2 <= 36 / 27 = 4 / 3 $
    Lấy căn bậc hai hai vế:
    $ x_0 y_0 z_0 <= 2 / sqrt(3) $
    Thế vào công thức thể tích, ta được:
    $ V = 6 / (x_0 y_0 z_0) >= 6 / (2 / sqrt(3)) = 3 sqrt(3) $
  - *Kết luận:* Thể tích nhỏ nhất của khối tứ diện $O A B C$ là $3 sqrt(3)$ (đơn vị thể tích). Đạt được khi điểm tiếp xúc là $M_0(2/sqrt(3), 3/sqrt(3), 1/sqrt(3))$.
]

#vd-box("Ví dụ 12", "Bài toán con kiến bò quanh hũ mật – Tối ưu hóa đường đi trên mặt trụ")[
  Một hũ mật ong có dạng hình trụ đứng bán kính đáy $R = 3$ cm, chiều cao $h = 8 pi$ cm. Một con kiến đang ở điểm $A$ tại chân hũ mật (tọa độ $A(3, 0, 0)$). Nó muốn bò quanh bề mặt ngoài của hũ mật để đến điểm $B$ ở miệng hũ nằm đối diện bên kia trục (tọa độ $B(-3, 0, 8 pi)$). Hãy tìm chiều dài ngắn nhất của đường đi mà con kiến cần bò.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Trải phẳng mặt xung quanh của hình trụ.*
    Mặt xung quanh của hình trụ khi cắt dọc theo một đường sinh và trải phẳng ra trên mặt phẳng tọa độ sẽ trở thành một hình chữ nhật phẳng có:
    - Chiều rộng bằng chu vi đáy: $C = 2 pi R = 2 pi (3) = 6 pi$ cm.
    - Chiều cao bằng chiều cao hình trụ: $h = 8 pi$ cm.
  - *Bước 2: Xác định tọa độ các điểm trên mặt phẳng trải phẳng.*
    - Điểm xuất phát $A$ nằm ở góc dưới cùng bên trái của hình chữ nhật: đặt tọa độ là $A'(0, 0)$.
    - Điểm đích đến $B$ nằm ở mép trên của hình chữ nhật. Vì $B$ nằm đối diện với $A$ qua trục hình trụ, nên trên vòng tròn đáy, quãng đường đi từ góc của $A$ đến góc của $B$ bằng đúng một nửa chu vi đáy:
      $ Delta x = C / 2 = 3 pi $
      Độ cao của $B$ bằng chiều cao hũ mật: $Delta y = 8 pi$.
      Do đó, tọa độ của $B$ trên mặt phẳng trải phẳng là $B'(3 pi, 8 pi)$.
  - *Bước 3: Tính khoảng cách ngắn nhất.*
    Đường đi ngắn nhất giữa hai điểm trên một mặt phẳng phẳng chắc chắn là đoạn thẳng nối hai điểm đó.
    Chiều dài đoạn thẳng $A' B'$ là:
    $ L = sqrt((3 pi - 0)^2 + (8 pi - 0)^2) = sqrt(9 pi^2 + 64 pi^2) = sqrt(73 pi^2) = pi sqrt(73) approx 26.89 " cm" $
  - *Bước 4: Phương trình tham số của đường đi thực tế trong 3D.*
    On mặt phẳng phẳng, đường thẳng nối $A'$ và $B'$ có phương trình tham số theo thời gian $t in [0, 1]$:
    $ cases(x' = 3 pi t, y' = 8 pi t) $
    Khi cuộn mặt phẳng này lại thành hình trụ trong không gian 3D, tọa độ $x'$ đóng vai trò góc quay lượng giác $theta$, còn $y'$ đóng vai trò cao độ $z$:
    $ cases(
      x = R cos(x'/R) = 3 cos(3 pi t / 3) = 3 cos(pi t),
      y = R sin(x'/R) = 3 sin(3 pi t / 3) = 3 sin(pi t),
      z = y' = 8 pi t
    ) quad (t in [0, 1]) $
    Đường đi ngắn nhất này chính là một đoạn của *đường xoắn Helix* quấn quanh hũ trụ!
]

#open-q[
  Đối với bài toán con kiến bò quanh hũ mật ở Ví dụ 12, nếu con kiến không bò ở mặt ngoài mà bò ở mặt trong của một chiếc ly hình nón ngược, phương pháp trải phẳng mặt nón sẽ dẫn đến việc tính toán góc ở đỉnh của rẻ quạt như thế nào? Hãy thử thiết lập công thức tổng quát.
]
