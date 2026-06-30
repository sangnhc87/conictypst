#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.frac: math.display

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  subject: "TOÁN - LỚP 11",
  school: "ÔN TẬP CHƯƠNG ĐẠO HÀM",
  exam-title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 01)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho hàm số $y = f(x)$ xác định trên khoảng $(a; b)$ và $x_0 in (a; b)$. Đạo hàm của hàm số $y = f(x)$ tại điểm $x_0$ được định nghĩa bởi công thức nào sau đây?],
    (
        [$f'(x_0) = limits(lim)_(x -> x_0) (f(x) + f(x_0))/(x - x_0)$],
        True([$f'(x_0) = limits(lim)_(x -> x_0) (f(x) - f(x_0))/(x - x_0)$]),
        [$f'(x_0) = limits(lim)_(x -> x_0) (f(x) - f(x_0))/(x + x_0)$],
        [$f'(x_0) = limits(lim)_(x -> 0) (f(x) - f(x_0))/(x - x_0)$]
    ),
    loigiai: [
        Theo định nghĩa đạo hàm của hàm số tại một điểm, ta có:
        $ f'(x_0) = limits(lim)_(x -> x_0) (f(x) - f(x_0))/(x - x_0) $.
        Chọn đáp án B.
    ]
)

// TN 2
#tn([Tính đạo hàm của hàm số $y = 2x^3 - 3x^2 + 5x - 1$.],
    (
        [$y' = 6x^2 - 6x$],
        True([$y' = 6x^2 - 6x + 5$]),
        [$y' = 2x^2 - 3x + 5$],
        [$y' = 6x^2 - 3x + 5$]
    ),
    loigiai: [
        Áp dụng quy tắc tính đạo hàm của hàm đa thức:
        $ y' = (2x^3)' - (3x^2)' + (5x)' - (1)' = 6x^2 - 6x + 5 $.
        Chọn đáp án B.
    ]
)

// TN 3
#tn([Cho hàm số $y = (2x - 1)/(x + 1)$. Đạo hàm của hàm số đã cho là:],
    (
        [$y' = (1)/((x + 1)^2)$],
        [$y' = (-3)/((x + 1)^2)$],
        True([$y' = (3)/((x + 1)^2)$]),
        [$y' = (2)/((x + 1)^2)$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm thương $(u/v)' = (u' v - u v')/(v^2)$ hoặc công thức nhanh $((a x + b)/(c x + d))' = (a d - b c)/((c x + d)^2)$:
        $ y' = (2 dot 1 - (-1) dot 1)/((x + 1)^2) = (3)/((x + 1)^2) $.
        Chọn đáp án C.
    ]
)

// TN 4
#tn([Tính đạo hàm của hàm số $y = sqrt(x^2 + 3)$.],
    (
        [$y' = (1)/(2 sqrt(x^2 + 3))$],
        True([$y' = (x)/(sqrt(x^2 + 3))$]),
        [$y' = (2x)/(sqrt(x^2 + 3))$],
        [$y' = (x)/(2 sqrt(x^2 + 3))$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm hợp căn thức $(sqrt(u))' = (u')/(2 sqrt(u))$:
        $ y' = ((x^2 + 3)')/(2 sqrt(x^2 + 3)) = (2x)/(2 sqrt(x^2 + 3)) = (x)/(sqrt(x^2 + 3)) $.
        Chọn đáp án B.
    ]
)

// TN 5
#tn([Tính đạo hàm của hàm số lượng giác $y = sin(2x - pi/3)$.],
    (
        [$y' = cos(2x - pi/3)$],
        True([$y' = 2 cos(2x - pi/3)$]),
        [$y' = -2 cos(2x - pi/3)$],
        [$y' = 2 sin(2x - pi/3)$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm hợp lượng giác $(sin u)' = u' dot cos u$:
        $ y' = (2x - pi/3)' dot cos(2x - pi/3) = 2 cos(2x - pi/3) $.
        Chọn đáp án B.
    ]
)

// TN 6
#tn([Hệ số góc $k$ của tiếp tuyến của đồ thị hàm số $y = x^3 - 3x + 2$ tại điểm có hoành độ $x_0 = 2$ bằng bao nhiêu?],
    (
        [$k = 6$],
        True([$k = 9$]),
        [$k = 12$],
        [$k = 3$]
    ),
    loigiai: [
        - Ta có đạo hàm $y' = 3x^2 - 3$.
        - Hệ số góc của tiếp tuyến tại điểm có hoành độ $x_0 = 2$ là:
          $ k = y'(2) = 3 dot 2^2 - 3 = 12 - 3 = 9 $.
        Chọn đáp án B.
    ]
)

// TN 7
#tn([Phương trình tiếp tuyến của đồ thị hàm số $y = x^2 - 4x + 3$ tại điểm $M(3; 0)$ là:],
    (
        [$y = 2x + 6$],
        True([$y = 2x - 6$]),
        [$y = -2x + 6$],
        [$y = 4x - 12$]
    ),
    loigiai: [
        - Ta có $y' = 2x - 4 ==> y'(3) = 2 dot 3 - 4 = 2$.
        - Phương trình tiếp tuyến tại $M(3; 0)$ là:
          $ y = y'(3)(x - 3) + 0 <==> y = 2(x - 3) <==> y = 2x - 6 $.
        Chọn đáp án B.
    ]
)

// TN 8
#tn([Một vật chuyển động theo phương trình $s(t) = t^3 - 3t^2 + 4t$, trong đó $t$ tính bằng giây ($t >= 0$), $s$ tính bằng mét. Vận tốc tức thời của vật tại thời điểm $t = 3$ giây bằng bao nhiêu?],
    (
        [$9" "m/s""$],
        True([$13" "m/s""$]),
        [$15" "m/s""$],
        [$22" "m/s""$]
    ),
    loigiai: [
        - Vận tốc tức thời của chuyển động tại thời điểm $t$ là đạo hàm của hàm số quãng đường:
          $ v(t) = s'(t) = 3t^2 - 6t + 4 $.
        - Vận tốc tức thời tại thời điểm $t = 3$ giây là:
          $ v(3) = 3 dot 3^2 - 6 dot 3 + 4 = 27 - 18 + 4 = 13" "m/s"" $.
        Chọn đáp án B.
    ]
)

// TN 9
#tn([Cho hàm số $f(x) = x^4 - 2x^2 + 1$. Giá trị của đạo hàm cấp hai $f''(1)$ bằng bao nhiêu?],
    (
        [$4$],
        True([$8$]),
        [$12$],
        [$0$]
    ),
    loigiai: [
        - Đạo hàm cấp một: $f'(x) = 4x^3 - 4x$.
        - Đạo hàm cấp hai: $f''(x) = (f'(x))' = 12x^2 - 4$.
        - Suy ra $f''(1) = 12 dot 1^2 - 4 = 8$.
        Chọn đáp án B.
    ]
)

// TN 10
#tn([Tiếp tuyến của đồ thị hàm số $y = 1/3 x^3 - 2x^2 + 3x + 1$ song song với đường thẳng $y = -x + 2$ có hệ số góc $k$ bằng:],
    (
        [$k = 1$],
        True([$k = -1$]),
        [$k = -2$],
        [$k = 3$]
    ),
    loigiai: [
        Vì tiếp tuyến song song với đường thẳng $y = -x + 2$ nên hệ số góc của tiếp tuyến bằng hệ số góc của đường thẳng đó, tức là $k = -1$.
        Chọn đáp án B.
    ]
)

// TN 11
#tn([Cho hàm số $f(x) = 1/3 x^3 - x^2 - 3x + 2$. Tập nghiệm của bất phương trình $f'(x) <= 0$ là:],
    (
        [$(-oo; -1] union [3; +oo)$],
        True([$[-1; 3]$]),
        [$[-3; 1]$],
        [$(-text{ố}; 3]$]
    ),
    loigiai: [
        - Ta có đạo hàm: $f'(x) = x^2 - 2x - 3$.
        - Bất phương trình $f'(x) <= 0 <==> x^2 - 2x - 3 <= 0 <==> -1 <= x <= 3$.
        - Vậy tập nghiệm là $[-1; 3]$.
        Chọn đáp án B.
    ]
)

// TN 12
#tn([Tính đạo hàm của hàm số lượng giác $y = cos^2(3x)$.],
    (
        [$y' = -sin(6x)$],
        True([$y' = -3 sin(6x)$]),
        [$y' = 3 sin(6x)$],
        [$y' = -6 cos(3x) sin(3x)$]
    ),
    loigiai: [
        - Áp dụng công thức đạo hàm hàm hợp $(u^2)' = 2u u'$ và $(cos 3x)' = -3 sin 3x$:
          $ y' = 2 cos(3x) dot (cos 3x)' = 2 cos(3x) dot (-3 sin 3x) = -3 (2 sin 3x cos 3x) = -3 sin(6x) $.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hàm số $y = f(x) = x^3 - 3x^2 + 2$ có đồ thị $(C)$. Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm của hàm số đã cho là $f'(x) = 3x^2 - 6x$.]),
        True([Phương trình tiếp tuyến của đồ thị $(C)$ tại điểm $A(1; 0)$ là $y = -3x + 3$.]),
        False([Hệ số góc nhỏ nhất của tiếp tuyến của đồ thị $(C)$ bằng $0$.]),
        True([Có đúng 2 tiếp tuyến của đồ thị $(C)$ song song với đường thẳng $d: y = 9x - 5$.])
    ),
    loigiai: [
        - *a)* Đúng. $f'(x) = (x^3 - 3x^2 + 2)' = 3x^2 - 6x$.
        - *b)* Đúng. Tại $A(1; 0)$, ta có $f'(1) = 3(1)^2 - 6(1) = -3$. P T T T là $y = -3(x - 1) + 0 <==> y = -3x + 3$.
        - *c)* Sai. Ta có hệ số góc tiếp tuyến $k = f'(x) = 3x^2 - 6x = 3(x - 1)^2 - 3 >= -3$. Vậy hệ số góc nhỏ nhất bằng $-3$ (xảy ra tại $x = 1$), chứ không phải $0$.
        - *d)* Đúng. Tiếp tuyến song song với $d: y = 9x - 5 ==> f'(x) = 9 <==> 3x^2 - 6x = 9 <==> x^2 - 2x - 3 = 0 <==> x = -1$ hoặc $x = 3$. Hai tiếp điểm này tạo ra 2 tiếp tuyến phân biệt là $y = 9x + 7$ và $y = 9x - 25$ (đều song song với $d$).
    ]
)

// DS 2
#ds([Một vật chuyển động thẳng xác định bởi phương trình quãng đường $s(t) = t^3 - 6t^2 + 15t + 2$, trong đó $t$ tính bằng giây ($t >= 0$), $s$ tính bằng mét. Các phát biểu sau đúng hay sai?],
    (
        True([Vận tốc tức thời của vật tại thời điểm $t$ là $v(t) = 3t^2 - 12t + 15$ ("m/s").]),
        False([Tại thời điểm $t = 1$ giây, vận tốc của vật bằng $8$ "m/s".]),
        True([Vận tốc tức thời của vật đạt giá trị nhỏ nhất tại thời điểm $t = 2$ giây.]),
        True([Gia tốc tức thời của vật tại thời điểm vận tốc đạt giá trị nhỏ nhất bằng $0" "m/s""^2$.])
    ),
    loigiai: [
        - *a)* Đúng. Vận tốc tức thời $v(t) = s'(t) = 3t^2 - 12t + 15$ ("m/s").
        - *b)* Sai. Thay $t = 1$ vào $v(t)$, ta được $v(1) = 3(1)^2 - 12(1) + 15 = 6$ "m/s" (chứ không phải 8 "m/s").
        - *c)* Đúng. Ta có $v(t) = 3(t^2 - 4t + 4) + 3 = 3(t - 2)^2 + 3 >= 3$. Vận tốc nhỏ nhất bằng $3$ "m/s" tại $t = 2$ giây.
        - *d)* Đúng. Gia tốc tức thời là đạo hàm của vận tốc: $a(t) = v'(t) = 6t - 12$. Tại $t = 2 ==> a(2) = 6(2) - 12 = 0" "m/s""^2$.
    ]
)

// DS 3
#ds([Cho hàm số $y = (2x + 1)/(x - 1)$ có đồ thị $(H)$. Các phát biểu sau đúng hay sai?],
    (
        True([Tập xác định của hàm số là $D = RR setminus {1}$.]),
        True([Đạo hàm của hàm số là $y' = (-3)/((x - 1)^2)$ với mọi $x neq 1$.]),
        False([Tiếp tuyến của đồ thị $(H)$ tại điểm có hoành độ $x_0 = 2$ có hệ số góc bằng $3$.]),
        True([Tiếp tuyến của đồ thị $(H)$ tại điểm có tung độ $y_0 = 5$ có phương trình là $y = -3x + 11$.])
    ),
    loigiai: [
        - *a)* Đúng. Điều kiện mẫu số khác 0: $x - 1 neq 0 <==> x neq 1 ==> D = RR setminus {1}$.
        - *b)* Đúng. $y' = (2(x-1) - 1(2x+1))/((x-1)^2) = (-3)/((x-1)^2)$.
        - *c)* Sai. Tại $x_0 = 2$, hệ số góc tiếp tuyến là $y'(2) = (-3)/((2 - 1)^2) = -3$ (chứ không phải $3$).
        - *d)* Đúng. Tung độ $y_0 = 5 <==> (2x_0 + 1)/(x_0 - 1) = 5 <==> 2x_0 + 1 = 5x_0 - 5 <==> 3x_0 = 6 <==> x_0 = 2$. Hệ số góc $y'(2) = -3$. P T T T tại $M(2; 5)$ là $y = -3(x - 2) + 5 <==> y = -3x + 11$.
    ]
)

// DS 4
#ds([Cho hàm số $f(x) = sin x - cos x$. Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm của hàm số là $f'(x) = cos x + sin x$.]),
        True([Giá trị của đạo hàm tại $x = pi/4$ bằng $sqrt(2)$.]),
        False([Đạo hàm cấp hai của hàm số là $f''(x) = sin x - cos x$.]),
        True([Trên đoạn $[0; pi]$, phương trình $f'(x) = 0$ có nghiệm duy nhất $x = (3pi)/(4)$.])
    ),
    loigiai: [
        - *a)* Đúng. $f'(x) = (sin x)' - (cos x)' = cos x - (-sin x) = cos x + sin x$.
        - *b)* Đúng. $f'(pi/4) = cos(pi/4) + sin(pi/4) = (sqrt(2))/(2) + (sqrt(2))/(2) = sqrt(2)$.
        - *c)* Sai. Đạo hàm cấp hai $f''(x) = (cos x + sin x)' = -sin x + cos x = -(sin x - cos x) = -f(x)$ (thiếu dấu trừ trong phát biểu).
        - *d)* Đúng. Trên $[0; pi]$, $f'(x) = 0 <==> cos x + sin x = 0 <==> tan x = -1 <==> x = (3pi)/(4)$. Phương trình có đúng 1 nghiệm trên $[0; pi]$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#tln([Cho hàm số $f(x) = (x^2 + 2x - 3)/(x + 2)$. Tính giá trị của đạo hàm $f'(0)$.],
    [1.75],
    loigiai: [
        - Tính đạo hàm theo quy tắc hàm thương:
          $ f'(x) = ((2x + 2)(x + 2) - 1(x^2 + 2x - 3))/((x + 2)^2) = (2x^2 + 6x + 4 - x^2 - 2x + 3)/((x + 2)^2) = (x^2 + 4x + 7)/((x + 2)^2) $.
        - Thay $x = 0$ vào $f'(x)$:
          $ f'(0) = (0^2 + 4 dot 0 + 7)/((0 + 2)^2) = (7)/(4) = 1.75 $.
        Đáp số: $1.75$.
    ]
)

// TLN 2
#tln([Cho hàm số $y = x^3 - 3x^2 + 4$. Tiếp tuyến của đồ thị hàm số tại điểm có hoành độ $x_0 = 3$ cắt trục tung tại điểm có tung độ bằng bao nhiêu?],
    [-23],
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 6x ==> y'(3) = 3 dot 3^2 - 6 dot 3 = 9$.
        - Tung độ tiếp điểm: $y(3) = 3^3 - 3 dot 3^2 + 4 = 4 ==> M(3; 4)$.
        - Phương trình tiếp tuyến: $y = 9(x - 3) + 4 <==> y = 9x - 23$.
        - Cho $x = 0 ==> y = -23$. Vậy tiếp tuyến cắt trục tung tại điểm có tung độ bằng $-23$.
        Đáp số: $-23$.
    ]
)

// TLN 3
#tln([Điện lượng $Q$ (tính bằng Coulomb, C) truyền qua một dây dẫn thay đổi theo thời gian $t$ (tính bằng giây, $t >= 0$) được cho bởi công thức $Q(t) = 2t^3 - 3t^2 + 10t + 5$. Tính cường độ dòng điện tức thời $I$ truyền qua dây dẫn tại thời điểm $t = 2$ giây (tính bằng Ampe, A).],
    [22],
    loigiai: [
        - Cường độ dòng điện tức thời tại thời điểm $t$ là đạo hàm của điện lượng theo thời gian:
          $ I(t) = Q'(t) = 6t^2 - 6t + 10" (A)" $.
        - Tại thời điểm $t = 2$ giây:
          $ I(2) = 6 dot 2^2 - 6 dot 2 + 10 = 24 - 12 + 10 = 22" A" $.
        Đáp số: $22$.
    ]
)

// TLN 4
#tln([Cho hàm số $y = -x^3 + 3x^2 - 2$ có đồ thị $(C)$. Biết rằng đồ thị $(C)$ có hai tiếp tuyến cùng song song với đường thẳng $y = -9x + 5$. Tổng tung độ của hai tiếp điểm tương ứng của hai tiếp tuyến này bằng bao nhiêu?],
    [0],
    loigiai: [
        - Ta có đạo hàm $y' = -3x^2 + 6x$.
        - Tiếp tuyến song song với đường thẳng $y = -9x + 5 ==> y' = -9 <==> -3x^2 + 6x = -9 <==> 3x^2 - 6x - 9 = 0 <==> x = -1$ hoặc $x = 3$.
        - Với $x_1 = -1 ==> y_1 = -(-1)^3 + 3(-1)^2 - 2 = 2$.
        - Với $x_2 = 3 ==> y_2 = -(3)^3 + 3(3)^2 - 2 = -2$.
        - Tổng tung độ của hai tiếp điểm là: $y_1 + y_2 = 2 + (-2) = 0$.
        Đáp số: $0$.
    ]
)

// TLN 5
#tln([Một vật chuyển động có phương trình quãng đường $s(t) = t^4 - 2t^2 + 5t$ (mét), với $t$ tính bằng giây ($t >= 0$). Gia tốc tức thời của vật tại thời điểm $t = 2$ giây bằng bao nhiêu (tính bằng $"m/s"^2$)?],
    [44],
    loigiai: [
        - Vận tốc tức thời $v(t) = s'(t) = 4t^3 - 4t + 5$.
        - Gia tốc tức thời $a(t) = v'(t) = s''(t) = 12t^2 - 4$.
        - Tại thời điểm $t = 2$ giây:
          $ a(2) = 12 dot 2^2 - 4 = 48 - 4 = 44" "m/s""^2 $.
        Đáp số: $44$.
    ]
)

// TLN 6
#tln([Cho hàm số $y = x^2 - 4x + 3$. Tiếp tuyến của đồ thị hàm số vuông góc với đường thẳng $d: y = -1/2 x + 5$ cắt hai trục tọa độ $O x, O y$ tạo thành một tam giác vuông. Tính diện tích của tam giác vuông đó.],
    [9],
    loigiai: [
        - Tiếp tuyến vuông góc với $d: y = -1/2 x + 5 ==>$ Hệ số góc tiếp tuyến $k$ thỏa mãn $k dot (-1/2) = -1 ==> k = 2$.
        - Ta có $y' = 2x - 4 = 2 <==> 2x = 6 <==> x_0 = 3$.
        - Tung độ tiếp điểm $y_0 = 3^2 - 4 dot 3 + 3 = 0 ==> M(3; 0)$.
        - Phương trình tiếp tuyến là $y = 2(x - 3) + 0 <==> y = 2x - 6$.
        - Giao điểm với $O x$ (thay $y=0$): $x = 3 ==> A(3; 0) ==> O A = 3$.
        - Giao điểm với $O y$ (thay $x=0$): $y = -6 ==> B(0; -6) ==> O B = 6$.
        - Diện tích tam giác vuông $O A B$ là: $S = 1/2 O A dot O B = 1/2 dot 3 dot 6 = 9$.
        Đáp số: $9$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
