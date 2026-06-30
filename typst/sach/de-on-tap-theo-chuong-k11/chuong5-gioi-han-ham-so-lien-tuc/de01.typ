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
  school: "ÔN TẬP CHƯƠNG 5",
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 01)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Giới hạn của dãy số $u_n = (1)/(n)$ khi $n -> +oo$ bằng bao nhiêu?],
    (
        True([$0$]),
        [$1$],
        [$+oo$],
        [Không tồn tại.]
    ),
    loigiai: [
        Theo giới hạn cơ bản của dãy số, ta có:
        $ limits(lim)_(n -> +oo) (1)/(n) = 0 $.
    ]
)

// TN 2
#tn([Tìm giới hạn của dãy số $u_n = (2n + 1)/(n - 3)$ khi $n -> +oo$.],
    (
        [$1$],
        True([$2$]),
        [$-3$],
        [$- (1)/(3)$]
    ),
    loigiai: [
        Chia cả tử và mẫu cho $n$, ta được:
        $ limits(lim)_(n -> +oo) (2n + 1)/(n - 3) = limits(lim)_(n -> +oo) (2 + (1)/(n))/(1 - (3)/(n)) = (2 + 0)/(1 - 0) = 2 $.
    ]
)

// TN 3
#tn([Nồng độ một loại thuốc trong máu của bệnh nhân giảm dần sau khi uống. Số miligam thuốc còn lại trong cơ thể sau $n$ giờ được mô hình hóa bởi dãy số $C_n = 4 dot (0.5)^n$. Khi $n -> +oo$, nồng độ thuốc trong cơ thể tiến dần về giá trị nào?],
    (
        [$4$ mg.],
        [$2$ mg.],
        True([$0$ mg.]),
        [$0.5$ mg.]
    ),
    loigiai: [
        Ta có $|0.5| < 1$, do đó theo giới hạn của cấp số nhân lùi vô hạn:
        $ limits(lim)_(n -> +oo) C_n = limits(lim)_(n -> +oo) [4 dot (0.5)^n] = 4 dot 0 = 0 $.
        Vậy nồng độ thuốc trong cơ thể tiến dần về $0$ mg.
    ]
)

// TN 4
#tn([Tính tổng của cấp số nhân lùi vô hạn $S = 1 + (1)/(2) + (1)/(4) + ... + ((1)/(2))^n + ...$],
    (
        [$1$],
        [$1.5$],
        True([$2$]),
        [$+oo$]
    ),
    loigiai: [
        Đây là tổng của cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 1$ và công bội $q = (1)/(2)$.
        Áp dụng công thức tính tổng:
        $ S = (u_1)/(1 - q) = (1)/(1 - (1)/(2)) = 2 $.
    ]
)

// TN 5
#tn([Tìm giới hạn $limits(lim)_(x -> 2) (x^2 - 4)/(x - 2)$.],
    (
        [$2$],
        True([$4$]),
        [$0$],
        [Không tồn tại.]
    ),
    loigiai: [
        Ta phân tích tử số thành nhân tử để khử dạng vô định $((0)/(0))$:
        $ limits(lim)_(x -> 2) (x^2 - 4)/(x - 2) = limits(lim)_(x -> 2) ((x - 2)(x + 2))/(x - 2) = limits(lim)_(x -> 2) (x + 2) = 2 + 2 = 4 $.
    ]
)

// TN 6
#tn([Tính giới hạn một bên $limits(lim)_(x -> 1^+) (2x + 1)/(x - 1)$.],
    (
        [$3$],
        [$-oo$],
        True([$+oo$]),
        [$0$]
    ),
    loigiai: [
        Khi $x -> 1^+$, ta có tử số $2x + 1 -> 3 > 0$, còn mẫu số $x - 1 -> 0$ và $x - 1 > 0$ (vì $x > 1$).
        Do đó:
        $ limits(lim)_(x -> 1^+) (2x + 1)/(x - 1) = +oo $.
    ]
)

// TN 7
#tn([Tìm giới hạn $limits(lim)_(x -> -oo) (3x^2 - x + 1)/(x^2 + 2)$.],
    (
        [$-oo$],
        [$0$],
        True([$3$]),
        [$+oo$]
    ),
    loigiai: [
        Chia cả tử và mẫu cho $x^2$, ta được:
        $ limits(lim)_(x -> -oo) (3x^2 - x + 1)/(x^2 + 2) = limits(lim)_(x -> -oo) (3 - (1)/(x) + (1)/(x^2))/(1 + (2)/(x^2)) = (3 - 0 + 0)/(1 + 0) = 3 $.
    ]
)

// TN 8
#tn([Dân số của một thành phố sau $t$ năm kể từ năm 2026 được mô hình hóa bởi hàm số $P(t) = 50 + (10t + 5)/(2t + 1)$ (triệu người). Khi thời gian $t -> +oo$, dân số thành phố sẽ tiến dần về giá trị ổn định nào?],
    (
        [$50$ triệu người.],
        True([$55$ triệu người.]),
        [$60$ triệu người.],
        [$10$ triệu người.]
    ),
    loigiai: [
        Ta tính giới hạn của hàm số $P(t)$ khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) [50 + (10t + 5)/(2t + 1)] = 50 + limits(lim)_(t -> +oo) (10 + (5)/(t))/(2 + (1)/(t)) = 50 + (10)/(2) = 55 $.
        Vậy dân số tiến dần về $55$ triệu người.
    ]
)

// TN 9
#tn([Tìm giá trị của tham số $m$ để hàm số $f(x) = cases((x^2 - 9)/(x - 3) "khi" x != 3, m - 1 "khi" x = 3)$ liên tục tại điểm $x = 3$.],
    (
        [$m = 6$],
        True([$m = 7$]),
        [$m = 5$],
        [$m = 3$]
    ),
    loigiai: [
        Để hàm số liên tục tại $x = 3$, ta cần:
        $ limits(lim)_(x -> 3) f(x) = f(3) $.
        Ta có:
        $ limits(lim)_(x -> 3) f(x) = limits(lim)_(x -> 3) (x^2 - 9)/(x - 3) = limits(lim)_(x -> 3) (x + 3) = 6 $.
        Mà $f(3) = m - 1$.
        Do đó:
        $ m - 1 = 6 => m = 7 $.
    ]
)

// TN 10
#tn([Hàm số nào sau đây gián đoạn trên tập số thực $RR$?],
    (
        [$y = x^2 - 2x$],
        [$y = sin x$],
        True([$y = (x + 1)/(x - 2)$]),
        [$y = cos x$]
    ),
    loigiai: [
        Hàm số phân thức $y = (x + 1)/(x - 2)$ có điều kiện xác định là $x != 2$, do đó nó gián đoạn tại điểm $x = 2$.
    ]
)

// TN 11
#tn([Cho phương trình $x^3 - 3x + 1 = 0$. Khẳng định nào sau đây đúng?],
    (
        [Phương trình vô nghiệm trên $RR$.],
        True([Phương trình có ít nhất một nghiệm thuộc khoảng $(0; 1)$.]),
        [Phương trình chỉ có nghiệm âm.],
        [Phương trình không có nghiệm trong khoảng $(0; 1)$.]
    ),
    loigiai: [
        Xét hàm số liên tục $f(x) = x^3 - 3x + 1$ trên đoạn $[0; 1]$.
        Ta có:
        - $f(0) = 1 > 0$.
        - $f(1) = 1 - 3 + 1 = -1 < 0$.
        Vì $f(0) dot f(1) = -1 < 0$ nên theo định lý về giá trị trung gian, phương trình có ít nhất một nghiệm thuộc khoảng $(0; 1)$.
    ]
)

// TN 12
#tn([Một dịch vụ taxi có giá cước $f(x)$ (nghìn đồng) tính theo quãng đường di chuyển $x$ (km) là một hàm số bậc thang có các điểm nhảy tại các giá trị nguyên của quãng đường. Hàm số này biểu diễn đặc điểm nào của hàm số liên tục?],
    (
        [Hàm số liên tục trên mọi điểm.],
        True([Hàm số có điểm gián đoạn biểu thị bước nhảy đột ngột của giá cước.]),
        [Hàm số không có giới hạn tại mọi điểm.],
        [Hàm số luôn đồng biến.]
    ),
    loigiai: [
        Giá cước taxi nhảy vọt khi bước sang km tiếp theo, điều này được mô hình hóa bằng các điểm gián đoạn của hàm số bậc thang.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho hai dãy số $(u_n)$ và $(v_n)$ với $u_n = (n^2 + 1)/(2n^2 - n)$ và $v_n = sqrt(n^2 + 2n) - n$. Các phát biểu sau đúng hay sai?], (
        True([Giới hạn của dãy số $(u_n)$ bằng $(1)/(2)$.]),
        [Dãy số $(v_n)$ không có giới hạn hữu hạn khi $n -> +oo$.],
        True([Giới hạn của dãy số tích $u_n dot v_n$ bằng $(1)/(2)$.]),
        [Dãy số hiệu $w_n = u_n - v_n$ hội tụ về $0$.]
    ), 
    loigiai: [
        - *a)* Đúng. $limits(lim)_(n -> +oo) u_n = limits(lim)_(n -> +oo) (1 + (1)/(n^2))/(2 - (1)/(n)) = (1)/(2)$.
        - *b)* Sai. Nhân liên hợp cho $v_n$:
          $ v_n = (n^2 + 2n - n^2)/(sqrt(n^2 + 2n) + n) = (2n)/(n sqrt(1 + (2)/(n)) + n) = (2)/(sqrt(1 + (2)/(n)) + 1) -> (2)/(1 + 1) = 1 $.
          Do đó dãy $(v_n)$ có giới hạn hữu hạn bằng $1$.
        - *c)* Đúng. $limits(lim)_(n -> +oo) (u_n dot v_n) = (1)/(2) dot 1 = (1)/(2)$.
        - *d)* Sai. $limits(lim)_(n -> +oo) (u_n - v_n) = (1)/(2) - 1 = - (1)/(2) != 0$.
    ]
)

// DS 2
#ds([Cho hàm số $f(x) = (x^2 - 3x + 2)/(x - 2)$ khi $x != 2$, và $f(2) = 1$. Các phát biểu sau đúng hay sai?], (
        True([Giới hạn $limits(lim)_(x -> 2) f(x) = 1$.]),
        True([Hàm số $f(x)$ liên tục tại điểm $x = 2$.]),
        [Giới hạn $limits(lim)_(x -> +oo) f(x) = 1$.],
        [Đồ thị hàm số $y = f(x)$ có tiệm cận đứng là đường thẳng $x = 2$.]
    ), 
    loigiai: [
        - *a)* Đúng. Với $x != 2$, ta có:
          $ f(x) = ((x - 2)(x - 1))/(x - 2) = x - 1 $.
          Do đó $limits(lim)_(x -> 2) f(x) = limits(lim)_(x -> 2) (x - 1) = 2 - 1 = 1$.
        - *b)* Đúng. Vì $limits(lim)_(x -> 2) f(x) = f(2) = 1$ nên hàm số liên tục tại điểm $x = 2$.
        - *c)* Sai. $limits(lim)_(x -> +oo) f(x) = limits(lim)_(x -> +oo) (x - 1) = +oo$.
        - *d)* Sai. Đồ thị hàm số thực chất là đường thẳng $y = x - 1$ khuyết điểm $(2; 1)$, nay được bù lại điểm $f(2)=1$, nên không có đường tiệm cận đứng nào.
    ]
)

// DS 3
#ds([Cho hàm số $f(x) = cases((a x^2 + 2x - 3)/(x - 1) "khi" x > 1, b x - 1 "khi" x <= 1)$. Các phát biểu sau đúng hay sai?], (
        True([Khi $a = 1$, giới hạn bên phải $limits(lim)_(x -> 1^+) f(x) = 4$.]),
        True([Để giới hạn $limits(lim)_(x -> 1^+) f(x)$ tồn tại hữu hạn thì giá trị tham số $a$ phải bằng $1$.]),
        True([Với $a = 1$, để hàm số liên tục tại $x = 1$ thì giá trị tham số $b$ phải bằng $5$.]),
        [Với mọi giá trị của $a$ và $b$, hàm số luôn gián đoạn tại điểm $x = 1$.]
    ), 
    loigiai: [
        - *a)* Đúng. Khi $a = 1$:
          $ limits(lim)_(x -> 1^+) f(x) = limits(lim)_(x -> 1^+) (x^2 + 2x - 3)/(x - 1) = limits(lim)_(x -> 1^+) ((x - 1)(x + 3))/(x - 1) = limits(lim)_(x -> 1^+) (x + 3) = 4 $.
        - *b)* Đúng. Mẫu số có giới hạn bằng $0$ khi $x -> 1^+$. Để giới hạn tồn tại hữu hạn thì tử số phải nhận $x = 1$ làm nghiệm, tức là $a dot 1^2 + 2 dot 1 - 3 = 0 => a = 1$.
        - *c)* Đúng. Khi $a = 1$, giới hạn phải bằng $4$. Giới hạn trái bằng giá trị hàm số:
          $ limits(lim)_(x -> 1^-) f(x) = f(1) = b dot 1 - 1 = b - 1 $.
          Để hàm số liên tục tại $x = 1$ thì:
          $ b - 1 = 4 => b = 5 $.
        - *d)* Sai. Với $a = 1, b = 5$, hàm số liên tục tại $x = 1$.
    ]
)

// DS 4
#ds([Sự phát triển của một quần thể vi khuẩn trong phòng thí nghiệm được mô hình hóa bởi hàm số:
    $N(t) = (1000t + 500)/(0.2t + 1)$ (con),
    trong đó $t >= 0$ là thời gian tính bằng ngày. Các phát biểu sau đúng hay sai?], (
        True([Số lượng vi khuẩn ban đầu lúc bắt đầu thí nghiệm ($t = 0$) là $500$ con.]),
        [Sau $5$ ngày thí nghiệm, số lượng vi khuẩn của quần thể đạt đúng $3000$ con.],
        [Khi thời gian nghiên cứu kéo dài vô hạn ($t -> +oo$), số lượng vi khuẩn sẽ tăng lên vô hạn.],
        True([Giới hạn tối đa của quần thể vi khuẩn này (ngưỡng bão hòa) là $5000$ con.])
    ), 
    loigiai: [
        - *a)* Đúng. Số lượng vi khuẩn ban đầu là $N(0) = (1000 dot 0 + 500)/(0.2 dot 0 + 1) = 500$ con.
        - *b)* Sai. Sau $5$ ngày:
          $ N(5) = (1000 dot 5 + 500)/(0.2 dot 5 + 1) = (5500)/(2) = 2750 $ con (khác $3000$ con).
        - *c)* Sai. Giới hạn khi $t -> +oo$ là hữu hạn:
          $ limits(lim)_(t -> +oo) N(t) = limits(lim)_(t -> +oo) (1000 + (500)/(t))/(0.2 + (1)/(t)) = (1000)/(0.2) = 5000 $ con.
        - *d)* Đúng. Số lượng vi khuẩn sẽ tiến dần tiệm cận về $5000$ con và không vượt quá ngưỡng này.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một quả bóng cao su được thả rơi từ độ cao $12$ m xuống đất. Mỗi lần chạm đất, quả bóng nảy ngược lên độ cao bằng $(3)/(4)$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường quả bóng đã di chuyển (bao gồm cả quãng đường rơi xuống và nảy lên) cho đến khi nó hoàn toàn dừng lại (tính bằng mét).],
    [84],
    loigiai: [
        Quãng đường di chuyển của quả bóng bao gồm:
        - Lần rơi đầu tiên: $12$ m.
        - Các lần nảy lên và rơi xuống tiếp theo tạo thành các cặp quãng đường bằng nhau:
          $ S_1 = 2 dot [12 dot (3)/(4)] = 18 $ m.
          $ S_2 = 2 dot [12 dot ((3)/(4))^2] $ m.
          ...
        Tổng quãng đường bóng di chuyển là:
        $ S = 12 + 2 dot [ 12 dot ((3)/(4)) + 12 dot ((3)/(4))^2 + 12 dot ((3)/(4))^3 + ... ] $
        Biểu thức trong ngoặc vuông là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 9$ và công bội $q = (3)/(4)$.
        $ S_("trong ngoặc") = (u_1)/(1 - q) = (9)/(1 - (3)/(4)) = 36 $.
        Vậy tổng quãng đường bóng di chuyển là:
        $ S = 12 + 2 dot 36 = 84 $ m.
    ]
)

// TL 2
#tln([Tính giới hạn sau: $A = limits(lim)_(x -> 3) (x^2 - x - 6)/(sqrt(x + 1) - 2)$.],
    [20],
    loigiai: [
        Ta nhân cả tử và mẫu với lượng liên hợp của mẫu $(sqrt(x + 1) + 2)$ để khử dạng vô định $((0)/(0))$:
        $ A = limits(lim)_(x -> 3) ((x^2 - x - 6)(sqrt(x + 1) + 2))/((sqrt(x + 1) - 2)(sqrt(x + 1) + 2)) $
        $ A = limits(lim)_(x -> 3) ((x - 3)(x + 2)(sqrt(x + 1) + 2))/(x + 1 - 4) $
        $ A = limits(lim)_(x -> 3) ((x - 3)(x + 2)(sqrt(x + 1) + 2))/(x - 3) $
        $ A = limits(lim)_(x -> 3) [(x + 2)(sqrt(x + 1) + 2)] $
        $ A = (3 + 2) dot (sqrt(3 + 1) + 2) = 5 dot 4 = 20 $.
    ]
)

// TL 3
#tln([Quãng đường di chuyển của một vật rơi tự do được tính theo công thức $s(t) = 5t^2$ (mét), với $t$ là thời gian tính bằng giây. Vận tốc tức thời của vật tại thời điểm $t_0 = 3$ giây được định nghĩa là giới hạn $v(3) = limits(lim)_(t -> 3) (s(t) - s(3))/(t - 3)$ (mét trên giây). Tính vận tốc tức thời đó.],
    [30],
    loigiai: [
        Ta có $s(3) = 5 dot 3^2 = 45$ m.
        Theo định nghĩa, vận tốc tức thời tại $t = 3$ là:
        $ v(3) = limits(lim)_(t -> 3) (5t^2 - 45)/(t - 3) = limits(lim)_(t -> 3) (5(t^2 - 9))/(t - 3) $
        $ v(3) = limits(lim)_(t -> 3) (5(t - 3)(t + 3))/(t - 3) = limits(lim)_(t -> 3) [5(t + 3)] = 5 dot (3 + 3) = 30 $ m/s.
    ]
)

// TL 4
#tln([Nồng độ một loại hóa chất độc hại trong một hồ nước sau $t$ giờ xả thải được tính bởi hàm số:
    $C(t) = cases((t^2 - 4)/(t - 2) "khi" 0 <= t < 2, m t + 2 "khi" t >= 2)$ (mg/l).
    Tìm giá trị của tham số $m$ để nồng độ hóa chất thay đổi liên tục theo thời gian tại thời điểm chuyển giao $t = 2$ giờ.],
    [1],
    loigiai: [
        Để hàm số liên tục tại $t = 2$, ta cần:
        $ limits(lim)_(t -> 2^-) C(t) = limits(lim)_(t -> 2^+) C(t) = C(2) $.
        Ta có:
        - Giới hạn trái: $limits(lim)_(t -> 2^-) C(t) = limits(lim)_(t -> 2^-) (t^2 - 4)/(t - 2) = limits(lim)_(t -> 2^-) (t + 2) = 4$.
        - Giới hạn phải và giá trị hàm số: $limits(lim)_(t -> 2^+) C(t) = C(2) = m dot 2 + 2 = 2m + 2$.
        Suy ra:
        $ 2m + 2 = 4 => 2m = 2 => m = 1 $.
    ]
)

// TL 5
#tln([Cho hàm số $f(x) = cases((x^3 - 8)/(x^2 - 4) "khi" x != 2, k "khi" x = 2)$. Tìm giá trị của $k$ để hàm số liên tục trên tập xác định $RR$.],
    [3],
    loigiai: [
        Hàm số liên tục trên các khoảng $(-oo; 2)$ và $(2; +oo)$.
        Để hàm số liên tục trên $RR$, nó cần liên tục tại điểm $x = 2$, tức là:
        $ limits(lim)_(x -> 2) f(x) = f(2) $.
        Ta tính giới hạn tại $x = 2$:
        $ limits(lim)_(x -> 2) (x^3 - 8)/(x^2 - 4) = limits(lim)_(x -> 2) ((x - 2)(x^2 + 2x + 4))/((x - 2)(x + 2)) = limits(lim)_(x -> 2) (x^2 + 2x + 4)/(x + 2) $
        $ = (2^2 + 2 dot 2 + 4)/(2 + 2) = (12)/(4) = 3 $.
        Mà $f(2) = k$. Do đó $k = 3$.
    ]
)

// TL 6
#tln([Một giếng dầu có sản lượng khai thác trong năm đầu tiên là $10000$ tấn. Do tài nguyên cạn kiệt, sản lượng khai thác của mỗi năm tiếp theo đều giảm $20\%$ so với năm ngay trước đó. Tính tổng sản lượng dầu tối đa có thể khai thác được từ giếng dầu này cho đến khi cạn kiệt hoàn toàn (tính bằng tấn).],
    [50000],
    loigiai: [
        Sản lượng dầu khai thác được mỗi năm lập thành một cấp số nhân lùi vô hạn có:
        - Số hạng đầu $u_1 = 10000$ tấn.
        - Công bội $q = 1 - 20\% = 80\% = 0.8$ (vì sản lượng giảm $20\%$, tức bằng $80\%$ năm trước).
        Tổng sản lượng khai thác tối đa cho đến khi cạn kiệt là tổng của cấp số nhân lùi vô hạn này:
        $ S = (u_1)/(1 - q) = (10000)/(1 - 0.8) = (10000)/(0.2) = 50000 $ tấn.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
