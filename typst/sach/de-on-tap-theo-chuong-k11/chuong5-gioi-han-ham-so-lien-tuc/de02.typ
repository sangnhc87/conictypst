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
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 02)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Số lượng tế bào của một loài sinh vật sinh trưởng trong điều kiện dinh dưỡng hạn chế được mô tả bởi dãy số $v_n = 5000 - 4500 dot (0.9)^n$ (tế bào), với $n$ là số ngày. Khi thời gian kéo dài vô hạn ($n -> +oo$), số lượng tế bào sinh vật tiến sát dần về giá trị nào?],
    (
        [$500$ tế bào.],
        [$4500$ tế bào.],
        True([$5000$ tế bào.]),
        [$0$ tế bào.]
    ),
    loigiai: [
        Ta có $|0.9| < 1$, do đó $limits(lim)_(n -> +oo) (0.9)^n = 0$.
        Giới hạn số lượng tế bào là:
        $ limits(lim)_(n -> +oo) v_n = limits(lim)_(n -> +oo) [5000 - 4500 dot (0.9)^n] = 5000 - 4500 dot 0 = 5000 $.
    ]
)

// TN 2
#tn([Một con lắc lò xo dao động tắt dần trên mặt phẳng ngang. Biên độ dao động của lần thứ $n$ bằng $80\%$ biên độ dao động của lần thứ $n-1$ ngay trước đó. Biết biên độ lần dao động đầu tiên là $10$ cm. Tính tổng biên độ của tất cả các lần dao động cho đến khi con lắc dừng lại hẳn (tính bằng xăng-ti-mét).],
    (
        [$40$ cm.],
        True([$50$ cm.]),
        [$80$ cm.],
        [$100$ cm.]
    ),
    loigiai: [
        Biên độ các lần dao động lập thành một cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 10$ và công bội $q = 80\% = 0.8$.
        Tổng biên độ là:
        $ S = (u_1)/(1 - q) = (10)/(1 - 0.8) = (10)/(0.2) = 50 $ cm.
    ]
)

// TN 3
#tn([Một dự án khởi nghiệp dự kiến doanh thu đạt được mỗi năm sẽ giảm dần do cạnh tranh. Doanh thu năm đầu tiên là $100$ triệu đồng. Kể từ năm thứ hai, doanh thu mỗi năm giảm $20\%$ so với năm ngay trước đó. Tính tổng doanh thu tích lũy tối đa của dự án khi số năm vận hành kéo dài vô hạn (tính bằng triệu đồng).],
    (
        [$400$ triệu đồng.],
        True([$500$ triệu đồng.]),
        [$800$ triệu đồng.],
        [$1000$ triệu đồng.]
    ),
    loigiai: [
        Doanh thu các năm lập thành cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 100$ và công bội $q = 1 - 20\% = 0.8$.
        Tổng doanh thu tích lũy tối đa là:
        $ S = (u_1)/(1 - q) = (100)/(1 - 0.8) = (100)/(0.2) = 500 $ triệu đồng.
    ]
)

// TN 4
#tn([Cho tam giác đều $A_1 B_1 C_1$ có diện tích bằng $S_1 = 16$. Dựng tam giác đều $A_2 B_2 C_2$ bằng cách nối các trung điểm của các cạnh tam giác $A_1 B_1 C_1$. Tiếp tục quá trình này vô hạn lần để được dãy tam giác đều. Tính tổng diện tích của tất cả các tam giác trong dãy đó.],
    (
        [$32$],
        [$24$],
        True([$(64)/(3)$]),
        [$16$]
    ),
    loigiai: [
        Diện tích của tam giác đều tiếp theo bằng $(1)/(4)$ diện tích tam giác đều ngay trước nó.
        Diện tích các tam giác lập thành một cấp số nhân lùi vô hạn có số hạng đầu $S_1 = 16$ và công bội $q = (1)/(4)$.
        Tổng diện tích là:
        $ S_("tổng") = (S_1)/(1 - q) = (16)/(1 - (1)/(4)) = (16)/((3)/(4)) = (64)/(3) $.
    ]
)

// TN 5
#tn([Nồng độ thuốc $C(t)$ (đơn vị: mg/l) trong máu của bệnh nhân sau $t$ giờ tiêm được xác định bởi công thức $C(t) = (3t + 2)/(t^2 + 1)$. Tính giới hạn nồng độ thuốc trong máu của bệnh nhân khi thời gian kéo dài vô hạn ($t -> +oo$).],
    (
        True([$0$ mg/l.]),
        [$3$ mg/l.],
        [$2$ mg/l.],
        [$+oo$ mg/l.]
    ),
    loigiai: [
        Ta tính giới hạn của hàm số khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) C(t) = limits(lim)_(t -> +oo) (3t + 2)/(t^2 + 1) = limits(lim)_(t -> +oo) ((3)/(t) + (2)/(t^2))/(1 + (1)/(t^2)) = (0 + 0)/(1 + 0) = 0 $.
        Như vậy nồng độ thuốc sẽ giảm dần về $0$ do quá trình đào thải của cơ thể.
    ]
)

// TN 6
#tn([Chi phí trung bình để sản xuất $x$ sản phẩm của một xí nghiệp được cho bởi công thức $A(x) = (50x + 200)/(x)$ (nghìn đồng/sản phẩm). Khi số lượng sản phẩm sản xuất $x -> +oo$, chi phí sản xuất trung bình tiến sát dần về giá trị tối ưu nào?],
    (
        [$200$ nghìn đồng.],
        True([$50$ nghìn đồng.]),
        [$250$ nghìn đồng.],
        [$0$ nghìn đồng.]
    ),
    loigiai: [
        Ta có:
        $ limits(lim)_(x -> +oo) A(x) = limits(lim)_(x -> +oo) (50 + (200)/(x)) = 50 + 0 = 50 $.
        Chi phí trung bình tối ưu khi quy mô sản xuất lớn là $50$ nghìn đồng/sản phẩm.
    ]
)

// TN 7
#tn([Vị trí của một hạt chuyển động trên trục số được xác định bởi hàm số tọa độ $s(t) = (t^2 - t + 2)/(2t^2 + 1)$ (mét), với $t >= 0$ là thời gian tính bằng giây. Xác định vị trí giới hạn của hạt khi thời gian $t -> +oo$.],
    (
        [$2$ m.],
        [$1$ m.],
        True([$(1)/(2)$ m.]),
        [$0$ m.]
    ),
    loigiai: [
        Tính giới hạn khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) s(t) = limits(lim)_(t -> +oo) (1 - (1)/(t) + (2)/(t^2))/(2 + (1)/(t^2)) = (1 - 0 + 0)/(2 + 0) = (1)/(2) $.
        Hạt chuyển động dần về vị trí tọa độ $(1)/(2)$ m.
    ]
)

// TN 8
#tn([Nồng độ chất ô nhiễm sau màng lọc của một nhà máy hóa chất được đo bằng công thức $P(t) = (t^2 - 1)/(t - 1)$ (ppm) khi thời gian vận hành $t > 1$ giờ. Tính giới hạn nồng độ $P(t)$ khi thời gian tiến dần về sát mốc khởi điểm $1$ giờ ($t -> 1^+$).],
    (
        [$1$ ppm.],
        True([$2$ ppm.]),
        [$0$ ppm.],
        [$+oo$ ppm.]
    ),
    loigiai: [
        Khử dạng vô định bằng cách phân tích tử số:
        $ limits(lim)_(t -> 1^+) P(t) = limits(lim)_(t -> 1^+) ((t - 1)(t + 1))/(t - 1) = limits(lim)_(t -> 1^+) (t + 1) = 1 + 1 = 2 $.
    ]
)

// TN 9
#tn([Một cánh tay robot chuyển động có quỹ đạo được mô tả bởi hàm số $f(t) = cases(t^2 - 4 "khi" t < 2, a t - 4 "khi" t >= 2)$. Tìm giá trị của tham số $a$ để quỹ đạo chuyển động là một đường liên tục tại thời điểm bàn giao $t = 2$.],
    (
        [$a = 0$],
        [$a = 1$],
        True([$a = 2$]),
        [$a = 4$]
    ),
    loigiai: [
        Quỹ đạo liên tục tại $t = 2$ tương đương hàm số liên tục tại $t = 2$:
        $ limits(lim)_(t -> 2^-) f(t) = limits(lim)_(t -> 2^+) f(t) = f(2) $.
        Ta có:
        - $limits(lim)_(t -> 2^-) f(t) = limits(lim)_(t -> 2^-) (t^2 - 4) = 0$.
        - $f(2) = limits(lim)_(t -> 2^+) f(t) = a dot 2 - 4 = 2a - 4$.
        Suy ra:
        $ 2a - 4 = 0 => 2a = 4 => a = 2 $.
    ]
)

// TN 10
#tn([Cường độ dòng điện qua một mạch điện thay đổi theo thời gian $t$ (giây) bởi hàm số $I(t) = cases((t^2 - 3t + 2)/(t - 1) "khi" t > 1, k t + 1 "khi" t <= 1)$. Tìm giá trị của $k$ để cường độ dòng điện liên tục tại thời điểm $t = 1$.],
    (
        [$k = 0$],
        [$k = -1$],
        True([$k = -2$]),
        [$k = -3$]
    ),
    loigiai: [
        Để dòng điện liên tục tại $t = 1$, ta cần $limits(lim)_(t -> 1^+) I(t) = limits(lim)_(t -> 1^-) I(t) = I(1)$.
        Ta có:
        - $limits(lim)_(t -> 1^+) I(t) = limits(lim)_(t -> 1^+) ((t - 1)(t - 2))/(t - 1) = limits(lim)_(t -> 1^+) (t - 2) = -1$.
        - $I(1) = limits(lim)_(t -> 1^-) I(t) = k dot 1 + 1 = k + 1$.
        Suy ra:
        $ k + 1 = -1 => k = -2 $.
    ]
)

// TN 11
#tn([Cảm biến nhiệt độ trong một lò nung ghi nhận sự thay đổi nhiệt độ $T(t)$ ($""^o C$) liên tục theo thời gian $t$ (phút). Biết rằng ban đầu $T(0) = 20 ""^o C$ và sau $10$ phút $T(10) = 1500 ""^o C$. Theo định lý giá trị trung gian, khẳng định nào sau đây là chắc chắn đúng?],
    (
        [Nhiệt độ lò nung tăng đều mỗi phút.],
        True([Có ít nhất một thời điểm trong khoảng từ $0$ đến $10$ phút lò đạt đúng $1000 ""^o C$.]),
        [Lò đạt nhiệt độ $1000 ""^o C$ tại thời điểm chính xác giữa chu kỳ $t = 5$ phút.],
        [Nhiệt độ lò không thể vượt quá $1500 ""^o C$.]
    ),
    loigiai: [
        Do nhiệt độ $T(t)$ là hàm số liên tục trên đoạn $[0; 10]$ và $T(0) = 20 < 1000 < T(10) = 1500$, nên theo định lý giá trị trung gian, tồn tại ít nhất một thời điểm $t_0 in (0; 10)$ sao cho $T(t_0) = 1000 ""^o C$.
    ]
)

// TN 12
#tn([Hàm số nào sau đây mô tả một hiện tượng biến thiên liên tục trong thực tế đời sống?],
    (
        True([Chiều cao của một cây xanh tăng trưởng theo thời gian.]),
        [Giá cước gửi bưu phẩm tính theo khối lượng.],
        [Số học sinh của một trường học qua các năm học.],
        [Lượng điện năng tiêu thụ nhảy số trên công tơ điện.]
    ),
    loigiai: [
        Chiều cao của sinh vật phát triển liên tục qua mọi giá trị trung gian mà không có bước nhảy đột ngột, do đó được mô tả bởi một hàm số liên tục. Các đại lượng còn lại đều có tính chất rời rạc, biến thiên nhảy vọt (bậc thang).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một doanh nghiệp dự kiến doanh thu mỗi năm sẽ giảm dần do cạnh tranh khốc liệt. Doanh thu năm đầu tiên là $10$ tỷ đồng. Kể từ năm thứ hai, doanh thu mỗi năm bằng $90\%$ doanh thu của năm trước đó. Các phát biểu sau đúng hay sai?], (
        True([Doanh thu của doanh nghiệp ở năm thứ $3$ là $8.1$ tỷ đồng.]),
        True([Tổng doanh thu tích lũy của doanh nghiệp này sau $n$ năm hoạt động khi $n -> +oo$ lập thành một cấp số nhân lùi vô hạn.]),
        True([Tổng doanh thu tích lũy tối đa mà doanh nghiệp này có thể đạt được trong suốt quá trình hoạt động vô hạn năm là $100$ tỷ đồng.]),
        [Nếu mục tiêu của doanh nghiệp là đạt tổng doanh thu tích lũy tối thiểu $120$ tỷ đồng thì mô hình này vẫn đáp ứng được nếu hoạt động đủ lâu.]
    ), 
    loigiai: [
        - *a)* Đúng. Doanh thu các năm lần lượt là:
          $u_1 = 10$ tỷ; $u_2 = 10 dot 0.9 = 9$ tỷ; $u_3 = 9 dot 0.9 = 8.1$ tỷ đồng.
        - *b)* Đúng. Công bội của cấp số nhân là $q = 0.9$ có $|q| < 1$, nên đây là cấp số nhân lùi vô hạn.
        - *c)* Đúng. Tổng doanh thu tích lũy tối đa là:
          $ S = (u_1)/(1 - q) = (10)/(1 - 0.9) = 100 $ tỷ đồng.
        - *d)* Sai. Vì tổng doanh thu tối đa đạt được khi số năm tiến tới vô hạn cũng chỉ tiệm cận sát về $100$ tỷ đồng, không bao giờ đạt được mức $120$ tỷ đồng.
    ]
)

// DS 2
#ds([Sau khi một bệnh nhân uống một liều thuốc, nồng độ thuốc trong máu của bệnh nhân $C(t)$ (mg/l) sau $t$ giờ được xác định bởi công thức: $C(t) = (15t)/(t^2 + 4)$. Các phát biểu sau đúng hay sai?], (
        True([Nồng độ thuốc trong máu tại thời điểm ngay sau khi uống ($t = 0$) là $0$ mg/l.]),
        [Giới hạn nồng độ thuốc trong máu của bệnh nhân khi thời gian kéo dài vô hạn ($t -> +oo$) là $15$ mg/l.],
        True([Sau $2$ giờ uống thuốc, nồng độ thuốc trong máu đạt giá trị lớn nhất là $3.75$ mg/l.]),
        True([Việc nồng độ thuốc tiến dần về $0$ khi $t -> +oo$ mô tả quá trình đào thải tự nhiên của cơ thể sinh học.])
    ), 
    loigiai: [
        - *a)* Đúng. $C(0) = (15 dot 0)/(0^2 + 4) = 0$ mg/l.
        - *b)* Sai. Giới hạn khi $t -> +oo$ là:
          $ limits(lim)_(t -> +oo) C(t) = limits(lim)_(t -> +oo) ((15)/(t))/(1 + (4)/(t^2)) = 0 $ mg/l.
        - *c)* Đúng. Nồng độ tại $t = 2$: $C(2) = (15 dot 2)/(2^2 + 4) = (30)/(8) = 3.75$ mg/l. Đây là giá trị lớn nhất của hàm số này trên khoảng $(0; +oo)$ do theo bất đẳng thức Cauchy: $t^2 + 4 >= 4t => C(t) <= (15t)/(4t) = 3.75$.
        - *d)* Đúng. Giới hạn bằng $0$ thể hiện lượng thuốc bị phân hủy và đào thải hoàn toàn khỏi cơ thể.
    ]
)

// DS 3
#ds([Cước phí gửi bưu phẩm của một bưu điện được tính theo trọng lượng $x$ (gam) bởi hàm số:
    $f(x) = cases(15 "khi" 0 < x <= 100, 15 + 0.1 dot (x - 100) "khi" 100 < x <= 500, 55 + k "khi" x > 500)$ (nghìn đồng).
    Các phát biểu sau đúng hay sai?], (
        True([Hàm số cước phí $f(x)$ liên tục trên khoảng $(0; 100)$ và khoảng $(100; 500)$.]),
        True([Tại điểm phân tách $x = 100$, hàm số liên tục vì giới hạn trái và phải cùng bằng $15$ nghìn đồng.]),
        True([Tại điểm phân tách $x = 500$, giới hạn bên trái $limits(lim)_(x -> 500^-) f(x) = 55$ nghìn đồng.]),
        True([Để cước phí không bị nhảy vọt đột ngột tại mốc $500$ gam (hàm số liên tục tại $x = 500$) thì giá trị tham số $k$ phải bằng $0$.])
    ), 
    loigiai: [
        - *a)* Đúng. Đây là hàm đa thức trên các khoảng xác định nên luôn liên tục.
        - *b)* Đúng. Ta có:
          - $limits(lim)_(x -> 100^-) f(x) = f(100) = 15$.
          - $limits(lim)_(x -> 100^+) f(x) = limits(lim)_(x -> 100^+) [15 + 0.1 dot (x - 100)] = 15$.
          Vì hai giới hạn bằng nhau nên hàm liên tục tại $x = 100$.
        - *c)* Đúng. $limits(lim)_(x -> 500^-) f(x) = 15 + 0.1 dot (500 - 100) = 15 + 40 = 55$.
        - *d)* Đúng. Ta có giới hạn phải và giá trị hàm số tại $500$ là $55 + k$.
          Để liên tục tại $x = 500$, ta cần $55 + k = 55 => k = 0$.
    ]
)

// DS 4
#ds([Một kỹ sư giao thông thiết kế bề mặt độ cao của một đoạn dốc cầu nối tiếp. Độ cao mặt đường $h(x)$ (mét) theo khoảng cách ngang $x$ (mét) được mô tả bởi hàm số:
    $h(x) = cases((x^2 - 16)/(x - 4) "khi" 0 <= x < 4, m x - 4 "khi" x >= 4)$.
    Các phát biểu sau đúng hay sai?], (
        True([Độ cao mặt đường tăng dần trên đoạn khởi đầu từ $0$ m đến cận dưới $4$ m.]),
        True([Giới hạn độ cao mặt đường khi $x$ tiến sát tới mốc nối $4$ m từ bên trái là $8$ m.]),
        True([Để xe chạy êm, mặt đường không được có bước nhảy đột ngột, tức là hàm số độ cao $h(x)$ phải liên tục tại điểm nối $x = 4$.]),
        [Giá trị của tham số thiết kế $m$ để đoạn đường liên tục tại điểm kết nối là $m = 2$.]
    ), 
    loigiai: [
        - *a)* Đúng. Với $x < 4$, $h(x) = x + 4$ là hàm đồng biến (độ cao tăng dần).
        - *b)* Đúng. $limits(lim)_(x -> 4^-) h(x) = limits(lim)_(x -> 4^-) (x^2 - 16)/(x - 4) = limits(lim)_(x -> 4^-) (x + 4) = 8$ m.
        - *c)* Đúng. Tính liên tục đảm bảo bề mặt trơn tru, không có bậc thềm đứt gãy nguy hiểm.
        - *d)* Sai. Ta có $h(4) = limits(lim)_(x -> 4^+) h(x) = m dot 4 - 4 = 4m - 4$.
          Để liên tục thì:
          $ 4m - 4 = 8 => 4m = 12 => m = 3 $ (chứ không phải $2$).
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một khách hàng tham gia chương trình tích lũy tài chính dài hạn. Đầu mỗi tháng người đó gửi tiết kiệm cố định $10$ triệu đồng vào tài khoản ngân hàng chịu lãi suất $0.5\%$/tháng. Giá trị hiện tại $P V$ của chuỗi tiền gửi vô hạn này quy về thời điểm hiện tại được tính bằng tổng cấp số nhân lùi vô hạn: $P V = (10)/(1 + 0.005) + (10)/((1 + 0.005)^2) + (10)/((1 + 0.005)^3) + ...$ Tính tổng giá trị hiện tại $P V$ này (làm tròn đến hàng đơn vị, tính bằng triệu đồng).],
    [2000],
    loigiai: [
        Đây là tổng của cấp số nhân lùi vô hạn với:
        - Số hạng đầu: $u_1 = (10)/(1.005)$
        - Công bội: $q = (1)/(1.005)$ (vì $|q| < 1$).
        Áp dụng công thức tính tổng:
        $ P V = (u_1)/(1 - q) = ((10)/(1.005))/(1 - (1)/(1.005)) = ((10)/(1.005))/(((1.005 - 1))/(1.005)) = (10)/(0.005) = 2000 $ triệu đồng.
    ]
)

// TL 2
#tln([Một bình chứa $100$ lít cồn nguyên chất. Người ta rút ra $20$ lít cồn rồi đổ vào $20$ lít nước, khuấy đều. Sau đó lại rút ra $20$ lít dung dịch rồi đổ vào $20$ lít nước. Quá trình này lặp lại liên tục $n$ lần. Khi $n -> +oo$, lượng cồn nguyên chất còn lại trong bình tiến dần về bao nhiêu lít?],
    [0],
    loigiai: [
        Mỗi lần rút ra và thay bằng nước, lượng cồn còn lại trong bình bằng $80\%$ so với trước đó.
        Số lít cồn nguyên chất còn lại sau $n$ lần thực hiện là một cấp số nhân:
        $ C_n = 100 dot (0.8)^n $.
        Khi $n -> +oo$, vì $|0.8| < 1$, ta có:
        $ limits(lim)_(n -> +oo) C_n = limits(lim)_(n -> +oo) [100 dot (0.8)^n] = 0 $ lít.
    ]
)

// TL 3
#tln([Cường độ ánh sáng $I(x)$ truyền qua một tấm kính dày $x$ (cm) được xác định bởi công thức $I(x) = I_0 dot e^(-0.12 x)$, với $I_0$ là cường độ ban đầu. Khi độ dày kính tăng lên vô hạn ($x -> +oo$), cường độ ánh sáng truyền qua kính tiến về giá trị bằng bao nhiêu phần trăm (%) so với cường độ ánh sáng ban đầu $I_0$?],
    [0],
    loigiai: [
        Ta tính giới hạn của tỉ lệ cường độ ánh sáng truyền qua so với ban đầu:
        $ limits(lim)_(x -> +oo) (I(x))/(I_0) = limits(lim)_(x -> +oo) e^(-0.12 x) = limits(lim)_(x -> +oo) (1)/(e^(0.12 x)) = 0 $.
        Như vậy, cường độ ánh sáng tiến về $0\%$, tức là ánh sáng bị hấp thụ hoàn toàn khi kính dày vô tận.
    ]
)

// TL 4
#tln([Một doanh nghiệp ước tính doanh thu đạt được (tính bằng tỷ đồng) sau $x$ tháng chạy chương trình quảng bá sản phẩm mới là $R(x) = (30x^2 - x + 5)/(x^2 + 1)$. Tính giới hạn doanh thu tối đa của doanh nghiệp khi thời gian chạy chiến dịch quảng bá này kéo dài vô hạn ($x -> +oo$).],
    [30],
    loigiai: [
        Ta tính giới hạn doanh thu khi thời gian chạy chiến dịch kéo dài vô hạn:
        $ limits(lim)_(x -> +oo) R(x) = limits(lim)_(x -> +oo) (30x^2 - x + 5)/(x^2 + 1) = limits(lim)_(x -> +oo) (30 - (1)/(x) + (5)/(x^2))/(1 + (1)/(x^2)) = 30 $ tỷ đồng.
    ]
)

// TL 5
#tln([Nồng độ bụi mịn PM2.5 trong không khí tại một trạm quan trắc tự động (đơn vị: $mu g / m^3$) thay đổi theo thời gian $t$ (giờ) trong ngày được mô tả bởi hàm số:
    $P(t) = cases((t^2 - 9)/(t - 3) "khi" 0 <= t < 3, a t - 3 "khi" t >= 3)$.
    Tìm giá trị của tham số $a$ để nồng độ bụi mịn biến thiên liên tục tại thời điểm giao ca $t = 3$ giờ.],
    [3],
    loigiai: [
        Để hàm số liên tục tại $t = 3$, ta cần giới hạn trái bằng giới hạn phải và bằng giá trị hàm số:
        $ limits(lim)_(t -> 3^-) P(t) = limits(lim)_(t -> 3^+) P(t) = P(3) $.
        Ta có:
        - Giới hạn trái: $limits(lim)_(t -> 3^-) P(t) = limits(lim)_(t -> 3^-) (t^2 - 9)/(t - 3) = limits(lim)_(t -> 3^-) (t + 3) = 6$.
        - Giới hạn phải và giá trị hàm số: $P(3) = a dot 3 - 3 = 3a - 3$.
        Suy ra:
        $ 3a - 3 = 6 => 3a = 9 => a = 3 $.
    ]
)

// TL 6
#tln([Lãi suất của một khoản vay mua nhà ưu đãi được tính theo thời gian $t$ (năm) bởi hàm số liên tục:
    $r(t) = cases((t^2 - 1)/(t - 1) + 4 "khi" 0 <= t < 1, m t + 5 "khi" t >= 1)$ (%/năm).
    Tìm giá trị của tham số $m$ để lãi suất không bị nhảy vọt đột ngột tại thời điểm hết hạn ưu đãi năm đầu tiên ($t = 1$ năm).],
    [1],
    loigiai: [
        Vì lãi suất không bị nhảy vọt đột ngột nên hàm số $r(t)$ phải liên tục tại điểm mốc $t = 1$.
        Ta có:
        - Giới hạn trái: $limits(lim)_(t -> 1^-) r(t) = limits(lim)_(t -> 1^-) [ (t^2 - 1)/(t - 1) + 4 ] = limits(lim)_(t -> 1^-) [ (t + 1) + 4 ] = 1 + 1 + 4 = 6$.
        - Giới hạn phải và giá trị hàm số: $r(1) = m dot 1 + 5 = m + 5$.
        Để hàm số liên tục tại $t = 1$ ta cần:
        $ m + 5 = 6 => m = 1 $.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
