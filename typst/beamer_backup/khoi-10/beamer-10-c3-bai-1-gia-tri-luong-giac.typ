#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Giá Trị Lượng Giác Của Một Góc],
  subtitle: [TOÁN 10 — CHƯƠNG III: TỪ 0° ĐẾN 180° & NỬA ĐƯỜNG TRÒN ĐƠN VỊ],
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
#lt-section-link("sec-khoi-dong-goc", "🚀", [I. Khởi động: Mở rộng Khái niệm Góc])

#lt-slide-back(title: "🚀 Từ Góc Nhọn THCS Đến Góc Bất Kỳ")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Kiến thức đã biết (Lớp 9)]
        #v(0.3em)
        - Trong tam giác vuông, tỉ số lượng giác chỉ định nghĩa cho *góc nhọn* ($0 degree < alpha < 90 degree$):
        $ sin alpha = "đối"/"huyền", quad cos alpha = "kề"/"huyền" $
        $ tan alpha = "đối"/"kề", quad cot alpha = "kề"/"đối" $
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[2. Thách thức ở Lớp 10]
        #v(0.3em)
        - Trong tam giác tù hoặc tam giác bất kỳ, có những góc $*alpha >= 90 degree*$.
        - Làm sao tính giá trị lượng giác của góc $120 degree, 150 degree, 180 degree$?
        #v(0.3em)
        #text(fill: rgb("#16a34a"), weight: "bold")[👉 Công cụ đắc lực: Nửa đường tròn đơn vị!]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: NỬA ĐƯỜNG TRÒN ĐƠN VỊ & ĐỊNH NGHĨA
// ════════════════════════════════════════════════
#lt-section-link("sec-nua-duong-tron", "⭕", [II. Nửa Đường Tròn Đơn Vị])

#lt-slide-back(title: "⭕ Nửa Đường Tròn Đơn Vị")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Quy ước hình học")[
        Trong mặt phẳng $O x y$, *nửa đường tròn đơn vị* là nửa đường tròn tâm $O(0; 0)$, bán kính $R = 1$ nằm phía trên trục hoành ($y >= 0$).
      ]
      #v(0.3em)
      #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 9pt, radius: 7pt)[
        - Với mỗi góc $alpha$ ($0 degree <= alpha <= 180 degree$), có *duy nhất một điểm* $M(x_0; y_0)$ trên nửa đường tròn sao cho $hat(x O M) = alpha$.
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Nửa Đường Tròn Đơn Vị R = 1]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            let sc = 1.9
            // Trục tọa độ
            line((-1.3*sc, 0), (1.4*sc, 0), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((1.45*sc, 0), text(size: 9pt, weight: "bold")[$x$])
            line((0, -0.2*sc), (0, 1.35*sc), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((0, 1.45*sc), text(size: 9pt, weight: "bold")[$y$])
            content((-0.12*sc, -0.12*sc), text(size: 8.5pt)[$O$])

            // Nửa đường tròn
            arc((sc, 0), start: 0deg, stop: 180deg, radius: sc, stroke: 1.5pt + rgb("#2563eb"))

            // Điểm -1, 1 trên Ox và 1 trên Oy
            circle((sc, 0), radius: 2pt, fill: black)
            content((sc, -0.16*sc), text(size: 8pt)[$1$])
            circle((-sc, 0), radius: 2pt, fill: black)
            content((-sc, -0.16*sc), text(size: 8pt)[$-1$])
            circle((0, sc), radius: 2pt, fill: black)
            content((-0.15*sc, sc), text(size: 8pt)[$1$])

            // Điểm M với góc 60 độ
            let ang = 60deg
            let mx = calc.cos(ang) * sc
            let my = calc.sin(ang) * sc
            line((0, 0), (mx, my), stroke: 1.2pt + rgb("#dc2626"))
            circle((mx, my), radius: 3pt, fill: rgb("#dc2626"))
            content((mx + 0.18*sc, my + 0.08*sc), text(size: 9pt, fill: rgb("#dc2626"), weight: "bold")[$M(x_0; y_0)$])

            // Hình chiếu
            line((mx, my), (mx, 0), stroke: 0.8pt + rgb("#94a3b8"), dash: "dashed")
            line((mx, my), (0, my), stroke: 0.8pt + rgb("#94a3b8"), dash: "dashed")
            content((mx, -0.15*sc), text(size: 8.5pt, fill: rgb("#2563eb"))[$x_0$])
            content((-0.18*sc, my), text(size: 8.5pt, fill: rgb("#16a34a"))[$y_0$])

            // Cung góc alpha
            arc((0.35*sc, 0), start: 0deg, stop: 60deg, radius: 0.35*sc, stroke: 1pt + rgb("#d97706"))
            content((0.42*sc, 0.22*sc), text(size: 8.5pt, fill: rgb("#d97706"), weight: "bold")[$alpha$])
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Định Nghĩa 4 Giá Trị Lượng Giác")[
  #lt-definition(title: "Định nghĩa tổng quát")[
    Với mỗi góc $alpha$ ($0 degree <= alpha <= 180 degree$), gọi $M(x_0; y_0)$ là điểm trên nửa đường tròn đơn vị sao cho $hat(x O M) = alpha$. Khi đó:
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 8pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #align(center)[
          #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[Sin]
          #v(0.2em)
          #text(size: 13pt, fill: rgb("#d81b60"), weight: "bold")[$sin alpha = y_0$]
          #v(0.2em)
          #text(size: 9.5pt)[Tung độ điểm $M$]
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #align(center)[
          #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[Côsin]
          #v(0.2em)
          #text(size: 13pt, fill: rgb("#d81b60"), weight: "bold")[$cos alpha = x_0$]
          #v(0.2em)
          #text(size: 9.5pt)[Hoành độ điểm $M$]
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #align(center)[
          #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[Tang]
          #v(0.2em)
          #text(size: 11.5pt, fill: rgb("#d81b60"), weight: "bold")[$tan alpha = y_0/x_0$]
          #v(0.2em)
          #text(size: 9.5pt)[($alpha != 90 degree$)]
        ]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 8pt, radius: 6pt, width: 100%)[
        #align(center)[
          #text(weight: "bold", fill: rgb("#7e22ce"), size: 12pt)[Côtang]
          #v(0.2em)
          #text(size: 11.5pt, fill: rgb("#d81b60"), weight: "bold")[$cot alpha = x_0/y_0$]
          #v(0.2em)
          #text(size: 9.5pt)[($alpha != 0 degree, 180 degree$)]
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: TÍNH CHẤT & GÓC BÙ NHAU
// ════════════════════════════════════════════════
#lt-section-link("sec-tinh-chat-goc-bu", "⚡", [III. Dấu & Mối Quan Hệ Giữa Hai Góc Bù])

#lt-slide-back(title: "⚡ Dấu Của Các Giá Trị Lượng Giác")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Góc nhọn ($0 degree < alpha < 90 degree$)]
        #v(0.25em)
        Điểm $M(x_0; y_0)$ nằm ở góc phần tư thứ I:
        - $x_0 > 0, y_0 > 0$
        - $sin alpha > 0, quad cos alpha > 0$
        - $tan alpha > 0, quad cot alpha > 0$
        #v(0.2em)
        #text(fill: rgb("#15803d"), weight: "bold")[👉 Tất cả đều mang dấu DƯƠNG.]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[2. Góc tù ($90 degree < alpha < 180 degree$)]
        #v(0.25em)
        Điểm $M(x_0; y_0)$ nằm ở góc phần tư thứ II:
        - $x_0 < 0, y_0 > 0$
        - $sin alpha > 0$ *(duy nhất sin dương)*
        - $cos alpha < 0, quad tan alpha < 0, quad cot alpha < 0$
        #v(0.2em)
        #text(fill: rgb("#dc2626"), weight: "bold")[👉 Côsin, Tang, Côtang mang dấu ÂM.]
      ]
    ]
  )
]

#lt-slide-back(title: "💎 Công Thức Hai Góc Bù Nhau")[
  #lt-important(title: "Định lý: Sin bù — Côsin, Tang, Côtang đối nhau")[
    Với mọi góc $alpha$ thỏa mãn $0 degree <= alpha <= 180 degree$, ta có:
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 14pt,
    row-gutter: 10pt,
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(size: 13pt, fill: rgb("#15803d"), weight: "bold")[$sin(180 degree - alpha) = sin alpha$]
        #v(0.2em)
        #text(size: 10pt)[(Sin của hai góc bù nhau bằng nhau)]
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(size: 13pt, fill: rgb("#1d4ed8"), weight: "bold")[$cos(180 degree - alpha) = -cos alpha$]
        #v(0.2em)
        #text(size: 10pt)[(Côsin của hai góc bù nhau đối nhau)]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(size: 13pt, fill: rgb("#a16207"), weight: "bold")[$tan(180 degree - alpha) = -tan alpha$]
        #v(0.2em)
        #text(size: 10pt)[($alpha != 90 degree$)]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(size: 13pt, fill: rgb("#7e22ce"), weight: "bold")[$cot(180 degree - alpha) = -cot alpha$]
        #v(0.2em)
        #text(size: 10pt)[($alpha != 0 degree, 180 degree$)]
      ]
    ]
  )
]

#lt-slide-back(title: "📋 4 Hằng Đẳng Thức Lượng Giác Cơ Bản")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[1. Hệ thức Sin và Côsin]
        #v(0.2em)
        #text(size: 13pt, fill: rgb("#d81b60"), weight: "bold")[$sin^2 alpha + cos^2 alpha = 1$]
        #v(0.2em)
        #text(size: 9.5pt)[Đúng với mọi $0 degree <= alpha <= 180 degree$.]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 11pt)[2. Tích Tang và Côtang]
        #v(0.2em)
        #text(size: 13pt, fill: rgb("#d81b60"), weight: "bold")[$tan alpha dot cot alpha = 1$]
        #v(0.2em)
        #text(size: 9.5pt)[Đúng với $alpha != 0 degree, 90 degree, 180 degree$.]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 11pt)[3. Liên hệ Tang và Côsin]
        #v(0.2em)
        #text(size: 13pt, fill: rgb("#d81b60"), weight: "bold")[$1 + tan^2 alpha = 1/(cos^2 alpha)$]
        #v(0.2em)
        #text(size: 9.5pt)[Đúng với $alpha != 90 degree$.]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 11pt)[4. Liên hệ Côtang và Sin]
        #v(0.2em)
        #text(size: 13pt, fill: rgb("#d81b60"), weight: "bold")[$1 + cot^2 alpha = 1/(sin^2 alpha)$]
        #v(0.2em)
        #text(size: 9.5pt)[Đúng với $alpha != 0 degree, 180 degree$.]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [IV. Bài tập: Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — GIÁ TRỊ LƯỢNG GIÁC CỦA MỘT GÓC],
  questions: (
    (num: 1, type: "TN", desc: [Dấu Lượng Giác Góc Tù]),
    (num: 2, type: "TN", desc: [Góc Đặc Biệt]),
    (num: 3, type: "TN", desc: [Tính Chất Góc Bù]),
    (num: 4, type: "TN", desc: [Tính Giá Trị Lượng Giác]),
    (num: 5, type: "TN", desc: [Rút Gọn Biểu Thức]),
    (num: 6, type: "TN", desc: [Biểu Thức Đồng Bậc]),
    (num: 7, type: "DS", desc: [Đúng/Sai Lý Thuyết Góc]),
    (num: 8, type: "TLN", desc: [Triệt Tiêu Đối Nhau]),
    (num: 9, type: "TLN", desc: [Hệ Thức Đối Xứng]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Với góc $alpha$ thỏa mãn $90 degree < alpha < 180 degree$, khẳng định nào sau đây là *đúng*?],
  (
    [$sin alpha < 0$],
    [$cos alpha > 0$],
    [$tan alpha < 0$],
    [$cot alpha > 0$],
  ),
  correct: 3,
  num: 1,
  de: "Đề 05A — Dấu Lượng Giác Góc Tù",
  loigiai: [
    Khi $90 degree < alpha < 180 degree$, điểm $M$ thuộc góc phần tư thứ II nên $x_0 < 0, y_0 > 0$.\
    Do đó: $sin alpha > 0$, $cos alpha < 0$, $tan alpha = y_0/x_0 < 0$, $cot alpha < 0$.\
    Vậy chỉ có khẳng định *$tan alpha < 0$* là đúng.
  ]
)

#lt-tn(
  [Giá trị của biểu thức $P = sin 30 degree + cos 60 degree$ bằng bao nhiêu?],
  (
    [$1/2$],
    [$1$],
    [$sqrt(3)/2$],
    [$sqrt(3)$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 05A — Góc Đặc Biệt",
  loigiai: [
    Ta có các giá trị góc đặc biệt: $sin 30 degree = 1/2$ và $cos 60 degree = 1/2$.\
    Suy ra $P = 1/2 + 1/2 = 1$.\
    Chọn đáp án *B: 1*.
  ]
)

#lt-tn(
  [Giá trị của $cos 120 degree$ bằng:],
  (
    [$1/2$],
    [$-1/2$],
    [$sqrt(3)/2$],
    [$-sqrt(3)/2$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 05B — Tính Chất Góc Bù",
  loigiai: [
    Áp dụng công thức hai góc bù nhau: $cos(180 degree - alpha) = -cos alpha$.\
    Ta có: $cos 120 degree = cos(180 degree - 60 degree) = -cos 60 degree = -1/2$.\
    Chọn đáp án *B: -1/2*.
  ]
)

#lt-tn(
  [Cho biết $sin alpha = 3/5$ với $90 degree < alpha < 180 degree$. Giá trị của $cos alpha$ bằng:],
  (
    [$4/5$],
    [$-4/5$],
    [$16/25$],
    [$-16/25$],
  ),
  correct: 2,
  num: 4,
  de: "Đề 05B — Tính Giá Trị Lượng Giác",
  loigiai: [
    Từ $sin^2 alpha + cos^2 alpha = 1 arrow cos^2 alpha = 1 - (3/5)^2 = 16/25$.\
    Vì $90 degree < alpha < 180 degree$ (góc tù) nên $cos alpha < 0$.\
    Do đó $cos alpha = -sqrt(16/25) = -4/5$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Giá trị của biểu thức $A = sin 135 degree + cos 45 degree$ bằng:],
  (
    [$0$],
    [$sqrt(2)$],
    [$sqrt(2)/2$],
    [$2$],
  ),
  correct: 2,
  num: 5,
  de: "Đề 05C — Rút Gọn Biểu Thức",
  loigiai: [
    Ta có $sin 135 degree = sin(180 degree - 45 degree) = sin 45 degree = sqrt(2)/2$.\
    Mặt khác $cos 45 degree = sqrt(2)/2$.\
    Vậy $A = sqrt(2)/2 + sqrt(2)/2 = sqrt(2)$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Cho $tan alpha = -2$. Giá trị của biểu thức $P = (2 sin alpha + cos alpha)/(sin alpha - 3 cos alpha)$ bằng:],
  (
    [$3/5$],
    [$-3/5$],
    [$3$],
    [$-3$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 05C — Biểu Thức Đồng Bậc",
  loigiai: [
    Chia cả tử và mẫu của $P$ cho $cos alpha != 0$:\
    $P = (2 tan alpha + 1)/(tan alpha - 3) = (2(-2) + 1)/(-2 - 3) = (-3)/(-5) = 3/5$.\
    Chọn đáp án *A: 3/5*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho góc $alpha$ thỏa mãn $0 degree <= alpha <= 180 degree$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Đẳng thức $sin(180 degree - alpha) = sin alpha$ luôn đúng với mọi $alpha$.], "true": true),
    (body: [Nếu $cos alpha < 0$ thì $alpha$ là một góc tù.], "true": true),
    (body: [Giá trị của $sin alpha$ luôn nhận giá trị không âm ($sin alpha >= 0$).], "true": true),
    (body: [Đẳng thức $tan(180 degree - alpha) = tan alpha$ đúng với mọi $alpha != 90 degree$.], "true": false),
  ),
  de: "Đề 05D — Đúng/Sai Lý Thuyết Góc",
  num: 7,
  loigiai: [
    - a) *Đ:* Sin hai góc bù nhau luôn bằng nhau.
    - b) *Đ:* Trên nửa đường tròn đơn vị, $cos alpha < 0 arrow x_0 < 0 arrow 90 degree < alpha <= 180 degree$.
    - c) *Đ:* Nửa đường tròn đơn vị nằm ở nửa mặt phẳng $y >= 0$ nên $sin alpha = y_0 >= 0$.
    - d) *S:* Tang hai góc bù nhau phải đối nhau: $tan(180 degree - alpha) = -tan alpha$.
  ]
)

#lt-tln(
  [Tính giá trị của biểu thức $S = cos 10 degree + cos 20 degree + cos 160 degree + cos 170 degree$.],
  [0],
  num: 8,
  de: "Đề 05E — Triệt Tiêu Đối Nhau",
  loigiai: [
    Ghép các cặp góc bù nhau: $(10 degree, 170 degree)$ và $(20 degree, 160 degree)$:\
    $cos 170 degree = -cos 10 degree arrow cos 10 degree + cos 170 degree = 0$.\
    $cos 160 degree = -cos 20 degree arrow cos 20 degree + cos 160 degree = 0$.\
    Vậy tổng $S = 0 + 0 = 0$.
  ]
)

#lt-tln(
  [Cho góc $alpha$ ($0 degree < alpha < 90 degree$) thỏa mãn $sin alpha + cos alpha = 7/5$. Tính giá trị của $sin alpha dot cos alpha$ (nhập kết quả dưới dạng số thập phân).],
  [0.24],
  num: 9,
  de: "Đề 05F — Hệ Thức Đối Xứng",
  loigiai: [
    Bình phương hai vế của $sin alpha + cos alpha = 7/5$:\
    $(sin alpha + cos alpha)^2 = (7/5)^2 = 49/25$.\
    $sin^2 alpha + cos^2 alpha + 2 sin alpha cos alpha = 49/25$.\
    $1 + 2 sin alpha cos alpha = 49/25 arrow 2 sin alpha cos alpha = 24/25 = 0.48$.\
    Suy ra $sin alpha cos alpha = 0.24$.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c3-b1", "💎", [VI. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Ghi Nhớ Giá Trị Lượng Giác")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. TỌA ĐỘ TRÊN ĐƯỜNG TRÒN]
        #v(0.2em)
        #text(size: 10pt)[
          - $sin alpha = y_0$ (tung độ).
          - $cos alpha = x_0$ (hoành độ).
          - $tan alpha = y_0/x_0, cot alpha = x_0/y_0$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. QUY TẮC DẤU]
        #v(0.2em)
        #text(size: 10pt)[
          - $sin alpha >= 0$ với mọi $alpha in [0 degree, 180 degree]$.
          - $alpha$ nhọn: $cos, tan, cot > 0$.
          - $alpha$ tù: $cos, tan, cot < 0$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. GÓC BÙ NHAU]
        #v(0.2em)
        #text(size: 10pt)[
          - $sin(180 degree - alpha) = sin alpha$.
          - $cos, tan, cot$ mang dấu âm đối xứng.
          - "Sin bù, Phụ chéo".
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. 4 HẰNG ĐẲNG THỨC]
        #v(0.2em)
        #text(size: 10pt)[
          - $sin^2 alpha + cos^2 alpha = 1$.
          - $tan alpha dot cot alpha = 1$.
          - $1 + tan^2 alpha = 1/(cos^2 alpha)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. BẪY THƯỜNG GẶP]
        #v(0.2em)
        #text(size: 10pt)[
          - Quên $cos alpha < 0$ khi góc tù.
          - Nhầm lẫn giữa $tan$ và $cot$.
          - Đổi nhầm dấu sin khi bù nhau.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. BƯỚC ĐỆM BÀI 2]
        #v(0.2em)
        #text(size: 10pt)[
          - Nền tảng Định lí Côsin: $a^2 = b^2 + c^2 - 2 b c cos A$.
          - Nền tảng Định lí Sin: $a/(sin A) = 2R$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 1 — CHƯƠNG III!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Lượng giác mở rộng tầm nhìn của chúng ta từ góc vuông hạn hẹp\nđến mọi quy luật biến thiên của không gian và hình học."\
        Chuẩn bị chinh phục #text(fill: rgb("#fde047"), weight: "bold")[Bài 2: Định Lí Côsin & Định Lí Sin Trong Tam Giác]!
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
