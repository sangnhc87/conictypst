#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ ÔN TẬP KIỂM TRA CUỐI HỌC KỲ II",
  exam-title: "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KỲ II - TOÁN 10 (ĐỀ SỐ 33A)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "200",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Hàm số bậc hai có đồ thị CeTZ)
#tn([Tọa độ đỉnh $I$ của parabol $(P): y = -x^2 + 4x - 3$ là],
    (
        True([$I(2; 1)$]),
        [$I(-2; -15)$],
        [$I(2; -3)$],
        [$I(-2; 1)$]
    ),
    loigiai: [
        *Phương pháp giải:* Tọa độ đỉnh của parabol $y = a x^2 + b x + c$ là $x_I = -b / (2a)$ và $y_I = -Delta / (4a)$:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Hệ trục Oxy
          line((-0.5, 0), (4.5, 0), stroke: 0.8pt, mark: (end: ">"))
          content((4.4, -0.3), [$x$])
          line((0, -3.5), (0, 2), stroke: 0.8pt, mark: (end: ">"))
          content((-0.3, 1.9), [$y$])
          content((-0.25, -0.25), [$O$])

          // Vẽ parabol y = -x^2 + 4x - 3
          line(..range(3, 38).map(t => {
            let x = t / 10;
            (x, -calc.pow(x, 2) + 4 * x - 3)
          }), stroke: 1.2pt + accent)

          // Đỉnh I(2; 1)
          circle((2, 1), radius: 0.06, fill: accent)
          content((2, 1.3), [$I(2; 1)$])
          line((2, 0), (2, 1), stroke: (dash: "dashed", paint: gray))
          line((0, 1), (2, 1), stroke: (dash: "dashed", paint: gray))
        })
        ]
        - Hoành độ đỉnh: $x_I = -4 / (2 times (-1)) = 2$.
        - Tung độ đỉnh: $y_I = -(2)^2 + 4(2) - 3 = -4 + 8 - 3 = 1$.
        Vậy đỉnh của parabol là $I(2; 1)$.
    ]
)

// TN 2 (Dấu tam thức bậc hai)
#tn([Tập nghiệm của bất phương trình bậc hai $2x^2 - 5x + 2 <= 0$ là],
    (
        True([$[1/2; 2]$]),
        [$(-infinity; 1/2] union [2; +infinity)$],
        [$(1/2; 2)$],
        [$[-2; -1/2]$]
    ),
    loigiai: [
        *Phương pháp giải:* Xét dấu tam thức bậc hai $f(x) = 2x^2 - 5x + 2$:
        - Cho $f(x) = 0 <=> 2x^2 - 5x + 2 = 0 <=> x = 2$ hoặc $x = 1/2$.
        - Hệ số $a = 2 > 0$, theo quy tắc "trong trái, ngoài cùng", $f(x) <= 0$ khi $x in [1/2; 2]$.
    ]
)

// TN 3 (Phương trình chứa căn thức)
#tn([Số nghiệm thực của phương trình $sqrt(3x^2 - 9x + 1) = x - 2$ là],
    (
        True([$1$]),
        [$2$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        *Phương pháp giải:* Biến đổi tương đương phương trình dạng $sqrt(f(x)) = g(x)$:
        $ sqrt(3x^2 - 9x + 1) = x - 2 <=> cases(x - 2 >= 0, 3x^2 - 9x + 1 = (x - 2)^2) $
        $ <=> cases(x >= 2, 3x^2 - 9x + 1 = x^2 - 4x + 4) <=> cases(x >= 2, 2x^2 - 5x - 3 = 0) $
        Phương trình bậc hai $2x^2 - 5x - 3 = 0$ có hai nghiệm là $x = 3$ và $x = -1/2$.
        Đối chiếu điều kiện $x >= 2$, chỉ có $x = 3$ thỏa mãn. Phương trình có đúng $1$ nghiệm.
    ]
)

// TN 4 (Khoảng cách điểm đến đường thẳng)
#tn([Trong mặt phẳng tọa độ $O x y$, khoảng cách từ điểm $M(1; -2)$ đến đường thẳng $Delta: 3x - 4y + 4 = 0$ bằng],
    (
        True([$3$]),
        [$15$],
        [$5$],
        [$1$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức tính khoảng cách từ điểm đến đường thẳng:
        $ d(M, Delta) = (|3(1) - 4(-2) + 4|) / sqrt{3^2 + (-4)^2} = (|3 + 8 + 4|) / sqrt{25} = 15 / 5 = 3 $
    ]
)

// TN 5 (Phương trình đường tròn)
#tn([Trong mặt phẳng tọa độ $O x y$, phương trình của đường tròn $(C)$ có tâm $I(2; -1)$ và bán kính $R = 5$ là],
    (
        True([$(x - 2)^2 + (y + 1)^2 = 25$]),
        [$(x + 2)^2 + (y - 1)^2 = 25$],
        [$(x - 2)^2 + (y + 1)^2 = 5$],
        [$(x + 2)^2 + (y - 1)^2 = 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Phương trình chính tắc của đường tròn tâm $I(a; b)$ bán kính $R$ là:
        $ (x - a)^2 + (y - b)^2 = R^2 $
        Thay $a = 2, b = -1, R = 5$ ta được:
        $ (x - 2)^2 + (y + 1)^2 = 25 $
    ]
)

// TN 6 (Góc giữa hai đường thẳng)
#tn([Trong mặt phẳng tọa độ $O x y$, góc giữa hai đường thẳng $d_1: x + sqrt(3)y - 1 = 0$ và $d_2: sqrt(3)x + y + 2 = 0$ bằng],
    (
        True([$30^circ$]),
        [$60^circ$],
        [$45^circ$],
        [$90^circ$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng công thức côsin của góc giữa hai vectơ pháp tuyến:
        - Vectơ pháp tuyến của $d_1$: $vec(n_1) = (1; sqrt(3))$.
        - Vectơ pháp tuyến của $d_2$: $vec(n_2) = (sqrt(3); 1)$.
        $ cos(d_1, d_2) = (|vec(n_1) dot vec(n_2)|) / (|vec(n_1)| times |vec(n_2)|) = (|1 times sqrt(3) + sqrt(3) times 1|) / (sqrt{1 + 3} times sqrt{3 + 1}) = (2sqrt(3)) / (2 times 2) = sqrt(3) / 2 $
        Suy ra góc giữa hai đường thẳng là $30^circ$.
    ]
)

// TN 7 (Ba đường conic - Elip)
#tn([Cho elip $(E)$ có phương trình chính tắc $(x^2) / 25 + (y^2) / 9 = 1$. Tiêu cự của elip $(E)$ bằng],
    (
        True([$8$]),
        [$4$],
        [$10$],
        [$6$]
    ),
    loigiai: [
        *Phương pháp giải:* Xác định các trục và tiêu cự của elip:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Trục tọa độ
          line((-3, 0), (3, 0), stroke: 0.8pt, mark: (end: ">"))
          line((0, -2), (0, 2), stroke: 0.8pt, mark: (end: ">"))
          // Vẽ elip
          circle((0, 0), radius: (2.2, 1.3), stroke: 1.2pt + accent)
          // Tiêu điểm
          circle((-1.5, 0), radius: 0.06, fill: accent)
          content((-1.5, -0.35), [$F_1$])
          circle((1.5, 0), radius: 0.06, fill: accent)
          content((1.5, -0.35), [$F_2$])
        })
        ]
        - Ta có $a^2 = 25 => a = 5$ và $b^2 = 9 => b = 3$.
        - Nửa tiêu cự $c = sqrt{a^2 - b^2} = sqrt{25 - 9} = sqrt{16} = 4$.
        - Tiêu cự của elip là $2c = 2 times 4 = 8$.
    ]
)

// TN 8 (Quy tắc đếm - Lập số tự nhiên)
#tn([Từ các chữ số thuộc tập $S = {1, 2, 3, 4, 5, 6}$, lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau?],
    (
        True([$360$]),
        [$720$],
        [$1296$],
        [$15$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi số tự nhiên có 4 chữ số đôi một khác nhau từ 6 chữ số phân biệt là một chỉnh hợp chập 4 của 6 phần tử:
        $ A_6^4 = 6! / (6 - 4)! = 6 times 5 times 4 times 3 = 360 text(" số") $
    ]
)

// TN 9 (Tổ hợp - Chọn ban cán sự)
#tn([Một lớp học gồm $20$ học sinh nam và $15$ học sinh nữ. Số cách chọn ra một ban đại diện gồm $3$ học sinh trong đó có cả nam và nữ là],
    (
        True([$4950$]),
        [$6545$],
        [$1595$],
        [$300$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp phần bù (biến cố đối):
        - Tổng số cách chọn $3$ học sinh bất kỳ từ $35$ học sinh: $C_{35}^3 = 6545$.
        - Số cách chọn $3$ học sinh toàn nam: $C_{20}^3 = 1140$.
        - Số cách chọn $3$ học sinh toàn nữ: $C_{15}^3 = 455$.
        - Số cách chọn có cả nam và nữ:
        $ 6545 - (1140 + 455) = 4950 text(" cách") $
    ]
)

// TN 10 (Khai triển nhị thức Newton)
#tn([Hệ số của số hạng chứa $x^3$ trong khai triển nhị thức Newton của $(2x - 1)^5$ là],
    (
        True([$80$]),
        [$-80$],
        [$40$],
        [$-40$]
    ),
    loigiai: [
        *Phương pháp giải:* Số hạng tổng quát thứ $k + 1$ trong khai triển $(a + b)^5$:
        $ T_{k+1} = C_5^k (2x)^{5-k} (-1)^k = C_5^k times 2^{5-k} times (-1)^k times x^{5-k} $
        Số hạng chứa $x^3$ tương ứng với $5 - k = 3 <=> k = 2$.
        Hệ số của $x^3$ là:
        $ C_5^2 times 2^3 times (-1)^2 = 10 times 8 times 1 = 80 $
    ]
)

// TN 11 (Xác suất cổ điển rút bài)
#tn([Rút ngẫu nhiên đồng thời $2$ lá bài từ bộ bài tây tiêu chuẩn $52$ lá. Xác suất để rút được $2$ lá bài cùng chất (cùng cơ, cùng rô, cùng tép hoặc cùng bích) bằng],
    (
        True([$4 / 17$]),
        [$1 / 4$],
        [$1 / 17$],
        [$12 / 51$]
    ),
    loigiai: [
        *Phương pháp giải:* Tính xác suất theo định nghĩa cổ điển:
        - Số phần tử không gian mẫu: $n(Omega) = C_{52}^2 = 1326$.
        - Mỗi chất có $13$ lá bài. Số cách chọn $2$ lá bài cùng chất:
        $ n(A) = 4 times C_{13}^2 = 4 times 78 = 312 $
        - Xác suất cần tìm:
        $ P(A) = 312 / 1326 = 4 / 17 approx 0.2353 $
    ]
)

// TN 12 (Xác suất biến cố độc lập)
#tn([Hai xạ thủ độc lập cùng bắn vào một tấm bia mục tiêu. Xác suất bắn trúng của xạ thủ thứ nhất là $0.8$, của xạ thủ thứ hai là $0.7$. Xác suất để có ít nhất một xạ thủ bắn trúng mục tiêu là],
    (
        True([$0.94$]),
        [$0.56$],
        [$0.06$],
        [$0.86$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: cả hai xạ thủ cùng bắn trượt.
        - Xác suất xạ thủ 1 bắn trượt: $1 - 0.8 = 0.2$.
        - Xác suất xạ thủ 2 bắn trượt: $1 - 0.7 = 0.3$.
        - Xác suất cả hai cùng bắn trượt: $(0.2) times (0.3) = 0.06$.
        - Xác suất có ít nhất một người bắn trúng:
        $ P = 1 - 0.06 = 0.94 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Mô hình parabol cổng hầm giao thông)
#ds([Một đường hầm giao thông có mặt cắt dạng parabol được mô phỏng trong mặt phẳng tọa độ $O x y$ bởi phương trình $y = -1/2 x^2 + 2x + 6$ ($x, y$ tính theo đơn vị mét, với mặt đất nằm trên trục hoành $O x$).
Xét tính đúng sai của các nhận định sau:],
    (
        True([Tọa độ đỉnh của parabol là $I(2; 8)$ và chiều cao lớn nhất của vòm hầm là $8" m"$.]),
        True([Chiều rộng của mặt đất tại chân đường hầm (nơi $y = 0$) bằng $8" m"$.]),
        True([Tại vị trí cách trục đối xứng của đường hầm một khoảng $2" m"$, chiều cao của vòm hầm bằng $6" m"$.]),
        [Một xe tải chở hàng có chiều rộng $4" m"$ và chiều cao $6.5" m"$ có thể đi lọt qua chính giữa hầm một cách an toàn.]
    ),
    loigiai: [
        *Phương pháp giải:* Khảo sát và ứng dụng thực tiễn của hàm số bậc hai:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((-2, 0), (4.5, 0), stroke: 0.8pt, mark: (end: ">"))
          content((4.4, -0.25), [$x$])
          line((0, -0.4), (0, 3.4), stroke: 0.8pt, mark: (end: ">"))
          content((-0.25, 3.2), [$y$])
          content((-0.2, -0.2), [$O$])

          // Parabol tỉ lệ x * 0.5, y * 0.35
          line(..range(-20, 61).map(t => {
            let x = t / 10;
            (x * 0.5, (-0.5 * calc.pow(x, 2) + 2 * x + 6) * 0.35)
          }), stroke: 1.2pt + accent)

          // Đỉnh I(2; 8) -> (1.0, 2.8)
          circle((1.0, 2.8), radius: 0.05, fill: accent)
          content((1.0, 3.1), [$I(2; 8)$])
          line((1.0, 0), (1.0, 2.8), stroke: (dash: "dashed", paint: gray))
        })
        ]
        #step([Xét ý a: Tọa độ đỉnh])
        - Hoành độ đỉnh: $x_I = -2 / (2 times (-1/2)) = 2$.
        - Tung độ đỉnh: $y_I = -1/2 (2)^2 + 2(2) + 6 = 8$. Chiều cao lớn nhất là $8" m"$. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Chiều rộng chân hầm])
        - Giải phương trình mặt đất $y = 0 <=> -1/2 x^2 + 2x + 6 = 0 <=> x^2 - 4x - 12 = 0 <=> x = 6$ hoặc $x = -2$.
        - Chiều rộng chân vòm: $d = 6 - (-2) = 8" m"$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Chiều cao tại vị trí cách trục 2 m])
        - Trục đối xứng là $x = 2$. Vị trí cách trục $2" m"$ tương ứng $x = 2 + 2 = 4$ hoặc $x = 2 - 2 = 0$.
        - Với $x = 0$ hoặc $x = 4$: $y = 6" m"$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Khả năng lọt qua của xe tải])
        - Khi xe rộng $4" m"$ đi chính giữa hầm, hai bên mép thùng xe nằm tại $x = 0$ và $x = 4$.
        - Chiều cao vòm hầm tại vị trí hai mép thùng xe chỉ đạt $6" m"$. Do xe cao $6.5" m" > 6" m"$, xe sẽ bị va chạm vào vòm và không thể đi qua lọt. Khẳng định đi lọt an toàn là SAI. Mệnh đề d SAI.
    ]
)

// DS 2 (Câu 14 - Đường tròn và tiếp tuyến Oxy)
#ds([Trong mặt phẳng tọa độ $O x y$, cho đường tròn $(C): x^2 + y^2 - 6x - 4y + 4 = 0$ và điểm $A(6; 6)$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Đường tròn $(C)$ có tọa độ tâm là $I(3; 2)$ và bán kính $R = 3$.]),
        True([Điểm $A(6; 6)$ nằm ngoài đường tròn $(C)$ vì khoảng cách $I A = 5 > R$.]),
        True([Độ dài đoạn tiếp tuyến kẻ từ điểm $A$ đến tiếp điểm trên đường tròn $(C)$ bằng $4$.]),
        [Từ điểm $A$ kẻ được đúng một tiếp tuyến duy nhất đến đường tròn $(C)$.]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương trình đường tròn và tính chất tiếp tuyến:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1.2pt + accent)
          circle((0, 0), radius: 0.05, fill: accent)
          content((0, -0.3), [$I$])
          circle((2.8, 1.8), radius: 0.06, fill: red)
          content((3.1, 1.8), [$A$])
          line((0, 0), (2.8, 1.8), stroke: (dash: "dashed", paint: gray))
          line((2.8, 1.8), (0.9, 1.2), stroke: 1pt + accent)
          line((2.8, 1.8), (1.4, -0.5), stroke: 1pt + accent)
        })
        ]
        #step([Xét ý a, b: Tâm, bán kính và vị trí tương đối])
        - Phương trình $(C): (x - 3)^2 + (y - 2)^2 = 3^2 + 2^2 - 4 = 9 =>$ Tâm $I(3; 2)$, bán kính $R = sqrt(9) = 3$. Mệnh đề a ĐÚNG.
        - Khoảng cách $I A = sqrt{(6 - 3)^2 + (6 - 2)^2} = sqrt{3^2 + 4^2} = 5 > R = 3 => A$ nằm ngoài đường tròn. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Độ dài tiếp tuyến])
        - Gọi $M$ là tiếp điểm, tam giác $I M A$ vuông tại $M$:
        $ A M = sqrt{I A^2 - R^2} = sqrt{5^2 - 3^2} = 4 $
        Mệnh đề c ĐÚNG.
        #step([Xét ý d: Số lượng tiếp tuyến])
        - Vì $A$ nằm ngoài đường tròn $(C)$, từ $A$ luôn kẻ được đúng $2$ tiếp tuyến phân biệt đến $(C)$. Khẳng định chỉ kẻ được một tiếp tuyến duy nhất là SAI. Mệnh đề d SAI.
    ]
)

// DS 3 (Câu 15 - Đại số tổ hợp và lập số)
#ds([Cho tập hợp các chữ số $S = {0, 1, 2, 3, 4, 5, 6}$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Số các số tự nhiên gồm $4$ chữ số đôi một khác nhau lập từ tập $S$ là $720$ số.]),
        True([Số các số tự nhiên chẵn gồm $4$ chữ số đôi một khác nhau lập từ tập $S$ là $420$ số.]),
        True([Xếp $3$ nam và $2$ nữ vào một hàng dọc gồm $5$ vị trí, có $48$ cách xếp để $2$ bạn nữ luôn đứng cạnh nhau.]),
        [Số cách chọn ra $3$ chữ số từ tập $S$ sao cho tổng của chúng chia hết cho $3$ lớn hơn $50$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng các quy tắc đếm, hoán vị, chỉnh hợp và tổ hợp:
        #step([Xét ý a: Lập số có 4 chữ số khác nhau])
        - Gọi số cần lập là $macron(a b c d)$ với $a != 0$.
        - Chọn $a in S backslash {0}$: có $6$ cách.
        - Chọn và sắp xếp $3$ chữ số $b, c, d$ từ $6$ chữ số còn lại: $A_6^3 = 120$ cách.
        - Tổng số: $6 times 120 = 720$ số. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Lập số chẵn])
        - Trường hợp 1: $d = 0$ (1 cách). Chọn 3 chữ số $a, b, c$: $A_6^3 = 120$ cách.
        - Trường hợp 2: $d in {2, 4, 6}$ (3 cách). Chọn $a in S backslash {0, d}$ (5 cách). Chọn $b, c$ từ 5 số còn lại: $A_5^2 = 20$ cách. Số cách: $3 times 5 times 20 = 300$.
        - Tổng số chẵn: $120 + 300 = 420$ số. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Xếp hàng nữ đứng cạnh nhau])
        - Coi 2 bạn nữ là một nhóm $X$, có $2! = 2$ cách hoán vị 2 bạn nữ trong nhóm.
        - Xếp nhóm $X$ cùng 3 bạn nam (tổng 4 phần tử): $4! = 24$ cách.
        - Số cách xếp: $2! times 4! = 48$ cách. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Chọn 3 chữ số có tổng chia hết cho 3])
        - Phân loại theo số dư khi chia cho 3:
          + Nhóm dư 0: $A_0 = {0, 3, 6}$ ($3$ số).
          + Nhóm dư 1: $A_1 = {1, 4}$ ($2$ số).
          + Nhóm dư 2: $A_2 = {2, 5}$ ($2$ số).
        - Tổng 3 số chia hết cho 3 khi:
          + Cùng thuộc $A_0$: $C_3^3 = 1$ cách.
          + Mỗi số thuộc một nhóm: $C_3^1 times C_2^1 times C_2^1 = 3 times 2 times 2 = 12$ cách.
        - Tổng số cách chọn: $1 + 12 = 13$ cách. Do $13 < 50$, mệnh đề d SAI.
    ]
)

// DS 4 (Câu 16 - Xác suất rút bi)
#ds([Một hộp kín chứa $15$ viên bi có cùng kích thước và khối lượng, gồm $7$ viên bi màu đỏ, $5$ viên bi màu xanh và $3$ viên bi màu vàng. Lấy ngẫu nhiên đồng thời $3$ viên bi từ hộp.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Số phần tử của không gian mẫu là $n(Omega) = C_{15}^3 = 455$.]),
        True([Xác suất để $3$ viên bi lấy ra có đủ cả ba màu đỏ, xanh, vàng bằng $3 / 13$.]),
        True([Xác suất để trong $3$ viên bi lấy ra có ít nhất một viên bi màu đỏ bằng $57 / 65$.]),
        [Xác suất để cả $3$ viên bi lấy ra có cùng một màu lớn hơn $0.15$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức tính xác suất cổ điển:
        #step([Xét ý a: Không gian mẫu])
        - $n(Omega) = C_{15}^3 = (15 times 14 times 13) / 6 = 455$. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Đủ cả 3 màu])
        - Chọn 1 đỏ, 1 xanh, 1 vàng: $C_7^1 times C_5^1 times C_3^1 = 7 times 5 times 3 = 105$.
        - Xác suất: $P = 105 / 455 = 3 / 13$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Ít nhất một viên đỏ])
        - Biến cố đối: không có viên bi đỏ nào (chỉ chọn từ 8 viên xanh và vàng): $C_8^3 = 56$.
        - Xác suất: $P = 1 - 56 / 455 = 399 / 455 = 57 / 65$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Cả 3 viên cùng màu])
        - Số cách chọn 3 viên cùng màu: $C_7^3 + C_5^3 + C_3^3 = 35 + 10 + 1 = 46$.
        - Xác suất: $P = 46 / 455 approx 0.1011 < 0.15$. Do đó khẳng định lớn hơn $0.15$ là SAI. Mệnh đề d SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Tìm giá trị lớn nhất của hàm số bậc hai $y = -2x^2 + 8x - 3$ trên đoạn $[0; 3]$.],
    [5],
    loigiai: [
        *Phương pháp giải:* Khảo sát hàm số bậc hai trên đoạn kín:
        #step([Tìm đỉnh và tính giá trị biên])
        - Hoành độ đỉnh: $x_I = -8 / (2 times (-2)) = 2 in [0; 3]$.
        - Ta có: $y(2) = -2(2)^2 + 8(2) - 3 = 5$.
        - Tại các đầu mút: $y(0) = -3$; $y(3) = -2(3)^2 + 8(3) - 3 = 3$.
        Vậy giá trị lớn nhất của hàm số trên đoạn $[0; 3]$ là $5$.
    ]
)

// TLN 2 (Câu 18)
#tln([Trong mặt phẳng tọa độ $O x y$, tính bán kính $R$ của đường tròn $(C): x^2 + y^2 - 4x + 6y - 12 = 0$.],
    [5],
    loigiai: [
        *Phương pháp giải:* Xác định bán kính từ phương trình tổng quát $x^2 + y^2 - 2a x - 2b y + c = 0$:
        #step([Tính bán kính])
        - Ta có $a = 2, b = -3, c = -12$.
        - Bán kính:
        $ R = sqrt{a^2 + b^2 - c} = sqrt{2^2 + (-3)^2 - (-12)} = sqrt{4 + 9 + 12} = sqrt{25} = 5 $
    ]
)

// TLN 3 (Câu 19)
#tln([Cho hypebol $(H)$ có phương trình chính tắc $(x^2) / 16 - (y^2) / 9 = 1$. Tính tiêu cự $2c$ của hypebol $(H)$.],
    [10],
    loigiai: [
        *Phương pháp giải:* Sử dụng hệ thức liên hệ của hypebol $c^2 = a^2 + b^2$:
        #step([Tính tiêu cự])
        - Ta có $a^2 = 16, b^2 = 9$.
        - $c^2 = a^2 + b^2 = 16 + 9 = 25 => c = 5$.
        - Tiêu cự của hypebol: $2c = 2 times 5 = 10$.
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm số hạng không chứa biến $x$ trong khai triển nhị thức Newton của $(x + 2/x)^4$ với $x != 0$.],
    [24],
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức số hạng tổng quát của nhị thức Newton:
        #step([Xác định số hạng không phụ thuộc vào x])
        - Số hạng tổng quát:
        $ T_{k+1} = C_4^k x^{4 - k} (2/x)^k = C_4^k times 2^k times x^{4 - 2k} $
        - Số hạng không chứa $x$ tương ứng $4 - 2k = 0 <=> k = 2$.
        - Giá trị của số hạng đó là:
        $ C_4^2 times 2^2 = 6 times 4 = 24 $
    ]
)

// TLN 5 (Câu 21)
#tln([Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Tính xác suất để tổng số chấm xuất hiện trên hai con xúc xắc bằng $8$ (viết kết quả dưới dạng phân số tối giản $a/b$).],
    [5/36],
    loigiai: [
        *Phương pháp giải:* Liệt kê các biến cố thuận lợi:
        #step([Tính xác suất])
        - Không gian mẫu: $n(Omega) = 6 times 6 = 36$.
        - Các cặp kết quả có tổng số chấm bằng 8 là: $(2; 6), (3; 5), (4; 4), (5; 3), (6; 2)$ gồm $5$ phần tử.
        - Xác suất cần tìm: $P = 5 / 36$.
    ]
)

// TLN 6 (Câu 22)
#tln([Một đội tình nguyện viên gồm $6$ học sinh trường THPT A và $4$ học sinh trường THPT B. Chọn ngẫu nhiên $3$ học sinh tham gia hoạt động. Tính xác suất để trong $3$ học sinh được chọn có ít nhất một học sinh trường THPT B (viết kết quả dưới dạng phân số tối giản $a/b$).],
    [5/6],
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối (cả 3 học sinh đều thuộc trường THPT A):
        #step([Biến cố đối])
        - Không gian mẫu: $n(Omega) = C_{10}^3 = 120$.
        - Số cách chọn cả 3 học sinh đều thuộc trường A: $C_6^3 = 20$.
        - Xác suất cần tìm:
        $ P = 1 - 20 / 120 = 100 / 120 = 5 / 6 $
    ]
)

]

#make-questions()
