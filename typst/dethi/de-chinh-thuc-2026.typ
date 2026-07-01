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
  exam-title: "ĐỀ CHÍNH THỨC 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "0102",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: true,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [
  #exam-part(
    [Phần I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.
    ],
  )


  #tn(
    [Cho hình lập phương $A B C D.A' B' C' D'$ (xem hình dưới). Vectơ nào sau đây bằng vectơ $arrow(A D)$?],
    (
      [$arrow(A B)$.],
      [$arrow(A A')$.],
      [$arrow(C D)$.],
      True([$arrow(B' C')$.]),
    ),
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let p(x, y, z) = (x - 0.4 * y, z - 0.4 * y)
      let A = p(0, 0, 0)
      let B = p(2, 0, 0)
      let C = p(2, 2, 0)
      let D = p(0, 2, 0)
      let Ap = p(0, 0, 2)
      let Bp = p(2, 0, 2)
      let Cp = p(2, 2, 2)
      let Dp = p(0, 2, 2)

      line(A, B, stroke: (dash: "dashed"))
      line(A, D, stroke: (dash: "dashed"))
      line(A, Ap, stroke: (dash: "dashed"))
      line(B, C)
      line(C, D)
      line(Ap, Bp)
      line(Bp, Cp)
      line(Cp, Dp)
      line(Dp, Ap)
      line(B, Bp)
      line(C, Cp)
      line(D, Dp)

      content(A, text(size: 8pt)[$A$], anchor: "north-east", padding: 0.1)
      content(B, text(size: 8pt)[$B$], anchor: "north-west", padding: 0.1)
      content(C, text(size: 8pt)[$C$], anchor: "south-west", padding: 0.1)
      content(D, text(size: 8pt)[$D$], anchor: "south-east", padding: 0.1)
      content(Ap, text(size: 8pt)[$A'$], anchor: "south-east", padding: 0.1)
      content(Bp, text(size: 8pt)[$B'$], anchor: "south-west", padding: 0.1)
      content(Cp, text(size: 8pt)[$C'$], anchor: "north-west", padding: 0.1)
      content(Dp, text(size: 8pt)[$D'$], anchor: "south-east", padding: 0.1)
    }),
    fig-pos: "right",
    loigiai: [
      #step[
        Ta có $A B C D.A' B' C' D'$ là hình lập phương nên $A D = B C = B' C'$ và $A D parallel B C parallel B' C'$.
        Do đó $arrow(A D) = arrow(B C) = arrow(B' C')$.
      ]
    ],
  )

  #tn(
    [Cho các hàm số $y=f(x)$ và $y=g(x)$ có đạo hàm trên tập số thực $RR$ thỏa mãn $f'(x)=2x$ và $g'(x)=x^2$. Đạo hàm của hàm số $y=f(x)+g(x)$ là],
    (
      [$4x$.],
      True([$2x+x^2$.]),
      [$2+2x$.],
      [$2+x^2$.],
    ),
    loigiai: [
      #step[
        Đạo hàm của hàm số $y=f(x)+g(x)$ là:
        $ y' = (f(x)+g(x))' = f'(x) + g'(x) = 2x + x^2. $
      ]
    ],
  )

  #tn(
    [Trong không gian với hệ trục tọa độ $O x y z$, cho hai điểm $A(2;3;1)$ và $B(4;1;1)$. Vectơ $arrow(A B)$ có tọa độ là],
    (
      [$(3;2;1)$.],
      [$(-2;2;0)$.],
      [$(6;4;2)$.],
      True([$(2;-2;0)$.]),
    ),
    loigiai: [
      #step[
        Vectơ $arrow(A B) = (x_B - x_A; y_B - y_A; z_B - z_A) = (4-2; 1-3; 1-1) = (2; -2; 0)$.
      ]
    ],
  )

  #tn(
    [Cho $integral f(x) dif x = sin x + C$. Phát biểu nào sau đây là đúng?],
    (
      [$integral [2+f(x)] dif x = 2x - sin x + C$.],
      True([$integral [2+f(x)] dif x = 2x + sin x + C$.]),
      [$integral [2+f(x)] dif x = 2x + cos x + C$.],
      [$integral [2+f(x)] dif x = 2x - cos x + C$.],
    ),
    loigiai: [
      #step[
        Ta có:
        $ integral [2 + f(x)] dif x = integral 2 dif x + integral f(x) dif x = 2x + sin x + C. $
      ]
    ],
  )

  #tn(
    [Cho cấp số nhân $(u_n)$ có số hạng đầu $u_1$ và công bội $q$ với $u_1 != 0, q > 1$. Số hạng $u_3$ là],
    (
      [$u_3 = u_1 dot q^3$.],
      [$u_3 = u_1 + 2q$.],
      True([$u_3 = u_1 dot q^2$.]),
      [$u_3 = u_1 + 3q$.],
    ),
    loigiai: [
      #step[
        Công thức số hạng tổng quát của cấp số nhân là $u_n = u_1 dot q^(n-1)$.
        Thay $n=3$, ta được $u_3 = u_1 dot q^2$.
      ]
    ],
  )

  #tn(
    [Nghiệm của phương trình $log_3 (3x) = 2$ là],
    (
      [$x = 2$.],
      True([$x = 3$.]),
      [$x = 8/3$.],
      [$x = 2/3$.],
    ),
    loigiai: [
      #step[
        Điều kiện: $x > 0$.
        Phương trình tương đương với:
        $ 3x = 3^2 <=> 3x = 9 <=> x = 3 text(" (thỏa mãn)"). $
      ]
    ],
  )

  #tn(
    [Cho cấp số cộng $(u_n)$ có $u_1 = -2$ và công sai $d = 3$. Giá trị của $u_2$ bằng],
    (
      True([$1$.]),
      [$-1$.],
      [$-6$.],
      [$-5$.],
    ),
    loigiai: [
      #step[
        Công thức số hạng tổng quát của cấp số cộng: $u_n = u_1 + (n-1)d$.
        Thay số: $u_2 = u_1 + d = -2 + 3 = 1$.
      ]
    ],
  )

  #tn(
    [Hàm số $F(x) = 5x^3$ là một nguyên hàm của hàm số nào sau đây?],
    (
      [$f_2 (x) = 5x^2$.],
      [$f_4 (x) = 5x^4$.],
      True([$f_3 (x) = 15x^2$.]),
      [$f_1 (x) = (5x^4)/4$.],
    ),
    loigiai: [
      #step[
        Vì $F(x)$ là nguyên hàm của $f(x)$ nên $f(x) = F'(x)$.
        Ta có $F'(x) = (5x^3)' = 15x^2$. Vậy hàm số cần tìm là $f_3(x) = 15x^2$.
      ]
    ],
  )

  #tn(
    [Cho hai biến cố độc lập $A$ và $B$ có xác suất thỏa mãn $P(A) = 0,3$ và $P(B) = 0,6$. Giá trị của $P(A B)$ bằng],
    (
      [$0,9$.],
      [$0,3$.],
      True([$0,18$.]),
      [$0,5$.],
    ),
    loigiai: [
      #step[
        Vì $A$ và $B$ là hai biến cố độc lập nên xác suất của biến cố giao là:
        $ P(A B) = P(A) dot P(B) = 0,3 dot 0,6 = 0,18. $
      ]
    ],
  )

  #tn(
    [Cặp số nào sau đây là nghiệm của hệ bất phương trình $cases(x + y - 2 < 0, x - y + 2 > 0)$?],
    (
      True([$(1; 0)$.]),
      [$(0; 3)$.],
      [$(-3; 0)$.],
      [$(1; 2)$.],
    ),
    loigiai: [
      #step[
        Lần lượt thay các cặp số vào hệ bất phương trình:
        - Với $(1; 0)$: $cases(1 + 0 - 2 = -1 < 0, 1 - 0 + 2 = 3 > 0)$ (thỏa mãn).
        - Với $(0; 3)$: $0 + 3 - 2 = 1 > 0$ (không thỏa mãn).
        - Với $(-3; 0)$: $-3 - 0 + 2 = -1 < 0$ (không thỏa mãn).
        - Với $(1; 2)$: $1 + 2 - 2 = 1 > 0$ (không thỏa mãn).
        Vậy cặp $(1; 0)$ là nghiệm.
      ]
    ],
  )

  #tn(
    [Khảo sát thời gian (đơn vị: phút) học trực tuyến trong một ngày của $42$ học sinh, người ta thu được mẫu số liệu ghép nhóm như sau:
      #align(center)[
        #table(
          columns: (auto, auto, auto, auto, auto, auto, auto),
          align: center,
          stroke: 0.5pt,
          [Thời gian học trực tuyến], [\[10; 20)], [\[20; 30)], [\[30; 40)], [\[40; 50)], [\[50; 60)], [\[60; 70)],
          [Số học sinh], [5], [7], [15], [6], [5], [4],
        )
      ]
      Trung vị của mẫu số liệu trên thuộc nhóm nào sau đây?],
    (
      [\[40; 50).],
      [\[20; 30).],
      True([\[30; 40).]),
      [\[50; 60).],
    ),
    loigiai: [
      #step[
        Cỡ mẫu là $N = 42$. Vị trí của trung vị là giá trị đại diện giữa hai số liệu ở vị trí thứ $21$ và $22$.
        Tính tần số tích lũy:
        - Nhóm \[10; 20): $5$
        - Nhóm \[20; 30): $5 + 7 = 12$
        - Nhóm \[30; 40): $12 + 15 = 27$
        Vì số liệu thứ $21$ và $22$ đều nằm trong nhóm \[30; 40) nên trung vị thuộc nhóm \[30; 40).
      ]
    ],
  )




  #tn(
    [Cho hàm số $y = (a x + b)/(c x + d)$ ($c != 0, a d - b c != 0$) có bảng biến thiên như hình dưới đây:
      #align(center)[#bbtv2(
        var: $x$,
        der: $y'$,
        func: $y$,
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($+$, $"||"$, $+$),
        v-vals: ($-2$, ($+oo$, $-oo$), $-2$),
      )]
      Đường tiệm cận đứng của đồ thị hàm số đã cho có phương trình là],
    (
      [$x = -2$.],
      [$y = 1$.],
      [$y = -2$.],
      True([$x = 1$.]),
    ),
    loigiai: [
      #step[
        Dựa vào bảng biến thiên, ta thấy $lim_(x -> 1^-) y = +oo$ và $lim_(x -> 1^+) y = -oo$.
        Do đó đồ thị hàm số có đường tiệm cận đứng là $x = 1$.
      ]
    ],
  )
  #exam-part(
    [Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
    reset-counter: true,
  )

  #ds(
    [Một hệ thống pin năng lượng mặt trời gồm các tấm pin được kết nối với một bộ lưu trữ điện. Trong thời gian mặt trời chiếu sáng của một ngày, năng lượng điện thu được từ các tấm pin được lưu trong bộ lưu trữ điện. Gọi $F(t)$ là năng lượng điện (kWh) lưu trữ được kể từ thời điểm hệ thống bắt đầu hoạt động đến thời điểm $t$, trong đó $t$ là thời gian tính theo giờ ($0 <= t <= 12$) và thời điểm hệ thống bắt đầu hoạt động ứng với $t=0$. Biết rằng $F(0)=0$.

      Tốc độ lưu trữ năng lượng điện (kW) của hệ thống này là hàm số $f(t) = F'(t)$ với $0 <= t <= 12$. Số liệu ghi nhận được ở một ngày cụ thể trong năm cho thấy $f(t) = -0,15t^2 + 1,8t$ với $0 <= t <= 12$.],
    (
      True([$F(t) = -0,05t^3 + 0,9t^2$ với $0 <= t <= 12$.]),
      True(
        [Năng lượng điện (kWh) lưu trữ được kể từ thời điểm $t=a$ đến thời điểm $t=b$ ($0 <= a < b <= 12$) là $integral_a^b f(t) dif t$.],
      ),
      [Năng lượng điện lưu trữ được kể từ thời điểm $t=1$ đến thời điểm $t=5$ nhỏ hơn $15,3$ kWh.],
      [Năng lượng điện lưu trữ được kể từ thời điểm $t=1$ đến thời điểm $t=9$ gấp hai lần năng lượng điện lưu trữ được kể từ thời điểm $t=1$ đến thời điểm $t=5$.],
    ),
    loigiai: [
      #step[ *Ý a) Đúng.*
        Ta có $F(t) = integral f(t) dif t = integral (-0,15t^2 + 1,8t) dif t = -0,05t^3 + 0,9t^2 + C$.
        Vì $F(0) = 0$ nên $C = 0$.
        Vậy $F(t) = -0,05t^3 + 0,9t^2$.
      ]

      #step[ *Ý b) Đúng.*
        Theo tính chất của tích phân và nguyên hàm, năng lượng điện lưu trữ được từ thời điểm $t=a$ đến $t=b$ là:
        $ F(b) - F(a) = integral_a^b F'(t) dif t = integral_a^b f(t) dif t. $
      ]

      #step[ *Ý c) Sai.*
        Năng lượng điện lưu trữ được kể từ thời điểm $t=1$ đến $t=5$ là:
        $
          F(5) - F(1) &= (-0,05 dot 5^3 + 0,9 dot 5^2) - (-0,05 dot 1^3 + 0,9 dot 1^2) &= (-6,25 + 22,5) - (-0,05 + 0,9) &= 16,25 - 0,85 = 15,4 text(" (kWh)").
        $
        Vì $15,4 > 15,3$ nên phát biểu này sai.
      ]

      #step[ *Ý d) Sai.*
        Năng lượng điện lưu trữ được kể từ thời điểm $t=1$ đến $t=9$ là:
        $
          F(9) - F(1) & = (-0,05 dot 9^3 + 0,9 dot 9^2) - 0,85 & = (-36,45 + 72,9) - 0,85 & = 36,45 - 0,85 = 35,6 text(" (kWh)").
        $
        Ta có $F(5) - F(1) = 15,4$.
        Nếu gấp hai lần thì giá trị phải là $2 dot 15,4 = 30,8$.
        Vì $35,6 != 30,8$ nên phát biểu này sai.
      ]

      #reset-step()
    ],
  )

  #ds(
    [Cho hàm số $f(x) = 1/3 x^3 - 2x^2 + 3x + 8$.],
    (
      True([Đạo hàm của hàm số đã cho là $f'(x) = x^2 - 4x + 3$.]),
      True([Phương trình $f'(x) = 0$ có tập nghiệm là $S = {1; 3}$.]),
      True([Hàm số đã cho nghịch biến trên khoảng $(1; 3)$.]),
      [Giá trị cực tiểu của hàm số đã cho bằng $28/3$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính đạo hàm $f'(x)$, giải phương trình $f'(x) = 0$.
        - Lập bảng biến thiên của hàm số.
        - Dựa vào bảng biến thiên để kết luận về khoảng đơn điệu và giá trị cực trị.
      ]

      #step[ *Ý a) Đúng.*
        Đạo hàm của hàm số:
        $ f'(x) = (1/3 x^3 - 2x^2 + 3x + 8)' = x^2 - 4x + 3. $
      ]

      #step[ *Ý b) Đúng.*
        Giải phương trình $f'(x) = 0$:
        $ x^2 - 4x + 3 = 0 <=> cases(x = 1, x = 3) $
        Vậy tập nghiệm của phương trình là $S = {1; 3}$.
      ]

      #step[
        *Ý c) Đúng.*
        Ta có bảng dấu của $f'(x)$:
        - $f'(x) > 0 <=> x in (-oo; 1) union (3; +oo)$.
        - $f'(x) < 0 <=> x in (1; 3)$.
        Hàm số nghịch biến trên khoảng $(1; 3)$.
      ]

      #step[ *Ý d) Sai.*
        Từ bảng dấu của $f'(x)$, ta thấy $f'(x)$ đổi dấu từ $-$ sang $+$ khi qua $x = 3$.
        Do đó hàm số đạt cực tiểu tại $x = 3$.
        Giá trị cực tiểu của hàm số là:
        $ f(3) = 1/3(3)^3 - 2(3)^2 + 3(3) + 8 = 9 - 18 + 9 + 8 = 8. $
        (Lưu ý: Giá trị $28/3$ là giá trị cực đại đạt được tại $x = 1$, vì $f(1) = 1/3 - 2 + 3 + 8 = 28/3$).
      ]

      #reset-step()
    ],
  )
  #ds(
    [Nhằm đưa ra cảnh báo sớm về tình trạng sức khỏe của cư dân, người ta sử dụng một ứng dụng trí tuệ nhân tạo để sàng lọc nguy cơ mắc bệnh dựa trên hồ sơ y tế được lưu trữ. Khi phát hiện nguy cơ mắc bệnh, ứng dụng này sẽ gửi cảnh báo để giúp người dân đi khám bệnh kịp thời. Người ta dùng ứng dụng này để tầm soát nguy cơ mắc một loại bệnh.
      Kết quả thu được khi quét thử nghiệm hồ sơ y tế của 10000 người như sau: Có 1000 người nhận được cảnh báo và 9000 người còn lại không nhận được cảnh báo từ ứng dụng. Trong số 1000 người nhận được cảnh báo thì có 600 người có bệnh và 400 người không có bệnh. Trong số 9000 người không nhận được cảnh báo thì có 200 người có bệnh và 8800 người không có bệnh.
      Chọn ngẫu nhiên một người trong số 10000 người nói trên.],
    (
      True([Xác suất để người đó không nhận được cảnh báo từ ứng dụng bằng $0,9$.]),
      True(
        [Xác suất để người đó không có bệnh, biết rằng người đó không nhận được cảnh báo từ ứng dụng, lớn hơn $0,97$.],
      ),
      [Xác suất để người đó không có bệnh bằng $0,9$.],
      True(
        [Xác suất để người đó không nhận được cảnh báo từ ứng dụng, biết rằng người đó không có bệnh, lớn hơn $0,95$.],
      ),
    ),
    fig: cetz.canvas(length: 1.4cm, {
      import cetz.draw: *

      // Nút gốc
      content(
        (0, 0),
        [Người dân \ ($10000$)],
        name: "root",
        frame: "rect",
        padding: 5pt,
        fill: rgb("e3f2fd"),
        stroke: 0.5pt + rgb("1e88e5"),
        radius: 3pt,
      )

      let style1 = (frame: "rect", padding: 4pt, stroke: 0.5pt, radius: 2pt)
      let style2 = (frame: "rect", padding: 3pt, stroke: 0.5pt, radius: 2pt)
      let lbl-style = (frame: "rect", fill: white, padding: 1pt, stroke: none)

      // Tầng 1: Cảnh báo
      content((3.5, 1.5), ["Có cảnh báo" \ ($A$)], name: "A", ..style1)
      content((3.5, -1.5), ["Không cảnh báo" \ ($overline(A)$)], name: "An", ..style1)

      line("root", "A", mark: (end: ">", fill: black))
      content((1.75, 1.0), text(size: 9pt)[$1000$], ..lbl-style)
      line("root", "An", mark: (end: ">", fill: black))
      content((1.75, -1.0), text(size: 9pt)[$9000$], ..lbl-style)

      // Tầng 2: Tình trạng bệnh
      content((7.5, 2.5), [Có bệnh ($B$)], name: "AB", ..style2)
      content((7.5, 0.5), [Không bệnh ($overline(B)$)], name: "AnB", ..style2)
      line("A", "AB", mark: (end: ">", fill: black))
      content((5.5, 2.3), text(size: 9pt)[$600$], ..lbl-style)
      line("A", "AnB", mark: (end: ">", fill: black))
      content((5.5, 0.7), text(size: 9pt)[$400$], ..lbl-style)

      content((7.5, -0.5), [Có bệnh ($B$)], name: "An_B", ..style2)
      content((7.5, -2.5), [Không bệnh ($overline(B)$)], name: "An_nB", ..style2)
      line("An", "An_B", mark: (end: ">", fill: black))
      content((5.5, -0.7), text(size: 9pt)[$200$], ..lbl-style)
      line("An", "An_nB", mark: (end: ">", fill: black))
      content((5.5, -2.3), text(size: 9pt)[$8800$], ..lbl-style)
    }),
    fig-pos: "center",
    fig-width: 90%,
    loigiai: [
      #ppgiai[
        - Gọi $A$ là biến cố "Người đó nhận được cảnh báo". Suy ra $overline(A)$ là biến cố "Người đó không nhận được cảnh báo".
        - Gọi $B$ là biến cố "Người đó có bệnh". Suy ra $overline(B)$ là biến cố "Người đó không có bệnh".
        - Thay vì dùng số lượng, ta có thể tính trực tiếp các xác suất từ sơ đồ cây tần số ở trên.
        - Tổng số người là $10000$.
      ]

      #step[ *Ý a) Đúng.*
        Số người không nhận được cảnh báo là $9000$.
        Xác suất để người đó không nhận được cảnh báo là:
        $ P(overline(A)) = 9000/10000 = 0,9. $
      ]

      #step[ *Ý b) Đúng.*
        Cần tính xác suất người đó không có bệnh, biết rằng người đó không nhận được cảnh báo, tức là $P(overline(B) | overline(A))$.
        Dựa vào sơ đồ cây, trong nhánh $overline(A)$ có tổng cộng $9000$ người, trong đó số người không có bệnh là $8800$.
        Vậy: $ P(overline(B) | overline(A)) = 8800/9000 = 44/45 approx 0,9777. $
        Vì $0,9777 > 0,97$ nên mệnh đề này là Đúng.
      ]

      #step[ *Ý c) Sai.*
        Cần tính xác suất để người đó không có bệnh (xác suất toàn phần $P(overline(B))$).
        Dựa vào sơ đồ cây, tổng số người không có bệnh ở cả hai nhánh là:
        $ n(overline(B)) = 400 + 8800 = 9200 text(" người"). $
        Xác suất chọn được người không có bệnh là:
        $ P(overline(B)) = 9200/10000 = 0,92. $
        Mệnh đề cho bằng $0,9$ nên là Sai.
      ]

      #step[ *Ý d) Đúng.*
        Cần tính xác suất người đó không nhận được cảnh báo, biết rằng người đó không có bệnh (xác suất hậu nghiệm Bayes $P(overline(A) | overline(B))$).
        Số người không có bệnh là $n(overline(B)) = 9200$.
        Trong số những người không có bệnh, số người không nhận được cảnh báo là $8800$.
        Vậy xác suất cần tìm là:
        $ P(overline(A) | overline(B)) = 8800/9200 = 88/92 = 22/23 approx 0,9565. $
        Vì $0,9565 > 0,95$ nên mệnh đề này Đúng.
      ]

      #reset-step()
    ],
  )


  #ds(
    [Trong không gian xét hệ tọa độ $O x y z$ có một đơn vị dài trên các trục tương ứng với 10 mét trên thực tế. Một mục tiêu cần được bảo vệ có vị trí ở gốc tọa độ $O$. Người ta thiết lập một vành đai bảo vệ quanh mục tiêu theo một đường tròn tâm $O$ có bán kính bằng 6 đơn vị (tương ứng 60 mét trên thực tế) nằm trong mặt phẳng $(O x y)$. Một máy bay không người lái (được coi như một hạt) bay theo một đường thẳng từ vị trí $M(2; 11; 3)$ đến vị trí $N(14; 2; 3)$. Tại mỗi vị trí của máy bay, khoảng cách từ máy bay đến vành đai bảo vệ là độ dài ngắn nhất của các đoạn thẳng nối từ vị trí đó đến một điểm bất kì trên vành đai.],
    (
      True([$arrow(M N) = (12; -9; 0)$.]),
      [Phương trình tham số của đường thẳng $M N$ là $cases(x = 2 + 4t, y = 11 - 3t, z = 0)$ với $t in RR$.],
      [Trong quá trình bay từ $M$ đến $N$, khoảng cách ngắn nhất từ máy bay đến vành đai bảo vệ là 100 mét.],
      True(
        [Trong quá trình bay từ $M$ đến $N$, khoảng cách từ máy bay đến vành đai bảo vệ là ngắn nhất khi máy bay ở vị trí có tọa độ là $(6; 8; 3)$.],
      ),
    ),
    fig: cetz.canvas(length: 0.28cm, {
      import cetz.draw: *
      let proj(x, y, z) = {
        let alpha = 30deg
        let k = 0.5
        (x - y * k * calc.cos(alpha), z - y * k * calc.sin(alpha))
      }
      line(proj(0, 0, 0), proj(16, 0, 0), mark: (end: ">", size: 0.15), stroke: 0.5pt + luma(150))
      content(proj(16, 0, 0), [ $x$ ], anchor: "north")
      line(proj(0, 0, 0), proj(0, 16, 0), mark: (end: ">", size: 0.15), stroke: 0.5pt + luma(150))
      content(proj(0, 16, 0), [ $y$ ], anchor: "north-west")
      line(proj(0, 0, 0), proj(0, 0, 6), mark: (end: ">", size: 0.15), stroke: 0.5pt + luma(150))
      content(proj(0, 0, 6), [ $z$ ], anchor: "east")
      content(proj(0, 0, 0), [ $O$ ], anchor: "north-east")
      let circle_pts = ()
      for i in range(0, 361, step: 10) {
        let rad = i * 1deg
        circle_pts.push(proj(6 * calc.cos(rad), 6 * calc.sin(rad), 0))
      }
      line(..circle_pts, stroke: 1pt + blue, close: true)
      let M = proj(2, 11, 3)
      let N = proj(14, 2, 3)
      let Mp = proj(2, 11, 0)
      let Np = proj(14, 2, 0)
      let P = proj(6, 8, 3)
      let H = proj(6, 8, 0)
      line(M, N, stroke: 1.5pt + red)
      circle(M, radius: 2pt, fill: black)
      content(M, [ $M$ ], anchor: "south-east")
      circle(N, radius: 2pt, fill: black)
      content(N, [ $N$ ], anchor: "south-west")
      line(Mp, Np, stroke: (paint: red, dash: "dashed"))
      circle(Mp, radius: 1.5pt, fill: luma(150))
      content(Mp, [ $M'$ ], anchor: "north-east")
      circle(Np, radius: 1.5pt, fill: luma(150))
      content(Np, [ $N'$ ], anchor: "north-west")
      line(M, Mp, stroke: (paint: gray, dash: "dotted"))
      line(N, Np, stroke: (paint: gray, dash: "dotted"))
      line(P, H, stroke: (paint: gray, dash: "dotted"))
      line(proj(0, 0, 0), H, stroke: (paint: black, dash: "dotted"))
      circle(H, radius: 1.5pt, fill: black)
      content(H, [ $H$ ], anchor: "north-west")
      circle(P, radius: 2pt, fill: black)
      content(P, [ $P$ ], anchor: "south")
      let K = proj(3.6, 4.8, 0)
      circle(K, radius: 1.5pt, fill: blue)
      content(K, [ $K$ ], anchor: "north-west")
      line(K, P, stroke: 1pt + rgb("009900"))
    }),
    fig-pos: "center",
    fig-width: 60%,
    loigiai: [
      #ppgiai[
        - Tính tọa độ vectơ $arrow(M N)$ và lập phương trình tham số đường thẳng $M N$.
        - Thiết lập biểu thức khoảng cách từ điểm $P(x; y; z)$ bất kì trên đường thẳng đến vành đai bảo vệ.
        - Tìm giá trị nhỏ nhất của hàm số khoảng cách thu được.
      ]

      #step[ *Ý a) Đúng.* Ta có $arrow(M N) = (14 - 2; 2 - 11; 3 - 3) = (12; -9; 0)$. ]

      #step[ *Ý b) Sai.* Máy bay bay trên đường thẳng $M N$. Chọn vectơ chỉ phương là $arrow(u) = (4; -3; 0)$ (do $arrow(M N) = 3(4; -3; 0)$).
        Phương trình tham số của đường thẳng $M N$ đi qua $M(2; 11; 3)$ là:
        $
          cases(
            x = 2 + 4t,
            y = 11 - 3t,
            z = 3
          ) quad (t in RR)
        $
        Do đó, trong phương trình đề bài cho $z=0$ là sai (phải là $z=3$). ]

      #step[ *Ý c) Sai.* Vành đai bảo vệ là đường tròn $(C)$ trong mặt phẳng $(O x y)$ có tâm $O(0;0;0)$, bán kính $R=6$.
        Gọi $P(x; y; 3)$ là một vị trí bất kì của máy bay trên đoạn $M N$. Điểm hình chiếu của $P$ lên mặt phẳng $(O x y)$ là $P'(x; y; 0)$. Khoảng cách $O P' = sqrt(x^2 + y^2)$.
        Khoảng cách ngắn nhất từ $P$ đến vành đai $(C)$ được tính bởi công thức:
        $ d(P, (C)) = sqrt((O P' - R)^2 + P P'^2) = sqrt((sqrt(x^2 + y^2) - 6)^2 + 3^2) $
        Để khoảng cách này nhỏ nhất, ta cần tìm giá trị nhỏ nhất của $O P' = sqrt(x^2 + y^2)$ khi $P$ di chuyển trên đoạn $M N$. ]

      #step[ Ta thấy $O P'$ chính là khoảng cách từ gốc tọa độ $O(0;0)$ đến điểm $P'(x;y)$ nằm trên đoạn thẳng hình chiếu $M'N'$.
        Đường thẳng $M'N'$ trong mặt phẳng $(O x y)$ đi qua $M'(2; 11)$ và có vectơ chỉ phương $arrow(u') = (4; -3)$, nên có vectơ pháp tuyến $arrow(n') = (3; 4)$.
        Phương trình tổng quát của đường thẳng $M'N'$ là: $3x + 4y - 50 = 0$.
        Khoảng cách từ $O(0;0)$ đến đường thẳng $M'N'$ là:
        $ d(O, M'N') = (|3 dot 0 + 4 dot 0 - 50|) / sqrt(3^2 + 4^2) = 10 $ ]

      #step[ Gọi $H$ là hình chiếu vuông góc của $O$ lên đường thẳng $M'N'$. Khi đó $H(6; 8)$.
        Thay $x = 6$ vào $x = 2 + 4t$ được $t = 1 in [0; 3]$, nên $H$ thuộc đoạn $M'N'$.
        Vậy $min O P' = 10$.
        Khoảng cách ngắn nhất từ máy bay đến vành đai là $d_min = sqrt((10 - 6)^2 + 3^2) = 5 text(" (đơn vị)")$.
        Vì 1 đơn vị dài tương ứng 10 mét trên thực tế nên khoảng cách ngắn nhất là 50 mét (chứ không phải 100 mét). ]

      #step[ *Ý d) Đúng.* Theo chứng minh ở trên, khoảng cách ngắn nhất đạt được khi hình chiếu $P'$ trùng với $H(6; 8)$.
        Khi đó vị trí của máy bay tương ứng là $P(6; 8; 3)$. ]

      #reset-step()
    ],
  )


  #exam-part([Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], reset-counter: true)


  #tln(
    [Để chế tác một hạt cườm, người ta lấy một khối vật thể có dạng một khối tròn xoay được tạo thành khi quay hình phẳng giới hạn bởi trục $O x$ và nửa trên của elip $x^2 / 1.5^2 + y^2 / 1^2 = 1$ (một đơn vị dài trên mỗi trục tọa độ tương ứng với một xăng-ti-mét trong thực tế) quanh trục $O x$; sau đó khoan dọc theo trục xoay (xem hình dưới). Lỗ khoan có dạng hình trụ với bán kính $0,1 text(" cm")$ và có trục nằm trên trục xoay. Phần còn lại sau khi khoan là hạt cườm, có dạng một khối tròn xoay.
      Thể tích của hạt cườm đó bằng bao nhiêu xăng-ti-mét khối (không làm tròn kết quả các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng phần trăm)?

      #align(center)[
        #cetz.canvas(length: 1.3cm, {
          import cetz.draw: *
          // Hình 1: Cắt ngang 2D
          group(name: "h1", {
            line((-2, 0), (2, 0), mark: (end: ">"))
            content((2, -0.3), [$x$])
            line((0, -1.2), (0, 1.4), mark: (end: ">"))
            content((-0.3, 1.4), [$y$])
            content((-0.2, -0.3), [$O$])

            circle((0, 0), radius: (1.5, 1))
            line((-1.5, 0.1), (1.5, 0.1), stroke: (dash: "dashed"))
            line((-1.5, -0.1), (1.5, -0.1), stroke: (dash: "dashed"))

            arc((0, 1), start: 90deg, stop: 270deg, radius: (0.3, 1))
            arc((0, 1), start: 90deg, stop: -90deg, radius: (0.3, 1), stroke: (dash: "dashed"))

            content((-1.6, 0.6), text(size: 7pt)[Bán kính lỗ khoan 
 $0,1$])
            line((-1.4, 0.4), (-0.8, 0.05), mark: (end: ">"), stroke: 0.5pt)

            content((-2, -0.5), text(size: 7pt)[Trục xoay])
            line((-1.5, -0.5), (-0.8, -0.05), mark: (end: ">"), stroke: 0.5pt)

            content((1, 1.3), text(size: 8pt)[$x^2 / 1.5^2 + y^2 / 1^2 = 1$])
          })

          // Hình 2: 3D
          group(name: "h2", {
            set-origin((4.5, 0))
            circle((0, 0), radius: (1.5, 1), fill: rgb("777777"), stroke: none)

            rect((-1.49, -0.1), (1.49, 0.1), fill: white, stroke: none)
            line((-1.49, 0.1), (1.49, 0.1), stroke: (dash: "dashed", paint: white))
            line((-1.49, -0.1), (1.49, -0.1), stroke: (dash: "dashed", paint: white))

            arc((-1.49, 0.1), start: 90deg, stop: 270deg, radius: (0.05, 0.1), stroke: white)
            arc((-1.49, 0.1), start: 90deg, stop: -90deg, radius: (0.05, 0.1), stroke: (dash: "dashed", paint: white))

            arc((1.49, 0.1), start: 90deg, stop: 270deg, radius: (0.05, 0.1), stroke: white)
            arc((1.49, 0.1), start: 90deg, stop: -90deg, radius: (0.05, 0.1), stroke: white)

            arc((0, 1), start: 90deg, stop: 270deg, radius: (0.3, 1), stroke: rgb("aaaaaa"))
            arc((0, 1), start: 90deg, stop: -90deg, radius: (0.3, 1), stroke: (dash: "dashed", paint: rgb("aaaaaa")))

            arc((1.5, 0), start: 0deg, stop: 180deg, radius: (1.5, 0.2), stroke: (dash: "dashed", paint: rgb("aaaaaa")))
            arc((-1.5, 0), start: 180deg, stop: 360deg, radius: (1.5, 0.2), stroke: rgb("aaaaaa"))
          })

          // Hình 3: Nửa mặt cắt
          group(name: "h3", {
            set-origin((9, 0))
            line((-2, 0), (2, 0), mark: (end: ">"))
            content((2, -0.3), [$x$])
            line((0, -0.2), (0, 1.4), mark: (end: ">"))
            content((-0.3, 1.4), [$y$])
            content((-0.2, -0.3), [$O$])

            line((-2, 0.1), (2, 0.1))
            content((2, 0.3), [$y=0.1$])
            content((1, 1.3), text(size: 8pt)[$x^2 / 1.5^2 + y^2 / 1^2 = 1$])

            arc((1.5, 0), start: 0deg, stop: 180deg, radius: (1.5, 1), fill: rgb("777777"), stroke: none)
            rect((-1.6, 0), (1.6, 0.1), fill: white, stroke: none)
            line((-2, 0.1), (2, 0.1))

            arc((1.5, 0), start: 0deg, stop: 180deg, radius: (1.5, 1))
          })
        })
      ]
    ],
    [$6,19$],
    loigiai: [
      #ppgiai[
        - *Bước 1: Lập phương trình các đường biên.* Nửa trên của elip có phương trình $y = sqrt(1 - x^2/2.25)$. Đường thẳng giới hạn lỗ khoan là $y = 0,1$.
        - *Bước 2: Xác định hoành độ giao điểm.* Cho hai phương trình bằng nhau để tìm cận tích phân $x_1, x_2$.
        - *Bước 3: Tính thể tích khối tròn xoay.* Áp dụng công thức thể tích khối tròn xoay tạo bởi hình phẳng giới hạn bởi đồ thị hàm số và trục hoành quay quanh $O x$. Thể tích hạt cườm là phần thể tích elip quay quanh $O x$ trừ đi thể tích lỗ khoan hình trụ bị khoét bỏ.
      ]

      #step[Xác định các hàm số và cận tích phân]
      Phương trình nửa trên của elip là:
      $
        x^2 / 1.5^2 + y^2 / 1^2 = 1 => y^2 = 1 - x^2 / 2,25 => y = sqrt(1 - x^2 / 2.25) text(" (vì " y >= 0 text(")").)
      $

      Lỗ khoan là hình trụ bán kính $0,1 text(" cm")$ có trục là $O x$, tương ứng với phần hình phẳng bị khoét đi giới hạn bởi đường thẳng $y = 0,1$ và trục $O x$.

      Hoành độ giao điểm của nửa trên elip và đường thẳng $y = 0,1$ là nghiệm của phương trình:
      $
        sqrt(1 - x^2 / 2.25) = 0,1 & <=> 1 - x^2 / 2.25 = 0,01 \
                                   & <=> x^2 / 2.25 = 0.99 \
                                   & <=> x^2 = 2.2275 <=> x = pm sqrt(2.2275)
      $

      #step[Tính thể tích hạt cườm]
      Thể tích hạt cườm chính là thể tích khối tròn xoay tạo thành khi quay hình phẳng giới hạn bởi $y = sqrt(1 - x^2 / 2.25)$, $y = 0.1$, $x = -sqrt(2.2275)$ và $x = sqrt(2.2275)$ quanh trục $O x$.

      $
        V & = pi integral_(-sqrt(2.2275))^(sqrt(2.2275)) [ (sqrt(1 - x^2 / 2.25))^2 - (0.1)^2 ] dif x \
          & = pi integral_(-sqrt(2.2275))^(sqrt(2.2275)) (1 - x^2 / 2.25 - 0.01) dif x \
          & = pi integral_(-sqrt(2.2275))^(sqrt(2.2275)) (0.99 - x^2 / 2.25) dif x \
          & = 2 pi integral_0^(sqrt(2.2275)) (0.99 - x^2 / 2.25) dif x
      $

      Tính tích phân:
      $
        V & = 2 pi [0.99 x - x^3 / (3 times 2.25)]_0^(sqrt(2.2275)) \
          & = 2 pi ( 0.99 sqrt(2.2275) - (2.2275 sqrt(2.2275)) / 6.75 )
      $

      Nhận xét $2.2275 / 6.75 = 0.33$, ta có:
      $
        V & = 2 pi ( 0.99 sqrt(2.2275) - 0.33 sqrt(2.2275) ) \
          & = 2 pi (0.66 sqrt(2.2275)) = 1.32 pi sqrt(2.2275)
      $

      Thay số và bấm máy:
      $ V = 1.32 times pi times sqrt(2.2275) approx 6.1894... text(" (cm"^3) $

      Làm tròn đến hàng phần trăm, ta được $V approx 6.19 text(" cm"^3)$.
    ],
  )

  #tln(
    [Cho hình lập phương $A B C D. M N P Q$ có cạnh bằng $14$. Gọi $E$ là trung điểm của đoạn thẳng $A B$. Khoảng cách từ điểm $P$ đến mặt phẳng $(M E D)$ bằng bao nhiêu (không làm tròn kết quả các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng phần mười)?],
    [$17,1$],
    loigiai: [
      #ppgiai[
        - *Bước 1: Chọn hệ trục tọa độ.* Gắn hình lập phương vào hệ trục tọa độ $O x y z$ với gốc tọa độ tại $A$.
        - *Bước 2: Tìm tọa độ các điểm.* Viết tọa độ của $D, M, E, P$.
        - *Bước 3: Viết phương trình mặt phẳng $(M E D)$.* Dùng phương trình mặt phẳng theo đoạn chắn vì $M, E, D$ nằm trên 3 trục tọa độ.
        - *Bước 4: Tính khoảng cách.* Áp dụng công thức khoảng cách từ một điểm đến mặt phẳng.
      ]

      #step[Gắn hệ trục tọa độ]
      #align(center)[
        #cetz.canvas(length: 2cm, {
          import cetz.draw: *
          let p(x, y, z) = (x - 0.4 * y, z - 0.4 * y)

          let A = p(0, 0, 0)
          let B = p(1, 0, 0)
          let C = p(1, 1, 0)
          let D = p(0, 1, 0)
          let M = p(0, 0, 1)
          let N = p(1, 0, 1)
          let P = p(1, 1, 1)
          let Q = p(0, 1, 1)
          let E = p(0.5, 0, 0)

          line(A, B, stroke: (dash: "dashed"))
          line(A, D, stroke: (dash: "dashed"))
          line(A, M, stroke: (dash: "dashed"))

          line(B, C)
          line(C, D)
          line(M, N)
          line(N, P)
          line(P, Q)
          line(Q, M)
          line(B, N)
          line(C, P)
          line(D, Q)

          line(p(0, -0.2, 0), p(0, 1.5, 0), mark: (end: ">"))
          line(p(-0.2, 0, 0), p(1.5, 0, 0), mark: (end: ">"))
          line(p(0, 0, -0.2), p(0, 0, 1.5), mark: (end: ">"))
          content(p(0, 1.6, 0), [$y$])
          content(p(1.6, 0, 0), [$x$])
          content(p(0, 0, 1.6), [$z$])

          content(A, text(size: 8pt)[$A(0;0;0) \ (O)$], anchor: "north-east", padding: 0.1)
          content(B, text(size: 8pt)[$B(14;0;0)$], anchor: "north-west", padding: 0.1)
          content(D, text(size: 8pt)[$D(0;14;0)$], anchor: "south-east", padding: 0.1)
          content(M, text(size: 8pt)[$M(0;0;14)$], anchor: "south-east", padding: 0.1)
          content(C, text(size: 8pt)[$C$], anchor: "north-west", padding: 0.1)
          content(N, text(size: 8pt)[$N$], anchor: "south-west", padding: 0.1)
          content(P, text(size: 8pt)[$P(14;14;14)$], anchor: "south-west", padding: 0.1)
          content(Q, text(size: 8pt)[$Q$], anchor: "south-east", padding: 0.1)
          content(E, text(size: 8pt)[$E(7;0;0)$], anchor: "north", padding: 0.1)

          circle(A, radius: 0.02, fill: black)
          circle(B, radius: 0.02, fill: black)
          circle(C, radius: 0.02, fill: black)
          circle(D, radius: 0.02, fill: black)
          circle(M, radius: 0.02, fill: black)
          circle(N, radius: 0.02, fill: black)
          circle(P, radius: 0.02, fill: black)
          circle(Q, radius: 0.02, fill: black)
          circle(E, radius: 0.02, fill: black)

          line(M, D, stroke: blue)
          line(D, E, stroke: blue)
          line(E, M, stroke: (dash: "dashed", paint: blue))
        })
      ]
      Chọn hệ trục tọa độ $O x y z$ sao cho:
      - Gốc tọa độ $O equiv A(0; 0; 0)$.
      - Tia $O x$ chứa tia $A B$.
      - Tia $O y$ chứa tia $A D$.
      - Tia $O z$ chứa tia $A M$.

      Do hình lập phương có cạnh bằng $14$, ta suy ra tọa độ các đỉnh:
      - $A(0; 0; 0)$
      - $B(14; 0; 0)$
      - $D(0; 14; 0)$
      - $C(14; 14; 0)$
      - $M(0; 0; 14)$
      - $P(14; 14; 14)$ (vì $P$ là đỉnh đối diện với $A$ qua tâm hình lập phương, hình chiếu vuông góc của $P$ xuống mặt đáy $A B C D$ là $C$)

      #step[Tìm tọa độ các điểm liên quan và phương trình mặt phẳng $(M E D)$]
      Vì $E$ là trung điểm của $A B$ nên $E(7; 0; 0)$.
      Ba điểm $E, D, M$ lần lượt nằm trên 3 trục tọa độ $O x, O y, O z$:
      - $E(7; 0; 0) in O x$
      - $D(0; 14; 0) in O y$
      - $M(0; 0; 14) in O z$

      Áp dụng phương trình mặt phẳng theo đoạn chắn, mặt phẳng $(M E D)$ có phương trình là:
      $
        x / 7 + y / 14 + z / 14 = 1 \
        <=> 2x + y + z - 14 = 0
      $

      #step[Tính khoảng cách từ $P$ đến mặt phẳng $(M E D)$]
      Áp dụng công thức khoảng cách từ điểm $P(14; 14; 14)$ đến mặt phẳng $(M E D): 2x + y + z - 14 = 0$:
      $
        d(P, (M E D)) & = (|2(14) + 14 + 14 - 14|) / sqrt(2^2 + 1^2 + 1^2) \
                      & = (|28 + 14|) / sqrt(6) \
                      & = 42 / sqrt(6) = 7 sqrt(6)
      $

      Bấm máy tính ta được:
      $ d(P, (M E D)) = 7 sqrt(6) approx 17,1464... $

      Làm tròn kết quả đến hàng phần mười, ta được khoảng cách là $17,1$.
    ],
  )

  #tln(
    [Trong một trò chơi bạn Bình cần vượt qua một thử thách. Theo yêu cầu của thử thách, Bình cần điền tất cả 15 số thuộc tập hợp ${1; 2; 3; 4; 5; 6; 7; 8; 9; 11; 12; 13; 16; 17; 21}$ vào 15 ô vuông trong hình dưới thỏa mãn đồng thời ba điều kiện sau:
      - Mỗi ô điền đúng một số và mỗi số chỉ được sử dụng một lần;
      - Hiệu hai số ở hai ô bất kì khác nhau trên cùng một hàng không chia hết cho 5;
      - Hiệu hai số ở hai ô bất kì khác nhau trên cùng một cột không chia hết cho 5.
      Hai cách điền gọi là giống nhau nếu số điền ở mỗi ô tương ứng trong 15 ô là giống nhau (không tính đến thứ tự điền các số vào 15 ô vuông). Gọi $H$ là số cách điền khác nhau để bạn Bình vượt qua được thử thách. Giá trị của $H/10$ bằng bao nhiêu?

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let w = 1.2
          for c in range(1, 6) {
            for r in range(1, 7 - c) {
              rect(((c - 1) * w, (r - 1) * w), (c * w, r * w), stroke: 1pt + black)
            }
            content(((c - 1) * w + w / 2, -0.4), text(weight: "bold")[Cột #c])
          }
          for r in range(1, 6) {
            content((-0.8, (r - 1) * w + w / 2), text(weight: "bold")[Hàng #r])
          }
        })
      ]
    ],
    [$3456$],
    loigiai: [
      #ppgiai[
        - *Bước 1: Phân tích điều kiện chia hết.* Điều kiện "hiệu hai số không chia hết cho 5" nghĩa là hai số đó không được có cùng số dư khi chia cho 5. Vậy trên mỗi hàng và mỗi cột, các số phải có số dư khi chia cho 5 khác nhau.
        - *Bước 2: Phân loại các số theo số dư mod 5.* Đếm số lượng các số trong tập $S$ theo từng loại số dư.
        - *Bước 3: Xếp các nhóm số dư vào bảng.* Bảng có dạng bậc thang (5, 4, 3, 2, 1). Bằng suy luận logic, nhóm có $k$ phần tử bắt buộc phải nằm trên đường chéo phụ thứ $k$ của bảng (chỉ có duy nhất 1 cách định hình bộ khung).
        - *Bước 4: Tính tổng số cách.* Tính hoán vị các số trong mỗi nhóm số dư và nhân lại với nhau.
      ]

      #step[Phân loại các số theo số dư modulo 5]
      Tập hợp gồm 15 phần tử. Ta phân loại các số theo số dư khi chia cho 5:
      - Dư 1 (5 số): ${1, 6, 11, 16, 21}$
      - Dư 2 (4 số): ${2, 7, 12, 17}$
      - Dư 3 (3 số): ${3, 8, 13}$
      - Dư 4 (2 số): ${4, 9}$
      - Dư 0 (1 số): ${5}$

      #step[Phân tích vị trí điền các nhóm số dư vào bảng]
      Giả sử ô ở Cột $c$, Hàng $r$ có tọa độ $(c, r)$. Bảng hình bậc thang gồm 15 ô với điều kiện tồn tại ô là $1 <= c <= 5$ và $1 <= r <= 6 - c$.
      Vì hiệu hai số trên cùng hàng hoặc cùng cột không chia hết cho 5, nên *mỗi hàng và mỗi cột không được chứa hai số có cùng số dư khi chia cho 5.*

      Xét nhóm dư 1 gồm 5 số. Ta phải xếp 5 số này vào bảng sao cho không có 2 số nào cùng hàng hoặc cùng cột.
      - Cột 5 chỉ có 1 ô là $(5, 1)$, nên buộc phải có 1 số dư 1 ở ô $(5, 1)$. Khi đó hàng 1 đã có số dư 1.
      - Cột 4 có 2 ô là $(4, 1)$ và $(4, 2)$. Vì hàng 1 đã có số dư 1, ô $(4, 1)$ không được điền. Vậy phải điền vào ô $(4, 2)$.
      - Cột 3 có 3 ô là $(3, 1), (3, 2), (3, 3)$. Hàng 1 và 2 đã có số dư 1, nên buộc phải điền vào ô $(3, 3)$.
      - Tương tự, cột 2 điền ô $(2, 4)$ và cột 1 điền ô $(1, 5)$.
      Như vậy, 5 số dư 1 bắt buộc phải nằm trên đường chéo $c + r = 6$.

      Sau khi điền xong nhóm dư 1, phần bảng còn lại có dạng bậc thang gồm 10 ô (điều kiện $c + r <= 5$).
      Bằng lập luận tương tự đối với các nhóm tiếp theo:
      - Nhóm dư 2 (4 số) bắt buộc phải nằm trên đường chéo $c + r = 5$.
      - Nhóm dư 3 (3 số) bắt buộc phải nằm trên đường chéo $c + r = 4$.
      - Nhóm dư 4 (2 số) bắt buộc phải nằm trên đường chéo $c + r = 3$.
      - Nhóm dư 0 (1 số) bắt buộc nằm ở ô $(1, 1)$ tức $c + r = 2$.

      #align(center)[
        #cetz.canvas(length: 1.2cm, {
          import cetz.draw: *
          let w = 1.0
          for c in range(1, 6) {
            for r in range(1, 7 - c) {
              let val = r + c - 1
              let clr = if val == 5 { rgb("ffcccc") } else if val == 4 { rgb("ccccff") } else if val == 3 {
                rgb("ccffcc")
              } else if val == 2 { rgb("ffffcc") } else { rgb("e6ccff") }
              rect(((c - 1) * w, (r - 1) * w), (c * w, r * w), stroke: 1pt + black, fill: clr)
              let label = ("0", "4", "3", "2", "1").at(val - 1)
              content(((c - 1) * w + w / 2, (r - 1) * w + w / 2), [Dư #label])
            }
          }
        })
      ]

      #step[Tính số cách điền]
      Khung số dư đã được cố định hoàn toàn duy nhất 1 cách.
      Số cách điền các số cụ thể vào bảng chính bằng số cách hoán vị các số trong từng nhóm số dư vào các ô của nhóm đó:
      - Số cách điền 5 số dư 1: $5!$ cách.
      - Số cách điền 4 số dư 2: $4!$ cách.
      - Số cách điền 3 số dư 3: $3!$ cách.
      - Số cách điền 2 số dư 4: $2!$ cách.
      - Số cách điền 1 số dư 0: $1!$ cách.

      Tổng số cách điền là:
      $ H = 5! times 4! times 3! times 2! times 1! = 120 times 24 times 6 times 2 times 1 = 34560 text(" (cách)"). $

      Vậy giá trị của $H/10$ là:
      $ H/10 = 34560 / 10 = 3456. $
    ],
  )

  #tln(
    [Một công ty nông sản có công suất chế biến không quá 180 tấn nguyên liệu một tháng. Nếu công ty chế biến $x$ tấn nguyên liệu trong một tháng ($1 <= x <= 180$) thì chi phí sản xuất và doanh thu lần lượt là $C(x) = 0,002x^3 + 30x + 20$ (triệu đồng) và $R(x) = 90x$ (triệu đồng). Lợi nhuận lớn nhất mà công ty đạt được trong một tháng là bao nhiêu triệu đồng?],
    [$3980$],
    loigiai: [
      #ppgiai[
        - *Bước 1: Thiết lập hàm lợi nhuận.* Lợi nhuận bằng doanh thu trừ đi chi phí: $P(x) = R(x) - C(x)$.
        - *Bước 2: Tìm giá trị lớn nhất của hàm số.* Tính đạo hàm $P'(x)$, tìm nghiệm trên đoạn $[1; 180]$.
        - *Bước 3: Lập bảng biến thiên.* Lập bảng biến thiên để tìm ra điểm cho lợi nhuận lớn nhất.
      ]

      #step[Thiết lập hàm lợi nhuận]
      Hàm lợi nhuận của công ty trong một tháng là:
      $
        P(x) & = R(x) - C(x) \
             & = 90x - (0,002x^3 + 30x + 20) \
             & = -0,002x^3 + 60x - 20
      $
      với $x in [1; 180]$.

      #step[Tìm giá trị lớn nhất của hàm số $P(x)$ trên đoạn $[1; 180]$]
      Đạo hàm của hàm lợi nhuận:
      $ P'(x) = -0,006x^2 + 60 $
      Cho $P'(x) = 0$:
      $
        -0,006x^2 + 60 = 0 quad <=> quad x^2 = 60 / 0,006 = 10000 quad => quad x = 100 text(" (do " x in [1; 180] text(")")).
      $

      Ta tính các giá trị của $P(x)$ tại các điểm biên và điểm tới hạn:
      - Tại $x = 1$: $P(1) = -0,002(1)^3 + 60(1) - 20 = 39"{,}"998$ (triệu đồng)
      - Tại $x = 100$: $P(100) = -0,002(100)^3 + 60(100) - 20 = -2000 + 6000 - 20 = 3980$ (triệu đồng)
      - Tại $x = 180$: $P(180) = -0,002(180)^3 + 60(180) - 20 = -11664 + 10800 - 20 = -884$ (triệu đồng)

      #align(center)[
        #bbbt(
          var: $x$,
          der: $P'(x)$,
          func: $P(x)$,
          x-vals: ($1$, $100$, $180$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($39"{,}"998$, $3980$, $-884$),
        )
      ]

      #step[Kết luận]
      Từ bảng biến thiên, ta thấy giá trị lớn nhất của hàm lợi nhuận là $3980$ triệu đồng, đạt được khi công ty chế biến $x = 100$ tấn nguyên liệu.
      Vậy lợi nhuận lớn nhất mà công ty đạt được trong một tháng là $3980$ triệu đồng.
    ],
  )

  #tln(
    [Một nông trại cung cấp rau quả cho siêu thị A với số liệu bán hàng của bốn ngày trong tuần được ghi lại trong bảng sau:

      #align(center)[
        #table(
          columns: (auto, auto, auto, auto, auto),
          align: center,
          stroke: 0.5pt,
          table.header(
            table.cell(rowspan: 2, align: horizon)[*Ngày*],
            table.cell(colspan: 3)[*Số ki-lô-gam*],
            table.cell(rowspan: 2, align: horizon)[*Tổng số tiền \ (nghìn đồng)*],
          ),
          [*Rau muống*], [*Bí xanh*], [*Cà chua*], [Thứ Tư], [19],
          [15], [10], [615], [Thứ Năm], [20],
          [12], [8], [540], [Thứ Sáu], [25],
          [12], [7], [570], [Thứ Bảy], [50],
          [30], [20], [?],
        )
      ]

      Biết rằng đơn giá theo ki-lô-gam của mỗi loại rau quả trong bảng trên là không đổi. Tổng số tiền nông trại thu được ở ngày thứ Bảy từ ba loại rau quả trên khi cung cấp cho siêu thị A là bao nhiêu nghìn đồng?],
    [$1350$],
    loigiai: [
      #ppgiai[
        - *Bước 1: Thiết lập hệ phương trình.* Gọi $x, y, z$ lần lượt là đơn giá của rau muống, bí xanh, cà chua. Dựa vào dữ liệu 3 ngày đầu, lập hệ 3 phương trình bậc nhất 3 ẩn.
        - *Bước 2: Giải hệ phương trình.* Tìm được đơn giá $x, y, z$.
        - *Bước 3: Tính toán cho Thứ Bảy.* Thay $x, y, z$ vào biểu thức của Thứ Bảy để tìm tổng số tiền.
        - *Mẹo giải nhanh:* Nhận thấy tỉ lệ số lượng rau quả của Thứ Bảy so với Thứ Năm là hằng số để giải nhanh.
      ]

      #step[Cách 1: Lập và giải hệ phương trình]
      Gọi $x, y, z$ (nghìn đồng/kg) lần lượt là đơn giá của rau muống, bí xanh và cà chua ($x, y, z > 0$).
      Dựa vào số liệu bán hàng của Thứ Tư, Thứ Năm, Thứ Sáu, ta có hệ phương trình:
      $
        cases(
          19x + 15y + 10z & = 615,
          20x + 12y + 8z & = 540,
          25x + 12y + 7z & = 570
        )
      $
      Sử dụng máy tính cầm tay giải hệ phương trình trên, ta được:
      $ x = 10, quad y = 15, quad z = 20. $

      Tổng số tiền thu được ở ngày Thứ Bảy là:
      $ T = 50x + 30y + 20z = 50(10) + 30(15) + 20(20) = 500 + 450 + 400 = 1350 text(" (nghìn đồng)"). $

      #step[Cách 2: Nhận xét tỉ lệ (Giải nhanh)]
      Nhìn vào bảng số liệu, ta thấy số lượng từng loại rau quả bán ra trong ngày Thứ Bảy đều gấp $2,5$ lần số lượng bán ra trong ngày Thứ Năm. Thật vậy:
      - Rau muống: $50 / 20 = 2,5$

      - Bí xanh: $30 / 12 = 2,5$

      - Cà chua: $20 / 8 = 2,5$

      Vì đơn giá không đổi nên tổng số tiền thu được ngày Thứ Bảy cũng gấp $2,5$ lần tổng số tiền ngày Thứ Năm:
      $ T = 2,5 times 540 = 1350 text(" (nghìn đồng)"). $

      Vậy tổng số tiền nông trại thu được ở ngày Thứ Bảy là $1350$ nghìn đồng.
    ],
  )

  #tln(
    [Một khung hình trang trí có dạng một đa giác đều 12 cạnh $A_1 A_2 ... A_(12)$ (xem hình dưới) được gắn cố định trên một trần nhà. Bạn Dũng có 12 bóng đèn gồm bốn bóng màu đỏ và tám bóng màu xanh, có công suất đôi một khác nhau. Bạn Dũng lắp ngẫu nhiên 12 bóng đèn trên vào 12 đỉnh $A_1, A_2, ..., A_(12)$ sao cho mỗi đỉnh có đúng một bóng đèn. Gọi $P$ là xác suất để mỗi hình vuông (có bốn đỉnh là các đỉnh của đa giác đã cho) đều có ít nhất một bóng đèn màu đỏ. Giá trị của $4565P$ bằng bao nhiêu?

      #align(center)[
        #cetz.canvas(length: 1.5cm, {
          import cetz.draw: *
          let r = 2
          let points = ()
          for i in range(12) {
            let angle = 90deg - i * 30deg
            points.push((r * calc.cos(angle), r * calc.sin(angle)))
          }
          line(..points, close: true, stroke: 1pt + black)
          for i in range(12) {
            let angle = 90deg - i * 30deg
            let x = r * calc.cos(angle)
            let y = r * calc.sin(angle)
            circle((x, y), radius: 0.05, fill: black)
            let label-angle = angle
            let label-x = (r + 0.3) * calc.cos(label-angle)
            let label-y = (r + 0.3) * calc.sin(label-angle)
            content((label-x, label-y), [$A_#(i + 1)$])
          }
        })
      ]
    ],
    [$2656$],
    loigiai: [
      #ppgiai[
        - *Bước 1: Tìm số hình vuông tạo thành.* Từ 12 đỉnh của đa giác đều, xác định được bao nhiêu hình vuông. Nhận xét rằng các hình vuông này hoàn toàn độc lập (không chung đỉnh).
        - *Bước 2: Tìm không gian mẫu.* Lắp 4 bóng đỏ vào 12 đỉnh (các bóng phân biệt nhưng khi tính xác suất theo vị trí thì số hoán vị sẽ triệt tiêu nên ta chỉ cần chọn 4 vị trí).
        - *Bước 3: Chia trường hợp.* Để mỗi hình vuông đều có ít nhất 1 bóng đỏ (tổng cộng 4 bóng đỏ), ta cần phân phối số lượng bóng đỏ vào các hình vuông theo một cấu hình duy nhất: (2, 1, 1).
        - *Bước 4: Tính số cách.* Chọn hình vuông chứa 2 bóng đỏ, sau đó chọn vị trí cụ thể trong từng hình vuông.
      ]

      #step[Xác định các hình vuông từ đa giác đều]
      - Một hình vuông nội tiếp đường tròn sẽ chia đường tròn thành 4 cung bằng nhau. Với đa giác đều 12 cạnh, mỗi cung chắn $12/4 = 3$ cạnh.
      - Do đó, số hình vuông tạo thành là $12 / 4 = 3$ hình vuông.
      - Gọi 3 hình vuông đó là $S_1, S_2, S_3$. Cụ thể:
        - $S_1 = {A_1, A_4, A_7, A_{10}}$
        - $S_2 = {A_2, A_5, A_8, A_{11}}$
        - $S_3 = {A_3, A_6, A_9, A_(12)}$
      - Nhận xét quan trọng: *Mỗi đỉnh của đa giác thuộc đúng một hình vuông.*

      #align(center)[
        #cetz.canvas(length: 1.5cm, {
          import cetz.draw: *
          let r = 2

          // S1 (Đỏ)
          fill(rgb("ffcccc60"))
          stroke(1pt + red)
          line(
            (r * calc.cos(90deg), r * calc.sin(90deg)),
            (r * calc.cos(0deg), r * calc.sin(0deg)),
            (r * calc.cos(-90deg), r * calc.sin(-90deg)),
            (r * calc.cos(-180deg), r * calc.sin(-180deg)),
            close: true,
          )

          // S2 (Xanh dương)
          fill(none)
          stroke(1pt + blue)
          line(
            (r * calc.cos(60deg), r * calc.sin(60deg)),
            (r * calc.cos(-30deg), r * calc.sin(-30deg)),
            (r * calc.cos(-120deg), r * calc.sin(-120deg)),
            (r * calc.cos(-210deg), r * calc.sin(-210deg)),
            close: true,
          )

          // S3 (Xanh lá)
          fill(none)
          stroke(1pt + green)
          line(
            (r * calc.cos(30deg), r * calc.sin(30deg)),
            (r * calc.cos(-60deg), r * calc.sin(-60deg)),
            (r * calc.cos(-150deg), r * calc.sin(-150deg)),
            (r * calc.cos(-240deg), r * calc.sin(-240deg)),
            close: true,
          )

          let points = ()
          for i in range(12) {
            let angle = 90deg - i * 30deg
            points.push((r * calc.cos(angle), r * calc.sin(angle)))
          }
          line(..points, close: true, stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))

          for i in range(12) {
            let angle = 90deg - i * 30deg
            let x = r * calc.cos(angle)
            let y = r * calc.sin(angle)
            circle((x, y), radius: 0.08, fill: black, stroke: none)
            let label-angle = angle
            let label-x = (r + 0.35) * calc.cos(label-angle)
            let label-y = (r + 0.35) * calc.sin(label-angle)
            content((label-x, label-y), [$A_#(i + 1)$])
          }
        })
      ]

      #step[Không gian mẫu]
      Số cách chọn 4 đỉnh để lắp 4 bóng đèn màu đỏ (không quan tâm thứ tự các bóng màu đỏ với nhau để đơn giản hóa bài toán) là:
      $ n(Omega) = C_(12)^4 = 495 $
      *(Lưu ý: Ta bỏ qua hoán vị của 4 bóng đỏ và 8 bóng xanh vì chúng sẽ triệt tiêu khi tính tỉ lệ xác suất).*

      #step[Phân tích biến cố thỏa mãn]
      Gọi $A$ là biến cố: "Mỗi hình vuông đều có ít nhất một bóng đèn màu đỏ".
      Gọi $x_1, x_2, x_3$ lần lượt là số bóng đèn đỏ nằm trên hình vuông $S_1, S_2, S_3$.
      - Ta có phương trình: $x_1 + x_2 + x_3 = 4$
      - Điều kiện: $x_1 >= 1, x_2 >= 1, x_3 >= 1$
      - Vì $x_1, x_2, x_3$ nguyên dương nên chỉ có một bộ nghiệm (không xét thứ tự) là $(2, 1, 1)$.
      Nghĩa là: Sẽ có đúng 1 hình vuông chứa 2 bóng đỏ, và 2 hình vuông còn lại mỗi hình chứa 1 bóng đỏ.

      #align(center)[
        #cetz.canvas({
          import cetz.draw: *

          let w = 2.5
          let h = 1.2
          let gap = 0.5

          // Các khối hình vuông
          rect((0, 0), (w, h), fill: rgb("ffcccc"), stroke: 1pt + red, radius: 0.2, name: "S1")
          content("S1.center", text(fill: red, weight: "bold")[Hình vuông $S_1$ \ (2 bóng đỏ)])

          rect((w + gap, 0), (2 * w + gap, h), fill: rgb("ccccff"), stroke: 1pt + blue, radius: 0.2, name: "S2")
          content("S2.center", text(fill: blue, weight: "bold")[Hình vuông $S_2$ \ (1 bóng đỏ)])

          rect(
            (2 * w + 2 * gap, 0),
            (3 * w + 2 * gap, h),
            fill: rgb("ccffcc"),
            stroke: 1pt + green,
            radius: 0.2,
            name: "S3",
          )
          content("S3.center", text(fill: green, weight: "bold")[Hình vuông $S_3$ \ (1 bóng đỏ)])

          // Cách chọn
          content((w / 2, -0.8), [$C_4^2 = 6$ cách])
          content((w + gap + w / 2, -0.8), [$C_4^1 = 4$ cách])
          content((2 * w + 2 * gap + w / 2, -0.8), [$C_4^1 = 4$ cách])

          // Mũi tên và số 3 cách chọn vai trò
          content(
            (1.5 * w + gap, 2.5),
            [Có $C_3^1 = 3$ cách chọn hình vuông nào chứa 2 bóng đỏ],
            frame: "rect",
            stroke: 1pt + gray,
            padding: 5pt,
            fill: rgb("f5f5f5"),
            name: "top",
          )

          line((1.5 * w + gap, 2.0), (1.5 * w + gap, 1.4), mark: (end: ">"))
          line((1.5 * w + gap, 1.4), (w / 2, 1.4), (w / 2, h), mark: (end: ">"))
          line((1.5 * w + gap, 1.4), (2 * w + 2 * gap + w / 2, 1.4), (2 * w + 2 * gap + w / 2, h), mark: (end: ">"))
        })
      ]

      #step[Tính số phần tử của biến cố và xác suất]
      Từ sơ đồ phân tích trên, ta tính được số cách phân bố 4 vị trí bóng đèn đỏ thỏa mãn là:
      $ n(A) = 3 times C_4^2 times C_4^1 times C_4^1 = 3 times 6 times 4 times 4 = 288 text(" (cách)") $

      Xác suất cần tìm là:
      $ P = (n(A))/(n(Omega)) = 288/495 = 32/55 $

      Vậy giá trị của $4565P$ là:
      $ 4565 times 32/55 = 2656. $
    ],
  )
]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()

  // ═══════════════════════════════════════════════════════════
  // BẢNG ĐÁP ÁN (3 loại — tự động)
  // ═══════════════════════════════════════════════════════════
  pagebreak()
  print-answer-key()
}
