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
  school: "ĐỀ THI THỬ LẦN 7",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 7)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "704",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  // Question 1
  #tn(
    [Tập xác định $D$ của hàm số $y = (x - 2)^(-3) + log_3 (5 - x)$ là],
    (
      [$D = (-oo; 5)$.],
      [$D = (2; 5)$.],
      True([$D = (-oo; 5) setminus {2}$.]),
      [$D = (2; +oo)$.],
    ),
    loigiai: [
      #ppgiai[
        - Hàm số lũy thừa $y = [u(x)]^alpha$ với $alpha$ là số nguyên âm xác định khi $u(x) != 0$.
        - Hàm số logarit $y = log_a u(x)$ xác định khi $u(x) > 0$.
      ]
      Điều kiện xác định của hàm số là:
      $
        cases(x - 2 != 0, 5 - x > 0) <=> cases(x != 2, x < 5).
      $
      Vậy tập xác định của hàm số là $D = (-oo; 5) setminus {2}$.

      Chọn đáp án *C*.
    ]
  )

  // Question 2
  #tn(
    [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = (x - 1)^2 (x^2 - 4)(x + 3)$. Số điểm cực trị của hàm số đã cho là],
    (
      [$1$.],
      [$2$.],
      True([$3$.]),
      [$4$.],
    ),
    loigiai: [
      #ppgiai[
        Điểm cực trị của hàm số là các nghiệm đơn hoặc nghiệm bội lẻ của phương trình đạo hàm $f'(x) = 0$.
      ]
      Xét phương trình $f'(x) = 0$:
      $
        (x - 1)^2 (x^2 - 4)(x + 3) = 0 <=> (x - 1)^2 (x - 2)(x + 2)(x + 3) = 0
      $
      $
        <=> cases(x = 1 "(nghiệm bội chẵn)", x = 2 "(nghiệm đơn)", x = -2 "(nghiệm đơn)", x = -3 "(nghiệm đơn)").
      $
      Đạo hàm $f'(x)$ đổi dấu khi đi qua các điểm $x = 2$, $x = -2$, và $x = -3$. Qua điểm $x = 1$, đạo hàm không đổi dấu.
      Do đó, hàm số đã cho có đúng $3$ điểm cực trị.

      Chọn đáp án *C*.
    ]
  )

  // Question 3
  #tn(
    [Trong không gian $O x y z$, cho hai điểm $A(2; -1; 3)$ và $B(4; 3; -1)$. Tọa độ trung điểm $M$ của đoạn thẳng $A B$ là],
    (
      True([$M(3; 1; 1)$.]),
      [$M(6; 2; 2)$.],
      [$M(1; 2; -2)$.],
      [$M(3; 2; 1)$.],
    ),
    loigiai: [
      #ppgiai[
        Tọa độ trung điểm $M$ của đoạn thẳng $A B$ có công thức:
        $x_M = (x_A + x_B)/2$, $y_M = (y_A + y_B)/2$, $z_M = (z_A + z_B)/2$.
      ]
      Áp dụng công thức, ta có:
      - $x_M = (2 + 4)/2 = 3$.
      - $y_M = (-1 + 3)/2 = 1$.
      - $z_M = (3 + (-1))/2 = 1$.
      Vậy $M(3; 1; 1)$.

      Chọn đáp án *A*.
    ]
  )

  // Question 4
  #tn(
    [Trong không gian $O x y z$, phương trình mặt cầu $(S)$ có tâm $I(1; -2; 0)$ và bán kính $R = 3$ là],
    (
      True([$(x - 1)^2 + (y + 2)^2 + z^2 = 9$.]),
      [$(x - 1)^2 + (y - 2)^2 + z^2 = 9$.],
      [$(x + 1)^2 + (y - 2)^2 + z^2 = 3$.],
      [$(x - 1)^2 + (y + 2)^2 + z^2 = 3$.],
    ),
    loigiai: [
      #ppgiai[
        Phương trình mặt cầu có tâm $I(a; b; c)$ và bán kính $R$ là:
        $(x-a)^2 + (y-b)^2 + (z-c)^2 = R^2$.
      ]
      Thay tọa độ tâm $I(1; -2; 0)$ và bán kính $R = 3$ vào công thức ta được:
      $
        (x - 1)^2 + (y - (-2))^2 + (z - 0)^2 = 3^2 <=> (x - 1)^2 + (y + 2)^2 + z^2 = 9.
      $

      Chọn đáp án *A*.
    ]
  )

  // Question 5
  #tn(
    [Cho cấp số nhân $(u_n)$ có số hạng đầu $u_1 = 2$ và công bội $q = -3$. Giá trị của số hạng $u_4$ bằng],
    (
      True([$-54$.]),
      [$54$.],
      [$-162$.],
      [$18$.],
    ),
    loigiai: [
      #ppgiai[
        Công thức số hạng tổng quát của cấp số nhân là $u_n = u_1 q^(n-1)$.
      ]
      Áp dụng công thức với $n = 4$:
      $
        u_4 = u_1 q^3 = 2 dot (-3)^3 = 2 dot (-27) = -54.
      $

      Chọn đáp án *A*.
    ]
  )

  // Question 6
  #tn(
    [Họ nguyên hàm của hàm số $f(x) = x e^(x^2)$ là],
    (
      True([$1/2 e^(x^2) + C$.]),
      [$e^(x^2) + C$.],
      [$2 e^(x^2) + C$.],
      [$1/2 x^2 e^(x^2) + C$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng phương pháp đổi biến số bằng cách đặt $u = x^2$.
      ]
      Đặt $u = x^2 => dif u = 2x dif x => x dif x = 1/2 dif u$.
      Khi đó:
      $
        integral x e^(x^2) dif x = integral e^u dot 1/2 dif u = 1/2 e^u + C = 1/2 e^(x^2) + C.
      $

      Chọn đáp án *A*.
    ]
  )

  // Question 7
  #tn(
    [Khảo sát độ tuổi của một nhóm khách du lịch, ta thu được bảng số liệu ghép nhóm dưới đây:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Độ tuổi (năm)], [$[20; 30)$], [$[30; 40)$], [$[40; 50)$], [$[50; 60)$], [$[60; 70]$],
          [Số khách], [5], [12], [18], [10], [5],
        )
      ]
      Nhóm chứa mốt của mẫu số liệu ghép nhóm này là],
    (
      True([$[40; 50)$.]),
      [$[30; 40)$.],
      [$[50; 60)$.],
      [$[20; 30)$.],
    ),
    loigiai: [
      #ppgiai[
        Nhóm chứa mốt của mẫu số liệu ghép nhóm là nhóm có tần số lớn nhất.
      ]
      Nhìn vào bảng tần số, ta thấy tần số lớn nhất là $18$, tương ứng với nhóm tuổi $[40; 50)$.
      Vậy nhóm chứa mốt là $[40; 50)$.

      Chọn đáp án *A*.
    ]
  )

  // Question 8
  #tn(
    [Một hộp chứa $6$ quả cầu đỏ và $4$ quả cầu xanh có kích thước giống nhau. Chọn ngẫu nhiên đồng thời $2$ quả cầu từ hộp. Xác suất để chọn được $2$ quả cầu khác màu bằng],
    (
      True([$8/15$.]),
      [$7/15$.],
      [$2/3$.],
      [$4/15$.],
    ),
    loigiai: [
      #ppgiai[
        - Số phần tử của không gian mẫu là số cách chọn $2$ quả cầu bất kỳ từ $10$ quả cầu.
        - Số kết quả thuận lợi là số cách chọn $1$ quả cầu đỏ và $1$ quả cầu xanh.
      ]
      - Số cách chọn $2$ quả từ $10$ quả trong hộp là:
        $
          n(Omega) = C(10, 2) = (10 dot 9)/2 = 45.
        $
      - Gọi $A$ là biến cố "Chọn được 2 quả cầu khác màu" (tức là 1 đỏ và 1 xanh). Số cách chọn là:
        $
          n(A) = C(6, 1) dot C(4, 1) = 6 dot 4 = 24.
        $
      - Xác suất của biến cố $A$ là:
        $
          P(A) = (n(A)) / (n(Omega)) = 24 / 45 = 8 / 15.
        $

      Chọn đáp án *A*.
    ]
  )

  // Question 9
  #tn(
    [Đường cong trong hình vẽ bên là đồ thị của hàm số nào dưới đây?],
    (
      True([$y = -x^3 + 3x$.]),
      [$y = x^3 - 3x$.],
      [$y = -x^3 + 3x^2$.],
      [$y = x^3 - 3x^2$.],
    ),
    fig: cetz.canvas(length: 0.6cm, {
      import cetz.draw: *

      line((-2.5, 0), (2.5, 0), mark: (end: ">"))
      content((2.5, 0.35), $x$)
      line((0, -3), (0, 3.5), mark: (end: ">"))
      content((0.3, 3.5), $y$)
      content((-0.25, -0.25), $O$)

      line((-1, 0.1), (-1, -0.1))
      content((-1, -0.4), $-1$)
      line((1, 0.1), (1, -0.1))
      content((1, -0.4), $1$)

      line((0.1, 2), (-0.1, 2))
      content((-0.4, 2), $2$)
      line((0.1, -2), (-0.1, -2))
      content((-0.4, -2), $-2$)

      let pts = ()
      for i in range(-35, 36) {
        let x = i / 20.0
        let y = - x * x * x + 3 * x
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + blue)
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        - Dáng điệu đồ thị: Nhánh cuối cùng đi xuống khi $x -> +oo$, do đó hệ số của bậc cao nhất $a < 0$. Điều này loại các phương án B và D.
        - Đồ thị đối xứng qua gốc tọa độ $O(0;0)$, nên đây là đồ thị của hàm số lẻ $y = -x^3 + 3x$.
        - Ngoài ra, đồ thị có cực đại tại $(1; 2)$ và cực tiểu tại $(-1; -2)$, khớp hoàn toàn với phương án A.
      ]
      Vậy chọn đáp án *A*.
    ]
  )

  // Question 10
  #tn(
    [Trong không gian $O x y z$, khoảng cách từ điểm $A(1; -1; 2)$ đến mặt phẳng $(P): 2x - 2y - z + 4 = 0$ bằng],
    (
      True([$2$.]),
      [$3$.],
      [$4$.],
      [$1$.],
    ),
    loigiai: [
      #ppgiai[
        Khoảng cách từ điểm $M(x_0; y_0; z_0)$ đến mặt phẳng $(P): A x + B y + C z + D = 0$ được tính bằng:
        $d(M, (P)) = (|A x_0 + B y_0 + C z_0 + D|) / (sqrt(A^2 + B^2 + C^2))$.
      ]
      Thay tọa độ $A(1; -1; 2)$ và phương trình mặt phẳng $(P)$ vào công thức:
      $
        d(A, (P)) = (|2 dot 1 - 2 dot (-1) - 2 + 4|) / (sqrt(2^2 + (-2)^2 + (-1)^2)) = (|2 + 2 - 2 + 4|) / (sqrt(4 + 4 + 1)) = 6 / 3 = 2.
      $

      Chọn đáp án *A*.
    ]
  )

  // Question 11
  #tn(
    [Một hình trụ có bán kính đáy $r = 3$ và chiều cao $h = 5$. Diện tích xung quanh $S_(x q)$ của hình trụ bằng],
    (
      True([$30 pi$.]),
      [$15 pi$.],
      [$45 pi$.],
      [$20 pi$.],
    ),
    loigiai: [
      #ppgiai[
        Diện tích xung quanh của hình trụ có công thức $S_(x q) = 2 pi r h$.
      ]
      Thay số liệu $r = 3, h = 5$ vào công thức:
      $
        S_(x q) = 2 pi dot 3 dot 5 = 30 pi.
      $

      Chọn đáp án *A*.
    ]
  )

  // Question 12
  #tn(
    [Nghiệm của phương trình $log_2 (x - 3) = 3$ là],
    (
      True([$x = 11$.]),
      [$x = 9$.],
      [$x = 12$.],
      [$x = 6$.],
    ),
    loigiai: [
      #ppgiai[
        Phương trình $log_a u(x) = b$ có nghiệm khi $u(x) = a^b$.
      ]
      Điều kiện xác định: $x - 3 > 0 <=> x > 3$.
      Phương trình tương đương với:
      $
        x - 3 = 2^3 <=> x - 3 = 8 <=> x = 11 " (thỏa mãn)".
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
    [Cho hàm số $y = f(x)$ xác định và liên tục trên $RR$. Đồ thị của hàm số đạo hàm $y = f'(x)$ được cho ở hình vẽ bên dưới.],
    (
      True([Hàm số $y = f(x)$ đồng biến trên khoảng $(-2; 1)$ và $(3; +oo)$.]),
      True([Hàm số $y = f(x)$ nghịch biến trên khoảng $(1; 3)$.]),
      [Điểm cực tiểu của đồ thị hàm số $y = f(x)$ là $x = 1$.],
      True([Hàm số $g(x) = f(2 - x)$ đồng biến trên khoảng $(-1; 1)$.]),
    ),
    fig: cetz.canvas(length: 0.65cm, {
      import cetz.draw: *

      // Hệ trục tọa độ
      line((-3.5, 0), (5.0, 0), mark: (end: ">"))
      content((5.0, 0.35), $x$)
      line((0, -2.0), (0, 5.0), mark: (end: ">"))
      content((0.3, 5.0), $y$)
      content((-0.25, -0.25), $O$)

      // Các điểm vạch dấu trên Ox
      line((-2, 0.1), (-2, -0.1))
      content((-2, -0.4), $-2$)
      line((1, 0.1), (1, -0.1))
      content((1, -0.4), $1$)
      line((3, 0.1), (3, -0.1))
      content((3, -0.4), $3$)

      // Vẽ đồ thị y = f'(x)
      let pts = ()
      for i in range(-25, 42) {
        let x = i / 10.0
        let y = 0.25 * (x + 2) * (x - 1) * (x - 3)
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + blue)
      content((3.8, 3.8), $y = f'(x)$, style: (fill: blue))
    }),
    fig-pos: "right",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        - Hàm số đồng biến trên các khoảng mà $f'(x) > 0$ (phần đồ thị nằm phía trên trục hoành).
        - Hàm số nghịch biến trên các khoảng mà $f'(x) < 0$ (phần đồ thị nằm phía dưới trục hoành).
        - Điểm cực trị là điểm mà tại đó đạo hàm đổi dấu.
        - Khảo sát sự biến thiên của hàm hợp $g(x) = f(u(x))$ thông qua đạo hàm $g'(x) = u'(x) f'(u(x))$.
      ]
      Dựa vào đồ thị hàm số đạo hàm $y = f'(x)$, ta thấy:
      - $f'(x) > 0$ trên các khoảng $(-2; 1)$ và $(3; +oo)$.
      - $f'(x) < 0$ trên các khoảng $(-oo; -2)$ và $(1; 3)$.

      *a)* Hàm số $y = f(x)$ đồng biến trên khoảng $(-2; 1)$ và $(3; +oo)$ do $f'(x) > 0$ trên các khoảng này. Mệnh đề a *ĐÚNG*.

      *b)* Hàm số $y = f(x)$ nghịch biến trên khoảng $(1; 3)$ do $f'(x) < 0$ trên khoảng này. Mệnh đề b *ĐÚNG*.

      *c)* Tại $x = 1$, đạo hàm $f'(x)$ đổi dấu từ dương sang âm khi đi qua điểm này, nên $x = 1$ là điểm cực đại của hàm số, không phải điểm cực tiểu. Mệnh đề c *SAI*.

      *d)* Xét hàm số $g(x) = f(2 - x)$.
      Đạo hàm:
      $
        g'(x) = (2 - x)' dot f'(2 - x) = - f'(2 - x).
      $
      Để hàm số đồng biến, ta cần $g'(x) >= 0 <=> - f'(2 - x) >= 0 <=> f'(2 - x) <= 0$.
      Dựa vào đồ thị, $f'(u) <= 0$ khi $u in (-oo; -2]$ hoặc $u in [1; 3]$.
      Do đó:
      $
        hoac(2 - x <= -2, 1 <= 2 - x <= 3) <=> hoac(x >= 4, -1 <= x <= 1).
      $
      Như vậy, hàm số $g(x)$ đồng biến trên đoạn $[-1; 1]$. Suy ra hàm số đồng biến trên khoảng $(-1; 1)$. Mệnh đề d *ĐÚNG*.
    ]
  )

  // Question 2
  #ds(
    [Trong không gian tọa độ $O x y z$ (đơn vị đo là mét), một dàn khung thép của mái nhà được thiết kế có dạng hình lăng trụ đứng tam giác $A_1 B_1 C_1 . A_2 B_2 C_2$ như hình vẽ bên dưới. Các đỉnh của dàn khung được xác định tọa độ: $A_1(-3; 0; 0)$, $B_1(3; 0; 0)$, $C_1(0; 0; 4)$, $A_2(-3; 8; 0)$, $B_2(3; 8; 0)$, và $C_2(0; 8; 4)$. Gọi mặt mái chứa mặt phẳng đi qua bốn điểm $A_1$, $C_1$, $C_2$, $A_2$ là mặt phẳng mái thứ nhất, và mặt đi qua $B_1$, $C_1$, $C_2$, $B_2$ là mặt phẳng mái thứ hai.],
    (
      True([Một vectơ pháp tuyến của mặt phẳng chứa mái thứ nhất $(A_1 C_1 C_2 A_2)$ là $vect(n) = (4; 0; -3)$.]),
      True([Độ dài của thanh kèo dọc kết nối hai đỉnh mái $C_1 C_2$ bằng $8$ m.]),
      [Thanh chống nối từ trung điểm $H$ của $A_1 B_1$ đến trung điểm $N$ của thanh kèo $A_1 C_1$ có độ dài bằng $3.5$ m.],
      True([Góc giữa hai mặt phẳng mái thứ nhất và thứ hai (làm tròn đến hàng đơn vị) bằng $74^circ$.]),
    ),
    fig: cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      
      // Hàm chiếu 3D -> 2D
      let p(x, y, z) = (x + 0.45 * y, z + 0.35 * y)
      
      // Các đỉnh
      let A1 = p(-3, 0, 0)
      let B1 = p(3, 0, 0)
      let C1 = p(0, 0, 4)
      let A2 = p(-3, 8, 0)
      let B2 = p(3, 8, 0)
      let C2 = p(0, 8, 4)
      
      // Trung điểm
      let H = p(0, 0, 0)
      let N = p(-1.5, 0, 2)
      
      // Mặt sau (nét đứt)
      line(A2, B2, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
      line(B2, C2, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
      line(C2, A2, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
      line(A1, A2, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
      
      // Mặt trước và các dầm biên (nét liền)
      line(A1, B1, stroke: 1.2pt + black)
      line(B1, C1, stroke: 1.2pt + black)
      line(C1, A1, stroke: 1.2pt + black)
      line(B1, B2, stroke: 1.2pt + black)
      line(C1, C2, stroke: 1.2pt + black)
      
      // Thanh chống HN
      line(H, N, stroke: 1.2pt + red)
      
      // Vẽ các nút tròn
      circle(A1, radius: 0.05, fill: black)
      circle(B1, radius: 0.05, fill: black)
      circle(C1, radius: 0.05, fill: black)
      circle(A2, radius: 0.05, fill: gray)
      circle(B2, radius: 0.05, fill: gray)
      circle(C2, radius: 0.05, fill: gray)
      circle(H, radius: 0.04, fill: red)
      circle(N, radius: 0.04, fill: red)
      
      // Tên nhãn điểm
      content(A1, $A_1$, anchor: "north-east")
      content(B1, $B_1$, anchor: "north-west")
      content(C1, $C_1$, anchor: "south")
      content(A2, $A_2$, anchor: "south-east")
      content(B2, $B_2$, anchor: "north-west")
      content(C2, $C_2$, anchor: "south")
      content(H, $H$, anchor: "north")
      content(N, $N$, anchor: "east")
    }),
    fig-pos: "right",
    fig-width: 45%,
    loigiai: [
      #ppgiai[
        - Viết vectơ pháp tuyến của mặt phẳng bằng cách tính tích có hướng của hai vectơ không cùng phương nằm trong mặt phẳng đó.
        - Độ dài đoạn thẳng $P Q$ bằng độ dài vectơ $vect(P Q)$.
        - Xác định trung điểm bằng trung bình cộng tọa độ các điểm đầu mút.
        - Góc giữa hai mặt phẳng có cosin bằng trị tuyệt đối cosin của góc giữa hai vectơ pháp tuyến.
      ]
      *a)* Mặt phẳng mái thứ nhất $(A_1 C_1 C_2 A_2)$ chứa điểm $A_1(-3; 0; 0)$, $C_1(0; 0; 4)$ và $C_2(0; 8; 4)$.
      Ta có:
      - $vect(A_1 C_1) = (3; 0; 4)$.
      - $vect(C_1 C_2) = (0; 8; 0)$.
      Một vectơ pháp tuyến của mặt phẳng này là:
      $
        vect(n_1) = ( [vect(A_1 C_1), vect(C_1 C_2)] ) / 8 = ( (-32; 0; 24) ) / 8 = (-4; 0; 3).
      $
      Ta cũng có thể chọn vectơ cùng phương ngược hướng là $vect(n) = (4; 0; -3)$. Mệnh đề a *ĐÚNG*.

      *b)* Ta có $C_1(0; 0; 4)$ và $C_2(0; 8; 4)$, do đó:
      $
        C_1 C_2 = sqrt((0 - 0)^2 + (8 - 0)^2 + (4 - 4)^2) = 8 " (m)".
      $
      Mệnh đề b *ĐÚNG*.

      *c)* Điểm $H$ là trung điểm của $A_1 B_1$ nên có tọa độ:
      $
        H = ( (-3+3)/2; (0+0)/2; (0+0)/2 ) = (0; 0; 0).
      $
      Điểm $N$ là trung điểm của $A_1 C_1$ nên có tọa độ:
      $
        N = ( (-3+0)/2; (0+0)/2; (0+4)/2 ) = (-1.5; 0; 2).
      $
      Độ dài thanh chống $H N$ là:
      $
        H N = sqrt((-1.5 - 0)^2 + (0 - 0)^2 + (2 - 0)^2) = sqrt(2.25 + 4) = sqrt(6.25) = 2.5 " (m)".
      $
      Vì $2.5 != 3.5$ nên mệnh đề c *SAI*.

      *d)* Mặt phẳng mái thứ hai $(B_1 C_1 C_2 B_2)$ chứa $B_1(3; 0; 0)$, $C_1(0; 0; 4)$ và $C_2(0; 8; 4)$.
      Ta có:
      - $vect(B_1 C_1) = (-3; 0; 4)$.
      - $vect(C_1 C_2) = (0; 8; 0)$.
      Một vectơ pháp tuyến của mặt phẳng này là:
      $
        vect(n_2) = ( [vect(B_1 C_1), vect(C_1 C_2)] ) / 8 = ( (-32; 0; -24) ) / 8 = (-4; 0; -3).
      $
      Ta chọn vectơ pháp tuyến của mặt mái thứ hai là $vect(n'_2) = (4; 0; 3)$.
      Gọi $theta$ là góc giữa hai mặt phẳng mái. Ta có:
      $
        cos theta = (|vect(n_1) dot vect(n'_2)|) / (|vect(n_1)| dot |vect(n'_2)|) = (|(4) dot (4) + 0 + (-3) dot (3)|) / (sqrt(4^2 + 0^2 + (-3)^2) dot sqrt(4^2 + 0^2 + 3^2)) = (|16 - 9|) / (5 dot 5) = 7 / 25 = 0.28.
      $
      Suy ra $theta = arccos(0.28) approx 73.74^circ approx 74^circ$ (làm tròn đến hàng đơn vị). Mệnh đề d *ĐÚNG*.
    ]
  )

  // Question 3
  #ds(
    [Một nhóm học sinh lớp 12 tham gia đợt thi chạy $100$ mét để đánh giá thể lực. Thời gian chạy (giây) của các học sinh được ghi nhận và ghép nhóm dưới bảng sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian (giây)], [$[10,0; 10,5)$], [$[10,5; 11,0)$], [$[11,0; 11,5)$], [$[11,5; 12,0)$], [$[12,0; 12,5]$],
          [Số học sinh], [4], [10], [16], [8], [2],
        )
      ]
    ],
    (
      True([Tổng số học sinh tham gia kiểm tra chạy là $40$ học sinh.]),
      True([Thời gian chạy trung bình của các học sinh là $11,175$ giây.]),
      True([Trung vị của mẫu số liệu ghép nhóm trên bằng $11,1875$ giây.]),
      [Phương sai của mẫu số liệu ghép nhóm trên nhỏ hơn $0,2$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính cỡ mẫu $n$.
        - Xác định các giá trị đại diện $x_i$ của mỗi nhóm là trung bình cộng hai đầu mút.
        - Điểm trung bình: $bar(x) = 1/n sum n_i x_i$.
        - Trung vị: $M_e = L + (n/2 - C F_(p r e v))/f_m dot h$.
        - Phương sai: $s^2 = 1/n sum n_i x_i^2 - bar(x)^2$.
      ]
      *a)* Tổng số học sinh tham gia chạy (cỡ mẫu) là:
      $
        n = 4 + 10 + 16 + 8 + 2 = 40 " (học sinh)".
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Giá trị đại diện của từng nhóm lần lượt là:
      - Nhóm $[10,0; 10,5)$ có $x_1 = 10,25$, tần số $n_1 = 4$.
      - Nhóm $[10,5; 11,0)$ có $x_2 = 10,75$, tần số $n_2 = 10$.
      - Nhóm $[11,0; 11,5)$ có $x_3 = 11,25$, tần số $n_3 = 16$.
      - Nhóm $[11,5; 12,0)$ có $x_4 = 11,75$, tần số $n_4 = 8$.
      - Nhóm $[12,0; 12,5]$ có $x_5 = 12,25$, tần số $n_5 = 2$.

      Thời gian chạy trung bình:
      $
        bar(x) = (4 dot 10,25 + 10 dot 10,75 + 16 dot 11,25 + 8 dot 11,75 + 2 dot 12,25) / 40
      $
      $
        = (41 + 107,5 + 180 + 94 + 24,5) / 40 = 447 / 40 = 11,175 " (giây)".
      $
      Mệnh đề b *ĐÚNG*.

      *c)* Vị trí của trung vị là thứ $n/2 = 20$.
      - Tích lũy nhóm 1: $4$.
      - Tích lũy nhóm 2: $4 + 10 = 14$.
      - Tích lũy nhóm 3: $14 + 16 = 30$.
      Vì thế nhóm chứa trung vị là nhóm thứ ba $[11,0; 11,5)$.
      Áp dụng công thức tính trung vị:
      - Cận dưới: $L = 11,0$.
      - Độ rộng nhóm: $h = 0,5$.
      - Tần số tích lũy trước đó: $C F_(p r e v) = 14$.
      - Tần số nhóm chứa trung vị: $f_m = 16$.
      $
        M_e = 11,0 + (20 - 14)/16 dot 0,5 = 11,0 + 6/16 dot 0,5 = 11,0 + 0,1875 = 11,1875 " (giây)".
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Tính phương sai của mẫu số liệu:
      $
        s^2 = 1/40 dot [4 dot 10,25^2 + 10 dot 10,75^2 + 16 dot 11,25^2 + 8 dot 11,75^2 + 2 dot 12,25^2] - bar(x)^2
      $
      $
        = 1/40 dot [4 dot 105,0625 + 10 dot 115,5625 + 16 dot 126,5625 + 8 dot 138,0625 + 2 dot 150,0625] - (11,175)^2
      $
      $
        = 1/40 dot [420,25 + 1155,625 + 2025 + 1104,5 + 300,125] - 124,880625
      $
      $
        = 5005,5 / 40 - 124,880625 = 125,1375 - 124,880625 = 0,256875.
      $
      Vì phương sai $s^2 = 0,256875 > 0,2$ nên mệnh đề d *SAI*.
    ]
  )

  // Question 4
  #ds(
    [Trong một trận chung kết giải quần vợt (tennis), hai vận động viên A và B thi đấu theo thể thức "ai thắng trước $2$ sét thì thắng chung cuộc" (tối đa $3$ sét). Vận động viên thắng sét đầu tiên sẽ có lợi thế tâm lý lớn: nếu A thắng sét thứ nhất, xác suất A tiếp tục thắng sét thứ hai là $0,7$; ngược lại nếu A thua sét thứ nhất, xác suất A thắng sét thứ hai chỉ còn $0,4$. Quy luật này cũng đúng cho sét thứ ba (nếu có): xác suất A thắng sét tiếp theo là $0,7$ nếu A vừa thắng sét trước đó, và là $0,4$ nếu A vừa thua sét trước đó. Biết rằng xác suất A thắng sét thứ nhất là $0,6$.],
    (
      True([Xác suất để trận đấu kết thúc sau đúng $2$ sét đấu là $0,66$.]),
      True([Xác suất để vận động viên A giành chiến thắng chung cuộc là $0,604$.]),
      [Xác suất để trận đấu phải kéo dài sang sét thứ $3$ và vận động viên B thắng chung cuộc là $0,186$.],
      True([Biết rằng vận động viên A đã thắng chung cuộc, xác suất để A thắng ở sét đấu đầu tiên là $123/151$.]),
    ),
    loigiai: [
      #ppgiai[
        - Vẽ sơ đồ cây biểu diễn các khả năng thắng sét 1, sét 2, và sét 3 của A và B.
        - Vận động viên nào thắng 2 sét trước sẽ thắng chung cuộc. Các kịch bản thắng chung cuộc của A là: (Thắng-Thắng), (Thắng-Thua-Thắng), (Thua-Thắng-Thắng).
        - Sử dụng công thức xác suất đầy đủ và công thức xác suất có điều kiện Bayes.
      ]
      Ký hiệu $T$ là sét A thắng và $B$ là sét A thua (tức B thắng). Ta có các nhánh cây xác suất sau:
      - Nhánh 1: A thắng sét 1 ($0,6$):
        - Sét 2: A thắng ($0,7$) $=>$ A thắng chung cuộc 2-0. Xác suất: $P(T_1 T_2) = 0,6 dot 0,7 = 0,42$.
        - Sét 2: B thắng ($0,3$): Tỉ số là 1-1. Bước sang sét 3.
          - Sét 3: A thắng ($0,4$ do A vừa thua sét 2) $=>$ A thắng chung cuộc 2-1. Xác suất: $P(T_1 B_2 T_3) = 0,6 dot 0,3 dot 0,4 = 0,072$.
          - Sét 3: B thắng ($0,6$ do A vừa thua sét 2) $=>$ B thắng chung cuộc 2-1. Xác suất: $P(T_1 B_2 B_3) = 0,6 dot 0,3 dot 0,6 = 0,108$.
      - Nhánh 2: B thắng sét 1 ($0,4$):
        - Sét 2: B thắng ($0,6$ vì xác suất A thắng khi vừa thua là $0,4$) $=>$ B thắng chung cuộc 2-0. Xác suất: $P(B_1 B_2) = 0,4 dot 0,6 = 0,24$.
        - Sét 2: A thắng ($0,4$): Tỉ số là 1-1. Bước sang sét 3.
          - Sét 3: A thắng ($0,7$ do A vừa thắng sét 2) $=>$ A thắng chung cuộc 2-1. Xác suất: $P(B_1 T_2 T_3) = 0,4 dot 0,4 dot 0,7 = 0,112$.
          - Sét 3: B thắng ($0,3$ do A vừa thắng sét 2) $=>$ B thắng chung cuộc 2-1. Xác suất: $P(B_1 T_2 B_3) = 0,4 dot 0,4 dot 0,3 = 0,048$.

      *a)* Trận đấu kết thúc sau đúng 2 sét khi A thắng 2-0 hoặc B thắng 2-0.
      Xác suất là:
      $
        P("2 sét") = P(T_1 T_2) + P(B_1 B_2) = 0,42 + 0,24 = 0,66.
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Vận động viên A thắng chung cuộc trong các kịch bản: $T_1 T_2$, $T_1 B_2 T_3$, hoặc $B_1 T_2 T_3$.
      Xác suất A thắng chung cuộc là:
      $
        P(A) = 0,42 + 0,072 + 0,112 = 0,604.
      $
      Mệnh đề b *ĐÚNG*.

      *c)* Trận đấu bước sang sét 3 và B thắng chung cuộc trong các kịch bản: $T_1 B_2 B_3$ hoặc $B_1 T_2 B_3$.
      Xác suất là:
      $
        P("sét 3 và B thắng") = 0,108 + 0,048 = 0,156.
      $
      Vì $0,156 != 0,186$ nên mệnh đề c *SAI*.

      *d)* Ta cần tính xác suất có điều kiện: xác suất A thắng sét đầu tiên khi biết A đã thắng chung cuộc.
      $
        P(T_1 | A) = (P(T_1 text("và A thắng"))) / (P(A)) = (P(T_1 T_2) + P(T_1 B_2 T_3)) / (P(A)) = (0,42 + 0,072) / (0,604) = (0,492) / (0,604) = 492 / 604 = 123 / 151.
      $
      Mệnh đề d *ĐÚNG*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  // Question 1
  #tln(
    [Theo dữ liệu lịch sử tại một vùng nông nghiệp, tỷ lệ ngày có mưa thực tế là $20%$. Cơ quan dự báo khí tượng dự kiến có độ chính xác như sau: vào ngày trời mưa thực tế, họ dự báo đúng trời mưa với xác suất $90%$; vào ngày trời nắng thực tế, họ dự báo đúng trời nắng với xác suất $85%$. Khi cơ quan khí tượng phát ra bản tin dự báo trời sẽ có mưa vào ngày mai, hãy tính xác suất (theo đơn vị phần trăm) để ngày mai trời thực sự có mưa.],
    [60],
    loigiai: [
      #ppgiai[
        - Gọi các biến cố liên quan đến thời tiết thực tế và bản tin dự báo.
        - Sử dụng công thức xác suất đầy đủ để tính xác suất bản tin dự báo trời mưa.
        - Áp dụng công thức Bayes để tính xác suất thực tế trời mưa khi nhận được bản tin dự báo mưa.
      ]
      Ký hiệu:
      - $M$ là biến cố "Ngày mai trời thực tế có mưa". Suy ra $P(M) = 20% = 0,2$.
      - $N$ là biến cố "Ngày mai trời thực tế không mưa (nắng)". Suy ra $P(N) = 1 - P(M) = 0,8$.
      - $D_M$ là biến cố "Cơ quan khí tượng dự báo ngày mai có mưa".

      Theo đề bài ta có các xác suất có điều kiện:
      - Xác suất dự báo đúng ngày mưa: $P(D_M | M) = 90% = 0,9$.
      - Xác suất dự báo sai ngày nắng thành mưa: $P(D_M | N) = 1 - 0,85 = 15% = 0,15$.

      Áp dụng công thức xác suất đầy đủ, xác suất để cơ quan khí tượng dự báo có mưa là:
      $
        P(D_M) = P(M) dot P(D_M | M) + P(N) dot P(D_M | N) = 0,2 dot 0,9 + 0,8 dot 0,15 = 0,18 + 0,12 = 0,3.
      $

      Xác suất để ngày mai thực tế có mưa khi biết dự báo là có mưa là:
      $
        P(M | D_M) = (P(M) dot P(D_M | M)) / (P(D_M)) = (0,2 dot 0,9) / 0,3 = 0,18 / 0,3 = 0,6 = 60%.
      $
      Vậy xác suất trời thực sự mưa khi có dự báo mưa là $60%$.

      Đáp số: *60*.
    ]
  )

  // Question 2
  #tln(
    [Một giàn khoan dầu ngoài khơi $A$ nằm cách bờ biển thẳng một khoảng bằng $6$ km. Trạm lọc dầu $B$ đặt trên bờ biển và cách hình chiếu vuông góc $H$ của $A$ trên bờ biển một khoảng bằng $15$ km. Người ta muốn lắp đặt đường ống dẫn dầu từ $A$ đến $B$ bằng cách nối một đường ống thẳng dưới nước từ $A$ đến điểm $C$ trên bờ biển, rồi sau đó dẫn tiếp đường ống dọc theo bờ biển từ $C$ đến $B$. Chi phí lắp đặt đường ống dưới nước là $5$ tỷ đồng/km và chi phí lắp đặt trên đất liền dọc theo bờ biển là $4$ tỷ đồng/km. Tìm khoảng cách (km) từ $H$ đến $C$ sao cho tổng chi phí lắp đặt toàn bộ đường ống dẫn dầu là nhỏ nhất.],
    [8],
    loigiai: [
      #ppgiai[
        - Đặt khoảng cách $H C = x$ (km) với $0 <= x <= 15$.
        - Biểu diễn độ dài đoạn dẫn dầu dưới nước $A C$ và trên bờ biển $B C$ theo $x$.
        - Lập hàm số biểu diễn tổng chi phí $C(x)$.
        - Dùng công cụ đạo hàm để tìm giá trị nhỏ nhất của hàm số trên đoạn $[0; 15]$.
      ]
      Đặt $H C = x$ (km) với $0 <= x <= 15$.
      - Khoảng cách đi dưới nước từ giàn khoan $A$ đến điểm $C$ trên bờ là:
        $
          A C = sqrt(A H^2 + H C^2) = sqrt(6^2 + x^2) = sqrt(x^2 + 36) " (km)".
        $
      - Khoảng cách đi trên đất liền từ $C$ đến trạm lọc dầu $B$ là:
        $
          C B = H B - H C = 15 - x " (km)".
        $
      Tổng chi phí lắp đặt đường ống (đơn vị: tỷ đồng) được cho bởi hàm số:
      $
        f(x) = 5 dot sqrt(x^2 + 36) + 4 dot (15 - x) = 5 sqrt(x^2 + 36) + 60 - 4x.
      $
      Xét đạo hàm của hàm số $f(x)$ trên khoảng $(0; 15)$:
      $
        f'(x) = 5 dot (x) / (sqrt(x^2 + 36)) - 4.
      $
      Cho đạo hàm $f'(x) = 0$:
      $
        5x / sqrt(x^2 + 36) = 4 <=> 5x = 4 sqrt(x^2 + 36)
      $
      $
        <=> 25x^2 = 16(x^2 + 36) <=> 9x^2 = 576 <=> x^2 = 64 => x = 8 " (km)" quad ("vì " x > 0).
      $
      So sánh các giá trị biên và điểm cực trị:
      - Tại đầu mút $x = 0$: $f(0) = 5 dot 6 + 60 = 90$ tỷ đồng.
      - Tại điểm $x = 8$: $f(8) = 5 dot sqrt(8^2 + 36) + 4 dot (15 - 8) = 5 dot 10 + 28 = 78$ tỷ đồng.
      - Tại đầu mút $x = 15$: $f(15) = 5 dot sqrt(15^2 + 36) approx 80,8$ tỷ đồng.

      Do đó, hàm số đạt giá trị nhỏ nhất tại $x = 8$.
      Khoảng cách từ $H$ đến $C$ để tổng chi phí nhỏ nhất là $8$ km.

      Đáp số: *8*.
    ]
  )

  // Question 3
  #tln(
    [Trong không gian tọa độ $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 - 2x - 4y - 6z + 3 = 0$ và đường thẳng $d: (x - 1)/1 = (y + 1)/2 = z/2$. Biết đường thẳng $d$ cắt mặt cầu $(S)$ tại hai điểm phân biệt $A$ và $B$. Tính độ dài đoạn thẳng $A B$.],
    [6],
    loigiai: [
      #ppgiai[
        - Cách 1: Chuyển đường thẳng về dạng tham số, thế vào phương trình mặt cầu giải tìm $t$ từ đó tìm tọa độ $A, B$ và tính độ dài đoạn $A B$.
        - Cách 2: Tìm tâm $I$ và bán kính $R$ của mặt cầu. Tính khoảng cách $d$ từ tâm $I$ đến đường thẳng. Áp dụng định lý Pythagore trong tam giác vuông: $A B = 2 sqrt(R^2 - d^2)$.
      ]
      *Cách 1: Giải tọa độ giao điểm*
      Phương trình tham số của đường thẳng $d$:
      $
        cases(x = 1 + t, y = -1 + 2t, z = 2t).
      $
      Thế tọa độ này vào phương trình mặt cầu $(S)$:
      $
        (1 + t)^2 + (-1 + 2t)^2 + (2t)^2 - 2(1 + t) - 4(-1 + 2t) - 6(2t) + 3 = 0
      $
      $
        <=> (t^2 + 2t + 1) + (4t^2 - 4t + 1) + 4t^2 - 2 - 2t + 4 - 8t - 12t + 3 = 0
      $
      $
        <=> 9t^2 - 24t + 7 = 0.
      $
      Giải phương trình bậc hai trên ta thu được biệt thức thu gọn $Delta' = 12^2 - 9 dot 7 = 144 - 63 = 81 = 9^2$.
      Phương trình có hai nghiệm $t_1 = (12 - 9)/9 = 1/3$ và $t_2 = (12 + 9)/9 = 7/3$.
      Hai giao điểm tương ứng là:
      - Với $t_1 = 1/3$: điểm $A(4/3; -1/3; 2/3)$.
      - Với $t_2 = 7/3$: điểm $B(10/3; 11/3; 14/3)$.

      Vectơ $vect(A B) = (6/3; 12/3; 12/3) = (2; 4; 4)$.
      Độ dài đoạn thẳng $A B$ là:
      $
        A B = |vect(A B)| = sqrt(2^2 + 4^2 + 4^2) = sqrt(4 + 16 + 16) = sqrt(36) = 6.
      $

      Đáp số: *6*.
    ]
  )

  // Question 4
  #tln(
    [Một cái bể chứa nước hình nón có đỉnh hướng thẳng đứng xuống dưới đáy, bán kính miệng bể $R = 4$ m và chiều cao $H = 12$ m. Người ta dùng vòi bơm nước vào bể. Tại thời điểm khi chiều cao cột nước đo được trong lòng bể bằng $6$ m thì tốc độ tăng của chiều cao mực nước đạt được là $0,5$ m/phút. Biết lưu lượng (tốc độ thể tích) nước bơm vào bể tại thời điểm đó có giá trị bằng $a pi$ $m^3$/phút. Tìm giá trị của tham số $a$.],
    [2],
    loigiai: [
      #ppgiai[
        - Biểu diễn bán kính mặt nước đáy nón nhỏ $r$ theo chiều cao cột nước $h$ nhờ định lý Thales trong mặt cắt đứng tam giác.
        - Viết biểu thức tính thể tích nước $V = 1/3 pi r^2 h$ theo biến số $h$.
        - Đạo hàm hai vế theo thời gian $t$ để liên kết tốc độ tăng thể tích $dif V / dif t$ và tốc độ tăng chiều cao $dif h / dif t$.
      ]
      Tại thời điểm cột nước trong bể có chiều cao $h$ và bán kính bề mặt nước là $r$, ta có tỉ số đồng dạng:
      $
        r / h = R / H = 4 / 12 = 1/3 => r = 1/3 h.
      $
      Thể tích của khối nước dạng nón trong bể là:
      $
        V = 1/3 pi r^2 h = 1/3 pi (1/3 h)^2 h = 1/27 pi h^3.
      $
      Đạo hàm hai vế theo thời gian $t$ để tìm tốc độ thay đổi thể tích:
      $
        (dif V) / (dif t) = (dif) / (dif t) [1/27 pi h^3] = 1/27 pi dot 3h^2 dot (dif h) / (dif t) = 1/9 pi h^2 dot (dif h) / (dif t).
      $
      Theo bài ra, tại thời điểm chiều cao cột nước $h = 6$ m thì tốc độ tăng chiều cao mực nước là $(dif h)/(dif t) = 0,5$ m/phút.
      Thay số vào biểu thức:
      $
        (dif V) / (dif t) = 1/9 pi dot 6^2 dot 0,5 = 36/9 pi dot 0,5 = 4 pi dot 0,5 = 2 pi " (m"^3"/phút)".
      $
      Do lưu lượng bơm bằng $a pi$ $m^3$/phút nên $a = 2$.

      Đáp số: *2*.
    ]
  )

  // Question 5
  #tln(
    [Một nghệ sĩ tạo hình vẽ một hình vuông lớn có cạnh bằng $12$ cm (gọi là hình vuông thứ 1). Từ trung điểm các cạnh của hình vuông này, tác giả nối lại để dựng được một hình vuông tiếp theo (gọi là hình vuông thứ 2). Cứ tiếp tục quá trình nối trung điểm các cạnh này một cách vô hạn lần như thế để nhận được các hình vuông nhỏ dần. Hãy tính tổng diện tích của tất cả các hình vuông thu được theo đơn vị xăng-ti-mét vuông ($c m^2$).],
    [288],
    loigiai: [
      #ppgiai[
        - Tính diện tích của hình vuông thứ nhất $S_1 = a^2$.
        - Nhận xét mối quan hệ diện tích giữa hai hình vuông liên tiếp. Khi nối trung điểm các cạnh của hình vuông cạnh $x$, ta được hình vuông mới có diện tích bằng đúng một nửa diện tích ban đầu.
        - Tổng diện tích là tổng của một cấp số nhân lùi vô hạn với công bội $q = 1/2$.
      ]
      - Diện tích hình vuông thứ nhất là:
        $
          S_1 = 12^2 = 144 " (cm"^2")".
        $
      - Khi nối các trung điểm của hình vuông thứ nhất, ta nhận được hình vuông thứ hai có độ dài cạnh là:
        $
          a_2 = sqrt((a/2)^2 + (a/2)^2) = a/sqrt(2) = 12/sqrt(2) " (cm)".
        $
        Diện tích hình vuông thứ hai là:
        $
          S_2 = a_2^2 = (12/sqrt(2))^2 = 72 " (cm"^2")" = 1/2 S_1.
        $
      - Bằng quy nạp, diện tích các hình vuông lập thành một cấp số nhân có số hạng đầu $S_1 = 144$ và công bội $q = 1/2$.
      Vì $|q| < 1$, đây là cấp số nhân lùi vô hạn. Tổng diện tích của tất cả các hình vuông thu được là:
      $
        S = S_1 + S_2 + S_3 + ... = S_1 / (1 - q) = 144 / (1 - 1/2) = 144 / (1/2) = 288 " (cm"^2")".
      $

      Đáp số: *288*.
    ]
  )

  // Question 6
  #tln(
    [Tìm giá trị của tham số thực $m$ để giá trị lớn nhất của hàm số $y = |x^2 - 4x + m|$ trên đoạn $[0; 3]$ đạt giá trị nhỏ nhất.],
    [2],
    loigiai: [
      #ppgiai[
        - Xét hàm số parabol $g(x) = x^2 - 4x$ trên đoạn $[0; 3]$.
        - Xác định giá trị cực đại và cực tiểu của $g(x)$ trên đoạn này để tìm miền giá trị.
        - Với $y = |g(x) + m|$, giá trị lớn nhất của nó trên đoạn $[0; 3]$ là $max \{ |m + max g(x)|, |m + min g(x)| \}$.
        - Tìm $m$ để giá trị lớn nhất này đạt giá trị nhỏ nhất (bài toán cực tiểu hóa giá trị lớn nhất).
      ]
      Xét hàm số $g(x) = x^2 - 4x$ trên đoạn $[0; 3]$.
      Đạo hàm:
      $
        g'(x) = 2x - 4 = 0 <=> x = 2 in [0; 3].
      $
      Ta tính các giá trị đặc biệt tại các điểm biên và điểm cực trị:
      - $g(0) = 0$.
      - $g(2) = 2^2 - 4 dot 2 = -4$.
      - $g(3) = 3^2 - 4 dot 3 = -3$.
      Do đó trên đoạn $[0; 3]$, tập giá trị của hàm số $g(x)$ là $[-4; 0]$.
      Suy ra tập giá trị của hàm số $f(x) = g(x) + m$ trên đoạn $[0; 3]$ là:
      $
        T = [m - 4; m].
      $
      Giá trị lớn nhất của hàm số $y = |f(x)|$ trên đoạn $[0; 3]$ là:
      $
        M(m) = max_([0; 3]) |x^2 - 4x + m| = max(|m - 4|, |m|).
      $
      Sử dụng bất đẳng thức trị tuyệt đối để đánh giá hoặc vẽ đồ thị:
      $
        M(m) = max(|m - 4|, |m|) >= (|m - 4| + |m|)/2 >= (|m - 4 - m|)/2 = 4/2 = 2.
      $
      Dấu đẳng thức xảy ra khi và chỉ khi:
      $
        |m - 4| = |m| <=> (m - 4)^2 = m^2 <=> -8m + 16 = 0 <=> m = 2.
      $
      Khi đó $M(2) = max(|-2|, |2|) = 2$.
      Vậy giá trị lớn nhất của hàm số $y = |x^2 - 4x + m|$ đạt giá trị nhỏ nhất bằng $2$ khi và chỉ khi $m = 2$.

      Đáp số: *2*.
    ]
  )
]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
