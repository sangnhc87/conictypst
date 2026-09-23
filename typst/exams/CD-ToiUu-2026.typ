// ================================================================
// File: nang-cao-chi-phi-an.typ
// Chuyên đề nâng cấp: Chi phí ẩn – bài toán hay và khó
// ================================================================

#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../bbt.typ": bbt-opt

// ------------------------------------------------
// CẤU HÌNH CƠ BẢN
// ------------------------------------------------
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

// Hiển thị phân số nội dòng (inline) to và dễ nhìn hơn
#show math.frac: math.display
// Tăng nhẹ cỡ chữ của phương trình tách dòng
#show math.equation.where(block: true): set text(size: 1.12em)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ------------------------------------------------
// MÀU SẮC VÀ HỘP TRÌNH BÀY
// ------------------------------------------------
#let navy = rgb("163A5F")
#let blue = rgb("1565C0")
#let orange = rgb("E67E22")
#let green = rgb("1E8449")
#let red = rgb("C0392B")
#let purple = rgb("6C3483")

#let advanced-box(title: "Nhận xét nâng cao", body) = block(
  width: 100%,
  fill: rgb("F4F0FA"),
  stroke: (left: 4pt + purple, rest: 0.7pt + rgb("D7BDE2")),
  radius: 6pt,
  inset: (x: 14pt, y: 11pt),
)[
  #text(fill: purple, weight: "bold")[🧠 #title]
  #v(0.35em)
  #body
]

#let answer-box(body) = block(
  width: 100%,
  fill: rgb("EAFAF1"),
  stroke: (left: 4pt + green, rest: 0.7pt + rgb("A9DFBF")),
  radius: 6pt,
  inset: (x: 14pt, y: 11pt),
)[
  #text(fill: green, weight: "bold")[✅ Kết luận]
  #v(0.35em)
  #body
]

#let warning-box(body) = block(
  width: 100%,
  fill: rgb("FDF2E9"),
  stroke: (left: 4pt + orange, rest: 0.7pt + rgb("F5CBA7")),
  radius: 6pt,
  inset: (x: 14pt, y: 11pt),
)[
  #text(fill: orange, weight: "bold")[⚠️ Bẫy tư duy]
  #v(0.35em)
  #body
]

// ================================================================
// TRANG MỞ ĐẦU
// ================================================================
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(navy, rgb("1F618D"), navy, angle: 135deg),
    radius: 12pt,
    inset: (x: 22pt, y: 22pt),
  )[
    #text(fill: rgb("F4D03F"), size: 10.5pt, weight: "bold", tracking: 2pt)[
      CHUYÊN ĐỀ NÂNG CAO — TỐI ƯU HÓA CHI PHÍ VẬN TẢI
    ]

    #v(0.8em)

    #text(fill: white, size: 22pt, weight: "bold")[
      Chi Phí Ẩn Và Các Mô Hình Tối Ưu Phức Hợp
    ]

    #v(0.45em)

    #text(fill: rgb("D6EAF8"), size: 12pt, style: "italic")[
      Hàm mũ tổng quát · Ràng buộc thời gian · Nhiều chặng · Minimax
    ]

    #v(1em)

    #line(length: 60%, stroke: 0.7pt + rgb("F4D03F"))

    #v(0.8em)

    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 0.7em,

      align(center)[
        #text(fill: rgb("F4D03F"), weight: "bold")[I. LŨY THỪA TỔNG QUÁT]
        #linebreak()
        #text(fill: rgb("D5DBDB"), size: 8.5pt)[
          $a v^p + b/v$
        ]
      ],

      align(center)[
        #text(fill: rgb("F4D03F"), weight: "bold")[II. HÀM TỪNG ĐOẠN]
        #linebreak()
        #text(fill: rgb("D5DBDB"), size: 8.5pt)[
          Phạt trễ hạn
        ]
      ],

      align(center)[
        #text(fill: rgb("F4D03F"), weight: "bold")[III. NHIỀU CHẶNG]
        #linebreak()
        #text(fill: rgb("D5DBDB"), size: 8.5pt)[
          Nhiều vận tốc
        ]
      ],

      align(center)[
        #text(fill: rgb("F4D03F"), weight: "bold")[IV. MINIMAX]
        #linebreak()
        #text(fill: rgb("D5DBDB"), size: 8.5pt)[
          Tối ưu bền vững
        ]
      ],
    )
  ]
]

#v(1.5em)

// ================================================================
// PHẦN I
// ================================================================
= Dạng VI — Mô Hình Lũy Thừa Tổng Quát

== Phân Tích Mô Hình Toán Học

Trong các bài toán tối ưu vận tải cơ bản, hàm tổng chi phí thường được mô hình hóa dưới dạng:

$
  C(v) = a v^2 + frac(b, v).
$

Tuy nhiên, trong các lĩnh vực yêu cầu tốc độ cao như đua xe, đường sắt cao tốc hay hàng không, chi phí nhiên liệu tăng vọt theo hàm số lũy thừa bậc cao của vận tốc. Khi đó, ta xét mô hình tổng quát:

$
  C(v) = a v^p + frac(b, v) + c,
  quad a > 0, b > 0, p > 0.
$

Trong đó:

- $a v^p$: chi phí nhiên liệu hoặc hao mòn tăng theo vận tốc;
- $b/v$: chi phí thời gian;
- $c$: chi phí cố định, không phụ thuộc vào vận tốc.

#advanced-box(title: "Định lý tối ưu cho mô hình lũy thừa tổng quát")[
  Ta có:

  $
    C'(v) = p a v^(p - 1) - frac(b, v^2).
  $

  Điều kiện cực tiểu là:

  $
    p a v_0^(p + 1) = b.
  $

  Do đó:

  $
    v_0 = root(p + 1, frac(b, p a)).
  $

  Tại vận tốc tối ưu:

  $
    frac(b, v_0) = p a v_0^p.
  $

  Điều này dẫn đến tỉ lệ tối ưu giữa chi phí nhiên liệu và chi phí thời gian là:

  $
    C_"nhiên liệu" : C_"thời gian" = 1 : p.
  $
]

#tln(
  id: "2D1NC-1",
  [Một tàu cao tốc chạy trên một tuyến biển. Tổng chi phí của chuyến đi được mô hình hóa bởi:

  $
    C(v) = 0.01v^3 + frac(16000, v),
    quad v in (0, 50].
  $

  Trong đó $v$ tính bằng km/h và $C(v)$ tính bằng nghìn đồng.

  + Tìm vận tốc tối ưu.
  + Tính chi phí tối thiểu.
  + Xác định tỉ lệ giữa chi phí nhiên liệu và chi phí thời gian tại vận tốc tối ưu.],
  [$v_0 approx 27.03$ km/h; $C_min approx 789.4$ nghìn đồng; tỉ lệ $1:3$],
  loigiai: [
    Đây là hàm dạng:

    $
      C(v) = a v^p + frac(b, v)
    $

    với:

    $
      a = 0.01, quad p = 3, quad b = 16000.
    $

    *Bước 1 — Lấy đạo hàm:*

    $
      C'(v) = 0.03v^2 - frac(16000, v^2).
    $

    Điều kiện cực tiểu:

    $
      0.03v^2 - frac(16000, v^2) = 0.
    $

    Nhân hai vế với $v^2 > 0$:

    $
      0.03v^4 = 16000.
    $

    Suy ra:

    $
      v^4 = frac(16000, 0.03)
      = frac(1600000, 3)
      approx 533333.33.
    $

    $
      v_0 = root(4, 533333.33) approx 27.03.
    $

    Vì $27.03 < 50$, vận tốc này thuộc miền cho phép.

    *Bước 2 — Tính chi phí tối thiểu.*

    Tại điểm tối ưu:

    $
      frac(16000, v_0) = 3 dot 0.01v_0^3 = 0.03v_0^3.
    $

    Do đó:

    $
      C_min
      = 0.01v_0^3 + frac(16000, v_0)
      = 0.01v_0^3 + 0.03v_0^3
      = 0.04v_0^3.
    $

    Với $v_0 approx 27.03$:

    $
      C_min approx 789.4.
    $

    *Bước 3 — Tỉ lệ chi phí.*

    Vì $p = 3$, tại điểm tối ưu:

    $
      C_"thời gian" = 3C_"nhiên liệu".
    $

    #answer-box[
      Vận tốc tối ưu là $v_0 approx 27.03$ km/h.

      Chi phí tối thiểu là $C_min approx 789.4$ nghìn đồng.

      Tại vận tốc tối ưu:

      $
        C_"nhiên liệu" : C_"thời gian" = 1 : 3.
      $
    ]
  ],
)

// #warning-box[
//   Với hàm $C(v) = a v^p + b/v$, tỉ lệ tối ưu không còn luôn là $1:2$.

//   - Nếu $p = 2$ thì tỉ lệ là $1:2$.
//   - Nếu $p = 3$ thì tỉ lệ là $1:3$.
//   - Nếu $p = 4$ thì tỉ lệ là $1:4$.
// ]

// ================================================================
// PHẦN II
// ================================================================
= Dạng VII — Hàm Chi Phí Từng Đoạn Và Phạt Vi Phạm Hợp Đồng

== Phân Tích Mô Hình Toán Học

Trong thực tiễn vận tải, các hợp đồng thường đi kèm với điều khoản phạt vi phạm nếu thời gian giao hàng vượt quá cam kết.

Giả sử, nếu thời gian di chuyển vượt quá $T$ giờ, doanh nghiệp phải chịu thêm khoản tiền phạt tỉ lệ thuận với thời gian trễ:

$
  P(v) = q (frac(S, v) - T).
$

Khi đó hàm chi phí thường trở thành hàm từng đoạn.

#tln(
  id: "2D1NC-2",
  [Một xe tải đi quãng đường $100$ km. Chi phí cơ bản là:

  $
    C_0(v) = 0.2v^2 + frac(3200, v)
  $

  (nghìn đồng), với $v in (0, 60]$.

  Công ty cam kết giao hàng trong tối đa $5$ giờ. Nếu giao muộn, công ty bị phạt $600$ nghìn đồng cho mỗi giờ muộn.

  + Lập hàm tổng chi phí $C(v)$.
  + Tìm vận tốc để tổng chi phí nhỏ nhất.
  + Tính chi phí tối thiểu.],
  [$v = 20$ km/h; $C_min = 240$ nghìn đồng],
  loigiai: [
    *Bước 1 — Xác định thời điểm bị phạt.*

    Thời gian di chuyển là:

    $
      t = frac(100, v).
    $

    Xe không bị phạt khi:

    $
      frac(100, v) <= 5.
    $

    $
      v >= 20.
    $

    Vậy:

    - Nếu $v >= 20$: không bị phạt.
    - Nếu $0 < v < 20$: bị phạt vì giao hàng muộn.

    *Bước 2 — Lập hàm chi phí từng đoạn.*

    Nếu $v >= 20$:

    $
      C(v) = 0.2v^2 + frac(3200, v).
    $

    Nếu $0 < v < 20$, số giờ trễ là:

    $
      frac(100, v) - 5.
    $

    Chi phí phạt là:

    $
      600 (frac(100, v) - 5).
    $

    Do đó:

    $
      C(v)
      = 0.2v^2 + frac(3200, v)
      + 600 (frac(100, v) - 5).
    $

    Rút gọn:

    $
      C(v)
      = 0.2v^2 + frac(63200, v) - 3000,
      quad 0 < v < 20.
    $

    Vậy:

    $
      C(v) =
      cases(
        0.2v^2 + frac(63200, v) - 3000, & 0 < v < 20,
        0.2v^2 + frac(3200, v), & 20 <= v <= 60.
      )
    $

    *Bước 3 — Xét trên khoảng $0 < v < 20$.*

    $
      C'(v)
      = 0.4v - frac(63200, v^2).
    $

    Với $0 < v < 20$:

    $
      0.4v^3 < 0.4 dot 20^3 = 3200 < 63200.
    $

    Suy ra:

    $
      0.4v - frac(63200, v^2) < 0.
    $

    Do đó $C(v)$ giảm trên $(0, 20)$.

    *Bước 4 — Xét trên đoạn $[20, 60]$.*

    $
      C'(v) = 0.4v - frac(3200, v^2).
    $

    $
      C'(v) = 0
      =>
      0.4v^3 = 3200
      =>
      v^3 = 8000
      =>
      v = 20.
    $

    Trên $[20, 60]$, hàm số tăng từ $v = 20$.

    Vì hàm giảm trước $20$ và tăng sau $20$, nên chi phí nhỏ nhất đạt tại $v = 20$.

    $
      C_min = C(20)
      = 0.2 dot 20^2 + frac(3200, 20)
      = 80 + 160
      = 240.
    $

    #answer-box[
      Xe nên chạy với vận tốc $20$ km/h.

      Đây chính là vận tốc vừa đủ để giao hàng đúng hạn, không bị phạt.

      Chi phí tối thiểu là:

      $
        C_min = 240
      $

      nghìn đồng.
    ]
  ],
)

// ================================================================
// PHẦN III
// ================================================================
= Dạng VIII — Tối Ưu Hóa Hành Trình Đa Chặng

== Nguyên Tắc Tối Ưu Độc Lập

Khi một hành trình được chia thành nhiều chặng với các điều kiện vận hành khác nhau (địa hình, giới hạn tốc độ, tiêu hao nhiên liệu), việc áp dụng một vận tốc duy nhất cho toàn tuyến là không hiệu quả. Ta cần xác định vận tốc tối ưu riêng biệt cho từng chặng.

Với chặng thứ $i$, giả sử hàm chi phí là:

$
  C_i(v_i) = S_i alpha_i v_i^2 + frac(k S_i, v_i).
$

Khi đó tổng chi phí là:

$
  C = sum_i C_i(v_i).
$

Do các biến $v_i$ tách riêng, ta tối ưu từng chặng độc lập.

#tln(
  id: "2D1NC-3",
  [Một xe vận tải đi qua hai chặng đường:

  - Chặng 1: dài $60$ km, hệ số nhiên liệu là $alpha_1 = 0.04$.
  - Chặng 2: dài $40$ km, hệ số nhiên liệu là $alpha_2 = 0.01$.
  - Chi phí lái xe và vận hành là $k = 32$ nghìn đồng mỗi giờ.

  Giả sử chi phí ở từng chặng có dạng:

  $
    C_i(v_i) = S_i alpha_i v_i^2 + frac(k S_i, v_i).
  $

  Hãy tìm vận tốc tối ưu $v_1$, $v_2$ cho từng chặng và tính tổng chi phí nhỏ nhất.],
  [$v_1 approx 7.37$ km/h; $v_2 approx 11.70$ km/h; $C_min approx 555.0$ nghìn đồng],
  loigiai: [
    *Chặng 1:*

    $
      C_1(v_1)
      = 60 dot 0.04v_1^2 + frac(32 dot 60, v_1).
    $

    $
      C_1(v_1)
      = 2.4v_1^2 + frac(1920, v_1).
    $

    $
      C_1'(v_1)
      = 4.8v_1 - frac(1920, v_1^2).
    $

    $
      C_1'(v_1) = 0
      =>
      4.8v_1^3 = 1920
      =>
      v_1^3 = 400.
    $

    $
      v_1 = root(3, 400) approx 7.37.
    $

    *Chặng 2:*

    $
      C_2(v_2)
      = 40 dot 0.01v_2^2 + frac(32 dot 40, v_2).
    $

    $
      C_2(v_2)
      = 0.4v_2^2 + frac(1280, v_2).
    $

    $
      C_2'(v_2)
      = 0.8v_2 - frac(1280, v_2^2).
    $

    $
      C_2'(v_2) = 0
      =>
      0.8v_2^3 = 1280
      =>
      v_2^3 = 1600.
    $

    $
      v_2 = root(3, 1600) approx 11.70.
    $

    *Tính chi phí tối thiểu.*

    Ở chặng 1:

    $
      C_"1,min"
      = 3 dot 2.4v_1^2
      approx 3 dot 2.4 dot 7.37^2
      approx 390.9.
    $

    Ở chặng 2:

    $
      C_"2,min"
      = 3 dot 0.4v_2^2
      approx 3 dot 0.4 dot 11.70^2
      approx 164.2.
    $

    Vậy:

    $
      C_min
      = C_"1,min" + C_"2,min"
      approx 390.9 + 164.2
      approx 555.1.
    $

    #answer-box[
      Vận tốc tối ưu ở chặng 1:

      $
        v_1 approx 7.37
      $

      km/h.

      Vận tốc tối ưu ở chặng 2:

      $
        v_2 approx 11.70
      $

      km/h.

      Tổng chi phí nhỏ nhất xấp xỉ:

      $
        C_min approx 555.1
      $

      nghìn đồng.
    ]
  ],
)

// ================================================================
// PHẦN IV
// ================================================================
= Dạng IX — Bài Toán Ngược Có Chi Phí Cố Định

#tln(
  id: "2D1NC-4",
  [Một doanh nghiệp có hàm chi phí:

  $
    C(v) = a v^2 + frac(b, v) + 225.
  $

  Biết rằng chi phí nhỏ nhất là $900$ nghìn đồng và đạt được khi $v_0 = 15$ km/h.

  + Tìm $a$ và $b$.
  + Nếu doanh nghiệp cải tiến động cơ, làm hệ số $a$ giảm $20%$ nhưng $b$ và chi phí cố định không đổi, hãy tìm vận tốc tối ưu mới và chi phí tối thiểu mới.],
  [$a = 1$, $b = 6750$; $v_0' approx 16.16$ km/h; $C_min' approx 851.8$ nghìn đồng],
  loigiai: [
    *Bước 1 — Loại chi phí cố định.*

    Chi phí biến đổi tối thiểu là:

    $
      900 - 225 = 675.
    $

    Do đó:

    $
      a v_0^2 + frac(b, v_0) = 675.
    $

    Tại điểm tối ưu của mô hình $a v^2 + b/v$:

    $
      C_"min, bien doi" = 3a v_0^2.
    $

    Thay $v_0 = 15$:

    $
      3a dot 15^2 = 675.
    $

    $
      675a = 675.
    $

    $
      a = 1.
    $

    *Bước 2 — Tìm $b$.*

    Từ điều kiện cực tiểu:

    $
      b = 2a v_0^3.
    $

    $
      b = 2 dot 1 dot 15^3 = 6750.
    $

    Vậy hàm chi phí ban đầu là:

    $
      C(v) = v^2 + frac(6750, v) + 225.
    $

    *Bước 3 — Sau khi cải tiến động cơ.*

    Hệ số $a$ giảm $20%$:

    $
      a' = 0.8a = 0.8.
    $

    Hệ số $b = 6750$ giữ nguyên.

    Vận tốc tối ưu mới:

    $
      v_0'
      = root(3, frac(b, 2a'))
      = root(3, frac(6750, 1.6)).
    $

    $
      v_0'
      = root(3, 4218.75)
      approx 16.16.
    $

    Chi phí biến đổi tối thiểu mới:

    $
      C_"bien doi,min"'
      = 3a'(v_0')^2.
    $

    $
      C_"bien doi,min"'
      approx 3 dot 0.8 dot 16.16^2
      approx 626.8.
    $

    Cộng thêm chi phí cố định:

    $
      C_min'
      approx 626.8 + 225
      approx 851.8.
    $

    #answer-box[
      Ta có:

      $
        a = 1, quad b = 6750.
      $

      Sau khi cải tiến động cơ:

      $
        v_0' approx 16.16
      $

      km/h và:

      $
        C_min' approx 851.8
      $

      nghìn đồng.
    ]
  ],
)

// ================================================================
// PHẦN V
// ================================================================
= Dạng X — Tối Ưu Bền Vững (Minimax)

== Phân Tích Kịch Bản Bất Định

Trong thực tiễn, doanh nghiệp thường xuyên đối mặt với sự bất định của các yếu tố khách quan, chẳng hạn:

- *Kịch bản 1:* Thời tiết thuận lợi, giao thông thông suốt;
- *Kịch bản 2:* Gió ngược, đường xấu làm hao tổn nhiên liệu tăng cao;
- *Kịch bản 3:* Biến động giá nhiên liệu hoặc chi phí nhân công.

Thay vì chỉ tối ưu hóa cho một kịch bản đơn lẻ (có thể dẫn đến rủi ro lớn nếu kịch bản đó không xảy ra), chiến lược Minimax tìm kiếm mức vận tốc sao cho *chi phí trong tình huống xấu nhất* được giảm thiểu:

$
  M(v) = max(C_1(v), C_2(v)).
$

#tln(
  id: "2D1NC-5",
  [Một doanh nghiệp xét hai kịch bản chi phí cho cùng một chuyến đi, với $v in [8, 30]$:

  $
    C_1(v) = v^2 + frac(2000, v)
  $

  và

  $
    C_2(v) = 0.5v^2 + frac(4000, v).
  $

  Doanh nghiệp muốn chọn vận tốc $v$ sao cho chi phí tồi nhất giữa hai kịch bản là nhỏ nhất:

  $
    M(v) = max(C_1(v), C_2(v)).
  $

  Hãy tìm vận tốc tối ưu bền vững và chi phí tồi nhất nhỏ nhất.],
  [$v = root(3, 4000) approx 15.87$ km/h; $M_min approx 378.0$ nghìn đồng],
  loigiai: [
    *Bước 1 — Tìm điểm giao của hai hàm chi phí.*

    $
      C_1(v) = C_2(v).
    $

    $
      v^2 + frac(2000, v)
      = 0.5v^2 + frac(4000, v).
    $

    $
      0.5v^2 = frac(2000, v).
    $

    Nhân hai vế với $v > 0$:

    $
      0.5v^3 = 2000.
    $

    $
      v^3 = 4000.
    $

    $
      v = root(3, 4000) approx 15.87.
    $

    *Bước 2 — Phân tích ý nghĩa.*

    Với $v < root(3, 4000)$, ta có:

    $
      C_2(v) > C_1(v).
    $

    Khi đó:

    $
      M(v) = C_2(v).
    $

    Mà $C_2(v)$ giảm cho đến vận tốc tối ưu của chính nó:

    $
      v_2 = root(3, frac(4000, 2 dot 0.5))
      = root(3, 4000).
    $

    Với $v > root(3, 4000)$, ta có:

    $
      C_1(v) > C_2(v).
    $

    Khi đó:

    $
      M(v) = C_1(v).
    $

    Hàm $C_1(v)$ tăng sau $v = 10$, đặc biệt tăng trên khoảng đang xét kể từ $15.87$.

    Do đó hàm $M(v)$ giảm đến điểm giao, rồi tăng sau điểm giao. Vậy giá trị nhỏ nhất của $M(v)$ đạt tại:

    $
      v = root(3, 4000).
    $

    *Bước 3 — Tính chi phí.*

    Vì hai hàm bằng nhau tại điểm này:

    $
      M_min = C_1(v) = C_2(v).
    $

    Đặt $v^3 = 4000$, suy ra:

    $
      frac(2000, v) = frac(v^3, 2v) = frac(v^2, 2).
    $

    $
      C_1(v)
      = v^2 + frac(v^2, 2)
      = frac(3v^2, 2).
    $

    Với:

    $
      v approx 15.87,
      quad v^2 approx 251.98.
    $

    $
      M_min approx frac(3 dot 251.98, 2)
      approx 377.97.
    $

    #answer-box[
      Vận tốc tối ưu bền vững là:

      $
        v = root(3, 4000) approx 15.87
      $

      km/h.

      Chi phí tồi nhất nhỏ nhất là:

      $
        M_min approx 378.0
      $

      nghìn đồng.
    ]
  ],
)

// ================================================================
// PHẦN VI
// ================================================================
= Dạng XI — Tối Ưu Với Rào Cản Tiệm Cận (Giới Hạn Vận Tốc)

== Phân Tích Mô Hình Toán Học

Khi phương tiện di chuyển tiệm cận giới hạn vận tốc tối đa $v_"max"$ của thiết kế, các chi phí liên quan đến rủi ro, bảo trì hoặc làm mát động cơ thường tăng vọt ra vô cực. Mô hình phổ biến cho chi phí này là một hàm phân thức có tiệm cận đứng tại $v = v_"max"$:

$
  C_"động cơ"(v) = frac(a, v_"max" - v).
$

Hàm tổng chi phí bao gồm chi phí thời gian và chi phí động cơ:

$
  C(v) = frac(a, v_"max" - v) + frac(b, v), quad 0 < v < v_"max".
$

#tln(
  id: "2D1NC-6",
  [Một hãng vận tải sử dụng loại xe có tốc độ tối đa cho phép trên cao tốc là $100$ km/h. Chi phí thời gian cho mỗi chuyến đi là $frac(8000, v)$ (nghìn đồng), trong khi chi phí hao mòn động cơ khi chạy ở tốc độ $v$ được tính bằng $frac(2000, 100 - v)$ (nghìn đồng).
  
  Hãy tìm vận tốc $v$ (km/h) để tổng chi phí của chuyến đi là nhỏ nhất và tính chi phí nhỏ nhất đó.],
  [$v = 66.67$ km/h; $C_min = 180$ nghìn đồng],
  loigiai: [
    *Bước 1: Lập hàm chi phí.*
    
    Hàm tổng chi phí là:
    
    $
      C(v) = frac(2000, 100 - v) + frac(8000, v), quad 0 < v < 100.
    $
    
    *Bước 2: Tính đạo hàm và tìm điểm cực trị.*
    
    $
      C'(v) = frac(2000, (100 - v)^2) - frac(8000, v^2).
    $
    
    Giải phương trình $C'(v) = 0$:
    
    $
      frac(2000, (100 - v)^2) = frac(8000, v^2)
      =>
      frac(v^2, (100 - v)^2) = 4.
    $
    
    Do $v in (0, 100)$ nên $v$ và $100-v$ đều dương, lấy căn bậc hai hai vế:
    
    $
      frac(v, 100 - v) = 2
      =>
      v = 200 - 2v
      =>
      3v = 200
      =>
      v = frac(200, 3) approx 66.67.
    $
    
    *Bước 3: Tính chi phí tối thiểu.*
    
    Thay $v = 200/3$ vào hàm chi phí:
    
    $
      C(200/3) = frac(2000, 100 - 200/3) + frac(8000, 200/3)
      = frac(2000, 100/3) + frac(8000, 200/3)
      = 60 + 120 = 180.
    $
    
    #answer-box[
      Vận tốc tối ưu là $v = 66.67$ km/h. Tổng chi phí tối thiểu là $180$ nghìn đồng. Tại đây, chi phí thời gian ($120$ nghìn) gấp đôi chi phí hao mòn động cơ ($60$ nghìn).
    ]
  ]
)

// ================================================================
// PHẦN VII
// ================================================================
= Dạng XII — Mô Hình Đa Biểu Thức: Hàm Căn Thức Và Nghịch Đảo Bậc Hai

== Phân Tích Mô Hình Toán Học

Không phải lúc nào chi phí thời gian cũng tỷ lệ với $1/v$. Nếu chi phí kho bãi, tủ đông bảo quản hoặc tiền bồi thường giao hàng chậm tính theo bình phương thời gian trễ, chi phí thời gian sẽ có dạng $b / v^2$. Ngược lại, ma sát cản không khí ở dải vận tốc thấp có thể được mô phỏng bởi căn bậc hai $a sqrt(v)$.

$
  C(v) = a v^alpha + frac(b, v^beta).
$

#tln(
  id: "2D1NC-7",
  [Một container lạnh vận chuyển vaccine cần duy trì nhiệt độ liên tục. Chi phí chạy máy làm lạnh tỉ lệ với bình phương thời gian đi trên đường, được tính bằng $frac(256, v^2)$ triệu đồng. Trong khi đó, chi phí nhiên liệu di chuyển của xe tải là $v$ triệu đồng (với $v$ là vận tốc, $v > 0$). 
  
  Xác định vận tốc tối ưu và tổng chi phí nhỏ nhất.],
  [$v = 8$ km/h; $C_min = 12$ triệu đồng],
  loigiai: [
    *Bước 1: Lập hàm chi phí.*
    
    $
      C(v) = v + frac(256, v^2), quad v > 0.
    $
    
    *Bước 2: Tìm điểm cực trị.*
    
    $
      C'(v) = 1 - frac(512, v^3).
    $
    
    $
      C'(v) = 0
      =>
      1 = frac(512, v^3)
      =>
      v^3 = 512
      =>
      v = 8.
    $
    
    *Bước 3: Kết luận.*
    
    Thay $v=8$ vào hàm số, ta có:
    
    $
      C_min = 8 + frac(256, 8^2) = 8 + 4 = 12.
    $
    
    #answer-box[
      Vận tốc tối ưu để tiết kiệm chi phí là $v = 8$ km/h. Chi phí tối thiểu đạt được là $12$ triệu đồng. Khác với mô hình $1/v$, ở đây chi phí nhiên liệu gấp đôi chi phí thời gian.
    ]
  ]
)

// ================================================================
// PHẦN VIII
// ================================================================
= Dạng XIII — Đa Thức Bậc Cao Và Phương Pháp Lập Bảng Biến Thiên

== Phân Tích Bằng Công Cụ Đạo Hàm

Mặc dù các hàm chi phí phức tạp chứa nhiều lũy thừa bậc cao, phương pháp tiêu chuẩn và an toàn nhất luôn là sử dụng đạo hàm và lập bảng biến thiên (BBT). Khác với các mô hình cơ bản, đạo hàm của các đa thức bậc cao sẽ cho ra phương trình có bậc lớn hơn. Tuy nhiên, ta hoàn toàn có thể rút gọn thành dạng $v^n = text("const")$ để tìm nghiệm duy nhất. Thay vì mạo hiểm tách điểm rơi BĐT Cauchy, lập BBT luôn đảm bảo tính chính xác.

#tln(
  id: "2D1NC-8",
  [Biết tổng chi phí vận hành một tàu chở hàng siêu trường được mô phỏng bởi:
  
  $
    C(v) = 2 v^3 + frac(1536, v) + 500, quad v > 0.
  $
  
  Hãy tìm giá trị nhỏ nhất của $C(v)$ và vận tốc tối ưu $v$.],
  [$v = 4$ km/h; $C_min = 1012$ nghìn đồng],
  loigiai: [
    *Cách 1: Sử dụng đạo hàm và lập bảng biến thiên (Khuyên dùng)*
    
    *Bước 1: Tính đạo hàm.*
    
    $
      C'(v) = 6 v^2 - frac(1536, v^2).
    $
    
    *Bước 2: Tìm điểm cực trị.*
    
    Cho $C'(v) = 0$, ta có:
    
    $
      6 v^2 = frac(1536, v^2)
      =>
      v^4 = frac(1536, 6) = 256.
    $
    
    Do $v > 0$, ta có nghiệm duy nhất:
    
    $
      v = root(4, 256) = 4.
    $
    
    *Bước 3: Lập bảng biến thiên (Đánh giá cực trị).*
    
    - Với $0 < v < 4$, $v^4 < 256 => 6 v^2 < 1536 / v^2 => C'(v) < 0$, hàm số nghịch biến.
    - Với $v > 4$, $v^4 > 256 => 6 v^2 > 1536 / v^2 => C'(v) > 0$, hàm số đồng biến.
    
    #align(center)[
      #bbt-opt(
        var: $v$,
        der: $C'(v)$,
        func: $C(v)$,
        x-vals: ($0$, $4$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $1012$, $+oo$),
        is-min: true
      )
    ]
    
    Do đó, $C(v)$ đạt giá trị nhỏ nhất tại $v = 4$.
    
    Chi phí nhỏ nhất:
    
    $
      C_min = C(4) = 2(4)^3 + frac(1536, 4) + 500 = 128 + 384 + 500 = 1012.
    $

    *Cách 2: Sử dụng BĐT AM-GM (Bổ trợ kiểm tra nhanh)*
    
    Ta cần triệt tiêu $v^3$ ở tử số với $v$ ở mẫu số. Tách $frac(1536, v)$ thành 3 phần bằng nhau:
    
    $
      C(v) = 2 v^3 + frac(512, v) + frac(512, v) + frac(512, v) + 500.
    $
    
    Áp dụng BĐT Cauchy cho 4 số dương đầu tiên:
    
    $
      C(v) >= 4 root(4, 2 v^3 dot frac(512, v) dot frac(512, v) dot frac(512, v)) + 500 = 4 root(4, 2 dot 512^3) + 500 = 512 + 500 = 1012.
    $
    
    Dấu bằng xảy ra khi $2 v^3 = 512/v => v^4 = 256 => v = 4$.
    
    #answer-box[
      Vận tốc tối ưu là $v = 4$ km/h. Chi phí nhỏ nhất là $1012$ nghìn đồng. Việc dùng phương pháp đạo hàm và BBT cho cách giải tường minh, giúp học sinh tự tin xử lý mọi bậc đa thức mà không sợ quên điểm rơi Cauchy.
    ]
  ]
)

#tln(
  id: "2D1NC-8b",
  [Một nhà máy sản xuất cần tối ưu hóa chi phí vận hành dây chuyền có tốc độ $v$ (sản phẩm/phút). Chi phí điện năng tăng theo hàm bậc bốn $0.5 v^4$ (do ma sát cơ học lớn), nhưng chi phí cố định chia đều cho số lượng sản phẩm là $frac(4000, v)$. Hàm tổng chi phí cho mỗi sản phẩm là:
  
  $
    C(v) = 0.5 v^4 + frac(4000, v), quad v > 0.
  $
  
  Hãy sử dụng phương pháp Đạo hàm và Lập bảng biến thiên để tìm $v$ sao cho chi phí là thấp nhất.],
  [$v = root(5, 2000) approx 4.57$; $C_min approx 1093.3$],
  loigiai: [
    *Bước 1: Tính đạo hàm.*
    
    $
      C'(v) = 2 v^3 - frac(4000, v^2).
    $
    
    *Bước 2: Tìm điểm cực trị.*
    
    Cho $C'(v) = 0$:
    
    $
      2 v^3 = frac(4000, v^2)
      =>
      2 v^5 = 4000
      =>
      v^5 = 2000.
    $
    
    Nghiệm duy nhất: $v_0 = root(5, 2000) approx 4.573$.
    
    *Bước 3: Lập bảng biến thiên.*
    
    - Với $0 < v < v_0$, ta có $v^5 < 2000 => 2v^3 < 4000/v^2 => C'(v) < 0$.
    - Với $v > v_0$, ta có $v^5 > 2000 => 2v^3 > 4000/v^2 => C'(v) > 0$.
    
    #align(center)[
      #bbt-opt(
        var: $v$,
        der: $C'(v)$,
        func: $C(v)$,
        x-vals: ($0$, $v_0 approx 4.57$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $C_min$, $+oo$),
        is-min: true
      )
    ]
    
    Từ BBT, ta kết luận hàm số đạt giá trị nhỏ nhất tại $v_0 = root(5, 2000)$.
    
    *Bước 4: Tính chi phí nhỏ nhất.*
    
    $
      C_min = 0.5(root(5, 2000))^4 + frac(4000, root(5, 2000)) approx 1093.3.
    $
    
    #answer-box[
      Vận tốc tối ưu là $v approx 4.57$ sản phẩm/phút. Chi phí tối thiểu xấp xỉ $1093.3$ đơn vị.
    ]
  ]
)

#tln(
  id: "2D1NC-8c",
  [Một máy bay có chi phí nhiên liệu tăng theo hàm bậc ba: $C_1(v) = 0.02 v^3$ (do lực cản không khí rất lớn ở tốc độ cao). Chi phí trả cho phi hành đoàn và bến bãi được chia đều theo thời gian là $frac(15000, v)$. Tổng chi phí bay cho mỗi km được tính theo hàm số:
  
  $
    C(v) = 0.02 v^3 + frac(15000, v), quad v > 0.
  $
  
  Bằng phương pháp lập bảng biến thiên, hãy tìm vận tốc $v$ để máy bay tiết kiệm chi phí nhất.],
  [$v = root(4, 250000) approx 22.36$],
  loigiai: [
    *Bước 1: Tính đạo hàm.*
    
    $
      C'(v) = 0.06 v^2 - frac(15000, v^2).
    $
    
    *Bước 2: Tìm điểm cực trị.*
    
    Cho $C'(v) = 0$:
    
    $
      0.06 v^2 = frac(15000, v^2)
      =>
      v^4 = frac(15000, 0.06) = 250000.
    $
    
    Nghiệm duy nhất: $v_0 = root(4, 250000) approx 22.36$.
    
    *Bước 3: Lập bảng biến thiên.*
    
    - Với $0 < v < v_0$, ta có $v^4 < 250000 => 0.06 v^2 < 15000/v^2 => C'(v) < 0$.
    - Với $v > v_0$, ta có $v^4 > 250000 => 0.06 v^2 > 15000/v^2 => C'(v) > 0$.
    
    #align(center)[
      #bbt-opt(
        var: $v$,
        der: $C'(v)$,
        func: $C(v)$,
        x-vals: ($0$, $v_0 approx 22.36$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $C_min$, $+oo$),
        is-min: true
      )
    ]
    
    Từ BBT, hàm số đạt cực tiểu và cũng là giá trị nhỏ nhất tại $v_0 approx 22.36$.
    
    #answer-box[
      Vận tốc tiết kiệm chi phí nhất của máy bay là $v approx 22.36$.
    ]
  ]
)

#tln(
  id: "2D1NC-8d",
  [Trong quá trình thiết kế một loại tàu đệm từ, kỹ sư lập được hàm chi phí tổng hợp (bao gồm chi phí từ trường, vật liệu và vận hành) phụ thuộc vào vận tốc $v$ ($v>0$) như sau:
  
  $
    C(v) = v^2 + v + frac(1000, v).
  $
  
  Lập bảng biến thiên để tìm vận tốc $v$ mang lại chi phí tối ưu nhất.],
  [$v approx 7.8$],
  loigiai: [
    *Bước 1: Tính đạo hàm.*
    
    $
      C'(v) = 2v + 1 - frac(1000, v^2).
    $
    
    *Bước 2: Tìm điểm cực trị.*
    
    Cho $C'(v) = 0$, quy đồng khử mẫu (do $v > 0$):
    
    $
      2v^3 + v^2 - 1000 = 0.
    $
    
    Sử dụng máy tính cầm tay giải phương trình bậc ba, ta thu được 1 nghiệm thực duy nhất:
    
    $
      v_0 approx 7.80.
    $
    
    *Bước 3: Lập bảng biến thiên.*
    
    - Vì phương trình $2v^3 + v^2 - 1000 = 0$ có hệ số $a = 2 > 0$ và chỉ có 1 nghiệm thực, biểu thức $C'(v)$ đổi dấu từ âm sang dương khi đi qua $v_0$.
    - Khi $v < v_0$, $C'(v) < 0$. Khi $v > v_0$, $C'(v) > 0$.
    
    #align(center)[
      #bbt-opt(
        var: $v$,
        der: $C'(v)$,
        func: $C(v)$,
        x-vals: ($0$, $v_0 approx 7.8$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $C_min$, $+oo$),
        is-min: true
      )
    ]
    
    Dựa vào BBT, chi phí đạt nhỏ nhất tại $v approx 7.8$.
    
    #answer-box[
      Vận tốc tối ưu là $v approx 7.8$. Việc lập BBT rất hữu hiệu khi giải phương trình bậc 3 ra nghiệm lẻ (điều mà AM-GM rất khó xử lý).
    ]
  ]
)

// ================================================================
// PHẦN IX
// ================================================================
= Dạng XIV — Mô Hình Hao Mòn Phi Tuyến (Hàm Mũ - Phương Trình Siêu Việt)

== Phân Tích Phương Trình Siêu Việt

Trong các ứng dụng thực tế phức tạp (như hao mòn lốp xe, tổn thất nhiệt độ hay sức cản ma sát siêu thanh), chi phí không tăng theo hàm đa thức mà bùng nổ theo hàm mũ (Exponential function) $e^{k v}$.

$
  C(v) = A e^{k v} + frac(B, v).
$

Phương trình đạo hàm $C'(v) = 0$ của dạng này sẽ chứa đồng thời cả đa thức và hàm mũ, tạo thành *phương trình siêu việt*. Ở cấp độ THPT, để giải quyết, ta cần cô lập biến, thiết lập hàm số phụ $g(v)$, lập bảng biến thiên để xác nhận sự tồn tại của nghiệm duy nhất, sau đó dùng công cụ xấp xỉ nghiệm.

#tln(
  id: "2D1NC-9",
  [Chi phí hao mòn vật liệu của một thiết bị chịu nhiệt độ cao khi hoạt động ở công suất $v > 0$ được mô phỏng bởi hàm $2 e^(0.1 v)$. Chi phí bảo trì cố định tỷ lệ nghịch với $v$, có dạng $frac(500, v)$. Tổng chi phí là:
  
  $
    C(v) = 2 e^(0.1 v) + frac(500, v).
  $
  
  Chứng minh rằng tồn tại duy nhất một mức công suất $v_0$ làm tối thiểu hóa chi phí, và tìm giá trị gần đúng của $v_0$ (làm tròn 1 chữ số thập phân).],
  [Tồn tại nghiệm duy nhất; $v_0 approx 19.2$],
  loigiai: [
    *Bước 1: Tính đạo hàm của hàm chi phí.*
    
    $
      C'(v) = 2 dot 0.1 e^(0.1 v) - frac(500, v^2) = 0.2 e^(0.1 v) - frac(500, v^2).
    $
    
    Cho $C'(v) = 0$, ta được phương trình:
    
    $
      0.2 e^(0.1 v) = frac(500, v^2)
      =>
      v^2 e^(0.1 v) = 2500.
    $
    
    Đây là một phương trình siêu việt. Ta không thể giải bằng đại số thông thường.
    
    *Bước 2: Chứng minh phương trình có nghiệm duy nhất bằng hàm số phụ.*
    
    Xét hàm số phụ:
    
    $
      g(v) = v^2 e^(0.1 v) - 2500, quad v > 0.
    $
    
    Tính đạo hàm của $g(v)$:
    
    $
      g'(v) = 2 v e^(0.1 v) + v^2 dot 0.1 e^(0.1 v) = v e^(0.1 v) (2 + 0.1 v).
    $
    
    Vì $v > 0$ nên $g'(v) > 0$ với mọi $v > 0$. Suy ra $g(v)$ là hàm số đồng biến liên tục trên khoảng $(0, +oo)$.
    
    Thử một vài giá trị:
    
    $
      g(10) = 100 e^1 - 2500 approx 271.8 - 2500 < 0.
    $
    
    $
      g(20) = 400 e^2 - 2500 approx 400 dot 7.389 - 2500 = 2955.6 - 2500 > 0.
    $
    
    Vì $g(10) dot g(20) < 0$ và $g(v)$ liên tục, đồng biến, nên phương trình $g(v) = 0$ có nghiệm duy nhất $v_0 in (10, 20)$. 
    
    Do đó $C'(v) = 0$ có nghiệm duy nhất $v_0$. Qua điểm này, $C'(v)$ đổi dấu từ âm sang dương, nên hàm số $C(v)$ đạt cực tiểu tại $v_0$.
    
    *Bước 3: Xấp xỉ nghiệm bằng máy tính.*
    
    Sử dụng chức năng SOLVE trên máy tính cầm tay cho phương trình $v^2 e^(0.1 v) - 2500 = 0$, ta thu được nghiệm xấp xỉ:
    
    $
      v_0 approx 19.2.
    $
    
    #answer-box[
      Chứng minh được $C(v)$ có nghiệm tối ưu duy nhất nhờ tính đồng biến của hàm phụ. Công suất vận hành tối ưu xấp xỉ $19.2$.
    ]
  ]
)

// ================================================================
// TRẮC NGHIỆM NÂNG CAO
// ================================================================
= Trắc Nghiệm Nâng Cao

#tn(
  id: "2D1NC-TN1",
  [Với hàm chi phí $C(v) = 2v^4 + 16000/v$, vận tốc tối ưu thỏa mãn phương trình nào?],
  (
    [$8v^5 = 16000$],
    True([$8v^5 = 16000$]),
    [$4v^3 = 16000$],
    [$2v^4 = 16000$],
  ),
  loigiai: [
    $
      C'(v) = 8v^3 - frac(16000, v^2).
    $

    $
      C'(v) = 0
      =>
      8v^3 = frac(16000, v^2)
      =>
      8v^5 = 16000.
    $

    #answer-box[Đáp án đúng là $8v^5 = 16000$.]
  ],
)

#tn(
  id: "2D1NC-TN2",
  [Với mô hình $C(v) = a v^5 + b/v$, tại vận tốc tối ưu, tỉ lệ chi phí nhiên liệu : chi phí thời gian là:],
  (
    [$1:2$],
    [$1:3$],
    [$1:4$],
    True([$1:5$]),
  ),
  loigiai: [
    Với mô hình $a v^p + b/v$, tại điểm tối ưu:

    $
      C_"thời gian" = p C_"nhiên liệu".
    $

    Ở đây $p = 5$, nên:

    $
      C_"nhiên liệu" : C_"thời gian" = 1 : 5.
    $

    #answer-box[Đáp án đúng: $1:5$.]
  ],
)

#ds(
  id: "2D1NC-DS1",
  [Xét hàm chi phí:

  $
    C(v) = 0.5v^2 + frac(4000, v) + 100,
    quad v > 0.
  $],
  (
    True[Chi phí cố định $100$ không ảnh hưởng đến vận tốc tối ưu.],
    True[Vận tốc tối ưu là $v_0 = root(3, 4000)$.],
    False[Tại vận tốc tối ưu, chi phí nhiên liệu bằng chi phí thời gian.],
    True[Tại vận tốc tối ưu, chi phí thời gian gấp đôi chi phí nhiên liệu.],
  ),
  loigiai: [
    Ta có:

    $
      C'(v) = v - frac(4000, v^2).
    $

    $
      C'(v) = 0
      =>
      v^3 = 4000.
    $

    Vậy:

    $
      v_0 = root(3, 4000).
    $

    Hằng số $100$ biến mất sau khi đạo hàm nên không làm thay đổi vận tốc tối ưu.

    Vì phần biến đổi có dạng:

    $
      0.5v^2 + frac(4000, v),
    $

    nên tại điểm tối ưu:

    $
      C_"thời gian" = 2C_"nhiên liệu".
    $

    #answer-box[
      Các mệnh đề đúng là (a), (b), (d).

      Mệnh đề (c) sai vì chi phí nhiên liệu không bằng chi phí thời gian; chi phí thời gian gấp đôi chi phí nhiên liệu.
    ]
  ],
)

#tn(
  id: "2D1NC-TN3",
  [Một hàm chi phí có dạng $C(v) = a/v^2 + b v^3$. Tỉ lệ giữa chi phí nhiên liệu ($b v^3$) và chi phí thời gian ($a/v^2$) tại thời điểm tối ưu là bao nhiêu?],
  (
    [$1:3$],
    [$3:2$],
    True([$2:3$]),
    [$1:2$],
  ),
  loigiai: [
    Ta xét đạo hàm:
    
    $
      C'(v) = -frac(2a, v^3) + 3b v^2 = 0
      =>
      frac(2a, v^3) = 3b v^2
      =>
      frac(2a, v^2) = 3b v^3.
    $
    
    Nhân hai vế với $1/v$, ta thấy:
    
    $
      2 C_"thời gian" = 3 C_"nhiên liệu"
      =>
      frac(C_"nhiên liệu", C_"thời gian") = frac(2, 3).
    $
    
    #answer-box[Tỉ lệ là $2:3$.]
  ]
)

#ds(
  id: "2D1NC-DS2",
  [Hàm chi phí của một tàu ngầm thám hiểm có dạng $C(v) = 100 sqrt(v) + frac(2000, v)$ với $v > 0$.],
  (
    True[Chi phí nhiên liệu tăng theo căn bậc hai của vận tốc.],
    False[Vận tốc tối ưu là $v = 20$.],
    True[Phương trình tìm cực trị là $frac(50, sqrt(v)) = frac(2000, v^2)$.],
    True[Tổng chi phí đạt giá trị nhỏ nhất khi $v approx 11.7$ km/h.],
  ),
  loigiai: [
    Ta có $C(v) = 100 v^(1/2) + 2000 v^(-1)$.
    
    $
      C'(v) = 50 v^(-1/2) - 2000 v^(-2) = frac(50, sqrt(v)) - frac(2000, v^2).
    $
    
    Cho $C'(v) = 0$:
    
    $
      frac(50, sqrt(v)) = frac(2000, v^2)
      =>
      frac(v^2, sqrt(v)) = frac(2000, 50) = 40.
    $
    
    $
      v^(3/2) = 40
      =>
      v = 40^(2/3) = root(3, 1600) approx 11.696.
    $
    
    #answer-box[Các ý đúng là (a), (c), (d).]
  ]
)

#tn(
  id: "2D1NC-TN4",
  [Bài toán tìm vận tốc để cực tiểu hóa chi phí $C(v) = 5 v^2 + frac(A, v^3)$ ($v > 0, A > 0$) được giải bằng phương pháp đạo hàm. Vận tốc tối ưu $v_0$ phụ thuộc vào $A$ theo công thức nào dưới đây?],
  (
    [$v_0 = root(3, A/10)$],
    True([$v_0 = root(5, (3A)/10)$]),
    [$v_0 = root(4, A/10)$],
    [$v_0 = root(5, (10A)/3)$],
  ),
  loigiai: [
    Ta có hàm số $C(v) = 5 v^2 + A v^(-3)$. Đạo hàm:
    
    $
      C'(v) = 10 v - 3 A v^(-4) = 10 v - frac(3A, v^4).
    $
    
    Cho $C'(v) = 0$:
    
    $
      10 v = frac(3A, v^4)
      =>
      10 v^5 = 3A
      =>
      v^5 = frac(3A, 10).
    $
    
    Do đó $v_0 = root(5, (3A)/10)$.
    
    #answer-box[Đáp án đúng: $v_0 = root(5, (3A)/10)$.]
  ]
)

// ================================================================
// TỔNG KẾT
// ================================================================
= Bảng Tổng Kết Các Công Thức Nâng Cao

#advanced-box(title: "Công thức cần nhớ")[
  #table(
    columns: (34%, 33%, 33%),
    stroke: 0.6pt + rgb("7D3C98"),
    fill: (x, y) => if y == 0 { rgb("512E5F") } else if calc.odd(y) { rgb("F5EEF8") } else { rgb("FBFCFC") },
    inset: (x: 9pt, y: 7pt),

    [#text(fill: white, weight: "bold")[Mô hình]],
    [#text(fill: white, weight: "bold")[Vận tốc tối ưu]],
    [#text(fill: white, weight: "bold")[Tỉ lệ tại tối ưu]],

    [$C(v) = a v^2 + b/v$],
    [$v_0 = root(3, b/(2a))$],
    [$C_"nhiên liệu" : C_"thời gian" = 1:2$],

    [$C(v) = a v^p + b/v$],
    [$v_0 = root(p + 1, b/(p a))$],
    [$C_"nhiên liệu" : C_"thời gian" = 1:p$],

    [$C(v) = a v^p + b/v^q$],
    [$v_0 = root(p+q, (q b)/(p a))$],
    [$C_1 : C_2 = q:p$],

    [$C(v) = a v^2 + b/v + c$],
    [$v_0 = root(3, b/(2a))$],
    [$c$ không làm đổi $v_0$],

    [Giải $C(v) = a v^p + b/v^q$],
    [Đạo hàm và lập BBT],
    [Giải $p a v^(p-1) = q b / v^(q+1)$],

    [Chi phí hàm mũ $C(v) = A e^(k v) + B/v$],
    [Khảo sát $v^2 e^(k v) = text("const")$],
    [Chứng minh nghiệm bằng $g'(v) > 0$],

    [Hàm từng đoạn],
    [Xét từng miền riêng],
    [So sánh tại điểm nối],

    [$M(v) = max(C_1(v), C_2(v))$],
    [Thường xét điểm $C_1(v) = C_2(v)$],
    [Kiểm tra tính tăng giảm hai phía],
  )
]

#v(1em)

#align(center)[
  #block(
    fill: navy,
    radius: 8pt,
    inset: (x: 18pt, y: 12pt),
  )[
    #text(fill: rgb("F4D03F"), size: 10pt, weight: "bold")[
      Tư duy nâng cao:
    ]

    #v(0.3em)

    #text(fill: white, size: 10pt, style: "italic")[
      “Không phải bài tối ưu nào cũng chỉ cần lấy đạo hàm một lần.
      Hãy xác định đúng mô hình, đúng miền xác định và đúng tiêu chí tối ưu.”
    ]
  ]
]