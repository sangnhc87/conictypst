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
  school: "ĐỀ THI THỬ LẦN 10",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 10)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "107",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  #tn(
    [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x-1)^2(x+2)^3$ với mọi $x in RR$. Số điểm cực trị của hàm số đã cho là],
    (
      [$1$.],
      True([$2$.]),
      [$3$.],
      [$4$.],
    ),
    loigiai: [
      #ppgiai[
        Điểm cực trị của hàm số là các điểm tại đó đạo hàm $f'(x) = 0$ và đạo hàm đổi dấu khi qua điểm đó.
      ]

      Ta giải phương trình đạo hàm:
      $
        f'(x) = 0 <=> x(x-1)^2(x+2)^3 = 0 <=> hoac(x = 0, x = 1, x = -2).
      $
      Trong các nghiệm trên:
      - $x = 0$ là nghiệm đơn (bội $1$), qua đó $f'(x)$ đổi dấu.
      - $x = 1$ là nghiệm bội chẵn (bội $2$), qua đó $f'(x)$ không đổi dấu.
      - $x = -2$ là nghiệm bội lẻ (bội $3$), qua đó $f'(x)$ đổi dấu.

      Vậy hàm số đã cho có đúng $2$ điểm cực trị (là $x = 0$ và $x = -2$).
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Khảo sát thời gian hoàn thành một bài kiểm tra tư duy (đơn vị: phút) của $40$ ứng viên tuyển dụng, ta thu được mẫu số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian], [$[0; 5)$], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$],
          [Số ứng viên], [4], [10], [14], [8], [4],
        )
      ]
      Tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm này bằng],
    (
      True([$16,25$.]),
      [$15,75$.],
      [$16,50$.],
      [$17,25$.],
    ),
    loigiai: [
      #ppgiai[
        Cỡ mẫu $n = 40$. Vị trí của tứ phân vị thứ ba $Q_3$ là $3n/4 = 30$.
        Ta tìm nhóm chứa tứ phân vị thứ ba bằng cách tích lũy tần số của các nhóm.
      ]

      Bảng tần số tích lũy:
      - Nhóm $[0; 5)$ có tần số tích lũy là $4$.
      - Nhóm $[5; 10)$ có tần số tích lũy là $4 + 10 = 14$.
      - Nhóm $[10; 15)$ có tần số tích lũy là $14 + 14 = 28$.
      - Nhóm $[15; 20)$ có tần số tích lũy là $28 + 8 = 36$.

      Vì $28 < 30 <= 36$ nên nhóm chứa tứ phân vị thứ ba $Q_3$ là $[15; 20)$.
      Ta xác định các tham số:
      - Cận dưới của nhóm chứa $Q_3$: $L = 15$.
      - Tần số tích lũy trước nhóm chứa $Q_3$: $F = 28$.
      - Tần số nhóm chứa $Q_3$: $f = 8$.
      - Độ rộng nhóm: $h = 5$.

      Áp dụng công thức:
      $
        Q_3 = L + (( (3n)/4 - F ) / f) dot h = 15 + ((30 - 28) / 8) dot 5 = 15 + 2/8 dot 5 = 15 + 1,25 = 16,25.
      $
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Số đường tiệm cận ngang của đồ thị hàm số $y = (2x + 1) / sqrt(x^2 + 1)$ là],
    (
      [$0$.],
      [$1$.],
      True([$2$.]),
      [$3$.],
    ),
    loigiai: [
      #ppgiai[
        Đường thẳng $y = y_0$ là tiệm cận ngang của đồ thị hàm số nếu $lim_(x rightarrow +infty) y = y_0$ hoặc $lim_(x rightarrow -infty) y = y_0$.
      ]

      Ta tính giới hạn khi $x rightarrow pm infty$:
      - Khi $x rightarrow +infty$:
        $
          lim_(x rightarrow +infty) (2x + 1) / sqrt(x^2 + 1) = lim_(x rightarrow +infty) (x(2 + 1/x)) / (x sqrt(1 + 1/x^2)) = lim_(x rightarrow +infty) (2 + 1/x) / sqrt(1 + 1/x^2) = 2.
        $
        Suy ra $y = 2$ là một đường tiệm cận ngang.

      - Khi $x rightarrow -infty$:
        $
          lim_(x rightarrow -infty) (2x + 1) / sqrt(x^2 + 1) = lim_(x rightarrow -infty) (x(2 + 1/x)) / (|x| sqrt(1 + 1/x^2)) = lim_(x rightarrow -infty) (x(2 + 1/x)) / (-x sqrt(1 + 1/x^2)) = -2.
        $
        Suy ra $y = -2$ là một đường tiệm cận ngang khác.

      Vậy đồ thị hàm số có đúng $2$ đường tiệm cận ngang.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Họ tất cả các nguyên hàm của hàm số $f(x) = sin(2x) e^(cos(2x))$ là],
    (
      [$1/2 e^(cos(2x)) + C$.],
      True([$-1/2 e^(cos(2x)) + C$.]),
      [$-e^(cos(2x)) + C$.],
      [$2 e^(cos(2x)) + C$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng phương pháp đổi biến số để tính nguyên hàm của hàm số chứa hàm mũ $e^(u(x))$.
      ]

      Đặt $u = cos(2x) => dif u = -2 sin(2x) dif x => sin(2x) dif x = -1/2 dif u$.
      Thay vào tích phân ta được:
      $
        int sin(2x) e^(cos(2x)) dif x = int e^u (-1/2) dif u = -1/2 e^u + C = -1/2 e^(cos(2x)) + C.
      $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Cho tứ diện $A B C D$. Gọi $M$ là trung điểm của cạnh $A B$, $N$ là trung điểm của cạnh $C D$. Khẳng định nào sau đây đúng?],
    (
      [$vect(M N) = vect(A D) + vect(B C)$.],
      True([$vect(M N) = 1/2 (vect(A D) + vect(B C))$.]),
      [$vect(M N) = 1/2 (vect(A D) - vect(B C))$.],
      [$vect(M N) = 1/2 (vect(B C) - vect(A D))$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng quy tắc cộng vectơ để biểu diễn vectơ $vect(M N)$ theo hai đường đi qua các đỉnh $A, D$ và $B, C$.
      ]

      Ta có hai cách phân tích vectơ $vect(M N)$:
      $
        vect(M N) = vect(M A) + vect(A D) + vect(D N), \
        vect(M N) = vect(M B) + vect(B C) + vect(C N).
      $
      Cộng từng vế của hai đẳng thức trên, ta thu được:
      $
        2 vect(M N) = (vect(M A) + vect(M B)) + (vect(A D) + vect(B C)) + (vect(D N) + vect(C N)).
      $
      Vì $M$ là trung điểm của $A B$ nên $vect(M A) + vect(M B) = vect(0)$. \
      Vì $N$ là trung điểm của $C D$ nên $vect(D N) + vect(C N) = vect(0)$.

      Do đó:
      $
        2 vect(M N) = vect(A D) + vect(B C) => vect(M N) = 1/2 (vect(A D) + vect(B C)).
      $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, phương trình mặt phẳng đi qua ba điểm $A(1; 0; 0)$, $B(0; -2; 0)$, $C(0; 0; 3)$ là],
    (
      True([$6x - 3y + 2z - 6 = 0$.]),
      [$6x + 3y + 2z - 6 = 0$.],
      [$6x - 3y + 2z + 6 = 0$.],
      [$x - 2y + 3z - 1 = 0$.],
    ),
    loigiai: [
      #ppgiai[
        Mặt phẳng đi qua các điểm nằm trên ba trục tọa độ có phương trình dạng đoạn chắn: $x/a + y/b + z/c = 1$.
      ]

      Ba điểm $A(1; 0; 0)$, $B(0; -2; 0)$, $C(0; 0; 3)$ lần lượt nằm trên các trục $O x$, $O y$, $O z$.
      Phương trình mặt phẳng $(A B C)$ theo đoạn chắn là:
      $
        x/1 + y/(-2) + z/3 = 1 <=> x - y/2 + z/3 = 1.
      $
      Quy đồng mẫu số chung là $6$, ta được:
      $
        6x - 3y + 2z = 6 <=> 6x - 3y + 2z - 6 = 0.
      $
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Cho $integral_1^3 f(x) dif x = 4$ và $integral_1^3 g(x) dif x = -2$. Giá trị của $integral_1^3 [2 f(x) - 3 g(x)] dif x$ bằng],
    (
      [$2$.],
      True([$14$.]),
      [$10$.],
      [$-2$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng tính chất tuyến tính của tích phân xác định để tách tích phân của tổng hiệu thành các tích phân thành phần.
      ]

      Ta có:
      $
        integral_1^3 [2 f(x) - 3 g(x)] dif x = 2 integral_1^3 f(x) dif x - 3 integral_1^3 g(x) dif x.
      $
      Thay các giá trị tích phân đã cho vào biểu thức:
      $
        2 \cdot 4 - 3 \cdot (-2) = 8 + 6 = 14.
      $
      Chọn đáp án *B*.
    ]
  )

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
        Sử dụng công thức số hạng tổng quát của cấp số cộng: $u_n = u_1 + (n - 1)d$.
      ]

      Ta có:
      $
        u_(10) = u_1 + 9d = -3 + 9 \cdot 4 = -3 + 36 = 33.
      $
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, góc giữa hai đường thẳng $d_1: (x - 1)/1 = (y + 2)/(-1) = z/2$ và $d_2: (x + 1)/(-1) = y/2 = (z - 3)/1$ bằng],
    (
      [$60^circ$.],
      [$30^circ$.],
      True([$arccos(1/6)$.]),
      [$arccos(5/6)$.],
    ),
    loigiai: [
      #ppgiai[
        Góc giữa hai đường thẳng trong không gian được tính thông qua trị tuyệt đối cosin góc giữa hai vectơ chỉ phương của chúng.
      ]

      Đường thẳng $d_1$ có vectơ chỉ phương $vec(u_1) = (1; -1; 2)$. \
      Đường thẳng $d_2$ có vectơ chỉ phương $vec(u_2) = (-1; 2; 1)$.

      Gọi $phi$ là góc giữa hai đường thẳng $d_1$ và $d_2$. Ta có:
      $
        cos phi = (|vec(u_1) dot vec(u_2)|) / (|vec(u_1)| dot |vec(u_2)|) = (|1 dot (-1) + (-1) dot 2 + 2 dot 1|) / (sqrt(1^2 + (-1)^2 + 2^2) dot sqrt((-1)^2 + 2^2 + 1^2))
      $
      $
        = (|-1 - 2 + 2|) / (sqrt(6) dot sqrt(6)) = 1/6.
      $
      Do đó $phi = arccos(1/6)$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Một hộp chứa $6$ quả cầu màu đỏ và $4$ quả cầu màu xanh. Lấy ngẫu nhiên lần lượt từng quả cầu từ hộp ra ngoài và không trả lại. Xác suất để quả cầu lấy ra ở lần thứ hai là quả cầu màu xanh khi biết rằng quả cầu lấy ra ở lần thứ nhất là quả cầu màu đỏ bằng],
    (
      True([$4/9$.]),
      [$2/5$.],
      [$4/10$.],
      [$1/6$.],
    ),
    loigiai: [
      #ppgiai[
        Đây là bài toán tính xác suất có điều kiện. Khi không trả lại quả cầu đã lấy, số lượng quả cầu trong hộp giảm đi sau lần lấy thứ nhất.
      ]

      - Ban đầu hộp có $6$ quả đỏ và $4$ quả xanh, tổng cộng $10$ quả.
      - Sau khi lấy quả thứ nhất màu đỏ (và không trả lại), trong hộp còn lại $5$ quả đỏ và $4$ quả xanh, tổng cộng $9$ quả cầu.
      - Lúc này, xác suất để chọn được quả cầu màu xanh ở lần lấy thứ hai bằng:
        $
          P = 4/9.
        $
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, bán kính của mặt cầu $(S): x^2 + y^2 + z^2 - 2x + 4y - 6z - 2 = 0$ bằng],
    (
      True([$4$.]),
      [$16$.],
      [$2 sqrt(3)$.],
      [$2$.],
    ),
    loigiai: [
      #ppgiai[
        Mặt cầu dạng $x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0$ có bán kính $R = sqrt(a^2 + b^2 + c^2 - d)$ với điều kiện $a^2 + b^2 + c^2 - d > 0$.
      ]

      Từ phương trình mặt cầu ta có các hệ số:
      $
        a = 1, quad b = -2, quad c = 3, quad d = -2.
      $
      Tính bán kính mặt cầu:
      $
        R = sqrt(a^2 + b^2 + c^2 - d) = sqrt(1^2 + (-2)^2 + 3^2 - (-2)) = sqrt(1 + 4 + 9 + 2) = sqrt(16) = 4.
      $
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Cho hai biến cố $A$ và $B$ độc lập với nhau có $P(A) = 0,4$ và $P(B) = 0,5$. Xác suất của biến cố $A union B$ bằng],
    (
      [$0,9$.],
      True([$0,7$.]),
      [$0,2$.],
      [$0,1$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức cộng xác suất: $P(A union B) = P(A) + P(B) - P(A cap B)$. Vì hai biến cố độc lập nên $P(A cap B) = P(A) dot P(B)$.
      ]

      Do $A$ và $B$ độc lập nên ta có:
      $
        P(A cap B) = P(A) dot P(B) = 0,4 dot 0,5 = 0,2.
      $
      Xác suất của biến cố hợp $A union B$ là:
      $
        P(A union B) = P(A) + P(B) - P(A cap B) = 0,4 + 0,5 - 0,2 = 0,7.
      $
      Chọn đáp án *B*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Trắc nghiệm đúng/sai
  // ═══════════════════════════════════════════════════════════
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

  #ds(
    [Cho hàm số bậc ba $f(x) = x^3 - 3x^2 + 1$. Xét hàm số $g(x) = f(|x|) = |x|^3 - 3x^2 + 1$.],
    (
      True([Đạo hàm của hàm số $g(x)$ trên khoảng $(0; +infty)$ là $g'(x) = 3x^2 - 6x$.]),
      [Hàm số $g(x)$ có đúng $5$ điểm cực trị.],
      [Giá trị lớn nhất của hàm số $g(x)$ trên đoạn $[-1; 3]$ bằng $3$.],
      True([Đường thẳng $y = m$ cắt đồ thị hàm số $g(x)$ tại đúng $4$ điểm phân biệt khi $-3 < m < 1$.]),
    ),
    loigiai: [
      #ppgiai[
        Phân tích tính chất của hàm số chứa dấu giá trị tuyệt đối dạng $y = f(|x|)$ (hàm chẵn) dựa vào hàm số gốc $f(x)$.
      ]

      *a)* Với $x > 0$, ta có $|x| = x$. Do đó $g(x) = x^3 - 3x^2 + 1$. \
      Đạo hàm trên khoảng $(0; +infty)$ là $g'(x) = 3x^2 - 6x$. Mệnh đề a *ĐÚNG*.

      *b)* Khảo sát cực trị:
      - Với $x > 0$, ta có $g'(x) = 3x^2 - 6x = 3x(x - 2)$.
        $g'(x) = 0 <=> x = 2$ (do $x > 0$). Cực trị tại $x = 2$ là điểm cực tiểu ($g(2) = -3$).
      - Do $g(x) = f(|x|)$ là hàm số chẵn nên đồ thị đối xứng qua trục tung $O y$.
      - Khi qua $x = 0$, $g'(x)$ đổi dấu từ dương sang âm (vì khi $x < 0$ gần $0$, $g'(x) > 0$; khi $x > 0$ gần $0$, $g'(x) < 0$).
      - Vậy hàm số $g(x)$ có đúng $3$ điểm cực trị là $x = -2$ (cực tiểu), $x = 0$ (cực đại), và $x = 2$ (cực tiểu). Mệnh đề nói có $5$ điểm cực trị là *SAI*.

      *c)* Xét trên đoạn $[-1; 3]$:
      - Ta tính các giá trị đặc biệt và giá trị ở biên:
        - Tại cực trị: $g(0) = 1$, $g(2) = -3$. (Lưu ý: cực tiểu $x = -2$ không nằm trong $[-1; 3]$).
        - Tại biên: $g(-1) = |-1|^3 - 3(-1)^2 + 1 = 1 - 3 + 1 = -1$.
        - Tại biên: $g(3) = |3|^3 - 3(3)^2 + 1 = 27 - 27 + 1 = 1$.
      - Giá trị lớn nhất của hàm số trên đoạn $[-1; 3]$ là $1$ (đạt được tại $x = 0$ và $x = 3$). Mệnh đề nói bằng $3$ là *SAI*.

      *d)* Phác thảo đồ thị hàm số $g(x) = |x|^3 - 3x^2 + 1$:
      - Nhánh bên phải trục $O y$ ($x geq 0$): Đồ thị đi từ điểm cực đại $(0; 1)$ đi xuống cực tiểu $(2; -3)$ sau đó tăng lên $+infty$.
      - Nhánh bên trái trục $O y$ ($x < 0$): Được lấy đối xứng qua trục $O y$.
      - Khi đó, đường thẳng nằm ngang $y = m$ sẽ cắt đồ thị tại đúng $4$ điểm phân biệt khi và chỉ khi giá trị cực tiểu $< m <$ giá trị cực đại, tức là $-3 < m < 1$. Mệnh đề d *ĐÚNG*.
    ]
  )

  #ds(
    [Trong không gian $O x y z$ (đơn vị đo là kilômét), hai chiếc drone di chuyển theo các quỹ đạo thẳng. Ở thời điểm $t$ phút ($t geq 0$), tọa độ vị trí của chiếc drone thứ nhất là $M(1 + 2t; 2 - t; 3 + 2t)$ và tọa độ vị trí của chiếc drone thứ hai là $N(2 + t; 1 + t; 4 - t)$.],
    (
      [Tại thời điểm xuất phát ($t = 0$), hai chiếc drone cách nhau một khoảng bằng $3$ km.],
      [Đường bay của chiếc drone thứ nhất vuông góc với đường bay của chiếc drone thứ hai.],
      True([Khoảng cách giữa hai chiếc drone đạt giá trị nhỏ nhất tại thời điểm $t = 3/7$ phút.]),
      True([Khoảng cách ngắn nhất giữa hai chiếc drone trong quá trình bay bằng $sqrt(21)/7$ km.]),
    ),
    loigiai: [
      #ppgiai[
        - Sử dụng công thức khoảng cách giữa hai điểm trong không gian.
        - Khảo sát hàm số bậc hai biểu thị bình phương khoảng cách theo biến thời gian $t$.
      ]

      *a)* Tại thời điểm $t = 0$:
      - Vị trí drone thứ nhất: $M_0(1; 2; 3)$.
      - Vị trí drone thứ hai: $N_0(2; 1; 4)$.
      Khoảng cách lúc xuất phát:
      $
        d_0 = M_0 N_0 = sqrt((2-1)^2 + (1-2)^2 + (4-3)^2) = sqrt(1^2 + (-1)^2 + 1^2) = sqrt(3) " (km)" approx 1,73 " (km)".
      $
      Mệnh đề nói khoảng cách bằng $3$ km là *SAI*.

      *b)* Vectơ chỉ phương của quỹ đạo bay của hai chiếc drone lần lượt là:
      - Quỹ đạo thứ nhất: $vec(u_1) = (2; -1; 2)$.
      - Quỹ đạo thứ hai: $vec(u_2) = (1; 1; -1)$.
      Tích vô hướng:
      $
        vec(u_1) dot vec(u_2) = 2 \cdot 1 + (-1) \cdot 1 + 2 \cdot (-1) = 2 - 1 - 2 = -1 != 0.
      $
      Do tích vô hướng khác $0$ nên hai đường bay không vuông góc. Mệnh đề b *SAI*.

      *c)* Véctơ khoảng cách giữa hai vị trí ở thời điểm $t$:
      $
        vect(M N) = (2+t - (1+2t); 1+t - (2-t); 4-t - (3+2t)) = (1-t; 2t-1; 1-3t).
      $
      Bình phương khoảng cách giữa hai chiếc drone là:
      $
        f(t) = M N^2 = (1-t)^2 + (2t-1)^2 + (1-3t)^2
      $
      $
        = (1 - 2t + t^2) + (4t^2 - 4t + 1) + (1 - 6t + 9t^2) = 14t^2 - 12t + 3.
      $
      Xét hàm số bậc hai $f(t) = 14t^2 - 12t + 3$ trên $[0; +infty)$, ta thấy $f(t)$ đạt cực tiểu tại:
      $
        t = -b / (2a) = 12 / 28 = 3/7 " (phút)".
      $
      Vì $3/7 > 0$ nên khoảng cách đạt giá trị nhỏ nhất tại thời điểm $t = 3/7$ phút. Mệnh đề c *ĐÚNG*.

      *d)* Giá trị nhỏ nhất của bình phương khoảng cách bằng:
      $
        f(3/7) = 14 dot (3/7)^2 - 12 dot (3/7) + 3 = 14 dot 9/49 - 36/7 + 3 = 18/7 - 36/7 + 21/7 = 3/7.
      $
      Vậy khoảng cách ngắn nhất là:
      $
        d_(min) = sqrt(3/7) = (sqrt(3)) / (sqrt(7)) = sqrt(21)/7 " (km)".
      $
      Mệnh đề d *ĐÚNG*.
    ]
  )

  #ds(
    [Để tầm soát một loại bệnh hiểm nghèo trong cộng đồng dân cư, các nhà dịch tễ học thực hiện khảo sát và phân loại dân số thành ba nhóm: Nhóm $H$ (hoàn toàn khỏe mạnh, chiếm $70\%$), nhóm $M$ (mắc bệnh nhẹ, chiếm $20\%$), và nhóm $S$ (mắc bệnh nặng, chiếm $10\%$). Một xét nghiệm y khoa chuyên dụng được tiến hành trên toàn bộ dân số. Kết quả nghiên cứu lâm sàng cho thấy: xác suất xét nghiệm cho kết quả dương tính đối với người khỏe mạnh là $5\%$, đối với người mắc bệnh nhẹ là $60\%$, và đối với người mắc bệnh nặng là $90\%$. Chọn ngẫu nhiên một người trong cộng đồng này để xét nghiệm.],
    (
      True([Xác suất để người được chọn có kết quả xét nghiệm dương tính bằng $0,245$.]),
      True([Nếu người được chọn có kết quả xét nghiệm dương tính, xác suất người này thực sự hoàn toàn khỏe mạnh xấp xỉ $14,29\%$.]),
      [Nếu người được chọn có kết quả xét nghiệm dương tính, xác suất người đó mắc bệnh nặng lớn hơn xác suất người đó mắc bệnh nhẹ.],
      [Nếu người được chọn có kết quả xét nghiệm âm tính, xác suất người đó hoàn toàn khỏe mạnh xấp xỉ $95,63\%$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức xác suất đầy đủ và công thức Bayes cho nhóm đối tượng có 3 phân loại: Khỏe mạnh ($H$), Bệnh nhẹ ($M$), Bệnh nặng ($S$).
      ]

      Ta tóm tắt giả thiết bài toán:
      - Tỷ lệ các nhóm trong dân số: $P(H) = 0,70$; $P(M) = 0,20$; $P(S) = 0,10$.
      - Xác suất dương tính ($T^+$) trong mỗi nhóm:
        - $P(T^+ | H) = 0,05$ (dương tính giả).
        - $P(T^+ | M) = 0,60$.
        - $P(T^+ | S) = 0,90$.

      *a)* Xác suất xét nghiệm dương tính của một người chọn ngẫu nhiên được tính bằng công thức xác suất đầy đủ:
      $
        P(T^+) = P(H) dot P(T^+ | H) + P(M) dot P(T^+ | M) + P(S) dot P(T^+ | S)
      $
      $
        = 0,70 dot 0,05 + 0,20 dot 0,60 + 0,10 dot 0,90 = 0,035 + 0,120 + 0,090 = 0,245.
      $
      Mệnh đề a *ĐÚNG*.

      *b)* Nếu người đó nhận kết quả dương tính ($T^+$), xác suất người đó thực sự khỏe mạnh ($H$) là:
      $
        P(H | T^+) = (P(H cap T^+)) / P(T^+) = (P(H) dot P(T^+ | H)) / P(T^+) = (0,70 dot 0,05) / 0,245 = 0,035 / 0,245 = 1/7 approx 14,29\%.
      $
      Mệnh đề b *ĐÚNG*.

      *c)* Ta tính và so sánh xác suất có điều kiện của bệnh nhẹ và bệnh nặng khi biết kết quả dương tính:
      - Xác suất mắc bệnh nhẹ khi có kết quả dương tính:
        $
          P(M | T^+) = (P(M) dot P(T^+ | M)) / P(T^+) = (0,20 dot 0,60) / 0,245 = 0,120 / 0,245 = 24/49 approx 48,98\%.
        $
      - Xác suất mắc bệnh nặng khi có kết quả dương tính:
        $
          P(S | T^+) = (P(S) dot P(T^+ | S)) / P(T^+) = (0,10 dot 0,90) / 0,245 = 0,090 / 0,245 = 18/49 approx 36,73\%.
        $
      Vì $48,98\% > 36,73\%$, nên xác suất người mắc bệnh nhẹ lớn hơn xác suất người mắc bệnh nặng. Mệnh đề c *SAI*.

      *d)* Tính xác suất khỏe mạnh khi xét nghiệm âm tính ($T^-$):
      - Xác suất xét nghiệm âm tính: $P(T^-) = 1 - P(T^+) = 1 - 0,245 = 0,755$.
      - Xác suất một người vừa khỏe mạnh vừa xét nghiệm âm tính:
        $
          P(H cap T^-) = P(H) dot P(T^- | H) = 0,70 dot (1 - 0,05) = 0,70 dot 0,95 = 0,665.
        $
      - Xác suất người có kết quả âm tính thực sự khỏe mạnh:
        $
          P(H | T^-) = (P(H cap T^-)) / P(T^-) = 0,665 / 0,755 = 133 / 151 approx 88,08\%.
        $
      Mệnh đề nói bằng $95,63\%$ là *SAI*.
    ]
  )

  #ds(
    [Kết quả kiểm tra giữa kỳ môn Toán của hai lớp 12A và 12B (mỗi lớp có $40$ học sinh) được tổng hợp dưới dạng mẫu số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Điểm số], [$[5; 6)$], [$[6; 7)$], [$[7; 8)$], [$[8; 9)$], [$[9; 10]$],
          [Số HS lớp 12A], [5], [10], [15], [8], [2],
          [Số HS lớp 12B], [3], [12], [14], [9], [2],
        )
      ]],
    (
      True([Điểm số trung bình của học sinh lớp 12A bằng $7,30$ và của lớp 12B bằng $7,375$.]),
      True([Số trung vị của mẫu số liệu lớp 12A nhỏ hơn số trung vị của mẫu số liệu lớp 12B.]),
      True([Phương sai của mẫu số liệu ghép nhóm lớp 12A là $1,11$.]),
      [Học sinh lớp 12A có điểm số đồng đều hơn học sinh lớp 12B.],
    ),
    loigiai: [
      #ppgiai[
        Tính toán số trung bình, trung vị, phương sai và độ lệch chuẩn của các mẫu số liệu ghép nhóm để so sánh hai lớp.
      ]

      *a)* Chọn các giá trị đại diện cho các nhóm điểm:
      - Nhóm $[5; 6)$ có giá trị đại diện là $5,5$.
      - Nhóm $[6; 7)$ có giá trị đại diện là $6,5$.
      - Nhóm $[7; 8)$ có giá trị đại diện là $7,5$.
      - Nhóm $[8; 9)$ có giá trị đại diện là $8,5$.
      - Nhóm $[9; 10]$ có giá trị đại diện là $9,5$.

      Tính điểm trung bình của hai lớp:
      - Lớp 12A:
        $
          bar(x)_A = (5 \cdot 5,5 + 10 \cdot 6,5 + 15 \cdot 7,5 + 8 \cdot 8,5 + 2 \cdot 9,5) / 40 = 292 / 40 = 7,30.
        $
      - Lớp 12B:
        $
          bar(x)_B = (3 \cdot 5,5 + 12 \cdot 6,5 + 14 \cdot 7,5 + 9 \cdot 8,5 + 2 \cdot 9,5) / 40 = 295 / 40 = 7,375.
        $
      Mệnh đề a *ĐÚNG*.

      *b)* Tính trung vị $M_e$:
      - Đối với cả hai lớp, vị trí trung vị là $n / 2 = 20$.
      - Nhóm chứa trung vị của cả hai lớp là nhóm $[7; 8)$.
      - Trung vị của lớp 12A:
        $
          M_(e, A) = 7 + ((20 - (5 + 10)) / 15) dot 1 = 7 + 5/15 = 7,33.
        $
      - Trung vị của lớp 12B:
        $
          M_(e, B) = 7 + ((20 - (3 + 12)) / 14) dot 1 = 7 + 5/14 approx 7,36.
        $
      Vì $7,33 < 7,36$ nên số trung vị lớp 12A nhỏ hơn lớp 12B. Mệnh đề b *ĐÚNG*.

      *c)* Tính phương sai của lớp 12A:
      $
        s_A^2 = ( 5(5,5 - 7,3)^2 + 10(6,5 - 7,3)^2 + 15(7,5 - 7,3)^2 + 8(8,5 - 7,3)^2 + 2(9,5 - 7,3)^2 ) / 40
      $
      $
        = ( 5(-1,8)^2 + 10(-0,8)^2 + 15(0,2)^2 + 8(1,2)^2 + 2(2,2)^2 ) / 40
      $
      $
        = ( 5(3,24) + 10(0,64) + 15(0,04) + 8(1,44) + 2(4,84) ) / 40
      $
      $
        = ( 16,2 + 6,4 + 0,6 + 11,52 + 9,68 ) / 40 = 44,4 / 40 = 1,11.
      $
      Mệnh đề c *ĐÚNG*.

      *d)* Tính phương sai của lớp 12B:
      $
        s_B^2 = ( 3(5,5 - 7,375)^2 + 12(6,5 - 7,375)^2 + 14(7,5 - 7,375)^2 + 9(8,5 - 7,375)^2 + 2(9,5 - 7,375)^2 ) / 40
      $
      $
        = ( 3(-1,875)^2 + 12(-0,875)^2 + 14(0,125)^2 + 9(1,125)^2 + 2(2,125)^2 ) / 40
      $
      $
        = ( 10,546875 + 9,1875 + 0,21875 + 11,390625 + 9,03125 ) / 40 = 40,375 / 40 = 1,009375.
      $
      Vì $s_B^2 < s_A^2$ ($1,009 < 1,11$) nên học sinh lớp 12B có điểm số phân bố tập trung hơn quanh số trung bình, tức là điểm số của học sinh lớp 12B đồng đều hơn lớp 12A.
      Mệnh đề d *SAI*.
    ]
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trắc nghiệm trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  #tln(
    [Một chiếc hộp đựng $10$ đồng xu, trong đó có $5$ đồng xu cân đối, $3$ đồng xu có hai mặt đều là ngửa, và $2$ đồng xu bị lệch với xác suất xuất hiện mặt ngửa bằng $0,6$. Chọn ngẫu nhiên một đồng xu trong hộp và tung đồng xu đó một lần thì nhận được mặt ngửa. Nếu tung tiếp đồng xu đó thêm một lần nữa, xác suất nhận được mặt ngửa tiếp là bao nhiêu? (Làm tròn kết quả đến hàng phần trăm).],
    [0,74],
    loigiai: [
      #ppgiai[
        Sử dụng công thức xác suất đầy đủ để tính xác suất sự kiện lần tung thứ nhất ngửa và lần thứ hai ngửa.
        Áp dụng công thức Bayes để tính xác suất có điều kiện: $P(H_2 | H_1) = P(H_1 cap H_2) / P(H_1)$.
      ]

      Gọi $F$ là biến cố chọn được đồng xu cân đối, ta có $P(F) = 0,5$.
      Gọi $D$ là biến cố chọn được đồng xu hai mặt ngửa, ta có $P(D) = 0,3$.
      Gọi $B$ là biến cố chọn được đồng xu lệch, ta có $P(B) = 0,2$.

      Gọi $H_1, H_2$ lần lượt là các biến cố xuất hiện mặt ngửa ở lần tung thứ nhất và lần tung thứ hai.

      - Tính xác suất để lần thứ nhất được mặt ngửa:
        $
          P(H_1) = P(F) dot P(H_1 | F) + P(D) dot P(H_1 | D) + P(B) dot P(H_1 | B)
        $
        $
          = 0,5 dot 0,5 + 0,3 dot 1,0 + 0,2 dot 0,6 = 0,25 + 0,30 + 0,12 = 0,67.
        $

      - Tính xác suất để cả hai lần tung đều được mặt ngửa (do các lần tung độc lập khi đã biết loại đồng xu):
        $
          P(H_1 cap H_2) = P(F) dot P(H_1 cap H_2 | F) + P(D) dot P(H_1 cap H_2 | D) + P(B) dot P(H_1 cap H_2 | B)
        $
        $
          = 0,5 dot (0,5)^2 + 0,3 dot (1,0)^2 + 0,2 dot (0,6)^2 = 0,125 + 0,30 + 0,072 = 0,497.
        $

      - Xác suất để lần hai ngửa khi biết lần một đã ngửa là:
        $
          P(H_2 | H_1) = (P(H_1 cap H_2)) / P(H_1) = 0,497 / 0,67 = 497 / 670 approx 0,74179.
        $
      Làm tròn đến hàng phần trăm, ta được kết quả là *$0,74$*.
    ]
  )

  #tln(
    [Một nguồn phát sáng đặt tại điểm $A$ trong không khí ở độ cao $3$ dm so với mặt nước. Một cảm biến ánh sáng đặt tại điểm $B$ trong nước sâu $8$ dm dưới mặt nước. Hình chiếu vuông góc của $B$ lên mặt nước cách hình chiếu vuông góc của $A$ lên mặt nước một khoảng bằng $10$ dm. Biết rằng ánh sáng truyền từ $A$ đến $B$ theo đường gấp khúc $A P B$ ($P$ là điểm truyền qua mặt nước) sao cho thời gian truyền là nhỏ nhất. Tốc độ ánh sáng trong nước bằng $3/4$ tốc độ ánh sáng trong không khí. Tính khoảng cách từ hình chiếu vuông góc của $A$ trên mặt nước đến điểm $P$ (đơn vị: dm).],
    [4],
    loigiai: [
      #ppgiai[
        Thiết lập hệ trục tọa độ và biểu diễn thời gian truyền ánh sáng theo biến khoảng cách.
        Sử dụng đạo hàm tìm điểm cực tiểu của hàm thời gian để tìm đường đi tối ưu theo nguyên lý Fermat (khúc xạ ánh sáng).
      ]

      #align(center)[
        #cetz.canvas(length: 0.6cm, {
          import cetz.draw: *
          // Vẽ mặt nước ngăn cách hai môi trường
          line((-2, 0), (12, 0), stroke: 1.5pt + blue.lighten(20%))
          content((11.5, 0.3), [Mặt nước], anchor: "south-east")
          
          // Điểm A và hình chiếu A'
          circle((0, 3), radius: 2.5pt, fill: black)
          content((0, 3.4), $A(0; 3)$)
          line((0, 3), (0, 0), stroke: (dash: "dotted", paint: gray))
          circle((0, 0), radius: 1.5pt, fill: gray)
          content((0, 0.4), $A'$)
          
          // Điểm B và hình chiếu B'
          circle((10, -6), radius: 2.5pt, fill: black)
          content((10, -6.4), $B(10; -8)$)
          line((10, -6), (10, 0), stroke: (dash: "dotted", paint: gray))
          circle((10, 0), radius: 1.5pt, fill: gray)
          content((10, -0.4), $B'$)
          
          // Điểm P
          circle((4, 0), radius: 2.5pt, fill: red)
          content((4.2, 0.4), $P(x; 0)$)
          
          // Tia sáng truyền qua mặt nước
          line((0, 3), (4, 0), stroke: 1.2pt + orange)
          line((4, 0), (10, -6), stroke: 1.2pt + orange)
          
          // Pháp tuyến đứng tại P
          line((4, 4), (4, -8), stroke: (dash: "dashed", paint: gray))
          content((4.3, 3.5), $N$)
          content((4.3, -7.5), $N'$)
          
          // Chú thích độ dài
          content((-1.5, 1.5), [Không khí ($v_1=c$)])
          content((-1.5, -3), [Nước ($v_2=3/4 c$)])
        })
      ]

      Chọn hệ tọa độ sao cho mặt nước trùng với trục hoành $O x$, hình chiếu $A'$ trùng với gốc tọa độ $O(0; 0)$.
      - Tọa độ điểm nguồn $A$ là $(0; 3)$.
      - Tọa độ điểm cảm biến $B$ là $(10; -8)$.
      - Điểm $P$ di động trên mặt nước có tọa độ $(x; 0)$ với $0 <= x <= 10$.

      Khoảng cách trong không khí: $A P = sqrt(x^2 + 3^2) = sqrt(x^2 + 9)$ (dm). \
      Khoảng cách trong nước: $P B = sqrt((10-x)^2 + (-8)^2) = sqrt((10-x)^2 + 64)$ (dm).

      Gọi $c$ là tốc độ ánh sáng trong không khí. Tốc độ ánh sáng trong nước là $v = 3/4 c$.
      Tổng thời gian truyền ánh sáng là:
      $
        T(x) = (A P) / c + (P B) / v = (sqrt(x^2 + 9)) / c + (sqrt((10-x)^2 + 64)) / (3/4 c) = 1/c ( sqrt(x^2 + 9) + 4/3 sqrt((10-x)^2 + 64) ).
      $
      Để thời gian truyền ngắn nhất, ta tối thiểu hóa hàm số:
      $
        f(x) = sqrt(x^2 + 9) + 4/3 sqrt((10-x)^2 + 64) " với " x in [0; 10].
      $
      Tính đạo hàm của $f(x)$:
      $
        f'(x) = x / sqrt(x^2 + 9) - 4/3 dot (10 - x) / sqrt((10-x)^2 + 64).
      $
      Giải phương trình $f'(x) = 0$:
      $
        x / sqrt(x^2 + 9) = 4/3 dot (10-x) / sqrt((10-x)^2 + 64).
      $
      Nhận xét thấy $x = 4$ thỏa mãn phương trình trên:
      - Vế trái: $4 / sqrt(4^2 + 9) = 4/5$.
      - Vế phải: $4/3 dot (10-4) / sqrt((10-4)^2 + 64) = 4/3 dot 6 / sqrt(36+64) = 4/3 dot 6/10 = 8/10 = 4/5$.
      Do $f''(x) > 0$ với mọi $x in (0; 10)$ nên $x = 4$ là điểm cực tiểu duy nhất và cũng là giá trị nhỏ nhất của hàm số.

      Vậy điểm $P$ cách gốc tọa độ $A'$ một khoảng bằng *$4$* dm.
    ]
  )

  #tln(
    [Một ngôi nhà có trần phẳng dạng hình chữ nhật và mái nhà gồm hai mái nghiêng đối xứng nhau gặp nhau tại đường nóc nhà $E F$. Chiều rộng trần nhà là $A B = 8$ m, đường nóc nhà $E F$ song song với chiều dài ngôi nhà và nằm ở độ cao $3$ m so với mặt trần. Hãy tính cosin của góc nhị diện tạo bởi hai mái nghiêng của ngôi nhà này (làm tròn kết quả đến hàng phần trăm).
      #align(center)[
        #cetz.canvas(length: 0.5cm, {
          import cetz.draw: *
          
          let A = (0, 0)
          let B = (8, 0)
          let C = (11, 2.5)
          let D = (3, 2.5)
          let E = (4, 3)
          let F = (7, 5.5)
          
          // Các đường nét đứt bên trong
          line(D, A, stroke: (dash: "dashed", paint: gray))
          line(D, C, stroke: (dash: "dashed", paint: gray))
          line(D, F, stroke: (dash: "dashed", paint: gray))
          
          // Các đường nét liền bên ngoài
          line(A, B, stroke: 1pt + black)
          line(B, C, stroke: 1pt + black)
          line(E, F, stroke: 1.2pt + blue)
          line(A, E, stroke: 1pt + black)
          line(B, E, stroke: 1pt + black)
          line(C, F, stroke: 1pt + black)
          
          // Nhãn các đỉnh
          content((0, -0.4), $A$)
          content((8, -0.4), $B$)
          content((11.3, 2.7), $C$)
          content((2.7, 2.7), $D$)
          content((4, 3.4), $E$)
          content((7, 5.9), $F$)
        })
      ]],
    [0,28],
    loigiai: [
      #ppgiai[
        Xác định góc nhị diện thông qua mặt phẳng cắt vuông góc với giao tuyến chung.
        Sử dụng tam giác phẳng biểu thị thiết diện ngang của mái nhà và định lý cosin để tính góc.
      ]

      Giao tuyến của hai mặt phẳng mái nhà $(A E F D)$ và $(B E F C)$ là đường nóc nhà $E F$.
      Xét một mặt phẳng vuông góc với $E F$ cắt trần nhà và hai mái nhà tại tam giác $E A B$ có:
      - Cạnh đáy $A B = 8$ m (chiều rộng trần nhà).
      - Độ cao của đỉnh mái $E H = 3$ m với $H$ là trung điểm $A B$ ($H A = H B = 4$ m).
      - Vì $E H perp A B$ và tam giác $E A B$ cân tại $E$, góc giữa hai mái nhà chính là góc của tam giác phẳng $hat(A E B)$.

      Độ dài các cạnh bên của tam giác cân $E A B$:
      $
        E A = E B = sqrt(E H^2 + H A^2) = sqrt(3^2 + 4^2) = 5 " (m)".
      $
      Áp dụng định lý cosin trong tam giác $E A B$:
      $
        A B^2 = E A^2 + E B^2 - 2 E A dot E B cos hat(A E B)
      $
      $
        8^2 = 5^2 + 5^2 - 2 \cdot 5 \cdot 5 cos hat(A E B) <=> 64 = 50 - 50 cos hat(A E B) <=> cos hat(A E B) = -14/50 = -0,28.
      $
      Góc tạo bởi hai mặt phẳng là góc không tù, do đó cosin của góc giữa hai mái nhà bằng:
      $
        |cos hat(A E B)| = |-0,28| = 0,28.
      $
      Vậy đáp số là *$0,28$*.
    ]
  )

  #tln(
    [Một chiếc thùng gỗ đựng rượu có dạng hình tròn xoay, chiều dài thùng rượu là $10$ dm. Thiết diện dọc đi qua trục đối xứng của thùng rượu được giới hạn bởi hai đường cong parabol đối xứng nhau qua trục này. Biết rằng bán kính của hai mặt đáy thùng rượu đều bằng $3$ dm, và bán kính ở vị trí phình to nhất chính giữa thùng rượu bằng $4$ dm. Tính thể tích của thùng rượu đó (đơn vị: lít, làm tròn kết quả đến hàng đơn vị).],
    [425],
    loigiai: [
      #ppgiai[
        - Thiết lập phương trình parabol giới hạn phần trên của thùng rượu trong hệ trục tọa độ thích hợp.
        - Áp dụng công thức tính thể tích khối tròn xoay: $V = pi integral_a^b y^2 dif x$.
      ]

      Chọn hệ trục tọa độ $O x y$ sao cho trục đối xứng của thùng rượu trùng với trục hoành $O x$ và tâm đối xứng của thùng là gốc tọa độ $O$.
      - Vì chiều dài của thùng là $10$ dm nên hai đáy giới hạn bởi hai mặt phẳng $x = -5$ và $x = 5$.
      - Đường cong giới hạn phía trên là một cung parabol đối xứng qua trục tung $O y$ nên có dạng phương trình:
        $
          (P): y = a x^2 + c.
        $
      - Tại mặt cắt chính giữa ($x = 0$), bán kính phình to nhất bằng $4$ dm, do đó $y(0) = 4 => c = 4$.
      - Tại mặt đáy ($x = 5$), bán kính đáy bằng $3$ dm, do đó:
        $
          y(5) = 3 <=> a dot 5^2 + 4 = 3 <=> 25a = -1 <=> a = -1/25.
        $
      Vậy phương trình của đường cong parabol phía trên là $y = -x^2/25 + 4$.

      Thể tích của thùng rượu chính là thể tích khối tròn xoay thu được khi quay hình phẳng giới hạn bởi đường cong $(P)$, trục hoành và hai đường thẳng $x = -5$, $x = 5$ quanh trục $O x$:
      $
        V = pi integral_(-5)^5 y^2 dif x = pi integral_(-5)^5 (-x^2/25 + 4)^2 dif x
      $
      $
        = 2 pi integral_0^5 (x^4/625 - 8x^2/25 + 16) dif x
      $
      $
        = 2 pi lr([ x^5/3125 - (8x^3)/75 + 16x ])|_0^5
      $
      $
        = 2 pi ( 3125/3125 - 1000/75 + 80 ) = 2 pi ( 1 - 40/3 + 80 ) = 2 pi ( 81 - 40/3 ) = 2 pi (203/3)
      $
      $
        = (406 pi) / 3 approx 425,16 " (lít)".
      $
      Làm tròn đến hàng đơn vị là *$425$* lít.
    ]
  )

  #tln(
    [Để theo dõi số lượng ca nhiễm một bệnh truyền nhiễm tại một địa phương, người ta lập mô hình dự báo số ca nhiễm vào ngày thứ $n$ là một số hạng $u_n$ của một dãy số. Biết rằng số ca nhiễm vào ngày thứ nhất là $u_1 = 20$ ca. Kể từ ngày thứ hai, số ca nhiễm ngày hôm sau gấp đôi số ca nhiễm ngày hôm trước rồi giảm đi $15$ ca (do được chữa khỏi hoặc đưa đi cách ly), nghĩa là ta có hệ thức truy hồi $u_(n+1) = 2 u_n - 15$ với mọi $n geq 1$. Hãy tìm số ca nhiễm dự kiến vào ngày thứ 10.],
    [2575],
    loigiai: [
      #ppgiai[
        Sử dụng kỹ thuật đặt dãy số phụ để đưa hệ thức truy hồi tuyến tính bậc nhất $u_(n+1) = a u_n + b$ về dạng cấp số nhân.
      ]

      Từ hệ thức truy hồi: $u_(n+1) = 2 u_n - 15$.
      Ta tìm hằng số $alpha$ thỏa mãn:
      $
        u_(n+1) - alpha = 2(u_n - alpha) <=> u_(n+1) = 2 u_n - alpha.
      $
      Đồng nhất hệ số với hệ thức ban đầu, ta có $alpha = 15$.
      Đặt dãy số phụ $v_n = u_n - 15$ với mọi $n geq 1$. Khi đó ta có:
      $
        v_(n+1) = 2 v_n.
      $
      Do đó $(v_n)$ là cấp số nhân có số hạng đầu $v_1 = u_1 - 15 = 20 - 15 = 5$ và công bội $q = 2$.
      Số hạng tổng quát của cấp số nhân $(v_n)$ là:
      $
        v_n = v_1 q^(n-1) = 5 \cdot 2^(n-1).
      $
      Suy ra số hạng tổng quát của dãy số $(u_n)$ ban đầu là:
      $
        u_n = v_n + 15 = 5 \cdot 2^(n-1) + 15.
      $
      Với ngày thứ 10 ($n = 10$), số ca nhiễm dự kiến là:
      $
        u_(10) = 5 \cdot 2^(10-1) + 15 = 5 \cdot 2^9 + 15 = 5 \cdot 512 + 15 = 2560 + 15 = 2575.
      $
      Vậy đáp số là *$2575$*.
    ]
  )

  #tln(
    [Tìm số giá trị nguyên của tham số $m$ để hàm số bậc bốn trùng phương $f(x) = x^4 - 2(m-1)x^2 + m^2 - 8m + 12$ có đúng ba điểm cực trị và tất cả các điểm cực trị này đều nằm phía dưới trục hoành.],
    [3],
    loigiai: [
      #ppgiai[
        - Tìm điều kiện để hàm số bậc bốn trùng phương có 3 điểm cực trị.
        - Xác định tọa độ 3 điểm cực trị và đặt điều kiện cho tung độ các điểm cực trị nhỏ hơn 0.
      ]

      Ta có đạo hàm của hàm số:
      $
        f'(x) = 4x^3 - 4(m-1)x = 4x(x^2 - (m-1)).
      $
      Hàm số có đúng 3 điểm cực trị khi và chỉ khi phương trình $f'(x) = 0$ có 3 nghiệm phân biệt, tương đương với:
      $
        m - 1 > 0 <=> m > 1.
      $
      Khi đó, 3 nghiệm của $f'(x) = 0$ là $x = 0$ và $x = pm sqrt(m-1)$.
      Tọa độ 3 điểm cực trị tương ứng trên đồ thị là:
      - Điểm cực đại: $A(0; y_C)$ với $y_A = m^2 - 8m + 12$.
      - Hai điểm cực tiểu: $B(sqrt(m-1); y_B)$ và $C(-sqrt(m-1); y_C)$ với:
        $
          y_B = y_C = (m-1)^2 - 2(m-1)^2 + m^2 - 8m + 12 = -(m-1)^2 + m^2 - 8m + 12
        $
        $
          = -(m^2 - 2m + 1) + m^2 - 8m + 12 = -6m + 11.
        $

      Để tất cả các cực trị của đồ thị hàm số đều nằm phía dưới trục hoành thì tung độ của điểm cực đại và các điểm cực tiểu đều phải mang giá trị âm:
      $
        cases(y_A < 0, y_B < 0) <=> cases(m^2 - 8m + 12 < 0, -6m + 11 < 0)
      $
      - Giải bất phương trình (1): $m^2 - 8m + 12 < 0 <=> 2 < m < 6$.
      - Giải bất phương trình (2): $-6m + 11 < 0 <=> m > 11/6$.

      Giao hai tập nghiệm ta được: $2 < m < 6$.
      Kết hợp với điều kiện có 3 cực trị ($m > 1$), điều kiện cuối cùng của $m$ là $2 < m < 6$.
      Vì $m$ nhận giá trị nguyên nên $m in {3; 4; 5}$.
      Vậy có đúng *$3$* giá trị nguyên của tham số $m$ thỏa mãn yêu cầu bài toán.
    ]
  )

]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
