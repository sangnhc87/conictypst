#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#muc([Đề Luyện Tập Số 03 — Tham Số Trong Bài Toán Tiệm Cận])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (10 câu)], count: 10)

#tn(
  dir: "ngang",
  [Giá trị $m$ để đường tiệm cận đứng của đồ thị hàm số $y = (2x + 2m - 1)/(x + m)$ đi qua điểm $M(3; 1)$ là],
  (
    True([$m = -3$.]),
    [$m = -1$.],
    [$m = 2$.],
    [$m = 3$.]
  ),
  loigiai: [
    #step[Điều kiện để đồ thị hàm số có tiệm cận đứng là $x = -m$ không phải là nghiệm của tử số, tức là $2(-m) + 2m - 1 != 0 <=> -1 != 0$ (luôn đúng).]
    #step[Do đó, phương trình tiệm cận đứng là $x = -m$.]
    #step[Tiệm cận đứng đi qua điểm $M(3; 1)$ nên $x_M = -m <=> 3 = -m <=> m = -3$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = (2x + 4)/(x - m)$ có tiệm cận đứng.],
  (
    [$m > -2$.],
    [$m = -2$.],
    [$m < -2$.],
    True([$m != -2$.])
  ),
  loigiai: [
    #step[Để đồ thị hàm phân thức bậc 1 / bậc 1 có tiệm cận đứng thì nghiệm của mẫu không được làm triệt tiêu tử số (không là nghiệm của tử).]
    #step[Nghiệm của mẫu là $x = m$.]
    #step[Thay $x = m$ vào tử số ta được: $2m + 4 != 0 <=> m != -2$.]
  ]
)

#tn(
  dir: "ngang",
  [Số các giá trị nguyên của tham số $m$ thuộc $[-20; 20]$ để đồ thị hàm số $y = (2x + 4)/(x - m)$ có đường tiệm cận đứng nằm bên trái trục tung là],
  (
    [$20$.],
    True([$19$.]),
    [$21$.],
    [$18$.]
  ),
  loigiai: [
    #step[Để đồ thị có tiệm cận đứng thì $m != -2$. Khi đó tiệm cận đứng là $x = m$.]
    #step[Để tiệm cận đứng nằm bên trái trục tung thì $m < 0$.]
    #step[Kết hợp điều kiện, ta có $m < 0$ và $m != -2$.]
    #step[Vì $m in ZZ$ và $m in [-20; 20]$ nên $m in {-20, -19, ..., -3, -1}$.]
    #step[Số lượng giá trị của $m$ là $20 - 1 = 19$ giá trị.]
  ]
)

#tn(
  dir: "ngang",
  [Có bao nhiêu giá trị nguyên $m in [-10; 10]$ sao cho đồ thị hàm số $y = (x - 1)/(x^2 + 4x - m - 3)$ có đúng hai đường tiệm cận đứng?],
  (
    [$19$.],
    [$15$.],
    True([$16$.]),
    [$17$.]
  ),
  loigiai: [
    #step[Để đồ thị có đúng 2 tiệm cận đứng thì phương trình mẫu số $g(x) = x^2 + 4x - m - 3 = 0$ phải có 2 nghiệm phân biệt khác $1$.]
    #step[Điều kiện 1: $Delta' > 0 <=> 2^2 - 1(-m - 3) > 0 <=> 4 + m + 3 > 0 <=> m > -7$.]
    #step[Điều kiện 2: $g(1) != 0 <=> 1^2 + 4(1) - m - 3 != 0 <=> 2 - m != 0 <=> m != 2$.]
    #step[Vậy $m > -7$ và $m != 2$.]
    #step[Do $m in [-10; 10]$ và $m in ZZ$ nên $m in {-6, -5, ..., 1, 3, ..., 10}$.]
    #step[Số lượng giá trị là $(10 - (-6) + 1) - 1 = 17 - 1 = 16$.]
  ]
)

#tn(
  dir: "ngang",
  [Biết đồ thị hàm số $y = ((2m - n)x^2 + m x + 1)/(x^2 + m x + n - 6)$ nhận trục hoành và trục tung làm hai đường tiệm cận. Giá trị $m + n$ là],
  (
    [$8$.],
    True([$9$.]),
    [$6$.],
    [$-6$.]
  ),
  loigiai: [
    #step[Trục hoành là đường thẳng $y = 0$. Để TCN là $y = 0$ thì giới hạn khi $x -> oo$ phải bằng 0. Do tử và mẫu đều có bậc tối đa là 2, hệ số của $x^2$ ở tử phải bằng 0: $2m - n = 0 <=> n = 2m$.]
    #step[Khi đó hàm số trở thành $y = (m x + 1)/(x^2 + m x + 2m - 6)$.]
    #step[Trục tung là đường thẳng $x = 0$. Để $x = 0$ là TCĐ thì $x = 0$ phải là nghiệm của mẫu số $=> 0^2 + m(0) + 2m - 6 = 0 <=> 2m - 6 = 0 <=> m = 3$.]
    #step[Từ đó $n = 2(3) = 6$.]
    #step[Thử lại với $m=3, n=6$: $y = (3x + 1)/(x^2 + 3x)$. Mẫu có nghiệm $x=0, x=-3$. Tại $x=0$ tử số bằng 1 $!=0$ nên $x=0$ đúng là TCĐ. TCN là $y=0$ đúng.]
    #step[Vậy $m + n = 3 + 6 = 9$.]
  ]
)

#tn(
  dir: "ngang",
  [Số giá trị nguyên của tham số $m$ sao cho đồ thị hàm số $y = sqrt(x + 1)/(x^2 - 2x + m)$ có đúng ba đường tiệm cận là:],
  (
    [$5$.],
    [Vô số.],
    True([$4$.]),
    [$3$.]
  ),
  loigiai: [
    #step[Tập xác định: $x >= -1$ và $x^2 - 2x + m != 0$.]
    #step[Xét TCN: $limits(lim)_(x -> +oo) sqrt(x + 1)/(x^2 - 2x + m) = 0$. Luôn có 1 TCN là $y = 0$.]
    #step[Để đồ thị có đúng 3 đường tiệm cận thì cần có đúng 2 TCĐ. Tức là phương trình $g(x) = x^2 - 2x + m = 0$ phải có 2 nghiệm phân biệt thỏa mãn điều kiện $x >= -1$ (để nằm trong TXĐ) và không triệt tiêu hoàn toàn căn ở tử số.
    Chú ý: Tại $x = -1$, tử số bằng $0$. Nếu $x=-1$ là nghiệm của mẫu (tức $g(-1)=0 <=> m=-3$) thì $g(x) = x^2 - 2x - 3 = (x+1)(x-3)$. Khi đó $y = sqrt(x+1)/((x+1)(x-3)) = 1/(sqrt(x+1)(x-3))$. Lân cận $x=-1^+$, $y -> -oo$, nên $x=-1$ vẫn là TCĐ!
    Vậy chỉ cần $g(x)=0$ có 2 nghiệm phân biệt lớn hơn hoặc bằng $-1$.]
    #step[Điều kiện 1: $Delta' = 1 - m > 0 <=> m < 1$.]
    #step[Điều kiện 2: Hai nghiệm $x_1 < x_2$. Cần $x_1 >= -1 <=> cases(x_1 + x_2 > -2, (x_1 + 1)(x_2 + 1) >= 0) <=> cases(2 > -2 " (luôn đúng)", x_1 x_2 + (x_1 + x_2) + 1 >= 0) <=> m + 2 + 1 >= 0 <=> m >= -3$.]
    #step[Kết hợp điều kiện: $-3 <= m < 1$. Mà $m in ZZ$ nên $m in {-3, -2, -1, 0}$.]
    #step[Có $4$ giá trị nguyên của $m$.]
  ]
)

#tn(
  dir: "ngang",
  [Có bao nhiêu giá trị nguyên dương của tham số $m$ để đồ thị hàm số $y = (x^2 - 4x + 3)/(x^2 - m x + 4)$ có đúng một đường tiệm cận đứng?],
  (
    [$1$.],
    [$3$.],
    True([$2$.]),
    [$4$.]
  ),
  loigiai: [
    #step[Tử số có nghiệm $x = 1$ và $x = 3$.]
    #step[Để đồ thị có đúng 1 TCĐ, phương trình mẫu $g(x) = x^2 - m x + 4 = 0$ (1) có thể xảy ra các trường hợp sau:]
    #step[- TH1: (1) có nghiệm kép khác nghiệm tử.
    $Delta = m^2 - 16 = 0 <=> m = 4$ hoặc $m = -4$. 
    Vì đề yêu cầu $m$ nguyên dương nên $m = 4$. Khi đó nghiệm kép là $x = 2$ (khác 1 và 3). Thỏa mãn. Có 1 TCĐ là $x=2$.]
    #step[- TH2: (1) có 2 nghiệm phân biệt, trong đó có một nghiệm trùng với nghiệm tử và bị triệt tiêu hoàn toàn, nghiệm còn lại khác nghiệm tử.
    Nếu $x = 1$ là nghiệm của (1) thì $1 - m + 4 = 0 <=> m = 5$. 
    Khi $m=5$, mẫu là $x^2 - 5x + 4 = (x-1)(x-4)$. 
    $y = ((x-1)(x-3))/((x-1)(x-4)) = (x-3)/(x-4)$ (với $x != 1$). TCĐ duy nhất là $x = 4$. Thỏa mãn $m=5$.]
    #step[- TH3: Nếu $x = 3$ là nghiệm của (1) thì $9 - 3m + 4 = 0 <=> m = 13/3$ (loại vì không nguyên).]
    #step[Vậy $m in {4, 5}$. Có $2$ giá trị nguyên dương.]
  ]
)

#tn(
  dir: "ngang",
  [Cho hàm số $y = (x - 2)/(x^2 - 2m x + m + 2)$. Biết đồ thị hàm số không có đường tiệm cận đứng khi $m in (a; b)$. Giá trị của $a b$ là],
  (
    [$-3$.],
    True([$-2$.]),
    [$2$.],
    [$0$.]
  ),
  loigiai: [
    #step[Để đồ thị hàm phân thức có bậc tử là 1, bậc mẫu là 2 không có đường tiệm cận đứng, thì phương trình mẫu số $g(x) = x^2 - 2m x + m + 2 = 0$ phải vô nghiệm hoặc có nghiệm kép $x = 2$.]
    #step[Trường hợp 1: $g(x) = 0$ vô nghiệm.
    $Delta' = m^2 - (m + 2) < 0 <=> m^2 - m - 2 < 0 <=> -1 < m < 2$.]
    #step[Trường hợp 2: $g(x) = 0$ có nghiệm kép $x = 2$.
    $g(x) = (x - 2)^2 = x^2 - 4x + 4$.
    Đồng nhất hệ số: $cases(-2m = -4 => m = 2, m + 2 = 4 => m = 2)$.
    Vậy $m = 2$ thỏa mãn. (Khi đó $y = (x - 2)/(x - 2)^2 = 1/(x - 2)$, hàm số có TCĐ $x = 2$, vậy m = 2 KHÔNG thỏa mãn yêu cầu là không có TCĐ! Tại nghiệm kép nó triệt tiêu 1 bậc và còn dư 1 bậc ở mẫu. Do đó đồ thị vẫn có TCĐ).
    Nên trường hợp 2 không thỏa mãn.]
    #step[Vậy khoảng giá trị của $m$ là $(-1; 2)$.]
    #step[Suy ra $a = -1$, $b = 2 => a b = -2$.]
  ]
)

#tn(
  dir: "ngang",
  [Tìm số lượng các giá trị nguyên dương của tham số $m$ để đồ thị hàm số $y = (m x^3 + x - 1)/(x^2 + x - 2)$ có tiệm cận xiên.],
  (
    [$0$.],
    [$1$.],
    True([Vô số.]),
    [Các đáp án trên đều sai.]
  ),
  loigiai: [
    #step[Để đồ thị hàm phân thức có đường tiệm cận xiên thì bậc của tử phải lớn hơn bậc của mẫu đúng 1 bậc.]
    #step[Mẫu có bậc 2, tử số có dạng $m x^3 + x - 1$.]
    #step[Nếu $m != 0$, tử số có bậc 3. Do $3 - 2 = 1$, hàm số sẽ có tiệm cận xiên.]
    #step[Đề hỏi $m$ nguyên dương nên $m in {1, 2, 3, ...}$, tức là có vô số giá trị $m$.]
  ]
)

#tn(
  dir: "ngang",
  [Biết rằng với mọi giá trị của tham số $m != 0$, đường tiệm cận xiên của đồ thị hàm số $y = (m x^2 + (m - 1)x - 2)/(x + 1)$ luôn đi qua một điểm cố định $I(x_0; y_0)$. Tính $x_0 + y_0$.],
  (
    [$-2$.],
    [$0$.],
    [$1$.],
    True([$-1$.])
  ),
  loigiai: [
    #step[Chia đa thức: $m x^2 + (m - 1)x - 2 = m x(x + 1) - x - 2 = m x(x + 1) - 1(x + 1) - 1$.]
    #step[Hàm số viết lại thành $y = m x - 1 - 1/(x + 1)$.]
    #step[Đường tiệm cận xiên là $d: y = m x - 1$.]
    #step[Để $d$ luôn đi qua điểm $I(x_0; y_0)$ cố định với mọi $m$, ta có $y_0 = m x_0 - 1 <=> m x_0 - (y_0 + 1) = 0, forall m$.]
    #step[Điều này xảy ra khi và chỉ khi $cases(x_0 = 0, y_0 + 1 = 0) <=> cases(x_0 = 0, y_0 = -1)$.]
    #step[Điểm cố định là $I(0; -1)$.]
    #step[Vậy $x_0 + y_0 = 0 + (-1) = -1$.]
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm Đúng/Sai (4 câu)], count: 4)

#ds(
  dir: "doc",
  [Cho hàm số $y = (m x^2 + 2x - 1)/(x - 2)$ với $m$ là tham số. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Khi $m = 0$, đồ thị hàm số có tiệm cận xiên.],
    True([Khi $m = 1$, đường tiệm cận xiên của đồ thị có phương trình $y = x + 4$.]),
    [Mọi $m != 0$, đồ thị hàm số luôn có một đường tiệm cận đứng là $x = 2$.],
    True([Tồn tại giá trị của $m$ để tiệm cận xiên vuông góc với đường thẳng $y = x$.])
  ),
  loigiai: [
    #step[a) Khi $m = 0$, $y = (2x - 1)/(x - 2)$. Bậc tử bằng bậc mẫu, đồ thị có TCN $y = 2$, không có TCX. (Sai)]
    #step[b) Khi $m = 1$, $y = (x^2 + 2x - 1)/(x - 2) = (x(x - 2) + 4x - 1)/(x - 2) = (x(x - 2) + 4(x - 2) + 7)/(x - 2) = x + 4 + 7/(x - 2)$. Tiệm cận xiên là $y = x + 4$. (Đúng)]
    #step[c) Tại $x = 2$, tử số là $4m + 4 - 1 = 4m + 3$. Để $x = 2$ không là TCĐ thì $4m + 3 = 0 <=> m = -3/4$. Do đó với $m = -3/4 != 0$, đồ thị KHÔNG có TCĐ. (Sai)]
    #step[d) Khi $m != 0$, chia đa thức: $m x^2 + 2x - 1 = m x(x - 2) + (2m + 2)x - 1 = m x(x - 2) + (2m + 2)(x - 2) + 4m + 3$.
    Phương trình TCX là $y = m x + 2m + 2$.
    Để TCX vuông góc với $y = x$, tích hệ số góc phải bằng $-1 <=> m dot 1 = -1 <=> m = -1$. Có tồn tại. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Cho hàm số $y = sqrt(x^2 - m x + 1) - x$. Xét tính đúng sai của các mệnh đề:],
  (
    [Khi $m = 0$, đồ thị hàm số có hai đường tiệm cận ngang.],
    True([Khi $m = 2$, đồ thị hàm số có tiệm cận ngang $y = -1$.]),
    True([Đồ thị hàm số luôn có tiệm cận xiên khi $x -> -oo$.]),
    [Đồ thị hàm số có thể có tiệm cận đứng với một số giá trị $m$.]
  ),
  loigiai: [
    #step[a) Khi $m = 0$, $y = sqrt(x^2 + 1) - x$. 
    Khi $x -> +oo$, $y = (x^2 + 1 - x^2)/(sqrt(x^2 + 1) + x) = 1/(sqrt(x^2 + 1) + x) -> 0$. TCN $y = 0$.
    Khi $x -> -oo$, $y -> +oo - (-oo) = +oo$ nên không có TCN. Chỉ có 1 TCN $y=0$. (Sai)]
    #step[b) Khi $m = 2$, $y = sqrt(x^2 - 2x + 1) - x = |x - 1| - x$.
    Khi $x -> +oo$, $x > 1 => y = x - 1 - x = -1$. TCN là $y = -1$. (Đúng)]
    #step[c) Xét khi $x -> -oo$, ta có $y = sqrt(x^2(1 - m/x + 1/x^2)) - x = |x| sqrt(1 - m/x + 1/x^2) - x$.
    Do $x < 0$, $|x| = -x$.
    $y = -x sqrt(1 - m/x + 1/x^2) - x = -x (sqrt(1 - m/x + 1/x^2) + 1)$.
    Giới hạn $y/x = - (1 + 1) = -2$.
    $limits(lim)_(x -> -oo) (y - (-2x)) = limits(lim)_(x -> -oo) (sqrt(x^2 - m x + 1) + x) = limits(lim)_(x -> -oo) (-m x + 1)/(sqrt(x^2 - m x + 1) - x) = limits(lim)_(x -> -oo) (-m + 1/x)/(-sqrt(1 - m/x + 1/x^2) - 1) = (-m)/(-2) = m/2$.
    Vậy khi $x -> -oo$, đồ thị luôn có TCX là $y = -2x + m/2$. (Đúng)]
    #step[d) Hàm số không có mẫu số chứa ẩn $x$ (hoặc nói cách khác, nó liên tục trên TXĐ), tập xác định chỉ loại bỏ khoảng nếu biểu thức trong căn âm. Tại các biên, giới hạn bằng 0 hữu hạn. Nên hàm số KHÔNG BAO GIỜ có tiệm cận đứng. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Cho đồ thị hàm số $y = (x^2 - m^2)/(x - m)$. Xét tính đúng sai:],
  (
    [Đồ thị hàm số có đường tiệm cận đứng là $x = m$.],
    True([Hàm số này có đồ thị là một đường thẳng bị khuyết một điểm.]),
    [Hàm số có cực trị khi $m != 0$.],
    [Đồ thị có tiệm cận xiên $y = x + m$.]
  ),
  loigiai: [
    #step[a) Tập xác định $x != m$. Rút gọn $y = ((x - m)(x + m))/(x - m) = x + m$.
    Giới hạn tại $x = m$ là $limits(lim)_(x -> m) y = 2m$ hữu hạn. Do đó đồ thị không có tiệm cận đứng. (Sai)]
    #step[b) Đồ thị là đường thẳng $y = x + m$ khuyết đi điểm $(m; 2m)$. (Đúng)]
    #step[c) Đạo hàm $y' = 1 > 0$ với mọi $x != m$. Hàm số đồng biến và không có cực trị. (Sai)]
    #step[d) Vì đồ thị là đường thẳng bị khuyết 1 điểm nên không có tiệm cận (xiên hay ngang). Tiệm cận chỉ dành cho sự tiệm cận tiến vô hạn. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Gọi $S$ là tập hợp các giá trị của tham số $m$ để đồ thị hàm số $y = (x^2 - m x - 2 m^2)/(x - 2)$ có đường tiệm cận xiên và đường tiệm cận xiên này cách điểm $A(1; 1)$ một khoảng bằng $1/sqrt(2)$. Xét tính đúng sai:],
  (
    [Tập $S$ có đúng hai phần tử.],
    [Tổng các phần tử của $S$ bằng $1$.],
    True([Các phần tử của $S$ đều là số nguyên.]),
    [Đường thẳng $y = x$ là một trong các tiệm cận xiên của các hàm số tương ứng.]
  ),
  loigiai: [
    #step[Điều kiện có TCX: $x = 2$ không là nghiệm của tử $=> 4 - 2m - 2m^2 != 0 <=> m^2 + m - 2 != 0 <=> m != 1$ và $m != -2$.]
    #step[Chia đa thức: $x^2 - m x - 2 m^2 = x(x - 2) + (2 - m)x - 2m^2 = x(x - 2) + (2 - m)(x - 2) + 4 - 2m - 2m^2$.
    TCX $d: y = x + 2 - m <=> x - y + 2 - m = 0$.]
    #step[Khoảng cách từ $A(1; 1)$ đến $d$: $d(A, d) = |1 - 1 + 2 - m|/sqrt(1^2 + (-1)^2) = |2 - m|/sqrt(2)$.]
    #step[Theo bài ra: $|2 - m|/sqrt(2) = 1/sqrt(2) <=> |2 - m| = 1 <=> 2 - m = 1$ hoặc $2 - m = -1 <=> m = 1$ hoặc $m = 3$.]
    #step[Đối chiếu điều kiện $m != 1$, ta nhận $m = 3$.]
    #step[Kiểm tra mệnh đề:]
    #step[a) Tập $S$ chỉ có đúng một phần tử là $m = 3$. (Sai)]
    #step[b) Tổng các phần tử là $3$. (Sai)]
    #step[c) Tập $S = {3}$, số 3 là số nguyên. (Đúng)]
    #step[d) Khi $m = 3$, TCX là $y = x + 2 - 3 = x - 1$. Không phải $y = x$. (Sai)]
  ]
)

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#tln(
  dir: "ngang",
  [Có bao nhiêu số nguyên $m in [-20; 20]$ để đồ thị hàm số $y = (m x^2 + 4x - 1)/(x + 1)$ KHÔNG CÓ tiệm cận xiên?],
  [$2$],
  loigiai: [
    #step[Điều kiện để đồ thị hàm phân thức (tử bậc tối đa 2, mẫu bậc 1) CÓ tiệm cận xiên là bậc của tử lớn hơn bậc mẫu đúng 1 bậc và tử không chia hết cho mẫu.]
    #step[Tử số có bậc 2 khi và chỉ khi $m != 0$.]
    #step[Khi $m = 0$, $y = (4x - 1)/(x + 1)$, hàm số có tiệm cận ngang $y = 4$ và không có tiệm cận xiên.]
    #step[Nếu $m != 0$, phép chia cho số dư $R = m(-1)^2 + 4(-1) - 1 = m - 5$. Để có TCX thì $m - 5 != 0 <=> m != 5$.
    Nếu $m = 5$, $y = (5x^2 + 4x - 1)/(x + 1) = ((x + 1)(5x - 1))/(x + 1) = 5x - 1$. Đồ thị là một đường thẳng thủng, KHÔNG CÓ tiệm cận xiên.]
    #step[Vậy đồ thị KHÔNG CÓ TCX khi $m = 0$ hoặc $m = 5$.]
    #step[Số nguyên $m in [-20; 20]$ không có TCX gồm ${0, 5}$, tổng cộng 2 giá trị.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị dương của tham số $m$ để đường tiệm cận đứng của đồ thị hàm số $y = (2x + 1)/(x^2 - m^2)$ đi qua điểm $A(1; -3)$.],
  [$1$],
  loigiai: [
    #step[Nghiệm của mẫu là $x^2 - m^2 = 0 <=> x = m$ hoặc $x = -m$.]
    #step[Tiệm cận đứng phải đi qua điểm $A(1; -3)$, tức là đường thẳng $x = 1$ phải là tiệm cận đứng.]
    #step[Suy ra mẫu số phải có nghiệm $x = 1 => 1^2 - m^2 = 0 <=> m = 1$ hoặc $m = -1$.]
    #step[Với $m = 1$, mẫu là $x^2 - 1 = (x-1)(x+1)$. Tại $x=1$, tử số là $3 != 0$. Nên $x=1$ đúng là TCĐ.]
    #step[Vì yêu cầu $m > 0$ nên nhận $m = 1$.]
  ]
)

#tln(
  dir: "ngang",
  [Cho hàm số $y = (x^2 - 3x + m)/(x - 1)$. Tìm giá trị nhỏ nhất của $m$ (với $m$ là số nguyên dương) để tiệm cận xiên của đồ thị không cắt parabol $(P): y = x^2 - x + 1$.],
  [$1$],
  loigiai: [
    #step[Chia tử cho mẫu: $x^2 - 3x + m = x(x - 1) - 2x + m = x(x - 1) - 2(x - 1) + m - 2 = (x - 2)(x - 1) + m - 2$.]
    #step[Đường tiệm cận xiên là $d: y = x - 2$. (Lưu ý phải có $m != 2$ thì phần dư mới khác 0 và có TCX).]
    #step[Xét phương trình hoành độ giao điểm của $d$ và $(P)$:
    $x^2 - x + 1 = x - 2 <=> x^2 - 2x + 3 = 0$.]
    #step[Phương trình có $Delta' = 1 - 3 = -2 < 0$, nên luôn vô nghiệm với mọi $m$.
    Do đó, $d$ không cắt $(P)$ với mọi $m$ sao cho $d$ là TCX.]
    #step[Điều kiện để có TCX là $m - 2 != 0 <=> m != 2$.
    Hơn nữa, TCX luôn là $y = x - 2$ không phụ thuộc $m$.]
    #step[Số nguyên dương nhỏ nhất khác 2 là $m = 1$.]
  ]
)

#tln(
  dir: "ngang",
  [Cho đồ thị hàm số $y = (x^2 + 2x - 3)/(x + m)$ có đường tiệm cận xiên đi qua điểm $M(1; 5)$. Tìm $m$.],
  [$-2$],
  loigiai: [
    #step[Chia đa thức: $x^2 + 2x - 3 = x(x + m) + (2 - m)x - 3 = x(x + m) + (2 - m)(x + m) - m(2 - m) - 3$.]
    #step[Tiệm cận xiên là $y = x + 2 - m$.]
    #step[Tiệm cận xiên đi qua $M(1; 5)$ nên: $5 = 1 + 2 - m <=> m = 3 - 5 = -2$.]
    #step[Vậy $m = -2$. (Kiểm tra phần dư: $-(-2)(2 - (-2)) - 3 = 8 - 3 = 5 != 0$, thỏa mãn có TCX).]
  ]
)

#tln(
  dir: "ngang",
  [Biết đường tiệm cận xiên của hàm số $y = (a x^2 - x + 1)/(x + b)$ là $y = 3x - 7$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
  [$13$],
  loigiai: [
    #step[Thực hiện phép chia: $a x^2 - x + 1 = a x(x + b) - (a b + 1)x + 1 = a x(x + b) - (a b + 1)(x + b) + b(a b + 1) + 1$.]
    #step[Tiệm cận xiên là $y = a x - (a b + 1)$.]
    #step[Đồng nhất hệ số với $y = 3x - 7$, ta có hệ:
    $cases(
      a = 3,
      -(a b + 1) = -7
    ) <=> cases(
      a = 3,
      3b + 1 = 7 => 3b = 6 => b = 2
    )$]
    #step[Giá trị biểu thức $P = a^2 + b^2 = 3^2 + 2^2 = 9 + 4 = 13$.]
  ]
)

#tln(
  dir: "ngang",
  [Tìm số lượng giá trị nguyên của $m$ thuộc khoảng $(-10; 10)$ sao cho đồ thị hàm số $y = (|x| + 1)/(x^2 - m x + 1)$ có duy nhất 1 đường tiệm cận (kể cả đứng, ngang, xiên).],
  [$3$],
  loigiai: [
    #step[TCN: $limits(lim)_(x -> +-oo) (|x| + 1)/(x^2 - m x + 1) = 0$. Vậy hàm số luôn có chính xác 1 đường tiệm cận ngang là $y = 0$.]
    #step[Vì đã có 1 TCN, để đồ thị có DUY NHẤT 1 đường tiệm cận thì không được có tiệm cận đứng.]
    #step[Đồ thị không có TCĐ khi và chỉ khi mẫu $g(x) = x^2 - m x + 1 = 0$ vô nghiệm (vì tử số luôn dương $|x|+1>0$).]
    #step[$g(x) = 0$ vô nghiệm $<=> Delta = m^2 - 4 < 0 <=> -2 < m < 2$.]
    #step[Vì $m in ZZ$ nên $m in {-1, 0, 1}$.]
    #step[Số lượng giá trị nguyên của $m$ thỏa mãn là $3$.]
  ]
)
