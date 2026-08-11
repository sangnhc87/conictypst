import os

content = r"""
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
    - PT đặc trưng $X^2 - X - 2 = 0 \implies X_1 = 2, X_2 = -1$.
    - Dạng nghiệm: $u_n = A dot 2^n + B dot (-1)^n$.
    - $n=1: 2A - B = 0 \implies B = 2A$.
    - $n=2: 4A + B = 3 \implies 4A + 2A = 3 \implies 6A = 3 \implies A = 1/2$. Khi đó $B = 1$.
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
    True([$26$.]),
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
"""
content = content.replace(
"""True([$26$.]),""",
"""True([$22$.]),""")

content += r"""
// CÂU 76
#tn(
  [Cho $u_1 = 1$, $u_(n+1) = ( 1 )/( 2 - u_n )$. Đặt dãy phụ $v_n = ( 1 )/( 1 - u_n )$. Tìm số hạng tổng quát $v_n$.],
  (
    True([$v_n = n$. (Dãy không xác định tại $u_1=1$!)]),
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
"""
content = content.replace(
"""[Cho $u_1 = 1$, $u_(n+1) = ( 1 )/( 2 - u_n )$. Đặt dãy phụ $v_n = ( 1 )/( 1 - u_n )$. Tìm số hạng tổng quát $v_n$.],""",
"""[Cho $u_1 = 0$, $u_(n+1) = ( 1 )/( 2 - u_n )$. Đặt dãy phụ $v_n = ( 1 )/( 1 - u_n )$. Tìm số hạng tổng quát $v_n$.],""").replace(
"""True([$v_n = n$. (Dãy không xác định tại $u_1=1$!)]),""",
"""True([$v_n = n$.]),""")

content += r"""
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
    - Vậy $v_(n+1) = 3v_n \implies q = 3$.
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
    - Vậy $w_(n+1) = w_n \implies k = 1$. Dãy $(w_n)$ là dãy hằng.
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
    - Khi $n \to \infty$, $u_n \to 0$.
  ]
)

// CÂU 80
#tn(
  [Đóng lại chuyên đề: Cho dãy số $u_1 = 2, u_(n+1) = 2u_n^2 - 1$. Đặt $u_n = \cosh(2^{n-1} a)$. Biết $\cosh(x) = ( e^x + e^{-x} )/( 2 )$. Tìm $a$.],
  (
    [$a = \ln(2)$.],
    True([$a = \ln(2 + \sqrt{3})$.]),
    [$a = \ln(3)$.],
    [$a = 1$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Phương trình đặc trưng của $u_{n+1}$ giống hệ thức lượng giác kép $\cos(2x) = 2\cos^2x - 1$. 
    - Vì $u_1 = 2 > 1$, ta dùng hàm hyperbol $\cosh$ thay vì $\cos$. 
    - Ta có $u_1 = \cosh(a) = 2 \implies \frac{e^a + e^{-a}}{2} = 2 \implies e^{2a} - 4e^a + 1 = 0$.
    - Giải phương trình bậc 2 theo $e^a$: $e^a = \frac{4 + \sqrt{16-4}}{2} = 2 + \sqrt{3}$ (chọn nghiệm lớn hơn 1 để $a>0$).
    - Vậy $a = \ln(2 + \sqrt{3})$.
    - Bằng quy nạp, ta chứng minh được $u_n = \cosh(2^{n-1} a)$. Chuyên đề khép lại với sự giao thoa hoàn hảo giữa Đại số, Truy hồi và Lượng giác Hyperbol.
  ]
)
"""

# Let's run a quick pass to fix any latex issues in the newly appended text
content = content.replace(r'\implies', '=>').replace(r'\infty', 'infinity').replace(r'\ln', 'ln').replace(r'\sqrt', 'sqrt')
content = content.replace('{1)', '(1)').replace('} ', ') ') # safety

with open('CD-DaySo-ChuyenSau.typ', 'a', encoding='utf-8') as f:
    f.write(content)

