// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 04)
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

// Hình 1: Nồng độ thuốc trong máu (Pharmacokinetics)
#let fig-drug-concentration = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  content((4.3, -0.3), [$t$])
  content((-0.4, 2.8), [$C$])
  
  let pts = ()
  for i in range(41) {
    let t = i * 0.1
    let y = (4.0 * t) / (t * t + 4.0) * 2.0
    pts.push((t, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#0057b8"))
  
  // Tiếp tuyến nằm ngang tại đỉnh t = 2, y = 2.0
  line((0.8, 2.0), (3.2, 2.0), stroke: (dash: "dashed", paint: rgb("#cc2200"), thickness: 1.2pt))
  circle((2.0, 2.0), radius: 3pt, fill: rgb("#cc2200"))
})

// Hình 2: Quỹ đạo mặt anten chảo vệ tinh
#let fig-satellite-dish = canvas(length: 1cm, {
  import draw: *
  line((-2.5, 0), (2.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 2.5), stroke: 1.2pt + black)
  content((2.3, -0.3), [$x$])
  content((-0.3, 2.3), [$y$])
  
  let pts = ()
  for i in range(41) {
    let x = (i - 20) * 0.1
    let y = 0.2 * x * x
    pts.push((x, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#1a7a2e"))
})

// Hình 3: Lưu lượng máu qua động mạch Poiseuille
#let fig-artery-flow = canvas(length: 1cm, {
  import draw: *
  rect((-2.0, -1.0), (2.0, 1.0), stroke: 1.5pt + rgb("#cc2200"), fill: rgb("#cc2200").lighten(90%))
  line((-2.0, 0), (2.0, 0), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  content((0, 1.3), [Thành động mạch])
  content((0, -1.3), [Thành động mạch])
})

// Hình 4: Sự lây lan dịch bệnh (Logistic Curve)
#let fig-epidemic-spread = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  line((-0.5, 2.5), (4.5, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  content((4.3, -0.3), [$t$])
  content((-0.4, 2.8), [$N$])
  
  let pts = ()
  for i in range(41) {
    let t = i * 0.1
    let y = 2.5 / (1.0 + 9.0 * calc.exp(-1.5 * (t - 1.5)))
    pts.push((t, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#9b59b6"))
})

#show: lecture-theme.with(
  title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 04)",
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
#lt-tn(num: 1, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = x sqrt(x)$ với $x > 0$. Giá trị đạo hàm $f'(4)$ bằng bao nhiêu?],
    (
        [$2$],
        True([$3$]),
        [$4$],
        [$6$]
    ),
    loigiai: [
        - Ta có $f(x) = x sqrt(x) ==> f'(x) = (x)' sqrt(x) + x (sqrt(x))' = sqrt(x) + (x)/(2 sqrt(x)) = (3/2) sqrt(x)$.
        - Thay $x = 4 ==> f'(4) = 3/2 sqrt(4) = 3/2 dot 2 = 3$.
        Chọn đáp án B.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Nồng độ một loại thuốc trong máu của bệnh nhân sau khi tiêm $t$ giờ (như hình vẽ bên dưới) được mô hình hóa bởi $C(t) = (6t)/(t^2 + 9)$ (mg/lít). Tốc độ thay đổi nồng độ thuốc tức thời tại thời điểm $t = 1$ giờ bằng bao nhiêu mg/(lít.giờ)?],
    (
        [$0.24$],
        True([$0.48$]),
        [$0.50$],
        [$0.60$]
    ),
    fig: fig-drug-concentration,
    fig-width: 28%,
    loigiai: [
        - Đạo hàm hàm thương: $C'(t) = (6(t^2+9) - 6t(2t))/((t^2+9)^2) = (54 - 6t^2)/((t^2+9)^2)$.
        - Tại $t = 1 ==> C'(1) = (54 - 6)/((1+9)^2) = 48/100 = 0.48$ mg/(lít.giờ).
        Chọn đáp án B.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Hệ số góc của tiếp tuyến của đồ thị hàm số lượng giác $y = sin x$ tại điểm có hoành độ $x_0 = pi/3$ bằng bao nhiêu?],
    (
        [$sqrt(3)/2$],
        True([$1/2$]),
        [$-1/2$],
        [$-sqrt(3)/2$]
    ),
    loigiai: [
        - Ta có đạo hàm $y' = cos x$.
        - Hệ số góc tiếp tuyến là $k = y'(pi/3) = cos(pi/3) = 1/2$.
        Chọn đáp án B.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Số lượng người mắc bệnh truyền nhiễm trong một ổ dịch sau $t$ ngày được mô hình hóa bởi $N(t) = (1000)/(1 + 9 e^(-0.5t))$ (người) (như hình vẽ bên dưới). Tốc độ lây lan bệnh tức thời tại thời điểm ban đầu $t = 0$ bằng bao nhiêu người/ngày?],
    (
        [$25$],
        True([$45$]),
        [$50$],
        [$100$]
    ),
    fig: fig-epidemic-spread,
    fig-width: 28%,
    loigiai: [
        - Đạo hàm hàm hợp: $N'(t) = (1000 dot 4.5 e^(-0.5t))/((1 + 9 e^(-0.5t))^2) = (4500 e^(-0.5t))/((1 + 9 e^(-0.5t))^2)$.
        - Tại $t = 0 ==> N'(0) = 4500/((1+9)^2) = 4500/100 = 45$ người/ngày.
        Chọn đáp án B.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Một bánh xe quay quanh trục với phương trình góc quay $phi(t) = 3t^3 - 2t^2$ (rad), với $t >= 0$ (giây). Gia tốc góc tức thời $gamma(t) = phi''(t)$ của bánh xe tại thời điểm $t = 2$ giây bằng bao nhiêu $"rad/s"^2$?],
    (
        [$16" rad/s"^2$],
        True([$32" rad/s"^2$]),
        [$36" rad/s"^2$],
        [$40" rad/s"^2$]
    ),
    loigiai: [
        - Vận tốc góc: $omega(t) = phi'(t) = 9t^2 - 4t$.
        - Gia tốc góc: $gamma(t) = omega'(t) = phi''(t) = 18t - 4$.
        - Tại $t = 2 ==> gamma(2) = 18(2) - 4 = 32" rad/s"^2$.
        Chọn đáp án B.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = x^2 - 3x + 2$. Tiếp tuyến của đồ thị tại điểm $A(2; 0)$ cắt trục tung $O y$ tại điểm có tung độ bằng bao nhiêu?],
    (
        [$2$],
        True([$-2$]),
        [$4$],
        [$-4$]
    ),
    loigiai: [
        - Đạo hàm $y' = 2x - 3 ==> y'(2) = 1$.
        - Phương trình tiếp tuyến tại $A(2; 0)$ là $y = 1(x - 2) + 0 <==> y = x - 2$.
        - Cho $x = 0 ==> y = -2$. Tiếp tuyến cắt trục tung tại điểm có tung độ $-2$.
        Chọn đáp án B.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Theo định luật Poiseuille trong huyết động học (như hình vẽ bên dưới), vận tốc dòng máu tại điểm cách tâm động mạch khoảng $r$ (mm) là $v(r) = 0.04(1 - r^2)$ (m/s). Tốc độ giảm vận tốc máu khi $r = 0.5$ mm bằng bao nhiêu m/(s.mm)?],
    (
        [$0.02$],
        True([$0.04$]),
        [$0.08$],
        [$0.10$]
    ),
    fig: fig-artery-flow,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm theo bán kính: $v'(r) = -0.08 r$.
        - Tại $r = 0.5 ==> v'(0.5) = -0.04$ m/(s.mm).
        - Vậy tốc độ giảm vận tốc dòng máu là $0.04$ m/(s.mm).
        Chọn đáp án B.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = 1/12 x^4 - 1/2 x^2 + 2x$. Nghiệm dương của phương trình đạo hàm cấp hai $f''(x) = 0$ là:],
    (
        [$x = 2$],
        True([$x = 1$]),
        [$x = 3$],
        [$x = sqrt(2)$]
    ),
    loigiai: [
        - Đạo hàm cấp một: $f'(x) = 1/3 x^3 - x + 2$.
        - Đạo hàm cấp hai: $f''(x) = x^2 - 1$.
        - Cho $f''(x) = 0 <==> x^2 - 1 = 0 <==> x = pm 1$. Nghiệm dương là $x = 1$.
        Chọn đáp án B.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Một anten chảo vệ tinh có mặt phản xạ parabol $y = 0.1 x^2$ (như hình vẽ bên dưới). Hệ số góc tiếp tuyến của mặt chảo tại điểm có hoành độ $x_0 = 5$ bằng bao nhiêu?],
    (
        [$0.5$],
        True([$1.0$]),
        [$1.5$],
        [$2.0$]
    ),
    fig: fig-satellite-dish,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm $y' = 0.2 x$.
        - Hệ số góc tiếp tuyến tại $x_0 = 5$ là $k = y'(5) = 0.2 dot 5 = 1.0$.
        Chọn đáp án B.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = 1/sqrt(x)$ với $x > 0$. Giá trị đạo hàm $y'(1)$ bằng bao nhiêu?],
    (
        [$0.5$],
        True([$-0.5$]),
        [$-1.0$],
        [$1.0$]
    ),
    loigiai: [
        - Ta có $y = x^(-1/2) ==> y' = -1/2 x^(-3/2) = (-1)/(2 x sqrt(x))$.
        - Thay $x = 1 ==> y'(1) = (-1)/(2 dot 1) = -0.5$.
        Chọn đáp án B.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = (2x + 3)/(x + 1)$. Đồ thị hàm số có hai tiếp tuyến cùng song song với đường thẳng $y = -x + 5$. Hoành độ của hai tiếp điểm tương ứng là:],
    (
        [$1$ và $2$],
        True([$0$ và $-2$]),
        [$-1$ và $3$],
        [$1$ và $-3$]
    ),
    loigiai: [
        - Ta có $y' = (-1)/((x + 1)^2)$.
        - Tiếp tuyến song song với $y = -x + 5 ==> y' = -1 <==> (-1)/((x + 1)^2) = -1 <==> (x + 1)^2 = 1 <==> x + 1 = 1$ hoặc $x + 1 = -1 <==> x = 0$ hoặc $x = -2$.
        Chọn đáp án B.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Nhiệt độ cơ thể của một bệnh nhân sau khi uống thuốc hạ sốt $t$ giờ được mô hình hóa bởi $T(t) = 39 - (2t)/(t^2 + 1)$ (°C). Tốc độ giảm nhiệt độ tức thời tại thời điểm $t = 1$ giờ bằng bao nhiêu °C/giờ?],
    (
        [$1.0$],
        True([$0.0$]),
        [$0.5$],
        [$2.0$]
    ),
    loigiai: [
        - Tốc độ biến thiên nhiệt độ $T'(t) = -(2(t^2+1) - 2t(2t))/((t^2+1)^2) = (2t^2 - 2)/((t^2+1)^2)$.
        - Tại $t = 1 ==> T'(1) = (2(1)^2 - 2)/((1+1)^2) = 0$ °C/giờ.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Trong dược động học, nồng độ của một loại thuốc trong máu sau khi tiêm vào cơ thể $t$ giờ (như đồ thị bên dưới) được cho bởi công thức $C(t) = (4t)/(t^2 + 4)$ (mg/lít), $t >= 0$. Các phát biểu sau đúng hay sai?],
    (
        True([Ban đầu khi vừa tiêm thuốc ($t = 0$), nồng độ thuốc trong máu bằng $0$.]),
        True([Tốc độ thay đổi nồng độ thuốc tức thời là $C'(t) = (16 - 4t^2)/((t^2 + 4)^2)$ (mg/lít.giờ).]),
        False([Nồng độ thuốc trong máu đạt giá trị lớn nhất tại thời điểm $t = 4$ giờ.]),
        True([Nồng độ thuốc cực đại trong máu đạt được bằng $1$ mg/lít.])
    ),
    fig: fig-drug-concentration,
    fig-width: 28%,
    loigiai: [
        - *a)* Đúng. Thay $t = 0 ==> C(0) = 0$ mg/lít.
        - *b)* Đúng. $C'(t) = (4(t^2+4) - 4t(2t))/((t^2+4)^2) = (16 - 4t^2)/((t^2+4)^2)$.
        - *c)* Sai. Cho $C'(t) = 0 <==> 16 - 4t^2 = 0 <==> t = 2$ giờ (chứ không phải 4 giờ).
        - *d)* Đúng. Nồng độ cực đại tại $t = 2$ giờ là $C(2) = 8/8 = 1$ mg/lít.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Một anten chảo thu sóng vệ tinh có mặt cắt là đường parabol $y = 0.05 x^2$ với $-10 <= x <= 10$ (như hình vẽ bên dưới). Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm $y' = 0.1 x$ cho biết hệ số góc tiếp tuyến tại điểm có hoành độ $x$ trên mặt chảo.]),
        True([Tại mép chảo phía bên phải ($x = 10$), tiếp tuyến có hệ số góc bằng $1$ và tạo với trục $O x$ một góc $45°$.]),
        False([Phương trình tiếp tuyến của chảo tại điểm $M(4; 0.8)$ là $y = 0.4x - 1.6$.]),
        True([Tiếp tuyến tại đáy chảo $O(0; 0)$ nằm ngang và có phương trình $y = 0$.])
    ),
    fig: fig-satellite-dish,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. $y' = (0.05 x^2)' = 0.1 x$.
        - *b)* Đúng. Tại $x = 10 ==> y'(10) = 1 ==> tan alpha = 1 ==> alpha = 45°$.
        - *c)* Sai. Tại $M(4; 0.8)$, hệ số góc $y'(4) = 0.4$. PTTT là $y = 0.4(x - 4) + 0.8 <==> y = 0.4x - 0.8$ (chứ không phải $-1.6$).
        - *d)* Đúng. Tại $O(0; 0) ==> y'(0) = 0 ==>$ PTTT nằm ngang $y = 0$.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Theo mô hình huyết động học Poiseuille (như hình vẽ bên dưới), vận tốc dòng máu chảy trong một động mạch bán kính $R = 0.2$ cm tại điểm cách tâm khoảng $r$ (cm) được cho bởi $v(r) = 2(0.04 - r^2)$ (cm/s). Các phát biểu sau đúng hay sai?],
    (
        True([Vận tốc dòng máu đạt giá trị lớn nhất tại tâm động mạch ($r = 0$).]),
        True([Tốc độ giảm vận tốc máu theo khoảng cách đến tâm là $|v'(r)| = 4r$ (cm/s.cm).]),
        False([Tại thành động mạch ($r = 0.2$ cm), vận tốc dòng máu bằng $0.08$ cm/s.]),
        True([Tốc độ giảm vận tốc dòng máu lớn nhất tại thành động mạch và bằng $0.8$ cm/s trên mỗi cm bán kính.])
    ),
    fig: fig-artery-flow,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. Vì $r^2 >= 0 ==> v(r) <= 2(0.04) = 0.08$ cm/s tại $r = 0$.
        - *b)* Đúng. Đạo hàm $v'(r) = -4r ==>$ Tốc độ giảm là $|v'(r)| = 4r$.
        - *c)* Sai. Tại thành động mạch $r = 0.2 ==> v(0.2) = 2(0.04 - 0.04) = 0$ cm/s (dòng máu dính vào thành mạch nên vận tốc bằng 0).
        - *d)* Đúng. $|v'(r)| = 4r$ lớn nhất tại $r = 0.2 ==> |v'(0.2)| = 4(0.2) = 0.8$ cm/s.cm.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Số ca nhiễm một chủng virus dịch bệnh sau $t$ ngày được dự báo theo mô hình Gompertz/Logistic (như đồ thị bên dưới) bởi hàm số $N(t) = (5000)/(1 + 49 e^(-0.4t))$ (người). Các phát biểu sau đúng hay sai?],
    (
        True([Tốc độ lây lan dịch bệnh tức thời là $N'(t) = (98000 e^(-0.4t))/((1 + 49 e^(-0.4t))^2)$ (người/ngày).]),
        True([Ban đầu khi mới bùng phát dịch ($t = 0$), có $100$ ca nhiễm bệnh.]),
        False([Khi thời gian $t$ rất lớn, số ca nhiễm bệnh tiến dần về $98000$ người.]),
        True([Tốc độ lây lan dịch bệnh đạt giá trị cực đại khi số ca nhiễm đạt $2500$ người.])
    ),
    fig: fig-epidemic-spread,
    fig-width: 28%,
    loigiai: [
        - *a)* Đúng. Đạo hàm $N'(t) = (5000 dot 19.6 e^(-0.4t))/((1 + 49 e^(-0.4t))^2) = (98000 e^(-0.4t))/((1 + 49 e^(-0.4t))^2)$.
        - *b)* Đúng. Thay $t = 0 ==> N(0) = 5000/50 = 100$ người.
        - *c)* Sai. Khi $t -> +oo ==> e^(-0.4t) -> 0 ==> N(t) -> 5000$ người (chứ không phải 98000).
        - *d)* Đúng. Theo tính chất đường cong Logistic, tốc độ lây lan $N'(t)$ cực đại tại điểm uốn khi $N = K/2 = 5000/2 = 2500$ người.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = x dot sin(2x)$. Tính giá trị của đạo hàm $f'(pi/4)$.],
    [1],
    loigiai: [
        - Đạo hàm tích: $f'(x) = sin(2x) + 2x cos(2x)$.
        - Thay $x = pi/4 ==> f'(pi/4) = sin(pi/2) + 2(pi/4) cos(pi/2) = 1 + (pi/2) dot 0 = 1$.
        Đáp số: $1$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Sự tăng trưởng thể tích của một khối cầu khi bán kính $R$ tăng đều với tốc độ $0.2" cm/s"$. Tính tốc độ tăng thể tích của khối cầu tại thời điểm $R = 5$ cm (tính bằng $"cm"^3"/s"$, lấy $pi approx 3.1416$, làm tròn đến hai chữ số thập phân).],
    [62.83],
    loigiai: [
        - Thể tích khối cầu $V = 4/3 pi R^3 ==> (d V)/(d t) = 4 pi R^2 (d R)/(d t)$.
        - Thay $R = 5$ và $(d R)/(d t) = 0.2 ==> (d V)/(d t) = 4 pi (5^2) dot 0.2 = 20 pi approx 62.83" cm"^3"/s"$.
        Đáp số: $62.83$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = (x^2 + 3)/(x + 1)$. Hệ số góc của tiếp tuyến của đồ thị tại điểm có hoành độ $x_0 = 1$ bằng bao nhiêu?],
    [0],
    loigiai: [
        - Đạo hàm $y' = (2x(x+1) - 1(x^2+3))/((x+1)^2) = (x^2 + 2x - 3)/((x+1)^2)$.
        - Thay $x_0 = 1 ==> y'(1) = (1^2 + 2(1) - 3)/((1+1)^2) = 0$.
        Đáp số: $0$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Chuyển động của một con lắc lò xo có phương trình li độ $x(t) = 4 cos(5 pi t - pi/3)$ (cm), với $t >= 0$ (giây). Tính gia tốc tức thời của con lắc tại thời điểm $t = 0.2$ giây (tính bằng $"cm/s"^2$, lấy $pi^2 approx 10$).],
    [500],
    loigiai: [
        - Gia tốc tức thời $a(t) = x''(t) = -25 pi^2 x(t) approx -250 x(t)$.
        - Tại $t = 0.2 ==> 5 pi(0.2) - pi/3 = pi - pi/3 = (2pi)/3$.
        - Li độ $x(0.2) = 4 cos((2pi)/3) = 4(-0.5) = -2$ cm.
        - Gia tốc $a(0.2) = -250 dot (-2) = 500" cm/s"^2$.
        Đáp số: $500$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho parabol $(P): y = x^2 + 1$. Hai tiếp tuyến của parabol đi qua gốc tọa độ $O(0; 0)$ tiếp xúc với parabol tại hai điểm $M_1, M_2$. Tính độ dài đoạn thẳng $M_1 M_2$.],
    [2],
    loigiai: [
        - Đường thẳng qua $O(0; 0)$ có dạng $y = k x$.
        - Điều kiện tiếp xúc: $x^2 + 1 = k x$ và $2x = k ==> x^2 + 1 = 2x^2 <==> x^2 = 1 <==> x = pm 1$.
        - Hai tiếp điểm là $M_1(1; 2)$ và $M_2(-1; 2)$.
        - Độ dài đoạn thẳng $M_1 M_2 = sqrt((1 - (-1))^2 + (2 - 2)^2) = 2$.
        Đáp số: $2$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = -x^3 + 3x$. Tiếp tuyến của đồ thị tại điểm cực đại $C(1; 2)$ cắt đồ thị tại điểm thứ hai $D(x_D; y_D)$. Tính giá trị của tổng $x_D + y_D$.],
    [0],
    loigiai: [
        - Tại cực đại $C(1; 2)$, hệ số góc $y'(1) = -3(1)^2 + 3 = 0 ==>$ PTTT nằm ngang $y = 2$.
        - Hoành độ giao điểm $D$ là nghiệm của: $-x^3 + 3x = 2 <==> x^3 - 3x + 2 = 0 <==> (x - 1)^2 (x + 2) = 0 <==> x = 1$ (tiếp điểm) hoặc $x_D = -2$.
        - Tung độ $y_D = 2 ==>$ Tổng $x_D + y_D = -2 + 2 = 0$.
        Đáp số: $0$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 04)!]      #v(0.6em)
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
