#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & ĐỊNH DẠNG CHUNG
// ═══════════════════════════════════════════════

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
        
        let b1 = box(fill: rgb("fff9c4"), stroke: 1.5pt + rgb("fbc02d"), inset: 8pt, radius: 5pt)[*Lấy 1 bi từ Hộp III (5 bi)*]
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
    $ (3 / 5 dot x / (x + 4)) / (3 / 5 dot x / (x + 4) + 2 / 5 dot 5 / 8) >= 3 / 5 
    <=> ((3x) / (x + 4)) / ((3x) / (x + 4) + 5 / 4) >= 3 / 5 $
    
    Nhân cả tử và mẫu của vế trái cho $4(x + 4)$:
    $ (12x) / (12x + 5(x + 4)) >= 3 / 5 
    <=> (12x) / (17x + 20) >= 3 / 5 $
    
    Do $x >= 0$ nên mẫu số luôn dương, nhân chéo ta có:
    $ 60x >= 51x + 60 <=> 9x >= 60 <=> x >= 20 / 3 approx 6","67 $
    
    Do $x in NN^*$, giá trị nguyên nhỏ nhất thỏa mãn là $x = 7$.
  ]
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

          line("root", "h1", mark: (end: ">")); content((-1.6, 3.2), box(fill: white, inset: 1pt)[$2 / 5$])
          line("root", "h2", mark: (end: ">")); content((1.6, 3.2), box(fill: white, inset: 1pt)[$3 / 5$])
          line("h1", "c1", mark: (end: ">")); content((-4.8, 1.2), box(fill: white, inset: 1pt)[$1 / 2$])
          line("h1", "c2", mark: (end: ">")); content((-2.2, 1.2), box(fill: white, inset: 1pt)[$1 / 2$])
          line("h2", "c3", mark: (end: ">")); content((2.2, 1.2), box(fill: white, inset: 1pt)[$2 / (x + 2)$])
          line("h2", "c4", mark: (end: ">")); content((4.8, 1.2), box(fill: white, inset: 1pt)[$x / (x + 2)$])
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
  ]
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

          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black)); content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 4 bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black)); content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 1 bi*])
          
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
  ]
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

          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black)); content((-2.5, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy $x$ bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black)); content((2.5, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy $(5-x)$ bi*])
          
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
  ]
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
          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black)); content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 3 bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black)); content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 2 bi*])
          
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
  ]
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
          line((-3, 2), (-0.5, 0), mark: (end: ">", fill: black)); content((-2.2, 0.7), angle: -33deg, box(fill: white, inset: 2pt)[*Lấy 2 bi*])
          line((3, 2), (0.5, 0), mark: (end: ">", fill: black)); content((2.2, 0.7), angle: 33deg, box(fill: white, inset: 2pt)[*Lấy 3 bi*])
          
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
  ]
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
    $ <=> 2/5 dot 3/8 > 3/5 dot 4/(x+4) 
      <=> 6/40 > 12/(5(x+4)) 
      <=> 3/20 > 12/(5(x+4)) $
    
    Rút gọn và nhân chéo (do $x>0$):
    $ 15(x+4) > 240 <=> x+4 > 16 <=> x > 12 $
    
    Vậy giá trị nguyên nhỏ nhất của $x$ là $13$.
  ]
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
    $ P(D) = P(B)dot P(D|B) + P(overline(B))dot P(D|overline(B)) 
           = 0","005 dot 0","99 + 0","995 dot 0","02 = 0","02485 $
           
    #step([Tính xác suất hậu nghiệm])
    Ta cần tính $P(overline(B)|D)$ (xác suất không có bệnh khi xét nghiệm dương tính):
    $ P(overline(B)|D) = (P(overline(B)) dot P(D|overline(B))) / P(D) 
                     = (0","995 dot 0","02) / 0","02485 approx 0","8008 $
    
    Kết quả khoảng $80,08\%$ (gần $80,1\%$). 
    #nhanxet[Bài toán minh họa nghịch lý Bayes: Dù xét nghiệm có độ chính xác rất cao ($98-99\%$), nhưng do căn bệnh quá hiếm gặp ($0,5\%$), phần lớn các kết quả dương tính lại là "dương tính giả".]
  ]
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
  ]
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
    $ x / (x + 2(100-x)) = 1/4 
    <=> x / (x + 200 - 2x) = 1/4 
    <=> x / (200 - x) = 1/4 $
    
    Nhân chéo:
    $ 4x = 200 - x <=> 5x = 200 <=> x = 40 $
    
    Vậy dây chuyền A sản xuất $40\%$ tổng sản phẩm.
  ]
)

#tln(
  id: "BAYES-NGUOC-03",
  [*(Toán ngược bất phương trình Y khoa)* Một căn bệnh có tỉ lệ mắc trong dân số là $5\%$. Một loại xét nghiệm chẩn đoán bệnh này có độ nhạy (xác suất kết quả dương tính nếu có bệnh) là $95\%$. Gọi $x\%$ là độ đặc hiệu của xét nghiệm (xác suất kết quả âm tính nếu không có bệnh). Tìm giá trị nguyên nhỏ nhất của $x$ để: Nếu một người xét nghiệm ra kết quả dương tính, xác suất người đó thực sự mắc bệnh lớn hơn hoặc bằng $50\%$?
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Dân số
      content((0, 5), box(fill: rgb("E3F2FD"), stroke: 1.5pt + rgb("1976D2"), inset: 8pt, radius: 5pt)[*DÂN SỐ CỘNG ĐỒNG*])

      // Các nhánh
      content((-3.5, 2.5), box(fill: rgb("FFEBEE"), stroke: 1.5pt + red, inset: 8pt, radius: 5pt)[*Mắc Bệnh ($5\%$)*], name: "benh")
      content((3.5, 2.5), box(fill: rgb("E8F8F5"), stroke: 1.5pt + rgb("117A65"), inset: 8pt, radius: 5pt)[*Không Bệnh ($95\%$)*], name: "kbenh")

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
  ]
)