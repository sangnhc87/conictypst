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
  school: "ĐỀ THI THỬ LẦN 5",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 5)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "502",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  // TN questions (1 to 12)
  #tn(
    [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = x(x - 1)^2 (x + 2)^3$. Số điểm cực trị của hàm số đã cho là],
    (
      [$3$.],
      [$1$.],
      True([$2$.]),
      [$4$.],
    ),
    loigiai: [
      #ppgiai[
        Số điểm cực trị của hàm số là số nghiệm đơn hoặc nghiệm bội lẻ của phương trình đạo hàm $f'(x) = 0$.
      ]
      Ta xét phương trình đạo hàm:
      $
        f'(x) = 0 <=> x(x - 1)^2 (x + 2)^3 = 0 <=> hoac(x = 0, x = 1, x = -2).
      $
      Trong đó:
      - $x = 0$ là nghiệm đơn (bội $1$).
      - $x = 1$ là nghiệm bội chẵn (bội $2$).
      - $x = -2$ là nghiệm bội lẻ (bội $3$).
      
      Vì đạo hàm chỉ đổi dấu khi đi qua các nghiệm bội lẻ $x = 0$ và $x = -2$, nên hàm số đã cho có đúng $2$ điểm cực trị.
      Vậy chọn đáp án *C*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho ba điểm $A(1; -2; 3)$, $B(3; 0; -1)$ và $C(0; 2; 1)$. Tọa độ trọng tâm $G$ của tam giác $A B C$ là],
    (
      [$G(4/3; 0; 3)$.],
      True([$G(4/3; 0; 1)$.]),
      [$G(2; 0; 1)$.],
      [$G(4; 0; 3)$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức tọa độ trọng tâm $G$ của tam giác $A B C$:
        $
          x_G = (x_A + x_B + x_C)/3, quad y_G = (y_A + y_B + y_C)/3, quad z_G = (z_A + z_B + z_C)/3.
        $
      ]
      Thay tọa độ các điểm $A$, $B$, $C$ vào công thức ta được:
      $
        x_G = (1 + 3 + 0)/3 = 4/3, quad y_G = (-2 + 0 + 2)/3 = 0, quad z_G = (3 - 1 + 1)/3 = 1.
      $
      Vậy tọa độ trọng tâm là $G(4/3; 0; 1)$.
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Cho hàm số $y = (x + 1)/(x - 2)$. Mệnh đề nào sau đây đúng?],
    (
      [Hàm số nghịch biến trên $RR setminus {2}$.],
      [Hàm số đồng biến trên các khoảng $(-oo; 2)$ và $(2; +oo)$.],
      True([Hàm số nghịch biến trên các khoảng $(-oo; 2)$ và $(2; +oo)$.]),
      [Hàm số đồng biến trên $RR setminus {2}$.],
    ),
    loigiai: [
      #ppgiai[
        Tìm tập xác định, tính đạo hàm và xét dấu của đạo hàm trên từng khoảng xác định.
      ]
      Tập xác định của hàm số là $D = RR setminus {2}$.
      Ta có đạo hàm:
      $
        y' = (1 dot (-2) - 1 dot 1)/(x - 2)^2 = -3/(x - 2)^2 < 0, quad forall x != 2.
      $
      Vì đạo hàm luôn âm trên từng khoảng xác định nên hàm số đã cho nghịch biến trên các khoảng $(-oo; 2)$ và $(2; +oo)$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Cho tích phân $integral_1^3 f(x) dif x = 4$ và $integral_1^3 g(x) dif x = -1$. Tích phân $integral_1^3 [2f(x) - 3g(x)] dif x$ bằng],
    (
      [$5$.],
      True([$11$.]),
      [$1$.],
      [$7$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng tính chất tuyến tính của tích phân:
        $
          integral_a^b [k dot f(x) + l dot g(x)] dif x = k integral_a^b f(x) dif x + l integral_a^b g(x) dif x.
        $
      ]
      Ta có:
      $
        integral_1^3 [2f(x) - 3g(x)] dif x = 2 integral_1^3 f(x) dif x - 3 integral_1^3 g(x) dif x
        = 2 dot 4 - 3 dot (-1) = 8 + 3 = 11.
      $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Đường tiệm cận đứng của đồ thị hàm số $y = (3x + 2)/(x - 1)$ là đường thẳng],
    (
      [$x = 3$.],
      [$y = 3$.],
      True([$x = 1$.]),
      [$y = 1$.],
    ),
    loigiai: [
      #ppgiai[
        Đường thẳng $x = x_0$ là tiệm cận đứng của đồ thị hàm số $y = f(x)$ nếu ít nhất một trong các giới hạn $lim_(x -> x_0^+) f(x)$ hoặc $lim_(x -> x_0^-) f(x)$ bằng vô cực.
      ]
      Ta có:
      $
        lim_(x -> 1^+) (3x + 2)/(x - 1) = +oo " và " lim_(x -> 1^-) (3x + 2)/(x - 1) = -oo.
      $
      Do đó, đồ thị hàm số có tiệm cận đứng là đường thẳng $x = 1$.
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Một hộp chứa $6$ quả cầu màu trắng và $4$ quả cầu màu đen có kích thước giống nhau. Lấy ngẫu nhiên đồng thời $2$ quả cầu từ hộp đó. Xác suất để chọn được $2$ quả cầu khác màu là],
    (
      True([$8/15$.]),
      [$7/15$.],
      [$2/3$.],
      [$1/3$.],
    ),
    loigiai: [
      #ppgiai[
        - Tính số phần tử của không gian mẫu $n(Omega)$ (chọn 2 quả từ 10 quả).
        - Tính số cách chọn 2 quả khác màu (1 trắng và 1 đen) và tính xác suất.
      ]
      Số phần tử của không gian mẫu là:
      $
        n(Omega) = C_(10)^2 = 45.
      $
      Gọi $A$ là biến cố "chọn được 2 quả cầu khác màu". Số kết quả thuận lợi cho biến cố $A$ là:
      $
        n(A) = C_6^1 dot C_4^1 = 6 dot 4 = 24.
      $
      Xác suất của biến cố $A$ là:
      $
        P(A) = n(A)/n(Omega) = 24/45 = 8/15.
      $
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Nghiệm của phương trình $2^(x - 3) = 16$ là],
    (
      [$x = 5$.],
      [$x = 6$.],
      True([$x = 7$.]),
      [$x = 8$.],
    ),
    loigiai: [
      #ppgiai[
        Đưa phương trình về cùng cơ số: $a^(f(x)) = a^b <=> f(x) = b$.
      ]
      Ta viết lại phương trình:
      $
        2^(x - 3) = 2^4 <=> x - 3 = 4 <=> x = 7.
      $
      Chọn đáp án *C*.
    ]
  )

  #tn(
    [Họ nguyên hàm của hàm số $f(x) = e^x - sin x$ là],
    (
      [$e^x - cos x + C$.],
      True([$e^x + cos x + C$.]),
      [$-e^x - cos x + C$.],
      [$e^x + sin x + C$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng các công thức tìm nguyên hàm cơ bản.
      ]
      Áp dụng công thức nguyên hàm:
      $
        integral (e^x - sin x) dif x = e^x + cos x + C.
      $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho mặt phẳng $(P): 2x - y + 2z - 5 = 0$. Khoảng cách từ điểm $M(1; -2; 1)$ đến mặt phẳng $(P)$ bằng],
    (
      True([$1/3$.]),
      [$1$.],
      [$2/3$.],
      [$2$.],
    ),
    loigiai: [
      #ppgiai[
        Áp dụng công thức tính khoảng cách từ điểm $M(x_0; y_0; z_0)$ đến mặt phẳng $(P): A x + B y + C z + D = 0$:
        $
          d(M, (P)) = (|A x_0 + B y_0 + C z_0 + D|)/sqrt(A^2 + B^2 + C^2).
        $
      ]
      Thay tọa độ $M(1; -2; 1)$ vào công thức ta được:
      $
        d(M, (P)) = (|2 dot 1 - (-2) + 2 dot 1 - 5|)/sqrt(2^2 + (-1)^2 + 2^2)
        = (|2 + 2 + 2 - 5|)/sqrt(9) = 1/3.
      $
      Chọn đáp án *A*.
    ]
  )

  #tn(
    [Cho cấp số cộng $(u_n)$ có số hạng đầu $u_1 = 3$ và công sai $d = 2$. Số hạng $u_5$ bằng],
    (
      [$9$.],
      True([$11$.]),
      [$13$.],
      [$15$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức số hạng tổng quát của cấp số cộng: $u_n = u_1 + (n - 1)d$.
      ]
      Ta có số hạng thứ 5 là:
      $
        u_5 = u_1 + 4d = 3 + 4 dot 2 = 3 + 8 = 11.
      $
      Chọn đáp án *B*.
    ]
  )

  #tn(
    [Tập xác định của hàm số $y = ln(x^2 - 3x + 2)$ là],
    (
      [$[1; 2]$.],
      [$(1; 2)$.],
      [$(-oo; 1] union [2; +oo)$.],
      True([$(-oo; 1) union (2; +oo)$.]),
    ),
    loigiai: [
      #ppgiai[
        Hàm số lôgarit $y = ln[u(x)]$ xác định khi và chỉ khi $u(x) > 0$.
      ]
      Điều kiện xác định của hàm số là:
      $
        x^2 - 3x + 2 > 0 <=> (x - 1)(x - 2) > 0 <=> hoac(x < 1, x > 2).
      $
      Do đó tập xác định của hàm số là $D = (-oo; 1) union (2; +oo)$.
      Chọn đáp án *D*.
    ]
  )

  #tn(
    [Trong không gian $O x y z$, cho hai vectơ $vect(u) = (1; 1; 0)$ và $vect(v) = (0; 1; 1)$. Góc giữa hai vectơ $vect(u)$ và $vect(v)$ bằng],
    (
      [$30^circ$.],
      [$45^circ$.],
      True([$60^circ$.]),
      [$90^circ$.],
    ),
    loigiai: [
      #ppgiai[
        Sử dụng công thức tính cosin của góc giữa hai vectơ:
        $
          cos(vect(u), vect(v)) = (vect(u) \cdot vect(v))/(|vect(u)| \cdot |vect(v)|).
        $
      ]
      Ta có:
      - Tích vô hướng: $vect(u) dot vect(v) = 1 dot 0 + 1 dot 1 + 0 dot 1 = 1$.
      - Độ dài các vectơ: $|vect(u)| = sqrt(1^2 + 1^2 + 0^2) = sqrt(2)$, $|vect(v)| = sqrt(0^2 + 1^2 + 1^2) = sqrt(2)$.
      Suy ra:
      $
        cos(vect(u), vect(v)) = 1/(sqrt(2) dot sqrt(2)) = 1/2.
      $
      Do đó góc giữa hai vectơ bằng $60^circ$.
      Chọn đáp án *C*.
    ]
  )

  // PHẦN II
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

  // DS questions (1 to 4)
  #ds(
    [Cho hàm số $y = x^3 - 3x^2 + m$ với $m$ là tham số thực.],
    (
      True([Với $m = 0$, đồ thị hàm số tiếp xúc với trục hoành.]),
      True([Với $m = 4$, giá trị cực tiểu của hàm số bằng $0$.]),
      True([Có đúng $3$ giá trị nguyên của $m$ để đồ thị hàm số cắt trục hoành tại đúng $3$ điểm phân biệt.]),
      [Giá trị lớn nhất của hàm số trên đoạn $[-1; 3]$ là $M = m + 4$.],
    ),
    loigiai: [
      #ppgiai[
        - Tìm các cực trị của hàm số.
        - Khảo sát sự tiếp xúc của đồ thị với trục hoành, số nghiệm của phương trình $y = 0$, và tìm cực trị trên đoạn $[-1; 3]$.
      ]
      Ta có đạo hàm:
      $
        y' = 3x^2 - 6x = 3x(x - 2).
      $
      Cho $y' = 0 <=> x = 0$ hoặc $x = 2$.
      
      *a) Xét trường hợp $m = 0$:*
      Khi $m = 0$, hàm số là $y = x^3 - 3x^2$.
      Ta thấy $y(0) = 0$ và $y'(0) = 0$.
      Do đó, đồ thị hàm số tiếp xúc với trục hoành tại điểm cực đại $(0; 0)$.
      Ý a) *ĐÚNG*.

      *b) Xét trường hợp $m = 4$:*
      Điểm cực tiểu là $x = 2$.
      Giá trị cực tiểu tương ứng là:
      $
        y_("CT") = y(2) = 2^3 - 3 dot 2^2 + m = m - 4.
      $
      Với $m = 4$, ta được $y_("CT") = 4 - 4 = 0$.
      Ý b) *ĐÚNG*.

      *c) Số giao điểm với trục hoành:*
      Đồ thị hàm số cắt trục hoành tại đúng $3$ điểm phân biệt khi và chỉ khi phương trình $x^3 - 3x^2 + m = 0$ có $3$ nghiệm phân biệt.
      Điều này tương đương với cực đại và cực tiểu nằm về hai phía của trục hoành:
      $
        y_("CĐ") dot y_("CT") < 0 <=> m dot (m - 4) < 0 <=> 0 < m < 4.
      $
      Vì $m$ là số nguyên nên $m in {1; 2; 3}$. Có đúng $3$ giá trị nguyên thỏa mãn.
      Ý c) *ĐÚNG*.

      *d) Giá trị lớn nhất trên đoạn $[-1; 3]$:*
      Xét hàm số trên đoạn $[-1; 3]$. Các giá trị đặc biệt là:
      - $y(-1) = (-1)^3 - 3(-1)^2 + m = m - 4$.
      - $y(0) = m$.
      - $y(2) = m - 4$.
      - $y(3) = 3^3 - 3 dot 3^2 + m = m$.
      So sánh các giá trị trên, ta thấy giá trị lớn nhất của hàm số trên đoạn $[-1; 3]$ là $M = m$.
      Mệnh đề nói $M = m + 4$ là sai.
      Ý d) *SAI*.
    ]
  )

  #ds(
    [Trong không gian tọa độ $O x y z$ (đơn vị đo là mét), một thiết bị bay không người lái (drone) cất cánh từ điểm $A(1; 1; 2)$ và bay theo một đường thẳng có hướng không đổi được xác định bởi vectơ chỉ phương $vect(u) = (2; 1; -1)$. Cho biết một vùng quét bảo vệ radar phẳng được biểu diễn bằng phương trình mặt phẳng $(P): x + y + 2z - 11 = 0$.],
    (
      True([Đường thẳng quỹ đạo bay của drone đi qua điểm $M(3; 2; 1)$.]),
      True([Vectơ chỉ phương của đường thẳng quỹ đạo bay là $vect(u) = (2; 1; -1)$.]),
      True([Drone cắt mặt phẳng radar $(P)$ tại điểm $H$ có tọa độ là $H(11; 6; -3)$.]),
      [Khoảng cách từ điểm xuất phát $A(1; 1; 2)$ đến mặt phẳng radar $(P)$ bằng $3 sqrt(6)$ mét.],
    ),
    loigiai: [
      #ppgiai[
        - Thiết lập phương trình tham số đường thẳng chứa đường bay của drone.
        - Kiểm tra xem điểm $M$ có thuộc đường thẳng không.
        - Tìm giao điểm của đường thẳng và mặt phẳng.
        - Tính khoảng cách từ điểm xuất phát đến mặt phẳng.
      ]
      Phương trình tham số của đường thẳng quỹ đạo bay của drone đi qua $A(1; 1; 2)$ có vectơ chỉ phương $vect(u) = (2; 1; -1)$ là:
      $
        d: heva(x = 1 + 2t, y = 1 + t, z = 2 - t) quad (t >= 0).
      $

      *a) Kiểm tra điểm $M(3; 2; 1)$:*
      Thay tọa độ điểm $M$ vào phương trình tham số:
      $
        heva(3 = 1 + 2t, 2 = 1 + t, 1 = 2 - t) <=> t = 1 >= 0.
      $
      Do đó, quỹ đạo bay đi qua $M$ (tại thời điểm $t = 1$).
      Ý a) *ĐÚNG*.

      *b) Vectơ chỉ phương:*
      Theo giả thiết, drone bay theo một hướng xác định bởi vectơ $vect(u) = (2; 1; -1)$.
      Ý b) *ĐÚNG*.

      *c) Tìm giao điểm $H$:*
      Thay các biểu thức $x, y, z$ theo $t$ từ phương trình đường thẳng vào phương trình mặt phẳng $(P)$:
      $
        (1 + 2t) + (1 + t) + 2(2 - t) - 11 = 0
        <=> t - 5 = 0 <=> t = 5.
      $
      Với $t = 5$, ta nhận được tọa độ giao điểm $H$:
      $
        x_H = 1 + 2 dot 5 = 11, quad y_H = 1 + 5 = 6, quad z_H = 2 - 5 = -3.
      $
      Vậy drone đi qua vùng quét tại điểm $H(11; 6; -3)$.
      Ý c) *ĐÚNG*.

      *d) Tính khoảng cách từ $A(1; 1; 2)$ đến mặt phẳng $(P)$:*
      Áp dụng công thức khoảng cách:
      $
        d(A, (P)) = (|1 + 1 + 2 dot 2 - 11|)/sqrt(1^2 + 1^2 + 2^2) = (|-5|)/sqrt(6) = 5/sqrt(6) = (5 sqrt(6))/6 " (mét)".
      $
      Mệnh đề nói khoảng cách bằng $3 sqrt(6)$ là sai.
      Ý d) *SAI*.
    ]
  )

  #ds(
    [Một học sinh tham gia trò chơi chọn ngẫu nhiên các câu hỏi kiểm tra từ hai chiếc hộp. Hộp I chứa $6$ câu hỏi dễ và $4$ câu hỏi khó. Hộp II chứa $7$ câu hỏi dễ và $3$ câu hỏi khó. Để quyết định chọn hộp nào, học sinh này gieo một con xúc xắc cân đối và đồng chất. Nếu số chấm xuất hiện chia hết cho $3$ thì chọn câu hỏi từ Hộp I, ngược lại thì chọn từ Hộp II. Sau đó, từ hộp đã chọn, học sinh rút ngẫu nhiên ra $1$ câu hỏi.],
    (
      True([Xác suất để học sinh chọn được câu hỏi từ Hộp I là $1/3$.]),
      True([Xác suất để học sinh chọn Hộp II và nhận được một câu hỏi khó là $0,2$.]),
      True([Xác suất để học sinh chọn được một câu hỏi dễ bằng $2/3$.]),
      [Giả sử học sinh đã chọn được câu hỏi khó, xác suất để câu hỏi đó thuộc Hộp I bằng $0,5$.],
    ),
    loigiai: [
      #ppgiai[
        - Xác định xác suất chọn các hộp dựa trên kết quả gieo xúc xắc.
        - Sử dụng công thức nhân xác suất và công thức xác suất đầy đủ để tính xác suất rút được câu hỏi dễ, khó.
        - Sử dụng công thức Bayes để tính xác suất có điều kiện.
      ]
      Gọi các biến cố:
      - $B_1$: "Học sinh chọn Hộp I".
      - $B_2$: "Học sinh chọn Hộp II".
      - $E$: "Học sinh chọn được câu hỏi dễ".
      - $H$: "Học sinh chọn được câu hỏi khó".

      *a) Xác suất chọn các hộp:*
      Con xúc xắc có 6 mặt từ 1 đến 6. Các mặt có số chấm chia hết cho 3 là $3$ và $6$ (có 2 mặt).
      $
        P(B_1) = 2/6 = 1/3.
      $
      Suy ra xác suất chọn Hộp II là:
      $
        P(B_2) = 1 - P(B_1) = 4/6 = 2/3.
      $
      Do đó ý a) *ĐÚNG*.

      *b) Xác suất chọn Hộp II và được câu hỏi khó:*
      Xác suất để chọn được câu hỏi khó từ Hộp II là $P(H | B_2) = 3/10 = 0,3$.
      Xác suất đồng thời xảy ra là:
      $
        P(B_2 inter H) = P(B_2) \cdot P(H | B_2) = 2/3 \cdot 3/10 = 2/10 = 0,2.
      $
      Do đó ý b) *ĐÚNG*.

      *c) Xác suất chọn được câu hỏi dễ:*
      Ta có các xác suất có điều kiện:
      $
        P(E | B_1) = 6/10 = 0,6; quad P(E | B_2) = 7/10 = 0,7.
      $
      Áp dụng công thức xác suất đầy đủ:
      $
        P(E) = P(B_1) \cdot P(E | B_1) + P(B_2) \cdot P(E | B_2)
        = 1/3 \cdot 6/10 + 2/3 \cdot 7/10 = 6/30 + 14/30 = 20/30 = 2/3.
      $
      Do đó ý c) *ĐÚNG*.

      *d) Xác suất có điều kiện:*
      Xác suất để chọn được câu hỏi khó là:
      $
        P(H) = 1 - P(E) = 1 - 2/3 = 1/3.
      $
      Xác suất để câu hỏi khó này thuộc Hộp I được tính bằng công thức Bayes:
      $
        P(B_1 | H) = (P(B_1 inter H))/P(H) = (P(B_1) \cdot P(H | B_1))/P(H).
      $
      Trong đó $P(H | B_1) = 4/10 = 0,4$. Do đó:
      $
        P(B_1 | H) = (1/3 \cdot 0,4)/(1/3) = 0,4.
      $
      Mệnh đề nói xác suất bằng $0,5$ là sai.
      Ý d) *SAI*.
    ]
  )

  #ds(
    [Khảo sát thời gian tự học trong một tuần (đơn vị: giờ) của một nhóm gồm $50$ học sinh lớp 12, người ta thu được bảng số liệu ghép nhóm sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [Thời gian tự học (giờ)], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$],
          [Số học sinh], [8], [12], [18], [10], [2],
        )
      ]
    ],
    (
      True([Số học sinh tự học từ $15$ đến dưới $20$ giờ mỗi tuần chiếm $36\%$ tổng số học sinh được khảo sát.]),
      [Số trung bình của mẫu số liệu ghép nhóm này bằng $15,7$ giờ.],
      True([Nhóm chứa trung vị của mẫu số liệu ghép nhóm là nhóm $[15; 20)$.]),
      True([Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm này bằng $11,875$.]),
    ),
    loigiai: [
      #ppgiai[
        - Sử dụng công thức tính tỉ lệ phần trăm.
        - Xác định giá trị đại diện và tính số trung bình.
        - Tìm nhóm chứa trung vị và tính trung vị.
        - Tìm nhóm chứa tứ phân vị $Q_1$ và tính toán giá trị tương ứng.
      ]

      *a) Tỉ lệ phần trăm nhóm $[15; 20)$:*
      Số học sinh thuộc nhóm này là $18$ học sinh.
      Tỉ lệ phần trăm tương ứng là:
      $
        18/50 \cdot 100\% = 36\%.
      $
      Ý a) *ĐÚNG*.

      *b) Tính số trung bình:*
      Giá trị đại diện của các nhóm lần lượt là: $7,5$; $12,5$; $17,5$; $22,5$; $27,5$.
      Thời gian tự học trung bình của mỗi học sinh là:
      $
        bar(x) = (8 \cdot 7,5 + 12 \cdot 12,5 + 18 \cdot 17,5 + 10 \cdot 22,5 + 2 \cdot 27,5)/50
        = (60 + 150 + 315 + 225 + 55)/50 = 805/50 = 16,1 " (giờ)".
      $
      Số trung bình là $16,1$, không phải $15,7$.
      Ý b) *SAI*.

      *c) Tìm nhóm chứa trung vị:*
      Cỡ mẫu $n = 50$.
      Tần số tích lũy của các nhóm lần lượt là: $c f_1 = 8$, $c f_2 = 20$, $c f_3 = 38$, $c f_4 = 48$, $c f_5 = 50$.
      Vì $n/2 = 25$ và $c f_2 = 20 < 25 <= c f_3 = 38$, nên nhóm chứa trung vị là nhóm thứ ba, tức là nhóm $[15; 20)$.
      Ý c) *ĐÚNG*.

      *d) Tính tứ phân vị thứ nhất $Q_1$:*
      Để tìm $Q_1$, ta cần tính giá trị ở vị trí thứ $n/4 = 50/4 = 12,5$.
      Vì $c f_1 = 8 < 12,5 <= c f_2 = 20$, nên nhóm chứa $Q_1$ là nhóm thứ hai $[10; 15)$.
      Các thông số của nhóm này:
      - Cận dưới: $L = 10$.
      - Tần số nhóm chứa $Q_1$: $f = 12$.
      - Tần số tích lũy của nhóm trước: $c f_1 = 8$.
      - Độ rộng nhóm: $h = 5$.
      Áp dụng công thức tính $Q_1$ ghép nhóm:
      $
        Q_1 = L + (n/4 - c f_1)/f \cdot h = 10 + (12,5 - 8)/12 \cdot 5 = 10 + 4,5/12 \cdot 5 = 10 + 1,875 = 11,875.
      $
      Ý d) *ĐÚNG*.
    ]
  )

  // PHẦN III
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  // TLN questions (1 to 6)
  #tln(
    [Một bệnh truyền nhiễm có tỉ lệ mắc bệnh trong cộng đồng là $0,5\%$. Một xét nghiệm chẩn đoán y khoa có độ nhạy (xác suất người mắc bệnh có kết quả dương tính) là $99\%$, và tỉ lệ dương tính giả (xác suất người không mắc bệnh nhưng có kết quả dương tính) là $1\%$. Một người được chọn ngẫu nhiên trong cộng đồng làm xét nghiệm và nhận kết quả dương tính. Tính xác suất để người đó thực sự mắc bệnh. (Làm tròn kết quả đến hàng phần trăm).],
    [0,33],
    loigiai: [
      #ppgiai[
        - Định nghĩa các biến cố liên quan đến tình trạng bệnh và kết quả xét nghiệm.
        - Tính xác suất đầy đủ để có kết quả dương tính.
        - Dùng công thức Bayes để tính xác suất mắc bệnh khi đã biết kết quả dương tính.
      ]
      Gọi:
      - $D$ là biến cố "Người được chọn thực sự mắc bệnh".
      - $D'$ là biến cố "Người được chọn không mắc bệnh".
      - $+$ là biến cố "Xét nghiệm cho kết quả dương tính".

      Theo giả thiết, ta có các xác suất:
      - $P(D) = 0,5\% = 0,005 => P(D') = 0,995$.
      - $P(+ | D) = 99\% = 0,99$ (độ nhạy).
      - $P(+ | D') = 1\% = 0,01$ (tỉ lệ dương tính giả).

      Xác suất để một người nhận được kết quả dương tính được tính theo công thức xác suất đầy đủ:
      $
        P(+) = P(D) \cdot P(+ | D) + P(D') \cdot P(+ | D')
        = 0,005 \cdot 0,99 + 0,995 \cdot 0,01
        = 0,00495 + 0,00995 = 0,0149.
      $

      Áp dụng công thức Bayes, xác suất người này thực sự mắc bệnh khi biết kết quả xét nghiệm dương tính là:
      $
        P(D | +) = (P(D) \cdot P(+ | D))/P(+) = 0,00495/0,0149 = 495/1490 = 99/298 \approx 0,3322.
      $
      Làm tròn đến hàng phần trăm, ta được kết quả là *$0,33$*.
    ]
  )

  #tln(
    [Một hãng hàng không đang khai thác đường bay với loại máy bay có tối đa $150$ ghế hành khách. Nếu giá bán của mỗi vé là $2$ triệu đồng thì hãng bán được toàn bộ $150$ vé. Qua khảo sát thị trường, hãng thấy rằng cứ mỗi lần tăng giá vé thêm $100$ nghìn đồng ($0,1$ triệu đồng) thì số lượng vé bán được cho chuyến bay sẽ giảm đi $5$ vé. Hỏi hãng hàng không nên bán vé với giá bao nhiêu triệu đồng để thu được doanh thu từ chuyến bay đạt cực đại?],
    [2,5],
    loigiai: [
      #ppgiai[
        - Gọi biến $x$ biểu thị số lần tăng giá vé (mỗi lần $0,1$ triệu đồng).
        - Biểu diễn giá vé và số lượng vé bán được theo $x$.
        - Thiết lập hàm số doanh thu $R(x)$ theo $x$ và tìm cực trị của hàm số đó.
      ]
      Gọi $x$ là số lần tăng giá vé thêm $100$ nghìn đồng ($x >= 0$, $x$ không nhất thiết là số nguyên).
      
      Khi tăng $x$ lần thì:
      - Giá của một chiếc vé mới sẽ là: $P = 2 + 0,1x$ (triệu đồng).
      - Số lượng vé bán được giảm đi $5x$ vé, nên số vé bán được là: $N = 150 - 5x$ (vé). Điều kiện $150 - 5x >= 0 <=> x <= 30$.

      Doanh thu thu được từ chuyến bay là:
      $
        R(x) = P \cdot N = (2 + 0,1x)(150 - 5x) = 300 - 10x + 15x - 0,5x^2 = -0,5x^2 + 5x + 300.
      $
      Đây là một hàm số bậc hai của biến $x$ trên đoạn $[0; 30]$.
      Đồ thị hàm số là một parabol có bề lõm quay xuống dưới, nên giá trị lớn nhất đạt được tại đỉnh của parabol:
      $
        x = -b/(2a) = -5/(2 \cdot (-0,5)) = 5 " (thỏa mãn điều kiện)".
      $

      Khi $x = 5$, giá vé của mỗi chiếc vé để tối đa hóa doanh thu là:
      $
        P = 2 + 0,1 \cdot 5 = 2,5 " (triệu đồng)".
      $
      Khi đó doanh thu tối đa đạt được là $R(5) = -0,5(25) + 25 + 300 = 312,5$ triệu đồng.
      Vậy đáp số là *$2,5$*.
    ]
  )

  #tln(
    [Một đường hầm giao thông có mặt cắt ngang dạng một hình parabol. Chiều rộng của mặt đường dưới đáy hầm là $8$ mét, chiều cao lớn nhất của đường hầm tính từ mặt đường lên đỉnh hầm là $6$ mét. Tính diện tích mặt cắt ngang của đường hầm đó (đơn vị: mét vuông).],
    [32],
    fig: cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      // Vẽ mặt đường
      line((-5, 0), (5, 0), stroke: 1.5pt + luma(100))
      // Vẽ kích thước chiều rộng
      line((-4, -0.6), (4, -0.6), mark: (left: "<|", right: "|>"), stroke: 0.8pt + blue)
      content((0, -1.2), $8 "m"$, fill: blue)
      
      // Vẽ chiều cao
      line((0, 0), (0, 6), stroke: (dash: "dashed", paint: red))
      content((0.6, 3), $6 "m"$, fill: red)
      
      // Vẽ Parabol hầm
      let pts = ()
      for i in range(-20, 21) {
        let x = i / 5.0
        let y = -0.375 * x * x + 6
        pts.push((x, y))
      }
      line(..pts, stroke: 1.5pt + black)
      
      // Đánh dấu các điểm mút đường hầm
      circle((-4, 0), radius: 2.5pt, fill: black)
      circle((4, 0), radius: 2.5pt, fill: black)
      circle((0, 6), radius: 2.5pt, fill: black)
      
      content((-4, 0.4), $A$)
      content((4, 0.4), $B$)
      content((0, 6.4), $C$)
    }),
    fig-pos: "right",
    fig-width: 40%,
    loigiai: [
      #ppgiai[
        - Chọn hệ trục tọa độ phù hợp (ví dụ gốc tọa độ $O$ trùng với trung điểm mặt đường).
        - Xác định phương trình của đường parabol dựa vào các điểm đặc biệt.
        - Diện tích mặt cắt ngang của đường hầm chính là tích phân của hàm số parabol giới hạn bởi mặt đường.
      ]
      Chọn hệ trục tọa độ $O x y$ sao cho gốc tọa độ $O$ nằm ở trung điểm mặt đường, trục hoành $O x$ nằm trùng với mặt đường, trục tung $O y$ đi qua đỉnh của đường hầm parabol.
      
      Theo đề bài:
      - Chiều rộng đường hầm là $8$ m nên chân hầm cắt trục hoành tại hai điểm là $A(-4; 0)$ và $B(4; 0)$.
      - Chiều cao hầm là $6$ m nên đỉnh hầm nằm trên trục tung có tọa độ là $C(0; 6)$.
      
      Phương trình đường parabol có dạng $y = a x^2 + c$ (do tính đối xứng qua trục $O y$).
      Vì parabol đi qua $C(0; 6)$ nên ta có:
      $
        c = 6.
      $
      Parabol đi qua điểm $B(4; 0)$ nên ta có:
      $
        a \cdot 4^2 + 6 = 0 <=> 16a = -6 <=> a = -3/8 = -0,375.
      $
      Như vậy phương trình của đường parabol là:
      $
        y = -3/8 x^2 + 6.
      $
      
      Diện tích mặt cắt ngang của đường hầm là diện tích hình phẳng giới hạn bởi parabol và trục hoành:
      $
        S = integral_(-4)^4 (-3/8 x^2 + 6) dif x
        = 2 integral_0^4 (-3/8 x^2 + 6) dif x
        = 2 \cdot lr((-1/8 x^3 + 6x) |)_0^4.
      $
      Thay cận vào tính toán:
      $
        S = 2 \cdot [(-1/8 \cdot 4^3 + 6 \cdot 4) - 0] = 2 \cdot [-8 + 24] = 2 \cdot 16 = 32 " (m"^2")".
      $
      Vậy diện tích mặt cắt ngang đường hầm là $32$ mét vuông.
    ]
  )

  #tln(
    [Tính thể tích $V$ của vật thể nằm giữa hai mặt phẳng $x = 0$ và $x = 3$. Biết rằng khi cắt vật thể bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ $x$ ($0 <= x <= 3$), thiết diện thu được là một hình vuông có độ dài cạnh bằng $x sqrt(3 - x)$.],
    [6,75],
    loigiai: [
      #ppgiai[
        - Tính diện tích của thiết diện vuông góc tại vị trí $x$: $S(x) = [a(x)]^2$ với $a(x)$ là độ dài cạnh hình vuông.
        - Áp dụng công thức tính thể tích vật thể bằng tích phân diện tích thiết diện: $V = integral_a^b S(x) dif x$.
      ]
      Diện tích thiết diện tại điểm có hoành độ $x$ là diện tích hình vuông cạnh $x sqrt(3 - x)$:
      $
        S(x) = (x sqrt(3 - x))^2 = x^2(3 - x) = 3x^2 - x^3.
      $
      Thể tích của vật thể là:
      $
        V = integral_0^3 S(x) dif x = integral_0^3 (3x^2 - x^3) dif x
        = lr((x^3 - x^4/4) |)_0^3.
      $
      Thay cận:
      $
        V = (3^3 - 3^4/4) - 0 = 27 - 81/4 = 27 - 20,25 = 6,75.
      $
      Vậy thể tích cần tìm là *$6,75$*.
    ]
  )

  #tln(
    [Một khách hàng vay ngân hàng số tiền $500$ triệu đồng để mua nhà với lãi suất cố định là $0,8\%$ mỗi tháng theo hình thức lãi kép. Kể từ tháng thứ nhất sau khi vay (tức đúng một tháng sau ngày nhận tiền vay), mỗi tháng người đó đều trả cho ngân hàng một số tiền cố định là $m$ triệu đồng. Biết rằng sau đúng $5$ năm (tương ứng với $60$ tháng) kể từ khi bắt đầu trả, người đó đã hoàn trả hết hoàn toàn cả tiền gốc và tiền lãi. Hãy tính số tiền trả cố định hàng tháng $m$ (triệu đồng) mà người đó phải thanh toán (làm tròn kết quả đến hàng phần trăm).],
    [10,52],
    loigiai: [
      #ppgiai[
        - Gọi $A = 500$ là số tiền gốc, $r = 0,8\% = 0,008$ là lãi suất hàng tháng, $n = 60$ là số kỳ trả (tháng).
        - Thiết lập mối quan hệ nợ sau mỗi tháng và lập công thức tính số tiền trả góp hàng tháng:
          $
            m = (A \cdot r \cdot (1 + r)^n)/((1 + r)^n - 1).
          $
      ]
      Sau mỗi tháng, dư nợ còn lại trong tài khoản được tính như sau:
      - Cuối tháng thứ 1 (sau khi trả tiền $m$): $A_1 = A(1 + r) - m$.
      - Cuối tháng thứ 2 (sau khi trả tiền $m$): $A_2 = A_1(1 + r) - m = A(1 + r)^2 - m(1 + r) - m$.
      - Quy nạp tổng quát sau tháng thứ $n$:
      $
        A_n = A(1 + r)^n - m \cdot ((1 + r)^n - 1)/r.
      $
      Vì sau $n = 60$ tháng khách hàng trả hết toàn bộ dư nợ, tức là $A_60 = 0$, ta có:
      $
        A(1 + r)^n = m \cdot ((1 + r)^n - 1)/r
        <=> m = (A \cdot r \cdot (1 + r)^n)/((1 + r)^n - 1).
      $
      Thay số liệu cụ thể vào công thức:
      - $A = 500$ triệu đồng.
      - $r = 0,008$.
      - $n = 60$.
      
      Ta được:
      $
        m = (500 \cdot 0,008 \cdot (1,008)^60)/((1,008)^60 - 1)
        = (4 \cdot (1,008)^60)/((1,008)^60 - 1).
      $
      Tính toán giá trị số:
      - $(1,008)^60 \approx 1,613482755$.
      - $m \approx (4 \cdot 1,613482755)/(1,613482755 - 1) = 6,45393102/0,613482755 \approx 10,5199$.
      Làm tròn đến hàng phần trăm (hai chữ số sau dấu phẩy), ta được $m \approx 10,52$ triệu đồng.
      Vậy đáp số là *$10,52$*.
    ]
  )

  #tln(
    [Trong không gian tọa độ $O x y z$, cho hai đường thẳng chéo nhau $d_1$ và $d_2$ lần lượt có phương trình đối xứng là:
      $
        d_1: (x - 1)/1 = (y - 1)/(-2), quad z = 1
      $
      và
      $
        d_2: (x - 2)/1 = (z - 2)/(-1), quad y = 3.
      $
      Tính khoảng cách giữa hai đường thẳng đã cho.],
    [2],
    loigiai: [
      #ppgiai[
        - Xác định các điểm đi qua và vectơ chỉ phương tương ứng của hai đường thẳng $d_1$ và $d_2$.
        - Tính tích có hướng $[vect(u_1), vect(u_2)]$ của hai vectơ chỉ phương để làm vectơ pháp tuyến của hai đường thẳng.
        - Khoảng cách giữa hai đường thẳng chéo nhau được tính bằng:
          $
            d(d_1, d_2) = (|[vect(u_1), vect(u_2)] \cdot vect(M_1 M_2)|)/|[vect(u_1), vect(u_2)]|.
          $
      ]
      *Bước 1: Xác định điểm và vectơ chỉ phương:*
      - Đường thẳng $d_1$ đi qua điểm $M_1(1; 1; 1)$ và có một vectơ chỉ phương là $vect(u_1) = (1; -2; 0)$.
      - Đường thẳng $d_2$ đi qua điểm $M_2(2; 3; 2)$ và có một vectơ chỉ phương là $vect(u_2) = (1; 0; -1)$.
      
      Ta có:
      $
        vect(M_1 M_2) = (2 - 1; 3 - 1; 2 - 1) = (1; 2; 1).
      $

      *Bước 2: Tính tích có hướng:*
      Tích có hướng của $vect(u_1)$ và $vect(u_2)$ là:
      $
        vect(n) = [vect(u_1), vect(u_2)] = ((-2) \cdot (-1) - 0 \cdot 0; 0 \cdot 1 - 1 \cdot (-1); 1 \cdot 0 - (-2) \cdot 1) = (2; 1; 2).
      $
      Độ dài của tích có hướng là:
      $
        |vect(n)| = sqrt(2^2 + 1^2 + 2^2) = sqrt(9) = 3.
      $

      *Bước 3: Tính khoảng cách:*
      Tích vô hướng giữa $vect(n)$ và $vect(M_1 M_2)$ là:
      $
        vect(n) \cdot vect(M_1 M_2) = 2 \cdot 1 + 1 \cdot 2 + 2 \cdot 1 = 2 + 2 + 2 = 6.
      $
      Khoảng cách giữa hai đường thẳng $d_1$ và $d_2$ là:
      $
        d(d_1, d_2) = (|vect(n) \cdot vect(M_1 M_2)|)/|vect(n)| = 6/3 = 2.
      $
      Vậy khoảng cách giữa hai đường thẳng đã cho bằng $2$.
    ]
  )
]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
