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
  school: "ĐỀ THI THỬ LẦN 8",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 8)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "805",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  // Question 1
  #tn(
    [Tập xác định của hàm số $y = ln(x - 3)$ là],
    (
      True([$(3; +oo)$.]),
      [$[3; +oo)$.],
      [$(-oo; 3)$.],
      [$RR setminus {3}$.],
    ),
    loigiai: [
      #ppgiai[
        Hàm số logarit $y = ln(u(x))$ xác định khi và chỉ khi $u(x) > 0$.
      ]
      Điều kiện xác định của hàm số là:
      $
        x - 3 > 0 <=> x > 3.
      $
      Vậy tập xác định của hàm số là $D = (3; +oo)$.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 2
  #tn(
    [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = x(x - 1)^2 (x + 2)^3$. Số điểm cực trị của hàm số đã cho là],
    (
      [$3$.],
      True([$2$.]),
      [$1$.],
      [$0$.],
    ),
    loigiai: [
      #ppgiai[
        Điểm cực trị của hàm số là nghiệm đơn hoặc nghiệm bội lẻ của phương trình $f'(x) = 0$.
      ]
      Ta có:
      $
        f'(x) = 0 <=> x(x - 1)^2 (x + 2)^3 = 0 <=> cases(x = 0 "(nghiệm đơn)", x = 1 "(nghiệm bội kép)", x = -2 "(nghiệm bội ba)").
      $
      Khi đi qua các điểm $x = 0$ và $x = -2$, đạo hàm $f'(x)$ đổi dấu. Đi qua điểm $x = 1$, đạo hàm $f'(x)$ không đổi dấu.
      Do đó, hàm số có đúng $2$ điểm cực trị (đó là $x = 0$ và $x = -2$).
      
      Chọn đáp án *B*.
    ]
  )

  // Question 3
  #tn(
    [Trong không gian $O x y z$, cho hai vectơ $vect(a) = (1; 2; -1)$ và $vect(b) = (2; -1; 3)$. Tọa độ của vectơ $vect(u) = 2 vect(a) - vect(b)$ là],
    (
      True([$vect(u) = (0; 5; -5)$.]),
      [$vect(u) = (0; 3; 1)$.],
      [$vect(u) = (-1; 5; -5)$.],
      [$vect(u) = (0; 5; 1)$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức tính tọa độ của hiệu hai vectơ và tích của một số với một vectơ:
        Nếu $vect(a) = (x_1; y_1; z_1)$ và $vect(b) = (x_2; y_2; z_2)$ thì $k vect(a) - vect(b) = (k x_1 - x_2; k y_1 - y_2; k z_1 - z_2)$.
      ]
      Ta có:
      - $2 vect(a) = (2 dot 1; 2 dot 2; 2 dot (-1)) = (2; 4; -2)$.
      - $vect(u) = 2 vect(a) - vect(b) = (2 - 2; 4 - (-1); -2 - 3) = (0; 5; -5)$.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 4
  #tn(
    [Với mọi số thực dương $a, b$ và $a != 1$, giá trị của biểu thức $P = log_a (a^3 b^2) - 2 log_a b$ bằng],
    (
      True([$3$.]),
      [$1$.],
      [$3 - 4 log_a b$.],
      [$3 + 4 log_a b$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng các quy tắc biến đổi logarit của tích, lũy thừa:
        - $log_a (x y) = log_a x + log_a y$ với $x, y > 0$.
        - $log_a (x^alpha) = alpha log_a x$ với $x > 0$.
      ]
      Biến đổi biểu thức $P$:
      $
        P = log_a a^3 + log_a b^2 - 2 log_a b
        = 3 + 2 log_a b - 2 log_a b = 3.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 5
  #tn(
    [Cho hình nón có bán kính đường tròn đáy $r = 3$ và chiều cao $h = 4$. Thể tích $V$ của khối nón đã cho bằng],
    (
      True([$12 pi$.]),
      [$36 pi$.],
      [$15 pi$.],
      [$48 pi$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức tính thể tích của khối nón: $V = 1/3 pi r^2 h$.
      ]
      Thay các số liệu $r = 3, h = 4$ vào công thức:
      $
        V = 1/3 pi dot 3^2 dot 4 = 12 pi.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 6
  #tn(
    [Một chiếc hộp đựng $5$ quả cầu màu đỏ và $7$ quả cầu màu xanh có kích thước giống nhau. Chọn ngẫu nhiên đồng thời $3$ quả cầu từ hộp. Xác suất để cả $3$ quả cầu được chọn đều có màu đỏ là],
    (
      True([$1/22$.]),
      [$5/12$.],
      [$1/12$.],
      [$5/22$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính số phần tử của không gian mẫu $n(Omega) = C(n, k)$.
        - Tính số kết quả thuận lợi cho biến cố chọn được 3 quả cầu màu đỏ $n(A) = C(n_1, k)$.
        - Xác suất biến cố $A$ là $P(A) = n(A) / n(Omega)$.
      ]
      - Số cách chọn ngẫu nhiên $3$ quả cầu từ $12$ quả cầu trong hộp là:
      $
        n(Omega) = C(12, 3) = (12 dot 11 dot 10) / (3 dot 2 dot 1) = 220.
      $
      - Gọi $A$ là biến cố "Cả $3$ quả cầu được chọn đều có màu đỏ". Số cách chọn $3$ quả cầu đỏ từ $5$ quả cầu đỏ là:
      $
        n(A) = C(5, 3) = 10.
      $
      - Xác suất của biến cố $A$ là:
      $
        P(A) = (n(A)) / (n(Omega)) = 10 / 220 = 1 / 22.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 7
  #tn(
    [Trong không gian $O x y z$, tọa độ tâm $I$ và bán kính $R$ của mặt cầu $(S): x^2 + y^2 + z^2 - 2x + 4y - 6z - 2 = 0$ là],
    (
      True([$I(1; -2; 3)$ và $R = 4$.]),
      [$I(-1; 2; -3)$ và $R = 4$.],
      [$I(1; -2; 3)$ và $R = 16$.],
      [$I(-1; 2; -3)$ và $R = sqrt(12)$.],
    ),
    loigiai: [
      #ppgiai[
        Phương trình mặt cầu dạng $x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0$ có tâm $I(a; b; c)$ và bán kính $R = sqrt(a^2 + b^2 + c^2 - d)$ (với $a^2 + b^2 + c^2 - d > 0$).
      ]
      Từ phương trình mặt cầu $(S)$, ta xác định các hệ số:
      $
        a = 1, quad b = -2, quad c = 3, quad d = -2.
      $
      Do đó:
      - Tọa độ tâm: $I(1; -2; 3)$.
      - Bán kính: $R = sqrt(1^2 + (-2)^2 + 3^2 - (-2)) = sqrt(1 + 4 + 9 + 2) = sqrt(16) = 4$.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 8
  #tn(
    [Cho cấp số cộng $(u_n)$ có số hạng đầu $u_1 = -3$ và công sai $d = 4$. Số hạng thứ $10$ của cấp số cộng đã cho bằng],
    (
      True([$33$.]),
      [$37$.],
      [$-39$.],
      [$36$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức số hạng tổng quát của cấp số cộng: $u_n = u_1 + (n - 1) d$.
      ]
      Ta có:
      $
        u_(10) = u_1 + 9d = -3 + 9 dot 4 = -3 + 36 = 33.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 9
  #tn(
    [Trong không gian $O x y z$, góc giữa hai đường thẳng $d_1$ và $d_2$ lần lượt có vectơ chỉ phương $vect(u_1) = (1; 0; -1)$ và $vect(u_2) = (0; 1; 1)$ bằng],
    (
      True([$60^circ$.]),
      [$30^circ$.],
      [$45^circ$.],
      [$90^circ$.],
    ),
    loigiai: [
      #ppgiai[
        Công thức tính cosin của góc giữa hai đường thẳng có các vectơ chỉ phương $vect(u_1)$ và $vect(u_2)$:
        $
          cos(d_1, d_2) = (|vect(u_1) dot vect(u_2)|) / (|vect(u_1)| dot |vect(u_2)|).
        $
      ]
      Ta có:
      - Tích vô hướng: $vect(u_1) dot vect(u_2) = 1 dot 0 + 0 dot 1 + (-1) dot 1 = -1$.
      - Độ dài các vectơ chỉ phương:
        $|vect(u_1)| = sqrt(1^2 + 0^2 + (-1)^2) = sqrt(2)$,
        $|vect(u_2)| = sqrt(0^2 + 1^2 + 1^2) = sqrt(2)$.
      - Tính cosin của góc $theta$ giữa hai đường thẳng:
        $
          cos theta = (|-1|) / (sqrt(2) dot sqrt(2)) = 1 / 2.
        $
      Suy ra góc $theta = 60^circ$.
      
      Chọn đáp án *A*.
    ]
  )

  // Question 10
  #tn(
    [Cho các hàm số $f(x)$ và $g(x)$ liên tục trên đoạn $[1; 3]$ thỏa mãn $integral_1^3 f(x) dif x = 4$ và $integral_1^3 g(x) dif x = -2$. Tích phân $integral_1^3 [2 f(x) - 3 g(x)] dif x$ bằng],
    (
      True([$14$.]),
      [$2$.],
      [$10$.],
      [$6$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng tính chất tuyến tính của tích phân xác định:
        $
          integral_a^b [k f(x) + l g(x)] dif x = k integral_a^b f(x) dif x + l integral_a^b g(x) dif x.
        $
      ]
      Ta có:
      $
        integral_1^3 [2 f(x) - 3 g(x)] dif x = 2 integral_1^3 f(x) dif x - 3 integral_1^3 g(x) dif x
        = 2 dot 4 - 3 dot (-2) = 8 + 6 = 14.
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 11
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
      Khoảng biến thiên của mẫu số liệu ghép nhóm này bằng],
    (
      True([$20 c m$.]),
      [$15 c m$.],
      [$25 c m$.],
      [$10 c m$.],
    ),
    loigiai: [
      #ppgiai[
        Khoảng biến thiên của mẫu số liệu ghép nhóm là hiệu giữa đầu mút phải của nhóm cuối cùng và đầu mút trái của nhóm đầu tiên: $R = a_k - a_1$.
      ]
      - Nhóm đầu tiên là $[150; 155)$ có đầu mút trái $a_1 = 150$.
      - Nhóm cuối cùng là $[165; 170]$ có đầu mút phải $a_k = 170$.
      Khoảng biến thiên của mẫu số liệu ghép nhóm này là:
      $
        R = 170 - 150 = 20 " (cm)".
      $
      
      Chọn đáp án *A*.
    ]
  )

  // Question 12
  #tn(
    [Cho hình chóp $S . A B C$ có đáy $A B C$ là tam giác vuông tại $B$, cạnh $S A$ vuông góc với mặt phẳng đáy $(A B C)$ như hình vẽ minh họa dưới đây. Đường thẳng nào sau đây vuông góc với mặt phẳng $(S A B)$?],
    (
      True([$B C$.]),
      [$A C$.],
      [$S C$.],
      [$A B$.],
    ),
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Đỉnh A, B, C, S
      let A = (0, 0)
      let B = (-1.5, -1.2)
      let C = (2, -1.2)
      let S = (0, 3)
      
      // Đường đứt nét
      line(A, B, stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
      line(A, C, stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
      line(A, S, stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
      
      // Đường nét liền
      line(S, B, stroke: 1.1pt + black)
      line(S, C, stroke: 1.1pt + black)
      line(B, C, stroke: 1.1pt + black)
      
      // Ký hiệu góc vuông đáy tam giác ABC tại B
      line((-1.2, -0.96), (-0.9, -0.96), stroke: 0.5pt + black)
      line((-1.2, -1.2), (-0.9, -0.96), stroke: 0.5pt + black)
      
      // Ký hiệu góc vuông SA vuông góc đáy (SA vuông góc AB)
      line((0, 0.3), (-0.15, 0.18), stroke: 0.5pt + black)
      line((-0.15, -0.12), (-0.15, 0.18), stroke: 0.5pt + black)

      // Ký hiệu tên điểm
      content(A, [A], anchor: "south-east")
      content(B, [B], anchor: "north-east")
      content(C, [C], anchor: "north-west")
      content(S, [S], anchor: "south")
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        Để chứng minh một đường thẳng vuông góc với một mặt phẳng, ta chứng minh đường thẳng đó vuông góc với hai đường thẳng cắt nhau nằm trong mặt phẳng đó.
      ]
      Ta có:
      - $B C perp A B$ (do tam giác $A B C$ vuông tại $B$).
      - $B C perp S A$ (do $S A perp (A B C)$ và $B C subset (A B C)$).
      - Hai đường thẳng $A B$ và $S A$ cắt nhau tại $A$ và cùng thuộc mặt phẳng $(S A B)$.
      Từ đó suy ra $B C perp (S A B)$.
      
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
    [Cho hàm số phân thức bậc hai trên bậc nhất $f(x) = (2x^2 - x - 1) / (x - 2)$ có đồ thị là $(C)$.],
    (
      True([Đường tiệm cận đứng của đồ thị $(C)$ là đường thẳng $x = 2$.]),
      [Đồ thị $(C)$ có đường tiệm cận ngang là đường thẳng $y = 2$.],
      True([Đường tiệm cận xiên của đồ thị $(C)$ là đường thẳng $y = 2x + 3$.]),
      True([Giao điểm của hai đường tiệm cận của đồ thị $(C)$ là điểm $I(2; 7)$.]),
    ),
    loigiai: [
      #ppgiai[
        - Xác định tập xác định của hàm số $D = RR setminus {2}$.
        - Tìm giới hạn khi $x -> 2$ để tìm tiệm cận đứng.
        - Chia đa thức để xác định tiệm cận xiên $y = a x + b$.
        - Tìm giao điểm của hai tiệm cận bằng cách giải hệ phương trình chứa hai đường tiệm cận đó.
      ]
      *a) Tìm tiệm cận đứng:*
      Ta có $lim_(x -> 2^+) (2x^2 - x - 1) / (x - 2) = +oo$ (vì $2(2)^2 - 2 - 1 = 5 > 0$ và khi $x -> 2^+$ thì $x - 2 > 0$).
      Tương tự, $lim_(x -> 2^-) (2x^2 - x - 1) / (x - 2) = -oo$.
      Vậy đường thẳng $x = 2$ là đường tiệm cận đứng của đồ thị $(C)$. Mệnh đề a *ĐÚNG*.

      *b) Tìm tiệm cận ngang:*
      Ta có $lim_(x -> +oo) (2x^2 - x - 1) / (x - 2) = +oo$ và $lim_(x -> -oo) (2x^2 - x - 1) / (x - 2) = -oo$.
      Do đó, đồ thị $(C)$ không có tiệm cận ngang. Mệnh đề nói đồ thị $(C)$ có tiệm cận ngang $y = 2$ là *SAI*.

      *c) Tìm tiệm cận xiên:*
      Chia tử số cho mẫu số:
      $
        2x^2 - x - 1 = (2x + 3)(x - 2) + 5 <=> (2x^2 - x - 1) / (x - 2) = 2x + 3 + 5 / (x - 2).
      $
      Ta có:
      $
        lim_(x -> +-oo) [f(x) - (2x + 3)] = lim_(x -> +-oo) 5 / (x - 2) = 0.
      $
      Vậy đường thẳng $y = 2x + 3$ là đường tiệm cận xiên của đồ thị $(C)$. Mệnh đề c *ĐÚNG*.

      *d) Tìm giao điểm hai đường tiệm cận:*
      Giao điểm $I$ là nghiệm của hệ phương trình:
      $
        cases(x = 2, y = 2x + 3) <=> cases(x = 2, y = 7) => I(2; 7).
      $
      Mệnh đề d *ĐÚNG*.
    ]
  )

  // Question 2
  #ds(
    [Trong không gian tọa độ $O x y z$ (đơn vị trên các trục là kilômét), Trái Đất được mô phỏng là một mặt cầu $(S): x^2 + y^2 + z^2 = 6400^2$ có tâm là gốc tọa độ $O(0;0;0)$ (tâm Trái Đất). Một vệ tinh địa tĩnh di chuyển trên một quỹ đạo tròn $(C)$ đồng tâm $O$ nằm trong mặt phẳng xích đạo $(P): z = 0$. Vệ tinh này bay ở độ cao $35.600$ km so với bề mặt Trái Đất.],
    (
      True([Phương trình mặt phẳng chứa quỹ đạo của vệ tinh là $z = 0$.]),
      True([Bán kính quỹ đạo tròn của vệ tinh bằng $42.000$ km.]),
      True([Tại một thời điểm, nếu vệ tinh ở vị trí $M(21.000; y_0; 0)$ với $y_0 > 0$ thì $y_0 = 21.000 sqrt(3)$ km.]),
      [Một trạm thu phát tín hiệu trên mặt đất đặt tại điểm $A(0; 0; 6.400)$ (ở Cực Bắc của Trái Đất). Khi vệ tinh di chuyển trên quỹ đạo, khoảng cách từ vệ tinh đến trạm $A$ thay đổi liên tục theo thời gian.],
    ),
    fig: cetz.canvas(length: 1.2cm, {
      import cetz.draw: *
      // Vẽ Trái Đất (đường tròn tâm O)
      circle((0, 0), radius: 0.7, fill: rgb("80c0ff"), stroke: 1pt + black)
      content((0, 0), [Trái Đất], style: (size: 7pt))
      
      // Vẽ trục quay Oz
      line((0, -1.6), (0, 1.6), stroke: (dash: "dashed", paint: gray))
      content((0, 1.7), $O z$)
      
      // Vẽ quỹ đạo vệ tinh (ellipse tâm O)
      let orbit-pts = range(0, 61).map(i => {
        let t = 2 * calc.pi * i / 60
        (2.3 * calc.cos(t), 0.7 * calc.sin(t))
      })
      line(..orbit-pts, stroke: 1.1pt + blue)
      content((1.8, -0.6), [Quỹ đạo], style: (size: 7pt, fill: blue))
      
      // Vẽ vệ tinh trên quỹ đạo
      circle((2.0, 0.35), radius: 0.08, fill: red)
      content((2.35, 0.55), [Vệ tinh (M)], style: (size: 7pt, fill: red))
      
      // Trạm A ở Cực Bắc (điểm trên đỉnh đường tròn Trái Đất)
      circle((0, 0.7), radius: 0.04, fill: black)
      content((0.25, 0.85), $A$, style: (size: 8pt))
      
      // Vẽ đoạn thẳng từ trạm A đến vệ tinh M
      line((0, 0.7), (2.0, 0.35), stroke: (dash: "dashed", paint: red, thickness: 0.8pt))
    }),
    fig-pos: "center",
    fig-width: 45%,
    loigiai: [
      #ppgiai[
        - Mặt cầu Trái Đất có bán kính $R_E = 6.400$ km.
        - Độ cao của vệ tinh là khoảng cách từ vệ tinh tới bề mặt Trái Đất. Bán kính quỹ đạo tròn của vệ tinh bằng tổng bán kính Trái Đất và độ cao vệ tinh: $R_O = R_E + h$.
        - Sử dụng phương trình đường tròn $x^2 + y^2 = R_O^2$ trong mặt phẳng $z = 0$ để tìm tọa độ.
        - Tính khoảng cách từ điểm $M(x; y; 0)$ trên quỹ đạo tới trạm $A(0; 0; 6.400)$ để kiểm tra xem nó có thay đổi hay không.
      ]
      *a)* Quỹ đạo vệ tinh nằm trong mặt phẳng xích đạo nên phương trình mặt phẳng quỹ đạo là $z = 0$. Mệnh đề a *ĐÚNG*.

      *b)* Bán kính quỹ đạo tròn của vệ tinh là:
      $
        R_O = R_E + h = 6.400 + 35.600 = 42.000 " (km)".
      $
      Mệnh đề b *ĐÚNG*.

      *c)* Vệ tinh $M(x_0; y_0; z_0)$ nằm trên đường tròn quỹ đạo nên:
      $
        x_0^2 + y_0^2 = R_O^2 = 42.000^2 quad "và" quad z_0 = 0.
      $
      Với $x_0 = 21.000$ km và $y_0 > 0$, ta có:
      $
        21.000^2 + y_0^2 = 42.000^2 <=> y_0^2 = 42.000^2 - 21.000^2 = (2 dot 21.000)^2 - 21.000^2
      $
      $
        <=> y_0^2 = 3 dot 21.000^2 => y_0 = 21.000 sqrt(3) " (km)".
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Trạm thu phát tín hiệu đặt tại $A(0; 0; 6.400)$.
      Vệ tinh $M(x; y; 0)$ di chuyển trên quỹ đạo có hoành độ và tung độ thỏa mãn $x^2 + y^2 = 42.000^2$.
      Khoảng cách từ vệ tinh $M$ tới trạm $A$ là:
      $
        A M = sqrt((x-0)^2 + (y-0)^2 + (0 - 6.400)^2) = sqrt(x^2 + y^2 + 6.400^2)
        = sqrt(42.000^2 + 6.400^2) " (km)".
      $
      Vì biểu thức này là một hằng số (không phụ thuộc vào $x, y$), nên khoảng cách từ vệ tinh đến trạm $A$ luôn luôn không đổi khi vệ tinh di chuyển trên quỹ đạo (khoảng cách này xấp xỉ $42.485$ km).
      Mệnh đề nói khoảng cách thay đổi liên tục là *SAI*.

      #nhanxet[Bài toán kết hợp kiến thức hình học tọa độ không gian thực tế. Nhiều học sinh sẽ lầm tưởng khoảng cách từ vệ tinh đến trạm $A$ thay đổi vì vệ tinh di chuyển trên quỹ đạo tròn, tuy nhiên trạm $A$ nằm trên trục đối xứng (trục cực $O z$) nên khoảng cách đến mọi điểm trên đường tròn quỹ đạo xích đạo là như nhau.]
    ]
  )

  // Question 3
  #ds(
    [Dự báo thời tiết tại một thành phố du lịch được mô hình hóa bởi một xích Markov hai trạng thái: Nắng (N) và Mưa (M). Theo số liệu thống kê lịch sử: nếu hôm nay trời nắng, xác suất ngày mai trời nắng là $0,8$ (xác suất mưa là $0,2$). Nếu hôm nay trời mưa, xác suất ngày mai trời nắng là $0,4$ (xác suất mưa là $0,6$). Giả sử ngày hôm nay (Ngày 0) là một ngày nắng.],
    (
      True([Xác suất để ngày mai (Ngày 1) trời mưa là $0,2$.]),
      True([Xác suất để ngày kia (Ngày 2) trời nắng là $0,72$.]),
      True([Nếu Ngày 1 trời mưa, xác suất để Ngày 3 trời mưa là $0,44$.]),
      [Nếu xác suất ngày hôm nay trời nắng là $0,5$ thì xác suất để ngày kia (Ngày 2) trời nắng là $0,68$.],
    ),
    loigiai: [
      #ppgiai[
        - Gọi $X_n$ là trạng thái thời tiết ở ngày thứ $n$. Không gian trạng thái $S = {N, M}$.
        - Ma trận xác suất chuyển trạng thái từ hôm nay sang ngày mai là:
          $P = mat(0.8, 0.2; 0.4, 0.6)$.
        - Vectơ xác suất ban đầu (Ngày 0): $vect(v)_0 = (p_0; q_0)$, trong đó $p_0$ là xác suất nắng, $q_0$ là xác suất mưa.
        - Công thức cập nhật: $vect(v)_n = vect(v)_(n-1) P = vect(v)_0 P^n$.
      ]
      *a)* Ngày 0 trời nắng nên $vect(v)_0 = (1; 0)$.
      Vectơ xác suất của Ngày 1 là:
      $
        vect(v)_1 = vect(v)_0 P = (1; 0) mat(0.8, 0.2; 0.4, 0.6) = (0.8; 0.2).
      $
      Vậy xác suất Ngày 1 trời mưa là $0,2$. Mệnh đề a *ĐÚNG*.

      *b)* Vectơ xác suất của Ngày 2 là:
      $
        vect(v)_2 = vect(v)_1 P = (0.8; 0.2) mat(0.8, 0.2; 0.4, 0.6)
        = (0.8 dot 0.8 + 0.2 dot 0.4; 0.8 dot 0.2 + 0.2 dot 0.6)
      $
      $
        = (0.64 + 0.08; 0.16 + 0.12) = (0.72; 0.28).
      $
      Vậy xác suất Ngày 2 trời nắng là $0,72$. Mệnh đề b *ĐÚNG*.

      *c)* Nếu Ngày 1 trời mưa, ta coi Ngày 1 là trạng thái ban đầu mới $vect(v)'_1 = (0; 1)$.
      Xác suất chuyển sang Ngày 3 (trải qua 2 bước chuyển từ Ngày 1 đến Ngày 3):
      - Ngày 2: $vect(v)'_2 = vect(v)'_1 P = (0; 1) mat(0.8, 0.2; 0.4, 0.6) = (0.4; 0.6)$.
      - Ngày 3: $vect(v)'_3 = vect(v)'_2 P = (0.4; 0.6) mat(0.8, 0.2; 0.4, 0.6)
        = (0.4 dot 0.8 + 0.6 dot 0.4; 0.4 dot 0.2 + 0.6 dot 0.6)$
      $
        = (0.32 + 0.24; 0.08 + 0.36) = (0.56; 0.44).
      $
      Vậy nếu Ngày 1 trời mưa, xác suất Ngày 3 trời mưa là $0,44$. Mệnh đề c *ĐÚNG*.

      *d)* Nếu xác suất ban đầu (Ngày 0) trời nắng là $0,5$ thì $vect(u)_0 = (0.5; 0.5)$.
      - Ngày 1:
        $
          vect(u)_1 = (0.5; 0.5) mat(0.8, 0.2; 0.4, 0.6)
          = (0.5 dot 0.8 + 0.5 dot 0.4; 0.5 dot 0.2 + 0.5 dot 0.6) = (0.6; 0.4).
        $
      - Ngày 2:
        $
          vect(u)_2 = (0.6; 0.4) mat(0.8, 0.2; 0.4, 0.6)
          = (0.6 dot 0.8 + 0.4 dot 0.4; 0.6 dot 0.2 + 0.4 dot 0.6)
        $
        $
          = (0.48 + 0.16; 0.12 + 0.24) = (0.64; 0.36).
        $
      Vậy xác suất Ngày 2 trời nắng là $0,64$, không phải $0,68$. Mệnh đề d *SAI*.

      #meo[Đối với xích Markov 2 trạng thái, khi nhân ma trận xác suất chuyển đổi liên tiếp, ta có thể dùng trực tiếp máy tính cầm tay biểu diễn ma trận để tính nhanh $P^2$, $P^3$, giúp tiết kiệm thời gian tính toán thủ công.]
    ]
  )

  // Question 4
  #ds(
    [Kết quả thi khảo sát chất lượng môn Toán của học sinh lớp 12A được ghi lại ở bảng tần số ghép nhóm dưới đây:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Điểm số], [$[5; 6)$], [$[6; 7)$], [$[7; 8)$], [$[8; 9)$], [$[9; 10]$],
          [Số học sinh], [4], [8], [12], [10], [6],
        )
      ]
    ],
    (
      True([Tổng số học sinh lớp 12A tham gia làm bài thi là $40$ học sinh.]),
      True([Điểm thi trung bình của lớp 12A là $7,65$ điểm.]),
      True([Phương sai của mẫu số liệu ghép nhóm trên bằng $1,4275$.]),
      [Độ lệch chuẩn của mẫu số liệu ghép nhóm trên lớn hơn $1,20$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính cỡ mẫu $n = sum n_i$.
        - Tìm giá trị đại diện $x_i$ của mỗi nhóm: $x_i = (a_i + a_(i+1)) / 2$.
        - Tính điểm trung bình $bar(x) = 1/n sum n_i x_i$.
        - Tính phương sai $s^2 = 1/n sum n_i x_i^2 - bar(x)^2$.
        - Tính độ lệch chuẩn $s = sqrt(s^2)$.
      ]
      *a)* Tổng số học sinh tham gia bài thi (cỡ mẫu) là:
      $
        n = 4 + 8 + 12 + 10 + 6 = 40 " (học sinh)".
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Xác định các giá trị đại diện và tính điểm trung bình:
      - Nhóm $[5; 6)$ có giá trị đại diện $x_1 = 5.5$, tần số $n_1 = 4$.
      - Nhóm $[6; 7)$ có giá trị đại diện $x_2 = 6.5$, tần số $n_2 = 8$.
      - Nhóm $[7; 8)$ có giá trị đại diện $x_3 = 7.5$, tần số $n_3 = 12$.
      - Nhóm $[8; 9)$ có giá trị đại diện $x_4 = 8.5$, tần số $n_4 = 10$.
      - Nhóm $[9; 10]$ có giá trị đại diện $x_5 = 9.5$, tần số $n_5 = 6$.
      Điểm thi trung bình:
      $
        bar(x) = (4 dot 5.5 + 8 dot 6.5 + 12 dot 7.5 + 10 dot 8.5 + 6 dot 9.5) / 40
        = (22 + 52 + 90 + 85 + 57) / 40 = 306 / 40 = 7.65.
      $
      Mệnh đề b *ĐÚNG*.

      *c)* Tính phương sai:
      $
        s^2 = 1/40 dot [4 dot 5.5^2 + 8 dot 6.5^2 + 12 dot 7.5^2 + 10 dot 8.5^2 + 6 dot 9.5^2] - (7.65)^2
      $
      $
        = 1/40 dot [4 dot 30.25 + 8 dot 42.25 + 12 dot 56.25 + 10 dot 72.25 + 6 dot 90.25] - 58.5225
      $
      $
        = 1/40 dot [121 + 338 + 675 + 722.5 + 541.5] - 58.5225
      $
      $
        = 2398 / 40 - 58.5225 = 59.95 - 58.5225 = 1.4275.
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Tính độ lệch chuẩn:
      $
        s = sqrt(s^2) = sqrt(1.4275) approx 1.1948.
      $
      Vì $1.1948 < 1.20$ nên độ lệch chuẩn nhỏ hơn $1.20$. Mệnh đề nói độ lệch chuẩn lớn hơn $1.20$ là *SAI*.

      #nhanxet[Việc xác định đúng giá trị đại diện của từng nhóm là bước cực kỳ quan trọng để tính toán số trung bình và phương sai. Lưu ý nhóm cuối cùng $[9; 10]$ có giá trị đại diện là $9.5$.]
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  // Question 1
  #tln(
    [Một thị trường nước giải khát chỉ có sự cạnh tranh của hai nhãn hiệu A và B. Theo nghiên cứu hành vi tiêu dùng hàng tháng: có $80\%$ khách hàng đang sử dụng sản phẩm của nhãn hiệu A tiếp tục trung thành sử dụng nhãn hiệu A vào tháng sau, còn $20\%$ sẽ chuyển sang dùng sản phẩm của nhãn hiệu B. Đối với khách hàng đang sử dụng sản phẩm nhãn hiệu B, có $70\%$ tiếp tục dùng nhãn hiệu B vào tháng sau, còn $30\%$ sẽ chuyển sang dùng nhãn hiệu A. Giả sử tổng lượng khách hàng trên thị trường là một hằng số không đổi. Khi thị trường đạt trạng thái ổn định (steady state), thị phần của nhãn hiệu A chiếm bao nhiêu phần trăm?],
    [60],
    loigiai: [
      #ppgiai[
        - Gọi $p_n, q_n$ lần lượt là thị phần của hai nhãn hiệu A và B ở tháng thứ $n$, với $p_n + q_n = 1$.
        - Thiết lập phương trình trạng thái chuyển tiếp: $p_(n+1) = 0.8 p_n + 0.3 q_n$.
        - Khi thị trường ổn định, thị phần các tháng không đổi: $p_(n+1) = p_n = pi_A$ và $q_(n+1) = q_n = pi_B$.
        - Giải hệ phương trình trạng thái ổn định để tìm $pi_A$.
      ]
      Gọi $pi_A, pi_B$ lần lượt là thị phần của nhãn hiệu A và B khi đạt trạng thái ổn định.
      Ta có hệ phương trình:
      $
        cases(pi_A = 0.8 pi_A + 0.3 pi_B, pi_A + pi_B = 1)
        <=> cases(0.2 pi_A = 0.3 pi_B, pi_A + pi_B = 1)
      $
      $
        <=> cases(2 pi_A = 3 pi_B, pi_A + pi_B = 1)
        <=> cases(pi_A = 3/2 pi_B, 3/2 pi_B + pi_B = 1)
        <=> cases(pi_B = 2/5 = 0.4, pi_A = 0.6).
      $
      Như vậy, khi thị trường đạt trạng thái ổn định thì nhãn hiệu A chiếm $0.6$ thị phần, tương đương với $60\%$.
      
      Đáp số: *60*.
    ]
  )

  // Question 2
  #tln(
    [Một tấm bìa các-tông hình chữ nhật có kích thước chiều rộng là $15$ cm và chiều dài là $24$ cm. Người ta cắt bỏ ở bốn góc của tấm bìa bốn hình vuông bằng nhau có cạnh bằng $x$ (cm) rồi gập các phần mép còn lại lên để tạo thành một chiếc hộp không nắp dạng hình hộp chữ nhật. Hãy tìm giá trị $x$ (cm) để thể tích của chiếc hộp đạt giá trị lớn nhất.],
    [3],
    loigiai: [
      #ppgiai[
        - Biểu diễn chiều rộng, chiều dài và chiều cao của hộp chữ nhật theo $x$.
        - Tìm điều kiện xác định của $x$: các kích thước của hộp phải dương.
        - Lập hàm số tính thể tích $V(x) = x(W - 2x)(L - 2x)$ và sử dụng đạo hàm để tìm điểm cực đại của hàm số trên khoảng xác định.
      ]
      Khi cắt bỏ bốn góc mỗi góc một hình vuông cạnh $x$ (cm) và gập lên:
      - Chiều cao của chiếc hộp là $x$ (cm).
      - Chiều rộng đáy của chiếc hộp là $15 - 2x$ (cm).
      - Chiều dài đáy của chiếc hộp là $24 - 2x$ (cm).
      Điều kiện để các kích thước của hộp đều dương:
      $
        cases(x > 0, 15 - 2x > 0, 24 - 2x > 0) <=> 0 < x < 7.5.
      $
      Thể tích của chiếc hộp được tính bởi hàm số:
      $
        V(x) = x(15 - 2x)(24 - 2x) = x(4x^2 - 78x + 360) = 4x^3 - 78x^2 + 360x " (cm"^3")".
      $
      Xét đạo hàm của hàm số $V(x)$ trên khoảng $(0; 7.5)$:
      $
        V'(x) = 12x^2 - 156x + 360 = 12(x^2 - 13x + 30).
      $
      Cho $V'(x) = 0 <=> x^2 - 13x + 30 = 0 <=> hoac(x = 3, x = 10)$.
      Vì $x in (0; 7.5)$ nên ta chỉ nhận giá trị $x = 3$.
      
      Khảo sát sự biến thiên của hàm $V(x)$ trên khoảng $(0; 7.5)$:
      - Với $0 < x < 3$: $V'(x) > 0$ nên hàm số đồng biến.
      - Với $3 < x < 7.5$: $V'(x) < 0$ nên hàm số nghịch biến.
      
      Do đó, hàm số đạt giá trị lớn nhất tại điểm $x = 3$.
      Vậy để thể tích chiếc hộp đạt giá trị lớn nhất thì ta cần cắt bỏ các hình vuông nhỏ ở bốn góc có độ dài cạnh $x = 3$ cm.

      #meo[Đối với bài toán tối ưu hóa thể tích của hộp từ tấm bìa hình chữ nhật kích thước $a times b$, giá trị cực đại đạt được tại nghiệm thuộc khoảng xác định của phương trình $12x^2 - 4(a+b)x + a b = 0$.]
      
      Đáp số: *3*.
    ]
  )

  // Question 3
  #tln(
    [Trong không gian tọa độ $O x y z$, cho ba điểm nằm trên ba trục tọa độ lần lượt là $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ và điểm $M(3; 2; 5)$. Tính khoảng cách từ điểm $M$ đến mặt phẳng $(A B C)$.],
    [4],
    loigiai: [
      #ppgiai[
        - Viết phương trình mặt phẳng $(A B C)$ theo đoạn chắn: $x/a + y/b + z/c = 1$.
        - Quy đồng đưa phương trình mặt phẳng về dạng tổng quát $A x + B y + C z + D = 0$.
        - Sử dụng công thức tính khoảng cách từ một điểm đến một mặt phẳng:
          $d(M, (P)) = (|A x_0 + B y_0 + C z_0 + D|) / (sqrt(A^2 + B^2 + C^2))$.
      ]
      Phương trình mặt phẳng $(A B C)$ đi qua ba điểm $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ theo đoạn chắn là:
      $
        x/1 + y/2 + z/3 = 1.
      $
      Quy đồng mẫu số chung là $6$, ta được phương trình tổng quát:
      $
        6x + 3y + 2z - 6 = 0.
      $
      Khoảng cách từ điểm $M(3; 2; 5)$ đến mặt phẳng $(A B C)$ là:
      $
        d(M, (A B C)) = (|6 dot 3 + 3 dot 2 + 2 dot 5 - 6|) / (sqrt(6^2 + 3^2 + 2^2))
        = (|18 + 6 + 10 - 6|) / (sqrt(36 + 9 + 4)) = 28 / sqrt(49) = 28 / 7 = 4.
      $
      
      Đáp số: *4*.
    ]
  )

  // Question 4
  #tln(
    [Một mái vòm của một trung tâm triển lãm có dạng một nửa hình ellipsoid (cắt bởi mặt phẳng nằm ngang chứa trục lớn và trục trung bình của ellipsoid). Nửa hình ellipsoid này có các bán trục lớn, bán trục trung bình và bán trục nhỏ (chiều cao mái vòm) lần lượt là $a = 9$ m, $b = 5$ m và $c = 4$ m. Hãy tính thể tích không gian bên trong của mái vòm triển lãm đó theo đơn vị mét khối (làm tròn kết quả đến hàng đơn vị).],
    [377],
    loigiai: [
      #ppgiai[
        - Thể tích của một hình ellipsoid hoàn chỉnh có ba bán trục $a, b, c$ là $V_0 = 4/3 pi a b c$.
        - Mái vòm có dạng một nửa hình ellipsoid nên thể tích bên trong mái vòm bằng $V = 1/2 V_0 = 2/3 pi a b c$.
        - Thay số liệu và làm tròn kết quả đến hàng đơn vị.
      ]
      Thể tích không gian bên trong mái vòm có dạng một nửa hình ellipsoid là:
      $
        V = 2/3 pi a b c = 2/3 pi dot 9 dot 5 dot 4 = 120 pi " (m"^3")".
      $
      Sử dụng giá trị gần đúng của $pi approx 3.14159265$:
      $
        V = 120 dot 3.14159265 approx 376.99 " (m"^3")".
      $
      Làm tròn kết quả đến hàng đơn vị, ta được thể tích là $377$ $m^3$.
      
      Đáp số: *377*.
    ]
  )

  // Question 5
  #tln(
    [Bài toán dân số thỏ của Fibonacci: Một cặp thỏ con (gồm một con đực và một con cái) mới sinh được đưa vào nuôi trong một trang trại bảo tồn. Sau đúng $1$ tháng tuổi, chúng trưởng thành và có khả năng sinh sản. Kể từ đó, cứ cuối mỗi tháng tiếp theo, mỗi cặp thỏ trưởng thành lại sinh ra đúng $1$ cặp thỏ con mới. Giả sử không có con thỏ nào chết đi trong suốt thời gian khảo sát. Số cặp thỏ ở tháng thứ $n$ ký hiệu là $u_n$ thỏa mãn hệ thức truy hồi của dãy số Fibonacci: $u_1 = 1$, $u_2 = 1$ và $u_n = u_(n-1) + u_(n-2)$ với mọi $n >= 3$. Hãy tính số cặp thỏ có trong trang trại ở tháng thứ $12$.],
    [144],
    loigiai: [
      #ppgiai[
        - Sử dụng định nghĩa dãy Fibonacci để liệt kê các số hạng đầu tiên.
        - Tính lần lượt từ $u_1$ đến $u_(12)$ bằng cách cộng hai số hạng liền trước nó.
      ]
      Ta có hệ thức truy hồi:
      - $u_1 = 1$
      - $u_2 = 1$
      - $u_3 = u_2 + u_1 = 1 + 1 = 2$
      - $u_4 = u_3 + u_2 = 2 + 1 = 3$
      - $u_5 = u_4 + u_3 = 3 + 2 = 5$
      - $u_6 = u_5 + u_4 = 5 + 3 = 8$
      - $u_7 = u_6 + u_5 = 8 + 5 = 13$
      - $u_8 = u_7 + u_6 = 13 + 8 = 21$
      - $u_9 = u_8 + u_7 = 21 + 13 = 34$
      - $u_(10) = u_9 + u_8 = 34 + 21 = 55$
      - $u_(11) = u_(10) + u_9 = 55 + 34 = 89$
      - $u_(12) = u_(11) + u_(10) = 89 + 55 = 144$.
      Vậy ở tháng thứ $12$, trang trại có tất cả $144$ cặp thỏ.

      #nhanxet[Dãy số Fibonacci là mô hình kinh điển để mô tả sự phát triển quần thể sinh vật trong điều kiện không bị giới hạn về không gian sống và thức ăn.]
      
      Đáp số: *144*.
    ]
  )

  // Question 6
  #tln(
    [Có bao nhiêu giá trị nguyên của tham số $m$ để hàm số bậc ba $y = -1/3 x^3 + m x^2 - (2m + 3) x + 5$ nghịch biến trên $RR$?],
    [5],
    loigiai: [
      #ppgiai[
        - Tính đạo hàm $y'$.
        - Hàm số nghịch biến trên $RR$ khi và chỉ khi đạo hàm $y' <= 0$ với mọi $x in RR$ và dấu đẳng thức xảy ra tại hữu hạn điểm.
        - Với tam thức bậc hai $A x^2 + B x + C <= 0, forall x in RR$, ta cần có $A < 0$ và $Delta' <= 0$.
      ]
      Đạo hàm của hàm số đã cho là:
      $
        y' = -x^2 + 2m x - (2m + 3).
      $
      Để hàm số nghịch biến trên $RR$, điều kiện cần và đủ là:
      $
        y' <= 0, quad forall x in RR.
      $
      Vì hệ số của $x^2$ là $-1 < 0$ nên điều kiện tương đương là biệt thức thu gọn của $y'$ thỏa mãn:
      $
        Delta' <= 0 <=> m^2 - (-1) dot [-(2m + 3)] <= 0
      $
      $
        <=> m^2 - (2m + 3) <= 0 <=> m^2 - 2m - 3 <= 0
      $
      $
        <=> (m + 1)(m - 3) <= 0 <=> -1 <= m <= 3.
      $
      Vì $m$ là số nguyên nên $m$ chỉ có thể nhận các giá trị:
      $
        m in {-1; 0; 1; 2; 3}.
      $
      Vậy có tất cả $5$ giá trị nguyên của tham số $m$ thỏa mãn yêu cầu bài toán.
      
      Đáp số: *5*.
    ]
  )
]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
