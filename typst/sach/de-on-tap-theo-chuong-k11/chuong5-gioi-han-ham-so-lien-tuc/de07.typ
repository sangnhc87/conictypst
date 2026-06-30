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
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 07)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Nhằm mục tiêu bảo tồn động vật hoang dã, một vườn quốc gia bổ sung định kỳ số lượng cá thể chim ưng mỗi năm. Mỗi năm số lượng chim ưng tự nhiên bị chết hoặc di cư làm giảm $20\%$ số cá thể hiện có, đồng thời vườn quốc gia thả thêm $15$ cá thể mới từ các trung tâm cứu hộ. Gọi $u_n$ là số cá thể chim ưng sau $n$ năm. Tính số lượng chim ưng ổn định lâu dài trong vườn quốc gia khi thời gian kéo dài vô hạn ($n -> +oo$).],
    (
        [$50$ cá thể.],
        [$60$ cá thể.],
        True([$75$ cá thể.]),
        [$90$ cá thể.]
    ),
    loigiai: [
        Lượng chim ưng sau mỗi năm tuân theo công thức truy hồi:
        $ u_(n+1) = 0.8 u_n + 15 $.
        Khi $n -> +oo$, số lượng chim ưng tiến tới giới hạn ổn định $L = limits(lim)_(n -> +oo) u_n$.
        Ta có phương trình:
        $ L = 0.8 L + 15 $
        $ => 0.2 L = 15 => L = 75 $ cá thể.
    ]
)

// TN 2
#tn([Một con lắc lò xo thực hiện dao động tắt dần liên tục. Quãng đường con lắc đi được ở chu kỳ đầu tiên là $50$ cm. Kể từ chu kỳ thứ hai, quãng đường đi được trong mỗi chu kỳ đều giảm $20\%$ so với chu kỳ liền trước đó. Tính tổng quãng đường con lắc di chuyển được cho đến khi dừng lại hẳn (tính bằng xăng-ti-mét).],
    (
        [$150$ cm.],
        [$200$ cm.],
        True([$250$ cm.]),
        [$300$ cm.]
    ),
    loigiai: [
        Quãng đường di chuyển lập thành một cấp số nhân lùi vô hạn với:
        - Số hạng đầu $u_1 = 50$ cm.
        - Công bội $q = 1 - 20\% = 0.8$ (vì $|q| < 1$).
        Tổng quãng đường con lắc đi được là:
        $ S = (u_1)/(1 - q) = (50)/(1 - 0.8) = (50)/(0.2) = 250 $ cm.
    ]
)

// TN 3
#tn([Cho một tam giác đều có chu vi bằng $18$ cm. Người ta dựng tam giác đều thứ hai bằng cách nối trung điểm các cạnh của tam giác đều thứ nhất, tam giác đều thứ ba nối trung điểm các cạnh của tam giác đều thứ hai, và cứ tiếp tục như vậy vô hạn lần. Tính tổng chu vi của tất cả các tam giác trong dãy vô hạn đó (tính bằng xăng-ti-mét).],
    (
        [$24$ cm.],
        [$30$ cm.],
        True([$36$ cm.]),
        [$54$ cm.]
    ),
    loigiai: [
        Chu vi của tam giác đều ban đầu là $P_1 = 18$ cm.
        Mỗi tam giác tiếp theo có chu vi bằng $(1)/(2)$ chu vi tam giác trước đó.
        Chu vi các tam giác đều lập thành một cấp số nhân lùi vô hạn với số hạng đầu $P_1 = 18$ và công bội $q = (1)/(2)$.
        Tổng chu vi là:
        $ P_("tổng") = (P_1)/(1 - q) = (18)/(1 - (1)/(2)) = 36 $ cm.
    ]
)

// TN 4
#tn([Cho giới hạn $limits(lim)_(x -> 4) (x^2 + a x + b)/(x - 4) = 9$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b$.],
    (
        [$P = -15$],
        [$P = 15$],
        [$P = 19$],
        True([$P = -19$])
    ),
    loigiai: [
        Mẫu số tiến về $0$ khi $x -> 4$. Để giới hạn tồn tại hữu hạn, tử số phải nhận $x = 4$ làm nghiệm:
        $ 4^2 + 4a + b = 0 => b = -4a - 16 $.
        Thế vào biểu thức giới hạn ta được:
        $ limits(lim)_(x -> 4) (x^2 + a x - 4a - 16)/(x - 4) = limits(lim)_(x -> 4) ((x - 4)(x + a + 4))/(x - 4) = limits(lim)_(x -> 4) (x + a + 4) = a + 8 $.
        Theo giả thiết:
        $ a + 8 = 9 => a = 1 $.
        Suy ra $b = -4 dot 1 - 16 = -20$.
        Vậy $P = a^2 + b = 1^2 + (-20) = -19$.
    ]
)

// TN 5
#tn([Chi phí trung bình để sản xuất $x$ chiếc điện thoại thông minh của một hãng công nghệ được cho bởi công thức $C(x) = (40x + 3000)/(x)$ (triệu đồng/chiếc). Khi quy mô sản xuất tăng lên cực kỳ lớn ($x -> +oo$), chi phí sản xuất trung bình trên mỗi chiếc tiến sát về mức tối ưu nào?],
    (
        [$3000$ triệu đồng.],
        True([$40$ triệu đồng.]),
        [$3040$ triệu đồng.],
        [$0$ triệu đồng.]
    ),
    loigiai: [
        Ta tính giới hạn của chi phí trung bình khi sản lượng tiến về vô cực:
        $ limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) (40 + (3000)/(x)) = 40 $ triệu đồng.
    ]
)

// TN 6
#tn([Nồng độ clo tồn dư trong đường ống xả của một nhà máy hóa chất được đo bằng công thức $G(t) = (t^2 - 9)/(t - 3)$ (ppm) khi thời gian xả nước $t > 3$ giờ. Tính giới hạn nồng độ clo dư khi thời gian tiến sát đến mốc bắt đầu $3$ giờ từ bên phải ($t -> 3^+$).],
    (
        [$3$ ppm.],
        True([$6$ ppm.]),
        [$0$ ppm.],
        [$+oo$ ppm.]
    ),
    loigiai: [
        Ta tính giới hạn một bên khi $t -> 3^+$:
        $ limits(lim)_(t -> 3^+) (t^2 - 9)/(t - 3) = limits(lim)_(t -> 3^+) ((t - 3)(t + 3))/(t - 3) = limits(lim)_(t -> 3^+) (t + 3) = 3 + 3 = 6 $ ppm.
    ]
)

// TN 7
#tn([Lượng điện tích còn lại $Q(t)$ (coulomb) trên hai bản cực của một tụ điện đang phóng điện được xác định bởi công thức $Q(t) = 0.05 dot e^(-0.1 t)$ với $t$ tính bằng giây. Tính giới hạn điện tích của tụ điện khi thời gian phóng điện kéo dài vô hạn ($t -> +oo$).],
    (
        [$0.05$ coulomb.],
        [$0.1$ coulomb.],
        True([$0$ coulomb.]),
        [$+oo$ coulomb.]
    ),
    loigiai: [
        Ta tính giới hạn của $Q(t)$ khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) Q(t) = limits(lim)_(t -> +oo) (0.05)/(e^(0.1 t)) = 0 $ coulomb (vì mẫu số tiến tới $+oo$).
    ]
)

// TN 8
#tn([Cho hàm số $f(x)$ thỏa mãn giới hạn $limits(lim)_(x -> 5) (f(x) - 6)/(x - 5) = 4$. Tính giá trị của biểu thức $5K$ biết $K = limits(lim)_(x -> 5) (f^2(x) - 36)/(x^2 - 25)$.],
    (
        [$5K = 12$],
        [$5K = 18$],
        True([$5K = 24$]),
        [$5K = 48$]
    ),
    loigiai: [
        Vì giới hạn hữu hạn nên ta có $limits(lim)_(x -> 5) f(x) = 6$.
        Ta phân tích tử số của $K$:
        $ f^2(x) - 36 = (f(x) - 6)(f(x) + 6) $.
        Biến đổi giới hạn $K$:
        $ K = limits(lim)_(x -> 5) ( (f(x) - 6)(f(x) + 6) ) / ( (x - 5)(x + 5) ) $
        $ K = limits(lim)_(x -> 5) [ (f(x) - 6)/(x - 5) ] dot limits(lim)_(x -> 5) [ (f(x) + 6)/(x + 5) ] $
        $ K = 4 dot (6 + 6)/(5 + 5) = 4 dot (12)/(10) = (24)/(5) $.
        Suy ra $5K = 24$.
    ]
)

// TN 9
#tn([Cường độ sáng của một đèn giao thông tự động điều chỉnh theo thời gian $t$ (giây) bởi hàm số $E(t) = cases(t^2 - 3t + 5 "khi" 0 <= t < 3, a t - 1 "khi" t >= 3)$. Tìm giá trị của $a$ để đèn thay đổi cường độ sáng liên tục tại thời điểm khớp chế độ $t = 3$.],
    (
        [$a = 1$],
        True([$a = 2$]),
        [$a = 3$],
        [$a = 5$]
    ),
    loigiai: [
        Để cường độ sáng thay đổi liên tục tại $t = 3$, hàm số $E(t)$ phải liên tục tại $t = 3$:
        $ limits(lim)_(t -> 3^-) E(t) = limits(lim)_(t -> 3^+) E(t) = E(3) $.
        Ta có:
        - $limits(lim)_(t -> 3^-) E(t) = limits(lim)_(t -> 3^-) (t^2 - 3t + 5) = 3^2 - 3 dot 3 + 5 = 5$.
        - $E(3) = limits(lim)_(t -> 3^+) E(t) = a dot 3 - 1 = 3a - 1$.
        Suy ra:
        $ 3a - 1 = 5 => 3a = 6 => a = 2 $.
    ]
)

// TN 10
#tn([Nhịp tim của một bệnh nhân được theo dõi tự động bằng máy đo điện tim. Khi bệnh nhân uống thuốc hỗ trợ nhịp tim tăng đột ngột tức thời từ $70$ nhịp/phút lên $110$ nhịp/phút tại phút thứ $15$. Biểu diễn nhịp tim theo thời gian là một hàm số mang tính chất nào tại điểm mốc $t = 15$ phút?],
    (
        [Hàm số liên tục tại điểm $t = 15$.],
        True([Hàm số gián đoạn tại điểm $t = 15$.]),
        [Hàm số có giới hạn phải bằng $70$ nhịp/phút tại $t = 15$.],
        [Hàm số liên tục trên khoảng $[0; 30]$.]
    ),
    loigiai: [
        Do nhịp tim nhảy vọt đột ngột có bước nhảy (từ $70$ lên $110$), giới hạn trái và phải khác nhau, nên hàm số biểu diễn nhịp tim bị gián đoạn tại thời điểm $t = 15$ phút.
    ]
)

// TN 11
#tn([Nhiệt độ của một lò nung sành sứ là một hàm số liên tục theo thời gian $t$ (giờ). Biết nhiệt độ ban đầu là $25 ""^o C$ và sau $3$ giờ nung đạt $1500 ""^o C$. Theo định lý giá trị trung gian, khẳng định nào dưới đây chắc chắn đúng?],
    (
        [Lò đạt nhiệt độ $1000 ""^o C$ vào đúng thời điểm giữa chu kỳ $t = 2$ giờ.],
        True([Trong 3 giờ đó, có ít nhất một thời điểm nhiệt độ lò đạt đúng $1000 ""^o C$.]),
        [Nhiệt độ lò luôn tăng đều đặn không giảm.],
        [Nhiệt độ lò không thể vượt quá $1500 ""^o C$ sau đó.]
    ),
    loigiai: [
        Vì nhiệt độ là hàm số liên tục trên đoạn $[0; 3]$ và $25 < 1000 < 1500$, theo định lý giá trị trung gian luôn tồn tại ít nhất một thời điểm $t_0 in (0; 3)$ để nhiệt độ lò đạt đúng $1000 ""^o C$.
    ]
)

// TN 12
#tn([Đại lượng nào dưới đây thay đổi biến thiên liên tục trong thế giới tự nhiên?],
    (
        True([Lượng nước bốc hơi từ một mặt hồ theo thời gian.]),
        [Số lượng xe ô tô đăng ký mới mỗi ngày.],
        [Số học sinh được công nhận tốt nghiệp mỗi năm.],
        [Số lượng sách tiêu thụ của một cửa hàng mỗi tháng.]
    ),
    loigiai: [
        Lượng nước bốc hơi thay đổi liên tục theo thời gian thực (từng mililit nhỏ lẻ), do đó được mô tả bằng hàm số liên tục. Các đại lượng đếm số lượng xe, số lượng người, số lượng sách đều mang tính rời rạc (nhảy bậc số nguyên).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một cơ sở sản xuất đầu tư mua một thiết bị công nghệ hiện đại trị giá $400$ triệu đồng. Mỗi năm, do hao mòn vô hình và hữu hình, giá trị còn lại của thiết bị bị khấu hao giảm đi $20\%$ so với năm trước đó. Các phát biểu sau đúng hay sai?], (
        True([Giá trị còn lại của thiết bị công nghệ sau năm thứ nhất sử dụng là $320$ triệu đồng.]),
        True([Dãy số giá trị còn lại của thiết bị sau $n$ năm lập thành một cấp số nhân có công bội $q = 0.8$.]),
        True([Giới hạn giá trị còn lại của thiết bị khi thời gian sử dụng kéo dài vô hạn ($n -> +oo$) bằng $0$ triệu đồng.]),
        True([Tổng giá trị khấu hao tích lũy của thiết bị công nghệ này sau vô hạn năm sử dụng tiến về tối đa là $400$ triệu đồng.])
    ), 
    loigiai: [
        - *a)* Đúng. Giá trị sau 1 năm: $400 dot (1 - 0.2) = 400 dot 0.8 = 320$ triệu đồng.
        - *b)* Đúng. Công bội của cấp số nhân là $q = 1 - 0.2 = 0.8$.
        - *c)* Đúng. Vì $|0.8| < 1$, giới hạn giá trị còn lại bằng $limits(lim)_(n -> +oo) [400 dot (0.8)^n] = 0$.
        - *d)* Đúng. Vì giá trị thiết bị giảm dần về $0$ nên tổng lượng khấu hao lũy kế sau vô hạn năm chính bằng giá trị ban đầu là $400$ triệu đồng.
    ]
)

// DS 2
#ds([Nồng độ của một loại dược chất $C(t)$ (mg/l) trong máu của một con bệnh sau $t$ giờ dùng thuốc được cho bởi công thức: $C(t) = (30t)/(t^2 + 16)$ với thời gian $t >= 0$. Các phát biểu sau đúng hay sai?], (
        True([Nồng độ dược chất trong máu tại thời điểm ngay khi uống thuốc ($t = 0$) là $0$ mg/l.]),
        True([Giới hạn nồng độ dược chất trong máu của bệnh nhân khi thời gian kéo dài vô hạn ($t -> +oo$) là $0$ mg/l.]),
        True([Nồng độ dược chất trong máu đạt giá trị lớn nhất tại thời điểm $4$ giờ sau khi uống thuốc.]),
        True([Tỷ lệ nồng độ dược chất giảm dần tiến sát về $0$ khi $t -> +oo$ phản ánh cơ chế tự đào thải chất độc của cơ thể sinh vật.])
    ), 
    loigiai: [
        - *a)* Đúng. $C(0) = (30 dot 0)/(0^2 + 16) = 0$.
        - *b)* Đúng. $limits(lim)_(t -> +oo) C(t) = limits(lim)_(t -> +oo) ((30)/(t))/(1 + (16)/(t^2)) = 0$ mg/l.
        - *c)* Đúng. Áp dụng Cauchy: $t^2 + 16 >= 2 sqrt(t^2 dot 16) = 8t$.
          Do đó $C(t) <= (30t)/(8t) = 3.75$ mg/l. Dấu "=" xảy ra khi $t^2 = 16 => t = 4$ giờ.
        - *d)* Đúng. Lượng thuốc đào thải hoàn toàn khỏi máu qua chu kỳ tuần hoàn tự nhiên.
    ]
)

// DS 3
#ds([Một đoạn đê thủy lợi mặt cắt đứng có biên cao độ được mô tả bởi hàm số:
    $f(x) = cases((x^2 - a x - 12)/(x - 4) "khi" 0 <= x < 4, b x - 3 "khi" x >= 4)$.
    Các phát biểu sau đúng hay sai?], (
        True([Để bề mặt đê thủy lợi trơn tru liên tục tại điểm kết nối $x = 4$, tử số của phân thức ở nhánh đầu phải có nghiệm $x = 4$, từ đó suy ra tham số thiết kế $a = 1$.]),
        True([Khi $a = 1$, giới hạn bên trái tại điểm nối $limits(lim)_(x -> 4^-) f(x)$ bằng $7$ m.]),
        True([Với $a = 1$, giá trị của tham số $b$ để bề mặt đê liên tục tại điểm nối $x = 4$ là $b = 2.5$.]),
        True([Nếu đúc đê với tham số sai lệch $a = 1, b = 2$ thì bề mặt đê sẽ bị đứt gãy một bậc dốc cao đúng $2$ m.])
    ), 
    loigiai: [
        - *a)* Đúng. Tử số phải nhận $x = 4$ làm nghiệm: $4^2 - 4a - 12 = 0 => 4 - 4a = 0 => a = 1$.
        - *b)* Đúng. Khi $a = 1$:
          $ limits(lim)_(x -> 4^-) f(x) = limits(lim)_(x -> 4^-) (x^2 - x - 12)/(x - 4) = limits(lim)_(x -> 4^-) ((x - 4)(x + 3))/(x - 4) = limits(lim)_(x -> 4^-) (x + 3) = 7 $ m.
        - *c)* Đúng. Ta cần giới hạn phải bằng giới hạn trái: $b dot 4 - 3 = 7 => 4b = 10 => b = 2.5$.
        - *d)* Đúng. Khi $b = 2$, giới hạn phải là $2 dot 4 - 3 = 5$ m.
          Giới hạn trái bằng $7$ m.
          Độ lệch bậc đứt gãy bằng $|7 - 5| = 2$ m.
    ]
)

// DS 4
#ds([Một lò xo đặt trên mặt phẳng nghiêng dao động tắt dần liên tục. Khoảng cách di chuyển của quả nặng ở chu kỳ đầu tiên là $80$ cm. Kể từ chu kỳ thứ hai, khoảng cách di chuyển giảm $25\%$ so với chu kỳ liền trước đó. Các phát biểu sau đúng hay sai?], (
        True([Khoảng cách di chuyển của quả nặng ở chu kỳ thứ hai là $60$ cm.]),
        True([Tổng quãng đường di chuyển được sau vô hạn chu kỳ là tổng của một cấp số nhân lùi vô hạn có công bội $q = 0.75$.]),
        True([Tổng quãng đường tối đa quả nặng di chuyển cho đến khi dừng lại hẳn tiến về giới hạn là $320$ cm.]),
        True([Nếu giảm ma sát để công bội $q$ tăng lên thành $0.8$ thì tổng quãng đường di chuyển tối đa của quả nặng trước khi dừng hẳn sẽ tăng lên thành $400$ cm.])
    ), 
    loigiai: [
        - *a)* Đúng. Lượng di chuyển chu kỳ hai: $80 dot (1 - 0.25) = 60$ cm.
        - *b)* Đúng. Lượng giảm $25\%$ tương ứng công bội $q = 0.75$ có $|q| < 1$.
        - *c)* Đúng. Tổng quãng đường tối đa:
          $ S = (u_1)/(1 - q) = (80)/(1 - 0.75) = 320 $ cm.
        - *d)* Đúng. Khi $q = 0.8$:
          $ S_("mới") = (80)/(1 - 0.8) = 400 $ cm.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một quả bóng cao su được thả rơi tự do từ độ cao $10$ m. Mỗi lần chạm đất, quả bóng nảy ngược lên đạt độ cao bằng $(1)/(2)$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường quả bóng di chuyển được (bao gồm cả quãng đường rơi xuống và nảy lên) cho đến khi nó hoàn toàn dừng lại (tính bằng mét).],
    [30],
    loigiai: [
        Quãng đường di chuyển của quả bóng bao gồm:
        - Lần rơi đầu tiên: $10$ m.
        - Các lần nảy lên và rơi xuống tiếp theo tạo thành các cặp quãng đường bằng nhau:
          $ S_1 = 2 dot [10 dot (1)/(2)] = 10 $ m.
          $ S_2 = 2 dot [10 dot ((1)/(2))^2] = 5 $ m.
          ...
        Tổng quãng đường bóng di chuyển là:
        $ S = 10 + 2 dot [ 10 dot ((1)/(2)) + 10 dot ((1)/(2))^2 + 10 dot ((1)/(2))^3 + ... ] $
        Biểu thức trong ngoặc vuông là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 5$ và công bội $q = (1)/(2)$.
        $ S_("trong ngoặc") = (u_1)/(1 - q) = (5)/(1 - (1)/(2)) = 10 $.
        Vậy tổng quãng đường bóng di chuyển là:
        $ S = 10 + 2 dot 10 = 30 $ m.
    ]
)

// TL 2
#tln([Biết giới hạn $limits(lim)_(x -> 6) (a sqrt(x - 2) + b)/(x - 6) = 1$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
    [80],
    loigiai: [
        Mẫu số bằng $0$ khi $x -> 6$, để giới hạn hữu hạn thì tử số phải nhận $x = 6$ làm nghiệm:
        $ a sqrt(6 - 2) + b = 0 => 2a + b = 0 => b = -2a $.
        Thế vào giới hạn ta được:
        $ limits(lim)_(x -> 6) (a sqrt(x - 2) - 2a)/(x - 6) = limits(lim)_(x -> 6) ( a(sqrt(x - 2) - 2) )/(x - 6) $
        $ = limits(lim)_(x -> 6) ( a(x - 2 - 4) )/( (x - 6)(sqrt(x - 2) + 2) ) = limits(lim)_(x -> 6) (a)/(sqrt(x - 2) + 2) = (a)/(4) $.
        Theo giả thiết:
        $ (a)/(4) = 1 => a = 4 $.
        Suy ra $b = -2 dot 4 = -8$.
        Vậy $P = a^2 + b^2 = 4^2 + (-8)^2 = 16 + 64 = 80$.
    ]
)

// TL 3
#tln([Cho hàm số $y = f(x)$ liên tục tại mọi điểm và thỏa mãn giới hạn $limits(lim)_(x -> 5) (f(x) - 12)/(x - 5) = 11$. Tính giá trị của biểu thức $10K$ biết $K = limits(lim)_(x -> 5) (f^2(x) - 144)/(x^2 - 25)$.],
    [264],
    loigiai: [
        Từ giới hạn ban đầu, vì mẫu số tiến về $0$ khi $x -> 5$ nên tử số phải tiến về $0$, tức là $limits(lim)_(x -> 5) f(x) = 12$.
        Ta phân tích tử số của $K$:
        $ f^2(x) - 144 = (f(x) - 12)(f(x) + 12) $.
        Ta biến đổi giới hạn $K$:
        $ K = limits(lim)_(x -> 5) ( (f(x) - 12)(f(x) + 12) ) / ( (x - 5)(x + 5) ) $
        $ K = limits(lim)_(x -> 5) [ (f(x) - 12)/(x - 5) ] dot limits(lim)_(x -> 5) [ (f(x) + 12)/(x + 5) ] $
        $ K = 11 dot (12 + 12)/(5 + 5) = 11 dot (24)/(10) = (132)/(5) $.
        Suy ra $10K = 10 dot (132)/(5) = 264$.
    ]
)

// TL 4
#tln([Một nhà máy cấp nước đo lường nồng độ clo tích lũy (đơn vị: ppm) trong bể chứa sau $t$ giờ sục khí hoạt động ổn định là $C(t) = (36t^2 - t + 5)/(t^2 + 2)$. Tính giới hạn nồng độ clo tích lũy tối đa khi thời gian sục khí kéo dài vô hạn ($t -> +oo$).],
    [36],
    loigiai: [
        Ta tính giới hạn của nồng độ clo khi thời gian kéo dài vô hạn:
        $ limits(lim)_(t -> +oo) C(t) = limits(lim)_(t -> +oo) (36t^2 - t + 5)/(t^2 + 2) = limits(lim)_(t -> +oo) (36 - (1)/(t) + (5)/(t^2))/(1 + (2)/(t^2)) = 36 $ ppm.
    ]
)

// TL 5
#tln([Tìm giá trị dương của tham số $m$ để hàm số $f(x) = cases((x^2 - 6x + 5)/(x - 5) "khi" x < 5, m^2 x - 16 "khi" x >= 5)$ liên tục tại điểm $x = 5$.],
    [2],
    loigiai: [
        Để hàm số liên tục tại điểm $x = 5$, ta cần $limits(lim)_(x -> 5^-) f(x) = limits(lim)_(x -> 5^+) f(x) = f(5)$.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(x -> 5^-) f(x) = limits(lim)_(x -> 5^-) (x^2 - 6x + 5)/(x - 5) = limits(lim)_(x -> 5^-) ((x - 5)(x - 1))/(x - 5) = limits(lim)_(x -> 5^-) (x - 1) = 4 $.
        - Giới hạn phải và giá trị hàm số:
          $ f(5) = limits(lim)_(x -> 5^+) f(x) = m^2 dot 5 - 16 = 5m^2 - 16 $.
        Do đó:
        $ 5m^2 - 16 = 4 => 5m^2 = 20 => m^2 = 4 $.
        Vì $m$ nhận giá trị dương nên $m = 2$.
    ]
)

// TL 6
#tln([Lòng của một máng xả rác tại tòa nhà chung cư được đúc liền khớp nối hai đoạn nghiêng và thẳng dốc. Chiều cao của máng nước $y(t)$ (mét) theo chiều ngang $t$ (mét) là hàm số liên tục:
    $y(t) = cases((t^2 - 4t - 5)/(t - 5) + 12 "khi" 0 <= t < 5, a t + 8 "khi" t >= 5)$.
    Tìm giá trị của tham số $a$ để lòng máng xả rác liên tục hoàn hảo, không bị đứt gãy gồ ghề tại điểm khớp nối $t = 5$ m.],
    [2],
    loigiai: [
        Vì máng xả rác liên tục không bị gián đoạn nên hàm số độ cao $y(t)$ phải liên tục tại điểm mốc khớp nối $t = 5$ m.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(t -> 5^-) y(t) = limits(lim)_(t -> 5^-) [ (t^2 - 4t - 5)/(t - 5) + 12 ] = limits(lim)_(t -> 5^-) [ ((t - 5)(t + 1))/(t - 5) + 12 ] $
          $ = limits(lim)_(t -> 5^-) (t + 1 + 12) = 5 + 1 + 12 = 18 $ m.
        - Giới hạn phải và giá trị hàm số:
          $ y(5) = limits(lim)_(t -> 5^+) y(t) = a dot 5 + 8 = 5a + 8 $.
        Để hàm số liên tục tại $t = 5$ ta cần:
        $ 5a + 8 = 18 => 5a = 10 => a = 2 $.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
