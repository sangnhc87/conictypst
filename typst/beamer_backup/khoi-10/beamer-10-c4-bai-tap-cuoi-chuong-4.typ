#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương IV: Vectơ],
  subtitle: [TOÁN 10 — CHƯƠNG IV: TỔNG ÔN MA TRẬN PHÉP TOÁN, 3 BẪY KINH ĐIỂN & THỰC CHIẾN],
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
#lt-toc(title: [🗺️ NỘI DUNG TỔNG ÔN CHƯƠNG IV])

// ════════════════════════════════════════════════
// PHẦN I: MA TRẬN CÁC PHÉP TOÁN VECTƠ
// ════════════════════════════════════════════════
#lt-section-link("sec-ma-tran-phep-toan-vecto", "🗺️", [I. Ma Trận Hệ Thống Phép Toán Vectơ])

#lt-slide-back(title: "🗺️ Ma Trận: Toàn Bộ Phép Toán Vectơ")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    row-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[1. Tổng Hai Vectơ]
        #v(0.2em)
        #text(size: 9.5pt)[
          - *Quy tắc ba điểm:*
          $arrow(A B) + arrow(B C) = arrow(A C)$
          - *Quy tắc HBH (chung gốc):*
          $arrow(A B) + arrow(A D) = arrow(A C)$
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 11pt)[2. Hiệu Hai Vectơ]
        #v(0.2em)
        #text(size: 9.5pt)[
          - Vectơ đối: $arrow(b) + (-arrow(b)) = arrow(0)$.
          - *Quy tắc hiệu chung gốc:*
          $arrow(O B) - arrow(O A) = arrow(A B)$
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 11pt)[3. Tích Với Một Số]
        #v(0.2em)
        #text(size: 9.5pt)[
          - $k > 0$: cùng hướng; $k < 0$: ngược hướng.
          - Độ dài: $|k arrow(a)| = |k| |arrow(a)|$.
          - Cùng phương: $arrow(b) = k arrow(a)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[4. Hệ Thức Trọng Điểm]
        #v(0.2em)
        #text(size: 9.5pt)[
          - Trung điểm: $arrow(M A) + arrow(M B) = 2 arrow(M I)$.
          - Trọng tâm: $arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 11pt)[5. Phân Tích Vectơ]
        #v(0.2em)
        #text(size: 9.5pt)[
          - Với cơ sở $arrow(a), arrow(b)$ không cùng phương:
          $arrow(x) = m arrow(a) + n arrow(b)$ (duy nhất).
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 11pt)[6. Tích Vô Hướng]
        #v(0.2em)
        #text(size: 9.5pt)[
          - $arrow(a) dot arrow(b) = |arrow(a)| |arrow(b)| cos alpha$.
          - Vuông góc: $arrow(a) perp arrow(b) <=> arrow(a) dot arrow(b) = 0$.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: 3 BẪY TƯ DUY KINH ĐIỂN
// ════════════════════════════════════════════════
#lt-section-link("sec-bay-tu-duy-c4", "⚠️", [II. 3 Bẫy Tư Duy & Sai Lầm Phổ Biến])

#lt-slide-back(title: "⚠️ 3 Bẫy Điển Hình Học Sinh Thường Mắc")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 11.5pt)[Bẫy 1: Độ Dài Của Tổng]
        #v(0.2em)
        #text(size: 10pt)[
          - $|arrow(a) + arrow(b)| != |arrow(a)| + |arrow(b)|$!
          - Bất đẳng thức tam giác:
          $||arrow(a)| - |arrow(b)|| <= |arrow(a) + arrow(b)| <= |arrow(a)| + |arrow(b)|$.
          - Dấu bằng xảy ra khi và chỉ khi hai vectơ *cùng hướng*.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#d97706"), size: 11.5pt)[Bẫy 2: Góc Nối Đuôi]
        #v(0.2em)
        #text(size: 10pt)[
          - Trong tam giác đều $A B C$, $(arrow(A B), arrow(B C))$ không bằng $60^degree$!
          - Hai vectơ chưa chung gốc!
          - Đưa về chung gốc $B$:
          $(arrow(A B), arrow(B C)) = 180^degree - 60^degree = 120^degree$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 8pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 11.5pt)[Bẫy 3: Đổi Chiều Vectơ]
        #v(0.2em)
        #text(size: 10pt)[
          - Hiệu chung gốc: $arrow(A B) - arrow(A C) = arrow(C B)$ (không phải $arrow(B C)$!).
          - Nếu $arrow(M A) = -2 arrow(M B)$ thì $M$ nằm giữa $A, B$ chứ không nằm ngoài đoạn $A B$.
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
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — BÀI TẬP CUỐI CHƯƠNG IV: VECTƠ],
  questions: (
    (num: 1, type: "TN", desc: [Quy Tắc Ba Điểm Nối Đuôi]),
    (num: 2, type: "TN", desc: [Quy Tắc Hình Bình Hành]),
    (num: 3, type: "TN", desc: [Nhận Diện Đẳng Thức Trọng Tâm]),
    (num: 4, type: "TN", desc: [Phân Tích Vectơ Cơ Sở]),
    (num: 5, type: "TN", desc: [Bẫy Góc Tích Vô Hướng]),
    (num: 6, type: "TN", desc: [Hằng Đẳng Thức Vuông Góc]),
    (num: 7, type: "DS", desc: [Đúng/Sai Hình Vuông]),
    (num: 8, type: "TLN", desc: [Độ Dài Cạnh Theo Vectơ & Côsin]),
    (num: 9, type: "TLN", desc: [Hợp Lực Tàu Kéo Thực Tế]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho bốn điểm bất kì $A, B, C, D$. Khẳng định nào sau đây là khẳng định luôn đúng?],
  (
    [$arrow(A B) + arrow(B C) + arrow(C D) = arrow(A D)$],
    [$arrow(A B) + arrow(B C) + arrow(C D) = arrow(D A)$],
    [$arrow(A B) + arrow(C D) = arrow(A C) + arrow(B D)$],
    [$arrow(A B) - arrow(C D) = arrow(A C) - arrow(B D)$],
  ),
  correct: 1,
  num: 1,
  de: "Đề Tổng Ôn — Quy Tắc Ba Điểm Nối Đuôi",
  loigiai: [
    Áp dụng quy tắc cộng nối đuôi liên tiếp:\
    $arrow(A B) + arrow(B C) + arrow(C D) = (arrow(A B) + arrow(B C)) + arrow(C D) = arrow(A C) + arrow(C D) = arrow(A D)$.\
    Chọn đáp án *A: AB + BC + CD = AD*.
  ]
)

#lt-tn(
  [Cho hình vuông $A B C D$ cạnh bằng $a$. Độ dài của vectơ $arrow(A B) + arrow(A D)$ bằng:],
  (
    [$2 a$],
    [$a sqrt(2)$],
    [$a$],
    [$a / 2$],
  ),
  correct: 2,
  num: 2,
  de: "Đề Tổng Ôn — Quy Tắc Hình Bình Hành",
  loigiai: [
    Theo quy tắc hình bình hành (áp dụng cho hình vuông):\
    $arrow(A B) + arrow(A D) = arrow(A C)$.\
    Độ dài: $|arrow(A B) + arrow(A D)| = |arrow(A C)| = A C$.\
    Đường chéo hình vuông cạnh $a$ bằng $a sqrt(2)$. Chọn đáp án *B: a sqrt(2)*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$ có trọng tâm $G$ và $M$ là trung điểm cạnh $B C$. Đẳng thức vectơ nào sau đây là sai?],
  (
    [$arrow(A G) = 2/3 arrow(A M)$],
    [$arrow(G A) + arrow(G B) + arrow(G C) = arrow(0)$],
    [$arrow(A B) + arrow(A C) = 2 arrow(A M)$],
    [$arrow(M A) + arrow(M B) + arrow(M C) = arrow(0)$],
  ),
  correct: 4,
  num: 3,
  de: "Đề Tổng Ôn — Nhận Diện Đẳng Thức Trọng Tâm",
  loigiai: [
    - A, B, C đều là các tính chất cơ bản đúng của trọng tâm và trung tuyến.\
    - D sai vì $arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G) != arrow(0)$ (do $M$ là trung điểm $B C$ nên $arrow(M B) + arrow(M C) = arrow(0) =>$ tổng bằng $arrow(M A) != arrow(0)$). Chọn *D*.
  ]
)

#lt-tn(
  [Cho tam giác $A B C$. Điểm $M$ trên cạnh $A B$ sao cho $A M = 1/3 A B$, điểm $N$ là trung điểm $A C$. Biểu diễn vectơ $arrow(M N)$ theo $arrow(A B)$ và $arrow(A C)$ là:],
  (
    [$arrow(M N) = -1/3 arrow(A B) + 1/2 arrow(A C)$],
    [$arrow(M N) = 1/3 arrow(A B) - 1/2 arrow(A C)$],
    [$arrow(M N) = -1/3 arrow(A B) - 1/2 arrow(A C)$],
    [$arrow(M N) = 1/3 arrow(A B) + 1/2 arrow(A C)$],
  ),
  correct: 1,
  num: 4,
  de: "Đề Tổng Ôn — Phân Tích Vectơ Cơ Sở",
  loigiai: [
    Chèn gốc $A$ theo quy tắc hiệu: $arrow(M N) = arrow(A N) - arrow(A M)$.\
    Vì $M$ thuộc $A B$ và $A M = 1/3 A B => arrow(A M) = 1/3 arrow(A B)$.\
    Vì $N$ là trung điểm $A C => arrow(A N) = 1/2 arrow(A C)$.\
    Vậy $arrow(M N) = 1/2 arrow(A C) - 1/3 arrow(A B) = -1/3 arrow(A B) + 1/2 arrow(A C)$. Chọn *A*.
  ]
)

#lt-tn(
  [Cho tam giác đều $A B C$ cạnh $a$. Tích vô hướng $arrow(A B) dot arrow(B C)$ bằng:],
  (
    [$a^2 / 2$],
    [$- a^2 / 2$],
    [$(a^2 sqrt(3)) / 2$],
    [$- (a^2 sqrt(3)) / 2$],
  ),
  correct: 2,
  num: 5,
  de: "Đề Tổng Ôn — Bẫy Góc Tích Vô Hướng",
  loigiai: [
    Góc giữa hai vectơ: $(arrow(A B), arrow(B C)) = 180^degree - 60^degree = 120^degree$.\
    $arrow(A B) dot arrow(B C) = |arrow(A B)| dot |arrow(B C)| dot cos 120^degree = a dot a dot (-1/2) = -a^2 / 2$.\
    Chọn đáp án *B: -a^2 / 2*.
  ]
)

#lt-tn(
  [Cho hai vectơ $arrow(u)$ và $arrow(v)$ khác $arrow(0)$ thỏa mãn $|arrow(u)| = 4, |arrow(v)| = 3$ và $(arrow(u) + arrow(v)) perp (arrow(u) - arrow(v))$. Khi đó khẳng định nào sau đây đúng?],
  (
    [$|arrow(u)| = |arrow(v)|$],
    [$arrow(u) perp arrow(v)$],
    [Khẳng định đề bài mâu thuẫn],
    [$arrow(u)$ cùng phương $arrow(v)$],
  ),
  correct: 3,
  num: 6,
  de: "Đề Tổng Ôn — Hằng Đẳng Thức Vuông Góc",
  loigiai: [
    Ta có $(arrow(u) + arrow(v)) perp (arrow(u) - arrow(v)) <=> (arrow(u) + arrow(v)) dot (arrow(u) - arrow(v)) = 0$.\
    $<=> arrow(u)^2 - arrow(v)^2 = 0 <=> |arrow(u)|^2 - |arrow(v)|^2 = 0 <=> |arrow(u)| = |arrow(v)|$.\
    Mà đề bài cho $|arrow(u)| = 4 != |arrow(v)| = 3$ nên điều kiện này không thể xảy ra! Chọn *C*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP ĐÚNG / SAI
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds", "📝", [IV. Bài tập Đúng / Sai Toàn Diện])

#lt-ds(
  [Cho hình vuông $A B C D$ cạnh $a$ tâm $O$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Ta có $arrow(A B) + arrow(A D) = 2 arrow(A O)$.], "true": true),
    (body: [Độ dài vectơ hiệu $|arrow(A B) - arrow(A C)| = a$.], "true": true),
    (body: [Tích vô hướng $arrow(O A) dot arrow(O B) = 0$.], "true": true),
    (body: [Tích vô hướng $arrow(A B) dot arrow(A C) = a^2 sqrt(2)$.], "true": false),
  ),
  de: "Đề Tổng Ôn — Đúng/Sai Hình Vuông",
  num: 7,
  loigiai: [
    - a) *Đ:* $arrow(A B) + arrow(A D) = arrow(A C) = 2 arrow(A O)$ (vì $O$ là trung điểm $A C$).
    - b) *Đ:* $arrow(A B) - arrow(A C) = arrow(C B) => |arrow(C B)| = C B = a$.
    - c) *Đ:* Hai đường chéo hình vuông vuông góc tại $O => arrow(O A) perp arrow(O B) => arrow(O A) dot arrow(O B) = 0$.
    - d) *S:* $arrow(A B) dot arrow(A C) = a dot a sqrt(2) dot cos 45^degree = a^2 sqrt(2) dot (sqrt(2)/2) = a^2$ (không phải $a^2 sqrt(2)$).
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐIỀN SỐ / TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tln", "🔢", [V. Bài tập Trả Lời Ngắn (Điền Số)])

#lt-tln(
  [Cho tam giác $A B C$ có $A B = 4, A C = 6$ và góc $hat(A) = 60^degree$. Độ dài cạnh $B C$ bằng bao nhiêu? (Làm tròn đến hàng phần mười).],
  [5.3],
  num: 8,
  de: "Đề Tổng Ôn — Độ Dài Cạnh Theo Vectơ & Côsin",
  loigiai: [
    Ta có $arrow(B C) = arrow(A C) - arrow(A B)$. Bình phương vô hướng:\
    $B C^2 = |arrow(A C) - arrow(A B)|^2 = A C^2 + A B^2 - 2 arrow(A C) dot arrow(A B)$.\
    $B C^2 = 6^2 + 4^2 - 2(6)(4) cos 60^degree = 36 + 16 - 24 = 28$.\
    Suy ra $B C = sqrt(28) = 2 sqrt(7) approx 5.29$ (làm tròn thành $5.3$). Đáp số: *$5.3$*.
  ]
)

#lt-tln(
  [Hai con tàu kéo một sà lan di chuyển theo phương thẳng về phía trước. Con tàu thứ nhất kéo với lực $F_1 = 3000$ N, con tàu thứ hai kéo với lực $F_2 = 3000$ N. Hai sợi dây cáp hợp với nhau một góc $60^degree$. Độ lớn hợp lực của hai lực kéo tác dụng lên sà lan bằng bao nhiêu Newton? (Làm tròn đến hàng đơn vị).],
  [5196],
  num: 9,
  de: "Đề Tổng Ôn — Hợp Lực Tàu Kéo Thực Tế",
  loigiai: [
    Hợp lực $arrow(F) = arrow(F_1) + arrow(F_2)$. Vì $|arrow(F_1)| = |arrow(F_2)| = 3000$ N và góc giữa chúng bằng $60^degree$:\
    $|arrow(F)|^2 = F_1^2 + F_2^2 + 2 F_1 F_2 cos 60^degree = 3000^2 + 3000^2 + 2(3000^2)(0.5) = 3 dot 3000^2$.\
    Suy ra $|arrow(F)| = 3000 sqrt(3) approx 3000 dot 1.73205 = 5196.15$ N.\
    Làm tròn đến hàng đơn vị: *$5196$* N.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT BẢN ĐỒ NĂNG LỰC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c4", "💎", [VI. Bản Đồ Năng Lực & Tốt Nghiệp Chương IV])

#lt-slide-back(title: "💎 Bản Đồ Năng Lực Toán Học — Chương IV")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 14pt,
    row-gutter: 12pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Tư Duy Hình Học - Vectơ]
        #v(0.3em)
        #text(size: 10pt)[
          - Chuyển hóa bài toán vị trí, thẳng hàng sang phương trình vectơ.
          - Vận dụng linh hoạt quy tắc 3 điểm, hình bình hành và trọng tâm.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. Năng Lực Định Lượng & Đo Đạc]
        #v(0.3em)
        #text(size: 10pt)[
          - Dùng tích vô hướng tính góc, khoảng cách và chứng minh vuông góc.
          - Bình phương vô hướng để tính độ dài đoạn thẳng và cạnh tam giác.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#d97706"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 12pt)[3. Năng Lực Mô Hình Hóa Thực Tế]
        #v(0.3em)
        #text(size: 10pt)[
          - Hợp lực trong cơ học (kéo thuyền, treo vật, thanh đòn bẩy).
          - Tính công của lực cơ học trong vật lí lớp 10.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 12pt)[4. Bước Đệm Tới Tọa Độ Hóa]
        #v(0.3em)
        #text(size: 10pt)[
          - Định lí phân tích vectơ là tiền đề mở ra *Chương IX: Phương pháp tọa độ trong mặt phẳng*.
          - Nền tảng vững chắc cho Hình học không gian Lớp 11 & 12!
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🏆 HOÀN THÀNH XUẤT SẮC CHƯƠNG IV: VECTƠ!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Vectơ là ngôn ngữ vĩ đại liên kết Hình học, Đại số và Vật lí hiện đại."\
        Chúc các em học sinh làm chủ trọn vẹn kiến thức Hình học Lớp 10!
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
