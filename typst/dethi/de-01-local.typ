#import "@local/sang-math:1.0.0": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI — Chỉ thay đổi ở đây
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue // classic.blue | classic.emerald | classic.crimson

// Tuỳ chọn đổi màu công thức toán học
#let math-color = rgb("#000000") // Thay rgb("#000000") bằng `accent` hoặc `blue` để đổi màu toán
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// Điều khiển bộ đếm câu/phần:
// - Mặc định: số câu chạy liên tục toàn đề, không reset giữa các phần.
// - Bỏ comment dòng dưới nếu muốn câu kế tiếp là Câu 1.
// #resetcau()
// - Bỏ comment dòng dưới nếu muốn câu kế tiếp là Câu 13.
// #setcau(13)
// - Bỏ comment dòng dưới nếu muốn phần kế tiếp là PHẦN I.
// #resetphan()
// - Nếu muốn riêng một phần bắt đầu lại từ Câu 1, dùng:
// #exam-part([PHẦN ...], count: auto, reset-counter: true)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  school: "Sở GD&ĐT Nghệ An Lần 2",
  exam-title: "THI THỬ THPT QUỐC GIA 2026",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto, // tự đếm số câu mỗi phần
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false, // tắt thanh xanh trên đỉnh
  header-border: true,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  // ═══════════════════════════════════════════════════════════
  // PHẦN I — Trắc nghiệm (12 câu)
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12)

  KHÔNG  CẦN BIÊN DỊCH $A/B$
  // Câu 1
  #tn(
    [Tính tích phân $I = integral_0^(pi/2) cos x dif x$.],
    ([$-1$], True([$1$]), [$0$], [$pi/2$]),
    loigiai: [
      #ppgiai[
        - Với hàm số lượng giác cơ bản, ta có nguyên hàm: $integral cos x dif x = sin x + C$.
        - Khi tính tích phân xác định, ta áp dụng công thức Newton--Leibniz: $integral_a^b f(x) dif x = F(b) - F(a)$, trong đó $F'(x) = f(x)$.
      ]
      Ta có:
      $ I = integral_0^(pi/2) cos x dif x = sin x |_0^(pi/2) = sin(pi/2) - sin(0) = 1 - 0 = 1. $
      Vậy chọn đáp án *B*.
    ],
  )

  // Câu 2
  #tn(
    [Trong không gian với hệ trục tọa độ $O x y z$, phương trình nào dưới đây là phương trình của một mặt cầu?],
    (
      [$2x^2+y^2+z^2-2x-2y-4z-3=0$],
      True([$x^2+y^2+z^2-2x-2y-4z-3=0$]),
      [$x^2+y^2+2z^2-2x-2y-4z-3=0$],
      [$x^2+2y^2+z^2-2x-2y-4z-3=0$],
    ),
    loigiai: [
      #ppgiai[
        - Phương trình tổng quát của mặt cầu có dạng:
          $x^2+y^2+z^2+a x + b y + c z+d=0$, tức là hệ số của $x^2, y^2, z^2$ phải *bằng nhau*.
        - Sau khi hoàn thành bình phương, ta phải thu được dạng:
          $(x-x_0)^2+(y-y_0)^2+(z-z_0)^2=R^2$ ($R>0$).
      ]
      Trong bốn phương án, chỉ phương án *B* có hệ số của $x^2, y^2, z^2$ đều bằng $1$.
      Kiểm tra kỹ hơn:
      $ x^2+y^2+z^2-2x-2y-4z-3=0 <=> (x-1)^2+(y-1)^2+(z-2)^2=9. $
      Vậy đây là mặt cầu tâm $I(1; 1; 2)$, bán kính $R=3$.
      Ba phương án còn lại không phải phương trình mặt cầu vì các hệ số bậc hai không đồng nhất.
      Vậy chọn đáp án *B*.
    ],
  )

  // Câu 3
  #tn(
    [Trong các khẳng định sau, khẳng định nào đúng?],
    (
      [$cos(a-b)=cos a sin b - sin a cos b$],
      [$cos(a-b)=cos a cos b - sin a sin b$],
      [$cos(a-b)=cos a sin b + sin a cos b$],
      True([$cos(a-b)=cos a cos b + sin a sin b$]),
    ),
    loigiai: [
      #ppgiai[
        Các công thức cộng quen thuộc là:
        $ sin(a plus.minus b) = sin a cos b plus.minus cos a sin b, $
        $ cos(a plus.minus b) = cos a cos b minus.plus sin a sin b. $
        Đặc biệt, $cos(a-b) = cos a cos b + sin a sin b$.
      ]
      Đối chiếu trực tiếp với công thức chuẩn, ta thấy khẳng định đúng là:
      $ cos(a-b) = cos a cos b + sin a sin b. $
      Vậy chọn đáp án *D*.
    ],
  )

  // Câu 4
  #tn(
    [Cho khối hộp chữ nhật $A B C D . A' B' C' D'$ có đáy $A B C D$ là hình vuông cạnh $2$, đoạn thẳng $A C'$ tạo với mặt phẳng $(A B C D)$ một góc $60^degree$. Tính thể tích của khối hộp chữ nhật đã cho.],
    (True([$8 sqrt(6)$]), [$4 sqrt(6)$], [$8 sqrt(3)$], [$(8 sqrt(6))/3$]),
    fig: cetz.canvas(length: 1cm, {
      import cetz.draw: *
      let Bp = (0, 0)
      let Cp = (2.6, 0)
      let Dp = (4.2, 1.0)
      let Ap = (1.6, 1.0)
      let B = (0, 2.3)
      let C = (2.6, 2.3)
      let D = (4.2, 3.3)
      let A = (1.6, 3.3)
      line(Ap, Dp, Bp, close: true, stroke: (dash: "dashed"))
      line(Bp, Cp, Dp)
      line(B, C, D, A, close: true)
      line(B, Bp)
      line(C, Cp)
      line(D, Dp)
      line(A, Ap, stroke: (dash: "dashed"))
      circle(A, radius: 1.2pt, fill: black)
      content(A, $A$, anchor: "south")
      circle(B, radius: 1.2pt, fill: black)
      content(B, $B$, anchor: "east")
      circle(C, radius: 1.2pt, fill: black)
      content(C, $C$, anchor: "west")
      circle(D, radius: 1.2pt, fill: black)
      content(D, $D$, anchor: "south")
      circle(Ap, radius: 1.2pt, fill: black)
      content(Ap, $A'$, anchor: "north")
      circle(Bp, radius: 1.2pt, fill: black)
      content(Bp, $B'$, anchor: "north")
      circle(Cp, radius: 1.2pt, fill: black)
      content(Cp, $C'$, anchor: "north")
      circle(Dp, radius: 1.2pt, fill: black)
      content(Dp, $D'$, anchor: "north-west")
    }),
    fig-pos: "center",
    fig-width: 35%,

    loigiai: [
      #ppgiai[
        - Góc giữa đường thẳng và mặt phẳng bằng góc giữa đường thẳng đó và hình chiếu vuông góc của nó trên mặt phẳng.
        - Trong khối hộp chữ nhật, hình chiếu của đoạn $A C'$ lên mặt phẳng $(A B C D)$ là đoạn $A C$.
        - Nếu $h = A A'$ là chiều cao thì thể tích khối hộp là $V = S_(A B C D) dot h$.
      ]
      Vì đáy $A B C D$ là hình vuông cạnh $2$ nên:
      $ A C = 2 sqrt(2), quad S_(A B C D) = 2^2 = 4. $
      Do $A C'$ tạo với mặt phẳng $(A B C D)$ một góc $60^degree$ nên:
      $ angle(A C', (A B C D)) = angle A C A' = 60^degree, $
      trong đó $A C$ là hình chiếu của $A C'$ lên $(A B C D)$.
      Xét tam giác vuông $A C C'$ tại $C$, ta có:
      $ tan 60^degree = (C C') / (A C) = (A A') / (A C). $
      Suy ra:
      $ A A' = A C tan 60^degree = 2 sqrt(2) dot sqrt(3) = 2 sqrt(6). $
      Vậy thể tích khối hộp là:
      $ V = S_(A B C D) dot A A' = 4 dot 2 sqrt(6) = 8 sqrt(6). $
      Do đó chọn đáp án *A*.
    ],
  )

  // Câu 5
  #tn(
    [Cho hàm số $y = (a x + b)/(c x + d)$ ($a c != 0$, $a d - b c != 0$) có đồ thị như hình vẽ. Đường tiệm cận đứng của đồ thị hàm số đã cho là],
    ([$y=2$], [$y=1$], True([$x=1$]), [$x=2$]),
    fig: cetz.canvas(length: .5cm, {
      import cetz.draw: *
      line((-2.5, 0), (4, 0), mark: (end: "stealth"))
      content((4, -0.3), $x$)
      line((0, -2.5), (0, 4), mark: (end: "stealth"))
      content((-0.3, 4), $y$)
      content((-0.3, -0.3), $O$)
      line((1, -2.5), (1, 4), stroke: gray)
      line((-2.5, 2), (4, 2), stroke: gray)
      content((1.6, -1.2), $x=1$)
      content((-1.2, 2.3), $y=2$)
      bezier((-2.5, 1.7), (0.5, -2.5), (0, 1.8), (0.8, -1))
      bezier((4, 2.3), (1.5, 4), (2, 2.2), (1.2, 3))
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        - Tiệm cận đứng của đồ thị hàm số phân thức là đường thẳng đứng mà khi $x$ tiến tới giá trị đó thì $y$ tiến ra $plus.minus infinity$.
        - Trên hình vẽ, tiệm cận đứng thường được biểu diễn bởi một đường thẳng song song với trục $O y$.
      ]
      Quan sát hình vẽ, ta thấy có một đường thẳng đứng mà đồ thị tiến sát tới hai phía, đó là đường thẳng $x = 1$.
      Ngoài ra, đường thẳng $y = 2$ là tiệm cận ngang chứ không phải tiệm cận đứng.
      Vậy tiệm cận đứng của đồ thị là $x = 1$, chọn đáp án *C*.
    ],
  )

  // Câu 6
  #tn(
    [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
      #import "@preview/cetz:0.5.2"
      #align(center, cetz.canvas(length: .7cm, {
        import cetz.draw: *

        // Kích thước bảng
        let W = 15.6
        let H = 5.7
        let XL = 1.75 // cột nhãn bên trái

        // Các đường ngang
        let Y0 = 0.0
        let Y1 = 3.30 // ngăn giữa hàng y' và y
        let Y2 = 4.50 // ngăn giữa hàng x và y'
        let Y3 = H

        // Tâm các mốc trên hàng x
        let Xs = (2.3, 5.6, 8.6, 11.6, 15.0)

        // Khung ngoài
        rect((0, Y0), (W, Y3), stroke: 0.5pt)
        line((XL, Y0), (XL, Y3), stroke: 0.5pt)
        line((0, Y1), (W, Y1), stroke: 0.5pt)
        line((0, Y2), (W, Y2), stroke: 0.5pt)

        // Vạch đôi tại x = 0 (chỉ từ hàng y' trở xuống)
        let X0 = Xs.at(2)
        line((X0 - 0.05, Y0), (X0 - 0.05, Y2), stroke: 0.45pt)
        line((X0 + 0.05, Y0), (X0 + 0.05, Y2), stroke: 0.45pt)

        // Nhãn cột trái
        content((0.88, 5.00), [$x$])
        content((0.88, 3.92), [$y'$])
        content((0.88, 1.65), [$y$])

        // Hàng x
        let topv = ($-oo$, $-1$, $0$, $1$, $+oo$)
        for i in range(5) {
          content((Xs.at(i), 5.00), topv.at(i))
        }

        // Hàng y'
        content((3.35, 3.92), [$+$])
        content((5.60, 3.92), [$0$])
        content((7.00, 3.92), [$-$])

        // dấu "||" ở hàng y'
        content((8.60, 3.92), [$parallel$])

        content((10.35, 3.92), [$-$])
        content((11.60, 3.92), [$0$])
        content((13.45, 3.92), [$+$])

        // Hàng y: các giá trị đặc biệt
        content((2.15, 0.55), [$-oo$])
        content((5.60, 2.82), [$2$])
        content((7.90, 0.55), [$-oo$])

        content((8.95, 2.82), [$+oo$])
        content((11.60, 0.55), [$4$])
        content((15.00, 2.82), [$+oo$])

        // Mũi tên biến thiên bên trái
        line((2.85, 1.05), (4.95, 2.55), stroke: 0.5pt, mark: (end: ">"))
        line((5.95, 2.45), (7.75, 1.05), stroke: 0.5pt, mark: (end: ">"))

        // Mũi tên biến thiên bên phải
        line((9.45, 2.40), (11.20, 1.00), stroke: 0.5pt, mark: (end: ">"))
        line((12.20, 1.00), (14.55, 2.40), stroke: 0.5pt, mark: (end: ">"))
      }))
      Hàm số đã cho nghịch biến trong khoảng nào?
    ],
    ([$(-1;1)$], [$(4;+infinity)$], [$(-infinity;2)$], True([$(0;1)$])),
    loigiai: [
      #ppgiai[
        Dựa vào bảng biến thiên, hàm số nghịch biến trên những khoảng mà hàng $y'$ mang dấu âm. Cần chú ý tách riêng tại điểm gián đoạn $x=0$, nên không được gộp hai khoảng ở hai phía của $0$ thành một khoảng duy nhất.
      ]
      Từ bảng biến thiên, ta thấy:
      - $y' > 0$ trên khoảng $(-infinity; -1)$ và $(1; +infinity)$ nên hàm số đồng biến trên các khoảng đó.
      - $y' < 0$ trên khoảng $(-1; 0)$ và $(0; 1)$ nên hàm số nghịch biến trên hai khoảng này.

      Trong bốn phương án đã cho, chỉ có khoảng $(0; 1)$ là một khoảng nghịch biến hoàn toàn.
      Vậy chọn đáp án *D*.
    ],
  )

  // Câu 7
  #tn(
    [Trong mặt phẳng $O x y$, cho elip có phương trình chính tắc
      $x^2/25 + y^2/16 = 1.$
      Tiêu cự của elip đó bằng],
    ([$10$], [$3$], [$8$], True([$6$])),
    loigiai: [
      #ppgiai[
        Với elip có phương trình chính tắc $x^2/a^2 + y^2/b^2 = 1$ ($a > b > 0$), ta có $c^2 = a^2 - b^2$, trong đó $2c$ là tiêu cự của elip.
      ]
      Từ phương trình elip đã cho, suy ra $a^2 = 25, b^2 = 16$.
      Do đó $c^2 = a^2 - b^2 = 25 - 16 = 9 => c = 3$.
      Tiêu cự của elip là $2c = 2 dot 3 = 6$.
      Vậy chọn đáp án *D*.
    ],
  )

  // Câu 8
  #tn(
    [Nếu $log_a b = 3$ thì $log_a b^4$ bằng],
    ([$7$], True([$12$]), [$81$], [$6$]),
    loigiai: [
      #ppgiai[
        Ta sử dụng công thức lũy thừa của logarit: $log_a (b^m) = m log_a b$.
      ]
      Vì $log_a b = 3$ nên $log_a b^4 = 4 log_a b = 4 dot 3 = 12$.
      Vậy chọn đáp án *B*.
    ],
  )

  // Câu 9
  #tn(
    [Họ nguyên hàm của hàm số $f(x) = 1/(sin^2 x)$ là],
    ([$tan x + C$], [$cot x + C$], True([$-cot x + C$]), [$1/(sin x) + C$]),
    loigiai: [
      #ppgiai[
        Công thức nguyên hàm cơ bản là: $integral 1/(sin^2 x) dif x = -cot x + C$.
      ]
      Suy ra $integral 1/(sin^2 x) dif x = -cot x + C$.
      Vậy họ nguyên hàm cần tìm là $-cot x + C$. Chọn đáp án *C*.
    ],
  )

  // Câu 10
  #tn(
    [Cho mẫu số liệu ghép nhóm có bảng tần số ghép nhóm như sau:
      #align(center)[
        #table(
          columns: 6,
          align: center,
          stroke: 0.5pt + black,
          [*Nhóm*], [*[8; 10)*], [*[10; 12)*], [*[12; 14)*], [*[14; 16)*], [*[16; 18)*],
          [*Tần số*], [4], [5], [8], [7], [5],
        )
      ]
      Độ lệch chuẩn của mẫu số liệu ghép nhóm là (không làm tròn kết quả các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng phần trăm)],
    ([$2,57$], [$2,55$], True([$2,56$]), [$2,54$]),
    loigiai: [
      #ppgiai[
        Với mẫu số liệu ghép nhóm, ta lấy điểm giữa của các lớp làm giá trị đại diện. Khi đó độ lệch chuẩn được tính bởi $s = sqrt(1/n sum n_i (x_i - overline(x))^2)$, trong đó $x_i$ là điểm giữa lớp, $n_i$ là tần số, và $n = sum n_i$.
      ]
      Các điểm giữa của lớp là: $9, 11, 13, 15, 17$.
      Tổng tần số là $n = 4 + 5 + 8 + 7 + 5 = 29$.
      Số trung bình của mẫu số liệu là:
      $ overline(x) = (4 dot 9 + 5 dot 11 + 8 dot 13 + 7 dot 15 + 5 dot 17)/29 = 385/29. $
      Ta có:
      $ sum n_i x_i^2 = 4 dot 9^2 + 5 dot 11^2 + 8 dot 13^2 + 7 dot 15^2 + 5 dot 17^2 = 5301. $
      Suy ra phương sai là:
      $ s^2 = 5301/29 - (385/29)^2 approx 6,5434. $
      Do đó $s approx sqrt(6.5434) approx 2,56$.
      Vậy chọn đáp án *C*.
    ],
  )

  // Câu 11
  #tn(
    [Trong không gian với hệ trục tọa độ $O x y z$, phương trình của đường thẳng đi qua điểm $M(1; -2; 3)$ và có một vectơ chỉ phương $vect(u)(1; -2; 1)$ là],
    (
      [$(x-1)/1 = (y+2)/(-2) = (z-1)/3$],
      True([$(x-1)/1 = (y+2)/(-2) = (z-3)/1$]),
      [$(x+1)/1 = (y-2)/(-2) = (z+3)/1$],
      [$(x+1)/1 = (y+2)/(-2) = (z-3)/1$],
    ),
    loigiai: [
      #ppgiai[
        Đường thẳng đi qua điểm $M(x_0; y_0; z_0)$ và có vectơ chỉ phương $vect(u) = (a; b; c)$ có phương trình chính tắc:
        $ (x-x_0)/a = (y-y_0)/b = (z-z_0)/c. $
      ]
      Với $M(1; -2; 3)$ và $vect(u)(1; -2; 1)$, ta được phương trình chính tắc của đường thẳng là:
      $ (x-1)/1 = (y+2)/(-2) = (z-3)/1. $
      Vậy chọn đáp án *B*.
    ],
  )

  // Câu 12
  #tn(
    [Trong không gian với hệ trục tọa độ $O x y z$, cho mặt phẳng $(P)$ có phương trình
      $ 2 x - 3 y + z + 5 = 0. $
      Vectơ nào sau đây là một vectơ pháp tuyến của mặt phẳng $(P)$?],
    ([$vect(n)_3(2; -3; 5)$], [$vect(n)_4(2; 3; -1)$], True([$vect(n)_2(2; -3; 1)$]), [$vect(n)_1(2; -3; -1)$]),
    loigiai: [
      #ppgiai[
        Mặt phẳng có phương trình $a x + b y + c z + d = 0$ có một vectơ pháp tuyến là $vect(n) = (a; b; c)$.
      ]
      Với mặt phẳng $2 x - 3 y + z + 5 = 0$, ta nhận được một vectơ pháp tuyến là $vect(n) = (2; -3; 1)$.
      Vậy chọn đáp án *C*.
    ],
  )


  // ═══════════════════════════════════════════════════════════
  // PHẦN II — Đúng/Sai (4 câu)
  // True([...]) = ĐÚNG — không True = SAI
  // ═══════════════════════════════════════════════════════════
  // Nếu muốn phần này bắt đầu lại từ Câu 1, dùng
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

  // Câu 1
  #ds(
    [Trong hệ trục tọa độ $O x y z$ (đơn vị: km), mặt phẳng $(O x y)$ là mặt đất, trục $O z$ hướng thẳng đứng lên trên. Một trạm ra-đa đặt tại điểm $A(1; 2; 0)$ với bán kính quét tối đa $R = 100 " km"$. Một vật thể bắt đầu chuyển động từ vị trí $B(2; -1; 0)$ với vận tốc tại thời điểm $t$ giây tính từ khi xuất phát là $v(t) = 10 + 1/2 t - 1/1200 t^2 " (m/s)"$ và bay theo hướng vectơ $vect(u) = (2; 2; 1)$. Sau một khoảng thời gian chưa đầy 10 phút, vật thể đến vị trí $C$ có độ cao $6 " km"$.],
    (
      [Phương trình mặt cầu giới hạn vùng giám sát của ra-đa là $(x-1)^2 + (y-2)^2 + (z-1)^2 = 100$.],
      True([Phương trình đường thẳng $B C$ là $(x-2)/2 = (y+1)/2 = z/1$.]),
      True([Quãng đường vật thể di chuyển từ $B$ đến $C$ là $18 " km"$.]),
      [Sau khi đến vị trí $C$, vật thể chuyển động thẳng đều theo hướng thoát khỏi vùng giám sát của ra-đa nhanh nhất (giữ nguyên vận tốc tại thời điểm $C$). Khi đó thời gian di chuyển của vật thể từ lúc xuất phát cho đến khi bắt đầu thoát khỏi vùng giám sát bé hơn 21 phút.],
    ),
    loigiai: [
      #ppgiai[
        - Phương trình mặt cầu tâm $I(a; b; c)$, bán kính $R$ có dạng:
          $ (x-a)^2 + (y-b)^2 + (z-c)^2 = R^2 $
        - Phương trình chính tắc của đường thẳng đi qua $M(x_0; y_0; z_0)$ và có vectơ chỉ phương $vect(u) = (a; b; c)$ là:
          $ (x-x_0)/a = (y-y_0)/b = (z-z_0)/c $
        - Quãng đường vật thể di chuyển được từ thời điểm $t_1$ đến $t_2$ được tính bằng tích phân của hàm vận tốc:
          $ S = integral_(t_1)^(t_2) v(t) dif t $
        - Hướng thoát khỏi mặt cầu nhanh nhất từ một điểm $C$ nằm bên trong mặt cầu tâm $A$ chính là hướng của tia $A C$. Quãng đường ngắn nhất để thoát ra là $d = R - A C$.
      ]
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          // Mặt cầu ra đa
          circle((0, 0), radius: 4, stroke: (paint: rgb("00cccc"), thickness: 1.5pt), fill: rgb("e6ffff"))

          // Tâm A
          circle((0, 0), radius: 2pt, fill: red)
          content((0.1, -0.1), $A(1;2;0)$, anchor: "north-west")

          // Điểm B và C
          let B = (-1.5, -2)
          let C = (1.5, 1)
          circle(B, radius: 2pt, fill: blue)
          content((B.at(0) - 0.1, B.at(1) - 0.1), $B$, anchor: "north-east")
          circle(C, radius: 2pt, fill: blue)
          content((C.at(0) - 0.1, C.at(1) + 0.1), $C$, anchor: "south-east")

          // Quỹ đạo B đến C
          line(B, C, mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt))
          content((0, -0.2), $vect(u)=(2;2;1)$, anchor: "south-east", angle: 45deg)

          // Hướng thoát (Tia AC kéo dài)
          let Escape = (3.33, 2.22)
          line(C, Escape, mark: (end: ">"), stroke: (paint: orange, thickness: 1.5pt))
          content((2.4, 1.8), [Hướng thoát nhanh nhất], angle: 33deg, anchor: "south")
          circle(Escape, radius: 2pt, fill: orange)

          // Nối A C
          line((0, 0), C, stroke: (dash: "dashed", paint: gray))

          // Bán kính R
          line((0, 0), (-4, 0), mark: (start: "<", end: ">"), stroke: (paint: gray, thickness: 0.5pt))
          content((-2, 0), $R=100"km"$, anchor: "north")
        })
      ]

      - *Ý a) Sai.* Trạm ra-đa đặt tại $A(1; 2; 0)$ và bán kính $R = 100$. Phương trình mặt cầu giới hạn vùng giám sát phải là:
        $ (x-1)^2 + (y-2)^2 + (z-0)^2 = 100^2 <=> (x-1)^2 + (y-2)^2 + z^2 = 10000 $
      - *Ý b) Đúng.* Đường thẳng $B C$ đi qua vị trí xuất phát $B(2; -1; 0)$ và nhận vectơ $vect(u) = (2; 2; 1)$ làm vectơ chỉ phương. Phương trình chính tắc của đường thẳng $B C$ là:
        $ (x-2)/2 = (y-(-1))/2 = (z-0)/1 <=> (x-2)/2 = (y+1)/2 = z/1 $
      - *Ý c) Đúng.* Điểm $C$ nằm trên đường thẳng $B C$, do đó tọa độ $C$ có dạng $C(2+2t; -1+2t; t)$.
        Vật thể tại $C$ có độ cao $6 " km"$, tức là cao độ $z_C = 6$. Suy ra $t = 6$. Tọa độ điểm $C$ là $C(14; 11; 6)$.
        Quãng đường vật thể di chuyển từ $B$ đến $C$ chính là độ dài đoạn thẳng $B C$:
        $ B C = sqrt((14-2)^2 + (11 - (-1))^2 + (6-0)^2) = sqrt(12^2 + 12^2 + 6^2) = sqrt(144 + 144 + 36) = 18 " (km)" $
      - *Ý d) Sai.* Đổi quãng đường $B C$ ra đơn vị mét: $S = 18 " km" = 18000 " m"$.
        Thời gian $t_1$ (giây) vật thể di chuyển từ $B$ đến $C$ thỏa mãn:
        $ integral_0^(t_1) (10 + 1/2 t - 1/1200 t^2) dif t = 18000 $
        $ <=> (10t + 1/4 t^2 - 1/3600 t^3) |_0^(t_1) = 18000 $
        $ <=> -1/3600 t_1^3 + 1/4 t_1^2 + 10t_1 - 18000 = 0 $
        Giải phương trình bậc 3 (điều kiện $t_1 < 600$ giây do "chưa đầy 10 phút"), ta thu được nghiệm $t_1 = 300 " (s)" = 5 " (phút)"$.
        Vận tốc của vật thể tại điểm $C$ (tại $t_1 = 300"s"$) là:
        $ v_C = 10 + 1/2 (300) - 1/1200 (300)^2 = 10 + 150 - 75 = 85 " (m/s)" $
        Khoảng cách từ tâm ra-đa $A(1;2;0)$ đến điểm $C(14;11;6)$ là:
        $ A C = sqrt((14-1)^2 + (11-2)^2 + (6-0)^2) = sqrt(13^2 + 9^2 + 6^2) = sqrt(286) " (km)" $
        Để thoát khỏi vùng giám sát nhanh nhất, vật thể chuyển động dọc theo hướng của tia $A C$. Quãng đường ngắn nhất cần đi thêm là:
        $ d = R - A C = (100 - sqrt(286)) " (km)" = (100 - sqrt(286)) dot 1000 " (m)" $
        Thời gian $t_2$ để đi hết quãng đường $d$ với vận tốc đều $v_C = 85 " m/s"$ là:
        $ t_2 = d/v_C = ((100 - sqrt(286)) dot 1000)/85 approx 977.51 " (s)" approx 16.29 " (phút)" $
        Tổng thời gian từ lúc xuất phát đến khi thoát khỏi vùng giám sát là:
        $ t_"tổng" = t_1 + t_2 approx 5 + 16.29 = 21.29 " (phút)" $
        Vì $21.29 > 21$, nên thời gian di chuyển lớn hơn 21 phút.
    ],
  )

  // Câu 2
  #ds(
    [Trong một sảnh lớn của một công ty, có một lối đi vào khu làm việc. Công ty đang thử nghiệm tại lối đi này một hệ thống cửa tự động có sử dụng công nghệ nhận diện gương mặt. Khi nhận diện gương mặt là nhân viên thì hệ thống mới mở cửa để người đó vào. \
      Đối với nhân viên công ty, hệ thống nhận diện đúng với xác suất $99%$. \
      Đối với khách, hệ thống nhận diện nhầm là nhân viên với xác suất $15%$. \
      Biết rằng trong sảnh của công ty, tỉ lệ nhân viên công ty là $90%$, còn lại là khách.],
    (
      True([Xác suất hệ thống từ chối mở cửa cho một khách là $0.85$.]),
      [Xác suất hệ thống mở cửa cho một người bất kỳ đi vào là $0.9$.],
      True([Một người được hệ thống mở cửa cho vào, xác suất người đó là khách nhỏ hơn $0.02$.]),
      True(
        [Giả sử tất cả mọi người trong sảnh đã được hệ thống quét nhận diện gương mặt, chọn ngẫu nhiên một người trong số đó. Xác suất để người đó đã bị hệ thống nhận diện nhầm là $0.024$.],
      ),
    ),
    loigiai: [
      #ppgiai[
        - Bài toán liên quan đến xác suất toàn phần và công thức Bayes.
        - Gọi các biến cố:
          - $N$: "Người được chọn là nhân viên công ty".
          - $K$: "Người được chọn là khách".
          - $M$: "Hệ thống mở cửa cho người đó" (nhận diện là nhân viên).
        - Theo đề bài, ta có sơ đồ cây xác suất:
      ]
      // #import "@preview/cetz:0.5.2"

      #let tree = cetz.canvas(length: 1cm, {
        import cetz.draw: *

        // Nodes
        content((0, 0), [Mọi người], name: "root")
        content((3.5, 1.8), [Nhân viên (N)], name: "N")
        content((3.5, -1.8), [Khách (K)], name: "K")

        // Level 2 nodes
        content((7, 3), [Mở ($M$)], name: "NM")
        content((7, 1), [Từ chối ($overline(M)$)], name: "NN")
        content((7, -1), [Mở ($M$)], name: "KM")
        content((7, -3), [Từ chối ($overline(M)$)], name: "KN")

        // Results
        content((9.5, 3), [(Đúng)])
        content((9.5, 1), [(Nhầm)])
        content((9.5, -1), [(Nhầm)])
        content((9.5, -3), [(Đúng)])

        // Edges with probabilities
        line("root", "N", mark: (end: ">"), name: "e1")
        content("e1.mid", $0.9$, anchor: "north", angle: "e1", padding: 5pt)

        line("root", "K", mark: (end: ">"), name: "e2")
        content("e2.mid", $0.1$, anchor: "south", angle: "e2", padding: 5pt)

        line("N", "NM", mark: (end: ">"), name: "e3")
        content("e3.mid", $0.99$, anchor: "south", angle: "e3", padding: 5pt)

        line("N", "NN", mark: (end: ">"), name: "e4")
        content("e4.mid", $0.01$, anchor: "north", angle: "e4", padding: 5pt)

        line("K", "KM", mark: (end: ">"), name: "e5")
        content("e5.mid", $0.15$, anchor: "south", angle: "e5", padding: 5pt)

        line("K", "KN", mark: (end: ">"), name: "e6")
        content("e6.mid", $0.85$, anchor: "north", angle: "e6", padding: 5pt)
      })

      $tree$

      - *Ý a) Đúng.* Xác suất hệ thống từ chối mở cửa cho một khách chính là $ P(overline(M)|K) = 1 - P(M|K) = 1 - 0.15 = 0.85 $
      - *Ý b) Sai.* Xác suất mở cửa cho một người bất kỳ:
        $ P(M) = 0.9 dot 0.99 + 0.1 dot 0.15 = 0.891 + 0.015 = 0.906 != 0.9. $
      - *Ý c) Đúng.* Xác suất người đó là khách khi đã được mở cửa:
        $ P(K|M) = (0.1 dot 0.15)/0.906 approx 0.01655 < 0.02. $
      - *Ý d) Đúng.* Xác suất bị nhận diện nhầm (NV bị từ chối hoặc Khách được mở):
        $ P("Nhầm") = 0.9 dot 0.01 + 0.1 dot 0.15 = 0.009 + 0.015 = 0.024. $
    ],
  )

  // Câu 3
  #ds(
    [Một viên pin dự phòng có dung lượng thiết kế là $10000 " mAh"$ đang vừa sạc vừa cấp điện cho một thiết bị khác. Trong quá trình này, các kĩ sư sử dụng một mô hình gần đúng để mô tả tại thời điểm $t$ phút ($t >= 0$) kể từ khi khảo sát như sau: \
      Tốc độ nạp điện vào pin là $f(t) = 250 e^(-0.01t) " (mAh/phút)"$. \
      Do thiết bị hoạt động và hao phí trên mạch điện nên điện tích bị tiêu hao. Tốc độ tiêu hao là $g(t) = 10 e^(0.04t) " (mAh/phút)"$. \
      Gọi $Q(t)$ là lượng điện tích tích lũy được trong pin tại thời điểm $t$ phút kể từ khi bắt đầu khảo sát. Biết rằng tốc độ biến thiên của $Q(t)$ là $Q'(t) = f(t) - g(t)$ và tại thời điểm ban đầu, lượng điện tích tích lũy bằng 0.],
    (
      True([Hàm số $Q(t)$ là một nguyên hàm của hàm số $h(t) = 250 e^(-0.01t) - 10 e^(0.04t)$.]),
      [$Q(t) = -25000 e^(-0.01t) - 250 e^(0.04t) + C$, $C$ là hằng số.],
      True([Nếu sạc trong 30 phút thì pin chưa được $60%$.]),
      True(
        [Để bảo vệ tuổi thọ pin, nhà sản xuất quy định: "Chỉ được phép sạc pin chừng nào tốc độ nạp $f(t)$ còn lớn hơn ít nhất 3 lần tốc độ tự xả $g(t)$". Có hai loại dây sạc: dây sạc thường (ngắt khi điện tích đạt lớn nhất) và dây sạc thông minh (ngắt theo quy định nhà sản xuất). Khi đó, lượng điện tích tối đa thu được từ dây sạc thường lớn hơn dây sạc thông minh trên $1000 " mAh"$.],
      ),
    ),
    loigiai: [
      #ppgiai[
        - Lượng điện tích tích lũy $Q(t)$ là nguyên hàm của tốc độ biến thiên lượng điện tích:
          $ Q(t) = integral Q'(t) dif t = integral (f(t) - g(t)) dif t $
        - Áp dụng công thức nguyên hàm cơ bản: $integral e^(a x) dif x = 1/a e^(a x) + C$.
        - Sử dụng giả thiết ban đầu $Q(0) = 0$ để tìm chính xác hằng số $C$, từ đó xác định hàm số cụ thể $Q(t)$.
        - Điện tích đạt giá trị lớn nhất khi đạo hàm bằng 0, tức là $Q'(t) = 0 <=> f(t) = g(t)$.
      ]

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          // Axes
          line((-1, 0), (8, 0), mark: (end: ">"))
          content((8, -0.3), $t$ + " (chục phút)")
          line((0, -1), (0, 7), mark: (end: ">"))
          content((-0.3, 7), $Q(t)$ + " (nghìn mAh)", anchor: "east")
          content((-0.3, -0.3), $O$)

          // Curve Q(t)
          bezier((0, 0), (4.24, 5.28), (1.5, 3), (3, 4.8), stroke: (paint: blue, thickness: 1.2pt))
          bezier((4.24, 5.28), (6.44, 6.18), (5, 5.7), (6, 6.1), stroke: (paint: blue, thickness: 1.2pt))
          bezier((6.44, 6.18), (7.5, 5.46), (7, 6.1), (7.3, 5.8), stroke: (paint: blue, thickness: 1.2pt))
          content((7.5, 5.46), $Q(t)$, anchor: "west", fill: blue)

          // Dây sạc thường
          line((6.44, 0), (6.44, 6.18), stroke: (dash: "dashed", paint: red))
          line((6.44, 6.18), (0, 6.18), stroke: (dash: "dashed", paint: red))
          content((6.44, -0.3), $t_1 approx 64.4$)
          content((-0.1, 6.18), $Q_max approx 8834$, anchor: "east")
          circle((6.44, 6.18), radius: 2pt, fill: red)

          // Dây sạc thông minh
          line((4.24, 0), (4.24, 5.28), stroke: (dash: "dashed", paint: orange))
          line((4.24, 5.28), (0, 5.28), stroke: (dash: "dashed", paint: orange))
          content((4.24, -0.3), $t_2 approx 42.4$)
          content((-0.1, 5.28), $Q_2 approx 7542$, anchor: "east")
          circle((4.24, 5.28), radius: 2pt, fill: orange)
        })
      ]

      Ta có tốc độ biến thiên $Q'(t) = f(t) - g(t) = 250 e^(-0.01t) - 10 e^(0.04t)$.
      Lượng điện tích $Q(t)$ được tính bằng:
      $ Q(t) = integral (250 e^(-0.01t) - 10 e^(0.04t)) dif t = 250/(-0.01) e^(-0.01t) - 10/0.04 e^(0.04t) + C $
      $ => Q(t) = -25000 e^(-0.01t) - 250 e^(0.04t) + C $
      Tại thời điểm ban đầu ($t = 0$), lượng điện tích bằng $0 => Q(0) = 0$:
      $ -25000 e^0 - 250 e^0 + C = 0 <=> C = 25250 $
      Vậy hàm số cụ thể là: $Q(t) = 25250 - 25000 e^(-0.01t) - 250 e^(0.04t)$.

      - *Ý a) Đúng.* Do $Q'(t) = 250 e^(-0.01t) - 10 e^(0.04t) = h(t)$, nên theo định nghĩa, $Q(t)$ là một nguyên hàm của hàm $h(t)$.
      - *Ý b) Sai.* Mặc dù dạng công thức nguyên hàm là đúng, nhưng theo giả thiết $Q(0) = 0$, $Q(t)$ là một đại lượng và hàm số xác định cụ thể với $C = 25250$. Việc ghi " $+ C$, $C$ là hằng số" (họ nguyên hàm tuỳ ý) là không chính xác đối với hàm $Q(t)$ trong bài.
      - *Ý c) Đúng.* Khi sạc trong 30 phút ($t=30$):
        $
          Q(30) = 25250 - 25000 e^(-0.3) - 250 e^(1.2) approx 25250 - 25000(0.7408) - 250(3.3201) approx 5899.5 " (mAh)"
        $
        Lượng điện tích đạt $60%$ dung lượng pin là $60% times 10000 = 6000 " mAh"$. Vì $5899.5 < 6000$ nên pin chưa đạt được $60%$.
      - *Ý d) Đúng.*
        - *Dây sạc thường:* Điện tích đạt lớn nhất khi $Q'(t) = 0 <=> f(t) = g(t)$.
          $ 250 e^(-0.01t) = 10 e^(0.04t) <=> e^(0.05t) = 25 <=> t_1 = 20 ln 25 = 40 ln 5 approx 64.38 " (phút)" $
          Lượng điện tích tối đa $Q_max = Q(40 ln 5) = 25250 - 25000(5^(-0.4)) - 250(5^(1.6)) approx 8834.2 " (mAh)"$.
        - *Dây sạc thông minh:* Ngắt khi $f(t) = 3g(t)$.
          $ 250 e^(-0.01t) = 30 e^(0.04t) <=> e^(0.05t) = 25/3 <=> t_2 = 20 ln(25/3) approx 42.41 " (phút)" $
          Lượng điện tích lúc ngắt: $Q_2 = Q(20 ln(25/3)) = 25250 - 25000(25/3)^(-0.2) - 250(25/3)^(0.8) approx 7542.0 " (mAh)"$.
        Ta có độ chênh lệch: $Delta Q = Q_max - Q_2 approx 8834.2 - 7542.0 = 1292.2 " (mAh)"$.
        Vì $1292.2 > 1000$, nên lượng điện tích tối đa thu được từ dây sạc thường lớn hơn dây sạc thông minh trên $1000 " mAh"$.
    ],
  )

  // Câu 4
  #ds(
    [Cho hàm số $f(x) = (x-4)/(x-2)$ có đồ thị $(C)$.],
    (
      True([Tập xác định hàm số là $D = RR backslash {2}$.]),
      True([$f'(x) = 2/(x-2)^2 quad forall x != 2$.]),
      [$f(4) = 2$.],
      [Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn $[4; 6]$. Khi đó $M + m = 2$.],
    ),
    loigiai: [
      #ppgiai[
        - Tập xác định của hàm phân thức bậc nhất trên bậc nhất $y = (a x+b)/(c x+d)$ là các giá trị của $x$ sao cho mẫu số khác $0$ ($c x+d != 0$).
        - Công thức đạo hàm nhanh: $y' = (a d-b c)/(c x+d)^2$.
        - Cách tìm giá trị lớn nhất (GTLN), giá trị nhỏ nhất (GTNN) của hàm số $y=f(x)$ trên đoạn $[a;b]$:
          - Tính đạo hàm $f'(x)$.
          - Đánh giá tính đơn điệu của hàm số. Nếu hàm số luôn đồng biến (hoặc luôn nghịch biến) trên $[a; b]$ thì GTLN và GTNN sẽ đạt tại các đầu mút $x=a$ và $x=b$.
      ]
      #align(center)[
        #cetz.canvas(length: 1.15cm, {
          import cetz.draw: *

          // Hàm số
          let f(x) = (x - 4) / (x - 2)

          // Tạo điểm mẫu cho từng nhánh
          let left = ()
          for i in range(0, 45) {
            let x = -1.0 + i * 0.05
            left.push((x, f(x)))
          }

          let right = ()
          for i in range(12, 97) {
            let x = 2.05 + i * 0.05
            right.push((x, f(x)))
          }
          // Các điểm đặc biệt
          let m = (4, 0)
          let M = (6, 0.5)

          // Trục tọa độ
          line((-1.1, 0), (7.8, 0), stroke: 0.6pt + black, mark: (end: ">"))
          line((0, -2.2), (0, 3.2), stroke: 0.6pt + black, mark: (end: ">"))

          content((7.95, -0.15), [$x$])
          content((-0.18, 3.35), [$y$])
          content((0.18, -0.18), [$O$])

          // Tiệm cận
          line((2, -2.2), (2, 3.2), stroke: (paint: red, thickness: 0.7pt, dash: "dashed"))
          line((-1.1, 1), (7.8, 1), stroke: (paint: red, thickness: 0.7pt, dash: "dashed"))

          content((2.25, 2.85), [$x=2$], frame: "rect", fill: white, padding: 0.04)
          content((-0.55, 1.22), [$y=1$], frame: "rect", fill: white, padding: 0.04)

          // Đồ thị hàm số (vẽ theo mẫu điểm thật, không bezier)
          line(..left, stroke: (paint: blue, thickness: 1.1pt))
          line(..right, stroke: (paint: blue, thickness: 1.1pt))

          // Đường gióng cho [4;6]
          line((4, 0), (4, f(4)), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          line((6, 0), (6, f(6)), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
          line((0, 0.5), (6, 0.5), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))

          // Mốc trục
          content((4, -0.22), [$4$])
          content((6, -0.22), [$6$])
          content((-0.35, 0.5), [$1/2$])

          // Điểm m, M
          circle(m, radius: 0.06, fill: orange)
          circle(M, radius: 0.06, fill: orange)

          content((3.75, 0.28), [$m$], frame: "rect", fill: white, padding: 0.03)
          content((5.72, 0.78), [$M$], frame: "rect", fill: white, padding: 0.03)

          // Nhãn đồ thị
          content((6.45, 1.45), [$(C)$], fill: blue)
        })
      ]

      - *Ý a) Đúng.* Điều kiện xác định của hàm số là $x - 2 != 0 <=> x != 2$.
        Vậy tập xác định của hàm số là $D = RR backslash {2}$.
      - *Ý b) Đúng.* Áp dụng công thức tính đạo hàm nhanh, ta có:
        $ f'(x) = (1 dot (-2) - 1 dot (-4))/(x-2)^2 = (-2 + 4)/(x-2)^2 = 2/(x-2)^2 $
        Vì $2 > 0$ và $(x-2)^2 > 0$ với mọi $x != 2$, nên $f'(x) > 0 quad forall x != 2$.
      - *Ý c) Sai.* Thay $x = 4$ vào hàm số, ta được:
        $ f(4) = (4-4)/(4-2) = 0/2 = 0 != 2 $
        Vậy $f(4) = 0$.
      - *Ý d) Sai.* Xét trên đoạn $[4; 6]$, ta có đạo hàm $f'(x) = 2/(x-2)^2 > 0 quad forall x in [4; 6]$.
        Do đó, hàm số đồng biến (tăng liên tục) trên đoạn $[4; 6]$.
        Từ đó, ta xác định được:
        - Giá trị nhỏ nhất là $m = f(4) = 0$.
        - Giá trị lớn nhất là $M = f(6) = (6-4)/(6-2) = 2/4 = 1/2$.
        Tổng GTLN và GTNN là:
        $ M + m = 1/2 + 0 = 1/2 $
        Kết quả này khác $2$, nên mệnh đề sai.
    ],
  )

  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trả lời ngắn (6 câu)
  // ═══════════════════════════════════════════════════════════
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)

  // Câu 1
  #tln(
    [Một nghệ nhân tại làng nghề đúc đồng, nhận chế tác các mẫu đôn trang trí cao cấp bằng đồng. Mỗi chiếc đôn có dạng khối tròn xoay đặc, cao $40" cm"$, với thiết kế mềm mại và cân đối quanh một trục thẳng đứng. Khi cắt chiếc đôn bởi một mặt phẳng bất kỳ đi qua trục đối xứng, ta thu được một thiết diện giới hạn bởi hai đường parabol đối xứng nhau qua trục này. Theo yêu cầu thiết kế: Mặt trên và mặt đáy của đôn đều là hình tròn có đường kính $30" cm"$; phần thân được bo thon đều về phía trung tâm, tại đó đường kính nhỏ nhất là $24" cm"$. Biết khối lượng riêng của đồng là $8960" kg/m"^3$, giá đồng là $220$ nghìn đồng/kg và chi phí gia công cho mỗi sản phẩm là $10$ triệu đồng (lượng đồng hao hụt trong quá trình gia công được xem là không đáng kể). Tổng chi phí để hoàn thiện một chiếc đôn theo thiết kế trên là bao nhiêu triệu đồng (_không làm tròn kết quả các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng phần mười_).

      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *
          // Đáy sau (nét đứt)
          arc((1.5, -2), start: 0deg, stop: 180deg, radius: (1.5, 0.3), stroke: (
            dash: "dashed",
            paint: rgb("cc6600"),
            thickness: 1pt,
          ))

          // Thân đôn
          bezier((-1.5, 2), (-1.5, -2), (-1.2, 1), (-1.2, -1), stroke: (paint: rgb("cc6600"), thickness: 1.2pt))
          bezier((1.5, 2), (1.5, -2), (1.2, 1), (1.2, -1), stroke: (paint: rgb("cc6600"), thickness: 1.2pt))

          // Mặt trước đáy
          arc((-1.5, -2), start: 180deg, stop: 360deg, radius: (1.5, 0.3), stroke: (
            paint: rgb("cc6600"),
            thickness: 1.2pt,
          ))

          // Mặt trên cùng
          circle((0, 2), radius: (1.5, 0.3), fill: rgb("ffb366"), stroke: (paint: rgb("cc6600"), thickness: 1.2pt))

          // Trục đối xứng
          line((0, -3), (0, 3), stroke: (dash: "dashed", paint: red, thickness: 1.2pt))
          content((0, 3), $y$ + " (Trục đối xứng)", anchor: "west", padding: 5pt)
          line((-2.5, 0), (3, 0), stroke: (dash: "dashed", paint: black), mark: (end: ">"))
          content((3, 0), $x$, anchor: "north", padding: 5pt)
          content((0.1, -0.1), $O$, anchor: "north-west")

          // Kích thước
          line((-1.5, 2.6), (1.5, 2.6), mark: (start: "<", end: ">"), stroke: 0.5pt)
          content((0, 2.6), $30" cm"$, anchor: "south")
          line((-1.5, 2.4), (-1.5, 2.8), stroke: 0.5pt)
          line((1.5, 2.4), (1.5, 2.8), stroke: 0.5pt)

          line((-2.2, -2), (-2.2, 2), mark: (start: "<", end: ">"), stroke: 0.5pt)
          content((-2.2, 0), "Cao: " + $40" cm"$, anchor: "east", padding: 5pt)
          line((-2.0, -2), (-2.4, -2), stroke: 0.5pt)
          line((-2.0, 2), (-2.4, 2), stroke: 0.5pt)

          line((-1.2, -0.3), (1.2, -0.3), mark: (start: "<", end: ">"), stroke: (dash: "dashed", thickness: 0.5pt))
          content((0, -0.3), $24" cm"$, anchor: "north")
        })
      ]
    ],
    [$52,1$],
    loigiai: [
      #ppgiai[
        - Gắn hệ trục tọa độ $O x y$ với $O y$ là trục đối xứng của chiếc đôn, gốc tọa độ $O$ đặt tại tâm của phần bo thon hẹp nhất.
        - Trục $O y$ cũng chính là trục quay để tạo thành khối tròn xoay.
        - Thể tích khối tròn xoay giới hạn bởi đường cong $x = f(y)$, trục $O y$ và hai đường thẳng $y = a, y = b$ khi quay quanh trục $O y$ là:
          $ V = pi integral_a^b [f(y)]^2 dif y $
        - Các công thức đổi đơn vị và tính toán: $m = D dot V$ (Khối lượng = Khối lượng riêng $times$ Thể tích). Chú ý đổi thống nhất đơn vị về mét và kg.
      ]

      - Chọn hệ tọa độ $O x y$ với tâm $O$ đặt tại vị trí đường kính nhỏ nhất, trục tung $O y$ hướng dọc theo chiều cao chiếc đôn.
      - Khi đó, chiếc đôn trải dài từ $y = -20$ đến $y = 20$.
      - Đường sinh tạo nên khối tròn xoay là một nhánh của parabol có phương trình dạng $x = a y^2 + c$ ($x >= 0$).
      - Tại $y = 0$ (phần hẹp nhất), đường kính là $24" cm" =>$ bán kính $x = 12" cm"$. Do đó $c = 12$.
      - Tại $y = 20$ (mặt trên cùng), đường kính là $30" cm" =>$ bán kính $x = 15" cm"$.
        Thay vào phương trình:
        $ 15 = a dot 20^2 + 12 <=> 400a = 3 <=> a = 3/400 $
      - Phương trình đường parabol sinh ra khối đôn là: $x = 3/400 y^2 + 12$ với $y in [-20; 20]$.
      - Thể tích chiếc đôn (khối tròn xoay) là:
        $
          V &= pi integral_(-20)^20 x^2 dif y = pi integral_(-20)^20 (3/400 y^2 + 12)^2 dif y = 2pi integral_0^20 (9/160000 y^4 + 72/400 y^2 + 144) dif y \
          &= 2pi lr((9/160000 dot y^5/5 + 18/100 dot y^3/3 + 144y)|)_0^20 \
          &= 2pi ( (9 dot 3200000)/800000 + (18 dot 8000)/300 + 144 dot 20 ) = 2pi (36 + 480 + 2880) = 6792pi " (cm"^3")"
        $
      - Đổi đơn vị thể tích sang $"m"^3$:
        $ V = 6792pi times 10^(-6) " (m"^3")" $
      - Khối lượng của chiếc đôn bằng đồng là:
        $ m = D dot V = 8960 times 6792pi times 10^(-6) = 60.85632pi " (kg)" $
      - Chi phí tiền đồng để đúc chiếc đôn là ($220$ nghìn đồng = $0.22$ triệu đồng):
        $ C_"đồng" = m times 0.22 = 60.85632pi times 0.22 = 13.3883904pi " (triệu đồng)" $
      - Tổng chi phí để hoàn thiện chiếc đôn (bao gồm tiền đồng và $10$ triệu tiền gia công) là:
        $ C_"tổng" = 13.3883904pi + 10 approx 42.0601 + 10 = 52.0601 " (triệu đồng)" $
      - Làm tròn kết quả cuối cùng đến hàng phần mười, ta thu được tổng chi phí là *$52,1$* triệu đồng.
    ],
  )

  // Câu 2
  #tln(
    [Cho hình lăng trụ tam giác đều $A B C . A' B' C'$ có cạnh đáy bằng $6$. Khoảng cách từ điểm $A'$ đến mặt phẳng $(A B' C')$ bằng $4$. Tính thể tích khối lăng trụ (_không làm tròn kết quả các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng phần mười_).],
    [$97,7$],
    loigiai: [
      #ppgiai[
        - Lăng trụ tam giác đều là lăng trụ đứng có đáy là tam giác đều.
        - *Phương pháp tọa độ hóa:*
          - Đặt gốc tọa độ $O$ tại trung điểm của cạnh $B' C'$.
          - Trục $O x$ dọc theo $B' C'$, trục $O y$ đi qua $A'$, trục $O z$ thẳng đứng hướng lên trên song song với các cạnh bên.
        - Viết phương trình mặt phẳng $(A B' C')$. _Lưu ý:_ Mặt phẳng đi qua gốc tọa độ và chứa trục $O x$ sẽ có phương trình dạng $b y + c z = 0$.
        - Áp dụng công thức khoảng cách từ điểm $M(x_0, y_0, z_0)$ đến mặt phẳng $(P): A x + B y + C z + D = 0$:
          $ d(M, (P)) = |A x_0 + B y_0 + C z_0 + D|/sqrt(A^2 + B^2 + C^2) $
        - Tính chiều cao $h$, sau đó tính thể tích khối lăng trụ $V = S_"đáy" dot h$.
      ]

      #align(center)[
        #cetz.canvas(length: 0.8cm, {
          import cetz.draw: *
          let O = (0, 0)
          let Cp = (-3, 0.5)
          let Bp = (3, -0.5)
          let Ap = (-1, -2.5)
          let h = 5
          let C = (-3, 0.5 + h)
          let B = (3, -0.5 + h)
          let A = (-1, -2.5 + h)

          // Hệ trục tọa độ
          line(Cp, Bp, (4, -0.66), mark: (end: ">"), stroke: (dash: "dashed", paint: red, thickness: 1pt))
          content((4, -0.66), $x$, anchor: "south", fill: red)
          line(O, Ap, (-1.5, -3.75), mark: (end: ">"), stroke: (dash: "dashed", paint: red, thickness: 1pt))
          content((-1.5, -3.75), $y$, anchor: "west", fill: red)
          line(O, (0, h), (0, h + 1.5), mark: (end: ">"), stroke: (dash: "dashed", paint: red, thickness: 1pt))
          content((0, h + 1.5), $z$, anchor: "east", fill: red)
          circle(O, radius: 1.5pt, fill: red)
          content((0.2, 0.2), $O$, anchor: "south-west", fill: red)

          // Nét khuất
          line(Ap, Cp, stroke: (dash: "dashed", thickness: 1pt))
          line(Cp, C, stroke: (dash: "dashed", thickness: 1pt))

          // Mặt phẳng (A B' C')
          line(A, Bp, Cp, close: true, fill: rgb("0000ff33"), stroke: (dash: "dashed", paint: blue, thickness: 1pt))

          // Nét thấy
          line(Ap, Bp, stroke: 1pt)
          line(A, B, C, close: true, stroke: 1pt)
          line(A, Ap, stroke: 1pt)
          line(B, Bp, stroke: 1pt)

          content(Ap, $A'$, anchor: "north-east")
          content(Bp, $B'$, anchor: "west")
          content(Cp, $C'$, anchor: "east")
          content(A, $A$, anchor: "south-east")
          content(B, $B$, anchor: "west")
          content(C, $C$, anchor: "east")
        })
      ]

      - Gọi $h$ là chiều cao của lăng trụ ($h > 0$).
      - Chọn hệ trục tọa độ $O x y z$ với gốc $O(0;0;0)$ là trung điểm của đoạn $B' C'$.
      - Cạnh đáy bằng 6 nên $B' C' = 6 => O B' = O C' = 3$. Các tọa độ điểm tương ứng trên trục $O x$:
        $ B'(3; 0; 0), quad C'(-3; 0; 0) $
      - Tam giác $A' B' C'$ đều cạnh 6, đường cao $A' O = (6sqrt(3))/2 = 3sqrt(3)$. Tia $O A'$ nằm trên trục dương $O y$:
        $ A'(0; 3sqrt(3); 0) $
      - Điểm $A$ là hình chiếu của $A'$ dời lên theo trục $O z$ một khoảng $h$:
        $ A(0; 3sqrt(3); h) $
      - *Viết phương trình mặt phẳng $(A B' C')$:*
        Mặt phẳng $(A B' C')$ chứa đường thẳng $B' C'$ chính là trục $O x$, do đó phương trình có dạng:
        $ b y + c z = 0 $
        Mặt phẳng đi qua $A(0; 3sqrt(3); h)$, thay tọa độ $A$ vào ta được:
        $ b(3sqrt(3)) + c(h) = 0 $
        Chọn $b = h => c = -3sqrt(3)$. Khi đó phương trình mặt phẳng $(A B' C')$ là:
        $ (A B' C'): h y - 3sqrt(3) z = 0 $
      - *Sử dụng dữ kiện khoảng cách:*
        Khoảng cách từ $A'(0; 3sqrt(3); 0)$ đến mặt phẳng $(A B' C')$ bằng 4:
        $
          d(A', (A B' C')) = |h dot 3sqrt(3) - 3sqrt(3) dot 0|/sqrt(0^2 + h^2 + (-3sqrt(3))^2) = (3sqrt(3) h)/sqrt(h^2 + 27)
        $
        Theo bài ra ta có:
        $ (3sqrt(3) h)/sqrt(h^2 + 27) = 4 quad <=> quad 27h^2 = 16(h^2 + 27) $
        $ <=> 27h^2 = 16h^2 + 432 quad <=> quad 11h^2 = 432 quad <=> quad h = (12sqrt(3))/sqrt(11) $
      - *Tính thể tích khối lăng trụ:*
        Diện tích đáy (tam giác đều cạnh bằng 6):
        $ S_"đáy" = (6^2 sqrt(3))/4 = 9sqrt(3) $
        Thể tích khối lăng trụ là:
        $ V = S_"đáy" dot h = 9sqrt(3) dot (12sqrt(3))/sqrt(11) = 324/sqrt(11) approx 97.68968... $
      - Làm tròn kết quả cuối cùng đến hàng phần mười, ta thu được $V approx *97,7*$.
    ],
  )

  // Câu 3
  #tln(
    [Trong một dự án phủ sóng viễn thông cho vùng cao, các kỹ sư cần lắp đặt một trạm phát sóng trên một sườn núi. Qua khảo sát, sườn núi này được mô hình hóa trong hệ tọa độ $O x y z$ bằng mặt phẳng $(P): x+y-4z-4=0$ (với $z >= 0$, đơn vị trên các trục là 100 m). Trạm phát sóng có cột ăng-ten cao 100m, được dựng thẳng đứng (song song với trục $O z$) với chân cột $H(x_H; y_H; z_H)$ nằm trên sườn núi $(P)$. Thiết bị phát tín hiệu đặt tại đỉnh $S$ của cột có bán kính phủ sóng tối đa là $100sqrt(54)$ m. Dưới chân núi có một khu dân cư nhỏ nằm trong mặt phẳng $(O x y)$. Để đảm bảo sóng ổn định và bao phủ toàn bộ khu vực này, các kỹ sư tính toán yêu cầu hai vị trí trọng yếu là $A(-3; 1; 0)$ và $B(1; -1; 0)$ phải nằm ở vạch ranh giới cuối cùng của vùng phủ sóng. Tính giá trị $T = x_H + y_H + z_H$.

      #align(center)[
        #cetz.canvas(length: 0.9cm, {
          import cetz.draw: *
          // Mặt phẳng Oxy
          rect((-3, -1.5), (5, 1.5), fill: rgb("e6e6e6"), radius: 2pt)
          content((-3, -0.5), $(O x y)$, anchor: "north-west", fill: rgb("666666"))

          // Mặt phẳng (P)
          let P1 = (-1, 1.5)
          let P2 = (4, 3.5)
          let P3 = (6, 1)
          let P4 = (1, -1)

          line(P1, P2, P3, P4, close: true, fill: rgb("cc9966e6"), stroke: (paint: rgb("804000"), thickness: 1pt))
          content((1.5, 3), $(P)$, anchor: "north")

          // Bóng
          line(P3, P4, (6, -0.8), close: true, fill: rgb("333333"), stroke: none)

          // Cột ăng ten
          let H = (2, 1.2)
          let S = (2, 2.7)
          line(H, S, stroke: (thickness: 2pt))
          circle(S, radius: 2pt, fill: blue)
          content(S, $S$, anchor: "west", padding: 3pt)
          circle(H, radius: 2pt, fill: blue)
          content(H, $H$, anchor: "east", padding: 3pt)

          // Điểm A và B
          let A = (-2, 0)
          let B = (3, -1)
          circle(A, radius: 2pt, fill: blue)
          content(A, $A$, anchor: "south", padding: 3pt)
          circle(B, radius: 2pt, fill: blue)
          content(B, $B$, anchor: "west", padding: 3pt)

          // Đường sóng
          line(S, A, stroke: (dash: "dashed", paint: rgb("6666ff"), thickness: 1pt))
          content((-0.2, 1.5), $R$, anchor: "south-east")
          line(S, B, stroke: (dash: "dashed", paint: rgb("6666ff"), thickness: 1pt))
          content((2.5, 1.8), $R$, anchor: "west")
        })
      ]
    ],
    [$9$],
    loigiai: [
      #ppgiai[
        - Đổi các đơn vị độ dài về cùng một hệ chuẩn theo đơn vị của hệ trục tọa độ: $1$ đơn vị $= 100" m"$.
        - Lập tọa độ của điểm phát sóng $S$ dựa vào tọa độ chân cột $H$ và chiều cao cột ăng-ten (lưu ý cột dựng thẳng đứng song song trục $O z$).
        - Các điểm nằm trên "vạch ranh giới cuối cùng" của vùng phủ sóng tức là khoảng cách từ điểm phát $S$ đến các điểm đó đúng bằng bán kính phủ sóng $R$. Ta thiết lập hệ phương trình $S A = S B = R$.
        - Giải hệ phương trình kết hợp với điều kiện điểm $H$ thuộc mặt phẳng $(P)$ và $z_H >= 0$ để tìm chính xác tọa độ của $H$.
      ]

      - *Bước 1: Quy đổi đơn vị và tọa độ điểm $S$.*
        Do $1$ đơn vị trên trục tọa độ tương ứng với $100" m"$ thực tế, ta có:
        - Chiều cao cột ăng-ten $h = 100" m" = 1$ (đơn vị).
        - Bán kính phủ sóng $R = 100sqrt(54)" m" = sqrt(54)$ (đơn vị).
        Cột ăng-ten thẳng đứng (song song với $O z$) và chân cột là $H(x_H; y_H; z_H)$, nên đỉnh cột $S$ sẽ có tọa độ là $S(x_H; y_H; z_H + 1)$.

      - *Bước 2: Thiết lập hệ phương trình khoảng cách.*
        Hai điểm $A(-3; 1; 0)$ và $B(1; -1; 0)$ nằm ở ranh giới vùng phủ sóng nên $S A = S B = R = sqrt(54)$.
        Bình phương hai vế, ta được $S A^2 = 54$ và $S B^2 = 54$.
        $ S A^2 = (-3 - x_H)^2 + (1 - y_H)^2 + (0 - (z_H + 1))^2 = 54 $
        $ S B^2 = (1 - x_H)^2 + (-1 - y_H)^2 + (0 - (z_H + 1))^2 = 54 $

      - *Bước 3: Khai thác phương trình $S A^2 = S B^2$.*
        Từ hai phương trình trên, cho $S A^2 = S B^2$:
        $ (x_H + 3)^2 + (y_H - 1)^2 = (x_H - 1)^2 + (y_H + 1)^2 $
        $ <=> x_H^2 + 6x_H + 9 + y_H^2 - 2y_H + 1 = x_H^2 - 2x_H + 1 + y_H^2 + 2y_H + 1 $
        $ <=> 6x_H - 2y_H + 10 = -2x_H + 2y_H + 2 $
        $ <=> 8x_H - 4y_H + 8 = 0 quad <=> quad 2x_H - y_H + 2 = 0 quad <=> quad y_H = 2x_H + 2 quad (1) $

      - *Bước 4: Sử dụng điều kiện $H in (P)$.*
        Vì $H$ nằm trên mặt phẳng $(P): x + y - 4z - 4 = 0$, ta có:
        $ x_H + y_H - 4z_H - 4 = 0 $
        Thay $(1)$ vào phương trình trên:
        $ x_H + (2x_H + 2) - 4z_H - 4 = 0 quad <=> quad 3x_H - 4z_H - 2 = 0 $
        $ => 4z_H = 3x_H - 2 quad <=> quad z_H = (3x_H - 2)/4 quad (2) $

      - *Bước 5: Giải phương trình tìm $x_H$.*
        Thay $y_H$ và $z_H$ theo $x_H$ vào phương trình $S B^2 = 54$:
        $ (1 - x_H)^2 + (-1 - (2x_H + 2))^2 + ( (3x_H - 2)/4 + 1 )^2 = 54 $
        $ <=> (1 - x_H)^2 + (-2x_H - 3)^2 + ( (3x_H + 2)/4 )^2 = 54 $
        $ <=> (1 - 2x_H + x_H^2) + (4x_H^2 + 12x_H + 9) + (9x_H^2 + 12x_H + 4)/16 = 54 $
        $ <=> 5x_H^2 + 10x_H + 10 + (9x_H^2 + 12x_H + 4)/16 = 54 $
        Nhân cả hai vế với 16 để quy đồng mẫu số:
        $ 80x_H^2 + 160x_H + 160 + 9x_H^2 + 12x_H + 4 = 864 $
        $ <=> 89x_H^2 + 172x_H - 700 = 0 $
        Phương trình bậc hai này có hai nghiệm phân biệt:
        $ x_H = 2 quad "hoặc" quad x_H = -350/89 $

      - *Bước 6: Đối chiếu điều kiện và tính $T$.*
        - *Trường hợp 1:* Với $x_H = -350/89$, ta tính được $z_H = (3(-350/89) - 2)/4 < 0$. Nghiệm này bị loại do vi phạm điều kiện $z >= 0$ của đề bài.
        - *Trường hợp 2:* Với $x_H = 2$, ta tính được:
          $ y_H = 2(2) + 2 = 6 $
          $ z_H = (3(2) - 2)/4 = 4/4 = 1 quad ("Thỏa mãn " z >= 0) $
        Vậy tọa độ chân cột là $H(2; 6; 1)$.
        Giá trị cần tìm là $T = x_H + y_H + z_H = 2 + 6 + 1 = *9*$.
    ],
  )

  // Câu 4
  #tln(
    [Một nhà đầu tư có 10 tỷ đồng và dự kiến đầu tư trong 15 năm để chuẩn bị cho kế hoạch hưu trí. Nhà đầu tư này phân vân giữa hai phương án: \
      Phương án 1: Gửi tiết kiệm toàn bộ số tiền vào ngân hàng với lãi suất $7,0%"/năm"$, lãi kép kỳ hạn một năm và không rút vốn trong suốt thời gian đầu tư. \
      Phương án 2: Gửi tiền vào ngân hàng với lãi suất $4,5%"/năm"$, lãi kép kỳ hạn một năm. Vào cuối mỗi năm, rút một số tiền cố định là $X$ đồng để đầu tư vào một quỹ chỉ số cổ phiếu có mức sinh lời cố định $11%"/năm"$ (mức sinh lời này được áp dụng tính toán tương tự như lãi suất ngân hàng theo thể thức lãi kép). Biết $X$ được tính toán sao cho tài khoản tiền gửi ngân hàng vừa hết ngay sau lần rút cuối cùng. \
      Giả sử lãi suất và mức sinh lời không đổi, sau 15 năm, tổng số tiền thu được từ Phương án 2 nhiều hơn Phương án 1 bao nhiêu triệu đồng (_không làm tròn kết quả ở các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng đơn vị_)?],
    [$4447$],
    loigiai: [
      #ppgiai[
        *Các công thức Toán tài chính cần sử dụng:*
        - *Lãi kép:* Gửi số tiền $P$ với lãi suất $r$ mỗi kỳ, sau $n$ kỳ, số tiền thu được cả gốc lẫn lãi là:
          $ A = P(1+r)^n $
        - *Giá trị hiện tại của chuỗi tiền tệ đều:* Rút đều đặn số tiền $X$ vào cuối mỗi kỳ trong $n$ kỳ từ một tài khoản ngân hàng (lãi suất $r$/kỳ) cho đến khi cạn vốn. Khi đó vốn ban đầu $P$ và mức rút $X$ liên hệ theo công thức:
          $ P = X dot (1 - (1+r)^(-n))/r quad => quad X = P dot r/(1 - (1+r)^(-n)) $
        - *Giá trị tương lai của chuỗi tiền tệ đều:* Đóng đều đặn số tiền $X$ vào cuối mỗi kỳ trong $n$ kỳ vào một quỹ (mức sinh lời $r$/kỳ). Sau $n$ kỳ, tổng số tiền tích lũy được là:
          $ A = X dot ((1+r)^n - 1)/r $
      ]

      #align(center)[
        #cetz.canvas(length: 0.9cm, {
          import cetz.draw: *
          // Trục thời gian
          line((0, 0), (12, 0), mark: (end: ">"), stroke: 1pt)
          content((12, 0), "Năm", anchor: "west")

          // Mốc thời gian
          for (x, lbl) in ((0, "0"), (2, "1"), (4, "2"), (6, "3"), (10, "15")) {
            line((x, 0.1), (x, -0.1), stroke: 1pt)
            content((x, -0.3), lbl)
          }
          content((8, -0.3), $...$)

          // Gửi vào T=0
          line((0, -1), (0, -0.2), mark: (end: ">"), stroke: (paint: red, thickness: 1pt))
          content((0, -1.2), $10$ + " Tỷ (Gửi 4,5%)", anchor: "north", fill: red)

          // Rút ra và Đầu tư
          for x in (2, 4, 6, 10) {
            line((x, 0.2), (x, 1), mark: (end: ">"), stroke: (paint: blue, thickness: 1pt))
            content((x - 0.2, 0.6), $X$, anchor: "east", fill: blue)
            circle((x, 1), radius: 1.5pt, fill: blue)
          }

          // Gom vào quỹ
          let g = rgb("009900")
          line((2, 1), (2, 1.5), (10, 1.5), (10, 2.5), mark: (end: ">"), stroke: (paint: g, thickness: 1pt))
          line((4, 1), (4, 1.5), mark: (end: ">"), stroke: (paint: g, thickness: 1pt))
          line((6, 1), (6, 1.5), mark: (end: ">"), stroke: (paint: g, thickness: 1pt))
          line((10, 1), (10, 1.5), mark: (end: ">"), stroke: (paint: g, thickness: 1pt))

          content((10, 2.7), [Quỹ cổ phiếu \ (Sinh lời 11%)], anchor: "south", fill: g)
        })
      ]

      - Đổi đơn vị: $10 " tỷ đồng" = 10000 " triệu đồng"$. Ta tính toán với đơn vị triệu đồng. Ký hiệu $P = 10000$.
      - *Với Phương án 1:*
        Số tiền thu được sau 15 năm gửi ngân hàng với lãi suất $r_1 = 7% = 0.07$ là:
        $ A_1 = 10000 dot (1 + 0.07)^15 = 10000 dot 1.07^15 approx 27590.31541 " (triệu đồng)" $
      - *Với Phương án 2:*
        - Số tiền $X$ rút ra mỗi năm để tài khoản ngân hàng (lãi suất $r_2 = 4.5% = 0.045$) cạn sạch sau 15 năm là:
          $ X = P dot r_2/(1 - (1+r_2)^(-15)) = 10000 dot 0.045/(1 - 1.045^(-15)) approx 931.1561082 " (triệu đồng)" $
        - Mỗi năm đem số tiền $X$ này đầu tư vào quỹ cổ phiếu có mức sinh lời $r_3 = 11% = 0.11$. Tổng số tiền tích lũy được trong quỹ sau 15 năm là:
          $ A_2 = X dot ((1+r_3)^15 - 1)/r_3 = 931.1561082 dot (1.11^15 - 1)/0.11 approx 32036.84093 " (triệu đồng)" $
      - *So sánh hai phương án:*
        Số tiền Phương án 2 nhiều hơn Phương án 1 là:
        $ Delta A = A_2 - A_1 = 32036.84093 - 27590.31541 = 4446.52552 " (triệu đồng)" $
      - Làm tròn kết quả cuối cùng đến hàng đơn vị (tức là làm tròn số triệu đồng), ta được:
        $ 4446.52552 approx 4447 $
        Vậy Phương án 2 thu được nhiều hơn Phương án 1 khoảng *$4447$* triệu đồng.
    ],
  )

  // Câu 5
  #tln(
    [Trong một trò chơi, có $22$ chiếc đèn được bố trí cách đều nhau trên một vòng tròn lớn (hình vẽ). Khi người chơi bấm nút, hệ thống máy tính sẽ chọn ngẫu nhiên $3$ chiếc đèn để thắp sáng đồng thời. Nếu tâm của vòng tròn nằm hoàn toàn bên trong tam giác tạo bởi $3$ bóng đèn được thắp sáng đó thì người chơi được nhận một phần quà. Mỗi người chơi thực hiện $5$ lần bấm nút. Tính xác suất để một người chơi may mắn giành được ít nhất $2$ phần quà (_không làm tròn kết quả ở các phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng phần trăm_).

      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          circle((0, 0), radius: 3.2, fill: rgb("#1b5aed"))
          circle((0, 0), radius: 2.5, fill: rgb("#cccccc"))
          circle((0, 0), radius: 2.4, fill: rgb("#e3dd02"))

          // Tâm O
          circle((0, 0), radius: 2pt, fill: red)
          content((0, -0.3), $O$, fill: red)

          // 22 đèn
          for i in range(1, 23) {
            let angle = -90deg + i * (360deg / 22)
            circle((angle, 2.85), radius: 3pt, fill: red)
          }

          // 3 đèn được thắp sáng A, B, C
          let aA = 90deg + 2 * (360deg / 22)
          let aB = 90deg - 7 * (360deg / 22)
          let aC = 90deg + 9 * (360deg / 22)

          let pA = (aA, 2.85)
          let pB = (aB, 2.85)
          let pC = (aC, 2.85)

          circle(pA, radius: 4.5pt, fill: rgb("ffffcc"), stroke: (paint: orange, thickness: 1pt))
          content((aA, 3.2), $A$)
          circle(pB, radius: 4.5pt, fill: rgb("ffffcc"), stroke: (paint: orange, thickness: 1pt))
          content((aB, 3.2), $B$)
          circle(pC, radius: 4.5pt, fill: rgb("ffffcc"), stroke: (paint: orange, thickness: 1pt))
          content((aC, 3.2), $C$)

          line(pA, pB, pC, close: true, stroke: (dash: "dashed", paint: blue, thickness: 1pt))

          content((0, -3.8), [_Tâm O nằm trong tam giác sáng_], fill: blue)
        })
      ]
    ],
    [$0,29$],
    loigiai: [
      #ppgiai[
        - *Đánh giá hình học:* Tâm của đa giác đều nằm hoàn toàn bên trong một tam giác tạo bởi $3$ đỉnh của đa giác đó khi và chỉ khi tam giác đó là một tam giác nhọn.
        - *Phương pháp đếm tam giác nhọn:* Từ một đa giác đều $n$ đỉnh (với $n$ chẵn, $n = 2k$), số tam giác nhọn tạo thành từ $3$ đỉnh của đa giác được tính gián tiếp bằng: Tổng số tam giác trừ đi số tam giác vuông và số tam giác tù.
        - *Lý thuyết xác suất Bernoulli:* Thực hiện $n$ phép thử độc lập, mỗi phép thử có xác suất thành công là $p$. Xác suất để có đúng $k$ lần thành công là:
          $ P(X=k) = C_n^k p^k (1-p)^(n-k) $
      ]

      - *Bước 1: Tính xác suất thắp sáng được tam giác chứa tâm (thắng 1 ván).*
        Số phần tử của không gian mẫu (chọn ngẫu nhiên $3$ đèn từ $22$ đèn):
        $ n(Omega) = C_22^3 = 1540 $
        Gọi $A$ là biến cố "3 bóng đèn được chọn tạo thành tam giác nhọn". Đa giác có $22$ đỉnh ($n=22$, tức $k=11$).

        *Số tam giác vuông:* Đa giác có $11$ đường kính. Mỗi đường kính kết hợp với $1$ trong $20$ đỉnh còn lại sẽ tạo thành một tam giác vuông. Có $11 times 20 = 220$ tam giác vuông.

        *Số tam giác tù:* Các đỉnh của tam giác tù phải nằm trọn trong một nửa đường tròn (không chứa đường kính). Chọn $1$ đỉnh làm điểm mốc đầu tiên theo chiều kim đồng hồ, $2$ đỉnh còn lại phải được chọn từ $10$ đỉnh liền kề tiếp theo. Có $22$ cách chọn đỉnh mốc, và $C_10^2$ cách chọn $2$ đỉnh kia. Vậy có $22 times C_10^2 = 22 times 45 = 990$ tam giác tù.

        Số kết quả thuận lợi cho biến cố $A$ là:
        $ n(A) = 1540 - 220 - 990 = 330 $

        Xác suất để người chơi nhận được phần quà trong $1$ ván là:
        $ p = 330/1540 = 3/14 quad => quad q = 1 - p = 11/14 $

      - *Bước 2: Tính xác suất giành được ít nhất 2 phần quà.*
        Người chơi bấm $5$ lần. Gọi $X$ là số phần quà giành được ($X tilde B(5; p)$). Xác suất để $X >= 2$ là:
        $ P(X >= 2) = 1 - [P(X=0) + P(X=1)] $
        Ta tính từng trường hợp:
        $ P(X=0) = C_5^0 (3/14)^0 (11/14)^5 = 161051/537824 $
        $ P(X=1) = C_5^1 (3/14)^1 (11/14)^4 = 5 times 3/14 times 14641/38416 = 219615/537824 $
        Xác suất để người chơi giành được ít nhất $2$ phần quà là:
        $ P(X >= 2) = 1 - (161051 + 219615)/537824 = 1 - 380666/537824 = 157158/537824 approx 0.29221 $
      - Làm tròn kết quả cuối cùng đến hàng phần trăm, ta thu được *$0,29$*.
    ],
  )

  // Câu 6
  #tln(
    [Một cơ sở sản xuất nước mắm dự định tung ra thị trường dòng sản phẩm nước mắm đặc biệt. Dự kiến mỗi tháng cơ sở sản xuất và bán ra $x$ chai ($0 <= x <= 2000$). Giá bán mỗi chai được ấn định là $350000$ đồng. Tổng chi phí sản xuất $x$ chai mỗi tháng (bao gồm nguyên liệu, nhân công, bao bì và chi phí vận hành) được ước tính bởi hàm số: $C(x) = 1/10 x^2 + 110x + 30000$ (đơn vị: nghìn đồng). Hỏi cơ sở nên sản xuất bao nhiêu chai mỗi tháng để lợi nhuận đạt giá trị lớn nhất?],
    [$1200$],
    loigiai: [
      #ppgiai[
        - *Đổi đơn vị:* Cần đồng nhất đơn vị tính toán. Đề cho hàm chi phí $C(x)$ theo "nghìn đồng", nên giá bán $350000$ đồng cũng phải đổi sang $350$ nghìn đồng.
        - *Hàm doanh thu:* Doanh thu $R(x)$ thu được khi bán $x$ sản phẩm là $R(x) = ("Giá bán") times x$.
        - *Hàm lợi nhuận:* Lợi nhuận $P(x)$ được tính bằng Doanh thu trừ đi Chi phí: $P(x) = R(x) - C(x)$.
        - *Tìm giá trị lớn nhất:* Khảo sát hàm số $P(x)$ trên tập xác định $D = [0; 2000]$. Lợi nhuận đạt cực đại khi đạo hàm $P'(x) = 0$ (với điều kiện điểm đó thuộc $D$ và hàm số đạt đỉnh).
      ]

      #align(center)[
        #cetz.canvas(length: 2.5cm, {
          import cetz.draw: *
          // Trục tọa độ
          line((-0.2, 0), (2.3, 0), mark: (end: ">"))
          content((2.3, -0.15), $x$ + " (nghìn chai)", anchor: "south")
          line((0, -0.4), (0, 1.4), mark: (end: ">"))
          content((-0.1, 1.4), $P(x)$ + " (trăm triệu đồng)", anchor: "east")
          content((-0.1, -0.1), $O$)

          // Parabol: y' = - x'^2 + 2.4x' - 0.3
          bezier((0.13, 0), (2.27, 0), (0.843, 1.52), (1.557, 1.52), stroke: (paint: blue, thickness: 1.2pt))

          // Đỉnh
          let Max = (1.2, 1.14)
          line((1.2, 0), Max, stroke: (dash: "dashed", paint: red, thickness: 1pt))
          content((1.2, -0.15), $1200$)
          line((0, 1.14), Max, stroke: (dash: "dashed", paint: red, thickness: 1pt))
          content((-0.1, 1.14), $114000$, anchor: "east")
          circle(Max, radius: 1.5pt, fill: red)
          content((1.2, 1.25), "Lợi nhuận Max")

          content((1.6, 1.05), $P(x)$, fill: blue)
        })
      ]

      - *Bước 1: Thiết lập hàm lợi nhuận.*
        Đổi giá bán mỗi chai ra đơn vị "nghìn đồng": $350000 " đồng" = 350 " nghìn đồng"$.
        Hàm doanh thu khi bán ra $x$ chai là:
        $ R(x) = 350x " (nghìn đồng)" $
        Hàm lợi nhuận mỗi tháng của cơ sở là:
        $ P(x) = R(x) - C(x) = 350x - ( 1/10 x^2 + 110x + 30000 ) $
        $ => P(x) = -1/10 x^2 + 240x - 30000 " (nghìn đồng)" $
        với điều kiện $x in [0; 2000]$.

      - *Bước 2: Tìm giá trị lớn nhất của hàm lợi nhuận.*
        Tính đạo hàm bậc nhất của hàm số $P(x)$:
        $ P'(x) = -2/10 x + 240 = -1/5 x + 240 $
        Cho $P'(x) = 0$ để tìm điểm tới hạn:
        $ -1/5 x + 240 = 0 quad <=> quad 1/5 x = 240 quad <=> quad x = 1200 $
        Giá trị $x = 1200$ thỏa mãn điều kiện $0 <= x <= 2000$.

      - *Bước 3: Lập luận chứng minh cực đại.*
        Vì hàm số $P(x) = -1/10 x^2 + 240x - 30000$ là một tam thức bậc hai có hệ số $a = -1/10 < 0$, đồ thị của nó là một parabol có bề lõm hướng xuống dưới.
        Do đó, hàm số đạt giá trị lớn nhất tại đỉnh của parabol, chính là điểm $x = 1200$.
        Lợi nhuận lớn nhất thu được khi đó là:
        $ P(1200) = -1/10 (1200)^2 + 240(1200) - 30000 = -144000 + 288000 - 30000 = 114000 " (nghìn đồng)" $
        (Tương đương $114$ triệu đồng).
      - *Kết luận:* Vậy cơ sở nên sản xuất *$1200$* chai nước mắm mỗi tháng để đạt được lợi nhuận lớn nhất.
    ],
  )


]

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het

  // ═══════════════════════════════════════════════════════════
  // BẢNG ĐÁP ÁN (3 loại — tự động)
  // ═══════════════════════════════════════════════════════════
  pagebreak()
  print-answer-key()
}
