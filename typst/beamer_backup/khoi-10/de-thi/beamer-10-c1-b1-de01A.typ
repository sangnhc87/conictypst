// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 1: MỆNH ĐỀ TOÁN HỌC (ĐỀ SỐ 1)
// Lớp: Khối 10  ·  Mã đề: 101  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 1: MỆNH ĐỀ TOÁN HỌC (ĐỀ SỐ 1)",
  subtitle: "ÔN TẬP CHƯƠNG 1 — MÃ ĐỀ: 101",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 101]],
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
#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  count: 12,
)

// TN 1
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Trong các câu sau, câu nào không phải là mệnh đề toán học?],
    (
        [$pi$ là một số vô tỉ.],
        [Số 2 là số nguyên tố chẵn duy nhất.],
        True([Các em hãy cố gắng học tập thật tốt nhé!]),
        [Phương trình $x^2 + 1 = 0$ có nghiệm thực.]
    ),
    loigiai: [
        Câu "Các em hãy cố gắng học tập thật tốt nhé!" là câu cầu khiến, không có tính đúng sai, nên không phải là mệnh đề.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Phủ định của mệnh đề "Mọi số nguyên đều là số hữu tỉ" là mệnh đề nào sau đây?],
    (
        [Mọi số nguyên đều không phải là số hữu tỉ.],
        True([Tồn tại một số nguyên không phải là số hữu tỉ.]),
        [Tồn tại một số hữu tỉ không phải là số nguyên.],
        [Có ít nhất một số nguyên là số vô tỉ.]
    ),
    loigiai: [
        Mệnh đề ban đầu: "$forall x in ZZ, x in QQ$". 
        Phủ định của mệnh đề này là "$exists x in ZZ, x notin QQ$" (Tồn tại một số nguyên không phải là số hữu tỉ).
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho hai mệnh đề $P$: "Số tự nhiên $a$ chia hết cho 3" và $Q$: "Số tự nhiên $a$ chia hết cho 9". Phát biểu mệnh đề $P => Q$ và xét tính đúng sai của nó.],
    (
        [Nếu số $a$ chia hết cho 9 thì số $a$ chia hết cho 3. (Đúng)],
        True([Nếu số $a$ chia hết cho 3 thì số $a$ chia hết cho 9. (Sai)]),
        [Nếu số $a$ chia hết cho 3 thì số $a$ chia hết cho 9. (Đúng)],
        [Số $a$ chia hết cho 3 khi và chỉ khi số $a$ chia hết cho 9. (Sai)]
    ),
    loigiai: [
        Mệnh đề $P => Q$: "Nếu số $a$ chia hết cho 3 thì số $a$ chia hết cho 9".
        Đây là một mệnh đề sai. Phản ví dụ: $a = 6$ chia hết cho 3 nhưng không chia hết cho 9.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho mệnh đề chứa biến $P(x)$: "$x^2 - 3 x + 2 = 0$". Mệnh đề nào sau đây đúng?],
    (
        [$forall x in RR, P(x)$],
        [$exists x in RR, x^2 - 3 x + 2 < 0$],
        True([$exists x in RR, P(x)$]),
        [$forall x in NN, P(x)$]
    ),
    loigiai: [
        Phương trình $x^2 - 3 x + 2 = 0 <=> hoac(x = 1, x = 2)$.
        Do đó tồn tại số thực $x$ (ví dụ $x=1$) để mệnh đề đúng, tức là $exists x in RR, P(x)$ là mệnh đề đúng.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Xét định lý: "Nếu hai tam giác bằng nhau thì diện tích của chúng bằng nhau". Phát biểu nào sau đây là đúng?],
    (
        [Hai tam giác bằng nhau là điều kiện cần để diện tích của chúng bằng nhau.],
        True([Hai tam giác bằng nhau là điều kiện đủ để diện tích của chúng bằng nhau.]),
        [Diện tích của hai tam giác bằng nhau là điều kiện đủ để chúng bằng nhau.],
        [Hai tam giác bằng nhau là điều kiện cần và đủ để diện tích của chúng bằng nhau.]
    ),
    loigiai: [
        Cấu trúc định lý $P => Q$. Khi đó $P$ là điều kiện đủ để có $Q$; và $Q$ là điều kiện cần để có $P$.
        Do đó, "Hai tam giác bằng nhau" là điều kiện đủ để "diện tích của chúng bằng nhau".
        
        #align(center)[
            #cetz.canvas({
                import cetz.draw: *
                // Tam giác 1
                line((0,0), (2,0), (1,1.5), close: true, fill: blue.lighten(80%), stroke: blue)
                content((1, -0.4), [$Delta_1$])
                // Tam giác 2
                line((4,0), (6,0), (5,1.5), close: true, fill: blue.lighten(80%), stroke: blue)
                content((5, -0.4), [$Delta_2$])
                
                content((3, 0.75), [$=>$])
                content((3, 1.2), [$S_1 = S_2$])
            })
        ]
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Khẳng định nào sau đây là *sai* khi nói về mệnh đề tương đương $P <=> Q$?],
    (
        [Mệnh đề $P <=> Q$ đúng khi cả $P$ và $Q$ cùng đúng hoặc cùng sai.],
        [$P$ là điều kiện cần và đủ để có $Q$.],
        [Mệnh đề $P <=> Q$ sai khi $P$ và $Q$ có tính đúng sai ngược nhau.],
        True([Mệnh đề $P <=> Q$ đúng khi $P$ đúng và $Q$ sai.])
    ),
    loigiai: [
        Mệnh đề tương đương $P <=> Q$ chỉ đúng khi $P$ và $Q$ cùng đúng hoặc cùng sai. Nếu $P$ đúng, $Q$ sai thì $P <=> Q$ là mệnh đề sai.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Biết mệnh đề kéo theo $P => Q$ là một mệnh đề sai. Khẳng định nào sau đây là đúng?],
    (
        True([$P$ đúng, $Q$ sai.]),
        [$P$ sai, $Q$ đúng.],
        [$P$ đúng, $Q$ đúng.],
        [$P$ sai, $Q$ sai.]
    ),
    loigiai: [
        Theo bảng chân trị, mệnh đề $P => Q$ chỉ sai trong duy nhất một trường hợp: giả thiết $P$ đúng nhưng kết luận $Q$ sai.
    ]
)

// TN 8 (Kích thích tư duy)
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Trong một vương quốc có hai loại người: hiệp sĩ luôn nói thật và kẻ gian luôn nói dối. Bạn gặp hai người dân A và B. A nói: "Ít nhất một trong hai chúng tôi là kẻ gian". Khẳng định nào sau đây là đúng?],
    (
        [A là kẻ gian và B là hiệp sĩ.],
        True([A là hiệp sĩ và B là kẻ gian.]),
        [Cả hai đều là hiệp sĩ.],
        [Cả hai đều là kẻ gian.]
    ),
    loigiai: [
        Ta lập bảng chân trị để phân tích logic:
        #align(center)[
            #table(
                columns: (auto, auto, auto),
                align: center,
                stroke: 0.5pt + luma(200),
                fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
                [*Giả sử A là*], [*Lời nói "ít nhất 1 kẻ gian"*], [*Kết luận*],
                [Kẻ gian (luôn dối)], [Trở thành sự thật (vì A là kẻ gian)], [Mâu thuẫn (kẻ gian ko nói thật)],
                [Hiệp sĩ (luôn thật)], [Là sự thật (cần 1 kẻ gian)], [Hợp lý. Bắt buộc B là kẻ gian.],
            )
        ]
        Vậy A là hiệp sĩ, B là kẻ gian.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Phủ định của mệnh đề "$forall x in RR, x^2 - x + 1 > 0$" là mệnh đề nào sau đây?],
    (
        [$forall x in RR, x^2 - x + 1 <= 0$],
        [$exists x in RR, x^2 - x + 1 < 0$],
        [$exists x in RR, x^2 - x + 1 = 0$],
        True([$exists x in RR, x^2 - x + 1 <= 0$])
    ),
    loigiai: [
        Phủ định của $forall$ là $exists$. 
        Phủ định của $>$ là $<=$.
        Vậy mệnh đề phủ định là "$exists x in RR, x^2 - x + 1 <= 0$".
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Trong các mệnh đề chứa biến sau đây, mệnh đề nào là mệnh đề *đúng*?],
    (
        [$forall x in RR, x^2 > 0$],
        [$exists x in RR, x^2 + 1 = 0$],
        True([$exists x in QQ, 2 x - 1 = 0$]),
        [$forall x in ZZ, x > 0$]
    ),
    loigiai: [
        - $forall x in RR, x^2 > 0$ là mệnh đề sai (vì $x = 0$ thì $0^2 = 0$).
        - $exists x in RR, x^2 + 1 = 0$ là mệnh đề sai (vì $x^2 + 1 >= 1 > 0$).
        - $exists x in QQ, 2 x - 1 = 0$ là mệnh đề đúng (vì có $x = 1/2 in QQ$ thỏa mãn).
        - $forall x in ZZ, x > 0$ là mệnh đề sai (vì có số nguyên âm và số 0).
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Có bao nhiêu số nguyên $n$ thỏa mãn $-5 <= n <= 5$ để mệnh đề chứa biến $P(n)$: "$n^2 - 4 < 0$" là một mệnh đề đúng?],
    (
        [2],
        True([3]),
        [4],
        [5]
    ),
    loigiai: [
        Ta có $n^2 - 4 < 0 <=> -2 < n < 2$.
        Vì $n in ZZ$ nên $n in {-1; 0; 1}$.
        Có 3 giá trị nguyên của $n$ thỏa mãn điều kiện $-5 <= n <= 5$ để mệnh đề là đúng.
    ]
)

// TN 12 (kích thích tư duy)
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho các mệnh đề $P, Q, R$. Biết mệnh đề kéo theo $P => (Q text(" hay ") R)$ là mệnh đề sai. Khẳng định nào sau đây là đúng?],
    (
        [Cả $P, Q, R$ đều sai.],
        True([$P$ đúng, $Q$ sai và $R$ sai.]),
        [$P$ sai, $Q$ đúng và $R$ sai.],
        [$P$ đúng, $Q$ đúng và $R$ đúng.]
    ),
    loigiai: [
        Mệnh đề $P => (Q text(" hay ") R)$ sai khi và chỉ khi $P$ đúng và $(Q text(" hay ") R)$ sai.
        Mệnh đề tuyển $(Q text(" hay ") R)$ sai khi và chỉ khi cả $Q$ và $R$ cùng sai.
        Vậy $P$ đúng, $Q$ sai và $R$ sai.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho mệnh đề $P$: "Mọi học sinh trong lớp 10A đều thích học môn Toán".],
  (
    [Mệnh đề phủ định của $P$ là: "Mọi học sinh trong lớp 10A đều không thích học môn Toán".],
    True([Mệnh đề phủ định của $P$ là: "Có ít nhất một học sinh lớp 10A không thích học môn Toán".]),
    [Nếu lớp 10A có 40 học sinh, và có 39 học sinh thích học môn Toán, thì mệnh đề $P$ vẫn đúng.],
    True([Mệnh đề $P$ có thể được biểu diễn dưới dạng ký hiệu là: "$forall x in 10A, x text(" thích học Toán") $".])
  ),
  loigiai: [
    a) Sai. Phủ định của "Mọi" là "Tồn tại" (Có ít nhất một).
    b) Đúng. 
    c) Sai. Mệnh đề "Mọi" yêu cầu tất cả 40 học sinh đều thích. Nếu có 1 học sinh không thích thì $P$ sai.
    d) Đúng. Ký hiệu $forall$ đại diện cho từ "Mọi".
  ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Xét mệnh đề chứa biến $P(x)$ và $Q(x)$ với $x in RR$. Cho định lý: "$forall x in RR, P(x) => Q(x)$".],
  (
    True([Nếu định lý đúng thì $P(x)$ là điều kiện đủ để có $Q(x)$.]),
    [Mệnh đề đảo của định lý là: "$forall x in RR, overline(P(x)) => overline(Q(x))$".],
    True([Phủ định của mệnh đề "$forall x in RR, P(x) => Q(x)$" là mệnh đề "$exists x in RR, P(x) text(" đúng và ") Q(x) text(" sai")$".]),
    True([Nếu định lý đúng và mệnh đề đảo của nó cũng đúng, ta có thể phát biểu "$P(x)$ khi và chỉ khi $Q(x)$".])
  ),
  loigiai: [
    a) Đúng. Trong mệnh đề kéo theo, giả thiết là điều kiện đủ.
    b) Sai. Mệnh đề đảo là "$forall x in RR, Q(x) => P(x)$".
    c) Đúng. Phủ định của $P => Q$ là $P$ đúng nhưng $Q$ sai.
    d) Đúng. Hai mệnh đề thuận và đảo cùng đúng tạo thành mệnh đề tương đương.
  ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Xét tính đúng sai của các mệnh đề sau trên tập số thực $RR$:],
  (
    True([$forall x in RR, x^2 + 1 > 0$.]),
    [$exists x in RR, x^2 + 2x + 2 <= 0$.],
    True([$forall x in RR, (x - 1)^2 >= 0$.]),
    [$exists x in QQ, x^2 = 2$.]
  ),
  loigiai: [
    a) Đúng. $x^2 >= 0 => x^2 + 1 >= 1 > 0, forall x in RR$.
    b) Sai. $x^2 + 2x + 2 = (x+1)^2 + 1 > 0, forall x in RR$.
    c) Đúng. Bình phương của một số thực luôn không âm.
    d) Sai. $x^2 = 2 <=> x = +-sqrt(2)$ là các số vô tỉ, không thuộc $QQ$.
  ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Một khóa số an toàn có mật mã là một số tự nhiên $n$ có một chữ số ($0 <= n <= 9$). Ba người thợ mỗi người đưa ra hai gợi ý về mật mã như sau:
- Người thứ nhất: "$n$ chia hết cho 5" và "$n$ là số chính phương".
- Người thứ hai: "$n$ là số chẵn" và "$n$ chia hết cho 3".
- Người thứ ba: "$n$ là số nguyên tố" và "$n > 4$".
Biết rằng trong hai gợi ý của mỗi người, luôn có đúng 1 mệnh đề ĐÚNG và 1 mệnh đề SAI. Khẳng định sau đây đúng hay sai?],
  (
    [Có ít nhất hai giá trị của $n$ thỏa mãn điều kiện bài toán.],
    True([Gợi ý "$n$ là số chính phương" của người thứ nhất là một mệnh đề đúng.]),
    [Mật mã của khóa số là một số chẵn.],
    True([Mật mã của khóa số là số 9.])
  ),
      loigiai: [
    Ta tóm tắt các gợi ý vào một bảng để phân tích:
    #align(center)[
        #table(
            columns: (auto, auto, auto),
            align: center,
            stroke: 0.5pt + luma(200),
            fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
            [*Người thợ*], [*Gợi ý 1*], [*Gợi ý 2*],
            [Thứ 1], [$n$ chia hết cho 5], [$n$ là số chính phương],
            [Thứ 2], [$n$ là số chẵn], [$n$ chia hết cho 3],
            [Thứ 3], [$n$ là số nguyên tố], [$n > 4$],
        )
    ]
    Mỗi dòng phải có đúng 1 mệnh đề Đúng (Đ) và 1 Sai (S).
    Khi thử với $n=9$: 
    - Người 1: "$9$ chia hết cho 5" (S), "$9$ là CP" (Đ) $=>$ Thỏa mãn.
    - Người 2: "$9$ chẵn" (S), "$9$ chia hết cho 3" (Đ) $=>$ Thỏa mãn.
    - Người 3: "$9$ là nguyên tố" (S), "$9 > 4$" (Đ) $=>$ Thỏa mãn.
    
    Vậy $n=9$ là giá trị thỏa mãn duy nhất.
    
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        rect((-0.6, -0.5), (0.6, 0.4), radius: 0.1, fill: rgb("FFD700"), stroke: 1.5pt)
        content((0, -0.05), text(size: 14pt, weight: "bold", fill: rgb("d32f2f"))[9])
        arc((0.4, 0.4), start: 0deg, stop: 180deg, radius: 0.4, stroke: 1.5pt)
        line((-0.4, 0.4), (-0.4, 0.2), stroke: 1.5pt)
        line((0.4, 0.4), (0.4, 0.2), stroke: 1.5pt)
      })
    ]
    a) Sai. Chỉ có duy nhất một giá trị $n=9$.
    b) Đúng. $9$ là số chính phương.
    c) Sai. $n=9$ là số lẻ.
    d) Đúng.
  ]
)

#exam-part(
    [
      #set text(fill: rgb("d32f2f"))
      PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho các câu sau đây:
(1) Số 15 là số nguyên tố.
(2) Tứ giác có 4 cạnh bằng nhau là hình vuông.
(3) Phương trình $x^2 + 1 = 0$ vô nghiệm trên tập số thực.
(4) Số 2024 chia hết cho 4.
Trong các câu trên, có bao nhiêu câu là mệnh đề ĐÚNG?],
    [2],
    loigiai: [
        #step([Kiểm tra tính đúng sai của từng câu])
        - (1) là mệnh đề SAI (vì 15 chia hết cho 3 và 5, là hợp số).
        - (2) là mệnh đề SAI (tứ giác có 4 cạnh bằng nhau là hình thoi, chưa chắc là hình vuông).
        - (3) là mệnh đề ĐÚNG (vì $x^2 >= 0 => x^2 + 1 >= 1 > 0$ nên phương trình vô nghiệm).
        - (4) là mệnh đề ĐÚNG (vì hai chữ số tận cùng là 24 chia hết cho 4).
        
        #step([Kết luận số lượng mệnh đề đúng])
        Có 2 mệnh đề đúng là (3) và (4).
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho mệnh đề chứa biến $P(n)$: "$n^2 - n + 11$ là số nguyên tố", với $n$ là số tự nhiên. Tìm giá trị nguyên dương nhỏ nhất của $n$ để $P(n)$ là một mệnh đề SAI.],
    [11],
    loigiai: [
        #step([Thử các giá trị của $n$ nguyên dương nhỏ])
        - Với $n=1: 1^2 - 1 + 11 = 11$ (là số nguyên tố) $=>$ $P(1)$ ĐÚNG.
        - Với $n=2: 2^2 - 2 + 11 = 13$ (là số nguyên tố) $=>$ $P(2)$ ĐÚNG.
        - Với $n=3: 3^2 - 3 + 11 = 17$ (là số nguyên tố) $=>$ $P(3)$ ĐÚNG.

        #step([Dự đoán quy luật để tìm $n$ sao cho biểu thức là hợp số])
        Để biểu thức $n^2 - n + 11$ chắc chắn chia hết cho 11 (và lớn hơn 11, tức là hợp số), ta có thể chọn $n$ sao cho các số hạng đều chia hết cho 11.
        Nếu chọn $n = 11$, ta có:
        $11^2 - 11 + 11 = 11^2 = 121$.
        Số 121 chia hết cho 11 và $121 > 11$ nên 121 là hợp số.
        
        #step([Kết luận])
        Các giá trị $n < 11$ đều cho kết quả là số nguyên tố. 
        Vậy giá trị nguyên dương nhỏ nhất làm cho mệnh đề sai là $n = 11$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Trong các mệnh đề dưới đây, có bao nhiêu mệnh đề là mệnh đề kéo theo ĐÚNG?
(1) Nếu $x = 2$ thì $x^2 = 4$.
(2) Nếu $x^2 = 4$ thì $x = 2$.
(3) Nếu tứ giác ABCD là hình chữ nhật thì hai đường chéo bằng nhau.
(4) Nếu số tự nhiên $n$ chia hết cho 3 thì $n$ chia hết cho 9.],
    [2],
    loigiai: [
        #step([Phân tích tính đúng sai của từng mệnh đề kéo theo])
        - Mệnh đề (1): ĐÚNG (Bình phương hai vế của phương trình $x=2$ ta được $x^2=4$).
        - Mệnh đề (2): SAI (Vì $x^2=4$ thì $x$ có thể bằng $-2$, không bắt buộc phải bằng 2).
        - Mệnh đề (3): ĐÚNG (Tính chất cơ bản của hình chữ nhật là hai đường chéo bằng nhau).
          #align(center)[
            #cetz.canvas({
                import cetz.draw: *
                rect((0,0), (3, 1.5), stroke: black)
                line((0,0), (3, 1.5), stroke: (paint: red, dash: "dashed"))
                line((0,1.5), (3, 0), stroke: (paint: blue, dash: "dashed"))
                content((1.5, -0.4), [*Hai đường chéo bằng nhau*])
            })
          ]
        - Mệnh đề (4): SAI (Phản ví dụ: $n=6$ chia hết cho 3 nhưng không chia hết cho 9).

        #step([Đếm số mệnh đề đúng])
        Chỉ có mệnh đề (1) và (3) là mệnh đề kéo theo đúng. Vậy có 2 mệnh đề đúng.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Tìm giá trị thực của tham số $m$ để mệnh đề " $exists x in RR, (m - 1) x + 2 = 0$ " là một mệnh đề SAI.],
    [1],
    loigiai: [
        #step([Phân tích điều kiện để mệnh đề tồn tại sai])
        Mệnh đề " $exists x in RR, (m - 1) x + 2 = 0$ " sai khi và chỉ khi phương trình $(m - 1) x + 2 = 0$ VÔ NGHIỆM trên tập số thực $RR$.
        
        #step([Tìm điều kiện để phương trình vô nghiệm])
        Phương trình được viết lại thành: $(m - 1) x = -2$.
        Phương trình này vô nghiệm khi hệ số của $x$ bằng 0 và hằng số khác 0.
        Tức là: $m - 1 = 0 <=> m = 1$.
        (Lưu ý: Nếu $m != 1$, phương trình luôn có nghiệm duy nhất $x = -2/(m-1)$, khi đó mệnh đề sẽ đúng).

        #step([Kết luận])
        Vậy $m = 1$ là giá trị cần tìm.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Cho hai mệnh đề $P$ và $Q$. Biết rằng mệnh đề kéo theo $P => Q$ là mệnh đề SAI. 
Trong 4 mệnh đề sau đây, có bao nhiêu mệnh đề là mệnh đề ĐÚNG?
(1) $overline(P) => Q$
(2) $P => overline(Q)$
(3) $overline(Q) => overline(P)$
(4) $Q => P$],
    [3],
    loigiai: [
        #step([Xác định tính đúng sai của $P$ và $Q$])
        Mệnh đề kéo theo $P => Q$ chỉ sai trong duy nhất một trường hợp: giả thiết $P$ ĐÚNG và kết luận $Q$ SAI.
        Vậy ta có: $P = True$, $Q = False$.
        Suy ra: $overline(P) = False$, $overline(Q) = True$.

        #step([Xét tính đúng sai của từng mệnh đề])
        - Mệnh đề (1) $overline(P) => Q$: $False => False$ là mệnh đề ĐÚNG.
        - Mệnh đề (2) $P => overline(Q)$: $True => True$ là mệnh đề ĐÚNG.
        - Mệnh đề (3) $overline(Q) => overline(P)$: $True => False$ là mệnh đề SAI.
        - Mệnh đề (4) $Q => P$: $False => True$ là mệnh đề ĐÚNG.

        #step([Đếm số lượng mệnh đề đúng])
        Có 3 mệnh đề đúng là (1), (2) và (4).
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 101], back-to: "sec-exercise-hub",[Trong một kì thi, 3 bạn An, Bình, Cường đạt 3 mức điểm khác nhau và đều là số nguyên dương nhỏ hơn 10.
- An nói: "Điểm của tôi là một số chẵn và là số nguyên tố".
- Bình nói: "Điểm của tôi là bội của 3 và điểm của An lớn hơn điểm của tôi".
- Cường nói: "Điểm của Bình là 3 và điểm của tôi gấp đôi điểm của Bình".
Biết rằng trong ba phát biểu trên, chỉ có đúng 1 bạn nói SAI (mệnh đề sai). 
Tính tổng số điểm của 3 bạn An, Bình, Cường.],
    [11],
    loigiai: [
        #step([Giả sử mệnh đề của An là đúng])
        Nếu An nói thật, điểm của An là số chẵn và nguyên tố $=>$ Điểm của An là 2.
        
        #step([Kiểm tra mệnh đề của Bình])
        Nếu Bình nói thật, điểm của Bình là bội của 3 ($3, 6, 9$) và phải NHỎ HƠN điểm của An (nhỏ hơn 2). 
        Điều này vô lý vì không có số nguyên dương nào là bội của 3 mà lại nhỏ hơn 2.
        Do đó, mệnh đề của Bình BẮT BUỘC PHẢI SAI.

        #step([Suy luận điểm của Cường và tính tổng])
        Vì chỉ có 1 bạn nói sai (là Bình), nên Cường phải nói ĐÚNG.
        Từ lời nói của Cường, ta có: Điểm của Bình là 3. Điểm của Cường gấp đôi điểm Bình nên Cường là 6.
        Bảng tổng kết điểm số:
        #align(center)[
            #table(
                columns: (auto, auto, auto),
                align: center,
                stroke: 0.5pt + luma(200),
                fill: (_, row) => if row == 0 { accent.lighten(80%) } else { none },
                [*Học sinh*], [*Số điểm*], [*Tính chất*],
                [An], [2], [Chẵn, Nguyên tố],
                [Bình], [3], [Bội của 3],
                [Cường], [6], [Gấp đôi Bình],
            )
        ]
        
        Các điểm số đều khác nhau và $< 10$, hoàn toàn hợp lý.
        Tổng số điểm của ba bạn là $2 + 3 + 6 = 11$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 1: MỆNH ĐỀ TOÁN HỌC (ĐỀ SỐ 1)!]      #v(0.6em)
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
