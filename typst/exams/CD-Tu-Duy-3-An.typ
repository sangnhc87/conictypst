#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

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
#show math.equation: set text(fill: rgb("000000"))

#let brand = rgb("1A5276")
#let wine = rgb("900C3F")
#let mint = rgb("117A65")

// ══════════════════════════════════════════════════════════════
//  TIÊU ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (
      left: 5pt + rgb("1A5276"),
      top: 0.5pt + rgb("d0e4f0"),
      right: 0.5pt + rgb("d0e4f0"),
      bottom: 0.5pt + rgb("d0e4f0"),
    ),
    inset: (x: 16pt, y: 14pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề: Giải Toán Tư Duy 3 Ẩn — Lập Hệ Phương Trình
    ]
    #v(0.5em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Phân rã tập hợp · Đặt ẩn phụ · Phương trình nghiệm nguyên —
      Tối ưu hóa bài toán quyên góp
    ]
  ]
]

// ══════════════════════════════════════════════════════════════
= I. Lý Thuyết Trọng Tâm
// ══════════════════════════════════════════════════════════════

#lythuyet(
  title: [Kỹ Thuật Phân Rã Tập Hợp và Đặt Ẩn "Mỏ Neo"],
  [
    Khi đứng trước một bài toán có nhiều nhóm đối tượng (ví dụ: các tổ hợp của 3 mệnh giá tiền), nếu ta gọi tất cả các nhóm là các ẩn số độc lập ($x_1, x_2, dots, x_6$) thì hệ phương trình sẽ rất lớn và dễ gây rối. Thay vào đó, ta sử dụng *Tư duy 3 ẩn*:
    
    *1. Liệt kê toàn bộ các nhóm rời nhau (Disjoint sets)*
    Xác định tất cả các trường hợp có thể xảy ra. Với 3 loại mệnh giá và mỗi người góp "nhiều nhất 2 tờ khác nhau", ta sẽ có 6 nhóm:
    - 3 nhóm "chỉ góp 1 tờ"
    - 3 nhóm "góp 2 tờ khác nhau"
    
    *2. Chọn "Mỏ neo" để tối ưu số ẩn*
    Chọn nhóm xuất hiện nhiều nhất trong các mối quan hệ (dữ kiện đề bài) để làm ẩn chính (mỏ neo, ví dụ $x$).
    Sau đó, sử dụng ngay các dữ kiện có sẵn để biểu diễn các nhóm khác theo $x$. Nhờ vậy, số lượng ẩn số được giảm thiểu ngay từ bước đặt điều kiện.
    
    *3. Gộp nhóm thông minh*
    Nếu đề bài chỉ cung cấp thông tin về tổng của 2-3 nhóm nào đó mà không tách rời, ta có thể "gộp" chúng lại thành một biến hoặc một biểu thức chung để tránh phát sinh ẩn thừa.
  ]
)

// ══════════════════════════════════════════════════════════════
= II. Phân Tích Bài Toán Thực Tế
// ══════════════════════════════════════════════════════════════

#ds(
  [
    Trong đợt quyên góp ủng hộ đồng bào bị lũ lụt năm 2020, có 25 học sinh lớp 12A đã tham gia ủng hộ, mỗi học sinh ủng hộ nhiều nhất 2 tờ tiền khác nhau trong ba loại tờ tiền mệnh giá 5.000 đồng, 10.000 đồng và 20.000 đồng. Biết rằng số học sinh đã tham gia ủng hộ thỏa đồng thời ba kết quả sau:
    
    - Số học sinh chỉ ủng hộ một tờ 5.000 đồng bằng tổng số học sinh chỉ ủng hộ một tờ 10.000 đồng và số học sinh chỉ ủng hộ một tờ 20.000 đồng.
    - Trong số học sinh *không* ủng hộ tờ 5.000 đồng thì số học sinh có ủng hộ tờ 10.000 đồng nhiều gấp hai lần số học sinh có ủng hộ tờ 20.000 đồng.
    - Số học sinh chỉ ủng hộ một tờ 5.000 đồng nhiều hơn số học sinh ủng hộ tờ 5.000 đồng và một tờ khác là 1 học sinh.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 2 học sinh ủng hộ một tờ 10.000 đồng và một tờ 20.000 đồng.]),
    True([Có 8 học sinh chỉ ủng hộ một tờ 5000 đồng.]),
    False([Nếu gọi số học sinh ủng hộ một tờ 5.000 đồng và một tờ 10.000 đồng là $a$, số học sinh ủng hộ một tờ 20.000 đồng và một tờ 5.000 đồng là $c$ thì $a + c = 9$.]),
    True([Có 6 học sinh lớp 12A chỉ ủng hộ một tờ 10.000 đồng.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân tích chia nhóm và đặt ẩn:*
      
      Do mỗi người ủng hộ "nhiều nhất 2 tờ khác nhau" từ 3 loại (5k, 10k, 20k), ta có đúng 6 nhóm học sinh riêng biệt. Để dễ hiểu, ta phân tích cách biểu diễn từng nhóm như sau:
      
      - Đặt $x$ là số học sinh *chỉ có 5k*. Nhóm này là "mỏ neo" vì được nhắc đến trong 2 dữ kiện.
      - *Dữ kiện 1:* "(Chỉ 5k) = (Chỉ 10k) + (Chỉ 20k)". Nếu ta đặt nhóm (Chỉ 20k) là $y$, thì nhóm (Chỉ 10k) bắt buộc phải là $x - y$. (Giúp giảm 1 ẩn).
      - *Dữ kiện 3:* "(Chỉ 5k) - 1 = (5k + một tờ khác)". Tập (5k + một tờ khác) chính là gộp của 2 nhóm: (5k + 10k) và (5k + 20k). Vì đề bài không tách rời 2 nhóm này, ta gộp chung lại thành biểu thức $x - 1$.
      - Còn đúng một nhóm cuối cùng: (10k + 20k). Ta đặt ẩn $z$ cho nhóm này.

      Dưới đây là Bảng minh họa trực quan cách phân bổ 6 nhóm học sinh này theo 3 ẩn $x, y, z$:
      
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, 60pt, 60pt, 60pt, auto, auto),
          align: center + horizon,
          fill: (_, row) => if row == 0 { luma(240) } else { white },
          stroke: 0.5pt + gray,
          
          [*Tên Nhóm*], [*5k*], [*10k*], [*20k*], [*Biểu diễn*], [*Giải thích chi tiết*],
          [Nhóm 1], [#sym.checkmark], [], [], [*$x$*], [Chọn làm ẩn chính (Mỏ neo)],
          [Nhóm 2], [], [#sym.checkmark], [], [$x - y$], table.cell(rowspan: 2)[Từ DK1: (Nhóm 2 + Nhóm 3) = Nhóm 1. \ Đặt Nhóm 3 là $y$ thì Nhóm 2 là $x - y$],
          [Nhóm 3], [], [], [#sym.checkmark], [*$y$*],
          [Nhóm 4], [#sym.checkmark], [#sym.checkmark], [], table.cell(rowspan: 2)[$x - 1$], table.cell(rowspan: 2)[Gộp từ DK3: (Nhóm 4 + Nhóm 5) \ = Nhóm 1 trừ đi 1.],
          [Nhóm 5], [#sym.checkmark], [], [#sym.checkmark],
          [Nhóm 6], [], [#sym.checkmark], [#sym.checkmark], [*$z$*], [Nhóm độc lập còn lại, đặt ẩn mới.]
        )
      ]
      
      Từ bảng trên, ta chuyển sang sơ đồ rẽ nhánh để kiểm soát toàn bộ 25 học sinh:
      
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          
          // Nút gốc
          content((0, 0), box(stroke: 1pt + rgb("1A5276"), fill: rgb("F4F9F9"), inset: 8pt, radius: 4pt)[*TỔNG: 25 HỌC SINH*], name: "root")
          
          // Nhánh Level 1
          content((-4, -2.5), box(stroke: 0.5pt, fill: rgb("E8F8F5"), inset: 6pt)[*Tập có giữ tờ 5.000đ*], name: "has5")
          content((4, -2.5), box(stroke: 0.5pt, fill: rgb("FDEDEC"), inset: 6pt)[*Tập KHÔNG có tờ 5.000đ*], name: "no5")
          
          line("root.south", "has5.north", mark: (end: ">"))
          line("root.south", "no5.north", mark: (end: ">"))
          
          // Nhánh Level 2 - Tập CÓ 5k
          content((-6, -5), box(stroke: 0.5pt, inset: 6pt, align(center)[Chỉ 5.000đ \ $x$]), name: "only5")
          content((-2, -5), box(stroke: 0.5pt, inset: 6pt, align(center)[5.000đ + 1 tờ khác \ (Nhóm 4 + Nhóm 5) \ $x - 1$]), name: "5and1")
          
          line("has5.south", "only5.north", mark: (end: ">"))
          line("has5.south", "5and1.north", mark: (end: ">"))
          
          // Nhánh Level 2 - Tập KHÔNG CÓ 5k
          content((1.5, -5), box(stroke: 0.5pt, inset: 6pt, align(center)[Chỉ 10.000đ \ $x - y$]), name: "only10")
          content((4.5, -5), box(stroke: 0.5pt, inset: 6pt, align(center)[Chỉ 20.000đ \ $y$]), name: "only20")
          content((7.5, -5), box(stroke: 0.5pt, inset: 6pt, align(center)[10k + 20k \ $z$]), name: "10and20")
          
          line("no5.south", "only10.north", mark: (end: ">"))
          line("no5.south", "only20.north", mark: (end: ">"))
          line("no5.south", "10and20.north", mark: (end: ">"))
        })
      ]
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện còn lại:*
      Dữ kiện 1 và 3 đã được dùng để rút gọn số ẩn trên bảng. Ta dùng Dữ kiện 2 để lập phương trình (1):
      _"Trong số học sinh không ủng hộ tờ 5.000 đồng..."_ 
      -> Nhìn vào bảng, nhóm "KHÔNG có 5k" bao gồm đúng 3 nhóm: Nhóm 2 (Chỉ 10k), Nhóm 3 (Chỉ 20k), và Nhóm 6 (10k + 20k).
      - "... thì số học sinh *CÓ* ủng hộ tờ 10.000 đồng": Ta gộp tất cả những người giữ tờ 10k trong tập này, gồm Nhóm 2 và Nhóm 6. Tổng số là: $(x - y) + z$.
      - "... nhiều gấp hai lần số học sinh *CÓ* ủng hộ tờ 20.000 đồng": Ta gộp những người giữ tờ 20k, gồm Nhóm 3 và Nhóm 6. Tổng số là: $y + z$.
      
      Từ chữ "gấp hai lần", ta có phương trình (1):
      $ (x - y) + z = 2(y + z) <=> x - 3y - z = 0 quad (1) $

      Kết hợp giả thiết tổng số học sinh lớp 12A là 25, ta cộng tất cả 5 nhóm riêng lẻ ở tầng cuối của sơ đồ:
      $ x + (x - 1) + (x - y) + y + z = 25 <=> 3x + z = 26 quad (2) $
    ]
    #step[
      *3. Giải hệ phương trình:*
      
      Từ $(1)$ suy ra $z = x - 3y$. Thay vào $(2)$, ta được:
      $ 3x + (x - 3y) = 26 <=> 4x - 3y = 26 <=> x = (3y + 26) / 4 $

      Do $x, y$ là số tự nhiên (nguyên dương hoặc bằng 0), ta lập bảng biện luận.
      Vì $3y + 26$ phải chia hết cho $4$ (mà $26$ chia $4$ dư $2$), nên $3y$ cũng phải chia $4$ dư $2$. Điều này dẫn đến $y$ phải là số chẵn. Ta thử các giá trị chẵn của $y$:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(3y + 26, 4))$*], [*$z = 26 - 3x$*], [*Kết luận*],
          [$0$], [$display(frac(26, 4))$ (Loại)], [-], [Loại],
          [$2$], [*$8$*], [$26 - 24 = 2$], [*Nhận*],
          [$4$], [$display(frac(38, 4))$ (Loại)], [-], [Loại],
          [$6$], [$11$], [$26 - 33 = -7$], [Loại (vì $z < 0$)]
        )
      ]

      Vậy bài toán có nghiệm duy nhất:
      $ x = 8, quad y = 2, quad z = 2 $
    ]
    #step[
      *4. Kết luận:*
      Ta tính được số lượng học sinh của từng nhóm:
      - Chỉ ủng hộ 5.000đ: $x = 8$
      - Chỉ ủng hộ 10.000đ: $x - y = 8 - 2 = 6$
      - Chỉ ủng hộ 20.000đ: $y = 2$
      - Ủng hộ cả 10.000đ và 20.000đ: $z = 2$
      - Ủng hộ 5.000đ kèm 1 tờ khác: $x - 1 = 7$

      *Kiểm tra các phát biểu:*
      - *a) ĐÚNG.* Số học sinh ủng hộ tờ 10.000đ và 20.000đ chính là $z = 2$.
      - *b) ĐÚNG.* Số học sinh chỉ ủng hộ 5.000đ chính là $x = 8$.
      - *c) SAI.* Theo đề bài $a$ và $c$ là tổng nhóm "Ủng hộ 5.000đ kèm 1 tờ khác". Theo tính toán $a + c = x - 1 = 7$ (chứ không phải 9).
      - *d) ĐÚNG.* Số học sinh chỉ ủng hộ 10.000đ là $x - y = 6$.
    ]
    #reset-step()
  ]
)

// ══════════════════════════════════════════════════════════════
= III. Các Bài Toán Tương Tự Để Rèn Luyện
// ══════════════════════════════════════════════════════════════

#ds(
  [
    Trong đợt mua sách tham khảo đầu năm, có 28 học sinh lớp 12B đăng ký mua, mỗi học sinh mua nhiều nhất 2 môn khác nhau trong 3 môn: Toán, Lý và Hóa. Biết rằng số học sinh đăng ký thỏa mãn đồng thời các điều kiện sau:
    
    - Số học sinh chỉ mua sách Toán bằng tổng số học sinh chỉ mua sách Lý và số học sinh chỉ mua sách Hóa cộng thêm 1 em.
    - Trong số các học sinh *không* mua sách Toán, số học sinh có mua sách Lý nhiều gấp 2 lần số học sinh có mua sách Hóa.
    - Số học sinh mua sách Toán và một cuốn khác ít hơn số học sinh chỉ mua sách Toán là 4 em.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 3 học sinh mua cả sách Lý và Hóa.]),
    True([Có 10 học sinh chỉ mua sách Toán.]),
    True([Có 7 học sinh chỉ mua sách Lý.]),
    False([Tổng số học sinh mua đúng 1 cuốn sách là 20 em.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân rã và Đặt ẩn:*
      - Đặt $x$ là số học sinh *chỉ mua sách Toán*.
      - Theo Dữ kiện 1: (Chỉ Toán) = (Chỉ Lý) + (Chỉ Hóa) + 1. Đặt số học sinh *chỉ mua Hóa* là $y$. Khi đó số học sinh *chỉ mua Lý* là $x - y - 1$.
      - Theo Dữ kiện 3: (Toán + 1 môn khác) = (Chỉ Toán) - 4 = $x - 4$.
      - Đặt $z$ là số học sinh mua *Lý và Hóa*.
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện 2:*
      Dữ kiện 2 xét nhóm học sinh *KHÔNG* mua Toán, gồm 3 tập con rời nhau: (Chỉ Lý), (Chỉ Hóa) và (Lý + Hóa).
      - Số người *CÓ* mua sách Lý (nghĩa là có dính đến Lý): (Chỉ Lý) cộng với (Lý + Hóa) $= (x - y - 1) + z$.
      - Số người *CÓ* mua sách Hóa: (Chỉ Hóa) cộng với (Lý + Hóa) $= y + z$.
      
      Theo đề: "số học sinh có mua Lý nhiều gấp 2 lần số học sinh có mua Hóa":
      $ (x - y - 1) + z = 2(y + z) <=> x - 3y - z = 1 quad (1) $
      
      Phương trình tổng thể 28 học sinh (cộng toàn bộ 5 biến):
      $ x + (x - y - 1) + y + (x - 4) + z = 28 <=> 3x + z = 33 quad (2) $
    ]
    #step[
      *3. Giải hệ:*
      Từ $(1)$ rút $z = x - 3y - 1$. Thay vào $(2)$:
      $ 3x + (x - 3y - 1) = 33 <=> 4x - 3y = 34 <=> x = (3y + 34)/4 $
      
      Lập bảng biện luận nghiệm nguyên $x, y >= 0$. 
      Vì $3y + 34$ phải chia hết cho $4$ (mà $34$ chia $4$ dư $2$), nên $3y$ cũng phải chia $4$ dư $2$. Do đó $y$ phải là số chẵn:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(3y + 34, 4))$*], [*$z = x - 3y - 1$*], [*Kết luận*],
          [$0$], [$display(frac(34, 4))$ (Loại)], [-], [Loại],
          [$2$], [*$10$*], [$10 - 6 - 1 = 3$], [*Nhận*],
          [$4$], [$display(frac(46, 4))$ (Loại)], [-], [Loại],
          [$6$], [$13$], [$13 - 18 - 1 = -6$], [Loại (vì $z < 0$)]
        )
      ]
      Vậy nghiệm duy nhất là $x = 10, y = 2, z = 3$.
    ]
    #step[
      *4. Kết luận:*
      - Chỉ Toán: $10$
      - Chỉ Lý: $x - y - 1 = 7$
      - Chỉ Hóa: $2$
      - Toán + môn khác: $6$
      - Lý + Hóa: $3$
      
      *Đối chiếu đáp án:*
      - *a) ĐÚNG.* Lý + Hóa là $z=3$.
      - *b) ĐÚNG.* Chỉ Toán là $x=10$.
      - *c) ĐÚNG.* Chỉ Lý là $7$.
      - *d) SAI.* Mua đúng 1 cuốn là (Chỉ T) + (Chỉ L) + (Chỉ H) = $10 + 7 + 2 = 19$ (không phải 20).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Khảo sát 33 sinh viên về việc tham gia 3 câu lạc bộ (CLB): Thể thao, Kỹ năng và Nghệ thuật. Mỗi sinh viên tham gia nhiều nhất 2 CLB khác nhau. Kết quả thu được như sau:
    
    - Số sinh viên chỉ tham gia Thể thao bằng hai lần số sinh viên chỉ tham gia Kỹ năng cộng với số sinh viên chỉ tham gia Nghệ thuật.
    - Trong số các sinh viên *không* tham gia Thể thao, 8 lần số sinh viên có tham gia Nghệ thuật bằng 11 lần số sinh viên có tham gia Kỹ năng.
    - Số sinh viên tham gia Thể thao và một CLB khác ít hơn số sinh viên chỉ tham gia Thể thao là 5 em.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 12 sinh viên chỉ tham gia CLB Thể thao.]),
    True([Có 5 sinh viên tham gia cả CLB Nghệ thuật và CLB Kỹ năng.]),
    False([Số sinh viên chỉ tham gia CLB Nghệ thuật là 8 em.]),
    False([Có tổng cộng 12 sinh viên không tham gia CLB Thể thao.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân rã và Đặt ẩn:*
      - Đặt $x$ là số sinh viên *chỉ tham gia Thể thao*.
      - Đặt $y$ là số sinh viên *chỉ tham gia Kỹ năng*.
      - Từ DK 1: (Chỉ Thể thao) = 2 $times$ (Chỉ Kỹ năng) + (Chỉ Nghệ thuật). 
        $=> x = 2y + text("Chỉ Nghệ thuật") => text("Chỉ Nghệ thuật") = x - 2y$.
      - Từ DK 3: (Thể thao + CLB khác) = (Chỉ Thể thao) - 5 = $x - 5$.
      - Đặt $z$ là số sinh viên tham gia *Nghệ thuật và Kỹ năng*.
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện 2:*
      Dữ kiện 2 chỉ xét nhóm *KHÔNG* tham gia Thể thao, gồm 3 tập con rời nhau: (Chỉ Kỹ năng), (Chỉ Nghệ thuật) và (Nghệ thuật + Kỹ năng).
      - Tổng số người *CÓ* tham gia Nghệ thuật trong nhóm này là: (Chỉ Nghệ thuật) + (Nghệ thuật + Kỹ năng) $= (x - 2y) + z$.
      - Tổng số người *CÓ* tham gia Kỹ năng trong nhóm này là: (Chỉ Kỹ năng) + (Nghệ thuật + Kỹ năng) $= y + z$.
      
      Theo đề: "8 lần số sinh viên có tham gia Nghệ thuật bằng 11 lần số sinh viên có tham gia Kỹ năng":
      $ 8((x - 2y) + z) = 11(y + z) <=> 8x - 27y - 3z = 0 quad (1) $
      
      Phương trình tổng số 33 sinh viên (cộng toàn bộ 5 biến):
      $ x + (x - 2y) + y + (x - 5) + z = 33 <=> 3x - y + z = 38 quad (2) $
    ]
    #step[
      *3. Giải hệ:*
      Từ $(2)$ rút $z = 38 + y - 3x$. Thay vào $(1)$:
      $ 8x - 27y - 3(38 + y - 3x) = 0 <=> 17x - 30y = 114 <=> x = (30y + 114)/17 $
      
      Lập bảng biện luận tìm nghiệm nguyên $x, y >= 0$:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(30y + 114, 17))$*], [*$z = 38 + y - 3x$*], [*Kết luận*],
          [$0$], [$display(frac(114, 17))$ (Loại)], [-], [Loại],
          [$1$], [$display(frac(144, 17))$ (Loại)], [-], [Loại],
          [$2$], [$display(frac(174, 17))$ (Loại)], [-], [Loại],
          [$3$], [*$12$*], [$38 + 3 - 36 = 5$], [*Nhận*],
          [$...$], [$...$], [$...$], [$...$],
          [$20$], [$42$], [$38 + 20 - 126 = -68$], [Loại (vì $z < 0$)]
        )
      ]
      Vậy nghiệm duy nhất là $x = 12, y = 3, z = 5$.
    ]
    #step[
      *4. Kết luận:*
      - Chỉ Thể thao: $12$
      - Chỉ Kỹ năng: $3$
      - Chỉ Nghệ thuật: $x - 2y = 12 - 6 = 6$
      - Nghệ thuật + Kỹ năng ($z$): $5$
      - Nhóm (Thể thao + khác): $x - 5 = 7$
      
      *Đối chiếu đáp án:*
      - *a) ĐÚNG.* Chỉ Thể thao là $x = 12$.
      - *b) ĐÚNG.* Nghệ thuật + Kỹ năng là $z = 5$.
      - *c) SAI.* Chỉ Nghệ thuật là $6$ (không phải 8).
      - *d) SAI.* Số sinh viên không tham gia Thể thao là: (Chỉ Kỹ năng) + (Chỉ Nghệ thuật) + (Nghệ thuật + Kỹ năng) = $3 + 6 + 5 = 14$ (không phải 12).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Khảo sát 31 học sinh về việc chọn môn tự chọn (Công nghệ, Tin học, Nghề). Mỗi học sinh chọn nhiều nhất 2 môn khác nhau. Kết quả cho thấy:
    
    - Số học sinh chỉ chọn Công nghệ bằng tổng số học sinh chỉ chọn Tin học và số học sinh chỉ chọn Nghề cộng thêm 1 em.
    - Trong số các học sinh *không* chọn Công nghệ, 4 lần số học sinh có chọn Tin học bằng 7 lần số học sinh có chọn Nghề.
    - Số học sinh chọn Công nghệ và một môn khác ít hơn số học sinh chỉ chọn Công nghệ là 7 em.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 6 học sinh chọn cả Tin học và Nghề.]),
    True([Có 11 học sinh chỉ chọn Công nghệ.]),
    False([Có tổng cộng 13 học sinh không chọn Công nghệ.]),
    False([Số học sinh chỉ chọn Nghề nhiều hơn số học sinh chỉ chọn Tin học.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân rã và Đặt ẩn:*
      - Đặt $x$ là số học sinh *chỉ chọn Công nghệ*.
      - Đặt $y$ là số học sinh *chỉ chọn Nghề*.
      - Theo Dữ kiện 1: (Chỉ Công nghệ) = (Chỉ Tin) + (Chỉ Nghề) + 1 
        $=> x = text("Chỉ Tin") + y + 1 => text("Chỉ Tin") = x - y - 1$.
      - Theo Dữ kiện 3: (Công nghệ + 1 môn khác) = (Chỉ Công nghệ) - 7 = $x - 7$.
      - Đặt $z$ là số học sinh chọn *Tin và Nghề*.
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện 2:*
      Nhóm *KHÔNG* chọn Công nghệ gồm 3 tập con rời nhau: (Chỉ Tin), (Chỉ Nghề) và (Tin + Nghề).
      - Tổng số người *CÓ* chọn Tin học là: (Chỉ Tin) + (Tin + Nghề) $= (x - y - 1) + z$.
      - Tổng số người *CÓ* chọn Nghề là: (Chỉ Nghề) + (Tin + Nghề) $= y + z$.
      
      Dữ kiện 2: "4 lần số học sinh có chọn Tin bằng 7 lần số học sinh có chọn Nghề":
      $ 4((x - y - 1) + z) = 7(y + z) <=> 4x - 4y - 4 + 4z = 7y + 7z <=> 4x - 11y - 3z = 4 quad (1) $
      
      Phương trình tổng số 31 học sinh (cộng toàn bộ 5 biến):
      $ x + (x - y - 1) + y + (x - 7) + z = 31 <=> 3x + z = 39 quad (2) $
    ]
    #step[
      *3. Giải hệ:*
      Từ $(2)$ rút $z = 39 - 3x$. Thay vào $(1)$:
      $ 4x - 11y - 3(39 - 3x) = 4 <=> 4x - 11y - 117 + 9x = 4 <=> 13x - 11y = 121 <=> x = display(frac(11y + 121, 13)) $
      
      Lập bảng biện luận tìm nghiệm nguyên $x, y >= 0$:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(11y + 121, 13))$*], [*$z = 39 - 3x$*], [*Kết luận*],
          [$0$], [$display(frac(121, 13))$ (Loại)], [-], [Loại],
          [$1$], [$display(frac(132, 13))$ (Loại)], [-], [Loại],
          [$2$], [*$11$*], [$39 - 33 = 6$], [*Nhận*],
          [$...$], [$...$], [$...$], [$...$],
          [$15$], [$22$], [$39 - 66 = -27$], [Loại (vì $z < 0$)]
        )
      ]
      Vậy nghiệm duy nhất là $x = 11, y = 2, z = 6$.
    ]
    #step[
      *4. Kết luận:*
      - Chỉ Công nghệ: $11$
      - Chỉ Nghề: $2$
      - Chỉ Tin học: $x - y - 1 = 8$
      - Tin + Nghề ($z$): $6$
      - Nhóm (Công nghệ + khác): $x - 7 = 4$
      
      *Đối chiếu đáp án:*
      - *a) ĐÚNG.* Tin + Nghề là $z = 6$.
      - *b) ĐÚNG.* Chỉ Công nghệ là $x = 11$.
      - *c) SAI.* Số học sinh không chọn Công nghệ là (Chỉ Tin) + (Chỉ Nghề) + (Tin + Nghề) = $8 + 2 + 6 = 16$ (chứ không phải 13).
      - *d) SAI.* Chỉ Nghề ($2$) ít hơn Chỉ Tin ($8$).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Một ngân hàng khảo sát 36 khách hàng về việc sử dụng 3 dịch vụ: Thẻ tín dụng, Khoản vay và Bảo hiểm. Mỗi khách hàng dùng nhiều nhất 2 dịch vụ khác nhau.
    
    - Số người chỉ dùng Thẻ tín dụng bằng tổng số người chỉ dùng Khoản vay và số người chỉ dùng Bảo hiểm cộng thêm 2 người.
    - Trong số những người *không* dùng Thẻ tín dụng, 8 lần số người có dùng Khoản vay bằng 11 lần số người có dùng Bảo hiểm.
    - Số người dùng Thẻ tín dụng và một dịch vụ khác ít hơn số người chỉ dùng Thẻ tín dụng là 5 người.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 13 người chỉ dùng Thẻ tín dụng.]),
    True([Có 7 người chỉ dùng dịch vụ Khoản vay.]),
    False([Có 8 người dùng cả dịch vụ Khoản vay và Bảo hiểm.]),
    False([Tổng số khách hàng chỉ dùng đúng 1 dịch vụ là 20 người.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân rã và Đặt ẩn:*
      - Đặt $x$ là số người *chỉ dùng Thẻ tín dụng*.
      - Đặt $y$ là số người *chỉ dùng Bảo hiểm*.
      - Theo Dữ kiện 1: (Chỉ Thẻ) = (Chỉ Vay) + (Chỉ BH) + 2
        $=> x = text("Chỉ Vay") + y + 2 => text("Chỉ Vay") = x - y - 2$.
      - Theo Dữ kiện 3: (Thẻ + 1 dịch vụ khác) = (Chỉ Thẻ) - 5 = $x - 5$.
      - Đặt $z$ là số người dùng *Khoản vay và Bảo hiểm*.
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện 2:*
      Nhóm *KHÔNG* dùng Thẻ tín dụng gồm 3 tập con rời nhau: (Chỉ Vay), (Chỉ BH) và (Vay + BH).
      - Tổng số người *CÓ* dùng Khoản vay là: (Chỉ Vay) + (Vay + BH) $= (x - y - 2) + z$.
      - Tổng số người *CÓ* dùng Bảo hiểm là: (Chỉ BH) + (Vay + BH) $= y + z$.
      
      Dữ kiện 2: "8 lần số người có dùng Khoản vay bằng 11 lần số người có dùng Bảo hiểm":
      $ 8((x - y - 2) + z) = 11(y + z) <=> 8x - 8y - 16 + 8z = 11y + 11z <=> 8x - 19y - 3z = 16 quad (1) $
      
      Phương trình tổng số 36 khách hàng:
      $ x + (x - y - 2) + y + (x - 5) + z = 36 <=> 3x + z = 43 quad (2) $
    ]
    #step[
      *3. Giải hệ:*
      Từ $(2)$ rút $z = 43 - 3x$. Thay vào $(1)$:
      $ 8x - 19y - 3(43 - 3x) = 16 <=> 8x - 19y - 129 + 9x = 16 <=> 17x - 19y = 145 <=> x = display(frac(19y + 145, 17)) $
      
      Lập bảng biện luận tìm nghiệm nguyên $x, y >= 0$:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(19y + 145, 17))$*], [*$z = 43 - 3x$*], [*Kết luận*],
          [$0, 1, 2, 3$], [Không nguyên (Loại)], [-], [Loại],
          [$4$], [*$13$*], [$43 - 39 = 4$], [*Nhận*],
          [$...$], [$...$], [$...$], [$...$],
          [$21$], [$32$], [$43 - 96 = -53$], [Loại (vì $z < 0$)]
        )
      ]
      Vậy nghiệm duy nhất là $x = 13, y = 4, z = 4$.
    ]
    #step[
      *4. Kết luận:*
      - Chỉ Thẻ tín dụng: $13$
      - Chỉ Bảo hiểm: $4$
      - Chỉ Khoản vay: $x - y - 2 = 7$
      - Vay + Bảo hiểm ($z$): $4$
      - Nhóm (Thẻ + khác): $x - 5 = 8$
      
      *Đối chiếu đáp án:*
      - *a) ĐÚNG.* Chỉ Thẻ tín dụng là $x = 13$.
      - *b) ĐÚNG.* Chỉ Khoản vay là $7$.
      - *c) SAI.* Khoản vay và Bảo hiểm là $z = 4$ (không phải 8).
      - *d) SAI.* Tổng chỉ dùng đúng 1 dịch vụ = (Chỉ Thẻ) + (Chỉ Vay) + (Chỉ BH) = $13 + 7 + 4 = 24$ (không phải 20).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Khảo sát 44 người chơi một tựa game nhập vai về việc chọn vai trò nhân vật (Chiến binh, Pháp sư, Xạ thủ). Mỗi người chơi chọn nhiều nhất 2 vai trò khác nhau. Kết quả cho thấy:
    
    - Số người chỉ chọn Chiến binh bằng tổng số người chỉ chọn Pháp sư và số người chỉ chọn Xạ thủ cộng thêm 2 người.
    - Trong số các người chơi *không* chọn Chiến binh, 2 lần số người có chọn Pháp sư bằng 7 lần số người có chọn Xạ thủ.
    - Số người chọn Chiến binh và một vai trò khác ít hơn số người chỉ chọn Chiến binh là 4 người.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 2 người chọn cả Pháp sư và Xạ thủ.]),
    True([Có 12 người chỉ chọn Pháp sư.]),
    False([Có 15 người chỉ chọn Chiến binh.]),
    False([Số người chỉ chọn Pháp sư ít hơn số người chỉ chọn Xạ thủ.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân rã và Đặt ẩn:*
      - Đặt $x$ là số người *chỉ chọn Chiến binh*.
      - Đặt $y$ là số người *chỉ chọn Xạ thủ*.
      - Theo Dữ kiện 1: (Chỉ CB) = (Chỉ PS) + (Chỉ XT) + 2 
        $=> x = text("Chỉ PS") + y + 2 => text("Chỉ PS") = x - y - 2$.
      - Theo Dữ kiện 3: (CB + 1 vai trò khác) = (Chỉ CB) - 4 = $x - 4$.
      - Đặt $z$ là số người chọn *Pháp sư và Xạ thủ*.
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện 2:*
      Nhóm *KHÔNG* chọn Chiến binh gồm 3 tập con rời nhau: (Chỉ PS), (Chỉ XT) và (PS + XT).
      - Tổng số người *CÓ* chọn Pháp sư là: (Chỉ PS) + (PS + XT) $= (x - y - 2) + z$.
      - Tổng số người *CÓ* chọn Xạ thủ là: (Chỉ XT) + (PS + XT) $= y + z$.
      
      Dữ kiện 2: "2 lần số người có chọn Pháp sư bằng 7 lần số người có chọn Xạ thủ":
      $ 2((x - y - 2) + z) = 7(y + z) <=> 2x - 2y - 4 + 2z = 7y + 7z <=> 2x - 9y - 5z = 4 quad (1) $
      
      Phương trình tổng số 44 người chơi:
      $ x + (x - y - 2) + y + (x - 4) + z = 44 <=> 3x - 6 + z = 44 <=> 3x + z = 50 quad (2) $
    ]
    #step[
      *3. Giải hệ:*
      Từ $(2)$ rút $z = 50 - 3x$. Thay vào $(1)$:
      $ 2x - 9y - 5(50 - 3x) = 4 <=> 2x - 9y - 250 + 15x = 4 <=> 17x - 9y = 254 <=> x = display(frac(9y + 254, 17)) $
      
      Lập bảng biện luận tìm nghiệm nguyên $x, y >= 0$:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(9y + 254, 17))$*], [*$z = 50 - 3x$*], [*Kết luận*],
          [$0$], [$display(frac(254, 17))$ (Loại)], [-], [Loại],
          [$1$], [$display(frac(263, 17))$ (Loại)], [-], [Loại],
          [$2$], [*$16$*], [$50 - 48 = 2$], [*Nhận*],
          [$...$], [$...$], [$...$], [$...$],
          [$19$], [$25$], [$50 - 75 = -25$], [Loại (vì $z < 0$)]
        )
      ]
      Vậy nghiệm duy nhất là $x = 16, y = 2, z = 2$.
    ]
    #step[
      *4. Kết luận:*
      - Chỉ Chiến binh: $16$
      - Chỉ Xạ thủ: $2$
      - Chỉ Pháp sư: $x - y - 2 = 12$
      - Pháp sư + Xạ thủ ($z$): $2$
      - Nhóm (Chiến binh + khác): $x - 4 = 12$
      
      *Đối chiếu đáp án:*
      - *a) ĐÚNG.* Pháp sư + Xạ thủ là $z = 2$.
      - *b) ĐÚNG.* Chỉ Pháp sư là $12$.
      - *c) SAI.* Chỉ Chiến binh là $x = 16$ (không phải 15).
      - *d) SAI.* Chỉ Pháp sư ($12$) nhiều hơn Chỉ Xạ thủ ($2$).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Một cửa hàng pizza khảo sát 52 đơn hàng về việc thêm 3 loại topping: Xúc xích, Phô mai, Nấm. Mỗi đơn hàng thêm nhiều nhất 2 loại topping khác nhau. Kết quả cho thấy:
    
    - Số đơn chỉ thêm Xúc xích bằng tổng số đơn chỉ thêm Phô mai và số đơn chỉ thêm Nấm cộng thêm 1 đơn.
    - Trong số các đơn *không* thêm Xúc xích, 2 lần số đơn có thêm Phô mai bằng 5 lần số đơn có thêm Nấm.
    - Số đơn thêm Xúc xích và một loại topping khác ít hơn số đơn chỉ thêm Xúc xích là 3 đơn.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 2 đơn hàng thêm cả Phô mai và Nấm.]),
    True([Có 13 đơn hàng chỉ thêm Phô mai.]),
    False([Có 20 đơn hàng chỉ thêm Xúc xích.]),
    False([Số đơn hàng chỉ thêm Nấm nhiều hơn số đơn hàng chỉ thêm Phô mai.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân rã và Đặt ẩn:*
      - Đặt $x$ là số đơn *chỉ thêm Xúc xích*.
      - Đặt $y$ là số đơn *chỉ thêm Nấm*.
      - Theo Dữ kiện 1: (Chỉ XX) = (Chỉ PM) + (Chỉ Nấm) + 1
        $=> x = text("Chỉ PM") + y + 1 => text("Chỉ PM") = x - y - 1$.
      - Theo Dữ kiện 3: (XX + 1 loại khác) = (Chỉ XX) - 3 = $x - 3$.
      - Đặt $z$ là số đơn thêm *Phô mai và Nấm*.
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện 2:*
      Nhóm *KHÔNG* thêm Xúc xích gồm 3 tập con rời nhau: (Chỉ PM), (Chỉ Nấm) và (PM + Nấm).
      - Tổng số đơn *CÓ* thêm Phô mai là: (Chỉ PM) + (PM + Nấm) $= (x - y - 1) + z$.
      - Tổng số đơn *CÓ* thêm Nấm là: (Chỉ Nấm) + (PM + Nấm) $= y + z$.
      
      Dữ kiện 2: "2 lần số đơn có thêm Phô mai bằng 5 lần số đơn có thêm Nấm":
      $ 2((x - y - 1) + z) = 5(y + z) <=> 2x - 2y - 2 + 2z = 5y + 5z <=> 2x - 7y - 3z = 2 quad (1) $
      
      Phương trình tổng số 52 đơn hàng:
      $ x + (x - y - 1) + y + (x - 3) + z = 52 <=> 3x - 4 + z = 52 <=> 3x + z = 56 quad (2) $
    ]
    #step[
      *3. Giải hệ:*
      Từ $(2)$ rút $z = 56 - 3x$. Thay vào $(1)$:
      $ 2x - 7y - 3(56 - 3x) = 2 <=> 2x - 7y - 168 + 9x = 2 <=> 11x - 7y = 170 <=> x = display(frac(7y + 170, 11)) $
      
      Lập bảng biện luận tìm nghiệm nguyên $x, y >= 0$:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(7y + 170, 11))$*], [*$z = 56 - 3x$*], [*Kết luận*],
          [$0, 1, 2, 3$], [Không nguyên (Loại)], [-], [Loại],
          [$4$], [*$18$*], [$56 - 54 = 2$], [*Nhận*],
          [$...$], [$...$], [$...$], [$...$],
          [$15$], [$25$], [$56 - 75 = -19$], [Loại (vì $z < 0$)]
        )
      ]
      Vậy nghiệm duy nhất là $x = 18, y = 4, z = 2$.
    ]
    #step[
      *4. Kết luận:*
      - Chỉ Xúc xích: $18$
      - Chỉ Nấm: $4$
      - Chỉ Phô mai: $x - y - 1 = 13$
      - Phô mai + Nấm ($z$): $2$
      - Nhóm (Xúc xích + khác): $x - 3 = 15$
      
      *Đối chiếu đáp án:*
      - *a) ĐÚNG.* Phô mai + Nấm là $z = 2$.
      - *b) ĐÚNG.* Chỉ Phô mai là $13$.
      - *c) SAI.* Chỉ Xúc xích là $x = 18$ (không phải 20).
      - *d) SAI.* Chỉ Nấm ($4$) ít hơn Chỉ Phô mai ($13$).
    ]
    #reset-step()
  ]
)

#ds(
  [
    Một khách sạn khảo sát 40 khách hàng về việc sử dụng 3 tiện ích: Spa, Buffet, Gym. Mỗi khách hàng dùng nhiều nhất 2 tiện ích khác nhau. Kết quả cho thấy:
    
    - Số khách chỉ dùng Spa bằng tổng số khách chỉ dùng Buffet và số khách chỉ dùng Gym cộng thêm 3 người.
    - Trong số các khách *không* dùng Spa, 4 lần số khách có dùng Buffet bằng 7 lần số khách có dùng Gym.
    - Số khách dùng Spa và một tiện ích khác ít hơn số khách chỉ dùng Spa là 2 người.
    
    Xét tính đúng sai của các khẳng định sau:
  ],
  (
    True([Có 8 khách hàng chỉ dùng Buffet.]),
    True([Có 6 khách hàng dùng cả Buffet và Gym.]),
    False([Có 11 khách hàng chỉ dùng Spa.]),
    False([Số khách hàng không dùng Spa là 18 người.]),
  ),
  loigiai: [
    #reset-step()
    #step[
      *1. Phân rã và Đặt ẩn:*
      - Đặt $x$ là số khách *chỉ dùng Spa*.
      - Đặt $y$ là số khách *chỉ dùng Gym*.
      - Theo Dữ kiện 1: (Chỉ Spa) = (Chỉ Buffet) + (Chỉ Gym) + 3
        $=> x = text("Chỉ Buffet") + y + 3 => text("Chỉ Buffet") = x - y - 3$.
      - Theo Dữ kiện 3: (Spa + 1 tiện ích khác) = (Chỉ Spa) - 2 = $x - 2$.
      - Đặt $z$ là số khách dùng *Buffet và Gym*.
    ]
    #step[
      *2. Xây dựng phương trình từ Dữ kiện 2:*
      Nhóm *KHÔNG* dùng Spa gồm 3 tập con rời nhau: (Chỉ Buffet), (Chỉ Gym) và (Buffet + Gym).
      - Tổng số khách *CÓ* dùng Buffet là: (Chỉ Buffet) + (Buffet + Gym) $= (x - y - 3) + z$.
      - Tổng số khách *CÓ* dùng Gym là: (Chỉ Gym) + (Buffet + Gym) $= y + z$.
      
      Dữ kiện 2: "4 lần số khách có dùng Buffet bằng 7 lần số khách có dùng Gym":
      $ 4((x - y - 3) + z) = 7(y + z) <=> 4x - 4y - 12 + 4z = 7y + 7z <=> 4x - 11y - 3z = 12 quad (1) $
      
      Phương trình tổng số 40 khách hàng:
      $ x + (x - y - 3) + y + (x - 2) + z = 40 <=> 3x - 5 + z = 40 <=> 3x + z = 45 quad (2) $
    ]
    #step[
      *3. Giải hệ:*
      Từ $(2)$ rút $z = 45 - 3x$. Thay vào $(1)$:
      $ 4x - 11y - 3(45 - 3x) = 12 <=> 4x - 11y - 135 + 9x = 12 <=> 13x - 11y = 147 <=> x = display(frac(11y + 147, 13)) $
      
      Lập bảng biện luận tìm nghiệm nguyên $x, y >= 0$:
      #align(center)[
        #table(
          inset: 9pt,
          columns: (auto, auto, auto, auto),
          align: center,
          fill: (col, row) => if row == 0 { luma(230) } else { none },
          [*$y$*], [*$x = display(frac(11y + 147, 13))$*], [*$z = 45 - 3x$*], [*Kết luận*],
          [$0, 1$], [Không nguyên (Loại)], [-], [Loại],
          [$2$], [*$13$*], [$45 - 39 = 6$], [*Nhận*],
          [$...$], [$...$], [$...$], [$...$],
          [$15$], [$24$], [$45 - 72 = -27$], [Loại (vì $z < 0$)]
        )
      ]
      Vậy nghiệm duy nhất là $x = 13, y = 2, z = 6$.
    ]
    #step[
      *4. Kết luận:*
      - Chỉ Spa: $13$
      - Chỉ Gym: $2$
      - Chỉ Buffet: $x - y - 3 = 8$
      - Buffet + Gym ($z$): $6$
      - Nhóm (Spa + khác): $x - 2 = 11$
      
      *Đối chiếu đáp án:*
      - *a) ĐÚNG.* Chỉ Buffet là $8$.
      - *b) ĐÚNG.* Buffet + Gym là $z = 6$.
      - *c) SAI.* Chỉ Spa là $x = 13$ (không phải 11).
      - *d) SAI.* Nhóm không dùng Spa = (Chỉ Buffet) + (Chỉ Gym) + (Buffet + Gym) = $8 + 2 + 6 = 16$ (không phải 18).
    ]
    #reset-step()
  ]
)
