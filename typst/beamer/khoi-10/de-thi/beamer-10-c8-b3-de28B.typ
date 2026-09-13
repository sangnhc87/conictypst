// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 25: NHỊ THỨC NEWTON (ĐỀ SỐ 28B - VẬN DỤNG CAO & THỰC TIỄN)
// Lớp: Khối 10  ·  Mã đề: 180  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 25: NHỊ THỨC NEWTON (ĐỀ SỐ 28B - VẬN DỤNG CAO & THỰC TIỄN)",
  subtitle: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP — MÃ ĐỀ: 180",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 180]],
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

// TN 1 (Hệ số tích hai nhị thức)
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Tìm hệ số của số hạng chứa $x^2$ trong khai triển của đa thức $P(x) = (1 - x)^4 (1 + 2x)^5$.],
    (
        True([$6$]),
        [$10$],
        [$-6$],
        [$12$]
    ),
    loigiai: [
        Khai triển từng nhân tử theo công thức nhị thức Newton:
        - $(1 - x)^4 = C_4^0 - C_4^1 x + C_4^2 x^2 - C_4^3 x^3 + C_4^4 x^4 = 1 - 4x + 6x^2 - 4x^3 + x^4$
        - $(1 + 2x)^5 = C_5^0 + C_5^1 (2x) + C_5^2 (2x)^2 + ... = 1 + 10x + 40x^2 + ...$
        Số hạng chứa $x^2$ trong tích $P(x)$ được tạo thành từ các tích:
        $ 1 cdot (40x^2) + (-4x) cdot (10x) + (6x^2) cdot 1 = 40x^2 - 40x^2 + 6x^2 = 6x^2 $
        Vậy hệ số của số hạng chứa $x^2$ bằng $6$.
    ]
)

// TN 2 (Khai triển tam thức bậc 5)
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Tìm hệ số của số hạng chứa $x^3$ trong khai triển của đa thức $P(x) = (2 - x + x^2)^5$.],
    (
        True([$-200$]),
        [$-160$],
        [$-40$],
        [$200$]
    ),
    loigiai: [
        Viết $P(x) = [2 - (x - x^2)]^5$. Khai triển nhị thức Newton theo lũy thừa của $(x - x^2)$:
        $ P(x) = sum_(k=0)^5 C_5^k 2^(5 - k) (-1)^k (x - x^2)^k $
        Ta xét các số hạng có khả năng tạo ra $x^3$:
        - Với $k = 2$: $C_5^2 2^3 (-1)^2 (x - x^2)^2 = 80(x^2 - 2x^3 + x^4) =>$ số hạng chứa $x^3$ là $80(-2x^3) = -160x^3$.
        - Với $k = 3$: $C_5^3 2^2 (-1)^3 (x - x^2)^3 = -40(x^3 - 3x^4 + ...) =>$ số hạng chứa $x^3$ là $-40(x^3) = -40x^3$.
        - Với các giá trị $k$ khác: lũy thừa nhỏ nhất của $x$ trong $(x - x^2)^k$ là $x^k$, do đó $k >= 4$ có bậc từ 4 trở lên, $k <= 1$ có bậc tối đa là 2, không thể chứa $x^3$.
        Cộng hai kết quả trên:
        $ -160 - 40 = -200 $
        Vậy hệ số cần tìm là $-200$.
    ]
)

// TN 3 (Hệ số lớn nhất)
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Khai triển $(2 + 3x)^4 = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + a_4 x^4$. Giá trị lớn nhất trong các hệ số $a_k$ ($k in {0, 1, 2, 3, 4}$) bằng],
    (
        True([$216$]),
        [$96$],
        [$81$],
        [$144$]
    ),
    loigiai: [
        Ta tính cụ thể từng hệ số $a_k = C_4^k 2^(4 - k) 3^k$:
        - $a_0 = 2^4 = 16$
        - $a_1 = C_4^1 2^3 3^1 = 4 times 8 times 3 = 96$
        - $a_2 = C_4^2 2^2 3^2 = 6 times 4 times 9 = 216$
        - $a_3 = C_4^3 2^1 3^3 = 4 times 2 times 27 = 216$
        - $a_4 = 3^4 = 81$
        Hệ số lớn nhất đạt được là $a_2 = a_3 = 216$.
    ]
)

// TN 4 (Số hạng chứa 1/x^2)
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Trong khai triển của nhị thức $Q(x) = (2x - 1 / x)^4$ với $x != 0$, hệ số của số hạng chứa $1 / x^2$ bằng],
    (
        True([$-8$]),
        [$8$],
        [$24$],
        [$-24$]
    ),
    loigiai: [
        Số hạng tổng quát thứ $k + 1$ ($k in {0, 1, 2, 3, 4}$) là:
        $ T_(k + 1) = C_4^k (2x)^(4 - k) (-1 / x)^k = C_4^k cdot 2^(4 - k) cdot (-1)^k cdot x^(4 - 2k) $
        Số hạng chứa $1 / x^2 = x^(-2)$ tương ứng với số mũ:
        $ 4 - 2k = -2 <=> 2k = 6 <=> k = 3 $
        Hệ số tương ứng là:
        $ C_4^3 cdot 2^1 cdot (-1)^3 = 4 times 2 times (-1) = -8 $
    ]
)

// TN 5 (Tìm tham số a thỏa mãn tỉ lệ hệ số)
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Trong khai triển của nhị thức $(1 + a x)^5$, hệ số của số hạng chứa $x^2$ gấp $4$ lần hệ số của số hạng chứa $x$. Biết rằng $a > 0$, giá trị của $a$ bằng],
    (
        True([$2$]),
        [$1$],
        [$4$],
        [$1 / 2$]
    ),
    loigiai: [
        Trong khai triển $(1 + a x)^5$:
        - Hệ số của $x$ là: $C_5^1 a = 5a$.
        - Hệ số của $x^2$ là: $C_5^2 a^2 = 10a^2$.
        Theo giả thiết:
        $ 10a^2 = 4(5a) <=> 10a^2 = 20a $
        Vì $a > 0$, ta chia cả hai vế cho $10a$:
        $ a = 2 $
    ]
)

// TN 6 (Tính xấp xỉ sai số vi phân)
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Sử dụng khai triển nhị thức Newton đến số hạng bậc hai $(1 - alpha)^5 approx 1 - 5 alpha + 10 alpha^2$ để ước lượng giá trị của $0.98^5$. Kết quả nhận được là],
    (
        True([$0.904$]),
        [$0.900$],
        [$0.902$],
        [$0.908$]
    ),
    loigiai: [
        Viết $0.98 = 1 - 0.02$ với $alpha = 0.02$:
        $ 0.98^5 = (1 - 0.02)^5 approx 1 - 5(0.02) + 10(0.02)^2 $
        $ = 1 - 0.10 + 10(0.0004) = 0.90 + 0.004 = 0.904 $
    ]
)

// TN 7 (Số hạng nguyên trong căn thức)
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Khai triển biểu thức $(sqrt{3} - 1)^5$ thành dạng $A sqrt{3} - B$ với $A, B$ là các số nguyên dương. Giá trị của tổng $A + B$ bằng],
    (
        True([$120$]),
        [$116$],
        [$124$],
        [$110$]
    ),
    loigiai: [
        Khai triển $(sqrt{3} - 1)^5$ theo công thức nhị thức Newton:
        $ (sqrt{3} - 1)^5 = C_5^0 (sqrt{3})^5 - C_5^1 (sqrt{3})^4 + C_5^2 (sqrt{3})^3 - C_5^3 (sqrt{3})^2 + C_5^4 (sqrt{3}) - C_5^5 $
        Gom các số hạng chứa căn và số hạng nguyên:
        - Phần chứa $sqrt{3}$:
          $ C_5^0 (9 sqrt{3}) + C_5^2 (3 sqrt{3}) + C_5^4 (sqrt{3}) = 9 sqrt{3} + 30 sqrt{3} + 5 sqrt{3} = 44 sqrt{3} => A = 44 $
        - Phần nguyên âm:
          $ -[C_5^1 (9) + C_5^3 (3) + C_5^5 (1)] = -(45 + 30 + 1) = -76 => B = 76 $
        Do đó:
        $ A + B = 44 + 76 = 120 $
    ]
)

// TN 8 (Lãi kép tích lũy bậc 4)
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Một doanh nghiệp đầu tư $1$ tỷ đồng vào một dự án công nghệ với tốc độ tăng trưởng vốn bình quân $10%$/năm theo mô hình lãi kép tích lũy bậc bốn $S = 10^9 (1 + 0.1)^4$. Sau $4$ năm, tổng giá trị vốn thu về là],
    (
        True([$1464.1 text(" triệu đồng")$]),
        [$1400 text(" triệu đồng")$],
        [$1460 text(" triệu đồng")$],
        [$1500 text(" triệu đồng")$]
    ),
    loigiai: [
        Áp dụng khai triển $(1 + x)^4 = 1 + 4x + 6x^2 + 4x^3 + x^4$ với $x = 0.1$:
        $ (1 + 0.1)^4 = 1 + 4(0.1) + 6(0.01) + 4(0.001) + 0.0001 $
        $ = 1 + 0.4 + 0.06 + 0.004 + 0.0001 = 1.4641 $
        Tổng vốn thu về sau 4 năm là:
        $ 10^9 times 1.4641 = 1464100000 text(" đồng") = 1464.1 text(" triệu đồng") $
    ]
)

// TN 9 (Tổng tất cả hệ số)
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Cho đa thức $P(x) = (3x - 2)^5 = a_5 x^5 + a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Tổng tất cả các hệ số $a_5 + a_4 + a_3 + a_2 + a_1 + a_0$ bằng],
    (
        True([$1$]),
        [$243$],
        [$-1$],
        [$3125$]
    ),
    loigiai: [
        Tổng tất cả các hệ số của đa thức chính bằng giá trị của đa thức khi thay $x = 1$:
        $ P(1) = (3 cdot 1 - 2)^5 = 1^5 = 1 $
    ]
)

// TN 10 (Vị trí đạt hệ số lớn nhất)
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Trong khai triển của nhị thức $(3 + 2x)^5$, hệ số của số hạng chứa $x^k$ đạt giá trị lớn nhất khi $k$ bằng],
    (
        True([$2$]),
        [$1$],
        [$3$],
        [$4$]
    ),
    loigiai: [
        Hệ số của $x^k$ là: $a_k = C_5^k 3^(5 - k) 2^k$ ($k = 0, 1, 2, 3, 4, 5$).
        Tính giá trị từng hệ số:
        - $a_0 = 3^5 = 243$
        - $a_1 = C_5^1 3^4 2^1 = 5 times 81 times 2 = 810$
        - $a_2 = C_5^2 3^3 2^2 = 10 times 27 times 4 = 1080$
        - $a_3 = C_5^3 3^2 2^3 = 10 times 9 times 8 = 720$
        - $a_4 = C_5^4 3^1 2^4 = 5 times 3 times 16 = 240$
        - $a_5 = 2^5 = 32$
        Giá trị lớn nhất là $a_2 = 1080$, đạt được khi $k = 2$.
    ]
)

// TN 11 (Xác suất nhị thức Bernoulli bậc 5)
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Một học sinh làm bài thi trắc nghiệm gồm $5$ câu hỏi độc lập. Mỗi câu hỏi có $4$ phương án lựa chọn và chỉ có $1$ phương án đúng. Học sinh đó chọn ngẫu nhiên các câu trả lời. Xác suất để học sinh đó trả lời đúng đúng $3$ câu là],
    (
        True([$45 / 512$]),
        [$135 / 512$],
        [$15 / 128$],
        [$45 / 256$]
    ),
    loigiai: [
        Xác suất trả lời đúng mỗi câu là $p = 1 / 4$, xác suất sai là $q = 1 - p = 3 / 4$.
        Theo công thức xác suất nhị thức Bernoulli ứng với số hạng thứ tư trong khai triển $(3 / 4 + 1 / 4)^5$:
        $ P = C_5^3 p^3 q^2 = C_5^3 (1 / 4)^3 (3 / 4)^2 $
        $ = 10 times 1 / 64 times 9 / 16 = 90 / 1024 = 45 / 512 $
    ]
)

// TN 12 (Tổng hệ số bậc lẻ)
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Khai triển đa thức $(3x - 1)^4 = a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Tổng các hệ số bậc lẻ $a_1 + a_3$ bằng],
    (
        True([$-120$]),
        [$120$],
        [$-240$],
        [$136$]
    ),
    loigiai: [
        Đặt $P(x) = (3x - 1)^4$.
        - $P(1) = (3 - 1)^4 = 2^4 = 16 = a_4 + a_3 + a_2 + a_1 + a_0$
        - $P(-1) = (-3 - 1)^4 = (-4)^4 = 256 = a_4 - a_3 + a_2 - a_1 + a_0$
        Lấy $P(1) - P(-1)$:
        $ 16 - 256 = 2(a_3 + a_1) <=> -240 = 2(a_1 + a_3) <=> a_1 + a_3 = -120 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích toàn diện khai triển (3 + 2x)^5)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Cho khai triển $(3 + 2x)^5 = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + a_4 x^4 + a_5 x^5$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ số tự do của khai triển bằng $a_0 = 243$.]),
    True([Hệ số của số hạng chứa $x^2$ bằng $a_2 = 1080$.]),
    True([Hệ số lớn nhất trong các hệ số của khai triển là $a_2 = 1080$.]),
    [Tổng tất cả các hệ số của khai triển bằng $1024$.]
  ),
  loigiai: [
    #step([Xét ý a: Hệ số tự do])
    $a_0 = 3^5 = 243$. Mệnh đề a ĐÚNG.

    #step([Xét ý b và c: Tính a2 và hệ số lớn nhất])
    $a_2 = C_5^2 3^3 2^2 = 10 times 27 times 4 = 1080$.
    Các hệ số là $243, 810, 1080, 720, 240, 32$. Hệ số lớn nhất là $1080$. Mệnh đề b và c ĐÚNG.

    #step([Xét ý d: Tổng tất cả hệ số])
    Tổng bằng $P(1) = (3 + 2)^5 = 5^5 = 3125$ (chứ không phải $1024$).
    Khẳng định bằng $1024$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Khai triển có phân thức và triệt tiêu)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Xét biểu thức $P(x) = (2x - 1 / x)^4$ với $x != 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số hạng chính giữa của khai triển là số hạng không chứa biến $x$.]),
    True([Giá trị của số hạng không chứa biến $x$ bằng $24$.]),
    True([Hệ số của số hạng chứa $1 / x^2$ bằng $-8$.]),
    [Trong khai triển có chứa số hạng bậc nhất chứa $x$.]
  ),
  loigiai: [
    #step([Xét ý a và b: Số hạng không chứa x])
    Số hạng chính giữa là $T_3$ (ứng với $k = 2$):
    $ T_3 = C_4^2 (2x)^2 (-1 / x)^2 = 6 times 4 = 24 $. Mệnh đề a và b ĐÚNG.

    #step([Xét ý c: Số hạng chứa 1/x^2])
    Ứng với $k = 3$: $C_4^3 (2x)^1 (-1 / x)^3 = -8 / x^2$. Hệ số là $-8$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số hạng bậc nhất])
    Số mũ của $x$ là $4 - 2k$. Để bằng 1: $4 - 2k = 1 <=> 2k = 3 <=> k = 1.5 notin ZZ$.
    Do đó không có số hạng chứa $x$. Mệnh đề d SAI.
  ]
)

// DS 3 (Mô hình lãi kép tích lũy và so sánh xấp xỉ có CeTZ)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Một khoản tiền gửi tiết kiệm $S_0$ tăng trưởng sau $4$ năm với lãi suất $r = 8%$/năm ($r = 0.08$) theo công thức $S = S_0 (1 + r)^4$.
Khai triển nhị thức Newton cho ta: $(1 + r)^4 = 1 + 4 r + 6 r^2 + 4 r^3 + r^4$.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  // Trục hoành
  line((0, 0), (6, 0), stroke: 1pt + black, mark: (end: "stealth"))
  content((6.3, 0), [Năm])
  // Trục tung
  line((0, 0), (0, 3.5), stroke: 1pt + black, mark: (end: "stealth"))
  content((0, 3.8), [Giá trị $S/S_0$])
  
  // Các điểm năm 0, 1, 2, 3, 4
  for t in range(5) {
    line((t * 1.2, -0.1), (t * 1.2, 0.1), stroke: 0.8pt + black)
    content((t * 1.2, -0.3), [#t])
  }
  
  // Đường cong tăng trưởng thực tế
  bezier((0, 0.5), (4.8, 2.5), (2, 1.0), (3.5, 1.8), stroke: 1.5pt + teal)
  content((4.8, 2.8), [$(1 + 0.08)^t$], fill: teal)
  
  // Đường xấp xỉ tuyến tính
  line((0, 0.5), (4.8, 2.0), stroke: (dash: "dashed", paint: red, thickness: 1pt))
  content((3.5, 1.2), [Tuyến tính $1 + 4r$], fill: red)
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Giá trị xấp xỉ tuyến tính bậc nhất cho ta $(1 + 0.08)^4 approx 1 + 4(0.08) = 1.32$.]),
    True([Giá trị xấp xỉ bậc hai cho ta $(1 + 0.08)^4 approx 1 + 4(0.08) + 6(0.08)^2 = 1.3584$.]),
    True([Giá trị chính xác của $(1 + 0.08)^4$ lớn hơn giá trị xấp xỉ bậc hai một lượng bằng $4(0.08)^3 + (0.08)^4 approx 0.002089$.]),
    [Sai số tuyệt đối khi dùng xấp xỉ tuyến tính bậc nhất lớn hơn $0.1$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Các cấp xấp xỉ])
    - Bậc 1: $1 + 0.32 = 1.32$. Mệnh đề a ĐÚNG.
    - Bậc 2: $1.32 + 6(0.0064) = 1.32 + 0.0384 = 1.3584$. Mệnh đề b ĐÚNG.
    - Sai số còn lại là tổng các số hạng bậc 3 và 4: $4(0.08)^3 + (0.08)^4 = 0.002048 + 0.00004096 = 0.00208896$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Sai số bậc 1])
    Giá trị chính xác là $1.36048896$.
    Sai số bậc 1 là: $1.36048896 - 1.32 = 0.04048896 < 0.1$ (chứ không lớn hơn $0.1$).
    Khẳng định lớn hơn $0.1$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tích hai đa thức phức tạp)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Cho biểu thức $P(x) = (1 - x)^4 (1 + 2x)^5$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ số tự do của $P(x)$ bằng $1$.]),
    True([Hệ số của số hạng chứa $x$ trong khai triển bằng $6$.]),
    True([Hệ số của số hạng chứa $x^2$ trong khai triển bằng $6$.]),
    [Tổng tất cả các hệ số của đa thức $P(x)$ bằng $243$.]
  ),
  loigiai: [
    #step([Xét ý a: Hệ số tự do])
    $P(0) = (1)^4 (1)^5 = 1$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Hệ số của x])
    $(1 - 4x + ...)(1 + 10x + ...) => 1(10x) + (-4x)(1) = 6x$. Hệ số bằng $6$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Hệ số của x^2])
    Đã tính ở TN 1: $40 - 40 + 6 = 6$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng các hệ số])
    $P(1) = (1 - 1)^4 (1 + 2)^5 = 0^4 times 3^5 = 0$ (chứ không phải $243$).
    Khẳng định bằng $243$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Tìm hệ số của số hạng chứa $x^2$ trong khai triển của đa thức $P(x) = (1 - x)^4 (1 + 2x)^5$.],
    [6],
    loigiai: [
        #step([Tính toán])
        $40 - 40 + 6 = 6$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Tìm hệ số của số hạng chứa $x^3$ trong khai triển của đa thức $P(x) = (2 - x + x^2)^5$.],
    [-200],
    loigiai: [
        #step([Khai triển tam thức])
        $-160 - 40 = -200$.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Khai triển $(2 + 3x)^4 = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + a_4 x^4$. Giá trị lớn nhất trong các hệ số $a_k$ bằng bao nhiêu?],
    [216],
    loigiai: [
        #step([Hệ số lớn nhất])
        $a_2 = a_3 = 216$.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Trong khai triển của nhị thức $Q(x) = (2x - 1 / x)^4$ với $x != 0$, tìm số hạng không chứa biến $x$.],
    [24],
    loigiai: [
        #step([Số hạng chính giữa])
        $C_4^2 (2)^2 (-1)^2 = 6 times 4 = 24$.
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Trong khai triển $(1 + a x)^5$ với $a > 0$, hệ số của $x^2$ gấp $4$ lần hệ số của $x$. Tìm giá trị của $a$.],
    [2],
    loigiai: [
        #step([Phương trình])
        $10 a^2 = 20 a <=> a = 2$.
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 180], back-to: "sec-exercise-hub",[Khai triển đa thức $(3x - 1)^4 = a_4 x^4 + a_3 x^3 + a_2 x^2 + a_1 x + a_0$. Tính tổng các hệ số bậc lẻ $a_1 + a_3$.],
    [-120],
    loigiai: [
        #step([Bù trừ])
        $ (P(1) - P(-1)) / 2 = (16 - 256) / 2 = -120 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 25: NHỊ THỨC NEWTON (ĐỀ SỐ 28B - VẬN DỤNG CAO & THỰC TIỄN)!]      #v(0.6em)
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
