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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 02)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho dãy số $(u_n)$ xác định bởi $u_n = (a n + 2) / (n + 1)$, với $a$ là tham số thực. Để dãy số $(u_n)$ là một dãy số tăng, điều kiện của $a$ là],
    (
        [$a < 2$.],
        True([$a > 2$.]),
        [$a < 1$.],
        [$a > 1$.]
    ),
    loigiai: [
        Xét hàm số liên tục tương ứng $f(x) = (a x + 2) / (x + 1)$ với $x >= 1$.
        Ta có đạo hàm của hàm số:
        $
          f'(x) &= (a dot (x+1) - 1 dot (a x + 2)) / (x + 1)^2 \
                &= (a x + a - a x - 2) / (x + 1)^2 \
                &= (a - 2) / (x + 1)^2
        $
        Để dãy số $(u_n)$ là một dãy số tăng thì hàm số $f(x)$ phải đồng biến trên $[1; +oo)$, suy ra:
        $
          f'(x) > 0 &<=> a - 2 > 0 \
                    &<=> a > 2
        $
    ]
)

// TN 2
#tn([Ba số thực $x, y, z$ (khác $0$) theo thứ tự lập thành một cấp số cộng. Mệnh đề nào sau đây là hệ quả của giả thiết trên?],
    (
        [$x^2 + z^2 = 2y^2$.],
        [$x z = y^2$.],
        [$1/x + 1/z = 2/y$.],
        True([$x + z = 2y$.])
    ),
    loigiai: [
        Theo định nghĩa và tính chất cơ bản của ba số hạng liên tiếp trong một cấp số cộng, số đứng giữa bằng trung bình cộng của hai số hai bên:
        $
          (x + z) / 2 = y <=> x + z = 2y
        $
    ]
)

// TN 3
#tn([Cho một cấp số nhân có các số hạng đều dương. Biết rằng tổng của hai số hạng đầu bằng $3$ và tổng của số hạng thứ ba và số hạng thứ tư bằng $12$. Công bội $q$ của cấp số nhân đó là],
    (
        [$q = 4$.],
        True([$q = 2$.]),
        [$q = 3$.],
        [$q = 1/2$.]
    ),
    loigiai: [
        Theo đề bài ta có hệ phương trình:
        $
          cases(
            u_1 + u_2 = 3,
            u_3 + u_4 = 12
          )
          <=>
          cases(
            u_1 (1 + q) = 3 quad (1),
            u_1 q^2 (1 + q) = 12 quad (2)
          )
        $
        Vì các số hạng đều dương nên $u_1 > 0$ và $q > 0$, suy ra $1 + q != 0$.
        Chia vế theo vế phương trình $(2)$ cho $(1)$ ta được:
        $
          q^2 = 12/3 = 4 <=> q = 2 " (do " q > 0)
        $
    ]
)

// TN 4
#tn([Cho dãy số $(u_n)$ xác định bởi $u_1 = 2$ và $u_(n+1) = u_n + 3n - 1$ với mọi $n >= 1$. Biểu thức nào sau đây biểu diễn chính xác số hạng tổng quát $u_n$?],
    (
        [$u_n = 3n^2 - 2n + 1$.],
        True([$u_n = 1/2 (3n^2 - 5n + 6)$.]),
        [$u_n = 3n - 1$.],
        [$u_n = 1/2 (3n^2 - n + 2)$.]
    ),
    loigiai: [
        Hiệu hai số hạng liên tiếp là:
        $ u_(n+1) - u_n = 3n - 1 $
        Cộng vế theo vế $n-1$ hệ thức liên tiếp từ $k=1$ đến $k=n-1$:
        $
          u_n - u_1 &= sum_(k=1)^(n-1) (3k - 1) \
                    &= 3 sum_(k=1)^(n-1) k - sum_(k=1)^(n-1) 1 \
                    &= 3 dot ((n-1)n)/2 - (n-1)
        $
        Thay $u_1 = 2$ vào và quy đồng mẫu số:
        $
          u_n &= 2 + (3n^2 - 3n)/2 - n + 1 \
              &= (4 + 3n^2 - 3n - 2n + 2) / 2 \
              &= (3n^2 - 5n + 6) / 2
        $
    ]
)

// TN 5
#tn([Gọi $S_n$ là tổng của $n$ số hạng đầu tiên của một cấp số cộng. Biết $S_n = 3n^2 - 2n$ với mọi $n >= 1$. Công sai $d$ của cấp số cộng đó là],
    (
        [$d = 3$.],
        [$d = 4$.],
        [$d = 5$.],
        True([$d = 6$.])
    ),
    loigiai: [
        Ta tính hai số hạng đầu tiên của cấp số cộng từ công thức $S_n$:
        - Với $n = 1$: $u_1 = S_1 = 3 dot 1^2 - 2 dot 1 = 1$.
        - Với $n = 2$: $S_2 = u_1 + u_2 = 3 dot 2^2 - 2 dot 2 = 8$.
        Suy ra:
        $ u_2 = S_2 - S_1 = 8 - 1 = 7 $
        Công sai của cấp số cộng này bằng:
        $ d = u_2 - u_1 = 7 - 1 = 6 $
    ]
)

// TN 6
#tn([Một doanh nghiệp dự định mua một cỗ máy. Do hao mòn, giá trị của cỗ máy giảm $10\%$ mỗi năm so với năm liền trước. Gọi $V_n$ là giá trị cỗ máy sau $n$ năm. Dãy số $(V_n)$ lập thành],
    (
        [$u_n = V_0 - 0.1n$.],
        True([Cấp số nhân với công bội $q = 0.9$.]),
        [Cấp số cộng với công sai $d = -0.1$.],
        [Cấp số nhân với công bội $q = 0.1$.]
    ),
    loigiai: [
        Giá trị ban đầu của cỗ máy là $V_0$.
        Sau 1 năm, giá trị cỗ máy giảm đi $10\%$ nên còn lại:
        $ V_1 = V_0 - 0.1 V_0 = 0.9 V_0 $
        Sau $n$ năm, giá trị cỗ máy tương tự thu được:
        $ V_n = 0.9 V_(n-1) $
        Mối liên hệ giữa các số hạng cho thấy dãy $(V_n)$ lập thành một cấp số nhân có công bội $q = 0.9$.
    ]
)

// TN 7
#tn([Tổng $S = x + x^2 + x^3 + ... + x^100$ ($x != 1$) bằng],
    (
        [$(x^(101) - 1) / (x - 1)$.],
        True([$x (x^100 - 1) / (x - 1)$.]),
        [$(x^100 - 1) / (x - 1)$.],
        [$x (x^101 - 1) / (x - 1)$.]
    ),
    loigiai: [
        Đây là tổng 100 số hạng đầu của cấp số nhân có số hạng đầu $u_1 = x$ và công bội $q = x$.
        Áp dụng công thức tính tổng $S_n$:
        $
          S_100 &= u_1 dot (1 - q^100) / (1 - q) \
                &= x dot (1 - x^100) / (1 - x) \
                &= x dot (x^100 - 1) / (x - 1)
        $
    ]
)

// TN 8
#tn([Độ dài ba cạnh của một tam giác vuông lập thành một cấp số cộng. Tỉ số các cạnh của tam giác vuông đó là],
    (
        [$1 : 2 : 3$.],
        True([$3 : 4 : 5$.]),
        [$5 : 12 : 13$.],
        [$7 : 24 : 25$.]
    ),
    loigiai: [
        Gọi độ dài ba cạnh của tam giác vuông là $a - d$, $a$, $a + d$ (với $a > d > 0$).
        Theo định lý Pytago, cạnh huyền là cạnh lớn nhất $a + d$:
        $
          (a - d)^2 + a^2 = (a + d)^2 &<=> a^2 - 2a d + d^2 + a^2 = a^2 + 2a d + d^2 \
                                     &<=> a^2 - 4a d = 0 \
                                     &<=> a(a - 4d) = 0
        $
        Vì $a > 0$ nên ta được $a = 4d$.
        Thay lại vào ba cạnh của tam giác vuông:
        - Cạnh thứ nhất: $a - d = 4d - d = 3d$.
        - Cạnh thứ hai: $a = 4d$.
        - Cạnh thứ ba: $a + d = 4d + d = 5d$.
        Tỉ số các cạnh tương ứng là $3d : 4d : 5d = 3 : 4 : 5$.
    ]
)

// TN 9
#tn([Nếu ba số thực $a, b, c$ lập thành cấp số nhân thì biểu thức nào sau đây chắc chắn đúng?],
    (
        True([$a c = b^2$.]),
        [$a c = 2b$.],
        [$a + c = 2b$.],
        [$a b = c^2$.]
    ),
    loigiai: [
        Theo tính chất cơ bản của ba số hạng liên tiếp trong một cấp số nhân, tích của hai số hạng hai bên luôn bằng bình phương số hạng ở giữa: $a c = b^2$.
    ]
)

// TN 10
#tn([Một khu rừng có trữ lượng gỗ hiện tại là $100 000" m"^3$. Mỗi năm, khối lượng gỗ trong rừng tăng thêm $5\%$ nhờ cây sinh trưởng. Hàm số nào dưới đây biểu diễn trữ lượng gỗ $V(n)$ sau $n$ năm?],
    (
        [$V(n) = 100 000 + 5000 n$.],
        [$V(n) = 100 000 dot (0.05)^n$.],
        [$V(n) = 100 000 dot 1.5^n$.],
        True([$V(n) = 100 000 dot (1.05)^n$.])
    ),
    loigiai: [
        Ban đầu trữ lượng là $V_0 = 100 000" m"^3$.
        - Sau 1 năm: $V_1 = V_0 + V_0 dot 5\% = V_0 dot 1.05$.
        - Sau 2 năm: $V_2 = V_1 dot 1.05 = V_0 dot (1.05)^2$.
        Tổng quát sau $n$ năm, trữ lượng gỗ thu được tuân theo cấp số nhân là:
        $ V(n) = 100 000 dot (1.05)^n $
    ]
)

// TN 11
#tn([Cho ba số $x, 5, 2y$ lập thành cấp số cộng và ba số $x, 4, 2y$ lập thành cấp số nhân. Giá trị của $|x - 2y|$ bằng bao nhiêu? (Giả sử các số hạng đều khác $0$).],
    (
        [$2$.],
        [$4$.],
        True([$6$.]),
        [$8$.]
    ),
    loigiai: [
        Theo tính chất cấp số cộng và cấp số nhân ta có hệ phương trình:
        $
          cases(
            x + 2y = 10,
            x dot 2y = 4^2 = 16
          )
        $
        Theo định lý Vi-ét đảo, $x$ và $2y$ là các nghiệm của phương trình bậc hai:
        $
          t^2 - 10t + 16 = 0 &<=> (t - 2)(t - 8) = 0 \
                             &<=> cases(t = 2, t = 8)
        $
        Do đó, các cặp nghiệm là $(x, 2y) = (2, 8)$ hoặc $(x, 2y) = (8, 2)$.
        Khoảng cách hiệu tuyệt đối là:
        $
          |x - 2y| = |2 - 8| = 6
        $
    ]
)

// TN 12
#tn([Người ta thiết kế một bậc thang gồm $15$ bậc. Bậc thấp nhất rộng $1.2$ mét, và cứ lên mỗi bậc thì chiều rộng lại giảm đi một khoảng cách $d$ mét. Biết bậc cao nhất rộng $0.5$ mét. Giá trị của $d$ là],
    (
        [$0.02$.],
        True([$0.05$.]),
        [$0.04$.],
        [$0.1$.]
    ),
    loigiai: [
        Độ rộng của các bậc thang lập thành một cấp số cộng giảm $(u_n)$ có:
        - Số hạng đầu $u_1 = 1.2$ (bậc thấp nhất).
        - Số hạng thứ 15 $u_15 = 0.5$ (bậc cao nhất).
        - Công sai là $-d$.
        Ta giải phương trình:
        $
          u_15 = u_1 + 14(-d) &<=> 0.5 = 1.2 - 14d \
                              &<=> 14d = 0.7 \
                              &<=> d = 0.05
        $
        
        Bản vẽ mô phỏng bậc thang giảm dần chiều rộng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let x = 0.0
            let y = 0.0
            let w = 1.2
            let h = 0.2
            let steps = 6
            
            line((-0.5, 0), (4.5, 0), stroke: 1pt + gray)
            
            for i in range(0, steps) {
              let width = 1.2 - i * 0.12
              rect((x, y), (x + width, y + h), stroke: 1pt + black, fill: rgb("#eef4ff"))
              x = x + 0.15
              y = y + h
            }
            
            content((0.6, -0.35), [Bậc 1: 1.2m])
            content((x + 0.3, y + 0.2), [Bậc 15: 0.5m])
          })
        ]
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho dãy số $(u_n)$ thỏa mãn $u_1 = 1$ và $u_n = 2u_(n-1) + 1$ với mọi $n >= 2$. Đặt $v_n = u_n + 1$. Các phát biểu sau đúng hay sai?], (
        True([Dãy số $(v_n)$ là một cấp số nhân.]),
        [Công bội của dãy $(v_n)$ là $q = 1/2$.],
        True([Số hạng tổng quát của $(u_n)$ là $u_n = 2^n - 1$.]),
        True([Tổng $n$ số hạng đầu tiên của dãy $(u_n)$ là $S_n = 2^(n+1) - n - 2$.])
    ), 
    loigiai: [
        - *a)* Đúng. Ta biến đổi hệ thức truy hồi của dãy $(v_n)$:
          $
            v_n &= u_n + 1 \
                &= 2u_(n-1) + 1 + 1 \
                &= 2(u_(n-1) + 1) = 2v_(n-1)
          $
          Vậy $(v_n)$ là cấp số nhân.
        - *b)* Sai. Công bội thu được của cấp số nhân là $q = 2$.
        - *c)* Đúng. Với $v_1 = u_1 + 1 = 2$, số hạng tổng quát là $v_n = v_1 q^(n-1) = 2 dot 2^(n-1) = 2^n$.
          Suy ra:
          $ u_n = v_n - 1 = 2^n - 1 $
        - *d)* Đúng. Tính tổng $S_n$:
          $
            S_n &= sum_(k=1)^n u_k = sum_(k=1)^n (2^k - 1) \
                &= (2(2^n - 1))/(2 - 1) - n \
                &= 2^(n+1) - n - 2
          $
    ]
)

// DS 2
#ds([Cho phương trình $x^3 - 3x^2 - 9x + m = 0$ có ba nghiệm phân biệt lập thành cấp số cộng. Các phát biểu sau đúng hay sai?], (
        True([Nghiệm ở giữa của phương trình chắc chắn bằng $1$.]),
        True([Tổng ba nghiệm của phương trình bằng $3$.]),
        True([Giá trị của tham số $m$ bằng $11$.]),
        [Công sai của cấp số cộng tạo bởi ba nghiệm là $d = 2$.]
    ), 
    loigiai: [
        Gọi ba nghiệm lập thành cấp số cộng tăng là $x_1 = a - d$, $x_2 = a$, $x_3 = a + d$ (với $d > 0$).
        - *a, b)* Đúng. Theo hệ thức Vi-ét cho phương trình bậc ba, tổng của ba nghiệm là:
          $
            x_1 + x_2 + x_3 = -(-3)/1 = 3 &<=> 3a = 3 \
                                         &<=> a = 1
          $
          Nghiệm ở giữa là $x_2 = a = 1$.
        - *c)* Đúng. Vì $x = 1$ là một nghiệm của phương trình nên ta có:
          $
            1^3 - 3 dot 1^2 - 9 dot 1 + m = 0 &<=> 1 - 3 - 9 + m = 0 \
                                             &<=> m = 11
          $
        - *d)* Sai. Thay $m=11$ vào phương trình, ta giải tìm ba nghiệm:
          $
            x^3 - 3x^2 - 9x + 11 = 0 &<=> (x-1)(x^2 - 2x - 11) = 0 \
                                     &<=> cases(x = 1, x = 1 +- 2sqrt(3))
          $
          Ba nghiệm là $1 - 2sqrt(3), 1, 1 + 2sqrt(3)$.
          Công sai của cấp số cộng này là $d = 2sqrt(3)$ (không phải bằng 2).
    ]
)

// DS 3
#ds([Một dự án trồng rừng dự định năm thứ nhất trồng được $500$ hecta, và mỗi năm sau sẽ trồng được diện tích nhiều hơn năm trước là $10\%$. Gọi $S_n$ là tổng diện tích rừng đã trồng được sau $n$ năm. Các phát biểu sau đúng hay sai?], (
        [Diện tích rừng trồng được trong năm thứ $n$ lập thành cấp số nhân với công bội $q = 0.1$.],
        True([Năm thứ $3$ diện tích rừng trồng được là $605$ hecta.]),
        True([Công thức tính tổng diện tích rừng sau $n$ năm là $S_n = 5000 (1.1^n - 1)$.]),
        True([Cần ít nhất $8$ năm để tổng diện tích rừng trồng được vượt quá $5000$ hecta.])
    ), 
    loigiai: [
        Gọi $u_n$ là diện tích trồng trong năm thứ $n$.
        Ta có $u_1 = 500$, và mỗi năm tăng $10\%$ nên:
        $ u_(n+1) = u_n + 0.1 u_n = 1.1 u_n $
        - *a)* Sai. Dãy $(u_n)$ là cấp số nhân có công bội $q = 1.1$.
        - *b)* Đúng. Diện tích rừng năm thứ 3:
          $ u_3 = u_1 q^2 = 500 dot (1.1)^2 = 605 " (ha)" $
        - *c)* Đúng. Tính tổng diện tích $S_n$:
          $
            S_n &= u_1 dot (1 - q^n) / (1 - q) \
                &= 500 dot (1 - 1.1^n) / (1 - 1.1) \
                &= 5000 (1.1^n - 1)
          $
        - *d)* Đúng. Giải bất phương trình $S_n > 5000$:
          $
            5000(1.1^n - 1) > 5000 &<=> 1.1^n - 1 > 1 \
                                   &<=> 1.1^n > 2 \
                                   &<=> n > log_1.1 (2) approx 7.27
          $
          Do $n$ nguyên dương nên tối thiểu cần $8$ năm.
    ]
)

// DS 4
#ds([Cho dãy số $(u_n)$ với $u_n = (-1)^n (2n + 1)$. Các phát biểu sau đúng hay sai?], (
        [Dãy số $(u_n)$ là dãy số giảm.],
        [Dãy số $(u_n)$ bị chặn dưới nhưng không bị chặn trên.],
        True([$u_2 + u_3 = -2$.]),
        True([Dãy số này không phải là cấp số cộng cũng không phải là cấp số nhân.])
    ), 
    loigiai: [
        Liệt kê một số số hạng của dãy: $u_1 = -3, u_2 = 5, u_3 = -7, u_4 = 9, u_5 = -11, ...$
        - *a)* Sai. Dãy số đan dấu liên tục nên không thể là dãy giảm.
        - *b)* Sai.
          Khi $n$ lẻ, $u_n = -(2n+1) -> -oo$ khi $n -> +oo$. Dãy không bị chặn dưới.
          Khi $n$ chẵn, $u_n = 2n + 1 -> +oo$ khi $n -> +oo$. Dãy không bị chặn trên.
        - *c)* Đúng. Ta tính:
          $ u_2 + u_3 = 5 + (-7) = -2 $
        - *d)* Đúng. Dễ dàng thấy các hiệu số hạng và tỉ số hạng liên tiếp đều không phải hằng số.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho cấp số cộng $(u_n)$ thỏa mãn $u_2 - u_3 + u_5 = 10$ và $u_4 + u_6 = 26$. Tính số hạng $u_10$.],
    [28],
    loigiai: [
        Đưa hệ thức về $u_1$ và $d$:
        $
          cases(
            (u_1 + d) - (u_1 + 2d) + (u_1 + 4d) = 10,
            (u_1 + 3d) + (u_1 + 5d) = 26
          )
          <=>
          cases(
            u_1 + 3d = 10,
            2u_1 + 8d = 26
          )
        $
        Trần vế hệ phương trình ta tìm được $u_1 = 1$, $d = 3$.
        Tính số hạng thứ 10:
        $ u_10 = u_1 + 9d = 1 + 9 dot 3 = 28 $
    ]
)

// TL 2
#tln([Bốn số tạo thành một cấp số nhân. Biết tổng của số hạng thứ nhất và thứ ba bằng $20$, tổng của số hạng thứ hai và thứ tư bằng $40$. Tìm tổng $S$ của cả bốn số hạng đó.],
    [60],
    loigiai: [
        Gọi bốn số hạng lần lượt là $u_1, u_2, u_3, u_4$ có công bội $q$.
        Ta có hệ phương trình:
        $
          cases(
            u_1 + u_3 = 20,
            u_2 + u_4 = 40
          )
          <=>
          cases(
            u_1 (1 + q^2) = 20 quad (1),
            u_1 q (1 + q^2) = 40 quad (2)
          )
        $
        Chia vế theo vế phương trình $(2)$ cho $(1)$ ta được:
        $ q = 2 $
        Thay $q = 2$ vào phương trình $(1)$, ta được $u_1 = 4$.
        Cấp số nhân gồm các số: $4, 8, 16, 32$.
        Tổng của 4 số hạng là:
        $ S = 4 + 8 + 16 + 32 = 60 $
    ]
)

// TL 3
#tln([Một công ty khai thác quặng, mỗi năm sản lượng khai thác bị giảm đi $10\%$ so với năm trước do cạn kiệt tài nguyên. Năm đầu tiên công ty khai thác được $1000$ tấn. Giả sử quá trình khai thác diễn ra vô hạn, tổng khối lượng quặng công ty có thể khai thác được là bao nhiêu tấn?],
    [10000],
    loigiai: [
        Sản lượng quặng khai thác được hàng năm lập thành một cấp số nhân lùi vô hạn với:
        - Số hạng đầu: $u_1 = 1000$ (tấn).
        - Công bội: $q = 1 - 0.1 = 0.9$ (thỏa mãn $|q| < 1$).
        Tổng khối lượng quặng công ty khai thác được khi quá trình diễn ra vô hạn là:
        $
          S = u_1 / (1 - q) = 1000 / (1 - 0.9) = 1000 / 0.1 = 10000 " (tấn)"
        $
    ]
)

// TL 4
#tln([Một tờ giấy có độ dày $0.1$ mm. Khi gập đôi tờ giấy, độ dày tăng lên gấp đôi. Hỏi nếu gập đôi tờ giấy liên tiếp $12$ lần thì độ dày của nó đạt bao nhiêu mm?],
    [409.6],
    loigiai: [
        Độ dày ban đầu là $0.1$ mm. Mỗi lần gập đôi tờ giấy, độ dày lại tăng gấp 2 lần.
        Đây là cấp số nhân có số hạng đầu $u_1 = 0.1 dot 2 = 0.2$ (sau lần gập thứ 1) và công bội $q = 2$.
        Độ dày sau 12 lần gập đôi là:
        $ H = 0.1 dot 2^12 = 0.1 dot 4096 = 409.6 " (mm)" $
    ]
)

// TL 5
#tln([Trong một trò chơi, người chơi bắt đầu với số tiền thưởng là $10 000$ đồng. Nếu thắng vòng $1$, họ được cộng thêm một số tiền thưởng. Bắt đầu từ vòng $2$, nếu thắng, số tiền thưởng được cộng thêm sẽ gấp ba lần số tiền thưởng cộng thêm ở vòng ngay trước đó. Sau khi thắng $4$ vòng liên tiếp, tổng số tiền thưởng người đó có là $210 000$ đồng. Hỏi số tiền thưởng cộng thêm ở vòng $1$ là bao nhiêu đồng?],
    [5000],
    loigiai: [
        Gọi $a$ là số tiền thưởng cộng thêm ở vòng 1 ($a > 0$).
        Số tiền thưởng cộng thêm từ vòng 1 đến vòng 4 lập thành cấp số nhân có số hạng đầu là $a$ và công bội $q = 3$:
        $ a, quad 3a, quad 9a, quad 27a $
        Tổng tiền thưởng người chơi có sau 4 vòng bao gồm số tiền ban đầu cùng với tổng các khoản thưởng cộng thêm:
        $
          10000 + (a + 3a + 9a + 27a) = 210000 &<=> 40a = 200000 \
                                               &<=> a = 5000
        $
        Vậy số tiền thưởng cộng thêm ở vòng 1 là 5000 đồng.
    ]
)

// TL 6
#tln([Biết tam giác vuông $A B C$ có số đo ba góc (tính bằng độ) lập thành một cấp số cộng. Trong đó có một góc nhỏ nhất. Số đo của góc nhỏ nhất bằng bao nhiêu độ?],
    [30],
    loigiai: [
        Gọi số đo ba góc lập thành cấp số cộng là $a-d, a, a+d$ (với $d > 0$).
        Tổng ba góc của một tam giác là $180^o$:
        $
          (a-d) + a + (a+d) = 180^o &<=> 3a = 180^o <=> a = 60^o
        $
        Do tam giác $A B C$ vuông nên góc lớn nhất của tam giác phải là $90^o$:
        $
          a + d = 90^o &<=> 60^o + d = 90^o \
                       &<=> d = 30^o
        $
        Số đo góc nhỏ nhất là:
        $ a - d = 60^o - 30^o = 30^o $
        
        Hình vẽ minh họa tam giác vuông có các góc là cấp số cộng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let A = (0.0, 1.732)
            let B = (0.0, 0.0)
            let C = (3.0, 0.0)
            
            line(A, B, C, close: true, stroke: 1.2pt + black)
            
            content(A, [A], anchor: "south")
            content(B, [B], anchor: "north-east")
            content(C, [C], anchor: "north-west")
            
            rect((0,0), (0.25, 0.25), stroke: 0.8pt + black)
            
            arc(C, start: 150deg, stop: 180deg, radius: 0.5, stroke: 0.8pt + blue)
            arc(A, start: 270deg, stop: 330deg, radius: 0.4, stroke: 0.8pt + blue)
            
            content((0.35, 1.1), [$60^o$])
            content((2.25, 0.25), [$30^o$])
          })
        ]
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
