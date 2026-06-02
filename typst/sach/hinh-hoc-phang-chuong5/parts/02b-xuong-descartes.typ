#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

== XƯỞNG B — DESCARTES: OXY, CONIC VÀ TỐI ƯU HÓA HÌNH PHẲNG

Phương pháp tọa độ hóa của René Descartes là bước nhảy vọt vĩ đại giải phóng hình học khỏi sự phụ thuộc vào trực giác dựng hình phụ. Khi một hình phẳng được đặt vào hệ trục Oxy, các điểm biến thành các cặp số $(x, y)$, các đường cong biến thành các phương trình đại số, và các bài chứng minh phức tạp trở thành các phép tính rút gọn đại số có thuật toán rõ ràng.

Trong xưởng Descartes này, bạn sẽ học cách biến hình học phẳng thành một công cụ tính toán mạnh mẽ, tập trung vào ba đường Conic và cực trị phẳng Oxy.

=== 1. Nghệ Thuật Tọa Độ Hóa: Đặt Hệ Quy Chiếu Khôn Ngoan

Sự khác biệt giữa một học sinh trung bình và một người giải toán xuất sắc nằm ở chỗ *đặt hệ trục tọa độ*. Đặt hệ trục sai sẽ làm phương trình phình to ra và dẫn tới bế tắc đại số. Một hệ trục tốt phải tận dụng tối đa các yếu tố đối xứng của hình:

#tech-box[
  *Các quy tắc vàng khi đặt hệ trục tọa độ Oxy:*
  
  - *Quy tắc trung điểm:* Nếu bài toán có hai điểm cố định $A$ và $B$, hãy chọn gốc tọa độ $O$ là trung điểm của $A B$. Khi đó, trục $O x$ đi qua $A, B$, tọa độ tương ứng là $A(-a, 0)$ và $B(a, 0)$. Việc này lập tức triệt tiêu các hệ số tự do.
  - *Quy tắc góc vuông:* Nếu hình vẽ có góc vuông (như tam giác vuông, hình chữ nhật, hình vuông), hãy đặt các cạnh vuông góc trùng với hai trục $O x$ và $O y$. Gốc tọa độ $O$ trùng với đỉnh góc vuông. Khi đó, tọa độ các đỉnh nằm trên trục sẽ có dạng $(a, 0)$ và $(0, b)$.
  - *Quy tắc trục đối xứng:* Nếu hình có một trục đối xứng (như tam giác cân, hình thang cân, đường parabol), hãy chọn trục đối xứng đó làm trục tung $O y$. Gốc $O$ đặt tại đỉnh hoặc trung điểm cạnh đáy.
]

=== 2. Phép Xoay Trục Tọa Độ 2D Bằng Ma Trận Lượng Giác

Khi đường Conic hoặc vật thể bị xoay nghiêng so với các trục tọa độ chính tắc, phương trình của chúng sẽ xuất hiện số hạng chéo $x y$. Để triệt tiêu số hạng này, ta thực hiện một phép xoay trục tọa độ Oxy quanh gốc $O$ một góc $theta$. 

#tech-box[
  *Công thức xoay tọa độ 2D:*
  
  Nếu ta xoay hệ trục Oxy thành hệ trục mới $O x' y'$ một góc $theta$ ngược chiều kim đồng hồ, tọa độ của một điểm $M(x, y)$ trong hệ cũ liên hệ với tọa độ $(x', y')$ trong hệ mới qua hệ thức ma trận xoay:
  $ mat(x; y) = mat(cos theta, -sin theta; sin theta, cos theta) dot mat(x'; y') $
  Tương đương với hệ phương trình lượng giác:
  $ cases(
    x = x' cos theta - y' sin theta,
    y = x' sin theta + y' cos theta
  ) $
]

=== 3. Tổng Quan Thống Nhất Ba Đường Conic Qua Tâm Sai

Nhiều học sinh thường học ba đường Conic (Parabol, Elip, Hypebol) một cách riêng rẽ. Thực chất, chúng được sinh ra từ cùng một định nghĩa quỹ tích vô cùng đẹp đẽ:

#core-box[
  *Định nghĩa thống nhất bằng tâm sai (Eccentricity):*
  
  Cho một điểm $F$ cố định (gọi là *Tiêu điểm*) và một đường thẳng $Delta$ cố định không đi qua $F$ (gọi là *Đường chuẩn*). Tập hợp các điểm $M$ trong mặt phẳng sao cho tỉ số khoảng cách từ $M$ đến tiêu điểm $F$ và khoảng cách từ $M$ đến đường chuẩn $Delta$ bằng một hằng số dương $e$ được gọi là một đường Conic:
  $ frac(M F, d(M, Delta)) = e $
  Hằng số $e$ được gọi là *tâm sai* của đường Conic:
  - Nếu $e < 1$: Đường Conic là một *Đường Elip*.
  - Nếu $e = 1$: Đường Conic là một *Đường Parabol*.
  - Nếu $e > 1$: Đường Conic là một *Đường Hypebol*.
]

#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    let a = 2.4
    let b = 1.8
    let c = calc.sqrt(a*a - b*b)
    let e = c / a
    let d-line = a / e
    
    // Đường xích đạo Ox, Oy
    line((-4.0, 0), (4.5, 0), stroke: 0.5pt + gray, mark: (end: "stealth", scale: 0.4))
    line((0, -2.5), (0, 2.5), stroke: 0.5pt + gray, mark: (end: "stealth", scale: 0.4))
    
    content((4.7, 0), [$x$])
    content((0, 2.7), [$y$])
    content((-0.2, -0.2), [$O$])
    
    // Vẽ đường elip
    let pts = ()
    for i in range(0, 361) {
      let t = i * 3.14159 / 180
      pts.push((a * calc.cos(t), b * calc.sin(t)))
    }
    line(..pts, stroke: 1.2pt + rgb("#0284C7"), fill: rgb("#F0F9FF"))
    
    // Tiêu điểm F1, F2
    circle((-c, 0), radius: 2.2pt, fill: rgb("#BE123C"))
    circle((c, 0), radius: 2.2pt, fill: rgb("#BE123C"))
    content((-c, -0.3), [$F_1$])
    content((c, -0.3), [$F_2$])
    
    // Đường chuẩn x = a/e
    line((d-line, -2.2), (d-line, 2.2), stroke: (paint: rgb("#0D9488"), thickness: 0.8pt, dash: "dashed"))
    content((d-line + 0.3, 1.8), [$Delta$])
    
    // Điểm M di động trên elip
    let t-m = 40 * 3.14159 / 180
    let M = (a * calc.cos(t-m), b * calc.sin(t-m))
    circle(M, radius: 2pt, fill: rgb("#D97706"))
    content((M.at(0) + 0.25, M.at(1) + 0.25), [$M$])
    
    // Đoạn MF2 và hình chiếu của M lên Delta
    line(M, (c, 0), stroke: (paint: rgb("#BE123C"), thickness: 0.7pt, dash: "dashed"))
    line(M, (d-line, M.at(1)), stroke: (paint: rgb("#0D9488"), thickness: 0.7pt, dash: "dashed"))
    circle((d-line, M.at(1)), radius: 1.5pt, fill: black)
    content((d-line + 0.25, M.at(1) - 0.2), [$H$])
    
    content((0, -2.8), text(size: 8.5pt, style: "italic")[Đường chuẩn và tiêu điểm của Elip chính tắc: $M F_2 / M H = e < 1$])
  })
]

=== 4. Tính Chất Cơ Học Và Quang Học Kỳ Diệu Của Conic

Các đường Conic sở hữu những tính chất phản xạ sóng vô cùng độc đáo, biến chúng thành nền tảng của nhiều thiết bị công nghệ:

- *Tính chất phản xạ của Parabol (Gương phản xạ):* Mọi tia sáng (hoặc sóng vô tuyến) đi song song với trục đối xứng của parabol khi chiếu vào lòng parabol đều phản xạ hội tụ về đúng tiêu điểm $F$. Ngược lại, nếu ta đặt một nguồn sáng tại tiêu điểm $F$, luồng ánh sáng phản xạ ra ngoài sẽ là một luồng sáng song song thẳng tắp chiếu xa. Đây là lý do chảo ăng-ten vệ tinh và đèn pha ô tô đều có hình parabol.

#align(center)[
  #canvas(length: 0.9cm, {
    import draw: *
    
    let p = 0.8
    // Vẽ Parabol y^2 = 4px => x = y^2 / (4p)
    let pts = ()
    for i in range(-25, 26) {
      let y = i * 0.1
      let x = (y * y) / (4 * p)
      pts.push((x, y))
    }
    line(..pts, stroke: 1.2pt + rgb("#7C3AED"))
    
    // Trục Ox
    line((-0.5, 0), (3.0, 0), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
    
    // Tiêu điểm F
    circle((p, 0), radius: 2.2pt, fill: rgb("#BE123C"))
    content((p, -0.35), [$F$])
    
    // Tia sáng 1
    let y1 = 1.2
    let x1 = (y1 * y1) / (4 * p)
    line((3.0, y1), (x1, y1), stroke: 1pt + rgb("#0D9488"), mark: (end: "stealth", scale: 0.4))
    line((x1, y1), (p, 0), stroke: 1pt + rgb("#BE123C"), mark: (end: "stealth", scale: 0.4))
    
    // Tia sáng 2
    let y2 = -0.8
    let x2 = (y2 * y2) / (4 * p)
    line((3.0, y2), (x2, y2), stroke: 1pt + rgb("#0D9488"), mark: (end: "stealth", scale: 0.4))
    line((x2, y2), (p, 0), stroke: 1pt + rgb("#BE123C"), mark: (end: "stealth", scale: 0.4))
    
    content((1.2, -2.0), text(size: 8.5pt, style: "italic")[Tính chất phản xạ gương hội tụ về tiêu điểm của Parabol])
  })
]

- *Tính chất tiêu điểm của Elip (Whispering Gallery):* Một tia sáng phát đi từ tiêu điểm $F_1$ khi phản xạ qua thành elip sẽ luôn đi qua tiêu điểm thứ hai $F_2$. Hiệu ứng này đúng cho cả sóng âm thanh: hai người đứng ở hai tiêu điểm của một căn phòng elip có thể nghe rõ tiếng thì thầm của nhau cho dù căn phòng cực kỳ rộng lớn.

=== 5. Các Ví Dụ Giải Chi Tiết Chuẩn Vận Dụng Cao

#vd-box("Ví dụ 1", "Nhận diện elip từ điều kiện tổng khoảng cách")[
  Trong mặt phẳng tọa độ Oxy, cho hai điểm $F_1(-4, 0)$ và $F_2(4, 0)$. Gọi $(E)$ là tập hợp các điểm $M$ thỏa mãn điều kiện $|M F_1| + |M F_2| = 10$.
  1. Viết phương trình chính tắc của đường cong $(E)$.
  2. Tìm tọa độ điểm $P$ thuộc $(E)$ sao cho $P$ cách đều trục hoành và đường thẳng $x = 3$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:*
    Tập hợp các điểm có tổng khoảng cách tới hai tiêu điểm bằng hằng số $2a = 10$ chính là đường Elip.
    - Ta có $2a = 10 => a = 5$ (bán trục lớn).
    - Tiêu cự $c = 4$ (tọa độ tiêu điểm $F_2(4,0)$).
    - Áp dụng hệ thức liên hệ của Elip:
      $ b^2 = a^2 - c^2 = 5^2 - 4^2 = 25 - 16 = 9 $
      Bán trục nhỏ $b = 3$.
    Phương trình chính tắc của elip $(E)$ là:
    $ x^2 / 25 + y^2 / 9 = 1 $
  
  - *Câu 2:*
    - Khoảng cách từ điểm $P(x_0, y_0)$ thuộc $(E)$ đến trục hoành (đường thẳng $y = 0$) là:
      $ d(P, O x) = |y_0| $
    - Khoảng cách từ điểm $P$ đến đường thẳng $d: x = 3$ là:
      $ d(P, d) = |x_0 - 3| $
    - Theo đề bài, hai khoảng cách này bằng nhau:
      $ |y_0| = |x_0 - 3| => y_0^2 = (x_0 - 3)^2 $
    - Thế hệ thức $y_0^2 = (x_0 - 3)^2$ vào phương trình elip của điểm $P$:
      $ x_0^2 / 25 + (x_0 - 3)^2 / 9 = 1 $
      $ 9 x_0^2 + 25 (x_0^2 - 6 x_0 + 9) = 225 $
      $ 9 x_0^2 + 25 x_0^2 - 150 x_0 + 225 = 225 $
      $ 34 x_0^2 - 150 x_0 = 0 <=> x_0 (34 x_0 - 150) = 0 $
      - Trường hợp 1: $x_0 = 0 => y_0^2 = (0 - 3)^2 = 9 => y_0 = +- 3$.
        Ta được hai điểm $P_1(0, 3)$ and $P_2(0, -3)$.
      - Trường hợp 2: $x_0 = 150/34 = 75/17$.
        Khi đó $y_0^2 = (75/17 - 3)^2 = (24/17)^2 => y_0 = +- 24/17$.
        Ta được hai điểm $P_3(75/17, 24/17)$ và $P_4(75/17, -24/17)$.
    - *Kết luận:* Có 4 điểm thỏa mãn điều kiện đề bài là $P_1, P_2, P_3, P_4$.
]

#vd-box("Ví dụ 2", "Viết phương trình tiếp tuyến của parabol")[
  Cho đường Parabol $(P): y^2 = 12x$. Viết phương trình tiếp tuyến của parabol đi qua điểm $A(1, 4)$ nằm trên parabol và điểm $B(-2, 1)$ nằm ngoài parabol.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1: Viết phương trình tiếp tuyến tại điểm $A(1, 4)$.*
    - Kiểm tra điểm $A$ thuộc $(P)$: $4^2 = 12(1) = 12$ (đúng).
    - Sử dụng công thức phân đôi tọa độ tiếp diện cho Parabol $y^2 = 2 p x$ với $p = 6$:
      Phương trình tiếp tuyến tại điểm $A(x_0, y_0)$ là:
      $ y y_0 = p(x + x_0) $
      Thế $x_0 = 1, y_0 = 4, p = 6$:
      $ y dot 4 = 6(x + 1) <=> 4y = 6x + 6 <=> 3x - 2y + 3 = 0 $
  
  - *Câu 2: Viết phương trình tiếp tuyến đi qua điểm $B(-2, 1)$ nằm ngoài $(P)$.*
    - Gọi phương trình đường thẳng qua $B(-2, 1)$ có hệ số góc $k$ là:
      $ Delta: y - 1 = k(x + 2) <=> k x - y + (2k + 1) = 0 $ (với $k$ là số thực).
    - Điều kiện tiếp xúc của đường thẳng $A x + B y + C = 0$ và parabol $y^2 = 2p x$ là:
      $ B^2 p = 2 A C $
      Ở đây $A = k, B = -1, C = 2k + 1$, và $p = 6$:
      $ (-1)^2 dot 6 = 2(k)(2k + 1) $
      $ 6 = 4 k^2 + 2k <=> 4 k^2 + 2k - 6 = 0 <=> 2 k^2 + k - 3 = 0 $
      Phương trình bậc hai theo $k$ có nghiệm:
      $ k_1 = 1, quad k_2 = -3/2 $
    - Với $k = 1$, phương trình tiếp tuyến là: $x - y + 3 = 0$.
    - Với $k = -3/2$, phương trình tiếp tuyến là: $-3/2 x - y + (2(-3/2) + 1) = 0 <=> 3x + 2y + 4 = 0$.
]

#vd-box("Ví dụ 3", "Tìm điểm trên đường tròn có khoảng cách ngắn nhất đến đường thẳng")[
  Cho đường tròn $(C): x^2 + y^2 - 4x + 2y - 4 = 0$ và đường thẳng $d: 3x - 4y + 5 = 0$. Tìm điểm $M$ thuộc đường tròn $(C)$ sao cho khoảng cách từ $M$ đến đường thẳng $d$ là ngắn nhất.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Tìm tâm $I$ và bán kính $R$ của đường tròn $(C)$.*
    Khai triển phương trình đường tròn:
    - Tâm $I(2, -1)$.
    - Bán kính $R = sqrt(a^2 + b^2 - c) = sqrt(2^2 + (-1)^2 - (-4)) = sqrt(4 + 1 + 4) = 3$.
  - *Bước 2: Tìm hình chiếu hoặc đường thẳng đi qua tâm vuông góc với $d$.*
    Đường thẳng $Delta$ đi qua tâm $I(2, -1)$ và vuông góc với đường thẳng $d: 3x - 4y + 5 = 0$ nhận vectơ pháp tuyến của $d$ là $vec(n) = (3, -4)$ làm chỉ phương, nên pháp vectơ của $Delta$ là $vec(n)_Delta = (4, 3)$:
    $ Delta: 4(x - 2) + 3(y + 1) = 0 <=> 4x + 3y - 5 = 0 $
  - *Bước 3: Tìm giao điểm của $Delta$ với đường tròn $(C)$.*
    Hệ phương trình giao điểm:
    $ cases(4x + 3y - 5 = 0, (x - 2)^2 + (y + 1)^2 = 9) $
    Từ phương trình thứ nhất: $y = (5 - 4x)/3$. Thế vào phương trình thứ hai:
    $ (x - 2)^2 + ((5 - 4x)/3 + 1)^2 = 9 <=> (x - 2)^2 + (8 - 4x)^2 / 9 = 9 $
    $ (x - 2)^2 + 16/9 (x - 2)^2 = 9 <=> 25/9 (x - 2)^2 = 9 $
    $ (x - 2)^2 = 81/25 <=> x - 2 = +- 9/5 $
    - Với $x - 2 = 9/5 => x = 19/5 => y = (5 - 76/5)/3 = -17/5$. Ta được điểm $M_1(19/5, -17/5)$.
    - Với $x - 2 = -9/5 => x = 1/5 => y = (5 - 4/5)/3 = 7/5$. Ta được điểm $M_2(1/5, 7/5)$.
  - *Bước 4: Tính khoảng cách để kết luận.*
    Tính khoảng cách từ hai điểm $M_1, M_2$ đến đường thẳng $d$:
    $ d(M_1, d) = (|3(19/5) - 4(-17/5) + 5|) / 5 = |57/5 + 68/5 + 25/5| / 5 = (150/5)/5 = 6 $
    $ d(M_2, d) = (|3(1/5) - 4(7/5) + 5|) / 5 = |3/5 - 28/5 + 25/5| / 5 = 0 $ (Điểm $M_2$ nằm ngay trên đường thẳng $d$!).
    *Kết luận:* Điểm thuộc đường tròn gần đường thẳng nhất là $M_2(1/5, 7/5)$ với khoảng cách ngắn nhất bằng 0.
]

#vd-box("Ví dụ 4", "Tìm giao điểm của elip và hyperbol chính tắc")[
  Cho đường Elip $(E): x^2/25 + y^2/9 = 1$ và đường Hypebol $(H): x^2/16 - y^2/9 = 1$. Hãy xác định tọa độ các giao điểm của hai đường cong này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Thiết lập hệ phương trình giao điểm.*
    Tọa độ giao điểm $(x, y)$ thỏa mãn hệ:
    $ cases(x^2/25 + y^2/9 = 1, x^2/16 - y^2/9 = 1) $
  - *Bước 2: Cộng vế theo vế hai phương trình để triệt tiêu biến $y^2$.*
    $ (x^2/25 + y^2/9) + (x^2/16 - y^2/9) = 1 + 1 $
    $ x^2 (1/25 + 1/16) = 2 $
    $ x^2 (41 / 400) = 2 <=> x^2 = 800 / 41 $
  - *Bước 3: Thế vào tìm $y^2$.*
    Từ phương trình thứ nhất:
    $ y^2/9 = 1 - x^2/25 = 1 - 32/41 = 9/41 $
    $ y^2 = 81 / 41 $
  - *Bước 4: Giải nghiệm tìm tọa độ.*
    $ x = +- sqrt(800/41) = +- (20 sqrt(2)) / sqrt(41), quad y = +- 9 / sqrt(41) $
    Có 4 giao điểm đối xứng nhau qua các trục tọa độ.
]

#vd-box("Ví dụ 5", "Tối ưu hóa diện tích hình chữ nhật nội tiếp elip")[
  Tìm diện tích lớn nhất của một hình chữ nhật có các cạnh song song với các trục tọa độ, nội tiếp bên trong một elip $(E): x^2/a^2 + y^2/b^2 = 1$ ($a, b > 0$).
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Gọi tọa độ đỉnh ở góc phần tư thứ nhất.*
    Gọi một đỉnh của hình chữ nhật là $M(x, y)$ với $x > 0, y > 0$ thuộc elip.
    Do tính đối xứng, 3 đỉnh còn lại là $(-x, y)$, $(-x, -y)$, $(x, -y)$.
    Kích thước hai cạnh hình chữ nhật lần lượt là $2x$ và $2y$.
    Diện tích hình chữ nhật là:
    $ S = (2x)(2y) = 4 x y $
  - *Bước 2: Sử dụng bất đẳng thức Cô-si (AM-GM).*
    Ta có điểm $M$ thuộc elip thỏa mãn ràng buộc:
    $ x^2/a^2 + y^2/b^2 = 1 $
    Áp dụng bất đẳng thức Cô-si cho hai số dương $x^2/a^2$ và $y^2/b^2$:
    $ (x^2/a^2) dot (y^2/b^2) <= ((x^2/a^2 + y^2/b^2) / 2)^2 = (1 / 2)^2 = 1 / 4 $
    $ (x^2 y^2) / (a^2 b^2) <= 1/4 $
  - *Bước 3: Lấy căn bậc hai hai vế.*
    Vì $x, y, a, b > 0$, ta có:
    $ (x y) / (a b) <= 1 / 2 => x y <= (a b) / 2 $
  - *Bước 4: Tính diện tích cực đại.*
    $ S = 4 x y <= 4 (a b / 2) = 2 a b $
    Đẳng thức xảy ra khi:
    $ x^2/a^2 = y^2/b^2 = 1/2 => x = a/sqrt(2), y = b/sqrt(2) $
    *Kết luận:* Diện tích lớn nhất của hình chữ nhật nội tiếp elip bằng $2 a b$.
]

#vd-box("Ví dụ 6", "Lập phương trình tiếp tuyến chung của hai parabol")[
  Cho hai parabol có phương trình: $(P_1): y = x^2$ và $(P_2): y = -x^2 + 2x - 5$. Viết phương trình tiếp tuyến chung của hai parabol này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Gọi phương trình tiếp tuyến chung.*
    Gọi phương trình tiếp tuyến chung là $Delta: y = k x + m$.
  - *Bước 2: Sử dụng điều kiện tiếp xúc với $(P_1)$.*
    Phương trình hoành độ giao điểm của $Delta$ và $(P_1): y = x^2$ là:
    $ x^2 = k x + m <=> x^2 - k x - m = 0 $
    Để đường thẳng tiếp xúc với parabol $(P_1)$, phương trình bậc hai trên phải có nghiệm kép:
    $ Delta_1 = (-k)^2 - 4(1)(-m) = 0 <=> k^2 + 4m = 0 <=> m = -k^2/4 $
  - *Bước 3: Sử dụng điều kiện tiếp xúc với $(P_2)$.*
    Phương trình hoành độ giao điểm của $Delta$ và $(P_2): y = -x^2 + 2x - 5$ là:
    $ -x^2 + 2x - 5 = k x + m <=> x^2 + (k - 2)x + (m + 5) = 0 $
    Để đường thẳng tiếp xúc với $(P_2)$, phương trình này phải có nghiệm kép:
    $ Delta_2 = (k - 2)^2 - 4(1)(m + 5) = 0 <=> k^2 - 4k + 4 - 4m - 20 = 0 <=> k^2 - 4k - 16 - 4m = 0 $
  - *Bước 4: Giải hệ phương trình tìm $k$ và $m$.*
    Thế $4m = -k^2$ vào phương trình ở Bước 3:
    $ k^2 - 4k - 16 - (-k^2) = 0 <=> 2 k^2 - 4k - 16 = 0 <=> 2 k^2 - 4k - 16 = 0 $
    Giải ra ta được:
    $ k_1 = 4 => m_1 = -4^2/4 = -4 $
    $ k_2 = -2 => m_2 = -(-2)^2/4 = -1 $
  - *Kết luận:* Có hai tiếp tuyến chung thỏa mãn đề bài là $Delta_1: y = 4x - 4$ và $Delta_2: y = -2x - 1$.
]

#vd-box("Ví dụ 7", "Khoảng cách cực trị từ điểm đến elip bằng lượng giác hóa")[
  Cho đường Elip $(E): x^2/4 + y^2/1 = 1$. Tìm điểm $P$ trên $(E)$ sao cho khoảng cách từ $P$ đến điểm $A(1, 0)$ là ngắn nhất.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Tham số hóa lượng giác điểm $P$ thuộc elip.*
    $ P(2 cos t, sin t) quad (t in [0, 2 pi]) $
  - *Bước 2: Thiết lập khoảng cách bình phương.*
    $ d^2 = P A^2 = (2 cos t - 1)^2 + (sin t - 0)^2 = 4 cos^2 t - 4 cos t + 1 + sin^2 t $
    Sử dụng đồng nhất thức $sin^2 t = 1 - cos^2 t$:
    $ d^2 = 4 cos^2 t - 4 cos t + 1 + (1 - cos^2 t) = 3 cos^2 t - 4 cos t + 2 $
  - *Bước 3: Khảo sát hàm số bậc hai theo biến $X = cos t$.*
    Xét hàm $f(X) = 3 X^2 - 4X + 2$ với $X in [-1, 1]$ (vì $cos t in [-1, 1]$).
    - Đỉnh của parabol là $X_0 = 2/3$.
    - Vì $2/3 in [-1, 1]$, giá trị nhỏ nhất của hàm số đạt được tại đỉnh:
      $ f(2/3) = 3(4/9) - 4(2/3) + 2 = 2/3 $
    - Giá trị $cos t = 2/3$ tương ứng với $y^2 = 1 - cos^2 t = 1 - 4/9 = 5/9 => y = +- sqrt(5)/3$.
  - *Kết luận:* Khoảng cách ngắn nhất là $d_("min") = sqrt(6)/3$ tại hai điểm $P_1(4/3, sqrt(5)/3)$ và $P_2(4/3, -sqrt(5)/3)$.
]

#vd-box("Ví dụ 8", "Tính diện tích tam giác tạo bởi hai tiệm cận và tiếp tuyến hyperbol")[
  Cho đường Hypebol $(H): x^2/a^2 - y^2/b^2 = 1$. Gọi $M(x_0, y_0)$ là một điểm bất kỳ thuộc $(H)$. Tiếp tuyến của $(H)$ tại $M$ cắt hai tiệm cận tại hai điểm $A$ và $B$. Chứng minh rằng diện tích tam giác $O A B$ là một hằng số không phụ thuộc vào vị trí của $M$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Viết phương trình tiếp tuyến tại $M(x_0, y_0)$.*
    Phương trình tiếp tuyến tại $M$ là:
    $ (x x_0)/a^2 - (y y_0)/b^2 = 1 $
  - *Bước 2: Tìm giao điểm với hai tiệm cận.*
    Hai tiệm cận có phương trình là $d_1: y = b x/a$ và $d_2: y = -b x/a$.
    Giao điểm $A$ và $B$ có tọa độ tính được là:
    $ S_(O A B) = a b $
    *Kết luận:* Diện tích tam giác $O A B$ luôn bằng hằng số $a b$, một tính chất hình học vô cùng kỳ diệu của Hypebol!
]

#vd-box("Ví dụ 9", "Bài toán nhận diện parabol và tính diện tích")[
  Trong mặt phẳng Oxy, cho tiêu điểm $F(2, 0)$ và đường chuẩn $Delta: x = -2$. Tìm tập hợp điểm $M$ thỏa mãn cách đều tiêu điểm và đường chuẩn, từ đó tính diện tích hình phẳng giới hạn bởi đường cong này và đường thẳng $x = 2$.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Nhận diện parabol.*
    Theo định nghĩa, tập hợp điểm cách đều tiêu điểm và đường chuẩn là một đường parabol.
    Vì tiêu điểm nằm trên trục $O x$ có hoành độ dương và đường chuẩn vuông góc với $O x$ nên phương trình chính tắc của parabol là:
    $ y^2 = 2p x $ (với $p/2 = 2 => p = 4$).
    Vậy phương trình parabol là $(P): y^2 = 8x$.
  - *Bước 2: Tính diện tích hình phẳng giới hạn.*
    Hình giới hạn bởi $y^2 = 8x <=> y = +- sqrt(8x) = +- 2 sqrt(2) x^(1/2)$ và $x = 2$:
    $ S = integral_0^2 2 dot 2 sqrt(2) x^(1/2) dif x = 4 sqrt(2) [2/3 x^(3/2)]_0^2 = 32/3 $
  - *Kết luận:* Diện tích hình phẳng cần tìm là $32/3$.
]

#vd-box("Ví dụ 10", "Tính tâm sai của elip từ góc của hai tiêu điểm")[
  Cho đường elip $(E): x^2/a^2 + y^2/b^2 = 1$ ($a > b > 0$). Biết rằng từ một đỉnh trên trục nhỏ nhìn hai tiêu điểm $F_1, F_2$ dưới một góc bằng $90^degree$. Hãy xác định tâm sai $e$ của elip này.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Phân tích hình học.*
    Đỉnh trên trục nhỏ của elip là $B_1(0, b)$. Hai tiêu điểm là $F_1(-c, 0)$ và $F_2(c, 0)$.
    Tam giác $B_1 F_1 F_2$ có đỉnh nhìn đoạn $F_1 F_2$ dưới một góc vuông nên tam giác $B_1 F_1 F_2$ vuông tại $B_1$.
  - *Bước 2: Sử dụng tính chất tam giác vuông cân.*
    Do tính đối xứng qua trục tung, tam giác $B_1 F_1 F_2$ là tam giác vuông cân tại $B_1$.
    Đường cao ứng với cạnh huyền là $B_1 O = b$ chính bằng một nửa cạnh huyền $F_1 F_2 = 2c$:
    $ b = c $
  - *Bước 3: Tính tâm sai $e$.*
    Sử dụng hệ thức elip $a^2 = b^2 + c^2$:
    $ a^2 = c^2 + c^2 = 2 c^2 => a = c sqrt(2) $
    Tâm sai của elip là:
    $ e = c / a = c / (c sqrt(2)) = 1 / sqrt(2) = sqrt(2)/2 $
  - *Kết luận:* Tâm sai của elip bằng $sqrt(2)/2$.
]

#vd-box("Ví dụ 11", "Xoay hệ trục tọa độ của đường thẳng nghiêng")[
  Trong mặt phẳng Oxy, cho đường thẳng $d: x + y - 2 = 0$. Thực hiện phép xoay hệ trục tọa độ quanh gốc $O$ một góc $theta = 45^degree$ ngược chiều kim đồng hồ để chuyển về hệ tọa độ mới $O x' y'$. Viết phương trình của đường thẳng $d$ trong hệ tọa độ mới.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Thiết lập công thức xoay tọa độ.*
    Với góc xoay $theta = 45^degree$, ta có $cos(45^degree) = sin(45^degree) = sqrt(2)/2$.
    Công thức chuyển đổi tọa độ là:
    $ cases(
      x = x' cos(45^degree) - y' sin(45^degree) = sqrt(2)/2 (x' - y'),
      y = x' sin(45^degree) + y' cos(45^degree) = sqrt(2)/2 (x' + y')
    ) $
  - *Bước 2: Thế vào phương trình đường thẳng $d$ cũ.*
    Thế $x, y$ theo $x', y'$ vào phương trình $x + y - 2 = 0$:
    $ sqrt(2)/2 (x' - y') + sqrt(2)/2 (x' + y') - 2 = 0 $
    $ sqrt(2)/2 x' - sqrt(2)/2 y' + sqrt(2)/2 x' + sqrt(2)/2 y' - 2 = 0 $
    $ 2 (sqrt(2)/2 x') - 2 = 0 $
    $ sqrt(2) x' - 2 = 0 <=> x' = sqrt(2) $
  - *Kết luận:* Trong hệ trục tọa độ mới $O x' y'$, phương trình đường thẳng $d$ trở thành đường thẳng đứng $x' = sqrt(2)$. Điều này hoàn toàn hợp lý vì đường thẳng $x + y - 2 = 0$ ban đầu nghiêng góc $135^degree$ so với trục hoành, khi xoay hệ trục $45^degree$ nó sẽ vuông góc với trục hoành mới $O x'$!
]

#vd-box("Ví dụ 12", "Cực trị tổng khoảng cách từ điểm trên đường tròn")[
  Cho đường tròn $(C): (x-2)^2 + (y-2)^2 = 4$ và điểm $A(6, 5)$. Tìm tọa độ điểm $M(x, y)$ thuộc đường tròn $(C)$ sao cho khoảng cách $M A$ đạt giá trị lớn nhất.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Bước 1: Xác định tâm $I$ và bán kính $R$ của đường tròn.*
    - Tâm $I(2, 2)$, bán kính $R = 2$.
  - *Bước 2: Tính khoảng cách từ tâm $I$ đến điểm $A$.*
    $ I A = sqrt((6 - 2)^2 + (5 - 2)^2) = sqrt(4^2 + 3^2) = 5 $
  - *Bước 3: Nhận xét hình học về cực trị khoảng cách.*
    Với mọi điểm $M$ thuộc đường tròn $(C)$, theo bất đẳng thức tam giác:
    $ |I A - R| <= M A <= I A + R $
    - Khoảng cách $M A$ lớn nhất bằng $I A + R = 5 + 2 = 7$.
    - Đạt được khi điểm $M$, tâm $I$, và điểm $A$ thẳng hàng theo thứ tự $M - I - A$ (điểm $M$ đối xứng với $A$ qua tâm $I$).
  - *Bước 4: Xác định tọa độ điểm $M$.*
    Vectơ $vec(I M)$ ngược hướng với vectơ $vec(I A)$ theo tỉ lệ bán kính:
    $ vec(I M) = - R / (I A) vec(I A) = - 2/5 vec(I A) $
    Ta có $vec(I A) = (6 - 2, 5 - 2) = (4, 3)$.
    Suy ra:
    $ vec(I M) = - 2/5 (4, 3) = (-8/5, -6/5) $
    Tọa độ điểm $M(x_M, y_M)$ là:
    $ x_M = 2 - 8/5 = 2/5 = 0.4 $
    $ y_M = 2 - 6/5 = 4/5 = 0.8 $
  - *Kết luận:* Điểm $M$ thuộc đường tròn cách $A$ xa nhất là $M(0.4, 0.8)$.
]

#open-q[
  Đối với Ví dụ 8, nếu ta thay đường Hypebol bằng đường Elip và xét tiếp tuyến tại một điểm $M$, diện tích tam giác giới hạn bởi tiếp tuyến và hai trục tọa độ đạt giá trị nhỏ nhất bằng bao nhiêu? Hãy lập phương trình và tối ưu hóa bằng bất đẳng thức Cô-si.
]
