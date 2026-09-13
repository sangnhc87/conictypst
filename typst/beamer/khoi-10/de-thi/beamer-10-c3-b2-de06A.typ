// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 1)
// Lớp: Khối 10  ·  Mã đề: 104  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 1)",
  subtitle: "ÔN TẬP CHƯƠNG 3 — MÃ ĐỀ: 104",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 104]],
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

// TN 1: Định lý côsin
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có các cạnh $B C = a, C A = b, A B = c$. Khẳng định nào sau đây đúng?],
    (
        [$a^2 = b^2 + c^2 + 2b c cos A$],
        True([$a^2 = b^2 + c^2 - 2b c cos A$]),
        [$a^2 = b^2 + c^2 - b c cos A$],
        [$a^2 = b^2 + c^2 - 2b c sin A$]
    ),
    loigiai: [
        Theo định lý côsin trong tam giác $A B C$:
        $ a^2 = b^2 + c^2 - 2b c cos A $
        Tương tự: $b^2 = a^2 + c^2 - 2a c cos B$ và $c^2 = a^2 + b^2 - 2a b cos C$.
    ]
)

// TN 2: Định lý sin
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có bán kính đường tròn ngoại tiếp bằng $R$. Khẳng định nào sau đây đúng?],
    (
        [$b / (sin B) = R$],
        [$b / (sin B) = 4R$],
        True([$b / (sin B) = 2R$]),
        [$b dot sin B = 2R$]
    ),
    loigiai: [
        Theo định lý sin trong tam giác $A B C$:
        $ a / (sin A) = b / (sin B) = c / (sin C) = 2R $
        Do đó: $b / (sin B) = 2R <=> b = 2R sin B$.
    ]
)

// TN 3: Áp dụng định lý côsin tính cạnh
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 5, c = 8$ và góc $hat(A) = 60^circ$. Độ dài cạnh $a$ bằng:],
    (
        [$a = sqrt(129)$],
        [$a = 49$],
        True([$a = 7$]),
        [$a = sqrt(39)$]
    ),
    loigiai: [
        Áp dụng định lý côsin:
        $ a^2 = b^2 + c^2 - 2b c cos A = 5^2 + 8^2 - 2 dot 5 dot 8 dot cos 60^circ $
        $ a^2 = 25 + 64 - 80 dot (1/2) = 89 - 40 = 49 => a = 7 $
    ]
)

// TN 4: Áp dụng định lý sin tính bán kính R
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = 6$ và góc $hat(A) = 30^circ$. Bán kính đường tròn ngoại tiếp tam giác $A B C$ bằng:],
    (
        [$R = 3$],
        True([$R = 6$]),
        [$R = 12$],
        [$R = 6 sqrt(3)$]
    ),
    loigiai: [
        Theo định lý sin:
        $ a / (sin A) = 2R => R = a / (2 sin A) = 6 / (2 dot sin 30^circ) = 6 / (2 dot 1/2) = 6 $
    ]
)

// TN 5: Công thức diện tích tam giác cơ bản
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $a = 4, b = 6$ và $hat(C) = 30^circ$. Diện tích của tam giác $A B C$ bằng:],
    (
        [$12$],
        [$12 sqrt(3)$],
        True([$6$]),
        [$6 sqrt(3)$]
    ),
    loigiai: [
        Áp dụng công thức tính diện tích theo hai cạnh và góc xen giữa:
        $ S = 1/2 a b sin C = 1/2 dot 4 dot 6 dot sin 30^circ = 12 dot 1/2 = 6 $
    ]
)

// TN 6: Hệ quả định lý côsin tính góc
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có ba cạnh $a = 7, b = 8, c = 13$. Côsin của góc $hat(B)$ bằng:],
    (
        [$1/2$],
        [$7/13$],
        True([$11/13$]),
        [$5/8$]
    ),
    loigiai: [
        Theo hệ quả của định lý côsin:
        $ cos B = (a^2 + c^2 - b^2) / (2a c) = (7^2 + 13^2 - 8^2) / (2 dot 7 dot 13) = (49 + 169 - 64) / 182 = 154 / 182 = 11/13 $
    ]
)

// TN 7: Độ dài đường trung tuyến tam giác vuông
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ vuông tại $A$ có $A B = 6$ và $A C = 8$. Độ dài đường trung tuyến $A M$ kẻ từ đỉnh $A$ bằng:],
    (
        [$10$],
        True([$5$]),
        [$2 sqrt(13)$],
        [$7$]
    ),
    loigiai: [
        - Cạnh huyền $B C = sqrt(A B^2 + A C^2) = sqrt(6^2 + 8^2) = 10$.
        - Trong tam giác vuông, đường trung tuyến ứng với cạnh huyền bằng nửa cạnh huyền:
        $ A M = (B C) / 2 = 10 / 2 = 5 $
    ]
)

// TN 8: Công thức Hê-rông tính diện tích tam giác
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh là $a = 5, b = 6, c = 7$. Diện tích của tam giác $A B C$ bằng:],
    (
        True([$6 sqrt(6)$]),
        [$12 sqrt(6)$],
        [$24$],
        [$6 sqrt(3)$]
    ),
    loigiai: [
        Nửa chu vi của tam giác:
        $ p = (a + b + c) / 2 = (5 + 6 + 7) / 2 = 9 $
        Áp dụng công thức Hê-rông:
        $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(9(9 - 5)(9 - 6)(9 - 7)) = sqrt(9 dot 4 dot 3 dot 2) = sqrt(216) = 6 sqrt(6) $
    ]
)

// TN 9: Bán kính đường tròn nội tiếp r
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh là $a = 5, b = 12, c = 13$. Bán kính $r$ của đường tròn nội tiếp tam giác $A B C$ bằng:],
    (
        [$1$],
        True([$2$]),
        [$3$],
        [$2.5$]
    ),
    loigiai: [
        Vì $5^2 + 12^2 = 25 + 144 = 169 = 13^2$, tam giác $A B C$ vuông tại $A$.
        - Diện tích tam giác: $S = 1/2 a b = 1/2 dot 5 dot 12 = 30$.
        - Nửa chu vi: $p = (5 + 12 + 13) / 2 = 15$.
        - Bán kính đường tròn nội tiếp:
        $ r = S / p = 30 / 15 = 2 $
    ]
)

// TN 10: Chiều cao tam giác đều
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$ có độ dài cạnh bằng $4$. Độ dài đường cao $A H$ của tam giác bằng:],
    (
        [$2$],
        [$4 sqrt(3)$],
        True([$2 sqrt(3)$]),
        [$3$]
    ),
    loigiai: [
        Trong tam giác đều cạnh $a$, độ dài đường cao được tính theo công thức:
        $ h = (a sqrt(3)) / 2 = (4 sqrt(3)) / 2 = 2 sqrt(3) $
    ]
)

// TN 11: Nhận dạng góc từ hệ thức
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ thỏa mãn hệ thức $a^2 = b^2 + c^2 + b c$. Số đo góc $hat(A)$ bằng:],
    (
        [$60^circ$],
        [$30^circ$],
        [$150^circ$],
        True([$120^circ$])
    ),
    loigiai: [
        Theo định lý côsin: $a^2 = b^2 + c^2 - 2b c cos A$.
        Đối chiếu với giả thiết $a^2 = b^2 + c^2 + b c$, ta có:
        $ - 2b c cos A = b c <=> cos A = - 1/2 $
        Vì $0^circ < hat(A) < 180^circ$ nên $hat(A) = 120^circ$.
    ]
)

// TN 12: Bài toán thực tế hải trình tàu thủy
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Hai tàu thủy cùng rời một cảng $O$ vào cùng một thời điểm. Tàu thứ nhất chạy theo hướng Đông với vận tốc $20" km/h"$, tàu thứ hai chạy theo hướng Đông Bắc (lệch $60^circ$ so với hướng Đông) với vận tốc $30" km/h"$. Sau $2$ giờ, khoảng cách giữa hai tàu xấp xỉ bằng:],
    (
        [$45.5" km"$],
        True([$52.9" km"$]),
        [$60.0" km"$],
        [$70.2" km"$]
    ),
    loigiai: [
        Sau 2 giờ:
        - Tàu thứ nhất đi được quãng đường $O A = 20 dot 2 = 40" km"$.
        - Tàu thứ hai đi được quãng đường $O B = 30 dot 2 = 60" km"$.
        Góc giữa hai hướng di chuyển là $hat(A O B) = 60^circ$.
        Áp dụng định lý côsin trong tam giác $O A B$:
        $ A B^2 = O A^2 + O B^2 - 2 dot O A dot O B dot cos 60^circ = 40^2 + 60^2 - 2(40)(60)(1/2) $
        $ A B^2 = 1600 + 3600 - 2400 = 2800 => A B = sqrt(2800) = 20 sqrt(7) approx 52.9" km" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát toàn diện tam giác có 3 cạnh
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có độ dài ba cạnh $a = 7, b = 5, c = 6$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Nửa chu vi của tam giác $A B C$ bằng $p = 9$.]),
    True([Diện tích tam giác $A B C$ bằng $S = 6 sqrt(6)$.]),
    True([Bán kính đường tròn ngoại tiếp của tam giác là $R = (35 sqrt(6)) / 24$.]),
    True([Bán kính đường tròn nội tiếp của tam giác là $r = (2 sqrt(6)) / 3$.])
  ),
  loigiai: [
    #step([Tính nửa chu vi p])
    $ p = (a + b + c) / 2 = (7 + 5 + 6) / 2 = 18 / 2 = 9 $. Do đó a) Đúng.

    #step([Tính diện tích tam giác theo Hê-rông])
    $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(9(9 - 7)(9 - 5)(9 - 6)) = sqrt(9 dot 2 dot 4 dot 3) = sqrt(216) = 6 sqrt(6) $. Do đó b) Đúng.

    #step([Tính bán kính đường tròn ngoại tiếp R])
    Áp dụng công thức $S = (a b c) / (4R) => R = (a b c) / (4S)$:
    $ R = (7 dot 5 dot 6) / (4 dot 6 sqrt(6)) = 210 / (24 sqrt(6)) = 35 / (4 sqrt(6)) = (35 sqrt(6)) / 24 $. Do đó c) Đúng.

    #step([Tính bán kính đường tròn nội tiếp r])
    Áp dụng công thức $S = p r => r = S / p$:
    $ r = (6 sqrt(6)) / 9 = (2 sqrt(6)) / 3 $. Do đó d) Đúng.
  ]
)

// DS 2: Tam giác có 2 cạnh và 1 góc tù
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 7, c = 8$ và góc $hat(A) = 120^circ$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Độ dài cạnh $a$ bằng $13$.]),
    True([Bán kính đường tròn ngoại tiếp tam giác $A B C$ là $R = (13 sqrt(3)) / 3$.]),
    [Độ dài đường trung tuyến kẻ từ đỉnh $A$ là $m_a = sqrt(57)$.],
    True([Diện tích của tam giác $A B C$ bằng $14 sqrt(3)$.])
  ),
  loigiai: [
    #step([Tính độ dài cạnh a])
    $ a^2 = b^2 + c^2 - 2b c cos A = 7^2 + 8^2 - 2 dot 7 dot 8 dot cos 120^circ $
    Vì $cos 120^circ = - 1/2$:
    $ a^2 = 49 + 64 - 112(- 1/2) = 113 + 56 = 169 => a = 13 $. Do đó a) Đúng.

    #step([Tính bán kính R])
    $ R = a / (2 sin A) = 13 / (2 sin 120^circ) = 13 / (2 dot sqrt(3)/2) = 13 / sqrt(3) = (13 sqrt(3)) / 3 $. Do đó b) Đúng.

    #step([Tính độ dài đường trung tuyến m_a])
    $ m_a^2 = (2(b^2 + c^2) - a^2) / 4 = (2(49 + 64) - 169) / 4 = (2(113) - 169) / 4 = (226 - 169) / 4 = 57 / 4 $
    Suy ra $m_a = sqrt(57) / 2$. Phát biểu ghi $m_a = sqrt(57)$ là Sai. Do đó c) Sai.

    #step([Tính diện tích tam giác])
    $ S = 1/2 b c sin A = 1/2 dot 7 dot 8 dot sin 120^circ = 28 dot sqrt(3)/2 = 14 sqrt(3) $. Do đó d) Đúng.
  ]
)

// DS 3: Bài toán thực tế đo khoảng cách hồ nước với hình vẽ CeTZ
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Để đo khoảng cách giữa hai vị trí $A$ và $B$ nằm ở hai bên bờ một hồ nước mà không thể đo trực tiếp, một kỹ sư đo đạc chọn một vị trí $C$ trên bờ sao cho từ $C$ có thể ngắm nhìn được cả $A$ và $B$. Kỹ sư đo được các số liệu: $C A = 150" m", C B = 200" m"$ và góc ngắm $hat(A C B) = 60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.02
    
    // Mặt hồ nước vẽ cách điệu
    fill(rgb("eff6ff"))
    stroke(none)
    bezier((0, 0), (2.5, 1.8), (1.2, 0.4), (2.0, 1.0))
    bezier((2.5, 1.8), (4.2, 0.2), (3.0, 1.5), (3.8, 0.8))
    bezier((4.2, 0.2), (0, 0), (3.0, -0.6), (1.0, -0.4))
    
    // Ba điểm C, A, B
    let pC = (0.5, 0.2)
    let pA = (3.2, 2.3)
    let pB = (4.0, -0.2)
    
    // Các đoạn thẳng
    stroke(1pt + rgb("0284c7"))
    line(pC, pA)
    line(pC, pB)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pB)
    
    // Điểm và nhãn
    circle(pC, radius: 2.5pt, fill: black)
    content((pC.at(0) - 0.35, pC.at(1)), text(weight: "bold")[$C$])
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) + 0.35, pA.at(1) + 0.1), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.35, pB.at(1) - 0.1), text(weight: "bold")[$B$])
    
    // Nhãn kích thước
    content((1.6, 1.5), text(fill: rgb("0284c7"), size: 8.5pt)[$150" m"$])
    content((2.4, -0.25), text(fill: rgb("0284c7"), size: 8.5pt)[$200" m"$])
    // Hồ nước emoji
    content((2.5, 0.8), [🌊])
    
    // Cung góc C chuẩn xác
    draw_angle_arc(pC, -5deg, 55deg, radius: 0.6, stroke: 0.8pt + rgb("d97706"))
    content((pC.at(0) + 0.85, pC.at(1) + 0.25), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tam giác $A B C$ có hai cạnh kề góc $hat(C) = 60^circ$ là $C A = 150" m"$ và $C B = 200" m"$.]),
    True([Khoảng cách $A B$ được xác định theo định lý côsin: $A B^2 = C A^2 + C B^2 - 2 C A dot C B cos 60^circ$.]),
    True([Khoảng cách giữa hai điểm $A$ và $B$ là $A B = 50 sqrt(13)" m" approx 180.3" m"$.]),
    True([Diện tích của phần mặt bằng tam giác $A B C$ là $S = 7500 sqrt(3)" m"^2$.])
  ),
  loigiai: [
    #step([Xác định mô hình tam giác])
    Mô hình bài toán tạo thành tam giác $A B C$ có hai cạnh $C A = 150" m", C B = 200" m"$ và góc kẹp giữa $hat(C) = 60^circ$. Do đó a) Đúng.

    #step([Áp dụng định lý côsin tính AB])
    $ A B^2 = C A^2 + C B^2 - 2 C A dot C B cos C $
    Do đó khẳng định b) Đúng.

    #step([Tính độ dài khoảng cách AB])
    $ A B^2 = 150^2 + 200^2 - 2(150)(200) cos 60^circ = 22500 + 40000 - 60000(1/2) = 62500 - 30000 = 32500 $
    $ => A B = sqrt(32500) = sqrt(2500 dot 13) = 50 sqrt(13)" m" approx 180.28" m" approx 180.3" m" $. Do đó c) Đúng.

    #step([Tính diện tích tam giác ABC])
    $ S = 1/2 C A dot C B sin C = 1/2 dot 150 dot 200 dot sin 60^circ = 15000 dot sqrt(3)/2 = 7500 sqrt(3)" m"^2 $. Do đó d) Đúng.
  ]
)

// DS 4: Nhận dạng tính chất tam giác từ đẳng thức cạnh - góc
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ thỏa mãn hệ thức lượng $a = 2b cos C$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Theo hệ quả định lý côsin, ta có $cos C = (a^2 + b^2 - c^2) / (2a b)$.]),
    True([Hệ thức $a = 2b cos C$ tương đương với $b = c$.]),
    True([Tam giác $A B C$ là tam giác cân tại đỉnh $A$.]),
    [Nếu tam giác $A B C$ có thêm một góc bằng $50^circ$ thì nó chắc chắn là tam giác đều.]
  ),
  loigiai: [
    #step([Biến đổi hệ thức theo định lý côsin])
    Thay $cos C = (a^2 + b^2 - c^2) / (2a b)$ vào hệ thức giả thiết:
    $ a = 2b dot (a^2 + b^2 - c^2) / (2a b) <=> a = (a^2 + b^2 - c^2) / a $
    Do đó a) Đúng.

    #step([Rút gọn phương trình])
    Nhân cả hai vế với $a > 0$:
    $ a^2 = a^2 + b^2 - c^2 <=> b^2 - c^2 = 0 <=> b = c quad (text("do ") b, c > 0) $
    Do đó b) Đúng.

    #step([Kết luận tính chất tam giác])
    Vì $b = c$ (tức cạnh $A C = A B$) nên tam giác $A B C$ cân tại đỉnh $A$. Do đó c) Đúng.

    #step([Đánh giá tính chất tam giác đều])
    Để tam giác cân trở thành tam giác đều thì góc phải bằng $60^circ$. Nếu góc bằng $50^circ$ thì không thể là tam giác đều. Phát biểu d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1: Tính cạnh tam giác từ đường trung tuyến
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có $b = 6, c = 8$ và đường trung tuyến kẻ từ đỉnh $A$ có độ dài $m_a = 5$. Tính độ dài cạnh $a$ của tam giác $A B C$.],
    [10],
    loigiai: [
        #step([Áp dụng công thức đường trung tuyến])
        Ta có công thức:
        $ m_a^2 = (2(b^2 + c^2) - a^2) / 4 $
        
        #step([Thay số giải phương trình tìm a])
        $ 5^2 = (2(6^2 + 8^2) - a^2) / 4 <=> 25 = (2(36 + 64) - a^2) / 4 <=> 100 = 2(100) - a^2 $
        $ 100 = 200 - a^2 <=> a^2 = 100 => a = 10 $
        Vậy độ dài cạnh $a = 10$.
    ]
)

// TLN 2: Bán kính nội tiếp r của tam giác 13, 14, 15
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có ba cạnh là $a = 13, b = 14, c = 15$. Tính bán kính đường tròn nội tiếp $r$ của tam giác $A B C$.],
    [4],
    loigiai: [
        #step([Tính nửa chu vi p])
        $ p = (a + b + c) / 2 = (13 + 14 + 15) / 2 = 42 / 2 = 21 $
        
        #step([Tính diện tích theo công thức Hê-rông])
        $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(21(21 - 13)(21 - 14)(21 - 15)) = sqrt(21 dot 8 dot 7 dot 6) $
        $ S = sqrt((7 dot 3) dot (8) dot 7 dot (6)) = sqrt(7^2 dot 9 dot 16) = 7 dot 3 dot 4 = 84 $
        
        #step([Tính bán kính đường tròn nội tiếp r])
        Áp dụng công thức $S = p r$:
        $ r = S / p = 84 / 21 = 4 $
        Vậy bán kính nội tiếp là $r = 4$.
    ]
)

// TLN 3: Đường cao nguyên h_b
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có ba cạnh $a = 13, b = 14, c = 15$. Tính độ dài đường cao $h_b$ kẻ từ đỉnh $B$ của tam giác.],
    [12],
    loigiai: [
        #step([Tính diện tích tam giác])
        Theo công thức Hê-rông với tam giác $a = 13, b = 14, c = 15$ (đã tính ở câu trước), diện tích tam giác là $S = 84$.
        
        #step([Tính đường cao h_b])
        Áp dụng công thức tính diện tích:
        $ S = 1/2 b dot h_b => h_b = (2S) / b = (2 dot 84) / 14 = 168 / 14 = 12 $
        Vậy độ dài đường cao kẻ từ đỉnh $B$ là $h_b = 12$.
    ]
)

// TLN 4: Khoảng cách giữa hai tàu
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Từ một ngọn hải đăng $H$, người quan sát phát hiện hai chiếc thuyền $A$ và $B$ đang neo đậu trên biển. Khoảng cách từ hải đăng đến thuyền $A$ là $5" km"$, đến thuyền $B$ là $8" km"$, và góc nhìn giữa hai thuyền là $hat(A H B) = 60^circ$. Tính khoảng cách giữa hai chiếc thuyền (đơn vị: km).],
    [7],
    loigiai: [
        #step([Mô hình hóa hình học])
        Xét tam giác $H A B$ có $H A = 5" km", H B = 8" km"$ và $hat(A H B) = 60^circ$.
        
        #step([Áp dụng định lý côsin tính AB])
        $ A B^2 = H A^2 + H B^2 - 2 H A dot H B cos 60^circ = 5^2 + 8^2 - 2 dot 5 dot 8 dot (1/2) $
        $ A B^2 = 25 + 64 - 40 = 49 => A B = 7" km" $
        Vậy khoảng cách giữa hai thuyền là $7" km"$.
    ]
)

// TLN 5: Đo chiều cao tòa tháp gián tiếp từ hai trạm quan sát
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Để đo chiều cao của một tòa tháp viễn thông $C D$ (với $C$ là chân tháp, $D$ là đỉnh tháp), hai kỹ sư đặt máy ngắm tại hai điểm $A$ và $B$ trên mặt đất nằm ngang thẳng hàng với chân tháp $C$ ($B$ nằm giữa $A$ và $C$). Khoảng cách giữa hai trạm quan sát là $A B = 40" m"$. Góc nâng nhìn lên đỉnh tháp tại $A$ là $30^circ$, tại $B$ là $45^circ$. Tính chiều cao $C D$ của tòa tháp (làm tròn đến hàng đơn vị theo mét).],
    [55],
    loigiai: [
        #step([Xét tam giác DAB])
        Trong tam giác $D A B$, ta có góc ngoài tại $B$ là $hat(D B C) = 45^circ$, góc $hat(D A B) = 30^circ$.
        Do đó:
        $ hat(A D B) = hat(D B C) - hat(D A B) = 45^circ - 30^circ = 15^circ $
        
        #step([Áp dụng định lý sin trong tam giác DAB])
        $ (D B) / (sin hat(D A B)) = (A B) / (sin hat(A D B)) => D B = (A B dot sin 30^circ) / (sin 15^circ) = (40 dot 0.5) / (sin 15^circ) = 20 / (sin 15^circ) $
        
        #step([Tính chiều cao CD trong tam giác vuông DCB])
        Tam giác $D C B$ vuông tại $C$ có $hat(D B C) = 45^circ$:
        $ C D = D B dot sin 45^circ = (20 dot sin 45^circ) / (sin 15^circ) = 20 dot (sqrt(2)/2) / ((sqrt(6) - sqrt(2))/4) = 20(sqrt(3) + 1) approx 20(2.732) approx 54.64" m" $
        Làm tròn đến hàng đơn vị ta được $55" m"$.
    ]
)

// TLN 6: Vận dụng cao - Tối ưu hóa góc nhìn Regiomontanus với đồ họa CeTZ
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 104], back-to: "sec-exercise-hub",[Một bức tranh lớn có mép dưới $B$ và mép trên $A$ được treo thẳng đứng trên bức tường phẳng. Người quan sát đứng ở vị trí $M$ sao cho tầm mắt cao hơn sàn nhà một đoạn và vuông góc với bức tường tại điểm $O$. Biết rằng mép dưới cách vị trí gióng ngang của mắt là $O B = 1" m"$, mép trên cách vị trí gióng là $O A = 4" m"$.
#align(center)[
    #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.8pt)
        let sc = 1.6
        
        // Tường đứng
        line((4 * sc, -0.5 * sc), (4 * sc, 4.8 * sc), stroke: 2pt + luma(100))
        content((4 * sc + 0.5, 4.5 * sc), text(weight: "bold")[Tường])
        
        // Đường gióng tầm mắt nằm ngang
        line((0, 0), (4 * sc, 0), stroke: (paint: luma(120), dash: "dashed", thickness: 0.8pt))
        content((2 * sc, -0.3 * sc), text(size: 8.5pt)[$x = O M$])
        
        // Các điểm M, O, B, A
        let pM = (0, 0)
        let pO = (4 * sc, 0)
        let pB = (4 * sc, 1 * sc)
        let pA = (4 * sc, 4 * sc)
        
        // Bức tranh AB tô màu nổi bật
        line(pB, pA, stroke: 4.5pt + rgb("dc2626"))
        content((4 * sc + 0.75, 2.5 * sc), [🖼️ Tranh ($3" m"$)])
        
        // Tia nhìn
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        content((-0.4 * sc, 0), [👁️ $M$])
        circle(pO, radius: 2pt, fill: black)
        content((4 * sc + 0.25, -0.25), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("dc2626"))
        content((4 * sc + 0.35, 1 * sc), text(weight: "bold")[$B$])
        circle(pA, radius: 2.5pt, fill: rgb("dc2626"))
        content((4 * sc + 0.35, 4 * sc), text(weight: "bold")[$A$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 14deg, 45deg, radius: 1.2 * sc, stroke: 1pt + rgb("d97706"))
        content((1.3 * sc, 0.55 * sc), text(fill: rgb("d97706"), weight: "bold")[$alpha$])
    })
]
Hỏi người đó phải đứng cách bức tường một khoảng cách $x = O M$ bằng bao nhiêu mét để góc nhìn bức tranh $hat(A M B)$ đạt giá trị lớn nhất?],
    [2],
    loigiai: [
        #step([Mô hình hóa hình học và biểu diễn góc nhìn])
        Gọi $x = O M > 0$ là khoảng cách từ mắt đến bức tường.
        Tam giác $M O A$ vuông tại $O$ có $tan hat(A M O) = (O A) / (O M) = 4 / x$.
        Tam giác $M O B$ vuông tại $O$ có $tan hat(B M O) = (O B) / (O M) = 1 / x$.
        
        Góc nhìn bức tranh là $alpha = hat(A M B) = hat(A M O) - hat(B M O)$.

        #step([Áp dụng công thức tang hiệu])
        $ tan alpha = tan(hat(A M O) - hat(B M O)) = (tan hat(A M O) - tan hat(B M O)) / (1 + tan hat(A M O) dot tan hat(B M O)) = (4/x - 1/x) / (1 + (4/x)(1/x)) = (3/x) / (1 + 4/x^2) = 3 / (x + 4/x) $
        
        #step([Áp dụng bất đẳng thức Cauchy tìm giá trị lớn nhất])
        Vì $x > 0$, áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $4/x$:
        $ x + 4/x >= 2 sqrt(x dot 4/x) = 2 sqrt(4) = 4 $
        Do đó:
        $ tan alpha <= 3 / 4 $
        Vì hàm số tang đồng biến trên $(0; pi/2)$, góc $alpha$ lớn nhất khi $tan alpha$ đạt giá trị lớn nhất bằng $3/4$.
        Đẳng thức xảy ra khi và chỉ khi:
        $ x = 4/x <=> x^2 = 4 <=> x = 2" m" quad (text("do ") x > 0) $
        Vậy người đó cần đứng cách tường $2" m"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 6: HỆ THỨC LƯỢNG TRONG TAM GIÁC (ĐỀ SỐ 1)!]      #v(0.6em)
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
