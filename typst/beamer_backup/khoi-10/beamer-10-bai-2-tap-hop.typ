// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-10-BÀI 2: TẬP HỢP VÀ CÁC PHÉP TOÁN TRÊN TẬP HỢP
// Toán 10 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let cap = math.inter
#let cup = math.union
#let setminus = math.without

// Macro gạch chéo trục số
#let gach_cheo(x1, x2, y: 0, h: 0.18, step: 0.16) = {
  import cetz.draw: *
  let n = calc.max(1, int((x2 - x1) / step))
  for i in range(n + 1) {
    let px = x1 + i * step
    line((px, y + h), (px - h, y - h), stroke: 0.5pt + rgb("#64748b"))
  }
}

#show: lecture-theme.with(
  title:       "Bài 2: Tập Hợp & Các Phép Toán",
  subtitle:    "TOÁN 10 — Chương I: Mệnh đề và tập hợp",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

#lt-toc()

// ════════════════════════════════════════════════
// PHẦN 0: BỐI CẢNH LỊCH SỬ & KHỞI ĐỘNG TƯ DUY
// ════════════════════════════════════════════════
#lt-section-link("sec-history-2", "🏛️", [Bối cảnh Lịch sử & Khởi động Tư duy])

#lt-slide-back(title: "🏛️ Georg Cantor & Bi kịch Người đo cõi Vô hạn")[
  #lt-two-col(
    ratio: (58%, 42%),
    [
      #lt-history(title: "Cuộc cách mạng Vô hạn")[
        Trước thế kỷ XIX, các nhà toán học tin rằng Vô hạn là bất khả tri.
        
        *Georg Cantor* (1845 – 1918) đã một mình chứng minh: *Có nhiều cấp độ vô hạn khác nhau!*
        - Vô hạn đếm được của số tự nhiên $NN$ ($aleph_0$).
        - Vô hạn liên tục của số thực $RR$ trên đoạn $[0; 1]$ lớn hơn vô hạn của $NN$ ($c = 2^(aleph_0) > aleph_0$)!
      ]
    ],
    [
      #v(0.4em)
      #lt-note(title: "Thiên đường của Cantor")[
        Dù bị đương thời công kích tàn nhẫn, David Hilbert đã tuyên bố:
        
        _“Không một ai có thể trục xuất chúng ta ra khỏi thiên đường mà Georg Cantor đã tạo dựng!”_
      ]
    ]
  )
]

#lt-slide-back(title: "🪒 Nghịch lý Ông Thợ Cạo của Bertrand Russell")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-example(title: "Quy tắc hành nghề")[
        Một ông thợ cạo ở Seville tuyên bố:
        
        _“Tôi chỉ cạo râu cho những người trong làng KHÔNG TỰ CẠO RÂU, và cạo cho tất cả những người đó!”_
        
        *Câu hỏi:* Bản thân ông thợ cạo có tự cạo râu cho chính mình hay không?
      ]
    ],
    [
      #pause
      #lt-solution[
        *Nghịch lý bế tắc:*
        - Nếu ông *tự cạo* $arrow$ Ông vi phạm quy tắc (chỉ cạo cho người không tự cạo)!
        - Nếu ông *không tự cạo* $arrow$ Ông bắt buộc phải cạo cho chính mình!
        
        $arrow$ *Bài học:* Không thể gom mọi thứ vào một "tập hợp" tùy tiện. Lý thuyết tập hợp cần nền tảng tiên đề chặt chẽ (Hệ ZFC)!
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN I: KHÁI NIỆM TẬP HỢP & TẬP HỢP CON
// ════════════════════════════════════════════════
#lt-section-link("sec-tap-hop", "📦", [I. Khái niệm Tập hợp & Tập hợp Con])

#lt-slide-back(title: "1. Khái niệm Tập hợp & Phần tử")[
  #lt-definition(title: "Tập hợp và quan hệ thuộc")[
    - Tập hợp là một khái niệm cơ bản, thường ký hiệu bằng chữ cái in hoa: $A, B, X, dots$
    - Phần tử của tập hợp ký hiệu chữ cái thường: $a, b, x, dots$
    - $a in A$: Phần tử $a$ *thuộc* tập hợp $A$.
    - $b in.not A$: Phần tử $b$ *không thuộc* tập hợp $A$.
  ]
  #v(0.2em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 5pt, width: 100%)[
        *1. Liệt kê các phần tử:*
        $A = {1; 2; 3; 4; 5}$
        
        _Mỗi phần tử viết 1 lần, ngăn cách bởi dấu chấm phẩy._
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 5pt, width: 100%)[
        *2. Chỉ ra tính chất đặc trưng:*
        $B = {x in ZZ mid(|) -2 < x <= 3}$
        
        _Nêu rõ tập mẹ và điều kiện kiểm tra._
      ]
    ]
  )
]

#lt-slide-back(title: "2. Tập hợp Con & Hai tập hợp Bằng nhau")[
  #lt-definition(title: "Tập con")[
    Tập hợp $A$ là *tập hợp con* của tập hợp $B$ (ký hiệu $A subset B$) nếu mọi phần tử của $A$ đều là phần tử của $B$:
    $A subset B space <=> space (forall x, x in A => x in B)$
  ]
  #v(0.2em)
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-note(title: "Quy ước & Tính chất")[
        - Tập rỗng $emptyset$ là tập con của mọi tập hợp: $emptyset subset A$.
        - Mọi tập hợp là con của chính nó: $A subset A$.
        - Nếu $A subset B$ và $B subset C$ thì $A subset C$.
      ]
    ],
    [
      #lt-theorem(title: "Hai tập bằng nhau & Số tập con")[
        - $A = B space <=> space heva(A subset B, B subset A)$
        - Nếu tập $A$ có $n$ phần tử, thì $A$ có đúng *$2^n$ tập hợp con*.
        
        _Ví dụ: $A = {1; 2}$ có $2^2 = 4$ tập con: $emptyset, {1}, {2}, {1; 2}$._
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN II: CÁC TẬP HỢP CON CỦA SỐ THỰC (R)
// ════════════════════════════════════════════════
#lt-section-link("sec-tap-so-thuc", "📏", [II. Các Tập hợp Con của Số Thực R])

#lt-slide-back(title: "1. Khoảng, Đoạn, Nửa khoảng trên R")[
  #align(center)[
    #set text(size: 13.5pt)
    #table(
      columns: (1.5fr, 2.5fr, 3fr),
      align: (center + horizon, left + horizon, left + horizon),
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: (_, row) => if row == 0 { rgb("#eff6ff") } else { none },
      [*Tên gọi*], [*Ký hiệu & Định nghĩa*], [*Biểu diễn trên trục số*],
      [Khoảng], [$(a; b) = {x in RR mid(|) a < x < b}$], [Lấy giữa $a, b$; dùng ngoặc tròn $($ và $)$],
      [Đoạn], [$[a; b] = {x in RR mid(|) a <= x <= b}$], [Lấy cả $a, b$; dùng ngoặc vuông $[$ và $]$],
      [Nửa khoảng], [$[a; b) = {x in RR mid(|) a <= x < b}$], [Lấy $a$ (ngoặc $[$), không lấy $b$ (ngoặc $)$)],
      [Nửa khoảng], [$(a; b] = {x in RR mid(|) a < x <= b}$], [Không lấy $a$ (ngoặc $($), lấy $b$ (ngoặc $]$)],
      [Vô cực], [$(a; +infinity) = {x in RR mid(|) x > a}$], [Từ $a$ sang phải đến dương vô cực],
      [Vô cực], [$( -infinity; b ] = {x in RR mid(|) x <= b}$], [Từ âm vô cực sang phải đến $b$],
    )
  ]
]

#lt-slide-back(title: "2. Kỹ thuật Biểu diễn trên Trục số")[
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #lt-rule(title: "Quy tắc 3 bước gạch bỏ", num: "★")[
        1. *Vẽ trục số:* Mũi tên hướng sang phải ($+infinity$).
        2. *Điền giá trị mút:* Sắp xếp thứ tự từ nhỏ đến lớn.
        3. *Đặt ngoặc & Gạch bỏ:* Ngoặc quay vào phần giữ lại; gạch chéo phần bỏ đi.
      ]
      #v(0.2em)
      #lt-note(title: "Phân biệt")[
        - Ngoặc vuông $[$ $]$: *Lấy* điểm mút.
        - Ngoặc tròn $($ $)$: *Bỏ* điểm mút.
      ]
    ],
    [
      #v(0.5em)
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12pt)[Biểu diễn nửa khoảng $[-2; 3)$]
          #v(0.6em)
          #cetz.canvas({
            import cetz.draw: *
            line((-1.5, 0), (4.5, 0), mark: (end: ">"), stroke: 1.2pt + rgb("#1e293b"))
            content((4.7, 0), text(size: 11pt)[$x$])
            
            // Mút số
            content((0, -0.4), text(size: 11pt, weight: "bold")[$-2$])
            content((3, -0.4), text(size: 11pt, weight: "bold")[$3$])
            
            // Gạch chéo ngoài khoảng
            gach_cheo(-1.5, 0)
            gach_cheo(3, 4.3)
            
            // Dấu ngoặc
            content((0, 0), text(size: 16pt, fill: rgb("#1e3a8a"), weight: "bold")[$[$])
            content((3, 0), text(size: 16pt, fill: rgb("#dc2626"), weight: "bold")[$)$])
          })
          #v(0.4em)
          #text(size: 10.5pt, fill: rgb("#475569"))[Giữ lại phần ở giữa $[-2; 3)$, gạch bỏ hai đầu.]
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: CÁC PHÉP TOÁN TRÊN TẬP HỢP
// ════════════════════════════════════════════════
#lt-section-link("sec-phep-toan", "⚙️", [III. Các Phép Toán trên Tập Hợp])

#lt-slide-back(title: "1. Phép Giao (∩) & Phép Hợp (∪)")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Giao của hai tập hợp")[
        $A cap B$ là tập hợp gồm các phần tử *vừa thuộc $A$, vừa thuộc $B$*:
        $A cap B = {x mid(|) x in A text(" và ") x in B}$
      ]
      #v(0.2em)
      #block(fill: rgb("#f0fdf4"), stroke: 1.2pt + rgb("#16a34a"), inset: 8pt, radius: 5pt)[
        _Ví dụ:_ $A = {1; 2; 3}$, $B = {2; 3; 4}$\
        $arrow A cap B = {2; 3}$
      ]
    ],
    [
      #lt-definition(title: "Hợp của hai tập hợp")[
        $A cup B$ là tập hợp gồm các phần tử *thuộc $A$ hoặc thuộc $B$*:
        $A cup B = {x mid(|) x in A text(" hoặc ") x in B}$
      ]
      #v(0.2em)
      #block(fill: rgb("#eff6ff"), stroke: 1.2pt + rgb("#1e3a8a"), inset: 8pt, radius: 5pt)[
        _Ví dụ:_ $A = {1; 2; 3}$, $B = {2; 3; 4}$\
        $arrow A cup B = {1; 2; 3; 4}$
      ]
    ]
  )
]

#lt-slide-back(title: "2. Phép Hiệu (\\) & Phần Bù (C_E A)")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Hiệu của hai tập hợp")[
        $A setminus B$ là tập hợp gồm các phần tử *thuộc $A$ nhưng KHÔNG thuộc $B$*:
        $A setminus B = {x mid(|) x in A text(" và ") x in.not B}$
      ]
      #v(0.2em)
      #block(fill: rgb("#fff7ed"), stroke: 1.2pt + rgb("#ea580c"), inset: 8pt, radius: 5pt)[
        _Ví dụ:_ $A = {1; 2; 3; 4}$, $B = {3; 4; 5}$\
        $arrow A setminus B = {1; 2}$
      ]
    ],
    [
      #lt-definition(title: "Phần bù")[
        Khi $A$ là tập con của $E$ ($A subset E$), hiệu $E setminus A$ gọi là *phần bù* của $A$ trong $E$:
        $C_E A = E setminus A = {x in E mid(|) x in.not A}$
      ]
      #v(0.2em)
      #block(fill: rgb("#fef2f2"), stroke: 1.2pt + rgb("#dc2626"), inset: 8pt, radius: 5pt)[
        _Ví dụ:_ $E = RR, A = [0; +infinity)$\
        $arrow C_RR A = (-infinity; 0)$
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BIỂU ĐỒ VENN & BÀI TOÁN THỰC TẾ
// ════════════════════════════════════════════════
#lt-section-link("sec-ung-dung-venn", "🎯", [IV. Biểu đồ Venn & Giải Toán Thực tế])

#lt-slide-back(title: "🎯 Bài toán Khảo sát Thực tế bằng Biểu đồ Venn")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-example(title: "Khảo sát lớp 10A")[
        Lớp 10A có:
        - $25$ học sinh thích môn *Toán*.
        - $20$ học sinh thích môn *Văn*.
        - $15$ học sinh thích *cả hai môn*.
        
        *Hỏi:* Có bao nhiêu học sinh *chỉ thích* môn Toán?
      ]
      #v(0.2em)
      #pause
      #lt-solution[
        $n(text("Chỉ Toán")) = n(text("Toán")) - n(text("Toán & Văn"))$\
        $= 25 - 15 = 10$ học sinh.
      ]
    ],
    [
      #v(0.5em)
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 8pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 11pt)[Biểu đồ Venn lớp 10A]
          #v(0.5em)
          #cetz.canvas({
            import cetz.draw: *
            // Vòng tròn Toán
            circle((-0.9, 0), radius: 1.3, fill: rgb(56, 189, 248, 30%), stroke: 1.5pt + rgb("#0284c7"))
            content((-1.6, 1.4), text(size: 10pt, weight: "bold", fill: rgb("#0284c7"))[TOÁN (25)])
            content((-1.2, 0), text(size: 14pt, weight: "bold", fill: rgb("#0369a1"))[10])
            
            // Vòng tròn Văn
            circle((0.9, 0), radius: 1.3, fill: rgb(251, 113, 133, 30%), stroke: 1.5pt + rgb("#e11d48"))
            content((1.6, 1.4), text(size: 10pt, weight: "bold", fill: rgb("#e11d48"))[VĂN (20)])
            content((1.2, 0), text(size: 14pt, weight: "bold", fill: rgb("#be123c"))[5])
            
            // Phần giao
            content((0, 0), text(size: 14pt, weight: "bold", fill: rgb("#581c87"))[15])
          })
          #v(0.2em)
          #text(size: 9.5pt, fill: rgb("#64748b"))[Chỉ Toán: 10  |  Cả hai: 15  |  Chỉ Văn: 5]
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN V: HỆ THỐNG BÀI TẬP THỰC CHIẾN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-2", "🎯", [V. Hệ thống Bài tập Thực chiến])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CHƯƠNG I BÀI 2],
  questions: (
    (num: 1, type: "TN", desc: [Liệt kê phần tử tập hợp]),
    (num: 2, type: "TN", desc: [Ký hiệu nửa khoảng và đoạn]),
    (num: 3, type: "TN", desc: [Nhận dạng tập hợp rỗng]),
    (num: 4, type: "TN", desc: [Quan hệ tập con A con B]),
    (num: 5, type: "TN", desc: [Đọc biểu diễn trên trục số]),
    (num: 6, type: "TN", desc: [Hợp của hai khoảng trên R]),
    (num: 7, type: "DS", desc: [Đúng/Sai các phép toán tập hợp]),
    (num: 8, type: "TLN", desc: [Đếm số tập con có 3 phần tử]),
    (num: 9, type: "TLN", desc: [Tìm m để hai đoạn giao nhau khác rỗng]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho tập hợp $A = {x in ZZ mid(|) -2 < x <= 1}$. Cách viết nào sau đây dưới dạng liệt kê các phần tử là đúng?],
  (
    [${-2; -1; 0; 1}$],
    [${-1; 0; 1}$],
    [${-2; -1; 0}$],
    [${0; 1}$],
  ),
  correct: 2,
  num: 1,
  de: "Đề 02A — Câu 1",
  loigiai: [
    Vì $x in ZZ$ và $-2 < x <= 1$ nên $x$ nhận các giá trị nguyên là $-1; 0; 1$.\
    Vậy $A = {-1; 0; 1}$. Chọn *B*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Ký hiệu nào sau đây thể hiện tập hợp các số thực lớn hơn hoặc bằng $3$ và nhỏ hơn $7$?],
  (
    [$(3; 7)$],
    [$[3; 7)$],
    [$(3; 7]$],
    [$[3; 7]$],
  ),
  correct: 2,
  num: 2,
  de: "Đề 02A — Câu 2",
  loigiai: [
    Tập hợp các số thực $x$ thỏa mãn $3 <= x < 7$ lấy mút 3 (ngoặc vuông) và bỏ mút 7 (ngoặc tròn).\
    Ký hiệu là nửa khoảng $[3; 7)$. Chọn *B*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Trong các tập hợp sau đây, tập hợp nào là *tập rỗng*?],
  (
    [${x in ZZ mid(|) x^2 - 9 = 0}$],
    [${x in RR mid(|) x^2 + 2x + 1 = 0}$],
    [${x in QQ mid(|) x^2 - 2 = 0}$],
    [${0}$],
  ),
  correct: 3,
  num: 3,
  de: "Đề 02A — Câu 3",
  loigiai: [
    Phương trình $x^2 - 2 = 0 <=> x = +-sqrt(2)$. Do $sqrt(2) in.not QQ$ nên trên tập số hữu tỉ $QQ$, phương trình vô nghiệm.\
    Vậy tập hợp rỗng là C. Chọn *C*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Cho hai tập hợp $A = {1; 2; 3}$ và $B = {1; 2; 3; 4; 5}$. Khẳng định nào sau đây là *sai*?],
  (
    [$A subset B$],
    [$A cup B = B$],
    [$A cap B = A$],
    [$B setminus A = emptyset$],
  ),
  correct: 4,
  num: 4,
  de: "Đề 02A — Câu 4",
  loigiai: [
    Phép hiệu $B setminus A$ gồm các phần tử thuộc $B$ nhưng không thuộc $A$.\
    Ta có $B setminus A = {4; 5} eq.not emptyset$. Do đó khẳng định D là sai. Chọn *D*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Hình vẽ sau biểu diễn tập hợp nào trên trục số (phần không bị gạch)?],
  (
    [$( -2 ; 3 ]$],
    [$[ -2 ; 3 ]$],
    [$[ -2 ; 3 )$],
    [$( -2 ; 3 )$],
  ),
  correct: 3,
  num: 5,
  de: "Đề 02A — Câu 5",
  loigiai: [
    Tại $-2$ sử dụng ngoặc vuông $[$ (lấy dấu bằng), tại $3$ sử dụng ngoặc tròn $)$ (không lấy dấu bằng).\
    Vậy hình vẽ biểu diễn nửa khoảng $[ -2; 3 )$. Chọn *C*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tn(
  [Cho hai tập hợp $A = (-infinity; 5)$ và $B = [-2; +infinity)$. Tìm hợp $A cup B$.],
  (
    [$[-2; 5)$],
    [$( -infinity ; -2 )$],
    [$[5 ; +infinity )$],
    [$RR$],
  ),
  correct: 4,
  num: 6,
  de: "Đề 02A — Câu 7",
  loigiai: [
    Tập $A$ gồm các số $< 5$; tập $B$ gồm các số $>= -2$.\
    Vì $-2 < 5$ nên hai tập này phủ kín toàn bộ trục số. Vậy $A cup B = RR$. Chọn *D*.
  ],
  back-to: "sec-exercise-hub"
)

// Câu hỏi Đúng/Sai toàn diện
#lt-ds(
  [Cho hai tập hợp $A = (-3; 2]$ và $B = [0; +infinity)$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Tập hợp giao $A cap B = [0; 2]$.], "true": true),
    (body: [Tập hợp hợp $A cup B = (-3; +infinity)$.], "true": true),
    (body: [Tập hợp hiệu $A setminus B = (-3; 0)$.], "true": true),
    (body: [Số nguyên dương nhỏ nhất thuộc $B setminus A$ là số $2$.], "true": false),
  ),
  num: 7,
  de: "Đề 02A — Đúng/Sai Tổng Hợp",
  loigiai: [
    - a) *Đúng:* Giao lấy phần chung giữa $(-3; 2]$ và $[0; +infinity)$ là $[0; 2]$.
    - b) *Đúng:* Hợp kéo dài từ $-3$ đến $+infinity$, tức $(-3; +infinity)$.
    - c) *Đúng:* $A setminus B$ lấy phần thuộc $A$ nhưng $< 0$, tức $(-3; 0)$.
    - d) *Sai:* $B setminus A = (2; +infinity)$. Số nguyên dương nhỏ nhất là $3$.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho tập hợp $A = {1; 2; 3; 4; 5}$. Tập hợp $A$ có tất cả bao nhiêu tập con gồm đúng $3$ phần tử?],
  "10",
  num: 8,
  de: "Đề 02A — Đếm Số Tập Con Có k Phần Tử",
  loigiai: [
    1. Số tập con có $3$ phần tử của tập hợp $A$ gồm $5$ phần tử bằng số tổ hợp chập $3$ của $5$ phần tử.\
    2. Áp dụng công thức tổ hợp: $C_5^3 = (5 times 4 times 3) / (3 times 2 times 1) = 10$ tập con.\
    3. Liệt kê kiểm chứng: ${1,2,3}, {1,2,4}, {1,2,5}, {1,3,4}, {1,3,5}, {1,4,5}, {2,3,4}, {2,3,5}, {2,4,5}, {3,4,5}$.\
    4. Đáp số: *$10$*.
  ],
  back-to: "sec-exercise-hub"
)

#lt-tln(
  [Cho hai tập hợp $A = [m; m + 2]$ và $B = [1; 3]$. Có bao nhiêu giá trị nguyên của tham số $m$ để $A inter B eq.not emptyset$?],
  "5",
  num: 9,
  de: "Đề 02A — Tìm Tham Số m Để Hai Đoạn Giao Nhau Khác Rỗng",
  loigiai: [
    1. Hai đoạn $A = [m; m + 2]$ và $B = [1; 3]$ có giao khác rỗng khi và chỉ khi:\
       $m <= 3$ và $m + 2 >= 1 <=> -1 <= m <= 3$.\
    2. Các giá trị nguyên của $m$ thỏa mãn: $m in {-1; 0; 1; 2; 3}$.\
    3. Số lượng giá trị nguyên là $5$ giá trị.\
    4. Đáp số: *$5$*.
  ],
  back-to: "sec-exercise-hub"
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & THÔNG ĐIỆP SƯ PHẠM
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-2", "🗺️", [VI. Tổng kết & Sơ đồ Tư duy])

#lt-slide-back(title: "🗺️ 6 Trụ Cột Cốt Lõi — Bài 2: Tập Hợp")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 14pt)[1. PHẦN TỬ & TẬP CON]
        #v(0.2em)
        #text(size: 11.5pt)[
          - $x in A$ (thuộc) vs $A subset B$ (con).
          - $emptyset$ là con của mọi tập hợp.
          - Tập $n$ phần tử có $2^n$ tập con.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 14pt)[2. TẬP CON CỦA R]
        #v(0.2em)
        #text(size: 11.5pt)[
          - Khoảng $(a; b)$: Không lấy mút.
          - Đoạn $[a; b]$: Lấy cả 2 mút.
          - Nửa khoảng: Ngoặc $[$ lấy, $)$ bỏ.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#ea580c"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#ea580c"), size: 14pt)[3. PHÉP GIAO (∩)]
        #v(0.2em)
        #text(size: 11.5pt)[
          - Lấy *phần tử chung*.
          - $x in A$ VÀ $x in B$.
          - Giao nhau = Gạch bỏ phần ngoài cả 2.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 14pt)[4. PHÉP HỢP (∪)]
        #v(0.2em)
        #text(size: 11.5pt)[
          - Lấy *tất cả phần tử*.
          - $x in A$ HOẶC $x in B$.
          - Gom chung không lặp lại phần tử.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fdf4ff"), stroke: 1.5pt + rgb("#c026d3"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#c026d3"), size: 14pt)[5. HIỆU & PHẦN BÙ]
        #v(0.2em)
        #text(size: 11.5pt)[
          - $A setminus B$: Thuộc $A$, KHÔNG thuộc $B$.
          - Phần bù $C_E A = E setminus A$ khi $A subset E$.
          - $C_RR [a; b) = (-infinity; a) cup [b; +infinity)$.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 14pt)[6. BIỂU ĐỒ VENN]
        #v(0.2em)
        #text(size: 11.5pt)[
          - Trực quan hóa quan hệ tập hợp.
          - Công thức đếm phần tử:
          $n(A cup B) = n(A) + n(B) - n(A cap B)$.
        ]
      ]
    ],
  )
]

#lt-slide-back(title: "🎓 Lời khuyên Sư phạm của Thầy Sang")[
  #lt-bullets(
    icon: "💎",
    [*Vẽ trục số là chìa khóa vàng:* Với các phép toán trên khoảng/đoạn số thực, luôn vẽ trục số và dùng bút màu khác nhau trước khi ghi kết quả.],
    [*Cảnh giác với ngoặc tại điểm mút:* Chú ý kiểm tra cực kỳ kỹ lưỡng điểm mút lấy hay không lấy khi làm phép hiệu $A setminus B$ và phần bù $C_E A$.],
    [*Luyện tập phân biệt ký hiệu:* Thuộc ($in$) dùng cho phần tử; con ($subset$) dùng cho tập hợp. Đừng bao giờ viết ${1} in A$ mà phải viết ${1} subset A$.],
    [*Tập hợp là ngôn ngữ toàn diện:* Nắm chắc tập hợp sẽ giúp các em giải phóng tư duy khi học Phương trình, Bất phương trình và Xác suất!],
  )
  #v(0.5em)
  #align(center)[
    #text(size: 16pt, fill: rgb("#1e3a8a"), weight: "bold")[
      CHÚC CÁC EM LÀM CHỦ TẬP HỢP & TỰ TIN CHINH PHỤC ĐIỂM 10!
    ]
  ]
]

#lt-slide-back(title: "🏆 Chúc Mừng Bạn Đã Hoàn Thành Bài 2!")[
  #align(center + horizon)[
    #block(
      fill: rgb("#f0fdf4"),
      stroke: 2pt + rgb("#16a34a"),
      inset: 16pt,
      radius: 12pt,
      width: 85%
    )[
      #text(size: 18pt, weight: "bold", fill: rgb("#15803d"))[🎉 XUẤT SẮC CHINH PHỤC BÀI 2!]\
      #v(0.4em)
      #text(size: 10.5pt, fill: rgb("#166534"))[
        Bạn đã làm chủ hoàn toàn lý thuyết tập hợp:\
        *Khái niệm tập hợp, Tập con, Giao, Hợp, Hiệu, Phần bù & Biểu diễn trục số.*
      ]
      #v(0.7em)
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
