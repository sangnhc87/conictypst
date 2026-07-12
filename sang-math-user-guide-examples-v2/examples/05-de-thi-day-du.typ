#import "../lib.typ": *

#let preset = exam-preset(
  theme: "teal-pro",
  profile: "loigiai",
  opt-style: "plain",
  q-label-style: "plain",
  two-columns: false,
  answer-key: false,
)
#let (tn, ds, tln, tl) = exam-mode(..preset.question, show-hyperlink: true)

#show: sang-setup.with(math-color: preset.accent)
#show: exam-theme.with(
  theme: preset.theme,
  school: "TRƯỜNG THPT SANG-MATH",
  exam-title: "ĐỀ MINH HỌA SỬ DỤNG SANG-MATH",
  subject: "TOÁN 12",
  duration: "90 phút",
  code: "101",
  ..preset.template,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án], count: 8)

#tn([Đạo hàm của $y=x^3-3x+1$ là], ([$3x^2$], True([$3x^2-3$]), [$x^2-3$], [$3x^2+1$]), loigiai: [Ta có $y' = 3x^2 - 3$.])
#tn([Tập xác định của $y=sqrt(x+2)$ là], ([$(-oo;-2)$], [$(-oo;-2]$], True([$[-2;+oo)$]), [$RR$]), loigiai: [Điều kiện xác định: $x + 2 >= 0 <=> x >= -2$. Vậy tập xác định là $D = [-2; +oo)$.])
#tn([Nghiệm của $log_3 x=2$ là], ([$3$], [$6$], True([$9$]), [$12$]), loigiai: [Điều kiện: $x > 0$. Ta có $log_3 x = 2 <=> x = 3^2 = 9$ (thỏa mãn).])
#tn([Giới hạn $lim_(x -> +oo) (5x^2-1)/(2x^2+x)$ bằng], ([$0$], [$2/5$], True([$5/2$]), [$+oo$]), loigiai: [Chia cả tử và mẫu cho $x^2$, ta được $lim_(x -> +oo) (5 - 1/x^2)/(2 + 1/x) = 5/2$.])
#tn([Số nghiệm của phương trình $x^2-4=0$ là], ([$0$], [$1$], True([$2$]), [$4$]), loigiai: [Ta có $x^2 - 4 = 0 <=> x^2 = 4 <=> x = +-2$. Vậy phương trình có 2 nghiệm.])
#tn([Tính $C(6,2)$.], ([$12$], True([$15$]), [$20$], [$30$]), loigiai: [Áp dụng công thức tổ hợp: $C(6,2) = (6!) / (2! (6-2)!) = 15$.])
#tn([Nếu $P(A)=0.35$ thì $P(overline(A))$ bằng], ([$0.35$], True([$0.65$]), [$1.35$], [$0$]), loigiai: [Ta có $P(overline(A)) = 1 - P(A) = 1 - 0.35 = 0.65$.])
#tn([Giá trị nhỏ nhất của $x^2-6x+10$ là], ([$0$], True([$1$]), [$3$], [$10$]), loigiai: [Ta có $x^2 - 6x + 10 = (x - 3)^2 + 1 >= 1$. Dấu $"="$ xảy ra khi $x = 3$. Giá trị nhỏ nhất là $1$.])

#exam-part([PHẦN II. Câu đúng-sai], count: 2)

#ds([Cho hàm số $f(x)=x^2-2x+3$.],
  (
    True([$f(1)=2$.]),
    [$f(0)=0$.],
    True([Giá trị nhỏ nhất của $f$ bằng $2$.]),
    [$f'(x)=x-2$.],
  ),
  loigiai: [
    Ta có $f(x) = (x-1)^2 + 2 >= 2$ với mọi $x$.
    - $f(1) = 2$ nên ý 1 đúng.
    - $f(0) = 3$ nên ý 2 sai.
    - Dấu bằng xảy ra khi $x = 1$ nên giá trị nhỏ nhất của $f$ bằng $2$, ý 3 đúng.
    - Đạo hàm $f'(x) = 2x - 2$, do đó ý 4 sai.
  ]
)

#ds([Cho cấp số cộng có $u_1=1$, công sai $d=2$.],
  (
    True([$u_2=3$.]),
    True([$u_5=9$.]),
    [Tổng ba số hạng đầu bằng $12$.],
    True([$u_n=2n-1$.]),
  ),
  loigiai: [
    Cấp số cộng có số hạng tổng quát $u_n = u_1 + (n-1)d = 1 + (n-1)2 = 2n - 1$. (Ý 4 đúng).
    - $u_2 = u_1 + d = 1 + 2 = 3$ (Ý 1 đúng).
    - $u_5 = 2(5) - 1 = 9$ (Ý 2 đúng).
    - Tổng 3 số hạng đầu $S_3 = (3(2u_1 + 2d))/2 = 3(2+4)/2 = 9$ (Ý 3 sai).
  ]
)

#exam-part([PHẦN III. Câu trả lời ngắn], count: 4)

#tln([Tính $f(2)$ với $f(x)=x^2+1$.], [$5$], loigiai: [Thay $x=2$ vào hàm số, ta được $f(2) = 2^2 + 1 = 5$.])
#tln([Giải phương trình $2^x=16$.], [$4$], loigiai: [Ta có $2^x = 16 <=> 2^x = 2^4 <=> x = 4$.])
#tln([Tính $lim_(x -> +oo) (7x+1)/(x-3)$.], [$7$], loigiai: [Chia tử và mẫu cho $x$, ta được $lim_(x -> +oo) (7 + 1/x)/(1 - 3/x) = 7/1 = 7$.])
#tln([Tọa độ đỉnh của $y=x^2-4x+1$ là], [$(2;-3)$], show-boxes: false, lines: 2, loigiai: [Hoành độ đỉnh $x_I = -b/(2a) = 4/2 = 2$. Tung độ đỉnh $y_I = 2^2 - 4(2) + 1 = -3$. Đỉnh $I(2;-3)$.])

#exam-part([PHẦN IV. Tự luận], count: 2)

#tl([Giải phương trình $x^2-5x+6=0$.], lines: 6, loigiai: [
  Ta có $Delta = (-5)^2 - 4(1)(6) = 25 - 24 = 1 > 0$.
  Phương trình có hai nghiệm phân biệt:
  $x_1 = (5 + 1)/2 = 3$ và $x_2 = (5 - 1)/2 = 2$.
  Vậy tập nghiệm là $S = {2; 3}$.
])
#tl([Xét tính đơn điệu của hàm số $y=x^3-3x+1$.], lines: 8, loigiai: [
  Tập xác định: $D = RR$.
  Đạo hàm: $y' = 3x^2 - 3$.
  Cho $y' = 0 <=> 3x^2 - 3 = 0 <=> x = +-1$.
  - Trên các khoảng $(-oo; -1)$ và $(1; +oo)$, $y' > 0$ nên hàm số đồng biến.
  - Trên khoảng $(-1; 1)$, $y' < 0$ nên hàm số nghịch biến.
])

#het
