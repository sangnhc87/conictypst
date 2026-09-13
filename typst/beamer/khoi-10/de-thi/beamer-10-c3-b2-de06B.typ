// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 2)
// Lớp: Khối 10  ·  Mã đề: 105  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 2)",
  subtitle: "ÔN TẬP CHƯƠNG 3 — MÃ ĐỀ: 105",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 105]],
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

// TN 1: Hệ quả định lý côsin tính cos C
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có các cạnh $B C = a, C A = b, A B = c$. Khẳng định nào sau đây đúng?],
    (
        [$cos C = (a^2 + b^2 - c^2) / (a b)$],
        True([$cos C = (a^2 + b^2 - c^2) / (2a b)$]),
        [$cos C = (a^2 + c^2 - b^2) / (2a c)$],
        [$cos C = (b^2 + c^2 - a^2) / (2b c)$]
    ),
    loigiai: [
        Theo hệ quả định lý côsin:
        $ c^2 = a^2 + b^2 - 2a b cos C <=> cos C = (a^2 + b^2 - c^2) / (2a b) $
    ]
)

// TN 2: Hệ quả định lý sin
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có bán kính đường tròn ngoại tiếp bằng $R$. Độ dài cạnh $a = B C$ được tính bởi công thức nào sau đây?],
    (
        [$a = R sin A$],
        [$a = (sin A) / (2R)$],
        True([$a = 2R sin A$]),
        [$a = (2R) / (sin A)$]
    ),
    loigiai: [
        Theo định lý sin: $a / (sin A) = 2R <=> a = 2R sin A$.
    ]
)

// TN 3: Tính cạnh c khi biết a, b và góc xen giữa
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = 8, b = 10$ và góc $hat(C) = 60^circ$. Độ dài cạnh $c$ bằng:],
    (
        [$c = 2 sqrt(41)$],
        [$c = 14$],
        True([$c = 2 sqrt(21)$]),
        [$c = sqrt(84)$]
    ),
    loigiai: [
        Áp dụng định lý côsin:
        $ c^2 = a^2 + b^2 - 2a b cos C = 8^2 + 10^2 - 2 dot 8 dot 10 dot cos 60^circ $
        $ c^2 = 64 + 100 - 160 dot (1/2) = 164 - 80 = 84 => c = sqrt(84) = 2 sqrt(21) $
    ]
)

// TN 4: Bán kính đường tròn ngoại tiếp góc 45 độ
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = 10$ và góc $hat(A) = 45^circ$. Bán kính $R$ của đường tròn ngoại tiếp tam giác $A B C$ bằng:],
    (
        [$R = 10$],
        [$R = 10 sqrt(2)$],
        True([$R = 5 sqrt(2)$]),
        [$R = 5$]
    ),
    loigiai: [
        Theo định lý sin:
        $ R = a / (2 sin A) = 10 / (2 sin 45^circ) = 10 / (2 dot sqrt(2)/2) = 10 / sqrt(2) = 5 sqrt(2) $
    ]
)

// TN 5: Diện tích tam giác có góc tù 150 độ
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 3, c = 4$ và góc $hat(A) = 150^circ$. Diện tích của tam giác $A B C$ bằng:],
    (
        [$6$],
        [$6 sqrt(3)$],
        True([$3$]),
        [$3 sqrt(3)$]
    ),
    loigiai: [
        Áp dụng công thức tính diện tích tam giác:
        $ S = 1/2 b c sin A = 1/2 dot 3 dot 4 dot sin 150^circ = 6 dot (1/2) = 3 $
    ]
)

// TN 6: Tính số đo góc C khi biết ba cạnh 3, 5, 7
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh là $a = 3, b = 5, c = 7$. Số đo của góc $hat(C)$ bằng:],
    (
        [$60^circ$],
        [$90^circ$],
        [$150^circ$],
        True([$120^circ$])
    ),
    loigiai: [
        Theo hệ quả định lý côsin:
        $ cos C = (a^2 + b^2 - c^2) / (2a b) = (3^2 + 5^2 - 7^2) / (2 dot 3 dot 5) = (9 + 25 - 49) / 30 = (- 15) / 30 = - 1/2 $
        Do đó: $hat(C) = 120^circ$.
    ]
)

// TN 7: Độ dài trung tuyến tam giác đều
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có độ dài cạnh bằng $6$. Độ dài đường trung tuyến kẻ từ đỉnh $A$ bằng:],
    (
        [$3$],
        [$6 sqrt(3)$],
        True([$3 sqrt(3)$]),
        [$9$]
    ),
    loigiai: [
        Trong tam giác đều cạnh $a = 6$, đường trung tuyến đồng thời là đường cao:
        $ m_a = (a sqrt(3)) / 2 = (6 sqrt(3)) / 2 = 3 sqrt(3) $
    ]
)

// TN 8: Diện tích tam giác theo Hê-rông (4, 5, 7)
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có ba cạnh là $a = 4, b = 5, c = 7$. Diện tích của tam giác $A B C$ bằng:],
    (
        [$8 sqrt(6)$],
        True([$4 sqrt(6)$]),
        [$12 sqrt(3)$],
        [$24$]
    ),
    loigiai: [
        Nửa chu vi của tam giác:
        $ p = (a + b + c) / 2 = (4 + 5 + 7) / 2 = 8 $
        Áp dụng công thức Hê-rông:
        $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(8(8 - 4)(8 - 5)(8 - 7)) = sqrt(8 dot 4 dot 3 dot 1) = sqrt(96) = 4 sqrt(6) $
    ]
)

// TN 9: Bán kính nội tiếp r của tam giác đều
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có độ dài cạnh bằng $6$. Bán kính $r$ của đường tròn nội tiếp tam giác bằng:],
    (
        [$1$],
        [$2$],
        True([$sqrt(3)$]),
        [$2 sqrt(3)$]
    ),
    loigiai: [
        - Diện tích tam giác đều: $S = (a^2 sqrt(3)) / 4 = (6^2 sqrt(3)) / 4 = 9 sqrt(3)$.
        - Nửa chu vi: $p = (3 dot 6) / 2 = 9$.
        - Bán kính đường tròn nội tiếp:
        $ r = S / p = (9 sqrt(3)) / 9 = sqrt(3) $
    ]
)

// TN 10: Đường cao tam giác vuông
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ vuông tại $A$ có $A B = 6$ và $A C = 8$. Độ dài đường cao $A H$ kẻ từ đỉnh $A$ bằng:],
    (
        [$5$],
        True([$4.8$]),
        [$3.6$],
        [$4.2$]
    ),
    loigiai: [
        - Cạnh huyền $B C = sqrt(A B^2 + A C^2) = sqrt(6^2 + 8^2) = 10$.
        - Áp dụng hệ thức lượng trong tam giác vuông:
        $ A B dot A C = B C dot A H => A H = (A B dot A C) / (B C) = (6 dot 8) / 10 = 48 / 10 = 4.8 $
    ]
)

// TN 11: Nhận dạng tam giác có góc tù
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác có độ dài ba cạnh là $5, 7, 9$. Khẳng định nào sau đây là đúng về tính chất của tam giác này?],
    (
        [Tam giác có ba góc đều nhọn.],
        [Tam giác là tam giác vuông.],
        True([Tam giác có một góc tù.]),
        [Tam giác là tam giác cân.]
    ),
    loigiai: [
        Gọi cạnh lớn nhất là $c = 9$, hai cạnh còn lại là $a = 5, b = 7$.
        Ta so sánh $c^2$ với $a^2 + b^2$:
        - $c^2 = 9^2 = 81$.
        - $a^2 + b^2 = 5^2 + 7^2 = 25 + 49 = 74$.
        Vì $c^2 > a^2 + b^2$ ($81 > 74$), theo hệ quả định lý côsin:
        $ cos C = (a^2 + b^2 - c^2) / (2a b) = (74 - 81) / (2 dot 5 dot 7) = (- 7) / 70 = - 0.1 < 0 $
        Do đó góc $hat(C)$ là góc tù. Tam giác có một góc tù.
    ]
)

// TN 12: Góc quan sát hai tàu
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Từ vị trí $A$ và $B$ cách nhau $500" m"$, hai người quan sát cùng ngắm nhìn một trạm hải đăng $C$. Người tại $A$ đo được $hat(C A B) = 70^circ$, người tại $B$ đo được $hat(C B A) = 60^circ$. Góc nhìn $hat(A C B)$ từ hải đăng đến hai người bằng:],
    (
        [$40^circ$],
        True([$50^circ$]),
        [$60^circ$],
        [$55^circ$]
    ),
    loigiai: [
        Tổng ba góc trong tam giác $A B C$ bằng $180^circ$:
        $ hat(A C B) = 180^circ - (hat(C A B) + hat(C B A)) = 180^circ - (70^circ + 60^circ) = 180^circ - 130^circ = 50^circ $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát tam giác vuông (6, 8, 10)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh $a = 8, b = 10, c = 6$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tam giác $A B C$ là một tam giác vuông tại đỉnh $B$.]),
    True([Diện tích của tam giác $A B C$ bằng $24$.]),
    True([Bán kính đường tròn ngoại tiếp của tam giác bằng $R = 5$.]),
    True([Bán kính đường tròn nội tiếp của tam giác bằng $r = 2$.])
  ),
  loigiai: [
    #step([Kiểm tra tam giác vuông])
    Ta có $a^2 + c^2 = 8^2 + 6^2 = 64 + 36 = 100 = 10^2 = b^2$.
    Theo định lý Pytago đảo, tam giác $A B C$ vuông tại đỉnh $B$. Do đó a) Đúng.

    #step([Tính diện tích tam giác])
    $ S = 1/2 a c = 1/2 dot 8 dot 6 = 24 $. Do đó b) Đúng.

    #step([Tính bán kính ngoại tiếp R])
    Trong tam giác vuông, tâm đường tròn ngoại tiếp là trung điểm cạnh huyền:
    $ R = b / 2 = 10 / 2 = 5 $. Do đó c) Đúng.

    #step([Tính bán kính nội tiếp r])
    Nửa chu vi: $p = (8 + 10 + 6) / 2 = 12$.
    $ r = S / p = 24 / 12 = 2 $. Do đó d) Đúng.
  ]
)

// DS 2: Tam giác có 2 cạnh và 1 góc 60 độ
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 6, c = 4$ và góc $hat(A) = 60^circ$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Độ dài cạnh $a$ bằng $2 sqrt(7)$.]),
    True([Diện tích của tam giác $A B C$ bằng $6 sqrt(3)$.]),
    True([Bán kính đường tròn ngoại tiếp tam giác $A B C$ bằng $R = (2 sqrt(21)) / 3$.]),
    True([Độ dài đường phân giác trong kẻ từ đỉnh $A$ là $l_a = (12 sqrt(3)) / 5$.])
  ),
  loigiai: [
    #step([Tính cạnh a])
    $ a^2 = b^2 + c^2 - 2b c cos A = 6^2 + 4^2 - 2(6)(4) cos 60^circ = 36 + 16 - 48(1/2) = 52 - 24 = 28 $
    $ => a = sqrt(28) = 2 sqrt(7) $. Do đó a) Đúng.

    #step([Tính diện tích tam giác])
    $ S = 1/2 b c sin A = 1/2 dot 6 dot 4 dot sin 60^circ = 12 dot sqrt(3)/2 = 6 sqrt(3) $. Do đó b) Đúng.

    #step([Tính bán kính R])
    $ R = a / (2 sin A) = (2 sqrt(7)) / (2 sin 60^circ) = (2 sqrt(7)) / sqrt(3) = (2 sqrt(21)) / 3 $. Do đó c) Đúng.

    #step([Tính đường phân giác trong l_a])
    Công thức đường phân giác trong:
    $ l_a = (2b c cos(A/2)) / (b + c) = (2 dot 6 dot 4 dot cos 30^circ) / (6 + 4) = (48 dot sqrt(3)/2) / 10 = (24 sqrt(3)) / 10 = (12 sqrt(3)) / 5 $. Do đó d) Đúng.
  ]
)

// DS 3: Bài toán thực tế máy bay đổi hướng với hình vẽ CeTZ
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Một chiếc trực thăng cứu hộ xuất phát từ trạm $A$, bay theo hướng thẳng về phía Bắc một quãng đường $A B = 300" km"$ đến vị trí $B$. Tại $B$, do thời tiết xấu, trực thăng đổi hướng bay lệch về phía Đông Bắc một góc $45^circ$ so với hướng Bắc và bay thêm một đoạn $B C = 400" km"$ để đến đích $C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.007
    
    // Hệ trục chỉ hướng
    line((-1.5, 0), (3.5, 0), stroke: 0.3pt + luma(180))
    line((0, -0.8), (0, 3.8), stroke: 0.3pt + luma(180))
    
    // Tọa độ 3 điểm A, B, C
    let pA = (0, 0)
    let pB = (0, 300 * sc)
    let pC = (400 * 0.707 * sc, (300 + 400 * 0.707) * sc)
    
    // Đoạn đường bay AB và BC
    stroke(1.2pt + rgb("0d9488"))
    line(pA, pB)
    line(pB, pC)
    
    // Đường bay thẳng AC (nét đứt)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pC)
    
    // Đường kéo dài theo hướng Bắc từ B
    stroke((paint: luma(120), dash: "dotted", thickness: 0.8pt))
    line(pB, (0, (300 + 150) * sc))
    
    // Các điểm và nhãn
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.35, pA.at(1)), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) - 0.35, pB.at(1)), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) + 0.35, pC.at(1)), text(weight: "bold")[$C$])
    
    // Nhãn độ dài
    content((-0.6, 150 * sc), text(fill: rgb("0d9488"), size: 8.5pt)[$300" km"$])
    content((1.3, 2.8), text(fill: rgb("0d9488"), size: 8.5pt)[$400" km"$])
    content((1.2, 1.2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$A C = ?$])
    
    // Góc lệch 45 độ chuẩn xác
    draw_angle_arc(pB, 45deg, 90deg, radius: 0.5, stroke: 0.8pt + rgb("d97706"))
    content((0.35, pB.at(1) + 0.5), text(fill: rgb("d97706"), size: 8pt)[$45^circ$])
    
    // Góc trong B = 135 độ chuẩn xác
    draw_angle_arc(pB, -90deg, 45deg, radius: 0.35, stroke: 0.8pt + rgb("2563eb"))
    content((0.2, pB.at(1) - 0.3), text(fill: rgb("2563eb"), size: 7.5pt)[$135^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Góc trong của tam giác $A B C$ tại đỉnh $B$ là $hat(A B C) = 135^circ$.]),
    True([Khoảng cách bay thẳng $A C$ thỏa mãn hệ thức: $A C^2 = A B^2 + B C^2 - 2 A B dot B C cos 135^circ$.]),
    True([Khoảng cách bay thẳng từ trạm $A$ đến đích $C$ xấp xỉ bằng $647.8" km"$.]),
    [Nếu trực thăng bay thẳng từ $A$ đến $C$ với vận tốc không đổi $600" km/h"$ thì thời gian bay sẽ ít hơn $1$ giờ.]
  ),
  loigiai: [
    #step([Xác định góc B trong tam giác ABC])
    Vì hướng bay tiếp theo lệch $45^circ$ so với phương thẳng đứng hướng Bắc, góc kề bù trong tam giác là:
    $ hat(A B C) = 180^circ - 45^circ = 135^circ $. Do đó a) Đúng.

    #step([Áp dụng định lý côsin])
    Trong tam giác $A B C$, theo định lý côsin:
    $ A C^2 = A B^2 + B C^2 - 2 A B dot B C cos 135^circ $. Do đó b) Đúng.

    #step([Tính khoảng cách AC])
    $ A C^2 = 300^2 + 400^2 - 2(300)(400) cos 135^circ = 90000 + 160000 - 240000(- sqrt(2)/2) $
    $ A C^2 = 250000 + 120000 sqrt(2) approx 250000 + 169705.6 = 419705.6 $
    $ => A C approx sqrt(419705.6) approx 647.85" km" approx 647.8" km" $. Do đó c) Đúng.

    #step([Đánh giá thời gian bay])
    Thời gian bay thẳng với vận tốc $600" km/h"$:
    $ t = (A C) / v approx 647.8 / 600 approx 1.08" giờ" > 1" giờ" $. Phát biểu ghi ít hơn 1 giờ là Sai. Do đó d) Sai.
  ]
)

// DS 4: Mối quan hệ ba cạnh lập thành cấp số cộng
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh $a, b, c$ thỏa mãn hệ thức $b + c = 2a$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Độ dài ba cạnh $b, a, c$ theo thứ tự đó lập thành một cấp số cộng.]),
    True([Theo định lý sin, ta có đẳng thức $sin B + sin C = 2 sin A$.]),
    True([Gọi $h_a, h_b, h_c$ là độ dài ba đường cao tương ứng của tam giác, ta có $1 / h_b + 1 / h_c = 2 / h_a$.]),
    [Bán kính đường tròn nội tiếp $r$ luôn thỏa mãn $r = h_a / 2$ với mọi tam giác thỏa mãn đề bài.]
  ),
  loigiai: [
    #step([Tính chất cấp số cộng của ba cạnh])
    Hệ thức $b + c = 2a$ chứng tỏ số $a$ là trung bình cộng của $b$ và $c$. Do đó a) Đúng.

    #step([Liên hệ lượng giác qua định lý sin])
    Theo định lý sin: $a = 2R sin A, b = 2R sin B, c = 2R sin C$.
    Thay vào hệ thức:
    $ 2R sin B + 2R sin C = 2(2R sin A) <=> sin B + sin C = 2 sin A $. Do đó b) Đúng.

    #step([Liên hệ giữa các đường cao])
    Ta có công thức diện tích: $S = 1/2 a h_a = 1/2 b h_b = 1/2 c h_c => a = (2S)/h_a, b = (2S)/h_b, c = (2S)/h_c$.
    Thay vào $b + c = 2a$:
    $ (2S)/h_b + (2S)/h_c = 2 dot (2S)/h_a <=> 1/h_b + 1/h_c = 2/h_a $. Do đó c) Đúng.

    #step([Liên hệ với bán kính nội tiếp r])
    Nửa chu vi tam giác: $p = (a + b + c) / 2 = (a + 2a) / 2 = (3a) / 2$.
    Mặt khác: $S = p r = ((3a)/2) r$.
    Mà $S = 1/2 a h_a$, suy ra:
    $ 3/2 a r = 1/2 a h_a <=> 3r = h_a <=> r = h_a / 3 $.
    Khẳng định $r = h_a / 2$ là Sai. Do đó d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1: Trung tuyến nguyên m_b
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh $a = 7, b = 8, c = 9$. Tính độ dài đường trung tuyến $m_b$ kẻ từ đỉnh $B$ của tam giác $A B C$.],
    [7],
    loigiai: [
        #step([Áp dụng công thức độ dài đường trung tuyến])
        Công thức đường trung tuyến $m_b$:
        $ m_b^2 = (2(a^2 + c^2) - b^2) / 4 $
        
        #step([Thay số tính toán])
        $ m_b^2 = (2(7^2 + 9^2) - 8^2) / 4 = (2(49 + 81) - 64) / 4 = (2(130) - 64) / 4 = (260 - 64) / 4 = 196 / 4 = 49 $
        $ => m_b = sqrt(49) = 7 $
        Vậy độ dài đường trung tuyến kẻ từ đỉnh $B$ là $m_b = 7$.
    ]
)

// TLN 2: Diện tích tam giác 13, 14, 15
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh là $a = 15, b = 13, c = 14$. Tính diện tích của tam giác $A B C$.],
    [84],
    loigiai: [
        #step([Tính nửa chu vi p])
        $ p = (a + b + c) / 2 = (15 + 13 + 14) / 2 = 42 / 2 = 21 $
        
        #step([Áp dụng công thức Hê-rông])
        $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(21(21 - 15)(21 - 13)(21 - 14)) = sqrt(21 dot 6 dot 8 dot 7) $
        $ S = sqrt((7 dot 3) dot (3 dot 2) dot (8) dot 7) = sqrt(7^2 dot 3^2 dot 16) = 7 dot 3 dot 4 = 84 $
        Vậy diện tích tam giác là $S = 84$.
    ]
)

// TLN 3: Cạnh nguyên a khi b=10, c=16, A=60 độ
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 10, c = 16$ và góc $hat(A) = 60^circ$. Tính độ dài cạnh $a$ của tam giác $A B C$.],
    [14],
    loigiai: [
        #step([Áp dụng định lý côsin])
        $ a^2 = b^2 + c^2 - 2b c cos A $
        
        #step([Thay số tính a])
        $ a^2 = 10^2 + 16^2 - 2 dot 10 dot 16 dot cos 60^circ = 100 + 256 - 320 dot (1/2) $
        $ a^2 = 356 - 160 = 196 => a = sqrt(196) = 14 $
        Vậy độ dài cạnh $a = 14$.
    ]
)

// TLN 4: Khoảng cách qua đầm lầy
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Để đo khoảng cách giữa hai vị trí $A$ và $B$ qua một đầm lầy, người đo đạc chọn vị trí $C$ cách $A$ một đoạn $200" m"$, cách $B$ một đoạn $300" m"$ và góc ngắm $hat(A C B) = 60^circ$. Tính khoảng cách giữa hai vị trí $A$ và $B$ (làm tròn đến hàng đơn vị theo mét).],
    [265],
    loigiai: [
        #step([Áp dụng định lý côsin])
        Trong tam giác $A B C$:
        $ A B^2 = C A^2 + C B^2 - 2 C A dot C B cos 60^circ $
        $ A B^2 = 200^2 + 300^2 - 2 dot 200 dot 300 dot (1/2) = 40000 + 90000 - 60000 = 70000 $
        $ => A B = sqrt(70000) = 100 sqrt(7) approx 100(2.64575) approx 264.58" m" $
        Làm tròn đến hàng đơn vị ta được $265" m"$.
    ]
)

// TLN 5: Quãng đường tàu di chuyển nhìn ngọn hải đăng
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Một con tàu đang chạy trên biển hướng thẳng về phía một ngọn hải đăng cao $80" m"$ đặt sát bờ biển. Tại vị trí $A$, người trên tàu đo được góc nâng nhìn lên đỉnh ngọn hải đăng là $30^circ$. Sau khi tàu chạy thêm một đoạn đến vị trí $B$, góc nâng nhìn lên đỉnh ngọn hải đăng tăng lên thành $45^circ$. Hỏi con tàu đã di chuyển quãng đường $A B$ bằng bao nhiêu mét? (Làm tròn đến hàng đơn vị theo mét).],
    [59],
    loigiai: [
        #step([Mô hình hóa tam giác vuông])
        Gọi đỉnh hải đăng là $D$, chân ngọn hải đăng trên mặt biển là $H$ ($D H = 80" m"$).
        Tam giác $D H B$ vuông tại $H$ có góc nâng $hat(D B H) = 45^circ$:
        $ H B = (D H) / (tan 45^circ) = 80 / 1 = 80" m" $
        Tam giác $D H A$ vuông tại $H$ có góc nâng $hat(D A H) = 30^circ$:
        $ H A = (D H) / (tan 30^circ) = 80 / (1/sqrt(3)) = 80 sqrt(3)" m" $
        
        #step([Tính quãng đường AB])
        Vì tàu di chuyển thẳng về phía hải đăng nên $B$ nằm giữa $A$ và $H$:
        $ A B = H A - H B = 80 sqrt(3) - 80 = 80(sqrt(3) - 1) approx 80(0.73205) = 58.56" m" $
        Làm tròn đến hàng đơn vị ta được $59" m"$.
    ]
)

// TLN 6: Vận dụng cao - Tối ưu hóa góc nhìn chùm đèn ngọn hải đăng với hình vẽ CeTZ
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 105], back-to: "sec-exercise-hub",[Một ngọn hải đăng có dàn đèn tín hiệu kéo dài theo phương thẳng đứng từ độ cao $12" m"$ (điểm $B$) đến độ cao $27" m"$ (điểm $A$) so với mặt nước biển. Một cano cứu nạn di chuyển trên mặt nước.
#align(center)[
    #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.8pt)
        let sc = 0.15
        
        // Trục chân tháp hải đăng
        line((20 * sc, 0), (20 * sc, 32 * sc), stroke: 2.2pt + luma(80))
        content((20 * sc + 1.2, 30 * sc), text(weight: "bold")[🗼 Hải đăng])
        
        // Mặt biển nằm ngang
        line((-2 * sc, 0), (22 * sc, 0), stroke: 1pt + rgb("0284c7"))
        content((10 * sc, -1.2), text(fill: rgb("0284c7"), size: 8.5pt)[🌊 Mặt biển ($x = H M$)])
        
        let pM = (0, 0)
        let pH = (20 * sc, 0)
        let pB = (20 * sc, 12 * sc)
        let pA = (20 * sc, 27 * sc)
        
        // Dàn đèn AB nổi bật
        line(pB, pA, stroke: 4.5pt + rgb("eab308"))
        content((20 * sc + 1.5, 19.5 * sc), text(fill: rgb("ca8a04"), weight: "bold")[Dàn đèn ($15" m"$)])
        
        // Tia nhìn
        line(pM, pB, stroke: 1pt + rgb("0d9488"))
        line(pM, pA, stroke: 1.2pt + rgb("059669"))
        
        content((-0.8, 0), [⛵ $M$])
        circle(pH, radius: 2pt, fill: black)
        content((20 * sc + 0.4, -0.35), text(weight: "bold")[$H$])
        circle(pB, radius: 2.5pt, fill: rgb("ca8a04"))
        content((20 * sc + 0.4, 12 * sc), text(weight: "bold")[$B (12" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("ca8a04"))
        content((20 * sc + 0.4, 27 * sc), text(weight: "bold")[$A (27" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 31deg, 53.5deg, radius: 1.5, stroke: 1pt + rgb("d97706"))
        content((1.3, 1.2), text(fill: rgb("d97706"), weight: "bold")[$alpha$])
    })
]
Hỏi cano phải cách chân ngọn hải đăng một khoảng cách $x$ bằng bao nhiêu mét để góc nhìn dàn đèn $hat(A M B)$ đạt giá trị lớn nhất?],
    [18],
    loigiai: [
        #step([Mô hình hóa hình học và biểu thức góc nhìn])
        Gọi $H$ là chân ngọn hải đăng tại mực nước biển, $M$ là vị trí cano trên mặt biển cách chân tháp một khoảng $x = H M > 0$.
        Tam giác $M H A$ vuông tại $H$ có $tan hat(A M H) = (H A) / (H M) = 27 / x$.
        Tam giác $M H B$ vuông tại $H$ có $tan hat(B M H) = (H B) / (H M) = 12 / x$.
        
        Góc nhìn dàn đèn tín hiệu là $alpha = hat(A M B) = hat(A M H) - hat(B M H)$.

        #step([Biến đổi lượng giác])
        Áp dụng công thức tang của hiệu hai góc:
        $ tan alpha = tan(hat(A M H) - hat(B M H)) = (tan hat(A M H) - tan hat(B M H)) / (1 + tan hat(A M H) dot tan hat(B M H)) $
        $ tan alpha = (27/x - 12/x) / (1 + (27/x)(12/x)) = (15/x) / (1 + 324 / x^2) = 15 / (x + 324 / x) $
        
        #step([Áp dụng bất đẳng thức Cauchy tìm giá trị lớn nhất])
        Áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $324 / x$:
        $ x + 324 / x >= 2 sqrt(x dot 324 / x) = 2 sqrt(324) = 2 dot 18 = 36 $
        Suy ra:
        $ tan alpha <= 15 / 36 = 5 / 12 $
        Góc $alpha$ đạt giá trị lớn nhất khi và chỉ khi:
        $ x = 324 / x <=> x^2 = 324 <=> x = sqrt(324) = 18" m" quad (text("do ") x > 0) $
        Vậy cano cần cách chân hải đăng $18" m"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 2)!]      #v(0.6em)
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
