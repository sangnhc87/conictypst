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
  school: "ĐỀ THI THỬ LẦN 9",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 9)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "906",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  // Question 1
  #tn(
    [Đường tiệm cận ngang của đồ thị hàm số $y = (3x - 1) / (x + 2)$ là đường thẳng],
    (
      [$y = -2$.],
      True([$y = 3$.]),
      [$y = - 1 / 2$.],
      [$x = 3$.],
    ),
    loigiai: [
      #ppgiai[
        Đường tiệm cận ngang của đồ thị hàm số $y = f(x)$ là đường thẳng $y = y_0$ nếu ít nhất một trong các điều kiện $lim_(x -> +oo) f(x) = y_0$ hoặc $lim_(x -> -oo) f(x) = y_0$ được thỏa mãn.
      ]
      Ta có:
      $
        lim_(x -> +oo) (3x - 1) / (x + 2) = lim_(x -> +oo) (3 - 1/x) / (1 + 2/x) = 3.
      $
      Tương tự, $lim_(x -> -oo) y = 3$.
      Do đó, đường tiệm cận ngang của đồ thị hàm số là đường thẳng $y = 3$.
      
      Chọn đáp án *B*.
    ]
  )

  // Question 2
  #tn(
    [Nghiệm của phương trình $log_2 (2x - 3) = 3$ là],
    (
      True([$x = 11 / 2$.]),
      [$x = 5$.],
      [$x = 6$.],
      [$x = 9 / 2$.],
    ),
    loigiai: [
      #ppgiai[
        Giải phương trình logarit cơ bản $log_a u(x) = b <=> u(x) = a^b$ (với điều kiện $u(x) > 0$).
      ]
      Điều kiện xác định: $2x - 3 > 0 <=> x > 3/2$.
      Khi đó phương trình tương đương với:
      $
        2x - 3 = 2^3 <=> 2x - 3 = 8 <=> 2x = 11 <=> x = 11 / 2 " (thỏa mãn điều kiện)".
      $
      Vậy nghiệm của phương trình là $x = 11 / 2$.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 3
  #tn(
    [Khảo sát chiều cao của một mẫu gồm $20$ học sinh THPT, ta thu được mẫu số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 5,
          align: center,
          stroke: 0.5pt + black,
          [Chiều cao ($c m$)], [$[150; 155)$], [$[155; 160)$], [$[160; 165)$], [$[165; 170]$],
          [Số học sinh], [3], [7], [6], [4],
        )
      ]
      Mốt của mẫu số liệu ghép nhóm này thuộc nhóm nào dưới đây?],
    (
      [$[150; 155)$.],
      True([$[155; 160)$.]),
      [$[160; 165)$.],
      [$[165; 170]$.],
    ),
    loigiai: [
      #ppgiai[
        Nhóm chứa mốt của mẫu số liệu ghép nhóm là nhóm có tần số lớn nhất.
      ]
      Quan sát bảng số liệu:
      - Nhóm $[150; 155)$ có tần số là $3$.
      - Nhóm $[155; 160)$ có tần số là $7$.
      - Nhóm $[160; 165)$ có tần số là $6$.
      - Nhóm $[165; 170]$ có tần số là $4$.
      
      Tần số lớn nhất của mẫu số liệu là $7$, tương ứng với nhóm $[155; 160)$.
      Do đó, nhóm chứa mốt là nhóm $[155; 160)$.
      
      Chọn đáp án *B*.
    ]
  )

  // Question 4
  #tn(
    [Trong không gian $O x y z$, cho hai vectơ $vect(u) = (1; -2; 3)$ và $vect(v) = (2; 1; -1)$. Tọa độ của vectơ $vect(w) = vect(u) - 2 vect(v)$ là],
    (
      True([$vect(w) = (-3; -4; 5)$.]),
      [$vect(w) = (5; 0; 1)$.],
      [$vect(w) = (-3; -3; 5)$.],
      [$vect(w) = (3; 0; 1)$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng phép toán trên các vectơ:
        Nếu $vect(u) = (x_1; y_1; z_1)$ và $vect(v) = (x_2; y_2; z_2)$ thì $vect(u) - 2 vect(v) = (x_1 - 2x_2; y_1 - 2y_2; z_1 - 2z_2)$.
      ]
      Ta có:
      - $2 vect(v) = (2 dot 2; 2 dot 1; 2 dot (-1)) = (4; 2; -2)$.
      - $vect(w) = vect(u) - 2 vect(v) = (1 - 4; -2 - 2; 3 - (-2)) = (-3; -4; 5)$.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 5
  #tn(
    [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có bảng biến thiên dưới đây:
      #align(center)[
        #table(
          columns: 4,
          align: center,
          stroke: 0.5pt + black,
          [$x$], [$-oo$], [$-1$], [$1$], [$+oo$],
          [$y'$], [], [$+$], [$0$], [$-$], [$0$], [$+$],
          [$y$], [], [$arrow.t$], [$3$], [$arrow.b$], [$-1$], [$arrow.t$], []
        )
      ]
      Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
    (
      [$(-1; 1)$.],
      True([$(1; +oo)$.]),
      [$(-1; +oo)$.],
      [$(-oo; 1)$.],
    ),
    loigiai: [
      #ppgiai[
        Hàm số đồng biến trên các khoảng mà tại đó đạo hàm $y' > 0$ (hoặc đồ thị đi lên từ trái sang phải).
      ]
      Dựa vào bảng biến thiên, ta thấy:
      - Đạo hàm $y' > 0$ trên các khoảng $(-oo; -1)$ và $(1; +oo)$.
      - Trong các phương án đưa ra, khoảng $(1; +oo)$ là khoảng đồng biến của hàm số.
      
      Chọn đáp án *B*.
    ]
  )

  // Question 6
  #tn(
    [Họ nguyên hàm của hàm số $f(x) = 3x^2 - e^x$ trên $RR$ là],
    (
      True([$x^3 - e^x + C$.]),
      [$6x - e^x + C$.],
      [$x^3 + e^x + C$.],
      [$3x^3 - e^x + C$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng các công thức nguyên hàm cơ bản:
        - $integral x^alpha dif x = x^(alpha + 1) / (alpha + 1) + C$ (với $alpha != -1$).
        - $integral e^x dif x = e^x + C$.
      ]
      Ta có:
      $
        integral f(x) dif x = integral (3x^2 - e^x) dif x = 3 integral x^2 dif x - integral e^x dif x
        = 3 dot x^3 / 3 - e^x + C = x^3 - e^x + C.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 7
  #tn(
    [Cho hình lập phương $A B C D . A' B' C' D'$. Góc giữa đường thẳng $A' B$ và mặt phẳng $(A B C D)$ bằng],
    (
      [$30^circ$.],
      [$60^circ$.],
      [$90^circ$.],
      True([$45^circ$.]),
    ),
    loigiai: [
      #ppgiai[
        Góc giữa đường thẳng $d$ và mặt phẳng $(P)$ là góc giữa $d$ và hình chiếu $d'$ của $d$ trên mặt phẳng $(P)$.
      ]
      Xét hình lập phương $A B C D . A' B' C' D'$:
      - Hình chiếu vuông góc của điểm $A'$ trên mặt phẳng $(A B C D)$ là điểm $A$.
      - Điểm $B$ thuộc mặt phẳng $(A B C D)$ nên hình chiếu của $B$ trên $(A B C D)$ chính là $B$.
      - Suy ra đường thẳng $A B$ là hình chiếu của đường thẳng $A' B$ trên mặt phẳng $(A B C D)$.
      - Góc giữa đường thẳng $A' B$ và mặt phẳng $(A B C D)$ là góc giữa $A' B$ và $A B$, chính là góc $hat(A' B A)$.
      
      Vì tam giác $A' A B$ vuông cân tại $A$ nên góc $hat(A' B A) = 45^circ$.
      
      Chọn đáp án *D*.
    ]
  )

  // Question 8
  #tn(
    [Một hộp chứa $5$ quả cầu màu đỏ và $7$ quả cầu màu xanh có kích thước giống nhau. Chọn ngẫu nhiên đồng thời $2$ quả cầu từ hộp. Xác suất để chọn được $2$ quả cầu cùng màu bằng],
    (
      True([$31 / 66$.]),
      [$35 / 66$.],
      [$5 / 11$.],
      [$7 / 22$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính số phần tử của không gian mẫu $n(Omega) = C(12, 2)$.
        - Gọi $A$ là biến cố "Chọn được 2 quả cầu cùng màu". Xác định các trường hợp: cả 2 cùng đỏ hoặc cả 2 cùng xanh.
        - Xác suất cần tìm: $P(A) = n(A) / n(Omega)$.
      ]
      - Số cách chọn ngẫu nhiên $2$ quả cầu từ tổng số $12$ quả cầu trong hộp là:
      $
        n(Omega) = C(12, 2) = (12 dot 11) / 2 = 66.
      $
      - Số cách chọn $2$ quả cầu cùng màu đỏ là $C(5, 2) = 10$.
      - Số cách chọn $2$ quả cầu cùng màu xanh là $C(7, 2) = 21$.
      - Tổng số kết quả thuận lợi cho biến cố $A$ là:
      $
        n(A) = 10 + 21 = 31.
      $
      - Xác suất của biến cố $A$ là:
      $
        P(A) = 31 / 66.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 9
  #tn(
    [Trong không gian $O x y z$, khoảng cách từ điểm $M(3; -4; 12)$ đến trục cao độ $O z$ bằng],
    (
      True([$5$.]),
      [$12$.],
      [$13$.],
      [$sqrt(153)$.],
    ),
    loigiai: [
      #ppgiai[
        Khoảng cách từ điểm $M(x_0; y_0; z_0)$ đến trục tọa độ $O z$ được tính bởi công thức: $d(M, O z) = sqrt(x_0^2 + y_0^2)$.
      ]
      Thay tọa độ của điểm $M(3; -4; 12)$ vào công thức:
      $
        d(M, O z) = sqrt(3^2 + (-4)^2) = sqrt(9 + 16) = sqrt(25) = 5.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 10
  #tn(
    [Cho hàm số bậc ba $y = f(x) = x^3 - 3x$. Điểm cực đại của đồ thị hàm số đã cho là],
    (
      True([$M(-1; 2)$.]),
      [$N(1; -2)$.],
      [$P(-1; 0)$.],
      [$Q(1; 0)$.],
    ),
    loigiai: [
      #ppgiai[
        - Tìm đạo hàm $f'(x)$ và giải phương trình $f'(x) = 0$.
        - Dùng đạo hàm cấp hai hoặc bảng biến thiên để xác định điểm cực đại của đồ thị hàm số.
      ]
      - Tập xác định: $D = RR$.
      - Đạo hàm: $f'(x) = 3x^2 - 3$.
      - Giải phương trình đạo hàm:
      $
        f'(x) = 0 <=> 3x^2 - 3 = 0 <=> x = +- 1.
      $
      - Đạo hàm cấp hai: $f''(x) = 6x$.
      - Tại $x = -1$, ta có $f''(-1) = -6 < 0$ nên $x = -1$ là điểm cực đại của hàm số. Giá trị cực đại tương ứng là:
      $
        y(-1) = (-1)^3 - 3(-1) = 2.
      $
      Vậy điểm cực đại của đồ thị hàm số là $M(-1; 2)$.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 11
  #tn(
    [Một chất điểm chuyển động theo quy luật $s(t) = -t^3 + 6t^2 + 9t$ (với $t >= 0$, $t$ tính bằng giây và $s$ tính bằng mét). Vận tốc của chất điểm đạt giá trị lớn nhất tại thời điểm nào dưới đây?],
    (
      True([$t = 2$ giây.]),
      [$t = 3$ giây.],
      [$t = 4$ giây.],
      [$t = 1$ giây.],
    ),
    loigiai: [
      #ppgiai[
        - Vận tốc của chất điểm là đạo hàm của phương trình chuyển động: $v(t) = s'(t)$.
        - Tìm giá trị lớn nhất của hàm số bậc hai $v(t)$ trên khoảng $[0; +oo)$.
      ]
      Ta có phương trình vận tốc:
      $
        v(t) = s'(t) = -3t^2 + 12t + 9.
      $
      Đây là một parabol quay bề lõm xuống dưới. Tọa độ đỉnh của parabol là:
      $
        t_0 = - (12) / (2 dot (-3)) = 2.
      $
      Do đó, hàm số $v(t)$ đạt giá trị lớn nhất tại $t = 2$ giây.
      Giá trị vận tốc cực đại là $v(2) = -3(2)^2 + 12(2) + 9 = 21$ m/s.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 12
  #tn(
    [Trong không gian $O x y z$, mặt phẳng đi qua điểm $A(1; -2; 4)$ và song song với mặt phẳng $(P): 2x - y + z - 5 = 0$ có phương trình là],
    (
      True([$2x - y + z - 8 = 0$.]),
      [$2x - y + z + 8 = 0$.],
      [$2x - y + z - 4 = 0$.],
      [$x - 2y + 4z - 8 = 0$.],
    ),
    loigiai: [
      #ppgiai[
        - Hai mặt phẳng song song thì có cùng vectơ pháp tuyến.
        - Viết phương trình mặt phẳng đi qua một điểm có vectơ pháp tuyến cho trước:
          $A(x - x_0) + B(y - y_0) + C(z - z_0) = 0$.
      ]
      Mặt phẳng song song với $(P)$ nên nhận vectơ pháp tuyến của $(P)$ làm vectơ pháp tuyến:
      $
        vect(n) = (2; -1; 1).
      $
      Phương trình mặt phẳng đi qua điểm $A(1; -2; 4)$ là:
      $
        2(x - 1) - 1(y + 2) + 1(z - 4) = 0 <=> 2x - 2 - y - 2 + z - 4 = 0 <=> 2x - y + z - 8 = 0.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

  // Question 1
  #ds(
    [Xét hàm số lượng giác $f(x) = 2 sin 2x - 2 sqrt(3) cos 2x + 5$ trên tập số thực $RR$.],
    (
      True([Tập giá trị của hàm số $f(x)$ là $[1; 9]$.]),
      [Hàm số có chu kỳ tuần hoàn là $T = 2 pi$.],
      True([Giá trị lớn nhất của hàm số đạt được tại các điểm $x = (5 pi) / 12 + k pi$ ($k in ZZ$).]),
      True([Trên đoạn $[0; pi / 2]$, giá trị nhỏ nhất của hàm số bằng $5 - 2 sqrt(3)$.]),
    ),
    loigiai: [
      #ppgiai[
        - Biến đổi hàm số $f(x) = a sin 2x + b cos 2x + c$ về dạng hàm sin duy nhất:
          $f(x) = sqrt(a^2 + b^2) sin(2x - alpha) + c$.
        - Sử dụng tập giá trị của hàm sin để tìm tập giá trị, cực trị và chu kỳ của hàm số.
      ]
      Ta biến đổi biểu thức:
      $
        f(x) = 4 ( 1 / 2 sin 2x - sqrt(3) / 2 cos 2x ) + 5
        = 4 ( sin 2x cos(pi / 3) - cos 2x sin(pi / 3) ) + 5
        = 4 sin(2x - pi / 3) + 5.
      $
      
      *a) Tập giá trị:*
      Vì $-1 <= sin(2x - pi / 3) <= 1$ với mọi $x in RR$, nên:
      $
        -4 <= 4 sin(2x - pi / 3) <= 4 <=> 1 <= 4 sin(2x - pi / 3) + 5 <= 9.
      $
      Do đó, tập giá trị của hàm số là $[1; 9]$. Mệnh đề a *ĐÚNG*.
      
      *b) Chu kỳ tuần hoàn:*
      Hàm số $y = sin(omega x + phi)$ có chu kỳ tuần hoàn $T = (2pi) / |omega|$. Ở đây $omega = 2$ nên chu kỳ là:
      $
        T = (2 pi) / 2 = pi.
      $
      Mệnh đề nói chu kỳ là $2 pi$ là *SAI*.
      
      *c) Giá trị lớn nhất:*
      Hàm số đạt giá trị lớn nhất bằng $9$ khi và chỉ khi:
      $
        sin(2x - pi / 3) = 1 <=> 2x - pi / 3 = pi / 2 + k 2 pi
        <=> 2x = (5 pi) / 6 + k 2 pi <=> x = (5 pi) / 12 + k pi, quad k in ZZ.
      $
      Mệnh đề c *ĐÚNG*.
      
      *d) Giá trị nhỏ nhất trên đoạn $[0; pi / 2]$:*
      Với $x in [0; pi / 2]$, ta có $2x in [0; pi] => 2x - pi / 3 in [- pi / 3; (2 pi) / 3]$.
      Trên đoạn $[- pi / 3; (2 pi) / 3]$, hàm số $t -> sin t$ đạt giá trị nhỏ nhất tại điểm đầu mút $t = - pi / 3$.
      Giá trị nhỏ nhất của $sin(2x - pi / 3)$ trên đoạn này là $sin(- pi / 3) = - sqrt(3) / 2$.
      Do đó, giá trị nhỏ nhất của $f(x)$ trên đoạn $[0; pi / 2]$ là:
      $
        f_min = 4 dot (- sqrt(3) / 2) + 5 = 5 - 2 sqrt(3).
      $
      Mệnh đề d *ĐÚNG*.
    ]
  )

  // Question 2
  #ds(
    [Trong không gian tọa độ $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 - 2x - 4y - 6z - 2 = 0$ và mặt phẳng $(P): 2x - y - 2z + 9 = 0$.],
    (
      True([Mặt cầu $(S)$ có tâm $I(1; 2; 3)$ và bán kính $R = 4$.]),
      [Khoảng cách từ tâm $I$ của mặt cầu đến mặt phẳng $(P)$ bằng $3$.],
      True([Mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo giao tuyến là một đường tròn có chu vi bằng $2 sqrt(15) pi$.]),
      True([Đường thẳng đi qua $I$ và vuông góc với mặt phẳng $(P)$ cắt mặt cầu $(S)$ tại hai điểm phân biệt $A$ và $B$. Khoảng cách từ các điểm $A, B$ đến mặt phẳng $(P)$ lần lượt là $3$ và $5$.]),
    ),
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Vẽ mặt cầu
      circle((0, 0), radius: 2.0, stroke: 1pt + black) 
      
      // Tâm I
      circle((0, 0), radius: 1.5pt, fill: black)
      content((0.25, 0.25), [$I(1; 2; 3)$], style: (size: 8pt))
      
      // Khoảng cách d
      let d = 0.8
      let r = calc.sqrt(4 - d*d)
      
      // Vẽ đường tròn thiết diện
      circle((0, -d), radius: (r, r * 0.25), stroke: 1.2pt + blue, fill: rgb(200, 220, 255, 100))
      
      // Tâm thiết diện H
      circle((0, -d), radius: 1.5pt, fill: black)
      content((0.2, -d - 0.25), [$H$], style: (size: 8pt))
      
      // Đường vuông góc IH
      line((0, 0), (0, -d), stroke: (dash: "dashed", paint: red))
      content((-0.25, -d/2), [$d$], style: (size: 8pt))
      
      // Bán kính R của cầu
      line((0, 0), (r, -d), stroke: (dash: "dashed", paint: green.darken(20%)))
      content((r/2, -d/2 + 0.1), [$R$], style: (size: 8pt))
      
      // Bán kính r của thiết diện
      line((0, -d), (r, -d), stroke: 1pt + black)
      content((r/2, -d - 0.2), [$r$], style: (size: 8pt))
      
      // Mặt phẳng P
      line((-3.0, -d - 0.5), (3.0, -d - 0.5), (2.0, -d + 0.5), (-2.0, -d + 0.5), close: true, stroke: 0.8pt + gray)
      content((2.5, -d - 0.85), [$(P)$], style: (size: 9pt))
    }),
    fig-pos: "center",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        - Xác định tâm $I$ và bán kính $R$ của mặt cầu.
        - Tính khoảng cách từ tâm $I$ đến mặt phẳng $(P)$: $d = d(I, (P))$.
        - Tính bán kính đường tròn thiết diện $r = sqrt(R^2 - d^2)$ và chu vi của nó $C = 2 pi r$.
        - Sử dụng mối quan hệ cùng phương trên đường thẳng vuông góc để xác định khoảng cách từ các điểm $A, B$ trên mặt cầu đến mặt phẳng $(P)$.
      ]
      *a)* Mặt cầu $(S)$ có phương trình dạng tổng quát nên có:
      - Tâm $I(1; 2; 3)$.
      - Bán kính $R = sqrt(1^2 + 2^2 + 3^2 - (-2)) = sqrt(1 + 4 + 9 + 2) = 4$.
      Mệnh đề a *ĐÚNG*.
      
      *b)* Khoảng cách từ tâm $I(1; 2; 3)$ đến mặt phẳng $(P): 2x - y - 2z + 9 = 0$ là:
      $
        d(I, (P)) = (|2(1) - 2 - 2(3) + 9|) / (sqrt(2^2 + (-1)^2 + (-2)^2))
        = (|2 - 2 - 6 + 9|) / 3 = 3 / 3 = 1.
      $
      Do đó khoảng cách bằng $1$. Mệnh đề nói bằng $3$ là *SAI*.
      
      *c)* Vì $d(I, (P)) = 1 < R = 4$ nên mặt phẳng $(P)$ cắt mặt cầu $(S)$ theo giao tuyến là đường tròn.
      Bán kính đường tròn thiết diện là:
      $
        r = sqrt(R^2 - d^2) = sqrt(4^2 - 1^2) = sqrt(15).
      $
      Chu vi của đường tròn thiết diện này bằng:
      $
        C = 2 pi r = 2 sqrt(15) pi.
      $
      Mệnh đề c *ĐÚNG*.
      
      *d)* Đường thẳng qua $I$ vuông góc với $(P)$ cắt mặt cầu tại hai điểm $A$ và $B$.
      Hình chiếu của đường thẳng này vuông góc với $(P)$ chính là trục đối xứng qua tâm $H$ của thiết diện.
      Khoảng cách từ các điểm $A, B$ đến mặt phẳng $(P)$ tương ứng với độ dài các đoạn thẳng từ hình chiếu vuông góc của chúng.
      Vì $I$ nằm trên đường vuông góc với $(P)$, có khoảng cách $d(I, (P)) = 1$ và bán kính mặt cầu là $R = 4$, do đó hai điểm $A, B$ nằm về hai phía so với mặt phẳng $(P)$ (hoặc cụ thể hơn là một điểm nằm gần mặt phẳng hơn và một điểm nằm xa mặt phẳng hơn dọc theo đường thẳng vuông góc):
      - Khoảng cách bé nhất: $d_1 = R - d = 4 - 1 = 3$.
      - Khoảng cách lớn nhất: $d_2 = R + d = 4 + 1 = 5$.
      Do đó, khoảng cách từ $A, B$ đến mặt phẳng $(P)$ lần lượt là $3$ và $5$. Mệnh đề d *ĐÚNG*.
    ]
  )

  // Question 3
  #ds(
    [Khảo sát thời gian chờ (đơn vị: phút) của $50$ khách hàng tại một phòng giao dịch ngân hàng, ta thu được bảng số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian chờ], [$[0; 4)$], [$[4; 8)$], [$[8; 12)$], [$[12; 16)$], [$[16; 20]$],
          [Số khách hàng], [8], [15], [18], [6], [3],
        )
      ]
    ],
    (
      True([Thời gian chờ trung bình của các khách hàng này là $8,48$ phút.]),
      [Nhóm chứa trung vị của mẫu số liệu ghép nhóm trên là nhóm $[4; 8)$.],
      True([Mốt của mẫu số liệu ghép nhóm trên là $8,8$ phút.]),
      True([Phương sai của mẫu số liệu ghép nhóm này bằng $18,4896$.]),
    ),
    loigiai: [
      #ppgiai[
        - Tìm giá trị đại diện $x_i$ của mỗi nhóm: trung điểm của khoảng.
        - Tính giá trị trung bình: $bar(x) = (sum n_i x_i) / n$.
        - Tìm nhóm chứa trung vị (tần số tích lũy vượt qua $n / 2 = 25$) và tính trung vị.
        - Tìm nhóm chứa mốt (tần số lớn nhất) và tính mốt theo công thức.
        - Tính phương sai: $s^2 = (sum n_i x_i^2) / n - bar(x)^2$.
      ]
      Các giá trị đại diện của các nhóm lần lượt là:
      $x_1 = 2$; $x_2 = 6$; $x_3 = 10$; $x_4 = 14$; $x_5 = 18$.
      Cỡ mẫu $n = 8 + 15 + 18 + 6 + 3 = 50$.
      
      *a) Thời gian chờ trung bình:*
      $
        bar(x) = (8 dot 2 + 15 dot 6 + 18 dot 10 + 6 dot 14 + 3 dot 18) / 50
        = (16 + 90 + 180 + 84 + 54) / 50 = 424 / 50 = 8,48 " (phút)".
      $
      Mệnh đề a *ĐÚNG*.
      
      *b) Tìm nhóm chứa trung vị:*
      Tần số tích lũy đến nhóm thứ hai $[4; 8)$ là $8 + 15 = 23 < 25$.
      Tần số tích lũy đến nhóm thứ ba $[8; 12)$ là $23 + 18 = 41 >= 25$.
      Do đó, nhóm chứa trung vị là nhóm thứ ba $[8; 12)$. Mệnh đề b *SAI*.
      
      *c) Tìm mốt:*
      Nhóm có tần số lớn nhất là nhóm $[8; 12)$ với $f_m = 18$.
      Tần số nhóm đứng trước là $f_(m-1) = 15$, tần số nhóm đứng sau là $f_(m+1) = 6$.
      Cận dưới của nhóm chứa mốt là $L = 8$, độ rộng nhóm là $h = 4$.
      $
        M_o = L + (f_m - f_(m-1)) / ((f_m - f_(m-1)) + (f_m - f_(m+1))) dot h
        = 8 + (18 - 15) / ((18 - 15) + (18 - 6)) dot 4
      $
      $
        = 8 + 3 / (3 + 12) dot 4 = 8 + 3 / 15 dot 4 = 8 + 0,2 dot 4 = 8,8 " (phút)".
      $
      Mệnh đề c *ĐÚNG*.
      
      *d) Tính phương sai:*
      Tính tổng bình phương có trọng số các giá trị đại diện:
      $
        sum n_i x_i^2 = 8 dot 2^2 + 15 dot 6^2 + 18 dot 10^2 + 6 dot 14^2 + 3 dot 18^2
        = 8 dot 4 + 15 dot 36 + 18 dot 100 + 6 dot 196 + 3 dot 324
      $
      $
        = 32 + 540 + 1800 + 1176 + 972 = 4520.
      $
      Phương sai của mẫu số liệu ghép nhóm là:
      $
        s^2 = 4520 / 50 - (8,48)^2 = 90,4 - 71,9104 = 18,4896.
      $
      Mệnh đề d *ĐÚNG*.
    ]
  )

  // Question 4
  #ds(
    [Một xét nghiệm chẩn đoán y khoa để phát hiện một căn bệnh nguy hiểm có tỉ lệ mắc bệnh trong quần thể dân cư là $1\%$. Một người được chọn ngẫu nhiên từ quần thể để làm xét nghiệm này. Bộ sinh phẩm xét nghiệm nhanh được sử dụng có độ nhạy đạt $98\%$ (tỉ lệ có kết quả dương tính trong số những người thực sự mắc bệnh) và độ đặc hiệu đạt $95\%$ (tỉ lệ có kết quả âm tính trong số những người không mắc bệnh).],
    (
      True([Xác suất để một người được chọn ngẫu nhiên trong quần thể có kết quả xét nghiệm dương tính là $5,93\%$.]),
      True([Xác suất để một người được chọn ngẫu nhiên vừa mắc bệnh vừa có kết quả xét nghiệm âm tính (âm tính giả) bằng $0,02\%$.]),
      True([Nếu một người nhận được kết quả xét nghiệm dương tính, xác suất để người đó thực sự mắc bệnh là khoảng $16,53\%$.]),
      [Nếu một người nhận được kết quả xét nghiệm âm tính, xác suất để người đó thực sự không mắc bệnh là nhỏ hơn $99,9\%$.],
    ),
    loigiai: [
      #ppgiai[
        - Vẽ sơ đồ cây xác suất hoặc sử dụng công thức xác suất đầy đủ và công thức Bayes.
        - Gọi $D$ là biến cố "Người đó mắc bệnh", $D'$ là biến cố "Người đó không mắc bệnh". Ta có $P(D) = 0,01$ và $P(D') = 0,99$.
        - Gọi $T^+$ và $T^-$ lần lượt là các biến cố kết quả xét nghiệm Dương tính và Âm tính.
        - Dữ liệu cho: $P(T^+ | D) = 0,98$ (độ nhạy), $P(T^- | D') = 0,95$ (độ đặc hiệu).
      ]
      
      Sơ đồ cây phân tích các nhánh xác suất như sau:
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          // Gốc
          circle((0, 0), radius: 2pt, fill: black)
          
          // Nhánh bệnh
          line((0, 0), (2.5, 1.5), stroke: 1pt + black)
          content((1.2, 1.05), [$0,01$], anchor: "south-east", style: (size: 7.5pt))
          circle((2.5, 1.5), radius: 2pt, fill: black)
          content((2.5, 1.8), [$D$ (Có bệnh)], anchor: "south", style: (size: 8pt))
          
          // Nhánh lành
          line((0, 0), (2.5, -1.5), stroke: 1pt + black)
          content((1.2, -1.05), [$0,99$], anchor: "north-east", style: (size: 7.5pt))
          circle((2.5, -1.5), radius: 2pt, fill: black)
          content((2.5, -1.8), [$D'$ (Khỏe mạnh)], anchor: "north", style: (size: 8pt))
          
          // Con của D
          line((2.5, 1.5), (5, 2.25), stroke: 1pt + black)
          content((3.7, 2.05), [$0,98$], anchor: "south-east", style: (size: 7.5pt))
          circle((5, 2.25), radius: 2pt, fill: black)
          content((5.2, 2.25), [$T^+$ (Dương tính)], anchor: "west", style: (size: 8pt))
          
          line((2.5, 1.5), (5, 0.75), stroke: 1pt + black)
          content((3.7, 0.95), [$0,02$], anchor: "north-east", style: (size: 7.5pt))
          circle((5, 0.75), radius: 2pt, fill: black)
          content((5.2, 0.75), [$T^-$ (Âm tính)], anchor: "west", style: (size: 8pt))
          
          // Con của D'
          line((2.5, -1.5), (5, -0.75), stroke: 1pt + black)
          content((3.7, -0.95), [$0,05$], anchor: "south-east", style: (size: 7.5pt))
          circle((5, -0.75), radius: 2pt, fill: black)
          content((5.2, -0.75), [$T^+$ (Dương tính)], anchor: "west", style: (size: 8pt))
          
          line((2.5, -1.5), (5, -2.25), stroke: 1pt + black)
          content((3.7, -2.05), [$0,95$], anchor: "north-east", style: (size: 7.5pt))
          circle((5, -2.25), radius: 2pt, fill: black)
          content((5.2, -2.25), [$T^-$ (Âm tính)], anchor: "west", style: (size: 8pt))
        })
      ]

      *a) Xác suất kết quả dương tính:*
      Áp dụng công thức xác suất đầy đủ:
      $
        P(T^+) = P(D) dot P(T^+ | D) + P(D') dot P(T^+ | D')
        = 0,01 dot 0,98 + 0,99 dot (1 - 0,95)
      $
      $
        = 0,0098 + 0,99 dot 0,05 = 0,0098 + 0,0495 = 0,0593 = 5,93\%.
      $
      Mệnh đề a *ĐÚNG*.

      *b) Xác suất âm tính giả (vừa mắc bệnh vừa âm tính):*
      Xác suất đồng thời xảy ra bệnh và kết quả âm tính là:
      $
        P(D cap T^-) = P(D) dot P(T^- | D) = 0,01 dot (1 - 0,98) = 0,01 dot 0,02 = 0,0002 = 0,02\%.
      $
      Mệnh đề b *ĐÚNG*.

      *c) Xác suất thực sự mắc bệnh khi đã dương tính:*
      Áp dụng công thức Bayes:
      $
        P(D | T^+) = (P(D cap T^+)) / (P(T^+)) = (0,01 dot 0,98) / 0,0593 = 0,0098 / 0,0593 approx 0,16526 = 16,53\%.
      $
      Mệnh đề c *ĐÚNG*.

      *d) Xác suất thực sự không mắc bệnh khi nhận được âm tính:*
      Xác suất để kết quả xét nghiệm âm tính là:
      $
        P(T^-) = 1 - P(T^+) = 1 - 0,0593 = 0,9407.
      $
      Xác suất thực sự không mắc bệnh khi kết quả âm tính là:
      $
        P(D' | T^-) = (P(D' cap T^-)) / (P(T^-)) = (P(D') dot P(T^- | D')) / (P(T^-))
        = (0,99 dot 0,95) / 0,9407 = 0,9405 / 0,9407 approx 0,999787 = 99,98\%.
      $
      Vì $99,98\% > 99,9\%$ nên xác suất này lớn hơn $99,9\%$. Mệnh đề d nói nhỏ hơn $99,9\%$ là *SAI*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  // Question 1
  #tln(
    [Trong một đợt kiểm tra sức khỏe cộng đồng cho một dịch bệnh hiếm gặp, các chuyên gia ước tính tỉ lệ người thực sự mắc bệnh trong quần thể chỉ khoảng $0,05\%$ (tức là $5$ người trên $10.000$ dân). Bộ sinh phẩm xét nghiệm được sử dụng có độ nhạy $99\%$ và độ đặc hiệu $98\%$. Chọn ngẫu nhiên một người trong cộng đồng này để làm xét nghiệm, biết rằng kết quả xét nghiệm của người đó là dương tính. Hãy tính xác suất để người này thực sự mắc bệnh (làm tròn kết quả đến hàng phần trăm, đơn vị: phần trăm; ví dụ nếu tính ra $2,416\%$ thì ghi kết quả là $2,42$).],
    [2,42],
    loigiai: [
      #ppgiai[
        - Gọi $D$ là biến cố người được chọn thực sự mắc bệnh, $P(D) = 0,0005$.
        - Gọi $T$ là biến cố người được chọn có kết quả xét nghiệm dương tính.
        - Độ nhạy $P(T | D) = 0,99$, độ đặc hiệu $P(T' | D') = 0,98 => P(T | D') = 0,02$.
        - Sử dụng công thức Bayes để tính xác suất hậu nghiệm $P(D | T)$.
      ]
      Ta có:
      - Tỉ lệ mắc bệnh: $P(D) = 0,05\% = 0,0005$.
      - Tỉ lệ không mắc bệnh: $P(D') = 1 - 0,0005 = 0,9995$.
      
      Xác suất để một người nhận được kết quả xét nghiệm dương tính là:
      $
        P(T) = P(D) dot P(T | D) + P(D') dot P(T | D')
        = 0,0005 dot 0,99 + 0,9995 dot (1 - 0,98)
      $
      $
        = 0,000495 + 0,9995 dot 0,02 = 0,000495 + 0,019990 = 0,020485.
      $
      
      Xác suất để người nhận kết quả dương tính thực sự mắc bệnh là:
      $
        P(D | T) = (P(D) dot P(T | D)) / (P(T)) = 0,000495 / 0,020485
        = 495 / 20485 approx 0,024164 = 2,4164\%.
      $
      Làm tròn đến hàng phần trăm, xác suất này là *$2,42\%$*.
      
      Đáp số: *2,42*.
    ]
  )

  // Question 2
  #tln(
    [Một công ty độc quyền kinh doanh một loại sản phẩm trên thị trường. Hàm cầu đối với sản phẩm này là $p(x) = 200 - 0,5x$ (triệu đồng/sản phẩm), trong đó $x$ là số lượng sản phẩm tiêu thụ hàng tháng. Hàm tổng chi phí sản xuất của công ty được xác định bởi công thức $C(x) = 0,1x^2 + 20x + 500$ (triệu đồng). Tìm số lượng sản phẩm $x$ công ty cần sản xuất và bán ra mỗi tháng để lợi nhuận thu được đạt giá trị lớn nhất.],
    [150],
    loigiai: [
      #ppgiai[
        - Hàm doanh thu: $R(x) = x dot p(x)$.
        - Hàm lợi nhuận: $P(x) = R(x) - C(x)$.
        - Tìm cực trị của hàm số $P(x)$ trên khoảng $(0; +oo)$ bằng cách giải phương trình đạo hàm $P'(x) = 0$.
      ]
      Ta có hàm doanh thu của công ty là:
      $
        R(x) = x dot p(x) = x(200 - 0,5x) = 200x - 0,5x^2.
      $
      Hàm tổng lợi nhuận của công ty hàng tháng là:
      $
        P(x) = R(x) - C(x) = (200x - 0,5x^2) - (0,1x^2 + 20x + 500)
        = -0,6x^2 + 180x - 500.
      $
      Xét hàm số $P(x)$ với $x > 0$. Đạo hàm của hàm lợi nhuận là:
      $
        P'(x) = -1,2x + 180.
      $
      Cho $P'(x) = 0 <=> -1,2x + 180 = 0 <=> x = 150$.
      Vì $P''(x) = -1,2 < 0$, nên hàm lợi nhuận đạt cực đại tại $x = 150$.
      Vậy để tối đa hóa lợi nhuận, công ty cần sản xuất và bán ra $150$ sản phẩm mỗi tháng.
      
      Đáp số: *150*.
    ]
  )

  // Question 3
  #tln(
    [Trong không gian tọa độ $O x y z$, cho điểm $A(1; 2; -3)$ và mặt phẳng $(P): x + 2y - z + 4 = 0$. Gọi $A'(a; b; c)$ là tọa độ điểm đối xứng của điểm $A$ qua mặt phẳng $(P)$. Tính tổng $S = a + b + c$.],
    [-8],
    loigiai: [
      #ppgiai[
        - Tìm hình chiếu vuông góc $H$ của điểm $A$ trên mặt phẳng $(P)$.
        - Vì $A'$ đối xứng với $A$ qua $(P)$ nên $H$ là trung điểm của đoạn thẳng $A A'$.
        - Từ đó tính tọa độ của $A'$ theo công thức: $x_(A') = 2x_H - x_A$.
      ]
      Mặt phẳng $(P)$ có vectơ pháp tuyến là $vect(n) = (1; 2; -1)$.
      Đường thẳng $d$ đi qua điểm $A(1; 2; -3)$ và vuông góc với mặt phẳng $(P)$ có phương trình tham số:
      $
        cases(x = 1 + t, y = 2 + 2t, z = -3 - t), quad t in RR.
      $
      Hình chiếu $H$ của $A$ trên $(P)$ là giao điểm của $d$ và $(P)$. Thay phương trình tham số vào phương trình mặt phẳng $(P)$:
      $
        (1 + t) + 2(2 + 2t) - (-3 - t) + 4 = 0
        <=> 1 + t + 4 + 4t + 3 + t + 4 = 0
      $
      $
        <=> 6t + 12 = 0 <=> t = -2.
      $
      Suy ra tọa độ điểm $H$ là:
      $
        x_H = 1 + (-2) = -1, quad y_H = 2 + 2(-2) = -2, quad z_H = -3 - (-2) = -1.
      $
      Do $A'$ đối xứng với $A$ qua mặt phẳng $(P)$ nên $H$ là trung điểm của $A A'$:
      $
        a = 2x_H - x_A = 2(-1) - 1 = -3,
      $
      $
        b = 2y_H - y_A = 2(-2) - 2 = -6,
      $
      $
        c = 2z_H - z_A = 2(-1) - (-3) = 1.
      $
      Tọa độ điểm $A'$ là $(-3; -6; 1)$.
      Tổng giá trị cần tìm là:
      $
        S = a + b + c = -3 + (-6) + 1 = -8.
      $
      
      Đáp số: *-8*.
    ]
  )

  // Question 4
  #tln(
    [Một tên lửa mô hình được phóng thẳng đứng hướng lên trên từ mặt đất. Trong giai đoạn động cơ hoạt động từ lúc khởi hành ($t = 0$ giây) đến thời điểm $t = 10$ giây, vận tốc của tên lửa được mô tả bởi hàm số $v(t) = 3t^2 + 20t$ (m/s). Sau $10$ giây, động cơ của tên lửa ngừng hoạt động, tên lửa tiếp tục bay lên và chuyển động chậm dần đều tự do dưới tác dụng của trọng lực với gia tốc ngược hướng chuyển động $a = -10$ m/$s^2$. Hãy tính độ cao cực đại mà tên lửa đạt được so với mặt đất (đơn vị: mét).],
    [14500],
    loigiai: [
      #ppgiai[
        - Giai đoạn 1 ($t in [0; 10]$): Tính quãng đường (độ cao đạt được) bằng tích phân vận tốc: $s_1 = integral_0^(10) v(t) dif t$.
        - Tính vận tốc của tên lửa tại thời điểm $t = 10$: $v_0 = v(10)$.
        - Giai đoạn 2: Tên lửa chuyển động chậm dần đều với vận tốc đầu $v_0$ và gia tốc $a = -10$ m/$s^2$. Độ cao tăng thêm $s_2$ cho đến khi dừng lại hẳn ($v = 0$) được tính bằng công thức chuyển động $v^2 - v_0^2 = 2 a s$.
        - Độ cao cực đại là tổng quãng đường đạt được qua hai giai đoạn: $h_max = s_1 + s_2$.
      ]
      *Giai đoạn 1: Động cơ hoạt động ($0 <= t <= 10$)*
      Độ cao tên lửa đạt được sau $10$ giây đầu tiên là:
      $
        s_1 = integral_0^(10) (3t^2 + 20t) dif t = lr((t^3 + 10t^2) |)_0^(10) = (10^3 + 10 dot 10^2) - 0 = 2000 " (m)".
      $
      Vận tốc của tên lửa tại thời điểm động cơ tắt ($t = 10$) là:
      $
        v_0 = v(10) = 3(10)^2 + 20(10) = 500 " (m/s)".
      $

      *Giai đoạn 2: Chuyển động tự do sau khi động cơ tắt*
      Tên lửa chuyển động với gia tốc $a = -10$ m/$s^2$ từ vận tốc ban đầu $v_0 = 500$ m/s đến khi dừng lại ở đỉnh quỹ đạo ($v = 0$).
      Độ cao tăng thêm $s_2$ được tính từ công thức liên hệ vận tốc và quãng đường:
      $
        v^2 - v_0^2 = 2 a s_2 <=> 0^2 - 500^2 = 2 dot (-10) dot s_2 <=> -250000 = -20 s_2 <=> s_2 = 12500 " (m)".
      $

      *Tổng độ cao cực đại:*
      $
        h_max = s_1 + s_2 = 2000 + 12500 = 14500 " (mét)".
      $
      
      Đáp số: *14500*.
    ]
  )

  // Question 5
  #tln(
    [Một khách hàng vay số tiền $100$ triệu đồng từ một ngân hàng để tiêu dùng với lãi suất cố định là $1\%$ mỗi tháng. Phương thức hoàn trả nợ là trả góp hàng tháng: Cứ sau đúng một tháng kể từ ngày vay, khách hàng phải trả cho ngân hàng cùng một số tiền cố định là $m$ triệu đồng. Biết rằng sau đúng $12$ tháng kể từ ngày vay thì khách hàng đó tất toán (trả hết) toàn bộ khoản nợ cả gốc lẫn lãi. Hãy tính số tiền $m$ mà khách hàng phải trả hàng tháng (làm tròn kết quả đến hàng phần trăm, đơn vị: triệu đồng).],
    [8,88],
    loigiai: [
      #ppgiai[
        - Sử dụng công thức số dư nợ sau mỗi tháng.
        - Áp dụng công thức tính số tiền trả góp hàng tháng đều đặn $m$ để sau $n$ tháng dư nợ bằng 0:
          $m = (A dot r dot (1 + r)^n) / ((1 + r)^n - 1)$, trong đó $A$ là số tiền gốc ban đầu, $r$ là lãi suất hàng tháng và $n$ là số tháng trả nợ.
      ]
      Gọi:
      - Số tiền vay ban đầu: $A = 100$ (triệu đồng).
      - Lãi suất hàng tháng: $r = 1\% = 0,01$.
      - Số tháng trả nợ: $n = 12$ (tháng).
      
      Công thức tính số tiền trả hàng tháng để hết nợ sau $12$ tháng là:
      $
        m = (A dot r dot (1 + r)^(12)) / ((1 + r)^(12) - 1).
      $
      Thay số vào công thức:
      $
        m = (100 dot 0,01 dot (1,01)^(12)) / ((1,01)^(12) - 1) = (1,01^(12)) / (1,01^(12) - 1).
      $
      Ta có giá trị lũy thừa chính xác của $(1,01)^{12}$ là:
      $
        (1,01)^(12) approx 1,12682503.
      $
      Thay vào biểu thức tính $m$:
      $
        m = (1,12682503) / (1,12682503 - 1) = (1,12682503) / (0,12682503) approx 8,88488 " (triệu đồng)".
      $
      Làm tròn kết quả đến hàng phần trăm, số tiền trả hàng tháng là *$8,88$* triệu đồng.
      
      Đáp số: *8,88*.
    ]
  )

  // Question 6
  #tln(
    [Trong không gian tọa độ $O x y z$, cho ba điểm nằm trên các trục tọa độ là $A(3; 0; 0)$, $B(0; 6; 0)$, $C(0; 0; 9)$ và mặt phẳng $(P): x + y + z - 12 = 0$. Tìm tọa độ điểm $M(x_M; y_M; z_M)$ di động trên mặt phẳng $(P)$ sao cho biểu thức $T = M A^2 + M B^2 + M C^2$ đạt giá trị nhỏ nhất. Hãy tính tích giá trị $P = x_M dot y_M dot z_M$.],
    [60],
    loigiai: [
      #ppgiai[
        - Gọi $G$ là trọng tâm của tam giác $A B C$.
        - Sử dụng tính chất của trọng tâm, ta có hệ thức vectơ: $vect(M A)^2 + vect(M B)^2 + vect(M C)^2 = 3 M G^2 + G A^2 + G B^2 + G C^2$.
        - Vì $G A^2 + G B^2 + G C^2$ là hằng số không đổi, biểu thức đạt giá trị nhỏ nhất khi khoảng cách $M G$ nhỏ nhất.
        - Khoảng cách $M G$ nhỏ nhất khi $M$ là hình chiếu vuông góc của trọng tâm $G$ trên mặt phẳng $(P)$.
      ]
      *Bước 1: Tìm tọa độ trọng tâm $G$ của tam giác $A B C$*
      Tọa độ trọng tâm $G$ được tính bằng trung bình cộng tọa độ các đỉnh:
      $
        x_G = (3 + 0 + 0) / 3 = 1,
      $
      $
        y_G = (0 + 6 + 0) / 3 = 2,
      $
      $
        z_G = (0 + 0 + 9) / 3 = 3.
      $
      Do đó $G(1; 2; 3)$.

      *Bước 2: Phân tích biểu thức $T$*
      Với mọi điểm $M$, ta luôn có:
      $
        T = M A^2 + M B^2 + M C^2 = (vect(M G) + vect(G A))^2 + (vect(M G) + vect(G B))^2 + (vect(M G) + vect(G C))^2
      $
      $
        = 3 M G^2 + (G A^2 + G B^2 + G C^2) + 2 vect(M G) dot (vect(G A) + vect(G B) + vect(G C)).
      $
      Vì $G$ là trọng tâm của tam giác $A B C$ nên $vect(G A) + vect(G B) + vect(G C) = vect(0)$.
      Do đó:
      $
        T = 3 M G^2 + G A^2 + G B^2 + G C^2.
      $
      Vì tam giác $A B C$ cố định nên $G A^2 + G B^2 + G C^2$ là hằng số.
      Để $T$ đạt giá trị nhỏ nhất thì $M G^2$ phải đạt giá trị nhỏ nhất.
      Vì điểm $M$ di động trên mặt phẳng $(P)$ nên $M G$ đạt giá trị nhỏ nhất khi $M$ là hình chiếu vuông góc của $G$ trên mặt phẳng $(P)$.

      *Bước 3: Tìm tọa độ hình chiếu $M$ của $G$ trên mặt phẳng $(P)$*
      Mặt phẳng $(P)$ có vectơ pháp tuyến là $vect(n) = (1; 1; 1)$.
      Đường thẳng đi qua $G(1; 2; 3)$ và vuông góc với $(P)$ có phương trình tham số:
      $
        cases(x = 1 + t, y = 2 + t, z = 3 + t), quad t in RR.
      $
      Vì $M$ là giao điểm của đường thẳng này với mặt phẳng $(P): x + y + z - 12 = 0$, ta thay tọa độ của $M$ vào phương trình $(P)$:
      $
        (1 + t) + (2 + t) + (3 + t) - 12 = 0 <=> 3t + 6 - 12 = 0 <=> 3t = 6 <=> t = 2.
      $
      Thay $t = 2$ vào phương trình tham số của đường thẳng, ta được tọa độ của điểm $M$:
      $
        x_M = 1 + 2 = 3,
      $
      $
        y_M = 2 + 2 = 4,
      $
      $
        z_M = 3 + 2 = 5.
      $
      Tọa độ điểm $M(3; 4; 5)$ thỏa mãn nằm trên mặt phẳng $(P)$ (do $3 + 4 + 5 = 12$).
      Tích tọa độ của điểm $M$ là:
      $
        P = x_M dot y_M dot z_M = 3 dot 4 dot 5 = 60.
      $
      
      Đáp số: *60*.
    ]
  )

]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
