#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương VIII: Đại Số Tổ Hợp],
  subtitle: [TOÁN 10 — HỆ THỐNG HÓA KIẾN THỨC, TOÁN THỰC TẾ, MẬT MÃ HỌC & RÈN LUYỆN TỔNG HỢP],
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
// PHẦN I: SƠ ĐỒ HỆ THỐNG HÓA KIẾN THỨC CHƯƠNG VIII
// ════════════════════════════════════════════════
#lt-section-link("sec-so-do-kien-thuc", "🗺️", [I. Sơ Đồ Hệ Thống Hóa Kiến Thức])

#lt-slide-back(title: "🗺️ 1. Bản Đồ Tư Duy Các Công Cụ Đếm Cơ Bản")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[1. Hai Quy Tắc Đếm Nền Tảng]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Quy tắc cộng (Các phương án rời nhau):*
            Công việc hoàn thành bởi $1$ trong $k$ phương án độc lập:
            $ N = m_1 + m_2 + dots + m_k $
          - *Quy tắc nhân (Các công đoạn liên tiếp):*
            Công việc phải trải qua $k$ công đoạn nối tiếp nhau:
            $ N = m_1 times m_2 times dots times m_k $
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.2pt + rgb("#eab308"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 10pt)[2. Bộ Ba Hoán Vị - Chỉnh Hợp - Tổ Hợp]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Hoán vị $P_n = n!$:* Xếp thứ tự *toàn bộ* $n$ phần tử.
          - *Chỉnh hợp $A_n^k = (n!)/((n - k)!)$:* Lấy $k$ từ $n$, *có xếp thứ tự*.
          - *Tổ hợp $C_n^k = (n!)/(k!(n - k)!)$:* Lấy $k$ từ $n$, *không tính thứ tự*.
          - Mối liên hệ: $A_n^k = k! times C_n^k$.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 2. Nhị Thức Newton & Tam Giác Pascal")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#fdf2f8"), stroke: 1.2pt + rgb("#ec4899"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#be185d"), size: 10pt)[1. Khai Triển Bậc 4 & Bậc 5]\
        #v(0.15em)
        #text(size: 8.3pt)[
          - Bậc 4: Hệ số đối xứng $(1, 4, 6, 4, 1)$:\
            $(a + b)^4 = a^4 + 4a^3b + 6a^2b^2 + 4a b^3 + b^4$
          - Bậc 5: Hệ số đối xứng $(1, 5, 10, 10, 5, 1)$:\
            $(a + b)^5 = a^5 + 5a^4b + 10a^3b^2 + 10a^2b^3 + 5a b^4 + b^5$
          - Tổng số hạng luôn bằng $n + 1$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.2pt + rgb("#22c55e"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10pt)[2. Kỹ Thuật Đột Phá Tìm Hệ Số]\
        #v(0.15em)
        #text(size: 8.3pt)[
          - *Tổng mọi hệ số:* Thay $x = 1$ vào đa thức:
            $ S = P(1) $
          - *Số hạng tự do (không chứa x):* Cho số mũ biến $x$ triệt tiêu bằng $0$.
          - *Ứng dụng xấp xỉ:* Tính lãi kép hoặc sai số:
            $ (1 + alpha)^n approx 1 + n alpha " khi " |alpha| " rất nhỏ" $
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: TOÁN THỰC TẾ & MẬT MÃ HỌC HIỆN ĐẠI
// ════════════════════════════════════════════════
#lt-section-link("sec-toan-thuc-te", "🔐", [II. Toán Thực Tế & Mật Mã Học Hiện Đại])

#lt-slide-back(title: "🔐 1. Bảo Mật Mật Khẩu & Mã PIN Ngân Hàng")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10pt)[🛡️ Không Gian Mật Khẩu (Entropy)]\
        #v(0.15em)
        #text(size: 8.3pt)[
          - Mật khẩu 8 ký tự chỉ gồm chữ số: $10^8 = 100.000.000$ khả năng (máy tính bẻ khóa trong $0.1$ giây!).
          - Thêm chữ hoa, chữ thường và ký tự đặc biệt ($94$ ký tự khả dụng):
            $ N = 94^8 approx 6 times 10^(15) " khả năng" $
          - Thời gian dò vét cạn tăng lên hàng triệu năm!
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10pt)[💳 Mã PIN ATM Chống Đoán Mò]\
        #v(0.15em)
        #text(size: 8.3pt)[
          - Ngân hàng loại bỏ các mã dễ đoán: số liên tiếp `123456`, số trùng lặp `111111` hoặc hai chữ số kề nhau giống nhau.
          - Thuật toán đếm với ràng buộc $c_(i+1) != c_i$:
            Áp dụng quy tắc nhân độc lập cho từng vị trí tạo nên lớp phòng ngự vững chắc.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📦 2. Mã Vạch EAN-13 & Thuật Toán Checksum Mod 10")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10pt)[📊 Cấu Trúc Mã Vạch Hàng Hóa EAN-13]\
        #v(0.15em)
        #text(size: 8.3pt)[
          - Gồm 13 chữ số: $c_1 c_2 dots c_12 c_13$.
          - 3 số đầu: Mã quốc gia (Việt Nam là `893`).
          - 4-6 số tiếp: Mã doanh nghiệp & mã sản phẩm.
          - Chữ số cuối $c_13$ là *chữ số kiểm tra (checksum)*:
            $ S = (c_1 + c_3 + dots + c_11) + 3(c_2 + c_4 + dots + c_12) $
            $ c_13 = (10 - (S mod 10)) mod 10 $
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfdf5"), stroke: 1.5pt + rgb("#10b981"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#047857"), size: 10pt)[🎯 Phát Hiện Lỗi Tự Động]\
        #v(0.15em)
        #text(size: 8.3pt)[
          - Máy quét laser đọc mã vạch và tính lại $c_13$.
          - Nếu thu ngân nhập sai $1$ chữ số bất kỳ, tổng $S$ đổi số dư mod $10$ ngay lập tức, báo động tức thì!
          - Đây là ứng dụng tuyệt vời của số học tổ hợp trong thương mại điện tử toàn cầu.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP LUYỆN TẬP & VẬN DỤNG CAO
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Hệ Thống Bài Tập Tuyển Chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VIII ÔN TẬP],
  questions: (
    (num: 1, type: "TN", desc: [Mã PIN thẻ ATM chống đoán mò]),
    (num: 2, type: "TN", desc: [Mở thêm đường bay hàng không]),
    (num: 3, type: "TN", desc: [Khai triển tích tìm hệ số x^3]),
    (num: 4, type: "TN", desc: [Chọn đội dự án công nghệ]),
    (num: 5, type: "TN", desc: [Lập số chẵn có hàng nghìn lẻ]),
    (num: 6, type: "TN", desc: [Vách ngăn xếp 2 nữ không cạnh nhau]),
    (num: 7, type: "DS", desc: [Đúng/Sai Robot di chuyển tránh vật cản]),
    (num: 8, type: "TLN", desc: [Số hình chữ nhật trong đa giác 16 đỉnh]),
    (num: 9, type: "TLN", desc: [Phân bổ vắc-xin cho 4 trạm y tế]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Một ngân hàng phát hành mã PIN ATM gồm $6$ chữ số $c_1 c_2 c_3 c_4 c_5 c_6$. Chữ số đầu $c_1 != 0$ và hai chữ số kề nhau bất kỳ phải khác nhau ($c_(i+1) != c_i$). Số mã PIN hợp lệ là:],
  (
    [$531.441$],
    [$1.000.000$],
    [$900.000$],
    [$604.800$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 29B — Mã PIN Thẻ ATM Bảo Mật Chống Đoán Mò",
  loigiai: [
    Áp dụng quy tắc nhân cho 6 vị trí:\
    - Vị trí $c_1 in {1, 2, ..., 9}$: có $9$ cách chọn.\
    - Mỗi vị trí tiếp theo $c_2, c_3, c_4, c_5, c_6 in {0, 1, ..., 9} backslash {c_i}$: có $10 - 1 = 9$ cách chọn.\
    Số mã PIN hợp lệ: $N = 9 times 9^5 = 9^6 = 531.441$ mã.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Một hãng hàng không bay kết nối $8$ thành phố lớn, mỗi cặp có tối đa $1$ đường bay thẳng hai chiều. Hiện có $20$ đường bay. Hãng có thể mở thêm tối đa bao nhiêu đường bay mới?],
  (
    [$8$],
    [$12$],
    [$16$],
    [$28$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 29B — Mở Rộng Mạng Lưới Đường Bay Hàng Không",
  loigiai: [
    Tổng số đường bay thẳng tối đa kết nối giữa $8$ thành phố bằng số cặp 2 thành phố:\
    $C_8^2 = (8 times 7) / 2 = 28$ đường bay.\
    Hiện tại hãng đã có $20$ đường bay, số đường bay mới tối đa có thể mở thêm là:\
    $Delta N = 28 - 20 = 8$ đường bay.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Tìm hệ số của số hạng chứa $x^3$ trong khai triển của biểu thức đa thức $P(x) = (1 + 2x)^4 (1 - x)$.],
  (
    [$8$],
    [$32$],
    [$-8$],
    [$24$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 29A — Tìm Hệ Số Trong Tích Của Hai Đa Thức",
  loigiai: [
    Khai triển $(1 + 2x)^4 = 1 + 8x + 24x^2 + 32x^3 + 16x^4$.\
    Nhân với biểu thức $(1 - x)$, các số hạng sinh ra $x^3$ là:\
    $32x^3 times 1 + 24x^2 times (-x) = 32x^3 - 24x^3 = 8x^3$.\
    Vậy hệ số của số hạng chứa $x^3$ là $8$.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Một công ty công nghệ có $10$ kỹ sư phần mềm và $6$ chuyên viên đồ họa. Cần chọn đội dự án $5$ người gồm ít nhất $3$ kỹ sư và ít nhất $1$ chuyên viên đồ họa. Số cách chọn là:],
  (
    [$3.060$],
    [$2.520$],
    [$1.800$],
    [$4.368$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 29B — Thành Lập Đội Dự Án Công Nghệ Đa Ngành",
  loigiai: [
    Chia làm 2 trường hợp thỏa mãn yêu cầu đề bài:\
    - TH1: $3$ kỹ sư và $2$ chuyên viên đồ họa: $C_(10)^3 times C_6^2 = 120 times 15 = 1.800$ cách.\
    - TH2: $4$ kỹ sư và $1$ chuyên viên đồ họa: $C_(10)^4 times C_6^1 = 210 times 6 = 1.260$ cách.\
    Tổng số cách chọn: $N = 1.800 + 1.260 = 3.060$ cách.\
    Do đó phương án đúng là *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Từ tập $X = {0, 1, 2, 3, 4, 5, 6, 7}$, lập được bao nhiêu số tự nhiên chẵn gồm $4$ chữ số đôi một khác nhau sao cho hàng nghìn luôn là số lẻ?],
  (
    [$480$],
    [$360$],
    [$420$],
    [$300$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 29A — Lập Số Tự Nhiên Chẵn Có Hàng Nghìn Lẻ",
  loigiai: [
    Số $overline(a b c d)$ có: $a in {1, 3, 5, 7}$ ($4$ cách); $d in {0, 2, 4, 6}$ ($4$ cách do hai tập lẻ và chẵn rời nhau).\
    Chọn $2$ số xếp vào $b, c$ từ $6$ số còn lại: có $A_6^2 = 30$ cách.\
    Số lượng số lập được: $4 times 4 times 30 = 480$ số. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Có $5$ nam và $2$ nữ xếp thành một hàng dọc sao cho hai bạn nữ không đứng cạnh nhau. Số cách xếp là:],
  (
    [$3.600$],
    [$2.520$],
    [$5.040$],
    [$1.440$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 29A — Phương Pháp Vách Ngăn Xếp Người Không Cạnh Nhau",
  loigiai: [
    - Xếp $5$ bạn nam thành hàng: có $5! = 120$ cách, tạo ra $6$ khe trống.\
    - Chọn $2$ trong $6$ khe trống xếp $2$ bạn nữ: có $A_6^2 = 30$ cách.\
    - Tổng số cách xếp thỏa mãn: $120 times 30 = 3.600$ cách. Chọn *A*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-ds(
  [Một robot di chuyển trên lưới từ $O(0, 0)$ đến $B(5, 3)$ bằng các bước sang phải hoặc lên trên $1$ đơn vị. Biết điểm $M(2, 1)$ là chướng ngại vật cấm đi qua. Xét tính Đúng / Sai:],
  (
    (body: [Tổng số lộ trình từ $O(0, 0)$ đến $B(5, 3)$ khi không có vật cản là $C_8^3 = 56$.], "true": true),
    (body: [Số lộ trình từ gốc tọa độ $O(0, 0)$ đi đến chướng ngại vật $M(2, 1)$ là $C_3^1 = 3$.], "true": true),
    (body: [Số lộ trình đi từ $M(2, 1)$ đến đích $B(5, 3)$ là $C_5^2 = 10$.], "true": true),
    (body: [Số lộ trình hợp lệ từ $O$ đến $B$ tránh chướng ngại vật $M$ là $36$.], "true": false),
  ),
  num: 7,
  de: "Đề 29A — Bài Toán Robot Di Chuyển Trên Lưới Tọa Độ Tránh Vật Cản",
  loigiai: [
    - a) *Đ:* Cần $5$ bước phải và $3$ bước lên ($8$ bước), số cách chọn là $C_8^3 = 56$.
    - b) *Đ:* Đến $M(2, 1)$ cần $2$ bước phải và $1$ bước lên ($3$ bước), có $C_3^1 = 3$ cách.
    - c) *Đ:* Từ $M(2, 1)$ đến $B(5, 3)$ cần $3$ phải và $2$ lên ($5$ bước), có $C_5^2 = 10$ cách.
    - d) *S:* Số lộ trình đi qua $M$ là $3 times 10 = 30$. Tránh $M$ là $56 - 30 = 26 != 36$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho đa giác đều có $16$ đỉnh nội tiếp trong đường tròn tâm $O$. Có bao nhiêu hình chữ nhật có $4$ đỉnh là các đỉnh của đa giác đều đã cho?],
  "28",
  num: 8,
  de: "Đề 29A — Đếm Số Hình Chữ Nhật Nội Tiếp Đa Giác Đều",
  loigiai: [
    1. Đa giác đều $16$ đỉnh nội tiếp đường tròn có $16 / 2 = 8$ đường kính nối các cặp đỉnh đối diện.\
    2. Hai đường kính bất kỳ của đường tròn luôn cắt nhau tại trung điểm và bằng nhau, tạo thành $4$ đỉnh của một hình chữ nhật.\
    3. Ngược lại, mỗi hình chữ nhật nội tiếp đường tròn luôn xác định duy nhất $2$ đường kính.\
    4. Số hình chữ nhật tạo thành bằng số cách chọn $2$ đường kính từ $8$ đường kính:\
       $N = C_8^2 = (8 times 7) / 2 = 28 " hình chữ nhật"$.\
    5. Đáp số: *$28$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Một bệnh viện nhận $15$ liều vắc-xin phân bổ cho $4$ trạm y tế $A, B, C, D$. Mỗi trạm phải nhận ít nhất $2$ liều. Có bao nhiêu cách phân bổ các liều vắc-xin này?],
  "120",
  num: 9,
  de: "Đề 29B — Bài Toán Chia Kẹo Euler Phân Bổ Nguồn Lực Y Tế",
  loigiai: [
    1. Gọi số liều vắc-xin phân cho $4$ trạm là $x_1, x_2, x_3, x_4 >= 2$ với $x_1 + x_2 + x_3 + x_4 = 15$.\
    2. Đặt $y_i = x_i - 2 >= 0$, phương trình trở thành:\
       $y_1 + y_2 + y_3 + y_4 = 15 - 4 times 2 = 7$ ($y_i in NN$).\
    3. Số nghiệm không âm của phương trình bằng số tổ hợp lặp (chia kẹo Euler):\
       $N = C_(7 + 4 - 1)^(4 - 1) = C_(10)^3 = (10 times 9 times 8) / (3 times 2 times 1) = 120 " cách"$.\
    4. Đáp số: *$120$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN IV: TỔNG KẾT & CỘT MỐC CHƯƠNG VIII
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Tổng Kết & Cột Mốc])

#lt-slide-back(title: "🗺️ Bảng Đối Sánh Toàn Bộ Công Thức Đại Số Tổ Hợp")[
  #align(center)[
    #block(fill: rgb("#f8fafc"), stroke: 1.2pt + rgb("#cbd5e1"), inset: 9pt, radius: 8pt)[
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        column-gutter: 8pt,
        [
          #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#1d4ed8"), size: 9pt)[1. Quy Tắc Đếm]\
            #v(0.1em)
            #text(size: 8pt)[
              - Cộng: Các PA rời nhau.\
              - Nhân: Các công đoạn nối tiếp.\
              - Sơ đồ cây phân nhánh trực quan.
            ]
          ]
        ],
        [
          #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#a16207"), size: 9pt)[2. Hoán Vị P(n)]\
            #v(0.1em)
            #text(size: 8pt)[
              $P_n = n!$\
              Xếp thứ tự *toàn bộ* $n$ phần tử.\
              Hàng dọc, bàn tròn, đổi vị trí.
            ]
          ]
        ],
        [
          #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#22c55e"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#15803d"), size: 9pt)[3. Chỉnh Hợp A]\
            #v(0.1em)
            #text(size: 8pt)[
              $A_n^k = (n!) / ((n-k)!)$\
              Chọn $k$ từ $n$ và *có xếp thứ tự*.\
              Chức vụ, mã số, lập số.
            ]
          ]
        ],
        [
          #block(fill: rgb("#fdf2f8"), stroke: 1pt + rgb("#ec4899"), inset: 6pt, radius: 6pt)[
            #text(weight: "bold", fill: rgb("#be185d"), size: 9pt)[4. Tổ Hợp C]\
            #v(0.1em)
            #text(size: 8pt)[
              $C_n^k = (n!) / (k!(n-k)!)$\
              Chọn $k$ từ $n$, *không tính thứ tự*.\
              Đội nhóm, hình học, tam giác.
            ]
          ]
        ]
      )
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Toàn Bộ Chương VIII!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 18pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC TOÀN BỘ CHƯƠNG VIII!]\
      #v(0.4em)
      #text(size: 10.5pt, fill: rgb("#166534"))[
        Bạn đã làm chủ vững vàng toàn bộ $3$ trụ cột lớn của Đại số tổ hợp:\
        *Quy tắc đếm, Hoán vị, Chỉnh hợp, Tổ hợp, Nhị thức Newton & Bài toán thực tế!*\
        Sẵn sàng bứt phá bước vào Chương IX: Một Số Yếu Tố Xác Suất!
      ]
      #v(0.7em)
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
