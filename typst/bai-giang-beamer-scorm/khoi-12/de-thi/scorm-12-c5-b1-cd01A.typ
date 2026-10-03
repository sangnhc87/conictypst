// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHỦ ĐỀ 1A: TỐI ƯU HÓA HÌNH HỌC 2D & UỐN DÂY TẠO HÌNH (VD - VDC)
// Lớp: Khối 12  ·  Mã đề: 501  ·  GV: Nguyễn Văn Sang
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
  title: "CHỦ ĐỀ 1A: TỐI ƯU HÓA HÌNH HỌC 2D & UỐN DÂY TẠO HÌNH (VD - VDC)",
  subtitle: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN — MÃ ĐỀ: 501",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 501]],
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
#lt-tn(num: 1, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một người nông dân muốn rào một khu đất hình chữ nhật giáp bờ sông thẳng để trồng rau. Do giáp bờ sông nên không cần rào cạnh phía bờ sông. Người đó có $80$ m lưới thép B40. Diện tích lớn nhất của mảnh vườn mà người đó có thể rào được bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Bờ sông
    rect((-3, 1.8), (3, 2.6), fill: rgb("dbeafe"), stroke: none)
    line((-3, 1.8), (3, 1.8), stroke: 1.5pt + rgb("0284c7"))
    content((0, 2.2), text(size: 8pt, fill: rgb("0369a1"), weight: "bold")[BỜ SÔNG (Không cần rào)])
    // Hàng rào
    rect((-2, 0), (2, 1.8), stroke: none, fill: rgb("f0fdf4"))
    line((-2, 1.8), (-2, 0), (2, 0), (2, 1.8), stroke: 1.5pt + rgb("16a34a"))
    content((0, 0.9), text(size: 9pt, fill: rgb("15803d"))[Mảnh vườn trồng rau])
    content((-2.3, 0.9), text(size: 8pt)[$x$])
    content((2.3, 0.9), text(size: 8pt)[$x$])
    content((0, -0.3), text(size: 8pt)[$80 - 2x$])
  })
]
],
    (
        True([$800 m^2$]),
        [$600 m^2$],
        [$1600 m^2$],
        [$400 m^2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều rộng mảnh vườn (hai cạnh vuông góc bờ sông) là $x$ (m), với $0 < x < 40$.
        Chiều dài mảnh vườn song song bờ sông là $80 - 2x$ (m).
        Hàm diện tích $S(x) = x(80 - 2x)$.
        #step([Lời giải chi tiết])
        Ta có $S(x) = -2x^2 + 80x = -2(x - 20)^2 + 800 <= 800$.
        Dấu "=" xảy ra khi $x = 20$ (m). Khi đó chiều dài là $80 - 2(20) = 40$ (m).
        Diện tích lớn nhất đạt được là $S_"max" = 800 m^2$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một tấm thép hình tam giác vuông cân $A B C$ có cạnh huyền $B C = 12$ cm. Người thợ cắt từ tấm thép đó ra một hình chữ nhật $M N P Q$ có cạnh $M N$ nằm trên cạnh huyền $B C$, hai đỉnh $P, Q$ lần lượt nằm trên hai cạnh góc vuông $A C, A B$. Diện tích lớn nhất của hình chữ nhật $M N P Q$ cắt được là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tam giác vuông cân ABC
    line((-3, 0), (3, 0), stroke: 1.2pt, name: "BC")
    line((-3, 0), (0, 3), stroke: 1.2pt, name: "BA")
    line((0, 3), (3, 0), stroke: 1.2pt, name: "AC")
    content((-3.2, -0.2), text(size: 8pt)[$B$])
    content((3.2, -0.2), text(size: 8pt)[$C$])
    content((0, 3.2), text(size: 8pt)[$A$])
    // Hình chữ nhật MNPQ
    rect((-1.5, 0), (1.5, 1.5), stroke: 1.2pt + rgb("dc2626"), fill: rgb("fee2e2"))
    content((-1.5, -0.25), text(size: 8pt, fill: rgb("dc2626"))[$Q$])
    content((1.5, -0.25), text(size: 8pt, fill: rgb("dc2626"))[$P$])
    content((1.8, 1.6), text(size: 8pt, fill: rgb("dc2626"))[$N$])
    content((-1.8, 1.6), text(size: 8pt, fill: rgb("dc2626"))[$M$])
  })
]
],
    (
        True([$18 "cm"^2$]),
        [$9 "cm"^2$],
        [$24 "cm"^2$],
        [$36 "cm"^2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Hạ đường cao $A H perp B C$. Do tam giác $A B C$ vuông cân tại $A$ nên $A H = B C / 2 = 6$ cm.
        Hình chữ nhật nội tiếp trong tam giác có chiều cao $h = 6$ và đáy $a = 12$ đạt diện tích cực đại bằng một nửa diện tích tam giác.
        #step([Lời giải chi tiết])
        Diện tích tam giác $A B C$ là $S_(A B C) = 1/2 B C dot A H = 1/2 dot 12 dot 6 = 36 "cm"^2$.
        Gọi chiều cao của hình chữ nhật là $x$ ($0 < x < 6$), cạnh đáy của hình chữ nhật theo định lý Talet là $y = 12(1 - x/6) = 12 - 2x$.
        Diện tích hình chữ nhật: $S(x) = x(12 - 2x) = -2(x - 3)^2 + 18 <= 18$.
        Vậy diện tích lớn nhất là $18 "cm"^2$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Cắt một đoạn dây thép dài $20$ m thành hai phần để uốn thành một hình vuông và một hình tròn. Để tổng diện tích của hình vuông và hình tròn nhận được là nhỏ nhất thì cạnh của hình vuông phải bằng bao nhiêu mét?],
    (
        True([$20 / (4 + pi)$ m]),
        [$10 / (4 + pi)$ m],
        [$40 / (4 + pi)$ m],
        [$5 / (4 + pi)$ m]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chiều dài đoạn uốn thành hình vuông là $x$ ($0 < x < 20$), đoạn uốn thành hình tròn là $20 - x$.
        Cạnh hình vuông $a = x/4$, bán kính hình tròn $R = (20 - x)/(2 pi)$.
        Thiết lập hàm tổng diện tích $S(x)$ và tìm cực tiểu.
        #step([Lời giải chi tiết])
        $S(x) = (x/4)^2 + pi ((20 - x)/(2 pi))^2 = x^2/16 + (20 - x)^2 / (4 pi)$.
        Đạo hàm: $S'(x) = x/8 - (20 - x)/(2 pi) = 0 <=> pi x - 4(20 - x) = 0 <=> (pi + 4)x = 80 <=> x = 80/(pi + 4)$.
        Khi đó cạnh của hình vuông là $a = x/4 = 20 / (pi + 4)$ (m).
        Lưu ý: Tại điểm này, đường kính hình tròn $2R = 2 dot (20 - 80/(pi+4))/(2 pi) = 20/(pi + 4) = a$, tức cạnh hình vuông bằng đường kính hình tròn.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một khung cửa sổ có dạng hình chữ nhật được gắn thêm phía trên một nửa hình tròn (cửa sổ vòm Norman). Chu vi toàn bộ của khung cửa sổ là $p = 10$ m. Để diện tích của cửa sổ lớn nhất (thu được nhiều ánh sáng nhất) thì bán kính của nửa hình tròn phía trên bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Khung chữ nhật dưới
    rect((-1.5, 0), (1.5, 1.8), stroke: 1.2pt + rgb("1e40af"), fill: rgb("eff6ff"))
    // Vòm tròn trên
    arc((1.5, 1.8), start: 0deg, stop: 180deg, radius: 1.5, stroke: 1.2pt + rgb("1e40af"), fill: rgb("dbeafe"))
    line((-1.5, 1.8), (1.5, 1.8), stroke: (dash: "dashed", paint: rgb("93c5fd")))
    content((0, 1.8), text(size: 7pt, fill: rgb("1e40af"))[Bán kính $R$])
    content((0, 0.9), text(size: 8pt)[$2R$])
    content((-1.8, 0.9), text(size: 8pt)[$h$])
    content((1.8, 0.9), text(size: 8pt)[$h$])
  })
]
],
    (
        True([$10 / (pi + 4)$ m]),
        [$5 / (pi + 4)$ m],
        [$20 / (pi + 4)$ m],
        [$10 / (2 pi + 4)$ m]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi bán kính nửa hình tròn là $R$ ($R > 0$).
        Chiều rộng đáy cửa sổ là $2R$, chiều cao phần chữ nhật là $h$.
        Chu vi cửa sổ gồm đáy dưới, 2 cạnh bên và nửa đường tròn: $P = 2R + 2h + pi R = (pi + 2)R + 2h = 10$.
        #step([Lời giải chi tiết])
        Từ $P = 10 => 2h = 10 - (pi + 2)R => h = 5 - (pi + 2)/2 R$.
        Tổng diện tích cửa sổ:
        $S = 2R dot h + 1/2 pi R^2 = 2R [5 - (pi + 2)/2 R] + 1/2 pi R^2 = 10R - (pi + 2)R^2 + 1/2 pi R^2 = 10R - (1/2 pi + 2)R^2$.
        Đây là tam thức bậc hai theo $R$ với hệ số bậc hai âm $-(pi/2 + 2) < 0$.
        Diện tích đạt giá trị lớn nhất tại đỉnh parabol:
        $R = (-b)/(2a) = (-10)/(-2(pi/2 + 2)) = 10 / (pi + 4)$ (m).
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Cho một nửa đường tròn đường kính $A B = 2 R$. Một hình thang cân $A B C D$ nội tiếp trong nửa đường tròn đó có đáy lớn là $A B$, đáy nhỏ $C D$. Diện tích lớn nhất của hình thang cân $A B C D$ bằng bao nhiêu?],
    (
        True([$(3 sqrt(3)) / 4 R^2$]),
        [$sqrt(3) R^2$],
        [$(3 sqrt(3)) / 2 R^2$],
        [$2 R^2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi $O$ là trung điểm $A B$, bán kính nửa đường tròn là $R$.
        Gọi $alpha = hat(B O C) = hat(A O D)$ với $0 < alpha < pi/2$.
        Góc ở tâm chắn đáy nhỏ là $hat(C O D) = pi - 2 alpha$.
        Diện tích hình thang bằng tổng diện tích 3 tam giác $O A D, O C D, O B C$.
        #step([Lời giải chi tiết])
        Ta có $S = 2 S_(O B C) + S_(O C D) = 2 dot (1/2 R^2 sin alpha) + 1/2 R^2 sin(pi - 2 alpha) = R^2 sin alpha + 1/2 R^2 sin 2 alpha$.
        Đạo hàm: $S'(alpha) = R^2 (cos alpha + cos 2 alpha) = R^2 (2 cos^2 alpha + cos alpha - 1)$.
        $S'(alpha) = 0 <=> (2 cos alpha - 1)(cos alpha + 1) = 0 <=> cos alpha = 1/2 <=> alpha = pi/3$.
        Khi đó hình thang gồm 3 tam giác đều cạnh $R$, diện tích lớn nhất:
        $S_"max" = 3 dot (R^2 sqrt(3))/4 = (3 sqrt(3))/4 R^2$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một bức tranh cao $2$ m được treo trên một bức tường thẳng đứng sao cho mép dưới của bức tranh cách mặt đất $3$ m. Một người có tầm mắt cao $1","5$ m so với mặt đất đứng quan sát bức tranh. Để góc nhìn bức tranh (góc tạo bởi tia nhìn đến mép trên và mép dưới bức tranh) là lớn nhất thì người đó phải đứng cách bức tường một khoảng bằng bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tường
    line((3, 0), (3, 4), stroke: 1.5pt)
    // Bức tranh từ y=1.5 đến y=3.5 (tương ứng thực tế từ 3m đến 5m, mắt ở 1.5m -> chênh lệch 1.5m và 3.5m)
    line((3, 1.5), (3, 3.5), stroke: 3pt + rgb("dc2626"))
    content((3.6, 2.5), text(size: 8pt, fill: rgb("dc2626"), weight: "bold")[Tranh (2m)])
    // Mắt người tại (0, 0)
    circle((0, 0), radius: 0.08, fill: black)
    content((0, -0.3), text(size: 8pt)[Mắt ($1","5$m)])
    // Tia nhìn
    line((0, 0), (3, 1.5), stroke: (dash: "dashed", paint: rgb("2563eb")))
    line((0, 0), (3, 3.5), stroke: (dash: "dashed", paint: rgb("2563eb")))
    line((0, 0), (3, 0), stroke: 0.8pt + gray)
    content((1.5, -0.25), text(size: 8pt)[Khoảng cách $x$])
    content((0.8, 0.4), text(size: 8pt, fill: rgb("2563eb"))[$theta$])
  })
]
],
    (
        True([$sqrt(5","25) approx 2","29$ m]),
        [$3","0$ m],
        [$2","5$ m],
        [$3","5$ m]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Chọn hệ quy chiếu ngang tầm mắt người quan sát.
        Mép dưới bức tranh cách tầm mắt: $h_1 = 3 - 1","5 = 1","5$ m.
        Mép trên bức tranh cách tầm mắt: $h_2 = 3 + 2 - 1","5 = 3","5$ m.
        Gọi $x$ là khoảng cách từ người đến tường ($x > 0$).
        Góc nhìn $theta = beta - alpha$ với $tan beta = h_2 / x = 3","5/x$ và $tan alpha = h_1 / x = 1","5/x$.
        #step([Lời giải chi tiết])
        Ta có:
        $tan theta = tan(beta - alpha) = (tan beta - tan alpha) / (1 + tan beta dot tan alpha) = (3","5/x - 1","5/x) / (1 + (3","5 dot 1","5)/x^2) = 2 / (x + 5","25 / x)$.
        Để $theta$ lớn nhất thì $tan theta$ phải lớn nhất, tương đương mẫu số $g(x) = x + 5","25 / x$ nhỏ nhất.
        Theo bất đẳng thức Cauchy: $x + 5","25 / x >= 2 sqrt(5","25)$.
        Dấu "=" xảy ra khi $x = sqrt(5","25) approx 2","29$ m.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Tìm diện tích lớn nhất $S_"max"$ của một hình chữ nhật nội tiếp trong elip $(E): x^2/16 + y^2/9 = 1$, biết các cạnh của hình chữ nhật song song với các trục tọa độ.],
    (
        True([$24$]),
        [$12$],
        [$48$],
        [$36$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Elip có các bán trục $a = 4, b = 3$.
        Lấy một đỉnh của hình chữ nhật nằm ở góc phần tư thứ nhất có tọa độ $M(x_0, y_0)$ với $0 < x_0 < 4$ và $y_0 = 3 sqrt(1 - x_0^2/16)$.
        Khi đó chiều dài và chiều rộng của hình chữ nhật là $2x_0$ và $2y_0$.
        #step([Lời giải chi tiết])
        Diện tích hình chữ nhật:
        $S = 4 x_0 y_0 = 4 x_0 dot 3 sqrt(1 - x_0^2/16) = 12 x_0 sqrt(1 - x_0^2/16)$.
        Sử dụng BĐT Cauchy:
        $x_0/4 dot y_0/3 <= 1/2 (x_0^2/16 + y_0^2/9) = 1/2 (1) = 1/2$.
        Suy ra $x_0 y_0 <= 6$.
        Do đó $S = 4 x_0 y_0 <= 4 dot 6 = 24$.
        Dấu "=" xảy ra khi $x_0^2/16 = y_0^2/9 = 1/2 <=> x_0 = 2 sqrt(2)$ và $y_0 = (3 sqrt(2))/2$.
        Vậy diện tích lớn nhất của hình chữ nhật là $24$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Cho một miền phẳng giới hạn bởi parabol $(P): y = 9 - x^2$ với $y >= 0$ và trục hoành $O x$. Một hình chữ nhật có hai đỉnh nằm trên trục hoành và hai đỉnh còn lại nằm trên parabol $(P)$. Diện tích lớn nhất của hình chữ nhật đó bằng bao nhiêu?],
    (
        True([$12 sqrt(3)$]),
        [$16$],
        [$18$],
        [$6 sqrt(3)$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Do tính đối xứng của parabol qua trục $O y$, hai đỉnh nằm trên trục hoành là $(-x, 0)$ và $(x, 0)$ với $0 < x < 3$.
        Hai đỉnh nằm trên parabol là $(-x, 9 - x^2)$ và $(x, 9 - x^2)$.
        Hàm diện tích hình chữ nhật: $S(x) = 2x(9 - x^2) = 18x - 2x^3$.
        #step([Lời giải chi tiết])
        Xét hàm số $S(x) = 18x - 2x^3$ trên khoảng $(0; 3)$.
        Đạo hàm: $S'(x) = 18 - 6x^2 = 0 <=> x^2 = 3 <=> x = sqrt(3)$ (do $x > 0$).
        Bảng biến thiên: $S'(x) > 0$ trên $(0; sqrt(3))$ và $S'(x) < 0$ trên $(sqrt(3); 3)$.
        Vậy hàm số đạt cực đại tại $x = sqrt(3)$.
        Giá trị diện tích cực đại: $S_"max" = S(sqrt(3)) = 18 sqrt(3) - 2(3 sqrt(3)) = 12 sqrt(3)$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một sợi dây kim loại dài $36$ cm được chia làm hai phần. Phần thứ nhất uốn thành một tam giác đều, phần thứ hai uốn thành một hình vuông. Để tổng diện tích của hai hình này đạt giá trị nhỏ nhất thì chu vi của tam giác đều phải bằng bao nhiêu cm?],
    (
        True([$(108 sqrt(3)) / (4 + 3 sqrt(3))$ cm]),
        [$18$ cm],
        [$12$ cm],
        [$(36 sqrt(3)) / (3 + 4 sqrt(3))$ cm]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi chu vi của tam giác đều là $x$ ($0 < x < 36$), chu vi hình vuông là $36 - x$.
        Cạnh tam giác đều $a = x/3$, diện tích tam giác đều: $S_1 = a^2 sqrt(3)/4 = (x/3)^2 sqrt(3)/4 = (x^2 sqrt(3))/36$.
        Cạnh hình vuông $b = (36 - x)/4$, diện tích hình vuông: $S_2 = b^2 = (36 - x)^2 / 16$.
        #step([Lời giải chi tiết])
        Hàm tổng diện tích: $S(x) = (sqrt(3)/36) x^2 + 1/16 (36 - x)^2$.
        Đạo hàm: $S'(x) = (sqrt(3)/18) x - 1/8 (36 - x) = 0$.
        $<=> (sqrt(3)/18 + 1/8) x = 36/8 = 9/2 <=> (4 sqrt(3) + 9)/72 x = 9/2$.
        $<=> x = (9/2 dot 72) / (9 + 4 sqrt(3)) = 324 / (9 + 4 sqrt(3)) = (108 sqrt(3)) / (4 + 3 sqrt(3))$ cm.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một trang sách có diện tích phần in chữ là $384 "cm"^2$. Lề trên và lề dưới đều rộng $3$ cm, lề trái và lề phải đều rộng $2$ cm. Kích thước trang sách (chiều rộng $times$ chiều cao) để diện tích của cả trang sách là nhỏ nhất (tiết kiệm giấy nhất) là],
    (
        True([$20 "cm" times 30 "cm"$]),
        [$18 "cm" times 32 "cm"$],
        [$24 "cm" times 28 "cm"$],
        [$16 "cm" times 36 "cm"$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi kích thước vùng in chữ là chiều rộng $x$ (cm) và chiều cao $y$ (cm) với $x, y > 0$.
        Ta có $x y = 384 => y = 384 / x$.
        Kích thước cả trang giấy: chiều rộng $X = x + 4$, chiều cao $Y = y + 6$.
        Diện tích toàn trang: $S = (x + 4)(y + 6) = (x + 4)(384/x + 6)$.
        #step([Lời giải chi tiết])
        $S(x) = 384 + 6x + 1536/x + 24 = 408 + 6(x + 256/x)$.
        Theo BĐT Cauchy: $x + 256/x >= 2 sqrt(256) = 32$.
        Dấu "=" xảy ra khi $x = 256/x <=> x^2 = 256 <=> x = 16$ cm.
        Khi $x = 16$ cm thì $y = 384 / 16 = 24$ cm.
        Kích thước trang sách nhỏ nhất là:
        Chiều rộng: $X = 16 + 4 = 20$ cm.
        Chiều cao: $Y = 24 + 6 = 30$ cm.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một người thợ cắt một dải tôn có chiều rộng $w = 30$ cm thành ba phần bằng nhau có chiều rộng mỗi phần là $10$ cm, rồi gập hai bên lên một góc $theta$ ($0 < theta < pi/2$) để tạo thành một máng dẫn nước có mặt cắt ngang là hình thang cân đáy $10$ cm và hai cạnh bên $10$ cm. Góc gập $theta$ bằng bao nhiêu để diện tích mặt cắt ngang của máng nước là lớn nhất (cho lưu lượng nước cực đại)?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Máng nước hình thang cân
    line((-2.5, 1.5), (-1.2, 0), stroke: 1.5pt + rgb("0284c7"))
    line((-1.2, 0), (1.2, 0), stroke: 1.5pt + rgb("0284c7"))
    line((1.2, 0), (2.5, 1.5), stroke: 1.5pt + rgb("0284c7"))
    // Nước bên trong
    line((-2.2, 1.2), (2.2, 1.2), stroke: (dash: "dashed", paint: rgb("38bdf8")))
    content((0, 0.6), text(size: 8pt, fill: rgb("0284c7"))[Mặt cắt máng nước])
    content((0, -0.25), text(size: 8pt)[Đáy $10$ cm])
    content((-2.0, 0.5), text(size: 8pt)[$10$ cm])
    content((2.0, 0.5), text(size: 8pt)[$10$ cm])
    // Góc theta
    line((-1.2, 0), (-2.5, 0), stroke: (dash: "dotted", paint: gray))
    content((-1.8, 0.25), text(size: 8pt)[$theta$])
  })
]
],
    (
        True([$60 degree$]),
        [$45 degree$],
        [$30 degree$],
        [$75 degree$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Gọi góc gập là $theta$ (góc nghiêng của cạnh bên so với phương ngang), với $0 < theta < pi/2$.
        Chiều cao của hình thang là $h = 10 sin theta$.
        Độ mở rộng mỗi bên đáy trên là $10 cos theta$, do đó đáy lớn là $10 + 20 cos theta$, đáy nhỏ là $10$.
        #step([Lời giải chi tiết])
        Diện tích hình thang:
        $S(theta) = 1/2 [10 + (10 + 20 cos theta)] dot 10 sin theta = (10 + 10 cos theta) dot 10 sin theta = 100 sin theta (1 + cos theta)$.
        Đạo hàm:
        $S'(theta) = 100 [cos theta(1 + cos theta) - sin^2 theta] = 100 [cos theta + cos^2 theta - (1 - cos^2 theta)] = 100 (2 cos^2 theta + cos theta - 1)$.
        $S'(theta) = 0 <=> (2 cos theta - 1)(cos theta + 1) = 0 <=> cos theta = 1/2 <=> theta = 60 degree$.
        Vậy góc gập tối ưu để diện tích lớn nhất là $theta = 60 degree$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Trong một phòng hòa nhạc hình chữ nhật có chiều dài $20$ m và chiều rộng $12$ m, người ta muốn dựng một sân khấu hình tam giác vuông $A M N$ ở một góc phòng sao cho đỉnh góc vuông là góc phòng $A$, hai đỉnh nhọn $M, N$ lần lượt nằm trên hai bức tường xuất phát từ $A$. Do yêu cầu kỹ thuật âm thanh, cạnh huyền $M N$ phải luôn đi qua một vị trí cố định $K$ cách hai bức tường lần lượt là $1$ m và $8$ m. Diện tích nhỏ nhất của sân khấu tam giác $A M N$ bằng bao nhiêu?],
    (
        True([$16 "m"^2$]),
        [$18 "m"^2$],
        [$24 "m"^2$],
        [$32 "m"^2$]
    ),
    loigiai: [
        #step([Phương pháp giải])
        Đặt hệ trục tọa độ $O x y$ với gốc $O equiv A$, hai bức tường là hai trục $O x, O y$.
        Tọa độ điểm cản là $K(1; 8)$.
        Đường thẳng cạnh huyền $M N$ đi qua $K(1; 8)$ và cắt $O x$ tại $M(a; 0)$, cắt $O y$ tại $N(0; b)$ với $a > 1, b > 8$.
        Phương trình đoạn chắn của $M N$: $x/a + y/b = 1$.
        #step([Lời giải chi tiết])
        Vì đường thẳng đi qua $K(1; 8)$ nên $1/a + 8/b = 1$.
        Diện tích tam giác vuông $A M N$: $S = 1/2 a b$.
        Từ $1/a + 8/b = 1$, áp dụng BĐT Cauchy:
        $1 = 1/a + 8/b >= 2 sqrt(8 / (a b)) <=> 1 >= 32 / (a b) <=> a b >= 32$.
        Do đó diện tích $S = 1/2 a b >= 1/2 dot 32 = 16 "m"^2$.
        Dấu "=" xảy ra khi $1/a = 8/b = 1/2 <=> a = 2, b = 16$.
        Vậy diện tích nhỏ nhất của sân khấu là $16 "m"^2$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một khu nghỉ dưỡng ven biển muốn xây dựng một hồ bơi ngoài trời gồm một phần hình chữ nhật có chiều dài $x$ (m), chiều rộng $y$ (m) và hai đầu được mở rộng bằng hai nửa hình tròn có đường kính bằng chiều rộng $y$ của hình chữ nhật. Ban quản lý có ngân sách làm hàng rào lan can bảo vệ xung quanh chu vi của toàn bộ hồ bơi với tổng chiều dài đúng bằng $200$ m.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hồ bơi dạng sân vận động (stadium shape)
    rect((-1.5, -0.8), (1.5, 0.8), fill: rgb("e0f2fe"), stroke: none)
    line((-1.5, 0.8), (1.5, 0.8), stroke: 1.2pt + rgb("0284c7"))
    line((-1.5, -0.8), (1.5, -0.8), stroke: 1.2pt + rgb("0284c7"))
    arc((-1.5, 0.8), start: 90deg, stop: 270deg, radius: 0.8, fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    arc((1.5, -0.8), start: -90deg, stop: 90deg, radius: 0.8, fill: rgb("e0f2fe"), stroke: 1.2pt + rgb("0284c7"))
    line((-1.5, -0.8), (-1.5, 0.8), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((1.5, -0.8), (1.5, 0.8), stroke: (dash: "dashed", paint: rgb("94a3b8")))
    content((0, 0), text(size: 8pt, fill: rgb("0369a1"))[Hồ bơi trung tâm])
    content((0, -1.05), text(size: 8pt)[Chiều dài $x$])
    content((2.5, 0), text(size: 8pt)[Bán kính $R = y/2$])
  })
]
],
    (
        True([Chu vi toàn bộ hồ bơi được xác định bởi biểu thức $P = 2x + pi y$.]),
        [Biểu thức diện tích mặt nước hồ bơi theo chiều rộng $y$ là $S(y) = 200 y - pi y^2$.],
        True([Diện tích mặt nước hồ bơi đạt giá trị lớn nhất khi chiều dài phần hình chữ nhật $x = 0$, nghĩa là hồ bơi trở thành một hình tròn hoàn chỉnh.]),
        True([Nếu quy hoạch bắt buộc phần hình chữ nhật phải có chiều dài tối thiểu $x >= 20$ m thì diện tích lớn nhất của hồ bơi đạt được xấp xỉ $3056 "m"^2$ (lấy $pi approx 3","1416$).])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Chu vi hồ bơi gồm hai đoạn thẳng dài $x$ và hai nửa đường tròn ghép lại thành một đường tròn chu vi $pi y$. Do đó $P = 2x + pi y = 200$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Từ $2x + pi y = 200 => x = 100 - (pi y)/2$.
        Diện tích hồ bơi bằng diện tích hình chữ nhật cộng diện tích hai nửa hình tròn:
        $S = x y + pi (y/2)^2 = y [100 - (pi y)/2] + (pi y^2)/4 = 100 y - (pi y^2)/4$.
        Do đó mệnh đề b đưa ra biểu thức $200 y - pi y^2$ là SAI.
        #step([Phân tích ý c])
        Đạo hàm $S'(y) = 100 - (pi y)/2 = 0 <=> y = 200 / pi$.
        Khi đó $x = 100 - (pi / 2)(200 / pi) = 0$.
        Nghĩa là diện tích cực đại toàn cục đạt được khi không có phần hình chữ nhật ($x = 0$), hồ bơi biến thành hình tròn đường kính $y = 200/pi$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Khi có điều kiện ràng buộc $x >= 20$:
        Do hàm $S(y)$ đồng biến trên $(0; 200/pi)$, để $S$ lớn nhất ta cần $y$ lớn nhất có thể, tức là $x$ nhỏ nhất có thể.
        Chọn $x = 20$ m thì $pi y = 200 - 2(20) = 160 => y = 160 / pi approx 50","93$ m.
        Diện tích tương ứng:
        $S = 20 dot (160 / pi) + pi / 4 dot (160 / pi)^2 = 3200 / pi + 6400 / pi = 9600 / pi approx 9600 / 3","1416 approx 3055","77 "m"^2 approx 3056 "m"^2$. Ý d ĐÚNG.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một mảnh vườn hình tam giác $A B C$ có đáy $B C = 60$ m và chiều cao tương ứng $A H = 40$ m. Chủ nhà muốn ngăn ra một khu đất hình chữ nhật $M N P Q$ bên trong mảnh vườn để xây dựng nhà kính trồng hoa công nghệ cao, với cạnh $P Q$ nằm trên cạnh đáy $B C$, hai đỉnh $M, N$ lần lượt nằm trên hai cạnh $A B, A C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Tam giác ABC
    line((0, 3.2), (-2.5, 0), stroke: 1.2pt)
    line((-2.5, 0), (2.5, 0), stroke: 1.2pt)
    line((2.5, 0), (0, 3.2), stroke: 1.2pt)
    // Đường cao AH
    line((0, 3.2), (0, 0), stroke: (dash: "dashed", paint: gray))
    content((0, 3.4), text(size: 8pt)[$A$])
    content((-2.6, -0.2), text(size: 8pt)[$B$])
    content((2.6, -0.2), text(size: 8pt)[$C$])
    content((0.2, -0.2), text(size: 8pt)[$H$])
    // Hình chữ nhật MNPQ
    rect((-1.4, 0), (1.4, 1.4), stroke: 1.2pt + rgb("16a34a"), fill: rgb("f0fdf4"))
    content((-1.4, -0.2), text(size: 8pt, fill: rgb("16a34a"))[$Q$])
    content((1.4, -0.2), text(size: 8pt, fill: rgb("16a34a"))[$P$])
    content((1.6, 1.5), text(size: 8pt, fill: rgb("16a34a"))[$N$])
    content((-1.6, 1.5), text(size: 8pt, fill: rgb("16a34a"))[$M$])
  })
]
],
    (
        True([Nếu gọi chiều cao của nhà kính là $x$ ($0 < x < 40$ m) thì chiều dài cạnh $M N$ là $y = 60(1 - x/40)$ m.]),
        True([Diện tích lớn nhất của khu nhà kính $M N P Q$ bằng $600 "m"^2$.]),
        [Diện tích nhà kính đạt giá trị lớn nhất khi chiều cao của nó bằng $30$ m.],
        True([Nếu chi phí xây dựng nhà kính tỉ lệ với diện tích sàn theo đơn giá 1,2 triệu đồng/m#super[2] và chi phí làm hàng rào viền quanh nhà kính là 200.000 đồng/m thì tổng chi phí khi nhà kính đạt diện tích lớn nhất là 740 triệu đồng.])
    ),
    loigiai: [
        #step([Phân tích ý a])
        Tam giác $A M N$ đồng dạng với tam giác $A B C$ theo tỉ số $k = (A H - x)/A H = (40 - x)/40 = 1 - x/40$.
        Do đó $M N = k dot B C = 60(1 - x/40)$ m. Ý a ĐÚNG.
        #step([Phân tích ý b])
        Diện tích $S(x) = x dot 60(1 - x/40) = 60x - 1","5 x^2$.
        Đạt cực đại tại $x = 60 / (2 dot 1","5) = 20$ m.
        $S_"max" = 60(20) - 1","5(20^2) = 1200 - 600 = 600 "m"^2$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        Diện tích đạt cực đại tại $x = 20$ m (chứ không phải $30$ m). Ý c SAI.
        #step([Phân tích ý d])
        Khi $S$ lớn nhất: $x = 20$ m, chiều dài $M N = 60(1 - 20/40) = 30$ m.
        Chu vi nhà kính: $P = 2(20 + 30) = 100$ m.
        Chi phí diện tích sàn: $600 dot 1","2 = 720$ triệu đồng.
        Chi phí viền hàng rào: $100 dot 0","2 = 20$ triệu đồng.
        Tổng chi phí: $720 + 20 = 740$ triệu đồng. Ý d ĐÚNG.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Cho một đoạn dây dẫn điện bằng đồng có chiều dài cố định $L = 100$ cm. Người ta cắt đoạn dây thành hai phần: phần thứ nhất uốn thành một hình tam giác đều cạnh $a$, phần thứ hai uốn thành một hình tròn bán kính $r$.],
    (
        [Tổng diện tích của hình tam giác đều và hình tròn đạt giá trị lớn nhất khi chiều dài đoạn dây uốn thành tam giác đều bằng $50$ cm.],
        True([Hàm số biểu diễn tổng diện tích của hai hình theo độ dài $x$ của phần dây uốn thành tam giác đều là hàm số bậc hai có bề lõm quay lên trên.]),
        True([Tổng diện tích nhỏ nhất đạt được khi cạnh tam giác đều $a$ và bán kính hình tròn $r$ thỏa mãn hệ thức $a = 2 sqrt(3) r$.]),
        [Để tổng diện tích của hai hình đạt giá trị lớn nhất thì phải chia đoạn dây thành hai phần bằng nhau.]
    ),
    loigiai: [
        #step([Phân tích ý a và b])
        Gọi độ dài đoạn uốn tam giác đều là $x$ ($0 <= x <= 100$), phần uốn hình tròn là $100 - x$.
        Cạnh tam giác đều $a = x/3 => S_1 = a^2 sqrt(3)/4 = (x^2 sqrt(3))/36$.
        Bán kính hình tròn $r = (100 - x)/(2 pi) => S_2 = pi r^2 = (100 - x)^2 / (4 pi)$.
        Tổng diện tích: $S(x) = (sqrt(3)/36) x^2 + 1/(4 pi) (100 - x)^2$.
        Hệ số của $x^2$ là $sqrt(3)/36 + 1/(4 pi) > 0$ nên đồ thị là parabol có bề lõm quay lên trên, do đó nó có cực tiểu (giá trị nhỏ nhất) tại đỉnh chứ không có giá trị lớn nhất tại đỉnh. Ý a SAI, ý b ĐÚNG.
        #step([Phân tích ý c])
        Đạo hàm: $S'(x) = (sqrt(3)/18) x - (100 - x)/(2 pi) = 0$.
        Ta có $x = 3a$ và $100 - x = 2 pi r$.
        Thay vào phương trình đạo hàm:
        $(sqrt(3)/18)(3a) - (2 pi r)/(2 pi) = 0 <=> (sqrt(3)/6) a - r = 0 <=> a = 6/sqrt(3) r = 2 sqrt(3) r$. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Giá trị lớn nhất của $S(x)$ trên đoạn $[0; 100]$ chỉ có thể đạt tại biên:
        $S(0) = 100^2 / (4 pi) approx 795","77 "cm"^2$ (uốn toàn bộ thành hình tròn).
        $S(100) = (100^2 sqrt(3))/36 approx 481","13 "cm"^2$ (uốn toàn bộ thành tam giác).
        Giá trị lớn nhất đạt được khi không cắt dây mà uốn toàn bộ thành hình tròn ($x = 0$), không phải chia bằng nhau. Ý d SAI.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một kỹ sư ánh sáng cần thiết kế một bóng đèn chiếu điểm đặt tại điểm $S(0; h)$ trên trục tung thẳng đứng ($h > 0$) để chiếu sáng một vật thể cố định nằm tại điểm $A(d; 0)$ trên mặt đất phẳng ngang ($d > 0$ là hằng số cho trước). Biết rằng cường độ chiếu sáng $I$ tại $A$ tỉ lệ thuận với sin của góc nghiêng tia sáng so với mặt đất và tỉ lệ nghịch với bình phương khoảng cách từ nguồn sáng $S$ đến điểm $A$, theo công thức thực nghiệm:
$ I = k dot (sin alpha) / (S A^2) = k dot h / ((h^2 + d^2)^(3/2)) quad (k > 0 "là hằng số phát sáng"). $
],
    (
        True([Khi độ cao $h$ tiến dần về $0$ hoặc tiến ra vô cùng thì cường độ sáng $I$ tại điểm $A$ đều tiến về $0$.]),
        True([Đạo hàm của hàm số $f(h) = h / (h^2 + d^2)^(3/2)$ là $f'(h) = (d^2 - 2h^2) / (h^2 + d^2)^(5/2)$.]),
        True([Để cường độ chiếu sáng tại điểm $A$ đạt cực đại thì độ cao của ngọn đèn phải thỏa mãn $h = d / sqrt(2)$.]),
        [Tại vị trí độ cao tối ưu $h$, góc nghiêng của tia sáng $S A$ so với mặt phẳng nằm ngang xấp xỉ $45 degree$.]
    ),
    loigiai: [
        #step([Phân tích ý a])
        Ta có $\lim_(h -> 0^+) f(h) = 0/d^3 = 0$ và $\lim_(h -> +infinity) f(h) = \lim_(h -> +infinity) h/h^3 = 0$. Ý a ĐÚNG.
        #step([Phân tích ý b])
        $f'(h) = (1 dot (h^2+d^2)^(3/2) - h dot 3/2 (h^2+d^2)^(1/2) dot 2h) / (h^2+d^2)^3 = ((h^2+d^2) - 3h^2) / (h^2+d^2)^(5/2) = (d^2 - 2h^2) / (h^2+d^2)^(5/2)$. Ý b ĐÚNG.
        #step([Phân tích ý c])
        $f'(h) = 0 <=> d^2 - 2h^2 = 0 <=> h = d / sqrt(2)$ (vì $h > 0$). Hàm số đạt cực đại tại điểm này. Ý c ĐÚNG.
        #step([Phân tích ý d])
        Tại $h = d/sqrt(2)$, ta có $tan alpha = h / d = (d / sqrt(2)) / d = 1 / sqrt(2) approx 0","7071$.
        Suy ra $alpha = arctan(1/sqrt(2)) approx 35","26 degree$ (chứ không phải $45 degree$). Ý d SAI.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một xưởng cơ khí cần làm một khung biển quảng cáo hình chữ nhật có diện tích $54 "m"^2$. Phía trên và phía dưới biển quảng cáo có gắn thêm hai thanh nẹp thép bảo vệ chịu lực có giá 150.000 đồng/m, hai cạnh bên gắn nẹp thường có giá 100.000 đồng/m. Tổng chi phí mua thanh nẹp nhỏ nhất để làm khung biển quảng cáo là bao nhiêu triệu đồng?],
    [3.6],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi chiều dài (cạnh trên và dưới) là $x$ (m) và chiều rộng (hai cạnh bên) là $y$ (m), với $x, y > 0$.
        Diện tích $x y = 54 => y = 54 / x$.
        Chi phí nẹp trên và dưới: $2x dot 0","15 = 0","3x$ (triệu đồng).
        Chi phí nẹp hai bên: $2y dot 0","10 = 0","2y = 0","2 dot (54/x) = 10","8 / x$ (triệu đồng).
        Tổng chi phí: $C(x) = 0","3x + 10","8 / x$.
        Áp dụng BĐT Cauchy:
        $C(x) >= 2 sqrt(0","3x dot 10","8 / x) = 2 sqrt(3","24) = 2 dot 1","8 = 3","6$ triệu đồng.
        Dấu "=" xảy ra khi $0","3x = 10","8 / x <=> x^2 = 36 <=> x = 6$ m, suy ra $y = 9$ m.
        Vậy chi phí nhỏ nhất là $3","6$ triệu đồng.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một mảnh đất hình chữ nhật được rào kín xung quanh và chia thành $3$ lô đất hình chữ nhật nhỏ bằng nhau bằng cách dựng thêm $2$ hàng rào song song với chiều rộng của mảnh đất. Người ta sử dụng tổng cộng $120$ m lưới thép cho cả hàng rào bao quanh và $2$ hàng rào ngăn cách. Tổng diện tích lớn nhất của mảnh đất rào được bằng bao nhiêu mét vuông?],
    [450],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi chiều dài mảnh đất là $x$ (m), chiều rộng là $y$ (m) với $x, y > 0$.
        Tổng chiều dài lưới thép gồm 2 cạnh chiều dài và 4 cạnh chiều rộng (2 cạnh bao và 2 vách ngăn):
        $2x + 4y = 120 <=> x + 2y = 60 <=> x = 60 - 2y$ với $0 < y < 30$.
        Diện tích của mảnh đất:
        $S(y) = x y = y(60 - 2y) = -2y^2 + 60y = -2(y - 15)^2 + 450 <= 450$.
        Dấu "=" xảy ra khi $y = 15$ m, khi đó $x = 60 - 2(15) = 30$ m.
        Vậy diện tích lớn nhất rào được là $450 "m"^2$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một tấm kính hình tròn bán kính $R = 50$ cm. Người thợ muốn cắt từ tấm kính đó một hình chữ nhật có diện tích lớn nhất để làm mặt bàn kính. Biết rằng hình chữ nhật đó nội tiếp trong đường tròn. Diện tích lớn nhất của tấm kính hình chữ nhật đó bằng bao nhiêu nghìn xăng-ti-mét vuông ($1000 "cm"^2$)?],
    [5],
    loigiai: [
        #step([Lời giải chi tiết])
        Hình chữ nhật nội tiếp đường tròn bán kính $R = 50$ cm có đường chéo đúng bằng đường kính $2R = 100$ cm.
        Gọi hai kích thước của hình chữ nhật là $a$ và $b$ ($a, b > 0$).
        Theo định lý Pytago: $a^2 + b^2 = (2R)^2 = 100^2 = 10000$.
        Diện tích hình chữ nhật là $S = a b$.
        Theo BĐT Cauchy: $a b <= (a^2 + b^2)/2 = 10000 / 2 = 5000 "cm"^2$.
        Dấu "=" xảy ra khi $a = b = 50 sqrt(2)$ cm (hình vuông).
        Vậy diện tích lớn nhất là $5000 "cm"^2 = 5$ nghìn $"cm"^2$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Cho một tam giác vuông có cạnh huyền bằng $10$ cm. Diện tích lớn nhất của tam giác vuông đó bằng bao nhiêu xăng-ti-mét vuông?],
    [25],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi độ dài hai cạnh góc vuông của tam giác là $x$ và $y$ ($x, y > 0$).
        Theo định lý Pytago: $x^2 + y^2 = 10^2 = 100$.
        Diện tích tam giác vuông: $S = 1/2 x y$.
        Áp dụng bất đẳng thức Cauchy: $x y <= (x^2 + y^2)/2 = 100 / 2 = 50$.
        Suy ra $S = 1/2 x y <= 1/2 dot 50 = 25 "cm"^2$.
        Dấu "=" xảy ra khi tam giác vuông cân ($x = y = 5 sqrt(2)$ cm).
        Vậy diện tích lớn nhất là $25 "cm"^2$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một đoạn dây thép dài $34$ m được cắt thành hai phần: phần thứ nhất uốn thành một hình vuông cạnh $x$ (m), phần còn lại uốn thành một hình chữ nhật có chiều dài gấp đôi chiều rộng. Để tổng diện tích của hình vuông và hình chữ nhật là nhỏ nhất thì cạnh hình vuông $x$ phải bằng bao nhiêu mét?],
    [4],
    loigiai: [
        #step([Lời giải chi tiết])
        Độ dài đoạn uốn hình vuông là $4x$ ($0 < x < 34/4$).
        Đoạn dây còn lại là $34 - 4x$ uốn thành hình chữ nhật có chiều rộng $y$ và chiều dài $2y$.
        Chu vi hình chữ nhật: $2(y + 2y) = 6y = 34 - 4x => y = (17 - 2x) / 3$.
        Diện tích hình vuông: $S_1 = x^2$.
        Diện tích hình chữ nhật: $S_2 = y dot 2y = 2 y^2 = 2 dot ((17 - 2x)/3)^2 = 2/9 (17 - 2x)^2 = 8/9 (8","5 - x)^2$.
        Tổng diện tích:
        $S(x) = x^2 + 2/9 (17 - 2x)^2 = x^2 + 2/9 (4x^2 - 68x + 289) = 17/9 x^2 - 136/9 x + 578/9$.
        Hàm số bậc hai có cực tiểu tại đỉnh parabol:
        $x = (-b)/(2a) = (136/9) / (2 dot 17/9) = 136 / 34 = 4$ m.
        Vậy cạnh hình vuông cần uốn là $x = 4$ m.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề cd01A — Mã 501], back-to: "sec-exercise-hub",[Một khu đất hình chữ nhật có diện tích $8100 "m"^2$. Người ta muốn xây tường rào bao quanh toàn bộ khu đất. Để chi phí xây tường rào là nhỏ nhất thì chu vi của khu đất đó bằng bao nhiêu mét?],
    [360],
    loigiai: [
        #step([Lời giải chi tiết])
        Gọi hai kích thước chiều dài và chiều rộng của khu đất lần lượt là $x$ và $y$ ($x, y > 0$).
        Ta có diện tích $x y = 8100$.
        Chu vi của khu đất: $P = 2(x + y)$.
        Chi phí xây tường rào tỉ lệ thuận với chu vi, do đó chi phí nhỏ nhất khi chu vi nhỏ nhất.
        Áp dụng bất đẳng thức Cauchy:
        $x + y >= 2 sqrt(x y) = 2 sqrt(8100) = 2 dot 90 = 180$ m.
        Suy ra chu vi: $P = 2(x + y) >= 2 dot 180 = 360$ m.
        Dấu "=" xảy ra khi khu đất là hình vuông $x = y = 90$ m.
        Vậy chu vi nhỏ nhất của khu đất là $360$ m.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHỦ ĐỀ 1A: TỐI ƯU HÓA HÌNH HỌC 2D & UỐN DÂY TẠO HÌNH (VD - VDC)!]      #v(0.6em)
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
