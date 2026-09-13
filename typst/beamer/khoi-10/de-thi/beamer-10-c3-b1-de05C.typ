// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 5: GIÁ TRỊ LƯỢNG GIÁC CỦA MỘT GÓC TỪ 0° ĐẾN 180° (ĐỀ SỐ 3)
// Lớp: Khối 10  ·  Mã đề: 103  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 5: GIÁ TRỊ LƯỢNG GIÁC CỦA MỘT GÓC TỪ 0° ĐẾN 180° (ĐỀ SỐ 3)",
  subtitle: "ÔN TẬP CHƯƠNG 3 — MÃ ĐỀ: 103",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 103]],
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

// TN 1: Giá trị lượng giác bằng 0
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc $alpha$ thỏa mãn $0^circ <= alpha <= 180^circ$ và $sin alpha = 0$. Khẳng định nào sau đây đúng?],
    (
        [$alpha = 90^circ$],
        [$alpha = 0^circ$],
        [$alpha = 180^circ$],
        True([$alpha = 0^circ$ hoặc $alpha = 180^circ$])
    ),
    loigiai: [
        Trên nửa đường tròn đơn vị ($y >= 0$), tung độ $y_0 = sin alpha = 0$ khi và chỉ khi điểm biểu diễn nằm trên trục hoành, tương ứng với hai mút của đường kính:
        - Điểm $(1; 0)$ ứng với góc $alpha = 0^circ$.
        - Điểm $(- 1; 0)$ ứng với góc $alpha = 180^circ$.
        Vậy $alpha = 0^circ$ hoặc $alpha = 180^circ$.
    ]
)

// TN 2: Cosin bằng -1
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc $alpha$ ($0^circ <= alpha <= 180^circ$) thỏa mãn $cos alpha = - 1$. Số đo của góc $alpha$ là:],
    (
        [$alpha = 0^circ$],
        [$alpha = 90^circ$],
        True([$alpha = 180^circ$]),
        [$alpha = 120^circ$]
    ),
    loigiai: [
        Hoành độ $x_0 = cos alpha = - 1$ chỉ đạt được tại điểm duy nhất $(- 1; 0)$ trên nửa đường tròn đơn vị, tương ứng với góc $alpha = 180^circ$.
    ]
)

// TN 3: Tính giá trị biểu thức tích chéo đặc biệt
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Giá trị của biểu thức $A = sin 30^circ dot cos 60^circ + cos 30^circ dot sin 60^circ$ bằng:],
    (
        [$0$],
        [$1/2$],
        True([$1$]),
        [$sqrt(3)/2$]
    ),
    loigiai: [
        Thay các giá trị lượng giác đặc biệt:
        - $sin 30^circ = 1/2$, $cos 60^circ = 1/2$.
        - $cos 30^circ = sqrt(3)/2$, $sin 60^circ = sqrt(3)/2$.
        Khi đó:
        $ A = (1/2) dot (1/2) + (sqrt(3)/2) dot (sqrt(3)/2) = 1/4 + 3/4 = 1 $
    ]
)

// TN 4: Hằng đẳng thức lượng giác cơ bản
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Đẳng thức nào sau đây luôn đúng với mọi góc $alpha$ ($0^circ <= alpha <= 180^circ$)?],
    (
        [$sin alpha + cos alpha = 1$],
        True([$sin^2 alpha + cos^2 alpha = 1$]),
        [$sin^2 alpha - cos^2 alpha = 1$],
        [$sin(2 alpha) = 2 sin alpha$]
    ),
    loigiai: [
        Với mọi điểm $M(x_0; y_0)$ nằm trên đường tròn đơn vị tâm $O(0;0)$ bán kính $R = 1$:
        $ x_0^2 + y_0^2 = R^2 <=> cos^2 alpha + sin^2 alpha = 1 $
    ]
)

// TN 5: Rút gọn tan * cos
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Với mọi góc $alpha != 90^circ$ ($0^circ <= alpha <= 180^circ$), biểu thức $P = tan alpha dot cos alpha$ bằng biểu thức nào sau đây?],
    (
        [$cos alpha$],
        True([$sin alpha$]),
        [$1$],
        [$cot alpha$]
    ),
    loigiai: [
        Theo định nghĩa của tang: $tan alpha = sin alpha / cos alpha$.
        Do đó:
        $ P = tan alpha dot cos alpha = (sin alpha / cos alpha) dot cos alpha = sin alpha $
    ]
)

// TN 6: Tính cot khi biết cos nhọn
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc nhọn $alpha$ thỏa mãn $cos alpha = 3/5$. Giá trị của $cot alpha$ bằng:],
    (
        [$4/5$],
        [$4/3$],
        True([$3/4$]),
        [$5/3$]
    ),
    loigiai: [
        Vì $alpha$ là góc nhọn nên $sin alpha > 0$:
        $ sin alpha = sqrt(1 - cos^2 alpha) = sqrt(1 - (3/5)^2) = 4/5 $
        Khi đó:
        $ cot alpha = cos alpha / sin alpha = (3/5) / (4/5) = 3/4 $
    ]
)

// TN 7: Rút gọn biểu thức góc bù
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Rút gọn biểu thức $S = 1 - sin^2(180^circ - alpha)$ ta được kết quả là:],
    (
        [$sin^2 alpha$],
        [$- cos^2 alpha$],
        True([$cos^2 alpha$]),
        [$1 + sin^2 alpha$]
    ),
    loigiai: [
        Áp dụng công thức góc bù $sin(180^circ - alpha) = sin alpha$:
        $ S = 1 - sin^2 alpha = cos^2 alpha $
    ]
)

// TN 8: Dấu trong tam giác tù
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác tù $A B C$ có góc $hat(A) > 90^circ$. Khẳng định nào sau đây về dấu của các giá trị lượng giác là đúng?],
    (
        [$cos A > 0, cos B > 0, cos C > 0$],
        True([$cos A < 0, cos B > 0, cos C > 0$]),
        [$cos A < 0, cos B < 0, cos C > 0$],
        [$sin A < 0, sin B > 0, sin C > 0$]
    ),
    loigiai: [
        Trong tam giác tù $A B C$ có $hat(A) > 90^circ$:
        - Góc $A$ là góc tù nên $cos A < 0$ (và $sin A > 0$).
        - Hai góc $B$ và $C$ bắt buộc phải là các góc nhọn (vì tổng ba góc bằng $180^circ$), do đó $cos B > 0$ và $cos C > 0$.
    ]
)

// TN 9: Tổng bình phương sin bước nhảy 10 độ
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Giá trị của biểu thức $C = sin^2 10^circ + sin^2 20^circ + sin^2 30^circ + dots + sin^2 90^circ$ (gồm 9 số hạng) bằng:],
    (
        [$4$],
        [$4.5$],
        True([$5$]),
        [$6$]
    ),
    loigiai: [
        Ta nhóm các cặp góc có tổng bằng $90^circ$ ($sin(90^circ - x) = cos x$):
        - $sin^2 10^circ + sin^2 80^circ = sin^2 10^circ + cos^2 10^circ = 1$.
        - $sin^2 20^circ + sin^2 70^circ = sin^2 20^circ + cos^2 20^circ = 1$.
        - $sin^2 30^circ + sin^2 60^circ = sin^2 30^circ + cos^2 30^circ = 1$.
        - $sin^2 40^circ + sin^2 50^circ = sin^2 40^circ + cos^2 40^circ = 1$.
        Số hạng còn lại là $sin^2 90^circ = 1^2 = 1$.
        Tổng là: $C = 1 + 1 + 1 + 1 + 1 = 5$.
    ]
)

// TN 10: Tính cos^2 khi biết tan = 3
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc $alpha$ thỏa mãn $tan alpha = 3$. Giá trị của $cos^2 alpha$ bằng:],
    (
        [$1/9$],
        True([$1/10$]),
        [$9/10$],
        [$1/4$]
    ),
    loigiai: [
        Áp dụng công thức:
        $ 1 + tan^2 alpha = 1 / (cos^2 alpha) <=> 1 + 3^2 = 1 / (cos^2 alpha) <=> 10 = 1 / (cos^2 alpha) <=> cos^2 alpha = 1/10 $
    ]
)

// TN 11: Góc giữa hai cạnh tam giác đều
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác đều $A B C$. Côsin của góc giữa hai cạnh $A B$ và $A C$ bằng bao nhiêu?],
    (
        [$sqrt(3)/2$],
        True([$1/2$]),
        [$sqrt(2)/2$],
        [$- 1/2$]
    ),
    loigiai: [
        Tam giác $A B C$ đều nên góc giữa hai cạnh $A B$ và $A C$ chính là góc $hat(B A C) = 60^circ$.
        Do đó: $cos hat(B A C) = cos 60^circ = 1/2$.
    ]
)

// TN 12: Thực tế máy bay cất cánh
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một máy bay cất cánh từ đường băng với góc nâng không đổi $alpha = 20^circ$ so với mặt đất nằm ngang. Sau khi máy bay bay được quãng đường thẳng dài $3000" m"$, độ cao của máy bay so với mặt đất xấp xỉ bằng bao nhiêu mét?],
    (
        [$1000" m"$],
        True([$1026" m"$]),
        [$1098" m"$],
        [$2819" m"$]
    ),
    loigiai: [
        Gọi độ cao của máy bay là $h$.
        Trong tam giác vuông tạo bởi đường bay, mặt đất và phương thẳng đứng:
        $ h = 3000 dot sin 20^circ approx 3000 dot 0.34202 = 1026.06" m" approx 1026" m" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát góc khi biết sin = 1/3
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc $alpha$ thỏa mãn $0^circ < alpha < 180^circ$ và $sin alpha = 1/3$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Có đúng hai giá trị của góc $alpha$ thỏa mãn điều kiện đề bài (một góc nhọn và một góc tù).]),
    True([Nếu $alpha$ là góc nhọn thì $cos alpha = (2 sqrt(2))/3$.]),
    False([Nếu $alpha$ là góc tù thì $cos alpha = (2 sqrt(2))/3$.]),
    True([Trong mọi trường hợp thỏa mãn đề bài, ta đều có $cos^2 alpha = 8/9$ và $tan^2 alpha = 1/8$.])
  ),
  loigiai: [
    #step([Số lượng góc thỏa mãn])
    Đường thẳng nằm ngang $y = 1/3$ cắt nửa đường tròn đơn vị tại đúng 2 điểm phân biệt: một điểm có hoành độ dương ($alpha_1 < 90^circ$) và một điểm có hoành độ âm ($alpha_2 > 90^circ$). Vậy a) Đúng.
    
    #step([Tính cos cho từng trường hợp])
    $cos^2 alpha = 1 - sin^2 alpha = 1 - (1/3)^2 = 8/9$.
    - Khi $alpha$ nhọn: $cos alpha = sqrt(8/9) = (2 sqrt(2))/3$. Vậy b) Đúng.
    - Khi $alpha$ tù: $cos alpha = - sqrt(8/9) = - (2 sqrt(2))/3$ (phải mang dấu âm). Vậy c) Sai.
    
    #step([Kiểm tra bình phương])
    $tan^2 alpha = (sin^2 alpha) / (cos^2 alpha) = (1/9) / (8/9) = 1/8$. Do đó d) Đúng.
  ]
)

// DS 2: Đẳng thức góc trong tam giác nhọn
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho tam giác nhọn $A B C$. Xét tính đúng sai của các đẳng thức lượng giác sau:],
  (
    True([$sin(A + B) = sin C$.]),
    True([$cos(B + C) = - cos A$.]),
    True([$sin((A + B)/2) = cos(C/2)$.]),
    False([$cos((A + B)/2) = - sin(C/2)$.])
  ),
  loigiai: [
    #step([Quan hệ hai góc bù nhau])
    Vì $A + B + C = 180^circ => A + B = 180^circ - C$ và $B + C = 180^circ - A$:
    - $sin(A + B) = sin(180^circ - C) = sin C$. Vậy a) Đúng.
    - $cos(B + C) = cos(180^circ - A) = - cos A$. Vậy b) Đúng.
    
    #step([Quan hệ hai góc phụ nhau])
    Chia cả hai vế cho $2$: $(A + B)/2 = 90^circ - C/2$:
    - $sin((A + B)/2) = sin(90^circ - C/2) = cos(C/2)$. Vậy c) Đúng.
    - $cos((A + B)/2) = cos(90^circ - C/2) = sin(C/2)$ (mang dấu dương vì là hai góc nhọn phụ nhau, không có dấu trừ). Vậy d) Sai.
  ]
)

// DS 3: Biến đổi biểu thức lượng giác
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Xét biểu thức $A = (sin^2 alpha - cos^2 alpha + 1) / (sin^2 alpha)$ với $sin alpha != 0$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Vì $1 - cos^2 alpha = sin^2 alpha$ nên tử số của $A$ bằng $2 sin^2 alpha$.]),
    True([Giá trị của biểu thức $A$ không phụ thuộc vào góc $alpha$ và luôn bằng $2$.]),
    True([Xét biểu thức $B = (tan alpha + cot alpha) / (tan alpha - cot alpha)$ với $tan alpha != plus.minus cot alpha$. Khi $alpha = 30^circ$ thì $B = - 2$.]),
    False([Tích $A dot B$ khi $alpha = 30^circ$ bằng $4$.])
  ),
  loigiai: [
    #step([Rút gọn biểu thức A])
    Tử số: $sin^2 alpha + (1 - cos^2 alpha) = sin^2 alpha + sin^2 alpha = 2 sin^2 alpha$. Vậy a) Đúng.
    Do đó: $A = (2 sin^2 alpha) / (sin^2 alpha) = 2$ (hằng số, không phụ thuộc vào $alpha$). Vậy b) Đúng.
    
    #step([Tính giá trị B khi $alpha = 30^circ$])
    Khi $alpha = 30^circ$: $tan 30^circ = 1 / sqrt(3)$, $cot 30^circ = sqrt(3)$.
    - $tan 30^circ + cot 30^circ = 1 / sqrt(3) + sqrt(3) = 4 / sqrt(3)$.
    - $tan 30^circ - cot 30^circ = 1 / sqrt(3) - sqrt(3) = - 2 / sqrt(3)$.
    Suy ra: $B = (4 / sqrt(3)) / (- 2 / sqrt(3)) = - 2$. Vậy c) Đúng.
    
    #step([Tính tích $A dot B$])
    $A dot B = 2 dot (- 2) = - 4 != 4$. Vậy d) Sai.
  ]
)

// DS 4: Thực tế thiết kế máng xối hình thang cân
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Một tấm tôn phẳng hình chữ nhật có chiều rộng $30" cm"$ được gập thành một máng xối dẫn nước có mặt cắt ngang là hình thang cân $A B C D$, với đáy nhỏ $B C = 10" cm"$ và hai thành máng $A B = C D = 10" cm"$. Gọi $alpha$ là góc nghiêng giữa thành máng và phương nằm ngang ($0^circ < alpha < 90^circ$). Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Chiều cao $h$ của máng nước được tính theo công thức $h = 10 dot sin alpha" (cm)"$.]),
    True([Đáy lớn $A D$ của mặt cắt máng nước được tính theo công thức $A D = 10 + 20 dot cos alpha" (cm)"$.]),
    True([Diện tích mặt cắt ngang của máng nước tính theo $alpha$ là $S(alpha) = 100 dot sin alpha dot (1 + cos alpha)" (cm"^2")"$.]),
    False([Diện tích mặt cắt ngang của máng nước đạt giá trị lớn nhất khi $alpha = 45^circ$.])
  ),
  loigiai: [
    #step([Tính chiều cao và đáy lớn])
    Hạ $B H perp A D$ và $C K perp A D$ ($H, K in A D$).
    Trong tam giác vuông $A H B$:
    - Chiều cao máng: $h = B H = A B dot sin alpha = 10 dot sin alpha" (cm)"$. Vậy a) Đúng.
    - Đoạn mở rộng: $A H = K D = A B dot cos alpha = 10 dot cos alpha$.
    - Đáy lớn: $A D = A H + H K + K D = 10 dot cos alpha + 10 + 10 dot cos alpha = 10 + 20 dot cos alpha" (cm)"$. Vậy b) Đúng.
    
    #step([Tính diện tích mặt cắt hình thang cân])
    $ S(alpha) = ((A D + B C) dot h) / 2 = ((10 + 20 cos alpha + 10) dot 10 sin alpha) / 2 = (20(1 + cos alpha) dot 10 sin alpha) / 2 = 100 dot sin alpha dot (1 + cos alpha)" (cm"^2")" $
    Vậy c) Đúng.
    
    #step([Tìm góc alpha để diện tích lớn nhất])
    Bằng khảo sát hàm số lượng giác $f(alpha) = sin alpha(1 + cos alpha)$ với $alpha in (0^circ; 90^circ)$:
    Diện tích đạt giá trị cực đại khi $cos alpha = 1/2 <=> alpha = 60^circ$ (không phải $45^circ$).
    Vậy d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 17 đến câu 22.], count: auto)

// TLN 1: Phân thức đẳng cấp bậc hai
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc $alpha$ thỏa mãn $tan alpha = 3$. Tính giá trị của biểu thức $P = (2 sin^2 alpha + 3 sin alpha cos alpha + cos^2 alpha) / (sin^2 alpha - cos^2 alpha)$.],
    [3.5],
    loigiai: [
        #step([Chia cả tử và mẫu cho cos^2])
        Vì $tan alpha = 3$ nên $cos alpha != 0$. Chia cả tử và mẫu của $P$ cho $cos^2 alpha$:
        $ P = (2 (sin^2 alpha / cos^2 alpha) + 3 (sin alpha / cos alpha) + 1) / ((sin^2 alpha / cos^2 alpha) - 1) = (2 tan^2 alpha + 3 tan alpha + 1) / (tan^2 alpha - 1) $
        
        #step([Thay số tính giá trị])
        $ P = (2(3^2) + 3(3) + 1) / (3^2 - 1) = (2(9) + 9 + 1) / (9 - 1) = (18 + 10) / 8 = 28 / 8 = 3.5 $
    ]
)

// TLN 2: Tích triệt tiêu đặc biệt
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Tính giá trị của biểu thức $T = (1 + cot 135^circ) dot (1 + tan 45^circ) + sin 90^circ$.],
    [1],
    loigiai: [
        #step([Tính từng thừa số])
        - $cot 135^circ = - cot 45^circ = - 1 => 1 + cot 135^circ = 1 + (- 1) = 0$.
        - $tan 45^circ = 1 => 1 + tan 45^circ = 2$.
        - $sin 90^circ = 1$.
        
        #step([Tính kết quả])
        $ T = 0 dot 2 + 1 = 1 $
    ]
)

// TLN 3: Tìm góc khi sin + cos = sqrt(2)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc $alpha$ ($0^circ <= alpha <= 180^circ$) thỏa mãn $sin alpha + cos alpha = sqrt(2)$. Tìm số đo của góc $alpha$ (theo đơn vị độ).],
    [45],
    loigiai: [
        #step([Bình phương hai vế])
        $ (sin alpha + cos alpha)^2 = (sqrt(2))^2 <=> sin^2 alpha + 2 sin alpha cos alpha + cos^2 alpha = 2 $
        Vì $sin^2 alpha + cos^2 alpha = 1$ nên:
        $ 1 + 2 sin alpha cos alpha = 2 <=> 2 sin alpha cos alpha = 1 $
        
        #step([Tìm góc alpha])
        Ta có:
        $ (sin alpha - cos alpha)^2 = sin^2 alpha - 2 sin alpha cos alpha + cos^2 alpha = 1 - 1 = 0 $
        $ => sin alpha = cos alpha $
        Vì $sin alpha = cos alpha$ và $sin alpha + cos alpha = sqrt(2) > 0$, suy ra $sin alpha = cos alpha = sqrt(2)/2$.
        Do đó $alpha = 45^circ$.
    ]
)

// TLN 4: Cho tan + cot = 4 tính (tan - cot)^2
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc $alpha$ thỏa mãn $tan alpha + cot alpha = 4$. Tính giá trị của biểu thức $M = (tan alpha - cot alpha)^2$.],
    [12],
    loigiai: [
        #step([Khai triển và liên hệ hai biểu thức])
        Ta có hằng đẳng thức:
        $ (tan alpha - cot alpha)^2 = (tan alpha + cot alpha)^2 - 4 tan alpha dot cot alpha $
        
        #step([Thay số tính giá trị])
        Vì $tan alpha dot cot alpha = 1$ với mọi góc $alpha$ xác định, ta có:
        $ M = 4^2 - 4(1) = 16 - 4 = 12 $
    ]
)

// TLN 5: Thực tế hai trạm đo độ cao khinh khí cầu
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Hai trạm quan sát $A$ và $B$ trên mặt đất cách nhau $1000" m"$ cùng nằm trên đường thẳng đi qua hình chiếu vuông góc $H$ của một quả bóng thám không trên mặt đất (với $A$ nằm giữa $H$ và $B$). Tại cùng một thời điểm, trạm $A$ nhìn thấy quả bóng dưới góc nâng $45^circ$, trạm $B$ nhìn thấy quả bóng dưới góc nâng $30^circ$. Tính độ cao của quả bóng so với mặt đất (làm tròn kết quả đến hàng mét).],
    [1366],
    loigiai: [
        #step([Mô hình hóa hình học])
        Gọi quả bóng là điểm $S$, độ cao là $h = S H$.
        Tam giác $S H A$ vuông tại $H$ có góc nâng $hat(S A H) = 45^circ$:
        $ H A = h / (tan 45^circ) = h / 1 = h $
        Tam giác $S H B$ vuông tại $H$ có góc nâng $hat(S B H) = 30^circ$:
        $ H B = h / (tan 30^circ) = h / (1/sqrt(3)) = h sqrt(3) $
        
        #step([Lập phương trình và tính độ cao h])
        Vì $A$ nằm giữa $H$ và $B$ nên:
        $ H B - H A = A B <=> h sqrt(3) - h = 1000 <=> h(sqrt(3) - 1) = 1000 $
        $ => h = 1000 / (sqrt(3) - 1) = (1000(sqrt(3) + 1)) / 2 = 500(sqrt(3) + 1) approx 500(2.73205) = 1366.03" m" approx 1366" m" $
    ]
)

#pagebreak()

// TLN 6: GTNN của 1/sin^2 + 1/cos^2 kèm hình vẽ CeTZ
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 103], back-to: "sec-exercise-hub",[Cho góc nhọn $alpha$ ($0^circ < alpha < 90^circ$). Tìm giá trị nhỏ nhất của biểu thức $G = 1 / (sin^2 alpha) + 1 / (cos^2 alpha)$.],
    [4],
    loigiai: [
        #step([Biến đổi đại số])
        Áp dụng các hệ thức cơ bản $1 / (sin^2 alpha) = 1 + cot^2 alpha$ và $1 / (cos^2 alpha) = 1 + tan^2 alpha$:
        $ G = (1 + cot^2 alpha) + (1 + tan^2 alpha) = 2 + (tan^2 alpha + cot^2 alpha) $
        
        #step([Áp dụng bất đẳng thức Cauchy])
        Vì $0^circ < alpha < 90^circ$ nên $tan^2 alpha > 0$ và $cot^2 alpha > 0$. Áp dụng BĐT Cauchy:
        $ tan^2 alpha + cot^2 alpha >= 2 sqrt(tan^2 alpha dot cot^2 alpha) = 2 sqrt(1) = 2 $
        Do đó:
        $ G >= 2 + 2 = 4 $
        Đẳng thức xảy ra khi và chỉ khi:
        $ tan^2 alpha = cot^2 alpha <=> tan^4 alpha = 1 <=> tan alpha = 1 <=> alpha = 45^circ $
        Vậy giá trị nhỏ nhất của $G$ là $4$ khi $alpha = 45^circ$.

        #step([Minh họa hình học trục tang và cotang])
        Tại $alpha = 45^circ$, tia $O M$ cắt tiếp tuyến của đường tròn tại $(1; 0)$ (trục tang) và tại $(0; 1)$ (trục cotang) ở các điểm có độ dài đại số đều bằng $1$.
        
        #align(center)[
            #cetz.canvas({
                import cetz.draw: *
                set-style(stroke: 0.8pt)
                let sc = 2.4
                
                // Trục tọa độ Oxy
                line((-0.3 * sc, 0), (1.55 * sc, 0), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
                content((1.6 * sc, 0), [$x$])
                line((0, -0.3 * sc), (0, 1.55 * sc), mark: (end: "stealth", fill: black), stroke: 0.8pt + black)
                content((0, 1.6 * sc), [$y$])
                content((-0.12 * sc, -0.12 * sc), [$O$])
                
                // Cung phần tư thứ nhất đường tròn đơn vị
                arc((sc, 0), start: 0deg, stop: 90deg, radius: sc, stroke: 1.2pt + rgb("dc2626"))
                
                // Điểm 1 trên Ox và Oy
                circle((sc, 0), radius: 1.5pt, fill: black)
                content((sc + 0.12 * sc, -0.12 * sc), [$1$])
                circle((0, sc), radius: 1.5pt, fill: black)
                content((-0.12 * sc, sc + 0.12 * sc), [$1$])
                
                // Trục tang x = 1 và trục cotang y = 1
                line((sc, 0), (sc, 1.5 * sc), stroke: (paint: rgb("2563eb"), dash: "dashed", thickness: 0.8pt))
                content((sc, 1.58 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("2563eb"), size: 8.5pt)[$x = 1$]])
                
                line((0, sc), (1.5 * sc, sc), stroke: (paint: rgb("059669"), dash: "dashed", thickness: 0.8pt))
                content((1.58 * sc, sc), box(fill: white, inset: 1pt)[#text(fill: rgb("059669"), size: 8.5pt)[$y = 1$]])
                
                // Tia OM kéo dài cắt tại (1; 1)
                line((0, 0), (1.3 * sc, 1.3 * sc), stroke: 1.2pt + rgb("7c3aed"))
                
                // Điểm T(1; 1)
                circle((sc, sc), radius: 2.5pt, fill: rgb("7c3aed"), stroke: black)
                content((sc + 0.28 * sc, sc - 0.12 * sc), box(fill: white, inset: 1pt)[#text(fill: rgb("7c3aed"), weight: "bold")[$T(1; 1)$]])
                
                // Điểm M trên cung tròn
                let xM = 0.7071 * sc
                let yM = 0.7071 * sc
                circle((xM, yM), radius: 2.5pt, fill: rgb("dc2626"), stroke: black)
                content((xM - 0.14 * sc, yM + 0.14 * sc), text(fill: rgb("dc2626"), weight: "bold")[$M$])
                
                // Cung góc 45 độ
                arc((0.35 * sc, 0), start: 0deg, stop: 45deg, radius: 0.35 * sc, stroke: 0.9pt + rgb("7c3aed"))
                content((0.45 * sc, 0.18 * sc), text(fill: rgb("7c3aed"), size: 8.5pt)[$45^circ$])
            })
        ]
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 5: GIÁ TRỊ LƯỢNG GIÁC CỦA MỘT GÓC TỪ 0° ĐẾN 180° (ĐỀ SỐ 3)!]      #v(0.6em)
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
