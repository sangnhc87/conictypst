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
  exam-title: "BÀI 24: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP (ĐỀ SỐ 27C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "178",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Từ các chữ số thuộc tập $X = {0, 1, 2, 3, 4, 5, 6}$, có thể lập được bao nhiêu số tự nhiên chẵn gồm $5$ chữ số đôi một khác nhau sao cho chữ số hàng nghìn luôn luôn là chữ số $1$?],
    (
        True([$204$]),
        [$240$],
        [$180$],
        [$216$]
    ),
    loigiai: [
        Số cần lập có dạng $overline(a 1 c d e)$ với $a != 0$, $a != 1$ và $e in {0, 2, 4, 6}$:
        - #step([Trường hợp 1: Tận cùng e = 0])
          + Chọn $e = 0$: có $1$ cách chọn.
          + Chữ số hàng chục nghìn $a in {2, 3, 4, 5, 6}$: có $5$ cách chọn.
          + Chữ số hàng trăm $c$: có $4$ cách chọn từ các chữ số còn lại.
          + Chữ số hàng chục $d$: có $3$ cách chọn.
          Số lượng trong TH1: $1 times 5 times 4 times 3 = 60$ số.
        - #step([Trường hợp 2: Tận cùng e in {2, 4, 6}])
          + Chọn $e$: có $3$ cách chọn.
          + Chữ số $a != 0$, $a != 1$, $a != e$: có $7 - 3 = 4$ cách chọn.
          + Chữ số $c$: có $4$ cách chọn (kể cả số 0).
          + Chữ số $d$: có $3$ cách chọn.
          Số lượng trong TH2: $3 times 4 times 4 times 3 = 144$ số.
        Theo quy tắc cộng, tổng số các số thỏa mãn là:
        $ 60 + 144 = 204 text(" số") $
    ]
)

// TN 2
#tn([Cho đa giác đều có $20$ đỉnh nội tiếp trong một đường tròn tâm $O$. Có bao nhiêu tam giác vuông không cân có $3$ đỉnh là các đỉnh của đa giác đều đã cho?],
    (
        True([$160$]),
        [$180$],
        [$20$],
        [$140$]
    ),
    loigiai: [
        *Phương pháp giải:* Tam giác nội tiếp là tam giác vuông khi và chỉ khi cạnh huyền của nó là một đường kính của đường tròn ngoại tiếp. Ta tính tổng số tam giác vuông tạo thành, sau đó trừ đi số tam giác vuông cân.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.8, stroke: 1pt + gray)
          circle((0, 0), radius: 0.08, fill: red)
          content((0.2, 0.2), [$O$], fill: red)
          
          // 20 đỉnh
          for i in range(20) {
            let a = i * 18deg
            let x = 1.8 * calc.cos(a)
            let y = 1.8 * calc.sin(a)
            circle((x, y), radius: 0.06, fill: accent)
          }
          // Đường kính A0 - A10 (trục ngang)
          line((-1.8, 0), (1.8, 0), stroke: 1.2pt + blue)
          // Đỉnh vuông không cân tại A3 (54°)
          let p3 = (1.8 * calc.cos(54deg), 1.8 * calc.sin(54deg))
          line((-1.8, 0), p3, (1.8, 0), close: true, stroke: 1.2pt + red, fill: rgb("fef3c7"))
          content((0, -2.1), [Tam giác vuông có cạnh huyền là đường kính])
        })
        ]
        Đa giác đều có 20 đỉnh nên có $20 / 2 = 10$ đường kính đi qua tâm $O$:
        - #step([Tính tổng số tam giác vuông])
          Mỗi đường kính kết hợp với 1 trong 18 đỉnh còn lại tạo thành một tam giác vuông nội tiếp đường tròn.
          Tổng số tam giác vuông là: $10 times 18 = 180$ tam giác.
        - #step([Tính số tam giác vuông cân])
          Tam giác vuông cân xảy ra khi đỉnh góc vuông nằm chính giữa cung nửa đường tròn xác định bởi đường kính đó.
          Ứng với mỗi đường kính, có đúng $2$ vị trí tạo thành tam giác vuông cân.
          Số tam giác vuông cân là: $10 times 2 = 20$ tam giác.
        - #step([Số tam giác vuông không cân])
          $ 180 - 20 = 160 text(" tam giác") $
    ]
)

// TN 3
#tn([Có bao nhiêu cách xếp $6$ bạn học sinh gồm $3$ nam và $3$ nữ ngồi quanh một bàn tròn có $6$ chiếc ghế sao cho các bạn nam và nữ ngồi xen kẽ nhau?],
    (
        True([$12$]),
        [$36$],
        [$72$],
        [$24$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp hoán vị vòng quanh (Circular Permutation) cho nhóm thứ nhất (nam) để cố định hệ quy chiếu bàn tròn, sau đó xếp nhóm thứ hai (nữ) vào các vị trí xen kẽ theo hoán vị thông thường.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1.5pt + gray)
          content((0, 0), [BÀN TRÒN])
          for i in range(3) {
            let a_nam = i * 120deg
            let xn = 1.9 * calc.cos(a_nam)
            let yn = 1.9 * calc.sin(a_nam)
            rect((xn - 0.35, yn - 0.25), (xn + 0.35, yn + 0.25), fill: rgb("dbeafe"), stroke: 1pt + blue)
            content((xn, yn), [Nam])
            
            let a_nu = i * 120deg + 60deg
            let xu = 1.9 * calc.cos(a_nu)
            let yu = 1.9 * calc.sin(a_nu)
            circle((xu, yu), radius: 0.3, fill: rgb("fee2e2"), stroke: 1pt + red)
            content((xu, yu), [Nữ])
          }
        })
        ]
        - #step([Xếp 3 bạn nam vào bàn tròn trước])
          Số cách xếp 3 bạn nam ngồi quanh bàn tròn là số hoán vị vòng quanh:
          $ (3 - 1)! = 2! = 2 text(" cách") $
        - #step([Xếp 3 bạn nữ vào 3 vị trí xen kẽ])
          Sau khi 3 bạn nam đã ngồi cố định, giữa họ tạo ra đúng 3 vị trí trống phân biệt.
          Số cách xếp 3 bạn nữ vào 3 vị trí này là hoán vị thông thường:
          $ 3! = 6 text(" cách") $
        Theo quy tắc nhân, tổng số cách xếp là:
        $ 2 times 6 = 12 text(" cách") $
    ]
)

// TN 4
#tn([Một nhóm gồm $9$ bạn học sinh (trong đó có hai bạn An và Bình). Có bao nhiêu cách xếp $9$ bạn này thành một hàng ngang sao cho giữa An và Bình có đúng $2$ bạn học sinh khác?],
    (
        True([$60480$]),
        [$30240$],
        [$120960$],
        [$720$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp buộc phần tử (Block Method). Xây dựng khối cố định gồm 4 bạn $[text("An") - X_1 - X_2 - text("Bình")]$, sau đó coi khối này như một phần tử lớn xếp cùng với các bạn còn lại.
        - #step([Chọn 2 bạn đứng giữa An và Bình])
          Chọn có thứ tự 2 bạn từ 7 bạn còn lại:
          $ A_7^2 = 7 times 6 = 42 text(" cách") $
        - #step([Đổi chỗ giữa An và Bình])
          An và Bình ở hai đầu khối có thể đổi chỗ cho nhau: $2! = 2$ cách.
        - #step([Xếp khối cùng các bạn còn lại])
          Xem khối $[text("An") - X_1 - X_2 - text("Bình")]$ là một phần tử duy nhất.
          Cùng với $9 - 4 = 5$ bạn còn lại, ta có tất cả $6$ phần tử cần xếp vào hàng ngang:
          $ 6! = 720 text(" cách") $
        Theo quy tắc nhân, tổng số cách xếp là:
        $ 42 times 2 times 720 = 60480 text(" cách") $
    ]
)

// TN 5
#tn([Có bao nhiêu số tự nhiên gồm $6$ chữ số đôi một khác nhau lấy từ tập ${1, 2, 3, 4, 5, 6, 7}$ sao cho các chữ số chẵn luôn đứng cạnh nhau?],
    (
        True([$1296$]),
        [$720$],
        [$576$],
        [$1440$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân loại các trường hợp về số lượng chữ số chẵn xuất hiện trong số có 6 chữ số (gồm 3 chẵn hoặc đúng 2 chẵn), sau đó áp dụng phương pháp buộc các chữ số chẵn thành một khối duy nhất.
        Tập có 3 chữ số chẵn ${2, 4, 6}$ và 4 chữ số lẻ ${1, 3, 5, 7}$.
        - #step([Trường hợp 1: Chứa cả 3 chữ số chẵn và 3 chữ số lẻ])
          + Buộc 3 chữ số chẵn thành một khối: có $3! = 6$ cách xếp nội bộ.
          + Chọn 3 chữ số lẻ từ 4 chữ số lẻ: có $C_4^3 = 4$ cách.
          + Xếp khối chẵn và 3 chữ số lẻ (gồm 4 phần tử): có $4! = 24$ cách.
          Số lượng trong TH1: $6 times 4 times 24 = 576$ số.
        - #step([Trường hợp 2: Chứa đúng 2 chữ số chẵn và cả 4 chữ số lẻ])
          + Chọn 2 chữ số chẵn từ 3 chữ số chẵn: có $C_3^2 = 3$ cách.
          + Buộc 2 chữ số chẵn lại: có $2! = 2$ cách đổi chỗ.
          + Lấy cả 4 chữ số lẻ. Xếp khối 2 chẵn cùng 4 chữ số lẻ (gồm 5 phần tử): có $5! = 120$ cách.
          Số lượng trong TH2: $3 times 2 times 120 = 720$ số.
        Theo quy tắc cộng:
        $ 576 + 720 = 1296 text(" số") $
    ]
)

// TN 6
#tn([Có bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau $overline(a b c d)$ sao cho $a < b$ và $c > d$?],
    (
        True([$1008$]),
        [$1260$],
        [$840$],
        [$1512$]
    ),
    loigiai: [
        Xét hai cặp chữ số $(a, b)$ và $(c, d)$:
        - #step([Chọn 2 chữ số cho cặp (a, b)])
          Vì $a < b$ và $a != 0$ nên chữ số $0$ không thể xuất hiện trong cặp $(a, b)$.
          Hai chữ số $a, b$ phải được chọn từ 9 chữ số ${1, 2, ..., 9}$:
          Có $C_9^2 = (9 times 8) / 2 = 36$ cách chọn (mỗi cách chọn chỉ có 1 thứ tự $a < b$).
        - #step([Chọn 2 chữ số cho cặp (c, d)])
          Hai chữ số $c, d$ được chọn từ 8 chữ số còn lại (kể cả số 0):
          Có $C_8^2 = (8 times 7) / 2 = 28$ cách chọn (mỗi cách chọn chỉ có 1 thứ tự $c > d$).
        Theo quy tắc nhân, tổng số các số thỏa mãn là:
        $ 36 times 28 = 1008 text(" số") $
    ]
)

// TN 7
#tn([Trong mặt phẳng cho $10$ đường thẳng phân biệt và $6$ đường tròn phân biệt sao cho không có hai đường thẳng nào song song, không có ba đường thẳng nào đồng quy, không có hai đường tròn nào tiếp xúc nhau và đường thẳng không tiếp xúc đường tròn. Số giao điểm tối đa của hệ đường này bằng],
    (
        True([$195$]),
        [$250$],
        [$180$],
        [$210$]
    ),
    loigiai: [
        Tổng số giao điểm tối đa gồm ba thành phần:
        - #step([Giao điểm giữa hai đường thẳng])
          Mỗi cặp 2 đường thẳng cắt nhau tại tối đa 1 điểm:
          $ C_10^2 times 1 = (10 times 9) / 2 = 45 text(" điểm") $
        - #step([Giao điểm giữa hai đường tròn])
          Mỗi cặp 2 đường tròn cắt nhau tại tối đa 2 điểm:
          $ C_6^2 times 2 = 15 times 2 = 30 text(" điểm") $
        - #step([Giao điểm giữa một đường thẳng và một đường tròn])
          Mỗi cặp gồm 1 đường thẳng và 1 đường tròn cắt nhau tại tối đa 2 điểm:
          $ 10 times 6 times 2 = 120 text(" điểm") $
        Tổng số giao điểm tối đa là:
        $ 45 + 30 + 120 = 195 text(" điểm") $
    ]
)

// TN 8
#tn([Tìm số nguyên dương $n$ thỏa mãn phương trình $C_(n + 1)^2 + 2 C_(n + 2)^2 + 2 C_(n + 3)^2 + C_(n + 4)^2 = 149$.],
    (
        True([$n = 5$]),
        [$n = 6$],
        [$n = 4$],
        [$n = 7$]
    ),
    loigiai: [
        Đặt $x = n + 1$ ($x >= 2$). Áp dụng công thức $C_k^2 = (k(k - 1)) / 2$:
        $ (x(x - 1)) / 2 + 2 ((x + 1)x) / 2 + 2 ((x + 2)(x + 1)) / 2 + ((x + 3)(x + 2)) / 2 = 149 $
        Nhân hai vế với 2:
        $ x(x - 1) + 2x(x + 1) + 2(x + 1)(x + 2) + (x + 2)(x + 3) = 298 $
        Khai triển và thu gọn:
        $ (x^2 - x) + (2x^2 + 2x) + (2x^2 + 6x + 4) + (x^2 + 5x + 6) = 298 $
        $ <=> 6x^2 + 12x + 10 = 298 <=> 6x^2 + 12x - 288 = 0 $
        $ <=> x^2 + 2x - 48 = 0 <=> (x - 6)(x + 8) = 0 $
        Vì $x > 0$ nên $x = 6 => n + 1 = 6 => n = 5$.
    ]
)

// TN 9
#tn([Trên một giá sách có $10$ cuốn sách khác nhau xếp thành một hàng ngang. Hỏi có bao nhiêu cách chọn ra $3$ cuốn sách sao cho không có hai cuốn sách nào đứng cạnh nhau trên giá?],
    (
        True([$56$]),
        [$120$],
        [$84$],
        [$72$]
    ),
    loigiai: [
        Áp dụng bài toán chọn $k$ phần tử không có 2 phần tử liên tiếp từ $n$ phần tử xếp thành hàng:
        Số cách chọn là:
        $ C_(n - k + 1)^k = C_(10 - 3 + 1)^3 = C_8^3 = (8 times 7 times 6) / (3 times 2 times 1) = 56 text(" cách") $
    ]
)

// TN 10
#tn([Từ các chữ số thuộc tập $A = {0, 1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên chẵn gồm $5$ chữ số đôi một khác nhau sao cho chữ số đầu tiên luôn luôn là một chữ số lẻ?],
    (
        True([$1920$]),
        [$2400$],
        [$1440$],
        [$960$]
    ),
    loigiai: [
        Số có dạng $overline(a b c d e)$ với $a in {1, 3, 5, 7}$ và $e in {0, 2, 4, 6}$:
        - #step([Chọn chữ số đầu tiên a]) Có $4$ cách chọn từ tập số lẻ.
        - #step([Chọn chữ số tận cùng e]) Có $4$ cách chọn từ tập số chẵn (vì $a$ là số lẻ nên không trùng với bất kỳ số chẵn nào).
        - #step([Chọn và xếp 3 chữ số giữa b, c, d])
          Sau khi chọn $a$ và $e$, còn lại $8 - 2 = 6$ chữ số.
          Chọn và sắp xếp 3 chữ số vào 3 vị trí giữa:
          $ A_6^3 = 6 times 5 times 4 = 120 text(" cách") $
        Theo quy tắc nhân:
        $ 4 times 4 times 120 = 1920 text(" số") $
    ]
)

// TN 11
#tn([Có bao nhiêu cách chia $12$ chiếc bút chì giống hệt nhau cho $3$ bạn học sinh An, Bình, Chi sao cho mỗi bạn đều nhận được ít nhất một chiếc bút?],
    (
        True([$55$]),
        [$66$],
        [$78$],
        [$45$]
    ),
    loigiai: [
        Đây là bài toán chia kẹo Euler (phương pháp vách ngăn):
        Xếp 12 chiếc bút chì thành hàng ngang, giữa chúng có $12 - 1 = 11$ khoảng trống.
        Đặt 2 vách ngăn vào 11 khoảng trống để chia thành 3 phần cho 3 bạn (mỗi phần ít nhất 1 chiếc):
        $ C_(12 - 1)^(3 - 1) = C_11^2 = (11 times 10) / 2 = 55 text(" cách") $
    ]
)

// TN 12
#tn([Có bao nhiêu số tự nhiên gồm $6$ chữ số đôi một khác nhau, trong đó luôn có mặt ba chữ số $0, 1, 2$ và chữ số $1$ luôn đứng giữa hai chữ số $0$ và $2$ (không nhất thiết phải đứng cạnh nhau)?],
    (
        True([$6300$]),
        [$7200$],
        [$5400$],
        [$8100$]
    ),
    loigiai: [
        - #step([Chọn 3 chữ số còn lại])
          Lấy 3 chữ số từ 7 chữ số ${3, 4, 5, 6, 7, 8, 9}$: có $C_7^3 = 35$ cách chọn.
        - #step([Xếp vị trí cho bộ ba 0, 1, 2])
          Một số có 6 vị trí từ 1 đến 6. Chọn 3 vị trí trong 6 vị trí:
          + Nếu theo thứ tự $0 ... 1 ... 2$: Vì chữ số $0$ không đứng ở vị trí 1, ba vị trí phải chọn từ 5 vị trí ${2, 3, 4, 5, 6}$: có $C_5^3 = 10$ cách.
          + Nếu theo thứ tự $2 ... 1 ... 0$: Vị trí của số 2 có thể là vị trí 1, do đó có $C_6^3 = 20$ cách chọn 3 vị trí.
          Tổng số cách xếp bộ ba $(0, 1, 2)$ thỏa mãn là: $10 + 20 = 30$ cách.
        - #step([Xếp 3 chữ số còn lại])
          Ba chữ số còn lại xếp vào 3 vị trí trống: có $3! = 6$ cách.
        Theo quy tắc nhân, tổng số các số thỏa mãn là:
        $ 35 times 30 times 6 = 6300 text(" số") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đa giác đều 20 đỉnh có CeTZ)
#ds([Cho đa giác đều $H$ gồm $20$ đỉnh nội tiếp trong đường tròn tâm $O$.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.8, stroke: 1.2pt + rgb("d97706"))
  
  // Vẽ một số đỉnh của đa giác đều 20 đỉnh
  for i in range(20) {
    let angle = i * 18deg
    let pt = (1.8 * calc.cos(angle), 1.8 * calc.sin(angle))
    circle(pt, radius: 0.05, fill: rgb("d97706"))
  }
  
  // Vẽ đường kính và tam giác vuông
  line((-1.8, 0), (1.8, 0), stroke: 1pt + blue)
  line((-1.8, 0), (0.55, 1.71), stroke: 1pt + red)
  line((1.8, 0), (0.55, 1.71), stroke: 1pt + red)
  content((0, -2.2), [Minh họa tam giác vuông nội tiếp chắn đường kính])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số tam giác có $3$ đỉnh là các đỉnh của đa giác đều $H$ bằng $1140$.]),
    True([Số tam giác vuông có $3$ đỉnh là các đỉnh của đa giác đều $H$ bằng $180$.]),
    True([Số tam giác vuông cân có $3$ đỉnh là các đỉnh của đa giác đều $H$ bằng $20$.]),
    [Số tam giác tù có $3$ đỉnh là các đỉnh của đa giác đều $H$ bằng $600$.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số tam giác])
    $ C_20^3 = (20 times 19 times 18) / 6 = 1140 text(" tam giác") $. Mệnh đề a ĐÚNG.

    #step([Xét ý b và c: Tam giác vuông và vuông cân])
    Có 10 đường kính. Mỗi đường kính tạo ra 18 tam giác vuông $=> 10 times 18 = 180$ tam giác vuông.
    Có 2 đỉnh đối xứng qua đường kính vuông góc tạo ra tam giác vuông cân $=> 10 times 2 = 20$ tam giác vuông cân. Mệnh đề b và c ĐÚNG.

    #step([Xét ý d: Số tam giác tù])
    Chọn 1 đỉnh làm đỉnh tù (có 20 cách).
    Hai đỉnh còn lại phải cùng nằm trên nửa đường tròn hở (gồm $20 / 2 - 1 = 9$ đỉnh liên tiếp).
    Số cách chọn 2 đỉnh là $C_9^2 = 36$.
    Tổng số tam giác tù là: $20 times 36 = 720$ tam giác (chứ không phải $600$).
    Khẳng định bằng $600$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Chọn sách không cạnh nhau trên giá)
#ds([Trên một giá sách có $10$ cuốn sách khác nhau xếp thành một hàng ngang.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Có $120$ cách chọn ra $3$ cuốn sách bất kỳ từ $10$ cuốn sách.]),
    True([Số cách chọn ra $3$ cuốn sách liên tiếp trên giá sách bằng $8$.]),
    True([Số cách chọn ra $3$ cuốn sách sao cho có đúng hai cuốn sách đứng cạnh nhau bằng $56$.]),
    [Số cách chọn ra $3$ cuốn sách sao cho không có hai cuốn sách nào đứng cạnh nhau bằng $80$.]
  ),
  loigiai: [
    #step([Xét ý a: Chọn 3 cuốn tùy ý])
    $ C_10^3 = 120 text(" cách") $. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Chọn 3 cuốn liên tiếp])
    Các bộ 3 cuốn liên tiếp có dạng $(i, i+1, i+2)$ với $1 <= i <= 8$, có đúng $8$ cách. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Đúng hai cuốn cạnh nhau])
    Có 9 cặp liên tiếp $(i, i+1)$.
    - Nếu cặp ở đầu mút (2 cặp): cuốn thứ 3 có 7 cách chọn $=> 2 times 7 = 14$ cách.
    - Nếu cặp ở giữa (7 cặp): cuốn thứ 3 có 6 cách chọn $=> 7 times 6 = 42$ cách.
    Tổng số: $14 + 42 = 56$ cách. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Không có 2 cuốn nào cạnh nhau])
    Số cách là: $120 - 8 - 56 = 56$ cách (hoặc theo công thức $C_8^3 = 56$ cách chứ không phải $80$).
    Khẳng định bằng $80$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Giao điểm hệ đường thẳng và đường tròn)
#ds([Trong mặt phẳng cho $10$ đường thẳng phân biệt và $6$ đường tròn phân biệt (thỏa mãn không song song, không đồng quy, không tiếp xúc).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số giao điểm tối đa giữa các đường thẳng với nhau bằng $45$.]),
    True([Số giao điểm tối đa giữa các đường tròn với nhau bằng $30$.]),
    True([Số giao điểm tối đa giữa đường thẳng và đường tròn bằng $120$.]),
    [Tổng số giao điểm tối đa của hệ đường thẳng và đường tròn đã cho bằng $250$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Số giao điểm từng loại])
    - Đường thẳng với nhau: $C_10^2 times 1 = 45$.
    - Đường tròn với nhau: $C_6^2 times 2 = 30$.
    - Đường thẳng và đường tròn: $10 times 6 times 2 = 120$.
    Các mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Tổng số giao điểm tối đa])
    Tổng số giao điểm là:
    $ 45 + 30 + 120 = 195 text(" điểm") $ (chứ không phải $250$).
    Khẳng định bằng $250$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Bài toán chia kẹo Euler)
#ds([Có $12$ chiếc bút bi giống nhau chia cho $3$ bạn học sinh An, Bình, Chi.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu mỗi bạn nhận được ít nhất $1$ chiếc bút bi, số cách chia bằng $55$ cách.]),
    True([Nếu mỗi bạn nhận được ít nhất $2$ chiếc bút bi, số cách chia bằng $28$ cách.]),
    True([Số cách chia tùy ý (có bạn có thể không nhận được chiếc bút nào) bằng $91$ cách.]),
    [Nếu bạn An nhận được ít nhất $4$ chiếc bút bi, số cách chia là $50$ cách.]
  ),
  loigiai: [
    #step([Xét ý a: Mỗi bạn ít nhất 1 bút])
    $ C_(12 - 1)^(3 - 1) = C_11^2 = 55 text(" cách") $. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Mỗi bạn ít nhất 2 bút])
    Chia trước cho mỗi bạn 1 bút, còn $12 - 3 = 9$ bút chia cho 3 bạn sao cho mỗi bạn ít nhất 1 bút:
    $ C_(9 - 1)^(3 - 1) = C_8^2 = 28 text(" cách") $. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Chia tùy ý])
    Áp dụng công thức chia tùy ý $C_(n + k - 1)^(k - 1)$:
    $ C_(12 + 3 - 1)^(3 - 1) = C_14^2 = (14 times 13) / 2 = 91 text(" cách") $. Mệnh đề c ĐÚNG.

    #step([Xét ý d: An nhận ít nhất 4 bút])
    Cho An trước 3 bút, còn lại 9 bút chia cho 3 bạn mỗi bạn ít nhất 1 bút:
    $ C_8^2 = 28 text(" cách") $ (chứ không phải $50$ cách).
    Khẳng định bằng $50$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tam giác vuông không cân)
#tln([Cho đa giác đều có $20$ đỉnh nội tiếp trong đường tròn. Có bao nhiêu tam giác vuông không cân có $3$ đỉnh là các đỉnh của đa giác đều đã cho?],
    [160],
    loigiai: [
        #step([Lấy hiệu số])
        Tổng số tam giác vuông: $10 times 18 = 180$.
        Số tam giác vuông cân: $10 times 2 = 20$.
        Kết quả: $180 - 20 = 160$ tam giác.
    ]
)

// TLN 2 (Xếp bàn tròn xen kẽ)
#tln([Có bao nhiêu cách xếp $3$ bạn nam và $3$ bạn nữ ngồi quanh một bàn tròn có $6$ chiếc ghế sao cho các bạn nam và nữ ngồi xen kẽ nhau?],
    [12],
    loigiai: [
        #step([Hoán vị vòng quanh])
        Xếp nam: $(3 - 1)! = 2$ cách.
        Xếp nữ: $3! = 6$ cách.
        Tổng số: $2 times 6 = 12$ cách.
    ]
)

// TLN 3 (Xếp hàng có 2 bạn xen giữa)
#tln([Một nhóm gồm $9$ bạn học sinh (trong đó có An và Bình) xếp thành hàng ngang. Có bao nhiêu cách xếp sao cho giữa An và Bình có đúng $2$ bạn học sinh khác?],
    [60480],
    loigiai: [
        #step([Quy tắc nhân])
        $ A_7^2 times 2! times 6! = 42 times 2 times 720 = 60480 text(" cách") $
    ]
)

// TLN 4 (Giao điểm tối đa)
#tln([Trong mặt phẳng cho $10$ đường thẳng và $6$ đường tròn phân biệt (không song song, không đồng quy, không tiếp xúc). Số giao điểm tối đa của hệ đường này bằng bao nhiêu?],
    [195],
    loigiai: [
        #step([Tổng 3 loại giao điểm])
        $ C_10^2 times 1 + C_6^2 times 2 + 10 times 6 times 2 = 45 + 30 + 120 = 195 text(" điểm") $
    ]
)

// TLN 5 (Nghiệm phương trình)
#tln([Tìm số nguyên dương $n$ thỏa mãn phương trình $C_(n + 1)^2 + 2 C_(n + 2)^2 + 2 C_(n + 3)^2 + C_(n + 4)^2 = 149$.],
    [5],
    loigiai: [
        #step([Giải phương trình])
        Rút gọn được $x^2 + 2x - 48 = 0 => x = 6 => n = 5$.
    ]
)

// TLN 6 (Chọn 3 cuốn không cạnh nhau)
#tln([Trên một giá sách có $10$ cuốn sách khác nhau xếp thành hàng ngang. Có bao nhiêu cách chọn ra $3$ cuốn sách sao cho không có hai cuốn sách nào đứng cạnh nhau trên giá?],
    [56],
    loigiai: [
        #step([Công thức])
        $ C_(10 - 3 + 1)^3 = C_8^3 = 56 text(" cách") $
    ]
)

] // end make-questions

#make-questions()
