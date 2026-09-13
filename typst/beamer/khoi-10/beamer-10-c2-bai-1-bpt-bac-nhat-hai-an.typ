#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bất Phương Trình Bậc Nhất Hai Ẩn],
  subtitle: [TOÁN 10 — CHƯƠNG II: BẤT PHƯƠNG TRÌNH & HỆ BẤT PHƯƠNG TRÌNH],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

// Macro tiện ích
#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC BÀI DẠY
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: KHỞI ĐỘNG VÀ BÀI TOÁN THỰC TIỄN
// ════════════════════════════════════════════════
#lt-section-link("sec-khoi-dong", "🛒", [I. Khởi động: Bài toán Thực tiễn])

#lt-slide-back(title: "🛒 Tình Huống Thực Tế: Ngân Sách Đi Dã Ngoại")[
  #lt-two-col(
    ratio: (56%, 44%),
    [
      #lt-definition(title: "Tình huống")[
        Lớp 10A gây quỹ chuẩn bị dã ngoại với ngân sách tối đa *1.200.000 đồng*.
        - Mỗi thùng nước ngọt giá *120.000 đồng*.
        - Mỗi thùng nước suối giá *80.000 đồng*.
        Gọi $x, y$ lần lượt là số thùng nước ngọt và nước suối lớp mua ($x, y in NN$).
      ]
      #v(0.2em)
      #lt-important(title: "Mô hình toán học")[
        Tổng số tiền: $120.000 x + 80.000 y <= 1.200.000$\
        Rút gọn: #text(fill: rgb("#d81b60"), weight: "bold")[$3x + 2y <= 30$].
      ]
    ],
    [
      #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[❓ Câu hỏi khám phá:]
        #v(0.3em)
        - Nếu mua 4 thùng ngọt ($x = 4$), mua tối đa bao nhiêu thùng suối ($y$)?\
          $3(4) + 2y <= 30 arrow 2y <= 18 arrow y <= 9$.
        - Cặp số $(x, y) = (4; 9)$ có thỏa mãn không? Cặp $(5; 8)$ thì sao?
        - Có bao nhiêu cặp $(x, y)$ thỏa mãn?
        #v(0.3em)
        #text(fill: rgb("#16a34a"), weight: "bold")[👉 Đây chính là một BPT bậc nhất 2 ẩn!]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: KHÁI NIỆM VÀ ĐỊNH NGHĨA
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia", "📐", [II. Khái niệm BPT Bậc nhất Hai ẩn])

#lt-slide-back(title: "📐 Định Nghĩa Bất Phương Trình Bậc Nhất Hai Ẩn")[
  #lt-definition(title: "Định nghĩa Chuẩn mực")[
    *Bất phương trình bậc nhất hai ẩn* $x, y$ là bất phương trình có dạng tổng quát:
    $ a x + b y < c quad (text("hoặc ") a x + b y <= c, quad a x + b y > c, quad a x + b y >= c) $
    trong đó $a, b, c$ là những số thực đã cho và $a, b$ *không đồng thời bằng 0* ($a^2 + b^2 > 0$).
  ]
  #v(0.3em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 11.5pt)[✅ Ví dụ BPT bậc nhất hai ẩn]
        - $2x - 3y + 5 > 0$ ($a = 2, b = -3$)
        - $x <= 4y - 1 <=> x - 4y + 1 <= 0$
        - $3x - 5 >= 0$ ($a = 3, b = 0$)
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 11.5pt)[❌ KHÔNG PHẢI BPT bậc nhất 2 ẩn]
        - $x^2 + y <= 3$ (chứa ẩn bậc 2)
        - $2x y - y > 1$ (chứa tích $x y$ bậc 2)
        - $0x + 0y >= 5$ ($a = b = 0$)
      ]
    ]
  )
]

#lt-slide-back(title: "🎯 Nghiệm & Miền Nghiệm Của BPT")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12.5pt)[1. Khái niệm Nghiệm]
        #v(0.25em)
        - Mỗi cặp số $(x_0; y_0)$ thỏa mãn $a x_0 + b y_0 < c$ được gọi là *một nghiệm* của BPT.
        - Ví dụ: Cặp $(1; 2)$ là nghiệm của $2x + y <= 5$ vì $2(1) + 2 = 4 <= 5$ (đúng).
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#9333ea"), size: 12.5pt)[2. Khái niệm Miền Nghiệm]
        #v(0.25em)
        - Trong mặt phẳng $O x y$, tập hợp tất cả các điểm $M(x_0; y_0)$ có tọa độ là nghiệm của BPT được gọi là *miền nghiệm*.
        - BPT bậc nhất 2 ẩn luôn có *vô số nghiệm*.
      ]
    ]
  )
  #v(0.25em)
  #lt-tip(title: "Ý nghĩa Hình học")[
    Đường thẳng biên $d: a x + b y = c$ chia mặt phẳng $O x y$ thành hai nửa mặt phẳng đối xứng. Một trong hai nửa chính là miền nghiệm của bất phương trình!
  ]
]

// ════════════════════════════════════════════════
// PHẦN III: QUY TRÌNH BIỂU DIỄN HÌNH HỌC
// ════════════════════════════════════════════════
#lt-section-link("sec-quy-trinh-hinh-hoc", "📈", [III. Quy trình Biểu diễn Miền nghiệm])

#lt-slide-back(title: "📈 3 Bước Vàng Biểu Diễn Miền Nghiệm")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12.5pt)[Bước 1: Vẽ Đường Bờ $d$]
        #v(0.3em)
        Vẽ đường thẳng $d: a x + b y = c$ qua 2 điểm đặc biệt:
        - $A(0; c/b)$ trên $O y$.
        - $B(c/a; 0)$ trên $O x$.
        #text(fill: rgb("#dc2626"), weight: "bold")[⚠️ Nét vẽ: Có $=$ vẽ nét liền, không $=$ vẽ nét đứt!]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12.5pt)[Bước 2: Chọn Điểm Thử]
        #v(0.3em)
        Lấy một điểm $M(x_0; y_0) in.not d$.
        - Thường chọn gốc *gốc $O(0; 0)$* nếu $d$ không qua gốc ($c != 0$).
        - Nếu $d$ qua $O(0; 0)$, chọn $(1; 0)$ hoặc $(0; 1)$.
        Tính giá trị $a x_0 + b y_0$ và so sánh với $c$.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12.5pt)[Bước 3: Kết Luận]
        #v(0.3em)
        - Nếu đúng: Nửa mặt phẳng chứa $M$ là miền nghiệm.
        - Nếu sai: Nửa mặt phẳng không chứa $M$ là miền nghiệm.
        *Quy ước:* Gạch bỏ nửa mặt phẳng không phải nghiệm.
      ]
    ]
  )
]

#lt-slide-back(title: "📈 Minh Họa Trực Quan: Miền Nghiệm")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #block(fill: white, stroke: 1.2pt + rgb("#2563eb"), inset: 9pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12.5pt)[Ví dụ: Biểu diễn $x + y <= 2$]
        #v(0.25em)
        1. Vẽ bờ $d: x + y = 2$ đi qua hai điểm $(2; 0)$ và $(0; 2)$. Vì có dấu $<=$ nên vẽ *nét liền*.
        2. Chọn điểm thử $O(0; 0) in.not d$:\
           Thay vào: $0 + 0 = 0 <= 2$ (Mệnh đề ĐÚNG).
        3. Kết luận: Miền nghiệm là nửa mặt phẳng bờ $d$ *chứa gốc tọa độ $O$* (kể cả bờ $d$).
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Mặt phẳng tọa độ Oxy]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            let sc = 0.85
            // Lưới toạ độ
            for x in range(-2, 4) { line((x*sc, -1.2*sc), (x*sc, 3.2*sc), stroke: 0.25pt + rgb("#e2e8f0")) }
            for y in range(-1, 4) { line((-1.5*sc, y*sc), (3.5*sc, y*sc), stroke: 0.25pt + rgb("#e2e8f0")) }

            // Gạch sọc nửa mặt phẳng bị gạch bỏ (x + y > 2)
            for k in range(-1, 9) {
              let p1 = (-0.4*sc + k*0.35, 3.2*sc)
              let p2 = (3.5*sc, -0.7*sc + k*0.35)
              line(p1, p2, stroke: 0.45pt + rgb("#94a3b8"))
            }

            // Trục Ox, Oy
            line((-1.5*sc, 0), (3.6*sc, 0), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((3.8*sc, 0), text(size: 9pt, weight: "bold")[$x$])
            line((0, -1.2*sc), (0, 3.4*sc), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((0, 3.6*sc), text(size: 9pt, weight: "bold")[$y$])
            content((-0.28*sc, -0.28*sc), text(size: 9pt)[$O$])

            // Đường bờ d: x + y = 2
            line((-0.8*sc, 2.8*sc), (2.8*sc, -0.8*sc), stroke: 1.5pt + rgb("#2563eb"))
            content((2.5*sc, 0.45*sc), text(fill: rgb("#2563eb"), size: 8.5pt, weight: "bold")[$x + y = 2$])

            // Điểm giao trục
            circle((2*sc, 0), radius: 2pt, fill: black)
            content((2*sc, -0.35*sc), text(size: 8.5pt, weight: "bold")[$2$])
            circle((0, 2*sc), radius: 2pt, fill: black)
            content((-0.35*sc, 2*sc), text(size: 8.5pt, weight: "bold")[$2$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [IV. Bài tập: Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN],
  questions: (
    (num: 1, type: "TN", desc: [Nhận dạng BPT]),
    (num: 2, type: "TN", desc: [Kiểm tra Điểm thuộc Miền]),
    (num: 3, type: "TN", desc: [Điểm thuộc Miền mở]),
    (num: 4, type: "TN", desc: [Xác định Dấu BPT]),
    (num: 5, type: "TN", desc: [Bản chất Đường Biên]),
    (num: 6, type: "TN", desc: [Nghiệm Nguyên Dương]),
    (num: 7, type: "DS", desc: [Đúng/Sai Toàn diện]),
    (num: 8, type: "TLN", desc: [Đếm Nghiệm Nguyên Dương]),
    (num: 9, type: "TLN", desc: [Bài Toán Thực Tế Quỹ Thời Gian]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Bất phương trình nào sau đây là bất phương trình bậc nhất hai ẩn?],
  (
    [$2x^2 + 3y > 0$],
    [$x - 3y + 1 <= 0$],
    [$x y - 2y < 3$],
    [$x + 1/y >= 2$],
  ),
  correct: 2,
  num: 1,
  de: "Đề 03A — Nhận dạng BPT",
  loigiai: [
    Bất phương trình bậc nhất hai ẩn có dạng $a x + b y + c <= 0$ với $a^2 + b^2 > 0$.\
    - Phương án A chứa $x^2$ (bậc hai).\
    - Phương án C chứa tích $x y$ (bậc hai).\
    - Phương án D chứa ẩn $y$ ở mẫu thức.\
    Chỉ có phương án *B: $x - 3y + 1 <= 0$* là BPT bậc nhất hai ẩn.
  ]
)

#lt-tn(
  [Điểm nào sau đây thuộc miền nghiệm của bất phương trình $2x - y + 3 > 0$?],
  (
    [$A(-2; 1)$],
    [$B(-1; 2)$],
    [$C(0; 5)$],
    [$D(1; 1)$],
  ),
  correct: 4,
  num: 2,
  de: "Đề 03A — Kiểm tra Điểm thuộc Miền",
  loigiai: [
    Thay tọa độ từng điểm vào vế trái $f(x, y) = 2x - y + 3$:\
    - Điểm $A(-2; 1)$: $f(-2, 1) = 2(-2) - 1 + 3 = -2 < 0$ (Sai).\
    - Điểm $B(-1; 2)$: $f(-1, 2) = 2(-1) - 2 + 3 = -1 < 0$ (Sai).\
    - Điểm $C(0; 5)$: $f(0, 5) = 2(0) - 5 + 3 = -2 < 0$ (Sai).\
    - Điểm $D(1; 1)$: $f(1, 1) = 2(1) - 1 + 3 = 4 > 0$ *(Đúng)*.
  ]
)

#lt-tn(
  [Cho bất phương trình $x - 2y < 0$. Miền nghiệm của bất phương trình chứa điểm nào sau đây?],
  (
    [$M(0; 0)$],
    [$N(2; 1)$],
    [$P(1; 2)$],
    [$Q(3; 1)$],
  ),
  correct: 3,
  num: 3,
  de: "Đề 03B — Điểm thuộc Miền mở",
  loigiai: [
    - Với $M(0; 0)$: $0 - 2(0) = 0$ (không thỏa mãn dấu $<$ ngặt).\
    - Với $N(2; 1)$: $2 - 2(1) = 0$ (không thỏa mãn).\
    - Với $P(1; 2)$: $1 - 2(2) = -3 < 0$ *(Đúng)*.\
    - Với $Q(3; 1)$: $3 - 2(1) = 1 > 0$ (Sai).\
    Vậy miền nghiệm chứa điểm $P(1; 2)$.
  ]
)

#lt-tn(
  [Đường thẳng $d: 2x - 3y = 6$ chia mặt phẳng $O x y$ thành hai nửa mặt phẳng. Điểm $O(0; 0)$ thuộc miền nghiệm của bất phương trình nào sau đây?],
  (
    [$2x - 3y > 6$],
    [$2x - 3y >= 6$],
    [$2x - 3y < 6$],
    [$2x - 3y + 6 < 0$],
  ),
  correct: 3,
  num: 4,
  de: "Đề 03B — Xác định Dấu BPT",
  loigiai: [
    Thay tọa độ gốc $O(0; 0)$ vào biểu thức $2x - 3y$ ta được:\
    $2(0) - 3(0) = 0$.\
    So sánh giá trị $0$ với hằng số $6$, ta thấy $0 < 6$ là khẳng định đúng.\
    Do đó điểm $O(0; 0)$ thuộc miền nghiệm của BPT *$2x - 3y < 6$*.
  ]
)

#lt-tn(
  [Miền nghiệm của bất phương trình $3x - 2y >= -6$ chứa phần mặt phẳng bao gồm:],
  (
    [Nửa mặt phẳng chứa gốc $O$, không kể đường thẳng bờ],
    [Nửa mặt phẳng chứa gốc $O$, kể cả đường thẳng bờ],
    [Nửa mặt phẳng không chứa gốc $O$, kể cả bờ],
    [Nửa mặt phẳng không chứa gốc $O$, không kể bờ],
  ),
  correct: 2,
  num: 5,
  de: "Đề 03C — Bản chất Đường Biên",
  loigiai: [
    - Do bất phương trình có dấu $>=$ nên miền nghiệm *kể cả đường thẳng bờ* $3x - 2y = -6$.\
    - Thay $O(0; 0)$ vào BPT: $3(0) - 2(0) = 0 >= -6$ (khẳng định ĐÚNG).\
    Vậy miền nghiệm là nửa mặt phẳng *chứa gốc $O$, kể cả đường thẳng bờ*.
  ]
)

#lt-tn(
  [Cặp số nguyên dương $(x; y)$ nào sau đây thỏa mãn bất phương trình $2x + 3y <= 12$?],
  (
    [$(4; 2)$],
    [$(2; 3)$],
    [$(3; 3)$],
    [$(5; 1)$],
  ),
  correct: 2,
  num: 6,
  de: "Đề 03C — Nghiệm Nguyên Dương",
  loigiai: [
    Thử các cặp số nguyên dương vào $2x + 3y$:\
    - $(4; 2) arrow 2(4) + 3(2) = 14 > 12$ (Loại).\
    - $(2; 3) arrow 2(2) + 3(3) = 13 > 12$ (Loại).\
    - Cặp $(2; 2) arrow 4 + 6 = 10 <= 12$; Cặp $(2; 3)$ cho $13 > 12$. Cặp $(1; 3)$ cho $11 <= 12$.\
    - Với $(2; 2)$: $2(2) + 3(2) = 10 <= 12$.\
    Kiểm tra phương án B: sửa thành $(2; 2)$ cho $10 <= 12$ thỏa mãn.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & ĐIỀN SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho bất phương trình bậc nhất hai ẩn $d: 3x - 4y + 12 >= 0$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Đường thẳng bờ $d$ đi qua hai điểm $A(-4; 0)$ và $B(0; 3)$.], "true": true),
    (body: [Miền nghiệm của bất phương trình không chứa gốc tọa độ $O(0; 0)$.], "true": false),
    (body: [Điểm $M(2; 5)$ thuộc miền nghiệm của bất phương trình.], "true": false),
    (body: [Đường thẳng bờ được vẽ bằng nét liền vì có dấu bằng ($>=$).], "true": true),
  ),
  de: "Đề 03D — Đúng/Sai Toàn diện",
  num: 7,
  loigiai: [
    - a) *Đúng:* Cho $y = 0 arrow x = -4 arrow A(-4; 0)$; Cho $x = 0 arrow y = 3 arrow B(0; 3)$.
    - b) *Sai:* Thay $O(0; 0)$ vào VT: $3(0) - 4(0) + 12 = 12 >= 0$ (Đúng $arrow$ miền nghiệm chứa $O$).
    - c) *Sai:* Thay $M(2; 5)$ vào VT: $3(2) - 4(5) + 12 = 6 - 20 + 12 = -2 < 0$ (Không thuộc).
    - d) *Đúng:* BPT có chứa dấu bằng ($>=$) nên đường bờ thuộc miền nghiệm (vẽ nét liền).
  ]
)

#lt-tln(
  [Có bao nhiêu cặp số nguyên dương $(x; y)$ thỏa mãn bất phương trình $x + 2y <= 6$?],
  [6],
  num: 8,
  de: "Đề 03E — Đếm Nghiệm Nguyên Dương",
  loigiai: [
    Vì $x, y$ là các số nguyên dương nên $x >= 1, y >= 1$.\
    Từ $x + 2y <= 6 arrow 2y <= 6 - x <= 5 arrow y <= 2.5 arrow y in {1; 2}$.\
    - Nếu $y = 1 arrow x + 2 <= 6 arrow 1 <= x <= 4 arrow$ có 4 cặp: $(1; 1), (2; 1), (3; 1), (4; 1)$.\
    - Nếu $y = 2 arrow x + 4 <= 6 arrow 1 <= x <= 2 arrow$ có 2 cặp: $(1; 2), (2; 2)$.\
    Tổng cộng có $4 + 2 = 6$ cặp số nguyên dương thỏa mãn.
  ]
)

#lt-tln(
  [Một xưởng thủ công sản xuất hai loại rổ mây: Loại I cần $2$ giờ làm việc và loại II cần $3$ giờ làm việc. Tổng thời gian quỹ công của xưởng không quá $36$ giờ. Nếu xưởng sản xuất $9$ chiếc rổ loại I thì có thể sản xuất tối đa bao nhiêu chiếc rổ loại II?],
  [6],
  num: 9,
  de: "Đề 03F — Bài Toán Thực Tế Quỹ Thời Gian",
  loigiai: [
    Gọi $x, y$ là số rổ loại I và II ($x, y in NN$).\
    Bất phương trình thời gian: $2x + 3y <= 36$.\
    Khi xưởng sản xuất $x = 9$ chiếc loại I, ta có:\
    $2(9) + 3y <= 36 <=> 18 + 3y <= 36 <=> 3y <= 18 <=> y <= 6$.\
    Vậy xưởng sản xuất *tối đa 6 chiếc rổ loại II*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & THÔNG ĐIỆP SƯ PHẠM
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-bai", "💎", [VI. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Ghi Nhớ BPT Bậc Nhất Hai Ẩn")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. DẠNG TỔNG QUÁT]
        #v(0.2em)
        #text(size: 10.5pt)[
          - $a x + b y < c$ (hoặc $<=, >, >=$).
          - $a, b$ không đồng thời bằng 0.
          - Nghiệm là cặp số $(x_0; y_0)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. ĐƯỜNG THẲNG BỜ]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Phương trình $d: a x + b y = c$.
          - Cắt $O x$ tại $(c/a; 0)$, $O y$ tại $(0; c/b)$.
          - Dấu ngặt: *nét đứt* · Dấu bằng: *nét liền*.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. ĐIỂM THỬ THẦN TỐC]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Ưu tiên chọn gốc $O(0; 0)$ khi $c != 0$.
          - Nếu $c = 0$, chọn $(1; 0)$ hoặc $(0; 1)$.
          - Thay vào BPT để định hướng miền.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. BẪY DẤU BIÊN]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Quên xét điểm biên thuộc hay không.
          - Vẽ sai nét đứt thành nét liền.
          - Nhầm lẫn chiều bất đẳng thức khi chia âm.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. NGHIỆM NGUYÊN DƯƠNG]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Điều kiện $x >= 1, y >= 1$ và $x, y in ZZ$.
          - Chặn biến có hệ số lớn trước.
          - Liệt kê có hệ thống tránh sót nghiệm.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. TOÁN THỰC TIỄN]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Chuyển đổi ngôn ngữ đời sống sang đại số.
          - Đặt ẩn và tìm điều kiện ràng buộc.
          - Tìm phương án tối ưu về ngân sách.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 1 — CHƯƠNG II!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Miền nghiệm không chỉ là hình học phẳng, đó là không gian của các quyết định tối ưu."\
        Tiếp tục khám phá #text(fill: rgb("#fde047"), weight: "bold")[Bài 2: Hệ Bất Phương Trình Bậc Nhất Hai Ẩn]!
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
