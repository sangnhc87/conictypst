// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 05)
// Lớp: Khối 11  ·  Mã đề: 101  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")

#show math.frac: math.display


// HÌNH VẼ MINH HỌA (CETZ)

// Hình 1: Quỹ đạo máy bay hạ cánh đường băng
#let fig-airplane-landing = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.5pt + black)
  line((0, -0.5), (0, 2.5), stroke: 1.2pt + black)
  content((4.3, -0.3), [$x$])
  content((-0.4, 2.3), [$y$])
  
  let pts = ()
  for i in range(41) {
    let t = i * 0.1
    // Đường cong bậc ba hạ cánh
    let x = t
    let norm = t / 4.0
    let y = 2.0 * (1.0 - 3.0 * norm * norm + 2.0 * norm * norm * norm)
    pts.push((x, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#0057b8"))
})

// Hình 2: Vết dầu loang hình tròn trên mặt biển
#let fig-oil-spill = canvas(length: 1cm, {
  import draw: *
  circle((0, 0), radius: 1.5, stroke: 1.5pt + rgb("#e67e22"), fill: rgb("#e67e22").lighten(80%))
  circle((0, 0), radius: 0.8, stroke: (dash: "dashed", paint: rgb("#e67e22"), thickness: 1pt))
  line((0, 0), (1.5, 0), stroke: 1.2pt + black)
  content((0.75, 0.2), [$r(t)$])
  circle((0, 0), radius: 3pt, fill: black)
})

// Hình 3: Tấm pin năng lượng mặt trời xoay
#let fig-solar-panel = canvas(length: 1cm, {
  import draw: *
  line((-1.5, 0), (1.5, 0), stroke: 1.5pt + black)
  line((0, 0), (0, 1.2), stroke: 2pt + gray)
  
  // Tấm pin nghiêng 30 deg
  line((-1.2, 1.8), (1.2, 0.6), stroke: 2.5pt + rgb("#0057b8"))
  circle((0, 1.2), radius: 4pt, fill: rgb("#e67e22"))
})

// Hình 4: Kiến trúc vòm cầu parabol
#let fig-arch-bridge = canvas(length: 1cm, {
  import draw: *
  line((-2.5, 0), (2.5, 0), stroke: 1.5pt + rgb("#0057b8"))
  content((2.3, -0.3), [Mặt nước])
  
  let pts = ()
  for i in range(41) {
    let x = (i - 20) * 0.1
    let y = 2.0 - 0.08 * x * x
    pts.push((x, y))
  }
  line(..pts, stroke: 2pt + rgb("#cc2200"))
})

#show: lecture-theme.with(
  title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 05)",
  subtitle: "ÔN TẬP CHƯƠNG ĐẠO HÀM — MÃ ĐỀ: 101",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 101]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#lt-tn(num: 1, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Tính đạo hàm của hàm số lượng giác $y = cot(3x)$ (với $x neq k pi/3$).],
    (
        [$y' = (3)/(sin^2(3x))$],
        True([$y' = (-3)/(sin^2(3x))$]),
        [$y' = (-1)/(sin^2(3x))$],
        [$y' = (-3)/(cos^2(3x))$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm hợp $(cot u)' = - (u')/(sin^2 u)$:
        $ y' = - ((3x)')/(sin^2(3x)) = (-3)/(sin^2(3x)) $.
        Chọn đáp án B.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Quỹ đạo hạ cánh của một máy bay tiếp cận đường băng (như hình vẽ bên dưới) được mô tả bởi $h(x) = 0.001 x^3 - 0.03 x^2 + 100$ (mét), với $x$ là khoảng cách ngang (mét). Tốc độ giảm độ cao theo khoảng cách $h'(x)$ tại $x = 10$ m bằng bao nhiêu m/m?],
    (
        [$-0.15$],
        True([$-0.30$]),
        [$-0.45$],
        [$-0.60$]
    ),
    fig: fig-airplane-landing,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm $h'(x) = 0.003 x^2 - 0.06 x$.
        - Thay $x = 10 ==> h'(10) = 0.003(100) - 0.06(10) = 0.3 - 0.6 = -0.30$ m/m.
        Chọn đáp án B.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Một sự cố tràn dầu tạo thành một vết dầu loang hình tròn trên mặt biển (như hình vẽ bên dưới). Bán kính vết dầu tăng theo thời gian $t$ (phút) là $r(t) = 2t + 1$ (mét). Tốc độ tăng diện tích vết dầu tại thời điểm $t = 2$ phút bằng bao nhiêu $"m"^2"/phút"$ (lấy $pi approx 3.14$)?],
    (
        [$31.4$],
        True([$62.8$]),
        [$125.6$],
        [$40.0$]
    ),
    fig: fig-oil-spill,
    fig-width: 20%,
    loigiai: [
        - Diện tích vết dầu $S(t) = pi r(t)^2 = pi (2t+1)^2$.
        - Đạo hàm theo thời gian $S'(t) = 4 pi (2t+1)$.
        - Thay $t = 2 ==> S'(2) = 4 pi (5) = 20 pi approx 62.8$ $"m"^2"/phút"$.
        Chọn đáp án B.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Công suất phát điện của một tấm pin năng lượng mặt trời (như hình vẽ bên dưới) thay đổi theo thời gian $t$ (giờ) trong ngày theo công thức $P(t) = 100 sin((pi t)/(12))$ (kW), với $0 <= t <= 12$. Tốc độ thay đổi công suất tại thời điểm $t = 4$ giờ bằng bao nhiêu kW/giờ (làm tròn đến 2 chữ số thập phân)?],
    (
        [$8.66$],
        True([$13.09$]),
        [$15.20$],
        [$26.18$]
    ),
    fig: fig-solar-panel,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm $P'(t) = 100 dot (pi)/(12) cos((pi t)/(12)) = (25 pi)/(3) cos((pi t)/(12))$.
        - Thay $t = 4 ==> P'(4) = (25 pi)/(3) cos((pi)/(3)) = (25 pi)/(6) approx 13.09$ kW/giờ.
        Chọn đáp án B.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Tiếp tuyến của đồ thị hàm số $y = (x + 1)/(x - 2)$ vuông góc với đường thẳng $d: y = 3x - 1$ có hệ số góc $k$ bằng:],
    (
        [$k = 3$],
        True([$k = -1/3$]),
        [$k = 1/3$],
        [$k = -3$]
    ),
    loigiai: [
        Vì tiếp tuyến vuông góc với $d$ có hệ số góc $k_d = 3$ nên hệ số góc của tiếp tuyến là $k = -1/3$.
        Chọn đáp án B.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho một vật chuyển động theo phương trình $s(t) = t^4 - 4t^3 + 10$ (m), với $t > 0$ (giây). Gia tốc tức thời của vật bằng $0" m/s"^2$ tại thời điểm $t$ bằng bao nhiêu giây?],
    (
        [$1" s"$],
        True([$2" s"$]),
        [$3" s"$],
        [$4" s"$]
    ),
    loigiai: [
        - Vận tốc tức thời $v(t) = s'(t) = 4t^3 - 12t^2$.
        - Gia tốc tức thời $a(t) = v'(t) = 12t^2 - 24t$.
        - Cho $a(t) = 0 <==> 12t(t - 2) = 0 <==> t = 2" s"$ (vì $t > 0$).
        Chọn đáp án B.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Một chiếc cầu vòm có mặt cắt dạng đường parabol $y = -0.05 x^2 + 5$ (mét) (như hình vẽ bên dưới). Hệ số góc của tiếp tuyến tại chân cầu phía bên phải ($x = 10$) bằng bao nhiêu?],
    (
        [$k = 0.5$],
        True([$k = -1.0$]),
        [$k = 1.0$],
        [$k = -0.5$]
    ),
    fig: fig-arch-bridge,
    fig-width: 30%,
    loigiai: [
        - Đạo hàm $y' = -0.1 x$.
        - Tại chân cầu $x = 10 ==> k = y'(10) = -0.1 dot 10 = -1.0$.
        Chọn đáp án B.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = sqrt(x^2 - 4x + 5)$. Giá trị đạo hàm $y'(2)$ bằng bao nhiêu?],
    (
        [$1$],
        True([$0$]),
        [$-1$],
        [$2$]
    ),
    loigiai: [
        - Đạo hàm $y' = (2x - 4)/(2 sqrt(x^2 - 4x + 5)) = (x - 2)/(sqrt(x^2 - 4x + 5))$.
        - Thay $x = 2 ==> y'(2) = 0/1 = 0$.
        Chọn đáp án B.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = x^3 - 3x^2 + 5$. Tập nghiệm của bất phương trình $f'(x) > 0$ là:],
    (
        [$(0; 2)$],
        True([$(-oo; 0) union (2; +oo)$]),
        [$(-oo; 0)$],
        [$(2; +oo)$]
    ),
    loigiai: [
        - Đạo hàm $f'(x) = 3x^2 - 6x$.
        - $f'(x) > 0 <==> 3x^2 - 6x > 0 <==> x < 0$ hoặc $x > 2$.
        Chọn đáp án B.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Phương trình tiếp tuyến của đồ thị hàm số $y = x^3 - 3x^2 + 2x$ tại gốc tọa độ $O(0; 0)$ là:],
    (
        [$y = x$],
        True([$y = 2x$]),
        [$y = -2x$],
        [$y = 3x$]
    ),
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 6x + 2 ==> y'(0) = 2$.
        - PTTT tại $O(0; 0)$ là $y = 2(x - 0) + 0 <==> y = 2x$.
        Chọn đáp án B.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Số lượng dân số tại một đô thị sau $t$ năm được mô hình hóa bởi $P(t) = 200 + (50t)/(t + 2)$ (nghìn người). Tốc độ tăng dân số tại thời điểm $t = 3$ năm là bao nhiêu nghìn người/năm?],
    (
        [$2$],
        True([$4$]),
        [$5$],
        [$10$]
    ),
    loigiai: [
        - Đạo hàm $P'(t) = (50(t+2) - 50t)/((t+2)^2) = (100)/((t+2)^2)$.
        - Thay $t = 3 ==> P'(3) = 100/(3+2)^2 = 100/25 = 4$ nghìn người/năm.
        Chọn đáp án B.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = (x^2 + 1)^3$. Giá trị đạo hàm $f'(1)$ bằng bao nhiêu?],
    (
        [$12$],
        True([$24$]),
        [$36$],
        [$48$]
    ),
    loigiai: [
        - Áp dụng công thức đạo hàm hàm hợp $(u^3)' = 3 u^2 u'$:
          $ f'(x) = 3(x^2 + 1)^2 dot 2x = 6x(x^2 + 1)^2 $.
        - Thay $x = 1 ==> f'(1) = 6(1)(1^2 + 1)^2 = 6 dot 4 = 24$.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#lt-ds(num: 13, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Quỹ đạo hạ cánh của một máy bay tiếp cận đường băng (như hình vẽ bên dưới) trong khoảng khoảng cách $0 <= x <= 100$ (mét) được mô tả bởi hàm số $y = 0.0001 x^3 - 0.015 x^2 + 100$ (mét). Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm $y' = 0.0003 x^2 - 0.03 x$ biểu thị độ nghiêng quỹ đạo bay tại vị trí có hoành độ $x$.]),
        True([Tại vị trí bắt đầu hạ cánh ($x = 0$), độ nghiêng quỹ đạo bay bằng $0$ (máy bay di chuyển ngang).]),
        False([Tại vị trí $x = 50$ m, độ nghiêng quỹ đạo đạt giá trị bằng $-1.5$.]),
        True([Khi máy bay tiếp đất tại đường băng ($x = 100$ m), độ nghiêng quỹ đạo bay bằng $0$ (tiếp đất êm ái).])
    ),
    fig: fig-airplane-landing,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. $y' = (0.0001 x^3 - 0.015 x^2 + 100)' = 0.0003 x^2 - 0.03 x$.
        - *b)* Đúng. Thay $x = 0 ==> y'(0) = 0$.
        - *c)* Sai. Thay $x = 50 ==> y'(50) = 0.0003(2500) - 0.03(50) = 0.75 - 1.5 = -0.75$ (chứ không phải $-1.5$).
        - *d)* Đúng. Thay $x = 100 ==> y'(100) = 0.0003(10000) - 0.03(100) = 3 - 3 = 0$.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Một sự cố tràn dầu trên biển tạo thành vết dầu loang hình tròn (như hình vẽ bên dưới) có bán kính tăng theo thời gian $t$ (phút) là $r(t) = 3 sqrt(t)$ (mét), với $t >= 1$. Các phát biểu sau đúng hay sai?],
    (
        True([Diện tích vết dầu loang biến thiên theo thời gian là $S(t) = 9 pi t$ ($"m"^2$).]),
        True([Tốc độ tăng diện tích vết dầu tức thời là $S'(t) = 9 pi$ ($"m"^2"/phút"$) không đổi theo thời gian.]),
        False([Tốc độ tăng bán kính vết dầu tại thời điểm $t = 4$ phút bằng $3$ m/phút.]),
        True([Sau $4$ phút, diện tích vết dầu loang trên mặt biển đạt $36 pi$ $"m"^2$.])
    ),
    fig: fig-oil-spill,
    fig-width: 20%,
    loigiai: [
        - *a)* Đúng. $S(t) = pi r(t)^2 = pi (3 sqrt(t))^2 = 9 pi t$ $"m"^2$.
        - *b)* Đúng. Đạo hàm $S'(t) = 9 pi$ $"m"^2"/phút"$ (hằng số).
        - *c)* Sai. Tốc độ tăng bán kính $r'(t) = (3)/(2 sqrt(t)) ==> r'(4) = 3/4 = 0.75$ m/phút (chứ không phải 3 m/phút).
        - *d)* Đúng. Thay $t = 4 ==> S(4) = 9 pi (4) = 36 pi$ $"m"^2$.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Công suất phát điện của một tấm pin năng lượng mặt trời (như hình vẽ bên dưới) theo thời gian $t$ (giờ, $0 <= t <= 12$) trong ngày được cho bởi $P(t) = 80 sin((pi t)/(12))$ (W). Các phát biểu sau đúng hay sai?],
    (
        True([Công suất phát điện đạt giá trị cực đại bằng $80$ W vào thời điểm giữa trưa ($t = 6$ giờ).]),
        True([Tốc độ thay đổi công suất phát điện tức thời là $P'(t) = (20 pi)/(3) cos((pi t)/(12))$ (W/giờ).]),
        False([Tại thời điểm giữa trưa $t = 6$ giờ, tốc độ thay đổi công suất phát điện đạt giá trị lớn nhất.]),
        True([Tốc độ tăng công suất phát điện lớn nhất vào lúc 0 giờ sáng ($t = 0$) và bằng $(20 pi)/(3)$ W/giờ.])
    ),
    fig: fig-solar-panel,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. Vì $sin((pi t)/12) <= 1 ==> P_(max) = 80$ W khi $(pi t)/12 = pi/2 <==> t = 6$ giờ.
        - *b)* Đúng. $P'(t) = 80 dot (pi)/12 cos((pi t)/12) = (20 pi)/3 cos((pi t)/12)$ W/giờ.
        - *c)* Sai. Tại $t = 6 ==> cos(pi/2) = 0 ==> P'(6) = 0$ W/giờ (tốc độ thay đổi bằng 0 tại đỉnh).
        - *d)* Đúng. $|P'(t)|$ lớn nhất khi $cos((pi t)/12) = 1 <==> t = 0$ giờ và $P'(0) = (20 pi)/3$ W/giờ.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Một chiếc cầu vòm bằng thép có mặt cắt là đường parabol $y = 8 - 0.08 x^2$ (mét), với $-10 <= x <= 10$ (như hình vẽ bên dưới). Các phát biểu sau đúng hay sai?],
    (
        True([Chiều cao đỉnh vòm cầu so với mặt nước bằng $8$ mét.]),
        True([Khoảng cách giữa hai chân cầu trên mặt nước là $20$ mét.]),
        False([Phương trình tiếp tuyến tại chân cầu phía bên phải ($x = 10$) là $y = -1.6x + 24$.]),
        True([Hệ số góc của tiếp tuyến tại chân cầu phía bên phải bằng $-1.6$.])
    ),
    fig: fig-arch-bridge,
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Chiều cao đỉnh vòm tại $x = 0 ==> y(0) = 8$ m.
        - *b)* Đúng. Hai chân cầu trên mặt nước $y = 0 <==> 8 - 0.08 x^2 = 0 <==> x^2 = 100 <==> x = pm 10 ==>$ Khoảng cách là 20 m.
        - *c)* Sai. Đạo hàm $y' = -0.16 x ==> y'(10) = -1.6$. Tung độ chân cầu $y(10) = 0$. PTTT là $y = -1.6(x - 10) <==> y = -1.6x + 16$ (chứ không phải 24).
        - *d)* Đúng. Hệ số góc tiếp tuyến tại $x = 10$ là $k = y'(10) = -1.6$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = (3x - 2)/(2x + 1)$. Tính giá trị của đạo hàm $f'(0)$.],
    [7],
    loigiai: [
        - Đạo hàm $f'(x) = (3(1) - (-2)(2))/((2x + 1)^2) = (7)/((2x + 1)^2)$.
        - Thay $x = 0 ==> f'(0) = (7)/(1^2) = 7$.
        Đáp số: $7$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Thể tích của một khối khí nở ra theo nhiệt độ $T$ (°C) là $V(T) = 200 + 0.8 T + 0.002 T^2$ ($"cm"^3$). Tính tốc độ nở giãn thể tích tức thời tại nhiệt độ $T = 50°$C (tính bằng $"cm"^3"/°C"$).],
    [1],
    loigiai: [
        - Tốc độ nở giãn tức thời là đạo hàm $V'(T) = 0.8 + 0.004 T$.
        - Tại $T = 50 ==> V'(50) = 0.8 + 0.004(50) = 0.8 + 0.2 = 1.0" cm"^3"/"°"C"$.
        Đáp số: $1$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = x^3 - 3x + 4$. Đồ thị có hai tiếp tuyến cùng song song với đường thẳng $y = 9x - 1$. Tính tổng hoành độ $x_1 + x_2$ của hai tiếp điểm tương ứng.],
    [0],
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 3$.
        - Tiếp tuyến song song với $y = 9x - 1 ==> 3x^2 - 3 = 9 <==> 3x^2 = 12 <==> x^2 = 4 <==> x_1 = 2, x_2 = -2$.
        - Tổng hoành độ hai tiếp điểm: $x_1 + x_2 = 2 + (-2) = 0$.
        Đáp số: $0$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Chuyển động của một vật theo phương trình $s(t) = t^3 - 3t^2 - 9t + 2$ (mét), với $t >= 0$ (giây). Tính gia tốc của vật tại thời điểm vận tốc tức thời của vật bằng $0" m/s"$ (tính bằng $"m/s"^2$).],
    [12],
    loigiai: [
        - Vận tốc tức thời: $v(t) = s'(t) = 3t^2 - 6t - 9$.
        - Vận tốc bằng $0 <==> 3t^2 - 6t - 9 = 0 <==> t^2 - 2t - 3 = 0 <==> t = 3" s"$ (vì $t >= 0$).
        - Gia tốc tức thời: $a(t) = v'(t) = 6t - 6$.
        - Tại $t = 3 ==> a(3) = 6(3) - 6 = 12" m/s"^2$.
        Đáp số: $12$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho parabol $(P): y = 0.5 x^2$. Tiếp tuyến của parabol tại điểm có hoành độ $x_0 = 2$ cắt đường thẳng $d: y = -x + 7$ tại điểm $I(x_I; y_I)$. Tính giá trị của tích $x_I dot y_I$.],
    [12],
    loigiai: [
        - Đạo hàm $y' = x ==> y'(2) = 2$.
        - Tung độ tiếp điểm $y(2) = 2 ==>$ PTTT là $y = 2(x - 2) + 2 <==> y = 2x - 2$.
        - Hoành độ giao điểm $I$ là nghiệm của: $2x - 2 = -x + 7 <==> 3x = 9 <==> x_I = 3$.
        - Tung độ giao điểm $y_I = 2(3) - 2 = 4$.
        - Tích $x_I dot y_I = 3 dot 4 = 12$.
        Đáp số: $12$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 2 (de05) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = x^3 - 3x^2 + 2$. Tiếp tuyến của đồ thị tại điểm có hoành độ $x_0 = 2$ cắt đồ thị tại điểm thứ hai $E(x_E; y_E)$. Tính giá trị của tổng $x_E + y_E$.],
    [-3],
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 6x ==> y'(2) = 0$. Tung độ tiếp điểm $y(2) = -2 ==>$ PTTT nằm ngang $y = -2$.
        - Phương trình hoành độ giao điểm: $x^3 - 3x^2 + 2 = -2 <==> x^3 - 3x^2 + 4 = 0 <==> (x - 2)^2 (x + 1) = 0 <==> x = 2$ (tiếp điểm) hoặc $x_E = -1$.
        - Tung độ $y_E = -2 ==>$ Tổng $x_E + y_E = -1 + (-2) = -3$.
        Đáp số: $-3$.
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 05)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
