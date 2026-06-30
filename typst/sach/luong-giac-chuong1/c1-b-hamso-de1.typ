#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập — Hàm Số Lượng Giác])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 5)

#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = tan x$ là:],
  (
    [$D = RR$],
    [$D = RR  \{k pi, k in ZZ\}$],
    True([$D = RR  \{pi/2 + k pi, k in ZZ\}$]),
    [$D = [-1; 1]$]
  ),
  loigiai: [
    #step[*B1: Điều kiện xác định* \ Hàm số $y = tan x = (sin x)/(cos x)$ xác định khi và chỉ khi mẫu số khác 0, tức là $cos x != 0$.]
    #step[*B2: Giải điều kiện* \ Phương trình $cos x = 0$ có nghiệm là $x = pi/2 + k pi$ ($k in ZZ$).]
    #step[*B3: Kết luận* \ Tập xác định là $D = RR \ \{pi/2 + k pi, k in ZZ\}$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Trong các hàm số lượng giác sau, hàm số nào là hàm số chẵn?],
  ([$y = sin x$], True([$y = cos x$]), [$y = tan x$], [$y = cot x$]),
  loigiai: [
    #step[*Lý thuyết:* \ Ta có tính chất của góc đối: $cos(-x) = cos x$ với mọi $x in RR$, do đó $y = cos x$ là hàm số chẵn.]
    #step[Các hàm còn lại đều thỏa mãn $f(-x) = -f(x)$ nên là hàm số lẻ.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Chu kỳ tuần hoàn của hàm số $y = sin x$ là:],
  ([$pi/2$], [$pi$], True([$2pi$]), [$4pi$]),
  loigiai: [
    #step[*Lý thuyết:* \ Hàm số $y = sin x$ lặp lại giá trị ban đầu sau mỗi khoảng $2pi$, tức là $sin(x + 2pi) = sin x$.]
    #step[Do đó chu kỳ cơ sở là $T = 2pi$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Giá trị lớn nhất và nhỏ nhất của hàm số $y = 3 cos x - 1$ lần lượt là:],
  (True([$2$ và $-4$]), [$3$ và $-3$], [$4$ và $-2$], [$2$ và $-2$]),
  loigiai: [
    #step[*B1: Đánh giá hàm cơ bản* \ Ta có $-1 <= cos x <= 1$ với mọi $x in RR$.]
    #step[*B2: Xây dựng hàm số* \ Nhân cả ba vế với $3$: $-3 <= 3 cos x <= 3$. \ Cộng thêm $-1$ vào các vế: $-4 <= 3 cos x - 1 <= 2$.]
    #step[*B3: Kết luận* \ Giá trị lớn nhất là $2$ và giá trị nhỏ nhất là $-4$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Đồ thị hàm số $y = sin x$ cắt trục hoành tại các điểm có hoành độ là:],
  (True([$x = k pi$]), [$x = pi/2 + k pi$], [$x = k 2pi$], [$x = pi/4 + k pi$]),
  loigiai: [
    #step[*B1: Thiết lập phương trình* \ Giao điểm với trục hoành tương ứng với tung độ $y = 0$, do đó ta có phương trình $sin x = 0$.]
    #step[*B2: Giải phương trình* \ Nghiệm của phương trình $sin x = 0$ là $x = k pi$ ($k in ZZ$).]
  ]
))

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2)

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = f(x) = sin(2x) + 1$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tập xác định của hàm số là $D = [-1; 1]$.],
    True([Tập giá trị của hàm số là $T = [0; 2]$.]),
    [Hàm số là hàm số chẵn.],
    True([Chu kỳ tuần hoàn của hàm số là $T = pi$.]),
  ),
  loigiai: [
    - *a) Sai:* Hàm $y = sin(2x) + 1$ là biểu thức chứa lượng giác nên tập xác định là tập số thực $D = RR$. Tập $[-1; 1]$ là tập giá trị của hàm $\sin x$, không phải tập xác định.
    - *b) Đúng:* Vì $-1 <= sin(2x) <= 1$ nên ta có $0 <= sin(2x) + 1 <= 2$. Tập giá trị là $[0; 2]$.
    - *c) Sai:* Xét $f(-x) = sin(-2x) + 1 = -sin(2x) + 1$. Ta thấy $f(-x) != f(x)$ và $f(-x) != -f(x)$, nên hàm này không chẵn cũng không lẻ.
    - *d) Đúng:* Chu kỳ của hàm số dạng $y = sin(k x)$ là $T = (2pi)/|k|$. Ở đây hệ số $k=2$ nên chu kỳ $T = (2pi)/2 = pi$.
  ]
))

#q-wrap(dir: "doc", ds(
  [Cho đồ thị hàm số $y = cos x$ trên đoạn $[-pi; 2pi]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đồ thị cắt trục hoành tại 3 điểm trên đoạn đã cho.]),
    [Hàm số đạt giá trị lớn nhất tại $x = pi/2$.],
    True([Đồ thị có tính đối xứng qua trục tung $O y$.]),
    True([Hàm số đồng biến trên khoảng $(-pi; 0)$.]),
  ),
  loigiai: [
    - *a) Đúng:* Các nghiệm của $cos x = 0$ là $x = pi/2 + k pi$. Các nghiệm nằm trong $[-pi; 2pi]$ là $x = -pi/2$, $x = pi/2$, $x = (3pi)/2$ (tổng cộng 3 điểm).
    - *b) Sai:* Tại $x = pi/2$, giá trị là $cos(pi/2) = 0$. Giá trị lớn nhất của $cos x$ bằng $1$, đạt tại $x = 0$ và $x = 2pi$ (trong đoạn đã cho).
    - *c) Đúng:* Tập xác định của $cos x$ đối xứng và đây là hàm chẵn, nên đồ thị nhận trục tung $O y$ làm trục đối xứng.
    - *d) Đúng:* Trên khoảng $(-pi; 0)$, khi $x$ tăng từ $-pi$ lên $0$, giá trị $cos x$ tăng liên tục từ $-1$ lên $1$, do đó hàm số đồng biến.
  ]
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 2)

#q-wrap(dir: "doc", tln(
  [Tìm giá trị lớn nhất của hàm số $y = 3 - 2 sin^2 x$.],
  [$3$],
  loigiai: [
    #step[*B1: Đánh giá cụm bình phương* \ Ta luôn có $0 <= sin^2 x <= 1$ với mọi $x in RR$.]
    #step[*B2: Xây dựng biểu thức* \ Nhân các vế với $-2$, ta đảo chiều bất đẳng thức: $0 >= -2 sin^2 x >= -2$, hay viết lại là $-2 <= -2 sin^2 x <= 0$.]
    #step[*B3: Kết luận* \ Cộng thêm $3$ vào các vế: $1 <= 3 - 2 sin^2 x <= 3$. \ Vậy giá trị lớn nhất của hàm số bằng $3$, đạt được khi $sin x = 0 <=> x = k pi$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Có bao nhiêu giá trị nguyên của tham số $m$ thuộc đoạn $[-10; 10]$ để hàm số $y = sqrt(m - 3 cos x)$ có tập xác định là $RR$?],
  [$8$],
  loigiai: [
    #step[*B1: Điều kiện xác định* \ Hàm số chứa căn bậc hai nên xác định trên $RR$ khi và chỉ khi biểu thức trong căn không âm với mọi $x$: \ $m - 3 cos x >= 0 <=> m >= 3 cos x quad forall x in RR$.]
    #step[*B2: Giải bất phương trình* \ Điều kiện $m >= 3 cos x quad forall x in RR$ tương đương với $m >= max(3 cos x)$. \ Do $cos x <= 1$ nên $3 cos x <= 3$. Vậy ta cần $m >= 3$.]
    #step[*B3: Lọc kết quả* \ Vì $m$ là số nguyên và thuộc đoạn $[-10; 10]$, nên $m in \{3, 4, 5, ..., 10\}$. \ Số lượng các giá trị thỏa mãn là $10 - 3 + 1 = 8$ giá trị.]
  ]
))
