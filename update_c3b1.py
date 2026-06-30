import re

with open('typst/sach/day-so-chuong3/c3-b1-de1.typ', 'r', encoding='utf-8') as f:
    content = f.read()

replacements = [
(
r"""  loigiai: \[
    - A: Dãy giảm vì tử không đổi, mẫu tăng dần.
    - B: Dãy đan dấu, không tăng không giảm.
    - C: Ta có \$u_\(n\+1\) - u_n = 2\(n\+1\)\+1 - \(2n\+1\) = 2 > 0\$ nên đây là dãy tăng.
    - D: Chỉ tăng từ \$n=5\$ trở đi, không phải dãy tăng trên \$NN\^\*\$.
  \]""",
"""  loigiai: [
    #step[*Phân tích từng phương án:* \\
    - A: Dãy giảm vì tử không đổi, mẫu tăng dần. \\
    - B: Dãy đan dấu, không tăng không giảm. \\
    - C: Ta có $u_(n+1) - u_n = 2(n+1)+1 - (2n+1) = 2 > 0$ nên đây là dãy tăng. \\
    - D: Chỉ tăng từ $n=5$ trở đi, không phải dãy tăng trên $NN^*$.]
  ]"""
),
(
r"""  loigiai: \[
    \$u_2 = 3\(2\)-1 = 5\$ \\
    \$u_3 = 3\(5\)-1 = 14\$ \\
    \$u_4 = 3\(14\)-1 = 41\$.
  \]""",
"""  loigiai: [
    #step[*Tính tuần tự các số hạng:* \\
      $u_2 = 3(2)-1 = 5$ \\
      $u_3 = 3(5)-1 = 14$ \\
      $u_4 = 3(14)-1 = 41$.]
  ]"""
),
(
r"""  loigiai: \[
    Ta có \$u_n = \(2n\+4-3\)/\(n\+2\) = 2 - 3/\(n\+2\)\$. \\
    Vì \$n >= 1\$ nên \$3/\(n\+2\) <= 1\$, suy ra \$u_n >= 2 - 1 = 1\$. \\
    Đồng thời \$3/\(n\+2\) > 0\$ nên \$u_n < 2\$. \\
    Vậy \$1 <= u_n < 2\$, dãy số bị chặn.
  \]""",
"""  loigiai: [
    #step[*B1: Biến đổi biểu thức:* \\
      Ta có $u_n = (2n+4-3)/(n+2) = 2 - 3/(n+2)$.]
    #step[*B2: Đánh giá chặn dưới và chặn trên:* \\
      Vì $n >= 1$ nên $3/(n+2) <= 1$, suy ra $u_n >= 2 - 1 = 1$. \\
      Đồng thời $3/(n+2) > 0$ nên $u_n < 2$.]
    #step[*B3: Kết luận:* \\
      Vậy $1 <= u_n < 2$, dãy số bị chặn.]
  ]"""
),
(
r"""  loigiai: \[
    Theo nguyên lý quy nạp toán học, ta phải thực hiện 3 bước: \\
    - Bước khởi tạo: Chứng minh \$P\(1\)\$ đúng. \\
    - Bước giả thiết: Giả sử \$P\(k\)\$ đúng với \$k >= 1\$. \\
    - Bước nhảy: Chứng minh \$P\(k\+1\)\$ đúng.
  \]""",
"""  loigiai: [
    #step[*Các bước quy nạp toán học:* \\
    Theo nguyên lý quy nạp toán học, ta phải thực hiện 3 bước: \\
    - Bước khởi tạo: Chứng minh $P(1)$ đúng. \\
    - Bước giả thiết: Giả sử $P(k)$ đúng với $k >= 1$. \\
    - Bước nhảy: Chứng minh $P(k+1)$ đúng.]
  ]"""
),
(
r"""  loigiai: \[
    Diện tích hình chữ nhật tạo bởi \$n\$ hình vuông Fibonacci luôn bằng \$F_n times F_\(n\+1\)\$. \\
    Ví dụ khi \$n=3\$, các cạnh hình vuông là 1, 1, 2. HCN tổng có cạnh \$2\$ và \$3\$, diện tích bằng \$6 = 2 times 3 = F_3 times F_4\$.
  \]""",
"""  loigiai: [
    #step[*Quan sát quy luật ghép hình:* \\
      Diện tích hình chữ nhật tạo bởi $n$ hình vuông Fibonacci luôn có kích thước cạnh là $F_n$ và $F_(n+1)$. \\
      Do đó diện tích luôn bằng $F_n times F_(n+1)$.]
    #step[*Kiểm chứng:* \\
      Ví dụ khi $n=3$, các cạnh hình vuông là 1, 1, 2. HCN tổng có cạnh $2$ và $3$, diện tích bằng $6 = 2 times 3 = F_3 times F_4$.]
  ]"""
),
(
r"""  loigiai: \[
    Số que diêm ở các hình lập thành một cấp số cộng với \$u_1 = 3\$ và công sai \$d = 2\$ \(mỗi lần thêm 1 tam giác ta cần thêm 2 que diêm ghép vào cạnh có sẵn\). \\
    Công thức số hạng tổng quát: \$u_n = u_1 \+ \(n-1\)d = 3 \+ 2\(n-1\) = 2n \+ 1\$.
  \]""",
"""  loigiai: [
    #step[*B1: Xác định quy luật cấp số cộng:* \\
      Số que diêm ở các hình lập thành một cấp số cộng với $u_1 = 3$ và công sai $d = 2$ (mỗi lần thêm 1 tam giác ta cần thêm 2 que diêm ghép vào cạnh có sẵn).]
    #step[*B2: Tìm số hạng tổng quát:* \\
      Công thức số hạng tổng quát: $u_n = u_1 + (n-1)d = 3 + 2(n-1) = 2n + 1$.]
  ]"""
),
(
r"""  loigiai: \[
    Ta có: \$u_\(n\+1\) - u_n = 2n - 1\$. \\
    Thay lần lượt \$n = 1, 2, ..., n-1\$, ta cộng các vế lại: \\
    \$u_n - u_1 = sum_\(i=1\)\^\(n-1\) \(2i - 1\) = \(n-1\)\^2\$. \\
    Suy ra \$u_n = 5 \+ \(n-1\)\^2 = 5 \+ n\^2 - 2n \+ 1 = n\^2 - 2n \+ 6\$.
  \]""",
"""  loigiai: [
    #step[*B1: Lập các hiệu số liên tiếp:* \\
      Ta có: $u_(n+1) - u_n = 2n - 1$. \\
      Thay lần lượt $n = 1, 2, ..., n-1$, ta cộng các vế lại:]
    #step[*B2: Tính tổng các hiệu số:* \\
      $u_n - u_1 = sum_(i=1)^(n-1) (2i - 1) = (n-1)^2$.]
    #step[*B3: Rút ra công thức $u_n$:* \\
      Suy ra $u_n = 5 + (n-1)^2 = 5 + n^2 - 2n + 1 = n^2 - 2n + 6$.]
  ]"""
),
(
r"""  loigiai: \[
    a\) Đúng. Với \$n=1\$, \$u_1 = 2\^1 - 3\(1\) = -1\$. \\
    b\) Sai. Ta có \$u_1 = -1, u_2 = 2\^2 - 3\(2\) = -2\$. Do \$u_2 < u_1\$ nên dãy không tăng. \\
    c\) Đúng. \$u_4 = 2\^4 - 3\(4\) = 4, u_3 = 2\^3 - 3\(3\) = -1\$. Rõ ràng \$4 > -1\$. \\
    d\) Sai. Khi \$n -> \+oo\$, \$2\^n\$ tăng nhanh hơn rất nhiều so với \$3n\$, nên \$u_n -> \+oo\$. Dãy không bị chặn trên.
  \]""",
"""  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \\
    - a) Đúng. Với $n=1$, $u_1 = 2^1 - 3(1) = -1$. \\
    - b) Sai. Ta có $u_1 = -1, u_2 = 2^2 - 3(2) = -2$. Do $u_2 < u_1$ nên dãy không tăng. \\
    - c) Đúng. $u_4 = 2^4 - 3(4) = 4, u_3 = 2^3 - 3(3) = -1$. Rõ ràng $4 > -1$. \\
    - d) Sai. Khi $n -> +oo$, $2^n$ tăng nhanh hơn rất nhiều so với $3n$, nên $u_n -> +oo$. Dãy không bị chặn trên.]
  ]"""
),
(
r"""  loigiai: \[
    a\) Đúng. Với \$n=1\$, \$u_2 = 2\(1\) \+ 1 = 3\$. \\
    b\) Sai. Với \$n=2\$, \$u_3 = 2\(3\) \+ 1 = 7\$ bước. \\
    c\) Đúng. Khởi tạo \$n=1 => 2\^1-1=1\$. Bước nhảy: \$u_\(k\+1\) = 2\(2\^k-1\)\+1 = 2\^\(k\+1\)-1\$. \\
    d\) Sai. Số bước chuyển 10 đĩa là \$u_\(10\) = 2\^\(10\) - 1 = 1023\$ bước. Thời gian là 1023 giây \$approx 17\$ phút, chưa tới 1 giờ.
  \]""",
"""  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \\
    - a) Đúng. Với $n=1$, $u_2 = 2(1) + 1 = 3$. \\
    - b) Sai. Với $n=2$, $u_3 = 2(3) + 1 = 7$ bước. \\
    - c) Đúng. Khởi tạo $n=1 => 2^1-1=1$. Bước nhảy: $u_(k+1) = 2(2^k-1)+1 = 2^(k+1)-1$. \\
    - d) Sai. Số bước chuyển 10 đĩa là $u_(10) = 2^(10) - 1 = 1023$ bước. Thời gian là 1023 giây $approx 17$ phút, chưa tới 1 giờ.]
  ]"""
),
(
r"""  loigiai: \[
    a\) Đúng. Với \$n=2\$, \$a_2 = a_1 \+ 2 = 4\$ miền. \\
    b\) Sai. Với \$n=3\$, \$a_3 = a_2 \+ 3 = 7\$ miền \(như hình minh họa\). \\
    c\) Đúng. Chứng minh bằng quy nạp: Với \$n=1\$, \$a_1 = \(1\+1\+2\)/2 = 2\$ \(đúng\). Giả sử đúng với \$n=k\$, ta có \$a_k = \(k\^2\+k\+2\)/2\$. Khi đó \$a_\(k\+1\) = \(k\^2\+k\+2\)/2 \+ k \+ 1 = \(k\^2 \+ 3k \+ 4\)/2 = \(\(k\+1\)\^2 \+ \(k\+1\) \+ 2\)/2\$ \(đúng\). \\
    d\) Đúng. Với \$n=10\$, \$a_\(10\) = \(10\^2 \+ 10 \+ 2\)/2 = 112 / 2 = 56\$ miền.
  \]""",
"""  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \\
    - a) Đúng. Với $n=2$, $a_2 = a_1 + 2 = 4$ miền. \\
    - b) Sai. Với $n=3$, $a_3 = a_2 + 3 = 7$ miền (như hình minh họa). \\
    - c) Đúng. Chứng minh bằng quy nạp: Với $n=1$, $a_1 = (1+1+2)/2 = 2$ (đúng). Giả sử đúng với $n=k$, ta có $a_k = (k^2+k+2)/2$. Khi đó $a_(k+1) = (k^2+k+2)/2 + k + 1 = (k^2 + 3k + 4)/2 = ((k+1)^2 + (k+1) + 2)/2$ (đúng). \\
    - d) Đúng. Với $n=10$, $a_(10) = (10^2 + 10 + 2)/2 = 112 / 2 = 56$ miền.]
  ]"""
),
(
r"""  loigiai: \[
    Tính trực tiếp: \\
    \$u_2 = 2\(1\) \+ 3 = 5\$ \\
    \$u_3 = 2\(5\) \+ 3 = 13\$ \\
    \$u_4 = 2\(13\) \+ 3 = 29\$ \\
    \$u_5 = 2\(29\) \+ 3 = 61\$.
  \]""",
"""  loigiai: [
    #step[*Tính tuần tự các số hạng:* \\
      $u_2 = 2(1) + 3 = 5$ \\
      $u_3 = 2(5) + 3 = 13$ \\
      $u_4 = 2(13) + 3 = 29$ \\
      $u_5 = 2(29) + 3 = 61$.]
  ]"""
),
(
r"""  loigiai: \[
    Sau 1h: \$P_1 = 2\(1000\) - 500 = 1500\$. \\
    Sau 2h: \$P_2 = 2\(1500\) - 500 = 2500\$. \\
    Sau 3h: \$P_3 = 2\(2500\) - 500 = 4500\$.
  \]""",
"""  loigiai: [
    #step[*Tính tuần tự số lượng vi khuẩn:* \\
      - Sau 1h: $P_1 = 2(1000) - 500 = 1500$. \\
      - Sau 2h: $P_2 = 2(1500) - 500 = 2500$. \\
      - Sau 3h: $P_3 = 2(2500) - 500 = 4500$.]
  ]"""
),
(
r"""  loigiai: \[
    \$C_0 = 1\$ \\
    \$C_1 = C_0 C_0 = 1\$ \\
    \$C_2 = C_0 C_1 \+ C_1 C_0 = 1 dot 1 \+ 1 dot 1 = 2\$ \\
    \$C_3 = C_0 C_2 \+ C_1 C_1 \+ C_2 C_0 = 1 dot 2 \+ 1 dot 1 \+ 2 dot 1 = 5\$.
  \]""",
"""  loigiai: [
    #step[*Tính tuần tự dãy Catalan:* \\
      $C_0 = 1$ \\
      $C_1 = C_0 C_0 = 1$ \\
      $C_2 = C_0 C_1 + C_1 C_0 = 1 dot 1 + 1 dot 1 = 2$ \\
      $C_3 = C_0 C_2 + C_1 C_1 + C_2 C_0 = 1 dot 2 + 1 dot 1 + 2 dot 1 = 5$.]
  ]"""
),
(
r"""  loigiai: \[
    Ta xét tỷ số giữa hai số hạng liên tiếp: \$u_\(n\+1\) / u_n = \(2\^\(n\+1\) / \(n\+1\)!\) / \(2\^n / n!\) = 2 / \(n\+1\)\$. \\
    - Với \$n=1\$: \$u_2 / u_1 = 2/2 = 1 => u_2 = u_1 = 2\$. \\
    - Với \$n >= 2\$: \$n\+1 > 2 => 2 / \(n\+1\) < 1 => u_\(n\+1\) < u_n\$. \\
    Do đó dãy số giảm kể từ \$n=2\$. Số hạng lớn nhất của dãy là \$u_1 = u_2 = 2\$.
  \]""",
"""  loigiai: [
    #step[*B1: Lập tỷ số giữa hai số hạng liên tiếp:* \\
      $u_(n+1) / u_n = (2^(n+1) / (n+1)!) / (2^n / n!) = 2 / (n+1)$.]
    #step[*B2: Đánh giá sự tăng giảm của dãy số:* \\
      - Với $n=1$: $u_2 / u_1 = 2/2 = 1 => u_2 = u_1 = 2$. \\
      - Với $n >= 2$: $n+1 > 2 => 2 / (n+1) < 1 => u_(n+1) < u_n$.]
    #step[*B3: Kết luận:* \\
      Do đó dãy số giảm kể từ $n=2$. Số hạng lớn nhất của dãy là $u_1 = u_2 = 2$.]
  ]"""
),
(
r"""  loigiai: \[
    Số khối gỗ ở tầng \$n\$ là \$u_n = n\(n\+1\)/2 = 1/2 \(n\^2 \+ n\)\$. \\
    Tổng số khối gỗ của 10 tầng là: \\
    \$S = sum_\(n=1\)\^\(10\) u_n = 1/2 sum_\(n=1\)\^\(10\) \(n\^2 \+ n\) = 1/2 \[sum_\(n=1\)\^\(10\) n\^2 \+ sum_\(n=1\)\^\(10\) n\]\$. \\
    Ta biết \$sum_\(n=1\)\^\(10\) n\^2 = \(10 times 11 times 21\)/6 = 385\$ và \$sum_\(n=1\)\^\(10\) n = \(10 times 11\)/2 = 55\$. \\
    Do đó, \$S = 1/2 \[385 \+ 55\] = 1/2 \[440\] = 220\$ khối gỗ.
  \]""",
"""  loigiai: [
    #step[*B1: Công thức số khối gỗ ở tầng $n$:* \\
      Số khối gỗ ở tầng $n$ là $u_n = n(n+1)/2 = 1/2 (n^2 + n)$.]
    #step[*B2: Thiết lập tổng:* \\
      Tổng số khối gỗ của 10 tầng là: \\
      $S = sum_(n=1)^(10) u_n = 1/2 sum_(n=1)^(10) (n^2 + n) = 1/2 [sum_(n=1)^(10) n^2 + sum_(n=1)^(10) n]$.]
    #step[*B3: Tính toán kết quả:* \\
      Ta biết $sum_(n=1)^(10) n^2 = (10 times 11 times 21)/6 = 385$ và $sum_(n=1)^(10) n = (10 times 11)/2 = 55$. \\
      Do đó, $S = 1/2 [385 + 55] = 1/2 [440] = 220$ khối gỗ.]
  ]"""
)
]

for pat, repl in replacements:
    content, count = re.subn(pat, repl, content)
    if count == 0:
        print("Failed to replace a block in c3-b1!")

with open('typst/sach/day-so-chuong3/c3-b1-de1.typ', 'w', encoding='utf-8') as f:
    f.write(content)

print("Updated c3-b1-de1.typ")
