// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 07)
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

// Hình 1: Phân hủy hóa học N2O5
#let fig-chemical-decomposition = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  content((4.3, -0.3), [$t$])
  content((-0.4, 2.8), [$C$])
  
  let pts = ()
  for i in range(41) {
    let t = i * 0.1
    let y = 2.5 * calc.exp(-0.8 * t)
    pts.push((t, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#0057b8"))
})

// Hình 2: Cánh tay robot 2 khớp quay
#let fig-robot-arm = canvas(length: 1cm, {
  import draw: *
  circle((0, 0), radius: 6pt, fill: black)
  line((0, 0), (1.5, 1.2), stroke: 2.5pt + rgb("#1a7a2e"))
  circle((1.5, 1.2), radius: 5pt, fill: rgb("#e67e22"))
  line((1.5, 1.2), (3.2, 0.8), stroke: 2.5pt + rgb("#0057b8"))
  circle((3.2, 0.8), radius: 4pt, fill: rgb("#cc2200"))
  content((3.5, 0.8), [Đầu robot])
})

// Hình 3: Gương thiên văn hyperbol
#let fig-telescope-hyperbola = canvas(length: 1cm, {
  import draw: *
  line((-2.5, 0), (2.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  content((2.3, -0.3), [$x$])
  content((-0.3, 2.8), [$y$])
  
  let pts = ()
  for i in range(41) {
    let x = (i - 20) * 0.1
    let y = calc.sqrt(x * x + 1.0)
    pts.push((x, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#9b59b6"))
})

#show: lecture-theme.with(
  title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 07)",
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
#lt-tn(num: 1, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Tính đạo hàm của hàm số $y = (x^2 - 3x)/(x + 2)$ tại điểm $x_0 = 0$.],
    (
        [$-0.5$],
        True([$-1.5$]),
        [$1.5$],
        [$-3.0$]
    ),
    loigiai: [
        - Đạo hàm $y' = ((2x-3)(x+2) - (x^2-3x)(1))/((x+2)^2) = (x^2 + 4x - 6)/((x+2)^2)$.
        - Thay $x_0 = 0 ==> y'(0) = - 6/4 = -1.5$.
        Chọn đáp án B.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Sự phân hủy của hợp chất $N_2 O_5$ trong một phản ứng hóa học (như hình vẽ bên dưới) có nồng độ theo thời gian $t$ (giây) là $C(t) = 0.8 e^(-0.02 t)$ (mol/lít). Tốc độ phân hủy tức thời tại thời điểm $t = 50$ giây bằng bao nhiêu mol/(lít.s) (lấy $e approx 2.718$)?],
    (
        [$0.0160$],
        True([$0.0059$]),
        [$0.0080$],
        [$0.0120$]
    ),
    fig: fig-chemical-decomposition,
    fig-width: 25%,
    loigiai: [
        - Tốc độ biến thiên nồng độ $C'(t) = 0.8 dot (-0.02) e^(-0.02 t) = -0.016 e^(-0.02 t)$.
        - Tại $t = 50 ==> |C'(50)| = 0.016 e^(-1) = 0.016/e approx 0.016/2.718 approx 0.0059$ mol/(lít.s).
        Chọn đáp án B.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Trong robot học, tọa độ ngang của đầu một cánh tay robot 2 khớp quay (như hình vẽ bên dưới) phụ thuộc vào góc quay $theta$ (rad) theo công thức $x(theta) = 40 cos theta + 30 cos(2theta)$ (cm). Vận tốc ngang tức thời theo góc quay $x'(theta)$ tại $theta = pi/2$ rad bằng bao nhiêu cm/rad?],
    (
        [$-30$],
        True([$-40$]),
        [$-50$],
        [$40$]
    ),
    fig: fig-robot-arm,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm theo góc quay: $x'(theta) = -40 sin theta - 60 sin(2theta)$.
        - Tại $theta = pi/2 ==> x'(pi/2) = -40 sin(pi/2) - 60 sin(pi) = -40 dot 1 - 0 = -40$ cm/rad.
        Chọn đáp án B.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Chiều dài của một thanh kim loại tăng theo nhiệt độ $T$ (°C) do sự giãn nở nhiệt theo công thức $L(T) = 2.0(1 + 1.2 dot 10^(-5) T + 0.5 dot 10^(-7) T^2)$ (mét). Tốc độ giãn nở dài tức thời $L'(T)$ tại $T = 100°$C bằng bao nhiêu $"m"/°"C"$?],
    (
        [$2.4 dot 10^(-5)$],
        True([$4.4 dot 10^(-5)$]),
        [$3.4 dot 10^(-5)$],
        [$5.4 dot 10^(-5)$]
    ),
    loigiai: [
        - Đạo hàm $L'(T) = 2.0(1.2 dot 10^(-5) + 1.0 dot 10^(-7) T)$.
        - Thay $T = 100 ==> L'(100) = 2.0(1.2 dot 10^(-5) + 1.0 dot 10^(-5)) = 2.0(2.2 dot 10^(-5)) = 4.4 dot 10^(-5)$ $"m"/°"C"$.
        Chọn đáp án B.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = x^3/3 - x$. Tiếp tuyến của đồ thị hàm số vuông góc với đường phân giác góc phần tư thứ nhất $d: y = x$ có hệ số góc $k$ bằng:],
    (
        [$k = 1$],
        True([$k = -1$]),
        [$k = 0$],
        [$k = 2$]
    ),
    loigiai: [
        Vì tiếp tuyến vuông góc với đường thẳng $y = x$ (có hệ số góc $k_d = 1$) nên hệ số góc tiếp tuyến là $k = -1$.
        Chọn đáp án B.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = x^3 - 3x^2 + 6x$. Nghiệm của phương trình $f'(x) = f''(x)$ là:],
    (
        [$x = 1$],
        True([$x = 2$]),
        [$x = 3$],
        [$x = 0$]
    ),
    loigiai: [
        - Đạo hàm cấp một: $f'(x) = 3x^2 - 6x + 6$.
        - Đạo hàm cấp hai: $f''(x) = 6x - 6$.
        - Cho $f'(x) = f''(x) <==> 3x^2 - 6x + 6 = 6x - 6 <==> 3x^2 - 12x + 12 = 0 <==> 3(x - 2)^2 = 0 <==> x = 2$.
        Chọn đáp án B.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Trong kính thiên văn phản xạ (như hình vẽ bên dưới), mặt gương phụ có dạng một đường hyperbol $y = sqrt(x^2 + 9)$ (cm). Hệ số góc tiếp tuyến của mặt gương tại điểm có hoành độ $x_0 = 4$ bằng bao nhiêu?],
    (
        [$0.6$],
        True([$0.8$]),
        [$1.0$],
        [$1.2$]
    ),
    fig: fig-telescope-hyperbola,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm $y' = (2x)/(2 sqrt(x^2 + 9)) = (x)/(sqrt(x^2 + 9))$.
        - Thay $x_0 = 4 ==> k = y'(4) = 4/(sqrt(16 + 9)) = 4/5 = 0.8$.
        Chọn đáp án B.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = sin x dot cos x$. Giá trị đạo hàm $y'(pi/6)$ bằng bao nhiêu?],
    (
        [$sqrt(3)/2$],
        True([$1/2$]),
        [$-1/2$],
        [$0$]
    ),
    loigiai: [
        - Biến đổi $y = 1/2 sin(2x) ==> y' = cos(2x)$.
        - Thay $x = pi/6 ==> y'(pi/6) = cos(pi/3) = 1/2$.
        Chọn đáp án B.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Vận tốc dòng chất lưu chảy qua một đoạn ống thu hẹp biến thiên theo vị trí $x$ (mét) là $v(x) = (100)/(x^2 + 4)$ (m/s). Tốc độ thay đổi vận tốc chất lưu $v'(x)$ tại vị trí $x = 2$ m bằng bao nhiêu m/(s.m)?],
    (
        [$-12.50$],
        True([$-6.25$]),
        [$-25.00$],
        [$6.25$]
    ),
    loigiai: [
        - Đạo hàm $v'(x) = (-100 dot 2x)/((x^2 + 4)^2) = (-200x)/((x^2 + 4)^2)$.
        - Thay $x = 2 ==> v'(2) = (-400)/((2^2+4)^2) = (-400)/(64) = -6.25$ m/(s.m).
        Chọn đáp án B.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Phương trình tiếp tuyến của đồ thị hàm số $y = -x^3 + 3x^2 + 1$ tại điểm cực đại $C(2; 5)$ là:],
    (
        [$y = 2x + 1$],
        True([$y = 5$]),
        [$y = x + 3$],
        [$y = -x + 7$]
    ),
    loigiai: [
        - Ta có $y' = -3x^2 + 6x ==> y'(2) = -3(4) + 12 = 0$.
        - Tại cực đại $C(2; 5)$, tiếp tuyến nằm ngang có hệ số góc $k = 0 ==>$ PTTT là $y = 5$.
        Chọn đáp án B.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Khối lượng nước còn lại trong một chiếc cốc bốc hơi theo thời gian $t$ (phút) được mô hình hóa bởi $m(t) = 200 - 2 sqrt(t)$ (gam). Tốc độ bốc hơi nước tức thời tại thời điểm $t = 9$ phút bằng bao nhiêu gam/phút?],
    (
        [$0.50$],
        True([$0.33$]),
        [$1.00$],
        [$0.67$]
    ),
    loigiai: [
        - Đạo hàm $m'(t) = (-2)/(2 sqrt(t)) = (-1)/(sqrt(t))$.
        - Tại $t = 9 ==> m'(9) = (-1)/(sqrt(9)) = -1/3 approx -0.33$ g/phút.
        - Tốc độ bốc hơi là $0.33$ g/phút.
        Chọn đáp án B.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho phương trình chuyển động góc $theta(t) = 2 cos(3t)$ (rad), với $t >= 0$ (giây). Gia tốc góc tức thời $theta''(t)$ tại thời điểm $t = pi/9$ giây bằng bao nhiêu $"rad/s"^2$?],
    (
        [$-18$],
        True([$-9$]),
        [$9$],
        [$18$]
    ),
    loigiai: [
        - Vận tốc góc $theta'(t) = -6 sin(3t)$.
        - Gia tốc góc $theta''(t) = -18 cos(3t)$.
        - Tại $t = pi/9 ==> theta''(pi/9) = -18 cos(pi/3) = -18(0.5) = -9$ $"rad/s"^2$.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Sự phân hủy của hợp chất hóa học $N_2 O_5$ trong phòng thí nghiệm (như đồ thị bên dưới) có nồng độ theo thời gian $t$ (giây) là $C(t) = 0.5 e^(-0.1 t)$ (mol/lít), $t >= 0$. Các phát biểu sau đúng hay sai?],
    (
        True([Ban đầu khi phản ứng bắt đầu ($t = 0$), nồng độ $N_2 O_5$ bằng $0.5$ mol/lít.]),
        True([Tốc độ phân hủy tức thời của hợp chất là $|C'(t)| = 0.05 e^(-0.1 t)$ (mol/(lít.s)).]),
        False([Tại thời điểm $t = 10$ giây, tốc độ phân hủy tức thời bằng $0.05$ mol/(lít.s).]),
        True([Tốc độ phân hủy hợp chất giảm dần theo thời gian khi nồng độ giảm.])
    ),
    fig: fig-chemical-decomposition,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. Thay $t = 0 ==> C(0) = 0.5$ mol/lít.
        - *b)* Đúng. $C'(t) = 0.5 dot (-0.1) e^(-0.1 t) = -0.05 e^(-0.1 t) ==>$ Tốc độ phân hủy là $|C'(t)| = 0.05 e^(-0.1 t)$.
        - *c)* Sai. Tại $t = 10 ==> |C'(10)| = 0.05 e^(-1) approx 0.0184$ (chứ không phải 0.05).
        - *d)* Đúng. Vì $e^(-0.1 t)$ giảm dần nên tốc độ phân hủy giảm dần theo thời gian.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Trong robot học, tọa độ ngang của đầu một cánh tay robot (như hình vẽ bên dưới) biến thiên theo góc quay $theta$ (rad) bởi công thức $x(theta) = 50 cos theta + 20 cos(2theta)$ (cm). Các phát biểu sau đúng hay sai?],
    (
        True([Vận tốc ngang tức thời theo góc quay là $x'(theta) = -50 sin theta - 40 sin(2theta)$ (cm/rad).]),
        True([Khi cánh tay duỗi thẳng hoàn toàn ($theta = 0$), vận tốc ngang tức thời theo góc quay bằng $0$.]),
        False([Tại vị trí góc quay $theta = pi/2$ rad, vận tốc ngang tức thời bằng $-90$ cm/rad.]),
        True([Đầu cánh tay robot đạt vị trí biên ngang xa nhất khi vận tốc ngang $x'(theta) = 0$.])
    ),
    fig: fig-robot-arm,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. $x'(theta) = 50(-sin theta) + 20(-2 sin 2theta) = -50 sin theta - 40 sin(2theta)$.
        - *b)* Đúng. Thay $theta = 0 ==> x'(0) = 0$ cm/rad.
        - *c)* Sai. Thay $theta = pi/2 ==> x'(pi/2) = -50 sin(pi/2) - 40 sin(pi) = -50 dot 1 - 0 = -50$ cm/rad (chứ không phải -90).
        - *d)* Đúng. Vị trí cực trị (biên) của tọa độ ngang xảy ra khi đạo hàm vận tốc bằng 0.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Mặt gương phụ của một kính thiên văn phản xạ (như hình vẽ bên dưới) có hình dạng một đường hyperbol $y = sqrt(x^2 + 16)$ (cm). Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm $y' = (x)/(sqrt(x^2 + 16))$ biểu thị hệ số góc tiếp tuyến của mặt gương tại hoành độ $x$.]),
        True([Tại điểm $M(3; 5)$ trên mặt gương, tiếp tuyến có hệ số góc bằng $0.6$.]),
        False([Phương trình tiếp tuyến của mặt gương tại điểm $M(3; 5)$ là $y = 0.6x + 3.4$.]),
        True([Khi hoành độ $x -> +oo$, hệ số góc tiếp tuyến tiến dần về $1$.])
    ),
    fig: fig-telescope-hyperbola,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. $y' = (2x)/(2 sqrt(x^2+16)) = x/(sqrt(x^2+16))$.
        - *b)* Đúng. Tại $M(3; 5) ==> y'(3) = 3/sqrt(9+16) = 3/5 = 0.6$.
        - *c)* Sai. PTTT là $y = 0.6(x - 3) + 5 <==> y = 0.6x + 3.2$ (chứ không phải 3.4).
        - *d)* Đúng. Khi $x -> +oo ==> lim y' = lim x/sqrt(x^2+16) = 1$.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Chiều dài của một thanh kim loại thay đổi theo nhiệt độ $T$ (°C) do giãn nở nhiệt theo công thức $L(T) = 1.0 + 10^(-5) T + 10^(-7) T^2$ (mét). Các phát biểu sau đúng hay sai?],
    (
        True([Chiều dài của thanh kim loại ở nhiệt độ $0°$C là $1.0$ mét.]),
        True([Tốc độ giãn nở dài tức thời là $L'(T) = 10^(-5) + 2 dot 10^(-7) T$ ($"m"/°"C"$).]),
        False([Tại nhiệt độ $T = 500°$C, tốc độ giãn nở dài tức thời bằng $10^(-4)$ $"m"/°"C"$.]),
        True([Thanh kim loại giãn nở với tốc độ nhanh hơn ở nhiệt độ cao hơn.])
    ),
    fig: none,
    loigiai: [
        - *a)* Đúng. Thay $T = 0 ==> L(0) = 1.0$ m.
        - *b)* Đúng. $L'(T) = (1.0 + 10^(-5) T + 10^(-7) T^2)' = 10^(-5) + 2 dot 10^(-7) T$.
        - *c)* Sai. Thay $T = 500 ==> L'(500) = 10^(-5) + 2 dot 10^(-7) dot 500 = 10^(-5) + 10^(-4) = 1.1 dot 10^(-4)$ $"m"/°"C"$ (chứ không phải $10^(-4)$).
        - *d)* Đúng. Vì $L''(T) = 2 dot 10^(-7) > 0$ nên tốc độ giãn nở tăng theo nhiệt độ.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = (x^2 + 1)/(x - 1)$. Tính giá trị của đạo hàm $f'(2)$.],
    [-1],
    loigiai: [
        - Đạo hàm hàm thương: $f'(x) = (2x(x-1) - 1(x^2+1))/((x-1)^2) = (x^2 - 2x - 1)/((x-1)^2)$.
        - Thay $x = 2 ==> f'(2) = (2^2 - 2(2) - 1)/((2-1)^2) = (-1)/(1) = -1$.
        Đáp số: $-1$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Sự tăng trưởng diện tích của một mặt nước hình tròn có bán kính $R$ tăng đều với tốc độ $0.4" cm/s"$. Tính tốc độ tăng diện tích khi $R = 10$ cm (tính bằng c$"m"^2"/s"$, lấy $pi approx 3.1416$, làm tròn đến hai chữ số thập phân).],
    [25.13],
    loigiai: [
        - Diện tích mặt nước $S = pi R^2 ==> (d S)/(d t) = 2 pi R (d R)/(d t)$.
        - Thay $R = 10$ và $(d R)/(d t) = 0.4 ==> (d S)/(d t) = 2 pi (10) dot 0.4 = 8 pi approx 25.13" cm"^2"/s"$.
        Đáp số: $25.13$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = x^3 - 6x^2 + 9x + 2$. Đồ thị có hai tiếp tuyến nằm ngang (hệ số góc $k = 0$). Tính khoảng cách giữa hai đường thẳng tiếp tuyến đó.],
    [4],
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 12x + 9 = 3(x^2 - 4x + 3) = 0 <==> x = 1$ hoặc $x = 3$.
        - Tại $x_1 = 1 ==> y_1 = 1 - 6 + 9 + 2 = 6 ==>$ PTTT $y = 6$.
        - Tại $x_2 = 3 ==> y_2 = 27 - 54 + 27 + 2 = 2 ==>$ PTTT $y = 2$.
        - Khoảng cách giữa hai đường thẳng song song $y = 6$ và $y = 2$ là $6 - 2 = 4$.
        Đáp số: $4$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho chuyển động của một vật theo phương trình $s(t) = 2t^3 - 9t^2 + 12t + 1$ (m), với $t >= 0$ (giây). Tính gia tốc của vật tại thời điểm vận tốc tức thời của vật đạt giá trị nhỏ nhất (tính bằng $"m/s"^2$).],
    [0],
    loigiai: [
        - Vận tốc tức thời $v(t) = s'(t) = 6t^2 - 18t + 12$.
        - Tam thức bậc hai $v(t)$ đạt giá trị nhỏ nhất tại đỉnh $t = (-(-18))/(2 dot 6) = 1.5$ giây.
        - Gia tốc tức thời $a(t) = v'(t) = 12t - 18$.
        - Thay $t = 1.5 ==> a(1.5) = 12(1.5) - 18 = 0" m/s"^2$.
        Đáp số: $0$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho parabol $(P): y = x^2 - 2x$. Tiếp tuyến của parabol tại điểm có hoành độ $x_0 = 3$ cắt đường thẳng $d: y = -x + 11$ tại điểm $N(x_N; y_N)$. Tính giá trị của tích $x_N dot y_N$.],
    [28],
    loigiai: [
        - Đạo hàm $y' = 2x - 2 ==> y'(3) = 4$. Tung độ tiếp điểm $y(3) = 3$.
        - PTTT là $y = 4(x - 3) + 3 <==> y = 4x - 9$.
        - Hoành độ giao điểm $N$: $4x - 9 = -x + 11 <==> 5x = 20 <==> x_N = 4$.
        - Tung độ giao điểm $y_N = 4(4) - 9 = 7 ==>$ Tích $x_N dot y_N = 4 dot 7 = 28$.
        Đáp số: $28$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (de07) — Mã 101], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = x^3 - 3x$. Tiếp tuyến của đồ thị tại điểm có hoành độ $x_0 = 1$ cắt đồ thị tại điểm thứ hai $F(x_F; y_F)$. Tính giá trị của tổng $x_F + y_F$.],
    [-4],
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 3 ==> y'(1) = 0$. Tung độ tiếp điểm $y(1) = -2 ==>$ PTTT là $y = -2$.
        - Phương trình hoành độ giao điểm: $x^3 - 3x = -2 <==> x^3 - 3x + 2 = 0 <==> (x - 1)^2 (x + 2) = 0 <==> x = 1$ (tiếp điểm) hoặc $x_F = -2$.
        - Tung độ $y_F = -2 ==>$ Tổng $x_F + y_F = -2 + (-2) = -4$.
        Đáp số: $-4$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 07)!]      #v(0.6em)
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
