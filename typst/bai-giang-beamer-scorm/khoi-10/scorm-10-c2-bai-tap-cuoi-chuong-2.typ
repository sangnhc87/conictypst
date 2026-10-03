#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương II],
  subtitle: [TOÁN 10 — CHƯƠNG II: BẤT PHƯƠNG TRÌNH & HỆ BPT BẬC NHẤT HAI ẨN],
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
// MỤC LỤC BÀI TỔNG ÔN
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG TỔNG ÔN CHƯƠNG II])

// ════════════════════════════════════════════════
// PHẦN I: MA TRẬN HỆ THỐNG KIẾN THỨC
// ════════════════════════════════════════════════
#lt-section-link("sec-ma-tran-c2", "🗺️", [I. Ma trận Hệ thống Kiến thức])

#lt-slide-back(title: "🗺️ Bảng Đối Chiếu: BPT Đơn vs Hệ BPT")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. BPT BẬC NHẤT HAI ẨN]
        #v(0.3em)
        - Dạng chuẩn: $a x + b y + c <= 0$ ($a^2 + b^2 > 0$).
        - Miền nghiệm: Là một *nửa mặt phẳng* có bờ là đường thẳng $d: a x + b y + c = 0$.
        - Biên: Nét liền nếu có dấu bằng ($<=, >=$); nét đứt nếu dấu ngặt ($<, >$).
        - Cách tìm: Thử điểm $O(0; 0)$ hoặc điểm thuận tiện.
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 10pt, radius: 8pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#9333ea"), size: 12pt)[2. HỆ BPT BẬC NHẤT HAI ẨN]
        #v(0.3em)
        - Dạng chuẩn: Hệ gồm $2$ hay nhiều BPT bậc nhất hai ẩn.
        - Miền nghiệm: Là *phần giao* của tất cả các nửa mặt phẳng nghiệm thành phần.
        - Hình học: Thường là một *miền đa giác lồi* (tam giác, tứ giác) hoặc miền mở.
        - Ứng dụng: Bài toán quy hoạch tuyến tính thực tế.
      ]
    ]
  )
]

#lt-slide-back(title: "💎 Quy Trình 4 Bước Tối Ưu Hóa Tuyến Tính")[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 8pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[Bước 1: Mô hình hóa]
        #v(0.25em)
        #text(size: 10pt)[
          - Đặt ẩn $x, y$ kèm đơn vị và điều kiện.
          - Thiết lập hệ bất phương trình ràng buộc.
          - Xác định hàm mục tiêu $F(x, y) = a x + b y$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 11pt)[Bước 2: Vẽ Miền nghiệm]
        #v(0.25em)
        #text(size: 10pt)[
          - Vẽ các đường thẳng bờ trên $O x y$.
          - Dùng điểm thử gạch bỏ phần không thỏa mãn.
          - Xác định miền đa giác lồi nghiệm.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 11pt)[Bước 3: Tọa độ Đỉnh]
        #v(0.25em)
        #text(size: 10pt)[
          - Giải các hệ phương trình tọa độ giao điểm.
          - Tìm chính xác tọa độ tất cả các đỉnh $A, B, C, dots$ của đa giác.
        ]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 11pt)[Bước 4: Tính & Kết luận]
        #v(0.25em)
        #text(size: 10pt)[
          - Tính $F$ tại từng đỉnh của đa giác.
          - Chọn giá trị lớn nhất / nhỏ nhất.
          - Trả lời đúng yêu cầu thực tế đề bài.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: 3 BẪY TƯ DUY KINH ĐIỂN
// ════════════════════════════════════════════════
#lt-section-link("sec-bay-tu-duy-c2", "⚠️", [II. 3 Bẫy Tư Duy & Sai Lầm Phổ Biến])

#lt-slide-back(title: "⚠️ 3 Bẫy Điển Hình Học Sinh Thường Mắc")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[Bẫy 1: Nét Liền vs Nét Đứt]
        #v(0.3em)
        #text(size: 10.5pt)[
          - Dấu $<, >$: Đường bờ *không thuộc nghiệm*, phải vẽ bằng *nét đứt*.
          - Dấu $<=, >=$: Kể cả đường bờ, vẽ *nét liền*.
          - Học sinh thường quên phân biệt khi làm bài trắc nghiệm đồ thị!
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#d97706"), size: 12pt)[Bẫy 2: Thử Gốc O Tùy Tiện]
        #v(0.3em)
        #text(size: 10.5pt)[
          - Khi đường bờ $d$ *đi qua gốc* $O(0; 0)$ (dạng $a x + b y = 0$), không được chọn $O$ làm điểm thử!
          - Phải chọn điểm khác không nằm trên $d$, ví dụ $(1; 0)$ hoặc $(0; 1)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[Bẫy 3: Quên Ẩn Không Âm]
        #v(0.3em)
        #text(size: 10.5pt)[
          - Bài toán thực tế (số lượng sản phẩm, số xe, thời gian) luôn có điều kiện ẩn không âm: $x >= 0, y >= 0$.
          - Quên điều kiện này sẽ dẫn tới miền nghiệm sai hoặc không bị chặn!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM TƯƠNG TÁC
// ════════════════════════════════════════════════
#lt-section-link("sec-thuc-chien-tn", "🎯", [III. Bài Tập Trắc Nghiệm Tương Tác])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — BÀI TẬP CUỐI CHƯƠNG II],
  questions: (
    (num: 1, type: "TN", desc: [Nhận biết BPT bậc nhất hai ẩn]),
    (num: 2, type: "TN", desc: [Kiểm tra nghiệm của BPT]),
    (num: 3, type: "TN", desc: [Biểu diễn miền nghiệm BPT]),
    (num: 4, type: "TN", desc: [Đọc đồ thị miền nghiệm]),
    (num: 5, type: "TN", desc: [Nhận biết Hệ BPT]),
    (num: 6, type: "TN", desc: [Kiểm tra nghiệm của hệ]),
    (num: 7, type: "TN", desc: [Đọc đồ thị hệ BPT (phần không gạch)]),
    (num: 8, type: "TN", desc: [Mô hình hóa bài toán thực tế (1)]),
    (num: 9, type: "TN", desc: [Mô hình hóa bài toán thực tế (2)]),
    (num: 10, type: "TN", desc: [Tìm Max F trên đa giác]),
    (num: 11, type: "TN", desc: [Tìm Min F trên đa giác]),
    (num: 12, type: "TN", desc: [Bài toán Tối đa hóa lợi nhuận]),
    (num: 13, type: "DS", desc: [Tính chất BPT & Hệ BPT]),
    (num: 14, type: "DS", desc: [Xét hệ BPT cụ thể]),
    (num: 15, type: "DS", desc: [Đánh giá các bước giải tối ưu]),
    (num: 16, type: "DS", desc: [Bài toán lập kế hoạch sản xuất]),
    (num: 17, type: "TLN", desc: [Max F từ đồ thị]),
    (num: 18, type: "TLN", desc: [Min F với hệ đã cho]),
    (num: 19, type: "TLN", desc: [Tọa độ điểm tối ưu]),
    (num: 20, type: "TLN", desc: [Bài toán chi phí thấp nhất]),
    (num: 21, type: "TLN", desc: [Lợi nhuận lớn nhất]),
    (num: 22, type: "TLN", desc: [Hệ BPT đối xứng]),
  ),
  back-to: "lec-toc-main"
)

// TN 1-12
#lt-tn(
  [Bất phương trình nào sau đây là bất phương trình bậc nhất hai ẩn?],
  (
    [$2x^2 + 3y > 0$],
    [$x - 3y + 2 <= 0$],
    [$x + y^2 >= 1$],
    [$x y + 2x < 3$],
  ),
  correct: 1,
  num: 1,
  de: "Nhận biết BPT bậc nhất hai ẩn",
  loigiai: [
    Bất phương trình bậc nhất hai ẩn có dạng $a x + b y + c < 0$ (hoặc $>, <=, >=$) với $a, b$ không đồng thời bằng 0 và $x, y$ mang bậc 1.\
    #step[Phân tích các đáp án:]
    - A sai vì chứa $x^2$ (bậc 2).
    - B đúng vì dạng $x - 3y + 2 <= 0$ hoàn toàn hợp lệ ($a=1, b=-3, c=2$).
    - C sai vì chứa $y^2$ (bậc 2).
    - D sai vì chứa tích $x y$ (bậc 2).
  ]
)

#lt-tn(
  [Cặp số nào sau đây là nghiệm của bất phương trình $2x - y + 1 > 0$?],
  (
    [$(-1; 2)$],
    [$(0; 2)$],
    [$(1; 4)$],
    [$(2; 1)$],
  ),
  correct: 3,
  num: 2,
  de: "Kiểm tra nghiệm của BPT",
  loigiai: [
    Thay lần lượt tọa độ vào biểu thức $f(x, y) = 2x - y + 1$:\
    - Thay $(-1; 2)$: $2(-1) - 2 + 1 = -3 > 0$ (Sai)\
    - Thay $(0; 2)$: $2(0) - 2 + 1 = -1 > 0$ (Sai)\
    - Thay $(1; 4)$: $2(1) - 4 + 1 = -1 > 0$ (Sai)\
    - Thay $(2; 1)$: $2(2) - 1 + 1 = 4 > 0$ (Đúng)\
    #step[Kết luận:] Điểm $(2; 1)$ thỏa mãn BPT.
  ]
)

#lt-tn(
  [Miền nghiệm của bất phương trình $x + 2y >= 4$ là nửa mặt phẳng bờ là đường thẳng $d: x + 2y = 4$ và:],
  (
    [Chứa gốc tọa độ $O$, không tính bờ $d$.],
    [Không chứa gốc tọa độ $O$, không tính bờ $d$.],
    [Chứa gốc tọa độ $O$, kể cả bờ $d$.],
    [Không chứa gốc tọa độ $O$, kể cả bờ $d$.],
  ),
  correct: 3,
  num: 3,
  de: "Biểu diễn miền nghiệm BPT",
  loigiai: [
    - Do BPT có dấu $>=$ nên miền nghiệm *có chứa bờ $d$* (loại A, B).\
    - Xét điểm thử $O(0;0) in.not d$: Thay vào BPT ta được $0 + 2(0) >= 4 <=> 0 >= 4$ (Sai).\
    #step[Kết luận:] Miền nghiệm *không chứa gốc tọa độ $O$* và *kể cả bờ $d$*. Do đó D là đáp án đúng.
  ]
)

#lt-tn(
  [Phần không gạch chéo (kể cả bờ) trong hình bên dưới là biểu diễn miền nghiệm của bất phương trình nào sau đây?
  #align(center)[
    #context cetz.canvas({
      import cetz.draw: *
      let sc = 0.8
      // Grid
      for x in range(-2, 4) { line((x*sc, -1.2*sc), (x*sc, 3.2*sc), stroke: 0.2pt + luma(200)) }
      for y in range(-1, 4) { line((-1.5*sc, y*sc), (3.5*sc, y*sc), stroke: 0.2pt + luma(200)) }
      // Line x + y = 2 -> (0,2) and (2,0)
      for k in range(-1, 10) {
        let p1 = (-0.5*sc + k*0.35, 3.2*sc)
        let p2 = (3.5*sc, -0.8*sc + k*0.35)
        line(p1, p2, stroke: 0.4pt + luma(150))
      }
      line((-0.5*sc, 2.5*sc), (3.5*sc, -1.5*sc), stroke: 1.5pt + rgb("#d81b60"))
      // Axes
      line((-1.5*sc, 0), (3.5*sc, 0), mark: (end: "stealth"))
      content((3.8*sc, 0), [$x$])
      line((0, -1.5*sc), (0, 3.5*sc), mark: (end: "stealth"))
      content((0, 3.8*sc), [$y$])
      content((-0.3*sc, -0.3*sc), [$O$])
      content((2*sc, -0.3*sc), [$2$])
      content((-0.3*sc, 2*sc), [$2$])
    })
  ]
  ],
  (
    [$x + y <= 2$],
    [$x + y >= 2$],
    [$x - y <= 2$],
    [$x - y >= 2$],
  ),
  correct: 0,
  num: 4,
  de: "Đọc đồ thị miền nghiệm",
  loigiai: [
    #step[Bước 1: Xác định phương trình bờ $d$]
    Đường thẳng cắt $O x$ tại $(2;0)$ và $O y$ tại $(0;2)$.\
    Phương trình theo đoạn chắn: $x/2 + y/2 = 1 <=> x + y = 2$.\
    #step[Bước 2: Xác định miền nghiệm]
    Phần không gạch chứa gốc tọa độ $O(0;0)$.\
    Thay $O(0;0)$ vào các BPT ở đáp án:
    - $x + y <= 2 => 0 <= 2$ (Đúng).
    - $x + y >= 2 => 0 >= 2$ (Sai).
    Vậy miền nghiệm là $x + y <= 2$.
  ]
)

#lt-tn(
  [Hệ nào sau đây là hệ bất phương trình bậc nhất hai ẩn?],
  (
    [$cases(x^2 + y <= 1, 2x - y > 0)$],
    [$cases(x + y <= 2, x y >= 0)$],
    [$cases(2x - y > 1, x + 3y <= 4)$],
    [$cases(x + y + z <= 1, 2x - y >= 0)$],
  ),
  correct: 2,
  num: 5,
  de: "Nhận biết Hệ BPT",
  loigiai: [
    Hệ BPT bậc nhất hai ẩn phải gồm các BPT bậc nhất (bậc 1) và chỉ có 2 ẩn (ví dụ $x, y$).\
    - A sai do có $x^2$ (bậc 2).\
    - B sai do có $x y$ (bậc 2).\
    - D sai do có 3 ẩn $x, y, z$.\
    - C đúng vì cả hai BPT đều là bậc nhất hai ẩn.
  ]
)

#lt-tn(
  [Điểm $M(-1; 2)$ thuộc miền nghiệm của hệ bất phương trình nào sau đây?],
  (
    [$cases(x - y > 0, 2x + y <= 1)$],
    [$cases(x + y >= 0, x - 2y < -3)$],
    [$cases(2x - y < -3, x + y > 2)$],
    [$cases(x - y <= -3, x + 2y >= 0)$],
  ),
  correct: 3,
  num: 6,
  de: "Kiểm tra nghiệm của hệ",
  loigiai: [
    Ta thay tọa độ $M(-1; 2)$ vào từng hệ:
    - Xét đáp án D: $cases((-1) - 2 <= -3, (-1) + 2(2) >= 0) <=> cases(-3 <= -3 " (đúng)", 3 >= 0 " (đúng)")$\
    Do đó điểm $M$ thỏa mãn hệ D. Các đáp án khác đều có ít nhất một BPT sai.
  ]
)

#lt-tn(
  [Phần không bị gạch trong hình vẽ dưới đây biểu diễn miền nghiệm của hệ bất phương trình nào?
  #align(center)[
    #context cetz.canvas({
      import cetz.draw: *
      let sc = 0.8
      // Axes
      line((-1*sc, 0), (4*sc, 0), mark: (end: "stealth"))
      content((4.3*sc, 0), [$x$])
      line((0, -1*sc), (0, 4*sc), mark: (end: "stealth"))
      content((0, 4.3*sc), [$y$])
      content((-0.3*sc, -0.3*sc), [$O$])
      
      // Lines: x=0 (y-axis), y=0 (x-axis) -> x>=0, y>=0 (quadrant 1)
      // Line: x+y = 3
      line((-1*sc, 4*sc), (4*sc, -1*sc), stroke: 1.5pt + rgb("#0ea5e9"))
      content((3*sc, -0.3*sc), [$3$])
      content((-0.3*sc, 3*sc), [$3$])
      
      // Shadings
      // x < 0
      for k in range(-3, 15) { line((0, k*0.3*sc), (-1*sc, k*0.3*sc - 1*sc), stroke: 0.3pt+gray) }
      // y < 0
      for k in range(-3, 15) { line((k*0.3*sc, 0), (k*0.3*sc - 1*sc, -1*sc), stroke: 0.3pt+gray) }
      // x+y > 3
      for k in range(0, 15) { line((3*sc + k*0.3*sc, 0), (k*0.3*sc, 3*sc), stroke: 0.3pt+gray) }
    })
  ]
  ],
  (
    [$cases(x >= 0, y >= 0, x + y >= 3)$],
    [$cases(x >= 0, y >= 0, x + y <= 3)$],
    [$cases(x <= 0, y <= 0, x + y <= 3)$],
    [$cases(x >= 0, y >= 0, x - y <= 3)$],
  ),
  correct: 1,
  num: 7,
  de: "Đọc đồ thị hệ BPT",
  loigiai: [
    Từ hình vẽ ta thấy phần không bị gạch là một tam giác nằm trong góc phần tư thứ nhất.\
    - Giới hạn bởi trục $O y$ (gạch bên trái) $=> x >= 0$.\
    - Giới hạn bởi trục $O x$ (gạch bên dưới) $=> y >= 0$.\
    - Đường chéo đi qua $(3;0)$ và $(0;3)$ có phương trình $x + y = 3$. Miền nghiệm chứa $O(0;0)$ nên $x + y <= 3$.\
    #step[Kết luận:] Hệ cần tìm là $cases(x >= 0, y >= 0, x + y <= 3)$.
  ]
)

#lt-tn(
  [Bạn An mua $x$ quyển vở (giá 10k/quyển) và $y$ chiếc bút (giá 5k/chiếc). Biết An có 50k, hệ bất phương trình nào biểu diễn điều kiện của $x$ và $y$? (Giả sử $x, y >= 0$)],
  (
    [$10x + 5y <= 50$],
    [$10x + 5y >= 50$],
    [$x + y <= 50$],
    [$5x + 10y <= 50$],
  ),
  correct: 0,
  num: 8,
  de: "Mô hình hóa bài toán thực tế (1)",
  loigiai: [
    #step[Bước 1: Lập bảng tóm tắt]
    #align(center)[
      #table(
        columns: 4,
        fill: (col, row) => if row == 0 { luma(230) } else { none },
        [Mặt hàng], [Vở ($x$ quyển)], [Bút ($y$ chiếc)], [Giới hạn],
        [Giá tiền (k)], [10], [5], [50]
      )
    ]
    #step[Bước 2: Phân tích điều kiện]
    - Số tiền mua $x$ quyển vở là: $10x$ (k).
    - Số tiền mua $y$ chiếc bút là: $5y$ (k).
    - Vì An chỉ có tối đa 50k nên tổng số tiền không được vượt quá 50k.
    #step[Kết luận:] BPT là $10x + 5y <= 50$.
  ]
)

#lt-tn(
  [Một xưởng sản xuất bàn và ghế. Gọi $x, y$ lần lượt là số bàn và ghế. Biết thời gian đóng bàn là 3 giờ, đóng ghế là 1 giờ. Xưởng chỉ có 20 giờ làm việc mỗi ngày. BPT thể hiện điều kiện này là:],
  (
    [$x + 3y <= 20$],
    [$3x + y <= 20$],
    [$3x + y >= 20$],
    [$x + y <= 20$],
  ),
  correct: 1,
  num: 9,
  de: "Mô hình hóa bài toán thực tế (2)",
  loigiai: [
    #step[Bước 1: Lập bảng tóm tắt]
    #align(center)[
      #table(
        columns: 4,
        fill: (col, row) => if row == 0 { luma(230) } else { none },
        [Sản phẩm], [Bàn ($x$ cái)], [Ghế ($y$ cái)], [Giới hạn],
        [Thời gian (giờ)], [3], [1], [20]
      )
    ]
    #step[Bước 2: Phân tích điều kiện]
    - Thời gian đóng $x$ cái bàn là $3x$ giờ.
    - Thời gian đóng $y$ cái ghế là $1y$ giờ.
    - Tổng thời gian là $3x + y$.
    - Quỹ thời gian tối đa mỗi ngày là 20 giờ.
    #step[Kết luận:] Ta có BPT: $3x + y <= 20$.
  ]
)

#lt-tn(
  [Cho miền nghiệm đa giác $O A B C$ với $O(0;0), A(0; 4), B(3; 3), C(5; 0)$. Giá trị lớn nhất của hàm mục tiêu $F(x; y) = 2x + 3y$ trên miền nghiệm là:],
  (
    [$12$],
    [$15$],
    [$10$],
    [$16$],
  ),
  correct: 1,
  num: 10,
  de: "Tìm Max F trên đa giác",
  loigiai: [
    Ta tính giá trị của $F(x; y) = 2x + 3y$ tại các đỉnh của đa giác:
    - Tại $O(0; 0)$: $F = 2(0) + 3(0) = 0$.
    - Tại $A(0; 4)$: $F = 2(0) + 3(4) = 12$.
    - Tại $B(3; 3)$: $F = 2(3) + 3(3) = 6 + 9 = 15$.
    - Tại $C(5; 0)$: $F = 2(5) + 3(0) = 10$.
    #step[Kết luận:] Giá trị lớn nhất là $15$ đạt tại đỉnh $B(3; 3)$.
  ]
)

#lt-tn(
  [Tìm giá trị nhỏ nhất của $F(x;y) = x - y$ trên miền tam giác $A(1; 1), B(4; 5), C(5; 2)$.],
  (
    [$0$],
    [$-1$],
    [$3$],
    [$2$],
  ),
  correct: 1,
  num: 11,
  de: "Tìm Min F trên đa giác",
  loigiai: [
    Tính $F(x; y) = x - y$ tại 3 đỉnh:
    - Tại $A(1; 1)$: $F = 1 - 1 = 0$.
    - Tại $B(4; 5)$: $F = 4 - 5 = -1$.
    - Tại $C(5; 2)$: $F = 5 - 2 = 3$.
    #step[Kết luận:] Giá trị nhỏ nhất là $-1$ đạt tại $B(4; 5)$.
  ]
)

#lt-tn(
  [Một công ty thu lợi nhuận $2$ triệu từ sản phẩm I và $3$ triệu từ sản phẩm II. Giả sử số lượng sản phẩm $x, y$ (tương ứng) phải thỏa mãn miền nghiệm giới hạn bởi các đỉnh $O(0;0), A(0;5), B(4;3), C(6;0)$. Lợi nhuận lớn nhất công ty có thể đạt được là:],
  (
    [$17$ triệu],
    [$15$ triệu],
    [$12$ triệu],
    [$18$ triệu],
  ),
  correct: 0,
  num: 12,
  de: "Bài toán Tối đa hóa lợi nhuận",
  loigiai: [
    #step[Bước 1: Thiết lập hàm mục tiêu]
    Lợi nhuận thu được từ $x$ sản phẩm I và $y$ sản phẩm II là:
    $ F(x; y) = 2x + 3y $
    
    #step[Bước 2: Đánh giá tại các đỉnh của miền nghiệm]
    Ta tính giá trị của $F(x; y)$ tại từng đỉnh của đa giác giới hạn miền nghiệm:
    - Tại đỉnh $O(0; 0): F = 2(0) + 3(0) = 0$
    - Tại đỉnh $A(0; 5): F = 2(0) + 3(5) = 15$
    - Tại đỉnh $B(4; 3): F = 2(4) + 3(3) = 8 + 9 = 17$
    - Tại đỉnh $C(6; 0): F = 2(6) + 3(0) = 12$
    
    #step[Kết luận:]
    Giá trị lớn nhất của $F(x; y)$ là $17$ triệu, đạt được tại đỉnh $B(4; 3)$.
  ]
)

// DS 13-16
#lt-ds(
  [Xét các mệnh đề sau về bất phương trình và hệ bất phương trình bậc nhất hai ẩn:],
  (
    [Miền nghiệm của $2x - y > 0$ là một nửa mặt phẳng không chứa gốc tọa độ $O$.],
    [Hệ BPT gồm 2 BPT luôn luôn có miền nghiệm là một góc (không bị chặn).],
    [Nếu điểm $M(x_0; y_0)$ thuộc miền nghiệm của hệ BPT thì $M$ phải thỏa mãn tất cả BPT trong hệ.],
    [Bài toán tối ưu hóa tuyến tính luôn đạt GTLN tại một trong các đỉnh của đa giác miền nghiệm.],
  ),
  correct: (2, 3),
  num: 13,
  de: "Tính chất BPT & Hệ BPT",
  loigiai: [
    - Mệnh đề a) Sai. Bờ $2x - y = 0$ đi qua gốc tọa độ, ta không thể dùng $O(0;0)$ làm điểm thử và kết luận chứa hay không chứa $O$. (Thực chất $O$ nằm TRÊN bờ).
    - Mệnh đề b) Sai. Có thể 2 nửa mặt phẳng giao nhau tạo ra miền rỗng, hoặc 2 nửa mặt phẳng song song nghịch chiều giao nhau bằng rỗng, hoặc tạo ra dải song song.
    - Mệnh đề c) Đúng theo định nghĩa.
    - Mệnh đề d) Đúng (Định lý cơ bản của QH Tuyến tính).
  ]
)

#lt-ds(
  [Cho hệ bất phương trình: $cases(x + y <= 4, x - y >= -1, x >= 0, y >= 0)$. Xét tính đúng sai của các mệnh đề:],
  (
    [Hệ này có miền nghiệm nằm hoàn toàn trong góc phần tư thứ nhất.],
    [Điểm $P(2; 2)$ thuộc miền nghiệm của hệ.],
    [Miền nghiệm của hệ là một đa giác lồi.],
    [Giá trị lớn nhất của biểu thức $F = 3x - y$ trên miền nghiệm là $12$.],
  ),
  correct: (0, 1, 2, 3),
  num: 14,
  de: "Xét hệ BPT cụ thể",
  loigiai: [
    - Mệnh đề a) Đúng. Do điều kiện $x >= 0, y >= 0$.
    - Mệnh đề b) Đúng. Thay $(2;2)$ vào: $2+2=4 <= 4$ (Đúng), $2-2=0 >= -1$ (Đúng), $2>=0, 2>=0$ (Đúng).
    - Mệnh đề c) Đúng. Hệ BPT tuyến tính luôn tạo ra miền đa giác lồi.
    - Mệnh đề d) Tính $F = 3x - y$ tại các đỉnh: 
      + $(0;0) => 0$
      + $(0;1) => -1$
      + $(1.5; 2.5) => 3(1.5) - 2.5 = 2$
      + $(4; 0) => 3(4) - 0 = 12$
      Vậy GTLN là 12. Mệnh đề d) Đúng.
  ]
)

#lt-ds(
  [Để tìm giá trị lớn nhất của biểu thức $L = 5x + 4y$ với điều kiện $x, y$ thỏa mãn một đa giác lồi, học sinh giải theo các bước sau:],
  (
    [Bước 1: Vẽ đồ thị các đường thẳng để xác định đa giác miền nghiệm.],
    [Bước 2: Tìm tọa độ tất cả các đỉnh của đa giác đó.],
    [Bước 3: Lấy tọa độ trung điểm của đa giác thay vào $L$ để tìm GTLN.],
    [Bước 4: Điểm nào cho $L$ lớn nhất thì đó là đáp số.],
  ),
  correct: (0, 1, 3),
  num: 15,
  de: "Đánh giá các bước giải tối ưu",
  loigiai: [
    - a) Đúng. Bước đầu tiên phải vẽ được miền nghiệm.
    - b) Đúng. Phải tìm được tọa độ đỉnh.
    - c) Sai. Giá trị tối ưu (Max/Min) luôn đạt được tại đỉnh (cực biên), không bao giờ nằm ở trung điểm bên trong đa giác.
    - d) Đúng. Thay các đỉnh vào và so sánh.
  ]
)

#lt-ds(
  [Một hộ gia đình dự định trồng lúa và ngô trên diện tích $8$ ha. Để trồng $1$ ha lúa cần 20 ngày công và thu $30$ triệu. Để trồng $1$ ha ngô cần 30 ngày công và thu $40$ triệu. Hộ chỉ có tối đa 180 ngày công. Gọi $x, y$ là diện tích trồng lúa và ngô (ha).],
  (
    [Hệ điều kiện của bài toán là $x+y <= 8$ và $20x + 30y <= 180$.],
    [Diện tích không thể âm nên bắt buộc phải có điều kiện $x >= 0, y >= 0$.],
    [Hàm mục tiêu tính tổng thu nhập là $F = 20x + 30y$.],
    [Nếu trồng 6 ha lúa và 2 ha ngô, tổng thu nhập là 260 triệu và vẫn thỏa mãn điều kiện.],
  ),
  correct: (0, 1, 3),
  num: 16,
  de: "Bài toán lập kế hoạch sản xuất",
  loigiai: [
    #step[Bước 1: Lập bảng tóm tắt]
    #align(center)[
      #table(
        columns: 4,
        fill: (col, row) => if row == 0 { luma(230) } else { none },
        [Tiêu chí], [Lúa ($x$ ha)], [Ngô ($y$ ha)], [Khả năng (Tối đa)],
        [Diện tích (ha)], [1], [1], [8],
        [Ngày công], [20], [30], [180],
        [Thu nhập (triệu)], [30], [40], [-]
      )
    ]
    #step[Bước 2: Kiểm tra từng mệnh đề]
    - a) Đúng. Diện tích không vượt quá 8 ha $=> x+y <= 8$. Ngày công không vượt quá 180 $=> 20x + 30y <= 180$.
    - b) Đúng. Trong thực tế, diện tích trồng không thể âm nên $x >= 0, y >= 0$.
    - c) Sai. Hàm mục tiêu thu nhập phải dựa trên lợi nhuận: lúa thu 30 triệu/ha, ngô 40 triệu/ha. Nên $F = 30x + 40y$. (Biểu thức $20x+30y$ là số ngày công).
    - d) Đúng. Nếu trồng $x=6, y=2$: 
      + Tổng diện tích: $6+2=8 <= 8$ (Thỏa mãn).
      + Tổng ngày công: $20(6) + 30(2) = 120 + 60 = 180 <= 180$ (Thỏa mãn).
      + Thu nhập: $F = 30(6) + 40(2) = 180 + 80 = 260$ triệu.
  ]
)

// TLN 17-22
#lt-tln(
  [Cho miền đa giác $A B C D$ với tọa độ $A(1; 4), B(4; 5), C(6; 2), D(2; 1)$. 
  Tìm giá trị lớn nhất của hàm mục tiêu $F(x,y) = x + 2y$ trên miền đa giác này.],
  "14",
  num: 17,
  de: "Max F từ đa giác",
  loigiai: [
    Ta thay lần lượt tọa độ 4 đỉnh vào biểu thức $F(x,y)$:
    - $A(1; 4): F = 1 + 2(4) = 9$
    - $B(4; 5): F = 4 + 2(5) = 14$
    - $C(6; 2): F = 6 + 2(2) = 10$
    - $D(2; 1): F = 2 + 2(1) = 4$
    So sánh các giá trị, ta thấy GTLN là $14$ đạt tại đỉnh $B$.
  ]
)

#lt-tln(
  [Cho hệ bất phương trình $cases(x + y <= 5, 2x - y >= 0, x >= 0, y >= 0)$. Gọi $M(x_0, y_0)$ là điểm thuộc miền nghiệm sao cho $F = 4x + 3y$ đạt giá trị lớn nhất. Tính $S = x_0 + y_0$.],
  "5",
  num: 18,
  de: "Tổng tọa độ điểm tối ưu",
  loigiai: [
    #step[Bước 1: Vẽ miền nghiệm và tìm đỉnh]
    - Các đường thẳng: $d_1: x+y=5$, $d_2: 2x-y=0$, $x=0, y=0$.
    - Tọa độ các đỉnh đa giác miền nghiệm (phần giao):
      + $(0;0)$ (giao $x=0, y=0$)
      + Giao của $2x-y=0$ và $x+y=5$: Giải hệ ta được $3x = 5 => x = 5/3, y = 10/3$.
      + Giao của $y=0$ và $x+y=5$: Tọa độ $(5;0)$.
    #step[Bước 2: Tính $F$ tại các đỉnh]
    - $F(0,0) = 0$
    - $F(5,0) = 4(5) + 0 = 20$
    - $F(5/3, 10/3) = 4(5/3) + 3(10/3) = 20/3 + 30/3 = 50/3 approx 16.67$
    
    #step[Kết luận] Giá trị lớn nhất của $F$ là 20 đạt tại $x_0 = 5, y_0 = 0$.
    Vậy $S = x_0 + y_0 = 5$.
  ]
)

#lt-tln(
  [Tìm giá trị nhỏ nhất của $F(x,y) = 2x - 3y$ trên miền tứ giác có các đỉnh $A(0; 2), B(2; 5), C(4; 3), D(3; 0)$.],
  "-11",
  num: 19,
  de: "Min F từ tọa độ",
  loigiai: [
    Thay 4 đỉnh vào biểu thức $F = 2x - 3y$:
    - $A(0;2) => F = 2(0) - 3(2) = -6$
    - $B(2;5) => F = 2(2) - 3(5) = 4 - 15 = -11$
    - $C(4;3) => F = 2(4) - 3(3) = 8 - 9 = -1$
    - $D(3;0) => F = 2(3) - 3(0) = 6$
    So sánh ta thấy Min là $-11$.
  ]
)

#lt-tln(
  [Để làm một mẻ bánh loại A cần $2$ kg bột và $1$ giờ thực hiện, lãi $40$ nghìn. Để làm một mẻ bánh loại B cần $1$ kg bột và $2$ giờ thực hiện, lãi $50$ nghìn. Tiệm có $10$ kg bột và $14$ giờ rảnh. Hỏi số tiền lãi lớn nhất tiệm có thể thu được là bao nhiêu (đơn vị: nghìn đồng)?],
  "380",
  num: 20,
  de: "Bài toán thực tế làm bánh",
  loigiai: [
    #step[Bước 1: Lập bảng tóm tắt]
    Gọi $x, y$ lần lượt là số mẻ bánh loại A và B cần làm ($x, y >= 0$).
    #align(center)[
      #table(
        columns: 4,
        fill: (col, row) => if row == 0 { luma(230) } else { none },
        [Nguyên liệu / Nguồn lực], [Bánh A ($x$ mẻ)], [Bánh B ($y$ mẻ)], [Giới hạn],
        [Bột (kg)], [2], [1], [10],
        [Thời gian (giờ)], [1], [2], [14],
        [Lãi (nghìn đồng)], [40], [50], [-]
      )
    ]
    
    #step[Bước 2: Lập hệ bất phương trình & Hàm mục tiêu]
    Hệ BPT ràng buộc:
    $ cases(
      2x + y <= 10,
      x + 2y <= 14,
      x >= 0,
      y >= 0
    ) $
    Hàm mục tiêu lợi nhuận: $F(x, y) = 40x + 50y -> max$.
    
    #step[Bước 3: Tìm tọa độ các đỉnh của miền nghiệm]
    - Giao của $2x + y = 10$ và $x = 0 => y = 10$. Đỉnh $(0; 10)$ (loại vì không thỏa mãn $x+2y<=14$).
    - Giao của $x + 2y = 14$ và $x = 0 => y = 7$. Đỉnh $A(0; 7)$.
    - Giao của $2x + y = 10$ và $y = 0 => x = 5$. Đỉnh $B(5; 0)$.
    - Giao của $2x + y = 10$ và $x + 2y = 14$:
      Giải hệ $=> cases(2x+y=10, 2x+4y=28) => 3y = 18 => y = 6, x = 2$. Đỉnh $C(2; 6)$.
    - Gốc tọa độ $O(0; 0)$.
    
    #step[Bước 4: Tính $F$ tại các đỉnh]
    - Tại $O(0; 0): F = 0$.
    - Tại $B(5; 0): F = 40(5) + 0 = 200$.
    - Tại $A(0; 7): F = 0 + 50(7) = 350$.
    - Tại $C(2; 6): F = 40(2) + 50(6) = 80 + 300 = 380$.
    
    #step[Kết luận:]
    Lãi lớn nhất thu được là $380$ nghìn đồng khi làm 2 mẻ bánh A và 6 mẻ bánh B.
  ]
)

#lt-tln(
  [Một xưởng cần thuê xe chở đồ. Có 2 loại xe: loại I chở được 2 tấn và phí 4 triệu, loại II chở được 3 tấn và phí 5 triệu. Cần chở tổng cộng ít nhất 15 tấn hàng. Biết xưởng chỉ có thể thuê tối đa 4 chiếc loại I và 3 chiếc loại II. Hỏi chi phí thuê thấp nhất là bao nhiêu triệu đồng?],
  "27",
  num: 21,
  de: "Bài toán thuê xe chi phí Min",
  loigiai: [
    #step[Bước 1: Lập bảng tóm tắt]
    Gọi $x, y$ lần lượt là số xe loại I và loại II cần thuê ($0 <= x <= 4, 0 <= y <= 3$, và $x, y in ZZ$).
    #align(center)[
      #table(
        columns: 4,
        fill: (col, row) => if row == 0 { luma(230) } else { none },
        [Thông số], [Xe loại I ($x$ chiếc)], [Xe loại II ($y$ chiếc)], [Yêu cầu / Có sẵn],
        [Khối lượng chở (tấn)], [2], [3], [>= 15],
        [Số lượng xe tối đa], [1], [1], [4 (loại I), 3 (loại II)],
        [Chi phí (triệu đồng)], [4], [5], [-]
      )
    ]
    
    #step[Bước 2: Phân tích hệ BPT]
    Hệ ràng buộc:
    $ cases(
      2x + 3y >= 15,
      0 <= x <= 4,
      0 <= y <= 3,
      x\, y in ZZ
    ) $
    Hàm mục tiêu chi phí: $F(x, y) = 4x + 5y -> min$.
    
    #step[Bước 3: Đánh giá theo biến nguyên]
    Do $y <= 3 => 3y <= 9$.
    Từ $2x + 3y >= 15 => 2x >= 15 - 3y >= 15 - 9 = 6 => 2x >= 6 => x >= 3$.
    Kết hợp $x <= 4$, ta có $x in {3; 4}$.
    
    - TH1: Nếu $x = 3 => 2(3) + 3y >= 15 => 3y >= 9 => y >= 3$.
      Vì $y <= 3$ nên bắt buộc $y = 3$.
      Khi đó chi phí $F(3, 3) = 4(3) + 5(3) = 12 + 15 = 27$ (triệu đồng).
      
    - TH2: Nếu $x = 4 => 2(4) + 3y >= 15 => 3y >= 7 => y >= 7/3 approx 2.33$.
      Vì $y in ZZ$ và $y <= 3$ nên bắt buộc $y = 3$.
      Khi đó chi phí $F(4, 3) = 4(4) + 5(3) = 16 + 15 = 31$ (triệu đồng).
      
    #step[Kết luận:]
    So sánh hai trường hợp, chi phí thuê xe thấp nhất là 27 triệu đồng (thuê 3 xe loại I và 3 xe loại II).
  ]
)

#lt-tln(
  [Cho miền nghiệm đa giác của hệ BPT: $x >= 0, y >= 0, 2x+y <= 6, x+2y <= 6$. Điểm $M(x;y)$ thuộc miền này sao cho $P = 3x+3y$ đạt giá trị Max. Tính $P_max$.],
  "12",
  num: 22,
  de: "Hệ BPT đối xứng",
  loigiai: [
    - Giải hệ giao điểm: $2x+y=6$ và $x+2y=6 => 3x+3y=12 => x+y=4$. 
      Suy ra điểm giao là $(2; 2)$.
    - Các đỉnh: $(0,0), (3,0), (0,3), (2,2)$.
    - Tính $P = 3x+3y$:
      + $(3,0): P = 9$
      + $(0,3): P = 9$
      + $(2,2): P = 3(2) + 3(2) = 12$.
    Vậy $P_max = 12$.
  ]
)
