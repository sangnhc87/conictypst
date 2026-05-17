#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.1"
#import "../bbt.typ": *
#import "../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ THI THỬ LẦN 3",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "0619",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════
// PHẦN I — Trắc nghiệm nhiều phương án lựa chọn
// ═══════════════════════════════════════════════════════════
#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  count: 12,
)

#tn(
  [Họ nguyên hàm của hàm số $f(x) = (2x - 4)/(x^2 - 4x + 5)$ là],
  (
    [$1/2 ln(x^2 - 4x + 5) + C$.],
    [$-ln(x^2 - 4x + 5) + C$.],
    True([$ln(x^2 - 4x + 5) + C$.]),
    [$2ln(x^2 - 4x + 5) + C$.],
  ),
  loigiai: [
    #ppgiai[
      Đặt $u = x^2 - 4x + 5$ thì $dif u = (2x - 4) dif x$.
    ]

    Khi đó:
    $
      integral (2x - 4)/(x^2 - 4x + 5) dif x
      = integral 1/u dif u
      = ln|u| + C.
    $
    Vì $(x - 2)^2 + 1 > 0$ với mọi $x$, suy ra:
    $
      integral (2x - 4)/(x^2 - 4x + 5) dif x = ln(x^2 - 4x + 5) + C.
    $
    Vậy chọn đáp án *C*.
  ],
)

#tn(
  [Điểm mốt của mẫu số liệu ghép nhóm trong bảng sau gần nhất với giá trị nào?
    #align(center)[
      #table(
        columns: 6,
        align: center,
        stroke: 0.5pt + black,
        [Khoảng], [$[0;5)$], [$[5;10)$], [$[10;15)$], [$[15;20)$], [$[20;25)$],

        [Tần số], [3], [8], [12], [6], [1],
      )
    ]],
  (
    [$10,5$.],
    True([$12$.]),
    [$12,5$.],
    [$13$.],
  ),
  loigiai: [
    #ppgiai[
      Lớp có tần số lớn nhất là $[10;15)$ nên đây là lớp chứa mốt.
      Áp dụng công thức mốt của mẫu số liệu ghép nhóm.
    ]

    Ta có:
    - Cận dưới lớp mốt: $L = 10$.
    - Độ rộng lớp: $h = 5$.
    - $d_1 = 12 - 8 = 4$.
    - $d_2 = 12 - 6 = 6$.

    Vậy:
    $
      M_o = L + d_1/(d_1 + d_2) dot h = 10 + 4/10 dot 5 = 12.
    $
    Chọn đáp án *B*.
  ],
)

#tn(
  [Trong không gian $O x y z$, cho hai điểm $A(-1; 2; 3)$ và $B(5; -4; 0)$. Điểm $M$ thuộc đoạn $A B$ sao cho $A M = 2M B$. Tọa độ điểm $M$ là],
  (
    [$(2; -1; 2)$.],
    [$(4; -3; 1)$.],
    True([$(3; -2; 1)$.]),
    [$(1; 0; 2)$.],
  ),
  loigiai: [
    #ppgiai[
      Vì $A M : M B = 2 : 1$ nên điểm $M$ chia đoạn $A B$ theo tỉ số trong $2 : 1$ kể từ $A$ đến $B$.
    ]

    Theo công thức chia đoạn, ta có:
    $
      M ((-1 + 2 dot 5)/3; (2 + 2 dot (-4))/3; (3 + 2 dot 0)/3).
    $
    Suy ra:
    $
      M(3; -2; 1).
    $
    Vậy chọn đáp án *C*.
  ],
)

#tn(
  [Đồ thị hàm số $y = (3x^2 - 5x + 2)/(x + 1)$ có đường tiệm cận xiên là],
  (
    [$y = 3x - 5$.],
    [$y = 3x - 7$.],
    True([$y = 3x - 8$.]),
    [$y = x - 8$.],
  ),
  loigiai: [
    #ppgiai[
      Chia đa thức tử cho đa thức mẫu để đưa hàm số về dạng đường thẳng cộng với một phân thức có mẫu bậc nhất.
    ]

    Ta có:
    $
      (3x^2 - 5x + 2)/(x + 1) = 3x - 8 + 10/(x + 1).
    $
    Khi $x -> plus.minus infinity$ thì $10/(x + 1) -> 0$.
    Do đó tiệm cận xiên là:
    $
      y = 3x - 8.
    $
    Vậy chọn đáp án *C*.
  ],
)

#tn(
  [Cho mặt cầu $(S): (x - 1)^2 + (y + 2)^2 + (z - 3)^2 = 16$. Thể tích khối cầu $(S)$ bằng],
  (
    [$64pi/3$.],
    [$128pi/3$.],
    True([$256pi/3$.]),
    [$64pi$.],
  ),
  loigiai: [
    #ppgiai[
      Từ phương trình mặt cầu, ta nhận được bán kính $R = 4$.
      Sau đó dùng công thức thể tích khối cầu $V = 4/3 pi R^3$.
    ]

    Ta có:
    $
      V = 4/3 pi dot 4^3 = 4/3 pi dot 64 = 256pi/3.
    $
    Vậy chọn đáp án *C*.
  ],
)

#tn(
  [Trong không gian $O x y z$, mặt phẳng $(P)$ đi qua điểm $A(1; 2; -1)$ và vuông góc với đường thẳng $(d): x = 1 + 2t, y = -3 + t, z = 4 - t$ có phương trình là],
  (
    [$2x + y - z + 5 = 0$.],
    [$2x - y + z - 1 = 0$.],
    [$x + 2y - z - 4 = 0$.],
    True([$2x + y - z - 5 = 0$.]),
  ),
  loigiai: [
    #ppgiai[
      Đường thẳng $(d)$ có một vectơ chỉ phương là $(2; 1; -1)$.
      Vì mặt phẳng $(P)$ vuông góc với $(d)$ nên $(2; 1; -1)$ là một vectơ pháp tuyến của $(P)$.
    ]

    Phương trình mặt phẳng $(P)$ là:
    $
      2(x - 1) + (y - 2) - (z + 1) = 0.
    $
    Rút gọn được:
    $
      2x + y - z - 5 = 0.
    $
    Vậy chọn đáp án *D*.
  ],
)

#tn(
  [Cho cấp số nhân $(u_n)$ có các số hạng dương, biết $u_1 = 3$ và $u_4 = 24$. Tổng năm số hạng đầu bằng],
  (
    [$45$.],
    [$81$.],
    True([$93$.]),
    [$96$.],
  ),
  loigiai: [
    #ppgiai[
      Từ $u_4 = u_1 q^3$ suy ra công bội $q$.
      Sau đó áp dụng công thức tổng $S_n = u_1 (q^n - 1)/(q - 1)$.
    ]

    Ta có:
    $
      24 = 3q^3 => q^3 = 8 => q = 2.
    $
    Vậy:
    $
      S_5 = 3(2^5 - 1)/(2 - 1) = 3 dot 31 = 93.
    $
    Chọn đáp án *C*.
  ],
)

#tn(
  [Số nghiệm của phương trình $cos 2x = -1/2$ trên đoạn $[0; pi]$ là],
  (
    [$1$.],
    True([$2$.]),
    [$3$.],
    [$4$.],
  ),
  loigiai: [
    #ppgiai[
      Giải phương trình theo biến $2x$, rồi đối chiếu với điều kiện $x in [0; pi]$.
    ]

    Ta có:
    $
      cos 2x = -1/2 <=> 2x = 2pi/3 or 2x = 4pi/3.
    $
    Suy ra:
    $
      x = pi/3 or x = 2pi/3.
    $
    Có đúng $2$ nghiệm thuộc đoạn $[0; pi]$.
    Vậy chọn đáp án *B*.
  ],
)

#tn(
  [Giá trị cực đại của hàm số $f(x) = x^3 - 3x + 1$ bằng],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$4$.],
  ),
  loigiai: [
    #ppgiai[
      Tìm các điểm tới hạn bằng đạo hàm rồi tính giá trị hàm số tại các điểm đó.
    ]

    Ta có:
    $
      f'(x) = 3x^2 - 3 = 3(x - 1)(x + 1).
    $
    Hàm số đạt cực đại tại $x = -1$.
    Khi đó:
    $
      f(-1) = -1 + 3 + 1 = 3.
    $
    Vậy chọn đáp án *C*.
  ],
)

#tn(
  [Tập nghiệm của bất phương trình $log_3(x - 1) + log_3(x + 1) > 1$ là],
  (
    [$(-infinity; -2) union (2; +infinity)$.],
    [$[2; +infinity)$.],
    True([$(2; +infinity)$.]),
    [$(1; +infinity)$.],
  ),
  loigiai: [
    #ppgiai[
      Điều kiện xác định là $x > 1$.
      Sau đó gộp hai lôgarit rồi giải bất phương trình bậc hai.
    ]

    Điều kiện:
    $
      x - 1 > 0 and x + 1 > 0 => x > 1.
    $
    Ta có:
    $
      log_3((x - 1)(x + 1)) > 1 <=> x^2 - 1 > 3.
    $
    Suy ra:
    $
      x^2 > 4.
    $
    Kết hợp với điều kiện $x > 1$, ta được:
    $
      x > 2.
    $
    Vậy tập nghiệm là $(2; +infinity)$.
    Chọn đáp án *C*.
  ],
)

#tn(
  [Từ một hộp có $5$ viên bi đỏ và $4$ viên bi xanh, lấy ngẫu nhiên đồng thời $2$ viên. Xác suất để hai viên lấy ra cùng màu là],
  (
    [$1/3$.],
    [$5/18$.],
    True([$4/9$.]),
    [$1/2$.],
  ),
  loigiai: [
    #ppgiai[
      Hai viên cùng màu khi cùng đỏ hoặc cùng xanh.
      Ta dùng quy tắc cộng xác suất theo cách đếm tổ hợp.
    ]

    Số cách chọn $2$ viên bất kỳ là:
    $
      C_9^2 = 36.
    $
    Số cách chọn hai viên cùng màu là:
    $
      C_5^2 + C_4^2 = 10 + 6 = 16.
    $
    Vậy xác suất cần tìm là:
    $
      16/36 = 4/9.
    $
    Chọn đáp án *C*.
  ],
)

#tn(
  [Giới hạn $lim_(x -> +infinity) (sqrt(x^2 + 5x) - x)$ bằng],
  (
    [$0$.],
    [$5$.],
    True([$5/2$.]),
    [$1/2$.],
  ),
  loigiai: [
    #ppgiai[
      Nhân liên hợp để đưa biểu thức về dạng thương có thể rút gọn được bậc của $x$.
    ]

    Ta có:
    $
      sqrt(x^2 + 5x) - x
      = ((sqrt(x^2 + 5x) - x)(sqrt(x^2 + 5x) + x))/(sqrt(x^2 + 5x) + x)
      = 5x/(sqrt(x^2 + 5x) + x).
    $
    Chia cả tử và mẫu cho $x$, ta được:
    $
      5/(sqrt(1 + 5/x) + 1) -> 5/2.
    $
    Vậy chọn đáp án *C*.
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN II — Trắc nghiệm đúng/sai
// ═══════════════════════════════════════════════════════════
#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

#ds(
  [Trong không gian với hệ tọa độ $O x y z$, cho mặt cầu $(S)$ có tâm $I(1; -2; 2)$ và đi qua điểm $A(4; 2; 2)$. Xét mặt phẳng $(P): 2x - y + 2z - 5 = 0$. Xét tính đúng sai của các mệnh đề sau.],
  (
    True([Bán kính của mặt cầu $(S)$ bằng $5$.]),
    [Mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$.],
    True([Gốc tọa độ $O$ nằm trong khối cầu $(S)$.]),
    True([Nếu $(P)$ cắt $(S)$ theo đường tròn $(C)$ thì bán kính của $(C)$ bằng $2sqrt(6)$.]),
  ),
  loigiai: [
    #ppgiai[
      Ta dùng khoảng cách từ tâm đến điểm thuộc mặt cầu, khoảng cách từ điểm đến mặt phẳng và công thức bán kính thiết diện tròn.
    ]

    Ta có:
    $
      I A = sqrt((4 - 1)^2 + (2 - (-2))^2 + (2 - 2)^2) = sqrt(9 + 16) = 5.
    $
    Vậy mệnh đề a đúng.

    Khoảng cách từ $I$ đến $(P)$ là:
    $
      d(I, (P)) = |2 dot 1 - (-2) + 2 dot 2 - 5|/sqrt(4 + 1 + 4) = 1.
    $
    Vì $1 < 5$ nên $(P)$ cắt mặt cầu, không tiếp xúc với mặt cầu. Mệnh đề b sai.

    Mặt khác:
    $
      O I = sqrt(1^2 + (-2)^2 + 2^2) = 3 < 5.
    $
    Do đó $O$ nằm trong khối cầu $(S)$, nên mệnh đề c đúng.

    Bán kính thiết diện là:
    $
      r = sqrt(5^2 - 1^2) = sqrt(24) = 2sqrt(6).
    $
    Vậy mệnh đề d đúng.
  ],
)

#ds(
  [Một sản phẩm được lấy ngẫu nhiên từ hai dây chuyền $A$ và $B$ với xác suất như nhau. Tỉ lệ sản phẩm lỗi của dây chuyền $A$ là $2%$, của dây chuyền $B$ là $6%$. Một hệ thống kiểm tra phát hiện đúng sản phẩm lỗi với xác suất $90%$, còn với sản phẩm tốt thì báo lỗi giả với xác suất $5%$. Xét tính đúng sai của các mệnh đề sau.],
  (
    True([Tỉ lệ sản phẩm lỗi chung bằng $4%$.]),
    True([Xác suất một sản phẩm bị hệ thống gắn cờ lỗi bằng $8,4%$.]),
    [Nếu sản phẩm bị gắn cờ lỗi thì xác suất nó thực sự lỗi lớn hơn $50%$.],
    True([Nếu biết sản phẩm thuộc dây chuyền $B$ và bị gắn cờ lỗi thì xác suất nó thực sự lỗi bằng $54/101$.]),
  ),
  loigiai: [
    #ppgiai[
      Gọi $D$ là biến cố “sản phẩm thực sự lỗi”, $T$ là biến cố “sản phẩm bị gắn cờ lỗi”.
      Ta áp dụng xác suất toàn phần và định lí Bayes.
    ]

    Xác suất lỗi chung là:
    $
      P(D) = 1/2 dot 1/50 + 1/2 dot 3/50 = 1/25 = 4%.
    $
    Vậy mệnh đề a đúng.

    Xác suất bị gắn cờ lỗi là:
    $
      P(T) = P(D) dot 9/10 + (1 - P(D)) dot 1/20.
    $
    Suy ra:
    $
      P(T) = 1/25 dot 9/10 + 24/25 dot 1/20 = 21/250 = 8,4%.
    $
    Vậy mệnh đề b đúng.

    Theo Bayes:
    $
      P(D | T) = (1/25 dot 9/10)/(21/250) = 3/7.
    $
    Ta có $3/7 approx 42,86% < 50%$, nên mệnh đề c sai.

    Với riêng dây chuyền $B$:
    $
      P(D | B inter T)
      = (3/50 dot 9/10)/(3/50 dot 9/10 + 47/50 dot 1/20)
      = 54/101.
    $
    Vậy mệnh đề d đúng.
  ],
)

#ds(
  [Một chất điểm chuyển động dọc theo trục $O x$ trong khoảng thời gian từ $t = 0$ đến $t = 6$ giây. Tọa độ của chất điểm tại thời điểm $t$ được cho bởi $x(t) = t^2(6 - t)$. Xét tính đúng sai của các mệnh đề sau.],
  (
    [Vận tốc của chất điểm tại thời điểm $t = 0$ bằng $6$ m/s.],
    True([Chất điểm chỉ đổi chiều chuyển động đúng một lần, tại thời điểm $t = 4$.]),
    True([Khoảng cách xa nhất từ chất điểm đến gốc tọa độ bằng $32$ m.]),
    [Tổng quãng đường chất điểm đi được trong $6$ giây bằng $32$ m.],
  ),
  loigiai: [
    #ppgiai[
      Tính vận tốc bằng đạo hàm của $x(t)$, sau đó xét dấu vận tốc trên đoạn thời gian đã cho.
    ]

    Ta có:
    $
      v(t) = x'(t) = 12t - 3t^2 = 3t(4 - t).
    $
    Suy ra:
    $
      v(0) = 0.
    $
    Do đó mệnh đề a sai.

    Với $0 < t < 4$ thì $v(t) > 0$, còn với $4 < t <= 6$ thì $v(t) < 0$.
    Vậy chất điểm đổi chiều đúng một lần tại $t = 4$, nên mệnh đề b đúng.

    Tọa độ lớn nhất đạt tại $t = 4$:
    $
      x(4) = 4^2 dot (6 - 4) = 32.
    $
    Nên mệnh đề c đúng.

    Ta có $x(0) = 0$, $x(4) = 32$, $x(6) = 0$.
    Tổng quãng đường là:
    $
      32 + 32 = 64.
    $
    Vậy mệnh đề d sai.
  ],
)

#ds(
  [Cho hàm số $f(x) = x^3 - 3x^2 - 9x + 5$. Xét tính đúng sai của các mệnh đề sau.],
  (
    True([Đạo hàm của hàm số là $f'(x) = 3(x + 1)(x - 3)$.]),
    [Hàm số đồng biến trên khoảng $(-1; 3)$.],
    True([Giá trị cực tiểu của hàm số bằng $-22$.]),
    True([Phương trình $f(x) = 5$ có ba nghiệm thực phân biệt.]),
  ),
  loigiai: [
    #ppgiai[
      Ta đạo hàm, xét dấu đạo hàm và tính giá trị hàm số tại các điểm tới hạn.
    ]

    Ta có:
    $
      f'(x) = 3x^2 - 6x - 9 = 3(x + 1)(x - 3).
    $
    Vậy mệnh đề a đúng.

    Trên khoảng $(-1; 3)$, ta có $f'(x) < 0$, nên hàm số nghịch biến trên khoảng đó.
    Vì vậy mệnh đề b sai.

    Tính giá trị tại điểm cực tiểu $x = 3$:
    $
      f(3) = 27 - 27 - 27 + 5 = -22.
    $
    Vậy mệnh đề c đúng.

    Giải phương trình $f(x) = 5$:
    $
      x^3 - 3x^2 - 9x = 0
      <=> x(x^2 - 3x - 9) = 0.
    $
    Phương trình bậc hai $x^2 - 3x - 9 = 0$ có hai nghiệm thực phân biệt.
    Do đó phương trình $f(x) = 5$ có ba nghiệm thực phân biệt. Mệnh đề d đúng.
  ],
)

// ═══════════════════════════════════════════════════════════
// PHẦN III — Trả lời ngắn
// ═══════════════════════════════════════════════════════════
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)
#resetcau()

#tln(
  [Trong mặt phẳng với hệ tọa độ $O x y$, tính diện tích miền phẳng giới hạn bởi parabol $y = 4 - x^2$ và đường thẳng $y = x + 2$.],
  [$9/2$],
  loigiai: [
    #ppgiai[
      Tìm giao điểm của hai đồ thị để xác định cận tích phân, rồi lấy hàm phía trên trừ hàm phía dưới.
    ]

    Hoành độ giao điểm thỏa mãn:
    $
      4 - x^2 = x + 2
      <=> x^2 + x - 2 = 0
      <=> x = -2 or x = 1.
    $
    Trên đoạn $[-2; 1]$, ta có $4 - x^2 >= x + 2$.
    Vậy diện tích cần tìm là:
    $
      S = integral_(-2)^1 ((4 - x^2) - (x + 2)) dif x
      = integral_(-2)^1 (2 - x - x^2) dif x.
    $
    Tính được:
    $
      S = (2x - x^2/2 - x^3/3)|_(-2)^1 = 9/2.
    $
    Đáp án là *$9/2$*.
  ],
)

#tln(
  [Từ các chữ số $0, 1, 2, 3, 4, 5$, lập được bao nhiêu số tự nhiên có $6$ chữ số đôi một khác nhau và chia hết cho $6$?],
  [$312$],
  loigiai: [
    #ppgiai[
      Một số chia hết cho $6$ khi vừa chia hết cho $2$ vừa chia hết cho $3$.
      Tổng sáu chữ số đã cho bằng $15$, nên mọi cách sắp xếp đều chia hết cho $3$.
    ]

    Chỉ cần xét chữ số tận cùng là số chẵn.

    - Nếu chữ số tận cùng là $0$, chữ số đầu có $5$ cách chọn và $4$ vị trí giữa có $4!$ cách sắp xếp. Số cách là $5 dot 4! = 120$.
    - Nếu chữ số tận cùng là $2$, chữ số đầu không được là $0$ nên có $4$ cách chọn, các vị trí còn lại có $4!$ cách. Số cách là $4 dot 4! = 96$.
    - Nếu chữ số tận cùng là $4$, tương tự có $96$ cách.

    Vậy tổng số cần tìm là:
    $
      120 + 96 + 96 = 312.
    $
    Đáp án là *$312$*.
  ],
)

#tln(
  [Trong không gian $O x y z$, cho điểm $A(2; -1; 3)$ và đường thẳng $(d): (x - 1)/2 = (y + 2)/(-1) = (z - 1)/2$. Khoảng cách từ $A$ đến $(d)$ bằng bao nhiêu? (Kết quả làm tròn đến hàng phần trăm).],
  [$1,80$],
  loigiai: [
    #ppgiai[
      Tham số hóa điểm $M$ trên đường thẳng $(d)$ rồi tối ưu biểu thức $A M^2$.
    ]

    Đặt:
    $
      M(1 + 2t; -2 - t; 1 + 2t).
    $
    Khi đó:
    $
      A M^2 = (2t - 1)^2 + (-1 - t)^2 + (2t - 2)^2.
    $
    Suy ra:
    $
      A M^2 = 9t^2 - 10t + 6.
    $
    Tam thức này đạt giá trị nhỏ nhất tại:
    $
      t = 10/(2 dot 9) = 5/9.
    $
    Khi đó:
    $
      A M_(min)^2 = 9 dot 25/81 - 10 dot 5/9 + 6 = 29/9.
    $
    Vậy khoảng cách từ $A$ đến $(d)$ là:
    $
      d(A, (d)) = sqrt(29)/3 approx 1,80.
    $
    Đáp án là *$1,80$*.
  ],
)

#tln(
  [Một cơ sở sản xuất dự kiến sản xuất $x$ sản phẩm, với $x in ZZ$ và $1 <= x <= 60$. Nếu sản xuất $x$ sản phẩm thì doanh thu thu được là $R(x) = -x^2 + 120x$ (triệu đồng). Chi phí sản xuất bình quân cho một sản phẩm là $G(x) = x + 20 + 500/x$ (triệu đồng). Hỏi lợi nhuận lớn nhất đạt được khi cơ sở sản xuất bao nhiêu sản phẩm?],
  [$25$],
  loigiai: [
    #ppgiai[
      Tính chi phí toàn phần rồi lập hàm lợi nhuận.
      Sau đó xét đỉnh của parabol lợi nhuận.
    ]

    Chi phí toàn phần là:
    $
      C(x) = x dot G(x) = x^2 + 20x + 500.
    $
    Lợi nhuận là:
    $
      P(x) = R(x) - C(x) = -2x^2 + 100x - 500.
    $
    Đây là một parabol quay xuống, đạt giá trị lớn nhất tại đỉnh:
    $
      x = -100/(2 dot (-2)) = 25.
    $
    Vậy cơ sở nên sản xuất *$25$* sản phẩm.
  ],
)

#tln(
  [Chọn ngẫu nhiên một hộp trong hai hộp $A$ và $B$, trong đó xác suất chọn hộp $A$ là $1/3$ và chọn hộp $B$ là $2/3$. Hộp $A$ chứa $3$ bi đỏ và $4$ bi xanh, hộp $B$ chứa $5$ bi đỏ và $2$ bi xanh. Sau khi chọn hộp, lấy đồng thời $2$ viên bi. Biết rằng hai viên lấy ra cùng màu. Nếu xác suất để đã chọn hộp $B$ có dạng $a/b$ tối giản, hãy tính $a + b$.],
  [$53$],
  loigiai: [
    #ppgiai[
      Gọi $E$ là biến cố “hai viên lấy ra cùng màu”.
      Ta tính $P(E | A)$, $P(E | B)$ rồi áp dụng định lí Bayes.
    ]

    Với hộp $A$:
    $
      P(E | A) = (C_3^2 + C_4^2)/C_7^2 = (3 + 6)/21 = 3/7.
    $
    Với hộp $B$:
    $
      P(E | B) = (C_5^2 + C_2^2)/C_7^2 = (10 + 1)/21 = 11/21.
    $
    Theo Bayes:
    $
      P(B | E)
      = (2/3 dot 11/21)/(1/3 dot 3/7 + 2/3 dot 11/21)
      = (22/63)/(9/63 + 22/63)
      = 22/31.
    $
    Do đó $a = 22$, $b = 31$, suy ra:
    $
      a + b = 53.
    $
    Đáp án là *$53$*.
  ],
)

#tln(
  [Xét hình phẳng giới hạn bởi đồ thị $y = sqrt(x)$, trục hoành và các đường thẳng $x = 0$, $x = 4$. Khi quay hình phẳng đó quanh trục $O x$, thể tích khối tròn xoay thu được có dạng $a pi$. Tìm $a$.],
  [$8$],
  loigiai: [
    #ppgiai[
      Dùng công thức thể tích khối tròn xoay quanh trục $O x$: $V = pi integral_a^b y^2 dif x$.
    ]

    Ta có:
    $
      V = pi integral_0^4 (sqrt(x))^2 dif x = pi integral_0^4 x dif x.
    $
    Suy ra:
    $
      V = pi x^2/2 |_0^4 = 8pi.
    $
    Do đó $a = 8$.
  ],
)

#het
// #print-answer-key()
