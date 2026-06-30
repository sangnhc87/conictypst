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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 03)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho dãy số $(u_n)$ thỏa mãn $u_n = 2^n - n$. Khẳng định nào sau đây là đúng về dãy số này?],
    (
        [$u_n$ là dãy số giảm.],
        [$u_n$ bị chặn trên.],
        True([$u_n$ là dãy số tăng.]),
        [$u_n$ là một cấp số nhân.]
    ),
    loigiai: [
        Xét hiệu hai số hạng liên tiếp:
        $
          u_(n+1) - u_n &= (2^(n+1) - (n+1)) - (2^n - n) \
                        &= 2^(n+1) - 2^n - n - 1 + n \
                        &= 2^n - 1
        $
        Với mọi $n >= 1$, ta luôn có $2^n >= 2$, suy ra:
        $ 2^n - 1 >= 1 > 0 $
        Do đó $u_(n+1) > u_n$ với mọi $n >= 1$, nghĩa là dãy số $(u_n)$ là một dãy số tăng. Dãy số này tiến tới $+oo$ nên không bị chặn trên.
    ]
)

// TN 2
#tn([Biết rằng ba số $x, y, z$ (khác $0$) lập thành một cấp số nhân với công bội $q != 1$. Ba số $x, 2y, 3z$ lập thành một cấp số cộng. Giá trị của $q$ là],
    (
        [$q = 1/2$.],
        [$q = 2$.],
        True([$q = 1/3$.]),
        [$q = 3$.]
    ),
    loigiai: [
        Vì ba số $x, y, z$ lập thành cấp số nhân nên ta biểu diễn chúng là $y = x q$ và $z = x q^2$.
        Vì $x, 2y, 3z$ lập thành cấp số cộng nên ta có:
        $
          x + 3z = 2(2y) = 4y
        $
        Thay $y$ và $z$ vào phương trình trên:
        $
          x + 3 x q^2 = 4 x q
        $
        Vì các số hạng khác $0$ nên $x != 0$, ta chia hai vế cho $x$ để được phương trình:
        $
          3q^2 - 4q + 1 = 0 &<=> (q - 1)(3q - 1) = 0 \
                            &<=> cases(q = 1, q = 1/3)
        $
        Theo giả thiết công bội $q != 1$, do đó $q = 1/3$.
    ]
)

// TN 3
#tn([Ký hiệu $S_n$ là tổng của $n$ số hạng đầu tiên của một cấp số cộng. Nếu $S_6 = 3 S_3$, tỉ số giữa công sai $d$ và số hạng đầu $u_1$ (giả sử $u_1 != 0$) bằng bao nhiêu?],
    (
        True([$1/2$.]),
        [$1$.],
        [$2$.],
        [$3$.]
    ),
    loigiai: [
        Áp dụng công thức tổng $S_n$:
        $
          S_n = n/2 [2u_1 + (n-1)d]
        $
        Ta tính biểu thức ở hai vế của phương trình $S_6 = 3 S_3$:
        $
          S_6 &= 6/2 [2u_1 + 5d] = 6u_1 + 15d \
          S_3 &= 3/2 [2u_1 + 2d] = 3u_1 + 3d
        $
        Thế vào phương trình giả thiết:
        $
          6u_1 + 15d = 3(3u_1 + 3d) &<=> 6u_1 + 15d = 9u_1 + 9d \
                                    &<=> 6d = 3u_1 \
                                    &<=> 2d = u_1 \
                                    &<=> d/u_1 = 1/2
        $
    ]
)

// TN 4
#tn([Cho cấp số nhân $(u_n)$ có các số hạng đều âm. Biết $u_2 = -2$ và $u_4 = -18$. Số hạng tổng quát của cấp số nhân này là],
    (
        [$u_n = -2/3 dot 3^n$.],
        True([$u_n = -2/3 dot 3^(n-1)$.]),
        [$u_n = -2/3 dot (-3)^n$.],
        [$u_n = -2 dot 3^(n-1)$.]
    ),
    loigiai: [
        Ta xét tỉ số:
        $
          u_4 / u_2 = (u_1 q^3) / (u_1 q) = q^2 = (-18) / (-2) = 9
        $
        Suy ra công bội $q = 3$ hoặc $q = -3$.
        - Với $q = -3$, các số hạng sẽ đan dấu âm dương luân phiên, mâu thuẫn với giả thiết dãy gồm các số hạng đều âm.
        - Với $q = 3$, số hạng đầu là:
          $ u_1 = u_2 / q = -2/3 $
          Tất cả các số hạng đều mang dấu âm (thỏa mãn).
        Công thức số hạng tổng quát thu được:
        $ u_n = -2/3 dot 3^(n-1) $
    ]
)

// TN 5
#tn([Một cấp số cộng $(u_n)$ có tổng $n$ số hạng đầu tiên được cho bởi công thức $S_n = 5n^2 + 3n$. Số hạng tổng quát $u_n$ của cấp số cộng đó là],
    (
        [$u_n = 10n - 2$.],
        [$u_n = 5n + 3$.],
        [$u_n = 10n + 3$.],
        True([$u_n = 10n - 2$.])
    ),
    loigiai: [
        Ta tính công thức của số hạng tổng quát $u_n$ thông qua tổng $S_n$:
        - Với $n = 1$: $u_1 = S_1 = 5 dot 1^2 + 3 dot 1 = 8$.
        - Với $n >= 2$:
          $
            u_n &= S_n - S_(n-1) \
                &= (5n^2 + 3n) - [5(n-1)^2 + 3(n-1)] \
                &= 5n^2 + 3n - [5n^2 - 10n + 5 + 3n - 3] \
                &= 5n^2 + 3n - 5n^2 + 7n - 2 \
                &= 10n - 2
          $
        Công thức $u_n = 10n - 2$ thỏa mãn cho cả trường hợp $n = 1$ (vì $10 dot 1 - 2 = 8$).
        Vậy số hạng tổng quát là $u_n = 10n - 2$.
    ]
)

// TN 6
#tn([Trong một nhà hát, hàng ghế đầu tiên có $a$ ghế. Mỗi hàng ghế tiếp theo có nhiều hơn hàng liền trước $d$ ghế ($d > 0$). Nếu tổng số ghế của $10$ hàng đầu tiên bằng tổng số ghế của $15$ hàng đầu tiên thì],
    (
        [$a = -7d$.],
        True([Điều này không thể xảy ra với $a > 0, d > 0$.]),
        [$a = 7d$.],
        [$a = 10d$.]
    ),
    loigiai: [
        Vì số ghế ở hàng đầu $a > 0$ và số ghế tăng thêm $d > 0$, nên số ghế ở mỗi hàng luôn là các số dương.
        Tổng các số dương tăng dần liên tục, do đó $S_n$ là dãy tăng ngặt.
        Điều này dẫn đến $S_10 < S_15$ hay phương trình $S_10 = S_15$ không thể xảy ra.
        Nếu giải bằng đại số:
        $
          S_10 = S_15 &<=> 10/2 [2a + 9d] = 15/2 [2a + 14d] \
                      &<=> 10a + 45d = 15a + 105d \
                      &<=> 5a + 60d = 0 <=> a = -12d
        $
        Vì $d > 0$ nên $a = -12d < 0$, mâu thuẫn với điều kiện thực tế số ghế phải dương ($a > 0$).
    ]
)

// TN 7
#tn([Cho ba số $a, b, c$ lập thành cấp số cộng. Mệnh đề nào sau đây đúng?],
    (
        [$a^2, b^2, c^2$ lập thành cấp số cộng.],
        [$2^a, 2^b, 2^c$ lập thành cấp số cộng.],
        True([$2^a, 2^b, 2^c$ lập thành cấp số nhân.]),
        [$log_2 a, log_2 b, log_2 c$ lập thành cấp số cộng (nếu $a,b,c>0$).]
    ),
    loigiai: [
        Do ba số $a, b, c$ lập thành một cấp số cộng nên ta có hệ thức:
        $ a + c = 2b $
        Xét các số hạng $2^a, 2^b, 2^c$, lấy tích hai số hạng biên:
        $
          2^a dot 2^c = 2^(a+c) = 2^(2b) = (2^b)^2
        $
        Hệ thức cho thấy $2^a, 2^b, 2^c$ lập thành cấp số nhân với công bội là $q = 2^(b-a)$.
    ]
)

// TN 8
#tn([Gọi $S$ là tổng vô hạn của cấp số nhân $1, -1/2, 1/4, -1/8, ...$. Giá trị của $S$ là],
    (
        [$2$.],
        [$1/2$.],
        True([$2/3$.]),
        [$3/2$.]
    ),
    loigiai: [
        Dãy số lập thành một cấp số nhân lùi vô hạn có:
        - Số hạng đầu tiên: $u_1 = 1$.
        - Công bội: $q = -1/2$ (thỏa mãn $|q| < 1$).
        Tổng của cấp số nhân lùi vô hạn này bằng:
        $
          S = u_1 / (1 - q) = 1 / (1 - (-1/2)) = 1 / (3/2) = 2/3
        $
    ]
)

// TN 9
#tn([Một quả bóng rơi từ độ cao $h$. Sau mỗi lần chạm đất, quả bóng nảy lên độ cao bằng $p$ lần độ cao trước đó ($0 < p < 1$). Tổng quãng đường quả bóng di chuyển (lên và xuống) cho đến khi dừng hẳn là],
    (
        [$h (1+p) / (1-p)$.],
        True([$h (1+p) / (1-p)$.]),
        [$h / (1-p)$.],
        [$2h / (1-p)$.]
    ),
    loigiai: [
        Phân tích quãng đường di chuyển của quả bóng:
        - Lần rơi đầu tiên từ độ cao $h$: Quãng đường là $h$.
        - Lần nảy thứ 1 (lên và xuống): Quãng đường là $2(h p)$.
        - Lần nảy thứ 2 (lên và xuống): Quãng đường là $2(h p^2)$.
        - Lần nảy thứ $n$: Quãng đường là $2(h p^n)$.
        Tổng quãng đường bóng di chuyển cho đến khi dừng lại là:
        $
          S &= h + 2h p + 2h p^2 + 2h p^3 + ... \
            &= h + 2h p (1 + p + p^2 + ...) \
            &= h + 2h p dot 1 / (1 - p) \
            &= h (1 + (2p)/(1-p)) \
            &= h dot (1 + p) / (1 - p)
        $
        
        Minh họa hành trình nảy giảm dần của bóng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Mặt đất
            line((0,0), (6,0), stroke: 1.5pt + gray)
            
            // Quỹ đạo rơi đầu
            line((0.5, 3.5), (0.5, 0), stroke: (paint: blue, dash: "dashed"))
            circle((0.5, 3.5), radius: 0.05, fill: blue)
            
            // Các đường nảy
            bezier((0.5, 0), (2.0, 0), (0.8, 2.45), (1.7, 2.45), stroke: blue)
            bezier((2.0, 0), (3.2, 0), (2.2, 1.715), (3.0, 1.715), stroke: blue)
            bezier((3.2, 0), (4.1, 0), (3.4, 1.2), (3.9, 1.2), stroke: blue)
            
            // Ghi chú
            content((0.5, 3.75), [$h$])
            content((1.25, 2.65), [$h p$])
            content((2.6, 1.95), [$h p^2$])
            content((3.65, 1.4), [$h p^3$])
          })
        ]
    ]
)

// TN 10
#tn([Biết rằng phương trình $x^3 - p x^2 + q x - r = 0$ có ba nghiệm lập thành cấp số nhân. Mối liên hệ bắt buộc giữa $p, q, r$ là],
    (
        [$p^3 = r q^3$.],
        [$r^2 = p^3 q$.],
        True([$q^3 = r p^3$.]),
        [$p q = r$.]
    ),
    loigiai: [
        Gọi ba nghiệm của phương trình là $x_1, x_2, x_3$. Theo giả thiết chúng lập thành một cấp số nhân nên ta có $x_1 x_3 = x_2^2$.
        Áp dụng định lý Vi-ét cho phương trình bậc ba:
        $
          x_1 x_2 x_3 = r &<=> x_2^3 = r \
                          &<=> x_2 = root(3, r)
        $
        Mặt khác, các hệ số liên quan:
        $
          p &= x_1 + x_2 + x_3 \
          q &= x_1 x_2 + x_2 x_3 + x_1 x_3 \
            &= x_2 (x_1 + x_3) + x_2^2 \
            &= x_2 (x_1 + x_2 + x_3) = x_2 p
        $
        Thay thế $x_2 = root(3, r)$ vào ta thu được:
        $
          q = root(3, r) p &<=> q^3 = r p^3
        $
    ]
)

// TN 11
#tn([Một người gửi $A$ đồng vào ngân hàng với lãi suất $r$ mỗi kỳ theo hình thức lãi kép. Tổng số tiền người đó nhận được sau $n$ kỳ hạn lập thành dãy số $(T_n)$. Dãy $(T_n)$ có tính chất gì?],
    (
        [Là cấp số cộng với công sai $A r$.],
        True([Là cấp số nhân với công bội $1+r$.]),
        [Là cấp số nhân với công bội $r$.],
        [Không phải cấp số cộng cũng không phải cấp số nhân.]
    ),
    loigiai: [
        Lượng tiền người gửi nhận được sau $n$ kỳ hạn tuân theo công thức tính lãi kép:
        $ T_n = A(1+r)^n $
        Ta lập tỉ số giữa hai kỳ liên tiếp:
        $
          T_(n+1) / T_n = (A(1+r)^(n+1)) / (A(1+r)^n) = 1+r
        $
        Do tỉ số này luôn bằng hằng số $1+r$ nên dãy số số tiền nhận được là một cấp số nhân có công bội $q = 1+r$.
    ]
)

// TN 12
#tn([Cho hai cấp số cộng $(u_n)$ và $(v_n)$. Dãy số $(w_n)$ được định nghĩa bởi $w_n = 2u_n - 3v_n + 5$. Khẳng định nào sau đây là đúng?],
    (
        [$(w_n)$ không chắc là cấp số cộng.],
        [$(w_n)$ là cấp số cộng với công sai $d_w = 2d_u + 3d_v$.],
        True([$(w_n)$ là cấp số cộng với công sai $d_w = 2d_u - 3d_v$.]),
        [$(w_n)$ là cấp số nhân.]
    ),
    loigiai: [
        Ta xét hiệu của hai số hạng liên tiếp trong dãy số $(w_n)$:
        $
          w_(n+1) - w_n &= [2u_(n+1) - 3v_(n+1) + 5] - [2u_n - 3v_n + 5] \
                        &= 2(u_(n+1) - u_n) - 3(v_(n+1) - v_n) \
                        &= 2 d_u - 3 d_v
        $
        Vì $d_u, d_v$ tương ứng là công sai cố định của hai cấp số cộng $(u_n)$ và $(v_n)$, nên hiệu $2d_u - 3d_v$ là một hằng số.
        Vậy dãy số $(w_n)$ lập thành một cấp số cộng với công sai $d_w = 2d_u - 3d_v$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho dãy số $(u_n)$ xác định bởi $u_1 = 3$ và $u_n = 1 / (2 - u_(n-1))$ với mọi $n >= 2$. Các phát biểu sau đúng hay sai?], (
        True([$u_2 = -1$.]),
        True([$u_3 = 1/3$.]),
        [Dãy số $(u_n)$ là một dãy số giảm.],
        [Công thức số hạng tổng quát của dãy số là $u_n = (2n + 1) / (2n - 1)$.]
    ), 
    loigiai: [
        - *a)* Đúng. Tính số hạng thứ 2:
          $ u_2 = 1 / (2 - 3) = -1 $
        - *b)* Đúng. Tính số hạng thứ 3:
          $ u_3 = 1 / (2 - (-1)) = 1/3 $
        - *c)* Sai. Nhận xét $u_1 = 3 > u_2 = -1$ (giảm), nhưng $u_2 = -1 < u_3 = 1/3$ (tăng). Dãy không tăng cũng không giảm.
        - *d)* Sai. Thử giá trị với $n = 2$: $u_2 = (4+1)/(4-1) = 5/3 != -1$.
    ]
)

// DS 2
#ds([Một cấp số cộng $(u_n)$ và một cấp số nhân $(v_n)$ có cùng số hạng thứ nhất $u_1 = v_1 = 2$, cùng số hạng thứ hai $u_2 = v_2 = a$ ($a > 2$). Các phát biểu sau đúng hay sai?], (
        True([Công sai của cấp số cộng là $d = a - 2$.]),
        True([Công bội của cấp số nhân là $q = a / 2$.]),
        True([Luôn luôn có $u_3 <= v_3$.]),
        [Nếu $u_3 = v_3$ thì điều kiện $a > 2$ vẫn thỏa mãn.]
    ), 
    loigiai: [
        - *a)* Đúng. $d = u_2 - u_1 = a - 2$.
        - *b)* Đúng. $q = v_2 / v_1 = a/2$.
        - *c)* Đúng. Ta tính số hạng thứ ba của mỗi cấp số:
          $
            u_3 &= u_1 + 2d = 2 + 2(a - 2) = 2a - 2 \
            v_3 &= v_1 q^2 = 2 dot (a/2)^2 = a^2 / 2
          $
          Xét hiệu:
          $
            v_3 - u_3 &= a^2 / 2 - (2a - 2) \
                      &= (a^2 - 4a + 4) / 2 \
                      &= (a - 2)^2 / 2 >= 0
          $
          Vậy $v_3 >= u_3$ luôn luôn đúng với mọi $a$.
        - *d)* Sai. Để $u_3 = v_3$ thì hiệu trên phải bằng $0$, tức là $(a - 2)^2 = 0 <=> a = 2$.
          Điều này mâu thuẫn trực tiếp với điều kiện $a > 2$.
    ]
)

// DS 3
#ds([Tổng $S = 1 + 2x + 3x^2 + 4x^3 + ... + n x^(n-1)$ (với $x != 1$) được xây dựng bằng cách kết hợp cấp số cộng và cấp số nhân (gọi là chuỗi cấp số nhân - cộng). Xét quá trình tính $S$. Các phát biểu sau đúng hay sai?], (
        True([Nhân hai vế của $S$ với $x$ ta được $x S = x + 2x^2 + 3x^3 + ... + n x^n$.]),
        True([Hiệu $S - x S$ triệt tiêu tất cả các hệ số chứa $n$ ở bên trong tổng, tạo ra một cấp số nhân.]),
        True([$S - x S = (1 - x^n) / (1 - x) - n x^n$.]),
        True([Khi $n -> +oo$ và $|x| < 1$, $S$ hội tụ về $1 / (1-x)^2$.])
    ), 
    loigiai: [
        - *a)* Đúng. Nhân $x$ vào hai vế của chuỗi $S$.
        - *b)* Đúng. Khi lấy hiệu $S - x S$, các số hạng đồng bậc trừ cho nhau sẽ rút gọn hệ số từ $k - (k-1) = 1$:
          $
            S - x S &= 1 + (2 - 1)x + (3 - 2)x^2 + ... + (n - (n-1))x^(n-1) - n x^n \
                    &= 1 + x + x^2 + ... + x^(n-1) - n x^n
          $
          Các số hạng đầu lập thành một cấp số nhân.
        - *c)* Đúng. Rút gọn tổng cấp số nhân thu được:
          $
            S - x S = (1 - x^n) / (1 - x) - n x^n
          $
        - *d)* Đúng. Khi $|x| < 1$ và $n -> +oo$, ta có giới hạn $x^n -> 0$ và $n x^n -> 0$:
          $
            S(1 - x) &= 1 / (1 - x) - 0 \
                   S &= 1 / (1 - x)^2
          $
    ]
)

// DS 4
#ds([Cho ba số lập thành cấp số cộng có tổng bằng $21$. Nếu thêm $2, 3, 9$ lần lượt vào ba số đó, ta được ba số mới lập thành cấp số nhân. Gọi ba số ban đầu là $a, b, c$. Các phát biểu sau đúng hay sai?], (
        True([Số ở giữa của cấp số cộng (b) chắc chắn bằng $7$.]),
        [Công sai $d$ của cấp số cộng có thể nhận giá trị bằng $3$.],
        [Chỉ có đúng một bộ ba số $(a, b, c)$ thỏa mãn yêu cầu bài toán.],
        [Tích ba số ban đầu lớn nhất bằng $280$.]
    ), 
    loigiai: [
        Biểu diễn ba số lập thành cấp số cộng là $7-d, 7, 7+d$ (vì tổng là 21, số hạng ở giữa $b = 7$).
        Sau khi cộng thêm các hằng số, ba số mới là:
        $ 9-d, quad 10, quad 16+d $
        Để ba số mới lập thành một cấp số nhân:
        $
          10^2 = (9-d)(16+d) &<=> 100 = 144 - 7d - d^2 \
                             &<=> d^2 + 7d - 44 = 0 \
                             &<=> (d - 4)(d + 11) = 0 \
                             &<=> cases(d = 4, d = -11)
        $
        - *a)* Đúng. Số đứng giữa là $b = 7$.
        - *b)* Sai. Công sai của cấp số cộng chỉ có thể bằng $4$ hoặc $-11$.
        - *c)* Sai. Có hai giá trị của $d$ nên có 2 bộ ba số thỏa mãn:
          - Với $d = 4$: ba số là $3, 7, 11$.
          - Với $d = -11$: ba số là $18, 7, -4$.
        - *d)* Sai. Tích của ba số ban đầu lớn nhất ứng với trường hợp $d=4$:
          $ 3 dot 7 dot 11 = 231 $
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho ba số $x, y, z$ thỏa mãn đồng thời: $x+y+z=14$, ba số này theo thứ tự lập thành một cấp số nhân, và ba số $x, y+1, z$ theo thứ tự lập thành một cấp số cộng. Tìm giá trị của $x$ biết $x > z$.],
    [8],
    loigiai: [
        Theo tính chất của các cấp số:
        - $x, y, z$ lập thành cấp số nhân: $y^2 = x z$.
        - $x, y+1, z$ lập thành cấp số cộng: $x + z = 2(y+1) = 2y + 2$.
        Thay vào tổng $x + y + z = 14$:
        $
          (2y + 2) + y = 14 &<=> 3y = 12 \
                            &<=> y = 4
        $
        Khi $y = 4$, ta được hệ thức:
        $
          cases(
            x + z = 10,
            x z = 16
          )
        $
        Theo định lý Vi-ét đảo, $x, z$ là hai nghiệm của phương trình $t^2 - 10t + 16 = 0 <=> t = 8$ hoặc $t = 2$.
        Vì $x > z$ nên ta chọn $x = 8$ (và $z = 2$).
    ]
)

// TL 2
#tln([Tính tổng $S = 1 dot 2 + 2 dot 3 + 3 dot 4 + ... + 20 dot 21$.],
    [3080],
    loigiai: [
        Số hạng tổng quát trong tổng là $u_k = k(k+1) = k^2 + k$.
        Ta tách tổng thành hai phần:
        $
          S = sum_(k=1)^20 (k^2 + k) = sum_(k=1)^20 k^2 + sum_(k=1)^20 k
        $
        Áp dụng các công thức tổng lũy thừa:
        $
          sum_(k=1)^20 k &= (20 dot 21) / 2 = 210 \
          sum_(k=1)^20 k^2 &= (20 dot 21 dot 41) / 6 = 2870
        $
        Thay các kết quả tính được vào biểu thức:
        $ S = 2870 + 210 = 3080 $
    ]
)

// TL 3
#tln([Cho dãy số $(u_n)$ được xác định bởi $u_1 = 1$ và $u_n = 2 u_(n-1) + 3$ với $n >= 2$. Số hạng $u_10$ bằng bao nhiêu?],
    [2045],
    loigiai: [
        Ta đưa hệ thức truy hồi về dạng cấp số nhân bằng cách biến đổi:
        $
          u_n + 3 = 2(u_(n-1) + 3)
        $
        Đặt dãy phụ $v_n = u_n + 3$, ta có $v_n = 2v_(n-1)$ với mọi $n >= 2$.
        Dãy $(v_n)$ là cấp số nhân có:
        - Số hạng đầu: $v_1 = u_1 + 3 = 4$.
        - Công bội: $q = 2$.
        Số hạng tổng quát của $v_n$ là:
        $ v_n = v_1 q^(n-1) = 4 dot 2^(n-1) = 2^(n+1) $
        Từ đó suy ra số hạng tổng quát của $u_n$:
        $ u_n = 2^(n+1) - 3 $
        Tính số hạng thứ 10:
        $ u_10 = 2^11 - 3 = 2048 - 3 = 2045 $
    ]
)

// TL 4
#tln([Một nhà nông muốn xây dựng một hàng rào quanh một mảnh đất hình tam giác vuông. Biết độ dài ba cạnh của tam giác vuông lập thành một cấp số cộng và chu vi của tam giác bằng $120$ mét. Diện tích của mảnh đất này bằng bao nhiêu mét vuông?],
    [600],
    loigiai: [
        Gọi ba cạnh tam giác vuông lập thành cấp số cộng tăng dần là $a-d, a, a+d$ (với $a > d > 0$).
        Theo định lý Pytago, cạnh huyền là cạnh lớn nhất $a+d$:
        $
          (a-d)^2 + a^2 = (a+d)^2 &<=> a^2 - 4a d = 0 \
                                 &<=> a = 4d " (do " a > 0)
        $
        Ba cạnh của tam giác vuông có độ dài là $3d, 4d, 5d$.
        Dựa vào giả thiết chu vi của tam giác bằng 120 mét:
        $
          3d + 4d + 5d = 120 &<=> 12d = 120 \
                             &<=> d = 10
        $
        Độ dài ba cạnh của mảnh vườn hình tam giác là $30$ m, $40$ m, $50$ m.
        Diện tích mảnh đất tam giác vuông bằng:
        $ S = 1/2 dot 30 dot 40 = 600 " (m"^2) $
        
        Hình vẽ phác thảo mảnh đất tam giác vuông:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let A = (0.0, 2.0)
            let B = (0.0, 0.0)
            let C = (2.666, 0.0)
            
            line(A, B, C, close: true, stroke: 1.2pt + black)
            
            rect((0,0), (0.2, 0.2), stroke: 0.8pt + black)
            
            content((-0.45, 1.0), [30 m])
            content((1.33, -0.3), [40 m])
            content((1.5, 1.2), [50 m])
          })
        ]
    ]
)

// TL 5
#tln([Người ta xếp các viên bi thành hình tháp: hàng trên cùng có $1$ viên, hàng thứ hai có $3$ viên, hàng thứ ba có $6$ viên, hàng thứ tư có $10$ viên, và tổng quát hàng thứ $n$ có $n(n+1)/2$ viên. Tổng số viên bi cần thiết để xếp được một tháp có $15$ hàng bằng bao nhiêu?],
    [680],
    loigiai: [
        Số lượng viên bi ở hàng thứ $k$ là:
        $ u_k = (k(k+1))/2 = 1/2 k^2 + 1/2 k $
        Tổng số viên bi của cả tháp 15 hàng là:
        $
          S &= sum_(k=1)^15 (1/2 k^2 + 1/2 k) \
            &= 1/2 sum_(k=1)^15 k^2 + 1/2 sum_(k=1)^15 k
        $
        Áp dụng công thức tổng lũy thừa:
        $
          sum_(k=1)^15 k &= (15 dot 16)/2 = 120 \
          sum_(k=1)^15 k^2 &= (15 dot 16 dot 31)/6 = 1240
        $
        Tính tổng số bi:
        $ S = 1/2 dot 1240 + 1/2 dot 120 = 620 + 60 = 680 $
        
        Mô hình xếp các viên bi thành hình tháp (4 hàng đầu):
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Row 1 (top)
            circle((0, 1.2), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            
            // Row 2
            circle((-0.22, 0.8), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            circle((0.22, 0.8), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            
            // Row 3
            circle((-0.44, 0.4), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            circle((0, 0.4), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            circle((0.44, 0.4), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            
            // Row 4
            circle((-0.66, 0.0), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            circle((-0.22, 0.0), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            circle((0.22, 0.0), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
            circle((0.66, 0.0), radius: 0.18, fill: rgb("#eef4ff"), stroke: 1pt + blue)
          })
        ]
    ]
)

// TL 6
#tln([Một người vay ngân hàng $1$ tỷ đồng với lãi suất $1\%$/tháng. Mỗi tháng, người đó trả một khoản tiền cố định $X$ (đồng). Biết rằng sau đúng $12$ tháng, người đó trả hết hoàn toàn nợ (số dư bằng $0$). Giá trị của $X$ (làm tròn đến hàng đơn vị) là bao nhiêu?],
    [88848789],
    loigiai: [
        Dãy số nợ còn lại sau $n$ tháng được mô tả theo công thức tổng quát:
        $
          D_n = D_0 (1+r)^n - X dot ((1+r)^n - 1) / r
        $
        Sau 12 tháng trả hết nợ ($D_12 = 0$):
        $
          D_0 (1+r)^12 = X dot ((1+r)^12 - 1) / r &<=> X = (D_0 r (1+r)^12) / ((1+r)^12 - 1)
        $
        Thay các giá trị $D_0 = 10^9$ đồng, $r = 0.01$, $n = 12$ vào công thức:
        $
          X &= (10^9 dot 0.01 dot (1.01)^12) / ((1.01)^12 - 1) \
            &= (10^7 dot 1.126825) / 0.126825 \
            &approx 88848788.6 " (đồng)"
        $
        Làm tròn đến hàng đơn vị là $88 848 789$ đồng.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
