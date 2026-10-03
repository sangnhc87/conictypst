#import "../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

#show: lecture-theme.with(
  title: [Bài Tập Cuối Chương I],
  subtitle: [MỆNH ĐỀ & TẬP HỢP — TỔNG ÔN TOÀN DIỆN & BÀI TOÁN THỰC CHIẾN],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Toán 10 · Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ MỤC LỤC TỔNG ÔN CHƯƠNG I])

// ════════════════════════════════════════════════
// PHẦN I: MA TRẬN TRI THỨC: LOGIC & TẬP HỢP
// ════════════════════════════════════════════════
#lt-section-link("sec-ma-tran-logic", "⚡", [I. Ma trận Tri thức: Logic & Tập hợp])

#lt-slide-back(title: "⚡ Sự Tương Thích Kỳ Diệu Giữa Logic Và Tập Hợp")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 12.5pt)[1. MỆNH ĐỀ LOGIC (Lập luận)]
        #v(0.25em)
        - Hội $P and Q$ ("và") · Tuyển $P or Q$ ("hoặc")
        - Phủ định: $overline(P)$ ("không phải $P$")
        - Kéo theo: $P => Q$ · Tương đương: $P <=> Q$
        - Mâu thuẫn logic: Luôn SAI
        - Chân lý logic (Hằng đúng): Luôn ĐÚNG
      ]
    ],
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 9pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12.5pt)[2. ĐẠI SỐ TẬP HỢP (Không gian)]
        #v(0.25em)
        - Giao: $A cap B$ · Hợp: $A cup B$
        - Phần bù: $C_E A = E setminus A$
        - Tập con: $A subset B$ · Bằng nhau: $A = B$
        - Tập hợp rỗng: $emptyset$
        - Tập hợp vũ trụ: $E$ (hoặc toàn không gian $RR$)
      ]
    ]
  )
  #v(0.25em)
  #lt-tip(title: "Khám phá Sư phạm")[
    Mệnh đề và Tập hợp thực chất là *hai mặt của cùng một đồng xu* trong Đại số Boole (Boolean Algebra).
  ]
]

#lt-slide-back(title: "⚡ Định Luật De Morgan Kép")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-theorem(title: "De Morgan trong Logic Mệnh đề")[
        Phủ định của một liên từ hội/tuyển:
        $
          overline(P and Q) &equiv overline(P) or overline(Q) \
          overline(P or Q) &equiv overline(P) and overline(Q)
        $
        _Nói bằng lời:_ Phủ định của "và" thành "hoặc", phủ định của "hoặc" thành "và".
      ]
    ],
    [
      #lt-theorem(title: "De Morgan trong Phép toán Tập hợp")[
        Phần bù của giao/hợp hai tập hợp:
        $
          C_E (A cap B) &= C_E A cup C_E B \
          C_E (A cup B) &= C_E A cap C_E B
        $
        _Hình học:_ Phần ngoài của vùng chung bằng hợp hai phần ngoài riêng lẻ!
      ]
    ]
  )
  #v(0.3em)
  #lt-important(title: "Ứng dụng trong Giải toán")[
    Khi bài toán yêu cầu tìm điều kiện để $A cap B eq.not emptyset$ quá phức tạp, hãy tìm điều kiện để $A cap B = emptyset$ rồi lấy *phần bù* (phương pháp biến cố đối).
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: 3 BẪY TƯ DUY KINH ĐIỂN
// ════════════════════════════════════════════════
#lt-section-link("sec-bay-tu-duy", "⚠️", [II. 3 Bẫy tư duy kinh điển])

#lt-slide-back(title: [⚠️ Bẫy 1: Phủ Định Lượng Từ & Dấu Bất Đẳng Thức])[
  #lt-two-col(
    ratio: (48%, 52%),
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 13pt)[❌ SAI LẦM KINH ĐIỂN]
        #v(0.3em)
        - Phủ định của $forall$ đổi thành $forall$ phủ định đuôi.
        - Phủ định của ">" lại lấy "<" (bỏ quên dấu "=").
        - Phủ định của "Mọi học sinh đều giỏi" là "Mọi học sinh đều dốt".
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#16a34a"), size: 13pt)[✅ NGUYÊN TẮC VÀNG CHUẨN XÁC]
        #v(0.3em)
        - Lượng từ đảo ngược:
          $
            overline(forall x in X\, P(x)) &<=> exists x in X\, overline(P(x)) \
            overline(exists x in X\, P(x)) &<=> forall x in X\, overline(P(x))
          $
        - Dấu đảo ngược có bù:
          $
            overline("“" > "”") <=> "<=" quad | quad overline("“" >= "”") <=> "<"
          $
      ]
    ]
  )
  #v(0.3em)
  #lt-example(title: "Thực hành ngay")[
    Phủ định của $P: "“" forall x in RR, x^2 - 3x + 2 > 0 "”"$ là $overline(P): "“" exists x in RR, x^2 - 3x + 2 <= 0 "”"$.
  ]
]

#lt-slide-back(title: [⚠️ Bẫy 2: Phân Biệt Quan Hệ Thuộc ($in$) và Bao Hàm ($subset$)])[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #block(fill: rgb("#fefce8"), stroke: 1.5pt + rgb("#ca8a04"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#ca8a04"), size: 13pt)[1. Quan hệ thuộc ($in$)]
        #v(0.3em)
        - Giữa *Phần tử* và *Tập hợp*.
        - Ký hiệu: $x in A$.
        - _Ví dụ:_ $2 in {1; 2; 3}$.
        - ❌ Sai: ${2} in {1; 2; 3}$ (vì ${2}$ là tập hợp, không phải phần tử).
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 10pt, radius: 7pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 13pt)[2. Quan hệ bao hàm ($subset$)]
        #v(0.3em)
        - Giữa *Tập hợp* và *Tập hợp*.
        - Ký hiệu: $A subset B$.
        - _Ví dụ:_ ${2} subset {1; 2; 3}$.
        - ❌ Sai: $2 subset {1; 2; 3}$ (vì $2$ không có ngoặc nhọn).
      ]
    ]
  )
  #v(0.3em)
  #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 9pt, radius: 6pt, width: 100%)[
    #text(weight: "bold", fill: rgb("#1d4ed8"))[🎯 Hai chân lý cần khắc sâu:]
    1. $emptyset subset A$ luôn *ĐÚNG* với mọi tập hợp $A$.
    2. $A subset A$ luôn *ĐÚNG* với mọi tập hợp $A$.
  ]
]

#lt-slide-back(title: [⚠️ Bẫy 3: Tham Số $m$ — “Bẫy Tập Rỗng” & “Cuộc Chiến Mút”])[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-warning(title: "Cái Bẫy Tập Rỗng")[
        - Một khoảng $(a; b)$ chỉ tồn tại khi $a < b$. Nếu $a >= b$ thì tập hợp này là $emptyset$!
        - Trong bài toán tìm $m$ để $A subset B$, nếu $A = emptyset$ thì mệnh đề $emptyset subset B$ *luôn đúng*!\
        $arrow$ Không xét trường hợp $A = emptyset$ sẽ mất ngay một khoảng nghiệm của $m$.
      ]
    ],
    [
      #lt-warning(title: "Cuộc Chiến Điểm Mút")[
        Khi xét điều kiện $[a; b] subset (c; d)$:
        - Mút trái: $c < a$ (không được bằng vì $c in.not (c; d)$).
        - Mút phải: $b < d$ (không được bằng vì $d in.not (c; d)$).
        #v(0.2em)
        _Quy tắc thép:_ Tập con ngoặc vuông $[$ nằm trong tập mẹ ngoặc tròn $($ thì *tuyệt đối KHÔNG* có dấu bằng tại mút!
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN III: 3 DẠNG TOÁN TRỌNG TÂM
// ════════════════════════════════════════════════
#lt-section-link("sec-dang-toan-chinh", "🧩", [III. 3 Dạng toán trọng tâm])

#lt-slide-back(title: "🧩 Dạng 1: Kỹ Thuật Xây Dựng Phản Ví Dụ (Counterexample)")[
  #lt-two-col(
    ratio: (50%, 50%),
    [
      #lt-definition(title: "Sức mạnh của Phản ví dụ")[
        Để bác bỏ một khẳng định có dạng:
        $
          P: "“" forall x in X\, Q(x) "”"
        $
        Ta *không cần* giải bất phương trình phức tạp, chỉ cần tìm ra *duy nhất một phần tử* $x_0 in X$ sao cho $Q(x_0)$ là mệnh đề *SAI*.
        #v(0.2em)
        Phần tử $x_0$ đó gọi là một *phản ví dụ*.
      ]
    ],
    [
      #lt-example(title: "Ví dụ kinh điển")[
        Xét tính Đúng/Sai của mệnh đề:\
        $P: "“" forall n in NN, n^2 + n + 41 text(" là số nguyên tố") "”"$.
        #v(0.2em)
        #lt-solution[
          - Với $n = 0, 1, 2, ..., 39$: Biểu thức đều ra số nguyên tố.
          - Nhưng với $n = 41 in NN$:\
            $41^2 + 41 + 41 = 41 times 43$, chia hết cho $41$ nên là *hợp số*!
          $arrow$ $n = 41$ là phản ví dụ. Mệnh đề $P$ *SAI*.
        ]
      ]
    ]
  )
]

#lt-slide-back(title: "🧩 Dạng 2: Toán Thực Tế — Nguyên Lý Bao Hàm & Loại Trừ")[
  #lt-two-col(
    ratio: (52%, 48%),
    [
      #lt-theorem(title: "Công thức lực lượng 2 và 3 tập hợp")[
        1. *Hai tập hợp:* $|A cup B| = |A| + |B| - |A cap B|$\
        2. *Ba tập hợp (Inclusion - Exclusion):*\
        $ |A cup B cup C| = &|A| + |B| + |C| \
        &- (|A cap B| + |B cap C| + |C cap A|) + |A cap B cap C| $
      ]
      #v(0.15em)
      #lt-tip(title: "Chiến thuật Sơ đồ Venn")[
        *Điền từ trong ra ngoài:* Điền vùng $A cap B cap C$ trước, rồi đến giao 2 tập, cuối cùng điền phần riêng.
      ]
    ],
    [
      #align(center)[
        #block(fill: white, stroke: 1pt + rgb("#cbd5e1"), inset: 6pt, radius: 8pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"), size: 10.5pt)[Biểu đồ Venn 3 Tập hợp]
          #v(0.2em)
          #cetz.canvas({
            import cetz.draw: *
            // Vòng tròn A
            circle((-0.7, 0.5), radius: 1.1, fill: rgb(59, 130, 246, 25%), stroke: 1.2pt + rgb("#2563eb"))
            // Vòng tròn B
            circle((0.7, 0.5), radius: 1.1, fill: rgb(239, 68, 68, 25%), stroke: 1.2pt + rgb("#dc2626"))
            // Vòng tròn C
            circle((0, -0.5), radius: 1.1, fill: rgb(34, 197, 94, 25%), stroke: 1.2pt + rgb("#16a34a"))

            content((-1.4, 1.4), text(fill: rgb("#2563eb"), weight: "bold", size: 10pt)[$A$])
            content((1.4, 1.4), text(fill: rgb("#dc2626"), weight: "bold", size: 10pt)[$B$])
            content((0, -1.8), text(fill: rgb("#16a34a"), weight: "bold", size: 10pt)[$C$])
            content((0, 0.2), text(fill: rgb("#1e293b"), weight: "bold", size: 9pt)[$A cap B cap C$])
          })
        ]
      ]
    ]
  )
]

#lt-slide-back(title: [🧩 Dạng 3: Thuật Toán Giải Bài Toán Tham Số $m$])[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#2563eb"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1d4ed8"), size: 12.5pt)[1. Điều kiện $A cap B = emptyset$]
        #v(0.3em)
        Hai tập không giao nhau khi nằm tách biệt hoàn toàn về hai phía:
        - Hoặc $A$ ở bên trái $B$:
          $"mút phải" A <= "mút trái" B$
        - Hoặc $A$ ở bên phải $B$:
          $"mút phải" B <= "mút trái" A$
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 12.5pt)[2. Điều kiện $A cap B eq.not emptyset$]
        #v(0.3em)
        Thực hiện theo 2 cách:
        - *Cách 1 (Trực tiếp):* Cho các miền đan xen nhau.
        - *Cách 2 (Phần bù - Khuyên dùng):* Giải bài toán phủ định $A cap B = emptyset$, sau đó lấy phần bù trên trục số của $m$.
      ]
    ],
    [
      #block(fill: rgb("#f0fdf4"), stroke: 1.5pt + rgb("#16a34a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#15803d"), size: 12.5pt)[3. Điều kiện $A subset B$]
        #v(0.3em)
        Tập $A$ phải lọt trọn trong $B$:
        - Mút trái $A$ nằm bên trong mút trái $B$.
        - Mút phải $A$ nằm bên trong mút phải $B$.
        - _Lưu ý:_ Xét riêng trường hợp $A = emptyset$ trước!
      ]
    ]
  )
]

// ════════════════════════════════════════════════
// PHẦN IV: BÀI TẬP TRẮC NGHIỆM 4 LỰA CHỌN
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-tn", "🎯", [IV. Bài tập: Trắc nghiệm 4 Lựa chọn])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — TỔNG ÔN CHƯƠNG I],
  questions: (
    (num: 1, type: "TN", desc: [Mệnh đề Phủ định]),
    (num: 2, type: "TN", desc: [Xác định Số Phần tử]),
    (num: 3, type: "TN", desc: [Phép toán & Phần bù]),
    (num: 4, type: "TN", desc: [Toán Thực tế Venn]),
    (num: 5, type: "TN", desc: [Tìm m để giao rỗng]),
    (num: 6, type: "TN", desc: [Tập con có tham số m]),
    (num: 7, type: "DS", desc: [Đúng/Sai logic & tập hợp]),
    (num: 8, type: "TLN", desc: [Điền khuyết 3 tập hợp]),
    (num: 9, type: "TLN", desc: [Số giá trị nguyên của m]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Phủ định của mệnh đề $P: "“" forall x in RR, x^2 - x + 7 > 0 "”"$ là mệnh đề nào sau đây?],
  (
    [$overline(P): "“" forall x in RR, x^2 - x + 7 < 0 "”"$],
    [$overline(P): "“" exists x in RR, x^2 - x + 7 <= 0 "”"$],
    [$overline(P): "“" exists x in RR, x^2 - x + 7 < 0 "”"$],
    [$overline(P): "“" forall x in RR, x^2 - x + 7 <= 0 "”"$],
  ),
  correct: 2,
  num: 1,
  de: "Đề 01A — Mệnh đề Phủ định",
  loigiai: [
    Theo quy tắc phủ định mệnh đề chứa lượng từ:
    - Phủ định của lượng từ $forall$ là lượng từ $exists$.
    - Phủ định của dấu bất đẳng thức $>$ là dấu $<=$ (có chứa dấu bằng).
    Vậy $overline(P): "“" exists x in RR, x^2 - x + 7 <= 0 "”"$.
  ]
)

#lt-tn(
  [Cho tập hợp $A = {x in NN mid(|) (2x^2 - 5x + 2)(x^2 - 4) = 0}$. Số phần tử của tập hợp $A$ là:],
  (
    [$1$],
    [$2$],
    [$3$],
    [$4$],
  ),
  correct: 1,
  num: 2,
  de: "Đề 02A — Xác định Số Phần tử",
  loigiai: [
    Giải phương trình: $(2x^2 - 5x + 2)(x^2 - 4) = 0$\
    $arrow 2x^2 - 5x + 2 = 0 <=> x = 2$ hoặc $x = 1/2$.\
    $arrow x^2 - 4 = 0 <=> x = 2$ hoặc $x = -2$.\
    Tập nghiệm trên $RR$ là $S = {-2; 1/2; 2}$.\
    Vì đề bài yêu cầu $x in NN$ (số tự nhiên) nên ta chỉ nhận $x = 2$.\
    Vậy $A = {2}$, tập $A$ có đúng *$1$ phần tử*.
  ]
)

#lt-tn(
  [Cho hai tập hợp $A = [-2; 4)$ và $B = (0; 5]$. Xác định phần bù $C_RR (A cap B)$.],
  (
    [$(0; 4)$],
    [$( -infinity ; 0 ] cup [ 4 ; +infinity )$],
    [$( -infinity ; 0 ) cup [ 4 ; +infinity )$],
    [$[-2; 5]$],
  ),
  correct: 2,
  num: 3,
  de: "Đề 02B — Phép toán & Phần bù",
  loigiai: [
    - Bước 1: Tìm tập hợp giao $A cap B$.\
      Phần chung của $[-2; 4)$ và $(0; 5]$ là khoảng $(0; 4)$.
    - Bước 2: Tìm phần bù trong $RR$:\
      $C_RR (A cap B) = RR setminus (0; 4) = (-infinity; 0] cup [4; +infinity)$.\
      *(Lưu ý mút $0$ và $4$ chuyển thành ngoặc vuông do không thuộc $(0; 4)$).*
  ]
)

#lt-tn(
  [Lớp 10A có $40$ học sinh, trong đó có $26$ bạn đăng ký thi môn Toán, $18$ bạn đăng ký thi môn Tiếng Anh và $8$ bạn không thi môn nào. Hỏi có bao nhiêu bạn thi *cả hai môn*?],
  (
    [$10$],
    [$12$],
    [$14$],
    [$16$],
  ),
  correct: 2,
  num: 4,
  de: "Đề 02D — Toán Thực tế Venn",
  loigiai: [
    - Số HS thi ít nhất một môn: $|T cup A| = 40 - 8 = 32$ (học sinh).
    - Bao hàm - loại trừ: $|T cap A| = |T| + |A| - |T cup A| = 26 + 18 - 32 = 12$ (học sinh).
  ]
)

#lt-tn(
  [Cho hai tập hợp $A = (m - 1; 4]$ và $B = (-2; 2m + 2)$. Tìm tất cả giá trị thực của tham số $m$ để $A cap B = emptyset$.],
  (
    [$m <= -3$ hoặc $m >= 5$],
    [$-3 <= m <= 5$],
    [$m < -2$ hoặc $m > 4$],
    [$m <= -2$ hoặc $m >= 4$],
  ),
  correct: 1,
  num: 5,
  de: "Chuyên đề VDC — Giao Bằng Rỗng",
  loigiai: [
    - Nếu $A = emptyset <=> m - 1 >= 4 <=> m >= 5 arrow A cap B = emptyset$ (thỏa mãn).
    - Nếu $B = emptyset <=> 2m + 2 <= -2 <=> m <= -2 arrow A cap B = emptyset$ (thỏa mãn).
    - Khi $-2 < m < 5$: Cả hai tập khác rỗng, $A cap B = emptyset <=> 2m + 2 <= m - 1 <=> m <= -3$ (loại vì $m > -2$).
    Kết hợp lại ta được: $m <= -3$ hoặc $m >= 5$.
  ]
)

#lt-tn(
  [Cho hai khoảng $A = [m; m + 1]$ và $B = (-1; 3)$. Có bao nhiêu giá trị nguyên của $m$ để $A subset B$?],
  (
    [$1$],
    [$2$],
    [$3$],
    [$4$],
  ),
  correct: 2,
  num: 6,
  de: "Chuyên đề VDC — Tập Con Tham Số",
  loigiai: [
    Đoạn $A = [m; m + 1]$ luôn khác rỗng với mọi $m$. Để $A subset B = (-1; 3)$:\
    $cases(m > -1, m + 1 < 3) <=> -1 < m < 2$. Do $m in ZZ arrow m in {0; 1}$ (có đúng *$2$ giá trị*).
  ]
)

// ════════════════════════════════════════════════
// PHẦN V: BÀI TẬP ĐÚNG / SAI & ĐIỀN SỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-luyen-tap-ds-tln", "📝", [V. Bài tập: Đúng/Sai & Điền số])

#lt-ds(
  [Cho hai tập hợp $A = [m - 1; m + 3]$ và $B = (-3; 1)$. Xét tính Đúng / Sai của các mệnh đề sau:],
  (
    (body: [Khi $m = 0$ thì giao $A cap B = (-1; 1)$.], "true": false),
    (body: [Độ dài của đoạn $A$ luôn không đổi và bằng $4$ với mọi giá trị $m$.], "true": true),
    (body: [Không tồn tại giá trị nào của tham số $m$ để $A subset B$.], "true": true),
    (body: [Có đúng $8$ giá trị nguyên $m in [-10; 10]$ để $A cap B eq.not emptyset$.], "true": false),
  ),
  de: "Đề 02E — Câu hỏi Đúng/Sai Tổng Hợp",
  num: 7,
  loigiai: [
    - a) *Sai:* Khi $m = 0 arrow A = [-1; 3]$. Giao với $B = (-3; 1)$ là nửa khoảng $[-1; 1)$, lấy dấu ngoặc vuông tại $-1$.
    - b) *Đúng:* Độ dài đoạn $A$ là $(m + 3) - (m - 1) = 4$, độc lập với tham số $m$.
    - c) *Đúng:* Đoạn $A$ có độ dài 4, khoảng $B$ cũng có độ dài $1 - (-3) = 4$. Do $B$ là khoảng mở nên không thể chứa trọn một đoạn đóng cùng độ dài.
    - d) *Sai:* $A cap B = emptyset <=> m + 3 <= -3$ hoặc $m - 1 >= 1 <=> m <= -6$ hoặc $m >= 2$.\
      Do đó $A cap B eq.not emptyset <=> -6 < m < 2$. Các số nguyên $m in [-10; 10]$ là $\\{-5; -4; -3; -2; -1; 0; 1\\}$ (gồm đúng *$7$ giá trị*).
  ]
)

#lt-tln(
  [Khảo sát $100$ học sinh khối 10: Có $50$ bạn thích Bóng đá ($D$), $40$ bạn thích Bóng bàn ($B$), $35$ bạn thích Cầu lông ($C$); $20$ bạn thích cả $D$ và $B$; $15$ bạn thích cả $B$ và $C$; $12$ bạn thích cả $D$ và $C$; $8$ bạn thích cả ba môn. Hỏi có bao nhiêu học sinh *không thích bất kỳ môn nào* trong ba môn trên?],
  [14],
  num: 8,
  de: "Toán Thực Tế — Điền Khuyết 3 Tập Hợp",
  loigiai: [
    - Số HS thích ít nhất một môn theo nguyên lý bao hàm - loại trừ:\
      $|D cup B cup C| = 50 + 40 + 35 - (20 + 15 + 12) + 8 = 86$ (học sinh).
    - Số HS không thích môn nào: $100 - 86 = 14$ (học sinh).
  ]
)

#lt-tln(
  [Cho hai tập hợp $A = [m; m + 2]$ và $B = [1; 3]$. Có bao nhiêu giá trị nguyên của tham số $m in [-10; 10]$ để $A cap B eq.not emptyset$?],
  [5],
  num: 9,
  de: "Tham Số m — Trả lời ngắn VDC",
  loigiai: [
    - Xét bài toán phủ định $A cap B = emptyset <=> cases(m + 2 < 1, m > 3) <=> cases(m < -1, m > 3)$.
    - Lấy phần bù suy ra $A cap B eq.not emptyset <=> -1 <= m <= 3$.
    - Do $m in ZZ$ nên $m in {-1; 0; 1; 2; 3}$ (gồm đúng *$5$ giá trị nguyên*).
  ]
)

// ════════════════════════════════════════════════
// PHẦN VI: TỔNG KẾT & THÔNG ĐIỆP SƯ PHẠM
// ════════════════════════════════════════════════
#lt-section-link("sec-tong-ket-chuong", "💎", [VI. Tổng kết Chương I & Đúc kết])

#lt-slide-back(title: "🗺️ Ma Trận Tổng Kết Toàn Diện Chương I")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 10pt,
    column-gutter: 10pt,
    [
      #block(fill: rgb("#eff6ff"), stroke: 1.5pt + rgb("#1e3a8a"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#1e3a8a"), size: 12.5pt)[1. MỆNH ĐỀ & PHỦ ĐỊNH]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Khẳng định Đúng hoặc Sai.
          - Lượng từ $forall$ (mọi), $exists$ (tồn tại).
          - Phủ định đổi lượng từ và đảo chiều bất đẳng thức.
        ]
      ]
    ],
    [
      #block(fill: rgb("#f5f3ff"), stroke: 1.5pt + rgb("#7c3aed"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#7c3aed"), size: 12.5pt)[2. SUY LUẬN & ĐẢO]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Kéo theo: $P => Q$ (chỉ sai khi Đ $=>$ S).
          - Điều kiện cần và đủ ($P <=> Q$).
          - Phương pháp phản chứng và xây dựng phản ví dụ.
        ]
      ]
    ],
    [
      #block(fill: rgb("#ecfdf5"), stroke: 1.5pt + rgb("#059669"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#059669"), size: 12.5pt)[3. TẬP HỢP & TẬP CON]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Phần tử $x in A$, Tập con $A subset B$.
          - $emptyset$ là con của mọi tập hợp.
          - Tập $n$ phần tử có $2^n$ tập hợp con.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#ea580c"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#ea580c"), size: 12.5pt)[4. CÁC TẬP CON CỦA R]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Đoạn $[a; b]$, Khoảng $(a; b)$, Nửa khoảng.
          - Kỹ thuật biểu diễn trên trục số.
          - Gạch bỏ phần không thuộc tập hợp.
        ]
      ]
    ],
    [
      #block(fill: rgb("#fef2f2"), stroke: 1.5pt + rgb("#dc2626"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#dc2626"), size: 12.5pt)[5. CÁC PHÉP TOÁN]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Giao $cap$, Hợp $cup$, Hiệu $setminus$.
          - Phần bù $C_E A = E setminus A$.
          - Công thức bao hàm - loại trừ Venn.
        ]
      ]
    ],
    [
      #block(fill: rgb("#faf5ff"), stroke: 1.5pt + rgb("#9333ea"), inset: 8pt, radius: 6pt, width: 100%)[
        #text(weight: "bold", fill: rgb("#9333ea"), size: 12.5pt)[6. BÀI TOÁN THAM SỐ]
        #v(0.2em)
        #text(size: 10.5pt)[
          - Bẫy tập hợp rỗng ($a < b$).
          - Phân tích tương đối trên trục số.
          - Kiểm tra điểm mút biên cẩn thận.
        ]
      ]
    ]
  )
]

#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 28pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 24pt)[🎓 CHÚC MỪNG CÁC EM HOÀN THÀNH CHƯƠNG I!]\
      #v(0.6em)
      #text(fill: white, size: 15pt)[
        "Logic là nền tảng của tư duy phản biện, còn Tập hợp là ngôn ngữ của vũ trụ toán học."\
        Hãy tự tin bước vào #text(fill: rgb("#fde047"), weight: "bold")[Chương II: Bất Phương Trình Bậc Nhất Hai Ẩn]!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 13pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
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
