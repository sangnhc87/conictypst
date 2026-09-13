#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "ĐỀ ÔN TẬP KIỂM TRA CUỐI HỌC KỲ I",
  exam-title: "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KỲ I - TOÁN 10 (ĐỀ SỐ 02)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "102",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong hình học, cho mệnh đề kéo theo: "Nếu tứ giác $A B C D$ là hình vuông ($P$) thì tứ giác $A B C D$ là hình thoi ($Q$)". Mệnh đề nào sau đây diễn tả đúng vai trò của điều kiện $P$ đối với $Q$?],
    (
        True([$P$ là điều kiện đủ để có $Q$]),
        [$P$ là điều kiện cần để có $Q$],
        [$P$ là điều kiện cần và đủ để có $Q$],
        [$Q$ là điều kiện đủ để có $P$]
    ),
    loigiai: [
        Trong mệnh đề $P => Q$, $P$ được gọi là giả thiết hay điều kiện đủ để có $Q$; còn $Q$ là kết luận hay điều kiện cần để có $P$.
    ]
)

// TN 2
#tn([Cho hai tập hợp $A = [-2; 5]$ và $B = (1; 7]$. Tập hợp hiệu $A setminus B$ là],
    (
        True([$[-2; 1]$]),
        [$[-2; 1)$],
        [$(5; 7]$],
        [$[-2; 7]$]
    ),
    loigiai: [
        $ A setminus B = [-2; 5] setminus (1; 7] = [-2; 1] $ (Vì điểm $1$ không thuộc $B$ nên $1$ vẫn thuộc vào phần tử của hiệu).
    ]
)

// TN 3
#tn([Một học sinh có không quá $100$ nghìn đồng để mua vở (giá $8$ nghìn đồng/quyển) và bút bi (giá $5$ nghìn đồng/chiếc). Gọi $x$ là số quyển vở và $y$ là số chiếc bút bi học sinh đó mua ($x, y in NN$). Bất phương trình mô tả ràng buộc về số tiền của học sinh là],
    (
        True([$8x + 5y <= 100$]),
        [$8x + 5y >= 100$],
        [$5x + 8y <= 100$],
        [$8x + 5y < 100$]
    ),
    loigiai: [
        Tổng số tiền mua vở và bút là $8x + 5y$. Vì học sinh có không quá $100$ nghìn đồng nên ta có bất phương trình $8x + 5y <= 100$.
    ]
)

// TN 4
#tn([Miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 3)$ trên mặt phẳng tọa độ $O x y$ là],
    (
        True([Một miền tam giác kể cả bờ]),
        [Một miền tứ giác],
        [Một nửa mặt phẳng],
        [Một góc phần tư]
    ),
    loigiai: [
        Miền nghiệm bị giới hạn bởi các đường thẳng $x = 0$ (trục $O y$), $y = 0$ (trục $O x$) và $x + y = 3$. Đây là miền tam giác vuông có ba đỉnh $O(0; 0), A(3; 0), B(0; 3)$ kể cả biên.
    ]
)

// TN 5
#tn([Giá trị của biểu thức $P = sin 30^degree + cos 60^degree - tan 45^degree$ bằng],
    (
        True([$0$]),
        [$1$],
        [$-1$],
        [$1/2$]
    ),
    loigiai: [
        $ P = 1/2 + 1/2 - 1 = 0 $
    ]
)

// TN 6
#tn([Cho tam giác $A B C$ có cạnh $a = 10$ và góc $hat(A) = 30^degree$. Bán kính đường tròn ngoại tiếp $R$ của tam giác $A B C$ bằng],
    (
        True([$10$]),
        [$5$],
        [$20$],
        [$10sqrt(3)$]
    ),
    loigiai: [
        Theo định lý sin trong tam giác:
        $ R = a / (2 sin A) = 10 / (2 sin 30^degree) = 10 / (2 times 0.5) = 10 $
    ]
)

// TN 7
#tn([Cho ba điểm phân biệt $A, B, C$ bất kỳ. Vectơ tổng $vec(A B) + vec(B C)$ bằng],
    (
        True([$vec(A C)$]),
        [$vec(C A)$],
        [$vec(B A)$],
        [$vec(C B)$]
    ),
    loigiai: [
        Theo quy tắc ba điểm cộng vectơ: $vec(A B) + vec(B C) = vec(A C)$.
    ]
)

// TN 8
#tn([Trong mặt phẳng tọa độ $O x y$, cho hai điểm $A(-1; 4)$ và $B(5; 2)$. Tọa độ trung điểm $M$ của đoạn thẳng $A B$ là],
    (
        True([$M(2; 3)$]),
        [$M(3; 2)$],
        [$M(6; -2)$],
        [$M(4; 6)$]
    ),
    loigiai: [
        $ x_M = (x_A + x_B) / 2 = (-1 + 5) / 2 = 2; quad y_M = (y_A + y_B) / 2 = (4 + 2) / 2 = 3 => M(2; 3) $
    ]
)

// TN 9
#tn([Trong mặt phẳng $O x y$, góc giữa hai vectơ $vec(u) = (1; 1)$ và $vec(v) = (0; 2)$ bằng],
    (
        True([$45^degree$]),
        [$90^degree$],
        [$60^degree$],
        [$30^degree$]
    ),
    loigiai: [
        $ cos(vec(u), vec(v)) = (vec(u) cdot vec(v)) / (|vec(u)| |vec(v)|) = (1(0) + 1(2)) / (sqrt(1^2 + 1^2) times sqrt(0^2 + 2^2)) = 2 / (sqrt(2) times 2) = 1 / sqrt(2) $
        Suy ra góc giữa hai vectơ bằng $45^degree$.
    ]
)

// TN 10
#tn([Cho số gần đúng $a = 36768$ với độ chính xác $d = 200$. Số quy tròn của số $a$ là],
    (
        True([$37000$]),
        [$36800$],
        [$36700$],
        [$36770$]
    ),
    loigiai: [
        Vì độ chính xác $d = 200$ (ở hàng trăm), nên hàng quy tròn là hàng nghìn (hàng liền trước hàng trăm).
        Chữ số sau hàng quy tròn là chữ số hàng trăm $7 >= 5$, do đó ta cộng thêm $1$ vào chữ số hàng nghìn và thay các chữ số sau bằng $0$: $36768 approx 37000$.
    ]
)

// TN 11
#tn([Một cửa hàng giày thể thao thống kê số lượng cỡ giày nam bán được trong một tuần:
#align(center)[
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 6pt,
  align: center,
  [Cỡ giày], [39], [40], [41], [42], [43],
  [Số đôi bán được], [12], [28], [45], [30], [15]
)
]
Mốt $M_o$ của mẫu số liệu trên là],
    (
        True([$41$]),
        [$45$ đôi],
        [$40$],
        [$42$]
    ),
    loigiai: [
        Mốt là giá trị có tần số lớn nhất. Cỡ giày $41$ có số lượng bán lớn nhất ($45$ đôi), do đó mốt $M_o = 41$.
    ]
)

// TN 12
#tn([Thời gian tự học ở nhà mỗi ngày (tính theo giờ) của $7$ học sinh được ghi lại:
$ 1.5; 2.0; 2.0; 2.5; 3.0; 3.5; 4.0 $
Trung vị $M_e$ của mẫu số liệu trên là],
    (
        True([$2.5 text(" giờ")$]),
        [$2.0 text(" giờ")$],
        [$3.0 text(" giờ")$],
        [$2.6 text(" giờ")$]
    ),
    loigiai: [
        Mẫu số liệu có $n = 7$ phần tử đã sắp xếp theo thứ tự không giảm. Trung vị là phần tử thứ tư: $M_e = x_4 = 2.5 text(" giờ")$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Mô hình hóa khảo sát học lực 3 môn Toán, Lý, Hóa)
#ds([Khảo sát kết quả học tập của $100$ học sinh khối 10 ở ba môn: Toán ($T$), Vật lý ($L$) và Hóa học ($H$):
- Có $65$ em học lực Giỏi môn Toán; $50$ em Giỏi môn Vật lý; $45$ em Giỏi môn Hóa học.
- Có $30$ em Giỏi cả Toán và Vật lý; $25$ em Giỏi cả Toán và Hóa học; $20$ em Giỏi cả Vật lý và Hóa học.
- Có $10$ em đạt học lực Giỏi ở cả ba môn học này.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số học sinh đạt học lực Giỏi ở ít nhất một trong ba môn là $95$ học sinh.]),
    True([Có đúng $5$ học sinh không đạt học lực Giỏi ở bất kỳ môn nào trong ba môn trên.]),
    True([Số học sinh chỉ đạt học lực Giỏi duy nhất môn Toán là $20$ học sinh.]),
    [Số học sinh đạt học lực Giỏi ở đúng hai môn bất kỳ là $65$ học sinh.]
  ),
  loigiai: [
    #step([Lực lượng hợp 3 tập hợp])
    $n(T union L union H) = 65 + 50 + 45 - (30 + 25 + 20) + 10 = 160 - 75 + 10 = 95$ học sinh. Mệnh đề a ĐÚNG.

    #step([Số học sinh không giỏi môn nào])
    $100 - 95 = 5$ học sinh. Mệnh đề b ĐÚNG.

    #step([Số học sinh chỉ giỏi môn Toán])
    - Giỏi Toán và Lý (không Hóa): $30 - 10 = 20$.
    - Giỏi Toán và Hóa (không Lý): $25 - 10 = 15$.
    - Giỏi cả ba: $10$.
    Số chỉ giỏi Toán: $65 - (20 + 15 + 10) = 65 - 45 = 20$ học sinh. Mệnh đề c ĐÚNG.

    #step([Số học sinh giỏi đúng hai môn])
    $20 + 15 + (20 - 10) = 20 + 15 + 10 = 45$ học sinh.
    Khẳng định $65$ học sinh là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Quy hoạch tuyến tính tối ưu chi phí phân bón)
#ds([Một trang trại nông nghiệp cần bón ít nhất $90 text(" kg")$ đạm ($N$) và $60 text(" kg")$ lân ($P$) cho vườn cây ăn quả. Trang trại sử dụng hai loại phân bón $A$ (bao gồm $x$ bao) và $B$ (bao gồm $y$ bao):
- Mỗi bao phân loại $A$ cung cấp $3 text(" kg")$ đạm và $1 text(" kg")$ lân, giá $200$ nghìn đồng.
- Mỗi bao phân loại $B$ cung cấp $1 text(" kg")$ đạm và $2 text(" kg")$ lân, giá $150$ nghìn đồng.
Hệ bất phương trình ràng buộc nhu cầu phân bón là:
$ cases(
  x >= 0,
  y >= 0,
  3x + y >= 90,
  x + 2y >= 60
) $
Tổng chi phí mua phân bón biểu diễn bởi hàm số:
$ C(x, y) = 200x + 150y text(" (nghìn đồng)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu mua $30$ bao loại $A$ và $20$ bao loại $B$ thì phương án này đáp ứng đầy đủ nhu cầu dinh dưỡng của vườn cây.]),
    True([Các đỉnh của miền nghiệm không bị chặn này là $M(0; 90), N(24; 18), P(60; 0)$.]),
    True([Để chi phí mua phân bón là thấp nhất, trang trại cần mua $24$ bao loại $A$ và $18$ bao loại $B$.]),
    [Chi phí phân bón tối thiểu trang trại phải trả là $8.5$ triệu đồng.]
  ),
  loigiai: [
    #step([Kiểm tra phương án (30; 20)])
    $3(30) + 20 = 110 >= 90$ và $30 + 2(20) = 70 >= 60$. Đáp ứng đủ nhu cầu. Mệnh đề a ĐÚNG.

    #step([Xác định tọa độ các đỉnh])
    - Điểm $M$: giao của $3x + y = 90$ với trục $O y => M(0; 90)$.
    - Điểm $N$: giao của $3x + y = 90$ và $x + 2y = 60 => cases(6x + 2y = 180, x + 2y = 60) => 5x = 120 <=> x = 24 => y = 18 => N(24; 18)$.
    - Điểm $P$: giao của $x + 2y = 60$ với trục $O x => P(60; 0)$. Mệnh đề b ĐÚNG.

    #step([Tính chi phí tại các đỉnh])
    - $C(M) = 200(0) + 150(90) = 13500$ nghìn đồng.
    - $C(N) = 200(24) + 150(18) = 4800 + 2700 = 7500$ nghìn đồng.
    - $C(P) = 200(60) + 150(0) = 12000$ nghìn đồng.
    Chi phí thấp nhất đạt tại $N(24; 18)$ ($24$ bao $A$ và $18$ bao $B$). Mệnh đề c ĐÚNG.

    #step([Chi phí tối thiểu])
    $C_min = 7500$ nghìn đồng $= 7.5$ triệu đồng.
    Khẳng định $8.5$ triệu đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Hệ thức lượng và khoảng cách hai khinh khí cầu)
#ds([Từ một đài quan sát khí tượng trên mặt đất đặt tại điểm $O$, người ta quan sát hai khinh khí cầu $A$ và $B$ đang lơ lửng trên bầu trời.
Các thiết bị laze đo được:
- Khoảng cách từ đài quan sát đến khinh khí cầu $A$: $O A = 3 text(" km")$.
- Khoảng cách từ đài quan sát đến khinh khí cầu $B$: $O B = 5 text(" km")$.
- Góc nhìn tạo bởi hai khinh khí cầu: $hat(A O B) = 60^degree$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Diện tích tam giác $O A B$ tạo bởi đài quan sát và hai khinh khí cầu là $(15sqrt(3)) / 4 text(" km")^2$.]),
    True([Khoảng cách trực tiếp giữa hai khinh khí cầu $A$ và $B$ bằng $sqrt(19) text(" km") approx 4.36 text(" km")$.]),
    True([Góc $hat(O B A)$ tạo bởi tia nhìn từ $B$ về $O$ và hướng $B A$ là một góc nhọn thỏa mãn $sin hat(O B A) = (3sqrt(57)) / 38$.]),
    [Độ cao tương đối của khinh khí cầu $B$ so với đường thẳng nối $O A$ lớn hơn $5 text(" km")$.]
  ),
  loigiai: [
    #step([Diện tích tam giác OAB])
    $S = 1/2 O A cdot O B sin 60^degree = 1/2 (3)(5) ((sqrt(3)) / 2) = (15sqrt(3)) / 4 text(" km")^2$. Mệnh đề a ĐÚNG.

    #step([Độ dài đoạn AB])
    $A B^2 = O A^2 + O B^2 - 2 O A cdot O B cos 60^degree = 3^2 + 5^2 - 2(3)(5)(0.5) = 9 + 25 - 15 = 19$.
    Suy ra $A B = sqrt(19) text(" km")$. Mệnh đề b ĐÚNG.

    #step([Tính sin góc OBA])
    Theo định lý sin: $(A B) / (sin 60^degree) = (O A) / (sin hat(O B A)) => sin hat(O B A) = (3 sin 60^degree) / sqrt(19) = (3sqrt(3)) / (2sqrt(19)) = (3sqrt(57)) / 38$. Mệnh đề c ĐÚNG.

    #step([Khoảng cách từ B đến đường thẳng OA])
    $h_B = (2 S) / (O A) = (2 times (15sqrt(3)) / 4) / 3 = (15sqrt(3)) / 6 = (5sqrt(3)) / 2 approx 4.33 text(" km") < 5 text(" km")$.
    Khẳng định lớn hơn $5 text(" km")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Vectơ hợp lực và chuyển động cơ học)
#ds([Trong mặt phẳng tọa độ $O x y$, một chất điểm tại gốc tọa độ $O(0; 0)$ chịu tác dụng đồng thời của ba lực:
$ vec(F)_1 = (4; 6), quad vec(F)_2 = (-1; 2), quad vec(F)_3 = (m; n) text(" (đơn vị: N)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hợp lực của hai lực $vec(F)_1$ và $vec(F)_2$ là vectơ $vec(F)_(12) = (3; 8)$ có độ lớn bằng $sqrt(73) text(" N")$.]),
    True([Nếu chất điểm ở trạng thái cân bằng lực ($vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$) thì tọa độ của lực thứ ba là $vec(F)_3 = (-3; -8)$.]),
    True([Khi $vec(F)_3 = (-3; -8)$, độ lớn của lực thứ ba bằng độ lớn của hợp lực $vec(F)_(12)$.]),
    [Nếu lực thứ ba $vec(F)_3$ vuông góc với lực $vec(F)_1$ thì tọa độ của nó bắt buộc phải thỏa mãn $2m + 3n = 1$.]
  ),
  loigiai: [
    #step([Hợp lực của F1 và F2])
    $vec(F)_(12) = vec(F)_1 + vec(F)_2 = (4 + (-1); 6 + 2) = (3; 8)$.
    Độ lớn $|vec(F)_(12)| = sqrt(3^2 + 8^2) = sqrt(9 + 64) = sqrt(73) text(" N")$. Mệnh đề a ĐÚNG.

    #step([Điều kiện cân bằng])
    $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0) <=> vec(F)_3 = -vec(F)_(12) = (-3; -8)$. Mệnh đề b ĐÚNG.

    #step([Độ lớn của lực F3 khi cân bằng])
    $|vec(F)_3| = sqrt((-3)^2 + (-8)^2) = sqrt(73) = |vec(F)_(12)|$. Mệnh đề c ĐÚNG.

    #step([Điều kiện F3 vuông góc với F1])
    $vec(F)_3 perp vec(F)_1 <=> vec(F)_3 cdot vec(F)_1 = 0 <=> 4m + 6n = 0 <=> 2m + 3n = 0$ (chứ không phải $= 1$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tìm tham số m để tập con)
#tln([Cho hai tập hợp $A = [m; m + 2]$ và $B = [1; 6]$.
Tìm số giá trị nguyên của tham số $m$ để tập hợp $A$ là tập con của tập hợp $B$ ($A subset B$).],
    [4],
    loigiai: [
        #step([Điều kiện tập con])
        $A subset B <=> cases(1 <= m, m + 2 <= 6) <=> cases(m >= 1, m <= 4) <=> 1 <= m <= 4$.
        
        #step([Đếm số nguyên])
        Các số nguyên $m in [1; 4]$ là: $1; 2; 3; 4$.
        Vậy có đúng $4$ giá trị nguyên của $m$.
    ]
)

// TLN 2 (Quy hoạch tuyến tính tìm min)
#tln([Cho hệ bất phương trình ràng buộc:
$ cases(
  x >= 0,
  y >= 0,
  x + y >= 3,
  2x + y >= 4
) $
Tìm giá trị nhỏ nhất của biểu thức chi phí $F(x, y) = 2x + 3y$ trên miền nghiệm của hệ trên.],
    [6],
    loigiai: [
        #step([Xác định các đỉnh của miền nghiệm])
        Các đỉnh của miền không bị chặn:
        - $A(0; 4)$ (giao với trục $O y$)
        - $B(1; 2)$ (giao điểm của $x + y = 3$ và $2x + y = 4$)
        - $C(3; 0)$ (giao với trục $O x$)
        
        #step([Tính giá trị tại các đỉnh])
        - $F(A) = 2(0) + 3(4) = 12$
        - $F(B) = 2(1) + 3(2) = 2 + 6 = 8$
        - Tại $C(3; 0)$: $F(C) = 2(3) + 3(0) = 6$.
        
        Vậy giá trị nhỏ nhất của $F(x, y)$ trên miền nghiệm là $6$ (đạt tại điểm $C(3; 0)$).
    ]
)

// TLN 3 (Bán kính đường tròn nội tiếp tam giác)
#tln([Một bồn hoa có dạng hình tam giác có độ dài ba cạnh lần lượt là $13 text(" m"), 14 text(" m"), 15 text(" m")$.
Người ta muốn đặt một vòi phun nước tự động tại tâm đường tròn nội tiếp của bồn hoa.
Tính bán kính phun nước $r$ (đơn vị: mét) để vòi phun tiếp xúc với cả ba cạnh của bồn hoa.],
    [4],
    loigiai: [
        #step([Tính nửa chu vi tam giác])
        $ p = (13 + 14 + 15) / 2 = 42 / 2 = 21 text(" m") $
        
        #step([Tính diện tích theo công thức Heron])
        $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(21(21 - 13)(21 - 14)(21 - 15)) = sqrt(21 times 8 times 7 times 6) $
        $ = sqrt(21 times 7 times 48) = sqrt(147 times 48) = sqrt(7056) = 84 text(" m")^2 $
        
        #step([Tính bán kính đường tròn nội tiếp])
        $ r = S / p = 84 / 21 = 4 text(" m") $
    ]
)

// TLN 4 (Tọa độ trực tâm tam giác)
#tln([Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có $A(1; 4), B(-2; 1), C(3; 1)$.
Gọi $H(x_0; y_0)$ là trực tâm của tam giác $A B C$.
Tính tổng $x_0 + y_0$.],
    [4],
    loigiai: [
        #step([Lập hệ phương trình tìm trực tâm])
        $H(x; y)$ là trực tâm $<=> cases(vec(A H) perp vec(B C), vec(B H) perp vec(A C))$.
        - $vec(A H) = (x - 1; y - 4)$, $vec(B C) = (3 - (-2); 1 - 1) = (5; 0)$.
        - $vec(A H) cdot vec(B C) = 0 <=> 5(x - 1) + 0(y - 4) = 0 <=> x = 1$.
        - $vec(B H) = (x + 2; y - 1) = (3; y - 1)$ (vì $x = 1$).
        - $vec(A C) = (3 - 1; 1 - 4) = (2; -3)$.
        - $vec(B H) cdot vec(A C) = 0 <=> 3(2) + (y - 1)(-3) = 0 <=> 6 - 3y + 3 = 0 <=> 3y = 9 <=> y = 3$.
        
        #step([Tính tổng x0 + y0])
        Tọa độ trực tâm là $H(1; 3) => x_0 + y_0 = 1 + 3 = 4$.
    ]
)

// TLN 5 (Hợp lực vuông góc)
#tln([Hai lực $vec(F)_1$ và $vec(F)_2$ cùng tác dụng vào một chất điểm, có phương vuông góc với nhau ($vec(F)_1 perp vec(F)_2$).
Biết độ lớn của lực thứ nhất là $|vec(F)_1| = 60 text(" N")$ và độ lớn của hợp lực là $|vec(F)| = 100 text(" N")$.
Tính độ lớn của lực thứ hai $|vec(F)_2|$ (đơn vị: N).],
    [80],
    loigiai: [
        #step([Công thức hợp lực hai lực vuông góc])
        Vì $vec(F)_1 perp vec(F)_2$ nên:
        $ |vec(F)|^2 = |vec(F)_1|^2 + |vec(F)_2|^2 $
        
        #step([Tính độ lớn lực F2])
        $ |vec(F)_2| = sqrt(|vec(F)|^2 - |vec(F)_1|^2) = sqrt(100^2 - 60^2) = sqrt(10000 - 3600) = sqrt(6400) = 80 text(" N") $
    ]
)

// TLN 6 (Tính phương sai mẫu số liệu)
#tln([Một lớp học ghi nhận điểm kiểm tra $15$ phút môn Toán của một nhóm $5$ học sinh:
$ 6; 7; 8; 9; 10 $
Tính phương sai $s^2$ của mẫu số liệu trên.],
    [2],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (6 + 7 + 8 + 9 + 10) / 5 = 40 / 5 = 8 $
        
        #step([Tính phương sai])
        $ s^2 = 1/5 [(6 - 8)^2 + (7 - 8)^2 + (8 - 8)^2 + (9 - 8)^2 + (10 - 8)^2] $
        $ = 1/5 [(-2)^2 + (-1)^2 + 0^2 + 1^2 + 2^2] = 1/5 [4 + 1 + 0 + 1 + 4] = 10 / 5 = 2 $
    ]
)

] // end make-questions

#make-questions()
