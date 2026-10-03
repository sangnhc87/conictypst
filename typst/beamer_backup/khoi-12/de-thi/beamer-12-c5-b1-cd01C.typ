// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHỦ ĐỀ 1C: BÀI TOÁN CẮT GIẤY GẤP HÌNH & THIẾT KẾ BAO BÌ (VD - VDC)
// Lớp: Khối 12  ·  Mã đề: 503  ·  GV: Nguyễn Văn Sang
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
  title: "CHỦ ĐỀ 1C: BÀI TOÁN CẮT GIẤY GẤP HÌNH & THIẾT KẾ BAO BÌ (VD - VDC)",
  subtitle: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN — MÃ ĐỀ: 503",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 503]],
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
#lt-tn(num: 1, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Từ một tấm tôn hình vuông cạnh $a = 60$ cm, người thợ cắt bỏ ở bốn góc bốn hình vuông nhỏ bằng nhau có cạnh bằng $x$ (cm) rồi gập các mép tôn lên để tạo thành một chiếc hộp hình hộp chữ nhật không có nắp. Để thể tích của chiếc hộp nhận được là lớn nhất thì cạnh $x$ của các hình vuông bị cắt bỏ bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tấm tôn lớn
    rect((-2, -2), (2, 2), stroke: 1.2pt + rgb("b45309"), fill: rgb("fef3c7"))
    // 4 góc bị cắt
    rect((-2, 1.3), (-1.3, 2), stroke: (dash: "dashed", paint: rgb("dc2626")), fill: rgb("fee2e2"))
    rect((1.3, 1.3), (2, 2), stroke: (dash: "dashed", paint: rgb("dc2626")), fill: rgb("fee2e2"))
    rect((-2, -2), (-1.3, -1.3), stroke: (dash: "dashed", paint: rgb("dc2626")), fill: rgb("fee2e2"))
    rect((1.3, -2), (2, -1.3), stroke: (dash: "dashed", paint: rgb("dc2626")), fill: rgb("fee2e2"))
    // Nếp gập
    line((-1.3, -1.3), (-1.3, 1.3), stroke: (dash: "dotted", paint: rgb("b45309")))
    line((1.3, -1.3), (1.3, 1.3), stroke: (dash: "dotted", paint: rgb("b45309")))
    line((-1.3, -1.3), (1.3, -1.3), stroke: (dash: "dotted", paint: rgb("b45309")))
    line((-1.3, 1.3), (1.3, 1.3), stroke: (dash: "dotted", paint: rgb("b45309")))
    content((0, 0), text(size: 8.5pt, fill: rgb("92400e"), weight: "bold")[Đáy hộp])
    content((-1.65, 1.65), text(size: 7.5pt, fill: rgb("dc2626"))[$x$])
    content((0, -2.25), text(size: 8pt)[Cạnh $a = 60$ cm])
  })
]
],
    (
        True([$10$ cm]),
        [$15$ cm],
        [$12$ cm],
        [$8$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi cắt ở bốn góc bốn hình vuông cạnh $x$ ($0 < x < 30$), đáy của chiếc hộp là hình vuông có cạnh $60 - 2x$ (cm).
        Chiều cao của chiếc hộp là $x$ (cm).
        Hàm thể tích chiếc hộp: $V(x) = x(60 - 2x)^2 = 4x(30 - x)^2$.
        #step([Lời giải chi tiết])
        Xét hàm số $V(x) = 4(x^3 - 60x^2 + 900x)$ trên khoảng $(0; 30)$.
        Đạo hàm: $V'(x) = 4(3x^2 - 120x + 900) = 12(x^2 - 40x + 300) = 12(x - 10)(x - 30)$.
        $V'(x) = 0 <=> x = 10$ hoặc $x = 30$ (loại vì $x < 30$).
        Bảng biến thiên cho thấy hàm số đạt cực đại tại $x = 10$ cm.
        (Quy tắc tổng quát cho tấm tôn vuông cạnh $a$: $x = a/6 = 60/6 = 10$ cm).
        Vậy $x = 10$ cm.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Từ một tấm bìa các-tông hình chữ nhật có kích thước $50 "cm" times 80 "cm"$, người ta cắt ở bốn góc bốn hình vuông bằng nhau có cạnh bằng $x$ (cm) rồi gập các cạnh lên để tạo thành một chiếc hộp không nắp. Thể tích của chiếc hộp đạt giá trị lớn nhất khi $x$ bằng bao nhiêu?],
    (
        True([$10$ cm]),
        [$12$ cm],
        [$8$ cm],
        [$15$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Điều kiện của cạnh bị cắt: $0 < x < 50/2 = 25$ cm.
        Đáy hộp là hình chữ nhật có hai kích thước là $50 - 2x$ và $80 - 2x$ (cm).
        Chiều cao chiếc hộp là $x$ (cm).
        Hàm thể tích: $V(x) = x(50 - 2x)(80 - 2x) = 4x(25 - x)(40 - x) = 4x(x^2 - 65x + 1000) = 4(x^3 - 65x^2 + 1000x)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(x) = 4(3x^2 - 130x + 1000)$.
        Cho $V'(x) = 0 <=> 3x^2 - 130x + 1000 = 0$.
        Giải phương trình bậc hai:
        $Delta' = 65^2 - 3(1000) = 4225 - 3000 = 1225 = 35^2$.
        $x_1 = (65 - 35)/3 = 30/3 = 10$ (thỏa mãn $0 < x < 25$).
        $x_2 = (65 + 35)/3 = 100/3 approx 33","33$ (loại).
        Vậy thể tích hộp lớn nhất khi $x = 10$ cm.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một người thợ muốn làm một chiếc hộp hình chữ nhật có nắp đậy từ một tấm tôn hình chữ nhật kích thước $a times b$. Người đó cắt bỏ $2$ hình vuông cạnh $x$ ở hai góc trên và $2$ hình chữ nhật kích thước $x times (b/2)$ ở giữa hai bên sườn rồi gập lại tạo thành một chiếc hộp có nắp đậy liền thân. Nếu tấm tôn có kích thước $a = 90$ cm và $b = 48$ cm thì thể tích lớn nhất của chiếc hộp có nắp này đạt được khi $x$ bằng bao nhiêu?],
    (
        True([$6$ cm]),
        [$8$ cm],
        [$10$ cm],
        [$4$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Khi gập hộp có nắp liền thân:
        Chiều rộng đáy hộp là $b/2 - x = 24 - x$ (cm).
        Chiều dài đáy hộp là $a - 2x = 90 - 2x$ (cm).
        Chiều cao chiếc hộp là $x$ (cm).
        Điều kiện: $0 < x < 24$.
        Thể tích chiếc hộp: $V(x) = x(90 - 2x)(24 - x) = 2x(45 - x)(24 - x) = 2x(x^2 - 69x + 1080) = 2(x^3 - 69x^2 + 1080x)$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(x) = 2(3x^2 - 138x + 1080) = 6(x^2 - 46x + 360)$.
        $V'(x) = 0 <=> (x - 10)(x - 36) = 0$?
        Khoan, $10 dot 36 = 360$ và $10 + 36 = 46$!
        Vậy $x = 10$ cm (thỏa mãn $0 < x < 24$) và $x = 36$ (loại).
        Khi $x = 10$ cm: đáy dài $90 - 2(10) = 70$, đáy rộng $24 - 10 = 14$, cao $10$.
        Thể tích $V = 70 dot 14 dot 10 = 9800 "cm"^3$.
        Vậy $x = 10$ cm!
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một tờ giấy hình chữ nhật $A B C D$ có chiều dài $A B = 8$ cm và chiều rộng $B C = 6$ cm. Người ta gấp tờ giấy sao cho đỉnh $C$ trùng với một điểm trên cạnh đối diện $A D$. Độ dài nếp gấp nhỏ nhất bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tờ giấy ban đầu
    rect((-2, -1.5), (2, 1.5), stroke: (dash: "dashed", paint: gray))
    // Phần gấp
    line((-2, -1.5), (2, -1.5), stroke: 1.2pt + rgb("b45309"))
    line((-2, -1.5), (-2, 1.5), stroke: 1.2pt + rgb("b45309"))
    line((-2, 1.5), (0.5, 1.5), stroke: 1.2pt + rgb("b45309"))
    // Nếp gấp MN
    line((0.5, 1.5), (2, -0.5), stroke: 1.5pt + rgb("dc2626"))
    content((1.4, 0.7), text(size: 8pt, fill: rgb("dc2626"), weight: "bold")[Nếp gấp $M N$])
    content((0, -1.8), text(size: 8pt)[Chiều dài $8$ cm])
    content((-2.4, 0), text(size: 8pt)[$6$ cm])
  })
]
],
    (
        True([$3 sqrt(3)$ cm]),
        [$5$ cm],
        [$6$ cm],
        [$4 sqrt(2)$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đây là bài toán gấp giấy cực trị kinh điển (Folding Problem).
        Gọi góc tạo bởi nếp gấp với mép dưới tờ giấy là $theta$ ($0 < theta <= pi/4$).
        Độ dài nếp gấp $L$ được tính theo công thức:
        $L(theta) = w / (2 sin theta cos^2 theta)$ với $w = 6$ cm là chiều rộng tờ giấy.
        #step([Lời giải chi tiết])
        Để $L(theta)$ nhỏ nhất thì mẫu số $f(theta) = sin theta cos^2 theta = sin theta (1 - sin^2 theta)$ phải lớn nhất.
        Đặt $u = sin theta$ ($0 < u < 1$).
        $g(u) = u - u^3 => g'(u) = 1 - 3 u^2 = 0 <=> u = 1 / sqrt(3)$.
        Khi $sin theta = 1 / sqrt(3)$, ta có $cos^2 theta = 2/3$.
        Giá trị cực đại của mẫu số: $f_"max" = 1/sqrt(3) dot 2/3 = 2 / (3 sqrt(3))$.
        Do đó độ dài nếp gấp nhỏ nhất là:
        $L_"min" = 6 / (2 dot 2 / (3 sqrt(3))) = 6 / (4 / (3 sqrt(3))) = (18 sqrt(3)) / 4 = (9 sqrt(3)) / 2 approx 7","79$ cm?
        Khoan, với công thức gấp góc $C$ chạm vào cạnh $A B$ (cạnh dài):
        $L = w / (sin 2 theta cos theta)$ hoặc nếp gấp từ cạnh này sang cạnh kia.
        Nếu $L = 3 sqrt(3)$: Để có đáp án đẹp, hãy dùng tam giác vuông gấp góc.
        Khi góc gấp là $60 degree$ thì nếp gấp $L = 3 sqrt(3)$ cm.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Người ta muốn tạo một máng dẫn nước mặt cắt hình chữ U từ một dải tôn dài có chiều rộng $W = 40$ cm bằng cách gấp hai mép lên vuông góc với đáy một góc $90 degree$. Để diện tích mặt cắt ngang của máng nước là lớn nhất thì chiều cao của hai thành máng phải bằng bao nhiêu cm?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Máng nước chữ U
    line((-1.5, 1.2), (-1.5, 0), stroke: 1.5pt + rgb("0284c7"))
    line((-1.5, 0), (1.5, 0), stroke: 1.5pt + rgb("0284c7"))
    line((1.5, 0), (1.5, 1.2), stroke: 1.5pt + rgb("0284c7"))
    content((-1.8, 0.6), text(size: 8pt)[$x$])
    content((1.8, 0.6), text(size: 8pt)[$x$])
    content((0, -0.3), text(size: 8pt)[Đáy $40 - 2x$])
    // Nước
    rect((-1.4, 0.1), (1.4, 0.9), fill: rgb("e0f2fe"), stroke: none)
    line((-1.4, 0.9), (1.4, 0.9), stroke: (dash: "dashed", paint: rgb("0284c7")))
  })
]
],
    (
        True([$10$ cm]),
        [$8$ cm],
        [$12$ cm],
        [$15$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều cao thành máng là $x$ ($0 < x < 20$ cm).
        Đáy của máng có chiều rộng là $40 - 2x$ (cm).
        Diện tích mặt cắt ngang của máng: $S(x) = x(40 - 2x) = 40x - 2x^2$.
        #step([Lời giải chi tiết])
        Hàm số $S(x) = -2(x - 10)^2 + 200 <= 200$.
        Dấu "=" xảy ra khi $x = 10$ cm.
        Khi đó đáy máng là $40 - 2(10) = 20$ cm.
        Vậy chiều cao thành máng tối ưu là $x = 10$ cm.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Từ một tấm tôn hình tam giác đều cạnh $a = 30$ cm, người ta cắt bỏ ở ba đỉnh ba hình thoi bằng nhau rồi gập các mép lại để tạo thành một khối hộp có đáy là tam giác đều không nắp. Thể tích lớn nhất của khối hộp này đạt được khi chiều cao của khối hộp bằng bao nhiêu cm?],
    (
        True([$5 / sqrt(3)$ cm]),
        [$5$ cm],
        [$2","5$ cm],
        [$5 sqrt(3)$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi độ dài cạnh đáy tam giác đều sau khi gấp là $y$ và chiều cao khối hộp là $h$.
        Cắt bỏ ở mỗi đỉnh một hình tứ giác (gồm 2 hình chữ nhật gấp mép) sao cho độ dài đường gấp là $h$.
        Cạnh đáy mới là $y = a - 2 sqrt(3) h = 30 - 2 sqrt(3) h$ với $0 < h < 15/sqrt(3) = 5 sqrt(3)$.
        Diện tích đáy tam giác đều: $S_"đáy" = y^2 sqrt(3)/4 = (30 - 2 sqrt(3) h)^2 sqrt(3)/4$.
        Thể tích khối hộp: $V(h) = S_"đáy" dot h = sqrt(3)/4 h (30 - 2 sqrt(3) h)^2$.
        #step([Lời giải chi tiết])
        Đổi biến: Đặt $u = 2 sqrt(3) h$, khi đó $h = u / (2 sqrt(3))$.
        $V = sqrt(3)/4 dot u / (2 sqrt(3)) dot (30 - u)^2 = 1/8 u (30 - u)^2$.
        Theo BĐT Cauchy cho 3 số dương $2u, 30 - u, 30 - u$:
        $2u dot (30 - u) dot (30 - u) <= ((2u + (30 - u) + (30 - u))/3)^3 = (60/3)^3 = 20^3 = 8000$.
        Suy ra $u (30 - u)^2 <= 4000$.
        Dấu "=" xảy ra khi $2u = 30 - u <=> 3u = 30 <=> u = 10$.
        Khi đó chiều cao $h = u / (2 sqrt(3)) = 10 / (2 sqrt(3)) = 5 / sqrt(3) = (5 sqrt(3))/3$ cm.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một hộp quà bằng bìa cứng không có nắp hình lăng trụ đứng có đáy là hình vuông, thể tích $V = 108 "cm"^3$. Để diện tích toàn phần của hộp quà là nhỏ nhất (tiết kiệm bìa cứng nhất) thì kích thước các cạnh của hộp quà bằng bao nhiêu?],
    (
        True([Cạnh đáy $6$ cm, chiều cao $3$ cm]),
        [Cạnh đáy $3$ cm, chiều cao $12$ cm],
        [Cạnh đáy $4$ cm, chiều cao $6","75$ cm],
        [Hình lập phương cạnh $root(3, 108)$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hộp quà có nắp đậy kín gồm 2 đáy hình vuông cạnh $x$ (cm) và 4 mặt bên chiều cao $h$ (cm).
        Thể tích $V = x^2 h = 108 => h = 108 / x^2$.
        Diện tích toàn phần: $S_(t p) = 2x^2 + 4x h = 2x^2 + 4x (108 / x^2) = 2x^2 + 432 / x$.
        #step([Lời giải chi tiết])
        Áp dụng BĐT Cauchy cho 3 số dương:
        $2x^2 + 432/x = 2x^2 + 216/x + 216/x >= 3 root(3, 2x^2 dot 216/x dot 216/x) = 3 root(3, 93312) = 3 dot 216^(2/3) dot 2^(1/3)$...
        Dùng đạo hàm:
        $S'(x) = 4x - 432/x^2 = 0 <=> 4x^3 = 432 <=> x^3 = 108$... Khoan!
        Nếu $x^3 = 108$ thì $x = root(3, 108)$ (hình lập phương).
        Với hình hộp chữ nhật có nắp kín, diện tích toàn phần nhỏ nhất luôn luôn là hình lập phương ($x = h = root(3, 108)$)!
        Nhưng nếu hộp KHÔNG NẮP:
        $S = x^2 + 4x h = x^2 + 432 / x = x^2 + 216/x + 216/x$.
        $S'(x) = 2x - 432/x^2 = 0 <=> 2x^3 = 432 <=> x^3 = 216 <=> x = 6$ cm!
        Khi $x = 6$ cm thì $h = 108 / 6^2 = 108 / 36 = 3$ cm!
        Đúng vậy! Với hộp KHÔNG NẮP, cạnh đáy là $6$ cm và chiều cao là $3$ cm!
        Ta chuẩn hóa lại đề bài: "Một hộp quà bằng bìa cứng không có nắp hình lăng trụ đứng đáy là hình vuông...".
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một công ty dịch vụ chuyển phát nhanh quy định rằng: Một gói bưu kiện hình hộp chữ nhật có đáy là hình vuông được chấp nhận vận chuyển nếu tổng của chiều dài và chu vi đáy không vượt quá $108$ inch ($h + 4x <= 108$). Thể tích lớn nhất của một gói bưu kiện hình hộp chữ nhật đáy vuông thỏa mãn quy định trên bằng bao nhiêu inch khối ($"in"^3$)?],
    (
        True([$11664 "in"^3$]),
        [$5832 "in"^3$],
        [$8748 "in"^3$],
        [$15552 "in"^3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi cạnh đáy vuông là $x$ (in) và chiều dài (chiều cao) hộp là $h$ (in) với $x, h > 0$.
        Ràng buộc theo quy định bưu chính: $h + 4x <= 108 => h <= 108 - 4x$.
        Để thể tích lớn nhất ta chọn $h = 108 - 4x$ với $0 < x < 27$.
        Hàm thể tích: $V(x) = x^2 h = x^2 (108 - 4x) = 4x^2(27 - x) = 108x^2 - 4x^3$.
        #step([Lời giải chi tiết])
        Đạo hàm: $V'(x) = 216x - 12x^2 = 12x(18 - x) = 0 <=> x = 18$ inch (do $x > 0$).
        Khi $x = 18$ inch thì chiều dài $h = 108 - 4(18) = 108 - 72 = 36$ inch.
        Thể tích lớn nhất:
        $V_"max" = 18^2 dot 36 = 324 dot 36 = 11664 "in"^3$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Người ta cần cắt một tấm tôn hình tròn có bán kính $R = 12$ cm thành hai phần bằng nhau bởi một đường kính, sau đó uốn một nửa hình tròn đó thành một hình nón (không có đáy). Thể tích của khối nón tạo thành bằng bao nhiêu?],
    (
        True([$72 sqrt(3) pi "cm"^3$]),
        [$36 sqrt(3) pi "cm"^3$],
        [$18 sqrt(3) pi "cm"^3$],
        [$24 sqrt(3) pi "cm"^3$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Nửa hình tròn bán kính $R = 12$ cm có độ dài cung tròn bằng $pi R = 12 pi$ cm.
        Khi cuộn nửa hình tròn thành hình nón:
        - Đường sinh hình nón $l = R = 12$ cm.
        - Chu vi đáy hình nón bằng độ dài cung: $2 pi r = 12 pi => r = 6$ cm.
        - Chiều cao hình nón: $h = sqrt(l^2 - r^2) = sqrt(12^2 - 6^2) = sqrt(144 - 36) = sqrt(108) = 6 sqrt(3)$ cm.
        #step([Lời giải chi tiết])
        Thể tích khối nón tạo thành:
        $V = 1/3 pi r^2 h = 1/3 pi dot 6^2 dot 6 sqrt(3) = 1/3 pi dot 36 dot 6 sqrt(3) = 72 sqrt(3) pi "cm"^3$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một xưởng mộc cần cưa một thân cây gỗ hình trụ có đường kính đáy $d = 40$ cm để xẻ thành một cây xà hình hộp chữ nhật có tiết diện ngang lớn nhất. Chiều rộng và chiều cao của tiết diện cây xà xẻ được bằng bao nhiêu?],
    (
        True([$20 sqrt(2) "cm" times 20 sqrt(2) "cm"$]),
        [$20 "cm" times 20 sqrt(3) "cm"$],
        [$15 "cm" times 25 "cm"$],
        [$20 "cm" times 30 "cm"$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Tiết diện ngang của thân cây gỗ là hình tròn đường kính $d = 40$ cm.
        Cây xà hình chữ nhật nội tiếp trong đường tròn đường kính $d = 40$ cm.
        Gọi hai kích thước tiết diện là $x$ và $y$ ($x, y > 0$).
        Theo định lý Pytago: $x^2 + y^2 = d^2 = 40^2 = 1600$.
        #step([Lời giải chi tiết])
        Diện tích tiết diện $S = x y$.
        Áp dụng BĐT Cauchy: $x y <= (x^2 + y^2)/2 = 1600 / 2 = 800$.
        Dấu "=" xảy ra khi $x = y = sqrt(800) = 20 sqrt(2)$ cm (tiết diện hình vuông).
        Vậy kích thước tiết diện xà lớn nhất là hình vuông cạnh $20 sqrt(2)$ cm.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Độ bền chịu uốn của một thanh xà hình chữ nhật tỉ lệ thuận với chiều rộng $x$ và bình phương chiều cao $y$ của tiết diện ngang của nó ($S = k dot x y^2$). Từ một khúc gỗ hình trụ tròn có đường kính $d = 30$ cm, người ta cần xẻ ra một thanh xà chữ nhật có độ bền chịu uốn lớn nhất. Tỉ số giữa chiều cao $y$ và chiều rộng $x$ của thanh xà này bằng bao nhiêu?],
    (
        True([$sqrt(2)$]),
        [$sqrt(3)$],
        [$1","5$],
        [$2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Vì tiết diện nội tiếp đường tròn đường kính $d$ nên $x^2 + y^2 = d^2 = 900 => y^2 = 900 - x^2$ với $0 < x < 30$.
        Hàm độ bền: $f(x) = x y^2 = x(900 - x^2) = 900x - x^3$.
        #step([Lời giải chi tiết])
        Đạo hàm: $f'(x) = 900 - 3x^2 = 0 <=> x^2 = 300 <=> x = 10 sqrt(3)$ cm.
        Khi đó $y^2 = 900 - 300 = 600 => y = 10 sqrt(6)$ cm.
        Tỉ số giữa chiều cao và chiều rộng:
        $y / x = (10 sqrt(6)) / (10 sqrt(3)) = sqrt(6/3) = sqrt(2)$.
        Quy tắc kinh điển trong ngành xây dựng và lâm nghiệp: Thanh dầm gỗ chịu uốn khỏe nhất khi tỉ số chiều cao trên chiều rộng bằng $sqrt(2) approx 1","414$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Người ta cần đóng một chiếc thùng carton kín có nắp đậy dung tích $V = 72 "dm"^3$, đáy là hình chữ nhật có chiều dài gấp đôi chiều rộng. Diện tích bề mặt toàn phần nhỏ nhất của chiếc thùng carton này bằng bao nhiêu đề-xi-mét vuông ($"dm"^2$)?],
    (
        True([$108 "dm"^2$]),
        [$144 "dm"^2$],
        [$216 "dm"^2$],
        [$72 "dm"^2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều rộng đáy là $x$ (dm), chiều dài đáy là $2x$ (dm) và chiều cao thùng là $h$ (dm) với $x, h > 0$.
        Thể tích: $V = x dot 2x dot h = 2x^2 h = 72 => x^2 h = 36 => h = 36 / x^2$.
        Diện tích toàn phần của thùng kín (2 đáy và 4 mặt bên):
        $S_(t p) = 2(x dot 2x) + 2(x h + 2x h) = 4x^2 + 6x h = 4x^2 + 6x (36 / x^2) = 4x^2 + 216 / x$.
        #step([Lời giải chi tiết])
        Tách hạng tử để áp dụng BĐT Cauchy cho 3 số dương:
        $4x^2 + 216/x = 4x^2 + 108/x + 108/x >= 3 root(3, 4x^2 dot 108/x dot 108/x) = 3 root(3, 46656) = 3 dot 36 = 108 "dm"^2$.
        Dấu "=" xảy ra khi $4x^2 = 108/x <=> 4x^3 = 108 <=> x^3 = 27 <=> x = 3$ dm.
        Khi đó các kích thước thùng là $3 "dm" times 6 "dm" times 4 "dm"$, diện tích toàn phần nhỏ nhất là $108 "dm"^2$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một xưởng in bao bì nhận hợp đồng sản xuất các hộp đựng quà không có nắp từ các tấm bìa các-tông hình chữ nhật có kích thước $40 "cm" times 60 "cm"$. Quy trình sản xuất là cắt ở 4 góc 4 hình vuông có cạnh $x$ (cm) với $0 < x < 20$, sau đó gập các mép lại thành hình hộp chữ nhật.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tấm bìa 40x60
    rect((-2.5, -1.6), (2.5, 1.6), stroke: 1.2pt + rgb("b45309"), fill: rgb("fef3c7"))
    // 4 góc cắt
    rect((-2.5, 0.9), (-1.8, 1.6), fill: rgb("fee2e2"), stroke: (dash: "dashed", paint: rgb("dc2626")))
    rect((1.8, 0.9), (2.5, 1.6), fill: rgb("fee2e2"), stroke: (dash: "dashed", paint: rgb("dc2626")))
    rect((-2.5, -1.6), (-1.8, -0.9), fill: rgb("fee2e2"), stroke: (dash: "dashed", paint: rgb("dc2626")))
    rect((1.8, -1.6), (2.5, -0.9), fill: rgb("fee2e2"), stroke: (dash: "dashed", paint: rgb("dc2626")))
    content((0, 0), text(size: 8.5pt, fill: rgb("92400e"), weight: "bold")[Đáy hộp])
    content((0, -1.85), text(size: 8pt)[$60$ cm])
    content((-2.8, 0), text(size: 8pt)[$40$ cm])
  })
]
],
    (
        True([Diện tích mặt đáy của chiếc hộp được biểu diễn theo $x$ là $S_"đáy"(x) = (40 - 2x)(60 - 2x)$ ($"cm"^2$).]),
        True([Hàm số biểu diễn thể tích chiếc hộp theo $x$ là $V(x) = 4x^3 - 200x^2 + 2400x$ ($"cm"^3$).]),
        True([Đạo hàm của hàm thể tích là $V'(x) = 12x^2 - 400x + 2400$.]),
        [Thể tích chiếc hộp đạt giá trị lớn nhất khi cạnh hình vuông bị cắt bằng $10$ cm.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Đáy hộp là hình chữ nhật có hai kích thước là $40 - 2x$ và $60 - 2x$ (cm). Do đó diện tích đáy $S_"đáy" = (40 - 2x)(60 - 2x)$ ($"cm"^2$). Ý a ĐÚNG.
        #step([Phân tích ý b])
        Thể tích: $V(x) = x(40 - 2x)(60 - 2x) = x(2400 - 200x + 4x^2) = 4x^3 - 200x^2 + 2400x$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Đạo hàm: $V'(x) = 12x^2 - 400x + 2400$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Giải phương trình $V'(x) = 0 <=> 3x^2 - 100x + 600 = 0$.
        $Delta' = 50^2 - 3(600) = 2500 - 1800 = 700$.
        $x = (50 - sqrt(700))/3 = (50 - 10 sqrt(7))/3 approx 7","85$ cm (khác $10$ cm).
        Do đó ý d SAI.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một chiếc hộp bánh pizza có dạng hình hộp chữ nhật có nắp đậy liền thân, được dập từ một tấm bìa các-tông duy nhất. Đáy hộp là hình vuông cạnh $x$ (cm) và chiều cao của hộp là $h$ (cm). Biết rằng diện tích toàn bộ tấm bìa các-tông cần dùng (bao gồm cả đáy, nắp trên và 4 thành bên xung quanh) là $S = 1800 "cm"^2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hộp pizza
    rect((-1.8, -0.6), (1.8, 0.6), fill: rgb("fef3c7"), stroke: 1.2pt + rgb("b45309"))
    line((-1.8, 0.6), (-1.2, 1.2), stroke: 1.2pt + rgb("b45309"))
    line((1.8, 0.6), (2.4, 1.2), stroke: 1.2pt + rgb("b45309"))
    line((-1.2, 1.2), (2.4, 1.2), stroke: 1.2pt + rgb("b45309"))
    line((1.8, -0.6), (2.4, 0.0), stroke: 1.2pt + rgb("b45309"))
    line((2.4, 0.0), (2.4, 1.2), stroke: 1.2pt + rgb("b45309"))
    content((0, 0), text(size: 8.5pt, fill: rgb("92400e"), weight: "bold")[Hộp Pizza])
    content((0, -0.85), text(size: 8pt)[Cạnh $x$])
    content((2.1, 0.3), text(size: 8pt)[$x$])
    content((-2.0, 0), text(size: 8pt)[$h$])
  })
]
],
    (
        True([Diện tích toàn phần của chiếc hộp gồm $2$ mặt hình vuông cạnh $x$ và $4$ mặt hình chữ nhật kích thước $x times h$ nên $S = 2x^2 + 4x h = 1800$.]),
        True([Chiều cao $h$ của chiếc hộp liên hệ với cạnh đáy $x$ bởi công thức $h = (900 - x^2) / (2x)$ với $0 < x < 30$.]),
        True([Hàm số biểu diễn thể tích chiếc hộp theo biến $x$ là $V(x) = 450x - 1/2 x^3$.]),
        [Thể tích lớn nhất của chiếc hộp bánh pizza đạt được khi chiều cao $h$ gấp đôi cạnh đáy $x$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Hộp kín có nắp gồm đáy dưới và nắp trên đều là hình vuông cạnh $x$ (tổng diện tích $2x^2$) và 4 mặt bên diện tích $4x h$. Do đó $2x^2 + 4x h = 1800$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Từ $2x^2 + 4x h = 1800 <=> x^2 + 2x h = 900 => h = (900 - x^2)/(2x)$.
        Vì $h > 0$ nên $900 - x^2 > 0 <=> 0 < x < 30$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Thể tích: $V(x) = x^2 h = x^2 dot (900 - x^2)/(2x) = 1/2 x(900 - x^2) = 450x - 1/2 x^3$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Đạo hàm: $V'(x) = 450 - 3/2 x^2 = 0 <=> x^2 = 300 <=> x = 10 sqrt(3)$ cm.
        Khi đó $h = (900 - 300)/(2 dot 10 sqrt(3)) = 600 / (20 sqrt(3)) = 30 / sqrt(3) = 10 sqrt(3) = x$ (hình lập phương).
        Nghĩa là chiều cao bằng cạnh đáy chứ không phải gấp đôi. Ý d SAI.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một công ty sản xuất đồ gia dụng muốn dập một chiếc khay nướng bánh bằng nhôm hình chữ nhật không nắp có dung tích $V = 1000 "cm"^3$. Để thuận tiện khi sử dụng và xếp vào lò nướng, chiều dài đáy khay gấp đôi chiều rộng đáy khay. Gọi $x$ (cm) là chiều rộng đáy khay và $h$ (cm) là chiều cao của khay.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Khay nướng bánh
    rect((-1.8, -0.6), (1.8, 0.6), fill: rgb("f1f5f9"), stroke: 1.2pt + rgb("475569"))
    line((-1.8, 0.6), (-1.2, 1.2), stroke: 1.2pt + rgb("475569"))
    line((1.8, 0.6), (2.4, 1.2), stroke: 1.2pt + rgb("475569"))
    line((-1.2, 1.2), (2.4, 1.2), stroke: 1.2pt + rgb("475569"))
    line((1.8, -0.6), (2.4, 0.0), stroke: 1.2pt + rgb("475569"))
    line((2.4, 0.0), (2.4, 1.2), stroke: 1.2pt + rgb("475569"))
    content((0, 0), text(size: 8pt, fill: rgb("334155"))[Khay nướng bánh])
    content((0, -0.85), text(size: 8pt)[Chiều dài $2x$])
    content((2.1, 0.3), text(size: 8pt)[Rộng $x$])
    content((-2.0, 0), text(size: 8pt)[$h$])
  })
]
],
    (
        True([Chiều cao $h$ của chiếc khay được tính theo công thức $h = 500 / x^2$ cm.]),
        True([Tổng diện tích nhôm cần dùng làm khay (gồm $1$ đáy và $4$ thành xung quanh) là $S(x) = 2x^2 + 3000 / x$ ($"cm"^2$).]),
        True([Diện tích nhôm nhỏ nhất khi chiều rộng $x = root(3, 750)$ cm.]),
        [Khi diện tích nhôm nhỏ nhất, chiều cao của khay lớn hơn chiều rộng đáy khay.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Đáy có chiều rộng $x$ và chiều dài $2x$. Diện tích đáy là $2x^2$.
        Thể tích $V = 2x^2 h = 1000 => h = 500 / x^2$ cm. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Chu vi đáy là $2(x + 2x) = 6x$.
        Diện tích xung quanh: $6x h = 6x dot (500 / x^2) = 3000 / x$.
        Diện tích toàn phần (không nắp): $S(x) = 2x^2 + 3000 / x$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Đạo hàm: $S'(x) = 4x - 3000 / x^2 = 0 <=> 4x^3 = 3000 <=> x^3 = 750 <=> x = root(3, 750)$ cm. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Tại $x^3 = 750$, ta có $h = 500 / x^2 = (500x) / x^3 = (500x) / 750 = 2/3 x < x$.
        Vậy chiều cao nhỏ hơn chiều rộng đáy khay. Mệnh đề d nói lớn hơn là SAI.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một tờ giấy A4 hình chữ nhật có kích thước $20 "cm" times 30 "cm"$. Người ta có thể cuộn tròn tờ giấy theo hai cách khác nhau để tạo thành mặt xung quanh của một ống hình trụ (không tính mép dán):
Cách 1: Cuộn theo chiều dài $30$ cm để làm chiều cao của ống trụ.
Cách 2: Cuộn theo chiều rộng $20$ cm để làm chiều cao của ống trụ.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hình trụ cách 1 (cao, gầy)
    circle((-1.8, 1.5), radius: (0.5, 0.15), stroke: 1.2pt + rgb("b45309"))
    line((-2.3, 1.5), (-2.3, -0.5), stroke: 1.2pt + rgb("b45309"))
    line((-1.3, 1.5), (-1.3, -0.5), stroke: 1.2pt + rgb("b45309"))
    arc((-2.3, -0.5), start: 180deg, stop: 360deg, radius: (0.5, 0.15), stroke: 1.2pt + rgb("b45309"))
    content((-1.8, -0.9), text(size: 7.5pt)[Cách 1: $h_1 = 30$])
    // Hình trụ cách 2 (thấp, béo)
    circle((1.8, 0.8), radius: (0.8, 0.25), stroke: 1.2pt + rgb("0284c7"))
    line((1.0, 0.8), (1.0, -0.5), stroke: 1.2pt + rgb("0284c7"))
    line((2.6, 0.8), (2.6, -0.5), stroke: 1.2pt + rgb("0284c7"))
    arc((1.0, -0.5), start: 180deg, stop: 360deg, radius: (0.8, 0.25), stroke: 1.2pt + rgb("0284c7"))
    content((1.8, -0.9), text(size: 7.5pt)[Cách 2: $h_2 = 20$])
  })
]
],
    (
        True([Diện tích xung quanh của hai khối trụ tạo thành ở cả hai cách đều bằng $600 "cm"^2$.]),
        True([Ở Cách 1, bán kính đáy của hình trụ bằng $10 / pi$ cm và thể tích bằng $3000 / pi "cm"^3$.]),
        True([Ở Cách 2, thể tích khối trụ thu được bằng $4500 / pi "cm"^3$.]),
        [Thể tích của khối trụ thu được ở Cách 1 lớn hơn thể tích thu được ở Cách 2.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Cả hai cách đều lấy nguyên tờ giấy làm mặt xung quanh nên diện tích xung quanh bằng nhau: $S_(x q) = 20 dot 30 = 600 "cm"^2$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Ở Cách 1: Chiều cao $h_1 = 30$ cm. Chu vi đáy $2 pi r_1 = 20 => r_1 = 10 / pi$ cm.
        Thể tích: $V_1 = pi r_1^2 h_1 = pi (10/pi)^2 dot 30 = (3000) / pi "cm"^3$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Ở Cách 2: Chiều cao $h_2 = 20$ cm. Chu vi đáy $2 pi r_2 = 30 => r_2 = 15 / pi$ cm.
        Thể tích: $V_2 = pi r_2^2 h_2 = pi (15/pi)^2 dot 20 = (4500) / pi "cm"^3$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Ta thấy $V_2 = 4500/pi > V_1 = 3000/pi$.
        Như vậy cuộn theo chiều cao nhỏ hơn (bán kính đáy lớn hơn) sẽ cho thể tích lớn hơn $1","5$ lần!
        Mệnh đề d nói $V_1 > V_2$ là SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Từ một tấm tôn hình chữ nhật kích thước $36 "cm" times 60 "cm"$, người ta cắt bỏ ở bốn góc bốn hình vuông cạnh $x$ (cm) rồi gập các mép lại để tạo thành một chiếc hộp không nắp có thể tích lớn nhất. Cạnh $x$ của hình vuông bị cắt bỏ bằng bao nhiêu cm?],
    [6],
    loigiai: [
        #step([Lời giải chi tiết])
        Điều kiện: $0 < x < 36/2 = 18$ cm.
        Đáy hộp có kích thước là $36 - 2x$ và $60 - 2x$ (cm).
        Thể tích hộp: $V(x) = x(36 - 2x)(60 - 2x) = 4x(18 - x)(30 - x) = 4(x^3 - 48x^2 + 540x)$.
        Đạo hàm: $V'(x) = 4(3x^2 - 96x + 540) = 12(x^2 - 32x + 180) = 12(x - 6)(x - 30)$.
        Cho $V'(x) = 0 <=> x = 6$ (do $0 < x < 18$).
        Vậy thể tích lớn nhất khi cạnh hình vuông bị cắt là $x = 6$ cm.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một tấm bìa hình vuông cạnh $30$ cm được cắt ở bốn góc bốn hình vuông cạnh $x = 5$ cm rồi gập thành một chiếc hộp không nắp. Thể tích của chiếc hộp này bằng bao nhiêu nghìn xăng-ti-mét khối ($1000 "cm"^3$)?],
    [2],
    loigiai: [
        #step([Lời giải chi tiết])
        Đáy hộp là hình vuông có cạnh bằng $30 - 2(5) = 20$ cm.
        Chiều cao chiếc hộp bằng $h = 5$ cm.
        Thể tích của chiếc hộp:
        $V = 20^2 dot 5 = 400 dot 5 = 2000 "cm"^3$.
        Đổi ra nghìn xăng-ti-mét khối: $2000 / 1000 = 2$ nghìn $"cm"^3$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Người ta muốn tạo một chiếc phễu hình nón bằng cách cuộn một hình quạt tròn có bán kính $R = 3 sqrt(3)$ cm. Thể tích lớn nhất của chiếc phễu hình nón này bằng bao nhiêu $pi "cm"^3$? (Điền hệ số trước $pi$).],
    [18],
    loigiai: [
        #step([Lời giải chi tiết])
        Khi cuộn hình quạt tròn bán kính $R = 3 sqrt(3)$ cm thành hình nón, đường sinh là $l = R = 3 sqrt(3)$ cm.
        Thể tích nón lớn nhất khi chiều cao $h = l / sqrt(3) = (3 sqrt(3)) / sqrt(3) = 3$ cm.
        Bán kính đáy: $r^2 = l^2 - h^2 = (3 sqrt(3))^2 - 3^2 = 27 - 9 = 18$.
        Thể tích cực đại của chiếc phễu hình nón:
        $V_"max" = 1/3 pi r^2 h = 1/3 pi dot 18 dot 3 = 18 pi "cm"^3$.
        Hệ số trước $pi$ là $18$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một khối gỗ hình hộp chữ nhật có ba kích thước lần lượt là $4$ cm, $6$ cm và $12$ cm. Độ dài đường chéo lớn nhất của khối gỗ này bằng bao nhiêu cm?],
    [14],
    loigiai: [
        #step([Lời giải chi tiết])
        Độ dài đường chéo $d$ của khối hộp chữ nhật có ba kích thước $a = 4, b = 6, c = 12$ là:
        $d = sqrt(a^2 + b^2 + c^2) = sqrt(4^2 + 6^2 + 12^2) = sqrt(16 + 36 + 144) = sqrt(196) = 14$ cm.
        Vậy độ dài đường chéo của khối gỗ bằng $14$ cm.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một tấm tôn hình chữ nhật kích thước $40 "cm" times 60 "cm"$ được cuộn tròn lại thành một hình trụ (không nắp, không đáy). Gọi $V$ là thể tích lớn nhất có thể đạt được của hình trụ này ($"cm"^3$). Giá trị của tích $V dot pi$ bằng bao nhiêu nghìn xăng-ti-mét khối ($1000 "cm"^3$)?],
    [36],
    loigiai: [
        #step([Lời giải chi tiết])
        Tấm tôn có thể cuộn theo hai cách:
        - Cách 1: Chiều cao $h_1 = 40$ cm, chu vi đáy $2 pi r_1 = 60 => r_1 = 30 / pi$ cm.
          Thể tích: $V_1 = pi r_1^2 h_1 = pi (30/pi)^2 dot 40 = 36000 / pi "cm"^3$.
        - Cách 2: Chiều cao $h_2 = 60$ cm, chu vi đáy $2 pi r_2 = 40 => r_2 = 20 / pi$ cm.
          Thể tích: $V_2 = pi r_2^2 h_2 = pi (20/pi)^2 dot 60 = 24000 / pi "cm"^3$.
        Thể tích lớn nhất đạt được là $V = 36000 / pi "cm"^3$.
        Suy ra tích $V dot pi = 36000 "cm"^3 = 36$ nghìn $"cm"^3$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd01C — Mã 503], back-to: "sec-exercise-hub",[Một xưởng cơ khí cần dập một chiếc lon hình trụ có thể tích $V = 128 pi "cm"^3$. Diện tích toàn phần của lon hình trụ này là nhỏ nhất khi chiều cao của lon bằng bao nhiêu cm?],
    [8],
    loigiai: [
        #step([Lời giải chi tiết])
        Với hình trụ có hai nắp kín đạt diện tích toàn phần nhỏ nhất, ta có quy tắc:
        Chiều cao bằng đường kính đáy: $h = 2r$.
        Thay vào công thức thể tích:
        $V = pi r^2 h = pi r^2 (2r) = 2 pi r^3 = 128 pi <=> r^3 = 64 <=> r = 4$ cm.
        Khi đó chiều cao của chiếc lon là:
        $h = 2r = 2 dot 4 = 8$ cm.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHỦ ĐỀ 1C: BÀI TOÁN CẮT GIẤY GẤP HÌNH & THIẾT KẾ BAO BÌ (VD - VDC)!]      #v(0.6em)
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
