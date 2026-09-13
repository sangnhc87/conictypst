// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP (ĐỀ SỐ 29A - MÃ ĐỀ 182)
// Lớp: Khối 10  ·  Mã đề: 182  ·  GV: Nguyễn Văn Sang
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
  title: "ÔN TẬP CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP (ĐỀ SỐ 29A - MÃ ĐỀ 182)",
  subtitle: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP — MÃ ĐỀ: 182",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 182]],
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
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Từ các chữ số thuộc tập hợp $X = {0, 1, 2, 3, 4, 5, 6, 7}$, có thể lập được bao nhiêu số tự nhiên chẵn gồm $4$ chữ số đôi một khác nhau sao cho chữ số hàng nghìn luôn là một số lẻ?],
    (
        True([$480$]),
        [$360$],
        [$420$],
        [$300$]
    ),
    loigiai: [
        *Phương pháp giải:* Xét cấu trúc số $overline(a b c d)$ với $a in {1, 3, 5, 7}$ (chữ số lẻ, tự động khác 0) và $d in {0, 2, 4, 6}$ (chữ số chẵn). Áp dụng quy tắc nhân cho các công đoạn độc lập.
        - #step([Bước 1: Chọn chữ số hàng nghìn a])
          $a in {1, 3, 5, 7}$: có $4$ cách chọn.
        - #step([Bước 2: Chọn chữ số tận cùng d])
          Vì tập chữ số lẻ và tập chữ số chẵn rời nhau hoàn toàn, $a$ không thể trùng với $d$.
          Do đó $d in {0, 2, 4, 6}$: có $4$ cách chọn.
        - #step([Bước 3: Chọn hai chữ số ở giữa b và c])
          Sau khi chọn $a$ và $d$, còn lại $8 - 2 = 6$ chữ số.
          Chọn có thứ tự 2 chữ số xếp vào $b$ và $c$:
          $ A_6^2 = 6 times 5 = 30 text(" cách") $
        Theo quy tắc nhân, tổng số các số thỏa mãn là:
        $ 4 times 4 times 30 = 480 text(" số") $
    ]
)

// TN 2 (Vách ngăn Stars and Bars có CeTZ)
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Phương trình $x_1 + x_2 + x_3 = 10$ có bao nhiêu bộ nghiệm nguyên dương $(x_1, x_2, x_3)$?],
    (
        True([$36$]),
        [$45$],
        [$66$],
        [$55$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng bài toán chia kẹo Euler (phương pháp vách ngăn - Stars and Bars). Số nghiệm nguyên dương của $x_1 + x_2 + ... + x_k = n$ là $C_(n - 1)^(k - 1)$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for i in range(10) {
            circle((i * 0.5, 0), radius: 0.15, fill: rgb("dbeafe"), stroke: 1pt + accent)
          }
          line((2 * 0.5 + 0.25, -0.3), (2 * 0.5 + 0.25, 0.3), stroke: 1.5pt + red)
          line((6 * 0.5 + 0.25, -0.3), (6 * 0.5 + 0.25, 0.3), stroke: 1.5pt + red)
          content((2.5, -0.6), [10 ngôi sao tạo ra 9 khoảng trống, đặt 2 vách ngăn])
        })
        ]
        Mười ngôi sao xếp thành hàng tạo ra $10 - 1 = 9$ khoảng trống.
        Đặt $3 - 1 = 2$ vách ngăn vào 9 khoảng trống đó:
        $ C_9^2 = (9 times 8) / 2 = 36 text(" bộ nghiệm") $
    ]
)

// TN 3 (Đa giác đều 16 đỉnh - Hình chữ nhật có CeTZ)
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Cho đa giác đều có $16$ đỉnh nội tiếp trong đường tròn tâm $O$. Có bao nhiêu hình chữ nhật có $4$ đỉnh là các đỉnh của đa giác đều đã cho?],
    (
        True([$28$]),
        [$56$],
        [$16$],
        [$32$]
    ),
    loigiai: [
        *Phương pháp giải:* Một tứ giác nội tiếp đường tròn là hình chữ nhật khi và chỉ khi hai đường chéo của nó là hai đường kính của đường tròn.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.8, stroke: 1pt + gray)
          circle((0, 0), radius: 0.08, fill: red)
          content((0.2, 0.2), [$O$], fill: red)
          for i in range(16) {
            let a = i * 22.5deg
            let x = 1.8 * calc.cos(a)
            let y = 1.8 * calc.sin(a)
            circle((x, y), radius: 0.06, fill: accent)
          }
          // Hình chữ nhật nối 4 đỉnh: 0, 3, 8, 11
          let p0 = (1.8 * calc.cos(0deg), 1.8 * calc.sin(0deg))
          let p3 = (1.8 * calc.cos(67.5deg), 1.8 * calc.sin(67.5deg))
          let p8 = (1.8 * calc.cos(180deg), 1.8 * calc.sin(180deg))
          let p11 = (1.8 * calc.cos(247.5deg), 1.8 * calc.sin(247.5deg))
          line(p0, p3, p8, p11, close: true, stroke: 1.2pt + accent, fill: rgb("dbeafe"))
          line(p0, p8, stroke: 0.8pt + red)
          line(p3, p11, stroke: 0.8pt + red)
        })
        ]
        - Đa giác đều 16 đỉnh có $16 / 2 = 8$ đường kính đi qua tâm.
        - Mỗi cặp gồm 2 đường kính bất kỳ xác định DUY NHẤT một hình chữ nhật.
        Số hình chữ nhật là:
        $ C_8^2 = (8 times 7) / 2 = 28 text(" hình chữ nhật") $
    ]
)

// TN 4 (Khai triển tích đa thức)
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Tìm hệ số của số hạng chứa $x^3$ trong khai triển của biểu thức $P(x) = (1 + 2x)^4 (1 - x)$.],
    (
        True([$8$]),
        [$32$],
        [$24$],
        [$-8$]
    ),
    loigiai: [
        *Phương pháp giải:* Khai triển nhị thức Newton cho lũy thừa $(1 + 2x)^4$, sau đó nhân phân phối với $(1 - x)$ và thu gọn các hệ số của $x^3$.
        Khai triển nhị thức Newton:
        $ (1 + 2x)^4 = C_4^0 + C_4^1 (2x) + C_4^2 (2x)^2 + C_4^3 (2x)^3 + C_4^4 (2x)^4 $
        $ = 1 + 8x + 24x^2 + 32x^3 + 16x^4 $
        Nhân với đa thức $(1 - x)$:
        $ P(x) = (1 + 8x + 24x^2 + 32x^3 + 16x^4)(1 - x) $
        Hệ số của số hạng chứa $x^3$ nhận được từ:
        $ 1 times (32x^3) + (-x) times (24x^2) = (32 - 24)x^3 = 8x^3 $
        Vậy hệ số cần tìm là $8$.
    ]
)

// TN 5 (Lưới tọa độ tránh điểm cấm có CeTZ)
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Một robot di chuyển trên mặt phẳng tọa độ từ điểm gốc $O(0, 0)$ đến điểm $B(5, 3)$ bằng các bước sang phải hoặc lên trên $1$ đơn vị. Biết robot không được đi qua điểm chướng ngại vật $M(2, 1)$. Có bao nhiêu lộ trình hợp lệ?],
    (
        True([$26$]),
        [$56$],
        [$30$],
        [$36$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp đếm bằng phần bù. Lấy tổng số lộ trình từ $O$ đến $B$ trừ đi số lộ trình đi qua điểm chướng ngại vật $M(2, 1)$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for x in range(6) {
            line((x, 0), (x, 3), stroke: 0.5pt + gray)
          }
          for y in range(4) {
            line((0, y), (5, y), stroke: 0.5pt + gray)
          }
          circle((0, 0), radius: 0.12, fill: accent)
          content((0, -0.3), [$O(0,0)$])
          circle((5, 3), radius: 0.12, fill: accent)
          content((5, 3.3), [$B(5,3)$])
          circle((2, 1), radius: 0.15, fill: red)
          content((2, 1.35), [$M(2,1)$ (Cấm)], fill: red)
        })
        ]
        - Tổng số lộ trình từ $O(0, 0)$ đến $B(5, 3)$ (5 bước phải, 3 bước lên):
          $ C_8^3 = (8 times 7 times 6) / 6 = 56 text(" lộ trình") $
        - Số lộ trình đi qua $M(2, 1)$:
          + Từ $O(0, 0)$ đến $M(2, 1)$ (2 bước phải, 1 bước lên): $C_3^1 = 3$ cách.
          + Từ $M(2, 1)$ đến $B(5, 3)$ (3 bước phải, 2 bước lên): $C_5^2 = 10$ cách.
          Số lộ trình qua $M$ là: $3 times 10 = 30$ lộ trình.
        - Số lộ trình hợp lệ tránh điểm $M$:
          $ 56 - 30 = 26 text(" lộ trình") $
    ]
)

// TN 6 (Hoán vị vòng quanh xen kẽ)
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Có $4$ bạn nam và $4$ bạn nữ ngồi quanh một bàn tròn có $8$ chiếc ghế. Có bao nhiêu cách xếp chỗ sao cho nam và nữ ngồi xen kẽ nhau?],
    (
        True([$144$]),
        [$288$],
        [$576$],
        [$72$]
    ),
    loigiai: [
        *Phương pháp giải:* Xếp cố định các bạn nam quanh bàn tròn theo hoán vị vòng quanh $(4 - 1)!$, sau đó xếp các bạn nữ vào 4 vị trí xen kẽ theo hoán vị thông thường $4!$.
        - Xếp 4 bạn nam quanh bàn tròn: có $(4 - 1)! = 3! = 6$ cách.
        - Giữa 4 bạn nam tạo ra 4 vị trí ghế trống phân biệt:
          Xếp 4 bạn nữ vào 4 vị trí này: có $4! = 24$ cách.
        Theo quy tắc nhân:
        $ 6 times 24 = 144 text(" cách") $
    ]
)

// TN 7 (Số hạng không chứa x)
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Trong khai triển của biểu thức $(root(3, x) + 1 / (sqrt(x)))^5$ với $x > 0$, số hạng không chứa biến $x$ là],
    (
        True([$10$]),
        [$5$],
        [$20$],
        [$1$]
    ),
    loigiai: [
        *Phương pháp giải:* Viết công thức số hạng tổng quát của nhị thức Newton, chuyển các căn thức về lũy thừa số mũ hữu tỉ $x^alpha$, sau đó giải phương trình số mũ bằng 0.
        Số hạng tổng quát thứ $k + 1$ ($k in {0, 1, ..., 5}$):
        $ T_(k + 1) = C_5^k (root(3, x))^(5 - k) (1 / (sqrt(x)))^k = C_5^k x^((5 - k)/3) x^(-k / 2) = C_5^k x^((10 - 5k)/6) $
        Để số hạng không chứa biến $x$:
        $ (10 - 5k) / 6 = 0 <=> 10 - 5k = 0 <=> k = 2 $
        Hệ số tương ứng là:
        $ C_5^2 = (5 times 4) / 2 = 10 $
    ]
)

// TN 8 (Phương trình tổ hợp)
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Tìm số nguyên dương $n$ thỏa mãn phương trình: $C_n^1 + C_n^2 + C_n^3 = (7n) / 2$.],
    (
        True([$n = 4$]),
        [$n = 5$],
        [$n = 6$],
        [$n = 3$]
    ),
    loigiai: [
        *Phương pháp giải:* Đặt điều kiện xác định $n >= 3$, khai triển các hệ số nhị thức theo công thức đại số và rút gọn chia cả hai vế cho $n > 0$.
        Điều kiện: $n >= 3$ và $n in NN$.
        Khai triển:
        $ n + (n(n - 1)) / 2 + (n(n - 1)(n - 2)) / 6 = (7n) / 2 $
        Vì $n >= 3$ nên $n != 0$, ta chia cả hai vế cho $n$:
        $ 1 + (n - 1) / 2 + (n^2 - 3n + 2) / 6 = 7 / 2 $
        Nhân cả hai vế với 6:
        $ 6 + 3(n - 1) + (n^2 - 3n + 2) = 21 <=> n^2 + 5 = 21 <=> n^2 = 16 $
        Do $n >= 3$ nên $n = 4$.
    ]
)

// TN 9 (Tổng hệ số)
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Tổng tất cả các hệ số trong khai triển của đa thức $P(x) = (3 - 2x)^5$ bằng],
    (
        True([$1$]),
        [$3125$],
        [$243$],
        [$-1$]
    ),
    loigiai: [
        *Phương pháp giải:* Tổng các hệ số của một đa thức $P(x)$ bằng giá trị của đa thức đó tại $x = 1$.
        Thay $x = 1$ vào biểu thức của $P(x)$:
        $ P(1) = (3 - 2(1))^5 = 1^5 = 1 $
        Vậy tổng tất cả các hệ số trong khai triển bằng $1$.
    ]
)

// TN 10 (Hàng dọc có 2 bạn không cạnh nhau)
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Có $7$ học sinh gồm $5$ nam và $2$ nữ xếp thành một hàng dọc. Có bao nhiêu cách xếp chỗ sao cho hai bạn nữ không đứng cạnh nhau?],
    (
        True([$3600$]),
        [$5040$],
        [$1440$],
        [$2880$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp vách ngăn. Xếp các bạn nam trước để tạo ra các vị trí xen kẽ, sau đó đặt các bạn nữ vào các khoảng trống đó.
        - Xếp 5 bạn nam thành hàng dọc: có $5! = 120$ cách.
        - Năm bạn nam tạo ra $5 + 1 = 6$ khoảng trống (ở 2 đầu và giữa các bạn nam).
        - Chọn và xếp 2 bạn nữ vào 6 khoảng trống: có $A_6^2 = 6 times 5 = 30$ cách.
        Theo quy tắc nhân:
        $ 120 times 30 = 3600 text(" cách") $
    ]
)

// TN 11 (Tập con có số phần tử chẵn)
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Cho tập hợp $S$ gồm $6$ phần tử. Số tập hợp con của $S$ có số phần tử là một số chẵn (kể cả tập rỗng) bằng],
    (
        True([$32$]),
        [$64$],
        [$16$],
        [$30$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng tính chất nhị thức Newton: trong tập hợp $n$ phần tử, số tập con có số phần tử chẵn bằng số tập con có số phần tử lẻ và bằng $2^(n - 1)$.
        Số tập con có số phần tử chẵn là:
        $ C_6^0 + C_6^2 + C_6^4 + C_6^6 = 2^(6 - 1) = 2^5 = 32 $
        (Kiểm tra trực tiếp: $1 + 15 + 15 + 1 = 32$).
    ]
)

// TN 12 (Hệ số lớn nhất)
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Hệ số có giá trị lớn nhất trong khai triển nhị thức Newton của biểu thức $(1 + 2x)^5$ bằng],
    (
        True([$80$]),
        [$40$],
        [$32$],
        [$160$]
    ),
    loigiai: [
        *Phương pháp giải:* Lập công thức hệ số tổng quát $a_k = C_5^k 2^k$ với $k in {0, 1, 2, 3, 4, 5}$, sau đó so sánh giá trị các hệ số.
        Các hệ số trong khai triển là:
        - $k = 0$: $a_0 = C_5^0 2^0 = 1$
        - $k = 1$: $a_1 = C_5^1 2^1 = 10$
        - $k = 2$: $a_2 = C_5^2 2^2 = 40$
        - $k = 3$: $a_3 = C_5^3 2^3 = 80$
        - $k = 4$: $a_4 = C_5^4 2^4 = 80$
        - $k = 5$: $a_5 = C_5^5 2^5 = 32$
        Giá trị lớn nhất của hệ số là $80$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Robot trên lưới tọa độ có CeTZ)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Một robot di chuyển trên lưới từ $O(0, 0)$ đến $B(5, 3)$ bằng các bước sang phải hoặc lên trên. Biết điểm $M(2, 1)$ là chướng ngại vật cấm đi qua.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số lộ trình di chuyển từ $O$ đến $B$ khi chưa xét điều kiện cấm bằng $56$.]),
    True([Số lộ trình di chuyển từ $O(0, 0)$ đến điểm $M(2, 1)$ bằng $3$.]),
    True([Số lộ trình di chuyển từ $O(0, 0)$ đến $B(5, 3)$ đi qua điểm cấm $M(2, 1)$ bằng $30$.]),
    [Số lộ trình hợp lệ tránh được điểm $M(2, 1)$ bằng $36$.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số lộ trình])
    $C_8^3 = 56$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Đến điểm M])
    $C_3^1 = 3$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Đi qua M])
    $C_3^1 times C_5^2 = 3 times 10 = 30$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tránh điểm M])
    $56 - 30 = 26$ (chứ không phải $36$). Khẳng định bằng $36$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Khai triển nhị thức Newton)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Cho biểu thức khai triển $Q(x) = (2x - 1 / x^2)^5$ với $x != 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số hạng tổng quát trong khai triển là $T_(k + 1) = C_5^k (-1)^k 2^(5 - k) x^(5 - 3k)$ với $k in {0, 1, ..., 5}$.]),
    True([Số hạng không chứa biến $x$ không tồn tại trong khai triển này.]),
    True([Hệ số của số hạng chứa $x^2$ ứng với $k = 1$ và có giá trị bằng $-80$.]),
    [Tổng các hệ số của khai triển khi thay $x = 1$ bằng $32$.]
  ),
  loigiai: [
    #step([Xét ý a: Số hạng tổng quát])
    $T_(k + 1) = C_5^k (2x)^(5 - k) (-x^(-2))^k = C_5^k (-1)^k 2^(5 - k) x^(5 - 3k)$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Số hạng không chứa x])
    $5 - 3k = 0 <=> k = 5 / 3 notin NN$. Không tồn tại số hạng độc lập với $x$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Số hạng chứa x^2])
    $5 - 3k = 2 <=> k = 1$. Hệ số: $C_5^1 (-1)^1 2^4 = 5 times (-1) times 16 = -80$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng các hệ số])
    Tại $x = 1$: $Q(1) = (2 - 1)^5 = 1^5 = 1$ (chứ không phải $32$). Mệnh đề d SAI.
  ]
)

// DS 3 (Đa giác đều 16 đỉnh)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Cho đa giác đều có $16$ đỉnh nội tiếp trong đường tròn tâm $O$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đa giác đều có tất cả $104$ đường chéo.]),
    True([Số hình chữ nhật có $4$ đỉnh là đỉnh của đa giác bằng $28$.]),
    True([Số tam giác vuông có $3$ đỉnh là đỉnh của đa giác bằng $112$.]),
    [Số tam giác vuông cân có $3$ đỉnh là đỉnh của đa giác bằng $32$.]
  ),
  loigiai: [
    #step([Xét ý a: Số đường chéo])
    $C_16^2 - 16 = 120 - 16 = 104$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Số hình chữ nhật])
    Có 8 đường kính. Số hình chữ nhật: $C_8^2 = 28$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Số tam giác vuông])
    $8 times (16 - 2) = 8 times 14 = 112$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số tam giác vuông cân])
    Đa giác 16 đỉnh có $8 / 2 = 4$ cặp đường kính vuông góc. Mỗi cặp tạo 4 tam giác vuông cân:
    $4 times 4 = 16$ (chứ không phải $32$). Mệnh đề d SAI.
  ]
)

// DS 4 (Phương trình tổ hợp)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Xét phương trình $C_n^1 + C_n^2 + C_n^3 = (7n) / 2$ với $n in NN, n >= 3$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện xác định của phương trình là $n >= 3$ và $n in NN$.]),
    True([Sau khi chia hai vế cho $n$, phương trình quy về $n^2 + 5 = 21$.]),
    True([Nghiệm nguyên dương của phương trình là $n = 4$.]),
    [Giá trị của $A_n^4$ tại nghiệm $n = 4$ bằng $120$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Giải phương trình])
    Phương trình tương đương $n^2 = 16 => n = 4$ (do $n >= 3$).
    Các mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Tính An^4 tại n = 4])
    $A_4^4 = 4! = 24$ (chứ không phải $120$). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Tìm hệ số của số hạng chứa $x^3$ trong khai triển của biểu thức $P(x) = (1 + 2x)^4 (1 - x)$.],
    [8],
    loigiai: [
        #step([Tính toán])
        $ (1 + 8x + 24x^2 + 32x^3 + 16x^4)(1 - x) => 32 - 24 = 8 $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Một robot di chuyển trên lưới từ $O(0, 0)$ đến $B(5, 3)$ bằng các bước sang phải hoặc lên trên. Biết không được qua $M(2, 1)$, có bao nhiêu lộ trình hợp lệ?],
    [26],
    loigiai: [
        #step([Phần bù])
        $ C_8^3 - C_3^1 times C_5^2 = 56 - 30 = 26 text(" lộ trình") $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Cho đa giác đều có $16$ đỉnh. Có bao nhiêu hình chữ nhật có $4$ đỉnh là các đỉnh của đa giác đều đó?],
    [28],
    loigiai: [
        #step([Số hình chữ nhật])
        $ C_8^2 = 28 text(" hình chữ nhật") $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Tìm số nguyên dương $n$ thỏa mãn phương trình: $C_n^1 + C_n^2 + C_n^3 = (7n) / 2$.],
    [4],
    loigiai: [
        #step([Giải phương trình])
        $ n^2 = 16 => n = 4 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Tìm giá trị lớn nhất của các hệ số trong khai triển nhị thức Newton $(1 + 2x)^5$.],
    [80],
    loigiai: [
        #step([Hệ số lớn nhất])
        $ C_5^3 cdot 2^3 = C_5^4 cdot 2^4 = 80 $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 182], back-to: "sec-exercise-hub",[Phương trình $x_1 + x_2 + x_3 = 10$ có bao nhiêu bộ nghiệm nguyên dương $(x_1, x_2, x_3)$?],
    [36],
    loigiai: [
        #step([Stars and Bars])
        $ C_9^2 = 36 text(" bộ nghiệm") $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP (ĐỀ SỐ 29A - MÃ ĐỀ 182)!]      #v(0.6em)
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
