// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ĐỀ ÔN TẬP CHUYÊN ĐỀ 3E: CÁC SỐ ĐẶC TRƯNG CỦA PHÂN BỐ NHỊ THỨC: KỲ VỌNG & PHƯƠNG SAI
// Lớp: Khối 12  ·  Mã đề: 525  ·  GV: Nguyễn Văn Sang
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
  title: "ĐỀ ÔN TẬP CHUYÊN ĐỀ 3E: CÁC SỐ ĐẶC TRƯNG CỦA PHÂN BỐ NHỊ THỨC: KỲ VỌNG & PHƯƠNG SAI",
  subtitle: "CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG — MÃ ĐỀ: 525",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 525]],
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
#lt-tn(num: 1, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên rời rạc $X$ tuân theo phân bố nhị thức với các tham số $n$ và $p$, ký hiệu $X ~ B(n, p)$. Công thức tính kỳ vọng toán học $E(X)$ và phương sai $V(X)$ của $X$ là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hộp công thức trực quan
    rect((-3.5, -0.9), (3.5, 0.9), stroke: 1.2pt + accent, fill: accent.lighten(92%), radius: 0.15)
    content((0, 0.35), text(size: 10pt, weight: "bold", fill: accent, [Phân bố nhị thức: X ~ B(n, p)]))
    content((-1.5, -0.3), text(size: 9pt, weight: "bold", fill: rgb("1e3a8a"), [$E(X) = n p$]))
    line((-0.2, -0.6), (-0.2, 0.0), stroke: 0.8pt + gray)
    content((1.5, -0.3), text(size: 9pt, weight: "bold", fill: rgb("b91c1c"), [$V(X) = n p (1 - p)$]))
  })
]
],
    (
        [$E(X) = n(1 - p)$ và $V(X) = n p$],
        [$E(X) = n p$ và $V(X) = sqrt(n p(1 - p))$],
        True([$E(X) = n p$ và $V(X) = n p(1 - p)$]),
        [$E(X) = frac(p, n)$ và $V(X) = frac(p(1 - p), n)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Theo lý thuyết biến ngẫu nhiên rời rạc trong chương trình Chuyên đề Toán 12:
        - Nếu biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $X ~ B(n, p)$ thì:
          $ E(X) = n p $
          $ V(X) = n p (1 - p) = n p q " (với " q = 1 - p ")" $
          $ sigma(X) = sqrt(V(X)) = sqrt(n p(1 - p)) $

        #step([Lời giải chi tiết])
        Do đó, phương án đúng là $E(X) = n p$ và $V(X) = n p (1 - p)$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một trang trại gieo $n = 200$ hạt giống ngô lai độc lập nhau. Xác suất để mỗi hạt nảy mầm phát triển thành cây con khỏe mạnh là $p = 0","85$. Kỳ vọng số cây con ngô nảy mầm bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ khay ươm hạt giống
    rect((-3, -0.8), (3, 0.8), stroke: 1pt + accent, fill: accent.lighten(90%), radius: 0.1)
    content((0, 0.4), text(size: 8.5pt, weight: "bold", fill: accent, [Khay gieo ươm: n = 200 hạt, p = 0,85]))
    // Các mầm cây tượng trưng
    for i in range(7) {
      let x = i * 0.8 - 2.4
      line((x, -0.4), (x, -0.05), stroke: 1.5pt + rgb("15803d"))
      circle((x - 0.08, 0.05), radius: 0.08, fill: rgb("22c55e"), stroke: none)
      circle((x + 0.08, 0.05), radius: 0.08, fill: rgb("22c55e"), stroke: none)
    }
    content((0, -0.5), text(size: 7.5pt, fill: gray.darken(20%), [Kỳ vọng nảy mầm: E(X) = n . p]))
  })
]
],
    (
        [$160$],
        True([$170$]),
        [$175$],
        [$185$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số hạt ngô nảy mầm trong số $n = 200$ hạt gieo.
        Vì các hạt nảy mầm độc lập với xác suất bằng nhau $p = 0","85$, biến ngẫu nhiên $X$ tuân theo phân bố nhị thức:
        $ X ~ B(200; 0","85) $

        #step([Lời giải chi tiết])
        Kỳ vọng số hạt ngô nảy mầm là:
        $ E(X) = n p = 200 dot 0","85 = 170 " (hạt)" $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một học sinh làm bài thi trắc nghiệm khách quan gồm $n = 60$ câu hỏi. Mỗi câu có $4$ phương án lựa chọn và chỉ có $1$ phương án đúng. Học sinh này khoanh ngẫu nhiên hoàn toàn cả $60$ câu. Phương sai của số câu trả lời đúng bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình phiếu trắc nghiệm ngẫu nhiên
    rect((-2.5, -0.8), (2.5, 0.8), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((0, 0.45), text(size: 8pt, weight: "bold", fill: accent, [Phiếu trả lời 60 câu trắc nghiệm]))
    for j in range(4) {
      let y = 0.1 - j * 0.25
      content((-1.5, y), text(size: 7pt, [Câu #(j+1):]))
      for k in range(4) {
        let x = -0.5 + k * 0.6
        circle((x, y), radius: 0.08, stroke: 0.6pt + gray)
      }
      // Khoanh ngẫu nhiên
      let pick = (-0.5, 0.1, -0.5 + 0.6, -0.5 + 1.2).at(j)
      circle((pick, y), radius: 0.06, fill: accent)
    }
  })
]
],
    (
        [$15$],
        [$12","5$],
        True([$11","25$]),
        [$3","75$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số câu trả lời đúng.
        Do thí sinh khoanh ngẫu nhiên nên mỗi câu trả lời đúng có xác suất $p = frac(1, 4) = 0","25$.
        Các câu hỏi độc lập nhau nên $X ~ B(60; 0","25)$.

        #step([Lời giải chi tiết])
        Phương sai của số câu trả lời đúng là:
        $ V(X) = n p (1 - p) = 60 dot 0","25 dot (1 - 0","25) = 60 dot 0","25 dot 0","75 = 11","25 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một biến ngẫu nhiên rời rạc $X$ tuân theo quy luật phân bố nhị thức $X ~ B(n, p)$. Biết rằng kỳ vọng $E(X) = 24$ và phương sai $V(X) = 4","8$. Số phép thử $n$ và xác suất thành công $p$ lần lượt là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ giải hệ phương trình n và p
    rect((-2.8, -0.7), (2.8, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.2, 0.2), text(size: 8.5pt, [$E(X) = n p = 24$]))
    content((-1.2, -0.3), text(size: 8.5pt, [$V(X) = n p (1 - p) = 4","8$]))
    line((0.3, -0.5), (0.3, 0.5), stroke: 0.8pt + accent)
    content((1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [$1 - p = frac(4","8, 24)$]))
    content((1.6, -0.3), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [$==> p = 0","8$]))
  })
]
],
    (
        [$n = 30; p = 0","2$],
        True([$n = 30; p = 0","8$]),
        [$n = 40; p = 0","6$],
        [$n = 120; p = 0","2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Thiết lập hệ phương trình theo hai tham số $n$ và $p$:
        $ cases(E(X) = n p = 24, V(X) = n p (1 - p) = 4","8) $

        #step([Lời giải chi tiết])
        Thay $n p = 24$ vào phương trình phương sai:
        $ 24 (1 - p) = 4","8 ==> 1 - p = frac(4","8, 24) = 0","2 $
        $ ==> p = 1 - 0","2 = 0","8 $
        Thay $p = 0","8$ vào $n p = 24$:
        $ n dot 0","8 = 24 ==> n = frac(24, 0","8) = 30 $
        Vậy $n = 30$ và $p = 0","8$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một xạ thủ bắn độc lập $n = 25$ viên đạn vào bia. Xác suất bắn trúng bia trong mỗi lần bắn đều là $p = 0","8$. Độ lệch chuẩn của số phát đạn bắn trúng bia bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ tâm bia bắn và dải độ lệch chuẩn
    circle((0, 0), radius: 1.2, stroke: 1.2pt + accent, fill: white)
    circle((0, 0), radius: 0.8, stroke: 0.8pt + accent, fill: accent.lighten(85%))
    circle((0, 0), radius: 0.4, stroke: 0.8pt + accent, fill: accent.lighten(60%))
    circle((0, 0), radius: 0.12, fill: rgb("dc2626"))
    content((0, -1.5), text(size: 8pt, weight: "bold", fill: accent, [n = 25 viên, p = 0,8 ==> V(X) = 4]))
  })
]
],
    (
        [$4$],
        True([$2$]),
        [$sqrt(20)$],
        [$1","6$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số phát bắn trúng $X$ tuân theo phân bố nhị thức $X ~ B(25; 0","8)$.
        Độ lệch chuẩn $sigma(X)$ được tính bằng căn bậc hai của phương sai $V(X)$:
        $ sigma(X) = sqrt(V(X)) = sqrt(n p(1 - p)) $

        #step([Lời giải chi tiết])
        Tính phương sai:
        $ V(X) = 25 dot 0","8 dot (1 - 0","8) = 25 dot 0","8 dot 0","2 = 4 $
        Do đó độ lệch chuẩn là:
        $ sigma(X) = sqrt(4) = 2 $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một dây chuyền sản xuất vi mạch bán dẫn có tỷ lệ sản phẩm bị khuyết tật là $p = 0","02$. Mỗi lô xuất xưởng gồm $n = 500$ vi mạch được chọn ngẫu nhiên độc lập. Chi phí khắc phục và bảo hành các vi mạch khuyết tật trong một lô được ước tính theo công thức $Y = 50 X + 15$ (đơn vị: nghìn đồng), trong đó $X$ là số vi mạch bị khuyết tật trong lô. Kỳ vọng chi phí khắc phục lỗi của một lô hàng bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình dây chuyền vi mạch
    rect((-3.2, -0.6), (3.2, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: accent, [Lô hàng: n = 500 vi mạch]))
    content((-1.5, -0.25), text(size: 7.5pt, [Tỷ lệ lỗi p = 0,02]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.7, 0.15), text(size: 8.5pt, weight: "bold", fill: rgb("b45309"), [Hàm chi phí: Y = 50X + 15]))
    content((1.7, -0.25), text(size: 7.5pt, fill: rgb("15803d"), [E(Y) = 50.E(X) + 15]))
  })
]
],
    (
        [$500$ nghìn đồng],
        True([$515$ nghìn đồng]),
        [$530$ nghìn đồng],
        [$265$ nghìn đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $X$ là số vi mạch khuyết tật trong lô $n = 500$ sản phẩm.
           Vì xác suất lỗi là $p = 0","02$ độc lập nên $X ~ B(500; 0","02)$.
        2. Kỳ vọng của $X$ là $E(X) = n p$.
        3. Sử dụng tính chất tuyến tính của kỳ vọng toán học: Với biến ngẫu nhiên $Y = a X + b$ thì $E(Y) = a E(X) + b$.

        #step([Lời giải chi tiết])
        Tính kỳ vọng số sản phẩm lỗi:
        $ E(X) = 500 dot 0","02 = 10 " (vi mạch)" $
        Kỳ vọng chi phí khắc phục lỗi là:
        $ E(Y) = E(50 X + 15) = 50 E(X) + 15 = 50 dot 10 + 15 = 515 " (nghìn đồng)" $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $X ~ B(n, p)$ có kỳ vọng $E(X) = 12$ và độ lệch chuẩn $sigma(X) = 2$. Xác suất để biến ngẫu nhiên $X$ nhận đúng giá trị kỳ vọng của nó $P(X = 12)$ bằng (làm tròn kết quả đến hàng phần nghìn):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ đồ thị phân bố hình cột quanh đỉnh E(X) = 12
    line((-2.8, -0.5), (2.8, -0.5), stroke: 1pt + gray)
    line((-2.5, -0.5), (-2.5, 1.2), stroke: 1pt + gray)
    content((-2.8, 1.2), text(size: 7pt, [P(X)]))
    // Các cột xác suất nhị thức
    let heights = (0.2, 0.45, 0.8, 1.3, 1.5, 1.3, 0.8, 0.45, 0.2)
    for i in range(9) {
      let x = -1.8 + i * 0.45
      let h = heights.at(i) * 0.7
      let fill_c = if i == 4 { accent } else { accent.lighten(70%) }
      rect((x - 0.15, -0.5), (x + 0.15, -0.5 + h), fill: fill_c, stroke: 0.5pt + accent)
    }
    content((0, -0.8), text(size: 8pt, weight: "bold", fill: accent, [Đỉnh phân bố tại X = 12]))
  })
]
],
    (
        [$0","245$],
        True([$0","197$]),
        [$0","148$],
        [$0","312$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Từ $E(X) = 12$ và $sigma(X) = 2$, suy ra phương sai $V(X) = sigma(X)^2 = 4$.
        2. Ta có hệ phương trình:
           $ cases(n p = 12, n p (1 - p) = 4) $
           Chia phương trình thứ hai cho phương trình thứ nhất để tìm $1 - p$, từ đó suy ra $p$ và $n$.
        3. Áp dụng công thức xác suất nhị thức $P(X = 12) = C_n^12 p^12 (1 - p)^(n - 12)$.

        #step([Lời giải chi tiết])
        Ta có:
        $ 1 - p = frac(V(X), E(X)) = frac(4, 12) = frac(1, 3) ==> p = 1 - frac(1, 3) = frac(2, 3) $
        Thay vào $n p = 12$:
        $ n dot frac(2, 3) = 12 ==> n = 18 $
        Vậy $X ~ B(18; 2/3)$.
        Xác suất để $X = 12$:
        $ P(X = 12) = C_18^12 dot (frac(2, 3))^12 dot (frac(1, 3))^(18 - 12) = C_18^12 dot frac(2^12, 3^18) $
        Ta có $C_18^12 = C_18^6 = frac(18 dot 17 dot 16 dot 15 dot 14 dot 13, 720) = 18564$.
        $ P(X = 12) = frac(18564 dot 4096, 387420489) = frac(76038144, 387420489) approx 0","19626 approx 0","197 $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Cho trước số phép thử độc lập $n$ không đổi ($n >= 1$). Khi xác suất thành công $p$ thay đổi trong khoảng $(0; 1)$, phương sai $V(X)$ của biến ngẫu nhiên nhị thức $X ~ B(n, p)$ đạt giá trị lớn nhất bằng bao nhiêu và tại giá trị $p$ nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đồ thị parabol V(p) = n p (1 - p)
    line((-2.5, -0.6), (2.5, -0.6), stroke: 1pt + gray)
    line((-2.2, -0.6), (-2.2, 1.2), stroke: 1pt + gray)
    content((2.5, -0.85), text(size: 7pt, [p]))
    content((-2.2, 1.35), text(size: 7pt, [V(p)]))
    
    // Parabol úp
    bezier((-2.0, -0.6), (0.0, 1.1), (2.0, -0.6), stroke: 1.5pt + accent)
    line((0.0, -0.6), (0.0, 0.68), stroke: (paint: accent, dash: "dashed", thickness: 0.8pt))
    circle((0.0, 0.68), radius: 0.08, fill: accent)
    content((0.0, -0.85), text(size: 8pt, weight: "bold", fill: accent, [p = 1/2]))
    content((0.0, 0.95), text(size: 8pt, weight: "bold", fill: rgb("b91c1c"), [V_max = n / 4]))
  })
]
],
    (
        [$V_max = frac(n, 2)$ khi $p = frac(1, 2)$],
        True([$V_max = frac(n, 4)$ khi $p = frac(1, 2)$]),
        [$V_max = frac(n, 4)$ khi $p = frac(1, 4)$],
        [$V_max = n$ khi $p = 1$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Phương sai của phân bố nhị thức là một hàm số bậc hai theo biến $p$:
        $ V(p) = n p (1 - p) = -n p^2 + n p " với " p in (0; 1) $
        Khảo sát hàm số bậc hai hoặc sử dụng bất đẳng thức Cauchy (AM-GM).

        #step([Lời giải chi tiết])
        Áp dụng bất đẳng thức Cauchy cho hai số dương $p$ và $1 - p$:
        $ p (1 - p) <= (frac(p + (1 - p), 2))^2 = (frac(1, 2))^2 = frac(1, 4) $
        Đẳng thức xảy ra khi và chỉ khi $p = 1 - p <=> p = frac(1, 2)$.
        Do đó:
        $ V(X) = n p (1 - p) <= frac(n, 4) $
        Vậy phương sai lớn nhất bằng $frac(n, 4)$, đạt được khi xác suất thành công $p = frac(1, 2)$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một tổng đài chăm sóc khách hàng ghi nhận số cuộc gọi bị nghẽn mạng trong một giờ là biến ngẫu nhiên $X ~ B(100; 0","04)$. Theo quy tắc kinh nghiệm $2 sigma$, khoảng giá trị $[E(X) - 2 sigma(X); E(X) + 2 sigma(X)]$ chứa phần lớn giá trị của $X$ là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ dải phân bố 2 sigma
    line((-3.0, 0), (3.0, 0), stroke: 1pt + gray)
    // Vùng 2 sigma tô màu
    rect((-1.8, -0.2), (1.8, 0.2), fill: accent.lighten(85%), stroke: 1pt + accent, radius: 0.05)
    line((0, -0.4), (0, 0.4), stroke: 1.2pt + rgb("15803d"))
    content((0, 0.6), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [E(X) = 4]))
    line((-1.8, -0.3), (-1.8, 0.3), stroke: 1pt + accent)
    line((1.8, -0.3), (1.8, 0.3), stroke: 1pt + accent)
    content((-1.8, -0.5), text(size: 7.5pt, weight: "bold", fill: accent, [4 - 2σ = 0,08]))
    content((1.8, -0.5), text(size: 7.5pt, weight: "bold", fill: accent, [4 + 2σ = 7,92]))
  })
]
],
    (
        [Không thể xác định vì $X$ rời rạc],
        [$[2; 6]$],
        True([$[0","08; 7","92]$]),
        [$[1","12; 6","88]$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Tính kỳ vọng: $E(X) = n p$.
        2. Tính phương sai: $V(X) = n p (1 - p)$ và độ lệch chuẩn $sigma(X) = sqrt(V(X))$.
        3. Xác định khoảng đối xứng quanh kỳ vọng $[E(X) - 2 sigma(X); E(X) + 2 sigma(X)]$.

        #step([Lời giải chi tiết])
        Với $n = 100, p = 0","04$:
        $ E(X) = 100 dot 0","04 = 4 $
        $ V(X) = 100 dot 0","04 dot (1 - 0","04) = 4 dot 0","96 = 3","84 $
        $ sigma(X) = sqrt(3","84) approx 1","9596 $
        Khoảng $2 sigma$ tương ứng:
        $ E(X) - 2 sigma(X) = 4 - 2 dot 1","9596 = 4 - 3","9192 = 0","0808 approx 0","08 $
        $ E(X) + 2 sigma(X) = 4 + 2 dot 1","9596 = 4 + 3","9192 = 7","9192 approx 7","92 $
        Vậy khoảng giá trị cần tìm là $[0","08; 7","92]$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Hai trạm khí tượng thủy văn độc lập quan sát bão nhiệt đới trong mùa mưa bão. Số cơn bão đổ bộ qua trạm $1$ là $X_1 ~ B(8; 0","3)$ và qua trạm $2$ là $X_2 ~ B(12; 0","3)$. Biến ngẫu nhiên tổng số cơn bão $X = X_1 + X_2$ đổ bộ có kỳ vọng và phương sai lần lượt là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Hai trạm hợp nhất
    rect((-2.8, -0.6), (-0.4, 0.6), stroke: 1pt + accent, fill: accent.lighten(92%), radius: 0.1)
    content((-1.6, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Trạm 1: B(8; 0,3)]))
    content((-1.6, -0.25), text(size: 7.5pt, [E = 2,4; V = 1,68]))
    
    content((0, 0), text(size: 11pt, weight: "bold", fill: accent, [+]))
    
    rect((0.4, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(92%), radius: 0.1)
    content((1.6, 0.15), text(size: 8pt, weight: "bold", fill: accent, [Trạm 2: B(12; 0,3)]))
    content((1.6, -0.25), text(size: 7.5pt, [E = 3,6; V = 2,52]))
  })
]
],
    (
        [$E(X) = 6$ và $V(X) = 6$],
        [$E(X) = 5$ và $V(X) = 4","2$],
        True([$E(X) = 6$ và $V(X) = 4","2$]),
        [$E(X) = 6$ và $V(X) = 2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tổng của hai biến ngẫu nhiên nhị thức độc lập có cùng tham số xác suất thành công $p$:
        Nếu $X_1 ~ B(n_1, p)$ và $X_2 ~ B(n_2, p)$ độc lập thì:
        $ X = X_1 + X_2 ~ B(n_1 + n_2, p) $
        Từ đó tính kỳ vọng và phương sai của $X$.

        #step([Lời giải chi tiết])
        Ở đây $n_1 = 8, n_2 = 12$ và $p = 0","3$.
        Tổng $X = X_1 + X_2$ tuân theo phân bố nhị thức:
        $ X ~ B(8 + 12; 0","3) = B(20; 0","3) $
        Kỳ vọng của $X$:
        $ E(X) = n p = 20 dot 0","3 = 6 $
        Phương sai của $X$:
        $ V(X) = n p (1 - p) = 20 dot 0","3 dot 0","7 = 4","2 $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một công ty bảo hiểm xe máy phát hành $n = 1000$ hợp đồng bảo hiểm độc lập trong một năm. Xác suất để một chủ xe gặp sự cố cần yêu cầu bồi thường trong năm là $p = 0","004$. Độ lệch chuẩn của số vụ yêu cầu bồi thường mà công ty phải giải quyết trong năm bằng (làm tròn đến hàng phần trăm):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình hợp đồng bảo hiểm
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.4, 0.15), text(size: 8.5pt, weight: "bold", fill: accent, [1000 hợp đồng bảo hiểm]))
    content((-1.4, -0.25), text(size: 7.5pt, [Tỷ lệ bồi thường p = 0,004]))
    line((0.1, -0.4), (0.1, 0.4), stroke: 0.8pt + gray)
    content((1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [E(X) = 4 vụ]))
    content((1.5, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [σ(X) = sqrt(3,984)]))
  })
]
],
    (
        [$4","00$],
        True([$2","00$]),
        [$1","98$],
        [$3","98$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số vụ bồi thường $X ~ B(1000; 0","004)$.
        Phương sai: $V(X) = n p (1 - p)$.
        Độ lệch chuẩn: $sigma(X) = sqrt(V(X))$.

        #step([Lời giải chi tiết])
        Ta có:
        $ V(X) = 1000 dot 0","004 dot (1 - 0","004) = 4 dot 0","996 = 3","984 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(3","984) approx 1","99599 approx 2","00 $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên $X ~ B(n, p)$. Xét biến ngẫu nhiên tần suất thành công mẫu $F = frac(X, n)$. Kỳ vọng $E(F)$ và phương sai $V(F)$ của tần suất thành công $F$ là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Biểu diễn chuyển đổi từ X sang tần suất F = X/n
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Số lần thành công X]))
    content((-1.5, -0.25), text(size: 7.5pt, [E(X) = n p; V(X) = n p(1-p)]))
    
    line((-0.1, 0), (0.3, 0), mark: (end: ">"), stroke: 1pt + accent)
    
    content((1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [Tần suất F = X / n]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("15803d"), [E(F) = p; V(F) = p(1-p)/n]))
  })
]
],
    (
        [$E(F) = n p$ và $V(F) = frac(p(1 - p), n)$],
        [$E(F) = p$ và $V(F) = p(1 - p)$],
        True([$E(F) = p$ và $V(F) = frac(p(1 - p), n)$]),
        [$E(F) = frac(p, n)$ và $V(F) = frac(p(1 - p), n^2)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Sử dụng tính chất của kỳ vọng và phương sai đối với phép biến đổi tuyến tính:
        Với hằng số $c$:
        $ E(c X) = c E(X) $
        $ V(c X) = c^2 V(X) $

        #step([Lời giải chi tiết])
        Ở đây $F = frac(1, n) X$, với $c = frac(1, n)$:
        $ E(F) = E(frac(1, n) X) = frac(1, n) E(X) = frac(1, n) (n p) = p $
        $ V(F) = V(frac(1, n) X) = (frac(1, n))^2 V(X) = frac(1, n^2) [n p (1 - p)] = frac(p(1 - p), n) $
        Kết quả này khẳng định tần suất mẫu là một ước lượng không chệch của xác suất $p$, và khi cỡ mẫu $n -> oo$ thì phương sai $V(F) -> 0$ (theo Luật số lớn Bernoulli).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một xí nghiệp dệt may kiểm tra ngẫu nhiên chất lượng $n = 400$ sản phẩm áo sơ mi may sẵn xuất khẩu. Xác suất để mỗi chiếc áo đạt tiêu chuẩn loại A xuất khẩu sang thị trường Châu Âu là $p = 0","9$. Các sản phẩm được kiểm tra độc lập với nhau. Gọi $X$ là số áo sơ mi đạt tiêu chuẩn loại A trong số $400$ sản phẩm được kiểm tra.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kiểm định 400 áo sơ mi
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1.2pt + accent, fill: accent.lighten(94%), radius: 0.12)
    content((-1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Kiểm định n = 400 áo]))
    content((-1.6, -0.25), text(size: 7.5pt, [Xác suất loại A: p = 0,9]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [Kỳ vọng: E(X) = 360 áo]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [Độ lệch chuẩn: σ(X) = 6 áo]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ tuân theo phân bố nhị thức với tham số $n = 400$ và $p = 0","9$, ký hiệu $X ~ B(400; 0","9)$.]),
        True([Kỳ vọng số áo sơ mi đạt chuẩn loại A là $E(X) = 360$ chiếc và phương sai $V(X) = 36$.]),
        True([Độ lệch chuẩn của số áo sơ mi đạt chuẩn loại A là $sigma(X) = 6$ chiếc.]),
        False([Khoảng biến thiên tin cậy $2 sigma$ đối xứng quanh kỳ vọng $[E(X) - 2 sigma(X); E(X) + 2 sigma(X)]$ là $[350; 370]$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        Áp dụng công thức đặc trưng của phân bố nhị thức $X ~ B(n, p)$:
        - $E(X) = n p$
        - $V(X) = n p (1 - p)$
        - $sigma(X) = sqrt(V(X))$
        - Khoảng $2 sigma$: $[E(X) - 2 sigma(X); E(X) + 2 sigma(X)]$.

        #step([Phân tích ý a])
        Vì kiểm tra độc lập $400$ sản phẩm với cùng xác suất đạt chuẩn loại A là $p = 0","9$, số sản phẩm đạt chuẩn $X$ tuân theo phân bố nhị thức $X ~ B(400; 0","9)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Kỳ vọng:
        $ E(X) = n p = 400 dot 0","9 = 360 " (chiếc)" $
        Phương sai:
        $ V(X) = n p (1 - p) = 400 dot 0","9 dot (1 - 0","9) = 360 dot 0","1 = 36 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(V(X)) = sqrt(36) = 6 " (chiếc)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Khoảng biến thiên $2 sigma$ quanh kỳ vọng là:
        $ [E(X) - 2 sigma(X); E(X) + 2 sigma(X)] = [360 - 2 dot 6; 360 + 2 dot 6] = [348; 372] $
        Do đó khẳng định khoảng $[350; 370]$ là sai.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một trò chơi giải trí tại hội chợ sử dụng một con xúc xắc $6$ mặt cân đối và đồng chất. Người chơi gieo con xúc xắc $n = 180$ lần độc lập. Trong mỗi lần gieo, nếu xuất hiện mặt có số chấm chia hết cho $3$ (mặt $3$ hoặc mặt $6$) thì người chơi được nhận $15$ nghìn đồng tiền thưởng; nếu xuất hiện các mặt còn lại (mặt $1, 2, 4, 5$) thì người chơi bị trừ $6$ nghìn đồng. Gọi $X$ là số lần xuất hiện mặt có số chấm chia hết cho $3$, và $T$ là tổng số tiền người chơi nhận được (đơn vị: nghìn đồng) sau $180$ lần gieo.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình trò chơi xúc xắc thưởng phạt
    rect((-3.0, -0.8), (3.0, 0.8), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.5, 0.4), text(size: 8.5pt, weight: "bold", fill: accent, [Xúc xắc 6 mặt, 180 lần]))
    content((-1.5, -0.05), text(size: 7.5pt, [Mặt chia hết cho 3: {3, 6}]))
    content((-1.5, -0.45), text(size: 7.5pt, [==> p = 2/6 = 1/3]))
    
    line((0, -0.6), (0, 0.6), stroke: 0.8pt + gray)
    
    content((1.5, 0.4), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [Công thức tiền thưởng: T]))
    content((1.5, -0.05), text(size: 7.5pt, [T = 15X - 6(180 - X)]))
    content((1.5, -0.45), text(size: 7.5pt, fill: rgb("b91c1c"), [T = 21X - 1080]))
  })
]
],
    (
        True([Xác suất xuất hiện mặt có số chấm chia hết cho $3$ trong mỗi lần gieo bằng $p = frac(1, 3)$.]),
        True([Kỳ vọng số lần xuất hiện mặt có số chấm chia hết cho $3$ là $E(X) = 60$ lần và phương sai $V(X) = 40$.]),
        True([Số tiền thưởng $T$ liên hệ với biến ngẫu nhiên $X$ qua biểu thức bậc nhất $T = 21 X - 1080$.]),
        False([Kỳ vọng số tiền người chơi nhận được sau cuộc chơi là $E(T) = 240$ nghìn đồng.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Xác định phân bố của $X$: số mặt chia hết cho 3 trong 6 mặt ${1, 2, 3, 4, 5, 6}$ là 2 mặt, nên $p = frac(2, 6) = frac(1, 3)$.
        2. Tính $E(X)$ và $V(X)$ theo phân bố nhị thức $X ~ B(180; 1/3)$.
        3. Biểu diễn $T$ theo $X$ và áp dụng tính chất tuyến tính của kỳ vọng: $E(a X + b) = a E(X) + b$.

        #step([Phân tích ý a])
        Con xúc xắc có 6 mặt đồng khả năng. Các mặt có số chấm chia hết cho 3 là mặt 3 và mặt 6 (gồm 2 mặt).
        Do đó xác suất là $p = frac(2, 6) = frac(1, 3)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Vì 180 lần gieo độc lập nên $X ~ B(180; 1/3)$.
        Kỳ vọng:
        $ E(X) = n p = 180 dot frac(1, 3) = 60 " (lần)" $
        Phương sai:
        $ V(X) = n p (1 - p) = 180 dot frac(1, 3) dot frac(2, 3) = 40 $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Trong 180 lần gieo, có $X$ lần xuất hiện mặt chia hết cho 3 (thưởng $+15$ nghìn đồng/lần) và $180 - X$ lần xuất hiện mặt không chia hết cho 3 (bị trừ $6$ nghìn đồng/lần).
        Tổng số tiền nhận được là:
        $ T = 15 X - 6(180 - X) = 15 X - 1080 + 6 X = 21 X - 1080 " (nghìn đồng)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Kỳ vọng số tiền người chơi nhận được:
        $ E(T) = E(21 X - 1080) = 21 E(X) - 1080 = 21 dot 60 - 1080 = 1260 - 1080 = 180 " (nghìn đồng)" $
        Do đó giá trị $E(T) = 240$ nghìn đồng là sai.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Trong một chiến dịch y tế dự phòng, người ta thực hiện xét nghiệm sàng lọc nhanh một loại virus cho $n = 300$ người thuộc nhóm nguy cơ. Các mẫu xét nghiệm hoàn toàn độc lập với nhau, và tỷ lệ người nhiễm virus trong nhóm này được ước lượng là $p = 0","05$. Gọi $X$ là số người có kết quả xét nghiệm dương tính trong đợt sàng lọc.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình xét nghiệm y tế
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Sàng lọc: n = 300 mẫu]))
    content((-1.5, -0.25), text(size: 7.5pt, [Tỷ lệ nhiễm virus p = 0,05]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [E(X) = 15 người]))
    content((1.5, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [V(X) = 14,25; σ(X) ≈ 3,77]))
  })
]
],
    (
        True([Biến ngẫu nhiên $X$ tuân theo phân bố nhị thức $X ~ B(300; 0","05)$.]),
        True([Kỳ vọng số người có kết quả dương tính là $E(X) = 15$ người.]),
        True([Phương sai của số người có kết quả dương tính là $V(X) = 14","25$ và độ lệch chuẩn $sigma(X) approx 3","77$ người.]),
        False([Nếu tăng số lượng người xét nghiệm lên gấp $4$ lần ($n' = 1200$) thì độ lệch chuẩn của số ca dương tính cũng tăng lên gấp $4$ lần.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Nhận dạng biến ngẫu nhiên nhị thức $X ~ B(n, p)$.
        2. Áp dụng công thức $E(X) = n p$, $V(X) = n p (1 - p)$, $sigma(X) = sqrt(n p (1 - p))$.
        3. Khảo sát sự phụ thuộc của độ lệch chuẩn vào cỡ mẫu $n$: $sigma(X) prop sqrt(n)$.

        #step([Phân tích ý a])
        Do mỗi người xét nghiệm độc lập với nhau và xác suất dương tính như nhau $p = 0","05$, nên $X$ tuân theo phân bố nhị thức $X ~ B(300; 0","05)$.
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Kỳ vọng:
        $ E(X) = n p = 300 dot 0","05 = 15 " (người)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Phương sai:
        $ V(X) = n p (1 - p) = 300 dot 0","05 dot 0","95 = 15 dot 0","95 = 14","25 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(14","25) approx 3","7749 approx 3","77 " (người)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Khi tăng cỡ mẫu lên gấp 4 lần: $n' = 4 n = 1200$.
        Độ lệch chuẩn mới là:
        $ sigma'(X) = sqrt(n' p (1 - p)) = sqrt(4 n p (1 - p)) = sqrt(4) dot sqrt(n p (1 - p)) = 2 sigma(X) $
        Như vậy độ lệch chuẩn chỉ tăng lên gấp $sqrt(4) = 2$ lần chứ không phải gấp $4$ lần.
        Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một công ty chế tạo linh kiện điện tử kiểm tra chất lượng tự động cho một lô gồm $n = 1000$ cảm biến gia tốc trên dây chuyền robot. Xác suất để một cảm biến vượt qua bài kiểm tra độ nhạy và đạt chuẩn xuất xưởng là $p = 0","8$. Gọi $X$ là số cảm biến đạt chuẩn trong lô $1000$ cảm biến được kiểm tra, và $F = frac(X, 1000)$ là tỷ lệ cảm biến đạt chuẩn thực tế của lô hàng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình kiểm soát chất lượng linh kiện
    rect((-3.2, -0.7), (3.2, 0.7), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((-1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [Kiểm tra n = 1000 cảm biến]))
    content((-1.6, -0.25), text(size: 7.5pt, [Xác suất đạt chuẩn: p = 0,8]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.6, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [E(X) = 800; σ(X) = 4√10]))
    content((1.6, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [E(F) = 0,8; σ(F) ≈ 0,0126]))
  })
]
],
    (
        True([Kỳ vọng số cảm biến đạt chuẩn xuất xưởng là $E(X) = 800$ cảm biến.]),
        True([Phương sai của số cảm biến đạt chuẩn là $V(X) = 160$ và độ lệch chuẩn $sigma(X) = 4 sqrt(10) approx 12","65$ cảm biến.]),
        True([Tỷ lệ cảm biến đạt chuẩn $F = frac(X, 1000)$ có kỳ vọng $E(F) = 0","8$ và độ lệch chuẩn $sigma(F) = frac(sqrt(10), 250) approx 0","0126$.]),
        False([Theo quy tắc $3 sigma$, số cảm biến đạt chuẩn $X$ của một lô hàng chắc chắn luôn nằm trong khoảng $[770; 830]$.])
    ),
    loigiai: [
        #step([Phương pháp giải])
        1. Biến ngẫu nhiên $X ~ B(1000; 0","8)$.
        2. Các đặc trưng số: $E(X) = n p$, $V(X) = n p (1 - p)$, $sigma(X) = sqrt(V(X))$.
        3. Các đặc trưng số của tần suất: $E(F) = p$, $sigma(F) = sqrt(frac(p(1 - p), n))$.
        4. Khoảng $3 sigma$: $[E(X) - 3 sigma(X); E(X) + 3 sigma(X)]$.

        #step([Phân tích ý a])
        $ E(X) = n p = 1000 dot 0","8 = 800 " (cảm biến)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Phương sai:
        $ V(X) = n p (1 - p) = 1000 dot 0","8 dot 0","2 = 160 $
        Độ lệch chuẩn:
        $ sigma(X) = sqrt(160) = sqrt(16 dot 10) = 4 sqrt(10) approx 12","649 approx 12","65 " (cảm biến)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Với $F = frac(X, 1000)$:
        $ E(F) = frac(E(X), 1000) = frac(800, 1000) = 0","8 $
        $ sigma(F) = frac(sigma(X), 1000) = frac(4 sqrt(10), 1000) = frac(sqrt(10), 250) approx 0","012649 approx 0","0126 $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Quy tắc $3 sigma$ xác định khoảng:
        $ [E(X) - 3 sigma(X); E(X) + 3 sigma(X)] = [800 - 3 dot 12","65; 800 + 3 dot 12","65] = [762","05; 837","95] $
        Hơn nữa, đây là khoảng chứa hầu hết các giá trị với xác suất khoảng $99","73%$, chứ không phải khẳng định "chắc chắn luôn luôn" (vẫn có xác suất nhỏ để $X$ nằm ngoài khoảng này). Ngoài ra khoảng $[770; 830]$ hẹp hơn khoảng $3 sigma$.
        Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một đề thi trắc nghiệm gồm $n = 120$ câu hỏi, mỗi câu có $4$ phương án lựa chọn trong đó chỉ có $1$ phương án đúng. Một thí sinh không học bài nên quyết định chọn ngẫu nhiên độc lập tất cả các câu hỏi. Gọi $X$ là số câu trả lời đúng của thí sinh. Độ lệch chuẩn $sigma(X)$ của số câu trả lời đúng bằng bao nhiêu? (Làm tròn kết quả đến hàng phần mười).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình tính độ lệch chuẩn trắc nghiệm
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [X ~ B(120; 0,25)]))
    content((0, -0.25), text(size: 8pt, fill: rgb("b91c1c"), [V(X) = 120 . 0,25 . 0,75 = 22,5 ==> σ(X) = √22,5 ≈ 4,7]))
  })
]
],
    [4,7],
    loigiai: [
        #step([Phương pháp giải])
        Số câu trả lời đúng $X$ tuân theo phân bố nhị thức:
        $ X ~ B(n, p) " với " n = 120, p = frac(1, 4) = 0","25 $
        Phương sai: $V(X) = n p (1 - p)$.
        Độ lệch chuẩn: $sigma(X) = sqrt(V(X))$.

        #step([Lời giải chi tiết])
        Tính phương sai của $X$:
        $ V(X) = 120 dot 0","25 dot (1 - 0","25) = 120 dot 0","25 dot 0","75 = 22","5 $
        Độ lệch chuẩn của $X$:
        $ sigma(X) = sqrt(22","5) approx 4","7434 $
        Làm tròn đến hàng phần mười ta được kết quả là $4","7$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một nhà máy sản xuất lon nước ngọt vận hành dây chuyền đóng nắp lon với tỷ lệ lon bị lỗi hở mép là $p = 0","015$. Trong một ca sản xuất, dây chuyền đóng được $n = 4000$ lon (các lon được đóng độc lập nhau). Gọi $X$ là số lon bị lỗi hở mép trong ca sản xuất đó. Tính phương sai $V(X)$ của số lon bị lỗi.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ lon nước ngọt tượng trưng
    rect((-2.5, -0.6), (2.5, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.2, 0.15), text(size: 8.5pt, weight: "bold", fill: accent, [Ca sản xuất: n = 4000 lon]))
    content((-1.2, -0.25), text(size: 7.5pt, [Tỷ lệ lỗi p = 0,015]))
    line((0.2, -0.4), (0.2, 0.4), stroke: 0.8pt + gray)
    content((1.4, 0.15), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [V(X) = n p (1 - p)]))
    content((1.4, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [V(X) = 59,1]))
  })
]
],
    [59,1],
    loigiai: [
        #step([Phương pháp giải])
        Số lon bị lỗi $X$ tuân theo phân bố nhị thức:
        $ X ~ B(4000; 0","015) $
        Phương sai được tính theo công thức:
        $ V(X) = n p (1 - p) $

        #step([Lời giải chi tiết])
        Thay số vào công thức:
        $ V(X) = 4000 dot 0","015 dot (1 - 0","015) = 60 dot 0","985 = 59","1 $
        Vậy phương sai của số lon bị lỗi bằng $59","1$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một ngân hàng thương mại phát hành thẻ tín dụng cho một nhóm gồm $n$ khách hàng mới với các điều kiện tài chính tương đương. Xác suất để một khách hàng bất kỳ phát sinh nợ quá hạn trong tháng đầu tiên là $p = 0","05$. Giả định hành vi thanh toán của các khách hàng là độc lập nhau. Biết rằng phương sai của số khách hàng phát sinh nợ quá hạn trong tháng đầu là $V(X) = 47","5$. Hãy tìm số lượng khách hàng $n$ được cấp thẻ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ tìm n từ phương sai
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [V(X) = n . p . (1 - p) = 47,5]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [n . 0,05 . 0,95 = 47,5 ==> n = 47,5 / 0,0475 = 1000]))
  })
]
],
    [1000],
    loigiai: [
        #step([Phương pháp giải])
        Gọi $X$ là số khách hàng phát sinh nợ quá hạn trong số $n$ khách hàng.
        Biến ngẫu nhiên $X ~ B(n; 0","05)$.
        Phương sai của $X$ thỏa mãn:
        $ V(X) = n p (1 - p) $
        Từ phương sai đã biết, giải phương trình bậc nhất tìm cỡ mẫu $n$.

        #step([Lời giải chi tiết])
        Ta có:
        $ n dot 0","05 dot (1 - 0","05) = 47","5 $
        $ n dot 0","05 dot 0","95 = 47","5 $
        $ n dot 0","0475 = 47","5 $
        $ n = frac(47","5, 0","0475) = 1000 $
        Vậy số lượng khách hàng được cấp thẻ là $1000$ người.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một sàn thương mại điện tử thống kê thấy mỗi lượt truy cập vào trang giới thiệu sản phẩm của một gian hàng công nghệ có xác suất chuyển đổi thành đơn hàng mua thành công là $p = 0","06$. Trong một ngày khuyến mãi, gian hàng ghi nhận có $n = 2500$ lượt truy cập độc lập. Mỗi đơn hàng thành công đem lại cho gian hàng khoản lợi nhuận ròng trung bình là $300$ nghìn đồng. Tính kỳ vọng tổng lợi nhuận ròng thu được từ các đơn hàng trong ngày khuyến mãi đó (đơn vị: triệu đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình chuyển đổi thương mại điện tử
    rect((-3.0, -0.6), (3.0, 0.6), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: accent, [2500 lượt xem]))
    content((-1.5, -0.25), text(size: 7.5pt, [Tỷ lệ mua p = 0,06]))
    line((0, -0.4), (0, 0.4), stroke: 0.8pt + gray)
    content((1.5, 0.15), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [E(X) = 150 đơn]))
    content((1.5, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [Lợi nhuận = 150 . 0,3 = 45 triệu]))
  })
]
],
    [45],
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $X$ là số đơn hàng mua thành công trong $n = 2500$ lượt truy cập.
           Vì các lượt truy cập độc lập nên $X ~ B(2500; 0","06)$.
        2. Tính kỳ vọng số đơn hàng $E(X) = n p$.
        3. Tổng lợi nhuận ròng (đơn vị triệu đồng) là $Y = 0","3 X$.
           Áp dụng tính chất kỳ vọng: $E(Y) = 0","3 E(X)$.

        #step([Lời giải chi tiết])
        Kỳ vọng số đơn hàng thành công:
        $ E(X) = 2500 dot 0","06 = 150 " (đơn hàng)" $
        Vì mỗi đơn hàng mang lại lợi nhuận $300$ nghìn đồng $= 0","3$ triệu đồng:
        Kỳ vọng tổng lợi nhuận ròng thu được trong ngày là:
        $ E(Y) = 0","3 dot E(X) = 0","3 dot 150 = 45 " (triệu đồng)" $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Cho biến ngẫu nhiên rời rạc $X$ tuân theo quy luật phân bố nhị thức $X ~ B(n, p)$ thỏa mãn đồng thời hai điều kiện: kỳ vọng $E(X) = 18$ và độ lệch chuẩn $sigma(X) = 3$. Tìm giá trị của số phép thử $n$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Sơ đồ xác định n
    rect((-2.8, -0.6), (2.8, 0.6), stroke: 1pt + accent, fill: accent.lighten(94%), radius: 0.1)
    content((0, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [E(X) = 18; σ(X) = 3 ==> V(X) = 9]))
    content((0, -0.25), text(size: 8pt, fill: rgb("15803d"), [1 - p = 9 / 18 = 0,5 ==> p = 0,5 ==> n = 18 / 0,5 = 36]))
  })
]
],
    [36],
    loigiai: [
        #step([Phương pháp giải])
        Từ độ lệch chuẩn $sigma(X) = 3$, suy ra phương sai:
        $ V(X) = sigma(X)^2 = 3^2 = 9 $
        Thiết lập hệ phương trình giữa kỳ vọng và phương sai:
        $ cases(n p = 18, n p (1 - p) = 9) $
        Giải hệ phương trình để tìm $p$, sau đó suy ra số phép thử $n$.

        #step([Lời giải chi tiết])
        Thay $n p = 18$ vào phương trình thứ hai:
        $ 18 (1 - p) = 9 ==> 1 - p = frac(9, 18) = 0","5 $
        $ ==> p = 1 - 0","5 = 0","5 $
        Thay $p = 0","5$ vào phương trình $n p = 18$:
        $ n dot 0","5 = 18 ==> n = frac(18, 0","5) = 36 $
        Vậy số phép thử $n = 36$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd03E — Mã 525], back-to: "sec-exercise-hub",[Một dự án phủ xanh đồi trọc tiến hành trồng thử nghiệm $n = 1500$ cây lát hoa. Do điều kiện thổ nhưỡng khắc nghiệt, xác suất để mỗi cây sống sót và phát triển tốt sau một năm là $p = 0","8$ (sự sống sót của các cây là độc lập nhau). Dự án quy định: mỗi cây sống sót được đầu tư chi phí chăm sóc dưỡng cây là $120$ nghìn đồng; mỗi cây bị chết phải chịu chi phí đào bỏ và trồng dặm lại là $40$ nghìn đồng. Gọi $C$ là tổng chi phí chăm sóc và trồng dặm sau một năm của dự án (đơn vị: triệu đồng). Tính kỳ vọng $E(C)$ của tổng chi phí đó.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô hình chi phí trồng rừng
    rect((-3.0, -0.7), (3.0, 0.7), stroke: 1pt + accent, fill: white, radius: 0.1)
    content((-1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: accent, [1500 cây lát hoa]))
    content((-1.5, -0.25), text(size: 7.5pt, [Sống p = 0,8; Chết q = 0,2]))
    line((0, -0.5), (0, 0.5), stroke: 0.8pt + gray)
    content((1.5, 0.2), text(size: 8.5pt, weight: "bold", fill: rgb("15803d"), [C = 120X + 40(1500 - X)]))
    content((1.5, -0.25), text(size: 7.5pt, fill: rgb("b91c1c"), [E(C) = 156 triệu đồng]))
  })
]
],
    [156],
    loigiai: [
        #step([Phương pháp giải])
        1. Gọi $X$ là số cây lát hoa sống sót trong số $n = 1500$ cây được trồng.
           Vì xác suất mỗi cây sống là $p = 0","8$ độc lập nên $X ~ B(1500; 0","8)$.
        2. Số cây bị chết là $1500 - X$.
        3. Tổng chi phí $C$ (tính theo nghìn đồng) là:
           $ C = 120 X + 40(1500 - X) = 80 X + 60000 $
        4. Áp dụng tính chất tuyến tính của kỳ vọng: $E(C) = 80 E(X) + 60000$, sau đó quy đổi sang triệu đồng.

        #step([Lời giải chi tiết])
        Kỳ vọng số cây sống sót:
        $ E(X) = n p = 1500 dot 0","8 = 1200 " (cây)" $
        Kỳ vọng số cây bị chết:
        $ 1500 - E(X) = 1500 - 1200 = 300 " (cây)" $
        Kỳ vọng tổng chi phí chăm sóc và trồng dặm (theo nghìn đồng):
        $ E(C) = 120 dot 1200 + 40 dot 300 = 144000 + 12000 = 156000 " (nghìn đồng)" $
        Quy đổi sang đơn vị triệu đồng:
        $ 156000 " nghìn đồng" = 156 " triệu đồng" $
        Vậy kỳ vọng của tổng chi phí là $156$ triệu đồng.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ĐỀ ÔN TẬP CHUYÊN ĐỀ 3E: CÁC SỐ ĐẶC TRƯNG CỦA PHÂN BỐ NHỊ THỨC: KỲ VỌNG & PHƯƠNG SAI!]      #v(0.6em)
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
