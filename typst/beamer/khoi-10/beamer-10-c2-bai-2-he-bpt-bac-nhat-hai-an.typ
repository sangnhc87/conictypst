#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Hệ Bất Phương Trình Bậc Nhất Hai Ẩn],
  subtitle: [TOÁN 10 — CHƯƠNG II: MIỀN ĐA GIÁC & BÀI TOÁN QUY HOẠCH TUYẾN TÍNH],
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
// MỤC LỤC BÀI DẠY
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG BÀI HỌC])

// ════════════════════════════════════════════════
// PHẦN I: KHỞI ĐỘNG VÀ BÀI TOÁN KINH TẾ
// ════════════════════════════════════════════════
#lt-section-link("sec-khoi-dong-kinh-te", "🏭", [I. Khởi động: Bài toán Sản xuất])

#lt-slide-back(title: "🏭 Tình Huống Thực Tế: Xưởng Mộc Gia Truyền")[
  #lt-two-col(
    ratio: (56%, 44%),
    [
      #lt-definition(title: "Bài toán")[
        Xưởng mộc sản xuất hai loại sản phẩm: Bàn ($x$) và Ghế ($y$).
        - Nguyên liệu gỗ: Mỗi bàn cần $2 m^2$, mỗi ghế cần $1 m^2$; kho có tối đa $8 m^2$.
        - Giờ công thợ: Mỗi bàn cần $1$ giờ, mỗi ghế cần $2$ giờ; quỹ công tối đa $10$ giờ.
        - Điều kiện tự nhiên: $x >= 0, y >= 0$.
      ]
      #v(0.2em)
      #lt-important(title: "Mô hình Hệ Bất Phương Trình")[
        $ cases(2x + y <= 8, x + 2y <= 10, x >= 0, y >= 0) $
      ]
    ],
    [
      #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[❓ Vấn đề thực tiễn:]
        #v(0.3em)
        - Làm sao tìm được tất cả các phương án $(x, y)$ khả thi?
        - Nếu mỗi bàn lãi *300.000 đ*, mỗi ghế lãi *200.000 đ*, xưởng nên đóng bao nhiêu chiếc mỗi loại để *lãi lớn nhất*?
        #v(0.3em)
        #text(fill: rgb("#16a34a"), weight: "bold")[👉 Đó chính là bài toán Quy hoạch tuyến tính!]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: ĐỊNH NGHĨA VÀ MIỀN NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia-he", "📐", [II. Khái niệm Hệ BPT Bậc nhất Hai ẩn])

#lt-slide-back(title: "📐 Định Nghĩa Hệ BPT Bậc Nhất Hai Ẩn")[
  #lt-definition(title: "Định nghĩa")[
    *Hệ bất phương trình bậc nhất hai ẩn* là một hệ gồm hai hay nhiều bất phương trình bậc nhất hai ẩn $x, y$.
  ]
  #v(0.3em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Nghiệm Của Hệ]
        #v(0.25em)
        - Cặp số $(x_0; y_0)$ là *nghiệm của hệ* nếu nó đồng thời là nghiệm của *tất cả* các BPT trong hệ.
        - Ví dụ: Cặp $(1; 2)$ thỏa mãn $cases(x + y <= 4, x - y >= -2)$ nên là một nghiệm của hệ.
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#9333ea"), size: 12pt)[2. Miền Nghiệm Của Hệ]
        #v(0.25em)
        - Là tập hợp các điểm trên $O x y$ có tọa độ là nghiệm của hệ.
        - Về hình học: Là *giao các miền nghiệm* của từng bất phương trình thành phần.
      ]
    ]
  )
]

#lt-slide-back(title: "📈 Quy Trình Biểu Diễn Miền Nghiệm Của Hệ")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[Bước 1: Vẽ Tất Cả Bờ]
        #v(0.3em)
        Trên cùng hệ trục tọa độ $O x y$, vẽ tất cả các đường thẳng bờ của các BPT trong hệ.
        - Phân biệt nét liền ($<=, >=$) và nét đứt ($<, >$).
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[Bước 2: Gạch Bỏ Từng Miền]
        #v(0.3em)
        Với mỗi BPT, dùng điểm thử để xác định miền không phải nghiệm và *gạch sọc bỏ đi*.
        - Lần lượt gạch cho đến BPT cuối cùng.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12pt)[Bước 3: Kết Luận Đa Giác]
        #v(0.3em)
        Phần mặt phẳng *trắng* (không bị gạch) chính là miền nghiệm của hệ.
        - Thường là một miền đa giác (tam giác, tứ giác) lồi hoặc không bị chặn.
      ]
    ]
  )
]

#lt-slide-back(title: "📈 Minh Họa Miền Nghiệm Tam Giác")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #block(fill: white, stroke: 1.2pt + rgb("#2563eb"), inset: 9pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[Ví dụ: Xác định miền nghiệm]
        $ cases(x >= 0, y >= 0, x + y <= 3) $
        - $x >= 0$: Nửa mặt phẳng bên phải trục tung $O y$.
        - $y >= 0$: Nửa mặt phẳng phía trên trục hoành $O x$.
        - $x + y <= 3$: Nửa mặt phẳng bờ $x + y = 3$ chứa gốc $O(0, 0)$.
        #v(0.2em)
        #text(fill: rgb("#16a34a"), weight: "bold")[👉 Miền nghiệm là miền tam giác vuông $O A B$ với $O(0; 0), A(3; 0), B(0; 3)$ (kể cả biên).]
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Miền Tam Giác OAB]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            let sc = 0.8
            // Lưới toạ độ
            for x in range(-1, 5) { line((x*sc, -1*sc), (x*sc, 4*sc), stroke: 0.25pt + rgb("#e2e8f0")) }
            for y in range(-1, 5) { line((-1*sc, y*sc), (4.5*sc, y*sc), stroke: 0.25pt + rgb("#e2e8f0")) }

            // Tô màu miền nghiệm tam giác OAB
            line((0, 0), (3*sc, 0), (0, 3*sc), close: true, fill: rgb(59, 130, 246, 30%), stroke: none)

            // Gạch sọc x < 0
            for k in range(-4, 0) {
              line((k*0.35, -1*sc), (k*0.35 + 1.5*sc, 4*sc), stroke: 0.35pt + rgb("#cbd5e1"))
            }

            // Trục Ox, Oy
            line((-1*sc, 0), (4.5*sc, 0), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((4.7*sc, 0), text(size: 9pt, weight: "bold")[$x$])
            line((0, -1*sc), (0, 4.2*sc), mark: (end: "stealth", fill: black), stroke: 0.9pt + black)
            content((0, 4.4*sc), text(size: 9pt, weight: "bold")[$y$])
            content((-0.25*sc, -0.25*sc), text(size: 9pt)[$O$])

            // Đường bờ x + y = 3
            line((-0.5*sc, 3.5*sc), (3.5*sc, -0.5*sc), stroke: 1.5pt + rgb("#2563eb"))

            // Đỉnh A, B
            circle((3*sc, 0), radius: 2.2pt, fill: rgb("#dc2626"))
            content((3*sc, -0.35*sc), text(fill: rgb("#dc2626"), size: 8.5pt, weight: "bold")[$A(3; 0)$])
            circle((0, 3*sc), radius: 2.2pt, fill: rgb("#dc2626"))
            content((-0.5*sc, 3*sc), text(fill: rgb("#dc2626"), size: 8.5pt, weight: "bold")[$B(0; 3)$])
          })
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TOÁN TỐI ƯU HÓA (QUY HOẠCH TUYẾN TÍNH)
// ════════════════════════════════════════════════
#lt-section-link("sec-quy-hoach-tuyen-tinh", "💎", [III. Bài toán Quy hoạch tuyến tính])

#lt-slide-back(title: "💎 Định Lý Cực Trị Trên Miền Đa Giác")[
  #lt-theorem(title: "Định lý Giá trị Cực trị")[
    Cho hệ BPT bậc nhất hai ẩn có miền nghiệm là một đa giác $A_1 A_2 dots A_n$.
    Giá trị lớn nhất và giá trị nhỏ nhất của biểu thức mục tiêu:
    $ F(x, y) = a x + b y $
    (với $a, b$ là hằng số) trên miền nghiệm luôn đạt được tại *ít nhất một trong các đỉnh* $A_1, A_2, dots, A_n$ của đa giác đó!
  ]
  #v(0.3em)
  #lt-important(title: "Thuật toán 3 bước thần tốc giải bài toán tối ưu")[
    1. *Bước 1:* Tìm tọa độ tất cả các đỉnh $A_1, A_2, dots, A_n$ của miền đa giác (bằng cách giải hệ 2 phương trình đường biên tương ứng).
    2. *Bước 2:* Tính giá trị của biểu thức mục tiêu $F$ tại từng đỉnh: $F(A_1), F(A_2), dots, F(A_n)$.
    3. *Bước 3:* So sánh các giá trị: Số lớn nhất là $max F$, số nhỏ nhất là $min F$.
  ]
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [IV. Bài tập: Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — HỆ BẤT PHƯƠNG TRÌNH BẬC NHẤT HAI ẨN],
  questions: (
    (num: 1, type: "TN", desc: [Nhận dạng Hệ BPT]),
    (num: 2, type: "TN", desc: [Nghiệm của Hệ]),
    (num: 3, type: "TN", desc: [Hình dạng Miền nghiệm]),
    (num: 4, type: "TN", desc: [Cực trị Hàm Mục Tiêu]),
    (num: 5, type: "TN", desc: [Giá trị Nhỏ nhất Tứ giác]),
    (num: 6, type: "TN", desc: [Mô hình Hóa Thực Tế]),
    (num: 7, type: "DS", desc: [Đúng/Sai Toàn diện Hệ]),
    (num: 8, type: "TLN", desc: [Cực Đại Lợi Nhuận]),
    (num: 9, type: "TLN", desc: [Tối Ưu Hóa May Mặc Thực Tế]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Hệ bất phương trình nào sau đây là hệ bất phương trình bậc nhất hai ẩn?],
  (
    [$cases(x^2 + y <= 1, 2x - y > 0)$],
    [$cases(2x + 3y > 5, x - y <= 1)$],
    [$cases(x y + y <= 2, x - 3 >= 0)$],
    [$cases(x + y + z <= 3, 2x - y > 1)$],
  ),
  correct: 2,
  num: 1,
  de: "Đề 04A — Nhận dạng Hệ BPT",
  loigiai: [
    Chỉ có *Hệ B* gồm các BPT bậc nhất hai ẩn $x, y$ (bậc 1, không chứa ẩn ở mẫu hay tích).\
    Các hệ khác vi phạm: A có $x^2$, C có tích $x y$, D có 3 ẩn ($x, y, z$).
  ]
)

#lt-tn(
  [Cặp số $(x; y) = (1; 1)$ là nghiệm của hệ bất phương trình nào sau đây?],
  (
    [$cases(x + y > 3, 2x - y < 0)$],
    [$cases(x - y > 0, x + 2y <= 3)$],
    [$cases(2x + y <= 4, x - 3y < 0)$],
    [$cases(3x - y >= 5, x + y <= 2)$],
  ),
  correct: 3,
  num: 2,
  de: "Đề 04A — Nghiệm của Hệ",
  loigiai: [
    Thay $(x; y) = (1; 1)$ vào từng hệ:\
    - Hệ A: $1 + 1 = 2 > 3$ (Sai).\
    - Hệ B: $1 - 1 = 0 > 0$ (Sai).\
    - Hệ C: $cases(2(1) + 1 = 3 <= 4 text(" (Đúng)"), 1 - 3(1) = -2 < 0 text(" (Đúng)"))$ $arrow$ *(Thỏa mãn)*.\
    - Hệ D: $3(1) - 1 = 2 >= 5$ (Sai).
  ]
)

#lt-tn(
  [Miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x <= 4, y <= 3)$ là hình gì?],
  (
    [Hình tam giác],
    [Hình chữ nhật],
    [Hình thang vuông],
    [Một miền không bị chặn],
  ),
  correct: 2,
  num: 3,
  de: "Đề 04B — Hình dạng Miền nghiệm",
  loigiai: [
    Hệ tương đương $0 <= x <= 4$ và $0 <= y <= 3$.\
    Giao của hai dải mặt phẳng này là hình chữ nhật có 4 đỉnh $(0; 0), (4; 0), (4; 3), (0; 3)$.
  ]
)

#lt-tn(
  [Cho miền nghiệm là miền tam giác giới hạn bởi ba đỉnh $O(0; 0), A(2; 0), B(0; 3)$. Giá trị lớn nhất của biểu thức $F(x, y) = 3x + 2y$ trên miền nghiệm bằng:],
  (
    [$0$],
    [$6$],
    [$8$],
    [$9$],
  ),
  correct: 2,
  num: 4,
  de: "Đề 04B — Cực trị Hàm Mục Tiêu",
  loigiai: [
    Tính giá trị của $F(x, y) = 3x + 2y$ tại 3 đỉnh của tam giác:\
    - Tại $O(0; 0): F(0, 0) = 0$.\
    - Tại $A(2; 0): F(2, 0) = 3(2) + 2(0) = 6$; Tại $B(0; 3): F(0, 3) = 6$.\
    Vậy giá trị lớn nhất là $max F = 6$ (đạt tại cả $A$ và $B$).
  ]
)

#lt-tn(
  [Cho miền đa giác lồi có 4 đỉnh $A(1; 1), B(4; 1), C(3; 4), D(1; 3)$. Giá trị nhỏ nhất của biểu thức $F(x, y) = 2x - y$ trên miền tứ giác $A B C D$ bằng:],
  (
    [$-1$],
    [$0$],
    [$1$],
    [$2$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 04C — Giá trị Nhỏ nhất Tứ giác",
  loigiai: [
    Tính $F(x, y) = 2x - y$ tại 4 đỉnh:
    $F(A) = 1$; $F(B) = 7$; $F(C) = 2$; $F(D) = -1$.\
    Giá trị nhỏ nhất là $min F = -1$ tại đỉnh $D(1; 3)$.
  ]
)

#lt-tn(
  [Một công ty cần thuê xe chở $140$ người và $9$ tấn hàng. Nơi cho thuê có hai loại xe: Xe lớn (chở 20 người, 0.6 tấn hàng) và xe nhỏ (chở 10 người, 1.5 tấn hàng). Gọi $x, y$ lần lượt là số xe lớn và nhỏ cần thuê. Hệ BPT nào biểu diễn bài toán?],
  (
    [$cases(20x + 10y <= 140, 0.6x + 1.5y <= 9) quad (x, y >= 0)$],
    [$cases(20x + 10y >= 140, 0.6x + 1.5y >= 9) quad (x, y >= 0)$],
    [$cases(10x + 20y >= 140, 1.5x + 0.6y >= 9) quad (x, y >= 0)$],
    [$cases(20x + 0.6y >= 140, 10x + 1.5y >= 9) quad (x, y >= 0)$],
  ),
  correct: 2,
  num: 6,
  de: "Đề 04C — Mô hình Hóa Thực Tế",
  loigiai: [
    - Chở ít nhất $140$ người: $20x + 10y >= 140$; chở ít nhất $9$ tấn hàng: $0.6x + 1.5y >= 9$.\
    - Số xe không âm: $x >= 0, y >= 0$ ($x, y in NN$). Chọn *Phương án B*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & ĐIỀN SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho hệ BPT $cases(x + y <= 4, 2x - y <= 2) quad (x, y >= 0)$. Xét tính Đúng / Sai:],
  (
    (body: [Miền nghiệm là miền tứ giác lồi bị chặn.], "true": true),
    (body: [Giao điểm 2 đường bờ $x + y = 4$ và $2x - y = 2$ là $(2; 2)$.], "true": true),
    (body: [Điểm $M(1; 3)$ không thuộc miền nghiệm của hệ.], "true": false),
    (body: [Giá trị lớn nhất của $F(x, y) = 3x + y$ trên miền bằng $8$.], "true": true),
  ),
  de: "Đề 04D — Đúng/Sai Toàn diện Hệ",
  num: 7,
  loigiai: [
    - a) *Đ:* Miền nghiệm là tứ giác $O(0; 0), A(1; 0), B(2; 2), C(0; 4)$.
    - b) *Đ:* Giải hệ $x+y=4$ và $2x-y=2$ được $B(2; 2)$.
    - c) *S:* Thay $M(1; 3)$: $1+3 <= 4$ và $2(1)-3 <= 2$ (thỏa mãn) $arrow$ $M$ thuộc miền.
    - d) *Đ:* $F(O)=0, F(A)=3, F(B)=8, F(C)=4 arrow max F = 8$ tại $B(2; 2)$.
  ]
)

#lt-tln(
  [Cho hệ bất phương trình $cases(x - y <= 2, 2x + y <= 8, x >= 0, y >= 0)$. Giá trị lớn nhất của biểu thức $F(x, y) = 5x + 4y$ trên miền nghiệm của hệ bằng bao nhiêu?],
  [32],
  num: 8,
  de: "Đề 04E — Cực Đại Lợi Nhuận",
  loigiai: [
    Miền nghiệm là tứ giác có 4 đỉnh: $O(0; 0), A(2; 0), B(10/3; 4/3), C(0; 8)$.\
    Tính giá trị $F = 5x + 4y$ tại các đỉnh:\
    $F(O) = 0$, $F(A) = 10$, $F(B) = 22$, $F(C) = 5(0) + 4(8) = 32$.\
    Vậy giá trị lớn nhất là *$max F = 32$* (đạt tại đỉnh $C(0; 8)$).
  ]
)

#lt-tln(
  [Một xưởng may sản xuất áo sơ mi và quần âu. Mỗi áo lãi $80$ nghìn đồng, mỗi quần lãi $100$ nghìn đồng. Do giới hạn máy móc, mỗi ngày xưởng may tối đa $50$ sản phẩm các loại và số quần không vượt quá $30$. Tiền lãi lớn nhất mà xưởng có thể thu được trong một ngày là bao nhiêu *nghìn đồng*?],
  [4600],
  num: 9,
  de: "Đề 04F — Tối Ưu Hóa May Mặc Thực Tế",
  loigiai: [
    Gọi $x, y$ là số áo và quần ($x, y in NN$). Hệ: $cases(x + y <= 50, y <= 30, x >= 0, y >= 0)$.\
    Lợi nhuận: $L = 80x + 100y$ (nghìn đồng) trên tứ giác $O(0;0), A(50;0), B(20;30), C(0;30)$.\
    Tính lãi tại các đỉnh: $L(O)=0; L(A)=4000; L(B)=4600; L(C)=3000$.\
    Lãi lớn nhất là *$4600$* nghìn đồng khi may 20 áo và 30 quần.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & THÔNG ĐIỆP SƯ PHẠM
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-he", "💎", [VI. Tổng kết Hệ BPT & Quy hoạch])

#lt-slide-back(title: "🗺️ Ma Trận Ghi Nhớ Hệ BPT & Tối Ưu Hóa")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. BẢN CHẤT HỆ BPT]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Gồm nhiều BPT bậc nhất hai ẩn.
          - Nghiệm là giao các miền nghiệm.
          - Biểu diễn trên cùng 1 hệ trục $O x y$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. HÌNH HỌC ĐA GIÁC]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Miền trắng không gạch là nghiệm.
          - Thường là tam giác hoặc tứ giác lồi.
          - Xác định chính xác các đỉnh biên.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. ĐỊNH LÝ CỰC TRỊ]
        #v(0.2em)
        #text(size: 10.5pt)[
          - $F(x, y) = a x + b y$.
          - $max F$ và $min F$ luôn đạt tại đỉnh.
          - Không cần thử các điểm bên trong!
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. THUẬT TOÁN 3 BƯỚC]
        #v(0.2em)
        #text(size: 10.5pt)[
          - 1. Giải hệ tìm các đỉnh.
          - 2. Lập bảng giá trị $F$ tại từng đỉnh.
          - 3. So sánh chọn $max, min$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. BẪY KINH ĐIỂN]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Quên điều kiện không âm ($x, y >= 0$).
          - Tính sai tọa độ giao điểm biên.
          - Miền nghiệm rỗng hoặc không bị chặn.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. QUY HOẠCH KINH TẾ]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Ứng dụng tối đa hóa lợi nhuận xưởng.
          - Tối thiểu hóa chi phí sản xuất.
          - Cơ sở của toán kinh tế hiện đại.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 2 — CHƯƠNG II!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Toán học biến những ràng buộc phức tạp thành giải pháp tối ưu cho cuộc sống."\
        Chuẩn bị chinh phục #text(fill: rgb("#fde047"), weight: "bold")[Bài Tập Cuối Chương II: Tổng Ôn & Thực Chiến]!
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
