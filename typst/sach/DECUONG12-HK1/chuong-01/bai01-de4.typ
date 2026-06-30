#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#muc([Đề Luyện Tập Số 04])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#tn(
  dir: "ngang",
  [Tìm số các giá trị nguyên của tham số $m$ để hàm số $y = 1/3 x^3 - m x^2 + (m+2)x + 1$ đồng biến trên $RR$.],
  (
    [$3$],
    True([$4$]),
    [$2$],
    [$5$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm: $y' = x^2 - 2m x + m + 2$.]
    #step[Hàm số đồng biến trên $RR <=> y' >= 0, forall x in RR$.]
    #step[Điều này xảy ra khi và chỉ khi $Delta' = m^2 - (m + 2) <= 0 <=> m^2 - m - 2 <= 0 <=> -1 <= m <= 2$.]
    #step[Vì $m in ZZ$ nên $m in {-1; 0; 1; 2}$. Có $4$ giá trị nguyên của $m$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm tập hợp các giá trị của tham số $m$ để hàm số $y = (m x + 4)/(x + m)$ nghịch biến trên từng khoảng xác định của nó.],
  (
    [$[-2; 2]$],
    [$(-oo; -2) union (2; +oo)$],
    True([$(-2; 2)$]),
    [$RR \\ {plus.minus 2}$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR backslash {-m}$.]
    #step[Đạo hàm: $y' = (m dot m - 4)/(x + m)^2 = (m^2 - 4)/(x + m)^2$.]
    #step[Hàm số nghịch biến trên từng khoảng xác định khi và chỉ khi $y' < 0, forall x != -m$.]
    #step[Suy ra $m^2 - 4 < 0 <=> -2 < m < 2$.]
    #step[Vậy tập hợp các giá trị của tham số $m$ là $(-2; 2)$.]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để hàm số $y = x^3 - 3m x^2 + 3(m^2 - 1)x$ có hai điểm cực trị.],
  (
    [$m > 1$],
    [$m < -1$],
    True([$m in RR$]),
    [Không tồn tại $m$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Đạo hàm: $y' = 3x^2 - 6m x + 3(m^2 - 1)$.]
    #step[Hàm số có hai điểm cực trị khi và chỉ khi phương trình $y' = 0$ có hai nghiệm phân biệt.]
    #step[Xét $y' = 0 <=> x^2 - 2m x + m^2 - 1 = 0$.]
    #step[Ta có $Delta' = m^2 - (m^2 - 1) = 1 > 0, forall m in RR$.]
    #step[Vậy phương trình luôn có hai nghiệm phân biệt với mọi $m$.]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số trùng phương $y = x^4 - 2(m-1)x^2 + m - 2$. Tìm tất cả các giá trị của tham số $m$ để hàm số đã cho có đúng một điểm cực trị.],
  (
    [$m < 1$],
    True([$m <= 1$]),
    [$m >= 1$],
    [$m > 1$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Hàm số trùng phương có dạng $y = a x^4 + b x^2 + c$ với $a = 1, b = -2(m-1)$.]
    #step[Hàm số có đúng một điểm cực trị khi và chỉ khi $a dot b >= 0$.]
    #step[Suy ra $1 dot (-2(m-1)) >= 0 <=> m - 1 <= 0 <=> m <= 1$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị của tham số $m$ để hàm số $y = 1/3 x^3 - 1/2 x^2 + m x - 5$ nghịch biến trên một khoảng có độ dài bằng $1$.],
  (
    True([$m = 0$]),
    [$m = 1$],
    [$m = -1$],
    [$m = 2$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Đạo hàm: $y' = x^2 - x + m$.]
    #step[Hàm số nghịch biến trên một khoảng có độ dài bằng $1$ khi phương trình $y' = 0$ có hai nghiệm phân biệt $x_1, x_2$ và $|x_1 - x_2| = 1$.]
    #step[Điều kiện có 2 nghiệm phân biệt: $Delta = 1 - 4m > 0 <=> m < 1/4$.]
    #step[Khoảng cách: $|x_1 - x_2| = 1 <=> (x_1 - x_2)^2 = 1 <=> (x_1 + x_2)^2 - 4x_1 x_2 = 1$.]
    #step[Theo định lý Vi-ét, $x_1 + x_2 = 1$ và $x_1 x_2 = m$. Ta có $1^2 - 4m = 1 <=> 4m = 0 <=> m = 0$ (thỏa mãn).]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để hàm số $y = (m x - 2)/(x + m - 3)$ đồng biến trên khoảng $(1; +oo)$.],
  (
    True([$m > 2$]),
    [$m >= 2$],
    [$m < 1 "hoặc" m > 2$],
    [$1 < m < 2$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR backslash {3 - m}$. Đạo hàm: $y' = (m(m - 3) + 2)/(x + m - 3)^2 = (m^2 - 3m + 2)/(x + m - 3)^2$.]
    #step[Hàm số đồng biến trên khoảng $(1; +oo)$ khi và chỉ khi $y' > 0, forall x in (1; +oo)$ và điểm gián đoạn không thuộc khoảng $(1; +oo)$.]
    #step[Tức là: $cases(m^2 - 3m + 2 > 0, 3 - m <= 1) <=> cases(m < 1 "hoặc" m > 2, m >= 2)$.]
    #step[Kết hợp các điều kiện ta được $m > 2$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = -x^3 + 3x^2 + 3(m^2 - 1)x$. Tìm tất cả các giá trị thực của tham số $m$ để hàm số đồng biến trên khoảng $(1; 2)$.],
  (
    [$-1 < m < 1$],
    True([$m >= 1 "hoặc" m <= -1$]),
    [$m >= 1$],
    [$m <= -1$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Đạo hàm: $y' = -3x^2 + 6x + 3(m^2 - 1) = -3(x^2 - 2x - (m^2 - 1))$.]
    #step[Hàm số đồng biến trên $(1; 2) <=> y' >= 0, forall x in (1; 2)$.]
    #step[Tức là $x^2 - 2x - (m^2 - 1) <= 0 <=> m^2 - 1 >= x^2 - 2x, forall x in (1; 2)$.]
    #step[Xét hàm $g(x) = x^2 - 2x$ trên $(1; 2)$. Đạo hàm $g'(x) = 2x - 2 > 0, forall x in (1; 2)$.]
    #step[Do đó $g(x) < g(2) = 0$. Yêu cầu bài toán trở thành $m^2 - 1 >= 0 <=> m^2 >= 1 <=> m >= 1$ hoặc $m <= -1$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm trùng phương $y = x^4 - 2m x^2 + 3$. Tìm tất cả các giá trị của tham số $m$ để hàm số có ba điểm cực trị tạo thành ba đỉnh của một tam giác đều.],
  (
    [$m = 1$],
    True([$m = root(3, 3)$]),
    [$m = sqrt(3)$],
    [$m = 2$]
  ),
  loigiai: [
    #step[Hàm số có $3$ điểm cực trị $<=> a dot b < 0 <=> -2m < 0 <=> m > 0$.]
    #step[Khi đó, $3$ điểm cực trị tạo thành một tam giác cân. Để tam giác đó là tam giác đều thì $b^3 + 24a = 0$.]
    #step[Thay $a = 1, b = -2m$ vào ta được: $(-2m)^3 + 24(1) = 0 <=> -8m^3 + 24 = 0 <=> m^3 = 3 <=> m = root(3, 3)$.]
    #step[Giá trị này thỏa mãn $m > 0$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = x^3 - 3m x^2 + 4m^3$ có hai điểm cực trị đối xứng nhau qua đường thẳng $y = x$.],
  (
    [$m = plus.minus sqrt(2)$],
    True([$m = plus.minus sqrt(2)/2$]),
    [$m = plus.minus 1$],
    [$m = plus.minus 1/2$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$. Đạo hàm $y' = 3x^2 - 6m x = 0 <=> x = 0$ hoặc $x = 2m$.]
    #step[Để hàm số có $2$ điểm cực trị thì $2m != 0 <=> m != 0$.]
    #step[Khi đó, hai điểm cực trị là $A(0; 4m^3)$ và $B(2m; 0)$. Trung điểm của đoạn $A B$ là $I(m; 2m^3)$.]
    #step[Điều kiện để $A, B$ đối xứng nhau qua đường thẳng $d: y = x$ (hay $x - y = 0$) là trung điểm $I in d$ và $A B perp d$.]
    #step[$I in d <=> m - 2m^3 = 0 <=> m(1 - 2m^2) = 0 => m^2 = 1/2 <=> m = plus.minus sqrt(2)/2$.]
    #step[Kiểm tra điều kiện vuông góc: vector chỉ phương của $d$ là $arrow(u) = (1; 1)$. Ta có $arrow(A B) = (2m; -4m^3)$. Tích vô hướng $arrow(A B) dot arrow(u) = 2m - 4m^3 = 2m(1 - 2m^2) = 0$, thỏa mãn.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị thực của tham số $m$ để hàm số $y = x^3 - 3(m+1)x^2 + 3m(m+2)x$ đạt cực tiểu tại điểm $x = 2$.],
  (
    True([$m = 0$]),
    [$m = 2$],
    [$m = -2$],
    [$m = 1$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = 3x^2 - 6(m+1)x + 3m(m+2)$. Đạo hàm bậc hai $y'' = 6x - 6(m+1)$.]
    #step[Hàm số đạt cực tiểu tại $x = 2$ suy ra $y'(2) = 0$ và $y''(2) > 0$.]
    #step[Ta có $y'(2) = 12 - 12(m+1) + 3m^2 + 6m = 3m^2 - 6m = 0 <=> m = 0$ hoặc $m = 2$.]
    #step[Với $m = 0$, $y''(2) = 12 - 6 = 6 > 0$, hàm số đạt cực tiểu (Thỏa mãn).]
    #step[Với $m = 2$, $y''(2) = 12 - 18 = -6 < 0$, hàm số đạt cực đại (Loại).]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để hàm số $y = ln(x^2 + 1) - m x + 2$ đồng biến trên $RR$.],
  (
    [$9$],
    True([$10$]),
    [$11$],
    [$21$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = (2x)/(x^2 + 1) - m$. Hàm số đồng biến trên $RR <=> y' >= 0, forall x in RR$.]
    #step[Tức là $m <= (2x)/(x^2 + 1), forall x in RR <=> m <= min ((2x)/(x^2 + 1))$.]
    #step[Xét hàm $g(x) = (2x)/(x^2 + 1)$. Ta dễ dàng chứng minh được $(x + 1)^2 >= 0 <=> x^2 + 1 >= -2x <=> (2x)/(x^2 + 1) >= -1$, đạt giá trị nhỏ nhất bằng $-1$ khi $x = -1$.]
    #step[Suy ra $m <= -1$.]
    #step[Do $m in [-10; 10]$ và $m in ZZ$ nên $m in {-10; -9; ... ; -1}$. Có tất cả $10$ giá trị nguyên.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = e^x (x^2 - m x + 1)$. Tìm tập hợp các giá trị của tham số $m$ để hàm số đã cho không có điểm cực trị.],
  (
    True([$m = 0$]),
    [$m >= 0$],
    [$m <= 0$],
    [Không tồn tại $m$]
  ),
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = e^x(x^2 - m x + 1) + e^x(2x - m) = e^x(x^2 + (2-m)x + 1 - m)$.]
    #step[Hàm số không có điểm cực trị khi phương trình $y' = 0$ không có hai nghiệm phân biệt đổi dấu.]
    #step[Tức là $x^2 + (2-m)x + 1 - m = 0$ vô nghiệm hoặc có nghiệm kép $=> Delta <= 0$.]
    #step[Ta có $Delta = (2-m)^2 - 4(1-m) = 4 - 4m + m^2 - 4 + 4m = m^2$.]
    #step[Để $Delta <= 0 <=> m^2 <= 0 <=> m = 0$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)



#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Cho hàm số $y = (x^2 - 2m x + m)/(x - m)$ có đồ thị là $(C_m)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Với $m = 2$, hàm số đạt cực đại tại $x = 0$.]),
    True([Tập xác định của hàm số với mọi $m$ là $D = RR \\ {m}$.]),
    [Với mọi $m != 0$, hàm số luôn có hai điểm cực trị.],
    True([Đường thẳng đi qua hai điểm cực trị của đồ thị hàm số vuông góc với đường thẳng $y = x$.])
  ),
  loigiai: [
    #step[Đạo hàm: $y' = ((2x - 2m)(x - m) - (x^2 - 2m x + m))/(x - m)^2 = (x^2 - 2m x + 2m^2 - m)/(x - m)^2$.]
    #step[a) Với $m = 2$, ta có $y' = (x^2 - 4x + 6)/(x - 2)^2 > 0 forall x != 2$. Hàm số luôn đồng biến, không có cực đại tại $x = 0$. Mệnh đề a) Sai.]
    #step[b) Mẫu số là $x - m != 0 => x != m$. Tập xác định là $D = RR backslash {m}$. Mệnh đề b) Đúng.]
    #step[c) Phương trình tử số $y' = 0$ có $Delta' = m^2 - (2m^2 - m) = m - m^2 = m(1 - m)$. Để hàm số có hai điểm cực trị thì $Delta' > 0 <=> 0 < m < 1$. Do đó không phải "với mọi $m != 0$". Mệnh đề c) Sai.]
    #step[d) Phương trình đường thẳng đi qua hai điểm cực trị là $y = (u')/(v') = (2x - 2m)/1 = 2x - 2m$. Đường thẳng này có hệ số góc bằng $2$. Đường thẳng $y = x$ có hệ số góc bằng $1$. Tích hai hệ số góc $2 dot 1 = 2 != -1$ nên chúng không vuông góc. Mệnh đề d) Sai.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số bậc ba $y = x^3 - 3m x^2 + 3(m^2 - 1)x - m^3 + m$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đạo hàm của hàm số đã cho là $y' = 3(x-m)^2 - 3$.]),
    True([Với mọi giá trị của tham số $m$, hàm số luôn có hai điểm cực trị.]),
    True([Khoảng cách giữa hai điểm cực trị của đồ thị hàm số bằng $2sqrt(5)$.]),
    [Điểm uốn của đồ thị hàm số nằm trên trục hoành với mọi giá trị của $m$.]
  ),
  loigiai: [
    #step[a) Đạo hàm: $y' = 3x^2 - 6m x + 3(m^2 - 1) = 3(x^2 - 2m x + m^2 - 1) = 3((x - m)^2 - 1) = 3(x - m)^2 - 3$. Mệnh đề a) Đúng.]
    #step[b) Ta có $y' = 0 <=> (x - m)^2 = 1 <=> x = m - 1$ hoặc $x = m + 1$. Phương trình luôn có hai nghiệm phân biệt với mọi $m$, nên hàm số luôn có hai điểm cực trị. Mệnh đề b) Đúng.]
    #step[c) Tọa độ hai điểm cực trị: $A(m - 1; -2m + 2)$ và $B(m + 1; -2m - 2)$. Khoảng cách $A B = sqrt(2^2 + (-4)^2) = sqrt(20) = 2sqrt(5)$. Mệnh đề c) Đúng.]
    #step[d) Đạo hàm cấp 2: $y'' = 6(x - m)$. $y'' = 0 <=> x = m$. Điểm uốn $I(m; -2m)$. Điểm uốn nằm trên trục hoành khi $-2m = 0 <=> m = 0$. Do đó mệnh đề "với mọi giá trị của $m$" là Sai.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = (m ln x - 2)/(ln x - m + 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Với $m = 2$, hàm số đồng biến trên khoảng $(e; +oo)$.]),
    True([Điều kiện để hàm số xác định trên khoảng $(e; +oo)$ là $m <= 2$.]),
    [Tập hợp các giá trị của $m$ để hàm số đồng biến trên khoảng $(e; +oo)$ là $m > 2$.],
    [Với $m = 3$, hàm số đạt giá trị cực tiểu tại $x = e$.]
  ),
  loigiai: [
    #step[Đặt $t = ln x$. Khi $x in (e; +oo)$ thì $t in (1; +oo)$. Hàm số trở thành $y = (m t - 2)/(t - m + 1)$.]
    #step[Đạo hàm $y'_t = (m(-m+1) - (-2))/(t - m + 1)^2 = (-m^2 + m + 2)/(t - m + 1)^2$.]
    #step[a) Với $m = 2$, hàm số trở thành $y = (2t - 2)/(t - 1) = 2$ (hàm hằng). Hàm số không đồng biến. Mệnh đề a) Sai.]
    #step[b) Điều kiện để hàm số xác định trên $(1; +oo)$ là nghiệm của mẫu $t = m - 1$ không thuộc khoảng $(1; +oo)$, tức là $m - 1 <= 1 <=> m <= 2$. Mệnh đề b) Đúng.]
    #step[c) Hàm số ban đầu đồng biến trên $(e; +oo)$ khi và chỉ khi hàm theo $t$ đồng biến trên $(1; +oo)$. Điều kiện: $cases(-m^2 + m + 2 > 0, m <= 2) <=> cases(-1 < m < 2, m <= 2) <=> -1 < m < 2$. Do đó mệnh đề c) Sai.]
    #step[d) Với $m = 3$, $y'_t = (-9+3+2)/(...) = -4 < 0$, hàm số nghịch biến trên từng khoảng xác định nên không thể có cực tiểu. Mệnh đề d) Sai.]
    #resetstep()
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = x(x-1)^2 (x^2 - m x + m)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Với $m = 4$, hàm số $y = f(x)$ có đúng $1$ điểm cực trị.]),
    True([Với mọi $m < 0$, hàm số $y = f(x)$ có đúng $3$ điểm cực trị.]),
    [Có đúng $4$ giá trị nguyên của tham số $m$ để hàm số $y = f(x)$ có đúng $1$ điểm cực trị.],
    True([Hàm số $y = f(x)$ có đúng $2$ điểm cực trị khi $m = 0$.])
  ),
  loigiai: [
    #step[a) Với $m = 4$, $f'(x) = x(x-1)^2 (x^2 - 4x + 4) = x(x-1)^2 (x-2)^2$. Nghiệm bội lẻ duy nhất là $x = 0$, nên hàm số có đúng $1$ điểm cực trị. Mệnh đề a) Đúng.]
    #step[b) Với $m < 0$, tam thức $x^2 - m x + m = 0$ có $Delta = m^2 - 4m > 0$. Phương trình này sinh ra hai nghiệm phân biệt khác $0$ và khác $1$. Kết hợp với nghiệm $x=0$, $f'(x)$ có $3$ nghiệm bội lẻ, suy ra có $3$ cực trị. Mệnh đề b) Đúng.]
    #step[c) Hàm số có đúng $1$ cực trị khi $x^2 - m x + m = 0$ vô nghiệm, có nghiệm kép hoặc có nghiệm bằng $0$. Điều này tương đương với $Delta <= 0 <=> 0 <= m <= 4$. Vì $m$ nguyên nên $m in {0, 1, 2, 3, 4}$, có tất cả $5$ giá trị. Mệnh đề c) Sai.]
    #step[d) Với $m = 0$, $f'(x) = x(x-1)^2 x^2 = x^3 (x-1)^2$. Nghiệm bội lẻ duy nhất là $x = 0$, suy ra hàm số có $1$ điểm cực trị. Mệnh đề d) Sai.]
    #resetstep()
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Tìm số giá trị nguyên của tham số $m in [-5; 5]$ để hàm số $y = (m x - 4)/(x - m)$ đồng biến trên khoảng $(1; +oo)$.],
  [$3$],
  loigiai: [
    #step[Tập xác định: $D = RR backslash {m}$. Đạo hàm: $y' = (-m^2 + 4)/(x - m)^2$.]
    #step[Hàm số đồng biến trên khoảng $(1; +oo)$ khi và chỉ khi $y' > 0$ và $m !in (1; +oo)$.]
    #step[Tức là $cases(-m^2 + 4 > 0, m <= 1) <=> cases(-2 < m < 2, m <= 1) <=> -2 < m <= 1$.]
    #step[Do $m$ nguyên nên $m in {-1; 0; 1}$. Có $3$ giá trị của $m$.]
    #step[Kết luận: $3$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = x^3 - 3m x^2 + 3(m^2 - 1)x - m^3 + m$. Gọi $S$ là tập hợp tất cả các giá trị thực của tham số $m$ để hai điểm cực trị của đồ thị hàm số cùng với gốc tọa độ $O$ tạo thành một tam giác vuông tại $O$. Tìm số phần tử của tập hợp $S$.],
  [$2$],
  loigiai: [
    #step[Tọa độ hai điểm cực trị của hàm số là $A(m-1; -2m+2)$ và $B(m+1; -2m-2)$.]
    #step[Tam giác $O A B$ vuông tại $O <=> arrow(O A) dot arrow(O B) = 0$.]
    #step[Ta có $arrow(O A) = (m-1; -2m+2)$ và $arrow(O B) = (m+1; -2m-2)$.]
    #step[Suy ra $(m-1)(m+1) + (-2m+2)(-2m-2) = 0 <=> (m^2 - 1) + 4(m^2 - 1) = 0 <=> 5(m^2 - 1) = 0$.]
    #step[Giải phương trình trên ta được $m = 1$ hoặc $m = -1$. Tập hợp $S$ có $2$ phần tử.]
    #step[Kết luận: $2$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị nguyên của tham số $m$ để hàm số $y = 1/3 x^3 - m x^2 + (m+2)x - 3$ có hai điểm cực trị $x_1, x_2$ thỏa mãn $x_1^2 + x_2^2 = 16$.],
  [$-2$],
  loigiai: [
    #step[Đạo hàm $y' = x^2 - 2m x + m + 2$.]
    #step[Để hàm số có hai điểm cực trị thì phương trình $y' = 0$ có hai nghiệm phân biệt $x_1, x_2 <=> Delta' = m^2 - m - 2 > 0 <=> m < -1$ hoặc $m > 2$.]
    #step[Theo định lý Vi-ét: $x_1 + x_2 = 2m$ và $x_1 x_2 = m + 2$.]
    #step[Theo giả thiết $x_1^2 + x_2^2 = 16 <=> (x_1 + x_2)^2 - 2x_1 x_2 = 16$.]
    #step[Thay vào ta được: $4m^2 - 2(m + 2) = 16 <=> 4m^2 - 2m - 20 = 0 <=> 2m^2 - m - 10 = 0$.]
    #step[Phương trình có nghiệm $m = 5/2$ và $m = -2$.]
    #step[Do $m$ nguyên nên $m = -2$. Kiểm tra lại, $m = -2 < -1$ (thỏa mãn).]
    #step[Kết luận: $-2$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Có bao nhiêu giá trị nguyên của tham số $m in [-10; 10]$ để hàm số $y = x^4 - 2(m+1)x^2 + 2026$ có ba điểm cực trị?],
  [$11$],
  loigiai: [
    #step[Hàm số $y = a x^4 + b x^2 + c$ có ba điểm cực trị khi và chỉ khi $a dot b < 0$.]
    #step[Ta có $1 dot (-2(m+1)) < 0 <=> m + 1 > 0 <=> m > -1$.]
    #step[Kết hợp điều kiện $m in [-10; 10]$ và $m$ nguyên, ta được $m in {0; 1; 2; ...; 10}$.]
    #step[Có tất cả $11$ giá trị nguyên của $m$.]
    #step[Kết luận: $11$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Tìm số các giá trị nguyên của tham số $m in [-10; 10]$ để hàm số $y = |x^3 - 3m x^2 + 3(m^2 - 1)x|$ có đúng $5$ điểm cực trị.],
  [$1$],
  loigiai: [
    #step[Xét $f(x) = x^3 - 3m x^2 + 3(m^2 - 1)x$. Có $f'(x) = 3x^2 - 6m x + 3(m^2 - 1)$.]
    #step[Ta có $f'(x) = 0 <=> x = m - 1$ hoặc $x = m + 1$. Hàm số $f(x)$ luôn có $2$ điểm cực trị.]
    #step[Để hàm số $y = |f(x)|$ có đúng $5$ cực trị thì đồ thị hàm số $f(x)$ phải cắt trục hoành tại $3$ điểm phân biệt.]
    #step[Điều này tương đương với $f(x_("CĐ")) dot f(x_("CT")) < 0 <=> f(m-1) dot f(m+1) < 0$.]
    #step[Ta tính được $f(m-1) = (m-1)^2 (m+2)$ và $f(m+1) = (m+1)^2 (m-2)$.]
    #step[Vậy $(m-1)^2 (m+2) (m+1)^2 (m-2) < 0 <=> cases(m != plus.minus 1, (m+2)(m-2) < 0) <=> cases(m != plus.minus 1, -2 < m < 2)$.]
    #step[Các giá trị nguyên của $m$ là $m = 0$. Vậy có đúng $1$ giá trị.]
    #step[Kết luận: $1$.]
    #resetstep()
  ]
)

#tln(
  dir: "ngang",
  [Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để hàm số $y = (x-2)e^(m x)$ đồng biến trên khoảng $(0; +oo)$.],
  [$1$],
  loigiai: [
    #step[Tập xác định: $D = RR$.]
    #step[Đạo hàm $y' = 1 dot e^(m x) + (x - 2) dot m e^(m x) = e^(m x)(m x - 2m + 1)$.]
    #step[Hàm số đồng biến trên khoảng $(0; +oo) <=> y' >= 0, forall x > 0 <=> m x - 2m + 1 >= 0, forall x > 0$.]
    #step[Xét hàm bậc nhất $g(x) = m x - 2m + 1$. Để $g(x) >= 0$ với mọi $x > 0$ thì cần $cases(m >= 0, g(0) >= 0) <=> cases(m >= 0, -2m + 1 >= 0) <=> 0 <= m <= 1/2$.]
    #step[Vì $m$ là số nguyên nên $m = 0$. Có đúng $1$ giá trị nguyên thỏa mãn.]
    #step[Kết luận: $1$.]
    #resetstep()
  ]
)
