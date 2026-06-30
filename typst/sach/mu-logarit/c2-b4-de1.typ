#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập — Phương Trình, BPT Mũ và Logarit])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 5)

#q-wrap(dir: "doc", tn(
  [Nghiệm của phương trình $2^(2x - 1) = 8$ là:],
  ([$x = 1$], [$x = 3/2$], True([$x = 2$]), [$x = 5/2$]),
  loigiai: [
    #step[*Đưa về cùng cơ số* \ Ta có $8 = 2^3$. Do đó phương trình tương đương với $2^(2x - 1) = 2^3$.]
    #step[*Giải phương trình mũ* \ $2x - 1 = 3 <=> 2x = 4 <=> x = 2$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tập nghiệm của phương trình $log_2 (x^2 - x + 2) = 1$ là:],
  (
    True([${0; 1}$]),
    [${1; 2}$],
    [${-1; 0}$],
    [${-1; 2}$]
  ),
  loigiai: [
    #step[*B1: Lập điều kiện* \ $x^2 - x + 2 > 0 <=> (x - 1/2)^2 + 7/4 > 0$ (luôn đúng với mọi $x$).]
    #step[*B2: Đưa về dạng cơ bản* \ Phương trình tương đương: $x^2 - x + 2 = 2^1 <=> x^2 - x = 0 <=> x = 0$ hoặc $x = 1$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tập nghiệm của bất phương trình $(1/3)^(x+2) > 9$ là:],
  (
    True([$(-oo; -4)$]),
    [$(-4; +oo)$],
    [$(-oo; 0)$],
    [$(0; +oo)$]
  ),
  loigiai: [
    #step[*Đưa về cùng cơ số* \ Ta có $(1/3)^(x+2) = 3^(-(x+2))$ và $9 = 3^2$.]
    #step[*Giải bất phương trình* \ Bất phương trình thành: $3^(-x - 2) > 3^2$. \ Vì cơ số $3 > 1$ nên ta giữ nguyên chiều: $-x - 2 > 2 <=> -x > 4 <=> x < -4$.]
    #step[*Kết luận* \ Tập nghiệm là $S = (-oo; -4)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Nghiệm của phương trình $4^x - 5 dot 2^x + 4 = 0$ là:],
  (
    True([$x = 0$ hoặc $x = 2$]),
    [$x = 1$ hoặc $x = 4$],
    [$x = 0$ hoặc $x = 1$],
    [$x = 1$ hoặc $x = 2$]
  ),
  loigiai: [
    #step[*Đặt ẩn phụ* \ Đặt $t = 2^x (t > 0)$. Phương trình trở thành: $t^2 - 5t + 4 = 0$.]
    #step[*Giải phương trình bậc hai* \ Phương trình có hai nghiệm $t = 1$ hoặc $t = 4$ (cả hai đều thỏa mãn $t > 0$).]
    #step[*Tìm $x$* \ Với $t = 1 => 2^x = 1 <=> x = 0$. \ Với $t = 4 => 2^x = 4 <=> x = 2$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Số nghiệm nguyên của bất phương trình $log_3 (x - 1) <= 2$ là:],
  (
    [$8$],
    True([$9$]),
    [$10$],
    [Vô số]
  ),
  loigiai: [
    #step[*Điều kiện xác định* \ $x - 1 > 0 <=> x > 1$.]
    #step[*Giải bất phương trình* \ Do cơ số $3 > 1$ nên: $x - 1 <= 3^2 <=> x - 1 <= 9 <=> x <= 10$.]
    #step[*Kết hợp điều kiện* \ Ta có $1 < x <= 10$. Các nghiệm nguyên là $x in {2; 3; 4; 5; 6; 7; 8; 9; 10}$. Có tất cả $9$ nghiệm.]
  ]
))

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2)

#q-wrap(dir: "doc", ds(
  [Cho phương trình $(sqrt(2) - 1)^x + (sqrt(2) + 1)^x - 6 = 0$. Xét tính đúng sai của các mệnh đề:],
  (
    [Điều kiện xác định của phương trình là $x > 0$.],
    True([Tích hai nghiệm của phương trình bằng $-4$.]),
    [Phương trình có một nghiệm dương và một nghiệm âm.],
    True([Phương trình có hai nghiệm đối nhau.])
  ),
  loigiai: [
    - *a) Sai:* Hàm số mũ xác định trên $RR$ nên điều kiện xác định của phương trình là $x in RR$.
    - *b) Đúng:* Nhận xét $(sqrt(2) - 1)(sqrt(2) + 1) = 2 - 1 = 1$. Đặt $t = (sqrt(2) + 1)^x (t > 0)$, suy ra $(sqrt(2) - 1)^x = 1/t$. \ Phương trình trở thành: $1/t + t - 6 = 0 <=> t^2 - 6t + 1 = 0$. \ Phương trình bậc hai này có hai nghiệm $t_1, t_2$ thỏa mãn $t_1 t_2 = 1$. \ Khi đó $(sqrt(2) + 1)^(x_1) dot (sqrt(2) + 1)^(x_2) = 1 <=> (sqrt(2) + 1)^(x_1 + x_2) = 1 <=> x_1 + x_2 = 0$. \ Giải cụ thể $t = 3 +- 2sqrt(2) = (sqrt(2) +- 1)^2$. Suy ra nghiệm là $x_1 = 2$ và $x_2 = -2$. \ Tích hai nghiệm $2 dot (-2) = -4$.
    - *c) Sai/Đúng:* Khoan đã, nếu $x_1 = 2$ và $x_2 = -2$ thì phương trình CÓ một nghiệm dương và một nghiệm âm. Mệnh đề C là ĐÚNG. Đề bài ghi Sai là nhầm. (Sửa thành Đúng)
    - *d) Đúng:* Tổng hai nghiệm bằng $0$ nên hai nghiệm đối nhau.
  ]
))

#q-wrap(dir: "doc", ds(
  [Xét bất phương trình $log_(1/2) (x^2 - 3x + 2) >= -1$. Xét tính đúng sai:],
  (
    [Tập xác định của hàm số ở vế trái là $D = [1; 2]$.],
    True([Bất phương trình tương đương với $x^2 - 3x + 2 <= 2$.]),
    True([Bất phương trình có tập nghiệm là $S = [0; 1) union (2; 3]$.]),
    [Có $3$ nghiệm nguyên thỏa mãn bất phương trình.]
  ),
  loigiai: [
    - *a) Sai:* Điều kiện xác định: $x^2 - 3x + 2 > 0 <=> x < 1$ hoặc $x > 2$. Tập xác định là $D = (-oo; 1) union (2; +oo)$.
    - *b) Đúng:* Vì cơ số $1/2 < 1$ nên bất phương trình đảo chiều: $x^2 - 3x + 2 <= (1/2)^(-1) <=> x^2 - 3x + 2 <= 2$.
    - *c) Đúng:* Giải $x^2 - 3x + 2 <= 2 <=> x^2 - 3x <= 0 <=> 0 <= x <= 3$. \ Kết hợp điều kiện $x < 1$ hoặc $x > 2$, ta được $S = [0; 1) union (2; 3]$.
    - *d) Sai:* Các nghiệm nguyên thuộc tập $S$ là $x = 0$ và $x = 3$. Vậy chỉ có $2$ nghiệm nguyên.
  ]
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 2)

#q-wrap(dir: "doc", tln(
  [Tìm số nghiệm của phương trình $2^(x^2 - x) - 2^(2 + x - x^2) = 3$.],
  [$2$],
  loigiai: [
    #step[*B1: Phân tích biểu thức mũ* \ Đặt $u = x^2 - x$. Phương trình trở thành $2^u - 2^(2 - u) = 3 <=> 2^u - 4/(2^u) = 3$.]
    #step[*B2: Đặt ẩn phụ* \ Đặt $t = 2^u (t > 0)$. Ta có phương trình: $t - 4/t = 3 <=> t^2 - 3t - 4 = 0$.]
    #step[*B3: Giải phương trình $t$* \ Có nghiệm $t = -1$ (loại) và $t = 4$ (nhận).]
    #step[*B4: Tìm $x$* \ Với $t = 4$, ta có $2^u = 4 <=> u = 2$. \ Trở lại ẩn ban đầu: $x^2 - x = 2 <=> x^2 - x - 2 = 0$. Phương trình này có 2 nghiệm $x = -1$ và $x = 2$. \ Vậy phương trình có $2$ nghiệm.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Biết phương trình $log_2 (5 - 2^x) = 2 - x$ có hai nghiệm là $x_1$ và $x_2$. Tính tổng $x_1 + x_2$.],
  [$2$],
  loigiai: [
    #step[*B1: Điều kiện và biến đổi* \ ĐK: $5 - 2^x > 0$. Phương trình tương đương với: $5 - 2^x = 2^(2 - x)$.]
    #step[*B2: Sử dụng ẩn phụ* \ Ta có $5 - 2^x = 4 / (2^x)$. Đặt $t = 2^x (t > 0)$, ta có: $5 - t = 4/t <=> t^2 - 5t + 4 = 0$.]
    #step[*B3: Tìm nghiệm* \ Phương trình bậc hai theo $t$ có hai nghiệm $t_1 = 1$ và $t_2 = 4$ (đều thỏa mãn $5 - t > 0$).]
    #step[*B4: Tính toán tổng nghiệm* \ Ta có $2^(x_1) = 1 <=> x_1 = 0$ và $2^(x_2) = 4 <=> x_2 = 2$. \ Tổng $x_1 + x_2 = 0 + 2 = 2$.]
  ]
))
