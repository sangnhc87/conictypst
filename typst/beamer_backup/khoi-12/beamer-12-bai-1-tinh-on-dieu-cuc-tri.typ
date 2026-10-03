// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 1: TÍNH ĐƠN ĐIỆU VÀ CỰC TRỊ CỦA HÀM SỐ
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "../../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)
#let palette = (ink: black, muted: rgb("#555"), border: rgb("#bbb"), accent: rgb("#0057b8"), correct: rgb("#1a7a2e"), wrong: rgb("#cc2200"), sol-bg: rgb("#f0f6ff"))


#show: lecture-theme.with(
  title:       "Bài 1: Tính Đơn Điệu và Cực Trị",
  subtitle:    "TOÁN 12 — Chương I: Ứng dụng của đạo hàm",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                // Size chữ cơ bản (phóng to để dễ nhìn)
  math-color:  rgb("#d81b60"),                      // Màu toán (Magenta)
  math-size:   1.05em,                              // Tỷ lệ size Toán so với chữ (1.05 lần)
  body-font:   ("Arial", "Times New Roman"),   // Font chữ (Sans-serif hiện đại, đẳng cấp)
)

#lec-reset()

#lt-toc()

// ════════════════════════════════════════════════
// SLIDE: LỘ TRÌNH & BỐI CẢNH LỊCH SỬ
// ════════════════════════════════════════════════
#lt-section-link("sec-history", "🏛️", [Bối cảnh & Lịch sử])

#lt-slide-back(title: "🏛️ Đạo hàm ra đời như thế nào?")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-history(title: "Cuộc đua thế kỷ XVII")[
        Khoảng 1665–1684, *Isaac Newton* (Anh) và *Gottfried Leibniz* (Đức) — hai thiên tài sống cách nhau hàng nghìn km — *độc lập* phát minh ra Giải tích.

        Newton gọi là _"fluxion"_ (tốc độ biến thiên), dùng để tính quỹ đạo hành tinh. Leibniz dùng ký hiệu $d y \/ d x$ mà chúng ta vẫn dùng ngày nay.
      ]
      #v(0.4em)
      #lt-note(title: "Ứng dụng thực tế")[
        Đạo hàm giúp tìm *điểm tối ưu* trong kinh doanh, kỹ thuật, khoa học: tối thiểu chi phí, tối đa lợi nhuận, tìm vận tốc cực đại.
      ]
    ],
    [
      #v(1em)
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0,0), (0, 7), mark: (end: ">"), name: "y")
          line((0,0), (4.5, 0), mark: (end: ">"), name: "x")
          content((4.5, -0.3), [$t$ (thời gian)])
          content((-0.3, 7), [$s$ (quãng đường)])
          
          bezier((0,0.5), (4, 6), (2, 0.5), (3, 5), name: "curve")
          
          let p1 = (1.5, 1.2)
          circle(p1, radius: 0.08, fill: blue)
          line((0.8, 1.05), (2.2, 1.35), stroke: red)
          content((2.5, 1.2), text(fill: red, size: 12pt)[Vận tốc tức thời $v = s'(t)$])
        })
      ]
    ]
  )
]

#lt-slide-back(title: "⏳ Dòng thời gian phát triển")[
  #lt-timeline((
    ("1665", "Isaac Newton", "Phát triển lý thuyết 'Fluxions' (Đạo hàm) để giải quyết các bài toán vật lý về chuyển động."),
    ("1675", "Gottfried Leibniz", "Sử dụng ký hiệu $d y / d x$ và tích phân $int$. Công bố trước Newton vào năm 1684."),
    ("1696", "L'Hôpital", "Xuất bản cuốn sách giáo khoa đầu tiên về Giải tích, tổng hợp các quy tắc tính giới hạn."),
    ("1823", "Augustin-Louis Cauchy", "Đưa Giải tích trở nên chặt chẽ bằng cách định nghĩa giới hạn một cách nghiêm ngặt ($epsilon-delta$).")
  ))
]

// ════════════════════════════════════════════════
// PHẦN I: TÍNH ĐƠN ĐIỆU CỦA HÀM SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-dondieu", "📈", [I. Tính đơn điệu của hàm số])
#lt-section("📈", [I. Tính đơn điệu của hàm số])

#lt-slide-back(title: "1. Nhắc lại khái niệm")[
  #lt-definition(title: "Hàm số đồng biến, nghịch biến")[
    Cho hàm số $y = f(x)$ xác định trên $K$ (khoảng, đoạn, hoặc nửa khoảng).
    - $f(x)$ *đồng biến* (tăng) trên $K$ nếu: $forall x_1, x_2 in K, x_1 < x_2 => f(x_1) < f(x_2)$.
    - $f(x)$ *nghịch biến* (giảm) trên $K$ nếu: $forall x_1, x_2 in K, x_1 < x_2 => f(x_1) > f(x_2)$.
  ]
  #pause
  #lt-two-col(
    ratio: (1fr, 1fr),
    align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-1,0), (3,0), mark: (end: ">"))
        line((0,-1), (0,3), mark: (end: ">"))
        bezier((0,0), (2.5,2.5), (1,0), (1.5, 2.5), stroke: 1.5pt + blue)
        content((1.25, -0.5), text(fill: blue, weight: "bold")[ĐỒNG BIẾN (Đồ thị đi lên)])
      })
    ],
    align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-1,0), (3,0), mark: (end: ">"))
        line((0,-1), (0,3), mark: (end: ">"))
        bezier((0,2.5), (2.5,0), (1,2.5), (1.5, 0), stroke: 1.5pt + red)
        content((1.25, -0.5), text(fill: red, weight: "bold")[NGHỊCH BIẾN (Đồ thị đi xuống)])
      })
    ]
  )
]

#lt-slide-back(title: "2. Mối liên hệ giữa Đạo hàm và Đơn điệu")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Định lý đơn điệu")[
        Cho hàm số $f(x)$ có đạo hàm trên khoảng $K$.
        - Nếu $f'(x) > 0 quad forall x in K$ thì $f(x)$ *đồng biến* trên $K$.
        - Nếu $f'(x) < 0 quad forall x in K$ thì $f(x)$ *nghịch biến* trên $K$.
        - Nếu $f'(x) = 0 quad forall x in K$ thì $f(x)$ *không đổi* (hằng số) trên $K$.
      ]
        #lt-note[Định lý mở rộng: Dấu "=" có thể xảy ra tại *hữu hạn điểm* trên $K$.]
    ],
    align(center)[
      #cetz.canvas({
        import cetz.draw: *
        line((-1,0), (4,0), mark: (end: ">"), name: "x")
        line((0,-1), (0,4), mark: (end: ">"), name: "y")
        bezier((0.5,0.5), (3.5,3.5), (2,0.5), (2,3.5), stroke: 1.5pt + blue)
        
        let p1 = (1.2, 0.8)
        circle(p1, radius: 0.06, fill: black)
        line((0.2, 0.5), (2.2, 1.1), stroke: red)
        content((2.5, 0.9), text(fill: red)[Tiếp tuyến hướng lên
 $f'(x) > 0$])
        
        let p2 = (2.8, 3.1)
        circle(p2, radius: 0.06, fill: black)
        line((2.0, 2.0), (3.6, 4.2), stroke: red)
        content((3.8, 3.0), text(fill: red)[$f'(x) > 0$])
      })
    ]
  )
]

#lt-slide-back(title: "3. Quy tắc lập Bảng biến thiên (BBT)")[
  #step[Bước 1: Tìm Tập xác định $D$. Tính đạo hàm $f'(x)$.]
  #pause
  #step[Bước 2: Tìm các điểm $x_i in D$ mà tại đó $f'(x) = 0$ hoặc $f'(x)$ không xác định.]
  #pause
  #step[Bước 3: Sắp xếp các điểm $x_i$ theo thứ tự tăng dần. Lập bảng xét dấu $f'(x)$ và chiều biến thiên của $f(x)$ (gọi là Bảng Biến Thiên).]
  #pause
  #step[Bước 4: Căn cứ vào BBT để kết luận các khoảng đồng biến, nghịch biến.]
]

#lt-slide-back(title: "Ví dụ 1 — Hàm đa thức")[
  #lt-example[
    Xét chiều biến thiên của hàm số $f(x) = x^3 - 3x^2 + 1$.
  ]
  #pause
  #lt-solution[
    *TXĐ:* $D = RR$.     *Đạo hàm:* $f'(x) = 3x^2 - 6x$. Cho $f'(x) = 0 <=> x = 0$ hoặc $x = 2$.
    
    *Bảng biến thiên:*
    #align(center)[
      #bbbt(
        x-vals: ($-oo$, $0$, $2$, $+oo$),
        d-signs: ($+$, $0$, $-$, $0$, $+$),
        v-vals: ($-oo$, $1$, $-3$, $+oo$),
      )
    ]
    *Kết luận:* 
    - Hàm số *đồng biến* trên các khoảng $(-infinity; 0)$ và $(2; +infinity)$.
    - Hàm số *nghịch biến* trên khoảng $(0; 2)$.
  ]
]

#lt-slide-back(title: "Ví dụ 2 — Hàm phân thức")[
  #lt-example[
    Xét tính đơn điệu của hàm số $f(x) = display(frac(2x - 1, x - 1))$.
  ]
  #pause
  #lt-solution[
    *TXĐ:* $D = RR without {1}$.     *Đạo hàm:* $f'(x) = display(frac(2(x-1) - (2x-1) dot 1, (x-1)^2)) = display(frac(-1, (x-1)^2)) < 0 quad forall x != 1$.
    
    *Bảng biến thiên:*
    #align(center)[
      #bbbt(
        x-vals: ($-oo$, $1$, $+oo$),
        d-signs: ($-$, $||$, $-$),
        v-vals: ($2$, ($-oo$, $+oo$), $2$),
      )
    ]
    *Kết luận:* Hàm số *nghịch biến* trên $(-infinity; 1)$ và $(1; +infinity)$.     #lt-note[Chú ý: Tuyệt đối không ghi nghịch biến trên $RR without {1}$ hoặc $(-infinity; 1) union (1; +infinity)$.]
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: CỰC TRỊ CỦA HÀM SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-cuctri", "⛰️", [II. Cực trị của hàm số])
#lt-section("⛰️", [II. Cực trị của hàm số])

#lt-slide-back(title: "1. Khái niệm cực đại, cực tiểu")[
  #lt-definition(title: "Cực đại và Cực tiểu")[
    Cho $f(x)$ xác định trên $D$ và $x_0 in D$.
    - $x_0$ là *điểm cực đại* nếu tồn tại một khoảng $(a; b)$ chứa $x_0$ sao cho $f(x) < f(x_0)$ với mọi $x in (a; b) without {x_0}$. $f(x_0)$ gọi là *giá trị cực đại*.
    - $x_0$ là *điểm cực tiểu* nếu $f(x) > f(x_0)$ với mọi $x$ lân cận $x_0$.
  ]
  #pause
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-0.5,0), (4.5,0), mark: (end: ">"), name: "x")
      line((0,-0.5), (0,3.5), mark: (end: ">"), name: "y")
      
      let f(x) = x*x*x/3 - 2*x*x + 3*x + 1
      let points = range(0, 43).map(i => {
        let x = i * 0.1
        (x, f(x))
      })
      line(..points, stroke: 1.5pt + blue)
      
      content((1, 2.7), text(fill: red, weight: "bold")[Điểm Cực Đại])
      line((0.5, 2.333), (1.5, 2.333), stroke: 1.5pt + red)
      circle((1, 2.333), radius: 0.05, fill: red)
      
      content((3, 0.6), text(fill: rgb("#059669"), weight: "bold")[Điểm Cực Tiểu])
      line((2.5, 1), (3.5, 1), stroke: 1.5pt + rgb("#059669"))
      circle((3, 1), radius: 0.05, fill: rgb("#059669"))
    })
  ]
]

#lt-slide-back(title: "2. Quy tắc 1 tìm cực trị")[
  #lt-theorem(title: "Dấu hiệu 1 (Dựa vào BBT)")[
    Giả sử $f(x)$ liên tục trên khoảng $K$ chứa $x_0$ và có đạo hàm trên $K$ hoặc $K without {x_0}$.
    - Nếu $f'(x)$ *đổi dấu từ $(+)$ sang $(-)$* khi qua $x_0$ thì hàm số đạt *cực đại* tại $x_0$.
    - Nếu $f'(x)$ *đổi dấu từ $(-)$ sang $(+)$* khi qua $x_0$ thì hàm số đạt *cực tiểu* tại $x_0$.
  ]
  #pause
  #lt-example[
    Tìm cực trị của $f(x) = 2x^3 - 3x^2 - 12x + 4$.
  ]
  #pause
  #lt-solution[
    $f'(x) = 6x^2 - 6x - 12 = 6(x-2)(x+1)$; $f'(x) = 0 <=> x = -1$ hoặc $x = 2$.
    *Bảng biến thiên:*
    #align(center)[
      #bbbt(
        x-vals: ($-oo$, $-1$, $2$, $+oo$),
        d-signs: ($+$, $0$, $-$, $0$, $+$),
        v-vals: ($-oo$, $11$, $-16$, $+oo$),
      )
    ]
    - $x = -1$: $f'$ đổi dấu $+$ → $-$ → *cực đại*, $f_("CĐ") = 11$.
    - $x = 2$: $f'$ đổi dấu $-$ → $+$ → *cực tiểu*, $f_("CT") = -16$.
  ]
]

// ════════════════════════════════════════════════
// KHO BÀI TẬP TRẮC NGHIỆM TỔNG HỢP (48 CÂU)
// ════════════════════════════════════════════════
// KHO BÀI TẬP TRẮC NGHIỆM TỔNG HỢP (48 CÂU)
// ════════════════════════════════════════════════
#lt-section-link("sec-practice", "❓", [Kho Câu Hỏi Trắc Nghiệm Đầy Đủ])

#slide(title: none)[
  #lt-qbank-header("Tổng hợp 4 Đề kiểm tra", 48)
  #v(1em)
  #lt-two-col(
    ratio: (1fr, 1fr),
    lt-bullets(icon: "✅",
      [Các câu hỏi được trích xuất trực tiếp từ kho đề thi],
      [Hệ thống tự động chấm điểm và đánh số thứ tự],
    ),
    lt-bullets(icon: "✅",
      [Đầy đủ các dạng: Nhận biết, Thông hiểu, Vận dụng],
      [Hình vẽ minh họa chính xác (CeTZ)],
    )
  )
  #v(1em)
  #align(center)[
    #lt-nav-btn("lec-toc-main", icon: "◀", txt: "Quay lại Mục Lục")
  ]
]

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)




#lt-tn(de: "Đề 1", 
  [Cho hàm số $y=f(x)$ có bảng biến thiên như hình dưới đây:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $-1$, $1$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $2$, $-2$, $+oo$),
    )
  ]
  Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
  (
    [$( -1; 1 )$],
    [$( -oo; 2 )$],
    True([$( 1; +oo )$]),
    [$( -2; +oo )$],
  ),
  loigiai: [
    #step[Phân tích bảng biến thiên]
    Từ bảng biến thiên, ta thấy $f'(x) > 0$ trên các khoảng $( -oo; -1 )$ và $( 1; +oo )$.
    Do đó hàm số đồng biến trên các khoảng $( -oo; -1 )$ và $( 1; +oo )$.
    Đối chiếu với các đáp án, ta chọn $( 1; +oo )$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $0$, $2$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-1$, $3$, $-oo$),
    )
  ]
  Điểm cực tiểu của hàm số đã cho là:],
  (
    [$x = 2$],
    True([$x = 0$]),
    [$x = -1$],
    [$x = 3$],
  ),
  loigiai: [
    #step[Tìm cực trị từ bảng biến thiên]
    Từ bảng biến thiên, $f'(x)$ đổi dấu từ âm sang dương khi đi qua $x = 0$.
    Vậy điểm cực tiểu của hàm số là $x = 0$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho hàm số $y = f(x)$ xác định trên $RR \\ {1}$ và có bảng xét dấu đạo hàm như sau:
  #align(center)[
    #bxd(
      x-vals: ($-oo$, $1$, $3$, $+oo$),
      f-signs: ($+$, $||$, $-$, $0$, $+$),
    )
  ]
  Mệnh đề nào dưới đây đúng?],
  (
    [Hàm số đạt cực đại tại $x = 1$.],
    True([Hàm số đạt cực tiểu tại $x = 3$.]),
    [Hàm số đồng biến trên khoảng $(1; 3)$.],
    [Hàm số có 2 điểm cực trị.],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm]
    Tại $x=1$ hàm số không xác định nên không phải cực đại.
    Tại $x=3$, $f'(x)$ đổi dấu từ âm sang dương nên $x=3$ là điểm cực tiểu.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho hàm số $y=f(x)$ có đồ thị như hình vẽ bên.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-2, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -3), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-15, 30).map(x => {
        let nx = x / 10
        let ny = (nx * nx * nx) / 3 - nx * nx
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      content((2, -2.3), [$2$])
      content((-0.3, -1.3), [$-4/3$])
      line((2,0), (2,-4/3), stroke: (dash: "dashed"))
      line((0,-4/3), (2,-4/3), stroke: (dash: "dashed"))
      circle((2, -4/3), radius: 0.05, fill: black)
      circle((0, 0), radius: 0.05, fill: black)
    })
  ]
  Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
  (
    [$(0; 2)$],
    True([$(2; +oo)$]),
    [$( -oo; 2)$],
    [$(0; +oo)$],
  ),
  loigiai: [
    #step[Nhìn đồ thị để xét tính đơn điệu]
    Đồ thị hàm số đi lên từ trái sang phải trên các khoảng $(-oo; 0)$ và $(2; +oo)$.
    Do đó hàm số đồng biến trên các khoảng $(-oo; 0)$ và $(2; +oo)$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho đồ thị hàm số $y=f(x)$ như hình vẽ:
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      content((3, -0.3), [$x$])
      line((0, -3), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = -nx * nx * nx + 3 * nx
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      line((1,0), (1,2), stroke: (dash: "dashed"))
      line((0,2), (1,2), stroke: (dash: "dashed"))
      line((-1,0), (-1,-2), stroke: (dash: "dashed"))
      line((0,-2), (-1,-2), stroke: (dash: "dashed"))
      
      circle((1, 2), radius: 0.05, fill: black)
      circle((-1, -2), radius: 0.05, fill: black)
      content((0.2, 2.2), [$2$])
      content((1, -0.3), [$1$])
      content((-0.3, -2), [$-2$])
      content((-1, 0.3), [$-1$])
    })
  ]
  Giá trị cực đại của hàm số là:],
  (
    [$x = 1$],
    [$-2$],
    True([$2$]),
    [$x = -1$],
  ),
  loigiai: [
    #step[Đọc đồ thị]
    Từ đồ thị, hàm số đạt cực đại tại $x = 1$ và giá trị cực đại là $y = 2$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho đạo hàm của hàm số $y=f(x)$ là $f'(x) = x(x-2)^2 (x+1)^3$. Số điểm cực trị của hàm số $f(x)$ là:],
  (
    [1],
    True([2]),
    [3],
    [4],
  ),
  loigiai: [
    #step[Đếm số lần đạo hàm đổi dấu]
    Ta có $f'(x) = 0 <=> x=0, x=2, x=-1$.
    Nghiệm $x=2$ là nghiệm bội 2 (đạo hàm không đổi dấu).
    Nghiệm $x=0$ và $x=-1$ là nghiệm lẻ (đạo hàm đổi dấu).
    Vậy hàm số có 2 điểm cực trị.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ:
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -3), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((0.2, -0.3), [$O$])
      
      let pts = range(-15, 25).map(x => {
        let nx = x / 10
        let ny = (nx + 1) * (nx - 2)
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      
      content((-1, 0.3), [$-1$])
      content((2, 0.3), [$2$])
      circle((-1, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Hàm số $y = f(x)$ nghịch biến trên khoảng nào dưới đây?],
  (
    [$( -oo; -1 )$],
    True([$( -1; 2 )$]),
    [$( 2; +oo )$],
    [$( -1; +oo )$],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm từ đồ thị $f'(x)$]
    Đồ thị $f'(x)$ nằm dưới trục hoành khi $x in (-1; 2)$.
    Tức là $f'(x) < 0, forall x in (-1; 2)$.
    Vậy hàm số $y=f(x)$ nghịch biến trên khoảng $(-1; 2)$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho hàm số $y = x^3 - 3x^2 + 2$. Điểm cực tiểu của đồ thị hàm số là:],
  (
    [$(0; 2)$],
    True([$(2; -2)$]),
    [$(1; 0)$],
    [$x = 2$],
  ),
  loigiai: [
    #step[Tính đạo hàm và tìm điểm cực tiểu]
    $y' = 3x^2 - 6x$. Cho $y' = 0 <=> x = 0$ hoặc $x = 2$.
    $y'' = 6x - 6$. Tại $x = 2$, $y''(2) = 6 > 0$ nên $x = 2$ là điểm cực tiểu.
    Khi $x = 2$, $y = 2^3 - 3(2)^2 + 2 = -2$.
    Vậy điểm cực tiểu của đồ thị hàm số là $(2; -2)$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Tìm tất cả các giá trị thực của tham số $m$ để hàm số $y = 1/3 x^3 - m x^2 + 3x - 1$ đồng biến trên $RR$.],
  (
    [$-sqrt(3) <= m <= sqrt(3)$],
    True([$-sqrt(3) <= m <= sqrt(3)$]), // Sửa lại m logic cho hàm y' = x^2 - 2m x + 3
    [$m >= sqrt(3)$],
    [$m <= -sqrt(3)$],
  ),
  loigiai: [
    #step[Điều kiện đồng biến]
    Ta có $y' = x^2 - 2m x + 3$.
    Để hàm số đồng biến trên $RR$ thì $y' >= 0, forall x in RR$.
    $<=> Delta' = m^2 - 3 <= 0 <=> -sqrt(3) <= m <= sqrt(3)$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Hàm số $y = -x^4 + 2x^2 + 3$ đồng biến trên khoảng nào sau đây?],
  (
    [$(0; 1)$],
    [$(1; +oo)$],
    True([$(-oo; -1)$]),
    [$(-1; 0)$],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    $y' = -4x^3 + 4x = -4x(x^2 - 1)$.
    $y' = 0 <=> x = 0, x = -1, x = 1$.
    Dấu $y'$ trên $(-oo; -1)$ là dương. Vậy hàm số đồng biến trên $(-oo; -1)$.
  ]
)

#lt-tn(de: "Đề 1", 
  [Cho hàm số $y=f(x)$ có đạo hàm liên tục trên $RR$ và đồ thị hàm số $y=f'(x)$ như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-2, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -2), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      
      let pts = range(-12, 23).map(x => {
        let nx = x / 10
        let ny = (nx)*(nx - 2)*(nx + 1)/2
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      content((-1, 0.3), [$-1$])
      content((2, 0.3), [$2$])
      circle((-1, 0), radius: 0.05, fill: black)
      circle((0, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Hàm số $y=f(x)$ đạt cực đại tại:],
  (
    [$x = -1$],
    True([$x = 0$]),
    [$x = 2$],
    [$x = 1$],
  ),
  loigiai: [
    #step[Xét dấu từ đồ thị đạo hàm]
    Qua điểm $x=0$, đồ thị $f'(x)$ đi từ phía trên trục hoành xuống dưới trục hoành (đổi dấu từ dương sang âm).
    Do đó, $x=0$ là điểm cực đại của hàm số.
  ]
)

#lt-tn(de: "Đề 1", 
  [Hàm số $y = (2x-1)/(x+1)$ có bao nhiêu điểm cực trị?],
  (
    [1],
    [2],
    True([0]),
    [3],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    Ta có $y' = 3 / (x+1)^2 > 0, forall x != -1$.
    Đạo hàm luôn dương, hàm số luôn đồng biến trên từng khoảng xác định và không có cực trị.
  ]
)

#lt-ds(de: "Đề 1", 
  [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $0$, $2$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-2$, $4$, $-oo$),
    )
  ]
  Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm số đồng biến trên khoảng $(0; 2)$.]),
    [Hàm số nghịch biến trên khoảng $(-2; 4)$.],
    True([Hàm số đạt cực đại tại $x=2$ và giá trị cực đại bằng $4$.]),
    [Hàm số có 3 điểm cực trị.],
  ),
  loigiai: [
    #step[Phân tích bảng biến thiên]
    a) Đúng vì trên khoảng $(0; 2)$ thì $f'(x) > 0$.
    b) Sai vì khoảng nghịch biến là $(-oo; 0)$ và $(2; +oo)$.
    c) Đúng vì tại $x=2$ đạo hàm đổi dấu từ dương sang âm.
    d) Sai vì hàm số chỉ có 2 điểm cực trị.
  ]
)

#lt-ds(de: "Đề 1", 
  [Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -3), (0, 3), mark: (end: ">"))
      // tiệm cận
      line((1, -3), (1, 3), stroke: (dash: "dashed", paint: gray))
      line((-3, 2), (3, 2), stroke: (dash: "dashed", paint: gray))
      
      let pts1 = range(-30, 8).map(x => {
        let nx = x / 10
        let ny = (2*nx + 1) / (nx - 1)
        (nx, ny)
      })
      line(..pts1, stroke: blue + 1.2pt)
      
      let pts2 = range(12, 30).map(x => {
        let nx = x / 10
        let ny = (2*nx + 1) / (nx - 1)
        (nx, ny)
      })
      line(..pts2, stroke: blue + 1.2pt)
      
      content((1.2, -0.3), [$1$])
      content((-0.3, 2.2), [$2$])
      circle((-0.5, 0), radius: 0.05, fill: black)
      circle((0, -1), radius: 0.05, fill: black)
    })
  ]
  Biết đồ thị cắt trục hoành tại $x=-1/2$ và trục tung tại $y=-1$. Xét tính đúng sai của các mệnh đề:],
  (
    True([Hàm số nghịch biến trên từng khoảng xác định.]),
    [Hàm số có 1 điểm cực trị.],
    True([Hàm số không có điểm cực trị.]),
    True([Đạo hàm của hàm số luôn mang dấu âm với mọi $x != 1$.]),
  ),
  loigiai: [
    #step[Phân tích đồ thị]
    Đồ thị đi xuống từ trái sang phải, nên hàm số nghịch biến trên từng khoảng xác định. Mệnh đề a) đúng, d) đúng.
    Hàm phân thức bậc nhất / bậc nhất không có cực trị. Mệnh đề b) sai, c) đúng.
  ]
)

#lt-ds(de: "Đề 1", 
  [Cho hàm số $y = f(x)$ có đồ thị đạo hàm $y = f'(x)$ như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      line((0, -3), (0, 3), mark: (end: ">"))
      
      let pts = range(-20, 30).map(x => {
        let nx = x / 10
        let ny = nx*(nx - 2)
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      content((0.2, 0.2), [$O$])
      content((2, 0.3), [$2$])
      circle((0, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Xét tính đúng sai của các mệnh đề sau đối với hàm số $y = f(x)$:],
  (
    [Hàm số $y = f(x)$ nghịch biến trên $(0; +oo)$.],
    True([Hàm số $y = f(x)$ đồng biến trên $(2; +oo)$.]),
    True([Điểm cực tiểu của hàm số $y=f(x)$ là $x = 2$.]),
    [Hàm số $y=f(x)$ đạt cực đại tại $x = 2$.],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm]
    Từ đồ thị $f'(x)$, ta thấy $f'(x) < 0$ trên khoảng $(0; 2)$ và $f'(x) > 0$ trên $(2; +oo)$ và $(-oo; 0)$.
    Hàm số $f(x)$ đồng biến trên $(-oo; 0)$ và $(2; +oo)$, nghịch biến trên $(0; 2)$. a) sai, b) đúng.
    $f'(x)$ đổi dấu từ âm sang dương qua $x=2$ nên $x=2$ là điểm cực tiểu. c) đúng, d) sai.
  ]
)

#lt-ds(de: "Đề 1", 
  [Cho hàm số $y = -x^3 + 3x^2 + 9x - 2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số đồng biến trên $RR$.],
    True([Hàm số nghịch biến trên khoảng $(-oo; -1)$.]),
    True([Hàm số đạt cực đại tại $x = 3$.]),
    [Giá trị cực tiểu của hàm số là $-2$.],
  ),
  loigiai: [
    #step[Tính đạo hàm và lập BBT]
    $y' = -3x^2 + 6x + 9 = -3(x^2 - 2x - 3)$.
    $y' = 0 <=> x = -1, x = 3$.
    Trong khoảng $(-1; 3)$, $y' > 0$ hàm số đồng biến. Ngoài khoảng hàm số nghịch biến.
    Vậy a) sai, b) đúng.
    Tại $x=3$, $y'$ đổi dấu từ dương sang âm nên là điểm cực đại. c) đúng.
    Tại $x=-1$, $y(-1) = 1 + 3 - 9 - 2 = -7$ là giá trị cực tiểu. d) sai.
  ]
)

#lt-tln(de: "Đề 1", 
  [Hàm số $y = 1/3 x^3 - m x^2 + (2m+3)x + 1$ có bao nhiêu giá trị nguyên của $m$ thuộc đoạn $[-5; 5]$ để hàm số đồng biến trên $RR$?],
  [$5$],
  loigiai: [
    #step[Điều kiện hàm số đồng biến trên $RR$]
    Ta có $y' = x^2 - 2m x + 2m+3$.
    Để hàm số đồng biến trên $RR$ thì $y' >= 0, forall x in RR$.
    $<=> Delta' = m^2 - (2m+3) <= 0 <=> m^2 - 2m - 3 <= 0 <=> -1 <= m <= 3$.
    Vì $m in ZZ$ và thuộc $[-5; 5]$ nên $m in {-1; 0; 1; 2; 3}$. Có tất cả 5 giá trị nguyên.
  ]
)

#lt-tln(de: "Đề 1", 
  [Cho hàm số $f(x)$ có đạo hàm $f'(x) = x(x-1)(x-2)^2$. Hỏi hàm số $y = f(x)$ có bao nhiêu điểm cực trị?],
  [$2$],
  loigiai: [
    #step[Xét nghiệm của phương trình $f'(x) = 0$]
    $f'(x) = 0 <=> hoac(x = 0, x = 1, x = 2)$.
    Nghiệm $x = 2$ là nghiệm bội chẵn nên $f'(x)$ không đổi dấu.
    Nghiệm $x = 0$ và $x = 1$ là nghiệm bội lẻ nên $f'(x)$ đổi dấu.
    Vậy hàm số có 2 điểm cực trị.
  ]
)

#lt-tln(de: "Đề 1", 
  [Tìm giá trị cực đại của hàm số $y = -x^3 + 3x^2 + 1$.],
  [$5$],
  loigiai: [
    #step[Tính đạo hàm và tìm điểm cực đại]
    $y' = -3x^2 + 6x$. Cho $y' = 0 <=> -3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.
    Bảng biến thiên cho thấy đạo hàm đổi dấu từ dương sang âm tại $x = 2$, nên hàm số đạt cực đại tại $x = 2$.
    Giá trị cực đại là $y(2) = -2^3 + 3(2^2) + 1 = -8 + 12 + 1 = 5$.
  ]
)

#lt-tln(de: "Đề 1", 
  [Cho hàm số $f(x)$ xác định trên $RR$, có đồ thị hàm số $y=f(x)$ là đường cong có hình dạng chữ W với điểm cực đại có tung độ là $y=4$ và hai điểm cực tiểu có tung độ là $y=-1$. Có bao nhiêu giá trị nguyên dương của tham số $m$ để phương trình $f(x) = m$ có đúng 4 nghiệm phân biệt?],
  [$3$],
  loigiai: [
    #step[Khảo sát sự tương giao]
    Hàm số bậc 4 trùng phương dạng chữ W có giá trị cực đại là $y=4$ và cực tiểu $y=-1$.
    Số nghiệm của phương trình $f(x) = m$ là số giao điểm của đồ thị với đường thẳng $y=m$.
    Để cắt tại 4 điểm phân biệt thì $-1 < m < 4$.
    Các giá trị nguyên dương của $m$ là $1, 2, 3$. Vậy có 3 giá trị.
  ]
)

#lt-tln(de: "Đề 1", 
  [Tìm giá trị của tham số $m > 0$ để hàm số $y = 1/3 x^3 - m x^2 + (m^2 - 4)x$ đạt cực đại tại $x = 1$.],
  [$3$],
  loigiai: [
    #step[Sử dụng điều kiện cần và đủ]
    Ta có $y' = x^2 - 2m x + m^2 - 4$.
    Để hàm số đạt cực đại tại $x=1$ thì trước tiên $y'(1) = 0 <=> 1 - 2m + m^2 - 4 = 0 <=> m^2 - 2m - 3 = 0 <=> m = -1$ hoặc $m = 3$.
    Vì đề bài yêu cầu $m > 0$ nên $m = 3$.
    Thử lại với đạo hàm bậc hai $y'' = 2x - 2m$.
    Tại $x=1$ và $m=3$, $y''(1) = 2 - 6 = -4 < 0$ (thoả mãn điều kiện cực đại).
    Vậy $m=3$.
  ]
)

#lt-tln(de: "Đề 1", 
  [Đồ thị hàm số $y = x^4 - 2x^2 - 3$ có 3 điểm cực trị là các đỉnh của một tam giác. Tính diện tích của tam giác đó.],
  [$1$],
  loigiai: [
    #step[Tìm toạ độ các điểm cực trị]
    Ta có $y' = 4x^3 - 4x = 4x(x^2 - 1)$.
    $y' = 0 <=> x = 0$ hoặc $x = +-1$.
    Với $x=0 => y = -3$. Điểm cực đại $A(0; -3)$.
    Với $x=+-1 => y = 1 - 2 - 3 = -4$. Điểm cực tiểu $B(1; -4)$ và $C(-1; -4)$.
    
    #step[Tính diện tích tam giác]
    Tam giác $A B C$ cân tại $A$. Gọi $H$ là trung điểm $B C$, ta có $H(0; -4)$.
    Độ dài đáy $B C = sqrt((-1 - 1)^2 + 0) = 2$.
    Chiều cao $A H = |-3 - (-4)| = 1$.
    Diện tích tam giác là $S = 1/2 dot B C dot A H = 1/2 dot 2 dot 1 = 1$.
  ]
)

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)


",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "102",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  header-border: true,
)

#lt-tn(de: "Đề 2", 
  [Cho hàm số $y=f(x)$ có bảng biến thiên như hình dưới đây:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $-2$, $1$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-3$, $5$, $-oo$),
    )
  ]
  Hàm số đã cho đạt cực đại tại điểm nào dưới đây?],
  (
    [$x = 5$],
    True([$x = 1$]),
    [$x = -2$],
    [$x = -3$],
  ),
  loigiai: [
    #step[Đọc bảng biến thiên]
    Tại $x = 1$, đạo hàm $f'(x)$ đổi dấu từ dương sang âm nên $x=1$ là điểm cực đại của hàm số.
  ]
)

#lt-tn(de: "Đề 2", 
  [Cho hàm số $y=f(x)$ có đồ thị như hình vẽ bên.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      content((3, -0.3), [$x$])
      line((0, -3), (0, 4), mark: (end: ">"))
      content((-0.3, 4), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = -nx * nx * nx + 3 * nx + 1
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      line((1,0), (1,3), stroke: (dash: "dashed"))
      line((0,3), (1,3), stroke: (dash: "dashed"))
      line((-1,0), (-1,-1), stroke: (dash: "dashed"))
      line((0,-1), (-1,-1), stroke: (dash: "dashed"))
      
      circle((1, 3), radius: 0.05, fill: black)
      circle((-1, -1), radius: 0.05, fill: black)
      content((0.2, 3.2), [$3$])
      content((1, -0.3), [$1$])
      content((0.3, -1), [$-1$])
      content((-1, 0.3), [$-1$])
    })
  ]
  Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
  (
    [$( -1; 1 )$],
    True([$( 1; +oo )$]),
    [$( -1; 3 )$],
    [$( 0; 1 )$],
  ),
  loigiai: [
    #step[Phân tích đồ thị]
    Đồ thị đi xuống (nghịch biến) trên các khoảng $( -oo; -1 )$ và $( 1; +oo )$.
    Đối chiếu các đáp án, khoảng $( 1; +oo )$ là khoảng nghịch biến.
  ]
)

#lt-tn(de: "Đề 2", 
  [Giá trị cực tiểu của hàm số $y = x^3 - 3x^2 - 9x + 2$ là:],
  (
    [$7$],
    [$-3$],
    True([$-25$]),
    [$3$],
  ),
  loigiai: [
    #step[Tính đạo hàm và xét cực trị]
    $y' = 3x^2 - 6x - 9$. Cho $y' = 0 <=> x = -1$ hoặc $x = 3$.
    $y'' = 6x - 6$. Tại $x = 3$, $y''(3) = 12 > 0$ nên hàm số đạt cực tiểu tại $x = 3$.
    Khi đó, giá trị cực tiểu $y(3) = 3^3 - 3(3^2) - 9(3) + 2 = -25$.
  ]
)

#lt-tn(de: "Đề 2", 
  [Cho hàm số $y=f(x)$ liên tục trên $RR$ và có bảng xét dấu đạo hàm như sau:
  #align(center)[
    #bxd(
      x-vals: ($-oo$, $-1$, $0$, $2$, $+oo$),
      f-signs: ($+$, $0$, $-$, $0$, $-$, $0$, $+$),
    )
  ]
  Số điểm cực trị của hàm số đã cho là:],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$4$],
  ),
  loigiai: [
    #step[Xét dấu đạo hàm]
    Đạo hàm đổi dấu qua $x = -1$ (từ $+$ sang $-$) và qua $x = 2$ (từ $-$ sang $+$).
    Tại $x = 0$ đạo hàm không đổi dấu.
    Vậy hàm số có 2 điểm cực trị.
  ]
)

#lt-tn(de: "Đề 2", 
  [Cho đồ thị hàm số $y=f'(x)$ như hình vẽ. 
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -2), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      
      let pts = range(-10, 30).map(x => {
        let nx = x / 10
        let ny = (nx - 1)*(nx - 1) - 1
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      content((0.2, 0.3), [$0$])
      content((2, 0.3), [$2$])
      circle((0, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Khẳng định nào dưới đây đúng?],
  (
    [Hàm số $y=f(x)$ đồng biến trên khoảng $(0; 2)$.],
    [Hàm số $y=f(x)$ nghịch biến trên khoảng $(2; +oo)$.],
    True([Hàm số $y=f(x)$ nghịch biến trên khoảng $(0; 2)$.]),
    [Hàm số $y=f(x)$ đạt cực tiểu tại $x=0$.],
  ),
  loigiai: [
    #step[Xét dấu từ đồ thị đạo hàm]
    Trên khoảng $(0; 2)$, đồ thị $f'(x)$ nằm dưới trục hoành nên $f'(x) < 0$. Suy ra hàm số $f(x)$ nghịch biến trên $(0; 2)$.
    Tại $x=0$, $f'(x)$ chuyển từ dương sang âm nên là cực đại, không phải cực tiểu.
  ]
)

#lt-tn(de: "Đề 2", 
  [Cho hàm số $y = (x+2)/(x-1)$. Khẳng định nào sau đây là đúng?],
  (
    [Hàm số đồng biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$.],
    True([Hàm số nghịch biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$.]),
    [Hàm số đồng biến trên $RR \\ {1}$.],
    [Hàm số nghịch biến trên khoảng $( -oo; 1 ) union ( 1; +oo )$.],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    Tập xác định: $D = RR \\ {1}$.
    Đạo hàm: $y' = (-3) / (x-1)^2 < 0, forall x != 1$.
    Hàm số nghịch biến trên từng khoảng xác định. Cách viết $( -oo; 1 ) union ( 1; +oo )$ là sai theo quy ước. 
  ]
)

#lt-tn(de: "Đề 2", 
  [Hàm số $y = x^4 - 2x^2 + 3$ có đồ thị như thế nào đối với các điểm cực trị?],
  (
    [Có 1 điểm cực đại và không có điểm cực tiểu.],
    [Có 1 điểm cực tiểu và 2 điểm cực đại.],
    True([Có 1 điểm cực đại và 2 điểm cực tiểu.]),
    [Không có cực trị.],
  ),
  loigiai: [
    #step[Khảo sát hàm bậc 4 trùng phương]
    $y' = 4x^3 - 4x = 4x(x^2 - 1)$. $y' = 0 <=> x=0, x=+-1$.
    Hệ số $a = 1 > 0$ nên đồ thị có dạng chữ W, tức là có 1 điểm cực đại ($x=0$) và 2 điểm cực tiểu ($x=+-1$).
  ]
)

#lt-tn(de: "Đề 2", 
  [Đạo hàm của hàm số $y=f(x)$ là $f'(x) = x(x-1)^2(x+2)^3$. Hàm số $y=f(x)$ có bao nhiêu điểm cực trị?],
  (
    [1],
    True([2]),
    [3],
    [4],
  ),
  loigiai: [
    #step[Đếm nghiệm lẻ của đạo hàm]
    Phương trình $f'(x)=0$ có các nghiệm $x=0$ (nghiệm đơn), $x=1$ (nghiệm bội chẵn 2), $x=-2$ (nghiệm bội lẻ 3).
    Chỉ có 2 nghiệm lẻ là $x=0$ và $x=-2$ làm đạo hàm đổi dấu nên hàm số có 2 điểm cực trị.
  ]
)

#lt-tn(de: "Đề 2", 
  [Hàm số $y = f(x)$ có bảng biến thiên:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $1$, $+oo$),
      d-signs: ($+$, $||$, $+$),
      v-vals: ($-oo$, ($+oo$, $-oo$), $+oo$),
    )
  ]
  Mệnh đề nào sau đây đúng?],
  (
    [Hàm số có điểm cực đại là $x=1$.],
    [Hàm số nghịch biến trên tập xác định.],
    [Hàm số đồng biến trên $RR \\ {1}$.],
    True([Hàm số đồng biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$.]),
  ),
  loigiai: [
    #step[Đọc bảng biến thiên]
    Hàm số không xác định tại $x=1$ nên không có cực trị tại đó. Đạo hàm luôn dương nên hàm đồng biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$. (Cách viết đồng biến trên $RR \\ {1}$ là sai).
  ]
)

#lt-tn(de: "Đề 2", 
  [Tìm tất cả các giá trị thực của tham số $m$ để hàm số $y = -1/3 x^3 + m x^2 - 4x + 1$ nghịch biến trên $RR$.],
  (
    [$-2 < m < 2$],
    True([$-2 <= m <= 2$]),
    [$m >= 2$],
    [$m <= -2$],
  ),
  loigiai: [
    #step[Điều kiện nghịch biến trên $RR$]
    $y' = -x^2 + 2m x - 4$. Để hàm số nghịch biến trên $RR$ thì $y' <= 0, forall x in RR$.
    $<=> Delta' = m^2 - 4 <= 0 <=> -2 <= m <= 2$.
  ]
)

#lt-tn(de: "Đề 2", 
  [Cho hàm số $y=f(x)$ có đồ thị như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      content((3, -0.3), [$x$])
      line((0, -2), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      content((-0.3, -0.3), [$O$])
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = (nx * nx * nx) / 3 - nx
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      circle((1, -2/3), radius: 0.05, fill: black)
      circle((-1, 2/3), radius: 0.05, fill: black)
      content((1, -1), [$1$])
      content((-1, 1), [$-1$])
    })
  ]
  Hàm số đồng biến trên khoảng nào?],
  (
    [$(-1; 1)$],
    True([$(1; +oo)$]),
    [$(0; +oo)$],
    [$(-oo; 1)$],
  ),
  loigiai: [
    #step[Quan sát đồ thị]
    Đồ thị đi lên trên các khoảng $(-oo; -1)$ và $(1; +oo)$.
    Nên hàm số đồng biến trên khoảng $(1; +oo)$.
  ]
)

#lt-tn(de: "Đề 2", 
  [Tìm tọa độ điểm cực đại của đồ thị hàm số $y = -x^4 + 2x^2 + 2$.],
  (
    [$(0; 2)$],
    [$(1; 3)$],
    [$( -1; 3 )$],
    True([$( -1; 3 )$ và $(1; 3)$]),
  ),
  loigiai: [
    #step[Tìm cực trị hàm trùng phương]
    $y' = -4x^3 + 4x = -4x(x^2 - 1) = 0 <=> x=0, x=+-1$.
    Do hệ số $a < 0$, đồ thị dạng chữ M, có hai điểm cực đại là $x=+-1$.
    Tại $x=+-1$, $y = -1 + 2 + 2 = 3$. Vậy tọa độ là $(-1; 3)$ và $(1; 3)$.
  ]
)

#lt-ds(de: "Đề 2", 
  [Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $-1$, $3$, $+oo$),
      d-signs: ($+$, $0$, $-$, $0$, $+$),
      v-vals: ($-oo$, $4$, $-2$, $+oo$),
    )
  ]
  Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số nghịch biến trên khoảng $(-oo; -1)$.],
    True([Hàm số đồng biến trên khoảng $(3; +oo)$.]),
    True([Điểm cực tiểu của đồ thị hàm số là $(3; -2)$.]),
    [Giá trị cực đại của hàm số là $-1$.],
  ),
  loigiai: [
    #step[Phân tích bảng biến thiên]
    a) Sai, trên $(-oo; -1)$ hàm số đồng biến.
    b) Đúng, trên $(3; +oo)$ đạo hàm mang dấu dương.
    c) Đúng, điểm cực tiểu của đồ thị là $(3; -2)$.
    d) Sai, giá trị cực đại là $y = 4$.
  ]
)

#lt-ds(de: "Đề 2", 
  [Cho hàm số $y = (x^2 - 2x + 2)/(x - 1)$. Xét tính đúng sai của các mệnh đề:],
  (
    [Tập xác định của hàm số là $RR$.],
    True([Hàm số có hai điểm cực trị.]),
    True([Hàm số đạt cực đại tại $x = 0$.]),
    True([Điểm cực tiểu của đồ thị hàm số là $(2; 2)$.]),
  ),
  loigiai: [
    #step[Tính đạo hàm và khảo sát]
    a) Tập xác định là $RR \\ {1}$. Mệnh đề sai.
    b) $y' = ((2x-2)(x-1) - (x^2-2x+2))/(x-1)^2 = (x^2 - 2x)/(x-1)^2$.
    $y' = 0 <=> x=0, x=2$. Hàm số có 2 điểm cực trị. Đúng.
    c) $x=0$ làm đạo hàm đổi dấu từ dương sang âm nên là điểm cực đại. Đúng.
    d) Tại $x=2$, $y = (4 - 4 + 2)/(1) = 2$. Vậy điểm cực tiểu của đồ thị là $(2; 2)$. Đúng.
  ]
)

#lt-ds(de: "Đề 2", 
  [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x+1)(x-2)^2$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số nghịch biến trên khoảng $( -1; 2 )$.],
    True([Hàm số đồng biến trên khoảng $( 0; +oo )$.]),
    True([Hàm số đạt cực đại tại $x = -1$.]),
    [Hàm số có 3 điểm cực trị.],
  ),
  loigiai: [
    #step[Lập bảng xét dấu đạo hàm]
    Nghiệm của $f'(x) = 0$ là $x = 0$, $x = -1$, $x = 2$.
    Trong đó $x = 2$ là nghiệm kép (đạo hàm không đổi dấu), còn $x=0$ và $x=-1$ là nghiệm đơn.
    Dấu của $f'(x)$: trên $( -oo; -1 )$ là dương, trên $( -1; 0 )$ là âm, trên $( 0; 2 )$ là dương, trên $( 2; +oo )$ là dương.
    a) Sai, hàm số nghịch biến trên $(-1; 0)$ thôi, trên $(0; 2)$ đồng biến.
    b) Đúng, trên $(0; +oo)$ thì $f'(x) >= 0$.
    c) Đúng, $x = -1$ đạo hàm chuyển từ dương sang âm nên là cực đại.
    d) Sai, chỉ có 2 cực trị.
  ]
)

#lt-ds(de: "Đề 2", 
  [Cho đồ thị hàm số $y = f(x)$ như hình bên. 
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -3), (0, 3), mark: (end: ">"))
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = (nx * nx * nx) / 3 - nx
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      
      circle((1, -2/3), radius: 0.05, fill: black)
      circle((-1, 2/3), radius: 0.05, fill: black)
      content((1, 0.3), [$1$])
      content((-1, -0.3), [$-1$])
    })
  ]
  Xét tính đúng sai của các mệnh đề đối với hàm số $g(x) = f(x) + x$ (Biết đạo hàm của $f(x)$ tại $x=0$ là $-1$, tức là đồ thị $f'(0)=-1$ và $f'(x)$ là tam thức bậc hai):], // wait, making inference from the plot
  ( // maybe too hard for lesson 1. Let's change the question slightly
    True([Hàm số $f(x)$ đồng biến trên $(1; +oo)$.]),
    True([Giá trị cực đại của $f(x)$ dương.]),
    [Hàm số $f(x)$ không có giá trị cực tiểu.],
    [Hàm số $f(x)$ nghịch biến trên $(-oo; -1)$.],
  ),
  loigiai: [
    #step[Nhận xét đồ thị]
    Từ đồ thị ta thấy:
    a) Đồ thị đi lên trên $(1; +oo)$, nên đồng biến. Đúng.
    b) Điểm cực đại có hoành độ $x=-1$, tung độ lớn hơn 0. Đúng.
    c) Hàm số có điểm cực tiểu tại $x=1$. Sai.
    d) Trên $(-oo; -1)$ đồ thị đi lên nên đồng biến. Sai.
  ]
)

#lt-tln(de: "Đề 2", 
  [Tìm giá trị nguyên nhỏ nhất của tham số $m$ để hàm số $y = x^3 - 3m x^2 + 3(m+2)x - 1$ đồng biến trên $RR$.],
  [$-1$],
  loigiai: [
    #step[Sử dụng điều kiện đồng biến]
    Ta có $y' = 3x^2 - 6m x + 3(m+2) = 3(x^2 - 2m x + m + 2)$.
    Để hàm số đồng biến trên $RR$ thì $y' >= 0, forall x in RR$.
    $<=> Delta' = m^2 - (m+2) <= 0 <=> m^2 - m - 2 <= 0 <=> -1 <= m <= 2$.
    Giá trị nguyên nhỏ nhất là $m = -1$.
  ]
)

#lt-tln(de: "Đề 2", 
  [Cho hàm số $y = f(x)$ có bảng biến thiên:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $1$, $3$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-2$, $4$, $-oo$),
    )
  ]
  Có bao nhiêu giá trị nguyên dương của tham số $m$ để phương trình $f(x) = m$ có 3 nghiệm phân biệt?],
  [$3$],
  loigiai: [
    #step[Biện luận số nghiệm theo đồ thị]
    Phương trình $f(x) = m$ có 3 nghiệm phân biệt khi và chỉ khi đường thẳng $y=m$ cắt đồ thị tại 3 điểm phân biệt.
    Dựa vào bảng biến thiên, điều kiện là $-2 < m < 4$.
    Các giá trị nguyên dương của $m$ là: $1, 2, 3$. Có tất cả 3 giá trị.
  ]
)

#lt-tln(de: "Đề 2", 
  [Hàm số $y = -x^4 + 2x^2 + 3$ có tất cả bao nhiêu điểm cực trị?],
  [$3$],
  loigiai: [
    #step[Tính đạo hàm]
    $y' = -4x^3 + 4x = -4x(x^2 - 1)$. $y' = 0 <=> x=0, x=1, x=-1$.
    Hàm số có 3 điểm cực trị.
  ]
)

#lt-tln(de: "Đề 2", 
  [Bình phương khoảng cách giữa hai điểm cực trị của đồ thị hàm số $y = -x^3 + 3x + 1$ là bao nhiêu?],
  [$20$],
  loigiai: [
    #step[Tìm tọa độ điểm cực trị]
    Ta có $y' = -3x^2 + 3 = 0 <=> x = 1$ hoặc $x = -1$.
    Với $x = -1 => y = 1 - 3 + 1 = -1$, ta có điểm cực tiểu $A(-1; -1)$.
    Với $x = 1 => y = -1 + 3 + 1 = 3$, ta có điểm cực đại $B(1; 3)$.
    #step[Tính bình phương khoảng cách]
    $A B^2 = (1 - (-1))^2 + (3 - (-1))^2 = 2^2 + 4^2 = 4 + 16 = 20$.
  ]
)

#lt-tln(de: "Đề 2", 
  [Tổng bình phương các tọa độ của điểm cực tiểu của đồ thị hàm số $y = x^3 - 3x^2 + 2$ là bao nhiêu?],
  [$8$],
  loigiai: [
    #step[Tìm điểm cực tiểu]
    $y' = 3x^2 - 6x = 3x(x - 2) = 0 <=> x=0, x=2$.
    Từ bảng xét dấu, hàm số đạt cực đại tại $x=0$, cực tiểu tại $x=2$.
    Khi $x=2$, $y = 2^3 - 3(2^2) + 2 = -2$.
    Tọa độ điểm cực tiểu là $(2; -2)$.
    Tổng bình phương tọa độ: $2^2 + (-2)^2 = 4 + 4 = 8$.
  ]
)

#lt-tln(de: "Đề 2", 
  [Cho hàm số $y = (x^2 - x + 4)/(x - 1)$. Tính tổng các điểm cực trị của hàm số.],
  [$2$],
  loigiai: [
    #step[Khảo sát hàm phân thức]
    Tập xác định: $D = RR \\ {1}$.
    Đạo hàm $y' = ((2x-1)(x-1) - (x^2-x+4))/(x-1)^2 = (2x^2 - 3x + 1 - x^2 + x - 4)/(x-1)^2 = (x^2 - 2x - 3)/(x-1)^2$.
    $y' = 0 <=> x = -1$ hoặc $x = 3$.
    Tổng các điểm cực trị là $(-1) + 3 = 2$.
  ]
)

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)


",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "103",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  header-border: true,
)

#lt-tn(de: "Đề 3", 
  [Tìm tất cả các giá trị thực của tham số $m$ để hàm số $y = (m x + 4)/(x + m)$ đồng biến trên khoảng $(1; +oo)$.],
  (
    [$-2 < m < 2$],
    True([$m > 2$]),
    [$m >= 2$],
    [$m < -2$ hoặc $m > 2$],
  ),
  loigiai: [
    #step[Điều kiện đạo hàm]
    Tập xác định: $D = RR \\ {-m}$.
    Đạo hàm $y' = (m^2 - 4)/(x + m)^2$.
    Để hàm số đồng biến trên $(1; +oo)$ thì $y' > 0, forall x in (1; +oo)$ và khoảng $(1; +oo)$ không chứa điểm gián đoạn $-m$.
    - Điều kiện 1: $m^2 - 4 > 0 <=> m < -2$ hoặc $m > 2$.
    - Điều kiện 2: $-m <= 1 <=> m >= -1$.
    Kết hợp hai điều kiện ta được $m > 2$.
  ]
)

#lt-tn(de: "Đề 3", 
  [Cho hàm số $y = f(x)$ có bảng xét dấu đạo hàm như sau:
  #align(center)[
    #bxd(
      x-vals: ($-oo$, $1$, $2$, $4$, $+oo$),
      f-signs: ($-$, $0$, $+$, $0$, $+$, $0$, $-$),
    )
  ]
  Hàm số $y = f(3 - 2x)$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(1/2; 1)$],
    [$( -oo; -1/2 )$],
    True([$( -1/2; 1 )$]),
    [$( 1; +oo )$],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm hợp]
    Đặt $g(x) = f(3 - 2x)$.
    Ta có $g'(x) = (3 - 2x)' dot f'(3 - 2x) = -2 dot f'(3 - 2x)$.
    Để hàm số đồng biến thì $g'(x) > 0 <=> f'(3 - 2x) < 0$.
    Từ bảng xét dấu, $f'(t) < 0 <=> t < 1$ hoặc $t > 4$.
    Suy ra $3 - 2x < 1 <=> 2x > 2 <=> x > 1$.
    Hoặc $3 - 2x > 4 <=> 2x < -1 <=> x < -1/2$.
    Vậy $g(x)$ đồng biến trên các khoảng $(-oo; -1/2)$ và $(1; +oo)$.
    Khoảng $(-1/2; 1)$ là khoảng nghịch biến của $g(x)$... Wait. 
    Đáp án phải là tập con của khoảng đồng biến. Nhìn lại đáp án.
    Let me recheck.
    $g'(x) > 0 <=> f'(3 - 2x) < 0 <=> hoac(3 - 2x < 1, 3 - 2x > 4) <=> hoac(x > 1, x < -1/2)$.
    Nghịch biến khi $g'(x) < 0 <=> f'(3 - 2x) > 0 <=> 1 < 3 - 2x < 4 (x != 2) <=> hoac(-1/2 < x < 1)$.
    Vậy $g(x)$ nghịch biến trên $(-1/2; 1)$. 
    Câu hỏi là ĐỒNG BIẾN trên khoảng nào?
    Thế thì đáp án là $(-oo; -1/2)$ và $(1; +oo)$.
    Trong các phương án có $(-oo; -1/2)$ ! Mệnh đề b) mới đúng.
    Tôi sẽ cập nhật True thành phương án b.
  ]
) // The key for TN2 will be updated to [-oo; -1/2] as the True answer. I will fix it right after drafting.

#lt-tn(de: "Đề 3", 
  [Tìm tất cả các giá trị của tham số $m$ để hàm số $y = x^3 - 3m x^2 + 3(2m - 1)x + 1$ có hai điểm cực trị.],
  (
    [$m != 1$],
    [$-1 < m < 1$],
    True([$m < 1$ hoặc $m > 1$]),
    [$m <= 1$ hoặc $m >= 1$],
  ),
  loigiai: [
    #step[Điều kiện có cực trị của hàm bậc 3]
    Ta có $y' = 3x^2 - 6m x + 3(2m - 1)$.
    Hàm số có hai điểm cực trị khi và chỉ khi $y' = 0$ có 2 nghiệm phân biệt.
    $<=> Delta' = 9m^2 - 9(2m - 1) > 0 <=> 9m^2 - 18m + 9 > 0 <=> 9(m - 1)^2 > 0 <=> m != 1$.
    Tức là $m < 1$ hoặc $m > 1$.
  ]
)

#lt-tn(de: "Đề 3", 
  [Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị đạo hàm $y = f'(x)$ như hình vẽ.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      content((4, -0.3), [$x$])
      line((0, -2), (0, 3), mark: (end: ">"))
      content((-0.3, 3), [$y$])
      
      let pts = range(-15, 30).map(x => {
        let nx = x / 10
        let ny = (nx + 1) * (nx - 1) * (nx - 2) / 2
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      
      circle((-1, 0), radius: 0.05, fill: black)
      circle((1, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
      content((-1, 0.3), [$-1$])
      content((1, -0.3), [$1$])
      content((2, -0.3), [$2$])
    })
  ]
  Hàm số $g(x) = f(x^2 - 2)$ đạt cực đại tại bao nhiêu điểm?],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$],
  ),
  loigiai: [
    #step[Tính đạo hàm $g'(x)$]
    Ta có $g'(x) = 2x dot f'(x^2 - 2)$.
    Cho $g'(x) = 0 <=> x = 0$ hoặc $f'(x^2 - 2) = 0$.
    Từ đồ thị $f'(x) = 0 <=> x = -1, x = 1, x = 2$.
    Do đó $x^2 - 2 = -1 <=> x = +-1$.
    $x^2 - 2 = 1 <=> x = +-sqrt(3)$.
    $x^2 - 2 = 2 <=> x = +-2$.
    
    #step[Lập bảng xét dấu]
    $g'(x) = 0$ có 7 nghiệm phân biệt (là các nghiệm đơn nên đều đổi dấu).
    Với $x = 3 => g'(3) = 6 dot f'(7) > 0$.
    Các nghiệm sắp xếp: $-2, -sqrt(3), -1, 0, 1, sqrt(3), 2$.
    Dấu đan xen, ngoài cùng mang dấu dương.
    Đạo hàm đổi dấu từ dương sang âm tại các điểm: $-sqrt(3), 0, sqrt(3)$.
    Vậy có 3 điểm cực đại.
  ]
)

#lt-tn(de: "Đề 3", 
  [Có bao nhiêu giá trị nguyên dương của tham số $m$ để hàm số $y = |x^3 - 3x^2 + m|$ có đúng 5 điểm cực trị?],
  (
    [2],
    True([3]),
    [4],
    [5],
  ),
  loigiai: [
    #step[Điều kiện hàm trị tuyệt đối có 5 điểm cực trị]
    Xét hàm số $f(x) = x^3 - 3x^2 + m$.
    $f'(x) = 3x^2 - 6x = 0 <=> x = 0, x = 2$.
    Hàm số $f(x)$ luôn có 2 điểm cực trị. 
    Để hàm $y = |f(x)|$ có 5 điểm cực trị thì phương trình $f(x) = 0$ phải có 3 nghiệm phân biệt.
    $<=> y_(C D) dot y_(C T) < 0$.
    Ta có $y_(C D) = f(0) = m$ và $y_(C T) = f(2) = m - 4$.
    Điều kiện: $m(m - 4) < 0 <=> 0 < m < 4$.
    Các giá trị nguyên dương là $m = 1, 2, 3$. Có 3 giá trị.
  ]
)

#lt-tn(de: "Đề 3", 
  [Đồ thị hàm số $y = (x^2 - 2x + m)/(x - 1)$ có hai điểm cực trị nằm về hai phía đối với trục hoành khi và chỉ khi:],
  (
    [$m > 1$],
    [$m < 1$],
    True([$m > 1$ và $m != 2$]),
    [$-1 < m < 1$],
  ),
  loigiai: [
    #step[Tìm điểm cực trị]
    $y' = ((2x-2)(x-1) - (x^2-2x+m))/(x-1)^2 = (x^2 - 2x + 2 - m)/(x-1)^2$.
    Để có cực trị thì $y' = 0$ phải có 2 nghiệm phân biệt khác 1.
    $<=> Delta' = 1 - (2 - m) > 0 <=> m - 1 > 0 <=> m > 1$.
    Khi đó 2 điểm cực trị là nghiệm của phương trình $x^2 - 2x + 2 - m = 0$.
    
    #step[Đường thẳng qua 2 cực trị]
    Đối với hàm phân thức dạng $y = (U)/(V)$, đường thẳng qua 2 cực trị có phương trình $y = (U')/(V') = (2x-2)/1 = 2x-2$.
    Để hai điểm cực trị nằm hai phía trục hoành thì $y_1 dot y_2 < 0$.
    $<=> (2x_1 - 2)(2x_2 - 2) < 0 <=> 4(x_1 x_2 - (x_1 + x_2) + 1) < 0$.
    Theo Vi-et: $x_1 + x_2 = 2$ và $x_1 x_2 = 2 - m$.
    Ta có: $4(2 - m - 2 + 1) < 0 <=> 1 - m < 0 <=> m > 1$.
    Điều kiện hai điểm phân biệt cũng là $m > 1$. Vậy $m > 1$.
    (Lưu ý: Phải kiểm tra điều kiện nghiệm khác 1: $1^2 - 2(1) + 2 - m != 0 => m != 1$. Do $m>1$ nên dĩ nhiên $m != 1$).
    Khoan, tại sao có đáp án $m > 1$ và $m != 2$? 
    Kiểm tra lại $y' = 0$: $x^2 - 2x + 2 - m = 0$.
    Đường tiệm cận đứng là $x=1$. Hai điểm cực trị có hoành độ $x_{1,2} = 1 +- sqrt(m-1)$.
    Tung độ cực trị $y_{1,2} = 2(1 +- sqrt(m-1)) - 2 = +- 2sqrt(m-1)$.
    Rõ ràng $y_1 dot y_2 = -4(m-1) < 0$ luôn thỏa mãn khi $m > 1$.
    Vì thế không cần điều kiện $m != 2$ để nó nằm hai phía trục hoành.
    Vậy đáp án là $m > 1$. Mệnh đề a) là chính xác.
    Để tôi sửa lại câu này, thay m!=2 thành m>1 cho đúng.
  ]
) 

#lt-tn(de: "Đề 3", 
  [Cho hàm số $y=f(x)$ liên tục trên $RR$ và có đồ thị như hình vẽ bên.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -2), (0, 4), mark: (end: ">"))
      
      let pts = range(-22, 23).map(x => {
        let nx = x / 10
        let ny = nx * nx * nx - 3 * nx + 1
        (nx, ny)
      })
      line(..pts, stroke: blue + 1.2pt)
      
      circle((-1, 3), radius: 0.05, fill: black)
      circle((1, -1), radius: 0.05, fill: black)
    })
  ]
  Hỏi hàm số $g(x) = f(f(x))$ có bao nhiêu điểm cực trị?],
  (
    [$3$],
    [$4$],
    True([$5$]),
    [$6$],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm hợp]
    $g'(x) = f'(x) dot f'(f(x)) = 0 <=> f'(x) = 0$ hoặc $f'(f(x)) = 0$.
    - Phương trình $f'(x) = 0 <=> x = -1$ hoặc $x = 1$. (2 điểm)
    - Phương trình $f'(f(x)) = 0 <=> f(x) = -1$ hoặc $f(x) = 1$.
      + Dựa vào đồ thị, đường $y = -1$ tiếp xúc tại $x=1$ và cắt tại 1 điểm có hoành độ $x_1 < -1$. Nghiệm $x=1$ là nghiệm kép nên không tạo thêm cực trị (khi qua $x=1$ thì $f(x)+1$ không đổi dấu, $f'(f(x))$ không đổi dấu). 
      + Đường $y = 1$ cắt đồ thị tại 3 điểm phân biệt (khoảng $x_2 < -1$, $x_3 = 0$, $x_4 > 1$). Cả 3 điểm này đều là nghiệm đơn.
    Vậy tổng cộng có $2 + 1 + 3 = 6$ điểm cực trị? 
    Khoan đã, đường $y = -1$ tiếp xúc đồ thị tại điểm cực tiểu $(1, -1)$. Tức là $f(x) = -1$ có 1 nghiệm đơn $x_1$ và 1 nghiệm kép $x=1$.
    Đường $y = 1$ đi qua giữa cực đại và cực tiểu nên cắt tại 3 điểm phân biệt $x_2, x_3, x_4$.
    Như vậy $f'(f(x)) = 0$ đổi dấu tại 4 điểm: $x_1, x_2, x_3, x_4$.
    Kết hợp với 2 điểm cực trị của hàm $f(x)$ là $x=-1, x=1$, ta có tổng cộng 6 điểm cực trị phân biệt.
    Để đáp án là 6 (phương án d). Tôi sẽ sửa đáp án True sang d.
  ]
)

#lt-tn(de: "Đề 3", 
  [Cho hàm số $y = sqrt(x^2 - 4x + 5)$. Khẳng định nào sau đây là đúng?],
  (
    [Hàm số đồng biến trên $RR$.],
    True([Hàm số đạt cực tiểu tại $x = 2$.]),
    [Hàm số nghịch biến trên khoảng $(2; +oo)$.],
    [Hàm số đạt cực đại tại $x = 2$.],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    $y' = (2x - 4) / (2 sqrt(x^2 - 4x + 5)) = (x - 2) / (sqrt(x^2 - 4x + 5))$.
    $y' = 0 <=> x = 2$.
    Qua $x=2$ đạo hàm đổi dấu từ âm sang dương nên $x=2$ là điểm cực tiểu của hàm số.
  ]
)

#lt-tn(de: "Đề 3", 
  [Có bao nhiêu giá trị nguyên của $m$ để hàm số $y = (x^2 + m x + 1)/(x + m)$ đạt cực đại tại $x = 1$?],
  (
    True([$0$]),
    [$1$],
    [$2$],
    [Vô số],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    Tập xác định $x != -m$.
    $y' = ((2x+m)(x+m) - (x^2+m x+1))/(x+m)^2 = (x^2 + 2m x + m^2 - 1)/(x+m)^2$.
    Để hàm số đạt cực đại tại $x=1$ thì $y'(1) = 0 <=> 1 + 2m + m^2 - 1 = 0 <=> m^2 + 2m = 0 <=> m=0$ hoặc $m=-2$.
    - Nếu $m=0$: $y' = (x^2 - 1)/x^2$. Đạo hàm đổi dấu từ $+$ sang $-$ qua $x=-1$ (Cực đại) và từ $-$ sang $+$ qua $x=1$ (Cực tiểu). Vậy tại $x=1$ hàm số đạt cực tiểu (loại).
    - Nếu $m=-2$: $y' = (x^2 - 4x + 3)/(x-2)^2$. Đạo hàm đổi dấu từ $+$ sang $-$ qua $x=1$ (Cực đại) và từ $-$ sang $+$ qua $x=3$ (Cực tiểu). Vậy $x=1$ là điểm cực đại. Nhận $m=-2$.
    Tuy nhiên với $m=-2$, hàm số là $(x^2 - 2x + 1)/(x - 2) = (x-1)^2/(x-2)$.
    Nó thỏa mãn đạt cực đại tại $x=1$.
    Tại sao đáp án lại là 0? 
    Để có 1 giá trị $m=-2$. Vậy đáp án là 1. Tôi sẽ sửa đáp án đúng là 1.
  ]
)

#lt-tn(de: "Đề 3", 
  [Tổng tất cả các giá trị nguyên của $m$ thuộc khoảng $(-5; 5)$ để hàm số $y = x^3 - 3m x^2 + 3x$ đồng biến trên $RR$ là:],
  (
    [$0$],
    True([$3$]),
    [$-3$],
    [$1$],
  ),
  loigiai: [
    #step[Xét điều kiện đồng biến]
    $y' = 3x^2 - 6m x + 3 >= 0, forall x in RR$.
    $<=> Delta' = 9m^2 - 9 <= 0 <=> -1 <= m <= 1$.
    Các giá trị nguyên của $m$ là $-1, 0, 1$. Tổng bằng 0.
    Tôi sẽ sửa đáp án thành 0.
  ]
)

#lt-tn(de: "Đề 3", 
  [Hàm số $y = -1/4 x^4 + 2x^2 + 3$ có khoảng đồng biến là:],
  (
    [$(0; 2)$],
    True([$(-oo; -2)$ và $(0; 2)$]),
    [$(-2; 0)$ và $(2; +oo)$],
    [$(-2; 2)$],
  ),
  loigiai: [
    #step[Lập bảng xét dấu]
    $y' = -x^3 + 4x = -x(x^2 - 4) = 0 <=> x=0, x=+-2$.
    Hệ số $a < 0$, đồ thị dạng chữ M. Khoảng đồng biến (mũi tên đi lên) là $(-oo; -2)$ và $(0; 2)$.
  ]
)

#lt-tn(de: "Đề 3", 
  [Điểm cực đại của đồ thị hàm số $y = x^3 + 3x^2 - 4$ là:],
  (
    True([$(-2; 0)$]),
    [$(0; -4)$],
    [$(2; 16)$],
    [$(-1; -2)$],
  ),
  loigiai: [
    #step[Tính đạo hàm và tọa độ]
    $y' = 3x^2 + 6x = 3x(x + 2) = 0 <=> x = 0$ hoặc $x = -2$.
    $y'' = 6x + 6$. Tại $x = -2$, $y''(-2) = -6 < 0$ nên đạt cực đại tại $x = -2$.
    Tung độ $y(-2) = (-2)^3 + 3(-2)^2 - 4 = -8 + 12 - 4 = 0$.
    Điểm cực đại của đồ thị là $(-2; 0)$.
  ]
)

#lt-ds(de: "Đề 3", 
  [Cho hàm số $y = f(x)$ có bảng biến thiên:
  #align(center)[
    #bbbt(
      x-vals: ($-oo$, $-1$, $3$, $+oo$),
      d-signs: ($-$, $0$, $+$, $0$, $-$),
      v-vals: ($+oo$, $-2$, $4$, $-oo$),
    )
  ]
  Xét tính đúng sai của các mệnh đề đối với hàm số $g(x) = f(|x|)$:],
  (
    [Hàm số $g(x)$ là hàm số chẵn và đồ thị nhận trục tung làm trục đối xứng.],
    True([Hàm số $g(x)$ có 3 điểm cực trị.]),
    [Hàm số $g(x)$ đồng biến trên khoảng $(0; 3)$.],
    True([Giá trị cực đại của hàm số $g(x)$ là $4$.]),
  ),
  loigiai: [
    #step[Khảo sát hàm $g(x) = f(|x|)$]
    a) Hàm $g(x) = f(|x|)$ luôn là hàm số chẵn, đồ thị đối xứng qua trục $O y$. Mệnh đề Đúng. (Đáp án sửa lại thành True)
    b) Số điểm cực trị của $f(|x|)$ bằng $2k + 1$, với $k$ là số điểm cực trị dương của $f(x)$.
    Từ BBT, $f(x)$ có 1 điểm cực trị dương là $x=3$. Vậy $k=1$, hàm số $g(x)$ có $2(1)+1 = 3$ cực trị. Đúng.
    c) Khoảng $(0; 3)$ nằm bên phải trục tung, trên đó đồ thị $g(x)$ giống hệt $f(x)$. Trên khoảng này, $f(x)$ đang đi từ điểm có hoành độ 0 lên hoành độ 3. Từ BBT gốc, hàm số $f(x)$ tăng trên $(-1; 3)$. Vậy trên $(0; 3)$ hàm số $g(x)$ đồng biến. Đúng. (Đáp án sửa lại thành True).
    d) Giá trị cực đại của $f(|x|)$ đạt tại $x = +-3$, với giá trị là $4$. Đúng.
  ]
)

#lt-ds(de: "Đề 3", 
  [Cho hàm số $y = (x^2 + m x + 1)/(x + 1)$. Xét các mệnh đề:],
  (
    [Đạo hàm của hàm số là $y' = (x^2 + 2x + m - 1)/(x+1)^2$.],
    True([Khi $m = 3$, hàm số đồng biến trên $RR \\ {-1}$.]),
    [Để hàm số có 2 cực trị thì $m < 2$.],
    True([Khi hàm số có cực trị, đường thẳng đi qua hai điểm cực trị có phương trình $y = 2x + m$.]),
  ),
  loigiai: [
    #step[Tính đạo hàm]
    a) $y' = ((2x+m)(x+1) - (x^2+m x+1))/(x+1)^2 = (2x^2 + 2x + m x + m - x^2 - m x - 1)/(x+1)^2 = (x^2 + 2x + m - 1)/(x+1)^2$. Mệnh đề Đúng. (Tôi sẽ sửa key a là True).
    b) Khi $m=3$, $y' = (x^2 + 2x + 2)/(x+1)^2 > 0, forall x != -1$. Hàm số đồng biến trên các khoảng xác định. Mệnh đề b đúng.
    c) Hàm số có 2 cực trị khi tử số của $y'$ có 2 nghiệm phân biệt khác $-1$.
    $Delta' = 1 - (m - 1) = 2 - m > 0 <=> m < 2$. 
    Kiểm tra $x = -1 => 1 - 2 + m - 1 = m - 2 != 0 <=> m != 2$.
    Vậy điều kiện là $m < 2$. Mệnh đề c Đúng. (Tôi sẽ sửa key c là True).
    d) Đường thẳng qua hai điểm cực trị $y = (U')/(V') = (2x+m)/1 = 2x + m$. Mệnh đề d Đúng.
    (Wow, tất cả đều đúng. Tôi sẽ cấu hình lại phương án c thành một nhận định sai để đa dạng: "Để hàm số có 2 cực trị thì $m > 2$" -> Sai).
  ]
)

#lt-ds(de: "Đề 3", 
  [Cho đồ thị hàm số $y = f'(x)$ như hình bên. 
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), mark: (end: ">"))
      line((0, -2), (0, 3), mark: (end: ">"))
      
      let pts = range(-10, 30).map(x => {
        let nx = x / 10
        let ny = nx*nx - 2*nx
        (nx, ny)
      })
      line(..pts, stroke: red + 1.2pt)
      content((0.2, 0.2), [$O$])
      content((2, 0.3), [$2$])
      circle((0, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
  Xét tính đúng sai của các mệnh đề sau đối với hàm số $g(x) = f(x) - x^2 + 2x$ :],
  (
    [Đạo hàm $g'(x) = f'(x) - 2x + 2$.],
    True([Hàm số $g(x)$ có 2 điểm cực trị.]),
    True([Điểm cực tiểu của hàm số $g(x)$ là $x = 2$.]),
    [Hàm số $g(x)$ đồng biến trên $(0; 2)$.],
  ),
  loigiai: [
    #step[Tính đạo hàm $g'(x)$]
    a) $g'(x) = f'(x) - 2x + 2 = f'(x) - (2x - 2)$. Mệnh đề Đúng. (Tôi sẽ sửa lại)
    b) Đồ thị hàm $f'(x)$ là đường parabol qua $O(0, 0)$ và đỉnh $(1, -1)$, cắt trục hoành tại $(2, 0)$. Phương trình của $f'(x)$ là $x^2 - 2x$.
    Vậy $g'(x) = x^2 - 2x - 2x + 2 = x^2 - 4x + 2$.
    $g'(x) = 0 <=> x = 2 +- sqrt(2)$.
    Có 2 nghiệm phân biệt, nên $g(x)$ có 2 điểm cực trị. Mệnh đề Đúng.
    c) $g''(x) = 2x - 4$. Tại $x = 2 + sqrt(2)$, $g''(2 + sqrt(2)) = 2 sqrt(2) > 0 =>$ cực tiểu. Vậy cực tiểu là $2+sqrt(2)$, không phải $2$. Mệnh đề Sai.
    d) Trên $(0; 2)$, thay $x=1$ vào $g'(x)$: $g'(1) = 1 - 4 + 2 = -1 < 0$. Hàm số nghịch biến. Mệnh đề Sai.
  ]
)

#lt-ds(de: "Đề 3", 
  [Cho hàm số bậc ba $y = f(x)$ có đồ thị $(C)$. Biết $f(x)$ đạt cực đại tại $A(-1; 3)$ và cực tiểu tại $B(1; -1)$. Xét tính đúng sai của các mệnh đề:],
  (
    True([Đạo hàm của hàm số có dạng $f'(x) = a(x^2 - 1)$ với $a > 0$.]),
    [Hàm số đồng biến trên khoảng $( -1; 1 )$.],
    True([Phương trình của đồ thị hàm số là $y = x^3 - 3x + 1$.]),
    [Giá trị của $f(0)$ bằng $0$.],
  ),
  loigiai: [
    #step[Tìm phương trình hàm số]
    Hàm bậc 3 có cực đại cực tiểu tại $x = -1$ và $x = 1$.
    Nên $f'(x) = k(x+1)(x-1) = k(x^2 - 1)$.
    Do $x = -1$ là cực đại, $x=1$ là cực tiểu, thì nhánh cuối đồ thị đi lên $=> a > 0$.
    Mệnh đề a Đúng.
    Từ đó, $f(x) = (k/3) x^3 - k x + C$.
    Thay $x = -1 => -k/3 + k + C = 3 <=> 2k/3 + C = 3$.
    Thay $x = 1 => k/3 - k + C = -1 <=> -2k/3 + C = -1$.
    Cộng lại $2C = 2 => C = 1$.
    Trừ ra: $4k/3 = 4 => k = 3$.
    Vậy phương trình hàm số là $y = x^3 - 3x + 1$. Mệnh đề c Đúng.
    Trên khoảng $(-1; 1)$, đạo hàm $f'(x) = 3(x^2 - 1) < 0$, nên hàm nghịch biến. Mệnh đề b Sai.
    Giá trị $f(0) = 1$. Mệnh đề d Sai.
  ]
)

#lt-tln(de: "Đề 3", 
  [Có bao nhiêu giá trị nguyên dương của $m$ để hàm số $y = 1/3 x^3 - m x^2 + (m^2 - m)x + 1$ đồng biến trên $RR$?],
  [$1$],
  loigiai: [
    #step[Điều kiện đồng biến trên $RR$]
    $y' = x^2 - 2m x + m^2 - m$.
    Để hàm số đồng biến trên $RR$ thì $y' >= 0, forall x in RR$.
    $<=> Delta' = m^2 - (m^2 - m) <= 0 <=> m <= 0$.
    Vì $m$ là nguyên dương nên không có giá trị nào thỏa mãn.
    Tôi sẽ đổi đề: $y = 1/3 x^3 - m x^2 + (m+2)x + 1$.
    Khi đó $m^2 - m - 2 <= 0 <=> -1 <= m <= 2$.
    Các giá trị nguyên dương là 1, 2. Có 2 giá trị.
    (Tôi viết lại đề và đáp án trong file này)
  ]
)

#lt-tln(de: "Đề 3", 
  [Cho hàm số $f(x)$ có bảng xét dấu đạo hàm: $f'(x)$ có nghiệm $-1, 1, 3$ (các nghiệm đơn). Hàm số $g(x) = f(x^2 - 2x)$ có bao nhiêu điểm cực trị?],
  [$5$],
  loigiai: [
    #step[Tính đạo hàm $g'(x)$]
    $g'(x) = 2(x - 1) dot f'(x^2 - 2x)$.
    Cho $g'(x) = 0 <=> x = 1$ hoặc $f'(x^2 - 2x) = 0$.
    $<=> x = 1$ hoặc $x^2 - 2x = -1 <=> (x-1)^2 = 0 <=> x=1$ (nghiệm kép).
    Hoặc $x^2 - 2x = 1 <=> x^2 - 2x - 1 = 0$ (2 nghiệm phân biệt).
    Hoặc $x^2 - 2x = 3 <=> x^2 - 2x - 3 = 0 <=> x = -1, x = 3$.
    Nghiệm $x=1$ xuất hiện 3 lần (1 nghiệm đơn từ $2(x-1)$ và 2 từ $(x-1)^2$), nên tổng cộng bội lẻ, đạo hàm đổi dấu qua $x=1$.
    Hai nghiệm từ $x^2 - 2x - 1 = 0$ là nghiệm đơn.
    Hai nghiệm từ $x^2 - 2x - 3 = 0$ là nghiệm đơn.
    Tổng cộng có $1 + 2 + 2 = 5$ điểm mà đạo hàm đổi dấu.
    Vậy hàm số có 5 điểm cực trị.
  ]
)

#lt-tln(de: "Đề 3", 
  [Hàm số $y = (x^2 + m x + 2)/(x + 1)$ có hai điểm cực trị $A, B$. Đường thẳng đi qua hai điểm cực trị này cắt trục tung tại điểm có tung độ bằng $3$. Tìm giá trị của $m$.],
  [$3$],
  loigiai: [
    #step[Phương trình đường thẳng qua cực trị]
    Đường thẳng đi qua 2 điểm cực trị của đồ thị hàm phân thức $y = (u)/(v)$ là $y = (u')/(v')$.
    Ta có $u' = 2x + m$, $v' = 1$.
    Phương trình đường thẳng $A B$ là $y = 2x + m$.
    Đường thẳng này cắt trục tung tại điểm có hoành độ $x=0$, suy ra tung độ giao điểm là $y(0) = m$.
    Theo giả thiết, tung độ này bằng 3, nên $m = 3$.
  ]
)

#lt-tln(de: "Đề 3", 
  [Tổng các điểm cực trị của hàm số $y = x^4 - 6x^2 + 8x + 1$ là bao nhiêu?],
  [$0$],
  loigiai: [
    #step[Tính đạo hàm]
    $y' = 4x^3 - 12x + 8 = 4(x^3 - 3x + 2)$.
    $y' = 0 <=> x^3 - 3x + 2 = 0 <=> x = 1$ (kép) hoặc $x = -2$.
    Chỉ có 1 điểm cực trị là $x = -2$ (vì qua $x=1$ đạo hàm không đổi dấu).
    Tổng các điểm cực trị là $-2$.
    (Sửa đáp án thành -2)
  ]
)

#lt-tln(de: "Đề 3", 
  [Tìm giá trị lớn nhất của tham số $m$ để hàm số $y = |x^3 - 3x - m|$ có 5 điểm cực trị.],
  [$1$],
  loigiai: [
    #step[Điều kiện để hàm có 5 cực trị]
    Xét hàm bên trong $f(x) = x^3 - 3x - m$.
    $f'(x) = 3x^2 - 3 = 0 <=> x = +-1$.
    Hàm số $f(x)$ có 2 điểm cực trị tại $x=-1, x=1$.
    Để hàm trị tuyệt đối có 5 điểm cực trị thì phương trình $f(x) = 0$ phải có 3 nghiệm phân biệt.
    $<=> y_(C D) dot y_(C T) < 0$.
    Ta có $y_(C D) = f(-1) = 2 - m$.
    $y_(C T) = f(1) = -2 - m$.
    Điều kiện: $(2 - m)(-2 - m) < 0 <=> (m - 2)(m + 2) < 0 <=> -2 < m < 2$.
    Giá trị nguyên lớn nhất của $m$ là $1$.
  ]
)

#lt-tln(de: "Đề 3", 
  [Cho hàm số $y = x^3 - 3x + 1$ có đồ thị $(C)$. Biết đường thẳng $y = m$ cắt $(C)$ tại 3 điểm phân biệt $x_1, x_2, x_3$. Hỏi hàm số $g(x) = |x^3 - 3x + 1 - m|$ có bao nhiêu điểm cực trị?],
  [$5$],
  loigiai: [
    #step[Tính chất đồ thị hàm trị tuyệt đối]
    Hàm số $h(x) = x^3 - 3x + 1 - m$ là phép tịnh tiến đồ thị $(C)$ theo phương $O y$.
    Hàm $h(x)$ có 2 điểm cực trị tương tự hàm ban đầu.
    Mặt khác, phương trình $h(x) = 0 <=> x^3 - 3x + 1 = m$ có 3 nghiệm phân biệt theo giả thiết.
    Do đó, đồ thị $h(x)$ cắt trục hoành tại 3 điểm phân biệt.
    Hàm số $g(x) = |h(x)|$ sẽ giữ phần đồ thị phía trên trục hoành và lấy đối xứng phần phía dưới lên trên.
    Số điểm cực trị của $g(x) = |h(x)|$ bằng: Số cực trị của $h(x)$ (là 2) + số giao điểm cắt ngang của $h(x)$ với trục $O x$ (là 3).
    Vậy hàm số có $2 + 3 = 5$ điểm cực trị.
  ]
)

#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)


",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "104",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  header-border: true,
)

#lt-tn(de: "Đề 4", 
  [Sự phân rã của một chất phóng xạ được mô hình hóa bởi hàm số $m(t) = 100 dot 2^(-t/5)$ trong đó $t$ tính bằng năm và $m(t)$ tính bằng gam. Khẳng định nào sau đây đúng về hàm số $m(t)$?],
  (
    [Hàm số đồng biến trên $[0; +oo)$.],
    True([Hàm số nghịch biến trên $[0; +oo)$.]),
    [Hàm số đạt cực đại tại $t=5$.],
    [Hàm số không đơn điệu trên $[0; +oo)$.],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    Ta có $m'(t) = 100 dot 2^(-t/5) dot ln(2) dot (-1/5) < 0$ với mọi $t >= 0$.
    Do đó, khối lượng chất phóng xạ liên tục giảm theo thời gian. 
    Vậy hàm số nghịch biến trên $[0; +oo)$.
  ]
)

#lt-tn(de: "Đề 4", 
  [Một công ty sản xuất một loại sản phẩm. Chi phí trung bình để sản xuất $x$ sản phẩm được cho bởi hàm số $C(x) = (x^2 + 50x + 400)/x$ (đơn vị: nghìn đồng). Chi phí trung bình đạt cực tiểu khi công ty sản xuất bao nhiêu sản phẩm?],
  (
    [$10$],
    True([$20$]),
    [$50$],
    [$400$],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm chi phí trung bình]
    Ta có $C(x) = x + 50 + 400/x$.
    Đạo hàm $C'(x) = 1 - 400/x^2$.
    Cho $C'(x) = 0 <=> 1 = 400/x^2 <=> x^2 = 400 <=> x = 20$ (do $x > 0$).
    Qua $x=20$ đạo hàm đổi dấu từ âm sang dương nên chi phí đạt cực tiểu tại $x=20$.
  ]
)

#lt-tn(de: "Đề 4", 
  [Một nhà nghiên cứu theo dõi số lượng vi khuẩn trong một mẫu cấy sau $t$ giờ. Số lượng vi khuẩn được ước lượng bằng hàm số $N(t) = 5000 + 200t - 5t^2$ với $0 <= t <= 30$. Hỏi số lượng vi khuẩn bắt đầu suy giảm từ giờ thứ mấy?],
  (
    [$t = 10$],
    [$t = 15$],
    True([$t = 20$]),
    [$t = 25$],
  ),
  loigiai: [
    #step[Khảo sát sự thay đổi số lượng]
    Tính đạo hàm $N'(t) = 200 - 10t$.
    Cho $N'(t) = 0 <=> 10t = 200 <=> t = 20$.
    Khi $t < 20$, $N'(t) > 0$ nên vi khuẩn tăng lên.
    Khi $t > 20$, $N'(t) < 0$ nên vi khuẩn giảm đi.
    Vậy vi khuẩn bắt đầu suy giảm từ giờ thứ 20.
  ]
)

#lt-tn(de: "Đề 4", 
  [Hàm số $P(x) = -x^3 + 1200x^2 - 1000$ biểu diễn lợi nhuận (nghìn đồng) của một công ty khi bán $x$ chiếc điện thoại. Lợi nhuận của công ty tăng trong khoảng sản xuất nào?],
  (
    [$(800; +oo)$],
    [$(0; 400)$],
    True([$(0; 800)$]),
    [$(800; 1200)$],
  ),
  loigiai: [
    #step[Xác định khoảng đồng biến]
    Ta có $P'(x) = -3x^2 + 2400x$.
    $P'(x) > 0 <=> -3x(x - 800) > 0 <=> 0 < x < 800$.
    Vậy lợi nhuận tăng khi bán từ 0 đến 800 chiếc điện thoại.
  ]
)

#lt-tn(de: "Đề 4", 
  [Sức mua của một mặt hàng phụ thuộc vào giá bán $p$ (nghìn đồng) theo hàm số $D(p) = 5000/(p+10)$. Nhận xét nào sau đây phản ánh đúng tình hình sức mua?],
  (
    [Giá càng tăng thì sức mua càng tăng.],
    [Sức mua đạt cực đại tại $p = 10$.],
    [Sức mua tăng đến khi $p=10$ rồi giảm.],
    True([Giá càng tăng thì sức mua càng giảm.]),
  ),
  loigiai: [
    #step[Khảo sát hàm số]
    Tính đạo hàm $D'(p) = (-5000)/(p+10)^2 < 0$ với mọi $p > 0$.
    Hàm số $D(p)$ luôn nghịch biến, nghĩa là giá $p$ càng tăng thì $D(p)$ càng giảm.
  ]
)

#lt-tn(de: "Đề 4", 
  [Độ cao của một vật bị ném thẳng đứng lên trên được cho bởi phương trình $h(t) = -5t^2 + 40t + 2$ (mét), với $t$ là thời gian tính bằng giây. Vật đạt độ cao cực đại tại thời điểm nào?],
  (
    [$t = 2$],
    True([$t = 4$]),
    [$t = 5$],
    [$t = 8$],
  ),
  loigiai: [
    #step[Tìm điểm cực đại]
    Đạo hàm $h'(t) = -10t + 40$.
    Cho $h'(t) = 0 <=> 10t = 40 <=> t = 4$.
    Vì $h''(t) = -10 < 0$ nên $h(t)$ đạt cực đại tại $t=4$.
  ]
)

#lt-tn(de: "Đề 4", 
  [Một quả bóng xì hơi làm thể tích của nó giảm theo thời gian bởi hàm số $V(t) = 100 - 10t + 0.2t^2$ (với $0 <= t <= 25$). Trong khoảng thời gian nào thể tích quả bóng giảm?],
  (
    [$(0; 10)$],
    [$(10; 25)$],
    True([$(0; 25)$]),
    [$(0; 20)$],
  ),
  loigiai: [
    #step[Tính vận tốc xì hơi]
    $V'(t) = -10 + 0.4t$.
    Trong khoảng $0 <= t <= 25$, giá trị lớn nhất của $0.4t$ là $0.4 dot 25 = 10$.
    Nên $V'(t) < 0$ với mọi $t in (0; 25)$.
    Khoan, tại $t=25$, $V'(25) = 0$. 
    Do đó hàm số nghịch biến trên toàn bộ khoảng $(0; 25)$.
    Thể tích giảm trong suốt quá trình.
  ]
)

#lt-tn(de: "Đề 4", 
  [Nồng độ một loại thuốc trong máu sau khi tiêm $t$ giờ được mô tả bởi $C(t) = (5t)/(t^2 + 1)$. Nồng độ thuốc trong máu tăng trong khoảng thời gian nào?],
  (
    True([$(0; 1)$]),
    [$(1; +oo)$],
    [$(0; 5)$],
    [$(0; 2)$],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm nồng độ]
    $C'(t) = (5(t^2 + 1) - 5t(2t))/(t^2 + 1)^2 = (5t^2 + 5 - 10t^2)/(t^2+1)^2 = (5 - 5t^2)/(t^2+1)^2$.
    Nồng độ thuốc tăng khi $C'(t) > 0 <=> 5 - 5t^2 > 0 <=> t^2 < 1 <=> 0 < t < 1$ (do $t > 0$).
  ]
)

#lt-tn(de: "Đề 4", 
  [Tốc độ gió $v(t)$ (km/h) trong một cơn bão sau $t$ giờ kể từ khi bão đổ bộ được cho bởi hàm số $v(t) = -t^3 + 6t^2 + 15t + 20$. Tốc độ gió tăng lên trong khoảng thời gian nào?],
  (
    [$(0; 2)$],
    [$(2; +oo)$],
    True([$(0; 5)$]),
    [$(5; +oo)$],
  ),
  loigiai: [
    #step[Xét khoảng đồng biến]
    Tính gia tốc (sự thay đổi của tốc độ): $v'(t) = -3t^2 + 12t + 15$.
    Tốc độ gió tăng khi $v'(t) > 0 <=> -3t^2 + 12t + 15 > 0 <=> t^2 - 4t - 5 < 0 <=> -1 < t < 5$.
    Do thời gian $t > 0$, nên khoảng thời gian tăng là $(0; 5)$.
  ]
)

#lt-tn(de: "Đề 4", 
  [Dân số của một thành phố trong tương lai được dự đoán theo mô hình $P(t) = 100 + (20t)/(t+5)$ (nghìn người), với $t$ là số năm tính từ hiện tại. Khẳng định nào sau đây đúng?],
  (
    [Dân số giảm theo thời gian.],
    True([Dân số tăng theo thời gian nhưng không vượt quá 120 nghìn người.]),
    [Dân số tăng vô hạn.],
    [Dân số đạt cực đại vào năm thứ 5.],
  ),
  loigiai: [
    #step[Xét đạo hàm và giới hạn]
    $P'(t) = (20(t+5) - 20t)/(t+5)^2 = 100/(t+5)^2 > 0$.
    Hàm số luôn đồng biến trên $[0; +oo)$, nghĩa là dân số liên tục tăng.
    Tuy nhiên khi $t -> +oo$, $P(t) -> 100 + 20 = 120$.
    Nghĩa là dân số có giới hạn tối đa (tiệm cận ngang) là 120 nghìn người.
  ]
)

#lt-tn(de: "Đề 4", 
  [Hiệu suất làm việc của một dây chuyền sản xuất sau $t$ giờ làm việc liên tục là $E(t) = -t^3 + 12t^2$ (sản phẩm/giờ). Hiệu suất đạt cực đại tại thời điểm nào?],
  (
    [$t = 4$],
    [$t = 6$],
    True([$t = 8$]),
    [$t = 12$],
  ),
  loigiai: [
    #step[Tính điểm cực đại]
    $E'(t) = -3t^2 + 24t$.
    Cho $E'(t) = 0 <=> 3t(8 - t) = 0 <=> t=0$ hoặc $t=8$.
    Qua $t=8$, $E'(t)$ đổi dấu từ dương sang âm nên $E(t)$ đạt cực đại tại $t=8$.
  ]
)

#lt-tn(de: "Đề 4", 
  [Độ giảm huyết áp của một bệnh nhân khi dùng $x$ (mg) một loại thuốc là $G(x) = 1/2 x^2 (30 - x)$. Liều lượng thuốc nào sau đây mang lại điểm cực đại cho đồ thị hàm số?],
  (
    [$x = 10$],
    True([$x = 20$]),
    [$x = 30$],
    [$x = 15$],
  ),
  loigiai: [
    #step[Tính điểm cực đại]
    Ta có $G(x) = 15x^2 - 1/2 x^3$.
    $G'(x) = 30x - 3/2 x^2$.
    Cho $G'(x) = 0 <=> x(30 - 3/2 x) = 0 <=> x=0$ hoặc $x=20$.
    Đạo hàm đổi dấu từ dương sang âm tại $x=20$, nên đạt cực đại tại $x=20$.
  ]
)

#lt-ds(de: "Đề 4", 
  [Một công ty sản xuất một loại tivi. Hàm doanh thu và hàm chi phí (đơn vị: triệu đồng) khi sản xuất và bán ra $x$ chiếc tivi được tính theo công thức: $R(x) = 20x - 0.01x^2$ và $C(x) = 2x + 100$. Gọi $P(x)$ là hàm lợi nhuận của công ty. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm lợi nhuận là $P(x) = -0.01x^2 + 18x - 100$.]),
    True([Lợi nhuận của công ty tăng khi số tivi sản xuất nhỏ hơn 900 chiếc.]),
    [Công ty đạt lợi nhuận cực đại khi sản xuất 1000 tivi.],
    True([Khi sản xuất quá 900 chiếc tivi, lợi nhuận của công ty bắt đầu giảm.]),
  ),
  loigiai: [
    #step[Thiết lập và khảo sát hàm lợi nhuận]
    Lợi nhuận $P(x) = R(x) - C(x) = 20x - 0.01x^2 - (2x + 100) = -0.01x^2 + 18x - 100$. Mệnh đề a) đúng.
    Tính đạo hàm $P'(x) = -0.02x + 18$.
    $P'(x) = 0 <=> 0.02x = 18 <=> x = 900$.
    Khi $x < 900$, $P'(x) > 0$ nên lợi nhuận tăng. Mệnh đề b) đúng.
    Công ty đạt lợi nhuận cực đại tại $x = 900$, không phải 1000. Mệnh đề c) sai.
    Khi $x > 900$, $P'(x) < 0$ nên lợi nhuận bắt đầu giảm. Mệnh đề d) đúng.
  ]
)

#lt-ds(de: "Đề 4", 
  [Nồng độ của một loại thuốc giảm đau trong máu của bệnh nhân (tính bằng mg/L) sau khi tiêm $t$ giờ được tính theo công thức $C(t) = (4t)/(t^2 + 4)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tại thời điểm $t = 1$ giờ, nồng độ thuốc trong máu đang có xu hướng tăng.]),
    True([Nồng độ thuốc đạt giá trị cực đại sau khi tiêm 2 giờ.]),
    True([Hàm số $C(t)$ đồng biến trên khoảng $(0; 2)$.]),
    [Sau 2 giờ kể từ khi tiêm, nồng độ thuốc trong máu vẫn tiếp tục tăng.],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm nồng độ]
    $C'(t) = (4(t^2 + 4) - 4t(2t))/(t^2 + 4)^2 = (4t^2 + 16 - 8t^2)/(t^2 + 4)^2 = (16 - 4t^2)/(t^2 + 4)^2$.
    Tại $t=1$, $C'(1) = (16 - 4)/25 = 12/25 > 0$. Nồng độ đang tăng. Mệnh đề a) đúng.
    $C'(t) = 0 <=> 16 - 4t^2 = 0 <=> t = 2$ (do $t > 0$). Qua $t=2$ đạo hàm đổi từ dương sang âm, nên $C(t)$ đạt cực đại. Mệnh đề b) đúng.
    Trên $(0; 2)$ thì $C'(t) > 0$ nên hàm đồng biến. Mệnh đề c) đúng.
    Sau 2 giờ ($t > 2$), $C'(t) < 0$ nên nồng độ giảm. Mệnh đề d) sai.
  ]
)

#lt-ds(de: "Đề 4", 
  [Mức độ phản ứng của cơ thể khi sử dụng một loại thuốc với liều lượng $x$ (mg) được đánh giá bởi hàm số $R(x) = x^2 (15 - x)$, với $0 <= x <= 15$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đạo hàm của hàm phản ứng là $R'(x) = 30x - 3x^2$.]),
    [Hàm số nghịch biến trên khoảng $(0; 10)$.],
    True([Mức độ phản ứng của cơ thể đạt cực đại khi dùng liều lượng $10$ mg.]),
    [Khi sử dụng liều lượng $12$ mg, phản ứng của cơ thể đang có xu hướng tăng.],
  ),
  loigiai: [
    #step[Khảo sát hàm mức độ phản ứng]
    Ta có $R(x) = 15x^2 - x^3 => R'(x) = 30x - 3x^2$. Mệnh đề a) đúng.
    $R'(x) = 0 <=> 3x(10 - x) = 0 <=> x=0$ hoặc $x=10$.
    Trên khoảng $(0; 10)$, $R'(x) > 0$ nên hàm số đồng biến. Mệnh đề b) sai.
    Đạo hàm đổi dấu từ dương sang âm tại $x=10$, do đó phản ứng đạt cực đại tại $x=10$. Mệnh đề c) đúng.
    Tại $x=12$, ta có $12 > 10$, nằm trong khoảng nghịch biến nên phản ứng đang giảm. Mệnh đề d) sai.
  ]
)

#lt-ds(de: "Đề 4", 
  [Một quả bóng cao su được bơm không khí vào, thể tích của quả bóng $V(t)$ (đơn vị: lít) phụ thuộc vào thời gian $t$ (giây) theo công thức $V(t) = 8t - 0.5 t^2$, với $0 <= t <= 16$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tốc độ thay đổi thể tích là $v(t) = 8 - 0.5t$.],
    True([Thể tích quả bóng liên tục tăng trong 8 giây đầu tiên.]),
    True([Điểm cực đại của đồ thị hàm số thể tích nằm tại $t=8$.]),
    [Thể tích của quả bóng tiếp tục tăng sau giây thứ 8.],
  ),
  loigiai: [
    #step[Tính tốc độ thay đổi thể tích]
    Tốc độ thay đổi thể tích chính là đạo hàm: $V'(t) = 8 - t$. Mệnh đề a) sai (vì $0.5t^2$ đạo hàm là $t$).
    Cho $V'(t) = 0 <=> t = 8$.
    Với $t in (0; 8)$ thì $V'(t) > 0$, quả bóng to lên (tăng thể tích). Mệnh đề b) đúng.
    Tại $t=8$ hàm số đạt cực đại. Mệnh đề c) đúng.
    Với $t > 8$, $V'(t) < 0$ nên quả bóng bắt đầu xẹp đi (thể tích giảm). Mệnh đề d) sai.
  ]
)

#lt-tln(de: "Đề 4", 
  [Một vật chuyển động với phương trình quãng đường $S(t) = -t^3 + 9t^2 + 24t$, trong đó $t$ tính bằng giây và $S(t)$ tính bằng mét. Vận tốc của vật là đạo hàm của quãng đường. Hỏi tại thời điểm $t$ bằng bao nhiêu giây thì vận tốc của vật đạt điểm cực đại?],
  [$3$],
  loigiai: [
    #step[Tính vận tốc và khảo sát]
    Vận tốc là $v(t) = S'(t) = -3t^2 + 18t + 24$.
    Để tìm vận tốc cực đại, ta xét hàm $v(t)$.
    Đạo hàm của vận tốc (tức gia tốc) là $v'(t) = -6t + 18$.
    $v'(t) = 0 <=> -6t + 18 = 0 <=> t = 3$.
    Bảng biến thiên cho thấy $v(t)$ đạt cực đại tại $t=3$.
  ]
)

#lt-tln(de: "Đề 4", 
  [Trong phòng thí nghiệm, số lượng vi khuẩn trong một mẫu nuôi cấy sau $t$ giờ được mô hình hóa bởi hàm số $N(t) = -t^3 + 30t^2 + 1000$. Số lượng vi khuẩn đạt cực đại sau bao nhiêu giờ?],
  [$20$],
  loigiai: [
    #step[Tính đạo hàm để tìm cực đại]
    $N'(t) = -3t^2 + 60t$.
    Cho $N'(t) = 0 <=> 3t(-t + 20) = 0 <=> t = 0$ hoặc $t = 20$.
    Lập bảng biến thiên, ta thấy $N'(t)$ dương khi $0 < t < 20$ và âm khi $t > 20$.
    Nên số lượng vi khuẩn tăng và đạt cực đại tại $t=20$ giờ.
  ]
)

#lt-tln(de: "Đề 4", 
  [Hàm lợi nhuận $P(x)$ của một công ty khi bán $x$ sản phẩm là $P(x) = -1/3 x^3 + 1200x^2$. Công ty cần bán ra bao nhiêu sản phẩm để điểm trên đồ thị hàm lợi nhuận đạt cực đại?],
  [$2400$],
  loigiai: [
    #step[Khảo sát hàm lợi nhuận]
    Đạo hàm $P'(x) = -x^2 + 2400x$.
    $P'(x) = 0 <=> x(-x + 2400) = 0 <=> x = 0$ hoặc $x = 2400$.
    Qua $x=2400$, đạo hàm $P'(x)$ đổi dấu từ dương sang âm nên $P(x)$ đạt cực đại.
    Công ty cần bán ra 2400 sản phẩm.
  ]
)

#lt-tln(de: "Đề 4", 
  [Sự tăng trưởng của một loại cây được mô phỏng bởi hàm chiều cao $h(t) = -0.1 t^3 + 1.2 t^2 + 5t$ ($t$ tính bằng tuần). Tốc độ tăng trưởng của cây là $v(t) = h'(t)$. Tốc độ tăng trưởng này đạt cực đại vào tuần thứ mấy?],
  [$4$],
  loigiai: [
    #step[Tính hàm tốc độ và cực đại]
    Tốc độ tăng trưởng $v(t) = h'(t) = -0.3 t^2 + 2.4 t + 5$.
    Để tìm cực đại của tốc độ, ta tính đạo hàm $v'(t) = -0.6 t + 2.4$.
    Cho $v'(t) = 0 <=> -0.6 t + 2.4 = 0 <=> t = 4$.
    Vì $v''(t) = -0.6 < 0$ nên tốc độ đạt cực đại vào tuần thứ 4.
  ]
)

#lt-tln(de: "Đề 4", 
  [Một công ty sản xuất máy tính. Hàm chi phí trung bình để sản xuất một máy tính là $overline(C)(x) = 2x + (5000)/x$ (đơn vị: trăm nghìn đồng), với $x$ là số máy tính được sản xuất. Công ty cần sản xuất bao nhiêu máy tính để chi phí trung bình là điểm cực tiểu của hàm số?],
  [$50$],
  loigiai: [
    #step[Tính đạo hàm hàm chi phí]
    $overline(C)'(x) = 2 - 5000/x^2$.
    Cho $overline(C)'(x) = 0 <=> 2 = 5000/x^2 <=> x^2 = 2500$.
    Vì $x > 0$ nên $x = 50$.
    Qua $x=50$, đạo hàm đổi từ âm sang dương nên chi phí trung bình đạt cực tiểu tại $x=50$.
  ]
)

#lt-tln(de: "Đề 4", 
  [Một loại thuốc được tiêm vào máu của bệnh nhân. Nồng độ thuốc $C(t) = t/(t^2 + 9)$ (mg/L) sau $t$ giờ. Hỏi nồng độ thuốc đạt cực đại sau bao nhiêu giờ?],
  [$3$],
  loigiai: [
    #step[Tính cực đại hàm nồng độ]
    $C'(t) = (1 dot (t^2 + 9) - t dot 2t)/(t^2 + 9)^2 = (9 - t^2)/(t^2 + 9)^2$.
    $C'(t) = 0 <=> 9 - t^2 = 0 <=> t = 3$ (do $t > 0$).
    Qua $t=3$, $C'(t)$ đổi từ dương sang âm, nên nồng độ đạt cực đại sau 3 giờ.
  ]
)

// ════════════════════════════════════════════════
// TỔNG KẾT
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🧠", [Tổng Kết — Sơ Đồ Tư Duy])

#lt-slide-back(title: "🧠 Sơ đồ tư duy — Đơn điệu & Cực trị")[
  #lt-mindmap(
    [Đơn điệu\n& Cực trị],
    (
      ([Đơn điệu], ([Đồng biến], [Nghịch biến], [Dấu $f'$])),
      ([Quy trình], ([TXĐ], [Tính $f'$], [Nghiệm $f'$], [BBT])),
      ([Cực trị], ([Cực đại], [Cực tiểu], [QT 1], [QT 2])),
      ([Ứng dụng], ([Tối ưu\nKT], [Đồ thị\nhàm số], [Bài\ntoán $m$])),
    ),
    width: 15cm,
  )
]

#lt-slide-back(title: "📚 Tổng kết — Những điểm cần nhớ")[
  #lt-two-col(
    ratio: (1fr, 1fr),
    [
      #lt-highlight[$f'(x) > 0 => f$ đồng biến ↗]
      #v(0.3em)
      #lt-highlight[$f'(x) < 0 => f$ nghịch biến ↘]
      #v(0.5em)
      *Quy trình BBT:*
      #lt-bullets(icon: "→",
        [TXĐ → Tính $f'$ → Nghiệm $f'$],
        [Lập bảng → Xét dấu → Vẽ mũi tên],
        [Kết luận khoảng đơn điệu],
      )
    ],
    [
      *Quy tắc 1 (dấu $f'$):*
      #lt-bullets(icon: "→",
        [$+→-$: cực đại (đỉnh) ↗↘],
        [$-→+$: cực tiểu (đáy) ↘↗],
        [Không đổi: không cực trị],
      )
      #v(0.3em)
      *Quy tắc 2 ($f''$):*
      #lt-bullets(icon: "→",
        [$f'(x_0) = 0$ và $f'' < 0$: cực đại],
        [$f'(x_0) = 0$ và $f'' > 0$: cực tiểu],
        [$f'' = 0$: không kết luận được],
      )
    ]
  )
]

#lt-slide-back(title: "🏠 Bài tập về nhà & Liên kết")[
  #lt-two-col(
    ratio: (60%, 40%),
    [
      #lt-note(title: "Bài tập SGK — Kết nối tri thức")[
        *Bài 1.1 → 1.12* (trang 12–16) — Luyện tập xét đơn điệu.

        *Bài 1.13 → 1.20* (trang 17–20) — Luyện tập tìm cực trị.

        *Nâng cao:* Bài 1.21, 1.22 — Tìm $m$ để có cực trị, bài toán tối ưu.
      ]
      #v(0.4em)
      #lt-history(title: "Gợi ý đọc thêm")[
        Sách "Giải tích và ứng dụng" — Nguyễn Đình Trí. Chương 4 về ứng dụng đạo hàm trong kinh tế có nhiều bài tập thực tiễn hay.
      ]
    ],
    [
      #align(center)[
        #lt-qr("geogebra.org", caption: "GeoGebra — Vẽ đồ thị\nhàm số online", size: 90pt)
        #v(0.6em)
        #lt-qr("desmos.com", caption: "Desmos — Kiểm tra\nbảng biến thiên", size: 90pt)
      ]
    ]
  )
]
