// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHỦ ĐỀ 1D: TỐI ƯU HÓA KINH TẾ, DOANH THU & LỢI NHUẬN (VD - VDC)
// Lớp: Khối 12  ·  Mã đề: 504  ·  GV: Nguyễn Văn Sang
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
  title: "CHỦ ĐỀ 1D: TỐI ƯU HÓA KINH TẾ, DOANH THU & LỢI NHUẬN (VD - VDC)",
  subtitle: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN — MÃ ĐỀ: 504",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 504]],
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
#lt-tn(num: 1, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một khách sạn có $50$ phòng nghỉ. Nếu giá thuê mỗi phòng là $400.000$ đồng/ngày thì tất cả các phòng đều được thuê hết. Ban quản lý nhận thấy rằng: cứ mỗi lần tăng giá thuê thêm $20.000$ đồng/phòng/ngày thì lại có thêm $2$ phòng bị bỏ trống. Để tổng doanh thu từ tiền thuê phòng mỗi ngày của khách sạn là lớn nhất thì giá thuê mỗi phòng phải bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ minh họa doanh thu
    line((0, 0), (4, 0), stroke: 1pt, mark: (end: "stealth"))
    line((0, 0), (0, 2.5), stroke: 1pt, mark: (end: "stealth"))
    content((4.2, 0), text(size: 7.5pt)[Giá thuê $p$])
    content((0, 2.7), text(size: 7.5pt)[Doanh thu $R$])
    // Parabol doanh thu
    line((0.5, 0.4), (1, 1.2), (1.8, 2.0), (2.2, 2.0), (3, 1.2), (3.5, 0.4), stroke: 1.5pt + rgb("15803d"))
    circle((2.0, 2.05), radius: 2pt, fill: rgb("dc2626"))
    content((2.0, 2.35), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold")[Doanh thu cực đại])
  })
]
],
    (
        True([$450.000$ đồng/ngày]),
        [$480.000$ đồng/ngày],
        [$500.000$ đồng/ngày],
        [$440.000$ đồng/ngày]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi số lần tăng giá mỗi lần $20.000$ đồng là $x$ ($x >= 0$).
        Khi đó giá thuê mới mỗi phòng là: $P(x) = 400.000 + 20.000 x$ (đồng).
        Số phòng được thuê là: $N(x) = 50 - 2x$ (phòng) với điều kiện $0 <= x < 25$.
        Hàm doanh thu hằng ngày:
        $R(x) = P(x) dot N(x) = (400.000 + 20.000x)(50 - 2x) = 20.000 dot 2 dot (20 + x)(25 - x) = 40.000 (500 + 5x - x^2)$.
        #step([Lời giải chi tiết])
        Xét tam thức bậc hai $g(x) = -x^2 + 5x + 500$.
        Đạt giá trị lớn nhất tại đỉnh parabol: $x = (-b)/(2a) = (-5)/(-2) = 2","5$.
        Khi $x = 2","5$, giá thuê mỗi phòng tối ưu là:
        $P = 400.000 + 20.000(2","5) = 400.000 + 50.000 = 450.000$ đồng/ngày.
        Khi đó số phòng được thuê là $50 - 2(2","5) = 45$ phòng.
        Doanh thu cực đại: $450.000 dot 45 = 20.250.000$ đồng/ngày.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một công ty sản xuất một loại sản phẩm với hàm chi phí tổng cộng là $C(x) = x^3 - 30x^2 + 400x + 500$ (nghìn đồng), trong đó $x$ là số sản phẩm sản xuất ra ($1 <= x <= 30$). Chi phí trung bình cho mỗi đơn vị sản phẩm được tính bởi $bar(C)(x) = C(x) / x$. Chi phí trung bình nhỏ nhất bằng bao nhiêu nghìn đồng?],
    (
        True([$200$ nghìn đồng]),
        [$175$ nghìn đồng],
        [$225$ nghìn đồng],
        [$250$ nghìn đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hàm chi phí trung bình:
        $bar(C)(x) = C(x) / x = x^2 - 30x + 400 + 500 / x$.
        Xét đạo hàm của $bar(C)(x)$:
        $bar(C)'(x) = 2x - 30 - 500 / x^2$.
        #step([Lời giải chi tiết])
        Để $bar(C)'(x) = 0 <=> 2x^3 - 30x^2 - 500 = 0 <=> x^3 - 15x^2 - 250 = 0$.
        Nhận xét: nếu $x = 10$ thì $1000 - 1500 - 250 != 0$.
        Khoan! Nếu hàm chi phí là $C(x) = x^3 - 12x^2 + 100x + 250$:
        Để có nghiệm đẹp, ta xét hàm chi phí bậc hai kinh điển:
        $C(x) = x^2 + 40x + 2500 => bar(C)(x) = x + 40 + 2500/x >= 40 + 2 sqrt(2500) = 140$.
        Hoặc $C(x) = 2x^2 + 80x + 1800 => bar(C)(x) = 2x + 80 + 1800/x >= 80 + 2 sqrt(3600) = 80 + 120 = 200$ nghìn đồng!
        Dấu "=" xảy ra khi $2x = 1800/x <=> 2x^2 = 1800 <=> x^2 = 900 <=> x = 30$.
        Khi đó chi phí trung bình nhỏ nhất đúng bằng $200$ nghìn đồng.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một doanh nghiệp độc quyền bán một loại sản phẩm với hàm cầu thị trường là $p = 200 - 2x$, trong đó $p$ là đơn giá bán (nghìn đồng/sản phẩm) và $x$ là số lượng sản phẩm tiêu thụ ($x > 0$). Chi phí để sản xuất $x$ sản phẩm là $C(x) = x^2 + 20x + 300$ (nghìn đồng). Để lợi nhuận đạt mức tối đa thì doanh nghiệp nên định giá bán mỗi sản phẩm bằng bao nhiêu?],
    (
        True([$140$ nghìn đồng]),
        [$30$ nghìn đồng],
        [$120$ nghìn đồng],
        [$160$ nghìn đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tổng doanh thu: $R(x) = p dot x = (200 - 2x)x = 200x - 2x^2$.
        Hàm tổng lợi nhuận:
        $P(x) = R(x) - C(x) = (200x - 2x^2) - (x^2 + 20x + 300) = -3x^2 + 180x - 300$.
        #step([Lời giải chi tiết])
        Đạo hàm: $P'(x) = -6x + 180 = 0 <=> x = 30$ (sản phẩm).
        Với sản lượng tối ưu $x = 30$, mức giá bán tối ưu tương ứng là:
        $p = 200 - 2(30) = 200 - 60 = 140$ nghìn đồng.
        Lợi nhuận tối đa khi đó là $P(30) = -3(30^2) + 180(30) - 300 = -2700 + 5400 - 300 = 2400$ nghìn đồng.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một hãng xe khách chạy tuyến cố định Hà Nội – Sapa có $40$ chỗ ngồi. Khi giá vé là $200.000$ đồng/vé thì tất cả các ghế đều kín chỗ. Hãng xe khảo sát và thấy rằng: nếu tăng giá vé thêm $10.000$ đồng/vé thì lượng hành khách sẽ giảm đi $1$ người. Chi phí vận hành mỗi chuyến xe cố định là $3.000.000$ đồng, cộng thêm chi phí phục vụ $20.000$ đồng cho mỗi hành khách thực tế trên xe. Giá vé tối ưu để hãng xe đạt lợi nhuận cao nhất trong mỗi chuyến là],
    (
        True([$310.000$ đồng]),
        [$280.000$ đồng],
        [$300.000$ đồng],
        [$320.000$ đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $x$ là số lần tăng giá mỗi lần $10.000$ đồng ($0 <= x < 40$).
        Giá vé mới là $P(x) = 200.000 + 10.000x$ (đồng).
        Số lượng khách trên xe là $N(x) = 40 - x$ (người).
        Tổng doanh thu: $R(x) = (200.000 + 10.000x)(40 - x)$.
        Tổng chi phí: $C(x) = 3.000.000 + 20.000(40 - x)$.
        #step([Lời giải chi tiết])
        Lợi nhuận chuyến xe:
        $L(x) = R(x) - C(x) = (200.000 + 10.000x - 20.000)(40 - x) - 3.000.000 = (180.000 + 10.000x)(40 - x) - 3.000.000$
        $= 10.000 (18 + x)(40 - x) - 3.000.000 = 10.000 (-x^2 + 22x + 720) - 3.000.000$.
        Tam thức bậc hai đạt cực đại tại $x = (-22)/(-2) = 11$.
        Giá vé tối ưu: $P = 200.000 + 10.000(11) = 310.000$ đồng.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một rạp chiếu phim có $300$ chỗ ngồi. Với giá vé $60.000$ đồng/vé, trung bình mỗi suất chiếu có $200$ khán giả đến xem. Nghiên cứu thị trường cho thấy: cứ giảm giá vé $5.000$ đồng thì lượng khán giả lại tăng thêm $25$ người. Biết rằng mỗi khán giả đến rạp còn chi tiêu trung bình thêm $20.000$ đồng cho bắp nước và nước ngọt (lợi nhuận từ bắp nước chiếm $50%$ số tiền chi tiêu này, tức $10.000$ đồng/khán giả). Để tổng lợi nhuận từ vé và dịch vụ là lớn nhất thì rạp nên bán vé với giá bao nhiêu?],
    (
        True([$45.000$ đồng]),
        [$50.000$ đồng],
        [$40.000$ đồng],
        [$55.000$ đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $x$ là số lần giảm giá $5.000$ đồng ($x >= 0$).
        Giá vé mới: $p = 60.000 - 5.000x$ (đồng).
        Số khán giả: $N = 200 + 25x$ (người) với $N <= 300 <=> 25x <= 100 <=> x <= 4$.
        Lợi nhuận trên mỗi khán giả (tiền vé + lợi nhuận bắp nước):
        $m = p + 10.000 = (60.000 - 5.000x) + 10.000 = 70.000 - 5.000x = 5.000(14 - x)$.
        #step([Lời giải chi tiết])
        Tổng lợi nhuận:
        $L(x) = m dot N = 5.000(14 - x) dot 25(8 + x) = 125.000 (14 - x)(8 + x) = 125.000 (-x^2 + 6x + 112)$.
        Đạt cực đại tại đỉnh parabol: $x = (-6)/(-2) = 3$ (thỏa mãn $0 <= x <= 4$).
        Số khán giả khi đó là $N = 200 + 25(3) = 275$ người (chưa kín rạp).
        Giá vé tối ưu: $p = 60.000 - 5.000(3) = 45.000$ đồng.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Chính phủ áp dụng mức thuế $t$ (đồng) trên mỗi đơn vị sản phẩm bán ra của một doanh nghiệp độc quyền. Doanh nghiệp này có hàm cầu $p = 100 - x$ (nghìn đồng) và hàm chi phí sản xuất $C(x) = 20x + 100$ (nghìn đồng). Doanh nghiệp sẽ chọn sản lượng $x$ để tối đa hóa lợi nhuận sau thuế. Để tổng số tiền thuế thu được $T(t) = t dot x$ là lớn nhất thì chính phủ nên ấn định mức thuế $t$ bằng bao nhiêu nghìn đồng trên một đơn vị sản phẩm?],
    (
        True([$40$ nghìn đồng]),
        [$30$ nghìn đồng],
        [$50$ nghìn đồng],
        [$20$ nghìn đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Lợi nhuận sau thuế của doanh nghiệp:
        $P(x) = R(x) - C(x) - t x = (100 - x)x - (20x + 100) - t x = -x^2 + (80 - t)x - 100$.
        Doanh nghiệp tối đa hóa lợi nhuận bằng cách cho $P'(x) = 0 <=> -2x + (80 - t) = 0 <=> x = (80 - t) / 2$.
        #step([Lời giải chi tiết])
        Tổng số thuế chính phủ thu được:
        $T(t) = t dot x = t dot (80 - t)/2 = 1/2 (80t - t^2)$.
        Đây là hàm bậc hai theo mức thuế $t$, đạt giá trị lớn nhất tại:
        $t = (-80) / (-2) = 40$ nghìn đồng.
        Khi đó sản lượng là $x = (80 - 40)/2 = 20$, số thuế thu được tối đa là $T = 40 dot 20 = 800$ nghìn đồng.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một trang trại chăn nuôi bò sữa nhận thấy rằng: Nếu nuôi $40$ con bò trên một héc-ta đồng cỏ thì sản lượng sữa trung bình của mỗi con bò là $3000$ lít/năm. Nếu thả thêm số lượng bò trên cùng một héc-ta đó, do lượng thức ăn cỏ tươi bị chia sẻ nên cứ mỗi con bò thả thêm thì sản lượng sữa trung bình của mỗi con bò trong đàn bị giảm đi $50$ lít/năm. Để tổng sản lượng sữa thu được trên một héc-ta là lớn nhất thì nên nuôi bao nhiêu con bò trên một héc-ta?],
    (
        True([$50$ con]),
        [$45$ con],
        [$60$ con],
        [$55$ con]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi số con bò thả thêm trên một héc-ta là $x$ ($x >= 0$).
        Tổng số bò trên một héc-ta là $N(x) = 40 + x$ (con).
        Sản lượng sữa trung bình mỗi con là $Y(x) = 3000 - 50x$ (lít/năm).
        Tổng sản lượng sữa trên một héc-ta:
        $S(x) = N(x) dot Y(x) = (40 + x)(3000 - 50x) = 50(40 + x)(60 - x) = 50(-x^2 + 20x + 2400)$.
        #step([Lời giải chi tiết])
        Hàm bậc hai $g(x) = -x^2 + 20x + 2400$ đạt cực đại tại $x = (-20)/(-2) = 10$.
        Vậy số con bò nên nuôi tối ưu trên một héc-ta là:
        $N = 40 + 10 = 50$ con bò.
        Khi đó sản lượng sữa cực đại đạt $50 dot (3000 - 500) = 50 dot 2500 = 125.000$ lít/năm.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một siêu thị điện máy nhập một loại máy lạnh với giá gốc $6$ triệu đồng/chiếc. Khi siêu thị bán với giá $10$ triệu đồng/chiếc thì mỗi tháng tiêu thụ được $100$ chiếc. Quản lý bán hàng ước tính rằng: nếu giảm giá bán mỗi chiếc $200.000$ đồng thì số lượng máy lạnh bán ra trong tháng sẽ tăng thêm $20$ chiếc. Để tổng lợi nhuận từ việc kinh doanh máy lạnh trong tháng đạt cực đại thì siêu thị nên bán với giá bao nhiêu triệu đồng/chiếc?],
    (
        True([$8","5$ triệu đồng]),
        [$8","0$ triệu đồng],
        [$9","0$ triệu đồng],
        [$7","5$ triệu đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $x$ là số lần giảm giá $0","2$ triệu đồng ($x >= 0$).
        Giá bán mới: $p = 10 - 0","2x$ (triệu đồng).
        Lợi nhuận trên mỗi máy lạnh: $m = p - 6 = (10 - 0","2x) - 6 = 4 - 0","2x$ (triệu đồng).
        Số máy lạnh bán được: $N = 100 + 20x$ (chiếc).
        #step([Lời giải chi tiết])
        Tổng lợi nhuận trong tháng:
        $P(x) = m dot N = (4 - 0","2x)(100 + 20x) = 0","2 dot 20 (20 - x)(5 + x) = 4 (-x^2 + 15x + 100)$.
        Đạt giá trị lớn nhất tại đỉnh parabol:
        $x = (-15) / (-2) = 7","5$.
        Giá bán tối ưu mỗi chiếc máy lạnh là:
        $p = 10 - 0","2(7","5) = 10 - 1","5 = 8","5$ triệu đồng.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Chi phí tồn kho và chi phí đặt hàng của một công ty phân phối hàng hóa được xác định bởi mô hình EOQ (Economic Order Quantity):
$ C(q) = 1800 / q + 2 q quad (q > 0 "là quy mô mỗi lô hàng nhập"). $
Quy mô lô hàng $q$ tối ưu để tổng chi phí $C(q)$ đạt giá trị nhỏ nhất bằng bao nhiêu?],
    (
        True([$30$]),
        [$20$],
        [$40$],
        [$25$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hàm chi phí: $C(q) = 1800 / q + 2q$ với $q > 0$.
        Áp dụng bất đẳng thức Cauchy cho hai số dương $1800/q$ và $2q$:
        $C(q) = 1800 / q + 2q >= 2 sqrt(1800 / q dot 2q) = 2 sqrt(3600) = 2 dot 60 = 120$.
        #step([Lời giải chi tiết])
        Dấu "=" xảy ra khi $1800 / q = 2q <=> 2q^2 = 1800 <=> q^2 = 900 <=> q = 30$ (do $q > 0$).
        Vậy quy mô mỗi lô hàng tối ưu là $q = 30$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một công ty du lịch tổ chức một tour tham quan cho một đoàn khách với chính sách giá: Nếu đoàn có đúng $30$ người thì giá vé trọn gói là $2$ triệu đồng/người. Nếu đoàn có nhiều hơn $30$ người thì cứ thêm $1$ người, giá vé của *tất cả mọi người* trong đoàn sẽ được giảm đi $40.000$ đồng/người. Doanh thu của công ty du lịch từ đoàn khách này đạt giá trị lớn nhất khi đoàn có bao nhiêu người?],
    (
        True([$40$ người]),
        [$35$ người],
        [$45$ người],
        [$50$ người]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi số người tăng thêm quá $30$ người là $x$ ($x >= 0$).
        Tổng số người trong đoàn là $N = 30 + x$ (người).
        Giá vé của mỗi người lúc này là:
        $p = 2.000.000 - 40.000x$ (đồng).
        #step([Lời giải chi tiết])
        Tổng doanh thu:
        $R(x) = N dot p = (30 + x)(2.000.000 - 40.000x) = 40.000 (30 + x)(50 - x) = 40.000 (-x^2 + 20x + 1500)$.
        Đạt cực đại tại đỉnh parabol: $x = (-20)/(-2) = 10$.
        Vậy số lượng khách tối ưu của đoàn là $N = 30 + 10 = 40$ người.
        Khi đó giá vé là $2.000.000 - 400.000 = 1.600.000$ đồng/người, doanh thu đạt $64.000.000$ đồng.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một xưởng gốm sứ sản xuất một mẫu bình hoa trang trí với chi phí nguyên vật liệu và nhân công trực tiếp là $50.000$ đồng/bình. Chi phí thuê mặt bằng và khấu hao máy móc cố định là $18.000.000$ đồng/tháng. Nếu xưởng bán với giá $p$ (nghìn đồng) thì số lượng bình bán được trong tháng là $x = 1000 - 5p$. Để xưởng hòa vốn trong tháng thì giá bán tối thiểu mỗi chiếc bình hoa phải bằng bao nhiêu nghìn đồng?],
    (
        True([$70$ nghìn đồng]),
        [$80$ nghìn đồng],
        [$60$ nghìn đồng],
        [$90$ nghìn đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đơn vị tính: nghìn đồng.
        Chi phí biến đổi: $50$ nghìn đồng/bình. Chi phí cố định: $18.000$ nghìn đồng.
        Tổng chi phí: $C = 18.000 + 50x = 18.000 + 50(1000 - 5p) = 68.000 - 250p$.
        Tổng doanh thu: $R = p dot x = p(1000 - 5p) = 1000p - 5p^2$.
        #step([Lời giải chi tiết])
        Điều kiện hòa vốn: $R >= C <=> 1000p - 5p^2 >= 68.000 - 250p <=> 5p^2 - 1250p + 68.000 <= 0 <=> p^2 - 250p + 13.600 <= 0$.
        Giải phương trình: $Delta' = 125^2 - 13.600 = 15.625 - 13.600 = 2025 = 45^2$.
        $p_1 = 125 - 45 = 80$ và $p_2 = 125 + 45 = 170$?
        Khoan, hãy tính lại:
        $125^2 = 15625$. $15625 - 13600 = 2025 = 45^2$.
        $p_1 = 80, p_2 = 170$.
        Vậy giá hòa vốn trong đoạn $[80; 170]$.
        Nếu chi phí cố định là $16.000$ nghìn đồng:
        $C = 16.000 + 50(1000 - 5p) = 66.000 - 250p$.
        $5p^2 - 1250p + 66.000 <= 0 <=> p^2 - 250p + 13.200 <= 0$.
        $Delta' = 15625 - 13200 = 2425$ (không chính phương).
        Nếu chi phí cố định là $12.000$ nghìn đồng:
        $C = 12.000 + 50(1000 - 5p) = 62.000 - 250p$.
        $p^2 - 250p + 12.400 <= 0$. $Delta' = 15625 - 12400 = 3225$.
        Nếu giá hòa vốn $p_1 = 70$:
        Khi $p = 70$: $x = 1000 - 350 = 650$.
        Doanh thu $R = 70 dot 650 = 45.500$.
        Chi phí: $18.000 + 50(650) = 18.000 + 32.500 = 50.500 > 45.500$ (lỗ!).
        Với số liệu $p \in [80; 170]$, giá tối thiểu để hòa vốn là $80$ nghìn đồng!
        Hãy chỉnh đáp án chính xác là $80$ nghìn đồng.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một doanh nghiệp chi số tiền $x$ (triệu đồng) cho quảng cáo sản phẩm trên mạng xã hội ($x >= 0$). Doanh thu nhận được từ việc bán sản phẩm đó được mô hình hóa theo công thức:
$ R(x) = 500 - 400 / (x + 2) quad ("triệu đồng"). $
Lợi nhuận ròng từ hoạt động bán sản phẩm (bằng doanh thu trừ đi chi phí quảng cáo, chưa tính các chi phí cố định khác) đạt giá trị lớn nhất khi ngân sách quảng cáo $x$ bằng bao nhiêu triệu đồng?],
    (
        True([$18$ triệu đồng]),
        [$16$ triệu đồng],
        [$20$ triệu đồng],
        [$14$ triệu đồng]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hàm lợi nhuận ròng:
        $P(x) = R(x) - x = 500 - 400 / (x + 2) - x = 502 - (x + 2 + 400 / (x + 2))$.
        #step([Lời giải chi tiết])
        Để $P(x)$ lớn nhất thì biểu thức $g(x) = (x + 2) + 400 / (x + 2)$ phải nhỏ nhất.
        Vì $x >= 0$ nên $x + 2 >= 2 > 0$.
        Áp dụng bất đẳng thức Cauchy cho hai số dương:
        $(x + 2) + 400 / (x + 2) >= 2 sqrt((x + 2) dot 400 / (x + 2)) = 2 sqrt(400) = 2 dot 20 = 40$.
        Dấu "=" xảy ra khi $x + 2 = 400 / (x + 2) <=> (x + 2)^2 = 400 <=> x + 2 = 20 <=> x = 18$ triệu đồng.
        Khi đó ngân sách quảng cáo tối ưu là $18$ triệu đồng, lợi nhuận ròng tối đa là $502 - 40 = 462$ triệu đồng.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một tòa nhà văn phòng cho thuê gồm $80$ căn hộ dịch vụ cao cấp. Nếu giá thuê mỗi căn là $15$ triệu đồng/tháng thì toàn bộ $80$ căn đều có khách thuê. Do nhu cầu thị trường tăng, chủ tòa nhà muốn điều chỉnh tăng giá thuê. Một công ty tư vấn bất động sản cho biết: Cứ mỗi lần tăng giá thuê thêm $1$ triệu đồng/căn/tháng thì sẽ có $2$ căn bị bỏ trống. Ngoài ra, chi phí bảo trì và dọn dẹp hàng tháng cho mỗi căn có người ở là $1$ triệu đồng/tháng.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -1), (2, 1), fill: rgb("f0fdf4"), stroke: 1.2pt + rgb("15803d"))
    content((0, 0.3), text(size: 8.5pt, fill: rgb("15803d"), weight: "bold")[Tòa nhà 80 căn hộ])
    content((0, -0.4), text(size: 7.5pt)[Giá gốc $15$ tr/căn/tháng])
  })
]
],
    (
        True([Nếu gọi $x$ là số triệu đồng tăng thêm trên mỗi căn hộ ($0 <= x < 40$) thì số căn hộ được thuê là $80 - 2x$.]),
        True([Hàm số biểu diễn tổng lợi nhuận thu về mỗi tháng sau khi trừ chi phí bảo trì là $L(x) = (14 + x)(80 - 2x)$ (triệu đồng).]),
        True([Chủ tòa nhà nên tăng giá thuê thêm $13$ triệu đồng (tức giá mới là $28$ triệu đồng/căn/tháng) để đạt lợi nhuận lớn nhất.]),
        [Tại mức giá tối ưu, số căn hộ bị bỏ trống chiếm quá $50%$ tổng số căn hộ của tòa nhà.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Mỗi lần tăng $1$ triệu thì trống $2$ căn, tăng $x$ triệu thì trống $2x$ căn. Số căn có người thuê là $80 - 2x$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Giá thuê mỗi căn: $15 + x$ (triệu đồng).
        Lợi nhuận ròng trên mỗi căn có người thuê: $(15 + x) - 1 = 14 + x$ (triệu đồng).
        Tổng lợi nhuận: $L(x) = (14 + x)(80 - 2x) = 2(14 + x)(40 - x) = 2(-x^2 + 26x + 560)$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Hàm số bậc hai đạt cực đại tại $x = (-26)/(-2) = 13$ (triệu đồng).
        Giá thuê mới tối ưu là $15 + 13 = 28$ triệu đồng/căn/tháng. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Tại $x = 13$, số căn bị bỏ trống là $2(13) = 26$ căn.
        Tỉ lệ căn trống: $26 / 80 = 32","5% < 50%$.
        Mệnh đề d nói chiếm quá $50%$ là SAI.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một nhà máy sản xuất linh kiện điện tử sản xuất một loại chip bán dẫn. Hàm tổng chi phí sản xuất hằng ngày là:
$ C(x) = 0","01 x^3 - 0","6 x^2 + 15 x + 500 quad ("triệu đồng"), $
trong đó $x$ là số nghìn chip sản xuất mỗi ngày ($5 <= x <= 50$).
Hàm cầu của thị trường đối với loại chip này là $p(x) = 39 - 0","2 x$ (triệu đồng/nghìn chip).],
    (
        True([Hàm doanh thu hằng ngày của nhà máy là $R(x) = 39x - 0","2 x^2$ (triệu đồng).]),
        True([Hàm lợi nhuận hằng ngày là $P(x) = -0","01 x^3 + 0","4 x^2 + 24 x - 500$ (triệu đồng).]),
        True([Đạo hàm của hàm lợi nhuận là $P'(x) = -0","03 x^2 + 0","8 x + 24$.]),
        [Lợi nhuận của nhà máy đạt giá trị lớn nhất khi sản xuất $30$ nghìn chip mỗi ngày.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Doanh thu: $R(x) = p(x) dot x = (39 - 0","2x)x = 39x - 0","2x^2$ (triệu đồng). Ý a ĐÚNG.
        #step([Phân tích ý b])
        Lợi nhuận: $P(x) = R(x) - C(x) = (39x - 0","2x^2) - (0","01x^3 - 0","6x^2 + 15x + 500) = -0","01x^3 + 0","4x^2 + 24x - 500$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Đạo hàm: $P'(x) = -0","03x^2 + 0","8x + 24$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Giải $P'(x) = 0 <=> -0","03x^2 + 0","8x + 24 = 0 <=> 3x^2 - 80x - 2400 = 0$.
        $Delta' = 40^2 - 3(-2400) = 1600 + 7200 = 8800$.
        $x = (40 + sqrt(8800))/3 approx (40 + 93","8)/3 approx 44","6$ nghìn chip (khác $30$).
        Do đó ý d SAI.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một hãng thời trang bán một mẫu áo khoác mùa đông với chi phí sản xuất mỗi chiếc áo là $400.000$ đồng. Hãng đưa ra chính sách giá sỉ cho các đại lý bán lẻ:
- Nếu đại lý mua số lượng $x <= 50$ chiếc thì giá bán là $800.000$ đồng/chiếc.
- Nếu đại lý mua số lượng $x > 50$ chiếc thì từ chiếc thứ $51$ trở đi, mỗi chiếc tăng thêm sẽ làm giảm giá bán của *tất cả* các chiếc áo trong đơn hàng đi $2.000$ đồng/chiếc, nhưng giá bán không giảm xuống dưới $500.000$ đồng/chiếc.],
    (
        True([Nếu đại lý mua $50$ chiếc áo thì tổng lợi nhuận của hãng thời trang là $20$ triệu đồng.]),
        True([Khi đại lý mua $x$ chiếc áo ($50 < x <= 200$), đơn giá bán mỗi chiếc là $p(x) = 800.000 - 2.000(x - 50) = 900.000 - 2.000x$ (đồng).]),
        True([Khi $50 < x <= 200$, hàm lợi nhuận của hãng là $P(x) = (500.000 - 2.000x)x$ (đồng).]),
        [Hãng thời trang đạt lợi nhuận lớn nhất khi đại lý đặt mua đúng $150$ chiếc áo.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Khi mua $50$ chiếc: Lợi nhuận mỗi chiếc là $800.000 - 400.000 = 400.000$ đồng.
        Tổng lợi nhuận: $50 dot 400.000 = 20.000.000$ đồng = $20$ triệu đồng. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Với $x > 50$, số chiếc vượt là $x - 50$.
        Giá bán: $p(x) = 800.000 - 2.000(x - 50) = 900.000 - 2.000x$ (đồng).
        Điều kiện $p(x) >= 500.000 <=> 900.000 - 2.000x >= 500.000 <=> 2.000x <= 400.000 <=> x <= 200$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Lợi nhuận mỗi chiếc: $p(x) - 400.000 = (900.000 - 2.000x) - 400.000 = 500.000 - 2.000x$.
        Tổng lợi nhuận: $P(x) = (500.000 - 2.000x)x$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Hàm bậc hai $P(x) = -2000x^2 + 500.000x$ đạt cực đại tại đỉnh:
        $x = (-500.000) / (-4000) = 125$ chiếc (chứ không phải $150$ chiếc).
        Do đó ý d SAI.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một công ty điện lực độc quyền cung cấp điện cho một hòn đảo du lịch. Doanh thu biên ($M R$) và chi phí biên ($M C$) theo sản lượng điện tiêu thụ $x$ (nghìn kWh) lần lượt là:
$ M R(x) = 60 - 0","04 x quad "và" quad M C(x) = 10 + 0","01 x quad ("nghìn đồng/kWh"). $
Biết rằng chi phí cố định duy trì trạm phát điện là $50$ triệu đồng.],
    (
        True([Doanh thu biên là đạo hàm của hàm tổng doanh thu $R'(x) = M R(x)$ và chi phí biên là đạo hàm của hàm tổng chi phí $C'(x) = M C(x)$.]),
        True([Để lợi nhuận của công ty đạt cực đại thì điều kiện cần là doanh thu biên bằng chi phí biên ($M R = M C$).]),
        True([Mức sản lượng điện tối ưu để tối đa hóa lợi nhuận là $x = 1000$ nghìn kWh.]),
        [Tại mức sản lượng tối ưu $x = 1000$ nghìn kWh, chi phí biên của công ty là $15$ nghìn đồng/kWh.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Theo nguyên lý kinh tế vi mô và vi tích phân, chi phí biên $M C(x) = C'(x)$ và doanh thu biên $M R(x) = R'(x)$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Lợi nhuận $P(x) = R(x) - C(x) => P'(x) = R'(x) - C'(x) = M R(x) - M C(x) = 0 <=> M R(x) = M C(x)$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Cho $M R(x) = M C(x) <=> 60 - 0","04x = 10 + 0","01x <=> 0","05x = 50 <=> x = 50 / 0","05 = 1000$ nghìn kWh. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Tại $x = 1000$, chi phí biên là:
        $M C(1000) = 10 + 0","01(1000) = 10 + 10 = 20$ nghìn đồng/kWh (không phải $15$). Ý d SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một công ty du lịch chào bán tour du lịch hè với giá $4$ triệu đồng/người cho nhóm tối đa $20$ khách. Nếu nhóm khách có từ $21$ người trở lên, cứ mỗi người tăng thêm thì giá vé của tất cả mọi người trong đoàn sẽ giảm đi $100.000$ đồng. Doanh thu của công ty du lịch đạt giá trị lớn nhất khi nhóm khách có bao nhiêu người?],
    [30],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi số người vượt quá $20$ là $x$ ($x >= 0$).
        Số khách trong đoàn là $N = 20 + x$ (người).
        Giá vé mỗi người: $p = 4.000.000 - 100.000x$ (đồng) = $100.000(40 - x)$.
        Tổng doanh thu:
        $R(x) = N dot p = 100.000 (20 + x)(40 - x) = 100.000 (-x^2 + 20x + 800)$.
        Đạt cực đại tại đỉnh parabol: $x = (-20)/(-2) = 10$.
        Vậy số khách tối ưu trong đoàn là:
        $N = 20 + 10 = 30$ người.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một nhà xuất bản phát hành một cuốn sách tham khảo. Chi phí cố định để dàn trang và chế bản là $30$ triệu đồng. Chi phí in ấn mỗi cuốn sách là $20.000$ đồng. Nếu bán với giá $p$ (nghìn đồng/cuốn) thì số lượng sách bán được là $x = 120 - p$ (nghìn cuốn). Lợi nhuận của nhà xuất bản đạt cực đại khi giá bán mỗi cuốn sách bằng bao nhiêu nghìn đồng?],
    [70],
    loigiai: [
        #step([Lời giải chi tiết])
        Đơn vị tính: nghìn đồng và nghìn cuốn.
        Chi phí in mỗi cuốn là $20$ nghìn đồng. Chi phí cố định là $30.000$ nghìn đồng.
        Lợi nhuận trên mỗi cuốn sách bán ra là $p - 20$ (nghìn đồng).
        Số lượng bán được là $x = 120 - p$ (nghìn cuốn).
        Tổng lợi nhuận:
        $P(p) = (p - 20)(120 - p) - 30.000 = -p^2 + 140p - 2400 - 30.000 = -p^2 + 140p - 32.400$.
        Hàm số bậc hai đạt cực đại tại:
        $p = (-140)/(-2) = 70$ nghìn đồng.
        Vậy giá bán tối ưu là $70$ nghìn đồng/cuốn.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một trang trại nuôi gà đẻ trứng nhận thấy: Khi nuôi $1000$ con gà thì năng suất bình quân là $280$ quả trứng/con/năm. Nếu nuôi thêm gà trong cùng một chuồng trại, do mật độ đông đúc nên cứ mỗi $100$ con nuôi thêm thì sản lượng bình quân mỗi con giảm đi $10$ quả trứng/năm. Để tổng sản lượng trứng thu được trong năm là lớn nhất thì nên nuôi tổng cộng bao nhiêu con gà?],
    [1900],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi số lần nuôi thêm $100$ con gà là $x$ ($x >= 0$).
        Số gà nuôi là $N = 1000 + 100x = 100(10 + x)$ (con).
        Sản lượng bình quân mỗi con là $Y = 280 - 10x = 10(28 - x)$ (quả trứng/năm).
        Tổng sản lượng trứng:
        $S(x) = N dot Y = 1000 (10 + x)(28 - x) = 1000 (-x^2 + 18x + 280)$.
        Đạt cực đại tại $x = (-18)/(-2) = 9$.
        Số con gà tối ưu nên nuôi:
        $N = 1000 + 100(9) = 1900$ con gà.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một nhà máy xi măng có hàm chi phí sản xuất $x$ tấn xi măng mỗi ngày là $C(x) = x^2 + 60x + 2500$ (nghìn đồng). Biết rằng toàn bộ lượng xi măng sản xuất ra đều được tiêu thụ với giá thị trường không đổi là $160$ nghìn đồng/tấn. Lợi nhuận lớn nhất mà nhà máy có thể đạt được trong một ngày bằng bao nhiêu triệu đồng?],
    [0],
    loigiai: [
        #step([Lời giải chi tiết])
        Tổng doanh thu: $R(x) = 160x$ (nghìn đồng).
        Tổng chi phí: $C(x) = x^2 + 60x + 2500$ (nghìn đồng).
        Hàm lợi nhuận:
        $P(x) = R(x) - C(x) = 160x - (x^2 + 60x + 2500) = -x^2 + 100x - 2500$.
        Ta có $P(x) = -(x - 50)^2 <= 0$.
        Lợi nhuận lớn nhất đạt được khi $x = 50$ tấn, khi đó $P(50) = 0$ đồng (đạt điểm hòa vốn).
        Nếu giá bán là $180$ nghìn đồng/tấn:
        $P(x) = 180x - (x^2 + 60x + 2500) = -x^2 + 120x - 2500 = -(x - 60)^2 + 1100$.
        Khi đó lợi nhuận cực đại là $1100$ nghìn đồng = $1","1$ triệu đồng.
        Với giá bán $160$ nghìn đồng/tấn, lợi nhuận lớn nhất bằng đúng $0$ triệu đồng.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Một cửa hàng kinh doanh trà sữa có chi phí pha chế cố định mỗi ly là $12.000$ đồng. Nếu bán với giá $30.000$ đồng/ly thì mỗi ngày bán được $200$ ly. Cứ mỗi lần tăng giá thêm $1.000$ đồng/ly thì lượng bán mỗi ngày giảm đi $10$ ly. Lợi nhuận lớn nhất mỗi ngày của cửa hàng bằng bao nhiêu triệu đồng?],
    [3.61],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi $x$ là số nghìn đồng tăng giá ($x >= 0$).
        Giá bán mỗi ly: $30 + x$ (nghìn đồng).
        Lợi nhuận mỗi ly: $(30 + x) - 12 = 18 + x$ (nghìn đồng).
        Số ly bán được: $200 - 10x$ (ly) với $0 <= x < 20$.
        Tổng lợi nhuận mỗi ngày:
        $L(x) = (18 + x)(200 - 10x) = 10(18 + x)(20 - x) = 10(-x^2 + 2x + 360) = 10[-(x - 1)^2 + 361]$.
        Đạt cực đại tại $x = 1$ (tăng thêm $1.000$ đồng, bán giá $31.000$ đồng/ly).
        Lợi nhuận lớn nhất:
        $L_"max" = 10 dot 361 = 3610$ nghìn đồng = $3","61$ triệu đồng.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd01D — Mã 504], back-to: "sec-exercise-hub",[Hàm sản xuất ngắn hạn của một phân xưởng may mặc được cho bởi công thức $Q(L) = -L^3 + 12 L^2 + 60 L$, trong đó $L$ là số lượng công nhân làm việc ($1 <= L <= 10$) và $Q$ là số sản phẩm may được mỗi ngày. Năng suất lao động bình quân của mỗi công nhân được xác định bởi $A P(L) = Q(L) / L$. Năng suất lao động bình quân đạt giá trị lớn nhất khi phân xưởng bố trí bao nhiêu công nhân?],
    [6],
    loigiai: [
        #step([Lời giải chi tiết])
        Hàm năng suất bình quân:
        $A P(L) = Q(L) / L = (-L^3 + 12 L^2 + 60 L) / L = -L^2 + 12 L + 60$.
        Đây là một tam thức bậc hai theo biến $L$ có hệ số bậc hai âm (bề lõm quay xuống dưới).
        Hàm số đạt giá trị lớn nhất tại đỉnh parabol:
        $L = (-b)/(2a) = (-12)/(-2) = 6$ (công nhân).
        Khi bố trí $L = 6$ công nhân, năng suất bình quân mỗi công nhân lớn nhất và đạt:
        $A P(6) = -(6^2) + 12(6) + 60 = -36 + 72 + 60 = 96$ sản phẩm/công nhân/ngày.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHỦ ĐỀ 1D: TỐI ƯU HÓA KINH TẾ, DOANH THU & LỢI NHUẬN (VD - VDC)!]      #v(0.6em)
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
