// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ĐỀ ÔN TẬP CHUYÊN ĐỀ 3G: BÀI TOÁN QUYẾT ĐỊNH KINH DOANH & QUẢN TRỊ RỦI RO BẰNG KỲ VỌNG
// Lớp: Khối 12  ·  Mã đề: 527  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

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
  title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3G: BÀI TOÁN QUYẾT ĐỊNH KINH DOANH & QUẢN TRỊ RỦI RO BẰNG KỲ VỌNG",
  subtitle: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG — MÃ ĐỀ: 527",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 527]],
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
#lt-tn(num: 1, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Trong lý thuyết ra quyết định kinh doanh trong điều kiện rủi ro, tiêu chuẩn Giá trị tiền tệ kỳ vọng ($"EMV"$ - Expected Monetary Value) của một phương án hành động được tính bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Khung định nghĩa tiêu chuẩn EMV
    rect((-3.5, -0.8), (3.5, 0.8), stroke: 1.2pt + accent, fill: accent.lighten(92%), radius: 0.15)
    content((0, 0.35), text(size: 9.5pt, weight: "bold", fill: accent, [Tiêu chuẩn giá trị tiền tệ kỳ vọng (EMV)]))
    content((0, -0.25), text(size: 9.5pt, weight: "bold", fill: rgb("1e3a8a"), [$"EMV" = sum_(j=1)^m v_(i j) dot p_j$]))
  })
]
],
    (
        [Giá trị lợi nhuận lớn nhất trong tất cả các trạng thái tự nhiên],
        True([Tổng các tích giữa kết quả tiền tệ trong mỗi trạng thái tự nhiên với xác suất xảy ra trạng thái đó]),
        [Giá trị trung bình cộng giản đơn của các kết quả tiền tệ],
        [Chênh lệch giữa kết quả lớn nhất và kết quả nhỏ nhất của phương án]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo lý thuyết ra quyết định trong Chuyên đề Toán 12:
        - Giả sử có $m$ trạng thái tự nhiên với xác suất xảy ra lần lượt là $p_1, p_2, ..., p_m$ (với $sum p_j = 1$).
        - Nếu chọn phương án hành động $A_i$, kết quả tiền tệ tương ứng với trạng thái thứ $j$ là $v_(i j)$.
        - Giá trị tiền tệ kỳ vọng của phương án $A_i$ là:
          $ "EMV"(A_i) = sum_(j=1)^m v_(i j) dot p_j $

        #step([Lời giải chi tiết])
        Do đó, $"EMV"$ chính là tổng các tích giữa kết quả tiền tệ của từng trạng thái với xác suất xảy ra trạng thái đó.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một doanh nghiệp xem xét hai phương án: Mở rộng nhà máy ($A_1$) hoặc Duy trì quy mô cũ ($A_2$). Dự báo thị trường năm tới có hai trạng thái: "Nhu cầu cao" (xác suất $p_1 = 0","6$) và "Nhu cầu thấp" (xác suất $p_2 = 0","4$). Kết quả lợi nhuận ròng (đơn vị: tỷ đồng) được cho trong bảng ma trận sau:
#align(center)[
  #table(
    columns: (1.4fr, 1.2fr, 1.2fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Phương án], [Nhu cầu cao ($p = 0","6$)], [Nhu cầu thấp ($p = 0","4$)],
    [Mở rộng ($A_1$)], [$10$ tỷ đồng], [$-2$ tỷ đồng],
    [Duy trì ($A_2$)], [$4$ tỷ đồng], [$2$ tỷ đồng]
  )
]
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu diễn so sánh EMV 2 phương án
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: accent, [EMV(A1) = 10(0,6) + (-2)(0,4)]))
    content((-1.5, -0.25), text(size: 8pt, fill: rgb("15803d"), [EMV(A1) = 6 - 0,8 = 5,2 tỷ]))
    line((0.3, -0.4), (0.3, 0.4), stroke: 0.8pt + gray)
    content((1.8, 0.15), text(size: 8.5pt, weight: "bold", fill: rgb("b45309"), [EMV(A2) = 4(0,6) + 2(0,4)]))
    content((1.8, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [EMV(A2) = 2,4 + 0,8 = 3,2 tỷ]))
  })
]
Giá trị $"EMV"$ của phương án Mở rộng nhà máy ($A_1$) và phương án tối ưu theo tiêu chuẩn $"EMV"$ lần lượt là:
],
    (
        [$"EMV"(A_1) = 4$ tỷ đồng; chọn phương án Duy trì ($A_2$)],
        [$"EMV"(A_1) = 5","2$ tỷ đồng; chọn phương án Duy trì ($A_2$)],
        True([$"EMV"(A_1) = 5","2$ tỷ đồng; chọn phương án Mở rộng ($A_1$)]),
        [$"EMV"(A_1) = 8$ tỷ đồng; chọn phương án Mở rộng ($A_1$)]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính $"EMV"$ của từng phương án:
           $ "EMV"(A_1) = 10 dot 0","6 + (-2) dot 0","4 $
           $ "EMV"(A_2) = 4 dot 0","6 + 2 dot 0","4 $
        2. Chọn phương án có $"EMV"$ lớn nhất (tối đa hóa lợi nhuận kỳ vọng).

        #step([Lời giải chi tiết])
        Ta có:
        $ "EMV"(A_1) = 6 - 0","8 = 5","2 " (tỷ đồng)" $
        $ "EMV"(A_2) = 2","4 + 0","8 = 3","2 " (tỷ đồng)" $
        Vì $"EMV"(A_1) = 5","2 > "EMV"(A_2) = 3","2$ nên phương án tối ưu là Mở rộng ($A_1$).
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Trong sơ đồ Cây quyết định (Decision Tree), các nút hình vuông ($square$) và các nút hình tròn ($circle$) lần lượt đại diện cho:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình cây quyết định
    rect((-2.5, -0.3), (-1.9, 0.3), stroke: 1.2pt + accent, fill: accent.lighten(85%))
    content((-2.2, 0), text(size: 8pt, weight: "bold", fill: accent, [1]))
    content((-2.2, -0.6), text(size: 7.5pt, [Nút quyết định]))
    
    line((-1.9, 0.15), (-0.5, 0.6), stroke: 1pt + accent)
    line((-1.9, -0.15), (-0.5, -0.6), stroke: 1pt + accent)
    
    circle((0, 0.6), radius: 0.25, stroke: 1.2pt + rgb("15803d"), fill: rgb("dcfce7"))
    content((0, 0.6), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [A]))
    content((0, 1.05), text(size: 7.5pt, [Nút biến cố]))
    
    circle((0, -0.6), radius: 0.25, stroke: 1.2pt + rgb("15803d"), fill: rgb("dcfce7"))
    content((0, -0.6), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [B]))
    
    line((0.25, 0.7), (1.5, 0.9), stroke: 0.8pt + gray)
    line((0.25, 0.5), (1.5, 0.3), stroke: 0.8pt + gray)
  })
]
],
    (
        [Nút biến cố ngẫu nhiên và nút kết thúc hành động],
        True([Nút quyết định (do người quản lý lựa chọn) và nút biến cố ngẫu nhiên (do tự nhiên quyết định)]),
        [Nút biến cố ngẫu nhiên và nút quyết định],
        [Nút bắt đầu và nút kết thúc dự án]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo quy ước chuẩn quốc tế về Cây quyết định:
        - Nút hình vuông ($square$): Nút quyết định (Decision node), nơi nhà quản lý chủ động lựa chọn một trong các nhánh hành động có thể.
        - Nút hình tròn ($circle$): Nút biến cố / sự kiện ngẫu nhiên (Chance node), nơi các nhánh biểu thị các trạng thái tự nhiên xảy ra ngẫu nhiên theo các xác suất đã biết.

        #step([Lời giải chi tiết])
        Do đó phương án đúng là: Nút quyết định và nút biến cố ngẫu nhiên.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Giá trị kỳ vọng của thông tin hoàn hảo ($"EVPI"$ - Expected Value of Perfect Information) là số tiền tối đa mà nhà quản trị sẵn sàng chi trả để có được thông tin dự báo hoàn toàn chính xác trước khi ra quyết định. Nếu gọi $"EVwPI"$ là giá trị kỳ vọng khi có thông tin hoàn hảo và $"EMV"^*$ là giá trị tiền tệ kỳ vọng tối ưu khi không có thông tin, thì công thức xác định $"EVPI"$ là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Khung công thức EVPI
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.12)
    content((0, 0.25), text(size: 9pt, weight: "bold", fill: accent, [Giá trị thông tin hoàn hảo: EVPI]))
    content((0, -0.25), text(size: 9.5pt, weight: "bold", fill: rgb("b91c1c"), [$"EVPI" = "EVwPI" - "EMV"^*$]))
  })
]
],
    (
        [$"EVPI" = "EVwPI" + "EMV"^*$],
        [$"EVPI" = frac("EVwPI", "EMV"^*)$],
        True([$"EVPI" = "EVwPI" - "EMV"^*$]),
        [$"EVPI" = "EMV"^* - "EVwPI"$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. $"EVwPI"$ (Expected Value with Perfect Information) là lợi nhuận kỳ vọng thu được nếu nhà quản lý biết trước 100% trạng thái tự nhiên sẽ xảy ra và luôn chọn hành động tốt nhất cho trạng thái đó:
           $ "EVwPI" = sum_j (max_i v_(i j)) dot p_j $
        2. $"EMV"^*$ (Expected Monetary Value) là lợi nhuận kỳ vọng lớn nhất đạt được trong điều kiện hiện tại khi chưa có thông tin bổ sung.
        3. $"EVPI"$ chính là mức gia tăng lợi nhuận kỳ vọng nhờ có thông tin hoàn hảo:
           $ "EVPI" = "EVwPI" - "EMV"^* $

        #step([Lời giải chi tiết])
        Công thức đúng là $"EVPI" = "EVwPI" - "EMV"^*$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Trong bài toán người bán báo (Newsboy Problem), một cửa hàng nhập một sản phẩm mùa vụ với giá vốn $c = 60$ nghìn đồng và bán ra với giá $p = 100$ nghìn đồng. Nếu hết ngày không bán được, sản phẩm phải thanh lý với giá $s = 20$ nghìn đồng. Chi phí do thiếu hàng (lợi nhuận bị mất đi khi thiếu một sản phẩm) $C_u$ và chi phí do thừa hàng (thiệt hại khi thừa một sản phẩm tồn kho) $C_o$ lần lượt là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa Cu và Co
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Thiếu hàng: C_u = p - c]))
    content((-1.5, -0.25), text(size: 7.5pt, [C_u = 100 - 60 = 40 nghìn]))
    line((0.1, -0.4), (0.1, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("b91c1c"), [Thừa hàng: C_o = c - s]))
    content((1.6, -0.25), text(size: 7.5pt, [C_o = 60 - 20 = 40 nghìn]))
  })
]
],
    (
        [$C_u = 60$ nghìn đồng và $C_o = 20$ nghìn đồng],
        [$C_u = 40$ nghìn đồng và $C_o = 60$ nghìn đồng],
        True([$C_u = 40$ nghìn đồng và $C_o = 40$ nghìn đồng]),
        [$C_u = 100$ nghìn đồng và $C_o = 40$ nghìn đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo mô hình tồn kho mùa vụ Newsvendor:
        - Chi phí thiếu hàng (Cost of Underage): Lợi nhuận biên bị bỏ lỡ trên mỗi đơn vị thiếu hụt:
          $ C_u = p - c $
        - Chi phí thừa hàng (Cost of Overage): Mức giảm giá trị vốn trên mỗi đơn vị tồn dư không bán được:
          $ C_o = c - s $

        #step([Lời giải chi tiết])
        Với $p = 100, c = 60, s = 20$:
        $ C_u = 100 - 60 = 40 " (nghìn đồng)" $
        $ C_o = 60 - 20 = 40 " (nghìn đồng)" $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một công ty chế tạo máy đang đứng trước $3$ phương án sản xuất linh kiện $A_1, A_2, A_3$. Lợi nhuận kỳ vọng của các phương án được tính toán là $"EMV"(A_1) = 85$ triệu đồng, $"EMV"(A_2) = 110$ triệu đồng, và $"EMV"(A_3) = 95$ triệu đồng. Nếu áp dụng tiêu chuẩn tối đa hóa lợi nhuận kỳ vọng, nhà quản trị nên chọn phương án nào và mức lợi nhuận kỳ vọng đạt được là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu đồ so sánh 3 cột phương án
    let emv_vals = (85, 110, 95)
    for i in range(3) {
      let x = -1.8 + i * 1.8
      let h = (emv_vals.at(i) - 50) / 40
      let f_c = if i == 1 { accent } else { accent.lighten(70%) }
      rect((x - 0.4, -0.6), (x + 0.4, -0.6 + h), fill: f_c, stroke: 0.8pt + accent)
      content((x, -0.85), text(size: 8pt, weight: "bold", [$A_#(i+1)$]))
      content((x, -0.6 + h + 0.2), text(size: 7.5pt, weight: "bold", fill: if i == 1 { accent } else { gray.darken(30%) }, [#str(emv_vals.at(i)) tr]))
    }
  })
]
],
    (
        [Phương án $A_1$ với lợi nhuận $85$ triệu đồng],
        True([Phương án $A_2$ với lợi nhuận $110$ triệu đồng]),
        [Phương án $A_3$ với lợi nhuận $95$ triệu đồng],
        [Có thể chọn bất kỳ phương án nào vì sai lệch không đáng kể]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tiêu chuẩn $"EMV"$ lựa chọn phương án có giá trị tiền tệ kỳ vọng lớn nhất:
        $ "EMV"^* = max {"EMV"(A_1), "EMV"(A_2), "EMV"(A_3)} $

        #step([Lời giải chi tiết])
        So sánh:
        $ "EMV"(A_2) = 110 > "EMV"(A_3) = 95 > "EMV"(A_1) = 85 $
        Do đó phương án tối ưu là $A_2$ với lợi nhuận kỳ vọng đạt $110$ triệu đồng.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Mối quan hệ giữa Tiêu chuẩn Tổn thất cơ hội kỳ vọng ($"EOL"$ - Expected Opportunity Loss) và Giá trị kỳ vọng của thông tin hoàn hảo ($"EVPI"$) tại phương án hành động tối ưu là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Khung định lý EOL = EVPI
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1.2pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.25), text(size: 9pt, weight: "bold", fill: accent, [Định lý tương đương trong lý thuyết quyết định]))
    content((0, -0.25), text(size: 9.5pt, weight: "bold", fill: rgb("15803d"), [$"EOL"_min = "EVPI"$]))
  })
]
],
    (
        [$"EOL"_min = 2 "EVPI"$],
        [$"EOL"_min = "EVwPI" - "EVPI"$],
        True([$"EOL"_min = "EVPI"$]),
        [$"EOL"_min + "EVPI" = 1$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Trong lý thuyết quyết định:
        - Tổn thất cơ hội (Regret/Opportunity Loss) của hành động $A_i$ tại trạng thái $j$ là mức chênh lệch giữa kết quả tốt nhất có thể đạt được trong trạng thái đó với kết quả thực tế của $A_i$: $R_(i j) = max_k v_(k j) - v_(i j)$.
        - Tổn thất cơ hội kỳ vọng: $"EOL"(A_i) = sum_j R_(i j) p_j = "EVwPI" - "EMV"(A_i)$.
        - Khi tối thiểu hóa $"EOL"$, phương án tối ưu mang lại $"EOL"_min = "EVwPI" - "EMV"^*$.

        #step([Lời giải chi tiết])
        Vì $"EVPI" = "EVwPI" - "EMV"^*$, nên ta luôn có đẳng thức quan trọng:
        $ "EOL"_min = "EVPI" $
        Tiêu chuẩn tối đa hóa $"EMV"$ và tiêu chuẩn tối thiểu hóa $"EOL"$ luôn dẫn đến cùng một quyết định tối ưu.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một chủ trang trại sở hữu khu nhà kho chứa nông sản trị giá $2$ tỷ đồng. Trong mùa khô hạn, xác suất xảy ra hỏa hoạn làm thiệt hại toàn bộ nhà kho là $p = 0","004$. Một công ty bảo hiểm chào bán gói bảo hiểm hỏa hoạn toàn diện trong một năm với mức phí bảo hiểm cố định là $10$ triệu đồng. Chi phí rủi ro tổn thất kỳ vọng nếu chủ trang trại *không mua* bảo hiểm bằng bao nhiêu và chênh lệch so với phí bảo hiểm là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình quyết định mua bảo hiểm
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Không bảo hiểm]))
    content((-1.5, -0.25), text(size: 7.5pt, [Tổn thất kỳ vọng: 2 tỷ . 0,004 = 8 tr]))
    line((0.1, -0.4), (0.1, 0.4), stroke: 0.8pt + gray)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Có bảo hiểm]))
    content((1.6, -0.25), text(size: 7.5pt, [Phí cố định: 10 tr (phí an tâm = 2 tr)]))
  })
]
],
    (
        [$4$ triệu đồng; thấp hơn phí bảo hiểm $6$ triệu đồng],
        True([$8$ triệu đồng; thấp hơn phí bảo hiểm $2$ triệu đồng]),
        [$10$ triệu đồng; bằng đúng phí bảo hiểm],
        [$16$ triệu đồng; cao hơn phí bảo hiểm $6$ triệu đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính tổn thất kỳ vọng khi không mua bảo hiểm:
           $ E(L) = 2000 " triệu đồng" dot 0","004 $
        2. So sánh với phí bảo hiểm phải trả $10$ triệu đồng.

        #step([Lời giải chi tiết])
        Tổn thất kỳ vọng khi không mua bảo hiểm:
        $ E(L) = 2000 dot 0","004 = 8 " (triệu đồng)" $
        Chênh lệch: Chi phí kỳ vọng ($8$ triệu đồng) thấp hơn phí bảo hiểm ($10$ triệu đồng) là $2$ triệu đồng. Khoản chênh lệch $2$ triệu này là phần phụ phí quản lý của công ty bảo hiểm và "chi phí mua sự an tâm" của người chủ trang trại ngại rủi ro.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một công ty thăm dò địa chất cân nhắc quyết định có nên tiến hành khoan thăm dò tại một mỏ khoáng sản hay không. Nếu khoan và có khoáng sản (xác suất $0","4$), công ty lãi ròng $80$ tỷ đồng. Nếu khoan mà không có khoáng sản (xác suất $0","6$), công ty chịu lỗ chi phí khoan $30$ tỷ đồng. Nếu quyết định không khoan, lợi nhuận ròng bằng $0$. Giá trị $"EMV"$ của phương án khoan thăm dò bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Nút quyết định khoan thăm dò
    rect((-2.5, -0.3), (-1.9, 0.3), stroke: 1.2pt + accent, fill: accent.lighten(85%))
    content((-2.2, 0), text(size: 8pt, weight: "bold", fill: accent, [Khoan?]))
    
    line((-1.9, 0.15), (-0.5, 0.6), stroke: 1pt + accent)
    line((-1.9, -0.15), (-0.5, -0.6), stroke: 1pt + gray)
    content((-1.2, -0.85), text(size: 7.5pt, [Không khoan: 0]))
    
    circle((0, 0.6), radius: 0.25, stroke: 1.2pt + rgb("15803d"), fill: rgb("dcfce7"))
    line((0.25, 0.75), (1.5, 1.0), stroke: 0.8pt + gray)
    content((2.2, 1.0), text(size: 7.5pt, [Có: +80 tỷ (0,4)]))
    line((0.25, 0.45), (1.5, 0.2), stroke: 0.8pt + gray)
    content((2.2, 0.2), text(size: 7.5pt, [Không: -30 tỷ (0,6)]))
  })
]
],
    (
        [$50$ tỷ đồng],
        [$20$ tỷ đồng],
        True([$14$ tỷ đồng]),
        [$-2$ tỷ đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tính giá trị tiền tệ kỳ vọng của phương án khoan:
        $ "EMV"("Khoan") = 80 dot P("Có") + (-30) dot P("Không") $

        #step([Lời giải chi tiết])
        Thay số:
        $ "EMV"("Khoan") = 80 dot 0","4 + (-30) dot 0","6 = 32 - 18 = 14 " (tỷ đồng)" $
        Vì $"EMV"("Khoan") = 14$ tỷ đồng $> 0$ (phương án không khoan), công ty nên tiến hành khoan thăm dò.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một khách sạn nhận đặt phòng trước cho một hội nghị quốc tế. Mỗi phòng cho thuê mang lại lợi nhuận $800$ nghìn đồng/đêm. Nếu khách sạn cam kết giữ phòng mà khách không đến (bỏ trống), khách sạn phải chịu chi phí cơ hội và dịch vụ là $200$ nghìn đồng/phòng. Tỷ số chi phí tới hạn (Critical fractile) $r = frac(C_u, C_u + C_o)$ trong bài toán quản trị doanh thu này bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Minh họa tỷ số tới hạn phòng khách sạn
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Tỷ số tới hạn: r = Cu / (Cu + Co)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [r = 800 / (800 + 200) = 800 / 1000 = 0,8]))
  })
]
],
    (
        [$0","2$],
        [$0","4$],
        [$0","75$],
        True([$0","8$])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Chi phí thiếu phòng (thiếu phòng để bán khi có khách hỏi): $C_u = 800$ nghìn đồng.
        2. Chi phí thừa phòng (giữ phòng nhưng không có khách ở): $C_o = 200$ nghìn đồng.
        3. Tỷ số tới hạn:
           $ r = frac(C_u, C_u + C_o) $

        #step([Lời giải chi tiết])
        Thay số:
        $ r = frac(800, 800 + 200) = frac(800, 1000) = 0","8 $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một nhà sản xuất bánh trung thu dự báo nhu cầu thị trường của một loại bánh đặc biệt có bảng phân bố xác suất như sau:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Nhu cầu (hộp)], [$1000$], [$2000$], [$3000$],
    [Xác suất], [$0","3$], [$0","5$], [$0","2$]
  )
]
Nhu cầu kỳ vọng của thị trường về loại bánh đặc biệt này bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kỳ vọng nhu cầu
    rect((-2.8, -0.5), (2.8, 0.5), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [E(X) = 1000(0,3) + 2000(0,5) + 3000(0,2) = 1900 hộp]))
  })
]
],
    (
        [$1800$ hộp],
        True([$1900$ hộp]),
        [$2000$ hộp],
        [$2100$ hộp]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Kỳ vọng của biến ngẫu nhiên nhu cầu $X$:
        $ E(X) = sum x_i p_i $

        #step([Lời giải chi tiết])
        Tính toán:
        $ E(X) = 1000 dot 0","3 + 2000 dot 0","5 + 3000 dot 0","2 = 300 + 1000 + 600 = 1900 " (hộp)" $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một nhà đầu tư có thái độ "ngại rủi ro" (Risk-averse) được lựa chọn giữa hai dự án đầu tư $X$ và $Y$ độc lập. Cả hai dự án đều có cùng mức lợi nhuận kỳ vọng là $E(X) = E(Y) = 500$ triệu đồng. Tuy nhiên, phương sai lợi nhuận của hai dự án lần lượt là $V(X) = 400$ và $V(Y) = 900$. Quyết định hợp lý của nhà đầu tư này là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // So sánh phân bố 2 dự án cùng kỳ vọng khác phương sai
    line((-3.0, -0.6), (3.0, -0.6), stroke: 1pt + gray)
    // Đường cong hẹp X (ít rủi ro)
    bezier((-1.5, -0.6), (0, 1.2), (1.5, -0.6), stroke: 1.5pt + rgb("15803d"))
    // Đường cong rộng Y (nhiều rủi ro)
    bezier((-2.5, -0.6), (0, 0.5), (2.5, -0.6), stroke: (paint: rgb("b91c1c"), dash: "dashed", thickness: 1.2pt))
    content((0, -0.85), text(size: 8pt, weight: "bold", [E(X) = E(Y) = 500]))
    content((1.8, 0.7), text(size: 7.5pt, fill: rgb("15803d"), [Dự án X: σ = 20]))
    content((2.2, 0.1), text(size: 7.5pt, fill: rgb("b91c1c"), [Dự án Y: σ = 30]))
  })
]
],
    (
        [Chọn dự án $Y$ vì phương sai lớn hơn biểu thị tiềm năng lợi nhuận đột biến cao hơn],
        True([Chọn dự án $X$ vì có cùng mức kỳ vọng nhưng mức độ phân tán rủi ro thấp hơn]),
        [Hai dự án hoàn toàn tương đương nhau nên chọn ngẫu nhiên],
        [Không chọn dự án nào vì lợi nhuận chưa đủ hấp dẫn]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Nguyên lý đánh đổi rủi ro - lợi nhuận (Risk-Return Tradeoff):
        Đối với nhà đầu tư ngại rủi ro, khi hai phương án có cùng mức sinh lời kỳ vọng $E(X) = E(Y)$, họ sẽ ưu tiên phương án có phương sai hoặc độ lệch chuẩn nhỏ hơn nhằm giảm thiểu sự bất định.

        #step([Lời giải chi tiết])
        Ở đây $V(X) = 400 < V(Y) = 900$ (tương ứng độ lệch chuẩn $sigma(X) = 20 < sigma(Y) = 30$).
        Do đó dự án $X$ có độ an toàn và ổn định cao hơn, nhà đầu tư ngại rủi ro sẽ chọn dự án $X$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một doanh nghiệp công nghệ dự định phát triển một ứng dụng trí tuệ nhân tạo (AI) mới. Doanh nghiệp đứng trước hai phương án: Phát triển phiên bản đầy đủ ($A_1$) hoặc Phát triển phiên bản rút gọn ($A_2$). Tình hình đón nhận của thị trường có ba kịch bản: "Bùng nổ" ($S_1$, xác suất $0","3$), "Vừa phải" ($S_2$, xác suất $0","5$), và "Thờ ơ" ($S_3$, xác suất $0","2$). Lợi nhuận ròng dự kiến (đơn vị: tỷ đồng) được cho trong bảng sau:
#align(center)[
  #table(
    columns: (1.4fr, 1.2fr, 1.2fr, 1.2fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Phương án], [Bùng nổ ($S_1: 0","3$)], [Vừa phải ($S_2: 0","5$)], [Thờ ơ ($S_3: 0","2$)],
    [Bản đầy đủ ($A_1$)], [$30$ tỷ đồng], [$10$ tỷ đồng], [$-10$ tỷ đồng],
    [Bản rút gọn ($A_2$)], [$15$ tỷ đồng], [$8$ tỷ đồng], [$2$ tỷ đồng]
  )
]
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình so sánh EMV và EVPI
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.6, 0.2), text(size: 8pt, weight: "bold", fill: accent, [EMV(A1) = 30(0,3) + 10(0,5) - 10(0,2)]))
    content((-1.6, -0.25), text(size: 8pt, fill: rgb("15803d"), [EMV(A1) = 12 tỷ]))
    line((0.2, -0.5), (0.2, 0.5), stroke: 0.8pt + gray)
    content((1.7, 0.2), text(size: 8pt, weight: "bold", fill: rgb("b45309"), [EMV(A2) = 15(0,3) + 8(0,5) + 2(0,2)]))
    content((1.7, -0.25), text(size: 8pt, fill: rgb("b45309"), [EMV(A2) = 8,9 tỷ]))
  })
]
],
    (
        True([Giá trị tiền tệ kỳ vọng của phương án Phát triển bản đầy đủ là $"EMV"(A_1) = 12$ tỷ đồng.]),
        True([Giá trị tiền tệ kỳ vọng của phương án Phát triển bản rút gọn là $"EMV"(A_2) = 8","9$ tỷ đồng.]),
        True([Theo tiêu chuẩn $"EMV"$, doanh nghiệp nên lựa chọn phương án Phát triển bản đầy đủ ($A_1$).]),
        False([Giá trị kỳ vọng của thông tin hoàn hảo $"EVPI"$ bằng $4$ tỷ đồng.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính $"EMV"(A_1)$ và $"EMV"(A_2)$ theo công thức kỳ vọng.
        2. So sánh tìm phương án tối ưu $"EMV"^* = max{"EMV"(A_1), "EMV"(A_2)}$.
        3. Tính $"EVwPI"$ bằng cách chọn kết quả lớn nhất trong từng cột trạng thái nhân với xác suất tương ứng.
        4. Tính $"EVPI" = "EVwPI" - "EMV"^*$.

        #step([Phân tích ý a])
        $ "EMV"(A_1) = 30 dot 0","3 + 10 dot 0","5 + (-10) dot 0","2 = 9 + 5 - 2 = 12 " (tỷ đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ "EMV"(A_2) = 15 dot 0","3 + 8 dot 0","5 + 2 dot 0","2 = 4","5 + 4 + 0","4 = 8","9 " (tỷ đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Vì $"EMV"(A_1) = 12 > "EMV"(A_2) = 8","9$ nên theo tiêu chuẩn $"EMV"$, chọn phương án $A_1$.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tính $"EVwPI"$:
        - Nếu $S_1$ (Bùng nổ): Chọn $A_1$ được $30$ tỷ.
        - Nếu $S_2$ (Vừa phải): Chọn $A_1$ được $10$ tỷ.
        - Nếu $S_3$ (Thờ ơ): Chọn $A_2$ được $2$ tỷ.
        $ "EVwPI" = 30 dot 0","3 + 10 dot 0","5 + 2 dot 0","2 = 9 + 5 + 0","4 = 14","4 " (tỷ đồng)" $
        $ "EVPI" = "EVwPI" - "EMV"^* = 14","4 - 12 = 2","4 " (tỷ đồng)" $
        Do đó khẳng định $"EVPI" = 4$ tỷ đồng là sai.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một công ty dược phẩm đang phân tích dự án nghiên cứu một loại thuốc điều trị mới bằng Cây quyết định qua hai giai đoạn:
- *Giai đoạn 1*: Công ty phải quyết định có chi $10$ tỷ đồng cho nghiên cứu thử nghiệm tiền lâm sàng hay không. Xác suất thử nghiệm thành công là $p = 0","6$. Nếu thử nghiệm thất bại (xác suất $0","4$), dự án dừng lại và mất $10$ tỷ đồng.
- *Giai đoạn 2*: Nếu thử nghiệm thành công, công ty có quyền quyết định sản xuất thương mại hoặc bán lại bằng sáng chế:
  + Nếu bán lại bằng sáng chế ngay, công ty thu về lợi nhuận ròng chắc chắn là $25$ tỷ đồng (chưa trừ $10$ tỷ chi phí giai đoạn 1).
  + Nếu tự sản xuất thương mại, lợi nhuận ròng thu được phụ thuộc vào dung lượng thị trường: "Thị trường lớn" (xác suất $0","7$, lợi nhuận $60$ tỷ đồng) hoặc "Thị trường nhỏ" (xác suất $0","3$, lợi nhuận $10$ tỷ đồng) (chưa trừ chi phí giai đoạn 1).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ cây quyết định đa giai đoạn
    rect((-3.0, -0.3), (-2.4, 0.3), stroke: 1pt + accent, fill: accent.lighten(85%))
    content((-2.7, 0), text(size: 7.5pt, weight: "bold", [Nút 1]))
    
    line((-2.4, 0.15), (-1.2, 0.6), stroke: 1pt + accent)
    content((-1.8, 0.65), text(size: 7pt, [Nghiên cứu]))
    line((-2.4, -0.15), (-1.2, -0.6), stroke: 1pt + gray)
    content((-1.8, -0.65), text(size: 7pt, [Không: 0]))
    
    circle((-0.9, 0.6), radius: 0.25, stroke: 1pt + rgb("15803d"), fill: rgb("dcfce7"))
    line((-0.65, 0.75), (0.2, 1.0), stroke: 0.8pt + accent)
    content((-0.2, 1.15), text(size: 7pt, [TC: 0,6]))
    line((-0.65, 0.45), (0.2, 0.2), stroke: 0.8pt + gray)
    content((-0.2, 0.15), text(size: 7pt, [TB: -10]))
    
    rect((0.2, 0.8), (0.7, 1.2), stroke: 1pt + accent, fill: accent.lighten(85%))
    content((0.45, 1.0), text(size: 7pt, weight: "bold", [Nút 2]))
    
    line((0.7, 1.15), (1.8, 1.4), stroke: 0.8pt + rgb("15803d"))
    content((2.5, 1.4), text(size: 7pt, [SX thương mại]))
    line((0.7, 0.85), (1.8, 0.6), stroke: 0.8pt + gray)
    content((2.5, 0.6), text(size: 7pt, [Bán sáng chế: 25]))
  })
]
],
    (
        True([Tại Giai đoạn 2, nếu tự sản xuất thương mại thì lợi nhuận kỳ vọng là $45$ tỷ đồng.]),
        True([Tại nút quyết định ở Giai đoạn 2, công ty nên chọn phương án tự sản xuất thương mại thay vì bán bằng sáng chế.]),
        True([Giá trị tiền tệ kỳ vọng của toàn bộ dự án nghiên cứu thuốc tại thời điểm bắt đầu là $"EMV" = 17$ tỷ đồng.]),
        False([Vì rủi ro thử nghiệm thất bại lên tới $40%$, công ty nên hủy dự án ngay từ đầu để tránh rủi ro.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Sử dụng phương pháp quy nạp ngược (Rollback / Backward Induction) trên cây quyết định:
        1. Giải quyết từ các nút ở giai đoạn cuối (Giai đoạn 2).
        2. Đưa giá trị tối ưu tại Giai đoạn 2 về làm kết quả tại nút sự kiện Giai đoạn 1.
        3. Tính toán $"EMV"$ tổng thể và đưa ra quyết định ở Nút 1.

        #step([Phân tích ý a])
        Nếu tự sản xuất thương mại:
        $ E = 60 dot 0","7 + 10 dot 0","3 = 42 + 3 = 45 " (tỷ đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tại Nút 2:
        - Tự sản xuất thương mại mang lại kỳ vọng $45$ tỷ đồng.
        - Bán bằng sáng chế chỉ mang lại chắc chắn $25$ tỷ đồng.
        Vì $45 > 25$, công ty tối ưu hóa bằng cách chọn Tự sản xuất thương mại.
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Tại Nút sự kiện Giai đoạn 1:
        - Thành công ($p = 0","6$): Nhận giá trị tối ưu của Giai đoạn 2 là $+45$ tỷ, trừ $10$ tỷ chi phí nghiên cứu còn $+35$ tỷ.
        - Thất bại ($p = 0","4$): Mất $10$ tỷ chi phí nghiên cứu ($-10$ tỷ).
        Giá trị kỳ vọng của dự án tại điểm xuất phát:
        $ "EMV" = 35 dot 0","6 + (-10) dot 0","4 = 21 - 4 = 17 " (tỷ đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Vì $"EMV" = 17$ tỷ đồng $> 0$ (so với không làm gì có lợi nhuận bằng $0$), công ty hoàn toàn nên đầu tư nghiên cứu.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một quầy hoa tươi cao cấp nhập hoa tulip từ Hà Lan bán trong dịp lễ 8/3. Giá nhập vốn một bó hoa tulip là $c = 150$ nghìn đồng, giá bán niêm yết trong dịp lễ là $p = 350$ nghìn đồng. Hết đợt lễ, những bó hoa còn ế chỉ có thể bán thanh lý cho cơ sở làm hoa khô với giá $s = 50$ nghìn đồng. Nhu cầu thị trường $X$ (số bó hoa) được ước tính theo bảng phân bố xác suất:
#align(center)[
  #table(
    columns: (1.2fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Nhu cầu $X$ (bó)], [$100$], [$200$], [$300$],
    [Xác suất], [$0","2$], [$0","5$], [$0","3$]
  )
]
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Bảng phân bổ lợi nhuận theo mức đặt hàng
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [Lãi thiếu hàng: Cu = 200 nghìn]))
    content((-1.5, -0.25), text(size: 8pt, weight: "bold", fill: rgb("b91c1c"), [Lỗ thừa hàng: Co = 100 nghìn]))
    line((0.3, -0.4), (0.3, 0.4), stroke: 0.8pt + gray)
    content((1.8, 0.15), text(size: 8pt, fill: accent, [Tỷ số tới hạn]))
    content((1.8, -0.25), text(size: 8pt, weight: "bold", fill: accent, [r = 200 / 300 ≈ 0,667]))
  })
]
],
    (
        True([Chi phí thiếu hàng là $C_u = 200$ nghìn đồng và chi phí thừa hàng là $C_o = 100$ nghìn đồng.]),
        True([Tỷ số chi phí tới hạn để xác định mức đặt hàng tối ưu là $r = frac(C_u, C_u + C_o) = frac(2, 3) approx 0","667$.]),
        True([Nếu chủ quầy nhập đúng $100$ bó hoa thì lợi nhuận thu được chắc chắn là $20$ triệu đồng.]),
        False([Nếu chủ quầy nhập $200$ bó hoa thì lợi nhuận kỳ vọng thu được là $40$ triệu đồng.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính $C_u = p - c$ và $C_o = c - s$.
        2. Tỷ số tới hạn: $r = frac(C_u, C_u + C_o)$.
        3. Lợi nhuận khi nhập $Q$ đơn vị và nhu cầu thực tế là $X$:
           $ pi(Q, X) = p dot min(Q, X) + s dot max(0, Q - X) - c dot Q $
        4. Tính lợi nhuận kỳ vọng $E[pi(Q)]$.

        #step([Phân tích ý a])
        $ C_u = p - c = 350 - 150 = 200 " (nghìn đồng)" $
        $ C_o = c - s = 150 - 50 = 100 " (nghìn đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        $ r = frac(C_u, C_u + C_o) = frac(200, 200 + 100) = frac(200, 300) = frac(2, 3) approx 0","667 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Vì nhu cầu tối thiểu luôn là $100$ bó (với $P(X >= 100) = 1$), nếu nhập $Q = 100$ bó thì cả 100 bó đều bán hết với giá 350 nghìn:
        $ pi = 100 dot (350 - 150) = 20000 " nghìn đồng" = 20 " triệu đồng" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Nếu nhập $Q = 200$ bó:
        - Nếu $X = 100$ ($p = 0","2$): Bán 100 bó giá 350 nghìn, thanh lý 100 bó giá 50 nghìn, chi phí $200 dot 150$:
          $ pi = 100 dot 350 + 100 dot 50 - 200 dot 150 = 35000 + 5000 - 30000 = 10000 " nghìn" = 10 " triệu" $
        - Nếu $X = 200$ ($p = 0","5$): Bán hết 200 bó:
          $ pi = 200 dot (350 - 150) = 40000 " nghìn" = 40 " triệu" $
        - Nếu $X = 300$ ($p = 0","3$): Bán hết 200 bó: $pi = 40 " triệu"$.
        Lợi nhuận kỳ vọng:
        $ E[pi(200)] = 10 dot 0","2 + 40 dot 0","5 + 40 dot 0","3 = 2 + 20 + 12 = 34 " (triệu đồng)" $
        Do đó giá trị $40$ triệu đồng là sai.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một trung tâm dữ liệu (Data Center) cần dự phòng bộ nguồn lưu điện UPS công suất lớn. Chi phí mua và bảo dưỡng một bộ UPS dự phòng trong suốt vòng đời dự án là $C_o = 40$ triệu đồng. Nếu xảy ra sự cố hỏng nguồn chính mà không có đủ bộ UPS thay thế ngay lập tức, trung tâm bị phạt vi phạm hợp đồng và mất dữ liệu với thiệt hại ước tính là $C_u = 160$ triệu đồng cho mỗi bộ thiếu hụt. Số bộ nguồn UPS chính bị hỏng hóc trong vòng đời là biến ngẫu nhiên rời rạc $X$ có phân bố xác suất:
#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: 0.5pt + accent,
    fill: (x, y) => if y == 0 or x == 0 { accent.lighten(85%) } else { white },
    [Số UPS hỏng $X$], [$0$], [$1$], [$2$], [$3$],
    [Xác suất $P(X = k)$], [$0","4$], [$0","3$], [$0","2$], [$0","1$]
  )
]
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình xác định số dự phòng tối ưu
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [$r = C_u / (C_u + C_o) = 160 / 200 = 0","8$]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [$F(0)=0","4; F(1)=0","7; F(2)=0","9 >= 0","8 ==> k^* = 2$]))
  })
]
],
    (
        True([Tỷ số chi phí tới hạn để xác định số lượng UPS dự phòng tối ưu là $r = 0","8$.]),
        True([Hàm phân bố xác suất tích lũy của số UPS hỏng tại $k = 1$ là $F(1) = P(X <= 1) = 0","7$.]),
        True([Số lượng bộ UPS dự phòng tối ưu mà trung tâm nên mua sẵn là $2$ bộ.]),
        False([Nếu trung tâm không mua bộ UPS dự phòng nào ($k = 0$) thì tổng tổn thất kỳ vọng là $80$ triệu đồng.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Mô hình dự trữ phụ tùng tối ưu theo quy tắc Marginal Analysis:
        1. Tỷ số tới hạn:
           $ r = frac(C_u, C_u + C_o) $
        2. Số lượng dự trữ tối ưu $k^*$ là giá trị nguyên nhỏ nhất thỏa mãn:
           $ F(k^*) = P(X <= k^*) >= r $
        3. Tổng tổn thất kỳ vọng khi dự trữ $k = 0$: $E(L) = C_u dot E(X)$.

        #step([Phân tích ý a])
        $ r = frac(160, 160 + 40) = frac(160, 200) = 0","8 $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Phân bố xác suất tích lũy:
        - $F(0) = P(X = 0) = 0","4$.
        - $F(1) = P(X <= 1) = 0","4 + 0","3 = 0","7$.
        - $F(2) = P(X <= 2) = 0","7 + 0","2 = 0","9$.
        - $F(3) = P(X <= 3) = 1","0$.
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Ta tìm $k^*$ nhỏ nhất sao cho $F(k^*) >= 0","8$.
        - Với $k = 1$: $F(1) = 0","7 < 0","8$.
        - Với $k = 2$: $F(2) = 0","9 >= 0","8$.
        Vậy số lượng bộ UPS dự phòng tối ưu là $k^* = 2$ bộ.
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Kỳ vọng số UPS hỏng:
        $ E(X) = 0 dot 0","4 + 1 dot 0","3 + 2 dot 0","2 + 3 dot 0","1 = 0 + 0","3 + 0","4 + 0","3 = 1","0 " (bộ)" $
        Nếu $k = 0$ (không mua dự phòng), mỗi bộ hỏng đều chịu phạt $C_u = 160$ triệu đồng:
        $ E(L) = 160 dot E(X) = 160 dot 1","0 = 160 " (triệu đồng)" $
        Do đó giá trị $80$ triệu đồng là sai.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một nhà đầu tư tài chính xem xét một cơ hội góp vốn vào một dự án với ba kịch bản thị trường: Tăng trưởng tốt ($p_1 = 0","4$, lợi nhuận ròng $120$ triệu đồng), Đi ngang ($p_2 = 0","4$, lợi nhuận ròng $50$ triệu đồng), và Suy thoái ($p_3 = 0","2$, thua lỗ $-60$ triệu đồng). Tính giá trị tiền tệ kỳ vọng $"EMV"$ của dự án đầu tư này (đơn vị: triệu đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ tính EMV cơ hội góp vốn
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [EMV = 120(0,4) + 50(0,4) - 60(0,2)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [EMV = 48 + 20 - 12 = 56 triệu đồng]))
  })
]
],
    [56],
    loigiai: [
        #step([Phương pháp giải])
        Giá trị tiền tệ kỳ vọng $"EMV"$ được tính theo công thức:
        $ "EMV" = sum_(j=1)^3 v_j p_j $

        #step([Lời giải chi tiết])
        Thay số:
        $ "EMV" = 120 dot 0","4 + 50 dot 0","4 + (-60) dot 0","2 = 48 + 20 - 12 = 56 " (triệu đồng)" $
        Vậy giá trị $"EMV"$ của dự án là $56$ triệu đồng.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một công ty chế tạo máy đang cân nhắc thuê chuyên gia tư vấn cung cấp thông tin dự báo hoàn hảo về thị trường trước khi quyết định đầu tư mở rộng dây chuyền. Biết rằng nếu có thông tin hoàn hảo thì lợi nhuận kỳ vọng đạt được là $"EVwPI" = 145$ triệu đồng, còn lợi nhuận kỳ vọng tối ưu hiện tại khi chưa có thông tin bổ sung là $"EMV"^* = 118$ triệu đồng. Giá trị tối đa mà công ty sẵn sàng trả cho thông tin hoàn hảo $"EVPI"$ bằng bao nhiêu triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tính EVPI
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [$"EVPI" = "EVwPI" - "EMV"^*$]))
    content((0, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [EVPI = 145 - 118 = 27 triệu đồng]))
  })
]
],
    [27],
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng công thức tính giá trị kỳ vọng của thông tin hoàn hảo:
        $ "EVPI" = "EVwPI" - "EMV"^* $

        #step([Lời giải chi tiết])
        Thay số vào công thức:
        $ "EVPI" = 145 - 118 = 27 " (triệu đồng)" $
        Vậy mức chi trả tối đa cho thông tin hoàn hảo là $27$ triệu đồng.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một cửa hàng bánh mì tươi nướng bán bánh mì kẹp thịt cho học sinh vào buổi sáng. Chi phí nguyên liệu làm mỗi chiếc bánh là $c = 12$ nghìn đồng, giá bán mỗi chiếc là $p = 25$ nghìn đồng. Bánh nướng trong ngày chỉ bán vào buổi sáng, nếu thừa thì buổi chiều phải hạ giá bán thanh lý với giá $s = 5$ nghìn đồng/chiếc. Tính chi phí thiếu hàng $C_u$ (lợi nhuận bị mất khi thiếu $1$ chiếc bánh) theo đơn vị nghìn đồng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình chi phí thiếu hàng
    rect((-2.5, -0.5), (2.5, 0.5), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0), text(size: 8.5pt, weight: "bold", fill: accent, [Cu = p - c = 25 - 12 = 13 nghìn đồng]))
  })
]
],
    [13],
    loigiai: [
        #step([Phương pháp giải])
        Chi phí thiếu hàng trong bài toán Newsvendor:
        $ C_u = p - c $

        #step([Lời giải chi tiết])
        Với giá bán $p = 25$ nghìn đồng và giá vốn $c = 12$ nghìn đồng:
        $ C_u = 25 - 12 = 13 " (nghìn đồng)" $
        Vậy chi phí thiếu hàng là $13$ nghìn đồng.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một sạp báo đặt mua một tờ tạp chí tuần với tỷ số chi phí tới hạn được xác định là $r = frac(C_u, C_u + C_o) = 0","65$. Nhu cầu hàng tuần của khách hàng đối với loại tạp chí này có hàm phân bố xác suất tích lũy $F(k) = P(X <= k)$ như sau:
$F(60) = 0","20; quad F(70) = 0","45; quad F(80) = 0","70; quad F(90) = 0","90$.
Tìm số lượng cuốn tạp chí tối ưu $k^*$ mà chủ sạp báo nên đặt hàng mỗi tuần.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ tìm k*
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [r = 0,65]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [$F(70) = 0","45 < 0","65 <= F(80) = 0","70 ==> k^* = 80$]))
  })
]
],
    [80],
    loigiai: [
        #step([Phương pháp giải])
        Theo tiêu chuẩn biên trong mô hình Newsvendor, mức đặt hàng tối ưu $k^*$ là giá trị nhỏ nhất thỏa mãn:
        $ F(k^*) >= r $

        #step([Lời giải chi tiết])
        Ta có $r = 0","65$.
        So sánh với các giá trị của hàm tích lũy $F(k)$:
        - Tại $k = 70$: $F(70) = 0","45 < 0","65$.
        - Tại $k = 80$: $F(80) = 0","70 >= 0","65$.
        Do đó số lượng tạp chí tối ưu cần đặt là $k^* = 80$ cuốn.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Một công ty vận tải đường biển sở hữu tàu chở hàng có giá trị tài sản rủi ro là $5$ tỷ đồng. Xác suất xảy ra tai nạn chìm tàu trong năm là $p = 0","006$. Phí bảo hiểm thân tàu trọn gói trong năm do công ty bảo hiểm chào giá là $35$ triệu đồng. Tính mức chênh lệch giữa phí bảo hiểm phải trả và tổn thất rủi ro kỳ vọng nếu không mua bảo hiểm (lấy phí bảo hiểm trừ tổn thất kỳ vọng, đơn vị: triệu đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Chênh lệch phí bảo hiểm
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Tổn thất kỳ vọng = 5000 . 0,006 = 30 tr]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [Chênh lệch = 35 - 30 = 5 triệu đồng]))
  })
]
],
    [5],
    loigiai: [
        #step([Phương pháp giải])
        1. Tính tổn thất kỳ vọng khi không mua bảo hiểm:
           $ E(L) = 5000 " triệu đồng" dot 0","006 $
        2. Tính mức chênh lệch: $"Phí bảo hiểm" - E(L)$.

        #step([Lời giải chi tiết])
        Tổn thất kỳ vọng:
        $ E(L) = 5000 dot 0","006 = 30 " (triệu đồng)" $
        Mức chênh lệch:
        $ 35 - 30 = 5 " (triệu đồng)" $
        Vậy mức chênh lệch là $5$ triệu đồng.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd03G — Mã 527], back-to: "sec-exercise-hub",[Trên sơ đồ Cây quyết định của một dự án đầu tư nông nghiệp công nghệ cao, tại một nút biến cố ngẫu nhiên có $3$ nhánh tương ứng với ba mức sinh lời: Thị trường thuận lợi ($p_1 = 0","35$, sinh lời $90$ triệu đồng), Thị trường trung bình ($p_2 = 0","45$, sinh lời $40$ triệu đồng), và Thị trường đóng băng ($p_3 = 0","20$, chịu lỗ $-30$ triệu đồng). Tính giá trị kỳ vọng tiền tệ tại nút biến cố ngẫu nhiên này (đơn vị: triệu đồng, viết số thập phân với dấu phẩy nếu cần).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Nút biến cố 3 nhánh
    circle((0, 0), radius: 0.35, stroke: 1.2pt + rgb("15803d"), fill: rgb("dcfce7"))
    content((0, 0), text(size: 8pt, weight: "bold", fill: rgb("15803d"), [E]))
    
    line((0.35, 0.2), (1.5, 0.8), stroke: 0.8pt + gray)
    content((2.3, 0.8), text(size: 7.5pt, [90 (0,35)]))
    
    line((0.35, 0), (1.5, 0), stroke: 0.8pt + gray)
    content((2.3, 0), text(size: 7.5pt, [40 (0,45)]))
    
    line((0.35, -0.2), (1.5, -0.8), stroke: 0.8pt + gray)
    content((2.3, -0.8), text(size: 7.5pt, [-30 (0,20)]))
  })
]
],
    [43,5],
    loigiai: [
        #step([Phương pháp giải])
        Giá trị kỳ vọng tại nút biến cố ngẫu nhiên bằng tổng các tích giữa kết quả tiền tệ và xác suất tương ứng:
        $ E = sum_(j=1)^3 v_j p_j $

        #step([Lời giải chi tiết])
        Tính toán:
        $ E = 90 dot 0","35 + 40 dot 0","45 + (-30) dot 0","20 $
        $ E = 31","5 + 18 - 6 = 43","5 " (triệu đồng)" $
        Vậy giá trị kỳ vọng tại nút là $43","5$ triệu đồng.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ĐỀ ÔN TẬP CHUYÊN ĐỀ 3G: BÀI TOÁN QUYẾT ĐỊNH KINH DOANH & QUẢN TRỊ RỦI RO BẰNG KỲ VỌNG!]      #v(0.6em)
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
