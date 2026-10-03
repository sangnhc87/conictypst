#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Tích Của Một Số Với Một Vectơ],
  subtitle: [TOÁN 10 — CHƯƠNG IV: ĐỊNH NGHĨA, TÍNH CHẤT, ĐIỀU KIỆN CÙNG PHƯƠNG & PHÂN TÍCH VECTƠ],
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
// PHẦN I: ĐỊNH NGHĨA TÍCH MỘT SỐ VỚI VECTƠ
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia-tich-so", "🎯", [I. Định Nghĩa Tích Của Một Số Với Vectơ])

#lt-slide-back(title: "🎯 Định Nghĩa Phép Nhân Vectơ Với Một Số")[
  #lt-two-col(
    ratio: (56%, 44%),
    [
      #lt-definition(title: "Định nghĩa tích k a")[
        Cho số thực $k != 0$ và vectơ $arrow(a) != arrow(0)$. Tích của số $k$ với vectơ $arrow(a)$ là một vectơ, kí hiệu là $k arrow(a)$, được xác định:
        - *Cùng hướng* với $arrow(a)$ nếu $k > 0$.
        - *Ngược hướng* với $arrow(a)$ nếu $k < 0$.
        - *Độ dài:* $|k arrow(a)| = |k| dot |arrow(a)|$.
      ]
      #v(0.2em)
      #lt-important(title: "Quy ước đặc biệt")[
        - $0 dot arrow(a) = arrow(0)$ với mọi vectơ $arrow(a)$.
        - $k dot arrow(0) = arrow(0)$ với mọi số thực $k$.
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Minh Họa Hình Học $k arrow(a)$]
          #v(0.3em)
          #cetz.canvas({
            import cetz.draw: *
            let u = 1.3

            // Gốc a
            line((0, 2.4), (2*u, 2.4), mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 2pt + rgb("#2563eb"))
            content((u, 2.7), text(size: 9.5pt, fill: rgb("#2563eb"), weight: "bold")[$arrow(a)$])

            // 2 a
            line((0, 1.6), (4*u, 1.6), mark: (end: "stealth", fill: rgb("#16a34a")), stroke: 2pt + rgb("#16a34a"))
            content((2*u, 1.9), text(size: 9.5pt, fill: rgb("#16a34a"), weight: "bold")[$2 arrow(a)$ (cùng hướng, dài gấp đôi)])

            // -1 a
            line((2*u, 0.8), (0, 0.8), mark: (end: "stealth", fill: rgb("#dc2626")), stroke: 2pt + rgb("#dc2626"))
            content((u, 1.1), text(size: 9.5pt, fill: rgb("#dc2626"), weight: "bold")[$-arrow(a)$ (ngược hướng, cùng độ dài)])

            // -1.5 a
            line((3*u, 0), (0, 0), mark: (end: "stealth", fill: rgb("#d97706")), stroke: 2pt + rgb("#d97706"))
            content((1.5*u, 0.3), text(size: 9.5pt, fill: rgb("#d97706"), weight: "bold")[$-1.5 arrow(a)$ (ngược hướng, dài gấp 1.5)])
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🔍 Ví Dụ Trực Quan Đầu Tiên")[
  #lt-example(title: "Ví dụ 1: Điểm chia đoạn thẳng")[
    Cho đoạn thẳng $A B$ có độ dài $6$ cm và điểm $M$ nằm giữa $A, B$ sao cho $A M = 2$ cm.
    Hãy biểu diễn vectơ $arrow(A M)$ và $arrow(M B)$ theo vectơ $arrow(A B)$:
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Xét vectơ $arrow(A M)$ và $arrow(A B)$:]\
        - Hai vectơ cùng hướng (từ trái sang phải).\
        - Độ dài: $A M / A B = 2/6 = 1/3$.\
        $arrow$ Kết luận: $arrow(A M) = 1/3 arrow(A B)$.
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"))[2. Xét vectơ $arrow(B M)$ và $arrow(A B)$:]\
        - Hai vectơ ngược hướng nhau.\
        - Độ dài: $B M = A B - A M = 4$ cm $arrow B M / A B = 2/3$.\
        $arrow$ Kết luận: $arrow(B M) = -2/3 arrow(A B)$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: TÍNH CHẤT CỦA PHÉP NHÂN VỚI MỘT SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-tinh-chat-phep-nhan", "⚡", [II. Các Tính Chất Của Phép Nhân])

#lt-slide-back(title: "⚡ Các Tính Chất Đại Số Cơ Bản")[
  #lt-theorem(title: "Định lí tính chất phép nhân")[
    Với hai vectơ $arrow(a), arrow(b)$ bất kì và mọi số thực $h, k$, ta luôn có:
  ]
  #v(0.2em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 8pt,
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[1. Tính chất phân phối với tổng vectơ:]
        $ k (arrow(a) + arrow(b)) = k arrow(a) + k arrow(b) $
      ]
    ],
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[2. Tính chất phân phối với tổng vô hướng:]
        $ (h + k) arrow(a) = h arrow(a) + k arrow(a) $
      ]
    ],
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[3. Tính chất kết hợp:]
        $ h (k arrow(a)) = (h k) arrow(a) $
      ]
    ],
    [
      #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"))[4. Phần tử đơn vị:]
        $ 1 dot arrow(a) = arrow(a)quad"và"quad (-1) dot arrow(a) = -arrow(a) $
      ]
    ]
  )
  #v(0.2em)
  #lt-tip(title: "Nhận xét sư phạm quan trọng")[
    Phép nhân một số với vectơ tuân theo đầy đủ các quy tắc đại số tương tự như nhân đơn thức với đa thức trong đại số thông thường.
  ]
]

// ════════════════════════════════════════════════
// PHẦN III: HỆ THỨC TRUNG ĐIỂM & TRỌNG TÂM
// ════════════════════════════════════════════════
#lt-section-link("sec-he-thuc-trung-diem-trong-tam", "📐", [III. Hệ Thức Trung Điểm & Trọng Tâm])

#lt-slide-back(title: "📐 Hệ Thức Trung Điểm Mở Rộng")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-important(title: "Định lí hệ thức trung điểm")[
        Điểm $I$ là trung điểm đoạn thẳng $A B$ khi và chỉ khi:
        $ arrow(I A) + arrow(I B) = arrow(0) $
        Với mọi điểm $M$ tùy ý, ta có:
        $ arrow(M A) + arrow(M B) = 2 arrow(M I) $
        hay:
        $ arrow(M I) = 1/2 (arrow(M A) + arrow(M B)) $
      ]
      #v(0.2em)
      #lt-tip(title: "Ý nghĩa")[
        Vectơ nối tới trung điểm bằng *trung bình cộng* hai vectơ cạnh!
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Trung Điểm $I$ & Điểm $M$ Bất Kỳ]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            let M = (1.5, 2.2)
            let A = (0, 0)
            let B = (3.2, 0)
            let I = (1.6, 0)

            // Đoạn AB
            line(A, B, stroke: 1.5pt + rgb("#64748b"))
            // Đường trung tuyến MI
            line(M, I, mark: (end: "stealth", fill: rgb("#dc2626")), stroke: 2pt + rgb("#dc2626"))
            // MA, MB
            line(M, A, mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 1.5pt + rgb("#2563eb"))
            line(M, B, mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 1.5pt + rgb("#2563eb"))

            circle(A, radius: 2.5pt, fill: black)
            circle(B, radius: 2.5pt, fill: black)
            circle(I, radius: 2.5pt, fill: rgb("#dc2626"))
            circle(M, radius: 2.5pt, fill: rgb("#2563eb"))

            content((-0.2, -0.2), text(size: 9pt, weight: "bold")[$A$])
            content((3.4, -0.2), text(size: 9pt, weight: "bold")[$B$])
            content((1.6, -0.3), text(size: 9pt, fill: rgb("#dc2626"), weight: "bold")[$I$])
            content((1.5, 2.5), text(size: 9pt, fill: rgb("#2563eb"), weight: "bold")[$M$])
            content((2.1, 1.2), text(size: 9pt, fill: rgb("#dc2626"), weight: "bold")[$2 arrow(M I)$])
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Hệ Thức Trọng Tâm Mở Rộng")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-important(title: "Định lí hệ thức trọng tâm")[
        Điểm $G$ là trọng tâm tam giác $A B C$ khi và chỉ khi:
        $ arrow(G A) + arrow(G B) + arrow(G C) = arrow(0) $
        Với mọi điểm $M$ tùy ý, ta có:
        $ arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G) $
        hay:
        $ arrow(M G) = 1/3 (arrow(M A) + arrow(M B) + arrow(M C)) $
      ]
      #v(0.2em)
      #lt-tip(title: "Trường hợp M trùng A")[
        $arrow(A B) + arrow(A C) = 3 arrow(A G) = 2 arrow(A I)$ (với $I$ là trung điểm $B C$).
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Trọng Tâm $G$ Tam Giác $A B C$]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            let A = (1.5, 2.4)
            let B = (0, 0)
            let C = (3.6, 0)
            let I = (1.8, 0)
            let G = ((A.at(0) + B.at(0) + C.at(0))/3, (A.at(1) + B.at(1) + C.at(1))/3)

            // Tam giác
            line(A, B, stroke: 1.5pt + rgb("#64748b"))
            line(B, C, stroke: 1.5pt + rgb("#64748b"))
            line(C, A, stroke: 1.5pt + rgb("#64748b"))

            // Trung tuyến AI
            line(A, I, stroke: 1pt + rgb("#94a3b8"), dash: "dashed")

            // Vectơ GA, GB, GC
            line(G, A, mark: (end: "stealth", fill: rgb("#7c3aed")), stroke: 1.8pt + rgb("#7c3aed"))
            line(G, B, mark: (end: "stealth", fill: rgb("#7c3aed")), stroke: 1.8pt + rgb("#7c3aed"))
            line(G, C, mark: (end: "stealth", fill: rgb("#7c3aed")), stroke: 1.8pt + rgb("#7c3aed"))

            circle(G, radius: 3pt, fill: rgb("#7c3aed"))
            content((G.at(0) + 0.35, G.at(1) + 0.1), text(size: 9.5pt, fill: rgb("#7c3aed"), weight: "bold")[$G$])
            content((A.at(0), A.at(1) + 0.25), text(size: 9pt, weight: "bold")[$A$])
            content((-0.2, -0.2), text(size: 9pt, weight: "bold")[$B$])
            content((3.8, -0.2), text(size: 9pt, weight: "bold")[$C$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: ĐIỀU KIỆN CÙNG PHƯƠNG & THẲNG HÀNG
// ════════════════════════════════════════════════
#lt-section-link("sec-dieu-kien-cung-phuong", "🔗", [IV. Điều Kiện Hai Vectơ Cùng Phương & Ba Điểm Thẳng Hàng])

#lt-slide-back(title: "🔗 Điều Kiện Hai Vectơ Cùng Phương")[
  #lt-theorem(title: "Định lí điều kiện cùng phương")[
    Điều kiện cần và đủ để hai vectơ $arrow(a)$ và $arrow(b)$ ($arrow(a) != arrow(0)$) cùng phương là tồn tại một số thực $k$ sao cho:
    $ arrow(b) = k arrow(a) $
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#22c55e"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#15803d"))[Trường hợp 1: $k > 0$]\
        - Hai vectơ $arrow(a)$ và $arrow(b)$ cùng hướng.\
        - Tỉ số độ dài: $k = |arrow(b)| / |arrow(a)|$.
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"))[Trường hợp 2: $k < 0$]\
        - Hai vectơ $arrow(a)$ và $arrow(b)$ ngược hướng.\
        - Tỉ số độ dài: $k = - |arrow(b)| / |arrow(a)|$.
      ]
    ]
  )
]

#lt-slide-back(title: "📍 Ứng Dụng: Chứng Minh Ba Điểm Thẳng Hàng")[
  #lt-important(title: "Quy tắc chứng minh ba điểm thẳng hàng")[
    Ba điểm phân biệt $A, B, C$ thẳng hàng khi và chỉ khi hai vectơ $arrow(A B)$ và $arrow(A C)$ cùng phương, tức là tồn tại số thực $k != 0$ sao cho:
    $ arrow(A B) = k arrow(A C) $
  ]
  #v(0.3em)
  #lt-example(title: "Phương pháp giải bài toán thẳng hàng kinh điển")[
    - *Bước 1:* Chọn hai vectơ cơ sở không cùng phương $arrow(e_1), arrow(e_2)$ (thường là hai cạnh tam giác).
    - *Bước 2:* Biểu diễn $arrow(A B) = m_1 arrow(e_1) + n_1 arrow(e_2)$ và $arrow(A C) = m_2 arrow(e_1) + n_2 arrow(e_2)$.
    - *Bước 3:* So sánh tỉ lệ: $A, B, C$ thẳng hàng $<=> m_1 / m_2 = n_1 / n_2$.
  ]
]

// ════════════════════════════════════════════════
// PHẦN V: PHÂN TÍCH VECTƠ THEO HAI VECTƠ CƠ SỞ
// ════════════════════════════════════════════════
#lt-section-link("sec-phan-tich-vecto", "🧩", [V. Phân Tích Vectơ Theo Hai Vectơ Cơ Sở])

#lt-slide-back(title: "🧩 Định Lí Phân Tích Vectơ")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-theorem(title: "Định lí phân tích một vectơ")[
        Cho hai vectơ không cùng phương $arrow(a)$ và $arrow(b)$. Khi đó với mọi vectơ $arrow(x)$, luôn tồn tại *duy nhất* cặp số thực $(m, n)$ sao cho:
        $ arrow(x) = m arrow(a) + n arrow(b) $
      ]
      #v(0.2em)
      #lt-important(title: "Ý nghĩa nền tảng")[
        Ta nói rằng vectơ $arrow(x)$ đã được *phân tích (hay biểu thị)* theo hai vectơ không cùng phương $arrow(a)$ và $arrow(b)$.\
        Đây chính là cơ sở hình thành *hệ toạ độ Oxy* trong mặt phẳng!
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Phân Tích $arrow(x) = m arrow(a) + n arrow(b)$]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            let O = (0, 0)
            let A = (2.2, 0)
            let B = (0.9, 1.8)
            let C = (3.1, 1.8)

            // Đường song song dóng
            line(A, C, stroke: 1pt + rgb("#94a3b8"), dash: "dashed")
            line(B, C, stroke: 1pt + rgb("#94a3b8"), dash: "dashed")

            // Vectơ m a và n b
            line(O, A, mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 2pt + rgb("#2563eb"))
            line(O, B, mark: (end: "stealth", fill: rgb("#16a34a")), stroke: 2pt + rgb("#16a34a"))

            // Vectơ tổng x
            line(O, C, mark: (end: "stealth", fill: rgb("#d81b60")), stroke: 2.2pt + rgb("#d81b60"))

            circle(O, radius: 2.5pt, fill: black)
            content((-0.2, -0.2), text(size: 9pt, weight: "bold")[$O$])
            content((1.1, -0.3), text(size: 9pt, fill: rgb("#2563eb"), weight: "bold")[$m arrow(a)$])
            content((0.2, 1.1), text(size: 9pt, fill: rgb("#16a34a"), weight: "bold")[$n arrow(b)$])
            content((1.8, 1.2), text(size: 9.5pt, fill: rgb("#d81b60"), weight: "bold")[$arrow(x)$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN VI: BÀI TẬP TRẮC NGHIỆM CHỌN 1 ĐÁP ÁN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "✍️", [VI. Luyện tập: Trắc nghiệm 4 phương án])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — TÍCH CỦA MỘT SỐ VỚI MỘT VECTƠ],
  questions: (
    (num: 1, type: "TN", desc: [Hướng & Độ Dài Vectơ Tích]),
    (num: 2, type: "TN", desc: [Hệ Thức Vectơ Trung Điểm]),
    (num: 3, type: "TN", desc: [Tỉ Lệ Vectơ Trọng Tâm]),
    (num: 4, type: "TN", desc: [Phân Tích Vectơ Hình Bình Hành]),
    (num: 5, type: "TN", desc: [Điểm Chia Đoạn Thẳng]),
    (num: 6, type: "TN", desc: [Phân Tích Vectơ Đoạn Nối]),
    (num: 7, type: "DS", desc: [Đúng/Sai Trọng Tâm & Trung Tuyến]),
    (num: 8, type: "TLN", desc: [Phân Tích Điểm Chia Tỉ Lệ]),
    (num: 9, type: "TLN", desc: [Cân Bằng Đòn Bẩy Vật Lí 10]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho vectơ $arrow(a) != arrow(0)$ và số thực $k = -3$. Mệnh đề nào sau đây là khẳng định đúng về vectơ $-3 arrow(a)$?],
  (
    [Vectơ $-3 arrow(a)$ cùng hướng với $arrow(a)$ và có độ dài bằng $3 |arrow(a)|$.],
    [Vectơ $-3 arrow(a)$ ngược hướng với $arrow(a)$ và có độ dài bằng $3 |arrow(a)|$.],
    [Vectơ $-3 arrow(a)$ ngược hướng với $arrow(a)$ và có độ dài bằng $-3 |arrow(a)|$.],
    [Vectơ $-3 arrow(a)$ cùng phương, cùng hướng và có độ dài bằng $|arrow(a)| / 3$.],
  ),
  correct: 2,
  num: 1,
  de: "Đề 09A — Hướng & Độ Dài Vectơ Tích",
  loigiai: [
    Theo định nghĩa tích một số với một vectơ:\
    - Vì $k = -3 < 0$ nên vectơ $-3 arrow(a)$ *ngược hướng* với vectơ $arrow(a)$.\
    - Độ dài: $|-3 arrow(a)| = |-3| dot |arrow(a)| = 3 |arrow(a)|$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Cho đoạn thẳng $A B$ có trung điểm là $M$ và một điểm $O$ bất kì. Khẳng định nào sau đây luôn đúng?],
  (
    [$arrow(O A) + arrow(O B) = arrow(O M)$],
    [$arrow(O A) + arrow(O B) = 2 arrow(O M)$],
    [$arrow(O A) + arrow(O B) = 1/2 arrow(O M)$],
    [$arrow(O M) = 2 (arrow(O A) + arrow(O B))$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 09A — Hệ Thức Vectơ Trung Điểm",
  loigiai: [
    Theo tính chất trung điểm mở rộng với điểm $O$ tùy ý:\
    $arrow(O A) + arrow(O B) = 2 arrow(O M)$ (hay $arrow(O M) = 1/2 (arrow(O A) + arrow(O B))$).\
    Chọn đáp án *B: OA + OB = 2 OM*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có trọng tâm $G$. Gọi $M$ là trung điểm cạnh $B C$. Đẳng thức vectơ nào sau đây đúng?],
  (
    [$arrow(A G) = 2/3 arrow(A M)$],
    [$arrow(A G) = 1/3 arrow(A M)$],
    [$arrow(A M) = 2/3 arrow(A G)$],
    [$arrow(G M) = 1/2 arrow(A G)$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 09B — Tỉ Lệ Vectơ Trọng Tâm",
  loigiai: [
    $G$ nằm trên trung tuyến $A M$ và chia $A M$ theo tỉ số $A G = 2/3 A M$.\
    Vì hai vectơ $arrow(A G)$ và $arrow(A M)$ cùng hướng nên $arrow(A G) = 2/3 arrow(A M)$.\
    (Chú ý: $arrow(G M) = -1/2 arrow(A G)$ do ngược hướng). Chọn đáp án *A*.
  ]
)

#lt-tn(
  [Cho hình bình hành $A B C D$. Gọi $I$ là trung điểm của cạnh $C D$. Biểu diễn vectơ $arrow(A I)$ theo hai vectơ $arrow(A B)$ và $arrow(A D)$ là:],
  (
    [$arrow(A I) = arrow(A B) + 1/2 arrow(A D)$],
    [$arrow(A I) = 1/2 arrow(A B) + arrow(A D)$],
    [$arrow(A I) = arrow(A B) + arrow(A D)$],
    [$arrow(A I) = 2 arrow(A B) + arrow(A D)$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 09B — Phân Tích Vectơ Hình Bình Hành",
  loigiai: [
    Ta có $arrow(A I) = arrow(A D) + arrow(D I)$.\
    Vì $I$ là trung điểm $C D$ nên $arrow(D I) = 1/2 arrow(D C) = 1/2 arrow(A B)$.\
    Do đó $arrow(A I) = arrow(A D) + 1/2 arrow(A B) = arrow(A B) + 1/2 arrow(A D)$? Không, $arrow(A I) = 1/2 arrow(A B) + arrow(A D)$!\
    Sắp xếp lại: $arrow(A I) = 1/2 arrow(A B) + arrow(A D)$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Cho đoạn thẳng $A B$ và điểm $M$ thỏa mãn $arrow(M A) + 3 arrow(M B) = arrow(0)$. Mệnh đề nào sau đây đúng?],
  (
    [$M$ nằm ngoài đoạn thẳng $A B$ và $M A = 3 M B$.],
    [$M$ nằm giữa $A, B$ và $M A = 3 M B$.],
    [$M$ nằm giữa $A, B$ và $M B = 3 M A$.],
    [$M$ nằm ngoài đoạn thẳng $A B$ và $M B = 3 M A$.],
  ),
  correct: 2,
  num: 5,
  de: "Đề 09C — Điểm Chia Đoạn Thẳng",
  loigiai: [
    Từ $arrow(M A) + 3 arrow(M B) = arrow(0) arrow arrow(M A) = -3 arrow(M B)$.\
    Vì hệ số $-3 < 0$ nên hai vectơ $arrow(M A)$ và $arrow(M B)$ ngược hướng nhau $arrow M$ nằm giữa $A$ và $B$.\
    Về độ dài: $M A = |-3| dot M B = 3 M B$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$. Gọi $M$ là trung điểm $A B$, $N$ là điểm trên $A C$ sao cho $A N = 2 N C$. Biểu diễn vectơ $arrow(M N)$ theo $arrow(A B)$ và $arrow(A C)$ là:],
  (
    [$arrow(M N) = -1/2 arrow(A B) + 2/3 arrow(A C)$],
    [$arrow(M N) = 1/2 arrow(A B) - 2/3 arrow(A C)$],
    [$arrow(M N) = -1/2 arrow(A B) + 1/3 arrow(A C)$],
    [$arrow(M N) = 1/2 arrow(A B) + 2/3 arrow(A C)$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 09C — Phân Tích Vectơ Đoạn Nối",
  loigiai: [
    Chèn gốc $A$ theo quy tắc hiệu: $arrow(M N) = arrow(A N) - arrow(A M)$.\
    Vì $M$ là trung điểm $A B$ nên $arrow(A M) = 1/2 arrow(A B)$.\
    Vì $A N = 2 N C arrow A N = 2/3 A C arrow arrow(A N) = 2/3 arrow(A C)$.\
    Vậy $arrow(M N) = 2/3 arrow(A C) - 1/2 arrow(A B) = -1/2 arrow(A B) + 2/3 arrow(A C)$. Chọn *A*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VII: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [VII. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho tam giác $A B C$, gọi $M$ là trung điểm cạnh $B C$ và $G$ là trọng tâm tam giác. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Đẳng thức $arrow(A B) + arrow(A C) = 2 arrow(A M)$ luôn đúng.], "true": true),
    (body: [Vectơ $arrow(A G) = 2/3 arrow(A M)$ và $arrow(G B) + arrow(G C) = 2 arrow(G M)$.], "true": true),
    (body: [Ta có phân tích $arrow(A G) = 1/3 arrow(A B) + 1/3 arrow(A C)$.], "true": true),
    (body: [Đẳng thức $arrow(G B) + arrow(G C) = 2 arrow(G A)$ là khẳng định đúng.], "true": false),
  ),
  de: "Đề 09D — Đúng/Sai Trọng Tâm & Trung Tuyến",
  num: 7,
  loigiai: [
    - a) *Đ:* Quy tắc trung điểm với đỉnh $A$: $arrow(A B) + arrow(A C) = 2 arrow(A M)$.
    - b) *Đ:* Trọng tâm $G$ nằm trên $A M$ cách đỉnh khoảng $2/3 A M$, và $M$ là trung điểm $B C$ nên $arrow(G B) + arrow(G C) = 2 arrow(G M)$.
    - c) *Đ:* $arrow(A G) = 2/3 arrow(A M) = 2/3 dot 1/2 (arrow(A B) + arrow(A C)) = 1/3 arrow(A B) + 1/3 arrow(A C)$.
    - d) *S:* Vì $arrow(G A) + arrow(G B) + arrow(G C) = arrow(0) arrow arrow(G B) + arrow(G C) = -arrow(G A)$ (không phải $2 arrow(G A)$).
  ]
)

#lt-tln(
  [Cho tam giác $A B C$. Gọi $I$ là điểm trên cạnh $B C$ sao cho $2 C I = 3 B I$. Biết rằng vectơ $arrow(A I)$ được phân tích dưới dạng $arrow(A I) = m arrow(A B) + n arrow(A C)$ với $m, n$ là các số thực. Giá trị của biểu thức $P = 5 m + 10 n$ bằng bao nhiêu?],
  [7],
  num: 8,
  de: "Đề 09E — Phân Tích Điểm Chia Tỉ Lệ",
  loigiai: [
    Vì $2 C I = 3 B I$ và $I$ nằm giữa $B, C$ nên $2 arrow(I C) + 3 arrow(I B) = arrow(0)$.\
    Chèn gốc $A$: $2 (arrow(A C) - arrow(A I)) + 3 (arrow(A B) - arrow(A I)) = arrow(0)$.\
    $arrow 5 arrow(A I) = 3 arrow(A B) + 2 arrow(A C) arrow arrow(A I) = 3/5 arrow(A B) + 2/5 arrow(A C)$.\
    Suy ra $m = 3/5, n = 2/5$. Giá trị: $P = 5(3/5) + 10(2/5) = 3 + 4 = 7$. Đáp số: *$7$*.
  ]
)

#lt-tln(
  [Một thanh đòn đồng chất nhẹ có chiều dài $A B = 60$ cm. Đầu $A$ treo vật nặng $m_1 = 2$ kg, đầu $B$ treo vật nặng $m_2 = 4$ kg. Để thanh nằm cân bằng nằm ngang trên điểm tựa $O$ thì theo quy tắc đòn bẩy ta có hệ thức vectơ $m_1 arrow(O A) + m_2 arrow(O B) = arrow(0)$. Khoảng cách từ điểm tựa $O$ đến đầu $A$ bằng bao nhiêu xentimét?],
  [40],
  num: 9,
  de: "Đề 09F — Cân Bằng Đòn Bẩy Vật Lí 10",
  loigiai: [
    Từ $2 arrow(O A) + 4 arrow(O B) = arrow(0) arrow arrow(O A) = -2 arrow(O B)$.\
    Do đó $O$ nằm giữa $A, B$ và độ dài $O A = 2 O B$.\
    Ta có $O A + O B = A B = 60$ cm $arrow 2 O B + O B = 60 arrow 3 O B = 60 arrow O B = 20$ cm.\
    Suy ra khoảng cách $O A = 2 dot 20 = 40$ cm. Đáp số: *$40$*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VIII: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c4-b3", "💎", [VIII. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Kiến Thức Tích Một Số Với Vectơ")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. ĐỊNH NGHĨA $k arrow(a)$]
        #v(0.2em)
        #text(size: 10pt)[
          - $k > 0$: Cùng hướng $arrow(a)$.
          - $k < 0$: Ngược hướng $arrow(a)$.
          - Độ dài: $|k arrow(a)| = |k| |arrow(a)|$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. TRUNG ĐIỂM & TRỌNG TÂM]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(M I) = 1/2(arrow(M A) + arrow(M B))$.
          - $arrow(M G) = 1/3(arrow(M A) + arrow(M B) + arrow(M C))$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. CÙNG PHƯƠNG]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(b)$ cùng phương $arrow(a) <=> arrow(b) = k arrow(a)$.
          - Ứng dụng: $A, B, C$ thẳng hàng khi $arrow(A B) = k arrow(A C)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. PHÂN TÍCH VECTƠ]
        #v(0.2em)
        #text(size: 10pt)[
          - Duy nhất cặp $(m, n)$:
          $arrow(x) = m arrow(a) + n arrow(b)$.
          - Nền tảng hệ trục toạ độ $O x y$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. TÂM TỈ CỰ VẬT LÍ]
        #v(0.2em)
        #text(size: 10pt)[
          - $m_1 arrow(O A) + m_2 arrow(O B) = arrow(0)$.
          - Điểm cân bằng khối tâm và đòn bẩy.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. BƯỚC ĐỆM TIẾP THEO]
        #v(0.2em)
        #text(size: 10pt)[
          - Bài 4: Tích vô hướng của 2 vectơ $arrow(a) dot arrow(b)$.
          - Góc giữa 2 vectơ và công của lực.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 3 — CHƯƠNG IV!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Tích của một số với vectơ mở ra cánh cửa giải tích và toạ độ hoá hình học."\
        Chuẩn bị bứt phá cùng #text(fill: rgb("#fde047"), weight: "bold")[Bài 4: Tích Vô Hướng Của Hai Vectơ]!
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
