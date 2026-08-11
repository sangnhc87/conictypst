import re

with open('CD-DaySo-ChuyenSau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Fix { ... } in sub/superscripts
# We need to replace _{xyz} with _(xyz) and ^{xyz} with ^(xyz)
def fix_script(match):
    return match.group(1) + "(" + match.group(2) + ")"

text = re.sub(r'(_|\^)\{([^}]+)\}', fix_script, text)
# Run multiple times in case of nested braces like ^{n_{k}} 
# (Actually, Typst syntax is `a^(n_k)` not `a^(n_(k))` but it works).
text = re.sub(r'(_|\^)\{([^}]+)\}', fix_script, text)

# 2. Add theoretical section
theory_content = r"""
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

"""

# Insert theory right after the config section
config_marker = r"""// ==============================================================================
// PHẦN 1"""
if config_marker in text:
    text = text.replace(config_marker, theory_content + config_marker)


# 3. Add questions 41-55
q41_55 = r"""
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
    [$a = 1$.],
    [$a = -1$.],
    True([$a = 1$. (A và C giống nhau, ta chọn 1)]),
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
    [$u_n = 3^n - 3 dot 2^(n-1)$.],
    True([$u_n = 3^n - 3 dot 2^(n-1)$. (Khoan, kiểm tra lại.)]),
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
"""
q41_55_clean = q41_55.replace(
"""True([$a = 1$. (A và C giống nhau, ta chọn 1)]),""",
"""True([$a = 1$.]),""").replace(
"""[$a = 1$.],""",
"""[$a = 2$.],""").replace(
"""True([$u_n = 3^n - 3 dot 2^(n-1)$. (Khoan, kiểm tra lại.)]),""",
"""True([$u_n = 3^n - 3 dot 2^(n-1)$.]),""").replace(
"""[$u_n = 3^n - 3 dot 2^(n-1)$.],""",
"""[$u_n = 3^n + 2^n$.],""")

q41_55_rest = r"""
// CÂU 46
#tn(
  [Xét dãy $u_1 = 1, u_(n+1) = \frac{u_n}{2} + n$. Bằng cách đặt $v_n = u_n - a n - b$ để được $v_n$ là một cấp số nhân công bội $1/2$, tìm giá trị của $a+b$.],
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
    - Hệ PT: $1 - 1/2 a = 0 \implies a = 2$. Và $-a - 1/2 b = 0 \implies b = -2a = -4$.
    - Vậy $a+b = 2 - 4 = -2$.
  ]
)

// CÂU 47
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 2$ và $u_(n+1) = \frac{2u_n - 1}{u_n}$. Xét dãy phụ $v_n = \frac{1}{u_n - c}$. Giá trị $c$ là điểm bất động kép của phương trình đặc trưng. Tìm $c$.],
  (
    True([$c = 1$.]),
    [$c = 2$.],
    [$c = -1$.],
    [$c = 0$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Phương trình điểm bất động: $x = (2x - 1)/x \implies x^2 = 2x - 1 \implies x^2 - 2x + 1 = 0$.
    - Phương trình có nghiệm kép $x = 1$, tức là $c = 1$.
    - Do đó ta đặt dãy phụ $v_n = \frac{1}{u_n - 1}$, dãy này sẽ là một Cấp số cộng (CSC).
  ]
)

// CÂU 48
#tn(
  [Cũng với dãy số ở Câu 47: $u_1 = 2, u_(n+1) = \frac{2u_n - 1}{u_n}$. Tìm biểu thức số hạng tổng quát của $u_n$.],
  (
    [$u_n = \frac{n}{n-1}$.],
    True([$u_n = \frac{n+1}{n}$.]),
    [$u_n = \frac{2n}{n+1}$.],
    [$u_n = 2^n$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Từ câu 47, đặt $v_n = \frac{1}{u_n - 1}$.
    - Ta có $v_(n+1) = \frac{1}{u_(n+1) - 1} = \frac{1}{\frac{2u_n - 1}{u_n} - 1} = \frac{1}{\frac{u_n - 1}{u_n}} = \frac{u_n}{u_n - 1} = \frac{u_n - 1 + 1}{u_n - 1} = 1 + \frac{1}{u_n - 1} = v_n + 1$.
    - Dãy $(v_n)$ là cấp số cộng có công sai $d = 1$.
    - $v_1 = \frac{1}{u_1 - 1} = \frac{1}{2-1} = 1$.
    - Do đó $v_n = v_1 + (n-1)d = 1 + (n-1) = n$.
    - Trở lại $u_n$: $\frac{1}{u_n - 1} = n \implies u_n - 1 = \frac{1}{n} \implies u_n = \frac{n+1}{n}$.
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
    - Phương trình đặc trưng: $X^2 - 7X + 10 = 0 \implies X_1 = 2, X_2 = 5$.
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
    [$u_n = \frac{5^n + 2^n}{2}$.],
    True([$u_n = \frac{2 \cdot 2^n + 5^n}{3}$. (Xin lỗi, để em tính lại)] ),
    [$u_n = \frac{4 \cdot 2^n - 5^n}{3}$.]
  ),
  loigiai: [
    *Đáp án đúng: D*
    - (Sửa đổi các lựa chọn và lời giải).
    - $v_n = u_(n+1) - 2u_n = 5(u_n - 2u_(n-1)) = ... = 5^n (u_1 - 2u_0) = 5^n (3 - 2(1)) = 5^n$.
    - Lại có cách phân tích thứ hai: $u_(n+1) - 5u_n = 2^n (u_1 - 5u_0) = 2^n (3 - 5(1)) = -2 \cdot 2^n$.
    - Lấy phương trình 1 trừ phương trình 2:
      $(u_(n+1) - 2u_n) - (u_(n+1) - 5u_n) = 5^n - (-2 \cdot 2^n)$.
    - $3u_n = 5^n + 2 \cdot 2^n \implies u_n = \frac{2 \cdot 2^n + 5^n}{3}$.
    - (Wait, tính ra đúng là $\frac{2 \cdot 2^n + 5^n}{3}$. Test $n=0$: $(2+1)/3 = 1$. $n=1$: $(4+5)/3 = 3$. Đúng!)
    - Vậy đáp án đúng là C. Đợi em làm sạch câu trả lời.
  ]
)
"""

q41_55_rest_clean = q41_55_rest.replace(
"""True([$u_n = \frac{2 \cdot 2^n + 5^n}{3}$. (Xin lỗi, để em tính lại)] ),""",
"""True([$u_n = \frac{2 \cdot 2^n + 5^n}{3}$.]),""").replace(
"""    - (Sửa đổi các lựa chọn và lời giải).\n""",
""" """).replace(
"""    - (Wait, tính ra đúng là $\frac{2 \cdot 2^n + 5^n}{3}$. Test $n=0$: $(2+1)/3 = 1$. $n=1$: $(4+5)/3 = 3$. Đúng!)\n    - Vậy đáp án đúng là C. Đợi em làm sạch câu trả lời.""",
""" """)

q41_55_final = r"""
// CÂU 51
#tn(
  [Cho dãy số $(u_n)$ thỏa mãn $u_1 = 3$ và $u_(n+1) = \frac{4u_n - 2}{u_n + 1}$. Để tìm Cấp số nhân phụ, ta giải phương trình đặc trưng $x = \frac{4x - 2}{x + 1}$ được hai nghiệm là $1$ và $2$. Dãy phụ $(v_n)$ sẽ được đặt như thế nào?],
  (
    [$v_n = (u_n - 1)(u_n - 2)$.],
    True([$v_n = \frac{u_n - 2}{u_n - 1}$.]),
    [$v_n = u_n - 2$.],
    [$v_n = \frac{u_n + 2}{u_n + 1}$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Vì phương trình điểm bất động có hai nghiệm phân biệt $x_1 = 1, x_2 = 2$.
    - Phép biến đổi chia phân thức sẽ cho ra dãy $v_n = \frac{u_n - 2}{u_n - 1}$ là một cấp số nhân.
    - Cụ thể: $u_(n+1) - 2 = \frac{4u_n - 2 - 2(u_n + 1)}{u_n + 1} = \frac{2u_n - 4}{u_n + 1} = 2 \frac{u_n - 2}{u_n + 1}$.
    - Và $u_(n+1) - 1 = \frac{4u_n - 2 - (u_n + 1)}{u_n + 1} = \frac{3u_n - 3}{u_n + 1} = 3 \frac{u_n - 1}{u_n + 1}$.
    - Chia hai vế: $\frac{u_(n+1) - 2}{u_(n+1) - 1} = \frac{2}{3} \cdot \frac{u_n - 2}{u_n - 1} \implies v_(n+1) = \frac{2}{3} v_n$.
  ]
)

// CÂU 52
#tn(
  [Cho dãy đan dấu $u_1 = -1$, $u_n = -2u_(n-1) + 3 (-1)^n$. Tìm hệ số $c$ sao cho khi đặt $v_n = u_n - c(-1)^n$, ta được một CSN công bội $-2$.],
  (
    [$c = -3$.],
    True([$c = 1$.]),
    [$c = 2$.],
    [$c = 3$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Ta cần $v_n = -2v_(n-1) \implies u_n - c(-1)^n = -2(u_(n-1) - c(-1)^(n-1))$.
    - $u_n = -2u_(n-1) + 2c(-1)^(n-1) + c(-1)^n = -2u_(n-1) - 2c(-1)^n + c(-1)^n = -2u_(n-1) - c(-1)^n$.
    - Đối chiếu với phương trình ban đầu $u_n = -2u_(n-1) + 3(-1)^n$, ta suy ra $-c = 3 \implies c = -3$.
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
    True([$c = \sqrt{2}$.]),
    [$c = \sqrt{3}$.],
    [$c = 2$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - $v_(n+1) = x_(n+1) + c y_(n+1) = (3x_n + 4y_n) + c(2x_n + 3y_n) = (3 + 2c)x_n + (4 + 3c)y_n$.
    - Để dãy này là CSN, tỉ lệ hệ số phải bằng nhau: $\frac{4 + 3c}{3 + 2c} = c$.
    - Giải PT: $4 + 3c = 3c + 2c^2 \implies 2c^2 = 4 \implies c^2 = 2 \implies c = \pm \sqrt{2}$.
    - Nhờ thủ thuật này, ta đã chuyển hệ pt chéo thành hai cấp số nhân độc lập (với công bội $3 \pm 2\sqrt{2}$).
  ]
)

// CÂU 54
#tn(
  [Xét dãy $u_1 = 1, u_(n+1) = u_n^2 + 2u_n$. Ta dùng phép đặt ẩn phụ nào sau đây để biến đổi dãy số?],
  (
    [$v_n = u_n^2$.],
    [$v_n = u_n - 1$.],
    True([$v_n = u_n + 1$.]),
    [$v_n = \frac{1}{u_n}$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Viết lại: $u_(n+1) = u_n^2 + 2u_n = (u_n + 1)^2 - 1$.
    - Chuyển vế: $u_(n+1) + 1 = (u_n + 1)^2$.
    - Đặt $v_n = u_n + 1$, ta thu được $v_(n+1) = v_n^2$.
    - Lấy Logarit cơ số bất kỳ, ta biến về một CSN đối với chỉ số mũ.
  ]
)

// CÂU 55
#tn(
  [Dãy số $(u_n)$ được gọi là Cấp số cộng - nhân (Arithmetico-Geometric Sequence) nếu thỏa mãn $u_n = (an+b)q^n$. Phương trình truy hồi bậc hai nào sau đây sinh ra dãy này?],
  (
    [$u_(n+2) = (q^2+1)u_(n+1) - qu_n$.],
    True([$u_(n+2) = 2q u_(n+1) - q^2 u_n$.]),
    [$u_(n+2) = q u_(n+1) + q^2 u_n$.],
    [$u_(n+2) = u_(n+1) - q u_n$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Để có nghiệm dạng $(an+b)q^n$, phương trình đặc trưng $X^2 - c X - d = 0$ phải có một nghiệm kép $X_0 = q$.
    - Do đó, phương trình đặc trưng phải là $(X - q)^2 = 0 \implies X^2 - 2q X + q^2 = 0$.
    - Tương ứng với phương trình truy hồi: $u_(n+2) - 2q u_(n+1) + q^2 u_n = 0 \implies u_(n+2) = 2q u_(n+1) - q^2 u_n$.
  ]
)
"""

# Fix CÂU 52 correct answer from B to A
q41_55_final_clean = q41_55_final.replace(
"""True([$c = 1$.]),""",
"""[$c = 1$.],""").replace(
"""[$c = -3$.],""",
"""True([$c = -3$.]),""")

text = text + q41_55_clean + q41_55_rest_clean + q41_55_final_clean

with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(text)
