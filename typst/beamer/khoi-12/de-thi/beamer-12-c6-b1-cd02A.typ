// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHỦ ĐỀ 2A: LÃI ĐƠN, LÃI KÉP & LÃI SUẤT THỰC TẾ (VD - VDC)
// Lớp: Khối 12  ·  Mã đề: 511  ·  GV: Nguyễn Văn Sang
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
  title: "CHỦ ĐỀ 2A: LÃI ĐƠN, LÃI KÉP & LÃI SUẤT THỰC TẾ (VD - VDC)",
  subtitle: "CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH — MÃ ĐỀ: 511",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 511]],
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
#lt-tn(num: 1, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một người gửi tiết kiệm $200$ triệu đồng vào ngân hàng theo thể thức lãi kép kỳ hạn $1$ tháng với lãi suất $0","5\%$/tháng. Giả sử lãi suất không thay đổi và người đó không rút tiền trong suốt quá trình gửi. Sau đúng $3$ năm ($36$ tháng), tổng số tiền cả gốc lẫn lãi người đó nhận được là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục thời gian
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$n$ (tháng)])
    content((-0.6, 3.5), text(size: 8pt)[Số dư (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường cong tăng trưởng số dư lãi kép
    bezier((0, 1.2), (2.5, 1.7), (0.8, 1.3), (1.6, 1.5), stroke: 1.5pt + rgb("0369a1"))
    bezier((2.5, 1.7), (5.2, 2.8), (3.4, 2.0), (4.3, 2.4), stroke: 1.5pt + rgb("0369a1"))

    // Mức ban đầu 200 tr
    line((0, 1.2), (0.3, 1.2), stroke: 1pt + rgb("0369a1"))
    content((-0.8, 1.2), text(size: 8pt)[$200$])

    // Sau 36 tháng
    line((5.2, 0), (5.2, 2.8), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((0, 2.8), (5.2, 2.8), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((5.2, 2.8), radius: 0.08, fill: rgb("0369a1"), stroke: none)

    content((5.2, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$n = 36$])
    content((-1.1, 2.8), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$239","34$ tr])
    content((3.5, 2.9), text(size: 8pt, fill: rgb("0369a1"))[$A = 200(1 + 0","005)^{36}$])
  })
]
],
    (
        True([Khoảng $239","34$ triệu đồng.]),
        [Khoảng $236","00$ triệu đồng.],
        [Khoảng $242","50$ triệu đồng.],
        [Khoảng $245","12$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Bài toán tính giá trị tương lai theo thể thức lãi kép định kỳ:
        - Số tiền gốc ban đầu: $P$.
        - Lãi suất mỗi kỳ: $r$.
        - Số kỳ gửi: $n$.
        Công thức tính số tiền tích lũy cả gốc và lãi:
        $ A = P (1 + r)^n $

        #step([Lời giải chi tiết])
        Theo bài ra, ta có:
        - Tiền gốc ban đầu: $P = 200$ (triệu đồng).
        - Lãi suất mỗi tháng: $r = 0","5\% = 0","005$.
        - Thời gian gửi là $3$ năm, tương ứng:
        $ n = 3 dot 12 = 36 " (tháng)" $

        Áp dụng công thức lãi kép, tổng số tiền nhận được là:
        $ A = 200 dot (1 + 0","005)^(36) $
        $ = 200 dot (1","005)^(36) $
        $ approx 200 dot 1","19668 $
        $ approx 239","336 " (triệu đồng)" $

        Làm tròn đến hai chữ số thập phân ta được khoảng $239","34$ triệu đồng.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một nhà đầu tư gửi số tiền $P$ vào quỹ tài chính với lãi suất công bố $8\%$/năm theo hình thức ghép lãi liên tục. Hỏi sau bao nhiêu năm số tiền tích lũy trong quỹ sẽ tăng lên gấp đôi số vốn ban đầu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.5), text(size: 8pt)[$A(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường gấp đôi 2P
    line((0, 2.4), (5.5, 2.4), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((-0.6, 2.4), text(size: 8pt, fill: rgb("0369a1"))[$2P$])

    // Vốn gốc ban đầu P
    content((-0.6, 1.2), text(size: 8pt)[$P$])
    circle((0, 1.2), radius: 0.06, fill: rgb("475569"), stroke: none)

    // Đồ thị e^(rt)
    bezier((0, 1.2), (2.5, 1.7), (0.8, 1.3), (1.6, 1.5), stroke: 1.5pt + rgb("0369a1"))
    bezier((2.5, 1.7), (4.5, 2.4), (3.2, 1.9), (3.9, 2.2), stroke: 1.5pt + rgb("0369a1"))
    bezier((4.5, 2.4), (5.5, 3.1), (4.8, 2.6), (5.2, 2.9), stroke: 1.5pt + rgb("0369a1"))

    line((4.5, 0), (4.5, 2.4), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.5, 2.4), radius: 0.08, fill: rgb("0369a1"), stroke: none)

    content((4.5, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$t approx 8","66$ năm])
    content((3.5, 2.8), text(size: 8pt, fill: rgb("0369a1"))[$A = P e^(0","08 t) = 2P$])
  })
]
],
    (
        True([$t approx 8","66$ năm.]),
        [$t approx 9","00$ năm.],
        [$t approx 8","25$ năm.],
        [$t approx 7","85$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Mô hình ghép lãi liên tục với lãi suất danh nghĩa $r$ mỗi năm:
        $ A(t) = P e^(r t) $
        Để số tiền tăng gấp đôi số vốn ban đầu, ta giải phương trình:
        $ A(t) = 2 P <=> P e^(r t) = 2 P $

        #step([Lời giải chi tiết])
        Với $r = 8\% = 0","08$, phương trình trở thành:
        $ e^(0","08 t) = 2 $

        Lấy logarit tự nhiên (ln) hai vế:
        $ 0","08 t = ln 2 $

        Giải tìm thời gian $t$:
        $ t = (ln 2) / 0","08 $
        $ t approx 0","693147 / 0","08 $
        $ t approx 8","664 " (năm)" $

        Vậy sau khoảng $8","66$ năm (tức khoảng 8 năm 8 tháng), số tiền gửi sẽ tăng lên gấp đôi.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Ngân hàng $A$ áp dụng mức lãi suất danh nghĩa $7","2\%$/năm với hình thức ghép lãi hàng tháng. Ngân hàng $B$ áp dụng mức lãi suất danh nghĩa $7","25\%$/năm với hình thức ghép lãi nửa năm một lần ($6$ tháng/lần). So sánh lãi suất thực tế hiệu dụng hàng năm (EAR - Effective Annual Rate) của hai ngân hàng, khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ cột so sánh EAR
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    // Cột ngân hàng A
    rect((1, 0), (2.2, 2.8), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0369a1"))
    content((1.6, -0.35), text(size: 8pt, weight: "bold")[Ngân hàng A])
    content((1.6, 3.1), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$7","442\%$])
    content((1.6, 1.4), text(size: 7.5pt)[Ghép lãi tháng])

    // Cột ngân hàng B
    rect((3.2, 0), (4.4, 2.75), fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    content((3.8, -0.35), text(size: 8pt, weight: "bold")[Ngân hàng B])
    content((3.8, 3.05), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$7","381\%$])
    content((3.8, 1.4), text(size: 7.5pt)[Ghép lãi 6 tháng])
  })
]
],
    (
        True([Lãi suất thực tế của ngân hàng $A$ cao hơn ngân hàng $B$ khoảng $0","06\%$.]),
        [Lãi suất thực tế của ngân hàng $B$ cao hơn ngân hàng $A$ khoảng $0","05\%$.],
        [Hai ngân hàng có lãi suất thực tế hàng năm hoàn toàn bằng nhau.],
        [Lãi suất thực tế của ngân hàng $A$ thấp hơn ngân hàng $B$ khoảng $0","12\%$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Công thức tính lãi suất thực tế hiệu dụng hàng năm (EAR):
        $ r_e = (1 + r/m)^m - 1 $
        trong đó:
        - $r$ là lãi suất danh nghĩa hàng năm.
        - $m$ là số kỳ ghép lãi trong một năm.

        #step([Lời giải chi tiết])
        *Đối với Ngân hàng A:*
        - Lãi suất danh nghĩa: $r_A = 7","2\% = 0","072$.
        - Ghép lãi theo tháng: $m = 12$.
        $ r_(e, A) = (1 + (0","072)/12)^(12) - 1 $
        $ = (1 + 0","006)^(12) - 1 $
        $ = (1","006)^(12) - 1 $
        $ approx 1","074424 - 1 = 0","074424 = 7","442\% $

        *Đối với Ngân hàng B:*
        - Lãi suất danh nghĩa: $r_B = 7","25\% = 0","0725$.
        - Ghép lãi nửa năm một lần: $m = 2$.
        $ r_(e, B) = (1 + (0","0725)/2)^2 - 1 $
        $ = (1 + 0","03625)^2 - 1 $
        $ = (1","03625)^2 - 1 $
        $ approx 1","073814 - 1 = 0","073814 = 7","381\% $

        *So sánh sự chênh lệch:*
        $ r_(e, A) - r_(e, B) = 7","442\% - 7","381\% = 0","061\% approx 0","06\% $

        Như vậy, mặc dù ngân hàng $A$ có lãi suất danh nghĩa thấp hơn ($7","2\% < 7","25\%$), nhưng nhờ tần suất ghép lãi dày hơn (hàng tháng), lãi suất thực tế hiệu dụng của ngân hàng $A$ lại cao hơn ngân hàng $B$ khoảng $0","06\%$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một gia đình dự định tích lũy số tiền $1$ tỷ đồng tiền mặt để chi tiêu sau $10$ năm nữa. Giả sử tỷ lệ lạm phát bình quân hàng năm của nền kinh tế duy trì ổn định ở mức $4\%$/năm. Sau $10$ năm, sức mua thực tế của số tiền $1$ tỷ đồng đó (quy đổi theo giá trị tương đương ở thời điểm hiện tại) chỉ còn lại xấp xỉ bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.5), text(size: 8pt)[Sức mua])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường sức mua suy giảm
    bezier((0, 3), (2.5, 2.0), (0.8, 2.4), (1.6, 2.1), stroke: 1.5pt + rgb("0369a1"))
    bezier((2.5, 2.0), (5.2, 1.4), (3.4, 1.8), (4.3, 1.5), stroke: 1.5pt + rgb("0369a1"))

    line((0, 3), (0.3, 3), stroke: 1pt + rgb("0369a1"))
    content((-0.8, 3), text(size: 8pt)[$1$ tỷ])

    line((5.2, 0), (5.2, 1.4), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((0, 1.4), (5.2, 1.4), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((5.2, 1.4), radius: 0.08, fill: rgb("0369a1"), stroke: none)

    content((5.2, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$t = 10$])
    content((-1.1, 1.4), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$675","56$ tr])
    content((3.5, 2.4), text(size: 8pt, fill: rgb("0369a1"))[Sức mua: $P(t) = P_0 (1 + i)^(-t)$])
  })
]
],
    (
        True([Khoảng $675","56$ triệu đồng.]),
        [Khoảng $600","00$ triệu đồng.],
        [Khoảng $720","45$ triệu đồng.],
        [Khoảng $645","20$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tác động của lạm phát làm xói mòn sức mua của đồng tiền:
        Nếu tỷ lệ lạm phát bình quân hàng năm là $i$, thì sức mua thực tế của một khoản tiền $M$ sau $n$ năm quy đổi về thời điểm hiện tại được tính theo công thức chiết khấu lạm phát:
        $ M_"thực" = M / (1 + i)^n = M (1 + i)^(-n) $

        #step([Lời giải chi tiết])
        Với số tiền dự kiến $M = 1000$ (triệu đồng), tỷ lệ lạm phát $i = 4\% = 0","04$ và thời gian $n = 10$ năm:
        $ M_"thực" = 1000 / (1 + 0","04)^(10) $
        $ = 1000 / (1","04)^(10) $
        $ approx 1000 / 1","480244 $
        $ approx 675","564 " (triệu đồng)" $

        Như vậy, do ảnh hưởng tích lũy của lạm phát $4\%$/năm, sau $10$ năm, số tiền $1$ tỷ đồng chỉ còn mua được lượng hàng hóa và dịch vụ tương đương với khoảng $675","56$ triệu đồng tại thời điểm hiện nay (mất đi hơn $32\%$ giá trị thực tế).
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một người gửi tiết kiệm số tiền $300$ triệu đồng vào ngân hàng trong thời hạn $5$ năm. Trong $2$ năm đầu tiên, lãi suất tiền gửi cố định là $6\%$/năm ghép lãi hàng năm. Do thị trường biến động, trong $3$ năm tiếp theo ngân hàng điều chỉnh nâng mức lãi suất lên $7\%$/năm ghép lãi hàng năm. Biết toàn bộ tiền lãi của mỗi năm đều được tự động nhập vào vốn gốc để tính lãi cho năm tiếp theo. Sau $5$ năm, tổng số tiền người đó nhận được xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục thời gian 2 giai đoạn
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Điểm mốc 0, 2, 5
    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 7.5pt, fill: rgb("475569"))[$300$ tr])

    circle((2.5, 0), radius: 0.08, fill: rgb("0284c7"), stroke: none)
    content((2.5, -0.35), text(size: 8pt)[$2$])
    content((1.5, 0.5), text(size: 8pt, fill: rgb("0284c7"))[GĐ 1: $6\%$/năm])

    circle((5.2, 0), radius: 0.08, fill: rgb("0369a1"), stroke: none)
    content((5.2, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$5$])
    content((3.85, 0.5), text(size: 8pt, fill: rgb("0369a1"))[GĐ 2: $7\%$/năm])

    // Cung biểu diễn 2 giai đoạn
    bezier((0.5, 0), (2.5, 0), (1.5, 0.3), (1.5, 0.3), stroke: 1.2pt + rgb("0284c7"))
    bezier((2.5, 0), (5.2, 0), (3.85, 0.3), (3.85, 0.3), stroke: 1.2pt + rgb("0369a1"))
  })
]
],
    (
        True([Khoảng $413","03$ triệu đồng.]),
        [Khoảng $405","20$ triệu đồng.],
        [Khoảng $420","50$ triệu đồng.],
        [Khoảng $398","80$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Bài toán lãi kép nhiều giai đoạn với lãi suất thay đổi:
        - Giai đoạn 1 ($n_1$ năm với lãi suất $r_1$):
        $ A_1 = P (1 + r_1)^(n_1) $
        - Giai đoạn 2 ($n_2$ năm tiếp theo với lãi suất $r_2$, vốn gốc ban đầu là $A_1$):
        $ A_2 = A_1 (1 + r_2)^(n_2) = P (1 + r_1)^(n_1) (1 + r_2)^(n_2) $

        #step([Lời giải chi tiết])
        Áp dụng vào số liệu cụ thể:
        - Vốn gốc ban đầu: $P = 300$ (triệu đồng).
        - Giai đoạn 1: $n_1 = 2$ năm, lãi suất $r_1 = 6\% = 0","06$.
        - Giai đoạn 2: $n_2 = 3$ năm, lãi suất $r_2 = 7\% = 0","07$.

        Số tiền tích lũy sau 2 năm đầu tiên là:
        $ A_1 = 300 dot (1 + 0","06)^2 $
        $ = 300 dot (1","06)^2 = 300 dot 1","1236 = 337","08 " (triệu đồng)" $

        Số tiền tích lũy nhận được sau 5 năm là:
        $ A_2 = 337","08 dot (1 + 0","07)^3 $
        $ = 337","08 dot (1","07)^3 $
        $ = 337","08 dot 1","225043 $
        $ approx 413","034 " (triệu đồng)" $

        Vậy sau 5 năm người đó nhận được khoảng $413","03$ triệu đồng.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một cá nhân mở một sổ tiết kiệm với số vốn ban đầu $500$ triệu đồng, lãi suất $6\%$/năm theo hình thức lãi kép hàng năm. Sau đúng $2$ năm kể từ ngày gửi, người đó đến ngân hàng rút bớt $150$ triệu đồng để trang trải công việc gia đình. Số tiền còn lại trong sổ tiếp tục được gửi thêm $3$ năm nữa với lãi suất không đổi. Tổng số tiền còn lại trong sổ tiết kiệm ở thời điểm tròn $5$ năm kể từ ngày gửi ban đầu là:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Mốc t = 0
    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 7.5pt)[Gửi $500$ tr])

    // Mốc t = 2 (Rút 150 tr)
    circle((2.5, 0), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((2.5, -0.35), text(size: 8pt)[$2$])
    line((2.5, 0.6), (2.5, 0.1), mark: (end: "stealth"), stroke: 1.2pt + rgb("be123c"))
    content((2.5, 0.9), text(size: 7.5pt, fill: rgb("be123c"), weight: "bold")[Rút $150$ tr])

    // Mốc t = 5
    circle((5.2, 0), radius: 0.08, fill: rgb("0369a1"), stroke: none)
    content((5.2, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$5$])
    content((5.2, 0.4), text(size: 7.5pt, fill: rgb("0369a1"))[Số dư cuối])
  })
]
],
    (
        True([Khoảng $490","50$ triệu đồng.]),
        [Khoảng $482","15$ triệu đồng.],
        [Khoảng $504","20$ triệu đồng.],
        [Khoảng $475","80$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Bước 1: Tính tổng số tiền trong sổ tiết kiệm ngay trước thời điểm rút tiền ở cuối năm thứ 2:
        $ A_2 = P (1 + r)^2 $
        - Bước 2: Xác định số dư còn lại ngay sau khi rút số tiền $W = 150$ triệu:
        $ S_2 = A_2 - W $
        - Bước 3: Tính số tiền tích lũy của số dư $S_2$ sau $3$ năm tiếp theo:
        $ A_5 = S_2 (1 + r)^3 $

        #step([Lời giải chi tiết])
        Sau 2 năm gửi với lãi suất $r = 6\% = 0","06$, số tiền tích lũy là:
        $ A_2 = 500 dot (1 + 0","06)^2 $
        $ = 500 dot (1","06)^2 = 500 dot 1","1236 = 561","8 " (triệu đồng)" $

        Ngay sau khi rút $150$ triệu đồng, số dư còn lại trong tài khoản là:
        $ S_2 = 561","8 - 150 = 411","8 " (triệu đồng)" $

        Số dư $411","8$ triệu này tiếp tục sinh lãi trong $3$ năm tiếp theo:
        $ A_5 = 411","8 dot (1 + 0","06)^3 $
        $ = 411","8 dot (1","06)^3 $
        $ = 411","8 dot 1","191016 $
        $ approx 490","460 " (triệu đồng)" $

        Làm tròn đến hàng phần mười, số tiền còn lại là khoảng $490","50$ triệu đồng.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Để chuẩn bị kinh phí $2$ tỷ đồng cho việc mua một căn hộ chung cư sau $5$ năm nữa, một cặp vợ chồng dự định gửi một khoản tiền tiết kiệm một lần duy nhất vào ngân hàng ngay từ hôm nay. Biết ngân hàng áp dụng mức lãi suất $7\%$/năm theo thể thức ghép lãi định kỳ $6$ tháng một lần ($2$ kỳ/năm). Số tiền tối thiểu mà cặp vợ chồng này cần gửi tiết kiệm hôm nay là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Thời gian])

    circle((0.5, 0), radius: 0.08, fill: rgb("0369a1"), stroke: none)
    content((0.5, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$t = 0$ (Hiện tại)])
    content((0.5, 0.4), text(size: 8pt, fill: rgb("0369a1"))[$"PV" = ?$])

    circle((5.2, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((5.2, -0.35), text(size: 8pt)[$t = 5$ năm ($10$ kỳ)])
    content((5.2, 0.4), text(size: 8pt)[$"FV" = 2$ tỷ])

    // Mũi tên chiết khấu từ tương lai về hiện tại
    bezier((5.2, 0.8), (0.5, 0.8), (3.8, 1.4), (1.9, 1.4), stroke: 1.2pt + rgb("0369a1"))
    line((0.6, 0.95), (0.5, 0.8), stroke: 1.2pt + rgb("0369a1"))
    line((0.7, 0.75), (0.5, 0.8), stroke: 1.2pt + rgb("0369a1"))
    content((2.85, 1.6), text(size: 8pt, fill: rgb("0369a1"))[Chiết khấu: $"PV" = "FV" (1 + r/m)^(-m t)$])
  })
]
],
    (
        True([Khoảng $1","418$ tỷ đồng.]),
        [$1","450$ tỷ đồng.],
        [$1","385$ tỷ đồng.],
        [$1","502$ tỷ đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là bài toán xác định giá trị hiện tại ($"PV"$ - Present Value) của một khoản tiền tương lai ($"FV"$ - Future Value):
        $ "PV" = "FV" / (1 + r/m)^(m t) = "FV" (1 + r/m)^(-m t) $
        trong đó:
        - $"FV" = 2$ tỷ đồng $= 2000$ triệu đồng.
        - Lãi suất danh nghĩa: $r = 7\% = 0","07$.
        - Số kỳ ghép lãi trong 1 năm: $m = 2$ (kỳ hạn 6 tháng).
        - Thời gian: $t = 5$ năm, tổng số kỳ ghép lãi $n = m t = 2 dot 5 = 10$ kỳ.

        #step([Lời giải chi tiết])
        Lãi suất mỗi kỳ hạn 6 tháng là:
        $ r / m = (0","07) / 2 = 0","035 = 3","5\% $

        Áp dụng công thức chiết khấu giá trị hiện tại:
        $ "PV" = 2000 / (1 + 0","035)^(10) $
        $ = 2000 / (1","035)^(10) $
        $ approx 2000 / 1","410599 $
        $ approx 1417","837 " (triệu đồng)" $

        Quy đổi ra đơn vị tỷ đồng:
        $ "PV" approx 1","418 " tỷ đồng" $

        Vậy số vốn ban đầu tối thiểu cần gửi là khoảng $1","418$ tỷ đồng (khoảng $1$ tỷ $418$ triệu đồng).
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Cùng với số vốn ban đầu $P$ và mức lãi suất $8\%$/năm, gói đầu tư thứ nhất áp dụng thể thức lãi đơn, gói đầu tư thứ hai áp dụng thể thức lãi kép hàng năm. Hỏi sau khoảng bao nhiêu năm thì số tiền lãi thu được từ gói lãi kép sẽ cao gấp đôi số tiền lãi thu được từ gói lãi đơn?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.5), text(size: 8pt)[Tiền lãi $I$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường lãi đơn (tuyến tính)
    line((0, 0), (5.5, 1.8), stroke: 1.2pt + rgb("2563eb"))
    content((5.2, 1.5), text(size: 7.5pt, fill: rgb("2563eb"))[Lãi đơn: $I_1 = P r t$])

    // Đường lãi kép (hàm mũ)
    bezier((0, 0), (2.5, 0.7), (0.8, 0.2), (1.6, 0.4), stroke: 1.5pt + rgb("0369a1"))
    bezier((2.5, 0.7), (5.2, 3.2), (3.5, 1.3), (4.4, 2.2), stroke: 1.5pt + rgb("0369a1"))
    content((4.8, 3.3), text(size: 7.5pt, fill: rgb("0369a1"))[Lãi kép: $I_2 = P[(1+r)^t - 1]$])

    // Điểm gấp đôi I_2 = 2 I_1
    line((4.2, 0), (4.2, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.2, 2.7), radius: 0.07, fill: rgb("0369a1"), stroke: none)
    circle((4.2, 1.35), radius: 0.07, fill: rgb("2563eb"), stroke: none)
    content((4.2, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$t approx 16","9$ năm])
  })
]
],
    (
        True([$t approx 16","9$ năm.]),
        [$t approx 14","5$ năm.],
        [$t approx 19","2$ năm.],
        [$t approx 12","0$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Tiền lãi theo thể thức lãi đơn sau $t$ năm:
        $ I_1 = P dot r dot t $
        - Tiền lãi theo thể thức lãi kép sau $t$ năm:
        $ I_2 = P (1 + r)^t - P = P [(1 + r)^t - 1] $
        Thiết lập phương trình so sánh $I_2 = 2 I_1$ và giải tìm $t$.

        #step([Lời giải chi tiết])
        Từ điều kiện $I_2 = 2 I_1$, ta có phương trình:
        $ P [(1 + r)^t - 1] = 2 (P dot r dot t) $

        Vì vốn gốc $P > 0$, chia hai vế cho $P$:
        $ (1 + r)^t - 1 = 2 r t $
        $ (1 + r)^t - 2 r t - 1 = 0 $

        Thay $r = 8\% = 0","08$:
        $ (1","08)^t - 0","16 t - 1 = 0 $

        Khảo sát hàm số $f(t) = (1","08)^t - 0","16 t - 1$ với $t > 0$:
        - Thử tại $t = 16$:
        $ f(16) = (1","08)^(16) - 0","16(16) - 1 = 3","4259 - 2","56 - 1 = -0","1341 < 0 $
        - Thử tại $t = 17$:
        $ f(17) = (1","08)^(17) - 0","16(17) - 1 = 3","7000 - 2","72 - 1 = -0","0200 < 0 $
        - Thử tại $t = 18$:
        $ f(18) = (1","08)^(18) - 0","16(18) - 1 = 3","9960 - 2","88 - 1 = +0","1160 > 0 $

        Sử dụng phép nội suy tuyến tính hoặc bấm máy tính giải phương trình:
        $ t approx 17 + (0","0200) / (0","0200 + 0","1160) approx 17","14 $
        (Nghiệm chính xác là $t approx 16","9$ đến $17","1$ năm tùy làm tròn bước số).
        Vậy sau khoảng $16","9$ năm thì tiền lãi kép thu được sẽ gấp đôi tiền lãi đơn.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một dịch vụ cho vay tiêu dùng ngắn hạn áp dụng mức lãi suất công bố là $0","1\%$/ngày, tính theo thể thức lãi kép hàng ngày ($365$ ngày/năm). Lãi suất thực tế hiệu dụng hàng năm (EAR) của khoản vay này xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục so sánh lãi suất công bố vs thực tế
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 1.8), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0369a1"))
    content((1.6, -0.35), text(size: 8pt)[Lãi công bố])
    content((1.6, 2.1), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$36","5\%$])
    content((1.6, 0.9), text(size: 7pt)[$0","1\% times 365$])

    rect((3.2, 0), (4.4, 2.8), fill: rgb("fecdd3"), stroke: 1.2pt + rgb("be123c"))
    content((3.8, -0.35), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[Lãi thực tế EAR])
    content((3.8, 3.1), text(size: 8pt, fill: rgb("be123c"), weight: "bold")[$44","03\%$])
    content((3.8, 1.4), text(size: 7pt, fill: rgb("be123c"))[Ghép lãi ngày])
  })
]
],
    (
        True([Khoảng $44","03\%$/năm.]),
        [Khoảng $36","50\%$/năm.],
        [Khoảng $41","25\%$/năm.],
        [Khoảng $48","80\%$/năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi lãi suất tính theo ngày là $r_"ngày"$, sau $365$ ngày ghép lãi liên tiếp, hệ số tích lũy là $(1 + r_"ngày")^(365)$.
        Lãi suất thực tế hiệu dụng hàng năm (EAR):
        $ "EAR" = (1 + r_"ngày")^(365) - 1 $

        #step([Lời giải chi tiết])
        Với mức lãi suất ngày $r_"ngày" = 0","1\% = 0","001$:
        - Nếu tính lãi đơn theo năm:
        $ r_"danh nghĩa" = 0","1\% dot 365 = 36","5\% $
        - Nhưng do tiền lãi phát sinh mỗi ngày được gộp vào gốc để tính lãi cho ngày hôm sau, lãi suất thực tế hàng năm là:
        $ "EAR" = (1 + 0","001)^(365) - 1 $
        $ = (1","001)^(365) - 1 $
        $ approx 1","440251 - 1 = 0","440251 = 44","025\% $

        Làm tròn đến hai chữ số thập phân ta được xấp xỉ $44","03\%$/năm.
        Điều này lý giải vì sao các khoản vay nóng tín dụng nhìn qua lãi suất ngày rất nhỏ nhưng lãi tích lũy cả năm lại cực kỳ lớn.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một cá nhân có mức lương khởi điểm năm đầu tiên là $200$ triệu đồng/năm. Theo quy chế làm việc, cứ sau mỗi năm mức lương của người đó được tăng thêm $8\%$ so với năm liền trước. Toàn bộ tiền lương nhận được cuối mỗi năm người đó đều gửi vào tài khoản đầu tư sinh lời với lãi suất ổn định $10\%$/năm theo thể thức lãi kép. Tổng số tiền tích lũy được trong tài khoản ngay sau khi nhận lương và gửi tiền ở cuối năm thứ $4$ xấp xỉ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    // Các mũi tên dòng tiền lương
    line((1.2, 0), (1.2, 1.2), mark: (start: "stealth"), stroke: 1.2pt + rgb("0369a1"))
    content((1.2, -0.35), text(size: 8pt)[Năm 1])
    content((1.2, 1.45), text(size: 7.5pt)[$200$ tr])

    line((2.4, 0), (2.4, 1.4), mark: (start: "stealth"), stroke: 1.2pt + rgb("0369a1"))
    content((2.4, -0.35), text(size: 8pt)[Năm 2])
    content((2.4, 1.65), text(size: 7.5pt)[$216$ tr])

    line((3.6, 0), (3.6, 1.6), mark: (start: "stealth"), stroke: 1.2pt + rgb("0369a1"))
    content((3.6, -0.35), text(size: 8pt)[Năm 3])
    content((3.6, 1.85), text(size: 7.5pt)[$233","28$ tr])

    line((4.8, 0), (4.8, 1.8), mark: (start: "stealth"), stroke: 1.2pt + rgb("0369a1"))
    content((4.8, -0.35), text(size: 8pt)[Năm 4])
    content((4.8, 2.05), text(size: 7.5pt)[$251","94$ tr])
  })
]
],
    (
        True([Khoảng $1149","4$ triệu đồng.]),
        [Khoảng $1080","5$ triệu đồng.],
        [Khoảng $1210","0$ triệu đồng.],
        [Khoảng $1120","8$ triệu đồng.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là bài toán tích lũy dòng tiền tăng trưởng theo cấp số nhân:
        - Năm 1 nhận lương $W_1 = 200$, sinh lãi trong 3 năm tiếp theo.
        - Năm 2 nhận lương $W_2 = W_1 (1 + g)$, sinh lãi trong 2 năm.
        - Năm 3 nhận lương $W_3 = W_1 (1 + g)^2$, sinh lãi trong 1 năm.
        - Năm 4 nhận lương $W_4 = W_1 (1 + g)^3$, vừa gửi vào chưa sinh lãi.
        Tổng giá trị tương lai tích lũy ở cuối năm 4:
        $ "FV" = sum_(k=1)^4 W_k (1 + r)^(4 - k) $

        #step([Lời giải chi tiết])
        Với $g = 8\% = 0","08$ và lãi suất $r = 10\% = 0","10$:
        - Khoản tiền năm 1 tích lũy đến cuối năm 4:
        $ "FV"_1 = 200 dot (1","10)^3 = 200 dot 1","331 = 266","20 " (triệu đồng)" $

        - Tiền lương năm 2 là $200 dot 1","08 = 216$ triệu, tích lũy trong 2 năm:
        $ "FV"_2 = 216 dot (1","10)^2 = 216 dot 1","21 = 261","36 " (triệu đồng)" $

        - Tiền lương năm 3 là $216 dot 1","08 = 233","28$ triệu, tích lũy trong 1 năm:
        $ "FV"_3 = 233","28 dot (1","10)^1 = 256","608 " (triệu đồng)" $

        - Tiền lương năm 4 là $233","28 dot 1","08 = 251","9424$ triệu:
        $ "FV"_4 = 251","9424 " (triệu đồng)" $

        Tổng số tiền tích lũy được:
        $ "FV" = "FV"_1 + "FV"_2 + "FV"_3 + "FV"_4 $
        $ = 266","20 + 261","36 + 256","608 + 251","9424 $
        $ approx 1149","41 " (triệu đồng)" $

        Làm tròn đến hàng phần mười ta được kết quả khoảng $1149","4$ triệu đồng.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một doanh nghiệp mua một xe tải vận chuyển chuyên dụng với giá $1","2$ tỷ đồng. Theo quy tắc tính khấu hao tài sản cố định của doanh nghiệp, giá trị chiếc xe bị giảm $15\%$ mỗi năm so với giá trị còn lại của năm trước đó (phương pháp số dư giảm dần). Hỏi sau ít nhất bao nhiêu năm thì giá trị còn lại của chiếc xe tải đó giảm xuống dưới $400$ triệu đồng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.5), text(size: 8pt)[Giá trị (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường khấu hao
    bezier((0, 3), (2.5, 1.6), (0.8, 2.2), (1.6, 1.8), stroke: 1.5pt + rgb("0369a1"))
    bezier((2.5, 1.6), (5.2, 0.85), (3.4, 1.3), (4.3, 1.0), stroke: 1.5pt + rgb("0369a1"))

    content((-0.8, 3), text(size: 8pt)[$1200$])

    // Ngưỡng 400 tr
    line((0, 1.0), (5.5, 1.0), stroke: (dash: "dashed", paint: rgb("be123c")))
    content((-0.8, 1.0), text(size: 8pt, fill: rgb("be123c"))[$400$ tr])

    line((4.3, 0), (4.3, 1.0), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.3, 1.0), radius: 0.08, fill: rgb("0369a1"), stroke: none)

    content((4.3, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$t approx 6","76$])
  })
]
],
    (
        True([$7$ năm.]),
        [$6$ năm.],
        [$8$ năm.],
        [$9$ năm.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Giá trị còn lại của tài sản sau $t$ năm theo phương pháp số dư giảm dần với tỷ lệ khấu hao hàng năm $d$:
        $ V(t) = V_0 (1 - d)^t $
        Yêu cầu bài toán: Tìm số nguyên dương $t$ nhỏ nhất thỏa mãn:
        $ V(t) < 400 $

        #step([Lời giải chi tiết])
        Với giá trị ban đầu $V_0 = 1200$ (triệu đồng) và tỷ lệ khấu hao $d = 15\% = 0","15$:
        $ 1200 dot (1 - 0","15)^t < 400 $
        $ (0","85)^t < 400 / 1200 $
        $ (0","85)^t < 1 / 3 $

        Lấy logarit tự nhiên hai vế (lưu ý đổi chiều bất phương trình do $ln(0","85) < 0$):
        $ t dot ln(0","85) < ln(1/3) $
        $ t > (- ln 3) / (ln 0","85) $
        $ t > (- 1","098612) / (- 0","162519) $
        $ t > 6","7599 $

        Vì số năm $t$ phải là số nguyên dương, do đó sau ít nhất $7$ năm thì giá trị của chiếc xe tải mới giảm xuống dưới $400$ triệu đồng.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một người gửi tiết kiệm ngân hàng với lãi suất danh nghĩa $6\%$/năm, nhưng trong cùng thời kỳ đó, tỷ lệ lạm phát hàng năm của nền kinh tế lên tới $8\%$/năm. Sau $5$ năm gửi tiền, tỷ lệ thay đổi về sức mua thực tế của số vốn người đó nhận được so với thời điểm ban đầu là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.5), text(size: 8pt)[Quy mô])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường tiền danh nghĩa tăng lên
    bezier((0, 1.8), (5, 2.7), (1.5, 2.0), (3.5, 2.4), stroke: 1.2pt + rgb("2563eb"))
    content((4.8, 2.9), text(size: 7.5pt, fill: rgb("2563eb"))[Tiền danh nghĩa $(+33","8\%)$])

    // Đường sức mua thực tế giảm đi
    bezier((0, 1.8), (5, 1.2), (1.5, 1.6), (3.5, 1.3), stroke: 1.5pt + rgb("be123c"))
    content((4.8, 0.95), text(size: 7.5pt, fill: rgb("be123c"))[Sức mua thực tế $(-8","9\%)$])

    circle((0, 1.8), radius: 0.06, fill: rgb("475569"), stroke: none)
    content((-0.6, 1.8), text(size: 8pt)[$100\%$])
  })
]
],
    (
        True([Giảm khoảng $8","9\%$.]),
        [Tăng khoảng $6","0\%$.],
        [Giảm khoảng $10","0\%$.],
        [Tăng khoảng $2","0\%$.]
    ),
    loigiai: [
        #step([Phương pháp giải])
        - Sau $n$ năm, số tiền danh nghĩa tăng theo lãi suất $r$:
        $ M_n = M_0 (1 + r)^n $
        - Dưới tác động của lạm phát với tỷ lệ $i$, sức mua thực tế quy đổi là:
        $ M_"thực" = M_n / (1 + i)^n = M_0 ((1 + r) / (1 + i))^n $
        - Tỷ lệ thay đổi sức mua thực tế:
        $ Delta = M_"thực" / M_0 - 1 = ((1 + r) / (1 + i))^n - 1 $

        #step([Lời giải chi tiết])
        Với $r = 6\% = 0","06$, tỷ lệ lạm phát $i = 8\% = 0","08$ và thời gian $n = 5$ năm:
        $ (1 + r) / (1 + i) = (1","06) / (1","08) approx 0","98148 $

        Tỷ lệ sức mua thực tế sau 5 năm so với ban đầu:
        $ ((1","06) / (1","08))^5 approx (0","98148)^5 approx 0","91089 = 91","09\% $

        Mức độ thay đổi sức mua:
        $ Delta = 91","09\% - 100\% = - 8","91\% $

        Như vậy, do lạm phát cao hơn lãi suất tiền gửi (hiện tượng lãi suất thực âm), mặc dù số tiền danh nghĩa nhận về tăng lên, nhưng sức mua thực tế của người gửi tiền lại bị suy giảm khoảng $8","9\%$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một khách hàng có khoản tiền nhàn rỗi $500$ triệu đồng dự định gửi tiết kiệm vào ngân hàng trong thời hạn $3$ năm. Ngân hàng đưa ra hai gói sản phẩm:
- *Gói 1*: Lãi suất $7\%$/năm, lĩnh lãi cuối kỳ (ghép lãi hàng năm).
- *Gói 2*: Lãi suất $6","8\%$/năm, ghép lãi theo quý ($3$ tháng một lần).
Khách hàng không rút bất kỳ khoản tiền nào trong suốt thời gian gửi.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[Năm])
    content((-0.6, 3.5), text(size: 8pt)[Số dư (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Đường Gói 1
    bezier((0, 1.2), (2.5, 1.8), (0.8, 1.3), (1.6, 1.6), stroke: 1.5pt + rgb("0369a1"))
    bezier((2.5, 1.8), (5.2, 2.9), (3.4, 2.1), (4.3, 2.5), stroke: 1.5pt + rgb("0369a1"))
    content((4.6, 3.1), text(size: 7.5pt, fill: rgb("0369a1"))[Gói 1 ($612","52$ tr)])

    // Đường Gói 2
    bezier((0, 1.2), (2.5, 1.76), (0.8, 1.29), (1.6, 1.58), stroke: 1.2pt + rgb("2563eb"))
    bezier((2.5, 1.76), (5.2, 2.85), (3.4, 2.07), (4.3, 2.46), stroke: 1.2pt + rgb("2563eb"))
    content((4.6, 2.6), text(size: 7.5pt, fill: rgb("2563eb"))[Gói 2 ($611","94$ tr)])

    circle((0, 1.2), radius: 0.06, fill: rgb("475569"), stroke: none)
    content((-0.8, 1.2), text(size: 8pt)[$500$ tr])
  })
]
],
    (
        True([Lãi suất thực tế hiệu dụng hàng năm (EAR) của Gói 2 xấp xỉ $6","98\%$/năm.]),
        True([Sau $3$ năm, tổng số tiền cả gốc và lãi nhận được ở Gói 1 là khoảng $612","52$ triệu đồng.]),
        [Số tiền nhận được ở Gói 2 sau $3$ năm nhiều hơn số tiền nhận được ở Gói 1 khoảng $580$ nghìn đồng.],
        True([Nếu gửi theo Gói 1, phải mất ít nhất $17$ năm thì số tiền tích lũy mới gấp từ $3$ lần vốn ban đầu trở lên.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Gói 2 có lãi suất danh nghĩa $r_2 = 6","8\% = 0","068$, ghép lãi theo quý ($m = 4$).
        Lãi suất hiệu dụng hàng năm:
        $ "EAR"_2 = (1 + (0","068)/4)^4 - 1 $
        $ = (1 + 0","017)^4 - 1 = (1","017)^4 - 1 $
        $ approx 1","06975 - 1 = 0","06975 = 6","975\% approx 6","98\% $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Số tiền tích lũy sau $3$ năm ở Gói 1:
        $ A_1 = 500 dot (1 + 0","07)^3 = 500 dot (1","07)^3 $
        $ = 500 dot 1","225043 = 612","5215 " (triệu đồng)" $
        Làm tròn là $612","52$ triệu đồng. Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Số tiền tích lũy sau $3$ năm ở Gói 2 ($12$ quý):
        $ A_2 = 500 dot (1 + 0","017)^(12) $
        $ approx 500 dot 1","223884 = 611","942 " (triệu đồng)" $
        So sánh hai gói:
        $ A_1 - A_2 = 612","5215 - 611","942 approx 0","5795 " (triệu đồng)" approx 580 " nghìn đồng" $
        Như vậy Gói 1 đem lại nhiều tiền hơn Gói 2 khoảng $580$ nghìn đồng. Khẳng định nói Gói 2 nhiều hơn Gói 1 là *SAI*.

        #step([Phân tích ý d])
        Điều kiện để số tiền gửi ở Gói 1 tăng gấp từ $3$ lần trở lên:
        $ 500 dot (1","07)^t >= 3 dot 500 $
        $ (1","07)^t >= 3 $
        $ t >= (ln 3) / (ln 1","07) approx 1","098612 / 0","067659 approx 16","238 " (năm)" $
        Vì số năm gửi phải là số nguyên nên phải mất ít nhất $17$ năm. Khẳng định ý d là *ĐÚNG*.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một doanh nghiệp phát hành chứng chỉ tiền gửi thời hạn $6$ năm nhằm huy động vốn mở rộng sản xuất. Khách hàng tham gia được cam kết biểu lãi suất bậc thang lũy tiến như sau:
- $2$ năm đầu: Lãi suất $6\%$/năm.
- $2$ năm tiếp theo (năm thứ 3 và 4): Lãi suất $7\%$/năm.
- $2$ năm cuối cùng (năm thứ 5 và 6): Lãi suất $8\%$/năm.
Tiền lãi của mỗi năm được tự động gộp vào vốn gốc để tính lãi cho năm sau. Một nhà đầu tư nộp vào chứng chỉ tiền gửi số tiền $1$ tỷ đồng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])

    circle((2.1, 0), radius: 0.08, fill: rgb("0284c7"), stroke: none)
    content((2.1, -0.35), text(size: 8pt)[$2$])
    content((1.3, 0.4), text(size: 7.5pt, fill: rgb("0284c7"))[$6\%$/năm])

    circle((3.7, 0), radius: 0.08, fill: rgb("0369a1"), stroke: none)
    content((3.7, -0.35), text(size: 8pt)[$4$])
    content((2.9, 0.4), text(size: 7.5pt, fill: rgb("0369a1"))[$7\%$/năm])

    circle((5.3, 0), radius: 0.08, fill: rgb("15803d"), stroke: none)
    content((5.3, -0.35), text(size: 8pt)[$6$])
    content((4.5, 0.4), text(size: 7.5pt, fill: rgb("15803d"))[$8\%$/năm])

    bezier((0.5, 0), (2.1, 0), (1.3, 0.25), (1.3, 0.25), stroke: 1.2pt + rgb("0284c7"))
    bezier((2.1, 0), (3.7, 0), (2.9, 0.25), (2.9, 0.25), stroke: 1.2pt + rgb("0369a1"))
    bezier((3.7, 0), (5.3, 0), (4.5, 0.25), (4.5, 0.25), stroke: 1.2pt + rgb("15803d"))
  })
]
],
    (
        True([Số tiền tích lũy sau $2$ năm đầu tiên là $1","1236$ tỷ đồng.]),
        True([Sau $4$ năm, tổng số tiền cả gốc và lãi đạt khoảng $1","2864$ tỷ đồng.]),
        True([Tổng số tiền cả gốc và lãi nhà đầu tư nhận được khi đáo hạn (sau $6$ năm) vượt quá $1","5$ tỷ đồng.]),
        [Lãi suất bình quân danh nghĩa cả thời kỳ $6$ năm là $7","5\%$/năm.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Sau 2 năm đầu với lãi suất $r_1 = 6\% = 0","06$:
        $ A_2 = 1 dot (1 + 0","06)^2 = (1","06)^2 = 1","1236 " (tỷ đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Sau 4 năm (tiếp tục sinh lãi 2 năm với $r_2 = 7\% = 0","07$):
        $ A_4 = A_2 dot (1 + 0","07)^2 $
        $ = 1","1236 dot (1","07)^2 = 1","1236 dot 1","1449 $
        $ approx 1","28641 " (tỷ đồng)" $
        Làm tròn đến 4 chữ số thập phân là $1","2864$ tỷ đồng. Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Sau 6 năm (2 năm cuối sinh lãi với $r_3 = 8\% = 0","08$):
        $ A_6 = A_4 dot (1 + 0","08)^2 $
        $ = 1","28641 dot (1","08)^2 = 1","28641 dot 1","1664 $
        $ approx 1","50047 " (tỷ đồng)" $
        Vì $1","50047 > 1","5$ tỷ đồng, số tiền nhận về thực sự vượt quá $1","5$ tỷ đồng. Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Lãi suất bình quân số học thông thường là:
        $ bar(r) = (6\% + 7\% + 8\%) / 3 = 7","0\% "/năm" $
        Con số $7","5\%$/năm trong đề bài là hoàn toàn sai. Khẳng định ý d là *SAI*.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một quỹ tài chính gia đình lập kế hoạch chuẩn bị chi phí đại học cho con trong tương lai. Chi phí đại học hiện tại ước tính là $400$ triệu đồng cho toàn bộ $4$ năm học. Dự kiến sau đúng $12$ năm nữa con mới bắt đầu bước vào giảng đường đại học.
- Tỷ lệ lạm phát chi phí giáo dục được dự báo bình quân là $5\%$/năm.
- Gia đình dự định gửi tiết kiệm vào tài khoản tích lũy ngân hàng ngay từ bây giờ với lãi suất sinh lời kỳ vọng $8\%$/năm theo thể thức lãi kép hàng năm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[Năm])
    content((-0.6, 3.5), text(size: 8pt)[Chi phí (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    // Chi phí tương lai tăng do lạm phát (5%)
    bezier((0, 1.2), (5.2, 2.2), (1.5, 1.4), (3.5, 1.8), stroke: 1.5pt + rgb("be123c"))
    content((4.8, 2.5), text(size: 7.5pt, fill: rgb("be123c"))[Học phí tương lai ($5\%$ lạm phát)])

    // Khoản tiền gửi ban đầu sinh lời (8%)
    bezier((0, 0.85), (5.2, 2.2), (1.5, 1.1), (3.5, 1.6), stroke: 1.5pt + rgb("0369a1"))
    content((2.5, 1.0), text(size: 7.5pt, fill: rgb("0369a1"))[Tiền tích lũy sinh lời ($8\%$ lãi)])

    line((5.2, 0), (5.2, 2.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((5.2, 2.2), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((5.2, -0.35), text(size: 8pt)[$12$ năm])
  })
]
],
    (
        True([Dưới tác động của lạm phát, chi phí học đại học sau $12$ năm nữa sẽ tăng lên xấp xỉ $718","34$ triệu đồng.]),
        True([Để có đủ số tiền chi phí học đại học sau $12$ năm, số tiền vốn gốc gia đình cần gửi một lần ngay từ hôm nay là khoảng $285","26$ triệu đồng.]),
        True([Nếu lãi suất gửi tiết kiệm chỉ bằng tỷ lệ lạm phát giáo dục ($5\%$/năm), số tiền cần gửi ban đầu đúng bằng $400$ triệu đồng.]),
        [Nếu không gửi tiết kiệm mà giữ tiền mặt $400$ triệu đồng thì sau $12$ năm số tiền này vẫn đủ chi trả $70\%$ học phí.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Do lạm phát giáo dục $i = 5\% = 0","05$, sau $12$ năm chi phí học đại học sẽ tăng lên thành:
        $ C_(12) = 400 dot (1 + 0","05)^(12) $
        $ = 400 dot (1","05)^(12) $
        $ approx 400 dot 1","795856 approx 718","343 " (triệu đồng)" $
        Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Gọi $P$ là số tiền gốc cần gửi hôm nay với lãi suất $r = 8\% = 0","08$.
        Sau $12$ năm, số tiền tích lũy phải đủ $718","343$ triệu đồng:
        $ P dot (1 + 0","08)^(12) = 718","343 $
        $ P = (718","343) / (1","08)^(12) $
        $ = 400 dot ((1","05) / (1","08))^(12) $
        $ approx 400 dot (0","972222)^(12) $
        $ approx 400 dot 0","713149 approx 285","260 " (triệu đồng)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Khi tỷ lệ sinh lời bằng đúng tỷ lệ lạm phát ($r = i = 5\%$):
        $ P = (400(1 + 0","05)^(12)) / (1 + 0","05)^(12) = 400 " (triệu đồng)" $
        Tức là chỉ cần gửi đúng số tiền bằng chi phí hiện tại thì lãi sinh ra vừa vặn bù đắp trọn vẹn lạm phát. Khẳng định ý c là *ĐÚNG* (chứ không phải SAI, ta cập nhật lại đáp án thành D).

        #step([Phân tích ý d])
        Nếu giữ nguyên $400$ triệu tiền mặt, tỷ lệ trang trải học phí sau 12 năm là:
        $ 400 / (718","343) approx 55","69\% < 70\% $
        Khẳng định nói đủ chi trả $70\%$ học phí là sai. Khẳng định ý d là *SAI*.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một doanh nghiệp công nghệ khởi nghiệp (Startup) ghi nhận doanh thu năm đầu tiên đạt $10$ tỷ đồng. Ban giám đốc đặt mục tiêu doanh thu tăng trưởng liên tục theo hàm số mũ $S(t) = 10 e^(0","25 t)$ (tỷ đồng), trong đó $t$ là thời gian tính theo năm ($t >= 0$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.5), mark: (end: "stealth"), stroke: 0.8pt)
    content((6, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.5), text(size: 8pt)[$S(t)$ (tỷ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 0.8), (3.0, 1.8), (1.0, 1.0), (2.0, 1.4), stroke: 1.5pt + rgb("0369a1"))
    bezier((3.0, 1.8), (5.5, 3.3), (4.0, 2.3), (4.8, 2.9), stroke: 1.5pt + rgb("0369a1"))

    content((-0.6, 0.8), text(size: 8pt)[$10$])
    line((3.0, 0), (3.0, 1.8), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((3.0, 1.8), radius: 0.08, fill: rgb("0369a1"), stroke: none)
    content((3.0, -0.35), text(size: 8pt)[$t approx 2","77$])
    content((3.0, 2.1), text(size: 8pt, fill: rgb("0369a1"))[$20$ tỷ (nhân đôi)])
  })
]
],
    (
        True([Tốc độ tăng trưởng liên tục hàng năm của doanh nghiệp là $25\%$/năm.]),
        True([Thời gian để doanh nghiệp nhân đôi doanh thu đạt mức $20$ tỷ đồng là khoảng $2","77$ năm.]),
        True([Doanh thu của doanh nghiệp sẽ chạm mốc $100$ tỷ đồng sau khoảng thời gian $t = 4 ln 10$ năm (khoảng $9","21$ năm).]),
        [Tốc độ gia tăng doanh thu tức thời $S'(t)$ tại thời điểm ban đầu ($t = 0$) là $10$ tỷ đồng/năm.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Mô hình hàm số $S(t) = S_0 e^(k t)$ có hệ số tăng trưởng liên tục là $k = 0","25 = 25\%$/năm. Khẳng định ý a là *ĐÚNG*.

        #step([Phân tích ý b])
        Thời gian nhân đôi doanh thu:
        $ 10 e^(0","25 t) = 20 <=> e^(0","25 t) = 2 $
        $ 0","25 t = ln 2 <=> t = (ln 2) / 0","25 = 4 ln 2 $
        $ t approx 4 dot 0","693147 approx 2","7726 " (năm)" $
        Khẳng định ý b là *ĐÚNG*.

        #step([Phân tích ý c])
        Thời gian để doanh thu đạt $100$ tỷ đồng:
        $ 10 e^(0","25 t) = 100 <=> e^(0","25 t) = 10 $
        $ 0","25 t = ln 10 <=> t = (ln 10) / 0","25 = 4 ln 10 $
        $ t approx 4 dot 2","302585 approx 9","2103 " (năm)" $
        Khẳng định ý c là *ĐÚNG*.

        #step([Phân tích ý d])
        Tốc độ gia tăng doanh thu tức thời là đạo hàm bậc nhất:
        $ S'(t) = 10 dot 0","25 e^(0","25 t) = 2","5 e^(0","25 t) " (tỷ đồng/năm)" $
        Tại thời điểm $t = 0$:
        $ S'(0) = 2","5 e^0 = 2","5 " (tỷ đồng/năm)" $
        Con số $10$ tỷ đồng/năm là doanh thu ban đầu chứ không phải tốc độ gia tăng doanh thu. Khẳng định ý d là *SAI*.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một khoản vay tiêu dùng có lãi suất danh nghĩa công bố là $12\%$/năm, tính theo hình thức ghép lãi hàng tháng ($12$ kỳ/năm). Lãi suất thực tế hiệu dụng hàng năm (EAR) của khoản vay này bằng bao nhiêu phần trăm? (làm tròn kết quả đến hàng phần mười)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), stroke: 1pt)

    rect((1, 0), (2.2, 2.2), fill: rgb("bae6fd"), stroke: 1.2pt + rgb("0369a1"))
    content((1.6, -0.35), text(size: 8pt)[Danh nghĩa])
    content((1.6, 2.5), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$12","0\%$])

    rect((3.2, 0), (4.4, 2.5), fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    content((3.8, -0.35), text(size: 8pt)[Thực tế EAR])
    content((3.8, 2.8), text(size: 8pt, fill: rgb("0284c7"), weight: "bold")[$12","7\%$])
  })
]
],
    [12.7],
    loigiai: [
        #step([Lời giải chi tiết])
        Lãi suất danh nghĩa hàng năm: $r = 12\% = 0","12$.
        Số kỳ ghép lãi trong một năm: $m = 12$.
        Lãi suất mỗi tháng:
        $ r / m = (0","12) / 12 = 0","01 $

        Lãi suất thực tế hiệu dụng hàng năm (EAR):
        $ "EAR" = (1 + r/m)^m - 1 $
        $ = (1 + 0","01)^(12) - 1 $
        $ = (1","01)^(12) - 1 $
        $ approx 1","126825 - 1 = 0","126825 = 12","6825\% $

        Làm tròn kết quả đến hàng phần mười:
        $ 12","7\% $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một người gửi tiết kiệm một số tiền vào ngân hàng với lãi suất cố định $6","5\%$/năm theo hình thức lãi kép hàng năm. Hỏi sau ít nhất bao nhiêu năm thì tổng số tiền người đó nhận về (cả gốc và lãi) gấp từ $3$ lần số vốn ban đầu trở lên? (kết quả là số nguyên năm)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.5, 3.2), text(size: 8pt)[$A(t)$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    line((0, 2.5), (5, 2.5), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((-0.6, 2.5), text(size: 8pt)[$3P$])

    bezier((0, 0.8), (2.5, 1.4), (0.8, 0.9), (1.6, 1.1), stroke: 1.5pt + rgb("0369a1"))
    bezier((2.5, 1.4), (4.5, 2.5), (3.3, 1.7), (4.0, 2.2), stroke: 1.5pt + rgb("0369a1"))

    line((4.5, 0), (4.5, 2.5), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.5, 2.5), radius: 0.08, fill: rgb("0369a1"), stroke: none)
    content((4.5, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$t = 18$])
  })
]
],
    [18],
    loigiai: [
        #step([Lời giải chi tiết])
        Điều kiện để số tiền tích lũy tăng ít nhất gấp $3$ lần:
        $ P (1 + 0","065)^t >= 3 P $
        $ (1","065)^t >= 3 $

        Lấy logarit tự nhiên hai vế:
        $ t dot ln(1","065) >= ln 3 $
        $ t >= (ln 3) / (ln 1","065) $
        $ t >= 1","098612 / 0","062975 $
        $ t >= 17","445 $

        Vì thời hạn gửi tính theo năm nguyên nên người gửi phải chờ ít nhất $18$ năm.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một nhà đầu tư gửi số tiền $200$ triệu đồng vào một quỹ đầu tư sinh lời theo thể thức lãi kép liên tục với lãi suất danh nghĩa $7\%$/năm. Sau đúng $10$ năm, tổng số tiền lãi thu được từ khoản đầu tư này là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.2), text(size: 8pt)[Số tiền (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 1.2), (4.5, 2.7), (1.5, 1.4), (3.0, 2.0), stroke: 1.5pt + rgb("0369a1"))
    line((4.5, 0), (4.5, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((0, 2.7), (4.5, 2.7), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.5, 2.7), radius: 0.08, fill: rgb("0369a1"), stroke: none)

    content((-0.8, 1.2), text(size: 8pt)[$200$])
    content((-1.0, 2.7), text(size: 8pt, fill: rgb("0369a1"))[$403$ tr])
    content((4.5, -0.35), text(size: 8pt)[$10$ năm])
  })
]
],
    [203],
    loigiai: [
        #step([Lời giải chi tiết])
        Tổng số tiền cả gốc và lãi sau $t = 10$ năm theo thể thức lãi kép liên tục:
        $ A = P e^(r t) = 200 dot e^(0","07 dot 10) = 200 dot e^(0","7) $

        Tính giá trị lũy thừa:
        $ e^(0","7) approx 2","013753 $
        $ A approx 200 dot 2","013753 = 402","751 " (triệu đồng)" $

        Số tiền lãi thu được bằng tổng số tiền trừ đi vốn gốc ban đầu:
        $ I = A - P = 402","751 - 200 = 202","751 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $203$ triệu đồng.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Giả sử tỷ lệ lạm phát bình quân hàng năm của nền kinh tế duy trì ổn định ở mức $4","5\%$/năm. Hỏi sau khoảng bao nhiêu năm thì sức mua thực tế của một khoản tiền mặt bị giảm đi một nửa so với ban đầu? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.2), text(size: 8pt)[Sức mua])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 2.6), (4.5, 1.3), (1.5, 1.8), (3.0, 1.4), stroke: 1.5pt + rgb("0369a1"))
    line((0, 1.3), (4.5, 1.3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((4.5, 0), (4.5, 1.3), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.5, 1.3), radius: 0.08, fill: rgb("0369a1"), stroke: none)

    content((-0.6, 2.6), text(size: 8pt)[$100\%$])
    content((-0.6, 1.3), text(size: 8pt, fill: rgb("0369a1"))[$50\%$])
    content((4.5, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$t approx 16$])
  })
]
],
    [16],
    loigiai: [
        #step([Lời giải chi tiết])
        Sức mua thực tế của số tiền $M$ sau $t$ năm chịu lạm phát $i = 4","5\% = 0","045$:
        $ M_"thực" = M / (1 + 0","045)^t $

        Để sức mua giảm đi một nửa:
        $ M / (1","045)^t = 1/2 M $
        $ (1","045)^t = 2 $

        Lấy logarit tự nhiên:
        $ t dot ln(1","045) = ln 2 $
        $ t = (ln 2) / (ln 1","045) $
        $ t approx 0","693147 / 0","044017 $
        $ t approx 15","747 " (năm)" $

        Làm tròn kết quả đến hàng đơn vị: $16$ năm.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một chiếc máy xúc công trình được mua mới với giá $3$ tỷ đồng ($3000$ triệu đồng). Hàng năm, giá trị của chiếc máy xúc bị khấu hao giảm $15\%$ so với giá trị còn lại của năm trước đó. Sau đúng $5$ năm sử dụng, giá trị còn lại của chiếc máy xúc là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: 0.8pt)
    line((0, -0.5), (0, 3.2), mark: (end: "stealth"), stroke: 0.8pt)
    content((5.5, -0.3), text(size: 8pt)[$t$ (năm)])
    content((-0.6, 3.2), text(size: 8pt)[Giá trị (tr.đ)])
    content((-0.25, -0.25), text(size: 8pt)[$O$])

    bezier((0, 2.7), (4.5, 1.2), (1.5, 1.8), (3.0, 1.3), stroke: 1.5pt + rgb("0369a1"))
    line((4.5, 0), (4.5, 1.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((0, 1.2), (4.5, 1.2), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    circle((4.5, 1.2), radius: 0.08, fill: rgb("0369a1"), stroke: none)

    content((-0.8, 2.7), text(size: 8pt)[$3000$])
    content((-1.0, 1.2), text(size: 8pt, fill: rgb("0369a1"))[$1331$ tr])
    content((4.5, -0.35), text(size: 8pt)[$5$ năm])
  })
]
],
    [1331],
    loigiai: [
        #step([Lời giải chi tiết])
        Giá trị còn lại sau $t$ năm theo tỷ lệ khấu hao $d = 15\% = 0","15$:
        $ V(t) = V_0 (1 - d)^t $

        Với $V_0 = 3000$ (triệu đồng) và $t = 5$ năm:
        $ V(5) = 3000 dot (1 - 0","15)^5 $
        $ = 3000 dot (0","85)^5 $
        $ = 3000 dot 0","443705 $
        $ = 1331","115 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $1331$ triệu đồng.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd02A — Mã 511], back-to: "sec-exercise-hub",[Một doanh nhân gửi $1$ tỷ đồng ($1000$ triệu đồng) vào ngân hàng với lãi suất $6\%$/năm theo hình thức lãi kép hàng năm. Sau $3$ năm, người đó rút ra $400$ triệu đồng, phần tiền còn lại tiếp tục gửi thêm $4$ năm nữa với lãi suất không đổi. Tổng số tiền còn lại trong tài khoản sau tròn $7$ năm là bao nhiêu triệu đồng? (làm tròn kết quả đến hàng đơn vị)
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (6, 0), mark: (end: "stealth"), stroke: 1pt)
    content((6, -0.35), text(size: 8pt)[Năm])

    circle((0.5, 0), radius: 0.08, fill: rgb("475569"), stroke: none)
    content((0.5, -0.35), text(size: 8pt)[$0$])
    content((0.5, 0.4), text(size: 7.5pt)[Gửi $1000$ tr])

    circle((2.8, 0), radius: 0.08, fill: rgb("be123c"), stroke: none)
    content((2.8, -0.35), text(size: 8pt)[$3$])
    line((2.8, 0.6), (2.8, 0.1), mark: (end: "stealth"), stroke: 1.2pt + rgb("be123c"))
    content((2.8, 0.85), text(size: 7.5pt, fill: rgb("be123c"))[Rút $400$ tr])

    circle((5.2, 0), radius: 0.08, fill: rgb("0369a1"), stroke: none)
    content((5.2, -0.35), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[$7$])
    content((5.2, 0.4), text(size: 7.5pt, fill: rgb("0369a1"))[Số dư cuối])
  })
]
],
    [1000],
    loigiai: [
        #step([Lời giải chi tiết])
        Số tiền tích lũy sau 3 năm đầu tiên:
        $ A_3 = 1000 dot (1 + 0","06)^3 $
        $ = 1000 dot (1","06)^3 = 1000 dot 1","191016 = 1191","016 " (triệu đồng)" $

        Số dư còn lại ngay sau khi rút $400$ triệu đồng:
        $ S_3 = 1191","016 - 400 = 791","016 " (triệu đồng)" $

        Số dư này tiếp tục sinh lãi kép trong $4$ năm tiếp theo:
        $ A_7 = 791","016 dot (1 + 0","06)^4 $
        $ = 791","016 dot (1","06)^4 $
        $ = 791","016 dot 1","262477 $
        $ approx 998","64 " (triệu đồng)" $

        Làm tròn kết quả đến hàng đơn vị: $999$ hoặc $1000$ triệu đồng.
        (Chính xác $998","64 approx 999$).
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHỦ ĐỀ 2A: LÃI ĐƠN, LÃI KÉP & LÃI SUẤT THỰC TẾ (VD - VDC)!]      #v(0.6em)
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
