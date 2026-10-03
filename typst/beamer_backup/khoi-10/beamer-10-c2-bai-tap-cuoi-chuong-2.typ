#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

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
// PHẦN III: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-thuc-chien-tn", "🎯", [III. Thực chiến Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — BÀI TẬP CUỐI CHƯƠNG II],
  questions: (
    (num: 1, type: "TN", desc: [Điểm Không Thuộc Miền]),
    (num: 2, type: "TN", desc: [Nửa Mặt Phẳng Mở]),
    (num: 3, type: "TN", desc: [Nghiệm Của Hệ]),
    (num: 4, type: "TN", desc: [Cực Trị Tam Giác]),
    (num: 5, type: "TN", desc: [Dạng Hình Học Miền]),
    (num: 6, type: "TN", desc: [Mô Hình Dinh Dưỡng]),
    (num: 7, type: "DS", desc: [Đánh Giá Hệ Toàn Diện]),
    (num: 8, type: "TLN", desc: [Tối Đa Hóa Hàm Mục Tiêu]),
    (num: 9, type: "TLN", desc: [Tối Ưu Hóa Gốm Thủ Công]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cặp số nào sau đây *không* là nghiệm của bất phương trình $x - 2y + 4 >= 0$?],
  (
    [$(0; 0)$],
    [$(1; 2)$],
    [$(2; 4)$],
    [$(0; 3)$],
  ),
  correct: 4,
  num: 1,
  de: "Đề Tổng Ôn — Điểm Không Thuộc Miền",
  loigiai: [
    Thay tọa độ từng cặp $(x; y)$ vào vế trái $f(x, y) = x - 2y + 4$:\
    - Với $(0; 3)$: $f(0, 3) = 0 - 2(3) + 4 = -2 < 0$ (Không thỏa mãn $>= 0$).\
    Vậy cặp $(0; 3)$ *không* là nghiệm của bất phương trình.
  ]
)

#lt-tn(
  [Miền nghiệm của bất phương trình $2x + y - 4 < 0$ là nửa mặt phẳng bờ $d: 2x + y - 4 = 0$ có đặc điểm nào?],
  (
    [Chứa gốc tọa độ $O(0; 0)$, kể cả đường thẳng $d$],
    [Chứa gốc tọa độ $O(0; 0)$, không kể đường thẳng $d$],
    [Không chứa gốc tọa độ $O(0; 0)$, kể cả đường thẳng $d$],
    [Không chứa gốc tọa độ $O(0; 0)$, không kể đường thẳng $d$],
  ),
  correct: 2,
  num: 2,
  de: "Đề Tổng Ôn — Nửa Mặt Phẳng Mở",
  loigiai: [
    - Thay $O(0; 0)$ vào: $2(0) + 0 - 4 = -4 < 0$ (Đúng $arrow$ miền nghiệm *chứa $O$*).\
    - Do bất phương trình mang dấu ngặt ($<$) nên *không kể đường thẳng bờ $d$*.
  ]
)

#lt-tn(
  [Điểm nào sau đây thuộc miền nghiệm của hệ bất phương trình $cases(x + y >= 2, 2x - y <= 4, y <= 3)$?],
  (
    [$(0; 1)$],
    [$(1; 2)$],
    [$(3; 1)$],
    [$(1; 4)$],
  ),
  correct: 2,
  num: 3,
  de: "Đề Tổng Ôn — Nghiệm Của Hệ",
  loigiai: [
    Thử điểm $(1; 2)$ vào từng BPT của hệ:\
    $1 + 2 = 3 >= 2$ (Đúng); $2(1) - 2 = 0 <= 4$ (Đúng); $2 <= 3$ (Đúng).\
    Cả 3 BPT đều đúng nên $(1; 2)$ thuộc miền nghiệm của hệ.
  ]
)

#lt-tn(
  [Cho miền tam giác $A B C$ với $A(0; 2), B(4; 0), C(1; 3)$. Giá trị lớn nhất của biểu thức $F(x, y) = 4x + 3y$ trên miền tam giác $A B C$ (kể cả biên) bằng:],
  (
    [$6$],
    [$13$],
    [$16$],
    [$18$],
  ),
  correct: 3,
  num: 4,
  de: "Đề Tổng Ôn — Cực Trị Tam Giác",
  loigiai: [
    Tính giá trị của biểu thức $F(x, y) = 4x + 3y$ tại ba đỉnh:\
    $F(A) = 4(0) + 3(2) = 6$; $F(B) = 4(4) + 3(0) = 16$; $F(C) = 4(1) + 3(3) = 13$.\
    Giá trị lớn nhất là $max F = 16$ tại đỉnh $B(4; 0)$.
  ]
)

#lt-tn(
  [Hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 4, x - y >= 0)$ có miền nghiệm là một hình gì?],
  (
    [Hình tam giác vuông cân],
    [Hình chữ nhật],
    [Hình vuông],
    [Hình thang vuông],
  ),
  correct: 1,
  num: 5,
  de: "Đề Tổng Ôn — Dạng Hình Học Miền",
  loigiai: [
    Giao của $x >= 0, y >= 0, x - y >= 0, x + y <= 4$ cho miền giới hạn bởi 3 đỉnh:\
    $O(0; 0), A(4; 0), B(2; 2)$.\
    Tam giác $O A B$ vuông cân tại $B$ vì $O B^2 + A B^2 = 8 + 8 = 16 = O A^2$.
  ]
)

#lt-tn(
  [Một gia đình cần ít nhất $900$ đơn vị protein và $400$ đơn vị lipit mỗi ngày. Mỗi kg thịt bò chứa $800$ protein và $200$ lipit; mỗi kg thịt lợn chứa $600$ protein và $400$ lipit. Gọi $x, y$ lần lượt là số kg thịt bò và lợn cần mua. Hệ điều kiện là:],
  (
    [$cases(800x + 600y >= 900, 200x + 400y >= 400) quad (x, y >= 0)$],
    [$cases(800x + 600y <= 900, 200x + 400y <= 400) quad (x, y >= 0)$],
    [$cases(600x + 800y >= 900, 400x + 200y >= 400) quad (x, y >= 0)$],
    [$cases(800x + 200y >= 900, 600x + 400y >= 400) quad (x, y >= 0)$],
  ),
  correct: 1,
  num: 6,
  de: "Đề Tổng Ôn — Mô Hình Dinh Dưỡng",
  loigiai: [
    - Protein tối thiểu $900$: $800x + 600y >= 900$.\
    - Lipit tối thiểu $400$: $200x + 400y >= 400$.\
    - Khối lượng mua không âm: $x >= 0, y >= 0$. Chọn *Phương án A*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-thuc-chien-ds-tln", "📝", [IV. Bài tập Đúng/Sai & Trả lời ngắn])

#lt-ds(
  [Cho hệ BPT $cases(2x + y <= 6, x + 2y <= 6) quad (x, y >= 0)$. Xét tính Đúng / Sai:],
  (
    (body: [Miền nghiệm của hệ là một tứ giác lồi có diện tích hữu hạn.], "true": true),
    (body: [Điểm $I(2; 2)$ nằm trên cả hai đường thẳng bờ của hệ.], "true": true),
    (body: [Biểu thức $F(x, y) = x + y$ đạt giá trị lớn nhất bằng $6$ trên miền.], "true": false),
    (body: [Biểu thức $G(x, y) = 2x + 3y$ đạt giá trị lớn nhất bằng $10$ trên miền.], "true": true),
  ),
  de: "Đề Tổng Ôn — Đánh Giá Hệ Toàn Diện",
  num: 7,
  loigiai: [
    - a) *Đ:* Miền nghiệm là tứ giác lồi $O(0; 0), A(3; 0), I(2; 2), B(0; 3)$.
    - b) *Đ:* Tọa độ $I(2; 2)$ thỏa mãn $2(2) + 2 = 6$ và $2 + 2(2) = 6$.
    - c) *S:* Tại các đỉnh: $F(O)=0, F(A)=3, F(I)=4, F(B)=3 arrow max F = 4$ (không phải $6$).
    - d) *Đ:* Tính $G(x, y) = 2x + 3y$: $G(O)=0, G(A)=6, G(I)=10, G(B)=9 arrow max G = 10$.
  ]
)

#lt-tln(
  [Cho hệ bất phương trình $cases(x + y <= 5, 2x - y >= 1, x >= 0, y >= 0)$. Giá trị lớn nhất của biểu thức $F(x, y) = 3x + 2y$ trên miền nghiệm của hệ bằng bao nhiêu?],
  [15],
  num: 8,
  de: "Đề Tổng Ôn — Tối Đa Hóa Hàm Mục Tiêu",
  loigiai: [
    Miền nghiệm là tam giác với 3 đỉnh: $A(0.5; 0)$, $B(5; 0)$, $C(2; 3)$.\
    (Điểm $C$ là giao của $x + y = 5$ và $2x - y = 1$).\
    Tính giá trị $F(x, y) = 3x + 2y$ tại các đỉnh:\
    $F(A) = 3(0.5) = 1.5$; $F(B) = 3(5) = 15$; $F(C) = 3(2) + 2(3) = 12$.\
    Vậy giá trị lớn nhất là *$max F = 15$* (đạt tại đỉnh $B(5; 0)$).
  ]
)

#lt-tln(
  [Một xưởng làm $2$ loại gốm: Loại I lãi $50$ nghìn (cần $2$ giờ), loại II lãi $40$ nghìn (cần $1$ giờ). Quỹ thời gian tối đa $100$ giờ và loại II làm không quá $40$ chiếc. Tiền lãi lớn nhất xưởng đạt được là bao nhiêu *nghìn đồng*?],
  [3100],
  num: 9,
  de: "Đề Tổng Ôn — Tối Ưu Hóa Gốm Thủ Công",
  loigiai: [
    Gọi $x, y$ là số gốm loại I và II ($x, y in NN$). Ràng buộc: $cases(2x + y <= 100, y <= 40, x >= 0, y >= 0)$.\
    Miền nghiệm là tứ giác $O(0; 0), A(50; 0), B(30; 40), C(0; 40)$.\
    Lợi nhuận $L = 50x + 40y$ tại các đỉnh: $L(A)=2500; L(B)=3100; L(C)=1600$.\
    Vậy tiền lãi lớn nhất là *$3100$* nghìn đồng.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: TỔNG KẾT & THÔNG ĐIỆP SƯ PHẠM
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-chuong-2", "💎", [V. Tổng kết & Thông điệp Sư phạm])

#lt-slide-back(title: "💎 Sơ Đồ Tư Duy Hoàn Chỉnh Chương II")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. BPT BẬC NHẤT 2 ẨN]
        #v(0.2em)
        #text(size: 10pt)[
          - $a x + b y + c <= 0$.
          - Miền nghiệm: Nửa mặt phẳng.
          - Đường bờ: Nét liền hoặc nét đứt.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. HỆ BPT BẬC NHẤT 2 ẨN]
        #v(0.2em)
        #text(size: 10pt)[
          - Gồm $>= 2$ bất phương trình.
          - Miền nghiệm là giao các nửa mặt phẳng.
          - Thường tạo thành miền đa giác lồi.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. ĐIỂM THỬ MẪU MỰC]
        #v(0.2em)
        #text(size: 10pt)[
          - Ưu tiên chọn $O(0; 0)$ nếu $c != 0$.
          - Nếu bờ qua gốc, chọn $(1; 0)$ hoặc $(0; 1)$.
          - Luôn kiểm tra tính đúng/sai.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. ĐỊNH LÝ CỰC TRỊ BIÊN]
        #v(0.2em)
        #text(size: 10pt)[
          - $F(x, y) = a x + b y$ đạt $max, min$ tại đỉnh.
          - Chỉ cần thử tất cả các đỉnh biên.
          - Tiết kiệm thời gian, chính xác tuyệt đối.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. BẪY ĐIỀU KIỆN THỰC TẾ]
        #v(0.2em)
        #text(size: 10pt)[
          - Số sản phẩm, số giờ, số người: $x, y >= 0$.
          - Ẩn nguyên: $x, y in NN$.
          - Đọc kĩ từ khóa "tối đa", "ít nhất".
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. TOÁN HỌC & ĐỜI SỐNG]
        #v(0.2em)
        #text(size: 10pt)[
          - Tối ưu hóa chi phí sản xuất.
          - Tối đa hóa lợi nhuận kinh doanh.
          - Nền tảng của Khoa học Dữ liệu & AI.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG II!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Toán học không chỉ là những con số và phương trình,\nđó là tư duy chiến lược để đưa ra những quyết định tối ưu nhất."\
        Hẹn gặp lại các em ở #text(fill: rgb("#fde047"), weight: "bold")[Chương III: Hệ Thức Lượng Trong Tam Giác]!
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
