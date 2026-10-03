// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN (ĐỀ C: NÂNG CAO - VD, VDC)
// Lớp: Khối 10  ·  Mã đề: 127  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")



#show: lecture-theme.with(
  title: "BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN (ĐỀ C: NÂNG CAO - VD, VDC)",
  subtitle: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN — MÃ ĐỀ: 127",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 127]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu gồm $5$ giá trị: $1; quad 2; quad 3; quad 4; quad x$. Biết rằng số trung bình của mẫu số liệu này bằng $3.0$. Phương sai $s^2$ của mẫu số liệu bằng],
    (
        True([$2.0$]),
        [$1.5$],
        [$2.5$],
        [$sqrt(2)$]
    ),
    loigiai: [
        Vì số trung bình $overline(x) = 3.0$ nên:
        $ (1 + 2 + 3 + 4 + x) / 5 = 3 <=> 10 + x = 15 <=> x = 5 $
        Mẫu số liệu là: $1; 2; 3; 4; 5$.
        Phương sai:
        $ s^2 = ((1-3)^2 + (2-3)^2 + (3-3)^2 + (4-3)^2 + (5-3)^2) / 5 = (4 + 1 + 0 + 1 + 4) / 5 = 10 / 5 = 2.0 $
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Một nhà nghiên cứu thu thập mẫu số liệu gồm $n = 10$ quan sát. Sử dụng máy tính cầm tay thu được tổng các giá trị $sum_(i=1)^(10) x_i = 60$ và tổng các bình phương $sum_(i=1)^(10) x_i^2 = 460$. Phương sai $s^2$ của mẫu số liệu trên bằng],
    (
        True([$10$]),
        [$16$],
        [$6$],
        [$sqrt(10)$]
    ),
    loigiai: [
        Áp dụng công thức tính nhanh phương sai:
        $ s^2 = 1/n sum_(i=1)^n x_i^2 - (overline(x))^2 $
        Số trung bình: $overline(x) = 60 / 10 = 6$.
        Phương sai:
        $ s^2 = 460 / 10 - 6^2 = 46 - 36 = 10 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Hệ số biến thiên $C V = s / overline(x) dot 100%$ (với $overline(x) > 0$) được sử dụng để so sánh mức độ phân tán tương đối giữa hai mẫu số liệu.
Khảo sát hai dòng cổ phiếu: Cổ phiếu $A$ có $overline(x)_A = 100$ nghìn đồng, độ lệch chuẩn $s_A = 10$ nghìn đồng; Cổ phiếu $B$ có $overline(x)_B = 20$ nghìn đồng, độ lệch chuẩn $s_B = 3$ nghìn đồng. Nhận định nào sau đây là chính xác?],
    (
        True([Cổ phiếu $B$ có mức độ biến động tương đối cao hơn cổ phiếu $A$ vì $C V_B = 15% > C V_A = 10%$]),
        [Cổ phiếu $A$ có mức độ biến động tương đối cao hơn cổ phiếu $B$ vì $s_A = 10 > s_B = 3$],
        [Hai cổ phiếu có mức độ biến động tương đối hoàn toàn ngang nhau],
        [Hệ số biến thiên của hai cổ phiếu đều nhỏ hơn $5%$]
    ),
    loigiai: [
        Hệ số biến thiên của cổ phiếu $A$: $C V_A = 10 / 100 dot 100% = 10%$.
        Hệ số biến thiên của cổ phiếu $B$: $C V_B = 3 / 20 dot 100% = 15%$.
        Vì $C V_B = 15% > C V_A = 10%$ nên cổ phiếu $B$ có mức độ biến động tương đối lớn hơn cổ phiếu $A$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu $x_1, x_2, dots, x_n$ ($n >= 2$). Điều kiện cần và đủ để phương sai của mẫu số liệu bằng $0$ ($s^2 = 0$) là],
    (
        True([Tất cả các giá trị trong mẫu số liệu đều bằng nhau]),
        [Số trung bình của mẫu số liệu bằng $0$],
        [Khoảng biến thiên của mẫu số liệu bằng $1$],
        [Tổng tất cả các giá trị trong mẫu số liệu bằng $0$]
    ),
    loigiai: [
        $s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2 = 0 <=> (x_i - overline(x))^2 = 0, forall i <=> x_1 = x_2 = dots = x_n = overline(x)$.
        Phương sai bằng $0$ khi và chỉ khi không có sự phân tán nào, tức là mọi giá trị quan sát đều bằng nhau.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Biểu đồ hộp CeTZ dưới đây mô tả sự phân bố thời gian tải trang (mili-giây) của một cổng dịch vụ công trực tuyến:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (100, 150, 200, 250, 300, 350, 400) {
      let x = (v - 100) * 0.02 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Outlier left at 110 (x = 0.5 + 0.2 = 0.7)
    circle((0.7, 0.8), radius: 2.5pt, fill: rgb("dc2626"))
    content((0.7, 1.15), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[110])
    // Whiskers: min non-outlier = 160 (x = 0.5 + 1.2 = 1.7)
    // Box: Q1 = 200 (x = 0.5 + 2.0 = 2.5)
    // Median: Q2 = 240 (x = 0.5 + 2.8 = 3.3)
    // Q3 = 280 (x = 0.5 + 3.6 = 4.1)
    // Max non-outlier = 360 (x = 0.5 + 5.2 = 5.7)
    // Outlier right at 400 (x = 0.5 + 6.0 = 6.5)
    circle((6.5, 0.8), radius: 2.5pt, fill: rgb("dc2626"))
    content((6.5, 1.15), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[400])

    rect((2.5, 0.4), (4.1, 1.2), fill: rgb("fef3c7"), stroke: 1.2pt + rgb("d97706"))
    line((3.3, 0.4), (3.3, 1.2), stroke: 1.8pt + rgb("dc2626"))
    line((1.7, 0.8), (2.5, 0.8), stroke: 1pt + rgb("d97706"))
    line((1.7, 0.6), (1.7, 1.0), stroke: 1.2pt + rgb("d97706"))
    line((4.1, 0.8), (5.7, 0.8), stroke: 1pt + rgb("d97706"))
    line((5.7, 0.6), (5.7, 1.0), stroke: 1.2pt + rgb("d97706"))
  })
]
Khoảng tứ phân vị $Delta_Q$ và số lượng giá trị bất thường quan sát được trên biểu đồ hộp lần lượt là],
    (
        True([$Delta_Q = 80" ms"$ và có $2$ giá trị bất thường]),
        [$Delta_Q = 80" ms"$ và có $1$ giá trị bất thường],
        [$Delta_Q = 40" ms"$ và có $2$ giá trị bất thường],
        [$Delta_Q = 120" ms"$ và không có giá trị bất thường]
    ),
    loigiai: [
        Từ biểu đồ hộp:
        - Tứ phân vị thứ nhất $Q_1 = 200" ms"$, tứ phân vị thứ ba $Q_3 = 280" ms"$.
        - Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 280 - 200 = 80" ms"$.
        - Có $2$ điểm tròn đỏ nằm ngoài hai râu tại $110" ms"$ và $400" ms"$ là hai giá trị bất thường.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Với mọi số thực $c$, xét hàm số $f(c) = sum_(i=1)^n (x_i - c)^2$. Giá trị của $c$ để hàm số $f(c)$ đạt giá trị nhỏ nhất là],
    (
        True([$c = overline(x)$ (số trung bình cộng của mẫu số liệu)]),
        [$c = M_e$ (trung vị của mẫu số liệu)],
        [$c = M_o$ (mốt của mẫu số liệu)],
        [$c = (x_max + x_min)/2$]
    ),
    loigiai: [
        Khai triển tam thức bậc hai theo $c$:
        $ f(c) = sum_(i=1)^n (x_i^2 - 2 x_i c + c^2) = n c^2 - 2 (sum_(i=1)^n x_i) c + sum_(i=1)^n x_i^2 $
        Hàm số bậc hai với hệ số $n > 0$ đạt giá trị nhỏ nhất tại đỉnh parabol:
        $ c = - (-2 sum x_i) / (2n) = (sum x_i) / n = overline(x) $
        Do đó tổng các bình phương độ lệch luôn đạt cực tiểu khi $c$ đúng bằng số trung bình $overline(x)$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu gồm $4$ số thực: $2; quad 4; quad 6; quad x$ với $x > 6$. Biết khoảng biến thiên của mẫu số liệu bằng $R = 8$. Giá trị của $x$ là],
    (
        True([$10$]),
        [$8$],
        [$12$],
        [$14$]
    ),
    loigiai: [
        Vì $x > 6$ nên giá trị lớn nhất là $x_max = x$, giá trị nhỏ nhất là $x_min = 2$.
        Khoảng biến thiên:
        $ R = x_max - x_min = x - 2 = 8 <=> x = 10 $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu $x_1, x_2, dots, x_n$ có phương sai $s^2 = 4$. Nếu mỗi giá trị $x_i$ được nhân với $-3$ và trừ đi $7$, ta được mẫu số liệu mới $y_i = -3 x_i - 7$. Phương sai $s_y^2$ của mẫu mới bằng],
    (
        True([$36$]),
        [$-12$],
        [$12$],
        [$25$]
    ),
    loigiai: [
        Theo tính chất biến đổi tuyến tính: $y_i = a x_i + b$.
        Phương sai biến đổi theo công thức:
        $ s_y^2 = a^2 s_x^2 = (-3)^2 dot 4 = 9 dot 4 = 36 $
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Khảo sát độ hao mòn (micromét) của hai loại lưỡi dao tiện cơ khí $M$ và $N$ sau $100$ giờ gia công chi tiết:
- Lưỡi dao $M$: $overline(x)_M = 15 mu"m", s_M = 1.2 mu"m"$.
- Lưỡi dao $N$: $overline(x)_N = 15 mu"m", s_N = 2.8 mu"m"$.
Khi chọn mua lưỡi dao để bảo đảm độ đồng đều cho dây chuyền tự động hàng loạt, kỹ sư nên ưu tiên chọn loại nào?],
    (
        True([Nên chọn lưỡi dao $M$ vì có độ lệch chuẩn nhỏ hơn, độ hao mòn đồng đều và ổn định hơn]),
        [Nên chọn lưỡi dao $N$ vì độ lệch chuẩn lớn hơn thì dao bền hơn],
        [Chọn loại nào cũng được vì độ hao mòn trung bình hoàn toàn như nhau],
        [Chưa đủ dữ liệu vì cần biết mốt của hai loại lưỡi dao]
    ),
    loigiai: [
        Trong gia công cơ khí chính xác, độ phân tán thấp (độ lệch chuẩn nhỏ) đồng nghĩa với việc sản phẩm tạo ra có kích thước đồng đều và giảm thiểu phế phẩm.
        Vì $s_M = 1.2 < s_N = 2.8$ nên lưỡi dao $M$ có độ mòn ổn định, tin cậy hơn lưỡi dao $N$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu điểm đánh giá chất lượng phần mềm của $10$ chuyên gia:
#align(center)[
  $72; quad 75; quad 78; quad 80; quad 82; quad 85; quad 86; quad 88; quad 90; quad 92$
]
Khoảng tứ phân vị $Delta_Q$ của mẫu số liệu bằng],
    (
        True([$10$ điểm]),
        [$12$ điểm],
        [$8$ điểm],
        [$14$ điểm]
    ),
    loigiai: [
        $n = 10$, các giá trị đã sắp xếp tăng dần:
        - Nửa dưới gồm $5$ số: $72; 75; 78; 80; 82 => Q_1 = 78$.
        - Nửa trên gồm $5$ số: $85; 86; 88; 90; 92 => Q_3 = 88$.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 88 - 78 = 10 text(" điểm") $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Một mẫu số liệu gồm $n$ quan sát có phương sai $s^2$. Nếu ta nhân đôi tất cả các giá trị của mẫu số liệu đó thì độ lệch chuẩn của mẫu số liệu mới bằng],
    (
        True([Gấp $2$ lần độ lệch chuẩn ban đầu]),
        [Gấp $4$ lần độ lệch chuẩn ban đầu],
        [Không đổi],
        [Gấp $sqrt(2)$ lần độ lệch chuẩn ban đầu]
    ),
    loigiai: [
        Nếu $y_i = 2 x_i$ thì $s_y = |2| s_x = 2 s_x$.
        Vậy độ lệch chuẩn tăng gấp $2$ lần.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Khảo sát thời gian phản hồi (giây) của một trợ lý ảo AI trong $6$ truy vấn liên tiếp: $0.8; 1.0; 1.2; 1.4; 1.6; 3.0$. Khoảng biến thiên $R$ của thời gian phản hồi là],
    (
        True([$2.2$ giây]),
        [$2.0$ giây],
        [$1.8$ giây],
        [$1.4$ giây]
    ),
    loigiai: [
        Giá trị lớn nhất $x_max = 3.0$, nhỏ nhất $x_min = 0.8$.
        $ R = 3.0 - 0.8 = 2.2 text(" giây") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Công thức phương sai gộp hai mẫu độc lập)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Một nhà máy có hai phân xưởng cùng sản xuất một loại linh kiện điện tử:
- Phân xưởng 1 có $n_1 = 30$ công nhân, năng suất trung bình $overline(x)_1 = 50$ sản phẩm/ngày, phương sai $s_1^2 = 16$.
- Phân xưởng 2 có $n_2 = 20$ công nhân, năng suất trung bình $overline(x)_2 = 60$ sản phẩm/ngày, phương sai $s_2^2 = 25$.
Xét tính đúng sai của các nhận định sau về mẫu số liệu gộp chung cả $50$ công nhân của toàn nhà máy:],
  (
    True([Năng suất trung bình chung của toàn bộ $50$ công nhân là $overline(x) = (30 dot 50 + 20 dot 60) / 50 = 54$ sản phẩm/ngày.]),
    True([Tổng bình phương độ lệch của Phân xưởng 1 so với $overline(x)_1$ là $n_1 s_1^2 = 30 dot 16 = 480$.]),
    True([Tổng bình phương độ lệch của Phân xưởng 2 so với $overline(x)_2$ là $n_2 s_2^2 = 20 dot 25 = 500$.]),
    [Phương sai gộp chung của toàn nhà máy bằng trung bình cộng đơn giản của hai phương sai: $s^2 = (s_1^2 + s_2^2)/2 = 20.5$.]
  ),
  loigiai: [
    #step([Năng suất trung bình gộp])
    $overline(x) = (30 dot 50 + 20 dot 60) / 50 = (1500 + 1200) / 50 = 54$ sản phẩm/ngày. Mệnh đề a ĐÚNG.

    #step([Tổng bình phương nội bộ từng phân xưởng])
    $sum_(i=1)^(n_1) (x_i - 50)^2 = n_1 s_1^2 = 30 dot 16 = 480$. Mệnh đề b ĐÚNG.
    $sum_(j=1)^(n_2) (y_j - 60)^2 = n_2 s_2^2 = 20 dot 25 = 500$. Mệnh đề c ĐÚNG.

    #step([Phương sai gộp toàn nhà máy])
    Công thức phương sai gộp đầy đủ tính cả độ lệch giữa các trung bình nhóm với trung bình chung:
    $s^2 = (n_1 (s_1^2 + (overline(x)_1 - overline(x))^2) + n_2 (s_2^2 + (overline(x)_2 - overline(x))^2)) / (n_1 + n_2)$
    $= (30(16 + (50-54)^2) + 20(25 + (60-54)^2)) / 50 = (30(16 + 16) + 20(25 + 36)) / 50 = (30 dot 32 + 20 dot 61) / 50 = (960 + 1220) / 50 = 2180 / 50 = 43.6$.
    Vì $43.6 != 20.5$ nên khẳng định phương sai gộp bằng trung bình cộng hai phương sai là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Hệ số biến thiên CV trong so sánh kinh tế)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Để so sánh mức độ biến động giá giữa hai thị trường bất động sản có quy mô giá cả chênh lệch lớn:
- Thị trường $A$ (Đô thị trung tâm): Giá nhà trung bình $overline(x)_A = 10$ tỷ đồng, độ lệch chuẩn $s_A = 1.5$ tỷ đồng.
- Thị trường $B$ (Đô thị vệ tinh): Giá nhà trung bình $overline(x)_B = 2$ tỷ đồng, độ lệch chuẩn $s_B = 0.5$ tỷ đồng.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ số biến thiên giá nhà của Thị trường $A$ bằng $C V_A = (1.5 / 10) dot 100% = 15%$.]),
    True([Hệ số biến thiên giá nhà của Thị trường $B$ bằng $C V_B = (0.5 / 2) dot 100% = 25%$.]),
    True([Mặc dù độ lệch chuẩn tuyệt đối của Thị trường $A$ lớn hơn ($1.5 > 0.5$), nhưng mức độ biến động giá tương đối của Thị trường $B$ lại cao hơn Thị trường $A$.]),
    [Nếu đo lường bằng khoảng biến thiên tuyệt đối, thị trường $B$ có độ phân tán giá lớn hơn thị trường $A$.]
  ),
  loigiai: [
    #step([Tính hệ số biến thiên thị trường A])
    $C V_A = 1.5 / 10 dot 100% = 15%$. Mệnh đề a ĐÚNG.

    #step([Tính hệ số biến thiên thị trường B])
    $C V_B = 0.5 / 2 dot 100% = 25%$. Mệnh đề b ĐÚNG.

    #step([Ý nghĩa của hệ số biến thiên])
    Hệ số biến thiên loại bỏ ảnh hưởng của thang đo đơn vị. Thị trường B có $C V_B = 25% > C V_A = 15%$ nên giá cả ở thị trường B biến động tương đối mạnh hơn. Mệnh đề c ĐÚNG.

    #step([Khoảng biến thiên tuyệt đối])
    Độ lệch chuẩn của thị trường A gấp 3 lần thị trường B ($1.5$ so với $0.5$), nên độ phân tán tuyệt đối của thị trường A lớn hơn thị trường B. Mệnh đề d SAI.
  ]
)

// DS 3 (Mẫu số liệu chứa tham số m)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu điểm thi gồm $4$ số: $2; quad 4; quad 6; quad m$ với $m$ là tham số thực.
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số trung bình của mẫu số liệu là hàm bậc nhất theo $m$: $overline(x)(m) = (12 + m) / 4$.]),
    True([Tổng bình phương độ lệch $f(m) = sum_(i=1)^4 (x_i - overline(x))^2$ đạt giá trị nhỏ nhất khi $m = 4$.]),
    True([Khi $m = 4$, mẫu số liệu trở thành $2; 4; 4; 6$ có phương sai nhỏ nhất bằng $s_min^2 = 2.0$.]),
    [Không tồn tại giá trị nào của $m$ để phương sai của mẫu số liệu lớn hơn $100$.]
  ),
  loigiai: [
    #step([Biểu thức số trung bình])
    $overline(x) = (2 + 4 + 6 + m) / 4 = (12 + m) / 4 = 3 + m/4$. Mệnh đề a ĐÚNG.

    #step([Tìm cực tiểu của phương sai theo m])
    Ta có $sum_(i=1)^4 (x_i - overline(x))^2 = sum x_i^2 - 4(overline(x))^2 = (2^2 + 4^2 + 6^2 + m^2) - 4(3 + m/4)^2$
    $= (56 + m^2) - 4(9 + (3m)/2 + m^2/16) = 56 + m^2 - 36 - 6m - m^2/4 = (3m^2)/4 - 6m + 20$.
    Đạo hàm hoặc tọa độ đỉnh parabol: $m = -(-6)/(2 dot 3/4) = 6 / (1.5) = 4$.
    Tại $m = 4$, phương sai đạt giá trị nhỏ nhất. Mệnh đề b ĐÚNG.

    #step([Giá trị phương sai nhỏ nhất])
    Thay $m = 4$: Tổng bình phương độ lệch bằng $3/4(16) - 24 + 20 = 12 - 24 + 20 = 8$.
    Phương sai $s_min^2 = 8 / 4 = 2.0$. Mệnh đề c ĐÚNG.

    #step([Giới hạn trên của phương sai])
    Hàm phương sai $s^2(m) = (3m^2/16) - (3m)/2 + 5$ là hàm bậc hai có hệ số $a = 3/16 > 0$.
    Khi $|m| -> oo$ thì $s^2(m) -> +oo$, do đó phương sai có thể lớn tùy ý, vượt quá $100$ khi $m$ đủ lớn. Khẳng định không tồn tại là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tác động của giá trị ngoại lệ lên các số đo độ phân tán)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu ban đầu gồm $11$ giá trị không có ngoại lệ:
#align(center)[
  $10; quad 12; quad 14; quad 15; quad 16; quad 18; quad 20; quad 21; quad 22; quad 24; quad 25$
]
Do lỗi nhập liệu hệ thống, một nhân viên gõ nhầm giá trị cuối cùng thành $250$ (mẫu lỗi có giá trị cực đại bằng $250$).
Xét tính đúng sai của các nhận định sau khi so sánh giữa mẫu ban đầu và mẫu bị lỗi:],
  (
    True([Khoảng biến thiên của mẫu số liệu bị tăng vọt từ $R = 15$ lên $R' = 240$.]),
    True([Trung vị của mẫu số liệu hoàn toàn không bị ảnh hưởng bởi lỗi nhập liệu này ($M_e = M_e' = 18$).]),
    True([Khoảng tứ phân vị của mẫu số liệu không bị thay đổi vì cả hai giá trị $25$ và $250$ đều thuộc nửa trên và không làm đổi vị trí các tứ phân vị ($Delta_Q = Delta_Q' = 8$).]),
    [Phương sai của mẫu số liệu ít bị ảnh hưởng bởi giá trị gõ nhầm này so với khoảng tứ phân vị.]
  ),
  loigiai: [
    #step([Khoảng biến thiên])
    Mẫu ban đầu: $R = 25 - 10 = 15$.
    Mẫu lỗi: $R' = 250 - 10 = 240$. Khoảng biến thiên tăng vọt. Mệnh đề a ĐÚNG.

    #step([Trung vị])
    Vị trí trung vị thứ $6$ là số $18$, không đổi. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    Nửa dưới gồm $5$ số: $10; 12; 14; 15; 16 => Q_1 = 14$.
    Nửa trên mẫu cũ: $20; 21; 22; 24; 25 => Q_3 = 22$.
    Nửa trên mẫu mới: $20; 21; 22; 24; 250 => Q_3' = 22$.
    $Delta_Q = Delta_Q' = 22 - 14 = 8$. Không đổi. Mệnh đề c ĐÚNG.

    #step([Độ nhạy của phương sai])
    Phương sai phụ thuộc vào bình phương độ lệch $(250 - overline(x))^2$ nên bị đội lên cực kỳ lớn. Do đó phương sai nhạy cảm hơn rất nhiều so với khoảng tứ phân vị (khoảng tứ phân vị là số đo vững - robust). Khẳng định phương sai ít bị ảnh hưởng hơn là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tính phương sai từ tổng bình phương)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Một mẫu số liệu gồm $n = 5$ quan sát có tổng các giá trị $sum_(i=1)^5 x_i = 35$ và tổng các bình phương $sum_(i=1)^5 x_i^2 = 285$.
Tính phương sai $s^2$ của mẫu số liệu trên.],
    [8],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = 35 / 5 = 7 $
        
        #step([Tính phương sai theo công thức rút gọn])
        $ s^2 = 1/5 sum_(i=1)^5 x_i^2 - (overline(x))^2 = 285 / 5 - 7^2 = 57 - 49 = 8 $
    ]
)

// TLN 2 (Khoảng tứ phân vị)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu điểm kiểm tra chất lượng đầu vào của $10$ học sinh:
#align(center)[
  $55; quad 60; quad 65; quad 70; quad 75; quad 80; quad 85; quad 90; quad 95; quad 100$
]
Tìm khoảng tứ phân vị $Delta_Q$ của mẫu số liệu điểm số.],
    [25],
    loigiai: [
        #step([Tìm Q1 và Q3])
        $n = 10$, các số đã sắp xếp tăng dần:
        - Nửa dưới gồm $5$ số: $55; 60; 65; 70; 75 => Q_1 = 65$.
        - Nửa trên gồm $5$ số: $80; 85; 90; 95; 100 => Q_3 = 90$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 90 - 65 = 25 $
    ]
)

// TLN 3 (Tìm m để phương sai bằng một số)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu gồm $3$ số: $1; quad 5; quad x$ với $x > 5$.
Biết rằng số trung bình của mẫu số liệu bằng $5$. Tính phương sai $s^2$ của mẫu số liệu.],
    [10.67],
    loigiai: [
        #step([Tìm x])
        $ (1 + 5 + x) / 3 = 5 <=> 6 + x = 15 <=> x = 9 $
        
        #step([Tính phương sai])
        Mẫu số liệu là: $1; 5; 9$.
        $ s^2 = ((1-5)^2 + (5-5)^2 + (9-5)^2) / 3 = (16 + 0 + 16) / 3 = 32 / 3 approx 10.67 $
    ]
)

// TLN 4 (Hệ số biến thiên CV)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Một mẫu số liệu có số trung bình $overline(x) = 50$ và độ lệch chuẩn $s = 4$.
Tính hệ số biến thiên $C V = s / overline(x) dot 100%$ của mẫu số liệu (theo đơn vị %).],
    [8],
    loigiai: [
        #step([Tính hệ số biến thiên])
        $ C V = 4 / 50 dot 100% = 8% $
        Vậy hệ số biến thiên bằng $8%$.
    ]
)

// TLN 5 (Ngưỡng trên ngoại lệ)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Một cuộc khảo sát lương (triệu đồng) của nhân viên có tứ phân vị thứ nhất $Q_1 = 12$ triệu đồng và tứ phân vị thứ ba $Q_3 = 20$ triệu đồng.
Tìm giá trị của ngưỡng trên $T = Q_3 + 1.5 Delta_Q$ (triệu đồng) để xác định mức lương cao bất thường.],
    [32],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 20 - 12 = 8 text(" triệu đồng") $
        
        #step([Tính ngưỡng trên])
        $ T = Q_3 + 1.5 Delta_Q = 20 + 1.5(8) = 20 + 12 = 32 text(" triệu đồng") $
    ]
)

// TLN 6 (Độ lệch chuẩn sau biến đổi)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 127], back-to: "sec-exercise-hub",[Cho mẫu số liệu $x_1, x_2, dots, x_n$ có phương sai $s_x^2 = 9$.
Người ta tạo mẫu số liệu mới bằng công thức $y_i = -4 x_i + 25$.
Tính độ lệch chuẩn $s_y$ của mẫu số liệu mới.],
    [12],
    loigiai: [
        #step([Độ lệch chuẩn ban đầu])
        $ s_x = sqrt(s_x^2) = sqrt(9) = 3 $
        
        #step([Tính độ lệch chuẩn mới])
        $ s_y = |-4| dot s_x = 4 dot 3 = 12 $
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN (ĐỀ C: NÂNG CAO - VD, VDC)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
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
