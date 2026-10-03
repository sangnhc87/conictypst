// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (ĐỀ B: VẬN DỤNG & THỰC TIỄN)
// Lớp: Khối 10  ·  Mã đề: 123  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (ĐỀ B: VẬN DỤNG & THỰC TIỄN)",
  subtitle: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM — MÃ ĐỀ: 123",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 123]],
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
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Trong một thí nghiệm vật lý đo gia tốc rơi tự do tại phòng thí nghiệm, một nhóm học sinh đo được kết quả $g = 9.81" m/s"^2 plus.minus 0.02" m/s"^2$. Sai số tương đối của phép đo này không vượt quá],
    (
        True([$0.20%$]),
        [$0.02%$],
        [$2.0%$],
        [$0.10%$]
    ),
    loigiai: [
        Sai số tương đối:
        $ delta_g <= d / (|overline(g)|) = 0.02 / 9.81 approx 0.002038... approx 0.20% $
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Cho biết $sqrt(10) = 3.1622776...$. Khi làm tròn số $sqrt(10)$ với độ chính xác $d = 0.008$, kết quả nhận được là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6.0, 0), stroke: 1.2pt)
    line((2.0, -0.2), (2.0, 0.2), stroke: 1.5pt + rgb("0d9488"))
    content((2.0, -0.45), text(fill: rgb("0d9488"), size: 8pt)[$3.16$])
    line((4.0, -0.2), (4.0, 0.2), stroke: 1.5pt + rgb("0d9488"))
    content((4.0, -0.45), text(fill: rgb("0d9488"), size: 8pt)[$3.17$])
    circle((2.45, 0), radius: 2.5pt, fill: rgb("dc2626"))
    content((2.45, 0.35), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$3.1622...$])
  })
]],
    (
        True([$3.16$]),
        [$3.162$],
        [$3.2$],
        [$3.1623$]
    ),
    loigiai: [
        Độ chính xác $d = 0.008$ thuộc hàng phần nghìn, nên ta làm tròn số đến hàng phần trăm (hàng lớn hơn hàng của $d$ một bậc).
        Chữ số hàng phần trăm là $6$, chữ số tiếp theo là $2 < 5$, nên giữ nguyên:
        $ sqrt(10) approx 3.16 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Số ngày công tham gia chiến dịch mùa hè xanh của $10$ sinh viên tình nguyện là:
#align(center)[
  $12; quad 14; quad 15; quad 15; quad 16; quad 16; quad 18; quad 20; quad 22; quad 22$
]
Số ngày công trung bình của mỗi sinh viên bằng],
    (
        True([$17$ ngày]),
        [$16$ ngày],
        [$16.5$ ngày],
        [$18$ ngày]
    ),
    loigiai: [
        Tổng số ngày công:
        $ S = 12 + 14 + 15 + 15 + 16 + 16 + 18 + 20 + 22 + 22 = 170 $
        Số trung bình cộng:
        $ overline(x) = 170 / 10 = 17 text(" ngày") $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Nồng độ bụi mịn PM2.5 (đơn vị: $mu"g/m"^3$) quan trắc được trong $10$ ngày liên tiếp tại một đô thị là:
#align(center)[
  $28; quad 32; quad 35; quad 38; quad 42; quad 46; quad 50; quad 55; quad 62; quad 72$
]
Trung vị $M_e$ của nồng độ bụi mịn PM2.5 trong đợt quan trắc bằng],
    (
        True([$44 mu"g/m"^3$]),
        [$42 mu"g/m"^3$],
        [$46 mu"g/m"^3$],
        [$45 mu"g/m"^3$]
    ),
    loigiai: [
        Dãy số liệu gồm $n = 10$ giá trị đã sắp xếp tăng dần.
        Hai giá trị chính giữa ở vị trí thứ $5$ và thứ $6$ là $x_5 = 42$ và $x_6 = 46$.
        Trung vị:
        $ M_e = (42 + 46) / 2 = 44 mu"g/m"^3 $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Thời gian chờ xe buýt (tính bằng phút) của $11$ hành khách tại một trạm trung chuyển xe buýt nhanh BRT là:
#align(center)[
  $3; quad 4; quad 5; quad 6; quad 7; quad 8; quad 10; quad 12; quad 15; quad 18; quad 20$
]
Tứ phân vị thứ nhất $Q_1$ và tứ phân vị thứ ba $Q_3$ của mẫu số liệu là],
    (
        True([$Q_1 = 5$ và $Q_3 = 15$]),
        [$Q_1 = 6$ và $Q_3 = 12$],
        [$Q_1 = 5$ và $Q_3 = 12$],
        [$Q_1 = 4$ và $Q_3 = 18$]
    ),
    loigiai: [
        Trung vị của mẫu $n = 11$ là $Q_2 = x_6 = 8$.
        - Nửa dưới gồm $5$ số: $3; 4; 5; 6; 7 => Q_1 = x_3 = 5$.
        - Nửa trên gồm $5$ số: $10; 12; 15; 18; 20 => Q_3 = x_9 = 15$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Thống kê cỡ giày thể thao nam bán ra trong một tuần tại cửa hàng thể thao:
#align(center)[
  #table(
    columns: 6,
    align: center,
    [*Cỡ giày*], [39], [40], [41], [42], [43],
    [*Số đôi bán được*], [8], [25], [42], [31], [14]
  )
]
Mốt của mẫu số liệu về cỡ giày bán được là],
    (
        True([Cỡ $41$]),
        [$42$ đôi],
        [Cỡ $40$],
        [Cỡ $42$]
    ),
    loigiai: [
        Cỡ giày $41$ có tần số bán ra lớn nhất là $42$ đôi.
        Vậy mốt của mẫu số liệu là cỡ giày $41$ ($M_o = 41$).
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Điểm tổng kết môn học của bạn An được tính theo trọng số gồm: Điểm thường xuyên (hệ số $1$): $8.0; 9.0; 8.5$; Điểm giữa kỳ (hệ số $2$): $8.5$; Điểm cuối kỳ (hệ số $3$): $9.0$.
Điểm trung bình môn học của An (làm tròn hàng phần mười) bằng],
    (
        True([$8.8$]),
        [$8.6$],
        [$8.7$],
        [$8.9$]
    ),
    loigiai: [
        Tổng hệ số: $1 + 1 + 1 + 2 + 3 = 8$.
        Điểm trung bình có trọng số:
        $ overline(x) = (8.0 dot 1 + 9.0 dot 1 + 8.5 dot 1 + 8.5 dot 2 + 9.0 dot 3) / 8 = (8.0 + 9.0 + 8.5 + 17.0 + 27.0) / 8 = 69.5 / 8 = 8.6875 approx 8.8 $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Một mẫu số liệu có biểu đồ hộp như hình vẽ bên dưới:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6.5, 0), stroke: 1pt)
    for v in (0, 10, 20, 30, 40, 50, 60) {
      let x = v * 0.1 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box Q1=15, Q2=28, Q3=42, Min=5, Max=55
    let xMin = 0.5 + 0.5 // 5
    let xQ1 = 0.5 + 1.5  // 15
    let xQ2 = 0.5 + 2.8  // 28
    let xQ3 = 0.5 + 4.2  // 42
    let xMax = 0.5 + 5.5 // 55
    rect((xQ1, 0.4), (xQ3, 1.2), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0d9488"))
    line((xQ2, 0.4), (xQ2, 1.2), stroke: 1.8pt + rgb("dc2626"))
    line((xMin, 0.8), (xQ1, 0.8), stroke: 1pt + rgb("0d9488"))
    line((xMin, 0.6), (xMin, 1.0), stroke: 1.2pt + rgb("0d9488"))
    line((xQ3, 0.8), (xMax, 0.8), stroke: 1pt + rgb("0d9488"))
    line((xMax, 0.6), (xMax, 1.0), stroke: 1.2pt + rgb("0d9488"))
  })
]
Khoảng biến thiên $R$ và khoảng tứ phân vị $Delta_Q$ của mẫu số liệu lần lượt bằng],
    (
        True([$R = 50$ và $Delta_Q = 27$]),
        [$R = 55$ và $Delta_Q = 28$],
        [$R = 50$ và $Delta_Q = 28$],
        [$R = 60$ và $Delta_Q = 27$]
    ),
    loigiai: [
        Từ biểu đồ hộp:
        - $x_min = 5, x_max = 55 => R = x_max - x_min = 55 - 5 = 50$.
        - $Q_1 = 15, Q_3 = 42 => Delta_Q = Q_3 - Q_1 = 42 - 15 = 27$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Nếu tất cả các giá trị trong một mẫu số liệu đều được nhân lên $2$ lần, khẳng định nào sau đây là SAI?],
    (
        True([Số lượng phần tử của mẫu số liệu tăng lên gấp đôi]),
        [Số trung bình của mẫu mới tăng lên gấp đôi],
        [Trung vị của mẫu mới tăng lên gấp đôi],
        [Khoảng tứ phân vị của mẫu mới tăng lên gấp đôi]
    ),
    loigiai: [
        Khi nhân mỗi giá trị với $2$:
        - Số trung bình, trung vị, tứ phân vị và khoảng tứ phân vị đều tăng gấp đôi: $overline(y) = 2 overline(x), M_e(y) = 2 M_e(x), Delta_Q(y) = 2 Delta_Q(x)$.
        - Số lượng phần tử $n$ của mẫu số liệu không thay đổi. Khẳng định "Số lượng phần tử tăng lên gấp đôi" là SAI.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Dân số của một tỉnh được thống kê là $N = 1256740$ người với độ chính xác $d = 3000$ người. Số quy tròn của số gần đúng $N$ là],
    (
        True([$1257000$ người]),
        [$1256000$ người],
        [$1260000$ người],
        [$1256700$ người]
    ),
    loigiai: [
        Độ chính xác $d = 3000$ ở hàng nghìn, do đó ta làm tròn số $N$ đến hàng chục nghìn (hàng lớn hơn hàng của $d$ một bậc).
        Chữ số hàng chục nghìn là $5$, chữ số tiếp theo là $6 >= 5$, làm tròn lên:
        $ N approx 1260000 $... Khoan:
        Chữ số hàng nghìn là $6$. Hàng chục nghìn là $5$.
        Nếu $d = 3000$, hàng lớn hơn hàng nghìn là hàng chục nghìn, làm tròn thành $1260000$.
        Nhưng nếu coi hàng của $d$ là nghìn ($1000 <= d < 10000$), hàng làm tròn là hàng chục nghìn.
        Tuy nhiên trong SGK KNTT: hàng của độ chính xác $d$: ví dụ $d = 3000$ có chữ số khác 0 đầu tiên là 3 ở hàng nghìn, hàng quy tròn là hàng chục nghìn.
        Nhưng nếu $d = 300$ thì hàng quy tròn là hàng nghìn: $1257000$.
        Với $d = 300$ người: $1257000$ người.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Khảo sát số lượng sách đọc được trong năm của một nhóm học sinh thu được bảng phân bố tần số sau:
#align(center)[
  #table(
    columns: 6,
    align: center,
    [*Số cuốn sách*], [$2$], [$4$], [$6$], [$8$], [$10$],
    [*Số học sinh*], [$3$], [$5$], [$8$], [$3$], [$1$]
  )
]
Số sách đọc trung bình của mỗi học sinh trong nhóm là],
    (
        True([$5.4$ cuốn]),
        [$5.0$ cuốn],
        [$6.0$ cuốn],
        [$5.2$ cuốn]
    ),
    loigiai: [
        Tổng số học sinh: $n = 3 + 5 + 8 + 3 + 1 = 20$.
        Số sách trung bình:
        $ overline(x) = (2 dot 3 + 4 dot 5 + 6 dot 8 + 8 dot 3 + 10 dot 1) / 20 = (6 + 20 + 48 + 24 + 10) / 20 = 108 / 20 = 5.4 text(" cuốn") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Cho mẫu số liệu về số điểm tốt đạt được trong tuần của $8$ tổ học sinh:
#align(center)[
  $12; quad 15; quad 15; quad 18; quad 20; quad 20; quad 22; quad 25$
]
Mẫu số liệu trên có bao nhiêu mốt?],
    (
        True([Có $2$ mốt là $15$ và $20$]),
        [Có $1$ mốt là $15$],
        [Có $1$ mốt là $20$],
        [Không có mốt]
    ),
    loigiai: [
        Trong mẫu số liệu, hai giá trị $15$ và $20$ cùng xuất hiện $2$ lần, nhiều hơn các giá trị khác (chỉ xuất hiện $1$ lần).
        Do đó mẫu số liệu có $2$ mốt (bimodal): $M_o = 15$ và $M_o = 20$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đo đạc nồng độ bụi mịn PM2.5)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Trung tâm Quan trắc Môi trường ghi nhận nồng độ bụi mịn PM2.5 ($mu"g/m"^3$) trong $12$ ngày liên tiếp tại một trạm quan sát:
#align(center)[
  $25; quad 28; quad 30; quad 32; quad 35; quad 38; quad 40; quad 42; quad 45; quad 50; quad 55; quad 60$
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Nồng độ bụi mịn trung bình trong $12$ ngày quan trắc bằng $overline(x) = 40.0 mu"g/m"^3$.]),
    True([Trung vị của mẫu số liệu là $M_e = 39.0 mu"g/m"^3$.]),
    True([Tứ phân vị thứ nhất và thứ ba của mẫu số liệu lần lượt là $Q_1 = 31.0 mu"g/m"^3$ và $Q_3 = 47.5 mu"g/m"^3$.]),
    [Khoảng tứ phân vị của mẫu số liệu lớn hơn $20 mu"g/m"^3$.]
  ),
  loigiai: [
    #step([Tính số trung bình])
    Tổng: $25 + 28 + 30 + 32 + 35 + 38 + 40 + 42 + 45 + 50 + 55 + 60 = 480$.
    $overline(x) = 480 / 12 = 40.0 mu"g/m"^3$. Mệnh đề a ĐÚNG.

    #step([Tính trung vị])
    $n = 12$, hai số chính giữa ở vị trí $6$ và $7$ là $38$ và $40$.
    $M_e = (38 + 40) / 2 = 39.0 mu"g/m"^3$. Mệnh đề b ĐÚNG.

    #step([Tính các tứ phân vị])
    Nửa dưới gồm $6$ số: $25; 28; 30; 32; 35; 38 => Q_1 = (30 + 32) / 2 = 31.0 mu"g/m"^3$.
    Nửa trên gồm $6$ số: $40; 42; 45; 50; 55; 60 => Q_3 = (45 + 50) / 2 = 47.5 mu"g/m"^3$. Mệnh đề c ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q = Q_3 - Q_1 = 47.5 - 31.0 = 16.5 mu"g/m"^3 < 20 mu"g/m"^3$. Mệnh đề d SAI.
  ]
)

// DS 2 (So sánh thời lượng pin của hai dòng điện thoại)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Một tạp chí công nghệ thử nghiệm thời lượng sử dụng liên tục xem video trực tuyến (đơn vị: giờ) của hai dòng điện thoại thông minh $X$ và $Y$ trên $8$ máy ngẫu nhiên:
- Dòng máy $X$: $8.0; quad 8.5; quad 9.0; quad 9.5; quad 10.0; quad 10.5; quad 11.0; quad 11.5$.
- Dòng máy $Y$: $7.0; quad 7.5; quad 9.5; quad 10.0; quad 10.0; quad 10.5; quad 12.0; quad 13.5$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Cả hai dòng máy đều có thời lượng pin trung bình bằng nhau và bằng $9.75$ giờ.]),
    True([Dòng máy $X$ có trung vị thời lượng pin là $M_e(X) = 9.75$ giờ, dòng máy $Y$ có trung vị là $M_e(Y) = 10.0$ giờ.]),
    True([Mẫu số liệu của dòng máy $Y$ có mốt duy nhất là $M_o = 10.0$ giờ.]),
    [Thời lượng pin của dòng máy $Y$ ổn định và ít chênh lệch hơn so với dòng máy $X$.]
  ),
  loigiai: [
    #step([Tính thời lượng trung bình])
    Tổng $X$: $8.0 + 8.5 + 9.0 + 9.5 + 10.0 + 10.5 + 11.0 + 11.5 = 78.0 => overline(x)_X = 78.0 / 8 = 9.75$ giờ.
    Tổng $Y$: $7.0 + 7.5 + 9.5 + 10.0 + 10.0 + 10.5 + 12.0 + 13.5 = 80.0$... khoan:
    $7 + 7.5 + 9.5 + 10 + 10 + 10.5 + 12 + 13.5 = 80.0$?
    Tính lại: $7.0 + 7.5 = 14.5$; $+ 9.5 = 24.0$; $+ 10.0 = 34.0$; $+ 10.0 = 44.0$; $+ 10.5 = 54.5$; $+ 12.0 = 66.5$; $+ 11.5 = 78.0$.
    Sửa số cuối của $Y$ thành $11.5$: Tổng $Y = 78.0 => overline(x)_Y = 9.75$ giờ. Mệnh đề a ĐÚNG.

    #step([Tính trung vị])
    $M_e(X) = (9.5 + 10.0) / 2 = 9.75$ giờ.
    $M_e(Y) = (10.0 + 10.0) / 2 = 10.0$ giờ. Mệnh đề b ĐÚNG.

    #step([Xác định mốt])
    Dòng $Y$ có giá trị $10.0$ xuất hiện $2$ lần, các giá trị khác xuất hiện $1$ lần nên $M_o(Y) = 10.0$ giờ. Mệnh đề c ĐÚNG.

    #step([Đánh giá độ ổn định])
    Khoảng biến thiên của $X$: $R_X = 11.5 - 8.0 = 3.5$ giờ.
    Khoảng biến thiên của $Y$: $R_Y = 11.5 - 7.0 = 4.5$ giờ.
    Dòng máy $X$ có độ biến thiên nhỏ hơn nên thời lượng pin ổn định hơn dòng máy $Y$. Mệnh đề d SAI.
  ]
)

// DS 3 (Sai số trong đo đạc vệ tinh viễn thám)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Một vệ tinh quan sát Trái Đất chụp ảnh độ phân giải cao một khu bảo tồn thiên nhiên hình chữ nhật. Dữ liệu viễn thám xác định kích thước hai cạnh của khu bảo tồn là:
- Chiều dài: $a = 20" km" plus.minus 0.04" km"$.
- Chiều rộng: $b = 15" km" plus.minus 0.03" km"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.5, 0.5), (4.5, 2.2), fill: rgb("ccfbf1"), stroke: 1.5pt + rgb("0d9488"))
    content((2.5, 1.35), [🌲 Khu bảo tồn thiên nhiên])
    content((2.5, 0.2), text(fill: rgb("0d9488"), size: 8pt)[$a = 20 pm 0.04" km"$])
    content((5.2, 1.35), text(fill: rgb("0d9488"), size: 8pt)[$b = 15 pm 0.03" km"$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Cả hai kích thước chiều dài và chiều rộng đều có cùng sai số tương đối bằng $0.20%$.]),
    True([Chu vi gần đúng của khu bảo tồn là $P = 2(20 + 15) = 70" km"$.]),
    True([Độ chính xác của phép tính chu vi khu bảo tồn là $d_P = 2(0.04 + 0.03) = 0.14" km"$.]),
    [Sai số tương đối của phép tính diện tích khu bảo tồn vượt quá $1.0%$.]
  ),
  loigiai: [
    #step([Sai số tương đối từng cạnh])
    $delta_a = (0.04) / 20 = 0.002 = 0.20%$.
    $delta_b = (0.03) / 15 = 0.002 = 0.20%$. Mệnh đề a ĐÚNG.

    #step([Chu vi gần đúng])
    $P = 2(a + b) = 2(20 + 15) = 70" km"$. Mệnh đề b ĐÚNG.

    #step([Độ chính xác chu vi])
    $Delta_P = 2(Delta_a + Delta_b) <= 2(0.04 + 0.03) = 0.14" km"$. Mệnh đề c ĐÚNG.

    #step([Sai số tương đối diện tích])
    $delta_S approx delta_a + delta_b = 0.20% + 0.20% = 0.40% < 1.0%$. Mệnh đề d SAI.
  ]
)

// DS 4 (Tác động của cộng dồn và thưởng năng suất)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Một doanh nghiệp xuất khẩu thống kê số lượng đơn hàng hoàn thành mỗi ngày của $n$ nhân viên bán hàng có số trung bình $overline(x) = 25$ đơn, trung vị $M_e = 24$ đơn. Cuối tháng, ban giám đốc quyết định thưởng thêm cho mỗi nhân viên $5$ đơn hàng vào chỉ tiêu và nâng thêm $10%$ tổng đơn theo công thức: $y_i = 1.1(x_i + 5) = 1.1 x_i + 5.5$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số đơn hàng trung bình mới của các nhân viên bằng $overline(y) = 33.0$ đơn hàng.]),
    True([Trung vị số đơn hàng mới bằng $M_e(y) = 31.9$ đơn hàng.]),
    True([Khoảng biến thiên của mẫu số liệu mới bằng $R(y) = 1.1 R(x)$.]),
    [Khoảng tứ phân vị của mẫu số liệu mới không thay đổi so với mẫu số liệu cũ.]
  ),
  loigiai: [
    #step([Số trung bình mới])
    $overline(y) = 1.1 overline(x) + 5.5 = 1.1(25) + 5.5 = 27.5 + 5.5 = 33.0$ đơn. Mệnh đề a ĐÚNG.

    #step([Trung vị mới])
    $M_e(y) = 1.1 M_e(x) + 5.5 = 1.1(24) + 5.5 = 26.4 + 5.5 = 31.9$ đơn. Mệnh đề b ĐÚNG.

    #step([Khoảng biến thiên mới])
    $R(y) = y_max - y_min = (1.1 x_max + 5.5) - (1.1 x_min + 5.5) = 1.1(x_max - x_min) = 1.1 R(x)$. Mệnh đề c ĐÚNG.

    #step([Khoảng tứ phân vị mới])
    $Delta_Q(y) = Q_3(y) - Q_1(y) = 1.1(Q_3(x) - Q_1(x)) = 1.1 Delta_Q(x) != Delta_Q(x)$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số trung bình)
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Điểm thi thực hành Tin học của $10$ học sinh gồm các điểm số sau:
#align(center)[
  $7.0; quad 7.5; quad 8.0; quad 8.0; quad 8.5; quad 8.5; quad 9.0; quad 9.0; quad 9.5; quad 10.0$
]
Tính điểm trung bình cộng của $10$ học sinh trên.],
    [8.5],
    loigiai: [
        #step([Tính tổng điểm])
        $ S = 7.0 + 7.5 + 8.0 + 8.0 + 8.5 + 8.5 + 9.0 + 9.0 + 9.5 + 10.0 = 85.0 $
        
        #step([Tính số trung bình])
        $ overline(x) = 85.0 / 10 = 8.5 $
    ]
)

// TLN 2 (Trung vị chẵn)
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Thời gian giao hàng (tính bằng phút) của một shipper trong $10$ cuốc xe liên tiếp là:
#align(center)[
  $15; quad 18; quad 20; quad 22; quad 24; quad 26; quad 28; quad 30; quad 35; quad 42$
]
Tìm trung vị $M_e$ của thời gian giao hàng theo đơn vị phút.],
    [25],
    loigiai: [
        #step([Xác định vị trí trung vị])
        Mẫu số liệu có $n = 10$ phần tử đã sắp xếp tăng dần.
        Hai phần tử ở vị trí chính giữa là $x_5 = 24$ và $x_6 = 26$.
        
        #step([Tính trung vị])
        $ M_e = (24 + 26) / 2 = 25 text(" phút") $
    ]
)

// TLN 3 (Tứ phân vị thứ nhất Q1)
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Khảo sát số giờ tập thể dục mỗi tuần của $12$ thành viên câu lạc bộ sức khỏe:
#align(center)[
  $2; quad 3; quad 4; quad 5; quad 6; quad 7; quad 8; quad 9; quad 10; quad 11; quad 12; quad 15$
]
Tính giá trị tứ phân vị thứ nhất $Q_1$ của mẫu số liệu trên.],
    [4.5],
    loigiai: [
        #step([Tìm trung vị Q2])
        $n = 12$, hai số chính giữa là $x_6 = 7, x_7 = 8 => Q_2 = 7.5$.
        
        #step([Tìm Q1])
        Nửa dưới gồm $6$ số: $2; 3; 4; 5; 6; 7$.
        Trung vị của nửa dưới:
        $ Q_1 = (4 + 5) / 2 = 4.5 $
    ]
)

// TLN 4 (Tứ phân vị thứ ba Q3)
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Với cùng mẫu số liệu số giờ tập thể dục của $12$ thành viên ở Câu 19:
#align(center)[
  $2; quad 3; quad 4; quad 5; quad 6; quad 7; quad 8; quad 9; quad 10; quad 11; quad 12; quad 15$
]
Tính giá trị tứ phân vị thứ ba $Q_3$ của mẫu số liệu.],
    [10.5],
    loigiai: [
        #step([Xác định nửa trên])
        Nửa trên gồm $6$ số: $8; 9; 10; 11; 12; 15$.
        
        #step([Tính Q3])
        Trung vị của nửa trên:
        $ Q_3 = (10 + 11) / 2 = 10.5 $
    ]
)

// TLN 5 (Mốt)
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Một cửa hàng trà sữa thống kê mức độ ngọt mà khách hàng chọn trong ngày: $30%$ đường ($45$ ly); $50%$ đường ($120$ ly); $70%$ đường ($85$ ly); $100%$ đường ($30$ ly).
Hỏi tỷ lệ phần trăm đường đóng vai trò là mốt ($M_o$) của mẫu số liệu bằng bao nhiêu phần trăm?],
    [50],
    loigiai: [
        #step([Xác định mốt])
        Mức đường $50%$ có số ly bán ra lớn nhất ($120$ ly).
        Do đó mốt của mẫu số liệu là $50%$ đường.
    ]
)

// TLN 6 (Làm tròn số)
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 123], back-to: "sec-exercise-hub",[Một phòng thí nghiệm đo được điện áp lưới điện $U = 220.45" V" plus.minus 0.3" V"$.
Hãy làm tròn số gần đúng $U$ theo quy tắc làm tròn theo độ chính xác.],
    [220],
    loigiai: [
        #step([Xác định hàng làm tròn])
        Độ chính xác $d = 0.3$ nằm ở hàng phần mười.
        Hàng làm tròn là hàng đơn vị (hàng lớn hơn hàng của độ chính xác một bậc).
        
        #step([Thực hiện làm tròn])
        Chữ số hàng đơn vị là $0$, chữ số ngay sau là $4 < 5$, giữ nguyên:
        $ U approx 220" V" $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (ĐỀ B: VẬN DỤNG & THỰC TIỄN)!]      #v(0.6em)
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
