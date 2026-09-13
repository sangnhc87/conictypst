// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 19: PHƯƠNG TRÌNH ĐƯỜNG THẲNG (ĐỀ SỐ 21A - CƠ BẢN ĐẾN VẬN DỤNG)
// Lớp: Khối 10  ·  Mã đề: 155  ·  GV: Nguyễn Văn Sang
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



#show: lecture-theme.with(
  title: "BÀI 19: PHƯƠNG TRÌNH ĐƯỜNG THẲNG (ĐỀ SỐ 21A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subtitle: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG — MÃ ĐỀ: 155",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 155]],
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

// TN 1
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Đường thẳng $Delta: cases(x = 1 - 2t, y = 3 + 5t)$ có một vectơ chỉ phương là],
    (
        True([$vec(u) = (-2; 5)$]),
        [$vec(u) = (1; 3)$],
        [$vec(u) = (2; 5)$],
        [$vec(u) = (5; -2)$]
    ),
    loigiai: [
        Từ phương trình tham số $cases(x = x_0 + a t, y = y_0 + b t)$, một vectơ chỉ phương của đường thẳng là $vec(u) = (a; b) = (-2; 5)$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Đường thẳng $d: 3x - 4y + 7 = 0$ có một vectơ pháp tuyến là],
    (
        True([$vec(n) = (3; -4)$]),
        [$vec(n) = (4; 3)$],
        [$vec(n) = (3; 4)$],
        [$vec(n) = (-4; 3)$]
    ),
    loigiai: [
        Từ phương trình tổng quát $a x + b y + c = 0$, một vectơ pháp tuyến của đường thẳng là $vec(n) = (a; b) = (3; -4)$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Một đường thẳng có vectơ chỉ phương là $vec(u) = (2; -3)$. Một vectơ pháp tuyến của đường thẳng đó là],
    (
        True([$vec(n) = (3; 2)$]),
        [$vec(n) = (-3; 2)$],
        [$vec(n) = (2; 3)$],
        [$vec(n) = (-2; 3)$]
    ),
    loigiai: [
        Nếu đường thẳng có vectơ chỉ phương $vec(u) = (a; b)$ thì vectơ pháp tuyến vuông góc với $vec(u)$ có dạng $vec(n) = (-b; a)$ hoặc $(b; -a)$.
        Với $vec(u) = (2; -3)$, chọn $vec(n) = (3; 2)$ vì $vec(u) cdot vec(n) = 2(3) + (-3)(2) = 0$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Phương trình tổng quát của đường thẳng đi qua điểm $A(1; 2)$ và nhận $vec(n) = (2; -1)$ làm vectơ pháp tuyến là],
    (
        True([$2x - y = 0$]),
        [$2x - y - 4 = 0$],
        [$x + 2y - 5 = 0$],
        [$2x + y - 4 = 0$]
    ),
    loigiai: [
        Phương trình tổng quát:
        $ 2(x - 1) - 1(y - 2) = 0 <=> 2x - 2 - y + 2 = 0 <=> 2x - y = 0 $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Phương trình tham số của đường thẳng đi qua điểm $M(-2; 3)$ và có vectơ chỉ phương $vec(u) = (1; -4)$ là],
    (
        True([$cases(x = -2 + t, y = 3 - 4t)$]),
        [$cases(x = 1 - 2t, y = -4 + 3t)$],
        [$cases(x = -2 + 4t, y = 3 + t)$],
        [$cases(x = 2 + t, y = -3 - 4t)$]
    ),
    loigiai: [
        Phương trình tham số của đường thẳng đi qua $M(x_0; y_0)$ với VTCP $vec(u) = (a; b)$ là:
        $ cases(x = x_0 + a t, y = y_0 + b t) <=> cases(x = -2 + t, y = 3 - 4t) $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Phương trình tổng quát của đường thẳng đi qua hai điểm $A(1; 3)$ và $B(4; 7)$ là],
    (
        True([$4x - 3y + 5 = 0$]),
        [$4x - 3y - 5 = 0$],
        [$3x + 4y - 15 = 0$],
        [$4x + 3y - 13 = 0$]
    ),
    loigiai: [
        Vectơ chỉ phương: $vec(A B) = (4 - 1; 7 - 3) = (3; 4)$.
        Suy ra một vectơ pháp tuyến là $vec(n) = (4; -3)$.
        Phương trình tổng quát đi qua $A(1; 3)$:
        $ 4(x - 1) - 3(y - 3) = 0 <=> 4x - 4 - 3y + 9 = 0 <=> 4x - 3y + 5 = 0 $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Phương trình đường thẳng theo đoạn chắn đi qua hai điểm $A(3; 0)$ và $B(0; -2)$ là],
    (
        True([$2x - 3y - 6 = 0$]),
        [$2x + 3y - 6 = 0$],
        [$3x - 2y - 6 = 0$],
        [$2x - 3y + 6 = 0$]
    ),
    loigiai: [
        Phương trình đoạn chắn:
        $ x / 3 + y / (-2) = 1 <=> 2x - 3y = 6 <=> 2x - 3y - 6 = 0 $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Điểm nào sau đây thuộc đường thẳng $d: cases(x = 2 + 3t, y = -1 - 2t)$?],
    (
        True([$P(5; -3)$]),
        [$Q(2; 1)$],
        [$M(-1; 2)$],
        [$N(3; -2)$]
    ),
    loigiai: [
        Cho $t = 1$, ta được tọa độ:
        $ cases(x = 2 + 3(1) = 5, y = -1 - 2(1) = -3) $
        Vậy điểm $P(5; -3)$ thuộc đường thẳng $d$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Hệ số góc $k$ của đường thẳng $Delta: 2x + 5y - 1 = 0$ là],
    (
        True([$k = - 2 / 5$]),
        [$k = 2 / 5$],
        [$k = - 5 / 2$],
        [$k = 5 / 2$]
    ),
    loigiai: [
        Chuyển phương trình về dạng $y = k x + m$:
        $ 5y = -2x + 1 <=> y = - 2 / 5 x + 1 / 5 $
        Hệ số góc là $k = - 2 / 5$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Trong mặt phẳng $O x y$, cho tam giác $A B C$ có $A(2; 3)$, $B(1; 1)$ và $C(5; 3)$. Phương trình đường trung tuyến $A M$ kẻ từ đỉnh $A$ là],
    (
        True([$x + y - 5 = 0$]),
        [$x - y + 1 = 0$],
        [$2x + y - 7 = 0$],
        [$x + 2y - 8 = 0$]
    ),
    loigiai: [
        Tọa độ trung điểm $M$ của cạnh $B C$:
        $ x_M = (1 + 5) / 2 = 3; quad y_M = (1 + 3) / 2 = 2 => M(3; 2) $
        Vectơ chỉ phương của đường trung tuyến $A M$:
        $ vec(A M) = (3 - 2; 2 - 3) = (1; -1) $
        Suy ra một vectơ pháp tuyến là $vec(n) = (1; 1)$.
        Phương trình tổng quát đi qua $A(2; 3)$:
        $ 1(x - 2) + 1(y - 3) = 0 <=> x + y - 5 = 0 $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Một máy bay trinh sát cất cánh từ sân bay tại vị trí $A(1; 2)$ và bay theo đường thẳng với vectơ vận tốc $vec(v) = (60; 80) text(" (km/h)")$.
Phương trình chuyển động của máy bay theo thời gian $t$ (giờ) là $cases(x = 1 + 60t, y = 2 + 80t)$.
Sau $1.5 text(" giờ")$ bay, tọa độ vị trí của máy bay là],
    (
        True([$(91; 122)$]),
        [$(90; 120)$],
        [$(61; 82)$],
        [$(100; 130)$]
    ),
    loigiai: [
        Thay $t = 1.5$ vào phương trình chuyển động:
        $ cases(x = 1 + 60(1.5) = 1 + 90 = 91, y = 2 + 80(1.5) = 2 + 120 = 122) $
        Vậy tọa độ máy bay là $(91; 122)$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Một tia sáng phát ra từ điểm $A(2; 4)$ truyền thẳng theo đường thẳng $d: x - 2y + 6 = 0$ tới gặp trục hoành $O x$ tại điểm $M$. Tọa độ của điểm $M$ là],
    (
        True([$M(-6; 0)$]),
        [$M(6; 0)$],
        [$M(0; 3)$],
        [$M(0; -3)$]
    ),
    loigiai: [
        Điểm $M$ thuộc trục hoành $O x$ nên tung độ $y = 0$.
        Thay $y = 0$ vào phương trình đường thẳng $d$:
        $ x - 2(0) + 6 = 0 <=> x + 6 = 0 <=> x = -6 $
        Vậy tọa độ điểm $M$ là $M(-6; 0)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đường thẳng trong Oxy có CeTZ)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Cho đường thẳng $d: 3x - 4y + 12 = 0$ có hình biểu diễn trên mặt phẳng tọa độ $O x y$:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-5, 0), (2, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -1), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((1.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((0.25, -0.25), [$O$])
  
  // Đường thẳng qua A(-4; 0) và B(0; 3): 3x - 4y + 12 = 0 -> y = 3/4 x + 3
  line((-4.8, -0.6), (1.5, 4.125), stroke: 1.5pt + rgb("1e40af"))
  
  // Điểm A(-4; 0)
  circle((-4, 0), radius: 2pt, fill: rgb("1e40af"))
  content((-4, -0.3), [$A(-4)$])
  
  // Điểm B(0; 3)
  circle((0, 3), radius: 2pt, fill: rgb("1e40af"))
  content((-0.4, 3), [$B(3)$])
  
  // Nhãn đường thẳng d
  content((-2.5, 1.8), [$d: 3x - 4y + 12 = 0$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường thẳng $d$ có một vectơ pháp tuyến là $vec(n) = (3; -4)$.]),
    True([Đường thẳng $d$ cắt trục hoành tại điểm $A(-4; 0)$ và cắt trục tung tại điểm $B(0; 3)$.]),
    True([Diện tích của tam giác $O A B$ tạo bởi đường thẳng $d$ và hai trục tọa độ bằng $6$ (đơn vị diện tích).]),
    [Đường thẳng $d$ đi qua gốc tọa độ $O(0; 0)$.]
  ),
  loigiai: [
    #step([Vectơ pháp tuyến])
    Từ phương trình $3x - 4y + 12 = 0$, VTPT là $vec(n) = (3; -4)$. Mệnh đề a ĐÚNG.

    #step([Giao điểm với các trục])
    - Cho $y = 0 => 3x + 12 = 0 <=> x = -4 => A(-4; 0)$.
    - Cho $x = 0 => -4y + 12 = 0 <=> y = 3 => B(0; 3)$. Mệnh đề b ĐÚNG.

    #step([Diện tích tam giác OAB])
    Tam giác $O A B$ vuông tại $O$ với hai cạnh góc vuông $O A = |-4| = 4$ và $O B = 3$.
    Diện tích: $S_(O A B) = 1 / 2 O A cdot O B = 1 / 2 cdot 4 cdot 3 = 6$ (đvdt). Mệnh đề c ĐÚNG.

    #step([Kiểm tra gốc tọa độ])
    Thay $O(0; 0)$ vào phương trình $d$: $3(0) - 4(0) + 12 = 12 != 0$.
    Đường thẳng không đi qua gốc tọa độ.
    Khẳng định đi qua $O$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình đường cao và trung trực tam giác)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có tọa độ ba đỉnh là $A(1; 4)$, $B(-2; 1)$ và $C(4; -1)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường thẳng chứa cạnh $B C$ nhận $vec(B C) = (6; -2)$ làm một vectơ chỉ phương.]),
    True([Đường cao $A H$ kẻ từ đỉnh $A$ vuông góc với cạnh $B C$ nên nhận $vec(n) = (3; -1)$ làm một vectơ pháp tuyến.]),
    True([Phương trình tổng quát của đường cao $A H$ là $3x - y + 1 = 0$.]),
    [Tọa độ trung điểm $M$ của cạnh $B C$ là $M(1; 1)$.]
  ),
  loigiai: [
    #step([Vectơ cạnh BC])
    $vec(B C) = (4 - (-2); -1 - 1) = (6; -2) = 2(3; -1)$. Mệnh đề a ĐÚNG.

    #step([Vectơ pháp tuyến của đường cao AH])
    Đường cao $A H perp B C$ nên $A H$ nhận $vec(B C)$ làm vectơ pháp tuyến.
    Chọn $vec(n) = 1 / 2 vec(B C) = (3; -1)$. Mệnh đề b ĐÚNG.

    #step([Phương trình đường cao AH])
    Đi qua $A(1; 4)$ và có VTPT $vec(n) = (3; -1)$:
    $ 3(x - 1) - 1(y - 4) = 0 <=> 3x - 3 - y + 4 = 0 <=> 3x - y + 1 = 0 $
    Mệnh đề c ĐÚNG.

    #step([Trung điểm M của BC])
    $x_M = (-2 + 4) / 2 = 1$; $y_M = (1 + (-1)) / 2 = 0$.
    Tọa độ đúng là $M(1; 0)$ chứ không phải $M(1; 1)$.
    Khẳng định $M(1; 1)$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Đường bay Flycam giao hàng)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Một trung tâm logistics thử nghiệm hai thiết bị bay không người lái (Drone) giao hàng trong thành phố (mỗi đơn vị trên hệ trục tọa độ tương ứng với $1 text(" km")$).
- Drone $1$ bay thẳng đều từ trạm phân phối trung tâm $O(0; 0)$ tới khu chung cư $A(6; 8)$ theo đường bay $d_1$.
- Drone $2$ bay từ trạm dự phòng $B(0; 10)$ tới trạm sạc $C(10; 0)$ theo đường bay $d_2$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình đường thẳng của quỹ đạo bay $d_1$ là $4x - 3y = 0$.]),
    True([Phương trình đường thẳng của quỹ đạo bay $d_2$ là $x + y - 10 = 0$.]),
    True([Hai đường bay $d_1$ và $d_2$ giao nhau tại điểm có tọa độ $M(30 / 7; 40 / 7)$.]),
    [Quãng đường bay của Drone $1$ từ trạm $O$ tới khu chung cư $A$ bằng $12 text(" km")$.]
  ),
  loigiai: [
    #step([Đường bay d1])
    VTCP: $vec(O A) = (6; 8) = 2(3; 4)$. Suy ra VTPT $vec(n_1) = (4; -3)$.
    Đi qua $O(0; 0)$ nên phương trình là $4x - 3y = 0$. Mệnh đề a ĐÚNG.

    #step([Đường bay d2])
    Đi qua $B(0; 10)$ và $C(10; 0)$.
    Phương trình đoạn chắn: $x / 10 + y / 10 = 1 <=> x + y - 10 = 0$. Mệnh đề b ĐÚNG.

    #step([Giao điểm hai quỹ đạo bay])
    Giải hệ phương trình:
    $ cases(4x - 3y = 0, x + y = 10) <=> cases(x = 3 / 4 y, 3 / 4 y + y = 10) <=> cases(7 / 4 y = 10 => y = 40 / 7, x = 30 / 7) $
    Tọa độ giao điểm là $M(30 / 7; 40 / 7)$. Mệnh đề c ĐÚNG.

    #step([Độ dài quãng đường OA])
    $O A = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10 text(" km")$ (chứ không phải $12 text(" km")$).
    Khẳng định quãng đường bằng $12 text(" km")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Họ đường thẳng phụ thuộc tham số m)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Cho họ đường thẳng $d_m: (m - 1)x + (2m + 1)y - 4m + 1 = 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 1$, đường thẳng có phương trình là $y = 1$.]),
    True([Khi $m = - 1 / 2$, đường thẳng có phương trình là $x = 2$.]),
    True([Họ đường thẳng $d_m$ luôn đi qua điểm cố định $I(2; 1)$ với mọi giá trị của tham số $m$.]),
    [Có đúng hai giá trị phân biệt của tham số $m$ để đường thẳng $d_m$ đi qua gốc tọa độ $O(0; 0)$.]
  ),
  loigiai: [
    #step([Khi m = 1])
    Thay $m = 1$: $(1 - 1)x + (2 + 1)y - 4(1) + 1 = 0 <=> 3y - 3 = 0 <=> y = 1$. Mệnh đề a ĐÚNG.

    #step([Khi m = -1/2])
    Thay $m = -1/2$: $(-1/2 - 1)x + 0y - 4(-1/2) + 1 = 0 <=> - 3 / 2 x + 3 = 0 <=> x = 2$. Mệnh đề b ĐÚNG.

    #step([Tìm điểm cố định])
    Khai triển phương trình theo tham số $m$:
    $ m(x + 2y - 4) + (-x + y + 1) = 0 $
    Đường thẳng đi qua điểm cố định với mọi $m$ khi và chỉ khi:
    $ cases(x + 2y - 4 = 0, -x + y + 1 = 0) <=> cases(x + 2y = 4, x - y = 1) <=> cases(3y = 3 => y = 1, x = 2) $
    Điểm cố định là $I(2; 1)$. Mệnh đề c ĐÚNG.

    #step([Đi qua gốc tọa độ O(0; 0)])
    Thay $(0; 0)$ vào phương trình:
    $ -4m + 1 = 0 <=> m = 1 / 4 $
    Chỉ có duy nhất một giá trị $m = 1/4$ thỏa mãn.
    Khẳng định có đúng hai giá trị là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tìm tung độ VTPT)
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Cho đường thẳng $d: 5x - 12y + 7 = 0$. Một vectơ pháp tuyến của $d$ có dạng $vec(n) = (10; b)$. Tìm giá trị của $b$.],
    [-24],
    loigiai: [
        #step([Xác định vectơ pháp tuyến])
        Đường thẳng $d$ có VTPT cơ sở là $vec(n_0) = (5; -12)$.
        
        #step([Tìm hệ số tỉ lệ])
        Vectơ $vec(n) = (10; b) = 2 vec(n_0) = 2(5; -12) = (10; -24)$.
        Vậy $b = -24$.
    ]
)

// TLN 2 (Hệ số tự do đường cao)
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Trong mặt phẳng $O x y$, cho tam giác $A B C$ có $A(1; 3)$, $B(-1; 1)$ và $C(5; -1)$.
Đường cao kẻ từ đỉnh $A$ có phương trình tổng quát dạng $3x - y + c = 0$.
Tìm giá trị của hệ số $c$.],
    [0],
    loigiai: [
        #step([Tìm vectơ pháp tuyến])
        $vec(B C) = (5 - (-1); -1 - 1) = (6; -2) = 2(3; -1)$.
        Đường cao $A H perp B C$ nên nhận $vec(n) = (3; -1)$ làm VTPT.
        
        #step([Lập phương trình và tìm c])
        Đường cao đi qua $A(1; 3)$:
        $ 3(x - 1) - 1(y - 3) = 0 <=> 3x - 3 - y + 3 = 0 <=> 3x - y = 0 $
        Đối chiếu với dạng $3x - y + c = 0$, ta có $c = 0$.
    ]
)

// TLN 3 (Diện tích tam giác tạo bởi đường thẳng và hai trục)
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Tìm diện tích của tam giác tạo bởi đường thẳng $d: 3x + 4y - 24 = 0$ và hai trục tọa độ $O x, O y$.],
    [24],
    loigiai: [
        #step([Tìm giao điểm với hai trục tọa độ])
        - Cho $y = 0 => 3x - 24 = 0 <=> x = 8 => A(8; 0)$.
        - Cho $x = 0 => 4y - 24 = 0 <=> y = 6 => B(0; 6)$.
        
        #step([Tính diện tích tam giác vuông OAB])
        $ S = 1 / 2 O A cdot O B = 1 / 2 cdot 8 cdot 6 = 24 $
    ]
)

// TLN 4 (Quãng đường bay drone)
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Trong bài toán thử nghiệm máy bay không người lái, khoảng cách bay thẳng từ trạm trung tâm $O(0; 0)$ đến khu chung cư $A(6; 8)$ bằng bao nhiêu kilômét?],
    [10],
    loigiai: [
        #step([Tính độ dài đoạn thẳng OA])
        $ O A = sqrt((6 - 0)^2 + (8 - 0)^2) = sqrt(36 + 64) = sqrt(100) = 10 text(" km") $
    ]
)

// TLN 5 (Tìm m để đường thẳng đi qua điểm)
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Cho đường thẳng $d: (m + 2)x + (2m - 1)y - 13 = 0$ (với $m$ là tham số).
Tìm giá trị của $m$ để đường thẳng $d$ đi qua điểm $M(1; 1)$.],
    [4],
    loigiai: [
        #step([Thay tọa độ điểm M vào phương trình đường thẳng])
        Thay $x = 1, y = 1$ vào phương trình $d$:
        $ (m + 2)(1) + (2m - 1)(1) - 13 = 0 $
        $ <=> m + 2 + 2m - 1 - 13 = 0 <=> 3m - 12 = 0 <=> 3m = 12 <=> m = 4 $
    ]
)

// TLN 6 (Hoành độ điểm cố định)
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 155], back-to: "sec-exercise-hub",[Họ đường thẳng $d_m: m(x - 3) + 2(y + 1) = 0$ luôn đi qua một điểm cố định $M(x_0; y_0)$ với mọi giá trị của tham số $m$. Tìm giá trị của hoành độ $x_0$.],
    [3],
    loigiai: [
        #step([Xác định điều kiện điểm cố định])
        Phương trình có dạng: $m(x_0 - 3) + 2(y_0 + 1) = 0$ đúng với mọi $m$ khi và chỉ khi:
        $ cases(x_0 - 3 = 0, 2(y_0 + 1) = 0) <=> cases(x_0 = 3, y_0 = -1) $
        Vậy hoành độ điểm cố định là $x_0 = 3$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 19: PHƯƠNG TRÌNH ĐƯỜNG THẲNG (ĐỀ SỐ 21A - CƠ BẢN ĐẾN VẬN DỤNG)!]      #v(0.6em)
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
