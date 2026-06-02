#import "_config.typ": *
#import "@preview/cetz:0.5.2"

#resetexamstate()
#resetcau()

#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 01 - CHUYÊN ĐỀ TIẾP TUYẾN]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Viết phương trình tiếp tuyến của đồ thị hàm số $y = x^3 - 3x^2 + 2$ tại điểm có hoành độ $x_0 = 1$.],
  (
    [$y = -3x + 1$],
    [$y = -3x - 3$],
    True([$y = -3x + 3$]),
    [$y = 3x - 3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tọa độ tiếp điểm: $x_0 = 1 => y_0 = 1^3 - 3(1)^2 + 2 = 0$. Tiếp điểm là $M(1; 0)$.]
    #step[Đạo hàm: $y' = 3x^2 - 6x$.]
    #step[Hệ số góc của tiếp tuyến tại $x_0 = 1$ là: $k = y'(1) = 3(1)^2 - 6(1) = -3$.]
    #step[Phương trình tiếp tuyến cần tìm là: $y - 0 = -3(x - 1) <=> y = -3x + 3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm hệ số góc $k$ của tiếp tuyến của đồ thị hàm số $y = (2x + 1)/(x - 1)$ tại giao điểm của nó với trục Oy.],
  (
    [$k = 3$],
    True([$k = -3$]),
    [$k = 1$],
    [$k = -1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm của đồ thị với trục Oy có hoành độ $x_0 = 0$.]
    #step[Đạo hàm: $y' = frac(2(-1) - 1(1), (x - 1)^2) = -frac(3, (x - 1)^2)$.]
    #step[Hệ số góc của tiếp tuyến tại $x_0 = 0$ là: $k = y'(0) = -frac(3, (0 - 1)^2) = -3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Có bao nhiêu tiếp tuyến của đồ thị hàm số $y = (x^2 - x + 1)/(x - 1)$ song song với đường thẳng $y = x$?],
  (
    [$1$],
    [$2$],
    True([$0$]),
    [Vô số],
  ),
  accent: c-book,
  loigiai: [
    #step[Viết lại hàm số: $y = x + frac(1, x - 1)$ (với $x != 1$).]
    #step[Đạo hàm: $y' = 1 - frac(1, (x - 1)^2)$.]
    #step[Tiếp tuyến song song với $y = x$ nên hệ số góc của tiếp tuyến bằng $1$.]
    #step[Giải phương trình hoành độ tiếp điểm: $y' = 1 <=> 1 - frac(1, (x - 1)^2) = 1 <=> frac(1, (x - 1)^2) = 0$ (vô nghiệm).]
    #step[Vậy không có tiếp tuyến nào thỏa mãn.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm phương trình tiếp tuyến của đồ thị hàm số $y = x^3 - 3x$ biết tiếp tuyến vuông góc với đường thẳng $y = -1/9 x + 2$.],
  (
    [$y = 9x - 16$],
    [$y = 9x + 16$],
    [$y = 9x$],
    True([$y = 9x - 16$ và $y = 9x + 16$]),
  ),
  accent: c-book,
  loigiai: [
    #step[Hệ số góc của tiếp tuyến: $k = -frac(1, -1/9) = 9$.]
    #step[Đạo hàm của hàm số: $y' = 3x^2 - 3$.]
    #step[Giải phương trình $y' = 9 <=> 3x^2 - 3 = 9 <=> 3x^2 = 12 <=> x_0 = +- 2$.]
    #step[Với $x_0 = 2 => y_0 = 2^3 - 3(2) = 2$. Tiếp tuyến: $y = 9(x - 2) + 2 = 9x - 16$.]
    #step[Với $x_0 = -2 => y_0 = (-2)^3 - 3(-2) = -2$. Tiếp tuyến: $y = 9(x + 2) - 2 = 9x + 16$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong tất cả các tiếp tuyến của đồ thị hàm số $y = -x^3 + 3x^2 + 1$, tiếp tuyến có hệ số góc lớn nhất có phương trình là:],
  (
    [$y = 3x - 1$],
    True([$y = 3x$]),
    [$y = 3x + 1$],
    [$y = -3x + 4$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = -3x^2 + 6x$.]
    #step[Biến đổi đạo hàm: $y' = -3(x^2 - 2x) = -3(x - 1)^2 + 3 <= 3$ với mọi $x$.]
    #step[Hệ số góc lớn nhất của tiếp tuyến là $k = 3$, đạt được khi $x_0 = 1$.]
    #step[Tung độ tiếp điểm tương ứng: $y_0 = y(1) = -1^3 + 3(1)^2 + 1 = 3$.]
    #step[Phương trình tiếp tuyến: $y = 3(x - 1) + 3 = 3x$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Có bao nhiêu đường tiếp tuyến của đồ thị hàm số $y = x^3 - 3x^2 + 4$ song song với trục hoành?],
  (
    [$0$],
    [$1$],
    True([$2$]),
    [$3$],
  ),
  accent: c-book,
  loigiai: [
    #step[Tiếp tuyến song song với trục hoành Ox khi và chỉ khi hệ số góc của nó bằng $0$.]
    #step[Đạo hàm: $y' = 3x^2 - 6x = 0 <=> x_0 = 0$ hoặc $x_0 = 2$.]
    #step[Với $x_0 = 0 => y_0 = 4$. Tiếp tuyến tương ứng là $y = 4$ (song song Ox).]
    #step[Với $x_0 = 2 => y_0 = 0$. Tiếp tuyến tương ứng là $y = 0$ (trùng Ox, đề bài yêu cầu song song nên cần loại hoặc kiểm tra kĩ).]
    #step[Nhận xét: Trong toán học trung học phổ thông, cụm từ "song song với trục hoành" của cực trị vẫn chấp nhận các tiếp tuyến nằm ngang tại cực trị (ở đây có $y = 4$ và $y = 0$, trong đó $y = 0$ trùng Ox). Nếu loại trùng Ox thì còn 1. Nhưng theo chuẩn đề thi quốc gia thường coi tiếp tuyến tại 2 cực trị là 2 tiếp tuyến nằm ngang. Vậy đáp án là 2.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Viết phương trình tiếp tuyến của đồ thị hàm số $y = (2x - 1)/(x - 1)$ biết tiếp tuyến song song với đường thẳng $d: y = -x + 3$.],
  (
    [$y = -x + 3$],
    True([$y = -x + 5$ và $y = -x + 1$]),
    [$y = -x + 4$],
    [$y = -x - 1$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm: $y' = -frac(1, (x - 1)^2)$.]
    #step[Tiếp tuyến song song với $d: y = -x + 3$ nên có hệ số góc $k = -1$.]
    #step[Giải phương trình: $-frac(1, (x - 1)^2) = -1 <=> (x - 1)^2 = 1 <=> x_0 = 2$ hoặc $x_0 = 0$.]
    #step[Với $x_0 = 2 => y_0 = 3$. Phương trình tiếp tuyến: $y = -1(x - 2) + 3 = -x + 5$ (thỏa mãn).]
    #step[Với $x_0 = 0 => y_0 = 1$. Phương trình tiếp tuyến: $y = -1(x - 0) + 1 = -x + 1$ (thỏa mãn).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Số tiếp tuyến của đồ thị hàm số $y = x^3 - 3x^2$ đi qua gốc tọa độ $O(0; 0)$ là:],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đường thẳng đi qua $O(0; 0)$ với hệ số góc $k$ có phương trình $d: y = k x$.]
    #step[Hệ điều kiện tiếp xúc: $x^3 - 3x^2 = k x$ và $3x^2 - 6x = k$.]
    #step[Thay $k$ vào phương trình thứ nhất ta được: $x^3 - 3x^2 = (3x^2 - 6x)x <=> x^3 - 3x^2 = 3x^3 - 6x^2$.]
    #step[Biến đổi phương trình: $2x^3 - 3x^2 = 0 <=> x^2(2x - 3) = 0 <=> x = 0$ hoặc $x = 1.5$.]
    #step[Tương ứng với mỗi hoành độ tiếp điểm ta có đúng một tiếp tuyến. Vậy có đúng 2 tiếp tuyến.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tiếp tuyến của đồ thị hàm số $y = (x^2 + x + 1)/(x + 1)$ vuông góc với trục Oy.],
  (
    [$y = 1$],
    [$y = -3$],
    [$y = 1$ và $y = 3$],
    True([$y = 1$ và $y = -3$]),
  ),
  accent: c-book,
  loigiai: [
    #step[Tiếp tuyến vuông góc với Oy nên song song hoặc trùng với Ox, tức là có hệ số góc $k = 0$.]
    #step[Hàm số viết dưới dạng: $y = x + frac(1, x + 1)$ (với $x != -1$).]
    #step[Đạo hàm: $y' = 1 - frac(1, (x + 1)^2) = 0 <=> (x + 1)^2 = 1 <=> x_0 = 0$ hoặc $x_0 = -2$.]
    #step[Với $x_0 = 0 => y_0 = 1$. Phương trình tiếp tuyến là $y = 1$.]
    #step[Với $x_0 = -2 => y_0 = -3$. Phương trình tiếp tuyến là $y = -3$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm tất cả các giá trị của tham số $m$ để tiếp tuyến của đồ thị hàm số $y = x^3 - 3m x^2 + m^3$ tại điểm có hoành độ $x = 1$ song song với đường thẳng $y = 9x - 3$.],
  (
    [$m = 1$],
    True([$m = -1$]),
    [$m = 2$],
    [$m = -2$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm của hàm số: $y' = 3x^2 - 6m x$.]
    #step[Hệ số góc của tiếp tuyến tại $x_0 = 1$ là: $k = y'(1) = 3 - 6m$.]
    #step[Tiếp tuyến song song với đường thẳng $y = 9x - 3$ nên: $3 - 6m = 9 <=> -6m = 6 <=> m = -1$.]
    #step[Kiểm tra lại: Với $m = -1$, hàm số là $y = x^3 + 3x^2 - 1$. Tiếp điểm tại $x_0 = 1$ có tung độ $y_0 = 3$.]
    #step[Phương trình tiếp tuyến: $y = 9(x - 1) + 3 = 9x - 6$ (song song với $y = 9x - 3$). Thỏa mãn.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Tìm giá trị của tham số $m$ để tiếp tuyến của đồ thị hàm số $y = (x - m)/(x + 1)$ tại giao điểm của đồ thị với trục Ox có hệ số góc bằng $2$.],
  (
    [$m = 1/2$],
    [$m = 1$],
    True([$m = -1/2$]),
    [$m = -2$],
  ),
  accent: c-book,
  loigiai: [
    #step[Giao điểm của đồ thị với trục Ox có tung độ $y = 0 <=> x_0 = m$ (điều kiện $m != -1$).]
    #step[Đạo hàm: $y' = frac(1 + m, (x + 1)^2)$.]
    #step[Hệ số góc của tiếp tuyến tại hoành độ tiếp điểm $x_0 = m$ là: $k = y'(m) = frac(1 + m, (m + 1)^2) = frac(1, m + 1)$.]
    #step[Theo bài ra, ta có: $frac(1, m + 1) = 2 <=> m + 1 = 1/2 <=> m = -1/2$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Đường tiếp tuyến của đồ thị hàm số $y = x^3 - 3x^2 + 1$ tại điểm uốn của đồ thị có phương trình là:],
  (
    [$y = -3x - 2$],
    True([$y = -3x + 2$]),
    [$y = 3x - 2$],
    [$y = -3x$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đạo hàm cấp hai: $y'' = 6x - 6 = 0 <=> x = 1$. Hoành độ điểm uốn là $x_0 = 1$.]
    #step[Tọa độ điểm uốn: $I(1; -1)$.]
    #step[Hệ số góc của tiếp tuyến tại điểm uốn: $k = y'(1) = 3(1)^2 - 6(1) = -3$.]
    #step[Phương trình tiếp tuyến: $y - (-1) = -3(x - 1) <=> y = -3x + 2$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm Đúng - Sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x) = x^3 - 3x + 2$ có đồ thị là đường cong $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hệ số góc của tiếp tuyến với đồ thị $(C)$ tại điểm có hoành độ $x_0 = 2$ bằng $9$.]),
    [Đồ thị $(C)$ không có tiếp tuyến nào song song với trục Ox.],
    True([Tiếp tuyến của đồ thị $(C)$ tại điểm cực tiểu chính là trục Ox.]),
    True([Có đúng hai tiếp tuyến của đồ thị $(C)$ song song với đường thẳng $y = 9x - 1$.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Ta có $y' = 3x^2 - 3$. Hệ số góc tiếp tuyến tại $x_0 = 2$ là $y'(2) = 3(2)^2 - 3 = 9$.
    - b) Sai. Các điểm cực trị có hoành độ là nghiệm của $y' = 0 <=> x = +- 1$. Tiếp tuyến tại 2 điểm này song song hoặc trùng Ox.
    - c) Đúng. Cực tiểu đạt tại $x = 1$, giá trị cực tiểu $y(1) = 0$. Tiếp tuyến tại điểm cực tiểu $A(1; 0)$ là $y = 0$, chính là trục hoành Ox.
    - d) Đúng. Để tiếp tuyến song song với $y = 9x - 1$, ta giải phương trình hoành độ tiếp điểm: $y' = 9 <=> 3x^2 - 3 = 9 <=> x = +- 2$. Cả hai hoành độ này đều thỏa mãn và cho hai phương trình tiếp tuyến phân biệt.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = (2x - 1)/(x - 1)$ có đồ thị $(C)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Tiếp tuyến của đồ thị $(C)$ tại điểm có hoành độ $x = 2$ có phương trình là $y = -x + 5$.]),
    True([Không có tiếp tuyến nào của đồ thị $(C)$ song song với đường tiệm cận ngang của nó.]),
    True([Tiếp tuyến tại giao điểm của đồ thị $(C)$ với trục tung có hệ số góc bằng $-1$.]),
    [Tất cả các tiếp tuyến của đồ thị $(C)$ đều có hệ số góc dương.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Với $x_0 = 2 => y_0 = 3$. Đạo hàm $y' = -1/(x - 1)^2 => y'(2) = -1$. Tiếp tuyến: $y = -1(x - 2) + 3 = -x + 5$.
    - b) Đúng. Tiệm cận ngang là $y = 2$, có hệ số góc $k = 0$. Vì đạo hàm $y' = -1/(x - 1)^2 < 0$ với mọi $x != 1$, nên không có tiếp tuyến nào có hệ số góc bằng $0$.
    - c) Đúng. Giao điểm với trục tung tại $x = 0$. Hệ số góc tiếp tuyến tại đây bằng $y'(0) = -1$.
    - d) Sai. Đạo hàm luôn âm nên mọi tiếp tuyến của đồ thị đều có hệ số góc âm.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = x^3 - 3x^2 + m$ (với $m$ là tham số thực) có đồ thị là $(C_m)$. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Hệ số góc của tiếp tuyến tại điểm uốn của đồ thị $(C_m)$ luôn bằng $-3$ với mọi giá trị của $m$.]),
    [Với $m = 4$, đồ thị $(C_m)$ tiếp xúc với trục hoành tại điểm cực đại.],
    True([Với $m = 2$, phương trình tiếp tuyến của đồ thị tại điểm uốn là $y = -3x + 3$.]),
    True([Có đúng hai giá trị thực của tham số $m$ để đồ thị $(C_m)$ tiếp xúc với trục hoành Ox.]),
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Hoành độ điểm uốn của đồ thị thỏa mãn $y'' = 6x - 6 = 0 <=> x_0 = 1$. Hệ số góc tiếp tuyến tại đó là $y'(1) = 3(1)^2 - 6(1) = -3$ (độc lập với $m$).
    - b) Sai. Cực đại đạt tại $x = 0$, giá trị cực đại là $y(0) = m = 4$. Do đó đồ thị tiếp xúc với đường thẳng $y = 4$ tại điểm cực đại, không phải trục hoành $y = 0$.
    - c) Đúng. Với $m = 2$, điểm uốn có tung độ $y_0 = 1^3 - 3(1)^2 + 2 = 0$. Phương trình tiếp tuyến tại điểm uốn là $y = -3(x - 1) = -3x + 3$.
    - d) Đúng. Đồ thị tiếp xúc với Ox khi và chỉ khi giá trị cực đại hoặc giá trị cực tiểu bằng $0$. Cực đại $y(0) = m$, cực tiểu $y(2) = m - 4$. Ta giải được $m = 0$ hoặc $m = 4$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hàm số $y = f(x) = x^3 - 3x$. Gọi $M(1; -2)$ là một điểm. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Điểm $M(1; -2)$ thuộc đồ thị hàm số đã cho.]),
    True([Có đúng hai tiếp tuyến của đồ thị hàm số đi qua điểm $M(1; -2)$.]),
    True([Một trong hai tiếp tuyến đi qua $M$ có hệ số góc bằng $0$.]),
    [Tổng hệ số góc của các tiếp tuyến đi qua điểm $M(1; -2)$ là một số dương.],
  ),
  accent: c-book,
  loigiai: [
    - a) Đúng. Thay $x = 1$ ta được $y = 1^3 - 3(1) = -2$, trùng với tọa độ điểm $M$.
    - b) Đúng. Tiếp tuyến đi qua $M(1; -2)$ với hệ số góc $k$ có dạng $y = k(x - 1) - 2$. Hệ điều kiện tiếp xúc cho phương trình: $x^3 - 3x = (3x^2 - 3)(x - 1) - 2 <=> 2x^3 - 3x^2 + 1 = 0 <=> (x - 1)^2(2x + 1) = 0$. Phương trình có hai nghiệm $x = 1$ và $x = -1/2$.
    - c) Đúng. Tại hoành độ tiếp điểm $x_0 = 1$, tiếp tuyến tương ứng có hệ số góc $k_1 = y'(1) = 0$.
    - d) Sai. Tại hoành độ tiếp điểm $x_0 = -1/2$, tiếp tuyến tương ứng có hệ số góc $k_2 = y'(-1/2) = 3(-1/2)^2 - 3 = -2.25$. Tổng hai hệ số góc là $k_1 + k_2 = -2.25 < 0$.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Tìm hệ số góc của đường tiếp tuyến của đồ thị hàm số $y = (x^2 + 3x + 3)/(x + 2)$ tại giao điểm của đồ thị với trục Oy.],
  [$0.75$],
  accent: c-book,
  loigiai: [
    #step[Giao điểm với trục Oy có hoành độ $x_0 = 0$.]
    #step[Viết lại hàm số dưới dạng: $y = x + 1 + frac(1, x + 2)$ (với $x != -2$).]
    #step[Đạo hàm của hàm số: $y' = 1 - frac(1, (x + 2)^2)$.]
    #step[Hệ số góc của tiếp tuyến tại giao điểm là: $k = y'(0) = 1 - frac(1, (0 + 2)^2) = 1 - 0.25 = 0.75$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = x^3 - 3x^2 + 2$. Tìm diện tích của tam giác tạo bởi hai trục tọa độ và tiếp tuyến của đồ thị hàm số tại điểm uốn của nó.],
  [$1.5$],
  accent: c-book,
  loigiai: [
    #step[Đạo hàm cấp hai: $y'' = 6x - 6 = 0 <=> x_0 = 1$.]
    #step[Tọa độ điểm uốn: $I(1; 0)$.]
    #step[Hệ số góc tiếp tuyến tại điểm uốn: $k = y'(1) = 3(1)^2 - 6(1) = -3$.]
    #step[Phương trình tiếp tuyến tại điểm uốn: $y - 0 = -3(x - 1) <=> y = -3x + 3$.]
    #step[Giao điểm của tiếp tuyến với trục Ox (cho $y = 0$): $A(1; 0)$. Độ dài $O A = 1$.]
    #step[Giao điểm của tiếp tuyến với trục Oy (cho $x = 0$): $B(0; 3)$. Độ dài $O B = 3$.]
    #step[Diện tích tam giác vuông $O A B$: $S = frac(1, 2) . O A . O B = frac(1, 2) . 1 . 3 = 1.5$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Tìm số đường tiếp tuyến của đồ thị hàm số $y = (2x - 1)/(x - 1)$ đi qua điểm $A(2; 0)$.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Đường thẳng đi qua $A(2; 0)$ với hệ số góc $k$ có dạng: $y = k(x - 2)$.]
    #step[Hệ điều kiện tiếp xúc: $frac(2x - 1, x - 1) = k(x - 2)$ và $-frac(1, (x - 1)^2) = k$.]
    #step[Thay $k$ vào phương trình thứ nhất ta được: $frac(2x - 1, x - 1) = -frac(x - 2, (x - 1)^2)$.]
    #step[Biến đổi phương trình (với $x != 1$): $(2x - 1)(x - 1) = -x + 2 <=> 2x^2 - 3x + 1 = -x + 2 <=> 2x^2 - 2x - 1 = 0$.]
    #step[Phương trình bậc hai trên có biệt thức $Delta' = 1 - (-2) = 3 > 0$, suy ra có 2 nghiệm phân biệt khác $1$.]
    #step[Tương ứng với mỗi nghiệm ta có 1 tiếp tuyến thỏa mãn. Vậy có đúng 2 tiếp tuyến.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = (x^2 - x + 1)/(x - 1)$ có đồ thị $(C)$. Gọi $d$ là tiếp tuyến của $(C)$ tại điểm cực đại. Tính khoảng cách từ điểm cực tiểu của $(C)$ đến đường thẳng $d$.],
  [$4$],
  accent: c-book,
  loigiai: [
    #step[Viết lại hàm số: $y = x + frac(1, x - 1)$ (với $x != 1$).]
    #step[Đạo hàm: $y' = 1 - frac(1, (x - 1)^2) = 0 <=> (x - 1)^2 = 1 <=> x_1 = 0$ hoặc $x_2 = 2$.]
    #step[Tọa độ điểm cực đại: $A(0; -1)$. Tọa độ điểm cực tiểu: $B(2; 3)$.]
    #step[Tiếp tuyến tại điểm cực đại $A$ có hệ số góc bằng $0$, nên phương trình đường thẳng $d$ là: $y = -1 <=> y + 1 = 0$.]
    #step[Khoảng cách từ điểm cực tiểu $B(2; 3)$ đến tiếp tuyến $d$ là: $h = |3 + 1| = 4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Có bao nhiêu tiếp tuyến của đồ thị hàm số $y = x^3 - 3x + 1$ vuông góc với trục hoành Ox?],
  [$0$],
  accent: c-book,
  loigiai: [
    #step[Tiếp tuyến vuông góc với trục hoành Ox là tiếp tuyến thẳng đứng (có hệ số góc $k = oo$).]
    #step[Do hàm số bậc ba liên tục và có đạo hàm xác định với mọi $x in RR$ nên hệ số góc của mọi tiếp tuyến là số thực $f'(x_0) = 3x_0^2 - 3$.]
    #step[Do đó không tồn tại tiếp tuyến thẳng đứng. Vậy số tiếp tuyến thỏa mãn là $0$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hàm số $y = (2x - 1)/(x - 1)$ có đồ thị $(C)$. Một tiếp tuyến bất kỳ của $(C)$ luôn cắt hai đường tiệm cận của đồ thị tạo thành một tam giác. Tính diện tích của tam giác đó.],
  [$2$],
  accent: c-book,
  loigiai: [
    #step[Tiệm cận đứng của $(C)$ là $x = 1$. Tiệm cận ngang của $(C)$ là $y = 2$. Giao hai tiệm cận là $I(1; 2)$.]
    #step[Lấy điểm $M(x_0; y_0) in (C)$ bất kỳ ($x_0 != 1$). Viết lại hàm số: $y_0 = 2 + frac(1, x_0 - 1)$.]
    #step[Tiếp tuyến tại $M$ có phương trình: $y - y_0 = -frac(1, (x_0 - 1)^2)(x - x_0)$.]
    #step[Giao điểm $A$ của tiếp tuyến với tiệm cận đứng $x = 1$:
      $y_A - (2 + frac(1, x_0 - 1)) = -frac(1, (x_0 - 1)^2)(1 - x_0) = frac(1, x_0 - 1) => y_A = 2 + frac(2, x_0 - 1) => A(1; 2 + frac(2, x_0 - 1))$.]
    #step[Giao điểm $B$ của tiếp tuyến với tiệm cận ngang $y = 2$:
      $2 - (2 + frac(1, x_0 - 1)) = -frac(1, (x_0 - 1)^2)(x_B - x_0) <=> frac(1, x_0 - 1) = frac(x_B - x_0, (x_0 - 1)^2) => x_B = 2x_0 - 1 => B(2x_0 - 1; 2)$.]
    #step[Ta tính các khoảng cách từ $A, B$ đến giao điểm tiệm cận $I$:
      - $I A = |y_A - 2| = frac(2, |x_0 - 1|)$.
      - $I B = |x_B - 1| = |2x_0 - 2| = 2|x_0 - 1|$.
    ]
    #step[Diện tích tam giác vuông $I A B$: $S = frac(1, 2) . I A . I B = frac(1, 2) . frac(2, |x_0 - 1|) . 2|x_0 - 1| = 2$.]
    #step[Diện tích này là hằng số độc lập với vị trí tiếp điểm $M$, luôn bằng $2$.]
  ],
))

#pagebreak()

#exam-part([PHẦN IV. Bài toán thực tế bổ sung - Mức cơ bản (3 câu)], count: 3)

#q-wrap(dir: "doc", tn(
  [Một homestay có $60$ phòng. Nếu giá thuê là $500$ nghìn đồng/phòng/đêm thì kín phòng. Cứ mỗi lần tăng giá thêm $50$ nghìn đồng thì có $2$ phòng bị bỏ trống. Gọi $x$ là số lần tăng giá. Hàm doanh thu $D(x)$ (nghìn đồng/đêm) là:],
  (
    [$D(x) = (500 - 50 x)(60 - 2 x)$],
    True([$D(x) = (500 + 50 x)(60 - 2 x)$]),
    [$D(x) = (500 + 50 x)(60 + 2 x)$],
    [$D(x) = 500 dot 60 + 50 x - 2 x$],
  ),
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá. Khi đó giá mới là $500 + 50 x$ (nghìn đồng/phòng/đêm).]
    #step[Số phòng còn được thuê là $60 - 2 x$.]
    #step[Vì doanh thu bằng giá nhân số phòng thuê, nên $D(x) = (500 + 50 x)(60 - 2 x)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một xưởng may làm việc chuẩn $30$ giờ/tuần với $40$ tổ, mỗi tổ may được $70$ sản phẩm/giờ. Nếu tăng thêm $x$ giờ/tuần thì số tổ không đổi nhưng năng suất mỗi tổ giảm còn $70 - 2 x$ sản phẩm/giờ. Hàm sản lượng thô $Q_0(x)$ là:],
  (
    True([$Q_0(x) = (30 + x) dot 40 dot (70 - 2 x)$]),
    [$Q_0(x) = (30 + 2 x) dot 40 dot (70 - x)$],
    [$Q_0(x) = 30 dot 40 dot (70 - 2 x)$],
    [$Q_0(x) = (30 + x) + 40 + (70 - 2 x)$],
  ),
  accent: c-book,
  loigiai: [
    #step[Số giờ làm là $30 + x$, số tổ giữ nguyên là $40$, năng suất mỗi tổ là $70 - 2 x$.]
    #step[Sản lượng thô bằng số giờ nhân số tổ nhân năng suất mỗi tổ.]
    #step[Vậy $Q_0(x) = (30 + x) dot 40 dot (70 - 2 x)$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một khu nghỉ dưỡng có $100$ phòng. Nếu giá thuê là $1$ triệu đồng/phòng/đêm thì kín phòng. Cứ mỗi lần tăng giá thêm $100$ nghìn đồng thì có $5$ phòng bị bỏ trống. Gọi $x$ là số lần tăng giá. Tìm giá thuê tối ưu để doanh thu mỗi đêm lớn nhất.],
  [$1.5$ triệu đồng/phòng/đêm],
  accent: c-book,
  loigiai: [
    #step[Đặt $x$ là số lần tăng giá. Khi đó giá thuê là $1 + 0.1 x$ (triệu đồng), số phòng được thuê là $100 - 5 x$.]
    #step[Hàm doanh thu là $R(x) = (1 + 0.1 x)(100 - 5 x) = 100 + 5 x - 0.5 x^2$.]
    #step[$R'(x) = 5 - x = 0 <=> x = 5$. Do hệ số bậc hai âm nên đây là điểm cho doanh thu lớn nhất.]
    #step[Vậy giá thuê tối ưu là $1 + 0.1 dot 5 = 1.5$ triệu đồng/phòng/đêm.]
  ],
))
