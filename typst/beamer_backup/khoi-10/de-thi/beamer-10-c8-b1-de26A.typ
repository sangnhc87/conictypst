// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 23: QUY TẮC ĐẾM (ĐỀ SỐ 26A - MỨC ĐỘ KHÁ - GIỎI)
// Lớp: Khối 10  ·  Mã đề: 173  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 23: QUY TẮC ĐẾM (ĐỀ SỐ 26A - MỨC ĐỘ KHÁ - GIỎI)",
  subtitle: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP — MÃ ĐỀ: 173",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 173]],
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
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Từ tập hợp các chữ số $S = {1, 2, 3, 4, 5, 6, 7, 8, 9}$, có thể lập được bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau $overline(a_1 a_2 a_3 a_4 a_5)$ sao cho các chữ số ở vị trí lẻ ($a_1, a_3, a_5$) là chữ số lẻ, còn các chữ số ở vị trí chẵn ($a_2, a_4$) là chữ số chẵn?],
    (
        True([$720$]),
        [$360$],
        [$1440$],
        [$120$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân loại tập hợp nguồn theo tính chẵn - lẻ, sau đó áp dụng quy tắc nhân chia bài toán thành hai công đoạn chọn và xếp vị trí độc lập.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          let w = 1.1
          let h = 0.7
          let labels = ([$a_1$ (Lẻ)], [$a_2$ (Chẵn)], [$a_3$ (Lẻ)], [$a_4$ (Chẵn)], [$a_5$ (Lẻ)])
          let fills = (rgb("dbeafe"), rgb("fef3c7"), rgb("dbeafe"), rgb("fef3c7"), rgb("dbeafe"))
          for i in range(5) {
            rect((i * 1.3, 0), (i * 1.3 + w, h), fill: fills.at(i), stroke: 1pt + accent)
            content((i * 1.3 + w/2, h/2), labels.at(i))
          }
        })
        ]
        Tập $S$ gồm $5$ chữ số lẻ ${1, 3, 5, 7, 9}$ và $4$ chữ số chẵn ${2, 4, 6, 8}$.
        - #step([Công đoạn 1: Chọn và xếp các chữ số ở vị trí lẻ a1, a3, a5])
          Chọn $3$ chữ số lẻ từ $5$ chữ số lẻ và xếp thứ tự vào $3$ vị trí lẻ ($a_1, a_3, a_5$):
          $ A_5^3 = 5 times 4 times 3 = 60 text(" cách") $
        - #step([Công đoạn 2: Chọn và xếp các chữ số ở vị trí chẵn a2, a4])
          Chọn $2$ chữ số chẵn từ $4$ chữ số chẵn và xếp thứ tự vào $2$ vị trí chẵn ($a_2, a_4$):
          $ A_4^2 = 4 times 3 = 12 text(" cách") $
        Theo quy tắc nhân, tổng số các số tự nhiên thỏa mãn là:
        $ 60 times 12 = 720 text(" số") $
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Một robot di chuyển trên mặt phẳng tọa độ từ gốc $O(0, 0)$ đến điểm đích $B(4, 3)$. Mỗi bước đi, robot chỉ có thể di chuyển sang phải $1$ đơn vị (từ $(x, y)$ đến $(x + 1, y)$) hoặc đi lên trên $1$ đơn vị (từ $(x, y)$ đến $(x, y + 1)$). Biết rằng robot không được phép đi qua điểm chướng ngại vật $A(2, 2)$. Có bao nhiêu lộ trình di chuyển hợp lệ từ $O$ đến $B$?],
    (
        True([$17$]),
        [$35$],
        [$18$],
        [$24$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp đếm bằng phần bù (Complementary Counting). Lấy tổng số lộ trình di chuyển từ $O$ đến $B$ trừ đi số lộ trình đi qua điểm cấm $A$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for x in range(5) {
            line((x, 0), (x, 3), stroke: 0.5pt + gray)
          }
          for y in range(4) {
            line((0, y), (4, y), stroke: 0.5pt + gray)
          }
          circle((0, 0), radius: 0.12, fill: accent)
          content((0, -0.3), [$O(0,0)$])
          
          circle((4, 3), radius: 0.12, fill: accent)
          content((4, 3.3), [$B(4,3)$])
          
          circle((2, 2), radius: 0.15, fill: red)
          content((2, 2.35), [$A(2,2)$ (Cấm)], fill: red)
          
          // Vẽ mũi tên lộ trình mẫu hợp lệ
          line((0,0), (1,0), (2,0), (2,1), (3,1), (4,1), (4,2), (4,3), stroke: 1.2pt + accent)
        })
        ]
        - #step([Tổng số lộ trình từ O(0, 0) đến B(4, 3)])
          Để đến $B(4, 3)$, robot phải thực hiện đúng $4$ bước sang phải ($R$) và $3$ bước đi lên ($U$), tổng cộng $4 + 3 = 7$ bước.
          Mỗi lộ trình là một cách chọn $3$ vị trí cho bước $U$ trong dãy 7 bước:
          $ C_7^3 = (7 times 6 times 5) / (3 times 2 times 1) = 35 text(" lộ trình") $
        - #step([Số lộ trình đi qua chướng ngại vật A(2, 2)])
          Lộ trình qua $A(2, 2)$ gồm hai chặng liên tiếp:
          + Chặng $1$ (từ $O(0, 0)$ đến $A(2, 2)$): cần 2 bước sang phải và 2 bước đi lên:
            $ C_4^2 = (4 times 3) / 2 = 6 text(" cách") $
          + Chặng $2$ (từ $A(2, 2)$ đến $B(4, 3)$): cần thêm 2 bước sang phải và 1 bước đi lên:
            $ C_3^1 = 3 text(" cách") $
          Số lộ trình đi qua điểm $A$ là: $6 times 3 = 18$ lộ trình.
        - #step([Lấy phần bù])
          Số lộ trình hợp lệ tránh điểm $A(2, 2)$ là:
          $ 35 - 18 = 17 text(" lộ trình") $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Từ các chữ số thuộc tập hợp $X = {0, 1, 2, 3, 4, 5}$, có thể lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau và chia hết cho $6$?],
    (
        True([$52$]),
        [$60$],
        [$48$],
        [$36$]
    ),
    loigiai: [
        *Phương pháp giải:* Một số chia hết cho 6 khi và chỉ khi nó là số chẵn (chữ số tận cùng $d in {0, 2, 4}$) và tổng các chữ số $a + b + c + d$ chia hết cho 3. Ta tìm các tập con 4 phần tử có tổng chia hết cho 3 bằng cách loại đi 2 phần tử có tổng chia hết cho 3 từ tổng 15 của tập $X$.
        Các cặp 2 chữ số có tổng chia hết cho 3 cần bỏ đi là: ${0, 3}, {1, 2}, {1, 5}, {2, 4}, {4, 5}$.
        - #step([TH1: Bỏ cặp {0, 3}]) Bốn chữ số còn lại là ${1, 2, 4, 5}$ (không chứa số 0).
          Chữ số tận cùng $d in {2, 4}$ (có $2$ cách).
          Ba chữ số còn lại xếp vào 3 vị trí đầu có $3! = 6$ cách.
          Số lượng: $2 times 6 = 12$ số.
        - #step([TH2: Bỏ cặp {1, 2}]) Bốn chữ số là ${0, 3, 4, 5}$.
          + Nếu $d = 0$: $a, b, c$ xếp từ ${3, 4, 5}$ có $3! = 6$ số.
          + Nếu $d = 4$: $a in {3, 5}$ (2 cách), $b, c$ có $2! = 2$ cách $=> 2 times 2 = 4$ số.
          Số lượng TH2: $6 + 4 = 10$ số.
        - #step([TH3: Bỏ cặp {1, 5}]) Bốn chữ số là ${0, 2, 3, 4}$.
          + Nếu $d = 0$: có $3! = 6$ số.
          + Nếu $d in {2, 4}$ (2 cách): $a in {3, 4}$ hoặc $a in {2, 3}$ (2 cách), $b, c$ có 2 cách $=> 2 times 2 times 2 = 8$ số.
          Số lượng TH3: $6 + 8 = 14$ số.
        - #step([TH4: Bỏ cặp {2, 4}]) Bốn chữ số là ${0, 1, 3, 5}$.
          Chỉ có $d = 0$ (1 cách). Số lượng: $1 times 3! = 6$ số.
        - #step([TH5: Bỏ cặp {4, 5}]) Bốn chữ số là ${0, 1, 2, 3}$.
          + Nếu $d = 0$: có $3! = 6$ số.
          + Nếu $d = 2$: $a in {1, 3}$ (2 cách), $b, c$ có 2 cách $=> 1 times 2 times 2 = 4$ số.
          Số lượng TH5: $6 + 4 = 10$ số.
        Theo quy tắc cộng:
        $ 12 + 10 + 14 + 6 + 10 = 52 text(" số") $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Trong các số tự nhiên từ $1$ đến $1000$, có bao nhiêu số chia hết cho ít nhất một trong ba số $2, 3$ hoặc $5$?],
    (
        True([$734$]),
        [$700$],
        [$667$],
        [$750$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng Nguyên lý bù trừ (Principle of Inclusion-Exclusion - PIE) cho 3 tập hợp hữu hạn.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((-0.7, 0.5), radius: 1.2, stroke: 1pt + blue)
          content((-1.4, 1.2), [$A$ (chia hết 2)])
          
          circle((0.7, 0.5), radius: 1.2, stroke: 1pt + red)
          content((1.4, 1.2), [$B$ (chia hết 3)])
          
          circle((0, -0.6), radius: 1.2, stroke: 1pt + green)
          content((0, -2.0), [$C$ (chia hết 5)])
          
          content((0, 0.2), [$A inter B inter C$])
        })
        ]
        Gọi $A, B, C$ lần lượt là tập hợp các số tự nhiên từ 1 đến 1000 chia hết cho 2, 3, 5:
        - $|A| = floor(1000 / 2) = 500$
        - $|B| = floor(1000 / 3) = 333$
        - $|C| = floor(1000 / 5) = 200$
        Các tập giao hai điều kiện và ba điều kiện:
        - $|A cap B| = floor(1000 / 6) = 166$ (chia hết cho 6)
        - $|B cap C| = floor(1000 / 15) = 66$ (chia hết cho 15)
        - $|C cap A| = floor(1000 / 10) = 100$ (chia hết cho 10)
        - $|A cap B cap C| = floor(1000 / 30) = 33$ (chia hết cho 30)
        Theo nguyên lý bù trừ:
        $ |A cup B cup C| = |A| + |B| + |C| - (|A cap B| + |B cap C| + |C cap A|) + |A cap B cap C| $
        $ = 500 + 333 + 200 - (166 + 66 + 100) + 33 = 734 text(" số") $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Có $8$ vị khách (trong đó có hai người mâu thuẫn là ông $X$ và bà $Y$) được xếp ngồi vào một dãy gồm $8$ chiếc ghế xếp thành hàng ngang. Có bao nhiêu cách xếp chỗ sao cho ông $X$ và bà $Y$ không ngồi cạnh nhau và cả hai người đều không ngồi ở hai vị trí đầu dãy ghế?],
    (
        True([$21600$]),
        [$28800$],
        [$14400$],
        [$15120$]
    ),
    loigiai: [
        *Phương pháp giải:* Xác định tập vị trí hợp lệ cho hai đối tượng có ràng buộc ngặt trước (ghế số 2 đến số 7), đếm số cách xếp không cạnh nhau trong tập này bằng phần bù, sau đó áp dụng quy tắc nhân xếp các vị khách còn lại.
        - #step([Bước 1: Chọn vị trí cho X và Y])
          Dãy gồm 8 ghế ${1, 2, 3, 4, 5, 6, 7, 8}$.
          Vì $X$ và $Y$ không ngồi ở hai đầu ghế (ghế 1 và 8), họ chỉ có thể ngồi vào tập 6 ghế ở giữa: $S = {2, 3, 4, 5, 6, 7}$.
          + Số cách xếp $X$ và $Y$ vào 2 ghế bất kỳ trong 6 ghế: $A_6^2 = 6 times 5 = 30$ cách.
          + Số cách để $X$ và $Y$ ngồi cạnh nhau trong 6 ghế này:
            Có 5 cặp ghế kề nhau: $(2, 3), (3, 4), (4, 5), (5, 6), (6, 7)$.
            Mỗi cặp có $2! = 2$ cách xếp $X$ và $Y$. Số cách ngồi cạnh nhau: $5 times 2 = 10$ cách.
          + Do đó, số cách xếp $X$ và $Y$ không ngồi cạnh nhau là: $30 - 10 = 20$ cách.
        - #step([Bước 2: Xếp 6 vị khách còn lại])
          Sáu vị khách còn lại xếp tùy ý vào 6 ghế còn trống:
          $ 6! = 720 text(" cách") $
        Theo quy tắc nhân:
        $ 20 times 720 = 21600 text(" cách") $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Trên một bàn cờ kích thước $4 times 4$ ô vuông, có bao nhiêu cách đặt $4$ quân xe đôi một không khống chế nhau (không cùng hàng, không cùng cột) sao cho không có quân xe nào được đặt trên đường chéo chính của bàn cờ?],
    (
        True([$9$]),
        [$24$],
        [$12$],
        [$16$]
    ),
    loigiai: [
        *Phương pháp giải:* Đây là mô hình bài toán hoán vị không điểm cố định (Derangement $D_n$). Mỗi cách đặt 4 quân xe không cùng hàng và không cùng cột là một hoán vị của tập ${1, 2, 3, 4}$. Điều kiện không nằm trên đường chéo chính có nghĩa là phần tử thứ $i$ không được ở vị trí $i$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for i in range(5) {
            line((i, 0), (i, 4), stroke: 0.8pt + black)
            line((0, i), (4, i), stroke: 0.8pt + black)
          }
          // Đường chéo chính gạch chéo cấm
          for i in range(4) {
            rect((i, 3 - i), (i + 1, 4 - i), fill: rgb("fee2e2"))
            line((i, 3 - i), (i + 1, 4 - i), stroke: 1pt + red)
            line((i, 4 - i), (i + 1, 3 - i), stroke: 1pt + red)
          }
          content((2, -0.4), [Các ô đường chéo chính bị cấm đặt xe])
        })
        ]
        Áp dụng công thức Derangement cho $n = 4$:
        $ D_4 = 4! (1 - 1 / (1!) + 1 / (2!) - 1 / (3!) + 1 / (4!)) $
        $ = 24 (1 - 1 + 1 / 2 - 1 / 6 + 1 / 24) = 24 (12 / 24 - 4 / 24 + 1 / 24) = 9 text(" cách") $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Có bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau $overline(a b c d e)$ lập từ tập $S = {1, 2, 3, 4, 5, 6, 7, 8, 9}$ sao cho các chữ số thỏa mãn điều kiện dạng núi: $a < b < c$ và $c > d > e$?],
    (
        True([$756$]),
        [$1344$],
        [$504$],
        [$672$]
    ),
    loigiai: [
        *Phương pháp giải:* Dùng kỹ thuật chọn tổ hợp kết hợp tính thứ tự duy nhất. Trong 5 chữ số phân biệt, chữ số lớn nhất bắt buộc phải nằm ở đỉnh núi $c$. Bốn chữ số còn lại được phân chia vào sườn trái và sườn phải.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          line((0, 0), (2, 2), stroke: 1.2pt + accent, mark: (end: "stealth"))
          line((2, 2), (4, 0), stroke: 1.2pt + accent, mark: (end: "stealth"))
          circle((0, 0), radius: 0.15, fill: white, stroke: 1pt + accent)
          content((0, -0.3), [$a$])
          circle((1, 1), radius: 0.15, fill: white, stroke: 1pt + accent)
          content((1 - 0.3, 1 + 0.2), [$b$])
          circle((2, 2), radius: 0.18, fill: red)
          content((2, 2.4), [Đỉnh $c$ (lớn nhất)], fill: red)
          circle((3, 1), radius: 0.15, fill: white, stroke: 1pt + accent)
          content((3 + 0.3, 1 + 0.2), [$d$])
          circle((4, 0), radius: 0.15, fill: white, stroke: 1pt + accent)
          content((4, -0.3), [$e$])
        })
        ]
        - #step([Bước 1: Chọn 5 chữ số phân biệt])
          Chọn 5 chữ số từ tập 9 chữ số: có $C_9^5 = 126$ cách.
        - #step([Bước 2: Xếp các chữ số vào các vị trí])
          Trong 5 chữ số đã chọn, chữ số lớn nhất bắt buộc phải đặt vào đỉnh $c$ (duy nhất $1$ cách).
          Bốn chữ số còn lại được chọn ra 2 chữ số để xếp vào sườn trái $(a, b)$: có $C_4^2 = 6$ cách.
          Hai chữ số còn lại tự động thuộc về sườn phải $(d, e)$.
          + Khi 2 chữ số đã vào sườn trái, chỉ có DUY NHẤT một cách xếp tăng dần ($a < b$).
          + Khi 2 chữ số đã vào sườn phải, chỉ có DUY NHẤT một cách xếp giảm dần ($d > e$).
          Do đó, mỗi bộ 5 chữ số tạo ra đúng $6$ số dạng núi.
        Theo quy tắc nhân:
        $ 126 times 6 = 756 text(" số") $
    ]
)

// TN 8 (Mã bảo mật phân tầng)
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Một hệ thống ngân hàng tạo mã thẻ bảo mật gồm $6$ ký tự. Hai ký tự đầu là hai chữ cái in hoa khác nhau lấy từ tập ${A, B, C, D, E}$, bốn ký tự tiếp theo là bốn chữ số đôi một khác nhau lấy từ tập ${0, 1, 2, ..., 9}$ sao cho chữ số thứ nhất lớn hơn chữ số thứ hai ($d_1 > d_2$). Số mã thẻ bảo mật có thể tạo ra là],
    (
        True([$50400$]),
        [$100800$],
        [$25200$],
        [$75600$]
    ),
    loigiai: [
        - #step([Công đoạn 1: Chọn 2 ký tự chữ cái đầu])
          Chọn có thứ tự 2 chữ cái từ 5 chữ cái: $A_5^2 = 5 times 4 = 20$ cách.
        - #step([Công đoạn 2: Chọn 4 chữ số khác nhau])
          Chọn 4 chữ số từ 10 chữ số: có $C_10^4 = 210$ cách.
        - #step([Công đoạn 3: Xếp 4 chữ số thỏa mãn d1 > d2])
          Chọn 2 chữ số trong 4 chữ số để gán cho cặp $(d_1, d_2)$ (duy nhất 1 cách xếp giảm dần $d_1 > d_2$): có $C_4^2 = 6$ cách.
          Hai chữ số còn lại xếp vào 2 vị trí cuối: có $2! = 2$ cách.
          Số cách xếp 4 chữ số là: $6 times 2 = 12$ cách.
        Theo quy tắc nhân:
        $ 20 times (210 times 12) = 20 times 2520 = 50400 text(" mã") $
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Cho tập hợp $A = {1, 2, 3, ..., 15}$. Có bao nhiêu tập hợp con gồm đúng $3$ phần tử của $A$ sao cho tổng của ba phần tử đó chia hết cho $3$?],
    (
        True([$155$]),
        [$150$],
        [$160$],
        [$145$]
    ),
    loigiai: [
        Phân chia 15 số của tập $A$ thành 3 nhóm theo số dư khi chia cho 3:
        - Nhóm chia hết cho 3: $A_0 = {3, 6, 9, 12, 15}$ ($5$ phần tử).
        - Nhóm dư 1: $A_1 = {1, 4, 7, 10, 13}$ ($5$ phần tử).
        - Nhóm dư 2: $A_2 = {2, 5, 8, 11, 14}$ ($5$ phần tử).
        Tổng của ba số $x + y + z$ chia hết cho 3 khi xảy ra một trong hai trường hợp sau:
        - #step([Trường hợp 1: Cả 3 số cùng thuộc một nhóm])
          + Chọn 3 số từ $A_0$: $C_5^3 = 10$ cách.
          + Chọn 3 số từ $A_1$: $C_5^3 = 10$ cách.
          + Chọn 3 số từ $A_2$: $C_5^3 = 10$ cách.
          Số lượng trong TH1: $10 + 10 + 10 = 30$ cách.
        - #step([Trường hợp 2: Mỗi số thuộc một nhóm khác nhau])
          Chọn 1 số từ $A_0$, 1 số từ $A_1$ và 1 số từ $A_2$:
          $ C_5^1 times C_5^1 times C_5^1 = 5 times 5 times 5 = 125 text(" cách") $
        Theo quy tắc cộng:
        $ 30 + 125 = 155 text(" tập con") $
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Có bao nhiêu số tự nhiên có $5$ chữ số mà tổng các chữ số của nó là một số lẻ và các chữ số giảm dần từ trái sang phải ($a > b > c > d > e$)?],
    (
        True([$126$]),
        [$252$],
        [$63$],
        [$84$]
    ),
    loigiai: [
        Tổng số các số có 5 chữ số giảm dần lập từ ${0, 1, 2, ..., 9}$ là:
        $ C_10^5 = 252 text(" số") $
        Xét song ánh đối xứng: Với mỗi tập con 5 phần tử $S = {x_1, x_2, x_3, x_4, x_5} subset {0, 1, ..., 9}$, xét tập đối ngẫu $S' = {9 - x_1, 9 - x_2, 9 - x_3, 9 - x_4, 9 - x_5}$.
        Tổng các phần tử của $S'$ là:
        $ sum_(i=1)^5 (9 - x_i) = 45 - sum_(i=1)^5 x_i $
        Vì 45 là số lẻ nên $sum x_i$ và $sum (9 - x_i)$ luôn khác tính chẵn lẻ (một bên lẻ thì bên kia chẵn).
        Do đó số các số có tổng chữ số là số lẻ bằng đúng một nửa tổng số các số:
        $ 252 / 2 = 126 text(" số") $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Một giải đấu bóng chuyền có $12$ đội tham gia được chia đều vào $3$ bảng đấu $A, B, C$ (mỗi bảng gồm $4$ đội). Biết rằng hai đội hạt giống mạnh nhất là đội $X$ và đội $Y$ không cùng nằm trong một bảng đấu. Số cách chia bảng là],
    (
        True([$25200$]),
        [$34650$],
        [$9450$],
        [$11550$]
    ),
    loigiai: [
        - #step([Tổng số cách chia 12 đội vào 3 bảng A, B, C])
          Chọn 4 đội cho bảng A: có $C_12^4$ cách.
          Chọn 4 đội cho bảng B: có $C_8^4$ cách.
          Bốn đội còn lại vào bảng C: có $C_4^4 = 1$ cách.
          Tổng số cách: $C_12^4 times C_8^4 = 495 times 70 = 34650$ cách.
        - #step([Số cách để X và Y ở cùng một bảng đấu])
          Chọn 1 bảng trong 3 bảng cho $X$ và $Y$: có 3 cách.
          Bảng đó nhận thêm 2 đội từ 10 đội: $C_10^2 = 45$ cách.
          Tám đội còn lại chia vào 2 bảng kia: $C_8^4 = 70$ cách.
          Số cách cùng bảng: $3 times 45 times 70 = 9450$ cách.
        - #step([Lấy phần bù])
          Số cách để $X$ và $Y$ ở hai bảng đấu khác nhau là:
          $ 34650 - 9450 = 25200 text(" cách") $
    ]
)

// TN 12 (Nghiệm nguyên có chặn)
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Phương trình $x_1 + x_2 + x_3 = 10$ có bao nhiêu bộ nghiệm nguyên $(x_1, x_2, x_3)$ thỏa mãn điều kiện $1 <= x_1 <= 5$ và $x_2 >= 0, x_3 >= 0$?],
    (
        True([$40$]),
        [$45$],
        [$55$],
        [$36$]
    ),
    loigiai: [
        Đặt $y_1 = x_1 - 1$, khi đó $0 <= y_1 <= 4$.
        Phương trình trở thành:
        $ y_1 + x_2 + x_3 = 9 quad (0 <= y_1 <= 4, quad x_2, x_3 >= 0) $
        - Tổng số nghiệm nguyên không âm của $y_1 + x_2 + x_3 = 9$ không điều kiện chặn trên của $y_1$:
          $ C_(9 + 3 - 1)^(3 - 1) = C_11^2 = (11 times 10) / 2 = 55 text(" nghiệm") $
        - Số nghiệm vi phạm điều kiện ($y_1 >= 5$):
          Đặt $z_1 = y_1 - 5 >= 0$, phương trình trở thành $z_1 + x_2 + x_3 = 4$.
          Số nghiệm vi phạm là:
          $ C_(4 + 3 - 1)^(3 - 1) = C_6^2 = 15 text(" nghiệm") $
        - Số nghiệm thỏa mãn điều kiện là:
          $ 55 - 15 = 40 text(" nghiệm") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Lưới tọa độ 2D có CeTZ)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Một robot di chuyển trên lưới ô vuông từ điểm gốc $O(0, 0)$ đến điểm đích $B(5, 4)$. Tại mỗi bước, robot chỉ được đi sang phải hoặc đi lên trên $1$ đơn vị. Trên lưới có hai điểm chướng ngại vật là $M(2, 2)$ và $N(3, 3)$.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  // Vẽ lưới tọa độ 5 x 4
  for x in range(6) {
    line((x, 0), (x, 4), stroke: 0.5pt + gray)
  }
  for y in range(5) {
    line((0, y), (5, y), stroke: 0.5pt + gray)
  }
  // Các điểm O, B, M, N
  circle((0, 0), radius: 0.12, fill: rgb("1e40af"))
  content((0, -0.3), [$O(0,0)$])
  
  circle((5, 4), radius: 0.12, fill: rgb("1e40af"))
  content((5, 4.3), [$B(5,4)$])
  
  circle((2, 2), radius: 0.14, fill: red)
  content((2, 1.7), [$M(2,2)$], fill: red)
  
  circle((3, 3), radius: 0.14, fill: red)
  content((3, 3.3), [$N(3,3)$], fill: red)
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số lộ trình di chuyển từ $O(0, 0)$ đến $B(5, 4)$ mà không có điều kiện cấm là $126$ lộ trình.]),
    True([Số lộ trình di chuyển từ $O(0, 0)$ đến $B(5, 4)$ đi qua điểm $M(2, 2)$ là $60$ lộ trình.]),
    True([Số lộ trình di chuyển từ $O(0, 0)$ đến $B(5, 4)$ đi qua cả hai điểm $M(2, 2)$ và $N(3, 3)$ là $36$ lộ trình.]),
    [Số lộ trình di chuyển từ $O(0, 0)$ đến $B(5, 4)$ tránh được cả hai chướng ngại vật $M$ và $N$ là $50$ lộ trình.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số lộ trình không điều kiện])
    Tổng số bước là $5 + 4 = 9$ bước, gồm 5 bước sang phải và 4 bước đi lên:
    $ C_9^4 = (9 times 8 times 7 times 6) / 24 = 126 text(" lộ trình") $. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Lộ trình đi qua M(2, 2)])
    - Từ $O(0, 0)$ đến $M(2, 2)$: $C_4^2 = 6$ cách.
    - Từ $M(2, 2)$ đến $B(5, 4)$ (cần 3 phải, 2 lên): $C_5^2 = 10$ cách.
    Số lộ trình qua $M$: $6 times 10 = 60$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Lộ trình qua cả M(2, 2) và N(3, 3)])
    - Từ $O(0, 0)$ đến $M(2, 2)$: $C_4^2 = 6$ cách.
    - Từ $M(2, 2)$ đến $N(3, 3)$ (1 phải, 1 lên): $C_2^1 = 2$ cách.
    - Từ $N(3, 3)$ đến $B(5, 4)$ (2 phải, 1 lên): $C_3^1 = 3$ cách.
    Số lộ trình qua cả $M$ và $N$: $6 times 2 times 3 = 36$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tránh cả M và N])
    Lộ trình qua $N(3, 3)$:
    - Từ $O$ đến $N(3, 3)$: $C_6^3 = 20$.
    - Từ $N$ đến $B$: $C_3^1 = 3$.
    Số lộ trình qua $N$: $20 times 3 = 60$.
    Số lộ trình qua ít nhất một điểm $M$ hoặc $N$ (theo nguyên lý bù trừ):
    $ 60 + 60 - 36 = 84 text(" lộ trình") $
    Số lộ trình tránh cả hai chướng ngại vật là:
    $ 126 - 84 = 42 text(" lộ trình") $ (chứ không phải $50$).
    Khẳng định bằng $50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Lập số chia hết cho 6 từ {0, 1, 2, 3, 4, 5})
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Cho tập hợp $X = {0, 1, 2, 3, 4, 5}$. Lập các số tự nhiên có $4$ chữ số đôi một khác nhau chia hết cho $6$ từ tập $X$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Có đúng $5$ tập hợp con gồm $4$ phần tử của $X$ có tổng các phần tử chia hết cho $3$.]),
    True([Số các số chia hết cho $6$ lập từ tập con ${1, 2, 4, 5}$ là $12$ số.]),
    True([Số các số chia hết cho $6$ lập từ tập con ${0, 2, 3, 4}$ là $14$ số.]),
    [Tổng số các số tự nhiên gồm $4$ chữ số đôi một khác nhau chia hết cho $6$ lập từ $X$ là $60$ số.]
  ),
  loigiai: [
    #step([Xét ý a: Số tập con có tổng chia hết cho 3])
    Tổng 6 phần tử là 15 (chia hết cho 3). Chọn 4 phần tử có tổng chia hết cho 3 tương đương với việc bỏ đi 2 phần tử có tổng chia hết cho 3:
    Các cặp bỏ đi là ${0, 3}, {1, 2}, {1, 5}, {2, 4}, {4, 5}$ (gồm đúng 5 cặp).
    Do đó có đúng 5 tập con thỏa mãn. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Tập {1, 2, 4, 5}])
    Tận cùng chẵn $d in {2, 4}$ (2 cách), ba vị trí trước có $3! = 6$ cách $=> 2 times 6 = 12$ số. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Tập {0, 2, 3, 4}])
    - Nếu $d = 0$: có $3! = 6$ số.
    - Nếu $d in {2, 4}$ (2 cách): $a in {3, 4}$ hoặc $a in {2, 3}$ (2 cách), $b, c$ có 2 cách $=> 2 times 2 times 2 = 8$ số.
    Tổng số: $6 + 8 = 14$ số. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng số các số])
    Tổng số các số thỏa mãn là $52$ số (đã tính chi tiết: $12 + 10 + 14 + 6 + 10 = 52$ chứ không phải $60$).
    Khẳng định có $60$ số là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Tập con có tổng chia hết cho 3 từ {1, 2, ..., 15})
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Cho tập hợp $A = {1, 2, 3, ..., 15}$. Phân hoạch $A$ thành ba tập con theo số dư khi chia cho $3$:
$A_0 = {3, 6, 9, 12, 15}$, $A_1 = {1, 4, 7, 10, 13}$, $A_2 = {2, 5, 8, 11, 14}$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Mỗi tập hợp $A_0, A_1, A_2$ đều có đúng $5$ phần tử.]),
    True([Số tập con gồm $3$ phần tử của $A$ mà cả $3$ phần tử cùng thuộc một tập hợp $A_i$ ($i in {0, 1, 2}$) là $30$ tập con.]),
    True([Số tập con gồm $3$ phần tử của $A$ gồm đúng $1$ phần tử thuộc $A_0$, $1$ phần tử thuộc $A_1$ và $1$ phần tử thuộc $A_2$ là $125$ tập con.]),
    [Số tập con gồm $3$ phần tử của $A$ có tổng các phần tử không chia hết cho $3$ là $350$ tập con.]
  ),
  loigiai: [
    #step([Xét ý a: Số phần tử])
    $15 / 3 = 5$, mỗi tập đều có 5 phần tử. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Cùng thuộc một tập])
    $3 times C_5^3 = 3 times 10 = 30$ tập con. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Mỗi tập 1 phần tử])
    $C_5^1 times C_5^1 times C_5^1 = 5 times 5 times 5 = 125$ tập con. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Tổng không chia hết cho 3])
    Tổng số tập con 3 phần tử của $A$ là:
    $ C_15^3 = (15 times 14 times 13) / 6 = 455 text(" tập con") $
    Số tập con có tổng chia hết cho 3 là: $30 + 125 = 155$ tập con.
    Số tập con có tổng KHÔNG chia hết cho 3 là:
    $ 455 - 155 = 300 text(" tập con") $ (chứ không phải $350$).
    Khẳng định bằng $350$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Chia đội bóng và hạt giống)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Một giải bóng đá gồm $12$ đội được chia vào $3$ bảng đấu $A, B, C$, mỗi bảng $4$ đội. Gọi $X$ và $Y$ là hai đội bóng hạt giống.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng số cách chia $12$ đội vào $3$ bảng đấu $A, B, C$ bất kỳ là $34650$ cách.]),
    True([Số cách chia sao cho hai đội hạt giống $X$ và $Y$ cùng nằm trong một bảng đấu là $9450$ cách.]),
    True([Số cách chia sao cho hai đội hạt giống $X$ và $Y$ nằm ở hai bảng đấu khác nhau là $25200$ cách.]),
    [Nếu không phân biệt tên gọi các bảng đấu (chỉ chia thành 3 nhóm, mỗi nhóm 4 đội), số cách chia là $11550$ cách.]
  ),
  loigiai: [
    #step([Xét ý a: Tổng số cách chia có phân biệt bảng])
    $ C_12^4 times C_8^4 times C_4^4 = 495 times 70 = 34650 text(" cách") $. Mệnh đề a ĐÚNG.

    #step([Xét ý b: X và Y cùng một bảng])
    - Chọn 1 bảng trong 3 bảng để xếp cả $X$ và $Y$: có $3$ cách.
    - Bảng đó cần thêm 2 đội từ 10 đội: $C_10^2 = 45$ cách.
    - Tám đội còn lại chia vào 2 bảng còn lại: $C_8^4 = 70$ cách.
    Số cách là: $3 times 45 times 70 = 9450$ cách. Mệnh đề b ĐÚNG.

    #step([Xét ý c: X và Y khác bảng])
    Lấy tổng số cách trừ đi số cách cùng bảng:
    $ 34650 - 9450 = 25200 text(" cách") $. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Không phân biệt tên bảng])
    Vì 3 bảng có kích thước như nhau (mỗi bảng 4 đội), số cách chia không phân biệt tên bảng là:
    $ 34650 / (3!) = 34650 / 6 = 5775 text(" cách") $ (chứ không phải $11550$).
    Khẳng định có $11550$ cách là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Một robot di chuyển trên lưới từ $O(0, 0)$ đến $B(4, 3)$ chỉ bằng các bước sang phải hoặc lên trên $1$ đơn vị. Có bao nhiêu lộ trình không đi qua điểm chướng ngại vật $A(2, 2)$?],
    [17],
    loigiai: [
        #step([Phần bù])
        Tổng số lộ trình: $C_7^3 = 35$.
        Số lộ trình qua $A$: $C_4^2 times C_3^1 = 6 times 3 = 18$.
        Số lộ trình tránh $A$: $35 - 18 = 17$.
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Trên bàn cờ kích thước $4 times 4$, có bao nhiêu cách đặt $4$ quân xe đôi một không ăn nhau và không có quân nào nằm trên đường chéo chính?],
    [9],
    loigiai: [
        #step([Derangement D4])
        $ D_4 = 4! (1 / 2 - 1 / 6 + 1 / 24) = 9 text(" cách") $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Có bao nhiêu số tự nhiên gồm $5$ chữ số đôi một khác nhau $overline(a b c d e)$ lập từ tập ${1, 2, 3, 4, 5, 6, 7, 8, 9}$ thỏa mãn điều kiện $a < b < c$ và $c > d > e$?],
    [756],
    loigiai: [
        #step([Tính toán])
        Chọn 5 chữ số: $C_9^5 = 126$ cách.
        Với mỗi bộ 5 chữ số, chữ số lớn nhất ở vị trí $c$. Chọn 2 chữ số sang bên trái: $C_4^2 = 6$ cách.
        Tổng số: $126 times 6 = 756$ số.
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Trong các số tự nhiên từ $1$ đến $1000$, có bao nhiêu số chia hết cho ít nhất một trong ba số $2, 3, 5$?],
    [734],
    loigiai: [
        #step([Nguyên lý bù trừ PIE])
        $ 500 + 333 + 200 - (166 + 66 + 100) + 33 = 734 text(" số") $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Từ các chữ số thuộc tập $X = {0, 1, 2, 3, 4, 5}$, có thể lập được bao nhiêu số tự nhiên gồm $4$ chữ số đôi một khác nhau và chia hết cho $6$?],
    [52],
    loigiai: [
        #step([Tổng số các số chia hết cho 6])
        Chia 5 trường hợp theo 5 cặp số có tổng chia hết cho 3:
        $ 12 + 10 + 14 + 6 + 10 = 52 text(" số") $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 173], back-to: "sec-exercise-hub",[Phương trình $x_1 + x_2 + x_3 = 10$ có bao nhiêu bộ nghiệm nguyên $(x_1, x_2, x_3)$ thỏa mãn $1 <= x_1 <= 5$ và $x_2 >= 0, x_3 >= 0$?],
    [40],
    loigiai: [
        #step([Đổi biến và bù trừ])
        $y_1 + x_2 + x_3 = 9$ với $0 <= y_1 <= 4$.
        Tổng số nghiệm: $C_11^2 = 55$.
        Số nghiệm vi phạm ($y_1 >= 5$): $C_6^2 = 15$.
        Số nghiệm thỏa mãn: $55 - 15 = 40$ nghiệm.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 23: QUY TẮC ĐẾM (ĐỀ SỐ 26A - MỨC ĐỘ KHÁ - GIỎI)!]      #v(0.6em)
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
