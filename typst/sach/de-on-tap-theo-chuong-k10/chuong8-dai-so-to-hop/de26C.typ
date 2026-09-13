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
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP",
  exam-title: "BÀI 23: QUY TẮC ĐẾM (ĐỀ SỐ 26C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "175",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Từ các chữ số $0, 1, 2, 3, 4, 5, 6$, có thể lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau và chia hết cho $5$?],
    (
        True([$220$]),
        [$240$],
        [$180$],
        [$210$]
    ),
    loigiai: [
        *Phương pháp giải:* Số $overline(a b c d)$ chia hết cho 5 khi chữ số tận cùng $d in {0, 5}$. Do chữ số 0 có ràng buộc kép (vừa xét điều kiện chia hết ở đuôi, vừa không được đứng ở vị trí đầu $a != 0$), ta phân chia bài toán thành hai trường hợp: $d = 0$ và $d = 5$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (1.5, 0.7), fill: rgb("dbeafe"), stroke: 1pt + accent)
          content((0.75, 0.35), [$d = 0$])
          
          line((1.5, 0.35), (2.3, 0.35), mark: (end: "stealth"), stroke: 1pt + accent)
          content((3.8, 0.35), [$1 times 6 times 5 times 4 = 120$ số])
          
          rect((0, -1.1), (1.5, -0.4), fill: rgb("fef3c7"), stroke: 1pt + accent)
          content((0.75, -0.75), [$d = 5$])
          
          line((1.5, -0.75), (2.3, -0.75), mark: (end: "stealth"), stroke: 1pt + accent)
          content((3.8, -0.75), [$1 times 5 times 5 times 4 = 100$ số])
        })
        ]
        - #step([Trường hợp 1: Tận cùng d = 0])
          + Chọn $d = 0$: có $1$ cách chọn.
          + Chọn $a in {1, 2, 3, 4, 5, 6}$: có $6$ cách chọn.
          + Chọn $b in {1, 2, 3, 4, 5, 6} setminus {a}$: có $5$ cách chọn.
          + Chọn $c$: có $4$ cách chọn.
          Số lượng: $1 times 6 times 5 times 4 = 120$ số.
        - #step([Trường hợp 2: Tận cùng d = 5])
          + Chọn $d = 5$: có $1$ cách chọn.
          + Chọn $a in {1, 2, 3, 4, 6}$ (khác 0 và khác 5): có $5$ cách chọn.
          + Chọn $b in {0, 1, 2, 3, 4, 6} setminus {a}$: có $5$ cách chọn.
          + Chọn $c$: có $4$ cách chọn.
          Số lượng: $1 times 5 times 5 times 4 = 100$ số.
        Theo quy tắc cộng, tổng số các số chia hết cho 5 là:
        $ 120 + 100 = 220 text(" số") $
    ]
)

// TN 2
#tn([Có bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau mà luôn có mặt hai chữ số $1$ và $2$ đứng cạnh nhau?],
    (
        True([$308$]),
        [$336$],
        [$252$],
        [$280$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp buộc phần tử (Tie-up Method) kết hợp phân loại vị trí của chữ số 0 để tránh vi phạm $a != 0$.
        Buộc hai chữ số 1 và 2 thành một khối $[1 2]$ hoặc $[2 1]$ (có $2! = 2$ cách xếp trong khối).
        Ta xét hai trường hợp về sự có mặt của chữ số 0 trong 2 chữ số còn lại:
        - #step([Trường hợp 1: Không chứa chữ số 0])
          Hai chữ số còn lại được chọn từ 7 chữ số ${3, 4, 5, 6, 7, 8, 9}$: có $C_7^2 = 21$ cách chọn.
          Coi khối $[1 2]$ và 2 chữ số vừa chọn là $3$ phần tử.
          Số cách hoán vị 3 phần tử này là: $3! = 6$ cách.
          Số các số trong TH1 là: $21 times 2 times 6 = 252$ số.
        - #step([Trường hợp 2: Có chứa chữ số 0])
          Chữ số còn lại chọn từ 7 chữ số ${3, 4, ..., 9}$: có $7$ cách chọn.
          Xếp khối và chữ số còn lại vào vị trí đầu tiên (có 2 lựa chọn phần tử đứng đầu).
          Sau đó xếp 2 phần tử còn lại (kể cả số 0) có $2! = 2$ cách.
          Số các hoán vị mà số 0 không đứng đầu là: $2 times 2 = 4$ cách.
          Số các số trong TH2 là: $7 times 2 times 4 = 56$ số.
        Theo quy tắc cộng:
        $ 252 + 56 = 308 text(" số") $
    ]
)

// TN 3
#tn([Có bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau lấy từ tập ${1, 2, 3, 4, 5, 6}$ sao cho hai chữ số $1$ và $6$ không đứng cạnh nhau?],
    (
        True([$528$]),
        [$720$],
        [$192$],
        [$480$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp đếm bằng phần bù (Complementary Counting). Lấy tổng số các số có 5 chữ số phân biệt lập từ tập nguồn trừ đi số các số có hai chữ số 1 và 6 đứng kề nhau.
        - #step([Tổng số các số gồm 5 chữ số khác nhau])
          $ A_6^5 = 6 times 5 times 4 times 3 times 2 = 720 text(" số") $
        - #step([Đếm số các số có hai chữ số 1 và 6 đứng cạnh nhau])
          Buộc hai chữ số 1 và 6 thành một khối $[1 6]$ hoặc $[6 1]$: có $2$ cách.
          Chọn 3 chữ số còn lại từ 4 chữ số ${2, 3, 4, 5}$: có $C_4^3 = 4$ cách.
          Xếp khối và 3 chữ số (gồm 4 phần tử) vào hàng ngang: có $4! = 24$ cách.
          Số các số mà 1 và 6 đứng cạnh nhau:
          $ 2 times 4 times 24 = 192 text(" số") $
        - #step([Lấy phần bù])
          Số các số thỏa mãn yêu cầu bài toán:
          $ 720 - 192 = 528 text(" số") $
    ]
)

// TN 4
#tn([Cho tập hợp $S = {0, 1, 2, 3, 4, 5}$. Có bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau lấy từ $S$ và số đó chia hết cho $4$?],
    (
        True([$72$]),
        [$96$],
        [$60$],
        [$84$]
    ),
    loigiai: [
        Dấu hiệu chia hết cho 4: Hai chữ số tận cùng $overline(c d)$ tạo thành số chia hết cho 4.
        Các cặp $(c, d)$ với $c != d$ từ tập $S$:
        - #step([Nhóm 1: Có chứa chữ số 0])
          Gồm các cặp: $(0, 4), (2, 0), (4, 0)$ ($3$ cặp).
          Với mỗi cặp đã có số 0 ở đuôi, chữ số hàng nghìn $a != 0$ tự động thỏa mãn.
          $a$ có 4 cách chọn, $b$ có 3 cách chọn.
          Số lượng: $3 times (4 times 3) = 36$ số.
        - #step([Nhóm 2: Không chứa chữ số 0])
          Gồm các cặp: $(1, 2), (2, 4), (3, 2), (5, 2)$ ($4$ cặp).
          Với mỗi cặp, chữ số hàng nghìn $a != 0$ và $a != c, d$ nên có 3 cách chọn; chữ số hàng trăm $b$ có 3 cách chọn (được chọn số 0).
          Số lượng: $4 times (3 times 3) = 36$ số.
        Theo quy tắc cộng:
        $ 36 + 36 = 72 text(" số") $
    ]
)

// TN 5
#tn([Có bao nhiêu số tự nhiên gồm $4$ chữ số mà tổng các chữ số của nó là một số chẵn lập từ tập các chữ số ${1, 2, 3, 4, 5}$ (cho phép các chữ số lặp lại)?],
    (
        True([$312$]),
        [$313$],
        [$625$],
        [$300$]
    ),
    loigiai: [
        Gọi số cần tìm là $overline(a b c d)$ với $a, b, c, d in {1, 2, 3, 4, 5}$:
        Tập có 3 số lẻ ${1, 3, 5}$ và 2 số chẵn ${2, 4}$.
        - #step([Xét 3 chữ số đầu tiên a, b, c])
          Tổng số bộ $(a, b, c)$ có thể tạo ra là $5^3 = 125$ bộ.
          + Số bộ có tổng $a + b + c$ là số chẵn gồm: cả 3 số đều lẻ ($3^3 = 27$ bộ) hoặc đúng 1 số lẻ và 2 số chẵn ($C_3^1 times 3 times 2^2 = 36$ bộ). Tổng cộng có $27 + 36 = 63$ bộ có tổng chẵn.
          + Khi $a + b + c$ chẵn, để tổng 4 chữ số chẵn thì $d$ phải là số chẵn ($d in {2, 4}$, có $2$ cách chọn).
            Số lượng: $63 times 2 = 126$ số.
          + Số bộ có tổng $a + b + c$ là số lẻ là: $125 - 63 = 62$ bộ.
          + Khi $a + b + c$ lẻ, để tổng 4 chữ số chẵn thì $d$ phải là số lẻ ($d in {1, 3, 5}$, có $3$ cách chọn).
            Số lượng: $62 times 3 = 186$ số.
        Theo quy tắc cộng, tổng số các số thỏa mãn là:
        $ 126 + 186 = 312 text(" số") $
    ]
)

// TN 6
#tn([Có bao nhiêu số tự nhiên gồm $3$ chữ số đôi một khác nhau sao cho tích các chữ số của nó là một số chẵn, được lập từ tập ${1, 2, 3, 4, 5, 6, 7}$?],
    (
        True([$186$]),
        [$210$],
        [$24$],
        [$162$]
    ),
    loigiai: [
        Tích ba chữ số $a b c$ là số chẵn khi và chỉ khi có ít nhất một chữ số chẵn.
        Áp dụng phương pháp đếm bằng phần bù:
        - #step([Tổng số các số có 3 chữ số khác nhau])
          $ 7 times 6 times 5 = 210 text(" số") $
        - #step([Số các số có tích là số lẻ])
          Tích là số lẻ khi và chỉ khi cả 3 chữ số đều là số lẻ.
          Chọn 3 chữ số lẻ từ 4 chữ số lẻ ${1, 3, 5, 7}$:
          $ 4 times 3 times 2 = 24 text(" số") $
        - #step([Lấy phần bù])
          Số các số có tích là số chẵn là:
          $ 210 - 24 = 186 text(" số") $
    ]
)

// TN 7
#tn([Một nhóm gồm $5$ học sinh nam và $5$ học sinh nữ xếp thành một hàng dọc để vào lớp. Có bao nhiêu cách xếp hàng sao cho các bạn nam và nữ đứng xen kẽ nhau từng người một?],
    (
        True([$28800$]),
        [$14400$],
        [$3628800$],
        [$7200$]
    ),
    loigiai: [
        Có hai trường hợp về vị trí đầu hàng:
        - #step([Trường hợp 1: Nam đứng ở các vị trí lẻ])
          Vị trí $1, 3, 5, 7, 9$ dành cho nam: có $5! = 120$ cách xếp.
          Vị trí $2, 4, 6, 8, 10$ dành cho nữ: có $5! = 120$ cách xếp.
          Số cách xếp trong TH1 là: $120 times 120 = 14400$ cách.
        - #step([Trường hợp 2: Nữ đứng ở các vị trí lẻ])
          Vị trí lẻ dành cho nữ ($120$ cách), vị trí chẵn dành cho nam ($120$ cách).
          Số cách xếp trong TH2 là: $120 times 120 = 14400$ cách.
        Theo quy tắc cộng, tổng số cách xếp xen kẽ là:
        $ 14400 + 14400 = 28800 text(" cách") $
    ]
)

// TN 8
#tn([Có bao nhiêu cách xếp $4$ viên bi đỏ khác nhau và $4$ viên bi xanh khác nhau thành một hàng ngang sao cho không có hai viên bi đỏ nào đứng cạnh nhau?],
    (
        True([$2880$]),
        [$576$],
        [$1440$],
        [$40320$]
    ),
    loigiai: [
        Áp dụng phương pháp vách ngăn:
        - #step([Bước 1: Xếp 4 viên bi xanh trước])
          Xếp 4 viên bi xanh thành hàng ngang có:
          $ 4! = 24 text(" cách") $
        - #step([Bước 2: Tạo các vị trí trống giữa các viên bi xanh])
          Bốn viên bi xanh tạo ra 5 vị trí trống (ở hai đầu và giữa các viên xanh):
          #align(center)[#text(size: 11pt, font: "DejaVu Sans Mono")[[ ] X [ ] X [ ] X [ ] X [ ]]]
        - #step([Bước 3: Xếp 4 viên bi đỏ vào 5 vị trí trống])
          Mỗi vị trí trống chỉ được xếp tối đa 1 viên bi đỏ (để không có 2 viên đỏ cạnh nhau).
          Số cách chọn và xếp 4 viên bi đỏ vào 5 vị trí trống là:
          $ A_5^4 = 5 times 4 times 3 times 2 = 120 text(" cách") $
        Theo quy tắc nhân, tổng số cách xếp là:
        $ 24 times 120 = 2880 text(" cách") $
    ]
)

// TN 9
#tn([Cho một đa giác lồi có $10$ đỉnh. Có bao nhiêu tam giác có $3$ đỉnh là các đỉnh của đa giác nhưng không có cạnh nào là cạnh của đa giác đã cho?],
    (
        True([$50$]),
        [$60$],
        [$70$],
        [$40$]
    ),
    loigiai: [
        - #step([Tổng số tam giác tạo từ 10 đỉnh])
          $ C_10^3 = (10 times 9 times 8) / 6 = 120 text(" tam giác") $
        - #step([Số tam giác có đúng 2 cạnh là cạnh của đa giác])
          Đó là các tam giác tạo bởi 3 đỉnh liên tiếp của đa giác. Vì đa giác có 10 đỉnh nên có đúng $10$ tam giác loại này.
        - #step([Số tam giác có đúng 1 cạnh là cạnh của đa giác])
          Chọn 1 cạnh của đa giác: có $10$ cách chọn.
          Đỉnh thứ ba không được trùng với 2 đỉnh của cạnh đã chọn và không được là 2 đỉnh kề với cạnh đó (loại bỏ 4 đỉnh). Do đó còn $10 - 4 = 6$ đỉnh để chọn.
          Số tam giác loại này là: $10 times 6 = 60$ tam giác.
        - #step([Số tam giác không có cạnh nào của đa giác])
          $ 120 - 10 - 60 = 50 text(" tam giác") $
    ]
)

// TN 10
#tn([Có bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau mà chữ số đứng sau luôn lớn hơn chữ số đứng trước ($a < b < c < d < e$)?],
    (
        True([$126$]),
        [$252$],
        [$120$],
        [$84$]
    ),
    loigiai: [
        Vì $1 <= a < b < c < d < e <= 9$, cả 5 chữ số phải được chọn từ tập $9$ chữ số ${1, 2, 3, 4, 5, 6, 7, 8, 9}$ (chữ số $0$ không thể xuất hiện vì $a >= 1$).
        Với mỗi cách chọn 5 chữ số phân biệt từ 9 chữ số trên, chỉ có DUY NHẤT một cách sắp xếp theo thứ tự tăng dần.
        Số các số thỏa mãn là:
        $ C_9^5 = (9 times 8 times 7 times 6) / (4 times 3 times 2 times 1) = 126 text(" số") $
    ]
)

// TN 11
#tn([Trên một bàn cờ vua kích thước $8 times 8$ ô vuông, có bao nhiêu cách chọn ra $2$ ô vuông khác màu (gồm $1$ ô đen và $1$ ô trắng) sao cho hai ô này không cùng hàng và không cùng cột?],
    (
        True([$768$]),
        [$1024$],
        [$512$],
        [$896$]
    ),
    loigiai: [
        Bàn cờ vua có tổng cộng 64 ô gồm 32 ô trắng và 32 ô đen:
        - #step([Bước 1: Chọn 1 ô vuông màu trắng])
          Có $32$ cách chọn một ô trắng bất kỳ.
        - #step([Bước 2: Chọn 1 ô vuông màu đen không cùng hàng và không cùng cột])
          Trong cùng hàng với ô trắng đã chọn có 4 ô đen.
          Trong cùng cột với ô trắng đã chọn có 4 ô đen.
          Vì ô trắng không thể vừa cùng hàng vừa cùng cột với bất kỳ ô đen nào (do quy luật xen kẽ màu), các ô đen cùng hàng và cùng cột là hoàn toàn tách biệt.
          Số ô đen bị loại là: $4 + 4 = 8$ ô.
          Số ô đen hợp lệ còn lại để chọn là: $32 - 8 = 24$ ô.
        Theo quy tắc nhân, tổng số cách chọn là:
        $ 32 times 24 = 768 text(" cách") $
    ]
)

// TN 12
#tn([Có bao nhiêu số tự nhiên chẵn gồm $4$ chữ số đôi một khác nhau nhỏ hơn $3000$, được lập từ các chữ số thuộc tập ${0, 1, 2, 3, 4, 5}$?],
    (
        True([$60$]),
        [$72$],
        [$48$],
        [$80$]
    ),
    loigiai: [
        Số có dạng $overline(a b c d)$ với $a in {1, 2}$ (để số nhỏ hơn 3000) và $d in {0, 2, 4}$:
        - #step([Trường hợp 1: a = 1 (a là số lẻ)])
          + Chọn $a = 1$: có $1$ cách.
          + Chọn $d in {0, 2, 4}$: có $3$ cách chọn.
          + Chọn $b in {0, 1, 2, 3, 4, 5} setminus {a, d}$: có $4$ cách chọn.
          + Chọn $c$: có $3$ cách chọn.
          Số lượng trong TH1: $1 times 3 times 4 times 3 = 36$ số.
        - #step([Trường hợp 2: a = 2 (a là số chẵn)])
          + Chọn $a = 2$: có $1$ cách.
          + Chọn $d in {0, 4}$ (vì $d != a$): có $2$ cách chọn.
          + Chọn $b$: có $4$ cách chọn.
          + Chọn $c$: có $3$ cách chọn.
          Số lượng trong TH2: $1 times 2 times 4 times 3 = 24$ số.
        Theo quy tắc cộng, tổng số các số chẵn nhỏ hơn 3000 là:
        $ 36 + 24 = 60 text(" số") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Lập số tự nhiên từ {0, ..., 6} có CeTZ)
#ds([Cho tập hợp các chữ số $X = {0, 1, 2, 3, 4, 5, 6}$. Lập các số tự nhiên có $4$ chữ số đôi một khác nhau $overline(a b c d)$ từ tập $X$.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  // Minh họa 4 ô vị trí a, b, c, d
  rect((-3, -0.6), (-1.6, 0.6), stroke: 1.2pt + rgb("d97706"), fill: rgb("fef3c7"))
  content((-2.3, 0), [$a$ ($!= 0$)])
  
  rect((-1.4, -0.6), (0, 0.6), stroke: 1.2pt + rgb("d97706"), fill: rgb("fef3c7"))
  content((-0.7, 0), [$b$])
  
  rect((0.2, -0.6), (1.6, 0.6), stroke: 1.2pt + rgb("d97706"), fill: rgb("fef3c7"))
  content((0.9, 0), [$c$])
  
  rect((1.8, -0.6), (3.2, 0.6), stroke: 1.2pt + red, fill: rgb("fee2e2"))
  content((2.5, 0), [$d$ (đk chẵn/lẻ)])
  
  content((0, -1.2), [Sơ đồ phân tích công đoạn chọn các chữ số $overline(a b c d)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Có tất cả $720$ số tự nhiên gồm $4$ chữ số đôi một khác nhau lập từ tập $X$.]),
    True([Có $220$ số tự nhiên chia hết cho $5$.]),
    [Có đúng $300$ số tự nhiên chẵn gồm $4$ chữ số đôi một khác nhau.],
    True([Số các số tự nhiên lẻ gồm $4$ chữ số đôi một khác nhau là $300$ số.])
  ),
  loigiai: [
    #step([Xét ý a: Tổng số các số có 4 chữ số khác nhau])
    $a in X setminus {0}$ có $6$ cách, $b$ có $6$ cách, $c$ có $5$ cách, $d$ có $4$ cách.
    Số lượng: $6 times 6 times 5 times 4 = 720$ số. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Số chia hết cho 5])
    - Tận cùng bằng 0: $1 times 6 times 5 times 4 = 120$ số.
    - Tận cùng bằng 5: $1 times 5 times 5 times 4 = 100$ số.
    Tổng số: $120 + 100 = 220$ số. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Số tự nhiên chẵn])
    - Tận cùng bằng 0: $120$ số.
    - Tận cùng thuộc ${2, 4, 6}$ (3 cách): $a$ có 5 cách, $b$ có 5 cách, $c$ có 4 cách $=> 3 times (5 times 5 times 4) = 300$ số.
    Tổng số chẵn: $120 + 300 = 420$ số (chứ không phải $300$ số).
    Khẳng định có $300$ số chẵn là SAI. Mệnh đề c SAI.

    #step([Xét ý d: Số tự nhiên lẻ])
    Số các số lẻ là: $720 - 420 = 300$ số. Mệnh đề d ĐÚNG.
  ]
)

// DS 2 (Phương pháp buộc phần tử và vách ngăn)
#ds([Trên giá sách có $4$ cuốn sách Toán khác nhau và $3$ cuốn sách Ngữ văn khác nhau xếp thành một hàng ngang.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Có tất cả $5040$ cách xếp ngẫu nhiên $7$ cuốn sách lên giá.]),
    [Có $288$ cách xếp sao cho $3$ cuốn sách Ngữ văn luôn đứng cạnh nhau.],
    [Có $144$ cách xếp sao cho không có hai cuốn sách Ngữ văn nào đứng cạnh nhau.],
    True([Có đúng $720$ cách xếp sao cho $3$ cuốn sách Ngữ văn luôn đứng cạnh nhau.])
  ),
  loigiai: [
    #step([Xét ý a: Xếp tùy ý])
    Số hoán vị của 7 phần tử: $7! = 5040$ cách. Mệnh đề a ĐÚNG.

    #step([Xét ý b và d: 3 cuốn Ngữ văn luôn cạnh nhau])
    Buộc 3 cuốn Văn thành một khối $[V_1 V_2 V_3]$: trong khối có $3! = 6$ cách đổi chỗ.
    Xếp khối Văn và 4 cuốn Toán (gồm 5 phần tử) có: $5! = 120$ cách.
    Số cách xếp thỏa mãn: $6 times 120 = 720$ cách.
    Do đó khẳng định có $288$ cách là SAI (ý b SAI), khẳng định có $720$ cách là ĐÚNG (ý d ĐÚNG).

    #step([Xét ý c: Các cuốn Ngữ văn không cạnh nhau])
    Xếp 4 cuốn Toán trước: có $4! = 24$ cách.
    Bốn cuốn Toán tạo ra 5 vị trí trống.
    Xếp 3 cuốn Văn vào 5 vị trí trống: $A_5^3 = 5 times 4 times 3 = 60$ cách.
    Số cách xếp là: $24 times 60 = 1440$ cách (chứ không phải $144$ cách).
    Khẳng định có $144$ cách là SAI. Mệnh đề c SAI.
  ]
)

// DS 3 (Hình học tổ hợp trên đa giác đều)
#ds([Cho đa giác đều có $10$ đỉnh nội tiếp trong một đường tròn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số tam giác có $3$ đỉnh là các đỉnh của đa giác bằng $120$.]),
    True([Số tam giác có đúng $2$ cạnh là cạnh của đa giác bằng $10$.]),
    True([Số tam giác có đúng $1$ cạnh là cạnh của đa giác bằng $60$.]),
    [Số tam giác không có cạnh nào là cạnh của đa giác bằng $70$.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số tam giác])
    $C_10^3 = (10 times 9 times 8) / 6 = 120$ tam giác. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tam giác có 2 cạnh của đa giác])
    Gồm 3 đỉnh liên tiếp, có đúng $10$ tam giác. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tam giác có đúng 1 cạnh của đa giác])
    Chọn 1 cạnh (10 cách), đỉnh thứ ba có $10 - 4 = 6$ cách chọn.
    Số tam giác: $10 times 6 = 60$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tam giác không có cạnh nào của đa giác])
    Số tam giác là: $120 - 10 - 60 = 50$ tam giác (chứ không phải $70$).
    Khẳng định bằng $70$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Chọn ban đại biểu)
#ds([Một cơ quan có $12$ cán bộ gồm $7$ nam và $5$ nữ. Cần lập một đoàn công tác gồm đúng $4$ người.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Có tất cả $495$ cách chọn một đoàn công tác gồm $4$ người bất kỳ.]),
    True([Có $35$ cách chọn đoàn công tác chỉ toàn là nam.]),
    True([Có $5$ cách chọn đoàn công tác chỉ toàn là nữ.]),
    [Có $400$ cách chọn đoàn công tác sao cho trong đoàn có cả nam và nữ.]
  ),
  loigiai: [
    #step([Xét ý a: Chọn tùy ý 4 người])
    $C_12^4 = (12 times 11 times 10 times 9) / (4 times 3 times 2 times 1) = 495$ cách. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Đoàn toàn nam])
    Chọn 4 từ 7 nam: $C_7^4 = 35$ cách. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Đoàn toàn nữ])
    Chọn 4 từ 5 nữ: $C_5^4 = 5$ cách. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Có cả nam và nữ])
    Dùng phần bù: Lấy tổng số cách trừ đi số đoàn toàn nam và toàn nữ:
    $ 495 - (35 + 5) = 455 text(" cách") $ (chứ không phải $400$ cách).
    Khẳng định có $400$ cách là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số tự nhiên chẵn gồm 4 chữ số khác nhau từ 0 đến 6)
#tln([Từ các chữ số $0, 1, 2, 3, 4, 5, 6$, có thể lập được bao nhiêu số tự nhiên chẵn gồm $4$ chữ số đôi một khác nhau?],
    [420],
    loigiai: [
        #step([Xét trường hợp d = 0])
        $a$ có 6 cách, $b$ có 5 cách, $c$ có 4 cách: $1 times 6 times 5 times 4 = 120$ số.

        #step([Xét trường hợp d in {2, 4, 6}])
        $d$ có 3 cách, $a$ có 5 cách ($a != 0, a != d$), $b$ có 5 cách, $c$ có 4 cách: $3 times 5 times 5 times 4 = 300$ số.

        #step([Quy tắc cộng])
        $ 120 + 300 = 420 text(" số") $
    ]
)

// TLN 2 (Số tự nhiên chẵn nhỏ hơn 3000)
#tln([Có bao nhiêu số tự nhiên chẵn gồm $4$ chữ số đôi một khác nhau nhỏ hơn $3000$, được lập từ các chữ số thuộc tập ${0, 1, 2, 3, 4, 5}$?],
    [60],
    loigiai: [
        #step([TH1: a = 1])
        $d in {0, 2, 4}$ (3 cách), $b$ có 4 cách, $c$ có 3 cách: $1 times 3 times 4 times 3 = 36$ số.

        #step([TH2: a = 2])
        $d in {0, 4}$ (2 cách), $b$ có 4 cách, $c$ có 3 cách: $1 times 2 times 4 times 3 = 24$ số.

        #step([Tổng cộng])
        $ 36 + 24 = 60 text(" số") $
    ]
)

// TLN 3 (Xếp 5 nam 5 nữ xen kẽ)
#tln([Có bao nhiêu cách xếp $5$ học sinh nam và $5$ học sinh nữ thành một hàng dọc sao cho các bạn nam và nữ đứng xen kẽ nhau?],
    [28800],
    loigiai: [
        #step([Hai cấu hình xen kẽ])
        - Nam đứng đầu: $5! times 5! = 14400$ cách.
        - Nữ đứng đầu: $5! times 5! = 14400$ cách.

        #step([Tổng số cách])
        $ 14400 + 14400 = 28800 text(" cách") $
    ]
)

// TLN 4 (Chọn 2 ô cờ vua khác màu không cùng hàng, cột)
#tln([Trên bàn cờ vua $8 times 8$, có bao nhiêu cách chọn ra $2$ ô vuông khác màu sao cho chúng không cùng hàng và không cùng cột?],
    [768],
    loigiai: [
        #step([Chọn ô trắng])
        Có $32$ cách chọn 1 ô trắng.

        #step([Chọn ô đen])
        Bỏ đi 4 ô đen cùng hàng và 4 ô đen cùng cột, còn $32 - 8 = 24$ ô đen.

        #step([Quy tắc nhân])
        $ 32 times 24 = 768 text(" cách") $
    ]
)

// TLN 5 (Số chia hết cho 4 gồm 4 chữ số khác nhau)
#tln([Từ các chữ số $0, 1, 2, 3, 4, 5$, có thể lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau và chia hết cho $4$?],
    [72],
    loigiai: [
        #step([Hai chữ số tận cùng chia hết cho 4])
        - Có chữ số 0: $04, 20, 40$ (3 cặp) $=> 3 times (4 times 3) = 36$ số.
        - Không có số 0: $12, 24, 32, 52$ (4 cặp) $=> 4 times (3 times 3) = 36$ số.

        #step([Quy tắc cộng])
        $ 36 + 36 = 72 text(" số") $
    ]
)

// TLN 6 (Tam giác không có cạnh của đa giác đều 10 đỉnh)
#tln([Cho đa giác đều có $10$ đỉnh. Có bao nhiêu tam giác có $3$ đỉnh là các đỉnh của đa giác nhưng không có cạnh nào là cạnh của đa giác đã cho?],
    [50],
    loigiai: [
        #step([Dùng phần bù])
        - Tổng số tam giác: $C_10^3 = 120$.
        - Có 2 cạnh đa giác: $10$.
        - Có 1 cạnh đa giác: $10 times (10 - 4) = 60$.

        #step([Kết quả])
        $ 120 - 10 - 60 = 50 text(" tam giác") $
    ]
)

] // end make-questions

#make-questions()
