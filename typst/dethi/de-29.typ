#import "../sang-exam.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *

#let mode = "loigiai"
#let accent = classic.blue
#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.frac: math.display

#show: thpt-school-exam.with(
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "GV Nguyễn Văn Sang",
  exam-title: "ĐỀ DỰ ĐOÁN TRƯỚC NGÀY THI",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "9997",
  footer-left: [Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: true,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [
  #exam-part(
    [Phần I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  )
  #tn(
    [Hàm số $y = (x - 1)/(x - 2)$ có các đường tiệm cận đứng và tiệm cận ngang lần lượt là:],
    (
      True([$x = 2$ và $y = 1$]),
      [$x = 1$ và $y = 2$],
      [$x = -1$ và $y = 2$],
      [$x = -2$ và $y = 1$],
    ),
    loigiai: [
      #step[Tìm tiệm cận đứng]
      Xét mẫu số $x - 2 = 0 <=> x = 2$.
      Vì $lim_(x -> 2^+) (x - 1)/(x - 2) = +oo$ (và $lim_(x -> 2^-) y = -oo$) nên đường thẳng $x = 2$ là tiệm cận đứng.

      #step[Tìm tiệm cận ngang]
      Ta có $lim_(x -> +oo) (x - 1)/(x - 2) = 1$ (và $lim_(x -> -oo) y = 1$), suy ra đường thẳng $y = 1$ là tiệm cận ngang.
    ],
  )

  #tn(
    [Cho hàm số $y = f(x)$ có bảng biến thiên như sau. Hàm số đạt cực đại tại điểm:],
    (
      [$x = 4$],
      [$x = 2$],
      True([$x = 0$]),
      [$x = -2$],
    ),
    fig: bbbt(
      x-vals: ($-oo$, $-2$, $0$, $2$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$),
      v-vals: ($+oo$, $-2$, $4$, $-2$, $+oo$),
    ),
    fig-pos: "center",
    loigiai: [
      #step[Phân tích bảng biến thiên]
      Quan sát bảng biến thiên, ta thấy đạo hàm $y'$ đổi dấu từ $(+)$ sang $(-)$ khi đi qua điểm $x = 0$.

      #step[Kết luận]
      Vậy hàm số đạt cực đại tại điểm $x = 0$, với giá trị cực đại tương ứng là $y(0) = 4$.
    ],
  )
  // ================= CÂU 3 =================
  #tn(
    [Cho hình chóp $S.A B C$ có đáy $A B C$ là tam giác đều cạnh $a$ và khoảng cách từ đỉnh $S$ xuống đáy $(A B C)$ bằng $3a$. Thể tích khối chóp $S.A B C$ bằng:],
    (
      [$(a^3 sqrt(3))/6$],
      [$(a^3 sqrt(2))/12$],
      True([$(a^3 sqrt(3))/4$]),
      [$(a^3 sqrt(6))/9$],
    ),
    fig: cetz.canvas(length: 1.2cm, {
      import cetz.draw: *

      // Toạ độ các điểm
      let a = (-1.5, 0)
      let c = (2.5, 0)
      let b = (0.5, -1.2)
      let h = (0.8, -0.3)
      let s = (0.8, 2.5)

      // Vẽ đáy và nét đứt
      line(a, b, stroke: red)
      line(b, c, stroke: red)
      line(c, a, stroke: (dash: "dashed", paint: red))

      // Vẽ các cạnh bên
      line(s, a, stroke: red)
      line(s, b, stroke: red)
      line(s, c, stroke: red)

      // Đường cao SH
      line(s, h, stroke: (dash: "dashed", paint: blue))

      // Vẽ các điểm và nhãn
      circle(a, radius: 1.5pt, fill: black)
      content((-1.7, 0), $A$)
      circle(b, radius: 1.5pt, fill: black)
      content((0.5, -1.5), $B$)
      circle(c, radius: 1.5pt, fill: black)
      content((2.7, 0), $C$)
      circle(s, radius: 1.5pt, fill: black)
      content((0.5, 2.6), $S$)
      circle(h, radius: 1.5pt, fill: black)
      content((0.8, -0.6), $H$)

      // Ghi chú độ dài
      content((-0.6, -0.8), $a$)
      content((0.3, 1.2), $3a$)
    }),
    fig-pos: "right",
    fig-width: 40%,
    loigiai: [
      #step[Tính diện tích đáy]
      Đáy $A B C$ là tam giác đều cạnh $a$ nên có diện tích là:
      $ S_(A B C) = (a^2 sqrt(3))/4 $

      #step[Tính thể tích khối chóp]
      Khối chóp có chiều cao $h = 3a$. Thể tích là:
      $ V = 1/3 S_(A B C) dot h = 1/3 dot (a^2 sqrt(3))/4 dot 3a = (a^3 sqrt(3))/4 $
    ],
  )


  // ================= CÂU 4 =================
  #tn(
    [Giá trị $lim_(x -> -oo) (sqrt(x^2 - 3^2026) - x)/(x + 1)$ bằng:],
    (
      [$0$],
      [$+oo$],
      [$1$],
      True([$-2$]),
    ),
    loigiai: [
      #luuy[
        Khi $x -> -oo$ thì $x < 0$, do đó khi đưa $x^2$ ra ngoài căn bậc chẵn ta phải lấy dấu âm: $sqrt(x^2) = |x| = -x$.
      ]

      #step[Biến đổi và rút gọn]
      Chia cả tử và mẫu cho $x$ (với $x < 0$):
      $
        lim_(x -> -oo) (sqrt(x^2 - 3^2026) - x)/(x + 1) & = lim_(x -> -oo) (sqrt(x^2 (1 - 3^2026/x^2)) - x)/(x(1 + 1/x)) \
                                                        & = lim_(x -> -oo) (-x sqrt(1 - 3^2026/x^2) - x)/(x(1 + 1/x)) \
                                                        & = lim_(x -> -oo) (-x (sqrt(1 - 3^2026/x^2) + 1))/(x(1 + 1/x)) \
                                                        & = lim_(x -> -oo) -(sqrt(1 - 3^2026/x^2) + 1)/(1 + 1/x)
      $

      #step[Tính giới hạn]
      Khi $x -> -oo$, ta có $1/x -> 0$ và $3^2026/x^2 -> 0$.
      Thay vào biểu thức ta được:
      $ -(sqrt(1 - 0) + 1)/(1 + 0) = -2 $
      Vậy giới hạn bằng $-2$.
    ],
  )

  // ================= CÂU 5 =================
  #tn(
    [Cho đồ thị của hàm số $y = f(x)$ như hình vẽ bên dưới. Hỏi hàm số $f(x)$ nghịch biến trên khoảng nào dưới đây?],
    (
      [$(-5; +oo)$],
      True([$(-1; 4)$]),
      [$(4; +oo)$],
      [$(-oo; 4)$],
    ),
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *

      // Axes
      line((-2.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.6pt)
      line((0, -2.5), (0, 3.5), mark: (end: ">"), stroke: 0.6pt)
      content((5.3, -0.3), $x$)
      content((-0.3, 3.3), $y$)
      content((-0.3, -0.3), $O$)

      // Graph
      let points = ()
      for i in range(0, 101) {
        let x = -2.5 + i * 8.0 / 100.0
        let y = (1.0 / 15.0) * x * x * x - 0.3 * x * x - 0.8 * x + 2
        if y >= -2.5 and y <= 3.5 {
          points.push((x, y))
        }
      }
      line(..points, stroke: 1.2pt + blue)

      // Dashed lines
      line((-1, 0), (-1, 2.43), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
      line((-1, 2.43), (0, 2.43), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))

      line((4, 0), (4, -1.73), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
      line((4, -1.73), (0, -1.73), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))

      // Labels
      content((-1, -0.3), $-1$)
      content((4, 0.3), $4$)
    }),
    fig-pos: "center",
    loigiai: [
      #ppgiai[
        Hàm số nghịch biến trên khoảng $(a; b)$ nếu đồ thị của hàm số có hướng đi xuống từ trái sang phải trên khoảng đó.
      ]
      #step[Phân tích đồ thị]
      Quan sát đồ thị đã cho, ta thấy trên khoảng $(-1; 4)$ của trục hoành, nét đồ thị tương ứng đang có hướng đi xuống từ trái sang phải.

      #step[Kết luận]
      Vậy hàm số $y = f(x)$ nghịch biến trên khoảng $(-1; 4)$.
    ],
  )

  // ================= CÂU 6 =================
  #tn(
    [Trong không gian $O x y z$, cho hai vectơ $vec(u) = (1; 2; 0)$, $vec(v) = (-2; 1; -1)$. Tổng của hai vectơ này có tọa độ là:],
    (
      [$(3; 1; 1)$],
      True([$(-1; 3; -1)$]),
      [$(-3; -1; -1)$],
      [$(1; -2; 1)$],
    ),
    loigiai: [
      #ppgiai[
        Trong không gian với hệ tọa độ $O x y z$, tổng của hai vectơ $vec(u) = (x_1; y_1; z_1)$ và $vec(v) = (x_2; y_2; z_2)$ là một vectơ có tọa độ được xác định bởi công thức:
        $ vec(u) + vec(v) = (x_1 + x_2; y_1 + y_2; z_1 + z_2) $
      ]
      #step[Thực hiện phép tính]
      Ta có $vec(u) = (1; 2; 0)$ và $vec(v) = (-2; 1; -1)$.
      Tọa độ của vectơ tổng $vec(u) + vec(v)$ là:
      $ vec(u) + vec(v) = (1 + (-2); 2 + 1; 0 + (-1)) = (-1; 3; -1) $

      #step[Kết luận]
      Vậy tổng của hai vectơ đã cho có tọa độ là $(-1; 3; -1)$.
    ],
  )

  // ================= CÂU 7 =================
  #tn(
    [Họ nguyên hàm của hàm số $f(x) = e^x + 1$ là:],
    (
      [$F(x) = e^x + 1$],
      [$F(x) = -e^x + x + C$],
      [$F(x) = e^x + C$],
      True([$F(x) = e^x + x + C$]),
    ),
    loigiai: [
      #ppgiai[
        Sử dụng các công thức nguyên hàm cơ bản:
        $ int e^x d x = e^x + C quad "và" quad int 1 d x = x + C $
      ]
      #step[Thực hiện phép tính]
      Ta có:
      $ int (e^x + 1) d x = int e^x d x + int 1 d x = e^x + x + C $

      #step[Kết luận]
      Vậy họ nguyên hàm của hàm số đã cho là $F(x) = e^x + x + C$.
    ],
  )

  // ================= CÂU 8 =================
  #tn(
    [Trong không gian $O x y z$, đường thẳng $d: (x-1)/3 = y/4 = (z-1)/2$ có một vectơ chỉ phương là:],
    (
      [$vec(u)_1 = (1; 0; 1)$],
      [$vec(u)_2 = (1; -3; 2)$],
      [$vec(u)_3 = (3; 2; 4)$],
      True([$vec(u)_4 = (3; 4; 2)$]),
    ),
    loigiai: [
      #ppgiai[
        Phương trình chính tắc của đường thẳng đi qua điểm $M(x_0; y_0; z_0)$ và có vectơ chỉ phương $vec(u) = (a; b; c)$ (với $a, b, c neq 0$) là:
        $ (x - x_0)/a = (y - y_0)/b = (z - z_0)/c $
      ]
      #step[Phân tích phương trình]
      Phương trình đường thẳng đã cho là $d: (x-1)/3 = y/4 = (z-1)/2$.
      Dựa vào dạng chính tắc, ta xác định được các tham số ở mẫu số tương ứng là tọa độ của một vectơ chỉ phương.

      #step[Kết luận]
      Vậy một vectơ chỉ phương của đường thẳng $d$ là $vec(u)_4 = (3; 4; 2)$.
    ],
  )

  // ================= CÂU 9 =================
  #tn(
    [Cho hình phẳng $(H)$ giới hạn bởi các đường $f(x) = x^2 + 1$ và $g(x) = 3x - 1$. Diện tích hình phẳng $(H)$ bằng:],
    (
      True([$1/6$]),
      [$2/3$],
      [$1/3$],
      [$pi/2$],
    ),
    loigiai: [
      #ppgiai[
        Diện tích hình phẳng giới hạn bởi hai đồ thị $y = f(x)$, $y = g(x)$ và hai đường thẳng $x = a$, $x = b$ là:
        $ S = int_a^b |f(x) - g(x)| d x $
        Nếu không cho trước hai cận, ta tìm hoành độ giao điểm của hai đồ thị để xác định cận tích phân.
      ]
      #step[Tìm hoành độ giao điểm]
      Phương trình hoành độ giao điểm của hai đồ thị là:
      $ x^2 + 1 = 3x - 1 <=> x^2 - 3x + 2 = 0 <=> hoac(x &= 1, x &= 2) $

      #step[Tính diện tích]
      Diện tích hình phẳng $(H)$ được tính bởi tích phân:
      $ S = int_1^2 |(x^2 + 1) - (3x - 1)| d x = int_1^2 |x^2 - 3x + 2| d x $
      Trên đoạn $[1; 2]$, ta có $x^2 - 3x + 2 <= 0$ nên $|x^2 - 3x + 2| = -x^2 + 3x - 2$.
      $ S = int_1^2 (-x^2 + 3x - 2) d x = (-x^3/3 + (3x^2)/2 - 2x) |_1^2 = 1/6 $

      #step[Kết luận]
      Vậy diện tích hình phẳng $(H)$ bằng $1/6$.
    ],
  )

  // ================= CÂU 10 =================
  #tn(
    [Cho hình hộp $A B C D.A' B' C' D'$. Vectơ $overrightarrow(A B) + overrightarrow(A' D') + overrightarrow(D D')$ bằng vectơ nào dưới đây?],
    (
      [$overrightarrow(A B')$],
      True([$overrightarrow(A C')$]),
      [$vec(0)$],
      [$overrightarrow(B D)$],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng quy tắc cộng vectơ theo quy tắc ba điểm và tính chất của hình hộp:
        - Trong hình hộp, các cạnh đối diện song song và bằng nhau nên ta có các cặp vectơ bằng nhau.
        - Quy tắc hình bình hành: $overrightarrow(A B) + overrightarrow(A D) = overrightarrow(A C)$.
        - Quy tắc ba điểm: $overrightarrow(M N) + overrightarrow(N P) = overrightarrow(M P)$.
      ]
      #step[Thay thế các vectơ bằng nhau]
      Dựa vào tính chất của hình hộp $A B C D.A' B' C' D'$ (các mặt là hình bình hành), ta có:
      $ overrightarrow(A' D') = overrightarrow(A D) $

      #step[Thực hiện phép cộng]
      Biến đổi biểu thức ban đầu, ta được:
      $
        overrightarrow(A B) + overrightarrow(A' D') + overrightarrow(D D') &= overrightarrow(A B) + overrightarrow(A D) + overrightarrow(D D') \
        &= (overrightarrow(A B) + overrightarrow(A D)) + overrightarrow(D D') \
        &= overrightarrow(A C) + overrightarrow(D D') \
        &= overrightarrow(A C')
      $

      #step[Kết luận]
      Vậy tổng của ba vectơ đã cho bằng $overrightarrow(A C')$.
    ],
  )

  // ================= CÂU 11 =================
  #tn(
    [Cho hàm số $y = (x^2 + 2x - 3)/(x^2 - 5x + 4)$ có đồ thị $(C)$. Số đường tiệm cận của đồ thị $(C)$ là:],
    (
      True([$2$]),
      [$3$],
      [$1$],
      [$0$],
    ),
    loigiai: [
      #ppgiai[
        Để tìm đường tiệm cận của đồ thị hàm phân thức, ta thực hiện:
        - Rút gọn phân thức (nếu có thể) để loại bỏ nghiệm chung của tử và mẫu.
        - Tìm số nghiệm của mẫu số sau khi rút gọn để xác định số tiệm cận đứng.
        - Xét giới hạn khi $x to +-oo$ để xác định tiệm cận ngang.
      ]
      #step[Rút gọn hàm số]
      Ta có hàm số: $y = (x^2 + 2x - 3)/(x^2 - 5x + 4)$.
      Phân tích tử và mẫu thành nhân tử:
      $ y = ((x - 1)(x + 3))/((x - 1)(x - 4)) $
      Với điều kiện $x neq 1$ và $x neq 4$, hàm số được rút gọn thành:
      $ y = (x + 3)/(x - 4) $

      #step[Xác định các đường tiệm cận]
      - *Tiệm cận đứng:* Xét mẫu số $x - 4 = 0 <=> x = 4$. Khi $x to 4$, $y to +-oo$ nên $x = 4$ là một đường tiệm cận đứng.
      Tại $x = 1$, giới hạn của hàm số là một số hữu hạn ($y to -4/3$) nên $x = 1$ không phải là tiệm cận đứng.
      - *Tiệm cận ngang:* Xét giới hạn $lim_(x to +-oo) y = lim_(x to +-oo) (x + 3)/(x - 4) = 1$. Vậy đường thẳng $y = 1$ là một đường tiệm cận ngang.

      #step[Kết luận]
      Đồ thị $(C)$ có tổng cộng $2$ đường tiệm cận (1 tiệm cận đứng, 1 tiệm cận ngang).
    ],
  )

  // ================= CÂU 12 =================
  #tn(
    [Cho mẫu số liệu ghép nhóm $M_1$ gồm 7 nhóm (các nhóm trong mẫu số liệu có độ dài bằng nhau), có phần tử đại diện của nhóm thứ 6 lớn hơn phần tử đại diện của nhóm thứ 4 một lượng là 4. Khoảng biến thiên của mẫu số liệu $M_1$ bằng:],
    (
      [$7$],
      True([$14$]),
      [$13$],
      [$16$],
    ),
    loigiai: [
      #ppgiai[
        Khoảng biến thiên của mẫu số liệu ghép nhóm $R$ được tính bằng hiệu giữa đầu mút phải của nhóm cuối cùng và đầu mút trái của nhóm đầu tiên.
        Nếu mẫu số liệu gồm $k$ nhóm liên tiếp có cùng độ dài $L$, thì khoảng biến thiên $R = k dot.c L$.
        Hiệu giữa phần tử đại diện của hai nhóm cách nhau $n$ nhóm là $n dot.c L$.
      ]
      #step[Tìm độ dài của một nhóm]
      Gọi $L$ là độ dài của mỗi nhóm ghép ($L > 0$).
      Theo bài ra, phần tử đại diện của nhóm thứ 6 lớn hơn phần tử đại diện của nhóm thứ 4 là $4$.
      Khoảng cách giữa hai nhóm này là 2 nhóm, do đó:
      $ 2L = 4 => L = 2 $

      #step[Tính khoảng biến thiên]
      Mẫu số liệu có tổng cộng 7 nhóm ghép có cùng độ dài $L = 2$.
      Khoảng biến thiên của mẫu số liệu này là:
      $ R = 7 dot.c L = 7 dot 2 = 14 $

      #step[Kết luận]
      Vậy khoảng biến thiên của mẫu số liệu $M_1$ là $14$.
    ],
  )


  #resetcau()
  #exam-part(
    [Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  )

  #ds(
    [Trong mặt phẳng toạ độ $O x y$, cho hàm số $y = x - 2027 ln(x - 1)$ có đồ thị $(C)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào đúng, mệnh đề nào sai?],
    (
      True([Tập xác định của hàm số là $D = (1; +infty)$.]),
      True([$f'(x) = 1 - frac(2027, x - 1)$.]),
      True([$(C)$ có đúng một điểm cực tiểu.]),
      True([Giá trị nhỏ nhất của $f(x)$ làm tròn kết quả đến hàng đơn vị là $-13406$.]),
    ),
    loigiai: [
      #ppgiai[
        - Tập xác định của hàm logarit $y = ln(u(x))$ là $u(x) > 0$.
        - Đạo hàm của hàm số cơ bản: $(ln u)' = u' / u$.
        - Tính đơn điệu, cực trị và giá trị nhỏ nhất được xác định thông qua việc giải phương trình $f'(x) = 0$ và lập bảng biến thiên.
      ]
      #step[Xét mệnh đề a]
      Điều kiện xác định của hàm số: $x - 1 > 0 <=> x > 1$.
      Vậy tập xác định $D = (1; +infty)$. Mệnh đề a) *Đúng*.

      #step[Xét mệnh đề b]
      Ta có $f'(x) = 1 - 2027 dot frac((x-1)', x-1) = 1 - frac(2027, x-1)$. Mệnh đề b) *Đúng*.

      #step[Xét mệnh đề c]
      $f'(x) = 0 <=> 1 - frac(2027, x-1) = 0 <=> x - 1 = 2027 <=> x = 2028$.
      Ta thấy $f'(x) < 0$ khi $x in (1; 2028)$ và $f'(x) > 0$ khi $x in (2028; +infty)$.
      Do đó hàm số đạt cực tiểu tại $x = 2028$.
      Hàm số có đúng một điểm cực tiểu. Mệnh đề c) *Đúng*.

      #step[Xét mệnh đề d]
      Tại $x = 2028$, hàm số đạt giá trị nhỏ nhất.
      $min f(x) = f(2028) = 2028 - 2027 ln(2028 - 1) = 2028 - 2027 ln(2027) approx -13406$. Mệnh đề d) *Đúng*.
    ],
  )

  #let hinh-suc-sac = align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let rc = 1.0
      let rm = 2.0
      let ro = 2.2
      let rb = 0.8 // Bán kính mặt đáy sau

      let C(i) = (calc.cos(90deg + i * 72deg) * rc, calc.sin(90deg + i * 72deg) * rc)
      let M(i) = (calc.cos(90deg + i * 72deg) * rm, calc.sin(90deg + i * 72deg) * rm)
      let O(i) = (calc.cos(90deg + 36deg + i * 72deg) * ro, calc.sin(90deg + 36deg + i * 72deg) * ro)
      let B(i) = (calc.cos(90deg + 36deg + i * 72deg) * rb, calc.sin(90deg + 36deg + i * 72deg) * rb)

      // Đổ bóng (Drop shadow) dưới gầm khối
      let shadow_pts = ()
      for i in range(5) {
        shadow_pts.push((M(i).at(0) + 0.15, M(i).at(1) - 0.25))
        shadow_pts.push((O(i).at(0) + 0.15, O(i).at(1) - 0.25))
      }
      line(..shadow_pts, close: true, fill: rgb(0, 0, 0, 40), stroke: none)

      // VẼ CÁC MẶT KHUẤT (NÉT ĐỨT SÂU BÊN TRONG)
      let back_center_pts = (B(0), B(1), B(2), B(3), B(4))
      line(..back_center_pts, close: true, stroke: (paint: rgb("808080"), thickness: 1.2pt, dash: "dashed"))

      for i in range(5) {
        let next_i = calc.rem(i + 1, 5)
        let pts = (B(i), B(next_i), O(next_i), M(next_i), O(i))
        line(..pts, close: true, stroke: (paint: rgb("808080"), thickness: 1.2pt, dash: "dashed"))
      }

      // Độ trong suốt để nhìn xuyên thấu (Glass effect)
      let alpha = "e6"

      // Gradient ánh sáng chiếu từ trên góc trái xuống
      let gradients = (
        gradient.linear(rgb("#ffffff" + alpha), rgb("#e6f2ff" + alpha), angle: 90deg),
        gradient.linear(rgb("#e6f2ff" + alpha), rgb("#b3d9ff" + alpha), angle: 162deg),
        gradient.linear(rgb("#b3d9ff" + alpha), rgb("#80bfff" + alpha), angle: 234deg),
        gradient.linear(rgb("#99ccff" + alpha), rgb("#66b3ff" + alpha), angle: 306deg),
        gradient.linear(rgb("#cce6ff" + alpha), rgb("#99ccff" + alpha), angle: 18deg),
      )

      // Các mặt xung quanh (hiển thị đè lên nét khuất)
      for i in range(5) {
        let next_i = calc.rem(i + 1, 5)
        let pts = (C(i), C(next_i), M(next_i), O(i), M(i))
        line(..pts, close: true, fill: gradients.at(i), stroke: 1.5pt + rgb("003366"))
      }

      // Mặt trung tâm
      let center_pts = (C(0), C(1), C(2), C(3), C(4))
      line(
        ..center_pts,
        close: true,
        fill: gradient.linear(rgb("#ffffff" + alpha), rgb("#cce6ff" + alpha), angle: 45deg),
        stroke: 1.5pt + rgb("003366"),
      )

      // Đánh số
      content((0, 0), text(size: 26pt, weight: "bold", fill: rgb("002244"))[5])

      let F(i) = (calc.cos(90deg + 36deg + i * 72deg) * 1.5, calc.sin(90deg + 36deg + i * 72deg) * 1.5)
      let labels = ("4", "3", "5", "3", "4")
      for i in range(5) {
        content(F(i), text(size: 16pt, weight: "bold", fill: rgb("002244"))[#labels.at(i)])
      }
    })
  ]

  #ds(
    [Người ta thiết kế một con súc sắc cân đối đồng chất có dạng đa diện 12 mặt đều, trên đó có ba mặt 3 chấm, bốn mặt 4 chấm và năm mặt 5 chấm.
      #v(0.5em)
      #hinh-suc-sac
      #v(0.5em)
      Tiến hành gieo ngẫu nhiên con súc sắc này hai lần liên tiếp. Gọi $A$ là biến cố lần thứ nhất xuất hiện mặt 5 chấm, $B$ là biến cố tổng số chấm ở hai lần gieo bằng 9.
      Hỏi trong các mệnh đề dưới đây, mệnh đề nào đúng, mệnh đề nào sai?],
    (
      True([$P(A) = 5/12$.]),
      True([$P(B|A) = 1/3$.]),
      [$P(B) = 5/24$.],
      [$P(A|B) = 7/24$.],
    ),
    loigiai: [
      #reset-step()
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let h = 2.4

          let node(pos, title, desc) = {
            let body = block(width: 7.2cm, fill: rgb("fffce6"), stroke: 1.2pt + rgb("cc9900"), radius: 5pt, inset: 8pt)[
              #align(center)[
                #text(weight: "bold", fill: rgb("996600"))[#title] \
                #v(0.2em)
                #text(size: 9.5pt)[#desc]
              ]
            ]
            content(pos, body)
          }

          let N1 = (0, 0)
          let N2 = (0, -3.2)
          let N3 = (0, -6.4)
          let N4 = (0, -9.6)

          node(N1, [B1: Xác suất cơ bản (Xét MĐ a)], [$P("Mặt 3")=1/4, P("Mặt 4")=1/3, P("Mặt 5")=5/12$ \ $=> P(A) = 5/12 =>$ Mệnh đề a) ĐÚNG])
          node(N2, [B2: Xác suất có đ/k (Xét MĐ b)], [Biết lần 1 ra 5, lần 2 phải ra 4 để tổng là 9 \ $=> P(B|A) = P("Mặt 4") = 1/3 =>$ MĐ b) ĐÚNG])
          node(N3, [B3: Xác suất tổng hợp (Xét MĐ c)], [Các cặp tổng bằng 9: $(4,5)$ và $(5,4)$ \ $=> P(B) = 2 times (1/3 times 5/12) = 5/18 neq 5/24 =>$ MĐ c) SAI])
          node(N4, [B4: Định lý Bayes (Xét MĐ d)], [$P(A|B) = P(A cap B) / P(B) = (5/36) / (5/18) = 1/2$ \ $1/2 neq 7/24 =>$ Mệnh đề d) SAI])

          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2.at(0), N2.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2.at(0), N2.at(1) - h / 2),
            (N3.at(0), N3.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N3.at(0), N3.at(1) - h / 2),
            (N4.at(0), N4.at(1) + h / 2 + 0.3),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
        })
      ]
      #v(0.5em)

      Xác suất mỗi lần gieo con súc sắc 12 mặt:
      - $P("mặt 3") = 3/12 = 1/4$

      - $P("mặt 4") = 4/12 = 1/3$
      - $P("mặt 5") = 5/12$

      #hinh-suc-sac

      Ta vẽ sơ đồ cây để biểu diễn các khả năng của hai lần gieo (chỉ xét các nhánh có thể tạo ra tổng bằng 9 hoặc liên quan đến biến cố $A$):

      #let tree = cetz.canvas(length: 1.5cm, {
        import cetz.draw: *

        // Root
        content((0, 0), [Gieo lần 1], name: "root")

        // Lần 1
        content((2.5, 3), [Mặt 3], name: "L1_3")
        content((2.5, 0), [Mặt 4], name: "L1_4")
        content((2.5, -3), [Mặt 5 ($A$)], name: "L1_5")

        // Lần 2 từ Mặt 3
        content((5.5, 4), [Mặt 3], name: "L1_3_2_3")
        content((5.5, 3), [Mặt 4], name: "L1_3_2_4")
        content((5.5, 2), [Mặt 5], name: "L1_3_2_5")

        // Lần 2 từ Mặt 4
        content((5.5, 1), [Mặt 3], name: "L1_4_2_3")
        content((5.5, 0), [Mặt 4], name: "L1_4_2_4")
        content((5.5, -1), [Mặt 5], name: "L1_4_2_5")

        // Lần 2 từ Mặt 5
        content((5.5, -2), [Mặt 3], name: "L1_5_2_3")
        content((5.5, -3), [Mặt 4], name: "L1_5_2_4")
        content((5.5, -4), [Mặt 5], name: "L1_5_2_5")

        // Results
        content((7.5, 4), [Tổng 6])
        content((7.5, 3), [Tổng 7])
        content((7.5, 2), [Tổng 8])

        content((7.5, 1), [Tổng 7])
        content((7.5, 0), [Tổng 8])
        content((7.5, -1), text(fill: blue)[*Tổng 9* ($B$)])

        content((7.5, -2), [Tổng 8])
        content((7.5, -3), text(fill: red)[*Tổng 9* ($B$)])
        content((7.5, -4), [Tổng 10])

        // Lần 1 Edges
        line("root", "L1_3", mark: (end: ">"), name: "e1_3")
        content("e1_3.mid", $1/4$, anchor: "south", angle: "e1_3", padding: 5pt)

        line("root", "L1_4", mark: (end: ">"), name: "e1_4", stroke: blue)
        content("e1_4.mid", text(fill: blue)[$1/3$], anchor: "south", angle: "e1_4", padding: 5pt)

        line("root", "L1_5", mark: (end: ">"), name: "e1_5", stroke: red)
        content("e1_5.mid", text(fill: red)[$5/12$], anchor: "north", angle: "e1_5", padding: 5pt)

        // Lần 2 Edges từ L1_3
        line("L1_3", "L1_3_2_3", mark: (end: ">"))
        content((4, 3.7), $1/4$)
        line("L1_3", "L1_3_2_4", mark: (end: ">"))
        content((4, 3.15), $1/3$)
        line("L1_3", "L1_3_2_5", mark: (end: ">"))
        content((4, 2.4), $5/12$)

        // Lần 2 Edges từ L1_4
        line("L1_4", "L1_4_2_3", mark: (end: ">"))
        content((4, 0.7), $1/4$)
        line("L1_4", "L1_4_2_4", mark: (end: ">"))
        content((4, 0.15), $1/3$)
        line("L1_4", "L1_4_2_5", mark: (end: ">"), stroke: blue)
        content((4, -0.4), text(fill: blue)[$5/12$])

        // Lần 2 Edges từ L1_5
        line("L1_5", "L1_5_2_3", mark: (end: ">"))
        content((4, -2.3), $1/4$)
        line("L1_5", "L1_5_2_4", mark: (end: ">"), stroke: red)
        content((4, -3.15), text(fill: red)[$1/3$])
        line("L1_5", "L1_5_2_5", mark: (end: ">"))
        content((4, -3.7), $5/12$)
      })

      #align(center)[#tree]

      #step[Xét mệnh đề a]
      Biến cố $A$ là lần thứ nhất xuất hiện mặt 5 chấm. Dựa vào sơ đồ, ta thấy $P(A) = 5/12$.
      Mệnh đề a) *Đúng*.

      #step[Xét mệnh đề b]
      Biến cố $B|A$ là xác suất tổng 2 lần bằng 9 biết rằng lần 1 đã ra mặt 5. Để tổng bằng 9, lần 2 bắt buộc phải ra mặt 4. Nhìn vào nhánh đỏ, xác suất ra mặt 4 ở lần 2 là $1/3$.
      Vậy $P(B|A) = 1/3$.
      Mệnh đề b) *Đúng*.

      #step[Xét mệnh đề c]
      Biến cố $B$ là tổng số chấm ở hai lần gieo bằng 9. Từ sơ đồ cây, biến cố này tương ứng với hai nhánh (Mặt 4 $->$ Mặt 5 và Mặt 5 $->$ Mặt 4):
      $ P(B) = (1/3 dot 5/12) + (5/12 dot 1/3) = 5/36 + 5/36 = 10/36 = 5/18 $
      Mệnh đề c) đưa ra $P(B) = 5/24$, do đó Mệnh đề c) *Sai*.

      #step[Xét mệnh đề d]
      Cần tính xác suất $P(A|B) = frac(P(A cap B), P(B))$.
      Biến cố $A cap B$ là lần 1 mặt 5 và tổng bằng 9. Từ sơ đồ, nhánh này có xác suất $P(A cap B) = 5/12 dot 1/3 = 5/36$.
      Vậy $P(A|B) = frac(5/36, 5/18) = 1/2$.
      Mệnh đề d) đưa ra $P(A|B) = 7/24$, do đó Mệnh đề d) *Sai*.
    ],
  )

  #ds(
    [
      Trong không gian $O x y z$, đơn vị dài trên mỗi trục là kilomet và đơn vị thời gian là giờ. Một máy bay không người lái (UAV) đang thực hiện nhiệm vụ trinh sát. Lúc bắt đầu ($t=0$), UAV xuất phát từ trạm điều khiển có tọa độ $A(2; 3; 0)$. Trong 3 giờ đầu tiên, UAV bay thẳng đều với vectơ vận tốc $vec(u) = (3; -4; 1)$. Sau đó, do nhận được lệnh chuyển hướng, UAV bay thẳng đều theo hướng mới với vectơ vận tốc $vec(v) = (5; -3; 1)$. Hỏi trong các mệnh đề dưới đây, mệnh đề nào đúng, mệnh đề nào sai?
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          // Axes
          line((0, 0), (-1.5, -1.5), mark: (end: ">"), name: "x")
          content("x.end", $x$, anchor: "east", padding: 5pt)

          line((0, 0), (4, 0), mark: (end: ">"), name: "y")
          content("y.end", $y$, anchor: "north", padding: 5pt)

          line((0, 0), (0, 3), mark: (end: ">"), name: "z")
          content("z.end", $z$, anchor: "west", padding: 5pt)

          content((0, 0), $O$, anchor: "north-east", padding: 5pt)

          // Points
          let A = (0.5, 0.2)
          let M = (2.5, 1.2) // Sau 3 giờ
          let N = (3.5, 2.5) // Theo v

          circle(A, radius: 1.5pt, fill: black)
          content(A, $A$, anchor: "south-east", padding: 3pt)

          // Vector u
          line(A, M, mark: (end: ">"), stroke: 1pt + blue, name: "vec_u")
          content("vec_u.mid", $vec(u)$, anchor: "north-west", padding: 3pt)

          // Dự định
          line(M, (3.5, 1.7), stroke: (dash: "dashed", paint: gray))

          // Vector v
          line(M, N, mark: (end: ">"), stroke: 1pt + red, name: "vec_v")
          content("vec_v.mid", $vec(v)$, anchor: "north-west", padding: 3pt)

          // Tiếp tục
          line(N, (4.2, 3.4), stroke: (dash: "dashed", paint: gray))
        })
      ]
    ],
    (
      True([Tốc độ bay của UAV trong 3 giờ đầu tiên là $sqrt(26)$ km/h.]),
      [Vị trí của UAV tại thời điểm $t = 3$ giờ là điểm $M(9; -12; 3)$.],
      True([Tọa độ của UAV sau 8 giờ kể từ lúc xuất phát là $(36; -24; 8)$.]),
      [Khi UAV đạt độ cao 10 km, khoảng cách lệch của nó so với vị trí nó sẽ đến nếu vẫn giữ nguyên hướng bay ban đầu (trong cùng một khoảng thời gian) là $sqrt(322) "km"$.],
    ),
    loigiai: [
      #reset-step()
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let h = 2.4

          let node(pos, title, desc) = {
            let body = block(width: 7.2cm, fill: rgb("f5f0ff"), stroke: 1.2pt + rgb("6600cc"), radius: 5pt, inset: 8pt)[
              #align(center)[
                #text(weight: "bold", fill: rgb("4c0099"))[#title] \
                #v(0.2em)
                #text(size: 9.5pt)[#desc]
              ]
            ]
            content(pos, body)
          }

          let N1 = (0, 0)
          let N2 = (0, -3.2)
          let N3 = (0, -6.4)
          let N4 = (0, -9.6)

          node(N1, [B1: Tốc độ ban đầu (Xét MĐ a)], [$|vec(u)| = sqrt(3^2 + (-4)^2 + 1^2) = sqrt(26)$ \ $=>$ Mệnh đề a) ĐÚNG])
          node(N2, [B2: Vị trí sau 3 giờ (Xét MĐ b)], [$M = A + 3vec(u) = (11; -9; 3)$ \ $(9;-12;3)$ chỉ là vectơ độ dời $=>$ MĐ b) SAI])
          node(N3, [B3: Vị trí sau 8 giờ (Xét MĐ c)], [$N = M + 5vec(v) = (36; -24; 8)$ \ $=>$ Mệnh đề c) ĐÚNG])
          node(N4, [B4: Khoảng cách lệch (Xét MĐ d)], [Tại độ cao $z=10$, thời gian bay là $10$ giờ. \ Dự định $P(32;-37;10)$, Thực tế $P'(46;-30;10)$ \ $=> |overrightarrow(P P')| = sqrt(245) neq sqrt(322) =>$ MĐ d) SAI])

          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2.at(0), N2.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2.at(0), N2.at(1) - h / 2),
            (N3.at(0), N3.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N3.at(0), N3.at(1) - h / 2),
            (N4.at(0), N4.at(1) + h / 2 + 0.3),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
        })
      ]
      #v(0.5em)

      #step[Xét mệnh đề a]
      Tốc độ bay của UAV chính là độ dài của vectơ vận tốc $vec(u)$.
      Ta có:
      $ |vec(u)| = sqrt(3^2 + (-4)^2 + 1^2) = sqrt(9 + 16 + 1) = sqrt(26) " (km/h)" $
      Mệnh đề a) *ĐÚNG*.

      #step[Xét mệnh đề b]
      Sau 3 giờ, vectơ độ dời (quãng đường và hướng) của UAV là:
      $ overrightarrow(A M) = 3 vec(u) = 3(3; -4; 1) = (9; -12; 3) $
      Vị trí hiện tại của UAV là điểm $M$, thỏa mãn hệ thức $M = A + overrightarrow(A M)$.
      Tọa độ của điểm $M$ là:
      $ M = (2+9; 3-12; 0+3) = (11; -9; 3) $
      Điểm $(9; -12; 3)$ ở đề bài chỉ là vectơ độ dời, không phải tọa độ vị trí.
      Mệnh đề b) *SAI*.

      #step[Xét mệnh đề c]
      Sau 8 giờ kể từ lúc xuất phát, UAV đã bay 3 giờ theo $vec(u)$ đến điểm $M(11; -9; 3)$ và bay thêm 5 giờ nữa theo $vec(v)$.
      Vectơ độ dời trong 5 giờ sau là:
      $ overrightarrow(M N) = 5 vec(v) = 5(5; -3; 1) = (25; -15; 5) $
      Vị trí của UAV lúc này là điểm $N$, thỏa mãn $N = M + overrightarrow(M N)$.
      Tọa độ điểm $N$ là:
      $ N = (11+25; -9-15; 3+5) = (36; -24; 8) $
      Mệnh đề c) *ĐÚNG*.

      #step[Xét mệnh đề d]
      Độ cao của UAV tương ứng với cao độ (tọa độ $z$). Ta cần xét khi UAV đạt độ cao $10$ km ($z = 10$).

      + *Khả năng 1 (Bay theo dự định ban đầu):*
        UAV luôn bay với vận tốc $vec(u) = (3; -4; 1)$, suy ra vận tốc theo trục $z$ là $v_z = 1 " km/h"$.
        Thời gian để đi từ độ cao ban đầu $z=0$ đến độ cao $z=10$ là:
        $ t_1 = 10 / 1 = 10 " (giờ)" $
        Vị trí dự định sẽ đến sau 10 giờ bay là điểm $P$:
        $ P = A + 10 vec(u) = (2+30; 3-40; 0+10) = (32; -37; 10) $

      + *Khả năng 2 (Thực tế bay đổi hướng):*
        Trong 3 giờ đầu, UAV đạt được độ cao $z=3$. Nó cần tăng thêm $7$ km độ cao nữa.
        Khi chuyển hướng, vận tốc bay mới là $vec(v) = (5; -3; 1)$, vận tốc theo trục $z$ vẫn là $v'_z = 1 " km/h"$.
        Thời gian cần để bay thêm đoạn này là:
        $ t_2 = 7 / 1 = 7 " (giờ)" $
        Tổng thời gian bay thực tế để đạt độ cao 10 km là $3 + 7 = 10$ giờ (bằng đúng thời gian dự định).
        Vị trí thực tế của UAV lúc này là điểm $P'$:
        $ P' = M + 7 vec(v) = (11+35; -9-21; 3+7) = (46; -30; 10) $

      + *Khoảng cách lệch:*
        Là độ dài đoạn thẳng $P P'$. Ta có vectơ độ lệch:
        $ overrightarrow(P P') = P' - P = (46-32; -30 - (-37); 10-10) = (14; 7; 0) $
        Độ lệch thực tế là:
        $ |overrightarrow(P P')| = sqrt(14^2 + 7^2 + 0^2) = sqrt(245) " (km)" neq sqrt(322) " (km)" $

        #align(center)[
          #cetz.canvas(length: 1cm, {
            import cetz.draw: *
            let A = (0, 0)
            let M = (1.5, -2)
            let P = (5, -6.67)
            let P_prime = (7.3, -5.5)

            circle(A, radius: 1.5pt, fill: black)
            content(A, $A$, anchor: "south-east", padding: 3pt)

            circle(M, radius: 1.5pt, fill: black)
            content(M, $M$, anchor: "north-east", padding: 3pt)

            circle(P, radius: 1.5pt, fill: black)
            content(P, $P ("Dự định")$, anchor: "north", padding: 3pt)

            circle(P_prime, radius: 1.5pt, fill: black)
            content(P_prime, $P' ("Thực tế")$, anchor: "west", padding: 3pt)

            line(A, M, mark: (end: ">"), stroke: 1.2pt + blue, name: "AM")
            content("AM.mid", $3 vec(u)$, anchor: "south-west", padding: 3pt)

            line(M, P, stroke: (dash: "dashed", paint: gray, thickness: 1.2pt), mark: (end: ">"), name: "MP")
            content("MP.mid", $7 vec(u)$, anchor: "north-east", padding: 3pt)

            line(M, P_prime, mark: (end: ">"), stroke: 1.2pt + red, name: "MP_prime")
            content("MP_prime.mid", $7 vec(v)$, anchor: "south-west", padding: 3pt)

            line(P, P_prime, stroke: 1.5pt + green.darken(20%), name: "PP")
            content("PP.mid", [Khoảng cách $P P'$], anchor: "north-west", padding: 3pt)
          })
        ]

      Vậy mệnh đề d) *SAI*.
    ],
  )

  #ds(
    [Một máy chủ bắt đầu quá trình truyền một tệp dữ liệu cho máy khách. Quá trình truyền bắt đầu từ trạng thái nghỉ, tốc độ truyền $v(t)$ (MB/s) tăng dần, sau đó duy trì ổn định và cuối cùng giảm dần đến khi quá trình hoàn tất (tốc độ truyền về $0$). Hàm tốc độ truyền phụ thuộc vào thời gian $t$ (giây) được cho bởi:
      $
        v(t) = cases(
          a t^2 + b & quad \, 0 leq t < 20,
          20 & quad\, 20 leq t leq 60,
          m t + n & quad\, 60 leq t leq 100
        )
      $
      (Biết rằng hàm $v(t)$ liên tục trên đoạn $[0; 100]$). Hỏi trong các mệnh đề dưới đây, mệnh đề nào đúng, mệnh đề nào sai?],
    (
      True([$a = 0,05; b = 0$.]),
      True([Dung lượng dữ liệu truyền được trong 20 giây đầu tiên xấp xỉ 133 MB (làm tròn kết quả đến hàng đơn vị).]),
      [Dung lượng dữ liệu truyền được tính từ lúc bắt đầu đến ngay trước khi tốc độ bị giảm xuống lớn hơn 1000 MB.],
      True([Tổng dung lượng của tệp dữ liệu đã truyền xong là 1333 MB (làm tròn kết quả đến hàng đơn vị).]),
    ),
    loigiai: [
      #reset-step()
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let h = 2.4

          let node(pos, title, desc) = {
            let body = block(width: 7.2cm, fill: rgb("fff5f5"), stroke: 1.2pt + rgb("cc0000"), radius: 5pt, inset: 8pt)[
              #align(center)[
                #text(weight: "bold", fill: rgb("990000"))[#title] \
                #v(0.2em)
                #text(size: 9.5pt)[#desc]
              ]
            ]
            content(pos, body)
          }

          let N1 = (0, 0)
          let N2 = (0, -3.2)
          let N3 = (0, -6.4)
          let N4 = (0, -9.6)

          node(N1, [B1: Tìm hàm vận tốc (Xét MĐ a)], [Sử dụng tính liên tục của $v(t)$: \ $=> a=0.05, b=0, m=-0.5, n=50$])
          node(N2, [B2: Dung lượng GĐ1 (Xét MĐ b)], [$S_1 = int_0^20 0.05t^2 d t approx 133.33$ MB])
          node(N3, [B3: Lượng truyền trước khi giảm (Xét MĐ c)], [$S_2 = 20 times 40 = 800 => S_1+S_2 < 1000$ MB])
          node(N4, [B4: Tổng dung lượng (Xét MĐ d)], [$S_3 = int_60^100 v(t) d t = 400 => S_"Tổng" approx 1333$ MB])

          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2.at(0), N2.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2.at(0), N2.at(1) - h / 2),
            (N3.at(0), N3.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N3.at(0), N3.at(1) - h / 2),
            (N4.at(0), N4.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
        })
      ]
      #v(0.5em)

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          // Scale: x-axis 1 unit = 10s. y-axis 1 unit = 5 m/s.
          // x goes from 0 to 11. y goes from 0 to 5.

          // Grid
          grid(
            (0, 0),
            (10.5, 4.5),
            step: 1,
            stroke: luma(230),
          )

          // Axes
          line((-0.2, 0), (11, 0), mark: (end: ">"), name: "t")
          content("t.end", $t (s)$, anchor: "north", padding: 5pt)

          line((0, -0.2), (0, 5), mark: (end: ">"), name: "v")
          content("v.end", $v ("MB/s")$, anchor: "east", padding: 5pt)
          content((0, 0), $O$, anchor: "north-east", padding: 5pt)

          // Ticks x
          for i in (2, 6, 10) {
            line((i, -0.1), (i, 0.1))
            content((i, -0.3), str(i * 10))
          }

          // Ticks y
          for i in (4,) {
            line((-0.1, i), (0.1, i))
            content((-0.3, i), str(i * 5))
          }

          // Plotting
          let pts1 = ()
          for i in range(0, 21) {
            let x = i / 10
            let y = x * x
            pts1.push((x, y))
          }
          line(..pts1, stroke: 1.5pt + blue)

          // 20 to 60
          line((2, 4), (6, 4), stroke: 1.5pt + red)

          // 60 to 100
          line((6, 4), (10, 0), stroke: 1.5pt + green.darken(20%))

          // Dashed lines
          line((2, 0), (2, 4), stroke: (dash: "dashed", paint: gray))
          line((6, 0), (6, 4), stroke: (dash: "dashed", paint: gray))
          line((0, 4), (2, 4), stroke: (dash: "dashed", paint: gray))

          // Areas annotations
          content((1.3, 1), text(fill: blue)[$S_1$])
          content((4, 2), text(fill: red)[$S_2$])
          content((8, 1.3), text(fill: green.darken(20%))[$S_3$])
        })
      ]

      Vì tốc độ truyền là hàm liên tục theo thời gian:
      - Quá trình bắt đầu từ trạng thái nghỉ nên $v(0) = 0 => b = 0$.
      - Tại $t = 20$: $a(20)^2 + b = 20 => 400a = 20 => a = 0,05$.
      - Tại $t = 60$: $m(60) + n = 20$.
      - Quá trình kết thúc tại $t = 100$: $m(100) + n = 0$.
      Giải hệ ta được: $-40m = 20 => m = -0,5$ và $n = 50$.

      #step[Xét mệnh đề a]
      $a = 0,05; b = 0$. Mệnh đề a) ĐÚNG.

      #step[Xét mệnh đề b]
      $S_1 = int_0^20 (0,05 t^2) d t = 0,05 [t^3/3]_0^20 = 0,05 dot 8000/3 = 400/3 approx 133,33 "MB"$. Mệnh đề b) ĐÚNG.

      #step[Xét mệnh đề c]
      Dung lượng truyền được với tốc độ ổn định (từ 20s đến 60s) là $S_2 = 20 dot 40 = 800 "MB"$.
      Tổng dung lượng truyền được trước khi giảm tốc độ: $S' = S_1 + S_2 = 133,33 + 800 = 933,33 "MB"$. Nhỏ hơn 1000 MB. Mệnh đề c) SAI.

      #step[Xét mệnh đề d]
      Dung lượng giai đoạn tốc độ giảm (từ 60s đến 100s):
      $S_3 = int_60^100 (-0,5 t + 50) d t = 1/2 dot 20 dot 40 = 400 "MB"$.
      Tổng dung lượng $S = S_1 + S_2 + S_3 = 133,33 + 800 + 400 = 1333,33 "MB"$. Mệnh đề d) ĐÚNG.
    ],
  )

  #exam-part([Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], reset-counter: true)

  #tln(
    [Cho hình lăng trụ $A B C.A' B' C'$ có $A A' = 8, A B = 6, A C = 8, hat(B A C) = 45^circ$. Biết hình chiếu vuông góc của đỉnh $A$ lên mặt phẳng $(A' B' C')$ là trung điểm của cạnh $B' C'$. Hãy tính thể tích khối lăng trụ $A B C.A' B' C'$ (không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng phần mười)?],
    "79,7",
    loigiai: [
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let M_prime = (0, 0)
          let B_prime = (-2.5, 0)
          let C_prime = (2.5, 0)
          let A_prime = (-1, -1.5)
          let A = (0, 4)

          let vec = (A.at(0) - A_prime.at(0), A.at(1) - A_prime.at(1))
          let B = (B_prime.at(0) + vec.at(0), B_prime.at(1) + vec.at(1))
          let C = (C_prime.at(0) + vec.at(0), C_prime.at(1) + vec.at(1))

          // Vẽ các cạnh đáy
          line(B_prime, C_prime, stroke: (dash: "dashed", paint: gray))
          line(A_prime, B_prime, stroke: 1pt)
          line(A_prime, C_prime, stroke: 1pt)

          // Vẽ các cạnh bên
          line(A_prime, A, stroke: 1pt)
          line(B_prime, B, stroke: 1pt)
          line(C_prime, C, stroke: 1pt)

          // Vẽ các cạnh trên
          line(A, B, stroke: 1pt)
          line(B, C, stroke: 1pt)
          line(C, A, stroke: 1pt)

          // Trục tọa độ
          line(M_prime, A, stroke: (dash: "dashed", paint: red))
          line(A, (0, 5), mark: (end: ">"), stroke: blue)
          content((0, 5), $z$, anchor: "west", padding: 3pt)

          line(M_prime, (3.5, 0), mark: (end: ">"), stroke: blue)
          content((3.5, 0), $x$, anchor: "south", padding: 3pt)

          line(M_prime, (-1.5, -2.25), mark: (end: ">"), stroke: blue)
          content((-1.5, -2.25), $y$, anchor: "east", padding: 3pt)

          circle(M_prime, radius: 1.5pt, fill: black)
          content(M_prime, $M' (O)$, anchor: "north-west", padding: 3pt)

          let pts = (
            (A, "A", "south-east"),
            (B, "B", "east"),
            (C, "C", "west"),
            (A_prime, "A'", "north"),
            (B_prime, "B'", "east"),
            (C_prime, "C'", "west"),
          )
          for (p, n, a) in pts {
            circle(p, radius: 1.5pt, fill: black)
            content(p, $#n$, anchor: a, padding: 3pt)
          }
        })
      ]

      *Giải bằng phương pháp tọa độ (Descartes):*
      - Chọn hệ trục tọa độ $O x y z$ với gốc tọa độ $O$ trùng với trung điểm $M'$ của $B'C'$.
      - Trục $O x$ dọc theo đường thẳng $B'C'$ (tia $O x$ chứa $C'$), trục $O z$ thẳng đứng đi qua $A$ (vì hình chiếu của $A$ lên $(A'B'C')$ là $M'$). Trục $O y$ vuông góc với $O x, O z$ tạo thành tam diện thuận.
      - Khi đó tọa độ $A$ là $A(0; 0; h)$ với $h$ là đường cao lăng trụ.
      - Trong mặt phẳng đáy $(O x y)$, tam giác $A'B'C'$ có $hat(B'A'C') = 45^circ, A'B'=6, A'C'=8$.
      Diện tích đáy $S_(A' B' C') = 1/2 A'B' dot A'C' sin 45^circ = 12 sqrt(2)$.
      Độ dài $B'C'^2 = A'B'^2 + A'C'^2 - 2 A'B' dot A'C' cos 45^circ = 100 - 48 sqrt(2)$.
      - Do $M'(0;0;0)$ là trung điểm $B'C'$, độ dài trung tuyến $A'M'$ của $Delta A'B'C'$ là:
      $ (A'M')^2 = frac(2(A'B'^2 + A'C'^2) - B'C'^2, 4) = frac(2(36+64) - (100 - 48 sqrt(2)), 4) = 25 + 12 sqrt(2) $
      Gọi $A'(x_(A'); y_(A'); 0)$, ta có $x_(A')^2 + y_(A')^2 = (A'M')^2 = 25 + 12 sqrt(2)$.
      - Ta có độ dài cạnh bên $A A' = 8$. Xét điểm $A(0; 0; h)$:
      $ overrightarrow(A'A) = (-x_(A'); -y_(A'); h) => A A'^2 = x_(A')^2 + y_(A')^2 + h^2 = 25 + 12 sqrt(2) + h^2 $
      $ => 64 = 25 + 12 sqrt(2) + h^2 => h^2 = 39 - 12 sqrt(2) => h = sqrt(39 - 12 sqrt(2)) $
      - Thể tích khối lăng trụ là:
      $ V = S_(A' B' C') dot h = 12 sqrt(2) dot sqrt(39 - 12 sqrt(2)) = 12 sqrt(78 - 24 sqrt(2)) approx 79,7. $
    ],
  )

  #tln(
    [Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là kilômét với mặt đất là mặt phẳng $(O x y)$, một trạm phát sóng có mặt cầu mô tả ranh giới phủ sóng là $(S) : (x-2)^2 + (y-3)^2 + (z-0,4)^2 = 16$. Hãy tính theo đơn vị $k m^2$ diện tích vùng phủ sóng trên mặt đất phẳng của trạm phát sóng này (không làm tròn ở các phép tính trung gian và làm tròn kết quả cuối cùng đến hàng phần mười)?],
    "49,8",
    loigiai: [
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let I = (0, 0.8)
          let H = (0, 0)
          let R = 3.2
          let rx = 3.1
          let ry = 1.0

          // Mặt phẳng (Oxy)
          let P1 = (-5, -2)
          let P2 = (4.5, -2)
          let P3 = (5.5, 2.5)
          let P4 = (-4, 2.5)
          line(P1, P2, P3, P4, close: true, fill: rgb(200, 200, 200, 20), stroke: 0.5pt + gray)
          content(P4, [$(O x y)$ (mặt đất)], anchor: "south-west", padding: 5pt)

          // Vùng phủ sóng (Thiết diện)
          circle(H, radius: (rx, ry), fill: rgb(255, 0, 0, 30), stroke: 1.5pt + red)

          // Đường tròn lớn mặt cầu
          circle(I, radius: R, stroke: 1pt + blue)

          // Xích đạo của mặt cầu
          let left_edge = (I.at(0) - R, I.at(1))
          let right_edge = (I.at(0) + R, I.at(1))
          arc(left_edge, start: 180deg, stop: 360deg, radius: (R, R * 0.3), stroke: 1pt + blue)
          arc(right_edge, start: 0deg, stop: 180deg, radius: (R, R * 0.3), stroke: (dash: "dashed", paint: blue))

          // Các tâm
          circle(I, radius: 1.5pt, fill: black)
          content(I, $I$, anchor: "south", padding: 3pt)
          circle(H, radius: 1.5pt, fill: black)
          content(H, $H$, anchor: "north-west", padding: 3pt)

          line(I, H, stroke: (dash: "dashed"))

          let M = (rx, 0)
          circle(M, radius: 1.5pt, fill: black)
          content(M, $M$, anchor: "west", padding: 3pt)
          line(H, M, stroke: 1pt)
          content((rx / 2, 0), $r$, anchor: "north", padding: 3pt)

          line(I, M, stroke: 1pt)
          content((rx / 2, 0.6), $R$, anchor: "south-west", padding: 3pt)

          // Góc vuông
          line((0.3, 0), (0.3, 0.3), (0, 0.3))
        })
      ]

      *Giải bằng phương pháp tọa độ (Descartes):*
      Mặt phẳng mặt đất là $(O x y)$ có phương trình $z = 0$.
      Vùng phủ sóng trên mặt đất là thiết diện của mặt cầu $(S)$ cắt bởi mặt phẳng $z = 0$.
      Thay $z = 0$ vào phương trình mặt cầu $(S)$:
      $ (x-2)^2 + (y-3)^2 + (0 - 0,4)^2 = 16 <=> (x-2)^2 + (y-3)^2 = 15,84 $
      Thiết diện là một hình tròn có bán kính $R$ thỏa mãn $R^2 = 15,84$.
      Diện tích vùng phủ sóng là:
      $ S = pi R^2 = 15,84 pi approx 49,8 "km"^2. $
    ],
  )
  #tln(
    [Một Robot xuất phát tại gốc tọa độ $O(0)$ trên trục số $O x$. Ở mỗi bước, hệ thống gieo một con xúc xắc cân đối để xác định hướng đi: nếu số chấm $k in {1; 2}$ Robot tiến tới 1 đơn vị (cộng 1 vào tọa độ); nếu $k in {3; 4}$ Robot lùi lại 1 đơn vị (trừ 1 vào tọa độ); nếu $k in {5; 6}$ Robot đứng im. Robot thực hiện 2 bước di chuyển liên tiếp. Biết rằng sau 2 bước, tọa độ của Robot là một *số chẵn* (bao gồm cả số 0). Tính xác suất để Robot quay trở lại *đúng gốc tọa độ $O$*.],
    [0.6],
    loigiai: [
      #reset-step()
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let h = 2.4

          let node(pos, title, desc) = {
            let body = block(width: 7.2cm, fill: rgb("e6f9ff"), stroke: 1.2pt + rgb("0088cc"), radius: 5pt, inset: 8pt)[
              #align(center)[
                #text(weight: "bold", fill: rgb("004466"))[#title] \
                #v(0.2em)
                #text(size: 9.5pt)[#desc]
              ]
            ]
            content(pos, body)
          }

          let N1 = (0, 0)
          let N2 = (0, -3.2)
          let N3 = (0, -6.4)
          let N4 = (0, -9.6)

          node(N1, [B1: Nhận diện biến cố], [$X$: Tọa độ chẵn, $Y$: Tọa độ $0$ \ Cần tính $P(Y|X) = P(X inter Y) / P(X)$])
          node(N2, [B2: Xác suất mỗi bước], [Tiến ($+1$), Lùi ($-1$), Đứng ($0$) \ đều có xác suất $1/3$])
          node(N3, [B3: Lập sơ đồ không gian mẫu], [Vẽ sơ đồ cây 2 bước để đếm số \ nhánh tọa độ chẵn và tọa độ $0$])
          node(N4, [B4: Tổng hợp xác suất], [$P(X)=5/9, P(X inter Y)=3/9$ \ $=> P(Y|X) = 3/5 = 0.6$])

          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2.at(0), N2.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2.at(0), N2.at(1) - h / 2),
            (N3.at(0), N3.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N3.at(0), N3.at(1) - h / 2),
            (N4.at(0), N4.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
        })
      ]
      #v(0.5em)

      #step[
        Gọi $X$ là biến cố "Sau 2 bước, tọa độ Robot là số chẵn ($... , -2, 0, 2, ...$)" và $Y$ là biến cố "Tọa độ Robot bằng $0$". Cần tính $P(Y | X) = (P(X inter Y)) / P(X)$.

        Vì 6 mặt chia đều cho 3 hành động, xác suất *mỗi bước* đều là $1/3$:
        - *KN1:* Tiến $+1$ (Xác suất $1/3$).
        - *KN2:* Lùi $-1$ (Xác suất $1/3$).
        - *KN3:* Đứng im $+0$ (Xác suất $1/3$).
      ]

      #step[
        *Sơ đồ cây biểu diễn tọa độ Robot sau 2 bước:*
        #v(0.5em)
        #align(center)[
          #canvas(length: 1cm, {
            import draw: *
            let edge-style = (mark: (end: ">", fill: black), stroke: 0.7pt)
            let lbl(txt) = box(fill: white, inset: 1pt, txt)

            let p1_1 = (3.5, 4.5)
            let p1_2 = (3.5, 0)
            let p1_3 = (3.5, -4.5)

            content((0, 0), box(stroke: 1pt + black, inset: 5pt, radius: 4pt)[Vị trí (0)], name: "N0")
            content(p1_1, align(center)[*KN1* \ ($+1$)], name: "N1_1")
            content(p1_2, align(center)[*KN2* \ ($-1$)], name: "N1_2")
            content(p1_3, align(center)[*KN3* \ ($+0$)], name: "N1_3")

            line("N0", "N1_1", ..edge-style)
            content((1.75, 2.75), lbl[$1/3$])
            line("N0", "N1_2", ..edge-style)
            content((1.75, 0), lbl[$1/3$])
            line("N0", "N1_3", ..edge-style)
            content((1.75, -2.85), lbl[$1/3$])

            // Từ KN1 (Đang ở +1)
            line("N1_1", (7.0, 6.0), ..edge-style)
            content((5.25, 5.6), lbl[$1/3$])
            content((7.2, 6.0), [*KN1* $arrow$ Cuối: $+2$ #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
            line("N1_1", (7.0, 4.5), ..edge-style)
            content((5.25, 4.4), lbl[$1/3$])
            content(
              (7.2, 4.5),
              [*KN2* $arrow$ Cuối: $0$ #h(2pt) #text(fill: blue, weight: "bold")[(=0)]],
              anchor: "west",
            )
            line("N1_1", (7.0, 3.0), ..edge-style)
            content((5.25, 3.25), lbl[$1/3$])
            content((7.2, 3.0), [*KN3* $arrow$ Cuối: $+1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

            // Từ KN2 (Đang ở -1)
            line("N1_2", (7.0, 1.5), ..edge-style)
            content((5.25, 0.8 + .3), lbl[$1/3$])
            content(
              (7.2, 1.5),
              [*KN1* $arrow$ Cuối: $0$ #h(2pt) #text(fill: blue, weight: "bold")[(=0)]],
              anchor: "west",
            )
            line("N1_2", (7.0, 0), ..edge-style)
            content((5.25, 0.1 - .2), lbl[$1/3$])
            content((7.2, 0), [*KN2* $arrow$ Cuối: $-2$ #h(2pt) #text(fill: green)[(Chẵn)]], anchor: "west")
            line("N1_2", (7.0, -1.5), ..edge-style)
            content((5.25, -0.5 - .8), lbl[$1/3$])
            content((7.2, -1.5), [*KN3* $arrow$ Cuối: $-1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")

            // Từ KN3 (Đang ở 0)
            line("N1_3", (7.0, -3.0), ..edge-style)
            content((5.25, -3.7 + .3), lbl[$1/3$])
            content((7.2, -3.0), [*KN1* $arrow$ Cuối: $+1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
            line("N1_3", (7.0, -4.5), ..edge-style)
            content((5.25, -4.4 - .2), lbl[$1/3$])
            content((7.2, -4.5), [*KN2* $arrow$ Cuối: $-1$ #h(2pt) #text(fill: red)[(Loại)]], anchor: "west")
            line("N1_3", (7.0, -6.0), ..edge-style)
            content((5.25, -5.1 - .8), lbl[$1/3$])
            content(
              (7.2, -6.0),
              [*KN3* $arrow$ Cuối: $0$ #h(2pt) #text(fill: blue, weight: "bold")[(=0)]],
              anchor: "west",
            )
          })
        ]
      ]

      #step[
        Tất cả 9 nhánh đều có xác suất bằng nhau là $1/3 times 1/3 = 1/9$.

        Số nhánh thỏa mãn biến cố $X$ (tọa độ chẵn) gồm 2 nhánh Xanh lá ($+2, -2$) và 3 nhánh Xanh dương ($0$):
        $ P(X) = 5 times 1/9 = 5/9 $

        Trong 5 nhánh đó, số nhánh nằm ngay tại $0$ (biến cố $X inter Y$, màu xanh dương) là 3 nhánh:
        $ P(X inter Y) = 3 times 1/9 = 3/9 $
      ]

      #step[
        Xác suất cần tìm dưới dạng số thập phân là:
        $ P(Y | X) = (P(X inter Y)) / P(X) = (3/9) / (5/9) = 3/5 = 0.6 $
      ]
    ],
  )

  #tln(
    id: "CD-KT-04",
    [Một doanh nghiệp khai thác khoáng sản ước tính rằng nếu sản xuất $q$ tấn quặng mỗi ngày thì chi phí vận hành là $C(q) = q^2 + 10q + 100$ (triệu đồng). Giá bán quặng cố định trên thị trường là $50$ triệu đồng/tấn (tức doanh thu thô hằng ngày là $50q$ triệu đồng). Để kiểm soát tài nguyên môi trường, chính phủ áp dụng thuế suất lũy tiến lên doanh thu hằng ngày của doanh nghiệp như sau:
      - Đối với phần doanh thu không vượt quá $600$ triệu đồng: Thuế suất là $10\%$.
      - Đối với phần doanh thu vượt trên mức $600$ triệu đồng: Thuế suất cho phần vượt là $25\%$.

      Tìm sản lượng khai thác $q$ (tấn) hằng ngày để lợi nhuận ròng sau thuế của doanh nghiệp đạt giá trị lớn nhất. _Kết quả làm tròn đến hàng phần mười._],
    [$13.8$],
    loigiai: [
      #reset-step()

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let h = 2.4

          let node(pos, title, desc) = {
            let body = block(width: 6.8cm, fill: rgb("f0f8ff"), stroke: 1.2pt + rgb("0066cc"), radius: 5pt, inset: 8pt)[
              #align(center)[
                #text(weight: "bold", fill: rgb("003399"))[#title] \
                #v(0.2em)
                #text(size: 9.5pt)[#desc]
              ]
            ]
            content(pos, body)
          }

          let N1 = (0, 0)
          let N2 = (0, -3.2)
          let N3a = (-3.6, -6.4)
          let N3b = (3.6, -6.4)
          let N4 = (0, -9.6)

          node(N1, [B1: Doanh thu & Chi phí], [Doanh thu: $R(q)=50q$ \ Chi phí: $C(q)=q^2+10q+100$])
          node(N2, [B2: Tìm mốc thuế suất], [Thuế suất đổi tại $R(q)=600$ \ $=> q = 12$])
          node(N3a, [B3a: Xét miền $q leq 12$], [Thuế 10%. Lợi nhuận $P_1(q)$. \ $=> max P_1 = P_1(12) = 176$])
          node(N3b, [B3b: Xét miền $q > 12$], [Thuế 25% vượt mốc. Hàm $P_2(q)$. \ $=> max P_2 = P_2(13.75) approx 179.06$])
          node(
            N4,
            [B4: So sánh & Kết luận],
            [Max toàn cục $179.06$ tại $q=13.75$ \ $=> q approx 13.8$],
          )

          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2.at(0), N2.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2.at(0), N2.at(1) - h / 2),
            (N2.at(0), -3.5),
            (N3a.at(0), -3.5),
            (N3a.at(0), N3a.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2.at(0), -3.5),
            (N3b.at(0), -3.5),
            (N3b.at(0), N3b.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N3a.at(0), N3a.at(1) - h / 2),
            (N3a.at(0), -6.2),
            (0, -6.2),
            (0, N4.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line((N3b.at(0), N3b.at(1) - h / 2), (N3b.at(0), -6.2), (0, -6.2), stroke: 1.2pt + gray)
        })
      ]
      #v(0.5em)

      #step[
        *Nhận diện dạng toán.*

        Đây là dạng *lợi nhuận ròng phân đoạn có điểm gãy do thuế lũy tiến*. Với dạng này, ta luôn phải:
        - tìm mốc sản lượng làm đổi thuế suất,
        - lập hàm lợi nhuận theo từng đoạn,
        - đạo hàm từng đoạn,
        - rồi so sánh thêm tại chính điểm gãy.
      ]
      #step[
        *Đặt biến và tìm mốc chia miền.*

        Gọi $q$ là sản lượng quặng khai thác mỗi ngày, với $q >= 0$.

        Doanh thu là $50q$ (triệu đồng). Mốc thuế đổi tại doanh thu $600$ triệu nên ta giải:
        $
          50q = 600
          quad arrow.double quad
          q = 12.
        $

        Vì vậy, ta phải xét riêng hai miền:
        $
          [0, 12] quad "và" quad (12, +oo).
        $
      ]
      #step[
        *Lập hàm thuế và hàm lợi nhuận ròng.*

        Thuế phải nộp theo doanh thu là:
        - Nếu $q <= 12$:
          $
            T(q) = 10\% dot 50q = 5q.
          $
        - Nếu $q > 12$:
          $
            T(q) = 0.1 dot 600 + 0.25(50q - 600) = 12.5q - 90.
          $

        Do đó lợi nhuận ròng sau thuế là:
        $
          P(q) = 50q - (q^2 + 10q + 100) - T(q)
        $
        $
          = cases(
            -q^2 + 35q - 100 & "nếu" 0 <= q <= 12,
            -q^2 + 27.5q - 10 & "nếu" q > 12
          )
        $
      ]
      #step[
        *Khảo sát từng miền rồi so sánh toàn cục.*

        - *Trên đoạn $[0, 12]$*
          $
            P_1'(q) = -2q + 35.
          $
          Với mọi $q in [0, 12]$ ta có $P_1'(q) >= 11 > 0$, nên $P_1$ tăng trên $[0, 12]$.

          #align(center)[
            #bbbt(
              var: $q$,
              der: $P_1'(q)$,
              func: $P_1(q)$,
              x-vals: ($0$, $12$),
              d-signs: ($+$,),
              v-vals: ($-100$, $176$),
            )
          ]

          Vậy giá trị lớn nhất trên đoạn này là:
          $
            P_1(12) = 176.
          $

        - *Trên khoảng $(12, +oo)$*
          $
            P_2'(q) = -2q + 27.5.
          $
          $
            P_2'(q) = 0
            quad arrow.double quad
            q = 13.75.
          $

          #align(center)[
            #bbt-opt(
              var: $q$,
              der: $P_2'(q)$,
              func: $P_2(q)$,
              x-vals: ($12$, $13.75$, $+oo$),
              d-signs: ($+$, $0$, $-$),
              v-vals: ($176$, $179.0625$, $-oo$),
              is-min: false,
            )
          ]

          Do đó giá trị lớn nhất trên miền này là:
          $
            P_2(13.75) = 179.0625.
          $

        So sánh hai ứng viên toàn cục:
        $
          179.0625 > 176.
        $

        Vậy lợi nhuận ròng sau thuế đạt lớn nhất tại $q = 13.8$ tấn.
      ]
    ],
  )
  #tln(
    [Một xưởng sản xuất thiết bị thể thao đúc một con lăn massage bằng nhựa khối. Con lăn có dạng khối tròn xoay quanh trục $O x$ (chiều dài từ $x = 0$ đến $x = 4$ cm), với cấu trúc rỗng xuyên tâm là một lỗ hình trụ bán kính $r = 1$ cm. Mặt ngoài của con lăn có các rãnh lồi lõm được tạo bởi hai đường cong ghép trơn với nhau:
      - Khúc lồi (nằm ở hai đầu) là đường lượng giác $ (T): y = 4 + cos((pi x)/2) $ (giới hạn từ $x=0$ đến $x=1$ và từ $x=3$ đến $x=4$). 
      - Khúc lõm sâu ở giữa là một đường Parabol $ (P): y = a x^2 + b x + c $ (giới hạn từ $x=1$ đến $x=3$).
      Biết đường Lượng giác và đường Parabol ghép nối hoàn hảo với nhau (tiếp xúc trơn) tại điểm $x=1$ và $x=3$. Tìm hệ số của Parabol, sau đó sử dụng máy tính Casio để tính thể tích phần nhựa (vật liệu đặc) cấu tạo nên con lăn massage này (đơn vị: $upright("cm")^3$, _làm tròn đến hàng đơn vị_).],
    [199],
    loigiai: [
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let h = 2.4

          let node(pos, title, desc) = {
            let body = block(width: 7.2cm, fill: rgb("f0f8ff"), stroke: 1.2pt + rgb("0055cc"), radius: 5pt, inset: 8pt)[
              #align(center)[
                #text(weight: "bold", fill: rgb("003399"))[#title] \
                #v(0.2em)
                #text(size: 9.5pt)[#desc]
              ]
            ]
            content(pos, body)
          }

          let N1 = (0, 0)
          let N2 = (-3.8, -3.2)
          let N3 = (3.8, -3.2)
          let N4 = (0, -6.4)
          let N5 = (0, -9.6)

          node(N1, [B1: Khảo sát điểm ghép $(x=1)$], [Tính $y_1(1) = 4$ và $y'_1(1) = -pi/2$])
          node(
            N2,
            [B2: ĐK của Parabol $(P)$],
            [Đáy lõm tại $x=2 => y'_2(2)=0$ \ Tiếp xúc trơn tại $x=1 => y'_2(1)=-pi/2$],
          )
          node(
            N3,
            [B3: Tìm hàm số $(P)$],
            [Từ ĐK B2 và đi qua điểm $(1; 4)$ \ $=> y_2(x) = (pi/4)x^2 - pi x + 4 + (3pi)/4$],
          )
          node(
            N4,
            [B4: Thiết lập tích phân],
            [$V = V_"Ngoài" - V_"Lỗ rỗng"$ \ $=> V = pi int_0^4 y_"Ngoài"^2 d x - pi int_0^4 1^2 d x$],
          )
          node(N5, [B5: Tính kết quả], [Bấm tích phân trên máy tính \ $V approx 199.385 => 199 ("cm"^3)$])

          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2.at(0), N2.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2.at(0) + 3.4, N2.at(1)),
            (N3.at(0) - 3.4, N3.at(1)),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N3.at(0), N3.at(1) - h / 2),
            (N4.at(0), N4.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N4.at(0), N4.at(1) - h / 2),
            (N5.at(0), N5.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
        })
      ]
      #v(0.5em)
      #step[Tại điểm ghép $x = 1$, đường Lượng giác có toạ độ: $y_1(1) = 4 + cos(pi/2) = 4$. Đạo hàm $y'_1 = -pi/2 sin((pi x)/2) => y'_1(1) = -pi/2$.]
      #step[Parabol $(P): y_2 = a x^2 + b x + c => y'_2 = 2a x + b$. Parabol đối xứng qua $x = 2$ (đáy rãnh lõm) nên $y'_2(2) = 0 => 4a + b = 0$.
        Mặt khác $(P)$ tiếp xúc trơn với $(T)$ tại $x = 1$ nên $y'_2(1) = -pi/2 => 2a + b = -pi/2$.]
      #step[Giải hệ hai đạo hàm ta được $2a = pi/2 => a = pi/4$ và $b = -pi$.
        Tại $x = 1$, ta có $y_2(1) = 4 => pi/4 - pi + c = 4 => c = 4 + (3pi)/4$.
        Vậy phương trình rãnh lõm là $(P): y_2 = (pi/4)x^2 - pi x + 4 + (3pi)/4$.]
      #step[Phần lỗ rỗng xuyên tâm của con lăn là một hình trụ bán kính $r=1$ trải dài từ $x=0$ đến $x=4$.]
      #step[Thiết lập tích phân tính thể tích vỏ nhựa (Thể tích tổng khối lồi lõm trừ đi lỗ rỗng xuyên tâm):
        $
          V = pi integral_0^1 y_1^2 d x + pi integral_1^3 y_2^2 d x + pi integral_3^4 y_1^2 d x - pi integral_0^4 1^2 d x
        $]
      #step[Nhập trực tiếp toàn bộ biểu thức sau vào máy tính Casio (nhớ để chế độ Radian):
        $ V = pi (2 integral_0^1 (4+cos((pi x)/2))^2 d x + integral_1^3 (pi/4 x^2 - pi x + 4 + (3pi)/4)^2 d x - 4) $]
      #step[Casio sẽ trả về kết quả cực kỳ chuẩn xác: $V approx 199,385$. Làm tròn một chữ số thập phân ta được $199,4$ ($upright("cm")^3$).]
    ],
    fig-pos: "right",
    fig-width: 35%,
    fig: align(center)[
      #cetz.canvas(length: 1cm ,{
        import cetz.draw: *

        // Trục x
        line((-0.5, 0), (4.5, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))

        let draw_ellipse_x(x_coord, r, color, dashed_back: true) = {
          let rx = 0.2 * r
          if dashed_back {
            arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (
              paint: color,
              thickness: 0.5pt,
              dash: "dashed",
            ))
          } else {
            arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
          }
          arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 1.5pt))
        }

        // Lõi rỗng
        line((0, 1), (4, 1), stroke: (paint: rgb("EEEEEE"), thickness: 2pt))
        line((0, -1), (4, -1), stroke: (paint: rgb("EEEEEE"), thickness: 2pt, dash: "dashed"))

        // Khúc 1 & 3: Lượng giác
        let t1_top = range(0, 11).map(x => {
          let h = x / 10
          return (h, 4 + calc.cos(calc.pi * h / 2))
        })
        let t1_bot = range(0, 11).map(x => {
          let h = x / 10
          return (h, -(4 + calc.cos(calc.pi * h / 2)))
        })
        line(..t1_top, stroke: (paint: rgb("#460edf"), thickness: 2pt))
        line(..t1_bot, stroke: (paint: rgb("#460edf"), thickness: 2pt))

        let t2_top = range(30, 41).map(x => {
          let h = x / 10
          return (h, 4 + calc.cos(calc.pi * h / 2))
        })
        let t2_bot = range(30, 41).map(x => {
          let h = x / 10
          return (h, -(4 + calc.cos(calc.pi * h / 2)))
        })
        line(..t2_top, stroke: (paint: rgb("#460edf"), thickness: 2pt))
        line(..t2_bot, stroke: (paint: rgb("#460edf"), thickness: 2pt))

        // Khúc 2: Parabol
        let p_top = range(10, 31).map(x => {
          let h = x / 10
          return (h, calc.pi / 4 * h * h - calc.pi * h + 4 + 0.75 * calc.pi)
        })
        let p_bot = range(10, 31).map(x => {
          let h = x / 10
          return (h, -(calc.pi / 4 * h * h - calc.pi * h + 4 + 0.75 * calc.pi))
        })
        line(..p_top, stroke: (paint: rgb("C2185B"), thickness: 2pt))
        line(..p_bot, stroke: (paint: rgb("C2185B"), thickness: 2pt))

        // Viền elip
        draw_ellipse_x(0, 5, rgb("F48FB1")) // Mặt ngoài đầu 1
        draw_ellipse_x(0, 1, rgb("BDBDBD")) // Mặt lổ đầu 1

        draw_ellipse_x(1, 4, rgb("F48FB1")) // Cắt ngang
        draw_ellipse_x(2, 4 - calc.pi / 4, rgb("F48FB1")) // Đáy rãnh
        draw_ellipse_x(3, 4, rgb("F48FB1")) // Cắt ngang

        draw_ellipse_x(4, 5, rgb("F48FB1"), dashed_back: false) // Mặt ngoài đầu 2 (nhìn thấy viền lổ trong)
        draw_ellipse_x(4, 1, rgb("BDBDBD"), dashed_back: false)
      })
    ],
  )

  #tln(
    [Cho một phòng gồm có 24 bàn được chia thành 4 cột và 6 hàng như hình vẽ.
      #align(center)[
        #cetz.canvas(length: .98cm, {
          import cetz.draw: *
          let dx = 2.2 
          let dy = 1.2

          // Tiêu đề cột
          for col in (1, 2, 3, 4) {
            content(((col - 1) * dx + 0.9, 6 * dy + 0.3), text(weight: "bold", fill: rgb("003366"))[Cột #col])
          }

          for row in (1, 2, 3, 4, 5, 6) {
            // Tiêu đề hàng
            content((-0.3, (6 - row) * dy + 0.4), text(weight: "bold", fill: rgb("003366"))[Hàng #row], anchor: "east")
            for col in (1, 2, 3, 4) {
              let x = (col - 1) * dx
              let y = (6 - row) * dy
              rect((x, y), (x + 1.8, y + 0.8), radius: 0.15, fill: rgb("f0f8ff"), stroke: 1pt + rgb("4da6ff"))
              content((x + 0.9, y + 0.4), text(size: 9pt, fill: rgb("0044cc"))[Bàn])
            }
          }
        })
      ]
      Đang có 24 em học sinh, trong đó có 5 em thi môn Lý, 2 em thi môn Hoá, còn lại là thi môn Toán. Gọi $T$ là số cách xếp 24 em học sinh này vào 24 bàn sao cho mỗi hàng có không quá một em học sinh cùng thi Lý hoặc cùng thi Hoá. Hãy tính giá trị của $T / 100$.],
    "9216",
    loigiai: [
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let h = 2.4

          let node(pos, title, desc) = {
            let body = block(width: 7.2cm, fill: rgb("fff5e6"), stroke: 1.2pt + rgb("cc6600"), radius: 5pt, inset: 8pt)[
              #align(center)[
                #text(weight: "bold", fill: rgb("994c00"))[#title] \
                #v(0.2em)
                #text(size: 9.5pt)[#desc]
              ]
            ]
            content(pos, body)
          }

          let N1 = (0, 0)
          let N2a = (-3.8, -3.2)
          let N2b = (3.8, -3.2)
          let N4 = (0, -6.4)

          node(N1, [B1: Xếp 5 học sinh Lý], [Chọn 5 hàng, mỗi hàng 1 Lý \ $=> 6.144$ cách])
          node(N2a, [B2a: Xếp 2 Hoá (Cấu hình A)], [2 Hoá đều vào Nhóm I \ $=> 90$ cách])
          node(N2b, [B2b: Xếp 2 Hoá (Cấu hình B)], [1 Hoá Nhóm I, 1 Hoá Nhóm II \ $=> 60$ cách])
          node(
            N4,
            [B3: Xếp 17 Toán & Kết quả],
            [$T = 6.144 times (90 + 60) times 1$ \ $=> T / 100 = 9216$],
          )

          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2a.at(0), N2a.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N1.at(0), N1.at(1) - h / 2),
            (N2b.at(0), N2b.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line(
            (N2a.at(0), N2a.at(1) - h / 2),
            (N2a.at(0), -3.75),
            (0, -3.75),
            (0, N4.at(1) + h / 2),
            mark: (end: ">", fill: gray),
            stroke: 1.2pt + gray,
          )
          line((N2b.at(0), N2b.at(1) - h / 2), (N2b.at(0), -3.75), (0, -3.75), stroke: 1.2pt + gray)
        })
      ]
      #v(0.5em)

      #ppgiai[
        - *Phân tích:* Do mỗi hàng có 4 bàn nên luôn đủ chỗ để xếp các học sinh (tối đa 1 Lý, 1 Hoá). Theo bản chất bài toán, các học sinh thi cùng một môn được coi là giống nhau (không phân biệt).
        - *Chiến lược đếm:* Ta chia việc xếp chỗ thành các công đoạn liên tiếp: Xếp 5 Lý $->$ Lập bảng xếp 2 Hoá $->$ Xếp 17 Toán.
      ]

      #step[Công đoạn 1: Xếp 5 học sinh thi môn Lý]
      Vì mỗi hàng có không quá 1 Lý nên 5 Lý sẽ chiếm 5 hàng.
      - Chọn 5 hàng trong 6 hàng: có $C_6^5 = 6$ cách.
      - Với mỗi hàng được chọn (có 4 bàn), xếp 1 Lý vào 1 trong 4 bàn: có $4$ cách. Vậy 5 hàng có $4^5$ cách.
      $=>$ Số cách xếp môn Lý là: $n_1 = 6 times 4^5 = 6.144$ cách.
      *Tình trạng phòng thi lúc này:*
      - *Nhóm I:* 5 hàng có Lý (mỗi hàng còn đúng *3 ghế trống*).
      - *Nhóm II:* 1 hàng không có Lý (còn nguyên *4 ghế trống*).

      #step[Công đoạn 2: Lập bảng xếp 2 học sinh thi môn Hoá]
      Ta chọn 2 hàng để xếp Hoá từ 5 hàng Nhóm I và 1 hàng Nhóm II. Mỗi hàng nhiều nhất 1 Hoá.
      Gọi $x, y$ lần lượt là số Hoá vào Nhóm I và Nhóm II ($x+y=2$, điều kiện $y leq 1$). Ta có bảng cấu hình:
      #align(center)[
        #table(
          inset: 8pt,
          columns: (auto, auto, auto, auto),
          align: (center, left, left, right),
          fill: (col, row) => if row == 0 { rgb("e6f2ff") } else { none },
          [*Cấu hình*], [*Chọn hàng có Hoá*], [*Chọn ghế cho Hoá*], [*Số cách xếp*],
          [*(A):* $x=2, y=0$\ (2 Hoá vào Nhóm I)],
          [Chọn 2 hàng từ 5 hàng (I):\ $C_5^2 = 10$],
          [Mỗi hàng có 3 ghế trống:\ $3^2 = 9$],
          [$90$],

          [*(B):* $x=1, y=1$\ (1 Nhóm I, 1 Nhóm II)],
          [Chọn 1 hàng (I), 1 hàng (II):\ $C_5^1 times C_1^1 = 5$],
          [1 ghế từ Nhóm I, 1 từ Nhóm II:\ $3^1 times 4^1 = 12$],
          [$60$],
        )
      ]
      $=>$ Tổng số cách xếp môn Hoá là: $n_2 = 90 + 60 = 150$.

      #step[Công đoạn 3: Tổng kết]
      Xếp 17 học sinh Toán vào 17 ghế trống còn lại (không phân biệt) có 1 cách ($n_3 = 1$).
      Tổng số cách xếp thoả mãn yêu cầu là: $T = n_1 times n_2 times n_3 = 6.144 times 150 times 1 = 921.600$.
      Vậy giá trị của $T / 100 = 921.600 / 100 = 9216$.
    ],
  )




]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  // het
  // ═══════════════════════════════════════════════════════════
  // BẢNG ĐÁP ÁN (3 loại — tự động)
  // ═══════════════════════════════════════════════════════════
  // pagebreak()
  // print-answer-key()
}
