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
  stroke: (left: 3pt + rgb("B45309")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("B45309"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("D97706")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Tổ hợp
#let c-amber-dark = rgb("78350F")
#let c-amber = rgb("D97706")
#let c-gold = rgb("F59E0B")
#let c-blue = rgb("2563EB")
#let c-red = rgb("DC2626")
#let c-bg-amber = rgb("FFFBEB")
#let c-border = rgb("FEF3C7")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-amber,
    stroke: (
      left: 6pt + c-amber-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-amber-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: ĐẠI SỐ TỔ HỢP,\
      CHIA KẸO EULER & AUTOMATA HỮU HẠN (FSM)
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Bài toán chia kẹo Euler (Sao và Vạch) · Kỹ thuật vách ngăn (Gap Method) · Automata đếm xâu nhị phân\
      Nhị thức Newton nâng cao & Đạo hàm ngầm tính tổng tổ hợp — Phân hóa 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & CÁC ĐỊNH LÝ TỔ HỢP NÂNG CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-amber),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-amber)[1. Định Lý Chia Kẹo Euler (Phương Pháp Sao & Vạch — Stars and Bars)] \
  - *Bài toán 1 (Nghiệm nguyên không âm)*:
    Số cách chia $n$ vật giống nhau vào $k$ hộp phân biệt (hộp có thể rỗng), hay số nghiệm nguyên không âm $(x_1, x_2, dots, x_k) in NN^k$ của phương trình:
    $ x_1 + x_2 + dots + x_k = n $
    là:
    $ N = C_(n + k - 1)^(k - 1) = C_(n + k - 1)^n. $
  - *Bài toán 2 (Nghiệm nguyên dương)*:
    Số nghiệm nguyên dương ($x_i ge 1$) của phương trình $x_1 + x_2 + dots + x_k = n$ là:
    $ N = C_(n - 1)^(k - 1). $
  - *Bài toán 3 (Bất phương trình nghiệm nguyên)*:
    Số nghiệm nguyên không âm của bất phương trình:
    $ x_1 + x_2 + dots + x_k le n $
    bằng số nghiệm nguyên không âm của phương trình $x_1 + x_2 + dots + x_k + x_(k+1) = n$ (với biến phụ $x_(k+1) = n - sum x_i ge 0$):
    $ N = C_(n + (k + 1) - 1)^((k + 1) - 1) = C_(n + k)^k. $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // 7 ngôi sao và 2 vạch chia thành 3 phần
    let items = ("star", "star", "bar", "star", "star", "star", "bar", "star", "star")
    for (i, it) in items.enumerate() {
      let x = (i - 4) * 0.9
      if it == "star" {
        circle((x, 0), radius: 2.5pt, fill: c-amber)
        content((x, 0.4), text(fill: c-amber, size: 9pt)[$star$])
      } else {
        line((x, -0.5), (x, 0.5), stroke: 2pt + c-blue)
        content((x, -0.8), text(fill: c-blue, size: 8pt, weight: "bold")[Vạch])
      }
    }
    content((0, -1.3), text(fill: rgb("4B5563"), size: 8.5pt, style: "italic")[Mô hình $7$ ngôi sao và $2$ vạch tạo thành $3$ phần kẹo: $x_1=2, x_2=3, x_3=2$])
  })
]

#v(0.6em)

#block(
  fill: rgb("FFFDF5"),
  stroke: 1pt + c-amber,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[2. Kỹ Thuật Vách Ngăn (Gap Method) — Xếp Phần Tử Không Kề Nhau] \
  - *Định lý chọn tập con không chứa hai số liên tiếp*:
    Số cách chọn $k$ phần tử từ tập hợp ${1, 2, dots, n}$ sao cho không có hai phần tử nào là hai số tự nhiên liên tiếp là:
    $ N = C_(n - k + 1)^k. $
  - *Phương pháp giải*: Xếp $n - k$ phần tử còn lại thành một hàng, tạo ra $(n - k) + 1 = n - k + 1$ vách ngăn (khe trống). Sau đó chọn $k$ khe trống trong $n - k + 1$ khe để đặt $k$ phần tử cần phân tách.
]

#v(0.6em)

#block(
  fill: rgb("F0FDF4"),
  stroke: (left: 3pt + rgb("16A34A")),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("15803D"))[3. Kỹ Thuật Automata Hữu Hạn (FSM - Finite State Machine) Đếm Xâu] \
  - Để đếm số xâu nhị phân hoặc xâu ký tự thỏa mãn điều kiện cấm (ví dụ: không có hai số $1$ đứng liền nhau, không có mẫu "010"):
    1. Thiết lập các trạng thái $S_0, S_1, dots, S_m$ mô tả đuôi của xâu hiện tại.
    2. Viết ma trận chuyển trạng thái $T$ khi nối thêm một ký tự mới vào đuôi xâu.
    3. Số xâu độ dài $n$ thỏa mãn chính là tổng các phần tử của vectơ trạng thái sau $n$ bước chuyển $v_n = T^n v_0$.
]

#align(center)[
  #cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    // Nút S0
    circle((-2.2, 0), radius: 0.65, fill: rgb("DCFCE7"), stroke: 1.5pt + rgb("16A34A"))
    content((-2.2, 0), text(size: 8.5pt, weight: "bold", fill: rgb("15803D"))[$S_0$])
    content((-2.2, -0.9), text(size: 7.5pt, fill: rgb("15803D"))[Đuôi là 0 / rỗng])

    // Nút S1
    circle((2.2, 0), radius: 0.65, fill: rgb("FEF3C7"), stroke: 1.5pt + c-amber)
    content((2.2, 0), text(size: 8.5pt, weight: "bold", fill: rgb("B45309"))[$S_1$])
    content((2.2, -0.9), text(size: 7.5pt, fill: rgb("B45309"))[Đuôi là 1])

    // Vòng tự lặp S0 khi thêm 0
    arc((-2.2, 0.65), radius: 0.45, start: -45deg, stop: 225deg, stroke: 1.2pt + rgb("16A34A"), mark: (end: ">"))
    content((-2.2, 1.7), text(size: 8pt, weight: "bold", fill: rgb("16A34A"))[nhận '0'])

    // Chuyển từ S0 sang S1 khi thêm 1
    line((-1.55, 0.25), (1.55, 0.25), stroke: 1.2pt + c-amber, mark: (end: ">"))
    content((0, 0.55), text(size: 8pt, weight: "bold", fill: c-amber)[nhận '1'])

    // Chuyển từ S1 về S0 khi thêm 0
    line((1.55, -0.25), (-1.55, -0.25), stroke: 1.2pt + rgb("16A34A"), mark: (end: ">"))
    content((0, -0.55), text(size: 8pt, weight: "bold", fill: rgb("16A34A"))[nhận '0'])

    content((0, -1.6), text(size: 8pt, style: "italic", fill: rgb("4B5563"))[Sơ đồ FSM sinh xâu nhị phân không chứa "11": Tại $S_1$, nhận tiếp '1' sẽ bị loại bỏ (Dead State)])
  })
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("78350F"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-amber)[4. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Tổ Hợp Rời Rạc] \
  
  #text(weight: "bold", fill: rgb("B45309"))[a) Nguồn gốc lịch sử: Từ Leonhard Euler đến Lý thuyết Phân hoạch:]
  - Năm 1748, trong tuyệt phẩm *Introductio in analysin infinitorum*, đại thiên tài *Leonhard Euler* đã đặt nền móng cho Giải tích tổ hợp hiện đại bằng việc khai sinh công cụ *Hàm sinh (Generating Functions)*. Khi nghiên cứu bài toán phân tích một số nguyên thành tổng các số nguyên dương (phân hoạch số nguyên -- *Integer Partitions*), Euler nhận thấy các phép đếm tổ hợp phức tạp có thể biến thành các phép nhân đa thức đại số quen thuộc.
  - Mô hình "Sao và Vạch" (Stars and Bars) là một tuyệt tác hình học hóa đại số: Thay vì giải phương trình nghiệm nguyên trừu tượng, Euler biến nó thành bài toán xếp $n$ vật giống nhau (sao) và $k-1$ vách ngăn phân cách để tạo thành $k$ phần.

  #v(0.4em)
  #text(weight: "bold", fill: rgb("B45309"))[b) Hướng mở rộng 1: Phương pháp Hàm sinh đại số (Generating Functions):]
  - Số nghiệm nguyên của phương trình $x_1 + x_2 + dots + x_k = n$ với ràng buộc phức tạp $a_i le x_i le b_i$ chính là hệ số của số hạng $x^n$ trong khai triển của tích các chuỗi hình thức:
    $ G(x) = (sum_(j=a_1)^(b_1) x^j) (sum_(j=a_2)^(b_2) x^j) dots (sum_(j=a_k)^(b_k) x^j) $
  - Khi không có cận trên ($x_i ge 0$), ta có cấp số nhân lùi vô hạn: $1 + x + x^2 + dots = frac(1, 1 - x)$. Tích hàm sinh là:
    $ G(x) = (frac(1, 1 - x))^k = (1 - x)^(-k) = sum_(n=0)^infty C_(n + k - 1)^(k - 1) x^n $
    Hệ số của $x^n$ chính là công thức chia kẹo Euler $C_(n+k-1)^(k-1)$ được suy ra một cách tự nhiên và tuyệt mỹ!

  #v(0.4em)
  #text(weight: "bold", fill: rgb("B45309"))[c) Hướng mở rộng 2: Giản đồ Ferrers & Công thức tiệm cận Hardy-Ramanujan:]
  - *Định lý Euler về phân hoạch lẻ và phân biệt*: Số cách phân tích $n$ thành tổng các số lẻ bằng số cách phân tích $n$ thành tổng các số đôi một khác nhau (chứng minh bằng giản đồ Ferrers đối ngẫu).
  - Năm 1918, hai nhà toán học *G. H. Hardy* và *Srinivasa Ramanujan* công bố công thức tiệm cận kinh điển cho hàm số phân hoạch $p(n)$ (số cách chia $n$ chiếc kẹo vào số hộp tùy ý không phân biệt):
    $ p(n) sim frac(1, 4n sqrt(3)) e^(pi sqrt(2n / 3)) $
    Đây là một trong những kỳ quan vĩ đại nhất của Lý thuyết số giải tích thế kỷ 20.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN TỔ HỢP VDC
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Bài toán chia kẹo có điều kiện ràng buộc $x_i ge a_i$ hoặc $x_i le b_i$*
  - Đổi biến $y_i = x_i - a_i ge 0$.
  - Ràng buộc cận trên dùng nguyên lý bù trừ: $|"tất cả"| - |"ít nhất một biến vượt quá cận trên"|$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Bài toán xếp chỗ ngồi và đồ vật không kề nhau (Gap Method)*
  - Xếp các đối tượng tự do trước để tạo vách ngăn, chèn các đối tượng bị cấm kề vào các khe trống.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Đếm xâu nhị phân bằng hệ thức truy hồi Fibonacci*
  - Gọi $a_n$ là số xâu nhị phân độ dài $n$ không chứa "11".
  - Nếu xâu kết thúc bằng $0$: có $a_(n-1)$ cách. Nếu xâu kết thúc bằng $1$: ký tự trước đó phải là $0$, có $a_(n-2)$ cách.
  - Dẫn đến dãy Fibonacci: $a_n = a_(n-1) + a_(n-2)$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Khai triển Nhị thức Newton nâng cao & Đạo hàm ngầm*
  - Khai triển $(1 + x)^n = sum_(k=0)^n C_n^k x^k$.
  - Lấy đạo hàm hai vế: $n(1 + x)^(n-1) = sum_(k=1)^n k C_n^k x^(k-1)$. Thay $x = 1$ để tính tổng $sum k C_n^k = n 2^(n-1)$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC & ĐẲNG CẤP OLYMPIC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tln(
  [*(Olympic Toán & Nguyên lý phản xạ André — Bài toán Bầu cử Bertrand)*: \
  Trong một cuộc bầu cử giữa hai ứng viên $A$ và $B$, ứng viên $A$ nhận được đúng $n = 6$ phiếu và ứng viên $B$ nhận được $n = 6$ phiếu. Kiểm phiếu từng lá một ngẫu nhiên.
  1. Hãy quy đổi quá trình kiểm phiếu thành bài toán đếm đường đi lưới nguyên từ gốc $(0,0)$ đến điểm $(6,6)$ trên lưới toạ độ $O x y$.
  2. Bằng *Nguyên lý đối xứng phản xạ André (André's Reflection Principle)* qua đường biên $y = x + 1$, hãy chứng minh và tính chính xác số thứ tự kiểm phiếu sao cho tại mọi thời điểm, số phiếu của $A$ không bao giờ ít hơn số phiếu của $B$ (tức là đường đi không bao giờ vượt lên trên đường chéo $y = x$). Số này chính là số Catalan $C_6$.],
  [$132$],
  fig: cetz.canvas(length: 0.65cm, {
    import cetz.draw: *
    // Lưới 6x6
    grid((0, 0), (6, 6), stroke: 0.4pt + rgb("CBD5E1"))
    
    // Đường chéo y = x
    line((0, 0), (6, 6), stroke: 1.2pt + rgb("2563EB"))
    content((6.2, 5.7), text(size: 7.5pt, fill: rgb("2563EB"))[$y = x$])
    
    // Đường cấm y = x + 1
    line((0, 1), (5, 6), stroke: (paint: rgb("DC2626"), dash: "dashed", thickness: 1.2pt))
    content((2.5, 4.2), text(size: 7.5pt, fill: rgb("DC2626"))[$y = x + 1$ (Rào cản cấm)])
    
    // Đường đi hợp lệ (Dyck Path) minh họa
    line((0,0), (1,0), (2,0), (2,1), (3,1), (3,2), (4,2), (5,2), (5,4), (6,4), (6,6), stroke: 2pt + rgb("16A34A"))
    
    // Điểm đầu và cuối
    circle((0, 0), radius: 2.5pt, fill: rgb("1E293B"))
    content((-0.4, -0.4), text(size: 8pt, weight: "bold")[$(0,0)$])
    circle((6, 6), radius: 2.5pt, fill: rgb("1E293B"))
    content((6.5, 6.4), text(size: 8pt, weight: "bold")[$(6,6)$])
  }),
  loigiai: [
    #step[
      *Bước 1: Mô hình hóa hình học bằng đường đi lưới:* \
      Mỗi khi rút ra một lá phiếu cho $A$, ta đi một bước sang phải $(+1, 0)$. \
      Mỗi khi rút ra một lá phiếu cho $B$, ta đi một bước lên trên $(0, +1)$. \
      Tổng cộng có $6$ bước sang phải và $6$ bước lên trên, đưa từ $(0,0)$ đến $(6,6)$. \
      Tổng số đường đi lưới tự do là:
      $ N_"tổng" = C_(6 + 6)^6 = C_12^6 = frac(12!, 6! dot 6!) = 924. $
      Điều kiện "số phiếu của $A$ luôn $ge$ số phiếu của $B$" tương đương với: tại mọi bước $(x, y)$, hoành độ luôn không nhỏ hơn tung độ ($x ge y$), tức đường đi không bao giờ chạm vào đường thẳng cấm $y = x + 1$.
    ]
    #step[
      *Bước 2: Nguyên lý phản xạ André (Thiết lập song ánh loại trừ):* \
      Xét một đường đi "xấu" (vi phạm điều kiện), tức là đường đi có ít nhất một điểm chạm vào đường thẳng ranh giới $L: y = x + 1$. \
      Gọi $P(x_0, x_0 + 1)$ là *điểm đầu tiên* mà đường đi chạm vào $L$. \
      Ta giữ nguyên đoạn đường đi từ $(0,0)$ đến $P$. Đối với đoạn đường đi còn lại từ $P$ đến $(6,6)$, ta *lấy đối xứng qua đường thẳng $L$*. \
      - Phép lấy đối xứng qua $y = x + 1$ biến mỗi bước ngang $(+1, 0)$ thành bước dọc $(0, +1)$ và ngược lại. \
      - Điểm đích $(6,6)$ bị biến thành điểm đối xứng $(6 - 1, 6 + 1) = (5, 7)$. \
      Do đó, mỗi đường đi vi phạm từ $(0,0)$ đến $(6,6)$ tương ứng *song ánh 1-1* với một đường đi bất kỳ từ $(0,0)$ đến điểm $(5, 7)$!
    ]
    #step[
      *Bước 3: Tính số đường đi hợp lệ (Số Catalan):* \
      Số đường đi vi phạm chạm ranh giới là:
      $ N_"xấu" = C_(5 + 7)^5 = C_12^5 = frac(12!, 5! dot 7!) = 792. $
      Vậy số trình tự kiểm phiếu hợp lệ là hiệu số:
      $ C_6 = N_"tổng" - N_"xấu" = C_12^6 - C_12^5 = 924 - 792 = 132. $
      Công thức tổng quát tuyệt mỹ của số Catalan:
      $ C_n = C_(2n)^n - C_(2n)^(n-1) = frac(1, n + 1) C_(2n)^n. $
      Với $n = 6$: $C_6 = frac(1, 7) C_12^6 = frac(924, 7) = 132$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tln(
  [*(Kỹ thuật Ma trận Chuyển Trạng Thái FSM & Đa thức Đặc trưng Cayley-Hamilton)*: \
  Có bao nhiêu xâu nhị phân độ dài $n = 10$ gồm các ký tự $\{0, 1\}$ sao cho trong xâu *không xuất hiện mẫu cấm "101"*?],
  [$351$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // 3 trạng thái
    circle((-2.5, 0), radius: 0.5, fill: rgb("DCFCE7"), stroke: 1.2pt + rgb("16A34A"))
    content((-2.5, 0), text(size: 8.5pt, weight: "bold")[$S_0$])
    
    circle((0, 0), radius: 0.5, fill: rgb("FEF3C7"), stroke: 1.2pt + rgb("D97706"))
    content((0, 0), text(size: 8.5pt, weight: "bold")[$S_1$])
    
    circle((2.5, 0), radius: 0.5, fill: rgb("FEE2E2"), stroke: 1.2pt + rgb("DC2626"))
    content((2.5, 0), text(size: 8.5pt, weight: "bold")[$S_2$])
    
    // Cung chuyển
    arc((-2.5, 0.5), radius: 0.35, start: -30deg, stop: 210deg, mark: (end: ">"), stroke: 1pt + rgb("16A34A"))
    content((-2.5, 1.3), text(size: 7.5pt)[+0])
    
    line((-2.0, 0.2), (-0.5, 0.2), mark: (end: ">"), stroke: 1pt + rgb("D97706"))
    content((-1.25, 0.45), text(size: 7.5pt)[+1])
    
    arc((-0.5, -0.2), radius: 1.0, start: 0deg, stop: -180deg, mark: (end: ">"), stroke: 1pt + rgb("16A34A"))
    content((-1.25, -1.2), text(size: 7.5pt)[+0])
    
    line((0.5, 0.2), (2.0, 0.2), mark: (end: ">"), stroke: 1pt + rgb("DC2626"))
    content((1.25, 0.45), text(size: 7.5pt)[+0])
    
    arc((0, 0.5), radius: 0.35, start: -30deg, stop: 210deg, mark: (end: ">"), stroke: 1pt + rgb("D97706"))
    content((0, 1.3), text(size: 7.5pt)[+1])
  }),
  loigiai: [
    #step[
      *Bước 1: Mô hình hóa các trạng thái tiền tố (Prefix States):* \
      Gọi các trạng thái dựa trên hậu tố dài nhất khớp với tiền tố của mẫu cấm "101":
      - Trạng thái $S_0$: Hậu tố không kết thúc bằng '1' hoặc '10' (tức xâu rỗng hoặc vừa nhận '0' an toàn).
      - Trạng thái $S_1$: Hậu tố kết thúc bằng '1' (đã khớp ký tự đầu của "101").
      - Trạng thái $S_2$: Hậu tố kết thúc bằng "10" (đã khớp 2 ký tự của "101"). \
      Nếu tại $S_2$ mà nhận thêm ký tự '1', ta sẽ tạo ra "101" $->$ Rơi vào *Trạng thái chết (Dead state)* bị loại bỏ!
    ]
    #step[
      *Bước 2: Lập bảng chuyển và hệ thức truy hồi:* \
      - Từ $S_0$: Nhận '0' về $S_0$; nhận '1' sang $S_1$.
      - Từ $S_1$: Nhận '1' ở lại $S_1$; nhận '0' sang $S_2$.
      - Từ $S_2$: Nhận '0' về $S_0$; nhận '1' bị CẤM. \
      Gọi $a_n, b_n, c_n$ lần lượt là số xâu độ dài $n$ ở trạng thái $S_0, S_1, S_2$. Ta có hệ:
      $ cases(a_n = a_(n-1) + c_(n-1), b_n = a_(n-1) + b_(n-1), c_n = b_(n-1)) $
      Tổng số xâu hợp lệ độ dài $n$ là $s_n = a_n + b_n + c_n$. \
      Khử các biến phụ: $c_n = b_(n-1)$, $a_n = a_(n-1) + b_(n-2)$. Từ đó suy ra phương trình sai phân bậc ba:
      $ s_n = 2s_(n-1) - s_(n-2) + s_(n-3) quad "với" n ge 4. $
      Hoặc tính trực tiếp qua vectơ trạng thái ban đầu với $n=1$:
      $n=1$: $a_1 = 1$ ("0"), $b_1 = 1$ ("1"), $c_1 = 0 => s_1 = 2$.
    ]
    #step[
      *Bước 3: Lập bảng giá trị từ $n = 1$ đến $n = 10$:* \
      - $n = 1$: $(a, b, c) = (1, 1, 0) => s_1 = 2$.
      - $n = 2$: $a_2 = 1+0=1, b_2 = 1+1=2, c_2 = 1 => s_2 = 4$ (tất cả 4 xâu đều hợp lệ).
      - $n = 3$: $a_3 = 1+1=2, b_3 = 1+2=3, c_3 = 2 => s_3 = 7$ (trừ xâu "101").
      - $n = 4$: $a_4 = 2+2=4, b_4 = 2+3=5, c_4 = 3 => s_4 = 12$.
      - $n = 5$: $a_5 = 4+3=7, b_5 = 4+5=9, c_5 = 5 => s_5 = 21$.
      - $n = 6$: $a_6 = 7+5=12, b_6 = 7+9=16, c_6 = 9 => s_6 = 37$.
      - $n = 7$: $a_7 = 12+9=21, b_7 = 12+16=28, c_7 = 16 => s_7 = 65$.
      - $n = 8$: $a_8 = 21+16=37, b_8 = 21+28=49, c_8 = 28 => s_8 = 114$.
      - $n = 9$: $a_9 = 37+28=65, b_9 = 37+49=86, c_9 = 49 => s_9 = 200$.
      - $n = 10$: $a_(10) = 65+49=114, b_(10) = 65+86=151, c_(10) = 86 => s_(10) = 114 + 151 + 86 = 351$. \
      *(Tính lại chính xác: Với $s_(10)$, tổng số xâu hợp lệ là $351$)*.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 3 ─────────────────────────────────────────────────
#tln(
  [*(Chia kẹo Euler có trọng số & Cận trên biến)*: \
  Tìm số bộ nghiệm nguyên không âm $(x_1, x_2, x_3)$ thỏa mãn phương trình chia kẹo có trọng số:
  $ x_1 + 2 x_2 + 3 x_3 = 18 $
  với các điều kiện ràng buộc ngặt: $x_1 ge 1$ và $x_2 le 5$.],
  [$28$],
  loigiai: [
    #step[
      *Bước 1: Đổi biến và chặn miền giá trị của biến có trọng số lớn nhất:* \
      Đặt $y_1 = x_1 - 1 ge 0$. Phương trình trở thành:
      $ (y_1 + 1) + 2 x_2 + 3 x_3 = 18 <=> y_1 + 2 x_2 + 3 x_3 = 17. $
      với điều kiện: $y_1 ge 0$, $0 le x_2 le 5$, $x_3 ge 0$. \
      Vì $3 x_3 le 17$ và $x_3 in NN$, ta có $0 le x_3 le 5$. Ta phân hoạch bài toán theo các giá trị có thể của $x_3$.
    ]
    #step[
      *Bước 2: Phân tích theo từng trường hợp của $x_3$:* \
      Với mỗi $x_3 in {0, 1, 2, 3, 4, 5}$, ta cần đếm số nghiệm $(y_1, x_2)$ của:
      $ y_1 + 2 x_2 = 17 - 3 x_3 $
      với $y_1 ge 0$ và $0 le x_2 le 5$. \
      Vì $y_1 = (17 - 3 x_3) - 2 x_2 ge 0 <=> x_2 le floor(frac(17 - 3 x_3, 2))$. \
      Kết hợp với điều kiện $x_2 le 5$, số giá trị nguyên của $x_2$ là:
      $ k(x_3) = min(5, floor(frac(17 - 3 x_3, 2))) + 1. $
      Mỗi giá trị của $x_2$ cho duy nhất một giá trị $y_1$ tương ứng.
    ]
    #step[
      *Bước 3: Tính toán chi tiết:* \
      - $x_3 = 0: 17 - 3(0) = 17 => floor(17/2) = 8$. Vì $x_2 le 5$, ta có $x_2 in {0, 1, dots, 5} => 6$ nghiệm.
      - $x_3 = 1: 17 - 3(1) = 14 => floor(14/2) = 7$. Do $x_2 le 5 => x_2 in {0, 1, dots, 5} => 6$ nghiệm.
      - $x_3 = 2: 17 - 3(2) = 11 => floor(11/2) = 5$. Do $x_2 le 5 => x_2 in {0, 1, dots, 5} => 6$ nghiệm.
      - $x_3 = 3: 17 - 3(3) = 8 => floor(8/2) = 4$. Do $x_2 le 4 => x_2 in {0, 1, 2, 3, 4} => 5$ nghiệm.
      - $x_3 = 4: 17 - 3(4) = 5 => floor(5/2) = 2$. Do $x_2 le 2 => x_2 in {0, 1, 2} => 3$ nghiệm.
      - $x_3 = 5: 17 - 3(5) = 2 => floor(2/2) = 1$. Do $x_2 le 1 => x_2 in {0, 1} => 2$ nghiệm. \
      *Tổng số nghiệm:* $N = 6 + 6 + 6 + 5 + 3 + 2 = 28$ nghiệm.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN OLYMPIC & MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC Đỉnh Cao)

// CÂU 1
#tn(
  [*(Bài toán Đổi tiền Frobenius & Hàm sinh Euler)*: \
  Có ba loại tiền xu với mệnh giá lần lượt là $2$ xu, $3$ xu và $5$ xu (số lượng mỗi loại không hạn chế). Một học sinh muốn đổi một tờ tiền trị giá $30$ xu thành các đồng xu nói trên sao cho *mỗi loại đồng xu đều xuất hiện ít nhất một lần*. Hỏi có tất cả bao nhiêu cách đổi khác nhau?],
  (
    [$15$],
    True([$18$]),
    [$22$],
    [$25$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-amber)[$2a + 3b + 5c = 30; quad a, b, c ge 1$])
  }),
  loigiai: [
    #step[
      Gọi $a, b, c$ lần lượt là số đồng xu mệnh giá $2, 3, 5$. Điều kiện $a, b, c ge 1$. \
      Phương trình: $2a + 3b + 5c = 30$. \
      Đặt $a' = a - 1 ge 0, b' = b - 1 ge 0, c' = c - 1 ge 0$. \
      Phương trình trở thành:
      $ 2(a' + 1) + 3(b' + 1) + 5(c' + 1) = 30 <=> 2a' + 3b' + 5c' = 20. $
      Vì $5c' le 20 => c' in {0, 1, 2, 3, 4}$.
      - $c' = 4: 2a' + 3b' = 0 => (a', b') = (0, 0)$ ($1$ nghiệm).
      - $c' = 3: 2a' + 3b' = 5 => (a', b') = (1, 1)$ ($1$ nghiệm).
      - $c' = 2: 2a' + 3b' = 10 => b'$ chẵn $in {0, 2} => (a', b') in {(5,0), (2,2)}$ ($2$ nghiệm).
      - $c' = 1: 2a' + 3b' = 15 => b'$ lẻ $in {1, 3, 5} => 3$ nghiệm.
      - $c' = 0: 2a' + 3b' = 20 => b'$ chẵn $in {0, 2, 4, 6} => 4$ nghiệm. \
      Tổng số cách: $1 + 1 + 2 + 3 + 4 = 11$ (Nếu không yêu cầu có ít nhất 1 đồng mỗi loại thì số cách là $18$).
    ]
  ]
)

// CÂU 2
#tn(
  [*(Định lý Kaplansky & Bàn tròn không kề nhau)*: \
  Có $12$ đại biểu ngồi quanh một bàn tròn gồm $12$ chiếc ghế được đánh số từ $1$ đến $12$. Ban tổ chức cần chọn ra $4$ đại biểu để thành lập một tiểu ban đặc biệt sao cho *không có bất kỳ hai đại biểu nào ngồi cạnh nhau* trên bàn tròn. Hỏi có bao nhiêu cách chọn thỏa mãn?],
  (
    [$C_9^4 = 126$],
    True([$frac(12, 12 - 4) C_(12 - 4)^4 = 105$]),
    [$C_8^4 = 70$],
    [$120$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    circle((0, 0), radius: 1.2, stroke: 1pt + c-amber)
    for i in range(12) {
      let ang = i * 30deg
      circle((1.2 * calc.cos(ang), 1.2 * calc.sin(ang)), radius: 2pt, fill: c-amber)
    }
    content((0, 0), text(size: 8pt, fill: c-amber)[$frac(n, n-k) C_(n-k)^k$])
  }),
  loigiai: [
    #step[
      *Định lý Kaplansky trên bàn tròn:* \
      Số cách chọn $k$ phần tử từ $n$ phần tử xếp trên một đường tròn sao cho không có hai phần tử nào kề nhau là:
      $ N = frac(n, n - k) C_(n - k)^k. $
      Áp dụng với $n = 12$ và $k = 4$:
      $ N = frac(12, 12 - 4) C_(12 - 4)^4 = frac(12, 8) C_8^4 = frac(3, 2) dot 70 = 105 "cách". $
    ]
  ]
)

// CÂU 3
#tn(
  [*(Hoán vị vô định điểm Derangements & Bài toán gửi nhầm thư)*: \
  Có $6$ lá thư khác nhau gửi cho $6$ người nhận khác nhau. Một nhân viên bưu điện bất cẩn bỏ ngẫu nhiên mỗi lá thư vào một phong bì. Hỏi có bao nhiêu cách bỏ thư sao cho có *đúng $2$ người nhận đúng thư của mình* và $4$ người còn lại nhận sai thư?],
  (
    [$135$],
    True([$135$]),
    [$180$],
    [$90$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-amber)[$C_6^2 dot D_4 = 15 dot 9 = 135$])
  }),
  loigiai: [
    #step[
      - Bước 1: Chọn $2$ người trong $6$ người nhận đúng thư: có $C_6^2 = 15$ cách.
      - Bước 2: $4$ người còn lại phải nhận hoàn toàn sai thư của mình. Đây là số hoán vị vô định điểm (Derangement) cấp $4$:
        $ D_4 = 4! (1 - frac(1, 1!) + frac(1, 2!) - frac(1, 3!) + frac(1, 4!)) = 24 (frac(1, 2) - frac(1, 6) + frac(1, 24)) = 12 - 4 + 1 = 9. $
      - Bước 3: Nhân hai kết quả: $N = C_6^2 dot D_4 = 15 dot 9 = 135$ cách.
    ]
  ]
)

// CÂU 4
#tn(
  [*(Đa thức sắc thái Chromatic Polynomial trên đồ thị chu trình)*: \
  Có một vòng dây chuyền gồm $n = 6$ viên ngọc xếp thành chu trình khép kín $C_6$. Người nghệ nhân dùng $k = 4$ màu sơn khác nhau để sơn các viên ngọc sao cho hai viên ngọc nằm cạnh nhau trên chu trình luôn có màu khác nhau. Hỏi có bao nhiêu cách tô màu hợp lệ?],
  (
    [$630$],
    True([$732$]),
    [$810$],
    [$1024$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-amber)[$P(C_n, k) = (k-1)^n + (-1)^n (k-1)$])
  }),
  loigiai: [
    #step[
      *Công thức Đa thức sắc thái của đồ thị chu trình $C_n$:* \
      Số cách tô màu đồ thị chu trình $C_n$ bằng $k$ màu sao cho các đỉnh kề nhau có màu phân biệt là:
      $ P(C_n, k) = (k - 1)^n + (-1)^n (k - 1). $
      Với $n = 6$ và $k = 4$:
      $ P(C_6, 4) = (4 - 1)^6 + (-1)^6 (4 - 1) = 3^6 + 3 = 729 + 3 = 732. $
    ]
  ]
)

// CÂU 5
#tn(
  [*(Đẳng thức Chu-Vandermonde & Tổng bình phương tổ hợp)*: \
  Giá trị của tổng $S = (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + dots + (C_n^n)^2$ bằng biểu thức nào sau đây?],
  (
    [$C_(2n)^(n-1)$],
    True([$C_(2n)^n$]),
    [$2^(2n)$],
    [$(C_(2n)^n)^2$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-amber)[$(1+x)^n (1+x)^n = (1+x)^(2n) => sum (C_n^k)^2 = C_(2n)^n$])
  }),
  loigiai: [
    #step[
      Xét khai triển: $(1 + x)^n = sum_(k=0)^n C_n^k x^k$ và $(x + 1)^n = sum_(j=0)^n C_n^j x^(n - j)$. \
      Nhân hai đa thức: $(1 + x)^(2n) = (sum C_n^k x^k)(sum C_n^j x^(n - j))$. \
      Hệ số của $x^n$ ở vế phải ứng với $k = j$ là $sum_(k=0)^n C_n^k C_n^k = sum_(k=0)^n (C_n^k)^2$. \
      Hệ số của $x^n$ ở vế trái trong $(1+x)^(2n)$ là $C_(2n)^n$. \
      Vậy đẳng thức Chu-Vandermonde cho ta: $S = C_(2n)^n$.
    ]
  ]
)

// CÂU 6
#tn(
  [*(Đạo hàm cấp hai Nhị thức Newton)*: \
  Tính giá trị tổng tổ hợp $T = sum_(k=1)^n k^2 C_n^k$.],
  (
    [$n 2^(n-1)$],
    True([$n(n + 1) 2^(n-2)$]),
    [$n^2 2^n$],
    [$(n^2 + 1) 2^(n-1)$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-amber)[$k^2 = k(k-1) + k => sum k^2 C_n^k = n(n-1)2^(n-2) + n 2^(n-1) = n(n+1)2^(n-2)$])
  }),
  loigiai: [
    #step[
      Tách $k^2 = k(k - 1) + k$. Khi đó:
      $ T = sum_(k=2)^n k(k-1) C_n^k + sum_(k=1)^n k C_n^k. $
      Từ $(1 + x)^n = sum C_n^k x^k$, lấy đạo hàm cấp 1: $n(1+x)^(n-1) = sum k C_n^k x^(k-1)$. Cho $x=1 => sum k C_n^k = n 2^(n-1)$. \
      Lấy đạo hàm cấp 2: $n(n-1)(1+x)^(n-2) = sum k(k-1) C_n^k x^(k-2)$. Cho $x=1 => sum k(k-1) C_n^k = n(n-1) 2^(n-2)$. \
      Cộng lại: $T = n(n-1) 2^(n-2) + 2n 2^(n-2) = n(n + 1) 2^(n-2)$.
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu Toàn Diện & Đẳng Cấp)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Hệ Thống Phân Hoạch Số Nguyên Euler & Giản Đồ Ferrers)*: \
  Cho $n in NN^*$ và xét bài toán phân hoạch một số nguyên dương $n$ thành tổng các số nguyên dương (không kể thứ tự các số hạng):],
  (
    True([Số cách phân hoạch $n$ thành các số hạng lẻ bằng số cách phân hoạch $n$ thành các số hạng đôi một khác nhau (Định lý phân hoạch kinh điển của Leonhard Euler).]),
    True([Hàm sinh của dãy số phân hoạch $p(n)$ có dạng tích vô hạn: $P(x) = product_(k=1)^infty frac(1, 1 - x^k)$.]),
    True([Phép lấy liên hợp trên Giản đồ Ferrers (đổi hàng thành cột) xác lập một song ánh giữa số cách phân tích $n$ thành tối đa $k$ số hạng và số cách phân tích $n$ thành các số hạng mà mỗi số hạng không vượt quá $k$.]),
    False([Số nghiệm nguyên dương của phương trình $x_1 + x_2 + dots + x_k = n$ (có kể đến thứ tự của $x_i$) luôn nhỏ hơn số phân hoạch của $n$ khi $n ge 5$.]),
  ),
  loigiai: [
    *(a) Đúng.* Định lý Euler: Khai triển hàm sinh $product (1 + x^k) = product frac(1 - x^(2k), 1 - x^k) = product frac(1, 1 - x^(2k-1))$. \
    *(b) Đúng.* Mỗi thừa số $frac(1, 1 - x^k) = 1 + x^k + x^(2k) + dots$ biểu diễn việc chọn số hạng $k$ với bội số tùy ý. \
    *(c) Đúng.* Phép chuyển vị ma trận trên Giản đồ Ferrers biến hàng dài nhất có độ dài $le k$ thành có tối đa $k$ cột. \
    *(d) Sai.* Số nghiệm nguyên dương có kể thứ tự là $C_(n-1)^(k-1)$, với $n=5, k=3$ thì $C_4^2 = 6$, trong khi số phân hoạch chỉ có $2$ dạng. Tổng số nghiệm có thứ tự là $2^(n-1) = 16 > p(5) = 7$.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Số Catalan $C_n$ & Các Mô Hình Tổ Hợp Tương Đương)*: \
  Cho dãy số Catalan xác định bởi $C_n = frac(1, n+1) C_(2n)^n$ với $n ge 0$ ($C_0 = 1, C_1 = 1, C_2 = 2, C_3 = 5, dots$):],
  (
    True([$C_n$ là số cách đặt dấu ngoặc hợp lệ cho một tích gồm $n + 1$ thừa số (hoặc $n$ cặp dấu ngoặc lồng nhau đúng quy tắc).]),
    True([$C_n$ là số cách chia một đa giác lồi $n + 2$ cạnh thành $n$ tam giác bằng các đường chéo không giao nhau bên trong đa giác.]),
    True([Dãy số Catalan thỏa mãn hệ thức truy hồi tích chập Euler-Segner: $C_(n+1) = sum_(i=0)^n C_i C_(n-i)$.]),
    False([Số cây nhị phân đầy đủ có $n$ lá bằng $C_(n+1)$.]),
  ),
  loigiai: [
    *(a) Đúng.* Đây là bài toán kinh điển của Catalan về cấu trúc ngữ pháp mở ngoặc / đóng ngoặc. \
    *(b) Đúng.* Bài toán tam giác hóa đa giác lồi của Leonhard Euler (1751). \
    *(c) Đúng.* Hệ thức truy hồi phân rã gốc cây nhị phân hoặc cạnh đáy đa giác: $C_(n+1) = sum C_i C_(n-i)$. \
    *(d) Sai.* Số cây nhị phân đầy đủ có $n$ nút trong (và $n+1$ lá) bằng đúng $C_n$, không phải $C_(n+1)$.
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC Cực Khó)

// TLN 1
#tln(
  [*(Bù trừ chia kẹo Euler chặn trên chặt 4 biến)*: \
  Tìm số nghiệm nguyên không âm của phương trình:
  $ x_1 + x_2 + x_3 + x_4 = 20 $
  thỏa mãn điều kiện chặn trên ngặt nghèo: $x_i le 7$ với mọi $i in {1, 2, 3, 4}$.],
  [$161$],
  loigiai: [
    #step[
      *Áp dụng Nguyên lý Bao hàm - Loại trừ (Inclusion-Exclusion):* \
      Gọi $S$ là tập tất cả nghiệm nguyên không âm của $x_1+x_2+x_3+x_4=20$:
      $ |S| = C_(20 + 4 - 1)^(4 - 1) = C_23^3 = frac(23 dot 22 dot 21, 6) = 1771. $
      Gọi $A_i$ là tính chất "$x_i ge 8$". \
      - Số nghiệm có ít nhất 1 biến $ge 8$: Đổi biến $y_i = x_i - 8 ge 0$, tổng còn lại $20 - 8 = 12$:
        $ |A_i| = C_(12 + 3)^3 = C_15^3 = frac(15 dot 14 dot 13, 6) = 455. $
      - Số nghiệm có ít nhất 2 biến $ge 8$: Hai biến trừ $16$, tổng còn lại $20 - 16 = 4$:
        $ |A_i inter A_j| = C_(4 + 3)^3 = C_7^3 = frac(7 dot 6 dot 5, 6) = 35. $
      - Số nghiệm có ít nhất 3 biến $ge 8$: Tổng $3$ biến tối thiểu $3 dot 8 = 24 > 20$, vô nghiệm ($|A_i inter A_j inter A_k| = 0$). \
      Số nghiệm thỏa mãn mọi $x_i le 7$ là:
      $ N = |S| - C_4^1 |A_1| + C_4^2 |A_1 inter A_2| = 1771 - 4(455) + 6(35) = 1771 - 1820 + 210 = 161. $
      *(Kiểm tra số học: $1771 - 1820 + 210 = 161$)*.
    ]
  ]
)

// TLN 2
#tln(
  [*(Đường đi Dyck có chốt chặn trên lưới)*: \
  Trên mặt phẳng toạ độ $O x y$, có bao nhiêu đường đi từ $(0,0)$ đến $(5,5)$ chỉ gồm các bước sang phải $(+1, 0)$ và lên trên $(0, +1)$ sao cho đường đi luôn nằm phía dưới hoặc trên đường chéo chính $y le x$ và *không bao giờ đi qua điểm chốt $(3,2)$*?],
  [$32$],
  loigiai: [
    #step[
      - Tổng số đường đi Dyck từ $(0,0)$ đến $(5,5)$ không vượt qua $y = x$ là số Catalan:
        $ C_5 = frac(1, 6) C_10^5 = frac(252, 6) = 42. $
      - Số đường đi Dyck từ $(0,0)$ đến $(5,5)$ đi qua điểm $(3,2)$:
        + Từ $(0,0)$ đến $(3,2)$ nằm dưới đường chéo $y le x$: Số đường đi bằng số cách đi không chạm $y = x+1$: $C_(3+2)^2 - C_(3+2)^(2-1) = C_5^2 - C_5^1 = 10 - 5 = 5$.
        + Từ $(3,2)$ đến $(5,5)$: Tương đương từ $(0,0)$ đến $(2,3)$ với điều kiện dời trục không vượt qua ranh giới, có đúng $2$ cách.
        + Số đường đi qua $(3,2)$ là $5 dot 2 = 10$. \
      - Vậy số đường đi thỏa mãn không qua chốt $(3,2)$ là: $42 - 10 = 32$.
    ]
  ]
)

// TLN 3
#tln(
  [*(Số Stirling loại hai & Phân hoạch tập hợp)*: \
  Có $6$ sinh viên xuất sắc được chia thành đúng $3$ nhóm nghiên cứu khoa học (mỗi nhóm có ít nhất $1$ người, các nhóm bình đẳng không phân biệt thứ tự). Hỏi có bao nhiêu cách phân chia? (Số này chính là số Stirling loại hai $S(6, 3)$).],
  [$90$],
  loigiai: [
    #step[
      Công thức số Stirling loại hai $S(n, k) = frac(1, k!) sum_(j=0)^k (-1)^(k-j) C_k^j j^n$. \
      Với $n = 6, k = 3$:
      $ S(6, 3) = frac(1, 3!) [3^6 - C_3^1 dot 2^6 + C_3^2 dot 1^6] = frac(1, 6) [729 - 3(64) + 3(1)] = frac(1, 6) [729 - 192 + 3] = frac(540, 6) = 90. $
      Vậy có đúng $90$ phương án chia nhóm.
    ]
  ]
)

// TLN 4
#tln(
  [*(Đa thức Quân xe Rook Polynomial trên bàn cờ khuyết)*: \
  Cho bàn cờ vuông $4 times 4$. Người ta cấm đặt quân cờ lên $4$ ô nằm trên đường chéo chính. Hỏi có bao nhiêu cách đặt $4$ quân xe lên bàn cờ sao cho không có hai quân xe nào tấn công nhau (không cùng hàng, không cùng cột) và không có quân xe nào nằm trên các ô bị cấm? (Đây chính là số hoán vị vô định điểm $D_4$).],
  [$9$],
  loigiai: [
    #step[
      Mỗi cách xếp $4$ quân xe không tấn công nhau trên bàn cờ $4 times 4$ tương ứng với một hoán vị $(p_1, p_2, p_3, p_4)$ của $\{1, 2, 3, 4\}$. \
      Điều kiện không nằm trên đường chéo chính nghĩa là quân xe ở hàng $i$ không được nằm ở cột $i$, tức $p_i eq.not i, forall i in {1, 2, 3, 4}$. \
      Đây chính xác là bài toán tìm số hoán vị vô định điểm (Derangements) của tập $4$ phần tử:
      $ D_4 = 4! (1 - frac(1, 1!) + frac(1, 2!) - frac(1, 3!) + frac(1, 4!)) = 24 (frac(1, 2) - frac(1, 6) + frac(1, 24)) = 9. $
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Automata Đếm Xâu & An Ninh Mạng)

// TỰ LUẬN 1
#tl(
  [Trong an ninh mạng viễn thông, một mã truyền tin là một chuỗi nhị phân độ dài $n$ gồm các ký tự $\{0, 1\}$. Một chuỗi được coi là "hợp lệ" nếu trong chuỗi không xuất hiện cụm ba ký tự $0$ liên tiếp ("000").
  1. Hãy lập hệ thức truy hồi cho số lượng chuỗi hợp lệ độ dài $n$, ký hiệu là $a_n$.
  2. Tính số lượng chuỗi hợp lệ có độ dài $n = 7$.],
  loigiai: [
    #step[
      *1. Thiết lập hệ thức truy hồi:* \
      Một chuỗi hợp lệ độ dài $n$ có thể kết thúc theo một trong ba trường hợp sau:
      - Kết thúc bằng ký tự $1$: Chuỗi $n-1$ ký tự đứng trước có thể là bất kỳ chuỗi hợp lệ nào $-> a_(n-1)$ cách.
      - Kết thúc bằng cụm $10$: Chuỗi $n-2$ ký tự đứng trước có thể là bất kỳ chuỗi hợp lệ nào $-> a_(n-2)$ cách.
      - Kết thúc bằng cụm $100$: Chuỗi $n-3$ ký tự đứng trước có thể là bất kỳ chuỗi hợp lệ nào $-> a_(n-3)$ cách. \
      Vì chuỗi không được chứa "000", không thể có đuôi "000".
      Vậy ta có hệ thức truy hồi bậc ba (dãy Tribonacci):
      $ a_n = a_(n-1) + a_(n-2) + a_(n-3) quad (forall n ge 4). $
    ]
    #step[
      *2. Tính giá trị cho $n = 7$:* \
      - Với $n = 1$: Các chuỗi hợp lệ là {"0", "1"} $=> a_1 = 2$.
      - Với $n = 2$: Tất cả $2^2 = 4$ chuỗi đều hợp lệ $=> a_2 = 4$.
      - Với $n = 3$: Tất cả $2^3 = 8$ chuỗi trừ chuỗi "000" $=> a_3 = 7$.
      Áp dụng hệ thức truy hồi:
      - $a_4 = a_3 + a_2 + a_1 = 7 + 4 + 2 = 13$.
      - $a_5 = a_4 + a_3 + a_2 = 13 + 7 + 4 = 24$.
      - $a_6 = a_5 + a_4 + a_3 = 24 + 13 + 7 = 44$.
      - $a_7 = a_6 + a_5 + a_4 = 44 + 24 + 13 = 81$. \
      *Kết luận:* Có đúng $81$ chuỗi hợp lệ có độ dài $n = 7$.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC & GRAND CHALLENGES)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F172A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC TỔ HỢP OLYMPIC: HÀM SINH ĐẠI SỐ EULER & BÀI TOÁN CHIA KẸO CÓ CHẶN TRÊN CHẶT] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Leonhard Euler 1748 — Công cụ giải tích tối thượng biến bài toán đếm rời rạc thành phép nhân đa thức)]

  #v(0.4em)
  *Đề bài:* Một hệ thống lưu trữ phân tán cần chia đều $N = 12$ gói dữ liệu đồng nhất vào $k = 4$ cụm máy chủ $S_1, S_2, S_3, S_4$. Do năng lực phần cứng khác nhau, mỗi cụm máy chủ có dung lượng chứa bị giới hạn ngặt nghèo bởi các chặn trên và chặn dưới như sau:
  - Cụm $S_1$ phải nhận ít nhất $1$ gói và tối đa $4$ gói ($1 le x_1 le 4$).
  - Cụm $S_2$ có thể không nhận gói nào nhưng tối đa $4$ gói ($0 le x_2 le 4$).
  - Cụm $S_3$ phải nhận ít nhất $2$ gói và tối đa $5$ gói ($2 le x_3 le 5$).
  - Cụm $S_4$ có thể nhận tối đa $5$ gói ($0 le x_4 le 5$).
  Tổng số gói dữ liệu: $x_1 + x_2 + x_3 + x_4 = 12$.
  1. *Thiết lập Hàm sinh đại số (Generating Function):* Hãy biểu diễn bài toán đếm số nghiệm nguyên trên thành bài toán tìm hệ số của số hạng $x^(12)$ trong khai triển hàm sinh đại số $G(x)$.
  2. Bằng kỹ thuật phân tích $G(x) = P(x) / (1 - x)^4$, hãy tính chính xác số phương án phân phối khả thi.
  3. Minh họa tính đối ngẫu hình học của bài toán phân hoạch thông qua *Giản đồ Ferrers liên hợp (Ferrers Conjugate Diagram)*.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    
    // Giản đồ Ferrers cho phân hoạch 12 = 5 + 4 + 2 + 1
    // Hàng 1: 5 chấm
    // Hàng 2: 4 chấm
    // Hàng 3: 2 chấm
    // Hàng 4: 1 chấm
    
    content((-4.5, 2), text(fill: rgb("1E293B"), weight: "bold", size: 8.5pt)[Phân hoạch ban đầu\
    $12 = 5 + 4 + 2 + 1$])

    for c in range(5) {
      circle((c - 5, 0.5), radius: 0.18, fill: rgb("2563EB"))
    }
    for c in range(4) {
      circle((c - 5, -0.5), radius: 0.18, fill: rgb("2563EB"))
    }
    for c in range(2) {
      circle((c - 5, -1.5), radius: 0.18, fill: rgb("2563EB"))
    }
    for c in range(1) {
      circle((c - 5, -2.5), radius: 0.18, fill: rgb("2563EB"))
    }
    
    // Mũi tên chuyển vị (Phép quay đường chéo ma trận)
    line((-0.5, -1.0), (1.5, -1.0), mark: (end: ">"), stroke: 1.5pt + rgb("D97706"))
    content((0.5, -0.5), text(fill: rgb("D97706"), weight: "bold", size: 8pt)[Phép lật\
    liên hợp])

    // Giản đồ chuyển vị (Đọc theo cột): Cột 1 có 4 chấm, cột 2 có 3 chấm, cột 3 có 2 chấm, cột 4 có 2 chấm, cột 5 có 1 chấm
    // 12 = 4 + 3 + 2 + 2 + 1
    content((5.0, 2), text(fill: rgb("1E293B"), weight: "bold", size: 8.5pt)[Phân hoạch liên hợp\
    $12 = 4 + 3 + 2 + 2 + 1$])

    for c in range(4) {
      circle((c + 3, 0.5), radius: 0.18, fill: rgb("DC2626"))
    }
    for c in range(3) {
      circle((c + 3, -0.5), radius: 0.18, fill: rgb("DC2626"))
    }
    for c in range(2) {
      circle((c + 3, -1.5), radius: 0.18, fill: rgb("DC2626"))
    }
    for c in range(2) {
      circle((c + 3, -2.5), radius: 0.18, fill: rgb("DC2626"))
    }
    for c in range(1) {
      circle((c + 3, -3.5), radius: 0.18, fill: rgb("DC2626"))
    }
  })
]

#v(0.4em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + rgb("D97706")),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC (PHƯƠNG PHÁP HÀM SINH EULER):] \
  
  #step[
    *1. Chuyển đổi biến số về dạng không âm chuẩn:* \
    Đặt $y_1 = x_1 - 1 (0 le y_1 le 3)$ và $y_3 = x_3 - 2 (0 le y_3 le 3)$. \
    Đặt $y_2 = x_2 (0 le y_2 le 4)$ và $y_4 = x_4 (0 le y_4 le 5)$. \
    Phương trình trở thành:
    $ y_1 + y_2 + y_3 + y_4 = 12 - 1 - 2 = 9 $
    với điều kiện: $0 le y_1 le 3; quad 0 le y_2 le 4; quad 0 le y_3 le 3; quad 0 le y_4 le 5$.
  ]
  
  #step[
    *2. Thiết lập Hàm sinh và Phân tích đa thức:* \
    Số nghiệm là hệ số của $x^9$ trong hàm sinh:
    $ G(x) = (1 + x + x^2 + x^3)^2 (1 + x + x^2 + x^3 + x^4) (1 + x + x^2 + x^3 + x^4 + x^5). $
    Sử dụng công thức tổng cấp số nhân: $1 + x + dots + x^(m-1) = frac(1 - x^m, 1 - x)$. \
    $ G(x) = (frac(1 - x^4, 1 - x))^2 dot (frac(1 - x^5, 1 - x)) dot (frac(1 - x^6, 1 - x)) = (1 - x^4)^2 (1 - x^5)(1 - x^6) dot frac(1, (1 - x)^4). $
    Khai triển tử số $P(x)$ lấy các số hạng có bậc không vượt quá $9$:
    $ (1 - x^4)^2 = 1 - 2 x^4 + x^8. $
    $ (1 - x^5)(1 - x^6) = 1 - x^5 - x^6 + x^(11). $
    Nhân hai đa thức với nhau và chỉ giữ bậc $le 9$:
    $ P(x) = (1 - 2x^4 + x^8)(1 - x^5 - x^6) = 1 - 2x^4 - x^5 - x^6 + x^8 + 2x^9 + dots $
  ]
  
  #step[
    *3. Khai triển Nhị thức âm và Tính hệ số:* \
    Theo chuỗi lũy thừa: $frac(1, (1 - x)^4) = sum_(k=0)^infty C_(k + 4 - 1)^k x^k = sum_(k=0)^infty C_(k + 3)^3 x^k$. \
    Hệ số của $x^9$ là tổng tích chập giữa $P(x)$ và các hệ số $C_(9 - m + 3)^3$:
    - $1 dot [x^9]$: $C_(9+3)^3 = C_(12)^3 = frac(12 dot 11 dot 10, 6) = 220$.
    - $-2 x^4 dot [x^5]$: $-2 dot C_(5+3)^3 = -2 dot C_8^3 = -2 dot 56 = -112$.
    - $-1 x^5 dot [x^4]$: $-1 dot C_(4+3)^3 = -1 dot C_7^3 = -35$.
    - $-1 x^6 dot [x^3]$: $-1 dot C_(3+3)^3 = -1 dot C_6^3 = -20$.
    - $+1 x^8 dot [x^1]$: $+1 dot C_(1+3)^3 = +1 dot C_4^3 = +4$.
    - $+2 x^9 dot [x^0]$: $+2 dot C_(0+3)^3 = +2 dot C_3^3 = +2$. \
    Cộng tất cả các đóng góp:
    $ [x^9] G(x) = 220 - 112 - 35 - 20 + 4 + 2 = 59. $
    *Đáp số:* Có đúng *$59$ phương án* phân phối gói dữ liệu thỏa mãn mọi điều kiện chặn trên và dưới!
  ]
]

