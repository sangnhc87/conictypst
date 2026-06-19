#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập — Lũy Thừa])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 5)

#q-wrap(dir: "doc", tn(
  [Rút gọn biểu thức $P = x^(1/3) dot root(6, x)$ với $x > 0$, ta được:],
  ([$P = x^(1/8)$], [$P = x^(2/9)$], True([$P = x^(1/2)$]), [$P = x^2$]),
  loigiai: [
    #step[**B1: Chuyển căn thức về lũy thừa** \ Ta có $root(6, x) = x^(1/6)$.]
    #step[**B2: Áp dụng công thức nhân hai lũy thừa cùng cơ số** \ $P = x^(1/3) dot x^(1/6) = x^(1/3 + 1/6) = x^(3/6) = x^(1/2)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho $a$ là số thực dương. Biểu thức $a^(2/3) / a^(1/2)$ bằng:],
  ([$a^(4/3)$], True([$a^(1/6)$]), [$a^(1/3)$], [$a^(7/6)$]),
  loigiai: [
    #step[**B1: Áp dụng công thức chia lũy thừa** \ Ta có $a^m / a^n = a^(m - n)$.]
    #step[**B2: Tính toán** \ $a^(2/3) / a^(1/2) = a^(2/3 - 1/2) = a^(4/6 - 3/6) = a^(1/6)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = (x - 1)^(-3)$ là:],
  (
    [$D = RR$],
    [$D = (1; +oo)$],
    True([$D = RR \ \{1\}$]),
    [$D = [1; +oo)$]
  ),
  loigiai: [
    #step[**Lý thuyết:** Lũy thừa với số mũ nguyên âm xác định khi cơ số khác 0.]
    #step[**B2: Lập điều kiện** \ Cơ số là $(x - 1)$. Do đó điều kiện là $x - 1 != 0 <=> x != 1$.]
    #step[**B3: Kết luận** \ Tập xác định $D = RR \ \{1\}$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho các số thực $a, b > 0$. Khẳng định nào sau đây là sai?],
  (
    [$(a b)^x = a^x b^x$],
    [$(a/b)^y = a^y / b^y$],
    True([$(a^x)^y = a^(x + y)$]),
    [$a^x a^y = a^(x + y)$]
  ),
  loigiai: [
    #step[**Lý thuyết:** Theo tính chất lũy thừa, lũy thừa của một lũy thừa là $(a^x)^y = a^(x y)$.]
    #step[Do đó khẳng định sai là $(a^x)^y = a^(x + y)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho $0 < a < 1$. Khẳng định nào sau đây là đúng?],
  (
    [$a^(sqrt(2)) < a^(sqrt(3))$],
    True([$a^(1/3) < a^(1/4)$]),
    [$a^(-2) > a^(-3)$],
    [$a^pi > a^3$]
  ),
  loigiai: [
    #step[**Lý thuyết:** Khi cơ số $0 < a < 1$, hàm số lũy thừa $y = a^x$ nghịch biến. Do đó, $a^x < a^y <=> x > y$.]
    #step[**Xét các đáp án:**]
    #step[- A sai vì $sqrt(2) < sqrt(3) => a^(sqrt(2)) > a^(sqrt(3))$.]
    #step[- B đúng vì $1/3 > 1/4 => a^(1/3) < a^(1/4)$.]
    #step[- C sai vì $-2 > -3 => a^(-2) < a^(-3)$.]
    #step[- D sai vì $pi > 3 => a^pi < a^3$.]
  ]
))

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2)

#q-wrap(dir: "doc", ds(
  [Cho hai số thực $a, b > 0$ và biểu thức $P = a^(sqrt(2)) dot (1/a)^(sqrt(2) - 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tập xác định của biểu thức là $a in RR$.],
    True([Biểu thức được rút gọn thành $P = a$.]),
    [Nếu $a = 2026$ thì $P > 2027$.],
    True([Với $0 < a < 1$ thì $P < 1$.])
  ),
  loigiai: [
    - **a) Sai:** Hàm số lũy thừa với số mũ thực vô tỉ đòi hỏi cơ số phải lớn hơn $0$. Do đó điều kiện là $a > 0$.
    - **b) Đúng:** Ta có $1/a = a^(-1)$. Khi đó $(1/a)^(sqrt(2) - 1) = a^(-(sqrt(2) - 1)) = a^(1 - sqrt(2))$. \ Nhân hai lũy thừa cùng cơ số: $P = a^(sqrt(2)) dot a^(1 - sqrt(2)) = a^(sqrt(2) + 1 - sqrt(2)) = a^1 = a$.
    - **c) Sai:** Khi $a = 2026$, giá trị của $P = 2026$, do đó $P < 2027$.
    - **d) Đúng:** Vì $P = a$ nên với $0 < a < 1$ thì rõ ràng $P < 1$.
  ]
))

#q-wrap(dir: "doc", ds(
  [Xét tính đúng sai của các mệnh đề sau về căn bậc $n$ và lũy thừa:],
  (
    [Với mọi số thực $x$, ta có $root(2, x^2) = x$.],
    [Biểu thức $(-8)^(1/3)$ bằng $-2$.],
    True([Nếu $x > 0$ thì $root(4, x^2) = x^(1/2)$.]),
    True([Phương trình $x^3 = -27$ có duy nhất một nghiệm thực là $x = -3$.])
  ),
  loigiai: [
    - **a) Sai:** Theo định nghĩa căn bậc hai số học, $root(2, x^2) = |x|$. Chẳng hạn với $x = -2$ thì $root(2, (-2)^2) = 2 != -2$.
    - **b) Sai:** Lũy thừa với số mũ hữu tỉ $1/3$ yêu cầu cơ số dương (quy ước trong SGK). Do cơ số là $-8 < 0$ nên biểu thức $(-8)^(1/3)$ không xác định, mặc dù $root(3, -8) = -2$ là có nghĩa.
    - **c) Đúng:** Khi $x > 0$, ta có $root(4, x^2) = (x^2)^(1/4) = x^(2/4) = x^(1/2) = sqrt(x)$.
    - **d) Đúng:** Phương trình bậc lẻ $x^n = a$ (với $n$ lẻ) luôn có một nghiệm thực duy nhất là $root(n, a)$. Ở đây $x = root(3, -27) = -3$.
  ]
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 2)

#q-wrap(dir: "doc", tln(
  [Cho biểu thức $P = (root(3, a dot sqrt(a)) / a^(1/6))^6$ với $a > 0$. Hỏi biểu thức này có giá trị không đổi bằng $a^k$ với $k$ bằng bao nhiêu?],
  [$2$],
  loigiai: [
    #step[**B1: Rút gọn tử số** \ Ta có $a dot sqrt(a) = a^1 dot a^(1/2) = a^(3/2)$. \ Suy ra $root(3, a dot sqrt(a)) = (a^(3/2))^(1/3) = a^(1/2)$.]
    #step[**B2: Rút gọn biểu thức trong ngoặc** \ $a^(1/2) / a^(1/6) = a^(1/2 - 1/6) = a^(3/6 - 1/6) = a^(2/6) = a^(1/3)$.]
    #step[**B3: Nâng lũy thừa** \ Cuối cùng $P = (a^(1/3))^6 = a^(6/3) = a^2$. \ Vậy $k = 2$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một khoản tiền $A$ được gửi vào ngân hàng với lãi suất kép $8%$/năm. Sau đúng 3 năm, người đó nhận được số tiền gấp $k$ lần số tiền ban đầu. Giá trị của $k$ (làm tròn đến chữ số thập phân thứ hai) là bao nhiêu?],
  [$1.26$],
  loigiai: [
    #step[**B1: Công thức lãi kép** \ Số tiền thu được sau $n$ năm là $T = A(1 + r)^n$.]
    #step[**B2: Thay số** \ Với $r = 8% = 0.08$ và $n = 3$, ta có $T = A(1 + 0.08)^3 = A(1.08)^3$.]
    #step[**B3: Tính tỷ lệ** \ Tỷ lệ $k = T/A = (1.08)^3 approx 1.259712$. Làm tròn đến chữ số thập phân thứ hai là $1.26$.]
  ]
))
