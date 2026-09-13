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
  exam-title: "BÀI 23: QUY TẮC ĐẾM (ĐỀ SỐ 26B - VẬN DỤNG CAO & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "174",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Lập số chia hết cho 25)
#tn([Từ các chữ số thuộc tập hợp $S = {0, 1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau và chia hết cho $25$?],
    (
        True([$320$]),
        [$400$],
        [$280$],
        [$360$]
    ),
    loigiai: [
        Một số $overline(a b c d e)$ chia hết cho 25 khi và chỉ khi hai chữ số tận cùng $overline(d e)$ chia hết cho 25.
        Từ tập $S$, các cặp $overline(d e)$ hợp lệ là: $50, 25, 75$.
        Ta chia thành hai trường hợp theo vị trí của chữ số 0:
        - #step([Trường hợp 1: Tận cùng de = 50 (có chứa chữ số 0)])
          + Chọn cặp $(d, e) = (5, 0)$: có $1$ cách chọn.
          + Chữ số hàng chục nghìn $a != 0$ tự động thỏa mãn vì số 0 đã ở vị trí $e$.
            Chọn $a in S setminus {0, 5}$: có $6$ cách chọn.
          + Chọn $b$: có $5$ cách chọn.
          + Chọn $c$: có $4$ cách chọn.
          Số lượng trong TH1: $1 times 6 times 5 times 4 = 120$ số.
        - #step([Trường hợp 2: Tận cùng de in {25, 75} (không chứa chữ số 0)])
          + Chọn cặp $(d, e)$: có $2$ cách chọn ($25$ hoặc $75$).
          + Chữ số $a != 0$ và $a != d, e$: có $8 - 3 = 5$ cách chọn.
          + Chữ số $b$ (được chọn số 0): có $5$ cách chọn.
          + Chữ số $c$: có $4$ cách chọn.
          Số lượng trong TH2: $2 times (5 times 5 times 4) = 200$ số.
        Theo quy tắc cộng, tổng số các số chia hết cho 25 là:
        $ 120 + 200 = 320 text(" số") $
    ]
)

// TN 2 (Xếp sách cùng môn cạnh nhau)
#tn([Trên một giá sách có $5$ cuốn sách Toán khác nhau, $4$ cuốn sách Vật lí khác nhau và $3$ cuốn sách Hóa học khác nhau được xếp thành một hàng ngang. Có bao nhiêu cách xếp sao cho các cuốn sách cùng một môn luôn luôn đứng cạnh nhau?],
    (
        True([$103680$]),
        [$17280$],
        [$51840$],
        [$207360$]
    ),
    loigiai: [
        Áp dụng phương pháp buộc phần tử:
        - #step([Buộc từng nhóm môn học])
          + Khối sách Toán: $5! = 120$ cách hoán vị nội bộ.
          + Khối sách Vật lí: $4! = 24$ cách hoán vị nội bộ.
          + Khối sách Hóa học: $3! = 6$ cách hoán vị nội bộ.
        - #step([Xếp vị trí cho 3 khối môn học])
          Xem 3 khối sách là 3 phần tử lớn xếp thành hàng ngang: có $3! = 6$ cách xếp.
        Theo quy tắc nhân, tổng số cách xếp là:
        $ 120 times 24 times 6 times 6 = 103680 text(" cách") $
    ]
)

// TN 3 (Mạng lưới giao thông liên vùng)
#tn([Một mạng lưới giao thông kết nối bốn đô thị $A, B, C, D$. Giữa $A$ và $B$ có $3$ tuyến đường bộ và $2$ tuyến đường sắt. Giữa $B$ và $C$ có $4$ tuyến đường bộ. Giữa $A$ và $C$ có $2$ tuyến đường hàng không trực tiếp. Từ $C$ đến $D$ có $3$ tuyến đường cao tốc. Hỏi có bao nhiêu hành trình khác nhau để đi từ đô thị $A$ đến đô thị $D$?],
    (
        True([$66$]),
        [$60$],
        [$72$],
        [$84$]
    ),
    loigiai: [
        Hành trình từ $A$ đến $D$ gồm hai phương án độc lập:
        - #step([Phương án 1: Đi từ A qua B, đến C rồi đến D])
          + Từ $A$ đến $B$: có $3 + 2 = 5$ cách.
          + Từ $B$ đến $C$: có $4$ cách.
          + Từ $C$ đến $D$: có $3$ cách.
          Số cách theo phương án 1 là: $5 times 4 times 3 = 60$ cách.
        - #step([Phương án 2: Đi máy bay thẳng từ A đến C rồi đi cao tốc đến D])
          + Từ $A$ đến $C$: có $2$ cách bay thẳng.
          + Từ $C$ đến $D$: có $3$ cách.
          Số cách theo phương án 2 là: $2 times 3 = 6$ cách.
        Theo quy tắc cộng, tổng số hành trình từ $A$ đến $D$ là:
        $ 60 + 6 = 66 text(" cách") $
    ]
)

// TN 4 (Số đối xứng Palindrome có điều kiện bẫy tư duy)
#tn([Có bao nhiêu số tự nhiên đối xứng (đọc xuôi hay đọc ngược đều như nhau) gồm $7$ chữ số sao cho chữ số chính giữa là một chữ số lẻ, đồng thời tổng tất cả các chữ số của số đó là một số chẵn?],
    (
        True([$0$]),
        [$4500$],
        [$5000$],
        [$9000$]
    ),
    loigiai: [
        Số đối xứng gồm 7 chữ số có dạng:
        $ overline(a b c d c b a) quad text("với") a in {1, 2, ..., 9}, quad b, c, d in {0, 1, ..., 9} $
        - #step([Tính tổng các chữ số])
          Tổng các chữ số của số này là:
          $ S = a + b + c + d + c + b + a = 2(a + b + c) + d $
        - #step([Biện luận tính chẵn lẻ])
          Vì $2(a + b + c)$ luôn luôn là một số chẵn với mọi giá trị của $a, b, c$, nên tính chẵn lẻ của tổng $S$ phụ thuộc hoàn toàn vào chữ số chính giữa $d$:
          $ S text(" là số chẵn") <=> d text(" là số chẵn") $
          Tuy nhiên, giả thiết bài toán yêu cầu chữ số chính giữa $d$ phải là số lẻ!
          Điều này dẫn đến mâu thuẫn: không thể tồn tại số tự nhiên đối xứng nào thỏa mãn đồng thời cả hai điều kiện trên.
        Vậy số các số thỏa mãn là $0$ số.
    ]
)

// TN 5 (Vách ngăn nâng cao)
#tn([Có bao nhiêu cách xếp $6$ học sinh nam và $3$ học sinh nữ thành một hàng dọc sao cho không có hai học sinh nữ nào đứng cạnh nhau?],
    (
        True([$151200$]),
        [$50400$],
        [$302400$],
        [$25200$]
    ),
    loigiai: [
        Áp dụng phương pháp vách ngăn:
        - #step([Bước 1: Xếp 6 học sinh nam vào hàng trước])
          Số cách xếp 6 học sinh nam là:
          $ 6! = 720 text(" cách") $
        - #step([Bước 2: Tạo các vị trí trống giữa các bạn nam])
          Sáu bạn nam đứng thành hàng tạo ra $6 + 1 = 7$ khoảng trống (ở hai đầu và giữa các bạn nam).
        - #step([Bước 3: Xếp 3 bạn nữ vào các khoảng trống])
          Mỗi khoảng trống chỉ được xếp tối đa 1 bạn nữ để không có 2 bạn nữ nào cạnh nhau.
          Số cách chọn và xếp 3 bạn nữ vào 7 khoảng trống là:
          $ A_7^3 = 7 times 6 times 5 = 210 text(" cách") $
        Theo quy tắc nhân, tổng số cách xếp là:
        $ 720 times 210 = 151200 text(" cách") $
    ]
)

// TN 6 (Đường đi 3D trên khối lập phương)
#tn([Một chú robot tí hon di chuyển trên các cạnh của một lưới lập phương kích thước $3 times 3 times 3$ từ góc $O(0, 0, 0)$ đến góc đối diện $A(3, 3, 3)$. Mỗi bước đi của robot có độ dài $1$ đơn vị theo chiều dương của một trong ba trục tọa độ $O x, O y, O z$. Có bao nhiêu con đường đi ngắn nhất từ $O$ đến $A$?],
    (
        True([$1680$]),
        [$504$],
        [$756$],
        [$3360$]
    ),
    loigiai: [
        Mỗi con đường ngắn nhất từ $O(0, 0, 0)$ đến $A(3, 3, 3)$ cần thực hiện đúng $3$ bước theo phương $O x$, $3$ bước theo phương $O y$ và $3$ bước theo phương $O z$.
        Tổng số bước đi là:
        $ 3 + 3 + 3 = 9 text(" bước") $
        Mỗi lộ trình là một hoán vị lặp của chuỗi 9 ký tự gồm $3$ chữ cái $X$, $3$ chữ cái $Y$ và $3$ chữ cái $Z$:
        $ (9!) / (3! 3! 3!) = (362880) / (6 times 6 times 6) = (362880) / 216 = 1680 text(" con đường") $
    ]
)

// TN 7 (Lập số chia hết cho 9)
#tn([Từ các chữ số thuộc tập $S = {0, 1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau và chia hết cho $9$?],
    (
        True([$96$]),
        [$120$],
        [$84$],
        [$108$]
    ),
    loigiai: [
        Một số chia hết cho 9 khi và chỉ khi tổng các chữ số của nó chia hết cho 9.
        Tổng của 4 chữ số khác nhau lấy từ $S$ nhận giá trị nhỏ nhất là $0 + 1 + 2 + 3 = 6$ và lớn nhất là $4 + 5 + 6 + 7 = 22$.
        Do đó, tổng các chữ số chỉ có thể bằng $9$ hoặc $18$:
        - #step([Trường hợp 1: Tổng bằng 9])
          Các bộ 4 chữ số có tổng bằng 9 là:
          + ${0, 1, 2, 6}$: chữ số 0 có mặt $=> 3 times 3! = 18$ số.
          + ${0, 1, 3, 5}$: chữ số 0 có mặt $=> 3 times 3! = 18$ số.
          + ${0, 2, 3, 4}$: chữ số 0 có mặt $=> 3 times 3! = 18$ số.
          Tổng số lượng trong TH1: $18 times 3 = 54$ số.
        - #step([Trường hợp 2: Tổng bằng 18])
          Các bộ 4 chữ số có tổng bằng 18 là:
          + ${0, 5, 6, 7}$: có mặt số 0 $=> 3 times 3! = 18$ số.
          + ${1, 4, 6, 7}$: không có số 0 $=> 4! = 24$ số.
          Tổng số lượng trong TH2: $18 + 24 = 42$ số.
        Theo quy tắc cộng, tổng số các số chia hết cho 9 là:
        $ 54 + 42 = 96 text(" số") $
    ]
)

// TN 8 (Xếp chữ số có khoảng cách)
#tn([Xếp ngẫu nhiên $6$ chữ số $1, 2, 3, 4, 5, 6$ thành một hàng ngang. Có bao nhiêu cách xếp sao cho hai chữ số $1$ và $2$ luôn đứng cách nhau ít nhất $2$ chữ số khác?],
    (
        True([$288$]),
        [$432$],
        [$240$],
        [$192$]
    ),
    loigiai: [
        Áp dụng phương pháp đếm bằng phần bù:
        - #step([Tổng số hoán vị của 6 chữ số])
          $ 6! = 720 text(" cách") $
        - #step([Số cách 1 và 2 đứng cạnh nhau (khoảng cách 0)])
          Buộc hai số thành khối $[1 2]$ hoặc $[2 1]$ (có $2$ cách). Khối và 4 số còn lại tạo thành 5 phần tử:
          $ 2 times 5! = 240 text(" cách") $
        - #step([Số cách 1 và 2 đứng cách nhau đúng 1 chữ số])
          Dạng $[1 X 2]$ hoặc $[2 X 1]$:
          + Chọn chữ số $X$ từ 4 chữ số ${3, 4, 5, 6}$: có $4$ cách.
          + Đổi chỗ giữa 1 và 2: có $2$ cách.
          + Khối này cùng 3 chữ số còn lại là 4 phần tử: có $4! = 24$ cách.
          Số lượng: $4 times 2 times 24 = 192$ cách.
        - #step([Lấy phần bù])
          Số cách để 1 và 2 cách nhau ít nhất 2 chữ số là:
          $ 720 - (240 + 192) = 720 - 432 = 288 text(" cách") $
    ]
)

// TN 9 (Mã kiểm tra Checksum)
#tn([Một hệ thống mã vạch sử dụng chuỗi gồm $5$ chữ số $d_1 d_2 d_3 d_4 d_5$ (mỗi chữ số lấy từ tập ${0, 1, ..., 9}$). Mã số được coi là hợp lệ nếu thỏa mãn điều kiện kiểm tra: $(3 d_1 + d_2 + 3 d_3 + d_4 + d_5)$ chia hết cho $10$. Biết rằng $4$ chữ số đầu $d_1, d_2, d_3, d_4$ được chọn tùy ý. Hỏi có bao nhiêu chuỗi mã số hợp lệ?],
    (
        True([$10000$]),
        [$100000$],
        [$9000$],
        [$5000$]
    ),
    loigiai: [
        - #step([Chọn 4 chữ số đầu tiên])
          Mỗi vị trí $d_1, d_2, d_3, d_4$ có $10$ cách chọn (từ 0 đến 9).
          Số cách chọn bộ 4 chữ số đầu là:
          $ 10 times 10 times 10 times 10 = 10^4 = 10000 text(" cách") $
        - #step([Xác định chữ số kiểm tra d5])
          Với mỗi bộ $(d_1, d_2, d_3, d_4)$ đã chọn, đặt tổng $T = 3 d_1 + d_2 + 3 d_3 + d_4$.
          Khi chia $T$ cho $10$, ta nhận được một số dư duy nhất $r in {0, 1, 2, ..., 9}$.
          Để $T + d_5$ chia hết cho 10, chữ số $d_5$ bắt buộc phải nhận giá trị duy nhất:
          $ d_5 = (10 - r) mod 10 $
          Do đó, chữ số $d_5$ luôn có duy nhất $1$ cách chọn để thỏa mãn điều kiện.
        Theo quy tắc nhân, số mã số hợp lệ là:
        $ 10000 times 1 = 10000 text(" mã") $
    ]
)

// TN 10 (Đếm hình chữ nhật trong bàn cờ)
#tn([Trên một bàn cờ ô vuông kích thước $8 times 8$, có tất cả bao nhiêu hình chữ nhật (kể cả hình vuông) được tạo thành bởi các đường kẻ của bàn cờ?],
    (
        True([$1296$]),
        [$204$],
        [$576$],
        [$2304$]
    ),
    loigiai: [
        Bàn cờ kích thước $8 times 8$ ô vuông được tạo bởi $8 + 1 = 9$ đường kẻ ngang song song và $8 + 1 = 9$ đường kẻ dọc song song.
        Mỗi hình chữ nhật được xác định duy nhất bởi việc chọn ra $2$ đường kẻ ngang bất kỳ và $2$ đường kẻ dọc bất kỳ:
        - Chọn 2 đường kẻ ngang từ 9 đường kẻ ngang: có $C_9^2 = (9 times 8) / 2 = 36$ cách.
        - Chọn 2 đường kẻ dọc từ 9 đường kẻ dọc: có $C_9^2 = (9 times 8) / 2 = 36$ cách.
        Theo quy tắc nhân, tổng số hình chữ nhật tạo thành là:
        $ 36 times 36 = 1296 text(" hình chữ nhật") $
    ]
)

// TN 11 (Tam giác trên 3 đường thẳng song song)
#tn([Cho ba đường thẳng song song phân biệt $d_1, d_2, d_3$. Trên $d_1$ lấy $4$ điểm phân biệt, trên $d_2$ lấy $5$ điểm phân biệt và trên $d_3$ lấy $6$ điểm phân biệt. Có tất cả bao nhiêu tam giác có $3$ đỉnh là các điểm trong số $15$ điểm đã cho?],
    (
        True([$421$]),
        [$455$],
        [$34$],
        [$395$]
    ),
    loigiai: [
        Tổng số điểm trên cả 3 đường thẳng là $4 + 5 + 6 = 15$ điểm:
        - #step([Chọn 3 điểm bất kỳ])
          $ C_15^3 = (15 times 14 times 13) / 6 = 455 text(" cách") $
        - #step([Trừ đi các bộ 3 điểm thẳng hàng])
          Ba điểm thẳng hàng khi và chỉ khi cả 3 điểm cùng nằm trên một đường thẳng:
          + Cùng trên $d_1$: $C_4^3 = 4$ cách.
          + Cùng trên $d_2$: $C_5^3 = 10$ cách.
          + Cùng trên $d_3$: $C_6^3 = 20$ cách.
          Tổng số bộ 3 điểm thẳng hàng là: $4 + 10 + 20 = 34$ cách.
        - #step([Số tam giác tạo thành])
          $ 455 - 34 = 421 text(" tam giác") $
    ]
)

// TN 12 (Chọn nhóm không có cặp đôi đối kháng)
#tn([Một câu lạc bộ có $10$ nam và $8$ nữ. Ban chủ nhiệm cần chọn một đội tuyển gồm $5$ học sinh sao cho có ít nhất $2$ nam, ít nhất $2$ nữ và trong đội tuyển không đồng thời có mặt cả bạn nam $A$ và bạn nữ $B$. Số cách chọn là],
    (
        True([$5439$]),
        [$5880$],
        [$441$],
        [$5040$]
    ),
    loigiai: [
        - #step([Tổng số cách chọn 5 người có ít nhất 2 nam và 2 nữ])
          Chỉ có hai trường hợp:
          + TH1 (3 nam và 2 nữ): $C_10^3 times C_8^2 = 120 times 28 = 3360$ cách.
          + TH2 (2 nam và 3 nữ): $C_10^2 times C_8^3 = 45 times 56 = 2520$ cách.
          Tổng số cách thỏa mãn điều kiện giới tính là:
          $ 3360 + 2520 = 5880 text(" cách") $
        - #step([Số cách chọn có mặt cả hai bạn A và B])
          Khi cả $A$ (nam) và $B$ (nữ) đều được chọn, ta cần chọn thêm 3 bạn từ 9 nam còn lại và 7 nữ còn lại:
          + TH1 (chọn thêm 2 nam, 1 nữ để được 3 nam, 2 nữ): $C_9^2 times C_7^1 = 36 times 7 = 252$ cách.
          + TH2 (chọn thêm 1 nam, 2 nữ để được 2 nam, 3 nữ): $C_9^1 times C_7^2 = 9 times 21 = 189$ cách.
          Tổng số cách có cả $A$ và $B$ là: $252 + 189 = 441$ cách.
        - #step([Lấy phần bù])
          Số cách chọn hợp lệ không đồng thời có mặt cả $A$ và $B$ là:
          $ 5880 - 441 = 5439 text(" cách") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Mạng lưới giao thông và trạm trung chuyển có CeTZ)
#ds([Mạng lưới vận tải hàng hóa kết nối bốn kho bãi $A, B, C, D$ được thiết kế như sơ đồ:
- Từ kho $A$ đến kho $B$ có $3$ tuyến đường xe tải và $2$ tuyến đường sắt.
- Từ kho $B$ đến kho $C$ có $4$ tuyến đường bộ.
- Giữa kho $A$ và kho $C$ có thêm $2$ đường bay vận tải thẳng.
- Từ kho $C$ đến kho $D$ có $3$ tuyến đường thủy và $1$ tuyến đường sắt chuyên dụng.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  circle((-3, 0), radius: 0.35, fill: rgb("ccfbf1"), stroke: 1.2pt + teal)
  content((-3, 0), [$A$])
  
  circle((-1, 1), radius: 0.35, fill: rgb("ccfbf1"), stroke: 1.2pt + teal)
  content((-1, 1), [$B$])
  
  circle((1, 0), radius: 0.35, fill: rgb("ccfbf1"), stroke: 1.2pt + teal)
  content((1, 0), [$C$])
  
  circle((3.5, 0), radius: 0.35, fill: rgb("ccfbf1"), stroke: 1.2pt + teal)
  content((3.5, 0), [$D$])
  
  // A -> B
  line((-2.7, 0.2), (-1.3, 0.9), stroke: 1pt + teal, mark: (end: "stealth"))
  content((-2.2, 0.8), [5 tuyến])
  
  // B -> C
  line((-0.7, 0.9), (0.7, 0.2), stroke: 1pt + teal, mark: (end: "stealth"))
  content((0.2, 0.8), [4 tuyến])
  
  // Bay thẳng A -> C
  bezier((-2.8, -0.2), (0.8, -0.2), (-1, -1.2), (0, -1.2), stroke: 1.2pt + red, mark: (end: "stealth"))
  content((-1, -1.5), [2 đường bay thẳng])
  
  // C -> D
  line((1.35, 0), (3.15, 0), stroke: 1.2pt + blue, mark: (end: "stealth"))
  content((2.25, 0.3), [4 tuyến])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số lộ trình vận chuyển hàng hóa từ $A$ đến $C$ qua trạm trung chuyển $B$ là $20$ lộ trình.]),
    True([Tổng số lộ trình vận chuyển hàng hóa từ kho $A$ đến kho $C$ bằng mọi phương tiện là $22$ lộ trình.]),
    True([Tổng số lộ trình vận chuyển hàng hóa từ kho $A$ đến kho đích $D$ là $88$ lộ trình.]),
    [Nếu tuyến đường bay thẳng giữa $A$ và $C$ bị tạm ngừng hoạt động do thời tiết xấu, số lộ trình từ $A$ đến $D$ giảm đi $12$ lộ trình.]
  ),
  loigiai: [
    #step([Xét ý a: Từ A đến C qua B])
    Từ $A$ đến $B$ có $3 + 2 = 5$ tuyến. Từ $B$ đến $C$ có $4$ tuyến.
    Theo quy tắc nhân: $5 times 4 = 20$ lộ trình. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tổng số lộ trình từ A đến C])
    Gồm qua $B$ ($20$ cách) hoặc bay thẳng ($2$ cách).
    Theo quy tắc cộng: $20 + 2 = 22$ lộ trình. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tổng lộ trình từ A đến D])
    Từ $A$ đến $C$ có 22 lộ trình. Từ $C$ đến $D$ có $3 + 1 = 4$ tuyến.
    Theo quy tắc nhân: $22 times 4 = 88$ lộ trình. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Khi dừng bay thẳng A - C])
    Số lộ trình đi qua đường bay thẳng là: $2 times 4 = 8$ lộ trình (chứ không phải $12$).
    Do đó số lộ trình giảm đi đúng 8 lộ trình.
    Khẳng định giảm đi $12$ lộ trình là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Lập số tự nhiên từ S = {0, 1, 2, 3, 4, 5, 6, 7} chia hết cho 25)
#ds([Cho tập hợp $S = {0, 1, 2, 3, 4, 5, 6, 7}$. Lập các số tự nhiên có $5$ chữ số đôi một khác nhau chia hết cho $25$ từ tập $S$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Có đúng $3$ bộ hai chữ số tận cùng $overline(d e)$ chia hết cho $25$ lập từ $S$ là $50, 25, 75$.]),
    True([Số các số chia hết cho $25$ có chữ số tận cùng là $50$ bằng $120$ số.]),
    True([Số các số chia hết cho $25$ có chữ số tận cùng là $25$ bằng $100$ số.]),
    [Tổng số các số tự nhiên gồm $5$ chữ số đôi một khác nhau chia hết cho $25$ lập từ $S$ là $400$ số.]
  ),
  loigiai: [
    #step([Xét ý a: Cặp tận cùng])
    Các số có 2 chữ số chia hết cho 25 từ $S$ là $25, 50, 75$ (đúng 3 cặp). Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tận cùng 50])
    $d e = 50$, $a in S setminus {0, 5}$ (6 cách), $b$ có 5 cách, $c$ có 4 cách:
    $1 times 6 times 5 times 4 = 120$ số. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tận cùng 25])
    $d e = 25$, $a != 0, 2, 5$ (5 cách), $b$ có 5 cách, $c$ có 4 cách:
    $1 times 5 times 5 times 4 = 100$ số. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng số các số])
    Tương tự tận cùng 75 có $100$ số.
    Tổng số các số chia hết cho 25 là: $120 + 100 + 100 = 320$ số (chứ không phải $400$).
    Khẳng định có $400$ số là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Đếm hình chữ nhật và hình vuông trên lưới 8x8)
#ds([Xét bàn cờ ô vuông kích thước $8 times 8$ gồm $64$ ô vuông đơn vị kích thước $1 times 1$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số hình chữ nhật (kể cả hình vuông) tạo bởi các đường kẻ của bàn cờ là $1296$ hình.]),
    True([Số hình vuông kích thước $1 times 1$ trên bàn cờ là $64$ hình.]),
    True([Tổng số hình vuông thuộc mọi kích thước ($1 times 1, 2 times 2, ..., 8 times 8$) trên bàn cờ là $204$ hình vuông.]),
    [Số hình chữ nhật không phải là hình vuông trên bàn cờ là $1000$ hình.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số hình chữ nhật])
    $C_9^2 times C_9^2 = 36 times 36 = 1296$ hình. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Số hình vuông 1x1])
    Có đúng $8 times 8 = 64$ hình. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tổng số hình vuông mọi kích thước])
    Số hình vuông kích thước $k times k$ là $(9 - k)^2$.
    Tổng số hình vuông:
    $ sum_(k=1)^8 k^2 = 1^2 + 2^2 + ... + 8^2 = (8 times 9 times 17) / 6 = 204 text(" hình vuông") $. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số hình chữ nhật không phải hình vuông])
    Lấy tổng số hình chữ nhật trừ đi số hình vuông:
    $ 1296 - 204 = 1092 text(" hình") $ (chứ không phải $1000$).
    Khẳng định bằng $1000$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Lập số tự nhiên chia hết cho 9 từ tập S)
#ds([Cho tập hợp các chữ số $S = {0, 1, 2, 3, 4, 5, 6, 7}$. Lập các số tự nhiên có $4$ chữ số đôi một khác nhau chia hết cho $9$ từ tập $S$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng bốn chữ số của số cần tìm chỉ có thể bằng $9$ hoặc bằng $18$.]),
    True([Có đúng $3$ bộ bốn chữ số có tổng bằng $9$ là ${0, 1, 2, 6}$, ${0, 1, 3, 5}$, ${0, 2, 3, 4}$.]),
    True([Số các số chia hết cho $9$ có tổng các chữ số bằng $18$ là $42$ số.]),
    [Tổng số các số tự nhiên gồm $4$ chữ số đôi một khác nhau chia hết cho $9$ lập từ $S$ là $120$ số.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng các chữ số])
    Tổng nhỏ nhất là $0 + 1 + 2 + 3 = 6$, lớn nhất là $4 + 5 + 6 + 7 = 22$. Bội của 9 trong khoảng này là 9 và 18. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Các bộ có tổng bằng 9])
    Liệt kê đầy đủ: ${0, 1, 2, 6}$, ${0, 1, 3, 5}$, ${0, 2, 3, 4}$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Các số có tổng bằng 18])
    - Bộ ${0, 5, 6, 7}$: $3 times 3! = 18$ số.
    - Bộ ${1, 4, 6, 7}$: $4! = 24$ số.
    Tổng: $18 + 24 = 42$ số. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng số các số])
    Tổng số là: $54 + 42 = 96$ số (chứ không phải $120$).
    Khẳng định có $120$ số là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Từ các chữ số thuộc tập $S = {0, 1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau và chia hết cho $25$?],
    [320],
    loigiai: [
        #step([Tính tổng])
        Tận cùng 50: $120$ số.
        Tận cùng 25 hoặc 75: $200$ số.
        Tổng: $120 + 200 = 320$ số.
    ]
)

// TLN 2
#tln([Có bao nhiêu cách xếp $5$ cuốn sách Toán khác nhau, $4$ cuốn sách Vật lí khác nhau và $3$ cuốn sách Hóa học khác nhau thành một hàng ngang sao cho các cuốn sách cùng một môn luôn đứng cạnh nhau?],
    [103680],
    loigiai: [
        #step([Buộc khối])
        $ 5! times 4! times 3! times 3! = 120 times 24 times 6 times 6 = 103680 text(" cách") $
    ]
)

// TLN 3
#tln([Có bao nhiêu con đường ngắn nhất đi từ điểm $O(0, 0, 0)$ đến điểm $A(3, 3, 3)$ trên các cạnh của lưới lập phương đơn vị?],
    [1680],
    loigiai: [
        #step([Hoán vị lặp 3D])
        $ (9!) / (3! 3! 3!) = 1680 text(" con đường") $
    ]
)

// TLN 4
#tln([Từ các chữ số thuộc tập $S = {0, 1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau và chia hết cho $9$?],
    [96],
    loigiai: [
        #step([Tổng bằng 9 và 18])
        $ 54 + 42 = 96 text(" số") $
    ]
)

// TLN 5
#tln([Trên bàn cờ ô vuông kích thước $8 times 8$, có tất cả bao nhiêu hình vuông được tạo thành bởi các đường kẻ của bàn cờ?],
    [204],
    loigiai: [
        #step([Tổng bình phương])
        $ 1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2 + 7^2 + 8^2 = 204 text(" hình vuông") $
    ]
)

// TLN 6
#tln([Xếp ngẫu nhiên $6$ chữ số $1, 2, 3, 4, 5, 6$ thành hàng ngang. Có bao nhiêu cách xếp sao cho hai chữ số $1$ và $2$ đứng cách nhau ít nhất $2$ chữ số khác?],
    [288],
    loigiai: [
        #step([Phần bù])
        $ 720 - (240 + 192) = 288 text(" cách") $
    ]
)

] // end make-questions

#make-questions()
