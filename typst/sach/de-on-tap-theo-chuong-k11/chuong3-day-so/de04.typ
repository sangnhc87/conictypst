#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 3",
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 04)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Biết dãy số $(u_n)$ được cho bởi $u_n = 3^n / n!$. Mệnh đề nào dưới đây mô tả đúng nhất tính chất của dãy số này?],
    (
        [Dãy số $(u_n)$ là một dãy số luôn tăng với mọi $n$.],
        [Dãy số $(u_n)$ là một cấp số nhân.],
        True([Dãy số $(u_n)$ tăng khi $n < 3$ và giảm khi $n >= 3$.]),
        [Dãy số $(u_n)$ không bị chặn dưới.]
    ),
    loigiai: [
        Xét tỉ số giữa hai số hạng liên tiếp:
        $
          u_(n+1) / u_n &= (3^(n+1) / (n+1)!) / (3^n / n!) \
                        &= 3^(n+1)/3^n dot n! / ((n+1)!) \
                        &= 3 / (n+1)
        $
        Ta biện luận tỉ số này theo $n$:
        - Với $n = 1$: $u_2 / u_1 = 3/2 > 1 => u_2 > u_1$.
        - Với $n = 2$: $u_3 / u_2 = 3/3 = 1 => u_3 = u_2$.
        - Với $n >= 3$: $n+1 >= 4 > 3 => u_(n+1) / u_n = 3 / (n+1) < 1 => u_(n+1) < u_n$.
        Vậy dãy số tăng khi $n < 3$ (hoặc $n$ từ $1$ đến $3$) và giảm dần khi $n >= 3$. Các số hạng của dãy đều dương nên bị chặn dưới bởi 0.
    ]
)

// TN 2
#tn([Cho ba số phân biệt $a, b, c$ lập thành cấp số cộng. Mệnh đề nào sau đây biểu diễn mối liên hệ đúng của chúng?],
    (
        [$a^2 + c^2 = 2b^2$.],
        True([$(a - b) / (b - c) = 1$.]),
        [$(a - c)^2 = 4 b^2$.],
        [$a b + b c = 2 a c$.]
    ),
    loigiai: [
        Vì ba số $a, b, c$ lập thành một cấp số cộng nên theo tính chất ta có:
        $
          b - a = c - b &<=> a - b = b - c
        $
        Do ba số $a, b, c$ phân biệt nên $b - c != 0$.
        Chia hai vế cho $b - c$ ta được:
        $
          (a - b) / (b - c) = 1
        $
    ]
)

// TN 3
#tn([Trong một cấp số nhân $(v_n)$ có $v_1 != 0$ và công bội $q != 0$, $q != 1$. Tổng bình phương của $n$ số hạng đầu tiên được tính bằng công thức nào?],
    (
        [$v_1^2 (1 - q^(2n)) / (1 - q)^2$.],
        True([$v_1^2 (1 - q^(2n)) / (1 - q^2)$.]),
        [$v_1^2 (1 - q^n)^2 / (1 - q)^2$.],
        [$v_1^2 (1 - q^(n^2)) / (1 - q^2)$.]
    ),
    loigiai: [
        Ta biểu diễn tổng bình phương của $n$ số hạng đầu tiên:
        $
          T_n &= v_1^2 + v_2^2 + v_3^2 + ... + v_n^2 \
              &= v_1^2 + (v_1 q)^2 + (v_1 q^2)^2 + ... + (v_1 q^(n-1))^2 \
              &= v_1^2 (1 + q^2 + q^4 + ... + q^(2n-2))
        $
        Dãy số $1, q^2, q^4, ..., q^(2n-2)$ lập thành cấp số nhân có số hạng đầu là $1$, công bội là $q^2$ và có tất cả $n$ số hạng.
        Do đó:
        $
          T_n &= v_1^2 dot (1 - (q^2)^n) / (1 - q^2) \
              &= v_1^2 dot (1 - q^(2n)) / (1 - q^2)
        $
    ]
)

// TN 4
#tn([Gọi $S_n$ là tổng của $n$ số hạng đầu của một cấp số cộng $(u_n)$ có công sai $d != 0$. Mệnh đề nào sau đây là hằng số (không phụ thuộc vào $n$)?],
    (
        [$S_n / n$.],
        True([$(S_n) / n - (n d) / 2$.]),
        [$S_n - n^2 d$.],
        [$S_n / n^2$.]
    ),
    loigiai: [
        Ta có công thức tổng $S_n$:
        $
          S_n &= n/2 [2u_1 + (n-1)d] \
              &= n u_1 + (n^2 d) / 2 - (n d) / 2
        $
        Chia hai vế cho $n$ ta được:
        $
          S_n / n = u_1 - d/2 + (n d) / 2
        $
        Suy ra:
        $
          S_n / n - (n d) / 2 = u_1 - d/2
        $
        Vì $u_1$ và $d$ là các hằng số cố định của cấp số cộng nên biểu thức $u_1 - d/2$ là một hằng số không phụ thuộc vào $n$.
    ]
)

// TN 5
#tn([Cho cấp số nhân $(u_n)$ với $u_1 > 0$ và công bội $q > 1$. Mệnh đề nào sau đây đúng về dãy số $v_n = ln(u_n)$?],
    (
        [$v_n$ là một cấp số nhân với công bội $ln q$.],
        True([$v_n$ là một cấp số cộng với công sai $ln q$.]),
        [$v_n$ không phải là cấp số cộng cũng không phải cấp số nhân.],
        [$v_n$ là cấp số cộng với công sai $q$.]
    ),
    loigiai: [
        Số hạng tổng quát của cấp số nhân $(u_n)$ là:
        $
          u_n = u_1 q^(n-1)
        $
        Biến đổi dãy số $v_n$:
        $
          v_n &= ln(u_n) \
              &= ln(u_1 q^(n-1)) \
              &= ln u_1 + (n-1) ln q
        $
        Công thức này có dạng của số hạng tổng quát cấp số cộng với số hạng đầu là $v_1 = ln u_1$ và công sai là $d = ln q$.
    ]
)

// TN 6
#tn([Khai triển của một đa thức $P(x) = a_0 + a_1 x + a_2 x^2 + ... + a_n x^n$. Biết rằng các hệ số $a_0, a_1, a_2, ...$ theo thứ tự lập thành một cấp số cộng với công sai $d$. Giá trị của biểu thức $P(1) - P(-1)$ phụ thuộc chủ yếu vào],
    (
        [Chỉ phụ thuộc vào $a_0$ và $d$.],
        [Chỉ phụ thuộc vào $a_n$.],
        True([Tổng các hệ số của bậc lẻ.]),
        [Tổng các hệ số của bậc chẵn.]
    ),
    loigiai: [
        Ta tính các giá trị $P(1)$ và $P(-1)$:
        $
          P(1) &= a_0 + a_1 + a_2 + a_3 + a_4 + ... \
          P(-1) &= a_0 - a_1 + a_2 - a_3 + a_4 - ...
        $
        Hiệu của hai biểu thức là:
        $
          P(1) - P(-1) &= 2(a_1 + a_3 + a_5 + ...)
        $
        Biểu thức này bằng 2 lần tổng của các hệ số của các lũy thừa bậc lẻ trong đa thức $P(x)$.
    ]
)

// TN 7
#tn([Trong một phòng hòa nhạc, các dãy ghế được bố trí theo hình vòng cung. Dãy đầu tiên có $20$ ghế, dãy thứ hai có $23$ ghế, dãy thứ ba có $26$ ghế... Hỏi để bố trí được ít nhất $1000$ chỗ ngồi thì phòng hòa nhạc cần thiết kế tối thiểu bao nhiêu dãy ghế?],
    (
        [$20$ dãy.],
        True([$21$ dãy.]),
        [$22$ dãy.],
        [$23$ dãy.]
    ),
    loigiai: [
        Số ghế ở các dãy thứ nhất, thứ hai, thứ ba... lập thành cấp số cộng $(u_n)$ có số hạng đầu $u_1 = 20$ và công sai $d = 3$.
        Tổng số ghế của $n$ dãy đầu tiên là:
        $
          S_n &= n/2 [2u_1 + (n-1)d] \
              &= n/2 [40 + 3(n-1)] \
              &= (n(3n + 37))/2
        $
        Ta cần tìm $n$ nguyên dương tối thiểu sao cho $S_n >= 1000$:
        $
          (n(3n + 37))/2 >= 1000 &<=> 3n^2 + 37n - 2000 >= 0
        $
        Giải bất phương trình trên với $n > 0$, ta được:
        $
          n >= (-37 + sqrt(25369)) / 6 approx 20.38
        $
        Do $n$ là số nguyên dương nên ta chọn $n = 21$.
        
        Minh họa bố cục các dãy ghế hình vòng cung:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Các cung tròn đại diện cho các hàng ghế
            arc((45deg, 2.0), start: 45deg, stop: 135deg, radius: 2.0, stroke: 1pt + black)
            arc((40deg, 2.4), start: 40deg, stop: 140deg, radius: 2.4, stroke: 1pt + blue)
            arc((35deg, 2.8), start: 35deg, stop: 145deg, radius: 2.8, stroke: 1pt + red)
            
            // Các điểm đại diện cho các ghế
            for angle in (60, 75, 90, 105, 120) {
              circle((2.0 * calc.cos(angle * 1deg), 2.0 * calc.sin(angle * 1deg)), radius: 0.05, fill: black)
            }
            for angle in (50, 65, 80, 95, 110, 125, 140) {
              circle((2.4 * calc.cos(angle * 1deg), 2.4 * calc.sin(angle * 1deg)), radius: 0.05, fill: blue)
            }
            for angle in (40, 55, 70, 85, 100, 115, 130, 145) {
              circle((2.8 * calc.cos(angle * 1deg), 2.8 * calc.sin(angle * 1deg)), radius: 0.05, fill: red)
            }
            
            content((0, 1.7), [Dãy 1: 20 ghế], style: "italic")
            content((0, 2.2), [Dãy 2: 23 ghế], style: "italic")
            content((0, 2.6), [Dãy 3: 26 ghế], style: "italic")
          })
        ]
    ]
)

// TN 8
#tn([Ba số phân biệt $x, y, z$ lập thành cấp số nhân. Mệnh đề nào sau đây có thể đúng?],
    (
        True([$x + z > 2y$ hoặc $x + z < 2y$ tùy thuộc vào công bội $q$.]),
        [$x + z = 2y$.],
        [$x, y, z$ luôn lập thành một dãy tăng.],
        [$x y z > 0$ luôn luôn đúng.]
    ),
    loigiai: [
        Vì ba số $x, y, z$ lập thành cấp số nhân nên ta biểu diễn chúng dưới dạng:
        $ y = x q, quad z = x q^2 $
        Xét hiệu của tổng hai số hạng ngoài và hai lần số hạng giữa:
        $
          x + z - 2y &= x + x q^2 - 2x q \
                     &= x (1 - 2q + q^2) \
                     &= x (1 - q)^2
        $
        Do $x, y, z$ phân biệt nên công bội $q != 1$. Suy ra $(1-q)^2 > 0$ với mọi $q != 1$.
        - Nếu số hạng đầu $x > 0$, ta có: $x(1-q)^2 > 0 => x + z > 2y$.
        - Nếu số hạng đầu $x < 0$, ta có: $x(1-q)^2 < 0 => x + z < 2y$.
        Do đó mệnh đề A là chính xác nhất.
    ]
)

// TN 9
#tn([Cho cấp số cộng $(u_n)$ có $u_1 > 0$ và công sai $d < 0$. Gọi $S_n$ là tổng $n$ số hạng đầu tiên. Khẳng định nào sau đây là chính xác nhất về giá trị của $S_n$?],
    (
        [$S_n$ luôn tăng khi $n$ tăng.],
        [$S_n$ luôn giảm khi $n$ tăng.],
        True([$S_n$ tăng đạt đến một giá trị lớn nhất rồi sau đó sẽ giảm.]),
        [$S_n$ luôn dương với mọi $n$.]
    ),
    loigiai: [
        Do công sai $d < 0$ nên các số hạng của cấp số cộng $(u_n)$ sẽ giảm dần theo $n$.
        Vì $u_1 > 0$, ban đầu sẽ có các số hạng mang giá trị dương. Sau một chỉ số nào đó, các số hạng sẽ chuyển sang mang giá trị âm.
        Ta xét hiệu hai tổng liên tiếp:
        $ S_n - S_(n-1) = u_n $
        - Khi các số hạng $u_n > 0$, ta có $S_n > S_(n-1)$ nên tổng $S_n$ tăng dần.
        - Khi các số hạng $u_n < 0$, ta có $S_n < S_(n-1)$ nên tổng $S_n$ bắt đầu giảm dần.
        Do đó, tổng $S_n$ tăng đến giá trị lớn nhất (tại số hạng dương cuối cùng của cấp số cộng) rồi giảm dần mãi về $-oo$.
    ]
)

// TN 10
#tn([Hai số hạng đầu của một cấp số nhân là $x$ và $x+1$ (với $x != 0$). Số hạng thứ ba bằng $x+3$. Tìm giá trị của $x$.],
    (
        [$x = 1/2$.],
        True([$x = 1$.]),
        [$x = 2$.],
        [$x = -1$.]
    ),
    loigiai: [
        Vì ba số $x, x+1, x+3$ lập thành một cấp số nhân nên số hạng ở giữa bình phương bằng tích hai số hai bên:
        $
          (x+1)^2 = x(x+3) &<=> x^2 + 2x + 1 = x^2 + 3x \
                           &<=> 2x + 1 = 3x \
                           &<=> x = 1
        $
        Kiểm tra lại: Với $x = 1$, ba số là $1, 2, 4$ lập thành một cấp số nhân có công bội $q = 2$.
    ]
)

// TN 11
#tn([Một người dự định mua một căn nhà và chọn phương án thanh toán trả góp. Mỗi tháng anh ta phải trả một số tiền. Biết số tiền tháng thứ nhất là $10$ triệu đồng, và từ tháng thứ hai trở đi, số tiền phải trả giảm dần tạo thành một cấp số cộng với công sai $d$. Nếu tổng số tiền anh ta trả sau $3$ năm là $297$ triệu đồng. Giá trị của $d$ là bao nhiêu?],
    (
        [$-200 000$ đồng.],
        [$-150 000$ đồng.],
        [$+100 000$ đồng.],
        True([$-100 000$ đồng.])
    ),
    loigiai: [
        Thời gian trả góp 3 năm tương ứng với $n = 36$ tháng.
        Các khoản tiền phải trả mỗi tháng lập thành cấp số cộng với $u_1 = 10$ (triệu đồng) và tổng $S_36 = 297$ (triệu đồng).
        Áp dụng công thức tổng cấp số cộng:
        $
          S_36 &= 36/2 [2u_1 + 35d] \
               &= 18 [20 + 35d]
        $
        Ta giải phương trình:
        $
          18 [20 + 35d] = 297 &<=> 20 + 35d = 297/18 \
                              &<=> 20 + 35d = 16.5 \
                              &<=> 35d = -3.5 \
                              &<=> d = -0.1 " (triệu đồng)"
        $
        Đổi ra đơn vị đồng: $-0.1$ triệu đồng bằng $-100 000$ đồng.
    ]
)

// TN 12
#tn([Nếu tổng $n$ số hạng đầu tiên của một dãy số là $S_n = 2^(n+1) - 2$. Dãy số đó là],
    (
        [Cấp số cộng với công sai $d = 2$.],
        True([Cấp số nhân với công bội $q = 2$.]),
        [Cấp số nhân với công bội $q = 4$.],
        [Một dãy số bất kỳ, không phải là cấp số.]
    ),
    loigiai: [
        Ta xác định công thức của số hạng tổng quát $u_n$:
        - Với $n = 1$: $u_1 = S_1 = 2^(1+1) - 2 = 2$.
        - Với $n >= 2$:
          $
            u_n &= S_n - S_(n-1) \
                &= (2^(n+1) - 2) - (2^n - 2) \
                &= 2^(n+1) - 2^n \
                &= 2^n (2 - 1) = 2^n
          $
        Công thức $u_n = 2^n$ cũng đúng với $n = 1$ (vì $2^1 = 2$).
        Ta xét tỉ số hai số hạng liên tiếp:
        $
          u_(n+1) / u_n = 2^(n+1) / 2^n = 2
        $
        Do tỉ số này là hằng số nên dãy số $(u_n)$ là cấp số nhân có công bội $q = 2$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho ba số thực phân biệt $a, b, c$ khác $0$. Biết rằng $a, b, c$ lập thành một cấp số cộng và $a, c, b$ lập thành một cấp số nhân. Các phát biểu sau đúng hay sai?], (
        True([Vì $a, b, c$ lập thành cấp số cộng nên $a + c = 2b$.]),
        True([Vì $a, c, b$ lập thành cấp số nhân nên $a b = c^2$.]),
        True([Tỉ số $a/b$ luôn bằng $4$.]),
        True([Công bội của cấp số nhân $a, c, b$ là $q = -1/2$.])
    ), 
    loigiai: [
        - *a, b)* Đúng theo định nghĩa và tính chất của cấp số cộng và cấp số nhân.
        - *c)* Đúng. Từ tính chất cấp số cộng ta có $c = 2b - a$. Thế vào tính chất cấp số nhân:
          $
            (2b - a)^2 = a b &<=> 4b^2 - 4a b + a^2 = a b \
                             &<=> a^2 - 5a b + 4b^2 = 0 \
                             &<=> (a - b)(a - 4b) = 0
          $
          Vì ba số $a, b, c$ phân biệt nên $a != b$, từ đó suy ra $a = 4b$, hay tỉ số $a/b = 4$.
        - *d)* Đúng. Từ $a = 4b$, thế vào công thức của $c$:
          $ c = 2b - 4b = -2b $
          Khi đó cấp số nhân $a, c, b$ có dạng $4b, -2b, b$.
          Công bội của cấp số nhân này là:
          $ q = (-2b) / (4b) = -1/2 $
    ]
)

// DS 2
#ds([Tổng $S = sum_(k=1)^n 1/(sqrt(k) + sqrt(k+1))$ có thể tính được bằng cách rút gọn (phương pháp liên hợp). Xét quá trình tính $S$. Các phát biểu sau đúng hay sai?], (
        True([$1/(sqrt(k) + sqrt(k+1)) = sqrt(k+1) - sqrt(k)$.]),
        [Tổng $S$ là một cấp số cộng theo biến $n$.],
        True([Giá trị của $S$ khi $n = 99$ là $9$.]),
        True([Biểu thức $S$ có thể viết gọn là $sqrt(n+1) - 1$.])
    ), 
    loigiai: [
        - *a)* Đúng. Trục căn thức ở mẫu:
          $
            1 / (sqrt(k) + sqrt(k+1)) &= (sqrt(k+1) - sqrt(k)) / ((sqrt(k+1) + sqrt(k))(sqrt(k+1) - sqrt(k))) \
                                      &= (sqrt(k+1) - sqrt(k)) / (k + 1 - k) \
                                      &= sqrt(k+1) - sqrt(k)
          $
        - *b)* Sai. Tổng này sau khi triệt tiêu không có dạng tuyến tính $a n + b$ nên không lập thành một cấp số cộng.
        - *c, d)* Đúng. Ta biến đổi tổng quát của $S$:
          $
            S &= (sqrt(2) - sqrt(1)) + (sqrt(3) - sqrt(2)) + ... + (sqrt(n+1) - sqrt(n)) \
              &= sqrt(n+1) - 1
          $
          Khi $n = 99$: $S = sqrt(100) - 1 = 10 - 1 = 9$.
    ]
)

// DS 3
#ds([Cho dãy số $(u_n)$ xác định bởi $u_n = 5^n / (n^2 + 1)$. Xét tỉ số $T_n = u_(n+1) / u_n$. Các phát biểu sau đúng hay sai?], (
        True([Tỉ số $T_n = 5(n^2 + 1) / ((n+1)^2 + 1)$.]),
        True([Với mọi $n >= 1$, ta luôn có $T_n > 1$.]),
        True([Dãy số $(u_n)$ là một dãy số tăng.]),
        [Tồn tại một số hạng lớn nhất trong dãy.]
    ), 
    loigiai: [
        - *a)* Đúng. Tính tỉ số $T_n$:
          $
            T_n &= u_(n+1) / u_n \
                &= (5^(n+1) / ((n+1)^2 + 1)) dot ((n^2 + 1) / 5^n) \
                &= 5 dot (n^2 + 1) / ((n+1)^2 + 1)
          $
        - *b)* Đúng. Ta biến đổi hiệu giữa tử và mẫu của $T_n$:
          $
            5(n^2 + 1) - [(n+1)^2 + 1] &= 5n^2 + 5 - (n^2 + 2n + 2) \
                                       &= 4n^2 - 2n + 3 \
                                       &= 4(n - 1/4)^2 + 11/4 > 0
          $
          Vì tử luôn lớn hơn mẫu với mọi $n >= 1$ và cả tử, mẫu đều dương nên $T_n > 1$ với mọi $n >= 1$.
        - *c)* Đúng. Do $T_n > 1$ nên $u_(n+1) > u_n$ với mọi $n >= 1$, do đó dãy số là dãy tăng.
        - *d)* Sai. Vì là dãy tăng và không bị chặn trên nên khi $n -> +oo$, số hạng $u_n -> +oo$. Do đó không tồn tại số hạng lớn nhất.
    ]
)

// DS 4
#ds([Một bệnh nhân được tiêm $20$ mg một loại thuốc. Biết rằng sau mỗi giờ, cơ thể sẽ phân giải (đào thải) $25\%$ lượng thuốc còn lại trong máu. Khẳng định nào sau đúng hay sai?], (
        [Lượng thuốc còn lại sau $n$ giờ lập thành một cấp số nhân với công bội $q = 0.25$.],
        True([Sau $1$ giờ, lượng thuốc còn lại trong máu là $15$ mg.]),
        True([Lượng thuốc còn lại trong máu sau $n$ giờ là $u_n = 20 dot 0.75^n$.]),
        [Cần ít nhất $4$ giờ để lượng thuốc trong máu giảm xuống dưới $5$ mg.]
    ), 
    loigiai: [
        - *a)* Sai. Phân giải $25\%$ lượng thuốc đồng nghĩa với việc giữ lại $75\%$ lượng thuốc trong cơ thể. Do đó công bội của cấp số nhân là $q = 0.75$.
        - *b, c)* Đúng. Số lượng thuốc còn lại sau $n$ giờ là $u_n = 20 dot 0.75^n$ (mg).
          Với $n = 1$: $u_1 = 20 dot 0.75 = 15$ (mg).
        - *d)* Sai. Ta tìm số giờ $n$ tối thiểu để lượng thuốc dưới $5$ mg:
          $
            20 dot 0.75^n < 5 &<=> 0.75^n < 0.25 \
                              &<=> n > log_0.75 (0.25) approx 4.81
          $
          Vì thời gian tính bằng giờ nguyên, cần ít nhất $5$ giờ để lượng thuốc giảm dưới $5$ mg.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho một cấp số cộng có số hạng đầu $u_1 = a$ và công sai $d = 2$. Biết rằng ba số hạng $u_1, u_3, u_9$ theo thứ tự đó lập thành một cấp số nhân. Tìm giá trị của $a$.],
    [2],
    loigiai: [
        Ta có các số hạng biểu diễn theo $a$:
        $
          u_3 &= u_1 + 2d = a + 4 \
          u_9 &= u_1 + 8d = a + 16
        $
        Để $u_1, u_3, u_9$ lập thành một cấp số nhân:
        $
          u_3^2 = u_1 u_9 &<=> (a + 4)^2 = a (a + 16) \
                          &<=> a^2 + 8a + 16 = a^2 + 16a \
                          &<=> 8a = 16 <=> a = 2
        $
    ]
)

// TL 2
#tln([Có bao nhiêu số nguyên $n$ thuộc khoảng $(1; 100)$ sao cho dãy số $(u_n)$ với $u_n = n^2 - 19n + 5$ là một dãy số tăng bắt đầu từ chỉ số $n$ đó? (Tức là $u_(n+1) > u_n$ với mọi $n$ lớn hơn hoặc bằng giá trị nguyên tối thiểu). Tìm giá trị nguyên $n$ tối thiểu đó.],
    [10],
    loigiai: [
        Xét hiệu của hai số hạng liên tiếp:
        $
          u_(n+1) - u_n &= [(n+1)^2 - 19(n+1) + 5] - [n^2 - 19n + 5] \
                        &= n^2 + 2n + 1 - 19n - 19 + 5 - n^2 + 19n - 5 \
                        &= 2n - 18
        $
        Để dãy số tăng kể từ chỉ số $n$:
        $
          u_(n+1) - u_n > 0 &<=> 2n - 18 > 0 <=> n > 9
        $
        Do $n$ là số nguyên nên giá trị nguyên nhỏ nhất của chỉ số để dãy tăng là $n = 10$.
    ]
)

// TL 3
#tln([Trong không gian, một vật di chuyển theo các đoạn thẳng liên tiếp. Đoạn đầu tiên dài $100$ cm. Mỗi đoạn tiếp theo có chiều dài bằng $4/5$ chiều dài đoạn liền trước nó. Tính tổng giới hạn quãng đường vật có thể di chuyển được (tính bằng cm) nếu nó cứ tiếp tục di chuyển theo quy luật đó vô hạn lần.],
    [500],
    loigiai: [
        Độ dài các đoạn đường di chuyển liên tiếp lập thành một cấp số nhân lùi vô hạn có số hạng đầu $u_1 = 100$ và công bội $q = 4/5$ (thỏa mãn $|q| < 1$).
        Tổng giới hạn quãng đường di chuyển được là:
        $
          S = u_1 / (1 - q) = 100 / (1 - 4/5) = 100 / (1/5) = 500 " (cm)"
        $
        
        Minh họa quãng đường gấp khúc giảm dần:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let pts = ((0.0, 0.0), (3.0, 0.0), (3.0, 2.4), (1.08, 2.4), (1.08, 0.48), (2.0, 0.48))
            line(..pts, stroke: 1.2pt + blue)
            for p in pts {
              circle(p, radius: 0.05, fill: red)
            }
            content((1.5, -0.3), [$u_1 = 100$])
            content((3.6, 1.2), [$u_2 = 80$])
            content((2.0, 2.7), [$u_3 = 64$])
          })
        ]
    ]
)

// TL 4
#tln([Gọi $a, b, c$ là ba góc của một tam giác. Biết rằng $sin a, sin b, sin c$ lập thành một cấp số cộng và $a, b, c$ cũng lập thành một cấp số cộng. Tìm số đo góc lớn nhất của tam giác (tính bằng độ).],
    [60],
    loigiai: [
        Vì ba góc $a, b, c$ của tam giác lập thành một cấp số cộng nên ta có:
        $ a + c = 2b $
        Tổng ba góc của một tam giác bằng $180^o$:
        $
          a + b + c = 180^o &<=> 3b = 180^o <=> b = 60^o
        $
        Mặt khác, $sin a, sin b, sin c$ cũng lập thành một cấp số cộng:
        $
          sin a + sin c = 2 sin b = 2 sin 60^o = sqrt(3)
        $
        Áp dụng công thức biến đổi tổng thành tích:
        $
          2 sin((a+c)/2) cos((a-c)/2) = sqrt(3) &<=> 2 sin 60^o cos((a-c)/2) = sqrt(3) \
                                               &<=> sqrt(3) cos((a-c)/2) = sqrt(3) \
                                               &<=> cos((a-c)/2) = 1
        $
        Do $a, c$ là các góc của một tam giác nên:
        $
          -180^o < a-c < 180^o &<=> -90^o < (a-c)/2 < 90^o
        $
        Trong khoảng này, $cos((a-c)/2) = 1 <=> (a-c)/2 = 0^o <=> a = c$.
        Vậy $a = b = c = 60^o$. Tam giác $A B C$ đều và góc lớn nhất của nó là $60^o$.
        
        Hình minh họa tam giác đều thu được:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let side = 3.0
            let h = side * calc.sin(60deg)
            let A = (side/2, h)
            let B = (0.0, 0.0)
            let C = (side, 0.0)
            
            line(A, B, C, close: true, stroke: 1.2pt + black)
            
            content(A, [A], anchor: "south")
            content(B, [B], anchor: "north-east")
            content(C, [C], anchor: "north-west")
            
            arc((rel: (0deg, 0.4), to: B), start: 0deg, stop: 60deg, radius: 0.4, stroke: 0.8pt + blue)
            arc((rel: (120deg, 0.4), to: C), start: 120deg, stop: 180deg, radius: 0.4, stroke: 0.8pt + blue)
            arc((rel: (240deg, 0.4), to: A), start: 240deg, stop: 300deg, radius: 0.4, stroke: 0.8pt + blue)
            
            content((0.6, 0.35), [$60^o$])
            content((side - 0.6, 0.35), [$60^o$])
            content((side/2, h - 0.6), [$60^o$])
          })
        ]
    ]
)

// TL 5
#tln([Trong một thí nghiệm, một nhóm vi khuẩn ban đầu có $1000$ cá thể. Biết rằng cứ sau $2$ giờ, số lượng vi khuẩn tăng gấp $3$ lần. Để quần thể đạt mức tối thiểu $81 000$ cá thể thì phải mất ít nhất bao nhiêu giờ?],
    [8],
    loigiai: [
        Số lượng vi khuẩn tại các mốc thời gian $0$ giờ, $2$ giờ, $4$ giờ... lập thành một cấp số nhân có số hạng đầu $u_1 = 1000$ và công bội $q = 3$.
        Sau $2k$ giờ (tương ứng với lần tăng thứ $k$), số vi khuẩn là:
        $
          u_(k+1) = u_1 q^k = 1000 dot 3^k
        $
        Ta giải bất phương trình:
        $
          1000 dot 3^k >= 81 000 &<=> 3^k >= 81 \
                                 &<=> 3^k >= 3^4 \
                                 &<=> k >= 4
        $
        Vậy phải trải qua tối thiểu $k = 4$ chu kỳ tăng trưởng.
        Thời gian cần thiết tối thiểu là:
        $
          t = 4 dot 2 = 8 " (giờ)"
        $
    ]
)

// TL 6
#tln([Tồn tại bao nhiêu tứ giác lồi có chu vi bằng $12$ và độ dài bốn cạnh lập thành một cấp số cộng với công sai $d = 2$?],
    [0],
    loigiai: [
        Gọi bốn cạnh của tứ giác lồi từ nhỏ đến lớn là $a, a+2, a+4, a+6$ (với $a > 0$).
        Theo giả thiết chu vi bằng $12$:
        $
          a + (a+2) + (a+4) + (a+6) = 12 &<=> 4a + 12 = 12 \
                                         &<=> 4a = 0 <=> a = 0
        $
        Vì độ dài một cạnh phải là số thực dương ($a > 0$) nên không tồn tại giá trị nào của $a$ thỏa mãn.
        Do đó không tồn tại tứ giác lồi nào thỏa mãn điều kiện đề bài.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
