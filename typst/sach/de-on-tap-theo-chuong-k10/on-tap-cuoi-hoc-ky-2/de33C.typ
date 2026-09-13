#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("d97706") // Amber

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ ÔN TẬP KIỂM TRA CUỐI HỌC KỲ II",
  exam-title: "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KỲ II - TOÁN 10 (ĐỀ SỐ 33C)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "202",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Tam thức bậc hai chứa tham số m)
#tn([Tìm tất cả các giá trị thực của tham số $m$ để tam thức bậc hai $f(x) = x^2 - 2(m - 1)x + m + 5 > 0$ với mọi $x in RR$.],
    (
        True([$-1 < m < 4$]),
        [$m < -1$ hoặc $m > 4$],
        [$-4 < m < 1$],
        [$-1 <= m <= 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Tam thức bậc hai $f(x) = a x^2 + b x + c > 0, forall x in RR <=> cases(a > 0, Delta' < 0)$:
        - Hệ số $a = 1 > 0$ (luôn thỏa mãn).
        - Biệt thức thu gọn:
        $ Delta' = (m - 1)^2 - (m + 5) = m^2 - 2m + 1 - m - 5 = m^2 - 3m - 4 $
        - Để $f(x) > 0, forall x in RR$ thì:
        $ Delta' < 0 <=> m^2 - 3m - 4 < 0 <=> (m + 1)(m - 4) < 0 <=> -1 < m < 4 $
    ]
)

// TN 2 (Phương trình chứa căn)
#tn([Tích các nghiệm thực của phương trình $sqrt(2x^2 + 5x + 3) = sqrt(x^2 + 4x + 9)$ bằng],
    (
        True([$-6$]),
        [$6$],
        [$-1$],
        [$3$]
    ),
    loigiai: [
        *Phương pháp giải:* Bình phương hai vế phương trình dạng $sqrt(f(x)) = sqrt(g(x))$:
        $ 2x^2 + 5x + 3 = x^2 + 4x + 9 <=> x^2 + x - 6 = 0 <=> cases(x = 2, x = -3) $
        Kiểm tra điều kiện biểu thức dưới căn:
        - Với $x = 2$: $x^2 + 4x + 9 = 4 + 8 + 9 = 21 > 0$ (thỏa mãn).
        - Với $x = -3$: $x^2 + 4x + 9 = 9 - 12 + 9 = 6 > 0$ (thỏa mãn).
        Vậy phương trình có hai nghiệm $x = 2$ và $x = -3$. Tích các nghiệm là $2 times (-3) = -6$.
    ]
)

// TN 3 (Vị trí tương đối hai đường thẳng chứa tham số)
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai đường thẳng $Delta_1: m x + (m - 1)y + 2 = 0$ và $Delta_2: 2x + m y - 1 = 0$. Tìm tất cả các giá trị của tham số $m$ để $Delta_1$ song song với $Delta_2$.],
    (
        True([Không tồn tại $m$]),
        [$m = 1$],
        [$m = 2$],
        [$m = -1$]
    ),
    loigiai: [
        *Phương pháp giải:* Hai đường thẳng $a_1 x + b_1 y + c_1 = 0$ và $a_2 x + b_2 y + c_2 = 0$ song song khi và chỉ khi:
        $ a_1 / a_2 = b_1 / b_2 != c_1 / c_2 $
        Xét tỉ lệ:
        $ m / 2 = (m - 1) / m != 2 / (-1) $
        Từ $m / 2 = (m - 1) / m <=> m^2 = 2(m - 1) <=> m^2 - 2m + 2 = 0$.
        Phương trình có $Delta' = 1 - 2 = -1 < 0$ nên vô nghiệm trên $RR$.
        Vậy không tồn tại giá trị $m$ nào để hai đường thẳng song song.
    ]
)

// TN 4 (Cực trị khoảng cách Oxy)
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(1; 2), B(3; 4)$ và đường thẳng $d: x - y + 1 = 0$. Tọa độ điểm $M in d$ sao cho tổng $M A^2 + M B^2$ đạt giá trị nhỏ nhất là],
    (
        True([$M(2; 3)$]),
        [$M(1; 2)$],
        [$M(0; 1)$],
        [$M(3; 4)$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng tâm tỉ cự với $I(2; 3)$ là trung điểm của $A B$:
        - Ta có hệ thức: $M A^2 + M B^2 = 2 M I^2 + (A B^2) / 2$.
        - Do đó $M A^2 + M B^2$ nhỏ nhất khi $M I$ ngắn nhất, tức $M$ là hình chiếu vuông góc của $I$ lên đường thẳng $d$.
        - Thử tọa độ điểm $I(2; 3)$ vào phương trình đường thẳng $d$:
        $ 2 - 3 + 1 = 0 $
        Điều này chứng tỏ trung điểm $I$ nằm ngay trên đường thẳng $d$.
        Vậy điểm $M$ cần tìm trùng với điểm $I(2; 3)$.
    ]
)

// TN 5 (Phương trình tiếp tuyến đường tròn)
#tn([Trong mặt phẳng tọa độ $O x y$, cho đường tròn $(C): (x - 1)^2 + (y - 2)^2 = 25$. Phương trình tiếp tuyến của đường tròn $(C)$ tại điểm $M(4; 6) in (C)$ là],
    (
        True([$3x + 4y - 36 = 0$]),
        [$3x + 4y + 36 = 0$],
        [$4x - 3y + 2 = 0$],
        [$4x + 3y - 34 = 0$]
    ),
    loigiai: [
        *Phương pháp giải:* Tiếp tuyến tại điểm $M(x_0; y_0) in (C)$ nhận vectơ $vec(I M)$ làm vectơ pháp tuyến:
        - Tâm của đường tròn là $I(1; 2)$.
        - Vectơ pháp tuyến của tiếp tuyến: $vec(n) = vec(I M) = (4 - 1; 6 - 2) = (3; 4)$.
        - Phương trình tiếp tuyến:
        $ 3(x - 4) + 4(y - 6) = 0 <=> 3x + 4y - 36 = 0 $
    ]
)

// TN 6 (Tâm sai của Hypebol)
#tn([Cho hypebol $(H)$ có một tiêu điểm là $F_2(5; 0)$ và đỉnh tương ứng là $A(4; 0)$. Tâm sai $e$ của hypebol $(H)$ bằng],
    (
        True([$5 / 4$]),
        [$4 / 5$],
        [$3 / 4$],
        [$5 / 3$]
    ),
    loigiai: [
        *Phương pháp giải:* Tâm sai của hypebol được xác định bởi công thức $e = c / a$:
        - Ta có tiêu cự bán phần $c = 5$ và bán trục thực $a = 4$.
        - Tâm sai: $e = c / a = 5 / 4 = 1.25 > 1$.
    ]
)

// TN 7 (Bài toán chia kẹo Euler Stars and Bars)
#tn([Có bao nhiêu cách chia $10$ chiếc kẹo giống hệt nhau cho $3$ em nhỏ sao cho em nào cũng nhận được ít nhất một chiếc kẹo?],
    (
        True([$36$]),
        [$66$],
        [$45$],
        [$120$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng bài toán vách ngăn (Stars and Bars):
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // Vẽ 10 viên kẹo
          for i in range(10) {
            circle((i * 0.5, 0), radius: 0.15, fill: rgb("fef3c7"), stroke: 1pt + accent)
          }
          // Vẽ vách ngăn
          line((1.75, -0.4), (1.75, 0.4), stroke: 1.5pt + red)
          line((3.75, -0.4), (3.75, 0.4), stroke: 1.5pt + red)
        })
        ]
        Xếp 10 viên kẹo thành một hàng tạo ra $10 - 1 = 9$ khe trống giữa các viên kẹo. Đặt 2 vách ngăn vào 9 khe trống để chia thành 3 phần:
        $ C_{10-1}^{3-1} = C_9^2 = (9 times 8) / 2 = 36 text(" cách") $
    ]
)

// TN 8 (Hoán vị không cố định vị trí Derangement)
#tn([Bốn bạn học sinh $A, B, C, D$ gửi $4$ chiếc áo khoác đồng phục ở phòng đồ. Khi ra về, nhân viên lấy ngẫu nhiên trả lại mỗi bạn một chiếc áo. Số cách trả áo sao cho không có bất kỳ bạn nào nhận đúng chiếc áo của mình là],
    (
        True([$9$]),
        [$12$],
        [$8$],
        [$6$]
    ),
    loigiai: [
        *Phương pháp giải:* Số hoán vị mất thứ tự (Derangement) của $n = 4$ phần tử:
        $ D_4 = 4! (1 - 1/1! + 1/2! - 1/3! + 1/4!) = 24 (1/2 - 1/6 + 1/24) = 24 times 9 / 24 = 9 text(" cách") $
    ]
)

// TN 9 (Tổng hệ số tổ hợp Newton)
#tn([Tính tổng $S = C_{10}^0 + C_{10}^1 + C_{10}^2 + dots.c + C_{10}^{10}$.],
    (
        True([$1024$]),
        [$512$],
        [$2048$],
        [$100$]
    ),
    loigiai: [
        *Phương pháp giải:* Khai triển nhị thức Newton $(1 + x)^n$ với $x = 1, n = 10$:
        $ (1 + 1)^{10} = C_{10}^0 + C_{10}^1 + C_{10}^2 + dots.c + C_{10}^{10} <=> S = 2^{10} = 1024 $
    ]
)

// TN 10 (Hệ số nhị thức lớn nhất)
#tn([Trong khai triển nhị thức Newton của $(1 + x)^{10}$, hệ số có giá trị lớn nhất bằng],
    (
        True([$252$]),
        [$210$],
        [$120$],
        [$1024$]
    ),
    loigiai: [
        *Phương pháp giải:* Hệ số nhị thức $C_n^k$ đạt giá trị lớn nhất tại số hạng chính giữa:
        Với $n = 10$ là số chẵn, hệ số lớn nhất là:
        $ C_{10}^5 = (10!) / (5! times 5!) = (10 times 9 times 8 times 7 times 6) / (120) = 252 $
    ]
)

// TN 11 (Xác suất bàn tròn)
#tn([Xếp ngẫu nhiên $6$ người (trong đó có An và Bình) ngồi quanh một bàn tròn gồm $6$ vị trí ghế không đánh số. Xác suất để An và Bình ngồi cạnh nhau bằng],
    (
        True([$2 / 5$]),
        [$1 / 3$],
        [$1 / 5$],
        [$1 / 2$]
    ),
    loigiai: [
        *Phương pháp giải:* Xếp vị trí bàn tròn (cố định một người làm mốc):
        - Số phần tử không gian mẫu: $n(Omega) = (6 - 1)! = 5! = 120$.
        - Cố định An ở một vị trí bất kỳ. Để Bình ngồi cạnh An, Bình có đúng $2$ vị trí lựa chọn (bên trái hoặc bên phải của An).
        - Xếp $4$ người còn lại vào $4$ vị trí ghế còn lại: $4! = 24$ cách.
        - Số kết quả thuận lợi: $n(A) = 2 times 24 = 48$.
        - Xác suất:
        $ P = 48 / 120 = 2 / 5 $
    ]
)

// TN 12 (Xác suất rút thẻ tích chẵn)
#tn([Một hộp có $20$ tấm thẻ được đánh số từ $1$ đến $20$. Rút ngẫu nhiên đồng thời $2$ tấm thẻ. Xác suất để tích của hai số ghi trên hai thẻ rút được là một số chẵn bằng],
    (
        True([$29 / 38$]),
        [$9 / 38$],
        [$1 / 2$],
        [$19 / 38$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: tích hai số là số lẻ khi và chỉ khi cả hai số đều lẻ.
        - Trong 20 số có $10$ số lẻ và $10$ số chẵn.
        - Không gian mẫu: $n(Omega) = C_{20}^2 = 190$.
        - Số cách chọn 2 thẻ cùng lẻ: $C_{10}^2 = 45$.
        - Xác suất cần tìm:
        $ P = 1 - 45 / 190 = 1 - 9 / 38 = 29 / 38 approx 0.7632 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13 - Tiếp tuyến qua điểm ngoài của Parabol)
#ds([Trong mặt phẳng tọa độ $O x y$, cho parabol $(P): y = x^2 - 2x + 3$ và điểm $A(2; 2)$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Tọa độ đỉnh của parabol $(P)$ là $I(1; 2)$ và bề lõm của $(P)$ quay lên phía trên.]),
        True([Điểm $A(2; 2)$ không thuộc parabol $(P)$ vì khi $x = 2$ thì $y_P = 3 != 2$.]),
        True([Qua điểm $A(2; 2)$ kẻ được đúng $2$ tiếp tuyến phân biệt đến $(P)$ có hệ số góc lần lượt là $k_1 = 0$ và $k_2 = 4$.]),
        [Tổng hai hệ số góc của hai tiếp tuyến kẻ từ $A$ đến parabol $(P)$ bằng $0$.]
    ),
    loigiai: [
        *Phương pháp giải:* Tìm tiếp tuyến kẻ từ một điểm đến đường parabol:
        #step([Xét ý a, b: Đỉnh và vị trí điểm A])
        - Parabol có $x_I = -(-2) / 2 = 1 => y_I = 1^2 - 2(1) + 3 = 2 => I(1; 2)$, hệ số $a = 1 > 0$ nên bề lõm quay lên. Mệnh đề a ĐÚNG.
        - Tại $x = 2$, $y = 3 != 2 => A(2; 2) cancel(in) (P)$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Phương trình tiếp tuyến qua A])
        - Đường thẳng $d$ qua $A(2; 2)$ có hệ số góc $k$: $y = k(x - 2) + 2$.
        - Phương trình hoành độ tiếp điểm:
        $ x^2 - 2x + 3 = k(x - 2) + 2 <=> x^2 - (k + 2)x + 2k + 1 = 0 $
        - Để $d$ tiếp xúc $(P)$ thì $Delta = 0$:
        $ Delta = (k + 2)^2 - 4(2k + 1) = k^2 + 4k + 4 - 8k - 4 = k^2 - 4k = 0 <=> cases(k = 0, k = 4) $
        Vậy kẻ được đúng 2 tiếp tuyến có hệ số góc $0$ và $4$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Tổng hai hệ số góc])
        - Tổng hệ số góc: $k_1 + k_2 = 0 + 4 = 4 != 0$. Do đó khẳng định tổng bằng 0 là SAI. Mệnh đề d SAI.
    ]
)

// DS 2 (Câu 14 - Tiếp tuyến chung của hai đường tròn)
#ds([Trong mặt phẳng tọa độ $O x y$, cho hai đường tròn $(C_1): x^2 + y^2 = 4$ và $(C_2): (x - 6)^2 + y^2 = 16$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Đường tròn $(C_1)$ có bán kính $R_1 = 2$, đường tròn $(C_2)$ có bán kính $R_2 = 4$.]),
        True([Hai đường tròn $(C_1)$ và $(C_2)$ tiếp xúc ngoài với nhau tại điểm $T(2; 0)$.]),
        True([Hai đường tròn có đúng $3$ tiếp tuyến chung, trong đó tiếp tuyến chung trong có phương trình $x = 2$.]),
        [Hai tiếp tuyến chung ngoài của hai đường tròn cắt nhau tại điểm có hoành độ âm lớn hơn $-5$.]
    ),
    loigiai: [
        *Phương pháp giải:* Khảo sát vị trí tương đối và tiếp tuyến chung của hai đường tròn:
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.0, stroke: 1.2pt + accent)
          circle((3.0, 0), radius: 2.0, stroke: 1.2pt + accent)
          circle((0, 0), radius: 0.05, fill: accent)
          circle((3.0, 0), radius: 0.05, fill: accent)
          content((0, -0.3), [$O$])
          content((3.0, -0.3), [$I$])

          // Tiếp xúc tại T(1.0, 0)
          circle((1.0, 0), radius: 0.05, fill: red)
          content((1.0, -0.3), [$T$])
          line((1.0, -2.2), (1.0, 2.2), stroke: 1pt + red)

          // Giao điểm tiếp tuyến ngoài S(-3.0, 0)
          circle((-3.0, 0), radius: 0.05, fill: gray)
          content((-3.0, -0.3), [$S$])
          line((-3.0, 0), (4.5, 2.3), stroke: (dash: "dashed", paint: gray))
          line((-3.0, 0), (4.5, -2.3), stroke: (dash: "dashed", paint: gray))
        })
        ]
        #step([Xét ý a, b: Tâm, bán kính và sự tiếp xúc])
        - $(C_1)$ có tâm $O(0; 0), R_1 = 2$. $(C_2)$ có tâm $I(6; 0), R_2 = 4$. Mệnh đề a ĐÚNG.
        - Khoảng cách hai tâm: $O I = 6 = R_1 + R_2 =>$ Hai đường tròn tiếp xúc ngoài tại $T(2; 0)$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Số tiếp tuyến chung])
        - Hai đường tròn tiếp xúc ngoài luôn có đúng 3 tiếp tuyến chung: 1 tiếp tuyến chung trong tại $T(2; 0)$ có phương trình $x = 2$ và 2 tiếp tuyến chung ngoài đối xứng qua $O x$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Giao điểm tiếp tuyến chung ngoài])
        - Gọi $S(x_S; 0)$ là giao điểm của hai tiếp tuyến chung ngoài (tâm vị tự ngoài):
        $ vec(S O) / vec(S I) = R_1 / R_2 = 2 / 4 = 1 / 2 => O text(" là trung điểm của ") S I $
        $ x_O = (x_S + x_I) / 2 <=> 0 = (x_S + 6) / 2 <=> x_S = -6 $
        Vì $-6 < -5$, khẳng định hoành độ lớn hơn $-5$ là SAI. Mệnh đề d SAI.
    ]
)

// DS 3 (Câu 15 - Tổ hợp nâng cao)
#ds([Cho tập hợp các chữ số $E = {1, 2, 3, 4, 5, 6, 7}$.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Số tập hợp con gồm $4$ phần tử của tập $E$ là $C_7^4 = 35$.]),
        True([Số các số tự nhiên gồm $5$ chữ số đôi một khác nhau lập từ $E$ mà các chữ số theo thứ tự tăng dần từ trái sang phải là $21$ số.]),
        True([Có $20$ cách phân phối $7$ chiếc bút bi giống nhau cho $4$ học sinh sao cho bạn nào cũng nhận được ít nhất một chiếc bút.]),
        [Số cách chọn ra $3$ số từ tập $E$ sao cho không có hai số nào là hai số tự nhiên liên tiếp nhỏ hơn $5$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng các quy tắc tổ hợp và vách ngăn:
        #step([Xét ý a: Tập hợp con])
        - Số tập con 4 phần tử: $C_7^4 = 35$. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Số có chữ số tăng dần])
        - Mỗi cách chọn 5 chữ số từ 7 chữ số của $E$ tạo thành đúng 1 số có thứ tự tăng dần duy nhất: $C_7^5 = 21$ số. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Phân phối bút bi])
        - Bài toán chia kẹo: $C_{7 - 1}^{4 - 1} = C_6^3 = 20$ cách. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Chọn 3 số không liên tiếp])
        - Số cách chọn 3 số không có hai số liên tiếp từ tập 7 phần tử:
        $ C_{7 - 3 + 1}^3 = C_5^3 = 10 $
        Do $10 > 5$, khẳng định nhỏ hơn 5 là SAI. Mệnh đề d SAI.
    ]
)

// DS 4 (Câu 16 - Cây xác suất hai giai đoạn)
#ds([Hộp I chứa $4$ bóng xanh và $6$ bóng đỏ. Hộp II chứa $7$ bóng xanh và $3$ bóng đỏ. Gieo một con xúc xắc cân đối: nếu xuất hiện mặt có số chấm chia hết cho $3$ thì chọn Hộp I, trường hợp còn lại thì chọn Hộp II. Từ hộp được chọn, lấy ngẫu nhiên ra $1$ quả bóng.
Xét tính đúng sai của các nhận định sau:],
    (
        True([Xác suất để Hộp I được chọn bằng $1 / 3$ và xác suất để Hộp II được chọn bằng $2 / 3$.]),
        True([Xác suất để chọn được Hộp I đồng thời lấy ra được bóng màu xanh bằng $2 / 15$.]),
        True([Xác suất để quả bóng lấy ra là bóng màu xanh bằng $3 / 5$.]),
        [Xác suất để quả bóng lấy ra là bóng màu đỏ nhỏ hơn $0.35$.]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức xác suất toàn phần qua sơ đồ cây:
        #step([Xét ý a: Xác suất chọn hộp])
        - Các mặt chia hết cho 3 là ${3, 6}$ ($2$ mặt) $=>$ Xác suất chọn Hộp I là $2 / 6 = 1 / 3$.
        - Các mặt còn lại ${1, 2, 4, 5}$ ($4$ mặt) $=>$ Xác suất chọn Hộp II là $4 / 6 = 2 / 3$. Mệnh đề a ĐÚNG.
        #step([Xét ý b: Xác suất nhánh Hộp I và bóng xanh])
        - $P(text("Hộp I") inter text("Xanh")) = 1 / 3 times 4 / 10 = 4 / 30 = 2 / 15$. Mệnh đề b ĐÚNG.
        #step([Xét ý c: Tổng xác suất bóng xanh])
        - $P(X) = (1 / 3 times 4 / 10) + (2 / 3 times 7 / 10) = 4 / 30 + 14 / 30 = 18 / 30 = 3 / 5 = 0.6$. Mệnh đề c ĐÚNG.
        #step([Xét ý d: Xác suất bóng đỏ])
        - $P(D) = 1 - P(X) = 1 - 0.6 = 0.4 > 0.35$. Do đó khẳng định nhỏ hơn $0.35$ là SAI. Mệnh đề d SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Tìm giá trị nhỏ nhất của hàm số bậc hai $y = x^2 - 6x + 14$ trên tập số thực $RR$.],
    [5],
    loigiai: [
        *Phương pháp giải:* Đưa tam thức bậc hai về dạng chính tắc:
        #step([Tính giá trị nhỏ nhất])
        $ y = (x - 3)^2 + 5 >= 5 $
        Đẳng thức xảy ra khi $x = 3$. Vậy giá trị nhỏ nhất là $5$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho hai đường tròn tiếp xúc ngoài có bán kính lần lượt bằng $2$ và $4$. Hai tiếp tuyến chung ngoài cắt nhau tại điểm $S$. Tính khoảng cách từ tâm của đường tròn nhỏ đến điểm $S$.],
    [6],
    loigiai: [
        *Phương pháp giải:* Áp dụng tính chất tam giác đồng dạng hoặc tâm vị tự ngoài:
        #step([Tính khoảng cách])
        - Gọi $O$ là tâm đường tròn nhỏ ($R_1 = 2$) và $I$ là tâm đường tròn lớn ($R_2 = 4$).
        - Ta có:
        $ (S O) / (S I) = R_1 / R_2 = 2 / 4 = 1 / 2 <=> S I = 2 S O <=> S O + O I = 2 S O <=> S O = O I $
        - Vì hai đường tròn tiếp xúc ngoài, $O I = R_1 + R_2 = 2 + 4 = 6$.
        Vậy khoảng cách $S O = 6$.
    ]
)

// TLN 3 (Câu 19)
#tln([Cho parabol có phương trình chính tắc $y^2 = 24x$. Tính khoảng cách từ đỉnh của parabol đến tiêu điểm của nó.],
    [6],
    loigiai: [
        *Phương pháp giải:* Khoảng cách từ đỉnh $O(0; 0)$ đến tiêu điểm $F(p/2; 0)$ bằng $p/2$:
        #step([Tính tiêu cự bán phần])
        - Ta có $2p = 24 <=> p = 12$.
        - Khoảng cách: $p / 2 = 12 / 2 = 6$.
    ]
)

// TLN 4 (Câu 20)
#tln([Tìm hệ số của số hạng chính giữa trong khai triển nhị thức Newton của $(x + 1)^8$.],
    [70],
    loigiai: [
        *Phương pháp giải:* Khai triển $(x + 1)^8$ có $8 + 1 = 9$ số hạng:
        #step([Xác định số hạng chính giữa])
        - Số hạng chính giữa là số hạng thứ 5, tương ứng với $k = 4$:
        $ T_5 = C_8^4 x^4 times 1^4 = 70 x^4 $
        Vậy hệ số là $70$.
    ]
)

// TLN 5 (Câu 21)
#tln([Có bao nhiêu cách chia $10$ chiếc kẹo giống hệt nhau cho $3$ bạn nhỏ sao cho bạn nào cũng nhận được ít nhất một chiếc kẹo?],
    [36],
    loigiai: [
        *Phương pháp giải:* Áp dụng bài toán vách ngăn:
        #step([Tính số cách])
        $ C_{10 - 1}^{3 - 1} = C_9^2 = 36 $
    ]
)

// TLN 6 (Câu 22)
#tln([Tính xác suất để quả bóng lấy ra từ hai hộp trong Câu 16 là quả bóng màu xanh (viết kết quả dưới dạng số thập phân).],
    [0.6],
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức xác suất toàn phần:
        #step([Tính xác suất])
        $ P = (1 / 3 times 4 / 10) + (2 / 3 times 7 / 10) = 4 / 30 + 14 / 30 = 18 / 30 = 0.6 $
    ]
)

]

#make-questions()
