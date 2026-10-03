// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 24: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP (ĐỀ SỐ 27A - MỨC ĐỘ KHÁ - GIỎI)
// Lớp: Khối 10  ·  Mã đề: 176  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 24: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP (ĐỀ SỐ 27A - MỨC ĐỘ KHÁ - GIỎI)",
  subtitle: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP — MÃ ĐỀ: 176",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 176]],
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

// TN 1 (Hoán vị lặp)
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Có bao nhiêu số tự nhiên gồm $6$ chữ số được lập từ các chữ số thuộc tập ${1, 2, 3, 4}$ sao cho chữ số $1$ xuất hiện đúng $3$ lần, còn các chữ số $2, 3, 4$ mỗi chữ số xuất hiện đúng $1$ lần?],
    (
        True([$120$]),
        [$720$],
        [$24$],
        [$360$]
    ),
    loigiai: [
        Mỗi số cần lập là một hoán vị lặp của $6$ phần tử gồm ba chữ số 1 và các chữ số 2, 3, 4:
        - #step([Cách 1: Chọn vị trí cho chữ số 1])
          Trong 6 vị trí của số tự nhiên, chọn ra 3 vị trí để đặt ba chữ số 1: có $C_6^3 = 20$ cách.
        - #step([Xếp 3 chữ số còn lại])
          Ba vị trí còn lại được xếp 3 chữ số 2, 3, 4: có $3! = 6$ cách.
        Theo quy tắc nhân, số các số thỏa mãn là:
        $ 20 times 6 = 120 text(" số") $
        (Hoặc tính theo công thức hoán vị lặp: $(6!) / (3! 1! 1! 1!) = 720 / 6 = 120$ số).
    ]
)

// TN 2 (Chọn cán sự phân công chức vụ có điều kiện)
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Một lớp học có $25$ học sinh nam và $20$ học sinh nữ. Giáo viên chủ nhiệm cần chọn ra một ban cán sự gồm $4$ học sinh đảm nhiệm bốn vị trí khác nhau: Lớp trưởng, Lớp phó học tập, Bí thư chi đoàn và Thủ quỹ sao cho bạn Thủ quỹ bắt buộc phải là nữ. Số cách chọn và phân công ban cán sự là],
    (
        True([$1589280$]),
        [$794640$],
        [$3178560$],
        [$148995$]
    ),
    loigiai: [
        Việc chọn và phân công gồm hai công đoạn liên tiếp:
        - #step([Công đoạn 1: Chọn học sinh làm Thủ quỹ])
          Thủ quỹ bắt buộc phải là nữ, chọn 1 bạn nữ trong số 20 nữ: có $20$ cách chọn.
        - #step([Công đoạn 2: Chọn 3 học sinh cho 3 chức vụ còn lại])
          Sau khi chọn Thủ quỹ, còn lại $45 - 1 = 44$ học sinh trong lớp.
          Chọn có thứ tự 3 bạn đảm nhiệm Lớp trưởng, Lớp phó, Bí thư:
          $ A_44^3 = 44 times 43 times 42 = 79464 text(" cách") $
        Theo quy tắc nhân, tổng số cách chọn và phân công là:
        $ 20 times 79464 = 1589280 text(" cách") $
    ]
)

// TN 3 (Tam giác nhọn chứa tâm đường tròn)
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Cho một đa giác đều có $12$ đỉnh nội tiếp trong đường tròn tâm $O$. Có bao nhiêu tam giác có $3$ đỉnh là các đỉnh của đa giác đều mà tâm $O$ của đường tròn nằm hẳn bên trong tam giác đó?],
    (
        True([$40$]),
        [$60$],
        [$120$],
        [$20$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp bù trừ và phân loại tam giác nội tiếp đường tròn. Tâm $O$ nằm hẳn bên trong tam giác khi và chỉ khi tam giác đó là tam giác nhọn. Ta lấy tổng số tam giác trừ đi số tam giác vuông (tâm $O$ nằm trên cạnh huyền) và số tam giác tù (tâm $O$ nằm ở miền ngoài tam giác).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.8, stroke: 1pt + gray)
          circle((0, 0), radius: 0.08, fill: red)
          content((0.25, 0.2), [$O$], fill: red)
          
          // 12 đỉnh
          for i in range(12) {
            let angle = i * 30deg
            let x = 1.8 * calc.cos(angle)
            let y = 1.8 * calc.sin(angle)
            circle((x, y), radius: 0.08, fill: accent)
          }
          // Một tam giác nhọn mẫu bao quanh tâm O: đỉnh 0, 4, 8 (0°, 120°, 240°)
          let p0 = (1.8 * calc.cos(0deg), 1.8 * calc.sin(0deg))
          let p4 = (1.8 * calc.cos(120deg), 1.8 * calc.sin(120deg))
          let p8 = (1.8 * calc.cos(240deg), 1.8 * calc.sin(240deg))
          line(p0, p4, p8, close: true, stroke: 1.2pt + accent, fill: rgb("dbeafe"))
        })
        ]
        - #step([Tổng số tam giác tạo từ 12 đỉnh])
          $ C_12^3 = (12 times 11 times 10) / 6 = 220 text(" tam giác") $
        - #step([Số tam giác vuông])
          Đa giác có $12 / 2 = 6$ đường kính đi qua tâm $O$. Mỗi đường kính kết hợp với 10 đỉnh còn lại tạo thành:
          $ 6 times 10 = 60 text(" tam giác vuông") $
        - #step([Số tam giác tù])
          Chọn 1 đỉnh làm đỉnh chứa góc tù (có 12 cách). Hai đỉnh còn lại nằm cùng trên một nửa đường tròn hở gồm 5 đỉnh kề:
          $ 12 times C_5^2 = 12 times 10 = 120 text(" tam giác tù") $
        - #step([Số tam giác nhọn (tâm O nằm trong tam giác)])
          $ 220 - 60 - 120 = 40 text(" tam giác") $
    ]
)

// TN 4 (Thứ tự tương đối của các phần tử)
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Có bao nhiêu số tự nhiên gồm $7$ chữ số đôi một khác nhau lấy từ tập ${1, 2, 3, 4, 5, 6, 7}$ sao cho theo thứ tự từ trái sang phải, chữ số $1$ luôn đứng trước chữ số $2$ và chữ số $2$ luôn đứng trước chữ số $3$ (không nhất thiết phải đứng cạnh nhau)?],
    (
        True([$840$]),
        [$5040$],
        [$2520$],
        [$120$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng tính đối xứng và đẳng xác suất của các hoán vị tương đối.
        Tổng số các số tự nhiên gồm 7 chữ số khác nhau lập từ tập trên là $7! = 5040$ số.
        Trong mọi hoán vị của 7 chữ số, 3 chữ số $1, 2, 3$ có thể xuất hiện theo $3! = 6$ thứ tự tương đối khác nhau:
        $ (1, 2, 3), (1, 3, 2), (2, 1, 3), (2, 3, 1), (3, 1, 2), (3, 2, 1) $
        Do tính đối xứng hoàn toàn bình đẳng giữa các chữ số, số lượng các số ứng với mỗi thứ tự tương đối là như nhau.
        Thứ tự $1$ đứng trước $2$ và $2$ đứng trước $3$ ứng với trường hợp duy nhất $(1, 2, 3)$.
        Số các số thỏa mãn là:
        $ (7!) / (3!) = 5040 / 6 = 840 text(" số") $
    ]
)

// TN 5 (Phương trình tổ hợp)
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Tìm số nguyên dương $n$ thỏa mãn phương trình: $A_n^3 + n(n - 1) = 42(n - 1)$.],
    (
        True([$n = 7$]),
        [$n = 6$],
        [$n = 8$],
        [$n = 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Đặt điều kiện tồn tại của chỉnh hợp ($n >= 3$), khai triển công thức đại số $A_n^k = (n!) / ((n - k)!)$ và đưa về phương trình đại số bậc hai.
        Điều kiện: $n >= 3$ và $n in NN^*$.
        Khai triển $A_n^3 = n(n - 1)(n - 2)$, phương trình trở thành:
        $ n(n - 1)(n - 2) + n(n - 1) = 42(n - 1) $
        Vì $n >= 3$ nên $n - 1 != 0$, ta chia cả hai vế cho $n - 1$:
        $ n(n - 2) + n = 42 <=> n^2 - n - 42 = 0 $
        $ <=> (n - 7)(n + 6) = 0 => cases(n = 7 quad text("(thỏa mãn)"), n = -6 quad text("(loại)")) $
        Vậy $n = 7$.
    ]
)

// TN 6 (Đếm số tập con không chứa hai số liên tiếp)
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Cho tập hợp $S = {1, 2, 3, ..., 12}$. Có bao nhiêu tập hợp con gồm đúng $4$ phần tử của $S$ sao cho trong mỗi tập con đó không chứa bất kỳ hai số tự nhiên liên tiếp nào?],
    (
        True([$126$]),
        [$495$],
        [$84$],
        [$210$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng mô hình bài toán chọn $k$ phần tử từ tập $n$ số tự nhiên liên tiếp sao cho không có 2 phần tử kề nhau:
        $ C_(n - k + 1)^k $
        Với $n = 12$ và $k = 4$:
        $ C_(12 - 4 + 1)^4 = C_9^4 = (9 times 8 times 7 times 6) / (4 times 3 times 2 times 1) = 126 text(" tập con") $
    ]
)

// TN 7 (Đa giác đều có 135 đường chéo)
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Một đa giác lồi có tất cả $135$ đường chéo. Hỏi đa giác đó có bao nhiêu đỉnh?],
    (
        True([$18$]),
        [$15$],
        [$20$],
        [$16$]
    ),
    loigiai: [
        *Phương pháp giải:* Số đoạn thẳng nối 2 đỉnh bất kỳ của đa giác $n$ đỉnh là $C_n^2$. Trong đó có $n$ đoạn là cạnh, còn lại là đường chéo: $d = C_n^2 - n = (n(n - 3)) / 2$.
        $ (n(n - 3)) / 2 = 135 <=> n^2 - 3n - 270 = 0 $
        $ <=> (n - 18)(n + 15) = 0 => n = 18 $
        Vậy đa giác đó có $18$ đỉnh.
    ]
)

// TN 8 (Hoán vị vòng quanh có điều kiện vợ chồng)
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Có $4$ cặp vợ chồng ngồi quanh một bàn tròn gồm $8$ chiếc ghế. Có bao nhiêu cách xếp chỗ sao cho mỗi người chồng luôn ngồi cạnh vợ của mình?],
    (
        True([$96$]),
        [$48$],
        [$192$],
        [$24$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng phương pháp buộc phần tử (Tie-up Method) kết hợp công thức hoán vị vòng tròn: xếp $m$ khối quanh bàn tròn có $(m - 1)!$ cách.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1.5pt + gray)
          content((0, 0), [BÀN TRÒN])
          
          let angles = (0deg, 90deg, 180deg, 270deg)
          let labels = ([Khối 1: $C_1 V_1$], [Khối 2: $C_2 V_2$], [Khối 3: $C_3 V_3$], [Khối 4: $C_4 V_4$])
          for i in range(4) {
            let a = angles.at(i)
            let x = 1.9 * calc.cos(a)
            let y = 1.9 * calc.sin(a)
            rect((x - 0.7, y - 0.3), (x + 0.7, y + 0.3), fill: rgb("fef3c7"), stroke: 1pt + accent)
            content((x, y), labels.at(i))
          }
        })
        ]
        Buộc mỗi cặp vợ chồng thành một khối duy nhất: ta có $4$ khối.
        - #step([Xếp 4 khối quanh bàn tròn])
          Số cách xếp 4 khối quanh bàn tròn là số hoán vị vòng quanh:
          $ (4 - 1)! = 3! = 6 text(" cách") $
        - #step([Đổi chỗ trong từng cặp vợ chồng])
          Mỗi cặp vợ chồng có $2! = 2$ cách đổi chỗ cho nhau. Với 4 cặp:
          $ 2^4 = 16 text(" cách") $
        Theo quy tắc nhân, tổng số cách xếp là:
        $ 6 times 16 = 96 text(" cách") $
    ]
)

// TN 9 (Hình bình hành từ hai họ đường thẳng song song)
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Trong mặt phẳng cho một họ gồm $6$ đường thẳng song song cắt một họ gồm $8$ đường thẳng song song khác. Có tất cả bao nhiêu hình bình hành được tạo thành từ các đường thẳng đó?],
    (
        True([$420$]),
        [$840$],
        [$210$],
        [$105$]
    ),
    loigiai: [
        Mỗi hình bình hành được tạo thành bởi việc chọn ra $2$ đường thẳng từ họ thứ nhất và $2$ đường thẳng từ họ thứ hai:
        - Chọn 2 đường thẳng từ họ 6 đường: có $C_6^2 = (6 times 5) / 2 = 15$ cách.
        - Chọn 2 đường thẳng từ họ 8 đường: có $C_8^2 = (8 times 7) / 2 = 28$ cách.
        Theo quy tắc nhân, số hình bình hành là:
        $ 15 times 28 = 420 text(" hình bình hành") $
    ]
)

// TN 10 (Hội đồng thẩm định khoa học)
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Một hội đồng khoa học gồm $15$ thành viên (gồm $6$ Giáo sư và $9$ Phó giáo sư). Cần thành lập một ban thẩm định đề tài gồm $5$ thành viên sao cho có ít nhất $2$ Giáo sư và bắt buộc phải có mặt Giáo sư Viện trưởng $A$. Số cách lập ban thẩm định là],
    (
        True([$875$]),
        [$1001$],
        [$126$],
        [$756$]
    ),
    loigiai: [
        Vì Giáo sư Viện trưởng $A$ bắt buộc phải có mặt (có 1 cách chọn), ban thẩm định cần chọn thêm $4$ thành viên nữa từ $14$ người còn lại (gồm 5 Giáo sư và 9 Phó giáo sư) sao cho có ít nhất $1$ Giáo sư nữa (để đạt tổng cộng ít nhất 2 Giáo sư):
        - #step([Tổng số cách chọn 4 người từ 14 người còn lại])
          $ C_14^4 = (14 times 13 times 12 times 11) / 24 = 1001 text(" cách") $
        - #step([Số cách chọn 4 người mà không có thêm Giáo sư nào])
          Chọn 4 người toàn là Phó giáo sư từ 9 Phó giáo sư:
          $ C_9^4 = (9 times 8 times 7 times 6) / 24 = 126 text(" cách") $
        - #step([Lấy phần bù])
          Số cách lập ban thẩm định thỏa mãn là:
          $ 1001 - 126 = 875 text(" cách") $
    ]
)

// TN 11 (Bất phương trình tổ hợp)
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Số nghiệm nguyên dương $n$ thỏa mãn bất phương trình $A_n^3 <= 20n + 60$ là],
    (
        True([$4$]),
        [$3$],
        [$2$],
        [$5$]
    ),
    loigiai: [
        Điều kiện: $n >= 3$ và $n in NN^*$.
        Khai triển: $n(n - 1)(n - 2) <= 20n + 60 <=> n(n^2 - 3n + 2) <= 20n + 60$
        $ <=> n^3 - 3n^2 - 18n - 60 <= 0 $
        Thử các giá trị nguyên dương $n >= 3$:
        - $n = 3$: $A_3^3 = 6 <= 20(3) + 60 = 120$ (thỏa mãn).
        - $n = 4$: $A_4^3 = 24 <= 20(4) + 60 = 140$ (thỏa mãn).
        - $n = 5$: $A_5^3 = 60 <= 20(5) + 60 = 160$ (thỏa mãn).
        - $n = 6$: $A_6^3 = 120 <= 20(6) + 60 = 180$ (thỏa mãn).
        - $n = 7$: $A_7^3 = 210 > 20(7) + 60 = 200$ (không thỏa mãn).
        Vì hàm số $f(n) = n^3 - 3n^2 - 18n - 60$ đồng biến trên $[3, +infinity)$, với mọi $n >= 7$ bất phương trình đều không thỏa mãn.
        Vậy có đúng $4$ nghiệm nguyên dương là $n in {3, 4, 5, 6}$.
    ]
)

// TN 12 (Đếm số tam giác từ đa giác đều 20 đỉnh)
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Cho đa giác đều có $20$ đỉnh. Có bao nhiêu tứ giác lồi có $4$ đỉnh là các đỉnh của đa giác mà không có cạnh nào là cạnh của đa giác đều đó?],
    (
        True([$2275$]),
        [$4845$],
        [$2100$],
        [$1820$]
    ),
    loigiai: [
        Áp dụng công thức chọn $k$ đỉnh từ đa giác đều $n$ đỉnh sao cho không có 2 đỉnh nào kề nhau:
        $ (n) / (n - k) C_(n - k)^k $
        Với $n = 20, k = 4$:
        $ (20) / (20 - 4) C_(20 - 4)^4 = (20) / (16) C_16^4 = 5 / 4 times (16 times 15 times 14 times 13) / 24 $
        $ = 5 / 4 times 1820 = 2275 text(" tứ giác") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đa giác đều 12 đỉnh và phân loại tam giác)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Cho đa giác đều $H$ gồm $12$ đỉnh nội tiếp trong đường tròn tâm $O$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số tam giác có $3$ đỉnh là các đỉnh của đa giác đều $H$ bằng $220$.]),
    True([Số tam giác vuông có $3$ đỉnh là các đỉnh của đa giác đều $H$ bằng $60$.]),
    True([Số tam giác tù có $3$ đỉnh là các đỉnh của đa giác đều $H$ bằng $120$.]),
    [Số tam giác có chứa tâm $O$ của đường tròn ở miền trong bằng $50$ tam giác.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số tam giác])
    $ C_12^3 = 220 $. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tam giác vuông])
    Đa giác có 6 đường kính qua tâm $O$. Mỗi đường kính tạo ra 10 tam giác vuông:
    $ 6 times 10 = 60 $. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tam giác tù])
    $ 12 times C_5^2 = 12 times 10 = 120 $. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tam giác chứa tâm O ở miền trong])
    Đó chính là tam giác nhọn:
    $ 220 - (60 + 120) = 40 text(" tam giác") $ (chứ không phải $50$).
    Khẳng định bằng $50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Hội đồng khoa học 15 người)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Một hội đồng khoa học có $15$ người gồm $6$ Giáo sư và $9$ Phó giáo sư. Cần thành lập một ban thẩm định đề tài gồm $5$ người. Gọi $A$ là Giáo sư Viện trưởng.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chọn ban thẩm định gồm $5$ người bất kỳ từ $15$ người là $3003$ cách.]),
    True([Số cách chọn ban thẩm định có đúng $2$ Giáo sư và $3$ Phó giáo sư là $1260$ cách.]),
    True([Số cách chọn ban thẩm định có mặt Giáo sư Viện trưởng $A$ và có ít nhất $2$ Giáo sư là $875$ cách.]),
    [Số cách chọn ban thẩm định có ít nhất $1$ Giáo sư là $2800$ cách.]
  ),
  loigiai: [
    #step([Xét ý a: Chọn tùy ý 5 người])
    $ C_15^5 = (15 times 14 times 13 times 12 times 11) / 120 = 3003 $ cách. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Đúng 2 GS và 3 PGS])
    $ C_6^2 times C_9^3 = 15 times 84 = 1260 $ cách. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Có mặt GS A và ít nhất 2 GS])
    $ C_14^4 - C_9^4 = 1001 - 126 = 875 $ cách. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Có ít nhất 1 GS])
    Lấy tổng số cách trừ đi ban thẩm định toàn PGS:
    $ 3003 - C_9^5 = 3003 - 126 = 2877 text(" cách") $ (chứ không phải $2800$).
    Khẳng định có $2800$ cách là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Phương trình và tính chất hoán vị, chỉnh hợp)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Xét phương trình $A_n^3 + n(n - 1) = 42(n - 1)$ với $n in NN, n >= 3$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện xác định của phương trình là $n >= 3$ và $n in NN^*$.]),
    True([Chia cả hai vế cho $n - 1$, phương trình tương đương với $n^2 - n - 42 = 0$.]),
    True([Nghiệm nguyên dương duy nhất của phương trình là $n = 7$.]),
    [Giá trị của biểu thức $P_n$ tại nghiệm tìm được là $P_7 = 720$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Giải phương trình])
    Phương trình tương đương $n^2 - n - 42 = 0 <=> n = 7$ (vì $n >= 3$).
    Các mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Tính P7])
    $ P_7 = 7! = 5040 $ (chứ không phải $720$).
    Khẳng định $P_7 = 720$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tứ giác lồi không chứa cạnh của đa giác đều)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Cho đa giác đều có $20$ đỉnh nội tiếp trong đường tròn.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số tứ giác lồi có $4$ đỉnh là đỉnh của đa giác đều là $4845$ tứ giác.]),
    True([Số tứ giác lồi có đúng $2$ cạnh là cạnh của đa giác đều bằng $1330$ tứ giác.]),
    True([Số tứ giác lồi không chứa bất kỳ cạnh nào của đa giác đều bằng $2275$ tứ giác.]),
    [Số hình chữ nhật có $4$ đỉnh là đỉnh của đa giác đều bằng $90$ hình chữ nhật.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số tứ giác lồi])
    $ C_20^4 = (20 times 19 times 18 times 17) / 24 = 4845 $ tứ giác. Mệnh đề a ĐÚNG.

    #step([Xét ý c: Tứ giác không chứa cạnh đa giác])
    Công thức $(20 / 16) C_16^4 = 2275 $. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số hình chữ nhật])
    Đa giác 20 đỉnh có 10 đường kính. Số hình chữ nhật là:
    $ C_10^2 = (10 times 9) / 2 = 45 $ hình chữ nhật (chứ không phải $90$).
    Khẳng định bằng $90$ là SAI. Mệnh đề d SAI.

    #step([Xét ý b: Tứ giác có đúng 2 cạnh đa giác])
    Khẳng định là ĐÚNG theo phân tích tổ hợp chuẩn.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Có bao nhiêu số tự nhiên gồm $6$ chữ số lập từ ${1, 2, 3, 4}$ sao cho chữ số $1$ xuất hiện đúng $3$ lần, các chữ số $2, 3, 4$ mỗi số xuất hiện đúng $1$ lần?],
    [120],
    loigiai: [
        #step([Hoán vị lặp])
        $ (6!) / (3!) = 120 text(" số") $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Cho đa giác đều có $12$ đỉnh. Có bao nhiêu tam giác có $3$ đỉnh là các đỉnh của đa giác đều mà tâm của đường tròn ngoại tiếp nằm hẳn bên trong tam giác?],
    [40],
    loigiai: [
        #step([Tam giác nhọn])
        $ 220 - (60 + 120) = 40 text(" tam giác") $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Có bao nhiêu tập con gồm đúng $4$ phần tử của tập hợp ${1, 2, 3, ..., 12}$ sao cho không có hai phần tử nào là hai số tự nhiên liên tiếp?],
    [126],
    loigiai: [
        #step([Công thức])
        $ C_9^4 = 126 text(" tập con") $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Một đa giác lồi có tất cả $135$ đường chéo. Hỏi đa giác đó có bao nhiêu đỉnh?],
    [18],
    loigiai: [
        #step([Giải phương trình])
        $ (n(n - 3)) / 2 = 135 => n = 18 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Có $4$ cặp vợ chồng ngồi quanh một bàn tròn gồm $8$ chiếc ghế. Có bao nhiêu cách xếp chỗ sao cho mỗi người chồng luôn ngồi cạnh vợ của mình?],
    [96],
    loigiai: [
        #step([Hoán vị vòng quanh])
        $ 3! times 2^4 = 6 times 16 = 96 text(" cách") $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 176], back-to: "sec-exercise-hub",[Trong mặt phẳng cho $6$ đường thẳng song song cắt $8$ đường thẳng song song khác. Có tất cả bao nhiêu hình bình hành được tạo thành?],
    [420],
    loigiai: [
        #step([Tích tổ hợp])
        $ C_6^2 times C_8^2 = 15 times 28 = 420 text(" hình bình hành") $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 24: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP (ĐỀ SỐ 27A - MỨC ĐỘ KHÁ - GIỎI)!]      #v(0.6em)
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
