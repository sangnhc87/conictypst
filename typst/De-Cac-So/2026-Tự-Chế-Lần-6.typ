#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.1"
#import "../bbt.typ": *
#import "../math-sym.typ": *

#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "THPT NGUYỄN HỮU CẢNH",
  school: "ĐỀ THI THỬ LẦN 6",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 6)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "603",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  // TN questions (1 to 12)
  #tn(
    [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị là đường cong như hình vẽ bên. Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
    (
      [$(-oo; -1)$.],
      [$(1; +oo)$.],
      True([$(-1; 1)$.]),
      [$(-1; 0)$.],
    ),
    fig: cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      // Trục tọa độ
      line((-2.5, 0), (2.5, 0), mark: (end: ">"))
      content((2.5, 0.3), $x$)
      line((0, -2.5), (0, 2.5), mark: (end: ">"))
      content((0.3, 2.5), $y$)
      content((-0.3, -0.3), $O$)

      // Vẽ đồ thị y = x^3 - 3x (scaled to fit)
      let pts = ()
      for i in range(-20, 21) {
        let x = i / 12.0
        let y = (x*x*x - 3*x) * 0.6
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + black)

      // Cực trị: x = -1, y = 2*0.6 = 1.2; x = 1, y = -1.2
      circle((-1, 1.2), radius: 2pt, fill: black)
      circle((1, -1.2), radius: 2pt, fill: black)
      line((-1, 0), (-1, 1.2), stroke: (dash: "dashed", paint: gray))
      line((0, 1.2), (-1, 1.2), stroke: (dash: "dashed", paint: gray))
      line((1, 0), (1, -1.2), stroke: (dash: "dashed", paint: gray))
      line((0, -1.2), (1, -1.2), stroke: (dash: "dashed", paint: gray))

      content((-1, -0.3), $-1$)
      content((1, 0.3), $1$)
      content((0.3, 1.3), $2$)
      content((-0.3, -1.3), $-2$)
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        Quan sát đồ thị hàm số trên các khoảng để xác định tính đồng biến, nghịch biến (đường biểu diễn đi xuống từ trái sang phải biểu thị hàm số nghịch biến, đi lên biểu thị hàm số đồng biến).
      ]
      Dựa vào đồ thị, trên khoảng $(-1; 1)$, đồ thị hàm số đi xuống từ trái sang phải nên hàm số nghịch biến trên khoảng $(-1; 1)$.
      
      Chọn đáp án *C*.
    ],
  )

  #tn(
    [Trong không gian $O x y z$, cho ba vectơ $vect(a) = (2; -1; 3)$, $vect(b) = (1; 3; -2)$ và $vect(c) = (0; -2; 4)$. Tọa độ của vectơ $vect(u) = 3vect(a) - 2vect(b) + vect(c)$ là],
    (
      True([$(4; -11; 17)$.]),
      [$(4; -11; 11)$.],
      [$(8; -11; 17)$.],
      [$(4; -5; 17)$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng quy tắc cộng, trừ các vectơ theo tọa độ: nhân hệ số vào từng tọa độ của vectơ rồi cộng, trừ tương ứng các hoành độ, tung độ và cao độ.
      ]
      Ta có:
      - $3vect(a) = (6; -3; 9)$
      - $-2vect(b) = (-2; -6; 4)$
      - $vect(c) = (0; -2; 4)$

      Cộng các vectơ theo từng tọa độ:
      $
        vect(u) = (6 - 2 + 0; -3 - 6 - 2; 9 + 4 + 4) = (4; -11; 17).
      $
      Chọn đáp án *A*.
    ],
  )

  #tn(
    [Khảo sát chi tiêu mua sách (đơn vị: nghìn đồng) của $60$ học sinh tại một trường THPT, ta thu được bảng số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Nhóm chi tiêu], [$[0; 50)$], [$[50; 100)$], [$[100; 150)$], [$[150; 200)$], [$[200; 250)$],
          [Số học sinh], [10], [12], [18], [15], [5],
        )
      ]
      Nhóm chứa tứ phân vị thứ ba ($Q_3$) của mẫu số liệu trên là nhóm nào dưới đây?],
    (
      [$[100; 150)$.],
      True([$[150; 200)$.]),
      [$[50; 100)$.],
      [$[200; 250)$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính cỡ mẫu $n$.
        - Tìm vị trí của tứ phân vị thứ ba $Q_3$ ứng với giá trị thứ $3n / 4$ trong mẫu số liệu đã sắp xếp.
        - Lập bảng tần số tích lũy để xác định nhóm chứa giá trị này.
      ]
      Cỡ mẫu $n = 60$. Tứ phân vị thứ ba $Q_3$ ứng với giá trị ở vị trí thứ:
      $
        (3n) / 4 = (3 \cdot 60) / 4 = 45.
      $
      Tần số tích lũy của các nhóm lần lượt là:
      - Nhóm $[0; 50)$: $C F_1 = 10$.
      - Nhóm $[50; 100)$: $C F_2 = 10 + 12 = 22$.
      - Nhóm $[100; 150)$: $C F_3 = 22 + 18 = 40$.
      - Nhóm $[150; 200)$: $C F_4 = 40 + 15 = 55$.
      - Nhóm $[200; 250)$: $C F_5 = 55 + 5 = 60$.

      Vì $40 < 45 <= 55$ nên giá trị ở vị trí thứ $45$ nằm trong nhóm thứ tư $[150; 200)$.
      Do đó, nhóm chứa tứ phân vị thứ ba ($Q_3$) là $[150; 200)$.

      Chọn đáp án *B*.
    ],
  )

  #tn(
    [Tìm nguyên hàm $F(x)$ của hàm số $f(x) = sin 3x + e^(-x)$ thỏa mãn điều kiện $F(0) = 2$.],
    (
      True([$F(x) = -1/3 cos 3x - e^(-x) + 10/3$.]),
      [$F(x) = 1/3 cos 3x - e^(-x) + 8/3$.],
      [$F(x) = -1/3 cos 3x + e^(-x) + 4/3$.],
      [$F(x) = -3 cos 3x - e^(-x) + 6$.],
    ),
    loigiai: [
      #ppgiai[
        - Tìm họ nguyên hàm $F(x) = integral f(x) dif x$.
        - Sử dụng điều kiện $F(0) = 2$ để xác định hằng số $C$.
      ]
      Họ nguyên hàm của hàm số $f(x)$ là:
      $
        F(x) = integral (sin 3x + e^(-x)) dif x = -1/3 cos 3x - e^(-x) + C.
      $
      Theo giả thiết:
      $
        F(0) = 2 <=> -1/3 cos(0) - e^0 + C = 2 <=> -1/3 - 1 + C = 2 <=> C = 2 + 4/3 = 10/3.
      $
      Vậy nguyên hàm cần tìm là $F(x) = -1/3 cos 3x - e^(-x) + 10/3$.

      Chọn đáp án *A*.
    ],
  )

  #tn(
    [Một hộp chứa $6$ quả cầu màu đỏ và $4$ quả cầu màu xanh có kích thước giống nhau. Chọn ngẫu nhiên đồng thời $3$ quả cầu từ hộp đó. Xác suất để chọn được ít nhất một quả cầu màu xanh bằng],
    (
      [$1/6$.],
      True([$5/6$.]),
      [$2/3$.],
      [$1/2$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính số phần tử của không gian mẫu: số cách chọn ngẫu nhiên 3 quả từ 10 quả.
        - Dùng biến cố đối: "Cả 3 quả cầu được chọn đều màu đỏ".
        - Tính xác suất của biến cố đối rồi suy ra xác suất cần tìm.
      ]
      Số phần tử của không gian mẫu là:
      $
        n(Omega) = C_(10)^3 = 120.
      $
      Gọi $A$ là biến cố "Chọn được ít nhất một quả cầu màu xanh".
      Biến cố đối $A'$ là "Cả 3 quả cầu được chọn đều có màu đỏ".
      Số kết quả thuận lợi cho $A'$ là:
      $
        n(A') = C_6^3 = 20.
      $
      Xác suất của biến cố đối $A'$ là:
      $
        P(A') = n(A') / n(Omega) = 20 / 120 = 1/6.
      $
      Do đó, xác suất của biến cố $A$ là:
      $
        P(A) = 1 - P(A') = 1 - 1/6 = 5/6.
      $
      Chọn đáp án *B*.
    ],
  )

  #tn(
    [Tập nghiệm của bất phương trình $log_3 (x - 2) + log_3 (x - 4) < 1$ là],
    (
      [$(1; 5)$.],
      True([$(4; 5)$.]),
      [$(2; 5)$.],
      [$(4; +oo)$.],
    ),
    loigiai: [
      #ppgiai[
        - Đặt điều kiện xác định cho các biểu thức dưới dấu logarit.
        - Biến đổi tổng hai logarit cùng cơ số thành logarit của một tích.
        - Bỏ logarit (do cơ số $3 > 1$ nên giữ nguyên chiều bất phương trình) rồi giải bất phương trình bậc hai thu được.
        - Kết hợp nghiệm với điều kiện ban đầu.
      ]
      Điều kiện xác định:
      $
        cases(x - 2 > 0, x - 4 > 0) <=> x > 4.
      $
      Khi đó bất phương trình tương đương với:
      $
        log_3 ((x - 2)(x - 4)) < 1 <=> (x - 2)(x - 4) < 3^1
      $
      $
        <=> x^2 - 6x + 8 < 3 <=> x^2 - 6x + 5 < 0 <=> 1 < x < 5.
      $
      Kết hợp với điều kiện $x > 4$, ta được tập nghiệm của bất phương trình là $(4; 5)$.

      Chọn đáp án *B*.
    ],
  )

  #tn(
    [Cho hình lập phương $A B C D . A' B' C' D'$. Góc giữa đường thẳng $A' C$ và mặt phẳng $(A B C D)$ là $alpha$. Giá trị $tan alpha$ bằng],
    (
      [$sqrt(2)$.],
      True([$sqrt(2) / 2$.]),
      [$sqrt(3) / 3$.],
      [$sqrt(6) / 3$.],
    ),
    loigiai: [
      #ppgiai[
        - Xác định hình chiếu vuông góc của đường thẳng $A' C$ trên mặt phẳng $(A B C D)$.
        - Góc giữa đường thẳng và mặt phẳng chính là góc giữa đường thẳng đó và hình chiếu của nó trên mặt phẳng.
        - Sử dụng hệ thức lượng trong tam giác vuông để tính $tan alpha$.
      ]
      Vì $A' A perp (A B C D)$ nên $A$ là hình chiếu vuông góc của $A'$ trên mặt phẳng $(A B C D)$.
      Do đó, $A C$ là hình chiếu vuông góc của đường thẳng $A' C$ trên mặt phẳng $(A B C D)$.
      Suy ra góc giữa đường thẳng $A' C$ và mặt phẳng $(A B C D)$ chính là góc $hat(A' C A) = alpha$.

      Giả sử cạnh của hình lập phương có độ dài là $a$. Khi đó:
      - $A' A = a$ (độ dài cạnh bên).
      - $A C = a sqrt(2)$ (độ dài đường chéo hình vuông đáy $A B C D$).

      Trong tam giác $A' A C$ vuông tại $A$, ta có:
      $
        tan alpha = (A' A) / (A C) = a / (a sqrt(2)) = 1 / sqrt(2) = sqrt(2) / 2.
      $
      Chọn đáp án *B*.
    ],
  )

  #tn(
    [Trong không gian $O x y z$, cho điểm $A(3; -2; 4)$. Hình chiếu vuông góc của điểm $A$ lên mặt phẳng tọa độ $(O y z)$ có tọa độ là],
    (
      True([$(0; -2; 4)$.]),
      [$(3; 0; 4)$.],
      [$(3; -2; 0)$.],
      [$(0; -2; 0)$.],
    ),
    loigiai: [
      #ppgiai[
        Hình chiếu vuông góc của một điểm $M(x_0; y_0; z_0)$ lên mặt phẳng tọa độ $(O y z)$ thu được bằng cách giữ nguyên tung độ, cao độ và cho hoành độ bằng 0.
      ]
      Hình chiếu vuông góc của $A(3; -2; 4)$ lên mặt phẳng tọa độ $(O y z)$ là điểm $A'$ có hoành độ bằng $0$, giữ nguyên tung độ và cao độ.
      Vậy tọa độ điểm $A'$ là $(0; -2; 4)$.

      Chọn đáp án *A*.
    ],
  )

  #tn(
    [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x (x - 2)^2 (x + 3)^3$ với mọi $x in RR$. Số điểm cực trị của hàm số đã cho là],
    (
      [$3$.],
      True([$2$.]),
      [$1$.],
      [$4$.],
    ),
    loigiai: [
      #ppgiai[
        Số điểm cực trị của hàm số là số nghiệm thực của phương trình $f'(x) = 0$ mà tại đó đạo hàm $f'(x)$ đổi dấu.
      ]
      Phương trình $f'(x) = 0 <=> x (x - 2)^2 (x + 3)^3 = 0$ có các nghiệm:
      - $x = 0$ là nghiệm đơn (nghiệm bội lẻ) $=>$ $f'(x)$ đổi dấu khi qua $x = 0$.
      - $x = 2$ là nghiệm kép (nghiệm bội chẵn) $=>$ $f'(x)$ không đổi dấu khi qua $x = 2$.
      - $x = -3$ là nghiệm bội 3 (nghiệm bội lẻ) $=>$ $f'(x)$ đổi dấu khi qua $x = -3$.

      Do $f'(x)$ đổi dấu khi qua hai điểm $x = 0$ và $x = -3$, hàm số đã cho có $2$ điểm cực trị.

      Chọn đáp án *B*.
    ],
  )

  #tn(
    [Diện tích hình phẳng giới hạn bởi đường cong $y = x^2 - 4x + 3$ và đường thẳng $y = x - 1$ bằng],
    (
      True([$9 / 2$.]),
      [$9 / 4$.],
      [$27 / 2$.],
      [$9 / 8$.],
    ),
    loigiai: [
      #ppgiai[
        - Giải phương trình hoành độ giao điểm của hai đường để tìm các cận tích phân.
        - Áp dụng công thức tính diện tích hình phẳng: $S = integral_a^b |f(x) - g(x)| dif x$.
      ]
      Phương trình hoành độ giao điểm:
      $
        x^2 - 4x + 3 = x - 1 <=> x^2 - 5x + 4 = 0 <=> hoac(x = 1, x = 4).
      $
      Diện tích hình phẳng giới hạn bởi hai đường là:
      $
        S = integral_1^4 |(x^2 - 4x + 3) - (x - 1)| dif x = integral_1^4 |x^2 - 5x + 4| dif x.
      $
      Với $x in [1; 4]$, ta có $x^2 - 5x + 4 <= 0$. Do đó:
      $
        S = integral_1^4 ( -x^2 + 5x - 4 ) dif x = lr(( -x^3 / 3 + 5 / 2 x^2 - 4x ) |)_1^4
      $
      $
        = ( -64 / 3 + 40 - 16 ) - ( -1 / 3 + 5 / 2 - 4 ) = 8 / 3 - ( -11 / 6 ) = 16 / 6 + 11 / 6 = 27 / 6 = 9 / 2.
      $
      Chọn đáp án *A*.
    ],
  )

  #tn(
    [Cường độ ánh sáng đi qua một môi trường nước giảm dần theo độ sâu $d$ (mét) theo công thức $I(d) = I_0 \cdot e^(-mu d)$, trong đó $I_0$ là cường độ ánh sáng ban đầu tại bề mặt nước và $mu > 0$ là hệ số hấp thụ của nước. Biết một hồ nước có hệ số hấp thụ $mu = 0,25 m^(-1)$. Ở độ sâu nào (làm tròn kết quả đến hàng phần mười của mét) thì cường độ ánh sáng giảm đi chỉ còn bằng $50\%$ so với cường độ ánh sáng tại bề mặt?],
    (
      [$1,4$ m.],
      True([$2,8$ m.]),
      [$5,5$ m.],
      [$3,2$ m.],
    ),
    loigiai: [
      #ppgiai[
        - Thiết lập phương trình biểu thị yêu cầu bài toán: $I(d) = 0,5 I_0$.
        - Giải phương trình mũ chứa cơ số $e$ để tìm $d$.
      ]
      Theo đề bài, ta cần tìm độ sâu $d$ sao cho:
      $
        I(d) = 0,5 I_0 <=> I_0 \cdot e^(-0,25 d) = 0,5 I_0 <=> e^(-0,25 d) = 0,5.
      $
      Lấy logarit tự nhiên hai vế, ta được:
      $
        -0,25 d = ln(1/2) <=> -0,25 d = -ln 2 <=> d = (ln 2) / 0,25 = 4 ln 2 approx 4 \cdot 0,69315 = 2,7726 " (m)".
      $
      Làm tròn kết quả đến hàng phần mười, ta được $d approx 2,8$ m.

      Chọn đáp án *B*.
    ],
  )

  #tn(
    [Trong không gian $O x y z$, cho điểm $A(1; 2; -3)$ và đường thẳng $d: (x - 2) / 1 = (y + 1) / (-2) = z / 3$. Phương trình mặt phẳng $(P)$ đi qua điểm $A$ và vuông góc với đường thẳng $d$ là],
    (
      True([$x - 2y + 3z + 12 = 0$.]),
      [$x - 2y + 3z - 12 = 0$.],
      [$2x - y + 3z + 9 = 0$.],
      [$x - 2y + 3z = 0$.],
    ),
    loigiai: [
      #ppgiai[
        - Đường thẳng $d$ có vectơ chỉ phương $vect(u) = (1; -2; 3)$.
        - Mặt phẳng $(P)$ vuông góc với đường thẳng $d$ nên nhận vectơ chỉ phương $vect(u)$ của đường thẳng $d$ làm vectơ pháp tuyến.
        - Phương trình mặt phẳng đi qua $M(x_0; y_0; z_0)$ có vectơ pháp tuyến $vect(n) = (A; B; C)$ là $A(x - x_0) + B(y - y_0) + C(z - z_0) = 0$.
      ]
      Đường thẳng $d$ có vectơ chỉ phương $vect(u) = (1; -2; 3)$.
      Vì mặt phẳng $(P)$ vuông góc với $d$ nên vectơ pháp tuyến của $(P)$ là $vect(n) = vect(u) = (1; -2; 3)$.
      Phương trình mặt phẳng $(P)$ đi qua $A(1; 2; -3)$ là:
      $
        1(x - 1) - 2(y - 2) + 3(z + 3) = 0 <=> x - 2y + 3z - 1 + 4 + 9 = 0 <=> x - 2y + 3z + 12 = 0.
      $
      Chọn đáp án *A*.
    ],
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

  #ds(
    [Cho hàm số $f(x) = (m x - 4) / (x - m)$, với $m$ là tham số thực.],
    (
      True([Với $m = 3$, hàm số đã cho nghịch biến trên khoảng $(3; +oo)$.]),
      True([Tập hợp tất cả các giá trị thực của $m$ để hàm số đồng biến trên từng khoảng xác định của nó là khoảng $(-2; 2)$.]),
      [Có đúng $3$ giá trị nguyên của tham số $m$ để hàm số nghịch biến trên khoảng $(1; +oo)$.],
      True([Với $m = 1$, giá trị lớn nhất của hàm số trên đoạn $[-1; 0]$ bằng $4$.]),
    ),
    loigiai: [
      #ppgiai[
        - Tìm tập xác định và tính đạo hàm của hàm số.
        - Hàm số đồng biến (hoặc nghịch biến) trên từng khoảng xác định khi và chỉ khi đạo hàm luôn dương (hoặc luôn âm) trên tập xác định.
        - Để hàm số đơn điệu trên khoảng $(a; +oo)$, ta cần thêm điều kiện điểm gián đoạn không thuộc khoảng này, tức là $m <= a$.
      ]

      Tập xác định: $D = RR setminus {m}$.
      Đạo hàm của hàm số:
      $
        f'(x) = ( -m^2 + 4 ) / (x - m)^2.
      $

      *a)* Với $m = 3$, ta có $f'(x) = -5 / (x - 3)^2 < 0$ với mọi $x != 3$. Do đó hàm số nghịch biến trên từng khoảng xác định, bao gồm khoảng $(3; +oo)$. Mệnh đề a *ĐÚNG*.

      *b)* Hàm số đồng biến trên từng khoảng xác định khi và chỉ khi:
      $
        f'(x) > 0, quad forall x in D <=> -m^2 + 4 > 0 <=> m^2 < 4 <=> -2 < m < 2.
      $
      Vậy tập hợp các giá trị thực của $m$ là khoảng $(-2; 2)$. Mệnh đề b *ĐÚNG*.

      *c)* Hàm số nghịch biến trên khoảng $(1; +oo)$ khi và chỉ khi:
      $
        cases(f'(x) < 0 quad forall x in D, m <= 1) <=> cases(m^2 > 4, m <= 1) <=> cases(hoac(m > 2, m < -2), m <= 1) <=> m < -2.
      $
      Vì $m$ là số nguyên thỏa mãn $m < -2$ nên có vô số giá trị nguyên của $m$ thỏa mãn (ví dụ: $-3, -4, -5, dots$). Do đó mệnh đề c *SAI*.

      *d)* Với $m = 1$, ta có $f(x) = (x - 4)/(x - 1)$ và $f'(x) = 3/(x-1)^2 > 0, forall x != 1$.
      Do đó hàm số đồng biến trên đoạn $[-1; 0]$.
      Giá trị lớn nhất của hàm số trên đoạn $[-1; 0]$ đạt tại điểm biên bên phải $x = 0$:
      $
        max_([-1; 0]) f(x) = f(0) = (0 - 4)/(0 - 1) = 4.
      $
      Mệnh đề d *ĐÚNG*.
    ],
  )

  #ds(
    [Trong không gian với hệ tọa độ $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 - 2x - 4y - 6z - 2 = 0$ và mặt phẳng $(P): 2x + 2y - z + m = 0$ (với $m$ là tham số thực).],
    (
      True([Mặt cầu $(S)$ có tâm là $I(1; 2; 3)$ và bán kính $R = 4$.]),
      [Mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$ khi và chỉ khi $m = 5$ hoặc $m = -19$.],
      [Với $m = -3$, mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo một đường tròn có bán kính $r = sqrt(15)$.],
      True([Cho đường thẳng $d$ đi qua tâm $I(1; 2; 3)$ và vuông góc với mặt phẳng $(Q): x - 2y + 2z - 5 = 0$. Đường thẳng $d$ cắt mặt cầu $(S)$ tại hai điểm $A, B$ thỏa mãn $A B = 8$.]),
    ),
    loigiai: [
      #ppgiai[
        - Xác định tâm và bán kính mặt cầu từ phương trình tổng quát.
        - Khoảng cách từ tâm $I$ đến mặt phẳng $(P)$ quyết định vị trí tương đối giữa mặt phẳng và mặt cầu:
          - Tiếp xúc khi và chỉ khi $d(I, (P)) = R$.
          - Cắt theo một đường tròn khi và chỉ khi $d(I, (P)) < R$, lúc đó bán kính đường tròn giao tuyến là $r = sqrt(R^2 - d^2)$.
        - Một đường thẳng đi qua tâm của mặt cầu luôn cắt mặt cầu tại hai điểm đối xứng qua tâm và độ dài đoạn thẳng nối hai giao điểm đó chính là đường kính của mặt cầu.
      ]

      *a)* Phương trình mặt cầu $(S)$ có các hệ số: $a = 1$, $b = 2$, $c = 3$, $d = -2$.
      Tâm của mặt cầu là $I(1; 2; 3)$, bán kính:
      $
        R = sqrt(a^2 + b^2 + c^2 - d) = sqrt(1^2 + 2^2 + 3^2 - (-2)) = sqrt(16) = 4.
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$ khi và chỉ khi:
      $
        d(I, (P)) = R <=> ( |2(1) + 2(2) - 3 + m| ) / sqrt(2^2 + 2^2 + (-1)^2) = 4
      $
      $
        <=> ( |3 + m| ) / 3 = 4 <=> |3 + m| = 12 <=> hoac(3 + m = 12, 3 + m = -12) <=> hoac(m = 9, m = -15).
      $
      Mệnh đề nói $m = 5$ hoặc $m = -19$ là *SAI*.

      *c)* Với $m = -3$, mặt phẳng là $(P): 2x + 2y - z - 3 = 0$.
      Khoảng cách từ tâm $I$ đến mặt phẳng $(P)$ là:
      $
        d = d(I, (P)) = ( |2(1) + 2(2) - 3 - 3| ) / 3 = 0.
      $
      Vì $d = 0 < R = 4$ nên mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo một đường tròn lớn có bán kính:
      $
        r = R = 4.
      $
      Mệnh đề nói $r = sqrt(15)$ là *SAI*.

      *d)* Đường thẳng $d$ đi qua tâm $I$ của mặt cầu $(S)$ nên đường thẳng này chứa một đường kính của mặt cầu.
      Do đó, $d$ cắt mặt cầu tại hai điểm $A, B$ đối xứng qua tâm $I$, khi đó độ dài đoạn thẳng $A B$ chính là đường kính của mặt cầu:
      $
        A B = 2R = 2 \cdot 4 = 8.
      $
      Mệnh đề d *ĐÚNG*.
    ],
  )

  #ds(
    [Trong một nhà máy sản xuất linh kiện điện tử, một robot kiểm thử tự động được sử dụng để phát hiện các bo mạch bị lỗi phần cứng trước khi đóng gói. Thống kê từ dây chuyền sản xuất cho thấy tỷ lệ bo mạch bị lỗi thực tế là $3\%$. Khi tiến hành kiểm tra một bo mạch:
      - Nếu bo mạch thực sự lỗi, robot có xác suất kết luận chính xác là "Lỗi" là $98\%$.
      - Nếu bo mạch không bị lỗi, robot có xác suất kết luận chính xác là "Bình thường" là $95\%$.
      Chọn ngẫu nhiên một bo mạch từ dây chuyền sản xuất để robot kiểm thử.],
    (
      True([Xác suất để robot kết luận bo mạch được chọn bị "Lỗi" bằng $0,0779$.]),
      True([Biết robot kết luận bo mạch bị "Lỗi", xác suất để bo mạch này thực sự không bị lỗi lớn hơn $60\%$.]),
      True([Biết robot kết luận bo mạch là "Bình thường", xác suất để bo mạch đó thực sự bị lỗi xấp xỉ $0,065\%$.]),
      [Nếu robot kiểm tra độc lập $10$ bo mạch thực sự bị lỗi, xác suất để robot này bỏ sót ít nhất một bo mạch lỗi lớn hơn $20\%$.],
    ),
    loigiai: [
      #ppgiai[
        - Gọi các biến cố:
          - $L$: "Bo mạch thực sự bị lỗi", $P(L) = 0,03$.
          - $K$: "Bo mạch thực sự không bị lỗi" (bình thường), $P(K) = 0,97$.
          - $A$: "Robot kết luận bo mạch bị Lỗi".
          - $B$: "Robot kết luận bo mạch Bình thường".
        - Các xác suất có điều kiện đã cho:
          - $P(A | L) = 0,98 => P(B | L) = 0,02$.
          - $P(B | K) = 0,95 => P(A | K) = 0,05$.
        - Sử dụng công thức xác suất đầy đủ và công thức Bayes.
      ]

      *a)* Áp dụng công thức xác suất đầy đủ, xác suất để robot kết luận bo mạch bị "Lỗi" là:
      $
        P(A) = P(L) \cdot P(A | L) + P(K) \cdot P(A | K)
        = 0,03 \cdot 0,98 + 0,97 \cdot 0,05
      $
      $
        = 0,0294 + 0,0485 = 0,0779.
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Biết robot kết luận bo mạch bị "Lỗi", xác suất để bo mạch thực sự không bị lỗi (tức là robot kết luận sai) là:
      $
        P(K | A) = ( P(K) \cdot P(A | K) ) / P(A) = (0,97 \cdot 0,05) / 0,0779 = 0,0485 / 0,0779 approx 0,6226 = 62,26\%.
      $
      Vì $62,26\% > 60\%$ nên mệnh đề b *ĐÚNG*.

      *c)* Biết robot kết luận bo mạch là "Bình thường", xác suất để bo mạch thực sự bị lỗi (robot bỏ sót lỗi) là:
      $
        P(L | B) = ( P(L) \cdot P(B | L) ) / P(B)
      $
      Trong đó $P(B) = 1 - P(A) = 1 - 0,0779 = 0,9221$.
      Do đó:
      $
        P(L | B) = (0,03 \cdot 0,02) / 0,9221 = 0,0006 / 0,9221 approx 0,0006507 = 0,06507\% approx 0,065\%.
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Khi kiểm tra một bo mạch lỗi, xác suất robot bỏ sót (tức kết luận là Bình thường) là $P(B | L) = 0,02$.
      Khi kiểm tra độc lập $10$ bo mạch lỗi, xác suất robot không bỏ sót bất kỳ bo mạch lỗi nào là:
      $
        P_(text("không")) = (0,98)^(10) approx 0,8171 = 81,71\%.
      $
      Xác suất robot bỏ sót ít nhất một bo mạch lỗi là:
      $
        P_(text("bỏ sót")) = 1 - P_(text("không")) = 1 - 0,8171 = 0,1829 = 18,29\%.
      $
      Vì $18,29\% < 20\%$ nên mệnh đề d *SAI*.
    ],
  )

  #ds(
    [Mức cường độ âm $L$ (đơn vị: decibel, kí hiệu là dB) của một sóng âm có cường độ âm $I$ (đơn vị: $W / m^2$) được xác định bởi công thức: $L = 10 log_(10) (I / I_0)$, trong đó $I_0 = 10^(-12) W / m^2$ là cường độ âm chuẩn.],
    (
      True([Một cuộc nói chuyện bình thường có cường độ âm $I = 10^(-6) W / m^2$ thì mức cường độ âm tương ứng là $60$ dB.]),
      True([Tiếng còi xe cứu thương có mức cường độ âm là $110$ dB. Cường độ âm của tiếng còi xe cứu thương gấp $100.000$ lần cường độ âm của cuộc nói chuyện bình thường.]),
      [Để bảo vệ thính lực cho người lao động, mức cường độ âm tối đa khuyến cáo khi tiếp xúc liên tục trong $8$ giờ làm việc là $85$ dB. Nếu cường độ âm tăng lên gấp đôi thì mức cường độ âm mới sẽ vượt quá $90$ dB.],
      True([Một dàn nhạc gồm $10$ cây vĩ cầm (violin) giống nhau cùng chơi ở một vị trí. Nếu một cây vĩ cầm chơi đơn lẻ tạo ra mức cường độ âm là $70$ dB tại một điểm khảo sát, thì cả $10$ cây vĩ cầm cùng chơi sẽ tạo ra mức cường độ âm là $80$ dB tại điểm đó.]),
    ),
    loigiai: [
      #ppgiai[
        - Sử dụng công thức $L = 10 log_(10) (I / I_0)$ để tính mức cường độ âm theo cường độ âm và ngược lại.
        - Hiệu mức cường độ âm giữa hai nguồn âm: $L_2 - L_1 = 10 log_(10) (I_2 / I_1)$.
        - Khi cường độ âm tăng gấp $k$ lần ($I_2 = k I_1$), mức cường độ âm tăng thêm $10 log_(10) k$ dB.
      ]

      *a)* Với $I = 10^(-6) W / m^2$, ta có:
      $
        L = 10 log_(10) (10^(-6) / 10^(-12)) = 10 log_(10) (10^6) = 10 \cdot 6 = 60 " (dB)".
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Mức cường độ âm của còi xe cứu thương là $L_2 = 110$ dB, của cuộc nói chuyện bình thường là $L_1 = 60$ dB.
      Hiệu mức cường độ âm:
      $
        L_2 - L_1 = 110 - 60 = 50 " (dB)".
      $
      Ta có:
      $
        10 log_(10) (I_2 / I_1) = 50 <=> log_(10) (I_2 / I_1) = 5 <=> I_2 / I_1 = 10^5 = 100.000.
      $
      Vậy cường độ âm gấp $100.000$ lần. Mệnh đề b *ĐÚNG*.

      *c)* Cường độ âm ban đầu là $I_1$ có mức cường độ âm $L_1 = 85$ dB.
      Khi cường độ âm tăng gấp đôi, tức là $I_2 = 2 I_1$, mức cường độ âm mới là:
      $
        L_2 = 10 log_(10) (2 I_1 / I_0) = 10 (log_(10) 2 + log_(10) (I_1 / I_0)) = 10 log_(10) 2 + L_1
      $
      $
        = 10 log_(10) 2 + 85 approx 3,01 + 85 = 88,01 " (dB)".
      $
      Vì $88,01 < 90$ dB nên mức cường độ âm mới không vượt quá $90$ dB. Mệnh đề c *SAI*.

      *d)* Cường độ âm của $10$ cây vĩ cầm chơi cùng lúc bằng tổng cường độ âm của từng cây: $I_(10) = 10 I_1$.
      Mức cường độ âm tương ứng:
      $
        L_(10) = 10 log_(10) (10 I_1 / I_0) = 10 (log_(10) 10 + log_(10) (I_1 / I_0)) = 10 (1 + L_1 / 10) = 10 + L_1 = 10 + 70 = 80 " (dB)".
      $
      Mệnh đề d *ĐÚNG*.
    ],
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Câu trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  #tln(
    [Hệ số Gini ($G$) là một chỉ số đo lường mức độ bất bình đẳng trong phân phối thu nhập của một quốc gia. Hệ số này được xác định bởi công thức: $G = 1 - 2 integral_0^1 L(x) dif x$, trong đó $x$ biểu thị tỉ lệ cộng dồn dân số ($x in [0; 1]$) và $L(x)$ biểu thị tỉ lệ cộng dồn thu nhập tương ứng ($L(x) in [0; 1]$). Đường cong biểu diễn $L(x)$ được gọi là đường cong Lorenz. Do không biết biểu thức giải tích của $L(x)$, các nhà kinh tế thường dùng phương pháp hình thang để ước lượng tích phân $I = integral_0^1 L(x) dif x$ dựa trên bảng số liệu thống kê thực tế. Bảng dưới đây thống kê tỉ lệ cộng dồn dân số ($x$) và tỉ lệ cộng dồn thu nhập ($y = L(x)$) của một quốc gia:
      #align(center)[
        #table(
          columns: 7,
          align: center,
          stroke: 0.5pt + black,
          [$x$], [0], [0,2], [0,4], [0,6], [0,8], [1,0],
          [$y = L(x)$], [0], [0,05], [0,15], [0,30], [0,55], [1,00],
        )
      ]
      Hãy ước lượng hệ số Gini ($G$) của quốc gia này bằng phương pháp hình thang (làm tròn kết quả đến hàng phần trăm).],
    [0,38],
    loigiai: [
      #ppgiai[
        - Áp dụng công thức hình thang cho các khoảng chia đều có độ rộng $Delta x = 0,2$:
          $
            I = integral_a^b f(x) dif x approx (Delta x) / 2 [y_0 + 2y_1 + 2y_2 + dots + 2y_(n-1) + y_n].
          $
        - Thay giá trị từ bảng số liệu để tính tích phân ước lượng $I$.
        - Tính hệ số Gini $G = 1 - 2I$.
      ]

      Tích phân $I = integral_0^1 L(x) dif x$ được ước lượng bằng phương pháp hình thang với $n = 5$ đoạn có độ rộng bằng nhau $Delta x = 0,2$:
      $
        I approx (Delta x) / 2 \cdot (y_0 + 2y_1 + 2y_2 + 2y_3 + 2y_4 + y_5)
      $
      $
        = 0,2 / 2 \cdot (0 + 2(0,05) + 2(0,15) + 2(0,30) + 2(0,55) + 1,00)
      $
      $
        = 0,1 \cdot (0 + 0,10 + 0,30 + 0,60 + 1,10 + 1,00) = 0,1 \cdot 3,10 = 0,31.
      $

      Hệ số Gini ước lượng được là:
      $
        G = 1 - 2I approx 1 - 2 \cdot 0,31 = 0,38.
      $
      Vậy đáp số là *0,38*.
    ],
  )

  #tln(
    [Một chiếc cửa sổ Norman gồm một phần hình chữ nhật phía dưới và một phần hình bán nguyệt phía trên ghép lại với nhau như hình vẽ bên. Biết chu vi của toàn bộ khung cửa sổ (không tính thanh phân cách ở giữa) cố định là $P = 6$ mét. Để lượng ánh sáng đi qua cửa sổ là lớn nhất thì diện tích cửa sổ phải đạt giá trị lớn nhất. Hãy tính bán kính $R$ (mét) của hình bán nguyệt khi đó (làm tròn kết quả đến hàng phần trăm).],
    [0,84],
    fig: cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      // Vẽ hình chữ nhật
      rect((-1.2, 0), (1.2, 2.0), stroke: 1.2pt + black)
      // Vẽ bán nguyệt trên đỉnh
      arc((1.2, 2.0), start: 0deg, stop: 180deg, radius: 1.2, stroke: 1.2pt + black)
      // Đường nét đứt phân chia
      line((-1.2, 2.0), (1.2, 2.0), stroke: (dash: "dashed", paint: gray))
      // Bán kính R
      line((0, 2.0), (1.2, 2.0), stroke: 0.8pt + blue)
      circle((0, 2.0), radius: 1.5pt, fill: blue)
      content((0.6, 2.3), text(fill: blue)[$R$])
      // Chiều cao h
      line((-1.4, 0), (-1.4, 2.0), mark: (both: ">"), stroke: 0.8pt + red)
      content((-1.7, 1.0), text(fill: red)[$h$])
    }),
    fig-pos: "right",
    fig-width: 25%,
    loigiai: [
      #ppgiai[
        - Gọi $R$ là bán kính của hình bán nguyệt, chiều rộng hình chữ nhật là $2R$, chiều cao hình chữ nhật là $h$.
        - Thiết lập biểu thức chu vi cửa sổ để biểu diễn $h$ theo $R$.
        - Biển diễn diện tích cửa sổ thành một tam thức bậc hai theo $R$, sau đó tìm giá trị $R$ để diện tích lớn nhất.
      ]

      Gọi bán kính của hình bán nguyệt là $R$ ($R > 0$, đơn vị: mét). Chiều rộng của hình chữ nhật tương ứng là $2R$. Gọi chiều cao của hình chữ nhật là $h$ ($h > 0$, đơn vị: mét).
      Chu vi của khung cửa sổ là tổng độ dài của ba cạnh hình chữ nhật và nửa đường tròn phía trên:
      $
        P = 2h + 2R + pi R = 6 <=> 2h = 6 - (2 + pi)R <=> h = 3 - (1 + pi / 2)R.
      $

      Diện tích của cửa sổ là:
      $
        S = S_(text("chữ nhật")) + S_(text("bán nguyệt")) = 2R h + 1/2 pi R^2
      $
      $
        = 2R(3 - (1 + pi / 2)R) + 1/2 pi R^2 = 6R - (2 + pi)R^2 + 1/2 pi R^2
      $
      $
        = 6R - (2 + pi / 2)R^2.
      $

      Đây là hàm số bậc hai của $R$ có dạng $y = a R^2 + b R + c$ với $a = -(2 + pi / 2) < 0$.
      Hàm số đạt giá trị lớn nhất tại đỉnh của parabol:
      $
        R = -b / (2a) = -6 / ( -2(2 + pi / 2) ) = 6 / (4 + pi) approx 6 / (4 + 3,14159) approx 0,8402 " (m)".
      $
      Làm tròn đến hàng phần trăm, ta được bán kính cần tìm là *$0,84$* mét.
    ],
  )

  #tln(
    [Trong không gian tọa độ $O x y z$ (đơn vị đo trên các trục là mét), một vòm hầm giao thông xuyên núi có dạng một mặt trụ với mặt cắt ngang là một parabol có phương trình $y = -x^2 + 4$ (với $x in [-2; 2]$) nằm trên mặt phẳng $O x y$, trục của đường hầm nằm dọc theo trục cao độ $O z$. Một thiết bị bay tự động (drone) di chuyển dọc theo một đường thẳng song song với trục đường hầm và đi qua điểm $A(0; 2; 5)$. Trong quá trình bay, khoảng cách ngắn nhất từ đường bay của thiết bị đến vòm hầm parabol bằng bao nhiêu mét? (Làm tròn kết quả đến hàng phần trăm).],
    [1,32],
    loigiai: [
      #ppgiai[
        - Đường bay $d$ song song với $O z$ và đi qua $A(0; 2; 5)$ có dạng $x = 0$, $y = 2$, $z = t_1$ ($t_1 in RR$).
        - Vòm hầm là mặt trụ có đáy là parabol $y = -x^2 + 4$ trong mặt phẳng $O x y$. Do đó, một điểm $P$ nằm trên vòm hầm có tọa độ $(x_0; -x_0^2 + 4; z_0)$ với $x_0 in [-2; 2]$ và $z_0 in RR$.
        - Khoảng cách từ một điểm $M(0; 2; z)$ trên đường bay đến vòm hầm sẽ đạt giá trị nhỏ nhất khi xét trong mặt phẳng ngang $z_0 = z$. Khi đó, bài toán đưa về việc tìm khoảng cách ngắn nhất giữa điểm $H(0; 2)$ và parabol $y = -x^2 + 4$ trong mặt phẳng $O x y$.
      ]

      Quỹ đạo bay của drone là đường thẳng $d$ đi qua $A(0; 2; 5)$ và song song với $O z$. Phương trình của $d$ là:
      $
        d: cases(x = 0, y = 2, z = 5 + t_1) quad (t_1 in RR).
      $
      Bề mặt vòm hầm được xác định bởi phương trình $y = -x^2 + 4$ với $x in [-2; 2]$ và cao độ $z$ tùy ý.
      Với một điểm $M(0; 2; z)$ bất kỳ thuộc đường bay $d$, khoảng cách từ $M$ đến một điểm $P(x_0; -x_0^2 + 4; z_0)$ trên vòm hầm là:
      $
        M P = sqrt(x_0^2 + (-x_0^2 + 4 - 2)^2 + (z_0 - z)^2) = sqrt(x_0^2 + (2 - x_0^2)^2 + (z_0 - z)^2).
      $
      Để $M P$ nhỏ nhất, ta chọn $z_0 = z$ (tức là xét khoảng cách trong mặt phẳng nằm ngang tại cao độ $z$). Khi đó khoảng cách bằng khoảng cách từ điểm $H(0; 2)$ đến điểm $K(x_0; -x_0^2 + 4)$ trên parabol trong mặt phẳng $O x y$:
      $
        d(H, K) = sqrt(x_0^2 + (2 - x_0^2)^2) = sqrt(x_0^2 + 4 - 4x_0^2 + x_0^4) = sqrt(x_0^4 - 3x_0^2 + 4).
      $

      Đặt $u = x_0^2$. Vì $x_0 in [-2; 2]$ nên $u in [0; 4]$. Ta cần tìm giá trị nhỏ nhất của hàm số:
      $
        f(u) = u^2 - 3u + 4 quad text("trên đoạn") [0; 4].
      $
      Hàm số $f(u)$ đạt giá trị nhỏ nhất tại đỉnh của parabol:
      $
        u_0 = -b / (2a) = 3 / 2 = 1,5 in [0; 4].
      $
      Giá trị nhỏ nhất của hàm số là:
      $
        f(1,5) = (1,5)^2 - 3 \cdot 1,5 + 4 = 2,25 - 4,5 + 4 = 1,75.
      $
      Do đó, khoảng cách ngắn nhất là:
      $
        d_(min) = sqrt(7/4) = (sqrt(7)) / 2 approx 1,32287 " (m)".
      $
      Làm tròn đến hàng phần trăm, ta được kết quả là *$1,32$*.
    ],
  )

  #tln(
    [Một công ty truyền thông thiết kế một logo có hình dạng được giới hạn bởi các đường cong trên mặt phẳng tọa độ $O x y$: phần phía trên trục hoành của đường tròn $x^2 + y^2 = 8$ và đường parabol $y = x^2 / 2$. Diện tích phần hình phẳng giới hạn bởi nửa trên của đường tròn và phía trên đường parabol bằng bao nhiêu? (Làm tròn kết quả đến hàng phần mười).],
    [7,6],
    loigiai: [
      #ppgiai[
        - Tìm giao điểm của hai đường cong bằng cách giải hệ phương trình:
          $
            cases(x^2 + y^2 = 8 (y >= 0), y = x^2 / 2).
          $
        - Xác định công thức tính diện tích hình phẳng:
          $
            S = integral_a^b (y_(text("trên")) - y_(text("dưới"))) dif x.
          $
        - Sử dụng phương pháp đổi biến số lượng giác để tính tích phân chứa căn thức.
      ]

      Phương trình hoành độ giao điểm của nửa trên đường tròn $y = sqrt(8 - x^2)$ và parabol $y = x^2 / 2$ là:
      $
        sqrt(8 - x^2) = x^2 / 2 <=> 8 - x^2 = x^4 / 4 <=> x^4 + 4x^2 - 32 = 0.
      $
      Đặt $t = x^2 >= 0$, ta được phương trình:
      $
        t^2 + 4t - 32 = 0 <=> hoac(t = 4, t = -8 quad text("(loại)")).
      $
      Với $t = 4 <=> x^2 = 4 <=> x = +- 2$.
      Vậy hai giao điểm có hoành độ lần lượt là $x = -2$ và $x = 2$.
      Với $x in [-2; 2]$, ta có $sqrt(8 - x^2) >= x^2 / 2$. Do đó diện tích hình phẳng cần tính là:
      $
        S = integral_(-2)^2 ( sqrt(8 - x^2) - x^2 / 2 ) dif x = 2 integral_0^2 ( sqrt(8 - x^2) - x^2 / 2 ) dif x
        = 2 integral_0^2 sqrt(8 - x^2) dif x - integral_0^2 x^2 dif x.
      $

      *Bước 1: Tính tích phân $I_1 = integral_0^2 sqrt(8 - x^2) dif x$*
      Đặt $x = 2 sqrt(2) sin u$ với $u in [-pi / 2; pi / 2]$. Ta có $dif x = 2 sqrt(2) cos u dif u$.
      Đổi cận:
      - Với $x = 0 => sin u = 0 => u = 0$.
      - Với $x = 2 => sin u = 2 / (2 sqrt(2)) = 1 / sqrt(2) => u = pi / 4$.
      Khi đó:
      $
        I_1 = integral_0^(pi / 4) sqrt(8 - 8 sin^2 u) \cdot 2 sqrt(2) cos u dif u
        = integral_0^(pi / 4) 2 sqrt(2) |cos u| \cdot 2 sqrt(2) cos u dif u
      $
      $
        = 8 integral_0^(pi / 4) cos^2 u dif u = 4 integral_0^(pi / 4) (1 + cos 2u) dif u = 4 lr((u + (sin 2u) / 2) |)_0^(pi / 4)
      $
      $
        = 4 ( pi / 4 + 1 / 2 ) = pi + 2.
      $

      *Bước 2: Tính tích phân $I_2 = integral_0^2 x^2 dif x$*
      $
        I_2 = lr(( x^3 / 3 ) |)_0^2 = 8 / 3.
      $

      *Bước 3: Tính diện tích $S$*
      $
        S = 2 I_1 - I_2 = 2(pi + 2) - 8 / 3 = 2pi + 4 - 8 / 3 = 2pi + 4 / 3 approx 7,61659.
      $
      Làm tròn đến hàng phần mười, ta được kết quả diện tích bằng *$7,6$*.
    ],
  )

  #tln(
    [Trong một mô hình toán học dự báo sự lây lan của một dịch bệnh trong một cộng đồng kín, tỉ lệ dân số bị nhiễm bệnh sau tuần thứ $n$ được kí hiệu là $x_n$ ($0 < x_n < 1$). Tỉ lệ này được mô tả bởi công thức truy hồi:
      $
        x_(n+1) = 0,8 x_n (2 - x_n), quad forall n >= 1
      $
      với tỉ lệ nhiễm bệnh ban đầu ở tuần đầu tiên là $x_1 = 0,2$. Hãy tìm giới hạn $L = lim_(n -> +oo) x_n$ (tỉ lệ nhiễm bệnh ổn định lâu dài trong cộng đồng). (Làm tròn kết quả đến hàng phần trăm).],
    [0,75],
    loigiai: [
      #ppgiai[
        - Xét phương trình tìm giới hạn: Giả sử dãy số $(x_n)$ có giới hạn hữu hạn là $L$ khi $n -> +oo$. Khi đó từ công thức truy hồi, lấy giới hạn hai vế ta được phương trình bậc hai đối với $L$.
        - Chứng minh dãy số hội tụ về giới hạn lớn hơn bằng cách chứng minh dãy $(x_n)$ tăng và bị chặn trên bởi $0,75$ bằng quy nạp toán học.
      ]

      Giả sử dãy số $(x_n)$ có giới hạn hữu hạn là $L$ khi $n -> +oo$ ($0 < L < 1$). Lấy giới hạn hai vế của công thức truy hồi ta có:
      $
        L = 0,8 L (2 - L) <=> L(1 - 1,6 + 0,8 L) = 0 <=> L(0,8 L - 0,6) = 0.
      $
      Vì tỉ lệ nhiễm bệnh ban đầu $x_1 = 0,2 > 0$ và dịch bệnh tiếp tục lây lan nên giới hạn $L != 0$.
      Do đó:
      $
        0,8 L - 0,6 = 0 <=> L = 0,6 / 0,8 = 0,75.
      $

      *Chứng minh dãy số hội tụ về $0,75$:*
      Xét hàm số $f(x) = 0,8 x (2 - x) = 1,6 x - 0,8 x^2$ trên khoảng $(0; 0,75)$.
      Đạo hàm:
      $
        f'(x) = 1,6 - 1,6 x = 1,6(1 - x) > 0, quad forall x in (0; 0,75).
      $
      Do đó hàm số $f(x)$ đồng biến trên khoảng $(0; 0,75)$.
      Ta chứng minh bằng phương pháp quy nạp rằng:
      $
        0 < x_n < x_(n+1) < 0,75, quad forall n >= 1.
      $
      - Với $n = 1$: $x_1 = 0,2$. Ta có $x_2 = 0,8 \cdot 0,2 \cdot (2 - 0,2) = 0,288$.
        Vì $0 < 0,2 < 0,288 < 0,75$ nên khẳng định đúng với $n = 1$.
      - Giả sử khẳng định đúng đến $n = k$, tức là $0 < x_k < x_(k+1) < 0,75$.
        Vì $f(x)$ đồng biến trên $(0; 0,75)$ nên ta có:
        $
          f(0) < f(x_k) < f(x_(k+1)) < f(0,75) <=> 0 < x_(k+1) < x_(k+2) < 0,75.
        $
        Do đó khẳng định đúng với mọi $n >= 1$.
      Như vậy, dãy số $(x_n)$ là dãy số tăng và bị chặn trên bởi $0,75$.
      Theo định lý Weierstrass, dãy số $(x_n)$ có giới hạn hữu hạn là $L = 0,75$.
      Vậy giới hạn cần tìm là *$0,75$*.
    ],
  )

  #tln(
    [Cho hàm số $f(x) = log_2 (x^2 - 4x + 5)$ và hàm số $g(x) = 4^(f(x)) - 2^(f(x) + 1)$. Gọi $M$ và $m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $g(x)$ trên đoạn $[1; 3]$. Tính giá trị của biểu thức $P = M - 3m$.],
    [3],
    loigiai: [
      #ppgiai[
        - Phân tích biểu thức trong logarit $t(x) = x^2 - 4x + 5 = (x-2)^2 + 1$ để tìm tập giá trị của nó khi $x in [1; 3]$.
        - Dùng tính đơn điệu của hàm logarit để tìm tập giá trị của $f(x)$ trên $[1; 3]$.
        - Đặt ẩn phụ $u = 2^(f(x))$ để chuyển hàm $g(x)$ thành một hàm số bậc hai theo $u$.
        - Tìm giá trị lớn nhất $M$ và giá trị nhỏ nhất $m$ của hàm bậc hai đó trên đoạn tương ứng của $u$, từ đó tính biểu thức $P$.
      ]

      Xét biểu thức trong dấu logarit $t(x) = x^2 - 4x + 5 = (x - 2)^2 + 1$.
      Với $x in [1; 3]$, ta có:
      $
        x in [1; 3] <=> x - 2 in [-1; 1] => (x - 2)^2 in [0; 1] => t(x) in [1; 2].
      $
      Vì hàm số $y = log_2 t$ đồng biến trên $(0; +oo)$ nên:
      $
        f(x) = log_2 (t(x)) in [log_2 1; log_2 2] = [0; 1].
      $

      Đặt $u = 2^(f(x))$. Vì $f(x) in [0; 1]$ nên $u in [2^0; 2^1] = [1; 2]$.
      Biểu diễn hàm số $g(x)$ theo $u$:
      $
        g(x) = (2^(f(x)))^2 - 2 \cdot 2^(f(x)) = u^2 - 2u.
      $
      Xét hàm số $h(u) = u^2 - 2u$ trên đoạn $[1; 2]$.
      Ta có đạo hàm:
      $
        h'(u) = 2u - 2 = 2(u - 1) >= 0, quad forall u in [1; 2].
      $
      Do đó hàm số $h(u)$ đồng biến trên đoạn $[1; 2]$.
      - Giá trị nhỏ nhất của hàm số trên đoạn $[1; 2]$ là:
        $
          m = h(1) = 1^2 - 2 \cdot 1 = -1.
        $
      - Giá trị lớn nhất của hàm số trên đoạn $[1; 2]$ là:
        $
          M = h(2) = 2^2 - 2 \cdot 2 = 0.
        $

      Tính giá trị của biểu thức $P = M - 3m$:
      $
        P = 0 - 3 \cdot (-1) = 3.
      $
      Vậy đáp số bằng *$3$*.
    ],
  )
]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
