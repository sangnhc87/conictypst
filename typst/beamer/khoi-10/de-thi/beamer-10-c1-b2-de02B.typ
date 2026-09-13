// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 2 & 3: TẬP HỢP VÀ CÁC PHÉP TOÁN (ĐỀ SỐ 2)
// Lớp: Khối 10  ·  Mã đề: 102  ·  GV: Nguyễn Văn Sang
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

#let gach_cheo(x1, x2, y: 0, h: 0.15) = {
  import cetz.draw: *
  let step = 0.15
  let n = std.int((x2 - x1) / step)
  for i in std.range(n + 1) {
    let px = x1 + i * step
    line((px, y + h), (px - h, y - h), stroke: 0.5pt + rgb("555"))
  }
}

#let venn2(
  title: "Khảo sát",
  name-a: "TẬP A",
  name-b: "TẬP B",
  only-a: "0",
  both: "0",
  only-b: "0",
  outside: none,
  color-a: rgb("0284c7"),
  fill-a: rgb(56, 189, 248, 30%),
  color-b: rgb("e11d48"),
  fill-b: rgb(251, 113, 133, 30%),
  width: 9.2cm,
  height: 5.6cm,
) = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 8pt,
    fill: rgb("f8fafc"),
    inset: 10pt,
    width: width,
    height: height,
    {
      place(top + left, rect(
        fill: rgb("e2e8f0"),
        radius: 4pt,
        inset: (x: 6pt, y: 3pt),
        text(size: 8.5pt, weight: "bold", fill: rgb("475569"))[#title]
      ))
      
      place(center + horizon, dx: -1.3cm, dy: 0.35cm, std.circle(radius: 1.45cm, fill: fill-a, stroke: 1.5pt + color-a))
      place(center + horizon, dx: 1.3cm, dy: 0.35cm, std.circle(radius: 1.45cm, fill: fill-b, stroke: 1.5pt + color-b))
      
      place(center + horizon, dx: -1.8cm, dy: -1.6cm, text(size: 10pt, weight: "bold", fill: color-a)[#name-a])
      place(center + horizon, dx: 1.8cm, dy: -1.6cm, text(size: 10pt, weight: "bold", fill: color-b)[#name-b])
      
      place(center + horizon, dx: -1.45cm, dy: 0.35cm, text(size: 13pt, weight: "bold", fill: color-a.darken(25%))[#only-a])
      place(center + horizon, dx: 0cm, dy: 0.35cm, text(size: 13pt, weight: "bold", fill: rgb("581c87"))[#both])
      place(center + horizon, dx: 1.45cm, dy: 0.35cm, text(size: 13pt, weight: "bold", fill: color-b.darken(25%))[#only-b])
      
      if outside != none [
        #place(bottom + right, rect(
          fill: rgb("f1f5f9"),
          stroke: 0.5pt + rgb("cbd5e1"),
          radius: 4pt,
          inset: (x: 5pt, y: 2.5pt),
          text(size: 8.5pt, weight: "bold", fill: rgb("64748b"))[Bên ngoài: #outside]
        ))
      ]
    }
  )
]

#let venn3(
  title: "Khảo sát 3 tập hợp",
  name-a: "Tập A",
  name-b: "Tập B",
  name-c: "Tập C",
  a-only: "0",
  b-only: "0",
  c-only: "0",
  ab-only: "0",
  bc-only: "0",
  ca-only: "0",
  abc: "0",
  outside: none,
  width: 9.6cm,
  height: 7.4cm,
) = align(center)[
  #box(
    stroke: 0.8pt + rgb("cbd5e1"),
    radius: 8pt,
    fill: rgb("f8fafc"),
    inset: 10pt,
    width: width,
    height: height,
    {
      place(top + left, rect(
        fill: rgb("e2e8f0"),
        radius: 4pt,
        inset: (x: 6pt, y: 3pt),
        text(size: 8.5pt, weight: "bold", fill: rgb("475569"))[#title]
      ))
      
      let ca = rgb("0284c7")
      let fa = rgb(56, 189, 248, 28%)
      let cb = rgb("e11d48")
      let fb = rgb(251, 113, 133, 28%)
      let cc = rgb("16a34a")
      let fc = rgb(74, 222, 128, 28%)
      
      place(center + horizon, dx: -1.15cm, dy: -0.65cm, std.circle(radius: 1.45cm, fill: fa, stroke: 1.4pt + ca))
      place(center + horizon, dx: 1.15cm, dy: -0.65cm, std.circle(radius: 1.45cm, fill: fb, stroke: 1.4pt + cb))
      place(center + horizon, dx: 0cm, dy: 1.05cm, std.circle(radius: 1.45cm, fill: fc, stroke: 1.4pt + cc))
      
      place(center + horizon, dx: -2.3cm, dy: -2.3cm, text(size: 10pt, weight: "bold", fill: ca)[#name-a])
      place(center + horizon, dx: 2.3cm, dy: -2.3cm, text(size: 10pt, weight: "bold", fill: cb)[#name-b])
      place(center + horizon, dx: 0cm, dy: 2.85cm, text(size: 10pt, weight: "bold", fill: cc)[#name-c])
      
      place(center + horizon, dx: -1.35cm, dy: -0.95cm, text(size: 11.5pt, weight: "bold", fill: ca.darken(25%))[#a-only])
      place(center + horizon, dx: 1.35cm, dy: -0.95cm, text(size: 11.5pt, weight: "bold", fill: cb.darken(25%))[#b-only])
      place(center + horizon, dx: 0cm, dy: 1.45cm, text(size: 11.5pt, weight: "bold", fill: cc.darken(25%))[#c-only])
      
      place(center + horizon, dx: 0cm, dy: -1.05cm, text(size: 10.5pt, weight: "bold", fill: rgb("7c3aed"))[#ab-only])
      place(center + horizon, dx: 0.85cm, dy: 0.35cm, text(size: 10.5pt, weight: "bold", fill: rgb("c2410c"))[#bc-only])
      place(center + horizon, dx: -0.85cm, dy: 0.35cm, text(size: 10.5pt, weight: "bold", fill: rgb("0f766e"))[#ca-only])
      
      place(center + horizon, dx: 0cm, dy: 0.05cm, text(size: 12pt, weight: "bold", fill: rgb("1e1b4b"))[#abc])
      
      if outside != none [
        #place(bottom + right, rect(
          fill: rgb("f1f5f9"),
          stroke: 0.5pt + rgb("cbd5e1"),
          radius: 4pt,
          inset: (x: 5pt, y: 2.5pt),
          text(size: 8.5pt, weight: "bold", fill: rgb("64748b"))[Bên ngoài: #outside]
        ))
      ]
    }
  )
]

#show: lecture-theme.with(
  title: "BÀI 2 & 3: TẬP HỢP VÀ CÁC PHÉP TOÁN (ĐỀ SỐ 2)",
  subtitle: "ÔN TẬP CHƯƠNG 1 — MÃ ĐỀ: 102",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 102]],
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
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho tập hợp $B = {x in NN | x <= 4}$. Cách viết nào sau đây dưới dạng liệt kê các phần tử là đúng?],
    (
        [${1; 2; 3; 4}$],
        True([${0; 1; 2; 3; 4}$]),
        [${0; 1; 2; 3}$],
        [${-1; 0; 1; 2; 3; 4}$]
    ),
    loigiai: [
        Vì $x in NN$ nên $x$ nhận các giá trị tự nhiên bắt đầu từ $0$. 
        Với $x <= 4$, ta có $x in {0; 1; 2; 3; 4}$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Ký hiệu nào sau đây thể hiện tập hợp các số thực lớn hơn $-1$ và nhỏ hơn hoặc bằng $5$?],
    (
        True([$(-1; 5]$]),
        [$[-1; 5]$],
        [$( -1; 5 )$],
        [$[-1; 5)$]
    ),
    loigiai: [
        Tập hợp các số thực $x$ thỏa mãn $-1 < x <= 5$ được ký hiệu là nửa khoảng $(-1; 5]$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Trong các tập hợp sau, tập hợp nào KHÔNG PHẢI là tập rỗng?],
    (
        [${x in ZZ | x^2 = 2}$],
        [${x in QQ | 3x - 1 = 0 text(" và ") x in ZZ}$],
        [${x in RR | x^2 + x + 1 = 0}$],
        True([${x in RR | x^2 - 4x + 4 = 0}$])
    ),
    loigiai: [
        - $x^2 = 2 <=> x = +-sqrt(2) notin ZZ$ nên tập này là tập rỗng.
        - $3x - 1 = 0 <=> x = 1/3 notin ZZ$ nên tập này rỗng.
        - $x^2 + x + 1 = 0$ vô nghiệm thực ($Delta < 0$) nên tập này rỗng.
        - $x^2 - 4x + 4 = 0 <=> (x-2)^2 = 0 <=> x = 2 in RR$. Tập này có một phần tử là $2$, không phải tập rỗng.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho hai tập hợp $E = {2; 4; 6}$ và $F = {1; 2; 3; 4; 5; 6}$. Khẳng định nào sau đây là ĐÚNG?],
    (
        [$F subset E$],
        [$E cup F = E$],
        True([$E cap F = E$]),
        [$E setminus F = {1; 3; 5}$]
    ),
    loigiai: [
        - Mọi phần tử của $E$ đều nằm trong $F$ nên $E subset F$.
        - Khi $E subset F$ thì giao của chúng là tập nhỏ hơn: $E cap F = E$. Khẳng định c) đúng.
        - $E cup F = F$.
        - $E setminus F = emptyset$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Hình vẽ sau đây (phần không bị gạch chéo) biểu diễn tập hợp nào trên trục số?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-1, 0), (7, 0), mark: (end: ">"))
    content((7.2, -0.3), [$x$])
    // Vạch số
    content((2, -0.4), [$1$])
    content((6, -0.4), [$5$])
    // Gạch chéo
    gach_cheo(-1, 2)
    gach_cheo(6, 6.8)
    // Ngoặc
    content((2, 0), text(size: 14pt)[$($])
    content((6, 0), text(size: 14pt)[$)$])
  })
]
],
    (
        [$( 1 ; 5 ]$],
        [$[ 1 ; 5 ]$],
        [$[ 1 ; 5 )$],
        True([$( 1 ; 5 )$])
    ),
    loigiai: [
        Phần tô đậm nằm giữa số $1$ và $5$. Cả hai đầu mút đều dùng ngoặc tròn "$($" và "$)$" biểu thị không lấy dấu bằng.
        Vậy hình vẽ biểu diễn khoảng $( 1; 5 )$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho hai tập hợp $M = {m; n; p; q}$ và $N = {p; q; r; s}$. Tìm tập hợp $M cup N$.],
    (
        [${p; q}$],
        [${m; n; r; s}$],
        True([${m; n; p; q; r; s}$]),
        [${m; n}$]
    ),
    loigiai: [
        Tập hợp hợp $M cup N$ gồm tất cả các phần tử thuộc $M$ hoặc thuộc $N$ (viết mỗi phần tử 1 lần).
        Vậy $M cup N = {m; n; p; q; r; s}$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho $A = [-3; 4]$ và $B = (1; 6)$. Tìm $A cap B$.],
    (
        [$[-3; 6)$],
        True([$(1; 4]$]),
        [$[-3; 1]$],
        [$(4; 6)$]
    ),
    loigiai: [
        - $A$ là đoạn từ $-3$ đến $4$.
        - $B$ là khoảng từ $1$ đến $6$.
        Giao của $A$ và $B$ là phần chung: lấy từ $1$ (ngoặc tròn) đến $4$ (ngoặc vuông). Vậy $A cap B = (1; 4]$.
        
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            content((-5, 1), $A$)
            line((-4, 1), (8, 1), mark: (end: ">"))
            content((-3, 0.6), [$-3$]); content((-3, 1), text(size: 14pt)[$[$])
            content((4, 0.6), [$4$]); content((4, 1), text(size: 14pt)[$]$])
            gach_cheo(-4, -3, y: 1); gach_cheo(4, 7.8, y: 1)
            
            content((-5, 0), $B$)
            line((-4, 0), (8, 0), mark: (end: ">"))
            content((1, -0.4), [$1$]); content((1, 0), text(size: 14pt)[$($])
            content((6, -0.4), [$6$]); content((6, 0), text(size: 14pt)[$)$])
            gach_cheo(-4, 1, y: 0); gach_cheo(6, 7.8, y: 0)
            
            content((-5, -1), $A cap B$)
            line((-4, -1), (8, -1), mark: (end: ">"))
            content((1, -1.4), [$1$]); content((1, -1), text(size: 14pt)[$($])
            content((4, -1.4), [$4$]); content((4, -1), text(size: 14pt)[$]$])
            gach_cheo(-4, 1, y: -1); gach_cheo(4, 7.8, y: -1)
          })
        ]
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho tập hợp $X = (2; +infty)$. Tập hợp $C_RR X$ (phần bù của $X$ trong $RR$) là:],
    (
        [$( -infty ; 2 )$],
        True([$( -infty ; 2 ]$]),
        [$[ 2 ; +infty )$],
        [$( -2 ; +infty )$]
    ),
    loigiai: [
        Phần bù của $X$ trong $RR$ là $RR setminus X$.
        $RR setminus (2; +infty) = (-infty; 2]$.
        (Lưu ý: $X$ không chứa $2$ nên phần bù phải chứa điểm $2$, do đó dùng ngoặc vuông tại $2$).
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Một tập hợp có $4$ phần tử thì có bao nhiêu tập hợp con có đúng $2$ phần tử?],
    (
        [4],
        True([6]),
        [8],
        [16]
    ),
    loigiai: [
        Số tập con gồm 2 phần tử được chọn từ 4 phần tử là tổ hợp chập 2 của 4:
        $ C_4^2 = (4!) / (2! dot 2!) = 6 $
        (Ví dụ tập ${a,b,c,d}$ có các tập con 2 phần tử: ${a,b}, {a,c}, {a,d}, {b,c}, {b,d}, {c,d}$).
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Trong một đợt phỏng vấn 40 ứng viên, có 22 người thành thạo tiếng Anh, 18 người thành thạo tiếng Pháp và 10 người không thành thạo cả hai ngoại ngữ này. Hỏi có bao nhiêu người thành thạo CẢ HAI thứ tiếng?],
    (
        True([10]),
        [8],
        [12],
        [30]
    ),
    loigiai: [
        Gọi $A$ là tập các ứng viên thạo tiếng Anh, $B$ là tập thạo tiếng Pháp.
        Số người thành thạo ít nhất 1 ngoại ngữ là: $n(A cup B) = 40 - 10 = 30$.
        Ta có công thức: $n(A cup B) = n(A) + n(B) - n(A cap B)$.
        $=> 30 = 22 + 18 - n(A cap B) <=> n(A cap B) = 40 - 30 = 10$.
        Vậy có 10 người thành thạo cả 2 ngoại ngữ.
        
        #venn2(
          title: "Khảo sát: 40 ứng viên",
          name-a: "TIẾNG ANH (22)",
          name-b: "TIẾNG PHÁP (18)",
          only-a: "12",
          both: "10",
          only-b: "8",
          outside: "10",
        )
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Hai tập hợp $A = {1; 2; 3}$ và $B = {1; 2; 3; a; b}$ (với $a, b$ khác nhau và khác 1, 2, 3). Có bao nhiêu tập hợp $X$ sao cho $A subset X subset B$ và $X$ có đúng $4$ phần tử?],
    (
        True([2]),
        [3],
        [4],
        [1]
    ),
    loigiai: [
        Vì $A subset X subset B$, tập $X$ phải chứa toàn bộ phần tử của $A$, tức là $X = {1; 2; 3} cup Y$, với $Y subset {a; b}$.
        Vì $X$ có đúng 4 phần tử nên tập thêm vào $Y$ phải có đúng $4 - 3 = 1$ phần tử.
        Các tập $Y$ gồm 1 phần tử là ${a}$ hoặc ${b}$. 
        Có 2 cách chọn $Y$, do đó có 2 tập hợp $X$ thỏa mãn: $X = {1; 2; 3; a}$ và $X = {1; 2; 3; b}$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Khẳng định nào sau đây là định nghĩa đúng của tập hợp con?],
    (
        [$A subset B <=> (exists x in A, x in B)$],
        [$A subset B <=> (forall x in B, x in A)$],
        True([$A subset B <=> (forall x in A, x in B)$]),
        [$A subset B <=> (A cap B != emptyset)$]
    ),
    loigiai: [
        Tập hợp $A$ được gọi là tập con của $B$ ($A subset B$) nếu mọi phần tử của $A$ đều là phần tử của $B$.
        Ký hiệu toán học: $forall x, (x in A => x in B)$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho các khoảng $M = (-2; 5)$ và $N = (1; 7]$. Xét tính đúng sai của các phát biểu sau:],
  (
    [Tập hợp $M cap N = (1; 5]$.],
    True([Tập hợp $M cup N = (-2; 7]$.]),
    True([Tập hợp $M setminus N = (-2; 1]$.]),
    [Số nguyên lớn nhất thuộc $N setminus M$ là số $6$.]
  ),
  loigiai: [
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // M
        content((-4, 1.5), $M$)
        line((-3, 1.5), (8, 1.5), mark: (end: ">"))
        content((-2, 1.1), [$-2$]); content((-2, 1.5), text(size: 14pt)[$($])
        content((5, 1.1), [$5$]); content((5, 1.5), text(size: 14pt)[$)$])
        gach_cheo(-3, -2, y: 1.5); gach_cheo(5, 7.8, y: 1.5)
        
        // N
        content((-4, 0.5), $N$)
        line((-3, 0.5), (8, 0.5), mark: (end: ">"))
        content((1, 0.1), [$1$]); content((1, 0.5), text(size: 14pt)[$($])
        content((7, 0.1), [$7$]); content((7, 0.5), text(size: 14pt)[$]$])
        gach_cheo(-3, 1, y: 0.5); gach_cheo(7, 7.8, y: 0.5)
      })
    ]
    
    Ta có:
    - $M cap N = (1; 5)$. Cả hai đầu mút đều là ngoặc tròn do $5 notin M$ và $1 notin N$. Vậy a) Sai.
    - $M cup N = (-2; 7]$. Vậy b) Đúng.
    - $M setminus N = (-2; 1]$. Các điểm từ $-2$ đến $1$ thuộc $M$ nhưng không thuộc $N$ (vì $N$ không chứa $1$). c) Đúng.
    - $N setminus M = [5; 7]$. Số nguyên lớn nhất thuộc tập này là $7$. Vậy d) Sai.
  ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho hai tập hợp:
$A = {x in RR | x^2 - x - 2 = 0}$ 
$B = {x in ZZ | -1 <= x < 3}$],
  (
    [Tập hợp $A$ và $B$ có cùng số phần tử.],
    True([$A subset B$.]),
    True([Tập hợp $B setminus A$ có chứa 2 phần tử.]),
    [$A cup B = {-1; 0; 1; 2; 3}$.]
  ),
  loigiai: [
    #step([Liệt kê các phần tử của A và B])
    Giải phương trình $x^2 - x - 2 = 0 <=> x = -1$ hoặc $x = 2$.
    Vậy $A = {-1; 2}$.
    Tập hợp $B$ gồm các số nguyên $x$ sao cho $-1 <= x < 3$.
    Vậy $B = {-1; 0; 1; 2}$.
    Tập $A$ có 2 phần tử, tập $B$ có 4 phần tử. Vậy a) Sai.

    #step([Xét các phép toán])
    - Cả $-1$ và $2$ đều nằm trong $B$, nên $A subset B$. b) Đúng.
    - $B setminus A = {0; 1}$. Tập này có đúng 2 phần tử. c) Đúng.
    - $A cup B = B = {-1; 0; 1; 2}$ (không có $3$). Vậy d) Sai.
  ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Khảo sát 150 người về thói quen giải trí, kết quả cho thấy:
- 80 người thích đọc sách.
- 90 người thích xem phim.
- 30 người thích CẢ HAI thói quen trên.],
  (
    True([Số người khảo sát không thích cả đọc sách và xem phim là $10$ người.]),
    True([Có 50 người chỉ thích đọc sách mà không thích xem phim.]),
    True([Tổng số người thích ÍT NHẤT MỘT trong hai thói quen là 140 người.]),
    [Số người chỉ thích xem phim nhiều hơn số người chỉ thích đọc sách là $20$ người.]
  ),
  loigiai: [
    #step([Sử dụng biểu đồ Venn])
    Gọi $S$ là tập người thích đọc sách, $P$ là tập người thích xem phim.
    Ta có $n(S) = 80$, $n(P) = 90$, $n(S cap P) = 30$.
    
    #step([Tính các đại lượng])
    - Số người thích ít nhất 1 thói quen: $n(S cup P) = 80 + 90 - 30 = 140$. Vậy c) Đúng.
    - Số người không thích cả 2 thói quen: $150 - 140 = 10$. Vậy a) Đúng.
    - Chỉ thích đọc sách: $80 - 30 = 50$ người. Vậy b) Đúng.
    - Chỉ thích xem phim: $90 - 30 = 60$ người. 
    So sánh: $60 - 50 = 10$ người. Vậy d) Sai.
    
    #venn2(
      title: "Khảo sát 150 người",
      name-a: "ĐỌC SÁCH (80)",
      name-b: "XEM PHIM (90)",
      only-a: "50",
      both: "30",
      only-b: "60",
      outside: "10",
    )
  ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho tập hợp $A = [m - 1; m + 3]$ và $B = (-2; 5)$. Xét các mệnh đề liên quan đến tham số $m$ để hai tập hợp có sự tương quan:],
  (
    [Tập $A$ luôn là một đoạn có độ dài bằng $5$ với mọi $m$.],
    True([Điều kiện để $A subset B$ là $-1 < m < 2$.]),
    True([Nếu $m = -1$ thì $A cap B = (-2; 2]$.]),
    [Có đúng 4 giá trị nguyên của $m$ để $A subset B$.]
  ),
  loigiai: [
    #step([Độ dài đoạn A])
    Đoạn $A$ có các đầu mút là $m-1$ và $m+3$. 
    Chiều dài đoạn là $(m+3) - (m-1) = 4 != 5$. Vậy a) Sai.
    
    #step([Điều kiện $A subset B$])
    Để $A = [m - 1; m + 3] subset B = (-2; 5)$, ta cần:
    $ -2 < m - 1 text(" và ") m + 3 < 5 <=> -1 < m < 2 $
    Vậy b) Đúng.
    
    Các giá trị nguyên của $m$ trong khoảng $(-1; 2)$ là $0$ và $1$ (chỉ có 2 giá trị nguyên, không phải 4). Vậy d) Sai.
    
    #step([Trường hợp $m = -1$])
    Nếu $m = -1$, $A = [-2; 2]$. 
    $A cap B = [-2; 2] cap (-2; 5) = (-2; 2]$. Vậy c) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho các tập hợp $X = (-4; 5]$ và $Y = [1; 9)$. Tập hợp $X cup Y$ là một khoảng/đoạn/nửa khoảng có dạng $(a; b)$. Tính độ dài của khoảng $(a; b)$.],
    [13],
    loigiai: [
        #step([Xác định tập hợp hợp])
        - Giới hạn dưới nhỏ nhất: $min(-4, 1) = -4$ (ngoặc tròn).
        - Giới hạn trên lớn nhất: $max(5, 9) = 9$ (ngoặc tròn).
        Vậy $X cup Y = (-4; 9)$.
        
        #step([Tính độ dài])
        Độ dài khoảng là $b - a = 9 - (-4) = 13$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Lớp 10B có 45 học sinh. Trong đợt đăng ký câu lạc bộ, có 25 bạn đăng ký CLB Âm nhạc, 20 bạn đăng ký CLB Mỹ thuật. Biết rằng có 8 bạn không đăng ký câu lạc bộ nào. Hỏi có bao nhiêu bạn đăng ký CẢ HAI câu lạc bộ?],
    [8],
    loigiai: [
        #step([Tính số học sinh đăng ký ít nhất 1 CLB])
        $45 - 8 = 37$ bạn.
        
        #step([Tính số học sinh tham gia cả 2 CLB])
        $n(A cap M) = 25 + 20 - 37 = 8$ bạn.
        
        #venn2(
          title: "Lớp 10B: 45 học sinh",
          name-a: "ÂM NHẠC (25)",
          name-b: "MỸ THUẬT (20)",
          only-a: "17",
          both: "8",
          only-b: "12",
          outside: "8",
        )
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho hai tập hợp $A = [-2; 4)$ và $B = (m; m+2]$. Tìm giá trị nguyên lớn nhất của tham số $m$ để $A cap B != emptyset$.],
    [3],
    loigiai: [
        #step([Điều kiện $A cap B != emptyset$])
        Để $A cap B = emptyset$, ta có hai trường hợp:
        1. $B$ nằm hoàn toàn bên phải $A$: $m >= 4$.
        2. $B$ nằm hoàn toàn bên trái $A$: $m+2 <= -2 <=> m <= -4$.
        
        Vậy điều kiện để $A cap B != emptyset$ là phủ định của $(m >= 4$ hoặc $m <= -4)$.
        Tức là: $-4 < m < 4$.
        
        #step([Kết luận])
        Giá trị nguyên lớn nhất của $m$ thỏa mãn điều kiện này là $m = 3$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho tập hợp $X = {x in NN | x^2 - 7x + 10 = 0}$ và $Y = {x in ZZ | -1 <= x <= 3}$. Số phần tử của tập hợp $Y setminus X$ là bao nhiêu?],
    [4],
    loigiai: [
        #step([Xác định các tập hợp])
        $x^2 - 7x + 10 = 0 <=> x = 2$ hoặc $x = 5 => X = {2; 5}$.
        $Y = {-1; 0; 1; 2; 3}$.
        
        #step([Tính hiệu $Y setminus X$])
        $Y setminus X = {-1; 0; 1; 3}$.
        Tập hợp này có $4$ phần tử.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Cho tập hợp $S$ gồm các số nguyên tố nhỏ hơn $10$. Có bao nhiêu tập hợp con của $S$ chứa đúng $3$ phần tử?],
    [4],
    loigiai: [
        #step([Liệt kê tập S])
        $S = {2; 3; 5; 7}$ (có 4 phần tử).
        
        #step([Số tập con 3 phần tử])
        $C_4^3 = 4$. Cụ thể: ${2,3,5}, {2,3,7}, {2,5,7}, {3,5,7}$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 102], back-to: "sec-exercise-hub",[Trong một lớp học, có 15 bạn giỏi Toán, 12 bạn giỏi Lý, và 10 bạn giỏi Hóa. Biết rằng có 5 bạn giỏi cả Toán và Lý, 4 bạn giỏi cả Lý và Hóa, 3 bạn giỏi cả Toán và Hóa, và 2 bạn giỏi cả 3 môn. Hỏi lớp đó có tổng cộng bao nhiêu bạn được xếp loại giỏi ít nhất 1 môn trong 3 môn trên?],
    [27],
    loigiai: [
        #step([Áp dụng công thức hợp 3 tập hợp])
        $ n(T cup L cup H) = n(T) + n(L) + n(H) - n(T cap L) - n(L cap H) - n(H cap T) + n(T cap L cap H) $
        $ = 15 + 12 + 10 - 5 - 4 - 3 + 2 = 27 $
        
        #venn3(
          title: "Thống kê giỏi 3 môn",
          name-a: "Toán (15)",
          name-b: "Lý (12)",
          name-c: "Hóa (10)",
          a-only: "9",
          b-only: "5",
          c-only: "5",
          ab-only: "3",
          bc-only: "2",
          ca-only: "1",
          abc: "2",
          outside: none,
        )
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 2 & 3: TẬP HỢP VÀ CÁC PHÉP TOÁN (ĐỀ SỐ 2)!]      #v(0.6em)
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
