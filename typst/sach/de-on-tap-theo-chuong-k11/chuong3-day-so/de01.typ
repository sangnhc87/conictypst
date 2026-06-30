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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 01)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho dãy số $(u_n)$ biết $u_n = (2n - 1) / (n + 1)$. Ba số hạng đầu tiên của dãy số lần lượt là],
    (
        [$1/2; 1; 5/4$.],
        [$1; 3/2; 5/3$.],
        True([$1/2; 1; 5/4$.]),
        [$1/2; 3/4; 5/4$.]
    ),
    loigiai: [
        Ta lần lượt thay các giá trị $n = 1, 2, 3$ vào công thức số hạng tổng quát của dãy số $(u_n)$:
        $
          u_1 &= (2 dot 1 - 1) / (1 + 1) = 1/2 \
          u_2 &= (2 dot 2 - 1) / (2 + 1) = 3/3 = 1 \
          u_3 &= (2 dot 3 - 1) / (3 + 1) = 5/4
        $
        Vậy ba số hạng đầu tiên của dãy số lần lượt là: $1/2; 1; 5/4$.
    ]
)

// TN 2
#tn([Cho dãy số $(u_n)$ được xác định bởi: $cases(u_1 = 3, u_n = u_(n-1) + 2 quad (n >= 2))$. Số hạng thứ $4$ của dãy số là],
    (
        [$7$.],
        [$8$.],
        True([$9$.]),
        [$11$.]
    ),
    loigiai: [
        Ta tính các số hạng kế tiếp theo hệ thức truy hồi đã cho:
        $
          u_1 &= 3 \
          u_2 &= u_1 + 2 = 3 + 2 = 5 \
          u_3 &= u_2 + 2 = 5 + 2 = 7 \
          u_4 &= u_3 + 2 = 7 + 2 = 9
        $
        Vậy số hạng thứ 4 của dãy số là $u_4 = 9$.
    ]
)

// TN 3
#tn([Trong các dãy số sau đây, dãy số nào là cấp số cộng?],
    (
        True([$1; 4; 7; 10; 13$.]),
        [$1; 2; 4; 8; 16$.],
        [$1; -1; 1; -1; 1$.],
        [$1; 3; 6; 10; 15$.]
    ),
    loigiai: [
        Dãy số $(u_n)$ là một cấp số cộng nếu hiệu số hạng đứng sau và số hạng đứng trước là một hằng số $d$ (công sai): $u_(n+1) - u_n = d$.
        - Với dãy số $1; 4; 7; 10; 13$:
          $
            4 - 1 &= 3 \
            7 - 4 &= 3 \
            10 - 7 &= 3 \
            13 - 10 &= 3
          $
          Hiệu số hạng liên tiếp luôn bằng $3$. Đây là một cấp số cộng có công sai $d = 3$.
        - Các dãy số còn lại không thỏa mãn tính chất này.
    ]
)

// TN 4
#tn([Cho cấp số cộng $(u_n)$ có số hạng đầu $u_1 = -2$ và công sai $d = 3$. Tìm số hạng tổng quát $u_n$ của cấp số cộng đó.],
    (
        [$u_n = -2 + 3^n$.],
        [$u_n = 3n - 2$.],
        True([$u_n = 3n - 5$.]),
        [$u_n = -2n + 3$.]
    ),
    loigiai: [
        Công thức số hạng tổng quát của cấp số cộng là:
        $ u_n = u_1 + (n - 1)d $
        Thay $u_1 = -2$ và $d = 3$ vào công thức trên, ta được:
        $
          u_n &= -2 + (n - 1) dot 3 \
              &= -2 + 3n - 3 \
              &= 3n - 5
        $
    ]
)

// TN 5
#tn([Một cấp số cộng có $u_3 = 10$ và $u_8 = 30$. Công sai $d$ của cấp số cộng này bằng],
    (
        [$2$.],
        [$3$.],
        True([$4$.]),
        [$5$.]
    ),
    loigiai: [
        Áp dụng công thức số hạng tổng quát $u_n = u_1 + (n-1)d$, ta lập hệ phương trình:
        $
          cases(
            u_3 = u_1 + 2d = 10,
            u_8 = u_1 + 7d = 30
          )
        $
        Trừ vế theo vế phương trình thứ hai cho phương trình thứ nhất:
        $
          5d = 20 <=> d = 4
        $
    ]
)

// TN 6
#tn([Tổng của $10$ số hạng đầu tiên của cấp số cộng có $u_1 = 5$ và $d = 2$ bằng bao nhiêu?],
    (
        [$130$.],
        True([$140$.]),
        [$150$.],
        [$160$.]
    ),
    loigiai: [
        Công thức tính tổng của $n$ số hạng đầu tiên của cấp số cộng:
        $ S_n = n/2 [2u_1 + (n-1)d] $
        Thay $n = 10$, $u_1 = 5$, $d = 2$ vào công thức trên:
        $
          S_10 &= 10/2 [2 dot 5 + (10 - 1) dot 2] \
               &= 5 dot (10 + 18) \
               &= 5 dot 28 = 140
        $
    ]
)

// TN 7
#tn([Trong các dãy số cho bởi công thức tổng quát sau đây, dãy số nào là cấp số nhân?],
    (
        [$u_n = 2n + 3$.],
        True([$u_n = 5 dot 2^n$.]),
        [$u_n = n^2 + 1$.],
        [$u_n = (n+1) / n$.]
    ),
    loigiai: [
        Dãy số $(u_n)$ là cấp số nhân nếu tỉ số giữa số hạng liền sau và số hạng liền trước là hằng số: $u_(n+1) / u_n = q$.
        - Với dãy số $u_n = 5 dot 2^n$:
          $
            u_(n+1) / u_n &= (5 dot 2^(n+1)) / (5 dot 2^n) \
                          &= 2 = "hằng số"
          $
          Vậy đây là cấp số nhân có công bội $q = 2$.
        - Các dãy số còn lại đều có tỉ số thay đổi phụ thuộc vào biến $n$.
    ]
)

// TN 8
#tn([Cho cấp số nhân $(u_n)$ có số hạng đầu $u_1 = 3$ và công bội $q = -2$. Số hạng thứ $5$ của cấp số nhân đó là],
    (
        [$-48$.],
        True([$48$.]),
        [$-96$.],
        [$96$.]
    ),
    loigiai: [
        Công thức số hạng tổng quát của cấp số nhân:
        $ u_n = u_1 q^(n-1) $
        Áp dụng cho số hạng thứ $5$:
        $
          u_5 &= u_1 q^4 \
              &= 3 dot (-2)^4 \
              &= 3 dot 16 = 48
        $
    ]
)

// TN 9
#tn([Tổng $S = 1 + 2 + 4 + 8 + ... + 512$ bằng bao nhiêu?],
    (
        [$511$.],
        [$1024$.],
        True([$1023$.]),
        [$2047$.]
    ),
    loigiai: [
        Dãy số các số hạng trong tổng lập thành cấp số nhân $(u_n)$ có $u_1 = 1$, $q = 2$.
        Số hạng cuối cùng của dãy là:
        $
          u_n = u_1 q^(n-1) &<=> 512 = 1 dot 2^(n-1) \
                            &<=> 2^9 = 2^(n-1) <=> n = 10
        $
        Áp dụng công thức tổng $S_n$ của cấp số nhân:
        $
          S_10 &= (u_1 (1 - q^10)) / (1 - q) \
               &= (1 dot (1 - 2^10)) / (1 - 2) \
               &= (1 - 1024) / (-1) = 1023
        $
    ]
)

// TN 10
#tn([Để rèn luyện sức khỏe, anh A bắt đầu tập chạy. Tuần đầu tiên anh chạy được $5$ km. Mỗi tuần sau đó, do thể lực tăng nên quãng đường anh chạy được tăng thêm $2$ km so với tuần trước. Hỏi ở tuần thứ $10$, anh A chạy được quãng đường bao nhiêu km?],
    (
        [$21$ km.],
        True([$23$ km.]),
        [$25$ km.],
        [$27$ km.]
    ),
    loigiai: [
        Quãng đường chạy mỗi tuần của anh A lập thành cấp số cộng với số hạng đầu $u_1 = 5$ (km) và công sai $d = 2$ (km).
        Quãng đường anh chạy được ở tuần thứ $10$ tương ứng với số hạng thứ $10$:
        $
          u_10 &= u_1 + 9d \
               &= 5 + 9 dot 2 = 23 " (km)"
        $
        
        Biểu đồ cột mô tả sự tăng trưởng quãng đường qua các tuần đầu:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Trục tọa độ
            line((0,0), (6,0), mark: (end: ">"), stroke: 0.75pt + gray)
            line((0,0), (0,3.5), mark: (end: ">"), stroke: 0.75pt + gray)
            content((6, -0.3), [Tuần])
            content((-0.8, 3.3), [Quãng đường (km)])
            
            // Vẽ các cột đại diện cho 5 tuần đầu
            for i in range(1, 6) {
              let val = 5 + (i - 1) * 2
              let y = val / 5
              rect((i - 0.25, 0), (i + 0.25, y), fill: rgb("#eef6ed"), stroke: 1pt + rgb("#1a7a2e"))
              content((i, -0.3), [#i])
              content((i, y + 0.2), [#val], style: "bold")
            }
          })
        ]
    ]
)

// TN 11
#tn([Một quả bóng cao su được thả từ độ cao $10$ m. Mỗi lần chạm đất, nó nảy lên một độ cao bằng $3/4$ độ cao trước đó. Độ cao của quả bóng sau lần nảy thứ $3$ (làm tròn đến hai chữ số thập phân) là bao nhiêu mét?],
    (
        [$3.16$ m.],
        [$5.63$ m.],
        True([$4.22$ m.]),
        [$7.50$ m.]
    ),
    loigiai: [
        Gọi $h_n$ là độ cao của quả bóng sau lần nảy thứ $n$.
        Độ cao nảy lên sau mỗi lần chạm đất tạo thành một cấp số nhân có:
        - Số hạng đầu tiên (sau lần nảy thứ 1): $h_1 = 10 dot 3/4 = 7.5$ m.
        - Công bội: $q = 3/4$.
        Công thức độ cao sau lần nảy thứ $n$ là:
        $ h_n = 10 dot (3/4)^n $
        Do đó độ cao sau lần nảy thứ 3 là:
        $
          h_3 &= 10 dot (3/4)^3 \
              &= 10 dot 27/64 \
              &= 270 / 64 approx 4.22 " (m)"
        $
        
        Minh họa quỹ đạo nảy của quả bóng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Mặt đất
            line((0,0), (6,0), stroke: 1.5pt + gray)
            
            // Đường rơi ban đầu
            line((0.5, 3), (0.5, 0), stroke: (paint: blue, dash: "dashed"))
            circle((0.5, 3), radius: 0.05, fill: blue)
            
            // Các đường nảy dạng parabol
            bezier((0.5, 0), (2.0, 0), (0.8, 2.25), (1.7, 2.25), stroke: blue)
            bezier((2.0, 0), (3.2, 0), (2.2, 1.6875), (3.0, 1.6875), stroke: blue)
            bezier((3.2, 0), (4.1, 0), (3.4, 1.265), (3.9, 1.265), stroke: blue)
            
            // Nhãn nhãn
            content((0.5, 3.25), [10m])
            content((1.25, 2.45), [$h_1$])
            content((2.6, 1.9), [$h_2$])
            content((3.65, 1.45), [$h_3$])
          })
        ]
    ]
)

// TN 12
#tn([Bốn số tạo thành một cấp số cộng. Tổng của chúng bằng $20$ và tổng bình phương của chúng bằng $120$. Công sai của cấp số cộng này (biết cấp số cộng là dãy số tăng) bằng bao nhiêu?],
    (
        [$1$.],
        True([$2$.]),
        [$3$.],
        [$4$.]
    ),
    loigiai: [
        Gọi bốn số đó lần lượt là $a - 3x$, $a - x$, $a + x$, $a + 3x$ (với công sai là $d = 2x$ và $x > 0$ do đây là dãy số tăng).
        Theo đề bài ta có:
        $
          (a - 3x) + (a - x) + (a + x) + (a + 3x) = 20 &<=> 4a = 20 \
                                                     &<=> a = 5
        $
        Tổng bình phương của 4 số hạng là:
        $
          (5 - 3x)^2 + (5 - x)^2 + (5 + x)^2 + (5 + 3x)^2 = 120
        $
        Biến đổi biểu thức thu gọn:
        $
          2(25 + 9x^2) + 2(25 + x^2) = 120 &<=> 100 + 20x^2 = 120 \
                                           &<=> 20x^2 = 20 \
                                           &<=> x^2 = 1
        $
        Do $x > 0$ nên $x = 1$.
        Công sai của cấp số cộng là:
        $ d = 2x = 2 dot 1 = 2 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho dãy số $(u_n)$ với $u_n = (3n - 1) / (2n + 1)$. Các phát biểu sau đúng hay sai?], (
        True([Dãy số $(u_n)$ là một dãy số tăng.]),
        True([Tất cả các số hạng của dãy số đều mang dấu dương.]),
        True([Số hạng thứ $10$ của dãy số bằng $29/21$.]),
        [Tồn tại một số hạng của dãy có giá trị bằng $3/2$.]
    ), 
    loigiai: [
        - *a)* Đúng. Xét hàm số liên tục $f(x) = (3x - 1)/(2x + 1)$ với $x >= 1$.
          Ta có đạo hàm:
          $ f'(x) = 5 / (2x+1)^2 > 0, quad forall x >= 1 $
          Vì đạo hàm luôn dương nên hàm số đồng biến, suy ra dãy số $(u_n)$ tăng.
        - *b)* Đúng. Với mọi $n >= 1$, ta có tử số $3n - 1 >= 2 > 0$ và mẫu số $2n + 1 >= 3 > 0$. Do đó $u_n > 0$.
        - *c)* Đúng. Tính số hạng thứ 10:
          $ u_10 = (3 dot 10 - 1) / (2 dot 10 + 1) = 29/21 $
        - *d)* Sai. Giả sử tồn tại số hạng $u_n = 3/2$:
          $
            (3n - 1) / (2n + 1) = 3/2 &<=> 2(3n - 1) = 3(2n + 1) \
                                      &<=> 6n - 2 = 6n + 3 \
                                      &<=> -2 = 3 " (vô lý)"
          $
          Vậy không tồn tại số hạng nào bằng $3/2$.
    ]
)

// DS 2
#ds([Cho cấp số cộng $(u_n)$ có $u_1 = -5$ và $u_6 = 10$. Các phát biểu sau đúng hay sai?], (
        True([Công sai của cấp số cộng là $d = 3$.]),
        True([Số hạng thứ $10$ là $u_10 = 22$.]),
        True([Tổng $20$ số hạng đầu tiên là $S_20 = 470$.]),
        True([Số $100$ là một số hạng của cấp số cộng này.])
    ), 
    loigiai: [
        - *a)* Đúng. Dựa vào tính chất số hạng thứ 6:
          $ u_6 = u_1 + 5d <=> 10 = -5 + 5d <=> 5d = 15 <=> d = 3 $
        - *b)* Đúng. Số hạng thứ 10 là:
          $ u_10 = u_1 + 9d = -5 + 9 dot 3 = 22 $
        - *c)* Đúng. Tổng của 20 số hạng đầu tiên:
          $ S_20 = 20/2 [2 u_1 + 19d] = 10 [2(-5) + 19 dot 3] = 10 dot 47 = 470 $
        - *d)* Đúng. Giả sử số hạng thứ $n$ có giá trị bằng $100$:
          $
            u_n = 100 &<=> u_1 + (n-1)d = 100 \
                      &<=> -5 + (n-1) dot 3 = 100 \
                      &<=> 3(n-1) = 105 \
                      &<=> n-1 = 35 <=> n = 36
          $
          Vì $n=36$ là một số nguyên dương, nên $100$ là số hạng thứ $36$ của cấp số cộng.
    ]
)

// DS 3
#ds([Cho cấp số nhân $(v_n)$ có $v_1 = 2$ và công bội $q = 3$. Các phát biểu sau đúng hay sai?], (
        True([Dãy số $(v_n)$ là một dãy số tăng.]),
        True([Số hạng tổng quát là $v_n = 2 dot 3^(n-1)$.]),
        True([Số hạng $v_5$ bằng $162$.]),
        True([Tổng $n$ số hạng đầu tiên là $S_n = 3^n - 1$.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $v_1 = 2 > 0$ và công bội $q = 3 > 1$, dãy gồm các số dương và tăng dần do số hạng sau gấp 3 lần số hạng trước.
        - *b)* Đúng. Công thức tổng quát của cấp số nhân là $v_n = v_1 q^(n-1) = 2 dot 3^(n-1)$.
        - *c)* Đúng. Số hạng thứ 5 là:
          $ v_5 = v_1 q^4 = 2 dot 3^4 = 2 dot 81 = 162 $
        - *d)* Đúng. Tổng $n$ số hạng đầu tiên:
          $
            S_n &= v_1 dot (1 - q^n) / (1 - q) \
                &= 2 dot (1 - 3^n) / (1 - 3) \
                &= 2 dot (1 - 3^n) / (-2) \
                &= - (1 - 3^n) = 3^n - 1
          $
    ]
)

// DS 4
#ds([Một tòa nhà hình tháp có 30 tầng. Số lượng bóng đèn cần dùng ở tầng 1 là $15$ bóng, tầng 2 là $18$ bóng, tầng 3 là $21$ bóng, và cứ tiếp tục tăng theo cấp số cộng cho đến tầng 30. Các phát biểu sau đúng hay sai?], (
        True([Số bóng đèn ở mỗi tầng lập thành cấp số cộng với công sai $d = 3$.]),
        True([Tầng 30 cần $102$ bóng đèn.]),
        True([Tổng số bóng đèn dùng cho $10$ tầng đầu tiên là $285$ bóng.]),
        True([Tổng số bóng đèn của cả tòa nhà là $1755$ bóng.])
    ), 
    loigiai: [
        Số lượng bóng đèn cần lắp đặt ở mỗi tầng lập thành một cấp số cộng $(u_n)$ với $u_1 = 15$ và công sai $d = 3$.
        - *a)* Đúng. Ta thấy số bóng đèn tăng đều qua mỗi tầng là 3.
        - *b)* Đúng. Tầng 30 cần số bóng đèn là:
          $ u_30 = u_1 + 29d = 15 + 29 dot 3 = 102 $
        - *c)* Đúng. Tổng số bóng đèn của 10 tầng đầu:
          $ S_10 = 10/2 [2 u_1 + 9d] = 5 [2 dot 15 + 9 dot 3] = 5 dot 57 = 285 $
        - *d)* Đúng. Tổng số bóng đèn của cả 30 tầng:
          $ S_30 = 30/2 [u_1 + u_30] = 15 dot (15 + 102) = 15 dot 117 = 1755 $
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Cho cấp số cộng $(u_n)$ có $u_1 + u_5 = 14$ và $u_2 + u_7 = 20$. Tìm số hạng thứ 10 của cấp số cộng đó.],
    [21],
    loigiai: [
        Biểu diễn các giả thiết theo $u_1$ và $d$, ta thu được hệ phương trình:
        $
          cases(
            u_1 + (u_1 + 4d) = 14,
            (u_1 + d) + (u_1 + 6d) = 20
          )
          <=>
          cases(
            2u_1 + 4d = 14,
            2u_1 + 7d = 20
          )
        $
        Trừ hai phương trình trong hệ, ta có:
        $ 3d = 6 <=> d = 2 $
        Thay $d = 2$ vào phương trình đầu ta được:
        $ 2u_1 + 8 = 14 <=> 2u_1 = 6 <=> u_1 = 3 $
        Vậy số hạng thứ 10 của cấp số cộng là:
        $ u_10 = u_1 + 9d = 3 + 9 dot 2 = 21 $
    ]
)

// TL 2
#tln([Cấp số nhân $(u_n)$ có $u_1 = 3$, công bội $q = 2$. Biết tổng $n$ số hạng đầu tiên $S_n = 765$. Tìm $n$.],
    [8],
    loigiai: [
        Công thức tính tổng $n$ số hạng đầu của cấp số nhân:
        $
          S_n = u_1 dot (1 - q^n) / (1 - q)
        $
        Thay các giá trị đã biết vào phương trình:
        $
          765 = 3 dot (1 - 2^n) / (1 - 2) &<=> 765 = -3 (1 - 2^n) \
                                          &<=> 2^n - 1 = 255 \
                                          &<=> 2^n = 256 \
                                          &<=> 2^n = 2^8 <=> n = 8
        $
        Vậy có $8$ số hạng đầu tiên.
    ]
)

// TL 3
#tln([Ba số $x, y, z$ theo thứ tự lập thành một cấp số cộng và tổng của chúng bằng $15$. Nếu thêm lần lượt $1, 4, 19$ vào $x, y, z$ thì được ba số mới lập thành cấp số nhân. Tìm số lớn nhất trong ba số $x, y, z$. (Biết $x < y < z$).],
    [8],
    loigiai: [
        Vì ba số $x, y, z$ lập thành một cấp số cộng nên ta có thể biểu diễn chúng là:
        $ x = y - d, quad z = y + d " (với " d > 0 " vì " x < y < z) $
        Theo giả thiết tổng ba số bằng 15:
        $ (y - d) + y + (y + d) = 15 <=> 3y = 15 <=> y = 5 $
        Ba số ban đầu là $5-d, 5, 5+d$.
        Sau khi cộng thêm lần lượt $1, 4, 19$, ba số mới thu được là:
        $
          X &= 5 - d + 1 = 6 - d \
          Y &= 5 + 4 = 9 \
          Z &= 5 + d + 19 = 24 + d
        $
        Do ba số mới lập thành một cấp số nhân nên ta có phương trình:
        $
          Y^2 = X dot Z &<=> 9^2 = (6 - d)(24 + d) \
                        &<=> 81 = 144 - 18d - d^2 \
                        &<=> d^2 + 18d - 63 = 0 \
                        &<=> cases(d = 3 " (nhận)", d = -21 " (loại)")
        $
        Với $d = 3$, ba số ban đầu là $x = 2$, $y = 5$, $z = 8$. Số lớn nhất là $8$.
    ]
)

// TL 4
#tln([Một nhà hát có $20$ hàng ghế. Hàng ghế đầu tiên có $15$ ghế. Các hàng sau, mỗi hàng có số ghế nhiều hơn hàng liền trước $2$ ghế. Hỏi nhà hát có tổng sức chứa bao nhiêu khách ngồi?],
    [680],
    loigiai: [
        Số ghế ở các hàng của nhà hát lập thành cấp số cộng có $u_1 = 15$ và công sai $d = 2$.
        Số hàng ghế là $n = 20$.
        Tổng số chỗ ngồi của nhà hát là:
        $
          S_20 &= 20/2 [2 u_1 + 19d] \
               &= 10 [2 dot 15 + 19 dot 2] \
               &= 10 [30 + 38] = 680
        $
        Sức chứa tổng cộng của nhà hát là 680 người.
    ]
)

// TL 5
#tln([Một công ty đề xuất hai hình thức trả lương cho một hợp đồng lao động kéo dài $10$ ngày. Hình thức A: Mỗi ngày trả cố định $1$ triệu đồng. Hình thức B: Ngày đầu tiên trả $2 000$ đồng, mỗi ngày tiếp theo trả gấp đôi số tiền của ngày liền trước. Tính chênh lệch tổng thu nhập giữa hai hình thức này (tính bằng đồng).],
    [7954000],
    loigiai: [
        - Tổng tiền lương thu được theo hình thức A:
        $ S_A = 10 dot 1 000 000 = 10 000 000 " (đồng)" $
        - Tổng tiền lương thu được theo hình thức B lập thành cấp số nhân với $u_1 = 2000$ và $q = 2$:
        $
          S_B &= u_1 dot (1 - q^10) / (1 - q) \
              &= 2000 dot (1 - 2^10) / (1 - 2) \
              &= 2000 dot (1024 - 1) \
              &= 2000 dot 1023 = 2 046 000 " (đồng)"
        $
        - Chênh lệch tổng thu nhập giữa hai hình thức:
        $ Delta S = S_A - S_B = 10 000 000 - 2 046 000 = 7 954 000 " (đồng)" $
    ]
)

// TL 6
#tln([Cấp số nhân $(v_n)$ có số hạng thứ hai $v_2 = -6$ và số hạng thứ năm $v_5 = 48$. Tính tổng $8$ số hạng đầu tiên của cấp số nhân này.],
    [-255],
    loigiai: [
        Ta có hệ phương trình:
        $
          cases(
            v_2 = v_1 q = -6,
            v_5 = v_1 q^4 = 48
          )
        $
        Chia vế theo vế phương trình dưới cho phương trình trên:
        $
          (v_1 q^4) / (v_1 q) = 48 / (-6) &<=> q^3 = -8 \
                                          &<=> q = -2
        $
        Thế $q = -2$ vào phương trình $v_1 q = -6$, ta được $v_1 = 3$.
        Tính tổng 8 số hạng đầu tiên của cấp số nhân:
        $
          S_8 &= v_1 dot (1 - q^8) / (1 - q) \
              &= 3 dot (1 - (-2)^8) / (1 - (-2)) \
              &= 3 dot (1 - 256) / 3 \
              &= 1 - 256 = -255
        $
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
