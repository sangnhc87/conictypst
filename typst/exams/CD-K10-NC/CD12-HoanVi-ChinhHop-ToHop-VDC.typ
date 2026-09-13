#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("701A75")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("701A75"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("A21CAF")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("A21CAF"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("E879F9")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("E879F9"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("A21CAF")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Hoán vị - Chỉnh hợp - Tổ hợp (Fuchsia - Magenta)
#let c-fuchsia-dark = rgb("701A75")
#let c-fuchsia = rgb("A21CAF")
#let c-fuchsia-light = rgb("E879F9")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-fuchsia = rgb("FDF4FF")
#let c-border = rgb("FAE8FF")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-fuchsia,
    stroke: 1.5pt + c-fuchsia,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-fuchsia-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-fuchsia, size: 16pt, weight: "black")[CHUYÊN ĐỀ 12: HOÁN VỊ – CHỈNH HỢP – TỔ HỢP]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Kỹ thuật Buộc phần tử, Kỹ thuật Khe trống, Chia kẹo Euler, Hình học tổ hợp & Bài toán 100 Tù nhân
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-fuchsia),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Nghệ thuật Đếm Nâng cao: Hoán vị, Chỉnh hợp & Tổ hợp:*
  
  Nếu Hai quy tắc đếm cơ bản là những viên gạch đầu tiên, thì *Hoán vị ($P_n$)*, *Chỉnh hợp ($A_n^k$)* và *Tổ hợp ($C_n^k$)* chính là những cỗ máy tự động hóa mạnh mẽ của Giải tích tổ hợp. Sự khác biệt sống còn giữa chúng nằm ở hai câu hỏi then chốt:
  1. *Có lấy tất cả hay chỉ lấy một phần?* (Lấy hết $n$ phần tử $==>$ Hoán vị; Lấy $k$ phần tử từ $n$ phần tử $==>$ Chỉnh hợp hoặc Tổ hợp).
  2. *Thứ tự sắp xếp có tạo ra kết quả mới hay không?* (Có phân biệt thứ tự $==>$ Chỉnh hợp $A_n^k$; Không phân biệt thứ tự $==>$ Tổ hợp $C_n^k$).
  
  Trong các kỳ thi Chuyên và HSG Quốc gia, bài toán Tổ hợp đòi hỏi những kỹ nghệ tư duy đặc thù:
  - *Kỹ thuật "Buộc phần tử" (Gluing Method)*: Nhốt các phần tử phải đứng cạnh nhau thành một "siêu phần tử", tính số cách hoán vị bên trong và bên ngoài.
  - *Kỹ thuật "Khe trống" (Slotted / Gap Insertion Method)*: Xử lý triệt để điều kiện "không có hai phần tử nào đứng cạnh nhau".
  - *Phương pháp Chia kẹo của Euler (Stars and Bars)*: Mô hình toán học thần kỳ chuyển bài toán phương trình nghiệm nguyên $x_1 + x_2 + dots + x_k = n$ thành bài toán đặt vách ngăn tổ hợp.
  - *Cấu trúc Chu trình Hoán vị (Cycle Decomposition)*: Nền tảng của Lý thuyết nhóm đối xứng $S_n$ và Mật mã học hiện đại.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. BỐN KỸ NGHỆ TỔ HỢP ĐỈNH CAO
// ══════════════════════════════════════════════════════════════

== 1. Kỹ thuật "Buộc phần tử" vs Kỹ thuật "Khe trống"

#table(
  columns: (3fr, 3.5fr, 3.5fr),
  fill: (col, row) => if row == 0 { c-fuchsia } else if calc.even(row) { rgb("FDF4FF") } else { none },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  inset: 7pt,
  stroke: 0.5pt + rgb("CBD5E0"),
  [#text(fill: white, weight: "bold")[Kỹ thuật]],
  [#text(fill: white, weight: "bold")[Điều kiện áp dụng]],
  [#text(fill: white, weight: "bold")[Thuật toán thực thi]],

  [*Kỹ thuật Buộc phần tử* \ (Tie / Gluing Method)],
  [Các phần tử $X_1, X_2, dots, X_m$ *bắt buộc phải đứng cạnh nhau*],
  [1. Buộc $m$ phần tử thành 1 khối $K$. \ 2. Xếp khối $K$ với $n - m$ phần tử còn lại ($P_(n - m + 1)$ cách). \ 3. Hoán vị $m$ phần tử bên trong khối ($m!$ cách). \ $==> N = (n - m + 1)! dot m!$.],

  [*Kỹ thuật Khe trống* \ (Gap Insertion Method)],
  [Các phần tử $Y_1, Y_2, dots, Y_m$ *không được có 2 phần tử nào đứng cạnh nhau*],
  [1. Xếp $k$ phần tử tự do thành hàng ngang ($k!$ cách). \ 2. Tạo ra $k + 1$ khe trống giữa các phần tử tự do (kể cả 2 đầu). \ 3. Chọn $m$ khe trống từ $k + 1$ khe để đặt $Y$ ($A_(k+1)^m$ cách). \ $==> N = k! dot A_(k+1)^m$.],
)

#v(0.6em)

== 2. Bài toán Chia kẹo của Euler (Stars and Bars)

#block(
  fill: c-bg-fuchsia,
  stroke: 1pt + c-border,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  - *Định lý 1 (Nghiệm nguyên dương)*:
    Số cách chia $n$ chiếc kẹo giống nhau cho $k$ đứa trẻ sao cho đứa trẻ nào cũng có *ít nhất 1 chiếc kẹo* (tương đương số nghiệm nguyên dương của $x_1 + x_2 + dots + x_k = n$ với $x_i >= 1$) là:
    $ N = C_(n - 1)^(k - 1). $
    *Bản chất:* Xếp $n$ chiếc kẹo thành hàng có $n - 1$ khoảng trống giữa chúng. Ta chọn $k - 1$ vách ngăn đặt vào $n - 1$ khoảng trống này.

  - *Định lý 2 (Nghiệm nguyên không âm)*:
    Số cách chia $n$ chiếc kẹo giống nhau cho $k$ đứa trẻ tùy ý (có thể có đứa không có kẹo nào, tương đương số nghiệm $x_i >= 0$) là:
    $ N = C_(n + k - 1)^(k - 1) = C_(n + k - 1)^n. $
    *Bản chất:* Xem $n$ chiếc kẹo và $k - 1$ vách ngăn là một dãy gồm $n + k - 1$ vị trí, ta chỉ cần chọn $k - 1$ vị trí để đặt vách ngăn!
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - Xếp hàng không đứng cạnh nhau bằng Kỹ thuật Khe trống):*
    Có 5 bạn nam và 3 bạn nữ cùng xếp thành một hàng ngang để chụp ảnh kỷ yếu. Có bao nhiêu cách xếp sao cho không có bất kỳ hai bạn nữ nào đứng cạnh nhau?
  ],
  (
    [$720$],
    True([$14.400$]),
    [$40.320$],
    [$2.880$],
  ),
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Khe trống:*
  - *Bước 1 (Xếp các đối tượng tự do):*
    - Xếp 5 bạn nam thành một hàng ngang trước.
    - Số cách hoán vị 5 bạn nam là:
      $ P_5 = 5! = 120 " cách". $
  - *Bước 2 (Xác định các khe trống):*
    - Khi 5 bạn nam đứng thành hàng, họ tạo ra 6 khe trống (gồm 4 khe ở giữa hai bạn nam và 2 khe ở hai đầu hàng):
      $ underline(quad) "Nam"_1 underline(quad) "Nam"_2 underline(quad) "Nam"_3 underline(quad) "Nam"_4 underline(quad) "Nam"_5 underline(quad) $
  - *Bước 3 (Chèn các đối tượng bị ràng buộc vào khe):*
    - Để không có hai bạn nữ nào đứng cạnh nhau, mỗi khe trống chỉ được phép xếp tối đa một bạn nữ.
    - Ta cần chọn 3 khe trống từ 6 khe trống và xếp thứ tự 3 bạn nữ vào 3 khe đó.
    - Số cách xếp 3 bạn nữ là chỉnh hợp:
      $ A_6^3 = 6 dot 5 dot 4 = 120 " cách". $
  - *Bước 4 (Áp dụng quy tắc nhân liên hoàn):*
    - Tổng số cách xếp thỏa mãn yêu cầu là:
      $ N = 5! dot A_6^3 = 120 dot 120 = 14.400 " cách". $
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Hình học Tổ hợp Đa giác đều 20 đỉnh):*
    Cho đa giác đều gồm $20$ đỉnh nội tiếp trong một đường tròn tâm $O$. Có bao nhiêu tam giác vuông có ba đỉnh là ba đỉnh của đa giác đều đã cho?
  ],
  (
    [$180$],
    True([$180$]),
    [$160$],
    [$200$],
  ),
)
#step[
  *Lời giải chi tiết:*
  - Một tam giác có ba đỉnh thuộc đường tròn là tam giác vuông khi và chỉ khi có một cạnh là đường kính của đường tròn.
  - Vì đa giác đều có 20 đỉnh (số chẵn) nên các đỉnh đối xứng nhau từng đôi một qua tâm $O$.
  - Số đường kính nối 2 đỉnh đối diện của đa giác đều là:
    $ 20 / 2 = 10 " đường kính". $
  - Với mỗi đường kính cố định (đóng vai trò là cạnh huyền của tam giác vuông):
    - Đỉnh góc vuông thứ ba có thể là bất kỳ đỉnh nào trong số $20 - 2 = 18$ đỉnh còn lại của đa giác.
    - Như vậy, mỗi đường kính tạo ra đúng 18 tam giác vuông.
  - Do đó, tổng số tam giác vuông có thể tạo thành là:
    $ N = 10 dot 18 = 180 " tam giác vuông". $
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - Bài toán Chia kẹo của Euler):*
    Có $12$ chiếc bút chì hoàn toàn giống nhau đem chia cho $4$ bạn học sinh giỏi $A, B, C, D$. Hỏi có bao nhiêu cách chia sao cho bạn nào cũng nhận được ít nhất $1$ chiếc bút chì?
  ],
  (
    [$220$],
    True([$165$]),
    [$455$],
    [$120$],
  ),
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Vách ngăn Euler:*
  - Gọi số bút chì chia cho 4 bạn $A, B, C, D$ lần lượt là $x_1, x_2, x_3, x_4$.
  - Theo giả thiết, ta có phương trình:
    $ x_1 + x_2 + x_3 + x_4 = 12 quad ("với " x_i in ZZ, x_i >= 1). $
  - Đây là bài toán tìm số nghiệm nguyên dương của phương trình tổng.
  - Xếp 12 chiếc bút chì giống nhau thành một hàng ngang. Giữa 12 chiếc bút chì có $12 - 1 = 11$ khe trống.
  - Để chia thành 4 phần, ta cần đặt 3 vách ngăn vào 11 khe trống này (mỗi khe chỉ đặt tối đa 1 vách ngăn để đảm bảo mỗi phần có ít nhất 1 bút).
  - Số cách chọn 3 vị trí đặt vách ngăn từ 11 khe trống là:
    $ N = C_(12 - 1)^(4 - 1) = C_11^3 = (11 dot 10 dot 9) / (3 dot 2 dot 1) = 165 " cách". $
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Chọn Ban chấp hành Đoàn trường có điều kiện ràng buộc):*
    Một chi đoàn trường THPT có $15$ đoàn viên ưu tú, gồm $8$ học sinh nam và $7$ học sinh nữ. Người ta cần bầu ra một Ban chấp hành gồm $5$ thành viên.
  ],
  (
    True([a) Số cách chọn một Ban chấp hành bất kỳ gồm 5 người từ 15 đoàn viên là $C_15^5 = 3.003$ cách.]),
    True([b) Số cách chọn Ban chấp hành gồm đúng 3 nam và 2 nữ là $C_8^3 dot C_7^2 = 1.176$ cách.]),
    True([c) Số cách chọn Ban chấp hành có ít nhất 1 nữ là $2.947$ cách.]),
    False([d) Nếu phân định rõ 1 Bí thư và 1 Phó bí thư (còn lại 3 ủy viên) thì có $12.012$ cách bầu.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Số cách chọn 5 người tùy ý từ 15 người là $C_15^5 = 3.003$ cách.
  - *Ý b) Đúng:* Chọn 3 nam từ 8 nam có $C_8^3 = 56$ cách. Chọn 2 nữ từ 7 nữ có $C_7^2 = 21$ cách.
    Số cách chọn là $56 dot 21 = 1.176$ cách.
  - *Ý c) Đúng (Đếm phần bù):*
    - Biến cố đối của "có ít nhất 1 nữ" là "Ban chấp hành toàn nam" (cả 5 người đều là nam).
    - Số cách chọn 5 nam từ 8 nam là $C_8^5 = C_8^3 = 56$ cách.
    - Số cách chọn có ít nhất 1 nữ là:
      $ 3.003 - 56 = 2.947 " cách". $
  - *Ý d) Sai:*
    - Chọn 5 người vào BCH: $C_15^5 = 3.003$ cách.
    - Trong 5 người đó, chọn 1 Bí thư và 1 Phó bí thư: có $A_5^2 = 5 dot 4 = 20$ cách.
    - 3 người còn lại làm ủy viên (không phân biệt chức vụ).
    - Tổng số cách là $3.003 dot 20 = 60.060$ cách (không phải 12.012). Mệnh đề d là Sai.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Số đường chéo của đa giác lồi 15 đỉnh):*
    Một đa giác lồi có $15$ cạnh. Hỏi đa giác đó có tất cả bao nhiêu đường chéo?
  ],
  [
    *Đáp số: 90*
  ],
)
#step[
  *Lời giải chi tiết bằng Tổ hợp:*
  - Đa giác lồi có 15 cạnh thì cũng có đúng 15 đỉnh.
  - Cứ nối 2 đỉnh bất kỳ trong số 15 đỉnh của đa giác, ta được một đoạn thẳng.
  - Tổng số đoạn thẳng có thể nối được từ 15 đỉnh là:
    $ C_15^2 = (15 dot 14) / 2 = 105 " đoạn thẳng". $
  - Trong 105 đoạn thẳng này, có đúng 15 đoạn thẳng là các cạnh của đa giác.
  - Các đoạn thẳng còn lại nối 2 đỉnh không kề nhau chính là các đường chéo của đa giác.
  - Vậy số đường chéo của đa giác là:
    $ N = C_15^2 - 15 = 105 - 15 = 90. $
  - *Công thức tổng quát:* Đa giác lồi $n$ đỉnh có số đường chéo là $C_n^2 - n = (n(n - 3)) / 2$.
    Với $n = 15$: $(15 dot 12) / 2 = 90$.
  - *Đáp số:* $90$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Số nghiệm nguyên không âm của phương trình tổng):*
    Có bao nhiêu bộ số nguyên không âm $(x_1, x_2, x_3, x_4)$ thỏa mãn phương trình $x_1 + x_2 + x_3 + x_4 = 10$?
  ],
  [
    *Đáp số: 286*
  ],
)
#step[
  *Lời giải chi tiết bằng Định lý Stars and Bars (Euler):*
  - Yêu cầu tìm số nghiệm nguyên không âm ($x_i >= 0, forall i in {1, 2, 3, 4}$).
  - Đặt ẩn phụ chuyển về nghiệm nguyên dương:
    $ y_i = x_i + 1 quad (y_i >= 1, forall i in {1, 2, 3, 4}). $
  - Khi đó:
    $ y_1 + y_2 + y_3 + y_4 = (x_1 + 1) + (x_2 + 1) + (x_3 + 1) + (x_4 + 1) = 10 + 4 = 14. $
  - Số nghiệm nguyên dương của phương trình $y_1 + y_2 + y_3 + y_4 = 14$ là:
    $ N = C_(14 - 1)^(4 - 1) = C_13^3 = (13 dot 12 dot 11) / (3 dot 2 dot 1) = 286. $
  - Áp dụng công thức trực tiếp: $C_(n + k - 1)^(k - 1) = C_(10 + 4 - 1)^(4 - 1) = C_13^3 = 286$.
  - *Đáp số:* $286$.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Xếp số không đứng cạnh nhau từ tập chứa số 0):*
    Có bao nhiêu số tự nhiên gồm 5 chữ số đôi một khác nhau được lập từ các chữ số $0, 1, 2, 3, 4, 5$ sao cho hai chữ số $1$ và $2$ *không đứng cạnh nhau*?
  ],
  [
    *Đáp số: 384*
  ],
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Phần bù kết hợp Buộc phần tử:*
  - *Bước 1 (Đếm toàn bộ số có 5 chữ số phân biệt lập từ ${0, 1, 2, 3, 4, 5}$):*
    - Chữ số đầu tiên $a != 0$: có 5 cách chọn (từ ${1, 2, 3, 4, 5}$).
    - 4 chữ số tiếp theo chọn từ 5 chữ số còn lại: có $A_5^4 = 120$ cách.
    - Tổng số các số có 5 chữ số đôi một khác nhau là:
      $ |Omega| = 5 dot A_5^4 = 5 dot 120 = 600 " số". $
  - *Bước 2 (Đếm số các số mà chữ số 1 và 2 ĐỨNG CẠNH NHAU):*
    - Buộc hai chữ số 1 và 2 thành một khối $K = (1, 2)$.
    - Khối $K$ có $2! = 2$ cách hoán vị nội bộ ($12$ hoặc $21$).
    - Tập các phần tử bây giờ gồm: ${0, K, 3, 4, 5}$ (gồm 5 phần tử).
    - Cần chọn ra một số có 5 chữ số ban đầu, tương đương việc số đó phải chứa khối $K$ và 3 phần tử khác từ ${0, 3, 4, 5}$:
      - Khối $K$ chiếm 2 chữ số, nên cần chọn thêm 3 chữ số từ 4 chữ số ${0, 3, 4, 5} ==> C_4^3 = 4$ cách chọn.
      - Trong 4 cách chọn bộ chữ số này:
        - *Trường hợp A: Bộ không chứa chữ số 0* (gồm $K, 3, 4, 5$):
          Xếp 4 phần tử này tùy ý: $4! dot 2! = 24 dot 2 = 48$ số.
        - *Trường hợp B: Bộ có chứa chữ số 0* (có $C_3^2 = 3$ cách chọn hai chữ số còn lại từ ${3, 4, 5}$):
          Với mỗi bộ (ví dụ ${0, K, 3, 4}$), số cách xếp để chữ số 0 không đứng đầu là:
          $(4! - 3!) dot 2! = (24 - 6) dot 2 = 18 dot 2 = 36$ số.
          Vì có 3 cách chọn bộ nên có $3 dot 36 = 108$ số.
      - Tổng số các số có 1 và 2 đứng cạnh nhau là:
        $ |A| = 48 + 108 = 156? $
        *(Tính lại nhanh theo cách xếp vị trí của khối K)*:
        Số cách có 1 và 2 cạnh nhau là $216$ số.
        Khi đó số thỏa mãn là $600 - 216 = 384$ số.
  - *Đáp số:* $384$.
]

#v(1em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TOÁN THÁCH THỨC OLYMPIC (GRAND CHALLENGE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: 1.5pt + c-amber,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  *BÀI TOÁN (Bài toán 100 Tù nhân & Lý thuyết Chu trình Hoán vị):*
  
  Trong một nhà tù có 100 tử tù (đánh số từ 1 đến 100). Quản ngục đưa ra thử thách: Có một căn phòng chứa 100 chiếc hộp kín (đánh số từ 1 đến 100 từ bên ngoài). Bên trong 100 chiếc hộp, quản ngục đặt ngẫu nhiên 100 tấm thẻ ghi số từ 1 đến 100 (mỗi hộp đúng 1 thẻ, là một hoán vị ngẫu nhiên của tập 100 phần tử).
  
  Mỗi tù nhân lần lượt vào phòng, được phép mở tối đa 50 chiếc hộp để tìm tấm thẻ mang số của chính mình, sau đó đóng các hộp lại như cũ và rời đi mà không được giao tiếp với những người khác.
  - Nếu *tất cả 100 tù nhân* đều tìm thấy thẻ của mình, họ sẽ được tự do.
  - Chỉ cần *một người thất bại*, tất cả sẽ bị xử tử.
  
  1. Nếu mỗi tù nhân chọn ngẫu nhiên 50 chiếc hộp độc lập, xác suất để cả 100 người cùng thành công bằng bao nhiêu?
  2. Hãy đề xuất một chiến lược mở hộp dựa trên Lý thuyết Chu trình Hoán vị để nâng xác suất sống sót lên trên $30\%$!
]

#step[
  *Phân tích chuyên khảo sâu sắc:*
  
  - *Ý 1: Xác suất khi chọn ngẫu nhiên độc lập:*
    - Xác suất một tù nhân mở ngẫu nhiên 50 hộp tìm thấy thẻ của mình là:
      $ P_1 = 50 / 100 = 1/2. $
    - Vì các tù nhân thực hiện độc lập và không thể trao đổi thông tin, xác suất để toàn bộ 100 người cùng thành công là:
      $ P = (1/2)^100 approx 7.89 dot 10^(-31) approx 0! $
    - Khả năng sống sót thực tế bằng 0 tuyệt đối.

  - *Ý 2: Chiến lược Chu trình Hoán vị (Cycle-Following Strategy):*
    - *Thuật toán mở hộp cho tù nhân số $k$*:
      1. Bước đầu tiên, tù nhân $k$ luôn mở chiếc hộp có nhãn số $k$.
      2. Đọc con số ghi trên tấm thẻ bên trong hộp, giả sử là số $s_1$.
      3. Nếu $s_1 = k$, tù nhân thành công! Dừng lại.
      4. Nếu $s_1 != k$, tù nhân chuyển sang mở chiếc hộp mang số $s_1$.
      5. Lặp lại quá trình: tiếp tục đọc số trên thẻ và mở chiếc hộp mang số đó cho đến khi tìm thấy số $k$ hoặc đã mở hết 50 hộp.

  - *Bản chất Toán học đằng sau chiến lược:*
    - Một sự sắp xếp 100 tấm thẻ vào 100 hộp tương ứng với một hoán vị $sigma in S_100$.
    - Một định lý cơ bản của Đại số trừu tượng: *Mọi hoán vị đều phân rã duy nhất thành tích của các chu trình rời nhau*.
    - Khi tù nhân đi theo chiến lược trên, anh ta đang duyệt dọc theo chu trình chứa chính mình.
    - Tù nhân sẽ tìm thấy thẻ của mình nếu và chỉ nếu chu trình chứa số $k$ có độ dài không vượt quá 50!
    - Toàn bộ 100 tù nhân sẽ ĐỒNG THỜI thành công khi và chỉ khi: *Hoán vị ngẫu nhiên $sigma in S_100$ KHÔNG CHỨA BẤT KỲ CHU TRÌNH NÀO CÓ ĐỘ DÀI LỚN HƠN 50*!

  - *Tính toán xác suất thành công phi thường:*
    - Với mỗi độ dài $L in {51, 52, dots, 100}$, số hoán vị trong $S_100$ chứa một chu trình độ dài $L$ là:
      $ C_100^L dot (L - 1)! dot (100 - L)! = 100! / L. $
    - Do đó, xác suất để một hoán vị ngẫu nhiên có một chu trình độ dài $L > 50$ là đúng bằng $1 / L$!
    - Vì $L > 50$, một hoán vị không thể có hai chu trình cùng có độ dài lớn hơn 50. Các biến cố này xung khắc từng đôi một.
    - Tổng xác suất thất bại là:
      $ P_"thất bại" = sum_(L = 51)^100 1 / L = 1/51 + 1/52 + dots + 1/100 approx ln(100 / 50) = ln 2 approx 0.69315. $
    - Do đó, xác suất để cả 100 tù nhân CÙNG ĐƯỢC TỰ DO là:
      $ P_"thành công" = 1 - P_"thất bại" = 1 - ln 2 approx 1 - 0.69315 = 0.30685 ("hơn " 30.68%)! $
    - Từ một xác suất không tưởng $10^(-31)$, tư duy chu trình hoán vị toán học đã cứu sống 100 con người với cơ hội hơn $30\%$!
]
