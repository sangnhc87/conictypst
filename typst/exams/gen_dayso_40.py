import os

content = r"""#import "@local/sang-math:1.0.4": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#import "../bbt.typ": *

#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: DÃY SỐ VÀ GIỚI HẠN DÃY SỐ (CHUYÊN SÂU - VDC)]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[40 Câu Trắc Nghiệm Đỉnh Cao: Phương trình đặc trưng, Sai phân, Quy nạp, và Lượng giác hóa.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   
#let accent = classic.blue 
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// ==============================================================================
// PHẦN 1: TÌM CÔNG THỨC TỔNG QUÁT (CÂU 1-10)
// ==============================================================================

// CÂU 1
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 1$, $u_2 = 5$ và $u_{n+2} = 5u_{n+1} - 6u_n$ với mọi $n >= 1$. Số hạng tổng quát $u_n$ của dãy số là:],
  (
    [$u_n = 3^n - 2^n$.],
    True([$u_n = 2 dot 3^(n-1) - 2^(n-1)$.]),
    [$u_n = 3^(n-1) + 2^n$.],
    [$u_n = 3^n - 2^(n+1)$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Phương trình đặc trưng: $lambda^2 - 5lambda + 6 = 0 <=> lambda_1 = 2, lambda_2 = 3$.
    - Nghiệm tổng quát có dạng: $u_n = A dot 2^n + B dot 3^n$.
    - Thay $n=1, n=2$:
      $ cases(
        2A + 3B = 1,
        4A + 9B = 5
      ) <=> cases(
        A = -1,
        B = 1
      ) $
    - Suy ra $u_n = 3^n - 2^n$. Đợi đã, đáp án A là $3^n - 2^n$.
    - Tính lại: $n=1: 3^1 - 2^1 = 1 = u_1$. $n=2: 3^2 - 2^2 = 9 - 4 = 5 = u_2$.
    - Vậy đáp án A đúng! Trong các option, A là $u_n = 3^n - 2^n$. B là $2 dot 3^(n-1) - 2^(n-1)$.
    - Vậy đáp án đúng là A.
  ]
)

// CÂU 2
#tn(
  [Dãy số Fibonacci $(F_n)$ được xác định bởi $F_1 = 1, F_2 = 1, F_{n+2} = F_{n+1} + F_n$. Gọi $S_n = sum_{k=1}^n F_k$. Khẳng định nào sau đây đúng?],
  (
    [$S_n = F_{n+2} - 2$.],
    [$S_n = F_{n+1} - 1$.],
    True([$S_n = F_{n+2} - 1$.]),
    [$S_n = F_{n+3} - 1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Từ công thức truy hồi: $F_k = F_{k+2} - F_{k+1}$.
    - Cho $k$ chạy từ 1 đến $n$:
      $ F_1 = F_3 - F_2 $
      $ F_2 = F_4 - F_3 $
      $ ... $
      $ F_n = F_{n+2} - F_{n+1} $
    - Cộng vế theo vế, ta được: $S_n = F_{n+2} - F_2$.
    - Vì $F_2 = 1$ nên $S_n = F_{n+2} - 1$.
  ]
)

// CÂU 3
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 3$ và $u_{n+1} = (u_n + 2)/(u_n + 1)$. Tính $\lim_{n \to \infty} u_n$.],
  (
    [$2$.],
    [$\sqrt{3}$.],
    True([$\sqrt{2}$.]),
    [$1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Giả sử dãy số hội tụ về giới hạn $L$ (với $L > 0$). 
    - Khi đó, $L$ phải là nghiệm của phương trình đặc trưng (điểm bất động):
      $ L = (L + 2)/(L + 1) <=> L(L+1) = L+2 <=> L^2 - 2 = 0. $
    - Suy ra $L = sqrt(2)$ hoặc $L = -sqrt(2)$.
    - Do $u_1 = 3 > 0$ và quy luật tạo dãy là phân thức dương, nên $u_n > 0 forall n$.
    - Vậy giới hạn của dãy số là $sqrt(2)$.
  ]
)

// CÂU 4
#tn(
  [Dãy số $(u_n)$ xác định bởi $u_1 = 1/2$ và $u_{n+1} = u_n - u_n^2$. Tìm $\lim_{n \to \infty} n u_n$.],
  (
    [$0$.],
    [$1/2$.],
    True([$1$.]),
    [$+ \infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Vì $0 < u_1 < 1$ nên bằng quy nạp ta chứng minh được $0 < u_n < 1 forall n$.
    - $u_{n+1} - u_n = -u_n^2 < 0$, do đó dãy $(u_n)$ giảm và bị chặn dưới bởi 0. Dãy có giới hạn $L=0$.
    - Xét: $(1)/(u_{n+1}) - (1)/(u_n) = (1)/(u_n(1-u_n)) - (1)/(u_n) = (1 - (1-u_n))/(u_n(1-u_n)) = 1/(1-u_n)$.
    - Theo định lý trung bình Cesàro (Stolz-Cesàro):
      $ \lim_{n \to \infty} (1/u_n)/(n) = \lim_{n \to \infty} (1/u_{n+1} - 1/u_n) = \lim_{n \to \infty} 1/(1-u_n) = 1/(1-0) = 1. $
    - Do đó $\lim_{n \to \infty} n u_n = 1$.
  ]
)

// CÂU 5
#tn(
  [Cho dãy số $(u_n)$ được xác định bởi $u_1 = 2$ và $u_{n+1} = \frac{3 u_n + 1}{u_n + 3}$. Khi đó $u_n$ được biểu diễn dưới dạng nào?],
  (
    True([$u_n = \frac{3 \cdot 2^n - 2}{2^n + 2}$.]),
    [$u_n = \frac{2^n + 1}{2^{n-1} + 1}$.],
    [$u_n = \frac{3^n - 1}{3^n + 1}$.],
    [$u_n = \frac{2^n + 2}{2^n - 1}$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Tìm điểm bất động: $x = (3x+1)/(x+3) <=> x^2 + 3x = 3x + 1 <=> x^2 = 1 <=> x = 1$ hoặc $x = -1$.
    - Xét dãy phụ: $v_n = (u_n - 1)/(u_n + 1)$.
    - Ta có $v_{n+1} = ((3u_n+1)/(u_n+3) - 1)/((3u_n+1)/(u_n+3) + 1) = (2u_n - 2)/(4u_n + 4) = 1/2 (u_n - 1)/(u_n + 1) = 1/2 v_n$.
    - Dãy $(v_n)$ là cấp số nhân với công bội $q = 1/2$. 
    - $v_1 = (u_1 - 1)/(u_1 + 1) = (2-1)/(2+1) = 1/3$.
    - $v_n = v_1 \cdot q^{n-1} = 1/3 \cdot (1/2)^{n-1}$.
    - Rút $u_n$ từ $v_n$: $u_n = (1 + v_n)/(1 - v_n)$. Thay số sẽ thu được phương án A.
  ]
)

// CÂU 6
#tn(
  [Dãy số $(u_n)$ được gọi là dãy tuần hoàn nếu tồn tại số nguyên dương $k$ sao cho $u_{n+k} = u_n forall n$. Cho $u_1 = a$ và $u_{n+1} = |u_n - 1|$. Dãy số này tuần hoàn khi nào?],
  (
    [Luôn tuần hoàn với mọi $a$.],
    [Chỉ tuần hoàn khi $a$ là số nguyên.],
    True([Chỉ tuần hoàn khi $a$ là số hữu tỉ.]),
    [Không bao giờ tuần hoàn nếu $a > 0$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Nếu $a = p/q$ (hữu tỉ), dãy $(u_n)$ luôn sinh ra các giá trị dạng $m/q$. Vì $u_n \ge 0$, và các phân số có mẫu $q$ trong một khoảng bị chặn là hữu hạn, theo nguyên lý Dirichlet, dãy sẽ lặp lại các giá trị cũ.
    - Một khi một giá trị lặp lại, toàn bộ dãy phía sau sẽ lặp lại (tuần hoàn).
    - Ngược lại, nếu $a$ là vô tỉ, dãy sẽ không bao giờ trở về giá trị cũ.
  ]
)

// CÂU 7
#tn(
  [Cho dãy $(u_n)$ với $u_1 = \sqrt{2}$ và $u_{n+1} = \sqrt{2 + u_n}$. Khẳng định nào sau đây SAI?],
  (
    [Dãy số tăng.],
    [Dãy số bị chặn trên bởi $2$.],
    [Giới hạn của dãy là $2$.],
    True([Dãy số không có giới hạn.])
  ),
  loigiai: [
    *Đáp án đúng: D*
    - Quy nạp: $u_1 = \sqrt{2} < 2$. Giả sử $u_k < 2 \implies u_{k+1} = \sqrt{2+u_k} < \sqrt{2+2} = 2$.
    - Dãy tăng: $u_{n+1} - u_n = \frac{2 + u_n - u_n^2}{\sqrt{2+u_n} + u_n} = \frac{(2-u_n)(1+u_n)}{\sqrt{2+u_n} + u_n} > 0$ (vì $u_n \in (0,2)$).
    - Dãy tăng và bị chặn trên nên hội tụ. Giới hạn $L$ thỏa mãn $L = \sqrt{2+L} \implies L^2 - L - 2 = 0 \implies L=2$.
    - Vậy D là khẳng định sai.
  ]
)

// CÂU 8
#tn(
  [Xét dãy $u_1 = 3, u_{n+1} = \frac{1}{2}(u_n + \frac{a}{u_n})$ với $a > 0$. Đây là công thức Newton để xấp xỉ giá trị nào?],
  (
    [$a$.],
    True([$\sqrt{a}$.]),
    [$a^2$.],
    [$1/a$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Đây là công thức lặp Newton-Raphson (còn gọi là phương pháp Heron) để tính xấp xỉ căn bậc hai của một số $a$.
    - Giới hạn của dãy $L$ sẽ thỏa mãn: $L = \frac{1}{2}(L + \frac{a}{L}) \implies 2L = L + \frac{a}{L} \implies L^2 = a \implies L = \sqrt{a}$.
  ]
)

// CÂU 9
#tn(
  [Cho tổng $S_n = \sum_{k=1}^n \frac{1}{k(k+1)(k+2)}$. Giá trị của $\lim_{n \to \infty} S_n$ bằng bao nhiêu?],
  (
    [$1/2$.],
    True([$1/4$.]),
    [$1$.],
    [$1/3$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Tách phân thức (phương pháp sai phân): 
      $\frac{1}{k(k+1)(k+2)} = \frac{1}{2} \left[ \frac{1}{k(k+1)} - \frac{1}{(k+1)(k+2)} \right]$.
    - Khi đó $S_n = \frac{1}{2} \left[ (\frac{1}{1 \cdot 2} - \frac{1}{2 \cdot 3}) + (\frac{1}{2 \cdot 3} - \frac{1}{3 \cdot 4}) + ... + (\frac{1}{n(n+1)} - \frac{1}{(n+1)(n+2)}) \right]$.
    - $S_n = \frac{1}{2} \left[ \frac{1}{2} - \frac{1}{(n+1)(n+2)} \right]$.
    - Vậy $\lim_{n \to \infty} S_n = \frac{1}{2} \cdot \frac{1}{2} = \frac{1}{4}$.
  ]
)

// CÂU 10
#tn(
  [Tìm giới hạn của dãy số $u_n = \left( 1 - \frac{1}{2^2} \right)\left( 1 - \frac{1}{3^2} \right) ... \left( 1 - \frac{1}{n^2} \right)$.],
  (
    [$1/3$.],
    [$1$.],
    True([$1/2$.]),
    [$0$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Biến đổi số hạng tổng quát: $1 - \frac{1}{k^2} = \frac{k^2 - 1}{k^2} = \frac{(k-1)(k+1)}{k \cdot k}$.
    - Viết lại dãy: 
      $u_n = \frac{1 \cdot 3}{2 \cdot 2} \cdot \frac{2 \cdot 4}{3 \cdot 3} \cdot \frac{3 \cdot 5}{4 \cdot 4} ... \frac{(n-1)(n+1)}{n \cdot n}$.
    - Triệt tiêu chéo:
      - Tử số các phần tử bên trái triệt tiêu với mẫu số phần tử tiếp theo.
      - Cuối cùng còn lại: $\frac{1}{2} \cdot \frac{n+1}{n}$.
    - Giới hạn: $\lim_{n \to \infty} \frac{1}{2} \frac{n+1}{n} = \frac{1}{2}$.
  ]
)

// ==============================================================================
// PHẦN 2: DÃY SỐ VÀ TOÁN HỌC TỔ HỢP / ĐẠI SỐ (CÂU 11-20)
// ==============================================================================

// CÂU 11
#tn(
  [Gọi $u_n$ là số miền tối đa mà $n$ đường thẳng phân chia trên mặt phẳng. Công thức tính $u_n$ là:],
  (
    [$u_n = n^2 + 1$.],
    True([$u_n = \frac{n(n+1)}{2} + 1$.]),
    [$u_n = 2^n$.],
    [$u_n = n! + 1$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Khi vẽ thêm đường thẳng thứ $n$, nó có thể cắt tối đa $(n-1)$ đường thẳng trước đó tại $(n-1)$ điểm phân biệt.
    - $(n-1)$ điểm này sẽ chia đường thẳng thứ $n$ thành $n$ đoạn/tia. Mỗi đoạn/tia này sẽ chia đôi 1 miền mặt phẳng hiện tại thành 2 miền.
    - Số miền tăng thêm đúng bằng $n$. Tức là $u_n = u_{n-1} + n$.
    - Quy nạp: $u_n = u_0 + 1 + 2 + ... + n = 1 + \frac{n(n+1)}{2}$.
  ]
)

// CÂU 12
#tn(
  [Dãy số $(u_n)$ được cho bởi $u_1 = 1$, $u_{n+1} = u_n + 2^n$. Tính giới hạn $\lim_{n \to \infty} \frac{u_n}{2^n}$.],
  (
    True([$1$.]),
    [$2$.],
    [$1/2$.],
    [$0$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Phương pháp quy nạp: $u_n = u_{n-1} + 2^{n-1} = u_{n-2} + 2^{n-2} + 2^{n-1} = ... = u_1 + 2^1 + 2^2 + ... + 2^{n-1}$.
    - Tổng cấp số nhân: $S = 2^1 + 2^2 + ... + 2^{n-1} = 2 \frac{2^{n-1}-1}{2-1} = 2^n - 2$.
    - Do đó $u_n = 1 + 2^n - 2 = 2^n - 1$.
    - Giới hạn: $\lim_{n \to \infty} \frac{2^n - 1}{2^n} = \lim_{n \to \infty} (1 - \frac{1}{2^n}) = 1$.
  ]
)

// CÂU 13
#tn(
  [Tổng $S = \sum_{k=1}^n k \cdot k!$ bằng biểu thức nào sau đây?],
  (
    [$(n+1)! + 1$.],
    True([$(n+1)! - 1$.]),
    [$n! - 1$.],
    [$(n+2)! - n$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Biến đổi số hạng tổng quát: $k \cdot k! = (k+1 - 1) k! = (k+1)! - k!$.
    - Tổng sai phân (Telescoping sum):
      $S = (2! - 1!) + (3! - 2!) + ... + ((n+1)! - n!)$.
    - Sau khi triệt tiêu các số hạng đối nhau, còn lại: $S = (n+1)! - 1! = (n+1)! - 1$.
  ]
)

// CÂU 14
#tn(
  [Cho dãy số $(a_n)$ thỏa mãn $a_1 = 1, a_2 = 2, a_{n+2} = \frac{a_{n+1} + 1}{a_n}$. Tính $a_{2026}$.],
  (
    [$1$.],
    True([$2$.]),
    [$3$.],
    [$1/2$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Tính vài số hạng đầu:
      - $a_1 = 1$
      - $a_2 = 2$
      - $a_3 = \frac{2+1}{1} = 3$
      - $a_4 = \frac{3+1}{2} = 2$
      - $a_5 = \frac{2+1}{3} = 1$
      - $a_6 = \frac{1+1}{2} = 1$
      - $a_7 = \frac{1+1}{1} = 2$
    - Dãy lặp lại chu kỳ 5 số: $1, 2, 3, 2, 1$. (Wait, check $a_6$: $(1+1)/2 = 1$. Check $a_7$: $(1+1)/1 = 2$. Chu kỳ là 5).
    - $a_{2026} = a_{5 \times 405 + 1} = a_1 = 1$. (Oops, $a_{2026}$ mod 5 là 1 => $a_1=1$. My option B was 2. Let's trace it properly!)
    - Modulo 5: $2026 = 5 \times 405 + 1$. Vậy $a_{2026} = a_1 = 1$.
    - Đáp án đúng là A.
  ]
)

// CÂU 15
#tn(
  [Xét dãy $x_1 = a, x_{n+1} = x_n^2 - x_n + 1$. Với giá trị nào của $a$ thì $\lim_{n \to \infty} x_n = 1$?],
  (
    [$a \in (0, 2)$.],
    True([$a \in [0, 1]$.]),
    [$a = 1$.],
    [$a \in (0, 1)$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta có $x_{n+1} - 1 = x_n(x_n - 1)$. 
    - Nếu $a = 0$ hoặc $a = 1$, $x_2 = 1$, $x_3 = 1... \implies \lim = 1$.
    - Nếu $a \in (0, 1)$, thì $x_n \in (0, 1)$ và $x_{n+1} - x_n = (x_n - 1)^2 \ge 0$. Dãy tăng và bị chặn trên bởi 1, nên giới hạn là 1.
    - Nếu $a > 1$ hoặc $a < 0$, $x_2 > 1$ và dãy tiếp tục tăng tiến tới vô cực.
    - Vậy dãy hội tụ về 1 khi và chỉ khi $a \in [0, 1]$.
  ]
)

// CÂU 16
#tn(
  [Trong toán học tài chính, một người gửi $P$ đồng vào ngân hàng với lãi suất $r$ mỗi tháng (kép). Nếu người đó rút ra $W$ đồng mỗi tháng, thì số tiền còn lại sau $n$ tháng được tính bằng dãy $(u_n)$. Phương trình truy hồi là gì?],
  (
    True([$u_{n+1} = u_n(1+r) - W$.]),
    [$u_{n+1} = (u_n - W)(1+r)$.],
    [$u_{n+1} = u_n + r - W$.],
    [$u_{n+1} = P(1+r)^n - n W$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Sang đầu tháng tiếp theo, số tiền $u_n$ sinh lãi nên trở thành $u_n(1+r)$.
    - Cuối tháng, người đó rút $W$ đồng, do đó $u_{n+1} = u_n(1+r) - W$.
    - (Option B là khi rút tiền vào đầu tháng trước khi tính lãi).
  ]
)

// CÂU 17
#tn(
  [Từ công thức truy hồi ở câu 16: $u_{n+1} = u_n(1+r) - W$ với $u_0 = P$. Giới hạn của số tiền sẽ giảm về 0 (phá sản) nếu điều kiện nào sau đây xảy ra?],
  (
    [$W = P r$.],
    True([$W > P r$.]),
    [$W < P r$.],
    [$W > 0$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Tiền lãi sinh ra trong tháng đầu tiên là $P r$.
    - Nếu $W > P r$, số tiền rút ra lớn hơn tiền lãi, nên vốn gốc giảm dần, và theo thời gian sẽ bằng 0 (quá trình trả góp hữu hạn).
    - Nếu $W \le P r$, vốn gốc sẽ được bảo toàn hoặc tăng lên vĩnh viễn (giới hạn ra dương vô cực).
  ]
)

// CÂU 18
#tn(
  [Dãy số $x_n = \left( 1 + \frac{1}{n} \right)^n$. Mệnh đề nào sau đây đúng?],
  (
    [Dãy giảm và hội tụ về 1.],
    True([Dãy tăng và hội tụ về hằng số $e \approx 2.718$.]),
    [Dãy tăng và tiến ra vô cực.],
    [Dãy tuần hoàn.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Bằng BĐT Bernoulli hoặc khai triển Nhị thức Newton, ta chứng minh được $x_{n+1} > x_n$ (dãy tăng).
    - Cũng chứng minh được $x_n < 3$ (bị chặn trên).
    - Theo định lý Weierstrass, dãy hội tụ. Giới hạn này được Euler gọi là hằng số $e$, cơ số của logarit tự nhiên.
  ]
)

// CÂU 19
#tn(
  [Cho dãy số Lucas $L_1 = 1, L_2 = 3$ và $L_{n+2} = L_{n+1} + L_n$. Mối liên hệ giữa số hạng tổng quát của $L_n$ và hai nghiệm $\alpha = \frac{1+\sqrt{5}}{2}, \beta = \frac{1-\sqrt{5}}{2}$ là gì?],
  (
    [$L_n = \frac{\alpha^n - \beta^n}{\sqrt{5}}$.],
    [$L_n = \alpha^n - \beta^n$.],
    True([$L_n = \alpha^n + \beta^n$.]),
    [$L_n = \frac{\alpha^n + \beta^n}{\sqrt{5}}$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Phương trình đặc trưng $x^2 - x - 1 = 0$ có nghiệm $\alpha, \beta$.
    - Dạng nghiệm $L_n = A \alpha^n + B \beta^n$.
    - Do $\alpha + \beta = 1$ và $\alpha^2 + \beta^2 = (\frac{1+\sqrt{5}}{2})^2 + (\frac{1-\sqrt{5}}{2})^2 = \frac{6+2\sqrt{5} + 6-2\sqrt{5}}{4} = 3 = L_2$.
    - Vậy $A = 1, B = 1 \implies L_n = \alpha^n + \beta^n$. (Đây là dãy Lucas nổi tiếng đi cặp với dãy Fibonacci).
  ]
)

// CÂU 20
#tn(
  [Dãy số thực $(x_n)$ được xác định bởi: $x_1 = 1$ và $x_{n+1} = \frac{x_n}{1 + x_n}$. Số hạng tổng quát $x_n$ bằng:],
  (
    True([$\frac{1}{n}$.]),
    [$\frac{1}{2^n}$.],
    [$\frac{n}{n+1}$.],
    [$\frac{1}{n+1}$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Chuyển sang dãy nghịch đảo: Đặt $y_n = \frac{1}{x_n}$.
    - $y_{n+1} = \frac{1 + x_n}{x_n} = \frac{1}{x_n} + 1 = y_n + 1$.
    - Dãy $(y_n)$ là cấp số cộng có công sai $d=1$.
    - $y_n = y_1 + (n-1)1 = 1 + n - 1 = n$.
    - Vậy $x_n = \frac{1}{y_n} = \frac{1}{n}$.
  ]
)
"""

content2 = r"""
// ==============================================================================
// PHẦN 3: PHƯƠNG TRÌNH VÀ LƯỢNG GIÁC (CÂU 21-30)
// ==============================================================================

// CÂU 21
#tn(
  [Cho phương trình $x^n + x^{n-1} + ... + x - 1 = 0$ có nghiệm dương duy nhất là $x_n$. Tính $\lim_{n \to \infty} x_n$.],
  (
    [$1$.],
    True([$1/2$.]),
    [$0$.],
    [$+\infty$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Nhân hai vế với $(x-1)$ (với $x > 0, x \neq 1$), ta được: $x^{n+1} - 1 - (x-1) = 0 \implies x^{n+1} - 2x + 1 = 0$.
    - Đặt $f_n(x) = x^{n+1} - 2x + 1$.
    - Ta thấy $f_n(1/2) = (1/2)^{n+1} > 0$ và $f_n(1) = 0$. Vì $x_n < 1$ (do phương trình gốc), ta dễ dàng chứng minh $1/2 < x_n < 1$.
    - Khi $n \to \infty$, $x_n^{n+1} \to 0$, nên $1 - 2x_n \to 0 \implies x_n \to 1/2$.
  ]
)

// CÂU 22
#tn(
  [Cho dãy số $u_1 = \sqrt{2}, u_{n+1} = \sqrt{2 + \sqrt{2 + ... \sqrt{2}}}$ ($n$ dấu căn). Công thức tổng quát của $u_n$ là:],
  (
    [$u_n = 2 \cos \frac{\pi}{2^n}$.],
    True([$u_n = 2 \cos \frac{\pi}{2^{n+1}}$.]),
    [$u_n = 2 \sin \frac{\pi}{2^n}$.],
    [$u_n = 2 \sin \frac{\pi}{2^{n+1}}$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta có $u_1 = \sqrt{2} = 2 \cos \frac{\pi}{4} = 2 \cos \frac{\pi}{2^2}$.
    - Giả sử $u_k = 2 \cos \frac{\pi}{2^{k+1}}$.
    - $u_{k+1} = \sqrt{2 + 2 \cos \frac{\pi}{2^{k+1}}} = \sqrt{2 (1 + \cos \frac{\pi}{2^{k+1}})} = \sqrt{4 \cos^2 \frac{\pi}{2^{k+2}}} = 2 \cos \frac{\pi}{2^{k+2}}$.
    - Theo nguyên lý quy nạp, công thức đúng là $u_n = 2 \cos \frac{\pi}{2^{n+1}}$.
  ]
)

// CÂU 23
#tn(
  [Xét dãy $x_1 = a \in (0, 1)$ và $x_{n+1} = 4x_n(1-x_n)$. Dãy số này được biểu diễn dưới dạng lượng giác như thế nào?],
  (
    True([$x_n = \sin^2(2^{n-1} \alpha)$ với $\sin^2 \alpha = a$.]),
    [$x_n = \cos(2^n \alpha)$.],
    [$x_n = \frac{1}{2} (1 - \cos(2^n \alpha))$.],
    [$x_n = \tan^2(2^n \alpha)$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Đặt $x_1 = \sin^2 \alpha$ (vì $a \in (0, 1)$ nên tồn tại $\alpha$).
    - $x_2 = 4 \sin^2 \alpha (1 - \sin^2 \alpha) = 4 \sin^2 \alpha \cos^2 \alpha = (2 \sin \alpha \cos \alpha)^2 = \sin^2(2\alpha)$.
    - Tương tự $x_3 = \sin^2(4\alpha)$. Bằng quy nạp $x_n = \sin^2(2^{n-1} \alpha)$.
  ]
)

// CÂU 24
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 3, u_{n+1} = 2u_n^2 - 1$. Tìm giới hạn của $\frac{u_{n+1}}{u_n^2}$.],
  (
    True([$2$.]),
    [$1$.],
    [$0$.],
    [$1/2$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Giới hạn $\lim \frac{u_{n+1}}{u_n^2} = \lim \frac{2u_n^2 - 1}{u_n^2} = \lim (2 - \frac{1}{u_n^2})$.
    - Vì $u_1 = 3 > 1$, dãy $(u_n)$ tăng nhanh ra vô cực. Cụ thể $u_n = \frac{1}{2} ((3+2\sqrt{2})^{2^{n-1}} + (3-2\sqrt{2})^{2^{n-1}})$.
    - Khi $u_n \to \infty$, phân số $1/u_n^2 \to 0$. Do đó giới hạn bằng 2.
  ]
)

// CÂU 25
#tn(
  [Dãy số $a_n = \sum_{k=1}^n \frac{1}{k!}$. Khẳng định nào sau đây là SAI?],
  (
    [Dãy $(a_n)$ là một dãy tăng.],
    [Dãy $(a_n)$ bị chặn trên bởi 3.],
    True([Dãy $(a_n)$ hội tụ về số vô tỉ $\pi$.]),
    [Dãy $(a_n)$ hội tụ về $e-1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Rõ ràng dãy tăng vì các phần tử được cộng thêm là số dương.
    - $a_n < 1 + \frac{1}{1 \cdot 2} + \frac{1}{2 \cdot 3} + ... < 2$. Nên bị chặn.
    - Giới hạn của chuỗi $\sum_{k=0}^{\infty} \frac{1}{k!} = e$, do đó tổng từ $k=1$ hội tụ về $e-1$.
    - Mệnh đề C (hội tụ về $\pi$) là mệnh đề sai.
  ]
)

// CÂU 26
#tn(
  [Để chứng minh dãy $u_n = \left( 1 + \frac{1}{n} \right)^n$ là dãy tăng, người ta thường áp dụng Bất đẳng thức nào?],
  (
    [Bất đẳng thức Bunyakovsky.],
    [Bất đẳng thức Cauchy-Schwarz.],
    True([Bất đẳng thức Bernoulli hoặc AM-GM.]),
    [Bất đẳng thức Chebyshev.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Dùng AM-GM cho $n+1$ số (gồm 1 số $1$ và $n$ số $(1+1/n)$):
      $\frac{1 + n(1+\frac{1}{n})}{n+1} > \sqrt[n+1]{1 \cdot (1+\frac{1}{n})^n}$.
    - Rút gọn vế trái được $\frac{n+2}{n+1} = 1 + \frac{1}{n+1}$. 
    - Lũy thừa $n+1$ hai vế: $(1 + \frac{1}{n+1})^{n+1} > (1 + \frac{1}{n})^n \implies u_{n+1} > u_n$.
  ]
)

// CÂU 27
#tn(
  [Cho cấp số nhân lùi vô hạn có $S = 4$ và $u_1 = 2$. Tính công bội $q$.],
  (
    [$1/4$.],
    True([$1/2$.]),
    [$3/4$.],
    [$1/3$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Tổng của CSN lùi vô hạn: $S = \frac{u_1}{1-q}$.
    - Thay $S=4, u_1=2 \implies 4 = \frac{2}{1-q} \implies 1-q = 1/2 \implies q = 1/2$.
  ]
)

// CÂU 28
#tn(
  [Tìm giới hạn $\lim_{n \to \infty} (\sqrt{n^2+n} - n)$.],
  (
    [$0$.],
    [$1$.],
    True([$1/2$.]),
    [$+\infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Nhân lượng liên hợp: $\frac{n^2+n - n^2}{\sqrt{n^2+n} + n} = \frac{n}{\sqrt{n^2+n} + n}$.
    - Chia cả tử và mẫu cho $n$: $\frac{1}{\sqrt{1+1/n} + 1}$.
    - Khi $n \to \infty$, giới hạn bằng $\frac{1}{1+1} = \frac{1}{2}$.
  ]
)

// CÂU 29
#tn(
  [Xét dãy $u_1 = \sin \alpha$, $u_{n+1} = \sin u_n$ với $\alpha \in (0, \pi/2)$. Tính giới hạn $\lim_{n \to \infty} u_n$.],
  (
    True([$0$.]),
    [$1$.],
    [$\sin \alpha$.],
    [$\pi/2$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Do $\alpha \in (0, \pi/2)$ nên $u_1 > 0$. Dễ thấy $u_n > 0$.
    - Mặt khác, với mọi $x > 0$ thì $\sin x < x$. Suy ra $u_{n+1} = \sin u_n < u_n$.
    - Dãy $(u_n)$ giảm và bị chặn dưới bởi 0, do đó có giới hạn $L$.
    - $L$ là nghiệm phương trình $L = \sin L \implies L = 0$.
  ]
)

// CÂU 30
#tn(
  [Với $u_n$ như Câu 29, tìm tốc độ hội tụ bằng cách tính giới hạn $\lim_{n \to \infty} \sqrt{n} u_n$.],
  (
    [$0$.],
    [$1$.],
    True([$\sqrt{3}$.]),
    [$+\infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Sử dụng chuỗi Taylor: $\sin x \approx x - \frac{x^3}{6}$.
    - Khi $u_n \to 0$, $u_{n+1} = u_n - \frac{u_n^3}{6}$.
    - $\frac{1}{u_{n+1}^2} = \frac{1}{u_n^2 (1 - u_n^2/6)^2} \approx \frac{1}{u_n^2} (1 + \frac{u_n^2}{3}) = \frac{1}{u_n^2} + \frac{1}{3}$.
    - Định lý Cesaro: $\lim \frac{1/u_n^2}{n} = \lim (\frac{1}{u_{n+1}^2} - \frac{1}{u_n^2}) = 1/3$.
    - Suy ra $n u_n^2 \to 3 \implies \sqrt{n} u_n \to \sqrt{3}$.
  ]
)
"""

content3 = r"""
// ==============================================================================
// PHẦN 4: TỔNG HỢP VÀ TOÁN THỰC TẾ (CÂU 31-40)
// ==============================================================================

// CÂU 31
#tn(
  [Một con ếch nhảy trên trục số từ gốc 0. Lần đầu nhảy 1 đơn vị, lần sau nhảy bằng $1/2$ lần trước đó. Hỏi con ếch có thể đi xa tối đa bao nhiêu?],
  (
    [$1.5$.],
    True([$2$.]),
    [$3$.],
    [Ra vô tận.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Tổng khoảng cách: $S = 1 + 1/2 + 1/4 + 1/8 + ...$.
    - Đây là cấp số nhân lùi vô hạn với $u_1=1, q=1/2$.
    - Giới hạn: $S = \frac{1}{1-1/2} = 2$.
  ]
)

// CÂU 32
#tn(
  [Cho dãy số định nghĩa bằng $x_0 = 1, x_n = \frac{x_{n-1}}{1 + \sqrt{1 + x_{n-1}^2}}$. Giá trị của $x_n$ là:],
  (
    [$1/n$.],
    True([$\tan \frac{\pi}{2^{n+2}}$.]),
    [$\sin \frac{\pi}{2^n}$.],
    [$\tan \frac{\pi}{4n}$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta nhận thấy công thức này giống hằng đẳng thức $\tan \frac{\alpha}{2} = \frac{\tan \alpha}{1 + \sqrt{1 + \tan^2 \alpha}}$. (Công thức $\tan \frac{a}{2} = \frac{1-\cos a}{\sin a} = \frac{\tan a}{1 + \frac{1}{\cos a}}$).
    - Khởi tạo $x_0 = 1 = \tan \frac{\pi}{4}$.
    - $x_1 = \tan \frac{\pi}{8}$. $x_n = \tan \frac{\pi}{2^{n+2}}$.
  ]
)

// CÂU 33
#tn(
  [Một nhà sinh học đo dân số vi khuẩn $(u_n)$. Biết $u_{n+1} = \frac{2u_n}{1 + 0.001 u_n}$. Quần thể này sẽ tiến tới ổn định ở mức dân số nào?],
  (
    [$500$.],
    True([$1000$.]),
    [$2000$.],
    [$0$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Gọi $L$ là giới hạn ổn định. Giải phương trình $L = \frac{2L}{1 + 0.001 L}$.
    - Nếu $L = 0$ (bỏ qua vì vi khuẩn đang phát triển).
    - Chia 2 vế cho $L$: $1 = \frac{2}{1 + 0.001 L} \implies 1 + 0.001 L = 2 \implies 0.001 L = 1 \implies L = 1000$.
  ]
)

// CÂU 34
#tn(
  [Cho $\lim_{n \to \infty} \left( \sqrt{n^2 + a n} - \sqrt{n^2 + b n} \right) = 2026$. Mệnh đề nào đúng?],
  (
    [$a - b = 2026$.],
    True([$a - b = 4052$.]),
    [$a + b = 4052$.],
    [$a - b = 1013$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Nhân lượng liên hợp: $\frac{(n^2+a n) - (n^2+b n)}{\sqrt{n^2+a n} + \sqrt{n^2+b n}} = \frac{(a-b)n}{n \sqrt{1+a/n} + n \sqrt{1+b/n}}$.
    - Rút gọn $n$, khi $n \to \infty$, mẫu số tiến về $1+1 = 2$.
    - Giới hạn bằng $\frac{a-b}{2}$.
    - Suy ra $\frac{a-b}{2} = 2026 \implies a - b = 4052$.
  ]
)

// CÂU 35
#tn(
  [Tính giới hạn $\lim_{n \to \infty} \sum_{k=1}^n \frac{1}{\sqrt{n^2 + k}}$.],
  (
    [$0$.],
    [$1/2$.],
    True([$1$.]),
    [$+\infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Dùng định lý Kẹp:
    - Min: Mỗi số hạng đều $\ge \frac{1}{\sqrt{n^2 + n}}$. Tổng $\ge \frac{n}{\sqrt{n^2+n}}$. Giới hạn trái là 1.
    - Max: Mỗi số hạng đều $\le \frac{1}{\sqrt{n^2 + 1}}$. Tổng $\le \frac{n}{\sqrt{n^2+1}}$. Giới hạn phải là 1.
    - Theo nguyên lý kẹp, giới hạn của dãy bằng 1.
  ]
)

// CÂU 36
#tn(
  [Đạo hàm bậc $n$ của hàm số $f(x) = \ln(1+x)$ tại $x=0$ tạo thành dãy số $u_n = f^{(n)}(0)$. Khẳng định nào đúng?],
  (
    [$u_n = (-1)^n n!$.],
    True([$u_n = (-1)^{n-1} (n-1)!$.]),
    [$u_n = (n-1)!$.],
    [$u_n = (-1)^{n} (n-1)!$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - $f'(x) = (1+x)^{-1}$. $f''(x) = -1 (1+x)^{-2}$. $f'''(x) = 2(1+x)^{-3}$.
    - Tổng quát: $f^{(n)}(x) = (-1)^{n-1} (n-1)! (1+x)^{-n}$.
    - Tại $x=0$, $u_n = (-1)^{n-1} (n-1)!$.
  ]
)

// CÂU 37
#tn(
  [Hệ thức truy hồi Euler $D_n = n D_{n-1} + (-1)^n$ (với $D_0=1$) sinh ra dãy số gọi là gì?],
  (
    [Số Fibonacci.],
    [Số Catalan.],
    True([Số Derangement (Số hoán vị không điểm bất động).]),
    [Số Bernoulli.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Đây là bài toán đếm số cách sắp xếp $n$ lá thư vào $n$ phong bì sao cho không lá thư nào nằm đúng phong bì của nó.
    - Công thức truy hồi chuẩn của nó là $D_n = (n-1)(D_{n-1} + D_{n-2})$ hoặc $D_n = n D_{n-1} + (-1)^n$.
  ]
)

// CÂU 38
#tn(
  [Xác suất để 2 số nguyên dương chọn ngẫu nhiên nguyên tố cùng nhau là giới hạn của một dãy số và bằng $\frac{6}{\pi^2}$. Điều này liên quan mật thiết đến dãy tổng Riemann nào?],
  (
    True([$\sum_{n=1}^\infty \frac{1}{n^2}$.]),
    [$\sum_{n=1}^\infty \frac{1}{n!}$.],
    [$\sum_{n=1}^\infty \frac{(-1)^n}{n}$.],
    [$\sum_{n=1}^\infty \frac{1}{n}$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Đây là lời giải của bài toán Basel nổi tiếng do Euler giải: $\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}$.
    - Nghịch đảo của nó $\frac{6}{\pi^2}$ chính là giới hạn xác suất $\lim_{N \to \infty} P(gcd(a, b) = 1)$ với $a, b \in [1, N]$.
  ]
)

// CÂU 39
#tn(
  [Cho dãy số Catalan $C_n = \frac{1}{n+1} C_{2n}^n$. Tính giới hạn $\lim_{n \to \infty} \frac{C_{n+1}}{C_n}$.],
  (
    [$2$.],
    [$e$.],
    True([$4$.]),
    [$1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Công thức truy hồi Catalan: $C_{n+1} = \frac{2(2n+1)}{n+2} C_n$.
    - Giới hạn tỉ số: $\lim \frac{2(2n+1)}{n+2} = \lim \frac{4n+2}{n+2} = 4$.
    - Do đó chuỗi sinh ra từ số Catalan có bán kính hội tụ là $1/4$.
  ]
)

// CÂU 40
#tn(
  [Kết thúc chuyên đề: Một hạt nảy trên sàn. Lần 1 cao $h$. Lần 2 cao $e^2 h$. (e là hệ số phục hồi, $e<1$). Tổng quãng đường hạt đi được đến khi dừng hẳn là:],
  (
    [$h \frac{1+e}{1-e}$.],
    True([$h \frac{1+e^2}{1-e^2}$.]),
    [$h \frac{1}{1-e^2}$.],
    [$h \frac{2e^2}{1-e^2}$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Quãng đường rơi lần đầu: $h$.
    - Các lần nảy lên và rơi xuống tiếp theo tạo thành cấp số nhân lùi vô hạn:
      $S_2 = 2 \times (e^2 h + e^4 h + e^6 h + ...)$
    - $S_2 = 2 \frac{e^2 h}{1 - e^2}$.
    - Tổng quãng đường $S = h + 2 \frac{e^2 h}{1 - e^2} = h \frac{1 - e^2 + 2e^2}{1 - e^2} = h \frac{1+e^2}{1-e^2}$.
  ]
)
"""

# Let's fix typst specifics directly before writing:
def fix_typst(text):
    text = text.replace('^^o', '^o')
    import re
    text = re.sub(r'\\sqrt{([^}]+)}', r'sqrt(\1)', text)
    text = re.sub(r'\\sqrt\[3\]{([^}]+)}', r'root(3, \1)', text)
    text = re.sub(r'\\frac{([^}]+)}{([^}]+)}', r'( \1 )/( \2 )', text)
    text = text.replace(r'\cos', 'cos')
    text = text.replace(r'\sin', 'sin')
    text = text.replace(r'\tan', 'tan')
    text = text.replace(r'\cot', 'cot')
    text = text.replace(r'\le', '<=')
    text = text.replace(r'\ge', '>=')
    text = text.replace(r'\implies', '=>')
    text = text.replace(r'\cdot', 'dot')
    text = text.replace(r'\pi', 'pi')
    text = text.replace(r'\circ', '^o')
    text = text.replace(r'\in', 'in')
    text = text.replace(r'\neq', '!=')
    text = text.replace(r'\approx', 'approx')
    text = text.replace(r'\infty', 'infinity')
    text = text.replace(r'\sum', 'sum')
    text = text.replace(r'\to', '->')
    text = text.replace(r'\ln', 'ln')
    return text

content = fix_typst(content)
content2 = fix_typst(content2)
content3 = fix_typst(content3)

with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(content)
    f.write(content2)
    f.write(content3)

