// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP CUỐI CHƯƠNG IX: TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 32C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 196  ·  GV: Nguyễn Văn Sang
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
  title: "ÔN TẬP CUỐI CHƯƠNG IX: TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 32C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN — MÃ ĐỀ: 196",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 196]],
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

// TN 1 (Đa giác đều 20 đỉnh - Tam giác nhọn chứa tâm có CeTZ)
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Cho đa giác đều gồm $20$ đỉnh nội tiếp trong một đường tròn tâm $O$. Chọn ngẫu nhiên $3$ đỉnh từ $20$ đỉnh của đa giác để tạo thành một tam giác. Xác suất để tam giác được tạo thành là một tam giác nhọn (chứa tâm $O$ ở miền trong tam giác) bằng],
    (
        True([$4 / 19$]),
        [$3 / 19$],
        [$5 / 19$],
        [$6 / 19$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp phần bù. Tổng số tam giác trừ đi số tam giác vuông (có 1 cạnh là đường kính) và số tam giác tù (có 1 góc tù).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1pt + gray)
          circle((0, 0), radius: 0.05, fill: black)
          content((0.2, 0.1), [$O$])
          // Tam giác nhọn chứa tâm O
          let p1 = (1.5 * calc.cos(60deg), 1.5 * calc.sin(60deg))
          let p2 = (1.5 * calc.cos(180deg), 1.5 * calc.sin(180deg))
          let p3 = (1.5 * calc.cos(300deg), 1.5 * calc.sin(300deg))
          line(p1, p2, p3, close: true, stroke: 1.2pt + accent, fill: rgb("fef3c7"))
          for i in range(20) {
            let a = i * 18deg
            circle((1.5 * calc.cos(a), 1.5 * calc.sin(a)), radius: 0.04, fill: gray)
          }
          content((0, -1.8), [Tam giác nhọn chứa tâm O])
        })
        ]
        - Không gian mẫu:
          $ |Omega| = C_20^3 = (20 times 19 times 18) / 6 = 1140 $
        - Số tam giác vuông: có $20 / 2 = 10$ đường kính, mỗi đường kính nối với 18 đỉnh còn lại:
          $ 10 times 18 = 180 text(" tam giác vuông") $
        - Số tam giác tù: Mỗi đỉnh làm đỉnh tù có $C_9^2 = 36$ tam giác, với 20 đỉnh:
          $ 20 times 36 = 720 text(" tam giác tù") $
        - Số tam giác nhọn:
          $ |A| = 1140 - (180 + 720) = 240 $
        - Xác suất:
          $ P(A) = 240 / 1140 = 4 / 19 $
    ]
)

// TN 2 (Cấp số cộng 3 số)
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Từ tập hợp các số tự nhiên $A = {1, 2, 3, ..., 16}$, chọn ngẫu nhiên đồng thời $3$ số. Xác suất để $3$ số được chọn có thể sắp xếp thành một cấp số cộng bằng],
    (
        True([$1 / 10$]),
        [$1 / 20$],
        [$3 / 20$],
        [$1 / 15$]
    ),
    loigiai: [
        *Phương pháp giải:* Ba số $(a, b, c)$ lập thành cấp số cộng khi và chỉ khi $a + c = 2b$, nghĩa là $a$ và $c$ phải có cùng tính chẵn lẻ.
        - Không gian mẫu: $|Omega| = C_16^3 = (16 times 15 times 14) / 6 = 560$.
        - Tập $A$ gồm $8$ số chẵn và $8$ số lẻ:
          + Chọn 2 số cùng chẵn: có $C_8^2 = 28$ cách (khi đó $b = (a + c) / 2$ xác định duy nhất).
          + Chọn 2 số cùng lẻ: có $C_8^2 = 28$ cách (khi đó $b = (a + c) / 2$ xác định duy nhất).
        - Tổng số cấp số cộng: $|A| = 28 + 28 = 56$.
        - Xác suất:
          $ P(A) = 56 / 560 = 1 / 10 $
    ]
)

// TN 3 (Bàn tròn 10 người không cạnh nhau có CeTZ)
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Mười người bạn (trong đó có An và Bình) ngồi ngẫu nhiên quanh một chiếc bàn tròn gồm $10$ ghế cách đều nhau. Xác suất để hai bạn An và Bình không ngồi cạnh nhau trên bàn tròn bằng],
    (
        True([$7 / 9$]),
        [$2 / 9$],
        [$4 / 5$],
        [$3 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Cố định vị trí của An tại 1 ghế trên bàn tròn, sau đó tính xác suất để Bình không ngồi vào 2 ghế kề bên An.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1pt + gray)
          // Ghế của An ở đỉnh
          circle((0, 1.5), radius: 0.15, fill: rgb("fed7aa"), stroke: 1pt + accent)
          content((0, 1.5), text(size: 7pt, [An]))
          // 2 ghế kề bên (đỏ)
          let a1 = 90deg + 36deg
          let a2 = 90deg - 36deg
          circle((1.5 * calc.cos(a1), 1.5 * calc.sin(a1)), radius: 0.12, fill: rgb("fee2e2"), stroke: 1pt + red)
          circle((1.5 * calc.cos(a2), 1.5 * calc.sin(a2)), radius: 0.12, fill: rgb("fee2e2"), stroke: 1pt + red)
          content((0, -1.8), [An cố định, 2 ghế kề bị cấm])
        })
        ]
        - Khi An đã ngồi vào một ghế cố định, xung quanh bàn tròn còn lại $9$ chiếc ghế trống.
        - Trong 9 ghế trống này, có đúng $2$ chiếc ghế nằm liền kề bên trái và bên phải của An.
        - Do đó, có $9 - 2 = 7$ chiếc ghế mà nếu Bình ngồi vào thì An và Bình sẽ không ngồi cạnh nhau.
        - Xác suất cần tìm:
          $ P = 7 / 9 $
    ]
)

// TN 4 (Chia 8 người vào 4 phòng thi)
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Chia ngẫu nhiên $8$ học sinh (trong đó có An và Bình) vào $4$ phòng thi độc lập, mỗi phòng thi có đúng $2$ chỗ ngồi. Xác suất để hai bạn An và Bình được xếp vào cùng một phòng thi bằng],
    (
        True([$1 / 7$]),
        [$1 / 4$],
        [$2 / 7$],
        [$1 / 8$]
    ),
    loigiai: [
        *Phương pháp giải:* Cố định bạn An vào một phòng thi bất kỳ. Phòng thi đó chỉ còn đúng 1 chỗ trống duy nhất trong tổng số 7 chỗ trống còn lại.
        - Sau khi An đã vào phòng, còn lại $7$ chỗ ngồi trống cho $7$ bạn còn lại.
        - Để Bình ở cùng phòng với An, Bình phải được xếp vào đúng vị trí trống còn lại duy nhất của phòng An.
        Xác suất cần tìm là:
        $ P = 1 / 7 $
    ]
)

// TN 5 (Nghiệm nguyên không âm có chặn trên)
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Chọn ngẫu nhiên một bộ ba nghiệm nguyên không âm $(x_1, x_2, x_3)$ của phương trình $x_1 + x_2 + x_3 = 9$. Xác suất để bộ nghiệm được chọn thỏa mãn điều kiện $x_1 <= 4$ bằng],
    (
        True([$8 / 11$]),
        [$3 / 11$],
        [$1 / 2$],
        [$7 / 11$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối $overline(A)$: "Nghiệm thỏa mãn $x_1 >= 5$". Đổi biến $x_1' = x_1 - 5 >= 0$.
        - Tổng số nghiệm nguyên không âm của $x_1 + x_2 + x_3 = 9$:
          $ |Omega| = C_(9 + 3 - 1)^2 = C_11^2 = (11 times 10) / 2 = 55 $
        - Số nghiệm có $x_1 >= 5$:
          Đặt $x_1' = x_1 - 5 >= 0$, đưa về phương trình: $x_1' + x_2 + x_3 = 4$.
          Số nghiệm: $C_(4 + 3 - 1)^2 = C_6^2 = 15$.
        - Số nghiệm thỏa mãn $x_1 <= 4$:
          $ |A| = 55 - 15 = 40 $
        - Xác suất:
          $ P(A) = 40 / 55 = 8 / 11 $
    ]
)

// TN 6 (Đổi vở 5 bạn có đúng 1 bạn nhận đúng vở)
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Năm bạn học sinh nộp vở bài tập cho thầy giáo. Thầy giáo phát ngẫu nhiên mỗi bạn một cuốn vở từ $5$ cuốn vở đó. Xác suất để có đúng một bạn nhận đúng cuốn vở của chính mình bằng],
    (
        True([$3 / 8$]),
        [$1 / 5$],
        [$9 / 24$],
        [$11 / 24$]
    ),
    loigiai: [
        *Phương pháp giải:* Chọn 1 bạn nhận đúng vở của mình ($C_5^1 = 5$), 4 bạn còn lại phải nhận sai vở (hoán vị không điểm cố định $D_4 = 9$).
        - Không gian mẫu: $|Omega| = 5! = 120$.
        - Chọn 1 bạn nhận đúng: có $C_5^1 = 5$ cách.
        - Bốn bạn còn lại không bạn nào nhận đúng vở của mình:
          $ D_4 = 4! (1 - 1 + 1 / 2 - 1 / 6 + 1 / 24) = 9 $
        - Số kết quả thuận lợi: $|A| = 5 times 9 = 45$.
        - Xác suất:
          $ P(A) = 45 / 120 = 3 / 8 $
    ]
)

// TN 7 (Lưới tọa độ tránh điểm tâm)
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Một con kiến di chuyển trên lưới ô vuông từ điểm $O(0, 0)$ đến điểm $B(4, 4)$ bằng các bước đi sang phải một đơn vị hoặc đi lên một đơn vị. Biết điểm $A(2, 2)$ có bẫy dính nên kiến không được đi qua. Giả sử các lộ trình từ $O$ đến $B$ là đồng khả năng. Xác suất để kiến chọn được một lộ trình an toàn từ $O$ đến $B$ bằng],
    (
        True([$17 / 35$]),
        [$18 / 35$],
        [$1 / 2$],
        [$16 / 35$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp đếm bằng phần bù. Lấy tổng số lộ trình từ $O$ đến $B$ trừ đi số lộ trình đi qua điểm bẫy $A(2, 2)$.
        - Tổng số lộ trình từ $O(0, 0)$ đến $B(4, 4)$ (4 bước phải, 4 bước lên):
          $ |Omega| = C_8^4 = (8 times 7 times 6 times 5) / 24 = 70 $
        - Số lộ trình đi qua $A(2, 2)$:
          + Từ $O(0, 0)$ đến $A(2, 2)$: $C_4^2 = 6$ cách.
          + Từ $A(2, 2)$ đến $B(4, 4)$: $C_4^2 = 6$ cách.
          Số lộ trình qua $A$: $6 times 6 = 36$.
        - Số lộ trình an toàn tránh bẫy $A$:
          $ |A| = 70 - 36 = 34 $
        - Xác suất:
          $ P = 34 / 70 = 17 / 35 $
    ]
)

// TN 8 (Tổng 3 số chia hết cho 3 từ 1 đến 30)
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Từ tập hợp $S = {1, 2, 3, ..., 30}$, chọn ngẫu nhiên đồng thời $3$ số. Xác suất để tổng của $3$ số được chọn là một số chia hết cho $3$ bằng],
    (
        True([$68 / 203$]),
        [$1 / 3$],
        [$67 / 203$],
        [$34 / 105$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân hoạch tập $S$ thành 3 lớp thặng dư theo modulo 3, mỗi lớp có đúng $10$ số: $S_0, S_1, S_2$.
        - Không gian mẫu: $|Omega| = C_30^3 = (30 times 29 times 28) / 6 = 4060$.
        - Tổng 3 số chia hết cho 3 khi:
          + Cả 3 số cùng thuộc một lớp: $3 times C_10^3 = 3 times 120 = 360$ cách.
          + Mỗi lớp 1 số: $C_10^1 times C_10^1 times C_10^1 = 10 times 10 times 10 = 1000$ cách.
        - Số kết quả thuận lợi: $|A| = 360 + 1000 = 1360$.
        - Xác suất:
          $ P(A) = 1360 / 4060 = 68 / 203 $
    ]
)

// TN 9 (Gieo 3 xúc xắc có tổng bằng 9)
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Gieo đồng thời ba con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên ba con xúc xắc bằng $9$ bằng],
    (
        True([$25 / 216$]),
        [$1 / 8$],
        [$27 / 216$],
        [$23 / 216$]
    ),
    loigiai: [
        *Phương pháp giải:* Tìm số nghiệm của $x_1 + x_2 + x_3 = 9$ với $1 <= x_i <= 6$.
        - Đổi biến $y_i = x_i - 1$ ($0 <= y_i <= 5$), đưa về phương trình $y_1 + y_2 + y_3 = 6$.
        - Tổng số nghiệm nguyên không âm: $C_(6 + 3 - 1)^2 = C_8^2 = 28$.
        - Trừ đi các nghiệm vi phạm có $y_i >= 6$ (chỉ có các bộ $(6, 0, 0), (0, 6, 0), (0, 0, 6)$ gồm đúng $3$ bộ).
        - Số kết quả thuận lợi: $|A| = 28 - 3 = 25$.
        - Không gian mẫu: $|Omega| = 6^3 = 216$.
        - Xác suất:
          $ P(A) = 25 / 216 $
    ]
)

// TN 10 (Hai đường chéo bát giác đều cắt nhau)
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Cho một bát giác đều có $8$ đỉnh. Chọn ngẫu nhiên $2$ đường chéo của bát giác. Xác suất để hai đường chéo được chọn cắt nhau tại một điểm nằm ở miền trong của bát giác bằng],
    (
        True([$7 / 19$]),
        [$5 / 19$],
        [$1 / 2$],
        [$9 / 19$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi bộ $4$ đỉnh bất kỳ của đa giác lồi xác định đúng $1$ giao điểm của $2$ đường chéo nằm ở miền trong của đa giác.
        - Số đoạn thẳng nối 2 đỉnh: $C_8^2 = 28$. Trừ đi 8 cạnh, số đường chéo là: $28 - 8 = 20$.
        - Không gian mẫu chọn 2 đường chéo:
          $ |Omega| = C_20^2 = (20 times 19) / 2 = 190 $
        - Mỗi cách chọn 4 đỉnh từ 8 đỉnh cho đúng 1 cặp đường chéo cắt nhau bên trong:
          Số cặp đường chéo cắt nhau: $|A| = C_8^4 = (8 times 7 times 6 times 5) / 24 = 70$.
        - Xác suất:
          $ P(A) = 70 / 190 = 7 / 19 $
    ]
)

// TN 11 (Bàn tròn 6 nam 4 nữ - Nữ không cạnh nhau)
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Xếp ngẫu nhiên $6$ bạn nam và $4$ bạn nữ ngồi quanh một chiếc bàn tròn gồm $10$ ghế cách đều nhau. Xác suất để không có bất kỳ hai bạn nữ nào ngồi cạnh nhau trên bàn tròn bằng],
    (
        True([$5 / 42$]),
        [$1 / 14$],
        [$1 / 7$],
        [$5 / 84$]
    ),
    loigiai: [
        *Phương pháp giải:* Xếp 6 bạn nam quanh bàn tròn trước (có $(6 - 1)! = 120$ cách), tạo ra 6 khoảng trống. Sau đó chọn và xếp thứ tự 4 bạn nữ vào 6 khoảng trống này.
        - Không gian mẫu xếp 10 người quanh bàn tròn: $|Omega| = (10 - 1)! = 9! = 362880$.
        - Xếp 6 nam quanh bàn tròn: có $(6 - 1)! = 5! = 120$ cách, tạo ra 6 khoảng trống giữa các bạn nam.
        - Xếp 4 nữ vào 6 khoảng trống: có $A_6^4 = 6 times 5 times 4 times 3 = 360$ cách.
        - Số kết quả thuận lợi: $|A| = 120 times 360 = 43200$.
        - Xác suất:
          $ P(A) = 43200 / 362880 = 5 / 42 $
    ]
)

// TN 12 (Tổng số chấm là bội của 4)
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên hai con xúc xắc là một bội số của $4$ bằng],
    (
        True([$1 / 4$]),
        [$7 / 36$],
        [$2 / 9$],
        [$5 / 18$]
    ),
    loigiai: [
        *Phương pháp giải:* Tổng số chấm trên 2 con xúc xắc nằm trong đoạn $[2, 12]$. Các bội số của 4 có thể đạt được là ${4, 8, 12}$.
        - Tổng = 4: $(1, 3), (2, 2), (3, 1)$ ($3$ kết quả).
        - Tổng = 8: $(2, 6), (3, 5), (4, 4), (5, 3), (6, 2)$ ($5$ kết quả).
        - Tổng = 12: $(6, 6)$ ($1$ kết quả).
        - Số kết quả thuận lợi: $|A| = 3 + 5 + 1 = 9$.
        - Xác suất:
          $ P = 9 / 36 = 1 / 4 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đa giác đều 20 đỉnh)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Cho đa giác đều gồm $20$ đỉnh nội tiếp trong đường tròn tâm $O$. Chọn ngẫu nhiên $3$ đỉnh lập thành tam giác.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $1140$.]),
    True([Số tam giác vuông có $3$ đỉnh là đỉnh của đa giác bằng $180$.]),
    True([Xác suất để tam giác được tạo thành là tam giác nhọn bằng $4 / 19$.]),
    [Số tam giác tù có $3$ đỉnh là đỉnh của đa giác bằng $600$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Các loại tam giác])
    - Không gian mẫu: $C_20^3 = 1140$. Mệnh đề a ĐÚNG.
    - Tam giác vuông: $10 times 18 = 180$. Mệnh đề b ĐÚNG.
    - Tam giác nhọn: $1140 - (180 + 720) = 240 => P = 240 / 1140 = 4 / 19$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tam giác tù])
    Số tam giác tù bằng $20 times C_9^2 = 20 times 36 = 720$ (chứ không phải $600$). Mệnh đề d SAI.
  ]
)

// DS 2 (Bàn tròn 10 người)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Xếp ngẫu nhiên $10$ người (trong đó có An và Bình) ngồi quanh một bàn tròn gồm $10$ ghế.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách xếp $10$ người quanh bàn tròn bằng $362880$ cách.]),
    True([Số cách xếp sao cho An và Bình ngồi cạnh nhau bằng $80640$ cách.]),
    True([Xác suất để An và Bình không ngồi cạnh nhau bằng $7 / 9$.]),
    [Xác suất để An và Bình ngồi đối diện nhau qua tâm bàn tròn bằng $1 / 10$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Vị trí An và Bình])
    - Không gian mẫu: $(10 - 1)! = 9! = 362880$. Mệnh đề a ĐÚNG.
    - Cạnh nhau: $(9 - 1)! times 2! = 8! times 2 = 80640$. Mệnh đề b ĐÚNG.
    - Không cạnh nhau: $1 - 80640 / 362880 = 1 - 2 / 9 = 7 / 9$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đối diện nhau])
    Cố định An có 9 ghế còn lại, chỉ có 1 ghế đối diện An. Xác suất là $1 / 9$ (chứ không phải $1 / 10$). Mệnh đề d SAI.
  ]
)

// DS 3 (Phương trình nghiệm nguyên cận trên)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Xét phương trình $x_1 + x_2 + x_3 = 9$ với $x_1, x_2, x_3 in NN$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số nghiệm nguyên không âm của phương trình bằng $55$.]),
    True([Số nghiệm thỏa mãn $x_1 >= 5$ bằng $15$.]),
    True([Xác suất để một nghiệm nguyên không âm ngẫu nhiên thỏa mãn $x_1 <= 4$ bằng $8 / 11$.]),
    [Số nghiệm nguyên dương ($x_i >= 1$) của phương trình bằng $36$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đếm nghiệm])
    - Không âm: $C_11^2 = 55$. Mệnh đề a ĐÚNG.
    - $x_1 >= 5$: $C_6^2 = 15$. Mệnh đề b ĐÚNG.
    - $x_1 <= 4$: $(55 - 15) / 55 = 40 / 55 = 8 / 11$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Nghiệm nguyên dương])
    $C_(9 - 1)^(3 - 1) = C_8^2 = 28$ (chứ không phải $36$). Mệnh đề d SAI.
  ]
)

// DS 4 (Hai đường chéo bát giác đều)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Xét bát giác đều $8$ đỉnh và tập hợp tất cả các đường chéo của nó.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số đường chéo của bát giác đều bằng $20$.]),
    True([Số cách chọn $2$ đường chéo bất kỳ từ tập các đường chéo bằng $190$.]),
    True([Số cặp đường chéo cắt nhau tại một điểm ở miền trong bát giác bằng $70$.]),
    [Xác suất để hai đường chéo được chọn không cắt nhau ở miền trong bằng $7 / 19$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đường chéo cắt nhau])
    - Số đường chéo: $C_8^2 - 8 = 20$. Mệnh đề a ĐÚNG.
    - Chọn 2 đường chéo: $C_20^2 = 190$. Mệnh đề b ĐÚNG.
    - Cắt nhau miền trong: $C_8^4 = 70$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Không cắt nhau miền trong])
    Xác suất không cắt nhau: $1 - 70 / 190 = 120 / 190 = 12 / 19$ (chứ không phải $7 / 19$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Từ $20$ đỉnh của đa giác đều, có bao nhiêu tam giác nhọn được tạo thành?],
    [240],
    loigiai: [
        #step([Số tam giác nhọn])
        $ 1140 - (180 + 720) = 240 $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Từ tập ${1, 2, ..., 16}$, chọn ngẫu nhiên $3$ số. Tính xác suất để $3$ số lập thành cấp số cộng (dưới dạng phân số tối giản).],
    [1/10],
    loigiai: [
        #step([Tính xác suất])
        $ 56 / 560 = 1 / 10 $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Xếp $10$ người quanh bàn tròn. Tính xác suất để An và Bình không ngồi cạnh nhau (dưới dạng phân số tối giản).],
    [7/9],
    loigiai: [
        #step([Tính xác suất])
        $ 7 / 9 $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Chia $8$ người vào $4$ phòng thi (mỗi phòng $2$ người). Tính xác suất để An và Bình ở cùng một phòng (dưới dạng phân số tối giản).],
    [1/7],
    loigiai: [
        #step([Tính xác suất])
        $ 1 / 7 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Đổi ngẫu nhiên vở kiểm tra của $5$ bạn. Tính xác suất có đúng một bạn nhận đúng vở của mình (dưới dạng phân số tối giản).],
    [3/8],
    loigiai: [
        #step([Derangement])
        $ (5 times 9) / 120 = 45 / 120 = 3 / 8 $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 196], back-to: "sec-exercise-hub",[Xếp $6$ nam và $4$ nữ quanh bàn tròn. Tính xác suất để không có hai nữ nào ngồi cạnh nhau (dưới dạng phân số tối giản).],
    [5/42],
    loigiai: [
        #step([Tính xác suất])
        $ (120 times 360) / 362880 = 5 / 42 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP CUỐI CHƯƠNG IX: TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 32C - NÂNG CAO & VDC)!]      #v(0.6em)
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
