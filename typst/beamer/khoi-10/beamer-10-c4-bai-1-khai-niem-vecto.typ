#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Khái Niệm Vectơ],
  subtitle: [TOÁN 10 — CHƯƠNG IV: HƯỚNG, ĐỘ DÀI & HAI VECTƠ BẰNG NHAU],
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
// PHẦN I: KHỞI ĐỘNG VÀ ĐẶT VẤN ĐỀ
// ════════════════════════════════════════════════
#lt-section-link("sec-khoi-dong-vecto", "🚀", [I. Khởi động: Từ Vật Lí Đến Toán Học])

#lt-slide-back(title: "🚀 Đại Lượng Vô Hướng vs Đại Lượng Có Hướng")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Đại lượng Vô hướng]
        #v(0.3em)
        Chỉ đặc trưng bởi *độ lớn* (kèm đơn vị):
        - Nhiệt độ ($37 degree "C"$).
        - Khối lượng ($50 "kg"$).
        - Thời gian ($45 "phút"$).
        - Diện tích, thể tích, chiều dài...
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[2. Đại lượng Có hướng]
        #v(0.3em)
        Đặc trưng bởi *độ lớn* và *phương, hướng*:
        - Lực kéo $arrow(F)$ làm dịch chuyển vật.
        - Vận tốc $arrow(v)$ của ô tô, máy bay.
        - Độ dịch chuyển $arrow(d)$ trong không gian.
        #v(0.2em)
        #text(fill: rgb("#16a34a"), weight: "bold")[👉 Mô hình toán học chính là: Vectơ!]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ĐỊNH NGHĨA VECTƠ VÀ ĐỘ DÀI
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia-vecto", "📐", [II. Định Nghĩa Vectơ & Độ Dài])

#lt-slide-back(title: "📐 Định Nghĩa Vectơ")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Định nghĩa")[
        *Vectơ* là một đoạn thẳng có hướng (đã chỉ rõ điểm đầu và điểm cuối).
      ]
      #v(0.3em)
      #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 9pt, radius: 7pt)[
        - Ký hiệu: $arrow(A B)$ (điểm đầu $A$, điểm cuối $B$).
        - Khi không cần chỉ rõ điểm đầu và cuối, ta ký hiệu là: $arrow(a), arrow(b), arrow(u), arrow(v), dots$
      ]
      #v(0.2em)
      #lt-important(title: "Độ dài vectơ")[
        Là khoảng cách giữa điểm đầu và điểm cuối:\
        $|arrow(A B)| = A B, quad |arrow(a)|$
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Minh Họa Vectơ AB]
          #v(0.4em)
          #cetz.canvas({
            import cetz.draw: *
            let sc = 1.6
            // Đường thẳng giá d
            line((-0.5*sc, 0.4*sc), (2.8*sc, 1.8*sc), stroke: 0.8pt + rgb("#cbd5e1"), dash: "dashed")
            content((2.9*sc, 1.95*sc), text(size: 9pt, fill: rgb("#94a3b8"))[$d$ (giá)])

            // Vectơ AB
            line((0, 0.6*sc), (2.2*sc, 1.55*sc), mark: (end: "stealth", fill: rgb("#2563eb")), stroke: 2pt + rgb("#2563eb"))

            circle((0, 0.6*sc), radius: 3pt, fill: rgb("#1d4ed8"))
            content((-0.18*sc, 0.75*sc), text(size: 10pt, weight: "bold", fill: rgb("#1d4ed8"))[$A$ (gốc)])

            circle((2.2*sc, 1.55*sc), radius: 2pt, fill: rgb("#2563eb"))
            content((2.35*sc, 1.35*sc), text(size: 10pt, weight: "bold", fill: rgb("#2563eb"))[$B$ (ngọn)])

            // Nhãn độ dài
            content((1.05*sc, 1.35*sc), text(size: 9.5pt, fill: rgb("#d81b60"), weight: "bold")[$|arrow(A B)| = A B$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: PHƯƠNG VÀ HƯỚNG CỦA HAI VECTƠ
// ════════════════════════════════════════════════
#lt-section-link("sec-phuong-va-huong", "🧭", [III. Phương Và Hướng Của Vectơ])

#lt-slide-back(title: "🧭 Phương Của Vectơ — Giá Của Vectơ")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Giá của Vectơ]
        #v(0.25em)
        Đường thẳng đi qua điểm đầu và điểm cuối của vectơ được gọi là *giá* của vectơ đó.
      ]
      #v(0.3em)
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12pt)[2. Hai Vectơ Cùng Phương]
        #v(0.25em)
        Hai vectơ được gọi là *cùng phương* nếu giá của chúng *song song* hoặc *trùng nhau*.
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. Cùng Hướng & Ngược Hướng]
        #v(0.25em)
        *Điều kiện tiên quyết:* Chỉ xét hướng khi hai vectơ *đã cùng phương*!
        - Cùng hướng ($arrow(a) arrow.t.double arrow(b)$).
        - Ngược hướng ($arrow(a) arrow.t.b.double arrow(b)$).
      ]
      #v(0.3em)
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 12pt)[4. Vectơ-không ($arrow(0)$)]
        #v(0.25em)
        - Điểm đầu trùng điểm cuối: $arrow(A A) = arrow(0)$.
        - Độ dài $|arrow(0)| = 0$.
        - Quy ước: $arrow(0)$ *cùng phương, cùng hướng* với mọi vectơ!
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: HAI VECTƠ BẰNG NHAU VÀ ĐỐI NHAU
// ════════════════════════════════════════════════
#lt-section-link("sec-hai-vecto-bang-nhau", "💎", [IV. Hai Vectơ Bằng Nhau])

#lt-slide-back(title: "💎 Hai Vectơ Bằng Nhau & Hai Vectơ Đối Nhau")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12pt)[1. Hai Vectơ Bằng Nhau ($arrow(a) = arrow(b)$)]
        #v(0.3em)
        Thỏa mãn đồng thời hai điều kiện:
        1. *Cùng hướng* ($arrow(a)$ cùng hướng $arrow(b)$).
        2. *Cùng độ dài* ($|arrow(a)| = |arrow(b)|$).
        #v(0.3em)
        #text(fill: rgb("#2563eb"), weight: "bold")[Tính chất:] Với điểm $O$ cho trước, có *duy nhất một điểm* $A$ sao cho $arrow(O A) = arrow(a)$.
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[2. Hai Vectơ Đối Nhau ($arrow(a) = -arrow(b)$)]
        #v(0.3em)
        Thỏa mãn đồng thời hai điều kiện:
        1. *Ngược hướng*.
        2. *Cùng độ dài* ($|arrow(a)| = |arrow(b)|$).
        #v(0.3em)
        #text(fill: rgb("#dc2626"), weight: "bold")[Ví dụ:] $arrow(B A) = -arrow(A B)$.
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Vectơ Trong Hình Bình Hành & Trung Điểm")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Hình Bình Hành ABCD]
        #v(0.25em)
        - $arrow(A B) = arrow(D C)$ (cùng hướng, cùng độ dài).
        - $arrow(A D) = arrow(B C)$.
        - $arrow(A B) = -arrow(C D)$.
        - $A B C D$ là hình bình hành $arrow.l.r.double arrow(A B) = arrow(D C)$.
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 12pt)[2. Trung Điểm Đoạn Thẳng]
        #v(0.25em)
        $I$ là trung điểm của đoạn thẳng $A B$ khi và chỉ khi:
        - $arrow(I A)$ và $arrow(I B)$ là hai vectơ đối nhau:
        $ arrow(I A) = -arrow(I B) $
        - Hoặc: $arrow(A I) = arrow(I B)$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [V. Bài tập: Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — KHÁI NIỆM VECTƠ],
  questions: (
    (num: 1, type: "TN", desc: [Định Nghĩa Vectơ]),
    (num: 2, type: "TN", desc: [Phương Của Vectơ]),
    (num: 3, type: "TN", desc: [Vectơ Hình Bình Hành]),
    (num: 4, type: "TN", desc: [Vectơ Tam Giác Đều]),
    (num: 5, type: "TN", desc: [Lục Giác Đều]),
    (num: 6, type: "TN", desc: [Độ Dài Vectơ Trung Điểm]),
    (num: 7, type: "DS", desc: [Đúng/Sai Hình Chữ Nhật]),
    (num: 8, type: "TLN", desc: [Đếm Số Vectơ Thẳng Hàng]),
    (num: 9, type: "TLN", desc: [Độ Dài Vectơ Hình Vuông]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Khẳng định nào sau đây là *đúng* về vectơ?],
  (
    [Vectơ là một đoạn thẳng có độ dài bằng 1],
    [Vectơ là một đoạn thẳng có hướng],
    [Vectơ là một đường thẳng có hướng],
    [Vectơ là một tia trong mặt phẳng],
  ),
  correct: 2,
  num: 1,
  de: "Đề 07A — Định Nghĩa Vectơ",
  loigiai: [
    Theo định nghĩa: Vectơ là một đoạn thẳng có hướng (đã xác định điểm đầu và điểm cuối).\
    Các phương án còn lại đều sai định nghĩa cơ bản.\
    Chọn đáp án *B: Vectơ là một đoạn thẳng có hướng*.
  ]
)

#lt-tn(
  [Cho hai vectơ $arrow(a)$ và $arrow(b)$ cùng phương. Khẳng định nào sau đây chắc chắn *đúng*?],
  (
    [Giá của chúng song song hoặc trùng nhau],
    [Chúng có cùng độ dài],
    [Chúng có cùng hướng],
    [Chúng có cùng điểm đầu],
  ),
  correct: 1,
  num: 2,
  de: "Đề 07A — Phương Của Vectơ",
  loigiai: [
    Hai vectơ cùng phương khi và chỉ khi giá của chúng song song hoặc trùng nhau.\
    Chúng có thể cùng hướng hoặc ngược hướng, độ dài có thể khác nhau.\
    Chọn đáp án *A*.
  ]
)

#lt-tn(
  [Cho hình bình hành $A B C D$. Vectơ nào sau đây bằng với vectơ $arrow(A B)$?],
  (
    [$arrow(C D)$],
    [$arrow(D C)$],
    [$arrow(B A)$],
    [$arrow(B C)$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 07B — Vectơ Hình Bình Hành",
  loigiai: [
    Trong hình bình hành $A B C D$, đoạn thẳng $A B$ song song và bằng $D C$.\
    Hướng từ $A$ đến $B$ cùng hướng với từ $D$ đến $C$.\
    Do đó $arrow(A B) = arrow(D C)$. Chọn đáp án *B: DC*.
  ]
)

#lt-tn(
  [Cho tam giác đều $A B C$ cạnh $a$. Khẳng định nào sau đây là *sai*?],
  (
    [$|arrow(A B)| = a$],
    [$|arrow(B C)| = a$],
    [$arrow(A B) = arrow(A C)$],
    [$|arrow(A B)| = |arrow(A C)|$],
  ),
  correct: 3,
  num: 4,
  de: "Đề 07B — Vectơ Tam Giác Đều",
  loigiai: [
    Vì tam giác đều có $A B = B C = C A = a$ nên $|arrow(A B)| = |arrow(A C)| = a$.\
    Tuy nhiên, hai vectơ $arrow(A B)$ và $arrow(A C)$ có giá cắt nhau tại $A$ nên không cùng phương,\
    do đó chúng không thể bằng nhau ($arrow(A B) != arrow(A C)$). Khẳng định C sai.
  ]
)

#lt-tn(
  [Cho lục giác đều $A B C D E F$ tâm $O$. Có bao nhiêu vectơ khác $arrow(0)$ có điểm đầu và điểm cuối là các đỉnh của lục giác và tâm $O$ bằng với vectơ $arrow(A B)$?],
  (
    [$1$],
    [$2$],
    [$3$],
    [$4$],
  ),
  correct: 3,
  num: 5,
  de: "Đề 07C — Lục Giác Đều",
  loigiai: [
    Trong lục giác đều $A B C D E F$ tâm $O$, các cạnh đối và đường chéo chính cho:\
    $A B = F O = O C = E D$ và các đoạn này cùng song song, cùng hướng từ trái sang phải.\
    Các vectơ bằng $arrow(A B)$ là: $arrow(F O), arrow(O C), arrow(E D)$ (gồm 3 vectơ).\
    Chọn đáp án *C: 3*.
  ]
)

#lt-tn(
  [Cho đoạn thẳng $A B$ có độ dài $6$ cm. Gọi $M$ là trung điểm của $A B$. Độ dài của vectơ $arrow(M A)$ bằng:],
  (
    [$6$ cm],
    [$3$ cm],
    [$-3$ cm],
    [$0$ cm],
  ),
  correct: 2,
  num: 6,
  de: "Đề 07C — Độ Dài Vectơ Trung Điểm",
  loigiai: [
    Độ dài của vectơ $arrow(M A)$ là độ dài đoạn thẳng $M A$.\
    Vì $M$ là trung điểm của $A B$ nên $M A = A B / 2 = 6 / 2 = 3$ cm.\
    (Lưu ý độ dài vectơ luôn không âm). Chọn đáp án *B: 3 cm*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [VI. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho hình chữ nhật $A B C D$ tâm $O$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Hai vectơ $arrow(A B)$ và $arrow(C D)$ là hai vectơ đối nhau.], "true": true),
    (body: [Hai vectơ $arrow(A O)$ và $arrow(O C)$ là hai vectơ bằng nhau.], "true": true),
    (body: [Ta có đẳng thức độ dài $|arrow(A C)| = |arrow(B D)|$.], "true": true),
    (body: [Hai vectơ $arrow(A C)$ và $arrow(B D)$ là hai vectơ bằng nhau.], "true": false),
  ),
  de: "Đề 07D — Đúng/Sai Hình Chữ Nhật",
  num: 7,
  loigiai: [
    - a) *Đ:* $A B$ song song $C D$ và cùng độ dài, nhưng hướng $A arrow B$ ngược $C arrow D$.
    - b) *Đ:* $O$ là trung điểm $A C$ nên $arrow(A O)$ và $arrow(O C)$ cùng hướng và cùng độ dài $A C/2$.
    - c) *Đ:* Hai đường chéo hình chữ nhật có độ dài bằng nhau: $A C = B D$.
    - d) *S:* $arrow(A C)$ và $arrow(B D)$ có giá cắt nhau tại $O$ nên không cùng phương $arrow$ không bằng nhau.
  ]
)

#lt-tln(
  [Cho ba điểm $A, B, C$ phân biệt và thẳng hàng. Có tất cả bao nhiêu vectơ khác vectơ-không có điểm đầu và điểm cuối là hai trong ba điểm đó?],
  [6],
  num: 8,
  de: "Đề 07E — Đếm Số Vectơ Thẳng Hàng",
  loigiai: [
    Mỗi cặp điểm phân biệt cho đúng $2$ vectơ có hướng ngược nhau.\
    Từ $3$ điểm phân biệt $A, B, C$, số cặp điểm là $C_3^2 = 3$ cặp: $(A, B), (B, C), (C, A)$.\
    Mỗi cặp cho $2$ vectơ: $arrow(A B), arrow(B A), arrow(B C), arrow(C B), arrow(C A), arrow(A C)$.\
    Tổng cộng có $3 times 2 = 6$ vectơ.
  ]
)

#lt-tln(
  [Cho hình vuông $A B C D$ có cạnh bằng $4$ cm. Gọi $O$ là giao điểm của hai đường chéo. Độ dài của vectơ $arrow(O A)$ bằng bao nhiêu cm? (Làm tròn đến hàng phần mười).],
  [2.8],
  num: 9,
  de: "Đề 07F — Độ Dài Vectơ Hình Vuông",
  loigiai: [
    Độ dài đường chéo hình vuông: $A C = 4 sqrt(2)$ cm.\
    Vì $O$ là tâm hình vuông nên $O$ là trung điểm của $A C$.\
    Suy ra $|arrow(O A)| = O A = A C / 2 = (4 sqrt(2))/2 = 2 sqrt(2) approx 2.83$ cm.\
    Làm tròn đến hàng phần mười là *$2.8$* cm.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VII: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c4-b1", "💎", [VII. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Ghi Nhớ Khái Niệm Vectơ")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. BẢN CHẤT VECTƠ]
        #v(0.2em)
        #text(size: 10pt)[
          - Đoạn thẳng có hướng ($A B$).
          - Điểm đầu (gốc), điểm cuối (ngọn).
          - Ký hiệu $arrow(A B)$ hoặc $arrow(a)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. ĐỘ DÀI VECTƠ]
        #v(0.2em)
        #text(size: 10pt)[
          - $|arrow(A B)| = A B$ (luôn $>= 0$).
          - Vectơ đơn vị: $|arrow(e)| = 1$.
          - Vectơ-không: $|arrow(0)| = 0$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. PHƯƠNG & HƯỚNG]
        #v(0.2em)
        #text(size: 10pt)[
          - Cùng phương: giá song song / trùng.
          - Chỉ xét hướng khi đã cùng phương!
          - $arrow(0)$ cùng phương, cùng hướng mọi vectơ.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. HAI VECTƠ BẰNG NHAU]
        #v(0.2em)
        #text(size: 10pt)[
          - $arrow(a) = arrow(b) arrow.l.r.double$ cùng hướng VÀ cùng độ dài.
          - Hình bình hành: $arrow(A B) = arrow(D C)$.
          - Dựng điểm: Có duy nhất $M$ sao cho $arrow(O M) = arrow(a)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. BẪY KINH ĐIỂN]
        #v(0.2em)
        #text(size: 10pt)[
          - Nhầm độ dài bằng nhau là hai vectơ bằng nhau.
          - Nhầm giá song song nhưng ngược hướng.
          - Bỏ sót vectơ-không $arrow(0)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. BƯỚC ĐỆM BÀI TIẾP]
        #v(0.2em)
        #text(size: 10pt)[
          - Bài 2: Tổng và hiệu của hai vectơ.
          - Quy tắc 3 điểm & hình bình hành.
          - Nền tảng vật lý lực và vận tốc.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 1 — CHƯƠNG IV!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Vectơ là ngôn ngữ phổ quát của hình học hiện đại và vật lý tự nhiên."\
        Chuẩn bị chinh phục #text(fill: rgb("#fde047"), weight: "bold")[Bài 2: Tổng Và Hiệu Của Hai Vectơ]!
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
