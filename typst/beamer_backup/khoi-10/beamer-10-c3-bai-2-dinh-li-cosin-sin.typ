#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Định Lí Côsin Và Định Lí Sin],
  subtitle: [TOÁN 10 — CHƯƠNG III: HỆ THỨC LƯỢNG & CÔNG THỨC DIỆN TÍCH],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI HỌC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: ĐỊNH LÍ CÔSIN VÀ HỆ QUẢ
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-li-cosin", "📐", [I. Định Lí Côsin Trong Tam Giác])

#lt-slide-back(title: "📐 Định Lí Côsin")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-theorem(title: "Định lí Côsin")[
        Trong tam giác $A B C$ có $B C = a, C A = b, A B = c$:
        $ a^2 = b^2 + c^2 - 2 b c cos A $
        $ b^2 = a^2 + c^2 - 2 a c cos B $
        $ c^2 = a^2 + b^2 - 2 a b cos C $
      ]
      #v(0.25em)
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#2563eb"), inset: 8pt, radius: 6pt)[
        *Mẹo nhớ:* Bình phương một cạnh bằng tổng bình phương hai cạnh kia trừ đi hai lần tích hai cạnh đó nhân với côsin của góc xen giữa.
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Tam Giác ABC]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            let sc = 1.3
            // Đỉnh tam giác
            let A = (1*sc, 2.3*sc)
            let B = (-0.8*sc, 0)
            let C = (2.2*sc, 0)

            line(A, B, stroke: 1.5pt + rgb("#2563eb"))
            line(B, C, stroke: 1.5pt + rgb("#16a34a"))
            line(C, A, stroke: 1.5pt + rgb("#dc2626"))

            circle(A, radius: 2.5pt, fill: black)
            circle(B, radius: 2.5pt, fill: black)
            circle(C, radius: 2.5pt, fill: black)

            content((1*sc, 2.55*sc), text(size: 9.5pt, weight: "bold")[$A$])
            content((-0.95*sc, -0.15*sc), text(size: 9.5pt, weight: "bold")[$B$])
            content((2.35*sc, -0.15*sc), text(size: 9.5pt, weight: "bold")[$C$])

            // Nhãn cạnh
            content((0.7*sc, -0.22*sc), text(size: 9pt, fill: rgb("#16a34a"), weight: "bold")[$a$])
            content((1.8*sc, 1.25*sc), text(size: 9pt, fill: rgb("#dc2626"), weight: "bold")[$b$])
            content((-0.1*sc, 1.25*sc), text(size: 9pt, fill: rgb("#2563eb"), weight: "bold")[$c$])

            // Góc A
            arc((1*sc, 2.3*sc), start: -125deg, stop: -40deg, radius: 0.35*sc, stroke: 1pt + rgb("#d97706"))
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "⚡ Hệ Quả Định Lí Côsin & Đường Trung Tuyến")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12pt)[1. Tính Góc Khi Biết 3 Cạnh]
        #v(0.25em)
        $ cos A = (b^2 + c^2 - a^2)/(2 b c) $
        $ cos B = (a^2 + c^2 - b^2)/(2 a c) $
        $ cos C = (a^2 + b^2 - c^2)/(2 a b) $
        #v(0.2em)
        #text(size: 9.5pt)[- $b^2 + c^2 > a^2 arrow cos A > 0 arrow hat(A)$ nhọn.\ - $b^2 + c^2 < a^2 arrow cos A < 0 arrow hat(A)$ tù.]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 12pt)[2. Độ Dài Đường Trung Tuyến]
        #v(0.25em)
        Gọi $m_a, m_b, m_c$ là các đường trung tuyến:
        $ m_a^2 = (2(b^2 + c^2) - a^2)/4 $
        $ m_b^2 = (2(a^2 + c^2) - b^2)/4 $
        $ m_c^2 = (2(a^2 + b^2) - c^2)/4 $
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ĐỊNH LÍ SIN VÀ BÁN KÍNH NGOẠI TIẾP
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-li-sin", "⭕", [II. Định Lí Sin Trong Tam Giác])

#lt-slide-back(title: "⭕ Định Lí Sin")[
  #lt-theorem(title: "Định lí Sin")[
    Trong tam giác $A B C$ bất kỳ, tỉ số giữa mỗi cạnh và sin của góc đối diện luôn bằng đường kính đường tròn ngoại tiếp:
    $ a/(sin A) = b/(sin B) = c/(sin C) = 2 R $
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[Tính Cạnh]
        #v(0.25em)
        $a = 2 R sin A$\
        $b = 2 R sin B$\
        $c = 2 R sin C$
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 11pt)[Tính Góc]
        #v(0.25em)
        $sin A = a/(2 R)$\
        $sin B = b/(2 R)$\
        $sin C = c/(2 R)$
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 11pt)[Bán Kính R]
        #v(0.25em)
        $R = a/(2 sin A)$\
        $= b/(2 sin B)$\
        $= c/(2 sin C)$
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: 5 CÔNG THỨC DIỆN TÍCH TAM GIÁC
// ════════════════════════════════════════════════
#lt-section-link("sec-cong-thuc-dien-tich", "💎", [III. 5 Công Thức Tính Diện Tích])

#lt-slide-back(title: "💎 Bảng Vàng 5 Công Thức Diện Tích")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[1. Chiều Cao & Góc Xen Giữa]
        #v(0.2em)
        $ S = 1/2 a h_a = 1/2 b h_b = 1/2 c h_c $
        $ S = 1/2 a b sin C = 1/2 b c sin A = 1/2 c a sin B $
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 11pt)[2. Bán Kính Ngoại Tiếp R]
        #v(0.2em)
        $ S = (a b c)/(4 R) arrow R = (a b c)/(4 S) $
        #text(size: 9.5pt)[Rất hiệu quả để tìm bán kính đường tròn ngoại tiếp!]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 11pt)[3. Bán Kính Nội Tiếp r]
        #v(0.2em)
        $ S = p r arrow r = S/p $
        #text(size: 9.5pt)[Với nửa chu vi $p = (a + b + c)/2$.]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 11pt)[4. Công Thức Hê-rông (Heron)]
        #v(0.2em)
        $ S = sqrt(p(p - a)(p - b)(p - c)) $
        #text(size: 9.5pt)[Dùng khi biết độ dài cả 3 cạnh của tam giác.]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [IV. Bài tập: Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — ĐỊNH LÍ CÔSIN VÀ ĐỊNH LÍ SIN],
  questions: (
    (num: 1, type: "TN", desc: [Định Lí Côsin Cơ Bản]),
    (num: 2, type: "TN", desc: [Bán Kính Ngoại Tiếp]),
    (num: 3, type: "TN", desc: [Hệ Quả Côsin]),
    (num: 4, type: "TN", desc: [Diện Tích Góc Tù]),
    (num: 5, type: "TN", desc: [Công Thức Hê-rông]),
    (num: 6, type: "TN", desc: [Độ Dài Trung Tuyến]),
    (num: 7, type: "DS", desc: [Phân Tích Toàn Diện Tam Giác]),
    (num: 8, type: "TLN", desc: [Tìm Góc Từ Diện Tích]),
    (num: 9, type: "TLN", desc: [Đo Chiều Cao Ngọn Tháp]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho tam giác $A B C$ có $b = 8, c = 5$ và góc $hat(A) = 60 degree$. Độ dài cạnh $a$ bằng:],
  (
    [$7$],
    [$sqrt(89)$],
    [$sqrt(129)$],
    [$49$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 06A — Định Lí Côsin Cơ Bản",
  loigiai: [
    Áp dụng định lí Côsin: $a^2 = b^2 + c^2 - 2 b c cos A$.\
    Thay số: $a^2 = 8^2 + 5^2 - 2(8)(5) cos 60 degree = 64 + 25 - 80(1/2) = 49$.\
    Suy ra $a = sqrt(49) = 7$. Chọn đáp án *A: 7*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có $a = 6$ và góc $hat(A) = 30 degree$. Bán kính đường tròn ngoại tiếp $R$ bằng:],
  (
    [$3$],
    [$6$],
    [$12$],
    [$6 sqrt(3)$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 06A — Bán Kính Ngoại Tiếp",
  loigiai: [
    Theo định lí Sin: $a/(sin A) = 2 R arrow R = a/(2 sin A)$.\
    Thay số: $R = 6/(2 sin 30 degree) = 6/(2 dot 0.5) = 6$.\
    Chọn đáp án *B: 6*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có $a = 7, b = 8, c = 9$. Giá trị của $cos A$ bằng:],
  (
    [$1/3$],
    [$2/3$],
    [$1/2$],
    [$3/4$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 06B — Hệ Quả Côsin",
  loigiai: [
    Theo hệ quả định lí Côsin: $cos A = (b^2 + c^2 - a^2)/(2 b c)$.\
    Thay số: $cos A = (8^2 + 9^2 - 7^2)/(2 dot 8 dot 9) = (64 + 81 - 49)/144 = 96/144 = 2/3$.\
    Chọn đáp án *B: 2/3*.
  ]
)

#lt-tn(
  [Tam giác $A B C$ có $a = 4, c = 6$ và góc $hat(B) = 150 degree$. Diện tích $S$ của tam giác bằng:],
  (
    [$6$],
    [$12$],
    [$6 sqrt(3)$],
    [$12 sqrt(3)$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 06B — Diện Tích Góc Tù",
  loigiai: [
    Công thức diện tích: $S = 1/2 a c sin B = 1/2 (4)(6) sin 150 degree$.\
    Vì $sin 150 degree = sin(180 degree - 30 degree) = sin 30 degree = 1/2$,\
    suy ra $S = 12 dot 1/2 = 6$. Chọn đáp án *A: 6*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có ba cạnh $a = 13, b = 14, c = 15$. Diện tích của tam giác bằng:],
  (
    [$84$],
    [$168$],
    [$42$],
    [$105$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 06C — Công Thức Hê-rông",
  loigiai: [
    Nửa chu vi: $p = (13 + 14 + 15)/2 = 21$.\
    Theo Hê-rông: $S = sqrt(21(21 - 13)(21 - 14)(21 - 15)) = sqrt(21 dot 8 dot 7 dot 6)$.\
    Ta có $S = sqrt(7056) = 84$. Chọn đáp án *A: 84*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có $a = 5, b = 7, c = 8$. Độ dài đường trung tuyến $m_a$ bằng:],
  (
    [$sqrt(129)/2$],
    [$sqrt(201)/2$],
    [$7$],
    [$6$],
  ),
  correct: 2,
  num: 6,
  de: "Đề 06C — Độ Dài Trung Tuyến",
  loigiai: [
    Công thức trung tuyến: $m_a^2 = (2(b^2 + c^2) - a^2)/4$.\
    Thay số: $m_a^2 = (2(7^2 + 8^2) - 5^2)/4 = (2(49 + 64) - 25)/4 = (226 - 25)/4 = 201/4$.\
    Suy ra $m_a = sqrt(201)/2$. Chọn đáp án *B*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho tam giác $A B C$ có ba cạnh $a = 5, b = 6, c = 7$. Xét tính Đúng / Sai của các khẳng định:],
  (
    (body: [Tam giác $A B C$ là một tam giác có 3 góc đều nhọn.], "true": true),
    (body: [Nửa chu vi của tam giác là $p = 9$.], "true": true),
    (body: [Bán kính đường tròn nội tiếp tam giác bằng $r = sqrt(6)$.], "true": false),
    (body: [Diện tích tam giác $A B C$ bằng $6 sqrt(6)$.], "true": true),
  ),
  de: "Đề 06D — Phân Tích Toàn Diện Tam Giác",
  num: 7,
  loigiai: [
    - a) *Đ:* Cạnh lớn nhất $c = 7$ có $a^2 + b^2 = 25 + 36 = 61 > 49 = c^2 arrow hat(C) < 90 degree$ (tam giác nhọn).
    - b) *Đ:* $p = (5 + 6 + 7)/2 = 9$.
    - c) *S:* $S = sqrt(9(4)(3)(2)) = 6 sqrt(6) arrow r = S/p = (6 sqrt(6))/9 = (2 sqrt(6))/3$.
    - d) *Đ:* Theo Hê-rông: $S = sqrt(9 dot 4 dot 3 dot 2) = 6 sqrt(6)$.
  ]
)

#lt-tln(
  [Cho tam giác $A B C$ có $b = 10, c = 16$ và diện tích $S = 40$. Giá trị của $sin A$ bằng bao nhiêu?],
  [0.5],
  num: 8,
  de: "Đề 06E — Tìm Góc Từ Diện Tích",
  loigiai: [
    Áp dụng công thức: $S = 1/2 b c sin A$.\
    Thay số: $40 = 1/2 (10)(16) sin A = 80 sin A$.\
    Suy ra $sin A = 40/80 = 0.5$.
  ]
)

#lt-tln(
  [Để đo chiều cao của một ngọn tháp $C D$, người ta đặt hai giác kế tại $A$ và $B$ trên mặt đất cách nhau $40$ m. Biết các góc nâng $hat(C A D) = 60 degree$ và $hat(C B D) = 45 degree$. Chiều cao của ngọn tháp là bao nhiêu mét? (Làm tròn đến hàng phần mười).],
  [54.6],
  num: 9,
  de: "Đề 06F — Đo Chiều Cao Ngọn Tháp",
  loigiai: [
    Gọi $h = C D$ là chiều cao tháp.\
    Trong tam giác vuông $C A D: A D = h cot 60 degree = h/sqrt(3)$.\
    Trong tam giác vuông $C B D: B D = h cot 45 degree = h$.\
    Do $B D - A D = A B = 40 arrow h - h/sqrt(3) = 40 arrow h(1 - 1/sqrt(3)) = 40$.\
    Tính: $h = 40/(1 - 1/sqrt(3)) = (40 sqrt(3))/(sqrt(3) - 1) approx 54.6$ m.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c3-b2", "💎", [VI. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Hệ Thức Lượng Trong Tam Giác")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. ĐỊNH LÍ CÔSIN]
        #v(0.2em)
        #text(size: 10pt)[
          - $a^2 = b^2 + c^2 - 2 b c cos A$.
          - Hệ quả tính góc: $cos A$.
          - Công thức trung tuyến $m_a^2$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. ĐỊNH LÍ SIN]
        #v(0.2em)
        #text(size: 10pt)[
          - $a/(sin A) = b/(sin B) = c/(sin C) = 2R$.
          - Tìm bán kính ngoại tiếp: $R = a/(2 sin A)$.
          - Cực kỳ mạnh khi biết 2 góc 1 cạnh.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. DIỆN TÍCH TAM GIÁC]
        #v(0.2em)
        #text(size: 10pt)[
          - $S = 1/2 a b sin C$.
          - $S = (a b c)/(4 R) = p r$.
          - Hê-rông: $S = sqrt(p(p-a)(p-b)(p-c))$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. NHẬN DẠNG TAM GIÁC]
        #v(0.2em)
        #text(size: 10pt)[
          - $a^2 < b^2 + c^2 arrow$ Góc $A$ nhọn.
          - $a^2 = b^2 + c^2 arrow$ Vuông tại $A$.
          - $a^2 > b^2 + c^2 arrow$ Góc $A$ tù.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. BẪY THƯỜNG GẶP]
        #v(0.2em)
        #text(size: 10pt)[
          - Nhầm lẫn giữa $R$ (ngoại) và $r$ (nội).
          - Quên nhân hệ số $1/2$ trong diện tích.
          - Tính sai dấu khi góc tù.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. ỨNG DỤNG THỰC TẾ]
        #v(0.2em)
        #text(size: 10pt)[
          - Đo đạc trắc địa, khoảng cách sông hồ.
          - Đo chiều cao núi non, công trình.
          - Hàng hải & định vị vệ tinh GPS.
        ]
      ]
    ]
  )
]

#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 28pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 2 — CHƯƠNG III!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Hệ thức lượng là chiếc chìa khóa vạn năng giải mã mọi tam giác trong không gian."\
        Chuẩn bị bước vào #text(fill: rgb("#fde047"), weight: "bold")[Bài Tập Cuối Chương III: Tổng Ôn Hệ Thức Lượng]!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 13pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
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
