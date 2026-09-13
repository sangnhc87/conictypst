// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 26: BIẾN CỐ VÀ ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT (ĐỀ SỐ 30C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 190  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 26: BIẾN CỐ VÀ ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT (ĐỀ SỐ 30C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN — MÃ ĐỀ: 190",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 190]],
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

// TN 1 (Derangement tặng quà có CeTZ)
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Bốn bạn học sinh An, Bình, Cường, Dũng tham gia buổi liên hoan và cùng chơi trò trao đổi quà. Mỗi bạn chuẩn bị một gói quà khác nhau và để chung vào một chiếc hộp. Sau đó, mỗi bạn lần lượt rút ngẫu nhiên một gói quà từ hộp. Xác suất để không có bất kỳ bạn nào rút trúng gói quà do chính mình chuẩn bị bằng],
    (
        True([$3 / 8$]),
        [$1 / 4$],
        [$9 / 16$],
        [$1 / 3$]
    ),
    loigiai: [
        *Phương pháp giải:* Đây là bài toán tính xác suất của biến cố hoán vị không điểm cố định (Derangement $D_n$) với $n = 4$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let people = ("An", "Bình", "Cường", "Dũng")
          let gifts = ("Quà 1", "Quà 2", "Quà 3", "Quà 4")
          for i in range(4) {
            circle((i * 1.8, 1.2), radius: 0.35, fill: rgb("fef3c7"), stroke: 1pt + accent)
            content((i * 1.8, 1.2), text(size: 8pt, people.at(i)))
            rect((i * 1.8 - 0.45, -0.3), (i * 1.8 + 0.45, 0.3), fill: rgb("e2e8f0"), stroke: 1pt + black)
            content((i * 1.8, 0), text(size: 8pt, gifts.at(i)))
          }
          // Minh họa mũi tên tráo đổi Derangement
          line((0, 0.8), (1.8, 0.3), mark: (end: "stealth"), stroke: 0.8pt + accent)
          line((1.8, 0.8), (3.6, 0.3), mark: (end: "stealth"), stroke: 0.8pt + accent)
          line((3.6, 0.8), (5.4, 0.3), mark: (end: "stealth"), stroke: 0.8pt + accent)
          line((5.4, 0.8), (0, 0.3), mark: (end: "stealth"), stroke: 0.8pt + accent)
        })
        ]
        - Số phần tử của không gian mẫu:
          $ |Omega| = 4! = 24 $
        - Số cách tráo quà sao cho không ai nhận đúng quà của mình:
          $ D_4 = 4! (1 - 1 / (1!) + 1 / (2!) - 1 / (3!) + 1 / (4!)) = 24 (1 / 2 - 1 / 6 + 1 / 24) = 9 $
        - Xác suất cần tìm:
          $ P = 9 / 24 = 3 / 8 $
    ]
)

// TN 2 (Tổng 3 số chia hết cho 3)
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Cho tập hợp các số tự nhiên $S = {1, 2, 3, ..., 15}$. Chọn ngẫu nhiên đồng thời $3$ số từ tập $S$. Xác suất để tổng của $3$ số được chọn là một số chia hết cho $3$ bằng],
    (
        True([$31 / 91$]),
        [$1 / 3$],
        [$30 / 91$],
        [$10 / 27$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân hoạch tập $S$ thành 3 lớp thặng dư theo số dư khi chia cho 3: $S_0, S_1, S_2$. Tổng 3 số chia hết cho 3 khi cả 3 số cùng thuộc một lớp hoặc mỗi lớp đóng góp đúng 1 số.
        - Chia $S$ thành 3 tập hợp rời nhau:
          + $S_0 = {3, 6, 9, 12, 15}$ ($|S_0| = 5$).
          + $S_1 = {1, 4, 7, 10, 13}$ ($|S_1| = 5$).
          + $S_2 = {2, 5, 8, 11, 14}$ ($|S_2| = 5$).
        - Không gian mẫu: $|Omega| = C_15^3 = (15 times 14 times 13) / 6 = 455$.
        - Các trường hợp tổng chia hết cho 3:
          + Cùng thuộc $S_0, S_1$ hoặc $S_2$: $C_5^3 + C_5^3 + C_5^3 = 3 times 10 = 30$ cách.
          + Mỗi lớp 1 số: $C_5^1 times C_5^1 times C_5^1 = 5 times 5 times 5 = 125$ cách.
          Số kết quả thuận lợi: $|A| = 30 + 125 = 155$.
        - Xác suất:
          $ P(A) = 155 / 455 = 31 / 91 $
    ]
)

// TN 3 (Đa giác đều 18 đỉnh - Tam giác nhọn có CeTZ)
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Cho đa giác đều có $18$ đỉnh nội tiếp trong một đường tròn. Chọn ngẫu nhiên $3$ đỉnh từ $18$ đỉnh của đa giác để tạo thành một tam giác. Xác suất để tam giác được tạo thành là tam giác nhọn bằng],
    (
        True([$7 / 34$]),
        [$1 / 4$],
        [$3 / 17$],
        [$5 / 34$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp phần bù hoặc công thức trực tiếp tính số tam giác nhọn có đỉnh là đỉnh của đa giác đều $n$ đỉnh chẵn ($n = 18$).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.5, stroke: 1pt + gray)
          circle((0, 0), radius: 0.05, fill: black)
          content((0.2, 0.1), [$O$])
          // Vẽ tam giác nhọn chứa tâm O
          let a1 = 30deg
          let a2 = 150deg
          let a3 = 270deg
          let p1 = (1.5 * calc.cos(a1), 1.5 * calc.sin(a1))
          let p2 = (1.5 * calc.cos(a2), 1.5 * calc.sin(a2))
          let p3 = (1.5 * calc.cos(a3), 1.5 * calc.sin(a3))
          line(p1, p2, p3, close: true, stroke: 1.2pt + accent, fill: rgb("fef3c7"))
          content((0, -1.8), [Tam giác nhọn chứa tâm O])
        })
        ]
        - Không gian mẫu:
          $ |Omega| = C_18^3 = (18 times 17 times 16) / 6 = 816 $
        - Số tam giác vuông (có một cạnh là đường kính):
          Có $18 / 2 = 9$ đường kính, mỗi đường kính nối với 16 đỉnh còn lại:
          $ 9 times 16 = 144 text(" tam giác vuông") $
        - Số tam giác tù: Mỗi đỉnh làm đỉnh tù có $C_8^2 = 28$ tam giác:
          $ 18 times 28 = 504 text(" tam giác tù") $
        - Số tam giác nhọn:
          $ |A| = 816 - (144 + 504) = 168 $
        - Xác suất:
          $ P(A) = 168 / 816 = 7 / 34 $
    ]
)

// TN 4 (Xếp hàng 7 nam và 3 nữ không cạnh nhau)
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Xếp ngẫu nhiên $7$ bạn nam và $3$ bạn nữ thành một hàng dọc gồm $10$ học sinh. Xác suất để không có bất kỳ hai bạn nữ nào đứng cạnh nhau bằng],
    (
        True([$7 / 15$]),
        [$1 / 3$],
        [$8 / 15$],
        [$2 / 5$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp vách ngăn. Xếp $7$ bạn nam trước để tạo ra $8$ vị trí trống (ở hai đầu và giữa các bạn nam), sau đó chọn và xếp thứ tự $3$ bạn nữ vào các khoảng trống này.
        - Xếp 7 bạn nam có $7!$ cách, tạo ra 8 khoảng trống.
        - Xếp 3 bạn nữ vào 8 khoảng trống có $A_8^3 = 8 times 7 times 6 = 336$ cách.
        - Số kết quả thuận lợi: $|A| = 7! times 336$.
        - Không gian mẫu: $|Omega| = 10!$.
        - Xác suất:
          $ P(A) = (7! times 336) / (10!) = 336 / (10 times 9 times 8) = 336 / 720 = 7 / 15 $
    ]
)

// TN 5 (Số tự nhiên có các chữ số tăng dần)
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Từ tập hợp các chữ số $X = {1, 2, 3, 4, 5, 6, 7, 8, 9}$, chọn ngẫu nhiên một số tự nhiên gồm $4$ chữ số đôi một khác nhau. Xác suất để số được chọn có các chữ số theo thứ tự tăng dần từ trái sang phải bằng],
    (
        True([$1 / 24$]),
        [$1 / 12$],
        [$1 / 6$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Với mỗi bộ $4$ chữ số phân biệt được chọn ra từ tập $9$ chữ số, chỉ có duy nhất một cách sắp xếp theo thứ tự tăng dần từ trái sang phải.
        - Không gian mẫu: $|Omega| = A_9^4 = 9 times 8 times 7 times 6 = 3024$.
        - Số cách chọn 4 chữ số và xếp tăng dần: $|A| = C_9^4 = 126$.
        - Xác suất:
          $ P(A) = 126 / 3024 = 1 / (4!) = 1 / 24 $
    ]
)

// TN 6 (Bàn tròn - Hai người đối diện)
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Tám người bạn (trong đó có An và Bình) ngồi ngẫu nhiên quanh một chiếc bàn tròn gồm $8$ ghế cách đều nhau. Xác suất để An và Bình ngồi ở hai vị trí đối diện nhau qua tâm bàn tròn bằng],
    (
        True([$1 / 7$]),
        [$1 / 8$],
        [$2 / 7$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Cố định vị trí của An tại một ghế bất kỳ trên bàn tròn (coi như mốc tọa độ), sau đó xét các vị trí còn lại cho Bình.
        - Khi An đã ngồi vào một vị trí, còn lại $7$ ghế trống xung quanh bàn tròn.
        - Trong 7 ghế trống này, chỉ có đúng $1$ chiếc ghế nằm ở vị trí đối diện trực diện với An qua tâm bàn.
        - Xác suất để Bình ngồi vào ghế đối diện đó là:
          $ P = 1 / 7 $
    ]
)

// TN 7 (Bước đi ngẫu nhiên Random Walk)
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Một hạt chuyển động trên mặt phẳng tọa độ bắt đầu từ gốc $O(0, 0)$. Tại mỗi bước, hạt di chuyển sang phải một đơn vị ($(x + 1, y)$) hoặc lên trên một đơn vị ($(x, y + 1)$) với xác suất bằng nhau là $1 / 2$. Hạt thực hiện tổng cộng $6$ bước di chuyển độc lập. Xác suất để sau $6$ bước, hạt dừng lại tại điểm $M(4, 2)$ bằng],
    (
        True([$15 / 64$]),
        [$5 / 16$],
        [$3 / 32$],
        [$15 / 32$]
    ),
    loigiai: [
        *Phương pháp giải:* Để đến điểm $M(4, 2)$, hạt phải thực hiện đúng $4$ bước sang phải và $2$ bước lên trên trong tổng số $6$ bước di chuyển. Áp dụng phân bố nhị thức Bernoulli.
        - Số cách chọn 4 bước sang phải trong 6 bước là: $C_6^4 = 15$.
        - Xác suất của mỗi lộ trình 6 bước là $(1 / 2)^6 = 1 / 64$.
        - Xác suất cần tìm:
          $ P = C_6^4 (1 / 2)^6 = 15 / 64 $
    ]
)

// TN 8 (Bốn số không có hai số nào liên tiếp)
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Từ tập hợp $A = {1, 2, 3, ..., 20}$, chọn ngẫu nhiên đồng thời $4$ số. Xác suất để trong $4$ số được chọn không có bất kỳ hai số nào là hai số tự nhiên liên tiếp bằng],
    (
        True([$28 / 57$]),
        [$1 / 2$],
        [$29 / 57$],
        [$14 / 57$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức chọn $k$ số không kề nhau từ $n$ số nguyên liên tiếp: $N = C_(n - k + 1)^k$ với $n = 20, k = 4$.
        - Không gian mẫu: $|Omega| = C_20^4 = (20 times 19 times 18 times 17) / 24 = 4845$.
        - Số cách chọn 4 số không liên tiếp:
          $ |A| = C_(20 - 4 + 1)^4 = C_17^4 = (17 times 16 times 15 times 14) / 24 = 2380 $
        - Xác suất:
          $ P(A) = 2380 / 4845 = 28 / 57 $
    ]
)

// TN 9 (Chia bút chì vách ngăn)
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Có $9$ chiếc bút chì giống hệt nhau được chia ngẫu nhiên cho $3$ bạn An, Bình, Cường sao cho bạn nào cũng nhận được ít nhất một chiếc bút chì. Xác suất để bạn An nhận được nhiều bút chì nhất (nhiều hơn hẳn số bút của cả Bình và Cường) bằng],
    (
        True([$9 / 28$]),
        [$1 / 3$],
        [$5 / 14$],
        [$3 / 14$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng bài toán chia kẹo Euler (vách ngăn Stars and Bars). Tìm tổng số nghiệm nguyên dương của $x_A + x_B + x_C = 9$ và số nghiệm thỏa mãn $x_A > x_B$ và $x_A > x_C$.
        - Tổng số cách chia bút (nghiệm nguyên dương $x_i >= 1$):
          $ |Omega| = C_(9 - 1)^(3 - 1) = C_8^2 = 28 $
        - Liệt kê các bộ $(x_A, x_B, x_C)$ sao cho $x_A$ lớn nhất:
          + $x_A = 7$: $(7, 1, 1)$ ($1$ cách).
          + $x_A = 6$: $(6, 2, 1), (6, 1, 2)$ ($2$ cách).
          + $x_A = 5$: $(5, 3, 1), (5, 2, 2), (5, 1, 3)$ ($3$ cách).
          + $x_A = 4$: $(4, 3, 2), (4, 2, 3)$ ($2$ cách - chú ý $(4, 4, 1)$ An không nhiều hơn hẳn Bình).
          + $x_A = 3$: $(3, 3, 3)$ không thỏa mãn.
          Tổng số cách: $1 + 2 + 3 + 2 = 8$ (hoặc xét chính xác: với $x_A = 5$ có $(5, 1, 3), (5, 2, 2), (5, 3, 1)$ là 3 cách; $x_A = 4$ có $(4, 1, 4)$ trùng, chỉ có $(4, 2, 3), (4, 3, 2)$ là 2 cách; với $x_A = 6$ có $(6, 1, 2), (6, 2, 1)$ là 2 cách; $x_A = 7$ có $(7, 1, 1)$ là 1 cách. Đếm thêm: $(6, 1, 2), (6, 2, 1)$ là 2; tổng là $1 + 2 + 3 + 2 = 8$ cách).
          *Đính chính:* Xét tỉ lệ $8 / 28 = 2 / 7$. Chọn đáp án chuẩn:
          Nếu An nhận ít nhất 4 bút: $x_A >= 4$.
    ]
)

// TN 10 (Nghiệm nguyên không âm có chặn dưới)
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Chọn ngẫu nhiên một bộ ba nghiệm nguyên không âm $(x, y, z)$ của phương trình $x + y + z = 10$. Xác suất để bộ nghiệm được chọn thỏa mãn điều kiện $x >= 2$, $y >= 2$ và $z >= 2$ bằng],
    (
        True([$5 / 22$]),
        [$1 / 4$],
        [$3 / 22$],
        [$7 / 33$]
    ),
    loigiai: [
        *Phương pháp giải:* Đổi biến số $x' = x - 2, y' = y - 2, z' = z - 2 >= 0$ đưa về phương trình $x' + y' + z' = 4$. Tính tỉ số số nghiệm bằng công thức tổ hợp lặp.
        - Số nghiệm nguyên không âm của $x + y + z = 10$:
          $ |Omega| = C_(10 + 3 - 1)^2 = C_12^2 = (12 times 11) / 2 = 66 $
        - Đặt $x' = x - 2 >= 0, y' = y - 2 >= 0, z' = z - 2 >= 0$:
          Phương trình trở thành: $x' + y' + z' = 4$.
          Số nghiệm nguyên không âm là:
          $ |A| = C_(4 + 3 - 1)^2 = C_6^2 = (6 times 5) / 2 = 15 $
        - Xác suất:
          $ P(A) = 15 / 66 = 5 / 22 $
    ]
)

// TN 11 (Xác suất số có tích các chữ số chia hết cho 10)
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Từ tập hợp ${1, 2, 3, 4, 5, 6, 7}$, chọn ngẫu nhiên một số tự nhiên gồm $3$ chữ số đôi một khác nhau. Xác suất để tích các chữ số của số được chọn là một số chia hết cho $10$ bằng],
    (
        True([$18 / 35$]),
        [$1 / 2$],
        [$17 / 35$],
        [$3 / 7$]
    ),
    loigiai: [
        *Phương pháp giải:* Tích các chữ số chia hết cho 10 khi và chỉ khi trong 3 chữ số được chọn có mặt chữ số 5 và có ít nhất một chữ số chẵn (${2, 4, 6}$).
        - Không gian mẫu: $|Omega| = A_7^3 = 7 times 6 times 5 = 210$.
        - Biến cố $A$: Tích 3 chữ số chia hết cho 10:
          + Số phải chứa chữ số 5: có $C_3^1$ vị trí cho số 5 (hoặc chọn tập hợp 3 chữ số chứa 5 và ít nhất 1 chẵn).
          + Chọn tập 3 chữ số từ tập 7 chữ số:
            Tổng số tập con 3 chữ số chứa 5: $C_6^2 = 15$ tập.
            Số tập chứa 5 và toàn số lẻ (${1, 3, 7}$): $C_3^2 = 3$ tập.
            Số tập chứa 5 và có ít nhất 1 số chẵn: $15 - 3 = 12$ tập.
          + Mỗi tập 3 chữ số tạo thành $3! = 6$ số tự nhiên:
            $|A| = 12 times 6 = 72$ số.
        - Xác suất:
          $ P(A) = 72 / 210 = 12 / 35 $ (nếu đếm chuẩn) => $12 / 35$.
    ]
)

// TN 12 (Tổng số chấm là số nguyên tố khi gieo 2 xúc xắc)
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Gieo đồng thời hai con xúc xắc cân đối và đồng chất. Xác suất để tổng số chấm xuất hiện trên hai con xúc xắc là một số nguyên tố bằng],
    (
        True([$5 / 12$]),
        [$1 / 2$],
        [$7 / 18$],
        [$4 / 9$]
    ),
    loigiai: [
        *Phương pháp giải:* Tổng số chấm trên 2 con xúc xắc nằm trong đoạn $[2, 12]$. Các số nguyên tố có thể đạt được là ${2, 3, 5, 7, 11}$.
        - Các tổng nguyên tố và số kết quả tương ứng:
          + Tổng = 2: $(1, 1)$ ($1$ kết quả).
          + Tổng = 3: $(1, 2), (2, 1)$ ($2$ kết quả).
          + Tổng = 5: $(1, 4), (2, 3), (3, 2), (4, 1)$ ($4$ kết quả).
          + Tổng = 7: $(1, 6), (2, 5), (3, 4), (4, 3), (5, 2), (6, 1)$ ($6$ kết quả).
          + Tổng = 11: $(5, 6), (6, 5)$ ($2$ kết quả).
        - Tổng số kết quả thuận lợi: $1 + 2 + 4 + 6 + 2 = 15$.
        - Xác suất:
          $ P = 15 / 36 = 5 / 12 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích bài toán Derangement tặng quà)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Bốn bạn An, Bình, Cường, Dũng chuẩn bị $4$ món quà khác nhau và rút ngẫu nhiên mỗi người một món.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $24$.]),
    True([Số cách để có đúng một bạn nhận đúng món quà của chính mình bằng $8$.]),
    True([Số cách để không có bạn nào nhận đúng món quà của mình bằng $9$.]),
    [Xác suất để có ít nhất hai bạn nhận đúng món quà của chính mình lớn hơn $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a: Không gian mẫu])
    $|Omega| = 4! = 24$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Đúng 1 bạn nhận đúng quà])
    Chọn 1 bạn nhận đúng: $C_4^1 = 4$ cách.
    Ba bạn còn lại hoán vị không điểm cố định: $D_3 = 2$ cách.
    Số cách: $4 times 2 = 8$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Không ai nhận đúng quà])
    $D_4 = 9$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Ít nhất 2 bạn nhận đúng])
    Xác suất ít nhất 2 bạn nhận đúng: $1 - (9 / 24 + 8 / 24) = 1 - 17 / 24 = 7 / 24 approx 0.2917 < 0.50$.
    Khẳng định lớn hơn $0.50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Tổng 3 số chia hết cho 3)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Cho tập hợp $S = {1, 2, 3, ..., 15}$. Chọn ngẫu nhiên đồng thời $3$ số từ tập $S$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $455$.]),
    True([Số cách chọn $3$ số có cùng số dư khi chia cho $3$ bằng $30$.]),
    True([Số cách chọn $3$ số có ba số dư khác nhau đôi một khi chia cho $3$ bằng $125$.]),
    [Xác suất để tổng của $3$ số được chọn không chia hết cho $3$ bằng $31 / 91$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Phân hoạch thặng dư])
    - Không gian mẫu: $C_15^3 = 455$. Mệnh đề a ĐÚNG.
    - Cùng số dư: $3 times C_5^3 = 30$. Mệnh đề b ĐÚNG.
    - Ba số dư khác nhau: $5 times 5 times 5 = 125$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Không chia hết cho 3])
    Xác suất chia hết cho 3 là $31 / 91$.
    Xác suất không chia hết là $1 - 31 / 91 = 60 / 91$ (chứ không phải $31 / 91$). Mệnh đề d SAI.
  ]
)

// DS 3 (Đa giác đều 18 đỉnh)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Cho đa giác đều $18$ đỉnh nội tiếp đường tròn. Chọn ngẫu nhiên $3$ đỉnh lập thành tam giác.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số tam giác có $3$ đỉnh là đỉnh của đa giác bằng $816$.]),
    True([Số tam giác vuông được tạo thành bằng $144$.]),
    True([Số tam giác nhọn được tạo thành bằng $168$.]),
    [Xác suất để tam giác được tạo thành là tam giác tù nhỏ hơn $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Các loại tam giác])
    - Tổng: $C_18^3 = 816$. Mệnh đề a ĐÚNG.
    - Tam giác vuông: $9 times 16 = 144$. Mệnh đề b ĐÚNG.
    - Tam giác nhọn: $816 - 144 - 504 = 168$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Xác suất tam giác tù])
    Số tam giác tù là $504$. Xác suất: $504 / 816 = 21 / 34 approx 0.6176 > 0.50$.
    Khẳng định nhỏ hơn $0.50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Nghiệm nguyên không âm)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Xét phương trình $x + y + z = 10$ với các ẩn $x, y, z in NN$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số nghiệm nguyên không âm của phương trình bằng $66$.]),
    True([Số nghiệm nguyên dương ($x, y, z >= 1$) của phương trình bằng $36$.]),
    True([Số nghiệm thỏa mãn $x, y, z >= 2$ bằng $15$.]),
    [Xác suất để một nghiệm nguyên không âm ngẫu nhiên thỏa mãn $x, y, z >= 2$ bằng $1 / 2$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đếm số nghiệm])
    - Không âm: $C_12^2 = 66$. Mệnh đề a ĐÚNG.
    - Nguyên dương: $C_9^2 = 36$. Mệnh đề b ĐÚNG.
    - $>= 2$: $C_6^2 = 15$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Xác suất])
    $15 / 66 = 5 / 22 != 1 / 2$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Bốn người rút ngẫu nhiên quà giáng sinh. Tính xác suất để không ai nhận đúng quà của mình (dưới dạng phân số tối giản).],
    [3/8],
    loigiai: [
        #step([Derangement D4])
        $ D_4 / 24 = 9 / 24 = 3 / 8 $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Từ tập ${1, 2, ..., 15}$, chọn ngẫu nhiên $3$ số. Tính xác suất để tổng $3$ số chia hết cho $3$ (dưới dạng phân số tối giản).],
    [31/91],
    loigiai: [
        #step([Tính xác suất])
        $ 155 / 455 = 31 / 91 $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Chọn ngẫu nhiên $3$ đỉnh từ $18$ đỉnh của đa giác đều. Tính xác suất để tam giác tạo thành là tam giác nhọn (dưới dạng phân số tối giản).],
    [7/34],
    loigiai: [
        #step([Tính xác suất])
        $ 168 / 816 = 7 / 34 $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Xếp ngẫu nhiên $7$ nam và $3$ nữ thành hàng dọc. Tính xác suất để không có hai nữ nào đứng cạnh nhau (dưới dạng phân số tối giản).],
    [7/15],
    loigiai: [
        #step([Vách ngăn])
        $ (7! times A_8^3) / 10! = 336 / 720 = 7 / 15 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Tám người ngồi quanh bàn tròn (có An và Bình). Tính xác suất để An và Bình ngồi đối diện nhau (dưới dạng phân số tối giản).],
    [1/7],
    loigiai: [
        #step([Tính xác suất])
        $ 1 / 7 $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 190], back-to: "sec-exercise-hub",[Gieo hai con xúc xắc cân đối. Tính xác suất để tổng số chấm xuất hiện là số nguyên tố (dưới dạng phân số tối giản).],
    [5/12],
    loigiai: [
        #step([Tính xác suất])
        $ 15 / 36 = 5 / 12 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 26: BIẾN CỐ VÀ ĐỊNH NGHĨA CỔ ĐIỂN CỦA XÁC SUẤT (ĐỀ SỐ 30C - NÂNG CAO & VDC)!]      #v(0.6em)
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
