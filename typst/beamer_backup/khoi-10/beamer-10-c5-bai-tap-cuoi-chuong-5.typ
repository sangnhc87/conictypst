#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương V],
  subtitle: [TOÁN 10 — CHƯƠNG V: TỔNG ÔN THỐNG KÊ MÔ TẢ & 3 BẪY KINH ĐIỂN],
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
#lt-toc(title: [🗺️ NỘI DUNG TỔNG ÔN CHƯƠNG V])

// ════════════════════════════════════════════════
// PHẦN I: MA TRẬN LỰA CHỌN CÁC SỐ ĐẶC TRƯNG
// ════════════════════════════════════════════════
#lt-section-link("sec-ma-tran-so-dac-trung", "🗺️", [I. Ma Trận Chọn Số Đặc Trưng Phù Hợp])

#lt-slide-back(title: "🗺️ Ma Trận: Khi Nào Dùng Số Đặc Trưng Nào?")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 14pt,
    row-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 11pt)[1. ĐO XU THẾ TRUNG TÂM]
        #v(0.2em)
        #text(size: 9.5pt)[
          - *Số trung bình ($overline(x)$):* Dùng khi dữ liệu không có giá trị ngoại lệ bất thường.
          - *Trung vị ($M_e$):* Dùng khi dữ liệu có outlier cực đoan (thu nhập, giá nhà đất).
          - *Mốt ($M_o$):* Dùng cho dữ liệu định danh hoặc tìm giá trị phổ biến nhất (size áo, giày).
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 11pt)[2. ĐO ĐỘ PHÂN TÁN (ĐỘ ỔN ĐỊNH)]
        #v(0.2em)
        #text(size: 9.5pt)[
          - *Khoảng biến thiên ($R$):* Đánh giá nhanh sự chênh lệch lớn nhất và nhỏ nhất.
          - *Khoảng tứ phân vị ($Delta_Q$):* Đo độ tản mác 50% ở giữa, không ngại ngoại lệ.
          - *Độ lệch chuẩn ($s$):* Thước đo vàng của độ ổn định (phong độ thi đấu, rủi ro cổ phiếu).
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: 3 BẪY TƯ DUY KINH ĐIỂN TRONG THỐNG KÊ
// ════════════════════════════════════════════════
#lt-section-link("sec-bay-tu-duy-thong-ke", "⚠️", [II. 3 Bẫy Tư Duy & Sai Lầm Phổ Biến])

#lt-slide-back(title: "⚠️ 3 Bẫy Điển Hình Khi Làm Bài Thống Kê")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 11pt)[Bẫy 1: Quên Sắp Xếp Dãy Số]
        #v(0.2em)
        #text(size: 9.5pt)[
          - Học sinh hay vội vàng lấy ngay phần tử ở giữa danh sách đề bài cho khi chưa sắp xếp!
          - *Bắt buộc:* Luôn sắp xếp dãy số theo thứ tự *không giảm* trước khi tìm $M_e, Q_1, Q_3$!
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#d97706"), size: 11pt)[Bẫy 2: Chia Nửa Mẫu Dữ Liệu]
        #v(0.2em)
        #text(size: 9.5pt)[
          - Khi cỡ mẫu $n$ lẻ, trung vị $Q_2$ là một phần tử có sẵn trong mẫu.
          - Khi chia đôi để tìm $Q_1$ và $Q_3$, *tuyệt đối không tính phần tử $Q_2$* vào hai nửa!
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 8pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 11pt)[Bẫy 3: Nhầm Lẫn s và s^2]
        #v(0.2em)
        #text(size: 9.5pt)[
          - Đề bài hỏi độ lệch chuẩn $s$, nhiều học sinh tính xong phương sai $s^2$ thì khoanh luôn mà quên khai căn!
          - Chú ý: $s = sqrt(s^2)$ và $s$ cùng đơn vị đo với mẫu số liệu ban đầu.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [III. Thực chiến Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — BÀI TẬP CUỐI CHƯƠNG V],
  questions: (
    (num: 1, type: "TN", desc: [Sai Số Tương Đối Vật Lí]),
    (num: 2, type: "TN", desc: [Tìm Trung Vị Mẫu Lẻ]),
    (num: 3, type: "TN", desc: [Lựa Chọn Đại Diện Thống Kê]),
    (num: 4, type: "TN", desc: [Xác Định Tứ Phân Vị Q1]),
    (num: 5, type: "TN", desc: [Khoảng Tứ Phân Vị IQR]),
    (num: 6, type: "TN", desc: [Độ Lệch Chuẩn Dãy Hằng Số]),
    (num: 7, type: "DS", desc: [Đúng/Sai Đầy Đủ Các Số Đặc Trưng]),
    (num: 8, type: "TLN", desc: [Tính Ngưỡng Outlier]),
    (num: 9, type: "TLN", desc: [Phương Sai Dây Chuyền Đóng Gói]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Một phép đo gia tốc trọng trường cho kết quả $g = 9.81 "m/s"^2 plus.minus 0.02 "m/s"^2$. Sai số tương đối của phép đo trên bằng bao nhiêu?],
  (
    [$0.20\%$],
    [$0.02\%$],
    [$2.04\%$],
    [$0.002\%$],
  ),
  correct: 1,
  num: 1,
  de: "Đề Tổng Ôn — Sai Số Tương Đối Vật Lí",
  loigiai: [
    Sai số tương đối của phép đo được tính theo công thức:\
    $delta = d / (|a|) = (0.02) / (9.81) approx 0.002038 approx 0.20\%$.\
    Chọn đáp án *A: 0.20%*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu điểm số: $3, 5, 6, 7, 8, 9, 10$. Trung vị $M_e$ của mẫu số liệu là:],
  (
    [$6$],
    [$7$],
    [$8$],
    [$6.85$],
  ),
  correct: 2,
  num: 2,
  de: "Đề Tổng Ôn — Tìm Trung Vị Mẫu Lẻ",
  loigiai: [
    Mẫu đã sắp xếp tăng dần, có kích thước $n = 7$ (lẻ).\
    Trung vị là giá trị chính giữa tại vị trí thứ $(7+1)/2 = 4$.\
    Giá trị đó là $x_4 = 7$. Chọn đáp án *B: 7*.
  ]
)

#lt-tn(
  [Mức thu nhập hàng tháng (triệu đồng) của 6 nhân viên là: $8, 9, 10, 11, 12, 50$. Số đặc trưng nào sau đây phản ánh trung thực nhất mức thu nhập của số đông nhân viên?],
  (
    [Số trung bình $overline(x)$],
    [Trung vị $M_e$],
    [Khoảng biến thiên $R$],
    [Phương sai $s^2$],
  ),
  correct: 2,
  num: 3,
  de: "Đề Tổng Ôn — Lựa Chọn Đại Diện Thống Kê",
  loigiai: [
    Mẫu số liệu có giá trị $50$ là một giá trị ngoại lệ cực lớn (gấp 5 lần các số khác).\
    Giá trị ngoại lệ này kéo số trung bình lên $overline(x) = (8+9+10+11+12+50)/6 = 16.7$ triệu (không đại diện cho số đông).\
    Trung vị $M_e = (10+11)/2 = 10.5$ triệu phản ánh trung thực mức sống của nhân viên. Chọn *B*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu thống kê: $1, 3, 5, 7, 9, 11, 13, 15$. Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu là:],
  (
    [$3$],
    [$4$],
    [$5$],
    [$3.5$],
  ),
  correct: 2,
  num: 4,
  de: "Đề Tổng Ôn — Xác Định Tứ Phân Vị Q1",
  loigiai: [
    Cỡ mẫu $n = 8$ (chẵn). $Q_2 = (7 + 9)/2 = 8$.\
    Nửa mẫu dưới gồm 4 số: $1, 3, 5, 7$.\
    Tứ phân vị thứ nhất $Q_1$ là trung vị của nửa dưới:\
    $Q_1 = (3 + 5)/2 = 4$. Chọn đáp án *B: 4*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu có $Q_1 = 15, Q_3 = 25$. Khoảng tứ phân vị $Delta_Q$ của mẫu số liệu bằng:],
  (
    [$10$],
    [$40$],
    [$20$],
    [$5$],
  ),
  correct: 1,
  num: 5,
  de: "Đề Tổng Ôn — Khoảng Tứ Phân Vị IQR",
  loigiai: [
    Áp dụng công thức khoảng tứ phân vị:\
    $Delta_Q = Q_3 - Q_1 = 25 - 15 = 10$.\
    Chọn đáp án *A: 10*.
  ]
)

#lt-tn(
  [Cho dãy số liệu gồm 5 số bằng nhau: $7, 7, 7, 7, 7$. Độ lệch chuẩn $s$ của mẫu số liệu trên bằng:],
  (
    [$7$],
    [$0$],
    [$1$],
    [$49$],
  ),
  correct: 2,
  num: 6,
  de: "Đề Tổng Ôn — Độ Lệch Chuẩn Dãy Hằng Số",
  loigiai: [
    Số trung bình $overline(x) = 7$.\
    Mọi số liệu đều trùng khớp với số trung bình: $x_i - overline(x) = 0$ với mọi $i$.\
    Phương sai $s^2 = 0 => s = 0$. (Dữ liệu không hề phân tán). Chọn đáp án *B: 0*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP ĐÚNG / SAI
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds", "📝", [IV. Bài tập Đúng / Sai Toàn Diện])

#lt-ds(
  [Cho mẫu số liệu về thời gian tự học mỗi ngày (giờ) của 10 học sinh: $1, 2, 2, 3, 3, 3, 4, 4, 5, 8$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Số trung bình của mẫu số liệu là $overline(x) = 3.5$ giờ.], "true": true),
    (body: [Trung vị của mẫu số liệu là $M_e = 3.0$ giờ.], "true": true),
    (body: [Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 2.0$ giờ.], "true": true),
    (body: [Giá trị $8$ giờ là một giá trị bất thường (outlier) của mẫu số liệu.], "true": true),
  ),
  de: "Đề Tổng Ôn — Đúng/Sai Đầy Đủ Các Số Đặc Trưng",
  num: 7,
  loigiai: [
    - a) *Đ:* Tổng $= 35 => overline(x) = 35 / 10 = 3.5$.
    - b) *Đ:* $n = 10$, hai giá trị giữa là $x_5 = 3, x_6 = 3 => M_e = 3.0$.
    - c) *Đ:* Nửa dưới: $1, 2, 2, 3, 3 => Q_1 = 2$. Nửa trên: $3, 4, 4, 5, 8 => Q_3 = 4 => Delta_Q = 4 - 2 = 2$.
    - d) *Đ:* Ngưỡng trên outlier: $Q_3 + 1.5 Delta_Q = 4 + 1.5(2) = 7$. Vì $8 > 7$ nên $8$ là outlier!
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tln", "🔢", [V. Bài tập Trả Lời Ngắn (Điền Số)])

#lt-tln(
  [Cho mẫu số liệu điểm kiểm tra của một nhóm: $3, 5, 6, 7, 8, 9, 10, 16$. Theo tiêu chuẩn $Q_3 + 1.5 Delta_Q$, ngưỡng trên để xác định giá trị bất thường của mẫu số liệu này bằng bao nhiêu? (Điền số thập phân, ví dụ 15.5).],
  [15.5],
  num: 8,
  de: "Đề Tổng Ôn — Tính Ngưỡng Outlier",
  loigiai: [
    Cỡ mẫu $n = 8$ (chẵn). $Q_2 = (7 + 8)/2 = 7.5$.\
    Nửa dưới: $3, 5, 6, 7 => Q_1 = (5 + 6)/2 = 5.5$.\
    Nửa trên: $8, 9, 10, 16 => Q_3 = (9 + 10)/2 = 9.5$.\
    Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 9.5 - 5.5 = 4.0$.\
    Ngưỡng trên: $Q_3 + 1.5 Delta_Q = 9.5 + 1.5(4.0) = 9.5 + 6.0 = 15.5$. Đáp số: *$15.5$*.
  ]
)

#lt-tln(
  [Khối lượng (tính bằng gam) của 5 gói kẹo thành phẩm đóng gói tự động lần lượt là: $98, 99, 100, 101, 102$. Phương sai $s^2$ của mẫu số liệu trên bằng bao nhiêu?],
  [2],
  num: 9,
  de: "Đề Tổng Ôn — Phương Sai Dây Chuyền Đóng Gói",
  loigiai: [
    Số trung bình: $overline(x) = (98 + 99 + 100 + 101 + 102) / 5 = 500 / 5 = 100$ g.\
    Các độ lệch bình phương: $(98-100)^2 = 4, (99-100)^2 = 1, (100-100)^2 = 0, (101-100)^2 = 1, (102-100)^2 = 4$.\
    Tổng bình phương sai số: $4 + 1 + 0 + 1 + 4 = 10$.\
    Phương sai: $s^2 = 10 / 5 = 2$. Đáp số: *$2$*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT BẢN ĐỒ NĂNG LỰC
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c5", "💎", [VI. Bản Đồ Năng Lực & Tốt Nghiệp Học Kỳ I])

#lt-slide-back(title: "💎 Bản Đồ Năng Lực Dữ Liệu Trong Kỷ Nguyên Số")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 14pt,
    row-gutter: 12pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12pt)[1. Tư Duy Phản Biện Dữ Liệu]
        #v(0.3em)
        #text(size: 10pt)[
          - Không bao giờ để bị đánh lừa bởi duy nhất một con số trung bình cộng.
          - Luôn kết hợp số trung vị, mốt và kiểm tra giá trị ngoại lệ bất thường.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. Kiểm Soát Rủi Ro & Sai Số]
        #v(0.3em)
        #text(size: 10pt)[
          - Đo lường mức độ ổn định và rủi ro bằng độ lệch chuẩn và phương sai.
          - Ứng dụng quản trị chất lượng Six Sigma và phân tích tài chính.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#d97706"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 12pt)[3. Trực Quan Hóa Thông Minh]
        #v(0.3em)
        #text(size: 10pt)[
          - Biểu diễn phân phối dữ liệu qua Biểu đồ Hộp (Box plot) 5 số đặc trưng.
          - Trình bày trực quan để đưa ra quyết định dựa trên dữ liệu (Data-Driven).
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 10pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 12pt)[4. Bước Đệm Tới Lớp 11 & AI]
        #v(0.3em)
        #text(size: 10pt)[
          - Nền tảng tiếp nối trực tiếp sang *Thống kê mẫu ghép nhóm (Toán 11)*.
          - Cốt lõi của giải thuật Học máy (Machine Learning) và Khoa học Dữ liệu!
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 HOÀN THÀNH XUẤT SẮC TOÀN BỘ HỌC KỲ I TOÁN 10!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Chúc mừng các em học sinh đã chinh phục trọn vẹn 5 Chương Học kỳ I!"\
        Từ Mệnh đề, Bất phương trình, Lượng giác, Vectơ đến Thống kê dữ liệu!
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
