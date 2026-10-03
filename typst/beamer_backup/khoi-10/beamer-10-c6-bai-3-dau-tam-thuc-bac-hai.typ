#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#show: lecture-theme.with(
  title: [Dấu Của Tam Thức Bậc Hai],
  subtitle: [TOÁN 10 — CHƯƠNG VI: ĐỊNH LÝ VỀ DẤU, BẤT PHƯƠNG TRÌNH & ỨNG DỤNG],
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
// PHẦN I: ĐỊNH LÝ VỀ DẤU CỦA TAM THỨC BẬC HAI
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-ly-dau", "🎯", [I. Định Lý Về Dấu Tam Thức Bậc Hai])

#lt-slide-back(title: "🎯 Định Nghĩa Tam Thức Bậc Hai")[
  #lt-two-col(
    ratio: (54%, 46%),
    [
      #lt-definition(title: "Định nghĩa")[
        *Tam thức bậc hai* đối với $x$ là biểu thức có dạng:
        $ f(x) = a x^2 + b x + c $
        trong đó $a, b, c$ là các số thực và $a != 0$.
        - $Delta = b^2 - 4a c$ (hoặc $Delta' = b'^2 - a c$).
        - Nghiệm của phương trình $f(x) = 0$ gọi là nghiệm của tam thức.
      ]
      #v(0.15em)
      #lt-tip(title: "Ý nghĩa hình học")[
        Dấu của $f(x)$ chính là vị trí của parabol $y = f(x)$ so với trục hoành $O x$ (nằm trên: dương, nằm dưới: âm).
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#f97316"), inset: 7pt, radius: 7pt)[
        #text(weight: "bold", fill: rgb("#c2410c"), size: 10.5pt)[📜 Khởi Nguồn Của Tam Thức Bậc Hai]\
        #v(0.15em)
        #text(size: 8.5pt)[
          - Người Babylon cổ đại (khoảng 2000 TCN) đã giải các bài toán diện tích quy về phương trình bậc hai.
          - Nhà toán học Ấn Độ *Brahmagupta* (năm 628) là người đầu tiên công bố công thức nghiệm tổng quát bằng ngôn từ.
          - Nhà toán học Ba Tư *Al-Khwarizmi* (thế kỷ IX) đã hình học hóa nghiệm bậc hai, đặt nền móng cho đại số học hiện đại!
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "📐 Định Lý Về Dấu Của Tam Thức Bậc Hai")[
  #lt-theorem(title: "Định lý về dấu (Phát biểu tổng quát)")[
    Cho tam thức bậc hai $f(x) = a x^2 + b x + c$ ($a != 0$) có biệt thức $Delta = b^2 - 4a c$:
    1. *Khi $Delta < 0$:* $f(x)$ *luôn cùng dấu với hệ số $a$* với mọi $x in RR$ ($a dot f(x) > 0, forall x in RR$).
    2. *Khi $Delta = 0$:* $f(x)$ *cùng dấu với hệ số $a$* với mọi $x != - b / (2a)$ ($f(-b/(2a)) = 0$).
    3. *Khi $Delta > 0$:* $f(x)$ có 2 nghiệm phân biệt $x_1 < x_2$. Khi đó:
       - *Trong khoảng hai nghiệm:* $f(x)$ *trái dấu* với hệ số $a$ ($x_1 < x < x_2$).
       - *Ngoài khoảng hai nghiệm:* $f(x)$ *cùng dấu* với hệ số $a$ ($x < x_1$ hoặc $x > x_2$).
  ]
  #v(0.15em)
  #lt-important(title: "Khẩu quyết kinh điển")[
    *"Trong trái — Ngoài cùng"* (Chỉ áp dụng khi tam thức có 2 nghiệm phân biệt $Delta > 0$).
  ]
]

#lt-slide-back(title: "📊 Minh Họa Hình Học 3 Trường Hợp Của Dấu (CeTZ)")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 8pt,
    [
      #align(center)[
        #text(weight: "bold", fill: rgb("#1e40af"), size: 9pt)[$Delta < 0$ (Không cắt Ox)]\
        #v(0.1em)
        #cetz.canvas({
          import cetz.draw: *
          line((-1.2, 0), (2.2, 0), stroke: 0.6pt, mark: (end: "stealth"))
          line((0, -0.6), (0, 2.2), stroke: 0.6pt, mark: (end: "stealth"))
          content((2.1, -0.2), text(size: 7pt)[$x$])
          content((-0.2, 2.0), text(size: 7pt)[$y$])
          // Parabol hoàn toàn trên Ox
          line(..range(-8, 19).map(t => {
            let x = t / 10;
            (x, calc.pow(x - 0.5, 2) + 0.4)
          }), stroke: 1.3pt + rgb("#1e40af"))
          content((0.5, 1.4), text(fill: rgb("#1e40af"), weight: "bold", size: 8pt)[$f(x) > 0, forall x$])
        })
      ]
    ],
    [
      #align(center)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 9pt)[$Delta = 0$ (Tiếp xúc Ox)]\
        #v(0.1em)
        #cetz.canvas({
          import cetz.draw: *
          line((-1.2, 0), (2.2, 0), stroke: 0.6pt, mark: (end: "stealth"))
          line((0, -0.6), (0, 2.2), stroke: 0.6pt, mark: (end: "stealth"))
          content((2.1, -0.2), text(size: 7pt)[$x$])
          content((-0.2, 2.0), text(size: 7pt)[$y$])
          // Parabol tiếp xúc tại x = 0.6
          line(..range(-6, 19).map(t => {
            let x = t / 10;
            (x, calc.pow(x - 0.6, 2))
          }), stroke: 1.3pt + rgb("#7c3aed"))
          circle((0.6, 0), radius: 2pt, fill: rgb("#dc2626"))
          content((0.6, -0.25), text(fill: rgb("#dc2626"), size: 6.5pt)[$-b/(2a)$])
          content((0.6, 1.4), text(fill: rgb("#7c3aed"), weight: "bold", size: 8pt)[$f(x) >= 0$])
        })
      ]
    ],
    [
      #align(center)[
        #text(weight: "bold", fill: rgb("#047857"), size: 9pt)[$Delta > 0$ (Cắt tại 2 điểm)]\
        #v(0.1em)
        #cetz.canvas({
          import cetz.draw: *
          line((-1.2, 0), (2.4, 0), stroke: 0.6pt, mark: (end: "stealth"))
          line((0, -1.0), (0, 2.0), stroke: 0.6pt, mark: (end: "stealth"))
          content((2.3, -0.2), text(size: 7pt)[$x$])
          content((-0.2, 1.8), text(size: 7pt)[$y$])
          // Parabol cắt tại x = 0 và x = 1.2
          line(..range(-6, 19).map(t => {
            let x = t / 10;
            (x, calc.pow(x - 0.6, 2) - 0.6)
          }), stroke: 1.3pt + rgb("#047857"))
          circle((0.6 - 0.77, 0), radius: 1.8pt, fill: rgb("#047857"))
          circle((0.6 + 0.77, 0), radius: 1.8pt, fill: rgb("#047857"))
          content((-0.2, 0.2), text(size: 6.5pt)[$x_1$])
          content((1.4, 0.2), text(size: 6.5pt)[$x_2$])
          content((0.6, -0.85), text(fill: rgb("#dc2626"), size: 7pt)[Trong: $(-)$])
          content((1.7, 1.2), text(fill: rgb("#047857"), size: 7pt)[Ngoài: $(+)$])
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: BẤT PHƯƠNG TRÌNH BẬC HAI & ĐIỀU KIỆN
// ════════════════════════════════════════════════
#lt-section-link("sec-bpt-bac-hai", "📈", [II. Bất Phương Trình Bậc Hai & Điều Kiện Có Nghiệm])

#lt-slide-back(title: "📈 Bất Phương Trình Bậc Hai Một Ẩn")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Định nghĩa BPT bậc hai")[
        *BPT bậc hai một ẩn* có dạng:
        $ a x^2 + b x + c > 0 quad (>= 0, < 0, <= 0) $
        với $a, b, c in RR$ và $a != 0$.
      ]
      #v(0.15em)
      #lt-theorem(title: "Quy trình giải BPT bậc hai")[
        1. Tìm nghiệm của $a x^2 + b x + c = 0$.
        2. Xét dấu tam thức ("trong trái, ngoài cùng").
        3. Kết luận tập nghiệm phù hợp.
      ]
    ],
    [
      #lt-important(title: "Hệ điều kiện nghiệm đúng với mọi x thuộc R")[
        #grid(
          columns: (1fr, 1fr),
          row-gutter: 7pt,
          [$f(x) > 0, forall x <=> cases(a > 0, Delta < 0)$],
          [$f(x) >= 0, forall x <=> cases(a > 0, Delta <= 0)$],
          [$f(x) < 0, forall x <=> cases(a < 0, Delta < 0)$],
          [$f(x) <= 0, forall x <=> cases(a < 0, Delta <= 0)$],
        )
        #v(0.1em)
        #text(fill: rgb("#b91c1c"), size: 8pt, weight: "bold")[Luôn cùng dấu $<=>$ $Delta < 0$; có dấu bằng $<=>$ $Delta <= 0$.]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: BÀI TẬP TRẮC NGHIỆM & THỰC TIỄN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Trắc nghiệm & Thực tiễn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG VI BÀI 3],
  questions: (
    (num: 1, type: "TN", desc: [Giải BPT x^2 - 5x + 6 <= 0]),
    (num: 2, type: "TN", desc: [Khoảng tam thức nhận giá trị âm]),
    (num: 3, type: "TN", desc: [BPT có nghiệm với mọi x khác 3]),
    (num: 4, type: "TN", desc: [Điều kiện tam thức luôn âm trên R]),
    (num: 5, type: "TN", desc: [Tìm m để tam thức luôn dương]),
    (num: 6, type: "TN", desc: [Khoảng sản xuất sinh lợi nhuận]),
    (num: 7, type: "DS", desc: [Đúng/Sai dấu & nghiệm tam thức]),
    (num: 8, type: "TLN", desc: [Số nghiệm nguyên của BPT]),
    (num: 9, type: "TLN", desc: [Thời gian bóng ở độ cao >= 12m]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Tập nghiệm của bất phương trình bậc hai $x^2 - 5x + 6 <= 0$ là:],
  (
    [$[2; 3]$],
    [$(2; 3)$],
    [$(-infinity; 2] union [3; +infinity)$],
    [$[-3; -2]$],
  ),
  correct: 1,
  num: 1,
  de: "Đề 18A — Giải Bất Phương Trình Bậc Hai Cơ Bản",
  loigiai: [
    - Phương trình $x^2 - 5x + 6 = 0 <=> (x - 2)(x - 3) = 0 <=> x = 2$ hoặc $x = 3$.\
    - Hệ số $a = 1 > 0$. Bất phương trình lấy dấu $<=$ nên lấy trong khoảng nghiệm:\
    $2 <= x <= 3 => S = [2; 3]$. Chọn đáp án *A: $[2; 3]$*.
  ]
)

#lt-tn(
  [Tam thức bậc hai $f(x) = x^2 - 4x + 3$ nhận giá trị ÂM ($f(x) < 0$) khi và chỉ khi $x$ thuộc khoảng:],
  (
    [$(1; 3)$],
    [$(-infinity; 1)$],
    [$(3; +infinity)$],
    [$(-infinity; 1) union (3; +infinity)$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 18A — Khoảng Nhận Giá Trị Âm Của Tam Thức",
  loigiai: [
    - Tam thức có 2 nghiệm là $x_1 = 1$ và $x_2 = 3$, hệ số $a = 1 > 0$.\
    - Theo quy tắc "trong trái, ngoài cùng", $f(x) < 0$ (trái dấu với $a$) khi:\
    $x in (1; 3)$. Chọn đáp án *A: $(1; 3)$*.
  ]
)

#lt-tn(
  [Tập nghiệm của bất phương trình bậc hai $x^2 - 6x + 9 > 0$ là:],
  (
    [$RR \\ {3}$],
    [$RR$],
    [$(3; +infinity)$],
    [$emptyset$],
  ),
  correct: 1,
  num: 3,
  de: "Đề 18A — Bất Phương Trình Có Nghiệm Kép",
  loigiai: [
    - Biến đổi: $x^2 - 6x + 9 = (x - 3)^2$.\
    - Vì $(x - 3)^2 >= 0$ với mọi $x in RR$ và $(x - 3)^2 = 0 <=> x = 3$.\
    - Do đó $(x - 3)^2 > 0 <=> x != 3 => S = RR \\ {3}$. Chọn đáp án *A*.
  ]
)

#lt-tn(
  [Điều kiện cần và đủ để tam thức bậc hai $f(x) = a x^2 + b x + c$ luôn ÂM với mọi $x in RR$ là:],
  (
    [$a < 0$ và $Delta < 0$],
    [$a < 0$ và $Delta <= 0$],
    [$a > 0$ và $Delta < 0$],
    [$a < 0$ và $Delta > 0$],
  ),
  correct: 1,
  num: 4,
  de: "Đề 18A — Điều Kiện Tam Thức Luôn Âm Trên R",
  loigiai: [
    Theo định lý về dấu của tam thức bậc hai:\
    $f(x) < 0$ với mọi $x in RR$ khi và chỉ khi hệ số $a < 0$ và $Delta < 0$.\
    Chọn đáp án *A: $a < 0$ và $Delta < 0$*.
  ]
)

#lt-tn(
  [Tìm tất cả các giá trị của tham số $m$ để tam thức $f(x) = x^2 - 2x + m > 0$ với mọi $x in RR$.],
  (
    [$m > 1$],
    [$m >= 1$],
    [$m < 1$],
    [$m <= 1$],
  ),
  correct: 1,
  num: 5,
  de: "Đề 18A — Tham Số Để Tam Thức Luôn Dương",
  loigiai: [
    - Tam thức có $a = 1 > 0$ đã thỏa mãn.\
    - Để $f(x) > 0, forall x in RR <=> Delta' < 0 <=> (-1)^2 - 1 dot m < 0 <=> 1 - m < 0 <=> m > 1$.\
    Chọn đáp án *A: $m > 1$*.
  ]
)

#lt-tn(
  [Một cơ sở sản xuất có chi phí $C(x) = x^2 + 5x + 16$ và doanh thu $R(x) = 15x$ (triệu đồng, $x$ nghìn sản phẩm). Cơ sở có lãi khi $x$ thuộc khoảng:],
  (
    [Từ trên $2$ nghìn đến dưới $8$ nghìn sản phẩm],
    [Dưới $2$ nghìn sản phẩm],
    [Trên $8$ nghìn sản phẩm],
    [Từ trên $4$ nghìn đến dưới $6$ nghìn sản phẩm],
  ),
  correct: 1,
  num: 6,
  de: "Đề 18A — Ứng Dụng Kinh Tế Điểm Hòa Vốn & Sinh Lời",
  loigiai: [
    - Có lãi khi $R(x) > C(x) <=> 15x > x^2 + 5x + 16 <=> x^2 - 10x + 16 < 0$.\
    - Phương trình $x^2 - 10x + 16 = 0 <=> x = 2$ hoặc $x = 8$.\
    - Nghiệm BPT: $2 < x < 8$. Chọn đáp án *A*.
  ]
)

#lt-ds(
  [Cho tam thức bậc hai $f(x) = x^2 - 4x + 3$. Xét tính đúng/sai của các mệnh đề sau:],
  (
    [Biệt thức của tam thức bậc hai là $Delta = 4 > 0$.],
    [Tam thức nhận giá trị âm ($f(x) < 0$) khi và chỉ khi $x in (1; 3)$.],
    [Bất phương trình $f(x) >= 0$ có tập nghiệm là $(-infinity; 1] union [3; +infinity)$.],
    [Bất phương trình $f(x) <= -2$ có vô số nghiệm thực.],
  ),
  num: 7,
  de: "Đề 18A — Khảo Sát Dấu & Tập Nghiệm Tam Thức Bậc Hai",
  loigiai: [
    - a) *Đúng:* $Delta = (-4)^2 - 4(1)(3) = 16 - 12 = 4 > 0$.\
    - b) *Đúng:* Nghiệm $x_1 = 1, x_2 = 3$. Trong khoảng hai nghiệm, $f(x) < 0$.\
    - c) *Đúng:* Ngoài khoảng hai nghiệm (kể cả mút), $f(x) >= 0$.\
    - d) *Sai:* Đỉnh parabol có tung độ $y_I = -1$, do $a = 1 > 0$ nên $f(x) >= -1, forall x$. Do đó $f(x) <= -2$ là vô nghiệm.
  ]
)

#lt-tln(
  [Tìm số nghiệm nguyên của bất phương trình bậc hai $2x^2 - 7x + 3 <= 0$.],
  "3",
  num: 8,
  de: "Đề 18A — Đếm Số Nghiệm Nguyên Của Bất Phương Trình",
  loigiai: [
    - Phương trình $2x^2 - 7x + 3 = 0 <=> (2x - 1)(x - 3) = 0 <=> x = 1/2$ hoặc $x = 3$.\
    - Vì $a = 2 > 0$ nên bất phương trình có nghiệm: $1/2 <= x <= 3$.\
    - Các nghiệm nguyên thỏa mãn: $x in {1; 2; 3}$ (gồm đúng $3$ nghiệm nguyên).\
    Đáp số: *3*.
  ]
)

#lt-tln(
  [Một quả bóng đá từ mặt đất lên cao có độ cao $h(t) = 16t - 4t^2$ (m) sau $t$ (giây). Hỏi trong khoảng bao nhiêu giây thì quả bóng ở độ cao từ $12$ m trở lên?],
  "2",
  num: 9,
  de: "Đề 18A — Ứng Dụng Vật Lý Chuyển Động Trọng Trường",
  loigiai: [
    - Điều kiện $h(t) >= 12 <=> 16t - 4t^2 >= 12 <=> 4t^2 - 16t + 12 <= 0 <=> t^2 - 4t + 3 <= 0$.\
    - Nghiệm BPT: $1 <= t <= 3$.\
    - Khoảng thời gian bóng ở độ cao $>= 12$ m là $Delta t = 3 - 1 = 2$ giây.\
    Đáp số: *2*.
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
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 10.5pt)[1. Biệt Thức Delta]\
        #v(0.15em)
        #text(size: 8.5pt)[
          $Delta = b^2 - 4a c$.\
          Quyết định số giao điểm với $O x$ và quy luật dấu của tam thức.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#ef4444"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 10.5pt)[2. Trường Hợp Δ < 0]\
        #v(0.15em)
        #text(size: 8.5pt)[
          $a dot f(x) > 0, forall x in RR$.\
          Tam thức *luôn cùng dấu với a* trên toàn bộ trục số thực $RR$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 10.5pt)[3. Trường Hợp Δ > 0]\
        #v(0.15em)
        #text(size: 8.5pt)[
          *Trong trái, Ngoài cùng*:\
          Trái dấu $a$ giữa 2 nghiệm, cùng dấu $a$ bên ngoài 2 nghiệm.
        ]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#a855f7"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#7e22ce"), size: 10.5pt)[4. Giải BPT Bậc Hai]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Lập bảng xét dấu hoặc phác đồ thị parabol để chọn khoảng nghiệm thích hợp.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 10.5pt)[5. Điều Kiện Với Mọi x]\
        #v(0.15em)
        #text(size: 8.5pt)[
          $f(x) > 0, forall x <=> a > 0, Delta < 0$.\
          $f(x) >= 0, forall x <=> a > 0, Delta <= 0$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#8b5cf6"), inset: 8pt, radius: 6pt)[
        #text(weight: "bold", fill: rgb("#6d28d9"), size: 10.5pt)[6. Ứng Dụng Thực Tiễn]\
        #v(0.15em)
        #text(size: 8.5pt)[
          Điểm hòa vốn doanh nghiệp, thời gian an toàn của quỹ đạo bay trong vật lý.
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
      #text(weight: "bold", fill: rgb("#15803d"), size: 17pt)[🎉 CHÚC MỪNG BẠN ĐÃ LÀM CHỦ DẤU TAM THỨC BẬC HAI!]\
      #v(0.4em)
      #text(size: 11pt, fill: rgb("#1f2937"))[
        Bạn đã nắm vững quy tắc "trong trái, ngoài cùng", điều kiện tam thức luôn dương/âm trên $RR$, giải bất phương trình bậc hai và các bài toán kinh tế - vật lý thực tế.\
        #v(0.3em)
        *Tiếp theo:* Bài 4 — Phương trình quy về phương trình bậc hai!
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
