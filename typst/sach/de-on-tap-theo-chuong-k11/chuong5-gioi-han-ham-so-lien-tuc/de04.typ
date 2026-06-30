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
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 04)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Số lượng loài sinh vật gây hại trong một nông trại được kiểm soát sinh học. Mỗi tuần số lượng của chúng giảm $30\%$ so với tuần trước, đồng thời nông trại ghi nhận có thêm $3000$ cá thể mới sinh ra từ các ổ bọ gậy. Gọi $u_n$ là số lượng sinh vật sau $n$ tuần. Tìm số lượng cá thể ổn định lâu dài của loài này khi $n -> +oo$.],
    (
        [$3000$ cá thể.],
        [$7000$ cá thể.],
        True([$10000$ cá thể.]),
        [$13000$ cá thể.]
    ),
    loigiai: [
        Gọi $L$ là giới hạn số lượng sinh vật ổn định khi $n -> +oo$. Ta có phương trình giới hạn từ công thức truy hồi $u_(n+1) = 0.7 u_n + 3000$:
        $ L = 0.7 L + 3000 $
        $ => 0.3 L = 3000 => L = 10000 $.
    ]
)

// TN 2
#tn([Một quả bóng được thả rơi tự do từ độ cao $18$ m. Mỗi lần chạm đất, quả bóng nảy ngược lên độ cao bằng $(1)/(3)$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường quả bóng di chuyển (bao gồm cả quãng đường rơi xuống và nảy lên) cho đến khi nó hoàn toàn dừng lại (tính bằng mét).],
    (
        [$27$ m.],
        True([$36$ m.]),
        [$54$ m.],
        [$72$ m.]
    ),
    loigiai: [
        Quãng đường di chuyển của quả bóng bao gồm:
        - Lần rơi đầu tiên: $18$ m.
        - Các lần nảy lên và rơi xuống tiếp theo tạo thành các cặp quãng đường bằng nhau:
          $ S_1 = 2 dot [18 dot (1)/(3)] = 12 $ m.
          $ S_2 = 2 dot [18 dot ((1)/(3))^2] $ m.
          ...
        Tổng quãng đường bóng di chuyển là:
        $ S = 18 + 2 dot [ 18 dot ((1)/(3)) + 18 dot ((1)/(3))^2 + 18 dot ((1)/(3))^3 + ... ] $
        Biểu thức trong ngoặc vuông là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 6$ và công bội $q = (1)/(3)$.
        $ S_("trong ngoặc") = (u_1)/(1 - q) = (6)/(1 - (1)/(3)) = 9 $.
        Vậy tổng quãng đường bóng di chuyển là:
        $ S = 18 + 2 dot 9 = 36 $ m.
    ]
)

// TN 3
#tn([Cho một hình vuông có cạnh bằng $4$. Người ta dựng hình vuông thứ hai bằng cách nối trung điểm các cạnh của hình vuông thứ nhất, hình vuông thứ ba bằng cách nối trung điểm các cạnh của hình vuông thứ hai, và cứ tiếp tục như vậy vô hạn lần. Tính tổng diện tích của tất cả các hình vuông trong dãy đó.],
    (
        [$16$],
        [$24$],
        True([$32$]),
        [$64$]
    ),
    loigiai: [
        Diện tích hình vuông ban đầu là $S_1 = 4^2 = 16$.
        Mỗi hình vuông tiếp theo có diện tích bằng $(1)/(2)$ diện tích hình vuông trước nó.
        Diện tích các hình vuông lập thành một cấp số nhân lùi vô hạn với số hạng đầu $S_1 = 16$ và công bội $q = (1)/(2)$.
        Tổng diện tích là:
        $ S = (S_1)/(1 - q) = (16)/(1 - (1)/(2)) = 32 $.
    ]
)

// TN 4
#tn([Cho giới hạn $limits(lim)_(x -> 0) (sqrt(1 + 2x) - 1)/(x) = a$ và $limits(lim)_(x -> +oo) (b x^2 - x + 1)/(2x^2 + 3) = 2$ với $a, b in RR$. Tính giá trị của biểu thức $P = a + b$.],
    (
        [$P = 3$],
        [$P = 4$],
        True([$P = 5$]),
        [$P = 6$]
    ),
    loigiai: [
        - Tính $a$: Nhân liên hợp tử số:
          $ a = limits(lim)_(x -> 0) ( (sqrt(1 + 2x) - 1)(sqrt(1 + 2x) + 1) ) / ( x(sqrt(1 + 2x) + 1) ) = limits(lim)_(x -> 0) (2x)/(x(sqrt(1 + 2x) + 1)) = limits(lim)_(x -> 0) (2)/(sqrt(1 + 2x) + 1) = 1 $.
        - Tính $b$:
          $ limits(lim)_(x -> +oo) (b x^2 - x + 1)/(2x^2 + 3) = (b)/(2) = 2 => b = 4 $.
        - Vậy $P = a + b = 1 + 4 = 5$.
    ]
)

// TN 5
#tn([Chi phí thiết lập ban đầu cho một dây chuyền sản xuất của một doanh nghiệp là $500$ triệu đồng. Chi phí nguyên vật liệu để sản xuất mỗi sản phẩm tiếp theo là $2$ triệu đồng. Gọi $C(x)$ (triệu đồng) là chi phí trung bình để sản xuất $x$ sản phẩm. Tính giới hạn của chi phí trung bình này khi số lượng sản phẩm sản xuất ra tiến tới vô hạn ($x -> +oo$).],
    (
        [$500$ triệu đồng.],
        [$250$ triệu đồng.],
        True([$2$ triệu đồng.]),
        [$0$ triệu đồng.]
    ),
    loigiai: [
        Tổng chi phí để sản xuất $x$ sản phẩm là $T(x) = 500 + 2x$ (triệu đồng).
        Chi phí trung bình trên mỗi sản phẩm là:
        $ C(x) = (500 + 2x)/(x) $.
        Giới hạn khi $x -> +oo$:
        $ limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) ((500)/(x) + 2) = 2 $ triệu đồng.
    ]
)

// TN 6
#tn([Nồng độ của một chất kích thích sinh trưởng trong đất sau khi phun thuốc được tính bởi công thức $A(t) = (t^2 - 4t + 3)/(t - 3)$ (ppm) với $t > 3$ (ngày). Tính giới hạn nồng độ chất kích thích khi thời gian $t$ tiến sát về ngày thứ $3$ ($t -> 3^+$).],
    (
        [$0$ ppm.],
        [$1$ ppm.],
        True([$2$ ppm.]),
        [$3$ ppm.]
    ),
    loigiai: [
        Ta phân tích tử số thành nhân tử để khử dạng vô định $((0)/(0))$:
        $ limits(lim)_(t -> 3^+) (t^2 - 4t + 3)/(t - 3) = limits(lim)_(t -> 3^+) ((t - 1)(t - 3))/(t - 3) = limits(lim)_(t -> 3^+) (t - 1) = 2 $ ppm.
    ]
)

// TN 7
#tn([Tốc độ truyền tin của một chiến dịch truyền thông trực tuyến sau $t$ ngày được mô tả bởi hàm số $V(t) = 150 - (120)/(t^2 + 1)$ (lượt chia sẻ/phút). Tính tốc độ truyền tin tối đa đạt được khi chiến dịch kéo dài vô hạn ($t -> +oo$).],
    (
        [$120$ lượt/phút.],
        True([$150$ lượt/phút.]),
        [$30$ lượt/phút.],
        [$270$ lượt/phút.]
    ),
    loigiai: [
        Ta tính giới hạn của tốc độ truyền tin khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) V(t) = limits(lim)_(t -> +oo) [150 - (120)/(t^2 + 1)] = 150 - 0 = 150 $.
    ]
)

// TN 8
#tn([Cho hàm số $f(x)$ thỏa mãn giới hạn $limits(lim)_(x -> -1) (f(x) - 3)/(x + 1) = 2$. Tính giới hạn $L = limits(lim)_(x -> -1) (f^2(x) - 9)/(x^2 - 1)$.],
    (
        [$L = 6$],
        [$L = 2$],
        [$L = -3$],
        True([$L = -6$])
    ),
    loigiai: [
        Vì giới hạn $limits(lim)_(x -> -1) (f(x) - 3)/(x + 1) = 2$ hữu hạn nên $limits(lim)_(x -> -1) f(x) = 3$.
        Ta biến đổi biểu thức giới hạn $L$:
        $ L = limits(lim)_(x -> -1) ( (f(x) - 3)(f(x) + 3) ) / ( (x + 1)(x - 1) ) = limits(lim)_(x -> -1) [ (f(x) - 3)/(x + 1) ] dot limits(lim)_(x -> -1) [ (f(x) + 3)/(x - 1) ] $
        $ L = 2 dot (3 + 3)/(-1 - 1) = 2 dot (6)/(-2) = -6 $.
    ]
)

// TN 9
#tn([Cường độ sáng của một đèn LED thông minh tự động thay đổi theo thời gian $t$ (giây) bởi hàm số $L(t) = cases(t^2 + 2 "khi" 0 <= t < 2, a t - 2 "khi" t >= 2)$. Tìm giá trị của $a$ để đèn thay đổi cường độ sáng liên tục tại thời điểm chuyển chế độ $t = 2$.],
    (
        [$a = 2$],
        [$a = 3$],
        True([$a = 4$]),
        [$a = 6$]
    ),
    loigiai: [
        Để cường độ sáng thay đổi liên tục tại $t = 2$, hàm số $L(t)$ phải liên tục tại $t = 2$:
        $ limits(lim)_(t -> 2^-) L(t) = limits(lim)_(t -> 2^+) L(t) = L(2) $.
        Ta có:
        - $limits(lim)_(t -> 2^-) L(t) = limits(lim)_(t -> 2^-) (t^2 + 2) = 6$.
        - $L(2) = limits(lim)_(t -> 2^+) L(t) = a dot 2 - 2 = 2a - 2$.
        Suy ra:
        $ 2a - 2 = 6 => 2a = 8 => a = 4 $.
    ]
)

// TN 10
#tn([Một hệ thống van xả tự động mở thoát nước của hồ điều hòa khi mực nước vượt ngưỡng $h_0 = 1.5$ m. Lưu lượng nước thoát $Q(h)$ ($"m"^3$/phút) là hàm số của mực nước $h$ (mét) được cho bởi công thức $Q(h) = cases(0 "khi" 0 <= h <= 1.5, 5 "khi" h > 1.5)$. Nhận xét nào sau đây đúng về tính liên tục của hàm lưu lượng nước thoát tại mốc $h = 1.5$ m?],
    (
        [Hàm số liên tục tại $h = 1.5$.],
        True([Hàm số gián đoạn tại $h = 1.5$ vì giới hạn trái khác giới hạn phải.]),
        [Hàm số liên tục trên khoảng $[0; 3]$.],
        [Giới hạn phải tại $h = 1.5$ bằng $0$.]
    ),
    loigiai: [
        Ta có:
        - Giới hạn trái: $limits(lim)_(h -> 1.5^-) Q(h) = 0$.
        - Giới hạn phải: $limits(lim)_(h -> 1.5^+) Q(h) = 5$.
        Vì $limits(lim)_(h -> 1.5^-) Q(h) != limits(lim)_(h -> 1.5^+) Q(h)$ nên hàm số gián đoạn tại $h = 1.5$.
    ]
)

// TN 11
#tn([Quỹ đạo bay của một tên lửa khí tượng được mô tả bởi một hàm số liên tục theo thời gian $t$ (phút). Lúc phóng ($t = 0$), tên lửa ở độ cao $0$ m. Sau $5$ phút, tên lửa đạt độ cao tối đa là $8000$ m. Nhận xét nào sau đây chắc chắn đúng?],
    (
        [Tên lửa bay với vận tốc không đổi.],
        True([Trong 5 phút đầu, có ít nhất một thời điểm tên lửa ở độ cao đúng $4000$ m.]),
        [Tên lửa đạt độ cao $4000$ m vào đúng thời điểm $t = 2.5$ phút.],
        [Tên lửa không thể giảm độ cao trong khoảng thời gian này.]
    ),
    loigiai: [
        Vì độ cao là hàm số liên tục trên $[0; 5]$ và $0 < 4000 < 8000$, nên theo định lý giá trị trung gian, luôn tồn tại ít nhất một thời điểm $t_0 in (0; 5)$ sao cho tên lửa đạt độ cao đúng $4000$ m.
    ]
)

// TN 12
#tn([Hàm số nào sau đây mô tả một đại lượng thay đổi liên tục (không có bước nhảy) trong đời sống tự nhiên?],
    (
        True([Cân nặng của một loài động vật tăng trưởng theo thời gian.]),
        [Số lượng trứng do một con chim đẻ ra.],
        [Số lượng lá trên cành cây rụng đi trong mùa thu.],
        [Số lượng tế bào phân đôi sau mỗi thế hệ sinh sản.]
    ),
    loigiai: [
        Cân nặng của sinh vật thay đổi liên tục qua mọi giá trị số thực trung gian mà không có bước nhảy đột ngột, do đó được mô tả bằng hàm số liên tục. Các đại lượng còn lại đều có tính chất đếm số nguyên rời rạc, có bước nhảy đột ngột.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một quần thể cá trong hồ bảo tồn ban đầu có số lượng là $1000$ con. Mỗi năm, do sinh sản tự nhiên, số cá tăng $10\%$ so với năm trước đó, đồng thời cơ quan bảo tồn đánh bắt giảm thiểu định kỳ $200$ con cá để cân bằng sinh thái. Gọi $u_n$ là số lượng cá sau $n$ năm. Các phát biểu sau đúng hay sai?], (
        True([Số lượng cá trong hồ sau năm thứ nhất là $900$ con.]),
        True([Công thức truy hồi của dãy số số lượng cá là $u_n = 1.1 u_(n-1) - 200$ với mọi $n >= 2$.]),
        True([Công thức tổng quát của dãy số là $u_n = 2000 - 1000 dot (1.1)^n$ với mọi $n >= 1$.]),
        [Khi số năm kéo dài vô hạn ($n -> +oo$), số lượng cá trong hồ sẽ tăng lên vô hạn.]
    ), 
    loigiai: [
        - *a)* Đúng. Số cá sau 1 năm: $u_1 = 1000 dot 1.1 - 200 = 900$ con.
        - *b)* Đúng. Số lượng cá tăng $10\%$ (nhân $1.1$) rồi trừ đi $200$ con đánh bắt.
        - *c)* Đúng. Kiểm tra công thức tổng quát:
          - Với $n=1$: $u_1 = 2000 - 1000 dot 1.1 = 900$ (Đúng).
          - Với $n=2$: $u_2 = 2000 - 1000 dot 1.21 = 790$ (Đúng, vì $u_2 = 1.1 dot 900 - 200 = 790$).
        - *d)* Sai. Vì công bội $1.1 > 1$ nhưng hệ số trước $(1.1)^n$ là $-1000 < 0$. Do đó khi $n -> +oo$, giới hạn của $u_n$ tiến về $-oo$, tức là quần thể cá trong hồ sẽ bị suy giảm mạnh và tuyệt diệt hoàn toàn sau một số năm hoạt động.
    ]
)

// DS 2
#ds([Chi phí trung bình để sản xuất $x$ tấn sản phẩm hóa chất của một nhà máy được tính bởi công thức: $C(x) = (10x + 20)/(x + 1)$ (triệu đồng/tấn) với sản lượng $x > 0$. Các phát biểu sau đúng hay sai?], (
        True([Chi phí trung bình để sản xuất $1$ tấn sản phẩm đầu tiên là $15$ triệu đồng.]),
        True([Khi quy mô sản xuất tăng lên vô hạn ($x -> +oo$), chi phí trung bình tiến sát về mức tối ưu là $10$ triệu đồng/tấn.]),
        [Chi phí trung bình tăng dần khi sản lượng sản xuất $x$ tăng lên.],
        True([Giới hạn của chi phí trung bình khi sản lượng tiến sát về mốc bắt đầu $0$ tấn ($x -> 0^+$) là $20$ triệu đồng/tấn.])
    ), 
    loigiai: [
        - *a)* Đúng. $C(1) = (10 dot 1 + 20)/(1 + 1) = (30)/(2) = 15$ triệu đồng.
        - *b)* Đúng. $limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) (10 + (20)/(x))/(1 + (1)/(x)) = 10$ triệu đồng/tấn.
        - *c)* Sai. Đạo hàm của hàm số $C(x)$ là $C'(x) = (10 dot 1 - 20 dot 1)/((x+1)^2) = - (10)/((x+1)^2) < 0$, do đó chi phí trung bình giảm dần khi sản lượng tăng (lợi thế kinh tế nhờ quy mô).
        - *d)* Đúng. $limits(lim)_(x -> 0^+) C(x) = (20)/(1) = 20$ triệu đồng/tấn.
    ]
)

// DS 3
#ds([Một đập ngăn nước thủy điện có mặt cắt đứng được thiết kế dạng đường biên là hàm số $y = f(x)$ (mét) theo chiều ngang $x$ (mét):
    $f(x) = cases((x^2 - a x - 6)/(x - 3) "khi" 0 <= x < 3, b x - 4 "khi" x >= 3)$.
    Các phát biểu sau đúng hay sai?], (
        True([Để bề mặt đập không bị nứt gãy đứt đoạn, giới hạn trái $limits(lim)_(x -> 3^-) f(x)$ phải tồn tại hữu hạn, từ đó suy ra tham số thiết kế $a = 1$.]),
        True([Khi $a = 1$, giới hạn bên trái $limits(lim)_(x -> 3^-) f(x)$ bằng $5$ m.]),
        True([Với $a = 1$, giá trị của tham số $b$ để bề mặt đập liên tục tại điểm nối $x = 3$ là $b = 3$.]),
        [Nếu kỹ sư thiết kế nhầm lẫn với tham số $a = 1$ và $b = 2$ thì bề mặt đập sẽ có bước nhảy gián đoạn tại $x = 3$ bằng đúng $1$ m.]
    ), 
    loigiai: [
        - *a)* Đúng. Mẫu số bằng $0$ khi $x -> 3$. Để giới hạn hữu hạn thì tử số phải có nghiệm $x = 3$:
          $ 3^2 - 3a - 6 = 0 => 3 - 3a = 0 => a = 1 $.
        - *b)* Đúng. Khi $a = 1$:
          $ limits(lim)_(x -> 3^-) f(x) = limits(lim)_(x -> 3^-) (x^2 - x - 6)/(x - 3) = limits(lim)_(x -> 3^-) ((x - 3)(x + 2))/(x - 3) = limits(lim)_(x -> 3^-) (x + 2) = 5 $ m.
        - *c)* Đúng. Ta cần $f(3) = 3b - 4 = 5 => 3b = 9 => b = 3$.
        - *d)* Sai. Khi $b = 2$, giới hạn phải là $f(3) = 2 dot 3 - 4 = 2$ m.
          Giới hạn trái bằng $5$ m.
          Bước nhảy gián đoạn là $|5 - 2| = 3$ m (chứ không phải $1$ m).
    ]
)

// DS 4
#ds([Một chiến dịch quảng cáo trực tuyến được bắt đầu bằng việc gửi tin nhắn đến $100$ khách hàng đầu tiên. Cứ sau mỗi giờ, lượng khách hàng mới nhận được quảng cáo bằng $50\%$ lượng người mới nhận ở giờ ngay trước đó (tin nhắn lan truyền giảm dần theo cấp số nhân lùi vô hạn). Các phát biểu sau đúng hay sai?], (
        True([Lượng khách hàng mới nhận được tin nhắn quảng cáo ở giờ thứ hai là $50$ người.]),
        True([Tổng số tin nhắn quảng cáo được gửi đi sau $n$ giờ là tổng của một cấp số nhân có công bội $q = 0.5$.]),
        True([Tổng số tin nhắn tối đa có thể phát tán được trên mạng xã hội sau vô hạn giờ là $200$ tin nhắn.]),
        True([Nếu tỉ lệ phản hồi và chia sẻ tăng lên đạt mức $60\% = 0.6$, tổng số tin nhắn tối đa phát tán được sau vô hạn giờ sẽ tăng lên thành $250$ tin nhắn.])
    ), 
    loigiai: [
        - *a)* Đúng. Số khách hàng mới ở giờ thứ hai là $u_2 = 100 dot 0.5 = 50$ người.
        - *b)* Đúng. Mỗi giờ lượng người mới bằng một nửa giờ trước, tạo thành cấp số nhân có công bội $q = 0.5$ với $|q| < 1$.
        - *c)* Đúng. Tổng số tin nhắn phát tán tối đa là:
          $ S = (u_1)/(1 - q) = (100)/(1 - 0.5) = 200 $ tin nhắn.
        - *d)* Đúng. Khi $q = 0.6$:
          $ S_("mới") = (100)/(1 - 0.6) = (100)/(0.4) = 250 $ tin nhắn.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một chiếc đồng hồ quả lắc dao động tắt dần liên tục. Quãng đường quả lắc di chuyển được trong chu kỳ đầu tiên là $40$ cm. Kể từ chu kỳ thứ hai, quãng đường di chuyển được trong mỗi chu kỳ đều giảm $10\%$ so với chu kỳ ngay trước đó. Tính tổng quãng đường quả lắc di chuyển được cho đến khi nó hoàn toàn dừng lại (tính bằng xăng-ti-mét).],
    [400],
    loigiai: [
        Quãng đường quả lắc di chuyển qua các chu kỳ lập thành cấp số nhân lùi vô hạn có:
        - Số hạng đầu $u_1 = 40$ cm.
        - Công bội $q = 1 - 10\% = 90\% = 0.9$ (vì giảm $10\%$, tức bằng $90\%$ chu kỳ trước).
        Tổng quãng đường quả lắc di chuyển là:
        $ S = (u_1)/(1 - q) = (40)/(1 - 0.9) = (40)/(0.1) = 400 $ cm.
    ]
)

// TL 2
#tln([Biết giới hạn $limits(lim)_(x -> 3) (a sqrt(x + 1) + b)/(x - 3) = 1$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
    [80],
    loigiai: [
        Mẫu số tiến về $0$ khi $x -> 3$, để giới hạn hữu hạn thì tử số phải có nghiệm $x = 3$:
        $ a sqrt(3 + 1) + b = 0 => 2a + b = 0 => b = -2a $.
        Thế vào giới hạn ta có:
        $ limits(lim)_(x -> 3) (a sqrt(x + 1) - 2a)/(x - 3) = limits(lim)_(x -> 3) ( a(sqrt(x + 1) - 2) )/(x - 3) $
        $ = limits(lim)_(x -> 3) ( a(x + 1 - 4) )/( (x - 3)(sqrt(x + 1) + 2) ) = limits(lim)_(x -> 3) (a)/(sqrt(x + 1) + 2) = (a)/(4) $.
        Do đó:
        $ (a)/(4) = 1 => a = 4 $.
        Suy ra $b = -2 dot 4 = -8$.
        Vậy $P = a^2 + b^2 = 4^2 + (-8)^2 = 16 + 64 = 80$.
    ]
)

// TL 3
#tln([Cho hàm số $y = f(x)$ liên tục tại mọi điểm và thỏa mãn giới hạn $limits(lim)_(x -> 2) (f(x) - 6)/(x - 2) = 5$. Tính giới hạn $H = limits(lim)_(x -> 2) (f^2(x) - 36)/(x^2 - 4)$.],
    [15],
    loigiai: [
        Từ giới hạn ban đầu, vì mẫu số tiến về $0$ khi $x -> 2$ nên tử số phải tiến về $0$, tức là $limits(lim)_(x -> 2) f(x) = 6$.
        Ta phân tích tử số của $H$:
        $ f^2(x) - 36 = (f(x) - 6)(f(x) + 6) $.
        Ta biến đổi giới hạn $H$:
        $ H = limits(lim)_(x -> 2) ( (f(x) - 6)(f(x) + 6) ) / ( (x - 2)(x + 2) ) $
        $ H = limits(lim)_(x -> 2) [ (f(x) - 6)/(x - 2) ] dot limits(lim)_(x -> 2) [ (f(x) + 6)/(x + 2) ] $
        $ H = 5 dot (6 + 6)/(2 + 2) = 5 dot (12)/(4) = 15 $.
    ]
)

// TL 4
#tln([Một loại vi sinh vật gây bệnh được tiêm vào cơ thể động vật thí nghiệm. Nồng độ kháng thể tự nhiên $A(t)$ (mg/dl) tạo ra để chống lại vi khuẩn sau $t$ ngày được mô tả bởi công thức $A(t) = (40t^2 + 10)/(t^2 + 2)$. Tính giới hạn nồng độ kháng thể tối đa đạt được trong cơ thể khi thời gian $t -> +oo$.],
    [40],
    loigiai: [
        Ta tính giới hạn của nồng độ kháng thể khi thời gian kéo dài vô hạn:
        $ limits(lim)_(t -> +oo) A(t) = limits(lim)_(t -> +oo) (40t^2 + 10)/(t^2 + 2) = limits(lim)_(t -> +oo) (40 + (10)/(t^2))/(1 + (2)/(t^2)) = 40 $ mg/dl.
    ]
)

// TL 5
#tln([Tìm giá trị dương của tham số $m$ để hàm số $f(x) = cases((x^2 - 3x + 2)/(x - 2) "khi" x < 2, m^2 x - 7 "khi" x >= 2)$ liên tục tại điểm $x = 2$.],
    [2],
    loigiai: [
        Để hàm số liên tục tại điểm $x = 2$, ta cần $limits(lim)_(x -> 2^-) f(x) = limits(lim)_(x -> 2^+) f(x) = f(2)$.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(x -> 2^-) f(x) = limits(lim)_(x -> 2^-) (x^2 - 3x + 2)/(x - 2) = limits(lim)_(x -> 2^-) ((x - 1)(x - 2))/(x - 2) = limits(lim)_(x -> 2^-) (x - 1) = 1 $.
        - Giới hạn phải và giá trị hàm số:
          $ f(2) = limits(lim)_(x -> 2^+) f(x) = m^2 dot 2 - 7 = 2m^2 - 7 $.
        Do đó:
        $ 2m^2 - 7 = 1 => 2m^2 = 8 => m^2 = 4 $.
        Vì $m$ nhận giá trị dương nên $m = 2$.
    ]
)

// TL 6
#tln([Một máng nước bằng bê tông được đúc nối tiếp hai phần dốc và ngang. Bề mặt đáy máng nước có độ cao so với mặt đất phẳng là $h(t)$ (mét) theo chiều dài máng $t$ (mét) được mô tả bởi hàm số liên tục:
    $h(t) = cases((t^2 - t - 6)/(t - 3) + 8 "khi" 0 <= t < 3, a t + 4 "khi" t >= 3)$.
    Tìm giá trị của tham số $a$ để dòng chảy trơn tru không bị gián đoạn lưu lượng đột ngột tại mốc nối $t = 3$ m.],
    [3],
    loigiai: [
        Vì dòng chảy qua máng nước liên tục nên hàm số độ cao $h(t)$ phải liên tục tại điểm mốc $t = 3$ m.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(t -> 3^-) h(t) = limits(lim)_(t -> 3^-) [ (t^2 - t - 6)/(t - 3) + 8 ] = limits(lim)_(t -> 3^-) [ ((t - 3)(t + 2))/(t - 3) + 8 ] $
          $ = limits(lim)_(t -> 3^-) (t + 2 + 8) = 3 + 2 + 8 = 13 $ m.
        - Giới hạn phải và giá trị hàm số:
          $ h(3) = limits(lim)_(t -> 3^+) h(t) = a dot 3 + 4 = 3a + 4 $.
        Để hàm số liên tục tại $t = 3$ ta cần:
        $ 3a + 4 = 13 => 3a = 9 => a = 3 $.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
