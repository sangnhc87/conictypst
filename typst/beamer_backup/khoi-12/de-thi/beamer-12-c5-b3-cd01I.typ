// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHỦ ĐỀ 1I: MÔ HÌNH SINH THÁI, KHAI THÁC BỀN VỮNG & DỊCH TỄ (VD - VDC)
// Lớp: Khối 12  ·  Mã đề: 509  ·  GV: Nguyễn Văn Sang
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
  title: "CHỦ ĐỀ 1I: MÔ HÌNH SINH THÁI, KHAI THÁC BỀN VỮNG & DỊCH TỄ (VD - VDC)",
  subtitle: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN — MÃ ĐỀ: 509",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 509]],
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
#lt-tn(num: 1, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một quần thể cá trong một hồ sinh thái phát triển theo mô hình tăng trưởng Logistic:
$ P(t) = 12000 / (1 + 5 e^(-0.4 t)) $
trong đó $P(t)$ là số lượng cá sau $t$ tháng ($t >= 0$). Tốc độ gia tăng số lượng cá của quần thể đạt giá trị lớn nhất khi số lượng cá trong hồ đạt bao nhiêu con?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục tọa độ
    line((-0.5, 0), (6.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 4.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((6.5, -0.3), text(size: 8pt)[$t$ (tháng)])
    content((-0.5, 4.2), text(size: 8pt)[$P(t)$ (con)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường tiệm cận K = 12000
    line((0, 3.4), (6, 3.4), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((-1, 3.4), text(size: 8pt, fill: rgb("475569"))[$K = 12000$])

    // Mức K/2 = 6000
    line((0, 1.7), (2.5, 1.7), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    line((2.5, 0), (2.5, 1.7), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    content((-1, 1.7), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$P = 6000$])
    content((2.5, -0.3), text(size: 8pt)[$t_0$])

    // Đường cong chữ S Logistic
    bezier((0, 0.57), (2.5, 1.7), (1.1, 0.65), (1.8, 1.15), stroke: 1.5pt + rgb("be123c"))
    bezier((2.5, 1.7), (6, 3.32), (3.2, 2.25), (4.5, 3.25), stroke: 1.5pt + rgb("be123c"))

    // Tiếp tuyến tại điểm uốn
    line((1.2, 0.6), (3.8, 2.8), stroke: 0.9pt + rgb("2563eb"))
    circle((2.5, 1.7), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((3.8, 1.5), text(size: 8pt, fill: rgb("be123c"))[Điểm uốn: Tốc độ $P'(t)$ đạt Max])
  })
]
],
    (
        True([$6000$ con.]),
        [$12000$ con.],
        [$2400$ con.],
        [$2000$ con.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Mô hình tăng trưởng Logistic có phương trình vi phân cổ điển:
        $ P'(t) = r P(t) (1 - P(t)/K) $
        trong đó:
        - $K$ là sức chứa tối đa của môi trường sống ($K = 12000$).
        - $r$ là hệ số tăng trưởng nội tại ($r = 0.4$).
        Tốc độ gia tăng số lượng cá chính là đạo hàm $P'(t)$. Ta tìm giá trị của $P$ để hàm số này đạt giá trị lớn nhất.

        #step([Lời giải chi tiết])
        Xét hàm tốc độ tăng trưởng theo số cá thể $P$:
        $ f(P) = r P (1 - P/K) = - r/K P^2 + r P $

        Đây là một hàm số bậc hai (tam thức bậc hai) theo biến $P$ với hệ số bậc hai âm ($-r/K < 0$).
        Do đó, đồ thị là một parabol có bề lõm quay xuống dưới.

        Đỉnh cực đại của parabol đạt tại:
        $ P = - b / (2 a) = - r / (2 dot (-r/K)) = K / 2 $

        Thay số với $K = 12000$:
        $ P = 12000 / 2 = 6000 " (con)" $

        Như vậy, khi số lượng cá trong hồ đạt đúng $6000$ con (một nửa sức chứa của hồ), tốc độ sinh sản và phát triển của đàn cá đạt mức nhanh nhất.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Theo mô hình khai thác ngư nghiệp bền vững Schaefer, một quần thể cá hồi có tốc độ tăng trưởng sinh khối tự nhiên hàng năm là $G(P) = 0.6 P (1 - P/5000)$ (tấn/năm), với $P$ là sinh khối cá hiện có (tấn). Sản lượng khai thác bền vững tối đa (MSY - Maximum Sustainable Yield) hàng năm có thể đánh bắt mà không làm suy giảm trữ lượng cá qua các năm là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục tọa độ
    line((-0.5, 0), (6.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.8), mark: (end: "stealth"), stroke: 0.8pt)
    content((6.5, -0.3), text(size: 8pt)[$P$ (tấn)])
    content((-0.5, 3.8), text(size: 8pt)[$G(P)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường cong Parabol MSY
    bezier((0, 0), (2.7, 2.7), (0.9, 1.6), (1.8, 2.7), stroke: 1.5pt + rgb("be123c"))
    bezier((2.7, 2.7), (5.4, 0), (3.6, 2.7), (4.5, 1.6), stroke: 1.5pt + rgb("be123c"))

    // Tọa độ đỉnh cực đại MSY
    line((0, 2.7), (2.7, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((2.7, 0), (2.7, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.7, 2.7), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((-1, 2.7), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[MSY = 750])
    content((2.7, -0.35), text(size: 8pt)[$P = 2500$])
    content((5.4, -0.35), text(size: 8pt)[$K = 5000$])
    content((2.7, 3.2), text(size: 8pt, fill: rgb("be123c"))[Đỉnh khai thác bền vững MSY])
  })
]
],
    (
        True([$750$ tấn/năm.]),
        [$1500$ tấn/năm.],
        [$2500$ tấn/năm.],
        [$3000$ tấn/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Để việc đánh bắt diễn ra bền vững qua các năm mà không làm suy kiệt sinh khối cá, sản lượng khai thác hàng năm $Y$ phải cân bằng đúng bằng lượng sinh khối tăng trưởng sinh học tự nhiên $G(P)$:
        $ Y(P) = G(P) = 0.6 P (1 - P/5000) $
        Mức khai thác bền vững tối đa (MSY) đạt được tại điểm cực đại của hàm số $Y(P)$.

        #step([Lời giải chi tiết])
        Khai triển hàm số sản lượng khai thác:
        $ Y(P) = - 0.6 / 5000 P^2 + 0.6 P = - 0.00012 P^2 + 0.6 P $

        Đạo hàm theo biến $P$:
        $ Y'(P) = - 0.00024 P + 0.6 $

        Cho $Y'(P) = 0$, ta tìm được trữ lượng sinh khối tối ưu:
        $ P = 0.6 / 0.00024 = 2500 " (tấn)" $

        Giá trị sản lượng khai thác bền vững tối đa (MSY) tương ứng:
        $ "MSY" = Y(2500) = 0.6 dot 2500 dot (1 - 2500/5000) $
        $ = 1500 dot 0.5 = 750 " (tấn/năm)" $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Sau khi tiêm một liều thuốc kháng sinh vào bắp tay bệnh nhân, nồng độ thuốc trong máu sau $t$ giờ được mô tả bởi hàm số:
$ C(t) = 8 (e^(-0.2 t) - e^(-0.8 t)) quad (mu"g/mL", t >= 0) $
Nồng độ thuốc trong máu đạt giá trị cao nhất sau khoảng thời gian bao lâu kể từ lúc tiêm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục tọa độ
    line((-0.5, 0), (6.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6.5, -0.3), text(size: 8pt)[$t$ (giờ)])
    content((-0.6, 3.5), text(size: 8pt)[$C(t)$ ($mu$g/mL)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đồ thị nồng độ thuốc
    bezier((0, 0), (2.3, 2.5), (0.6, 1.8), (1.4, 2.5), stroke: 1.5pt + rgb("be123c"))
    bezier((2.3, 2.5), (6, 0.6), (3.3, 2.5), (4.5, 1.1), stroke: 1.5pt + rgb("be123c"))

    // Đỉnh nồng độ thuốc
    line((0, 2.5), (2.3, 2.5), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((2.3, 0), (2.3, 2.5), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.3, 2.5), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.3, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$t approx 2.31$ h])
    content((2.3, 2.9), text(size: 8pt, fill: rgb("be123c"))[Nồng độ đỉnh $C_"max"$])
  })
]
],
    (
        True([$t approx 2.31$ giờ.]),
        [$t approx 1.85$ giờ.],
        [$t approx 3.12$ giờ.],
        [$t approx 1.25$ giờ.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Để tìm thời điểm nồng độ thuốc trong máu đạt giá trị lớn nhất:
        - Tính đạo hàm bậc nhất $C'(t)$.
        - Giải phương trình $C'(t) = 0$ tìm thời điểm dừng $t$.
        - Xét dấu đạo hàm để khẳng định đây là điểm cực đại toàn cục.

        #step([Lời giải chi tiết])
        Ta có đạo hàm của hàm nồng độ thuốc:
        $ C'(t) = 8 [-0.2 e^(-0.2 t) - (-0.8) e^(-0.8 t)] $
        $ = 8 (0.8 e^(-0.8 t) - 0.2 e^(-0.2 t)) $

        Cho $C'(t) = 0$, ta có phương trình:
        $ 0.8 e^(-0.8 t) = 0.2 e^(-0.2 t) $

        Chia hai vế cho $0.2 e^(-0.8 t)$:
        $ e^(0.6 t) = 0.8 / 0.2 = 4 $

        Lấy logarit tự nhiên hai vế:
        $ 0.6 t = ln 4 $
        $ t = (ln 4) / 0.6 = (2 ln 2) / 0.6 $
        $ t approx (2 dot 0.69315) / 0.6 approx 2.3105 " (giờ)" $

        Bảng biến thiên cho thấy hàm số đồng biến trên $(0; 2.31)$ và nghịch biến trên $(2.31; +infinity)$.
        Vậy nồng độ thuốc đạt đỉnh sau khoảng $2.31$ giờ (tức khoảng 2 giờ 18 phút).
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Trong một đợt bùng phát dịch cúm mùa ở một trường học nội trú có $1000$ học sinh, số học sinh bị lây nhiễm sau $t$ ngày kể từ ca đầu tiên được cho bởi:
$ I(t) = 1000 / (1 + 99 e^(-0.5 t)) $
Ngày mà số ca nhiễm mới trong ngày phát sinh nhiều nhất (tốc độ lây lan của dịch bệnh đạt đỉnh điểm) là ngày thứ mấy?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục tọa độ
    line((-0.5, 0), (6.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6.5, -0.3), text(size: 8pt)[$t$ (ngày)])
    content((-0.6, 3.5), text(size: 8pt)[Tốc độ $I'(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường hình chuông tốc độ nhiễm mới
    bezier((0, 0.2), (3, 2.6), (1.2, 0.3), (2.1, 2.6), stroke: 1.5pt + rgb("be123c"))
    bezier((3, 2.6), (6, 0.2), (3.9, 2.6), (4.8, 0.3), stroke: 1.5pt + rgb("be123c"))

    // Đỉnh dịch
    line((3, 0), (3, 2.6), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((3, 2.6), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((3, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[Ngày thứ 9 ($t approx 9.19$)])
    content((3, 3), text(size: 8pt, fill: rgb("be123c"))[Đỉnh dịch: Ca nhiễm mới Max])
  })
]
],
    (
        True([Ngày thứ 9.]),
        [Ngày thứ 5.],
        [Ngày thứ 14.],
        [Ngày thứ 20.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Số ca nhiễm mới phát sinh trong ngày phản ánh tốc độ biến thiên tức thời của số ca bệnh $I'(t)$.
        Hàm Logistic $I(t)$ có tốc độ thay đổi lớn nhất tại điểm uốn, tức là thời điểm mà số ca nhiễm tích lũy đạt đúng một nửa quy mô tối đa:
        $ I(t) = 1000 / 2 = 500 $

        #step([Lời giải chi tiết])
        Từ điều kiện $I(t) = 500$, ta thiết lập phương trình:
        $ 1000 / (1 + 99 e^(-0.5 t)) = 500 $

        $ 1 + 99 e^(-0.5 t) = 2 $
        $ 99 e^(-0.5 t) = 1 $
        $ e^(0.5 t) = 99 $

        Lấy logarit tự nhiên:
        $ 0.5 t = ln 99 $
        $ t = 2 ln 99 approx 2 dot 4.59512 = 9.19 " (ngày)" $

        Như vậy, tốc độ lây lan đạt đỉnh điểm vào ngày thứ 9 kể từ khi xuất hiện ca bệnh đầu tiên.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một công ty lâm nghiệp khai thác một cánh rừng bạch đàn thương dụng. Thể tích gỗ $V(t)$ ($m^3$/ha) theo tuổi cây $t$ (năm) được cho bởi $V(t) = 240 (1 - e^(-0.08 t))^2$. Tốc độ tích lũy sinh khối gỗ hàng năm $V'(t)$ đạt giá trị cực đại khi rừng đạt độ tuổi bao nhiêu năm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục tọa độ
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.2), text(size: 8pt)[$V'(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đồ thị tốc độ tích lũy gỗ
    bezier((0, 0), (2.4, 2.3), (0.8, 1.5), (1.6, 2.3), stroke: 1.5pt + rgb("be123c"))
    bezier((2.4, 2.3), (5.5, 0.5), (3.3, 2.3), (4.5, 1.0), stroke: 1.5pt + rgb("be123c"))

    line((2.4, 0), (2.4, 2.3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.4, 2.3), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.4, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$t approx 8.66$ năm])
    content((2.4, 2.7), text(size: 8pt, fill: rgb("be123c"))[Tốc độ lớn gỗ nhanh nhất])
  })
]
],
    (
        True([$t approx 8.66$ năm.]),
        [$t approx 12.50$ năm.],
        [$t approx 15.20$ năm.],
        [$t approx 6.25$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tốc độ tích lũy gỗ hàng năm là đạo hàm $V'(t)$.
        Để tìm thời điểm tốc độ này lớn nhất, ta tính đạo hàm của $V(t)$, sau đó dùng phép đổi biến đặt ẩn phụ để tìm cực trị.

        #step([Lời giải chi tiết])
        Áp dụng công thức đạo hàm hàm hợp:
        $ V'(t) = 240 dot 2 (1 - e^(-0.08 t)) dot (0.08 e^(-0.08 t)) $
        $ = 38.4 (e^(-0.08 t) - e^(-0.16 t)) $

        Đặt ẩn phụ $u = e^(-0.08 t)$.
        Vì $t > 0$ và hệ số âm nên ta có điều kiện $0 < u < 1$.
        Hàm số biểu thị tốc độ trở thành:
        $ g(u) = 38.4 (u - u^2) $

        Đây là tam thức bậc hai theo $u$ đạt giá trị lớn nhất tại đỉnh parabol:
        $ u = 1 / 2 $

        Từ đó ta giải tìm thời gian $t$:
        $ e^(-0.08 t) = 1/2 $
        $ -0.08 t = - ln 2 $
        $ t = (ln 2) / 0.08 approx 0.69315 / 0.08 approx 8.664 " (năm)" $

        Vậy sau khoảng $8.66$ năm tuổi, rừng bạch đàn có tốc độ sinh trưởng tích lũy gỗ mạnh nhất.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một phản ứng sinh hóa tự xúc tác (autocatalytic reaction) tạo ra hoạt chất $X$ từ cơ chất ban đầu với nồng độ ban đầu là $a$ (mol/L). Tốc độ của phản ứng biến thiên theo nồng độ sản phẩm $x$ đã hình thành theo mô hình:
$ v(x) = k x (a - x) $
trong đó $k$ là hằng số tốc độ dương. Tốc độ phản ứng sẽ diễn ra nhanh nhất khi nồng độ sản phẩm $x$ bằng:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$x$])
    content((-0.5, 3), text(size: 8pt)[$v(x)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Parabol v(x)
    bezier((0, 0), (2.3, 2.2), (0.8, 1.4), (1.6, 2.2), stroke: 1.5pt + rgb("be123c"))
    bezier((2.3, 2.2), (4.6, 0), (3.0, 2.2), (3.8, 1.4), stroke: 1.5pt + rgb("be123c"))

    line((2.3, 0), (2.3, 2.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.3, 2.2), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.3, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$x = a/2$])
    content((4.6, -0.35), text(size: 8pt)[$x = a$])
    content((2.3, 2.6), text(size: 8pt, fill: rgb("be123c"))[$v_"max" = (k a^2)/4$])
  })
]
],
    (
        True([$x = a/2$.]),
        [$x = a/3$.],
        [$x = (2a)/3$.],
        [$x = a$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hàm tốc độ $v(x) = k x (a - x) = - k x^2 + k a x$ là một tam thức bậc hai với biến số là nồng độ sản phẩm $x in [0; a]$.

        #step([Lời giải chi tiết])
        Đạo hàm bậc nhất theo biến $x$:
        $ v'(x) = -2 k x + k a $

        Cho $v'(x) = 0$, ta tìm được nghiệm:
        $ x = (k a) / (2 k) = a / 2 $

        Vì hệ số bậc hai âm ($-k < 0$), hàm số đạt cực đại toàn cục tại $x = a/2$.
        Tốc độ phản ứng lớn nhất đạt được khi đó là:
        $ v_"max" = k dot (a/2) dot (a - a/2) = (k a^2) / 4 $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một trang trại nuôi tôm thâm canh. Khối lượng trung bình của một con tôm sau $t$ tuần tuổi tuân theo hàm số $W(t) = 45 / (1 + 8 e^(-0.25 t))$ (gam). Người nuôi muốn xác định thời điểm tôm có tốc độ tăng trọng lớn nhất để tập trung bổ sung dinh dưỡng tối ưu. Tôm đạt tốc độ tăng trọng lớn nhất sau bao nhiêu tuần?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (tuần)])
    content((-0.6, 3.5), text(size: 8pt)[$W(t)$ (g)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    line((0, 3), (5.5, 3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((-0.9, 3), text(size: 8pt, fill: rgb("475569"))[$K = 45$g])

    line((0, 1.5), (2.6, 1.5), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    line((2.6, 0), (2.6, 1.5), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    content((-1, 1.5), text(size: 8pt, fill: rgb("be123c"))[$22.5$g])
    content((2.6, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$t approx 8.32$])

    bezier((0, 0.45), (2.6, 1.5), (1.1, 0.5), (1.8, 1.0), stroke: 1.5pt + rgb("be123c"))
    bezier((2.6, 1.5), (5.5, 2.9), (3.3, 2.0), (4.5, 2.85), stroke: 1.5pt + rgb("be123c"))

    circle((2.6, 1.5), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((3.8, 1.3), text(size: 8pt, fill: rgb("be123c"))[Điểm uốn (Tăng trọng nhanh nhất)])
  })
]
],
    (
        True([$t approx 8.32$ tuần.]),
        [$t approx 12.15$ tuần.],
        [$t approx 6.50$ tuần.],
        [$t approx 10.45$ tuần.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hàm khối lượng $W(t)$ tuân theo quy luật Logistic với giới hạn kích thước tối đa $K = 45$ gam.
        Tốc độ tăng trọng $W'(t)$ đạt cực đại tại điểm uốn của đồ thị, tức khi khối lượng con tôm đạt đúng một nửa trọng lượng tối đa:
        $ W(t) = 45 / 2 = 22.5 " (gam)" $

        #step([Lời giải chi tiết])
        Từ điều kiện trên, ta giải phương trình:
        $ 45 / (1 + 8 e^(-0.25 t)) = 22.5 $

        $ 1 + 8 e^(-0.25 t) = 2 $
        $ 8 e^(-0.25 t) = 1 $
        $ e^(0.25 t) = 8 $

        Lấy logarit tự nhiên:
        $ 0.25 t = ln 8 $
        $ t = 4 ln 8 = 12 ln 2 $
        $ t approx 12 dot 0.69315 approx 8.318 " (tuần)" $

        Vậy sau khoảng $8.32$ tuần nuôi, tốc độ tăng trọng của tôm đạt mức cao nhất.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Hiệu quả của việc phun thuốc bảo vệ thực vật trên cánh đồng lúa được đánh giá qua tỷ lệ sâu bệnh bị tiêu diệt $E(x) = (90 x) / (x + 2)$ (%), với $x$ là liều lượng phun (lít/ha). Biết chi phí phun thuốc là $600$ nghìn đồng/lít và giá trị nông sản được bảo toàn cứ mỗi $1%$ sâu bệnh bị diệt đem lại $30$ nghìn đồng/ha. Liều lượng phun $x$ để tối đa hóa lợi ích ròng (tiền bảo vệ trừ chi phí) là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$x$ (lít/ha)])
    content((-0.5, 3.2), text(size: 8pt)[$f(x)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đồ thị hàm lợi ích ròng f(x)
    bezier((0, 0), (1.8, 2.3), (0.6, 1.6), (1.2, 2.3), stroke: 1.5pt + rgb("be123c"))
    bezier((1.8, 2.3), (4.5, 0), (2.6, 2.3), (3.8, 1.0), stroke: 1.5pt + rgb("be123c"))

    line((1.8, 0), (1.8, 2.3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((1.8, 2.3), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((1.8, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$x = 1$ lít/ha])
    content((2.5, 2.7), text(size: 8pt, fill: rgb("be123c"))[Lợi ích ròng đạt cực đại])
  })
]
],
    (
        True([$x = 1$ lít/ha.]),
        [$x = 2$ lít/ha.],
        [$x = 3$ lít/ha.],
        [$x = 4$ lít/ha.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Xác định hàm doanh thu (giá trị nông sản bảo tồn được) $R(x)$ theo liều lượng phun $x$.
        - Xác định hàm chi phí phun thuốc $C(x)$.
        - Lập hàm lợi ích ròng $f(x) = R(x) - C(x)$ và tìm cực trị trên khoảng $(0; +infinity)$.

        #step([Lời giải chi tiết])
        Giá trị nông sản được bảo vệ:
        $ R(x) = 30 dot E(x) = 30 dot (90 x)/(x + 2) = (2700 x)/(x + 2) " (nghìn đồng/ha)" $

        Chi phí thuốc trừ sâu:
        $ C(x) = 600 x " (nghìn đồng/ha)" $

        Hàm lợi ích ròng:
        $ f(x) = (2700 x)/(x + 2) - 600 x $

        Lấy đạo hàm bậc nhất theo $x > 0$:
        $ f'(x) = (2700(x + 2) - 2700 x) / (x + 2)^2 - 600 $
        $ = 5400 / (x + 2)^2 - 600 $

        Cho $f'(x) = 0$, ta có:
        $ 5400 / (x + 2)^2 = 600 $
        $ (x + 2)^2 = 5400 / 600 = 9 $
        $ x + 2 = 3 $
        $ x = 1 " (lít/ha)" $

        Vì $f'(x) > 0$ khi $0 < x < 1$ và $f'(x) < 0$ khi $x > 1$, hàm số đạt giá trị lớn nhất tại $x = 1$ lít/ha.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Theo nguyên lý sinh thái - kinh tế Gordon-Schaefer trong quản lý nghề cá, tổng doanh thu hàng năm từ việc đánh bắt phụ thuộc vào số chuyến tàu ra khơi $E$ theo công thức $R(E) = 120 E - 0.5 E^2$ (triệu đồng). Chi phí vận hành cho mỗi chuyến tàu đi biển là $c = 40$ triệu đồng. Mức nỗ lực đánh bắt $E$ để đạt lợi nhuận kinh tế ròng tối đa (MEY) là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$E$ (chuyến)])
    content((-0.5, 3.5), text(size: 8pt)[Tiền (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường doanh thu R(E)
    bezier((0, 0), (2.6, 2.8), (0.8, 1.8), (1.7, 2.8), stroke: 1.5pt + rgb("be123c"))
    bezier((2.6, 2.8), (5.2, 0), (3.5, 2.8), (4.4, 1.6), stroke: 1.5pt + rgb("be123c"))
    content((4.8, 1.2), text(size: 8pt, fill: rgb("be123c"))[$R(E)$])

    // Đường chi phí C(E)
    line((0, 0), (5.2, 2.6), stroke: 1.2pt + rgb("2563eb"))
    content((5.2, 2.8), text(size: 8pt, fill: rgb("2563eb"))[$C(E)$])

    // Khoảng cách lớn nhất (Lợi nhuận Max)
    line((1.8, 0.9), (1.8, 2.5), stroke: 1.2pt + rgb("15803d"))
    circle((1.8, 2.5), radius: 0.07, fill: rgb("be123c"), stroke: none)
    circle((1.8, 0.9), radius: 0.07, fill: rgb("2563eb"), stroke: none)

    content((1.8, -0.35), text(size: 8pt, fill: rgb("15803d"), weight: "bold")[$E = 80$])
    content((2.6, 1.7), text(size: 8pt, fill: rgb("15803d"))[Lợi nhuận ròng Max])
  })
]
],
    (
        True([$E = 80$ chuyến.]),
        [$E = 120$ chuyến.],
        [$E = 160$ chuyến.],
        [$E = 60$ chuyến.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Lợi nhuận kinh tế ròng $Pi(E)$ bằng tổng doanh thu trừ đi tổng chi phí vận hành:
        $ Pi(E) = R(E) - C(E) $
        Mức nỗ lực tối đa hóa lợi nhuận kinh tế (MEY) tương ứng với điểm cực đại của hàm số $Pi(E)$.

        #step([Lời giải chi tiết])
        Tổng chi phí vận hành cho $E$ chuyến đánh bắt:
        $ C(E) = 40 E " (triệu đồng)" $

        Hàm lợi nhuận ròng:
        $ Pi(E) = (120 E - 0.5 E^2) - 40 E $
        $ = 80 E - 0.5 E^2 $

        Đây là một hàm số bậc hai với hệ số $a = -0.5 < 0$.
        Hoành độ đỉnh parabol tương ứng với lợi nhuận cực đại:
        $ E = - b / (2 a) = - 80 / (2 dot (-0.5)) = 80 " (chuyến)" $

        Giá trị lợi nhuận tối đa thu được:
        $ Pi(80) = 80(80) - 0.5(80)^2 = 6400 - 3200 = 3200 " (triệu đồng)" $
        tương đương $3.2$ tỷ đồng mỗi năm.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một khu bảo tồn thả một loài chim quý hiếm có nguy cơ tuyệt chủng vào tự nhiên. Tốc độ thay đổi số lượng cá thể $N(t)$ tuân theo mô hình có ngưỡng sinh tồn tối thiểu (hiệu ứng Allee):
$ (d N) / (d t) = 0.05 N (N - 40) (1 - N / 1000) $
Để quần thể chim không bị suy giảm dẫn đến diệt vong, số cá thể chim ban đầu thả vào rừng tối thiểu phải lớn hơn:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục số pha (Phase line)
    line((-0.5, 0), (6.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6.5, -0.35), text(size: 8pt)[$N$])

    // Các điểm dừng
    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])

    circle((2.2, 0), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((2.2, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$40$ (Ngưỡng Allee)])

    circle((5.2, 0), radius: 0.08, fill: rgb("15803d"), stroke: none)
    content((5.2, -0.35), text(size: 8pt, fill: rgb("15803d"))[$1000$ ($K$)])

    // Mũi tên hướng suy giảm và phát triển
    line((1.8, 0.4), (0.9, 0.4), mark: (end: "stealth"), stroke: 1.2pt + rgb("be123c"))
    content((1.35, 0.7), text(size: 7.5pt, fill: rgb("be123c"))[Tuyệt chủng])

    line((2.6, 0.4), (4.8, 0.4), mark: (end: "stealth"), stroke: 1.2pt + rgb("15803d"))
    content((3.7, 0.7), text(size: 7.5pt, fill: rgb("15803d"))[Tăng trưởng bền vững])
  })
]
],
    (
        True([$40$ cá thể.]),
        [$20$ cá thể.],
        [$500$ cá thể.],
        [$1000$ cá thể.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Quần thể tăng trưởng khi và chỉ khi tốc độ thay đổi theo thời gian mang dấu dương:
        $ (d N) / (d t) > 0 $
        Ngược lại, nếu đạo hàm âm, số lượng cá thể sẽ suy giảm theo thời gian.

        #step([Lời giải chi tiết])
        Xét biểu thức $f(N) = 0.05 N (N - 40) (1 - N/1000)$ với số cá thể $N > 0$:
        - Khi $0 < N < 40$:
          Ta có $N - 40 < 0$ và $1 - N/1000 > 0$, suy ra $f(N) < 0$.
          Tốc độ $(d N)/(d t) < 0$ khiến số lượng chim giảm liên tục về 0, dẫn đến diệt vong.
        - Khi $40 < N < 1000$:
          Ta có $N - 40 > 0$ và $1 - N/1000 > 0$, suy ra $f(N) > 0$.
          Tốc độ $(d N)/(d t) > 0$ giúp quần thể chim sinh sôi, tiến dần về trạng thái cân bằng môi trường $K = 1000$.

        Do đó, $N = 40$ chính là ngưỡng sinh tồn tới hạn (Allee threshold). Số cá thể thả vào ban đầu phải vượt quá $40$ con.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Khi tiêm chủng phòng bệnh cho cộng đồng, để đạt miễn dịch cộng đồng ngăn dịch lây lan, tỷ lệ dân số được tiêm chủng $p$ ($0 < p < 1$) phải thỏa mãn $p >= 1 - 1/R_0$, với $R_0$ là hệ số lây nhiễm cơ bản. Nếu chi phí tiêm chủng cho tỷ lệ dân số $p$ là $C(p) = (20 p) / (1.05 - p)$ (tỷ đồng) và hệ số lây nhiễm là $R_0 = 4$. Chi phí tối thiểu để đạt mức bảo vệ miễn dịch cộng đồng là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$p$])
    content((-0.6, 3.5), text(size: 8pt)[$C(p)$ (tỷ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Tiệm cận đứng p = 1.05
    line((4.8, 0), (4.8, 3.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((4.8, -0.35), text(size: 8pt)[$1.05$])

    // Đường cong chi phí
    bezier((0, 0), (3.4, 2.2), (1.5, 0.5), (2.6, 1.2), stroke: 1.5pt + rgb("be123c"))
    bezier((3.4, 2.2), (4.5, 3.3), (3.8, 2.7), (4.2, 3.1), stroke: 1.5pt + rgb("be123c"))

    // Điểm p = 0.75
    line((3.4, 0), (3.4, 2.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((0, 2.2), (3.4, 2.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((3.4, 2.2), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((3.4, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$p = 0.75$])
    content((-0.8, 2.2), text(size: 8pt, fill: rgb("be123c"))[$50$ tỷ])
  })
]
],
    (
        True([$50$ tỷ đồng.]),
        [$40$ tỷ đồng.],
        [$60$ tỷ đồng.],
        [$75$ tỷ đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Xác định tỷ lệ tiêm chủng tối thiểu cần đạt theo công thức miễn dịch cộng đồng: $p >= 1 - 1/R_0$.
        - Khảo sát tính đơn điệu của hàm chi phí $C(p)$ trên miền xác định để kết luận giá trị nhỏ nhất.

        #step([Lời giải chi tiết])
        Với hệ số lây nhiễm cơ bản $R_0 = 4$, tỷ lệ tiêm chủng tối thiểu là:
        $ p >= 1 - 1/4 = 0.75 $

        Xét hàm chi phí tiêm chủng:
        $ C(p) = (20 p) / (1.05 - p) $

        Đạo hàm theo biến $p$:
        $ C'(p) = (20(1.05 - p) - 20 p (-1)) / (1.05 - p)^2 $
        $ = (21 - 20 p + 20 p) / (1.05 - p)^2 = 21 / (1.05 - p)^2 > 0 $

        Vì $C'(p) > 0$ với mọi $p in [0.75; 1]$, hàm số $C(p)$ đồng biến trên đoạn $[0.75; 1]$.
        Do đó, chi phí nhỏ nhất đạt được khi $p = 0.75$:
        $ C_"min" = C(0.75) = (20 dot 0.75) / (1.05 - 0.75) = 15 / 0.30 = 50 " (tỷ đồng)" $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Tốc độ phân hủy chất hữu cơ ô nhiễm trong một đoạn sông nhờ vi sinh vật phụ thuộc vào nồng độ oxy hòa tan $x$ (mg/L) theo mô hình: $v(x) = (12 x) / (x + 3)$ ($"mg" / ("L" dot "giờ") $). Nếu chi phí sục khí duy trì nồng độ oxy $x$ là $K(x) = 2 x$ (triệu đồng/ngày) và giá trị làm sạch môi trường quy đổi là $H(x) = 2 v(x) = (24 x) / (x + 3)$ (triệu đồng/ngày). Nồng độ oxy hòa tan $x$ cần duy trì để hiệu quả kinh tế ròng $f(x) = H(x) - K(x)$ đạt lớn nhất là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$x$ (mg/L)])
    content((-0.5, 3), text(size: 8pt)[$f(x)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 0), (2.2, 2.2), (0.7, 1.5), (1.4, 2.2), stroke: 1.5pt + rgb("be123c"))
    bezier((2.2, 2.2), (5, 0), (3.0, 2.2), (4.2, 0.8), stroke: 1.5pt + rgb("be123c"))

    line((2.2, 0), (2.2, 2.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.2, 2.2), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.2, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$x = 3$ mg/L])
    content((2.8, 2.6), text(size: 8pt, fill: rgb("be123c"))[Hiệu quả ròng tối đa])
  })
]
],
    (
        True([$x = 3$ mg/L.]),
        [$x = 4$ mg/L.],
        [$x = 2$ mg/L.],
        [$x = 5$ mg/L.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Thiết lập hàm mục tiêu kinh tế môi trường:
        $ f(x) = H(x) - K(x) = (24 x)/(x + 3) - 2 x $
        Khảo sát tìm cực đại của hàm số trên miền $x > 0$.

        #step([Lời giải chi tiết])
        Đạo hàm của $f(x)$ theo biến $x$:
        $ f'(x) = (24(x + 3) - 24 x) / (x + 3)^2 - 2 $
        $ = 72 / (x + 3)^2 - 2 $

        Giải phương trình $f'(x) = 0$:
        $ 72 / (x + 3)^2 = 2 $
        $ (x + 3)^2 = 72 / 2 = 36 $
        $ x + 3 = 6 $
        $ x = 3 " (mg/L)" $

        Ta có $f'(x) > 0$ khi $0 < x < 3$ và $f'(x) < 0$ khi $x > 3$.
        Vậy duy trì nồng độ oxy hòa tan ở mức $x = 3$ mg/L sẽ đem lại hiệu quả kinh tế ròng lớn nhất.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một đàn hươu trong một vườn quốc gia được bảo vệ nghiêm ngặt. Số lượng cá thể $N(t)$ sau $t$ năm ($t >= 0$) được mô hình hóa bởi phương trình tăng trưởng Logistic:
$ N(t) = 4000 / (1 + 7 e^(-0.25 t)) $
Tốc độ tăng trưởng cá thể của đàn hươu tại mỗi thời điểm được cho bởi đạo hàm $N'(t)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.8), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.8), text(size: 8pt)[$N(t)$ (con)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    line((0, 3.2), (5.5, 3.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((-1, 3.2), text(size: 8pt, fill: rgb("475569"))[$K = 4000$])

    line((0, 1.6), (2.8, 1.6), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    line((2.8, 0), (2.8, 1.6), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    content((-0.9, 1.6), text(size: 8pt, fill: rgb("be123c"))[$2000$])
    content((2.8, -0.35), text(size: 8pt, fill: rgb("be123c"))[$4 ln 7$])

    bezier((0, 0.5), (2.8, 1.6), (1.2, 0.6), (2.0, 1.1), stroke: 1.5pt + rgb("be123c"))
    bezier((2.8, 1.6), (5.5, 3.1), (3.6, 2.1), (4.6, 3.0), stroke: 1.5pt + rgb("be123c"))

    circle((2.8, 1.6), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((4, 1.3), text(size: 8pt, fill: rgb("be123c"))[Điểm uốn tốc độ Max])
  })
]
],
    (
        True([Tại thời điểm ban đầu ($t = 0$), số lượng cá thể trong đàn hươu là $500$ con.]),
        True([Sức chứa tối đa của môi trường sống vườn quốc gia đối với loài hươu này là $4000$ con.]),
        True([Tốc độ tăng trưởng số lượng cá thể của đàn hươu đạt giá trị lớn nhất tại thời điểm $t = 4 ln 7$ năm.]),
        [Tốc độ tăng trưởng số lượng cá thể lớn nhất của đàn hươu đạt được là $300$ con/năm.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Thay $t = 0$ vào công thức hàm số:
        $ N(0) = 4000 / (1 + 7 e^0) = 4000 / (1 + 7) = 4000 / 8 = 500 " (con)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Khi thời gian $t -> +infinity$, ta có số mũ âm $-0.25 t -> -infinity$ dẫn đến $e^(-0.25 t) -> 0$.
        Giới hạn của số lượng cá thể:
        $ lim_(t -> +infinity) N(t) = 4000 / (1 + 7 dot 0) = 4000 " (con)" $
        Đây chính là sức chứa giới hạn của môi trường. Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Đồ thị hàm Logistic đạt tốc độ tăng trưởng $N'(t)$ lớn nhất tại điểm uốn, tức là khi:
        $ N(t) = K / 2 = 4000 / 2 = 2000 $

        Giải phương trình:
        $ 4000 / (1 + 7 e^(-0.25 t)) = 2000 $
        $ 1 + 7 e^(-0.25 t) = 2 $
        $ 7 e^(-0.25 t) = 1 $
        $ e^(0.25 t) = 7 $
        $ 0.25 t = ln 7 $
        $ t = 4 ln 7 " (năm)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Theo phương trình vi phân Logistic:
        $ N'(t) = r N(t) (1 - N(t)/K) $
        với $r = 0.25$ và $K = 4000$.

        Tại điểm uốn ($N = 2000$), tốc độ tăng trưởng lớn nhất là:
        $ N'_"max" = 0.25 dot 2000 dot (1 - 2000/4000) $
        $ = 500 dot 0.5 = 250 " (con/năm)" $

        Con số $300$ con/năm trong đề bài là không chính xác (phải là $250$ con/năm). Khẳng định ý d là *SAI*.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Để quản lý bền vững một vùng biển có loài cá ngừ đại dương với sức chứa tự nhiên $K = 8000$ tấn và hệ số sinh trưởng tự nhiên $r = 0.5$ năm#super[-1]. Chi cục Thủy sản áp dụng mô hình thu hoạch Schaefer:
$ Y(E) = q E P $
trong đó $E$ là số ngày tàu đánh bắt được cấp phép hoạt động trong năm, $q = 0.0001$ là hệ số sản lượng trên mỗi đơn vị nỗ lực, và $P$ là sinh khối cá ngừ ở trạng thái cân bằng. Biết giá bán cá ngừ thương phẩm là $p = 60$ triệu đồng/tấn và chi phí vận hành cho mỗi ngày tàu đánh bắt là $c = 18$ triệu đồng/ngày.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$E$ (ngày tàu)])
    content((-0.6, 3.5), text(size: 8pt)[$Y, Pi$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường sản lượng Y(E)
    bezier((0, 0), (3, 2.7), (1.0, 1.8), (2.0, 2.7), stroke: 1.5pt + rgb("be123c"))
    bezier((3, 2.7), (6, 0), (4.0, 2.7), (5.0, 1.8), stroke: 1.5pt + rgb("be123c"))
    circle((3, 2.7), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((3, -0.35), text(size: 8pt, fill: rgb("be123c"))[$E_"MSY" = 2500$])
    content((3, 3.1), text(size: 8pt, fill: rgb("be123c"))[MSY = 1000 tấn])

    // Đường lợi nhuận Pi(E)
    bezier((0, 0), (1.9, 1.8), (0.6, 1.2), (1.3, 1.8), stroke: 1.5pt + rgb("15803d"))
    bezier((1.9, 1.8), (3.8, 0), (2.5, 1.8), (3.2, 1.0), stroke: 1.5pt + rgb("15803d"))
    circle((1.9, 1.8), radius: 0.08, fill: rgb("15803d"), stroke: none)
    content((1.9, -0.35), text(size: 8pt, fill: rgb("15803d"))[$E_"MEY" = 1562.5$])
    content((1.9, 2.2), text(size: 8pt, fill: rgb("15803d"))[Lợi nhuận Max])
  })
]
],
    (
        True([Ở trạng thái cân bằng sinh thái, sinh khối cá ngừ phụ thuộc vào nỗ lực đánh bắt theo hàm số $P(E) = 8000 - 1.6 E$ (tấn).]),
        True([Sản lượng đánh bắt bền vững tối đa (MSY) của khu bảo tồn là $1000$ tấn/năm.]),
        True([Nỗ lực đánh bắt để tối đa hóa sản lượng khai thác bền vững (MSY) là $E = 2500$ ngày tàu.]),
        True([Để tối đa hóa lợi nhuận kinh tế ròng (MEY), cơ quan quản lý chỉ nên cấp phép hoạt động $E = 1562.5$ ngày tàu/năm.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Ở trạng thái cân bằng bền vững, sản lượng thu hoạch bằng lượng sinh khối tăng trưởng tự nhiên:
        $ Y = G(P) $
        $ q E P = r P (1 - P/K) $

        Với $P > 0$, chia hai vế cho $P$:
        $ q E = 0.5 (1 - P/8000) $
        $ 1 - P/8000 = (0.0001 E)/0.5 = 0.0002 E $
        $ P(E) = 8000 (1 - 0.0002 E) = 8000 - 1.6 E " (tấn)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b và c])
        Sản lượng thu hoạch phụ thuộc vào nỗ lực $E$:
        $ Y(E) = q E P(E) = 0.0001 E (8000 - 1.6 E) = 0.8 E - 0.00016 E^2 $

        Đạo hàm tìm cực đại sản lượng (MSY):
        $ Y'(E) = 0.8 - 0.00032 E = 0 $
        $ E_"MSY" = 0.8 / 0.00032 = 2500 " (ngày tàu)" $

        Sản lượng khai thác tối đa:
        $ "MSY" = Y(2500) = 0.8(2500) - 0.00016(2500)^2 $
        $ = 2000 - 1000 = 1000 " (tấn/năm)" $
        Cả khẳng định ý b và ý c đều *ĐÚNG*.

        #step([Phân tích ý d])
        Hàm tổng doanh thu kinh tế:
        $ R(E) = p dot Y(E) = 60 (0.8 E - 0.00016 E^2) = 48 E - 0.0096 E^2 " (triệu đồng)" $

        Hàm tổng chi phí vận hành:
        $ C(E) = c E = 18 E " (triệu đồng)" $

        Lợi nhuận kinh tế ròng:
        $ Pi(E) = R(E) - C(E) = (48 E - 0.0096 E^2) - 18 E $
        $ = 30 E - 0.0096 E^2 $

        Lợi nhuận ròng đạt cực đại khi:
        $ Pi'(E) = 30 - 0.0192 E = 0 $
        $ E_"MEY" = 30 / 0.0192 = 1562.5 " (ngày tàu)" $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một bệnh nhân suy tim được điều trị bằng thuốc trợ tim theo đường uống. Nồng độ thuốc trong máu sau khi uống một liều duy nhất tuân theo mô hình dược động học:
$ C(t) = 50 (e^(-0.1 t) - e^(-0.5 t)) quad (mu"g/mL", t >= 0 "giờ") $
Biết ngưỡng điều trị an toàn và hiệu quả của thuốc là từ $15 mu"g/mL"$ đến $35 mu"g/mL"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.8), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (h)])
    content((-0.6, 3.8), text(size: 8pt)[$C(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Vùng điều trị an toàn [15; 35]
    rect((0, 1.5), (5.5, 3.5), fill: rgb("dcfce7"), stroke: none)
    line((0, 3.5), (5.5, 3.5), stroke: (dash: "dashed", paint: rgb("16a34a")))
    line((0, 1.5), (5.5, 1.5), stroke: (dash: "dashed", paint: rgb("16a34a")))
    content((4.5, 3.2), text(size: 7.5pt, fill: rgb("15803d"))[Vùng an toàn [15; 35]])

    // Đồ thị nồng độ
    bezier((0, 0), (2.2, 2.7), (0.6, 2.0), (1.4, 2.7), stroke: 1.5pt + rgb("be123c"))
    bezier((2.2, 2.7), (5.5, 1.6), (3.2, 2.7), (4.5, 2.0), stroke: 1.5pt + rgb("be123c"))

    line((2.2, 0), (2.2, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.2, 2.7), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((2.2, -0.35), text(size: 8pt, fill: rgb("be123c"))[$2.5 ln 5$])
    content((2.2, 2.95), text(size: 8pt, fill: rgb("be123c"))[$26.75 mu$g/mL])
  })
]
],
    (
        True([Nồng độ thuốc trong máu đạt giá trị lớn nhất sau thời điểm uống thuốc khoảng $t = 2.5 ln 5$ giờ.]),
        [Nồng độ thuốc cao nhất trong máu bệnh nhân vượt quá ngưỡng an toàn $35 mu"g/mL"$.],
        True([Sau $t = 10$ giờ, nồng độ thuốc trong máu giảm xuống dưới $18.5 mu"g/mL"$.]),
        True([Tốc độ giảm nồng độ thuốc trong máu diễn ra nhanh nhất tại thời điểm $t = 5 ln 5$ giờ.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Đạo hàm hàm nồng độ thuốc:
        $ C'(t) = 50 (-0.1 e^(-0.1 t) + 0.5 e^(-0.5 t)) $
        $ = 5 (5 e^(-0.5 t) - e^(-0.1 t)) $

        Giải phương trình $C'(t) = 0$:
        $ 5 e^(-0.5 t) = e^(-0.1 t) $
        $ e^(0.4 t) = 5 $
        $ 0.4 t = ln 5 $
        $ t = (ln 5) / 0.4 = 2.5 ln 5 " (giờ)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Tính nồng độ cực đại tại $t = 2.5 ln 5 approx 4.0236$ giờ:
        $ e^(-0.1 t) = 5^(-0.25) approx 0.66874 $
        $ e^(-0.5 t) = 5^(-1.25) approx 0.13375 $
        $ C_"max" = 50 (0.66874 - 0.13375) approx 26.75 mu"g/mL" $

        Vì $26.75 < 35$, nồng độ đỉnh hoàn toàn nằm trong ngưỡng an toàn cho phép ($[15; 35] mu"g/mL"$).
        Khẳng định nói vượt quá ngưỡng an toàn là *SAI*.

        #step([Phân tích ý c])
        Tính nồng độ sau $10$ giờ:
        $ C(10) = 50 (e^(-1) - e^(-5)) $
        $ approx 50 (0.36788 - 0.00674) = 50 dot 0.36114 approx 18.06 mu"g/mL" $
        Vì $18.06 < 18.5$, khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tốc độ suy giảm nồng độ thuốc là $-C'(t)$.
        Tốc độ này đạt giá trị lớn nhất khi $C''(t) = 0$:
        $ C''(t) = 5 (-2.5 e^(-0.5 t) + 0.1 e^(-0.1 t)) = 0 $
        $ 2.5 e^(-0.5 t) = 0.1 e^(-0.1 t) $
        $ e^(0.4 t) = 25 $
        $ 0.4 t = ln 25 = 2 ln 5 $
        $ t = (2 ln 5) / 0.4 = 5 ln 5 " (giờ)" $
        Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một nhóm chuyên gia dịch tễ nghiên cứu đợt bùng phát của một chủng virus lây truyền qua đường hô hấp tại một thành phố có $100000$ dân. Số ca nhiễm bệnh tích lũy $S(t)$ sau $t$ ngày được dự báo bởi mô hình:
$ S(t) = 100000 / (1 + 999 e^(-0.2 t)) $
Ngành y tế thành phố theo dõi sát sao số ca nhiễm mới hàng ngày $v(t) = S'(t)$ để kích hoạt các kịch bản ứng phó bệnh viện dã chiến.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.8), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (ngày)])
    content((-0.6, 3.8), text(size: 8pt)[$S(t)$ (ca)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    line((0, 3.2), (5.5, 3.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((-1, 3.2), text(size: 8pt, fill: rgb("475569"))[$100000$])

    line((0, 1.6), (2.8, 1.6), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    line((2.8, 0), (2.8, 1.6), stroke: (dash: "dotted", paint: rgb("cbd5e1")))
    content((-0.9, 1.6), text(size: 8pt, fill: rgb("be123c"))[$50000$])
    content((2.8, -0.35), text(size: 8pt, fill: rgb("be123c"))[$t approx 34.5$])

    bezier((0, 0.2), (2.8, 1.6), (1.4, 0.3), (2.1, 1.1), stroke: 1.5pt + rgb("be123c"))
    bezier((2.8, 1.6), (5.5, 3.1), (3.5, 2.1), (4.5, 3.0), stroke: 1.5pt + rgb("be123c"))

    circle((2.8, 1.6), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((3.8, 1.2), text(size: 8pt, fill: rgb("be123c"))[Đỉnh dịch: 5000 ca/ngày])
  })
]
],
    (
        True([Vào ngày đầu tiên ghi nhận dịch ($t = 0$), thành phố có $100$ ca nhiễm bệnh tích lũy.]),
        True([Tốc độ lây lan của dịch bệnh đạt mức đỉnh điểm vào khoảng ngày thứ 35.]),
        True([Tại thời điểm đỉnh dịch bùng phát, số ca nhiễm mới trong ngày đạt $5000$ ca/ngày.]),
        True([Sau $50$ ngày kể từ ca đầu tiên, tổng số người bị nhiễm bệnh tích lũy vượt quá $90000$ người.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Thay $t = 0$ vào hàm số số ca nhiễm:
        $ S(0) = 100000 / (1 + 999 e^0) = 100000 / 1000 = 100 " (người)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Đỉnh dịch xảy ra khi tốc độ lây lan $S'(t)$ đạt cực đại.
        Đây chính là điểm uốn của hàm Logistic, tương ứng:
        $ S(t) = 100000 / 2 = 50000 $

        Giải phương trình:
        $ 100000 / (1 + 999 e^(-0.2 t)) = 50000 $
        $ 1 + 999 e^(-0.2 t) = 2 $
        $ 999 e^(-0.2 t) = 1 $
        $ e^(0.2 t) = 999 $
        $ t = (ln 999) / 0.2 = 5 ln 999 approx 5 dot 6.90675 approx 34.53 " (ngày)" $
        Thời điểm này rơi vào khoảng ngày thứ 35. Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Theo phương trình vi phân Logistic:
        $ S'(t) = 0.2 S(t) (1 - S(t)/100000) $

        Tại đỉnh dịch ($S = 50000$):
        $ S'_"max" = 0.2 dot 50000 dot (1 - 50000/100000) $
        $ = 10000 dot 0.5 = 5000 " (ca/ngày)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tính số ca tích lũy sau $50$ ngày:
        $ t = 50 => -0.2 dot 50 = -10 $
        $ e^(-10) approx 0.0000454 $
        $ S(50) = 100000 / (1 + 999 dot e^(-10)) approx 100000 / (1 + 0.04535) approx 95662 " (người)" $
        Vì $95662 > 90000$, khẳng định ý d là *ĐÚNG*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một khu rừng trồng cây gỗ công nghiệp có sinh khối gỗ sau $t$ năm tuân theo quy luật Logistic $V(t) = 500 / (1 + 9 e^(-0.1 t))$ ($m^3$/ha). Tốc độ tích lũy gỗ hàng năm lớn nhất của khu rừng đạt bao nhiêu mét khối trên một hecta trong một năm ($m^3$/ha/năm)? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$V$ ($m^3$/ha)])
    content((-0.6, 3.2), text(size: 8pt)[$V'(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 0), (2.4, 2.2), (0.8, 1.4), (1.6, 2.2), stroke: 1.5pt + rgb("be123c"))
    bezier((2.4, 2.2), (4.8, 0), (3.2, 2.2), (4.0, 1.4), stroke: 1.5pt + rgb("be123c"))

    line((2.4, 0), (2.4, 2.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((0, 2.2), (2.4, 2.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.4, 2.2), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.4, -0.35), text(size: 8pt)[$V = 250$])
    content((-0.9, 2.2), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$12.5$])
  })
]
],
    [13],
    loigiai: [
        #step([Lời giải chi tiết])
        Mô hình Logistic của sinh khối rừng có:
        - Giới hạn sinh khối môi trường: $K = 500$ ($m^3$/ha).
        - Hệ số tăng trưởng: $r = 0.1$.

        Tốc độ tích lũy gỗ hàng năm được mô tả bằng phương trình vi phân:
        $ V'(t) = r V(t) (1 - V(t)/K) $
        $ = 0.1 V(t) (1 - V(t)/500) $

        Đây là hàm số bậc hai theo biến sinh khối $V$.
        Giá trị lớn nhất của tốc độ tích lũy đạt được tại:
        $ V = K / 2 = 500 / 2 = 250 " (m"^3"/ha)" $

        Tốc độ tích lũy gỗ lớn nhất:
        $ V'_"max" = 0.1 dot 250 dot (1 - 250/500) $
        $ = 25 dot 0.5 = 12.5 " (m"^3"/ha/năm)" $

        Làm tròn kết quả đến hàng đơn vị theo yêu cầu đề bài:
        $ 12.5 approx 13 $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một chủ trang trại nuôi bò thịt khảo sát thấy hàm trọng lượng của bò theo tháng tuổi $t$ là $W(t) = 600 - 550 e^(-0.05 t)$ (kg). Giá bán thịt bò hơi ổn định ở mức $80$ nghìn đồng/kg. Chi phí thức ăn và chăm sóc nuôi dưỡng tích lũy cho mỗi con bò sau $t$ tháng là $C(t) = 400 t + 12000$ (nghìn đồng). Để lợi nhuận từ việc bán bò đạt giá trị cao nhất, chủ trang trại nên xuất chuồng bò vào tháng thứ bao nhiêu? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$t$ (tháng)])
    content((-0.6, 3.2), text(size: 8pt)[$Pi(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 0.4), (2.5, 2.4), (0.8, 1.8), (1.7, 2.4), stroke: 1.5pt + rgb("be123c"))
    bezier((2.5, 2.4), (5.0, 1.0), (3.3, 2.4), (4.2, 1.7), stroke: 1.5pt + rgb("be123c"))

    line((2.5, 0), (2.5, 2.4), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.5, 2.4), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.5, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$t approx 34$ tháng])
    content((2.5, 2.8), text(size: 8pt, fill: rgb("be123c"))[Lợi nhuận xuất chuồng Max])
  })
]
],
    [34],
    loigiai: [
        #step([Lời giải chi tiết])
        Doanh thu khi xuất chuồng bán một con bò sau $t$ tháng nuôi:
        $ R(t) = 80 dot W(t) = 80 (600 - 550 e^(-0.05 t)) $
        $ = 48000 - 44000 e^(-0.05 t) " (nghìn đồng)" $

        Tổng lợi nhuận ròng thu được:
        $ Pi(t) = R(t) - C(t) $
        $ = (48000 - 44000 e^(-0.05 t)) - (400 t + 12000) $
        $ = 36000 - 44000 e^(-0.05 t) - 400 t $

        Lấy đạo hàm của hàm lợi nhuận theo thời gian $t$:
        $ Pi'(t) = - 44000 dot (-0.05 e^(-0.05 t)) - 400 $
        $ = 2200 e^(-0.05 t) - 400 $

        Cho $Pi'(t) = 0$, ta giải phương trình:
        $ 2200 e^(-0.05 t) = 400 $
        $ e^(-0.05 t) = 400 / 2200 = 2 / 11 $
        $ e^(0.05 t) = 11 / 2 = 5.5 $
        $ 0.05 t = ln 5.5 $
        $ t = (ln 5.5) / 0.05 = 20 ln 5.5 $
        $ t approx 20 dot 1.70475 approx 34.095 " (tháng)" $

        Làm tròn kết quả đến hàng đơn vị: Chủ trang trại nên xuất chuồng bò vào tháng thứ $34$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một hồ nuôi cá nước ngọt có tốc độ tái sinh khối cá tự nhiên tuân theo mô hình Schaefer: $G(P) = 0.8 P - 0.0002 P^2$ (tấn/năm), với $P$ là sinh khối cá hiện có trong hồ (tấn). Chính quyền địa phương muốn khai thác bền vững sao cho sản lượng đánh bắt hàng năm luôn đạt mức cực đại (MSY). Trữ lượng cá sinh khối $P$ (tấn) cần duy trì trong hồ là bao nhiêu tấn?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$P$ (tấn)])
    content((-0.6, 3.2), text(size: 8pt)[$G(P)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 0), (2.4, 2.3), (0.8, 1.4), (1.6, 2.3), stroke: 1.5pt + rgb("be123c"))
    bezier((2.4, 2.3), (4.8, 0), (3.2, 2.3), (4.0, 1.4), stroke: 1.5pt + rgb("be123c"))

    line((2.4, 0), (2.4, 2.3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.4, 2.3), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.4, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$P = 2000$ tấn])
    content((4.8, -0.35), text(size: 8pt)[$4000$])
    content((2.4, 2.7), text(size: 8pt, fill: rgb("be123c"))[Sản lượng cực đại MSY])
  })
]
],
    [2000],
    loigiai: [
        #step([Lời giải chi tiết])
        Hàm tốc độ tăng trưởng tự nhiên của đàn cá:
        $ G(P) = - 0.0002 P^2 + 0.8 P $

        Đây là một tam thức bậc hai có bề lõm quay xuống do hệ số $a = -0.0002 < 0$.
        Sản lượng khai thác bền vững $Y(P) = G(P)$ đạt giá trị lớn nhất (MSY) tại hoành độ đỉnh của parabol:
        $ P = - b / (2 a) $
        $ = - 0.8 / (2 dot (-0.0002)) $
        $ = 0.8 / 0.0004 = 2000 " (tấn)" $

        Vậy cần duy trì trữ lượng sinh khối cá trong hồ ổn định ở mức $2000$ tấn.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Theo mô hình dịch tễ học lây truyền trong một quần thể khép kín có quy mô $N = 10000$ người, số ca lây nhiễm virus tại thời điểm tốc độ phát sinh ca mới đạt đỉnh điểm là bao nhiêu người?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$I$ (người)])
    content((-0.6, 3.2), text(size: 8pt)[$I'(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 0), (2.4, 2.3), (0.8, 1.4), (1.6, 2.3), stroke: 1.5pt + rgb("be123c"))
    bezier((2.4, 2.3), (4.8, 0), (3.2, 2.3), (4.0, 1.4), stroke: 1.5pt + rgb("be123c"))

    line((2.4, 0), (2.4, 2.3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.4, 2.3), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.4, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$I = 5000$])
    content((4.8, -0.35), text(size: 8pt)[$N = 10000$])
    content((2.4, 2.7), text(size: 8pt, fill: rgb("be123c"))[Tốc độ phát sinh ca mới Max])
  })
]
],
    [5000],
    loigiai: [
        #step([Lời giải chi tiết])
        Trong mô hình dịch tễ học Logistic, số ca nhiễm tích lũy $I(t)$ thỏa mãn phương trình vi phân:
        $ I'(t) = r I(t) (1 - I(t)/N) $
        trong đó:
        - $N = 10000$ là quy mô toàn bộ dân số.
        - $I'(t)$ là tốc độ lây lan phát sinh ca nhiễm mới hàng ngày.

        Hàm tốc độ $f(I) = r I (1 - I/N) = - r/N I^2 + r I$ là tam thức bậc hai theo $I$, đạt giá trị lớn nhất tại đỉnh parabol:
        $ I = N / 2 $

        Thay $N = 10000$:
        $ I = 10000 / 2 = 5000 " (người)" $

        Vậy tại thời điểm đỉnh dịch bùng phát dữ dội nhất, trong cộng đồng có đúng $5000$ người đã nhiễm bệnh.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Một xí nghiệp nuôi nghêu ven biển khảo sát thấy lợi nhuận hàng năm phụ thuộc vào nỗ lực thu hoạch $E$ (số ngày cào nghêu) theo công thức: $Pi(E) = - 0.2 E^2 + 48 E - 800$ (triệu đồng). Để tối đa hóa lợi nhuận kinh tế, xí nghiệp cần thực hiện bao nhiêu ngày thu hoạch trong năm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$E$ (ngày)])
    content((-0.6, 3.2), text(size: 8pt)[$Pi(E)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0.4, 0), (2.4, 2.3), (1.0, 1.4), (1.7, 2.3), stroke: 1.5pt + rgb("be123c"))
    bezier((2.4, 2.3), (4.6, 0), (3.1, 2.3), (3.9, 1.2), stroke: 1.5pt + rgb("be123c"))

    line((2.4, 0), (2.4, 2.3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.4, 2.3), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.4, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$E = 120$ ngày])
    content((2.4, 2.7), text(size: 8pt, fill: rgb("be123c"))[Lợi nhuận ròng Max])
  })
]
],
    [120],
    loigiai: [
        #step([Lời giải chi tiết])
        Hàm lợi nhuận của xí nghiệp:
        $ Pi(E) = - 0.2 E^2 + 48 E - 800 $

        Đây là một hàm số bậc hai có hệ số $a = -0.2 < 0$.
        Đồ thị là một parabol có đỉnh cực đại tại:
        $ E = - b / (2 a) $
        $ = - 48 / (2 dot (-0.2)) $
        $ = 48 / 0.4 = 120 " (ngày)" $

        Vậy để thu về lợi nhuận cao nhất, xí nghiệp cần thực hiện $120$ ngày thu hoạch trong năm.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd01I — Mã 509], back-to: "sec-exercise-hub",[Để xử lý nước thải công nghiệp nhiễm kim loại nặng trong hồ chứa sinh học, nồng độ chất ô nhiễm sau $t$ ngày xử lý bằng vi sinh vật biến tính được xác định bởi: $C(t) = 120 e^(-0.05 t)$ (mg/L). Chi phí vận hành trạm vi sinh mỗi ngày là $0.5$ triệu đồng/ngày. Giá trị thiệt hại môi trường tồn đọng sau $t$ ngày là $D(t) = 0.25 C(t)$ triệu đồng. Tổng chi phí gồm phí vận hành và thiệt hại tồn đọng là $T(t) = 0.5 t + 30 e^(-0.05 t)$. Thời gian xử lý $t$ (ngày) để tổng chi phí nhỏ nhất là bao nhiêu ngày? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$t$ (ngày)])
    content((-0.6, 3.2), text(size: 8pt)[$T(t)$ (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường chi phí chữ U có cực tiểu
    bezier((0.5, 2.8), (2.4, 1.2), (1.0, 1.5), (1.7, 1.2), stroke: 1.5pt + rgb("be123c"))
    bezier((2.4, 1.2), (4.8, 2.6), (3.1, 1.2), (4.0, 1.8), stroke: 1.5pt + rgb("be123c"))

    line((2.4, 0), (2.4, 1.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((2.4, 1.2), radius: 0.08, fill: rgb("be123c"), stroke: none)

    content((2.4, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$t approx 22$ ngày])
    content((2.4, 0.8), text(size: 8pt, fill: rgb("be123c"))[Tổng chi phí Min])
  })
]
],
    [22],
    loigiai: [
        #step([Lời giải chi tiết])
        Xét hàm tổng chi phí trên miền $t >= 0$:
        $ T(t) = 0.5 t + 30 e^(-0.05 t) $

        Lấy đạo hàm bậc nhất theo $t$:
        $ T'(t) = 0.5 + 30 dot (-0.05) e^(-0.05 t) $
        $ = 0.5 - 1.5 e^(-0.05 t) $

        Giải phương trình $T'(t) = 0$:
        $ 1.5 e^(-0.05 t) = 0.5 $
        $ e^(-0.05 t) = 0.5 / 1.5 = 1 / 3 $
        $ e^(0.05 t) = 3 $
        $ 0.05 t = ln 3 $
        $ t = (ln 3) / 0.05 = 20 ln 3 $
        $ t approx 20 dot 1.09861 approx 21.972 " (ngày)" $

        Bảng xét dấu cho thấy $T'(t) < 0$ khi $t < 21.97$ và $T'(t) > 0$ khi $t > 21.97$.
        Do đó hàm số đạt giá trị nhỏ nhất tại $t approx 21.97$ ngày.

        Làm tròn kết quả đến hàng đơn vị theo yêu cầu: $22$ ngày.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHỦ ĐỀ 1I: MÔ HÌNH SINH THÁI, KHAI THÁC BỀN VỮNG & DỊCH TỄ (VD - VDC)!]      #v(0.6em)
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
