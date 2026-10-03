#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Đại Số Tổ Hợp — Chuyên Sâu],
  subtitle: [TOÁN 10 — KỸ THUẬT XẾP CHỖ NGỒI, BUỘC KHỐI & VÁCH NGĂN],
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

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ CÁC KỸ THUẬT ĐẾM CHUYÊN SÂU])

// ════════════════════════════════════════════════
// PHẦN I: KỸ THUẬT BUỘC KHỐI
// ════════════════════════════════════════════════
#lt-section-link("sec-buoc-khoi", "📦", [I. Kỹ Thuật "Buộc Khối" (Đứng cạnh nhau)])

#lt-slide-back(title: "📦 Kỹ Thuật Buộc Khối — Khi Các Phần Tử Muốn Gắn Chặt")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Bài toán đứng cạnh nhau")[
        Có $4$ nam và $3$ nữ cần xếp thành một hàng ngang.
        Hỏi có bao nhiêu cách xếp nếu *các bạn nữ luôn đứng cạnh nhau*?
      ]
      #v(0.1em)
      #lt-theorem(title: "Thuật toán 3 bước giải quyết")[
        1. *Buộc khối:* Coi $3$ bạn nữ như *MỘT người khổng lồ* (một khối $X$).
        2. *Hoán vị toàn cục:* Bây giờ hàng có $4$ nam và $1$ khối $X$ (tổng cộng $5$ "đối tượng"). Xếp $5$ đối tượng này có $5!$ cách.
        3. *Hoán vị cục bộ:* Trong nội bộ khối $X$, $3$ bạn nữ có thể đảo chỗ cho nhau, có $3!$ cách.
        
        *Tổng số cách:* $5! times 3! = 120 times 6 = 720$ cách.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[Nguyên Lý Buộc Khối]\
        #v(0.2em)
        #text(size: 8.5pt)[
          - Khi đề bài yêu cầu "A, B, C đứng cạnh nhau", hãy trói chặt chúng lại thành 1 phần tử duy nhất.
          - Đừng quên nhân thêm giai thừa bên trong khối (trừ phi chúng giống hệt nhau).
        ]
      ]
      #v(0.2em)
      #lt-tip(title: "Lưu ý")[
        Nếu đề yêu cầu "$A$ và $B$ không đứng cạnh nhau", thường ta dùng *Phần bù*: 
        (Tổng số cách xếp tùy ý) $-$ (Số cách $A$ và $B$ đứng cạnh nhau).
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: KỸ THUẬT VÁCH NGĂN (CHÈN KHE)
// ════════════════════════════════════════════════
#lt-section-link("sec-vach-ngan", "🧱", [II. Kỹ Thuật Vách Ngăn / Chèn Khe (Không đứng cạnh nhau)])

#lt-slide-back(title: "🧱 Kỹ Thuật Chèn Khe — Cách Ly Tuyệt Đối")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Bài toán cách ly")[
        Có $5$ nam và $3$ nữ xếp thành một hàng ngang.
        Hỏi có bao nhiêu cách xếp sao cho *không có hai bạn nữ nào đứng cạnh nhau*?
      ]
      #v(0.1em)
      #lt-theorem(title: "Phương pháp Chèn Khe")[
        1. *Xếp các vách ngăn (Nam):* Xếp $5$ nam vào hàng. Có $5! = 120$ cách.
        2. *Tạo khe:* $5$ nam tạo ra $6$ khe trống (bao gồm 4 khe giữa và 2 khe hai đầu).
           $ underline("  ") N_1 underline("  ") N_2 underline("  ") N_3 underline("  ") N_4 underline("  ") N_5 underline("  ") $
        3. *Chèn khe:* Chọn $3$ khe trong $6$ khe để xếp $3$ nữ vào. Do có thứ tự nên dùng chỉnh hợp: $A_6^3 = 120$ cách.
        
        *Tổng số cách:* $5! times A_6^3 = 120 times 120 = 14,400$ cách.
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 10.5pt)[Tại sao không dùng phần bù?]\
        #v(0.2em)
        #text(size: 8.5pt)[
          Nếu lấy "Tổng" trừ đi "3 nữ đứng cạnh nhau", bạn sẽ *BỎ SÓT* trường hợp "2 nữ đứng cạnh nhau, 1 nữ đứng lẻ loi".
          Do đó, "không có bất kỳ 2 người nào đứng cạnh nhau" BẮT BUỘC dùng phương pháp chèn khe!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: XẾP BÀN TRÒN
// ════════════════════════════════════════════════
#lt-section-link("sec-ban-tron", "⭕", [III. Hoán Vị Vòng Quanh (Xếp Bàn Tròn)])

#lt-slide-back(title: "⭕ Hoán Vị Vòng Quanh — Mất Điểm Neo")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Bàn tròn không đánh số")[
        Có $n$ người xếp vào một cái bàn tròn không đánh số ghế. Có bao nhiêu cách xếp?
      ]
      #v(0.1em)
      #lt-theorem(title: "Định lý Hoán Vị Vòng Quanh")[
        Khác với hàng ngang (có đầu, có đuôi), bàn tròn không có điểm bắt đầu.
        Nếu xoay bàn tròn, vị trí tương đối giữa mọi người không đổi, nên được tính là 1 cách duy nhất.
        *Giải pháp:* Đóng băng (neo) $1$ người ở một ghế bất kỳ. Xếp $(n-1)$ người còn lại.
        *Số cách:* $ (n - 1)! $
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10.5pt)[Bài toán Vua Arthur & Hiệp sĩ]\
        #v(0.2em)
        #text(size: 8.5pt)[
          Vua Arthur và $12$ Hiệp sĩ Bàn Tròn họp mặt (tổng cộng $13$ người).
          - Số cách xếp quanh bàn tròn không đánh số: 
            $ P = (13 - 1)! = 12! = 479,001,600 $ cách.
          - Nếu Vua Arthur luôn muốn ngồi cạnh hiệp sĩ Lancelot, hãy dùng *Buộc khối* trên bàn tròn:
            1. Trói Vua và Lancelot lại (1 khối). Tổng còn 12 đối tượng.
            2. Xếp 12 đối tượng quanh bàn tròn: $(12-1)! = 11!$.
            3. Vua và Lancelot đổi chỗ: $2!$.
            *Kết quả:* $11! times 2!$.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// Luyện tập TN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [IV. Luyện Tập: Chinh Phục Tổ Hợp])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — TỔ HỢP CHUYÊN SÂU],
  questions: (
    (num: 1, type: "TN", desc: [Buộc khối sách Toán]),
    (num: 2, type: "TN", desc: [Cách ly - Nam nữ xen kẽ]),
    (num: 3, type: "TN", desc: [Xếp bàn tròn cơ bản]),
    (num: 4, type: "TN", desc: [Chụp ảnh kẹp giữa]),
    (num: 5, type: "DS", desc: [Buộc khối và Chèn khe]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Có $3$ cuốn sách Toán khác nhau, $4$ cuốn sách Lý khác nhau. Xếp $7$ cuốn sách này lên một kệ dài. Có bao nhiêu cách xếp sao cho $3$ cuốn Toán luôn nằm cạnh nhau?],
  (
    [$720$],
    [$144$],
    [$5040$],
    [$4320$],
  ),
  correct: 0,
  num: 1,
  de: "Buộc khối sách",
  loigiai: [
    - Buộc 3 cuốn Toán thành 1 khối (có $3!$ cách đổi chỗ bên trong).
    - Lúc này ta có 1 khối Toán và 4 cuốn Lý (tổng cộng 5 đối tượng). Xếp 5 đối tượng lên kệ có $5!$ cách.
    - Tổng số cách: $3! times 5! = 6 times 120 = 720$ cách.
    Chọn *A*.
  ]
)

#lt-tn(
  [Có $4$ nam và $4$ nữ. Xếp thành một hàng ngang sao cho nam nữ xếp xen kẽ nhau. Có bao nhiêu cách?],
  (
    [$1152$],
    [$576$],
    [$40320$],
    [$144$],
  ),
  correct: 0,
  num: 2,
  de: "Nam nữ xen kẽ",
  loigiai: [
    - Xếp xen kẽ có 2 mô hình: (Nam - Nữ - Nam - Nữ...) hoặc (Nữ - Nam - Nữ - Nam...).
    - Xếp 4 nam có $4!$ cách.
    - Xếp 4 nữ có $4!$ cách.
    - Có 2 mô hình, vậy tổng số cách là $2 times 4! times 4! = 2 times 24 times 24 = 1152$ cách.
    Chọn *A*.
  ]
)

#lt-tn(
  [Có $6$ người trong một gia đình (gồm bố, mẹ và $4$ người con). Xếp ngồi vào một bàn tròn không đánh số. Có bao nhiêu cách xếp sao cho Bố và Mẹ luôn ngồi cạnh nhau?],
  (
    [$48$],
    [$24$],
    [$120$],
    [$240$],
  ),
  correct: 0,
  num: 3,
  de: "Bàn tròn buộc khối",
  loigiai: [
    - Trói Bố và Mẹ thành 1 khối. Đổi chỗ Bố - Mẹ có $2!$ cách.
    - Bây giờ bàn tròn có 1 khối và 4 người con (tổng 5 đối tượng).
    - Xếp 5 đối tượng vào bàn tròn có $(5 - 1)! = 4! = 24$ cách.
    - Tổng số cách: $2! times 4! = 48$ cách.
    Chọn *A*.
  ]
)

#lt-tn(
  [Có $5$ học sinh $A, B, C, D, E$ chụp ảnh xếp hàng ngang. Hỏi có bao nhiêu cách xếp sao cho $C$ luôn đứng ở chính giữa $A$ và $B$ (không nhất thiết $A, B, C$ đứng liền kề nhau)?],
  (
    [$40$],
    [$20$],
    [$120$],
    [$60$],
  ),
  correct: 0,
  num: 4,
  de: "Hoán vị ràng buộc",
  loigiai: [
    - Tổng số cách xếp tùy ý 5 học sinh là $5! = 120$.
    - Xét 3 học sinh $A, B, C$, với mỗi vị trí 3 chỗ trống bất kỳ được chọn ra trong hàng 5 chỗ để đặt 3 bạn này, luôn có $3! = 6$ cách đổi chỗ nội bộ.
    - Trong 6 cách đó, chỉ có 2 cách thỏa mãn C nằm giữa A và B (đó là A-C-B hoặc B-C-A). Tỷ lệ thỏa mãn là $2/6 = 1/3$.
    - Do đó, số cách xếp thỏa mãn là $120 times 1/3 = 40$ cách.
    Chọn *A*.
  ]
)

#lt-ds(
  [Xếp $6$ học sinh nữ và $2$ học sinh nam thành một hàng ngang.],
  (
    [Tổng số cách xếp ngẫu nhiên là $40320$.],
    [Số cách xếp sao cho $2$ học sinh nam luôn đứng cạnh nhau là $10080$.],
    [Số cách xếp sao cho $2$ học sinh nam không đứng cạnh nhau là $30240$.],
    [Xác suất để $2$ nam đứng ở hai đầu hàng là $1/28$.],
  ),
  correct: "1111",
  num: 5,
  de: "Khảo sát buộc khối và chèn khe",
  loigiai: [
    - a) *Đúng:* Tổng số người là $8$, xếp hàng ngang $8! = 40,320$.
    - b) *Đúng:* Buộc 2 nam thành 1 khối (có $2!$ cách). Khối này và 6 nữ (tổng 7 đối tượng) có $7!$ cách. $2! times 7! = 2 times 5040 = 10,080$.
    - c) *Đúng:* Dùng phần bù: $8! - (2! times 7!) = 40320 - 10080 = 30,240$. (Hoặc chèn khe: xếp 6 nữ có $6!$. 6 nữ tạo 7 khe. Chọn 2 khe cho 2 nam là $A_7^2$. $6! times 42 = 30,240$).
    - d) *Đúng:* Nếu 2 nam đứng 2 đầu thì có $2!$ cách xếp nam. 6 nữ xếp vào giữa có $6!$. Số cách thuận lợi: $2! times 6! = 1440$. Xác suất $P = 1440 / 40320 = 1/28$.
  ]
)
