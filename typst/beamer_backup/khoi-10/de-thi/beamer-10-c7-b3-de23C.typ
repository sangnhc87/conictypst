// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 21: ĐƯỜNG TRÒN TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 23C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 163  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 21: ĐƯỜNG TRÒN TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 23C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG — MÃ ĐỀ: 163",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 163]],
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
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Một tiếp tuyến của đường tròn $(C): x^2 + y^2 - 2x - 4y + 4 = 0$ vuông góc với đường thẳng $d: 3x - 4y + 5 = 0$ có phương trình là],
    (
        True([$4x + 3y - 5 = 0$]),
        [$4x + 3y + 5 = 0$],
        [$3x - 4y + 1 = 0$],
        [$4x - 3y - 5 = 0$]
    ),
    loigiai: [
        Đường tròn $(C)$ có tâm $I(1; 2)$, bán kính $R = sqrt(1^2 + 2^2 - 4) = 1$.
        Tiếp tuyến vuông góc với $d$ có dạng: $4x + 3y + c = 0$.
        Tiếp xúc với $(C)$ khi và chỉ khi:
        $ d(I, Delta) = (|4(1) + 3(2) + c|) / sqrt(4^2 + 3^2) = 1 <=> (|c + 10|) / 5 = 1 <=> |c + 10| = 5 <=> cases(c + 10 = 5 => c = -5, c + 10 = -5 => c = -15) $
        Phương trình tiếp tuyến là $4x + 3y - 5 = 0$ hoặc $4x + 3y - 15 = 0$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho điểm $M$ di động trên đường tròn $(C): (x - 3)^2 + (y - 4)^2 = 4$. Khoảng cách lớn nhất từ gốc tọa độ $O$ đến điểm $M$ bằng],
    (
        True([$7$]),
        [$5$],
        [$3$],
        [$9$]
    ),
    loigiai: [
        Đường tròn $(C)$ có tâm $I(3; 4)$ và bán kính $R = 2$.
        Khoảng cách từ gốc tọa độ $O$ đến tâm $I$ là:
        $ O I = sqrt(3^2 + 4^2) = 5 $
        Khoảng cách lớn nhất từ $O$ đến một điểm trên đường tròn:
        $ d_text("max") = O I + R = 5 + 2 = 7 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Khoảng cách ngắn nhất từ gốc tọa độ $O$ đến một điểm $M$ di động trên đường tròn $(C): (x - 3)^2 + (y - 4)^2 = 4$ bằng],
    (
        True([$3$]),
        [$5$],
        [$1$],
        [$2$]
    ),
    loigiai: [
        Tâm $I(3; 4)$, $R = 2$, khoảng cách $O I = 5$.
        Khoảng cách ngắn nhất:
        $ d_text("min") = O I - R = 5 - 2 = 3 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho hai đường tròn $(C_1): (x - 1)^2 + y^2 = 9$ và $(C_2): (x - 5)^2 + (y - 3)^2 = 4$. Số tiếp tuyến chung của hai đường tròn là],
    (
        True([$3$]),
        [$4$],
        [$2$],
        [$1$]
    ),
    loigiai: [
        - $(C_1)$ có tâm $I_1(1; 0)$, bán kính $R_1 = 3$.
        - $(C_2)$ có tâm $I_2(5; 3)$, bán kính $R_2 = 2$.
        Khoảng cách giữa hai tâm:
        $ I_1 I_2 = sqrt((5 - 1)^2 + (3 - 0)^2) = sqrt(4^2 + 3^2) = 5 $
        Vì $I_1 I_2 = 5 = R_1 + R_2 = 3 + 2$ nên hai đường tròn tiếp xúc ngoài nhau.
        Hai đường tròn tiếp xúc ngoài luôn có đúng 3 tiếp tuyến chung (2 tiếp tuyến chung ngoài và 1 tiếp tuyến chung trong).
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho đường tròn $(C): x^2 + y^2 - 4x + 2y - 4 = 0$. Điểm $M$ thuộc đường tròn $(C)$ có tung độ lớn nhất có tọa độ là],
    (
        True([$M(2; 2)$]),
        [$M(2; -4)$],
        [$M(5; -1)$],
        [$M(-1; -1)$]
    ),
    loigiai: [
        Phương trình đường tròn: $(x - 2)^2 + (y + 1)^2 = 9$.
        Tâm $I(2; -1)$, bán kính $R = 3$.
        Tung độ của điểm trên đường tròn thỏa mãn:
        $ -1 - R <= y <= -1 + R <=> -4 <= y <= 2 $
        Tung độ lớn nhất bằng $2$ đạt được khi $x = 2$.
        Vậy điểm cần tìm là $M(2; 2)$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho đường tròn $(C): x^2 + y^2 = 25$ và điểm $A(1; 2)$ nằm trong đường tròn. Dây cung $M N$ của $(C)$ đi qua $A$ có độ dài ngắn nhất có phương trình là],
    (
        True([$x + 2y - 5 = 0$]),
        [$2x - y = 0$],
        [$x + 2y + 5 = 0$],
        [$x - 2y + 3 = 0$]
    ),
    loigiai: [
        Dây cung qua $A$ có độ dài ngắn nhất khi nó vuông góc với bán kính $O A$.
        Vectơ pháp tuyến của đường thẳng $M N$ là $vec(O A) = (1; 2)$.
        Phương trình đường thẳng $M N$ đi qua $A(1; 2)$:
        $ 1(x - 1) + 2(y - 2) = 0 <=> x + 2y - 5 = 0 $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Độ dài của dây cung ngắn nhất đi qua điểm $A(1; 2)$ của đường tròn $(C): x^2 + y^2 = 25$ bằng],
    (
        True([$4 sqrt(5)$]),
        [$2 sqrt(5)$],
        [$10$],
        [$8$]
    ),
    loigiai: [
        Khoảng cách từ tâm $O$ đến dây cung ngắn nhất chính là $O A = sqrt(1^2 + 2^2) = sqrt(5)$.
        Độ dài dây cung ngắn nhất:
        $ M N = 2 sqrt(R^2 - O A^2) = 2 sqrt(25 - 5) = 2 sqrt(20) = 4 sqrt(5) $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Trong mặt phẳng $O x y$, cho tam giác $A B C$ vuông tại $C(0; 0)$ có hai đỉnh $A(0; 3)$ và $B(4; 0)$. Bán kính đường tròn nội tiếp tam giác $A B C$ bằng],
    (
        True([$1$]),
        [$2$],
        [$0.5$],
        [$1.5$]
    ),
    loigiai: [
        Độ dài hai cạnh góc vuông: $C A = 3$, $C B = 4$.
        Độ dài cạnh huyền: $A B = sqrt(3^2 + 4^2) = 5$.
        Bán kính đường tròn nội tiếp tam giác vuông:
        $ r = (C A + C B - A B) / 2 = (3 + 4 - 5) / 2 = 2 / 2 = 1 $
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Tìm giá trị dương của tham số $m$ để đường thẳng $d: 3x - 4y + m = 0$ cắt đường tròn $(C): (x - 1)^2 + y^2 = 50$ tại hai điểm phân biệt $A, B$ sao cho tam giác $I A B$ vuông cân tại tâm $I$.],
    (
        True([$m = 22$]),
        [$m = 25$],
        [$m = 28$],
        [$m = 20$]
    ),
    loigiai: [
        Đường tròn có tâm $I(1; 0)$, bán kính $R = sqrt(50) = 5 sqrt(2)$.
        Tam giác $I A B$ vuông cân tại $I$ khi và chỉ khi khoảng cách từ $I$ đến dây cung $A B$ bằng:
        $ h = R / sqrt(2) = (5 sqrt(2)) / sqrt(2) = 5 $
        Theo công thức khoảng cách:
        $ d(I, d) = (|3(1) - 4(0) + m|) / sqrt(3^2 + (-4)^2) = (|m + 3|) / 5 = 5 $
        $ <=> |m + 3| = 25 <=> cases(m + 3 = 25 <=> m = 22, m + 3 = -25 <=> m = -28) $
        Vì $m > 0$ nên chọn $m = 22$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Tập hợp tâm của các đường tròn luôn tiếp xúc với trục hoành $O x$ tại gốc tọa độ $O(0; 0)$ là],
    (
        True([Trục tung $O y$ loại bỏ gốc tọa độ $O$]),
        [Trục hoành $O x$ loại bỏ gốc tọa độ $O$],
        [Đường phân giác $y = x$],
        [Toàn bộ mặt phẳng $O x y$]
    ),
    loigiai: [
        Vì đường tròn tiếp xúc với trục hoành $O x$ tại gốc tọa độ $O(0; 0)$ nên tiếp tuyến là trục hoành.
        Đoạn nối tâm $I$ và tiếp điểm $O$ vuông góc với tiếp tuyến, tức là $I O perp O x$.
        Do đó tâm $I$ phải nằm trên trục tung $O y$ ($x = 0$) và $I != O$ (vì bán kính $R > 0$).
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Một trạm radar kiểm soát không lưu đặt tại gốc tọa độ $O(0; 0)$ có bán kính quét $R = 100 text(" km")$.
Một máy bay thương mại bay theo đường thẳng $d: 3x + 4y - 300 = 0$ (đơn vị: kilômét).
Chiều dài quãng đường bay mà máy bay nằm trong tầm kiểm soát của radar bằng],
    (
        True([$160 text(" km")$]),
        [$120 text(" km")$],
        [$80 text(" km")$],
        [$100 text(" km")$]
    ),
    loigiai: [
        Khoảng cách từ trạm radar đến đường bay của máy bay:
        $ h = d(O, d) = (|3(0) + 4(0) - 300|) / sqrt(3^2 + 4^2) = 300 / 5 = 60 text(" km") $
        Vì $h = 60 < R = 100$ nên máy bay cắt qua vùng phủ sóng theo một dây cung.
        Độ dài quãng đường bay trong tầm quét:
        $ L = 2 sqrt(R^2 - h^2) = 2 sqrt(100^2 - 60^2) = 2 sqrt(6400) = 2(80) = 160 text(" km") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Một hầm chui giao thông có mặt cắt dạng nửa trên đường tròn bán kính $R = 5 text(" m")$.
Hầm có hai làn xe với tổng chiều rộng $6 text(" m")$ được bố trí đối xứng qua trục tâm của hầm.
Chiều cao tĩnh không tối đa của xe tải cho phép lưu thông an toàn trong hầm bằng],
    (
        True([$4 text(" m")$]),
        [$4.5 text(" m")$],
        [$3.5 text(" m")$],
        [$5 text(" m")$]
    ),
    loigiai: [
        Mặt cắt hầm là nửa trên đường tròn: $x^2 + y^2 = 25$ với $y >= 0$.
        Chiều rộng hai làn xe là $6 text(" m")$, bố trí đối xứng nên mép ngoài của làn xe cách tâm trục một đoạn $x = 6 / 2 = 3 text(" m")$.
        Thay $x = 3$ vào phương trình đường tròn:
        $ 3^2 + y^2 = 25 <=> y^2 = 25 - 9 = 16 <=> y = 4 text(" m") $
        Vậy chiều cao tĩnh không tối đa cho phép là $4 text(" m")$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Khoảng cách từ gốc tọa độ đến đường tròn có CeTZ)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Trong mặt phẳng tọa độ $O x y$, cho đường tròn $(C): (x - 3)^2 + (y - 4)^2 = 4$ và gốc tọa độ $O(0; 0)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (6.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -1), (0, 7), stroke: 0.8pt, mark: (end: "stealth"))
  content((6.3, -0.3), [$x$])
  content((-0.3, 6.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đường tròn tâm I(3; 4), R = 2
  circle((3, 4), radius: 2, stroke: 1.2pt + rgb("d97706"))
  circle((3, 4), radius: 2pt, fill: rgb("d97706"))
  content((3.5, 4.2), [$I(3; 4)$])
  
  // Đoạn nối OI kéo dài qua tâm
  line((0, 0), (4.2, 5.6), stroke: (dash: "dashed", paint: blue))
  
  // Điểm gần nhất M1(1.8; 2.4)
  circle((1.8, 2.4), radius: 2pt, fill: red)
  content((1.2, 2.6), [$M_1$])
  
  // Điểm xa nhất M2(4.2; 5.6)
  circle((4.2, 5.6), radius: 2pt, fill: red)
  content((4.7, 5.8), [$M_2$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường tròn $(C)$ có tâm là $I(3; 4)$ và bán kính $R = 2$.]),
    True([Khoảng cách từ gốc tọa độ $O$ đến tâm $I$ của đường tròn bằng $5$.]),
    True([Khoảng cách ngắn nhất từ gốc tọa độ $O$ đến một điểm $M$ trên đường tròn bằng $3$.]),
    [Khoảng cách lớn nhất từ gốc tọa độ $O$ đến một điểm $M$ trên đường tròn bằng $8$.]
  ),
  loigiai: [
    #step([Tâm và bán kính])
    $(x - 3)^2 + (y - 4)^2 = 4$ có tâm $I(3; 4)$ và bán kính $R = 2$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách OI])
    $O I = sqrt(3^2 + 4^2) = 5$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách ngắn nhất])
    $d_text("min") = O I - R = 5 - 2 = 3$. Mệnh đề c ĐÚNG.

    #step([Khoảng cách lớn nhất])
    $d_text("max") = O I + R = 5 + 2 = 7$ (chứ không phải bằng $8$).
    Khẳng định khoảng cách lớn nhất bằng $8$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Dây cung ngắn nhất và dài nhất qua điểm trong đường tròn)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho đường tròn $(C): x^2 + y^2 = 25$ và điểm $A(1; 2)$ nằm trong đường tròn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điểm $A(1; 2)$ nằm trong đường tròn $(C)$.]),
    True([Dây cung dài nhất của đường tròn $(C)$ đi qua điểm $A$ có độ dài bằng $10$.]),
    True([Dây cung ngắn nhất của $(C)$ đi qua điểm $A$ vuông góc với đoạn $O A$ và có phương trình là $x + 2y - 5 = 0$.]),
    [Độ dài của dây cung ngắn nhất đi qua điểm $A$ bằng $5$.]
  ),
  loigiai: [
    #step([Vị trí điểm A])
    $O A = sqrt(1^2 + 2^2) = sqrt(5) < R = 5$, điểm $A$ nằm trong đường tròn. Mệnh đề a ĐÚNG.

    #step([Dây cung dài nhất])
    Dây cung dài nhất đi qua $A$ là đường kính qua $A$, độ dài bằng $2R = 2(5) = 10$. Mệnh đề b ĐÚNG.

    #step([Dây cung ngắn nhất])
    Dây cung ngắn nhất qua $A$ vuông góc với $O A$.
    Phương trình tiếp tuyến/dây cung:
    $ 1(x - 1) + 2(y - 2) = 0 <=> x + 2y - 5 = 0 $. Mệnh đề c ĐÚNG.

    #step([Độ dài dây cung ngắn nhất])
    $L_text("min") = 2 sqrt(R^2 - O A^2) = 2 sqrt(25 - 5) = 2 sqrt(20) = 4 sqrt(5)$ (chứ không phải bằng $5$).
    Khẳng định độ dài bằng $5$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Radar kiểm soát không lưu)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Một trạm radar kiểm soát không lưu tại sân bay được đặt tại gốc tọa độ $O(0; 0)$ có bán kính quét $R = 100 text(" km")$.
Một máy bay thương mại bay theo đường bay thẳng $d: 3x + 4y - 300 = 0$ (đơn vị: kilômét).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách ngắn nhất từ trạm radar $O$ đến đường bay của máy bay bằng $60 text(" km")$.]),
    True([Máy bay đi vào vùng phủ sóng của radar và bay qua vùng này theo một dây cung của đường tròn.]),
    True([Chiều dài quãng đường bay mà máy bay nằm trong vùng phát hiện của radar là $160 text(" km")$.]),
    [Nếu máy bay bay với vận tốc đều $800 text(" km/h")$ thì thời gian nó nằm trong tầm quét của radar là $15 text(" phút")$.]
  ),
  loigiai: [
    #step([Khoảng cách ngắn nhất])
    $h = d(O, d) = (|-300|) / sqrt(3^2 + 4^2) = 300 / 5 = 60 text(" km")$. Mệnh đề a ĐÚNG.

    #step([Cắt vùng phủ sóng])
    Vì $h = 60 < R = 100$ nên đường bay cắt đường tròn tại hai điểm phân biệt, tạo thành dây cung. Mệnh đề b ĐÚNG.

    #step([Độ dài quãng đường bay])
    $L = 2 sqrt(100^2 - 60^2) = 2 sqrt(6400) = 2(80) = 160 text(" km")$. Mệnh đề c ĐÚNG.

    #step([Thời gian bay])
    $t = L / v = 160 / 800 = 0.2 text(" giờ") = 0.2 times 60 text(" phút") = 12 text(" phút")$ (chứ không phải $15 text(" phút")$).
    Khẳng định thời gian bằng $15 text(" phút")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m và điều kiện tiếp xúc)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho hai đường tròn $(C_1): x^2 + y^2 = 9$ và $(C_m): (x - 4)^2 + (y - m)^2 = 16$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường tròn $(C_1)$ có tâm là $O(0; 0)$ và bán kính $R_1 = 3$.]),
    True([Đường tròn $(C_m)$ có tâm là $I(4; m)$ và bán kính $R_2 = 4$.]),
    True([Khoảng cách giữa hai tâm là $O I = sqrt(16 + m^2)$.]),
    [Hai đường tròn $(C_1)$ và $(C_m)$ tiếp xúc ngoài với nhau khi và chỉ khi $m = 0$.]
  ),
  loigiai: [
    #step([Tâm và bán kính])
    - $(C_1)$ có tâm $O(0; 0)$, bán kính $R_1 = 3$. Mệnh đề a ĐÚNG.
    - $(C_m)$ có tâm $I(4; m)$, bán kính $R_2 = 4$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách hai tâm])
    $O I = sqrt((4 - 0)^2 + (m - 0)^2) = sqrt(16 + m^2)$. Mệnh đề c ĐÚNG.

    #step([Điều kiện tiếp xúc ngoài])
    Hai đường tròn tiếp xúc ngoài khi:
    $ O I = R_1 + R_2 <=> sqrt(16 + m^2) = 3 + 4 = 7 <=> 16 + m^2 = 49 <=> m^2 = 33 <=> m = plus.minus sqrt(33) $
    Giá trị đúng là $m = plus.minus sqrt(33)$ (chứ không phải $m = 0$).
    Khẳng định khi và chỉ khi $m = 0$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Khoảng cách lớn nhất)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho đường tròn $(C): (x - 3)^2 + (y - 4)^2 = 4$. Khoảng cách lớn nhất từ gốc tọa độ $O(0; 0)$ đến một điểm trên đường tròn $(C)$ bằng bao nhiêu?],
    [7],
    loigiai: [
        #step([Tính khoảng cách từ O đến tâm])
        $ O I = sqrt(3^2 + 4^2) = 5 $
        
        #step([Tính khoảng cách lớn nhất])
        $ d_text("max") = O I + R = 5 + 2 = 7 $
    ]
)

// TLN 2 (Quãng đường bay trong radar)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Trong bài toán radar kiểm soát không lưu, chiều dài quãng đường bay của máy bay nằm trong tầm quét của radar bằng bao nhiêu kilômét?],
    [160],
    loigiai: [
        #step([Tính khoảng cách từ trạm đến đường bay])
        $ h = (|-300|) / sqrt(3^2 + 4^2) = 300 / 5 = 60 text(" km") $
        
        #step([Tính độ dài quãng đường])
        $ L = 2 sqrt(R^2 - h^2) = 2 sqrt(100^2 - 60^2) = 2(80) = 160 text(" km") $
    ]
)

// TLN 3 (Chiều cao tĩnh không xe tải)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Trong bài toán hầm vòm xe tải nửa đường tròn bán kính $R = 5 text(" m")$, chiều cao tĩnh không tối đa của xe tải hai làn rộng $6 text(" m")$ bằng bao nhiêu mét?],
    [4],
    loigiai: [
        #step([Xác định tọa độ mép xe tải])
        $x = 6 / 2 = 3 text(" m")$.
        
        #step([Tính chiều cao tĩnh không])
        $ y = sqrt(R^2 - x^2) = sqrt(5^2 - 3^2) = sqrt(16) = 4 text(" m") $
    ]
)

// TLN 4 (Thời gian bay tính bằng phút)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Trong bài toán máy bay bay qua vùng radar với vận tốc $800 text(" km/h")$, thời gian máy bay nằm trong tầm quét của radar bằng bao nhiêu phút?],
    [12],
    loigiai: [
        #step([Tính thời gian bay theo giờ])
        $ t = 160 / 800 = 0.2 text(" giờ") $
        
        #step([Đổi ra phút])
        $ 0.2 times 60 = 12 text(" phút") $
    ]
)

// TLN 5 (Bán kính đường tròn nội tiếp)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Cho tam giác vuông có độ dài hai cạnh góc vuông là $3$ và $4$. Bán kính của đường tròn nội tiếp tam giác đó bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Tính cạnh huyền])
        $ c = sqrt(3^2 + 4^2) = 5 $
        
        #step([Tính bán kính nội tiếp])
        $ r = (a + b - c) / 2 = (3 + 4 - 5) / 2 = 1 $
    ]
)

// TLN 6 (Tham số m dương)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 163], back-to: "sec-exercise-hub",[Tìm giá trị dương của tham số $m$ để khoảng cách từ tâm của đường tròn $(C): (x - 1)^2 + y^2 = 50$ đến đường thẳng $3x - 4y + m = 0$ bằng $5$.],
    [22],
    loigiai: [
        #step([Thiết lập phương trình khoảng cách])
        Tâm $I(1; 0)$, khoảng cách:
        $ d(I, d) = (|3(1) - 4(0) + m|) / 5 = (|m + 3|) / 5 = 5 <=> |m + 3| = 25 $
        Vì $m > 0$ nên $m + 3 = 25 <=> m = 22$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 21: ĐƯỜNG TRÒN TRONG MẶT PHẲNG TỌA ĐỘ (ĐỀ SỐ 23C - NÂNG CAO & VDC)!]      #v(0.6em)
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
