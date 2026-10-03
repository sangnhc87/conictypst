// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 3)
// Lớp: Khối 10  ·  Mã đề: 106  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

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

#let draw_angle_arc(center, a1, a2, radius: 0.8, ..rest) = {
  let sx = center.at(0) + radius * calc.cos(a1)
  let sy = center.at(1) + radius * calc.sin(a1)
  cetz.draw.arc((sx, sy), start: a1, stop: a2, radius: radius, ..rest)
}

#show: lecture-theme.with(
  title: "BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 3)",
  subtitle: "ÔN TẬP CHƯƠNG 3 — MÃ ĐỀ: 106",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 106]],
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

// TN 1: Hệ quả định lý côsin tính cos A
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có các cạnh $B C = a, C A = b, A B = c$. Khẳng định nào sau đây đúng?],
    (
        [$cos A = (b^2 + c^2 - a^2) / (b c)$],
        True([$cos A = (b^2 + c^2 - a^2) / (2b c)$]),
        [$cos A = (a^2 + c^2 - b^2) / (2a c)$],
        [$cos A = (a^2 + b^2 - c^2) / (2a b)$]
    ),
    loigiai: [
        Theo hệ quả của định lý côsin trong tam giác $A B C$:
        $ cos A = (b^2 + c^2 - a^2) / (2b c) $
    ]
)

// TN 2: Hệ quả định lý sin tính bán kính ngoại tiếp
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có diện tích $S$, nửa chu vi $p$ và độ dài ba cạnh là $a, b, c$. Bán kính đường tròn ngoại tiếp $R$ của tam giác được tính bằng công thức nào?],
    (
        [$R = (a b c) / S$],
        [$R = (a b c) / (2S)$],
        True([$R = (a b c) / (4S)$]),
        [$R = S / p$]
    ),
    loigiai: [
        Công thức tính diện tích qua bán kính ngoại tiếp: $S = (a b c) / (4R) <=> R = (a b c) / (4S)$.
    ]
)

// TN 3: Nhận dạng góc vuông qua độ dài ba cạnh
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = sqrt(3), b = 2, c = 1$. Số đo của góc $hat(B)$ bằng:],
    (
        [$30^circ$],
        [$45^circ$],
        [$60^circ$],
        True([$90^circ$])
    ),
    loigiai: [
        Ta có $a^2 + c^2 = (sqrt(3))^2 + 1^2 = 3 + 1 = 4 = 2^2 = b^2$.
        Theo định lý Pytago đảo, tam giác $A B C$ vuông tại đỉnh $B$, do đó $hat(B) = 90^circ$.
    ]
)

// TN 4: Đường kính đường tròn ngoại tiếp
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 4$ và góc $hat(B) = 60^circ$. Độ dài đường kính của đường tròn ngoại tiếp tam giác $A B C$ bằng:],
    (
        [$4$],
        [$4 sqrt(3)$],
        True([$(8 sqrt(3)) / 3$]),
        [$(4 sqrt(3)) / 3$]
    ),
    loigiai: [
        Đường kính của đường tròn ngoại tiếp bằng $2R$. Theo định lý sin:
        $ 2R = b / (sin B) = 4 / (sin 60^circ) = 4 / (sqrt(3)/2) = 8 / sqrt(3) = (8 sqrt(3)) / 3 $
    ]
)

// TN 5: Diện tích tam giác vuông 6, 8, 10
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh là $a = 6, b = 8, c = 10$. Diện tích của tam giác $A B C$ bằng:],
    (
        [$48$],
        [$30$],
        True([$24$]),
        [$40$]
    ),
    loigiai: [
        Vì $6^2 + 8^2 = 36 + 64 = 100 = 10^2$, tam giác $A B C$ vuông tại $C$.
        Diện tích tam giác: $S = 1/2 a b = 1/2 dot 6 dot 8 = 24$.
    ]
)

// TN 6: Cạnh tam giác cân khi biết hai cạnh và góc xen giữa
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = 2 sqrt(3), b = 2$ và góc $hat(C) = 30^circ$. Độ dài cạnh $c$ bằng:],
    (
        [$c = 4$],
        True([$c = 2$]),
        [$c = 2 sqrt(2)$],
        [$c = sqrt(7)$]
    ),
    loigiai: [
        Áp dụng định lý côsin:
        $ c^2 = a^2 + b^2 - 2a b cos C = (2 sqrt(3))^2 + 2^2 - 2 dot (2 sqrt(3)) dot 2 dot cos 30^circ $
        $ c^2 = 12 + 4 - 8 sqrt(3) dot (sqrt(3)/2) = 16 - 12 = 4 => c = 2 $
    ]
)

// TN 7: Độ dài trung tuyến m_c
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = 5, b = 6, c = 7$. Độ dài đường trung tuyến $m_c$ kẻ từ đỉnh $C$ bằng:],
    (
        [$sqrt(73)$],
        True([$sqrt(73) / 2$]),
        [$7/2$],
        [$sqrt(37)$]
    ),
    loigiai: [
        Áp dụng công thức đường trung tuyến:
        $ m_c^2 = (2(a^2 + b^2) - c^2) / 4 = (2(5^2 + 6^2) - 7^2) / 4 = (2(25 + 36) - 49) / 4 = (2(61) - 49) / 4 = (122 - 49) / 4 = 73 / 4 $
        $ => m_c = sqrt(73) / 2 $
    ]
)

// TN 8: Diện tích tam giác cân bằng Hê-rông
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = 10, b = 10, c = 12$. Diện tích của tam giác $A B C$ bằng:],
    (
        [$60$],
        True([$48$]),
        [$96$],
        [$54$]
    ),
    loigiai: [
        Nửa chu vi của tam giác:
        $ p = (10 + 10 + 12) / 2 = 16 $
        Áp dụng công thức Hê-rông:
        $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(16(16 - 10)(16 - 10)(16 - 12)) = sqrt(16 dot 6 dot 6 dot 4) = 4 dot 6 dot 2 = 48 $
    ]
)

// TN 9: Bán kính nội tiếp r
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có diện tích $S = 48$ và nửa chu vi $p = 16$. Bán kính $r$ của đường tròn nội tiếp tam giác $A B C$ bằng:],
    (
        [$2$],
        True([$3$]),
        [$4$],
        [$2.5$]
    ),
    loigiai: [
        Theo công thức liên hệ diện tích và bán kính nội tiếp:
        $ S = p r => r = S / p = 48 / 16 = 3 $
    ]
)

// TN 10: Chiều cao tam giác
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có diện tích $S = 24$ và độ dài cạnh $a = 6$. Độ dài đường cao $h_a$ tương ứng bằng:],
    (
        [$4$],
        True([$8$]),
        [$6$],
        [$12$]
    ),
    loigiai: [
        Ta có công thức:
        $ S = 1/2 a h_a => h_a = (2S) / a = (2 dot 24) / 6 = 48 / 6 = 8 $
    ]
)

// TN 11: Nhận dạng tam giác vuông qua hệ thức sin
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ thỏa mãn hệ thức $sin^2 A = sin^2 B + sin^2 C$. Khẳng định nào sau đây là đúng?],
    (
        [Tam giác $A B C$ là tam giác đều.],
        [Tam giác $A B C$ là tam giác cân tại đỉnh $A$.],
        True([Tam giác $A B C$ là tam giác vuông tại đỉnh $A$.]),
        [Tam giác $A B C$ có một góc tù.]
    ),
    loigiai: [
        Theo định lý sin: $sin A = a / (2R), sin B = b / (2R), sin C = c / (2R)$.
        Thay vào giả thiết:
        $ (a / (2R))^2 = (b / (2R))^2 + (c / (2R))^2 <=> a^2 = b^2 + c^2 $
        Theo định lý Pytago đảo, tam giác $A B C$ vuông tại đỉnh $A$.
    ]
)

// TN 12: Tính góc quan sát xà lan
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Một xà lan di chuyển dọc theo một bờ kênh thẳng từ điểm $A$ đến điểm $B$ dài $100" m"$. Người quan sát đứng ở vị trí $C$ bên bờ đối diện đo được $hat(C A B) = 45^circ$ và $hat(C B A) = 60^circ$. Số đo góc $hat(A C B)$ bằng:],
    (
        [$65^circ$],
        [$70^circ$],
        True([$75^circ$]),
        [$80^circ$]
    ),
    loigiai: [
        Tổng ba góc trong tam giác bằng $180^circ$:
        $ hat(A C B) = 180^circ - (hat(C A B) + hat(C B A)) = 180^circ - (45^circ + 60^circ) = 180^circ - 105^circ = 75^circ $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát tam giác 13, 14, 15
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh là $a = 13, b = 14, c = 15$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Nửa chu vi của tam giác $A B C$ là $p = 21$.]),
    True([Diện tích của tam giác $A B C$ bằng $S = 84$.]),
    True([Bán kính đường tròn ngoại tiếp của tam giác bằng $R = 8.125$.]),
    True([Độ dài đường cao $h_c$ hạ từ đỉnh $C$ xuống cạnh $A B$ bằng $11.2$.])
  ),
  loigiai: [
    #step([Tính nửa chu vi p])
    $ p = (13 + 14 + 15) / 2 = 42 / 2 = 21 $. Do đó a) Đúng.

    #step([Tính diện tích tam giác theo Hê-rông])
    $ S = sqrt(21(21 - 13)(21 - 14)(21 - 15)) = sqrt(21 dot 8 dot 7 dot 6) = 84 $. Do đó b) Đúng.

    #step([Tính bán kính ngoại tiếp R])
    $ R = (a b c) / (4S) = (13 dot 14 dot 15) / (4 dot 84) = 2730 / 336 = 65 / 8 = 8.125 $. Do đó c) Đúng.

    #step([Tính đường cao h_c])
    $ S = 1/2 c h_c => h_c = (2S) / c = (2 dot 84) / 15 = 168 / 15 = 11.2 $. Do đó d) Đúng.
  ]
)

// DS 2: Tam giác có một cạnh và hai góc kề
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có cạnh $a = 8$ và hai góc $hat(B) = 45^circ, hat(C) = 75^circ$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số đo của góc $hat(A)$ bằng $60^circ$.]),
    True([Bán kính đường tròn ngoại tiếp tam giác $A B C$ là $R = (8 sqrt(3)) / 3$.]),
    True([Độ dài cạnh $b = A C$ bằng $(8 sqrt(6)) / 3$.]),
    [Độ dài cạnh $c = A B$ bằng $4 sqrt(2)$.]
  ),
  loigiai: [
    #step([Tính số đo góc A])
    $ hat(A) = 180^circ - (hat(B) + hat(C)) = 180^circ - (45^circ + 75^circ) = 60^circ $. Do đó a) Đúng.

    #step([Tính bán kính R])
    $ R = a / (2 sin A) = 8 / (2 sin 60^circ) = 8 / (2 dot sqrt(3)/2) = 8 / sqrt(3) = (8 sqrt(3)) / 3 $. Do đó b) Đúng.

    #step([Tính độ dài cạnh b])
    Theo định lý sin:
    $ b = 2R sin B = 2 dot ((8 sqrt(3)) / 3) dot sin 45^circ = (16 sqrt(3)) / 3 dot (sqrt(2)/2) = (8 sqrt(6)) / 3 $. Do đó c) Đúng.

    #step([Tính độ dài cạnh c])
    $ c = 2R sin C = (16 sqrt(3)) / 3 dot sin 75^circ = (16 sqrt(3)) / 3 dot ((sqrt(6) + sqrt(2))/4) = (4(3 sqrt(2) + sqrt(6))) / 3 != 4 sqrt(2) $. Phát biểu d) Sai.
  ]
)

// DS 3: Bài toán thực tế đo tháp truyền hình trên đồi với hình vẽ CeTZ
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Một tòa tháp viễn thông $C D$ được xây dựng thẳng đứng trên đỉnh một ngọn đồi. Một trạm quan sát $A$ đặt trên mặt đất nằm ngang cách trục thẳng đứng của tháp một khoảng cách $A C_0 = 100" m"$ (với $C_0$ là hình chiếu của tháp lên mặt phẳng ngang qua $A$). Từ trạm $A$, kỹ sư đo được góc nâng nhìn lên chân tháp $C$ là $30^circ$ và góc nâng nhìn lên đỉnh tháp $D$ là $45^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.03
    
    // Mặt phẳng ngang qua A
    line((0, 0), (120 * sc, 0), stroke: 0.6pt + luma(140))
    
    // Đồi và tháp
    let pA = (0, 0)
    let pC0 = (100 * sc, 0)
    let pC = (100 * sc, 100 * 0.577 * sc)
    let pD = (100 * sc, 100 * sc)
    
    // Sườn đồi
    fill(rgb("f1f5f9"))
    stroke(1pt + luma(100))
    bezier(pA, pC, (40 * sc, 5 * sc), (70 * sc, 25 * sc))
    line(pC, pC0)
    line(pC0, pA)
    
    // Tháp truyền hình CD
    stroke(3pt + rgb("dc2626"))
    line(pC, pD)
    
    // Tia ngắm từ A đến C và D
    stroke(0.8pt + rgb("0284c7"))
    line(pA, pC)
    stroke(1.2pt + rgb("2563eb"))
    line(pA, pD)
    
    // Điểm và nhãn
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.35, 0), text(weight: "bold")[$A$])
    circle(pC0, radius: 2pt, fill: black)
    content((pC0.at(0) + 0.35, -0.2), text(weight: "bold")[$C_0$])
    circle(pC, radius: 2.5pt, fill: rgb("dc2626"))
    content((pC.at(0) + 0.65, pC.at(1)), text(weight: "bold")[$C$ (Chân tháp)])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((pD.at(0) + 0.65, pD.at(1)), text(weight: "bold")[$D$ (Đỉnh tháp)])
    
    // Góc nâng chuẩn xác
    draw_angle_arc(pA, 0deg, 30deg, radius: 1.0, stroke: 0.8pt + rgb("059669"))
    content((1.2, 0.35), text(fill: rgb("059669"), size: 8pt)[$30^circ$])
    draw_angle_arc(pA, 0deg, 45deg, radius: 1.6, stroke: 0.8pt + rgb("d97706"))
    content((1.8, 0.95), text(fill: rgb("d97706"), size: 8.5pt)[$45^circ$])
    
    // Nhãn khoảng cách
    content((50 * sc, -0.3), text(size: 8.5pt)[$100" m"$])
    content((100 * sc + 1.2, (pC.at(1) + pD.at(1))/2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[🗼 Tháp $C D$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ cao của chân tháp $C$ so với mặt bằng nằm ngang qua $A$ là $C C_0 = (100 sqrt(3)) / 3" m" approx 57.7" m"$.]),
    True([Độ cao của đỉnh tháp $D$ so với mặt bằng nằm ngang qua $A$ là $D C_0 = 100" m"$.]),
    True([Chiều cao thực tế của tòa tháp là $C D = 100(1 - sqrt(3)/3)" m" approx 42.3" m"$.]),
    [Chiều cao thực tế của tòa tháp lớn hơn $50" m"$.]
  ),
  loigiai: [
    #step([Tính độ cao chân tháp C C_0])
    Tam giác $A C_0 C$ vuông tại $C_0$ có góc nâng $hat(C A C_0) = 30^circ$:
    $ C C_0 = A C_0 dot tan 30^circ = 100 dot (sqrt(3)/3) = (100 sqrt(3)) / 3" m" approx 57.74" m" $. Do đó a) Đúng.

    #step([Tính độ cao đỉnh tháp D C_0])
    Tam giác $A C_0 D$ vuông tại $C_0$ có góc nâng $hat(D A C_0) = 45^circ$:
    $ D C_0 = A C_0 dot tan 45^circ = 100 dot 1 = 100" m" $. Do đó b) Đúng.

    #step([Tính chiều cao tháp C D])
    Chiều cao của tháp viễn thông:
    $ C D = D C_0 - C C_0 = 100 - (100 sqrt(3)) / 3 = 100(1 - sqrt(3)/3) approx 100(1 - 0.5774) = 42.26" m" approx 42.3" m" $. Do đó c) Đúng.

    #step([Đánh giá chiều cao])
    Vì $C D approx 42.3" m" < 50" m"$, nhận định tháp cao hơn $50" m"$ là Sai. Do đó d) Sai.
  ]
)

// DS 4: Nhận dạng tính chất tam giác từ đẳng thức lượng giác
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ thỏa mãn đẳng thức $sin A = (sin B + sin C) / (cos B + cos C)$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Đẳng thức đã cho tương đương với hệ thức cạnh: $a(cos B + cos C) = b + c$.]),
    True([Áp dụng công thức hình chiếu $b = a cos C + c cos A$ và $c = a cos B + b cos A$, đẳng thức tương đương với $(b + c) cos A = 0$.]),
    True([Tam giác $A B C$ là một tam giác vuông tại đỉnh $A$.]),
    [Tam giác $A B C$ chắc chắn là một tam giác đều.]
  ),
  loigiai: [
    #step([Chuyển đổi qua độ dài cạnh bằng định lý sin])
    Thay $sin A = a / (2R), sin B = b / (2R), sin C = c / (2R)$ vào giả thiết:
    $ a / (2R) = (b / (2R) + c / (2R)) / (cos B + cos C) <=> a = (b + c) / (cos B + cos C) <=> a(cos B + cos C) = b + c $
    Do đó a) Đúng.

    #step([Áp dụng công thức hình chiếu])
    Ta có các công thức hình chiếu trong tam giác:
    $ cases(b = a cos C + c cos A, c = a cos B + b cos A) => b + c = a(cos B + cos C) + (b + c) cos A $
    Đối chiếu với $a(cos B + cos C) = b + c$, ta suy ra:
    $ (b + c) cos A = 0 $
    Do đó b) Đúng.

    #step([Xác định góc A])
    Vì $b + c > 0$, ta có $cos A = 0 <=> hat(A) = 90^circ$.
    Vậy tam giác $A B C$ là tam giác vuông tại đỉnh $A$. Do đó c) Đúng.

    #step([Đánh giá tính chất tam giác đều])
    Vì tam giác vuông tại $A$ nên không thể là tam giác đều. Khẳng định d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1: Cạnh nguyên a khi b=7, c=8, cos A = 11/14
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 7, c = 8$ và $cos A = 11/14$. Tính độ dài cạnh $a$ của tam giác $A B C$.],
    [5],
    loigiai: [
        #step([Áp dụng định lý côsin])
        $ a^2 = b^2 + c^2 - 2b c cos A $
        
        #step([Thay số tính a])
        $ a^2 = 7^2 + 8^2 - 2 dot 7 dot 8 dot (11/14) = 49 + 64 - 112 dot (11/14) = 113 - 88 = 25 $
        $ => a = sqrt(25) = 5 $
        Vậy độ dài cạnh $a = 5$.
    ]
)

// TLN 2: Bán kính ngoại tiếp tam giác vuông
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có ba cạnh $a = 6, b = 8, c = 10$. Tính bán kính đường tròn ngoại tiếp $R$ của tam giác $A B C$.],
    [5],
    loigiai: [
        #step([Xác định tính chất tam giác])
        Ta có $a^2 + b^2 = 6^2 + 8^2 = 36 + 64 = 100 = 10^2 = c^2$.
        Suy ra tam giác $A B C$ vuông tại đỉnh $C$ với cạnh huyền là $c = 10$.
        
        #step([Tính bán kính ngoại tiếp R])
        Trong tam giác vuông, tâm đường tròn ngoại tiếp là trung điểm cạnh huyền:
        $ R = c / 2 = 10 / 2 = 5 $
        Vậy bán kính đường tròn ngoại tiếp là $R = 5$.
    ]
)

// TLN 3: Đường cao tam giác cân
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ cân tại $C$ có $C A = C B = 10$ và $A B = 12$. Tính độ dài đường cao $h_c$ hạ từ đỉnh $C$ xuống cạnh $A B$.],
    [8],
    loigiai: [
        #step([Xác định chân đường cao])
        Gọi $H$ là chân đường cao hạ từ đỉnh $C$ xuống cạnh $A B$.
        Vì tam giác $A B C$ cân tại $C$, $H$ đồng thời là trung điểm của $A B$:
        $ A H = (A B) / 2 = 12 / 2 = 6 $
        
        #step([Áp dụng định lý Pytago])
        Trong tam giác vuông $A H C$:
        $ C H = sqrt(C A^2 - A H^2) = sqrt(10^2 - 6^2) = sqrt(100 - 36) = sqrt(64) = 8 $
        Vậy độ dài đường cao là $h_c = 8$.
    ]
)

// TLN 4: Độ cao khinh khí cầu
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Một chiếc khinh khí cầu bay lơ lửng ở độ cao ổn định $h$. Hai người quan sát đứng tại hai điểm $A$ và $B$ trên mặt đất bằng phẳng cách nhau $300" m"$, cùng nhìn thấy khinh khí cầu nằm trong mặt phẳng thẳng đứng đi qua đoạn thẳng $A B$ (khinh khí cầu nằm giữa hai vị trí $A$ và $B$). Góc nâng nhìn thấy khinh khí cầu từ $A$ là $45^circ$, từ $B$ là $60^circ$. Tính độ cao $h$ của khinh khí cầu (làm tròn đến hàng đơn vị theo mét).],
    [190],
    loigiai: [
        #step([Mô hình hóa hình học])
        Gọi $K$ là vị trí khinh khí cầu, $H$ là hình chiếu vuông góc của $K$ lên mặt đất ($H in A B$).
        Độ cao của khinh khí cầu là $K H = h > 0$.
        
        #step([Biểu diễn các đoạn thẳng qua độ cao h])
        - Tam giác $K H A$ vuông tại $H$ có $hat(K A H) = 45^circ$:
        $ A H = h / (tan 45^circ) = h / 1 = h $
        - Tam giác $K H B$ vuông tại $H$ có $hat(K B H) = 60^circ$:
        $ B H = h / (tan 60^circ) = h / sqrt(3) $
        
        #step([Lập phương trình và giải tìm h])
        Vì $H$ nằm giữa $A$ và $B$, ta có $A H + B H = A B = 300" m"$:
        $ h + h / sqrt(3) = 300 <=> h(1 + 1/sqrt(3)) = 300 <=> h((sqrt(3) + 1)/sqrt(3)) = 300 $
        $ h = (300 sqrt(3)) / (sqrt(3) + 1) = (300 sqrt(3)(sqrt(3) - 1)) / 2 = 150(3 - sqrt(3)) approx 150(3 - 1.73205) = 150(1.26795) approx 190.19" m" $
        Làm tròn đến hàng đơn vị ta được $190" m"$.
    ]
)

// TLN 5: Khoảng cách từ bờ đến hòn đảo
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Từ hai vị trí $A$ và $B$ trên bờ biển cách nhau $A B = 1000" m"$, người ta quan sát một hòn đảo nhỏ $C$ ngoài khơi. Các góc ngắm đo được gồm $hat(C A B) = 80^circ$ và $hat(C B A) = 70^circ$. Tính khoảng cách $A C$ từ trạm $A$ đến hòn đảo $C$ (làm tròn đến hàng đơn vị theo mét).],
    [1879],
    loigiai: [
        #step([Tính góc C trong tam giác ABC])
        $ hat(A C B) = 180^circ - (hat(C A B) + hat(C B A)) = 180^circ - (80^circ + 70^circ) = 30^circ $
        
        #step([Áp dụng định lý sin tính khoảng cách AC])
        Theo định lý sin trong tam giác $A B C$:
        $ (A C) / (sin hat(C B A)) = (A B) / (sin hat(A C B)) => A C = (A B dot sin 70^circ) / (sin 30^circ) $
        
        #step([Thay số tính toán])
        $ A C = (1000 dot sin 70^circ) / (0.5) = 2000 dot sin 70^circ approx 2000 dot 0.9396926 = 1879.38" m" $
        Làm tròn đến hàng đơn vị ta được $1879" m"$.
    ]
)

// TLN 6: Vận dụng cao - Tối ưu hóa góc nhìn bức tượng với đồ họa CeTZ
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 106], back-to: "sec-exercise-hub",[Một bức tượng nghệ thuật có chiều cao $A B = 1.6" m"$ được đặt thẳng đứng trên một bệ đỡ. Mép dưới của tượng (điểm $B$) cách mặt đất $2.5" m"$, mép trên (điểm $A$) cách mặt đất $4.1" m"$. Một người quan sát có tầm mắt cách mặt đất $1.6" m"$.
#align(center)[
    #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.8pt)
        let sc = 1.6
        
        // Trục bệ và tượng
        line((4 * sc, -0.6 * sc), (4 * sc, 4.5 * sc), stroke: 2.2pt + luma(100))
        content((4 * sc + 0.6, 1.2 * sc), text(size: 8.5pt)[Bệ đỡ])
        
        // Đường gióng ngang tầm mắt
        line((0, 0), (4 * sc, 0), stroke: (paint: luma(120), dash: "dashed", thickness: 0.8pt))
        content((2 * sc, -0.3 * sc), text(size: 8.5pt)[$x = M O$])
        
        let pM = (0, 0)
        let pO = (4 * sc, 0)
        let pB = (4 * sc, 0.9 * sc)
        let pA = (4 * sc, 2.5 * sc)
        
        // Bức tượng AB tô màu nổi bật
        line(pB, pA, stroke: 4.5pt + rgb("d97706"))
        content((4 * sc + 0.85, 1.7 * sc), [🗿 Tượng ($1.6" m"$)])
        
        // Tia nhìn
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        content((-0.4 * sc, 0), [👁️ $M$])
        circle(pO, radius: 2pt, fill: black)
        content((4 * sc + 0.25, -0.2), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("d97706"))
        content((4 * sc + 0.45, 0.9 * sc), text(weight: "bold")[$B (0.9" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("d97706"))
        content((4 * sc + 0.45, 2.5 * sc), text(weight: "bold")[$A (2.5" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 12.7deg, 32deg, radius: 1.3 * sc, stroke: 1pt + rgb("dc2626"))
        content((1.4 * sc, 0.55 * sc), text(fill: rgb("dc2626"), weight: "bold")[$alpha$])
    })
]
Hỏi người đó cần đứng cách bệ tượng một khoảng cách $x$ bằng bao nhiêu mét để góc nhìn bức tượng $hat(A M B)$ đạt giá trị lớn nhất?],
    [1.5],
    loigiai: [
        #step([Mô hình hóa hình học và biểu diễn góc nhìn])
        Gọi $M$ là vị trí mắt người quan sát, $O$ là điểm trên trục thẳng đứng của bệ tượng ngang bằng với tầm mắt ($M O$ vuông góc với trục thẳng đứng của tượng).
        Khoảng cách cần tìm là $x = M O > 0$.
        
        - Mép dưới $B$ cách đường gióng ngang tầm mắt:
        $ O B = 2.5 - 1.6 = 0.9" m" $
        - Mép trên $A$ cách đường gióng ngang tầm mắt:
        $ O A = 4.1 - 1.6 = 2.5" m" $
        
        Tam giác $M O A$ vuông tại $O$ có $tan hat(A M O) = (O A) / (M O) = 2.5 / x$.
        Tam giác $M O B$ vuông tại $O$ có $tan hat(B M O) = (O B) / (M O) = 0.9 / x$.
        
        Góc nhìn bức tượng là $alpha = hat(A M B) = hat(A M O) - hat(B M O)$.

        #step([Biến đổi lượng giác])
        $ tan alpha = tan(hat(A M O) - hat(B M O)) = (2.5/x - 0.9/x) / (1 + (2.5/x)(0.9/x)) = (1.6/x) / (1 + 2.25 / x^2) = 1.6 / (x + 2.25 / x) $
        
        #step([Áp dụng bất đẳng thức Cauchy tìm giá trị lớn nhất])
        Vì $x > 0$, áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $2.25 / x$:
        $ x + 2.25 / x >= 2 sqrt(x dot 2.25 / x) = 2 sqrt(2.25) = 2 dot 1.5 = 3 $
        Do đó:
        $ tan alpha <= 1.6 / 3 = 8 / 15 $
        Góc $alpha$ đạt giá trị lớn nhất khi và chỉ khi:
        $ x = 2.25 / x <=> x^2 = 2.25 <=> x = sqrt(2.25) = 1.5" m" quad (text("do ") x > 0) $
        Vậy người quan sát cần đứng cách bệ tượng $1.5" m"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 3)!]      #v(0.6em)
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
