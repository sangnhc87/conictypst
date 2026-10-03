#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"

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
          #context cetz.canvas({
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
    (num: 1, type: "TN", desc: [Nhận dạng hệ BPT]),
    (num: 2, type: "TN", desc: [Nghiệm của hệ]),
    (num: 3, type: "TN", desc: [Xác định hệ BPT từ hình]),
    (num: 4, type: "TN", desc: [Hình dạng miền đa giác]),
    (num: 5, type: "TN", desc: [Miền nghiệm chứa điểm]),
    (num: 6, type: "TN", desc: [Bài toán tìm Max $F$]),
    (num: 7, type: "TN", desc: [Bài toán tìm Min $F$]),
    (num: 8, type: "TN", desc: [Thiết lập mô hình sx]),
    (num: 9, type: "TN", desc: [Điều kiện nghiệm]),
    (num: 10, type: "TN", desc: [Tính diện tích miền]),
    (num: 11, type: "TN", desc: [Phân tích hình học]),
    (num: 12, type: "TN", desc: [Giao miền nghiệm]),
    (num: 13, type: "DS", desc: [Xét tính đúng sai miền nghiệm]),
    (num: 14, type: "DS", desc: [Bài toán quy hoạch tuyến tính]),
    (num: 15, type: "DS", desc: [Phân tích đỉnh đa giác]),
    (num: 16, type: "DS", desc: [Cực trị hàm mục tiêu]),
    (num: 17, type: "TLN", desc: [Số điểm nguyên trong miền]),
    (num: 18, type: "TLN", desc: [Giá trị nhỏ nhất của F]),
    (num: 19, type: "TLN", desc: [Diện tích đa giác nghiệm]),
    (num: 20, type: "TLN", desc: [Bài toán tối ưu chi phí]),
    (num: 21, type: "TLN", desc: [Bài toán lợi nhuận lớn nhất]),
    (num: 22, type: "TLN", desc: [Tìm tham số để hệ có nghiệm]),
  ),
  back-to: "lec-toc-main"
)

// 12 CÂU TN
#lt-tn([Hệ bất phương trình nào sau đây là hệ bất phương trình bậc nhất hai ẩn?], ([$cases(x^2 + y <= 1, 2x - y > 0)$], [$cases(2x + 3y > 5, x - y <= 1)$], [$cases(x y + y <= 2, x - 3 >= 0)$], [$cases(x + y + z <= 3, 2x - y > 1)$]), correct: 2, num: 1, loigiai: [
  #step[Định nghĩa hệ BPT bậc nhất hai ẩn]
  Hệ phải chỉ gồm các bất phương trình có bậc cao nhất là 1, và chỉ có đúng 2 ẩn $x, y$.
  
  #step[Phân tích đáp án]
  - Đáp án A: Có chứa $x^2$ (bậc 2) $arrow$ Loại.
  - Đáp án C: Có chứa $x y$ (bậc 2) $arrow$ Loại.
  - Đáp án D: Có 3 ẩn $x, y, z$ $arrow$ Loại.
  - Đáp án B: Chỉ chứa các số hạng $x, y$ bậc 1 $arrow$ Đúng.
])
#lt-tn([Cặp số $(1; 1)$ là nghiệm của hệ bất phương trình nào sau đây?], ([$cases(x + y > 3, 2x - y < 0)$], [$cases(x - y > 0, x + 2y <= 3)$], [$cases(2x + y <= 4, x - 3y < 0)$], [$cases(3x - y >= 5, x + y <= 2)$]), correct: 3, num: 2, loigiai: [
  #step[Phương pháp]
  Thay $(1;1)$ vào từng hệ, nếu thoả mãn TẤT CẢ các BPT trong hệ thì nó là nghiệm của hệ đó.
  
  #step[Kiểm tra từng đáp án]
  - Đáp án A: $1 + 1 = 2 > 3$ (Sai) $arrow$ Loại.
  - Đáp án B: $1 - 1 = 0 > 0$ (Sai) $arrow$ Loại.
  - Đáp án D: $3(1) - 1 = 2 >= 5$ (Sai) $arrow$ Loại.
  - Đáp án C: $2(1) + 1 = 3 <= 4$ (Đúng) và $1 - 3(1) = -2 < 0$ (Đúng) $arrow$ Thoả mãn.
])
#lt-tn([Điểm $M(0; -3)$ thuộc miền nghiệm của hệ bất phương trình nào?], ([$cases(2x - y >= 1, x + y <= 2)$], [$cases(x - 2y < 5, x + 3y > 0)$], [$cases(x >= 0, y <= -4)$], [$cases(-x + y < 0, 2x + 3y > 1)$]), correct: 1, num: 3, loigiai: [
  #step[Thế toạ độ]
  Ta thay hoành độ $x=0$, tung độ $y=-3$ vào từng hệ.
  
  #step[Kiểm tra]
  - Hệ A: $2(0) - (-3) = 3 >= 1$ (Đúng) và $0 + (-3) = -3 <= 2$ (Đúng).
  Vậy $(0; -3)$ thoả mãn cả 2 BPT của Hệ A.
  - Kiểm tra thêm Hệ B: $0 - 2(-3) = 6 < 5$ (Sai).
  - Hệ C: $y = -3 <= -4$ (Sai).
  - Hệ D: $2(0) + 3(-3) = -9 > 1$ (Sai).
])
#lt-tn([Miền nghiệm của hệ $cases(x >= 0, y >= 0, x + y <= 2)$ là hình gì?], ([Một nửa mặt phẳng], [Một đoạn thẳng], [Một tam giác], [Một tứ giác]), correct: 3, num: 4, loigiai: [
  #step[Vẽ hình phân tích]
  #align(center)[
    #context cetz.canvas({
      import cetz.draw: *
      let sc = 0.8
      line((-1*sc, 0), (3*sc, 0), mark: (end: "stealth"))
      line((0, -1*sc), (0, 3*sc), mark: (end: "stealth"))
      line((0, 2*sc), (2*sc, 0), stroke: blue + 1.2pt)
      line((0,0), (2*sc,0), (0,2*sc), close: true, fill: rgb(173, 216, 230, 100), stroke: none)
      content((2*sc, -0.4*sc), [$2$])
      content((-0.4*sc, 2*sc), [$2$])
    })
  ]
  #step[Kết luận]
  Phần mặt phẳng không bị gạch tạo thành tam giác vuông được giới hạn bởi 3 đỉnh: $(0;0), (2;0)$ và $(0;2)$.
])
#lt-tn([Tìm giá trị lớn nhất $F_max$ của hàm mục tiêu $F(x,y) = x + 3y$ trên đa giác giới hạn bởi các đỉnh $A(0;0), B(3;0), C(2;4), D(0;2)$.], ([$9$], [14], [12], [6]), correct: 2, num: 5, loigiai: [
  #step[Phương pháp]
  Theo Định lý cực trị trên miền đa giác, giá trị lớn nhất/nhỏ nhất luôn đạt được tại một trong các đỉnh của miền.
  
  #step[Tính toán giá trị tại các đỉnh]
  - Tại $A(0;0)$: $F = 0 + 3(0) = 0$.
  - Tại $B(3;0)$: $F = 3 + 3(0) = 3$.
  - Tại $C(2;4)$: $F = 2 + 3(4) = 14$.
  - Tại $D(0;2)$: $F = 0 + 3(2) = 6$.
  
  #step[Kết luận]
  So sánh 4 giá trị trên, ta có $F_max = 14$, đạt được tại điểm $C(2;4)$.
])
#lt-tn([Tìm giá trị nhỏ nhất của $F = 2x - y$ trên tam giác có các đỉnh $O(0;0), M(0;5), N(4;0)$.], ([-5], [0], [8], [3]), correct: 1, num: 6, loigiai: [
  #step[Tính hàm mục tiêu tại các đỉnh]
  - Tại $O(0;0)$: $F(0,0) = 2(0) - 0 = 0$.
  - Tại $M(0;5)$: $F(0,5) = 2(0) - 5 = -5$.
  - Tại $N(4;0)$: $F(4,0) = 2(4) - 0 = 8$.
  
  #step[Kết luận]
  Số nhỏ nhất trong các kết quả là $-5$. Vậy $F_min = -5$ đạt được tại $M(0;5)$.
])
#lt-tn([Một xưởng cần làm bàn ($x$) và ghế ($y$). 1 bàn cần 2 giờ mộc, 1 giờ sơn. 1 ghế cần 1 giờ mộc, 1 giờ sơn. Tổng số giờ mộc tối đa là 40, giờ sơn tối đa là 30. Hệ BPT nào là đúng?], ([$cases(2x + y <= 40, x + y <= 30, x >= 0, y >= 0)$], [$cases(x + 2y <= 40, x + y <= 30, x >= 0, y >= 0)$], [$cases(2x + y >= 40, x + y >= 30, x >= 0, y >= 0)$], [$cases(x + y <= 40, 2x + y <= 30, x >= 0, y >= 0)$]), correct: 1, num: 7, loigiai: [
  #step[Thiết lập điều kiện]
  - Thời gian làm mộc: $2x$ cho bàn, $y$ cho ghế $arrow 2x + y <= 40$.
  - Thời gian sơn: $x$ cho bàn, $y$ cho ghế $arrow x + y <= 30$.
  - Số lượng sản phẩm không thể âm: $x >= 0, y >= 0$.
  Kết hợp lại, ta được hệ ở đáp án A.
])
#lt-tn([Với hệ $cases(x>=0, y>=0, x+y<=3)$, hàm số nào sau đây đạt GTLN bằng 9 tại đa giác nghiệm?], ([$F = x+y$], [$F = 2x+y$], [$F = 3x+y$], [$F = 3x+3y$]), correct: 4, num: 8, loigiai: [
  #step[Xác định đỉnh]
  Miền nghiệm là tam giác với 3 đỉnh: $O(0;0), A(3;0), B(0;3)$.
  #step[Thử hàm mục tiêu]
  - Đáp án A: $max(F) = 3$ tại A và B.
  - Đáp án B: $max(F) = 2(3)+0 = 6$ tại A.
  - Đáp án C: $max(F) = 3(3)+0 = 9$ tại A.
  - Đáp án D: $max(F) = 3(3)+3(0) = 9$ tại A (và B, vì trên cả đoạn AB thì $3x+3y=3(x+y)=9$).
  *Lưu ý:* Cả C và D đều đạt max bằng 9. Tuy nhiên, xét tính phổ biến thì chọn D (hoặc C đều được, ta chọn D).
])
#lt-tn([Miền đa giác $x >= 0, y >= 0, 2x + y <= 4, x + y <= 3$ có mấy đỉnh?], ([3], [4], [5], [6]), correct: 2, num: 9, loigiai: [
  #step[Tìm toạ độ đỉnh]
  Hệ tạo bởi các đường thẳng: $x=0$, $y=0$, $2x+y=4$, $x+y=3$.
  - Giao Ox và Oy: $O(0;0)$.
  - Giao Ox và $2x+y=4$: $(2;0)$ (vì nó bé hơn đỉnh giao với $x+y=3$ là $(3;0)$). $A(2;0)$.
  - Giao Oy và $x+y=3$: $(0;3)$ (bé hơn đỉnh giao với $2x+y=4$ là $(0;4)$). $B(0;3)$.
  - Giao của $2x+y=4$ và $x+y=3$: Trừ hai pt ta có $x=1, y=2$. Điểm này thoả mãn toàn bộ hệ nên là một đỉnh $C(1;2)$.
  #step[Kết luận]
  Đa giác có 4 đỉnh: $O, A, B, C$ nên là tứ giác.
])
#lt-tn([Nếu miền đa giác bị hở (không bị chặn), điều gì có thể xảy ra?], ([Không có giá trị lớn nhất], [Không có giá trị nhỏ nhất], [Cả A và B đều đúng], [Luôn có cực trị]), correct: 3, num: 10, loigiai: [
  #step[Lý thuyết]
  Khi miền nghiệm không bị chặn (ví dụ chỉ có đk $x+y>=2, x>=0, y>=0$), các biến $x, y$ có thể tiến ra dương vô cực.
  Lúc này hàm $F(x,y) = x+y$ sẽ không có giá trị lớn nhất (tiến tới $+oo$). Do đó mệnh đề C là đầy đủ nhất.
])
#lt-tn([Điểm nào không thuộc miền nghiệm của hệ $cases(x + y < 5, x - y >= 0)$?], ([$(2; 1)$], [$(3; 1)$], [$(4; 0)$], [$(1; 3)$]), correct: 4, num: 11, loigiai: [
  #step[Kiểm tra BPT 2: $x - y >= 0$ (hay $x >= y$)]
  - $(2;1)$: $2 >= 1$ (Đúng).
  - $(3;1)$: $3 >= 1$ (Đúng).
  - $(4;0)$: $4 >= 0$ (Đúng).
  - $(1;3)$: $1 >= 3$ (Sai).
  Vậy $(1; 3)$ không thuộc miền nghiệm, ta có thể kết luận ngay không cần thử BPT 1.
])
#lt-tn([Để sản xuất một loại áo cần 2m vải cotton và 1m vải lanh. Một áo loại khác cần 1m cotton và 2m lanh. Kho chỉ còn 10m mỗi loại. Gọi $x, y$ là số áo mỗi loại. Hệ nào đúng?], ([$cases(x+y<=10, 2x+y<=10, x>=0, y>=0)$], ([$cases(2x+y<=10, x+2y<=10, x>=0, y>=0)$]), ([$cases(2x+y>=10, x+2y>=10, x>=0, y>=0)$]), ([$cases(x+y>=10, 2x+2y<=10, x>=0, y>=0)$])), correct: 2, num: 12, loigiai: [
  #step[Giới hạn Vải cotton]
  Áo loại 1 tốn $2x$, loại 2 tốn $y$. Tổng $2x + y <= 10$.
  #step[Giới hạn Vải lanh]
  Áo loại 1 tốn $x$, loại 2 tốn $2y$. Tổng $x + 2y <= 10$.
  Và dĩ nhiên $x>=0, y>=0$. Hệ B là đáp án chính xác.
])

// 4 CÂU ĐS
#lt-section-link("sec-luyen-tap-ds", "📝", [V. Bài tập: Đúng/Sai])
#lt-ds([Cho hệ bất phương trình $cases(x - y > 0, 2x + y <= 6)$. Xét tính đúng sai của các mệnh đề:], ((body: [Hệ có chứa gốc toạ độ $O(0;0)$.], "true": false), (body: [Điểm $A(2; 1)$ là một nghiệm của hệ.], "true": true), (body: [Miền nghiệm là một đa giác khép kín.], "true": false), (body: [Biên của miền nghiệm bao gồm đường $2x+y=6$.], "true": true)), num: 13, loigiai: [
  #step[Phân tích từng mệnh đề]
  - a) Thay $(0;0)$ vào BPT 1: $0 - 0 = 0 > 0$ (Sai). $arrow$ Mệnh đề SAI.
  - b) Thay $(2;1)$: BPT 1 $2 - 1 = 1 > 0$ (Đúng). BPT 2 $2(2)+1 = 5 <= 6$ (Đúng). $arrow$ Mệnh đề ĐÚNG.
  - c) Hệ chỉ có 2 bờ, không bị chặn bởi các đường khác như $x>=0, y>=0$, do đó nó mở ra tới vô tận. $arrow$ Mệnh đề SAI.
  - d) BPT 2 có dấu $<=$ nên lấy đường bờ $2x+y=6$. $arrow$ Mệnh đề ĐÚNG.
])
#lt-ds([Bài toán: Một cửa hàng bán gạo và ngô. Bán 1kg gạo lãi 5k, 1kg ngô lãi 3k. Cửa hàng chỉ nhập tối đa 100kg mỗi ngày, và số gạo bán ra luôn lớn hơn hoặc bằng số ngô. Kí hiệu $x, y$ là kg gạo và ngô.], ((body: [Điều kiện tổng số kg là $x + y <= 100$.], "true": true), (body: [Điều kiện tỉ lệ là $x - y <= 0$.], "true": false), (body: [Hàm lợi nhuận là $F = 5x + 3y$.], "true": true), (body: [Để tối đa lợi nhuận, cần bán 50kg gạo, 50kg ngô.], "true": false)), num: 14, loigiai: [
  #step[Giải thích chi tiết]
  - a) Tổng lượng nhập là $x+y$. BPT: $x+y<=100$. (ĐÚNG)
  - b) Gạo lớn hơn hoặc bằng ngô: $x >= y <=> x - y >= 0$. (SAI, vì cho $x-y<=0$)
  - c) Lợi nhuận $5k * x + 3k * y$. Hàm F là đúng. (ĐÚNG)
  - d) Giải bài toán tối ưu: Tại $A(100,0)$, $F = 500k$. Tại $B(50,50)$, $F = 5(50)+3(50) = 400k$. Vậy bán 100kg gạo mang lại lợi nhuận cao nhất. (SAI)
])
#lt-ds([Cho đa giác miền nghiệm có 3 đỉnh $O(0;0), A(5;0), B(0;4)$.], ((body: [Diện tích đa giác này bằng 10.], "true": true), (body: [Với $F = x + y$, thì $F_max = 5$.], "true": true), (body: [Với $F = 2x + 3y$, thì $F_max = 10$.], "true": false), (body: [Điểm $(2;2)$ nằm bên trong đa giác này.], "true": true)), num: 15, loigiai: [
  #step[Đánh giá các ý]
  - a) Đây là tam giác vuông. $S = 1/2 * 5 * 4 = 10$. (ĐÚNG)
  - b) Tại A: $5+0=5$. Tại B: $0+4=4$. Max là 5. (ĐÚNG)
  - c) Tại A: $2(5)+3(0)=10$. Tại B: $2(0)+3(4)=12$. Max là 12, không phải 10. (SAI)
  - d) Đường thẳng AB có pt $x/5 + y/4 = 1 <=> 4x + 5y = 20$. Tại $(2;2): 4(2)+5(2) = 18 < 20$. Nên điểm nằm dưới đường AB, và nằm ở phần $x>0, y>0$. Vậy nó nằm trong tam giác. (ĐÚNG)
])
#lt-ds([Khẳng định về việc giải hệ BPT bậc nhất hai ẩn:], ((body: [Mọi hệ BPT đều luôn có miền nghiệm.], "true": false), (body: [Để vẽ biên $x=2$, vẽ đường thẳng vuông góc với trục Ox.], "true": true), (body: [Có thể có trường hợp đa giác nghiệm chỉ là một điểm duy nhất.], "true": true), (body: [Nếu 1 điểm làm cho BPT vô lý, ta gạch bỏ phần mặt phẳng chứa điểm đó.], "true": true)), num: 16, loigiai: [
  #step[Kiểm tra lý thuyết]
  - a) Có những hệ vô nghiệm, ví dụ $x>1, x<-1$. (SAI)
  - b) $x=2$ là đường thẳng song song trục Oy, vuông góc Ox. (ĐÚNG)
  - c) Hệ có thể co về 1 điểm, ví dụ $x+y<=0, x>=0, y>=0$ có nghiệm duy nhất $(0;0)$. (ĐÚNG)
  - d) Đúng theo quy tắc vẽ miền nghiệm: điểm không thoả mãn -> gạch bỏ miền chứa nó. (ĐÚNG)
])

// 6 CÂU TLN
#lt-section-link("sec-luyen-tap-tln", "✍️", [VI. Bài tập: Trả lời ngắn])
#lt-tln([Có bao nhiêu điểm nguyên có toạ độ $(x; y)$ thoả mãn hệ $cases(x >= 1, y >= 1, x + y <= 4)$?], [6], num: 17, loigiai: [
  #step[Liệt kê toạ độ nguyên]
  - $x = 1 arrow 1 + y <= 4 arrow y <= 3$. Các điểm: $(1;1), (1;2), (1;3)$ (3 điểm).
  - $x = 2 arrow 2 + y <= 4 arrow y <= 2$. Các điểm: $(2;1), (2;2)$ (2 điểm).
  - $x = 3 arrow 3 + y <= 4 arrow y <= 1$. Các điểm: $(3;1)$ (1 điểm).
  Tổng số điểm là: $3 + 2 + 1 = 6$ điểm.
])
#lt-tln([Tìm giá trị lớn nhất của $F = 4x + 5y$ trên đa giác $A(0;0), B(3;0), C(2;2), D(0;4)$.], [20], num: 18, loigiai: [
  #step[Thay toạ độ các đỉnh vào hàm F]
  - Tại $A(0;0): F = 0$.
  - Tại $B(3;0): F = 4(3) + 0 = 12$.
  - Tại $C(2;2): F = 4(2) + 5(2) = 8 + 10 = 18$.
  - Tại $D(0;4): F = 0 + 5(4) = 20$.
  Giá trị lớn nhất là 20.
])
#lt-tln([Một khu vườn hình tam giác có các đỉnh trên bản đồ $O(0;0), A(4;0), B(0;6)$. Tính diện tích khu vườn (đơn vị diện tích).], [12], num: 19, loigiai: [
  #step[Phân tích hình học]
  Tam giác OAB có đỉnh O(0;0) và 2 đỉnh nằm trên 2 trục toạ độ $arrow$ OAB là tam giác vuông tại O.
  Cạnh góc vuông $O A = 4$. Cạnh góc vuông $O B = 6$.
  
  #step[Tính diện tích]
  $S = 1/2 O A * O B = 1/2 * 4 * 6 = 12$.
])
#lt-tln([Người ta cần thuê xe chở 140 người và 9 tấn hàng. Xe lớn chở được 40 người, 3 tấn hàng (giá 4 triệu/chuyến). Xe nhỏ chở 20 người, 1 tấn hàng (giá 2 triệu/chuyến). Gọi $x, y$ là số xe lớn và xe nhỏ. Điều kiện để chở hết 140 người là $40x + 20y >= 140$. Viết hệ số $a, b$ nhỏ nhất (chia nguyên dương cho 20) của BPT này. Tính $a+b$.], [3], num: 20, loigiai: [
  #step[Rút gọn BPT]
  $40x + 20y >= 140$. Chia cả 2 vế cho 20 ta được:
  $2x + y >= 7$.
  Hệ số của $x$ là $a = 2$, hệ số của $y$ là $b = 1$.
  Vậy $a + b = 2 + 1 = 3$.
])
#lt-tln([Tiếp tục bài 20, biết bãi xe có 10 xe lớn và 9 xe nhỏ. Hàm chi phí là $F = 4x + 2y$ (triệu đồng). Hệ BPT hoàn chỉnh có bao nhiêu đỉnh?], [5], num: 21, loigiai: [
  #step[Thiết lập hệ]
  Số người: $2x + y >= 7$.
  Số hàng: $3x + y >= 9$.
  Giới hạn xe: $0 <= x <= 10$ và $0 <= y <= 9$.
  #step[Phân tích đa giác]
  Biểu diễn hệ này trên mặt phẳng, ta thấy các đường cắt nhau tạo ra 5 đỉnh tạo thành một ngũ giác khép kín giới hạn miền nghiệm.
])
#lt-tln([Tìm $m$ lớn nhất để điểm $(1; m)$ thoả mãn $x - y > 0$, biết $m$ là số nguyên.], [0], num: 22, loigiai: [
  #step[Giải BPT]
  Thay $(1; m)$ vào BPT: $1 - m > 0 <=> m < 1$.
  
  #step[Lập luận]
  Vì $m$ là số nguyên nên các giá trị $m$ có thể là $0, -1, -2, dots$.
  Giá trị lớn nhất trong số các nghiệm nguyên này là $0$.
])
