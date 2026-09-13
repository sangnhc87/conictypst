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
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP",
  exam-title: "BÀI 24: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP (ĐỀ SỐ 27B - VẬN DỤNG CAO & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "177",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Số tự nhiên giảm dần)
#tn([Có bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau $overline(a b c d e)$ thỏa mãn điều kiện các chữ số giảm dần từ trái sang phải: $a > b > c > d > e$?],
    (
        True([$252$]),
        [$126$],
        [$3024$],
        [$504$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp song ánh tổ hợp. Do các chữ số giảm dần $a > b > c > d > e$, chữ số nhỏ nhất $e >= 0$ nên chữ số đầu $a > 0$ luôn được đảm bảo tự động. Mỗi cách chọn ra $5$ chữ số bất kỳ từ tập $10$ chữ số ${0, 1, 2, ..., 9}$ duy nhất tương ứng với một số tự nhiên giảm dần (bằng cách xếp 5 chữ số đó theo thứ tự giảm).
        Số các số tự nhiên thỏa mãn là:
        $ C_10^5 = (10 times 9 times 8 times 7 times 6) / (5 times 4 times 3 times 2 times 1) = 252 text(" số") $
    ]
)

// TN 2 (Vòng đeo tay đối xứng gương có CeTZ)
#tn([Có $6$ viên ngọc có màu sắc khác nhau được xâu thành một chiếc vòng đeo tay tròn khép kín. Biết rằng hai chiếc vòng tay được xem là như nhau nếu có thể lật ngược mặt vòng tay mà các viên ngọc trùng khớp nhau. Số kiểu vòng tay khác nhau có thể tạo ra là],
    (
        True([$60$]),
        [$120$],
        [$720$],
        [$30$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức hoán vị vòng quanh (Circular Permutation) có xét đến tính đối xứng trục (đối xứng lật mặt 3D).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1.2pt + gray)
          let colors = (red, blue, green, orange, purple, teal)
          for i in range(6) {
            let a = i * 60deg
            let x = 1.5 * calc.cos(a)
            let y = 1.5 * calc.sin(a)
            circle((x, y), radius: 0.2, fill: colors.at(i), stroke: 0.5pt + black)
          }
          content((0, 0), [Vòng ngọc])
        })
        ]
        - Số cách xếp 6 viên ngọc vào một vòng tròn phân biệt chiều quay là hoán vị vòng quanh:
          $ (6 - 1)! = 5! = 120 text(" cách") $
        - Vì chiếc vòng tay nằm trong không gian 3 chiều có thể lật ngược mặt (chiều thuận và chiều ngược kim đồng hồ trở thành đồng nhất), mỗi kiểu vòng tay bị đếm lặp đúng $2$ lần.
        Do đó số kiểu vòng tay thực tế là:
        $ (5!) / 2 = 120 / 2 = 60 text(" kiểu") $
    ]
)

// TN 3 (Tam giác không có cạnh nào là cạnh đa giác)
#tn([Cho một đa giác đều có $12$ đỉnh. Có bao nhiêu tam giác có $3$ đỉnh là các đỉnh của đa giác mà không có bất kỳ cạnh nào là cạnh của đa giác đều đó?],
    (
        True([$112$]),
        [$96$],
        [$120$],
        [$108$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp phần bù (Complementary Counting), lấy tổng số tam giác tạo thành trừ đi số tam giác có đúng 2 cạnh là cạnh đa giác và số tam giác có đúng 1 cạnh là cạnh đa giác.
        - #step([Tổng số tam giác tạo bởi 3 đỉnh bất kỳ])
          $ C_12^3 = (12 times 11 times 10) / 6 = 220 text(" tam giác") $
        - #step([Số tam giác có đúng 2 cạnh là cạnh đa giác])
          Mỗi tam giác loại này tương ứng với 2 cạnh kề nhau của đa giác, tức là tương ứng với 1 đỉnh chung giữa 2 cạnh đó:
          Có đúng $12$ tam giác.
        - #step([Số tam giác có đúng 1 cạnh là cạnh đa giác])
          + Chọn 1 cạnh trong 12 cạnh của đa giác: có $12$ cách.
          + Đỉnh thứ ba không được là 2 mút của cạnh đã chọn và không được là 2 đỉnh kề với 2 mút đó (để không tạo thêm cạnh đa giác), nên có $12 - 4 = 8$ đỉnh để chọn:
          Số tam giác là: $12 times 8 = 96$ tam giác.
        - #step([Lấy phần bù])
          Số tam giác không có cạnh nào là cạnh đa giác là:
          $ 220 - (12 + 96) = 220 - 108 = 112 text(" tam giác") $
    ]
)

// TN 4 (Ghép cặp thi đấu cờ vua)
#tn([Một câu lạc bộ cờ vua có $8$ kỳ thủ tham gia thi đấu vòng loại. Ban tổ chức cần ghép ngẫu nhiên $8$ kỳ thủ thành $4$ cặp thi đấu đồng thời (không phân biệt số thứ tự bàn cờ). Số cách chia cặp thi đấu là],
    (
        True([$105$]),
        [$2520$],
        [$420$],
        [$210$]
    ),
    loigiai: [
        *Phương pháp giải:* Đây là bài toán phân hoạch tập hợp $2n$ phần tử thành $n$ nhóm đôi không có thứ tự.
        - Chọn 2 người cho cặp thứ nhất: $C_8^2$ cách.
        - Chọn 2 người cho cặp thứ hai: $C_6^2$ cách.
        - Chọn 2 người cho cặp thứ ba: $C_4^2$ cách.
        - Hai người còn lại tạo thành cặp thứ tư: $C_2^2 = 1$ cách.
        Vì không phân biệt thứ tự giữa 4 cặp đấu, ta phải chia cho $4!$:
        $ (C_8^2 times C_6^2 times C_4^2 times C_2^2) / (4!) = (28 times 15 times 6 times 1) / 24 = 2520 / 24 = 105 text(" cách") $
    ]
)

// TN 5 (Lộ trình lưới tránh đoạn đường cấm có CeTZ)
#tn([Một robot di chuyển trên lưới ô vuông từ điểm gốc $O(0, 0)$ đến đích $B(4, 4)$ bằng các bước sang phải ($+x$) hoặc lên trên ($+y$). Biết rằng đoạn đường nối từ điểm $M(2, 2)$ đến điểm $N(2, 3)$ đang bảo trì nên robot không được đi qua. Có bao nhiêu lộ trình hợp lệ?],
    (
        True([$52$]),
        [$70$],
        [$18$],
        [$36$]
    ),
    loigiai: [
        *Phương pháp giải:* Đếm phần bù: Lấy tổng số lộ trình di chuyển trừ đi số lộ trình đi qua đoạn cấm $M(2, 2) -> N(2, 3)$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for x in range(5) {
            line((x, 0), (x, 4), stroke: 0.5pt + gray)
          }
          for y in range(5) {
            line((0, y), (4, y), stroke: 0.5pt + gray)
          }
          circle((0, 0), radius: 0.12, fill: accent)
          content((0, -0.3), [$O(0,0)$])
          circle((4, 4), radius: 0.12, fill: accent)
          content((4, 4.3), [$B(4,4)$])
          
          // Đoạn đường cấm MN
          line((2, 2), (2, 3), stroke: 2pt + red)
          circle((2, 2), radius: 0.1, fill: red)
          circle((2, 3), radius: 0.1, fill: red)
          content((1.6, 2.5), [Cấm], fill: red)
        })
        ]
        - Tổng số lộ trình từ $O(0, 0)$ đến $B(4, 4)$: gồm 4 bước phải, 4 bước lên:
          $ C_8^4 = (8 times 7 times 6 times 5) / 24 = 70 text(" lộ trình") $
        - Số lộ trình đi qua đoạn $M(2, 2) -> N(2, 3)$:
          + Từ $O(0, 0)$ đến $M(2, 2)$: $C_4^2 = 6$ cách.
          + Đi qua cạnh $M -> N$: duy nhất $1$ cách.
          + Từ $N(2, 3)$ đến $B(4, 4)$ (2 bước phải, 1 bước lên): $C_3^1 = 3$ cách.
          Số lộ trình đi qua đoạn cấm là: $6 times 1 times 3 = 18$ lộ trình.
        - Số lộ trình hợp lệ:
          $ 70 - 18 = 52 text(" lộ trình") $
    ]
)

// TN 6 (Stars and Bars nghiệm nguyên dương có CeTZ)
#tn([Có bao nhiêu bộ số nguyên dương $(x_1, x_2, x_3, x_4)$ thỏa mãn phương trình: $x_1 + x_2 + x_3 + x_4 = 12$?],
    (
        True([$165$]),
        [$220$],
        [$455$],
        [$120$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng bài toán chia kẹo của Euler (Kỹ thuật vách ngăn - Stars and Bars). Số nghiệm nguyên dương của phương trình $x_1 + x_2 + ... + x_k = n$ là $C_(n - 1)^(k - 1)$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // 12 hình tròn và 3 vách ngăn
          for i in range(12) {
            circle((i * 0.45, 0), radius: 0.12, fill: rgb("ccfbf1"), stroke: 0.8pt + teal)
          }
          // Vách ngăn tại khoảng trống 2, 5, 8
          line((2 * 0.45 + 0.225, -0.3), (2 * 0.45 + 0.225, 0.3), stroke: 1.5pt + red)
          line((5 * 0.45 + 0.225, -0.3), (5 * 0.45 + 0.225, 0.3), stroke: 1.5pt + red)
          line((8 * 0.45 + 0.225, -0.3), (8 * 0.45 + 0.225, 0.3), stroke: 1.5pt + red)
          content((2.7, -0.6), [12 ngôi sao và 3 vách ngăn đặt vào 11 khoảng trống])
        })
        ]
        Mười hai viên kẹo xếp thành hàng tạo ra $12 - 1 = 11$ khoảng trống giữa chúng.
        Để chia thành 4 phần nguyên dương, ta đặt $4 - 1 = 3$ vách ngăn vào 11 khoảng trống này:
        $ C_11^3 = (11 times 10 times 9) / (3 times 2 times 1) = 165 text(" bộ nghiệm") $
    ]
)

// TN 7 (Lập số chẵn có mặt số 0 ở giữa)
#tn([Từ tập hợp các chữ số $S = {0, 1, 2, 3, 4, 5, 6}$, có thể lập được bao nhiêu số tự nhiên chẵn gồm $5$ chữ số đôi một khác nhau sao cho chữ số $0$ không đứng ở vị trí tận cùng?],
    (
        True([$540$]),
        [$720$],
        [$360$],
        [$480$]
    ),
    loigiai: [
        *Phương pháp giải:* Xét cấu trúc số $overline(a b c d e)$. Chữ số $e$ phải chẵn và khác 0 ($e in {2, 4, 6}$). Chữ số 0 bắt buộc có mặt trong 3 vị trí ở giữa ${b, c, d}$. Áp dụng quy tắc nhân theo từng công đoạn.
        - Chữ số tận cùng $e in {2, 4, 6}$: có $3$ cách chọn.
        - Chữ số 0 không đứng đầu và không đứng cuối, nên phải nằm ở một trong ba vị trí $b, c, d$: có $3$ cách xếp vị trí cho số 0.
        - Chữ số đầu $a != 0$ và $a != e$: có $7 - 2 = 5$ cách chọn.
        - Hai vị trí còn lại được chọn từ 4 chữ số chưa dùng: có $A_4^2 = 4 times 3 = 12$ cách.
        Theo quy tắc nhân, tổng số các số lập được là:
        $ 3 times 3 times 5 times 12 = 540 text(" số") $
    ]
)

// TN 8 (Tam giác vuông cân trong đa giác đều 16 đỉnh)
#tn([Cho đa giác đều có $16$ đỉnh nội tiếp trong đường tròn. Có bao nhiêu tam giác vuông cân có $3$ đỉnh là các đỉnh của đa giác đều đó?],
    (
        True([$16$]),
        [$32$],
        [$64$],
        [$8$]
    ),
    loigiai: [
        *Phương pháp giải:* Một tam giác vuông cân nội tiếp có cạnh huyền là đường kính của đường tròn, và đỉnh góc vuông là điểm chính giữa của nửa cung tròn chắn bởi đường kính đó.
        - Đa giác đều 16 đỉnh có $16 / 2 = 8$ đường kính.
        - Hai đường kính vuông góc với nhau tạo thành đúng 4 tam giác vuông cân.
        - Số cặp đường kính vuông góc nhau trong đa giác 16 đỉnh:
          Mỗi đường kính có duy nhất 1 đường kính vuông góc với nó. Có 8 đường kính nên có $8 / 2 = 4$ cặp đường kính vuông góc.
        - Mỗi cặp đường kính tạo thành đúng 4 tam giác vuông cân:
        $ 4 times 4 = 16 text(" tam giác vuông cân") $
    ]
)

// TN 9 (Xếp chữ cái không kề nhau)
#tn([Có bao nhiêu cách hoán vị các chữ cái của từ "OLYMPIAD" sao cho không có hai nguyên âm nào đứng cạnh nhau? (Biết trong từ có 3 nguyên âm là O, I, A).],
    (
        True([$14400$]),
        [$7200$],
        [$28800$],
        [$40320$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp vách ngăn. Xếp các phụ âm trước để tạo các khoảng trống, sau đó xếp các nguyên âm vào các khoảng trống đó.
        Từ "OLYMPIAD" gồm 8 chữ cái khác nhau: 3 nguyên âm ${O, I, A}$ và 5 phụ âm ${L, Y, M, P, D}$.
        - Xếp 5 phụ âm thành hàng ngang: có $5! = 120$ cách.
        - Năm phụ âm tạo ra $5 + 1 = 6$ khoảng trống (ở 2 đầu và giữa các phụ âm).
        - Chọn và xếp 3 nguyên âm vào 6 khoảng trống: có $A_6^3 = 6 times 5 times 4 = 120$ cách.
        Theo quy tắc nhân:
        $ 120 times 120 = 14400 text(" cách") $
    ]
)

// TN 10 (Phương trình tổ hợp)
#tn([Tìm nghiệm nguyên dương $n$ của phương trình: $C_(n + 1)^(n - 1) + 2 A_n^2 = 55$.],
    (
        True([$n = 5$]),
        [$n = 4$],
        [$n = 6$],
        [$n = 7$]
    ),
    loigiai: [
        *Phương pháp giải:* Dùng tính chất bù của tổ hợp $C_(n+1)^(n-1) = C_(n+1)^2$ để đơn giản hóa biểu thức đại số.
        Điều kiện: $n >= 2, n in NN^*$.
        Ta có:
        $ C_(n + 1)^(n - 1) = C_(n + 1)^2 = ((n + 1)n) / 2 $
        $ A_n^2 = n(n - 1) $
        Phương trình trở thành:
        $ ((n + 1)n) / 2 + 2n(n - 1) = 55 <=> (n^2 + n) + 4(n^2 - n) = 110 $
        $ <=> 5n^2 - 3n - 110 = 0 <=> (n - 5)(5n + 22) = 0 $
        Vì $n in NN^*$ nên ta nhận nghiệm $n = 5$.
    ]
)

// TN 11 (Số hình chữ nhật trong đa giác đều 12 đỉnh)
#tn([Cho đa giác đều gồm $12$ đỉnh nội tiếp trong đường tròn. Có bao nhiêu hình chữ nhật có $4$ đỉnh là các đỉnh của đa giác đều đó?],
    (
        True([$15$]),
        [$30$],
        [$45$],
        [$60$]
    ),
    loigiai: [
        *Phương pháp giải:* Một tứ giác nội tiếp là hình chữ nhật khi và chỉ khi hai đường chéo của nó là hai đường kính của đường tròn.
        - Đa giác đều 12 đỉnh có $12 / 2 = 6$ đường kính qua tâm.
        - Mỗi cặp gồm 2 đường kính bất kỳ xác định DUY NHẤT một hình chữ nhật có 4 đỉnh thuộc đa giác.
        Do đó số hình chữ nhật là:
        $ C_6^2 = (6 times 5) / 2 = 15 text(" hình chữ nhật") $
    ]
)

// TN 12 (Phân công 9 chuyên viên vào 3 dự án)
#tn([Có $9$ chuyên viên được phân công vào $3$ dự án khác nhau $A, B, C$ sao cho dự án $A$ có $4$ người, dự án $B$ có $3$ người và dự án $C$ có $2$ người. Số cách phân công là],
    (
        True([$1260$]),
        [$2520$],
        [$630$],
        [$1512$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng quy tắc nhân và tổ hợp phân nhóm có thứ tự.
        - Chọn 4 người trong 9 người cho dự án A: có $C_9^4 = 126$ cách.
        - Chọn 3 người trong 5 người còn lại cho dự án B: có $C_5^3 = 10$ cách.
        - Hai người còn lại vào dự án C: có $C_2^2 = 1$ cách.
        Theo quy tắc nhân, số cách phân công là:
        $ 126 times 10 times 1 = 1260 text(" cách") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích đa giác đều 12 đỉnh có CeTZ)
#ds([Cho đa giác đều $H$ gồm $12$ đỉnh nội tiếp đường tròn tâm $O$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đa giác $H$ có tất cả $54$ đường chéo.]),
    True([Số tam giác có $3$ đỉnh là đỉnh của $H$ và có đúng $1$ cạnh là cạnh của $H$ bằng $96$.]),
    True([Số hình chữ nhật có $4$ đỉnh là đỉnh của $H$ bằng $15$.]),
    [Số tam giác vuông có $3$ đỉnh là đỉnh của $H$ bằng $30$.]
  ),
  loigiai: [
    #step([Xét ý a: Số đường chéo])
    $C_12^2 - 12 = 66 - 12 = 54$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tam giác có đúng 1 cạnh đa giác])
    $12 times (12 - 4) = 12 times 8 = 96$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Số hình chữ nhật])
    $C_6^2 = 15$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số tam giác vuông])
    Có 6 đường kính, mỗi đường kính kết hợp với 10 đỉnh còn lại tạo thành $6 times 10 = 60$ tam giác vuông (chứ không phải $30$).
    Khẳng định bằng $30$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình tổ hợp và tính chất)
#ds([Xét phương trình $C_(n + 1)^(n - 1) + 2 A_n^2 = 55$ với $n in NN, n >= 2$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đẳng thức tổ hợp $C_(n + 1)^(n - 1) = C_(n + 1)^2$ luôn đúng với mọi $n >= 2$.]),
    True([Phương trình đã cho tương đương với phương trình bậc hai $5n^2 - 3n - 110 = 0$.]),
    True([Nghiệm nguyên dương duy nhất của phương trình là $n = 5$.]),
    [Tại nghiệm $n = 5$, giá trị của biểu thức $A_n^3$ bằng $120$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Giải phương trình])
    Giải phương trình ra $n = 5$. Mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Tính An^3 tại n = 5])
    $A_5^3 = 5 times 4 times 3 = 60$ (chứ không phải $120$, $120$ là $5!$).
    Khẳng định bằng $120$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Lưới tọa độ có chướng ngại vật)
#ds([Một robot di chuyển trên lưới từ $O(0, 0)$ đến $B(4, 4)$ chỉ bằng các bước sang phải hoặc lên trên $1$ đơn vị. Đoạn đường nối $M(2, 2)$ và $N(2, 3)$ bị hỏng không đi qua được.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số lộ trình không có điều kiện cấm từ $O$ đến $B$ là $70$ lộ trình.]),
    True([Số lộ trình từ $O(0, 0)$ đến $M(2, 2)$ bằng $6$ lộ trình.]),
    True([Số lộ trình từ $O(0, 0)$ đến $B(4, 4)$ đi qua đoạn đường hỏng $M N$ bằng $18$ lộ trình.]),
    [Số lộ trình hợp lệ tránh được đoạn đường hỏng bằng $60$ lộ trình.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tính toán số lộ trình])
    - Tổng: $C_8^4 = 70$.
    - Qua M: $C_4^2 = 6$.
    - Qua đoạn MN: $6 times 1 times 3 = 18$.
    Các mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Số lộ trình hợp lệ])
    $70 - 18 = 52$ (chứ không phải $60$).
    Khẳng định bằng $60$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Stars and Bars và nghiệm nguyên)
#ds([Xét phương trình $x_1 + x_2 + x_3 + x_4 = 12$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số bộ nghiệm nguyên dương $(x_i >= 1)$ của phương trình bằng $165$.]),
    True([Số bộ nghiệm nguyên thỏa mãn $x_i >= 2$ với mọi $i in {1, 2, 3, 4}$ bằng $35$.]),
    True([Số bộ nghiệm nguyên không âm $(x_i >= 0)$ của phương trình bằng $455$.]),
    [Số bộ nghiệm nguyên dương có ít nhất một ẩn lẻ bằng $100$.]
  ),
  loigiai: [
    #step([Xét ý a: Nghiệm nguyên dương])
    $C_11^3 = 165$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Nghiệm xi >= 2])
    Đặt $y_i = x_i - 1 >= 1$, phương trình thành $y_1 + y_2 + y_3 + y_4 = 8$ (nguyên dương):
    $C_7^3 = (7 times 6 times 5) / 6 = 35$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Nghiệm không âm])
    $C_(12 + 4 - 1)^(4 - 1) = C_15^3 = (15 times 14 times 13) / 6 = 455$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Ít nhất một ẩn lẻ])
    Trường hợp tất cả các ẩn đều chẵn: đặt $x_i = 2 z_i$ ($z_i >= 1$), phương trình thành $z_1 + z_2 + z_3 + z_4 = 6$.
    Số nghiệm toàn chẵn: $C_5^3 = 10$.
    Số nghiệm có ít nhất một ẩn lẻ: $165 - 10 = 155$ (chứ không phải $100$).
    Khẳng định bằng $100$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Có bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau thỏa mãn các chữ số giảm dần từ trái sang phải: $a > b > c > d > e$?],
    [252],
    loigiai: [
        #step([Tổ hợp C_10^5])
        $ C_10^5 = 252 text(" số") $
    ]
)

// TLN 2
#tln([Có $6$ viên ngọc màu khác nhau xâu thành một chiếc vòng tay tròn khép kín. Có bao nhiêu kiểu vòng tay khác nhau nếu việc lật ngược vòng tay được xem là như nhau?],
    [60],
    loigiai: [
        #step([Hoán vị vòng quanh chia 2])
        $ (5!) / 2 = 60 text(" kiểu") $
    ]
)

// TLN 3
#tln([Cho đa giác đều có $12$ đỉnh. Có bao nhiêu tam giác có $3$ đỉnh là các đỉnh của đa giác mà không có cạnh nào là cạnh của đa giác?],
    [112],
    loigiai: [
        #step([Phần bù])
        $ 220 - (12 + 96) = 112 text(" tam giác") $
    ]
)

// TLN 4
#tln([Có bao nhiêu bộ số nguyên dương $(x_1, x_2, x_3, x_4)$ thỏa mãn $x_1 + x_2 + x_3 + x_4 = 12$?],
    [165],
    loigiai: [
        #step([Stars and Bars])
        $ C_11^3 = 165 text(" bộ nghiệm") $
    ]
)

// TLN 5
#tln([Tìm nghiệm nguyên dương $n$ của phương trình: $C_(n + 1)^(n - 1) + 2 A_n^2 = 55$.],
    [5],
    loigiai: [
        #step([Giải phương trình])
        $ 5n^2 - 3n - 110 = 0 => n = 5 $
    ]
)

// TLN 6
#tln([Cho đa giác đều có $12$ đỉnh. Có bao nhiêu hình chữ nhật có $4$ đỉnh là đỉnh của đa giác đều đó?],
    [15],
    loigiai: [
        #step([Cặp đường kính])
        $ C_6^2 = 15 text(" hình chữ nhật") $
    ]
)

] // end make-questions

#make-questions()
