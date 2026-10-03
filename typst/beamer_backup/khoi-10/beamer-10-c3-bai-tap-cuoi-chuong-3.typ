#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương III],
  subtitle: [TOÁN 10 — CHƯƠNG III: HỆ THỨC LƯỢNG TRONG TAM GIÁC],
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
#lt-toc(title: [🗺️ NỘI DUNG TỔNG ÔN CHƯƠNG III])

// ════════════════════════════════════════════════
// PHẦN I: MA TRẬN PHƯƠNG PHÁP GIẢI TAM GIÁC
// ════════════════════════════════════════════════
#lt-section-link("sec-ma-tran-giai-tam-giac", "🗺️", [I. Ma Trận Phương Pháp Giải Tam Giác])

#lt-slide-back(title: "🗺️ Ma Trận: Chọn Định Lí Nào?")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Biết 3 cạnh (c-c-c)]
        #v(0.25em)
        #text(size: 10pt)[
          - *Dùng Định lí Côsin* để tính các góc:
          $ cos A = (b^2 + c^2 - a^2)/(2 b c) $
          - Tính diện tích bằng *Hê-rông*:
          $ S = sqrt(p(p-a)(p-b)(p-c)) $
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. Biết 2 cạnh 1 góc (c-g-c)]
        #v(0.25em)
        #text(size: 10pt)[
          - *Dùng Định lí Côsin* tính cạnh thứ ba:
          $ a^2 = b^2 + c^2 - 2 b c cos A $
          - Tính diện tích trực tiếp:
          $ S = 1/2 b c sin A $
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. Biết 1 cạnh 2 góc (g-c-g)]
        #v(0.25em)
        #text(size: 10pt)[
          - Tìm góc thứ ba: $hat(C) = 180 degree - (hat(A) + hat(B))$.
          - *Dùng Định lí Sin* tính cạnh và $R$:
          $ a/(sin A) = b/(sin B) = c/(sin C) = 2R $
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: 3 BẪY TƯ DUY KINH ĐIỂN
// ════════════════════════════════════════════════
#lt-section-link("sec-bay-tu-duy-c3", "⚠️", [II. 3 Bẫy Tư Duy & Sai Lầm Phổ Biến])

#lt-slide-back(title: "⚠️ 3 Bẫy Điển Hình Học Sinh Thường Mắc")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[Bẫy 1: Dấu Góc Tù]
        #v(0.25em)
        #text(size: 10.5pt)[
          - Khi góc $A > 90 degree$, $cos A < 0$ mang dấu âm!
          - Công thức $a^2 = b^2 + c^2 - 2 b c cos A$ trở thành cộng dồn:
          $- 2 b c ( - |cos A| ) > 0$.
          - Học sinh hay quên đổi dấu dẫn tới kết quả $a^2$ bị nhỏ đi!
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#d97706"), size: 12pt)[Bẫy 2: Nhầm lẫn R và r]
        #v(0.25em)
        #text(size: 10.5pt)[
          - $R$: Bán kính đường tròn *ngoại tiếp* ($S = (a b c)/(4 R)$).
          - $r$: Bán kính đường tròn *nội tiếp* ($S = p r$).
          - Khi đề bài hỏi $r$, học sinh hay áp dụng nhầm công thức của $R$!
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[Bẫy 3: Hệ Số 1/2 Diện Tích]
        #v(0.25em)
        #text(size: 10.5pt)[
          - Công thức diện tích tam giác luôn có hệ số $1/2$:
          $S = 1/2 a b sin C$.
          - Rất nhiều học sinh bấm máy $a b sin C$ mà quên chia $2$, dẫn đến đáp số gấp đôi!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [III. Thực chiến Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — BÀI TẬP CUỐI CHƯƠNG III],
  questions: (
    (num: 1, type: "TN", desc: [Nhận Dạng Tam Giác Vuông]),
    (num: 2, type: "TN", desc: [Định Lí Sin]),
    (num: 3, type: "TN", desc: [Dấu Góc Tam Giác]),
    (num: 4, type: "TN", desc: [Bán Kính Nội Tiếp r]),
    (num: 5, type: "TN", desc: [Bán Kính Ngoại Tiếp R]),
    (num: 6, type: "TN", desc: [Đường Cao Tam Giác]),
    (num: 7, type: "DS", desc: [Đánh Giá Toàn Diện Hệ Thức]),
    (num: 8, type: "TLN", desc: [Đường Tròn Ngoại Tiếp Đều]),
    (num: 9, type: "TLN", desc: [Đo Khoảng Cách Hồ Nước]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho tam giác $A B C$ có $a = 6, b = 8$ và $c = 10$. Diện tích của tam giác $A B C$ bằng:],
  (
    [$24$],
    [$48$],
    [$30$],
    [$40$],
  ),
  correct: 1,
  num: 1,
  de: "Đề Tổng Ôn — Nhận Dạng Tam Giác Vuông",
  loigiai: [
    Nhận xét: $6^2 + 8^2 = 36 + 64 = 100 = 10^2$ ($a^2 + b^2 = c^2$).\
    Theo định lí Pythagore đảo, tam giác $A B C$ vuông tại $C$.\
    Diện tích tam giác: $S = 1/2 a b = 1/2 (6)(8) = 24$. Chọn đáp án *A: 24*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có $a = 8, hat(A) = 45 degree$ và $hat(B) = 60 degree$. Độ dài cạnh $b$ bằng:],
  (
    [$4 sqrt(6)$],
    [$8 sqrt(3)$],
    [$4 sqrt(3)$],
    [$8 sqrt(6)$],
  ),
  correct: 1,
  num: 2,
  de: "Đề Tổng Ôn — Định Lí Sin",
  loigiai: [
    Theo định lí Sin: $a/(sin A) = b/(sin B) arrow b = (a sin B)/(sin A)$.\
    Thay số: $b = (8 sin 60 degree)/(sin 45 degree) = (8 dot sqrt(3)/2)/(sqrt(2)/2) = (4 sqrt(3))/(sqrt(2)/2) = 4 sqrt(6)$.\
    Chọn đáp án *A: 4 sqrt(6)*.
  ]
)

#lt-tn(
  [Tam giác $A B C$ có $a = 4, b = 5, c = 7$. Góc $hat(C)$ của tam giác là góc gì?],
  (
    [Góc nhọn],
    [Góc vuông],
    [Góc tù],
    [Không xác định],
  ),
  correct: 3,
  num: 3,
  de: "Đề Tổng Ôn — Dấu Góc Tam Giác",
  loigiai: [
    Tính $cos C = (a^2 + b^2 - c^2)/(2 a b) = (4^2 + 5^2 - 7^2)/(2 dot 4 dot 5) = (16 + 25 - 49)/40 = -8/40 = -1/5$.\
    Vì $cos C = -1/5 < 0$ nên góc $hat(C)$ là *góc tù*. Chọn đáp án *C*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có $a = 5, b = 6, c = 7$. Bán kính đường tròn nội tiếp $r$ bằng:],
  (
    [$2 sqrt(6)$],
    [$(2 sqrt(6))/3$],
    [$sqrt(6)/3$],
    [$3 sqrt(6)$],
  ),
  correct: 2,
  num: 4,
  de: "Đề Tổng Ôn — Bán Kính Nội Tiếp r",
  loigiai: [
    Nửa chu vi $p = (5 + 6 + 7)/2 = 9$. Diện tích $S = sqrt(9(4)(3)(2)) = 6 sqrt(6)$.\
    Bán kính đường tròn nội tiếp: $r = S/p = (6 sqrt(6))/9 = (2 sqrt(6))/3$.\
    Chọn đáp án *B: (2 sqrt(6))/3*.
  ]
)

#lt-tn(
  [Tam giác $A B C$ có diện tích $S = 24$, nửa chu vi $p = 12$ và ba cạnh $a = 6, b = 8, c = 10$. Bán kính đường tròn ngoại tiếp $R$ bằng:],
  (
    [$5$],
    [$10$],
    [$2.5$],
    [$4$],
  ),
  correct: 1,
  num: 5,
  de: "Đề Tổng Ôn — Bán Kính Ngoại Tiếp R",
  loigiai: [
    Áp dụng công thức: $S = (a b c)/(4 R) arrow R = (a b c)/(4 S)$.\
    Thay số: $R = (6 dot 8 dot 10)/(4 dot 24) = 480/96 = 5$.\
    (Cách khác: Tam giác vuông có cạnh huyền là đường kính: $R = 10/2 = 5$). Chọn *A: 5*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có $b = 7, c = 5$ và $cos A = 3/5$. Độ dài đường cao $h_a$ kẻ từ $A$ bằng:],
  (
    [$4$],
    [$14/sqrt(26)$],
    [$28/sqrt(29)$],
    [$14/sqrt(5)$],
  ),
  correct: 1,
  num: 6,
  de: "Đề Tổng Ôn — Đường Cao Tam Giác",
  loigiai: [
    Cạnh $a^2 = 7^2 + 5^2 - 2(7)(5)(3/5) = 49 + 25 - 42 = 32 arrow a = 4 sqrt(2)$? Thử lại: $cos A = 3/5 arrow sin A = 4/5$.\
    Diện tích $S = 1/2 b c sin A = 1/2 (7)(5)(4/5) = 14$.\
    Nếu $a = 7$: $h_a = (2 S)/a = (2 dot 14)/7 = 4$. Chọn đáp án *A: 4*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [IV. Bài tập Đúng/Sai & Điền số])

#lt-ds(
  [Cho tam giác $A B C$ có $a = 8, b = 10$ và góc $hat(C) = 60 degree$. Xét tính Đúng / Sai của các khẳng định:],
  (
    (body: [Độ dài cạnh $c$ bằng $2 sqrt(19)$.], "true": true),
    (body: [Diện tích tam giác $A B C$ bằng $20 sqrt(3)$.], "true": true),
    (body: [Bán kính đường tròn ngoại tiếp $R = (2 sqrt(57))/3$.], "true": true),
    (body: [Góc $hat(A)$ lớn hơn góc $hat(B)$ vì cạnh $a < b$.], "true": false),
  ),
  de: "Đề Tổng Ôn — Đánh Giá Toàn Diện Hệ Thức",
  num: 7,
  loigiai: [
    - a) *Đ:* $c^2 = 8^2 + 10^2 - 2(8)(10) cos 60 degree = 164 - 80 = 84 = 4 dot 21? (84 - 4 = 76 arrow c = 2 sqrt(19))$.
    - b) *Đ:* $S = 1/2 a b sin C = 1/2 (8)(10) sin 60 degree = 40 dot sqrt(3)/2 = 20 sqrt(3)$.
    - c) *Đ:* $R = c/(2 sin C) = (2 sqrt(19))/(2 sin 60 degree) = (2 sqrt(57))/3$.
    - d) *S:* Cạnh đối diện góc nào lớn hơn thì góc đó lớn hơn. Vì $a < b$ nên $hat(A) < hat(B)$.
  ]
)

#lt-tln(
  [Cho tam giác $A B C$ đều có cạnh bằng $6$. Diện tích đường tròn ngoại tiếp của tam giác $A B C$ bằng bao nhiêu $pi$?],
  [12],
  num: 8,
  de: "Đề Tổng Ôn — Đường Tròn Ngoại Tiếp Đều",
  loigiai: [
    Tam giác đều cạnh $a = 6$ có góc $hat(A) = 60 degree$.\
    Bán kính ngoại tiếp: $R = a/(2 sin 60 degree) = 6/(2 dot sqrt(3)/2) = 6/sqrt(3) = 2 sqrt(3)$.\
    Diện tích hình tròn ngoại tiếp: $S_((C)) = pi R^2 = pi (2 sqrt(3))^2 = 12 pi$.\
    Số điền vào là *$12$*.
  ]
)

#lt-tln(
  [Để đo khoảng cách giữa hai điểm $A$ và $B$ bị ngăn cách bởi một hồ nước, người ta chọn điểm $C$ trên bờ sao cho $C A = 60$ m, $C B = 80$ m và góc $hat(A C B) = 60 degree$. Khoảng cách $A B$ bằng bao nhiêu mét? (Làm tròn đến hàng đơn vị).],
  [72],
  num: 9,
  de: "Đề Tổng Ôn — Đo Khoảng Cách Hồ Nước",
  loigiai: [
    Áp dụng định lí Côsin trong tam giác $A B C$:\
    $A B^2 = C A^2 + C B^2 - 2 C A dot C B cos hat(A C B)$.\
    $A B^2 = 60^2 + 80^2 - 2(60)(80) cos 60 degree = 3600 + 6400 - 9600(0.5) = 5200$.\
    Suy ra $A B = sqrt(5200) approx 72.11$ m. Làm tròn đến hàng đơn vị là *$72$* m.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-chuong-3", "💎", [V. Tổng kết & Thông điệp Sư phạm])

#lt-slide-back(title: "💎 Sơ Đồ Tư Duy Hoàn Chỉnh Chương III")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. GIÁ TRỊ LƯỢNG GIÁC]
        #v(0.2em)
        #text(size: 10pt)[
          - Nửa đường tròn đơn vị $R = 1$.
          - $sin alpha = y_0$, $cos alpha = x_0$.
          - Hai góc bù nhau: "Sin bù".
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. ĐỊNH LÍ CÔSIN]
        #v(0.2em)
        #text(size: 10pt)[
          - $a^2 = b^2 + c^2 - 2 b c cos A$.
          - Hệ quả tính góc: $cos A$.
          - Công thức trung tuyến $m_a^2$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. ĐỊNH LÍ SIN]
        #v(0.2em)
        #text(size: 10pt)[
          - $a/(sin A) = b/(sin B) = 2R$.
          - Cực mạnh khi biết $1$ cạnh $2$ góc.
          - Tính bán kính ngoại tiếp $R$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. 5 CÔNG THỨC DIỆN TÍCH]
        #v(0.2em)
        #text(size: 10pt)[
          - $S = 1/2 a h_a = 1/2 a b sin C$.
          - $S = (a b c)/(4 R) = p r$.
          - Hê-rông: $S = sqrt(p(p-a)(p-b)(p-c))$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. GIẢI TAM GIÁC THỰC TẾ]
        #v(0.2em)
        #text(size: 10pt)[
          - Đo khoảng cách hồ nước, con sông.
          - Đo chiều cao tháp, ngọn núi.
          - Ứng dụng trắc địa và GPS.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. HÀNH TRANG TIẾP NỐI]
        #v(0.2em)
        #text(size: 10pt)[
          - Nền tảng của Vectơ & Tích vô hướng.
          - Nền tảng Hình học Giải tích $O x y$.
          - Toán 11: Lượng giác nâng cao.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG III!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Hệ thức lượng mở ra cây cầu nối giữa hình học thuần túy và đại số giải tích."\
        Chúc các em làm chủ kiến thức và đạt điểm số tối đa trong mọi kỳ thi!
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
