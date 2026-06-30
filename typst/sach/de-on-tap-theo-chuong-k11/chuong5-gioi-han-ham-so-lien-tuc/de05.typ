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
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 05)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một lượng chất hữu cơ độc hại thẩm thấu vào mạch nước ngầm của một khu dân cư. Mỗi tháng, do quá trình tự lọc tự nhiên và lưu chuyển nước, lượng chất độc giảm đi $40\%$ so với tháng trước, đồng thời có thêm $1.2$ kg chất độc mới thẩm thấu vào từ bề mặt đất. Gọi $u_n$ là lượng chất độc còn lại trong nước sau $n$ tháng. Tính lượng chất độc ổn định lâu dài trong mạch nước ngầm này khi thời gian kéo dài vô hạn ($n -> +oo$).],
    (
        [$1.2$ kg.],
        [$2.0$ kg.],
        True([$3.0$ kg.]),
        [$4.5$ kg.]
    ),
    loigiai: [
        Gọi $L = limits(lim)_(n -> +oo) u_n$ là lượng chất độc ổn định lâu dài trong nước. Ta lập được phương trình giới hạn từ công thức truy hồi $u_(n+1) = 0.6 u_n + 1.2$ (do lượng chất độc giảm $40\%$ tức là còn lại $60\% = 0.6$):
        $ L = 0.6 L + 1.2 $
        $ => 0.4 L = 1.2 => L = 3 $ kg.
    ]
)

// TN 2
#tn([Một quả bóng cao su được thả rơi tự do từ độ cao $20$ m. Mỗi lần chạm đất, quả bóng nảy ngược lên độ cao bằng $(1)/(2)$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường quả bóng di chuyển (bao gồm cả quãng đường rơi xuống và nảy lên) cho đến khi nó hoàn toàn dừng lại (tính bằng mét).],
    (
        [$40$ m.],
        True([$60$ m.]),
        [$80$ m.],
        [$100$ m.]
    ),
    loigiai: [
        Quãng đường di chuyển của quả bóng bao gồm:
        - Lần rơi đầu tiên: $20$ m.
        - Các lần nảy lên và rơi xuống tiếp theo tạo thành các cặp quãng đường bằng nhau:
          $ S_1 = 2 dot [20 dot (1)/(2)] = 20 $ m.
          $ S_2 = 2 dot [20 dot ((1)/(2))^2] = 10 $ m.
          ...
        Tổng quãng đường bóng di chuyển là:
        $ S = 20 + 2 dot [ 20 dot ((1)/(2)) + 20 dot ((1)/(2))^2 + 20 dot ((1)/(2))^3 + ... ] $
        Biểu thức trong ngoặc vuông là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 10$ và công bội $q = (1)/(2)$.
        $ S_("trong ngoặc") = (u_1)/(1 - q) = (10)/(1 - (1)/(2)) = 20 $.
        Vậy tổng quãng đường bóng di chuyển là:
        $ S = 20 + 2 dot 20 = 60 $ m.
    ]
)

// TN 3
#tn([Cho một tấm bìa hình chữ nhật $A B C D$ có diện tích bằng $36$. Ta thực hiện chia đôi tấm bìa này theo chiều dọc để được hai phần hình chữ nhật bằng nhau rồi cắt bỏ một nửa đi. Đối với nửa còn giữ lại, ta tiếp tục chia đôi theo chiều ngang và cắt bỏ một nửa đi. Quá trình chia đôi xen kẽ dọc - ngang và cắt bỏ này được lặp lại vô hạn lần. Tính tổng diện tích của tất cả các phần bìa bị cắt bỏ sau quá trình vô hạn trên.],
    (
        [$18$],
        [$27$],
        True([$36$]),
        [$72$]
    ),
    loigiai: [
        Diện tích bị cắt bỏ ở lần thứ nhất là: $u_1 = 36 dot (1)/(2) = 18$.
        Diện tích bị cắt bỏ ở lần tiếp theo luôn bằng $(1)/(2)$ diện tích bị cắt bỏ ở lần trước đó.
        Tổng diện tích bị cắt bỏ là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 18$ và công bội $q = (1)/(2)$.
        $ S = (u_1)/(1 - q) = (18)/(1 - (1)/(2)) = 36 $.
        (Như vậy, toàn bộ diện tích tấm bìa ban đầu sẽ bị cắt bỏ sạch khi quá trình kéo dài vô hạn).
    ]
)

// TN 4
#tn([Cho giới hạn $limits(lim)_(x -> 2) (x^2 + a x + b)/(x - 2) = 5$ với $a, b in RR$. Tính giá trị của biểu thức $K = a + 2b$.],
    (
        [$K = 5$],
        [$K = -5$],
        [$K = 11$],
        True([$K = -11$])
    ),
    loigiai: [
        Mẫu số tiến về $0$ khi $x -> 2$. Để giới hạn tồn tại hữu hạn, tử số phải nhận $x = 2$ làm nghiệm:
        $ 2^2 + 2a + b = 0 => b = -2a - 4 $.
        Thế vào biểu thức giới hạn ta được:
        $ limits(lim)_(x -> 2) (x^2 + a x - 2a - 4)/(x - 2) = limits(lim)_(x -> 2) ((x - 2)(x + a + 2))/(x - 2) = limits(lim)_(x -> 2) (x + a + 2) = a + 4 $.
        Theo giả thiết:
        $ a + 4 = 5 => a = 1 $.
        Suy ra $b = -2 dot 1 - 4 = -6$.
        Vậy $K = a + 2b = 1 + 2 dot (-6) = -11$.
    ]
)

// TN 5
#tn([Tổng chi phí để sản xuất $x$ sản phẩm của một xí nghiệp được cho bởi công thức $C(x) = 3x^2 + 20x + 300$ (nghìn đồng). Hàm chi phí trung bình trên mỗi sản phẩm là $A(x) = (C(x))/(x)$. Khảo sát giới hạn của chi phí trung bình khi sản lượng sản xuất $x -> +oo$.],
    (
        [$3$ nghìn đồng.],
        [$20$ nghìn đồng.],
        [$300$ nghìn đồng.],
        True([Tiến về $+oo$ (tăng lên vô hạn).])
    ),
    loigiai: [
        Ta có hàm chi phí trung bình:
        $ A(x) = (3x^2 + 20x + 300)/(x) = 3x + 20 + (300)/(x) $.
        Khi $x -> +oo$, ta tính giới hạn:
        $ limits(lim)_(x -> +oo) A(x) = limits(lim)_(x -> +oo) (3x + 20 + (300)/(x)) = +oo $.
        (Điều này thể hiện khi sản lượng sản xuất quá lớn vượt công suất của dây chuyền, chi phí trung bình sẽ tăng vọt do quá tải).
    ]
)

// TN 6
#tn([Cường độ ánh sáng của một nguồn sáng truyền đi trong sương mù dày đặc giảm dần theo khoảng cách $d$ (mét) bởi công thức $I(d) = I_0 dot (d^2 - 9)/(d^2 - 3d)$ khi $d > 3$ mét. Tính giới hạn tỉ số cường độ ánh sáng $(I(d))/(I_0)$ khi khoảng cách $d$ tiến dần về sát ngày bắt đầu $3$ mét ($d -> 3^+$).],
    (
        [$1$],
        True([$2$]),
        [$3$],
        [$6$]
    ),
    loigiai: [
        Ta tính giới hạn của tỉ số $(I(d))/(I_0)$ khi $d -> 3^+$:
        $ limits(lim)_(d -> 3^+) (d^2 - 9)/(d^2 - 3d) = limits(lim)_(d -> 3^+) ((d - 3)(d + 3))/(d(d - 3)) = limits(lim)_(d -> 3^+) (d + 3)/(d) = (3 + 3)/(3) = 2 $.
    ]
)

// TN 7
#tn([Một tụ điện thông minh tự xả năng lượng theo thời gian $t$ (giây). Hiệu điện thế của tụ điện được xác định bởi công thức $V(t) = 12 dot e^(-0.05 t)$ (vôn). Tính giới hạn hiệu điện thế của tụ điện này khi thời gian xả kéo dài vô hạn ($t -> +oo$).],
    (
        [$12$ vôn.],
        [$6$ vôn.],
        True([$0$ vôn.]),
        [$+oo$ vôn.]
    ),
    loigiai: [
        Ta tính giới hạn của $V(t)$ khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) V(t) = limits(lim)_(t -> +oo) (12)/(e^(0.05 t)) $.
        Vì $e^(0.05 t) -> +oo$ khi $t -> +oo$, nên giới hạn bằng $0$ vôn.
    ]
)

// TN 8
#tn([Cho hàm số $f(x)$ thỏa mãn giới hạn $limits(lim)_(x -> 3) (f(x) - 4)/(x - 3) = 6$. Tính giới hạn $L = limits(lim)_(x -> 3) (f^2(x) - 16)/(x^2 - 9)$.],
    (
        [$L = 6$],
        True([$L = 8$]),
        [$L = 12$],
        [$L = 16$]
    ),
    loigiai: [
        Vì giới hạn hữu hạn nên ta có $limits(lim)_(x -> 3) f(x) = 4$.
        Ta biến đổi giới hạn $L$:
        $ L = limits(lim)_(x -> 3) ( (f(x) - 4)(f(x) + 4) ) / ( (x - 3)(x + 3) ) = limits(lim)_(x -> 3) [ (f(x) - 4)/(x - 3) ] dot limits(lim)_(x -> 3) [ (f(x) + 4)/(x + 3) ] $
        $ L = 6 dot (4 + 4)/(3 + 3) = 6 dot (8)/(6) = 8 $.
    ]
)

// TN 9
#tn([Hiệu điện thế đầu ra của một bộ ổn áp biến thiên theo thời gian $t$ (giây) bởi hàm số $U(t) = cases(t^2 - t + 3 "khi" 0 <= t < 3, m t - 6 "khi" t >= 3)$ (vôn). Tìm giá trị của $m$ để hiệu điện thế biến thiên liên tục tại thời điểm giao mạch $t = 3$.],
    (
        [$m = 3$],
        [$m = 4$],
        True([$m = 5$]),
        [$m = 6$]
    ),
    loigiai: [
        Để hiệu điện thế liên tục tại $t = 3$, ta cần $limits(lim)_(t -> 3^-) U(t) = limits(lim)_(t -> 3^+) U(t) = U(3)$.
        Ta có:
        - $limits(lim)_(t -> 3^-) U(t) = limits(lim)_(t -> 3^-) (t^2 - t + 3) = 3^2 - 3 + 3 = 9$ vôn.
        - $U(3) = limits(lim)_(t -> 3^+) U(t) = m dot 3 - 6 = 3m - 6$.
        Suy ra:
        $ 3m - 6 = 9 => 3m = 15 => m = 5 $.
    ]
)

// TN 10
#tn([Nhịp tim của một vận động viên điền kinh được theo dõi trong quá trình chạy bền. Khi vận động viên tăng tốc đột ngột tại phút thứ $10$, nhịp tim nhảy vọt tức thì từ $120$ nhịp/phút lên $160$ nhịp/phút. Biểu diễn nhịp tim theo thời gian là một hàm số mang tính chất nào sau đây?],
    (
        [Hàm số liên tục tại điểm $t = 10$.],
        True([Hàm số gián đoạn tại điểm $t = 10$.]),
        [Hàm số không có giới hạn trái tại $t = 10$.],
        [Hàm số là hàm hằng trên đoạn $[0; 20]$.])
    ,
    loigiai: [
        Do nhịp tim nhảy vọt đột ngột có bước nhảy (từ $120$ lên $160$), giới hạn trái và phải khác nhau, nên hàm số biểu diễn nhịp tim bị gián đoạn tại thời điểm $t = 10$ phút.
    ]
)

// TN 11
#tn([Nhiệt độ của một lò nung công nghiệp là một hàm số liên tục theo thời gian $t$ (giờ). Biết nhiệt độ ban đầu là $30 ""^o C$ và sau $2$ giờ nung nhiệt độ đạt $1200 ""^o C$. Theo định lý giá trị trung gian, khẳng định nào dưới đây chắc chắn đúng?],
    (
        [Trong 2 giờ đó lò luôn tăng nhiệt độ liên tục không giảm.],
        True([Trong 2 giờ đó, có ít nhất một thời điểm nhiệt độ lò đạt đúng $800 ""^o C$.]),
        [Lò đạt nhiệt độ $800 ""^o C$ tại thời điểm chính xác $t = 1.33$ giờ.],
        [Nhiệt độ lò không thể vượt quá $1200 ""^o C$.]
    ),
    loigiai: [
        Vì nhiệt độ là hàm số liên tục trên đoạn $[0; 2]$ và $30 < 800 < 1200$, theo định lý giá trị trung gian luôn tồn tại ít nhất một thời điểm $t_0 in (0; 2)$ để nhiệt độ lò đạt đúng $800 ""^o C$.
    ]
)

// TN 12
#tn([Hiện tượng nào sau đây được mô tả bằng một hàm số gián đoạn (có bước nhảy đột ngột) trong thực tế đời sống?],
    (
        True([Số tiền thuế thu nhập cá nhân tính theo các bậc thu nhập lũy tiến.]),
        [Quãng đường một chiếc xe ô tô di chuyển được theo thời gian.],
        [Nhiệt độ của một cốc nước nóng nguội dần theo thời gian.],
        [Chiều dài một sợi dây thun khi bị kéo giãn từ từ.]
    ),
    loigiai: [
        Tiền thuế thu nhập cá nhân tính theo bậc lũy tiến có các mốc thuế suất nhảy vọt đột ngột khi thu nhập vượt ngưỡng bậc thuế mới, do đó được mô tả bằng hàm số bậc thang (gián đoạn). Các đại lượng vật lý như quãng đường, nhiệt độ, chiều dài dây thun đều thay đổi liên tục.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một doanh nghiệp đầu tư mua một hệ thống máy móc sản xuất trị giá $800$ triệu đồng. Mỗi năm, do hao mòn tự nhiên, máy móc bị khấu hao làm giảm giá trị đi $15\%$ so với năm trước đó. Các phát biểu sau đúng hay sai?], (
        True([Giá trị còn lại của máy móc sản xuất sau năm thứ nhất sử dụng là $680$ triệu đồng.]),
        True([Dãy số giá trị còn lại của máy móc sau $n$ năm lập thành một cấp số nhân có công bội $q = 0.85$.]),
        True([Giới hạn giá trị còn lại của hệ thống máy móc khi thời gian sử dụng kéo dài vô hạn ($n -> +oo$) bằng $0$ triệu đồng.]),
        True([Tổng giá trị khấu hao lũy kế của máy móc sau vô hạn năm sử dụng tiến về tối đa là $800$ triệu đồng.])
    ), 
    loigiai: [
        - *a)* Đúng. Giá trị sau 1 năm: $800 dot (1 - 0.15) = 800 dot 0.85 = 680$ triệu đồng.
        - *b)* Đúng. Công bội của cấp số nhân là $q = 1 - 0.15 = 0.85$.
        - *c)* Đúng. Vì $|0.85| < 1$, nên giới hạn giá trị máy móc bằng $limits(lim)_(n -> +oo) [800 dot (0.85)^n] = 0$.
        - *d)* Đúng. Vì giá trị máy móc giảm dần về $0$ nên tổng lượng khấu hao lũy kế sau vô hạn năm chính bằng giá trị ban đầu là $800$ triệu đồng.
    ]
)

// DS 2
#ds([Nồng độ của một loại kháng sinh $A(t)$ (mg/l) trong máu của một con bệnh sau $t$ giờ dùng thuốc được cho bởi công thức: $A(t) = (20t)/(t^2 + 9)$ với $t >= 0$. Các phát biểu sau đúng hay sai?], (
        True([Nồng độ kháng sinh trong máu tại thời điểm ngay khi uống thuốc ($t = 0$) là $0$ mg/l.]),
        [Giới hạn nồng độ kháng sinh trong máu khi thời gian kéo dài vô hạn ($t -> +oo$) là $20$ mg/l.],
        True([Nồng độ kháng sinh đạt giá trị lớn nhất trong máu tại thời điểm $3$ giờ sau khi uống thuốc.]),
        True([Việc nồng độ kháng sinh giảm dần tiến sát về $0$ khi $t -> +oo$ mô tả quá trình đào thải và chuyển hóa của cơ thể sinh học.])
    ), 
    loigiai: [
        - *a)* Đúng. $A(0) = (20 dot 0)/(0^2 + 9) = 0$.
        - *b)* Sai. Giới hạn khi $t -> +oo$:
          $ limits(lim)_(t -> +oo) A(t) = limits(lim)_(t -> +oo) ((20)/(t))/(1 + (9)/(t^2)) = 0 $ mg/l (chứ không phải $20$).
        - *c)* Đúng. Áp dụng bất đẳng thức Cauchy dưới mẫu: $t^2 + 9 >= 2 sqrt(t^2 dot 9) = 6t$.
          Do đó $A(t) <= (20t)/(6t) = (10)/(3) approx 3.33$ mg/l. Dấu "=" xảy ra khi $t^2 = 9 => t = 3$ giờ.
        - *d)* Đúng. Giới hạn bằng $0$ biểu diễn thuốc biến mất khỏi máu do cơ thể tự đào thải sạch qua thận, gan.
    ]
)

// DS 3
#ds([Một đường trượt tuyết dốc nhân tạo được thiết kế gồm hai phần dốc và phẳng nối tiếp nhau. Độ cao của đường trượt $h(x)$ (mét) theo khoảng cách ngang $x$ (mét) được mô tả bởi hàm số:
    $h(x) = cases((x^2 - a x - 8)/(x - 4) "khi" 0 <= x < 4, b x - 5 "khi" x >= 4)$.
    Các phát biểu sau đúng hay sai?], (
        True([Để đường trượt trơn tru liên tục tại điểm nối kết $x = 4$, tử số của phân thức ở nhánh đầu phải có nghiệm $x = 4$, từ đó tính được tham số thiết kế $a = 2$.]),
        True([Khi $a = 2$, giới hạn bên trái tại điểm nối $limits(lim)_(x -> 4^-) h(x)$ bằng $6$ m.]),
        True([Với $a = 2$, giá trị của tham số $b$ để đường trượt liên tục tại điểm nối $x = 4$ là $b = 2.75$.]),
        True([Nếu lắp đặt đường trượt sai lệch thông số với $a = 2$ và $b = 3$, tại điểm nối $x = 4$ sẽ xuất hiện một bậc hụt nhảy cao đúng $1$ m.])
    ), 
    loigiai: [
        - *a)* Đúng. Tử số phải nhận $x = 4$ làm nghiệm: $4^2 - 4a - 8 = 0 => 8 - 4a = 0 => a = 2$.
        - *b)* Đúng. Khi $a = 2$:
          $ limits(lim)_(x -> 4^-) h(x) = limits(lim)_(x -> 4^-) (x^2 - 2x - 8)/(x - 4) = limits(lim)_(x -> 4^-) ((x - 4)(x + 2))/(x - 4) = limits(lim)_(x -> 4^-) (x + 2) = 6 $ m.
        - *c)* Đúng. Ta cần giới hạn phải bằng giới hạn trái: $b dot 4 - 5 = 6 => 4b = 11 => b = 2.75$.
        - *d)* Đúng. Khi $b = 3$, giới hạn phải là $3 dot 4 - 5 = 7$ m.
          Giới hạn trái bằng $6$ m.
          Bậc hụt có độ cao là $|7 - 6| = 1$ m.
    ]
)

// DS 4
#ds([Một ngân hàng trung ương bơm vào nền kinh tế một lượng tiền ban đầu là $100$ triệu USD. Giả sử tỷ lệ dự trữ bắt buộc của hệ thống ngân hàng là $10\%$, nghĩa là mỗi ngân hàng thương mại nhận được tiền gửi sẽ giữ lại $10\%$ làm dự trữ bắt buộc và đem cho vay ra nền kinh tế $90\%$ số tiền còn lại. Quá trình gửi và cho vay lặp lại vô hạn vòng. Các phát biểu sau đúng hay sai?], (
        True([Lượng tiền được quay vòng cho vay ra ở vòng thứ hai là $90$ triệu USD.]),
        True([Tổng lượng cung tiền được tạo ra trong nền kinh tế sau vô hạn vòng gửi và cho vay là tổng của một cấp số nhân lùi vô hạn có công bội $q = 0.9$.]),
        True([Tổng lượng cung tiền tối đa được tạo ra trong nền kinh tế từ khoản tiền gửi $100$ triệu USD ban đầu tiến về giới hạn là $1000$ triệu USD.]),
        True([Nếu ngân hàng trung ương tăng tỷ lệ dự trữ bắt buộc lên $20\%$, tổng lượng cung tiền tối đa được tạo ra sẽ giảm đi một nửa so với khi tỷ lệ dự trữ bắt buộc là $10\%$.])
    ), 
    loigiai: [
        - *a)* Đúng. Lượng tiền vay vòng hai: $100 dot 0.9 = 90$ triệu USD.
        - *b)* Đúng. Tỉ lệ cho vay ra là $90\%$, tạo thành dãy số nhân có công bội $q = 0.9$ có $|q| < 1$.
        - *c)* Đúng. Tổng cung tiền tạo ra là:
          $ S = (u_1)/(1 - q) = (100)/(1 - 0.9) = 1000 $ triệu USD.
        - *d)* Đúng. Khi tỷ lệ dự trữ là $20\%$, công bội $q = 1 - 20\% = 0.8$.
          Tổng cung tiền mới:
          $ S_("mới") = (100)/(1 - 0.8) = 500 $ triệu USD.
          So với $1000$ triệu USD ban đầu thì lượng cung tiền giảm đi đúng một nửa.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một quả bóng được thả rơi tự do từ độ cao $12$ m. Mỗi lần chạm đất, quả bóng nảy ngược lên độ cao bằng $(1)/(3)$ độ cao của lần rơi ngay trước đó. Tính tổng quãng đường quả bóng di chuyển được (bao gồm cả quãng đường rơi xuống và nảy lên) cho đến khi nó hoàn toàn dừng lại (tính bằng mét).],
    [24],
    loigiai: [
        Quãng đường di chuyển của quả bóng bao gồm:
        - Lần rơi đầu tiên: $12$ m.
        - Các lần nảy lên và rơi xuống tiếp theo tạo thành các cặp quãng đường bằng nhau:
          $ S_1 = 2 dot [12 dot (1)/(3)] = 8 $ m.
          $ S_2 = 2 dot [12 dot ((1)/(3))^2] $ m.
          ...
        Tổng quãng đường bóng di chuyển là:
        $ S = 12 + 2 dot [ 12 dot ((1)/(3)) + 12 dot ((1)/(3))^2 + 12 dot ((1)/(3))^3 + ... ] $
        Biểu thức trong ngoặc vuông là tổng của cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 4$ và công bội $q = (1)/(3)$.
        $ S_("trong ngoặc") = (u_1)/(1 - q) = (4)/(1 - (1)/(3)) = 6 $.
        Vậy tổng quãng đường bóng di chuyển là:
        $ S = 12 + 2 dot 6 = 24 $ m.
    ]
)

// TL 2
#tln([Biết giới hạn $limits(lim)_(x -> 4) (a sqrt(x) + b)/(x - 4) = 1$ với $a, b in RR$. Tính giá trị của biểu thức $P = a^2 + b^2$.],
    [80],
    loigiai: [
        Mẫu số bằng $0$ khi $x -> 4$, để giới hạn hữu hạn thì tử số phải nhận $x = 4$ làm nghiệm:
        $ a sqrt(4) + b = 0 => 2a + b = 0 => b = -2a $.
        Thế vào giới hạn ta được:
        $ limits(lim)_(x -> 4) (a sqrt(x) - 2a)/(x - 4) = limits(lim)_(x -> 4) ( a(sqrt(x) - 2) )/(x - 4) $
        $ = limits(lim)_(x -> 4) ( a(sqrt(x) - 2) )/( (sqrt(x) - 2)(sqrt(x) + 2) ) = limits(lim)_(x -> 4) (a)/(sqrt(x) + 2) = (a)/(4) $.
        Theo giả thiết:
        $ (a)/(4) = 1 => a = 4 $.
        Suy ra $b = -2 dot 4 = -8$.
        Vậy $P = a^2 + b^2 = 4^2 + (-8)^2 = 16 + 64 = 80$.
    ]
)

// TL 3
#tln([Cho hàm số $y = f(x)$ liên tục tại mọi điểm và thỏa mãn giới hạn $limits(lim)_(x -> 3) (f(x) - 8)/(x - 3) = 7$. Tính giá trị của biểu thức $3I$ biết $I = limits(lim)_(x -> 3) (f^2(x) - 64)/(x^2 - 9)$.],
    [56],
    loigiai: [
        Từ giới hạn ban đầu, mẫu số tiến về $0$ khi $x -> 3$ nên tử số phải tiến về $0$, tức là $limits(lim)_(x -> 3) f(x) = 8$.
        Ta phân tích tử số của $I$:
        $ f^2(x) - 64 = (f(x) - 8)(f(x) + 8) $.
        Ta biến đổi giới hạn $I$:
        $ I = limits(lim)_(x -> 3) ( (f(x) - 8)(f(x) + 8) ) / ( (x - 3)(x + 3) ) $
        $ I = limits(lim)_(x -> 3) [ (f(x) - 8)/(x - 3) ] dot limits(lim)_(x -> 3) [ (f(x) + 8)/(x + 3) ] $
        $ I = 7 dot (8 + 8)/(3 + 3) = 7 dot (16)/(6) = (56)/(3) $.
        Suy ra $3I = 56$.
    ]
)

// TL 4
#tln([Một chiến dịch truyền thông tiếp thị trực tuyến đo lường số lượt khách hàng tiếp cận được (tính bằng triệu lượt) sau $t$ tuần triển khai bởi công thức $A(t) = (24t^2 - t + 3)/(t^2 + 1)$. Tính giới hạn số lượt khách hàng tiếp cận tối đa mà chiến dịch đạt được khi kéo dài thời gian vô hạn ($t -> +oo$).],
    [24],
    loigiai: [
        Ta tính giới hạn của số lượt tiếp cận khi thời gian kéo dài vô hạn:
        $ limits(lim)_(t -> +oo) A(t) = limits(lim)_(t -> +oo) (24t^2 - t + 3)/(t^2 + 1) = limits(lim)_(t -> +oo) (24 - (1)/(t) + (3)/(t^2))/(1 + (2)/(t^2)) = 24 $ triệu lượt.
    ]
)

// TL 5
#tln([Tìm giá trị dương của tham số $m$ để hàm số $f(x) = cases((x^2 - 4x + 3)/(x - 3) "khi" x < 3, m^2 x - 10 "khi" x >= 3)$ liên tục tại điểm $x = 3$.],
    [2],
    loigiai: [
        Để hàm số liên tục tại điểm $x = 3$, ta cần $limits(lim)_(x -> 3^-) f(x) = limits(lim)_(x -> 3^+) f(x) = f(3)$.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(x -> 3^-) f(x) = limits(lim)_(x -> 3^-) (x^2 - 4x + 3)/(x - 3) = limits(lim)_(x -> 3^-) ((x - 3)(x - 1))/(x - 3) = limits(lim)_(x -> 3^-) (x - 1) = 2 $.
        - Giới hạn phải và giá trị hàm số:
          $ f(3) = limits(lim)_(x -> 3^+) f(x) = m^2 dot 3 - 10 = 3m^2 - 10 $.
        Do đó:
        $ 3m^2 - 10 = 2 => 3m^2 = 12 => m^2 = 4 $.
        Vì $m$ nhận giá trị dương nên $m = 2$.
    ]
)

// TL 6
#tln([Một ống dẫn dầu bằng sắt trong nhà máy được ghép nối bởi hai đoạn dốc và đoạn ngang. Độ cao của ống dẫn $h(t)$ (mét) theo chiều dài ống $t$ (mét) được mô tả bởi hàm số liên tục:
    $h(t) = cases((t^2 - 2t - 8)/(t - 4) + 12 "khi" 0 <= t < 4, a t + 6 "khi" t >= 4)$.
    Tìm giá trị của tham số $a$ để lòng ống dẫn dầu khớp nối hoàn hảo liên tục tại điểm kết nối $t = 4$ m.],
    [3],
    loigiai: [
        Vì ống dẫn dầu ghép nối liên tục nên hàm số độ cao $h(t)$ phải liên tục tại điểm nối $t = 4$ m.
        Ta có:
        - Giới hạn trái:
          $ limits(lim)_(t -> 4^-) h(t) = limits(lim)_(t -> 4^-) [ (t^2 - 2t - 8)/(t - 4) + 12 ] = limits(lim)_(t -> 4^-) [ ((t - 4)(t + 2))/(t - 4) + 12 ] $
          $ = limits(lim)_(t -> 4^-) (t + 2 + 12) = 4 + 2 + 12 = 18 $ m.
        - Giới hạn phải và giá trị hàm số:
          $ h(4) = limits(lim)_(t -> 4^+) h(t) = a dot 4 + 6 = 4a + 6 $.
        Để hàm số liên tục tại $t = 4$ ta cần:
        $ 4a + 6 = 18 => 4a = 12 => a = 3 $.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
