// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ĐỀ ÔN TẬP CHUYÊN ĐỀ 3F: BIẾN NGẪU NHIÊN ĐỘC LẬP, TỔNG & HIỆU BIẾN NGẪU NHIÊN RỜI RẠC
// Lớp: Khối 12  ·  Mã đề: 526  ·  GV: Nguyễn Văn Sang
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
  title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3F: BIẾN NGẪU NHIÊN ĐỘC LẬP, TỔNG & HIỆU BIẾN NGẪU NHIÊN RỜI RẠC",
  subtitle: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG — MÃ ĐỀ: 526",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 526]],
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
#lt-tn(num: 1, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Hai biến ngẫu nhiên rời rạc $X$ và $Y$ được gọi là độc lập với nhau khi và chỉ khi với mọi giá trị $x_i$ của $X$ và mọi giá trị $y_j$ của $Y$, ta luôn có:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hộp định nghĩa hai biến độc lập
    rect((-3.5, -0.8), (3.5, 0.8), stroke: 1.2pt + accent, fill: accent.lighten(92%), radius: 0.15)
    content((0, 0.35), text(size: 9.5pt, weight: "bold", fill: accent, [Định nghĩa: Hai biến ngẫu nhiên X và Y độc lập]))
    content((0, -0.25), text(size: 9.5pt, weight: "bold", fill: rgb("1e3a8a"), [$P(X = x_i, Y = y_j) = P(X = x_i) dot P(Y = y_j)$]))
  })
]
],
    (
        [$P(X = x_i, Y = y_j) = P(X = x_i) + P(Y = y_j)$],
        True([$P(X = x_i, Y = y_j) = P(X = x_i) dot P(Y = y_j)$]),
        [$E(X + Y) = E(X) dot E(Y)$],
        [$V(X + Y) = V(X) - V(Y)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo định nghĩa trong Chuyên đề học tập Toán 12:
        Hai biến ngẫu nhiên rời rạc $X$ và $Y$ là độc lập với nhau nếu biến cố $X = x_i$ và biến cố $Y = y_j$ độc lập với nhau với mọi cặp giá trị $(x_i, y_j)$, nghĩa là:
        $ P(X = x_i, Y = y_j) = P(X = x_i) dot P(Y = y_j) $

        #step([Lời giải chi tiết])
        Do đó, phương án đúng là $P(X = x_i, Y = y_j) = P(X = x_i) dot P(Y = y_j)$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho $X$ và $Y$ là hai biến ngẫu nhiên rời rạc tùy ý (không nhất thiết độc lập) có kỳ vọng lần lượt là $E(X) = 8$ và $E(Y) = 14$. Kỳ vọng của biến ngẫu nhiên tổng $Z = X + Y$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tính chất cộng kỳ vọng
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: accent, [E(X) = 8]))
    content((-1.5, -0.25), text(size: 7.5pt, [E(Y) = 14]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [E(X + Y) = E(X) + E(Y)]))
    content((1.5, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [E(Z) = 8 + 14 = 22]))
  })
]
],
    (
        [$112$],
        [$6$],
        True([$22$]),
        [Không xác định được vì chưa biết $X, Y$ có độc lập hay không]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tính chất tuyến tính của kỳ vọng toán học:
        Với *mọi* biến ngẫu nhiên $X$ và $Y$ (dù độc lập hay phụ thuộc), ta luôn có:
        $ E(X + Y) = E(X) + E(Y) $

        #step([Lời giải chi tiết])
        Thay số vào công thức:
        $ E(X + Y) = 8 + 14 = 22 $
        Vậy kỳ vọng của tổng luôn bằng $22$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho hai biến ngẫu nhiên rời rạc $X$ và $Y$ độc lập với nhau, có phương sai lần lượt là $V(X) = 16$ và $V(Y) = 9$. Phương sai của biến ngẫu nhiên hiệu $D = X - Y$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa phương sai của hiệu khi độc lập
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1.2pt + accent, fill: accent.lighten(94%), radius: 0.12)
    content((0, 0.3), text(size: 8.5pt, weight: "bold", fill: accent, [Khi X, Y độc lập: V(X - Y) = V(X) + (-1)^2 V(Y)]))
    content((0, -0.25), text(size: 9pt, weight: "bold", fill: rgb("b91c1c"), [V(X - Y) = 16 + 9 = 25]))
  })
]
],
    (
        [$7$],
        True([$25$]),
        [$sqrt(7)$],
        [$5$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi $X$ và $Y$ là hai biến ngẫu nhiên độc lập:
        $ V(a X + b Y) = a^2 V(X) + b^2 V(Y) $
        Với hiệu $D = X - Y$, ta có $a = 1, b = -1$.

        #step([Lời giải chi tiết])
        Áp dụng công thức:
        $ V(X - Y) = 1^2 dot V(X) + (-1)^2 dot V(Y) = V(X) + V(Y) $
        Thay số:
        $ V(X - Y) = 16 + 9 = 25 $
        (Lưu ý: phương sai của hiệu luôn bằng tổng phương sai vì dấu trừ được bình phương thành dấu cộng).
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một công ty có hai cửa hàng bán lẻ hoạt động hoàn toàn độc lập. Gọi $X$ là số lượng khách mua hàng trong một ngày tại cửa hàng 1, có $E(X) = 40$ khách, $V(X) = 12$. Gọi $Y$ là số lượng khách mua hàng trong một ngày tại cửa hàng 2, có $E(Y) = 60$ khách, $V(Y) = 13$. Độ lệch chuẩn của tổng số khách mua hàng trong ngày tại cả hai cửa hàng bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai cửa hàng bán lẻ độc lập
    rect((-2.8, -0.6), (-0.3, 0.6), stroke: 1pt + accent, fill: accent.lighten(92%), radius: 0.1)
    content((-1.55, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Cửa hàng 1]))
    content((-1.55, -0.25), text(size: 7.5pt, [E = 40; V = 12]))
    
    content((0, 0), text(size: 10pt, weight: "bold", fill: accent, [+]))
    
    rect((0.3, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(92%), radius: 0.1)
    content((1.55, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Cửa hàng 2]))
    content((1.55, -0.25), text(size: 7.5pt, [E = 60; V = 13]))
  })
]
],
    (
        [$25$],
        [$sqrt(12) + sqrt(13)$],
        True([$5$]),
        [$1$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Vì hai cửa hàng hoạt động độc lập nên biến ngẫu nhiên $X$ và $Y$ độc lập.
        2. Phương sai của tổng: $V(X + Y) = V(X) + V(Y)$.
        3. Độ lệch chuẩn của tổng: $sigma(X + Y) = sqrt(V(X + Y))$.

        #step([Lời giải chi tiết])
        Phương sai của tổng số khách:
        $ V(X + Y) = 12 + 13 = 25 $
        Độ lệch chuẩn:
        $ sigma(X + Y) = sqrt(25) = 5 " (khách)" $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho hai biến ngẫu nhiên độc lập $X$ và $Y$ có các tham số: $E(X) = 3, V(X) = 4$ và $E(Y) = -2, V(Y) = 1$. Xét biến ngẫu nhiên $Z = 2 X - 3 Y + 5$. Kỳ vọng $E(Z)$ và phương sai $V(Z)$ lần lượt là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình biến đổi tuyến tính Z = 2X - 3Y + 5
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [E(Z) = 2E(X) - 3E(Y) + 5]))
    content((-1.6, -0.25), text(size: 8pt, fill: rgb("15803d"), [E(Z) = 2(3) - 3(-2) + 5 = 17]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("b45309"), [V(Z) = 2^2 V(X) + (-3)^2 V(Y)]))
    content((1.6, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [V(Z) = 4(4) + 9(1) = 25]))
  })
]
],
    (
        [$E(Z) = 17$ và $V(Z) = 7$],
        [$E(Z) = 5$ và $V(Z) = 25$],
        True([$E(Z) = 17$ và $V(Z) = 25$]),
        [$E(Z) = 17$ và $V(Z) = 30$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng tính chất của kỳ vọng và phương sai đối với tổ hợp tuyến tính của các biến ngẫu nhiên độc lập:
        $ E(a X + b Y + c) = a E(X) + b E(Y) + c $
        $ V(a X + b Y + c) = a^2 V(X) + b^2 V(Y) $

        #step([Lời giải chi tiết])
        Tính kỳ vọng:
        $ E(Z) = 2 E(X) - 3 E(Y) + 5 = 2 dot 3 - 3 dot (-2) + 5 = 6 + 6 + 5 = 17 $
        Tính phương sai:
        $ V(Z) = 2^2 dot V(X) + (-3)^2 dot V(Y) = 4 dot 4 + 9 dot 1 = 16 + 9 = 25 $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Hai xạ thủ A và B thi đấu bắn súng độc lập. Xạ thủ A bắn $n_1 = 10$ phát với xác suất trúng mỗi phát là $p_1 = 0","8$. Xạ thủ B bắn $n_2 = 12$ phát với xác suất trúng mỗi phát là $p_2 = 0","75$. Gọi $X$ và $Y$ lần lượt là số phát bắn trúng của xạ thủ A và B. Kỳ vọng tổng số phát trúng $E(X + Y)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai bia bắn của 2 xạ thủ
    circle((-1.5, 0), radius: 0.8, stroke: 1pt + accent, fill: accent.lighten(88%))
    circle((-1.5, 0), radius: 0.4, stroke: 0.6pt + accent, fill: accent.lighten(70%))
    content((-1.5, -1.1), text(size: 7.5pt, weight: "bold", fill: accent, [Xạ thủ A: 10 phát, p = 0,8]))
    
    circle((1.5, 0), radius: 0.8, stroke: 1pt + rgb("b45309"), fill: rgb("fed7aa"))
    circle((1.5, 0), radius: 0.4, stroke: 0.6pt + rgb("b45309"), fill: rgb("fdba74"))
    content((1.5, -1.1), text(size: 7.5pt, weight: "bold", fill: rgb("b45309"), [Xạ thủ B: 12 phát, p = 0,75]))
  })
]
],
    (
        [$15$],
        [$16$],
        True([$17$]),
        [$18$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số phát bắn trúng của xạ thủ A: $X ~ B(10; 0","8)$.
        Số phát bắn trúng của xạ thủ B: $Y ~ B(12; 0","75)$.
        Kỳ vọng tổng số phát bắn trúng: $E(X + Y) = E(X) + E(Y)$.

        #step([Lời giải chi tiết])
        Ta có:
        $ E(X) = n_1 p_1 = 10 dot 0","8 = 8 $
        $ E(Y) = n_2 p_2 = 12 dot 0","75 = 9 $
        Kỳ vọng tổng số phát trúng:
        $ E(X + Y) = E(X) + E(Y) = 8 + 9 = 17 " (phát)" $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một dự án xây dựng gồm hai giai đoạn thi công độc lập và liên tiếp. Thời gian hoàn thành giai đoạn 1 là biến ngẫu nhiên $T_1$ (ngày) với $E(T_1) = 20, sigma(T_1) = 3$. Thời gian hoàn thành giai đoạn 2 là biến ngẫu nhiên $T_2$ (ngày) với $E(T_2) = 30, sigma(T_2) = 4$. Độ lệch chuẩn của tổng thời gian hoàn thành toàn bộ dự án $T = T_1 + T_2$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ Gantt 2 giai đoạn dự án
    rect((-3.0, -0.3), (-0.2, 0.3), stroke: 1pt + accent, fill: accent.lighten(85%), radius: 0.08)
    content((-1.6, 0), text(size: 8pt, weight: "bold", fill: accent, [Giai đoạn 1: T_1]))
    
    rect((0.2, -0.3), (3.0, 0.3), stroke: 1pt + rgb("15803d"), fill: rgb("dcfce7"), radius: 0.08)
    content((1.6, 0), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Giai đoạn 2: T_2]))
    
    content((0, -0.7), text(size: 7.5pt, fill: gray.darken(20%), [Độc lập: σ(T) = sqrt(3^2 + 4^2) = 5 ngày]))
  })
]
],
    (
        [$7$ ngày],
        True([$5$ ngày]),
        [$sqrt(7)$ ngày],
        [$25$ ngày]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Từ độ lệch chuẩn tính phương sai từng giai đoạn: $V(T_1) = sigma(T_1)^2$, $V(T_2) = sigma(T_2)^2$.
        2. Vì hai giai đoạn độc lập nên phương sai tổng bằng tổng hai phương sai: $V(T) = V(T_1) + V(T_2)$.
        3. Độ lệch chuẩn tổng: $sigma(T) = sqrt(V(T))$.

        #step([Lời giải chi tiết])
        Ta có:
        $ V(T_1) = 3^2 = 9 $
        $ V(T_2) = 4^2 = 16 $
        Do $T_1, T_2$ độc lập nên:
        $ V(T) = V(T_1 + T_2) = V(T_1) + V(T_2) = 9 + 16 = 25 $
        Độ lệch chuẩn:
        $ sigma(T) = sqrt(25) = 5 " (ngày)" $
        (Chú ý: $sigma(T_1 + T_2) != sigma(T_1) + sigma(T_2) = 7$).
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Nếu hai biến ngẫu nhiên rời rạc $X$ và $Y$ độc lập với nhau thì kỳ vọng của tích $E(X dot Y)$ thỏa mãn hệ thức nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hộp công thức kỳ vọng tích
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Khi X và Y độc lập]))
    content((0, -0.2), text(size: 9pt, weight: "bold", fill: rgb("15803d"), [E(X . Y) = E(X) . E(Y)]))
  })
]
],
    (
        [$E(X dot Y) = E(X) + E(Y)$],
        True([$E(X dot Y) = E(X) dot E(Y)$]),
        [$E(X dot Y) = V(X) dot V(Y)$],
        [$E(X dot Y) = E(X)^2 + E(Y)^2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo định lý về tính chất của kỳ vọng đối với các biến ngẫu nhiên độc lập:
        Nếu $X$ và $Y$ độc lập thì:
        $ E(X dot Y) = sum_(i) sum_(j) x_i y_j P(X = x_i, Y = y_j) = (sum_i x_i P(X = x_i)) (sum_j y_j P(Y = y_j)) = E(X) dot E(Y) $

        #step([Lời giải chi tiết])
        Do đó hệ thức đúng là $E(X dot Y) = E(X) dot E(Y)$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Hai bóng đèn sợi đốt $Đ_1$ và $Đ_2$ được lắp vào cùng một mạch điện. Số lần hỏng trong năm của đèn $Đ_1$ là $X$, của đèn $Đ_2$ là $Y$ (hai đèn hoạt động độc lập). Cho biết phân bố của $X$ có $E(X) = 1","2, V(X) = 0","8$ và của $Y$ có $E(Y) = 1","8, V(Y) = 1","2$. Phương sai của biến ngẫu nhiên $W = 3 X + 2 Y$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình mạch hai bóng đèn
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [W = 3X + 2Y (X, Y độc lập)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [V(W) = 3^2 . 0,8 + 2^2 . 1,2 = 7,2 + 4,8 = 12]))
  })
]
],
    (
        [$4","8$],
        [$7","2$],
        True([$12$]),
        [$14","4$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Vì $X$ và $Y$ độc lập nên:
        $ V(a X + b Y) = a^2 V(X) + b^2 V(Y) $

        #step([Lời giải chi tiết])
        Với $a = 3$ và $b = 2$:
        $ V(W) = 3^2 dot V(X) + 2^2 dot V(Y) = 9 dot 0","8 + 4 dot 1","2 = 7","2 + 4","8 = 12 $
        Vậy phương sai của $W$ bằng $12$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một nhà đầu tư phân bổ nguồn vốn $100$ triệu đồng vào hai kênh đầu tư độc lập $A$ và $B$. Tỷ suất sinh lời của kênh $A$ là biến ngẫu nhiên $R_A$ (%) có $E(R_A) = 12, sigma(R_A) = 6$. Tỷ suất sinh lời của kênh $B$ là biến ngẫu nhiên $R_B$ (%) có $E(R_B) = 12, sigma(R_B) = 8$. Nếu chia đều vốn đầu tư (mỗi kênh $50$ triệu đồng), tỷ suất sinh lời của danh mục $R_p = 0","5 R_A + 0","5 R_B$ có độ lệch chuẩn bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa đa dạng hóa danh mục Markowitz
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.2), text(size: 8pt, weight: "bold", fill: accent, [Kênh A: σ = 6%]))
    content((-1.5, -0.25), text(size: 8pt, weight: "bold", fill: accent, [Kênh B: σ = 8%]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.5, 0.2), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Danh mục 50/50]))
    content((1.5, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [σ_p = 5% (giảm rủi ro)]))
  })
]
],
    (
        [$7%$],
        True([$5%$]),
        [$10%$],
        [$3","5%$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính phương sai danh mục $R_p = 0","5 R_A + 0","5 R_B$ khi $R_A, R_B$ độc lập:
           $ V(R_p) = (0","5)^2 V(R_A) + (0","5)^2 V(R_B) $
        2. Lấy căn bậc hai tính độ lệch chuẩn danh mục $sigma(R_p) = sqrt(V(R_p))$.

        #step([Lời giải chi tiết])
        Ta có $V(R_A) = 6^2 = 36$ và $V(R_B) = 8^2 = 64$.
        Phương sai của danh mục:
        $ V(R_p) = 0","25 dot 36 + 0","25 dot 64 = 9 + 16 = 25 $
        Độ lệch chuẩn:
        $ sigma(R_p) = sqrt(25) = 5 (%) $
        (Nhận xét: Độ lệch chuẩn của danh mục là $5%$, nhỏ hơn cả hai tài sản riêng lẻ $6%$ và $8%$, minh họa hiệu quả giảm thiểu rủi ro nhờ đa dạng hóa đầu tư).
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một hộ gia đình sử dụng điện cho hai mục đích: sinh hoạt và kinh doanh tiệm tạp hóa. Lượng điện tiêu thụ hàng tháng cho sinh hoạt là $X$ (kWh) có $E(X) = 250, sigma(X) = 30$. Lượng điện tiêu thụ cho kinh doanh là $Y$ (kWh) có $E(Y) = 450, sigma(Y) = 40$. Giả sử $X$ và $Y$ độc lập nhau. Kỳ vọng và độ lệch chuẩn của tổng lượng điện tiêu thụ $S = X + Y$ trong tháng lần lượt là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tiêu thụ điện năng
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: accent, [Sinh hoạt: E = 250, σ = 30]))
    content((-1.5, -0.25), text(size: 7.5pt, [Kinh doanh: E = 450, σ = 40]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [E(S) = 700 kWh]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [σ(S) = 50 kWh]))
  })
]
],
    (
        [$E(S) = 700$ kWh và $sigma(S) = 70$ kWh],
        True([$E(S) = 700$ kWh và $sigma(S) = 50$ kWh]),
        [$E(S) = 700$ kWh và $sigma(S) = 2500$ kWh],
        [$E(S) = 600$ kWh và $sigma(S) = 50$ kWh]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Kỳ vọng của tổng: $E(S) = E(X) + E(Y)$.
        Phương sai của tổng: $V(S) = V(X) + V(Y) = sigma(X)^2 + sigma(Y)^2$.
        Độ lệch chuẩn: $sigma(S) = sqrt(V(S))$.

        #step([Lời giải chi tiết])
        Kỳ vọng:
        $ E(S) = 250 + 450 = 700 " (kWh)" $
        Phương sai:
        $ V(S) = 30^2 + 40^2 = 900 + 1600 = 2500 $
        Độ lệch chuẩn:
        $ sigma(S) = sqrt(2500) = 50 " (kWh)" $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho ba biến ngẫu nhiên $X_1, X_2, X_3$ đôi một độc lập và có cùng phân bố xác suất với kỳ vọng $mu$ và phương sai $sigma^2$. Xét biến ngẫu nhiên trung bình cộng $bar(X) = frac(X_1 + X_2 + X_3, 3)$. Phương sai của $bar(X)$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình trung bình cộng mẫu
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Trung bình mẫu 3 biến độc lập: X_tb = (X1 + X2 + X3)/3]))
    content((0, -0.25), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [V(X_tb) = (1/9) . (σ^2 + σ^2 + σ^2) = σ^2 / 3]))
  })
]
],
    (
        [$V(bar(X)) = sigma^2$],
        [$V(bar(X)) = 3 sigma^2$],
        True([$V(bar(X)) = frac(sigma^2, 3)$]),
        [$V(bar(X)) = frac(sigma^2, 9)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Sử dụng tính chất phương sai của tích một số với biến ngẫu nhiên và phương sai của tổng các biến độc lập:
        $ V(c Y) = c^2 V(Y) $
        $ V(Y_1 + Y_2 + Y_3) = V(Y_1) + V(Y_2) + V(Y_3) $ khi $Y_i$ độc lập.

        #step([Lời giải chi tiết])
        Ta có:
        $ V(bar(X)) = V(frac(1, 3)(X_1 + X_2 + X_3)) = (frac(1, 3))^2 V(X_1 + X_2 + X_3) $
        Vì $X_1, X_2, X_3$ đôi một độc lập nên:
        $ V(X_1 + X_2 + X_3) = V(X_1) + V(X_2) + V(X_3) = sigma^2 + sigma^2 + sigma^2 = 3 sigma^2 $
        Do đó:
        $ V(bar(X)) = frac(1, 9) dot (3 sigma^2) = frac(sigma^2, 3) $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho bảng phân bố xác suất đồng thời của hai biến ngẫu nhiên rời rạc $X$ (nhận giá trị trong tập ${1; 2}$) và $Y$ (nhận giá trị trong tập ${0; 1}$) như sau:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [$X backslash Y$], [$Y = 0$], [$Y = 1$],
    [$X = 1$], [$0","2$], [$0","3$],
    [$X = 2$], [$0","2$], [$0","3$]
  )
]
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kiểm tra độc lập qua bảng 2x2
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [P(X = 1) = 0,5; P(X = 2) = 0,5]))
    content((-1.5, -0.25), text(size: 8pt, weight: "bold", fill: accent, [P(Y = 0) = 0,4; P(Y = 1) = 0,6]))
    line((0.3, -0.4), (0.3, 0.4), stroke: 0.8pt + gray)
    content((1.8, 0.15), text(size: 7.5pt, fill: rgb("15803d"), [P(1, 0) = 0,5 . 0,4 = 0,2]))
    content((1.8, -0.25), text(size: 7.5pt, fill: rgb("15803d"), [==> X và Y độc lập]))
  })
]
],
    (
        True([Bảng phân bố xác suất biên của $X$ là $P(X = 1) = 0","5$ và $P(X = 2) = 0","5$.]),
        True([Bảng phân bố xác suất biên của $Y$ là $P(Y = 0) = 0","4$ và $P(Y = 1) = 0","6$.]),
        True([Hai biến ngẫu nhiên $X$ và $Y$ độc lập với nhau.]),
        False([Kỳ vọng của biến ngẫu nhiên tổng $E(X + Y)$ bằng $2","3$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Phân bố xác suất biên của $X$: $P(X = x_i) = sum_j P(X = x_i, Y = y_j)$.
        2. Phân bố xác suất biên của $Y$: $P(Y = y_j) = sum_i P(X = x_i, Y = y_j)$.
        3. Kiểm tra tính độc lập: $P(X = x_i, Y = y_j) = P(X = x_i) dot P(Y = y_j)$ với mọi cặp $(i, j)$.
        4. Tính kỳ vọng: $E(X + Y) = E(X) + E(Y)$.

        #step([Phân tích ý a])
        Ta có:
        $ P(X = 1) = 0","2 + 0","3 = 0","5 $
        $ P(X = 2) = 0","2 + 0","3 = 0","5 $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Ta có:
        $ P(Y = 0) = 0","2 + 0","2 = 0","4 $
        $ P(Y = 1) = 0","3 + 0","3 = 0","6 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Kiểm tra tích xác suất biên với các ô:
        - $P(X = 1) dot P(Y = 0) = 0","5 dot 0","4 = 0","2 = P(X = 1, Y = 0)$.
        - $P(X = 1) dot P(Y = 1) = 0","5 dot 0","6 = 0","3 = P(X = 1, Y = 1)$.
        - $P(X = 2) dot P(Y = 0) = 0","5 dot 0","4 = 0","2 = P(X = 2, Y = 0)$.
        - $P(X = 2) dot P(Y = 1) = 0","5 dot 0","6 = 0","3 = P(X = 2, Y = 1)$.
        Đẳng thức thỏa mãn trên tất cả các ô, do đó $X$ và $Y$ độc lập.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tính kỳ vọng:
        $ E(X) = 1 dot 0","5 + 2 dot 0","5 = 1","5 $
        $ E(Y) = 0 dot 0","4 + 1 dot 0","6 = 0","6 $
        Kỳ vọng của tổng:
        $ E(X + Y) = E(X) + E(Y) = 1","5 + 0","6 = 2","1 $
        Giá trị $2","3$ trong đề bài là sai.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một công ty dịch vụ chuyển phát nhanh có hai xe tải $A$ và $B$ chuyên chở hàng giữa hai thành phố. Số vụ hỏng hóc kỹ thuật trong một tháng của xe $A$ là biến ngẫu nhiên $X$, của xe $B$ là biến ngẫu nhiên $Y$. Giả thiết $X$ và $Y$ là hai biến ngẫu nhiên độc lập, có các đặc trưng số:
$ E(X) = 1","5; quad V(X) = 0","75 $
$ E(Y) = 2","0; quad V(Y) = 1","00 $
Chi phí sửa chữa mỗi vụ hỏng của xe $A$ là $4$ triệu đồng, của xe $B$ là $5$ triệu đồng. Gọi $C$ là tổng chi phí sửa chữa hỏng hóc kỹ thuật trong tháng của cả hai xe: $C = 4 X + 5 Y$ (đơn vị: triệu đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình chi phí sửa chữa 2 xe
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Xe A: E = 1,5; V = 0,75]))
    content((-1.6, -0.25), text(size: 7.5pt, [Chi phí: 4X triệu]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [Xe B: E = 2,0; V = 1,00]))
    content((1.6, -0.25), text(size: 7.5pt, [Chi phí: 5Y triệu]))
  })
]
],
    (
        True([Kỳ vọng tổng số vụ hỏng hóc kỹ thuật trong tháng của cả hai xe là $E(X + Y) = 3","5$ vụ.]),
        True([Phương sai của tổng số vụ hỏng hóc là $V(X + Y) = 1","75$.]),
        True([Kỳ vọng tổng chi phí sửa chữa trong tháng là $E(C) = 16$ triệu đồng.]),
        False([Độ lệch chuẩn của tổng chi phí sửa chữa là $sigma(C) = 6$ triệu đồng.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tổng số vụ hỏng hóc: $S = X + Y$. Do $X, Y$ độc lập nên $E(S) = E(X) + E(Y)$ và $V(S) = V(X) + V(Y)$.
        2. Tổng chi phí $C = 4 X + 5 Y$.
           $E(C) = 4 E(X) + 5 E(Y)$.
           $V(C) = 4^2 V(X) + 5^2 V(Y)$ (do $X, Y$ độc lập).
           $sigma(C) = sqrt(V(C))$.

        #step([Phân tích ý a])
        $ E(X + Y) = E(X) + E(Y) = 1","5 + 2","0 = 3","5 " (vụ)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Vì $X$ và $Y$ độc lập:
        $ V(X + Y) = V(X) + V(Y) = 0","75 + 1","00 = 1","75 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Kỳ vọng chi phí:
        $ E(C) = 4 E(X) + 5 E(Y) = 4 dot 1","5 + 5 dot 2","0 = 6 + 10 = 16 " (triệu đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Phương sai của tổng chi phí:
        $ V(C) = 4^2 dot V(X) + 5^2 dot V(Y) = 16 dot 0","75 + 25 dot 1","00 = 12 + 25 = 37 $
        Độ lệch chuẩn:
        $ sigma(C) = sqrt(37) approx 6","0828 != 6 $
        Do đó khẳng định $sigma(C) = 6$ là sai.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Hai dây chuyền sản xuất đồ uống đóng chai hoạt động hoàn toàn độc lập. Dây chuyền $1$ đóng $n_1 = 500$ chai với xác suất bị lỗi thể tích là $p_1 = 0","02$. Dây chuyền $2$ đóng $n_2 = 800$ chai với xác suất bị lỗi thể tích là $p_2 = 0","01$. Gọi $X_1$ và $X_2$ lần lượt là số chai bị lỗi thể tích của dây chuyền $1$ và dây chuyền $2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai dây chuyền đóng chai
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Dây chuyền 1: B(500; 0,02)]))
    content((-1.5, -0.25), text(size: 7.5pt, [E = 10; V = 9,8]))
    line((0.2, -0.5), (0.2, 0.5), stroke: 0.8pt + gray)
    content((1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [Dây chuyền 2: B(800; 0,01)]))
    content((1.6, -0.25), text(size: 7.5pt, [E = 8; V = 7,92]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X_1$ tuân theo phân bố nhị thức $B(500; 0","02)$ và $X_2$ tuân theo $B(800; 0","01)$.]),
        True([Kỳ vọng số chai bị lỗi của dây chuyền $1$ là $E(X_1) = 10$ chai và của dây chuyền $2$ là $E(X_2) = 8$ chai.]),
        True([Kỳ vọng tổng số chai bị lỗi của cả hai dây chuyền là $E(X_1 + X_2) = 18$ chai.]),
        False([Phương sai của hiệu số chai bị lỗi giữa hai dây chuyền là $V(X_1 - X_2) = 1","88$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Nhận dạng phân bố nhị thức cho mỗi dây chuyền.
        2. Tính kỳ vọng và phương sai từng biến: $E = n p, V = n p (1 - p)$.
        3. Sử dụng tính chất của biến độc lập đối với tổng và hiệu:
           $ E(X_1 + X_2) = E(X_1) + E(X_2) $
           $ V(X_1 - X_2) = V(X_1) + V(X_2) $

        #step([Phân tích ý a])
        Vì mỗi chai được đóng độc lập với tỷ lệ lỗi cố định nên:
        $ X_1 ~ B(500; 0","02) " và " X_2 ~ B(800; 0","01) $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Kỳ vọng:
        $ E(X_1) = 500 dot 0","02 = 10 " (chai)" $
        $ E(X_2) = 800 dot 0","01 = 8 " (chai)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Kỳ vọng tổng số chai lỗi:
        $ E(X_1 + X_2) = E(X_1) + E(X_2) = 10 + 8 = 18 " (chai)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tính phương sai từng biến:
        $ V(X_1) = 500 dot 0","02 dot 0","98 = 9","8 $
        $ V(X_2) = 800 dot 0","01 dot 0","99 = 7","92 $
        Vì $X_1$ và $X_2$ độc lập nên phương sai của hiệu là:
        $ V(X_1 - X_2) = V(X_1) + V(X_2) = 9","8 + 7","92 = 17","72 $
        Giá trị $1","88$ là kết quả sai do lấy nhầm hiệu hai phương sai ($9","8 - 7","92$).
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một xưởng cơ khí sử dụng hai máy tiện tự động gia công chi tiết máy. Gọi $X$ là số chi tiết bị lỗi do máy I tạo ra trong một ca, có $E(X) = 3$ và $V(X) = 2$. Gọi $Y$ là số chi tiết bị lỗi do máy II tạo ra trong một ca, có $E(Y) = 5$ và $V(Y) = 4$. Hai máy hoạt động độc lập nhau. Xét biến ngẫu nhiên $D = Y - X$ (chênh lệch số lỗi giữa máy II và máy I) và biến ngẫu nhiên $S = 2 X + 3 Y$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình so sánh 2 máy tiện
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Máy I: E(X) = 3, V(X) = 2]))
    content((-1.5, -0.25), text(size: 8.5pt, weight: "bold", fill: accent, [Máy II: E(Y) = 5, V(Y) = 4]))
    line((0.3, -0.5), (0.3, 0.5), stroke: 0.8pt + gray)
    content((1.8, 0.2), text(size: 7.5pt, fill: rgb("15803d"), [E(D) = 2; V(D) = 6]))
    content((1.8, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [E(S) = 21; V(S) = 44]))
  })
]
],
    (
        True([Kỳ vọng của biến ngẫu nhiên chênh lệch $D = Y - X$ bằng $E(D) = 2$.]),
        True([Phương sai của biến ngẫu nhiên chênh lệch $D = Y - X$ bằng $V(D) = 6$.]),
        True([Kỳ vọng của biến ngẫu nhiên $S = 2 X + 3 Y$ bằng $E(S) = 21$.]),
        False([Phương sai của biến ngẫu nhiên $S = 2 X + 3 Y$ bằng $V(S) = 24$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng tính chất của kỳ vọng và phương sai khi hai biến ngẫu nhiên độc lập:
        - $E(a X + b Y) = a E(X) + b E(Y)$
        - $V(a X + b Y) = a^2 V(X) + b^2 V(Y)$

        #step([Phân tích ý a])
        Với $D = Y - X$:
        $ E(D) = E(Y) - E(X) = 5 - 3 = 2 $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Vì $X$ và $Y$ độc lập:
        $ V(D) = V(Y - X) = 1^2 dot V(Y) + (-1)^2 dot V(X) = V(Y) + V(X) = 4 + 2 = 6 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Với $S = 2 X + 3 Y$:
        $ E(S) = 2 E(X) + 3 E(Y) = 2 dot 3 + 3 dot 5 = 6 + 15 = 21 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Phương sai của $S$:
        $ V(S) = 2^2 dot V(X) + 3^2 dot V(Y) = 4 dot 2 + 9 dot 4 = 8 + 36 = 44 $
        Giá trị $24$ là sai do nhầm lẫn tính theo $2 V(X) + 3 V(Y) = 4 + 12 = 16$ hoặc quên bình phương các hệ số.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho hai biến ngẫu nhiên rời rạc $X$ và $Y$ thỏa mãn $E(X) = 15$ và $E(Y) = 25$. Xét biến ngẫu nhiên $Z = 4 X - 2 Y + 18$. Tính kỳ vọng $E(Z)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ tính kỳ vọng tổ hợp tuyến tính
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [E(Z) = 4E(X) - 2E(Y) + 18]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [E(Z) = 4 . 15 - 2 . 25 + 18 = 60 - 50 + 18 = 28]))
  })
]
],
    [28],
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng tính chất tuyến tính của kỳ vọng toán học:
        $ E(a X + b Y + c) = a E(X) + b E(Y) + c $

        #step([Lời giải chi tiết])
        Thay các giá trị kỳ vọng đã cho:
        $ E(Z) = 4 E(X) - 2 E(Y) + 18 = 4 dot 15 - 2 dot 25 + 18 = 60 - 50 + 18 = 28 $
        Vậy kỳ vọng $E(Z) = 28$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho hai biến ngẫu nhiên $X$ và $Y$ độc lập với nhau, có độ lệch chuẩn lần lượt là $sigma(X) = 6$ và $sigma(Y) = 8$. Tính độ lệch chuẩn của biến ngẫu nhiên hiệu $D = X - Y$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tam giác vuông Pytago độ lệch chuẩn độc lập
    line((-1.5, -0.5), (1.5, -0.5), stroke: 1.2pt + accent)
    line((1.5, -0.5), (1.5, 1.0), stroke: 1.2pt + accent)
    line((-1.5, -0.5), (1.5, 1.0), stroke: 1.5pt + rgb("b91c1c"))
    content((0, -0.75), text(size: 8pt, [σ(X) = 6]))
    content((1.9, 0.25), text(size: 8pt, [σ(Y) = 8]))
    content((-0.2, 0.5), text(size: 8.5pt, weight: "bold", fill: rgb("b91c1c"), [σ(D) = 10]))
  })
]
],
    [10],
    loigiai: [
        #step([Phương pháp giải])
        1. Từ độ lệch chuẩn suy ra phương sai: $V(X) = sigma(X)^2 = 36$ và $V(Y) = sigma(Y)^2 = 64$.
        2. Khi $X, Y$ độc lập: $V(X - Y) = V(X) + V(Y)$.
        3. Tính độ lệch chuẩn: $sigma(X - Y) = sqrt(V(X - Y))$.

        #step([Lời giải chi tiết])
        Phương sai của hiệu:
        $ V(X - Y) = 6^2 + 8^2 = 36 + 64 = 100 $
        Độ lệch chuẩn:
        $ sigma(X - Y) = sqrt(100) = 10 $
        (Quy tắc Pytago cho các biến ngẫu nhiên độc lập: $sigma(X - Y) = sqrt(sigma(X)^2 + sigma(Y)^2)$).
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một siêu thị nhận hàng từ hai nhà cung ứng rau sạch độc lập. Số lượng thùng rau đạt chuẩn loại 1 mỗi ngày từ nhà cung ứng A là biến ngẫu nhiên $X$ có $E(X) = 50, V(X) = 16$. Số lượng thùng rau đạt chuẩn loại 1 từ nhà cung ứng B là biến ngẫu nhiên $Y$ có $E(Y) = 70, V(Y) = 20$. Siêu thị được hưởng lợi nhuận ròng là $50$ nghìn đồng cho mỗi thùng rau đạt chuẩn loại 1. Tính phương sai của tổng lợi nhuận ròng mỗi ngày từ cả hai nhà cung ứng (đơn vị: triệu đồng bình phương, viết tắt $"triệu đồng"#super[2]$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tính phương sai lợi nhuận
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Tổng thùng: S = X + Y ==> V(S) = 16 + 20 = 36]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [Lợi nhuận: L = 0,05 S ==> V(L) = (0,05)^2 . 36 = 0,09]))
  })
]
],
    [0,09],
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $S = X + Y$ là tổng số thùng rau loại 1 nhận được trong ngày.
           Vì hai nhà cung ứng độc lập nên $V(S) = V(X) + V(Y)$.
        2. Mỗi thùng mang lại $50$ nghìn đồng $= 0","05$ triệu đồng lợi nhuận ròng.
           Tổng lợi nhuận ròng (triệu đồng) là $L = 0","05 S$.
        3. Áp dụng công thức: $V(L) = (0","05)^2 V(S)$.

        #step([Lời giải chi tiết])
        Phương sai tổng số thùng rau:
        $ V(S) = V(X) + V(Y) = 16 + 20 = 36 $
        Phương sai của tổng lợi nhuận:
        $ V(L) = (0","05)^2 dot V(S) = 0","0025 dot 36 = 0","09 " (triệu đồng)"#super[2] $
        Vậy phương sai tổng lợi nhuận là $0","09$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Hai sinh viên cùng tham gia kỳ thi tiếng Anh trực tuyến độc lập. Điểm thi của sinh viên thứ nhất là biến ngẫu nhiên $X$ có $E(X) = 75, V(X) = 25$. Điểm thi của sinh viên thứ hai là biến ngẫu nhiên $Y$ có $E(Y) = 80, V(Y) = 39$. Tìm phương sai của tổng điểm số của cả hai sinh viên $V(X + Y)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tổng điểm 2 sinh viên
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [X và Y độc lập]))
    content((0, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [V(X + Y) = V(X) + V(Y) = 25 + 39 = 64]))
  })
]
],
    [64],
    loigiai: [
        #step([Phương pháp giải])
        Vì hai sinh viên thi độc lập nên biến ngẫu nhiên điểm thi $X$ và $Y$ độc lập.
        Phương sai của tổng hai biến độc lập bằng tổng hai phương sai:
        $ V(X + Y) = V(X) + V(Y) $

        #step([Lời giải chi tiết])
        Thay số vào công thức:
        $ V(X + Y) = 25 + 39 = 64 $
        Vậy phương sai tổng điểm số bằng $64$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Cho hai biến ngẫu nhiên $X$ và $Y$ độc lập thỏa mãn $E(X) = 5, V(X) = 3$ và $E(Y) = 4, V(Y) = 2$. Xét biến ngẫu nhiên $U = 3 X - 2 Y + 7$. Tính phương sai $V(U)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ tính phương sai tổ hợp tuyến tính
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [V(U) = 3^2 V(X) + (-2)^2 V(Y)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [V(U) = 9 . 3 + 4 . 2 = 27 + 8 = 35]))
  })
]
],
    [35],
    loigiai: [
        #step([Phương pháp giải])
        Khi $X, Y$ độc lập và $c$ là hằng số:
        $ V(a X + b Y + c) = a^2 V(X) + b^2 V(Y) $

        #step([Lời giải chi tiết])
        Với $a = 3, b = -2, c = 7$:
        $ V(U) = 3^2 dot V(X) + (-2)^2 dot V(Y) = 9 dot 3 + 4 dot 2 = 27 + 8 = 35 $
        Vậy phương sai $V(U) = 35$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd03F — Mã 526], back-to: "sec-exercise-hub",[Một trang trại chăn nuôi gia cầm nuôi thử nghiệm hai đàn gà độc lập nhau. Đàn thứ nhất có $n_1 = 500$ con với xác suất mỗi con đạt cân nặng tiêu chuẩn khi xuất chuồng là $p_1 = 0","9$. Đàn thứ hai có $n_2 = 600$ con với xác suất mỗi con đạt cân nặng tiêu chuẩn là $p_2 = 0","85$. Gọi $S$ là tổng số gà đạt cân nặng tiêu chuẩn của cả hai đàn khi xuất chuồng. Tính độ lệch chuẩn $sigma(S)$ của $S$ (làm tròn kết quả đến hàng phần mười).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai đàn gà tiêu chuẩn
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Đàn 1: B(500; 0,9)]))
    content((-1.5, -0.25), text(size: 7.5pt, [V_1 = 45]))
    line((0.1, -0.4), (0.1, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Đàn 2: B(600; 0,85)]))
    content((1.6, -0.25), text(size: 7.5pt, [V_2 = 76,5]))
  })
]
],
    [11,0],
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $X_1$ là số gà đạt chuẩn của đàn 1: $X_1 ~ B(500; 0","9)$.
        2. Gọi $X_2$ là số gà đạt chuẩn của đàn 2: $X_2 ~ B(600; 0","85)$.
        3. Vì hai đàn gà độc lập nên phương sai tổng là $V(S) = V(X_1) + V(X_2)$.
        4. Độ lệch chuẩn $sigma(S) = sqrt(V(S))$.

        #step([Lời giải chi tiết])
        Phương sai của $X_1$:
        $ V(X_1) = 500 dot 0","9 dot (1 - 0","9) = 450 dot 0","1 = 45 $
        Phương sai của $X_2$:
        $ V(X_2) = 600 dot 0","85 dot (1 - 0","85) = 510 dot 0","15 = 76","5 $
        Phương sai của tổng $S = X_1 + X_2$:
        $ V(S) = V(X_1) + V(X_2) = 45 + 76","5 = 121","5 $
        Độ lệch chuẩn:
        $ sigma(S) = sqrt(121","5) approx 11","0227 $
        Làm tròn đến hàng phần mười ta được kết quả là $11","0$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ĐỀ ÔN TẬP CHUYÊN ĐỀ 3F: BIẾN NGẪU NHIÊN ĐỘC LẬP, TỔNG & HIỆU BIẾN NGẪU NHIÊN RỜI RẠC!]      #v(0.6em)
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
