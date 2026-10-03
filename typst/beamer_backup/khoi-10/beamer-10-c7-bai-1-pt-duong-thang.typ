#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Phương Trình Đường Thẳng],
  subtitle: [TOÁN 10 — CHƯƠNG VII: VTCP, VTPT, PHƯƠNG TRÌNH THAM SỐ & PHƯƠNG TRÌNH TỔNG QUÁT],
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
// PHẦN I: VECTƠ CHỈ PHƯƠNG & VECTƠ PHÁP TUYẾN
// ════════════════════════════════════════════════
#lt-section-link("sec-vtcp-vtpt", "🧭", [I. Vectơ Chỉ Phương & Vectơ Pháp Tuyến])

#lt-slide-back(title: "🧭 Giấc Mơ Mùa Đông Của René Descartes (1619)")[
  #lt-two-col(
    ratio: (56%, 44%),
    [
      #lt-definition(title: "Cuộc hôn phối giữa Hình học và Đại số")[
        - Thế kỷ XVII: Hình học và Đại số hoàn toàn tách biệt.
        - Đêm 10/11/1619, Descartes nhìn con ruồi bò trên trần nhà và nhận ra: *mọi vị trí đều xác định bởi cặp tọa độ $(x; y)$*.
        - Quỹ đạo bò của con ruồi chính là một *phương trình liên hệ giữa $x$ và $y$*!
      ]
      #v(0.1em)
      #lt-tip(title: "Bản chất đường thẳng")[
        Đường thẳng là tập hợp các điểm $(x; y)$ thỏa mãn phương trình bậc nhất hai ẩn.
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 7pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10pt)[📜 Pierre de Fermat & Quỹ Tích]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Năm 1636, *Pierre de Fermat* viết luận án *“Ad Locos Planos et Solidos Isagoge”*.
          - Fermat khẳng định: *“Hai đại lượng chưa biết trong phương trình bậc nhất vạch ra một đường thẳng!”*
          - Descartes và Fermat cùng mở ra kỷ nguyên *số hóa hình học*.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Định Nghĩa Vectơ Chỉ Phương & Vectơ Pháp Tuyến")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "1. Vectơ chỉ phương (VTCP)")[
        Vectơ $vec(u) != vec(0)$ được gọi là *vectơ chỉ phương* của đường thẳng $Delta$ nếu giá của nó song song hoặc trùng với $Delta$.
        - Nếu $vec(u)$ là VTCP thì $k vec(u)$ ($k != 0$) cũng là VTCP của $Delta$.
        - Đường thẳng hoàn toàn xác định khi biết $1$ điểm và $1$ VTCP.
      ]
    ],
    [
      #lt-definition(title: "2. Vectơ pháp tuyến (VTPT)")[
        Vectơ $vec(n) != vec(0)$ được gọi là *vectơ pháp tuyến* của đường thẳng $Delta$ nếu giá của nó vuông góc với $Delta$.
        - Nếu $vec(n)$ là VTPT thì $k vec(n)$ ($k != 0$) cũng là VTPT của $Delta$.
        - Đường thẳng hoàn toàn xác định khi biết $1$ điểm và $1$ VTPT.
      ]
    ]
  )
  #v(0.2em)
  #lt-important(title: "Mối liên hệ tương hỗ giữa VTCP và VTPT")[
    Do $vec(u) perp vec(n) <=> vec(u) dot vec(n) = 0$, nên nếu $vec(u) = (a; b)$ thì ta có thể chọn $vec(n) = (-b; a)$ hoặc $vec(n) = (b; -a)$.
  ]
]

#lt-slide-back(title: "🎨 Trực Quan Hóa VTCP Và VTPT Trên Mặt Phẳng")[
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #lt-theorem(title: "Đặc trưng hình học")[
        - Cho đường thẳng $Delta$ đi qua điểm $M_0(x_0; y_0)$.
        - Với mọi điểm $M(x; y)$ thuộc $Delta$:
          $ arrow(M_0 M) "cùng phương với" vec(u) <=> arrow(M_0 M) = t vec(u) $
          $ arrow(M_0 M) perp vec(n) <=> arrow(M_0 M) dot vec(n) = 0 $
        - Hai điều kiện tương đương trên chính là chìa khóa xây dựng *Phương trình tham số* và *Phương trình tổng quát*!
      ]
    ],
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let sc = 1.0

          // Trục tọa độ
          line((-0.5*sc, 0), (4.5*sc, 0), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.9pt + rgb("#94a3b8"))
          content((4.4*sc, -0.3*sc), text(size: 8pt, fill: rgb("#64748b"))[$x$])
          line((0, -0.5*sc), (0, 3.5*sc), mark: (end: "stealth", fill: rgb("#94a3b8")), stroke: 0.9pt + rgb("#94a3b8"))
          content((-0.3*sc, 3.4*sc), text(size: 8pt, fill: rgb("#64748b"))[$y$])
          content((-0.25*sc, -0.25*sc), text(size: 8pt, fill: rgb("#64748b"))[$O$])

          // Đường thẳng Delta
          line((0.3*sc, 0.4*sc), (4.2*sc, 3.0*sc), stroke: 1.8pt + rgb("#2563eb"))
          content((4.4*sc, 2.9*sc), text(size: 10pt, weight: "bold", fill: rgb("#2563eb"))[$Delta$])

          // Điểm M0 và M
          circle((1.2*sc, 1.0*sc), radius: 2.5pt, fill: rgb("#1d4ed8"))
          content((1.2*sc, 0.65*sc), text(size: 9pt, weight: "bold", fill: rgb("#1d4ed8"))[$M_0(x_0; y_0)$])

          circle((3.0*sc, 2.2*sc), radius: 2.5pt, fill: rgb("#1d4ed8"))
          content((3.1*sc, 1.85*sc), text(size: 9pt, weight: "bold", fill: rgb("#1d4ed8"))[$M(x; y)$])

          // Vectơ chỉ phương u
          line((1.2*sc, 1.0*sc), (2.2*sc, 1.67*sc), mark: (end: "stealth", fill: rgb("#059669")), stroke: 2.2pt + rgb("#059669"))
          content((1.6*sc, 1.65*sc), text(size: 9.5pt, weight: "bold", fill: rgb("#059669"))[$vec(u)$])

          // Vectơ pháp tuyến n
          line((1.2*sc, 1.0*sc), (0.6*sc, 1.9*sc), mark: (end: "stealth", fill: rgb("#dc2626")), stroke: 2.2pt + rgb("#dc2626"))
          content((0.4*sc, 2.1*sc), text(size: 9.5pt, weight: "bold", fill: rgb("#dc2626"))[$vec(n)$])

          // Ký hiệu vuông góc
          line((1.0*sc, 1.3*sc), (1.25*sc, 1.47*sc), stroke: 0.8pt + rgb("#dc2626"))
          line((1.25*sc, 1.47*sc), (1.45*sc, 1.17*sc), stroke: 0.8pt + rgb("#dc2626"))
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: CÁC DẠNG PHƯƠNG TRÌNH ĐƯỜNG THẲNG
// ════════════════════════════════════════════════
#lt-section-link("sec-cac-dang-pt", "📝", [II. Các Dạng Phương Trình Đường Thẳng])

#lt-slide-back(title: "📝 Phương Trình Tham Số Của Đường Thẳng")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Phương trình tham số")[
        Đường thẳng $Delta$ đi qua điểm $M_0(x_0; y_0)$ và nhận $vec(u) = (u_1; u_2)$ ($vec(u) != vec(0)$) làm VTCP có phương trình tham số:
        $ cases(x = x_0 + u_1 t, y = y_0 + u_2 t) quad (t in RR) $
        - Mỗi giá trị tham số $t in RR$ tương ứng với duy nhất một điểm $M(x; y)$ trên $Delta$.
        - Nếu $u_1 != 0$ và $u_2 != 0$, ta rút ra phương trình chính tắc: $(x - x_0)/u_1 = (y - y_0)/u_2$.
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[🚀 Ý Nghĩa Vật Lý & Động Học]\
        #v(0.2em)
        #text(size: 8.5pt)[
          - Nếu một chất điểm chuyển động thẳng đều với vận tốc $vec(v) = (v_x; v_y)$ từ vị trí ban đầu $M_0(x_0; y_0)$ tại thời điểm $t=0$:
          $ cases(x(t) = x_0 + v_x t, y(t) = y_0 + v_y t) $
          - Tham số $t$ chính là *thời gian* trôi qua!
          - Được áp dụng trực tiếp trong radar hàng không, hải quân và vật lý cơ học.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Phương Trình Tổng Quát Của Đường Thẳng")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Phương trình tổng quát")[
        Đường thẳng $Delta$ đi qua $M_0(x_0; y_0)$ có VTPT $vec(n) = (a; b)$ ($a^2 + b^2 > 0$) có phương trình:
        $ a(x - x_0) + b(y - y_0) = 0 $
        Đặt $c = -a x_0 - b y_0$, ta được dạng tổng quát:
        $ a x + b y + c = 0 $
        - Ngược lại: Mọi phương trình bậc nhất hai ẩn $a x + b y + c = 0$ ($a^2 + b^2 > 0$) đều xác định một đường thẳng có VTPT là $vec(n) = (a; b)$.
      ]
    ],
    [
      #lt-important(title: "Các trường hợp riêng biệt")[
        - $a = 0 <=> y = -c/b$: Đường thẳng song song hoặc trùng với trục hoành $O x$.
        - $b = 0 <=> x = -c/a$: Đường thẳng song song hoặc trùng với trục tung $O y$.
        - $c = 0 <=> a x + b y = 0$: Đường thẳng luôn đi qua gốc tọa độ $O(0; 0)$.
        - Nếu $b != 0$: $y = k x + m$ với hệ số góc $k = -a/b = tan alpha$ ($alpha$ là góc tạo bởi đường thẳng với chiều dương trục $O x$).
      ]
    ]
  )
]

#lt-slide-back(title: "⚡ Phương Trình Đoạn Chắn & Thuật Toán Bresenham")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Phương trình theo đoạn chắn")[
        Nếu đường thẳng $Delta$ cắt trục $O x$ tại $A(a; 0)$ và cắt trục $O y$ tại $B(0; b)$ ($a, b != 0$) thì phương trình của $Delta$ là:
        $ x/a + y/b = 1 $
        - Cho phép nhận biết ngay giao điểm với hai trục tọa độ.
        - Diện tích tam giác vuông $O A B$: $S_(O A B) = 1/2 |a| dot |b|$.
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[🖥️ Thuật Toán Bresenham Trong GPU (1962)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Khi chip GPU hiển thị đoạn thẳng trên màn hình máy tính, nó phải chọn các pixel rời rạc.
          - Kỹ sư Jack Bresenham dùng phương trình tổng quát $F(x, y) = 2 Delta y dot x - 2 Delta x dot y + C = 0$.
          - Chỉ dùng *cộng trừ số nguyên*, không cần số thực hay phép chia, vẽ hàng triệu đoạn thẳng mỗi giây trong DOOM, AutoCAD và card màn hình NVIDIA!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & ỨNG DỤNG
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VII BÀI 1],
  questions: (
    (num: 1, type: "TN", desc: [VTCP từ PT tham số]),
    (num: 2, type: "TN", desc: [VTPT từ PT tổng quát]),
    (num: 3, type: "TN", desc: [Chuyển đổi giữa VTCP & VTPT]),
    (num: 4, type: "TN", desc: [Lập PTTQ qua điểm có VTPT]),
    (num: 5, type: "TN", desc: [Lập PT tham số qua điểm có VTCP]),
    (num: 6, type: "TN", desc: [PT đường thẳng theo đoạn chắn]),
    (num: 7, type: "DS", desc: [Đúng/Sai khảo sát đường thẳng]),
    (num: 8, type: "TLN", desc: [Hệ số PTTQ đường cao tam giác]),
    (num: 9, type: "TLN", desc: [Quãng đường bay Drone trinh sát]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Đường thẳng $Delta: cases(x = 1 - 2t, y = 3 + 5t)$ có một vectơ chỉ phương là:],
  (
    [$vec(u) = (-2; 5)$],
    [$vec(u) = (1; 3)$],
    [$vec(u) = (2; 5)$],
    [$vec(u) = (5; -2)$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 21A — Xác Định Vectơ Chỉ Phương Từ Phương Trình Tham Số",
  loigiai: [
    Từ phương trình tham số $cases(x = x_0 + u_1 t, y = y_0 + u_2 t)$, các hệ số đứng trước tham số $t$ chính là tọa độ của một vectơ chỉ phương:\
    $u_1 = -2, u_2 = 5 ==> vec(u) = (-2; 5)$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Đường thẳng $d: 3x - 4y + 7 = 0$ có một vectơ pháp tuyến là:],
  (
    [$vec(n) = (3; 4)$],
    [$vec(n) = (4; 3)$],
    [$vec(n) = (3; -4)$],
    [$vec(n) = (-4; 3)$],
  ),
  correct: 3,
  num: 2,
  de: "Đề 21A — Xác Định Vectơ Pháp Tuyến Từ Phương Trình Tổng Quát",
  loigiai: [
    Từ phương trình tổng quát $a x + b y + c = 0$, tọa độ một vectơ pháp tuyến của đường thẳng là cặp hệ số $(a; b)$ của $x$ và $y$:\
    Tại đây $a = 3$ và $b = -4 ==> vec(n) = (3; -4)$.\
    Do đó phương án đúng là *C*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Một đường thẳng có vectơ chỉ phương là $vec(u) = (2; -3)$. Một vectơ pháp tuyến của đường thẳng đó là:],
  (
    [$vec(n) = (3; 2)$],
    [$vec(n) = (-3; 2)$],
    [$vec(n) = (2; 3)$],
    [$vec(n) = (-2; -3)$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 21A — Quan Hệ Vuông Góc Giữa VTCP Và VTPT",
  loigiai: [
    Vectơ pháp tuyến $vec(n)$ và vectơ chỉ phương $vec(u)$ luôn vuông góc với nhau: $vec(n) dot vec(u) = 0$.\
    Nếu $vec(u) = (u_1; u_2) = (2; -3)$ thì $vec(n)$ có dạng $(-u_2; u_1) = (3; 2)$ hoặc đối của nó.\
    Thử tích vô hướng: $3 dot 2 + 2 dot (-3) = 6 - 6 = 0$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình tổng quát của đường thẳng đi qua điểm $A(1; 2)$ và nhận $vec(n) = (2; -1)$ làm vectơ pháp tuyến là:],
  (
    [$2x - y = 0$],
    [$2x - y - 4 = 0$],
    [$x + 2y - 5 = 0$],
    [$2x + y - 4 = 0$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 21A — Lập Phương Trình Tổng Quát Đi Qua Một Điểm Có VTPT",
  loigiai: [
    Phương trình tổng quát đường thẳng đi qua $A(x_0; y_0) = (1; 2)$ có VTPT $vec(n) = (a; b) = (2; -1)$ là:\
    $a(x - x_0) + b(y - y_0) = 0 <=> 2(x - 1) - 1(y - 2) = 0 <=> 2x - y = 0$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình tham số của đường thẳng đi qua điểm $M(-2; 3)$ và có vectơ chỉ phương $vec(u) = (1; -4)$ là:],
  (
    [$cases(x = 1 - 2t, y = -4 + 3t)$],
    [$cases(x = -2 + t, y = 3 - 4t)$],
    [$cases(x = -2 - 4t, y = 3 + t)$],
    [$cases(x = 2 + t, y = -3 - 4t)$],
  ),
  correct: 2,
  num: 5,
  de: "Đề 21A — Lập Phương Trình Tham Số Đi Qua Một Điểm Có VTCP",
  loigiai: [
    Phương trình tham số của đường thẳng đi qua $M(x_0; y_0) = (-2; 3)$ với VTCP $vec(u) = (u_1; u_2) = (1; -4)$ là:\
    $cases(x = x_0 + u_1 t, y = y_0 + u_2 t) <=> cases(x = -2 + t, y = 3 - 4t) quad (t in RR)$.\
    Do đó phương án đúng là *B*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Phương trình đường thẳng đi qua hai điểm $A(3; 0)$ và $B(0; -2)$ viết theo dạng đoạn chắn là:],
  (
    [$x/3 + y/(-2) = 1$],
    [$x/(-2) + y/3 = 1$],
    [$x/3 - y/2 = 0$],
    [$x/3 + y/2 = 1$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 21A — Phương Trình Đường Thẳng Theo Đoạn Chắn",
  loigiai: [
    Đường thẳng cắt trục hoành tại $A(a; 0) = (3; 0)$ và cắt trục tung tại $B(0; b) = (0; -2)$.\
    Theo công thức phương trình theo đoạn chắn:\
    $x/a + y/b = 1 <=> x/3 + y/(-2) = 1$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Cho đường thẳng $d: 3x - 4y + 12 = 0$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Một vectơ pháp tuyến của đường thẳng $d$ là $vec(n) = (3; -4)$.], "true": true),
    (body: [Một vectơ chỉ phương của đường thẳng $d$ là $vec(u) = (4; 3)$.], "true": true),
    (body: [Đường thẳng $d$ cắt trục hoành $O x$ tại điểm $A(-4; 0)$.], "true": true),
    (body: [Diện tích tam giác vuông do $d$ tạo với hai trục tọa độ bằng $12$.], "true": false),
  ),
  num: 7,
  de: "Đề 21A — Khảo Sát Toàn Diện Đường Thẳng Trong Mặt Phẳng Tọa Độ",
  loigiai: [
    - a) *Đ:* Cặp hệ số của $x$ và $y$ trong PTTQ là $a = 3, b = -4 ==> vec(n) = (3; -4)$.
    - b) *Đ:* Do $vec(n) dot vec(u) = 3 dot 4 + (-4) dot 3 = 0$ nên $vec(u) = (4; 3)$ là VTCP.
    - c) *Đ:* Giao với $O x$ cho $y = 0 ==> 3x + 12 = 0 <=> x = -4 ==> A(-4; 0)$.
    - d) *S:* Giao $O y$ cho $x=0 ==> y=3 ==> B(0; 3)$. Diện tích $S = 1/2 O A dot O B = 1/2 dot 4 dot 3 = 6 != 12$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Trong mặt phẳng $O x y$, cho tam giác $A B C$ có $A(1; 3)$, $B(-1; 1)$ và $C(5; -1)$. Đường cao $A H$ kẻ từ đỉnh $A$ vuông góc với cạnh $B C$ có phương trình tổng quát dạng $3x - y + c = 0$. Tìm giá trị của hằng số $c$.],
  "0",
  num: 8,
  de: "Đề 21A — Phương Trình Tổng Quát Đường Cao Trong Tam Giác",
  loigiai: [
    1. Vectơ chỉ phương của cạnh $B C$ là: $arrow(B C) = (5 - (-1); -1 - 1) = (6; -2)$.\
    2. Vì đường cao $A H perp B C$ nên $A H$ nhận $arrow(B C) = (6; -2)$ hay vectơ cùng phương $vec(n)_(A H) = (3; -1)$ làm vectơ pháp tuyến.\
    3. Phương trình tổng quát của $A H$ đi qua $A(1; 3)$ là:\
       $3(x - 1) - 1(y - 3) = 0 <=> 3x - y = 0$.\
    4. So sánh với dạng $3x - y + c = 0$, ta có $c = 0$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Một thiết bị bay không người lái (Drone) cất cánh từ vị trí trạm điều khiển có tọa độ $O(0; 0)$ và bay thẳng đều với vectơ vận tốc $vec(v) = (6; 8) " (km/h)"$. Sau $1$ giờ bay liên tục theo hướng đó, khoảng cách từ vị trí của Drone đến trạm điều khiển $O$ bằng bao nhiêu kilômét?],
  "10",
  num: 9,
  de: "Đề 21A — Ứng Dụng Chuyển Động Thẳng Đều Trong Tọa Độ Oxy",
  loigiai: [
    1. Vị trí ban đầu của Drone là $O(0; 0)$ tại $t=0$.\
    2. Phương trình chuyển động tham số theo thời gian $t$ (giờ) là: $cases(x(t) = 6t, y(t) = 8t)$.\
    3. Sau $t = 1$ giờ, tọa độ của Drone là $M(6; 8)$.\
    4. Khoảng cách từ vị trí Drone đến trạm $O$ chính là độ dài đoạn thẳng $O M$:\
       $d = O M = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10 " (km)"$.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC BÀI HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Ma Trận Kỹ Năng & Cột Mốc])

#lt-slide-back(title: "🗺️ Ma Trận Chuyển Đổi Phương Trình Đường Thẳng")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr),
        column-gutter: 12pt,
        row-gutter: 10pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"))[1. Phương trình tham số]\
            #v(0.1em)
            $cases(x = x_0 + u_1 t, y = y_0 + u_2 t)$ \
            Biết $M_0(x_0; y_0)$ và VTCP $vec(u) = (u_1; u_2)$
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#10b981"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#047857"))[2. Phương trình tổng quát]\
            #v(0.1em)
            $a x + b y + c = 0$ ($a^2 + b^2 > 0$) \
            Biết $M_0(x_0; y_0)$ và VTPT $vec(n) = (a; b)$
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"))[3. Chuyển đổi VTCP $arrow.l.r$ VTPT]\
            #v(0.1em)
            $vec(u) = (a; b) <=> vec(n) = (-b; a)$ \
            $vec(u) dot vec(n) = 0$ (tích vô hướng bằng 0)
          ]
        ],
        [
          #block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#7e22ce"))[4. Phương trình đoạn chắn & hệ số góc]\
            #v(0.1em)
            Đoạn chắn: $x/a + y/b = 1$ ($a, b != 0$)\
            Hệ số góc: $y = k x + m$ ($k = -a/b$)
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 19!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 18pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 20pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 19!]\
      #v(0.5em)
      #text(size: 11pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn các kỹ năng cốt lõi:\
        *Vectơ chỉ phương, Vectơ pháp tuyến, Phương trình tham số & Phương trình tổng quát.*
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 12pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
