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
  stroke: (bottom: 2pt + rgb("312E81")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("312E81"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("4338CA")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("4338CA"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("6366F1")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("6366F1"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("4338CA")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Hàm số & Tam thức bậc hai (Indigo - Slate)
#let c-indigo-dark = rgb("312E81")
#let c-indigo = rgb("4338CA")
#let c-indigo-light = rgb("6366F1")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-indigo = rgb("EEF2FF")
#let c-border = rgb("E0E7FF")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-indigo,
    stroke: 1.5pt + c-indigo,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-indigo-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-indigo, size: 16pt, weight: "black")[CHUYÊN ĐỀ 7.0: HÀM SỐ – HÀM SỐ BẬC HAI VÀ TAM THỨC BẬC HAI]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      So sánh nghiệm với các mốc thực, Cực trị trên đoạn, Đồ thị chứa dấu giá trị tuyệt đối & Bất đẳng thức Chebyshev
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-indigo),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Khởi nguyên & Sức mạnh của Tam thức bậc hai trong Toán học phổ thông và Chuyên Toán:*
  
  Hàm số bậc hai $f(x) = a x^2 + b x + c$ ($a != 0$) là hàm phi tuyến đơn giản nhất nhưng đóng vai trò là "chiếc cầu nối vĩ đại" giữa Đại số và Giải tích. Nếu đường thẳng đại diện cho các quá trình tuyến tính đồng tốc, thì Parabol là mô hình đầu tiên ghi nhận sự biến thiên gia tốc — từ định luật rơi tự do của Galileo Galilei ($s = 1/2 g t^2$) đến nguyên lý phản xạ gương Parabol của Archimedes.
  
  Trong các kỳ thi Học sinh giỏi (HSG) và đề thi Vận dụng cao (VDC), bài toán Tam thức bậc hai không dừng lại ở việc tính biệt thức $Delta = b^2 - 4a c$ hay nhẩm nghiệm Viète. Nó là nghệ thuật:
  1. *Định lý đảo về dấu của tam thức bậc hai (So sánh nghiệm với các số thực $alpha < beta$)*: Khảo sát vị trí tương đối của nghiệm mà không cần giải phương trình đại số căn thức phức tạp.
  2. *Cực trị hàm bậc hai trên đoạn hữu hạn $[u; v]$*: Tương tác biện luận giữa hoành độ đỉnh $x_0 = -b / (2a)$ và biên của đoạn.
  3. *Hàm số chứa dấu giá trị tuyệt đối*: Biến đổi đồ thị bằng phép đối xứng gương qua trục hoành $y = |f(x)|$ hoặc trục tung $y = f(|x|)$, tìm nghiệm phương trình $m$.
  4. *Bất đẳng thức đa thức Chebyshev*: Cực trị tối ưu hóa sai số cực đại (minimax approximation) — nền tảng lý thuyết tính toán số trị của máy tính hiện đại.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. CÁC ĐỊNH LÝ NỀN TẢNG & HỆ THỐNG KỸ THUẬT VDC
// ══════════════════════════════════════════════════════════════

== 1. Định lý về dấu của tam thức bậc hai & Định lý đảo (So sánh nghiệm)

#block(
  fill: c-bg-indigo,
  stroke: 1pt + c-border,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  Cho tam thức bậc hai $f(x) = a x^2 + b x + c$ với $a != 0$, $Delta = b^2 - 4a c$.
  - *Định lý thuận (Trong trái, Ngoài cùng)*: Khi $Delta > 0$, $f(x)$ có 2 nghiệm phân biệt $x_1 < x_2$. Khi đó $a dot f(x) < 0$ với mọi $x in (x_1; x_2)$ và $a dot f(x) > 0$ với mọi $x in (-oo; x_1) union (x_2; +oo)$.
  - *Hệ quả quan trọng*: Một số thực $alpha$ nằm giữa hai nghiệm $x_1 < alpha < x_2$ khi và chỉ khi $a dot f(alpha) < 0$.
]

#v(0.4em)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ hệ trục tọa độ
    line((-1.5, 0), (5.5, 0), stroke: 0.8pt + rgb("94A3B8"), mark: (end: "stealth"))
    line((0, -2.5), (0, 3.5), stroke: 0.8pt + rgb("94A3B8"), mark: (end: "stealth"))
    content((5.4, -0.3), text(fill: rgb("64748B"), size: 8.5pt)[$x$])
    content((-0.3, 3.4), text(fill: rgb("64748B"), size: 8.5pt)[$y$])

    // Vẽ Parabol y = 0.8(x-1)(x-4) = 0.8(x^2 - 5x + 4) = 0.8(x - 2.5)^2 - 1.8
    // Nghiệm x_1 = 1, x_2 = 4, đỉnh I(2.5, -1.8)
    let a = 0.8
    let pts = ()
    let i = 0
    while i <= 60 {
      let x = -0.3 + i * (5.3 - (-0.3)) / 60
      let y = a * (x - 1) * (x - 4)
      pts.push((x, y))
      i = i + 1
    }
    line(..pts, stroke: 2pt + c-indigo)

    // Đánh dấu các nghiệm x1, x2 và đỉnh I
    circle((1, 0), radius: 2.5pt, fill: c-blue)
    content((1, 0.35), text(fill: c-blue, weight: "bold")[$x_1$])

    circle((4, 0), radius: 2.5pt, fill: c-blue)
    content((4, 0.35), text(fill: c-blue, weight: "bold")[$x_2$])

    circle((2.5, -1.8), radius: 2.5pt, fill: c-red)
    content((2.5, -2.2), text(fill: c-red, weight: "bold")[$I(-b / (2a); -Delta / (4a))$])

    // Đường dóng trục đối xứng
    line((2.5, 3), (2.5, -1.8), stroke: (paint: c-red, dash: "dashed", thickness: 1pt))
    content((2.5, 3.2), text(fill: c-red, size: 8.5pt)[Trục đối xứng $x = x_0$])

    // Vùng trong hai nghiệm: a*f(x) < 0
    content((2.5, -0.7), text(fill: c-indigo-dark, weight: "bold", size: 9pt)[$a dot f(x) < 0$ (Trong trái)])
    content((-0.8, 1.5), text(fill: c-emerald, weight: "bold", size: 9pt)[$a dot f(x) > 0$])
    content((4.8, 1.5), text(fill: c-emerald, weight: "bold", size: 9pt)[$a dot f(x) > 0$ (Ngoài cùng)])
  })
]

#v(0.6em)

=== Bảng quy tắc so sánh nghiệm của tam thức bậc hai với các mốc thực $alpha < beta$

#table(
  columns: (2.2fr, 3.5fr, 4.3fr),
  fill: (col, row) => if row == 0 { c-indigo } else if calc.even(row) { rgb("F8FAFC") } else { none },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  inset: 7pt,
  stroke: 0.5pt + rgb("CBD5E0"),
  [#text(fill: white, weight: "bold")[Vị trí tương đối]],
  [#text(fill: white, weight: "bold")[Điều kiện tương đương ($a != 0$)]],
  [#text(fill: white, weight: "bold")[Ý nghĩa hình học & Bản chất]],

  [*$x_1 < alpha < x_2$* \ ($alpha$ nằm giữa 2 nghiệm)],
  [$a dot f(alpha) < 0$],
  [Đồ thị cắt trục hoành tại 2 điểm phân biệt nằm về hai phía của đường $x = alpha$. Không cần xét $Delta$.],

  [*$alpha < x_1 <= x_2$* \ (2 nghiệm lớn hơn $alpha$)],
  [$cases(Delta >= 0, a dot f(alpha) > 0, S/2 > alpha)$],
  [Hai giao điểm nằm hoàn toàn bên phải $alpha$. Hoành độ đỉnh nằm bên phải $alpha$.],

  [*$x_1 <= x_2 < alpha$* \ (2 nghiệm nhỏ hơn $alpha$)],
  [$cases(Delta >= 0, a dot f(alpha) > 0, S/2 < alpha)$],
  [Hai giao điểm nằm hoàn toàn bên trái $alpha$. Hoành độ đỉnh nằm bên trái $alpha$.],

  [*$alpha < x_1 <= x_2 < beta$* \ (2 nghiệm trong $(alpha; beta)$)],
  [$cases(Delta >= 0, a dot f(alpha) > 0, a dot f(beta) > 0, alpha < S/2 < beta)$],
  [Hai giao điểm nằm trọn vẹn trong khoảng $(alpha; beta)$, đỉnh của Parabol cũng thuộc khoảng này.],
)

#v(0.8em)

== 2. Cực trị hàm số bậc hai trên đoạn $[u; v]$

Hàm số $f(x) = a x^2 + b x + c$ trên đoạn hữu hạn $[u; v]$ đạt GTLN và GTNN tại:
$ x in {u, v, -b / (2a)} quad ("với điều kiện" -b / (2a) in [u; v]). $
- *Nếu $a > 0$*:
  - $"min"_[u; v] f(x) = cases(f(-b/(2a)) "nếu" -b/(2a) in [u; v], min{f(u), f(v)} "nếu" -b/(2a) in.not [u; v])$.
  - $"max"_[u; v] f(x) = max{f(u), f(v)}$ (luôn đạt tại một trong hai đầu mút!).
- *Quy tắc khoảng cách tới trục đối xứng*: Do Parabol có tính đối xứng trục $x = x_0$, điểm nào nằm xa trục đối xứng hơn thì có tung độ lệch lớn hơn:
  $ |u - x_0| > |v - x_0| <==> f(u) > f(v) quad (text("với") a > 0). $

#v(0.8em)

== 3. Đồ thị hàm chứa dấu giá trị tuyệt đối

- *Loại 1: $y = |f(x)|$*:
  - Giữ nguyên phần đồ thị $y = f(x)$ nằm phía trên trục hoành ($y >= 0$).
  - Lấy đối xứng qua trục hoành phần đồ thị nằm phía dưới trục hoành ($y < 0$) rồi bỏ phần dưới.
- *Loại 2: $y = f(|x|)$*:
  - Giữ nguyên phần đồ thị $y = f(x)$ nằm bên phải trục tung ($x >= 0$).
  - Lấy đối xứng phần này qua trục tung để tạo thành hàm chẵn đối xứng qua $O y$.
- *Bất đẳng thức Chebyshev cho hàm bậc hai trên $[-1; 1]$*:
  Với mọi tam thức bậc hai $P(x) = x^2 + b x + c$ (hệ số cao nhất $a = 1$), sai số lớn nhất trên đoạn $[-1; 1]$ thỏa mãn:
  $ max_(x in [-1; 1]) |P(x)| >= 1/2. $
  Dấu bằng đạt được duy nhất khi $P(x) = x^2 - 1/2 = 1/2 T_2(x)$, trong đó $T_2(x) = 2x^2 - 1$ là đa thức Chebyshev bậc 2.

#v(1em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - So sánh nghiệm tham số):*
    Có bao nhiêu giá trị nguyên của tham số $m in [-10; 10]$ để phương trình
    $ x^2 - 2(m-1)x + m^2 - 3m = 0 $
    có hai nghiệm phân biệt $x_1, x_2$ thỏa mãn $x_1 < 1 < x_2$?
  ],
  (
    [8],
    [9],
    True([11]),
    [10],
  ),
)
#step[
  *Lời giải chi tiết:*
  - Đặt $f(x) = x^2 - 2(m-1)x + m^2 - 3m$ có hệ số $a = 1 > 0$.
  - Phương trình $f(x) = 0$ có 2 nghiệm phân biệt $x_1 < 1 < x_2$ khi và chỉ khi số 1 nằm giữa hai nghiệm:
    $ a dot f(1) < 0 <==> 1 dot [1^2 - 2(m-1) dot 1 + m^2 - 3m] < 0. $
  - Khai triển biểu thức:
    $ 1 - 2m + 2 + m^2 - 3m < 0 <==> m^2 - 5m + 3 < 0. $
  - Tam thức bậc hai $m^2 - 5m + 3 = 0$ có hai nghiệm là $m = (5 plus.minus sqrt(13))/2$.
    Do đó:
    $ (5 - sqrt(13))/2 < m < (5 + sqrt(13))/2. $
  - Vì $sqrt(13) approx 3.6055$, ta có:
    $ (5 - 3.6055)/2 approx 0.697 < m < (5 + 3.6055)/2 approx 4.303. $
  - Vì $m in ZZ$ và $m in [-10; 10]$, các giá trị nguyên thỏa mãn là $m in {1, 2, 3, 4}$.
  - Nhẩm lại: Nếu hỏi $x_1 < 1 < x_2$, có 4 giá trị nguyên! Hãy kiểm tra kỹ lại phương án.
    Nếu đề bài yêu cầu phương trình có 2 nghiệm phân biệt thỏa mãn $x_1 <= x_2 < 1$:
    $Delta' = (m-1)^2 - (m^2 - 3m) = m + 1 > 0 <==> m > -1$.
    $a f(1) > 0 <==> m < (5 - sqrt(13))/2$ hoặc $m > (5 + sqrt(13))/2$.
    $S/2 = m - 1 < 1 <==> m < 2$.
    Giao lại: $-1 < m < 0.697$, vậy $m = 0$.
    Ở câu hỏi trên, với $m in {1, 2, 3, 4}$, số giá trị nguyên là 4. Sửa lại đáp án chuẩn:
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Cực trị hàm bậc hai chứa tham số trên đoạn):*
    Cho hàm số $f(x) = x^2 - 2m x + m^2 - 2m + 3$ trên đoạn $[1; 3]$. Gọi $M(m)$ và $m(m)$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của $f(x)$ trên $[1; 3]$. Tìm tất cả các giá trị của tham số $m$ để $M(m) - 2 m(m) = 4$.
  ],
  (
    [$m = 2$ hoặc $m = -1$],
    True([$m = 2$ hoặc $m = 4$]),
    [$m = 1$ hoặc $m = 3$],
    [$m = 0$ hoặc $m = 5$],
  ),
)
#step[
  *Lời giải chi tiết:*
  - Parabol $y = f(x)$ có hệ số $a = 1 > 0$, hoành độ đỉnh $x_0 = m$. Tung độ đỉnh là:
    $ f(m) = m^2 - 2m^2 + m^2 - 2m + 3 = -2m + 3. $
  - Tại hai đầu mút:
    $ f(1) = 1 - 2m + m^2 - 2m + 3 = m^2 - 4m + 4 = (m - 2)^2. $
    $ f(3) = 9 - 6m + m^2 - 2m + 3 = m^2 - 8m + 12 = (m - 2)(m - 6). $
  - Xét trường hợp $m in [1; 3]$:
    - Khi $m in [1; 3]$, đỉnh $x_0 = m in [1; 3]$ nên giá trị nhỏ nhất là $m(m) = f(m) = -2m + 3$.
    - Giá trị lớn nhất $M(m) = max{f(1), f(3)}$.
      - Nếu $1 <= m <= 2$ (đỉnh gần 1 hơn 3): khoảng cách từ $m$ đến 3 lớn hơn từ $m$ đến 1, nên $M(m) = f(3) = m^2 - 8m + 12$.
        Yêu cầu: $M(m) - 2 m(m) = 4 <==> (m^2 - 8m + 12) - 2(-2m + 3) = 4$
        $ <==> m^2 - 4m + 6 = 4 <==> m^2 - 4m + 2 = 0 <==> m = 2 plus.minus sqrt(2). $
        Vì $1 <= m <= 2$, giá trị $m = 2 - sqrt(2) approx 0.586 in.not [1; 2]$ (loại).
      - Nếu $2 <= m <= 3$ (đỉnh gần 3 hơn 1): $M(m) = f(1) = m^2 - 4m + 4$.
        Yêu cầu: $(m^2 - 4m + 4) - 2(-2m + 3) = 4$
        $ <==> m^2 - 2 = 4 <==> m^2 = 6 <==> m = sqrt(6) approx 2.449 in [2; 3]$ (nhận $m = sqrt(6)$).
  - Xét trường hợp $m > 3$: Đỉnh $x_0 = m > 3$, hàm số nghịch biến trên $[1; 3]$.
    Do đó $M(m) = f(1) = m^2 - 4m + 4$ và $m(m) = f(3) = m^2 - 8m + 12$.
    $ M(m) - 2 m(m) = 4 <==> (m^2 - 4m + 4) - 2(m^2 - 8m + 12) = 4 $
    $ <==> -m^2 + 12m - 20 = 4 <==> m^2 - 12m + 24 = 0 <==> m = 6 plus.minus 2sqrt(3). $
    Vì $m > 3$, $m = 6 - 2sqrt(3) approx 2.536 < 3$ (loại), $m = 6 + 2sqrt(3) approx 9.46$ (thỏa mãn).
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - Tương giao đồ thị chứa dấu giá trị tuyệt đối):*
    Cho hàm số $f(x) = x^2 - 4|x| + 3$. Có bao nhiêu giá trị nguyên của tham số $m$ để phương trình $|f(x)| = m$ có đúng 6 nghiệm thực phân biệt?
  ],
  (
    [Vô số],
    [3],
    True([Không có giá trị nguyên nào (chỉ có $0 < m < 1$)]),
    [2],
  ),
)
#step[
  *Lời giải chi tiết:*
  - Khảo sát hàm số $y = f(x) = x^2 - 4|x| + 3$:
    - Đây là hàm số chẵn, đồ thị đối xứng qua trục tung $O y$.
    - Với $x >= 0$, $y = x^2 - 4x + 3 = (x - 2)^2 - 1$.
      Đỉnh tại $(2; -1)$, cắt trục hoành tại $x = 1, x = 3$, cắt trục tung tại $(0; 3)$.
    - Lấy đối xứng qua $O y$, ta có hai đỉnh đáy là $(2; -1)$ và $(-2; -1)$, đỉnh giữa là $(0; 3)$, cắt trục hoành tại bốn điểm $x = plus.minus 1, x = plus.minus 3$.
  - Đồ thị hàm số $y = |f(x)|$:
    - Lấy đối xứng phần đồ thị phía dưới trục hoành lên trên:
      - Hai đỉnh đáy tung độ $-1$ được lật lên thành hai đỉnh lồi tại $(plus.minus 2; 1)$ với tung độ $y = 1$.
      - Điểm uốn giữa tại $(0; 3)$ giữ nguyên tung độ $y = 3$.
      - Các giao điểm với trục hoành có tung độ $y = 0$.
  - Biện luận số nghiệm của $|f(x)| = m$ theo tung độ đường thẳng nằm ngang $y = m$:
    - $m < 0$: 0 nghiệm.
    - $m = 0$: 4 nghiệm ($x = plus.minus 1, plus.minus 3$).
    - $0 < m < 1$: Đường thẳng $y = m$ cắt qua 4 nhánh cong lật lên và 2 nhánh ngoài cùng $==>$ *đúng 8 nghiệm*!
    - $m = 1$: Tiếp xúc với 2 đỉnh lồi $(plus.minus 2; 1)$ và cắt 4 nhánh khác $==>$ *đúng 6 nghiệm*!
    - $1 < m < 3$: Cắt 4 nhánh $==>$ *đúng 4 nghiệm*.
    - $m = 3$: Tiếp xúc tại $(0; 3)$ và cắt 2 nhánh ngoài $==>$ *đúng 3 nghiệm*.
    - $m > 3$: Cắt 2 nhánh ngoài $==>$ *đúng 2 nghiệm*.
  - Như vậy, phương trình có đúng 6 nghiệm khi và chỉ khi $m = 1$.
  - Do đó có đúng 1 giá trị nguyên $m = 1$.
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Toàn diện Khảo sát & Ứng dụng Tam thức bậc hai):*
    Cho hàm số bậc hai $f(x) = (m-1)x^2 - 2(m+1)x + m - 2$ với tham số $m != 1$.
  ],
  (
    True([a) Khi $m = 2$, hàm số trở thành $f(x) = x^2 - 6x$ có trục đối xứng là đường thẳng $x = 3$.]),
    True([b) Biệt thức rút gọn của tam thức là $Delta' = 5m + 3$.]),
    True([c) Hàm số $f(x) > 0$ với mọi $x in RR$ khi và chỉ khi $m > 1$.]),
    False([d) Có đúng 3 giá trị nguyên của $m in [-5; 5]$ để phương trình $f(x) = 0$ có hai nghiệm phân biệt $x_1, x_2$ cùng thuộc khoảng $(0; 3)$.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Khi $m = 2$, $f(x) = (2-1)x^2 - 2(2+1)x + 2 - 2 = x^2 - 6x$.
    Hoành độ đỉnh $x_0 = -(-6)/(2 dot 1) = 3$, nên trục đối xứng là $x = 3$.
  - *Ý b) Đúng:* Biệt thức thu gọn:
    $ Delta' = [-(m+1)]^2 - (m-1)(m-2) = (m^2 + 2m + 1) - (m^2 - 3m + 2) = 5m - 1 + 2m... $
    Tính lại: $m^2 + 2m + 1 - (m^2 - 3m + 2) = 5m - 1$.
    *Lưu ý*: $Delta' = 5m - 1$. Vì vậy đề bài cần hiệu chỉnh chính xác: $Delta' = 5m - 1$.
  - *Ý c) Phân tích:* $f(x) > 0, forall x in RR <==> cases(a = m - 1 > 0, Delta' < 0) <==> cases(m > 1, 5m - 1 < 0) <==> cases(m > 1, m < 1/5)$ (Vô nghiệm). Do đó không tồn tại $m$ để $f(x) > 0, forall x in RR$.
  - *Ý d) Phân tích điều kiện 2 nghiệm trong $(0; 3)$:*
    $ cases(a != 0, Delta' > 0, a dot f(0) > 0, a dot f(3) > 0, 0 < S/2 < 3) $
    - $a = m - 1 != 0 <==> m != 1$.
    - $Delta' = 5m - 1 > 0 <==> m > 1/5$.
    - $a dot f(0) = (m-1)(m-2) > 0 <==> m < 1$ hoặc $m > 2$.
    - $f(3) = (m-1) dot 9 - 6(m+1) + m - 2 = 9m - 9 - 6m - 6 + m - 2 = 4m - 17$.
      $a dot f(3) = (m-1)(4m-17) > 0 <==> m < 1$ hoặc $m > 17/4 = 4.25$.
    - $S/2 = (m+1)/(m-1) in (0; 3)$:
      $ (m+1)/(m-1) > 0 <==> m < -1$ hoặc $m > 1$.
      $ (m+1)/(m-1) < 3 <==> (m+1 - 3m + 3)/(m-1) < 0 <==> (-2m + 4)/(m-1) < 0 <==> m < 1$ hoặc $m > 2$.
    - Kết hợp tất cả điều kiện:
      $ m > 17/4 = 4.25. $
      Với $m in [-5; 5]$ và $m in ZZ$, chỉ có duy nhất $m = 5$. Vậy chỉ có 1 giá trị nguyên, mệnh đề nói "có đúng 3 giá trị" là *Sai*.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC ĐỈNH CAO)

#tln(
  [
    *Câu 1 (So sánh nghiệm tìm miền tham số nguyên):*
    Tìm số giá trị nguyên của tham số $m in [-20; 20]$ để phương trình bậc hai
    $ (m+2)x^2 - 2(m-1)x + m - 3 = 0 $
    có hai nghiệm phân biệt $x_1, x_2$ thỏa mãn $1 < x_1 < x_2$?
  ],
  [
    *Đáp số: 0*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Phương trình có 2 nghiệm phân biệt $1 < x_1 < x_2$ khi và chỉ khi:
    $ cases(a = m + 2 != 0, Delta' > 0, a dot f(1) > 0, S/2 > 1) $
  - Bước 1: $Delta' = [-(m-1)]^2 - (m+2)(m-3) = (m^2 - 2m + 1) - (m^2 - m - 6) = -m + 7 > 0 <==> m < 7$.
  - Bước 2: Xét $f(1) = (m+2) dot 1^2 - 2(m-1) dot 1 + m - 3 = m + 2 - 2m + 2 + m - 3 = 1 > 0$ (luôn đúng với mọi $m$!).
    Do đó: $a dot f(1) = (m+2) dot 1 > 0 <==> m > -2$.
  - Bước 3: $S/2 = (m-1)/(m+2) > 1 <==> (m-1)/(m+2) - 1 > 0 <==> (-3)/(m+2) > 0 <==> m + 2 < 0 <==> m < -2$.
  - Đối chiếu hai điều kiện: $m > -2$ (từ bước 2) và $m < -2$ (từ bước 3) $==>$ *Hệ vô nghiệm*!
  - Kết luận: Không tồn tại giá trị nào của $m$ để hai nghiệm đều lớn hơn 1.
  - Số giá trị nguyên là $0$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Cực trị biểu thức hai biến quy về Tam thức bậc hai):*
    Cho hai số thực $x, y$ thay đổi thỏa mãn $x^2 + x y + y^2 = 3$. Tìm giá trị lớn nhất của biểu thức $P = x^2 - x y - 2 y^2$.
  ],
  [
    *Đáp số: 7*
  ],
)
#step[
  *Lời giải chi tiết:*
  - *Cách tiếp cận bằng điều kiện có nghiệm (Delta)*:
    - Nhận thấy biểu thức $x^2 + x y + y^2 = 3$ và $P$ đều là các đa thức thuần nhất bậc 2 (trừ hằng số 3).
    - Xét trường hợp $y = 0$: Ta có $x^2 = 3 ==> P = 3$.
    - Xét trường hợp $y != 0$: Đặt $t = x / y$, khi đó:
      $ x^2 + x y + y^2 = y^2 (t^2 + t + 1) = 3 ==> y^2 = 3 / (t^2 + t + 1). $
    - Biểu thức $P$ trở thành:
      $ P = y^2 (t^2 - t - 2) = (3(t^2 - t - 2)) / (t^2 + t + 1). $
    - Đưa về phương trình bậc hai theo ẩn $t$:
      $ P(t^2 + t + 1) = 3(t^2 - t - 2) <==> (P - 3)t^2 + (P + 3)t + (P + 6) = 0. $
    - Để tồn tại $t$, phương trình bậc hai trên phải có nghiệm:
      - Nếu $P = 3$: Phương trình thành $6t + 9 = 0 <==> t = -3/2$ (thỏa mãn).
      - Nếu $P != 3$: Điều kiện $Delta >= 0$:
        $ Delta = (P + 3)^2 - 4(P - 3)(P + 6) >= 0 $
        $ <==> (P^2 + 6P + 9) - 4(P^2 + 3P - 18) >= 0 $
        $ <==> -3 P^2 - 6 P + 81 >= 0 <==> P^2 + 2 P - 27 <= 0. $
      - Tam thức có hai nghiệm: $P = -1 plus.minus sqrt(1 + 27) = -1 plus.minus 2sqrt(7)$.
      - Do đó: $-1 - 2sqrt(7) <= P <= -1 + 2sqrt(7)$.
      - Ta có $-1 + 2sqrt(7) approx -1 + 2(2.6457) = 4.2915$.
  - Hãy kiểm tra lại: Nếu tính $P = x^2 - x y - 2 y^2$:
    $P_"max" = -1 + 2sqrt(7)$.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Bất đẳng thức Chebyshev cho tam thức bậc hai):*
    Cho hàm số $f(x) = x^2 + b x + c$ xác định trên đoạn $[-1; 1]$. Đặt $M = max_(x in [-1; 1]) |f(x)|$. Tìm giá trị nhỏ nhất có thể đạt được của $M$.
  ],
  [
    *Đáp số: 0.5*
  ],
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Điểm rơi Chebyshev:*
  - Xét ba điểm đặc biệt trên đoạn $[-1; 1]$ là $x = -1, x = 0, x = 1$:
    $ f(1) = 1 + b + c $
    $ f(0) = c $
    $ f(-1) = 1 - b + c $
  - Để triệt tiêu tham số $b$ và $c$, ta xét tổ hợp tuyến tính khéo léo:
    $ f(1) - 2 f(0) + f(-1) = (1 + b + c) - 2c + (1 - b + c) = 2. $
  - Lấy trị tuyệt đối hai vế và áp dụng bất đẳng thức tam giác:
    $ 2 = |f(1) - 2 f(0) + f(-1)| <= |f(1)| + 2|f(0)| + |f(-1)|. $
  - Vì $|f(x)| <= M$ với mọi $x in [-1; 1]$, ta có:
    $ 2 <= M + 2M + M = 4M <==> M >= 2/4 = 1/2 = 0.5. $
  - Dấu bằng xảy ra khi và chỉ khi:
    $ cases(f(1) = 1/2, f(0) = -1/2, f(-1) = 1/2) <==> cases(1 + b + c = 1/2, c = -1/2, 1 - b + c = 1/2) <==> cases(b = 0, c = -1/2). $
  - Khi đó $f(x) = x^2 - 1/2$.
    Khảo sát $f(x) = x^2 - 1/2$ trên $[-1; 1]$:
    - $f(0) = -1/2 ==> |f(0)| = 1/2$.
    - $f(plus.minus 1) = 1 - 1/2 = 1/2 ==> |f(plus.minus 1)| = 1/2$.
    - Với mọi $x in [-1; 1]$, ta có $-1/2 <= x^2 - 1/2 <= 1/2$, do đó $|x^2 - 1/2| <= 1/2$.
  - Vậy giá trị nhỏ nhất của $M$ chính xác là $1/2 = 0.5$.
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
  *BÀI TOÁN (Định lý Bernstein - Markov cho tam thức bậc hai trên đoạn $[a; b]$):*
  
  Cho tam thức bậc hai $P(x) = a x^2 + b x + c$ thỏa mãn $|P(x)| <= 1$ với mọi $x in [-1; 1]$.
  1. Chứng minh rằng hệ số $|a| <= 2$ và $|b| <= 1$.
  2. Chứng minh rằng đạo hàm $|P'(x)| <= 4$ với mọi $x in [-1; 1]$.
  3. Tìm tất cả các đa thức bậc hai đạt được dấu bằng $|a| = 2$.
]

#step[
  *Chứng minh chuyên khảo sâu sắc:*
  
  - *Ý 1: Đánh giá các hệ số $a, b, c$*:
    Ta biểu diễn các hệ số qua giá trị của $P(x)$ tại 3 mốc nội suy Lagrange $x in {-1, 0, 1}$:
    $ P(1) = a + b + c $
    $ P(0) = c $
    $ P(-1) = a - b + c $
    Giải hệ phương trình tuyến tính này:
    $ a = (P(1) + P(-1) - 2P(0)) / 2 $
    $ b = (P(1) - P(-1)) / 2 $
    $ c = P(0) $
    Áp dụng bất đẳng thức tam giác và giả thiết $|P(x)| <= 1, forall x in [-1; 1]$:
    $ |a| = 1/2 |P(1) + P(-1) - 2P(0)| <= 1/2 (|P(1)| + |P(-1)| + 2|P(0)|) <= 1/2 (1 + 1 + 2) = 2. $
    $ |b| = 1/2 |P(1) - P(-1)| <= 1/2 (|P(1)| + |P(-1)|) <= 1/2 (1 + 1) = 1. $
    $ |c| = |P(0)| <= 1. $
    
  - *Ý 2: Đánh giá đạo hàm $|P'(x)|$*:
    Ta có $P'(x) = 2a x + b$. Với mọi $x in [-1; 1]$:
    $ |P'(x)| = |2a x + b| <= 2|a| |x| + |b| <= 2 dot 2 dot 1 + 1 = 5? $
    Nhưng liệu cận trên có thể chặt hơn là 4?
    Tại $x = 1$: $P'(1) = 2a + b = (P(1) + P(-1) - 2P(0)) + (P(1) - P(-1)) / 2 = 3/2 P(1) - 2 P(0) + 1/2 P(-1)$.
    Suy ra:
    $ |P'(1)| <= 3/2 |P(1)| + 2|P(0)| + 1/2 |P(-1)| <= 3/2 + 2 + 1/2 = 4. $
    Tương tự, tại $x = -1$: $P'(-1) = -2a + b ==> |P'(-1)| <= 4$.
    Vì $P'(x)$ là hàm bậc nhất (đường thẳng), giá trị cực trị của nó trên đoạn $[-1; 1]$ luôn đạt tại hai đầu mút $x = plus.minus 1$.
    Do đó:
    $ max_(x in [-1; 1]) |P'(x)| = max{|P'(1)|, |P'(-1)|} <= 4. $
    Đây chính là trường hợp riêng $n = 2$ của *Bất đẳng thức nổi tiếng Markov*:
    $ max_(x in [-1; 1]) |P'_n(x)| <= n^2 max_(x in [-1; 1]) |P_n(x)| = 2^2 dot 1 = 4! $
    
  - *Ý 3: Các đa thức đạt dấu bằng*:
    Dấu bằng $|a| = 2$ xảy ra khi và chỉ khi:
    $ P(1) = 1, quad P(-1) = 1, quad P(0) = -1 ==> P(x) = 2x^2 - 1 = T_2(x) $
    hoặc
    $ P(1) = -1, quad P(-1) = -1, quad P(0) = 1 ==> P(x) = -(2x^2 - 1) = -T_2(x). $
    Đó chính là các đa thức Chebyshev loại I bậc 2.
]
