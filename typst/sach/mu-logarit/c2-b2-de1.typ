#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập — Logarit])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 5)

#q-wrap(dir: "doc", tn(
  [Cho $a$ là số thực dương khác $1$. Giá trị của biểu thức $log_a (a^3)$ bằng:],
  ([$1/3$], [$3a$], True([$3$]), [$a^3$]),
  loigiai: [
    #step[*Áp dụng tính chất lũy thừa trong logarit* \ Ta có $log_a (a^alpha) = alpha$. Suy ra $log_a (a^3) = 3$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho hai số dương $a, b$ và $a != 1$. Khẳng định nào sau đây là đúng?],
  (
    [$log_a (a b) = log_a b$],
    True([$log_a (a b) = 1 + log_a b$]),
    [$log_a (a b) = log_a a dot log_a b$],
    [$log_a (a b) = log_b a$]
  ),
  loigiai: [
    #step[*Áp dụng quy tắc logarit của một tích* \ Ta có $log_a (a b) = log_a a + log_a b = 1 + log_a b$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho $log_2 3 = a$. Khi đó $log_4 9$ bằng:],
  ([$a/2$], [$2a$], True([$a$]), [$a^2$]),
  loigiai: [
    #step[*Biến đổi cơ số và biểu thức* \ Ta có $log_4 9 = log_(2^2) (3^2)$.]
    #step[*Áp dụng tính chất* \ Đưa số mũ ra ngoài: $log_(2^2) (3^2) = 2/2 log_2 3 = log_2 3 = a$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho số thực dương $x$. Biểu thức $P = ln(x) + ln(e/x)$ rút gọn bằng:],
  ([$x$], [$ln x$], True([$1$]), [$e$]),
  loigiai: [
    #step[*Cách 1: Sử dụng tổng logarit* \ $P = ln(x dot e/x) = ln(e) = 1$.]
    #step[*Cách 2: Sử dụng hiệu logarit* \ $P = ln x + (ln e - ln x) = ln e = 1$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho $log_a b = 2$ và $log_a c = 3$ (với $a, b, c > 0; a != 1$). Giá trị của $log_a (b^2 / c)$ là:],
  (True([$1$]), [$-1$], [$4/3$], [$12$]),
  loigiai: [
    #step[*Khai triển biểu thức logarit* \ $log_a (b^2 / c) = log_a (b^2) - log_a c = 2 log_a b - log_a c$.]
    #step[*Thay số* \ $= 2 dot 2 - 3 = 4 - 3 = 1$.]
  ]
))

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2)

#q-wrap(dir: "doc", ds(
  [Xét các biểu thức logarit với $a, b > 0$ và $a, b != 1$. Các mệnh đề sau đúng hay sai?],
  (
    [Giá trị của $log_2 8$ là 4.],
    True([Nếu $log_3 x = 4$ thì $x = 81$.]),
    True([Biểu thức $log_a b dot log_b a = 1$.]),
    [$ln(a + b) = ln a + ln b$.]
  ),
  loigiai: [
    - *a) Sai:* Ta có $8 = 2^3$, do đó $log_2 8 = 3$.
    - *b) Đúng:* Theo định nghĩa, $log_3 x = 4 <=> x = 3^4 = 81$.
    - *c) Đúng:* Áp dụng hệ quả công thức đổi cơ số: $log_a b dot log_b a = log_a a = 1$.
    - *d) Sai:* Quy tắc là logarit của một tích bằng tổng các logarit ($ln(a b) = ln a + ln b$), chứ không áp dụng cho một tổng.
  ]
))

#q-wrap(dir: "doc", ds(
  [Cho các số thực $x, y > 0$ thỏa mãn $log_2 x + log_2 y = 5$. Xét tính đúng sai:],
  (
    True([Tích của $x$ và $y$ bằng $32$.]),
    [Giá trị lớn nhất của $x y$ là $16$.],
    True([Nếu $x = 4$ thì $y = 8$.]),
    [Hệ thức liên hệ giữa $x$ và $y$ là $x + y = 32$.]
  ),
  loigiai: [
    - *a) Đúng:* Có $log_2 x + log_2 y = log_2(x y)$. Suy ra $log_2(x y) = 5 <=> x y = 2^5 = 32$.
    - *b) Sai:* Tích $x y$ là hằng số và luôn bằng $32$, không thay đổi.
    - *c) Đúng:* Nếu $x = 4$, thay vào $x y = 32 => 4 y = 32 <=> y = 8$.
    - *d) Sai:* Hệ thức liên hệ là $x y = 32$, không phải tổng $x + y = 32$.
  ]
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 2)

#q-wrap(dir: "doc", tln(
  [Biết $log_2 5 = a$ và $log_3 5 = b$. Hãy tính giá trị của $log_6 5$ theo $a$ và $b$. Lấy giá trị của $a=2.32$ và $b=1.46$, tính $log_6 5$ (làm tròn đến hai chữ số thập phân).],
  [$0.90$],
  loigiai: [
    #step[*B1: Nghịch đảo logarit* \ Ta có $log_5 2 = 1/a$ và $log_5 3 = 1/b$.]
    #step[*B2: Đổi cơ số cho biểu thức cần tính* \ Phân tích $log_6 5 = 1 / (log_5 6) = 1 / (log_5(2 dot 3)) = 1 / (log_5 2 + log_5 3)$.]
    #step[*B3: Thay thế theo $a, b$* \ $log_6 5 = 1 / (1/a + 1/b) = (a b) / (a + b)$.]
    #step[*B4: Tính số liệu cụm* \ Thay $a=2.32, b=1.46$: \ $P = (2.32 dot 1.46) / (2.32 + 1.46) = 3.3872 / 3.78 approx 0.896$. \ Làm tròn 2 chữ số thập phân thành $0.90$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho ba số thực dương $a, b, c$ khác $1$ thỏa mãn $a^2 = b^3 = c^5$. Biết rằng biểu thức $P = log_a b + log_b c + log_c a$ có giá trị bằng phân số tối giản $m/n$ (với $m, n in NN^*$). Tính tổng $m + n$.],
  [$143$],
  loigiai: [
    #step[*B1: Đặt ẩn phụ liên kết* \ Đặt $a^2 = b^3 = c^5 = k > 0$ (vì $a,b,c != 1 => k != 1$). \ Suy ra $a = k^(1/2)$, $b = k^(1/3)$, $c = k^(1/5)$.]
    #step[*B2: Tính các logarit thành phần* \ $log_a b = log_(k^(1/2)) (k^(1/3)) = (1/3) / (1/2) = 2/3$. \ $log_b c = log_(k^(1/3)) (k^(1/5)) = (1/5) / (1/3) = 3/5$. \ $log_c a = log_(k^(1/5)) (k^(1/2)) = (1/2) / (1/5) = 5/2$.]
    #step[*B3: Cộng tổng các giá trị* \ $P = 2/3 + 3/5 + 5/2 = (20 + 18 + 75) / 30 = 113/30$.]
    #step[*B4: Tính tổng tử và mẫu* \ Ta có $m = 113$, $n = 30$ và $113/30$ là phân số tối giản. \ Tổng $m + n = 113 + 30 = 143$.]
  ]
))
