#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../public/hdsd/typst/sang-math-geom.typ": *

#show: lecture-theme.with(
  title: [Khám Phá Elip — Chuyên Sâu],
  subtitle: [TOÁN 10 — HÌNH HỌC TỌA ĐỘ CONIC & BÍ ẨN VŨ TRỤ],
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
#lt-toc(title: [🗺️ NỘI DUNG MÔ HÌNH HOÁ])

// ════════════════════════════════════════════════
// PHẦN I: ĐỊNH NGHĨA & CÁCH VẼ
// ════════════════════════════════════════════════
#lt-section-link("sec-dinh-nghia", "🌍", [I. Elip Là Gì? Từ Phương Pháp Thợ Mộc Đến Định Luật Kepler])

#lt-slide-back(title: "🌍 Định nghĩa hình học & Phương pháp người thợ mộc")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-definition(title: "Định nghĩa Elip")[
        Cho hai điểm cố định $F_1, F_2$ với khoảng cách $F_1 F_2 = 2c > 0$. 
        *Elip* là tập hợp các điểm $M$ sao cho tổng khoảng cách từ $M$ đến hai tiêu điểm $F_1, F_2$ bằng một hằng số $2a$ (với $a > c > 0$).
        $ F_1 M + F_2 M = 2a $
      ]
      #v(0.15em)
      #lt-important(title: "Cách vẽ Elip bằng đinh và sợi dây")[
        Đóng hai cái đinh tại $F_1$ và $F_2$. Lấy một vòng dây kín không dãn có chu vi là $2a + 2c$. Quàng sợi dây qua hai cái đinh. Dùng đầu bút chì kéo căng sợi dây và di chuyển xung quanh hai cái đinh. Đường vạch ra chính là Elip!
      ]
    ],
    [
      #align(center)[
        #context cetz.canvas({
          import cetz.draw: *
          line((-4, 0), (4, 0), stroke: 0.6pt, mark: (end: "stealth"))
          line((0, -2.5), (0, 2.5), stroke: 0.6pt, mark: (end: "stealth"))
          
          // Vẽ Elip a=3, b=2 => c = sqrt(5) ~ 2.236
          circle((0,0), radius: (3, 2), stroke: 2pt + rgb("#0ea5e9"))
          
          // F1, F2
          circle((-2.236, 0), radius: 2pt, fill: rgb("#dc2626"))
          circle((2.236, 0), radius: 2pt, fill: rgb("#dc2626"))
          content((-2.2, -0.4), text(size: 8pt, fill: rgb("#dc2626"))[$F_1$])
          content((2.2, -0.4), text(size: 8pt, fill: rgb("#dc2626"))[$F_2$])
          
          // M
          circle((1.5, 1.732), radius: 2pt, fill: black)
          content((1.6, 2.0), text(size: 8pt)[$M$])
          
          // Sợi dây
          line((-2.236, 0), (1.5, 1.732), stroke: (dash: "dashed", paint: rgb("#16a34a")))
          line((2.236, 0), (1.5, 1.732), stroke: (dash: "dashed", paint: rgb("#16a34a")))
        })
      ]
    ]
  )
]

#lt-slide-back(title: "✨ Kepler và Bí ẩn Quỹ đạo Hành tinh")[
  #lt-two-col(
    ratio: (55%, 45%),
    [
      #lt-theorem(title: "Định luật 1 Kepler (1609)")[
        Mọi hành tinh đều chuyển động quanh Mặt Trời trên một quỹ đạo hình Elip, với *Mặt Trời nằm ở một trong hai tiêu điểm*.
      ]
      #v(0.2em)
      #lt-tip(title: "Góc nhìn Vật lý thiên văn")[
        Khoảng cách Mặt Trời - Trái Đất không cố định!
        - Điểm Cận Nhật (Perihelion): Gần Mặt Trời nhất ($a - c$). Mùa Đông ở Bắc Bán Cầu (đầu tháng 1).
        - Điểm Viễn Nhật (Aphelion): Xa Mặt Trời nhất ($a + c$). Mùa Hè ở Bắc Bán Cầu (đầu tháng 7).
      ]
    ],
    [
      #block(fill: rgb("#fffbeb"), stroke: 1.5pt + rgb("#f59e0b"), inset: 8pt, radius: 8pt)[
        #text(weight: "bold", fill: rgb("#b45309"), size: 10.5pt)[Tâm sai (Eccentricity) $e$]\
        #v(0.2em)
        #text(size: 8.5pt)[
          $ e = c / a quad (0 < e < 1) $
          - Elip càng "tròn" khi $e$ càng gần $0$ (Hai tiêu điểm xích lại gần nhau, $c -> 0$).
          - Trái đất có $e approx 0.0167$ (Gần như hình tròn).
          - Sao chổi Halley có $e approx 0.967$ (Elip cực kỳ dẹt, như hình điếu xì-gà).
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: PHƯƠNG TRÌNH & THUỘC TÍNH
// ════════════════════════════════════════════════
#lt-section-link("sec-pt-elip", "📐", [II. Phương Trình Chính Tắc & Tính Chất Quang Học])

#lt-slide-back(title: "📐 Phương Trình Chính Tắc Của Elip")[
  #lt-definition(title: "Dạng chính tắc")[
    Chọn hệ trục $O x y$ sao cho $F_1 (-c; 0)$ và $F_2 (c; 0)$. Khi đó phương trình Elip là:
    $ x^2 / a^2 + y^2 / b^2 = 1 $
    Trong đó: $b^2 = a^2 - c^2$ ($a > b > 0$).
  ]
  #v(0.1em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      #lt-important(title: "Đỉnh & Trục")[
        - Đỉnh trục lớn: $A_1 (-a; 0), A_2 (a; 0)$. Độ dài: $2a$.
        - Đỉnh trục bé: $B_1 (0; -b), B_2 (0; b)$. Độ dài: $2b$.
        - Tiêu cự: $2c$.
      ]
    ],
    [
      #lt-tip(title: "Hình chữ nhật cơ sở")[
        Tạo bởi 4 đường thẳng $x = \pm a, y = \pm b$. Kích thước $2a times 2b$, ôm vừa khít Elip bên trong.
      ]
    ]
  )
]

#lt-slide-back(title: "🔊 Tính Chất Quang Học & Phòng Thì Thầm")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "Định lý phản xạ trên Elip")[
        Mọi tia sáng (hoặc âm thanh) xuất phát từ tiêu điểm này, sau khi phản xạ tại bất kỳ điểm nào trên Elip, *đều sẽ đi qua tiêu điểm kia*.
        (Góc tới bằng góc phản xạ đối với tiếp tuyến).
      ]
      #v(0.1em)
      #lt-tip(title: "Whispering Gallery (Phòng Thì Thầm)")[
        - Tại điện Capitol (Mỹ) hay nhà thờ St. Paul (London), vòm trần có hình Elip.
        - Hai người đứng ở đúng vị trí của $F_1$ và $F_2$, cách nhau cả chục mét, chỉ cần thì thầm là người kia có thể nghe rõ mồn một! Sóng âm truyền từ $F_1$ đập vào trần và hội tụ toàn bộ về $F_2$.
      ]
    ],
    [
      #align(center)[
        #context cetz.canvas({
          import cetz.draw: *
          // Elip
          circle((0,0), radius: (3, 1.8), stroke: 2pt + rgb("#0ea5e9"))
          // Tiêu điểm
          let c = calc.sqrt(3*3 - 1.8*1.8) // 2.4
          circle((-c, 0), radius: 2.5pt, fill: rgb("#dc2626"))
          circle((c, 0), radius: 2.5pt, fill: rgb("#dc2626"))
          content((-c, -0.4), text(size: 8pt)[$F_1$ (Nguồn âm)])
          content((c, -0.4), text(size: 8pt)[$F_2$ (Người nghe)])
          
          // Sóng âm
          line((-c, 0), (1, 1.697), stroke: rgb("#f59e0b"), mark: (end: "stealth", pos: 50%))
          line((1, 1.697), (c, 0), stroke: rgb("#f59e0b"), mark: (end: "stealth", pos: 50%))
          
          line((-c, 0), (-1.5, 1.558), stroke: rgb("#f59e0b"), mark: (end: "stealth", pos: 50%))
          line((-1.5, 1.558), (c, 0), stroke: rgb("#f59e0b"), mark: (end: "stealth", pos: 50%))
        })
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// Luyện tập TN
// ════════════════════════════════════════════════
#lt-section-link("sec-trac-nghiem", "✏️", [III. Luyện tập: Giải mã Elip])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — ELIP THỰC TẾ],
  questions: (
    (num: 1, type: "TN", desc: [Xác định a, b, c]),
    (num: 2, type: "TN", desc: [Tâm sai Elip]),
    (num: 3, type: "TN", desc: [Quỹ đạo Trái đất]),
    (num: 4, type: "TN", desc: [Phòng thì thầm Capitol]),
    (num: 5, type: "DS", desc: [Tính chất tổng khoảng cách]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$. Tiêu cự của Elip bằng bao nhiêu?],
  (
    [$4$],
    [$8$],
    [$16$],
    [$5$],
  ),
  correct: 1,
  num: 1,
  de: "Xác định hằng số Elip",
  loigiai: [
    Ta có $a^2 = 25 => a = 5$ và $b^2 = 9 => b = 3$.
    Ta có công thức liên hệ: $c^2 = a^2 - b^2 = 25 - 9 = 16 => c = 4$.
    Tiêu cự là khoảng cách giữa 2 tiêu điểm: $2c = 2(4) = 8$. Chọn *B*.
  ]
)

#lt-tn(
  [Tâm sai $e$ của Elip $(E): 4x^2 + 9y^2 = 36$ là:],
  (
    [$sqrt(5) / 3$],
    [$5 / 9$],
    [$2 / 3$],
    [$sqrt(5) / 2$],
  ),
  correct: 0,
  num: 2,
  de: "Tâm sai Elip",
  loigiai: [
    Chia hai vế cho $36$, ta được phương trình chính tắc:
    $ x^2 / 9 + y^2 / 4 = 1 $
    Suy ra $a^2 = 9 => a = 3$, $b^2 = 4$.
    $c = sqrt(a^2 - b^2) = sqrt(9 - 4) = sqrt(5)$.
    Tâm sai $e = c / a = sqrt(5) / 3$. Chọn *A*.
  ]
)

#lt-tn(
  [Quỹ đạo của Trái Đất quanh Mặt Trời là một đường elip có độ dài trục lớn là $299.2$ triệu km và tâm sai $e = 0.0167$. Khoảng cách ngắn nhất từ Trái Đất đến Mặt Trời (khoảng cách cận nhật) gần nhất với giá trị nào sau đây?],
  (
    [$147.1$ triệu km],
    [$149.6$ triệu km],
    [$152.1$ triệu km],
    [$145.0$ triệu km],
  ),
  correct: 0,
  num: 3,
  de: "Khoảng cách cận nhật",
  loigiai: [
    Trục lớn $2a = 299.2 => a = 149.6$ triệu km.
    Tâm sai $e = c / a = 0.0167 => c = 149.6 times 0.0167 approx 2.50$ triệu km.
    Mặt Trời ở tiêu điểm. Khoảng cách ngắn nhất (điểm cận nhật) là $a - c$:
    $ d_text("min") = 149.6 - 2.50 = 147.1 text(" (triệu km)") $
    Chọn *A*.
  ]
)

#lt-tn(
  [Một phòng có trần dạng nửa hình elipsoid tròn xoay (Phòng thì thầm). Căn phòng dài $20$m và cao $6$m ở điểm chính giữa. Hai người muốn thì thầm với nhau qua tính chất quang học của Elip. Họ cần đứng cách nhau bao nhiêu mét?],
  (
    [$16$ m],
    [$10$ m],
    [$8$ m],
    [$12$ m],
  ),
  correct: 0,
  num: 4,
  de: "Ứng dụng phòng thì thầm",
  loigiai: [
    Trần nửa elip có chiều dài (trục lớn) $2a = 20 => a = 10$.
    Chiều cao lớn nhất của trần chính là bán trục bé $b = 6$.
    Vị trí hai người đứng chính là 2 tiêu điểm. Khoảng cách cần tìm là tiêu cự $2c$.
    $c = sqrt(a^2 - b^2) = sqrt(100 - 36) = sqrt(64) = 8$.
    Vậy $2c = 16$ mét. Chọn *A*.
  ]
)

#lt-ds(
  [Một người thợ mộc muốn vẽ một Elip có chiều dài (trục lớn) $100$ cm và chiều rộng (trục bé) $60$ cm trên một tấm ván gỗ. Ông ta dùng hai cái đinh và một vòng dây kín.],
  (
    [Độ dài một nửa trục lớn $a = 50$ cm và nửa trục bé $b = 30$ cm.],
    [Hai cái đinh phải được đóng cách nhau $80$ cm.],
    [Sợi dây không dãn ông ta dùng cần có chiều dài tổng cộng (chu vi) là $180$ cm.],
    [Điểm $M$ bất kỳ trên nét vẽ có $M F_1 + M F_2 = 100$ cm.],
  ),
  correct: "1111",
  num: 5,
  de: "Thực hành vẽ Elip",
  loigiai: [
    - a) *Đúng:* $2a = 100 => a = 50$. $2b = 60 => b = 30$.
    - b) *Đúng:* Khoảng cách 2 đinh là $2c$. Ta có $c = sqrt(50^2 - 30^2) = 40 => 2c = 80$ cm.
    - c) *Đúng:* Chu vi sợi dây quàng qua 2 tiêu điểm và 1 điểm $M$ trên biên là: $M F_1 + M F_2 + F_1 F_2 = 2a + 2c = 100 + 80 = 180$ cm.
    - d) *Đúng:* Theo định nghĩa Elip, tổng khoảng cách từ 1 điểm đến 2 tiêu điểm bằng đúng trục lớn $2a = 100$ cm.
  ]
)
