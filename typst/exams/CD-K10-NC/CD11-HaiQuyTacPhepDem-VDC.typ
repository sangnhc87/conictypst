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
  stroke: (bottom: 2pt + rgb("78350F")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("78350F"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("D97706")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("D97706"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("F59E0B")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("F59E0B"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("D97706")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Hai quy tắc đếm (Amber - Orange)
#let c-amber-dark = rgb("78350F")
#let c-amber = rgb("D97706")
#let c-amber-light = rgb("F59E0B")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-amber = rgb("FFFBEB")
#let c-border = rgb("FEF3C7")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-amber,
    stroke: 1.5pt + c-amber,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-amber-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-amber, size: 16pt, weight: "black")[CHUYÊN ĐỀ 11: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO HAI QUY TẮC PHÉP ĐẾM]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Nguyên lý Bù trừ (PIE), Kỹ thuật Đếm phần bù, Cây quyết định, Tô màu đồ thị & Không gian tìm kiếm AI
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-amber),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Bản chất Tiên đề của Phép đếm & Không gian Trí tuệ Nhân tạo (AI Search Space):*
  
  Mọi cấu trúc dữ liệu rời rạc trong Khoa học máy tính — từ cây nhị phân, thuật toán duyệt đồ thị (BFS, DFS), cho đến không gian trạng thái của các mô hình trí tuệ nhân tạo (Search Space of Chess, AlphaGo) — đều bắt đầu từ hai tiên đề giản đơn nhưng sâu sắc:
  
  1. *Quy tắc Cộng (Phép toán Hợp rời rạc)*: Nếu một công việc có thể hoàn thành theo một trong hai *phương án* $A$ hoặc $B$ hoàn toàn độc lập và xung khắc ($A inter B = emptyset$), thì số cách là $|A| + |B|$.
  2. *Quy tắc Nhân (Tích Descartes)*: Nếu một công việc đòi hỏi phải trải qua liên tiếp hai *công đoạn* $1$ và $2$, công đoạn 1 có $m$ cách và với mỗi cách đó có $n$ cách thực hiện công đoạn 2, thì số cách hoàn thành là $m dot n$.
  
  Trong các kỳ thi Chuyên Toán và VDC:
  - *Cạm bẫy lớn nhất của học sinh* là nhầm lẫn giữa "Phương án" (chọn một trong các nhánh độc lập) và "Công đoạn" (chuỗi hành động liên tiếp bắt buộc).
  - *Nguyên lý Bù trừ (Inclusion - Exclusion Principle)*: Công cụ tối thượng xử lý bài toán đếm khi các tập hợp có phần giao nhau chồng lấn.
  - *Kỹ thuật Đếm phần bù*: Chuyển đổi bài toán "ít nhất một", "không đồng thời" từ hàng chục trường hợp phân nhánh phức tạp về một phép trừ duy nhất: $|A| = |Omega| - |overline(A)|$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. HỆ THỐNG KỸ THUẬT VDC & NGUYÊN LÝ NỀN TẢNG
// ══════════════════════════════════════════════════════════════

== 1. Nguyên lý Bù trừ (Inclusion - Exclusion Principle)

#block(
  fill: c-bg-amber,
  stroke: 1pt + c-border,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  - *Cho hai tập hợp $A, B$ bất kỳ*:
    $ |A union B| = |A| + |B| - |A inter B|. $
  - *Cho ba tập hợp $A, B, C$ bất kỳ*:
    $ |A union B union C| = (|A| + |B| + |C|) - (|A inter B| + |B inter C| + |C inter A|) + |A inter B inter C|. $
  - *Ý nghĩa sư phạm:* Khi đếm trực tiếp tổng $|A| + |B| + |C|$, các phần tử thuộc giao của hai tập bị đếm lặp 2 lần (phải trừ đi), nhưng phần tử thuộc cả ba tập lại bị trừ đi quá tay (phải cộng bù lại 1 lần).
]

#v(0.6em)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ biểu đồ Venn 3 tập hợp
    let r = 1.8
    let ox_a = -0.9
    let oy_a = 0.6
    let ox_b = 0.9
    let oy_b = 0.6
    let ox_c = 0.0
    let oy_c = -0.7

    circle((ox_a, oy_a), radius: r, stroke: 1.5pt + c-blue, fill: rgb("DBEAFE"))
    content((ox_a - 1.3, oy_a + 1.2), text(fill: c-blue, weight: "bold")[Tập $A$])

    circle((ox_b, oy_b), radius: r, stroke: 1.5pt + c-emerald, fill: rgb("D1FAE5"))
    content((ox_b + 1.3, oy_b + 1.2), text(fill: c-emerald, weight: "bold")[Tập $B$])

    circle((ox_c, oy_c), radius: r, stroke: 1.5pt + c-amber, fill: rgb("FEF3C7"))
    content((ox_c, oy_c - 2.1), text(fill: c-amber-dark, weight: "bold")[Tập $C$])

    // Tâm giao 3 tập
    circle((0, 0.2), radius: 2pt, fill: c-red)
    content((0, 0.2), text(fill: c-red, weight: "bold", size: 8pt)[$A inter B inter C$])
  })
]

#v(0.6em)

== 2. Bảng phân loại chiến lược đếm VDC

#table(
  columns: (2.5fr, 3.5fr, 4fr),
  fill: (col, row) => if row == 0 { c-amber } else if calc.even(row) { rgb("FFFBEB") } else { none },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  inset: 7pt,
  stroke: 0.5pt + rgb("CBD5E0"),
  [#text(fill: white, weight: "bold")[Chiến lược đếm]],
  [#text(fill: white, weight: "bold")[Dấu hiệu nhận biết]],
  [#text(fill: white, weight: "bold")[Mô hình toán học & Quy trình]],

  [*Quy tắc Nhân liên hoàn*],
  [Bài toán gồm nhiều bước thực hiện tuần tự, chữ số khác nhau, mật mã],
  [Chia thành các công đoạn: Chọn $a_1$ ($n_1$ cách) $->$ Chọn $a_2$ ($n_2$ cách) $->$ Tích $n_1 n_2 dots n_k$.],

  [*Quy tắc Cộng phân nhánh*],
  [Các trường hợp rời rạc không giao nhau (số tận cùng 0 hoặc tận cùng khác 0)],
  [Liệt kê đầy đủ các trường hợp xung khắc $T_1, T_2, dots, T_k$. Tổng $N = N_1 + N_2 + dots + N_k$.],

  [*Đếm Gián tiếp (Phần bù)*],
  [Đề bài có từ khóa "có ít nhất một", "không đồng thời", "có nhiều nhất"],
  [Đếm không gian toàn thể $Omega$ rồi trừ đi biến cố bù vi phạm: $N = |Omega| - |overline(A)|$.],

  [*Nguyên lý Bù trừ (PIE)*],
  [Đếm các số chia hết cho ít nhất một trong các số nguyên tố $p, q, r$],
  [Cộng từng tập, trừ giao 2 tập, cộng giao 3 tập, trừ giao 4 tập...],
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - Lập số tự nhiên chia hết cho 5 có chữ số khác nhau):*
    Từ các chữ số thuộc tập hợp $X = {0, 1, 2, 3, 4, 5, 6}$, có thể lập được bao nhiêu số tự nhiên gồm 4 chữ số đôi một khác nhau và chia hết cho 5?
  ],
  (
    [$180$],
    True([$220$]),
    [$240$],
    [$200$],
  ),
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Phân nhánh chữ số 0:*
  - Gọi số tự nhiên cần tìm có dạng $macron(a b c d)$ với $a, b, c, d in X$, $a != 0$ và $a, b, c, d$ đôi một khác nhau.
  - Điều kiện chia hết cho 5 đòi hỏi chữ số tận cùng $d in {0; 5}$.
  - Do chữ số 0 vừa bị ràng buộc ở vị trí đầu ($a != 0$) vừa bị ràng buộc ở vị trí cuối ($d = 0$), ta bắt buộc phải chia làm *2 trường hợp xung khắc*:
    - *Trường hợp 1: $d = 0$*
      - Có 1 cách chọn $d = 0$.
      - Khi $d = 0$, chữ số $a$ hiển nhiên khác 0. Ta chọn $a$ từ tập ${1, 2, 3, 4, 5, 6}$ (gồm 6 chữ số) $==>$ có 6 cách chọn $a$.
      - Chọn $b$ từ 5 chữ số còn lại $==>$ có 5 cách chọn $b$.
      - Chọn $c$ từ 4 chữ số còn lại $==>$ có 4 cách chọn $c$.
      - Theo quy tắc nhân, số các số tạo thành trong TH1 là:
        $ N_1 = 1 dot 6 dot 5 dot 4 = 120 " số". $
    - *Trường hợp 2: $d = 5$*
      - Có 1 cách chọn $d = 5$.
      - Chữ số $a != 0$ và $a != d = 5$, nên $a$ được chọn từ ${1, 2, 3, 4, 6}$ (gồm 5 chữ số) $==>$ có 5 cách chọn $a$.
      - Chữ số $b$ khác $a$ và $d$, nhưng được phép bằng 0, nên $b$ được chọn từ 5 chữ số còn lại trong $X$ $==>$ có 5 cách chọn $b$.
      - Chọn $c$ từ 4 chữ số còn lại $==>$ có 4 cách chọn $c$.
      - Theo quy tắc nhân, số các số tạo thành trong TH2 là:
        $ N_2 = 1 dot 5 dot 5 dot 4 = 100 " số". $
  - Áp dụng quy tắc cộng cho hai trường hợp xung khắc:
    $ N = N_1 + N_2 = 120 + 100 = 220 " số". $
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Nguyên lý Bù trừ PIE trong Số học):*
    Trong các số nguyên dương từ $1$ đến $1000$, có bao nhiêu số *không chia hết* cho bất kỳ số nào trong ba số $2, 3$ và $5$?
  ],
  (
    [$233$],
    True([$266$]),
    [$270$],
    [$254$],
  ),
)
#step[
  *Lời giải chi tiết bằng Nguyên lý Bù trừ (Inclusion - Exclusion):*
  - Tập toàn thể $Omega = {1, 2, dots, 1000}$, số phần tử $|Omega| = 1000$.
  - Gọi $A_2, A_3, A_5$ lần lượt là tập hợp các số thuộc $Omega$ chia hết cho $2, 3, 5$:
    - $|A_2| = floor(1000 / 2) = 500$.
    - $|A_3| = floor(1000 / 3) = 333$.
    - $|A_5| = floor(1000 / 5) = 200$.
  - Giao của từng cặp hai tập hợp:
    - $|A_2 inter A_3| = floor(1000 / 6) = 166$ (chia hết cho 6).
    - $|A_2 inter A_5| = floor(1000 / 10) = 100$ (chia hết cho 10).
    - $|A_3 inter A_5| = floor(1000 / 15) = 66$ (chia hết cho 15).
  - Giao của cả ba tập hợp:
    - $|A_2 inter A_3 inter A_5| = floor(1000 / 30) = 33$ (chia hết cho 30).
  - Số các số chia hết cho ít nhất một trong ba số $2, 3, 5$ là:
    $ |A_2 union A_3 union A_5| = (|A_2| + |A_3| + |A_5|) - (|A_2 inter A_3| + |A_2 inter A_5| + |A_3 inter A_5|) + |A_2 inter A_3 inter A_5| $
    $ = (500 + 333 + 200) - (166 + 100 + 66) + 33 = 1033 - 332 + 33 = 734. $
  - Số các số không chia hết cho cả ba số $2, 3, 5$ là phần bù:
    $ N = |Omega| - |A_2 union A_3 union A_5| = 1000 - 734 = 266. $
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - An toàn Mật mã & Đếm phần bù):*
    Mật khẩu mở khóa một máy chủ an ninh gồm 6 ký tự liên tiếp: ký tự đầu tiên bắt buộc là một chữ cái in hoa trong bảng chữ cái tiếng Anh (gồm 26 chữ cái từ A đến Z), 5 ký tự tiếp theo là các chữ số từ 0 đến 9 (các chữ số có thể lặp lại). Hỏi có bao nhiêu mật khẩu thỏa mãn điều kiện có *ít nhất một* chữ số bằng 8?
  ],
  (
    [$2.600.000$],
    True([$1.064.674$]),
    [$1.535.326$],
    [$850.000$],
  ),
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Đếm phần bù:*
  - *Bước 1 (Đếm toàn bộ số mật khẩu hợp lệ không có điều kiện ràng buộc chữ số 8):*
    - Ký tự đầu tiên (chữ cái in hoa): có 26 cách chọn.
    - 5 ký tự chữ số tiếp theo: mỗi vị trí có 10 cách chọn (từ 0 đến 9).
    - Tổng số mật khẩu có thể tạo ra là:
      $ |Omega| = 26 dot 10^5 = 26 dot 100.000 = 2.600.000. $
  - *Bước 2 (Đếm số mật khẩu KHÔNG chứa bất kỳ chữ số 8 nào):*
    - Ký tự đầu tiên vẫn có 26 cách chọn.
    - 5 vị trí tiếp theo chỉ được chọn trong 9 chữ số (bỏ chữ số 8, tức là ${0, 1, 2, 3, 4, 5, 6, 7, 9}$).
    - Số cách chọn 5 chữ số này là $9^5 = 59.049$.
    - Tổng số mật khẩu không có chữ số 8 là:
      $ |overline(A)| = 26 dot 9^5 = 26 dot 59.049 = 1.535.274. $
  - *Bước 3 (Lấy phần bù):*
    - Số mật khẩu có ít nhất một chữ số 8 là:
      $ |A| = |Omega| - |overline(A)| = 2.600.000 - 1.535.274 = 1.064.726. $
    - (Tính nhẩm lại $26 dot 59049 = 1535274$, $2600000 - 1535274 = 1064726$).
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Mô hình hóa Bài toán Tô màu Bản đồ & Đồ thị):*
    Một bản đồ gồm 4 vùng lãnh thổ $A, B, C, D$ được bố trí sao cho: Vùng $A$ tiếp giáp với cả 3 vùng $B, C, D$; vùng $B$ tiếp giáp với $A$ và $C$; vùng $C$ tiếp giáp với $A, B, D$; vùng $D$ tiếp giáp với $A$ và $C$. Người ta dùng 4 màu khác nhau (Đỏ, Xanh, Vàng, Trắng) để tô màu cho 4 vùng này sao cho hai vùng có chung đường biên giới thì không được tô cùng màu.
  ],
  (
    True([a) Vùng $A$ có bậc tiếp giáp cao nhất nên bắt buộc phải chọn màu đầu tiên, có 4 cách chọn màu cho vùng $A$.]),
    True([b) Sau khi tô màu vùng $A$, vùng $B$ có 3 cách chọn màu vì chỉ kề với $A$.]),
    True([c) Số cách tô màu hợp lệ cho cả bản đồ bằng $72$ cách.]),
    False([d) Nếu chỉ dùng 3 màu thì không thể tô được bản đồ này theo yêu cầu.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Vùng $A$ tiếp giáp với cả 3 vùng $B, C, D$ nên có ràng buộc mạnh nhất. Việc chọn màu cho $A$ trước giúp tối ưu hóa thuật toán đếm nhánh. Có 4 màu nên có 4 cách tô vùng $A$.
  - *Ý b) Đúng:* Vùng $B$ chỉ kề với $A$, nên màu của $B$ chỉ cần khác màu của $A$. Do đó có $4 - 1 = 3$ cách tô cho vùng $B$.
  - *Ý c) Phân tích số cách tô cho các vùng tiếp theo:*
    - Vùng $C$ tiếp giáp với cả $A$ và $B$ (hai vùng này đã tô hai màu khác nhau). Do đó vùng $C$ phải khác cả màu $A$ và màu $B$, nên có $4 - 2 = 2$ cách tô cho vùng $C$.
    - Vùng $D$ tiếp giáp với $A$ và $C$ (hai vùng $A$ và $C$ có màu khác nhau). Do đó vùng $D$ chỉ cần khác màu của $A$ và khác màu của $C$. Màu của $D$ có thể trùng với màu của $B$ hoặc là màu thứ tư còn lại. Do đó có $4 - 2 = 2$ cách chọn màu cho $D$.
    - Theo quy tắc nhân, tổng số cách tô màu là:
      $ N = 4 dot 3 dot 2 dot 2 = 48 " cách (không phải 72 cách!)". $
    - Vậy mệnh đề c là *Sai*.
  - *Ý d) Sai:* Nếu chỉ dùng 3 màu (gọi là 1, 2, 3):
    - Tô $A$ màu 1 (3 cách).
    - Tô $B$ màu 2 (2 cách).
    - Tô $C$ màu 3 (1 cách, vì $C$ kề $A$ và $B$).
    - Vùng $D$ kề $A$ (màu 1) và $C$ (màu 3), nên $D$ hoàn toàn có thể tô màu 2 (trùng màu với $B$ vì $B$ và $D$ không kề nhau!).
    - Vậy vẫn tô được hoàn hảo bằng 3 màu với số cách là $3 dot 2 dot 1 dot 1 = 6$ cách.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Số các số tự nhiên có chữ số tăng dần nghiêm ngặt):*
    Có bao nhiêu số tự nhiên có 4 chữ số $macron(a b c d)$ sao cho các chữ số tăng dần từ trái sang phải, tức là $1 <= a < b < c < d <= 9$?
  ],
  [
    *Đáp số: 126*
  ],
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Song ánh (Bijection Principle):*
  - Nhận xét bản chất: Với mỗi tập hợp con gồm 4 chữ số phân biệt được chọn ra từ tập hợp 9 chữ số ${1, 2, 3, 4, 5, 6, 7, 8, 9}$, *chỉ có duy nhất một cách sắp xếp* các chữ số này theo thứ tự tăng dần từ bé đến lớn để tạo thành số $macron(a b c d)$!
  - Chữ số 0 không thể nằm trong tập này vì $a >= 1 > 0$.
  - Do đó, số các số tự nhiên có 4 chữ số tăng dần đúng bằng số cách chọn 4 phần tử từ 9 phần tử:
    $ N = C_9^4 = (9 dot 8 dot 7 dot 6) / (4 dot 3 dot 2 dot 1) = 126. $
  - *Đáp số:* $126$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Bài toán Bắt tay & Cáp mạng trong Đồ thị Euler):*
    Trong một buổi hội nghị khoa học quốc tế có 12 nhà toán học. Mỗi nhà toán học bắt tay đúng với 5 người khác. Hỏi có tổng cộng bao nhiêu cái bắt tay đã diễn ra trong hội nghị?
  ],
  [
    *Đáp số: 30*
  ],
)
#step[
  *Lời giải chi tiết bằng Bổ đề Bắt tay (Handshaking Lemma):*
  - Mỗi nhà toán học bắt tay với 5 người khác, nên nếu ta đếm số cái bắt tay xuất phát từ từng người, tổng số lượt bắt tay được ghi nhận là:
    $ 12 dot 5 = 60 " lượt bắt tay". $
  - Tuy nhiên, mỗi cái bắt tay diễn ra giữa hai người $A$ và $B$ đã được tính hai lần (một lần ở phía $A$ và một lần ở phía $B$).
  - Do đó, tổng số cái bắt tay thực tế là:
    $ N = (12 dot 5) / 2 = 60 / 2 = 30. $
  - *Đáp số:* $30$.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Đếm số tự nhiên có 5 chữ số có tổng các chữ số là số lẻ):*
    Có bao nhiêu số tự nhiên có 5 chữ số (từ $10000$ đến $99999$) mà tổng các chữ số của nó là một số lẻ?
  ],
  [
    *Đáp số: 45000*
  ],
)
#step[
  *Lời giải chi tiết bằng Quy tắc đối xứng chẵn - lẻ:*
  - Một số tự nhiên có 5 chữ số có dạng $n = macron(a b c d e)$ với $a in {1, 2, dots, 9}$ và $b, c, d, e in {0, 1, dots, 9}$.
  - Tổng số các số tự nhiên có 5 chữ số là:
    $ |Omega| = 9 dot 10 dot 10 dot 10 dot 10 = 90.000 " số". $
  - Xét việc chọn 4 chữ số đầu tiên $a, b, c, d$:
    - Có $9 dot 10 dot 10 dot 10 = 9.000$ cách chọn bộ 4 chữ số $(a, b, c, d)$.
    - Với mỗi bộ 4 chữ số $(a, b, c, d)$ cố định, đặt $S_4 = a + b + c + d$.
    - Tổng 5 chữ số là $S_5 = S_4 + e$. Để $S_5$ là số lẻ:
      - Nếu $S_4$ là số chẵn: thì $e$ bắt buộc phải là số lẻ, tức là $e in {1, 3, 5, 7, 9}$ ($5$ cách chọn).
      - Nếu $S_4$ là số lẻ: thì $e$ bắt buộc phải là số chẵn, tức là $e in {0, 2, 4, 6, 8}$ ($5$ cách chọn).
    - Trong mọi trường hợp, luôn có *đúng 5 cách chọn chữ số tận cùng $e$* để tổng các chữ số là số lẻ!
  - Theo quy tắc nhân, tổng số các số thỏa mãn là:
    $ N = 9.000 dot 5 = 45.000 " số". $
  - Số các số có tổng chữ số là lẻ bằng đúng một nửa tổng số: $90.000 / 2 = 45.000$.
  - *Đáp số:* $45000$.
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
  *BÀI TOÁN (Đếm số Hàm toàn ánh & Số Stirling loại II):*
  
  Cho tập hợp $X = {1, 2, 3, 4, 5}$ gồm 5 phần tử và tập hợp $Y = {A, B, C}$ gồm 3 phần tử.
  1. Có tất cả bao nhiêu ánh xạ (hàm số) từ $X$ vào $Y$?
  2. Sử dụng Nguyên lý Bù trừ (Inclusion - Exclusion), tính số lượng *toàn ánh* (surjection) từ $X$ lên $Y$ (sao cho mỗi phần tử của $Y$ đều có ít nhất một phần tử của $X$ ánh xạ tới).
  3. Từ đó suy ra số cách chia 5 công việc khác nhau cho 3 kỹ sư sao cho kỹ sư nào cũng được giao việc.
]

#step[
  *Chứng minh chuyên khảo sâu sắc:*
  
  - *Ý 1: Tổng số ánh xạ từ $X$ vào $Y$:*
    Mỗi phần tử $x in X$ có đúng 3 cách chọn ảnh $f(x) in Y$.
    Vì có 5 phần tử trong $X$, theo quy tắc nhân ta có tổng số ánh xạ là:
    $ |Omega| = 3^5 = 243 " ánh xạ". $

  - *Ý 2: Tính số toàn ánh bằng Nguyên lý Bù trừ:*
    - Một ánh xạ $f: X -> Y$ không phải là toàn ánh khi và chỉ khi tập ảnh $f(X)$ bị thiếu ít nhất một phần tử của $Y$.
    - Gọi $A, B, C$ lần lượt là tính chất: "Tập ảnh không chứa phần tử $A$", "không chứa $B$", "không chứa $C$".
    - Số ánh xạ không chứa phần tử $A$ (ảnh chỉ nằm trong ${B, C}$):
      $ N(A) = 2^5 = 32. $
      Tương tự, $N(B) = N(C) = 32$.
    - Số ánh xạ không chứa cả $A$ và $B$ (ảnh chỉ là hằng số $C$):
      $ N(A inter B) = 1^5 = 1. $
      Tương tự, $N(B inter C) = N(C inter A) = 1$.
    - Số ánh xạ không chứa cả $A, B, C$: không tồn tại ánh xạ nào ($0$).
    - Theo Nguyên lý Bù trừ, số ánh xạ KHÔNG PHẢI là toàn ánh là:
      $ |A union B union C| = (N(A) + N(B) + N(C)) - (N(A inter B) + N(B inter C) + N(C inter A)) + N(A inter B inter C) $
      $ = (32 + 32 + 32) - (1 + 1 + 1) + 0 = 96 - 3 = 93. $
    - Do đó, số hàm toàn ánh từ $X$ lên $Y$ là:
      $ S(5, 3) dot 3! = |Omega| - |A union B union C| = 243 - 93 = 150 " toàn ánh". $

  - *Ý 3: Phân phối công việc cho kỹ sư:*
    - Việc chia 5 công việc khác nhau cho 3 kỹ sư sao cho ai cũng có việc chính là thiết lập một toàn ánh từ tập 5 công việc lên tập 3 kỹ sư.
    - Do đó, số cách phân phối chính xác là $150$ cách.
    - Nếu 3 kỹ sư là vô danh (chỉ chia thành 3 nhóm việc không phân biệt), số cách là $S(5, 3) = 150 / (3!) = 150 / 6 = 25$ cách — đây chính là *Số Stirling loại hai $S(5, 3)$*!
]
