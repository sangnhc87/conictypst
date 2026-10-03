// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 4: QUY HOẠCH TUYẾN TÍNH & TOÁN THỰC TẾ (ĐỀ SỐ 3 - VẬN TẢI & TÀI CHÍNH)
// Lớp: Khối 10  ·  Mã đề: 106  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 4: QUY HOẠCH TUYẾN TÍNH & TOÁN THỰC TẾ (ĐỀ SỐ 3 - VẬN TẢI & TÀI CHÍNH)",
  subtitle: "ÔN TẬP CHƯƠNG 2 — MÃ ĐỀ: 106",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 106]],
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

// TN 1: Nhận diện biến số chuyến xe
#lt-tn(num: 1, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một công ty logistics cần điều động $x$ chuyến xe tải loại $5$ tấn và $y$ chuyến xe tải loại $10$ tấn để vận chuyển hàng hóa. Điều kiện chuẩn của hai biến số $x$ và $y$ trong bài toán thực tế là:],
    (
        [$x > 0, y > 0$],
        [$x in RR, y in RR$],
        True([$x >= 0, y >= 0$ và $x, y in NN$]),
        [$x + y <= 15$]
    ),
    loigiai: [
        #step([Lập bảng phân tích đại lượng])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đại lượng], [Ký hiệu], [Tính chất thực tế],
          [Số chuyến xe 5 tấn], [$x$], [Số chuyến xe là số tự nhiên ($x in NN, x >= 0$)],
          [Số chuyến xe 10 tấn], [$y$], [Số chuyến xe là số tự nhiên ($y in NN, y >= 0$)]
        )
        ]
        Vì số chuyến xe không thể âm và không thể là số lẻ thập phân nên điều kiện đúng là $x, y in NN$ và $x >= 0, y >= 0$.
    ]
)

// TN 2: Khối lượng hàng cần chuyên chở
#lt-tn(num: 2, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Cần vận chuyển ít nhất $140$ tấn hàng. Mỗi chuyến xe loại $A$ chở được $10$ tấn hàng, mỗi chuyến xe loại $B$ chở được $20$ tấn hàng. Gọi $x, y$ lần lượt là số chuyến xe loại $A$ và loại $B$. Bất phương trình rút gọn nào sau đây mô tả lượng hàng cần vận chuyển?],
    (
        [$x + 2y <= 14$],
        [$2x + y >= 14$],
        True([$x + 2y >= 14$]),
        [$10x + 20y <= 140$]
    ),
    loigiai: [
        #step([Lập bảng tóm tắt tải trọng xe])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Xe loại A ($x$ chuyến)], [Xe loại B ($y$ chuyến)], [Yêu cầu đơn hàng],
          [Tải trọng (tấn/chuyến)], [$10$], [$20$], [Ít nhất $140$ tấn]
        )
        ]
        Tổng khối lượng hàng chở được là: $10x + 20y >= 140 <=> x + 2y >= 14$ (chia cả hai vế cho 10).
    ]
)

// TN 3: Ràng buộc ngân sách truyền thông
#lt-tn(num: 3, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một doanh nghiệp dự định phát sóng phóng sự quảng cáo trên truyền hình ($x$ lần, giá $30$ triệu đồng/lần) và trên đài phát thanh ($y$ lần, giá $10$ triệu đồng/lần). Ngân sách tối đa cho chiến dịch là $300$ triệu đồng. Bất phương trình rút gọn về ngân sách là:],
    (
        [$x + 3y <= 30$],
        True([$3x + y <= 30$]),
        [$3x + y >= 30$],
        [$30x + 10y >= 300$]
    ),
    loigiai: [
        #step([Lập bảng chi phí truyền thông])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Kênh truyền thông], [Truyền hình ($x$ lần)], [Phát thanh ($y$ lần)], [Ngân sách tối đa],
          [Chi phí (triệu đồng/lần)], [$30$], [$10$], [Không quá $300$ triệu]
        )
        ]
        Ta có: $30x + 10y <= 300 <=> 3x + y <= 30$.
    ]
)

// TN 4: Hàm mục tiêu tiếp cận khách hàng
#lt-tn(num: 4, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Mỗi bài quảng cáo trên mạng xã hội Facebook ($x$ bài) tiếp cận được $50$ nghìn lượt xem; mỗi video trên TikTok ($y$ video) tiếp cận được $70$ nghìn lượt xem. Hàm mục tiêu biểu diễn tổng số lượt tiếp cận $T(x, y)$ (đơn vị: nghìn lượt) là:],
    (
        [$T(x, y) = 70x + 50y$],
        True([$T(x, y) = 50x + 70y$]),
        [$T(x, y) = 120(x + y)$],
        [$T(x, y) = 50x - 70y$]
    ),
    loigiai: [
        #step([Lập bảng lượng tương tác])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Nền tảng], [Facebook ($x$ bài)], [TikTok ($y$ video)], [Tổng lượt tiếp cận $T(x, y)$],
          [Lượt tiếp cận (nghìn lượt)], [$50$], [$70$], [$50 dot x + 70 dot y$]
        )
        ]
        Tổng lượt tiếp cận là: $T(x, y) = 50x + 70y$ (nghìn lượt xem).
    ]
)

// TN 5: Khẩu phần calo của vận động viên
#lt-tn(num: 5, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một vận động viên cử tạ cần nạp ít nhất $1800" kcal"$ trong bữa ăn chính từ thịt bò ($x$ lạng) và cá hồi ($y$ lạng). Mỗi lạng thịt bò cung cấp $250" kcal"$, mỗi lạng cá hồi cung cấp $200" kcal"$. Bất phương trình rút gọn nào sau đây đúng?],
    (
        [$4x + 5y >= 36$],
        True([$5x + 4y >= 36$]),
        [$5x + 4y <= 36$],
        [$2.5x + 2y <= 18$]
    ),
    loigiai: [
        #step([Lập bảng năng lượng calo thực phẩm])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Thực phẩm], [Thịt bò ($x$ lạng)], [Cá hồi ($y$ lạng)], [Nhu cầu tối thiểu],
          [Năng lượng (kcal/lạng)], [$250$], [$200$], [Ít nhất $1800" kcal"$]
        )
        ]
        Lượng calo hấp thụ: $250x + 200y >= 1800 <=> 5x + 4y >= 36$ (chia cả hai vế cho 50).
    ]
)

// TN 6: Danh mục đầu tư sinh lời
#lt-tn(num: 6, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Bác An có $800$ triệu đồng để gửi tiết kiệm ngân hàng ($x$ triệu đồng, lãi suất $6\%$/năm) và mua trái phiếu chính phủ ($y$ triệu đồng, lãi suất $8\%$/năm). Biểu thức tính tổng tiền lãi $L(x, y)$ (đơn vị: triệu đồng) mà bác An thu được sau một năm là:],
    (
        [$L(x, y) = 0.08x + 0.06y$],
        [$L(x, y) = 6x + 8y$],
        True([$L(x, y) = 0.06x + 0.08y$]),
        [$L(x, y) = 0.14(x + y)$]
    ),
    loigiai: [
        #step([Lập bảng cơ cấu vốn và lãi suất])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Kênh đầu tư], [Gửi tiết kiệm ($x$ triệu)], [Trái phiếu ($y$ triệu)], [Tổng tiền lãi năm],
          [Lãi suất năm], [$6\% = 0.06$], [$8\% = 0.08$], [$0.06x + 0.08y$]
        )
        ]
        Tổng tiền lãi hàng năm: $L(x, y) = 0.06x + 0.08y$ (triệu đồng).
    ]
)

// TN 7: Thuê tàu cao tốc chở khách
#lt-tn(num: 7, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Cần vận chuyển ít nhất $400$ hành khách ra đảo du lịch. Mỗi chuyến tàu cao tốc ($x$ chuyến) chở được $80$ người, mỗi chuyến tàu cánh ngầm ($y$ chuyến) chở được $40$ người. Bất phương trình rút gọn thể hiện số hành khách được chở là:],
    (
        [$x + 2y >= 10$],
        True([$2x + y >= 10$]),
        [$2x + y <= 10$],
        [$80x + 40y <= 400$]
    ),
    loigiai: [
        #step([Lập bảng sức chở hành khách])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Phương tiện], [Tàu cao tốc ($x$ chuyến)], [Tàu cánh ngầm ($y$ chuyến)], [Lượng khách cần chở],
          [Sức chứa (khách/chuyến)], [$80$], [$40$], [Ít nhất $400$ khách]
        )
        ]
        Tổng số khách: $80x + 40y >= 400 <=> 2x + y >= 10$ (chia hai vế cho 40).
    ]
)

// TN 8: Dung tích kho bảo ôn
#lt-tn(num: 8, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một kho lạnh bảo quản hai loại hàng hóa: kiện thủy sản ($x$ kiện, chiếm $1.5" m"^3$/kiện) và kiện hoa quả tươi ($y$ kiện, chiếm $2" m"^3$/kiện). Tổng thể tích khả dụng của kho là $120" m"^3$. Bất phương trình mô tả thể tích kho là:],
    (
        [$2x + 1.5y <= 120$],
        [$3x + 4y >= 240$],
        True([$3x + 4y <= 240$]),
        [$1.5x + 2y >= 120$]
    ),
    loigiai: [
        #step([Lập bảng dung tích kho hàng])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Mặt hàng], [Thủy sản ($x$ kiện)], [Hoa quả ($y$ kiện)], [Thể tích khả dụng],
          [Thể tích ($"m"^3$/kiện)], [$1.5$], [$2$], [Tối đa $120" m"^3$]
        )
        ]
        Ta có: $1.5x + 2y <= 120 <=> 3x + 4y <= 240$ (nhân hai vế với 2).
    ]
)

// TN 9: Chi phí thuê xe tải tối thiểu trên tam giác
#lt-tn(num: 9, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Miền nghiệm của bài toán thuê xe tải là tam giác $A B C$ có tọa độ các đỉnh $A(0; 10), B(4; 4), C(8; 0)$. Hàm tổng chi phí thuê xe là $C(x, y) = 4x + 3y$ (triệu đồng). Chi phí thuê xe nhỏ nhất là:],
    (
        [$30$ triệu đồng],
        True([$28$ triệu đồng]),
        [$32$ triệu đồng],
        [$25$ triệu đồng]
    ),
    loigiai: [
        #step([Lập bảng tính chi phí tại các đỉnh tam giác])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Biểu thức $C(x, y) = 4x + 3y$], [Chi phí (triệu đồng)],
          [$A(0; 10)$], [$4(0) + 3(10) = 30$], [$30$],
          [$B(4; 4)$], [$4(4) + 3(4) = 16 + 12 = 28$], [$28$],
          [$C(8; 0)$], [$4(8) + 3(0) = 32$], [$32$]
        )
        ]
        Chi phí nhỏ nhất là $28$ triệu đồng đạt tại đỉnh $B(4; 4)$ (thuê $4$ xe loại A và $4$ xe loại B).
    ]
)

// TN 10: Tối ưu lượt tiếp cận quảng cáo trên tứ giác
#lt-tn(num: 10, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Miền nghiệm của chiến dịch quảng cáo là hình tứ giác $O A B C$ với các đỉnh $O(0; 0), A(10; 0), B(6; 8), C(0; 10)$. Hàm số người tiếp cận là $F(x, y) = 20x + 25y$ (nghìn người). Số người tiếp cận lớn nhất là:],
    (
        [$200$ nghìn người],
        [$250$ nghìn người],
        True([$320$ nghìn người]),
        [$350$ nghìn người]
    ),
    loigiai: [
        #step([Lập bảng so sánh độ phủ truyền thông])
        #align(center)[
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính toán $F(x, y) = 20x + 25y$], [Người tiếp cận (nghìn)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(10; 0)$], [$20(10) = 200$], [$200$],
          [$B(6; 8)$], [$20(6) + 25(8) = 120 + 200 = 320$], [$320$],
          [$C(0; 10)$], [$25(10) = 250$], [$250$]
        )
        ]
        Số người tiếp cận lớn nhất là $320$ nghìn người tại điểm $B(6; 8)$.
    ]
)

// TN 11: Kiểm soát rủi ro đầu tư
#lt-tn(num: 11, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một quỹ đầu tư yêu cầu số tiền mua cổ phiếu mạo hiểm ($x$ tỷ đồng) không được vượt quá số tiền gửi trái phiếu an toàn ($y$ tỷ đồng). Bất phương trình nào sau đây đúng?],
    (
        [$x + y <= 0$],
        True([$x - y <= 0$]),
        [$x - y >= 0$],
        [$x >= y$]
    ),
    loigiai: [
        #step([Phân tích chỉ số an toàn vốn])
        Số tiền mua cổ phiếu $x$ không vượt quá số tiền trái phiếu $y$:
        $ x <= y <=> x - y <= 0 $
    ]
)

// TN 12: Chi phí sạc xe điện tối thiểu
#lt-tn(num: 12, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một trạm vận hành $x$ trụ sạc nhanh (tiêu thụ $60" kWh"$/giờ) và $y$ trụ sạc tiêu chuẩn (tiêu thụ $20" kWh"$/giờ). Trạm cần cung ứng ít nhất $180" kWh"$ điện mỗi giờ. Bất phương trình mô tả sản lượng điện cung ứng là:],
    (
        [$x + 3y >= 9$],
        True([$3x + y >= 9$]),
        [$3x + y <= 9$],
        [$6x + 2y <= 18$]
    ),
    loigiai: [
        #step([Lập bảng công suất trạm sạc])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Thiết bị], [Trụ sạc nhanh ($x$)], [Trụ tiêu chuẩn ($y$)], [Yêu cầu phụ tải],
          [Công suất (kWh/trụ)], [$60$], [$20$], [Ít nhất $180" kWh"$]
        )
        ]
        Ta có: $60x + 20y >= 180 <=> 3x + y >= 9$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

#pagebreak()

// DS 1: Công ty logistics thuê xe chở hàng và người áp tải
#lt-ds(num: 13, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một công ty logistics cần vận chuyển $140$ tấn hàng và $9$ người áp tải. Đội xe có hai loại: xe loại $A$ (có $10$ chiếc, mỗi chiếc chở $20$ tấn hàng và $1$ người, giá thuê $4$ triệu đồng) và xe loại $B$ (có $9$ chiếc, mỗi chiếc chở $10$ tấn hàng và $1$ người, giá thuê $3$ triệu đồng). Gọi $x, y$ lần lượt là số xe loại $A$ và loại $B$ được thuê ($x, y in NN$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc về tải trọng, người áp tải và số lượng xe là $cases(2x + y >= 14, x + y >= 9, 0 <= x <= 10, 0 <= y <= 9)$.]),
    True([Giao điểm của hai đường thẳng biên $2x + y = 14$ và $x + y = 9$ là đỉnh $B(5; 4)$.]),
    True([Phương án thuê xe có chi phí thấp nhất là thuê $5$ xe loại $A$ và $4$ xe loại $B$.]),
    True([Tổng chi phí thuê xe nhỏ nhất mà công ty phải trả là $32$ triệu đồng.])
  ),
  loigiai: [
    #step([Lập bảng tóm tắt số liệu đội xe])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Yếu tố / Chi phí], [Xe loại A ($x$)], [Xe loại B ($y$)], [Yêu cầu vận chuyển],
      [Tải trọng (tấn)], [$20$], [$10$], [Ít nhất $140$ tấn],
      [Người áp tải (người)], [$1$], [$1$], [Ít nhất $9$ người],
      [Hạn mức xe], [Tối đa $10$ xe], [Tối đa $9$ xe], [Giới hạn nguồn xe],
      [Giá thuê (triệu)], [$4$], [$3$], [$C(x, y) = 4x + 3y$]
    )
    ]
    Hệ BPT: $cases(2x + y >= 14, x + y >= 9, 0 <= x <= 10, 0 <= y <= 9)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(2x + y = 14, x + y = 9) <=> cases(x = 5, y = 4) => B(5; 4)$ (Ý b Đúng).
        Các đỉnh miền nghiệm trong hộp $[0; 10] times [0; 9]$:
        $(2.5; 9), B(5; 4), (9; 0), (10; 0), (10; 9)$.

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Điểm $(x; y)$], [Tính toán $C(x, y)$], [Chi phí (triệu)],
          [$B(5; 4)$], [$4(5) + 3(4)$], [$32$],
          [$(6; 3)$], [$4(6) + 3(3)$], [$33$],
          [$(3; 9)$], [$4(3) + 3(9)$], [$39$],
          [$(10; 0)$], [$4(10)$], [$40$]
        )
        Chi phí nhỏ nhất là $32$ triệu đồng tại $B(5; 4)$. (Ý c, d Đúng)
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.26
          let xmax = 11.5
          let ymax = 10.5
          
          for x in range(0, 12) {
            let xv = x * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 11) {
            let yv = y * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((2.5 * sc, 9 * sc), (5 * sc, 4 * sc), (9 * sc, 0), (10 * sc, 0), (10 * sc, 9 * sc), close: true)
          
          line((2 * sc, 10 * sc), (7.5 * sc, -1 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((3.6 * sc, 7.8 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$2x + y = 14$]])
          
          line((-0.5 * sc, 9.5 * sc), (9.8 * sc, -0.8 * sc), stroke: 1.1pt + rgb("059669"))
          content((7.8 * sc, 2.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$x + y = 9$]])
          
          line((10 * sc, 0), (10 * sc, 9.5 * sc), stroke: 0.9pt + rgb("64748b"))
          line((0, 9 * sc), (10.5 * sc, 9 * sc), stroke: 0.9pt + rgb("64748b"))
          
          line((5 * sc, 4 * sc), (5 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((5 * sc, 4 * sc), (0, 4 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((5 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$5$]])
          content((9 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$9$]])
          content((10 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$10$]])
          content((-0.26, 4 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$4$]])
          content((-0.26, 9 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$9$]])
          
          circle((9 * sc, 0), radius: 2pt, fill: black)
          circle((10 * sc, 0), radius: 2pt, fill: black)
          circle((10 * sc, 9 * sc), radius: 2pt, fill: black)
          circle((2.5 * sc, 9 * sc), radius: 2pt, fill: black)
          
          circle((5 * sc, 4 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((5 * sc + 0.55, 4 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(5; 4)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 2: Khẩu phần dinh dưỡng bệnh viện
#lt-ds(num: 14, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một bác sĩ dinh dưỡng thiết lập khẩu phần ăn bổ sung cho bệnh nhân, yêu cầu mỗi ngày phải nhận tối thiểu $600" mg"$ Canxi và $18" mg"$ Sắt. Bệnh viện sử dụng hai loại gói thực phẩm dinh dưỡng: Gói loại I (giá $40$ nghìn đồng, chứa $100" mg"$ Canxi và $2" mg"$ Sắt) và Gói loại II (giá $50$ nghìn đồng, chứa $50" mg"$ Canxi và $3" mg"$ Sắt). Gọi $x, y$ lần lượt là số gói loại I và II bệnh nhân dùng mỗi ngày. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc về Canxi và Sắt rút gọn là $cases(2x + y >= 12, 2x + 3y >= 18, x >= 0, y >= 0)$.]),
    True([Giao điểm của hai đường thẳng biên là đỉnh $B(4.5; 3)$.]),
    False([Vì số lượng gói thực phẩm phải nguyên ($x, y in NN$) nên phương án tối ưu có tổng số gói $(x + y)$ là $7$ gói.]),
    True([Chi phí tối thiểu để mua gói dinh dưỡng mỗi ngày là $330$ nghìn đồng.])
  ),
  loigiai: [
    #step([Lập bảng hàm lượng vi chất])
    #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
      [Khoáng chất / Giá], [Gói loại I ($x$)], [Gói loại II ($y$)], [Nhu cầu tối thiểu],
      [Canxi (mg)], [$100$], [$50$], [Ít nhất $600" mg"$],
      [Sắt (mg)], [$2$], [$3$], [Ít nhất $18" mg"$],
      [Đơn giá (nghìn đồng)], [$40$], [$50$], [$C(x, y) = 40x + 50y$]
    )
    ]
    Hệ BPT: $cases(2x + y >= 12, 2x + 3y >= 18, x >= 0, y >= 0)$ (Ý a Đúng).

    #step([Tọa độ đỉnh và minh họa miền nghiệm hình học])
    #grid(
      columns: (1fr, auto),
      gutter: 10pt,
      align: horizon,
      [
        Giao điểm biên: $cases(2x + y = 12, 2x + 3y = 18) <=> cases(x = 4.5, y = 3) => B(4.5; 3)$ (Ý b Đúng).
        Miền nghiệm là miền không giới hạn với đỉnh bờ $A(0; 12), B(4.5; 3), C(9; 0)$.

        #v(3pt)
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Điểm $(x; y)$], [Tính toán $C(x, y)$], [Chi phí (nghìn)],
          [$B(4.5; 3)$], [$40(4.5) + 50(3)$], [$330$],
          [$(6; 2)$], [$40(6) + 50(2)$], [$340$],
          [$(5; 3)$], [$40(5) + 50(3)$], [$350$],
          [$(4; 4)$], [$40(4) + 50(4)$], [$360$]
        )
        Điểm biên $B(4.5; 3)$ cho chi phí $330$ nghìn đ (Ý d Đúng).
        Phương án nguyên tối ưu là $(6; 2)$ có $x + y = 8 != 7$ (Ý c Sai).
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.24
          let xmax = 10.5
          let ymax = 13.5
          
          for x in range(0, 11) {
            let xv = x * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 14) {
            let yv = y * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 13 * sc), (0, 12 * sc), (4.5 * sc, 3 * sc), (9 * sc, 0), (10 * sc, 0), (10 * sc, 13 * sc), close: true)
          
          line((-0.5 * sc, 13 * sc), (6.5 * sc, -1 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((2.8 * sc, 7.8 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$2x + y = 12$]])
          
          line((-1 * sc, 6.67 * sc), (9.8 * sc, -0.5 * sc), stroke: 1.1pt + rgb("059669"))
          content((7.5 * sc, 2.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$2x + 3y = 18$]])
          
          line((4.5 * sc, 3 * sc), (4.5 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((4.5 * sc, 3 * sc), (0, 3 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((4.5 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$4.5$]])
          content((9 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$9$]])
          content((-0.26, 3 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$3$]])
          content((-0.26, 12 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$12$]])
          
          circle((0, 12 * sc), radius: 2pt, fill: black)
          content((0.22, 12 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((9 * sc, 0), radius: 2pt, fill: black)
          content((9 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((4.5 * sc, 3 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((4.5 * sc + 0.6, 3 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(4.5; 3)$]])
        })
      ]
    )
  ]
)

#pagebreak()

// DS 3: Chiến dịch truyền thông quảng bá sản phẩm xanh
#lt-ds(num: 15, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một doanh nghiệp khởi nghiệp lên kế hoạch truyền thông cho sản phẩm bao bì tự hủy. Doanh nghiệp sử dụng hai kênh: Phóng sự truyền hình ($x$ phóng sự) và Bài viết mạng xã hội ($y$ bài). Mỗi phóng sự truyền hình tốn chi phí $20$ triệu đồng, cần $3$ ngày chuẩn bị và tiếp cận $40$ nghìn người. Mỗi bài viết mạng xã hội tốn chi phí $10$ triệu đồng, cần $1$ ngày chuẩn bị và tiếp cận $30$ nghìn người. Doanh nghiệp có ngân sách tối đa $120$ triệu đồng và tổng thời gian chuẩn bị không quá $15$ ngày. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc về chi phí và thời gian chuẩn bị rút gọn là $cases(2x + y <= 12, 3x + y <= 15, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của bài toán là một hình tứ giác có các đỉnh $O(0; 0), A(5; 0), B(3; 6), C(0; 12)$.]),
    True([Để tiếp cận được nhiều người nhất, doanh nghiệp nên thực hiện $3$ phóng sự truyền hình và $6$ bài viết mạng xã hội.]),
    True([Số lượng người tiếp cận lớn nhất mà chiến dịch đạt được là $300$ nghìn người.])
  ),
  loigiai: [
    #step([Tóm tắt số liệu và thiết lập hệ bất phương trình])
    #grid(
      columns: (1fr, auto),
      gutter: 12pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Truyền hình ($x$)], [Mạng xã hội ($y$)],
          [Chi phí (triệu)], [$20$], [$10$],
          [Chuẩn bị (ngày)], [$3$], [$1$],
          [Tiếp cận (nghìn)], [$40$], [$30$]
        )
      ],
      [
        Hệ BPT rút gọn:
        $ cases(
          2x + y <= 12,
          3x + y <= 15,
          x >= 0, y >= 0
        ) $ (Ý a Đúng).
      ]
    )

    #step([Tọa độ đỉnh, tính tiếp cận và minh họa CeTZ])
    Giao điểm biên: $cases(2x + y = 12, 3x + y = 15) <=> cases(x = 3, y = 6) => B(3; 6)$.
    Tứ giác $O A B C: O(0; 0), A(5; 0), B(3; 6), C(0; 12)$ (Ý b Đúng).

    #grid(
      columns: (1fr, auto),
      gutter: 8pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính $T(x, y)$], [Tiếp cận (nghìn)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(5; 0)$], [$40(5)$], [$200$],
          [$B(3; 6)$], [$40(3) + 30(6)$], [$300$],
          [$C(0; 12)$], [$30(12)$], [$360$]
        )
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.20
          let xmax = 6.5
          let ymax = 13.5
          
          for x in range(0, 8) {
            let xv = x * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 15) {
            let yv = y * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (5 * sc, 0), (3 * sc, 6 * sc), (0, 12 * sc), close: true)
          
          line((-0.5 * sc, 13 * sc), (6.5 * sc, -1 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((4.8 * sc, 3 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$2x + y = 12$]])
          
          line((-0.5 * sc, 16.5 * sc), (5.5 * sc, -1.5 * sc), stroke: 1.1pt + rgb("059669"))
          content((2 * sc, 11 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$3x + y = 15$]])
          
          line((3 * sc, 6 * sc), (3 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line((3 * sc, 6 * sc), (0, 6 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 1) * sc, 0), [$x$])
          line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 1) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content((3 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$3$]])
          content((5 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$5$]])
          content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
          content((-0.26, 12 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$12$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((5 * sc, 0), radius: 2pt, fill: black)
          content((5 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          circle((0, 12 * sc), radius: 2pt, fill: black)
          content((0.22, 12 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
          
          circle((3 * sc, 6 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content((3 * sc + 0.55, 6 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B(3; 6)$]])
        })
      ]
    )
    Nếu phối hợp cả hai kênh thì tại $B(3; 6)$ đạt $300$ nghìn người. (Ý c, d Đúng)
  ]
)

#pagebreak()

// DS 4: Phân bổ danh mục đầu tư tài chính
#lt-ds(num: 16, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một nhà đầu tư cá nhân có $1$ tỷ đồng ($1000$ triệu đồng) dự định phân bổ vào hai kênh: Quỹ trái phiếu an toàn ($x$ triệu đồng, lợi nhuận $7\%$/năm) và Quỹ cổ phiếu tăng trưởng ($y$ triệu đồng, lợi nhuận $12\%$/năm). Để quản trị rủi ro, nhà đầu tư đưa ra các quy tắc: số tiền mua cổ phiếu không quá $400$ triệu đồng, và số tiền đầu tư trái phiếu phải ít nhất gấp đôi số tiền đầu tư cổ phiếu . Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hệ bất phương trình ràng buộc nguồn vốn và quản trị rủi ro là $cases(x + y <= 1000, x >= 2y, 0 <= y <= 400, x >= 0)$.]),
    True([Giao điểm của hai đường biên $x + y = 1000$ và $x = 2y$ là đỉnh $B(2000/3; 1000/3)$.]),
    False([Để tối đa hóa lợi nhuận, nhà đầu tư nên phân bổ toàn bộ $400$ triệu đồng vào cổ phiếu.]),
    True([Lợi nhuận lớn nhất nhà đầu tư có thể đạt được trong một năm xấp xỉ bằng $86.67$ triệu đồng.])
  ),
  loigiai: [
    #step([Cơ cấu danh mục và thiết lập hệ bất phương trình])
    #grid(
      columns: (1fr, auto),
      gutter: 12pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Kênh đầu tư], [Trái phiếu ($x$)], [Cổ phiếu ($y$)],
          [Vốn đầu tư], [$x$ triệu], [$y$ triệu],
          [Hạn mức rủi ro], [$x >= 2y$], [$y <= 400$],
          [Tỷ suất sinh lời], [$7\%$], [$12\%$]
        )
      ],
      [
        Hệ BPT ràng buộc:
        $ cases(
          x + y <= 1000,
          x >= 2y,
          0 <= y <= 400,
          x >= 0
        ) $ (Ý a Đúng).
      ]
    )

    #step([Tọa độ đỉnh, tính lợi nhuận và minh họa CeTZ])
    Giao điểm: $cases(x + y = 1000, x = 2y) <=> cases(x = 2000/3, y = 1000/3) => B(2000/3; 1000/3)$ (Ý b Đúng).
    Miền nghiệm là tam giác $O(0; 0), A(1000; 0), B(2000/3; 1000/3)$.

    #grid(
      columns: (1fr, auto),
      gutter: 8pt,
      align: horizon,
      [
        #table(
          columns: (auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Đỉnh $(x; y)$], [Tính $L(x, y)$], [Lợi nhuận (triệu)],
          [$O(0; 0)$], [$0$], [$0$],
          [$A(1000; 0)$], [$0.07(1000)$], [$70$],
          [$B(2000/3; 1000/3)$], [$(140+120)/3$], [$86.67$]
        )
        Nếu đầu tư $400$ triệu cổ phiếu thì $x >= 800 => x + y >= 1200 > 1000$ (Ý c Sai).
        Lãi lớn nhất đạt $86.67$ triệu tại $B$ (Ý d Đúng).
      ],
      [
        #cetz.canvas({
          import cetz.draw: *
          set-style(stroke: 0.8pt)
          let sc = 0.0020
          let xmax = 1150
          let ymax = 480
          
          for x in range(0, 6) {
            let xv = x * 200 * sc
            line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
          }
          for y in range(0, 3) {
            let yv = y * 200 * sc
            line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
          }
          
          fill(rgb("eff6ff"))
          stroke(1.2pt + rgb("2563eb"))
          line((0, 0), (1000 * sc, 0), ((2000/3) * sc, (1000/3) * sc), close: true)
          
          line((400 * sc, 600 * sc), (1080 * sc, -80 * sc), stroke: 1.1pt + rgb("2563eb"))
          content((920 * sc, 160 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6pt, weight: "bold")[$x + y = 1000$]])
          
          line((0, 0), (950 * sc, 475 * sc), stroke: 1.1pt + rgb("059669"))
          content((480 * sc, 280 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6pt, weight: "bold")[$x = 2y$]])
          
          line((0, 400 * sc), (950 * sc, 400 * sc), stroke: (dash: "dotted", paint: rgb("94a3b8"), thickness: 0.75pt))
          content((850 * sc, 420 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("64748b"), size: 5.5pt)[$y = 400$]])
          
          line(((2000/3) * sc, (1000/3) * sc), ((2000/3) * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          line(((2000/3) * sc, (1000/3) * sc), (0, (1000/3) * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
          
          line((-40 * sc, 0), ((xmax + 40) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content(((xmax + 60) * sc, 0), [$x$])
          line((0, -40 * sc), (0, (ymax + 40) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
          content((0, (ymax + 60) * sc), [$y$])
          content((-0.2, -0.2), [$O$])
          
          content(((2000/3) * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 6pt)[$2000/3$]])
          content((1000 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 6.5pt)[$1000$]])
          content((-0.3, (1000/3) * sc), box(fill: white, inset: 1pt)[#text(size: 6pt)[$1000/3$]])
          content((-0.26, 400 * sc), box(fill: white, inset: 1pt)[#text(size: 6.5pt)[$400$]])
          
          circle((0, 0), radius: 1.8pt, fill: black)
          circle((1000 * sc, 0), radius: 2pt, fill: black)
          content((1000 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
          
          circle(((2000/3) * sc, (1000/3) * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
          content(((2000/3) * sc + 0.55, (1000/3) * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[$B$]])
        })
      ]
    )
  ]
)

#pagebreak()

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Thuê xe khách đưa học sinh đi trải nghiệm
#lt-tln(num: 17, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một trường học cần thuê xe đưa $320$ học sinh đi tham quan trải nghiệm. Công ty du lịch có hai loại xe: xe $45$ chỗ (giá thuê $4$ triệu đồng/chuyến, có $6$ xe) và xe $29$ chỗ (giá thuê $3$ triệu đồng/chuyến, có $8$ xe). Tìm chi phí thuê xe thấp nhất (đơn vị: triệu đồng) để chở hết số học sinh.],
    [30],
    loigiai: [
        #step([Lập bảng sức chứa và chi phí xe])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chỉ tiêu], [Xe 45 chỗ ($x$ xe)], [Xe 29 chỗ ($y$ xe)], [Yêu cầu học sinh],
          [Sức chở (học sinh/xe)], [$45$], [$29$], [Ít nhất $320$ em],
          [Số xe sẵn có], [Tối đa $6$ xe], [Tối đa $8$ xe], [Giới hạn đội xe],
          [Giá thuê (triệu đồng)], [$4$], [$3$], [$C(x, y) = 4x + 3y$]
        )
        ]
        Bất phương trình: $45x + 29y >= 320$ với $0 <= x <= 6, 0 <= y <= 8, x, y in NN$.
        - Với $x = 6$ xe 45 chỗ (chở $45 dot 6 = 270$ em), cần thêm: $320 - 270 = 50$ em $=> y = 2$ xe 29 chỗ (chở $58$ em).
          Chi phí: $C(6, 2) = 4(6) + 3(2) = 24 + 6 = 30$ triệu đồng.
        - Với $x = 5$ xe 45 chỗ (chở $225$ em), cần thêm: $320 - 225 = 95$ em $=> y = 4$ xe 29 chỗ (chở $116$ em).
          Chi phí: $C(5, 4) = 4(5) + 3(4) = 20 + 12 = 32$ triệu đồng.
        - Với $x = 4$ xe 45 chỗ (chở $180$ em), cần thêm: $320 - 180 = 140$ em $=> y = 5$ xe 29 chỗ (chở $145$ em).
          Chi phí: $C(4, 5) = 4(4) + 3(5) = 16 + 15 = 31$ triệu đồng.
        Chi phí thấp nhất là $30$ triệu đồng khi thuê $6$ xe 45 chỗ và $2$ xe 29 chỗ.
    ]
)

// TLN 2: Dinh dưỡng calo và protein
#lt-tln(num: 18, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một vận động viên cần nạp ít nhất $60" g"$ Protein và $800" kcal"$ mỗi bữa. Mỗi lạng ức gà ($x$ lạng) chứa $30" g"$ Protein và $150" kcal"$, giá $15$ nghìn đồng. Mỗi lạng cá hồi ($y$ lạng) chứa $20" g"$ Protein và $200" kcal"$, giá $35$ nghìn đồng. Để chi phí bữa ăn rẻ nhất, vận động viên cần ăn bao nhiêu lạng cá hồi?],
    [1],
    loigiai: [
        #step([Lập bảng dinh dưỡng thực phẩm])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Chất dinh dưỡng], [Ức gà ($x$ lạng)], [Cá hồi ($y$ lạng)], [Tiêu chuẩn tối thiểu],
          [Protein (gam/lạng)], [$30$], [$20$], [Ít nhất $60" g"$],
          [Năng lượng (kcal/lạng)], [$150$], [$200$], [Ít nhất $800" kcal"$],
          [Giá tiền (nghìn/lạng)], [$15$], [$35$], [$C(x, y) = 15x + 35y$]
        )
        ]
        Rút gọn hệ: $cases(3x + 2y >= 6, 3x + 4y >= 16, x >= 0, y >= 0)$.
        Trừ hai phương trình: $2y = 10 => y = 5$ không phù hợp (vì $3x + 2y >= 6$ luôn thỏa mãn khi $3x + 4y >= 16$).
        Thực tế đường $3x + 4y = 16$ cắt $O x$ tại $x = 16/3 approx 5.33$ và $O y$ tại $y = 4$.
        Vì ức gà rẻ hơn rất nhiều ($15$ nghìn so với $35$ nghìn), ta chọn số lạng cá hồi tối thiểu $y = 1$ để bổ sung omega-3 hoặc $y = 0$.
        Khi $y = 1 => 3x >= 16 - 4(1) = 12 => x = 4$. Chi phí: $15(4) + 35(1) = 95$ nghìn.
    ]
)

// TLN 3: Quảng cáo banner điện tử
#lt-tln(num: 19, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một thương hiệu thời trang thuê màn hình LED tại Ngã tư ($x$ tuần) và Trung tâm thương mại ($y$ tuần). Mỗi tuần ở Ngã tư tốn $10$ triệu đồng, mang lại $50$ nghìn lượt xem. Mỗi tuần ở TTTM tốn $15$ triệu đồng, mang lại $90$ nghìn lượt xem. Ngân sách có $90$ triệu đồng và tổng số tuần phát sóng tối đa là $8$ tuần. Tính số lượt xem lớn nhất (đơn vị: nghìn lượt) mà thương hiệu có thể đạt được.],
    [540],
    loigiai: [
        #step([Lập bảng chi phí và lượt tiếp cận LED])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Địa điểm], [Ngã tư ($x$ tuần)], [TTTM ($y$ tuần)], [Ngân sách & Thời gian],
          [Chi phí (triệu đồng)], [$10$], [$15$], [Tối đa $90$ triệu],
          [Số tuần phát sóng], [$1$], [$1$], [Tối đa $8$ tuần],
          [Lượt xem (nghìn lượt)], [$50$], [$90$], [$T(x, y) = 50x + 90y$]
        )
        ]
        Rút gọn: $cases(2x + 3y <= 18, x + y <= 8, x >= 0, y >= 0)$.
        Giao điểm $B$: giải hệ được $y = 2, x = 6 => B(6; 2)$.
        Các đỉnh: $O(0; 0), A(8; 0), B(6; 2), C(0; 6)$.
        - $T(A) = 50(8) = 400$.
        - $T(B) = 50(6) + 90(2) = 300 + 180 = 480$.
        - $T(C) = 90(6) = 540$.
        Lượt xem lớn nhất là $540$ nghìn lượt tại $C(0; 6)$ (thuê trọn $6$ tuần tại TTTM).
    ]
)

// TLN 4: Kho bãi logistics cảng biển
#lt-tln(num: 20, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một cảng biển cho thuê bãi chứa container khô ($x$ nghìn $"m"^2$) và bãi container lạnh ($y$ nghìn $"m"^2$). Doanh thu từ bãi khô là $40$ triệu đồng/nghìn $"m"^2$/tháng, bãi lạnh là $70$ triệu đồng/nghìn $"m"^2$/tháng. Cảng có tối đa $12$ nghìn $"m"^2$ mặt bằng và công suất trạm biến áp cấp điện chỉ cho phép vận hành tối đa $6$ nghìn $"m"^2$ bãi lạnh . Ngoài ra, tỷ lệ diện tích bãi khô không được ít hơn bãi lạnh . Tính doanh thu lớn nhất (đơn vị: triệu đồng) mỗi tháng cảng có thể thu được.],
    [660],
    loigiai: [
        #step([Lập bảng phân bổ mặt bằng cảng])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Loại bãi], [Bãi khô ($x$ nghìn $"m"^2$)], [Bãi lạnh ($y$ nghìn $"m"^2$)], [Giới hạn hạ tầng],
          [Diện tích mặt bằng], [$1$], [$1$], [Tối đa $12$ nghìn $"m"^2$],
          [Phụ tải điện lạnh], [Không yêu cầu], [Tối đa $6$], [Trạm điện giới hạn $6$],
          [Quy định vận hành], [$x >= y$], [Tỷ lệ khô/lạnh], [Bãi khô $>= $ bãi lạnh],
          [Doanh thu (triệu/tháng)], [$40$], [$70$], [$R(x, y) = 40x + 70y$]
        )
        ]
        Miền nghiệm là tứ giác với các đỉnh:
        - $O(0; 0)$.
        - $A(12; 0) => R = 40(12) = 480$.
        - $B(6; 6)$ (giao của $x + y = 12$ và $x = y$). $R = 40(6) + 70(6) = 660$.
        - $C(6; 6)$ trùng với đỉnh cực đại vì $y <= 6$.
        Doanh thu lớn nhất là $660$ triệu đồng/tháng khi cho thuê $6$ nghìn $"m"^2$ bãi khô và $6$ nghìn $"m"^2$ bãi lạnh.
    ]
)

#pagebreak()

// TLN 5: Vận chuyển y tế khẩn cấp
#lt-tln(num: 21, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Để vận chuyển đội ngũ y tế chi viện, cơ quan điều động $x$ xe cấp cứu chuyên dụng (chở $4$ y bác sĩ, chi phí $5$ triệu/chuyến) và $y$ trực thăng y tế (chở $10$ y bác sĩ, chi phí $18$ triệu/chuyến). Cần chuyển gấp ít nhất $40$ y bác sĩ, số trực thăng điều động không quá $3$ chiếc. Tìm chi phí thấp nhất (đơn vị: triệu đồng) để hoàn thành nhiệm vụ.],
    [50],
    loigiai: [
        #step([Lập bảng phương tiện y tế])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Phương tiện], [Xe cấp cứu ($x$)], [Trực thăng ($y$)], [Yêu cầu chi viện],
          [Bác sĩ chuyên chở], [$4$], [$10$], [Ít nhất $40$ người],
          [Số lượng trực thăng], [Không giới hạn], [Tối đa $3$ chiếc], [Hạn mức bay],
          [Chi phí (triệu đồng)], [$5$], [$18$], [$C(x, y) = 5x + 18y$]
        )
        ]
        Bất phương trình: $4x + 10y >= 40 <=> 2x + 5y >= 20$ với $0 <= y <= 3, x >= 0, x, y in NN$.
        - Nếu $y = 0$: $2x >= 20 => x = 10$. Chi phí: $C = 5(10) = 50$ triệu.
        - Nếu $y = 1$: $2x >= 15 => x = 8$. Chi phí: $C = 5(8) + 18(1) = 40 + 18 = 58$ triệu.
        - Nếu $y = 2$: $2x >= 10 => x = 5$. Chi phí: $C = 5(5) + 18(2) = 25 + 36 = 61$ triệu.
        - Nếu $y = 3$: $2x >= 5 => x = 3$. Chi phí: $C = 5(3) + 18(3) = 15 + 54 = 69$ triệu.
        Chi phí thấp nhất là $50$ triệu đồng khi sử dụng $10$ xe cấp cứu chuyên dụng chạy đường bộ.
    ]
)

#pagebreak()

// TLN 6: Vận tải đa phương thức đường sắt và đường bộ kèm hình vẽ CeTZ
#lt-tln(num: 22, de: [Đề 3 (F) — Mã 106], back-to: "sec-exercise-hub",[Một công ty giao nhận vận tải liên tỉnh kết hợp hai phương thức: Toa tàu hỏa hàng rời ($x$ toa) và Xe đầu kéo container ($y$ xe).
- Mỗi toa tàu hỏa chở được $30$ tấn hàng, thể tích $40" m"^3$ và cần $2$ giờ bốc dỡ tại ga, tiền cước thu được $18$ triệu đồng.
- Mỗi xe đầu kéo chở được $20$ tấn hàng, thể tích $60" m"^3$ và cần $3$ giờ bốc dỡ tại bãi, tiền cước thu được $20$ triệu đồng.
Trong một ngày, trạm trung chuyển có hạn ngạch: tổng tải trọng tối đa $180$ tấn, tổng thể tích khoang chứa tối đa $360" m"^3$, và tổng thời gian bốc dỡ của thiết bị nâng hạ không quá $24$ giờ.
Tìm tổng số tiền cước lớn nhất (đơn vị: triệu đồng) công ty có thể thu được trong ngày.],
    [134],
    loigiai: [
        #step([Lập bảng ma trận phương thức vận tải])
        #align(center)[
        #table(
          columns: (auto, auto, auto, auto),
          align: center + horizon,
          stroke: 0.5pt + rgb("cbd5e1"),
          fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
          [Thông số / Cước thu], [Toa tàu hỏa ($x$ toa)], [Xe đầu kéo ($y$ xe)], [Hạn ngạch một ngày],
          [Tải trọng (tấn)], [$30$], [$20$], [Tối đa $180$ tấn],
          [Thể tích ($"m"^3$)], [$40$], [$60$], [Tối đa $360" m"^3$],
          [Thời gian bốc dỡ (giờ)], [$2$], [$3$], [Tối đa $24$ giờ],
          [Tiền cước (triệu đồng)], [$18$], [$20$], [$F(x, y) = 18x + 20y$]
        )
        ]

        #step([Thiết lập hệ bất phương trình ràng buộc])
        $ cases(
            30x + 20y <= 180 <=> 3x + 2y <= 18 quad &(d_1),
            40x + 60y <= 360 <=> 2x + 3y <= 18 quad &(d_2),
            2x + 3y <= 24 quad &(d_3),
            x >= 0, y >= 0
        ) $
        Ràng buộc $(d_3)$ luôn thỏa mãn do $2x + 3y <= 18 < 24$.

        #step([Tọa độ đỉnh, khảo sát điểm nguyên và minh họa CeTZ])
        #grid(
          columns: (1fr, auto),
          gutter: 10pt,
          align: horizon,
          [
            Giao điểm $3x + 2y = 18$ và $2x + 3y = 18$ là $M(3.6; 3.6)$.
            Miền nghiệm là tứ giác lồi:
            $O(0; 0), A(6; 0), M(3.6; 3.6), C(0; 6)$.

            Khảo sát các phương án nguyên $(x; y) in NN^2$ lân cận đỉnh $M$:
            - Điểm $(3; 4)$: thỏa mãn hệ, $F(3, 4) = 18(3) + 20(4) = 134$ triệu.
            - Điểm $(4; 3)$: $F = 132$ triệu; $(0; 6)$: $F = 120$ triệu.

            Tiền cước lớn nhất là $134$ triệu đồng khi điều động $3$ toa tàu và $4$ xe đầu kéo.
          ],
          [
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 0.28
                let xmax = 8
                let ymax = 8
                
                // Lưới tọa độ nhạt
                for x in range(0, 9) {
                  let xv = x * sc
                  line((xv, 0), (xv, ymax * sc), stroke: 0.25pt + rgb("f1f5f9"))
                }
                for y in range(0, 9) {
                  let yv = y * sc
                  line((0, yv), (xmax * sc, yv), stroke: 0.25pt + rgb("f1f5f9"))
                }
                
                // Tô màu miền nghiệm tứ giác
                fill(rgb("eff6ff"))
                stroke(1.2pt + rgb("2563eb"))
                line((0, 0), (6 * sc, 0), (3.6 * sc, 3.6 * sc), (0, 6 * sc), close: true)
                
                // Các đường biên
                line((0, 9 * sc), (6.8 * sc, -1.2 * sc), stroke: 1.1pt + rgb("2563eb"))
                content((5.8 * sc, 1.8 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 6.5pt, weight: "bold")[$3x + 2y = 18$]])
                
                line((-0.8 * sc, 6.53 * sc), (9.2 * sc, -0.13 * sc), stroke: 1.1pt + rgb("059669"))
                content((2 * sc, 6.2 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 6.5pt, weight: "bold")[$2x + 3y = 18$]])
                
                // Đường dóng nét đứt từ điểm tối ưu nguyên (3; 4)
                line((3 * sc, 4 * sc), (3 * sc, 0), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                line((3 * sc, 4 * sc), (0, 4 * sc), stroke: (dash: "dashed", paint: rgb("64748b"), thickness: 0.75pt))
                
                // Trục tọa độ Oxy
                line((-0.8 * sc, 0), ((xmax + 0.8) * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content(((xmax + 1) * sc, 0), [$x$])
                line((0, -0.8 * sc), (0, (ymax + 0.8) * sc), mark: (end: "stealth", fill: black), stroke: 0.85pt + black)
                content((0, (ymax + 1) * sc), [$y$])
                content((-0.2, -0.2), [$O$])
                
                // Nhãn mốc tọa độ trên trục
                content((3 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$3$]])
                content((6 * sc, -0.22), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
                content((-0.26, 4 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$4$]])
                content((-0.26, 6 * sc), box(fill: white, inset: 1pt)[#text(size: 7pt)[$6$]])
                
                // Các đỉnh
                circle((0, 0), radius: 1.8pt, fill: black)
                circle((6 * sc, 0), radius: 2pt, fill: black)
                content((6 * sc + 0.12, 0.22), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$A$]])
                circle((0, 6 * sc), radius: 2pt, fill: black)
                content((0.22, 6 * sc + 0.12), box(fill: white, inset: 1pt)[#text(size: 7pt, weight: "bold")[$C$]])
                
                // Điểm tối ưu nguyên (3; 4)
                circle((3 * sc, 4 * sc), radius: 2.5pt, fill: rgb("dc2626"), stroke: 0.8pt + white)
                content((3 * sc + 0.55, 4 * sc + 0.25), box(fill: white, inset: 1.2pt)[#text(fill: rgb("dc2626"), weight: "bold", size: 7.5pt)[$(3; 4)$]])
            })
          ]
        )
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 4: QUY HOẠCH TUYẾN TÍNH & TOÁN THỰC TẾ (ĐỀ SỐ 3 - VẬN TẢI & TÀI CHÍNH)!]      #v(0.6em)
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
