#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.0"
#import "../bbt.typ": *
#import "../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "THPT NGUYỄN HỮU CẢNH ",
  school: "ĐỀ THI THỬ LẦN 1 - 12C1",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "357",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [
  // ═══════════════════════════════════════════════════════════
  // PHẦN III — Trả lời ngắn
  // ═══════════════════════════════════════════════════════════
  #exam-part(
    [
      #set text(fill: rgb("d32f2f"))
      PHẦN III. Câu trắc nghiệm trả lời ngắn],
    count: 6,
  )
  #resetcau()

  #tln(
    [Hai đội tuyển $A$ và $B$ tham gia giải bóng bàn. Mỗi đội có $7$ người đã được sắp xếp theo một thứ tự nhất định. Đầu tiên, người thứ nhất của đội $A$, đấu với người thứ nhất của đội $B$ và người thua sẽ bị loại. Sau đó, người chiến thắng đấu tiếp với người thứ hai của đội kia, các trận thi đấu tiếp theo diễn ra tương tự. Cuộc thi đấu kết thúc cho đến khi tất cả người chơi của $1$ đội đều bị loại và đội còn lại là chiến thắng. Hỏi có bao nhiêu cách diễn ra cuộc thi đấu?],
    [$3432$],
    fig: cetz.canvas(length: 0.85cm, {
      import cetz.draw: *

      // === Đội A (bên trái) — 7 người ===
      for i in range(7) {
        let y = 3.6 - i * 1.1
        rect((-3.2, y - 0.38), (2.8, 0.76), stroke: 0.6pt + rgb("#2e7d32"), fill: rgb("e8f5e9"), radius: 3pt)
        content((-1.8, y), text(size: 8pt, weight: "bold")[$A_#(i + 1)$])
      }
      // Đội A label
      rect((-3.2, -4.5), (2.8, 0.7), stroke: none, fill: rgb("c8e6c9"), radius: 3pt)
      content((-1.8, -4.15), text(size: 9pt, weight: "bold", fill: rgb("#1b5e20"))[Đội $A$])

      // === Đội B (bên phải) — 7 người ===
      for i in range(7) {
        let y = 3.6 - i * 1.1
        rect((2.6, y - 0.38), (2.8, 0.76), stroke: 0.6pt + rgb("#c62828"), fill: rgb("fce4ec"), radius: 3pt)
        content((4.0, y), text(size: 8pt, weight: "bold")[$B_#(i + 1)$])
      }
      // Đội B label
      rect((2.6, -4.5), (2.8, 0.7), stroke: none, fill: rgb("f8bbd0"), radius: 3pt)
      content((4.0, -4.15), text(size: 9pt, weight: "bold", fill: rgb("#880e4f"))[Đội $B$])

      // === Sơ đồ diễn biến trận đấu ===
      // Trận 1: A1 đấu B1
      line((-0.4, 3.3), (2.6, 3.3), mark: (end: ">"), stroke: 0.7pt + black)
      content((1.1, 3.7), text(size: 7pt, fill: black)[Trận 1], anchor: "south")

      // Người thắng đi tiếp (giả sử winner sang phải)
      line((1.1, 3.3), (1.1, 2.2), mark: (end: ">"), stroke: (dash: "dashed", paint: rgb("757575")))
      content((1.8, 2.75), text(size: 7pt, fill: rgb("757575"), style: "italic")[thắng], anchor: "west")

      // Trận 2: winner đấu với người tiếp theo
      line((1.1, 2.2), (2.6, 2.2), mark: (end: ">"), stroke: 0.7pt + black)
      content((1.85, 2.55), text(size: 7pt, fill: black)[Trận 2], anchor: "south")

      // Dấu ba chấm cho các trận tiếp theo
      for y-dot in (1.3, 0.4, -0.5, -1.4, -2.3) {
        content((1.1, y-dot), text(fill: rgb("9e9e9e"), size: 10pt)[$cdots$])
      }

      // Trận cuối
      content((1.1, -3.25), text(size: 7pt, fill: black, weight: "bold")[Trận cuối], anchor: "south")

      // === Chú thích phụ ===
      rect((-3.2, -6), (8.6, 0.9), stroke: 0.5pt + luma(200), fill: rgb("f5f5f5"), radius: 2pt)
      content((-1.5, -5.55), text(size: 7.5pt, fill: rgb("616161"))[
        Mỗi trận loại 1 người. Tối đa 13 trận.
      ])
    }),
    fig-pos: "right",
    fig-width: 25%,
    loigiai: [
      #ppgiai[
        *Phân tích:* Mỗi trận đấu loại đúng $1$ người. Cuộc thi kết thúc khi một đội bị loại toàn bộ $7$ thành viên. Như vậy đội thắng có đúng $7$ trận thắng, đội thua có $k$ trận thắng với $0 <= k <= 6$. Tổng số trận tối đa là $13$.
      ]

      *Cách tiếp cận:* Ta đếm số dãy kết quả các trận đấu. Mỗi trận, ký hiệu $X$ nếu đội $X$ thắng, $Y$ nếu đội $Y$ thắng. Trận cuối cùng luôn là $X$ (vì $X$ thắng chung cuộc). Trước đó, trong $6 + k$ trận, $X$ thắng $6$ trận và $Y$ thắng $k$ trận.

      Số cách sắp xếp $6$ chữ $X$ và $k$ chữ $Y$ trong $6 + k$ vị trí là số cách chọn $k$ vị trí cho $Y$:
      $
        C_(6 + k)^k.
      $

      Cho $k$ chạy từ $0$ đến $6$, tổng số cách cho đội $X$ thắng là:
      $
        S = sum_(k=0)^6 C_(6 + k)^k
        = C_6^0 + C_7^1 + C_8^2 + C_9^3 + C_10^4 + C_11^5 + C_12^6.
      $

      Tính từng số hạng:
      $
        C_6^0 = 1, C_7^1 = 7, C_8^2 = 28, C_9^3 = 84, C_10^4 = 210, C_11^5 = 462, C_12^6 = 924.
      $

      Cộng lại:
      $
        S = 1 + 7 + 28 + 84 + 210 + 462 + 924 = 1716.
      $

      Vì vai trò $A$ và $B$ như nhau, tổng số cách diễn ra cuộc thi là:
      $
        2 dot 1716 = 3432.
      $

      #meo[
        Công thức tổng quát: với $a$ người đội $A$, $b$ người đội $B$, số cách diễn ra là $C_(a+b)^a$. Có thể chứng minh bằng quy nạp hoặc dùng bài toán "bầu cử" (ballot problem).
      ]
    ],
  )

  #tln(
    [Hàm lượng các chất vitamin A, vitamin B và vitamin K chứa trong $100$ g mỗi loại thực phẩm $X$ và $Y$ được cho bảng sau:

      #align(center)[
        #table(
          columns: 4,
          align: center,
          stroke: 0.5pt + black,
          [],
          [vitamin A (mg)],
          [vitamin B (mg)],
          [vitamin K (mg)],
          table.hline(),
          [$X$], [$200$], [$600$], [$8$],
          [$Y$], [$500$], [$300$], [$6$],
        )
      ]

      Từ hai loại thực phẩm $X$ và $Y$, người ta muốn tạo ra một lượng thực phẩm hỗn hợp chứa ít nhất $2 000$ mg vitamin A, $3 000$ mg vitamin B, $48$ mg vitamin K. Lượng thực phẩm hỗn hợp có khối lượng nhỏ nhất thỏa mãn yêu cầu trên là bao nhiêu? (đơn vị: kilogram; làm tròn đến hàng phần trăm)],
    [$0","66$],
    fig: cetz.canvas(length: 5mm, {
      import cetz.draw: *

      // Axes
      line((-1, 0), (12.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 12.5), mark: (end: ">"))
      content((12.8, 0), $x$)
      content((0, 12.8), $y$)
      content((-0.4, -0.4), $O$)

      // ===== Boundaries =====
      // Constraint (A): 2x + 5y >= 20 → y >= (20-2x)/5
      let a-pts = ()
      for i in range(0, 101) {
        let x = i / 10.0
        let y = (20 - 2 * x) / 5
        if y >= 0 { a-pts.push((x, y)) }
      }
      line(..a-pts, stroke: 1pt + rgb("#43a047"))
      content((9.5, 0.6), text(fill: rgb("#43a047"), size: 7.5pt, weight: "bold")[$(A)$], angle: -15deg)

      // Constraint (B): 2x + y >= 10 → y >= 10 - 2x
      let b-pts = ()
      for i in range(0, 51) {
        let x = i / 10.0
        let y = 10 - 2 * x
        if y >= 0 { b-pts.push((x, y)) }
      }
      line(..b-pts, stroke: 1pt + rgb("#1e88e5"))
      content((1.2, 8.2), text(fill: rgb("#1e88e5"), size: 7.5pt, weight: "bold")[$(B)$], angle: -60deg)

      // Constraint (K): 4x + 3y >= 24 → y >= (24 - 4x)/3
      let k-pts = ()
      for i in range(0, 61) {
        let x = i / 10.0
        let y = (24 - 4 * x) / 3
        if y >= 0 { k-pts.push((x, y)) }
      }
      line(..k-pts, stroke: 1pt + rgb("#e53935"))
      content((4.2, 3.2), text(fill: rgb("#e53935"), size: 7.5pt, weight: "bold")[$(K)$], angle: -50deg)

      // ===== Feasible region (shaded) =====
      // The feasible boundary consists of 3 segments:
      // (B) from x=0 to intersection with (K) at (3,4)
      // (K) from (3,4) to intersection with (A) at (30/7, 16/7)
      // (A) from (30/7, 16/7) onwards
      let bound-pts = ()
      // Segment along (B) from x=0 to x=3
      for i in range(0, 31) {
        let x = i / 10.0
        let y = 10 - 2 * x
        bound-pts.push((x, y))
      }
      // Segment along (K) from x=3 to x=30/7 ≈ 4.286
      for i in range(30, 44) {
        let x = i / 10.0
        let y = (24 - 4 * x) / 3
        bound-pts.push((x, y))
      }
      // Segment along (A) from x=30/7 to x=10
      for i in range(43, 101) {
        let x = i / 10.0
        let y = (20 - 2 * x) / 5
        if y >= 0 { bound-pts.push((x, y)) }
      }
      // Close polygon going up to top-right corner and back
      let top-x = 10
      let top-y = 10
      bound-pts.push((top-x, top-y))
      bound-pts.push((0, top-y))
      bound-pts.push((0, 10))
      line(..bound-pts, fill: rgb("bbdefb").transparentize(70%), stroke: none)

      // ===== Key points =====
      let opt-x = 30.0 / 7
      let opt-y = 16.0 / 7

      // Intersection (B)∩(K) at (3,4)
      circle((3, 4), radius: 1.8pt, fill: rgb("#1e88e5"))
      content((3.2, 4.3), text(fill: rgb("#1e88e5"), size: 8pt)[$(3;4)$], anchor: "south-west")

      // Optimal point M
      circle((opt-x, opt-y), radius: 2.2pt, fill: rgb("#e53935"))
      content(
        (opt-x + 0.4, opt-y + 0.4),
        text(fill: rgb("#e53935"), size: 8.5pt, weight: "bold")[$M(frac(30, 7); frac(16, 7))$],
        anchor: "south-west",
      )

      // Connect intersection points (dashed polygon edge)
      line((3, 4), (opt-x, opt-y), stroke: (dash: "dashed", paint: gray, thickness: 0.6pt))

      // ===== Tick marks =====
      for ix in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) {
        line((ix, 0.15), (ix, -0.15))
        if calc.rem(ix, 2) == 0 {
          content((ix, -0.5), text(size: 7pt)[#ix])
        }
      }
      for iy in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) {
        line((0.15, iy), (-0.15, iy))
        if calc.rem(iy, 2) == 0 {
          content((-0.6, iy), text(size: 7pt)[#iy])
        }
      }

      // ===== Legend =====
      line((7.5, 11.5), (8.5, 11.5), stroke: 1pt + rgb("#1e88e5"))
      content((8.7, 11.5), text(size: 7pt)[$2x + y = 10$], anchor: "west")
      line((7.5, 10.8), (8.5, 10.8), stroke: 1pt + rgb("#e53935"))
      content((8.7, 10.8), text(size: 7pt)[$4x + 3y = 24$], anchor: "west")
      line((7.5, 10.1), (8.5, 10.1), stroke: 1pt + rgb("#43a047"))
      content((8.7, 10.1), text(size: 7pt)[$2x + 5y = 20$], anchor: "west")
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        *Phân tích:* Gọi $x$, $y$ lần lượt là số đơn vị $100$ g thực phẩm $X$ và $Y$ ($x >= 0$, $y >= 0$). Khối lượng hỗn hợp là $m = 0","1(x + y)$ kg. Ta cần tìm $min(x + y)$ thỏa mãn các ràng buộc về vitamin.
      ]

      *Bước 1: Lập hệ bất phương trình ràng buộc.*

      Từ bảng hàm lượng vitamin, ta có:
      $
        cases(
          200x + 500y >= 2000 & " (vitamin A)",
          600x + 300y >= 3000 & " (vitamin B)",
          8x + 6y >= 48 & " (vitamin K)",
          x >= 0, y >= 0
        )
      $

      Rút gọn:
      $
        cases(
          2x + 5y >= 20 & "(A)",
          2x + y >= 10 & "(B)",
          4x + 3y >= 24 & "(K)",
          x >= 0, y >= 0
        )
      $

      *Bước 2: Xác định miền nghiệm trên mặt phẳng $O x y$.*

      Vẽ các đường thẳng tương ứng:
      - $(d_A): 2x + 5y = 20$ (màu xanh lá)
      - $(d_B): 2x + y = 10$ (màu xanh dương)
      - $(d_K): 4x + 3y = 24$ (màu đỏ)

      Miền nghiệm là phần mặt phẳng thỏa mãn đồng thời cả ba bất phương trình, tức là phần nằm phía trên cả ba đường thẳng (phần tô màu xanh nhạt trên đồ thị).

      Đường biên của miền nghiệm là đường gấp khúc gồm ba đoạn, được xác định bằng cách tìm đường nào "trội" nhất (cho $y$ lớn nhất) tại mỗi $x$:

      $
        y_A = 4 - 0","4x, quad
        y_B = 10 - 2x, quad
        y_K = 8 - frac(4, 3)x.
      $

      Tìm giao điểm các đường:
      - $(d_B) cap (d_K)$: giải $cases(2x + y = 10, 4x + 3y = 24)$ $=> (x; y) = (3; 4)$.
      - $(d_K) cap (d_A)$: giải $cases(4x + 3y = 24, 2x + 5y = 20)$ $=> (x; y) = (30/7; 16/7)$.

      Vậy đường biên gồm:
      - Đoạn 1 ($0 <= x <= 3$): trên $(d_B)$, $y = 10 - 2x$.
      - Đoạn 2 ($3 <= x <= 30/7$): trên $(d_K)$, $y = 8 - 4x/3$.
      - Đoạn 3 ($x >= 30/7$): trên $(d_A)$, $y = 4 - 0","4x$.

      *Bước 3: Tìm giá trị nhỏ nhất của $f(x, y) = x + y$.*

      Cách 1 — Xét trên từng đoạn của đường biên:
      $
        & 0 <= x <= 3: f = x + (10 - 2x) = 10 - x => "nghịch biến, min tại" x = 3: f = 7. \
        & 3 <= x <= 30/7: f = x + (8 - 4x/3) = 8 - x/3 => "nghịch biến, min tại" x = 30/7: f = 46/7 approx 6","57. \
        & x >= 30/7: f = x + (4 - 0","4x) = 4 + 0","6x => "đồng biến, min tại" x = 30/7: f = 46/7.
      $

      Cách 2 — Phương pháp đỉnh (nhanh hơn):
      Hàm mục tiêu $f(x, y) = x + y$ đạt giá trị nhỏ nhất tại một đỉnh của miền đa giác. Các đỉnh cần xét:
      - Đỉnh $P(3; 4)$: $f = 3 + 4 = 7$.
      - Đỉnh $Q(30/7; 16/7)$: $f = 30/7 + 16/7 = 46/7 approx 6","57$.

      So sánh: $46/7 < 7$, vậy $min(x + y) = 46/7$, đạt tại $x = 30/7$, $y = 16/7$.

      *Bước 4: Tính khối lượng hỗn hợp nhỏ nhất.*

      Mỗi đơn vị $x$ hoặc $y$ tương ứng $100$ g = $0","1$ kg, nên:
      $
        m_min = 0","1 dot (x + y)_min = 0","1 dot 46/7 = 46/70 = 23/35 approx 0","65714 " kg".
      $

      Làm tròn đến hàng phần trăm: *$0","66$ kg*.

      #nhanxet[
        Bài toán quy hoạch tuyến tính hai biến có thể giải nhanh bằng phương pháp đỉnh: chỉ cần tính giá trị $x + y$ tại các giao điểm của các đường ràng buộc, chọn giá trị nhỏ nhất. Ở đây ta chỉ có hai đỉnh cần xét vì miền nghiệm mở về phía trên bên phải.
      ]
    ],
  )

  #tln(
    [Một công ty du lịch thông báo giá tiền cho chuyến đi tham quan của một nhóm khách du lịch như sau: $20$ khách đầu tiên có giá là $30$ USD/người; nếu có nhiều hơn $20$ người đăng kí thì cứ có thêm $1$ người, giá vé sẽ giảm $1$ USD/người cho toàn bộ hành khách. Hỏi công ty nên giới hạn số lượng hành khách tối đa là bao nhiêu để công ty không bị lỗ? Biết rằng chi phí của chuyến đi là $400$ USD.],
    [$40$],
    fig: cetz.canvas(length: 4mm, {
      import cetz.draw: *

      // Axes
      line((-1, 0), (14, 0), mark: (end: ">"))
      content((14.3, 0), $n$)
      line((0, -1), (0, 8), mark: (end: ">"))
      content((0, 8.3), $P(n)$)
      content((-0.5, -0.5), $O$)

      // Profit function P(n) = -n^2 + 50n - 400
      let curve = ()
      for i in range(20, 81) {
        let n = i / 2.0
        let P = -n * n + 50 * n - 400
        let y = P / 100
        if y >= -0.8 {
          curve.push((n / 4, y))
        }
      }
      line(..curve, stroke: 1.4pt + rgb("#1565c0"))

      // Shade profit region between curve and axis for n in [20,40]
      let shade-pts = ()
      for i in range(40, 81) {
        let n = i / 2.0
        if n >= 20 and n <= 40 {
          let P = -n * n + 50 * n - 400
          let y = P / 100
          if y >= 0 {
            shade-pts.push((n / 4, y))
          }
        }
      }
      // Close polygon for shading
      let start-x = 5.0 // n=20 / 4
      let end-x = 10.0 // n=40 / 4
      shade-pts.insert(0, (start-x, 0))
      shade-pts.push((end-x, 0))
      line(..shade-pts, fill: rgb("c8e6c9").transparentize(40%), stroke: none)

      // Break-even line P=0
      line((0, 0), (14, 0), stroke: (dash: "dashed", paint: rgb("#e53935")))
      content((13, 0.3), text(fill: rgb("#e53935"), size: 8pt)[$P=0$])

      // Mark n=10 and n=40 (break-even points)
      circle((10.0 / 4, 0), radius: 1.8pt, fill: rgb("#e53935"))
      content((10.0 / 4, -0.5), text(fill: rgb("#e53935"), size: 8pt)[$n=10$], anchor: "north")

      circle((40.0 / 4, 0), radius: 1.8pt, fill: rgb("#e53935"))
      content((40.0 / 4, -0.5), text(fill: rgb("#e53935"), size: 8pt)[$n=40$], anchor: "north")

      // Mark n=20 (minimum group size)
      line((20.0 / 4, -0.3), (20.0 / 4, 6.5), stroke: (dash: "dotted", paint: gray, thickness: 0.6pt))
      content((20.0 / 4, 6.7), text(fill: gray, size: 8pt)[$n=20$], anchor: "south")

      // Label "Không lỗ" in the shaded region
      content((30.0 / 4, 1.8), text(fill: rgb("#2e7d32"), size: 9pt, weight: "bold")[Không lỗ])

      // Vertex of parabola n=25
      circle((25.0 / 4, 2.25), radius: 1.5pt, fill: rgb("#1565c0"))
      content((25.0 / 4, 2.6), text(fill: rgb("#1565c0"), size: 8pt)[$n=25$], anchor: "south")

      // Tick marks
      for i in (0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50) {
        let x = i / 4.0
        line((x, 0.15), (x, -0.15))
        if calc.rem(i, 10) == 0 {
          content((x, -0.6), text(size: 7pt)[#i], anchor: "north")
        }
      }
      for j in (0, 100, 200, 300, 400, 500, 600) {
        let y = j / 100.0
        line((0.15, y), (-0.15, y))
        if calc.rem(j, 200) == 0 {
          content((-0.6, y), text(size: 7pt)[#j], anchor: "east")
        }
      }
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        - Gọi $n$ là số hành khách ($n >= 20$).
        - Biểu diễn giá vé mỗi người và tổng doanh thu theo $n$.
        - Thiết lập bất phương trình: doanh thu $>=$ chi phí, rồi giải tìm $n$.
      ]

      *Bước 1: Thiết lập hàm doanh thu.*
      Với $n$ hành khách ($n >= 20$), mỗi hành khách phải trả:
      $
        p(n) = 30 - (n - 20) = 50 - n quad ("USD").
      $
      Tổng doanh thu:
      $
        R(n) = n dot (50 - n) = 50n - n^2.
      $

      *Bước 2: Điều kiện không bị lỗ.*
      Công ty không bị lỗ khi tổng doanh thu lớn hơn hoặc bằng chi phí:
      $
        R(n) >= 400 <=> 50n - n^2 >= 400 <=> n^2 - 50n + 400 <= 0.
      $

      Giải bất phương trình bậc hai:
      $
        Delta = (-50)^2 - 4 dot 1 dot 400 = 2500 - 1600 = 900 => sqrt(Delta) = 30.
      $
      $
        n_1 = (50 - 30)/2 = 10,
        quad n_2 = (50 + 30)/2 = 40.
      $

      Vậy $n^2 - 50n + 400 <= 0$ khi $10 <= n <= 40$.

      Kết hợp với $n >= 20$, ta được $20 <= n <= 40$.

      Vậy số hành khách tối đa để công ty không bị lỗ là *$40$* người.

      #meo[
        Bài toán đưa về bất phương trình bậc hai quen thuộc. Có thể kiểm tra nhanh: tại $n=40$, doanh thu $= 40 dot 10 = 400$, vừa đúng bằng chi phí, nên đây là điểm hòa vốn.
      ]
    ],
  )

  #tln(
    [Một viên gạch hình vuông $A B C D$ có cạnh $60$. Người ta trang trí viên gạch bằng các đường cong $(L_1)$, $(L_2)$. $(L_1)$ là tập hợp các điểm $M$ thỏa $M C = M A + 50$ hoặc $M A = M C + 50$. Khi quay đường cong $(L_1)$ quanh tâm viên gạch hình vuông đó một góc $90^(circle)$ ta được đường cong $(L_2)$. Tính diện tích hình phẳng giới hạn bởi các đường cong $(L_1)$, $(L_2)$ và các cạnh viên gạch (phần màu trắng, kết quả làm tròn đến hàng đơn vị).],
    [$899$],
    fig: cetz.canvas(length: 0.85cm, {
      import cetz.draw: *

      // ===== Square ABCD =====
      let SQ = 3.2
      let A = (-SQ, -SQ)
      let B = (SQ, -SQ)
      let C = (SQ, SQ)
      let D = (-SQ, SQ)

      // Draw filled square with light background
      rect(A, (C), fill: rgb("fff8e1"), stroke: 1.2pt + black)

      // ===== Hyperbola branches =====
      // Helper: generate parametric hyperbola branch within square
      // H1: u^2/25^2 - v^2/2975 = 1  (blue)
      // H2: v^2/25^2 - u^2/2975 = 1  (red)
      // where u = x+y, v = x-y, square: |u|+|v| <= 60

      let xmin = -SQ - 0.3
      let xmax = SQ + 0.3
      let ymin = -SQ - 0.3
      let ymax = SQ + 0.3

      let gen-h1(su, sv) = {
        let pts = ()
        let u = su * 25.0
        let step = su * 0.3
        for _ in range(50) {
          let arg = u * u / 625.0 - 1
          if arg >= 0 {
            let v = sv * calc.sqrt(2975.0 * arg)
            let cx = (u + v) / 20.0
            let cy = (u - v) / 20.0
            if cx >= xmin and cx <= xmax and cy >= ymin and cy <= ymax {
              pts.push((cx, cy))
            }
          }
          u += step
          if (su > 0 and u > 60) or (su < 0 and u < -60) { break }
        }
        if pts.len() > 1 { line(..pts, stroke: 1pt + rgb("#1a237e")) }
      }

      let gen-h2(sv, su) = {
        let pts = ()
        let v = sv * 25.0
        let step = sv * 0.3
        for _ in range(50) {
          let arg = v * v / 625.0 - 1
          if arg >= 0 {
            let u = su * calc.sqrt(2975.0 * arg)
            let cx = (u + v) / 20.0
            let cy = (u - v) / 20.0
            if cx >= xmin and cx <= xmax and cy >= ymin and cy <= ymax {
              pts.push((cx, cy))
            }
          }
          v += step
          if (sv > 0 and v > 60) or (sv < 0 and v < -60) { break }
        }
        if pts.len() > 1 { line(..pts, stroke: 1pt + rgb("#b71c1c")) }
      }

      // Draw all 4 branches of each hyperbola
      for su in (1, -1) {
        for sv in (1, -1) {
          gen-h1(su, sv)
          gen-h2(sv, su)
        }
      }

      // ===== Vertex labels =====
      content(A, $A$, anchor: "north-east", padding: 3pt)
      content(B, $B$, anchor: "north-west", padding: 3pt)
      content(C, $C$, anchor: "south-west", padding: 3pt)
      content(D, $D$, anchor: "south-east", padding: 3pt)
      content((0, 0), $O$, anchor: "south-west", padding: 2pt)

      // ===== Center dot =====
      circle((0, 0), radius: 1.5pt, fill: black)

      // ===== Legend box =====
      rect((-SQ, SQ + 0.3), (SQ, 1.0), fill: white, stroke: 0.5pt + luma(180), radius: 2pt)
      line((-SQ + 0.3, SQ + 0.7), (-SQ + 0.8, SQ + 0.7), stroke: 1pt + rgb("#1a237e"))
      content((-SQ + 1.0, SQ + 0.7), $(L_1)$, anchor: "west")
      line((-SQ + 2.0, SQ + 0.7), (-SQ + 2.5, SQ + 0.7), stroke: 1pt + rgb("#b71c1c"))
      content((-SQ + 2.7, SQ + 0.7), $(L_2)$, anchor: "west")
    }),
    fig-pos: "right",
    fig-width: 35%,
    loigiai: [
      #ppgiai[
        - Đặt hệ trục $O x y$ với gốc $O$ tại tâm hình vuông. Các đỉnh: $A(-30; -30)$, $B(30; -30)$, $C(30; 30)$, $D(-30; 30)$.
        - $(L_1)$ là hypebol có tiêu điểm $A$, $C$ với hiệu khoảng cách bằng $50$.
        - $(L_2)$ là hypebol có tiêu điểm $B$, $D$, cũng với hiệu $50$ (do quay $90^(circle)$).
        - Đổi biến $u = x + y$, $v = x - y$ để đưa về dạng chính tắc. Tính diện tích bằng tích phân.
      ]

      *Bước 1: Đưa về dạng chính tắc.*
      Trong hệ $(u, v)$:
      - Tiêu điểm của $(L_1)$: $A(-60; 0)$, $C(60; 0)$. Phương trình: $u^2 / 25^2 - v^2 / 2975 = 1$.

      - Tiêu điểm của $(L_2)$: $B(0; 60)$, $D(0; -60)$. Phương trình: $v^2 / 25^2 - u^2 / 2975 = 1$.
      - Hình vuông: $|u| + |v| <= 60$.

      *Bước 2: Xác định miền.*
      Phần không trang trí (màu trắng) là phần bù của giao hai miền "trong" hypebol:
      $
        u^2 / 25^2 - v^2 / 2975 <= 1 quad "và" quad v^2 / 25^2 - u^2 / 2975 <= 1
      $
      nằm trong hình vuông.

      Giao điểm của hai nhánh hypebol trong góc phần tư thứ nhất: $u = v = sqrt(25^2 dot 2975 / 2350) approx 28","13$.

      *Bước 3: Tính diện tích phần trang trí.*
      Do tính đối xứng qua $4$ góc, diện tích phần trang trí là $4$ lần diện tích trong một góc.
      Trong góc $u >= 0$, $v >= 0$:
      $
        S_1 = integral_0^25 25 sqrt(1 + u^2 / 2975) dif u + integral_25^(u_0) lr(25 sqrt(1 + u^2 / 2975) - sqrt(2975(u^2 / 625 - 1))) dif u approx 675","28.
      $
      $S_("trang trí") = 4S_1 approx 2701","10$.

      *Bước 4: Diện tích phần màu trắng.*
      $
        S_("trắng") = S_("vuông") - S_("trang trí") = 60^2 - 2701","10 = 3600 - 2701","10 = 898","90.
      $
      Làm tròn đến hàng đơn vị: *$899$*.

      #nhanxet[Bài toán kết hợp giữa hình học giải tích phẳng, phép quay và tích phân. Việc đổi biến $(u, v)$ đưa các hypebol về dạng chính tắc giúp việc tính toán trở nên đơn giản hơn nhiều.]
    ],
  )

  #tln(
    [Cho hình lăng trụ tam giác đều $A B C.A' B' C'$ có tất cả các cạnh bằng $2$ cm. Gọi $M$ và $N$ lần lượt là trung điểm $B' C'$ và $A' B'$. Gọi $alpha$ là góc tạo bởi $M N$ và $(B C C' B')$. Tính $tan^2 alpha$.],
    [$3$],
    fig: cetz.canvas(length: 0.9cm, {
      import cetz.draw: *

      // Oblique projection: y-axis goes into page (up-left)
      // (x, y, z) → (x - a*y, z + b*y) with a=0.35, b=0.25
      let proj(x, y, z) = (x - 0.40 * y, z + 0.30 * y)

      // Scale factor to fit canvas nicely
      let s = 1.3

      // Prism coordinates: ABC base at z=0, A'B'C' top at z=2
      // A(0; √3; 0), B(-1; 0; 0), C(1; 0; 0)
      let A = proj(0, 1.732, 0)
      let B = proj(-1, 0, 0)
      let C = proj(1, 0, 0)
      let Ap = proj(0, 1.732, 2)
      let Bp = proj(-1, 0, 2)
      let Cp = proj(1, 0, 2)

      // Midpoints
      // M: trung điểm B'C' → (0; 0; 2)
      // N: trung điểm A'B' → (-0.5; √3/2; 2)
      let M_sc = proj(0, 0, 2)
      let N_sc = proj(-0.5, 0.866, 2)

      // Color scheme
      let edge-col = black
      let hidden-col = gray.lighten(20%)
      let plane-fill = rgb("e8ffe8").transparentize(40%)
      let base-fill = rgb("e3f2fd").transparentize(60%)

      // ── Base triangle (ABC) fill ──
      bezier(A, B, C, close: true, fill: base-fill, stroke: none)
      // ── Top triangle (A'B'C') fill ──
      bezier(Ap, Bp, Cp, close: true, fill: base-fill, stroke: none)

      // ── Hidden edges (dashed, behind) ──
      line(A, B, stroke: (dash: "dashed", paint: hidden-col, thickness: 0.7pt))
      line(B, Bp, stroke: (dash: "dashed", paint: hidden-col, thickness: 0.7pt))
      line(Ap, Bp, stroke: (dash: "dashed", paint: hidden-col, thickness: 0.7pt))

      // ── Visible edges ──
      line(B, C, stroke: 0.9pt + edge-col)
      line(C, A, stroke: 0.9pt + edge-col)
      line(A, Ap, stroke: 0.9pt + edge-col)
      line(C, Cp, stroke: 0.9pt + edge-col)
      line(Bp, Cp, stroke: 0.9pt + edge-col)
      line(Cp, Ap, stroke: 0.9pt + edge-col)

      // ── Plane (BCC'B') highlight ──
      bezier(B, C, Cp, Bp, close: true, fill: plane-fill, stroke: 0.6pt + rgb("#1b5e20"))
      content(proj(0, 0, 1.0), text(fill: rgb("#1b5e20"), size: 7pt, style: "italic")[$(B C C' B')$], anchor: "west")

      // ── Dotted line from N to plane (perpendicular indicator) ──
      let N-proj = proj(-0.5, 0, 2)
      line(N_sc, N-proj, stroke: (dash: "dotted", paint: rgb("#1565c0"), thickness: 0.4pt))

      // ── Points M, N ──
      circle(M_sc, radius: 2pt, fill: white, stroke: 1.2pt + rgb("#1565c0"))
      circle(N_sc, radius: 2pt, fill: white, stroke: 1.2pt + rgb("#1565c0"))
      content(M_sc, $M$, anchor: "south-west", padding: 4pt)
      content(N_sc, $N$, anchor: "south-east", padding: 4pt)

      // ── Segment MN (highlighted) ──
      line(M_sc, N_sc, stroke: 2pt + rgb("#e53935"))
      content(
        proj(-0.25, 0.433, 2.2),
        text(fill: rgb("#e53935"), size: 7pt, weight: "bold")[$M N$],
        anchor: "south-east",
      )

      // ── Vertex labels ──
      content(A, $A$, anchor: "east", padding: 4pt)
      content(B, $B$, anchor: "north", padding: 4pt)
      content(C, $C$, anchor: "south-west", padding: 4pt)
      content(Ap, $A'$, anchor: "east", padding: 4pt)
      content(Bp, $B'$, anchor: "south", padding: 4pt)
      content(Cp, $C'$, anchor: "south-west", padding: 4pt)

      // ── Legend ──
      rect((-2.8, 3.2), (5.6, 0.9), fill: white, stroke: 0.5pt + luma(200), radius: 2pt)
      line((-2.6, 3.6), (-2.1, 3.6), stroke: 2pt + rgb("#e53935"))
      content((-1.9, 3.6), text(size: 7.5pt)[$M N$], anchor: "west")
      line((-0.4, 3.6), (0.1, 3.6), stroke: 0.6pt + rgb("#1b5e20"))
      content((0.3, 3.6), text(size: 7.5pt)[$(B C C' B')$], anchor: "west")
      line((2.0, 3.6), (2.5, 3.6), stroke: (dash: "dashed", paint: hidden-col, thickness: 0.7pt))
      content((2.7, 3.6), text(size: 7.5pt)[cạnh khuất], anchor: "west")
    }),
    fig-pos: "right",
    fig-width: 30%,
    loigiai: [
      #ppgiai[
        - Đặt hệ trục tọa độ $O x y z$ phù hợp với lăng trụ.
        - Xác định tọa độ $M$, $N$ và vectơ pháp tuyến của mặt phẳng $(B C C' B')$.
        - Dùng công thức $sin alpha = (|arrow(M N) dot arrow(n)|) / (|arrow(M N)| dot |arrow(n)|)$, rồi suy ra $tan^2 alpha$.
      ]

      *Bước 1: Chọn hệ trục tọa độ.*
      Đặt $A(0; sqrt(3); 0)$, $B(-1; 0; 0)$, $C(1; 0; 0)$ (tam giác đều cạnh $2$).
      Lăng trụ đều nên $A'(0; sqrt(3); 2)$, $B'(-1; 0; 2)$, $C'(1; 0; 2)$.

      *Bước 2: Tọa độ $M$, $N$ và vectơ.*
      $
        M & ~ "là trung điểm của" B' C' ~=> M(0; 0; 2). \
        N & ~ "là trung điểm của" A' B' ~=> N((-1/2); sqrt(3)/2; 2).
      $
      $
        arrow(M N) = N - M = (-1/2; sqrt(3)/2; 0), quad |arrow(M N)| = 1.
      $

      *Bước 3: Mặt phẳng $(B C C' B')$.*
      Bốn điểm $B(-1;0;0)$, $C(1;0;0)$, $C'(1;0;2)$, $B'(-1;0;2)$ đều có $y = 0$.
      Vậy $(B C C' B')$ là mặt phẳng $y = 0$, có vectơ pháp tuyến $arrow(n) = (0; 1; 0)$.

      *Bước 4: Tính góc.*
      $
        sin alpha = (|arrow(M N) dot arrow(n)|)/(|arrow(M N)| dot |arrow(n)|) = (|sqrt(3)/2|)/(1 dot 1) = sqrt(3)/2.
      $
      $
        cos alpha = sqrt(1 - 3/4) = 1/2,
        quad tan alpha = (sqrt(3)/2)/(1/2) = sqrt(3).
      $
      Vậy $tan^2 alpha = 3$.

      #meo[
        Với lăng trụ tam giác đều, các mặt bên là hình chữ nhật vuông góc với đáy. Mặt $(B C C' B')$ trùng với mặt phẳng $(y = 0)$ giúp bài toán trở nên đặc biệt đơn giản.
      ]
    ],
  )

  #tln(
    [Bốn tay vợt Tennis An, Bình, Công và Duy tham gia vào một giải đấu có tổng cộng ba trận đấu. Đầu tiên, hai người chơi được chọn ngẫu nhiên để chơi với nhau; hai người chơi còn lại cũng chơi với nhau. Những người chiến thắng trong hai trận đấu đó sẽ thi đấu với nhau để quyết định nhà vô địch giải đấu. An, Bình và Công ngang sức nhau (nghĩa là, khi một trận đấu được chơi giữa hai người trong ba người An, Bình, Công, xác suất mỗi người chơi thắng là $1/2$). Khi Duy đấu với An, Bình hoặc Công, xác suất Duy thắng là $0","7$. Xác định xác suất Bình vô địch giải đấu.],
    [$0","17$],
    fig: align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // Style definitions
        let root-style = (fill: rgb("e3f2fd"), stroke: 1pt + rgb("#1565c0"), inset: 4pt, radius: 3pt)
        let th-style = (fill: rgb("f0f6ff"), stroke: 0.5pt + rgb("#90caf9"), inset: 3pt, radius: 2pt)
        let leaf-style = (fill: rgb("fff5f5"), stroke: 0.5pt + rgb("#ef9a9a"), inset: 2pt, radius: 2pt)
        let result-style = (fill: rgb("ffebee"), stroke: 1.5pt + rgb("#c62828"), inset: 4pt, radius: 3pt)
        let prob-style = (fill: white, inset: 1pt, stroke: none)

        // Root node
        content((0, 0), box(..root-style)[*Vòng 1* \(3 cách ghép cặp)], name: "root")

        // Three pairings at Y positions
        let Y = (4.5, 1.5, -1.5)

        // TH1: A-B, C-D
        content((6.5, Y.at(0)), box(..th-style)["TH1:" $A"-"B$, $C"-"D$], name: "T0")
        line("root.east", "T0.west", mark: (end: ">"))
        content((3.2, Y.at(0) + 0.7), box(..prob-style)[$1\/3$])

        // TH2: A-C, B-D
        content((6.5, Y.at(1)), box(..th-style)["TH2:" $A"-"C$, $B"-"D$], name: "T1")
        line("root.east", "T1.west", mark: (end: ">"))
        content((3.2, Y.at(1) + 0.7), box(..prob-style)[$1\/3$])

        // TH3: A-D, B-C
        content((6.5, Y.at(2)), box(..th-style)["TH3:" $A"-"D$, $B"-"C$], name: "T2")
        line("root.east", "T2.west", mark: (end: ">"))
        content((3.2, Y.at(2) + 0.7), box(..prob-style)[$1\/3$])

        // Sub-results for each TH
        content((12.0, Y.at(0)), box(..leaf-style)[Bình thắng CK], name: "T0a")
        line("T0.east", "T0a.west", mark: (end: ">"))
        content((9.2, Y.at(0) + 0.8), box(..prob-style)[$0","18$])

        content((12.0, Y.at(1)), box(..leaf-style)[Bình thắng CK], name: "T1a")
        line("T1.east", "T1a.west", mark: (end: ">"))
        content((9.2, Y.at(1) + 0.8), box(..prob-style)[$0","15$])

        content((12.0, Y.at(2)), box(..leaf-style)[Bình thắng CK], name: "T2a")
        line("T2.east", "T2a.west", mark: (end: ">"))
        content((9.2, Y.at(2) + 0.8), box(..prob-style)[$0","18$])

        // Total probability box
        content((6.5, -4.2), box(..result-style)[$P = 1/3(0","18 + 0","15 + 0","18) approx 0","17$])
        line((6.5, -2.8), (6.5, -3.3), mark: (end: ">"), stroke: 0.8pt + rgb("#c62828"))
      })
    ],
    fig-pos: "center",
    fig-width: 85%,
    loigiai: [
      #ppgiai[
        - Có $3$ cách ghép cặp ngẫu nhiên ở vòng một, mỗi cách có xác suất $1/3$.
        - Với mỗi cách ghép, tính xác suất Bình thắng vòng một rồi thắng chung kết.
        - Dùng công thức xác suất toàn phần.
      ]

      *Bước 1: Phân tích không gian mẫu.*
      Ba cách ghép cặp ở vòng một (đồng khả năng):
      - TH1: An gặp Bình, Công gặp Duy.
      - TH2: An gặp Công, Bình gặp Duy.
      - TH3: An gặp Duy, Bình gặp Công.

      *Bước 2: Tính xác suất Bình vô địch trong từng trường hợp.*

      *TH1:* Bình cần thắng An ($1/2$), sau đó thắng chung kết.
      Người thắng trận Công-Duy:
      - Là Công (xs $0","3$): Bình gặp Công, Bình thắng ($1/2$).
      - Là Duy (xs $0","7$): Bình gặp Duy, Bình thắng ($0","3$).
      $=> P_1 = 1/2 dot (0","3 dot 1/2 + 0","7 dot 0","3) = 1/2 dot 0","36 = 0","18$.

      *TH2:* Bình cần thắng Duy ($0","3$), sau đó thắng chung kết gặp người thắng An-Công.
      Dù là An hay Công, Bình đều có xác suất thắng $1/2$.
      $=> P_2 = 0","3 dot 1/2 = 0","15$.

      *TH3:* Bình cần thắng Công ($1/2$), sau đó thắng chung kết.
      Người thắng trận An-Duy:
      - Là An (xs $0","3$): Bình thắng ($1/2$).
      - Là Duy (xs $0","7$): Bình thắng ($0","3$).
      $=> P_3 = 1/2 dot 0","36 = 0","18$.

      *Bước 3: Xác suất cần tìm.*
      $
        P = 1/3 (P_1 + P_2 + P_3) = 1/3 (0","18 + 0","15 + 0","18) = (0","51)/3 = 0","17.
      $

      #meo[
        Xác suất Bình vô địch nhỏ hơn $1/4$ (nếu bốn người ngang sức sẽ là $0","25$), phản ánh việc Duy mạnh hơn hẳn đã làm giảm cơ hội của Bình.
      ]
    ],
  )

]  // end make-questions

// Chỉ chạy khi mở standalone (không được import bởi Beamer.typ)
#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
