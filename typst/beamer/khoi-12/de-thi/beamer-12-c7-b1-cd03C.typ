// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ĐỀ ÔN TẬP CHUYÊN ĐỀ 3C: PHƯƠNG SAI V(X), ĐỘ LỆCH CHUẨN SIGMA(X) & ĐO LƯỜNG MỨC ĐỘ RỦI RO
// Lớp: Khối 12  ·  Mã đề: 523  ·  GV: Nguyễn Văn Sang
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



#show: lecture-theme.with(
  title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3C: PHƯƠNG SAI V(X), ĐỘ LỆCH CHUẨN SIGMA(X) & ĐO LƯỜNG MỨC ĐỘ RỦI RO",
  subtitle: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG — MÃ ĐỀ: 523",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 523]],
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
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#lt-tn(num: 1, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$0$], [$1$], [$2$],
    [$P(X = x)$], [$0","2$], [$0","5$], [$0","3$]
  )
]
Phương sai $V(X)$ và độ lệch chuẩn $sigma(X)$ của biến ngẫu nhiên $X$ lần lượt bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Trục số biểu diễn kỳ vọng và khoảng phân tán độ lệch chuẩn
    line((-0.5, 0), (3.0, 0), stroke: 1.2pt + accent, mark: (end: "stealth"))
    content((3.2, 0), text(size: 8pt, [$x$]))
    
    // Các cột xác suất
    let dist = ((0, 0.2, "0,2"), (1, 0.5, "0,5"), (2, 0.3, "0,3"))
    for (x, p, lbl) in dist {
      rect((x - 0.15, 0), (x + 0.15, p * 3), fill: accent.lighten(65%), stroke: 0.8pt + accent)
      content((x, p * 3 + 0.2), text(size: 7.5pt, lbl))
      content((x, -0.3), text(size: 8pt, weight: "bold", str(x)))
    }
    
    // Vạch kỳ vọng E(X) = 1.1 và dải sigma = 0.7
    line((1.1, -0.1), (1.1, 1.8), stroke: (dash: "dashed", paint: rgb("ea580c"), thickness: 1pt))
    circle((1.1, 0), radius: 0.06, fill: rgb("ea580c"))
    content((1.1, 2.05), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [$E(X) = 1","1$]))
    
    // Khoảng [E - sigma, E + sigma] = [0.4, 1.8]
    line((0.4, 0.9), (1.8, 0.9), stroke: 1.2pt + rgb("dc2626"), mark: (start: "straight", end: "straight"))
    content((1.1, 1.15), text(size: 7pt, fill: rgb("dc2626"), weight: "bold", [$2 sigma = 1","4$]))
  })
]
],
    (
        [$V(X) = 0","41$ và $sigma(X) approx 0","64$],
        True([$V(X) = 0","49$ và $sigma(X) = 0","7$]),
        [$V(X) = 0","51$ và $sigma(X) approx 0","71$],
        [$V(X) = 1","21$ và $sigma(X) = 1","1$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Để tính phương sai $V(X)$ và độ lệch chuẩn $sigma(X)$ của biến ngẫu nhiên rời rạc:
        1. Tính kỳ vọng: $E(X) = sum_(i=1)^n x_i p_i$.
        2. Tính kỳ vọng bình phương: $E(X^2) = sum_(i=1)^n x_i^2 p_i$.
        3. Tính phương sai: $V(X) = E(X^2) - [E(X)]^2$.
        4. Tính độ lệch chuẩn: $sigma(X) = sqrt(V(X))$.

        #step([Lời giải chi tiết])
        Tính kỳ vọng:
        $ E(X) = 0 dot 0","2 + 1 dot 0","5 + 2 dot 0","3 = 0 + 0","5 + 0","6 = 1","1 $
        Tính kỳ vọng bình phương:
        $ E(X^2) = 0^2 dot 0","2 + 1^2 dot 0","5 + 2^2 dot 0","3 = 0 + 0","5 + 4 dot 0","3 = 0","5 + 1","2 = 1","7 $
        Phương sai:
        $ V(X) = E(X^2) - [E(X)]^2 = 1","7 - (1","1)^2 = 1","7 - 1","21 = 0","49 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(V(X)) = sqrt(0","49) = 0","7 $
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên rời rạc $X$ có phương sai $V(X) = 4$ (tương ứng độ lệch chuẩn $sigma(X) = 2$). Xét biến ngẫu nhiên mới được tạo bởi phép biến đổi affine $Y = -3 X + 5$. Phương sai $V(Y)$ và độ lệch chuẩn $sigma(Y)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa tính chất V(aX + b) = a^2 V(X)
    line((-1, 1), (6, 1), stroke: 0.8pt + accent, mark: (end: "stealth"))
    content((-1.5, 1), text(size: 8pt, [$X$]))
    line((1.5, 1), (3.5, 1), stroke: 2pt + accent)
    content((2.5, 1.35), text(size: 7.5pt, fill: accent, [Độ tản mạn $sigma(X) = 2$]))
    
    line((-1, -0.5), (9, -0.5), stroke: 0.8pt + rgb("ea580c"), mark: (end: "stealth"))
    content((-1.5, -0.5), text(size: 8pt, [$Y$]))
    line((1, -0.5), (7, -0.5), stroke: 2pt + rgb("ea580c"))
    content((4, -0.9), text(size: 7.5pt, fill: rgb("ea580c"), [Độ tản mạn co giãn gấp 3 lần: $sigma(Y) = 6$]))
    
    line((2.5, 0.8), (4, -0.3), stroke: (dash: "dashed", paint: gray), mark: (end: "stealth"))
    content((4.8, 0.25), text(size: 7pt, [Phép biến đổi $Y = -3X + 5$]))
  })
]
],
    (
        [$V(Y) = -12$ và $sigma(Y) = -6$],
        [$V(Y) = 17$ và $sigma(Y) = sqrt(17)$],
        True([$V(Y) = 36$ và $sigma(Y) = 6$]),
        [$V(Y) = 41$ và $sigma(Y) = sqrt(41)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tính chất của phương sai và độ lệch chuẩn đối với biến đổi tuyến tính $Y = a X + b$:
        $ V(a X + b) = a^2 V(X) $
        $ sigma(a X + b) = |a| sigma(X) $
        Lưu ý: Hằng số tự do $b$ chỉ làm tịnh tiến toàn bộ phân bố mà không làm thay đổi độ phân tán của các giá trị quanh trọng tâm, do đó phương sai và độ lệch chuẩn không phụ thuộc vào $b$.

        #step([Lời giải chi tiết])
        Với $Y = -3 X + 5$, ta có $a = -3, b = 5$.
        Áp dụng công thức:
        $ V(Y) = V(-3 X + 5) = (-3)^2 dot V(X) = 9 dot 4 = 36 $
        Độ lệch chuẩn:
        $ sigma(Y) = |-3| dot sigma(X) = 3 dot 2 = 6 $
        (Hoặc $sigma(Y) = sqrt(V(Y)) = sqrt(36) = 6$).
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Biến ngẫu nhiên rời rạc $X$ nhận các giá trị $1, 2, 3$ với bảng phân bố xác suất chứa tham số $m$:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$1$], [$2$], [$3$],
    [$P(X = x)$], [$0","3$], [$m$], [$0","7 - m$]
  )
]
Biết rằng kỳ vọng toán học $E(X) = 2","1$. Giá trị của tham số $m$ và phương sai $V(X)$ lần lượt bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị biểu diễn phân bố xác suất khi m = 0,3
    line((0, 0), (4, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.2, 0), text(size: 8pt, [$x$]))
    line((0, 0), (0, 2), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.2), text(size: 8pt, [$P$]))
    
    // Cột tại 1: 0.3, cột tại 2: 0.3, cột tại 3: 0.4
    let pts = ((1, 0.3, "0,3"), (2, 0.3, "m=0,3"), (3, 0.4, "0,4"))
    for (x, p, lbl) in pts {
      rect((x - 0.2, 0), (x + 0.2, p * 4), fill: accent.lighten(60%), stroke: 0.8pt + accent)
      content((x, p * 4 + 0.2), text(size: 7.5pt, lbl))
      content((x, -0.25), text(size: 8pt, weight: "bold", str(x)))
    }
  })
]
],
    (
        [$m = 0","2$ và $V(X) = 0","61$],
        [$m = 0","4$ và $V(X) = 0","79$],
        True([$m = 0","3$ và $V(X) = 0","69$]),
        [$m = 0","3$ và $V(X) = 0","81$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Dựa vào điều kiện kỳ vọng $E(X) = sum x_i p_i = 2","1$ để lập phương trình giải tìm tham số $m$.
        2. Sau khi tìm được $m$, xác định bảng phân bố đầy đủ và tính $E(X^2)$.
        3. Áp dụng công thức $V(X) = E(X^2) - [E(X)]^2$.

        #step([Lời giải chi tiết])
        Từ công thức tính kỳ vọng:
        $ E(X) = 1 dot 0","3 + 2 dot m + 3 dot (0","7 - m) = 2","1 $
        $ 0","3 + 2 m + 2","1 - 3 m = 2","1 $
        $ 2","4 - m = 2","1 ==> m = 2","4 - 2","1 = 0","3 $
        Với $m = 0","3$, xác suất tại $X = 3$ là $P(X = 3) = 0","7 - 0","3 = 0","4$.
        Tính kỳ vọng bình phương:
        $ E(X^2) = 1^2 dot 0","3 + 2^2 dot 0","3 + 3^2 dot 0","4 = 1 dot 0","3 + 4 dot 0","3 + 9 dot 0","4 $
        $ E(X^2) = 0","3 + 1","2 + 3","6 = 5","1 $
        Phương sai:
        $ V(X) = E(X^2) - [E(X)]^2 = 5","1 - (2","1)^2 = 5","1 - 4","41 = 0","69 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một hộp chứa $3$ quả cầu màu đỏ và $5$ quả cầu màu xanh có cùng kích thước. Lấy ngẫu nhiên không hoàn lại $2$ quả cầu từ hộp. Gọi $X$ là số quả cầu màu đỏ lấy được. Phương sai $V(X)$ của biến ngẫu nhiên $X$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ mô phỏng hộp bi và phân bố siêu bội
    rect((-2, -1), (0.2, 1), stroke: 1.2pt + accent, fill: accent.lighten(90%))
    content((-0.9, 1.25), text(size: 7.5pt, weight: "bold", fill: accent, [Hộp: 3 Đỏ + 5 Xanh]))
    // Bi đỏ
    circle((-1.5, 0.4), radius: 0.16, fill: rgb("dc2626"), stroke: 0.5pt)
    circle((-1.5, -0.1), radius: 0.16, fill: rgb("dc2626"), stroke: 0.5pt)
    circle((-1.5, -0.6), radius: 0.16, fill: rgb("dc2626"), stroke: 0.5pt)
    // Bi xanh
    circle((-0.5, 0.5), radius: 0.16, fill: rgb("2563eb"), stroke: 0.5pt)
    circle((-0.5, 0.1), radius: 0.16, fill: rgb("2563eb"), stroke: 0.5pt)
    circle((-0.5, -0.3), radius: 0.16, fill: rgb("2563eb"), stroke: 0.5pt)
    circle((-0.5, -0.7), radius: 0.16, fill: rgb("2563eb"), stroke: 0.5pt)
    circle((0.0, 0.0), radius: 0.16, fill: rgb("2563eb"), stroke: 0.5pt)
    
    // Mũi tên lấy 2 bi
    line((0.3, 0), (1.2, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0.75, 0.25), text(size: 7pt, [Lấy 2 bi]))
    
    // Bảng phân bố X
    rect((1.3, -0.8), (4.5, 0.8), stroke: 0.8pt + accent, fill: white)
    content((2.9, 0.4), text(size: 7.5pt, [Số bi đỏ: $X in {0, 1, 2}$]))
    content((2.9, 0.0), text(size: 7.5pt, [$P(X=0)=10/28$]))
    content((2.9, -0.4), text(size: 7.5pt, [$P(X=1)=15/28, P(X=2)=3/28$]))
  })
]
],
    (
        [$V(X) = 15/56$],
        [$V(X) = 21/56$],
        True([$V(X) = 45/112$]),
        [$V(X) = 9/16$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Xác định tập các giá trị của $X$: Do lấy $2$ quả cầu từ hộp có $3$ quả đỏ nên $X in {0, 1, 2}$.
        2. Tổng số cách chọn $2$ quả từ $8$ quả là $C_8^2 = frac(8 dot 7, 2) = 28$.
        3. Tính xác suất tương ứng $P(X = k) = frac(C_3^k C_5^(2-k), 28)$.
        4. Tính $E(X)$, $E(X^2)$ và suy ra $V(X) = E(X^2) - [E(X)]^2$.

        #step([Lời giải chi tiết])
        Các xác suất thành phần:
        - $P(X = 0) = frac(C_3^0 C_5^2, 28) = frac(10, 28) = frac(5, 14)$.
        - $P(X = 1) = frac(C_3^1 C_5^1, 28) = frac(3 dot 5, 28) = frac(15, 28)$.
        - $P(X = 2) = frac(C_3^2 C_5^0, 28) = frac(3 dot 1, 28) = frac(3, 28)$.
        
        Tính kỳ vọng $E(X)$:
        $ E(X) = 0 dot frac(10, 28) + 1 dot frac(15, 28) + 2 dot frac(3, 28) = frac(15 + 6, 28) = frac(21, 28) = frac(3, 4) $
        Tính kỳ vọng bình phương $E(X^2)$:
        $ E(X^2) = 0^2 dot frac(10, 28) + 1^2 dot frac(15, 28) + 2^2 dot frac(3, 28) = frac(15 + 12, 28) = frac(27, 28) $
        Phương sai $V(X)$:
        $ V(X) = E(X^2) - [E(X)]^2 = frac(27, 28) - (frac(3, 4))^2 = frac(27, 28) - frac(9, 16) $
        Quy đồng mẫu số chung là $112$ ($112 = 28 dot 4 = 16 dot 7$):
        $ V(X) = frac(27 dot 4 - 9 dot 7, 112) = frac(108 - 63, 112) = frac(45, 112) approx 0","4018 $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một nhà đầu tư đang cân nhắc hai cổ phiếu $A$ và $B$ có cùng tỷ suất sinh lời kỳ vọng $E(R_A) = E(R_B) = 12%$. Bảng phân bố xác suất của tỷ suất sinh lời (%) của hai cổ phiếu như sau:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [Tỷ suất $R_A$ (%)], [$8%$], [$12%$], [$16%$],
    [$P(R_A)$], [$0","25$], [$0","50$], [$0","25$],
    [Tỷ suất $R_B$ (%)], [$4%$], [$12%$], [$20%$],
    [$P(R_B)$], [$0","25$], [$0","50$], [$0","25$]
  )
]
Khẳng định nào sau đây là đúng về mức độ rủi ro (độ lệch chuẩn $sigma$) của hai cổ phiếu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ hai đường phân bố so sánh độ nhọn và độ bẹt
    line((0, 0), (6, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((6.2, 0), text(size: 8pt, [$R$]))
    
    // Cổ phiếu A: tập trung quanh 12% (x=3)
    line((2, 0), (3, 2), stroke: 1.2pt + accent)
    line((3, 2), (4, 0), stroke: 1.2pt + accent)
    content((3, 2.2), text(size: 7.5pt, fill: accent, weight: "bold", [Cổ phiếu A (Nhọn - Ít rủi ro)]))
    
    // Cổ phiếu B: phân tán rộng từ 4% (x=1) đến 20% (x=5)
    line((1, 0), (3, 1), stroke: (dash: "dashed", paint: rgb("dc2626"), thickness: 1.2pt))
    line((3, 1), (5, 0), stroke: (dash: "dashed", paint: rgb("dc2626"), thickness: 1.2pt))
    content((4.8, 1.2), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Cổ phiếu B (Phẳng - Rủi ro cao)]))
  })
]
],
    (
        [$sigma_A = sigma_B$ vì cả hai cổ phiếu có cùng kỳ vọng $12%$],
        [$sigma_A = 4%$, $sigma_B = 2%$ nên cổ phiếu A rủi ro hơn cổ phiếu B],
        True([$sigma_A = 2","83%$, $sigma_B = 5","66%$ nên cổ phiếu A ít rủi ro hơn cổ phiếu B]),
        [$sigma_A = 8%$, $sigma_B = 32%$ nên cổ phiếu B ít rủi ro hơn cổ phiếu A]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Trong lý thuyết tài chính hiện đại (Markowitz), khi hai tài sản đầu tư có cùng mức sinh lời kỳ vọng, tài sản nào có phương sai hoặc độ lệch chuẩn nhỏ hơn sẽ có mức độ biến động thấp hơn, tức là ít rủi ro hơn đối với nhà đầu tư e ngại rủi ro.

        #step([Lời giải chi tiết])
        Tính phương sai của cổ phiếu $A$:
        $ V(R_A) = (8 - 12)^2 dot 0","25 + (12 - 12)^2 dot 0","50 + (16 - 12)^2 dot 0","25 $
        $ V(R_A) = (-4)^2 dot 0","25 + 0 + 4^2 dot 0","25 = 16 dot 0","25 + 16 dot 0","25 = 4 + 4 = 8 $
        $ ==> sigma_A = sqrt(8) = 2 sqrt(2) approx 2","83% $
        
        Tính phương sai của cổ phiếu $B$:
        $ V(R_B) = (4 - 12)^2 dot 0","25 + (12 - 12)^2 dot 0","50 + (20 - 12)^2 dot 0","25 $
        $ V(R_B) = (-8)^2 dot 0","25 + 0 + 8^2 dot 0","25 = 64 dot 0","25 + 64 dot 0","25 = 16 + 16 = 32 $
        $ ==> sigma_B = sqrt(32) = 4 sqrt(2) approx 5","66% $
        
        Do $sigma_A < sigma_B$ ($2","83% < 5","66%$), tỷ suất sinh lời của cổ phiếu A tập trung chặt chẽ hơn quanh giá trị kỳ vọng $12%$, do đó cổ phiếu A ít rủi ro hơn đáng kể so với cổ phiếu B.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Hai dự án kinh doanh $D_1$ và $D_2$ có quy mô vốn khác nhau. Lợi nhuận kỳ vọng và độ lệch chuẩn của hai dự án được cho như sau:
- Dự án $D_1$: Lợi nhuận kỳ vọng $E_1 = 100$ triệu đồng, độ lệch chuẩn $sigma_1 = 15$ triệu đồng.
- Dự án $D_2$: Lợi nhuận kỳ vọng $E_2 = 200$ triệu đồng, độ lệch chuẩn $sigma_2 = 24$ triệu đồng.
Để so sánh mức độ rủi ro tương đối trên mỗi đơn vị lợi nhuận kỳ vọng, người ta sử dụng hệ số biến thiên $C V = frac(sigma, E)$. Nhận định nào sau đây là chính xác?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị biểu diễn điểm rủi ro (E, sigma) và góc nghiêng CV
    line((0, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$E$]))
    line((0, 0), (0, 3), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 3.2), text(size: 8pt, [$sigma$]))
    
    // Điểm D1 (1.5, 1.5) tương ứng E=100, sigma=15 (dốc hơn)
    circle((1.5, 1.5), radius: 0.08, fill: rgb("dc2626"))
    content((1.5, 1.8), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [$D_1: C V_1 = 0","15$]))
    line((0, 0), (2.5, 2.5), stroke: (dash: "dashed", paint: rgb("dc2626"), thickness: 0.8pt))
    
    // Điểm D2 (3.0, 1.8) tương ứng E=200, sigma=24 (ít dốc hơn)
    circle((3.0, 1.8), radius: 0.08, fill: accent)
    content((3.0, 2.1), text(size: 7.5pt, fill: accent, weight: "bold", [$D_2: C V_2 = 0","12$]))
    line((0, 0), (4.0, 2.4), stroke: (dash: "dashed", paint: accent, thickness: 0.8pt))
  })
]
],
    (
        [Dự án $D_1$ ít rủi ro tương đối hơn vì có $sigma_1 = 15 < sigma_2 = 24$],
        True([Dự án $D_2$ ít rủi ro tương đối hơn vì có $C V_2 = 0","12 < C V_1 = 0","15$]),
        [Dự án $D_1$ và $D_2$ có mức độ rủi ro tương đối như nhau],
        [Hệ số biến thiên của dự án $D_2$ là $C V_2 = 0","24$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi so sánh hai dự án đầu tư có quy mô kỳ vọng khác nhau ($E_1 eq.not E_2$), độ lệch chuẩn tuyệt đối $sigma$ không phản ánh trung thực mức độ rủi ro trên một đồng vốn kỳ vọng.
        Hệ số biến thiên (Coefficient of Variation - $C V$) đo lường rủi ro tương đối:
        $ C V = frac(sigma, E) $
        Dự án nào có hệ số biến thiên $C V$ nhỏ hơn sẽ mang lại mức độ an toàn cao hơn trên mỗi đơn vị lợi nhuận kỳ vọng.

        #step([Lời giải chi tiết])
        Tính hệ số biến thiên cho từng dự án:
        - Dự án $D_1$:
          $ C V_1 = frac(sigma_1, E_1) = frac(15, 100) = 0","15 = 15% $
        - Dự án $D_2$:
          $ C V_2 = frac(sigma_2, E_2) = frac(24, 200) = 0","12 = 12% $
        So sánh: $C V_2 = 0","12 < C V_1 = 0","15$.
        Như vậy, để tạo ra $1$ đồng lợi nhuận kỳ vọng, dự án $D_2$ chỉ chịu rủi ro $0","12$ đồng, trong khi dự án $D_1$ phải chịu rủi ro $0","15$ đồng. Do đó, dự án $D_2$ an toàn và hiệu quả hơn xét theo rủi ro tương đối.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Biến ngẫu nhiên $X$ chỉ thị thành công trong một phép thử Bernoulli, tức là $X$ nhận giá trị $1$ (thành công) với xác suất $p$ và nhận giá trị $0$ (thất bại) với xác suất $1 - p$ ($0 <= p <= 1$). Phương sai $V(X)$ đạt giá trị lớn nhất bằng bao nhiêu và tại giá trị $p$ nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị parabol V(p) = p(1 - p)
    line((-0.5, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$p$]))
    line((0, -0.3), (0, 2.2), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.4), text(size: 8pt, [$V(p)$]))
    
    // Vẽ đường cong parabol đỉnh tại p=0.5, y=0.25 (scale: x * 4, y * 6)
    // p=0 -> (0,0); p=0.5 -> (2, 1.5); p=1 -> (4,0)
    line((0, 0), (0.5, 0.525), (1.0, 0.96), (1.5, 1.26), (2.0, 1.5), (2.5, 1.26), (3.0, 0.96), (3.5, 0.525), (4.0, 0), stroke: 1.5pt + accent)
    
    // Đỉnh cực đại
    circle((2.0, 1.5), radius: 0.08, fill: rgb("dc2626"))
    line((2.0, 0), (2.0, 1.5), stroke: (dash: "dashed", paint: rgb("dc2626")))
    line((0, 1.5), (2.0, 1.5), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((2.0, -0.3), text(size: 7.5pt, weight: "bold", [$0","5$]))
    content((-0.4, 1.5), text(size: 7.5pt, weight: "bold", [$0","25$]))
    content((2.0, 1.8), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Đỉnh cực đại $(0","5; 0","25)$]))
  })
]
],
    (
        [$max V(X) = 0","5$ khi $p = 0","5$],
        True([$max V(X) = 0","25$ khi $p = 0","5$]),
        [$max V(X) = 1$ khi $p = 1$],
        [$max V(X) = 0","16$ khi $p = 0","4$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Biến ngẫu nhiên Bernoulli có kỳ vọng $E(X) = 1 dot p + 0 dot (1-p) = p$.
        2. Kỳ vọng bình phương: $E(X^2) = 1^2 dot p + 0^2 dot (1-p) = p$.
        3. Phương sai: $V(X) = E(X^2) - [E(X)]^2 = p - p^2 = p(1 - p)$.
        4. Tìm giá trị lớn nhất của hàm bậc hai $f(p) = -p^2 + p$ trên đoạn $[0; 1]$.

        #step([Lời giải chi tiết])
        Xét hàm số $f(p) = -p^2 + p$ với $p in [0; 1]$.
        Đạo hàm $f'(p) = -2 p + 1$. Cho $f'(p) = 0 <=> p = frac(1, 2) = 0","5$.
        Giá trị lớn nhất của hàm số là:
        $ f(0","5) = 0","5 dot (1 - 0","5) = 0","25 $
        (Theo bất đẳng thức AM-GM: $p(1 - p) <= (frac(p + 1 - p, 2))^2 = (frac(1, 2))^2 = 0","25$).
        Ý nghĩa thực tế: Độ không chắc chắn (phương sai) của một kết quả nhị phân đạt cực đại khi xác suất hai khả năng ngang nhau ($50% - 50%$).
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Hai trạm biến áp cung cấp điện cho hai phân xưởng độc lập. Gọi $X$ và $Y$ (đơn vị: MW) lần lượt là công suất tiêu thụ của phân xưởng 1 và phân xưởng 2 trong giờ cao điểm. Biết $X$ và $Y$ là hai biến ngẫu nhiên độc lập có phương sai lần lượt là $V(X) = 1","44$ và $V(Y) = 2","56$. Độ lệch chuẩn của tổng công suất tiêu thụ $Z = X + Y$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình cộng công suất hai nguồn độc lập
    rect((-2, 0.5), (-0.5, 1.5), stroke: 1pt + accent, fill: accent.lighten(80%))
    content((-1.25, 1), text(size: 7.5pt, [Trạm 1: $V(X)=1","44$]))
    
    rect((-2, -1.5), (-0.5, -0.5), stroke: 1pt + accent, fill: accent.lighten(80%))
    content((-1.25, -1), text(size: 7.5pt, [Trạm 2: $V(Y)=2","56$]))
    
    circle((1, 0), radius: 0.35, stroke: 1.2pt + rgb("ea580c"), fill: rgb("ea580c").lighten(80%))
    content((1, 0), text(size: 10pt, weight: "bold", [$+$]))
    
    line((-0.5, 1), (0.65, 0.2), stroke: 1pt + accent, mark: (end: "stealth"))
    line((-0.5, -1), (0.65, -0.2), stroke: 1pt + accent, mark: (end: "stealth"))
    
    line((1.35, 0), (2.8, 0), stroke: 1.2pt + rgb("ea580c"), mark: (end: "stealth"))
    content((3.8, 0), text(size: 8pt, weight: "bold", fill: rgb("ea580c"), [Tổng tải $Z = X + Y$]))
    content((3.8, -0.4), text(size: 7.5pt, [$sigma(Z) = 2","0$ MW]))
  })
]
],
    (
        [$sigma(Z) = 4","0$ MW],
        True([$sigma(Z) = 2","0$ MW]),
        [$sigma(Z) = 2","8$ MW],
        [$sigma(Z) = 1","6$ MW]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi hai biến ngẫu nhiên $X$ và $Y$ độc lập:
        1. Phương sai của tổng bằng tổng các phương sai:
           $ V(X + Y) = V(X) + V(Y) $
        2. Độ lệch chuẩn của tổng bằng căn bậc hai của phương sai tổng:
           $ sigma(X + Y) = sqrt(V(X + Y)) = sqrt(V(X) + V(Y)) $
        Lưu ý quan trọng: Độ lệch chuẩn không có tính cộng tính, tức là $sigma(X + Y) eq.not sigma(X) + sigma(Y)$.

        #step([Lời giải chi tiết])
        Do $X$ và $Y$ độc lập, ta có phương sai của tổng công suất:
        $ V(Z) = V(X + Y) = V(X) + V(Y) = 1","44 + 2","56 = 4","00 $
        Độ lệch chuẩn của tổng công suất là:
        $ sigma(Z) = sqrt(V(Z)) = sqrt(4","00) = 2","0" MW" $
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một máy tiện tự động sản xuất các bu-lông kim loại. Đường kính của bu-lông là biến ngẫu nhiên $X$ có kỳ vọng $E(X) = 20" mm"$ và phương sai $V(X) = 0","0016" mm"^2$ (độ lệch chuẩn $sigma = 0","04" mm"$). Một bu-lông được coi là phế phẩm nếu đường kính sai lệch khỏi mức chuẩn $20" mm"$ từ $0","08" mm"$ trở lên (tức $|X - 20| >= 0","08$). Sử dụng bất đẳng thức Chebyshev $P(|X - E(X)| >= k sigma) <= frac(1, k^2)$, tỷ lệ phế phẩm tối đa của máy tiện này không vượt quá:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Trục số bu-lông và vùng dung sai 2 sigma
    line((-0.5, 0), (5.5, 0), stroke: 1.2pt + accent, mark: (end: "stealth"))
    content((5.7, 0), text(size: 8pt, [$X$]))
    
    // Chuẩn 20mm tại x = 2.5
    line((2.5, -0.2), (2.5, 1.5), stroke: 1.2pt + accent)
    circle((2.5, 0), radius: 0.06, fill: accent)
    content((2.5, 1.75), text(size: 8pt, weight: "bold", fill: accent, [$E(X) = 20" mm"$]))
    
    // Vùng đạt chuẩn [19.92; 20.08] ứng với [1.3; 3.7]
    rect((1.3, 0), (3.7, 0.6), fill: rgb("16a34a").lighten(80%), stroke: 0.8pt + rgb("16a34a"))
    content((2.5, 0.3), text(size: 7.5pt, fill: rgb("16a34a"), weight: "bold", [Đạt chuẩn ($|X - 20| < 2 sigma$)]))
    
    // Vùng phế phẩm hai đầu
    content((0.6, 0.4), text(size: 7pt, fill: rgb("dc2626"), [Phế phẩm]))
    content((4.4, 0.4), text(size: 7pt, fill: rgb("dc2626"), [Phế phẩm]))
    content((1.3, -0.35), text(size: 7.5pt, [$19","92$]))
    content((3.7, -0.35), text(size: 7.5pt, [$20","08$]))
  })
]
],
    (
        [$10%$],
        [$16%$],
        True([$25%$]),
        [$50%$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Bất đẳng thức Chebyshev: Với mọi biến ngẫu nhiên $X$ có kỳ vọng $E(X)$ và phương sai $V(X) = sigma^2$, với mọi số thực $k > 0$:
        $ P(|X - E(X)| >= k sigma) <= frac(1, k^2) $
        Xác định hệ số $k$: $epsilon = k sigma ==> k = frac(epsilon, sigma)$.

        #step([Lời giải chi tiết])
        Ta có $E(X) = 20$, độ lệch chuẩn $sigma = sqrt(0","0016) = 0","04" mm"$.
        Sai số cho phép là $epsilon = 0","08" mm"$.
        Hệ số bội của độ lệch chuẩn là:
        $ k = frac(epsilon, sigma) = frac(0","08, 0","04) = 2 $
        Áp dụng bất đẳng thức Chebyshev với $k = 2$:
        $ P(|X - 20| >= 0","08) = P(|X - E(X)| >= 2 sigma) <= frac(1, 2^2) = frac(1, 4) = 0","25 = 25% $
        Như vậy, tỷ lệ phế phẩm tối đa của máy tiện được bảo đảm không vượt quá $25%$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một trò chơi quay số trúng thưởng có bảng phân bố số tiền nhận được $X$ (nghìn đồng) như sau:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [Tiền nhận $X$ (nghìn đồng)], [$-20$ (Thua)], [$0$ (Hòa)], [$+50$ (Thắng)],
    [$P(X = x)$], [$0","6$], [$0","3$], [$0","1$]
  )
]
Kỳ vọng $E(X)$ và phương sai $V(X)$ của số tiền nhận được lần lượt là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ vòng quay may mắn mô phỏng xác suất 60% thua, 30% hòa, 10% thắng
    circle((0, 0), radius: 1.5, stroke: 1.2pt + accent, fill: white)
    // 60% = 216 độ (0 đến 216)
    line((0, 0), (1.5, 0), stroke: 1pt + accent)
    line((0, 0), (-1.21, -0.88), stroke: 1pt + accent)
    content((0, 0.7), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold", [Thua 20k (60%)]))
    // 30% = 108 độ (216 đến 324)
    line((0, 0), (1.21, -0.88), stroke: 1pt + accent)
    content((-0.4, -0.7), text(size: 7.5pt, fill: gray, [Hòa 0k (30%)]))
    // 10% = 36 độ (324 đến 360)
    content((0.8, -0.5), text(size: 7pt, fill: rgb("16a34a"), weight: "bold", [+50k (10%)]))
    circle((0, 0), radius: 0.15, fill: accent)
  })
]
],
    (
        [$E(X) = -7$ và $V(X) = 441$],
        True([$E(X) = -7$ và $V(X) = 441$]),
        [$E(X) = 5$ và $V(X) = 490$],
        [$E(X) = -7$ và $V(X) = 490$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính $E(X) = sum x_i p_i$.
        2. Tính $E(X^2) = sum x_i^2 p_i$.
        3. Tính $V(X) = E(X^2) - [E(X)]^2$.

        #step([Lời giải chi tiết])
        Kỳ vọng số tiền nhận được:
        $ E(X) = (-20) dot 0","6 + 0 dot 0","3 + 50 dot 0","1 = -12 + 0 + 5 = -7" nghìn đồng" $
        Kỳ vọng bình phương:
        $ E(X^2) = (-20)^2 dot 0","6 + 0^2 dot 0","3 + 50^2 dot 0","1 = 400 dot 0","6 + 0 + 2500 dot 0","1 $
        $ E(X^2) = 240 + 250 = 490 $
        Phương sai:
        $ V(X) = E(X^2) - [E(X)]^2 = 490 - (-7)^2 = 490 - 49 = 441 $
        Độ lệch chuẩn $sigma(X) = sqrt(441) = 21$ nghìn đồng.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên $X$ có $E(X) = 50$ và phương sai $V(X) = 16$ (độ lệch chuẩn $sigma = 4$). Dựa vào bất đẳng thức Chebyshev, xác suất để giá trị của $X$ rơi vào khoảng $(40; 60)$, tức $P(40 < X < 60)$, thỏa mãn:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Trục số khoảng đối xứng quanh 50
    line((-0.5, 0), (5.5, 0), stroke: 1.2pt + accent, mark: (end: "stealth"))
    content((5.7, 0), text(size: 8pt, [$x$]))
    
    // Điểm 50 tại x=2.5
    circle((2.5, 0), radius: 0.08, fill: accent)
    content((2.5, 0.4), text(size: 8pt, weight: "bold", fill: accent, [$E(X) = 50$]))
    
    // Khoảng [40; 60] ứng với x từ 1.0 đến 4.0
    line((1.0, -0.15), (1.0, 0.15), stroke: 1.2pt + rgb("16a34a"))
    line((4.0, -0.15), (4.0, 0.15), stroke: 1.2pt + rgb("16a34a"))
    rect((1.0, -0.05), (4.0, 0.05), fill: rgb("16a34a"), stroke: none)
    content((1.0, -0.4), text(size: 7.5pt, weight: "bold", [$40$]))
    content((4.0, -0.4), text(size: 7.5pt, weight: "bold", [$60$]))
    content((2.5, -0.75), text(size: 7.5pt, fill: rgb("16a34a"), weight: "bold", [Khoảng tập trung: $|X - 50| < 10$]))
  })
]
],
    (
        [$P(40 < X < 60) >= 0","64$],
        [$P(40 < X < 60) >= 0","75$],
        True([$P(40 < X < 60) >= 0","84$]),
        [$P(40 < X < 60) >= 0","96$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Dạng biến đổi của bất đẳng thức Chebyshev cho biến cố tập trung quanh kỳ vọng:
        $ P(|X - E(X)| < epsilon) >= 1 - frac(V(X), epsilon^2) $
        Hoặc viết theo bội số độ lệch chuẩn $epsilon = k sigma$:
        $ P(|X - E(X)| < k sigma) >= 1 - frac(1, k^2) $

        #step([Lời giải chi tiết])
        Biến cố $40 < X < 60$ tương đương với:
        $ -10 < X - 50 < 10 <=> |X - 50| < 10 $
        Với $epsilon = 10$ và $sigma = 4$, ta có $k = frac(epsilon, sigma) = frac(10, 4) = 2","5$.
        Áp dụng bất đẳng thức Chebyshev:
        $ P(|X - 50| < 10) >= 1 - frac(V(X), 10^2) = 1 - frac(16, 100) = 1 - 0","16 = 0","84 $
        Do đó, xác suất để giá trị của biến ngẫu nhiên $X$ sai lệch không quá $10$ đơn vị quanh mức trung bình luôn đạt ít nhất $84%$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một nhà đầu tư phân bổ danh mục gồm hai cổ phiếu độc lập $X$ và $Y$ có phương sai lần lượt là $V(X) = 4$ và $V(Y) = 9$. Gọi $w$ ($0 <= w <= 1$) là tỷ trọng vốn đầu tư vào cổ phiếu $X$, phần còn lại $1 - w$ đầu tư vào cổ phiếu $Y$. Khi đó, lợi nhuận của danh mục là biến ngẫu nhiên $R_p = w X + (1 - w) Y$. Tỷ trọng $w$ cần đầu tư vào cổ phiếu $X$ để phương sai của danh mục $V(R_p)$ đạt giá trị nhỏ nhất (danh mục tối thiểu hóa rủi ro) bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị hàm bậc hai V(w) = 13 w^2 - 18 w + 9
    line((-0.5, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$w$]))
    line((0, -0.3), (0, 3.2), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 3.4), text(size: 8pt, [$V(w)$]))
    
    // Parabol đỉnh tại w = 9/13 approx 0.69 (scale x * 3.5, y * 0.3)
    // w=0 -> 9 (y=2.7); w=9/13 -> 36/13 approx 2.77 (y=0.83); w=1 -> 4 (y=1.2)
    line((0, 2.7), (0.7, 1.6), (1.4, 0.95), (2.42, 0.83), (3.0, 1.0), (3.5, 1.2), stroke: 1.5pt + accent)
    
    // Đỉnh cực tiểu
    circle((2.42, 0.83), radius: 0.08, fill: rgb("dc2626"))
    line((2.42, 0), (2.42, 0.83), stroke: (dash: "dashed", paint: rgb("dc2626")))
    line((0, 0.83), (2.42, 0.83), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((2.42, -0.35), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"), [$w = 9/13$]))
    content((-0.6, 0.83), text(size: 7pt, [$36/13$]))
  })
]
],
    (
        [$w = 1/2$],
        [$w = 4/13$],
        True([$w = 9/13$]),
        [$w = 2/3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Do $X$ và $Y$ độc lập, phương sai của danh mục là:
           $ V(R_p) = V(w X + (1 - w) Y) = w^2 V(X) + (1 - w)^2 V(Y) $
        2. Biến đổi về tam thức bậc hai theo biến $w$: $f(w) = A w^2 + B w + C$.
        3. Tìm giá trị $w$ tại đỉnh parabol $w^* = - frac(B, 2 A)$ để $f(w)$ đạt cực tiểu.

        #step([Lời giải chi tiết])
        Thay $V(X) = 4$ và $V(Y) = 9$ vào biểu thức phương sai danh mục:
        $ V(R_p) = 4 w^2 + 9 (1 - w)^2 = 4 w^2 + 9 (1 - 2 w + w^2) $
        $ V(R_p) = 4 w^2 + 9 - 18 w + 9 w^2 = 13 w^2 - 18 w + 9 $
        Đây là tam thức bậc hai theo $w$ có hệ số $a = 13 > 0$, bề lõm quay lên trên nên đạt cực tiểu tại hoành độ đỉnh:
        $ w^* = - frac(-18, 2 dot 13) = frac(18, 26) = frac(9, 13) approx 0","6923 $
        Giá trị phương sai nhỏ nhất đạt được:
        $ V_"min" = 13 (frac(9, 13))^2 - 18 (frac(9, 13)) + 9 = frac(81, 13) - frac(162, 13) + frac(117, 13) = frac(36, 13) approx 2","769 $
        (Nhận xét: Phương sai danh mục $2","77$ nhỏ hơn cả phương sai của tài sản an toàn nhất $V(X) = 4$, minh chứng cho sức mạnh giảm thiểu rủi ro của việc đa dạng hóa danh mục đầu tư).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#lt-ds(num: 13, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Hai dây chuyền sản xuất tự động $A$ và $B$ cùng gia công một loại linh kiện điện tử vi mạch. Để đánh giá độ ổn định chất lượng, người ta kiểm tra ngẫu nhiên các lô hàng 100 sản phẩm và ghi nhận số vi mạch bị lỗi. Bảng phân bố xác suất của số vi mạch lỗi $X_A$ (dây chuyền A) và $X_B$ (dây chuyền B) như sau:
#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt + accent,
    [Số lỗi $k$], [$0$], [$1$], [$2$], [$3$],
    [$P(X_A = k)$], [$0","2$], [$0","4$], [$0","3$], [$0","1$],
    [$P(X_B = k)$], [$0","1$], [$0","6$], [$0","3$], [$0$]
  )
]
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu đồ cột so sánh hai dây chuyền A và B
    line((0, 0), (6, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((6.2, 0), text(size: 8pt, [$k$]))
    line((0, 0), (0, 2.8), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 3.0), text(size: 8pt, [$P$]))
    
    // Dây chuyền A (màu tím)
    rect((0.8, 0), (1.1, 0.2 * 4), fill: accent, stroke: none)
    rect((2.0, 0), (2.3, 0.4 * 4), fill: accent, stroke: none)
    rect((3.2, 0), (3.5, 0.3 * 4), fill: accent, stroke: none)
    rect((4.4, 0), (4.7, 0.1 * 4), fill: accent, stroke: none)
    
    // Dây chuyền B (màu cam)
    rect((1.1, 0), (1.4, 0.1 * 4), fill: rgb("ea580c"), stroke: none)
    rect((2.3, 0), (2.6, 0.6 * 4), fill: rgb("ea580c"), stroke: none)
    rect((3.5, 0), (3.8, 0.3 * 4), fill: rgb("ea580c"), stroke: none)
    
    // Chú thích
    rect((1.5, 2.5), (1.8, 2.7), fill: accent, stroke: none)
    content((2.5, 2.6), text(size: 7.5pt, [Dây chuyền A]))
    rect((3.5, 2.5), (3.8, 2.7), fill: rgb("ea580c"), stroke: none)
    content((4.5, 2.6), text(size: 7.5pt, [Dây chuyền B]))
  })
]
],
  (
    True([Số lỗi trung bình kỳ vọng của dây chuyền A là $E(X_A) = 1","3$ sản phẩm.]),
    True([Số lỗi trung bình kỳ vọng của dây chuyền B là $E(X_B) = 1","2$ sản phẩm.]),
    True([Phương sai số lỗi của dây chuyền B là $V(X_B) = 0","36$, nhỏ hơn phương sai của dây chuyền A là $V(X_A) = 0","81$.]),
    True([Dây chuyền B có quy trình sản xuất ổn định và đồng đều hơn dây chuyền A.])
  ),
  loigiai: [
    #step([Phương pháp giải])
    1. Tính kỳ vọng: $E(X) = sum k dot P(X = k)$.
    2. Tính kỳ vọng bình phương: $E(X^2) = sum k^2 dot P(X = k)$.
    3. Tính phương sai: $V(X) = E(X^2) - [E(X)]^2$.
    4. So sánh phương sai để đánh giá tính ổn định (phương sai càng nhỏ chất lượng càng đồng đều).

    #step([Phân tích ý a])
    $ E(X_A) = 0 dot 0","2 + 1 dot 0","4 + 2 dot 0","3 + 3 dot 0","1 = 0 + 0","4 + 0","6 + 0","3 = 1","3 $
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    $ E(X_B) = 0 dot 0","1 + 1 dot 0","6 + 2 dot 0","3 + 3 dot 0 = 0 + 0","6 + 0","6 = 1","2 $
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    Tính kỳ vọng bình phương:
    $ E(X_A^2) = 0^2 dot 0","2 + 1^2 dot 0","4 + 2^2 dot 0","3 + 3^2 dot 0","1 = 0","4 + 1","2 + 0","9 = 2","5 $
    $ V(X_A) = E(X_A^2) - [E(X_A)]^2 = 2","5 - (1","3)^2 = 2","5 - 1","69 = 0","81 $
    $ E(X_B^2) = 0^2 dot 0","1 + 1^2 dot 0","6 + 2^2 dot 0","3 + 3^2 dot 0 = 0","6 + 1","2 + 0 = 1","8 $
    $ V(X_B) = E(X_B^2) - [E(X_B)]^2 = 1","8 - (1","2)^2 = 1","8 - 1","44 = 0","36 $
    Rõ ràng $V(X_B) = 0","36 < V(X_A) = 0","81$.
    Khẳng định ý c là *ĐÚNG*.

    #step([Phân tích ý d])
    Vì dây chuyền B vừa có số lỗi trung bình thấp hơn ($1","2 < 1","3$), vừa có phương sai lỗi nhỏ hơn ($0","36 < 0","81$), nên chất lượng dây chuyền B ổn định và đồng đều hơn dây chuyền A.
    Khẳng định ý d là *ĐÚNG*.
  ]
)

// DS 2 (Câu 14)
#lt-ds(num: 14, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một quỹ đầu tư mạo hiểm phân bổ vốn vào hai dự án độc lập $X$ và $Y$. Tỷ suất lợi nhuận (%) của hai dự án là các biến ngẫu nhiên có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [Lợi nhuận $X$ (%)], [$0%$], [$10%$], [$20%$],
    [$P(X)$], [$0","2$], [$0","5$], [$0","3$],
    [Lợi nhuận $Y$ (%)], [$5%$], [$15%$], [$25%$],
    [$P(Y)$], [$0","3$], [$0","4$], [$0","3$]
  )
]
Quỹ đầu tư xây dựng danh mục kết hợp với tỷ trọng $40%$ vốn vào dự án $X$ và $60%$ vốn vào dự án $Y$, tức là tỷ suất sinh lời danh mục $R_p = 0","4 X + 0","6 Y$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô tả tương quan lợi nhuận - rủi ro danh mục
    line((0, 0), (5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((5.2, 0), text(size: 8pt, [$sigma$]))
    line((0, 0), (0, 3), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 3.2), text(size: 8pt, [$E(R)$]))
    
    // Điểm X, Y và đường cong danh mục
    circle((2.0, 1.2), radius: 0.08, fill: accent)
    content((2.0, 0.9), text(size: 7.5pt, [Dự án X]))
    circle((3.5, 2.2), radius: 0.08, fill: rgb("ea580c"))
    content((3.5, 2.5), text(size: 7.5pt, [Dự án Y]))
    
    // Danh mục kết hợp p
    circle((1.8, 1.8), radius: 0.08, fill: rgb("16a34a"))
    content((1.2, 1.95), text(size: 7.5pt, fill: rgb("16a34a"), weight: "bold", [Danh mục $R_p$]))
    line((2.0, 1.2), (1.8, 1.8), (3.5, 2.2), stroke: (dash: "dashed", paint: gray))
  })
]
],
  (
    True([Tỷ suất lợi nhuận kỳ vọng của dự án X là $E(X) = 11%$ và của dự án Y là $E(Y) = 15%$.]),
    True([Phương sai lợi nhuận của hai dự án lần lượt là $V(X) = 49$ và $V(Y) = 60$.]),
    True([Tỷ suất lợi nhuận kỳ vọng của danh mục đầu tư là $E(R_p) = 13","4%$.]),
    False([Phương sai của danh mục đầu tư là $V(R_p) = 55","6$, lớn hơn phương sai của dự án X.])
  ),
  loigiai: [
    #step([Phương pháp giải])
    1. Tính $E(X), E(Y)$ và $V(X), V(Y)$.
    2. Áp dụng tính chất tuyến tính của kỳ vọng: $E(a X + b Y) = a E(X) + b E(Y)$.
    3. Do $X, Y$ độc lập, phương sai danh mục: $V(a X + b Y) = a^2 V(X) + b^2 V(Y)$.

    #step([Phân tích ý a])
    $ E(X) = 0 dot 0","2 + 10 dot 0","5 + 20 dot 0","3 = 5 + 6 = 11% $
    $ E(Y) = 5 dot 0","3 + 15 dot 0","4 + 25 dot 0","3 = 1","5 + 6 + 7","5 = 15% $
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    Tính kỳ vọng bình phương:
    $ E(X^2) = 0^2 dot 0","2 + 10^2 dot 0","5 + 20^2 dot 0","3 = 0 + 50 + 120 = 170 $
    $ V(X) = 170 - 11^2 = 170 - 121 = 49 $
    $ E(Y^2) = 5^2 dot 0","3 + 15^2 dot 0","4 + 25^2 dot 0","3 = 7","5 + 90 + 187","5 = 285 $
    $ V(Y) = 285 - 15^2 = 285 - 225 = 60 $
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    $ E(R_p) = 0","4 E(X) + 0","6 E(Y) = 0","4 dot 11 + 0","6 dot 15 = 4","4 + 9","0 = 13","4% $
    Khẳng định ý c là *ĐÚNG*.

    #step([Phân tích ý d])
    Do $X$ và $Y$ độc lập:
    $ V(R_p) = (0","4)^2 V(X) + (0","6)^2 V(Y) = 0","16 dot 49 + 0","36 dot 60 $
    $ V(R_p) = 7","84 + 21","60 = 29","44 $
    Phương sai danh mục $29","44$ nhỏ hơn nhiều so với $V(X) = 49$ và $V(Y) = 60$.
    Khẳng định ý d là *SAI*.
  ]
)

// DS 3 (Câu 15)
#lt-ds(num: 15, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một công ty bảo hiểm nhân thọ phát hành gói sản phẩm bảo hiểm tai nạn cho $100$ khách hàng độc lập. Mỗi hợp đồng có thời hạn 1 năm, số tiền chi trả bồi thường nếu xảy ra tai nạn là $100$ triệu đồng. Xác suất xảy ra tai nạn của mỗi khách hàng trong năm đều bằng $p = 0","01$ ($1%$). Gọi $X_i$ là số tiền bồi thường cho khách hàng thứ $i$ ($i = 1, 2, ..., 100$) và $S = sum_(i=1)^100 X_i$ là tổng số tiền công ty phải bồi thường trong năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa quy luật số lớn trong bảo hiểm
    rect((-2, -1), (2, 1), stroke: 1.2pt + accent, fill: accent.lighten(90%))
    content((0, 0.6), text(size: 8pt, weight: "bold", fill: accent, [Tập hợp n = 100 hợp đồng]))
    content((0, 0.1), text(size: 7.5pt, [Mỗi HĐ: $p = 0","01$, bồi thường $100$ triệu]))
    content((0, -0.4), text(size: 7.5pt, fill: rgb("16a34a"), weight: "bold", [Rủi ro trung bình giảm $1/sqrt(n) = 1/10$]))
  })
]
],
  (
    True([Kỳ vọng số tiền bồi thường cho một khách hàng là $E(X_1) = 1$ triệu đồng.]),
    True([Tổng số tiền bồi thường kỳ vọng của cả 100 khách hàng là $E(S) = 100$ triệu đồng.]),
    True([Phương sai số tiền bồi thường của một khách hàng là $V(X_1) = 99$ (triệu đồng)#super[2].]),
    False([Độ lệch chuẩn của tổng số tiền bồi thường là $sigma(S) = 990$ triệu đồng.])
  ),
  loigiai: [
    #step([Phương pháp giải])
    1. Biến ngẫu nhiên $X_i$ nhận giá trị $100$ triệu với xác suất $0","01$ và nhận giá trị $0$ với xác suất $0","99$.
    2. Tính $E(X_i)$ và $V(X_i)$.
    3. Sử dụng tính độc lập: $E(S) = sum E(X_i) = n E(X_1)$ và $V(S) = sum V(X_i) = n V(X_1)$.
    4. Độ lệch chuẩn của tổng $sigma(S) = sqrt(V(S)) = sqrt(n) sigma(X_1)$.

    #step([Phân tích ý a])
    $ E(X_1) = 100 dot 0","01 + 0 dot 0","99 = 1" triệu đồng" $
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    $ E(S) = E(sum_(i=1)^100 X_i) = 100 dot E(X_1) = 100 dot 1 = 100" triệu đồng" $
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    $ E(X_1^2) = 100^2 dot 0","01 + 0^2 dot 0","99 = 10000 dot 0","01 = 100 $
    $ V(X_1) = E(X_1^2) - [E(X_1)]^2 = 100 - 1^2 = 99 $
    Khẳng định ý c là *ĐÚNG*.

    #step([Phân tích ý d])
    Do $100$ hợp đồng độc lập:
    $ V(S) = 100 dot V(X_1) = 100 dot 99 = 9900 $
    $ ==> sigma(S) = sqrt(9900) = 10 sqrt(99) approx 99","5" triệu đồng" $
    Con số $990$ trong đề bài là nhầm lẫn do nhân $100$ với $sigma$ thay vì nhân $sqrt(100)$.
    Khẳng định ý d là *SAI*.
  ]
)

// DS 4 (Câu 16)
#lt-ds(num: 16, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một xe vận chuyển hàng bưu chính di chuyển qua hai cung đường độc lập để đến điểm giao: chặng 1 trên quốc lộ có thời gian di chuyển $T_1$ (phút) và chặng 2 qua nội đô có thời gian di chuyển $T_2$ (phút). Bảng phân bố xác suất của $T_1$ và $T_2$ như sau:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [$T_1$ (phút)], [$20$], [$25$], [$30$],
    [$P(T_1)$], [$0","3$], [$0","4$], [$0","3$],
    [$T_2$ (phút)], [$15$], [$25$], [$35$],
    [$P(T_2)$], [$0","2$], [$0","6$], [$0","2$]
  )
]
Tổng thời gian di chuyển toàn tuyến là $T = T_1 + T_2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ cung đường 2 chặng
    line((0, 0), (2.5, 0), stroke: 1.5pt + accent, mark: (end: "stealth"))
    content((1.25, 0.35), text(size: 7.5pt, fill: accent, weight: "bold", [Chặng 1: $T_1$ (Quốc lộ)]))
    circle((0, 0), radius: 0.1, fill: accent)
    content((0, -0.3), text(size: 7pt, [Kho A]))
    
    line((2.5, 0), (5.5, 0), stroke: 1.5pt + rgb("ea580c"), mark: (end: "stealth"))
    content((4.0, 0.35), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [Chặng 2: $T_2$ (Nội đô)]))
    circle((2.5, 0), radius: 0.1, fill: gray)
    content((2.5, -0.3), text(size: 7pt, [Trạm trung chuyển]))
    circle((5.5, 0), radius: 0.1, fill: rgb("16a34a"))
    content((5.5, -0.3), text(size: 7pt, [Điểm giao B]))
  })
]
],
  (
    True([Thời gian di chuyển kỳ vọng trên quốc lộ là $E(T_1) = 25$ phút và qua nội đô là $E(T_2) = 25$ phút.]),
    True([Phương sai thời gian của chặng quốc lộ là $V(T_1) = 15" phút"^2$.]),
    True([Phương sai thời gian của chặng nội đô là $V(T_2) = 40" phút"^2$.]),
    True([Độ lệch chuẩn của tổng thời gian giao hàng toàn tuyến là $sigma(T) = sqrt(55) approx 7","42$ phút.])
  ),
  loigiai: [
    #step([Phương pháp giải])
    1. Tính $E(T_1), E(T_2)$ và $V(T_1), V(T_2)$.
    2. Do hai chặng độc lập: $V(T_1 + T_2) = V(T_1) + V(T_2)$.
    3. Độ lệch chuẩn tổng thời gian: $sigma(T) = sqrt(V(T_1) + V(T_2))$.

    #step([Phân tích ý a])
    $ E(T_1) = 20 dot 0","3 + 25 dot 0","4 + 30 dot 0","3 = 6 + 10 + 9 = 25" phút" $
    $ E(T_2) = 15 dot 0","2 + 25 dot 0","6 + 35 dot 0","2 = 3 + 15 + 7 = 25" phút" $
    Khẳng định ý a là *ĐÚNG*.

    #step([Phân tích ý b])
    Do phân bố của $T_1$ đối xứng qua $25$:
    $ V(T_1) = (20 - 25)^2 dot 0","3 + (25 - 25)^2 dot 0","4 + (30 - 25)^2 dot 0","3 $
    $ V(T_1) = 25 dot 0","3 + 0 + 25 dot 0","3 = 7","5 + 7","5 = 15" phút"^2 $
    Khẳng định ý b là *ĐÚNG*.

    #step([Phân tích ý c])
    Tương tự, phân bố của $T_2$ đối xứng qua $25$:
    $ V(T_2) = (15 - 25)^2 dot 0","2 + (25 - 25)^2 dot 0","6 + (35 - 25)^2 dot 0","2 $
    $ V(T_2) = 100 dot 0","2 + 0 + 100 dot 0","2 = 20 + 20 = 40" phút"^2 $
    Khẳng định ý c là *ĐÚNG*.

    #step([Phân tích ý d])
    Do hai cung đường độc lập:
    $ V(T) = V(T_1 + T_2) = V(T_1) + V(T_2) = 15 + 40 = 55" phút"^2 $
    $ ==> sigma(T) = sqrt(55) approx 7","416" phút" $
    Khẳng định ý d là *ĐÚNG*.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#lt-tln(num: 17, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên rời rạc $X$ có bảng phân bố xác suất:
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$-2$], [$1$], [$3$],
    [$P(X = x)$], [$0","4$], [$0","4$], [$0","2$]
  )
]
Tính chính xác phương sai $V(X)$ của biến ngẫu nhiên $X$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu diễn trục số với cánh tay đòn bình phương
    line((-2.5, 0), (3.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((3.7, 0), text(size: 8pt, [$x$]))
    
    circle((-2, 0), radius: 0.08, fill: accent)
    content((-2, -0.3), text(size: 7.5pt, [$-2$]))
    circle((1, 0), radius: 0.08, fill: accent)
    content((1, -0.3), text(size: 7.5pt, [$1$]))
    circle((3, 0), radius: 0.08, fill: accent)
    content((3, -0.3), text(size: 7.5pt, [$3$]))
    
    // Kỳ vọng E(X) = 0.2
    circle((0.2, 0), radius: 0.08, fill: rgb("ea580c"))
    content((0.2, 0.4), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [$E(X) = 0","2$]))
  })
]
],
    [3.76],
    loigiai: [
        #step([Phương pháp giải])
        1. Tính kỳ vọng $E(X) = sum x_i p_i$.
        2. Tính kỳ vọng bình phương $E(X^2) = sum x_i^2 p_i$.
        3. Phương sai: $V(X) = E(X^2) - [E(X)]^2$.

        #step([Lời giải chi tiết])
        Tính kỳ vọng $E(X)$:
        $ E(X) = (-2) dot 0","4 + 1 dot 0","4 + 3 dot 0","2 = -0","8 + 0","4 + 0","6 = 0","2 $
        Tính kỳ vọng bình phương $E(X^2)$:
        $ E(X^2) = (-2)^2 dot 0","4 + 1^2 dot 0","4 + 3^2 dot 0","2 = 4 dot 0","4 + 1 dot 0","4 + 9 dot 0","2 $
        $ E(X^2) = 1","6 + 0","4 + 1","8 = 3","8 $
        Phương sai:
        $ V(X) = E(X^2) - [E(X)]^2 = 3","8 - (0","2)^2 = 3","8 - 0","04 = 3","76 $
    ]
)

// TLN 2 (Câu 18)
#lt-tln(num: 18, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên rời rạc $X$ nhận 3 giá trị $-1, 0, 1$ với bảng phân bố xác suất đối xứng phụ thuộc tham số $p$ ($0 < p < 0","5$):
#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt + accent,
    [$X$], [$-1$], [$0$], [$1$],
    [$P(X = x)$], [$p$], [$1 - 2p$], [$p$]
  )
]
Biết rằng phương sai của biến ngẫu nhiên bằng $V(X) = 0","4$. Giá trị của tham số $p$ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị hàm V(p) = 2p
    line((-0.2, 0), (2.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((2.7, 0), text(size: 8pt, [$p$]))
    line((0, -0.2), (0, 2), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.2), text(size: 8pt, [$V(p)$]))
    
    // Đường thẳng V = 2p
    line((0, 0), (2.0, 1.8), stroke: 1.5pt + accent)
    
    // Điểm p = 0.2, V = 0.4
    circle((0.8, 0.72), radius: 0.08, fill: rgb("dc2626"))
    line((0.8, 0), (0.8, 0.72), stroke: (dash: "dashed", paint: rgb("dc2626")))
    line((0, 0.72), (0.8, 0.72), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((0.8, -0.3), text(size: 7.5pt, weight: "bold", [$p = 0","2$]))
    content((-0.4, 0.72), text(size: 7.5pt, weight: "bold", [$0","4$]))
  })
]
],
    [0.2],
    loigiai: [
        #step([Phương pháp giải])
        1. Dựa vào tính đối xứng của bảng phân bố để nhận xét kỳ vọng $E(X) = 0$.
        2. Tính $E(X^2)$ theo tham số $p$.
        3. Giải phương trình $V(X) = 0","4$ để tìm $p$.

        #step([Lời giải chi tiết])
        Kỳ vọng của $X$:
        $ E(X) = (-1) dot p + 0 dot (1 - 2 p) + 1 dot p = -p + p = 0 $
        Kỳ vọng bình phương:
        $ E(X^2) = (-1)^2 dot p + 0^2 dot (1 - 2 p) + 1^2 dot p = p + p = 2 p $
        Phương sai:
        $ V(X) = E(X^2) - [E(X)]^2 = 2 p - 0^2 = 2 p $
        Theo đề bài $V(X) = 0","4$:
        $ 2 p = 0","4 <=> p = 0","2 $
        Giá trị $p = 0","2$ thỏa mãn điều kiện $0 < p < 0","5$.
    ]
)

// TLN 3 (Câu 19)
#lt-tln(num: 19, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên rời rạc $X$ có phương sai $V(X) = 3","6$. Xét biến ngẫu nhiên $Y = -2","5 X + 7$. Phương sai $V(Y)$ có giá trị bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa hệ số khuếch đại phương sai a^2 = 6.25
    rect((-1.5, -0.5), (1.5, 0.5), stroke: 1pt + accent, fill: accent.lighten(85%))
    content((0, 0), text(size: 8pt, weight: "bold", fill: accent, [$V(X) = 3","6$]))
    
    line((1.5, 0), (3.0, 0), stroke: 1.2pt + rgb("ea580c"), mark: (end: "stealth"))
    content((2.25, 0.35), text(size: 7pt, fill: rgb("ea580c"), [$times (-2","5)^2 = 6","25$]))
    
    rect((3.0, -0.5), (6.0, 0.5), stroke: 1pt + rgb("ea580c"), fill: rgb("ea580c").lighten(85%))
    content((4.5, 0), text(size: 8pt, weight: "bold", fill: rgb("ea580c"), [$V(Y) = 22","5$]))
  })
]
],
    [22.5],
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng tính chất phương sai của biến đổi affine $Y = a X + b$:
        $ V(a X + b) = a^2 V(X) $

        #step([Lời giải chi tiết])
        Với $Y = -2","5 X + 7$, ta có $a = -2","5$.
        $ V(Y) = (-2","5)^2 dot V(X) = 6","25 dot 3","6 $
        Thực hiện phép tính:
        $ 6","25 dot 3","6 = 22","5 $
    ]
)

// TLN 4 (Câu 20)
#lt-tln(num: 20, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Hai tài sản tài chính $X$ và $Y$ có biến động độc lập với nhau, có độ lệch chuẩn lợi nhuận lần lượt là $sigma_X = 6%$ và $sigma_Y = 8%$. Nhà đầu tư muốn xây dựng danh mục $R_p = w X + (1 - w) Y$ sao cho phương sai của danh mục đạt mức tối thiểu. Tỷ trọng $w$ cần đầu tư vào tài sản $X$ bằng bao nhiêu? (Nhập kết quả dưới dạng số thập phân, ví dụ 0.55).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ đồ thị tỷ trọng w tối ưu
    line((-0.5, 0), (4.5, 0), stroke: 1pt + accent, mark: (end: "stealth"))
    content((4.7, 0), text(size: 8pt, [$w$]))
    line((0, -0.3), (0, 2.5), stroke: 1pt + accent, mark: (end: "stealth"))
    content((0, 2.7), text(size: 8pt, [$V(w)$]))
    
    // Parabol với w* = 0.64
    line((0, 2.2), (1.0, 1.2), (2.24, 0.8), (3.0, 1.0), (3.5, 1.3), stroke: 1.5pt + accent)
    circle((2.24, 0.8), radius: 0.08, fill: rgb("dc2626"))
    line((2.24, 0), (2.24, 0.8), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((2.24, -0.3), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"), [$w = 0","64$]))
  })
]
],
    [0.64],
    loigiai: [
        #step([Phương pháp giải])
        Phương sai danh mục của hai tài sản độc lập:
        $ V(R_p) = w^2 sigma_X^2 + (1 - w)^2 sigma_Y^2 $
        Để phương sai nhỏ nhất, lấy đạo hàm theo $w$ và cho bằng $0$:
        $ 2 w sigma_X^2 - 2 (1 - w) sigma_Y^2 = 0 <=> w (sigma_X^2 + sigma_Y^2) = sigma_Y^2 $
        $ ==> w^* = frac(sigma_Y^2, sigma_X^2 + sigma_Y^2) $

        #step([Lời giải chi tiết])
        Ta có $sigma_X = 6 ==> sigma_X^2 = 36$ và $sigma_Y = 8 ==> sigma_Y^2 = 64$.
        Tỷ trọng tối ưu đầu tư vào tài sản $X$ là:
        $ w^* = frac(64, 36 + 64) = frac(64, 100) = 0","64 $
        (tức là phân bổ $64%$ vốn vào tài sản X và $36%$ vốn vào tài sản Y).
    ]
)

// TLN 5 (Câu 21)
#lt-tln(num: 21, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Một dây chuyền đóng gói bánh kẹo tự động đóng các hộp bánh với khối lượng mỗi hộp là một biến ngẫu nhiên có độ lệch chuẩn $sigma_0 = 5" gam"$. Người ta đóng $16$ hộp bánh độc lập vào một thùng hàng lớn. Độ lệch chuẩn của tổng khối lượng $16$ hộp bánh trong thùng bằng bao nhiêu gam?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa thùng hàng 4x4 hộp bánh
    rect((-1.5, -1.5), (1.5, 1.5), stroke: 1.5pt + accent, fill: accent.lighten(90%))
    content((0, 1.8), text(size: 8pt, weight: "bold", fill: accent, [Thùng chứa 16 hộp bánh độc lập]))
    for i in range(4) {
      for j in range(4) {
        rect((-1.3 + i * 0.7, -1.3 + j * 0.7), (-0.8 + i * 0.7, -0.8 + j * 0.7), fill: accent.lighten(40%), stroke: 0.5pt + accent)
      }
    }
  })
]
],
    [20],
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X_1, X_2, ..., X_(16)$ là khối lượng của $16$ hộp bánh độc lập.
        Tổng khối lượng là $S_(16) = sum_(i=1)^(16) X_i$.
        Phương sai của tổng: $V(S_(16)) = sum_(i=1)^(16) V(X_i) = n sigma_0^2$.
        Độ lệch chuẩn của tổng: $sigma(S_(16)) = sqrt(n sigma_0^2) = sqrt(n) dot sigma_0$.

        #step([Lời giải chi tiết])
        Với $n = 16$ và $sigma_0 = 5" gam"$:
        $ V(S_(16)) = 16 dot 5^2 = 16 dot 25 = 400 $
        Độ lệch chuẩn của tổng khối lượng là:
        $ sigma(S_(16)) = sqrt(400) = sqrt(16) dot 5 = 4 dot 5 = 20" gam" $
    ]
)

// TLN 6 (Câu 22)
#lt-tln(num: 22, de: [Đề cd03C — Mã 523], back-to: "sec-exercise-hub",[Doanh thu bán hàng trong tuần lễ khuyến mãi của một siêu thị là biến ngẫu nhiên $X$ có kỳ vọng $E(X) = 150$ triệu đồng và độ lệch chuẩn $sigma(X) = 24$ triệu đồng. Hệ số biến thiên $C V = frac(sigma(X), E(X))$ của doanh thu siêu thị bằng bao nhiêu phần trăm? (Chỉ ghi số phần trăm, ví dụ ghi 16 nếu là 16%).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình thanh tỷ lệ CV = 24 / 150 = 16%
    rect((-2, -0.4), (2, 0.4), stroke: 1pt + accent, fill: white)
    rect((-2, -0.4), (-1.36, 0.4), fill: rgb("ea580c"), stroke: none)
    content((-1.68, 0), text(size: 7.5pt, fill: white, weight: "bold", [16%]))
    content((0.4, 0), text(size: 7.5pt, fill: accent, [E(X) = 150 triệu]))
    content((0, -0.8), text(size: 7.5pt, fill: rgb("ea580c"), weight: "bold", [$sigma(X) = 24" triệu" ==> C V = 16%$]))
  })
]
],
    [16],
    loigiai: [
        #step([Phương pháp giải])
        Hệ số biến thiên (Coefficient of Variation) biểu thị bằng phần trăm:
        $ C V = frac(sigma(X), E(X)) dot 100% $

        #step([Lời giải chi tiết])
        Thay số liệu:
        $ C V = frac(24, 150) dot 100% = 0","16 dot 100% = 16% $
        Số cần điền là $16$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ĐỀ ÔN TẬP CHUYÊN ĐỀ 3C: PHƯƠNG SAI V(X), ĐỘ LỆCH CHUẨN SIGMA(X) & ĐO LƯỜNG MỨC ĐỘ RỦI RO!]      #v(0.6em)
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
