#import "_config.typ": *

#muc([Đề Luyện Tập Số 02])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "ngang", tn(
  [Giá trị đại diện $x_i$ của nhóm số liệu $[u_i; u_(i+1))$ được tính bằng công thức nào dưới đây?],
  (
    [$x_i = u_(i+1) - u_i$],
    [$x_i = u_i + u_(i+1)$],
    True([$x_i = frac(u_i + u_(i+1), 2)$]),
    [$x_i = sqrt(u_i dot.c u_(i+1))$],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Giá trị đại diện $x_i$ của một nhóm số liệu ghép nhóm được xác định bằng trung điểm của khoảng ghép nhóm đó.
    ]
    #step[
      - Do đó công thức tính chính xác là:
        $x_i = frac(u_i + u_(i+1), 2)$
    ]
  ],
))

#q-wrap(dir: "ngang", tn(
  [Tìm giá trị đại diện của nhóm số liệu $[150; 160)$ trong bảng khảo sát chiều cao học sinh.],
  ([$150$], [$160$], True([$155$]), [$10$]),
  accent: c-book,
  loigiai: [
    #step[
      - Áp dụng công thức tính giá trị đại diện cho nhóm $[150; 160)$:
        $x = frac(150 + 160, 2)$
    ]
    #step[
      - Tính toán kết quả:
        $x = frac(310, 2) = 155$ (cm).
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Thời gian đi bộ đến trường của 50 học sinh được ghi nhận thông qua biểu đồ đa giác tần số ghép nhóm (Frequency Polygon) dưới đây:
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Vẽ hệ trục tọa độ
        line((0, 0), (6.5, 0), stroke: 1pt + rgb("#5b21b6"), mark: (end: ">"))
        line((0, 0), (0, 3.2), stroke: 1pt + rgb("#5b21b6"), mark: (end: ">"))
        
        // Nhãn trục
        content((6.3, -0.35), text(size: 8pt)[$x$ (phút)])
        content((-0.6, 3.0), text(size: 8pt)[Tần số])
        
        // Các điểm đỉnh của đa giác tần số: (giá trị đại diện, tần số)
        // Ánh xạ tọa độ: 15->1.5, 25->2.5, 35->3.5, 45->4.5
        // Tần số: 10->1.0, 15->1.5, 20->2.0, 5->0.5
        let pts = ((0.5, 0), (1.5, 1.0), (2.5, 1.5), (3.5, 2.0), (4.5, 0.5), (5.5, 0))
        
        // Vẽ đường đa giác tần số
        line(..pts, stroke: 1.5pt + rgb("#5b21b6"))
        
        // Vẽ các chấm tròn tại điểm dữ liệu thực tế
        let dot-color = rgb("#7c3aed")
        circle((1.5, 1.0), radius: 2.5pt, fill: dot-color, stroke: 0.5pt + white)
        circle((2.5, 1.5), radius: 2.5pt, fill: dot-color, stroke: 0.5pt + white)
        circle((3.5, 2.0), radius: 2.5pt, fill: dot-color, stroke: 0.5pt + white)
        circle((4.5, 0.5), radius: 2.5pt, fill: dot-color, stroke: 0.5pt + white)
        
        // Vẽ đường dóng từ các điểm xuống trục hoành
        line((1.5, 0), (1.5, 1.0), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        line((2.5, 0), (2.5, 1.5), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        line((3.5, 0), (3.5, 2.0), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        line((4.5, 0), (4.5, 0.5), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        
        // Vẽ đường dóng sang trục tung
        line((0, 1.0), (1.5, 1.0), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        line((0, 1.5), (2.5, 1.5), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        line((0, 2.0), (3.5, 2.0), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        line((0, 0.5), (4.5, 0.5), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
        
        // Nhãn trục hoành (giá trị đại diện)
        content((1.5, -0.25), text(size: 7.5pt)[15])
        content((2.5, -0.25), text(size: 7.5pt)[25])
        content((3.5, -0.25), text(size: 7.5pt)[35])
        content((4.5, -0.25), text(size: 7.5pt)[45])
        
        // Nhãn trục tung (tần số)
        content((-0.3, 0.5), text(size: 7.5pt)[5])
        content((-0.3, 1.0), text(size: 7.5pt)[10])
        content((-0.3, 1.5), text(size: 7.5pt)[15])
        content((-0.3, 2.0), text(size: 7.5pt)[20])
      })
    ]
    Số trung bình cộng $bar(x)$ của mẫu số liệu ghép nhóm biểu diễn qua đa giác tần số này là bao nhiêu?],
  ([$28.5$], True([$29.0$]), [$29.5$], [$30.0$]),
  accent: c-book,
  loigiai: [
    #step[
      - Đọc dữ liệu từ các đỉnh của đa giác tần số:
        - Nhóm 1 có giá trị đại diện $x_1 = 15$, tần số $n_1 = 10$.
        - Nhóm 2 có giá trị đại diện $x_2 = 25$, tần số $n_2 = 15$.
        - Nhóm 3 có giá trị đại diện $x_3 = 35$, tần số $n_3 = 20$.
        - Nhóm 4 có giá trị đại diện $x_4 = 45$, tần số $n_4 = 5$.
    ]
    #step[
      - Tính tổng cỡ mẫu:
        $n = 10 + 15 + 20 + 5 = 50$ (học sinh).
      - Tính số trung bình mẫu ghép nhóm:
        $bar(x) = frac(n_1 x_1 + n_2 x_2 + n_3 x_3 + n_4 x_4, n)$
        $bar(x) = frac(10 dot.c 15 + 15 dot.c 25 + 20 dot.c 35 + 5 dot.c 45, 50)$
    ]
    #step[
      - Tính toán giá trị số:
        $bar(x) = frac(150 + 375 + 700 + 225, 50) = frac(1450, 50) = 29.0$ (phút).
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Sử dụng cùng mẫu số liệu đi bộ đến trường của 50 học sinh ở câu trên, hãy tìm phương sai $s^2$ của mẫu số liệu.],
  ([$80.0$], [$82.5$], True([$84.0$]), [$86.5$]),
  accent: c-book,
  loigiai: [
    #step[
      - Sử dụng các dữ liệu đã biết:
        - Số trung bình mẫu: $bar(x) = 29$ phút.
        - Giá trị đại diện và tần số tương ứng: $(15; 10)$, $(25; 15)$, $(35; 20)$, $(45; 5)$.
    ]
    #step[
      - Áp dụng công thức tính phương sai $s^2$:
        $s^2 = frac(1, n) sum_(i=1)^4 n_i (x_i - bar(x))^2$
        $s^2 = frac(10(15 - 29)^2 + 15(25 - 29)^2 + 20(35 - 29)^2 + 5(45 - 29)^2, 50)$
    ]
    #step[
      - Tính toán chi tiết các số hạng:
        - $10 dot.c (-14)^2 = 10 dot.c 196 = 1960$
        - $15 dot.c (-4)^2 = 15 dot.c 16 = 240$
        - $20 dot.c 6^2 = 20 dot.c 36 = 720$
        - $5 dot.c 16^2 = 5 dot.c 256 = 1280$
      - Tổng bình phương độ lệch:
        $1960 + 240 + 720 + 1280 = 4200$
      - Phương sai:
        $s^2 = frac(4200, 50) = 84$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Sử dụng kết quả phương sai ở câu trên, hãy xác định độ lệch chuẩn $s$ tương ứng (làm tròn đến hai chữ số thập phân).],
  ([$8.94$], [$9.06$], True([$9.17$]), [$9.27$]),
  accent: c-book,
  loigiai: [
    #step[
      - Độ lệch chuẩn $s$ là căn bậc hai số học của phương sai $s^2$:
        $s = sqrt(s^2)$
    ]
    #step[
      - Thay số:
        $s = sqrt(84) approx 9.165 approx 9.17$ (phút).
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Khi so sánh hai mẫu số liệu ghép nhóm của cùng một chỉ tiêu thực tế có cùng số trung bình cộng $bar(x)$, mẫu số liệu nào có độ lệch chuẩn nhỏ hơn thì chứng tỏ điều gì?],
  (
    [Mẫu số liệu đó có khoảng biến thiên lớn hơn.],
    [Mẫu số liệu đó có giá trị trung bình không ổn định.],
    True([Các số liệu trong mẫu đó tập trung sát nhau và ổn định hơn xung quanh số trung bình.]),
    [Mẫu số liệu đó có tổng tần số (cỡ mẫu) nhỏ hơn.],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Ý nghĩa thực tế của phương sai và độ lệch chuẩn là đo lường mức độ biến động, phân tán của mẫu số liệu xung quanh số trung bình cộng.
    ]
    #step[
      - Do đó, khi hai mẫu có cùng trung bình cộng, mẫu nào có độ lệch chuẩn nhỏ hơn thì các giá trị số liệu ít biến động hơn, tập trung sát nhau và có độ ổn định cao hơn.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho mẫu số liệu ghép nhóm có phương sai $s^2$. Nếu ta nhân mọi số liệu thô trong mẫu với hằng số $k = 2$, thì phương sai mới của mẫu sẽ bằng bao nhiêu?],
  ([$2 s^2$], True([$4 s^2$]), [$s^2$], [$8 s^2$]),
  accent: c-book,
  loigiai: [
    #step[
      - Khi nhân mọi số liệu thô với hằng số $k$, giá trị đại diện $x_i$ và số trung bình $bar(x)$ đều nhân lên $k$ lần.
      - Độ lệch độ rộng $(x_i - bar(x))$ nhân lên $k$ lần.
    ]
    #step[
      - Bình phương độ lệch $(x_i - bar(x))^2$ nhân lên $k^2$ lần.
      - Do đó phương sai mới:
        $s'^2 = k^2 s^2 = 2^2 s^2 = 4 s^2$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho mẫu số liệu ghép nhóm có độ lệch chuẩn là $s$. Nếu ta nhân mọi số liệu thô trong mẫu với hằng số $k = 3$, thì độ lệch chuẩn mới của mẫu sẽ bằng bao nhiêu?],
  ([$9 s$], [$s$], True([$3 s$]), [$6 s$]),
  accent: c-book,
  loigiai: [
    #step[
      - Dựa trên công thức liên hệ: độ lệch chuẩn mới bằng căn bậc hai phương sai mới:
        $s' = sqrt(s'^2)$
    ]
    #step[
      - Ta đã biết phương sai mới là $k^2 s^2 = 9 s^2$.
      - Suy ra độ lệch chuẩn mới:
        $s' = sqrt(9 s^2) = 3 s$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Để đo độ ổn định về khối lượng đóng gói của hai máy tự động A và B, người ta cân 100 gói sản phẩm từ mỗi máy. Kết quả tính toán cho thấy máy A có độ lệch chuẩn $s_A = 1.2$ g, máy B có độ lệch chuẩn $s_B = 2.5$ g. Khẳng định nào sau đây đúng?],
  (
    [Khối lượng đóng gói của máy B đồng đều hơn máy A.],
    True([Khối lượng đóng gói của máy A đồng đều và ổn định hơn máy B.]),
    [Khối lượng đóng gói trung bình của máy A lớn hơn máy B.],
    [Máy A đóng gói thiếu chính xác hơn máy B.],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Độ lệch chuẩn đo mức độ chênh lệch khối lượng giữa các sản phẩm được đóng gói.
    ]
    #step[
      - Vì độ lệch chuẩn của máy A ($1.2$ g) nhỏ hơn rất nhiều so với máy B ($2.5$ g) nên khối lượng đóng gói ở máy A có độ đồng đều và ổn định cao hơn hẳn máy B.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho mẫu số liệu ghép nhóm gồm các nhóm $[10; 20)$, $[20; 30)$, $[30; 40)$, $[40; 50)$ với các tần số tương ứng là $4, a, b, 4$. Biết cỡ mẫu $n = 40$ và số trung bình mẫu là $bar(x) = 30$. Hãy xác định giá trị của tần số ẩn $a$.],
  ([$12$], [$14$], True([$16$]), [$18$]),
  accent: c-book,
  loigiai: [
    #step[
      - Đầu tiên lập phương trình cỡ mẫu:
        $n = 4 + a + b + 4 = 40 ==> a + b = 32$ (1)
      - Lập danh sách giá trị đại diện của các nhóm:
        $x_1 = 15, x_2 = 25, x_3 = 35, x_4 = 45$.
    ]
    #step[
      - Lập phương trình số trung bình cộng mẫu ghép nhóm:
        $bar(x) = frac(4 dot.c 15 + a dot.c 25 + b dot.c 35 + 4 dot.c 45, 40) = 30$
        $60 + 25a + 35b + 180 = 1200 ==> 25a + 35b = 960$
        $5a + 7b = 192$ (2)
    ]
    #step[
      - Giải hệ phương trình (1) và (2):
        Từ (1) rút ra $a = 32 - b$. Thế vào (2):
        $5(32 - b) + 7b = 192 ==> 160 + 2b = 192 ==> 2b = 32 ==> b = 16$.
        Thay lại có $a = 32 - 16 = 16$.
      - Vậy tần số $a = 16$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Sử dụng cùng mẫu số liệu ghép nhóm chứa các tham số tần số ẩn ở câu trên, hãy xác định phương sai $s^2$ của mẫu số liệu đó.],
  ([$s^2 = 50$], [$s^2 = 55$], [$s^2 = 60$], True([$s^2 = 65$])),
  accent: c-book,
  loigiai: [
    #step[
      - Bảng tần số hoàn chỉnh từ câu trước:
        - Nhóm $[10; 20)$ có tần số 4 (giá trị đại diện 15).
        - Nhóm $[20; 30)$ có tần số 16 (giá trị đại diện 25).
        - Nhóm $[30; 40)$ có tần số 16 (giá trị đại diện 35).
        - Nhóm $[40; 50)$ có tần số 4 (giá trị đại diện 45).
        - Số trung bình cộng: $bar(x) = 30$.
    ]
    #step[
      - Áp dụng công thức tính phương sai $s^2$:
        $s^2 = frac(1, n) sum_(i=1)^4 n_i (x_i - bar(x))^2$
        $s^2 = frac(4(15-30)^2 + 16(25-30)^2 + 16(35-30)^2 + 4(45-30)^2, 40)$
    ]
    #step[
      - Tính toán giá trị số:
        $s^2 = frac(4 dot.c 225 + 16 dot.c 25 + 16 dot.c 25 + 4 dot.c 225, 40)$
        $s^2 = frac(900 + 400 + 400 + 900, 40) = frac(2600, 40) = 65$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một công thức khác được dùng rất phổ biến để tính phương sai của mẫu số liệu ghép nhóm là gì?],
  (
    [$s^2 = bar(x)^2 - (1/n) sum_(i=1)^k n_i x_i^2$],
    True([$s^2 = (1/n) sum_(i=1)^k n_i x_i^2 - bar(x)^2$]),
    [$s^2 = (1/n) sum_(i=1)^k (n_i x_i)^2 - bar(x)^2$],
    [$s^2 = (1/n) sum_(i=1)^k n_i (x_i^2 - bar(x)^2)$],
  ),
  accent: c-book,
  loigiai: [
    #step[
      - Đây là công thức tính nhanh phương sai bằng cách khai triển hằng đẳng thức từ công thức gốc:
        $s^2 = frac(1, n) sum n_i (x_i - bar(x))^2 = frac(1, n) sum n_i (x_i^2 - 2 x_i bar(x) + bar(x)^2)$
        $= frac(1, n) sum n_i x_i^2 - 2 bar(x) (frac(1, n) sum n_i x_i) + bar(x)^2 (frac(1, n) sum n_i)$
        $= (frac(1, n) sum n_i x_i^2) - 2 bar(x)^2 + bar(x)^2 = (frac(1, n) sum n_i x_i^2) - bar(x)^2$.
      - Vậy phương án đúng là B.
    ]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "doc", ds(
  [Bảng khảo sát lượng điện tiêu thụ hàng tháng (kWh) của 40 hộ gia đình tại một khu chung cư được cho như sau:
    #align(center)[
      #table(
        columns: (1.8fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Lượng điện (kWh)], $[100; 150)$, $[150; 200)$, $[200; 250)$, $[250; 300)$,
        [Số hộ gia đình], [8], [12], [16], [4]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Giá trị đại diện của nhóm thứ ba $[200; 250)$ là $225$ kWh.]),
    True([Lượng điện tiêu thụ trung bình hàng tháng của 40 hộ là $bar(x) = 195$ kWh.]),
    [Phương sai của mẫu số liệu là $s^2 = 1800$ kWh².],
    True([Độ lệch chuẩn của mẫu số liệu lớn hơn 45 kWh.]),
  ),
  accent: c-book,
  loigiai: [
    - a) *Đúng*: Giá trị đại diện của nhóm 3 là $x_3 = frac(200 + 250, 2) = 225$ kWh.
    - b) *Đúng*: Các giá trị đại diện lần lượt là $125, 175, 225, 275$.
      - Số trung bình: $bar(x) = frac(8 dot.c 125 + 12 dot.c 175 + 16 dot.c 225 + 4 dot.c 275, 40) = 195$ kWh.
    - c) *Sai*: Phương sai thực tế là:
      - $s^2 = frac(8(125-195)^2 + 12(175-195)^2 + 16(225-195)^2 + 4(275-195)^2, 40)$
      - $s^2 = frac(8(-70)^2 + 12(-20)^2 + 16(30)^2 + 4(80)^2, 40)$
      - $s^2 = frac(39200 + 4800 + 14400 + 25600, 40) = frac(84000, 40) = 2100$ kWh², không phải $1800$.
    - d) *Đúng*: Độ lệch chuẩn là $s = sqrt(2100) approx 45.83$ kWh, giá trị này lớn hơn 45.
  ],
))

#q-wrap(dir: "doc", ds(
  [Để so sánh tốc độ gõ phím (từ/phút) của hai nhóm nhân viên văn phòng, người ta có bảng số liệu sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Tốc độ gõ], $[40; 50)$, $[50; 60)$, $[60; 70)$, $[70; 80)$,
        [Nhóm A], [5], [10], [15], [10],
        [Nhóm B], [2], [18], [12], [8]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Cỡ mẫu khảo sát của cả hai nhóm nhân viên A và B đều bằng 40.]),
    True([Tốc độ gõ phím trung bình của nhóm A là $bar(x)_A = 62.5$ từ/phút và nhóm B là $bar(x)_B = 61.5$ từ/phút.]),
    [Phương sai tốc độ gõ phím của nhóm B lớn hơn của nhóm A.],
    True([Tốc độ gõ phím của nhân viên nhóm B đồng đều và ổn định hơn nhóm A.]),
  ),
  accent: c-book,
  loigiai: [
    - a) *Đúng*: Cỡ mẫu nhóm A là $5 + 10 + 15 + 10 = 40$. Nhóm B là $2 + 18 + 12 + 8 = 40$.
    - b) *Đúng*: Giá trị đại diện lần lượt là $45, 55, 65, 75$.
      - $bar(x)_A = frac(5 dot.c 45 + 10 dot.c 55 + 15 dot.c 65 + 10 dot.c 75, 40) = 62.5$.
      - $bar(x)_B = frac(2 dot.c 45 + 18 dot.c 55 + 12 dot.c 65 + 8 dot.c 75, 40) = 61.5$.
    - c) *Sai*: Tính phương sai hai nhóm:
      - $s_A^2 = frac(5(-17.5)^2 + 10(-7.5)^2 + 15(2.5)^2 + 10(12.5)^2, 40) = 93.75$.
      - $s_B^2 = frac(2(-16.5)^2 + 18(-6.5)^2 + 12(3.5)^2 + 8(13.5)^2, 40) = 72.75$.
      - Vì $72.75 < 93.75$ nên phương sai nhóm B nhỏ hơn nhóm A.
    - d) *Đúng*: Vì $s_B^2 < s_A^2 ==> s_B < s_A$ nên tốc độ gõ phím nhóm B ít biến động hơn, đồng đều ổn định hơn nhóm A.
  ],
))

#q-wrap(dir: "doc", ds(
  [Để khảo sát độ ổn định năng suất của hai giống lúa mới A và B, người ta gieo cấy thử nghiệm trên cùng một vùng canh tác lớn và ghi nhận kết quả:
    - Giống lúa A: Năng suất trung bình $bar(x)_A = 6.0$ tấn/ha, độ lệch chuẩn $s_A = 0.60$ tấn/ha.
    - Giống lúa B: Năng suất trung bình $bar(x)_B = 8.0$ tấn/ha, độ lệch chuẩn $s_B = 0.72$ tấn/ha.
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Độ lệch chuẩn năng suất của giống lúa A nhỏ hơn giống lúa B ($0.60 < 0.72$ tấn/ha).]),
    True([Hệ số biến thiên năng suất của giống lúa A là $"CV"_A = 10.0%$.]),
    True([Hệ số biến thiên năng suất của giống lúa B là $"CV"_B = 9.0%$.]),
    [Do có độ lệch chuẩn nhỏ hơn, năng suất của giống lúa A phát triển đồng đều và ổn định hơn giống lúa B về mặt tương đối.],
  ),
  accent: c-book,
  loigiai: [
    - a) *Đúng*: Rõ ràng độ lệch chuẩn giống A là $0.60$ tấn/ha nhỏ hơn giống B là $0.72$ tấn/ha.
    - b) *Đúng*: Hệ số biến thiên giống A:
      - $"CV"_A = frac(s_A, bar(x)_A) = frac(0.60, 6.0) = 0.1 = 10%$.
    - c) *Đúng*: Hệ số biến thiên giống B:
      - $"CV"_B = frac(s_B, bar(x)_B) = frac(0.72, 8.0) = 0.09 = 9%$.
    - d) *Sai*: Khi so sánh độ ổn định năng suất của hai giống có số trung bình khác nhau ($6.0$ và $8.0$), việc so sánh trực tiếp độ lệch chuẩn thô là chưa chính xác vì quy mô năng suất khác nhau.
      - Ta phải sử dụng hệ số biến thiên $"CV"$.
      - Vì $"CV"_B = 9% < 10% = "CV"_A$ nên giống lúa B mới có năng suất đồng đều và ổn định hơn giống A khi xét về tỷ lệ tương đối.
  ],
))

#q-wrap(dir: "doc", ds(
  [Cho mẫu số liệu ghép nhóm có bảng tần số sau:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Nhóm], $[10; 20)$, $[20; 30)$, $[30; 40)$,
        [Tần số], [5], [10], [5]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Cỡ mẫu $n = 20$.]),
    True([Trung bình mẫu $bar(x) = 25$.]),
    True([Phương sai mẫu $s^2 = 50$.]),
    [Độ lệch chuẩn mẫu $s = 5.0$.],
  ),
  accent: c-book,
  loigiai: [
    - a) *Đúng*: Cỡ mẫu $n = 5 + 10 + 5 = 20$.
    - b) *Đúng*: Giá trị đại diện $15, 25, 35$.
      - $bar(x) = frac(5 dot.c 15 + 10 dot.c 25 + 5 dot.c 35, 20) = 25$.
    - c) *Đúng*: Phương sai $s^2 = frac(5(15-25)^2 + 10(25-25)^2 + 5(35-25)^2, 20) = frac(500 + 0 + 500, 20) = 50$.
    - d) *Sai*: Độ lệch chuẩn $s = sqrt(50) approx 7.07$, không phải $5.0$.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "ngang", tln(
  [Tìm giá trị đại diện $x_i$ của nhóm số liệu $[25.5; 30.5)$.],
  [$28$],
  accent: c-book,
  loigiai: [
    #step[
      - Áp dụng công thức tính giá trị đại diện cho nhóm $[25.5; 30.5)$:
        $x = frac(25.5 + 30.5, 2)$
    ]
    #step[
      - Tính toán kết quả:
        $x = frac(56, 2) = 28$.
    ]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Khảo sát doanh thu (triệu đồng) trong 20 ngày của một cửa hàng thu được bảng tần số:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Doanh thu], $[10; 20)$, $[20; 30)$, $[30; 40)$,
        [Số ngày], [4], [12], [4]
      )
    ]
    Tính doanh thu trung bình hàng ngày của cửa hàng (triệu đồng).],
  [$25$],
  accent: c-book,
  loigiai: [
    #step[
      - Cỡ mẫu: $n = 20$.
      - Giá trị đại diện các nhóm tương ứng: $x_1 = 15, x_2 = 25, x_3 = 35$.
    ]
    #step[
      - Doanh thu trung bình hàng ngày:
        $bar(x) = frac(4 dot.c 15 + 12 dot.c 25 + 4 dot.c 35, 20)$
        $bar(x) = frac(60 + 300 + 140, 20) = frac(500, 20) = 25$ (triệu đồng).
    ]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Sử dụng cùng mẫu số liệu về doanh thu cửa hàng ở câu trên, hãy tính phương sai $s^2$ của mẫu số liệu này.],
  [$20$],
  accent: c-book,
  loigiai: [
    #step[
      - Đã biết trung bình mẫu: $bar(x) = 25$ triệu đồng.
      - Giá trị đại diện và tần số: $(15; 4)$, $(25; 12)$, $(35; 4)$.
    ]
    #step[
      - Tính phương sai mẫu $s^2$:
        $s^2 = frac(4(15 - 25)^2 + 12(25 - 25)^2 + 4(35 - 25)^2, 20)$
        $s^2 = frac(400 + 0 + 400, 20) = frac(800, 20) = 20$.
    ]
  ],
))

#q-wrap(dir: "ngang", tln(
  [Sử dụng cùng mẫu số liệu về doanh thu cửa hàng ở câu trên, tính độ lệch chuẩn $s$ tương ứng (làm tròn kết quả đến hai chữ số thập phân).],
  [$4.47$],
  accent: c-book,
  loigiai: [
    #step[
      - Độ lệch chuẩn $s$ là căn bậc hai của phương sai $s^2$:
        $s = sqrt(s^2) = sqrt(20)$
    ]
    #step[
      - Tính toán xấp xỉ:
        $s approx 4.4721 approx 4.47$ (triệu đồng).
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Khảo sát quãng đường tự đi xe đạp đi học mỗi ngày (km) của 30 học sinh:
    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Quãng đường (km)], $[0; 2)$, $[2; 4)$, $[4; 6)$,
        [Số học sinh], [6], [12], [12]
      )
    ]
    Tính độ lệch chuẩn $s$ của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hai chữ số thập phân).],
  [$1.5$],
  accent: c-book,
  loigiai: [
    #step[
      - Cỡ mẫu $n = 6 + 12 + 12 = 30$ học sinh.
      - Giá trị đại diện tương ứng: $x_1 = 1, x_2 = 3, x_3 = 5$.
      - Trung bình cộng:
        $bar(x) = frac(6 dot.c 1 + 12 dot.c 3 + 12 dot.c 5, 30) = frac(6 + 36 + 60, 30) = frac(102, 30) = 3.4$ km.
    ]
    #step[
      - Tính phương sai mẫu $s^2$:
        $s^2 = frac(6(1 - 3.4)^2 + 12(3 - 3.4)^2 + 12(5 - 3.4)^2, 30)$
        $s^2 = frac(6(-2.4)^2 + 12(-0.4)^2 + 12(1.6)^2, 30)$
    ]
    #step[
      - Thực hiện tính toán số hạng:
        $s^2 = frac(6 dot.c 5.76 + 12 dot.c 0.16 + 12 dot.c 2.56, 30)$
        $s^2 = frac(34.56 + 1.92 + 30.72, 30) = frac(67.2, 30) = 2.24$
      - Tính độ lệch chuẩn:
        $s = sqrt(2.24) approx 1.4967 approx 1.50$ (km).
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho mẫu số liệu ghép nhóm không liên tục biểu diễn tuổi thọ của thiết bị (năm):
    #align(center)[
      #table(
        columns: (1.8fr, 1.2fr, 1.2fr, 1.2fr),
        align: center,
        [Tuổi thọ (năm)], $[1; 3]$, $[4; 6]$, $[7; 9]$,
        [Số thiết bị], [10], [20], [10]
      )
    ]
    Tính phương sai $s^2$ của mẫu số liệu sau khi đã được hiệu chỉnh liên tục.],
  [$4.5$],
  accent: c-book,
  loigiai: [
    #step[
      - Hiệu chỉnh liên tục các nhóm:
        - $[0.5; 3.5)$ có 10 thiết bị.
        - $[3.5; 6.5)$ có 20 thiết bị.
        - $[6.5; 9.5)$ có 10 thiết bị.
      - Cỡ mẫu $n = 10 + 20 + 10 = 40$.
    ]
    #step[
      - Giá trị đại diện của các nhóm liên tục:
        - $x_1 = frac(0.5 + 3.5, 2) = 2.0$ năm.
        - $x_2 = frac(3.5 + 6.5, 2) = 5.0$ năm.
        - $x_3 = frac(6.5 + 9.5, 2) = 8.0$ năm.
      - Tính trung bình mẫu:
        $bar(x) = frac(10 dot.c 2.0 + 20 dot.c 5.0 + 10 dot.c 8.0, 40) = frac(20 + 100 + 80, 40) = 5.0$ năm.
    ]
    #step[
      - Tính phương sai mẫu $s^2$:
        $s^2 = frac(10(2 - 5)^2 + 20(5 - 5)^2 + 10(8 - 5)^2, 40)$
        $s^2 = frac(10 dot.c 9 + 0 + 10 dot.c 9, 40) = frac(180, 40) = 4.5$.
    ]
  ],
))
