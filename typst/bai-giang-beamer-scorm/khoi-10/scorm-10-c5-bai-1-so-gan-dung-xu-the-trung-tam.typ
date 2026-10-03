#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"

#show: lecture-theme.with(
  title: [Số Gần Đúng & Xu Thế Trung Tâm],
  subtitle: [TOÁN 10 — CHƯƠNG V: SAI SỐ, SỐ TRUNG BÌNH, TRUNG VỊ, TỨ PHÂN VỊ & MỐT],
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
// PHẦN I: SỐ GẦN ĐÚNG VÀ SAI SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-so-gan-dung-sai-so", "🎯", [I. Số Gần Đúng & Sai Số])

#lt-slide-back(title: "🎯 Số Gần Đúng & Sai Số Tuyệt Đối")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Khái niệm số gần đúng")[
        Trong thực tế đo đạc và tính toán, ta thường chỉ nhận được số gần đúng $a$ của giá trị đúng $overline(a)$.
        - *Sai số tuyệt đối:* $Delta_a = |overline(a) - a|$.
        - *Độ chính xác $d$:* Nếu $Delta_a <= d$ thì ta viết:
        $ overline(a) = a plus.minus d quad "hay" quad a - d <= overline(a) <= a + d $
      ]
      #v(0.2em)
      #lt-important(title: "Sai số tương đối")[
        $ delta_a = Delta_a / (|a|) <= d / (|a|) $
        Sai số tương đối càng nhỏ thì phép đo càng chính xác!
      ]
    ],
    [
      #block(fill: rgb("#fff1f2"), stroke: 1.5pt + rgb("#f43f5e"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#be123c"), size: 11pt)[⚠️ Thảm kịch Tên lửa Patriot 1991]
        #v(0.2em)
        #text(size: 9pt)[
          - Máy tính Patriot đo thời gian theo đơn vị $0.1$ s.
          - Con số $0.1$ trong hệ nhị phân là số vô hạn tuần hoàn, bị máy tính làm tròn gây sai số $0.000000095$ s mỗi bước.
          - Sau $100$ giờ chạy liên tục, sai số tích lũy:
          $Delta t approx 0.34$ giây!
          - Ở vận tốc $1676$ m/s của tên lửa Scud, độ lệch radar lên tới *575 mét* khiến hệ thống bỏ lỡ mục tiêu, cướp đi 28 sinh mạng!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📏 Quy Tắc Làm Tròn Số & Chữ Số Chắc")[
  #lt-theorem(title: "Quy tắc làm tròn theo độ chính xác d")[
    - Nếu độ chính xác $d$ đến hàng nào thì ta làm tròn số gần đúng $a$ đến *hàng ngay phía trên* hàng đó (hàng lớn hơn một bậc).
    - Ví dụ: Độ chính xác $d = 0.03$ (hàng phần trăm) $=>$ Làm tròn số $a$ đến *hàng phần mười*.
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"))[Ví dụ 1: Làm tròn theo d]\
        Cho $overline(a) = 452.178 plus.minus 0.05$.\
        - Độ chính xác $d = 0.05$ (hàng phần trăm).\
        - Ta làm tròn $452.178$ đến hàng phần mười:\
        $overline(a) approx 452.2$.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#22c55e"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#15803d"))[Ví dụ 2: Hàng chục và hàng trăm]\
        Cho $overline(b) = 182745 plus.minus 300$.\
        - Độ chính xác $d = 300$ (hàng trăm).\
        - Ta làm tròn số đến hàng nghìn:\
        $overline(b) approx 183000$.
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: SỐ TRUNG BÌNH VÀ MỐT
// ════════════════════════════════════════════════
#lt-section-link("sec-so-trung-binh-mot", "📊", [II. Số Trung Bình & Mốt])

#lt-slide-back(title: "📊 Số Trung Bình Cộng Của Mẫu Số Liệu")[
  #lt-two-col(
    ratio: (54%, 46%),
    [
      #lt-definition(title: "Công thức số trung bình")[
        Cho mẫu số liệu kích thước $n$: $x_1, x_2, ..., x_n$.
        Số trung bình cộng, kí hiệu $overline(x)$, là:
        $ overline(x) = (x_1 + x_2 + ... + x_n) / n = 1/n sum_(i=1)^n x_i $
        Nếu mẫu cho dưới dạng bảng tần số $(x_k, n_k)$ với $sum n_k = n$:
        $ overline(x) = (n_1 x_1 + n_2 x_2 + ... + n_k x_k) / n $
      ]
      #v(0.2em)
      #lt-tip(title: "Ý nghĩa")[
        Là đại diện cho độ lớn trung bình của toàn bộ dữ liệu.
      ]
    ],
    [
      #lt-warning(title: "Khi nào số trung bình bị méo mó?")[
        *Số trung bình rất nhạy cảm với các giá trị ngoại lệ (outliers)!*
        #v(0.2em)
        #text(size: 9.5pt)[
          Nếu trong tập dữ liệu có 1 hoặc vài con số cực lớn hoặc cực bé, số trung bình sẽ bị kéo lệch hẳn về phía đó và không còn đại diện đúng cho số đông!
        ]
      ]
      #v(0.2em)
      #block(fill: rgb("#fefce8"), stroke: 1pt + rgb("#eab308"), inset: 7pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#a16207"))[Mốt (Mode - $M_o$):]\
        #text(size: 9.5pt)[
          Là giá trị xuất hiện với tần số lớn nhất trong mẫu số liệu. (Ứng dụng: Size giày bán chạy nhất, video thịnh hành nhất).
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: TRUNG VỊ VÀ TỨ PHÂN VỊ
// ════════════════════════════════════════════════
#lt-section-link("sec-trung-vi-tu-phan-vi", "📈", [III. Trung Vị & Tứ Phân Vị])

#lt-slide-back(title: "📈 Trung Vị (Median — Me): Người Bảo Vệ Sự Thật")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-definition(title: "Định nghĩa trung vị")[
        Sắp xếp mẫu số liệu gồm $n$ số theo thứ tự không giảm:
        $ x_1 <= x_2 <= ... <= x_n $
        - Nếu $n$ lẻ: $M_e = x_((n+1)/2)$ (số chính giữa).
        - Nếu $n$ chẵn: $M_e = 1/2 (x_(n/2) + x_(n/2 + 1))$ (trung bình cộng 2 số ở giữa).
      ]
      #v(0.2em)
      #lt-important(title: "Ưu điểm vượt trội")[
        Trung vị không bị ảnh hưởng bởi giá trị ngoại lệ!
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#22c55e"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[💡 Nghịch lý Bill Gates Vào Quán Bia]
        #v(0.2em)
        #text(size: 9pt)[
          - 10 công nhân uống bia có lương 10 đến 16 triệu:
          $overline(x) = 13$ triệu, $M_e = 13$ triệu.
          - Bill Gates (thu nhập 100 tỷ/tháng) bước vào:
          - $overline(x)_("mới") approx 9.1$ *TỶ đồng/người!* (Ảo tưởng phi thực tế).
          - $M_e_("mới") = 13$ *triệu đồng!* (Vẫn trung thực phản ánh đời sống người lao động).
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📊 Tứ Phân Vị (Quartiles — Q1, Q2, Q3)")[
  #lt-definition(title: "Cách xác định tứ phân vị")[
    Sắp xếp mẫu số liệu $n$ phần tử theo thứ tự không giảm:
    - *Tứ phân vị thứ hai:* $Q_2 = M_e$ (trung vị của toàn bộ mẫu số liệu).
    - *Tứ phân vị thứ nhất ($Q_1$):* Là trung vị của nửa số liệu bên trái $Q_2$ (không tính $Q_2$ nếu $n$ lẻ).
    - *Tứ phân vị thứ ba ($Q_3$):* Là trung vị của nửa số liệu bên phải $Q_2$ (không tính $Q_2$ nếu $n$ lẻ).
  ]
  #v(0.2em)
  #lt-tip(title: "Ý nghĩa chia phần trăm của tứ phân vị")[
    Bộ ba số $(Q_1, Q_2, Q_3)$ chia mẫu số liệu đã sắp xếp thành *bốn phần bằng nhau*, mỗi phần chiếm $25\%$ tổng số quan sát:
    $ [x_(min) dots Q_1 (25\%)] quad [Q_1 dots Q_2 (25\%)] quad [Q_2 dots Q_3 (25\%)] quad [Q_3 dots x_(max) (25\%)] $
  ]
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM CHỌN 1 ĐÁP ÁN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "✍️", [IV. Luyện tập: Trắc nghiệm 4 phương án])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — SỐ GẦN ĐÚNG & XU THẾ TRUNG TÂM],
  questions: (
    (num: 1, type: "TN", desc: [Tính Sai Số Tương Đối]),
    (num: 2, type: "TN", desc: [Quy Tắc Làm Tròn Số]),
    (num: 3, type: "TN", desc: [Tính Số Trung Bình]),
    (num: 4, type: "TN", desc: [Trung Vị Mẫu Chẵn Số Liệu]),
    (num: 5, type: "TN", desc: [Xác Định Tứ Phân Vị Q1]),
    (num: 6, type: "TN", desc: [Xác Định Mốt]),
    (num: 7, type: "DS", desc: [Đúng/Sai Toàn Diện Xu Thế Trung Tâm]),
    (num: 8, type: "TLN", desc: [Sai Số Tương Đối Bồn Chứa]),
    (num: 9, type: "TLN", desc: [Xác Định Q3 Mẫu Lẻ]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Một hình chữ nhật có kích thước đo được là $x = 12.5$ m $plus.minus 0.1$ m. Sai số tương đối của phép đo chiều dài trên không vượt quá:],
  (
    [$0.8\%$],
    [$8\%$],
    [$0.08\%$],
    [$1.25\%$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 13A — Tính Sai Số Tương Đối",
  loigiai: [
    Sai số tương đối của phép đo được xác định bởi:\
    $delta_x = d / (|a|) = (0.1) / (12.5) = 0.008 = 0.8\%$.\
    Chọn đáp án *A: 0.8%*.
  ]
)

#lt-tn(
  [Cho số gần đúng $a = 2374802$ với độ chính xác $d = 100$. Số quy tròn của số $a$ là:],
  (
    [$2374800$],
    [$2375000$],
    [$2374000$],
    [$2370000$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 13A — Quy Tắc Làm Tròn Số",
  loigiai: [
    Độ chính xác $d = 100$ (hàng trăm).\
    Theo quy tắc, ta làm tròn số $a$ đến hàng nghìn (hàng liền trước hàng trăm).\
    Chữ số hàng trăm của $a$ là $8 >= 5$ nên ta cộng thêm $1$ vào chữ số hàng nghìn $4 => 5$.\
    Số quy tròn là $2375000$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Điểm kiểm tra môn Toán của 7 học sinh là: $5, 7, 8, 8, 9, 9, 10$. Số trung bình cộng của mẫu số liệu trên bằng:],
  (
    [$7.5$],
    [$8.0$],
    [$8.5$],
    [$9.0$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 13B — Tính Số Trung Bình",
  loigiai: [
    Tổng số điểm: $S = 5 + 7 + 8 + 8 + 9 + 9 + 10 = 56$.\
    Số học sinh: $n = 7$.\
    Số trung bình: $overline(x) = 56 / 7 = 8.0$. Chọn đáp án *B: 8.0*.
  ]
)

#lt-tn(
  [Thời gian hoàn thành một bài tập chạy (tính bằng giây) của 8 học sinh là: $11, 13, 14, 15, 16, 18, 19, 22$. Trung vị $M_e$ của mẫu số liệu là:],
  (
    [$15$],
    [$15.5$],
    [$16$],
    [$15.8$],
  ),
  correct: 2,
  num: 4,
  de: "Đề 13B — Trung Vị Mẫu Chẵn Số Liệu",
  loigiai: [
    Mẫu đã sắp xếp tăng dần, cỡ mẫu $n = 8$ (số chẵn).\
    Hai số nằm ở vị trí chính giữa là số thứ tư ($x_4 = 15$) và số thứ năm ($x_5 = 16$).\
    Trung vị: $M_e = (x_4 + x_5) / 2 = (15 + 16) / 2 = 15.5$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Cho mẫu số liệu thống kê: $3, 4, 6, 7, 8, 9, 11, 14, 18$. Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu là:],
  (
    [$4$],
    [$5$],
    [$6$],
    [$7$],
  ),
  correct: 2,
  num: 5,
  de: "Đề 13C — Xác Định Tứ Phân Vị Q1",
  loigiai: [
    Cỡ mẫu $n = 9$ (lẻ). Trung vị $Q_2 = x_5 = 8$.\
    Nửa mẫu dưới (bên trái $Q_2$) là: $3, 4, 6, 7$ (gồm 4 phần tử).\
    Trung vị của nửa dưới là: $Q_1 = (4 + 6) / 2 = 5$. Chọn đáp án *B: 5*.
  ]
)

#lt-tn(
  [Cỡ giày của 10 nam sinh lớp 10 được ghi lại như sau: $39, 40, 40, 41, 41, 41, 42, 42, 43, 44$. Mốt $M_o$ của mẫu số liệu bằng:],
  (
    [$40$],
    [$41$],
    [$42$],
    [$41.5$],
  ),
  correct: 2,
  num: 6,
  de: "Đề 13C — Xác Định Mốt",
  loigiai: [
    Đếm tần số xuất hiện của từng cỡ giày:\
    - Cỡ 39: 1 lần; cỡ 40: 2 lần; cỡ 41: 3 lần; cỡ 42: 2 lần; cỡ 43: 1 lần; cỡ 44: 1 lần.\
    Cỡ 41 có tần số lớn nhất ($n = 3$). Do đó $M_o = 41$. Chọn đáp án *B: 41*.
  ]
)

#lt-tn(
  [Cho số gần đúng $a = 23748023$ với độ chính xác $d = 101$. Hãy viết số quy tròn của số $a$.],
  (
    [$23748000$],
    [$2374800$],
    [$23748$],
    [$23749000$],
  ),
  correct: 1,
  num: 7,
  de: "Đề 13G — Quy Tròn Số",
  loigiai: [
    #step[Phân tích độ chính xác]
    Vì độ chính xác $d = 101$ (hàng trăm), ta phải làm tròn số $a$ đến hàng *nghìn* (lớn hơn một bậc).
    #step[Làm tròn]
    Chữ số hàng nghìn của $a = 23748023$ là 8. Chữ số hàng trăm là 0 ($<5$), nên giữ nguyên chữ số hàng nghìn.
    Vậy số quy tròn là $23748000$. Đáp án đúng là *A*.
  ]
)

#lt-tn(
  [Cho các số liệu thống kê về chiều cao (cm) của 7 học sinh: $160, 162, 165, 167, 168, 170, 190$. Giá trị nào đại diện tốt nhất cho chiều cao của nhóm học sinh này?],
  (
    [Số trung bình cộng],
    [Trung vị],
    [Mốt],
    [Tứ phân vị thứ nhất],
  ),
  correct: 2,
  num: 8,
  de: "Đề 13H — Chọn Số Đại Diện",
  loigiai: [
    #step[Nhận xét dữ liệu]
    Trong dãy số liệu có một giá trị ngoại lệ (outlier) rất lớn là $190$ cm so với phần còn lại.
    #step[Lựa chọn đại lượng]
    Khi có giá trị ngoại lệ, *Trung vị* là đại lượng đo xu thế trung tâm tốt nhất vì nó không bị ảnh hưởng bởi giá trị ngoại lệ, trong khi số trung bình sẽ bị kéo lên cao.
    Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Thời gian hoàn thành một bài tập (phút) của 6 học sinh lần lượt là: $12, 15, 14, 18, 11, 20$. Tìm trung vị của mẫu số liệu trên.],
  (
    [$14$],
    [$14.5$],
    [$15$],
    [$15.5$],
  ),
  correct: 2,
  num: 9,
  de: "Đề 13I — Trung Vị (N Chẵn)",
  loigiai: [
    #step[Sắp xếp số liệu]
    Sắp xếp mẫu số liệu theo thứ tự tăng dần: $11, 12, 14, 15, 18, 20$.
    #step[Tính trung vị]
    Cỡ mẫu $n = 6$ (chẵn), trung vị là trung bình cộng của 2 số chính giữa (số thứ 3 và 4):
    $M_e = (14 + 15) / 2 = 14.5$. Chọn đáp án *B*.
  ]
)

#lt-tn(
  [Điểm kiểm tra của một nhóm học sinh là: $4, 5, 5, 6, 7, 7, 7, 8, 9$. Tứ phân vị $Q_1, Q_2, Q_3$ lần lượt là:],
  (
    [$5 ; 7 ; 7.5$],
    [$5 ; 7 ; 7$],
    [$5.5 ; 7 ; 7.5$],
    [$4.5 ; 7 ; 8$],
  ),
  correct: 1,
  num: 10,
  de: "Đề 13J — Tứ Phân Vị",
  loigiai: [
    #step[Xác định Q2]
    Mẫu đã được sắp xếp tăng dần, số phần tử $n = 9$ (lẻ).
    Trung vị $Q_2 = x_5 = 7$.
    #step[Xác định Q1]
    Nửa dưới gồm 4 số: $4, 5, 5, 6$.
    $Q_1$ là trung vị của nửa dưới: $Q_1 = (5 + 5)/2 = 5$.
    #step[Xác định Q3]
    Nửa trên gồm 4 số: $7, 7, 8, 9$.
    $Q_3$ là trung vị của nửa trên: $Q_3 = (7 + 8)/2 = 7.5$.
    Vậy $Q_1=5, Q_2=7, Q_3=7.5$. Chọn *A*.
  ]
)

#lt-tn(
  [Biết số đúng $pi$ có giá trị gần đúng là $3.14159265...$. Làm tròn số $pi$ với độ chính xác $d = 0.005$, ta được số quy tròn là:],
  (
    [$3.14$],
    [$3.142$],
    [$3.141$],
    [$3.1$],
  ),
  correct: 1,
  num: 11,
  de: "Đề 13K — Làm Tròn Số Pi",
  loigiai: [
    #step[Xác định hàng làm tròn]
    Độ chính xác $d = 0.005$ (hàng phần nghìn).
    Theo quy tắc, ta phải làm tròn đến hàng phần trăm (hàng ngay phía trên).
    #step[Làm tròn số]
    Chữ số hàng phần trăm của $pi approx 3.14159...$ là $4$.
    Chữ số hàng phần nghìn là $1 (< 5)$, nên ta giữ nguyên chữ số hàng phần trăm.
    Số quy tròn là $3.14$. Chọn *A*.
  ]
)

#lt-tn(
  [Khảo sát size áo của 20 sinh viên, thu được kết quả: Size S (5 bạn), Size M (8 bạn), Size L (4 bạn), Size XL (3 bạn). Mốt của mẫu số liệu là:],
  (
    [$8$],
    [Size S],
    [Size M],
    [Size L],
  ),
  correct: 3,
  num: 12,
  de: "Đề 13L — Tìm Mốt Thực Tế",
  loigiai: [
    #step[Phân tích tần số]
    Tần số xuất hiện của các size: S(5), M(8), L(4), XL(3).
    #step[Kết luận Mốt]
    Size M có tần số lớn nhất ($n = 8$). Do đó Mốt là *Size M*.
    (Chú ý: Mốt là giá trị của dấu hiệu, không phải là tần số). Chọn *C*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & TRẢ LỜI NGẮN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho mẫu số liệu về điểm kiểm tra của một tổ gồm 10 học sinh: $4, 6, 6, 7, 7, 8, 8, 8, 9, 9$. Xét tính Đúng / Sai của các khẳng định sau:],
  (
    (body: [Số trung bình của mẫu số liệu là $overline(x) = 7.2$.], "true": true),
    (body: [Trung vị của mẫu số liệu là $M_e = 7.5$.], "true": true),
    (body: [Mốt của mẫu số liệu là $M_o = 8$.], "true": true),
    (body: [Tứ phân vị thứ ba là $Q_3 = 8.5$.], "true": false),
  ),
  de: "Đề 13D — Đúng/Sai Toàn Diện Xu Thế Trung Tâm",
  num: 7,
  loigiai: [
    - a) *Đ:* Tổng $= 4 + 6 + 6 + 7 + 7 + 8 + 8 + 8 + 9 + 9 = 72 => overline(x) = 72 / 10 = 7.2$.
    - b) *Đ:* $n = 10$, hai số giữa là $x_5 = 7$ và $x_6 = 8 => M_e = (7 + 8)/2 = 7.5$.
    - c) *Đ:* Điểm 8 xuất hiện 3 lần (nhiều nhất) $=> M_o = 8$.
    - d) *S:* Nửa mẫu trên là $8, 8, 8, 9, 9$ (5 phần tử), số chính giữa là số thứ 3: $Q_3 = 8$ (không phải $8.5$).
  ]
)

#lt-tln(
  [Khi đo thể tích của một bồn chứa nước, một kỹ sư đo được $V = 15000$ lít $plus.minus 60$ lít. Sai số tương đối của phép đo thể tích trên bằng bao nhiêu phần trăm? (Viết kết quả dưới dạng số thập phân, ví dụ 0.4).],
  [0.4],
  num: 8,
  de: "Đề 13E — Sai Số Tương Đối Bồn Chứa",
  loigiai: [
    Sai số tương đối: $delta = d / (|V|) = 60 / 15000 = 0.004 = 0.4\%$.\
    Đáp số: *$0.4$*.
  ]
)

#lt-tln(
  [Cho mẫu số liệu về số cây trồng được của 7 bạn: $12, 14, 15, 17, 19, 21, 28$. Tứ phân vị thứ ba $Q_3$ của mẫu số liệu bằng bao nhiêu?],
  [21],
  num: 9,
  de: "Đề 13F — Xác Định Q3 Mẫu Lẻ",
  loigiai: [
    Mẫu đã sắp xếp tăng dần, cỡ mẫu $n = 7$ (lẻ).\
    Trung vị $Q_2 = x_4 = 17$.\
    Nửa mẫu trên (các giá trị lớn hơn $Q_2$) gồm 3 số: $19, 21, 28$.\
    Trung vị của nửa trên là giá trị chính giữa: $Q_3 = 21$. Đáp số: *$21$*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & SƠ ĐỒ TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-c5-b1", "💎", [VI. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ Ma Trận Kiến Thức Đo Xu Thế Trung Tâm")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[1. SỐ GẦN ĐÚNG]
        #v(0.2em)
        #text(size: 10pt)[
          - Sai số tuyệt đối: $Delta_a <= d$.
          - Sai số tương đối: $delta_a = d / |a|$.
          - Làm tròn đến hàng trên hàng $d$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12pt)[2. SỐ TRUNG BÌNH]
        #v(0.2em)
        #text(size: 10pt)[
          - $overline(x) = 1/n sum x_i$.
          - Đại diện quy mô trung bình.
          - Nhạy cảm với giá trị ngoại lệ.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#a16207"), size: 12pt)[3. TRUNG VỊ (Me)]
        #v(0.2em)
        #text(size: 10pt)[
          - Giá trị ở chính giữa dãy số.
          - Bền vững trước các outlier.
          - Phản ánh trung thực số đông.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12pt)[4. TỨ PHÂN VỊ]
        #v(0.2em)
        #text(size: 10pt)[
          - $Q_1$ (25%), $Q_2 = M_e$ (50%), $Q_3$ (75%).
          - Chia dữ liệu thành 4 phần đều nhau.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12pt)[5. MỐT (Mo)]
        #v(0.2em)
        #text(size: 10pt)[
          - Giá trị có tần số lớn nhất.
          - Ứng dụng: Size hàng tồn kho, Top trending.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfeff"), stroke: 1.5pt + rgb("#0891b2"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#0891b2"), size: 12pt)[6. BƯỚC ĐỆM TIẾP THEO]
        #v(0.2em)
        #text(size: 10pt)[
          - Bài 2: Đo độ phân tán (Phương sai, Độ lệch chuẩn, Outlier).
          - Đo lường mức độ rủi ro & sai lệch.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎉 KẾT THÚC BÀI 1 — CHƯƠNG V!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Thống kê không chỉ là những con số vô hồn, đó là chiếc kính lúp nhìn vào chân lý."\
        Chuẩn bị khám phá #text(fill: rgb("#fde047"), weight: "bold")[Bài 2: Các Số Đặc Trưng Đo Độ Phân Tán]!
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
