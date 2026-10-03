#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Phương Trình Quy Về Bậc Hai],
  subtitle: [TOÁN 10 — CHƯƠNG VI: PHƯƠNG TRÌNH CĂN THỨC, BÌNH PHƯƠNG & ỨNG DỤNG],
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
// PHẦN I: HAI DẠNG PHƯƠNG TRÌNH CĂN THỨC CƠ BẢN
// ════════════════════════════════════════════════
#lt-section-link("sec-pt-can-thuc", "🎯", [I. Hai Dạng Phương Trình Căn Thức Cơ Bản])

#lt-slide-back(title: "🎯 René Descartes & Phương Pháp Đại Số Hóa")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Khử căn thức về phương trình đại số")[
        - Các bài toán hình học tính khoảng cách Euclid (Pytago $d = sqrt(Delta x^2 + Delta y^2)$) luôn dẫn đến biểu thức chứa dấu căn.
        - *Bình phương hai vế* là chìa khóa triệt tiêu căn thức để đưa về phương trình đa thức bậc hai kinh điển.
        - Chú ý quan trọng: Phép bình phương có thể sinh ra *nghiệm ngoại lai* (nghiệm giả)!
      ]
      #v(0.15em)
      #lt-tip(title: "Nguyên tắc cốt lõi")[
        Luôn nhớ: $A = B => A^2 = B^2$ là phép biến đổi hệ quả (không tương đương), nên *bắt buộc phải đối chiếu điều kiện hoặc thử lại nghiệm*!
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 7pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[📜 René Descartes (1596 – 1650)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Trong tác phẩm *La Géométrie* (1637), Descartes đã phát minh ra hệ trục tọa độ, biến các đường cong hình học thành các phương trình đại số.
          Ông chỉ ra rằng: Để tìm giao điểm của đường tròn ($x^2 + y^2 = R^2$) với đường thẳng, ta phải giải phương trình căn thức quy về bậc hai!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Hai Dạng Phương Trình Căn Thức Chuẩn")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Dạng 1: sqrt(f(x)) = sqrt(g(x))")[
        - *Cách 1 (Tương đương):*
        $ cases(g(x) >= 0 quad &text("(hoặc } f(x) >= 0)"), f(x) = g(x)) $
        - *Cách 2 (Bình phương & thử lại):*
          Bình phương $f(x) = g(x)$, giải tìm nghiệm rồi thế vào kiểm tra $f(x) >= 0$.
      ]
    ],
    [
      #lt-theorem(title: "Dạng 2: sqrt(f(x)) = g(x)")[
        - *Cách 1 (Tương đương):*
        $ cases(g(x) >= 0, f(x) = (g(x))^2) $
        - *Cách 2 (Bình phương & thử lại):*
          Bình phương $f(x) = (g(x))^2$, giải tìm nghiệm rồi thay vào PT ban đầu loại nghiệm ngoại lai.
      ]
    ]
  )
  #v(0.15em)
  #lt-important(title: "Cảnh báo nghiệm ngoại lai")[
    Ở Dạng 2, bắt buộc phải có điều kiện $g(x) >= 0$ (hoặc thử lại vào PT ban đầu) để loại bỏ nghiệm làm vế phải âm!
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: QUY TRÌNH GIẢI & PT TRÙNG PHƯƠNG
// ════════════════════════════════════════════════
#lt-section-link("sec-quy-trinh-trung-phuong", "📈", [II. Quy Trình 4 Bước & Phương Trình Trùng Phương])

#lt-slide-back(title: "📈 Quy Trình 4 Bước Chuẩn Mực Giải Phương Trình Căn")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[4 Bước Thực Hiện Chuẩn SGK 2018]\
        #v(0.2em)
        #text(size: 8.5pt)[
          - *Bước 1 (Bình phương):* Bình phương 2 vế để khử triệt để dấu căn bậc hai.
          - *Bước 2 (Đưa về bậc hai):* Rút gọn, chuyển vế đưa về phương trình $a x^2 + b x + c = 0$.
          - *Bước 3 (Giải PT bậc hai):* Tính nghiệm bằng công thức nghiệm hoặc phân tích nhân tử.
          - *Bước 4 (Thử lại / Đối chiếu):* Thay các nghiệm tìm được vào PT ban đầu, loại bỏ nghiệm ngoại lai và kết luận tập nghiệm $S$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 9pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[Phương Trình Trùng Phương]\
        #v(0.2em)
        #text(size: 8.5pt)[
          Phương trình có dạng: $a x^4 + b x^2 + c = 0 quad (a != 0)$
          - *Phương pháp đặt ẩn phụ:* Đặt $t = x^2 quad (t >= 0)$.
          - Ta được phương trình bậc hai: $a t^2 + b t + c = 0$.
          - Với mỗi nghiệm $t_0 >= 0$ thỏa mãn:
            $ x^2 = t_0 <=> x = plus.minus sqrt(t_0) $
          - Số nghiệm của PT trùng phương có thể là $0, 1, 2, 3$ hoặc $4$ nghiệm thực.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & THỰC TIỄN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Trắc nghiệm & Thực tiễn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VI BÀI 4],
  questions: (
    (num: 1, type: "TN", desc: [Căn thức bằng căn thức]),
    (num: 2, type: "TN", desc: [Số nghiệm PT căn thức]),
    (num: 3, type: "TN", desc: [Loại nghiệm ngoại lai]),
    (num: 4, type: "TN", desc: [Số nghiệm thực căn bậc hai]),
    (num: 5, type: "TN", desc: [Tích nghiệm PT trùng phương]),
    (num: 6, type: "TN", desc: [Khoảng cách 2 người đi xe]),
    (num: 7, type: "DS", desc: [Đúng/Sai quy trình giải PT căn]),
    (num: 8, type: "TLN", desc: [Bình phương nghiệm duy nhất]),
    (num: 9, type: "TLN", desc: [Cạnh huyền giàn giáo tam giác]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tập nghiệm của phương trình $sqrt(x^2 - 3x + 2) = sqrt(x - 1)$ là:],
  (
    [$\{1; 3\}$],
    [$\{1\}$],
    [$\{3\}$],
    [$\{2; 3\}$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 19A — Phương Trình Căn Thức Bằng Căn Thức",
  loigiai: [
    - Bình phương hai vế: $x^2 - 3x + 2 = x - 1 <=> x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3$.\
    - Thử lại: Với $x = 1: 0 = 0$ (thỏa mãn); với $x = 3: sqrt(2) = sqrt(2)$ (thỏa mãn).\
    - Vậy tập nghiệm $S = \{1; 3\}$. Chọn đáp án *A: $\{1; 3\}$*.
  ]
)

#lt-tn(
  [Số nghiệm của phương trình $sqrt(2x^2 - 5x + 3) = x - 1$ là:],
  (
    [$2$],
    [$1$],
    [$0$],
    [$3$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 19A — Số Nghiệm Của Phương Trình Căn Thức",
  loigiai: [
    - Điều kiện: $x - 1 >= 0 <=> x >= 1$.\
    - Bình phương: $2x^2 - 5x + 3 = (x - 1)^2 <=> x^2 - 3x + 2 = 0 <=> x = 1$ hoặc $x = 2$.\
    - Cả $x = 1$ và $x = 2$ đều thỏa mãn $x >= 1$. Phương trình có $2$ nghiệm. Chọn *A*.
  ]
)

#lt-tn(
  [Tập nghiệm của phương trình $sqrt(3x^2 - 9x + 1) = x - 2$ là:],
  (
    [$\{3\}$],
    [$\{-1/2; 3\}$],
    [$\{-1/2\}$],
    [$emptyset$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 19A — Nhận Diện Nghiệm Ngoại Lai",
  loigiai: [
    - Điều kiện: $x - 2 >= 0 <=> x >= 2$.\
    - Bình phương: $3x^2 - 9x + 1 = (x - 2)^2 <=> 2x^2 - 5x - 3 = 0 <=> x = -1/2$ hoặc $x = 3$.\
    - So với $x >= 2$: Loại $x = -1/2$, nhận $x = 3 => S = \{3\}$. Chọn *A*.
  ]
)

#lt-tn(
  [Số nghiệm thực của phương trình $sqrt(x^2 - 4x + 3) = x - 3$ là:],
  (
    [$1$],
    [$2$],
    [$0$],
    [$3$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 19A — Số Nghiệm Thực Của Phương Trình Căn",
  loigiai: [
    - Điều kiện: $x - 3 >= 0 <=> x >= 3$.\
    - Bình phương: $x^2 - 4x + 3 = (x - 3)^2 <=> x^2 - 4x + 3 = x^2 - 6x + 9 <=> 2x = 6 <=> x = 3$.\
    - Nghiệm $x = 3$ thỏa mãn $x >= 3$. Vậy phương trình có duy nhất $1$ nghiệm thực. Chọn *A*.
  ]
)

#lt-tn(
  [Tích các nghiệm thực của phương trình trùng phương $x^4 - 3x^2 - 4 = 0$ bằng:],
  (
    [$-4$],
    [$4$],
    [$-2$],
    [$2$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 19A — Phương Trình Trùng Phương",
  loigiai: [
    - Đặt $t = x^2 >= 0$, ta có $t^2 - 3t - 4 = 0 <=> t = -1$ (loại) hoặc $t = 4$ (nhận).\
    - Với $t = 4 => x^2 = 4 <=> x = plus.minus 2$.\
    - Tích các nghiệm thực là: $2 dot (-2) = -4$. Chọn đáp án *A: $-4$*.
  ]
)

#lt-tn(
  [Hai xe đạp cùng xuất phát từ ngã tư, người I đi hướng Bắc ($12$ km/h), người II đi hướng Đông ($16$ km/h). Sau bao lâu khoảng cách giữa hai người bằng $30$ km?],
  (
    [$1.5$ giờ],
    [$1$ giờ],
    [$2$ giờ],
    [$2.5$ giờ],
  ),
  correct: 1,
  num: 6,
  de: "Đề 19A — Ứng Dụng Pytago & Chuyển Động Vuông Góc",
  loigiai: [
    - Sau $t$ (giờ), khoảng cách $d = sqrt((12t)^2 + (16t)^2) = sqrt(400t^2) = 20t$ (km).\
    - Theo đề: $20t = 30 <=> t = 30 / 20 = 1.5$ giờ.\
    Chọn đáp án *A: $1.5$ giờ*.
  ]
)

#lt-ds(
  [Cho phương trình: $sqrt(2x^2 - 4x + 1) = x - 1$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Điều kiện để phương trình có nghiệm là $x >= 1$.],
    [Bình phương hai vế phương trình ta thu được $x^2 - 2x = 0$.],
    [Phương trình $x^2 - 2x = 0$ có hai nghiệm là $x = 0$ và $x = 2$.],
    [Cả hai giá trị $x = 0$ và $x = 2$ đều là nghiệm của phương trình ban đầu.],
  ),
  num: 7,
  de: "Đề 19A — Khảo Sát Quy Trình Giải Phương Trình Căn Thức",
  loigiai: [
    - a) *Đúng:* Căn bậc hai không âm nên vế phải $x - 1 >= 0 <=> x >= 1$.\
    - b) *Đúng:* $2x^2 - 4x + 1 = x^2 - 2x + 1 <=> x^2 - 2x = 0$.\
    - c) *Đúng:* $x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.\
    - d) *Sai:* Nghiệm $x = 0$ không thỏa mãn điều kiện $x >= 1$ (loại). PT chỉ có nghiệm duy nhất $x = 2$.
  ]
)

#lt-tln(
  [Cho phương trình $sqrt(2x^2 - 5x + 2) = sqrt(x^2 - 2x)$. Tính bình phương của nghiệm thỏa mãn phương trình.],
  "4",
  num: 8,
  de: "Đề 19A — Bình Phương Nghiệm Thỏa Mãn Phương Trình Căn",
  loigiai: [
    - Bình phương: $2x^2 - 5x + 2 = x^2 - 2x <=> x^2 - 3x + 2 = 0 <=> x = 1$ hoặc $x = 2$.\
    - Thử lại: Tại $x = 1$, vế phải $1 - 2 = -1 < 0$ (loại). Tại $x = 2$, hai vế bằng $0$ (thỏa mãn).\
    - Nghiệm duy nhất $x = 2 => x^2 = 4$. Đáp số: *4*.
  ]
)

#lt-tln(
  [Một khung giàn giáo hình tam giác vuông có cạnh huyền dài hơn cạnh góc vuông thứ nhất $2$ m và hơn cạnh thứ hai $9$ m. Tính độ dài cạnh huyền (mét).],
  "17",
  num: 9,
  de: "Đề 19A — Ứng Dụng Hình Học Định Lý Pytago",
  loigiai: [
    - Gọi cạnh huyền là $c > 9$ (m). Hai cạnh góc vuông là $c - 2$ và $c - 9$.\
    - Theo Pytago: $(c - 2)^2 + (c - 9)^2 = c^2 <=> c^2 - 22c + 85 = 0 <=> c = 5$ (loại) hoặc $c = 17$ (nhận).\
    - Vậy độ dài cạnh huyền là $17$ m. Đáp số: *17*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: MA TRẬN KIẾN THỨC & TỔNG KẾT
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Ma Trận Kiến Thức & Tổng Kết])

#lt-slide-back(title: "🧠 Ma Trận 6 Khối Kiến Thức Cốt Lõi")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 9pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[1. Phép Biến Đổi Hệ Quả]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Bình phương hai vế làm mất căn thức nhưng có thể sinh ra nghiệm ngoại lai.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10.5pt)[2. Dạng sqrt(f) = sqrt(g)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Bình phương $f(x) = g(x)$, sau đó giải và thử lại vào điều kiện $f(x) >= 0$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[3. Dạng sqrt(f) = g]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Bắt buộc điều kiện vế phải không âm: $g(x) >= 0$, sau đó bình phương $f(x) = g(x)^2$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 10.5pt)[4. PT Trùng Phương]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Đặt ẩn phụ $t = x^2 >= 0$, đưa phương trình bậc bốn về phương trình bậc hai theo $t$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 10.5pt)[5. Thử Lại Nghiệm]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Bước quyết định điểm số: Thay nghiệm vào phương trình ban đầu để loại nghiệm ngoại lai.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[6. Ứng Dụng Thực Tiễn]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Khoảng cách tọa độ Euclid, định lý Pytago trong kết cấu xây dựng và hàng hải.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🏆 Cột Mốc Hoàn Thành Bài Học")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 82%
    )[
      #text(weight: "bold", fill: rgb("#15803d"), size: 17pt)[🎉 CHÚC MỪNG BẠN ĐÃ LÀM CHỦ PHƯƠNG TRÌNH QUY VỀ BẬC HAI!]\
      #v(0.4em)
      #text(size: 11pt, fill: rgb("#1f2937"))[
        Bạn đã thành thạo kỹ thuật bình phương giải phương trình căn thức, khử nghiệm ngoại lai, phương trình trùng phương và giải quyết các bài toán khoảng cách thực tế.\
        #v(0.3em)
        *Tiếp theo:* Bài 5 — Bài tập ôn tập cuối Chương VI!
      ]
      #v(0.6em)
      #link(label("lec-toc-main"))[
        #block(fill: rgb("#1e40af"), inset: (x: 12pt, y: 6pt), radius: 5pt)[
          #text(fill: white, weight: "bold", size: 10pt)[⏮ Quay lại Mục lục chính]
        ]
      ]
    ]
  ]
]
