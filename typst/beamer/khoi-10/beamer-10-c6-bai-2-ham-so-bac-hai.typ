#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Hàm Số Bậc Hai],
  subtitle: [TOÁN 10 — CHƯƠNG VI: ĐỒ THỊ PARABOL, TỌA ĐỘ ĐỈNH, BIẾN THIÊN & ỨNG DỤNG],
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
// PHẦN I: ĐỊNH NGHĨA & ĐỒ THỊ PARABOL
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia-parabol", "🎯", [I. Định Nghĩa & Đồ Thị Parabol])

#lt-slide-back(title: "🎯 Galileo Galilei & Bài Toán Quỹ Đạo Đạn Đạo")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Từ quả đạn đại bác đến phương trình toán học")[
        - Năm 1638, *Galileo Galilei* dùng toán học chứng minh: Quỹ đạo vật ném trong trọng trường *là một đường Parabol*.
        - Hàm số bậc hai $y = a x^2 + b x + c$ là mô hình hoàn hảo cho chuyển động rơi tự do và đạn đạo học.
      ]
      #v(0.15em)
      #lt-tip(title: "Ứng dụng muôn nơi")[
        Đèn pha, chảo vệ tinh, cáp cầu treo và vòm cầu kiến trúc đều khai thác tính chất tiêu điểm của Parabol!
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 7pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[📜 Galileo Galilei (1564 – 1642)]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Trong *Two New Sciences* (1638), Galileo phân tích chuyển động ném thành 2 thành phần độc lập:
          - *Ngang:* Đều $x = (v_0 cos alpha) t$.
          - *Dọc:* Rơi tự do $y = (v_0 sin alpha) t - 1/2 g t^2$.
          Khử $t$, ta được phương trình quỹ đạo $y = A x^2 + B x$ — chính là *Parabol bậc hai* có bề lõm quay xuống!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Định Nghĩa Hàm Số Bậc Hai & Tọa Độ Đỉnh")[
  #lt-definition(title: "Định nghĩa hàm số bậc hai")[
    *Hàm số bậc hai* là hàm số được cho bởi công thức:
    $ y = a x^2 + b x + c quad (a != 0) $
    trong đó $a, b, c$ là các hằng số thực, $x$ là biến số. Tập xác định $D = RR$.
  ]
  #v(0.2em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Các yếu tố hình học cốt lõi")[
        - *Đỉnh Parabol:* $I(- b / (2a); - Delta / (4a))$ với $Delta = b^2 - 4a c$.
        - *Trục đối xứng:* Đường thẳng $x = - b / (2a)$ (đi qua đỉnh $I$ và song song $O y$).
      ]
    ],
    [
      #lt-important(title: "Bề lõm Parabol")[
        - $a > 0$: Bề lõm quay *lên trên*, đỉnh $I$ là điểm *thấp nhất*.
        - $a < 0$: Bề lõm quay *xuống dưới*, đỉnh $I$ là điểm *cao nhất*.
      ]
    ]
  )
]

#lt-slide-back(title: "📊 Hình Dạng Đồ Thị Parabol (CeTZ Visualization)")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #align(center)[
        #text(weight: "bold", fill: rgb("#1e40af"), size: 10pt)[Trường hợp $a > 0$ (Bề lõm hướng lên)]
        #v(0.1em)
        #cetz.canvas({
          import cetz.draw: *
          // Trục tọa độ
          line((-1.2, 0), (3.2, 0), stroke: 0.6pt, mark: (end: "stealth"))
          line((0, -1.8), (0, 2.5), stroke: 0.6pt, mark: (end: "stealth"))
          content((3.0, -0.2), text(size: 8pt)[$x$])
          content((-0.2, 2.3), text(size: 8pt)[$y$])
          content((-0.18, -0.2), text(size: 7.5pt)[$O$])
          
          // Parabol y = (x-1)^2 - 1.2
          line(..range(-6, 27).map(t => {
            let x = t / 10;
            (x, calc.pow(x - 1.0, 2) - 1.2)
          }), stroke: 1.4pt + rgb("#1e40af"))
          
          // Trục đối xứng x = 1
          line((1.0, -1.6), (1.0, 2.2), stroke: (dash: "dashed", paint: rgb("#dc2626"), thickness: 0.8pt))
          // Nối tọa độ đỉnh
          line((1.0, 0), (1.0, -1.2), stroke: (dash: "dotted", paint: gray))
          line((0, -1.2), (1.0, -1.2), stroke: (dash: "dotted", paint: gray))
          // Đỉnh I
          circle((1.0, -1.2), radius: 2.2pt, fill: rgb("#dc2626"))
          content((1.0, 0.2), text(fill: rgb("#dc2626"), size: 7.5pt)[$-b/(2a)$])
          content((-0.45, -1.2), text(fill: rgb("#dc2626"), size: 7pt)[$-Delta/(4a)$])
          content((1.9, -1.45), text(fill: rgb("#dc2626"), weight: "bold", size: 8pt)[$I$ (Đáy)])
        })
      ]
    ],
    [
      #align(center)[
        #text(weight: "bold", fill: rgb("#047857"), size: 10pt)[Trường hợp $a < 0$ (Bề lõm hướng xuống)]
        #v(0.1em)
        #cetz.canvas({
          import cetz.draw: *
          // Trục tọa độ
          line((-1.2, 0), (3.2, 0), stroke: 0.6pt, mark: (end: "stealth"))
          line((0, -1.8), (0, 2.5), stroke: 0.6pt, mark: (end: "stealth"))
          content((3.0, -0.2), text(size: 8pt)[$x$])
          content((-0.2, 2.3), text(size: 8pt)[$y$])
          content((-0.18, -0.2), text(size: 7.5pt)[$O$])
          
          // Parabol y = -(x-1)^2 + 1.5
          line(..range(-6, 27).map(t => {
            let x = t / 10;
            (x, -calc.pow(x - 1.0, 2) + 1.5)
          }), stroke: 1.4pt + rgb("#047857"))
          
          // Trục đối xứng x = 1
          line((1.0, -1.6), (1.0, 2.2), stroke: (dash: "dashed", paint: rgb("#dc2626"), thickness: 0.8pt))
          // Nối tọa độ đỉnh
          line((1.0, 0), (1.0, 1.5), stroke: (dash: "dotted", paint: gray))
          line((0, 1.5), (1.0, 1.5), stroke: (dash: "dotted", paint: gray))
          // Đỉnh I
          circle((1.0, 1.5), radius: 2.2pt, fill: rgb("#dc2626"))
          content((1.0, -0.25), text(fill: rgb("#dc2626"), size: 7.5pt)[$-b/(2a)$])
          content((-0.45, 1.5), text(fill: rgb("#dc2626"), size: 7pt)[$-Delta/(4a)$])
          content((1.9, 1.7), text(fill: rgb("#dc2626"), weight: "bold", size: 8pt)[$I$ (Đỉnh)])
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: BIẾN THIÊN, CỰC TRỊ & VẼ ĐỒ THỊ
// ════════════════════════════════════════════════
#lt-section-link("sec-bien-thien-ve-dothi", "📈", [II. Chiều Biến Thiên, Cực Trị & Vẽ Đồ Thị])

#lt-slide-back(title: "📈 Bảng Biến Thiên & Cực Trị Trên R")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Khi a > 0 (Đạt GTNN tại đỉnh)")[
        - Nghịch biến trên $(-infinity; -b / (2a))$.
        - Đồng biến trên $(-b / (2a); +infinity)$.
        - Giá trị nhỏ nhất trên $RR$ là:
        $ min_(x in RR) y = - Delta / (4a) quad text("tại") quad x = - b / (2a) $
      ]
    ],
    [
      #lt-theorem(title: "Khi a < 0 (Đạt GTLN tại đỉnh)")[
        - Đồng biến trên $(-infinity; -b / (2a))$.
        - Nghịch biến trên $(-b / (2a); +infinity)$.
        - Giá trị lớn nhất trên $RR$ là:
        $ max_(x in RR) y = - Delta / (4a) quad text("tại") quad x = - b / (2a) $
      ]
    ]
  )
  #v(0.2em)
  #lt-tip(title: "Kỹ thuật tìm nhanh tung độ đỉnh")[
    Thay vì nhớ công thức $-Delta / (4a)$ dễ nhầm lẫn, hãy tính hoành độ đỉnh $x_0 = -b / (2a)$ rồi thế trực tiếp vào công thức hàm số: $y_0 = f(x_0)$!
  ]
]

#lt-slide-back(title: "🎯 GTLN & GTNN Của Hàm Số Bậc Hai Trên Đoạn [α; β]")[
  #lt-definition(title: "Phương pháp tìm min / max trên đoạn khép kín [α; β]")[
    Cho hàm số bậc hai $y = f(x) = a x^2 + b x + c$ trên đoạn $[alpha; beta]$.
    1. *Bước 1:* Tính hoành độ đỉnh $x_I = - b / (2a)$.
    2. *Bước 2:* Tính giá trị hai đầu mút $f(alpha)$ và $f(beta)$.
    3. *Bước 3:* Kiểm tra vị trí đỉnh:
       - Nếu $x_I in [alpha; beta]$, tính thêm tung độ đỉnh $f(x_I)$.
         Khi đó: $max = max{f(alpha), f(beta), f(x_I)}$ và $min = min{f(alpha), f(beta), f(x_I)}$.
       - Nếu $x_I thin cancel(in) thin [alpha; beta]$, chỉ so sánh hai đầu mút $f(alpha)$ và $f(beta)$.
  ]
  #v(0.15em)
  #lt-important(title: "Lưu ý then chốt")[
    Đỉnh parabol chỉ đóng vai trò cực trị khi và chỉ khi hoành độ đỉnh *rơi vào khoảng đang xét*!
  ]
]

#lt-slide-back(title: "🎨 5 Bước Vẽ Đồ Thị Parabol Chuẩn")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-theorem(title: "Quy trình 5 bước xác định đồ thị")[
        1. Xác định tọa độ đỉnh $I(- b / (2a); - Delta / (4a))$.
        2. Vẽ trục đối xứng: đường thẳng đứng $x = - b / (2a)$.
        3. Xác định giao điểm với trục tung: $A(0; c)$ và điểm đối xứng của $A$ qua trục: $A'(- b / a; c)$.
        4. Tìm giao điểm với trục hoành (nếu có): giải $a x^2 + b x + c = 0$.
        5. Vẽ parabol đi qua các điểm đặc trưng, chú ý bề lõm theo dấu của $a$.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[🌉 Vòm Cầu & Kiến Trúc Parabol]\
        #v(0.2em)
        #text(size: 8.5pt)[
          - *Cổng Gateway Arch (St. Louis, Mỹ)* cao $192$ m có hình dáng dây xích tương tự parabol ngược, tối ưu phân bố lực nén.
          - *Cầu vòm Sydney, cầu Trường Tiền:* Cấu trúc vòm cong giúp triệt tiêu momen uốn, biến tải trọng thẳng đứng thành lực nén đẩy vào mố cầu hai bên bờ!
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & THỰC TIỄN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Trắc nghiệm & Ứng dụng])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VI BÀI 2],
  questions: (
    (num: 1, type: "TN", desc: [Tọa độ đỉnh parabol]),
    (num: 2, type: "TN", desc: [Trục đối xứng parabol]),
    (num: 3, type: "TN", desc: [Khoảng nghịch biến parabol]),
    (num: 4, type: "TN", desc: [Giá trị nhỏ nhất trên R]),
    (num: 5, type: "TN", desc: [Xác định parabol qua đỉnh]),
    (num: 6, type: "TN", desc: [Rào vườn diện tích cực đại]),
    (num: 7, type: "DS", desc: [Đúng/Sai khảo sát toàn diện]),
    (num: 8, type: "TLN", desc: [Đỉnh thuộc đường thẳng]),
    (num: 9, type: "TLN", desc: [Chiều cao vòm cầu parabol]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tọa độ đỉnh $I$ của parabol $y = x^2 - 4x + 3$ là:],
  (
    [$I(2; -1)$],
    [$I(-2; 15)$],
    [$I(4; 3)$],
    [$I(-4; 35)$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 17A — Tọa Độ Đỉnh Parabol Cơ Bản",
  loigiai: [
    Hàm số bậc hai có hệ số $a = 1$, $b = -4$, $c = 3$.\
    - Hoành độ đỉnh: $x_I = - b / (2a) = - (-4) / (2 dot 1) = 2$.\
    - Tung độ đỉnh: $y_I = 2^2 - 4(2) + 3 = 4 - 8 + 3 = -1$.\
    Vậy tọa độ đỉnh của parabol là $I(2; -1)$.\
    Chọn đáp án *A: $I(2; -1)$*.
  ]
)

#lt-tn(
  [Trục đối xứng của parabol $y = -2x^2 + 8x - 5$ là đường thẳng có phương trình:],
  (
    [$x = 2$],
    [$x = -2$],
    [$x = 4$],
    [$y = 3$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 17A — Trục Đối Xứng Của Parabol",
  loigiai: [
    Trục đối xứng của parabol $y = a x^2 + b x + c$ là đường thẳng $x = - b / (2a)$.\
    Với $a = -2$ và $b = 8$, ta có:\
    $x = - 8 / (2 dot (-2)) = - 8 / (-4) = 2$.\
    Vậy trục đối xứng là $x = 2$.\
    Chọn đáp án *A: $x = 2$*.
  ]
)

#lt-tn(
  [Hàm số bậc hai $y = x^2 - 6x + 8$ NGHỊCH BIẾN trên khoảng nào sau đây?],
  (
    [$(-infinity; 3)$],
    [$(3; +infinity)$],
    [$(-infinity; 6)$],
    [$(0; +infinity)$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 17A — Khoảng Nghịch Biến Của Hàm Bậc Hai",
  loigiai: [
    Hàm số có hệ số $a = 1 > 0$ và hoành độ đỉnh $x_I = - (-6) / (2 dot 1) = 3$.\
    Do bề lõm quay lên trên nên hàm số:\
    - Nghịch biến trên khoảng $(-infinity; 3)$.\
    - Đồng biến trên khoảng $(3; +infinity)$.\
    Chọn đáp án *A: $(-infinity; 3)$*.
  ]
)

#lt-tn(
  [Giá trị nhỏ nhất của hàm số $y = x^2 - 2x + 5$ trên toàn trục số thực $RR$ bằng:],
  (
    [$4$],
    [$5$],
    [$1$],
    [$3$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 17A — Giá Trị Nhỏ Nhất Của Parabol Trên R",
  loigiai: [
    Biến đổi hàm số về dạng bình phương chính tắc:\
    $y = (x - 1)^2 + 4 >= 4 text(" với mọi ") x in RR$.\
    Đẳng thức xảy ra khi $x - 1 = 0 <=> x = 1$.\
    Vậy giá trị nhỏ nhất của hàm số trên $RR$ là $4$.\
    Chọn đáp án *A: $4$*.
  ]
)

#lt-tn(
  [Cho parabol $(P): y = a x^2 + b x + c$ đi qua gốc tọa độ $O(0; 0)$ và có đỉnh $I(1; -2)$. Phương trình của parabol là:],
  (
    [$y = 2x^2 - 4x$],
    [$y = x^2 - 2x$],
    [$y = -2x^2 + 4x$],
    [$y = 2x^2 + 4x$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 17A — Xác Định Parabol Qua Các Yếu Tố Hình Học",
  loigiai: [
    - Qua $O(0; 0) => c = 0$. Hoành độ đỉnh $x_I = - b / (2a) = 1 <=> b = -2a$.\
    - Tung độ đỉnh $y_I = a(1)^2 + b(1) = -2 <=> a - 2a = -2 <=> a = 2 => b = -4$.\
    - Vậy phương trình parabol là $y = 2x^2 - 4x$. Chọn đáp án *A*.
  ]
)

#lt-tn(
  [Bác Nam dùng $40$ m lưới thép rào một mảnh vườn hình chữ nhật tựa vào bức tường gạch có sẵn (chỉ rào 3 cạnh). Diện tích lớn nhất bác rào được là:],
  (
    [$200 text(" m")^2$],
    [$100 text(" m")^2$],
    [$400 text(" m")^2$],
    [$150 text(" m")^2$],
  ),
  correct: 1,
  num: 6,
  de: "Đề 17A — Ứng Dụng Tối Ưu Hóa Diện Tích Rào Vườn",
  loigiai: [
    - Gọi cạnh vuông góc với tường là $x$ ($0 < x < 20$), cạnh song song tường là $40 - 2x$.\
    - Diện tích mảnh vườn: $S(x) = x(40 - 2x) = -2x^2 + 40x$ ($a = -2 < 0$).\
    - Đạt cực đại tại $x = - 40 / (2 dot (-2)) = 10 text(" m") => S_text("max") = 10(20) = 200 text(" m")^2$. Chọn *A*.
  ]
)

#lt-ds(
  [Cho parabol $(P): y = -x^2 + 2x + 3$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Tọa độ đỉnh của parabol $(P)$ là $I(1; 4)$.],
    [Parabol cắt trục hoành tại hai điểm $A(-1; 0)$ và $B(3; 0)$.],
    [Hàm số đồng biến trên $(-infinity; 1)$ và nghịch biến trên $(1; +infinity)$.],
    [Giá trị nhỏ nhất của hàm số trên đoạn $[0; 4]$ bằng $0$.],
  ),
  num: 7,
  de: "Đề 17A — Khảo Sát Toàn Diện Parabol & GTNN Trên Đoạn",
  loigiai: [
    - a) *Đúng:* $x_I = -2 / (2(-1)) = 1$; $y_I = -(1)^2 + 2(1) + 3 = 4 => I(1; 4)$.\
    - b) *Đúng:* $-x^2 + 2x + 3 = 0 <=> x = -1$ hoặc $x = 3$.\
    - c) *Đúng:* Vì $a = -1 < 0$, đồ thị quay xuống nên đồng biến trên $(-infinity; 1)$, nghịch biến trên $(1; +infinity)$.\
    - d) *Sai:* Trên $[0; 4]$ có đỉnh $x = 1$. Tính các giá trị: $f(0) = 3$, $f(1) = 4$, $f(4) = -(4)^2 + 2(4) + 3 = -5$. Do đó $min_([0; 4]) = -5$ (tại $x = 4$) chứ không phải $0$.
  ]
)

#lt-tln(
  [Tìm giá trị của tham số $m$ để đỉnh của parabol $y = x^2 - 2x + m$ nằm trên đường thẳng $d: y = 2x + 1$.],
  "4",
  num: 8,
  de: "Đề 17A — Tham Số Đỉnh Parabol Thuộc Đường Thẳng",
  loigiai: [
    - Hoành độ đỉnh: $x_I = - (-2) / (2 dot 1) = 1$.\
    - Tung độ đỉnh: $y_I = 1^2 - 2(1) + m = m - 1 => I(1; m - 1)$.\
    - Điểm $I in d <=> m - 1 = 2(1) + 1 <=> m - 1 = 3 <=> m = 4$.\
    Vậy giá trị cần tìm là *4*.
  ]
)

#lt-tln(
  [Một cây cầu vòm hình parabol có nhịp cầu dài $A B = 40$ m, đỉnh vòm cầu cao $10$ m so với mặt sàn. Tính chiều cao vòm cầu tại điểm cách chân cầu $A$ một khoảng $10$ m (đơn vị: mét).],
  "7.5",
  num: 9,
  de: "Đề 17B — Ứng Dụng Thực Tế Chiều Cao Vòm Cầu Parabol",
  loigiai: [
    - Chọn hệ trục $O x y$ có gốc $O$ là trung điểm sàn cầu $A B$, đỉnh cầu $(0; 10)$.\
    - Hai chân cầu là $A(-20; 0)$ và $B(20; 0)$.\
    - Phương trình vòm: $y = a x^2 + 10$. Qua $B(20; 0) => a(20)^2 + 10 = 0 <=> a = -1/40$.\
    - Điểm cách chân $A$ $10$ m có hoành độ $x = -20 + 10 = -10$.\
    - Chiều cao: $y = - 1/40 (-10)^2 + 10 = -2.5 + 10 = 7.5$ m.\
    Đáp số: *7.5*.
  ]
)

// ════════════════════════════════════════════════
// PHẦN IV: MA TRẬN KIẾN THỨC & TỔNG KẾT
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket", "🏆", [IV. Ma Trận Kiến Thức & Tổng Kết])

#lt-slide-back(title: "🧠 Ma Trận 6 Khối Kiến Thức Cốt Lõi")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 9pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#3b82f6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[1. Tọa Độ Đỉnh]\
        #v(0.15em)
        #text(size: 8.5pt)[
          $I(- b / (2a); - Delta / (4a))$\
          Điểm uốn cao nhất ($a < 0$) hoặc thấp nhất ($a > 0$) của đồ thị.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10.5pt)[2. Trục Đối Xứng]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Đường thẳng $x = - b / (2a)$.\
          Parabol nhận đường thẳng này làm trục đối xứng gương hoàn hảo.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[3. Bề Lõm Parabol]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - $a > 0$: Quay lên ($arrow.br thin arrow.tr$).\
          - $a < 0$: Quay xuống ($arrow.tr thin arrow.br$).\
          Quyết định chiều cực trị.
        ]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 10.5pt)[4. Bảng Biến Thiên]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Đổi chiều tại $x = -b / (2a)$.\
          Dễ dàng đọc khoảng đồng biến / nghịch biến của hàm số.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 10.5pt)[5. Cực Trị Trên Đoạn]\
        #v(0.15em)
        #text(size: 8.5pt)[
          So sánh $f(alpha), f(beta)$.\
          Nếu đỉnh $x_I in [alpha; beta]$, tính thêm $f(x_I)$ để tìm $max, min$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[6. Mô Hình Thực Tế]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Quỹ đạo ném đạn đạo, nhịp vòm cầu, tối ưu hóa doanh thu và diện tích rào chắn.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🏆 Cột Mốc Hoàn Thành Bài Học")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 82%
    )[
      #text(weight: "bold", fill: rgb("#15803d"), size: 17pt)[🎉 CHÚC MỪNG BẠN ĐÃ LÀM CHỦ HÀM SỐ BẬC HAI!]\
      #v(0.4em)
      #text(size: 11pt, fill: rgb("#1f2937"))[
        Bạn đã nắm vững tọa độ đỉnh, trục đối xứng, bảng biến thiên và các mô hình toán học thực tế từ quỹ đạo Galileo đến vòm cầu kiến trúc hiện đại.\
        #v(0.3em)
        *Tiếp theo:* Bài 3 — Dấu của tam thức bậc hai & Bất phương trình bậc hai một ẩn!
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
