#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương VI],
  subtitle: [TOÁN 10 — HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG: TỔNG HỢP KIẾN THỨC & ÔN TẬP TOÀN DIỆN],
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
#lt-toc(title: [🗺️ NỘI DUNG ÔN TẬP CHƯƠNG VI])

// ════════════════════════════════════════════════
// PHẦN I: HỆ THỐNG HÓA KIẾN THỨC CHƯƠNG VI
// ════════════════════════════════════════════════
#lt-section-link("sec-he-thong-kienthuc", "🎯", [I. Hệ Thống Hóa Kiến Thức Chương VI])

#lt-slide-back(title: "🎯 Sơ Đồ Tư Duy 4 Trụ Cột Chương VI")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[1. Khái Niệm Hàm Số & Đồ Thị]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Tập xác định $D$, tập giá trị $T$.
          - Đồng biến (đồ thị đi lên), nghịch biến (đồ thị đi xuống).
          - Tiêu chuẩn đường thẳng đứng (Vertical Line Test).
        ]
      ]
      #v(0.2em)
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10.5pt)[2. Hàm Số Bậc Hai & Parabol]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Đỉnh $I(-b / (2a); -Delta / (4a))$, trục đối xứng $x = -b / (2a)$.
          - Bề lõm quay lên ($a > 0$), quay xuống ($a < 0$).
          - Cực trị trên $RR$ và trên đoạn đóng $[alpha; beta]$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[3. Dấu Tam Thức Bậc Hai]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - $Delta < 0$: Luôn cùng dấu $a$ trên $RR$.
          - $Delta = 0$: Cùng dấu $a$ với mọi $x != -b/(2a)$.
          - $Delta > 0$: *"Trong trái — Ngoài cùng"*.
        ]
      ]
      #v(0.2em)
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[4. Phương Trình Căn Thức]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - $sqrt(f(x)) = sqrt(g(x)) <=> cases(f(x) >= 0, f(x) = g(x))$
          - $sqrt(f(x)) = g(x) <=> cases(g(x) >= 0, f(x) = (g(x))^2)$
          - Thử lại nghiệm vào phương trình ban đầu.
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: CÁC DẠNG TOÁN TRỌNG TÂM
// ════════════════════════════════════════════════
#lt-section-link("sec-dang-toan-trong-tam", "📈", [II. Các Dạng Toán Trọng Tâm & Bẫy Cần Tránh])

#lt-slide-back(title: "📈 Bảng So Sánh Các Lỗi Sai Kinh Điển")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#ea580c"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[⚠️ Bẫy Cực Trị & Dấu Tam Thức]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Lỗi 1:* Ghi khoảng đồng biến/nghịch biến theo giá trị $y$ thay vì biến số $x$.
          - *Lỗi 2:* Quên kiểm tra hoành độ đỉnh $x_I$ có thuộc đoạn $[alpha; beta]$ hay không khi tìm GTLN/GTNN.
          - *Lỗi 3:* Nhầm điều kiện $Delta < 0$ và $Delta <= 0$ trong bài toán "tam thức luôn không âm".
        ]
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[💡 Chiến Thuật Giải Nhanh]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - *Tọa độ đỉnh:* Luôn tính $x_0 = -b/(2a)$, rồi thế trực tiếp tìm $y_0 = f(x_0)$.
          - *BPT chứa tích / thương:* Lập trục xét dấu nhanh đan dấu qua các nghiệm đơn.
          - *PT căn thức:* Sau khi bình phương ra nghiệm, thử lại trực tiếp bằng máy tính cầm tay để loại nghiệm ngoại lai!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & THỰC TIỄN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Trắc nghiệm & Thực tiễn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — ÔN TẬP CHƯƠNG VI],
  questions: (
    (num: 1, type: "TN", desc: [TXĐ chứa căn và phân thức]),
    (num: 2, type: "TN", desc: [Tọa độ đỉnh parabol]),
    (num: 3, type: "TN", desc: [Khoảng đồng biến parabol]),
    (num: 4, type: "TN", desc: [Giải BPT x^2 - 7x + 10 <= 0]),
    (num: 5, type: "TN", desc: [Tổng nghiệm PT căn thức]),
    (num: 6, type: "TN", desc: [Độ cao vòm cầu treo parabol]),
    (num: 7, type: "DS", desc: [Đúng/Sai đồ thị & tương giao]),
    (num: 8, type: "TLN", desc: [Nghiệm duy nhất PT căn thức]),
    (num: 9, type: "TLN", desc: [Chiều cao tối đa xe qua cổng]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tập xác định của hàm số $y = sqrt(2x - 4) + 1 / (x - 3)$ là:],
  (
    [$[2; +infinity) \\ {3}$],
    [$[2; +infinity)$],
    [$(2; +infinity) \\ {3}$],
    [$[2; 3)$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 20A — Tập Xác Định Chứa Căn & Mẫu Số",
  loigiai: [
    - Điều kiện: $cases(2x - 4 >= 0, x - 3 != 0) <=> cases(x >= 2, x != 3)$.\
    - Vậy tập xác định $D = [2; +infinity) \\ {3}$.\
    Chọn đáp án *A: $[2; +infinity) \\ {3}$*.
  ]
)

#lt-tn(
  [Tọa độ đỉnh $I$ của parabol $(P): y = x^2 - 4x + 1$ là:],
  (
    [$I(2; -3)$],
    [$I(-2; 13)$],
    [$I(2; 3)$],
    [$I(-4; 1)$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 20A — Tọa Độ Đỉnh Parabol",
  loigiai: [
    - Hoành độ đỉnh: $x_I = - (-4) / (2 dot 1) = 2$.\
    - Tung độ đỉnh: $y_I = 2^2 - 4(2) + 1 = 4 - 8 + 1 = -3$.\
    Vậy tọa độ đỉnh là $I(2; -3)$. Chọn đáp án *A: $I(2; -3)$*.
  ]
)

#lt-tn(
  [Hàm số bậc hai $y = -x^2 + 6x - 2$ ĐỒNG BIẾN trên khoảng nào sau đây?],
  (
    [$(-infinity; 3)$],
    [$(3; +infinity)$],
    [$(-infinity; 6)$],
    [$(0; 6)$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 20A — Khoảng Đồng Biến Parabol Bề Lõm Quay Xuống",
  loigiai: [
    - Hệ số $a = -1 < 0$ và hoành độ đỉnh $x_I = - 6 / (2 dot (-1)) = 3$.\
    - Đồ thị có bề lõm quay xuống nên đồng biến trên $(-infinity; 3)$ và nghịch biến trên $(3; +infinity)$.\
    Chọn đáp án *A: $(-infinity; 3)$*.
  ]
)

#lt-tn(
  [Tập nghiệm của bất phương trình bậc hai $x^2 - 7x + 10 <= 0$ là:],
  (
    [$[2; 5]$],
    [$(2; 5)$],
    [$(-infinity; 2] union [5; +infinity)$],
    [$[-5; -2]$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 20A — Giải Bất Phương Trình Bậc Hai",
  loigiai: [
    - Phương trình $x^2 - 7x + 10 = 0 <=> (x - 2)(x - 5) = 0 <=> x = 2$ hoặc $x = 5$.\
    - Hệ số $a = 1 > 0$. BPT lấy dấu $<=$ nên lấy trong khoảng nghiệm: $2 <= x <= 5$.\
    Vậy tập nghiệm $S = [2; 5]$. Chọn đáp án *A: $[2; 5]$*.
  ]
)

#lt-tn(
  [Tổng các nghiệm thực của phương trình $sqrt(3x^2 - 5x + 1) = sqrt(x^2 - 2x + 4)$ bằng:],
  (
    [$3/2$],
    [$-3/2$],
    [$1$],
    [$2$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 20A — Tổng Nghiệm Phương Trình Căn Thức",
  loigiai: [
    - Bình phương: $3x^2 - 5x + 1 = x^2 - 2x + 4 <=> 2x^2 - 3x - 3 = 0$.\
    - Vế phải $x^2 - 2x + 4 = (x - 1)^2 + 3 > 0, forall x$ nên cả 2 nghiệm đều thỏa mãn.\
    - Theo định lý Vi-ét: $x_1 + x_2 = - (-3) / 2 = 3/2$. Chọn đáp án *A: $3/2$*.
  ]
)

#lt-tn(
  [Một vòm cầu treo parabol có nhịp $120$ m, đỉnh cao $20$ m, phương trình $y = - 1 / 180 x^2 + 2 / 3 x$. Chiều cao vòm cầu tại điểm cách chân $30$ m là:],
  (
    [$15 text(" m")$],
    [$10 text(" m")$],
    [$12 text(" m")$],
    [$18 text(" m")$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 20A — Ứng Dụng Thực Tế Vòm Cầu Treo",
  loigiai: [
    - Thay $x = 30$ m vào phương trình vòm cầu:\
    $y(30) = - 1 / 180 (30)^2 + 2 / 3 (30) = - 900 / 180 + 20 = -5 + 20 = 15$ m.\
    Chọn đáp án *A: $15 text(" m")$*.
  ]
)

#lt-ds(
  [Cho hàm số $y = f(x) = x^2 - 2x - 3$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Tọa độ đỉnh của parabol $(P)$ là $I(1; -4)$.],
    [Hàm số đồng biến trên $(1; +infinity)$ và nghịch biến trên $(-infinity; 1)$.],
    [Tập nghiệm của bất phương trình $f(x) <= 0$ là đoạn $[-1; 3]$.],
    [Đường thẳng $d: y = -5$ cắt parabol $(P)$ tại hai điểm phân biệt.],
  ),
  num: 7,
  de: "Đề 20A — Khảo Sát Toàn Diện Đồ Thị Parabol & Tương Giao",
  loigiai: [
    - a) *Đúng:* $x_I = - (-2) / (2 dot 1) = 1$; $y_I = 1 - 2 - 3 = -4 => I(1; -4)$.\
    - b) *Đúng:* Vì $a = 1 > 0$, parabol quay lên nên đồng biến trên $(1; +infinity)$.\
    - c) *Đúng:* Nghiệm $x_1 = -1, x_2 = 3$. Trong khoảng nghiệm, $f(x) <= 0$.\
    - d) *Sai:* GTNN của parabol là $y_I = -4 > -5$, nên parabol nằm hoàn toàn phía trên đường thẳng $y = -5$ (không cắt nhau).
  ]
)

#lt-tln(
  [Tìm nghiệm của phương trình căn thức: $sqrt(2x^2 + 5x - 3) = x + 1$.],
  "1",
  num: 8,
  de: "Đề 20A — Giải Phương Trình Căn Thức Cơ Bản",
  loigiai: [
    - Điều kiện: $x + 1 >= 0 <=> x >= -1$.\
    - Bình phương: $2x^2 + 5x - 3 = (x + 1)^2 <=> x^2 + 3x - 4 = 0 <=> x = 1$ hoặc $x = -4$.\
    - Vì $x >= -1$ nên loại $x = -4$, nhận nghiệm duy nhất $x = 1$.\
    Đáp số: *1*.
  ]
)

#lt-tln(
  [Một cổng chào hình parabol rộng chân $8$ m, cao $6$ m. Xe tải rộng $4$ m đi chính giữa cổng. Tính chiều cao tối đa của thùng xe tải để đi lọt qua cổng (đơn vị: mét).],
  "4.5",
  num: 9,
  de: "Đề 20A — Ứng Dụng Kích Thước Xe Tải Chui Qua Cổng Parabol",
  loigiai: [
    - Chọn gốc $O$ tại trung điểm chân cổng, đỉnh $I(0; 6)$, chân cổng $(plus.minus 4; 0)$.\
    - Phương trình parabol: $y = 6 - a x^2$. Qua $(4; 0) => 0 = 6 - 16a <=> a = 3/8$.\
    - Xe rộng $4$ m đi chính giữa nên mép xe ở $x = 2$ m.\
    - Chiều cao tối đa: $y(2) = 6 - 3/8 (2)^2 = 6 - 1.5 = 4.5$ m.\
    Đáp số: *4.5*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: MA TRẬN KIẾN THỨC & TỔNG KẾT
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Ma Trận Kiến Thức & Tổng Kết])

#lt-slide-back(title: "🧠 Ma Trận Tổng Hợp Toàn Bộ Chương VI")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 9pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[1. Hàm Số & Đồ Thị]\
        #v(0.15em)
        #text(size: 8.5pt)[
          TXĐ, tập giá trị, kiểm tra đồ thị hàm số và đọc khoảng biến thiên từ BBT.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10.5pt)[2. Đỉnh & Trục Đối Xứng]\
        #v(0.15em)
        #text(size: 8.5pt)[
          $I(-b/(2a); -Delta/(4a))$, trục $x = -b/(2a)$, bề lõm parabol theo dấu của $a$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[3. Min / Max Trên Đoạn]\
        #v(0.15em)
        #text(size: 8.5pt)[
          So sánh hai đầu mút $f(alpha), f(beta)$ và giá trị tại đỉnh $f(x_I)$ nếu $x_I in [alpha; beta]$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 10.5pt)[4. Dấu Tam Thức Bậc Hai]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Biệt thức $Delta$ và quy tắc "Trong trái — Ngoài cùng" giải BPT bậc hai.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 10.5pt)[5. PT Căn Thức]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Bình phương 2 vế khử căn, bắt buộc đối chiếu ĐK hoặc thử lại loại nghiệm ngoại lai.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[6. Mô Hình Thực Tiễn]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Vòm cầu parabol, cổng chào giao thông, diện tích rào chắn và tối ưu hóa kinh tế.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🏆 Cột Mốc Hoàn Thành Toàn Bộ Chương VI")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 82%
    )[
      #text(weight: "bold", fill: rgb("#15803d"), size: 17pt)[🎓 CHÚC MỪNG BẠN ĐÃ HOÀN THÀNH TOÀN BỘ CHƯƠNG VI!]\
      #v(0.4em)
      #text(size: 11pt, fill: rgb("#1f2937"))[
        Bạn đã làm chủ hoàn chỉnh 100% nội dung *Chương VI: Hàm số, đồ thị và ứng dụng* với 5 chuyên đề chuyên sâu từ lý thuyết nền tảng đến các ứng dụng thực tế đỉnh cao.\
        #v(0.3em)
        *Khởi đầu xuất sắc cho Học Kỳ II Toán 10!*
      ]
      #v(0.6em)
      #link(label("lec-toc-main"))[
        #block(fill: rgb("#1e40af"), inset: (x: 12pt, y: 6pt), radius: 5pt)[
          #text(fill: white, weight: "bold", size: 10pt)[⏮ Quay lại Mục lục chính]
        ]
      ]
    ]
  ]
]
