// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 01)
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

#show: lecture-theme.with(
  title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 01)",
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
#lt-tn(num: 1, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x)$ xác định trên khoảng $(a; b)$ và $x_0 in (a; b)$. Đạo hàm của hàm số $y = f(x)$ tại điểm $x_0$ được định nghĩa bởi công thức nào sau đây?],
    (
        [$f'(x_0) = limits(lim)_(x -> x_0) (f(x) + f(x_0))/(x - x_0)$],
        True([$f'(x_0) = limits(lim)_(x -> x_0) (f(x) - f(x_0))/(x - x_0)$]),
        [$f'(x_0) = limits(lim)_(x -> x_0) (f(x) - f(x_0))/(x + x_0)$],
        [$f'(x_0) = limits(lim)_(x -> 0) (f(x) - f(x_0))/(x - x_0)$]
    ),
    loigiai: [
        Theo định nghĩa đạo hàm của hàm số tại một điểm, ta có:
        $ f'(x_0) = limits(lim)_(x -> x_0) (f(x) - f(x_0))/(x - x_0) $.
        Chọn đáp án B.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tính đạo hàm của hàm số $y = 2x^3 - 3x^2 + 5x - 1$.],
    (
        [$y' = 6x^2 - 6x$],
        True([$y' = 6x^2 - 6x + 5$]),
        [$y' = 2x^2 - 3x + 5$],
        [$y' = 6x^2 - 3x + 5$]
    ),
    loigiai: [
        Áp dụng quy tắc tính đạo hàm của hàm đa thức:
        $ y' = (2x^3)' - (3x^2)' + (5x)' - (1)' = 6x^2 - 6x + 5 $.
        Chọn đáp án B.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = (2x - 1)/(x + 1)$. Đạo hàm của hàm số đã cho là:],
    (
        [$y' = (1)/((x + 1)^2)$],
        [$y' = (-3)/((x + 1)^2)$],
        True([$y' = (3)/((x + 1)^2)$]),
        [$y' = (2)/((x + 1)^2)$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm thương $(u/v)' = (u' v - u v')/(v^2)$ hoặc công thức nhanh $((a x + b)/(c x + d))' = (a d - b c)/((c x + d)^2)$:
        $ y' = (2 dot 1 - (-1) dot 1)/((x + 1)^2) = (3)/((x + 1)^2) $.
        Chọn đáp án C.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tính đạo hàm của hàm số $y = sqrt(x^2 + 3)$.],
    (
        [$y' = (1)/(2 sqrt(x^2 + 3))$],
        True([$y' = (x)/(sqrt(x^2 + 3))$]),
        [$y' = (2x)/(sqrt(x^2 + 3))$],
        [$y' = (x)/(2 sqrt(x^2 + 3))$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm hợp căn thức $(sqrt(u))' = (u')/(2 sqrt(u))$:
        $ y' = ((x^2 + 3)')/(2 sqrt(x^2 + 3)) = (2x)/(2 sqrt(x^2 + 3)) = (x)/(sqrt(x^2 + 3)) $.
        Chọn đáp án B.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tính đạo hàm của hàm số lượng giác $y = sin(2x - pi/3)$.],
    (
        [$y' = cos(2x - pi/3)$],
        True([$y' = 2 cos(2x - pi/3)$]),
        [$y' = -2 cos(2x - pi/3)$],
        [$y' = 2 sin(2x - pi/3)$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm hợp lượng giác $(sin u)' = u' dot cos u$:
        $ y' = (2x - pi/3)' dot cos(2x - pi/3) = 2 cos(2x - pi/3) $.
        Chọn đáp án B.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Hệ số góc $k$ của tiếp tuyến của đồ thị hàm số $y = x^3 - 3x + 2$ tại điểm có hoành độ $x_0 = 2$ bằng bao nhiêu?],
    (
        [$k = 6$],
        True([$k = 9$]),
        [$k = 12$],
        [$k = 3$]
    ),
    loigiai: [
        - Ta có đạo hàm $y' = 3x^2 - 3$.
        - Hệ số góc của tiếp tuyến tại điểm có hoành độ $x_0 = 2$ là:
          $ k = y'(2) = 3 dot 2^2 - 3 = 12 - 3 = 9 $.
        Chọn đáp án B.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Phương trình tiếp tuyến của đồ thị hàm số $y = x^2 - 4x + 3$ tại điểm $M(3; 0)$ là:],
    (
        [$y = 2x + 6$],
        True([$y = 2x - 6$]),
        [$y = -2x + 6$],
        [$y = 4x - 12$]
    ),
    loigiai: [
        - Ta có $y' = 2x - 4 ==> y'(3) = 2 dot 3 - 4 = 2$.
        - Phương trình tiếp tuyến tại $M(3; 0)$ là:
          $ y = y'(3)(x - 3) + 0 <==> y = 2(x - 3) <==> y = 2x - 6 $.
        Chọn đáp án B.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một vật chuyển động theo phương trình $s(t) = t^3 - 3t^2 + 4t$, trong đó $t$ tính bằng giây ($t >= 0$), $s$ tính bằng mét. Vận tốc tức thời của vật tại thời điểm $t = 3$ giây bằng bao nhiêu?],
    (
        [$9" "m/s""$],
        True([$13" "m/s""$]),
        [$15" "m/s""$],
        [$22" "m/s""$]
    ),
    loigiai: [
        - Vận tốc tức thời của chuyển động tại thời điểm $t$ là đạo hàm của hàm số quãng đường:
          $ v(t) = s'(t) = 3t^2 - 6t + 4 $.
        - Vận tốc tức thời tại thời điểm $t = 3$ giây là:
          $ v(3) = 3 dot 3^2 - 6 dot 3 + 4 = 27 - 18 + 4 = 13" "m/s"" $.
        Chọn đáp án B.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = x^4 - 2x^2 + 1$. Giá trị của đạo hàm cấp hai $f''(1)$ bằng bao nhiêu?],
    (
        [$4$],
        True([$8$]),
        [$12$],
        [$0$]
    ),
    loigiai: [
        - Đạo hàm cấp một: $f'(x) = 4x^3 - 4x$.
        - Đạo hàm cấp hai: $f''(x) = (f'(x))' = 12x^2 - 4$.
        - Suy ra $f''(1) = 12 dot 1^2 - 4 = 8$.
        Chọn đáp án B.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tiếp tuyến của đồ thị hàm số $y = 1/3 x^3 - 2x^2 + 3x + 1$ song song với đường thẳng $y = -x + 2$ có hệ số góc $k$ bằng:],
    (
        [$k = 1$],
        True([$k = -1$]),
        [$k = -2$],
        [$k = 3$]
    ),
    loigiai: [
        Vì tiếp tuyến song song với đường thẳng $y = -x + 2$ nên hệ số góc của tiếp tuyến bằng hệ số góc của đường thẳng đó, tức là $k = -1$.
        Chọn đáp án B.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = 1/3 x^3 - x^2 - 3x + 2$. Tập nghiệm của bất phương trình $f'(x) <= 0$ là:],
    (
        [$(-oo; -1] union [3; +oo)$],
        True([$[-1; 3]$]),
        [$[-3; 1]$],
        [$(-text{ố}; 3]$]
    ),
    loigiai: [
        - Ta có đạo hàm: $f'(x) = x^2 - 2x - 3$.
        - Bất phương trình $f'(x) <= 0 <==> x^2 - 2x - 3 <= 0 <==> -1 <= x <= 3$.
        - Vậy tập nghiệm là $[-1; 3]$.
        Chọn đáp án B.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Tính đạo hàm của hàm số lượng giác $y = cos^2(3x)$.],
    (
        [$y' = -sin(6x)$],
        True([$y' = -3 sin(6x)$]),
        [$y' = 3 sin(6x)$],
        [$y' = -6 cos(3x) sin(3x)$]
    ),
    loigiai: [
        - Áp dụng công thức đạo hàm hàm hợp $(u^2)' = 2u u'$ và $(cos 3x)' = -3 sin 3x$:
          $ y' = 2 cos(3x) dot (cos 3x)' = 2 cos(3x) dot (-3 sin 3x) = -3 (2 sin 3x cos 3x) = -3 sin(6x) $.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x) = x^3 - 3x^2 + 2$ có đồ thị $(C)$. Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm của hàm số đã cho là $f'(x) = 3x^2 - 6x$.]),
        True([Phương trình tiếp tuyến của đồ thị $(C)$ tại điểm $A(1; 0)$ là $y = -3x + 3$.]),
        False([Hệ số góc nhỏ nhất của tiếp tuyến của đồ thị $(C)$ bằng $0$.]),
        True([Có đúng 2 tiếp tuyến của đồ thị $(C)$ song song với đường thẳng $d: y = 9x - 5$.])
    ),
    loigiai: [
        - *a)* Đúng. $f'(x) = (x^3 - 3x^2 + 2)' = 3x^2 - 6x$.
        - *b)* Đúng. Tại $A(1; 0)$, ta có $f'(1) = 3(1)^2 - 6(1) = -3$. P T T T là $y = -3(x - 1) + 0 <==> y = -3x + 3$.
        - *c)* Sai. Ta có hệ số góc tiếp tuyến $k = f'(x) = 3x^2 - 6x = 3(x - 1)^2 - 3 >= -3$. Vậy hệ số góc nhỏ nhất bằng $-3$ (xảy ra tại $x = 1$), chứ không phải $0$.
        - *d)* Đúng. Tiếp tuyến song song với $d: y = 9x - 5 ==> f'(x) = 9 <==> 3x^2 - 6x = 9 <==> x^2 - 2x - 3 = 0 <==> x = -1$ hoặc $x = 3$. Hai tiếp điểm này tạo ra 2 tiếp tuyến phân biệt là $y = 9x + 7$ và $y = 9x - 25$ (đều song song với $d$).
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một vật chuyển động thẳng xác định bởi phương trình quãng đường $s(t) = t^3 - 6t^2 + 15t + 2$, trong đó $t$ tính bằng giây ($t >= 0$), $s$ tính bằng mét. Các phát biểu sau đúng hay sai?],
    (
        True([Vận tốc tức thời của vật tại thời điểm $t$ là $v(t) = 3t^2 - 12t + 15$ ("m/s").]),
        False([Tại thời điểm $t = 1$ giây, vận tốc của vật bằng $8$ "m/s".]),
        True([Vận tốc tức thời của vật đạt giá trị nhỏ nhất tại thời điểm $t = 2$ giây.]),
        True([Gia tốc tức thời của vật tại thời điểm vận tốc đạt giá trị nhỏ nhất bằng $0" "m/s""^2$.])
    ),
    loigiai: [
        - *a)* Đúng. Vận tốc tức thời $v(t) = s'(t) = 3t^2 - 12t + 15$ ("m/s").
        - *b)* Sai. Thay $t = 1$ vào $v(t)$, ta được $v(1) = 3(1)^2 - 12(1) + 15 = 6$ "m/s" (chứ không phải 8 "m/s").
        - *c)* Đúng. Ta có $v(t) = 3(t^2 - 4t + 4) + 3 = 3(t - 2)^2 + 3 >= 3$. Vận tốc nhỏ nhất bằng $3$ "m/s" tại $t = 2$ giây.
        - *d)* Đúng. Gia tốc tức thời là đạo hàm của vận tốc: $a(t) = v'(t) = 6t - 12$. Tại $t = 2 ==> a(2) = 6(2) - 12 = 0" "m/s""^2$.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = (2x + 1)/(x - 1)$ có đồ thị $(H)$. Các phát biểu sau đúng hay sai?],
    (
        True([Tập xác định của hàm số là $D = RR setminus {1}$.]),
        True([Đạo hàm của hàm số là $y' = (-3)/((x - 1)^2)$ với mọi $x neq 1$.]),
        False([Tiếp tuyến của đồ thị $(H)$ tại điểm có hoành độ $x_0 = 2$ có hệ số góc bằng $3$.]),
        True([Tiếp tuyến của đồ thị $(H)$ tại điểm có tung độ $y_0 = 5$ có phương trình là $y = -3x + 11$.])
    ),
    loigiai: [
        - *a)* Đúng. Điều kiện mẫu số khác 0: $x - 1 neq 0 <==> x neq 1 ==> D = RR setminus {1}$.
        - *b)* Đúng. $y' = (2(x-1) - 1(2x+1))/((x-1)^2) = (-3)/((x-1)^2)$.
        - *c)* Sai. Tại $x_0 = 2$, hệ số góc tiếp tuyến là $y'(2) = (-3)/((2 - 1)^2) = -3$ (chứ không phải $3$).
        - *d)* Đúng. Tung độ $y_0 = 5 <==> (2x_0 + 1)/(x_0 - 1) = 5 <==> 2x_0 + 1 = 5x_0 - 5 <==> 3x_0 = 6 <==> x_0 = 2$. Hệ số góc $y'(2) = -3$. P T T T tại $M(2; 5)$ là $y = -3(x - 2) + 5 <==> y = -3x + 11$.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = sin x - cos x$. Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm của hàm số là $f'(x) = cos x + sin x$.]),
        True([Giá trị của đạo hàm tại $x = pi/4$ bằng $sqrt(2)$.]),
        False([Đạo hàm cấp hai của hàm số là $f''(x) = sin x - cos x$.]),
        True([Trên đoạn $[0; pi]$, phương trình $f'(x) = 0$ có nghiệm duy nhất $x = (3pi)/(4)$.])
    ),
    loigiai: [
        - *a)* Đúng. $f'(x) = (sin x)' - (cos x)' = cos x - (-sin x) = cos x + sin x$.
        - *b)* Đúng. $f'(pi/4) = cos(pi/4) + sin(pi/4) = (sqrt(2))/(2) + (sqrt(2))/(2) = sqrt(2)$.
        - *c)* Sai. Đạo hàm cấp hai $f''(x) = (cos x + sin x)' = -sin x + cos x = -(sin x - cos x) = -f(x)$ (thiếu dấu trừ trong phát biểu).
        - *d)* Đúng. Trên $[0; pi]$, $f'(x) = 0 <==> cos x + sin x = 0 <==> tan x = -1 <==> x = (3pi)/(4)$. Phương trình có đúng 1 nghiệm trên $[0; pi]$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = (x^2 + 2x - 3)/(x + 2)$. Tính giá trị của đạo hàm $f'(0)$.],
    [1.75],
    loigiai: [
        - Tính đạo hàm theo quy tắc hàm thương:
          $ f'(x) = ((2x + 2)(x + 2) - 1(x^2 + 2x - 3))/((x + 2)^2) = (2x^2 + 6x + 4 - x^2 - 2x + 3)/((x + 2)^2) = (x^2 + 4x + 7)/((x + 2)^2) $.
        - Thay $x = 0$ vào $f'(x)$:
          $ f'(0) = (0^2 + 4 dot 0 + 7)/((0 + 2)^2) = (7)/(4) = 1.75 $.
        Đáp số: $1.75$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = x^3 - 3x^2 + 4$. Tiếp tuyến của đồ thị hàm số tại điểm có hoành độ $x_0 = 3$ cắt trục tung tại điểm có tung độ bằng bao nhiêu?],
    [-23],
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 6x ==> y'(3) = 3 dot 3^2 - 6 dot 3 = 9$.
        - Tung độ tiếp điểm: $y(3) = 3^3 - 3 dot 3^2 + 4 = 4 ==> M(3; 4)$.
        - Phương trình tiếp tuyến: $y = 9(x - 3) + 4 <==> y = 9x - 23$.
        - Cho $x = 0 ==> y = -23$. Vậy tiếp tuyến cắt trục tung tại điểm có tung độ bằng $-23$.
        Đáp số: $-23$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Điện lượng $Q$ (tính bằng Coulomb, C) truyền qua một dây dẫn thay đổi theo thời gian $t$ (tính bằng giây, $t >= 0$) được cho bởi công thức $Q(t) = 2t^3 - 3t^2 + 10t + 5$. Tính cường độ dòng điện tức thời $I$ truyền qua dây dẫn tại thời điểm $t = 2$ giây (tính bằng Ampe, A).],
    [22],
    loigiai: [
        - Cường độ dòng điện tức thời tại thời điểm $t$ là đạo hàm của điện lượng theo thời gian:
          $ I(t) = Q'(t) = 6t^2 - 6t + 10" (A)" $.
        - Tại thời điểm $t = 2$ giây:
          $ I(2) = 6 dot 2^2 - 6 dot 2 + 10 = 24 - 12 + 10 = 22" A" $.
        Đáp số: $22$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = -x^3 + 3x^2 - 2$ có đồ thị $(C)$. Biết rằng đồ thị $(C)$ có hai tiếp tuyến cùng song song với đường thẳng $y = -9x + 5$. Tổng tung độ của hai tiếp điểm tương ứng của hai tiếp tuyến này bằng bao nhiêu?],
    [0],
    loigiai: [
        - Ta có đạo hàm $y' = -3x^2 + 6x$.
        - Tiếp tuyến song song với đường thẳng $y = -9x + 5 ==> y' = -9 <==> -3x^2 + 6x = -9 <==> 3x^2 - 6x - 9 = 0 <==> x = -1$ hoặc $x = 3$.
        - Với $x_1 = -1 ==> y_1 = -(-1)^3 + 3(-1)^2 - 2 = 2$.
        - Với $x_2 = 3 ==> y_2 = -(3)^3 + 3(3)^2 - 2 = -2$.
        - Tổng tung độ của hai tiếp điểm là: $y_1 + y_2 = 2 + (-2) = 0$.
        Đáp số: $0$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Một vật chuyển động có phương trình quãng đường $s(t) = t^4 - 2t^2 + 5t$ (mét), với $t$ tính bằng giây ($t >= 0$). Gia tốc tức thời của vật tại thời điểm $t = 2$ giây bằng bao nhiêu (tính bằng $"m/s"^2$)?],
    [44],
    loigiai: [
        - Vận tốc tức thời $v(t) = s'(t) = 4t^3 - 4t + 5$.
        - Gia tốc tức thời $a(t) = v'(t) = s''(t) = 12t^2 - 4$.
        - Tại thời điểm $t = 2$ giây:
          $ a(2) = 12 dot 2^2 - 4 = 48 - 4 = 44" "m/s""^2 $.
        Đáp số: $44$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (de01) — Mã 101], back-to: "sec-exercise-hub",[Cho hàm số $y = x^2 - 4x + 3$. Tiếp tuyến của đồ thị hàm số vuông góc với đường thẳng $d: y = -1/2 x + 5$ cắt hai trục tọa độ $O x, O y$ tạo thành một tam giác vuông. Tính diện tích của tam giác vuông đó.],
    [9],
    loigiai: [
        - Tiếp tuyến vuông góc với $d: y = -1/2 x + 5 ==>$ Hệ số góc tiếp tuyến $k$ thỏa mãn $k dot (-1/2) = -1 ==> k = 2$.
        - Ta có $y' = 2x - 4 = 2 <==> 2x = 6 <==> x_0 = 3$.
        - Tung độ tiếp điểm $y_0 = 3^2 - 4 dot 3 + 3 = 0 ==> M(3; 0)$.
        - Phương trình tiếp tuyến là $y = 2(x - 3) + 0 <==> y = 2x - 6$.
        - Giao điểm với $O x$ (thay $y=0$): $x = 3 ==> A(3; 0) ==> O A = 3$.
        - Giao điểm với $O y$ (thay $x=0$): $y = -6 ==> B(0; -6) ==> O B = 6$.
        - Diện tích tam giác vuông $O A B$ là: $S = 1/2 O A dot O B = 1/2 dot 3 dot 6 = 9$.
        Đáp số: $9$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 01)!]      #v(0.6em)
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
