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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 05)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Biết rằng $(u_n)$ là một dãy số tăng gồm các số thực dương. Khẳng định nào sau đây là đúng đối với dãy số $v_n = 1 / u_n$?],
    (
        [$(v_n)$ là một dãy số tăng.],
        True([$(v_n)$ là một dãy số giảm và bị chặn dưới bởi $0$.]),
        [$(v_n)$ vừa không tăng vừa không giảm.],
        [$(v_n)$ là một cấp số nhân lùi vô hạn.]
    ),
    loigiai: [
        Vì $(u_n)$ là dãy tăng và gồm các số hạng dương nên ta có:
        $ 0 < u_1 < u_2 < u_3 < ... < u_n < u_(n+1) < ... $
        Lấy nghịch đảo các số hạng, chiều bất đẳng thức đổi chiều:
        $ 1/u_1 > 1/u_2 > 1/u_3 > ... > 1/u_n > 1/u_(n+1) > ... > 0 $
        Vậy dãy số $(v_n)$ là một dãy số giảm và bị chặn dưới bởi số $0$.
    ]
)

// TN 2
#tn([Cho cấp số cộng $(u_n)$. Biết rằng tổng của $m$ số hạng đầu tiên bằng $n$ và tổng của $n$ số hạng đầu tiên bằng $m$ (với $m != n$). Tổng của $m+n$ số hạng đầu tiên của cấp số cộng đó bằng bao nhiêu?],
    (
        [$m + n$.],
        [$m - n$.],
        [$-(m - n)$.],
        True([$-(m + n)$.])
    ),
    loigiai: [
        Theo giả thiết, ta có hệ phương trình:
        $
          cases(
            S_m = n,
            S_n = m
          )
          <=>
          cases(
            m/2 (2u_1 + (m-1)d) = n,
            n/2 (2u_1 + (n-1)d) = m
          )
          <=>
          cases(
            2u_1 + (m-1)d = (2n)/m,
            2u_1 + (n-1)d = (2m)/n
          )
        $
        Trừ vế theo vế hai phương trình trên, ta được:
        $
          (m-n)d &= (2n)/m - (2m)/n \
                 &= (2(n^2 - m^2)) / (m n) \
                 &= (-2(m-n)(m+n)) / (m n)
        $
        Vì $m != n$ nên $m-n != 0$, suy ra:
        $ d = (-2(m+n))/(m n) $
        Tính tổng $S_(m+n)$:
        $
          S_(m+n) &= (m+n)/2 [2u_1 + (m+n-1)d] \
                  &= (m+n)/2 [ (2u_1 + (m-1)d) + n d ] \
                  &= (m+n)/2 [ (2n)/m + n dot (-2(m+n))/(m n) ] \
                  &= (m+n)/2 [ (2n)/m - (2(m+n))/m ] \
                  &= (m+n)/2 [ (2n - 2m - 2n)/m ] \
                  &= (m+n)/2 dot (-2) \
                  &= -(m+n)
        $
    ]
)

// TN 3
#tn([Tìm tất cả các giá trị của tham số $m$ để phương trình $x^4 - 2(m+1)x^2 + 2m + 1 = 0$ có $4$ nghiệm phân biệt lập thành cấp số cộng.],
    (
        [$m = 4$.],
        True([$m = 4$ hoặc $m = -4/9$.]),
        [$m = 4$ hoặc $m = 4/9$.],
        [$m = -4$.]
    ),
    loigiai: [
        Đặt $t = x^2 >= 0$. Phương trình trở thành:
        $ t^2 - 2(m+1)t + 2m + 1 = 0 $
        Để phương trình ban đầu có 4 nghiệm phân biệt thì phương trình bậc hai theo $t$ phải có 2 nghiệm phân biệt dương $0 < t_1 < t_2$.
        Điều kiện:
        $ Delta' = (m+1)^2 - (2m+1) = m^2 > 0 <=> m != 0 $
        Khi đó, hai nghiệm là:
        $
          t_1 = m+1-m = 1 \
          t_2 = m+1+m = 2m+1
        $
        - *Trường hợp 1:* $0 < t_1 < t_2 <=> 0 < 1 < 2m+1 <=> m > 0$.
          Nghiệm của phương trình ban đầu là: $-sqrt(2m+1), -1, 1, sqrt(2m+1)$.
          Để các nghiệm lập thành cấp số cộng:
          $
            1 - (-1) = sqrt(2m+1) - 1 &<=> 2 = sqrt(2m+1) - 1 \
                                      &<=> sqrt(2m+1) = 3 \
                                      &<=> 2m+1 = 9 <=> m = 4 " (thỏa mãn)"
          $
        - *Trường hợp 2:* $0 < t_2 < t_1 <=> 0 < 2m+1 < 1 <=> -1/2 < m < 0$.
          Nghiệm của phương trình ban đầu là: $-1, -sqrt(2m+1), sqrt(2m+1), 1$.
          Để các nghiệm lập thành cấp số cộng:
          $
            sqrt(2m+1) - (-sqrt(2m+1)) = 1 - sqrt(2m+1) &<=> 2sqrt(2m+1) = 1 - sqrt(2m+1) \
                                                        &<=> 3sqrt(2m+1) = 1 \
                                                        &<=> sqrt(2m+1) = 1/3 \
                                                        &<=> 2m+1 = 1/9 <=> m = -4/9 " (thỏa mãn)"
          $
        Vậy $m = 4$ hoặc $m = -4/9$.
    ]
)

// TN 4
#tn([Biết rằng chu vi của một tam giác vuông lập thành cấp số nhân với công bội $q$. Khẳng định nào sau đây mô tả đúng nhất về $q$?],
    (
        [$q = (1 + sqrt(5))/2$.],
        True([$q$ là nghiệm của phương trình $q^4 = 1 + q^2$.]),
        [$q = 2$.],
        [$q$ không tồn tại.]
    ),
    loigiai: [
        Gọi ba cạnh của tam giác vuông là $a, a q, a q^2$ (với $q > 1$, $a > 0$).
        Theo định lý Pytago, cạnh huyền là cạnh lớn nhất $a q^2$:
        $
          a^2 + (a q)^2 = (a q^2)^2 &<=> a^2 (1 + q^2) = a^2 q^4 \
                                    &<=> 1 + q^2 = q^4
        $
        Vậy $q$ là nghiệm của phương trình $q^4 = 1 + q^2$.
    ]
)

// TN 5
#tn([Xét cấp số nhân vô hạn $(u_n)$ có công bội $q$ thỏa mãn $|q| < 1$. Gọi $S$ là tổng của cấp số nhân đó và $S_2$ là tổng các số hạng ở vị trí chẵn. Mối liên hệ nào sau đây là đúng?],
    (
        [$S_2 = S / (1+q)$.],
        [$S_2 = S q / (1-q)$.],
        True([$S_2 = (S q) / (1+q)$.]),
        [$S_2 = (S) / (1-q^2)$.]
    ),
    loigiai: [
        Tổng của cấp số nhân lùi vô hạn ban đầu:
        $ S = u_1 / (1-q) $
        Tổng các số hạng ở vị trí chẵn:
        $ S_2 = u_2 + u_4 + u_6 + ... = u_1 q + u_1 q^3 + u_1 q^5 + ... $
        Đây là một cấp số nhân lùi vô hạn có số hạng đầu là $u_1 q$ và công bội là $q^2$. Do đó:
        $
          S_2 &= (u_1 q) / (1 - q^2) \
              &= (u_1 q) / ((1-q)(1+q)) \
              &= (u_1 / (1-q)) dot (q / (1+q)) \
              &= (S q) / (1+q)
        $
    ]
)

// TN 6
#tn([Người ta sử dụng phương pháp chia đôi một đoạn thẳng. Bắt đầu với đoạn thẳng $A B$ có độ dài $L$. Bước 1, lấy trung điểm $M_1$. Bước 2, lấy trung điểm $M_2$ của $M_1 B$. Bước $n$, lấy trung điểm $M_n$ của $M_(n-1) B$. Tổng độ dài các đoạn $A M_1 + M_1 M_2 + M_2 M_3 + ... + M_(n-1) M_n$ khi $n -> +oo$ bằng],
    (
        [$L/2$.],
        True([$L$.]),
        [$2L$.],
        [$L / sqrt(2)$.]
    ),
    loigiai: [
        Độ dài đoạn đầu tiên: $A M_1 = L/2$.
        Độ dài đoạn thứ hai: $M_1 M_2 = 1/2 M_1 B = 1/2 (L/2) = L/4$.
        Độ dài đoạn thứ $k$: $M_(k-1) M_k = L / 2^k$.
        Tổng quãng đường:
        $
          S &= L/2 + L/4 + L/8 + ... \
            &= L/2 (1 + 1/2 + 1/4 + ...) \
            &= L/2 dot 1 / (1 - 1/2) \
            &= L
        $
        Minh họa quá trình chia đôi đoạn thẳng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Đoạn AB
            line((0, 0), (6, 0), stroke: 1.5pt + black)
            circle((0, 0), radius: 0.06, fill: black)
            circle((6, 0), radius: 0.06, fill: black)
            content((0, -0.35), [A])
            content((6, -0.35), [B])
            
            // Điểm M1
            circle((3, 0), radius: 0.06, fill: blue)
            content((3, -0.35), [$M_1$])
            
            // Điểm M2
            circle((4.5, 0), radius: 0.06, fill: blue)
            content((4.5, -0.35), [$M_2$])
            
            // Điểm M3
            circle((5.25, 0), radius: 0.06, fill: blue)
            content((5.25, -0.35), [$M_3$])
          })
        ]
    ]
)

// TN 7
#tn([Nếu ba số dương $x, y, z$ lập thành cấp số nhân thì biểu thức $P = ln x - 2 ln y + ln z$ có giá trị bằng bao nhiêu?],
    (
        [$1$.],
        [$ln(x y z)$.],
        True([$0$.]),
        [Không xác định.]
    ),
    loigiai: [
        Vì $x, y, z$ lập thành cấp số nhân nên ta có $y^2 = x z$.
        Biến đổi biểu thức $P$:
        $
          P &= ln x - 2 ln y + ln z \
            &= (ln x + ln z) - ln(y^2) \
            &= ln(x z) - ln(y^2) \
            &= ln(y^2) - ln(y^2) \
            &= 0
        $
    ]
)

// TN 8
#tn([Cho $x_1, x_2$ là các nghiệm của phương trình $x^2 - 3x + a = 0$ và $x_3, x_4$ là các nghiệm của phương trình $x^2 - 12x + b = 0$. Biết rằng $x_1, x_2, x_3, x_4$ theo thứ tự lập thành cấp số nhân tăng ngặt. Giá trị của $a + b$ là],
    (
        [$32$.],
        True([$34$.]),
        [$36$.],
        [$40$.]
    ),
    loigiai: [
        Theo định lý Vi-ét:
        $
          cases(
            x_1 + x_2 = 3,
            x_3 + x_4 = 12
          )
        $
        Vì $x_1, x_2, x_3, x_4$ lập thành cấp số nhân tăng ngặt có công bội $q > 1$, ta có:
        $
          x_2 = x_1 q, quad x_3 = x_1 q^2, quad x_4 = x_1 q^3
        $
        Thay vào hệ thức Vi-ét:
        $
          cases(
            x_1(1+q) = 3,
            x_1 q^2(1+q) = 12
          )
        $
        Chia phương trình dưới cho phương trình trên ta được:
        $ q^2 = 4 <=> q = 2 " (do " q > 1) $
        Từ đó suy ra $x_1 = 1$. Dãy số là $1, 2, 4, 8$.
        Các hệ số tự do là tích các nghiệm:
        $
          a &= x_1 x_2 = 1 dot 2 = 2 \
          b &= x_3 x_4 = 4 dot 8 = 32
        $
        Vậy $a + b = 34$.
    ]
)

// TN 9
#tn([Một công ty quyết định thưởng cuối năm cho nhân viên theo quy tắc: Năm đầu tiên thưởng $5$ triệu đồng, những năm sau mỗi năm tăng thêm $1$ triệu đồng so với năm liền trước. Hỏi sau $n$ năm, tổng số tiền thưởng mà một nhân viên nhận được vượt quá $100$ triệu đồng thì $n$ tối thiểu bằng bao nhiêu?],
    (
        [$10$.],
        True([$11$.]),
        [$12$.],
        [$13$.]
    ),
    loigiai: [
        Số tiền thưởng mỗi năm lập thành cấp số cộng với $u_1 = 5$, công sai $d = 1$.
        Tổng số tiền thưởng nhận được sau $n$ năm là:
        $
          S_n &= n/2 [2u_1 + (n-1)d] \
              &= n/2 [10 + n - 1] \
              &= (n(n+9))/2
        $
        Yêu cầu bài toán $S_n > 100$:
        $
          (n(n+9))/2 > 100 &<=> n^2 + 9n - 200 > 0 \
                           &<=> n > (-9 + sqrt(881))/2 approx 10.34
        $
        Vì $n$ là số nguyên nên giá trị nhỏ nhất của $n$ là $11$.
    ]
)

// TN 10
#tn([Cho dãy số $(u_n)$ xác định bởi $u_n = sin(n pi/2)$. Khẳng định nào sau đây là sai?],
    (
        [Dãy số $(u_n)$ bị chặn.],
        [Dãy số $(u_n)$ không phải là một cấp số nhân.],
        True([Dãy số $(u_n)$ luôn chứa các số hạng dương và âm luân phiên liên tiếp.]),
        [Tồn tại vô số số hạng của dãy bằng $0$.]
    ),
    loigiai: [
        Ta liệt kê các số hạng đầu tiên của dãy số:
        $
          u_1 &= sin(pi/2) = 1 \
          u_2 &= sin(pi) = 0 \
          u_3 &= sin(3pi/2) = -1 \
          u_4 &= sin(2pi) = 0 \
          u_5 &= sin(5pi/2) = 1 \
          u_6 &= sin(3pi) = 0 \
          ...
        $
        Nhận xét chu kỳ của dãy số là: $1, 0, -1, 0, 1, 0, -1, ...$
        - *a)* Đúng, các số hạng của dãy luôn thuộc đoạn $[-1, 1]$ nên dãy số bị chặn.
        - *b)* Đúng, do có các số hạng bằng $0$ nên dãy số này không thể là một cấp số nhân.
        - *c)* Sai, giữa số hạng dương và số hạng âm luôn xen kẽ số $0$ chứ không phải luân phiên liên tục.
        - *d)* Đúng, tất cả các số hạng có chỉ số chẵn $u_(2k) = 0$.
    ]
)

// TN 11
#tn([Một đa giác lồi có các góc trong (tính bằng độ) lập thành một cấp số cộng với công sai $d = 5^o$. Biết góc nhỏ nhất của đa giác đó là $120^o$. Hỏi đa giác đó có bao nhiêu cạnh?],
    (
        True([$9$ cạnh.]),
        [$16$ cạnh.],
        [$9$ cạnh hoặc $16$ cạnh.],
        [$12$ cạnh.]
    ),
    loigiai: [
        Tổng các góc trong của đa giác lồi $n$ cạnh là:
        $ S_n = (n-2) dot 180^o $
        Theo công thức cấp số cộng có $u_1 = 120^o$, $d = 5^o$:
        $
          S_n &= n/2 [2u_1 + (n-1)d] \
              &= n/2 [240 + 5(n-1)] \
              &= n/2 (5n + 235)
        $
        Ta có phương trình:
        $
          (n-2) dot 180 = n/2 (5n + 235) &<=> 360n - 720 = 5n^2 + 235n \
                                         &<=> 5n^2 - 125n + 720 = 0 \
                                         &<=> n^2 - 25n + 144 = 0 \
                                         &<=> cases(n = 9, n = 16)
        $
        - Với $n = 16$, góc lớn nhất là: $u_16 = 120^o + 15 dot 5^o = 195^o > 180^o$ (loại vì đa giác lồi các góc trong không vượt quá $180^o$).
        - Với $n = 9$, góc lớn nhất là: $u_9 = 120^o + 8 dot 5^o = 160^o < 180^o$ (thỏa mãn).
        Vậy đa giác có 9 cạnh.
    ]
)

// TN 12
#tn([Trong một giải cờ vua vòng tròn một lượt (mỗi kỳ thủ đấu với mọi kỳ thủ khác đúng một ván), người ta nhận thấy điểm số của các kỳ thủ khi xếp từ cao xuống thấp lập thành một cấp số cộng. Trận thắng được $1$ điểm, hòa được $0.5$ điểm, thua $0$ điểm. Biết có $n$ kỳ thủ và kỳ thủ xếp chót được $0$ điểm. Hỏi số kỳ thủ $n$ có thể nhận giá trị nào?],
    (
        [$n = 3$.],
        [Điều này chỉ xảy ra khi $n$ là số lẻ.],
        [Điều này chỉ xảy ra khi $n$ là số chẵn.],
        True([Tất cả các đáp án trên đều sai.])
    ),
    loigiai: [
        Tổng số ván đấu và cũng là tổng số điểm của cả giải đấu là:
        $ S = (n(n-1))/2 $
        Xếp điểm từ thấp đến cao lập thành một cấp số cộng có $n$ số hạng, số hạng đầu $u_1 = 0$, số hạng cuối là điểm người vô địch $M$.
        Tổng điểm cả giải là:
        $
          S = n/2 (u_1 + u_n) = n/2 (0 + M) = (n M)/2
        $
        Do đó:
        $ (n(n-1))/2 = (n M)/2 <=> M = n - 1 $
        Cấp số cộng có công sai là $d = (u_n - u_1)/(n-1) = (n-1)/(n-1) = 1$.
        Điểm số của các kỳ thủ xếp theo cấp số cộng tăng là $0, 1, 2, ..., n-1$. Điều này luôn khả thi với mọi $n$ (ví dụ như khi kết quả không có trận hòa và mỗi kỳ thủ thắng toàn bộ những người xếp dưới mình).
        Vì $n$ có thể là bất kỳ số nguyên nào lớn hơn hoặc bằng 2, nên không có ràng buộc $n$ phải chẵn hay lẻ. Đáp án đúng là D.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Xét dãy số $(u_n)$ được định nghĩa bởi $u_1 = 2$ và $u_(n+1) = (u_n) / (u_n + 1)$ với mọi $n >= 1$. Các phát biểu sau đúng hay sai?], (
        True([Tất cả các số hạng của dãy số đều dương.]),
        True([Dãy số $(1 / u_n)$ là một cấp số cộng.]),
        True([Số hạng $u_10$ của dãy bằng $2/19$.]),
        [Dãy số $(u_n)$ hội tụ về $1$ khi $n -> +oo$.]
    ), 
    loigiai: [
        - *a)* Đúng. Bằng quy nạp, $u_1 = 2 > 0$. Nếu $u_n > 0$ thì $u_(n+1) = u_n / (u_n + 1) > 0$.
        - *b)* Đúng. Ta biến đổi nghịch đảo:
          $
            1 / u_(n+1) &= (u_n + 1) / u_n \
                        &= 1 / u_n + 1
          $
          Đặt $v_n = 1 / u_n$, ta được $v_(n+1) = v_n + 1$. Dãy $(v_n)$ là cấp số cộng có số hạng đầu $v_1 = 1/2$ và công sai $d = 1$.
        - *c)* Đúng. Số hạng thứ 10 của dãy $(v_n)$ là:
          $ v_10 = v_1 + 9d = 1/2 + 9 = 19/2 $
          Suy ra:
          $ u_10 = 1 / v_10 = 2/19 $
        - *d)* Sai. Công thức tổng quát của $v_n$:
          $ v_n = 1/2 + (n-1) = n - 1/2 $
          Suy ra:
          $ u_n = 1 / (n - 1/2) $
          Khi $n -> +oo$, ta có $u_n -> 0$, do đó dãy số hội tụ về $0$.
    ]
)

// DS 2
#ds([Cho ba số $a, b, c$ lập thành cấp số nhân. Các phát biểu sau đúng hay sai (giả sử các biểu thức đều xác định)?], (
        True([$(a+b+c)(a-b+c) = a^2 + b^2 + c^2$.]),
        [$ln a, ln b, ln c$ luôn lập thành cấp số cộng.],
        [Nếu cộng thêm $1$ vào mỗi số, ta thu được ba số mới lập thành cấp số nhân.],
        True([$a b c = b^3$.])
    ), 
    loigiai: [
        Vì $a, b, c$ lập thành cấp số nhân nên ta có $b^2 = a c$.
        - *a)* Đúng. Biến đổi vế trái:
          $
            (a+c + b)(a+c - b) &= (a+c)^2 - b^2 \
                               &= a^2 + 2a c + c^2 - b^2 \
                               &= a^2 + 2b^2 + c^2 - b^2 \
                               &= a^2 + b^2 + c^2
          $
        - *b)* Sai. Nếu công bội $q < 0$, các số hạng sẽ đan dấu nên sẽ có số hạng âm làm cho biểu thức logarit không xác định.
        - *c)* Sai. Chọn bộ ba số $1, 2, 4$ (công bội $2$), cộng thêm 1 ta được $2, 3, 5$ không lập thành cấp số nhân vì $3^2 != 2 dot 5$.
        - *d)* Đúng. Ta có:
          $ a b c = (a c) b = b^2 dot b = b^3 $
    ]
)

// DS 3
#ds([Cho cấp số cộng $(u_n)$ và gọi $S_n$ là tổng $n$ số hạng đầu tiên của nó. Biết $S_m = S_n$ với $m != n$. Các phát biểu sau đúng hay sai?], (
        [Chắc chắn số hạng đầu tiên $u_1 = 0$.],
        [Chắc chắn công sai $d$ phải âm.],
        True([Tổng $m+n$ số hạng đầu tiên luôn bằng $0$.]),
        [Trung bình cộng của $m$ số hạng đầu bằng trung bình cộng của $n$ số hạng đầu.]
    ), 
    loigiai: [
        - *a)* Sai.
        - *b)* Sai.
        - *c)* Đúng. Theo giả thiết:
          $
            S_m = S_n &<=> m/2 [2u_1 + (m-1)d] = n/2 [2u_1 + (n-1)d] \
                      &<=> 2u_1 (m-n) + [m(m-1) - n(n-1)] d = 0 \
                      &<=> 2u_1 (m-n) + (m^2 - n^2 - (m-n)) d = 0 \
                      &<=> 2u_1 (m-n) + (m-n)(m+n-1)d = 0
          $
          Vì $m != n$ nên $m-n != 0$, chia cả hai vế cho $m-n$:
          $ 2u_1 + (m+n-1)d = 0 $
          Khi đó:
          $ S_(m+n) = (m+n)/2 [2u_1 + (m+n-1)d] = (m+n)/2 dot 0 = 0 $
        - *d)* Sai. Trung bình cộng của $m$ số đầu là $S_m / m$, của $n$ số đầu là $S_n / n$. Do $S_m = S_n$ và $m != n$ nên $S_m / m != S_n / n$ (trừ khi $S_m = S_n = 0$).
    ]
)

// DS 4
#ds([Khảo sát mô hình lợi nhuận của một chuỗi cửa hàng. Lợi nhuận hàng tháng lập thành cấp số cộng. Tháng 1 lãi $10$ triệu. Tháng 6 lãi $35$ triệu. Các phát biểu sau đúng hay sai?], (
        True([Công sai của cấp số cộng lợi nhuận là $5$ triệu/tháng.]),
        True([Tháng 12 lợi nhuận sẽ là $65$ triệu.]),
        True([Tổng lợi nhuận của năm đầu tiên (12 tháng) là $450$ triệu.]),
        [Để tổng lợi nhuận đạt $1$ tỷ đồng ($1000$ triệu), cửa hàng phải duy trì ít nhất $18$ tháng.]
    ), 
    loigiai: [
        Lợi nhuận lập thành cấp số cộng với $u_1 = 10$ và $u_6 = 35$.
        Ta có:
        $
          u_6 = u_1 + 5d &<=> 35 = 10 + 5d \
                         &<=> 5d = 25 <=> d = 5
        $
        - *a)* Đúng. Công sai $d = 5$.
        - *b)* Đúng. Số hạng thứ 12:
          $ u_12 = u_1 + 11d = 10 + 11 dot 5 = 65 " (triệu đồng)" $
        - *c)* Đúng. Tổng lợi nhuận 12 tháng:
          $ S_12 = 12/2 (u_1 + u_12) = 6 dot (10 + 65) = 450 " (triệu đồng)" $
        - *d)* Sai. Để tổng lợi nhuận đạt tối thiểu 1 tỷ đồng ($1000$ triệu đồng):
          $
            S_n >= 1000 &<=> n/2 [20 + 5(n-1)] >= 1000 \
                        &<=> n(5n + 15) >= 2000 \
                        &<=> 5n^2 + 15n - 2000 >= 0 \
                        &<=> n^2 + 3n - 400 >= 0
          $
          Nghiệm dương của phương trình bậc hai là $n approx 18.55$.
          Do đó cần ít nhất $19$ tháng.
          
        Biểu đồ cột biểu diễn lợi nhuận tăng trưởng trong 6 tháng đầu:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Axes
            line((0, 0), (7, 0), mark: (end: ">"), stroke: 0.75pt + gray)
            line((0, 0), (0, 4.5), mark: (end: ">"), stroke: 0.75pt + gray)
            content((7, -0.3), [Tháng])
            content((-0.6, 4.3), [Lãi (tr)])
            
            // Draw bars
            for i in range(1, 7) {
              let x = i
              let val = 10 + (i - 1) * 5
              let y = val / 10
              rect((x - 0.25, 0), (x + 0.25, y), fill: rgb("#eef4ff"), stroke: 1pt + rgb("#1553a0"))
              content((x, -0.3), [#i])
              content((x, y + 0.25), [#val], style: "bold")
            }
          })
        ]
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho ba số lập thành cấp số nhân. Nếu lấy số thứ hai cộng thêm $2$ thì ba số mới lập thành cấp số cộng. Nếu lấy số thứ ba (của cấp số cộng mới) cộng thêm $9$ thì ba số lại lập thành cấp số nhân. Tìm số bé nhất trong ba số ban đầu, biết rằng các số đều dương.],
    [4],
    loigiai: [
        Gọi ba số dương ban đầu là $a, b, c$.
        Vì $a, b, c$ lập thành cấp số nhân nên ta có:
        $ b^2 = a c quad (1) $
        Theo đề bài:
        - $a, b+2, c$ lập thành cấp số cộng:
          $ a + c = 2(b+2) = 2b + 4 quad (2) $
        - $a, b+2, c+9$ lập thành cấp số nhân:
          $
            (b+2)^2 = a(c+9) &<=> b^2 + 4b + 4 = a c + 9a \
                             &<=> b^2 + 4b + 4 = b^2 + 9a \
                             &<=> 4b + 4 = 9a \
                             &<=> a = (4b+4)/9 quad (3)
          $
        Thay $(3)$ vào $(2)$:
        $
          c = 2b + 4 - (4b+4)/9 = (14b + 32)/9
        $
        Thế $a$ và $c$ vào $(1)$:
        $
          b^2 = (4b+4)/9 dot (14b+32)/9 &<=> 81b^2 = 8(b+1)(7b+16) \
                                        &<=> 81b^2 = 56b^2 + 184b + 128 \
                                        &<=> 25b^2 - 184b - 128 = 0 \
                                        &<=> cases(b = 8, b = -16/25 " (loại)")
        $
        Với $b = 8$, suy ra $a = 4$ và $c = 16$.
        Ba số dương ban đầu là $4, 8, 16$. Số nhỏ nhất là $4$.
    ]
)

// TL 2
#tln([Gọi $x, y$ là hai nghiệm phân biệt của phương trình $t^2 - p t + q = 0$. Giả sử $1, x, y$ lập thành một cấp số cộng và $1, y, x$ lập thành một cấp số nhân. Tính giá trị biểu thức $8(p + q)$.],
    [-3],
    loigiai: [
        Theo giả thiết:
        - $1, x, y$ lập thành cấp số cộng:
          $ 1 + y = 2x <=> y = 2x - 1 quad (1) $
        - $1, y, x$ lập thành cấp số nhân:
          $ y^2 = 1 dot x = x quad (2) $
        Thế $(1)$ vào $(2)$:
        $
          (2x - 1)^2 = x &<=> 4x^2 - 4x + 1 = x \
                         &<=> 4x^2 - 5x + 1 = 0 \
                         &<=> cases(x = 1, x = 1/4)
        $
        - Với $x = 1 => y = 1$ (loại vì hai nghiệm phân biệt).
        - Với $x = 1/4 => y = -1/2$ (nhận).
        Theo định lý Vi-ét cho phương trình $t^2 - p t + q = 0$:
        $
          p &= x + y = 1/4 - 1/2 = -1/4 \
          q &= x y = 1/4 dot (-1/2) = -1/8
        $
        Từ đó tính được:
        $ 8(p + q) = 8 dot (-3/8) = -3 $
    ]
)

// TL 3
#tln([Trong một cuộc thi, phần thưởng được phát cho $10$ thứ hạng theo một cấp số cộng (từ hạng thấp đến hạng cao). Tổng quỹ giải thưởng là $3250$ đô la. Giải nhất (hạng cao nhất) cao hơn giải chót (hạng thấp nhất) $450$ đô la. Hỏi người đạt giải nhất sẽ nhận được bao nhiêu đô la?],
    [550],
    loigiai: [
        Tổng số tiền thưởng cho 10 giải là:
        $ S_10 = 10/2 (u_1 + u_10) = 3250 <=> u_1 + u_10 = 650 $
        Mà theo đề bài:
        $ u_10 - u_1 = 450 $
        Ta có hệ phương trình:
        $
          cases(
            u_1 + u_10 = 650,
            u_10 - u_1 = 450
          )
          <=>
          cases(
            u_1 = 100,
            u_10 = 550
          )
        $
        Vậy người đạt giải nhất nhận được $550$ đô la.
    ]
)

// TL 4
#tln([Mật độ vi khuẩn trong một đĩa nuôi cấy tăng theo quy luật cấp số nhân theo từng giờ. Ban đầu có $A$ vi khuẩn. Sau $5$ giờ, số lượng vi khuẩn đo được là $32 A$. Hỏi sau tổng cộng $7$ giờ, số lượng vi khuẩn sẽ gấp bao nhiêu lần số lượng ban đầu $A$?],
    [128],
    loigiai: [
        Gọi số lượng vi khuẩn ban đầu là $N_0 = A$.
        Sau $5$ giờ:
        $ N_5 = A q^5 = 32 A <=> q^5 = 32 <=> q = 2 $
        Sau $7$ giờ, số lượng vi khuẩn là:
        $ N_7 = A q^7 = A dot 2^7 = 128 A $
        Vậy số lượng vi khuẩn gấp $128$ lần số lượng ban đầu.
    ]
)

// TL 5
#tln([Cho tam giác $A B C$ đều cạnh $a = 1$. Lấy trung điểm ba cạnh của tam giác đó tạo thành một tam giác đều mới. Tiếp tục quá trình này vô hạn lần đối với các tam giác đều vừa được tạo ra. Tổng diện tích của tất cả các tam giác đều được tạo ra (bao gồm cả tam giác ban đầu) là bao nhiêu? Làm tròn đến hai chữ số thập phân.],
    [0.58],
    loigiai: [
        Diện tích tam giác đều cạnh $a=1$:
        $ S_1 = (sqrt(3))/4 $
        Mỗi lần nối các trung điểm, ta được một tam giác đều mới có diện tích bằng $1/4$ diện tích tam giác trước đó.
        Diện tích các tam giác tạo thành một cấp số nhân lùi vô hạn với $u_1 = sqrt(3)/4$ và $q = 1/4$.
        Tổng diện tích của tất cả các tam giác là:
        $
          S &= u_1 / (1 - q) \
            &= (sqrt(3)/4) / (1 - 1/4) \
            &= (sqrt(3))/3 approx 0.58
        $
        
        Minh họa tam giác đều tự đồng dạng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let a = 3
            let h = a * calc.sin(calc.pi / 3)
            
            // Tam giác 1
            line((0, 0), (a, 0), (a/2, h), close: true, stroke: 1.2pt + black)
            
            // Tam giác 2 (trung điểm)
            line((a/2, 0), (3*a/4, h/2), (a/4, h/2), close: true, fill: rgb("#eef4ff"), stroke: 0.8pt + blue)
            
            // Tam giác 3 (trung điểm các góc)
            line((a/4, 0), (3*a/8, h/4), (a/8, h/4), close: true, stroke: 0.5pt + red)
            line((3*a/4, 0), (7*a/8, h/4), (5*a/8, h/4), close: true, stroke: 0.5pt + red)
            line((a/2, h/2), (5*a/8, 3*h/4), (3*a/8, 3*h/4), close: true, stroke: 0.5pt + red)
          })
        ]
    ]
)

// TL 6
#tln([Hai người cùng làm việc trong $30$ ngày. Người A nhận lương một lần vào cuối kỳ là $100$ triệu đồng. Người B nhận lương theo ngày: ngày đầu $10 000$ đồng, và mỗi ngày tiếp theo nhận thêm $5 000$ đồng so với ngày trước đó. Sự chênh lệch thu nhập (triệu đồng) giữa người A và người B là bao nhiêu? (Làm tròn đến hàng đơn vị)],
    [98],
    loigiai: [
        Lương của người B nhận được trong 30 ngày lập thành một cấp số cộng:
        $ u_1 = 10 000, quad d = 5 000 $
        Tổng thu nhập của người B sau 30 ngày là:
        $
          S_30 &= 30/2 [2u_1 + 29d] \
               &= 15 [20 000 + 29 dot 5 000] \
               &= 15 [20 000 + 145 000] \
               &= 15 dot 165 000 = 2 475 000 " (đồng)"
        $
        Đổi ra triệu đồng, người B nhận được $2.475$ triệu đồng.
        Người A nhận được $100$ triệu đồng.
        Sự chênh lệch thu nhập là:
        $ 100 - 2.475 = 97.525 " (triệu đồng)" $
        Làm tròn đến hàng đơn vị là $98$ triệu đồng.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
