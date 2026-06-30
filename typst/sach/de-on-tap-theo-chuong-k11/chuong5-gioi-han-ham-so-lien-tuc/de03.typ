#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.frac: math.display

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 5",
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 03)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho dãy số $(u_n)$ thỏa mãn giới hạn $limits(lim)_(n -> +oo) (u_n - 2)/(3u_n + 1) = 2$. Tính giới hạn $L = limits(lim)_(n -> +oo) u_n$.],
    (
        [$L = 2$],
        [$L = 0$],
        True([$L = -0.8$]),
        [$L = -1.5$]
    ),
    loigiai: [
        Đặt $L = limits(lim)_(n -> +oo) u_n$. Theo tính chất giới hạn của dãy số, ta có phương trình:
        $ (L - 2)/(3L + 1) = 2 $
        $ => L - 2 = 2(3L + 1) $
        $ => L - 2 = 6L + 2 $
        $ => 5L = -4 => L = - (4)/(5) = -0.8 $.
    ]
)

// TN 2
#tn([Một cái tháp nghệ thuật được dựng bằng cách xếp chồng các khối lập phương lên nhau. Khối lập phương đáy dưới cùng có cạnh là $2$ m. Mỗi khối lập phương tiếp theo nằm phía trên có độ dài cạnh bằng $(1)/(2)$ độ dài cạnh của khối lập phương ngay phía dưới nó. Tính chiều cao tối đa của tháp khi số lượng khối lập phương tăng lên vô hạn (tính bằng mét).],
    (
        [$3$ m.],
        True([$4$ m.]),
        [$6$ m.],
        [Tháp cao vô hạn.]
    ),
    loigiai: [
        Chiều cao của tháp là tổng cạnh của các khối lập phương:
        $ H = 2 + 2 dot (1)/(2) + 2 dot ((1)/(2))^2 + ... $
        Đây là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 2$ và công bội $q = (1)/(2)$.
        $ H = (u_1)/(1 - q) = (2)/(1 - (1)/(2)) = 4 $ m.
    ]
)

// TN 3
#tn([Một nhà máy hóa chất đều đặn xả chất thải vào một hồ nước. Ban đầu nồng độ chất thải trong hồ là $100$ ppm. Sau mỗi tuần, lượng chất thải trong hồ tự phân hủy sinh học và giảm $25\%$ so với tuần trước đó, đồng thời nhà máy lại xả thêm lượng chất thải mới làm tăng nồng độ trong hồ thêm $10$ ppm. Tìm nồng độ chất thải ổn định trong hồ khi số tuần kéo dài vô hạn.],
    (
        [$10$ ppm.],
        [$25$ ppm.],
        True([$40$ ppm.]),
        [$100$ ppm.]
    ),
    loigiai: [
        Gọi $C_n$ là nồng độ chất thải ở tuần thứ $n$. Ta có công thức truy hồi:
        $ C_(n+1) = (1 - 25\%) C_n + 10 = 0.75 C_n + 10 $.
        Khi số tuần kéo dài vô hạn ($n -> +oo$), nồng độ đạt trạng thái ổn định giới hạn $L = limits(lim)_(n -> +oo) C_n$.
        Ta có phương trình:
        $ L = 0.75 L + 10 $
        $ => 0.25 L = 10 => L = 40 $ ppm.
    ]
)

// TN 4
#tn([Cho giới hạn $limits(lim)_(x -> 1) (x^2 + a x + b)/(x - 1) = 3$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
    (
        [$P = 2$],
        True([$P = 5$]),
        [$P = 10$],
        [$P = 13$]
    ),
    loigiai: [
        Để giới hạn tồn tại hữu hạn khi mẫu số tiến về $0$ ($x -> 1$), tử số phải nhận $x = 1$ làm nghiệm:
        $ 1^2 + a dot 1 + b = 0 => b = -a - 1 $.
        Thế vào giới hạn ta được:
        $ limits(lim)_(x -> 1) (x^2 + a x - a - 1)/(x - 1) = limits(lim)_(x -> 1) ((x - 1)(x + a + 1))/(x - 1) = limits(lim)_(x -> 1) (x + a + 1) = a + 2 $.
        Theo giả thiết:
        $ a + 2 = 3 => a = 1 $.
        Suy ra $b = -1 - 1 = -2$.
        Vậy $P = a^2 + b^2 = 1^2 + (-2)^2 = 5$.
    ]
)

// TN 5
#tn([Một thấu kính hội tụ có tiêu cự $f = 10$ cm. Khoảng cách từ vật đến thấu kính là $d$ (cm), khoảng cách từ ảnh đến thấu kính là $d'$ (cm) được tính bởi công thức $d' = (10d)/(d - 10)$ với $d > 10$. Tính giới hạn của khoảng cách ảnh $d'$ khi vật dời ra xa vô cực ($d -> +oo$).],
    (
        [$0$ cm.],
        [$5$ cm.],
        True([$10$ cm.]),
        [$+oo$ cm.]
    ),
    loigiai: [
        Ta tính giới hạn của $d'$ khi $d -> +oo$:
        $ limits(lim)_(d -> +oo) d' = limits(lim)_(d -> +oo) (10d)/(d - 10) = limits(lim)_(d -> +oo) (10)/(1 - (10)/(d)) = 10 $ cm.
    ]
)

// TN 6
#tn([Cho hàm số $y = f(x)$ xác định trên $RR$ thỏa mãn giới hạn $limits(lim)_(x -> 2) (f(x) - 5)/(x - 2) = 4$. Tính giới hạn $I = limits(lim)_(x -> 2) (f^2(x) - 25)/(x^2 - 4)$.],
    (
        [$I = 4$],
        [$I = 5$],
        [$I = 8$],
        True([$I = 10$])
    ),
    loigiai: [
        Vì giới hạn $limits(lim)_(x -> 2) (f(x) - 5)/(x - 2) = 4$ hữu hạn nên tử số phải tiến về $0$, tức là $limits(lim)_(x -> 2) f(x) = 5$.
        Ta biến đổi biểu thức giới hạn $I$:
        $ I = limits(lim)_(x -> 2) ( (f(x) - 5)(f(x) + 5) ) / ( (x - 2)(x + 2) ) = limits(lim)_(x -> 2) [ (f(x) - 5)/(x - 2) ] dot limits(lim)_(x -> 2) [ (f(x) + 5)/(x + 2) ] $
        $ I = 4 dot (5 + 5)/(2 + 2) = 4 dot (10)/(4) = 10 $.
    ]
)

// TN 7
#tn([Chi phí để loại bỏ $p\%$ chất gây ô nhiễm trong nước thải của một nhà máy được tính bởi công thức $C(p) = (80p)/(100 - p)$ (triệu đồng), với $0 <= p < 100$. Nhận xét nào sau đây đúng về sự thay đổi của chi phí khi ta muốn lọc sạch hoàn toàn chất ô nhiễm ($p -> 100^-$)?],
    (
        [Chi phí tiến dần về $80$ triệu đồng.],
        [Chi phí tiến dần về $0$ triệu đồng.],
        True([Chi phí tăng lên vô hạn ($+oo$).]),
        [Chi phí không thay đổi.]
    ),
    loigiai: [
        Ta tính giới hạn khi $p -> 100^-$:
        $ limits(lim)_(p -> 100^-) (80p)/(100 - p) $.
        Khi $p -> 100^-$, tử số $80p -> 8000 > 0$, mẫu số $100 - p -> 0$ và $100 - p > 0$.
        Do đó giới hạn bằng $+oo$, chi phí lọc sạch hoàn toàn là vô hạn.
    ]
)

// TN 8
#tn([Doanh số bán hàng tích lũy $S(t)$ (nghìn sản phẩm) của một sản phẩm công nghệ mới sau $t$ tháng ra mắt được mô tả bởi công thức $S(t) = 100 - (80)/(t + 1)$. Tính giới hạn doanh số tối đa mà sản phẩm này đạt được khi thời gian kéo dài vô hạn ($t -> +oo$).],
    (
        [$80$ nghìn sản phẩm.],
        True([$100$ nghìn sản phẩm.]),
        [$180$ nghìn sản phẩm.],
        [Doanh số tăng vô hạn.]
    ),
    loigiai: [
        Ta tính giới hạn của $S(t)$ khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) S(t) = limits(lim)_(t -> +oo) [100 - (80)/(t + 1)] = 100 - 0 = 100 $.
    ]
)

// TN 9
#tn([Tìm giá trị của tham số $m$ để hàm số $f(x) = cases((x^2 - m^2)/(x - m) "khi" x != m, 4 "khi" x = m)$ liên tục tại điểm $x = m$.],
    (
        [$m = 4$],
        True([$m = 2$]),
        [$m = 1$],
        [$m = 0$]
    ),
    loigiai: [
        Để hàm số liên tục tại điểm $x = m$, ta cần $limits(lim)_(x -> m) f(x) = f(m)$.
        Ta có:
        $ limits(lim)_(x -> m) f(x) = limits(lim)_(x -> m) ((x - m)(x + m))/(x - m) = limits(lim)_(x -> m) (x + m) = 2m $.
        Mà $f(m) = 4$.
        Do đó:
        $ 2m = 4 => m = 2 $.
    ]
)

// TN 10
#tn([Một hệ thống sưởi thông minh tự động đóng/ngắt điện theo nhiệt độ môi trường $T$ ($""^o C$). Cường độ dòng điện tiêu thụ $I(T)$ (ampe) là hàm số theo nhiệt độ: $I(T) = cases(10 "khi" T <= 18, 0 "khi" T > 18)$. Phát biểu nào sau đây đúng về tính liên tục của hàm số cường độ dòng điện tại mốc $T = 18 ""^o C$?],
    (
        [Hàm số liên tục tại $T = 18$.],
        True([Hàm số gián đoạn tại $T = 18$ vì giới hạn trái và phải khác nhau.]),
        [Hàm số không có giới hạn trái tại $T = 18$.],
        [Hàm số liên tục trên toàn bộ tập số thực $RR$.]
    ),
    loigiai: [
        Ta có:
        - Giới hạn trái: $limits(lim)_(T -> 18^-) I(T) = 10$.
        - Giới hạn phải: $limits(lim)_(T -> 18^+) I(T) = 0$.
        Vì $limits(lim)_(T -> 18^-) I(T) != limits(lim)_(T -> 18^+) I(T)$ nên không tồn tại giới hạn tại $T = 18$, hàm số gián đoạn tại đây.
    ]
)

// TN 11
#tn([Một máy bay cất cánh từ mặt đất ($h = 0$ m) và đạt độ cao tuần hành ổn định $10000$ m sau $15$ phút. Giả sử độ cao của máy bay $h(t)$ là một hàm số liên tục theo thời gian $t$. Khẳng định nào sau đây chắc chắn đúng?],
    (
        [Máy bay bay lên với vận tốc không đổi.],
        True([Trong 15 phút đầu, có ít nhất một thời điểm máy bay ở độ cao đúng $5000$ m.]),
        [Máy bay đạt độ cao $5000$ m vào đúng thời điểm $t = 7.5$ phút.],
        [Máy bay không thể giảm độ cao trong suốt 15 phút đó.]
    ),
    loigiai: [
        Vì độ cao $h(t)$ liên tục trên $[0; 15]$ và $h(0) = 0 < 5000 < h(15) = 10000$, nên theo định lý giá trị trung gian, luôn tồn tại ít nhất một thời điểm $t_0 in (0; 15)$ sao cho $h(t_0) = 5000$ m.
    ]
)

// TN 12
#tn([Trong thiết kế linh kiện điện tử, điện áp đầu ra $V(t)$ (vôn) theo thời gian $t$ (giây) được mô tả bởi hàm số: $V(t) = cases(t^2 + 1 "khi" 0 <= t < 1, k t^2 - 2t + 3 "khi" t >= 1)$. Tìm giá trị của $k$ để điện áp đầu ra biến thiên liên tục trên khoảng $[0; +oo)$.],
    (
        [$k = 0$],
        True([$k = 1$]),
        [$k = 2$],
        [$k = 3$]
    ),
    loigiai: [
        Để điện áp liên tục trên $[0; +oo)$, hàm số phải liên tục tại điểm nối $t = 1$:
        $ limits(lim)_(t -> 1^-) V(t) = limits(lim)_(t -> 1^+) V(t) = V(1) $.
        Ta có:
        - $limits(lim)_(t -> 1^-) V(t) = limits(lim)_(t -> 1^-) (t^2 + 1) = 2$.
        - $V(1) = limits(lim)_(t -> 1^+) V(t) = k dot 1^2 - 2 dot 1 + 3 = k + 1$.
        Suy ra:
        $ k + 1 = 2 => k = 1 $.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho dãy số $(u_n)$ có giới hạn hữu hạn $L = limits(lim)_(n -> +oo) u_n$. Biết rằng với mọi $n >= 1$, ta có $u_n$ thỏa mãn phương trình: $(2n^2 + 1) u_n = n^2 a + b n$ (với $a, b$ là các tham số thực). Các phát biểu sau đúng hay sai?], (
        True([Khi $a = 4$ và $b = 0$, giới hạn $L$ của dãy số bằng $2$.]),
        True([Giới hạn $L$ của dãy số $(u_n)$ chỉ phụ thuộc vào giá trị của tham số $a$ mà không phụ thuộc vào giá trị của tham số $b$.]),
        [Với $a = 6$, để giới hạn $L = 3$ thì giá trị của tham số $b$ bắt buộc phải bằng $3$.],
        True([Nếu $a = 0$ và $b > 0$, dãy số mới $v_n = n dot u_n$ có giới hạn bằng $(b)/(2)$.])
    ), 
    loigiai: [
        - *a)* Đúng. Khi $a = 4, b = 0$, ta có $u_n = (4n^2)/(2n^2 + 1) -> (4)/(2) = 2$.
        - *b)* Đúng. Ta có $u_n = (a n^2 + b n)/(2n^2 + 1) = (a + (b)/(n))/(2 + (1)/(n^2)) -> (a)/(2)$ khi $n -> +oo$, hoàn toàn độc lập với $b$.
        - *c)* Sai. Vì giới hạn luôn bằng $a/2 = 6/2 = 3$ với mọi giá trị của $b$ nên $b$ có thể nhận giá trị thực bất kỳ.
        - *d)* Đúng. Khi $a = 0$, $u_n = (b n)/(2n^2 + 1)$. Dãy $v_n = n dot u_n = (b n^2)/(2n^2 + 1) -> (b)/(2)$.
    ]
)

// DS 2
#ds([Một bể chứa nước có thể tích ban đầu là $1000$ lít nước sạch. Vào mỗi buổi sáng, người ta rút ra $50\%$ lượng nước có trong bể để tưới cây, đến buổi chiều lại bơm thêm vào bể $200$ lít nước sạch mới. Gọi $V_n$ (lít) là thể tích nước trong bể vào cuối ngày thứ $n$. Các phát biểu sau đúng hay sai?], (
        True([Thể tích nước trong bể vào cuối ngày thứ nhất là $700$ lít.]),
        True([Công thức truy hồi xác định thể tích nước ở các ngày tiếp theo là $V_n = 0.5 V_(n-1) + 200$ với mọi $n >= 2$.]),
        True([Thể tích nước trong bể vào cuối ngày thứ $n$ có công thức tổng quát là $V_n = 400 + 600 dot (0.5)^n$ với mọi $n >= 1$.]),
        [Khi thời gian kéo dài vô hạn ($n -> +oo$), lượng nước trong bể sẽ cạn kiệt hoàn toàn về $0$ lít.]
    ), 
    loigiai: [
        - *a)* Đúng. Cuối ngày thứ nhất: $V_1 = 1000 dot (1 - 0.5) + 200 = 700$ lít.
        - *b)* Đúng. Lượng nước ngày sau bằng một nửa ngày trước cộng thêm $200$ lít mới.
        - *c)* Đúng. Kiểm tra công thức tổng quát:
          - Với $n = 1$: $V_1 = 400 + 600 dot 0.5 = 700$ (Đúng).
          - Với $n = 2$: $V_2 = 400 + 600 dot 0.25 = 550$ (Đúng, vì $V_2 = 0.5 dot 700 + 200 = 550$).
        - *d)* Sai. Giới hạn khi $n -> +oo$:
          $ limits(lim)_(n -> +oo) V_n = limits(lim)_(n -> +oo) [400 + 600 dot (0.5)^n] = 400 $ lít (không phải $0$ lít).
    ]
)

// DS 3
#ds([Cho giới hạn $L = limits(lim)_(x -> 2) (x^2 + a x + b)/(x^2 - 4)$ với $a, b in RR$. Các phát biểu sau đúng hay sai?], (
        True([Nếu giới hạn $L$ là một số thực hữu hạn, ta phải có mối quan hệ giữa các tham số là $2a + b = -4$.]),
        True([Khi $a = -3$ và $b = 2$, giá trị giới hạn $L$ bằng $(1)/(4)$.]),
        True([Với $a = -4$ và $b = 4$, giá trị giới hạn $L$ bằng $0$.]),
        [Nếu giới hạn $L = 2$ thì tổng hai tham số $a + b$ bằng $4$.]
    ), 
    loigiai: [
        - *a)* Đúng. Mẫu số có nghiệm $x = 2$. Để giới hạn hữu hạn thì tử số phải nhận $x = 2$ làm nghiệm: $2^2 + 2a + b = 0 => 2a + b = -4$.
        - *b)* Đúng. Khi $a = -3, b = 2$, ta có:
          $ L = limits(lim)_(x -> 2) (x^2 - 3x + 2)/(x^2 - 4) = limits(lim)_(x -> 2) ((x - 2)(x - 1))/((x - 2)(x + 2)) = limits(lim)_(x -> 2) (x - 1)/(x + 2) = (1)/(4) $.
        - *c)* Đúng. Khi $a = -4, b = 4$, ta có:
          $ L = limits(lim)_(x -> 2) (x^2 - 4x + 4)/(x^2 - 4) = limits(lim)_(x -> 2) ((x - 2)^2)/((x - 2)(x + 2)) = limits(lim)_(x -> 2) (x - 2)/(x + 2) = 0 $.
        - *d)* Sai. Nếu $L = 2$:
          $ limits(lim)_(x -> 2) (x - x_1)/(x + 2) = 2 => (2 - x_1)/(4) = 2 => x_1 = -6 $.
          Tử số có dạng $(x - 2)(x + 6) = x^2 + 4x - 12$.
          Do đó $a = 4, b = -12 => a + b = -8$ (chứ không phải $4$).
    ]
)

// DS 4
#ds([Một chiếc cầu trượt trẻ em ở công viên được thiết kế có mặt đường dốc với độ cao so với mặt đất được mô tả bởi hàm số $f(x)$ (mét) theo chiều ngang $x$ (mét, $0 <= x <= 4$). Hàm số độ cao có công thức:
    $f(x) = cases((x^2 - m^2)/(x - m) "khi" 0 <= x < 2, 2x - 1 "khi" 2 <= x <= 4)$ (với $m in (0; 2)$ là tham số thiết kế).
    Các phát biểu sau đúng hay sai?], (
        True([Hàm số độ cao $f(x)$ luôn liên tục trên các khoảng $[0; 2)$ và $(2; 4]$.]),
        True([Để bề mặt cầu trượt trơn tru không có gờ đứt gãy gây nguy hiểm, hàm số độ cao phải liên tục trên toàn bộ đoạn $[0; 4]$.]),
        True([Giá trị độ cao của cầu trượt tại mốc kết nối $x = 2$ bằng $3$ m.]),
        True([Giá trị của tham số thiết kế $m$ để cầu trượt liên tục trên toàn bộ đoạn $[0; 4]$ là $m = 1$.])
    ), 
    loigiai: [
        - *a)* Đúng. Các khoảng con đều là các hàm đa thức liên tục.
        - *b)* Đúng. Tính liên tục đảm bảo không có bậc nhảy nguy hiểm trên mặt trượt.
        - *c)* Đúng. $f(2) = 2 dot 2 - 1 = 3$ m.
        - *d)* Đúng. Để hàm số liên tục tại $x = 2$, ta cần $limits(lim)_(x -> 2^-) f(x) = f(2) = 3$.
          Ta có:
          $ limits(lim)_(x -> 2^-) f(x) = limits(lim)_(x -> 2^-) (x^2 - m^2)/(x - m) = limits(lim)_(x -> 2^-) (x + m) = 2 + m $.
          Do đó $2 + m = 3 => m = 1$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một con lắc lò xo thực hiện các dao động tắt dần liên tục. Quãng đường con lắc đi được trong lần dao động thứ nhất là $32$ cm. Kể từ lần dao động thứ hai, quãng đường đi được trong mỗi lần dao động đều giảm đi một nửa so với lần dao động ngay trước đó. Tính tổng quãng đường con lắc di chuyển được cho đến khi nó dừng lại hoàn toàn (tính bằng xăng-ti-mét).],
    [64],
    loigiai: [
        Quãng đường di chuyển của con lắc lập thành một cấp số nhân lùi vô hạn với:
        - Số hạng đầu $u_1 = 32$ cm.
        - Công bội $q = (1)/(2)$ (vì giảm đi một nửa).
        Tổng quãng đường con lắc di chuyển được là:
        $ S = (u_1)/(1 - q) = (32)/(1 - (1)/(2)) = 64 $ cm.
    ]
)

// TL 2
#tln([Biết giới hạn $limits(lim)_(x -> 2) (a sqrt(x + 2) + b)/(x - 2) = 1$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
    [80],
    loigiai: [
        Mẫu số bằng $0$ khi $x -> 2$, để giới hạn hữu hạn thì tử số phải có nghiệm $x = 2$:
        $ a sqrt(2 + 2) + b = 0 => 2a + b = 0 => b = -2a $.
        Thế vào giới hạn ta được:
        $ limits(lim)_(x -> 2) (a sqrt(x + 2) - 2a)/(x - 2) = limits(lim)_(x -> 2) ( a(sqrt(x + 2) - 2) )/(x - 2) $
        $ = limits(lim)_(x -> 2) ( a(x + 2 - 4) )/( (x - 2)(sqrt(x + 2) + 2) ) = limits(lim)_(x -> 2) (a)/(sqrt(x + 2) + 2) = (a)/(4) $.
        Theo giả thiết:
        $ (a)/(4) = 1 => a = 4 $.
        Suy ra $b = -2 dot 4 = -8$.
        Vậy $P = a^2 + b^2 = 4^2 + (-8)^2 = 16 + 64 = 80$.
    ]
)

// TL 3
#tln([Cho hàm số $y = f(x)$ liên tục tại mọi điểm và thỏa mãn giới hạn $limits(lim)_(x -> 1) (f(x) - 4)/(x - 1) = 3$. Tính giá trị của biểu thức $2K$ biết $K = limits(lim)_(x -> 1) (f^2(x) + f(x) - 20)/(x^2 - 1)$.],
    [27],
    loigiai: [
        Từ giới hạn ban đầu, vì mẫu số tiến về $0$ khi $x -> 1$ nên tử số phải tiến về $0$, tức là $limits(lim)_(x -> 1) f(x) = 4$.
        Ta phân tích tử số của $K$:
        $ f^2(x) + f(x) - 20 = (f(x) - 4)(f(x) + 5) $.
        Ta biến đổi giới hạn $K$:
        $ K = limits(lim)_(x -> 1) ( (f(x) - 4)(f(x) + 5) ) / ( (x - 1)(x + 1) ) $
        $ K = limits(lim)_(x -> 1) [ (f(x) - 4)/(x - 1) ] dot limits(lim)_(x -> 1) [ (f(x) + 5)/(x + 1) ] $
        $ K = 3 dot (4 + 5)/(1 + 1) = 3 dot (9)/(2) = (27)/(2) $.
        Suy ra $2K = 27$.
    ]
)

// TL 4
#tln([Áp suất khí quyển $p(h)$ (đơn vị: mmHg) ở độ cao $h$ (km) so với mặt nước biển được xác định bởi công thức $p(h) = 760 dot (0.88)^h$. Tìm giới hạn của áp suất khí quyển khi độ cao $h -> +oo$ (tức là đi dần ra ngoài không gian vũ trụ).],
    [0],
    loigiai: [
        Ta có $|0.88| < 1$, do đó $limits(lim)_(h -> +oo) (0.88)^h = 0$.
        Giới hạn của áp suất khí quyển là:
        $ limits(lim)_(h -> +oo) p(h) = limits(lim)_(h -> +oo) [760 dot (0.88)^h] = 0 $ mmHg.
    ]
)

// TL 5
#tln([Tìm giá trị dương của tham số $m$ để hàm số $f(x) = cases((x^2 - 5x + 6)/(x - 3) "khi" x < 3, m^2 x - 11 "khi" x >= 3)$ liên tục tại điểm $x = 3$.],
    [2],
    loigiai: [
        Để hàm số liên tục tại điểm $x = 3$, ta cần $limits(lim)_(x -> 3^-) f(x) = limits(lim)_(x -> 3^+) f(x) = f(3)$.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(x -> 3^-) f(x) = limits(lim)_(x -> 3^-) (x^2 - 5x + 6)/(x - 3) = limits(lim)_(x -> 3^-) ((x - 2)(x - 3))/(x - 3) = limits(lim)_(x -> 3^-) (x - 2) = 1 $.
        - Giới hạn phải và giá trị hàm số:
          $ f(3) = limits(lim)_(x -> 3^+) f(x) = m^2 dot 3 - 11 = 3m^2 - 11 $.
        Do đó:
        $ 3m^2 - 11 = 1 => 3m^2 = 12 => m^2 = 4 $.
        Vì $m$ nhận giá trị dương nên $m = 2$.
    ]
)

// TL 6
#tln([Thể tích nước trong một bể chứa có vòi tự động xả được mô tả bởi hàm số liên tục:
    $V(t) = cases((t^2 - t - 2)/(t - 2) + 15 "khi" 0 <= t < 2, a t + 12 "khi" t >= 2)$ (lít),
    với $t$ là thời gian tính bằng phút. Tìm giá trị của tham số $a$ để quá trình xả nước diễn ra liên tục, không bị gián đoạn lưu lượng đột ngột tại thời điểm $t = 2$ phút.],
    [3],
    loigiai: [
        Vì vòi xả nước diễn ra liên tục nên hàm số $V(t)$ phải liên tục tại điểm mốc thời gian $t = 2$.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(t -> 2^-) V(t) = limits(lim)_(t -> 2^-) [ (t^2 - t - 2)/(t - 2) + 15 ] = limits(lim)_(t -> 2^-) [ ((t - 2)(t + 1))/(t - 2) + 15 ] $
          $ = limits(lim)_(t -> 2^-) (t + 1 + 15) = 2 + 1 + 15 = 18 $ lít.
        - Giới hạn phải và giá trị hàm số:
          $ V(2) = limits(lim)_(t -> 2^+) V(t) = a dot 2 + 12 = 2a + 12 $.
        Để hàm số liên tục tại $t = 2$ ta cần:
        $ 2a + 12 = 18 => 2a = 6 => a = 3 $.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
