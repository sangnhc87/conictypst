#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & ĐỊNH DẠNG CHUNG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ
// ═══════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Xác Suất Hậu Nghiệm & Công Thức Bayes\
      Từ Mô Hình Truyền Tin Đến Bài Toán Chọn Bi Đa Tầng
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Xác suất toàn phần · Sơ đồ cây · Định lý Bayes · Bảo toàn tỉ lệ
    ]
  ]
]

// ═══════════════════════════════════════════════
// LÝ THUYẾT NỀN TẢNG
// ═══════════════════════════════════════════════
= I. Lý Thuyết Trọng Tâm

#lythuyet[
  *1. Công thức Xác suất toàn phần:*
  Cho hệ biến cố đầy đủ $A_1, A_2, ..., A_n$ (chúng xung khắc từng đôi và tổng hợp thành không gian mẫu). Với biến cố $B$ bất kỳ, ta có:
  $ P(B) = P(A_1)dot P(B|A_1) + P(A_2)dot P(B|A_2) + ... + P(A_n)dot P(B|A_n) $

  *2. Công thức Bayes (Xác suất hậu nghiệm):*
  Dùng để tính xác suất của "nguyên nhân" $A_k$ sau khi đã biết "kết quả" $B$ xảy ra:
  $ P(A_k | B) = (P(A_k) dot P(B | A_k)) / P(B) $

  *3. Tư duy "Bảo toàn tỉ lệ" trong bài toán trích mẫu:*
  Khi lấy ngẫu nhiên $n$ phần tử từ tập $S$ bỏ vào tập $S'$ (ban đầu rỗng), xác suất để chọn $1$ phần tử từ $S'$ mang đặc tính $X$ đúng bằng tỉ lệ phần tử $X$ có trong $S$ ban đầu.
]

// ═══════════════════════════════════════════════
// PHÂN TÍCH Ý TƯỞNG & BÀI TOÁN GỐC
// ═══════════════════════════════════════════════
= II. Phân Tích Ý Tưởng & Mô Hình Gốc

#tln(
  id: "2D6V2-3",
  [Ban đầu cho hai hộp bi riêng biệt đựng những viên bi có cùng kích thước và cùng khối lượng. Hộp I đựng $x$ viên bi màu đỏ, $4$ viên bi màu xanh còn hộp II đựng $5$ viên bi màu đỏ và $3$ viên bi màu xanh. Tiến hành lấy ngẫu nhiên ba viên bi ở hộp I và hai viên bi ở hộp II, bỏ vào hộp III (ban đầu không có bi). Từ hộp III lấy ngẫu nhiên ra một viên bi. Biết rằng xác suất để viên bi lấy ra từ hộp III có nguồn gốc từ hộp I, nếu biết nó màu đỏ, không nhỏ hơn $0,6$. Hãy xác định giá trị nguyên nhỏ nhất của $x$?],
  [$7$],
  loigiai: [
    #ppgiai[
      *Phân tích mạch tư duy:* 1. *Xác định nguồn gốc:* Viên bi rút từ Hộp III chỉ có thể đến từ Hộp I hoặc Hộp II.
      2. *Tỉ lệ nguồn:* Hộp III chứa tổng cộng $5$ bi ($3$ bi từ Hộp I và $2$ bi từ Hộp II), nên xác suất "nguồn gốc" tương ứng là $3/5$ và $2/5$.
      3. *Tỉ lệ màu sắc:* Áp dụng tính chất bảo toàn tỉ lệ, xác suất rút được bi đỏ nếu biết nó đến từ Hộp I chính bằng tỉ lệ bi đỏ trong Hộp I ban đầu.
    ]

    *Trình bày chi tiết bằng Sơ đồ cây:*

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let b1 = box(
          fill: rgb("fff9c4"),
          stroke: 1.5pt + rgb("fbc02d"),
          inset: 8pt,
          radius: 5pt,
        )[*Lấy 1 bi từ Hộp III (5 bi)*]
        content((0, 4), b1, name: "root")

        let b2 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp I*]
        content((-3.5, 2), b2, name: "h1")

        let b3 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp II*]
        content((3.5, 2), b3, name: "h2")

        circle((-5, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c1")
        content("c1", [*Đỏ*], name: "h1d")

        circle((-2, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c2")
        content("c2", [*Xanh*], name: "h1x")

        circle((2, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + rgb("d32f2f"), name: "c3")
        content("c3", [*Đỏ*], name: "h2d")

        circle((5, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + rgb("1976d2"), name: "c4")
        content("c4", [*Xanh*], name: "h2x")

        line("root", "h1", mark: (end: ">"))
        content((-1.6, 3.2), box(fill: white, inset: 1pt)[$3 / 5$])

        line("root", "h2", mark: (end: ">"))
        content((1.6, 3.2), box(fill: white, inset: 1pt)[$2 / 5$])

        line("h1", "c1", mark: (end: ">"))
        content((-4.8, 1.2), box(fill: white, inset: 1pt)[$x / (x + 4)$])

        line("h1", "c2", mark: (end: ">"))
        content((-2.2, 1.2), box(fill: white, inset: 1pt)[$4 / (x + 4)$])

        line("h2", "c3", mark: (end: ">"))
        content((2.2, 1.2), box(fill: white, inset: 1pt)[$5 / 8$])

        line("h2", "c4", mark: (end: ">"))
        content((4.8, 1.2), box(fill: white, inset: 1pt)[$3 / 8$])
      })
    ]

    #step([Gọi các biến cố])
    - Gọi $A_1$ là biến cố: "Viên bi lấy ra có nguồn gốc từ Hộp I", suy ra $P(A_1) = 3 / 5$.
    - Gọi $A_2$ là biến cố: "Viên bi lấy ra có nguồn gốc từ Hộp II", suy ra $P(A_2) = 2 / 5$.

    #step([Tính xác suất điều kiện (Theo sơ đồ cây)])
    - Gọi $R$ là biến cố: "Viên bi lấy ra có màu Đỏ".
    $ P(R | A_1) = x / (x + 4) ; quad P(R | A_2) = 5 / 8 $

    #step([Áp dụng công thức Bayes])
    Theo đề bài, ta có bất phương trình:
    $ P(A_1 | R) = (P(A_1) dot P(R | A_1)) / (P(A_1) dot P(R | A_1) + P(A_2) dot P(R | A_2)) >= 3 / 5 $

    Thay số vào ta được:
    $
      (3 / 5 dot x / (x + 4)) / (3 / 5 dot x / (x + 4) + 2 / 5 dot 5 / 8) >= 3 / 5
      <=> ((3x) / (x + 4)) / ((3x) / (x + 4) + 5 / 4) >= 3 / 5
    $

    Nhân cả tử và mẫu của vế trái cho $4(x + 4)$:
    $
      (12x) / (12x + 5(x + 4)) >= 3 / 5
      <=> (12x) / (17x + 20) >= 3 / 5
    $

    Do $x >= 0$ nên mẫu số luôn dương, nhân chéo ta có:
    $ 60x >= 51x + 60 <=> 9x >= 60 <=> x >= 20 / 3 approx 6","67 $

    Do $x in NN^*$, giá trị nguyên nhỏ nhất thỏa mãn là $x = 7$.
  ],
)
// ═══════════════════════════════════════════════
// BÀI TẬP VẬN DỤNG CÙNG MÔ HÌNH (TRỘN BI VÀO HỘP 3)
// ═══════════════════════════════════════════════

#tln(
  id: "2D6V2-...",
  [Cho hai hộp bi. Hộp I đựng $5$ viên bi Đỏ và $5$ viên bi Xanh. Hộp II đựng $2$ viên bi Đỏ và $x$ viên bi Xanh. Người ta lấy ngẫu nhiên $2$ viên bi từ Hộp I và $3$ viên bi từ Hộp II bỏ vào Hộp III (ban đầu không có bi). Từ Hộp III, lấy ngẫu nhiên ra một viên bi. Giả sử viên bi lấy ra từ Hộp III có màu Xanh. Biết rằng xác suất để viên bi này có nguồn gốc từ Hộp II bằng $9/14$. Tìm số lượng bi Xanh $x$ trong Hộp II?],
  [$3$],
  loigiai: [
    #ppgiai[
      *1. Sơ đồ mô phỏng quá trình chuyển bi:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          rect((-4.5, 2), (-1.5, 5), radius: 0.2, stroke: 1.5pt + rgb("1A5276"), fill: rgb("EBF5FB"))
          content((-3, 5.5), text(weight: "bold", fill: rgb("1A5276"))[HỘP I])
          content((-3, 3.5), text(fill: red)[$5$ Đỏ] + [\ ] + text(fill: blue)[$5$ Xanh])

          rect((1.5, 2), (4.5, 5), radius: 0.2, stroke: 1.5pt + rgb("900C3F"), fill: rgb("FADBD8"))
          content((3, 5.5), text(weight: "bold", fill: rgb("900C3F"))[HỘP II])
          content((3, 3.5), text(fill: red)[$2$ Đỏ] + [\ ] + text(fill: blue)[$x$ Xanh])

          rect((-1.5, -2.5), (1.5, 0), radius: 0.2, stroke: 1.5pt + rgb("117A65"), fill: rgb("E8F8F5"))
          content((0, 0.5), text(weight: "bold", fill: rgb("117A65"))[HỘP III])
          content((0, -1.25), text(size: 10pt)[(Tổng: $5$ bi)])

          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black), stroke: 1.5pt + rgb("555555"))
          content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 2 bi*])

          line((3, 2), (0.5, 0), mark: (end: ">", fill: black), stroke: 1.5pt + rgb("555555"))
          content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 3 bi*])

          line((0, -2.5), (0, -4), mark: (end: ">", fill: black), stroke: 1.5pt + blue)
          content((1, -3.2), box(fill: white, inset: 2pt, text(fill: blue)[*Lấy 1 bi*]))
          circle((0, -4.6), radius: 0.4, fill: rgb("e3f2fd"), stroke: 1.5pt + blue)
          content((0, -4.6), text(fill: blue, weight: "bold")[Xanh])
        })
      ]

      *2. Sơ đồ cây xác suất:* #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let b1 = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*1 bi từ Hộp III*]
          content((0, 4), b1, name: "root")

          let b2 = box(fill: rgb("e0f2f1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp I*]
          content((-3.5, 2), b2, name: "h1")
          let b3 = box(fill: rgb("fff3e0"), stroke: 1.5pt + rgb("ef6c00"), inset: 8pt, radius: 5pt)[*Gốc Hộp II*]
          content((3.5, 2), b3, name: "h2")

          circle((-5, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + red, name: "c1")
          content("c1", text(fill: red)[*Đỏ*])
          circle((-2, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + blue, name: "c2")
          content("c2", text(fill: blue)[*Xanh*])
          circle((2, 0), radius: 0.6, fill: rgb("ffebee"), stroke: 1.5pt + red, name: "c3")
          content("c3", text(fill: red)[*Đỏ*])
          circle((5, 0), radius: 0.6, fill: rgb("e3f2fd"), stroke: 1.5pt + blue, name: "c4")
          content("c4", text(fill: blue)[*Xanh*])

          line("root", "h1", mark: (end: ">"))
          content((-1.6, 3.2), box(fill: white, inset: 1pt)[$2 / 5$])
          line("root", "h2", mark: (end: ">"))
          content((1.6, 3.2), box(fill: white, inset: 1pt)[$3 / 5$])
          line("h1", "c1", mark: (end: ">"))
          content((-4.8, 1.2), box(fill: white, inset: 1pt)[$1 / 2$])
          line("h1", "c2", mark: (end: ">"))
          content((-2.2, 1.2), box(fill: white, inset: 1pt)[$1 / 2$])
          line("h2", "c3", mark: (end: ">"))
          content((2.2, 1.2), box(fill: white, inset: 1pt)[$2 / (x + 2)$])
          line("h2", "c4", mark: (end: ">"))
          content((4.8, 1.2), box(fill: white, inset: 1pt)[$x / (x + 2)$])
        })
      ]
    ]

    #step([Gọi biến cố và thiết lập phương trình])
    - Gọi $A_1, A_2$ là biến cố viên bi lấy ra có gốc từ Hộp I và Hộp II. $P(A_1) = 2/5; P(A_2) = 3/5$.
    - Gọi $X$ là biến cố viên bi lấy ra có màu Xanh. $P(X|A_1) = 5/10 = 1/2$; $P(X|A_2) = x/(x+2)$.
    - Theo công thức Bayes, ta có $P(A_2 | X) = 9/14$:
    $ (P(A_2) dot P(X | A_2)) / (P(A_1) dot P(X | A_1) + P(A_2) dot P(X | A_2)) = 9/14 $
    $ <=> ((3/5) dot x/(x+2)) / ((2/5) dot 1/2 + (3/5) dot x/(x+2)) = 9/14 $

    #step([Giải phương trình])
    Nhân cả tử và mẫu vế trái với $5(x+2)$ để triệt tiêu mẫu phụ:
    $ (3x) / (1(x+2) + 3x) = 9/14 <=> (3x) / (4x+2) = 9/14 $
    Nhân chéo: $ 42x = 9(4x+2) <=> 42x = 36x + 18 <=> 6x = 18 <=> x = 3 $.
    Vậy Hộp II có $3$ viên bi Xanh.
  ],
)

#tln(
  id: "2D6V2-...",
  [*(Bất phương trình Bayes)* Hai hộp đựng bi Đỏ và Vàng. Hộp I có $x$ viên bi Đỏ và $2$ viên bi Vàng. Hộp II có $3$ viên bi Đỏ và $4$ viên bi Vàng. Ta lấy $4$ viên bi từ Hộp I và $1$ viên bi từ Hộp II cho vào Hộp III (rỗng). Rút ngẫu nhiên $1$ viên từ Hộp III thì được bi Đỏ. Tìm số bi Đỏ $x$ nhỏ nhất trong Hộp I để xác suất viên bi rút ra đó có nguồn gốc từ Hộp I lớn hơn hoặc bằng $8/9$?],
  [$12$],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          rect((-4.5, 2), (-1.5, 5), radius: 0.2, stroke: 1.5pt + rgb("1A5276"), fill: rgb("EBF5FB"))
          content((-3, 5.5), text(weight: "bold", fill: rgb("1A5276"))[HỘP I])
          content((-3, 3.5), text(fill: red)[$x$ Đỏ] + [\ ] + text(fill: rgb("D4AC0D"))[$2$ Vàng])

          rect((1.5, 2), (4.5, 5), radius: 0.2, stroke: 1.5pt + rgb("900C3F"), fill: rgb("FADBD8"))
          content((3, 5.5), text(weight: "bold", fill: rgb("900C3F"))[HỘP II])
          content((3, 3.5), text(fill: red)[$3$ Đỏ] + [\ ] + text(fill: rgb("D4AC0D"))[$4$ Vàng])

          rect((-1.5, -2.5), (1.5, 0), radius: 0.2, stroke: 1.5pt + rgb("117A65"), fill: rgb("E8F8F5"))
          content((0, 0.5), text(weight: "bold", fill: rgb("117A65"))[HỘP III (5 bi)])

          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black))
          content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 4 bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black))
          content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 1 bi*])

          line((0, -2.5), (0, -4), mark: (end: ">", fill: black), stroke: 1.5pt + red)
          circle((0, -4.6), radius: 0.4, fill: rgb("ffebee"), stroke: 1.5pt + red)
          content((0, -4.6), text(fill: red, weight: "bold")[Đỏ])
        })
      ]
    ]

    #step([Thiết lập thông số trên nhánh cây])
    - Xác suất nguồn gốc: $P(H_1) = 4/5$; $P(H_2) = 1/5$.
    - Xác suất lấy bi Đỏ (gọi là D) theo nguồn: $P(D|H_1) = x/(x+2)$; $P(D|H_2) = 3/7$.

    #step([Lập bất phương trình Bayes])
    Ta cần $P(H_1|D) >= 8/9$:
    $ ((4/5) dot x/(x+2)) / ((4/5) dot x/(x+2) + (1/5) dot 3/7) >= 8/9 $

    Triệt tiêu $1/5$ ở tử và mẫu:
    $ (4x/(x+2)) / (4x/(x+2) + 3/7) >= 8/9 $

    Nhân chéo (do các đại lượng đều dương):
    $ 9 (4x/(x+2)) >= 8 (4x/(x+2) + 3/7) <=> 36x/(x+2) >= 32x/(x+2) + 24/7 $
    $ <=> 4x/(x+2) >= 24/7 <=> x/(x+2) >= 6/7 $
    $ <=> 7x >= 6(x+2) <=> 7x >= 6x + 12 <=> x >= 12 $

    Vậy số bi đỏ nhỏ nhất cần có là $12$.
  ],
)

#tln(
  id: "2D6V2-...",
  [*(Tìm số lượng bi được trích xuất)* Hộp I có $6$ bi Đỏ, $4$ bi Xanh. Hộp II có $3$ bi Đỏ, $7$ bi Xanh. Ta lấy $x$ viên bi từ Hộp I và $(5-x)$ viên bi từ Hộp II đổ vào Hộp III (đảm bảo Hộp III luôn có $5$ bi). Rút $1$ viên từ Hộp III thì được bi Đỏ. Biết xác suất viên bi Đỏ này có gốc từ Hộp I là $4/7$. Hãy tìm $x$?],
  [$2$],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          rect((-4.5, 2), (-1.5, 5), radius: 0.2, stroke: 1.5pt + rgb("1A5276"), fill: rgb("EBF5FB"))
          content((-3, 5.5), text(weight: "bold", fill: rgb("1A5276"))[HỘP I])
          content((-3, 3.5), text(fill: red)[$6$ Đỏ] + [\ ] + text(fill: blue)[$4$ Xanh])

          rect((1.5, 2), (4.5, 5), radius: 0.2, stroke: 1.5pt + rgb("900C3F"), fill: rgb("FADBD8"))
          content((3, 5.5), text(weight: "bold", fill: rgb("900C3F"))[HỘP II])
          content((3, 3.5), text(fill: red)[$3$ Đỏ] + [\ ] + text(fill: blue)[$7$ Xanh])

          rect((-1.5, -2.5), (1.5, 0), radius: 0.2, stroke: 1.5pt + rgb("117A65"), fill: rgb("E8F8F5"))
          content((0, 0.5), text(weight: "bold", fill: rgb("117A65"))[HỘP III (5 bi)])

          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black))
          content((-2.5, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy $x$ bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black))
          content((2.5, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy $(5-x)$ bi*])

          line((0, -2.5), (0, -4), mark: (end: ">", fill: black), stroke: 1.5pt + red)
          circle((0, -4.6), radius: 0.4, fill: rgb("ffebee"), stroke: 1.5pt + red)
          content((0, -4.6), text(fill: red, weight: "bold")[Đỏ])
        })
      ]
    ]

    #step([Thiết lập thông số nhánh cây])
    - Xác suất nguồn gốc: $P(H_1) = x/5$; $P(H_2) = (5-x)/5$.
    - Xác suất bi Đỏ từ mỗi hộp: $P(D|H_1) = 6/10 = 3/5$; $P(D|H_2) = 3/10$.

    #step([Áp dụng Bayes])
    $ P(H_1|D) = ((x/5) dot 3/5) / ((x/5) dot 3/5 + ((5-x)/5) dot 3/10) = 4/7 $

    Nhân cả tử và mẫu với $50$ để khử phân số:
    $ (10x dot 3/5) / (10x dot 3/5 + 10(5-x) dot 3/10) = 4/7 $
    $ <=> (6x) / (6x + 3(5-x)) = 4/7 <=> (6x) / (3x + 15) = 4/7 <=> (2x) / (x + 5) = 4/7 $

    #step([Giải tìm x])
    Nhân chéo:
    $ 14x = 4(x + 5) <=> 14x = 4x + 20 <=> 10x = 20 <=> x = 2 $

    Vậy ta đã lấy $2$ bi từ Hộp I (và $3$ bi từ Hộp II).
  ],
)
#tln(
  id: "2D6V2-...",
  [*(Toán ngược — Giải phương trình Bayes)* Hộp I đựng $x$ viên bi Đỏ và $4$ viên bi Xanh. Hộp II đựng $4$ viên bi Đỏ và $6$ viên bi Xanh. Ta lấy ngẫu nhiên $3$ viên bi từ Hộp I và $2$ viên bi từ Hộp II đổ vào Hộp III (ban đầu rỗng). Từ Hộp III rút ngẫu nhiên $1$ viên bi thì được bi Đỏ. Biết xác suất viên bi Đỏ này có nguồn gốc từ Hộp II là $4/13$. Tìm $x$?],
  [$6$],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          // Sơ đồ Hộp
          rect((-4.5, 2), (-1.5, 5), radius: 0.2, stroke: 1.5pt + rgb("1A5276"), fill: rgb("EBF5FB"))
          content((-3, 5.5), text(weight: "bold", fill: rgb("1A5276"))[HỘP I])
          content((-3, 3.5), text(fill: red)[$x$ Đỏ] + [\ ] + text(fill: blue)[$4$ Xanh])

          rect((1.5, 2), (4.5, 5), radius: 0.2, stroke: 1.5pt + rgb("900C3F"), fill: rgb("FADBD8"))
          content((3, 5.5), text(weight: "bold", fill: rgb("900C3F"))[HỘP II])
          content((3, 3.5), text(fill: red)[$4$ Đỏ] + [\ ] + text(fill: blue)[$6$ Xanh])

          rect((-1.5, -2.5), (1.5, 0), radius: 0.2, stroke: 1.5pt + rgb("117A65"), fill: rgb("E8F8F5"))
          content((0, 0.5), text(weight: "bold", fill: rgb("117A65"))[HỘP III (5 bi)])

          // Mũi tên chuyển bi
          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black))
          content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 3 bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black))
          content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 2 bi*])

          line((0, -2.5), (0, -4), mark: (end: ">", fill: black), stroke: 1.5pt + red)
          circle((0, -4.6), radius: 0.4, fill: rgb("ffebee"), stroke: 1.5pt + red)
          content((0, -4.6), text(fill: red, weight: "bold")[Đỏ])
        })
      ]
    ]

    #step([Thiết lập thông số trên nhánh cây])
    - Gọi $H_1, H_2$ là biến cố viên bi có gốc từ Hộp I và Hộp II $=> P(H_1) = 3/5; P(H_2) = 2/5$.
    - Gọi $D$ là biến cố rút được bi Đỏ. Dựa vào bảo toàn tỉ lệ:
      $P(D|H_1) = x/(x+4); quad P(D|H_2) = 4/10 = 2/5$.

    #step([Áp dụng công thức Bayes])
    Đề cho $P(H_2|D) = 4/13$:
    $ P(H_2|D) = (P(H_2)P(D|H_2)) / (P(H_1)P(D|H_1) + P(H_2)P(D|H_2)) = 4/13 $
    $ <=> ((2/5) dot 2/5) / ((3/5) dot x/(x+4) + (2/5) dot 2/5) = 4/13 $

    Nhân cả tử và mẫu vế trái cho $25$ để khử mẫu:
    $ 4 / (15 dot x/(x+4) + 4) = 4/13 $

    #step([Giải phương trình])
    Hai tử số bằng nhau, ta cho hai mẫu số bằng nhau:
    $ (15x)/(x+4) + 4 = 13 <=> (15x)/(x+4) = 9 $
    $ <=> 15x = 9(x+4) <=> 15x = 9x + 36 <=> 6x = 36 <=> x = 6 $
    Vậy Hộp I chứa $6$ viên bi Đỏ.
  ],
)

#tln(
  id: "2D6V2-...",
  [*(Toán ngược — Bất phương trình chặn trên)* Hộp I chứa $10$ viên bi gồm $x$ viên bi Đỏ và $(10-x)$ viên bi Trắng. Hộp II chứa $8$ viên bi Đỏ và $2$ viên bi Trắng. Tiến hành lấy $2$ viên bi từ Hộp I và $3$ viên bi từ Hộp II bỏ vào Hộp III (ban đầu rỗng). Rút $1$ viên từ Hộp III thì được bi Đỏ. Tìm số bi Đỏ tối đa trong Hộp I để xác suất viên bi Đỏ này thuộc Hộp I không vượt quá $1/3$.],
  [$6$],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          // Sơ đồ Hộp
          rect((-4.5, 2), (-1.5, 5), radius: 0.2, stroke: 1.5pt + rgb("1A5276"), fill: rgb("EBF5FB"))
          content((-3, 5.5), text(weight: "bold", fill: rgb("1A5276"))[HỘP I (10 bi)])
          content((-3, 3.5), text(fill: red)[$x$ Đỏ] + [\ ] + text(fill: gray)[$(10-x)$ Trắng])

          rect((1.5, 2), (4.5, 5), radius: 0.2, stroke: 1.5pt + rgb("900C3F"), fill: rgb("FADBD8"))
          content((3, 5.5), text(weight: "bold", fill: rgb("900C3F"))[HỘP II (10 bi)])
          content((3, 3.5), text(fill: red)[$8$ Đỏ] + [\ ] + text(fill: gray)[$2$ Trắng])

          rect((-1.5, -2.5), (1.5, 0), radius: 0.2, stroke: 1.5pt + rgb("117A65"), fill: rgb("E8F8F5"))
          content((0, 0.5), text(weight: "bold", fill: rgb("117A65"))[HỘP III (5 bi)])

          // Mũi tên chuyển bi
          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black))
          content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 2 bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black))
          content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 3 bi*])

          line((0, -2.5), (0, -4), mark: (end: ">", fill: black), stroke: 1.5pt + red)
          circle((0, -4.6), radius: 0.4, fill: rgb("ffebee"), stroke: 1.5pt + red)
          content((0, -4.6), text(fill: red, weight: "bold")[Đỏ])
        })
      ]
    ]

    #step([Thiết lập thông số nhánh cây])
    - Xác suất nguồn gốc: $P(H_1) = 2/5; P(H_2) = 3/5$.
    - Xác suất bi Đỏ từ mỗi hộp: $P(D|H_1) = x/10; P(D|H_2) = 8/10 = 4/5$.

    #step([Lập bất phương trình Bayes])
    Ta cần $P(H_1|D) <= 1/3$:
    $ ((2/5) dot x/10) / ((2/5) dot x/10 + (3/5) dot 4/5) <= 1/3 $
    $ <=> ((2x)/50) / ((2x)/50 + 12/25) <= 1/3 $

    Nhân cả tử và mẫu với $50$:
    $ (2x) / (2x + 24) <= 1/3 <=> x / (x + 12) <= 1/3 $

    #step([Giải bất phương trình])
    Vì $x >= 0$ nên mẫu số dương, ta nhân chéo:
    $ 3x <= x + 12 <=> 2x <= 12 <=> x <= 6 $

    Vậy số bi Đỏ tối đa có thể có trong Hộp I là $6$ viên.
  ],
)


// ═══════════════════════════════════════════════
// BỘ BÀI TẬP PHÁT TRIỂN & VẬN DỤNG CAO
// ═══════════════════════════════════════════════
= III. Bài Tập Vận Dụng & Mở Rộng

#tln(
  id: "BAYES-01",
  [*(Biến thể từ bài gốc)* Vẫn sử dụng dữ kiện các hộp bi ở bài trên, nhưng biết rằng viên bi lấy ra cuối cùng từ Hộp III có màu *Xanh*. Tìm $x$ nguyên nhỏ nhất để xác suất viên bi này có nguồn gốc từ Hộp II lớn hơn xác suất có nguồn gốc từ Hộp I?],
  [$13$],
  loigiai: [
    #step([Thiết lập xác suất lấy bi xanh])
    Dựa trên sơ đồ cây, xác suất lấy được bi xanh (gọi là biến cố $X$) với điều kiện nguồn gốc là:
    $ P(X|A_1) = 4/(x+4) ; quad P(X|A_2) = 3/8 $

    #step([So sánh xác suất hậu nghiệm])
    Ta cần giải bất phương trình $P(A_2|X) > P(A_1|X)$. Do cả hai đều chia cho mẫu số chung $P(X)$ trong công thức Bayes, ta chỉ cần so sánh các tử số:
    $ P(A_2) dot P(X|A_2) > P(A_1) dot P(X|A_1) $
    $
      <=> 2/5 dot 3/8 > 3/5 dot 4/(x+4)
      <=> 6/40 > 12/(5(x+4))
      <=> 3/20 > 12/(5(x+4))
    $

    Rút gọn và nhân chéo (do $x>0$):
    $ 15(x+4) > 240 <=> x+4 > 16 <=> x > 12 $

    Vậy giá trị nguyên nhỏ nhất của $x$ là $13$.
  ],
)

#tln(
  id: "BAYES-02",
  [*(Mô hình Y khoa & Sai số)* Tỉ lệ người mắc bệnh $X$ trong cộng đồng là $0,5\%$. Một xét nghiệm chẩn đoán có độ nhạy (xác suất kết quả dương tính nếu thực sự có bệnh) là $99\%$ và độ đặc hiệu (xác suất âm tính nếu không có bệnh) là $98\%$. Giả sử một người đi xét nghiệm và nhận kết quả dương tính. Tính xác suất người này thực tế không mắc bệnh (kết quả "dương tính giả")? Làm tròn đến hàng phần trăm.],
  [$80,16\%$],
  loigiai: [
    #step([Xác định các biến cố và thông số])
    - $B$: biến cố "Người đó mắc bệnh" $=> P(B) = 0","005$ và $P(overline(B)) = 0","995$.
    - $D$: biến cố "Xét nghiệm cho kết quả dương tính".
    - Theo đề: Độ nhạy $P(D|B) = 0","99$; Độ đặc hiệu $P(overline(D)|overline(B)) = 0","98 => P(D|overline(B)) = 0","02$ (xác suất dương tính giả).

    #step([Tính xác suất toàn phần])
    Xác suất một người bất kỳ nhận kết quả dương tính là:
    $
      P(D) = P(B)dot P(D|B) + P(overline(B))dot P(D|overline(B))
      = 0","005 dot 0","99 + 0","995 dot 0","02 = 0","02485
    $

    #step([Tính xác suất hậu nghiệm])
    Ta cần tính $P(overline(B)|D)$ (xác suất không có bệnh khi xét nghiệm dương tính):
    $
      P(overline(B)|D) = (P(overline(B)) dot P(D|overline(B))) / P(D)
      = (0","995 dot 0","02) / 0","02485 approx 0","8008
    $

    Kết quả khoảng $80,08\%$ (gần $80,1\%$).
    #nhanxet[Bài toán minh họa nghịch lý Bayes: Dù xét nghiệm có độ chính xác rất cao ($98-99\%$), nhưng do căn bệnh quá hiếm gặp ($0,5\%$), phần lớn các kết quả dương tính lại là "dương tính giả".]
  ],
)

// ═══════════════════════════════════════════════
// TỔNG KẾT & KỸ THUẬT GIẢI NHANH
// ═══════════════════════════════════════════════
= IV. Kỹ Thuật Giải Nhanh

#meo[
  *1. Quy tắc "Tử số là nhánh, Mẫu số là rừng":*
  Khi tính công thức Bayes bằng Sơ đồ cây, ta làm theo cách rất trực quan sau:
  - *Mẫu số:* Lấy tổng tích của tất cả các nhánh cùng dẫn đến kết quả đang xét (ví dụ: cộng tất cả các nhánh ra "Bi Đỏ").
  - *Tử số:* Bốc đúng phần tích của "nhánh nguyên nhân" mà đề bài yêu cầu đặt lên trên.

  *2. Phân biệt rõ Xác suất Điều kiện và Xác suất Hậu nghiệm:*
  - $P(B|A)$: Chiều Thuận (Biết trước nguyên nhân $A$, tìm khả năng xảy ra kết quả $B$). Đây thường là dữ kiện cho sẵn trên các nhánh lá của sơ đồ cây.
  - $P(A|B)$: Chiều Nghịch - Bài toán Bayes (Đã thấy kết quả $B$ xảy ra, lật ngược lại truy tìm nguyên nhân do $A$).

  *3. Thủ thuật triệt tiêu nhanh:*
  Trong các bài lập tỉ số như bài số 1, hãy nhanh mắt nhìn ra nhân tử chung ở các nhánh cấp 1 (ở bài gốc là phân số có mẫu là $5$ và tử chia hết cho $1/5$) để triệt tiêu lập tức, giúp bất phương trình nhẹ nhàng hơn rất nhiều trước khi quy đồng.
]

#tln(
  id: "BAYES-NGUOC-01",
  [*(Toán ngược tìm số bi)* Có hai hộp bi. Hộp I đựng $x$ viên bi đỏ và $3$ viên bi trắng. Hộp II đựng $5$ viên bi đỏ và $2$ viên bi trắng. Gieo một con xúc xắc cân đối. Nếu xuất hiện mặt $1$ hoặc $2$ chấm thì chọn Hộp I; nếu xuất hiện các mặt còn lại thì chọn Hộp II. Từ hộp được chọn, lấy ngẫu nhiên ra $1$ viên bi thì thấy nó có màu Đỏ. Biết xác suất để viên bi Đỏ này thuộc Hộp I là $7/27$. Tìm số bi đỏ $x$ ban đầu trong Hộp I?

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Vẽ Xúc Xắc
        rect((-0.6, 4.4), (0.6, 5.6), radius: 0.15, fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("FBC02D"))
        circle((-0.2, 5.2), radius: 0.08, fill: black)
        circle((0.2, 4.8), radius: 0.08, fill: black)
        content((0, 6.2), text(weight: "bold")[Gieo Xúc Xắc])

        // Vẽ Hộp I
        rect((-4.5, 0), (-1.5, 2.5), radius: 0.2, fill: rgb("EBF5FB"), stroke: 1.2pt + rgb("1A5276"))
        content((-3, 3), text(weight: "bold", fill: rgb("1A5276"))[HỘP I])
        circle((-3.5, 1.5), radius: 0.2, fill: rgb("ffebee"), stroke: 1pt + red)
        content((-2.5, 1.5), text(fill: red)[$x$ Đỏ])
        circle((-3.5, 0.8), radius: 0.2, fill: white, stroke: 1pt + gray)
        content((-2.5, 0.8), text(fill: gray)[$3$ Trắng])

        // Vẽ Hộp II
        rect((1.5, 0), (4.5, 2.5), radius: 0.2, fill: rgb("FADBD8"), stroke: 1.2pt + rgb("900C3F"))
        content((3, 3), text(weight: "bold", fill: rgb("900C3F"))[HỘP II])
        circle((2.5, 1.5), radius: 0.2, fill: rgb("ffebee"), stroke: 1pt + red)
        content((3.5, 1.5), text(fill: red)[$5$ Đỏ])
        circle((2.5, 0.8), radius: 0.2, fill: white, stroke: 1pt + gray)
        content((3.5, 0.8), text(fill: gray)[$2$ Trắng])

        // Mũi tên từ xúc xắc xuống hộp
        line((-0.3, 4.3), (-3, 3.5), mark: (end: ">", fill: black))
        content((-1.8, 4.2), angle: 22deg, box(fill: white, inset: 1pt)[Mặt $1, 2$])
        line((0.3, 4.3), (3, 3.5), mark: (end: ">", fill: black))
        content((1.8, 4.2), angle: -22deg, box(fill: white, inset: 1pt)[Mặt $3,4,5,6$])

        // Mũi tên rút bi ra ngoài
        line((-3, 0), (0, -2), mark: (end: ">", fill: black), stroke: 1.2pt + red)
        line((3, 0), (0, -2), mark: (end: ">", fill: black), stroke: 1.2pt + red)
        circle((0, -2.6), radius: 0.45, fill: rgb("ffebee"), stroke: 1.5pt + red)
        content((0, -2.6), text(fill: red, weight: "bold")[Đỏ])
      })
    ]],
  [$x=3$],
  loigiai: [
    #step([Xác suất chọn hộp])
    Gọi $H_1, H_2$ là biến cố chọn Hộp I và Hộp II.
    Gieo xúc xắc, mặt $1,2$ chọn Hộp I $=> P(H_1) = 2/6 = 1/3$.
    Các mặt $3,4,5,6$ chọn Hộp II $=> P(H_2) = 4/6 = 2/3$.

    #step([Xác suất điều kiện lấy bi Đỏ (gọi là D)])
    Hộp I có $(x+3)$ bi, trong đó có $x$ bi đỏ $=> P(D|H_1) = x/(x+3)$.
    Hộp II có $7$ bi, trong đó có $5$ bi đỏ $=> P(D|H_2) = 5/7$.

    #step([Thiết lập phương trình Bayes])
    Theo đề, xác suất hậu nghiệm $P(H_1|D) = 7/27$. Ta có:
    $ P(H_1|D) = (P(H_1) dot P(D|H_1)) / (P(H_1) dot P(D|H_1) + P(H_2) dot P(D|H_2)) = 7/27 $
    $ <=> ((1/3) dot x/(x+3)) / ((1/3) dot x/(x+3) + (2/3) dot 5/7) = 7/27 $

    Triệt tiêu $1/3$ ở tử và mẫu:
    $ (x/(x+3)) / (x/(x+3) + 10/7) = 7/27 $

    Đặt $y = x/(x+3)$, phương trình trở thành:
    $ y / (y + 10/7) = 7/27 <=> 27y = 7(y + 10/7) <=> 27y = 7y + 10 <=> 20y = 10 <=> y = 1/2 $

    #step([Giải tìm x])
    Thay $y$ trở lại:
    $ x/(x+3) = 1/2 <=> 2x = x + 3 <=> x = 3 $
    Vậy Hộp I có $3$ viên bi đỏ.
  ],
)

#tln(
  id: "BAYES-NGUOC-02",
  [*(Toán ngược tìm tỉ lệ phần trăm)* Một nhà máy có hai dây chuyền sản xuất A và B. Dây chuyền A sản xuất $x\%$ tổng sản phẩm, phần còn lại do dây chuyền B sản xuất. Tỉ lệ phế phẩm của dây chuyền A là $2\%$, của dây chuyền B là $4\%$. Lấy ngẫu nhiên một sản phẩm của nhà máy thì phát hiện nó là phế phẩm. Biết xác suất để phế phẩm này do dây chuyền A sản xuất là $0,25$. Tìm $x$?

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Vẽ Nhà máy
        rect((-1.5, 4), (1.5, 5), radius: 0.2, fill: rgb("ECEFF1"), stroke: 1.5pt + rgb("607D8B"))
        content((0, 4.5), text(weight: "bold")[NHÀ MÁY (100%)])

        // Dây chuyền
        rect((-5, 0), (-1, 2), radius: 0.2, fill: rgb("E8F8F5"), stroke: 1.2pt + rgb("117A65"))
        content((-3, 1), text(weight: "bold", fill: rgb("117A65"))[Dây chuyền A\ ($x\%$)])

        rect((1, 0), (5, 2), radius: 0.2, fill: rgb("FEF9E7"), stroke: 1.2pt + rgb("F39C12"))
        content((3, 1), text(weight: "bold", fill: rgb("F39C12"))[Dây chuyền B\ ($(100-x)\%$)])

        // Mũi tên chia nhánh
        line((-0.5, 3.9), (-3, 2.5), mark: (end: ">", fill: black))
        line((0.5, 3.9), (3, 2.5), mark: (end: ">", fill: black))

        // Mũi tên ra phế phẩm
        circle((0, -2), radius: 0.7, fill: rgb("FFEBEE"), stroke: 1.5pt + red)
        content((0, -2), text(fill: red, weight: "bold")[1 Phế\ Phẩm])

        line((-3, 0), (-0.5, -1.4), mark: (end: ">", fill: black), stroke: 1.2pt + red)
        content((-2.2, -0.4), angle: -28deg, box(fill: white, inset: 2pt, text(fill: red)[Lỗi $2\%$]))

        line((3, 0), (0.5, -1.4), mark: (end: ">", fill: black), stroke: 1.2pt + red)
        content((2.2, -0.4), angle: 28deg, box(fill: white, inset: 2pt, text(fill: red)[Lỗi $4\%$]))
      })
    ]],
  [$x=40$],
  loigiai: [
    #step([Gọi các biến cố])
    - Gọi $A, B$ là biến cố sản phẩm thuộc dây chuyền A và B.
      Ta có: $P(A) = x/100$ và $P(B) = (100-x)/100$.
    - Gọi $F$ là biến cố "Sản phẩm là phế phẩm".
      Theo đề: $P(F|A) = 0","02$ và $P(F|B) = 0","04$.

    #step([Thiết lập phương trình Bayes])
    Đề bài cho $P(A|F) = 0","25 = 1/4$. Áp dụng công thức Bayes:
    $ P(A|F) = (P(A) dot P(F|A)) / (P(A) dot P(F|A) + P(B) dot P(F|B)) = 1/4 $

    Thay số (bỏ chung mẫu số $100$ của $P(A)$ và $P(B)$ cho gọn):
    $ (x dot 0","02) / (x dot 0","02 + (100-x) dot 0","04) = 1/4 $

    #step([Giải phương trình])
    Chia cả tử và mẫu vế trái cho $0,02$:
    $
      x / (x + 2(100-x)) = 1/4
      <=> x / (x + 200 - 2x) = 1/4
      <=> x / (200 - x) = 1/4
    $

    Nhân chéo:
    $ 4x = 200 - x <=> 5x = 200 <=> x = 40 $

    Vậy dây chuyền A sản xuất $40\%$ tổng sản phẩm.
  ],
)

#tln(
  id: "BAYES-NGUOC-03",
  [*(Toán ngược bất phương trình Y khoa)* Một căn bệnh có tỉ lệ mắc trong dân số là $5\%$. Một loại xét nghiệm chẩn đoán bệnh này có độ nhạy (xác suất kết quả dương tính nếu có bệnh) là $95\%$. Gọi $x\%$ là độ đặc hiệu của xét nghiệm (xác suất kết quả âm tính nếu không có bệnh). Tìm giá trị nguyên nhỏ nhất của $x$ để: Nếu một người xét nghiệm ra kết quả dương tính, xác suất người đó thực sự mắc bệnh lớn hơn hoặc bằng $50\%$?

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Dân số
        content((0, 5), box(
          fill: rgb("E3F2FD"),
          stroke: 1.5pt + rgb("1976D2"),
          inset: 8pt,
          radius: 5pt,
        )[*DÂN SỐ CỘNG ĐỒNG*])

        // Các nhánh
        content(
          (-3.5, 2.5),
          box(fill: rgb("FFEBEE"), stroke: 1.5pt + red, inset: 8pt, radius: 5pt)[*Mắc Bệnh ($5\%$)*],
          name: "benh",
        )
        content(
          (3.5, 2.5),
          box(fill: rgb("E8F8F5"), stroke: 1.5pt + rgb("117A65"), inset: 8pt, radius: 5pt)[*Không Bệnh ($95\%$)*],
          name: "kbenh",
        )

        line((0, 4.5), (-3.5, 3.2), mark: (end: ">", fill: black))
        line((0, 4.5), (3.5, 3.2), mark: (end: ">", fill: black))

        // Kết quả Xét nghiệm
        circle((-3.5, -1), radius: 0.8, fill: rgb("FFCDD2"), stroke: 1.5pt + red, name: "tp")
        content((-3.5, -1), text(fill: red, weight: "bold")[Dương tính\ $(+)$])

        circle((1.5, -1), radius: 0.8, fill: rgb("FFCDD2"), stroke: 1.5pt + red, name: "fp")
        content((1.5, -1), text(fill: red, weight: "bold")[Dương tính\ $(+)$])

        circle((5.5, -1), radius: 0.8, fill: rgb("C8E6C9"), stroke: 1.5pt + green.darken(20%), name: "tn")
        content((5.5, -1), text(fill: green.darken(30%), weight: "bold")[Âm tính\ $(-)$])

        line((-3.5, 1.8), (-3.5, -0.1), mark: (end: ">", fill: black), stroke: 1.2pt + red)
        content((-3.5, 0.8), box(fill: white, inset: 2pt, text(fill: red)[Nhạy $95\%$]))

        line((3.5, 1.8), (1.5, -0.1), mark: (end: ">", fill: black), stroke: 1.2pt + red)
        content((2.5, 1.1), angle: 45deg, box(fill: white, inset: 2pt, text(fill: red)[Dương giả $(100-x)\%$]))

        line((3.5, 1.8), (5.5, -0.1), mark: (end: ">", fill: black), stroke: 1.2pt + green.darken(30%))
        content((4.7, 1.1), angle: -45deg, box(fill: white, inset: 2pt, text(fill: green.darken(30%))[Đặc hiệu $x\%$]))
      })
    ]],
  [$x=95$],
  loigiai: [
    #step([Phân tích thông số])
    - Gọi $D$ là biến cố "Mắc bệnh" $=> P(D) = 0","05; quad P(overline(D)) = 0","95$.
    - Gọi $+$ là biến cố "Xét nghiệm dương tính".
    - Độ nhạy $P(+|D) = 0","95$.
    - Độ đặc hiệu $P(-|overline(D)) = x/100$, suy ra xác suất dương tính giả là $P(+|overline(D)) = 1 - x/100$.

    #step([Thiết lập bất phương trình Bayes])
    Ta cần $P(D|+) >= 0","5$ (tức là $1/2$):
    $ P(D|+) = (P(D) dot P(+|D)) / (P(D) dot P(+|D) + P(overline(D)) dot P(+|overline(D))) >= 1/2 $

    Để một phân số dương lớn hơn hoặc bằng $1/2$, thì Tử số phải lớn hơn hoặc bằng một nửa Mẫu số, hay nói cách khác: *Tử số phải lớn hơn hoặc bằng phần còn lại của Mẫu số*.
    $ P(D) dot P(+|D) >= P(overline(D)) dot P(+|overline(D)) $

    #step([Giải bất phương trình])
    Thay số vào:
    $ 0","05 dot 0","95 >= 0","95 dot (1 - x/100) $

    Chia hai vế cho $0,95$:
    $ 0","05 >= 1 - x/100 <=> x/100 >= 1 - 0","05 = 0","95 <=> x >= 95 $

    Vì $x$ là số nguyên, nên giá trị nhỏ nhất của $x$ là $95$.
  ],
)

// ═══════════════════════════════════════════════
// CHO SẴN SỐ LIỆU - TÍNH NGƯỢC NGUỒN GỐC
// ═══════════════════════════════════════════════
= V. Cho Sẵn Số Liệu - Tính Xác Suất Nguồn Gốc

#lythuyet[
  *Quy trình chuẩn của dạng "cho sẵn số liệu":*
  - Bước 1: Vẽ sơ đồ cây hai tầng: *Nguồn gốc* -> *Kết quả quan sát*.
  - Bước 2: Ghi xác suất nguồn ở tầng đầu $P(H_i)$.
  - Bước 3: Ghi xác suất điều kiện ở tầng sau $P(M|H_i)$.
  - Bước 4: Tính Bayes theo đúng tinh thần "tử số là nhánh, mẫu số là rừng".
]

#meo[
  *Phần này cũng phải vẽ cây như bài tìm $x$.* Khác nhau duy nhất là: ở đây mọi số liệu đã có sẵn, nên sau khi vẽ cây xong thì chỉ còn việc đọc nhánh và thay trực tiếp vào công thức.
]

== A. Bayes Trực Tiếp - Cho Sẵn Số Liệu

#tln(
  id: "BAYES-DIRECT-01",
  [*(Cho sẵn số - truy nguồn gốc trực tiếp)* Hộp I có $6$ bi Đỏ và $4$ bi Xanh. Hộp II có $3$ bi Đỏ và $5$ bi Xanh. Lấy $3$ bi từ Hộp I và $2$ bi từ Hộp II bỏ vào Hộp III. Từ Hộp III rút ngẫu nhiên $1$ bi thì được bi Đỏ. Tính xác suất viên bi Đỏ đó có nguồn gốc từ Hộp I.],
  [$12/17$],
  loigiai: [
    #ppgiai[
      *Sơ đồ cây truy nguồn gốc:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let root = box(fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("FBC02D"), inset: 8pt, radius: 5pt)[*1 bi từ Hộp III*]
          content((0, 4), root, name: "root")

          let h1 = box(fill: rgb("E0F2F1"), stroke: 1.5pt + rgb("009688"), inset: 8pt, radius: 5pt)[*Gốc Hộp I*]
          let h2 = box(fill: rgb("FFF3E0"), stroke: 1.5pt + rgb("EF6C00"), inset: 8pt, radius: 5pt)[*Gốc Hộp II*]
          content((-3.5, 2), h1, name: "h1")
          content((3.5, 2), h2, name: "h2")

          circle((-5, 0), radius: 0.55, fill: rgb("FFEBEE"), stroke: 1.5pt + red, name: "r1")
          content("r1", text(fill: red)[*Đỏ*])
          circle((-2, 0), radius: 0.55, fill: rgb("E3F2FD"), stroke: 1.5pt + blue, name: "b1")
          content("b1", text(fill: blue)[*Xanh*])
          circle((2, 0), radius: 0.55, fill: rgb("FFEBEE"), stroke: 1.5pt + red, name: "r2")
          content("r2", text(fill: red)[*Đỏ*])
          circle((5, 0), radius: 0.55, fill: rgb("E3F2FD"), stroke: 1.5pt + blue, name: "b2")
          content("b2", text(fill: blue)[*Xanh*])

          line("root", "h1", mark: (end: ">"))
          content((-1.6, 3.2), box(fill: white, inset: 1pt)[$3 / 5$])
          line("root", "h2", mark: (end: ">"))
          content((1.6, 3.2), box(fill: white, inset: 1pt)[$2 / 5$])

          line("h1", "r1", mark: (end: ">"))
          content((-4.8, 1.2), box(fill: white, inset: 1pt)[$6 / 10$])
          line("h1", "b1", mark: (end: ">"))
          content((-2.2, 1.2), box(fill: white, inset: 1pt)[$4 / 10$])
          line("h2", "r2", mark: (end: ">"))
          content((2.2, 1.2), box(fill: white, inset: 1pt)[$3 / 8$])
          line("h2", "b2", mark: (end: ">"))
          content((4.8, 1.2), box(fill: white, inset: 1pt)[$5 / 8$])
        })
      ]
    ]

    #step([Đặt biến cố và đọc từ cây])
    Gọi $H_1, H_2$ là biến cố viên bi rút ra có gốc từ Hộp I và Hộp II; $D$ là biến cố rút được bi Đỏ.
    Từ cây ta đọc được:
    $ P(H_1) = 3 / 5 ; quad P(H_2) = 2 / 5 $
    $ P(D|H_1) = 6 / 10 = 3 / 5 ; quad P(D|H_2) = 3 / 8 $

    #step([Áp dụng Bayes])
    $
      P(H_1|D) = ((3/5) dot (3/5)) / ((3/5) dot (3/5) + (2/5) dot (3/8))
      = (9/25) / (9/25 + 3/20)
      = (36/100) / (51/100)
      = 12/17
    $

    Vậy xác suất viên bi Đỏ có nguồn gốc từ Hộp I là $12/17$.
  ],
)

#tln(
  id: "BAYES-DIRECT-02",
  [*(Cho sẵn số - gắn với xúc xắc)* Gieo một con xúc xắc cân đối. Nếu xuất hiện mặt $1$ hoặc $2$ thì chọn Hộp I; nếu xuất hiện các mặt còn lại thì chọn Hộp II. Hộp I có $4$ bi Đỏ và $2$ bi Trắng; Hộp II có $3$ bi Đỏ và $7$ bi Trắng. Lấy ngẫu nhiên $1$ bi từ hộp được chọn và thấy nó có màu Đỏ. Tính xác suất viên bi Đỏ này thuộc Hộp I.],
  [$10/19$],
  loigiai: [
    #ppgiai[
      *Sơ đồ cây truy nguồn gốc:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let root = box(
            fill: rgb("FFF9C4"),
            stroke: 1.5pt + rgb("FBC02D"),
            inset: 8pt,
            radius: 5pt,
          )[*Gieo xúc xắc rồi lấy 1 bi*]
          content((0, 4), root, name: "root")

          let h1 = box(fill: rgb("EBF5FB"), stroke: 1.5pt + rgb("1A5276"), inset: 8pt, radius: 5pt)[*Chọn Hộp I*]
          let h2 = box(fill: rgb("FADBD8"), stroke: 1.5pt + rgb("900C3F"), inset: 8pt, radius: 5pt)[*Chọn Hộp II*]
          content((-3.5, 2), h1, name: "h1")
          content((3.5, 2), h2, name: "h2")

          circle((-5, 0), radius: 0.55, fill: rgb("FFEBEE"), stroke: 1.5pt + red, name: "r1")
          content("r1", text(fill: red)[*Đỏ*])
          circle((-2, 0), radius: 0.55, fill: white, stroke: 1.5pt + gray, name: "w1")
          content("w1", text(fill: gray)[*Trắng*])
          circle((2, 0), radius: 0.55, fill: rgb("FFEBEE"), stroke: 1.5pt + red, name: "r2")
          content("r2", text(fill: red)[*Đỏ*])
          circle((5, 0), radius: 0.55, fill: white, stroke: 1.5pt + gray, name: "w2")
          content("w2", text(fill: gray)[*Trắng*])

          line("root", "h1", mark: (end: ">"))
          content((-1.6, 3.2), box(fill: white, inset: 1pt)[$1 / 3$])
          line("root", "h2", mark: (end: ">"))
          content((1.6, 3.2), box(fill: white, inset: 1pt)[$2 / 3$])

          line("h1", "r1", mark: (end: ">"))
          content((-4.8, 1.2), box(fill: white, inset: 1pt)[$4 / 6$])
          line("h1", "w1", mark: (end: ">"))
          content((-2.2, 1.2), box(fill: white, inset: 1pt)[$2 / 6$])
          line("h2", "r2", mark: (end: ">"))
          content((2.2, 1.2), box(fill: white, inset: 1pt)[$3 / 10$])
          line("h2", "w2", mark: (end: ">"))
          content((4.8, 1.2), box(fill: white, inset: 1pt)[$7 / 10$])
        })
      ]
    ]

    #step([Đọc dữ kiện từ cây])
    Gọi $H_1, H_2$ là biến cố chọn Hộp I, Hộp II; $D$ là biến cố lấy được bi Đỏ.
    Ta có:
    $ P(H_1) = 1 / 3 ; quad P(H_2) = 2 / 3 $
    $ P(D|H_1) = 4 / 6 = 2 / 3 ; quad P(D|H_2) = 3 / 10 $

    #step([Tính Bayes])
    $
      P(H_1|D) = ((1/3) dot (2/3)) / ((1/3) dot (2/3) + (2/3) dot (3/10))
      = (2/9) / (2/9 + 1/5)
      = (10/45) / (19/45)
      = 10/19
    $

    Vậy xác suất viên bi Đỏ thuộc Hộp I là $10/19$.
  ],
)

#tln(
  id: "BAYES-DIRECT-03",
  [*(Cho sẵn số - mô hình sản xuất)* Một nhà máy có hai dây chuyền $A$ và $B$. Dây chuyền $A$ sản xuất $40\%$ tổng sản lượng, dây chuyền $B$ sản xuất $60\%$. Tỉ lệ phế phẩm của $A$ là $1\%$, của $B$ là $3\%$. Chọn ngẫu nhiên một sản phẩm và biết rằng nó là phế phẩm. Tính xác suất sản phẩm đó do dây chuyền $B$ sản xuất.],
  [$9/11$],
  loigiai: [
    #ppgiai[
      *Sơ đồ cây truy nguồn gốc:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let root = box(fill: rgb("E3F2FD"), stroke: 1.5pt + rgb("1976D2"), inset: 8pt, radius: 5pt)[*Chọn 1 sản phẩm*]
          content((0, 4), root, name: "root")

          let a = box(fill: rgb("E8F8F5"), stroke: 1.5pt + rgb("117A65"), inset: 8pt, radius: 5pt)[*Dây chuyền A*]
          let b = box(fill: rgb("FEF9E7"), stroke: 1.5pt + rgb("F39C12"), inset: 8pt, radius: 5pt)[*Dây chuyền B*]
          content((-3.5, 2), a, name: "a")
          content((3.5, 2), b, name: "b")

          circle((-5, 0), radius: 0.55, fill: rgb("FFEBEE"), stroke: 1.5pt + red, name: "f1")
          content("f1", text(fill: red)[*Lỗi*])
          circle((-2, 0), radius: 0.55, fill: rgb("D5F5E3"), stroke: 1.5pt + rgb("117A65"), name: "g1")
          content("g1", text(fill: rgb("117A65"))[*Tốt*])
          circle((2, 0), radius: 0.55, fill: rgb("FFEBEE"), stroke: 1.5pt + red, name: "f2")
          content("f2", text(fill: red)[*Lỗi*])
          circle((5, 0), radius: 0.55, fill: rgb("D5F5E3"), stroke: 1.5pt + rgb("117A65"), name: "g2")
          content("g2", text(fill: rgb("117A65"))[*Tốt*])

          line("root", "a", mark: (end: ">"))
          content((-1.6, 3.2), box(fill: white, inset: 1pt)[$40\%$])
          line("root", "b", mark: (end: ">"))
          content((1.6, 3.2), box(fill: white, inset: 1pt)[$60\%$])

          line("a", "f1", mark: (end: ">"))
          content((-4.8, 1.2), box(fill: white, inset: 1pt)[$1\%$])
          line("a", "g1", mark: (end: ">"))
          content((-2.2, 1.2), box(fill: white, inset: 1pt)[$99\%$])
          line("b", "f2", mark: (end: ">"))
          content((2.2, 1.2), box(fill: white, inset: 1pt)[$3\%$])
          line("b", "g2", mark: (end: ">"))
          content((4.8, 1.2), box(fill: white, inset: 1pt)[$97\%$])
        })
      ]
    ]

    #step([Đọc nhánh lỗi từ sơ đồ cây])
    Gọi $F$ là biến cố "sản phẩm bị lỗi".
    Ta có:
    $ P(A) = 0.4 ; quad P(B) = 0.6 $
    $ P(F|A) = 0.01 ; quad P(F|B) = 0.03 $

    #step([Tính xác suất hậu nghiệm])
    $
      P(B|F) = (0.6 dot 0.03) / (0.4 dot 0.01 + 0.6 dot 0.03)
      = 0.018 / 0.022
      = 9 / 11
    $

    Vậy xác suất phế phẩm được chọn do dây chuyền $B$ sản xuất là $9/11 approx 81.82\%$.
  ],
)

== B. Điều Kiện Lọc Tổ Hợp - Truy Nguồn Gốc

#lythuyet[
  *Đây là nhóm khó hơn Bayes trực tiếp.* Ta không hỏi ngay "Đỏ thì từ đâu", mà bị chặn bởi một điều kiện lọc kiểu:
  - "Biết mẫu lấy ra có đúng $4$ bi Đỏ và $3$ bi Xanh".
  - "Biết mẫu lấy ra có đúng $3$ bi từ rổ I".

  Khi đó nên đi theo đúng cấu trúc sau:
  - Đặt $A$ là điều kiện lọc màu sắc / số lượng / cơ cấu mẫu.
  - Đặt $B$ là điều kiện truy nguồn gốc cần hỏi.
  - Tính $P(B|A) = P(A ∩ B) / P(A)$.
  - Với $P(A ∩ B)$, nên *vẽ cây các trường hợp tương thích* để không sót nhánh.
]

#tln(
  id: "BAYES-DIRECT-04",
  [*(Dạng tổ hợp - truy nguồn gốc có điều kiện lọc)* Rổ I có $4$ bi Đỏ và $3$ bi Xanh. Rổ II có $5$ bi Đỏ và $2$ bi Xanh. Chuyển toàn bộ bi từ rổ I sang rổ II, rồi lấy ngẫu nhiên $7$ bi từ rổ II. Biết rằng trong $7$ bi lấy ra có đúng $4$ bi Đỏ và $3$ bi Xanh. Tính xác suất để trong $7$ bi lấy ra có đúng $3$ bi thuộc rổ I ban đầu.],
  [$1/3$],
  loigiai: [
    #ppgiai[
      *Cây các trường hợp tạo nên $A ∩ B$:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let root = box(fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("FBC02D"), inset: 8pt, radius: 5pt)[
            #align(center)[
              *$A ∩ B$* \
              đúng $4$ Đỏ, $3$ Xanh \
              đúng $3$ bi từ rổ I
            ]
          ]
          content((0, 4.3), root, name: "root")

          let th1 = box(fill: rgb("E8F8F5"), stroke: 1.5pt + rgb("117A65"), inset: 8pt, radius: 5pt)[
            #align(center)[
              *TH1* \
              Rổ I: $1$ Đỏ, $2$ Xanh \
              Rổ II: $3$ Đỏ, $1$ Xanh
            ]
          ]
          let th2 = box(fill: rgb("EBF5FB"), stroke: 1.5pt + rgb("1A5276"), inset: 8pt, radius: 5pt)[
            #align(center)[
              *TH2* \
              Rổ I: $2$ Đỏ, $1$ Xanh \
              Rổ II: $2$ Đỏ, $2$ Xanh
            ]
          ]

          content((-4, 1.5), th1, name: "th1")
          content((4, 1.5), th2, name: "th2")

          line("root", "th1", mark: (end: ">"))
          line("root", "th2", mark: (end: ">"))
        })
      ]
    ]

    #step([Đặt biến cố])
    Gọi $A$ là biến cố: "Trong $7$ bi lấy ra có đúng $4$ bi Đỏ và $3$ bi Xanh".
    Gọi $B$ là biến cố: "Trong $7$ bi lấy ra có đúng $3$ bi thuộc rổ I ban đầu".
    Khi đó:
    $ P(B|A) = P(A ∩ B) / P(A) $

    #step([Tính mẫu số])
    Sau khi nhập, rổ chung có $9$ bi Đỏ và $5$ bi Xanh. Vì thế:
    $ P(A) = (binom(9, 4) dot binom(5, 3)) / binom(14, 7) $

    #step([Tính tử số bằng cây trường hợp])
    Từ cây, $A ∩ B$ gồm đúng hai trường hợp tương thích:
    - TH1: Rổ I góp $1$ Đỏ, $2$ Xanh; rổ II ban đầu góp $3$ Đỏ, $1$ Xanh.
    - TH2: Rổ I góp $2$ Đỏ, $1$ Xanh; rổ II ban đầu góp $2$ Đỏ, $2$ Xanh.

    Do đó:
    $
      P(A ∩ B) = (binom(4, 1) dot binom(3, 2) dot binom(5, 3) dot binom(2, 1)
      + binom(4, 2) dot binom(3, 1) dot binom(5, 2) dot binom(2, 2)) / binom(14, 7)
    $

    #step([Kết luận])
    $
      P(B|A) = (240 + 180) / (binom(9, 4) dot binom(5, 3))
      = 420 / 1260
      = 1 / 3
    $

    Vậy xác suất cần tìm là $1/3$.
  ],
)

#tln(
  id: "BAYES-DIRECT-05",
  [*(Lọc tổ hợp - nhiều nhánh hơn)* Rổ I có $3$ bi Đỏ và $2$ bi Xanh. Rổ II có $4$ bi Đỏ và $5$ bi Xanh. Chuyển toàn bộ bi từ rổ I sang rổ II, rồi lấy ngẫu nhiên $6$ bi. Biết rằng trong $6$ bi lấy ra có đúng $3$ bi Đỏ và $3$ bi Xanh. Tính xác suất để trong $6$ bi đó có đúng $2$ bi thuộc rổ I ban đầu.],
  [$20/49$],
  loigiai: [
    #ppgiai[
      *Cây các trường hợp tạo nên $A ∩ B$:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let root = box(fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("FBC02D"), inset: 8pt, radius: 5pt)[
            #align(center)[
              *$A ∩ B$* \
              đúng $3$ Đỏ, $3$ Xanh \
              đúng $2$ bi từ rổ I
            ]
          ]
          content((0, 4.5), root, name: "root")

          let th1 = box(fill: rgb("FDEDEC"), stroke: 1.5pt + rgb("C0392B"), inset: 7pt, radius: 5pt)[
            #align(center)[
              *TH1* \
              I: $0$ Đỏ, $2$ Xanh \
              II: $3$ Đỏ, $1$ Xanh
            ]
          ]
          let th2 = box(fill: rgb("E8F8F5"), stroke: 1.5pt + rgb("117A65"), inset: 7pt, radius: 5pt)[
            #align(center)[
              *TH2* \
              I: $1$ Đỏ, $1$ Xanh \
              II: $2$ Đỏ, $2$ Xanh
            ]
          ]
          let th3 = box(fill: rgb("EBF5FB"), stroke: 1.5pt + rgb("1A5276"), inset: 7pt, radius: 5pt)[
            #align(center)[
              *TH3* \
              I: $2$ Đỏ, $0$ Xanh \
              II: $1$ Đỏ, $3$ Xanh
            ]
          ]

          content((-4.8, 1.6), th1, name: "th1")
          content((0, 1.6), th2, name: "th2")
          content((4.8, 1.6), th3, name: "th3")

          line("root", "th1", mark: (end: ">"))
          line("root", "th2", mark: (end: ">"))
          line("root", "th3", mark: (end: ">"))
        })
      ]
    ]

    #step([Đặt biến cố])
    Gọi $A$ là biến cố: "Trong $6$ bi lấy ra có đúng $3$ bi Đỏ và $3$ bi Xanh".
    Gọi $B$ là biến cố: "Trong $6$ bi lấy ra có đúng $2$ bi thuộc rổ I ban đầu".
    Khi đó:
    $ P(B|A) = P(A ∩ B) / P(A) $

    #step([Tính mẫu số])
    Sau khi nhập, rổ chung có $7$ bi Đỏ và $7$ bi Xanh. Vì vậy:
    $ P(A) = (binom(7, 3) dot binom(7, 3)) / binom(14, 6) $

    #step([Tính tử số bằng cây trường hợp])
    Từ cây, $A ∩ B$ có ba trường hợp:
    - TH1: $I:(0Đ,2X)$; $II:(3Đ,1X)$.
    - TH2: $I:(1Đ,1X)$; $II:(2Đ,2X)$.
    - TH3: $I:(2Đ,0X)$; $II:(1Đ,3X)$.

    Suy ra:
    $
      P(A ∩ B) = (binom(3, 0) dot binom(2, 2) dot binom(4, 3) dot binom(5, 1)
      + binom(3, 1) dot binom(2, 1) dot binom(4, 2) dot binom(5, 2)
      + binom(3, 2) dot binom(2, 0) dot binom(4, 1) dot binom(5, 3)) / binom(14, 6)
    $
    $
      = (20 + 360 + 120) / binom(14, 6)
      = 500 / binom(14, 6)
    $

    #step([Kết luận])
    $
      P(B|A) = 500 / (binom(7, 3) dot binom(7, 3))
      = 500 / 1225
      = 20 / 49
    $

    Vậy xác suất cần tìm là $20/49$.
  ],
)

#tln(
  id: "BAYES-DIRECT-06",
  [*(Lọc tổ hợp - ít nhánh nhưng dễ nhầm)* Rổ I có $5$ bi Đỏ và $1$ bi Xanh. Rổ II có $2$ bi Đỏ và $4$ bi Xanh. Chuyển toàn bộ bi từ rổ I sang rổ II, rồi lấy ngẫu nhiên $5$ bi. Biết rằng trong $5$ bi lấy ra có đúng $3$ bi Đỏ và $2$ bi Xanh. Tính xác suất để đúng $2$ bi trong $5$ bi đó thuộc rổ I ban đầu.],
  [$2/5$],
  loigiai: [
    #ppgiai[
      *Cây các trường hợp tạo nên $A ∩ B$:*
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let root = box(fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("FBC02D"), inset: 8pt, radius: 5pt)[
            #align(center)[
              *$A ∩ B$* \
              đúng $3$ Đỏ, $2$ Xanh \
              đúng $2$ bi từ rổ I
            ]
          ]
          content((0, 4.2), root, name: "root")

          let th1 = box(fill: rgb("E8F8F5"), stroke: 1.5pt + rgb("117A65"), inset: 8pt, radius: 5pt)[
            #align(center)[
              *TH1* \
              I: $1$ Đỏ, $1$ Xanh \
              II: $2$ Đỏ, $1$ Xanh
            ]
          ]
          let th2 = box(fill: rgb("EBF5FB"), stroke: 1.5pt + rgb("1A5276"), inset: 8pt, radius: 5pt)[
            #align(center)[
              *TH2* \
              I: $2$ Đỏ, $0$ Xanh \
              II: $1$ Đỏ, $2$ Xanh
            ]
          ]

          content((-4, 1.4), th1, name: "th1")
          content((4, 1.4), th2, name: "th2")

          line("root", "th1", mark: (end: ">"))
          line("root", "th2", mark: (end: ">"))
        })
      ]
    ]

    #step([Đặt biến cố])
    Gọi $A$ là biến cố: "Trong $5$ bi lấy ra có đúng $3$ bi Đỏ và $2$ bi Xanh".
    Gọi $B$ là biến cố: "Trong $5$ bi lấy ra có đúng $2$ bi thuộc rổ I ban đầu".
    Khi đó:
    $ P(B|A) = P(A ∩ B) / P(A) $

    #step([Tính mẫu số])
    Sau khi nhập, rổ chung có $7$ bi Đỏ và $5$ bi Xanh. Do đó:
    $ P(A) = (binom(7, 3) dot binom(5, 2)) / binom(12, 5) $

    #step([Tính tử số bằng cây trường hợp])
    Từ cây, $A ∩ B$ có đúng hai trường hợp:
    - TH1: $I:(1Đ,1X)$; $II:(2Đ,1X)$.
    - TH2: $I:(2Đ,0X)$; $II:(1Đ,2X)$.

    Suy ra:
    $
      P(A ∩ B) = (binom(5, 1) dot binom(1, 1) dot binom(2, 2) dot binom(4, 1)
      + binom(5, 2) dot binom(1, 0) dot binom(2, 1) dot binom(4, 2)) / binom(12, 5)
    $
    $
      = (20 + 120) / binom(12, 5)
      = 140 / binom(12, 5)
    $

    #step([Kết luận])
    $
      P(B|A) = 140 / (binom(7, 3) dot binom(5, 2))
      = 140 / 350
      = 2 / 5
    $

    Vậy xác suất cần tìm là $2/5$.
  ],
)

// ═══════════════════════════════════════════════
// CẤU TRÚC CÁC DẠNG TRUY NGUỒN GỐC
// ═══════════════════════════════════════════════
= VI. Cấu Trúc Các Dạng Truy Nguồn Gốc Hay Ra Thi

#lythuyet[
  *Dạng 1. Cho sẵn toàn bộ số liệu, hỏi nguồn gốc của kết quả vừa quan sát được.*
  Mẫu hỏi quen thuộc: "Biết viên bi rút ra là Đỏ, nó thuộc Hộp nào?" hoặc "Biết sản phẩm bị lỗi, nó do dây chuyền nào sản xuất?"
  Công thức dùng ngay:
  $ P(H_i|M) = (P(H_i) dot P(M|H_i)) / (P(H_1) dot P(M|H_1) + ... + P(H_n) dot P(M|H_n)) $

  *Dạng 2. Cho xác suất hậu nghiệm, bắt tìm tham số $x$.*
  Đây là nhóm bài chính của file này. Quy trình là: lập nhánh nguồn $P(H_i)$, lập nhánh điều kiện $P(M|H_i)$, thay vào Bayes, rồi giải phương trình hoặc bất phương trình theo $x$.

  *Dạng 3. Không hỏi xác suất cụ thể, chỉ hỏi nguồn nào "có khả năng lớn hơn".*
  Khi đó không cần tính mẫu số $P(M)$. Chỉ cần so sánh các tích nhánh:
  $ P(H_i) dot P(M|H_i) $
  Nhánh nào lớn hơn thì xác suất hậu nghiệm lớn hơn.

  *Dạng 4. Có thêm lớp điều kiện tổ hợp.*
  Ví dụ: biết trong mẫu rút ra có đúng $4$ bi Đỏ và $3$ bi Xanh, hãy hỏi tiếp "trong đó có đúng $3$ bi từ rổ I hay không".
  Khi đó phải lọc bằng một biến cố trung gian $A$, rồi dùng:
  $ P(B|A) = P(A ∩ B) / P(A) $

  *Dạng 5. Đổi bối cảnh nhưng giữ nguyên khung Bayes.*
  Hộp bi, xúc xắc chọn hộp, dây chuyền sản xuất, xét nghiệm y khoa, nhóm học sinh, khối lớp, máy chủ, robot phân loại, ... đều quy về cùng một cây xác suất hai tầng:
  "Nguồn" -> "Kết quả quan sát".
]

#meo[
  *Bản đồ nhận diện rất nhanh:*
  - Thấy cụm "biết đã rút được Đỏ / Xanh / lỗi / dương tính" $=>$ đang ở tầng hậu nghiệm.
  - Thấy cụm "tìm $x$ nhỏ nhất, lớn nhất" $=>$ lập bất phương trình Bayes.
  - Thấy cụm "thuộc nguồn nào nhiều khả năng hơn" $=>$ chỉ so sánh tử số các nhánh.
  - Thấy cụm "biết trong mẫu có đúng ..." $=>$ thêm một lớp lọc tổ hợp trước khi truy nguồn.
]

// ═══════════════════════════════════════════════
// BÀI TẬP TƯ DUY LẠ - DỰ ĐOÁN ĐỀ THI
// ═══════════════════════════════════════════════
= VII. Bài Tập Dự Đoán Đề - Tư Duy Lạ Truy Nguồn Gốc

#meo[
  *Mẹo then chốt của phần này:* Nếu đề chỉ hỏi "nguồn nào khả năng lớn nhất", rất nhiều bài không cần viết công thức Bayes đầy đủ. Chỉ cần nhìn sơ đồ cây và so sánh tích trên những nhánh dẫn tới kết quả đang xét.
]

#tln(
  id: "BAYES-LA-01",
  [*(Ba hộp - nhìn cây ra đáp án)* Một vòng quay chọn Hộp I, Hộp II, Hộp III với xác suất lần lượt là $1/2$, $1/3$, $1/6$. Hộp I có tỉ lệ bi Đỏ là $1/5$, Hộp II là $1/2$, Hộp III là $5/6$. Lấy ngẫu nhiên một bi từ hộp được chọn và thấy bi Đỏ. Hỏi viên bi Đỏ này có khả năng lớn nhất đến từ hộp nào?],
  [Hộp II],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let root = box(fill: rgb("FFF9C4"), stroke: 1.3pt + rgb("FBC02D"), inset: 6pt, radius: 4pt)[*Chọn hộp*]
          content((0, 4), root, name: "goc")

          let h1 = box(fill: rgb("EBF5FB"), stroke: 1.2pt + rgb("1A5276"), inset: 5pt, radius: 4pt)[*Hộp I*]
          let h2 = box(fill: rgb("E8F8F5"), stroke: 1.2pt + rgb("117A65"), inset: 5pt, radius: 4pt)[*Hộp II*]
          let h3 = box(fill: rgb("FDEDEC"), stroke: 1.2pt + rgb("C0392B"), inset: 5pt, radius: 4pt)[*Hộp III*]

          content((-4.2, 2), h1, name: "h1")
          content((0, 2), h2, name: "h2")
          content((4.2, 2), h3, name: "h3")

          circle((-4.2, 0), radius: 0.45, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "d1")
          content("d1", text(fill: red, weight: "bold")[Đỏ])
          circle((0, 0), radius: 0.45, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "d2")
          content("d2", text(fill: red, weight: "bold")[Đỏ])
          circle((4.2, 0), radius: 0.45, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "d3")
          content("d3", text(fill: red, weight: "bold")[Đỏ])

          line("goc", "h1", mark: (end: ">"))
          content((-2.7, 3.2), box(fill: white, inset: 1pt)[$1 / 2$])
          line("goc", "h2", mark: (end: ">"))
          content((-0.2, 3.2), box(fill: white, inset: 1pt)[$1 / 3$])
          line("goc", "h3", mark: (end: ">"))
          content((2.5, 3.2), box(fill: white, inset: 1pt)[$1 / 6$])

          line("h1", "d1", mark: (end: ">"))
          content((-5.2, 1.05), box(fill: white, inset: 1pt)[$1 / 5$])
          line("h2", "d2", mark: (end: ">"))
          content((-0.8, 1.05), box(fill: white, inset: 1pt)[$1 / 2$])
          line("h3", "d3", mark: (end: ">"))
          content((3.4, 1.05), box(fill: white, inset: 1pt)[$5 / 6$])
        })
      ]
    ]

    #step([Chỉ cần so sánh các tích nhánh ra Đỏ])
    $ H_1: 1/2 dot 1/5 = 1/10 $
    $ H_2: 1/3 dot 1/2 = 1/6 $
    $ H_3: 1/6 dot 5/6 = 5/36 $

    Vì $1/6$ lớn nhất, nên viên bi Đỏ có khả năng lớn nhất đến từ *Hộp II*.
  ],
)

#tln(
  id: "BAYES-LA-02",
  [*(Dây chuyền ít sản lượng nhưng dễ bị nghi nhất)* Một nhà máy có ba dây chuyền $A$, $B$, $C$ lần lượt sản xuất $50\%$, $30\%$, $20\%$ tổng sản phẩm. Tỉ lệ lỗi của ba dây chuyền lần lượt là $2\%$, $3\%$, $6\%$. Chọn ngẫu nhiên một phế phẩm. Hỏi phế phẩm này có khả năng lớn nhất do dây chuyền nào tạo ra?],
  [Dây chuyền $C$],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let root = box(fill: rgb("E3F2FD"), stroke: 1.3pt + rgb("1976D2"), inset: 6pt, radius: 4pt)[*Nhà máy*]
          content((0, 4), root, name: "nha")

          let a = box(fill: rgb("E8F8F5"), stroke: 1.2pt + rgb("117A65"), inset: 5pt, radius: 4pt)[*$A$*]
          let b = box(fill: rgb("FEF9E7"), stroke: 1.2pt + rgb("F39C12"), inset: 5pt, radius: 4pt)[*$B$*]
          let c = box(fill: rgb("FDEDEC"), stroke: 1.2pt + rgb("C0392B"), inset: 5pt, radius: 4pt)[*$C$*]

          content((-4.2, 2), a, name: "a")
          content((0, 2), b, name: "b")
          content((4.2, 2), c, name: "c")

          circle((-4.2, 0), radius: 0.5, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "la")
          content("la", text(fill: red, weight: "bold")[Lỗi])
          circle((0, 0), radius: 0.5, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "lb")
          content("lb", text(fill: red, weight: "bold")[Lỗi])
          circle((4.2, 0), radius: 0.5, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "lc")
          content("lc", text(fill: red, weight: "bold")[Lỗi])

          line("nha", "a", mark: (end: ">"))
          content((-2.9, 3.2), box(fill: white, inset: 1pt)[$50\%$])
          line("nha", "b", mark: (end: ">"))
          content((-0.2, 3.2), box(fill: white, inset: 1pt)[$30\%$])
          line("nha", "c", mark: (end: ">"))
          content((2.7, 3.2), box(fill: white, inset: 1pt)[$20\%$])

          line("a", "la", mark: (end: ">"))
          content((-5.1, 1.05), box(fill: white, inset: 1pt)[$2\%$])
          line("b", "lb", mark: (end: ">"))
          content((-0.8, 1.05), box(fill: white, inset: 1pt)[$3\%$])
          line("c", "lc", mark: (end: ">"))
          content((3.4, 1.05), box(fill: white, inset: 1pt)[$6\%$])
        })
      ]
    ]

    #step([Nhìn cây rồi so sánh ba tích])
    $ A: 50\% dot 2\% = 1\% $
    $ B: 30\% dot 3\% = 0.9\% $
    $ C: 20\% dot 6\% = 1.2\% $

    Nhánh của $C$ lớn nhất, nên phế phẩm lấy ra có khả năng lớn nhất do *dây chuyền $C$* tạo ra.
  ],
)

#tln(
  id: "BAYES-LA-03",
  [*(Bài lạ cân bằng hậu nghiệm)* Có ba nhóm học sinh $A$, $B$, $C$ lần lượt chiếm $20\%$, $30\%$, $50\%$ tổng số học sinh. Xác suất một học sinh của từng nhóm được chọn vào đội tuyển lần lượt là $30\%$, $20\%$, $12\%$. Chọn ngẫu nhiên một học sinh đã vào đội tuyển. Hỏi học sinh đó có xu hướng nghiêng về nhóm nào nhất?],
  [Ba nhóm như nhau],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let root = box(
            fill: rgb("EAF2F8"),
            stroke: 1.3pt + rgb("2980B9"),
            inset: 6pt,
            radius: 4pt,
          )[*Toàn bộ học sinh*]
          content((0, 4), root, name: "all")

          let a = box(fill: rgb("EBF5FB"), stroke: 1.2pt + rgb("1A5276"), inset: 5pt, radius: 4pt)[*Nhóm A*]
          let b = box(fill: rgb("E8F8F5"), stroke: 1.2pt + rgb("117A65"), inset: 5pt, radius: 4pt)[*Nhóm B*]
          let c = box(fill: rgb("FEF9E7"), stroke: 1.2pt + rgb("F39C12"), inset: 5pt, radius: 4pt)[*Nhóm C*]

          content((-4.2, 2), a, name: "a")
          content((0, 2), b, name: "b")
          content((4.2, 2), c, name: "c")

          circle((-4.2, 0), radius: 0.55, fill: rgb("D5F5E3"), stroke: 1.2pt + rgb("117A65"), name: "da")
          content("da", text(fill: rgb("117A65"), weight: "bold")[Đội tuyển])
          circle((0, 0), radius: 0.55, fill: rgb("D5F5E3"), stroke: 1.2pt + rgb("117A65"), name: "db")
          content("db", text(fill: rgb("117A65"), weight: "bold")[Đội tuyển])
          circle((4.2, 0), radius: 0.55, fill: rgb("D5F5E3"), stroke: 1.2pt + rgb("117A65"), name: "dc")
          content("dc", text(fill: rgb("117A65"), weight: "bold")[Đội tuyển])

          line("all", "a", mark: (end: ">"))
          content((-2.8, 3.2), box(fill: white, inset: 1pt)[$20\%$])
          line("all", "b", mark: (end: ">"))
          content((-0.2, 3.2), box(fill: white, inset: 1pt)[$30\%$])
          line("all", "c", mark: (end: ">"))
          content((2.7, 3.2), box(fill: white, inset: 1pt)[$50\%$])

          line("a", "da", mark: (end: ">"))
          content((-5.15, 1.05), box(fill: white, inset: 1pt)[$30\%$])
          line("b", "db", mark: (end: ">"))
          content((-0.8, 1.05), box(fill: white, inset: 1pt)[$20\%$])
          line("c", "dc", mark: (end: ">"))
          content((3.4, 1.05), box(fill: white, inset: 1pt)[$12\%$])
        })
      ]
    ]

    #step([Nhìn cây là thấy ba nhánh bằng nhau])
    $ A: 20\% dot 30\% = 6\% $
    $ B: 30\% dot 20\% = 6\% $
    $ C: 50\% dot 12\% = 6\% $

    Ba tích bằng nhau nên xác suất hậu nghiệm của ba nhóm *bằng nhau*. Không có nhóm nào trội hơn.
  ],
)

#tln(
  id: "BAYES-LA-04",
  [*(Đảo trực giác)* Một cơ chế chọn Hộp I với xác suất $3/4$ và Hộp II với xác suất $1/4$. Hộp I có tỉ lệ bi Đỏ là $1/5$, Hộp II có tỉ lệ bi Đỏ là $5/6$. Lấy ngẫu nhiên một bi từ hộp được chọn và thấy nó màu Đỏ. Hỏi viên bi Đỏ này có khả năng lớn hơn thuộc Hộp nào?],
  [Hộp II],
  loigiai: [
    #ppgiai[
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let root = box(fill: rgb("FFF9C4"), stroke: 1.3pt + rgb("FBC02D"), inset: 6pt, radius: 4pt)[*Chọn hộp*]
          content((0, 4), root, name: "goc")

          let h1 = box(fill: rgb("EBF5FB"), stroke: 1.2pt + rgb("1A5276"), inset: 5pt, radius: 4pt)[*Hộp I*]
          let h2 = box(fill: rgb("FDEDEC"), stroke: 1.2pt + rgb("C0392B"), inset: 5pt, radius: 4pt)[*Hộp II*]

          content((-3.2, 2), h1, name: "h1")
          content((3.2, 2), h2, name: "h2")

          circle((-3.2, 0), radius: 0.48, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "d1")
          content("d1", text(fill: red, weight: "bold")[Đỏ])
          circle((3.2, 0), radius: 0.48, fill: rgb("FFEBEE"), stroke: 1.2pt + red, name: "d2")
          content("d2", text(fill: red, weight: "bold")[Đỏ])

          line("goc", "h1", mark: (end: ">"))
          content((-2.1, 3.2), box(fill: white, inset: 1pt)[$3 / 4$])
          line("goc", "h2", mark: (end: ">"))
          content((1.2, 3.2), box(fill: white, inset: 1pt)[$1 / 4$])

          line("h1", "d1", mark: (end: ">"))
          content((-4.0, 1.05), box(fill: white, inset: 1pt)[$1 / 5$])
          line("h2", "d2", mark: (end: ">"))
          content((2.4, 1.05), box(fill: white, inset: 1pt)[$5 / 6$])
        })
      ]
    ]

    #step([Nhìn tích nhánh để tránh nhầm trực giác])
    $ H_1: 3/4 dot 1/5 = 3/20 $
    $ H_2: 1/4 dot 5/6 = 5/24 $

    Vì $5/24 > 3/20$, nên dù Hộp II ít được chọn hơn, viên bi Đỏ quan sát được lại *có khả năng lớn hơn thuộc Hộp II*.
  ],
)
