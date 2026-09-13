#import "@preview/cetz:0.3.3"
#import "@preview/sang-math:1.0.4": *

// ========================================================
// CẤU HÌNH GIAO DIỆN ĐỀ THI - SANG-MATH 1.0.4
// ========================================================
#let theme = "teal-pro"
#let profile = "loigiai"
#let opt-style = "vietnam-star"
#let answer-key = true
#let preset = exam-preset(
  theme: theme,
  profile: profile,
  opt-style: opt-style,
  answer-key: answer-key,
  two-columns: false,
  draft: false,
)

#show math.cases: it => math.display(it)
#show math.frac: math.display
#let lim = math.limits(math.lim, inline: true)

#let (tn, ds, tln, tl) = exam-mode(..preset.question)

#show: exam-theme.with(
  theme: preset.theme,
  school: "BỘ ĐỀ TINH HOA THỰC CHIẾN 2026",
  exam-title: "TDMZZ - 30 ĐỀ TINH HOA THỰC CHIẾN",
  subject: "TOÁN 12 - ĐỀ SỐ 01",
  duration: "90 phút",
  code: "TDMZZ01",
  ..preset.template,
)

// ========================================================
// PHẦN I. CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN (12 CÂU)
// ========================================================
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// --- CÂU 1 ---
#tn(
  [Tập nghiệm của bất phương trình $log_2 (3x - 1) < 3$ là],
  (
    True([$(1/3; 3)$]),
    [$(0; 2)$],
    [$(1; 4)$],
    [$(2; 6)$],
  ),
  loigiai: [
    #step[Tìm điều kiện xác định]
    Biểu thức dưới dấu logarit phải dương:
    $ 3x - 1 > 0 <=> x > 1/3. $
    #step[Giải bất phương trình logarit]
    Vì cơ số $2 > 1$ nên bất phương trình giữ nguyên chiều:
    $ log_2 (3x - 1) < 3 <=> 3x - 1 < 2^3 <=> 3x - 1 < 8 <=> 3x < 9 <=> x < 3. $
    #step[Kết luận tập nghiệm]
    Kết hợp với điều kiện $x > 1/3$, ta được tập nghiệm của bất phương trình là $S = (1/3; 3)$.
    
    #luuy[Biểu thức dưới dấu logarit bắt buộc phải dương ($3x - 1 > 0 <=> x > 1/3$). Quên đặt điều kiện sẽ dẫn đến kết luận sai lầm $S = (-oo; 3)$.]
  ]
)

// --- CÂU 2 ---
#tn(
  [Đạo hàm của hàm số $y = 2^x$ là],
  (
    True([$y' = 2^x ln 2$]),
    [$y' = 2^x$],
    [$y' = 2^x / ln 2$],
    [$y' = x dot 2^(x - 1)$],
  ),
  loigiai: [
    #step[Áp dụng công thức đạo hàm hàm số mũ]
    Với hàm số mũ cơ số $a > 0, a != 1$, ta có công thức:
    $ (a^x)' = a^x ln a. $
    Do đó với $a = 2$, ta có:
    $ y' = (2^x)' = 2^x ln 2. $
    
    #luuy[Tránh nhầm lẫn giữa đạo hàm của hàm số lũy thừa $(x^alpha)' = alpha x^(alpha - 1)$ và đạo hàm của hàm số mũ $(a^x)' = a^x ln a$.]
  ]
)

// --- CÂU 3 ---
#tn(
  [Cho hình lăng trụ đứng $A B C. A' B' C'$ có đáy là tam giác đều và có mặt bên là hình vuông có diện tích bằng $16$. Thể tích của khối lăng trụ $A B C. A' B' C'$ bằng],
  (
    [$4 sqrt(3)$],
    [$24$],
    [$8 sqrt(6)$],
    True([$16 sqrt(3)$]),
  ),
  fig: cetz.canvas({
    import cetz.draw: *
    let a = 2.4
    let h = 2.6
    let b = 0.55 * a
    
    // Tọa độ các đỉnh
    let A = (0, 0)
    let B = (0.9, -0.6)
    let C = (a, 0)
    let A1 = (0, h)
    let B1 = (0.9, h - 0.6)
    let C1 = (a, h)
    
    // Vẽ nét đứt và nét liền
    line(A, C, stroke: (dash: "dashed", paint: gray.darken(20%), thickness: 0.8pt))
    line(A1, B1, C1, close: true, stroke: 1pt + black)
    line(A, B, C, stroke: 1pt + black)
    line(A, A1, stroke: 1pt + black)
    line(B, B1, stroke: 1pt + black)
    line(C, C1, stroke: 1pt + black)
    
    // Các điểm và nhãn
    circle(A, radius: 1.5pt, fill: black)
    circle(B, radius: 1.5pt, fill: black)
    circle(C, radius: 1.5pt, fill: black)
    circle(A1, radius: 1.5pt, fill: black)
    circle(B1, radius: 1.5pt, fill: black)
    circle(C1, radius: 1.5pt, fill: black)
    
    content((rel: (-0.2, 0), to: A), [$A$])
    content((rel: (0, -0.25), to: B), [$B$])
    content((rel: (0.2, 0), to: C), [$C$])
    content((rel: (-0.2, 0.1), to: A1), [$A'$])
    content((rel: (0, 0.25), to: B1), [$B'$])
    content((rel: (0.2, 0.1), to: C1), [$C'$])
  }),
  loigiai: [
    #step[Xác định kích thước của khối lăng trụ]
    Mặt bên của hình lăng trụ đứng là hình chữ nhật, theo giả thiết mặt bên là hình vuông có diện tích bằng $16$:
    $ S_("mặt bên") = a^2 = 16 => a = 4. $
    Do đó chiều cao lăng trụ $h = A A' = 4$ và độ dài cạnh đáy tam giác đều là $a = A B = 4$.
    #step[Tính diện tích đáy và thể tích lăng trụ]
    - Diện tích tam giác đều $A B C$ cạnh $a = 4$:
      $ S_(A B C) = (a^2 sqrt(3))/4 = (4^2 sqrt(3))/4 = 4 sqrt(3). $
    - Thể tích khối lăng trụ đứng:
      $ V = S_(A B C) dot h = 4 sqrt(3) dot 4 = 16 sqrt(3). $
  ]
)

// --- CÂU 4 ---
#tn(
  [Cho cấp số cộng $(u_n)$ có tổng hai số hạng đầu bằng $3$ và tổng ba số hạng đầu bằng $6$. Công sai của cấp số cộng $(u_n)$ bằng],
  (
    [$3$],
    [$2$],
    True([$1$]),
    [$4$],
  ),
  loigiai: [
    #step[Thiết lập hệ phương trình theo $u_1$ và công sai $d$]
    Ta có công thức tổng $n$ số hạng đầu của cấp số cộng $S_n = n u_1 + (n(n - 1))/2 d$:
    $ cases(
      S_2 = 2 u_1 + d = 3,
      S_3 = 3 u_1 + 3 d = 6
    ) <=> cases(
      2 u_1 + d = 3,
      u_1 + d = 2
    ) $
    #step[Giải hệ phương trình]
    Lấy phương trình đầu trừ phương trình thứ hai:
    $ (2 u_1 + d) - (u_1 + d) = 3 - 2 => u_1 = 1 => d = 2 - 1 = 1. $
    Vậy công sai của cấp số cộng là $d = 1$.
  ]
)

// --- CÂU 5 ---
#tn(
  [Cho mẫu số liệu ghép nhóm $M$ với bảng tần số ghép nhóm như sau:
  #align(center)[
    #table(
      columns: 7,
      align: center,
      stroke: 0.5pt + gray,
      fill: (col, row) => if row == 0 { rgb("#e6f4f1") } else { white },
      [Nhóm], [$[8; 10)$], [$[10; 12)$], [$[12; 14)$], [$[14; 16)$], [$[16; 18)$], [$[18; 19)$],
      [Tần số], [$6$], [$6$], [$8$], [$4$], [$6$], [$7$],
    )
  ]
  Hãy xác định khoảng biến thiên của mẫu số liệu ghép nhóm $M$.],
  (
    [$12$],
    True([$11$]),
    [$19$],
    [$8$],
  ),
  loigiai: [
    #step[Định nghĩa khoảng biến thiên của mẫu số liệu ghép nhóm]
    Khoảng biến thiên của mẫu số liệu ghép nhóm là hiệu số giữa đầu mút phải của nhóm cuối cùng ($a_k$) và đầu mút trái của nhóm đầu tiên ($a_1$):
    $ R = a_k - a_1. $
    #step[Tính toán giá trị]
    Từ bảng phân bố tần số ghép nhóm, ta có nhóm đầu tiên là $[8; 10)$ và nhóm cuối cùng là $[18; 19)$:
    $ a_1 = 8, quad a_k = 19 => R = 19 - 8 = 11. $
  ]
)

// --- CÂU 6 ---
#tn(
  [Số đường tiệm cận (bao gồm cả tiệm cận đứng và tiệm cận ngang) của đồ thị hàm số $y = (2x - 1)/(3x + 1)$ là],
  (
    True([$2$]),
    [$1$],
    [$0$],
    [$3$],
  ),
  loigiai: [
    #step[Tìm tiệm cận ngang]
    Tập xác định: $cal(D) = RR setminus {-1/3}$.\
    Xét giới hạn tại vô cực:
    $ lim_(x -> +oo) (2x - 1)/(3x + 1) = lim_(x -> -oo) (2x - 1)/(3x + 1) = 2/3. $
    Suy ra đường thẳng $y = 2/3$ là tiệm cận ngang của đồ thị hàm số.
    #step[Tìm tiệm cận đứng]
    Xét giới hạn một phía tại điểm gián đoạn $x = -1/3$:
    $ lim_(x -> (-1/3)^+) (2x - 1)/(3x + 1) = -oo, quad lim_(x -> (-1/3)^-) (2x - 1)/(3x + 1) = +oo. $
    Suy ra đường thẳng $x = -1/3$ là tiệm cận đứng của đồ thị hàm số.
    #step[Kết luận]
    Đồ thị hàm số đã cho có tất cả $1 + 1 = 2$ đường tiệm cận.
    
    #meo[Hàm phân thức bậc nhất $y = (a x + b)/(c x + d)$ ($a d - b c != 0, c != 0$) luôn có đúng $2$ đường tiệm cận: tiệm cận đứng $x = -d/c$ và tiệm cận ngang $y = a/c$.]
  ]
)

// --- CÂU 7 ---
#tn(
  [Họ nguyên hàm của hàm số $f(x) = cos x$ là],
  (
    [$-sin x + C$],
    [$-cos x + C$],
    [$cos x + C$],
    True([$sin x + C$]),
  ),
  loigiai: [
    #step[Áp dụng bảng nguyên hàm cơ bản]
    Với mọi $x in RR$, ta có $(sin x)' = cos x$. Do đó:
    $ integral cos x dif x = sin x + C. $
  ]
)

// --- CÂU 8 ---
#tn(
  [Cho hình phẳng $(H)$ giới hạn bởi đồ thị hàm số $y = f(x)$, trục hoành $O x$ và hai đường thẳng $x = a, x = b$ ($a > b$). Diện tích hình phẳng $(H)$ được tính theo công thức nào dưới đây?],
  (
    [$S = integral_a^b f(x) dif x$],
    [$S = pi integral_b^a |f(x)| dif x$],
    True([$S = integral_b^a |f(x)| dif x$]),
    [$S = pi integral_0^1 [f(x)]^2 dif x$],
  ),
  loigiai: [
    #step[Áp dụng công thức tính diện tích hình phẳng]
    Diện tích hình phẳng giới hạn bởi đồ thị hàm số liên tục $y = f(x)$, trục hoành $y = 0$ và hai đường thẳng $x = b, x = a$ (với cận dưới $b < a$) là:
    $ S = integral_b^a |f(x)| dif x. $
  ]
)

// --- CÂU 9 ---
#tn(
  [Cho đồ thị hàm số $y = f(x)$ như hình vẽ bên. Hỏi hàm số $f(x)$ có thể là hàm số nào dưới đây?],
  (
    [$f(x) = a x^4 + b x^2 + c$],
    [$f(x) = a x^2 + b x + c$],
    True([$f(x) = a x^3 + b x^2 + c x + d$]),
    [$f(x) = (a x + b)/(c x + d)$],
  ),
  fig: cetz.canvas({
    import cetz.draw: *
    // Trục tọa độ
    line((-1.2, 0), (2.8, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -1.0), (0, 2.3), mark: (end: "stealth"), stroke: 0.8pt)
    content((2.8, -0.25), [$x$])
    content((-0.25, 2.2), [$y$])
    content((-0.2, -0.2), [$O$])
    
    // Đồ thị bậc 3: y = 0.5*x^3 - 1.5*x^2 + 1.5
    let f(x) = 0.5 * calc.pow(x, 3) - 1.5 * calc.pow(x, 2) + 1.5
    let pts = ()
    let x = -0.9
    while x <= 2.6 {
      pts.push((x, f(x)))
      x += 0.05
    }
    line(..pts, stroke: 1.2pt + rgb("#0e7490"))
    content((2.3, 1.2), text(fill: rgb("#0e7490"), weight: "bold")[$f(x)$])
  }),
  loigiai: [
    #step[Nhận dạng dạng hình học của đồ thị]
    - Đồ thị có dạng đường cong chữ $N$, có $2$ điểm cực trị (một điểm cực đại và một điểm cực tiểu).
    - Nhánh vô cực bên phải đi lên ($lim_(x -> +oo) f(x) = +oo$).
    - Đây là đồ thị đặc trưng của hàm số đa thức bậc ba $y = a x^3 + b x^2 + c x + d$ với hệ số $a > 0$.
  ]
)

// --- CÂU 10 ---
#tn(
  [Trong không gian $O x y z$, khoảng cách từ điểm $M(2; 1; -3)$ đến gốc tọa độ $O$ bằng],
  (
    True([$sqrt(14)$]),
    [$sqrt(5)$],
    [$sqrt(10)$],
    [$0$],
  ),
  loigiai: [
    #step[Áp dụng công thức tính khoảng cách]
    Gốc tọa độ $O$ có tọa độ $O(0; 0; 0)$. Khoảng cách từ điểm $M(x_M; y_M; z_M)$ đến gốc tọa độ $O$ là:
    $ O M = sqrt(x_M^2 + y_M^2 + z_M^2) = sqrt(2^2 + 1^2 + (-3)^2) = sqrt(4 + 1 + 9) = sqrt(14). $
  ]
)

// --- CÂU 11 ---
#tn(
  [Trong không gian $O x y z$, cho mặt cầu $(S)$ có phương trình $x^2 + y^2 + z^2 - 2z - 1 = 0$. Diện tích của mặt cầu $(S)$ bằng],
  (
    True([$8 pi$]),
    [$16 pi$],
    [$4 pi$],
    [$(8 pi)/3$],
  ),
  loigiai: [
    #step[Xác định tâm và bán kính mặt cầu]
    Biến đổi phương trình mặt cầu về dạng chính tắc:
    $ x^2 + y^2 + (z^2 - 2z + 1) - 2 = 0 <=> x^2 + y^2 + (z - 1)^2 = 2. $
    Do đó mặt cầu $(S)$ có tâm $I(0; 0; 1)$ và bán kính $R = sqrt(2)$.
    #step[Tính diện tích mặt cầu]
    Diện tích mặt cầu $(S)$ bán kính $R = sqrt(2)$ là:
    $ S = 4 pi R^2 = 4 pi (sqrt(2))^2 = 8 pi. $
  ]
)

// --- CÂU 12 ---
#tn(
  [Cho hình hộp chữ nhật $A B C D. A' B' C' D'$. Đẳng thức vectơ nào dưới đây là *đúng*?],
  (
    [$|arrow(A C) + arrow(C C')| = |arrow(A D) + arrow(D B')|$],
    [$|arrow(B D) + arrow(D A')| = |arrow(B D') + arrow(D' A)|$],
    [$|arrow(D B) + arrow(B B')| = |arrow(D C') + arrow(C' B)|$],
    True([$|arrow(A B) + arrow(B C')| = |arrow(C D) + arrow(D' A)|$]),
  ),
  fig: cetz.canvas({
    import cetz.draw: *
    let a = 2.6
    let b = 1.0
    let h = 1.6
    
    let A = (0, 0)
    let B = (-0.8, -0.6)
    let C = (a - 0.8, -0.6)
    let D = (a, 0)
    
    let A1 = (0, h)
    let B1 = (-0.8, h - 0.6)
    let C1 = (a - 0.8, h - 0.6)
    let D1 = (a, h)
    
    // Nét đứt bên trong
    line(A1, A, B, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    line(A, D, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    
    // Nét liền
    line(B1, A1, D1, C1, close: true, stroke: 1pt + black)
    line(D1, D, C, stroke: 1pt + black)
    line(B, C, C1, B1, close: true, stroke: 1pt + black)
    
    content((rel: (0.15, 0.15), to: A), [$A$])
    content((rel: (-0.2, -0.15), to: B), [$B$])
    content((rel: (0.2, -0.15), to: C), [$C$])
    content((rel: (0.2, 0), to: D), [$D$])
    content((rel: (0, 0.25), to: A1), [$A'$])
    content((rel: (-0.25, 0.1), to: B1), [$B'$])
    content((rel: (0.2, 0.2), to: C1), [$C'$])
    content((rel: (0.25, 0.1), to: D1), [$D'$])
  }),
  loigiai: [
    #step[Phân tích tổng vectơ ở từng vế]
    - Ở vế trái: Áp dụng quy tắc cộng liên tiếp:
      $ arrow(A B) + arrow(B C') = arrow(A C') => |arrow(A B) + arrow(B C')| = |arrow(A C')| = A C'. $
    - Ở vế phải: Ta có $arrow(C D) = arrow(C' D')$ nên:
      $ arrow(C D) + arrow(D' A) = arrow(C' D') + arrow(D' A) = arrow(C' A) => |arrow(C D) + arrow(D' A)| = |arrow(C' A)| = C' A. $
    #step[So sánh độ dài các đường chéo của hình hộp chữ nhật]
    Trong hình hộp chữ nhật, bốn đường chéo có độ dài bằng nhau: $A C' = C' A$. Do đó:
    $ |arrow(A B) + arrow(B C')| = |arrow(C D) + arrow(D' A)|. $
  ]
)

// ========================================================
// PHẦN II. CÂU TRẮC NGHIỆM ĐÚNG SAI (4 CÂU)
// ========================================================
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// --- CÂU 13 ---
#ds(
  [Cho hàm số $y = f(x)$ có đồ thị $(C)$ liên tục trên $RR$ như hình vẽ bên. Biết rằng các nghiệm bội chẵn chỉ được tính là một nghiệm khi xét sự cắt nhau.],
  (
    [Đồ thị của hàm số $y = 1/f(x)$ có tất cả $4$ đường tiệm cận đứng và ngang.],
    True([Đồ thị $(C)$ có đúng $4$ điểm cực trị.]),
    True([Phương trình $sqrt(f(x)) dot sqrt(f'(x)) = 0$ có tất cả $5$ nghiệm thực phân biệt.]),
    [Nếu hàm số $F(x)$ là một nguyên hàm của hàm số $f(x)$ thì đồ thị của hàm số $y = F(x)$ có $4$ điểm cực trị.],
  ),
  fig: cetz.canvas({
    import cetz.draw: *
    line((-2.0, 0), (2.8, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -1.8), (0, 2.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((2.8, -0.25), [$x$])
    content((-0.25, 2.4), [$y$])
    content((-0.2, -0.2), [$O$])
    
    // Đồ thị biểu diễn f(x)
    let pts = ()
    let x = -0.9
    while x <= 2.4 {
      let y = 0
      if x <= 0 {
        y = -8.228571 * calc.pow(x + 0.35, 2) + 1.008
      } else if x <= 2.0 {
        y = -2.76 * calc.pow(x, 3) + 8.52 * calc.pow(x, 2) - 5.76 * x 
      } else {
        y = 12 * calc.pow(x - 2.2, 2)
      }
      pts.push((x, y))
      x += 0.05
    }
    line(..pts, stroke: 1.2pt + rgb("#0284c7"))
    
    // Điểm đánh dấu
    circle((-0.7, 0), radius: 1.5pt, fill: black)
    content((-0.7, 0.3), [$x_1$])
    circle((2.2, 0), radius: 1.5pt, fill: black)
    content((2.2, -0.3), [$x_4$])
    content((1.9, 1.8), text(fill: rgb("#0284c7"), weight: "bold")[$f(x)$])
  }),
  loigiai: [
    #step[Xét ý a: Tiệm cận của hàm số $y = 1/f(x)$]
    - Từ đồ thị ta thấy $lim_(x -> +-oo) f(x) = +oo => lim_(x -> +-oo) 1/f(x) = 0$, nên đồ thị hàm số $y = 1/f(x)$ có $1$ đường tiệm cận ngang là $y = 0$.
    - Phương trình mẫu số $f(x) = 0$ có $4$ nghiệm phân biệt $x_1 < 0 < x_3 < x_4$ nên đồ thị hàm số $y = 1/f(x)$ có $4$ đường tiệm cận đứng.
    - Tổng số đường tiệm cận là $1 + 4 = 5$ đường tiệm cận. *Ý a Sai.*
    
    #step[Xét ý b: Số điểm cực trị của $(C)$]
    Quan sát đồ thị hàm số, ta thấy $(C)$ có $2$ điểm cực đại (lồi lên) và $2$ điểm cực tiểu (lõm xuống). Do đó hàm số có $4$ điểm cực trị. *Ý b Đúng.*
    
    #step[Xét ý c: Số nghiệm của phương trình $sqrt(f(x)) dot sqrt(f'(x)) = 0$]
    Điều kiện xác định:
    $ cases(
      f(x) >= 0,
      f'(x) >= 0.
    ) $
    Phương trình tương đương:
    $ cases(f(x) = 0, f'(x) >= 0) quad "hoặc" quad cases(f'(x) = 0, f(x) >= 0). $
    - Xét $f(x) = 0$: Có $4$ nghiệm phân biệt:
      + Tại $x_1$ và $x_3$, đồ thị cắt $O x$ đi lên nên $f'(x) > 0$ (thỏa mãn, nhận $2$ nghiệm).
      + Tại gốc $O(0;0)$, đồ thị cắt $O x$ đi xuống nên $f'(0) < 0$ (loại).
      + Tại $x_4$, đồ thị tiếp xúc cực tiểu với $O x$ nên $f'(x_4) = 0$ (thỏa mãn, nhận $1$ nghiệm).
      Vậy có $3$ nghiệm thỏa mãn.
    - Xét $f'(x) = 0$: Có $4$ nghiệm cực trị:
      + Tại $2$ điểm cực đại, $f(x) > 0$ (nhận thêm $2$ nghiệm phân biệt mới).
      + Tại điểm cực tiểu dưới trục hoành, $f(x) < 0$ (loại).
      + Tại điểm cực tiểu tiếp xúc $x_4$, $f(x_4) = 0$ (đã đếm ở trên).
    Tổng cộng phương trình có $3 + 2 = 5$ nghiệm thực phân biệt. *Ý c Đúng.*
    
    #step[Xét ý d: Số điểm cực trị của nguyên hàm $y = F(x)$]
    Vì $F(x)$ là nguyên hàm của $f(x)$ nên $F'(x) = f(x)$.
    Số điểm cực trị của $F(x)$ bằng số nghiệm đơn (hoặc nghiệm bội lẻ) làm $F'(x) = f(x)$ đổi dấu.
    Trên đồ thị, $f(x)$ chỉ cắt xuyên qua trục hoành và đổi dấu tại $3$ điểm ($x_1, 0, x_3$). Tại $x_4$ là điểm tiếp xúc (nghiệm bội chẵn) nên $f(x)$ không đổi dấu.
    Do đó $F(x)$ chỉ có $3$ điểm cực trị. *Ý d Sai.*
  ]
)

// --- CÂU 14 ---
#ds(
  [Một đoàn tàu dài $140$ m đang chuyển động thẳng đều trên đường ray với tốc độ $25$ m/s thì thấy ở phía trước $450$ m so với đầu tàu $A$ có đầu $C$ của một cây cầu dài $270$ m. Người lái tàu sau đó $5$ giây bắt đầu cho tàu giảm tốc độ theo gia tốc $a(t) = -b t$ (m/s#super[2]) ($b > 0$, $t$ tính bằng giây từ lúc bắt đầu giảm tốc). Sau khi giảm tốc được $12$ giây thì đầu tàu đến điểm $D$ và đạt tốc độ $10$ m/s. Tại $D$, đoàn tàu bắt đầu chuyển động thẳng đều để đi qua cầu an toàn.],
  (
    True([Tại thời điểm bắt đầu giảm tốc độ, đầu tàu cách đầu cầu $C$ một khoảng bằng $325$ m.]),
    [Hệ số gia tốc giảm tốc độ của tàu là $b = 1$.],
    True([Khoảng cách từ điểm $D$ đến đầu cầu $C$ là $85$ m.]),
    True([Tổng thời gian tính từ lúc bắt đầu giảm tốc độ cho đến khi toàn bộ đoàn tàu đi qua hẳn cây cầu xấp xỉ $62$ giây.]),
  ),
    fig: cetz.canvas(length: 0.75cm, {
    import cetz.draw: *

    // 1. DÒNG SÔNG DƯỚI CẦU
    rect((8.5, -1.8), (14.5, -0.15), fill: rgb("#e0f2fe"), stroke: none)
    for y_wave in (-0.6, -1.1, -1.5) {
      line((9.0, y_wave), (10.2, y_wave + 0.05), (11.5, y_wave - 0.05), (13.0, y_wave + 0.05), (14.0, y_wave), stroke: 0.6pt + rgb("#7dd3fc"))
    }
    content((11.5, -1.45), text(size: 7.5pt, fill: rgb("#0284c7"), style: "italic")[Sông])

    // 2. MẶT ĐẤT VÀ ĐƯỜNG RAY
    rect((-3.2, -0.8), (8.5, -0.15), fill: rgb("#f8fafc"), stroke: none)
    rect((14.5, -0.8), (17.5, -0.15), fill: rgb("#f8fafc"), stroke: none)

    // Tà vẹt đường ray
    let x_tie = -3.0
    while x_tie <= 17.2 {
      rect((x_tie - 0.07, -0.18), (x_tie + 0.07, -0.05), fill: rgb("#78716c"), stroke: 0.3pt + black)
      x_tie += 0.35
    }
    // Thanh ray
    line((-3.2, -0.05), (17.5, -0.05), stroke: 1.8pt + rgb("#334155"))
    line((-3.2, -0.01), (17.5, -0.01), stroke: 0.6pt + rgb("#94a3b8"))

    // 3. CÂY CẦU CE (x từ 8.5 đến 14.5, dài 270m)
    let c_start = 8.5
    let c_end = 14.5
    rect((c_start - 0.35, -1.6), (c_start, -0.15), fill: rgb("#94a3b8"), stroke: 0.7pt + black)
    rect((c_end, -1.6), (c_end + 0.35, -0.15), fill: rgb("#94a3b8"), stroke: 0.7pt + black)
    rect((11.35, -1.75), (11.65, -0.15), fill: rgb("#94a3b8"), stroke: 0.7pt + black)

    // Dầm cầu thép (truss bridge)
    rect((c_start, -0.15), (c_end, 0.1), fill: rgb("#cbd5e1"), stroke: 0.8pt + rgb("#475569"))
    // Vòm 1 (8.5 -> 11.5)
    line((8.5, 0.1), (10.0, 1.25), (11.5, 0.1), stroke: 1.3pt + rgb("#dc2626"))
    line((8.5, 0.1), (11.5, 0.1), stroke: 1.3pt + rgb("#dc2626"))
    line((9.25, 0.1), (10.0, 1.25), stroke: 0.7pt + rgb("#dc2626"))
    line((10.75, 0.1), (10.0, 1.25), stroke: 0.7pt + rgb("#dc2626"))
    line((9.25, 0.1), (9.25, 0.68), stroke: 0.7pt + rgb("#dc2626"))
    line((10.75, 0.1), (10.75, 0.68), stroke: 0.7pt + rgb("#dc2626"))

    // Vòm 2 (11.5 -> 14.5)
    line((11.5, 0.1), (13.0, 1.25), (14.5, 0.1), stroke: 1.3pt + rgb("#dc2626"))
    line((11.5, 0.1), (14.5, 0.1), stroke: 1.3pt + rgb("#dc2626"))
    line((12.25, 0.1), (13.0, 1.25), stroke: 0.7pt + rgb("#dc2626"))
    line((13.75, 0.1), (13.0, 1.25), stroke: 0.7pt + rgb("#dc2626"))
    line((12.25, 0.1), (12.25, 0.68), stroke: 0.7pt + rgb("#dc2626"))
    line((13.75, 0.1), (13.75, 0.68), stroke: 0.7pt + rgb("#dc2626"))

    content((11.5, 1.55), text(size: 8pt, weight: "bold", fill: rgb("#b91c1c"))[CẦU $C E$ ($270 "m"$)])

    // 4. ĐOÀN TÀU TỐC HÀNH TẠI VỊ TRÍ BAN ĐẦU (Đầu tàu tại A = 1.2, Đuôi tại x = -1.8)
    rect((-1.8, 0.08), (-0.6, 0.7), fill: rgb("#0284c7"), stroke: 0.7pt + black, radius: (left: 2pt))
    rect((-1.65, 0.32), (-0.75, 0.58), fill: rgb("#e0f2fe"), stroke: 0.4pt + black)
    rect((-0.55, 0.08), (0.4, 0.7), fill: rgb("#0284c7"), stroke: 0.7pt + black)
    rect((-0.4, 0.32), (0.25, 0.58), fill: rgb("#e0f2fe"), stroke: 0.4pt + black)
    rect((-0.6, 0.18), (-0.55, 0.38), fill: black)

    // Đầu tàu A (0.4 đến 1.2)
    let cab_pts = ((0.4, 0.08), (0.4, 0.7), (0.8, 0.7), (1.18, 0.32), (1.2, 0.08))
    line(..cab_pts, close: true, fill: rgb("#0284c7"), stroke: 0.7pt + black)
    line((0.68, 0.38), (0.85, 0.62), (1.08, 0.38), close: true, fill: rgb("#38bdf8"), stroke: 0.4pt + black)
    line((-1.8, 0.22), (1.1, 0.22), stroke: 1.2pt + white)
    circle((1.15, 0.16), radius: 1.2pt, fill: rgb("#fde047"), stroke: 0.4pt + black)

    // Bánh xe
    for wx in (-1.5, -0.9, -0.25, 0.15, 0.65, 1.0) {
      circle((wx, 0.04), radius: 2pt, fill: rgb("#334155"), stroke: 0.4pt + black)
      circle((wx, 0.04), radius: 0.8pt, fill: rgb("#94a3b8"))
    }
    // Vectơ vận tốc v0
    line((1.2, 0.42), (1.9, 0.42), stroke: 1.2pt + rgb("#16a34a"), mark: (end: "stealth"))
    content((1.55, 0.65), text(size: 7pt, fill: rgb("#16a34a"), weight: "bold")[$v_0 = 25 "m/s"$])
    content((-0.3, 0.9), text(size: 7.5pt, weight: "bold", fill: rgb("#0369a1"))[Đoàn tàu ($140 "m"$)])

    // 5. CÁC MỐC VỊ TRÍ ĐẦU TÀU
    let marks = (
      (1.2, [$A$]),
      (3.7, [$B$]),
      (7.0, [$D$]),
      (8.5, [$C$]),
      (14.5, [$E$]),
      (17.0, [$F$])
    )

    for (mx, lab) in marks {
      line((mx, -0.05), (mx, -0.35), stroke: 0.8pt + black)
      circle((mx, -0.05), radius: 1.5pt, fill: rgb("#dc2626"))
      content((mx, -0.55), text(size: 8.5pt, weight: "bold", fill: rgb("#dc2626"))[#lab])
    }

    // 6. CÁC KÍCH THƯỚC GIÓNG ĐOẠN ĐƯỜNG
    // A -> C = 450m
    line((1.2, -0.9), (8.5, -0.9), stroke: 0.7pt + rgb("#2563eb"), mark: (start: "|", end: "|"))
    content((4.85, -1.15), text(size: 7.5pt, fill: rgb("#2563eb"), weight: "bold")[$A C = 450 "m"$])

    // A -> B = 125m
    line((1.2, -1.5), (3.7, -1.5), stroke: 0.5pt + gray.darken(30%), mark: (start: "|", end: "|"))
    content((2.45, -1.75), text(size: 7pt)[$s_1 = 125 "m"$])

    // B -> D = 240m (giảm tốc)
    line((3.7, -1.5), (7.0, -1.5), stroke: 0.5pt + gray.darken(30%), mark: (start: "|", end: "|"))
    content((5.35, -1.75), text(size: 7pt)[$s_("giảm tốc") = 240 "m"$])

    // D -> C = 85m
    line((7.0, -1.5), (8.5, -1.5), stroke: 0.5pt + gray.darken(30%), mark: (start: "|", end: "|"))
    content((7.75, -1.75), text(size: 7pt)[$85 "m"$])

    // C -> E = 270m
    line((8.5, -0.9), (14.5, -0.9), stroke: 0.7pt + rgb("#b91c1c"), mark: (start: "|", end: "|"))
    content((11.5, -1.15), text(size: 7.5pt, fill: rgb("#b91c1c"), weight: "bold")[$C E = 270 "m"$])

    // E -> F = 140m
    line((14.5, -0.9), (17.0, -0.9), stroke: 0.7pt + rgb("#0369a1"), mark: (start: "|", end: "|"))
    content((15.75, -1.15), text(size: 7.5pt, fill: rgb("#0369a1"))[$140 "m"$])
  }),
  fig-pos: "center",
  fig-width: 100%,
  loigiai: [
    #step[Xét ý a: Khoảng cách từ vị trí bắt đầu giảm tốc $B$ đến đầu cầu $C$]
    - Trong $5$ giây đầu tiên, tàu chuyển động thẳng đều với vận tốc $v_0 = 25$ m/s.
      Quãng đường đi được: $s_1 = A B = 25 dot 5 = 125$ m.
    - Khoảng cách từ đầu tàu lúc bắt đầu giảm tốc ($B$) đến đầu cầu $C$ là:
      $ B C = A C - A B = 450 - 125 = 325 "m". $
      *Ý a Đúng.*
      
    #step[Xét ý b: Xác định hệ số gia tốc $b$]
    Vận tốc trong giai đoạn giảm tốc ($0 <= t <= 12$):
    $ v(t) = integral a(t) dif t = integral (-b t) dif t = -b/2 t^2 + C_0. $
    Tại $t = 0$, $v(0) = 25 => C_0 = 25 => v(t) = 25 - b/2 t^2$.
    Tại $t = 12$, $v(12) = 10$:
    $ 25 - b/2 (12^2) = 10 <=> 72 b = 15 <=> b = 15/72 = 5/24 approx 0,208 != 1. $
    *Ý b Sai.*
    
    #step[Xét ý c: Khoảng cách $D C$]
    Phương trình vận tốc: $v(t) = 25 - 5/48 t^2$.
    Quãng đường tàu đi được trong $12$ giây giảm tốc (đoạn $B D$):
    $ B D = integral_0^(12) (25 - 5/48 t^2) dif t = [25t - 5/144 t^3]_0^(12) = 25(12) - 5/144 (1728) = 300 - 60 = 240 "m". $
    Khoảng cách từ điểm dừng giảm tốc $D$ đến đầu cầu $C$:
    $ D C = B C - B D = 325 - 240 = 85 "m". $
    *Ý c Đúng.*
    
    #step[Xét ý d: Tổng thời gian để đoàn tàu đi qua hẳn cây cầu]
    Để toàn bộ đoàn tàu đi qua cầu, đuôi tàu phải vượt qua điểm cuối cầu $E$, nghĩa là đầu tàu đi đến điểm $F$ sao cho $E F = 140$ m (chiều dài đoàn tàu).
    Tổng quãng đường đầu tàu đi từ $D$ đến $F$ với vận tốc đều $v = 10$ m/s là:
    $ D F = D C + C E + E F = 85 + 270 + 140 = 495 "m". $
    Thời gian đi đoạn $D F$:
    $ t_2 = 495 / 10 = 49,5 "giây". $
    Tổng thời gian tính từ lúc bắt đầu giảm tốc độ:
    $ T = t_("giảm tốc") + t_2 = 12 + 49,5 = 61,5 "giây" approx 62 "giây". $
    *Ý d Đúng.*
  ]
)

// --- CÂU 15 ---
#ds(
  [Để quản lý không gian của một khinh khí cầu, người ta gắn hệ trục toạ độ $O x y z$ vào khí cầu sao cho vị trí trung tâm buồng chứa hành khách là gốc $O(0;0;0)$ và phần chứa khí là mặt cầu $(S): x^2 + y^2 + (z - 12)^2 = 100$ (đơn vị: mét). Trong suốt quá trình bay, phần chứa khí luôn giữ phương thẳng đứng và không bị nghiêng.],
  (
    True([Tâm phần chứa không khí cách trung tâm buồng khách một khoảng bằng $12$ m.]),
    True([Tính dọc theo chiều dài lớn nhất, khí cầu này dài $22$ m.]),
    [Khi có gió nhẹ làm buồng khách lệch $15^compose$ so với phương thẳng đứng thì khoảng cách từ vị trí trung tâm buồng khách đến tâm phần chứa khí bằng $11,2$ m.],
    [Khi buồng khách lệch $25^compose$ so với phương thẳng đứng thì khoảng cách từ vị trí trung tâm buồng khách đến điểm xa nó nhất trên khí cầu bằng $18,3$ m.],
  ),
  fig: cetz.canvas(length: 1.0cm, {
    import cetz.draw: *

    // ==========================================
    // HÌNH 1: TRẠNG THÁI TĨNH (ĐỨNG THẲNG)
    // ==========================================
    group({
      // Trục tọa độ Oz, Oy
      line((0, -0.4), (0, 4.1), mark: (end: "stealth"), stroke: 0.7pt + gray.darken(40%))
      line((-0.6, 0), (2.0, 0), mark: (end: "stealth"), stroke: 0.7pt + gray.darken(40%))
      content((0.2, 4.0), text(size: 8pt)[$z$])
      content((2.0, -0.25), text(size: 8pt)[$y$])

      let I_pos = (0, 2.2)
      let R_val = 1.4
      let T_pos = (0, 0.8)
      let A_pos = (0, 3.6)

      // Quả cầu khí
      circle(I_pos, radius: R_val, fill: rgb("#fee2e2"), stroke: 1.2pt + rgb("#dc2626"))
      arc(I_pos, start: 0deg, stop: -180deg, radius: (R_val, 0.35), anchor: "origin", stroke: 1pt + rgb("#dc2626"))
      arc(I_pos, start: 0deg, stop: 180deg, radius: (R_val, 0.35), anchor: "origin", stroke: (dash: "dashed", paint: rgb("#dc2626"), thickness: 0.7pt))

      // Dây cáp OT
      line((0, 0), T_pos, stroke: 1.8pt + rgb("#2563eb"))
      line(T_pos, A_pos, stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))

      // Buồng hành khách tại gốc O
      rect((-0.25, -0.2), (0.25, 0), fill: rgb("#fef3c7"), stroke: 0.9pt + rgb("#b45309"), radius: 1.5pt)

      // Các điểm và nhãn
      circle((0, 0), radius: 1.8pt, fill: black)
      circle(T_pos, radius: 1.8pt, fill: black)
      circle(I_pos, radius: 1.8pt, fill: black)
      circle(A_pos, radius: 1.8pt, fill: black)

      content((-0.22, -0.1), text(size: 8pt)[$O$])
      content((0.22, 0.8), text(size: 8pt)[$T$])
      content((0.25, 2.2), text(size: 8pt)[$I$])
      content((0.22, 3.6), text(size: 8pt)[$A$])

      // Kích thước gióng
      line((-0.6, 0), (-0.6, 2.2), stroke: 0.6pt + gray.darken(20%), mark: (start: "|", end: "|"))
      content((-1.0, 1.1), text(size: 7.5pt)[$12 "m"$])

      line((1.65, 0.8), (1.65, 2.2), stroke: 0.6pt + gray.darken(20%), mark: (start: "|", end: "|"))
      content((2.15, 1.5), text(size: 7.5pt)[$R = 10 "m"$])

      content((0.5, -0.55), text(size: 8pt, style: "italic", fill: rgb("#475569"))[Hình 1: Trạng thái tĩnh])
    })

    // ==========================================
    // HÌNH 2: KHI CÓ GIÓ THỔI LỆCH THETA
    // ==========================================
    group({
      let ox = 5.0
      // Trục tham chiếu thẳng đứng và trục Oy
      line((ox, -0.4), (ox, 4.1), stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))
      line((ox - 0.6, 0), (ox + 2.5, 0), mark: (end: "stealth"), stroke: 0.7pt + gray.darken(40%))
      content((ox + 2.5, -0.25), text(size: 8pt)[$y$])

      let ang_rad = 25 * calc.pi / 180
      let L_cap = 0.8
      let R_val = 1.4

      let O2 = (ox, 0)
      let T2 = (ox + L_cap * calc.sin(ang_rad), L_cap * calc.cos(ang_rad))
      let I2 = (T2.at(0), T2.at(1) + R_val)
      let M2 = (T2.at(0), T2.at(1) + 2 * R_val)

      // Cáp nghiêng OT
      line(O2, T2, stroke: 1.8pt + rgb("#2563eb"))
      // Trục bóng thẳng đứng
      line(T2, M2, stroke: (dash: "dashed", paint: rgb("#0284c7"), thickness: 0.8pt))
      // Đường nối OM
      line(O2, M2, stroke: (dash: "dashed", paint: rgb("#f59e0b"), thickness: 1.3pt))

      // Quả cầu lệch
      circle(I2, radius: R_val, fill: rgb("#e0f2fe"), stroke: 1.2pt + rgb("#0284c7"))
      arc(I2, start: 0deg, stop: -180deg, radius: (R_val, 0.35), anchor: "origin", stroke: 1pt + rgb("#0284c7"))
      arc(I2, start: 0deg, stop: 180deg, radius: (R_val, 0.35), anchor: "origin", stroke: (dash: "dashed", paint: rgb("#0284c7"), thickness: 0.7pt))

      // Buồng hành khách tại O
      rect((ox - 0.25, -0.2), (ox + 0.25, 0), fill: rgb("#fef3c7"), stroke: 0.9pt + rgb("#b45309"), radius: 1.5pt)

      // Góc lệch theta (arc nhỏ tại gốc O)
      arc(O2, start: 90deg, stop: 90deg - 25deg, radius: 0.45, anchor: "origin", stroke: 0.8pt + rgb("#dc2626"))
      content((ox + 0.22, 0.55), text(size: 8pt, fill: rgb("#dc2626"), weight: "bold")[$theta$])

      // Các điểm & nhãn
      circle(O2, radius: 1.8pt, fill: black)
      circle(T2, radius: 1.8pt, fill: black)
      circle(I2, radius: 1.8pt, fill: black)
      circle(M2, radius: 2.2pt, fill: rgb("#f59e0b"))

      content((ox - 0.22, -0.1), text(size: 8pt)[$O$])
      content((T2.at(0) + 0.22, T2.at(1)), text(size: 8pt)[$T$])
      content((I2.at(0) + 0.25, I2.at(1)), text(size: 8pt)[$I'$])
      content((M2.at(0) + 0.22, M2.at(1) + 0.1), text(size: 8.5pt, fill: rgb("#d97706"), weight: "bold")[$M$])

      content((ox + 0.5, -0.55), text(size: 8pt, style: "italic", fill: rgb("#475569"))[Hình 2: Khi có gió lệch $theta$])
    })
  }),
  fig-pos: "center",
  fig-width: 0.8,
  loigiai: [
    #step[Thông số hình học của khí cầu]
    Mặt cầu $(S)$ có tâm $I(0; 0; 12)$ và bán kính $R = sqrt(100) = 10$ m.
    Buồng chứa khách đặt tại gốc tọa độ $O(0; 0; 0)$.
    Đáy quả bóng là điểm $T$ trên trục $O z$ có cao độ $z_T = z_I - R = 12 - 10 = 2$ m.
    Chiều dài dây cáp nối từ buồng khách đến đáy bóng là $O T = 2$ m.
    
    #step[Xét ý a: Khoảng cách tâm bóng đến buồng khách]
    $ O I = sqrt(0^2 + 0^2 + 12^2) = 12 "m". $ *Ý a Đúng.*
    
    #step[Xét ý b: Chiều dài lớn nhất của khí cầu]
    Chiều dài lớn nhất tính từ đáy buồng khách đến đỉnh bóng:
    $ L = O T + 2 R = 2 + 2(10) = 22 "m". $ *Ý b Đúng.*
    
    #step[Xét ý c: Khi góc lệch gió $15^compose$]
    Dây cáp $O T$ bị nghiêng $15^compose$ nên vectơ $arrow(O T) = (2 sin 15^compose; 0; 2 cos 15^compose)$.
    Vì phần chứa khí không bị nghiêng nên vectơ nối từ đáy bóng $T$ lên tâm bóng $I'$ luôn giữ phương thẳng đứng: $arrow(T I') = (0; 0; 10)$.
    Tọa độ tâm bóng mới: $arrow(O I') = arrow(O T) + arrow(T I') = (2 sin 15^compose; 0; 2 cos 15^compose + 10)$.
    Khoảng cách từ $O$ đến $I'$:
    $ O I' = sqrt((2 sin 15^compose)^2 + 0^2 + (2 cos 15^compose + 10)^2) = sqrt(4 + 100 + 40 cos 15^compose) approx 11,94 "m" != 11,2 "m". $
    *Ý c Sai.*
    
    #step[Xét ý d: Khoảng cách đến điểm xa nhất khi lệch $25^compose$]
    Điểm xa buồng khách $O$ nhất là đỉnh bóng $M$. Vì bóng giữ phương thẳng đứng nên vectơ $arrow(T M) = (0; 0; 20)$.
    Trong tam giác $O T M$, ta có $O T = 2$ m, $T M = 20$ m và góc $hat(O T M) = 180^compose - 25^compose = 155^compose$.
    Áp dụng định lý hàm số côsin trong tam giác $O T M$:
    $ O M = sqrt(O T^2 + T M^2 - 2 dot O T dot T M dot cos 155^compose) = sqrt(2^2 + 20^2 - 2(2)(20) cos 155^compose) approx 21,83 "m" != 18,3 "m". $
    *Ý d Sai.*
  ]
)

// --- CÂU 16 ---
#ds(
  [Công ty X giao cho hai xí nghiệp I và II sản xuất một loại sản phẩm Y. Xí nghiệp I sản xuất $60%$ tổng sản phẩm và có tỉ lệ phế phẩm là $4%$, xí nghiệp II sản xuất $40%$ tổng sản phẩm và có tỉ lệ phế phẩm là $2%$. Người ta dùng một con xúc xắc cân đối đồng chất gieo ngẫu nhiên: nếu số chấm không vượt quá $2$ thì chọn sản phẩm của xí nghiệp I; nếu số chấm lớn hơn $2$ thì chọn ngẫu nhiên một sản phẩm của công ty (cả hai xí nghiệp). Gọi $A$ là biến cố chọn được phế phẩm, $B$ là biến cố chọn được sản phẩm của xí nghiệp I.],
  (
    True([Xác suất có điều kiện $P(A | B) = 0,04$.]),
    [Xác suất để chọn được sản phẩm của xí nghiệp I là $P(B) = 0,6$.],
    [Xác suất chọn được phế phẩm của công ty là $P(A) = 0,032$.],
    True([Xác suất sản phẩm chọn được thuộc xí nghiệp I biết rằng nó là phế phẩm là $P(B | A) = 11/13$.]),
  ),
  fig: cetz.canvas(length: 0.75cm, {
    import cetz.draw: *
    
    // Gốc
    rect((-0.5, -0.25), (0.5, 0.25), fill: rgb("#fef3c7"), stroke: 0.8pt + rgb("#d97706"), radius: 2pt, name: "root")
    content("root", text(size: 7.5pt, weight: "bold")[Gốc])
    
    // Tầng 1: D1 và D2
    rect((2.0, 1.0), (3.0, 1.5), fill: rgb("#f0fdf4"), stroke: 0.8pt + rgb("#16a34a"), radius: 2pt, name: "d1")
    content("d1", text(size: 7.5pt)[$D_1$])
    
    rect((2.0, -1.5), (3.0, -1.0), fill: rgb("#f0fdf4"), stroke: 0.8pt + rgb("#16a34a"), radius: 2pt, name: "d2")
    content("d2", text(size: 7.5pt)[$D_2$])
    
    line("root.east", "d1.west", mark: (end: "stealth"), stroke: 0.7pt + black)
    content((1.2, 0.9), text(size: 6.5pt)[$1/3$])
    
    line("root.east", "d2.west", mark: (end: "stealth"), stroke: 0.7pt + black)
    content((1.2, -0.9), text(size: 6.5pt)[$2/3$])
    
    // Tầng 2: B (từ D1), B và \overline{B} (từ D2)
    rect((4.2, 1.0), (5.2, 1.5), fill: rgb("#eff6ff"), stroke: 0.8pt + rgb("#2563eb"), radius: 2pt, name: "b1")
    content("b1", text(size: 7.5pt)[$B$])
    
    line("d1.east", "b1.west", mark: (end: "stealth"), stroke: 0.7pt + black)
    content((3.6, 1.4), text(size: 6.5pt)[$1$])
    
    rect((4.2, -0.7), (5.2, -0.2), fill: rgb("#eff6ff"), stroke: 0.8pt + rgb("#2563eb"), radius: 2pt, name: "b2")
    content("b2", text(size: 7.5pt)[$B$])
    
    rect((4.2, -2.0), (5.2, -1.5), fill: rgb("#eff6ff"), stroke: 0.8pt + rgb("#2563eb"), radius: 2pt, name: "nb2")
    content("nb2", text(size: 7.5pt)[$overline(B)$])
    
    line("d2.east", "b2.west", mark: (end: "stealth"), stroke: 0.7pt + black)
    content((3.6, -0.6), text(size: 6.5pt)[$0,6$])
    
    line("d2.east", "nb2.west", mark: (end: "stealth"), stroke: 0.7pt + black)
    content((3.6, -1.9), text(size: 6.5pt)[$0,4$])
    
    // Tầng 3: A và \overline{A}
    rect((6.5, 1.4), (7.5, 1.9), fill: rgb("#fee2e2"), stroke: 0.8pt + rgb("#dc2626"), radius: 2pt, name: "a1")
    content("a1", text(size: 7.5pt, fill: rgb("#dc2626"), weight: "bold")[$A$])
    
    rect((6.5, 0.6), (7.5, 1.1), fill: rgb("#f8fafc"), stroke: 0.6pt + gray, radius: 2pt, name: "na1")
    content("na1", text(size: 7.5pt)[$overline(A)$])
    
    line("b1.east", "a1.west", mark: (end: "stealth"), stroke: 0.7pt + rgb("#dc2626"))
    content((5.85, 1.8), text(size: 6pt, fill: rgb("#dc2626"))[$0,04$])
    
    line("b1.east", "na1.west", mark: (end: "stealth"), stroke: 0.7pt + gray)
    content((5.85, 0.7), text(size: 6pt)[$0,96$])
    
    // Từ b2 -> a2, na2
    rect((6.5, -0.3), (7.5, 0.2), fill: rgb("#fee2e2"), stroke: 0.8pt + rgb("#dc2626"), radius: 2pt, name: "a2")
    content("a2", text(size: 7.5pt, fill: rgb("#dc2626"), weight: "bold")[$A$])
    
    rect((6.5, -1.1), (7.5, -0.6), fill: rgb("#f8fafc"), stroke: 0.6pt + gray, radius: 2pt, name: "na2")
    content("na2", text(size: 7.5pt)[$overline(A)$])
    
    line("b2.east", "a2.west", mark: (end: "stealth"), stroke: 0.7pt + rgb("#dc2626"))
    content((5.85, 0.1), text(size: 6pt, fill: rgb("#dc2626"))[$0,04$])
    
    line("b2.east", "na2.west", mark: (end: "stealth"), stroke: 0.7pt + gray)
    content((5.85, -1.0), text(size: 6pt)[$0,96$])
    
    // Từ nb2 -> a3, na3
    rect((6.5, -1.6), (7.5, -1.1), fill: rgb("#fee2e2"), stroke: 0.8pt + rgb("#dc2626"), radius: 2pt, name: "a3")
    content("a3", text(size: 7.5pt, fill: rgb("#dc2626"), weight: "bold")[$A$])
    
    rect((6.5, -2.4), (7.5, -1.9), fill: rgb("#f8fafc"), stroke: 0.6pt + gray, radius: 2pt, name: "na3")
    content("na3", text(size: 7.5pt)[$overline(A)$])
    
    line("nb2.east", "a3.west", mark: (end: "stealth"), stroke: 0.7pt + rgb("#dc2626"))
    content((5.85, -1.2), text(size: 6pt, fill: rgb("#dc2626"))[$0,02$])
    
    line("nb2.east", "na3.west", mark: (end: "stealth"), stroke: 0.7pt + gray)
    content((5.85, -2.3), text(size: 6pt)[$0,98$])
  }),  
  fig-pos: "center",
  fig-width: 0.75,
  loigiai: [
    #step[Tóm tắt các biến cố và xác suất thành phần]
    - Gọi $D_1$ là biến cố số chấm không vượt quá $2$: $P(D_1) = 2/6 = 1/3$.
    - Gọi $D_2$ là biến cố số chấm lớn hơn $2$: $P(D_2) = 4/6 = 2/3$.
    - Tỉ lệ sản phẩm: $P(B | D_1) = 1$, $P(B | D_2) = 0,6$, $P(overline(B) | D_2) = 0,4$.
    - Tỉ lệ phế phẩm: $P(A | B) = 0,04$, $P(A | overline(B)) = 0,02$.
    
    #step[Xét ý a: Xác suất có điều kiện $P(A | B)$]
    Sản phẩm của xí nghiệp I luôn có tỉ lệ phế phẩm là $4%$ bất kể chọn theo phương thức nào:
    $ P(A | B) = 0,04. $ *Ý a Đúng.*
    
    #step[Xét ý b: Xác suất toàn phần $P(B)$]
    Áp dụng công thức xác suất toàn phần:
    $ P(B) = P(D_1) dot P(B | D_1) + P(D_2) dot P(B | D_2) = 1/3 dot 1 + 2/3 dot 0,6 = 1/3 + 2/5 = 11/15 approx 0,733 != 0,6. $
    *Ý b Sai.*
    
    #step[Xét ý c: Xác suất chọn được phế phẩm $P(A)$]
    Áp dụng công thức xác suất đầy đủ:
    $ P(A) &= P(D_1) dot P(B | D_1) dot P(A | B) + P(D_2) [ P(B | D_2) dot P(A | B) + P(overline(B) | D_2) dot P(A | overline(B)) ] \
    &= 1/3(1)(0,04) + 2/3 [ 0,6(0,04) + 0,4(0,02) ] \
    &= 4/300 + 2/3(0,024 + 0,008) = 1/75 + 2/3(0,032) = 13/375 approx 0,0347 != 0,032. $
    *Ý c Sai.*
    
    #step[Xét ý d: Áp dụng công thức Bayes tính $P(B | A)$]
    - Xác suất đồng thời chọn được sản phẩm của xí nghiệp I và là phế phẩm:
      $ P(A inter B) = 1/3(1)(0,04) + 2/3(0,6)(0,04) = 1/75 + 2/125 = 11/375. $
    - Theo công thức Bayes:
      $ P(B | A) = (P(A inter B))/(P(A)) = (11/375)/(13/375) = 11/13. $
    *Ý d Đúng.*
  ]
)

// ========================================================
// PHẦN III. CÂU TRẮC NGHIỆM TRẢ LỜI NGẮN (6 CÂU)
// ========================================================
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// --- CÂU 17 ---
#tln(
  [Cho hình lăng trụ đều $A B C. A' B' C'$ có $A A' = 8$, $A B = 6$. Gọi $M$ là trung điểm của cạnh $C C'$. Hãy tính khoảng cách giữa hai đường thẳng chéo nhau $A B'$ và $A' M$ (*làm tròn kết quả đến hàng phần trăm*).],
  [$3,53$],
  fig: cetz.canvas({
    import cetz.draw: *
    let a = 3.0
    let h = 3.2
    
    let A = (0, 0)
    let C = (a, 0)
    let B = (1.1, -0.8)
    let A1 = (0, h)
    let C1 = (a, h)
    let B1 = (1.1, h - 0.8)
    let M = (a, h / 2)
    
    // Nét đứt
    line(A, C, stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    line(A1, M, stroke: (dash: "dashed", paint: rgb("#ef4444"), thickness: 1pt))
    
    // Nét liền
    line(A, B, C, stroke: 1pt + black)
    line(A1, B1, C1, close: true, stroke: 1pt + black)
    line(A, A1, stroke: 1pt + black)
    line(B, B1, stroke: 1pt + black)
    line(C, C1, stroke: 1pt + black)
    line(A, B1, stroke: 1.2pt + rgb("#0284c7"))
    
    // Điểm
    circle(A, radius: 1.5pt, fill: black)
    circle(B, radius: 1.5pt, fill: black)
    circle(C, radius: 1.5pt, fill: black)
    circle(A1, radius: 1.5pt, fill: black)
    circle(B1, radius: 1.5pt, fill: black)
    circle(C1, radius: 1.5pt, fill: black)
    circle(M, radius: 1.5pt, fill: red)
    
    content((rel: (-0.2, 0), to: A), [$A$])
    content((rel: (0, -0.25), to: B), [$B$])
    content((rel: (0.2, 0), to: C), [$C$])
    content((rel: (-0.2, 0.15), to: A1), [$A'$])
    content((rel: (0, 0.25), to: B1), [$B'$])
    content((rel: (0.2, 0.15), to: C1), [$C'$])
    content((rel: (0.25, 0), to: M), text(fill: red)[$M$])
  }),
  loigiai: [
    #step[Dựng mặt phẳng song song chứa $A B'$]
    Dựng điểm $D$ sao cho tứ giác $A B D C$ là hình thoi cạnh $6$. Dựng lăng trụ đứng mở rộng $A B D C. A' B' D' C'$.
    Gọi $M'$ là trung điểm của cạnh $D D'$.
    Khi đó tứ giác $A' M M' B'$ là hình bình hành nên:
    $ A' M parallel B' M' subset (A B' M') => A' M parallel (A B' M'). $
    Do đó khoảng cách giữa hai đường thẳng chéo nhau là:
    $ d(A' M, A B') = d(A' M, (A B' M')) = d(A', (A B' M')). $
    
    #step[Tính thể tích khối chóp $M'. A A' B'$]
    - Khoảng cách từ $M'$ đến mặt phẳng $(A A' B')$:
      $ d(M', (A A' B')) = d(C, A B) = (6 sqrt(3))/2 = 3 sqrt(3) " (đường cao tam giác đều cạnh 6)". $
    - Diện tích tam giác vuông $A A' B'$:
      $ S_(Delta A A' B') = 1/2 dot A A' dot A' B' = 1/2 dot 8 dot 6 = 24. $
    - Thể tích khối tứ diện:
      $ V_(M'. A A' B') = 1/3 S_(Delta A A' B') dot d(M', (A A' B')) = 1/3 dot 24 dot 3 sqrt(3) = 24 sqrt(3). $
      
    #step[Tính diện tích tam giác $A B' M'$]
    Ta có các tam giác vuông và tính các cạnh của $Delta A B' M'$:
    - $A B' = sqrt(A A'^2 + A' B'^2) = sqrt(8^2 + 6^2) = 10$.
    - $B' M' = sqrt(B' D'^2 + D' M'^2) = sqrt(6^2 + 4^2) = sqrt(52) = 2 sqrt(13)$.
    - $A M' = sqrt(A D^2 + D M'^2) = sqrt((6 sqrt(3))^2 + 4^2) = sqrt(108 + 16) = sqrt(124) = 2 sqrt(31)$.
    Áp dụng công thức Heron với nửa chu vi $p = (10 + 2 sqrt(13) + 2 sqrt(31))/2$:
    $ S_(Delta A B' M') = 3 sqrt(139). $
    
    #step[Tính khoảng cách]
    Vì $V_(A'. A B' M') = V_(M'. A A' B') = 24 sqrt(3)$ nên:
    $ d(A', (A B' M')) = (3 V_(A'. A B' M')) / S_(Delta A B' M') = (3 dot 24 sqrt(3))/(3 sqrt(139)) = (24 sqrt(3))/sqrt(139) approx 3,53. $
    
    #nhanxet[Cách 2 (Phương pháp tọa độ hóa $O x y z$):
    Chọn gốc $A(0; 0; 0)$, tia $A B$ trùng trục $O x$, tia $A y$ vuông góc $A B$ trong mặt phẳng $(A B C)$ và trục $O z$ dọc theo $A A'$.
    Khi đó: $A(0; 0; 0), B'(6; 0; 8), A'(0; 0; 8), C(3; 3 sqrt(3); 0), M(3; 3 sqrt(3); 4)$.
    - $arrow(A B') = (6; 0; 8)$, $arrow(A' M) = (3; 3 sqrt(3); -4)$, $arrow(A A') = (0; 0; 8)$.
    - Tích có hướng: $[arrow(A B'), arrow(A' M)] = (-24 sqrt(3); 48; 18 sqrt(3))$.
    - Khoảng cách giữa hai đường thẳng chéo nhau:
      $ d(A B', A' M) = (| [arrow(A B'), arrow(A' M)] dot arrow(A A') |) / ( | [arrow(A B'), arrow(A' M)] | ) = (144 sqrt(3)) / (6 sqrt(139)) = (24 sqrt(3)) / sqrt(139) approx 3,53. $
    ]
  ]
)

// --- CÂU 18 ---
#tln(
  [Diện tích phần hình phẳng $(H)$ giới hạn bởi đường cong Parabol và đoạn thẳng nối gốc tọa độ đến đỉnh đối diện trong hình chữ nhật kích thước $6 times 12$ (phần được gạch chéo) bằng bao nhiêu (*làm tròn kết quả đến hàng phần mười*)?],
  [$29,9$],
  fig: cetz.canvas({
    import cetz.draw: *
    let b = 9 - 3 * calc.sqrt(3)
    let a = -12 / calc.pow(b, 2)
    let f(x) = a * calc.pow(x - b, 2) + 12
    
    // Hình chữ nhật
    rect((0, 0), (3.6, 2.4), stroke: 1pt + black)
    line((0, 0), (3.6, 1.6), stroke: 1pt + black)
    
    // Parabol
    let pts = ()
    let x = 0.0
    while x <= 3.6 {
      let x_real = x * 6 / 3.6
      let y_real = f(x_real)
      pts.push((x, y_real * 2.4 / 12))
      x += 0.05
    }
    line(..pts, stroke: 1.2pt + rgb("#0e7490"))
    
    // Tô màu vùng (H)
    let fill_pts = ((0, 0), ..pts, (3.6, 1.6), (0, 0))
    line(..fill_pts, fill: rgb("#fef08a").transparentize(30%), stroke: none)
    
    content((1.8, 1.2), text(weight: "bold", fill: rgb("#854d0e"))[$(H)$])
  }),
  loigiai: [
    #step[Chọn hệ trục tọa độ $O x y$]
    Gốc $O(0; 0)$ tại góc dưới bên trái hình chữ nhật.
    Hình chữ nhật có các đỉnh $(0; 0), (6; 0), (6; 12), (0; 12)$.
    Đoạn thẳng giới hạn dưới đi qua $O(0; 0)$ và $A(6; 8)$ có phương trình $y = 4/3 x$.
    
    #step[Xác định phương trình đường cong Parabol]
    Parabol có đỉnh $I(x_0; 12)$ ($0 < x_0 < 6$) và trục đối xứng song song $O y$:
    $ (P): y = a (x - x_0)^2 + 12 quad (a < 0). $
    - Do $(P)$ đi qua $O(0; 0)$ nên: $a x_0^2 + 12 = 0 => a = -12/x_0^2$.
    - Do $(P)$ đi qua $A(6; 8)$ nên:
      $ -12/x_0^2 (6 - x_0)^2 + 12 = 8 <=> 8 x_0^2 - 144 x_0 + 432 = 0 <=> cases(x_0 = 9 + 3 sqrt(3) > 6 " (loại)", x_0 = 9 - 3 sqrt(3) " (nhận)"). $
    Suy ra hệ số $a = -2/9 (2 + sqrt(3))$.
    
    #step[Tính diện tích phần hình phẳng $(H)$]
    Diện tích $(H)$ bằng diện tích hình phẳng dưới parabol trừ diện tích tam giác vuông $O(6;0)A(6;8)$:
    $ S = integral_0^6 [ -2/9 (2 + sqrt(3))(x - 9 + 3 sqrt(3))^2 + 12 ] dif x - 1/2 dot 6 dot 8 approx 53,91 - 24 = 29,9. $
  ]
)

// --- CÂU 19 ---
#tln(
  [Trong không gian $O x y z$, coi Trái Đất là một hình cầu có tâm là gốc tọa độ $O(0;0;0)$ và bán kính $R = 16$, đơn vị trên mỗi trục tọa độ tương ứng với $400$ km. Mặt phẳng $(O x y)$ chứa đường xích đạo. Tại điểm $A(0; 16; 0)$ trên bề mặt, người ta phóng một tàu vũ trụ bay thẳng theo hướng vectơ $arrow(u) = (2; 0; 1)$ với tốc độ $10$ km/s. Sau thời gian $3$ phút, tàu ở vị trí $B$. Gọi $M$ là điểm trên đường xích đạo gần $B$ nhất. Tính độ dài $M B$ theo đơn vị kilômét (*làm tròn đến hàng đơn vị*).],
  [$829$],
  fig: cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 1.8, fill: rgb("#bbf7d0").transparentize(60%), stroke: 1pt + green.darken(30%))
    
    // Đường xích đạo elip (tâm (0, 0), bán kính a = 1.8, b = 0.5)
    arc((0, 0), start: 0deg, stop: -180deg, radius: (1.8, 0.5), anchor: "origin", stroke: 1.2pt + red)
    arc((0, 0), start: 0deg, stop: 180deg, radius: (1.8, 0.5), anchor: "origin", stroke: (dash: "dashed", paint: red, thickness: 0.8pt))
    
    let O = (0, 0)
    let A = (0.3, 1.2)
    let B = (1.8, 1.5)
    let M = (1.3, -0.35)
    
    circle(O, radius: 1.5pt, fill: black)
    circle(A, radius: 1.5pt, fill: black)
    circle(B, radius: 1.5pt, fill: red)
    circle(M, radius: 1.5pt, fill: blue)
    
    line(A, B, stroke: 1.2pt + red, mark: (end: "stealth"))
    line(O, A, stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))
    line(B, M, stroke: (dash: "dashed", paint: blue, thickness: 1pt))
    
    content((-0.2, 0), [$O$])
    content((0.2, 1.4), [$A$])
    content((2.0, 1.6), text(fill: red)[$B$])
    content((1.5, -0.55), text(fill: blue)[$M$])
  }),
  loigiai: [
    #step[Xác định tọa độ vị trí điểm $B$ của tàu vũ trụ]
    - Thời gian bay: $t = 3 " phút" = 180 " giây"$.
    - Quãng đường bay thực tế: $s = v dot t = 10 dot 180 = 1800 " km"$.
    - Đổi quãng đường sang đơn vị tọa độ (1 đơn vị $= 400$ km):
      $ d = 1800 / 400 = 4,5. $
    - Độ dài vectơ chỉ phương $arrow(u) = (2; 0; 1)$ là $|arrow(u)| = sqrt(2^2 + 0^2 + 1^2) = sqrt(5)$.
    - Tọa độ vectơ dịch chuyển:
      $ arrow(A B) = d / (|arrow(u)|) arrow(u) = 4,5 / sqrt(5) (2; 0; 1) = (9 / sqrt(5); 0; 4,5 / sqrt(5)). $
    - Với điểm phóng $A(0; 16; 0)$, tọa độ điểm $B$ là:
      $ B = (9 / sqrt(5); 16; 4,5 / sqrt(5)) approx (4,025; 16; 2,012). $
      
    #step[Tìm điểm $M$ trên đường xích đạo gần $B$ nhất]
    Đường xích đạo nằm trong mặt phẳng $(O x y)$ có phương trình:
    $ cases(
      x^2 + y^2 = 16^2,
      z = 0.
    ) $
    Gọi $B'$ là hình chiếu vuông góc của $B$ lên mặt phẳng $(O x y)$: $B'(9 / sqrt(5); 16; 0)$.
    Khoảng cách từ gốc $O$ đến $B'$:
    $ O B' = sqrt((9 / sqrt(5))^2 + 16^2) = sqrt(81/5 + 256) = sqrt(272","2) approx 16,4985. $
    Điểm $M$ trên đường tròn xích đạo gần $B$ nhất chính là giao điểm của tia $O B'$ với đường tròn, do đó:
    $ M B' = O B' - R = 16,4985 - 16 = 0,4985. $
    
    #step[Tính khoảng cách $M B$ theo kilômét]
    Khoảng cách trong không gian:
    $ M B = sqrt(M B'^2 + B_z^2) = sqrt(0","4985^2 + (4","5 / sqrt(5))^2) = sqrt(0","2485 + 4","05) = sqrt(4","2985) approx 2,0733. $
    Đổi sang kilômét:
    $ M B = 2,0733 dot 400 approx 829,31 " km" approx 829 " km". $
    
    #nhanxet[Điểm $M$ trên đường tròn xích đạo $(O x y)$ gần vị trí $B$ nhất chính là giao điểm của tia nối từ tâm $O$ đến hình chiếu $B'$ với đường tròn xích đạo. Nhờ đó ta có $M B' = O B' - R = 16,4985 - 16 = 0,4985$.]
  ]
)

// --- CÂU 20 ---
#tln(
  [Cho hình đa giác đều $(H)$ gồm có $4 320$ đỉnh. Gọi $A$ là tập hợp chứa tất cả các đa giác đều có các đỉnh thuộc tập đỉnh của $(H)$. Chọn ngẫu nhiên từ $A$ một đa giác. Gọi $P$ là xác suất để chọn được đa giác có góc ở đỉnh bằng $150^compose$. Hãy tính giá trị của $1 000 P$ (*làm tròn kết quả đến hàng đơn vị*).],
  [$42$],
  fig: cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 1.6, stroke: 1.2pt + red)
    circle((0, 0), radius: 2pt, fill: blue.darken(40%))
    
    let R = 1.6
    let angles = (70deg, 100deg, 130deg, 160deg, 190deg, 220deg)
    let pts = ()
    for ang in angles {
      let p = (R * calc.cos(ang), R * calc.sin(ang))
      pts.push(p)
      circle(p, radius: 2pt, fill: blue.darken(40%))
    }
    line(..pts, stroke: 1.2pt + blue)
    
    content((R * calc.cos(100deg) + 0.1, R * calc.sin(100deg) + 0.25), [$A_(4320)$])
    content((R * calc.cos(130deg) - 0.25, R * calc.sin(130deg) + 0.2), [$A_1$])
    content((R * calc.cos(160deg) - 0.3, R * calc.sin(160deg)), [$A_2$])
  }),
  loigiai: [
    #step[Tìm số cạnh của đa giác đều có góc $150^compose$]
    Góc ở mỗi đỉnh của đa giác đều $n$ cạnh ($n >= 3$) được tính bởi:
    $ alpha = ((n - 2) dot 180^compose)/n = 150^compose <=> 180n - 360 = 150n <=> 30n = 360 <=> n = 12. $
    
    #step[Tính số đa giác đều $12$ cạnh]
    Để tạo thành một đa giác đều $n$ cạnh từ các đỉnh của $(H)$ thì $n$ phải là ước của $4 320$ và $n >= 3$.
    Số lượng đa giác đều $12$ cạnh là:
    $ N_(12) = 4 320 / 12 = 360 " (đa giác)". $
    
    #step[Tính tổng số đa giác đều có thể tạo thành (số phần tử của $A$)]
    Phân tích thừa số nguyên tố: $4 320 = 2^5 dot 3^3 dot 5^1$.
    Tổng tất cả các ước nguyên dương của $4 320$ là:
    $ sigma(4 320) = (2^6 - 1)/(2 - 1) dot (3^4 - 1)/(3 - 1) dot (5^2 - 1)/(5 - 1) = 63 dot 40 dot 6 = 15 120. $
    Tổng số đa giác đều thuộc tập $A$ là:
    $ n(A) = sum_(n | 4 320, n >= 3) 4 320 / n = sigma(4 320) - 4 320 / 1 - 4 320 / 2 = 15 120 - 4 320 - 2 160 = 8 640. $
    
    #step[Tính xác suất và kết luận]
    Xác suất chọn được đa giác đều có góc ở đỉnh bằng $150^compose$:
    $ P = 360 / 8 640 = 1 / 24. $
    Do đó:
    $ 1 000 P = 1 000 / 24 = 125 / 3 approx 41,67 approx 42. $
    
    #ppgiai[Số đa giác đều $n$ cạnh nội tiếp trong đa giác đều $(H)$ có $N$ đỉnh bằng $N / n$. Để các đỉnh này thuộc tập đỉnh của $(H)$ thì $n$ phải là ước nguyên dương của $N$ và $n >= 3$. Tổng số đa giác đều mọi loại là $sum_(n | N, n >= 3) N / n$.]
  ]
)

// --- CÂU 21 ---
#tln(
  [Trên mặt phẳng toạ độ (đơn vị: kilômét), một khẩu pháo đặt tại gốc tọa độ $O(0;0)$ và một mục tiêu chuyển động thẳng đều ban đầu ở vị trí $A(0,5; 6)$. Ở thời điểm $20$ giây, khoảng cách từ mục tiêu đến $3$ trạm radar đặt tại $O, G(0,1; 0), H(0; 0,1)$ lần lượt là $sqrt(97)/2$ km; $sqrt(2386)/10$ km; $(2 sqrt(146))/5$ km. Ngay sau đó, khẩu pháo bắn ra một viên đạn với tốc độ $v_0$ (m/s) để đón bắt mục tiêu. Tính tốc độ nhỏ nhất của $v_0$ (*làm tròn kết quả đến hàng đơn vị*).],
  [$99$],
  fig: cetz.canvas({
    import cetz.draw: *
    line((-0.5, 0), (4.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((4.5, -0.25), [$x$])
    content((-0.25, 3.4), [$y$])
    content((-0.2, -0.2), [$O$])
    
    let A = (0.5, 3.0)
    let B = (1.5, 2.25)
    
    circle(A, radius: 2pt, fill: blue)
    circle(B, radius: 2pt, fill: red)
    line(A, B, stroke: (dash: "dashed", paint: red, thickness: 1pt), mark: (end: "stealth"))
    line((0, 0), B, stroke: 1.2pt + blue, mark: (end: "stealth"))
    
    content((0.5, 3.25), [$A$])
    content((1.65, 2.45), [$B$])
    content((0.8, 0.9), text(fill: blue, weight: "bold")[$arrow(v_0)$])
  }),
  loigiai: [
    #step[Xác định vị trí $B(x; y)$ của mục tiêu tại thời điểm $t = 20$ giây]
    Theo giả thiết khoảng cách từ $B$ đến các trạm radar:
    $ cases(
      O B^2 = x^2 + y^2 = 97/4 = 24","25 & quad (1),
      G B^2 = (x - 0","1)^2 + y^2 = 2386/100 = 23","86 & quad (2),
      H B^2 = x^2 + (y - 0","1)^2 = 584/25 = 23","36 & quad (3)
    ) $
    - Lấy $(1) - (2)$: $x^2 - (x - 0,1)^2 = 0,39 <=> 0,2x - 0,01 = 0,39 <=> x = 2$.
    - Lấy $(1) - (3)$: $y^2 - (y - 0,1)^2 = 0,89 <=> 0,2y - 0,01 = 0,89 <=> y = 4,5$.
    Do đó tại $t = 20$ s, mục tiêu ở vị trí $B(2; 4,5)$.
    
    #step[Vận tốc chuyển động của mục tiêu]
    $ arrow(v) = (arrow(A B))/20 = ((2 - 0,5)/20; (4,5 - 6)/20) = (0,075; -0,075) " (km/s)". $
    
    #step[Tìm tốc độ nhỏ nhất $v_0$ để bắn trúng mục tiêu]
    Giả sử đạn bắn từ $O$ và gặp mục tiêu sau thời gian $t' > 0$ giây. Vị trí gặp nhau:
    $ M(2 + 0,075 t'; 4,5 - 0,075 t'). $
    Vận tốc của viên đạn thỏa mãn:
    $ v_0^2 = (O M^2)/t'^2 = (2/t' + 0,075)^2 + (4,5/t' - 0,075)^2. $
    Đặt $X = 1/t' > 0$, ta xét tam thức bậc hai:
    $ f(X) = (2X + 0,075)^2 + (4,5X - 0,075)^2 = 24,25 X^2 - 0,375 X + 0,01125. $
    Tam thức có hệ số $a = 24,25 > 0$ nên đạt giá trị nhỏ nhất tại:
    $ X = 0,375 / (2 dot 24,25) = 3 / 388. $
    Giá trị nhỏ nhất:
    $ f_min = 0,01125 - 0,375^2 / (4 dot 24,25) approx 0,00980. $
    Vận tốc nhỏ nhất cần tìm:
    $ v_(0, min) = sqrt(f_min) approx 0,098996 " km/s" = 98,996 " m/s" approx 99 " m/s". $
    
    #meo[Kỹ thuật đặt ẩn phụ $X = 1/t'$ giúp chuyển biểu thức phân thức phức tạp về dạng tam thức bậc hai $f(X) = a X^2 + b X + c$ với $a = 24,25 > 0$, từ đó tìm giá trị nhỏ nhất tại đỉnh parabol $X = -b/(2a)$ một cách nhanh chóng và chính xác.]
  ]
)

#pagebreak()
// --- CÂU 22 ---
#tln(
  [Hai bạn Minh Châu và Vi Tiến Hân cùng tham gia chọn giải Thủ khoa Toán tỉnh. Mỗi bạn cầm hai con xúc xắc cân đối đồng chất gieo cùng lúc, bạn nào có tổng số chấm lớn hơn thì thắng cuộc; nếu hòa thì gieo lại. Tính xác suất để bạn Minh Châu nhận giải ngay sau lần gieo đầu tiên (*làm tròn kết quả đến hàng phần trăm*).],
  [$0,44$],
  loigiai: [
    #step[Tính xác suất hai bạn có tổng số chấm bằng nhau ở lần gieo đầu]
    Tổng số chấm $n$ của $2$ con xúc xắc nhận giá trị trong tập ${2, 3, 4, dots, 12}$.
    Số khả năng xuất hiện tổng $n$ khi gieo $2$ con xúc xắc là:
    - Với $2 <= n <= 7$: Có $n - 1$ cặp $(x_1, x_2)$ thỏa mãn $x_1 + x_2 = n$.
    - Với $8 <= n <= 12$: Có $13 - n$ cặp $(x_1, x_2)$ thỏa mãn $x_1 + x_2 = n$.
    
    Xác suất để cả hai bạn cùng đạt tổng số chấm bằng $n$ là $(P(n))^2$.
    Tổng xác suất hai bạn hòa nhau ở lần gieo đầu là:
    $ P_"hòa" = sum_(n = 2)^7 ((n - 1)/36)^2 + sum_(n = 8)^(12) ((13 - n)/36)^2 = (1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 5^2 + 4^2 + 3^2 + 2^2 + 1^2)/36^2 = 146 / 1296 = 73 / 648. $
    
    #step[Tính xác suất bạn Minh Châu chiến thắng]
    Do hai bạn gieo các con xúc xắc đồng chất và độc lập nên xác suất Châu thắng bằng xác suất Hân thắng:
    $ P_"Châu thắng" = (1 - P_"hòa") / 2 = (1 - 73/648)/2 = 575 / 1296 approx 0,4437 approx 0,44. $
    Vậy xác suất để bạn Minh Châu nhận được phần thưởng ngay sau lần gieo đầu tiên là $0,44$.
  ]
)
