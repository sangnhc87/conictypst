// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 22: BA ĐƯỜNG CONIC (ĐỀ SỐ 24B - VẬN DỤNG & THỰC TIỄN)
// Lớp: Khối 10  ·  Mã đề: 165  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 22: BA ĐƯỜNG CONIC (ĐỀ SỐ 24B - VẬN DỤNG & THỰC TIỄN)",
  subtitle: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG — MÃ ĐỀ: 165",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 165]],
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
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Elip $(E): x^2 / 100 + y^2 / 36 = 1$. Tỉ số giữa tiêu cự và độ dài trục lớn của $(E)$ bằng],
    (
        True([$4 / 5$]),
        [$3 / 5$],
        [$8 / 5$],
        [$5 / 4$]
    ),
    loigiai: [
        Ta có $a^2 = 100 => a = 10$ và $b^2 = 36 => b = 6$.
        $ c = sqrt(a^2 - b^2) = sqrt(100 - 36) = sqrt(64) = 8 $
        Tiêu cự là $2c = 16$, độ dài trục lớn là $2a = 20$.
        Tỉ số: $(2c) / (2a) = c / a = 8 / 10 = 4 / 5$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Độ dài trục ảo của Hypebol $(H): x^2 / 25 - y^2 / 144 = 1$ bằng],
    (
        True([$24$]),
        [$12$],
        [$10$],
        [$26$]
    ),
    loigiai: [
        Hypebol có $a^2 = 25 => a = 5$ và $b^2 = 144 => b = 12$.
        Độ dài trục ảo là $2b = 2(12) = 24$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 6x$. Một điểm $M$ thuộc $(P)$ có khoảng cách đến tiêu điểm $F$ bằng $5$. Hoành độ của điểm $M$ bằng],
    (
        True([$3.5$]),
        [$2$],
        [$3$],
        [$4$]
    ),
    loigiai: [
        Ta có $2p = 6 => p = 3$.
        Khoảng cách từ $M$ đến tiêu điểm là bán kính qua tiêu:
        $ M F = x_M + p / 2 <=> 5 = x_M + 3 / 2 <=> x_M = 5 - 1.5 = 3.5 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Phương trình chính tắc của Elip đi qua hai điểm $M(0; 3)$ và $N(4; 0)$ là],
    (
        True([$x^2 / 16 + y^2 / 9 = 1$]),
        [$x^2 / 9 + y^2 / 16 = 1$],
        [$x^2 / 4 + y^2 / 3 = 1$],
        [$x^2 / 16 - y^2 / 9 = 1$]
    ),
    loigiai: [
        Vì $M(0; 3)$ và $N(4; 0)$ là các đỉnh nằm trên hai trục tọa độ nên:
        $ b = 3 => b^2 = 9; quad a = 4 => a^2 = 16 $
        Phương trình chính tắc: $x^2 / 16 + y^2 / 9 = 1$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Phương trình chính tắc của Hypebol có tiêu cự bằng $20$ và một đường tiệm cận là $y = 3 / 4 x$ là],
    (
        True([$x^2 / 64 - y^2 / 36 = 1$]),
        [$x^2 / 36 - y^2 / 64 = 1$],
        [$x^2 / 16 - y^2 / 9 = 1$],
        [$x^2 / 64 + y^2 / 36 = 1$]
    ),
    loigiai: [
        Tiêu cự $2c = 20 => c = 10 => a^2 + b^2 = c^2 = 100$.
        Đường tiệm cận $b / a = 3 / 4 => b = 3 / 4 a$.
        Thay vào: $a^2 + (3 / 4 a)^2 = 100 <=> 25 / 16 a^2 = 100 <=> a^2 = 64 => b^2 = 36$.
        Phương trình: $x^2 / 64 - y^2 / 36 = 1$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 16x$. Độ dài dây cung của $(P)$ vuông góc với trục đối xứng tại tiêu điểm $F$ bằng],
    (
        True([$16$]),
        [$8$],
        [$32$],
        [$4$]
    ),
    loigiai: [
        Ta có $2p = 16 => p = 8$. Tiêu điểm $F(4; 0)$.
        Đường thẳng qua $F$ vuông góc trục $O x$ có phương trình $x = 4$.
        Thay vào Parabol: $y^2 = 16(4) = 64 <=> y = plus.minus 8$.
        Độ dài dây cung: $8 - (-8) = 16 = 2p$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$ và điểm $M in (E)$. Tổng khoảng cách từ $M$ đến hai tiêu điểm $F_1, F_2$ bằng],
    (
        True([$10$]),
        [$6$],
        [$8$],
        [$5$]
    ),
    loigiai: [
        Theo định nghĩa đường Elip, với mọi điểm $M in (E)$ ta luôn có:
        $ M F_1 + M F_2 = 2a = 2 sqrt(25) = 2(5) = 10 $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ và điểm $M$ thuộc nhánh bên phải của $(H)$. Hiệu khoảng cách $M F_1 - M F_2$ bằng],
    (
        True([$8$]),
        [$6$],
        [$10$],
        [$4$]
    ),
    loigiai: [
        Theo định nghĩa Hypebol, với điểm $M$ thuộc nhánh phải:
        $ M F_1 - M F_2 = 2a = 2 sqrt(16) = 2(4) = 8 $
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Diện tích hình chữ nhật cơ sở của Hypebol $(H): x^2 / 9 - y^2 / 4 = 1$ bằng],
    (
        True([$24$]),
        [$12$],
        [$6$],
        [$36$]
    ),
    loigiai: [
        Ta có $a^2 = 9 => a = 3$ và $b^2 = 4 => b = 2$.
        Kích thước hình chữ nhật cơ sở là $2a = 6$ và $2b = 4$.
        Diện tích: $S = 2a times 2b = 6 times 4 = 24$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Diện tích của hình chữ nhật cơ sở ngoại tiếp Elip $(E): x^2 / 16 + y^2 / 9 = 1$ bằng],
    (
        True([$48$]),
        [$24$],
        [$12$],
        [$96$]
    ),
    loigiai: [
        Ta có $a = 4$ và $b = 3$.
        Độ dài trục lớn $2a = 8$, độ dài trục nhỏ $2b = 6$.
        Diện tích hình chữ nhật cơ sở ngoại tiếp: $S = 2a times 2b = 8 times 6 = 48$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Mặt cắt thẳng đứng của tháp làm mát tại một nhà máy điện là một đường Hypebol có phương trình $x^2 / 400 - y^2 / 900 = 1$ (đơn vị: mét).
Bán kính của tháp tại vị trí thắt hẹp nhất bằng],
    (
        True([$20 text(" m")$]),
        [$40 text(" m")$],
        [$30 text(" m")$],
        [$10 text(" m")$]
    ),
    loigiai: [
        Vị trí thắt hẹp nhất của tháp tương ứng với tung độ $y = 0$.
        Thay $y = 0$ vào phương trình Hypebol:
        $ x^2 / 400 = 1 <=> x^2 = 400 <=> x = 20 text(" m") $
        Vậy bán kính hẹp nhất bằng $20 text(" m")$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Một vòm cầu vượt có dạng nửa đường Elip với chiều rộng nhịp cầu $20 text(" m")$ và chiều cao tại đỉnh vòm cầu là $6 text(" m")$.
Chiều cao của vòm cầu tại vị trí cách tâm chân cầu $8 text(" m")$ bằng],
    (
        True([$3.6 text(" m")$]),
        [$4.8 text(" m")$],
        [$3.2 text(" m")$],
        [$4.0 text(" m")$]
    ),
    loigiai: [
        Chọn hệ trục $O x y$ có gốc $O$ tại tâm chân cầu.
        Bán trục lớn $a = 20 / 2 = 10 text(" m")$, bán trục nhỏ $b = 6 text(" m")$.
        Phương trình nửa trên Elip: $x^2 / 100 + y^2 / 36 = 1$ ($y >= 0$).
        Tại vị trí $x = 8 text(" m")$:
        $ 8^2 / 100 + y^2 / 36 = 1 <=> 64 / 100 + y^2 / 36 = 1 <=> y^2 / 36 = 0.36 <=> y^2 = 12.96 => y = 3.6 text(" m") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Hypebol và hình chữ nhật cơ sở có CeTZ)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$ có hình biểu diễn trên mặt phẳng tọa độ $O x y$:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-6, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -4.5), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Hình chữ nhật cơ sở 2a = 8, 2b = 6 (scale 0.6)
  rect((-2.4, -1.8), (2.4, 1.8), stroke: (dash: "dashed", paint: gray))
  
  // Tiệm cận y = +- 3/4 x
  line((-4, -3), (4, 3), stroke: 0.8pt + blue)
  line((-4, 3), (4, -3), stroke: 0.8pt + blue)
  
  // Vẽ hai nhánh Hypebol x = a cosh t, y = b sinh t
  // Nhánh phải: đỉnh (2.4, 0)
  circle((2.4, 0), radius: 2pt, fill: rgb("0d9488"))
  content((2.8, -0.3), [$A_2$])
  circle((-2.4, 0), radius: 2pt, fill: rgb("0d9488"))
  content((-2.8, -0.3), [$A_1$])
  
  // Tiêu điểm F1(-3, 0), F2(3, 0)
  circle((-3, 0), radius: 2pt, fill: red)
  content((-3, 0.3), [$F_1$])
  circle((3, 0), radius: 2pt, fill: red)
  content((3, 0.3), [$F_2$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ dài bán trục thực là $a = 4$ và bán trục ảo là $b = 3$.]),
    True([Hình chữ nhật cơ sở của Hypebol có kích thước chiều dài bằng $8$ và chiều rộng bằng $6$.]),
    True([Hai đường chéo của hình chữ nhật cơ sở nằm trên hai đường tiệm cận của Hypebol.]),
    [Diện tích của hình chữ nhật cơ sở bằng $24$.]
  ),
  loigiai: [
    #step([Bán trục])
    $a^2 = 16 => a = 4$; $b^2 = 9 => b = 3$. Mệnh đề a ĐÚNG.

    #step([Kích thước hình chữ nhật])
    Chiều dài $2a = 8$ và chiều rộng $2b = 6$. Mệnh đề b ĐÚNG.

    #step([Đường tiệm cận])
    Hai đường chéo nối các đỉnh đối diện của hình chữ nhật cơ sở đi qua gốc tọa độ có hệ số góc $plus.minus b / a = plus.minus 3 / 4$, chính là hai đường tiệm cận. Mệnh đề c ĐÚNG.

    #step([Diện tích hình chữ nhật cơ sở])
    $S = 2a times 2b = 8 times 6 = 48$ (chứ không phải bằng $24$).
    Khẳng định diện tích bằng $24$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Tháp làm mát nhiệt điện Hyperboloid)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Một tháp làm mát nhà máy nhiệt điện có mặt cắt thẳng đứng là một Hypebol $(H): x^2 / 400 - y^2 / 900 = 1$ (đơn vị: mét, gốc $O$ đặt tại tâm vòng tròn thắt hẹp nhất).
Tháp có chiều cao $150 text(" m")$, phần thân tháp phía trên thắt hẹp cao $90 text(" m")$ ($y = 90$) và phần chân tháp phía dưới cao $60 text(" m")$ ($y = -60$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Bán kính của tháp tại vị trí thắt hẹp nhất bằng $20 text(" m")$.]),
    True([Bán kính của miệng tháp phía trên ($y = 90$) bằng $20 sqrt(10) text(" m")$.]),
    True([Bán kính của chân tháp phía dưới ($y = -60$) bằng $20 sqrt(5) text(" m")$.]),
    [Đường kính miệng trên của tháp nhỏ hơn đường kính tại vị trí thắt hẹp nhất.]
  ),
  loigiai: [
    #step([Vị trí thắt hẹp nhất])
    Tại $y = 0$, $x^2 / 400 = 1 => x = 20 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Bán kính miệng tháp trên])
    Tại $y = 90$, $x^2 / 400 = 1 + 90^2 / 900 = 1 + 9 = 10 => x^2 = 4000 => x = 20 sqrt(10) text(" m")$. Mệnh đề b ĐÚNG.

    #step([Bán kính chân tháp])
    Tại $y = -60$, $x^2 / 400 = 1 + (-60)^2 / 900 = 1 + 4 = 5 => x^2 = 2000 => x = 20 sqrt(5) text(" m")$. Mệnh đề c ĐÚNG.

    #step([So sánh đường kính])
    Bán kính miệng tháp là $20 sqrt(10) approx 63.2 text(" m")$, lớn hơn nhiều so với bán kính thắt hẹp $20 text(" m")$.
    Khẳng định miệng trên nhỏ hơn vị trí thắt hẹp là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Vòm cầu bán elip)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Một vòm cầu vượt sông được xây dựng dạng nửa hình Elip với nhịp cầu rộng $20 text(" m")$ ($2a = 20$) và chiều cao đỉnh vòm so với mặt nước là $6 text(" m")$ ($b = 6$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình đường viền vòm cầu là $x^2 / 100 + y^2 / 36 = 1$ với $y >= 0$.]),
    True([Điểm cao nhất của vòm cầu cách mặt nước một khoảng bằng $6 text(" m")$.]),
    True([Tại vị trí cách tâm cầu $8 text(" m")$, chiều cao vòm cầu đạt $3.6 text(" m")$.]),
    [Một sà lan chở hàng có chiều rộng $12 text(" m")$ và mạn nổi cao $5 text(" m")$ có thể đi lọt an toàn qua vòm cầu.]
  ),
  loigiai: [
    #step([Phương trình vòm cầu])
    $a = 10, b = 6 => x^2 / 100 + y^2 / 36 = 1$ ($y >= 0$). Mệnh đề a ĐÚNG.

    #step([Điểm cao nhất])
    Đỉnh vòm tại $x = 0 => y = 6 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Chiều cao tại x = 8m])
    $y = 6 sqrt(1 - 8^2 / 100) = 6 sqrt(0.36) = 6(0.6) = 3.6 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra sà lan rộng 12m, cao 5m])
    Mép ngoài sà lan cách tâm $x = 12 / 2 = 6 text(" m")$.
    Tại $x = 6 text(" m")$, chiều cao vòm cầu là:
    $ y = 6 sqrt(1 - 6^2 / 100) = 6 sqrt(0.64) = 6(0.8) = 4.8 text(" m") $
    Vì $4.8 text(" m") < 5 text(" m")$ nên mạn sà lan sẽ va chạm vào vòm cầu. Sà lan không thể đi lọt.
    Khẳng định đi lọt an toàn là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Dây cung tiêu điểm Parabol)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 8x$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tham số tiêu của Parabol là $p = 4$.]),
    True([Tiêu điểm của Parabol có tọa độ $F(2; 0)$.]),
    True([Dây cung $A B$ của $(P)$ vuông góc với trục đối xứng tại tiêu điểm $F$ có hai đầu mút là $A(2; 4)$ và $B(2; -4)$.]),
    [Độ dài của dây cung tiêu điểm $A B$ bằng $16$.]
  ),
  loigiai: [
    #step([Tham số tiêu])
    $2p = 8 => p = 4$. Mệnh đề a ĐÚNG.

    #step([Tiêu điểm])
    $F(p / 2; 0) = F(2; 0)$. Mệnh đề b ĐÚNG.

    #step([Hai đầu mút dây cung qua tiêu])
    Đường thẳng qua $F(2; 0)$ vuông góc $O x$ là $x = 2$.
    Thay vào Parabol: $y^2 = 8(2) = 16 <=> y = plus.minus 4$.
    Hai đầu mút là $A(2; 4)$ và $B(2; -4)$. Mệnh đề c ĐÚNG.

    #step([Độ dài dây cung])
    $A B = 4 - (-4) = 8 = 2p$ (chứ không phải $16$).
    Khẳng định độ dài bằng $16$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Độ dài trục ảo Hypebol)
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Hypebol $(H): x^2 / 25 - y^2 / 144 = 1$. Độ dài trục ảo của Hypebol bằng bao nhiêu?],
    [24],
    loigiai: [
        #step([Xác định bán trục ảo b])
        $ b^2 = 144 => b = 12 $
        
        #step([Tính độ dài trục ảo])
        $ 2b = 2(12) = 24 $
    ]
)

// TLN 2 (Chiều cao vòm cầu tại x = 8m)
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Trong bài toán vòm cầu bán elip nhịp rộng $20 text(" m")$ cao $6 text(" m")$, chiều cao của vòm cầu tại vị trí cách tâm $8 text(" m")$ bằng bao nhiêu mét?],
    [3.6],
    loigiai: [
        #step([Tính y])
        $ y = 6 sqrt(1 - 8^2 / 100) = 6 sqrt(0.36) = 3.6 text(" m") $
    ]
)

// TLN 3 (Bán kính thắt hẹp tháp làm mát)
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Trong bài toán tháp làm mát $x^2 / 400 - y^2 / 900 = 1$, bán kính của tháp tại vị trí thắt hẹp nhất bằng bao nhiêu mét?],
    [20],
    loigiai: [
        #step([Thay y = 0])
        $ x^2 / 400 = 1 => x = 20 text(" m") $
    ]
)

// TLN 4 (Hoành độ điểm M trên Parabol)
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 6x$. Một điểm $M in (P)$ có khoảng cách đến tiêu điểm $F$ bằng $5$. Hoành độ của điểm $M$ bằng bao nhiêu?],
    [3.5],
    loigiai: [
        #step([Tính xM])
        $x_M + p / 2 = 5 <=> x_M + 1.5 = 5 <=> x_M = 3.5$.
    ]
)

// TLN 5 (Diện tích hình chữ nhật cơ sở Elip)
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Diện tích hình chữ nhật cơ sở ngoại tiếp Elip $(E): x^2 / 16 + y^2 / 9 = 1$ bằng bao nhiêu?],
    [48],
    loigiai: [
        #step([Tính 2a và 2b])
        $2a = 2(4) = 8; quad 2b = 2(3) = 6$.
        
        #step([Tính diện tích])
        $ S = 8 times 6 = 48 $
    ]
)

// TLN 6 (Độ dài dây cung tiêu điểm Parabol)
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 165], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 8x$. Độ dài của dây cung đi qua tiêu điểm và vuông góc với trục đối xứng của Parabol bằng bao nhiêu?],
    [8],
    loigiai: [
        #step([Áp dụng công thức latus rectum])
        Độ dài dây cung vuông góc trục đối xứng tại tiêu điểm là $2p$:
        $ 2p = 8 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 22: BA ĐƯỜNG CONIC (ĐỀ SỐ 24B - VẬN DỤNG & THỰC TIỄN)!]      #v(0.6em)
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
