// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (ĐỀ A: CƠ BẢN - VẬN DỤNG)
// Lớp: Khối 10  ·  Mã đề: 122  ·  GV: Nguyễn Văn Sang
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

//

#show: lecture-theme.with(
  title: "BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (ĐỀ A: CƠ BẢN - VẬN DỤNG)",
  subtitle: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM — MÃ ĐỀ: 122",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 122]],
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
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Kết quả đo chiều dài của một cây cầu vượt đường cao tốc được ghi nhận là $L = 152" m" plus.minus 0.2" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6.0, 0), stroke: 1.2pt)
    line((1.5, -0.2), (1.5, 0.2), stroke: 1.5pt + rgb("1e40af"))
    line((3.0, -0.3), (3.0, 0.3), stroke: 2pt + rgb("dc2626"))
    line((4.5, -0.2), (4.5, 0.2), stroke: 1.5pt + rgb("1e40af"))
    content((1.5, -0.45), text(fill: rgb("1e40af"), size: 8pt)[$151.8$])
    content((3.0, -0.55), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$152.0$])
    content((4.5, -0.45), text(fill: rgb("1e40af"), size: 8pt)[$152.2$])
    line((1.5, 0.5), (4.5, 0.5), mark: (start: "|", end: "|"), stroke: 1pt + rgb("1e40af"))
    content((3.0, 0.8), text(fill: rgb("1e40af"), size: 8pt)[Độ chính xác $d = 0.2" m"$])
  })
]
Độ chính xác của phép đo chiều dài cây cầu bằng],
    (
        True([$d = 0.2" m"$]),
        [$d = 152" m"$],
        [$d = 0.4" m"$],
        [$d = 0.1" m"$]
    ),
    loigiai: [
        Theo quy ước biểu diễn số gần đúng $a = overline(a) plus.minus d$, độ chính xác của phép đo là $d = 0.2" m"$.
        Số đúng $L$ nằm trong đoạn $[152 - 0.2; 152 + 0.2] = [151.8; 152.2]$ (m).
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Khi làm tròn số $pi approx 3.14159265...$ đến hàng phần nghìn (chữ số thập phân thứ ba), ta được số gần đúng là],
    (
        True([$3.142$]),
        [$3.141$],
        [$3.140$],
        [$3.14$]
    ),
    loigiai: [
        Chữ số ở hàng phần nghìn là chữ số $1$. Chữ số ngay sau nó là chữ số $5 >= 5$.
        Theo quy tắc làm tròn, ta cộng thêm $1$ vào chữ số hàng phần nghìn:
        $ 3.1415... approx 3.142 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Một thửa ruộng hình chữ nhật có chiều dài đo được là $a = 40" m" plus.minus 0.1" m"$. Sai số tương đối của phép đo chiều dài thửa ruộng không vượt quá],
    (
        True([$0.25%$]),
        [$0.5%$],
        [$0.1%$],
        [$0.025%$]
    ),
    loigiai: [
        Sai số tương đối thỏa mãn:
        $ delta_a <= d / (|overline(a)|) = 0.1 / 40 = 0.0025 = 0.25% $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Điểm kiểm tra thường xuyên môn Toán của một nhóm gồm $7$ học sinh là:
#align(center)[
  #table(
    columns: 7,
    align: center,
    [$6$], [$7$], [$7$], [$8$], [$8$], [$9$], [$10$]
  )
]
Điểm trung bình của nhóm học sinh này (làm tròn đến hàng phần mười) bằng],
    (
        True([$7.9$]),
        [$7.8$],
        [$8.0$],
        [$7.5$]
    ),
    loigiai: [
        Số trung bình cộng của mẫu số liệu:
        $ overline(x) = (6 + 7 + 7 + 8 + 8 + 9 + 10) / 7 = 55 / 7 approx 7.857... approx 7.9 $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Thời gian chạy cự ly $100" m"$ (tính bằng giây) của $9$ vận động viên được ghi lại như sau:
#align(center)[
  $11.2; quad 11.5; quad 11.8; quad 12.0; quad 12.1; quad 12.4; quad 12.6; quad 13.0; quad 13.5$
]
Trung vị $M_e$ của mẫu số liệu trên bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for i in range(9) {
      let x = 0.5 + i * 0.75
      circle((x, 0), radius: 2pt, fill: if i == 4 { rgb("dc2626") } else { black })
    }
    content((3.5, -0.4), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$M_e = x_5$])
  })
]],
    (
        True([$12.1" s"$]),
        [$12.0" s"$],
        [$12.2" s"$],
        [$12.4" s"$]
    ),
    loigiai: [
        Mẫu số liệu gồm $n = 9$ giá trị đã được sắp xếp theo thứ tự không giảm.
        Vì $n = 9$ là số lẻ nên trung vị là số đứng ở vị trí chính giữa (vị trí thứ $(9+1)/2 = 5$):
        $ M_e = x_5 = 12.1" s" $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Khối lượng của $8$ quả bưởi da xanh (đơn vị: kilôgam) được cân trong đợt thu hoạch là:
#align(center)[
  $1.2; quad 1.3; quad 1.4; quad 1.5; quad 1.7; quad 1.8; quad 2.0; quad 2.3$
]
Trung vị $M_e$ của khối lượng $8$ quả bưởi bằng],
    (
        True([$1.6" kg"$]),
        [$1.5" kg"$],
        [$1.7" kg"$],
        [$1.65" kg"$]
    ),
    loigiai: [
        Mẫu số liệu gồm $n = 8$ giá trị đã sắp xếp theo thứ tự không giảm.
        Vì $n = 8$ là số chẵn nên trung vị bằng trung bình cộng của hai số chính giữa ở vị trí thứ $4$ và thứ $5$:
        $ M_e = (x_4 + x_5) / 2 = (1.5 + 1.7) / 2 = 1.6" kg" $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Cho mẫu số liệu điểm đánh giá năng lực của $7$ ứng viên:
#align(center)[
  $65; quad 70; quad 75; quad 80; quad 85; quad 90; quad 95$
]
Tứ phân vị thứ nhất $Q_1$ và tứ phân vị thứ ba $Q_3$ của mẫu số liệu lần lượt là],
    (
        True([$Q_1 = 70$ và $Q_3 = 90$]),
        [$Q_1 = 65$ và $Q_3 = 95$],
        [$Q_1 = 75$ và $Q_3 = 85$],
        [$Q_1 = 70$ và $Q_3 = 85$]
    ),
    loigiai: [
        - Trung vị $Q_2 = x_4 = 80$.
        - Nửa dưới gồm $3$ số liệu: $65; 70; 75$. Trung vị của nửa dưới là $Q_1 = 70$.
        - Nửa trên gồm $3$ số liệu: $85; 90; 95$. Trung vị của nửa trên là $Q_3 = 90$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Khảo sát cỡ áo phông của $30$ bạn học sinh trong một lớp học, kết quả thu được bảng tần số như sau:
#align(center)[
  #table(
    columns: 5,
    align: center,
    [*Cỡ áo (Size)*], [S], [M], [L], [XL],
    [*Tần số*], [5], [14], [8], [3]
  )
]
Mốt $M_o$ của mẫu số liệu về cỡ áo là],
    (
        True([Cỡ M]),
        [$14$],
        [Cỡ L],
        [Cỡ S]
    ),
    loigiai: [
        Mốt là giá trị có tần số xuất hiện lớn nhất trong mẫu số liệu.
        Trong bảng tần số, cỡ áo M có tần số lớn nhất là $14$.
        Vậy mốt của mẫu số liệu là cỡ M ($M_o = text("M")$).
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Thu nhập hàng tháng (triệu đồng) của $5$ nhân viên trong một công ty khởi nghiệp là:
#align(center)[
  $8; quad 9; quad 10; quad 11; quad 120$
]
Trong các số đặc trưng sau, số nào phản ánh trung thực và đại diện tốt nhất cho mức thu nhập phổ biến của các nhân viên?],
    (
        True([Trung vị $M_e = 10$ triệu đồng]),
        [Số trung bình $overline(x) = 31.6$ triệu đồng],
        [Số lớn nhất $x_max = 120$ triệu đồng],
        [Mốt $M_o = 8$ triệu đồng]
    ),
    loigiai: [
        Mẫu số liệu có giá trị bất thường $120$ triệu đồng (thu nhập của giám đốc sáng lập) quá lớn so với các giá trị còn lại.
        - Số trung bình $overline(x) = (8 + 9 + 10 + 11 + 120) / 5 = 31.6$ triệu đồng bị kéo lệch rất nhiều và không đại diện cho số đông.
        - Trung vị $M_e = 10$ triệu đồng không bị ảnh hưởng bởi giá trị ngoại lệ, phản ánh chính xác mức thu nhập phổ biến của nhân viên.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Cho biết $sqrt(3) = 1.7320508...$. Khi làm tròn số $sqrt(3)$ với độ chính xác $d = 0.005$, ta được kết quả là],
    (
        True([$1.73$]),
        [$1.732$],
        [$1.7$],
        [$1.7321$]
    ),
    loigiai: [
        Vì độ chính xác $d = 0.005$ ở hàng phần nghìn, nên chữ số đáng tin nằm ở hàng phần trăm (hàng lớn hơn một bậc).
        Ta làm tròn số $1.73205...$ đến hàng phần trăm:
        Chữ số sau chữ số $3$ là $2 < 5$, giữ nguyên: $sqrt(3) approx 1.73$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Một xạ thủ bắn $20$ phát súng vào bia, điểm số đạt được ghi lại trong bảng tần số sau:
#align(center)[
  #table(
    columns: 5,
    align: center,
    [*Điểm số ($x_i$)*], [$8$], [$9$], [$10$], [Tổng cộng],
    [*Tần số ($m_i$)*], [$4$], [$10$], [$6$], [$20$]
  )
]
Điểm số bắn trung bình của xạ thủ bằng],
    (
        True([$9.1$ điểm]),
        [$9.0$ điểm],
        [$9.2$ điểm],
        [$8.9$ điểm]
    ),
    loigiai: [
        Điểm số trung bình cộng:
        $ overline(x) = (8 dot 4 + 9 dot 10 + 10 dot 6) / 20 = (32 + 90 + 60) / 20 = 182 / 20 = 9.1 text(" điểm") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Biểu đồ hộp (Box plot) dưới đây tóm tắt kết quả kiểm tra chất lượng sản phẩm của một dây chuyền tự động:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (10, 20, 30, 40, 50, 60, 70) {
      let x = (v - 10) * 0.1 * 1.0 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box from Q1=30 to Q3=55
    let xMin = 0.5 + 1.0 // 20
    let xQ1 = 0.5 + 2.0  // 30
    let xQ2 = 0.5 + 3.5  // 45
    let xQ3 = 0.5 + 4.5  // 55
    let xMax = 0.5 + 5.5 // 65
    rect((xQ1, 0.4), (xQ3, 1.2), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1e40af"))
    line((xQ2, 0.4), (xQ2, 1.2), stroke: 1.8pt + rgb("dc2626"))
    line((xMin, 0.8), (xQ1, 0.8), stroke: 1pt + rgb("1e40af"))
    line((xMin, 0.6), (xMin, 1.0), stroke: 1.2pt + rgb("1e40af"))
    line((xQ3, 0.8), (xMax, 0.8), stroke: 1pt + rgb("1e40af"))
    line((xMax, 0.6), (xMax, 1.0), stroke: 1.2pt + rgb("1e40af"))
    content((xQ2, 1.45), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$Q_2 = 45$])
  })
]
Dựa vào biểu đồ hộp, giá trị trung vị $Q_2$ và khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$ lần lượt bằng],
    (
        True([$Q_2 = 45$ và $Delta_Q = 25$]),
        [$Q_2 = 45$ và $Delta_Q = 45$],
        [$Q_2 = 40$ và $Delta_Q = 25$],
        [$Q_2 = 50$ và $Delta_Q = 35$]
    ),
    loigiai: [
        Từ biểu đồ hộp:
        - Tứ phân vị thứ nhất: $Q_1 = 30$.
        - Trung vị (đường vạch đỏ bên trong hộp): $Q_2 = 45$.
        - Tứ phân vị thứ ba: $Q_3 = 55$.
        Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 55 - 30 = 25$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Số gần đúng và sai số trong xây dựng)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Kỹ sư cầu đường sử dụng thiết bị laser để đo bề rộng mặt cầu $b$ và chiều dài nhịp cầu chính $L$. Kết quả đo đạc kỹ thuật được công bố như sau:
- Bề rộng mặt cầu: $b = 24.5" m" plus.minus 0.05" m"$.
- Chiều dài nhịp cầu chính: $L = 120.0" m" plus.minus 0.2" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.5, 0.5), (4.5, 1.8), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("1e40af"))
    content((2.5, 1.15), [🌉 Mặt cầu $24.5" m" times 120.0" m"$])
    line((0.5, 0.2), (4.5, 0.2), mark: (start: "|", end: "|"), stroke: 1pt + rgb("1e40af"))
    content((2.5, -0.1), text(fill: rgb("1e40af"), size: 8pt)[$L = 120.0 pm 0.2" m"$])
    line((4.8, 0.5), (4.8, 1.8), mark: (start: "|", end: "|"), stroke: 1pt + rgb("1e40af"))
    content((5.5, 1.15), text(fill: rgb("1e40af"), size: 8pt)[$b = 24.5 pm 0.05" m"$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Độ chính xác của phép đo bề rộng mặt cầu là $d_b = 0.05" m"$ và của chiều dài nhịp cầu là $d_L = 0.2" m"$.]),
    True([Giá trị đúng của bề rộng mặt cầu nằm chắc chắn trong khoảng $[24.45; 24.55]$ (m).]),
    True([Sai số tương đối của phép đo chiều dài nhịp cầu chính xấp xỉ $0.17%$, nhỏ hơn sai số tương đối của phép đo bề rộng mặt cầu (xấp xỉ $0.20%$).]),
    [Phép đo bề rộng mặt cầu có độ chính xác tương đối cao hơn phép đo chiều dài nhịp cầu chính.]
  ),
  loigiai: [
    #step([Độ chính xác phép đo])
    $d_b = 0.05" m"$ và $d_L = 0.2" m"$. Mệnh đề a ĐÚNG.

    #step([Khoảng giá trị đúng])
    $24.5 - 0.05 = 24.45 <= b <= 24.5 + 0.05 = 24.55$ (m). Mệnh đề b ĐÚNG.

    #step([Sai số tương đối])
    $delta_L <= (0.2) / 120.0 approx 0.00167 = 0.17%$.
    $delta_b <= (0.05) / 24.5 approx 0.00204 = 0.20%$.
    Vì $0.17% < 0.20%$ nên phép đo chiều dài nhịp cầu có sai số tương đối nhỏ hơn. Mệnh đề c ĐÚNG.

    #step([Đánh giá độ chính xác tương đối])
    Phép đo nào có sai số tương đối càng nhỏ thì độ chính xác tương đối càng cao.
    Ở đây phép đo nhịp cầu chính có sai số tương đối nhỏ hơn nên chính xác hơn. Mệnh đề d SAI.
  ]
)

// DS 2 (Khảo sát thời gian sử dụng thiết bị di động)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Một giáo viên chủ nhiệm thống kê thời gian sử dụng điện thoại thông minh phục vụ học tập và tra cứu trực tuyến trong một tuần của $10$ học sinh (đơn vị: giờ):
#align(center)[
  $7; quad 9; quad 10; quad 12; quad 14; quad 15; quad 16; quad 18; quad 20; quad 29$
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số trung bình thời gian sử dụng điện thoại của nhóm học sinh là $overline(x) = 15.0$ giờ/tuần.]),
    True([Trung vị của mẫu số liệu bằng $M_e = 14.5$ giờ/tuần.]),
    True([Tứ phân vị thứ nhất và thứ ba của mẫu số liệu là $Q_1 = 10$ và $Q_3 = 18$.]),
    [Khoảng tứ phân vị của mẫu số liệu bằng $Delta_Q = 9$ giờ/tuần.]
  ),
  loigiai: [
    #step([Tính số trung bình])
    Tổng: $7 + 9 + 10 + 12 + 14 + 15 + 16 + 18 + 20 + 29 = 150$.
    $overline(x) = 150 / 10 = 15.0$ giờ. Mệnh đề a ĐÚNG.

    #step([Tính trung vị])
    Mẫu có $n = 10$ giá trị: $x_5 = 14, x_6 = 15$.
    $M_e = (14 + 15) / 2 = 14.5$ giờ. Mệnh đề b ĐÚNG.

    #step([Tính các tứ phân vị])
    Nửa dưới gồm $5$ số: $7; 9; 10; 12; 14 => Q_1 = x_3 = 10$.
    Nửa trên gồm $5$ số: $15; 16; 18; 20; 29 => Q_3 = x_8 = 18$. Mệnh đề c ĐÚNG.

    #step([Tính khoảng tứ phân vị])
    $Delta_Q = Q_3 - Q_1 = 18 - 10 = 8$ giờ $\ne 9$ giờ. Mệnh đề d SAI.
  ]
)

// DS 3 (So sánh năng suất hai dây chuyền đóng gói)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Quản đốc phân xưởng theo dõi số lượng kiện hàng được đóng gói trong một giờ của hai công nhân $A$ và $B$ trong $7$ ngày làm việc liên tục:
- Công nhân $A$: $42; quad 44; quad 45; quad 46; quad 48; quad 50; quad 52$.
- Công nhân $B$: $35; quad 40; quad 46; quad 46; quad 48; quad 52; quad 60$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Cả hai công nhân đều có số lượng kiện hàng đóng gói trung bình trong ngày bằng nhau và bằng $46.7$ kiện (làm tròn hàng phần mười).]),
    True([Trung vị số kiện hàng đóng gói mỗi ngày của hai công nhân là bằng nhau: $M_e(A) = M_e(B) = 46$ kiện.]),
    True([Mẫu số liệu của công nhân $B$ có mốt là $M_o = 46$ kiện, trong khi mẫu số liệu của công nhân $A$ không có mốt.]),
    [Năng suất lao động của công nhân $B$ ổn định và đồng đều hơn so với công nhân $A$.]
  ),
  loigiai: [
    #step([Tính số trung bình])
    $overline(x)_A = (42 + 44 + 45 + 46 + 48 + 50 + 52) / 7 = 327 / 7 approx 46.7$ kiện.

    $overline(x)_B = (35 + 40 + 46 + 46 + 48 + 52 + 60) / 7 = 327 / 7 approx 46.7$ kiện. 
    
    Mệnh đề a ĐÚNG.

    #step([Tính trung vị])
    Cả hai mẫu đều có $n = 7$ phần tử đã sắp xếp.
    $M_e(A) = 46$ và $M_e(B) = 46$. Mệnh đề b ĐÚNG.

    #step([Xác định mốt])
    Công nhân $B$ có giá trị $46$ xuất hiện $2$ lần, các giá trị khác xuất hiện $1$ lần $=> M_o(B) = 46$.
    Công nhân $A$ mỗi giá trị đều xuất hiện đúng $1$ lần nên không có mốt. Mệnh đề c ĐÚNG.

    #step([Đánh giá độ ổn định])
    Khoảng biến thiên của $A$: $R_A = 52 - 42 = 10$.
    Khoảng biến thiên của $B$: $R_B = 60 - 35 = 25$.
    Năng suất của công nhân $A$ tập trung sát giá trị trung bình hơn, ổn định hơn công nhân $B$. Mệnh đề d SAI.
  ]
)

// DS 4 (Tác động của phép biến đổi tuyến tính)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Cho mẫu số liệu điểm kiểm tra $x_1, x_2, dots, x_n$ có số trung bình là $overline(x) = 7.0$, trung vị $M_e = 7.5$ và mốt $M_o = 8.0$. Do đề bài có một câu bị nhầm lẫn dữ kiện, giáo viên quyết định cộng thêm $1.0$ điểm cho tất cả học sinh và sau đó nhân hệ số $1.2$ theo công thức quy đổi mới: $y_i = 1.2(x_i + 1.0) = 1.2 x_i + 1.2$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số trung bình của mẫu điểm số mới là $overline(y) = 1.2(7.0 + 1.0) = 9.6$ điểm.]),
    True([Trung vị của mẫu điểm số mới là $M_e(y) = 1.2(7.5 + 1.0) = 10.2$ điểm.]),
    True([Mốt của mẫu điểm số mới là $M_o(y) = 1.2(8.0 + 1.0) = 10.8$ điểm.]),
    [Thứ tự xếp hạng tương đối của các học sinh trong lớp bị thay đổi sau khi áp dụng công thức quy đổi điểm mới.]
  ),
  loigiai: [
    #step([Tính chất tuyến tính của số trung bình])
    $overline(y) = 1/n sum (1.2 x_i + 1.2) = 1.2 overline(x) + 1.2 = 1.2(7.0) + 1.2 = 8.4 + 1.2 = 9.6$. Mệnh đề a ĐÚNG.

    #step([Tính chất của trung vị])
    Vì phép biến đổi $y = 1.2 x + 1.2$ là hàm đồng biến bảo toàn thứ tự nên:
    $M_e(y) = 1.2 M_e(x) + 1.2 = 1.2(7.5) + 1.2 = 9.0 + 1.2 = 10.2$. Mệnh đề b ĐÚNG.

    #step([Tính chất của mốt])
    Giá trị xuất hiện nhiều nhất cũng được biến đổi tương ứng:
    $M_o(y) = 1.2 M_o(x) + 1.2 = 1.2(8.0) + 1.2 = 9.6 + 1.2 = 10.8$. Mệnh đề c ĐÚNG.

    #step([Thứ tự xếp hạng])
    Hàm số $f(x) = 1.2 x + 1.2$ có đạo hàm dương (đồng biến nghiêm ngặt), do đó nếu $x_i > x_j$ thì $y_i > y_j$. Thứ tự xếp hạng của học sinh không bị thay đổi. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số trung bình)
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Điểm thi môn Ngữ văn của $8$ học sinh trong một tổ học tập là:
#align(center)[
  $7.0; quad 7.5; quad 8.0; quad 8.0; quad 8.5; quad 8.5; quad 9.0; quad 9.5$
]
Tính điểm trung bình cộng của tổ học tập này.],
    [8.25],
    loigiai: [
        #step([Tính tổng điểm])
        $ S = 7.0 + 7.5 + 8.0 + 8.0 + 8.5 + 8.5 + 9.0 + 9.5 = 66.0 $
        
        #step([Tính số trung bình])
        $ overline(x) = 66.0 / 8 = 8.25 $
    ]
)

// TLN 2 (Trung vị số lẻ)
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Thời gian chờ khám bệnh (tính bằng phút) của $9$ bệnh nhân tại phòng khám đa khoa là:
#align(center)[
  $12; quad 15; quad 18; quad 20; quad 25; quad 28; quad 30; quad 35; quad 42$
]
Tìm trung vị $M_e$ của thời gian chờ khám bệnh theo đơn vị phút.],
    [25],
    loigiai: [
        #step([Xác định vị trí trung vị])
        Mẫu có $n = 9$ số đã được sắp xếp tăng dần.
        Trung vị là giá trị ở vị trí thứ $(9+1)/2 = 5$.
        
        #step([Kết luận])
        $ M_e = x_5 = 25 text(" phút") $
    ]
)

// TLN 3 (Tứ phân vị thứ nhất Q1)
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Khảo sát số giờ tự học mỗi tuần của $8$ sinh viên:
#align(center)[
  $14; quad 16; quad 18; quad 20; quad 22; quad 24; quad 26; quad 30$
]
Tính giá trị tứ phân vị thứ nhất $Q_1$ của mẫu số liệu trên.],
    [17],
    loigiai: [
        #step([Tìm trung vị Q2])
        $n = 8$, $Q_2 = (20 + 22) / 2 = 21$.
        
        #step([Tìm Q1])
        Nửa dưới gồm $4$ số: $14; 16; 18; 20$.
        Trung vị của nửa dưới là:
        $ Q_1 = (16 + 18) / 2 = 17 $
    ]
)

// TLN 4 (Tứ phân vị thứ ba Q3)
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Với cùng mẫu số liệu số giờ tự học của $8$ sinh viên ở Câu 19:
#align(center)[
  $14; quad 16; quad 18; quad 20; quad 22; quad 24; quad 26; quad 30$
]
Tính giá trị tứ phân vị thứ ba $Q_3$ của mẫu số liệu.],
    [25],
    loigiai: [
        #step([Xác định nửa trên])
        Nửa trên gồm $4$ số: $22; 24; 26; 30$.
        
        #step([Tính Q3])
        Trung vị của nửa trên là:
        $ Q_3 = (24 + 26) / 2 = 25 $
    ]
)

// TLN 5 (Mốt)
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Khảo sát số ly trà sữa bán được trong ngày của một quán giải khát theo từng loại cỡ: Cỡ nhỏ bán $25$ ly; Cỡ vừa bán $84$ ly; Cỡ lớn bán $46$ ly.
Hỏi số lượng ly bán ra của cỡ ly đóng vai trò là mốt ($M_o$) của mẫu số liệu bằng bao nhiêu ly?],
    [84],
    loigiai: [
        #step([Xác định mốt])
        Cỡ ly vừa có số lượng bán nhiều nhất ($84$ ly).
        Do đó cỡ vừa là mốt của mẫu, với tần số xuất hiện bằng $84$.
    ]
)

// TLN 6 (Làm tròn số đúng)
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 122], back-to: "sec-exercise-hub",[Một nhà trắc địa đo chiều cao ngọn đồi được kết quả $h = 345.68" m" plus.minus 0.2" m"$.
Hãy làm tròn số gần đúng $h$ theo quy tắc làm tròn theo độ chính xác.],
    [346],
    loigiai: [
        #step([Xác định hàng làm tròn])
        Độ chính xác $d = 0.2$ ở hàng phần mười.
        Theo quy tắc, hàng làm tròn là hàng đơn vị (hàng lớn hơn hàng của độ chính xác một bậc).
        
        #step([Thực hiện làm tròn])
        Chữ số hàng đơn vị là $5$, chữ số thập phân liền sau là $6 >= 5$.
        Làm tròn lên: $h approx 346" m"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (ĐỀ A: CƠ BẢN - VẬN DỤNG)!]      #v(0.6em)
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
