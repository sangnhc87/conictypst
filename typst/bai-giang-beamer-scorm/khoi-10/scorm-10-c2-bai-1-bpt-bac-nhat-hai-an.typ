#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"

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
          #context cetz.canvas({
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


#lt-slide-back(title: "📈 Ví Dụ 2: Biểu diễn $2x - y > 0$")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #block(fill: white, stroke: 1.2pt + rgb("#16a34a"), inset: 9pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12.5pt)[Biểu diễn miền nghiệm của $2x - y > 0$]
        #v(0.25em)
        1. Vẽ bờ $d: 2x - y = 0$ (hay $y = 2x$). Đi qua $O(0;0)$ và $A(1;2)$. Vì có dấu $>$ nên vẽ *nét đứt*.
        2. Chọn điểm thử: Do $d$ đi qua $O(0;0)$ nên ta chọn $M(1; 0) in.not d$:           Thay vào: $2(1) - 0 = 2 > 0$ (Mệnh đề ĐÚNG).
        3. Kết luận: Miền nghiệm là nửa mặt phẳng bờ $d$ *chứa điểm $M$* (không kể bờ $d$).
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #context cetz.canvas({
            import cetz.draw: *
            let sc = 0.85
            for x in range(-1, 3) { line((x*sc, -2.2*sc), (x*sc, 3.2*sc), stroke: 0.25pt + rgb("#e2e8f0")) }
            for y in range(-2, 4) { line((-1.5*sc, y*sc), (2.5*sc, y*sc), stroke: 0.25pt + rgb("#e2e8f0")) }

            // Gạch sọc nửa mặt phẳng (2x - y < 0 => y > 2x)
            for k in range(-3, 6) {
              line((-0.5*sc, (-1 + k*0.6)*sc), (1.5*sc, (3 + k*0.6)*sc), stroke: 0.45pt + rgb("#94a3b8"))
            }

            line((-1.5*sc, 0), (2.5*sc, 0), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((2.7*sc, 0), text(size: 9pt, weight: "bold")[$x$])
            line((0, -2.2*sc), (0, 3.4*sc), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((0, 3.6*sc), text(size: 9pt, weight: "bold")[$y$])
            content((-0.28*sc, -0.28*sc), text(size: 9pt)[$O$])

            line((-1*sc, -2*sc), (1.5*sc, 3*sc), stroke: (paint: rgb("#16a34a"), thickness: 1.5pt, dash: "dashed"))
            content((1.2*sc, 2.7*sc), text(fill: rgb("#16a34a"), size: 8.5pt, weight: "bold")[$2x - y = 0$])

            circle((1*sc, 0), radius: 2pt, fill: rgb("#dc2626"))
            content((1*sc, -0.35*sc), text(fill: rgb("#dc2626"), size: 8.5pt, weight: "bold")[$1$])
            content((1*sc, 0.4*sc), text(fill: rgb("#dc2626"), size: 8.5pt)[$M$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [IV. Bài tập: Trắc nghiệm Nhiều Phương Án])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN],
  questions: (
    (num: 1, type: "TN", desc: [Nhận biết khái niệm]),
    (num: 2, type: "TN", desc: [Xác định BPT từ điểm]),
    (num: 3, type: "TN", desc: [Kiểm tra điểm thuộc miền]),
    (num: 4, type: "TN", desc: [Giao điểm trục toạ độ]),
    (num: 5, type: "TN", desc: [Biểu diễn miền nghiệm]),
    (num: 6, type: "TN", desc: [Xác định BPT từ hình]),
    (num: 7, type: "TN", desc: [Bản chất đường biên]),
    (num: 8, type: "TN", desc: [Ứng dụng điểm thử]),
    (num: 9, type: "TN", desc: [Đếm điểm nguyên]),
    (num: 10, type: "TN", desc: [Tính chất đa giác]),
    (num: 11, type: "TN", desc: [Nghiệm của hàm số]),
    (num: 12, type: "TN", desc: [Ứng dụng thực tế]),
    (num: 13, type: "DS", desc: [Xét tính đúng sai các mệnh đề hình học]),
    (num: 14, type: "DS", desc: [Phân tích bài toán kinh tế]),
    (num: 15, type: "DS", desc: [Kiểm tra tính chất đa giác nghiệm]),
    (num: 16, type: "DS", desc: [Phân tích hệ số đường thẳng]),
    (num: 17, type: "TLN", desc: [Toán thực tế: Chi phí nhỏ nhất]),
    (num: 18, type: "TLN", desc: [Toán thực tế: Lợi nhuận cao nhất]),
    (num: 19, type: "TLN", desc: [Đếm số cặp nghiệm nguyên dương]),
    (num: 20, type: "TLN", desc: [Tìm tham số]),
    (num: 21, type: "TLN", desc: [Diện tích đa giác]),
    (num: 22, type: "TLN", desc: [Bài toán vận tải]),
  ),
  back-to: "lec-toc-main"
)

// 12 CÂU TN
#lt-tn([Bất phương trình nào sau đây là bất phương trình bậc nhất hai ẩn?], ([$2x^2 + 3y > 0$], [$x - 3y + 1 <= 0$], [$x y - 2y < 3$], [$x + 1/y >= 2$]), correct: 2, num: 1, loigiai: [
  #step[Bước 1: Nhắc lại định nghĩa]
  Bất phương trình bậc nhất hai ẩn $x, y$ có dạng tổng quát là $a x + b y + c <= 0$ (hoặc $<, >, >=$), trong đó $a$ và $b$ không đồng thời bằng 0 ($a^2 + b^2 > 0$). Cả $x$ và $y$ đều phải ở bậc 1 và không chứa tích $x y$ hoặc ẩn ở mẫu.
  
  #step[Bước 2: Phân tích từng phương án]
  - Đáp án A chứa $x^2$ (bậc 2) $arrow$ Sai.
  - Đáp án C chứa tích $x y$ (bậc 2) $arrow$ Sai.
  - Đáp án D chứa ẩn $y$ ở mẫu số ($1/y$) $arrow$ Sai.
  - Đáp án B có dạng $x - 3y + 1 <= 0$, bậc của $x$ và $y$ đều là 1 $arrow$ Đúng.
])
#lt-tn([Trong các cặp số sau, cặp nào là nghiệm của bất phương trình $3x - 2y >= 5$?], ([$(1; 2)$], [$(0; 0)$], [$(3; 1)$], [$(2; 3)$]), correct: 3, num: 2, loigiai: [
  #step[Phương pháp giải]
  Thay tọa độ từng điểm $(x_0; y_0)$ vào vế trái của bất phương trình và kiểm tra tính đúng sai của mệnh đề thu được.
  
  #step[Kiểm tra từng đáp án]
  - Thay $(1; 2)$: $3(1) - 2(2) = -1 >= 5$ (Sai).
  - Thay $(0; 0)$: $3(0) - 2(0) = 0 >= 5$ (Sai).
  - Thay $(3; 1)$: $3(3) - 2(1) = 7 >= 5$ (Đúng).
  - Thay $(2; 3)$: $3(2) - 2(3) = 0 >= 5$ (Sai).
  Vậy $(3; 1)$ là nghiệm của bất phương trình.
])
#lt-tn([Điểm $M(1; -2)$ thuộc miền nghiệm của bất phương trình nào sau đây?], ([$x + 2y > 0$], [$2x - y < 3$], [$3x + y >= 1$], [$x - y <= 2$]), correct: 3, num: 3, loigiai: [
  #step[Phân tích]
  Một điểm $M$ thuộc miền nghiệm khi thay tọa độ của nó vào BPT cho ta mệnh đề đúng. Ta thay $x=1, y=-2$ vào từng đáp án.
  
  #step[Kiểm tra]
  - BPT A: $1 + 2(-2) = -3 > 0$ (Sai).
  - BPT B: $2(1) - (-2) = 4 < 3$ (Sai).
  - BPT C: $3(1) + (-2) = 1 >= 1$ (Đúng vì có dấu "=").
  - BPT D: $1 - (-2) = 3 <= 2$ (Sai).
  Vậy đáp án đúng là C.
])
#lt-tn([Đường thẳng $d: 2x + y = 4$ chia mặt phẳng thành hai nửa. Gốc toạ độ $O(0;0)$ thuộc nửa mặt phẳng là miền nghiệm của BPT nào?], ([$2x + y > 4$], [$2x + y < 4$], [$-2x - y > 4$], [$x + 2y = 4$]), correct: 2, num: 4, loigiai: [
  #step[Bước 1: Tính giá trị tại O]
  Thay tọa độ gốc $O(0;0)$ vào biểu thức $2x + y$, ta được: $2(0) + 0 = 0$.
  
  #step[Bước 2: So sánh và đối chiếu]
  So sánh với hằng số $4$, rõ ràng $0 < 4$ là mệnh đề ĐÚNG. Do đó, điểm $O$ thỏa mãn bất phương trình $2x + y < 4$.
])
#lt-tn([Cặp số nào sau đây *không là nghiệm* của bất phương trình $x - 4y + 5 > 0$?], ([$(0; 0)$], [$(1; 1)$], [$(-1; 2)$], [$(5; 2)$]), correct: 3, num: 5, loigiai: [
  #step[Kiểm tra điểm không thỏa mãn]
  Thay tọa độ các điểm vào biểu thức $P(x,y) = x - 4y + 5$:
  - Tại $(0;0)$: $0 - 0 + 5 = 5 > 0$ (Là nghiệm).
  - Tại $(1;1)$: $1 - 4 + 5 = 2 > 0$ (Là nghiệm).
  - Tại $(-1;2)$: $-1 - 8 + 5 = -4 > 0$ (Mệnh đề SAI) $arrow$ Không là nghiệm.
  - Tại $(5;2)$: $5 - 8 + 5 = 2 > 0$ (Là nghiệm).
  Vậy điểm không là nghiệm là $(-1; 2)$.
])
#lt-tn([Miền nghiệm của bất phương trình $2x - y > 3$ *không chứa* điểm nào?], ([$(3; 0)$], [$(2; -1)$], [$(0; -4)$], [$(0; 0)$]), correct: 4, num: 6, loigiai: [
  #step[Trực quan hình học]
  #align(center)[
    #context cetz.canvas({
      import cetz.draw: *
      let sc = 0.8
      line((-1*sc, 0), (4*sc, 0), mark: (end: "stealth"))
      content((4.2*sc, 0), [$x$])
      line((0, -5*sc), (0, 2*sc), mark: (end: "stealth"))
      content((0, 2.3*sc), [$y$])
      line((-0.5*sc, -4*sc), (2.5*sc, 2*sc), stroke: (dash: "dashed", paint: blue))
      content((2*sc, 2.5*sc), text(blue)[$2x - y = 3$])
      circle((0,0), radius: 3pt, fill: red); content((-0.4*sc, 0.4*sc), text(red)[$O$])
    })
  ]
  #step[Kiểm tra bằng đại số]
  Thay toạ độ $O(0;0)$ vào BPT: $2(0) - 0 = 0 > 3$ (Sai). Do đó miền nghiệm không chứa gốc toạ độ $O$. Các điểm khác khi thay vào đều cho mệnh đề đúng.
])
#lt-tn([Đường thẳng biên của miền nghiệm BPT $x + 2y < 4$ là?], ([$x + 2y > 4$], [$x + 2y = 4$], [$x = 4$], [$y = 2$]), correct: 2, num: 7, loigiai: [
  #step[Định nghĩa đường biên]
  Đường thẳng biên của bất phương trình luôn được tìm bằng cách thay dấu bất đẳng thức ($, <, >=, <=$) bằng dấu bằng ($=$).
  Vì vậy, biên của $x + 2y < 4$ chính là đường thẳng $x + 2y = 4$.
])
#lt-tn([Cho miền đa giác giới hạn bởi hệ $x>=0, y>=0, x+y<=3$. Điểm nào thuộc miền đa giác?], ([$(2; 2)$], [$(1; 1)$], [$(0; 4)$], [$(-1; 1)$]), correct: 2, num: 8, loigiai: [
  #step[Vẽ hình trực quan]
  #align(center)[
    #context cetz.canvas({
      import cetz.draw: *
      let sc = 0.8
      line((-1*sc, 0), (4*sc, 0), mark: (end: "stealth"))
      line((0, -1*sc), (0, 4*sc), mark: (end: "stealth"))
      line((0, 3*sc), (3*sc, 0), stroke: blue + 1.2pt)
      // shade triangle (0,0), (3,0), (0,3)
      line((0,0), (3*sc,0), (0,3*sc), close: true, fill: rgb(173, 216, 230, 100), stroke: none)
      circle((1*sc, 1*sc), radius: 3pt, fill: red)
      content((1*sc, 1.3*sc), text(red)[$(1;1)$])
    })
  ]
  #step[Kiểm tra hệ BPT]
  Điểm $(1;1)$ có $x=1 >= 0$, $y=1 >= 0$ và tổng $x+y = 2 <= 3$. Thỏa mãn tất cả các điều kiện của hệ.
])
#lt-tn([Có bao nhiêu điểm có toạ độ nguyên dương thuộc miền nghiệm của $x + y < 4$?], ([$3$], [$6$], [$4$], [$5$]), correct: 1, num: 9, loigiai: [
  #step[Điều kiện nguyên dương]
  Toạ độ nguyên dương nghĩa là $x, y in ZZ$ và $x >= 1, y >= 1$.
  
  #step[Liệt kê nghiệm]
  Bất phương trình đã cho: $x + y < 4$. Ta biện luận:
  - Nếu $x = 1 arrow 1 + y < 4 arrow y < 3 arrow y in {1; 2}$. (Có 2 điểm: $(1;1), (1;2)$)
  - Nếu $x = 2 arrow 2 + y < 4 arrow y < 2 arrow y in {1}$. (Có 1 điểm: $(2;1)$)
  - Nếu $x = 3 arrow 3 + y < 4 arrow y < 1$ (Không có số nguyên dương nào).
  Vậy tổng cộng có đúng 3 điểm nguyên dương thỏa mãn.
])
#lt-tn([Bất phương trình $x >= 2$ có miền nghiệm là:], ([Nửa mặt phẳng bên trái đường $x=2$], [Nửa mặt phẳng bên phải đường $x=2$, kể cả bờ], [Nửa mặt phẳng phía trên đường $y=2$], [Nửa mặt phẳng phía dưới đường $y=2$]), correct: 2, num: 10, loigiai: [
  #step[Trực quan hình học]
  #align(center)[
    #context cetz.canvas({
      import cetz.draw: *
      let sc = 0.8
      line((-1*sc, 0), (4*sc, 0), mark: (end: "stealth"))
      line((0, -1*sc), (0, 3*sc), mark: (end: "stealth"))
      line((2*sc, -1*sc), (2*sc, 3*sc), stroke: blue + 1.2pt)
      line((2*sc, -1*sc), (4*sc, -1*sc), (4*sc, 3*sc), (2*sc, 3*sc), close: true, fill: rgb(173, 216, 230, 100), stroke: none)
      content((2*sc, -0.4*sc), [$2$])
    })
  ]
  BPT $x >= 2$ biểu diễn tập hợp các điểm có hoành độ lớn hơn hoặc bằng 2. Tập hợp này nằm hoàn toàn bên phải đường thẳng thẳng đứng $x=2$ và lấy cả đường thẳng này do có dấu $=$.
])
#lt-tn([Hệ số $a, b$ của BPT $a x + b y <= c$ không thể thoả mãn:], ([$a=0, b=1$], [$a=1, b=0$], [$a=0, b=0$], [$a=1, b=1$]), correct: 3, num: 11, loigiai: [
  #step[Định nghĩa gốc]
  Theo định nghĩa của bất phương trình bậc nhất hai ẩn, $a$ và $b$ *không đồng thời bằng 0* (viết gọn là $a^2+b^2 > 0$).
  Nếu $a=0$ và $b=0$, BPT trở thành $0 <= c$, đây là một mệnh đề luôn đúng hoặc luôn sai chứ không còn chứa ẩn $x, y$ nữa.
])
#lt-tn([Một vé xem phim giá 50k, bỏng ngô giá 30k. Nếu bạn có 200k, gọi $x, y$ là số vé và bỏng ngô mua được. BPT nào mô tả đúng ngân sách?], ([$50x + 30y < 200$], [$5x + 3y <= 20$], [$50x + 30y > 200$], [$x + y <= 200$]), correct: 2, num: 12, loigiai: [
  #step[Thiết lập mô hình Toán học]
  Tổng số tiền chi tiêu để mua $x$ vé và $y$ bỏng ngô là: $50x + 30y$ (đơn vị: nghìn đồng).
  Vì ngân sách tối đa là 200k, nên chi phí không được vượt quá số tiền này: $50x + 30y <= 200$.
  #step[Rút gọn biểu thức]
  Chia cả hai vế cho 10, ta được BPT thu gọn: $5x + 3y <= 20$.
])

// 4 CÂU ĐS
#lt-section-link("sec-luyen-tap-ds", "📝", [V. Bài tập: Đúng/Sai])
#lt-ds([Cho bất phương trình $2x - y + 4 <= 0$. Xét tính đúng sai:], ((body: [Đường thẳng bờ đi qua điểm $A(-2; 0)$.], "true": true), (body: [Miền nghiệm chứa gốc toạ độ $O(0;0)$.], "true": false), (body: [Bất phương trình trên có vô số nghiệm.], "true": true), (body: [Điểm $M(-3; 1)$ thuộc miền nghiệm.], "true": true)), num: 13, loigiai: [
  #step[Phân tích từng mệnh đề]
  - a) Thay toạ độ $A(-2;0)$ vào pt đường thẳng: $2(-2) - 0 + 4 = 0$ (Thoả mãn). (Mệnh đề ĐÚNG)
  - b) Thay toạ độ $O(0;0)$ vào BPT: $2(0) - 0 + 4 = 4 <= 0$ (Vô lí). Gốc O không thuộc miền nghiệm. (Mệnh đề SAI)
  - c) BPT bậc nhất hai ẩn luôn có vô số nghiệm đại diện cho một nửa mặt phẳng. (Mệnh đề ĐÚNG)
  - d) Thay toạ độ $M(-3;1)$ vào BPT: $2(-3) - 1 + 4 = -3 <= 0$ (Chính xác). (Mệnh đề ĐÚNG)
])
#lt-ds([Xét bài toán: Lớp 10A cần mua trà sữa (30k/ly) và bánh gạo (20k/phần). Quỹ lớp có tối đa 500k. Đặt $x, y$ là số ly trà sữa và bánh gạo.], ((body: [$x, y$ phải là số nguyên dương hoặc bằng 0.], "true": true), (body: [Bất phương trình mô tả là $3x + 2y <= 50$.], "true": true), (body: [Nếu mua 10 ly trà sữa, lớp có thể mua tối đa 15 phần bánh gạo.], "true": false), (body: [Điểm $(10; 10)$ là một phương án mua được.], "true": true)), num: 14, loigiai: [
  #step[Phân tích từng mệnh đề]
  - a) $x, y$ biểu thị số lượng vật phẩm (ly, phần) nên không thể âm hoặc là số thập phân. (Mệnh đề ĐÚNG)
  - b) Tổng tiền $30x + 20y <= 500 <=> 3x + 2y <= 50$. (Mệnh đề ĐÚNG)
  - c) Thay $x=10$ vào BPT: $3(10) + 2y <= 50 <=> 2y <= 20 <=> y <= 10$. Vậy chỉ mua tối đa 10 phần, không phải 15. (Mệnh đề SAI)
  - d) Với $(10;10)$, ta có $3(10) + 2(10) = 50 <= 50$. Điểm này thoả mãn BPT và dùng hết sạch tiền. (Mệnh đề ĐÚNG)
])
#lt-ds([Cho đường thẳng $d: x + 2y = 4$.], ((body: [$d$ cắt trục hoành tại điểm có hoành độ 4.], "true": true), (body: [Điểm $M(2; 1)$ nằm trên $d$.], "true": true), (body: [Miền nghiệm của $x + 2y > 4$ là nửa mặt phẳng bờ $d$ chứa gốc toạ độ.], "true": false), (body: [Nửa mặt phẳng bờ $d$ chứa $A(5;0)$ là miền nghiệm của $x+2y>=4$.], "true": true)), num: 15, loigiai: [
  #step[Phân tích hình học và đại số]
  - a) Cắt trục hoành khi $y=0 arrow x=4$. Điểm $(4;0)$ đúng là hoành độ 4. (ĐÚNG)
  - b) Thay $M(2;1)$ vào pt: $2 + 2(1) = 4$. Nằm trên đường bờ. (ĐÚNG)
  - c) Thay O(0;0) vào BPT: $0 + 2(0) = 0 > 4$ (Sai). Vậy miền không chứa O. (SAI)
  - d) Thay $A(5;0)$ vào $x+2y>=4$: $5 + 0 = 5 >= 4$ (Đúng). (ĐÚNG)
])
#lt-ds([Một nhà máy sản xuất 2 loại sản phẩm A và B. Để sản xuất 1 SP A cần 2 giờ, 1 SP B cần 4 giờ. Nhà máy có tối đa 40 giờ làm việc. Lợi nhuận 1 SP A là 3 triệu, 1 SP B là 5 triệu.], ((body: [Điều kiện thời gian là $2x + 4y <= 40$.], "true": true), (body: [Nhà máy có thể sản xuất 10 SP A và 10 SP B cùng lúc.], "true": false), (body: [Hàm lợi nhuận là $F(x,y) = 3x + 5y$.], "true": true), (body: [Sản xuất toàn bộ SP A (không sx B) mang lại lợi nhuận cao nhất.], "true": true)), num: 16, loigiai: [
  #step[Bài toán tối ưu]
  - a) Số giờ làm cho A và B là $2x + 4y$. Quỹ thời gian là 40 giờ nên $2x+4y<=40$. (ĐÚNG)
  - b) Thay $(10;10)$ vào BPT: $2(10) + 4(10) = 60 > 40$. Vượt quá quỹ thời gian. (SAI)
  - c) Lợi nhuận = 3 triệu * số lượng A + 5 triệu * số lượng B. (ĐÚNG)
  - d) Giải bài toán tối ưu, miền đa giác có các đỉnh $(0;0), (20;0), (0;10)$. Lợi nhuận tại $A(20;0)$ là $F=3(20)=60$. Tại $B(0;10)$ là $F=5(10)=50$. Việc dồn toàn bộ giờ sx A mang về max $F=60$. (ĐÚNG)
])

// 6 CÂU TLN
#lt-section-link("sec-luyen-tap-tln", "✍️", [VI. Bài tập: Trả lời ngắn])
#lt-tln([Có bao nhiêu cặp số nguyên dương $(x; y)$ thỏa mãn $2x + y <= 7$?], [9], num: 17, loigiai: [
  #step[Điều kiện]
  Do $x, y in ZZ^+$ nên $x >= 1, y >= 1$. Từ BPT ta có $2x <= 7 - y <= 6 arrow x <= 3$.
  
  #step[Liệt kê hệ thống]
  - Với $x = 1 arrow 2 + y <= 7 arrow y <= 5$. Có 5 giá trị $y in {1,2,3,4,5}$. (5 cặp)
  - Với $x = 2 arrow 4 + y <= 7 arrow y <= 3$. Có 3 giá trị $y in {1,2,3}$. (3 cặp)
  - Với $x = 3 arrow 6 + y <= 7 arrow y <= 1$. Có 1 giá trị $y = 1$. (1 cặp)
  Tổng cộng có $5 + 3 + 1 = 9$ cặp nghiệm.
])
#lt-tln([Một học sinh mua $x$ bút (5000đ/cái) và $y$ vở (8000đ/quyển) với số tiền không quá 40000đ. Hỏi học sinh đó có thể mua tối đa bao nhiêu quyển vở (giả sử học sinh mua ít nhất 1 cái bút, tức $x>=1$)?], [4], num: 18, loigiai: [
  #step[Mô hình Toán]
  Chi phí mua là $5000x + 8000y <= 40000 <=> 5x + 8y <= 40$. (Với $x>=1, y>=1$)
  
  #step[Tìm y lớn nhất]
  Ta rút $y$: $8y <= 40 - 5x$. 
  Để $y$ lớn nhất, ta cho $x$ nhỏ nhất. Mà $x>=1$ nên $x$ nhỏ nhất là 1.
  Thay $x=1$, ta có $8y <= 35 arrow y <= 35/8 = 4.375$.
  Vì $y$ nguyên dương nên giá trị lớn nhất của $y$ là 4.
])
#lt-tln([Tìm hoành độ giao điểm của hai đường thẳng $x + y = 3$ và $2x - y = 0$.], [1], num: 19, loigiai: [
  #step[Giải hệ phương trình]
  Tọa độ giao điểm là nghiệm của hệ phương trình:
  $ cases(x + y = 3, 2x - y = 0) $
  Cộng vế theo vế hai phương trình: $(x+y) + (2x-y) = 3+0 <=> 3x = 3 <=> x = 1$.
  Vậy hoành độ giao điểm là $1$.
])
#lt-tln([Đường thẳng $d: y = a x + b$ đi qua điểm $(2; 0)$ và $(0; -4)$. Tính $S = a + b$.], [-2], num: 20, loigiai: [
  #step[Thay điểm tìm hệ số]
  - Vì $d$ qua $(0; -4)$ nên hoành độ 0, tung độ -4 $arrow -4 = a(0) + b arrow b = -4$.
  - Vì $d$ qua $(2; 0)$ nên $0 = a(2) + b arrow 0 = 2a - 4 arrow 2a = 4 arrow a = 2$.
  
  #step[Tính tổng]
  Tổng $S = a + b = 2 + (-4) = -2$.
])
#lt-tln([Tính diện tích đa giác giới hạn bởi $x>=0, y>=0$ và $x+y<=5$.], [12.5], num: 21, loigiai: [
  #step[Vẽ miền nghiệm]
  Miền đa giác được giới hạn bởi 3 đường: trục hoành $y=0$, trục tung $x=0$, và đường thẳng $d: x+y=5$.
  Đường thẳng $d$ cắt hai trục tọa độ lần lượt tại $A(5;0)$ và $B(0;5)$.
  
  #step[Tính diện tích]
  Đa giác nghiệm chính là tam giác vuông $O A B$ vuông tại $O$.
  Độ dài các cạnh góc vuông: $O A = 5$ và $O B = 5$.
  Diện tích tam giác: $S = 1/2 O A * O B = 1/2 * 5 * 5 = 25/2 = 12.5$.
])
#lt-tln([Tìm giá trị lớn nhất của biểu thức $F(x,y) = 2x + y$ biết tọa độ $(x;y)$ thỏa mãn các điều kiện $x>=0, y>=0, x+2y<=6$.], [12], num: 22, loigiai: [
  #step[Xác định các đỉnh của đa giác miền nghiệm]
  Miền nghiệm giới hạn bởi các đường: $x=0$, $y=0$, và $x+2y=6$.
  Giao điểm của các đường tạo thành đa giác với 3 đỉnh:
  - Gốc $O(0;0)$.
  - Giao trục Ox: cho $y=0 arrow x=6 arrow A(6;0)$.
  - Giao trục Oy: cho $x=0 arrow 2y=6 arrow y=3 arrow B(0;3)$.
  
  #step[Tính hàm mục tiêu tại các đỉnh]
  - Tại $O(0;0)$: $F = 2(0) + 0 = 0$.
  - Tại $A(6;0)$: $F = 2(6) + 0 = 12$.
  - Tại $B(0;3)$: $F = 2(0) + 3 = 3$.
  So sánh các giá trị, giá trị lớn nhất là 12 (đạt được khi sản xuất toàn bộ ở phương án $A$).
])

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
