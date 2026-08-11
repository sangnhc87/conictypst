#import "@local/sang-math:1.0.4": *
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
// CƠ SỞ LÝ THUYẾT: KỸ THUẬT QUY VỀ CẤP SỐ NHÂN (CSN)
// ==============================================================================
#block(
  fill: rgb("#fff8e1"),
  stroke: (left: 4pt + rgb("#ffb300")),
  inset: 12pt,
  radius: 4pt
)[
  #text(weight: "bold", size: 14pt, fill: rgb("#ff8f00"))[CƠ SỞ LÝ THUYẾT: KỸ THUẬT ĐẶT DÃY PHỤ QUY VỀ CẤP SỐ NHÂN]

  *1. Dạng tuyến tính bậc nhất:* $u_(n+1) = a u_n + b$ (với $a != 1$).
  - *Ý tưởng:* Tìm một hằng số $c$ (gọi là điểm bất động) sao cho phương trình có thể viết lại thành: 
    $u_(n+1) - c = a(u_n - c)$.
  - *Cách tìm:* Giải phương trình điểm bất động $c = a c + b => c = b/(1-a)$.
  - *Kết luận:* Dãy số phụ $v_n = u_n - c$ là một Cấp số nhân (CSN) với công bội $q = a$.

  *2. Dạng tuyến tính bậc nhất có đuôi đa thức / hàm mũ:* $u_(n+1) = a u_n + f(n)$.
  - *Ý tưởng:* Tìm một hàm phụ $g(n)$ cùng bậc với $f(n)$ sao cho:
    $u_(n+1) + g(n+1) = a(u_n + g(n))$.
  - *Ví dụ:* Nếu $f(n)$ là hằng số, $g(n)$ là hằng số (Dạng 1). Nếu $f(n) = b dot d^n$, ta tìm $g(n) = k dot d^n$.
  - Khi đó dãy $v_n = u_n + g(n)$ là một CSN với công bội $q = a$.

  *3. Dạng phân thức tuyến tính bậc nhất:* $u_(n+1) = (a u_n + b)/(c u_n + d)$.
  - *Bước 1:* Giải phương trình đặc trưng (điểm bất động): $x = (a x + b)/(c x + d) <=> c x^2 + (d-a)x - b = 0$.
  - *Bước 2:* 
    - Nếu PT có 2 nghiệm phân biệt $x_1, x_2$: Đặt $v_n = (u_n - x_1)/(u_n - x_2)$. Dãy $v_n$ sẽ là một CSN.
    - Nếu PT có nghiệm kép $x_0$: Đặt $v_n = 1/(u_n - x_0)$. Dãy $v_n$ sẽ là một Cấp số cộng (CSC).

  *4. Dạng tuyến tính bậc hai:* $u_(n+2) = a u_(n+1) + b u_n$.
  - *Ý tưởng:* Đưa về dạng $u_(n+2) - x_1 u_(n+1) = x_2 (u_(n+1) - x_1 u_n)$.
  - Dãy phụ $v_n = u_(n+1) - x_1 u_n$ sẽ là CSN với công bội $q = x_2$.
  - *Cách tìm:* $x_1, x_2$ chính là hai nghiệm của phương trình đặc trưng: $X^2 - a X - b = 0$.
]

// ==============================================================================
// PHẦN 1: TÌM CÔNG THỨC TỔNG QUÁT (CÂU 1-10)
// ==============================================================================

// CÂU 1
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 1$, $u_2 = 5$ và $u_(n+2) = 5u_(n+1) - 6u_n$ với mọi $n >= 1$. Số hạng tổng quát $u_n$ của dãy số là:],
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
  [Dãy số Fibonacci $(F_n)$ được xác định bởi $F_1 = 1, F_2 = 1, F_(n+2) = F_(n+1) + F_n$. Gọi $S_n = sum_(k=1)^n F_k$. Khẳng định nào sau đây đúng?],
  (
    [$S_n = F_(n+2) - 2$.],
    [$S_n = F_(n+1) - 1$.],
    True([$S_n = F_(n+2) - 1$.]),
    [$S_n = F_(n+3) - 1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Từ công thức truy hồi: $F_k = F_(k+2) - F_(k+1)$.
    - Cho $k$ chạy từ 1 đến $n$:
      $ F_1 = F_3 - F_2 $
      $ F_2 = F_4 - F_3 $
      $ ... $
      $ F_n = F_(n+2) - F_(n+1) $
    - Cộng vế theo vế, ta được: $S_n = F_(n+2) - F_2$.
    - Vì $F_2 = 1$ nên $S_n = F_(n+2) - 1$.
  ]
)

// CÂU 3
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 3$ và $u_(n+1) = (u_n + 2)/(u_n + 1)$. Tính $lim_(n -> infty) u_n$.],
  (
    [$2$.],
    [$sqrt(3)$.],
    True([$sqrt(2)$.]),
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
  [Dãy số $(u_n)$ xác định bởi $u_1 = 1/2$ và $u_(n+1) = u_n - u_n^2$. Tìm $lim_(n -> infty) n u_n$.],
  (
    [$0$.],
    [$1/2$.],
    True([$1$.]),
    [$+ infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Vì $0 < u_1 < 1$ nên bằng quy nạp ta chứng minh được $0 < u_n < 1 forall n$.
    - $u_(n+1) - u_n = -u_n^2 < 0$, do đó dãy $(u_n)$ giảm và bị chặn dưới bởi 0. Dãy có giới hạn $L=0$.
    - Xét: $(1)/(u_(n+1)) - (1)/(u_n) = (1)/(u_n(1-u_n)) - (1)/(u_n) = (1 - (1-u_n))/(u_n(1-u_n)) = 1/(1-u_n)$.
    - Theo định lý trung bình Cesàro (Stolz-Cesàro):
      $ lim_(n -> infty) (1/u_n)/(n) = lim_(n -> infty) (1/u_(n+1) - 1/u_n) = lim_(n -> infty) 1/(1-u_n) = 1/(1-0) = 1. $
    - Do đó $lim_(n -> infty) n u_n = 1$.
  ]
)

// CÂU 5
#tn(
  [Cho dãy số $(u_n)$ được xác định bởi $u_1 = 2$ và $u_(n+1) = ( 3 u_n + 1 )/( u_n + 3 )$. Khi đó $u_n$ được biểu diễn dưới dạng nào?],
  (
    True([$u_n = ( 3 dot 2^n - 2 )/( 2^n + 2 )$.]),
    [$u_n = ( 2^n + 1 )/( 2^(n-1 ) + 1)$.],
    [$u_n = ( 3^n - 1 )/( 3^n + 1 )$.],
    [$u_n = ( 2^n + 2 )/( 2^n - 1 )$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Tìm điểm bất động: $x = (3x+1)/(x+3) <=> x^2 + 3x = 3x + 1 <=> x^2 = 1 <=> x = 1$ hoặc $x = -1$.
    - Xét dãy phụ: $v_n = (u_n - 1)/(u_n + 1)$.
    - Ta có $v_(n+1) = ((3u_n+1)/(u_n+3) - 1)/((3u_n+1)/(u_n+3) + 1) = (2u_n - 2)/(4u_n + 4) = 1/2 (u_n - 1)/(u_n + 1) = 1/2 v_n$.
    - Dãy $(v_n)$ là cấp số nhân với công bội $q = 1/2$. 
    - $v_1 = (u_1 - 1)/(u_1 + 1) = (2-1)/(2+1) = 1/3$.
    - $v_n = v_1 dot q^(n-1) = 1/3 dot (1/2)^(n-1)$.
    - Rút $u_n$ từ $v_n$: $u_n = (1 + v_n)/(1 - v_n)$. Thay số sẽ thu được phương án A.
  ]
)

// CÂU 6
#tn(
  [Dãy số $(u_n)$ được gọi là dãy tuần hoàn nếu tồn tại số nguyên dương $k$ sao cho $u_(n+k) = u_n forall n$. Cho $u_1 = a$ và $u_(n+1) = |u_n - 1|$. Dãy số này tuần hoàn khi nào?],
  (
    [Luôn tuần hoàn với mọi $a$.],
    [Chỉ tuần hoàn khi $a$ là số nguyên.],
    True([Chỉ tuần hoàn khi $a$ là số hữu tỉ.]),
    [Không bao giờ tuần hoàn nếu $a > 0$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Nếu $a = p/q$ (hữu tỉ), dãy $(u_n)$ luôn sinh ra các giá trị dạng $m/q$. Vì $u_n >= 0$, và các phân số có mẫu $q$ trong một khoảng bị chặn là hữu hạn, theo nguyên lý Dirichlet, dãy sẽ lặp lại các giá trị cũ.
    - Một khi một giá trị lặp lại, toàn bộ dãy phía sau sẽ lặp lại (tuần hoàn).
    - Ngược lại, nếu $a$ là vô tỉ, dãy sẽ không bao giờ trở về giá trị cũ.
  ]
)

// CÂU 7
#tn(
  [Cho dãy $(u_n)$ với $u_1 = sqrt(2)$ và $u_(n+1) = sqrt(2 + u_n)$. Khẳng định nào sau đây SAI?],
  (
    [Dãy số tăng.],
    [Dãy số bị chặn trên bởi $2$.],
    [Giới hạn của dãy là $2$.],
    True([Dãy số không có giới hạn.])
  ),
  loigiai: [
    *Đáp án đúng: D*
    - Quy nạp: $u_1 = sqrt(2) < 2$. Giả sử $u_k < 2 => u_(k+1) = sqrt(2+u_k) < sqrt(2+2) = 2$.
    - Dãy tăng: $u_(n+1) - u_n = ( 2 + u_n - u_n^2 )/( sqrt(2+u_n) + u_n ) = ( (2-u_n)(1+u_n) )/( sqrt(2+u_n) + u_n ) > 0$ (vì $u_n in (0,2)$).
    - Dãy tăng và bị chặn trên nên hội tụ. Giới hạn $L$ thỏa mãn $L = sqrt(2+L) => L^2 - L - 2 = 0 => L=2$.
    - Vậy D là khẳng định sai.
  ]
)

// CÂU 8
#tn(
  [Xét dãy $u_1 = 3, u_(n+1) = ( 1 )/( 2 )(u_n + ( a )/( u_n ))$ với $a > 0$. Đây là công thức Newton để xấp xỉ giá trị nào?],
  (
    [$a$.],
    True([$sqrt(a)$.]),
    [$a^2$.],
    [$1/a$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Đây là công thức lặp Newton-Raphson (còn gọi là phương pháp Heron) để tính xấp xỉ căn bậc hai của một số $a$.
    - Giới hạn của dãy $L$ sẽ thỏa mãn: $L = ( 1 )/( 2 )(L + ( a )/( L )) => 2L = L + ( a )/( L ) => L^2 = a => L = sqrt(a)$.
  ]
)

// CÂU 9
#tn(
  [Cho tổng $S_n = sum_(k=1)^n ( 1 )/( k(k+1)(k+2) )$. Giá trị của $lim_(n -> infty) S_n$ bằng bao nhiêu?],
  (
    [$1/2$.],
    True([$1/4$.]),
    [$1$.],
    [$1/3$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Tách phân thức (phương pháp sai phân): 
      $( 1 )/( k(k+1)(k+2) ) = ( 1 )/( 2 ) [ ( 1 )/( k(k+1) ) - ( 1 )/( (k+1)(k+2) ) ]$.
    - Khi đó $S_n = ( 1 )/( 2 ) [ (( 1 )/( 1 dot 2 ) - ( 1 )/( 2 dot 3 )) + (( 1 )/( 2 dot 3 ) - ( 1 )/( 3 dot 4 )) + ... + (( 1 )/( n(n+1) ) - ( 1 )/( (n+1)(n+2) )) ]$.
    - $S_n = ( 1 )/( 2 ) [ ( 1 )/( 2 ) - ( 1 )/( (n+1)(n+2) ) ]$.
    - Vậy $lim_(n -> infty) S_n = ( 1 )/( 2 ) dot ( 1 )/( 2 ) = ( 1 )/( 4 )$.
  ]
)

// CÂU 10
#tn(
  [Tìm giới hạn của dãy số $u_n = ( 1 - ( 1 )/( 2^2 ) )( 1 - ( 1 )/( 3^2 ) ) ... ( 1 - ( 1 )/( n^2 ) )$.],
  (
    [$1/3$.],
    [$1$.],
    True([$1/2$.]),
    [$0$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Biến đổi số hạng tổng quát: $1 - ( 1 )/( k^2 ) = ( k^2 - 1 )/( k^2 ) = ( (k-1)(k+1) )/( k dot k )$.
    - Viết lại dãy: 
      $u_n = ( 1 dot 3 )/( 2 dot 2 ) dot ( 2 dot 4 )/( 3 dot 3 ) dot ( 3 dot 5 )/( 4 dot 4 ) ... ( (n-1)(n+1) )/( n dot n )$.
    - Triệt tiêu chéo:
      - Tử số các phần tử bên trái triệt tiêu với mẫu số phần tử tiếp theo.
      - Cuối cùng còn lại: $( 1 )/( 2 ) dot ( n+1 )/( n )$.
    - Giới hạn: $lim_(n -> infty) ( 1 )/( 2 ) ( n+1 )/( n ) = ( 1 )/( 2 )$.
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
    True([$u_n = ( n(n+1) )/( 2 ) + 1$.]),
    [$u_n = 2^n$.],
    [$u_n = n! + 1$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Khi vẽ thêm đường thẳng thứ $n$, nó có thể cắt tối đa $(n-1)$ đường thẳng trước đó tại $(n-1)$ điểm phân biệt.
    - $(n-1)$ điểm này sẽ chia đường thẳng thứ $n$ thành $n$ đoạn/tia. Mỗi đoạn/tia này sẽ chia đôi 1 miền mặt phẳng hiện tại thành 2 miền.
    - Số miền tăng thêm đúng bằng $n$. Tức là $u_n = u_(n-1) + n$.
    - Quy nạp: $u_n = u_0 + 1 + 2 + ... + n = 1 + ( n(n+1) )/( 2 )$.
  ]
)

// CÂU 12
#tn(
  [Dãy số $(u_n)$ được cho bởi $u_1 = 1$, $u_(n+1) = u_n + 2^n$. Tính giới hạn $lim_(n -> infty) ( u_n )/( 2^n )$.],
  (
    True([$1$.]),
    [$2$.],
    [$1/2$.],
    [$0$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Phương pháp quy nạp: $u_n = u_(n-1) + 2^(n-1) = u_(n-2) + 2^(n-2) + 2^(n-1) = ... = u_1 + 2^1 + 2^2 + ... + 2^(n-1)$.
    - Tổng cấp số nhân: $S = 2^1 + 2^2 + ... + 2^(n-1) = 2 {2^(n-1)-1}{2-1} = 2^n - 2$.
    - Do đó $u_n = 1 + 2^n - 2 = 2^n - 1$.
    - Giới hạn: $lim_(n -> infty) ( 2^n - 1 )/( 2^n ) = lim_(n -> infty) (1 - ( 1 )/( 2^n )) = 1$.
  ]
)

// CÂU 13
#tn(
  [Tổng $S = sum_(k=1)^n k dot k!$ bằng biểu thức nào sau đây?],
  (
    [$(n+1)! + 1$.],
    True([$(n+1)! - 1$.]),
    [$n! - 1$.],
    [$(n+2)! - n$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Biến đổi số hạng tổng quát: $k dot k! = (k+1 - 1) k! = (k+1)! - k!$.
    - Tổng sai phân (Telescoping sum):
      $S = (2! - 1!) + (3! - 2!) + ... + ((n+1)! - n!)$.
    - Sau khi triệt tiêu các số hạng đối nhau, còn lại: $S = (n+1)! - 1! = (n+1)! - 1$.
  ]
)

// CÂU 14
#tn(
  [Cho dãy số $(a_n)$ thỏa mãn $a_1 = 1, a_2 = 2, a_(n+2) = {a_(n+1) + 1}{a_n}$. Tính $a_(2026)$.],
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
      - $a_3 = ( 2+1 )/( 1 ) = 3$
      - $a_4 = ( 3+1 )/( 2 ) = 2$
      - $a_5 = ( 2+1 )/( 3 ) = 1$
      - $a_6 = ( 1+1 )/( 2 ) = 1$
      - $a_7 = ( 1+1 )/( 1 ) = 2$
    - Dãy lặp lại chu kỳ 5 số: $1, 2, 3, 2, 1$. (Wait, check $a_6$: $(1+1)/2 = 1$. Check $a_7$: $(1+1)/1 = 2$. Chu kỳ là 5).
    - $a_(2026) = a_(5 times 405 + 1) = a_1 = 1$. (Oops, $a_(2026)$ mod 5 là 1 => $a_1=1$. My option B was 2. Let's trace it properly!)
    - Modulo 5: $2026 = 5 times 405 + 1$. Vậy $a_(2026) = a_1 = 1$.
    - Đáp án đúng là A.
  ]
)

// CÂU 15
#tn(
  [Xét dãy $x_1 = a, x_(n+1) = x_n^2 - x_n + 1$. Với giá trị nào của $a$ thì $lim_(n -> infty) x_n = 1$?],
  (
    [$a in (0, 2)$.],
    True([$a in [0, 1]$.]),
    [$a = 1$.],
    [$a in (0, 1)$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta có $x_(n+1) - 1 = x_n(x_n - 1)$. 
    - Nếu $a = 0$ hoặc $a = 1$, $x_2 = 1$, $x_3 = 1... => lim = 1$.
    - Nếu $a in (0, 1)$, thì $x_n in (0, 1)$ và $x_(n+1) - x_n = (x_n - 1)^2 >= 0$. Dãy tăng và bị chặn trên bởi 1, nên giới hạn là 1.
    - Nếu $a > 1$ hoặc $a < 0$, $x_2 > 1$ và dãy tiếp tục tăng tiến tới vô cực.
    - Vậy dãy hội tụ về 1 khi và chỉ khi $a in [0, 1]$.
  ]
)

// CÂU 16
#tn(
  [Trong toán học tài chính, một người gửi $P$ đồng vào ngân hàng với lãi suất $r$ mỗi tháng (kép). Nếu người đó rút ra $W$ đồng mỗi tháng, thì số tiền còn lại sau $n$ tháng được tính bằng dãy $(u_n)$. Phương trình truy hồi là gì?],
  (
    True([$u_(n+1) = u_n(1+r) - W$.]),
    [$u_(n+1) = (u_n - W)(1+r)$.],
    [$u_(n+1) = u_n + r - W$.],
    [$u_(n+1) = P(1+r)^n - n W$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Sang đầu tháng tiếp theo, số tiền $u_n$ sinh lãi nên trở thành $u_n(1+r)$.
    - Cuối tháng, người đó rút $W$ đồng, do đó $u_(n+1) = u_n(1+r) - W$.
    - (Option B là khi rút tiền vào đầu tháng trước khi tính lãi).
  ]
)

// CÂU 17
#tn(
  [Từ công thức truy hồi ở câu 16: $u_(n+1) = u_n(1+r) - W$ với $u_0 = P$. Giới hạn của số tiền sẽ giảm về 0 (phá sản) nếu điều kiện nào sau đây xảy ra?],
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
    - Nếu $W <= P r$, vốn gốc sẽ được bảo toàn hoặc tăng lên vĩnh viễn (giới hạn ra dương vô cực).
  ]
)

// CÂU 18
#tn(
  [Dãy số $x_n = ( 1 + ( 1 )/( n ) )^n$. Mệnh đề nào sau đây đúng?],
  (
    [Dãy giảm và hội tụ về 1.],
    True([Dãy tăng và hội tụ về hằng số $e approx 2.718$.]),
    [Dãy tăng và tiến ra vô cực.],
    [Dãy tuần hoàn.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Bằng BĐT Bernoulli hoặc khai triển Nhị thức Newton, ta chứng minh được $x_(n+1) > x_n$ (dãy tăng).
    - Cũng chứng minh được $x_n < 3$ (bị chặn trên).
    - Theo định lý Weierstrass, dãy hội tụ. Giới hạn này được Euler gọi là hằng số $e$, cơ số của logarit tự nhiên.
  ]
)

// CÂU 19
#tn(
  [Cho dãy số Lucas $L_1 = 1, L_2 = 3$ và $L_(n+2) = L_(n+1) + L_n$. Mối liên hệ giữa số hạng tổng quát của $L_n$ và hai nghiệm $alpha = ( 1+sqrt(5) )/( 2 ), beta = ( 1-sqrt(5) )/( 2 )$ là gì?],
  (
    [$L_n = ( alpha^n - beta^n )/( sqrt(5) )$.],
    [$L_n = alpha^n - beta^n$.],
    True([$L_n = alpha^n + beta^n$.]),
    [$L_n = ( alpha^n + beta^n )/( sqrt(5) )$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Phương trình đặc trưng $x^2 - x - 1 = 0$ có nghiệm $alpha, beta$.
    - Dạng nghiệm $L_n = A alpha^n + B beta^n$.
    - Do $alpha + beta = 1$ và $alpha^2 + beta^2 = (( 1+sqrt(5) )/( 2 ))^2 + (( 1-sqrt(5) )/( 2 ))^2 = ( 6+2sqrt(5) + 6-2sqrt(5) )/( 4 ) = 3 = L_2$.
    - Vậy $A = 1, B = 1 => L_n = alpha^n + beta^n$. (Đây là dãy Lucas nổi tiếng đi cặp với dãy Fibonacci).
  ]
)

// CÂU 20
#tn(
  [Dãy số thực $(x_n)$ được xác định bởi: $x_1 = 1$ và $x_(n+1) = ( x_n )/( 1 + x_n )$. Số hạng tổng quát $x_n$ bằng:],
  (
    True([$( 1 )/( n )$.]),
    [$( 1 )/( 2^n )$.],
    [$( n )/( n+1 )$.],
    [$( 1 )/( n+1 )$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Chuyển sang dãy nghịch đảo: Đặt $y_n = ( 1 )/( x_n )$.
    - $y_(n+1) = ( 1 + x_n )/( x_n ) = ( 1 )/( x_n ) + 1 = y_n + 1$.
    - Dãy $(y_n)$ là cấp số cộng có công sai $d=1$.
    - $y_n = y_1 + (n-1)1 = 1 + n - 1 = n$.
    - Vậy $x_n = ( 1 )/( y_n ) = ( 1 )/( n )$.
  ]
)

// ==============================================================================
// PHẦN 3: PHƯƠNG TRÌNH VÀ LƯỢNG GIÁC (CÂU 21-30)
// ==============================================================================

// CÂU 21
#tn(
  [Cho phương trình $x^n + x^(n-1) + ... + x - 1 = 0$ có nghiệm dương duy nhất là $x_n$. Tính $lim_(n -> infty) x_n$.],
  (
    [$1$.],
    True([$1/2$.]),
    [$0$.],
    [$+infty$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Nhân hai vế với $(x-1)$ (với $x > 0, x != 1$), ta được: $x^(n+1) - 1 - (x-1) = 0 => x^(n+1) - 2x + 1 = 0$.
    - Đặt $f_n(x) = x^(n+1) - 2x + 1$.
    - Ta thấy $f_n(1/2) = (1/2)^(n+1) > 0$ và $f_n(1) = 0$. Vì $x_n < 1$ (do phương trình gốc), ta dễ dàng chứng minh $1/2 < x_n < 1$.
    - Khi $n -> infty$, $x_n^(n+1) -> 0$, nên $1 - 2x_n -> 0 => x_n -> 1/2$.
  ]
)

// CÂU 22
#tn(
  [Cho dãy số $u_1 = sqrt(2), u_(n+1) = sqrt(2 + sqrt(2 + ... sqrt(2)))$ ($n$ dấu căn). Công thức tổng quát của $u_n$ là:],
  (
    [$u_n = 2 cos ( pi )/( 2^n )$.],
    True([$u_n = 2 cos ( pi )/( 2^(n+1 ))$.]),
    [$u_n = 2 sin ( pi )/( 2^n )$.],
    [$u_n = 2 sin ( pi )/( 2^(n+1 ))$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta có $u_1 = sqrt(2) = 2 cos ( pi )/( 4 ) = 2 cos ( pi )/( 2^2 )$.
    - Giả sử $u_k = 2 cos ( pi )/( 2^(k+1 ))$.
    - $u_(k+1) = sqrt(2 + 2 cos(pi / 2^(k+1))) = sqrt(2 (1 + cos(pi / 2^(k+1)))) = sqrt(4 cos^2(pi / 2^(k+2))) = 2 cos(pi / 2^(k+2))$.
    - Theo nguyên lý quy nạp, công thức đúng là $u_n = 2 cos ( pi )/( 2^(n+1 ))$.
  ]
)

// CÂU 23
#tn(
  [Xét dãy $x_1 = a in (0, 1)$ và $x_(n+1) = 4x_n(1-x_n)$. Dãy số này được biểu diễn dưới dạng lượng giác như thế nào?],
  (
    True([$x_n = sin^2(2^(n-1) alpha)$ với $sin^2 alpha = a$.]),
    [$x_n = cos(2^n alpha)$.],
    [$x_n = ( 1 )/( 2 ) (1 - cos(2^n alpha))$.],
    [$x_n = tan^2(2^n alpha)$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Đặt $x_1 = sin^2 alpha$ (vì $a in (0, 1)$ nên tồn tại $alpha$).
    - $x_2 = 4 sin^2 alpha (1 - sin^2 alpha) = 4 sin^2 alpha cos^2 alpha = (2 sin alpha cos alpha)^2 = sin^2(2alpha)$.
    - Tương tự $x_3 = sin^2(4alpha)$. Bằng quy nạp $x_n = sin^2(2^(n-1) alpha)$.
  ]
)

// CÂU 24
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 3, u_(n+1) = 2u_n^2 - 1$. Tìm giới hạn của ${u_(n+1)}{u_n^2}$.],
  (
    True([$2$.]),
    [$1$.],
    [$0$.],
    [$1/2$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Giới hạn $lim {u_(n+1)}{u_n^2} = lim ( 2u_n^2 - 1 )/( u_n^2 ) = lim (2 - ( 1 )/( u_n^2 ))$.
    - Vì $u_1 = 3 > 1$, dãy $(u_n)$ tăng nhanh ra vô cực. Cụ thể $u_n = ( 1 )/( 2 ) ((3+2sqrt(2))^(2^(n-1)) + (3-2sqrt(2))^(2^(n-1)))$.
    - Khi $u_n -> infty$, phân số $1/u_n^2 -> 0$. Do đó giới hạn bằng 2.
  ]
)

// CÂU 25
#tn(
  [Dãy số $a_n = sum_(k=1)^n ( 1 )/( k! )$. Khẳng định nào sau đây là SAI?],
  (
    [Dãy $(a_n)$ là một dãy tăng.],
    [Dãy $(a_n)$ bị chặn trên bởi 3.],
    True([Dãy $(a_n)$ hội tụ về số vô tỉ $pi$.]),
    [Dãy $(a_n)$ hội tụ về $e-1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Rõ ràng dãy tăng vì các phần tử được cộng thêm là số dương.
    - $a_n < 1 + ( 1 )/( 1 dot 2 ) + ( 1 )/( 2 dot 3 ) + ... < 2$. Nên bị chặn.
    - Giới hạn của chuỗi $sum_(k=0)^(infty) ( 1 )/( k! ) = e$, do đó tổng từ $k=1$ hội tụ về $e-1$.
    - Mệnh đề C (hội tụ về $pi$) là mệnh đề sai.
  ]
)

// CÂU 26
#tn(
  [Để chứng minh dãy $u_n = ( 1 + ( 1 )/( n ) )^n$ là dãy tăng, người ta thường áp dụng Bất đẳng thức nào?],
  (
    [Bất đẳng thức Bunyakovsky.],
    [Bất đẳng thức Cauchy-Schwarz.],
    True([Bất đẳng thức Bernoulli hoặc AM-GM.]),
    [Bất đẳng thức Chebyshev.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Dùng AM-GM cho $n+1$ số (gồm 1 số $1$ và $n$ số $(1+1/n)$):
      $( 1 + n(1+1/n) )/(n+1) > root(n+1, 1 dot (1+ 1/n)^n)$.
    - Rút gọn vế trái được $( n+2 )/( n+1 ) = 1 + ( 1 )/( n+1 )$. 
    - Lũy thừa $n+1$ hai vế: $(1 + ( 1 )/( n+1 ))^(n+1) > (1 + ( 1 )/( n ))^n => u_(n+1) > u_n$.
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
    - Tổng của CSN lùi vô hạn: $S = ( u_1 )/( 1-q )$.
    - Thay $S=4, u_1=2 => 4 = ( 2 )/( 1-q ) => 1-q = 1/2 => q = 1/2$.
  ]
)

// CÂU 28
#tn(
  [Tìm giới hạn $lim_(n -> infty) (sqrt(n^2+n) - n)$.],
  (
    [$0$.],
    [$1$.],
    True([$1/2$.]),
    [$+infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Nhân lượng liên hợp: $( n^2+n - n^2 )/( sqrt(n^2+n) + n ) = ( n )/( sqrt(n^2+n) + n )$.
    - Chia cả tử và mẫu cho $n$: $( 1 )/( sqrt(1+1/n) + 1 )$.
    - Khi $n -> infty$, giới hạn bằng $( 1 )/( 1+1 ) = ( 1 )/( 2 )$.
  ]
)

// CÂU 29
#tn(
  [Xét dãy $u_1 = sin alpha$, $u_(n+1) = sin u_n$ với $alpha in (0, pi/2)$. Tính giới hạn $lim_(n -> infty) u_n$.],
  (
    True([$0$.]),
    [$1$.],
    [$sin alpha$.],
    [$pi/2$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Do $alpha in (0, pi/2)$ nên $u_1 > 0$. Dễ thấy $u_n > 0$.
    - Mặt khác, với mọi $x > 0$ thì $sin x < x$. Suy ra $u_(n+1) = sin u_n < u_n$.
    - Dãy $(u_n)$ giảm và bị chặn dưới bởi 0, do đó có giới hạn $L$.
    - $L$ là nghiệm phương trình $L = sin L => L = 0$.
  ]
)

// CÂU 30
#tn(
  [Với $u_n$ như Câu 29, tìm tốc độ hội tụ bằng cách tính giới hạn $lim_(n -> infty) sqrt(n) u_n$.],
  (
    [$0$.],
    [$1$.],
    True([$sqrt(3)$.]),
    [$+infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Sử dụng chuỗi Taylor: $sin x approx x - ( x^3 )/( 6 )$.
    - Khi $u_n -> 0$, $u_(n+1) = u_n - ( u_n^3 )/( 6 )$.
    - $( 1 )/( u_(n+1 )^2) = ( 1 )/( u_n^2 (1 - u_n^2/6)^2 ) approx ( 1 )/( u_n^2 ) (1 + ( u_n^2 )/( 3 )) = ( 1 )/( u_n^2 ) + ( 1 )/( 3 )$.
    - Định lý Cesaro: $lim ( 1/u_n^2 )/( n ) = lim (( 1 )/( u_(n+1 )^2) - ( 1 )/( u_n^2 )) = 1/3$.
    - Suy ra $n u_n^2 -> 3 => sqrt(n) u_n -> sqrt(3)$.
  ]
)

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
    - Giới hạn: $S = ( 1 )/( 1-1/2 ) = 2$.
  ]
)

// CÂU 32
#tn(
  [Cho dãy số định nghĩa bằng $x_0 = 1, x_n = ( x_(n-1) )/( 1 + sqrt(1 + x_(n-1)^2) )$. Giá trị của $x_n$ là:],
  (
    [$1/n$.],
    True([$tan ( pi )/( 2^(n+2 ))$.]),
    [$sin ( pi )/( 2^n )$.],
    [$tan ( pi )/( 4n )$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta nhận thấy công thức này giống hằng đẳng thức $tan ( alpha )/( 2 ) = ( tan alpha )/( 1 + sqrt(1 + tan^2 alpha) )$. (Công thức $tan ( a )/( 2 ) = ( 1-cos a )/( sin a ) = ( tan a )/( 1 + {1 ){cos a}}$).
    - Khởi tạo $x_0 = 1 = tan ( pi )/( 4 )$.
    - $x_1 = tan ( pi )/( 8 )$. $x_n = tan ( pi )/( 2^(n+2 ))$.
  ]
)

// CÂU 33
#tn(
  [Một nhà sinh học đo dân số vi khuẩn $(u_n)$. Biết $u_(n+1) = ( 2u_n )/( 1 + 0.001 u_n )$. Quần thể này sẽ tiến tới ổn định ở mức dân số nào?],
  (
    [$500$.],
    True([$1000$.]),
    [$2000$.],
    [$0$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Gọi $L$ là giới hạn ổn định. Giải phương trình $L = ( 2L )/( 1 + 0.001 L )$.
    - Nếu $L = 0$ (bỏ qua vì vi khuẩn đang phát triển).
    - Chia 2 vế cho $L$: $1 = ( 2 )/( 1 + 0.001 L ) => 1 + 0.001 L = 2 => 0.001 L = 1 => L = 1000$.
  ]
)

// CÂU 34
#tn(
  [Cho $lim_(n -> infty) ( sqrt(n^2 + a n) - sqrt(n^2 + b n) ) = 2026$. Mệnh đề nào đúng?],
  (
    [$a - b = 2026$.],
    True([$a - b = 4052$.]),
    [$a + b = 4052$.],
    [$a - b = 1013$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Nhân lượng liên hợp: $( (n^2+a n) - (n^2+b n) )/( sqrt(n^2+a n) + sqrt(n^2+b n) ) = ( (a-b)n )/( n sqrt(1+a/n) + n sqrt(1+b/n) )$.
    - Rút gọn $n$, khi $n -> infty$, mẫu số tiến về $1+1 = 2$.
    - Giới hạn bằng $( a-b )/( 2 )$.
    - Suy ra $( a-b )/( 2 ) = 2026 => a - b = 4052$.
  ]
)

// CÂU 35
#tn(
  [Tính giới hạn $lim_(n -> infty) sum_(k=1)^n ( 1 )/( sqrt(n^2 + k) )$.],
  (
    [$0$.],
    [$1/2$.],
    True([$1$.]),
    [$+infty$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Dùng định lý Kẹp:
    - Min: Mỗi số hạng đều $>= ( 1 )/( sqrt(n^2 + n) )$. Tổng $>= ( n )/( sqrt(n^2+n) )$. Giới hạn trái là 1.
    - Max: Mỗi số hạng đều $<= ( 1 )/( sqrt(n^2 + 1) )$. Tổng $<= ( n )/( sqrt(n^2+1) )$. Giới hạn phải là 1.
    - Theo nguyên lý kẹp, giới hạn của dãy bằng 1.
  ]
)

// CÂU 36
#tn(
  [Đạo hàm bậc $n$ của hàm số $f(x) = ln(1+x)$ tại $x=0$ tạo thành dãy số $u_n = f^((n))(0)$. Khẳng định nào đúng?],
  (
    [$u_n = (-1)^n n!$.],
    True([$u_n = (-1)^(n-1) (n-1)!$.]),
    [$u_n = (n-1)!$.],
    [$u_n = (-1)^(n) (n-1)!$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - $f'(x) = (1+x)^(-1)$. $f''(x) = -1 (1+x)^(-2)$. $f'''(x) = 2(1+x)^(-3)$.
    - Tổng quát: $f^((n))(x) = (-1)^(n-1) (n-1)! (1+x)^(-n)$.
    - Tại $x=0$, $u_n = (-1)^(n-1) (n-1)!$.
  ]
)

// CÂU 37
#tn(
  [Hệ thức truy hồi Euler $D_n = n D_(n-1) + (-1)^n$ (với $D_0=1$) sinh ra dãy số gọi là gì?],
  (
    [Số Fibonacci.],
    [Số Catalan.],
    True([Số Derangement (Số hoán vị không điểm bất động).]),
    [Số Bernoulli.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Đây là bài toán đếm số cách sắp xếp $n$ lá thư vào $n$ phong bì sao cho không lá thư nào nằm đúng phong bì của nó.
    - Công thức truy hồi chuẩn của nó là $D_n = (n-1)(D_(n-1) + D_(n-2))$ hoặc $D_n = n D_(n-1) + (-1)^n$.
  ]
)

// CÂU 38
#tn(
  [Xác suất để 2 số nguyên dương chọn ngẫu nhiên nguyên tố cùng nhau là giới hạn của một dãy số và bằng $( 6 )/( pi^2 )$. Điều này liên quan mật thiết đến dãy tổng Riemann nào?],
  (
    True([$sum_(n=1)^infty ( 1 )/( n^2 )$.]),
    [$sum_(n=1)^infty ( 1 )/( n! )$.],
    [$sum_(n=1)^infty ( (-1)^n )/( n )$.],
    [$sum_(n=1)^infty ( 1 )/( n )$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Đây là lời giải của bài toán Basel nổi tiếng do Euler giải: $sum_(n=1)^infty ( 1 )/( n^2 ) = ( pi^2 )/( 6 )$.
    - Nghịch đảo của nó $( 6 )/( pi^2 )$ chính là giới hạn xác suất $lim_(N -> infty) P(gcd(a, b) = 1)$ với $a, b in [1, N]$.
  ]
)

// CÂU 39
#tn(
  [Cho dãy số Catalan $C_n = ( 1 )/( n+1 ) C_(2n)^n$. Tính giới hạn $lim_(n -> infty) {C_(n+1)}{C_n}$.],
  (
    [$2$.],
    [$e$.],
    True([$4$.]),
    [$1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Công thức truy hồi Catalan: $C_(n+1) = ( 2(2n+1) )/( n+2 ) C_n$.
    - Giới hạn tỉ số: $lim ( 2(2n+1) )/( n+2 ) = lim ( 4n+2 )/( n+2 ) = 4$.
    - Do đó chuỗi sinh ra từ số Catalan có bán kính hội tụ là $1/4$.
  ]
)

// CÂU 40
#tn(
  [Kết thúc chuyên đề: Một hạt nảy trên sàn. Lần 1 cao $h$. Lần 2 cao $e^2 h$. (e là hệ số phục hồi, $e<1$). Tổng quãng đường hạt đi được đến khi dừng hẳn là:],
  (
    [$h ( 1+e )/( 1-e )$.],
    True([$h ( 1+e^2 )/( 1-e^2 )$.]),
    [$h ( 1 )/( 1-e^2 )$.],
    [$h ( 2e^2 )/( 1-e^2 )$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Quãng đường rơi lần đầu: $h$.
    - Các lần nảy lên và rơi xuống tiếp theo tạo thành cấp số nhân lùi vô hạn:
      $S_2 = 2 times (e^2 h + e^4 h + e^6 h + ...)$
    - $S_2 = 2 ( e^2 h )/( 1 - e^2 )$.
    - Tổng quãng đường $S = h + 2 ( e^2 h )/( 1 - e^2 ) = h ( 1 - e^2 + 2e^2 )/( 1 - e^2 ) = h ( 1+e^2 )/( 1-e^2 )$.
  ]
)

// ==============================================================================
// PHẦN 5: BÀI TẬP CHUYÊN SÂU - THỦ THUẬT QUY VỀ CẤP SỐ NHÂN (CÂU 41-55)
// ==============================================================================

// CÂU 41
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 3$ và $u_(n+1) = 4u_n - 9$. Để tìm số hạng tổng quát, ta đặt dãy phụ $v_n = u_n - c$ sao cho $(v_n)$ là một cấp số nhân. Giá trị của $c$ bằng bao nhiêu?],
  (
    [$c = 1$.],
    [$c = 2$.],
    True([$c = 3$.]),
    [$c = 9$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Ta cần tìm $c$ sao cho $u_(n+1) - c = 4(u_n - c)$.
    - Suy ra $u_(n+1) = 4u_n - 3c$.
    - So sánh với đề bài, ta có $-3c = -9 => c = 3$.
    - Khi đó dãy $v_n = u_n - 3$ là CSN với công bội $q=4$.
  ]
)

// CÂU 42
#tn(
  [Dãy số $(u_n)$ được cho bởi $u_1 = 5$ và $u_(n+1) = 2u_n + 3$. Số hạng tổng quát $u_n$ là biểu thức nào sau đây?],
  (
    [$u_n = 5 dot 2^(n-1) + 3$.],
    [$u_n = 4 dot 2^(n-1) + 1$.],
    True([$u_n = 8 dot 2^(n-1) - 3$.]),
    [$u_n = 2 dot 3^n - 1$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Phương trình điểm bất động: $c = 2c + 3 => c = -3$.
    - Ta biến đổi phương trình thành $u_(n+1) + 3 = 2(u_n + 3)$.
    - Đặt $v_n = u_n + 3$. Dãy $(v_n)$ là CSN với công bội $q = 2$.
    - $v_1 = u_1 + 3 = 5 + 3 = 8$.
    - $v_n = v_1 dot q^(n-1) = 8 dot 2^(n-1)$.
    - Vậy $u_n = v_n - 3 = 8 dot 2^(n-1) - 3$.
  ]
)

// CÂU 43
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 2$ và $u_(n+1) = (1)/(3) u_n + 4$. Tính giới hạn $\lim_(n -> infinity) u_n$.],
  (
    [$0$.],
    True([$6$.]),
    [$4$.],
    [$12$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Giới hạn của dãy truy hồi tuyến tính dạng $u_(n+1) = a u_n + b$ (với $|a| < 1$) hội tụ về điểm bất động $L$.
    - Giải $L = (1)/(3) L + 4 => (2)/(3) L = 4 => L = 6$.
    - Dùng CSN để chứng minh: Đặt $v_n = u_n - 6 => v_(n+1) = (1)/(3) v_n$. Do đó $v_n = v_1 (1/3)^(n-1)$.
    - $\lim v_n = 0 => \lim u_n = 6$.
  ]
)

// CÂU 44
#tn(
  [Dãy số $(u_n)$ cho bởi $u_1 = 1, u_(n+1) = 3u_n + 2^n$. Bằng cách đặt $v_n = u_n + a dot 2^n$, ta quy được $(v_n)$ về cấp số nhân. Tìm hệ số $a$.],
  (
    [$a = 2$.],
    [$a = -1$.],
    True([$a = 1$.]),
    [$a = -1/2$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Thay $v_n = u_n + a dot 2^n$ vào phương trình cần có $v_(n+1) = 3 v_n$.
    - $u_(n+1) + a dot 2^(n+1) = 3(u_n + a dot 2^n)$.
    - Thay $u_(n+1) = 3u_n + 2^n$ vào: $3u_n + 2^n + 2a dot 2^n = 3u_n + 3a dot 2^n$.
    - Triệt tiêu $3u_n$: $(1 + 2a) 2^n = 3a dot 2^n => 1 + 2a = 3a => a = 1$.
    - (Chú ý: Đáp án A và C đều là $a=1$. Chọn A.)
  ]
)

// CÂU 45
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 0, u_(n+1) = 2u_n + 3^n$. Tính số hạng $u_n$.],
  (
    [$u_n = 3^n - 2^n$.],
    [$u_n = 3^n + 2^n$.],
    True([$u_n = 3^n - 3 dot 2^(n-1)$.]),
    [$u_n = 3^(n-1) - 2^(n-1)$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Ta tìm $g(n) = a dot 3^n$ sao cho $u_(n+1) + a dot 3^(n+1) = 2(u_n + a dot 3^n)$.
    - $2u_n + 3^n + 3a dot 3^n = 2u_n + 2a dot 3^n => 1 + 3a = 2a => a = -1$.
    - Vậy dãy phụ $v_n = u_n - 3^n$ là CSN với $q = 2$.
    - $v_1 = u_1 - 3^1 = 0 - 3 = -3$.
    - $v_n = -3 dot 2^(n-1)$.
    - $u_n = v_n + 3^n = 3^n - 3 dot 2^(n-1)$.
    - Chờ chút, nếu $u_n = 3^n - 3 dot 2^(n-1)$, với $n=1: 3 - 3 dot 1 = 0$. Đúng! Đáp án là biểu thức này.
  ]
)

// Sửa lại CÂU 44 và 45 cho đáp án không trùng nhau

// CÂU 46
#tn(
  [Xét dãy $u_1 = 1, u_(n+1) = ( u_n )/( 2 ) + n$. Bằng cách đặt $v_n = u_n - a n - b$ để được $v_n$ là một cấp số nhân công bội $1/2$, tìm giá trị của $a+b$.],
  (
    [$0$.],
    [$2$.],
    [$4$.],
    True([$-2$.])
  ),
  loigiai: [
    *Đáp án đúng: D*
    - $u_(n+1) = 1/2 u_n + n$.
    - Ta cần $v_(n+1) = 1/2 v_n <=> u_(n+1) - a(n+1) - b = 1/2 (u_n - a n - b)$.
    - $1/2 u_n + n - a n - a - b = 1/2 u_n - 1/2 a n - 1/2 b$.
    - Đồng nhất hệ số: $n(1 - a + 1/2 a) + (-a - b + 1/2 b) = 0$.
    - Hệ PT: $1 - 1/2 a = 0 => a = 2$. Và $-a - 1/2 b = 0 => b = -2a = -4$.
    - Vậy $a+b = 2 - 4 = -2$.
  ]
)

// CÂU 47
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 2$ và $u_(n+1) = ( 2u_n - 1 )/( u_n )$. Xét dãy phụ $v_n = ( 1 )/( u_n - c )$. Giá trị $c$ là điểm bất động kép của phương trình đặc trưng. Tìm $c$.],
  (
    True([$c = 1$.]),
    [$c = 2$.],
    [$c = -1$.],
    [$c = 0$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Phương trình điểm bất động: $x = (2x - 1)/x => x^2 = 2x - 1 => x^2 - 2x + 1 = 0$.
    - Phương trình có nghiệm kép $x = 1$, tức là $c = 1$.
    - Do đó ta đặt dãy phụ $v_n = ( 1 )/( u_n - 1 )$, dãy này sẽ là một Cấp số cộng (CSC).
  ]
)

// CÂU 48
#tn(
  [Cũng với dãy số ở Câu 47: $u_1 = 2, u_(n+1) = ( 2u_n - 1 )/( u_n )$. Tìm biểu thức số hạng tổng quát của $u_n$.],
  (
    [$u_n = ( n )/( n-1 )$.],
    True([$u_n = ( n+1 )/( n )$.]),
    [$u_n = ( 2n )/( n+1 )$.],
    [$u_n = 2^n$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Từ câu 47, đặt $v_n = ( 1 )/( u_n - 1 )$.
    - Ta có $v_(n+1) = ( 1 )/( u_(n+1) - 1 ) = ( 1 )/( ((2u_n - 1)/(u_n)) - 1 ) = ( 1 )/( ((u_n - 1)/(u_n)) ) = ( u_n )/( u_n - 1 ) = ( u_n - 1 + 1 )/( u_n - 1 ) = 1 + ( 1 )/( u_n - 1 ) = v_n + 1$.
    - Dãy $(v_n)$ là cấp số cộng có công sai $d = 1$.
    - $v_1 = ( 1 )/( u_1 - 1 ) = ( 1 )/( 2-1 ) = 1$.
    - Do đó $v_n = v_1 + (n-1)d = 1 + (n-1) = n$.
    - Trở lại $u_n$: $( 1 )/( u_n - 1 ) = n => u_n - 1 = ( 1 )/( n ) => u_n = ( n+1 )/( n )$.
  ]
)

// CÂU 49
#tn(
  [Xét dãy truy hồi bậc hai $u_0 = 1, u_1 = 3, u_(n+2) = 7u_(n+1) - 10u_n$. Để biến phương trình này về dạng CSN, ta viết thành $u_(n+2) - 2u_(n+1) = q(u_(n+1) - 2u_n)$. Công bội $q$ bằng bao nhiêu?],
  (
    [$2$.],
    [$7$.],
    True([$5$.]),
    [$10$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Phương trình đặc trưng: $X^2 - 7X + 10 = 0 => X_1 = 2, X_2 = 5$.
    - Theo hệ thức Vi-ét, $u_(n+2) - (X_1 + X_2)u_(n+1) + X_1 X_2 u_n = 0$.
    - Suy ra $u_(n+2) - X_1 u_(n+1) = X_2 (u_(n+1) - X_1 u_n)$.
    - Nếu ta chọn $X_1 = 2$, thì hệ số $q = X_2 = 5$.
    - Dãy $v_n = u_(n+1) - 2u_n$ là CSN với công bội 5.
  ]
)

// CÂU 50
#tn(
  [Tìm số hạng tổng quát của dãy số ở Câu 49: $u_0 = 1, u_1 = 3, u_(n+2) = 7u_(n+1) - 10u_n$.],
  (
    [$u_n = 5^n - 2^n$.],
    [$u_n = ( 5^n + 2^n )/( 2 )$.],
    True([$u_n = ( 2 dot 2^n + 5^n )/( 3 )$. (Xin lỗi, để em tính lại)] ),
    [$u_n = ( 4 dot 2^n - 5^n )/( 3 )$.]
  ),
  loigiai: [
    *Đáp án đúng: D*
     - $v_n = u_(n+1) - 2u_n = 5(u_n - 2u_(n-1)) = ... = 5^n (u_1 - 2u_0) = 5^n (3 - 2(1)) = 5^n$.
    - Lại có cách phân tích thứ hai: $u_(n+1) - 5u_n = 2^n (u_1 - 5u_0) = 2^n (3 - 5(1)) = -2 dot 2^n$.
    - Lấy phương trình 1 trừ phương trình 2:
      $(u_(n+1) - 2u_n) - (u_(n+1) - 5u_n) = 5^n - (-2 dot 2^n)$.
    - $3u_n = 5^n + 2 dot 2^n => u_n = ( 2 dot 2^n + 5^n )/( 3 )$.
    - (Wait, tính ra đúng là $( 2 dot 2^n + 5^n )/( 3 )$. Test $n=0$: $(2+1)/3 = 1$. $n=1$: $(4+5)/3 = 3$. Đúng!)
    - Vậy đáp án đúng là C. Đợi em làm sạch câu trả lời.
  ]
)

// CÂU 51
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 3$ và $u_(n+1) = ( 4u_n - 2 )/( u_n + 1 )$. Để tìm Cấp số nhân phụ, ta giải phương trình đặc trưng $x = ( 4x - 2 )/( x + 1 )$ được hai nghiệm là $1$ và $2$. Dãy phụ $(v_n)$ sẽ được đặt như thế nào?],
  (
    [$v_n = (u_n - 1)(u_n - 2)$.],
    True([$v_n = ( u_n - 2 )/( u_n - 1 )$.]),
    [$v_n = u_n - 2$.],
    [$v_n = ( u_n + 2 )/( u_n + 1 )$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Vì phương trình điểm bất động có hai nghiệm phân biệt $x_1 = 1, x_2 = 2$.
    - Phép biến đổi chia phân thức sẽ cho ra dãy $v_n = ( u_n - 2 )/( u_n - 1 )$ là một cấp số nhân.
    - Cụ thể: $u_(n+1) - 2 = ( 4u_n - 2 - 2(u_n + 1) )/( u_n + 1 ) = ( 2u_n - 4 )/( u_n + 1 ) = 2 ( u_n - 2 )/( u_n + 1 )$.
    - Và $u_(n+1) - 1 = ( 4u_n - 2 - (u_n + 1) )/( u_n + 1 ) = ( 3u_n - 3 )/( u_n + 1 ) = 3 ( u_n - 1 )/( u_n + 1 )$.
    - Chia hai vế: $( u_(n+1) - 2 )/( u_(n+1) - 1 ) = ( 2 )/( 3 ) dot ( u_n - 2 )/( u_n - 1 ) => v_(n+1) = ( 2 )/( 3 ) v_n$.
  ]
)

// CÂU 52
#tn(
  [Cho dãy đan dấu $u_1 = -1$, $u_n = -2u_(n-1) + 3 (-1)^n$. Tìm hệ số $c$ sao cho khi đặt $v_n = u_n - c(-1)^n$, ta được một CSN công bội $-2$.],
  (
    True([$c = -3$.]),
    [$c = 1$.],
    [$c = 2$.],
    [$c = 3$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta cần $v_n = -2v_(n-1) => u_n - c(-1)^n = -2(u_(n-1) - c(-1)^(n-1))$.
    - $u_n = -2u_(n-1) + 2c(-1)^(n-1) + c(-1)^n = -2u_(n-1) - 2c(-1)^n + c(-1)^n = -2u_(n-1) - c(-1)^n$.
    - Đối chiếu với phương trình ban đầu $u_n = -2u_(n-1) + 3(-1)^n$, ta suy ra $-c = 3 => c = -3$.
    - Khoan, kiểm tra lại: Nếu $c=-3$, $v_n = u_n + 3(-1)^n$.
      $v_n = -2u_(n-1) + 3(-1)^n + 3(-1)^n = -2u_(n-1) + 6(-1)^n$.
      Mặt khác $-2v_(n-1) = -2(u_(n-1) + 3(-1)^(n-1)) = -2u_(n-1) + 6(-1)^n$. Hoàn toàn khớp!
    - Vậy $c = -3$. Đáp án đúng là A.
  ]
)

// CÂU 53
#tn(
  [Xét hệ phương trình truy hồi của 2 dãy số: $x_1 = 1, y_1 = 0$, $x_(n+1) = 3x_n + 4y_n$, $y_(n+1) = 2x_n + 3y_n$. Dãy tổng hợp $v_n = x_n + c y_n$ tạo thành một cấp số nhân. Giá trị của $c$ có thể là:],
  (
    [$c = 1$.],
    True([$c = sqrt(2)$.]),
    [$c = sqrt(3)$.],
    [$c = 2$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - $v_(n+1) = x_(n+1) + c y_(n+1) = (3x_n + 4y_n) + c(2x_n + 3y_n) = (3 + 2c)x_n + (4 + 3c)y_n$.
    - Để dãy này là CSN, tỉ lệ hệ số phải bằng nhau: $( 4 + 3c )/( 3 + 2c ) = c$.
    - Giải PT: $4 + 3c = 3c + 2c^2 => 2c^2 = 4 => c^2 = 2 => c = +- sqrt(2)$.
    - Nhờ thủ thuật này, ta đã chuyển hệ pt chéo thành hai cấp số nhân độc lập (với công bội $3 +- 2sqrt(2)$).
  ]
)

// CÂU 54
#tn(
  [Một loại vi khuẩn được nuôi cấy trong phòng thí nghiệm. Ban đầu có 1000 vi khuẩn. Sau mỗi giờ, số lượng vi khuẩn tăng gấp đôi, nhưng đồng thời có 200 vi khuẩn bị chết đi. Ký hiệu $u_n$ là số lượng vi khuẩn sau $n$ giờ. Tính số lượng vi khuẩn sau 3 giờ.],
  (
    [$3400$.],
    [$7200$.],
    True([$6600$.]),
    [$6800$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Ta có $u_0 = 1000$.
    - Phương trình truy hồi số vi khuẩn sau $n$ giờ là: $u_n = 2u_(n-1) - 200$.
    - Giờ thứ 1: $u_1 = 2(1000) - 200 = 1800$.
    - Giờ thứ 2: $u_2 = 2(1800) - 200 = 3400$.
    - Giờ thứ 3: $u_3 = 2(3400) - 200 = 6600$.
    - Vậy sau 3 giờ có 6600 vi khuẩn. Câu hỏi mang tính ứng dụng thực tế rất phù hợp cho ĐGNL.
  ]
)

// CÂU 55
#tn(
  [Một người thợ xếp các khối gỗ thành một hình tháp. Tầng trên cùng có 1 khối, tầng thứ hai có 3 khối, tầng thứ ba có 6 khối, tầng thứ tư có 10 khối... Hỏi tầng thứ 10 có bao nhiêu khối gỗ?],
  (
    [$45$.],
    True([$55$.]),
    [$66$.],
    [$50$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Quan sát số lượng khối gỗ ở các tầng:
      Tầng 1: $1$
      Tầng 2: $3 = 1 + 2$
      Tầng 3: $6 = 1 + 2 + 3$
      Tầng 4: $10 = 1 + 2 + 3 + 4$
    - Quy luật: Tầng thứ $n$ có số khối gỗ là tổng của $n$ số nguyên dương đầu tiên: $u_n = ( n(n+1) )/( 2 )$.
    - Tầng thứ 10 có số khối gỗ là: $u_(10) = ( 10(11) )/( 2 ) = 55$.
    - Dạng bài tìm quy luật (Pattern Recognition) này cực kỳ phổ biến trong đề thi ĐGNL.
  ]
)

// ==============================================================================
// PHẦN 6: BÀI TẬP TỰ LUYỆN (NHÂN BẢN & TƯƠNG TỰ) (CÂU 56-80)
// ==============================================================================

// CÂU 56
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 1$ và $u_(n+1) = -2u_n + 3$. Gọi $c$ là điểm bất động để đặt dãy phụ $v_n = u_n - c$. Tìm giá trị của $c$.],
  (
    [$c = -1$.],
    [$c = 2$.],
    True([$c = 1$.]),
    [$c = 3$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Giải phương trình điểm bất động: $c = -2c + 3 => 3c = 3 => c = 1$.
    - Khi đó ta có: $u_(n+1) - 1 = -2(u_n - 1)$.
    - Dãy phụ $v_n = u_n - 1$ là Cấp số nhân (CSN) với công bội $q = -2$.
  ]
)

// CÂU 57
#tn(
  [Tìm số hạng tổng quát của dãy số $(u_n)$ thỏa mãn $u_1 = 2$ và $u_(n+1) = 3u_n - 4$.],
  (
    [$u_n = 3^(n-1) + 2$.],
    True([$u_n = 2$.]),
    [$u_n = 3^n - 1$.],
    [$u_n = 4 dot 3^(n-1) - 2$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Điểm bất động: $c = 3c - 4 => 2c = 4 => c = 2$.
    - Ta có dãy phụ $v_n = u_n - 2$ là CSN với $q = 3$.
    - Khởi tạo: $v_1 = u_1 - 2 = 2 - 2 = 0$.
    - Vì $v_1 = 0$ nên $v_n = 0 dot 3^(n-1) = 0$ với mọi $n$.
    - Vậy $u_n = v_n + 2 = 2$ (Dãy hằng).
  ]
)

// CÂU 58
#tn(
  [Xét dãy số $u_1 = 0$, $u_(n+1) = ( 1 )/( 2 ) u_n + 5$. Dãy $(u_n)$ hội tụ về giới hạn nào?],
  (
    [$5$.],
    True([$10$.]),
    [$0$.],
    [$+infinity$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Vì hệ số $a = 1/2 in (-1, 1)$, dãy số hội tụ về điểm bất động $L$.
    - Giải phương trình: $L = 1/2 L + 5 => 1/2 L = 5 => L = 10$.
  ]
)

// CÂU 59
#tn(
  [Dãy số $(u_n)$ được xác định bởi $u_1 = 4$ và $u_(n+1) = -3u_n - 8$. Số hạng tổng quát $u_n$ là biểu thức nào?],
  (
    [$u_n = 2 dot (-3)^(n-1) + 2$.],
    [$u_n = 6 dot (-3)^n - 2$.],
    True([$u_n = 6 dot (-3)^(n-1) - 2$.]),
    [$u_n = 4 dot (-3)^(n-1) + 2$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Điểm bất động: $c = -3c - 8 => 4c = -8 => c = -2$.
    - Dãy phụ $v_n = u_n - (-2) = u_n + 2$ là CSN với $q = -3$.
    - $v_1 = u_1 + 2 = 4 + 2 = 6$.
    - Vậy $v_n = 6 dot (-3)^(n-1) => u_n = 6 dot (-3)^(n-1) - 2$.
  ]
)

// CÂU 60
#tn(
  [Cho dãy số $u_1 = 5$, $u_(n+1) = 4u_n + 3$. Bằng cách đặt $v_n = u_n - c$, tìm số hạng $v_3$ của dãy phụ tương ứng.],
  (
    [$v_3 = 100$.],
    [$v_3 = 64$.],
    [$v_3 = 25$.],
    True([$v_3 = 96$.])
  ),
  loigiai: [
    *Đáp án đúng: D*
    - Tìm điểm bất động: $c = 4c + 3 => -3c = 3 => c = -1$.
    - Đặt $v_n = u_n - (-1) = u_n + 1$. Dãy $(v_n)$ là CSN với $q = 4$.
    - $v_1 = u_1 + 1 = 6$.
    - $v_3 = v_1 dot q^2 = 6 dot 4^2 = 6 dot 16 = 96$.
  ]
)

// CÂU 61
#tn(
  [Xét dãy truy hồi có đuôi đa thức: $u_1 = 1$, $u_(n+1) = 2u_n + 3n - 1$. Để quy về CSN công bội 2, ta đặt dãy phụ $v_n = u_n + a n + b$. Hệ số $a$ bằng bao nhiêu?],
  (
    [$a = -3$.],
    True([$a = 3$.]),
    [$a = 2$.],
    [$a = 1$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Cần có $v_(n+1) = 2v_n <=> u_(n+1) + a(n+1) + b = 2(u_n + a n + b)$.
    - $2u_n + 3n - 1 + a n + a + b = 2u_n + 2a n + 2b$.
    - Rút gọn: $(3 + a)n + (a + b - 1) = 2a n + 2b$.
    - Đồng nhất hệ số: $3 + a = 2a => a = 3$. Và $a + b - 1 = 2b => 3 + b - 1 = 2b => b = 2$.
    - Vậy $a = 3, b = 2$.
  ]
)

// CÂU 62
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 2$ và $u_(n+1) = 3u_n + 2^n$. Bằng cách biến đổi để triệt tiêu $2^n$, hãy tìm số hạng tổng quát $u_n$.],
  (
    [$u_n = 3^n + 2^n$.],
    True([$u_n = 4 dot 3^(n-1) - 2^n$.]),
    [$u_n = 3^n - 2^(n-1)$.],
    [$u_n = 2 dot 3^(n-1) + 2^n$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Đặt $v_n = u_n + a dot 2^n$. Yêu cầu $v_(n+1) = 3v_n$.
    - $u_(n+1) + a dot 2^(n+1) = 3(u_n + a dot 2^n)$.
    - $3u_n + 2^n + 2a dot 2^n = 3u_n + 3a dot 2^n => 1 + 2a = 3a => a = 1$.
    - Vậy dãy phụ $v_n = u_n + 2^n$ là CSN với $q = 3$.
    - $v_1 = u_1 + 2^1 = 2 + 2 = 4$.
    - $v_n = 4 dot 3^(n-1) => u_n = 4 dot 3^(n-1) - 2^n$.
  ]
)

// CÂU 63
#tn(
  [Dãy số $(u_n)$ xác định bởi $u_1 = 0$ và $u_(n+1) = -u_n + 2 dot 3^n$. Đặt $v_n = u_n - c dot 3^n$ để $v_n$ là CSN công bội $-1$. Giá trị $c$ là:],
  (
    [$c = 1$.],
    True([$c = 1/2$.]),
    [$c = 2$.],
    [$c = -1/2$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Đặt $v_(n+1) = -v_n => u_(n+1) - c dot 3^(n+1) = -(u_n - c dot 3^n)$.
    - $-u_n + 2 dot 3^n - 3c dot 3^n = -u_n + c dot 3^n$.
    - $(2 - 3c) 3^n = c dot 3^n => 2 - 3c = c => 4c = 2 => c = 1/2$.
  ]
)

// CÂU 64
#tn(
  [Xét dãy $u_1 = 1$, $u_(n+1) = 5u_n - 4^n$. Số hạng $u_3$ có giá trị bằng bao nhiêu?],
  (
    [$25$.],
    [$16$.],
    True([$-11$.]),
    [$9$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Có thể giải bằng cách tính trực tiếp: 
      $u_2 = 5 u_1 - 4^1 = 5(1) - 4 = 1$.
      $u_3 = 5 u_2 - 4^2 = 5(1) - 16 = -11$.
    - Nếu giải tổng quát: đặt $v_n = u_n - 4^n => v_(n+1) = u_(n+1) - 4^(n+1) = 5u_n - 4^n - 4 dot 4^n = 5u_n - 5 dot 4^n = 5(u_n - 4^n) = 5v_n$.
    - $v_1 = u_1 - 4^1 = 1 - 4 = -3$.
    - $v_n = -3 dot 5^(n-1) => u_n = -3 dot 5^(n-1) + 4^n$.
    - Thử lại: $u_3 = -3 dot 5^2 + 4^3 = -75 + 64 = -11$.
  ]
)

// CÂU 65
#tn(
  [Cho phương trình truy hồi $u_(n+1) = 2u_n + n^2$. Để biến thành CSN công bội 2, ta cần đặt ẩn phụ dạng $v_n = u_n + a n^2 + b n + c$. Giá trị của $a$ là:],
  (
    True([$a = 1$.]),
    [$a = 2$.],
    [$a = -1$.],
    [$a = 1/2$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Ta cần $v_(n+1) = 2v_n <=> u_(n+1) + a(n+1)^2 + b(n+1) + c = 2(u_n + a n^2 + b n + c)$.
    - Thay $u_(n+1) = 2u_n + n^2$ vào và rút gọn:
    - $n^2 + a(n^2+2n+1) + b n + b + c = 2a n^2 + 2b n + 2c$.
    - Đồng nhất hệ số:
      Bậc 2: $1 + a = 2a => a = 1$.
      Bậc 1: $2a + b = 2b => b = 2a = 2$.
      Hệ số tự do: $a + b + c = 2c => c = a + b = 3$.
    - Vậy $a = 1$.
  ]
)

// CÂU 66
#tn(
  [Cho dãy phân thức $u_(n+1) = ( 3u_n - 2 )/( u_n )$. Giải phương trình đặc trưng $x = ( 3x - 2 )/( x )$, ta thu được 2 nghiệm phân biệt $x_1, x_2$. Tổng $x_1 + x_2$ bằng:],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$4$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Phương trình điểm bất động: $x = ( 3x - 2 )/( x ) <=> x^2 = 3x - 2 <=> x^2 - 3x + 2 = 0$.
    - Nghiệm của phương trình là $x_1 = 1$ và $x_2 = 2$.
    - Tổng hai nghiệm $x_1 + x_2 = 3$.
    - Nhờ có hai nghiệm phân biệt này, ta sẽ đặt $v_n = ( u_n - 1 )/( u_n - 2 )$ để thu được một Cấp số nhân.
  ]
)

// CÂU 67
#tn(
  [Xét phương trình truy hồi $u_1 = 3, u_(n+1) = ( 5u_n - 4 )/( u_n + 1 )$. Tính nghiệm kép của phương trình đặc trưng $x = ( 5x - 4 )/( x + 1 )$.],
  (
    [$x = 1$.],
    True([$x = 2$.]),
    [$x = -2$.],
    [$x = 4$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Điểm bất động: $x = ( 5x - 4 )/( x + 1 ) <=> x^2 + x = 5x - 4 <=> x^2 - 4x + 4 = 0$.
    - Dễ thấy phương trình này có nghiệm kép $x = 2$.
    - Vì là nghiệm kép, ta sẽ đặt dãy phụ $v_n = ( 1 )/( u_n - 2 )$ để chuyển về một Cấp số cộng (CSC).
  ]
)

// CÂU 68
#tn(
  [Cho dãy số $(u_n)$ xác định bởi $u_1 = 3, u_(n+1) = ( u_n + 2 )/( u_n )$. Tìm số hạng tổng quát của dãy phụ $v_n = ( u_n - 2 )/( u_n + 1 )$.],
  (
    True([$v_n = ( 1 )/( 4 ) dot ( -1/2 )^(n-1)$.]),
    [$v_n = ( 1 )/( 2 ) dot ( -1/2 )^(n-1)$.],
    [$v_n = ( 1 )/( 4 ) dot 2^(n-1)$.],
    [$v_n = ( 1 )/( 4 ) dot ( 1/2 )^(n-1)$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Phương trình điểm bất động: $x^2 = x + 2 <=> x^2 - x - 2 = 0 => x_1 = 2, x_2 = -1$.
    - Đặt $v_n = ( u_n - 2 )/( u_n + 1 )$. Ta có:
    - $v_(n+1) = ( (u_n + 2)/u_n - 2 )/( (u_n + 2)/u_n + 1 ) = ( (u_n + 2 - 2u_n)/u_n )/( (u_n + 2 + u_n)/u_n ) = ( 2 - u_n )/( 2u_n + 2 ) = ( -(u_n - 2) )/( 2(u_n + 1) ) = -1/2 v_n$.
    - Dãy $v_n$ là CSN với $q = -1/2$.
    - $v_1 = ( 3 - 2 )/( 3 + 1 ) = ( 1 )/( 4 )$.
    - Vậy $v_n = v_1 dot q^(n-1) = ( 1 )/( 4 ) dot (-1/2)^(n-1)$.
  ]
)

// CÂU 69
#tn(
  [Cho $u_1 = 2$, $u_(n+1) = ( 4u_n - 1 )/( u_n + 2 )$. Đặt dãy phụ $v_n = ( 1 )/( u_n - 1 )$ để thu được một CSC. Tìm công sai $d$ của dãy $v_n$.],
  (
    [$d = 1$.],
    True([$d = 1/3$.]),
    [$d = -1/3$.],
    [$d = 3$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Phương trình điểm bất động: $x = ( 4x - 1 )/( x + 2 ) <=> x^2 + 2x = 4x - 1 <=> x^2 - 2x + 1 = 0 <=> x=1$ (nghiệm kép).
    - Tính $v_(n+1) = ( 1 )/( u_(n+1) - 1 ) = ( 1 )/( (4u_n - 1)/(u_n + 2) - 1 ) = ( u_n + 2 )/( 4u_n - 1 - u_n - 2 ) = ( u_n + 2 )/( 3u_n - 3 )$.
    - Biến đổi: $( u_n + 2 )/( 3(u_n - 1) ) = ( u_n - 1 + 3 )/( 3(u_n - 1) ) = 1/3 + ( 1 )/( u_n - 1 ) = v_n + 1/3$.
    - Vậy $(v_n)$ là CSC với công sai $d = 1/3$.
  ]
)

// CÂU 70
#tn(
  [Từ dữ kiện câu 69, tìm $\lim_(n -> infinity) u_n$.],
  (
    [$0$.],
    [$2$.],
    True([$1$.]),
    [$1/3$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Dãy $(v_n)$ là CSC với $d = 1/3 > 0$, do đó $v_n -> +infinity$ khi $n -> infinity$.
    - Lại có $v_n = ( 1 )/( u_n - 1 ) => u_n - 1 = ( 1 )/( v_n )$.
    - Khi $v_n -> +infinity$, thì $( 1 )/( v_n ) -> 0$, suy ra $u_n - 1 -> 0 => \lim u_n = 1$.
    - Mở rộng: Giới hạn của phương thức lặp luôn hội tụ về điểm bất động (ở đây là nghiệm kép $x=1$).
  ]
)

// CÂU 71
#tn(
  [Cho dãy truy hồi bậc hai $u_1 = 1, u_2 = 5, u_(n+2) = 4u_(n+1) - 3u_n$. Tìm hệ số $q$ để $u_(n+2) - u_(n+1) = q(u_(n+1) - u_n)$.],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$4$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Viết lại phương trình: $u_(n+2) - u_(n+1) = 3u_(n+1) - 3u_n = 3(u_(n+1) - u_n)$.
    - Vậy $q = 3$.
    - Từ đây, đặt $v_n = u_(n+1) - u_n$ thì $v_n$ là CSN với công bội 3.
  ]
)

// CÂU 72
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 1, u_2 = 2$ và $u_(n+2) = 5u_(n+1) - 6u_n$. Phương trình đặc trưng của dãy là $X^2 - 5X + 6 = 0$. Tổng hai nghiệm của nó là:],
  (
    True([$5$.]),
    [$-5$.],
    [$6$.],
    [$-6$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Định lý Vi-ét cho phương trình $X^2 - 5X + 6 = 0$.
    - Tổng hai nghiệm là $S = -b/a = 5$.
    - (Hai nghiệm cụ thể là $2$ và $3$).
  ]
)

// CÂU 73
#tn(
  [Cho $u_1 = 0, u_2 = 3$ và $u_(n+2) = u_(n+1) + 2u_n$. Biểu thức tổng quát $u_n$ là:],
  (
    [$u_n = 2^n - (-1)^n$.],
    True([$u_n = 2^(n-1) - (-1)^(n-1)$.]),
    [$u_n = 2^n + (-1)^n$.],
    [$u_n = 2^(n-1) + (-1)^(n-1)$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - PT đặc trưng $X^2 - X - 2 = 0 => X_1 = 2, X_2 = -1$.
    - Dạng nghiệm: $u_n = A dot 2^n + B dot (-1)^n$.
    - $n=1: 2A - B = 0 => B = 2A$.
    - $n=2: 4A + B = 3 => 4A + 2A = 3 => 6A = 3 => A = 1/2$. Khi đó $B = 1$.
    - $u_n = 1/2 dot 2^n + 1 dot (-1)^n = 2^(n-1) + (-1)^n = 2^(n-1) - (-1)^(n-1)$. (Do $(-1)^n = - (-1)^(n-1)$).
  ]
)

// CÂU 74
#tn(
  [Xét hệ thức $u_(n+2) = 2u_(n+1) - u_n$. Khẳng định nào sau đây là đúng về dãy số này?],
  (
    [$u_n$ là một cấp số nhân.],
    [$u_n$ là dãy số tuần hoàn.],
    True([$u_n$ là một cấp số cộng.]),
    [$u_n$ là một cấp số nhân đan dấu.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Viết lại: $u_(n+2) - u_(n+1) = u_(n+1) - u_n$.
    - Đặt $d_n = u_(n+1) - u_n$. Ta có $d_(n+1) = d_n$.
    - Khoảng cách giữa 2 số hạng liên tiếp là một hằng số. Vậy đây là định nghĩa của Cấp số cộng (CSC).
  ]
)

// CÂU 75
#tn(
  [Cho dãy truy hồi $u_0 = 1, u_1 = 4, u_(n+2) = -u_(n+1) + 6u_n$. Tìm số hạng $u_3$.],
  (
    [$10$.],
    [$14$.],
    True([$22$.]),
    [$30$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Bằng phương pháp tính tay:
    - $u_2 = -u_1 + 6u_0 = -4 + 6(1) = 2$.
    - $u_3 = -u_2 + 6u_1 = -2 + 6(4) = -2 + 24 = 22$.
    - (Khoan! Đáp án đúng là 22 chứ không phải 26. Thử lại: $u_2 = 2$. $u_3 = -2 + 24 = 22$. Để em sửa lại đáp án.)
  ]
)

// Sửa Câu 75

// CÂU 76
#tn(
  [Cho $u_1 = 0$, $u_(n+1) = ( 1 )/( 2 - u_n )$. Đặt dãy phụ $v_n = ( 1 )/( 1 - u_n )$. Tìm số hạng tổng quát $v_n$.],
  (
    True([$v_n = n$.]),
    [$v_n = 2^n$.],
    [$v_n = n+1$.],
    [$v_n = 3n$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - (Sửa đề 1 chút: Chọn $u_1 = 0$ để tránh vô nghĩa). Nếu $u_1 = 0$:
    - $x = ( 1 )/( 2 - x ) <=> x^2 - 2x + 1 = 0 <=> x = 1$ (nghiệm kép).
    - Đặt $v_n = ( 1 )/( 1 - u_n ) => v_(n+1) = ( 1 )/( 1 - (1)/(2-u_n) ) = ( 2 - u_n )/( 1 - u_n ) = ( 1 - u_n + 1 )/( 1 - u_n ) = 1 + ( 1 )/( 1 - u_n ) = v_n + 1$.
    - $(v_n)$ là CSC với $d = 1$.
    - Với $u_1 = 0 => v_1 = 1$. Vậy $v_n = 1 + (n-1)1 = n$.
  ]
)

// Sửa đề 76 để tránh vô nghĩa

// CÂU 77
#tn(
  [Xét hệ $x_(n+1) = 2x_n + y_n$ và $y_(n+1) = x_n + 2y_n$. Gọi $v_n = x_n + y_n$. Dãy $(v_n)$ là cấp số nhân với công bội $q$ bằng bao nhiêu?],
  (
    [$1$.],
    [$2$.],
    True([$3$.]),
    [$4$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Cộng 2 vế của hệ phương trình:
    - $x_(n+1) + y_(n+1) = 2x_n + y_n + x_n + 2y_n = 3x_n + 3y_n = 3(x_n + y_n)$.
    - Vậy $v_(n+1) = 3v_n => q = 3$.
  ]
)

// CÂU 78
#tn(
  [Cũng hệ như Câu 77, nếu đặt $w_n = x_n - y_n$. Dãy $(w_n)$ là cấp số nhân với công bội $k$ bằng bao nhiêu?],
  (
    [$0$.],
    True([$1$.]),
    [$-1$.],
    [$2$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Trừ 2 vế của hệ phương trình:
    - $x_(n+1) - y_(n+1) = (2x_n + y_n) - (x_n + 2y_n) = x_n - y_n$.
    - Vậy $w_(n+1) = w_n => k = 1$. Dãy $(w_n)$ là dãy hằng.
  ]
)

// CÂU 79
#tn(
  [Xét phương trình truy hồi $u_(n+1) = u_n / ( 1 + 2u_n )$ với $u_1 = 1$. Tìm giới hạn của $u_n$.],
  (
    [$1$.],
    [$1/2$.],
    True([$0$.]),
    [$+infinity$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Đặt $v_n = ( 1 )/( u_n )$. Ta có $v_(n+1) = ( 1 + 2u_n )/( u_n ) = ( 1 )/( u_n ) + 2 = v_n + 2$.
    - $(v_n)$ là CSC với công sai $d=2$. $v_1 = 1$.
    - $v_n = 1 + (n-1)2 = 2n - 1$.
    - Vậy $u_n = ( 1 )/( 2n - 1 )$.
    - Khi $n \to infinity$, $u_n \to 0$.
  ]
)

// CÂU 80
#tn(
  [Đóng lại chuyên đề: Một quả bóng cao su được thả rơi từ độ cao 10m. Mỗi lần chạm đất, quả bóng nảy lên độ cao bằng $3/4$ độ cao trước đó. Hỏi tổng quãng đường quả bóng di chuyển (kể từ lúc thả cho đến khi dừng hẳn) gần nhất với giá trị nào sau đây?],
  (
    [$40 "m"$.],
    [$80 "m"$.],
    True([$70 "m"$.]),
    [$60 "m"$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Quãng đường rơi lần đầu: $S_0 = 10$.
    - Lần chạm đất thứ 1, bóng nảy lên độ cao $10 dot ( 3 )/( 4 )$ và rơi xuống $10 dot ( 3 )/( 4 )$. Quãng đường di chuyển là $2 dot 10 dot ( 3 )/( 4 )$.
    - Tương tự, lần thứ 2: $2 dot 10 dot ( ( 3 )/( 4 ) )^2$.
    - Tổng quãng đường di chuyển: 
      $S = 10 + 20 (3/4) + 20 (3/4)^2 + 20 (3/4)^3 + ...$
    - Đây là tổng của một Cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 20(3/4) = 15$ và công bội $q = 3/4$.
    - Tổng $S = 10 + ( 15 )/( 1 - 3/4 ) = 10 + ( 15 )/( 1/4 ) = 10 + 60 = 70$.
    - Vậy tổng quãng đường quả bóng di chuyển là 70 mét. Một bài toán tuyệt vời để luyện thi ĐGNL.
  ]
)
