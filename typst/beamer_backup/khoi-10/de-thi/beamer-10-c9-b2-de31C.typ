// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 27: THỰC HÀNH TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 31C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 193  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 27: THỰC HÀNH TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 31C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN — MÃ ĐỀ: 193",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 193]],
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

// TN 1 (Đa giác đều 24 đỉnh - Tam giác đều có CeTZ)
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Cho đa giác đều gồm $24$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $24$ đỉnh của đa giác để tạo thành một tam giác. Xác suất để tam giác được tạo thành là một tam giác đều bằng],
    (
        True([$1 / 253$]),
        [$1 / 506$],
        [$3 / 253$],
        [$1 / 2024$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số tổ hợp chập 3 của 24 đỉnh. Số tam giác đều có đỉnh là đỉnh của đa giác đều $n$ đỉnh (với $n$ chia hết cho 3) bằng $n / 3$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1pt + gray)
          circle((0, 0), radius: 0.05, fill: black)
          // Vẽ tam giác đều nội tiếp
          let p1 = (1.5 * calc.cos(90deg), 1.5 * calc.sin(90deg))
          let p2 = (1.5 * calc.cos(210deg), 1.5 * calc.sin(210deg))
          let p3 = (1.5 * calc.cos(330deg), 1.5 * calc.sin(330deg))
          line(p1, p2, p3, close: true, stroke: 1.2pt + accent, fill: rgb("fef3c7"))
          for i in range(24) {
            let a = i * 15deg
            circle((1.5 * calc.cos(a), 1.5 * calc.sin(a)), radius: 0.04, fill: gray)
          }
          content((0, -1.8), [Tam giác đều từ 24 đỉnh đa giác])
        })
        ]
        - Không gian mẫu:
          $ |Omega| = C_24^3 = (24 times 23 times 22) / 6 = 2024 $
        - Số tam giác đều: $24 / 3 = 8$ tam giác.
        - Xác suất:
          $ P(A) = 8 / 2024 = 1 / 253 $
    ]
)

// TN 2 (Tích 3 số chia hết cho 6 bằng PIE)
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Từ tập hợp $S = {1, 2, 3, ..., 20}$, chọn ngẫu nhiên đồng thời $3$ số. Xác suất để tích của $3$ số được chọn là một số chia hết cho $6$ bằng],
    (
        True([$691 / 1140$]),
        [$449 / 1140$],
        [$2 / 3$],
        [$1 / 2$]
    ),
    loigiai: [
        *Phương pháp giải:* Tích 3 số chia hết cho 6 khi và chỉ khi tích đó đồng thời chia hết cho 2 và chia hết cho 3. Sử dụng nguyên lý bù trừ PIE tính xác suất của biến cố đối (không chia hết cho 2 hoặc không chia hết cho 3).
        - Không gian mẫu: $|Omega| = C_20^3 = (20 times 19 times 18) / 6 = 1140$.
        - Gọi $E$ là biến cố tích không chia hết cho 2 (cả 3 số đều lẻ):
          Tập có 10 số lẻ => $|E| = C_10^3 = 120$.
        - Gọi $F$ là biến cố tích không chia hết cho 3 (không chứa bội số của 3):
          Các bội của 3 là ${3, 6, 9, 12, 15, 18}$ (6 số). Chọn 3 số từ 14 số còn lại:
          $|F| = C_14^3 = 364$.
        - $E inter F$ là biến cố cả 3 số đều lẻ và không chia hết cho 3:
          Các số thỏa mãn: ${1, 5, 7, 11, 13, 17, 19}$ (7 số).
          $|E inter F| = C_7^3 = 35$.
        - Số kết quả không chia hết cho 6:
          $ |E cup F| = 120 + 364 - 35 = 449 $
        - Số kết quả tích chia hết cho 6:
          $ |A| = 1140 - 449 = 691 $
        - Xác suất:
          $ P(A) = 691 / 1140 $
    ]
)

// TN 3 (Bàn tròn 4 cặp vợ chồng có CeTZ)
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Xếp ngẫu nhiên $4$ cặp vợ chồng (tổng cộng $8$ người) ngồi quanh một chiếc bàn tròn gồm $8$ ghế cách đều nhau. Xác suất để mỗi cặp vợ chồng đều ngồi cạnh nhau trên bàn tròn bằng],
    (
        True([$2 / 105$]),
        [$1 / 105$],
        [$4 / 105$],
        [$1 / 35$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp buộc phần tử cho hoán vị vòng quanh (bàn tròn). Buộc mỗi cặp vợ chồng thành một khối.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1.2pt + gray)
          for i in range(4) {
            let a1 = i * 90deg + 20deg
            let a2 = i * 90deg + 70deg
            circle((1.5 * calc.cos(a1), 1.5 * calc.sin(a1)), radius: 0.15, fill: rgb("fed7aa"), stroke: 1pt + accent)
            circle((1.5 * calc.cos(a2), 1.5 * calc.sin(a2)), radius: 0.15, fill: rgb("dbeafe"), stroke: 1pt + blue)
            arc((0, 0), radius: 1.7, start: a1, delta: 50deg, stroke: 0.8pt + accent)
          }
          content((0, 0), [4 cặp vợ chồng])
        })
        ]
        - Không gian mẫu xếp 8 người quanh bàn tròn:
          $ |Omega| = (8 - 1)! = 7! = 5040 $
        - Coi mỗi cặp vợ chồng là một khối liên kết: có 4 khối.
          Số cách xếp 4 khối quanh bàn tròn: $(4 - 1)! = 3! = 6$ cách.
        - Mỗi cặp vợ chồng có $2! = 2$ cách đổi chỗ nội bộ: có $2^4 = 16$ cách.
        - Số kết quả thuận lợi: $|A| = 6 times 16 = 96$.
        - Xác suất:
          $ P(A) = 96 / 5040 = 2 / 105 $
    ]
)

// TN 4 (Tứ giác không chứa cạnh đa giác 12 đỉnh)
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Cho đa giác đều có $12$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $4$ đỉnh từ $12$ đỉnh của đa giác để tạo thành một tứ giác lồi. Xác suất để tứ giác được tạo thành không chứa bất kỳ cạnh nào của đa giác đều bằng],
    (
        True([$7 / 33$]),
        [$1 / 5$],
        [$8 / 33$],
        [$2 / 11$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức chọn $k$ đỉnh từ đa giác đều $n$ đỉnh sao cho không có 2 đỉnh nào kề nhau: $N = n / (n - k) C_(n - k)^k$ với $n = 12, k = 4$.
        - Không gian mẫu: $|Omega| = C_12^4 = 495$.
        - Số tứ giác không chứa cạnh của đa giác:
          $ |A| = 12 / (12 - 4) C_(12 - 4)^4 = 12 / 8 C_8^4 = 3 / 2 times 70 = 105 $
        - Xác suất:
          $ P(A) = 105 / 495 = 7 / 33 $
    ]
)

// TN 5 (Phương trình nghiệm nguyên có chặn trên)
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Chọn ngẫu nhiên một bộ ba nghiệm nguyên dương $(x_1, x_2, x_3)$ của phương trình $x_1 + x_2 + x_3 = 11$. Xác suất để bộ nghiệm được chọn thỏa mãn điều kiện $1 <= x_1, x_2, x_3 <= 5$ bằng],
    (
        True([$1 / 3$]),
        [$4 / 9$],
        [$2 / 9$],
        [$5 / 9$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng bài toán chia kẹo Euler kết hợp nguyên lý bù trừ PIE loại bỏ các nghiệm có $x_i >= 6$.
        - Số nghiệm nguyên dương ($x_i >= 1$):
          $ |Omega| = C_(11 - 1)^(3 - 1) = C_10^2 = 45 $
        - Số nghiệm có ít nhất một biến $x_i >= 6$:
          Chọn biến vi phạm có $C_3^1 = 3$ cách.
          Đặt $x_1' = x_1 - 5 >= 1$, phương trình thành $x_1' + x_2 + x_3 = 6$.
          Số nghiệm: $C_(6 - 1)^(3 - 1) = C_5^2 = 10$.
          Số nghiệm vi phạm: $3 times 10 = 30$.
        - Số nghiệm thỏa mãn $1 <= x_i <= 5$:
          $ |A| = 45 - 30 = 15 $
        - Xác suất:
          $ P(A) = 15 / 45 = 1 / 3 $
    ]
)

// TN 6 (Số 5 chữ số không có hai chữ số chẵn cạnh nhau)
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Từ tập hợp $A = {1, 2, 3, 4, 5}$, lập ngẫu nhiên một số tự nhiên gồm $5$ chữ số đôi một khác nhau. Xác suất để số được lập không có hai chữ số chẵn nào đứng cạnh nhau bằng],
    (
        True([$3 / 5$]),
        [$2 / 5$],
        [$1 / 2$],
        [$7 / 10$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp vách ngăn. Có 3 chữ số lẻ ${1, 3, 5}$ và 2 chữ số chẵn ${2, 4}$. Xếp 3 chữ số lẻ trước để tạo ra 4 khoảng trống, sau đó xếp 2 chữ số chẵn vào các khoảng trống.
        - Không gian mẫu: $|Omega| = 5! = 120$.
        - Xếp 3 chữ số lẻ: có $3! = 6$ cách, tạo ra 4 khoảng trống.
        - Xếp 2 chữ số chẵn vào 4 khoảng trống: có $A_4^2 = 12$ cách.
        - Số kết quả thuận lợi: $|A| = 6 times 12 = 72$.
        - Xác suất:
          $ P(A) = 72 / 120 = 3 / 5 $
    ]
)

// TN 7 (Gieo 4 con xúc xắc có tổng bằng 14)
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Gieo đồng thời bốn con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên mặt trên của bốn con xúc xắc bằng $14$ bằng],
    (
        True([$73 / 648$]),
        [$35 / 324$],
        [$1 / 9$],
        [$71 / 648$]
    ),
    loigiai: [
        *Phương pháp giải:* Tìm số nghiệm nguyên thỏa mãn $x_1 + x_2 + x_3 + x_4 = 14$ với $1 <= x_i <= 6$ bằng phương pháp hàm sinh hoặc nguyên lý bù trừ PIE.
        - Đổi biến $y_i = x_i - 1$ ($0 <= y_i <= 5$), đưa về $y_1 + y_2 + y_3 + y_4 = 10$.
        - Tổng số nghiệm không âm: $C_(10 + 4 - 1)^3 = C_13^3 = 286$.
        - Trừ đi các trường hợp có ít nhất một $y_i >= 6$:
          Chọn biến vi phạm có $C_4^1 = 4$ cách. Đặt $y_1' = y_1 - 6 >= 0$, đưa về $y_1' + y_2 + y_3 + y_4 = 4$.
          Số nghiệm: $C_(4 + 4 - 1)^3 = C_7^3 = 35$.
          Số nghiệm vi phạm: $4 times 35 = 140$.
        - Số nghiệm thỏa mãn: $|A| = 286 - 140 = 146$.
        - Không gian mẫu: $|Omega| = 6^4 = 1296$.
        - Xác suất:
          $ P(A) = 146 / 1296 = 73 / 648 $
    ]
)

// TN 8 (Chia sinh viên vào 3 phòng thi)
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Xếp ngẫu nhiên $10$ sinh viên (trong đó có An và Bình) vào $3$ phòng thi: Phòng $A$ chứa đúng $4$ sinh viên, phòng $B$ chứa đúng $3$ sinh viên và phòng $C$ chứa đúng $3$ sinh viên. Xác suất để An và Bình cùng được xếp vào phòng $A$ bằng],
    (
        True([$2 / 15$]),
        [$1 / 15$],
        [$1 / 5$],
        [$4 / 15$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số cách phân bổ 10 người vào 3 phòng thi có số lượng ghế quy định $C_10^4 times C_6^3 times C_3^3$. Biến cố thuận lợi là xếp sẵn An và Bình vào phòng A, sau đó chọn thêm 2 người từ 8 người còn lại cho phòng A.
        - Không gian mẫu: $|Omega| = C_10^4 times C_6^3 = 210 times 20 = 4200$.
        - Số cách xếp An và Bình vào phòng A:
          + Chọn thêm 2 bạn trong 8 bạn còn lại vào phòng A: $C_8^2 = 28$ cách.
          + Chọn 3 bạn trong 6 bạn còn lại vào phòng B: $C_6^3 = 20$ cách.
          + Ba bạn còn lại vào phòng C: $C_3^3 = 1$ cách.
          Số kết quả thuận lợi: $|A| = 28 times 20 times 1 = 560$.
        - Xác suất:
          $ P(A) = 560 / 4200 = 2 / 15 $
    ]
)

// TN 9 (Hoán vị có đúng 2 điểm cố định)
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Cho tập hợp $X = {1, 2, 3, 4, 5}$. Chọn ngẫu nhiên một hoán vị $(a_1, a_2, a_3, a_4, a_5)$ của tập $X$. Xác suất để hoán vị được chọn có đúng hai phần tử đứng đúng vị trí ban đầu (tức có đúng hai chỉ số $i$ sao cho $a_i = i$) bằng],
    (
        True([$1 / 6$]),
        [$1 / 12$],
        [$1 / 4$],
        [$1 / 3$]
    ),
    loigiai: [
        *Phương pháp giải:* Chọn 2 phần tử đứng đúng vị trí cố định ($C_5^2 = 10$), 3 phần tử còn lại phải là một hoán vị không điểm cố định (Derangement $D_3 = 2$).
        - Không gian mẫu: $|Omega| = 5! = 120$.
        - Số cách chọn 2 phần tử đứng đúng vị trí: $C_5^2 = 10$.
        - Ba phần tử còn lại không có phần tử nào đứng đúng vị trí:
          $ D_3 = 3! (1 - 1 + 1 / 2 - 1 / 6) = 2 $
        - Số kết quả thuận lợi: $|A| = 10 times 2 = 20$.
        - Xác suất:
          $ P(A) = 20 / 120 = 1 / 6 $
    ]
)

// TN 10 (Chữ số chẵn lẻ xen kẽ)
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Từ tập hợp các chữ số ${1, 2, 3, 4, 5, 6}$, lập ngẫu nhiên một số tự nhiên gồm $6$ chữ số đôi một khác nhau. Xác suất để số được lập có các chữ số chẵn và chữ số lẻ xen kẽ nhau bằng],
    (
        True([$1 / 10$]),
        [$1 / 20$],
        [$1 / 5$],
        [$1 / 36$]
    ),
    loigiai: [
        *Phương pháp giải:* Có 3 chữ số chẵn và 3 chữ số lẻ. Cấu trúc xen kẽ có 2 dạng: (Chẵn - Lẻ - Chẵn - Lẻ - Chẵn - Lẻ) hoặc ngược lại.
        - Không gian mẫu: $|Omega| = 6! = 720$.
        - Mỗi dạng có $3!$ cách xếp số chẵn và $3!$ cách xếp số lẻ:
          Số kết quả thuận lợi: $|A| = 2 times (3!)^2 = 2 times 36 = 72$.
        - Xác suất:
          $ P(A) = 72 / 720 = 1 / 10 $
    ]
)

// TN 11 (Xác suất 3 điểm tạo thành tam giác vuông cân trong đa giác đều 16 đỉnh)
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Cho đa giác đều có $16$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $16$ đỉnh. Xác suất để $3$ đỉnh được chọn tạo thành một tam giác vuông cân bằng],
    (
        True([$1 / 35$]),
        [$2 / 35$],
        [$1 / 70$],
        [$4 / 35$]
    ),
    loigiai: [
        *Phương pháp giải:* Tam giác vuông cân nội tiếp có cạnh huyền là đường kính qua tâm và đỉnh góc vuông nằm trên đường trung trực của đường kính đó.
        - Không gian mẫu: $|Omega| = C_16^3 = (16 times 15 times 14) / 6 = 560$.
        - Có $16 / 2 = 8$ đường kính. Với mỗi đường kính, đường trung trực cắt đường tròn tại 2 đỉnh đối xứng, tạo thành 2 tam giác vuông cân:
          Số tam giác vuông cân: $|A| = 8 times 2 = 16$.
        - Xác suất:
          $ P(A) = 16 / 560 = 1 / 35 $
    ]
)

// TN 12 (Xác suất tổng số chấm 3 xúc xắc bằng 10)
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Gieo đồng thời ba con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên ba con xúc xắc bằng $10$ bằng],
    (
        True([$1 / 8$]),
        [$27 / 216$],
        [$25 / 216$],
        [$7 / 54$]
    ),
    loigiai: [
        *Phương pháp giải:* Tìm số nghiệm của $x_1 + x_2 + x_3 = 10$ với $1 <= x_i <= 6$.
        - Đổi biến $y_i = x_i - 1$ ($0 <= y_i <= 5$), đưa về $y_1 + y_2 + y_3 = 7$.
        - Tổng số nghiệm không âm: $C_(7 + 3 - 1)^2 = C_9^2 = 36$.
        - Trừ đi trường hợp có biến vi phạm $y_i >= 6$:
          Có 3 cách chọn biến vi phạm, phương trình còn $y_1' + y_2 + y_3 = 1$ (có $C_3^2 = 3$ nghiệm).
          Số nghiệm vi phạm: $3 times 3 = 9$ (hoặc xét biến vi phạm $y_1 >= 6$ thì $y_1 = 6, 7$: với $y_1 = 6$ có $(6,1,0), (6,0,1)$ là 2 nghiệm; với $y_1 = 7$ có $(7,0,0)$ là 1 nghiệm => 3 nghiệm cho mỗi biến, 3 biến có 9 nghiệm).
        - Số kết quả thuận lợi: $36 - 9 = 27$.
        - Xác suất:
          $ P = 27 / 216 = 1 / 8 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đa giác đều 24 đỉnh)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Cho đa giác đều gồm $24$ đỉnh nội tiếp trong đường tròn. Chọn ngẫu nhiên $3$ đỉnh để lập thành một tam giác.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $2024$.]),
    True([Số tam giác đều có $3$ đỉnh là đỉnh của đa giác bằng $8$.]),
    True([Xác suất để tam giác được tạo thành là tam giác đều bằng $1 / 253$.]),
    [Số tam giác vuông có $3$ đỉnh là đỉnh của đa giác bằng $240$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tam giác đều])
    - Không gian mẫu: $C_24^3 = 2024$. Mệnh đề a ĐÚNG.
    - Tam giác đều: $24 / 3 = 8$. Mệnh đề b ĐÚNG.
    - Xác suất: $8 / 2024 = 1 / 253$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tam giác vuông])
    Có $24 / 2 = 12$ đường kính, mỗi đường kính nối với 22 đỉnh còn lại:
    Số tam giác vuông: $12 times 22 = 264$ (chứ không phải $240$). Mệnh đề d SAI.
  ]
)

// DS 2 (Bàn tròn 4 cặp vợ chồng)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Xếp ngẫu nhiên $4$ cặp vợ chồng ($8$ người) ngồi quanh một chiếc bàn tròn gồm $8$ ghế cách đều nhau.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách xếp $8$ người quanh bàn tròn bằng $5040$ cách.]),
    True([Số cách xếp sao cho mỗi cặp vợ chồng đều ngồi cạnh nhau bằng $96$ cách.]),
    True([Xác suất để mỗi cặp vợ chồng đều ngồi cạnh nhau bằng $2 / 105$.]),
    [Xác suất để có ít nhất một cặp vợ chồng ngồi cạnh nhau nhỏ hơn $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Cặp vợ chồng cạnh nhau])
    - Không gian mẫu: $(8 - 1)! = 7! = 5040$. Mệnh đề a ĐÚNG.
    - Buộc 4 cặp: $(4 - 1)! times 2^4 = 6 times 16 = 96$. Mệnh đề b ĐÚNG.
    - Xác suất: $96 / 5040 = 2 / 105$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Ít nhất 1 cặp cạnh nhau])
    Áp dụng nguyên lý bù trừ PIE, xác suất có ít nhất 1 cặp ngồi cạnh nhau xấp xỉ $0.65 > 0.50$.
    Khẳng định nhỏ hơn $0.50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Phương trình nghiệm nguyên cận trên)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Xét phương trình $x_1 + x_2 + x_3 = 11$ với $x_1, x_2, x_3 in NN^*$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số nghiệm nguyên dương của phương trình bằng $45$.]),
    True([Số nghiệm thỏa mãn điều kiện $1 <= x_1, x_2, x_3 <= 5$ bằng $15$.]),
    True([Xác suất để một nghiệm nguyên dương ngẫu nhiên thỏa mãn $1 <= x_1, x_2, x_3 <= 5$ bằng $1 / 3$.]),
    [Số nghiệm thỏa mãn có ít nhất một biến $x_i >= 6$ bằng $25$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đếm nghiệm])
    - Nguyên dương: $C_10^2 = 45$. Mệnh đề a ĐÚNG.
    - $1 <= x_i <= 5$: $45 - 30 = 15$. Mệnh đề b ĐÚNG.
    - Xác suất: $15 / 45 = 1 / 3$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Có biến >= 6])
    Số nghiệm có ít nhất một biến $x_i >= 6$ bằng $30$ (chứ không phải $25$). Mệnh đề d SAI.
  ]
)

// DS 4 (Tập hoán vị và điểm cố định)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Xét tập hợp tất cả các hoán vị của $5$ phần tử ${1, 2, 3, 4, 5}$. Chọn ngẫu nhiên một hoán vị.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số hoán vị bằng $120$.]),
    True([Số hoán vị không có bất kỳ phần tử nào đứng đúng vị trí ban đầu bằng $44$.]),
    True([Số hoán vị có đúng $2$ phần tử đứng đúng vị trí ban đầu bằng $20$.]),
    [Xác suất để một hoán vị có đúng $4$ phần tử đứng đúng vị trí ban đầu bằng $1 / 24$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Hoán vị và điểm cố định])
    - Tổng: $5! = 120$. Mệnh đề a ĐÚNG.
    - Không điểm cố định: $D_5 = 44$. Mệnh đề b ĐÚNG.
    - Đúng 2 điểm cố định: $C_5^2 times D_3 = 10 times 2 = 20$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Đúng 4 điểm cố định])
    Nếu có 4 điểm đứng đúng vị trí thì điểm thứ 5 bắt buộc cũng phải đứng đúng vị trí (không thể có đúng 4 điểm cố định).
    Số hoán vị có đúng 4 điểm cố định bằng 0, xác suất bằng 0. Khẳng định bằng $1 / 24$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Từ $24$ đỉnh của đa giác đều, có bao nhiêu tam giác đều được tạo thành?],
    [8],
    loigiai: [
        #step([Số tam giác đều])
        $ 24 / 3 = 8 $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Từ tập ${1, 2, ..., 20}$, chọn ngẫu nhiên $3$ số. Tính xác suất để tích $3$ số chia hết cho $6$ (dưới dạng phân số tối giản).],
    [691/1140],
    loigiai: [
        #step([Tính xác suất])
        $ 691 / 1140 $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Xếp $4$ cặp vợ chồng quanh bàn tròn. Tính xác suất để mỗi cặp vợ chồng đều ngồi cạnh nhau (dưới dạng phân số tối giản).],
    [2/105],
    loigiai: [
        #step([Tính xác suất])
        $ 96 / 5040 = 2 / 105 $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Từ $12$ đỉnh của đa giác đều, có bao nhiêu tứ giác lồi không chứa bất kỳ cạnh nào của đa giác?],
    [105],
    loigiai: [
        #step([Công thức đỉnh không kề])
        $ 12 / 8 times C_8^4 = 105 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Phương trình $x_1 + x_2 + x_3 = 11$ có bao nhiêu bộ nghiệm nguyên thỏa mãn $1 <= x_1, x_2, x_3 <= 5$?],
    [15],
    loigiai: [
        #step([Bù trừ cận trên])
        $ 45 - 30 = 15 $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 193], back-to: "sec-exercise-hub",[Gieo $3$ con xúc xắc cân đối. Tính xác suất để tổng số chấm xuất hiện bằng $10$ (dưới dạng phân số tối giản).],
    [1/8],
    loigiai: [
        #step([Tính xác suất])
        $ 27 / 216 = 1 / 8 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 27: THỰC HÀNH TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 31C - NÂNG CAO & VDC)!]      #v(0.6em)
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
