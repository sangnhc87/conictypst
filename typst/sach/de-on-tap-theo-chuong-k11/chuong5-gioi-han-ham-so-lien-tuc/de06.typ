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
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 06)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Trong một ao nuôi cá, người nuôi bổ sung thức ăn định kỳ mỗi ngày. Mỗi ngày lượng thức ăn cá tiêu thụ làm giảm $50\%$ lượng thức ăn cũ có trong ao, đồng thời người nuôi bổ sung thêm $20$ kg thức ăn mới. Gọi $u_n$ là lượng thức ăn còn dư trong ao sau $n$ ngày. Tính lượng thức ăn dư ổn định lâu dài trong ao khi thời gian kéo dài vô hạn ($n -> +oo$).],
    (
        [$20$ kg.],
        [$30$ kg.],
        True([$40$ kg.]),
        [$50$ kg.]
    ),
    loigiai: [
        Lượng thức ăn còn dư sau ngày tiếp theo tuân theo công thức truy hồi:
        $ u_(n+1) = 0.5 u_n + 20 $.
        Khi $n -> +oo$, lượng thức ăn dư tiến tới giới hạn ổn định $L = limits(lim)_(n -> +oo) u_n$.
        Ta có phương trình:
        $ L = 0.5 L + 20 $
        $ => 0.5 L = 20 => L = 40 $ kg.
    ]
)

// TN 2
#tn([Một quả bóng được thả rơi tự do từ độ cao $15$ m. Mỗi lần chạm đất, quả bóng nảy ngược lên đạt độ cao bằng $(2)/(3)$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường quả bóng di chuyển (bao gồm cả quãng đường rơi xuống và nảy lên) cho đến khi nó hoàn toàn dừng lại (tính bằng mét).],
    (
        [$45$ m.],
        [$60$ m.],
        True([$75$ m.]),
        [$90$ m.]
    ),
    loigiai: [
        Quãng đường di chuyển của quả bóng bao gồm:
        - Lần rơi đầu tiên: $15$ m.
        - Các lần nảy lên và rơi xuống tiếp theo tạo thành các cặp quãng đường bằng nhau:
          $ S_1 = 2 dot [15 dot (2)/(3)] = 20 $ m.
          $ S_2 = 2 dot [15 dot ((2)/(3))^2] = (40)/(3) $ m.
          ...
        Tổng quãng đường bóng di chuyển là:
        $ S = 15 + 2 dot [ 15 dot ((2)/(3)) + 15 dot ((2)/(3))^2 + 15 dot ((2)/(3))^3 + ... ] $
        Biểu thức trong ngoặc vuông là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 10$ và công bội $q = (2)/(3)$.
        $ S_("trong ngoặc") = (u_1)/(1 - q) = (10)/(1 - (2)/(3)) = 30 $.
        Vậy tổng quãng đường bóng di chuyển là:
        $ S = 15 + 2 dot 30 = 75 $ m.
    ]
)

// TN 3
#tn([Từ một hình vuông ban đầu có cạnh dài $4$ cm. Người ta dựng hình vuông thứ hai bằng cách nối trung điểm các cạnh của hình vuông thứ nhất, hình vuông thứ ba nối trung điểm các cạnh của hình vuông thứ hai, và cứ tiếp tục như vậy vô hạn lần. Tính tổng chu vi của tất cả các hình vuông trong dãy vô hạn đó (tính bằng xăng-ti-mét).],
    (
        [$16(2 - sqrt(2))$ cm.],
        True([$16(2 + sqrt(2))$ cm.]),
        [$32(2 + sqrt(2))$ cm.],
        [$32(2 - sqrt(2))$ cm.]
    ),
    loigiai: [
        - Chu vi hình vuông thứ nhất: $P_1 = 4 dot 4 = 16$ cm.
        - Cạnh hình vuông thứ hai là: $a_2 = sqrt( 2^2 + 2^2 ) = 2 sqrt(2)$ cm.
          Chu vi hình vuông thứ hai: $P_2 = 4 dot 2 sqrt(2) = 8 sqrt(2)$ cm.
        - Chu vi các hình vuông lập thành một cấp số nhân lùi vô hạn với số hạng đầu $P_1 = 16$ và công bội $q = (P_2)/(P_1) = (8 sqrt(2))/(16) = (sqrt(2))/(2)$ (thỏa mãn $|q| < 1$).
        Tổng chu vi là:
        $ P = (P_1)/(1 - q) = (16)/(1 - (sqrt(2))/(2)) = (32)/(2 - sqrt(2)) = (32(2 + sqrt(2)))/(4 - 2) = 16(2 + sqrt(2)) $ cm.
    ]
)

// TN 4
#tn([Cho giới hạn $limits(lim)_(x -> 3) (x^2 + a x + b)/(x - 3) = 7$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b$.],
    (
        [$P = 13$],
        [$P = -13$],
        [$P = 11$],
        True([$P = -11$])
    ),
    loigiai: [
        Mẫu số tiến về $0$ khi $x -> 3$. Để giới hạn tồn tại hữu hạn, tử số phải nhận $x = 3$ làm nghiệm:
        $ 3^2 + 3a + b = 0 => b = -3a - 9 $.
        Thế vào biểu thức giới hạn ta được:
        $ limits(lim)_(x -> 3) (x^2 + a x - 3a - 9)/(x - 3) = limits(lim)_(x -> 3) ((x - 3)(x + a + 3))/(x - 3) = limits(lim)_(x -> 3) (x + a + 3) = a + 6 $.
        Theo giả thiết:
        $ a + 6 = 7 => a = 1 $.
        Suy ra $b = -3 dot 1 - 9 = -12$.
        Vậy $P = a^2 + b = 1^2 + (-12) = -11$.
    ]
)

// TN 5
#tn([Chi phí trung bình để sản xuất $x$ chiếc tủ lạnh của một công ty điện lạnh được cho bởi công thức $C(x) = (30x + 1500)/(x)$ (triệu đồng/chiếc). Khi số lượng sản xuất tủ lạnh cực kỳ lớn ($x -> +oo$), chi phí trung bình trên mỗi chiếc tiến sát về mức tối ưu nào?],
    (
        [$1500$ triệu đồng.],
        [$1530$ triệu đồng.],
        True([$30$ triệu đồng.]),
        [$0$ triệu đồng.]
    ),
    loigiai: [
        Ta tính giới hạn của chi phí trung bình khi sản lượng tiến về vô hạn:
        $ limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) (30 + (1500)/(x)) = 30 $ triệu đồng.
    ]
)

// TN 6
#tn([Số lượng vi sinh vật phát triển trong một môi trường thí nghiệm được xác định bởi công thức $N(t) = (50t^2 - 100t)/(t - 2)$ (cá thể) khi thời gian nuôi cấy $t > 2$ ngày. Tính giới hạn của số lượng vi sinh vật khi thời gian tiến sát đến mốc khởi phát $2$ ngày từ bên phải ($t -> 2^+$).],
    (
        [$50$ cá thể.],
        True([$100$ cá thể.]),
        [$0$ cá thể.],
        [$+oo$ cá thể.]
    ),
    loigiai: [
        Ta tính giới hạn bên phải khi $t -> 2^+$:
        $ limits(lim)_(t -> 2^+) (50t^2 - 100t)/(t - 2) = limits(lim)_(t -> 2^+) (50t(t - 2))/(t - 2) = limits(lim)_(t -> 2^+) (50t) = 50 dot 2 = 100 $ cá thể.
    ]
)

// TN 7
#tn([Dung lượng thông tin $M(t)$ (megabyte) được tải xuống từ một máy chủ sau $t$ giây hoạt động ổn định được xác định bởi công thức $M(t) = 500 - (300)/(t + 1)$. Tính giới hạn dung lượng tải xuống tối đa của máy chủ này khi thời gian kéo dài vô hạn ($t -> +oo$).],
    (
        [$300$ MB.],
        True([$500$ MB.]),
        [$200$ MB.],
        [$800$ MB.]
    ),
    loigiai: [
        Ta tính giới hạn của $M(t)$ khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) [500 - (300)/(t + 1)] = 500 - 0 = 500 $ MB.
    ]
)

// TN 8
#tn([Cho hàm số $f(x)$ thỏa mãn giới hạn $limits(lim)_(x -> 4) (f(x) - 5)/(x - 4) = 3$. Tính giá trị của biểu thức $4K$ biết $K = limits(lim)_(x -> 4) (f^2(x) - 25)/(x^2 - 16)$.],
    (
        [$4K = 5$],
        [$4K = 10$],
        True([$4K = 15$]),
        [$4K = 30$]
    ),
    loigiai: [
        Vì giới hạn hữu hạn nên ta có $limits(lim)_(x -> 4) f(x) = 5$.
        Ta phân tích tử số của $K$:
        $ f^2(x) - 25 = (f(x) - 5)(f(x) + 5) $.
        Biến đổi giới hạn $K$:
        $ K = limits(lim)_(x -> 4) ( (f(x) - 5)(f(x) + 5) ) / ( (x - 4)(x + 4) ) $
        $ K = limits(lim)_(x -> 4) [ (f(x) - 5)/(x - 4) ] dot limits(lim)_(x -> 4) [ (f(x) + 5)/(x + 4) ] $
        $ K = 3 dot (5 + 5)/(4 + 4) = 3 dot (10)/(8) = (15)/(4) $.
        Suy ra $4K = 15$.
    ]
)

// TN 9
#tn([Độ cao của một nhịp cầu treo (mét) so với mặt sông được đo bởi hàm số $h(t) = cases(t^2 - 2t + 4 "khi" 0 <= t < 4, a t - 8 "khi" t >= 4)$ với $t$ là chiều dài cầu ngang tính bằng mét. Tìm giá trị của $a$ để mặt cầu trơn trượt liên tục không bị nứt gãy tại khớp nối $t = 4$.],
    (
        [$a = 3$],
        [$a = 4$],
        True([$a = 5$]),
        [$a = 6$]
    ),
    loigiai: [
        Để mặt cầu liên tục tại $t = 4$, ta cần $limits(lim)_(t -> 4^-) h(t) = limits(lim)_(t -> 4^+) h(t) = h(4)$.
        Ta có:
        - $limits(lim)_(t -> 4^-) h(t) = limits(lim)_(t -> 4^-) (t^2 - 2t + 4) = 4^2 - 2 dot 4 + 4 = 12$ m.
        - $h(4) = limits(lim)_(t -> 4^+) h(t) = a dot 4 - 8 = 4a - 8$.
        Suy ra:
        $ 4a - 8 = 12 => 4a = 20 => a = 5 $.
    ]
)

// TN 10
#tn([Gói cước internet di động 4G quy định: Nếu dung lượng sử dụng dưới $5$ GB thì tính cước trọn gói là $50$ nghìn đồng. Kể từ GB thứ 5 trở đi, mỗi GB phụ trội sẽ tính thêm $10$ nghìn đồng. Hàm số biểu diễn cước phí theo dung lượng sử dụng có tính chất nào sau đây tại điểm mốc kết nối $5$ GB?],
    (
        True([Hàm số liên tục tại điểm mốc $5$ GB.]),
        [Hàm số gián đoạn tại điểm mốc $5$ GB.],
        [Hàm số có bước nhảy cước phí tại điểm mốc $5$ GB.],
        [Không tồn tại giới hạn trái tại điểm mốc $5$ GB.]
    ),
    loigiai: [
        Gọi $x$ là dung lượng sử dụng (GB). Hàm số cước phí là:
        $ f(x) = cases(50 "khi" 0 <= x < 5, 50 + 10(x - 5) "khi" x >= 5) $.
        Ta có:
        - Giới hạn trái: $limits(lim)_(x -> 5^-) f(x) = 50$.
        - Giới hạn phải: $limits(lim)_(x -> 5^+) f(x) = 50 + 10(5 - 5) = 50$.
        Vì hai giới hạn bằng nhau và bằng $f(5) = 50$, nên hàm cước phí liên tục tại điểm mốc $5$ GB.
    ]
)

// TN 11
#tn([Quãng đường di chuyển của một chiếc ô tô điện được mô tả bởi một hàm số liên tục theo thời gian $t$ (phút). Tại thời điểm xuất phát $t = 0$, xe ở vị trí tọa độ $0$ m. Sau $10$ phút xe chạy đến tọa độ $5000$ m. Khẳng định nào sau đây chắc chắn đúng?],
    (
        [Vận tốc xe là không đổi trong suốt chu kỳ.],
        True([Trong 10 phút đầu, luôn có ít nhất một thời điểm xe ở vị trí đúng tọa độ $2500$ m.]),
        [Xe đạt vị trí tọa độ $2500$ m vào đúng thời điểm $t = 5$ phút.],
        [Xe không thể quay đầu lùi lại trong khoảng thời gian này.]
    ),
    loigiai: [
        Do vị trí xe thay đổi liên tục trên đoạn $[0; 10]$ và $0 < 2500 < 5000$, theo định lý giá trị trung gian, luôn tồn tại thời điểm $t_0 in (0; 10)$ để tọa độ xe bằng đúng $2500$ m.
    ]
)

// TN 12
#tn([Đại lượng nào sau đây thay đổi gián đoạn (có bước nhảy đột ngột) trong đời sống tự nhiên và xã hội?],
    (
        True([Số lượng người có mặt trong một tòa nhà theo thời gian.]),
        [Nhiệt độ phòng thay đổi khi bật điều hòa.],
        [Áp suất dầu trong đường ống tăng dần theo lực nén.],
        [Độ cao của một chiếc khinh khí cầu đang bay lên.]
    ),
    loigiai: [
        Số người là đại lượng đếm số nguyên rời rạc, mỗi khi có người đi vào hoặc ra khỏi tòa nhà sẽ làm số lượng người tăng hoặc giảm một lượng đơn vị nhảy bậc, tạo thành hàm gián đoạn. Các đại lượng nhiệt độ, áp suất, độ cao thay đổi liên tục.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một nhà sinh học theo dõi sự phát triển vùng bao phủ của một loài nấm ký sinh trên thân cây gỗ. Ban đầu diện tích vùng nấm bao phủ là $10$ $"cm"^2$. Mỗi ngày diện tích nấm phát triển tăng $20\%$ so với ngày hôm trước, đồng thời chất kháng của cây gỗ làm tiêu hủy định kỳ $5$ $"cm"^2$ nấm khô héo. Gọi $u_n$ là diện tích nấm còn lại sau $n$ ngày. Các phát biểu sau đúng hay sai?], (
        True([Diện tích nấm còn lại sau ngày thứ nhất là $7$ $"cm"^2$.]),
        True([Công thức truy hồi xác định diện tích nấm là $u_n = 1.2 u_(n-1) - 5$ với mọi $n >= 2$.]),
        True([Công thức tổng quát của diện tích nấm sau $n$ ngày là $u_n = 25 - 15 dot (1.2)^n$ với mọi $n >= 1$.]),
        [Khi số ngày kéo dài vô hạn ($n -> +oo$), loài nấm ký sinh này sẽ phát triển vô hạn và phủ kín toàn bộ thân cây gỗ.]
    ), 
    loigiai: [
        - *a)* Đúng. Diện tích sau 1 ngày: $10 dot 1.2 - 5 = 7$ $"cm"^2$.
        - *b)* Đúng. Diện tích nấm tăng $20\%$ (nhân $1.2$) rồi trừ đi $5$ $"cm"^2$ bị tiêu hủy.
        - *c)* Đúng. Kiểm tra công thức tổng quát:
          - Với $n=1$: $u_1 = 25 - 15 dot 1.2 = 7$ (Đúng).
          - Với $n=2$: $u_2 = 25 - 15 dot 1.44 = 3.4$ (Đúng, vì $u_2 = 1.2 dot 7 - 5 = 3.4$).
        - *d)* Sai. Vì công bội $1.2 > 1$ nhưng hệ số đứng trước là số âm $-15 < 0$. Do đó khi $n -> +oo$, giới hạn của $u_n$ tiến về $-oo$, tức là loài nấm ký sinh này sẽ bị thu hẹp dần diện tích và bị tiêu diệt hoàn toàn về $0$ $"cm"^2$ sau một thời gian nhất định.
    ]
)

// DS 2
#ds([Chi phí trung bình để sản xuất $x$ sản phẩm của một xưởng cơ khí được cho bởi công thức: $C(x) = (15x + 30)/(x + 1)$ (triệu đồng/sản phẩm) với sản lượng $x > 0$. Các phát biểu sau đúng hay sai?], (
        True([Chi phí trung bình để sản xuất $1$ sản phẩm đầu tiên là $22.5$ triệu đồng.]),
        True([Khi quy mô sản xuất tăng lên vô hạn ($x -> +oo$), chi phí trung bình tiến sát về giới hạn tối ưu là $15$ triệu đồng/sản phẩm.]),
        True([Chi phí trung bình giảm dần khi sản lượng sản xuất $x$ tăng lên thể hiện lợi thế quy mô sản xuất.]),
        True([Giới hạn của chi phí trung bình khi sản lượng tiến sát về mốc bắt đầu $0$ sản phẩm ($x -> 0^+$) là $30$ triệu đồng/sản phẩm.])
    ), 
    loigiai: [
        - *a)* Đúng. $C(1) = (15 dot 1 + 30)/(1 + 1) = (45)/(2) = 22.5$ triệu đồng.
        - *b)* Đúng. $limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) (15 + (30)/(x))/(1 + (1)/(x)) = 15$ triệu đồng.
        - *c)* Đúng. Đạo hàm $C'(x) = - (15)/((x+1)^2) < 0$ với mọi $x > 0$ nên chi phí trung bình giảm dần khi sản lượng tăng.
        - *d)* Đúng. $limits(lim)_(x -> 0^+) C(x) = (30)/(1) = 30$ triệu đồng.
    ]
)

// DS 3
#ds([Một đoạn đê biển chắn sóng được kỹ sư thiết kế mặt cắt đứng là đường biên cao độ mô tả bởi hàm số:
    $f(x) = cases((x^2 - a x - 10)/(x - 5) "khi" 0 <= x < 5, b x - 4 "khi" x >= 5)$.
    Các phát biểu sau đúng hay sai?], (
        True([Để mặt đê trơn tru liên tục tại điểm nối $x = 5$, tử số của phân thức ở nhánh đầu phải có nghiệm $x = 5$, từ đó suy ra tham số $a = 3$.]),
        True([Khi $a = 3$, giới hạn bên trái tại điểm nối $limits(lim)_(x -> 5^-) f(x)$ bằng $7$ m.]),
        True([Với $a = 3$, giá trị của tham số $b$ để bề mặt đê liên tục tại điểm nối $x = 5$ là $b = 2.2$.]),
        True([Nếu đúc đê với tham số sai lệch $a = 3, b = 2$ thì bề mặt đê biển sẽ bị đứt gãy một bậc dốc cao đúng $1$ m.])
    ), 
    loigiai: [
        - *a)* Đúng. Tử số nhận $x = 5$ làm nghiệm: $5^2 - 5a - 10 = 0 => 15 - 5a = 0 => a = 3$.
        - *b)* Đúng. Khi $a = 3$:
          $ limits(lim)_(x -> 5^-) f(x) = limits(lim)_(x -> 5^-) (x^2 - 3x - 10)/(x - 5) = limits(lim)_(x -> 5^-) ((x - 5)(x + 2))/(x - 5) = limits(lim)_(x -> 5^-) (x + 2) = 7 $ m.
        - *c)* Đúng. Cần giới hạn phải bằng giới hạn trái: $b dot 5 - 4 = 7 => 5b = 11 => b = 2.2$.
        - *d)* Đúng. Khi $b = 2$, giới hạn phải là $2 dot 5 - 4 = 6$ m.
          Giới hạn trái bằng $7$ m.
          Độ lệch bậc đứt gãy bằng $|7 - 6| = 1$ m.
    ]
)

// DS 4
#ds([Một con lắc lò xo đặt trên mặt phẳng nghiêng dao động tắt dần liên tục. Khoảng cách di chuyển của con lắc ở chu kỳ đầu là $60$ cm. Kể từ chu kỳ thứ hai, khoảng cách di chuyển giảm $20\%$ so với chu kỳ liền trước đó. Các phát biểu sau đúng hay sai?], (
        True([Khoảng cách di chuyển của con lắc ở chu kỳ thứ hai là $48$ cm.]),
        True([Tổng quãng đường di chuyển được sau vô hạn chu kỳ là tổng của một cấp số nhân lùi vô hạn có công bội $q = 0.8$.]),
        True([Tổng quãng đường tối đa con lắc di chuyển được cho đến khi dừng lại hẳn tiến về giới hạn là $300$ cm.]),
        True([Nếu dùng chất bôi trơn làm giảm ma sát giúp công bội $q$ tăng lên thành $0.9$ thì tổng quãng đường di chuyển tối đa trước khi dừng hẳn sẽ là $600$ cm.])
    ), 
    loigiai: [
        - *a)* Đúng. Khoảng cách chu kỳ hai: $60 dot (1 - 0.2) = 48$ cm.
        - *b)* Đúng. Lượng giảm $20\%$ tương ứng công bội $q = 0.8$ có $|q| < 1$.
        - *c)* Đúng. Tổng quãng đường tối đa:
          $ S = (u_1)/(1 - q) = (60)/(1 - 0.8) = 300 $ cm.
        - *d)* Đúng. Khi $q = 0.9$:
          $ S_("mới") = (60)/(1 - 0.9) = 600 $ cm.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một người thả một quả bóng từ độ cao $16$ m. Mỗi lần chạm đất, quả bóng nảy ngược lên đạt độ cao bằng $(1)/(3)$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường quả bóng di chuyển được (bao gồm cả quãng đường rơi xuống và nảy lên) cho đến khi nó hoàn toàn dừng lại (tính bằng mét).],
    [32],
    loigiai: [
        Quãng đường di chuyển của quả bóng bao gồm:
        - Lần rơi đầu tiên: $16$ m.
        - Các lần nảy lên và rơi xuống tiếp theo tạo thành các cặp quãng đường bằng nhau:
          $ S_1 = 2 dot [16 dot (1)/(3)] = (32)/(3) $ m.
          $ S_2 = 2 dot [16 dot ((1)/(3))^2] $ m.
          ...
        Tổng quãng đường bóng di chuyển là:
        $ S = 16 + 2 dot [ 16 dot ((1)/(3)) + 16 dot ((1)/(3))^2 + 16 dot ((1)/(3))^3 + ... ] $
        Biểu thức trong ngoặc vuông là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = (16)/(3)$ và công bội $q = (1)/(3)$.
        $ S_("trong ngoặc") = (u_1)/(1 - q) = ((16)/(3))/(1 - (1)/(3)) = 8 $.
        Vậy tổng quãng đường bóng di chuyển là:
        $ S = 16 + 2 dot 8 = 32 $ m.
    ]
)

// TL 2
#tln([Biết giới hạn $limits(lim)_(x -> 5) (a sqrt(x - 1) + b)/(x - 5) = 1$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
    [80],
    loigiai: [
        Mẫu số tiến về $0$ khi $x -> 5$, để giới hạn hữu hạn thì tử số phải nhận $x = 5$ làm nghiệm:
        $ a sqrt(5 - 1) + b = 0 => 2a + b = 0 => b = -2a $.
        Thế vào giới hạn ta được:
        $ limits(lim)_(x -> 5) (a sqrt(x - 1) - 2a)/(x - 5) = limits(lim)_(x -> 5) ( a(sqrt(x - 1) - 2) )/(x - 5) $
        $ = limits(lim)_(x -> 5) ( a(x - 1 - 4) )/( (x - 5)(sqrt(x - 1) + 2) ) = limits(lim)_(x -> 5) (a)/(sqrt(x - 1) + 2) = (a)/(4) $.
        Theo giả thiết:
        $ (a)/(4) = 1 => a = 4 $.
        Suy ra $b = -2 dot 4 = -8$.
        Vậy $P = a^2 + b^2 = 4^2 + (-8)^2 = 16 + 64 = 80$.
    ]
)

// TL 3
#tln([Cho hàm số $y = f(x)$ liên tục tại mọi điểm và thỏa mãn giới hạn $limits(lim)_(x -> 4) (f(x) - 10)/(x - 4) = 9$. Tính giá trị của biểu thức $8K$ biết $K = limits(lim)_(x -> 4) (f^2(x) - 100)/(x^2 - 16)$.],
    [180],
    loigiai: [
        Từ giới hạn ban đầu, vì mẫu số tiến về $0$ khi $x -> 4$ nên tử số phải tiến về $0$, tức là $limits(lim)_(x -> 4) f(x) = 10$.
        Ta phân tích tử số của $K$:
        $ f^2(x) - 100 = (f(x) - 10)(f(x) + 10) $.
        Ta biến đổi giới hạn $K$:
        $ K = limits(lim)_(x -> 4) ( (f(x) - 10)(f(x) + 10) ) / ( (x - 4)(x + 4) ) $
        $ K = limits(lim)_(x -> 4) [ (f(x) - 10)/(x - 4) ] dot limits(lim)_(x -> 4) [ (f(x) + 10)/(x + 4) ] $
        $ K = 9 dot (10 + 10)/(4 + 4) = 9 dot (20)/(8) = (45)/(2) $.
        Suy ra $8K = 8 dot (45)/(2) = 180$.
    ]
)

// TL 4
#tln([Một nhà máy lọc dầu đo lường tổng sản lượng dầu tinh chế được (tính bằng triệu thùng) sau $t$ tháng vận hành ổn định là $V(t) = (50t^2 - 3t + 2)/(t^2 + 4)$. Tính giới hạn lượng dầu tinh chế tối đa của nhà máy khi thời gian vận hành kéo dài vô hạn ($t -> +oo$).],
    [50],
    loigiai: [
        Ta tính giới hạn của sản lượng dầu khi thời gian kéo dài vô hạn:
        $ limits(lim)_(t -> +oo) V(t) = limits(lim)_(t -> +oo) (50t^2 - 3t + 2)/(t^2 + 4) = limits(lim)_(t -> +oo) (50 - (3)/(t) + (2)/(t^2))/(1 + (4)/(t^2)) = 50 $ triệu thùng.
    ]
)

// TL 5
#tln([Tìm giá trị dương của tham số $m$ để hàm số $f(x) = cases((x^2 - 5x + 4)/(x - 4) "khi" x < 4, m^2 x - 13 "khi" x >= 4)$ liên tục tại điểm $x = 4$.],
    [2],
    loigiai: [
        Để hàm số liên tục tại điểm $x = 4$, ta cần $limits(lim)_(x -> 4^-) f(x) = limits(lim)_(x -> 4^+) f(x) = f(4)$.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(x -> 4^-) f(x) = limits(lim)_(x -> 4^-) (x^2 - 5x + 4)/(x - 4) = limits(lim)_(x -> 4^-) ((x - 4)(x - 1))/(x - 4) = limits(lim)_(x -> 4^-) (x - 1) = 3 $.
        - Giới hạn phải và giá trị hàm số:
          $ f(4) = limits(lim)_(x -> 4^+) f(x) = m^2 dot 4 - 13 = 4m^2 - 13 $.
        Do đó:
        $ 4m^2 - 13 = 3 => 4m^2 = 16 => m^2 = 4 $.
        Vì $m$ nhận giá trị dương nên $m = 2$.
    ]
)

// TL 6
#tln([Một ống xả khí của nhà máy hóa chất được đúc liền khớp từ hai đoạn nghiêng và thẳng. Chiều cao của tâm ống khí $y(t)$ (mét) theo chiều dài ngang $t$ (mét) được mô tả bởi hàm số liên tục:
    $y(t) = cases((t^2 - 3t - 4)/(t - 4) + 10 "khi" 0 <= t < 4, a t + 7 "khi" t >= 4)$.
    Tìm giá trị của tham số $a$ để đoạn nối tâm ống dẫn khí liên tục hoàn hảo, không bị đứt đoạn tại điểm khớp nối $t = 4$ m.],
    [2],
    loigiai: [
        Vì tâm ống dẫn khí liên tục khớp nối nên hàm số chiều cao $y(t)$ phải liên tục tại điểm kết nối $t = 4$ m.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(t -> 4^-) y(t) = limits(lim)_(t -> 4^-) [ (t^2 - 3t - 4)/(t - 4) + 10 ] = limits(lim)_(t -> 4^-) [ ((t - 4)(t + 1))/(t - 4) + 10 ] $
          $ = limits(lim)_(t -> 4^-) (t + 1 + 10) = 4 + 1 + 10 = 15 $ m.
        - Giới hạn phải và giá trị hàm số:
          $ y(4) = limits(lim)_(t -> 4^+) y(t) = a dot 4 + 7 = 4a + 7 $.
        Để hàm số liên tục tại $t = 4$ ta cần:
        $ 4a + 7 = 15 => 4a = 8 => a = 2 $.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
