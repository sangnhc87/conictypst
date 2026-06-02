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
  school: "ĐỀ THI THỬ LẦN 4",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 4)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "401",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  // TN questions (1 to 12)
  #tn(
    [Cho hàm số $y = -x^3 + 3x^2 - 4$. Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
    (
      [$(-oo; 0)$.],
      True([$(0; 2)$.]),
      [$(2; +oo)$.],
      [$(-oo; 2)$.],
    ),
    loigiai: [
      #ppgiai[
        Tính đạo hàm của hàm số và xét dấu đạo hàm để tìm khoảng đồng biến.
      ]
      Ta có đạo hàm:
      $
        y' = -3x^2 + 6x = -3x(x - 2).
      $
      Cho $y' = 0 <=> x = 0$ hoặc $x = 2$.
      Bảng xét dấu đạo hàm cho thấy $y' > 0$ trên khoảng $(0; 2)$.
      Do đó, hàm số đồng biến trên khoảng $(0; 2)$.
      Vậy chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho hai vectơ $vect(a) = (1; 2; -1)$ và $vect(b) = (3; 0; 2)$. Tọa độ của vectơ $vect(u) = 2vect(a) - vect(b)$ là],
    (
      True([$vect(u) = (-1; 4; -4)$.]),
      [$vect(u) = (-1; 4; 0)$.],
      [$vect(u) = (5; 4; 0)$.],
      [$vect(u) = (5; 4; -4)$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng quy tắc nhân một số với vectơ và trừ hai vectơ theo tọa độ.
      ]
      Ta có:
      $
        2vect(a) = (2; 4; -2).
      $
      Suy ra:
      $
        vect(u) = 2vect(a) - vect(b) = (2 - 3; 4 - 0; -2 - 2) = (-1; 4; -4).
      $
      Vậy chọn đáp án *A*.
    ]
  )

  #tn(
    [Đường tiệm cận ngang của đồ thị hàm số $y = (2x - 1)/(x + 3)$ là đường thẳng],
    (
      True([$y = 2$.]),
      [$y = -3$.],
      [$x = -3$.],
      [$x = 2$.],
    ),
    loigiai: [
      #ppgiai[
        Đường tiệm cận ngang của đồ thị hàm số $y = (a x + b)/(c x + d)$ với $c != 0$ có phương trình là $y = a/c$.
      ]
      Ta có:
      $
        lim_(x -> +-oo) (2x - 1)/(x + 3) = 2.
      $
      Do đó đồ thị hàm số có tiệm cận ngang là đường thẳng $y = 2$.
      Vậy chọn đáp án *A*.
    ]
  )

  #tn(
    [Khảo sát chiều cao (đơn vị: cm) của một nhóm $20$ học sinh, ta thu được mẫu số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 5,
          align: center,
          stroke: 0.5pt + black,
          [Chiều cao (cm)], [$[150; 155)$], [$[155; 160)$], [$[160; 165)$], [$[165; 170)$],
          [Số học sinh], [4], [8], [6], [2],
        )
      ]
      Chiều cao trung bình của nhóm học sinh này bằng],
    (
      [$158,5$ cm.],
      True([$159,0$ cm.]),
      [$159,5$ cm.],
      [$160,0$ cm.],
    ),
    loigiai: [
      #ppgiai[
        Tính giá trị đại diện của từng nhóm, sau đó tính số trung bình theo công thức.
      ]
      Giá trị đại diện của các nhóm lần lượt là:
      $x_1 = 152,5$; $x_2 = 157,5$; $x_3 = 162,5$; $x_4 = 167,5$.
      Chiều cao trung bình là:
      $
        bar(x) = (4 dot 152,5 + 8 dot 157,5 + 6 dot 162,5 + 2 dot 167,5)/20 = (610 + 1260 + 975 + 335)/20 = 3180/20 = 159 " (cm)".
      $
      Vậy chọn đáp án *B*.
    ]
  )

  #tn(
    [Họ nguyên hàm của hàm số $f(x) = cos x - 2x$ là],
    (
      [$-sin x - x^2 + C$.],
      True([$sin x - x^2 + C$.]),
      [$sin x - 2 + C$.],
      [$-sin x - 2 + C$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng các công thức nguyên hàm cơ bản.
      ]
      Ta có:
      $
        integral (cos x - 2x) dif x = sin x - x^2 + C.
      $
      Vậy chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, mặt cầu $(S)$ có tâm $I(1; -2; 3)$ và bán kính $R = 5$ có phương trình là],
    (
      [$(x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 5$.],
      [$(x + 1)^2 + (y - 2)^2 + (z + 3)^2 = 25$.],
      True([$(x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 25$.]),
      [$(x + 1)^2 + (y - 2)^2 + (z + 3)^2 = 5$.],
    ),
    loigiai: [
      #ppgiai[
        Mặt cầu tâm $I(a; b; c)$ và bán kính $R$ có phương trình là $(x-a)^2 + (y-b)^2 + (z-c)^2 = R^2$.
      ]
      Thay tọa độ $I(1; -2; 3)$ và $R = 5$ vào công thức ta được:
      $
        (x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 25.
      $
      Vậy chọn đáp án *C*.
    ]
  )

  #tn(
    [Tập nghiệm của phương trình $log_3(x - 1) = 2$ là],
    (
      [${7}$.],
      [${9}$.],
      True([${10}$.]),
      [${11}$.],
    ),
    loigiai: [
      #ppgiai[
        Tìm điều kiện xác định rồi dùng định nghĩa lôgarit để giải.
      ]
      Điều kiện: $x - 1 > 0 <=> x > 1$.
      Phương trình tương đương:
      $
        x - 1 = 3^2 <=> x - 1 = 9 <=> x = 10 " (thỏa mãn)".
      $
      Vậy chọn đáp án *C*.
    ]
  )

  #tn(
    [Từ một hộp chứa $5$ quả cầu màu đỏ và $7$ quả cầu màu xanh có kích thước giống nhau, lấy ngẫu nhiên đồng thời $2$ quả cầu. Xác suất để lấy được $2$ quả cầu cùng màu đỏ là],
    (
      True([$5/33$.]),
      [$7/33$.],
      [$12/33$.],
      [$5/12$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng tổ hợp để tính số phần tử của không gian mẫu và số kết quả thuận lợi cho biến cố.
      ]
      Số phần tử của không gian mẫu (chọn 2 quả từ 12 quả):
      $
        n(Omega) = C_(12)^2 = 66.
      $
      Gọi $A$ là biến cố "lấy được 2 quả cầu cùng màu đỏ". Số kết quả thuận lợi cho $A$ là:
      $
        n(A) = C_5^2 = 10.
      $
      Xác suất của biến cố $A$ là:
      $
        P(A) = (n(A))/(n(Omega)) = 10/66 = 5/33.
      $
      Vậy chọn đáp án *A*.
    ]
  )

  #tn(
    [Nghiệm của phương trình lượng giác $cos x = 1$ là],
    (
      [$x = pi + k 2pi, k in ZZ$.],
      [$x = k pi, k in ZZ$.],
      True([$x = k 2pi, k in ZZ$.]),
      [$x = pi/2 + k pi, k in ZZ$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức nghiệm đặc biệt của phương trình lượng giác cơ bản.
      ]
      Phương trình $cos x = 1 <=> x = k 2pi, k in ZZ$.
      Vậy chọn đáp án *C*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, mặt phẳng đi qua điểm $M(1; 2; -3)$ và vuông góc với đường thẳng $d: (x - 1)/2 = (y + 1)/(-1) = (z - 2)/3$ có phương trình là],
    (
      [$2x - y + 3z - 9 = 0$.],
      True([$2x - y + 3z + 9 = 0$.]),
      [$2x + y + 3z + 9 = 0$.],
      [$2x - y - 3z + 9 = 0$.],
    ),
    loigiai: [
      #ppgiai[
        Mặt phẳng vuông góc với đường thẳng $d$ nên nhận vectơ chỉ phương của $d$ làm vectơ pháp tuyến.
      ]
      Đường thẳng $d$ có vectơ chỉ phương $vect(u) = (2; -1; 3)$.
      Mặt phẳng đi qua $M(1; 2; -3)$ và vuông góc với $d$ nhận $vect(n) = vect(u) = (2; -1; 3)$ làm vectơ pháp tuyến, có phương trình:
      $
        2(x - 1) - 1(y - 2) + 3(z + 3) = 0 <=> 2x - y + 3z + 9 = 0.
      $
      Vậy chọn đáp án *B*.
    ]
  )

  #tn(
    [Cho hình lập phương $A B C D . A' B' C' D'$. Góc giữa hai đường thẳng $A B$ và $A' C'$ bằng],
    (
      [$30^circ$.],
      True([$45^circ$.]),
      [$60^circ$.],
      [$90^circ$.],
    ),
    loigiai: [
      #ppgiai[
        Đưa góc giữa hai đường thẳng chéo nhau về góc giữa hai đường thẳng cắt nhau bằng cách tìm đường thẳng song song.
      ]
      Ta có $A' C' parallel A C$ (vì $A C C' A'$ là hình chữ nhật).
      Do đó:
      $
        (A B, A' C') = (A B, A C) = hat(B A C).
      $
      Vì $A B C D$ là hình vuông nên đường chéo $A C$ tạo với cạnh $A B$ một góc $hat(B A C) = 45^circ$.
      Vậy chọn đáp án *B*.
    ]
  )

  #tn(
    [Giá trị nhỏ nhất của hàm số $y = x^3 - 3x + 2$ trên đoạn $[0; 2]$ bằng],
    (
      [$2$.],
      True([$0$.]),
      [$-2$.],
      [$4$.],
    ),
    loigiai: [
      #ppgiai[
        Tìm các điểm cực trị thuộc đoạn $[0; 2]$, tính giá trị tại các điểm này và các đầu mút của đoạn để tìm giá trị nhỏ nhất.
      ]
      Xét hàm số trên $[0; 2]$, ta có đạo hàm:
      $
        y' = 3x^2 - 3 = 3(x - 1)(x + 1).
      $
      Cho $y' = 0 <=> x = 1$ hoặc $x = -1$.
      Chỉ có $x = 1 in [0; 2]$.
      Ta tính các giá trị:
      $
        y(0) = 2, quad y(1) = 0, quad y(2) = 4.
      $
      Vậy giá trị nhỏ nhất của hàm số trên đoạn $[0; 2]$ là $0$ tại $x = 1$.
      Chọn đáp án *B*.
    ]
  )

  // PHẦN II
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

  #ds(
    [Cho hàm số $f(x) = (x^2 - m x + 1)/(x - m)$ với $m$ là tham số thực.],
    (
      True([Với mọi giá trị của $m$, hàm số đã cho luôn có hai điểm cực trị.]),
      True([Đường tiệm cận xiên của đồ thị hàm số là đường thẳng $y = x$.]),
      True([Với $m = 2$, giá trị cực đại của hàm số bằng $0$.]),
      [Có đúng $3$ giá trị nguyên của $m$ để hàm số đồng biến trên khoảng $(2; +oo)$.],
    ),
    loigiai: [
      #ppgiai[
        - Tìm tập xác định và tính đạo hàm.
        - Khảo sát sự tồn tại cực trị, tiệm cận xiên, tìm cực đại với $m=2$ và khảo sát tính đồng biến trên khoảng $(2; +oo)$.
      ]

      Tập xác định: $D = RR setminus {m}$.

      *a) Khảo sát cực trị:*
      Đạo hàm của hàm số:
      $
        f'(x) = ((2x - m)(x - m) - (x^2 - m x + 1))/(x - m)^2
        = (2x^2 - 3m x + m^2 - x^2 + m x - 1)/(x - m)^2
        = (x^2 - 2m x + m^2 - 1)/(x - m)^2.
      $
      Xét phương trình tử số: $g(x) = x^2 - 2m x + m^2 - 1 = 0$.
      Ta có biệt thức thu gọn:
      $
        Delta' = (-m)^2 - 1 \cdot (m^2 - 1) = m^2 - m^2 + 1 = 1 > 0, quad forall m.
      $
      Do đó, phương trình $g(x) = 0$ luôn có hai nghiệm phân biệt $x_1 = m - 1$ và $x_2 = m + 1$ với mọi $m$.
      Vì $x_1, x_2 != m$ và đạo hàm đổi dấu qua hai nghiệm này nên hàm số luôn có hai điểm cực trị.
      Do đó ý a) *ĐÚNG*.

      *b) Khảo sát tiệm cận xiên:*
      Ta viết lại hàm số:
      $
        f(x) = (x(x - m) + 1)/(x - m) = x + 1/(x - m).
      $
      Vì $lim_(x -> +-oo) [f(x) - x] = lim_(x -> +-oo) 1/(x - m) = 0$, nên đường thẳng $y = x$ luôn là đường tiệm cận xiên của đồ thị hàm số với mọi $m$.
      Do đó ý b) *ĐÚNG*.

      *c) Với $m = 2$:*
      Ta có $f(x) = x + 1/(x - 2)$ và hai điểm cực trị là $x = 1$ và $x = 3$.
      Bảng biến thiên cho thấy cực đại đạt được tại $x = 1$:
      $
        y_("CĐ") = f(1) = 1 + 1/(1 - 2) = 0.
      $
      Do đó ý c) *ĐÚNG*.

      *d) Đồng biến trên khoảng $(2; +oo)$:*
      Hàm số đồng biến trên khoảng $(2; +oo)$ khi và chỉ khi:
      $
        f'(x) >= 0, quad forall x > 2 " và điểm gián đoạn " m <= 2.
      $
      Ta cần:
      $
        x^2 - 2m x + m^2 - 1 >= 0, quad forall x > 2
        <=> (x - m)^2 >= 1, quad forall x > 2.
      $
      Vì $x > 2$ và $m <= 2$ nên $x - m > 0$, do đó điều kiện tương đương với:
      $
        x - m >= 1, quad forall x > 2 <=> m <= x - 1, quad forall x > 2 <=> m <= 1.
      $
      Các giá trị nguyên của $m$ thỏa mãn là $m in {1; 0; -1; -2; ...}$, có vô số giá trị nguyên của $m$.
      Do đó ý d) *SAI*.
    ]
  )

  #ds(
    [Trong không gian tọa độ $O x y z$ (đơn vị đo là mét), một hộ gia đình lắp đặt các tấm pin năng lượng mặt trời trên mái nhà. Mái nhà có dạng phẳng và nằm trên mặt phẳng $(P)$ đi qua ba điểm $A(4; 0; 3)$, $B(0; 6; 3)$ và $C(0; 0; 5)$.],
    (
      True([Một vectơ pháp tuyến của mặt phẳng mái nhà $(P)$ là $vect(n) = (3; 2; 6)$.]),
      True([Phương trình tổng quát của mặt phẳng $(P)$ là $3x + 2y + 6z - 30 = 0$.]),
      True([Góc giữa mặt phẳng mái nhà $(P)$ và mặt phẳng nằm ngang $(O x y)$ có cosin bằng $6/7$.]),
      [Nếu tia sáng mặt trời chiếu thẳng xuống theo phương của vectơ $vect(s) = (1; 1; -2)$, thì góc giữa tia sáng mặt trời và mặt phẳng mái nhà $(P)$ xấp xỉ $35^circ$.],
    ),
    fig: cetz.canvas(length: 0.6cm, {
      import cetz.draw: *

      let proj(x, y, z) = {
        let px = -0.5 * x + 0.8 * y
        let py = -0.3 * x + z
        (px, py)
      }

      let O = proj(0, 0, 0)
      let Ax = proj(4, 0, 0)
      let By = proj(0, 6, 0)
      let Cz = proj(0, 0, 5)

      let A = proj(4, 0, 3)
      let B = proj(0, 6, 3)
      let C = proj(0, 0, 5)

      // Vẽ trục
      line(proj(-1, 0, 0), proj(5.5, 0, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      content(proj(5.7, 0, 0), $x$)
      line(proj(0, -1, 0), proj(0, 7.5, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      content(proj(0, 7.7, 0), $y$)
      line(proj(0, 0, -1), proj(0, 0, 6), mark: (end: ">"), stroke: 0.5pt + gray)
      content(proj(0, 0, 6.2), $z$)
      content(proj(-0.3, -0.3, -0.3), $O$)

      // Vẽ tam giác ABC
      line(A, B, stroke: 1pt + blue)
      line(B, C, stroke: 1pt + blue)
      line(C, A, stroke: 1pt + blue)

      // Vẽ nét đứt tọa độ
      line(Ax, A, stroke: (dash: "dashed", paint: gray))
      line(proj(0, 0, 3), A, stroke: (dash: "dashed", paint: gray))
      line(By, B, stroke: (dash: "dashed", paint: gray))
      line(proj(0, 0, 3), B, stroke: (dash: "dashed", paint: gray))

      // Vẽ điểm
      circle(A, radius: 1.5pt, fill: blue)
      content(A, [ $A$], anchor: "south-west")
      circle(B, radius: 1.5pt, fill: blue)
      content(B, [ $B$], anchor: "north-west")
      circle(C, radius: 1.5pt, fill: blue)
      content(C, [ $C$], anchor: "south-east")

      content(Ax, [ $4$], anchor: "north-east")
      content(By, [ $6$], anchor: "south")
      content(Cz, [ $5$], anchor: "east")
      content(proj(0, 0, 3), [ $3$], anchor: "east")
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        - Tính tích có hướng để tìm vectơ pháp tuyến và viết phương trình mặt phẳng.
        - Sử dụng công thức tính góc giữa hai mặt phẳng để tìm góc với mặt phẳng nằm ngang $(O x y)$.
        - Sử dụng công thức tính góc giữa đường thẳng (phương tia sáng) và mặt phẳng để kiểm tra góc chiếu.
      ]

      *a, b) Tìm vectơ pháp tuyến và phương trình $(P)$:*
      Ta có:
      $
        vect(C A) = (4; 0; -2), quad vect(C B) = (0; 6; -2).
      $
      Tích có hướng của hai vectơ này là:
      $
        [vect(C A), vect(C B)] = (0 \cdot (-2) - (-2) \cdot 6; (-2) \cdot 0 - 4 \cdot (-2); 4 \cdot 6 - 0 \cdot 0) = (12; 8; 24) = 4(3; 2; 6).
      $
      Mặt phẳng $(P)$ có một vectơ pháp tuyến là $vect(n) = (3; 2; 6)$.
      Phương trình mặt phẳng $(P)$ đi qua $C(0; 0; 5)$ là:
      $
        3(x - 0) + 2(y - 0) + 6(z - 5) = 0 <=> 3x + 2y + 6z - 30 = 0.
      $
      Do đó ý a) và b) đều *ĐÚNG*.

      *c) Góc với mặt phẳng nằm ngang $(O x y)$:*
      Mặt phẳng nằm ngang $(O x y)$ có phương trình $z = 0$, có vectơ pháp tuyến là $vect(k) = (0; 0; 1)$.
      Gọi $alpha$ là góc giữa mặt phẳng mái nhà $(P)$ và mặt phẳng $(O x y)$:
      $
        cos alpha = (|vect(n) \cdot vect(k)|)/(|vect(n)| \cdot |vect(k)|) = (|3 \cdot 0 + 2 \cdot 0 + 6 \cdot 1|)/(sqrt(3^2 + 2^2 + 6^2) \cdot 1) = 6/sqrt(49) = 6/7.
      $
      Do đó ý c) *ĐÚNG*.

      *d) Góc giữa tia sáng mặt trời và mái nhà:*
      Đường thẳng chứa tia sáng mặt trời có vectơ chỉ phương $vect(s) = (1; 1; -2)$.
      Gọi $theta$ là góc giữa tia sáng mặt trời và mặt phẳng mái nhà $(P)$, ta có:
      $
        sin theta = (|vect(s) \cdot vect(n)|)/(|vect(s)| \cdot |vect(n)|) = (|1 \cdot 3 + 1 \cdot 2 + (-2) \cdot 6|)/(sqrt(1^2 + 1^2 + (-2)^2) \cdot 7) = (|3 + 2 - 12|)/(sqrt(6) \cdot 7) = 7/(7 sqrt(6)) = 1/sqrt(6) approx 0,4082.
      $
      Suy ra $theta approx 24,09^circ approx 24^circ$.
      Mệnh đề nói góc xấp xỉ $35^circ$ là sai.
      Do đó ý d) *SAI*.
    ]
  )

  #ds(
    [Khảo sát năng suất lao động hằng ngày (đơn vị: sản phẩm) của một nhóm gồm $70$ công nhân tại một nhà máy sản xuất thiết bị điện tử, người ta lập được bảng số liệu ghép nhóm như sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Năng suất (sản phẩm)], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$],
          [Số công nhân], [8], [15], [24], [18], [5],
        )
      ]
    ],
    (
      True([Tổng số công nhân được khảo sát trong mẫu số liệu ghép nhóm trên là $70$ người.]),
      True([Số trung bình của mẫu số liệu ghép nhóm này xấp xỉ $22,29$ sản phẩm.]),
      True([Trung vị của mẫu số liệu ghép nhóm trên bằng $22,5$.]),
      [Mốt của mẫu số liệu ghép nhóm trên bằng $23,5$.],
    ),
    loigiai: [
      #ppgiai[
        - Đếm cỡ mẫu $n$.
        - Tìm giá trị đại diện của từng nhóm để tính số trung bình $bar(x)$.
        - Xác định lớp chứa trung vị và dùng công thức trung vị cho mẫu số liệu ghép nhóm.
        - Xác định lớp chứa mốt và dùng công thức mốt cho mẫu số liệu ghép nhóm.
      ]

      *a) Cỡ mẫu:*
      Tổng số công nhân khảo sát là:
      $
        n = 8 + 15 + 24 + 18 + 5 = 70 " (người)".
      $
      Do đó ý a) *ĐÚNG*.

      *b) Số trung bình:*
      Giá trị đại diện của mỗi nhóm lần lượt là: $12,5$; $17,5$; $22,5$; $27,5$; $32,5$.
      Số trung bình là:
      $
        bar(x) = (8 dot 12,5 + 15 dot 17,5 + 24 dot 22,5 + 18 dot 27,5 + 5 dot 32,5)/70
        = (100 + 262,5 + 540 + 495 + 162,5)/70 = 1560/70 = 156/7 approx 22,29 " (sản phẩm)".
      $
      Do đó ý b) *ĐÚNG*.

      *c) Trung vị:*
      Tần số tích lũy của các nhóm lần lượt là: $F_1 = 8$, $F_2 = 23$, $F_3 = 47$, $F_4 = 65$, $F_5 = 70$.
      Vì $n/2 = 35$, mà $F_2 = 23 < 35 <= F_3 = 47$, nên nhóm chứa trung vị là $[20; 25)$.
      Các thông số:
      - Cận dưới: $L = 20$.
      - Tần số nhóm chứa trung vị: $f = 24$.
      - Tần số tích lũy trước đó: $F = 23$.
      - Độ rộng nhóm: $h = 5$.
      Công thức trung vị:
      $
        M_e = L + ((n/2 - F)/f) dot h = 20 + ((35 - 23)/24) dot 5 = 20 + 12/24 dot 5 = 20 + 2,5 = 22,5.
      $
      Do đó ý c) *ĐÚNG*.

      *d) Mốt:*
      Tần số lớn nhất là $24$ nên nhóm chứa mốt là $[20; 25)$.
      Các thông số:
      - Cận dưới: $L = 20$.
      - Tần số nhóm chứa mốt: $f_m = 24$.
      - Tần số nhóm đứng trước: $f_(m-1) = 15$.
      - Tần số nhóm đứng sau: $f_(m+1) = 18$.
      - Độ rộng nhóm: $h = 5$.
      Công thức mốt:
      $
        M_o = L + ((f_m - f_(m-1))/((f_m - f_(m-1)) + (f_m - f_(m+1)))) dot h
        = 20 + ((24 - 15)/((24 - 15) + (24 - 18))) dot 5
        = 20 + 9/(9 + 6) dot 5 = 20 + 9/15 dot 5 = 20 + 3 = 23.
      $
      Mốt bằng $23$, không phải $23,5$. Do đó ý d) *SAI*.
    ]
  )

  #ds(
    [Thời gian chờ đợi (tính bằng phút) của một khách hàng tại quầy giao dịch của một ngân hàng thương mại là một biến ngẫu nhiên liên tục $X$ có phân phối mũ với tham số $lambda = 0,2$ ($"phút"^(-1)$). Hàm mật độ xác suất của $X$ được cho bởi:
      $
        f(x) = cases(
          0.2 e^(-0.2 x) & "khi" x >= 0,
          0 & "khi" x < 0.
        )
      $
    ],
    (
      True([Thời gian chờ đợi trung bình của một khách hàng tại quầy giao dịch này là $5$ phút.]),
      True([Hàm phân phối tích lũy của biến ngẫu nhiên $X$ là $F(x) = 1 - e^(-0,2 x)$ với mọi $x >= 0$.]),
      True([Xác suất để một khách hàng bất kỳ phải chờ từ $5$ đến $10$ phút bằng $e^(-1) - e^(-2)$.]),
      [Biết rằng một khách hàng đã chờ hơn $5$ phút tại quầy giao dịch, xác suất để khách hàng đó phải chờ thêm ít nhất $5$ phút nữa xấp xỉ $0,45$.],
    ),
    loigiai: [
      #ppgiai[
        - Kỳ vọng của biến ngẫu nhiên liên tục có phân phối mũ với tham số $lambda$ là $E(X) = 1/lambda$.
        - Hàm phân phối tích lũy là nguyên hàm của hàm mật độ từ $0$ đến $x$.
        - Xác suất $P(a <= X <= b) = F(b) - F(a)$.
        - Sử dụng tính chất không nhớ (memoryless property) của phân phối mũ: $P(X >= t + s | X >= t) = P(X >= s)$.
      ]

      *a) Thời gian chờ đợi trung bình:*
      Vì $X$ có phân phối mũ với tham số $lambda = 0,2$ nên thời gian chờ đợi trung bình (kỳ vọng) là:
      $
        E(X) = 1/lambda = 1/0,2 = 5 " (phút)".
      $
      Do đó ý a) *ĐÚNG*.

      *b) Hàm phân phối tích lũy:*
      Với $x >= 0$, ta có:
      $
        F(x) = integral_0^x 0,2 e^(-0,2 t) dif t = lr((-e^(-0,2 t)) |)_0^x = 1 - e^(-0,2 x).
      $
      Do đó ý b) *ĐÚNG*.

      *c) Xác suất để khách hàng chờ từ $5$ đến $10$ phút:*
      $
        P(5 <= X <= 10) = F(10) - F(5) = (1 - e^(-2)) - (1 - e^(-1)) = e^(-1) - e^(-2).
      $
      Do đó ý c) *ĐÚNG*.

      *d) Xác suất có điều kiện:*
      Ta cần tính xác suất để khách hàng chờ thêm ít nhất $5$ phút nữa khi đã chờ được $5$ phút, tức là tổng thời gian chờ $X >= 10$:
      $
        P(X >= 10 | X >= 5) = (P(X >= 10 " và " X >= 5))/(P(X >= 5)) = (P(X >= 10))/(P(X >= 5)).
      $
      Ta có $P(X >= t) = 1 - F(t) = e^(-0,2 t)$.
      Do đó:
      $
        P(X >= 10 | X >= 5) = e^(-0,2 dot 10)/e^(-0,2 dot 5) = e^(-2)/e^(-1) = e^(-1) approx 0,37.
      $
      Mệnh đề nói xác suất này xấp xỉ $0,45$ là sai. (Thực chất đây chính là tính chất không nhớ của phân phối mũ: việc đã chờ $5$ phút không ảnh hưởng đến xác suất phải chờ thêm $5$ phút nữa, xác suất này vẫn bằng xác suất chờ từ đầu $P(X >= 5) = e^(-1) approx 0,37$).
      Do đó ý d) *SAI*.
    ]
  )

  // PHẦN III
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  #tln(
    [Một nhà máy sản xuất linh kiện điện tử sử dụng hai máy tự động $M_1$ và $M_2$. Máy $M_1$ sản xuất $60\%$ số linh kiện, máy $M_2$ sản xuất $40\%$ số linh kiện còn lại. Tỷ lệ linh kiện bị lỗi của máy $M_1$ là $2\%$, của máy $M_2$ là $3\%$. Chọn ngẫu nhiên một linh kiện từ kho của nhà máy và thấy linh kiện đó bị lỗi. Xác suất để linh kiện lỗi đó do máy $M_2$ sản xuất bằng bao nhiêu? (Làm tròn kết quả đến hàng phần mười).],
    [0,5],
    loigiai: [
      #ppgiai[
        - Gọi các biến cố:
          - $A_1$: "Linh kiện được sản xuất bởi máy $M_1$".
          - $A_2$: "Linh kiện được sản xuất bởi máy $M_2$".
          - $B$: "Linh kiện được chọn bị lỗi".
        - Dùng công thức xác suất đầy đủ để tính $P(B)$.
        - Dùng công thức Bayes để tính xác suất có điều kiện $P(A_2 | B)$.
      ]

      Theo giả thiết, ta có:
      - $P(A_1) = 0,60$; $P(A_2) = 0,40$.
      - $P(B | A_1) = 0,02$; $P(B | A_2) = 0,03$.

      Áp dụng công thức xác suất đầy đủ, xác suất để chọn được linh kiện lỗi là:
      $
        P(B) = P(A_1) \cdot P(B | A_1) + P(A_2) \cdot P(B | A_2)
        = 0,60 \cdot 0,02 + 0,40 \cdot 0,03
        = 0,012 + 0,012 = 0,024.
      $

      Áp dụng công thức Bayes, xác suất để linh kiện lỗi này do máy $M_2$ sản xuất là:
      $
        P(A_2 | B) = (P(A_2) \cdot P(B | A_2)) / P(B) = (0,40 \cdot 0,03) / 0,024 = 0,012 / 0,024 = 0,5.
      $
      Vậy xác suất cần tìm là *$0,5$*.
    ]
  )

  #tln(
    [Một công ty nước giải khát muốn thiết kế một chiếc lon hình trụ có nắp để chứa một lượng chất lỏng có thể tích cố định là $V = 54pi$ $d m^3$. Hãy tìm bán kính đáy $R$ (đơn vị: dm) của chiếc lon sao cho diện tích toàn phần của nó đạt giá trị nhỏ nhất.],
    [3],
    loigiai: [
      #ppgiai[
        - Thiết lập biểu thức chiều cao $H$ theo bán kính đáy $R$ dựa trên thể tích cố định.
        - Viết biểu thức diện tích toàn phần $S_(t p)$ theo biến $R$.
        - Sử dụng khảo sát hàm số hoặc bất đẳng thức AM-GM để tìm giá trị cực tiểu của diện tích.
      ]

      Thể tích hình trụ:
      $
        V = pi R^2 H = 54pi <=> R^2 H = 54 <=> H = 54/R^2.
      $

      Diện tích toàn phần của lon hình trụ (gồm cả hai nắp):
      $
        S_(t p) = 2pi R^2 + 2pi R H = 2pi R^2 + 2pi R \cdot 54/R^2 = 2pi R^2 + 108pi/R.
      $

      Xét hàm số $S(R) = 2pi R^2 + 108pi/R$ trên khoảng $(0; +oo)$, ta có đạo hàm:
      $
        S'(R) = 4pi R - 108pi/R^2.
      $
      Cho $S'(R) = 0 <=> 4pi R = 108pi/R^2 <=> R^3 = 27 <=> R = 3$ (dm).

      Lập bảng biến thiên của $S(R)$ trên $(0; +oo)$:
      - Với $R in (0; 3)$ thì $S'(R) < 0$ nên hàm số nghịch biến.
      - Với $R in (3; +oo)$ thì $S'(R) > 0$ nên hàm số đồng biến.
      Do đó, diện tích toàn phần đạt giá trị nhỏ nhất tại $R = 3$ dm.
      Vậy đáp số là *$3$*.
    ]
  )

  #tln(
    [Trong không gian tọa độ $O x y z$, cho mặt cầu $(S): x^2 + y^2 + z^2 - 4x - 6y - 6z + 18 = 0$ và đường thẳng $d: (x - 1)/2 = y - 1 = (z - 5)/2$. Hãy tìm khoảng cách ngắn nhất giữa một điểm $M$ di động trên mặt cầu $(S)$ và một điểm $N$ di động trên đường thẳng $d$.],
    [1],
    loigiai: [
      #ppgiai[
        - Tìm tọa độ tâm $I$ và bán kính $R$ của mặt cầu $(S)$.
        - Tính khoảng cách từ tâm $I$ đến đường thẳng $d$.
        - Khoảng cách ngắn nhất giữa điểm $M$ trên mặt cầu và điểm $N$ trên đường thẳng chính là khoảng cách từ tâm $I$ đến $d$ trừ đi bán kính $R$ (nếu đường thẳng nằm ngoài mặt cầu).
      ]

      *Bước 1: Tìm tâm và bán kính của $(S)$:*
      Phương trình mặt cầu $(S)$ là:
      $
        (x - 2)^2 + (y - 3)^2 + (z - 3)^2 = 2^2 + 3^2 + 3^2 - 18 = 4.
      $
      Do đó mặt cầu $(S)$ có tâm $I(2; 3; 3)$ và bán kính $R = 2$.

      *Bước 2: Tính khoảng cách từ $I$ đến đường thẳng $d$:*
      Đường thẳng $d$ đi qua điểm $A(1; 1; 5)$ và có một vectơ chỉ phương là $vect(u) = (2; 1; 2)$.
      Ta có:
      $
        vect(A I) = (2 - 1; 3 - 1; 3 - 5) = (1; 2; -2).
      $
      Tích có hướng của $vect(A I)$ và $vect(u)$ là:
      $
        [vect(A I), vect(u)] = (2 \cdot 2 - (-2) \cdot 1; (-2) \cdot 2 - 1 \cdot 2; 1 \cdot 1 - 2 \cdot 2) = (6; -6; -3).
      $
      Độ dài của tích có hướng là:
      $
        |[vect(A I), vect(u)]| = sqrt(6^2 + (-6)^2 + (-3)^2) = sqrt(36 + 36 + 9) = sqrt(81) = 9.
      $
      Độ dài của vectơ chỉ phương $vect(u)$ là:
      $
        |vect(u)| = sqrt(2^2 + 1^2 + 2^2) = 3.
      $
      Khoảng cách từ tâm $I$ đến đường thẳng $d$ là:
      $
        d(I, d) = (|[vect(A I), vect(u)]|)/(|vect(u)|) = 9/3 = 3.
      $

      *Bước 3: Tính khoảng cách ngắn nhất:*
      Vì $d(I, d) = 3 > R = 2$ nên đường thẳng $d$ không cắt mặt cầu $(S)$.
      Khoảng cách ngắn nhất giữa điểm $M in (S)$ và điểm $N in d$ là:
      $
        d_(min) = d(I, d) - R = 3 - 2 = 1.
      $
      Vậy đáp số là *$1$*.
    ]
  )

  #tln(
    [Trong kinh tế học, hệ số bất bình đẳng thu nhập Gini được tính bằng công thức $G = 2 integral_0^1 (x - L(x)) dif x$, trong đó $x$ là tỷ lệ phần trăm số hộ gia đình nghèo nhất (dưới dạng số thập phân từ $0$ đến $1$) và $L(x)$ là tỷ lệ phần trăm tổng thu nhập mà nhóm hộ gia đình này nhận được, được mô tả bởi đường cong Lorenz. Giả sử đường cong Lorenz của một quốc gia được xác định bởi hàm số $L(x) = 3/4 x^2 + 1/4 x$. Hãy tính hệ số Gini của quốc gia đó.],
    [0,25],
    loigiai: [
      #ppgiai[
        Thay biểu thức đường cong Lorenz $L(x)$ vào công thức tính hệ số Gini rồi thực hiện tích phân xác định trên đoạn $[0; 1]$.
      ]

      Ta có công thức:
      $
        G = 2 integral_0^1 (x - (3/4 x^2 + 1/4 x)) dif x
        = 2 integral_0^1 (3/4 x - 3/4 x^2) dif x
        = 3/2 integral_0^1 (x - x^2) dif x.
      $
      Tìm nguyên hàm:
      $
        integral (x - x^2) dif x = x^2/2 - x^3/3 + C.
      $
      Tính tích phân xác định:
      $
        integral_0^1 (x - x^2) dif x = lr((x^2/2 - x^3/3) |)_0^1 = (1/2 - 1/3) - 0 = 1/6.
      $
      Do đó, hệ số Gini là:
      $
        G = 3/2 \cdot 1/6 = 1/4 = 0,25.
      $
      Vậy đáp số là *$0,25$*.
    ]
  )

  #tln(
    [Một người gửi tiết kiệm vào ngân hàng số tiền $100$ triệu đồng với lãi suất $0,5\%$ mỗi tháng theo hình thức lãi kép. Cứ sau đúng một tháng kể từ ngày gửi, người đó rút ra một số tiền cố định là $5$ triệu đồng từ tài khoản tiết kiệm của mình để chi tiêu. Hỏi sau ít nhất bao nhiêu tháng thì số tiền trong tài khoản tiết kiệm của người đó sẽ được rút hết hoàn toàn?],
    [22],
    loigiai: [
      #ppgiai[
        - Gọi $A = 100$ (triệu đồng) là số tiền gửi ban đầu, $r = 0,5\% = 0,005$ là lãi suất hàng tháng và $m = 5$ (triệu đồng) là số tiền rút ra hàng tháng.
        - Thiết lập công thức số dư sau mỗi tháng $n$ bằng phương pháp quy nạp.
        - Tìm giá trị nguyên nhỏ nhất của $n$ sao cho số dư trong tài khoản không vượt quá $0$.
      ]

      Gọi $A_n$ là số dư trong tài khoản sau tháng thứ $n$:
      - Sau tháng thứ 1: $A_1 = A(1 + r) - m$.
      - Sau tháng thứ 2: $A_2 = A_1(1 + r) - m = A(1 + r)^2 - m(1 + r) - m$.
      - Quy nạp lên, sau tháng thứ $n$:
      $
        A_n = A(1 + r)^n - m \cdot ((1 + r)^n - 1)/r.
      $

      Số tiền trong tài khoản bị rút hết hoàn toàn khi và chỉ khi:
      $
        A_n <= 0 <=> A(1 + r)^n <= m \cdot ((1 + r)^n - 1)/r
        <=> A r (1 + r)^n <= m(1 + r)^n - m
      $
      $
        <=> m <= (1 + r)^n (m - A r) <=> (1 + r)^n >= m/(m - A r)
      $
      Thay số liệu vào: $A = 100$, $r = 0,005$, $m = 5$, ta được:
      $
        (1,005)^n >= 5/(5 - 100 \cdot 0,005) = 5/(5 - 0,5) = 5/4,5 = 10/9.
      $
      Lấy lôgarit tự nhiên hai vế:
      $
        n >= (ln(10/9))/(ln(1,005)) approx 21,12.
      $
      Vì $n$ phải là số nguyên dương nên số tháng ít nhất để tài khoản hết tiền là $22$ tháng.
      Vậy đáp số là *$22$*.
    ]
  )

  #tln(
    [Cho hàm số bậc ba $y = f(x)$ có đồ thị như hình vẽ dưới đây.
      Hỏi hàm số $g(x) = f(x^3 - 3x)$ có bao nhiêu điểm cực trị?
    ],
    [8],
    fig: cetz.canvas(length: 0.8cm, {
      import cetz.draw: *

      // Trục tọa độ
      line((-2.5, 0), (2.5, 0), mark: (end: ">"))
      content((2.5, 0.3), $x$)
      line((0, -1.8), (0, 3.5), mark: (end: ">"))
      content((0.3, 3.5), $y$)
      content((-0.3, -0.3), $O$)

      // Vẽ đồ thị y = x^3 - 3x + 1
      let pts = ()
      for i in range(-21, 22) {
        let x = i / 10.0
        let y = x * x * x - 3 * x + 1
        pts.push((x, y))
      }
      line(..pts, stroke: 1.2pt + black)

      // Điểm cực đại (-1; 3)
      circle((-1, 3), radius: 2pt, fill: black)
      line((-1, 0), (-1, 3), stroke: (dash: "dashed", paint: gray))
      line((0, 3), (-1, 3), stroke: (dash: "dashed", paint: gray))
      content((-1, -0.3), $-1$)
      content((0.3, 3), $3$)

      // Điểm cực tiểu (1; -1)
      circle((1, -1), radius: 2pt, fill: black)
      line((1, 0), (1, -1), stroke: (dash: "dashed", paint: gray))
      line((0, -1), (1, -1), stroke: (dash: "dashed", paint: gray))
      content((1, 0.3), $1$)
      content((-0.3, -1), $-1$)
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        - Tính đạo hàm $g'(x)$ của hàm số hợp.
        - Tìm số nghiệm đơn và bội lẻ của phương trình $g'(x) = 0$ (các nghiệm này tương ứng với các điểm cực trị).
      ]

      Ta có:
      $
        g'(x) = (x^3 - 3x)' \cdot f'(x^3 - 3x) = 3(x^2 - 1) \cdot f'(x^3 - 3x).
      $
      Cho $g'(x) = 0 <=> hoac(3(x^2 - 1) = 0, f'(x^3 - 3x) = 0)$.

      *Trường hợp 1:* $3(x^2 - 1) = 0 <=> x = +-1$.
      Đây là hai nghiệm đơn.

      *Trường hợp 2:* $f'(x^3 - 3x) = 0$.
      Từ đồ thị hàm số bậc ba $y = f(x)$, ta thấy $f(x)$ có hai điểm cực trị tại $x = -1$ và $x = 1$.
      Do đó:
      $
        f'(t) = 0 <=> t = -1 " hoặc " t = 1.
      $
      Thay $t = x^3 - 3x$, ta được hai phương trình:
      1. $x^3 - 3x = -1$ (1)
      2. $x^3 - 3x = 1$ (2)

      Xét hàm số $h(x) = x^3 - 3x$. Ta có bảng biến thiên của $h(x)$:
      - Giá trị cực đại: $h(-1) = 2$.
      - Giá trị cực tiểu: $h(1) = -2$.
      Vì cả $-1$ và $1$ đều thuộc khoảng cực trị $(-2; 2)$ của hàm số $h(x)$ nên:
      - Phương trình (1) $x^3 - 3x = -1$ có đúng $3$ nghiệm phân biệt khác $+-1$.
      - Phương trình (2) $x^3 - 3x = 1$ có đúng $3$ nghiệm phân biệt khác $+-1$.
      Đồng thời các nghiệm này đều là nghiệm đơn của phương trình $g'(x) = 0$.

      Tổng cộng, phương trình $g'(x) = 0$ có:
      $
        2 + 3 + 3 = 8
      $
      nghiệm đơn phân biệt. Do đó hàm số $g(x)$ có đúng $8$ điểm cực trị.
      Vậy đáp số là *$8$*.
    ]
  )
]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
